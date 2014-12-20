---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.519223, 0.09459122, -1.772576, 1, 0, 0, 1,
-3.259954, -1.46427, -0.05808237, 1, 0.007843138, 0, 1,
-3.234821, -1.163443, -0.5520624, 1, 0.01176471, 0, 1,
-3.034822, 0.942367, -2.454602, 1, 0.01960784, 0, 1,
-2.997698, 0.3479729, -1.855043, 1, 0.02352941, 0, 1,
-2.751766, -1.83804, -3.335371, 1, 0.03137255, 0, 1,
-2.597453, 0.5408322, -0.2394923, 1, 0.03529412, 0, 1,
-2.57871, 1.24318, -2.119808, 1, 0.04313726, 0, 1,
-2.570504, 1.298931, 0.4781344, 1, 0.04705882, 0, 1,
-2.544652, -2.326627, -0.8187683, 1, 0.05490196, 0, 1,
-2.50678, 0.9811003, -2.523176, 1, 0.05882353, 0, 1,
-2.504648, 0.4974432, -1.095816, 1, 0.06666667, 0, 1,
-2.485938, 0.8551025, -2.179146, 1, 0.07058824, 0, 1,
-2.444875, 0.5537291, -2.016261, 1, 0.07843138, 0, 1,
-2.426741, -1.223267, -1.106662, 1, 0.08235294, 0, 1,
-2.401595, 2.413624, -1.685263, 1, 0.09019608, 0, 1,
-2.31546, -0.2136537, -2.162611, 1, 0.09411765, 0, 1,
-2.286324, -1.677697, -0.9943406, 1, 0.1019608, 0, 1,
-2.255718, -0.7177405, -1.005666, 1, 0.1098039, 0, 1,
-2.239844, -0.1031545, -0.02984281, 1, 0.1137255, 0, 1,
-2.186418, -0.4186143, -1.33753, 1, 0.1215686, 0, 1,
-2.184637, 0.06138374, -1.064421, 1, 0.1254902, 0, 1,
-2.1831, 0.2165689, -2.196098, 1, 0.1333333, 0, 1,
-2.159412, 1.096368, -0.310437, 1, 0.1372549, 0, 1,
-2.158699, -1.170296, -2.3538, 1, 0.145098, 0, 1,
-2.141263, -0.7325302, 1.40733, 1, 0.1490196, 0, 1,
-2.138955, -1.088206, 0.7295866, 1, 0.1568628, 0, 1,
-2.110766, -0.2640487, -1.41108, 1, 0.1607843, 0, 1,
-2.108239, -1.303607, -3.260742, 1, 0.1686275, 0, 1,
-2.090264, -0.6121225, -2.610382, 1, 0.172549, 0, 1,
-2.046527, 0.3942393, -0.4612662, 1, 0.1803922, 0, 1,
-2.034461, -0.5676288, -3.01649, 1, 0.1843137, 0, 1,
-2.029174, -0.5450855, -1.122727, 1, 0.1921569, 0, 1,
-2.022013, 0.926522, -2.601006, 1, 0.1960784, 0, 1,
-2.000823, 2.143718, -0.2150525, 1, 0.2039216, 0, 1,
-1.991785, 1.182423, -0.1439757, 1, 0.2117647, 0, 1,
-1.980687, -0.2103867, -1.694865, 1, 0.2156863, 0, 1,
-1.980504, 0.8729571, -1.571797, 1, 0.2235294, 0, 1,
-1.972689, -2.233869, -2.271482, 1, 0.227451, 0, 1,
-1.94578, 0.2122988, -0.525152, 1, 0.2352941, 0, 1,
-1.945069, 0.8565142, -1.179426, 1, 0.2392157, 0, 1,
-1.916569, 0.3945323, -3.39213, 1, 0.2470588, 0, 1,
-1.898387, -0.7937173, -1.177948, 1, 0.2509804, 0, 1,
-1.885722, -0.8767757, -1.74237, 1, 0.2588235, 0, 1,
-1.885617, -0.829819, -3.475946, 1, 0.2627451, 0, 1,
-1.879183, 2.227392, -0.919384, 1, 0.2705882, 0, 1,
-1.87524, -0.5111715, -0.2111736, 1, 0.2745098, 0, 1,
-1.838314, -1.653892, -2.04486, 1, 0.282353, 0, 1,
-1.837728, -0.5980362, -3.140294, 1, 0.2862745, 0, 1,
-1.83584, -0.280539, -1.824069, 1, 0.2941177, 0, 1,
-1.812265, 1.966967, 1.177288, 1, 0.3019608, 0, 1,
-1.803316, 1.561283, -0.6100737, 1, 0.3058824, 0, 1,
-1.799797, 0.7781049, -1.836981, 1, 0.3137255, 0, 1,
-1.786993, -0.1188639, -0.7507595, 1, 0.3176471, 0, 1,
-1.773963, -0.1464585, -1.413106, 1, 0.3254902, 0, 1,
-1.749911, 0.6048596, -0.2521114, 1, 0.3294118, 0, 1,
-1.743463, 0.1285092, -0.180339, 1, 0.3372549, 0, 1,
-1.741228, -1.324524, -2.741248, 1, 0.3411765, 0, 1,
-1.734351, -0.828414, -0.8908141, 1, 0.3490196, 0, 1,
-1.721081, -0.06961943, -1.259959, 1, 0.3529412, 0, 1,
-1.720879, -0.5745699, -1.625484, 1, 0.3607843, 0, 1,
-1.712183, 0.486224, -1.029526, 1, 0.3647059, 0, 1,
-1.709018, -1.201698, -2.692834, 1, 0.372549, 0, 1,
-1.706816, -0.1061389, -2.79053, 1, 0.3764706, 0, 1,
-1.706679, -0.1344944, -1.759423, 1, 0.3843137, 0, 1,
-1.702719, -0.02230403, -1.549286, 1, 0.3882353, 0, 1,
-1.697032, 0.3888747, -2.169709, 1, 0.3960784, 0, 1,
-1.690732, -0.7021974, -2.848867, 1, 0.4039216, 0, 1,
-1.678658, -0.666127, -0.3015655, 1, 0.4078431, 0, 1,
-1.678548, -0.1234572, 0.8472481, 1, 0.4156863, 0, 1,
-1.665872, 0.9946499, -0.5743482, 1, 0.4196078, 0, 1,
-1.665132, 0.7063613, -1.237054, 1, 0.427451, 0, 1,
-1.654204, 0.003377137, -1.837028, 1, 0.4313726, 0, 1,
-1.646989, -0.494434, -2.187549, 1, 0.4392157, 0, 1,
-1.62851, 0.8005994, -3.111285, 1, 0.4431373, 0, 1,
-1.625244, 0.3496195, -1.140134, 1, 0.4509804, 0, 1,
-1.619809, -0.4834639, -1.181061, 1, 0.454902, 0, 1,
-1.617472, 1.595998, -0.7266148, 1, 0.4627451, 0, 1,
-1.615023, 0.3298997, -1.973456, 1, 0.4666667, 0, 1,
-1.608638, 0.10413, -2.418193, 1, 0.4745098, 0, 1,
-1.592027, 0.02822296, -1.217765, 1, 0.4784314, 0, 1,
-1.581129, 0.5259724, -1.402271, 1, 0.4862745, 0, 1,
-1.562828, 0.9443409, -1.099721, 1, 0.4901961, 0, 1,
-1.553643, 0.8920211, 1.014807, 1, 0.4980392, 0, 1,
-1.550383, -0.2593616, -2.65397, 1, 0.5058824, 0, 1,
-1.5446, -0.4452748, -2.616523, 1, 0.509804, 0, 1,
-1.530036, -0.6564206, -1.866472, 1, 0.5176471, 0, 1,
-1.515457, -1.030909, -1.739857, 1, 0.5215687, 0, 1,
-1.495351, 0.2924694, -2.516487, 1, 0.5294118, 0, 1,
-1.494116, 1.302316, -0.987496, 1, 0.5333334, 0, 1,
-1.48119, 1.467352, -1.802027, 1, 0.5411765, 0, 1,
-1.473498, 0.05803309, -0.02967676, 1, 0.5450981, 0, 1,
-1.47298, 1.284234, 0.5790705, 1, 0.5529412, 0, 1,
-1.465918, -0.8475145, -3.449758, 1, 0.5568628, 0, 1,
-1.459481, -1.891229, -2.761717, 1, 0.5647059, 0, 1,
-1.457821, -1.038426, -3.390633, 1, 0.5686275, 0, 1,
-1.452811, -1.102639, -3.68916, 1, 0.5764706, 0, 1,
-1.443338, 0.7997084, -1.140339, 1, 0.5803922, 0, 1,
-1.43755, 0.01314309, -1.193651, 1, 0.5882353, 0, 1,
-1.435852, -0.2993838, -1.909076, 1, 0.5921569, 0, 1,
-1.427538, 1.070959, -1.367808, 1, 0.6, 0, 1,
-1.421137, -1.291941, -0.167722, 1, 0.6078432, 0, 1,
-1.419691, 0.8780367, -0.559646, 1, 0.6117647, 0, 1,
-1.406795, 0.3565749, -2.214514, 1, 0.6196079, 0, 1,
-1.400536, -1.001039, -4.410358, 1, 0.6235294, 0, 1,
-1.397771, 0.3154122, -2.26174, 1, 0.6313726, 0, 1,
-1.390979, 0.1624424, -1.285778, 1, 0.6352941, 0, 1,
-1.390539, -0.4588727, -1.004223, 1, 0.6431373, 0, 1,
-1.383909, -0.5744464, -2.062037, 1, 0.6470588, 0, 1,
-1.369611, 0.4254889, -1.501645, 1, 0.654902, 0, 1,
-1.363953, -0.6641774, -2.163349, 1, 0.6588235, 0, 1,
-1.355698, -0.7527046, -2.864389, 1, 0.6666667, 0, 1,
-1.341119, -0.3583275, -1.445746, 1, 0.6705883, 0, 1,
-1.33463, -1.693225, -3.681799, 1, 0.6784314, 0, 1,
-1.326657, 1.268376, -0.3900242, 1, 0.682353, 0, 1,
-1.318688, -0.796698, -1.926809, 1, 0.6901961, 0, 1,
-1.310269, 0.1061561, -1.078921, 1, 0.6941177, 0, 1,
-1.306955, -0.7953334, -1.649139, 1, 0.7019608, 0, 1,
-1.303828, 1.583097, -0.2642997, 1, 0.7098039, 0, 1,
-1.303044, -1.539571, -3.115849, 1, 0.7137255, 0, 1,
-1.297483, -1.588066, -1.332566, 1, 0.7215686, 0, 1,
-1.288964, 0.5108061, -0.08219641, 1, 0.7254902, 0, 1,
-1.286268, -0.04512231, -1.482086, 1, 0.7333333, 0, 1,
-1.265989, -0.3896009, -2.81753, 1, 0.7372549, 0, 1,
-1.264928, -0.1240629, -2.273525, 1, 0.7450981, 0, 1,
-1.260497, -0.7886084, -2.565064, 1, 0.7490196, 0, 1,
-1.256732, 1.565492, -0.5634171, 1, 0.7568628, 0, 1,
-1.255757, -0.1362882, -0.5810144, 1, 0.7607843, 0, 1,
-1.249869, 0.6064009, -1.919326, 1, 0.7686275, 0, 1,
-1.240973, -0.06184437, -1.003186, 1, 0.772549, 0, 1,
-1.239815, 0.1260239, -2.082473, 1, 0.7803922, 0, 1,
-1.224174, 0.26388, -1.604634, 1, 0.7843137, 0, 1,
-1.222921, 0.304731, -2.487315, 1, 0.7921569, 0, 1,
-1.2173, -0.6891577, -3.260974, 1, 0.7960784, 0, 1,
-1.211388, -0.3689375, -0.3661633, 1, 0.8039216, 0, 1,
-1.206705, 0.8409301, -0.8541933, 1, 0.8117647, 0, 1,
-1.206398, 0.06993797, -0.8707177, 1, 0.8156863, 0, 1,
-1.206045, 1.340747, -3.715927, 1, 0.8235294, 0, 1,
-1.205585, -0.527553, -2.68729, 1, 0.827451, 0, 1,
-1.200783, 0.09927561, -1.212374, 1, 0.8352941, 0, 1,
-1.196786, 0.891355, -1.149652, 1, 0.8392157, 0, 1,
-1.185939, 0.8596875, -1.50412, 1, 0.8470588, 0, 1,
-1.169475, 1.860917, 0.1441099, 1, 0.8509804, 0, 1,
-1.167991, -0.8665761, -0.2899489, 1, 0.8588235, 0, 1,
-1.164191, 1.215078, -1.111721, 1, 0.8627451, 0, 1,
-1.159408, 0.6318887, -0.188023, 1, 0.8705882, 0, 1,
-1.158996, -0.6612547, -1.065505, 1, 0.8745098, 0, 1,
-1.155118, 0.5973693, 0.2722139, 1, 0.8823529, 0, 1,
-1.145665, 0.8639094, -1.373258, 1, 0.8862745, 0, 1,
-1.144611, 0.1503991, -0.09516376, 1, 0.8941177, 0, 1,
-1.128508, -0.6364435, -1.394871, 1, 0.8980392, 0, 1,
-1.12085, -1.209674, -2.531843, 1, 0.9058824, 0, 1,
-1.117042, -0.7529761, -1.688196, 1, 0.9137255, 0, 1,
-1.099684, -0.4569745, -1.525555, 1, 0.9176471, 0, 1,
-1.093472, -0.1240333, -2.700049, 1, 0.9254902, 0, 1,
-1.092445, -0.8210207, -2.189593, 1, 0.9294118, 0, 1,
-1.082086, -0.9710162, -2.656276, 1, 0.9372549, 0, 1,
-1.070747, 0.7822125, -0.8646094, 1, 0.9411765, 0, 1,
-1.067535, 0.9564623, -1.987745, 1, 0.9490196, 0, 1,
-1.063112, 0.6891429, 0.2155601, 1, 0.9529412, 0, 1,
-1.053446, 0.2916231, 0.8279899, 1, 0.9607843, 0, 1,
-1.051232, -0.533009, -2.964188, 1, 0.9647059, 0, 1,
-1.036443, -0.4173349, -2.561105, 1, 0.972549, 0, 1,
-1.036205, 1.73698, -0.3582024, 1, 0.9764706, 0, 1,
-1.035573, -0.5267861, -0.476643, 1, 0.9843137, 0, 1,
-1.032762, -0.1671714, -0.7891713, 1, 0.9882353, 0, 1,
-1.031241, 1.105772, -2.052157, 1, 0.9960784, 0, 1,
-1.029378, -0.956153, -1.862578, 0.9960784, 1, 0, 1,
-1.027593, -2.149173, -3.531567, 0.9921569, 1, 0, 1,
-1.014936, 0.4095939, 0.4099011, 0.9843137, 1, 0, 1,
-1.013109, -0.1435146, 0.1686879, 0.9803922, 1, 0, 1,
-1.010333, 2.105302, -0.9810325, 0.972549, 1, 0, 1,
-1.006772, 1.170123, -0.2110345, 0.9686275, 1, 0, 1,
-0.9915106, -0.668483, -1.126182, 0.9607843, 1, 0, 1,
-0.9888769, -1.312114, -2.624628, 0.9568627, 1, 0, 1,
-0.988806, 1.005916, -2.283452, 0.9490196, 1, 0, 1,
-0.9824129, 0.4833476, -0.9925013, 0.945098, 1, 0, 1,
-0.9769061, 0.4656751, -1.538783, 0.9372549, 1, 0, 1,
-0.9761215, -0.5161473, -2.05464, 0.9333333, 1, 0, 1,
-0.9706485, 0.3336606, -1.116117, 0.9254902, 1, 0, 1,
-0.9699444, 1.647854, -1.093248, 0.9215686, 1, 0, 1,
-0.969827, 0.05223599, 0.1444695, 0.9137255, 1, 0, 1,
-0.9698038, 0.7556883, -1.948389, 0.9098039, 1, 0, 1,
-0.9668363, -1.04223, -2.594241, 0.9019608, 1, 0, 1,
-0.9655311, -1.487522, -3.691535, 0.8941177, 1, 0, 1,
-0.9649574, -1.54724, -3.221209, 0.8901961, 1, 0, 1,
-0.9600657, 1.563287, -0.2565189, 0.8823529, 1, 0, 1,
-0.9582812, -0.07594779, -1.780323, 0.8784314, 1, 0, 1,
-0.954204, 0.2367919, -1.423447, 0.8705882, 1, 0, 1,
-0.9514202, -0.01646035, 0.3069666, 0.8666667, 1, 0, 1,
-0.9471021, -1.735481, -2.173665, 0.8588235, 1, 0, 1,
-0.9416388, 0.7524515, 0.8551879, 0.854902, 1, 0, 1,
-0.9368368, 1.79442, -0.3800012, 0.8470588, 1, 0, 1,
-0.9367552, -0.8006578, -1.431707, 0.8431373, 1, 0, 1,
-0.9365842, 1.36366, -0.4552896, 0.8352941, 1, 0, 1,
-0.934111, -0.2340183, -2.72861, 0.8313726, 1, 0, 1,
-0.9325125, -0.5816633, -1.542894, 0.8235294, 1, 0, 1,
-0.9283136, -0.5267108, -2.566403, 0.8196079, 1, 0, 1,
-0.9258621, 0.7755023, -0.35182, 0.8117647, 1, 0, 1,
-0.9235613, -1.356622, -2.462738, 0.8078431, 1, 0, 1,
-0.9172705, -0.06728543, -0.3867657, 0.8, 1, 0, 1,
-0.9155948, 1.162698, 0.4953229, 0.7921569, 1, 0, 1,
-0.9117482, 0.5340991, -2.448738, 0.7882353, 1, 0, 1,
-0.9103944, -0.08876255, -3.912213, 0.7803922, 1, 0, 1,
-0.9013014, 0.4904406, 1.447892, 0.7764706, 1, 0, 1,
-0.8970901, -1.390581, -3.117258, 0.7686275, 1, 0, 1,
-0.8948036, -0.451328, -2.364207, 0.7647059, 1, 0, 1,
-0.8908724, 1.08734, -0.9955487, 0.7568628, 1, 0, 1,
-0.8904648, 0.5911503, -0.3707167, 0.7529412, 1, 0, 1,
-0.8859739, -0.5297187, -1.717611, 0.7450981, 1, 0, 1,
-0.8817202, -0.6773438, 0.511319, 0.7411765, 1, 0, 1,
-0.8800628, -0.5989351, -2.217023, 0.7333333, 1, 0, 1,
-0.8752278, -0.1491495, -1.065574, 0.7294118, 1, 0, 1,
-0.8660425, -0.5545329, -1.828298, 0.7215686, 1, 0, 1,
-0.8635874, -0.7437854, -3.082695, 0.7176471, 1, 0, 1,
-0.8608006, 0.7588593, -1.373971, 0.7098039, 1, 0, 1,
-0.8562796, 0.2332566, -2.56724, 0.7058824, 1, 0, 1,
-0.8558677, 0.4810004, -1.291278, 0.6980392, 1, 0, 1,
-0.8500851, 0.4412192, -0.08476668, 0.6901961, 1, 0, 1,
-0.8407894, 0.3006855, -0.2263686, 0.6862745, 1, 0, 1,
-0.8399059, 1.148547, -0.993816, 0.6784314, 1, 0, 1,
-0.8380318, -1.005211, -3.317155, 0.6745098, 1, 0, 1,
-0.836822, -0.6702031, -2.287524, 0.6666667, 1, 0, 1,
-0.830171, -0.50392, -1.361592, 0.6627451, 1, 0, 1,
-0.829017, -0.8312734, -2.270945, 0.654902, 1, 0, 1,
-0.8263103, -0.1128216, -4.006483, 0.6509804, 1, 0, 1,
-0.8217596, 0.9556399, -0.5271496, 0.6431373, 1, 0, 1,
-0.8156768, -0.9374339, -2.806885, 0.6392157, 1, 0, 1,
-0.8144497, -0.8391787, -3.639423, 0.6313726, 1, 0, 1,
-0.8086384, 1.481318, -0.9841788, 0.627451, 1, 0, 1,
-0.8071254, 0.6578434, 0.3964656, 0.6196079, 1, 0, 1,
-0.8055393, 0.236821, -0.1363975, 0.6156863, 1, 0, 1,
-0.8025749, -0.7687954, -2.875962, 0.6078432, 1, 0, 1,
-0.7960995, 0.003866896, -1.654975, 0.6039216, 1, 0, 1,
-0.7957301, 1.332385, -1.012529, 0.5960785, 1, 0, 1,
-0.7867777, -0.04614289, -0.7714855, 0.5882353, 1, 0, 1,
-0.7825732, -0.5387942, -2.795926, 0.5843138, 1, 0, 1,
-0.775778, 2.002273, 1.596021, 0.5764706, 1, 0, 1,
-0.7746204, 0.1003153, -1.56748, 0.572549, 1, 0, 1,
-0.77324, -0.1774354, -3.785903, 0.5647059, 1, 0, 1,
-0.7712228, 0.379232, -1.36233, 0.5607843, 1, 0, 1,
-0.7710357, -1.037351, -2.133319, 0.5529412, 1, 0, 1,
-0.7696561, -0.08398213, -1.655584, 0.5490196, 1, 0, 1,
-0.7687807, 1.843861, -1.026179, 0.5411765, 1, 0, 1,
-0.7603938, 1.655382, 0.05548236, 0.5372549, 1, 0, 1,
-0.7587727, 0.02276074, -0.2199724, 0.5294118, 1, 0, 1,
-0.7560312, 1.055005, -0.09619369, 0.5254902, 1, 0, 1,
-0.7559008, -0.2071191, -0.7906317, 0.5176471, 1, 0, 1,
-0.752563, 0.2988515, -2.452376, 0.5137255, 1, 0, 1,
-0.7497031, 0.932223, -1.095841, 0.5058824, 1, 0, 1,
-0.7448392, -0.6113886, -1.619809, 0.5019608, 1, 0, 1,
-0.7404836, -0.6226606, -1.956327, 0.4941176, 1, 0, 1,
-0.7352624, -0.3278189, -2.248996, 0.4862745, 1, 0, 1,
-0.7348427, -1.111136, -2.310506, 0.4823529, 1, 0, 1,
-0.732814, 0.3723287, -3.508388, 0.4745098, 1, 0, 1,
-0.7271518, -0.0371483, -2.23013, 0.4705882, 1, 0, 1,
-0.7241303, -1.687801, -1.702205, 0.4627451, 1, 0, 1,
-0.7218162, 0.6608269, -3.036202, 0.4588235, 1, 0, 1,
-0.7146014, 1.266671, 0.2687339, 0.4509804, 1, 0, 1,
-0.7114461, -0.1738786, -1.395067, 0.4470588, 1, 0, 1,
-0.7103883, -0.1012078, -2.06212, 0.4392157, 1, 0, 1,
-0.7101849, 0.8603973, -0.3705766, 0.4352941, 1, 0, 1,
-0.7072342, 1.476643, -0.8119763, 0.427451, 1, 0, 1,
-0.7062792, 0.7864808, -0.4736834, 0.4235294, 1, 0, 1,
-0.706069, 0.1660152, -1.587502, 0.4156863, 1, 0, 1,
-0.7044497, 0.1290746, -0.7214671, 0.4117647, 1, 0, 1,
-0.6974143, -1.291595, -3.901165, 0.4039216, 1, 0, 1,
-0.6922347, -0.7402053, -2.275762, 0.3960784, 1, 0, 1,
-0.6903347, 0.1850231, -1.12464, 0.3921569, 1, 0, 1,
-0.6862617, -1.058112, -2.949784, 0.3843137, 1, 0, 1,
-0.6860941, 0.4650102, 0.8240454, 0.3803922, 1, 0, 1,
-0.6855159, 0.3097438, -1.542124, 0.372549, 1, 0, 1,
-0.6813287, 0.95926, -1.202183, 0.3686275, 1, 0, 1,
-0.6743007, -0.446669, -2.841418, 0.3607843, 1, 0, 1,
-0.6716583, 0.1335846, -1.649167, 0.3568628, 1, 0, 1,
-0.6575825, -0.5122921, -2.745502, 0.3490196, 1, 0, 1,
-0.6501161, 1.024446, 0.4980197, 0.345098, 1, 0, 1,
-0.6475185, 1.635687, 0.4261708, 0.3372549, 1, 0, 1,
-0.6466255, -0.1397805, -2.204898, 0.3333333, 1, 0, 1,
-0.6404862, 0.2261279, -2.024292, 0.3254902, 1, 0, 1,
-0.6348578, 1.037271, -1.439121, 0.3215686, 1, 0, 1,
-0.634183, 2.09996, -1.23582, 0.3137255, 1, 0, 1,
-0.6322733, 0.1294684, -0.2685364, 0.3098039, 1, 0, 1,
-0.6318943, 1.986325, 0.009570972, 0.3019608, 1, 0, 1,
-0.6271582, -0.2011653, 0.3099627, 0.2941177, 1, 0, 1,
-0.6234973, -1.207965, -3.591589, 0.2901961, 1, 0, 1,
-0.6227493, 0.8875117, -1.02295, 0.282353, 1, 0, 1,
-0.6191298, -1.813683, -3.56988, 0.2784314, 1, 0, 1,
-0.6166387, -0.3246889, -2.115239, 0.2705882, 1, 0, 1,
-0.6159915, -0.5016449, -3.51455, 0.2666667, 1, 0, 1,
-0.6134282, -1.813733, -4.068896, 0.2588235, 1, 0, 1,
-0.6110076, 0.2091437, -2.778836, 0.254902, 1, 0, 1,
-0.6103333, 0.4627819, -0.04481, 0.2470588, 1, 0, 1,
-0.6089479, -1.385155, -3.029345, 0.2431373, 1, 0, 1,
-0.5972115, -1.124844, -2.319931, 0.2352941, 1, 0, 1,
-0.5934806, -0.9517809, -0.3616054, 0.2313726, 1, 0, 1,
-0.5932471, 0.4150604, 0.3068565, 0.2235294, 1, 0, 1,
-0.5915384, -0.7503905, -3.379366, 0.2196078, 1, 0, 1,
-0.591183, 0.005591764, 0.03213207, 0.2117647, 1, 0, 1,
-0.5852911, 0.4712453, -2.542337, 0.2078431, 1, 0, 1,
-0.5830374, -0.4782624, -4.126115, 0.2, 1, 0, 1,
-0.5786056, -1.32136, -1.016427, 0.1921569, 1, 0, 1,
-0.5763739, 1.572096, 0.555194, 0.1882353, 1, 0, 1,
-0.5759098, 1.95681, 0.7867458, 0.1803922, 1, 0, 1,
-0.5755233, -0.4999866, -4.099712, 0.1764706, 1, 0, 1,
-0.5718561, 1.091548, -2.400723, 0.1686275, 1, 0, 1,
-0.570034, -1.161801, -1.352094, 0.1647059, 1, 0, 1,
-0.5665382, -0.9986023, -1.259776, 0.1568628, 1, 0, 1,
-0.5643581, -1.668149, -2.578302, 0.1529412, 1, 0, 1,
-0.5627991, -1.146966, -2.370121, 0.145098, 1, 0, 1,
-0.5626742, 1.300229, -1.256739, 0.1411765, 1, 0, 1,
-0.5613354, -0.7502254, -2.153332, 0.1333333, 1, 0, 1,
-0.5559463, -0.2989863, -1.066136, 0.1294118, 1, 0, 1,
-0.5542544, 1.566086, 0.0880966, 0.1215686, 1, 0, 1,
-0.5518137, 0.976478, 0.07979512, 0.1176471, 1, 0, 1,
-0.5502933, 0.5936068, -0.9258242, 0.1098039, 1, 0, 1,
-0.5497857, -0.6982825, -1.597524, 0.1058824, 1, 0, 1,
-0.5409882, -0.2964161, -2.908703, 0.09803922, 1, 0, 1,
-0.538848, 1.48282, -1.27795, 0.09019608, 1, 0, 1,
-0.538507, -0.5405065, -2.122449, 0.08627451, 1, 0, 1,
-0.537542, -0.2465225, -1.903677, 0.07843138, 1, 0, 1,
-0.5368767, 1.691237, -1.030901, 0.07450981, 1, 0, 1,
-0.5355403, 0.1912775, -1.070443, 0.06666667, 1, 0, 1,
-0.5341674, -1.313477, -2.904982, 0.0627451, 1, 0, 1,
-0.5303239, 1.552914, -0.3131396, 0.05490196, 1, 0, 1,
-0.5301019, -0.5362325, -2.908179, 0.05098039, 1, 0, 1,
-0.5296035, -0.4056584, -3.920435, 0.04313726, 1, 0, 1,
-0.5295405, 1.034599, -0.289232, 0.03921569, 1, 0, 1,
-0.5282517, -0.6435426, -2.642089, 0.03137255, 1, 0, 1,
-0.5264682, -1.089536, -2.937973, 0.02745098, 1, 0, 1,
-0.5239295, -0.08447683, -2.509999, 0.01960784, 1, 0, 1,
-0.5158308, -1.641441, -2.964195, 0.01568628, 1, 0, 1,
-0.5100256, -0.2258489, -0.4595808, 0.007843138, 1, 0, 1,
-0.5098099, 1.241248, -1.004536, 0.003921569, 1, 0, 1,
-0.5081281, 0.3823448, -2.933943, 0, 1, 0.003921569, 1,
-0.5035898, -0.7919871, -1.558138, 0, 1, 0.01176471, 1,
-0.5026275, 0.4689104, -0.4120458, 0, 1, 0.01568628, 1,
-0.5005682, 0.7644538, 0.1933227, 0, 1, 0.02352941, 1,
-0.4959739, 0.9895093, -0.1628808, 0, 1, 0.02745098, 1,
-0.4898583, -0.6428368, -3.473377, 0, 1, 0.03529412, 1,
-0.4783229, -0.4908569, -1.084049, 0, 1, 0.03921569, 1,
-0.4775411, 1.334442, -1.057425, 0, 1, 0.04705882, 1,
-0.474403, 0.7078301, -2.453915, 0, 1, 0.05098039, 1,
-0.4660726, 0.6207728, -1.187148, 0, 1, 0.05882353, 1,
-0.4580953, 0.03222113, -2.137231, 0, 1, 0.0627451, 1,
-0.4580538, -1.370155, -3.703755, 0, 1, 0.07058824, 1,
-0.4579982, -1.022764, -3.003756, 0, 1, 0.07450981, 1,
-0.4557182, 0.2947112, -2.300551, 0, 1, 0.08235294, 1,
-0.4471885, 0.3190426, 0.007852113, 0, 1, 0.08627451, 1,
-0.4317249, 0.56653, -0.2023453, 0, 1, 0.09411765, 1,
-0.4308679, 0.7319751, -0.8344783, 0, 1, 0.1019608, 1,
-0.4259265, 1.333269, 0.6955274, 0, 1, 0.1058824, 1,
-0.423287, 0.9657903, -0.7451152, 0, 1, 0.1137255, 1,
-0.4211818, 1.403088, -1.525612, 0, 1, 0.1176471, 1,
-0.4191243, 1.524382, 0.3207181, 0, 1, 0.1254902, 1,
-0.4163453, 1.846005, -1.722511, 0, 1, 0.1294118, 1,
-0.4157294, 0.8964338, -0.9581864, 0, 1, 0.1372549, 1,
-0.4080859, 0.1595038, -1.577599, 0, 1, 0.1411765, 1,
-0.4060242, -0.9614925, -3.53477, 0, 1, 0.1490196, 1,
-0.4015968, -0.321546, -0.213415, 0, 1, 0.1529412, 1,
-0.3925664, 1.356031, 0.5185819, 0, 1, 0.1607843, 1,
-0.3886966, -0.8776442, -2.902823, 0, 1, 0.1647059, 1,
-0.3855576, 1.244219, 0.1262748, 0, 1, 0.172549, 1,
-0.3840442, -0.8298963, -1.92168, 0, 1, 0.1764706, 1,
-0.3805508, -1.733466, -5.251045, 0, 1, 0.1843137, 1,
-0.3779053, -1.505633, -1.796345, 0, 1, 0.1882353, 1,
-0.374533, 0.9502386, -0.2097795, 0, 1, 0.1960784, 1,
-0.3696594, 0.1044847, -3.114166, 0, 1, 0.2039216, 1,
-0.3624304, 0.09790885, 0.5915229, 0, 1, 0.2078431, 1,
-0.3603796, 1.118268, 0.2496606, 0, 1, 0.2156863, 1,
-0.3589393, -0.636853, -3.843584, 0, 1, 0.2196078, 1,
-0.3580807, -1.16603, -2.076449, 0, 1, 0.227451, 1,
-0.3580615, -0.3270813, -2.761257, 0, 1, 0.2313726, 1,
-0.3544511, -1.166141, -4.512125, 0, 1, 0.2392157, 1,
-0.3528399, -2.095821, -3.391503, 0, 1, 0.2431373, 1,
-0.350244, 0.1575161, -0.4705964, 0, 1, 0.2509804, 1,
-0.3492095, -1.895219, -3.856276, 0, 1, 0.254902, 1,
-0.3488301, -0.2977954, -3.906078, 0, 1, 0.2627451, 1,
-0.3443087, 0.7349625, -1.413396, 0, 1, 0.2666667, 1,
-0.3426161, -1.113692, -3.629839, 0, 1, 0.2745098, 1,
-0.3424751, 0.8503078, -0.9705361, 0, 1, 0.2784314, 1,
-0.3400631, -0.493092, -2.326904, 0, 1, 0.2862745, 1,
-0.339982, 0.1653087, -0.7167162, 0, 1, 0.2901961, 1,
-0.3394002, -2.996944, -3.145092, 0, 1, 0.2980392, 1,
-0.3365698, -0.4282811, -3.31129, 0, 1, 0.3058824, 1,
-0.3278382, -0.2463469, -1.058767, 0, 1, 0.3098039, 1,
-0.3271787, -0.4560045, -1.583546, 0, 1, 0.3176471, 1,
-0.3253631, 0.08757649, -0.1577697, 0, 1, 0.3215686, 1,
-0.3185615, 0.7462214, -0.1866705, 0, 1, 0.3294118, 1,
-0.3150284, -1.75212, -2.47545, 0, 1, 0.3333333, 1,
-0.3129267, 0.4548329, -0.6705275, 0, 1, 0.3411765, 1,
-0.3121562, 1.317487, -0.7030891, 0, 1, 0.345098, 1,
-0.3048251, 0.4208438, -0.3855313, 0, 1, 0.3529412, 1,
-0.3024184, 0.5640901, 0.06969921, 0, 1, 0.3568628, 1,
-0.3013351, -1.508718, -2.252473, 0, 1, 0.3647059, 1,
-0.301153, 2.377862, 0.2464917, 0, 1, 0.3686275, 1,
-0.3000372, -0.4268526, -2.392939, 0, 1, 0.3764706, 1,
-0.294194, -0.1536882, -2.457032, 0, 1, 0.3803922, 1,
-0.2937637, 0.3509801, 0.5829544, 0, 1, 0.3882353, 1,
-0.2908247, 0.6350543, -1.638571, 0, 1, 0.3921569, 1,
-0.2879724, 0.403639, 0.9928972, 0, 1, 0.4, 1,
-0.2831547, -0.3641665, -1.857573, 0, 1, 0.4078431, 1,
-0.2807969, -0.181517, -3.279804, 0, 1, 0.4117647, 1,
-0.2772614, -1.768297, -2.927492, 0, 1, 0.4196078, 1,
-0.2762202, -1.813305, -2.308691, 0, 1, 0.4235294, 1,
-0.2754008, -0.863696, -2.64827, 0, 1, 0.4313726, 1,
-0.2704475, -1.438582, -1.162892, 0, 1, 0.4352941, 1,
-0.2698456, -0.9627454, -2.895984, 0, 1, 0.4431373, 1,
-0.2677147, -0.7897128, -3.27616, 0, 1, 0.4470588, 1,
-0.2649618, 0.08893642, -0.8661496, 0, 1, 0.454902, 1,
-0.2586495, 1.309358, -0.4660242, 0, 1, 0.4588235, 1,
-0.2571044, -1.610173, -3.725972, 0, 1, 0.4666667, 1,
-0.2553076, -0.6118271, -1.519856, 0, 1, 0.4705882, 1,
-0.2532433, -0.5347183, -2.38522, 0, 1, 0.4784314, 1,
-0.2491009, 0.08208954, -1.886287, 0, 1, 0.4823529, 1,
-0.2380117, -0.6501206, -5.355738, 0, 1, 0.4901961, 1,
-0.2374879, -1.173422, -4.075737, 0, 1, 0.4941176, 1,
-0.2332973, 0.1545752, -1.769385, 0, 1, 0.5019608, 1,
-0.2328063, -0.2713688, -3.289019, 0, 1, 0.509804, 1,
-0.2262235, 0.5644533, -1.399842, 0, 1, 0.5137255, 1,
-0.2259355, 0.4402189, -0.7551355, 0, 1, 0.5215687, 1,
-0.2233174, 0.3194609, -2.513037, 0, 1, 0.5254902, 1,
-0.222238, 0.165709, -1.957582, 0, 1, 0.5333334, 1,
-0.2170588, 1.788279, -0.3510988, 0, 1, 0.5372549, 1,
-0.2117735, -0.9866873, -2.240919, 0, 1, 0.5450981, 1,
-0.2107918, -0.3869848, -4.622477, 0, 1, 0.5490196, 1,
-0.2095304, -0.3596792, -2.875984, 0, 1, 0.5568628, 1,
-0.2062142, 0.342488, -1.442309, 0, 1, 0.5607843, 1,
-0.2050422, -2.514975, -2.092095, 0, 1, 0.5686275, 1,
-0.203747, -0.1399886, -2.538996, 0, 1, 0.572549, 1,
-0.1910369, -0.5477132, -3.018389, 0, 1, 0.5803922, 1,
-0.1889289, 2.265977, -0.9184466, 0, 1, 0.5843138, 1,
-0.1878677, -0.068381, -3.534219, 0, 1, 0.5921569, 1,
-0.1858167, -1.460455, -2.257235, 0, 1, 0.5960785, 1,
-0.1839629, -0.4457754, -2.995422, 0, 1, 0.6039216, 1,
-0.1791839, -0.2402717, -2.926698, 0, 1, 0.6117647, 1,
-0.1698896, 0.2719775, -0.9478707, 0, 1, 0.6156863, 1,
-0.1687601, -2.715704, -2.549974, 0, 1, 0.6235294, 1,
-0.1579582, -0.5906833, -1.439044, 0, 1, 0.627451, 1,
-0.156335, 0.7237658, -0.6096622, 0, 1, 0.6352941, 1,
-0.1560307, 0.6428335, -1.160904, 0, 1, 0.6392157, 1,
-0.1543694, 0.9461062, -0.8605947, 0, 1, 0.6470588, 1,
-0.154216, 0.5272394, 1.005277, 0, 1, 0.6509804, 1,
-0.1541024, -1.216207, -3.217836, 0, 1, 0.6588235, 1,
-0.1513976, -0.2021777, -1.805529, 0, 1, 0.6627451, 1,
-0.1487356, 1.23691, 0.4174079, 0, 1, 0.6705883, 1,
-0.1482917, -0.1609285, -1.271027, 0, 1, 0.6745098, 1,
-0.147248, 0.3717434, 1.815797, 0, 1, 0.682353, 1,
-0.1462807, -0.3809126, -1.707038, 0, 1, 0.6862745, 1,
-0.1425159, 0.849857, 0.4323981, 0, 1, 0.6941177, 1,
-0.1376086, 0.5397332, 1.035318, 0, 1, 0.7019608, 1,
-0.1367448, -0.1582244, -2.592558, 0, 1, 0.7058824, 1,
-0.1332498, -0.2317772, -2.438397, 0, 1, 0.7137255, 1,
-0.1318687, 0.7365106, -1.581665, 0, 1, 0.7176471, 1,
-0.1309078, 0.7133831, -0.25905, 0, 1, 0.7254902, 1,
-0.1297582, -0.158516, -2.630085, 0, 1, 0.7294118, 1,
-0.1252162, 1.219433, 0.654269, 0, 1, 0.7372549, 1,
-0.1218746, -0.5709665, -2.214418, 0, 1, 0.7411765, 1,
-0.1218618, 1.31721, 1.360834, 0, 1, 0.7490196, 1,
-0.1209974, -0.02495641, -1.116167, 0, 1, 0.7529412, 1,
-0.117028, 0.7826552, 0.3426976, 0, 1, 0.7607843, 1,
-0.1156225, 0.6832368, 0.5187804, 0, 1, 0.7647059, 1,
-0.1143781, 0.3983463, 0.7589647, 0, 1, 0.772549, 1,
-0.1134245, 1.212697, -0.5189539, 0, 1, 0.7764706, 1,
-0.1123973, -0.4903037, -2.424692, 0, 1, 0.7843137, 1,
-0.111906, 0.6973863, -0.02176629, 0, 1, 0.7882353, 1,
-0.1095973, 0.3935254, 1.598342, 0, 1, 0.7960784, 1,
-0.1079133, 1.122829, 1.96591, 0, 1, 0.8039216, 1,
-0.1053763, 0.5169479, -1.561235, 0, 1, 0.8078431, 1,
-0.0998549, 1.809914, -0.2946102, 0, 1, 0.8156863, 1,
-0.09698805, 0.7921442, -0.5760885, 0, 1, 0.8196079, 1,
-0.0955577, 0.2060293, -0.8763274, 0, 1, 0.827451, 1,
-0.09491134, -1.550196, -2.128325, 0, 1, 0.8313726, 1,
-0.09349725, -1.913277, -3.596897, 0, 1, 0.8392157, 1,
-0.0907789, 1.94887, 0.1171871, 0, 1, 0.8431373, 1,
-0.08149505, -0.4043322, -2.904845, 0, 1, 0.8509804, 1,
-0.07946075, -0.6513788, -3.416571, 0, 1, 0.854902, 1,
-0.07211049, 1.29164, 0.9622263, 0, 1, 0.8627451, 1,
-0.06913316, 1.275226, -0.834586, 0, 1, 0.8666667, 1,
-0.06762231, -0.4979817, -3.174811, 0, 1, 0.8745098, 1,
-0.06452154, 0.7444955, -0.8597107, 0, 1, 0.8784314, 1,
-0.06337854, -0.5221921, -2.474257, 0, 1, 0.8862745, 1,
-0.06249998, -1.008422, -4.934331, 0, 1, 0.8901961, 1,
-0.05581006, 0.0359475, -0.598321, 0, 1, 0.8980392, 1,
-0.05570599, -1.051986, -3.997026, 0, 1, 0.9058824, 1,
-0.05091348, -0.7075835, -3.476644, 0, 1, 0.9098039, 1,
-0.04178086, 0.1571786, 0.3466026, 0, 1, 0.9176471, 1,
-0.04092916, 0.7426417, 1.637813, 0, 1, 0.9215686, 1,
-0.03935098, -1.640471, -3.221459, 0, 1, 0.9294118, 1,
-0.03189754, 1.719974, -0.559034, 0, 1, 0.9333333, 1,
-0.03030131, -0.3238114, -3.167238, 0, 1, 0.9411765, 1,
-0.02344361, -0.1843946, -1.701015, 0, 1, 0.945098, 1,
-0.02219809, -1.887519, -3.271295, 0, 1, 0.9529412, 1,
-0.01912381, -0.7496817, -3.736613, 0, 1, 0.9568627, 1,
-0.01851813, 0.9360902, -0.1903537, 0, 1, 0.9647059, 1,
-0.01673688, -1.738359, -3.91802, 0, 1, 0.9686275, 1,
-0.01635135, 0.1802276, -0.04144197, 0, 1, 0.9764706, 1,
-0.0159131, 1.678165, 0.471938, 0, 1, 0.9803922, 1,
-0.01367601, -1.105005, -4.175419, 0, 1, 0.9882353, 1,
-0.01043636, 0.1391246, 0.001566309, 0, 1, 0.9921569, 1,
-0.008525507, 0.2100638, 1.325051, 0, 1, 1, 1,
-0.005786156, -0.2715507, -2.348601, 0, 0.9921569, 1, 1,
-0.004413425, -1.305109, -4.834803, 0, 0.9882353, 1, 1,
-0.002141529, 0.6366538, -2.328735, 0, 0.9803922, 1, 1,
-0.0004111709, 1.110653, 2.049461, 0, 0.9764706, 1, 1,
0.000459646, 0.6977814, 1.106193, 0, 0.9686275, 1, 1,
0.004710416, 1.005743, 0.8595821, 0, 0.9647059, 1, 1,
0.005551162, 2.062721, 1.9572, 0, 0.9568627, 1, 1,
0.006462528, 0.4101744, -0.5641644, 0, 0.9529412, 1, 1,
0.007347788, -0.5169088, 4.954603, 0, 0.945098, 1, 1,
0.0101952, 0.1150044, 0.575066, 0, 0.9411765, 1, 1,
0.01875588, 1.988084, 2.296342, 0, 0.9333333, 1, 1,
0.02073432, -1.027403, 3.167954, 0, 0.9294118, 1, 1,
0.02260727, 0.6877024, -0.09333562, 0, 0.9215686, 1, 1,
0.02302572, 0.8303219, -1.252127, 0, 0.9176471, 1, 1,
0.02735872, 0.3479671, -0.7418627, 0, 0.9098039, 1, 1,
0.02856291, -0.680351, 2.220003, 0, 0.9058824, 1, 1,
0.02930404, -0.3489046, 2.417258, 0, 0.8980392, 1, 1,
0.03712085, 0.3814482, 0.09697974, 0, 0.8901961, 1, 1,
0.04218338, 0.06369414, 0.07803173, 0, 0.8862745, 1, 1,
0.04667305, 0.6132905, -0.3718051, 0, 0.8784314, 1, 1,
0.05108521, -1.491357, 3.282112, 0, 0.8745098, 1, 1,
0.05256755, -0.5789984, 4.112723, 0, 0.8666667, 1, 1,
0.053234, 1.413808, -1.35675, 0, 0.8627451, 1, 1,
0.05604522, 1.176713, 1.568109, 0, 0.854902, 1, 1,
0.0605757, 0.4572608, -0.5819928, 0, 0.8509804, 1, 1,
0.0632678, -0.4249472, 2.092388, 0, 0.8431373, 1, 1,
0.0685201, 1.357024, 1.476847, 0, 0.8392157, 1, 1,
0.07046502, -0.3342251, 3.278326, 0, 0.8313726, 1, 1,
0.07461143, 0.2674357, -0.3813757, 0, 0.827451, 1, 1,
0.07464898, -1.257002, 4.560542, 0, 0.8196079, 1, 1,
0.07741505, -2.186426, 3.576052, 0, 0.8156863, 1, 1,
0.07938337, 0.4065109, 1.215783, 0, 0.8078431, 1, 1,
0.07996979, -1.452858, 1.173375, 0, 0.8039216, 1, 1,
0.08000397, 0.4912044, -0.3810874, 0, 0.7960784, 1, 1,
0.08029659, 0.1875514, -0.4052594, 0, 0.7882353, 1, 1,
0.08033851, -0.04065821, 2.952225, 0, 0.7843137, 1, 1,
0.08289414, -0.5911567, 3.700608, 0, 0.7764706, 1, 1,
0.08377909, -2.07105, 3.250334, 0, 0.772549, 1, 1,
0.0911182, 0.9134518, -0.05336458, 0, 0.7647059, 1, 1,
0.09637272, -0.8044028, 4.035263, 0, 0.7607843, 1, 1,
0.118325, -1.208324, 3.268411, 0, 0.7529412, 1, 1,
0.1204372, 0.6271864, -1.077539, 0, 0.7490196, 1, 1,
0.1205071, 0.7831575, -0.06390598, 0, 0.7411765, 1, 1,
0.125461, -0.5594326, 2.5619, 0, 0.7372549, 1, 1,
0.1259212, -0.5373588, 3.757677, 0, 0.7294118, 1, 1,
0.1292536, -0.6488217, 1.498884, 0, 0.7254902, 1, 1,
0.1296683, -0.3895274, 3.11661, 0, 0.7176471, 1, 1,
0.1307322, 2.171987, -0.1030832, 0, 0.7137255, 1, 1,
0.1315335, 0.6632613, 1.463043, 0, 0.7058824, 1, 1,
0.1351638, 0.6536161, 1.213838, 0, 0.6980392, 1, 1,
0.1428004, -0.9603626, 2.902442, 0, 0.6941177, 1, 1,
0.1440753, -2.532389, 2.243346, 0, 0.6862745, 1, 1,
0.1454308, 0.7754278, -0.2597808, 0, 0.682353, 1, 1,
0.150071, 0.8604757, 0.802411, 0, 0.6745098, 1, 1,
0.1525382, -1.322154, 3.777, 0, 0.6705883, 1, 1,
0.1545728, -2.459513, 3.155528, 0, 0.6627451, 1, 1,
0.1568986, 0.777444, 1.444872, 0, 0.6588235, 1, 1,
0.1570141, 0.4218259, 1.138565, 0, 0.6509804, 1, 1,
0.1585642, 0.655621, 0.3986914, 0, 0.6470588, 1, 1,
0.1589347, 1.851421, 0.7572514, 0, 0.6392157, 1, 1,
0.1762111, -0.2186965, 2.544133, 0, 0.6352941, 1, 1,
0.1814224, -0.6468419, 1.620946, 0, 0.627451, 1, 1,
0.1828482, 1.141253, -0.225625, 0, 0.6235294, 1, 1,
0.1869188, 0.1128359, 1.443608, 0, 0.6156863, 1, 1,
0.1886558, -0.5872868, 4.222806, 0, 0.6117647, 1, 1,
0.19536, -1.906615, 4.00668, 0, 0.6039216, 1, 1,
0.19668, -1.05394, 2.984685, 0, 0.5960785, 1, 1,
0.1971812, 0.8859738, 0.8449764, 0, 0.5921569, 1, 1,
0.1994902, -2.282185, 2.422085, 0, 0.5843138, 1, 1,
0.199622, -1.021574, 3.406654, 0, 0.5803922, 1, 1,
0.2010651, -0.1409615, 1.058105, 0, 0.572549, 1, 1,
0.2022696, 0.9246179, 0.3286612, 0, 0.5686275, 1, 1,
0.2048875, -0.1336504, 2.390834, 0, 0.5607843, 1, 1,
0.2115895, 0.2882477, 0.84188, 0, 0.5568628, 1, 1,
0.2187055, -0.9783284, 2.637963, 0, 0.5490196, 1, 1,
0.2225896, -0.7189011, 2.334485, 0, 0.5450981, 1, 1,
0.2270558, 0.7220098, 1.255624, 0, 0.5372549, 1, 1,
0.2312554, 1.20445, 0.9644768, 0, 0.5333334, 1, 1,
0.2395147, -0.4187775, 2.469299, 0, 0.5254902, 1, 1,
0.2400158, 0.4875048, 1.308913, 0, 0.5215687, 1, 1,
0.2407391, -0.4167247, 1.957542, 0, 0.5137255, 1, 1,
0.2427857, -0.5382726, 1.561387, 0, 0.509804, 1, 1,
0.2454196, -0.5224106, 3.126034, 0, 0.5019608, 1, 1,
0.2478665, -0.03494108, 1.289915, 0, 0.4941176, 1, 1,
0.2512001, 0.09258232, 0.2686024, 0, 0.4901961, 1, 1,
0.2528228, 0.7687302, 1.568679, 0, 0.4823529, 1, 1,
0.2533557, 1.049354, 0.9075649, 0, 0.4784314, 1, 1,
0.2577977, 0.1890483, 2.017482, 0, 0.4705882, 1, 1,
0.2645756, 1.896729, 0.4431258, 0, 0.4666667, 1, 1,
0.2687781, -0.5070042, 4.199673, 0, 0.4588235, 1, 1,
0.2703969, -2.179885, 5.005203, 0, 0.454902, 1, 1,
0.2705682, 0.02357126, 1.74524, 0, 0.4470588, 1, 1,
0.2715851, 0.2764816, 1.716302, 0, 0.4431373, 1, 1,
0.2886758, 0.8796286, -1.087798, 0, 0.4352941, 1, 1,
0.2890664, -0.3242975, 2.697995, 0, 0.4313726, 1, 1,
0.3012503, -1.878285, 2.559316, 0, 0.4235294, 1, 1,
0.3017733, -0.3780221, 1.586598, 0, 0.4196078, 1, 1,
0.3051041, 1.602061, -1.730511, 0, 0.4117647, 1, 1,
0.3058605, -0.2614276, 4.374943, 0, 0.4078431, 1, 1,
0.3104733, 1.632237, -0.7154446, 0, 0.4, 1, 1,
0.3118894, 0.08512955, 0.5426728, 0, 0.3921569, 1, 1,
0.3121353, -0.8105661, 3.529379, 0, 0.3882353, 1, 1,
0.3125232, 0.9290715, -0.110677, 0, 0.3803922, 1, 1,
0.3168384, -1.45289, 1.222057, 0, 0.3764706, 1, 1,
0.3171991, -0.5748079, 3.566841, 0, 0.3686275, 1, 1,
0.318856, 1.502855, -0.5644805, 0, 0.3647059, 1, 1,
0.3206258, -0.6902325, 2.724594, 0, 0.3568628, 1, 1,
0.3239688, 0.3225935, 2.121733, 0, 0.3529412, 1, 1,
0.3269708, -1.596208, 2.889229, 0, 0.345098, 1, 1,
0.3278259, -0.3955899, 1.56176, 0, 0.3411765, 1, 1,
0.3331628, 0.4197748, 2.338364, 0, 0.3333333, 1, 1,
0.3338365, 0.0009757864, 2.452302, 0, 0.3294118, 1, 1,
0.3350518, 0.7526558, 1.630298, 0, 0.3215686, 1, 1,
0.3356555, -0.1913685, 3.366354, 0, 0.3176471, 1, 1,
0.3372659, 1.339321, -0.8820716, 0, 0.3098039, 1, 1,
0.3400832, -0.2511776, 2.121012, 0, 0.3058824, 1, 1,
0.3501859, -1.239612, 1.172495, 0, 0.2980392, 1, 1,
0.3522051, 0.01249241, 2.015984, 0, 0.2901961, 1, 1,
0.3561225, 1.694794, 1.078523, 0, 0.2862745, 1, 1,
0.3568904, -1.565599, 1.46579, 0, 0.2784314, 1, 1,
0.3596421, -0.8144379, 2.751702, 0, 0.2745098, 1, 1,
0.3608345, 1.703678, -0.2265279, 0, 0.2666667, 1, 1,
0.3638239, 1.173853, -0.04749304, 0, 0.2627451, 1, 1,
0.3668985, 1.068896, 1.745115, 0, 0.254902, 1, 1,
0.3669454, 1.755364, 0.6876196, 0, 0.2509804, 1, 1,
0.3678078, -1.589023, 1.446205, 0, 0.2431373, 1, 1,
0.3682834, -1.289486, 4.424198, 0, 0.2392157, 1, 1,
0.3700988, -0.3181246, 2.28111, 0, 0.2313726, 1, 1,
0.3702352, -1.938197, 3.909617, 0, 0.227451, 1, 1,
0.3735972, 1.573925, 0.8514858, 0, 0.2196078, 1, 1,
0.3744392, -0.972791, 2.552834, 0, 0.2156863, 1, 1,
0.3781474, 0.2196779, 0.5266978, 0, 0.2078431, 1, 1,
0.3787385, -0.1277813, 1.838364, 0, 0.2039216, 1, 1,
0.3787496, -1.069088, 2.478708, 0, 0.1960784, 1, 1,
0.3834127, 2.175189, 0.8524549, 0, 0.1882353, 1, 1,
0.3877701, -0.6659783, 2.628958, 0, 0.1843137, 1, 1,
0.3925426, -0.9906789, 3.418244, 0, 0.1764706, 1, 1,
0.3960268, -0.6217897, 3.415474, 0, 0.172549, 1, 1,
0.3983113, 1.774109, -1.090963, 0, 0.1647059, 1, 1,
0.4042258, -0.1486755, 2.030939, 0, 0.1607843, 1, 1,
0.4060457, -1.690394, 1.796742, 0, 0.1529412, 1, 1,
0.4066274, 1.949396, -0.3888472, 0, 0.1490196, 1, 1,
0.4071477, -0.08233033, 2.916765, 0, 0.1411765, 1, 1,
0.4106746, 0.8637979, -0.2654582, 0, 0.1372549, 1, 1,
0.410705, -1.2287, 2.993284, 0, 0.1294118, 1, 1,
0.4120196, 0.01193588, 1.42036, 0, 0.1254902, 1, 1,
0.4122457, 0.8609405, 0.764264, 0, 0.1176471, 1, 1,
0.4128297, 0.1739333, 2.661066, 0, 0.1137255, 1, 1,
0.4161529, -0.672303, 3.304742, 0, 0.1058824, 1, 1,
0.4283853, -0.9232574, 3.152462, 0, 0.09803922, 1, 1,
0.4309441, -0.6290544, 3.023994, 0, 0.09411765, 1, 1,
0.4404219, 0.02011917, 0.4355079, 0, 0.08627451, 1, 1,
0.4430123, 1.00273, -1.746523, 0, 0.08235294, 1, 1,
0.449077, 1.597133, 0.2434217, 0, 0.07450981, 1, 1,
0.4513821, -1.086113, 1.474001, 0, 0.07058824, 1, 1,
0.4569706, 0.09826849, 2.400367, 0, 0.0627451, 1, 1,
0.4584923, 0.6655546, 1.495335, 0, 0.05882353, 1, 1,
0.4597667, 0.7872121, -1.044118, 0, 0.05098039, 1, 1,
0.4682167, 0.4101985, 1.923698, 0, 0.04705882, 1, 1,
0.4686961, -1.861886, 4.605565, 0, 0.03921569, 1, 1,
0.4725605, -0.9059184, 2.425402, 0, 0.03529412, 1, 1,
0.4740099, 2.926691, 0.6568317, 0, 0.02745098, 1, 1,
0.4741912, 0.7284706, 0.2669068, 0, 0.02352941, 1, 1,
0.4751158, 0.6571194, -0.3785413, 0, 0.01568628, 1, 1,
0.4759203, 1.418868, 1.078806, 0, 0.01176471, 1, 1,
0.4770652, -0.2862113, 0.8364049, 0, 0.003921569, 1, 1,
0.4814536, 0.3864122, 0.7843828, 0.003921569, 0, 1, 1,
0.4815618, 0.5978413, -0.6880742, 0.007843138, 0, 1, 1,
0.4816341, -0.4052803, 0.5713212, 0.01568628, 0, 1, 1,
0.4830148, 0.1252968, 0.4907793, 0.01960784, 0, 1, 1,
0.4845285, 0.07637859, 1.08278, 0.02745098, 0, 1, 1,
0.4852712, 1.476775, 0.8082961, 0.03137255, 0, 1, 1,
0.4852967, -0.8263006, 3.307553, 0.03921569, 0, 1, 1,
0.4875056, 0.5593052, -0.7683311, 0.04313726, 0, 1, 1,
0.4884073, 0.2375142, 0.8129231, 0.05098039, 0, 1, 1,
0.4913147, 0.3934137, 0.6110457, 0.05490196, 0, 1, 1,
0.4932292, 0.1351853, 2.181115, 0.0627451, 0, 1, 1,
0.4968901, -0.6984751, 2.068687, 0.06666667, 0, 1, 1,
0.4986686, 2.05561, 0.3656571, 0.07450981, 0, 1, 1,
0.499052, -0.454853, 2.054309, 0.07843138, 0, 1, 1,
0.5006027, 1.337886, 0.5894181, 0.08627451, 0, 1, 1,
0.5009007, -1.013535, 3.725265, 0.09019608, 0, 1, 1,
0.5045548, 0.1758538, -0.007506045, 0.09803922, 0, 1, 1,
0.504801, -0.1907536, 2.355388, 0.1058824, 0, 1, 1,
0.5118657, 0.9615578, -1.665446, 0.1098039, 0, 1, 1,
0.5142181, -1.035706, 3.728676, 0.1176471, 0, 1, 1,
0.5198554, 0.2907232, 2.323608, 0.1215686, 0, 1, 1,
0.5203196, -1.643857, 3.227633, 0.1294118, 0, 1, 1,
0.5233704, -0.4457054, 2.10812, 0.1333333, 0, 1, 1,
0.5272856, 0.285346, 0.7597752, 0.1411765, 0, 1, 1,
0.5288725, -0.981996, 1.881637, 0.145098, 0, 1, 1,
0.5291207, 1.121705, -0.05590919, 0.1529412, 0, 1, 1,
0.5303911, -0.3143511, 1.777868, 0.1568628, 0, 1, 1,
0.5312188, -2.132007, 2.40595, 0.1647059, 0, 1, 1,
0.5351427, 0.6526343, -0.9203291, 0.1686275, 0, 1, 1,
0.5371395, 0.08402128, -0.6646851, 0.1764706, 0, 1, 1,
0.5379725, 0.9563571, 0.5728634, 0.1803922, 0, 1, 1,
0.5397934, 1.077634, -0.9868621, 0.1882353, 0, 1, 1,
0.5431737, 0.3428891, 2.629828, 0.1921569, 0, 1, 1,
0.5457028, 0.2290947, 0.5157391, 0.2, 0, 1, 1,
0.5459327, 0.5281219, 0.4166999, 0.2078431, 0, 1, 1,
0.5492542, 0.9573457, -0.7775354, 0.2117647, 0, 1, 1,
0.5576652, 0.8252854, 0.2598763, 0.2196078, 0, 1, 1,
0.5603088, -0.3707361, 3.133158, 0.2235294, 0, 1, 1,
0.5657477, 0.3687255, 1.09709, 0.2313726, 0, 1, 1,
0.5677124, -0.1802877, 3.288904, 0.2352941, 0, 1, 1,
0.5785083, -0.2045018, 3.682705, 0.2431373, 0, 1, 1,
0.5816433, 0.02348533, 2.403706, 0.2470588, 0, 1, 1,
0.5828775, 1.936833, -0.8963576, 0.254902, 0, 1, 1,
0.5828866, -0.0910669, 1.927807, 0.2588235, 0, 1, 1,
0.5835817, -0.05746121, -0.8756608, 0.2666667, 0, 1, 1,
0.5844681, -0.1182967, 1.278621, 0.2705882, 0, 1, 1,
0.5869951, -1.783047, 3.032746, 0.2784314, 0, 1, 1,
0.5892752, 1.387437, 2.279167, 0.282353, 0, 1, 1,
0.5919155, 2.570966, 0.01428512, 0.2901961, 0, 1, 1,
0.5996467, -1.204584, 3.006601, 0.2941177, 0, 1, 1,
0.6024654, -0.4570667, 1.907216, 0.3019608, 0, 1, 1,
0.6098726, -1.806206, 3.386107, 0.3098039, 0, 1, 1,
0.6103907, 2.351547, -0.1229257, 0.3137255, 0, 1, 1,
0.6129864, 1.419124, -0.8968552, 0.3215686, 0, 1, 1,
0.6130193, 0.1736715, -0.6639094, 0.3254902, 0, 1, 1,
0.6131094, -0.6347565, 2.457046, 0.3333333, 0, 1, 1,
0.6190701, -0.2392409, 1.138253, 0.3372549, 0, 1, 1,
0.6244839, 0.3142956, 0.07806471, 0.345098, 0, 1, 1,
0.6259784, -0.9909113, 3.668621, 0.3490196, 0, 1, 1,
0.6298286, -1.811379, 3.630852, 0.3568628, 0, 1, 1,
0.6310687, -0.3556559, 1.347525, 0.3607843, 0, 1, 1,
0.6350862, -1.435157, 4.064562, 0.3686275, 0, 1, 1,
0.6471599, -0.5985593, 1.190372, 0.372549, 0, 1, 1,
0.6531208, 1.046325, 0.2937874, 0.3803922, 0, 1, 1,
0.6541075, -1.137952, 3.138554, 0.3843137, 0, 1, 1,
0.6542757, 0.2118473, 2.073208, 0.3921569, 0, 1, 1,
0.6550558, -0.9936167, 1.197704, 0.3960784, 0, 1, 1,
0.6571017, 0.03982721, 0.5175474, 0.4039216, 0, 1, 1,
0.665933, 1.79296, 0.08646225, 0.4117647, 0, 1, 1,
0.6684163, 0.83724, 1.086648, 0.4156863, 0, 1, 1,
0.6684924, 1.842051, 0.5011331, 0.4235294, 0, 1, 1,
0.6718622, -0.6050671, 0.3211056, 0.427451, 0, 1, 1,
0.6725306, -0.4349477, 1.786287, 0.4352941, 0, 1, 1,
0.6735868, -1.116989, 3.017305, 0.4392157, 0, 1, 1,
0.674811, -0.5954856, 1.53869, 0.4470588, 0, 1, 1,
0.6833293, 0.1745872, 2.232322, 0.4509804, 0, 1, 1,
0.6857263, -1.028909, 1.784977, 0.4588235, 0, 1, 1,
0.6901363, 0.5161101, 2.2027, 0.4627451, 0, 1, 1,
0.6920161, 0.8322797, 0.6576986, 0.4705882, 0, 1, 1,
0.6945909, -0.3747518, 1.139948, 0.4745098, 0, 1, 1,
0.6954528, -0.6406952, 1.879608, 0.4823529, 0, 1, 1,
0.6965928, -1.345346, 2.074695, 0.4862745, 0, 1, 1,
0.7031518, 1.823534, -1.833213, 0.4941176, 0, 1, 1,
0.704044, 1.523733, 1.132189, 0.5019608, 0, 1, 1,
0.7054702, -0.5635772, 1.932336, 0.5058824, 0, 1, 1,
0.7060741, 1.009388, -1.193099, 0.5137255, 0, 1, 1,
0.7087666, 1.929538, 2.380553, 0.5176471, 0, 1, 1,
0.7114099, 1.649233, 0.1584235, 0.5254902, 0, 1, 1,
0.7137717, 0.2561139, 0.3167751, 0.5294118, 0, 1, 1,
0.7149278, -0.03772672, 0.5193142, 0.5372549, 0, 1, 1,
0.7233665, -0.6243896, 1.854013, 0.5411765, 0, 1, 1,
0.7278649, -0.2733999, 1.648167, 0.5490196, 0, 1, 1,
0.7351103, 0.663982, -1.289335, 0.5529412, 0, 1, 1,
0.7358354, 1.107915, 1.893092, 0.5607843, 0, 1, 1,
0.7376435, -0.975343, 2.719654, 0.5647059, 0, 1, 1,
0.7376891, 0.3869896, 0.5792395, 0.572549, 0, 1, 1,
0.7412134, -0.9583716, 1.717366, 0.5764706, 0, 1, 1,
0.7570894, -0.487768, 1.686185, 0.5843138, 0, 1, 1,
0.757428, -1.125529, 1.577551, 0.5882353, 0, 1, 1,
0.7615649, -0.2803351, 2.020986, 0.5960785, 0, 1, 1,
0.7676186, 0.08107554, 2.048219, 0.6039216, 0, 1, 1,
0.7680442, 0.5591606, 0.1342217, 0.6078432, 0, 1, 1,
0.7712717, -0.5520546, 2.30093, 0.6156863, 0, 1, 1,
0.7725326, 2.94346, 0.1829698, 0.6196079, 0, 1, 1,
0.7751271, -0.5377124, 0.7807519, 0.627451, 0, 1, 1,
0.7768335, 2.419614, 1.022511, 0.6313726, 0, 1, 1,
0.7779121, -0.4345669, 2.352127, 0.6392157, 0, 1, 1,
0.7889118, -0.2338829, 3.848552, 0.6431373, 0, 1, 1,
0.7911138, 0.4259206, 2.710093, 0.6509804, 0, 1, 1,
0.8009006, -0.3789575, 2.024437, 0.654902, 0, 1, 1,
0.8012061, 0.8773342, -0.7811146, 0.6627451, 0, 1, 1,
0.8013069, 2.017462, -1.018417, 0.6666667, 0, 1, 1,
0.8078288, -0.4122407, 0.7285742, 0.6745098, 0, 1, 1,
0.8161197, 1.728993, 2.467216, 0.6784314, 0, 1, 1,
0.8166253, -1.106667, 2.318445, 0.6862745, 0, 1, 1,
0.8203185, -1.335834, 2.522698, 0.6901961, 0, 1, 1,
0.8258577, 0.1839809, 2.176413, 0.6980392, 0, 1, 1,
0.8311534, 0.2135095, -1.46158, 0.7058824, 0, 1, 1,
0.8331956, 2.163388, -0.03360466, 0.7098039, 0, 1, 1,
0.8349391, 0.8068489, 0.4079851, 0.7176471, 0, 1, 1,
0.840263, -0.7778994, 0.6192762, 0.7215686, 0, 1, 1,
0.852061, -0.7708983, 2.647467, 0.7294118, 0, 1, 1,
0.8525191, -1.256611, 2.06601, 0.7333333, 0, 1, 1,
0.8544669, -0.1250504, 1.710652, 0.7411765, 0, 1, 1,
0.8569053, 1.042702, 0.9565204, 0.7450981, 0, 1, 1,
0.8600764, 0.1503232, 1.891075, 0.7529412, 0, 1, 1,
0.8608657, -1.290299, 1.320399, 0.7568628, 0, 1, 1,
0.8612409, 1.116874, 1.051954, 0.7647059, 0, 1, 1,
0.8629895, -2.032679, 1.598427, 0.7686275, 0, 1, 1,
0.8657415, -0.8006486, 1.997253, 0.7764706, 0, 1, 1,
0.8717241, -0.2176899, 1.716015, 0.7803922, 0, 1, 1,
0.8722998, -0.2929437, 0.538489, 0.7882353, 0, 1, 1,
0.8740953, 1.186497, 0.0677969, 0.7921569, 0, 1, 1,
0.8802136, -0.3779767, 0.3367658, 0.8, 0, 1, 1,
0.8810883, 0.8750765, -0.5581623, 0.8078431, 0, 1, 1,
0.8811588, 0.06356316, 1.484853, 0.8117647, 0, 1, 1,
0.8862932, -0.2777684, 3.234077, 0.8196079, 0, 1, 1,
0.8914518, 0.307817, 3.638452, 0.8235294, 0, 1, 1,
0.8917098, 0.2936334, 1.114997, 0.8313726, 0, 1, 1,
0.8996832, 0.8422937, 3.083787, 0.8352941, 0, 1, 1,
0.9010467, -0.6144571, 3.455432, 0.8431373, 0, 1, 1,
0.9024472, -0.6433527, 3.887641, 0.8470588, 0, 1, 1,
0.9036605, 0.6894045, 0.6207101, 0.854902, 0, 1, 1,
0.9069136, -0.4696242, 2.046809, 0.8588235, 0, 1, 1,
0.909146, -0.1008, 1.594544, 0.8666667, 0, 1, 1,
0.9155967, 0.2329215, 1.585429, 0.8705882, 0, 1, 1,
0.9238292, -1.713192, 1.850859, 0.8784314, 0, 1, 1,
0.9318405, 0.7776484, 2.933194, 0.8823529, 0, 1, 1,
0.9356027, -0.777442, 4.081388, 0.8901961, 0, 1, 1,
0.9357592, 1.644428, 0.9124029, 0.8941177, 0, 1, 1,
0.938315, -1.228732, 2.86871, 0.9019608, 0, 1, 1,
0.9430063, -0.7091781, 1.85476, 0.9098039, 0, 1, 1,
0.9433076, 0.3553283, 0.2513983, 0.9137255, 0, 1, 1,
0.9453884, 0.1450662, 1.047756, 0.9215686, 0, 1, 1,
0.9483348, -0.3578415, 1.048732, 0.9254902, 0, 1, 1,
0.9494394, -0.5799105, 0.7031528, 0.9333333, 0, 1, 1,
0.9532901, -0.8181388, 3.9538, 0.9372549, 0, 1, 1,
0.9542525, -0.6510674, 2.788256, 0.945098, 0, 1, 1,
0.9550514, 1.014572, 0.4222812, 0.9490196, 0, 1, 1,
0.9593468, -1.653189, 3.103636, 0.9568627, 0, 1, 1,
0.9597589, 0.5379999, 1.352552, 0.9607843, 0, 1, 1,
0.961305, 0.8073344, 1.621401, 0.9686275, 0, 1, 1,
0.963369, 1.801579, -1.007083, 0.972549, 0, 1, 1,
0.9640183, 0.67063, -0.7906475, 0.9803922, 0, 1, 1,
0.9640763, 0.0929395, 0.5560664, 0.9843137, 0, 1, 1,
0.9690343, 0.3308242, 2.143888, 0.9921569, 0, 1, 1,
0.9825461, 0.5093669, 1.068583, 0.9960784, 0, 1, 1,
0.9836817, -0.01263684, 2.534886, 1, 0, 0.9960784, 1,
0.987494, 0.7968521, 0.8049793, 1, 0, 0.9882353, 1,
0.9876054, -0.3781633, 2.831354, 1, 0, 0.9843137, 1,
1.003999, 0.5336693, 1.222624, 1, 0, 0.9764706, 1,
1.00639, -0.5385907, -0.06248015, 1, 0, 0.972549, 1,
1.010912, 0.0995796, 1.922029, 1, 0, 0.9647059, 1,
1.025628, 0.3577049, -0.04910326, 1, 0, 0.9607843, 1,
1.026042, 1.285693, 1.792016, 1, 0, 0.9529412, 1,
1.027251, -1.037352, 2.156355, 1, 0, 0.9490196, 1,
1.027561, -1.931205, 4.202228, 1, 0, 0.9411765, 1,
1.02845, 0.2236367, 0.6728725, 1, 0, 0.9372549, 1,
1.030812, 0.9075198, 1.928477, 1, 0, 0.9294118, 1,
1.034866, -0.2829321, 2.338852, 1, 0, 0.9254902, 1,
1.036443, -0.7428631, 3.066686, 1, 0, 0.9176471, 1,
1.044402, -0.6956334, 1.978351, 1, 0, 0.9137255, 1,
1.045433, -0.682469, 2.239251, 1, 0, 0.9058824, 1,
1.049276, -1.542603, 0.6117416, 1, 0, 0.9019608, 1,
1.051642, -0.1588407, 1.311769, 1, 0, 0.8941177, 1,
1.05574, 0.3371311, 2.182263, 1, 0, 0.8862745, 1,
1.055765, -0.596619, 0.9101358, 1, 0, 0.8823529, 1,
1.057281, 0.3760905, -0.586453, 1, 0, 0.8745098, 1,
1.079546, 0.747905, 2.621613, 1, 0, 0.8705882, 1,
1.087546, -1.826866, 2.616423, 1, 0, 0.8627451, 1,
1.090378, -1.913516, 3.451621, 1, 0, 0.8588235, 1,
1.100515, 0.02768582, 0.0355591, 1, 0, 0.8509804, 1,
1.101712, 0.4695341, 1.874787, 1, 0, 0.8470588, 1,
1.104975, -1.555258, 2.423115, 1, 0, 0.8392157, 1,
1.107786, -0.5024294, 2.000344, 1, 0, 0.8352941, 1,
1.107989, 0.5441376, 1.102979, 1, 0, 0.827451, 1,
1.112022, -0.4785009, 2.66291, 1, 0, 0.8235294, 1,
1.120238, -0.4911926, 2.797467, 1, 0, 0.8156863, 1,
1.123852, 0.3763267, 1.650062, 1, 0, 0.8117647, 1,
1.130919, -0.2817053, 0.3002138, 1, 0, 0.8039216, 1,
1.132929, 0.2359818, 1.712205, 1, 0, 0.7960784, 1,
1.134622, 0.2078111, 1.425678, 1, 0, 0.7921569, 1,
1.140068, -0.9432267, 1.234629, 1, 0, 0.7843137, 1,
1.157765, -0.9927382, 1.717929, 1, 0, 0.7803922, 1,
1.159113, 1.767672, 1.453049, 1, 0, 0.772549, 1,
1.160038, 0.6506757, -0.3042422, 1, 0, 0.7686275, 1,
1.167404, 1.210749, -0.2073615, 1, 0, 0.7607843, 1,
1.168355, 0.1475289, 1.238413, 1, 0, 0.7568628, 1,
1.169906, 0.4622319, 1.798333, 1, 0, 0.7490196, 1,
1.172652, -1.690942, 2.996861, 1, 0, 0.7450981, 1,
1.178877, -0.4530099, 1.869447, 1, 0, 0.7372549, 1,
1.184182, 0.3175743, 2.227548, 1, 0, 0.7333333, 1,
1.188853, -0.3788773, 0.9419588, 1, 0, 0.7254902, 1,
1.192925, -0.0787231, 2.188847, 1, 0, 0.7215686, 1,
1.201534, 0.07996442, 2.094959, 1, 0, 0.7137255, 1,
1.203102, 0.6339489, 1.347626, 1, 0, 0.7098039, 1,
1.206165, -0.6092056, 1.753877, 1, 0, 0.7019608, 1,
1.207103, -0.5388248, 2.111638, 1, 0, 0.6941177, 1,
1.207357, 0.537997, 0.4183983, 1, 0, 0.6901961, 1,
1.21838, 0.7607474, -1.721317, 1, 0, 0.682353, 1,
1.2207, 0.04016126, 0.4717041, 1, 0, 0.6784314, 1,
1.227512, -0.311717, 1.27707, 1, 0, 0.6705883, 1,
1.243819, 0.08851961, 3.12477, 1, 0, 0.6666667, 1,
1.244543, -0.5146698, 3.493432, 1, 0, 0.6588235, 1,
1.246429, -0.2904046, 2.049313, 1, 0, 0.654902, 1,
1.249316, 0.08811778, 1.911447, 1, 0, 0.6470588, 1,
1.25491, -2.026326, 2.820707, 1, 0, 0.6431373, 1,
1.268944, -0.9962165, 3.629645, 1, 0, 0.6352941, 1,
1.278982, 1.331563, 2.581636, 1, 0, 0.6313726, 1,
1.279659, 0.8312759, 2.199795, 1, 0, 0.6235294, 1,
1.286277, 0.6247093, 1.920408, 1, 0, 0.6196079, 1,
1.305986, -0.1623504, 2.800437, 1, 0, 0.6117647, 1,
1.314841, 0.5608817, -0.5559204, 1, 0, 0.6078432, 1,
1.316672, -0.19794, 1.860039, 1, 0, 0.6, 1,
1.316948, -0.7083816, 2.651102, 1, 0, 0.5921569, 1,
1.318337, -2.725989, 1.817902, 1, 0, 0.5882353, 1,
1.318875, 0.7683342, -1.222475, 1, 0, 0.5803922, 1,
1.321258, -1.509073, 2.712944, 1, 0, 0.5764706, 1,
1.329197, 0.6826921, 1.078762, 1, 0, 0.5686275, 1,
1.329545, 0.9642153, 1.905222, 1, 0, 0.5647059, 1,
1.333019, -0.1172951, 1.082888, 1, 0, 0.5568628, 1,
1.33534, -1.172035, 1.78749, 1, 0, 0.5529412, 1,
1.33765, 1.639496, 0.846973, 1, 0, 0.5450981, 1,
1.350816, 0.4278147, 1.883739, 1, 0, 0.5411765, 1,
1.363667, 0.9388827, 1.585648, 1, 0, 0.5333334, 1,
1.366634, 0.5019473, 1.226864, 1, 0, 0.5294118, 1,
1.38518, -0.06606741, 4.122704, 1, 0, 0.5215687, 1,
1.402619, 1.789096, 0.2375149, 1, 0, 0.5176471, 1,
1.406257, 0.5656792, 1.355382, 1, 0, 0.509804, 1,
1.414944, -0.8378952, 2.891498, 1, 0, 0.5058824, 1,
1.419353, -0.5082101, 0.6922878, 1, 0, 0.4980392, 1,
1.420613, 1.074155, 1.627944, 1, 0, 0.4901961, 1,
1.432319, 1.452956, -0.3143839, 1, 0, 0.4862745, 1,
1.438654, -1.495616, 2.881829, 1, 0, 0.4784314, 1,
1.439137, 1.007604, 0.8079292, 1, 0, 0.4745098, 1,
1.443376, -0.6059474, 1.201415, 1, 0, 0.4666667, 1,
1.443534, 0.9336968, 1.340025, 1, 0, 0.4627451, 1,
1.447453, 0.3561627, 2.324959, 1, 0, 0.454902, 1,
1.455023, -0.7589291, 0.9986898, 1, 0, 0.4509804, 1,
1.470491, -1.681254, 2.291167, 1, 0, 0.4431373, 1,
1.474123, 0.5037681, 0.6406333, 1, 0, 0.4392157, 1,
1.504624, -0.3706838, 1.620903, 1, 0, 0.4313726, 1,
1.506308, 1.495471, 2.547852, 1, 0, 0.427451, 1,
1.515183, 0.6756772, 0.7300124, 1, 0, 0.4196078, 1,
1.51833, 0.448614, 0.5606819, 1, 0, 0.4156863, 1,
1.531044, -0.8458467, 0.3972714, 1, 0, 0.4078431, 1,
1.534544, -0.4206938, 2.208438, 1, 0, 0.4039216, 1,
1.536013, -0.4056453, 2.294115, 1, 0, 0.3960784, 1,
1.540258, -1.473702, 2.488116, 1, 0, 0.3882353, 1,
1.545282, -0.2331967, 1.947951, 1, 0, 0.3843137, 1,
1.551653, -0.5942179, 0.8032078, 1, 0, 0.3764706, 1,
1.553311, -0.7219753, 2.722305, 1, 0, 0.372549, 1,
1.571123, 0.8400775, 2.562426, 1, 0, 0.3647059, 1,
1.590845, 0.1616292, 1.792153, 1, 0, 0.3607843, 1,
1.594142, -1.300544, 1.575588, 1, 0, 0.3529412, 1,
1.594258, 0.5900393, 1.668428, 1, 0, 0.3490196, 1,
1.597133, 1.056393, -0.2952297, 1, 0, 0.3411765, 1,
1.6014, 0.5469116, 0.9362953, 1, 0, 0.3372549, 1,
1.616505, -1.323831, 2.764668, 1, 0, 0.3294118, 1,
1.620484, -0.478633, 2.462928, 1, 0, 0.3254902, 1,
1.630903, -0.1189989, 2.482582, 1, 0, 0.3176471, 1,
1.642376, -0.9381015, 2.388564, 1, 0, 0.3137255, 1,
1.645913, 2.090535, 0.8132669, 1, 0, 0.3058824, 1,
1.659531, 1.520904, -0.254583, 1, 0, 0.2980392, 1,
1.663378, 0.2433922, 1.385886, 1, 0, 0.2941177, 1,
1.665555, -1.423312, 2.179486, 1, 0, 0.2862745, 1,
1.670403, 0.113367, 1.168499, 1, 0, 0.282353, 1,
1.701506, -0.9425912, 1.066073, 1, 0, 0.2745098, 1,
1.709172, 0.1498598, 3.713121, 1, 0, 0.2705882, 1,
1.714849, -1.113191, 1.891852, 1, 0, 0.2627451, 1,
1.715124, -0.1939673, 2.028705, 1, 0, 0.2588235, 1,
1.71566, -1.577603, 0.5592645, 1, 0, 0.2509804, 1,
1.74777, 0.9511432, 0.1642206, 1, 0, 0.2470588, 1,
1.757516, 0.5271298, 1.967443, 1, 0, 0.2392157, 1,
1.772459, 0.9715947, 2.318032, 1, 0, 0.2352941, 1,
1.808314, -0.3852636, 1.00559, 1, 0, 0.227451, 1,
1.814034, 0.324183, 2.081181, 1, 0, 0.2235294, 1,
1.856457, 0.5696504, 0.2147025, 1, 0, 0.2156863, 1,
1.871487, 0.5962015, -1.0282, 1, 0, 0.2117647, 1,
1.877419, -0.5263967, 2.331769, 1, 0, 0.2039216, 1,
1.914777, 0.1989152, 2.875801, 1, 0, 0.1960784, 1,
1.942906, 1.269804, 1.782174, 1, 0, 0.1921569, 1,
1.943934, -0.1623256, 0.5993632, 1, 0, 0.1843137, 1,
1.949777, 1.938691, 2.75796, 1, 0, 0.1803922, 1,
1.953159, -0.8852905, 0.9997963, 1, 0, 0.172549, 1,
1.955746, -1.110121, 1.597356, 1, 0, 0.1686275, 1,
1.973267, 0.3815373, 1.12783, 1, 0, 0.1607843, 1,
1.988607, 1.033642, 2.357108, 1, 0, 0.1568628, 1,
1.989, 0.3048408, 1.638644, 1, 0, 0.1490196, 1,
2.001559, 0.3819311, 2.581887, 1, 0, 0.145098, 1,
2.018714, 0.7619557, 2.087043, 1, 0, 0.1372549, 1,
2.043043, 1.033159, 1.573826, 1, 0, 0.1333333, 1,
2.049019, 0.1402786, 2.375564, 1, 0, 0.1254902, 1,
2.054338, -1.408675, 1.850896, 1, 0, 0.1215686, 1,
2.079, 0.5691856, 1.444381, 1, 0, 0.1137255, 1,
2.082224, -0.6540435, 5.244146, 1, 0, 0.1098039, 1,
2.100428, 0.4735534, 0.6070557, 1, 0, 0.1019608, 1,
2.122019, 0.4740936, 1.505997, 1, 0, 0.09411765, 1,
2.134837, -0.285945, 3.091409, 1, 0, 0.09019608, 1,
2.139985, -0.5478402, 3.165062, 1, 0, 0.08235294, 1,
2.157274, 0.8062482, 0.8503493, 1, 0, 0.07843138, 1,
2.177314, 1.277719, 1.469234, 1, 0, 0.07058824, 1,
2.207641, 1.144884, 1.694626, 1, 0, 0.06666667, 1,
2.208586, 0.671088, 0.7721248, 1, 0, 0.05882353, 1,
2.212433, -0.2389031, 1.962509, 1, 0, 0.05490196, 1,
2.254133, -0.8976325, 1.407195, 1, 0, 0.04705882, 1,
2.31769, 2.078047, 1.535208, 1, 0, 0.04313726, 1,
2.490411, 1.689525, 1.60126, 1, 0, 0.03529412, 1,
2.567636, 1.532349, 1.468443, 1, 0, 0.03137255, 1,
2.830656, -0.4152968, 2.437902, 1, 0, 0.02352941, 1,
3.087238, 0.5279978, 2.991102, 1, 0, 0.01960784, 1,
3.187358, -0.5780913, 1.045701, 1, 0, 0.01176471, 1,
3.35972, 0.1866917, 0.6157687, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.07975125, -4.003842, -7.152419, 0, -0.5, 0.5, 0.5,
-0.07975125, -4.003842, -7.152419, 1, -0.5, 0.5, 0.5,
-0.07975125, -4.003842, -7.152419, 1, 1.5, 0.5, 0.5,
-0.07975125, -4.003842, -7.152419, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.685204, -0.02674162, -7.152419, 0, -0.5, 0.5, 0.5,
-4.685204, -0.02674162, -7.152419, 1, -0.5, 0.5, 0.5,
-4.685204, -0.02674162, -7.152419, 1, 1.5, 0.5, 0.5,
-4.685204, -0.02674162, -7.152419, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.685204, -4.003842, -0.05579591, 0, -0.5, 0.5, 0.5,
-4.685204, -4.003842, -0.05579591, 1, -0.5, 0.5, 0.5,
-4.685204, -4.003842, -0.05579591, 1, 1.5, 0.5, 0.5,
-4.685204, -4.003842, -0.05579591, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.08605, -5.514737,
3, -3.08605, -5.514737,
-3, -3.08605, -5.514737,
-3, -3.239015, -5.787683,
-2, -3.08605, -5.514737,
-2, -3.239015, -5.787683,
-1, -3.08605, -5.514737,
-1, -3.239015, -5.787683,
0, -3.08605, -5.514737,
0, -3.239015, -5.787683,
1, -3.08605, -5.514737,
1, -3.239015, -5.787683,
2, -3.08605, -5.514737,
2, -3.239015, -5.787683,
3, -3.08605, -5.514737,
3, -3.239015, -5.787683
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.544946, -6.333578, 0, -0.5, 0.5, 0.5,
-3, -3.544946, -6.333578, 1, -0.5, 0.5, 0.5,
-3, -3.544946, -6.333578, 1, 1.5, 0.5, 0.5,
-3, -3.544946, -6.333578, 0, 1.5, 0.5, 0.5,
-2, -3.544946, -6.333578, 0, -0.5, 0.5, 0.5,
-2, -3.544946, -6.333578, 1, -0.5, 0.5, 0.5,
-2, -3.544946, -6.333578, 1, 1.5, 0.5, 0.5,
-2, -3.544946, -6.333578, 0, 1.5, 0.5, 0.5,
-1, -3.544946, -6.333578, 0, -0.5, 0.5, 0.5,
-1, -3.544946, -6.333578, 1, -0.5, 0.5, 0.5,
-1, -3.544946, -6.333578, 1, 1.5, 0.5, 0.5,
-1, -3.544946, -6.333578, 0, 1.5, 0.5, 0.5,
0, -3.544946, -6.333578, 0, -0.5, 0.5, 0.5,
0, -3.544946, -6.333578, 1, -0.5, 0.5, 0.5,
0, -3.544946, -6.333578, 1, 1.5, 0.5, 0.5,
0, -3.544946, -6.333578, 0, 1.5, 0.5, 0.5,
1, -3.544946, -6.333578, 0, -0.5, 0.5, 0.5,
1, -3.544946, -6.333578, 1, -0.5, 0.5, 0.5,
1, -3.544946, -6.333578, 1, 1.5, 0.5, 0.5,
1, -3.544946, -6.333578, 0, 1.5, 0.5, 0.5,
2, -3.544946, -6.333578, 0, -0.5, 0.5, 0.5,
2, -3.544946, -6.333578, 1, -0.5, 0.5, 0.5,
2, -3.544946, -6.333578, 1, 1.5, 0.5, 0.5,
2, -3.544946, -6.333578, 0, 1.5, 0.5, 0.5,
3, -3.544946, -6.333578, 0, -0.5, 0.5, 0.5,
3, -3.544946, -6.333578, 1, -0.5, 0.5, 0.5,
3, -3.544946, -6.333578, 1, 1.5, 0.5, 0.5,
3, -3.544946, -6.333578, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.622407, -2, -5.514737,
-3.622407, 2, -5.514737,
-3.622407, -2, -5.514737,
-3.79954, -2, -5.787683,
-3.622407, -1, -5.514737,
-3.79954, -1, -5.787683,
-3.622407, 0, -5.514737,
-3.79954, 0, -5.787683,
-3.622407, 1, -5.514737,
-3.79954, 1, -5.787683,
-3.622407, 2, -5.514737,
-3.79954, 2, -5.787683
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.153806, -2, -6.333578, 0, -0.5, 0.5, 0.5,
-4.153806, -2, -6.333578, 1, -0.5, 0.5, 0.5,
-4.153806, -2, -6.333578, 1, 1.5, 0.5, 0.5,
-4.153806, -2, -6.333578, 0, 1.5, 0.5, 0.5,
-4.153806, -1, -6.333578, 0, -0.5, 0.5, 0.5,
-4.153806, -1, -6.333578, 1, -0.5, 0.5, 0.5,
-4.153806, -1, -6.333578, 1, 1.5, 0.5, 0.5,
-4.153806, -1, -6.333578, 0, 1.5, 0.5, 0.5,
-4.153806, 0, -6.333578, 0, -0.5, 0.5, 0.5,
-4.153806, 0, -6.333578, 1, -0.5, 0.5, 0.5,
-4.153806, 0, -6.333578, 1, 1.5, 0.5, 0.5,
-4.153806, 0, -6.333578, 0, 1.5, 0.5, 0.5,
-4.153806, 1, -6.333578, 0, -0.5, 0.5, 0.5,
-4.153806, 1, -6.333578, 1, -0.5, 0.5, 0.5,
-4.153806, 1, -6.333578, 1, 1.5, 0.5, 0.5,
-4.153806, 1, -6.333578, 0, 1.5, 0.5, 0.5,
-4.153806, 2, -6.333578, 0, -0.5, 0.5, 0.5,
-4.153806, 2, -6.333578, 1, -0.5, 0.5, 0.5,
-4.153806, 2, -6.333578, 1, 1.5, 0.5, 0.5,
-4.153806, 2, -6.333578, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.622407, -3.08605, -4,
-3.622407, -3.08605, 4,
-3.622407, -3.08605, -4,
-3.79954, -3.239015, -4,
-3.622407, -3.08605, -2,
-3.79954, -3.239015, -2,
-3.622407, -3.08605, 0,
-3.79954, -3.239015, 0,
-3.622407, -3.08605, 2,
-3.79954, -3.239015, 2,
-3.622407, -3.08605, 4,
-3.79954, -3.239015, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.153806, -3.544946, -4, 0, -0.5, 0.5, 0.5,
-4.153806, -3.544946, -4, 1, -0.5, 0.5, 0.5,
-4.153806, -3.544946, -4, 1, 1.5, 0.5, 0.5,
-4.153806, -3.544946, -4, 0, 1.5, 0.5, 0.5,
-4.153806, -3.544946, -2, 0, -0.5, 0.5, 0.5,
-4.153806, -3.544946, -2, 1, -0.5, 0.5, 0.5,
-4.153806, -3.544946, -2, 1, 1.5, 0.5, 0.5,
-4.153806, -3.544946, -2, 0, 1.5, 0.5, 0.5,
-4.153806, -3.544946, 0, 0, -0.5, 0.5, 0.5,
-4.153806, -3.544946, 0, 1, -0.5, 0.5, 0.5,
-4.153806, -3.544946, 0, 1, 1.5, 0.5, 0.5,
-4.153806, -3.544946, 0, 0, 1.5, 0.5, 0.5,
-4.153806, -3.544946, 2, 0, -0.5, 0.5, 0.5,
-4.153806, -3.544946, 2, 1, -0.5, 0.5, 0.5,
-4.153806, -3.544946, 2, 1, 1.5, 0.5, 0.5,
-4.153806, -3.544946, 2, 0, 1.5, 0.5, 0.5,
-4.153806, -3.544946, 4, 0, -0.5, 0.5, 0.5,
-4.153806, -3.544946, 4, 1, -0.5, 0.5, 0.5,
-4.153806, -3.544946, 4, 1, 1.5, 0.5, 0.5,
-4.153806, -3.544946, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.622407, -3.08605, -5.514737,
-3.622407, 3.032567, -5.514737,
-3.622407, -3.08605, 5.403145,
-3.622407, 3.032567, 5.403145,
-3.622407, -3.08605, -5.514737,
-3.622407, -3.08605, 5.403145,
-3.622407, 3.032567, -5.514737,
-3.622407, 3.032567, 5.403145,
-3.622407, -3.08605, -5.514737,
3.462905, -3.08605, -5.514737,
-3.622407, -3.08605, 5.403145,
3.462905, -3.08605, 5.403145,
-3.622407, 3.032567, -5.514737,
3.462905, 3.032567, -5.514737,
-3.622407, 3.032567, 5.403145,
3.462905, 3.032567, 5.403145,
3.462905, -3.08605, -5.514737,
3.462905, 3.032567, -5.514737,
3.462905, -3.08605, 5.403145,
3.462905, 3.032567, 5.403145,
3.462905, -3.08605, -5.514737,
3.462905, -3.08605, 5.403145,
3.462905, 3.032567, -5.514737,
3.462905, 3.032567, 5.403145
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.679659;
var distance = 34.16768;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.07975125, 0.02674162, 0.05579591 );
mvMatrix.scale( 1.171917, 1.357071, 0.760532 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.16768);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
dimethylether<-read.table("dimethylether.xyz")
```

```
## Error in read.table("dimethylether.xyz"): no lines available in input
```

```r
x<-dimethylether$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethylether' not found
```

```r
y<-dimethylether$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethylether' not found
```

```r
z<-dimethylether$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethylether' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.519223, 0.09459122, -1.772576, 0, 0, 1, 1, 1,
-3.259954, -1.46427, -0.05808237, 1, 0, 0, 1, 1,
-3.234821, -1.163443, -0.5520624, 1, 0, 0, 1, 1,
-3.034822, 0.942367, -2.454602, 1, 0, 0, 1, 1,
-2.997698, 0.3479729, -1.855043, 1, 0, 0, 1, 1,
-2.751766, -1.83804, -3.335371, 1, 0, 0, 1, 1,
-2.597453, 0.5408322, -0.2394923, 0, 0, 0, 1, 1,
-2.57871, 1.24318, -2.119808, 0, 0, 0, 1, 1,
-2.570504, 1.298931, 0.4781344, 0, 0, 0, 1, 1,
-2.544652, -2.326627, -0.8187683, 0, 0, 0, 1, 1,
-2.50678, 0.9811003, -2.523176, 0, 0, 0, 1, 1,
-2.504648, 0.4974432, -1.095816, 0, 0, 0, 1, 1,
-2.485938, 0.8551025, -2.179146, 0, 0, 0, 1, 1,
-2.444875, 0.5537291, -2.016261, 1, 1, 1, 1, 1,
-2.426741, -1.223267, -1.106662, 1, 1, 1, 1, 1,
-2.401595, 2.413624, -1.685263, 1, 1, 1, 1, 1,
-2.31546, -0.2136537, -2.162611, 1, 1, 1, 1, 1,
-2.286324, -1.677697, -0.9943406, 1, 1, 1, 1, 1,
-2.255718, -0.7177405, -1.005666, 1, 1, 1, 1, 1,
-2.239844, -0.1031545, -0.02984281, 1, 1, 1, 1, 1,
-2.186418, -0.4186143, -1.33753, 1, 1, 1, 1, 1,
-2.184637, 0.06138374, -1.064421, 1, 1, 1, 1, 1,
-2.1831, 0.2165689, -2.196098, 1, 1, 1, 1, 1,
-2.159412, 1.096368, -0.310437, 1, 1, 1, 1, 1,
-2.158699, -1.170296, -2.3538, 1, 1, 1, 1, 1,
-2.141263, -0.7325302, 1.40733, 1, 1, 1, 1, 1,
-2.138955, -1.088206, 0.7295866, 1, 1, 1, 1, 1,
-2.110766, -0.2640487, -1.41108, 1, 1, 1, 1, 1,
-2.108239, -1.303607, -3.260742, 0, 0, 1, 1, 1,
-2.090264, -0.6121225, -2.610382, 1, 0, 0, 1, 1,
-2.046527, 0.3942393, -0.4612662, 1, 0, 0, 1, 1,
-2.034461, -0.5676288, -3.01649, 1, 0, 0, 1, 1,
-2.029174, -0.5450855, -1.122727, 1, 0, 0, 1, 1,
-2.022013, 0.926522, -2.601006, 1, 0, 0, 1, 1,
-2.000823, 2.143718, -0.2150525, 0, 0, 0, 1, 1,
-1.991785, 1.182423, -0.1439757, 0, 0, 0, 1, 1,
-1.980687, -0.2103867, -1.694865, 0, 0, 0, 1, 1,
-1.980504, 0.8729571, -1.571797, 0, 0, 0, 1, 1,
-1.972689, -2.233869, -2.271482, 0, 0, 0, 1, 1,
-1.94578, 0.2122988, -0.525152, 0, 0, 0, 1, 1,
-1.945069, 0.8565142, -1.179426, 0, 0, 0, 1, 1,
-1.916569, 0.3945323, -3.39213, 1, 1, 1, 1, 1,
-1.898387, -0.7937173, -1.177948, 1, 1, 1, 1, 1,
-1.885722, -0.8767757, -1.74237, 1, 1, 1, 1, 1,
-1.885617, -0.829819, -3.475946, 1, 1, 1, 1, 1,
-1.879183, 2.227392, -0.919384, 1, 1, 1, 1, 1,
-1.87524, -0.5111715, -0.2111736, 1, 1, 1, 1, 1,
-1.838314, -1.653892, -2.04486, 1, 1, 1, 1, 1,
-1.837728, -0.5980362, -3.140294, 1, 1, 1, 1, 1,
-1.83584, -0.280539, -1.824069, 1, 1, 1, 1, 1,
-1.812265, 1.966967, 1.177288, 1, 1, 1, 1, 1,
-1.803316, 1.561283, -0.6100737, 1, 1, 1, 1, 1,
-1.799797, 0.7781049, -1.836981, 1, 1, 1, 1, 1,
-1.786993, -0.1188639, -0.7507595, 1, 1, 1, 1, 1,
-1.773963, -0.1464585, -1.413106, 1, 1, 1, 1, 1,
-1.749911, 0.6048596, -0.2521114, 1, 1, 1, 1, 1,
-1.743463, 0.1285092, -0.180339, 0, 0, 1, 1, 1,
-1.741228, -1.324524, -2.741248, 1, 0, 0, 1, 1,
-1.734351, -0.828414, -0.8908141, 1, 0, 0, 1, 1,
-1.721081, -0.06961943, -1.259959, 1, 0, 0, 1, 1,
-1.720879, -0.5745699, -1.625484, 1, 0, 0, 1, 1,
-1.712183, 0.486224, -1.029526, 1, 0, 0, 1, 1,
-1.709018, -1.201698, -2.692834, 0, 0, 0, 1, 1,
-1.706816, -0.1061389, -2.79053, 0, 0, 0, 1, 1,
-1.706679, -0.1344944, -1.759423, 0, 0, 0, 1, 1,
-1.702719, -0.02230403, -1.549286, 0, 0, 0, 1, 1,
-1.697032, 0.3888747, -2.169709, 0, 0, 0, 1, 1,
-1.690732, -0.7021974, -2.848867, 0, 0, 0, 1, 1,
-1.678658, -0.666127, -0.3015655, 0, 0, 0, 1, 1,
-1.678548, -0.1234572, 0.8472481, 1, 1, 1, 1, 1,
-1.665872, 0.9946499, -0.5743482, 1, 1, 1, 1, 1,
-1.665132, 0.7063613, -1.237054, 1, 1, 1, 1, 1,
-1.654204, 0.003377137, -1.837028, 1, 1, 1, 1, 1,
-1.646989, -0.494434, -2.187549, 1, 1, 1, 1, 1,
-1.62851, 0.8005994, -3.111285, 1, 1, 1, 1, 1,
-1.625244, 0.3496195, -1.140134, 1, 1, 1, 1, 1,
-1.619809, -0.4834639, -1.181061, 1, 1, 1, 1, 1,
-1.617472, 1.595998, -0.7266148, 1, 1, 1, 1, 1,
-1.615023, 0.3298997, -1.973456, 1, 1, 1, 1, 1,
-1.608638, 0.10413, -2.418193, 1, 1, 1, 1, 1,
-1.592027, 0.02822296, -1.217765, 1, 1, 1, 1, 1,
-1.581129, 0.5259724, -1.402271, 1, 1, 1, 1, 1,
-1.562828, 0.9443409, -1.099721, 1, 1, 1, 1, 1,
-1.553643, 0.8920211, 1.014807, 1, 1, 1, 1, 1,
-1.550383, -0.2593616, -2.65397, 0, 0, 1, 1, 1,
-1.5446, -0.4452748, -2.616523, 1, 0, 0, 1, 1,
-1.530036, -0.6564206, -1.866472, 1, 0, 0, 1, 1,
-1.515457, -1.030909, -1.739857, 1, 0, 0, 1, 1,
-1.495351, 0.2924694, -2.516487, 1, 0, 0, 1, 1,
-1.494116, 1.302316, -0.987496, 1, 0, 0, 1, 1,
-1.48119, 1.467352, -1.802027, 0, 0, 0, 1, 1,
-1.473498, 0.05803309, -0.02967676, 0, 0, 0, 1, 1,
-1.47298, 1.284234, 0.5790705, 0, 0, 0, 1, 1,
-1.465918, -0.8475145, -3.449758, 0, 0, 0, 1, 1,
-1.459481, -1.891229, -2.761717, 0, 0, 0, 1, 1,
-1.457821, -1.038426, -3.390633, 0, 0, 0, 1, 1,
-1.452811, -1.102639, -3.68916, 0, 0, 0, 1, 1,
-1.443338, 0.7997084, -1.140339, 1, 1, 1, 1, 1,
-1.43755, 0.01314309, -1.193651, 1, 1, 1, 1, 1,
-1.435852, -0.2993838, -1.909076, 1, 1, 1, 1, 1,
-1.427538, 1.070959, -1.367808, 1, 1, 1, 1, 1,
-1.421137, -1.291941, -0.167722, 1, 1, 1, 1, 1,
-1.419691, 0.8780367, -0.559646, 1, 1, 1, 1, 1,
-1.406795, 0.3565749, -2.214514, 1, 1, 1, 1, 1,
-1.400536, -1.001039, -4.410358, 1, 1, 1, 1, 1,
-1.397771, 0.3154122, -2.26174, 1, 1, 1, 1, 1,
-1.390979, 0.1624424, -1.285778, 1, 1, 1, 1, 1,
-1.390539, -0.4588727, -1.004223, 1, 1, 1, 1, 1,
-1.383909, -0.5744464, -2.062037, 1, 1, 1, 1, 1,
-1.369611, 0.4254889, -1.501645, 1, 1, 1, 1, 1,
-1.363953, -0.6641774, -2.163349, 1, 1, 1, 1, 1,
-1.355698, -0.7527046, -2.864389, 1, 1, 1, 1, 1,
-1.341119, -0.3583275, -1.445746, 0, 0, 1, 1, 1,
-1.33463, -1.693225, -3.681799, 1, 0, 0, 1, 1,
-1.326657, 1.268376, -0.3900242, 1, 0, 0, 1, 1,
-1.318688, -0.796698, -1.926809, 1, 0, 0, 1, 1,
-1.310269, 0.1061561, -1.078921, 1, 0, 0, 1, 1,
-1.306955, -0.7953334, -1.649139, 1, 0, 0, 1, 1,
-1.303828, 1.583097, -0.2642997, 0, 0, 0, 1, 1,
-1.303044, -1.539571, -3.115849, 0, 0, 0, 1, 1,
-1.297483, -1.588066, -1.332566, 0, 0, 0, 1, 1,
-1.288964, 0.5108061, -0.08219641, 0, 0, 0, 1, 1,
-1.286268, -0.04512231, -1.482086, 0, 0, 0, 1, 1,
-1.265989, -0.3896009, -2.81753, 0, 0, 0, 1, 1,
-1.264928, -0.1240629, -2.273525, 0, 0, 0, 1, 1,
-1.260497, -0.7886084, -2.565064, 1, 1, 1, 1, 1,
-1.256732, 1.565492, -0.5634171, 1, 1, 1, 1, 1,
-1.255757, -0.1362882, -0.5810144, 1, 1, 1, 1, 1,
-1.249869, 0.6064009, -1.919326, 1, 1, 1, 1, 1,
-1.240973, -0.06184437, -1.003186, 1, 1, 1, 1, 1,
-1.239815, 0.1260239, -2.082473, 1, 1, 1, 1, 1,
-1.224174, 0.26388, -1.604634, 1, 1, 1, 1, 1,
-1.222921, 0.304731, -2.487315, 1, 1, 1, 1, 1,
-1.2173, -0.6891577, -3.260974, 1, 1, 1, 1, 1,
-1.211388, -0.3689375, -0.3661633, 1, 1, 1, 1, 1,
-1.206705, 0.8409301, -0.8541933, 1, 1, 1, 1, 1,
-1.206398, 0.06993797, -0.8707177, 1, 1, 1, 1, 1,
-1.206045, 1.340747, -3.715927, 1, 1, 1, 1, 1,
-1.205585, -0.527553, -2.68729, 1, 1, 1, 1, 1,
-1.200783, 0.09927561, -1.212374, 1, 1, 1, 1, 1,
-1.196786, 0.891355, -1.149652, 0, 0, 1, 1, 1,
-1.185939, 0.8596875, -1.50412, 1, 0, 0, 1, 1,
-1.169475, 1.860917, 0.1441099, 1, 0, 0, 1, 1,
-1.167991, -0.8665761, -0.2899489, 1, 0, 0, 1, 1,
-1.164191, 1.215078, -1.111721, 1, 0, 0, 1, 1,
-1.159408, 0.6318887, -0.188023, 1, 0, 0, 1, 1,
-1.158996, -0.6612547, -1.065505, 0, 0, 0, 1, 1,
-1.155118, 0.5973693, 0.2722139, 0, 0, 0, 1, 1,
-1.145665, 0.8639094, -1.373258, 0, 0, 0, 1, 1,
-1.144611, 0.1503991, -0.09516376, 0, 0, 0, 1, 1,
-1.128508, -0.6364435, -1.394871, 0, 0, 0, 1, 1,
-1.12085, -1.209674, -2.531843, 0, 0, 0, 1, 1,
-1.117042, -0.7529761, -1.688196, 0, 0, 0, 1, 1,
-1.099684, -0.4569745, -1.525555, 1, 1, 1, 1, 1,
-1.093472, -0.1240333, -2.700049, 1, 1, 1, 1, 1,
-1.092445, -0.8210207, -2.189593, 1, 1, 1, 1, 1,
-1.082086, -0.9710162, -2.656276, 1, 1, 1, 1, 1,
-1.070747, 0.7822125, -0.8646094, 1, 1, 1, 1, 1,
-1.067535, 0.9564623, -1.987745, 1, 1, 1, 1, 1,
-1.063112, 0.6891429, 0.2155601, 1, 1, 1, 1, 1,
-1.053446, 0.2916231, 0.8279899, 1, 1, 1, 1, 1,
-1.051232, -0.533009, -2.964188, 1, 1, 1, 1, 1,
-1.036443, -0.4173349, -2.561105, 1, 1, 1, 1, 1,
-1.036205, 1.73698, -0.3582024, 1, 1, 1, 1, 1,
-1.035573, -0.5267861, -0.476643, 1, 1, 1, 1, 1,
-1.032762, -0.1671714, -0.7891713, 1, 1, 1, 1, 1,
-1.031241, 1.105772, -2.052157, 1, 1, 1, 1, 1,
-1.029378, -0.956153, -1.862578, 1, 1, 1, 1, 1,
-1.027593, -2.149173, -3.531567, 0, 0, 1, 1, 1,
-1.014936, 0.4095939, 0.4099011, 1, 0, 0, 1, 1,
-1.013109, -0.1435146, 0.1686879, 1, 0, 0, 1, 1,
-1.010333, 2.105302, -0.9810325, 1, 0, 0, 1, 1,
-1.006772, 1.170123, -0.2110345, 1, 0, 0, 1, 1,
-0.9915106, -0.668483, -1.126182, 1, 0, 0, 1, 1,
-0.9888769, -1.312114, -2.624628, 0, 0, 0, 1, 1,
-0.988806, 1.005916, -2.283452, 0, 0, 0, 1, 1,
-0.9824129, 0.4833476, -0.9925013, 0, 0, 0, 1, 1,
-0.9769061, 0.4656751, -1.538783, 0, 0, 0, 1, 1,
-0.9761215, -0.5161473, -2.05464, 0, 0, 0, 1, 1,
-0.9706485, 0.3336606, -1.116117, 0, 0, 0, 1, 1,
-0.9699444, 1.647854, -1.093248, 0, 0, 0, 1, 1,
-0.969827, 0.05223599, 0.1444695, 1, 1, 1, 1, 1,
-0.9698038, 0.7556883, -1.948389, 1, 1, 1, 1, 1,
-0.9668363, -1.04223, -2.594241, 1, 1, 1, 1, 1,
-0.9655311, -1.487522, -3.691535, 1, 1, 1, 1, 1,
-0.9649574, -1.54724, -3.221209, 1, 1, 1, 1, 1,
-0.9600657, 1.563287, -0.2565189, 1, 1, 1, 1, 1,
-0.9582812, -0.07594779, -1.780323, 1, 1, 1, 1, 1,
-0.954204, 0.2367919, -1.423447, 1, 1, 1, 1, 1,
-0.9514202, -0.01646035, 0.3069666, 1, 1, 1, 1, 1,
-0.9471021, -1.735481, -2.173665, 1, 1, 1, 1, 1,
-0.9416388, 0.7524515, 0.8551879, 1, 1, 1, 1, 1,
-0.9368368, 1.79442, -0.3800012, 1, 1, 1, 1, 1,
-0.9367552, -0.8006578, -1.431707, 1, 1, 1, 1, 1,
-0.9365842, 1.36366, -0.4552896, 1, 1, 1, 1, 1,
-0.934111, -0.2340183, -2.72861, 1, 1, 1, 1, 1,
-0.9325125, -0.5816633, -1.542894, 0, 0, 1, 1, 1,
-0.9283136, -0.5267108, -2.566403, 1, 0, 0, 1, 1,
-0.9258621, 0.7755023, -0.35182, 1, 0, 0, 1, 1,
-0.9235613, -1.356622, -2.462738, 1, 0, 0, 1, 1,
-0.9172705, -0.06728543, -0.3867657, 1, 0, 0, 1, 1,
-0.9155948, 1.162698, 0.4953229, 1, 0, 0, 1, 1,
-0.9117482, 0.5340991, -2.448738, 0, 0, 0, 1, 1,
-0.9103944, -0.08876255, -3.912213, 0, 0, 0, 1, 1,
-0.9013014, 0.4904406, 1.447892, 0, 0, 0, 1, 1,
-0.8970901, -1.390581, -3.117258, 0, 0, 0, 1, 1,
-0.8948036, -0.451328, -2.364207, 0, 0, 0, 1, 1,
-0.8908724, 1.08734, -0.9955487, 0, 0, 0, 1, 1,
-0.8904648, 0.5911503, -0.3707167, 0, 0, 0, 1, 1,
-0.8859739, -0.5297187, -1.717611, 1, 1, 1, 1, 1,
-0.8817202, -0.6773438, 0.511319, 1, 1, 1, 1, 1,
-0.8800628, -0.5989351, -2.217023, 1, 1, 1, 1, 1,
-0.8752278, -0.1491495, -1.065574, 1, 1, 1, 1, 1,
-0.8660425, -0.5545329, -1.828298, 1, 1, 1, 1, 1,
-0.8635874, -0.7437854, -3.082695, 1, 1, 1, 1, 1,
-0.8608006, 0.7588593, -1.373971, 1, 1, 1, 1, 1,
-0.8562796, 0.2332566, -2.56724, 1, 1, 1, 1, 1,
-0.8558677, 0.4810004, -1.291278, 1, 1, 1, 1, 1,
-0.8500851, 0.4412192, -0.08476668, 1, 1, 1, 1, 1,
-0.8407894, 0.3006855, -0.2263686, 1, 1, 1, 1, 1,
-0.8399059, 1.148547, -0.993816, 1, 1, 1, 1, 1,
-0.8380318, -1.005211, -3.317155, 1, 1, 1, 1, 1,
-0.836822, -0.6702031, -2.287524, 1, 1, 1, 1, 1,
-0.830171, -0.50392, -1.361592, 1, 1, 1, 1, 1,
-0.829017, -0.8312734, -2.270945, 0, 0, 1, 1, 1,
-0.8263103, -0.1128216, -4.006483, 1, 0, 0, 1, 1,
-0.8217596, 0.9556399, -0.5271496, 1, 0, 0, 1, 1,
-0.8156768, -0.9374339, -2.806885, 1, 0, 0, 1, 1,
-0.8144497, -0.8391787, -3.639423, 1, 0, 0, 1, 1,
-0.8086384, 1.481318, -0.9841788, 1, 0, 0, 1, 1,
-0.8071254, 0.6578434, 0.3964656, 0, 0, 0, 1, 1,
-0.8055393, 0.236821, -0.1363975, 0, 0, 0, 1, 1,
-0.8025749, -0.7687954, -2.875962, 0, 0, 0, 1, 1,
-0.7960995, 0.003866896, -1.654975, 0, 0, 0, 1, 1,
-0.7957301, 1.332385, -1.012529, 0, 0, 0, 1, 1,
-0.7867777, -0.04614289, -0.7714855, 0, 0, 0, 1, 1,
-0.7825732, -0.5387942, -2.795926, 0, 0, 0, 1, 1,
-0.775778, 2.002273, 1.596021, 1, 1, 1, 1, 1,
-0.7746204, 0.1003153, -1.56748, 1, 1, 1, 1, 1,
-0.77324, -0.1774354, -3.785903, 1, 1, 1, 1, 1,
-0.7712228, 0.379232, -1.36233, 1, 1, 1, 1, 1,
-0.7710357, -1.037351, -2.133319, 1, 1, 1, 1, 1,
-0.7696561, -0.08398213, -1.655584, 1, 1, 1, 1, 1,
-0.7687807, 1.843861, -1.026179, 1, 1, 1, 1, 1,
-0.7603938, 1.655382, 0.05548236, 1, 1, 1, 1, 1,
-0.7587727, 0.02276074, -0.2199724, 1, 1, 1, 1, 1,
-0.7560312, 1.055005, -0.09619369, 1, 1, 1, 1, 1,
-0.7559008, -0.2071191, -0.7906317, 1, 1, 1, 1, 1,
-0.752563, 0.2988515, -2.452376, 1, 1, 1, 1, 1,
-0.7497031, 0.932223, -1.095841, 1, 1, 1, 1, 1,
-0.7448392, -0.6113886, -1.619809, 1, 1, 1, 1, 1,
-0.7404836, -0.6226606, -1.956327, 1, 1, 1, 1, 1,
-0.7352624, -0.3278189, -2.248996, 0, 0, 1, 1, 1,
-0.7348427, -1.111136, -2.310506, 1, 0, 0, 1, 1,
-0.732814, 0.3723287, -3.508388, 1, 0, 0, 1, 1,
-0.7271518, -0.0371483, -2.23013, 1, 0, 0, 1, 1,
-0.7241303, -1.687801, -1.702205, 1, 0, 0, 1, 1,
-0.7218162, 0.6608269, -3.036202, 1, 0, 0, 1, 1,
-0.7146014, 1.266671, 0.2687339, 0, 0, 0, 1, 1,
-0.7114461, -0.1738786, -1.395067, 0, 0, 0, 1, 1,
-0.7103883, -0.1012078, -2.06212, 0, 0, 0, 1, 1,
-0.7101849, 0.8603973, -0.3705766, 0, 0, 0, 1, 1,
-0.7072342, 1.476643, -0.8119763, 0, 0, 0, 1, 1,
-0.7062792, 0.7864808, -0.4736834, 0, 0, 0, 1, 1,
-0.706069, 0.1660152, -1.587502, 0, 0, 0, 1, 1,
-0.7044497, 0.1290746, -0.7214671, 1, 1, 1, 1, 1,
-0.6974143, -1.291595, -3.901165, 1, 1, 1, 1, 1,
-0.6922347, -0.7402053, -2.275762, 1, 1, 1, 1, 1,
-0.6903347, 0.1850231, -1.12464, 1, 1, 1, 1, 1,
-0.6862617, -1.058112, -2.949784, 1, 1, 1, 1, 1,
-0.6860941, 0.4650102, 0.8240454, 1, 1, 1, 1, 1,
-0.6855159, 0.3097438, -1.542124, 1, 1, 1, 1, 1,
-0.6813287, 0.95926, -1.202183, 1, 1, 1, 1, 1,
-0.6743007, -0.446669, -2.841418, 1, 1, 1, 1, 1,
-0.6716583, 0.1335846, -1.649167, 1, 1, 1, 1, 1,
-0.6575825, -0.5122921, -2.745502, 1, 1, 1, 1, 1,
-0.6501161, 1.024446, 0.4980197, 1, 1, 1, 1, 1,
-0.6475185, 1.635687, 0.4261708, 1, 1, 1, 1, 1,
-0.6466255, -0.1397805, -2.204898, 1, 1, 1, 1, 1,
-0.6404862, 0.2261279, -2.024292, 1, 1, 1, 1, 1,
-0.6348578, 1.037271, -1.439121, 0, 0, 1, 1, 1,
-0.634183, 2.09996, -1.23582, 1, 0, 0, 1, 1,
-0.6322733, 0.1294684, -0.2685364, 1, 0, 0, 1, 1,
-0.6318943, 1.986325, 0.009570972, 1, 0, 0, 1, 1,
-0.6271582, -0.2011653, 0.3099627, 1, 0, 0, 1, 1,
-0.6234973, -1.207965, -3.591589, 1, 0, 0, 1, 1,
-0.6227493, 0.8875117, -1.02295, 0, 0, 0, 1, 1,
-0.6191298, -1.813683, -3.56988, 0, 0, 0, 1, 1,
-0.6166387, -0.3246889, -2.115239, 0, 0, 0, 1, 1,
-0.6159915, -0.5016449, -3.51455, 0, 0, 0, 1, 1,
-0.6134282, -1.813733, -4.068896, 0, 0, 0, 1, 1,
-0.6110076, 0.2091437, -2.778836, 0, 0, 0, 1, 1,
-0.6103333, 0.4627819, -0.04481, 0, 0, 0, 1, 1,
-0.6089479, -1.385155, -3.029345, 1, 1, 1, 1, 1,
-0.5972115, -1.124844, -2.319931, 1, 1, 1, 1, 1,
-0.5934806, -0.9517809, -0.3616054, 1, 1, 1, 1, 1,
-0.5932471, 0.4150604, 0.3068565, 1, 1, 1, 1, 1,
-0.5915384, -0.7503905, -3.379366, 1, 1, 1, 1, 1,
-0.591183, 0.005591764, 0.03213207, 1, 1, 1, 1, 1,
-0.5852911, 0.4712453, -2.542337, 1, 1, 1, 1, 1,
-0.5830374, -0.4782624, -4.126115, 1, 1, 1, 1, 1,
-0.5786056, -1.32136, -1.016427, 1, 1, 1, 1, 1,
-0.5763739, 1.572096, 0.555194, 1, 1, 1, 1, 1,
-0.5759098, 1.95681, 0.7867458, 1, 1, 1, 1, 1,
-0.5755233, -0.4999866, -4.099712, 1, 1, 1, 1, 1,
-0.5718561, 1.091548, -2.400723, 1, 1, 1, 1, 1,
-0.570034, -1.161801, -1.352094, 1, 1, 1, 1, 1,
-0.5665382, -0.9986023, -1.259776, 1, 1, 1, 1, 1,
-0.5643581, -1.668149, -2.578302, 0, 0, 1, 1, 1,
-0.5627991, -1.146966, -2.370121, 1, 0, 0, 1, 1,
-0.5626742, 1.300229, -1.256739, 1, 0, 0, 1, 1,
-0.5613354, -0.7502254, -2.153332, 1, 0, 0, 1, 1,
-0.5559463, -0.2989863, -1.066136, 1, 0, 0, 1, 1,
-0.5542544, 1.566086, 0.0880966, 1, 0, 0, 1, 1,
-0.5518137, 0.976478, 0.07979512, 0, 0, 0, 1, 1,
-0.5502933, 0.5936068, -0.9258242, 0, 0, 0, 1, 1,
-0.5497857, -0.6982825, -1.597524, 0, 0, 0, 1, 1,
-0.5409882, -0.2964161, -2.908703, 0, 0, 0, 1, 1,
-0.538848, 1.48282, -1.27795, 0, 0, 0, 1, 1,
-0.538507, -0.5405065, -2.122449, 0, 0, 0, 1, 1,
-0.537542, -0.2465225, -1.903677, 0, 0, 0, 1, 1,
-0.5368767, 1.691237, -1.030901, 1, 1, 1, 1, 1,
-0.5355403, 0.1912775, -1.070443, 1, 1, 1, 1, 1,
-0.5341674, -1.313477, -2.904982, 1, 1, 1, 1, 1,
-0.5303239, 1.552914, -0.3131396, 1, 1, 1, 1, 1,
-0.5301019, -0.5362325, -2.908179, 1, 1, 1, 1, 1,
-0.5296035, -0.4056584, -3.920435, 1, 1, 1, 1, 1,
-0.5295405, 1.034599, -0.289232, 1, 1, 1, 1, 1,
-0.5282517, -0.6435426, -2.642089, 1, 1, 1, 1, 1,
-0.5264682, -1.089536, -2.937973, 1, 1, 1, 1, 1,
-0.5239295, -0.08447683, -2.509999, 1, 1, 1, 1, 1,
-0.5158308, -1.641441, -2.964195, 1, 1, 1, 1, 1,
-0.5100256, -0.2258489, -0.4595808, 1, 1, 1, 1, 1,
-0.5098099, 1.241248, -1.004536, 1, 1, 1, 1, 1,
-0.5081281, 0.3823448, -2.933943, 1, 1, 1, 1, 1,
-0.5035898, -0.7919871, -1.558138, 1, 1, 1, 1, 1,
-0.5026275, 0.4689104, -0.4120458, 0, 0, 1, 1, 1,
-0.5005682, 0.7644538, 0.1933227, 1, 0, 0, 1, 1,
-0.4959739, 0.9895093, -0.1628808, 1, 0, 0, 1, 1,
-0.4898583, -0.6428368, -3.473377, 1, 0, 0, 1, 1,
-0.4783229, -0.4908569, -1.084049, 1, 0, 0, 1, 1,
-0.4775411, 1.334442, -1.057425, 1, 0, 0, 1, 1,
-0.474403, 0.7078301, -2.453915, 0, 0, 0, 1, 1,
-0.4660726, 0.6207728, -1.187148, 0, 0, 0, 1, 1,
-0.4580953, 0.03222113, -2.137231, 0, 0, 0, 1, 1,
-0.4580538, -1.370155, -3.703755, 0, 0, 0, 1, 1,
-0.4579982, -1.022764, -3.003756, 0, 0, 0, 1, 1,
-0.4557182, 0.2947112, -2.300551, 0, 0, 0, 1, 1,
-0.4471885, 0.3190426, 0.007852113, 0, 0, 0, 1, 1,
-0.4317249, 0.56653, -0.2023453, 1, 1, 1, 1, 1,
-0.4308679, 0.7319751, -0.8344783, 1, 1, 1, 1, 1,
-0.4259265, 1.333269, 0.6955274, 1, 1, 1, 1, 1,
-0.423287, 0.9657903, -0.7451152, 1, 1, 1, 1, 1,
-0.4211818, 1.403088, -1.525612, 1, 1, 1, 1, 1,
-0.4191243, 1.524382, 0.3207181, 1, 1, 1, 1, 1,
-0.4163453, 1.846005, -1.722511, 1, 1, 1, 1, 1,
-0.4157294, 0.8964338, -0.9581864, 1, 1, 1, 1, 1,
-0.4080859, 0.1595038, -1.577599, 1, 1, 1, 1, 1,
-0.4060242, -0.9614925, -3.53477, 1, 1, 1, 1, 1,
-0.4015968, -0.321546, -0.213415, 1, 1, 1, 1, 1,
-0.3925664, 1.356031, 0.5185819, 1, 1, 1, 1, 1,
-0.3886966, -0.8776442, -2.902823, 1, 1, 1, 1, 1,
-0.3855576, 1.244219, 0.1262748, 1, 1, 1, 1, 1,
-0.3840442, -0.8298963, -1.92168, 1, 1, 1, 1, 1,
-0.3805508, -1.733466, -5.251045, 0, 0, 1, 1, 1,
-0.3779053, -1.505633, -1.796345, 1, 0, 0, 1, 1,
-0.374533, 0.9502386, -0.2097795, 1, 0, 0, 1, 1,
-0.3696594, 0.1044847, -3.114166, 1, 0, 0, 1, 1,
-0.3624304, 0.09790885, 0.5915229, 1, 0, 0, 1, 1,
-0.3603796, 1.118268, 0.2496606, 1, 0, 0, 1, 1,
-0.3589393, -0.636853, -3.843584, 0, 0, 0, 1, 1,
-0.3580807, -1.16603, -2.076449, 0, 0, 0, 1, 1,
-0.3580615, -0.3270813, -2.761257, 0, 0, 0, 1, 1,
-0.3544511, -1.166141, -4.512125, 0, 0, 0, 1, 1,
-0.3528399, -2.095821, -3.391503, 0, 0, 0, 1, 1,
-0.350244, 0.1575161, -0.4705964, 0, 0, 0, 1, 1,
-0.3492095, -1.895219, -3.856276, 0, 0, 0, 1, 1,
-0.3488301, -0.2977954, -3.906078, 1, 1, 1, 1, 1,
-0.3443087, 0.7349625, -1.413396, 1, 1, 1, 1, 1,
-0.3426161, -1.113692, -3.629839, 1, 1, 1, 1, 1,
-0.3424751, 0.8503078, -0.9705361, 1, 1, 1, 1, 1,
-0.3400631, -0.493092, -2.326904, 1, 1, 1, 1, 1,
-0.339982, 0.1653087, -0.7167162, 1, 1, 1, 1, 1,
-0.3394002, -2.996944, -3.145092, 1, 1, 1, 1, 1,
-0.3365698, -0.4282811, -3.31129, 1, 1, 1, 1, 1,
-0.3278382, -0.2463469, -1.058767, 1, 1, 1, 1, 1,
-0.3271787, -0.4560045, -1.583546, 1, 1, 1, 1, 1,
-0.3253631, 0.08757649, -0.1577697, 1, 1, 1, 1, 1,
-0.3185615, 0.7462214, -0.1866705, 1, 1, 1, 1, 1,
-0.3150284, -1.75212, -2.47545, 1, 1, 1, 1, 1,
-0.3129267, 0.4548329, -0.6705275, 1, 1, 1, 1, 1,
-0.3121562, 1.317487, -0.7030891, 1, 1, 1, 1, 1,
-0.3048251, 0.4208438, -0.3855313, 0, 0, 1, 1, 1,
-0.3024184, 0.5640901, 0.06969921, 1, 0, 0, 1, 1,
-0.3013351, -1.508718, -2.252473, 1, 0, 0, 1, 1,
-0.301153, 2.377862, 0.2464917, 1, 0, 0, 1, 1,
-0.3000372, -0.4268526, -2.392939, 1, 0, 0, 1, 1,
-0.294194, -0.1536882, -2.457032, 1, 0, 0, 1, 1,
-0.2937637, 0.3509801, 0.5829544, 0, 0, 0, 1, 1,
-0.2908247, 0.6350543, -1.638571, 0, 0, 0, 1, 1,
-0.2879724, 0.403639, 0.9928972, 0, 0, 0, 1, 1,
-0.2831547, -0.3641665, -1.857573, 0, 0, 0, 1, 1,
-0.2807969, -0.181517, -3.279804, 0, 0, 0, 1, 1,
-0.2772614, -1.768297, -2.927492, 0, 0, 0, 1, 1,
-0.2762202, -1.813305, -2.308691, 0, 0, 0, 1, 1,
-0.2754008, -0.863696, -2.64827, 1, 1, 1, 1, 1,
-0.2704475, -1.438582, -1.162892, 1, 1, 1, 1, 1,
-0.2698456, -0.9627454, -2.895984, 1, 1, 1, 1, 1,
-0.2677147, -0.7897128, -3.27616, 1, 1, 1, 1, 1,
-0.2649618, 0.08893642, -0.8661496, 1, 1, 1, 1, 1,
-0.2586495, 1.309358, -0.4660242, 1, 1, 1, 1, 1,
-0.2571044, -1.610173, -3.725972, 1, 1, 1, 1, 1,
-0.2553076, -0.6118271, -1.519856, 1, 1, 1, 1, 1,
-0.2532433, -0.5347183, -2.38522, 1, 1, 1, 1, 1,
-0.2491009, 0.08208954, -1.886287, 1, 1, 1, 1, 1,
-0.2380117, -0.6501206, -5.355738, 1, 1, 1, 1, 1,
-0.2374879, -1.173422, -4.075737, 1, 1, 1, 1, 1,
-0.2332973, 0.1545752, -1.769385, 1, 1, 1, 1, 1,
-0.2328063, -0.2713688, -3.289019, 1, 1, 1, 1, 1,
-0.2262235, 0.5644533, -1.399842, 1, 1, 1, 1, 1,
-0.2259355, 0.4402189, -0.7551355, 0, 0, 1, 1, 1,
-0.2233174, 0.3194609, -2.513037, 1, 0, 0, 1, 1,
-0.222238, 0.165709, -1.957582, 1, 0, 0, 1, 1,
-0.2170588, 1.788279, -0.3510988, 1, 0, 0, 1, 1,
-0.2117735, -0.9866873, -2.240919, 1, 0, 0, 1, 1,
-0.2107918, -0.3869848, -4.622477, 1, 0, 0, 1, 1,
-0.2095304, -0.3596792, -2.875984, 0, 0, 0, 1, 1,
-0.2062142, 0.342488, -1.442309, 0, 0, 0, 1, 1,
-0.2050422, -2.514975, -2.092095, 0, 0, 0, 1, 1,
-0.203747, -0.1399886, -2.538996, 0, 0, 0, 1, 1,
-0.1910369, -0.5477132, -3.018389, 0, 0, 0, 1, 1,
-0.1889289, 2.265977, -0.9184466, 0, 0, 0, 1, 1,
-0.1878677, -0.068381, -3.534219, 0, 0, 0, 1, 1,
-0.1858167, -1.460455, -2.257235, 1, 1, 1, 1, 1,
-0.1839629, -0.4457754, -2.995422, 1, 1, 1, 1, 1,
-0.1791839, -0.2402717, -2.926698, 1, 1, 1, 1, 1,
-0.1698896, 0.2719775, -0.9478707, 1, 1, 1, 1, 1,
-0.1687601, -2.715704, -2.549974, 1, 1, 1, 1, 1,
-0.1579582, -0.5906833, -1.439044, 1, 1, 1, 1, 1,
-0.156335, 0.7237658, -0.6096622, 1, 1, 1, 1, 1,
-0.1560307, 0.6428335, -1.160904, 1, 1, 1, 1, 1,
-0.1543694, 0.9461062, -0.8605947, 1, 1, 1, 1, 1,
-0.154216, 0.5272394, 1.005277, 1, 1, 1, 1, 1,
-0.1541024, -1.216207, -3.217836, 1, 1, 1, 1, 1,
-0.1513976, -0.2021777, -1.805529, 1, 1, 1, 1, 1,
-0.1487356, 1.23691, 0.4174079, 1, 1, 1, 1, 1,
-0.1482917, -0.1609285, -1.271027, 1, 1, 1, 1, 1,
-0.147248, 0.3717434, 1.815797, 1, 1, 1, 1, 1,
-0.1462807, -0.3809126, -1.707038, 0, 0, 1, 1, 1,
-0.1425159, 0.849857, 0.4323981, 1, 0, 0, 1, 1,
-0.1376086, 0.5397332, 1.035318, 1, 0, 0, 1, 1,
-0.1367448, -0.1582244, -2.592558, 1, 0, 0, 1, 1,
-0.1332498, -0.2317772, -2.438397, 1, 0, 0, 1, 1,
-0.1318687, 0.7365106, -1.581665, 1, 0, 0, 1, 1,
-0.1309078, 0.7133831, -0.25905, 0, 0, 0, 1, 1,
-0.1297582, -0.158516, -2.630085, 0, 0, 0, 1, 1,
-0.1252162, 1.219433, 0.654269, 0, 0, 0, 1, 1,
-0.1218746, -0.5709665, -2.214418, 0, 0, 0, 1, 1,
-0.1218618, 1.31721, 1.360834, 0, 0, 0, 1, 1,
-0.1209974, -0.02495641, -1.116167, 0, 0, 0, 1, 1,
-0.117028, 0.7826552, 0.3426976, 0, 0, 0, 1, 1,
-0.1156225, 0.6832368, 0.5187804, 1, 1, 1, 1, 1,
-0.1143781, 0.3983463, 0.7589647, 1, 1, 1, 1, 1,
-0.1134245, 1.212697, -0.5189539, 1, 1, 1, 1, 1,
-0.1123973, -0.4903037, -2.424692, 1, 1, 1, 1, 1,
-0.111906, 0.6973863, -0.02176629, 1, 1, 1, 1, 1,
-0.1095973, 0.3935254, 1.598342, 1, 1, 1, 1, 1,
-0.1079133, 1.122829, 1.96591, 1, 1, 1, 1, 1,
-0.1053763, 0.5169479, -1.561235, 1, 1, 1, 1, 1,
-0.0998549, 1.809914, -0.2946102, 1, 1, 1, 1, 1,
-0.09698805, 0.7921442, -0.5760885, 1, 1, 1, 1, 1,
-0.0955577, 0.2060293, -0.8763274, 1, 1, 1, 1, 1,
-0.09491134, -1.550196, -2.128325, 1, 1, 1, 1, 1,
-0.09349725, -1.913277, -3.596897, 1, 1, 1, 1, 1,
-0.0907789, 1.94887, 0.1171871, 1, 1, 1, 1, 1,
-0.08149505, -0.4043322, -2.904845, 1, 1, 1, 1, 1,
-0.07946075, -0.6513788, -3.416571, 0, 0, 1, 1, 1,
-0.07211049, 1.29164, 0.9622263, 1, 0, 0, 1, 1,
-0.06913316, 1.275226, -0.834586, 1, 0, 0, 1, 1,
-0.06762231, -0.4979817, -3.174811, 1, 0, 0, 1, 1,
-0.06452154, 0.7444955, -0.8597107, 1, 0, 0, 1, 1,
-0.06337854, -0.5221921, -2.474257, 1, 0, 0, 1, 1,
-0.06249998, -1.008422, -4.934331, 0, 0, 0, 1, 1,
-0.05581006, 0.0359475, -0.598321, 0, 0, 0, 1, 1,
-0.05570599, -1.051986, -3.997026, 0, 0, 0, 1, 1,
-0.05091348, -0.7075835, -3.476644, 0, 0, 0, 1, 1,
-0.04178086, 0.1571786, 0.3466026, 0, 0, 0, 1, 1,
-0.04092916, 0.7426417, 1.637813, 0, 0, 0, 1, 1,
-0.03935098, -1.640471, -3.221459, 0, 0, 0, 1, 1,
-0.03189754, 1.719974, -0.559034, 1, 1, 1, 1, 1,
-0.03030131, -0.3238114, -3.167238, 1, 1, 1, 1, 1,
-0.02344361, -0.1843946, -1.701015, 1, 1, 1, 1, 1,
-0.02219809, -1.887519, -3.271295, 1, 1, 1, 1, 1,
-0.01912381, -0.7496817, -3.736613, 1, 1, 1, 1, 1,
-0.01851813, 0.9360902, -0.1903537, 1, 1, 1, 1, 1,
-0.01673688, -1.738359, -3.91802, 1, 1, 1, 1, 1,
-0.01635135, 0.1802276, -0.04144197, 1, 1, 1, 1, 1,
-0.0159131, 1.678165, 0.471938, 1, 1, 1, 1, 1,
-0.01367601, -1.105005, -4.175419, 1, 1, 1, 1, 1,
-0.01043636, 0.1391246, 0.001566309, 1, 1, 1, 1, 1,
-0.008525507, 0.2100638, 1.325051, 1, 1, 1, 1, 1,
-0.005786156, -0.2715507, -2.348601, 1, 1, 1, 1, 1,
-0.004413425, -1.305109, -4.834803, 1, 1, 1, 1, 1,
-0.002141529, 0.6366538, -2.328735, 1, 1, 1, 1, 1,
-0.0004111709, 1.110653, 2.049461, 0, 0, 1, 1, 1,
0.000459646, 0.6977814, 1.106193, 1, 0, 0, 1, 1,
0.004710416, 1.005743, 0.8595821, 1, 0, 0, 1, 1,
0.005551162, 2.062721, 1.9572, 1, 0, 0, 1, 1,
0.006462528, 0.4101744, -0.5641644, 1, 0, 0, 1, 1,
0.007347788, -0.5169088, 4.954603, 1, 0, 0, 1, 1,
0.0101952, 0.1150044, 0.575066, 0, 0, 0, 1, 1,
0.01875588, 1.988084, 2.296342, 0, 0, 0, 1, 1,
0.02073432, -1.027403, 3.167954, 0, 0, 0, 1, 1,
0.02260727, 0.6877024, -0.09333562, 0, 0, 0, 1, 1,
0.02302572, 0.8303219, -1.252127, 0, 0, 0, 1, 1,
0.02735872, 0.3479671, -0.7418627, 0, 0, 0, 1, 1,
0.02856291, -0.680351, 2.220003, 0, 0, 0, 1, 1,
0.02930404, -0.3489046, 2.417258, 1, 1, 1, 1, 1,
0.03712085, 0.3814482, 0.09697974, 1, 1, 1, 1, 1,
0.04218338, 0.06369414, 0.07803173, 1, 1, 1, 1, 1,
0.04667305, 0.6132905, -0.3718051, 1, 1, 1, 1, 1,
0.05108521, -1.491357, 3.282112, 1, 1, 1, 1, 1,
0.05256755, -0.5789984, 4.112723, 1, 1, 1, 1, 1,
0.053234, 1.413808, -1.35675, 1, 1, 1, 1, 1,
0.05604522, 1.176713, 1.568109, 1, 1, 1, 1, 1,
0.0605757, 0.4572608, -0.5819928, 1, 1, 1, 1, 1,
0.0632678, -0.4249472, 2.092388, 1, 1, 1, 1, 1,
0.0685201, 1.357024, 1.476847, 1, 1, 1, 1, 1,
0.07046502, -0.3342251, 3.278326, 1, 1, 1, 1, 1,
0.07461143, 0.2674357, -0.3813757, 1, 1, 1, 1, 1,
0.07464898, -1.257002, 4.560542, 1, 1, 1, 1, 1,
0.07741505, -2.186426, 3.576052, 1, 1, 1, 1, 1,
0.07938337, 0.4065109, 1.215783, 0, 0, 1, 1, 1,
0.07996979, -1.452858, 1.173375, 1, 0, 0, 1, 1,
0.08000397, 0.4912044, -0.3810874, 1, 0, 0, 1, 1,
0.08029659, 0.1875514, -0.4052594, 1, 0, 0, 1, 1,
0.08033851, -0.04065821, 2.952225, 1, 0, 0, 1, 1,
0.08289414, -0.5911567, 3.700608, 1, 0, 0, 1, 1,
0.08377909, -2.07105, 3.250334, 0, 0, 0, 1, 1,
0.0911182, 0.9134518, -0.05336458, 0, 0, 0, 1, 1,
0.09637272, -0.8044028, 4.035263, 0, 0, 0, 1, 1,
0.118325, -1.208324, 3.268411, 0, 0, 0, 1, 1,
0.1204372, 0.6271864, -1.077539, 0, 0, 0, 1, 1,
0.1205071, 0.7831575, -0.06390598, 0, 0, 0, 1, 1,
0.125461, -0.5594326, 2.5619, 0, 0, 0, 1, 1,
0.1259212, -0.5373588, 3.757677, 1, 1, 1, 1, 1,
0.1292536, -0.6488217, 1.498884, 1, 1, 1, 1, 1,
0.1296683, -0.3895274, 3.11661, 1, 1, 1, 1, 1,
0.1307322, 2.171987, -0.1030832, 1, 1, 1, 1, 1,
0.1315335, 0.6632613, 1.463043, 1, 1, 1, 1, 1,
0.1351638, 0.6536161, 1.213838, 1, 1, 1, 1, 1,
0.1428004, -0.9603626, 2.902442, 1, 1, 1, 1, 1,
0.1440753, -2.532389, 2.243346, 1, 1, 1, 1, 1,
0.1454308, 0.7754278, -0.2597808, 1, 1, 1, 1, 1,
0.150071, 0.8604757, 0.802411, 1, 1, 1, 1, 1,
0.1525382, -1.322154, 3.777, 1, 1, 1, 1, 1,
0.1545728, -2.459513, 3.155528, 1, 1, 1, 1, 1,
0.1568986, 0.777444, 1.444872, 1, 1, 1, 1, 1,
0.1570141, 0.4218259, 1.138565, 1, 1, 1, 1, 1,
0.1585642, 0.655621, 0.3986914, 1, 1, 1, 1, 1,
0.1589347, 1.851421, 0.7572514, 0, 0, 1, 1, 1,
0.1762111, -0.2186965, 2.544133, 1, 0, 0, 1, 1,
0.1814224, -0.6468419, 1.620946, 1, 0, 0, 1, 1,
0.1828482, 1.141253, -0.225625, 1, 0, 0, 1, 1,
0.1869188, 0.1128359, 1.443608, 1, 0, 0, 1, 1,
0.1886558, -0.5872868, 4.222806, 1, 0, 0, 1, 1,
0.19536, -1.906615, 4.00668, 0, 0, 0, 1, 1,
0.19668, -1.05394, 2.984685, 0, 0, 0, 1, 1,
0.1971812, 0.8859738, 0.8449764, 0, 0, 0, 1, 1,
0.1994902, -2.282185, 2.422085, 0, 0, 0, 1, 1,
0.199622, -1.021574, 3.406654, 0, 0, 0, 1, 1,
0.2010651, -0.1409615, 1.058105, 0, 0, 0, 1, 1,
0.2022696, 0.9246179, 0.3286612, 0, 0, 0, 1, 1,
0.2048875, -0.1336504, 2.390834, 1, 1, 1, 1, 1,
0.2115895, 0.2882477, 0.84188, 1, 1, 1, 1, 1,
0.2187055, -0.9783284, 2.637963, 1, 1, 1, 1, 1,
0.2225896, -0.7189011, 2.334485, 1, 1, 1, 1, 1,
0.2270558, 0.7220098, 1.255624, 1, 1, 1, 1, 1,
0.2312554, 1.20445, 0.9644768, 1, 1, 1, 1, 1,
0.2395147, -0.4187775, 2.469299, 1, 1, 1, 1, 1,
0.2400158, 0.4875048, 1.308913, 1, 1, 1, 1, 1,
0.2407391, -0.4167247, 1.957542, 1, 1, 1, 1, 1,
0.2427857, -0.5382726, 1.561387, 1, 1, 1, 1, 1,
0.2454196, -0.5224106, 3.126034, 1, 1, 1, 1, 1,
0.2478665, -0.03494108, 1.289915, 1, 1, 1, 1, 1,
0.2512001, 0.09258232, 0.2686024, 1, 1, 1, 1, 1,
0.2528228, 0.7687302, 1.568679, 1, 1, 1, 1, 1,
0.2533557, 1.049354, 0.9075649, 1, 1, 1, 1, 1,
0.2577977, 0.1890483, 2.017482, 0, 0, 1, 1, 1,
0.2645756, 1.896729, 0.4431258, 1, 0, 0, 1, 1,
0.2687781, -0.5070042, 4.199673, 1, 0, 0, 1, 1,
0.2703969, -2.179885, 5.005203, 1, 0, 0, 1, 1,
0.2705682, 0.02357126, 1.74524, 1, 0, 0, 1, 1,
0.2715851, 0.2764816, 1.716302, 1, 0, 0, 1, 1,
0.2886758, 0.8796286, -1.087798, 0, 0, 0, 1, 1,
0.2890664, -0.3242975, 2.697995, 0, 0, 0, 1, 1,
0.3012503, -1.878285, 2.559316, 0, 0, 0, 1, 1,
0.3017733, -0.3780221, 1.586598, 0, 0, 0, 1, 1,
0.3051041, 1.602061, -1.730511, 0, 0, 0, 1, 1,
0.3058605, -0.2614276, 4.374943, 0, 0, 0, 1, 1,
0.3104733, 1.632237, -0.7154446, 0, 0, 0, 1, 1,
0.3118894, 0.08512955, 0.5426728, 1, 1, 1, 1, 1,
0.3121353, -0.8105661, 3.529379, 1, 1, 1, 1, 1,
0.3125232, 0.9290715, -0.110677, 1, 1, 1, 1, 1,
0.3168384, -1.45289, 1.222057, 1, 1, 1, 1, 1,
0.3171991, -0.5748079, 3.566841, 1, 1, 1, 1, 1,
0.318856, 1.502855, -0.5644805, 1, 1, 1, 1, 1,
0.3206258, -0.6902325, 2.724594, 1, 1, 1, 1, 1,
0.3239688, 0.3225935, 2.121733, 1, 1, 1, 1, 1,
0.3269708, -1.596208, 2.889229, 1, 1, 1, 1, 1,
0.3278259, -0.3955899, 1.56176, 1, 1, 1, 1, 1,
0.3331628, 0.4197748, 2.338364, 1, 1, 1, 1, 1,
0.3338365, 0.0009757864, 2.452302, 1, 1, 1, 1, 1,
0.3350518, 0.7526558, 1.630298, 1, 1, 1, 1, 1,
0.3356555, -0.1913685, 3.366354, 1, 1, 1, 1, 1,
0.3372659, 1.339321, -0.8820716, 1, 1, 1, 1, 1,
0.3400832, -0.2511776, 2.121012, 0, 0, 1, 1, 1,
0.3501859, -1.239612, 1.172495, 1, 0, 0, 1, 1,
0.3522051, 0.01249241, 2.015984, 1, 0, 0, 1, 1,
0.3561225, 1.694794, 1.078523, 1, 0, 0, 1, 1,
0.3568904, -1.565599, 1.46579, 1, 0, 0, 1, 1,
0.3596421, -0.8144379, 2.751702, 1, 0, 0, 1, 1,
0.3608345, 1.703678, -0.2265279, 0, 0, 0, 1, 1,
0.3638239, 1.173853, -0.04749304, 0, 0, 0, 1, 1,
0.3668985, 1.068896, 1.745115, 0, 0, 0, 1, 1,
0.3669454, 1.755364, 0.6876196, 0, 0, 0, 1, 1,
0.3678078, -1.589023, 1.446205, 0, 0, 0, 1, 1,
0.3682834, -1.289486, 4.424198, 0, 0, 0, 1, 1,
0.3700988, -0.3181246, 2.28111, 0, 0, 0, 1, 1,
0.3702352, -1.938197, 3.909617, 1, 1, 1, 1, 1,
0.3735972, 1.573925, 0.8514858, 1, 1, 1, 1, 1,
0.3744392, -0.972791, 2.552834, 1, 1, 1, 1, 1,
0.3781474, 0.2196779, 0.5266978, 1, 1, 1, 1, 1,
0.3787385, -0.1277813, 1.838364, 1, 1, 1, 1, 1,
0.3787496, -1.069088, 2.478708, 1, 1, 1, 1, 1,
0.3834127, 2.175189, 0.8524549, 1, 1, 1, 1, 1,
0.3877701, -0.6659783, 2.628958, 1, 1, 1, 1, 1,
0.3925426, -0.9906789, 3.418244, 1, 1, 1, 1, 1,
0.3960268, -0.6217897, 3.415474, 1, 1, 1, 1, 1,
0.3983113, 1.774109, -1.090963, 1, 1, 1, 1, 1,
0.4042258, -0.1486755, 2.030939, 1, 1, 1, 1, 1,
0.4060457, -1.690394, 1.796742, 1, 1, 1, 1, 1,
0.4066274, 1.949396, -0.3888472, 1, 1, 1, 1, 1,
0.4071477, -0.08233033, 2.916765, 1, 1, 1, 1, 1,
0.4106746, 0.8637979, -0.2654582, 0, 0, 1, 1, 1,
0.410705, -1.2287, 2.993284, 1, 0, 0, 1, 1,
0.4120196, 0.01193588, 1.42036, 1, 0, 0, 1, 1,
0.4122457, 0.8609405, 0.764264, 1, 0, 0, 1, 1,
0.4128297, 0.1739333, 2.661066, 1, 0, 0, 1, 1,
0.4161529, -0.672303, 3.304742, 1, 0, 0, 1, 1,
0.4283853, -0.9232574, 3.152462, 0, 0, 0, 1, 1,
0.4309441, -0.6290544, 3.023994, 0, 0, 0, 1, 1,
0.4404219, 0.02011917, 0.4355079, 0, 0, 0, 1, 1,
0.4430123, 1.00273, -1.746523, 0, 0, 0, 1, 1,
0.449077, 1.597133, 0.2434217, 0, 0, 0, 1, 1,
0.4513821, -1.086113, 1.474001, 0, 0, 0, 1, 1,
0.4569706, 0.09826849, 2.400367, 0, 0, 0, 1, 1,
0.4584923, 0.6655546, 1.495335, 1, 1, 1, 1, 1,
0.4597667, 0.7872121, -1.044118, 1, 1, 1, 1, 1,
0.4682167, 0.4101985, 1.923698, 1, 1, 1, 1, 1,
0.4686961, -1.861886, 4.605565, 1, 1, 1, 1, 1,
0.4725605, -0.9059184, 2.425402, 1, 1, 1, 1, 1,
0.4740099, 2.926691, 0.6568317, 1, 1, 1, 1, 1,
0.4741912, 0.7284706, 0.2669068, 1, 1, 1, 1, 1,
0.4751158, 0.6571194, -0.3785413, 1, 1, 1, 1, 1,
0.4759203, 1.418868, 1.078806, 1, 1, 1, 1, 1,
0.4770652, -0.2862113, 0.8364049, 1, 1, 1, 1, 1,
0.4814536, 0.3864122, 0.7843828, 1, 1, 1, 1, 1,
0.4815618, 0.5978413, -0.6880742, 1, 1, 1, 1, 1,
0.4816341, -0.4052803, 0.5713212, 1, 1, 1, 1, 1,
0.4830148, 0.1252968, 0.4907793, 1, 1, 1, 1, 1,
0.4845285, 0.07637859, 1.08278, 1, 1, 1, 1, 1,
0.4852712, 1.476775, 0.8082961, 0, 0, 1, 1, 1,
0.4852967, -0.8263006, 3.307553, 1, 0, 0, 1, 1,
0.4875056, 0.5593052, -0.7683311, 1, 0, 0, 1, 1,
0.4884073, 0.2375142, 0.8129231, 1, 0, 0, 1, 1,
0.4913147, 0.3934137, 0.6110457, 1, 0, 0, 1, 1,
0.4932292, 0.1351853, 2.181115, 1, 0, 0, 1, 1,
0.4968901, -0.6984751, 2.068687, 0, 0, 0, 1, 1,
0.4986686, 2.05561, 0.3656571, 0, 0, 0, 1, 1,
0.499052, -0.454853, 2.054309, 0, 0, 0, 1, 1,
0.5006027, 1.337886, 0.5894181, 0, 0, 0, 1, 1,
0.5009007, -1.013535, 3.725265, 0, 0, 0, 1, 1,
0.5045548, 0.1758538, -0.007506045, 0, 0, 0, 1, 1,
0.504801, -0.1907536, 2.355388, 0, 0, 0, 1, 1,
0.5118657, 0.9615578, -1.665446, 1, 1, 1, 1, 1,
0.5142181, -1.035706, 3.728676, 1, 1, 1, 1, 1,
0.5198554, 0.2907232, 2.323608, 1, 1, 1, 1, 1,
0.5203196, -1.643857, 3.227633, 1, 1, 1, 1, 1,
0.5233704, -0.4457054, 2.10812, 1, 1, 1, 1, 1,
0.5272856, 0.285346, 0.7597752, 1, 1, 1, 1, 1,
0.5288725, -0.981996, 1.881637, 1, 1, 1, 1, 1,
0.5291207, 1.121705, -0.05590919, 1, 1, 1, 1, 1,
0.5303911, -0.3143511, 1.777868, 1, 1, 1, 1, 1,
0.5312188, -2.132007, 2.40595, 1, 1, 1, 1, 1,
0.5351427, 0.6526343, -0.9203291, 1, 1, 1, 1, 1,
0.5371395, 0.08402128, -0.6646851, 1, 1, 1, 1, 1,
0.5379725, 0.9563571, 0.5728634, 1, 1, 1, 1, 1,
0.5397934, 1.077634, -0.9868621, 1, 1, 1, 1, 1,
0.5431737, 0.3428891, 2.629828, 1, 1, 1, 1, 1,
0.5457028, 0.2290947, 0.5157391, 0, 0, 1, 1, 1,
0.5459327, 0.5281219, 0.4166999, 1, 0, 0, 1, 1,
0.5492542, 0.9573457, -0.7775354, 1, 0, 0, 1, 1,
0.5576652, 0.8252854, 0.2598763, 1, 0, 0, 1, 1,
0.5603088, -0.3707361, 3.133158, 1, 0, 0, 1, 1,
0.5657477, 0.3687255, 1.09709, 1, 0, 0, 1, 1,
0.5677124, -0.1802877, 3.288904, 0, 0, 0, 1, 1,
0.5785083, -0.2045018, 3.682705, 0, 0, 0, 1, 1,
0.5816433, 0.02348533, 2.403706, 0, 0, 0, 1, 1,
0.5828775, 1.936833, -0.8963576, 0, 0, 0, 1, 1,
0.5828866, -0.0910669, 1.927807, 0, 0, 0, 1, 1,
0.5835817, -0.05746121, -0.8756608, 0, 0, 0, 1, 1,
0.5844681, -0.1182967, 1.278621, 0, 0, 0, 1, 1,
0.5869951, -1.783047, 3.032746, 1, 1, 1, 1, 1,
0.5892752, 1.387437, 2.279167, 1, 1, 1, 1, 1,
0.5919155, 2.570966, 0.01428512, 1, 1, 1, 1, 1,
0.5996467, -1.204584, 3.006601, 1, 1, 1, 1, 1,
0.6024654, -0.4570667, 1.907216, 1, 1, 1, 1, 1,
0.6098726, -1.806206, 3.386107, 1, 1, 1, 1, 1,
0.6103907, 2.351547, -0.1229257, 1, 1, 1, 1, 1,
0.6129864, 1.419124, -0.8968552, 1, 1, 1, 1, 1,
0.6130193, 0.1736715, -0.6639094, 1, 1, 1, 1, 1,
0.6131094, -0.6347565, 2.457046, 1, 1, 1, 1, 1,
0.6190701, -0.2392409, 1.138253, 1, 1, 1, 1, 1,
0.6244839, 0.3142956, 0.07806471, 1, 1, 1, 1, 1,
0.6259784, -0.9909113, 3.668621, 1, 1, 1, 1, 1,
0.6298286, -1.811379, 3.630852, 1, 1, 1, 1, 1,
0.6310687, -0.3556559, 1.347525, 1, 1, 1, 1, 1,
0.6350862, -1.435157, 4.064562, 0, 0, 1, 1, 1,
0.6471599, -0.5985593, 1.190372, 1, 0, 0, 1, 1,
0.6531208, 1.046325, 0.2937874, 1, 0, 0, 1, 1,
0.6541075, -1.137952, 3.138554, 1, 0, 0, 1, 1,
0.6542757, 0.2118473, 2.073208, 1, 0, 0, 1, 1,
0.6550558, -0.9936167, 1.197704, 1, 0, 0, 1, 1,
0.6571017, 0.03982721, 0.5175474, 0, 0, 0, 1, 1,
0.665933, 1.79296, 0.08646225, 0, 0, 0, 1, 1,
0.6684163, 0.83724, 1.086648, 0, 0, 0, 1, 1,
0.6684924, 1.842051, 0.5011331, 0, 0, 0, 1, 1,
0.6718622, -0.6050671, 0.3211056, 0, 0, 0, 1, 1,
0.6725306, -0.4349477, 1.786287, 0, 0, 0, 1, 1,
0.6735868, -1.116989, 3.017305, 0, 0, 0, 1, 1,
0.674811, -0.5954856, 1.53869, 1, 1, 1, 1, 1,
0.6833293, 0.1745872, 2.232322, 1, 1, 1, 1, 1,
0.6857263, -1.028909, 1.784977, 1, 1, 1, 1, 1,
0.6901363, 0.5161101, 2.2027, 1, 1, 1, 1, 1,
0.6920161, 0.8322797, 0.6576986, 1, 1, 1, 1, 1,
0.6945909, -0.3747518, 1.139948, 1, 1, 1, 1, 1,
0.6954528, -0.6406952, 1.879608, 1, 1, 1, 1, 1,
0.6965928, -1.345346, 2.074695, 1, 1, 1, 1, 1,
0.7031518, 1.823534, -1.833213, 1, 1, 1, 1, 1,
0.704044, 1.523733, 1.132189, 1, 1, 1, 1, 1,
0.7054702, -0.5635772, 1.932336, 1, 1, 1, 1, 1,
0.7060741, 1.009388, -1.193099, 1, 1, 1, 1, 1,
0.7087666, 1.929538, 2.380553, 1, 1, 1, 1, 1,
0.7114099, 1.649233, 0.1584235, 1, 1, 1, 1, 1,
0.7137717, 0.2561139, 0.3167751, 1, 1, 1, 1, 1,
0.7149278, -0.03772672, 0.5193142, 0, 0, 1, 1, 1,
0.7233665, -0.6243896, 1.854013, 1, 0, 0, 1, 1,
0.7278649, -0.2733999, 1.648167, 1, 0, 0, 1, 1,
0.7351103, 0.663982, -1.289335, 1, 0, 0, 1, 1,
0.7358354, 1.107915, 1.893092, 1, 0, 0, 1, 1,
0.7376435, -0.975343, 2.719654, 1, 0, 0, 1, 1,
0.7376891, 0.3869896, 0.5792395, 0, 0, 0, 1, 1,
0.7412134, -0.9583716, 1.717366, 0, 0, 0, 1, 1,
0.7570894, -0.487768, 1.686185, 0, 0, 0, 1, 1,
0.757428, -1.125529, 1.577551, 0, 0, 0, 1, 1,
0.7615649, -0.2803351, 2.020986, 0, 0, 0, 1, 1,
0.7676186, 0.08107554, 2.048219, 0, 0, 0, 1, 1,
0.7680442, 0.5591606, 0.1342217, 0, 0, 0, 1, 1,
0.7712717, -0.5520546, 2.30093, 1, 1, 1, 1, 1,
0.7725326, 2.94346, 0.1829698, 1, 1, 1, 1, 1,
0.7751271, -0.5377124, 0.7807519, 1, 1, 1, 1, 1,
0.7768335, 2.419614, 1.022511, 1, 1, 1, 1, 1,
0.7779121, -0.4345669, 2.352127, 1, 1, 1, 1, 1,
0.7889118, -0.2338829, 3.848552, 1, 1, 1, 1, 1,
0.7911138, 0.4259206, 2.710093, 1, 1, 1, 1, 1,
0.8009006, -0.3789575, 2.024437, 1, 1, 1, 1, 1,
0.8012061, 0.8773342, -0.7811146, 1, 1, 1, 1, 1,
0.8013069, 2.017462, -1.018417, 1, 1, 1, 1, 1,
0.8078288, -0.4122407, 0.7285742, 1, 1, 1, 1, 1,
0.8161197, 1.728993, 2.467216, 1, 1, 1, 1, 1,
0.8166253, -1.106667, 2.318445, 1, 1, 1, 1, 1,
0.8203185, -1.335834, 2.522698, 1, 1, 1, 1, 1,
0.8258577, 0.1839809, 2.176413, 1, 1, 1, 1, 1,
0.8311534, 0.2135095, -1.46158, 0, 0, 1, 1, 1,
0.8331956, 2.163388, -0.03360466, 1, 0, 0, 1, 1,
0.8349391, 0.8068489, 0.4079851, 1, 0, 0, 1, 1,
0.840263, -0.7778994, 0.6192762, 1, 0, 0, 1, 1,
0.852061, -0.7708983, 2.647467, 1, 0, 0, 1, 1,
0.8525191, -1.256611, 2.06601, 1, 0, 0, 1, 1,
0.8544669, -0.1250504, 1.710652, 0, 0, 0, 1, 1,
0.8569053, 1.042702, 0.9565204, 0, 0, 0, 1, 1,
0.8600764, 0.1503232, 1.891075, 0, 0, 0, 1, 1,
0.8608657, -1.290299, 1.320399, 0, 0, 0, 1, 1,
0.8612409, 1.116874, 1.051954, 0, 0, 0, 1, 1,
0.8629895, -2.032679, 1.598427, 0, 0, 0, 1, 1,
0.8657415, -0.8006486, 1.997253, 0, 0, 0, 1, 1,
0.8717241, -0.2176899, 1.716015, 1, 1, 1, 1, 1,
0.8722998, -0.2929437, 0.538489, 1, 1, 1, 1, 1,
0.8740953, 1.186497, 0.0677969, 1, 1, 1, 1, 1,
0.8802136, -0.3779767, 0.3367658, 1, 1, 1, 1, 1,
0.8810883, 0.8750765, -0.5581623, 1, 1, 1, 1, 1,
0.8811588, 0.06356316, 1.484853, 1, 1, 1, 1, 1,
0.8862932, -0.2777684, 3.234077, 1, 1, 1, 1, 1,
0.8914518, 0.307817, 3.638452, 1, 1, 1, 1, 1,
0.8917098, 0.2936334, 1.114997, 1, 1, 1, 1, 1,
0.8996832, 0.8422937, 3.083787, 1, 1, 1, 1, 1,
0.9010467, -0.6144571, 3.455432, 1, 1, 1, 1, 1,
0.9024472, -0.6433527, 3.887641, 1, 1, 1, 1, 1,
0.9036605, 0.6894045, 0.6207101, 1, 1, 1, 1, 1,
0.9069136, -0.4696242, 2.046809, 1, 1, 1, 1, 1,
0.909146, -0.1008, 1.594544, 1, 1, 1, 1, 1,
0.9155967, 0.2329215, 1.585429, 0, 0, 1, 1, 1,
0.9238292, -1.713192, 1.850859, 1, 0, 0, 1, 1,
0.9318405, 0.7776484, 2.933194, 1, 0, 0, 1, 1,
0.9356027, -0.777442, 4.081388, 1, 0, 0, 1, 1,
0.9357592, 1.644428, 0.9124029, 1, 0, 0, 1, 1,
0.938315, -1.228732, 2.86871, 1, 0, 0, 1, 1,
0.9430063, -0.7091781, 1.85476, 0, 0, 0, 1, 1,
0.9433076, 0.3553283, 0.2513983, 0, 0, 0, 1, 1,
0.9453884, 0.1450662, 1.047756, 0, 0, 0, 1, 1,
0.9483348, -0.3578415, 1.048732, 0, 0, 0, 1, 1,
0.9494394, -0.5799105, 0.7031528, 0, 0, 0, 1, 1,
0.9532901, -0.8181388, 3.9538, 0, 0, 0, 1, 1,
0.9542525, -0.6510674, 2.788256, 0, 0, 0, 1, 1,
0.9550514, 1.014572, 0.4222812, 1, 1, 1, 1, 1,
0.9593468, -1.653189, 3.103636, 1, 1, 1, 1, 1,
0.9597589, 0.5379999, 1.352552, 1, 1, 1, 1, 1,
0.961305, 0.8073344, 1.621401, 1, 1, 1, 1, 1,
0.963369, 1.801579, -1.007083, 1, 1, 1, 1, 1,
0.9640183, 0.67063, -0.7906475, 1, 1, 1, 1, 1,
0.9640763, 0.0929395, 0.5560664, 1, 1, 1, 1, 1,
0.9690343, 0.3308242, 2.143888, 1, 1, 1, 1, 1,
0.9825461, 0.5093669, 1.068583, 1, 1, 1, 1, 1,
0.9836817, -0.01263684, 2.534886, 1, 1, 1, 1, 1,
0.987494, 0.7968521, 0.8049793, 1, 1, 1, 1, 1,
0.9876054, -0.3781633, 2.831354, 1, 1, 1, 1, 1,
1.003999, 0.5336693, 1.222624, 1, 1, 1, 1, 1,
1.00639, -0.5385907, -0.06248015, 1, 1, 1, 1, 1,
1.010912, 0.0995796, 1.922029, 1, 1, 1, 1, 1,
1.025628, 0.3577049, -0.04910326, 0, 0, 1, 1, 1,
1.026042, 1.285693, 1.792016, 1, 0, 0, 1, 1,
1.027251, -1.037352, 2.156355, 1, 0, 0, 1, 1,
1.027561, -1.931205, 4.202228, 1, 0, 0, 1, 1,
1.02845, 0.2236367, 0.6728725, 1, 0, 0, 1, 1,
1.030812, 0.9075198, 1.928477, 1, 0, 0, 1, 1,
1.034866, -0.2829321, 2.338852, 0, 0, 0, 1, 1,
1.036443, -0.7428631, 3.066686, 0, 0, 0, 1, 1,
1.044402, -0.6956334, 1.978351, 0, 0, 0, 1, 1,
1.045433, -0.682469, 2.239251, 0, 0, 0, 1, 1,
1.049276, -1.542603, 0.6117416, 0, 0, 0, 1, 1,
1.051642, -0.1588407, 1.311769, 0, 0, 0, 1, 1,
1.05574, 0.3371311, 2.182263, 0, 0, 0, 1, 1,
1.055765, -0.596619, 0.9101358, 1, 1, 1, 1, 1,
1.057281, 0.3760905, -0.586453, 1, 1, 1, 1, 1,
1.079546, 0.747905, 2.621613, 1, 1, 1, 1, 1,
1.087546, -1.826866, 2.616423, 1, 1, 1, 1, 1,
1.090378, -1.913516, 3.451621, 1, 1, 1, 1, 1,
1.100515, 0.02768582, 0.0355591, 1, 1, 1, 1, 1,
1.101712, 0.4695341, 1.874787, 1, 1, 1, 1, 1,
1.104975, -1.555258, 2.423115, 1, 1, 1, 1, 1,
1.107786, -0.5024294, 2.000344, 1, 1, 1, 1, 1,
1.107989, 0.5441376, 1.102979, 1, 1, 1, 1, 1,
1.112022, -0.4785009, 2.66291, 1, 1, 1, 1, 1,
1.120238, -0.4911926, 2.797467, 1, 1, 1, 1, 1,
1.123852, 0.3763267, 1.650062, 1, 1, 1, 1, 1,
1.130919, -0.2817053, 0.3002138, 1, 1, 1, 1, 1,
1.132929, 0.2359818, 1.712205, 1, 1, 1, 1, 1,
1.134622, 0.2078111, 1.425678, 0, 0, 1, 1, 1,
1.140068, -0.9432267, 1.234629, 1, 0, 0, 1, 1,
1.157765, -0.9927382, 1.717929, 1, 0, 0, 1, 1,
1.159113, 1.767672, 1.453049, 1, 0, 0, 1, 1,
1.160038, 0.6506757, -0.3042422, 1, 0, 0, 1, 1,
1.167404, 1.210749, -0.2073615, 1, 0, 0, 1, 1,
1.168355, 0.1475289, 1.238413, 0, 0, 0, 1, 1,
1.169906, 0.4622319, 1.798333, 0, 0, 0, 1, 1,
1.172652, -1.690942, 2.996861, 0, 0, 0, 1, 1,
1.178877, -0.4530099, 1.869447, 0, 0, 0, 1, 1,
1.184182, 0.3175743, 2.227548, 0, 0, 0, 1, 1,
1.188853, -0.3788773, 0.9419588, 0, 0, 0, 1, 1,
1.192925, -0.0787231, 2.188847, 0, 0, 0, 1, 1,
1.201534, 0.07996442, 2.094959, 1, 1, 1, 1, 1,
1.203102, 0.6339489, 1.347626, 1, 1, 1, 1, 1,
1.206165, -0.6092056, 1.753877, 1, 1, 1, 1, 1,
1.207103, -0.5388248, 2.111638, 1, 1, 1, 1, 1,
1.207357, 0.537997, 0.4183983, 1, 1, 1, 1, 1,
1.21838, 0.7607474, -1.721317, 1, 1, 1, 1, 1,
1.2207, 0.04016126, 0.4717041, 1, 1, 1, 1, 1,
1.227512, -0.311717, 1.27707, 1, 1, 1, 1, 1,
1.243819, 0.08851961, 3.12477, 1, 1, 1, 1, 1,
1.244543, -0.5146698, 3.493432, 1, 1, 1, 1, 1,
1.246429, -0.2904046, 2.049313, 1, 1, 1, 1, 1,
1.249316, 0.08811778, 1.911447, 1, 1, 1, 1, 1,
1.25491, -2.026326, 2.820707, 1, 1, 1, 1, 1,
1.268944, -0.9962165, 3.629645, 1, 1, 1, 1, 1,
1.278982, 1.331563, 2.581636, 1, 1, 1, 1, 1,
1.279659, 0.8312759, 2.199795, 0, 0, 1, 1, 1,
1.286277, 0.6247093, 1.920408, 1, 0, 0, 1, 1,
1.305986, -0.1623504, 2.800437, 1, 0, 0, 1, 1,
1.314841, 0.5608817, -0.5559204, 1, 0, 0, 1, 1,
1.316672, -0.19794, 1.860039, 1, 0, 0, 1, 1,
1.316948, -0.7083816, 2.651102, 1, 0, 0, 1, 1,
1.318337, -2.725989, 1.817902, 0, 0, 0, 1, 1,
1.318875, 0.7683342, -1.222475, 0, 0, 0, 1, 1,
1.321258, -1.509073, 2.712944, 0, 0, 0, 1, 1,
1.329197, 0.6826921, 1.078762, 0, 0, 0, 1, 1,
1.329545, 0.9642153, 1.905222, 0, 0, 0, 1, 1,
1.333019, -0.1172951, 1.082888, 0, 0, 0, 1, 1,
1.33534, -1.172035, 1.78749, 0, 0, 0, 1, 1,
1.33765, 1.639496, 0.846973, 1, 1, 1, 1, 1,
1.350816, 0.4278147, 1.883739, 1, 1, 1, 1, 1,
1.363667, 0.9388827, 1.585648, 1, 1, 1, 1, 1,
1.366634, 0.5019473, 1.226864, 1, 1, 1, 1, 1,
1.38518, -0.06606741, 4.122704, 1, 1, 1, 1, 1,
1.402619, 1.789096, 0.2375149, 1, 1, 1, 1, 1,
1.406257, 0.5656792, 1.355382, 1, 1, 1, 1, 1,
1.414944, -0.8378952, 2.891498, 1, 1, 1, 1, 1,
1.419353, -0.5082101, 0.6922878, 1, 1, 1, 1, 1,
1.420613, 1.074155, 1.627944, 1, 1, 1, 1, 1,
1.432319, 1.452956, -0.3143839, 1, 1, 1, 1, 1,
1.438654, -1.495616, 2.881829, 1, 1, 1, 1, 1,
1.439137, 1.007604, 0.8079292, 1, 1, 1, 1, 1,
1.443376, -0.6059474, 1.201415, 1, 1, 1, 1, 1,
1.443534, 0.9336968, 1.340025, 1, 1, 1, 1, 1,
1.447453, 0.3561627, 2.324959, 0, 0, 1, 1, 1,
1.455023, -0.7589291, 0.9986898, 1, 0, 0, 1, 1,
1.470491, -1.681254, 2.291167, 1, 0, 0, 1, 1,
1.474123, 0.5037681, 0.6406333, 1, 0, 0, 1, 1,
1.504624, -0.3706838, 1.620903, 1, 0, 0, 1, 1,
1.506308, 1.495471, 2.547852, 1, 0, 0, 1, 1,
1.515183, 0.6756772, 0.7300124, 0, 0, 0, 1, 1,
1.51833, 0.448614, 0.5606819, 0, 0, 0, 1, 1,
1.531044, -0.8458467, 0.3972714, 0, 0, 0, 1, 1,
1.534544, -0.4206938, 2.208438, 0, 0, 0, 1, 1,
1.536013, -0.4056453, 2.294115, 0, 0, 0, 1, 1,
1.540258, -1.473702, 2.488116, 0, 0, 0, 1, 1,
1.545282, -0.2331967, 1.947951, 0, 0, 0, 1, 1,
1.551653, -0.5942179, 0.8032078, 1, 1, 1, 1, 1,
1.553311, -0.7219753, 2.722305, 1, 1, 1, 1, 1,
1.571123, 0.8400775, 2.562426, 1, 1, 1, 1, 1,
1.590845, 0.1616292, 1.792153, 1, 1, 1, 1, 1,
1.594142, -1.300544, 1.575588, 1, 1, 1, 1, 1,
1.594258, 0.5900393, 1.668428, 1, 1, 1, 1, 1,
1.597133, 1.056393, -0.2952297, 1, 1, 1, 1, 1,
1.6014, 0.5469116, 0.9362953, 1, 1, 1, 1, 1,
1.616505, -1.323831, 2.764668, 1, 1, 1, 1, 1,
1.620484, -0.478633, 2.462928, 1, 1, 1, 1, 1,
1.630903, -0.1189989, 2.482582, 1, 1, 1, 1, 1,
1.642376, -0.9381015, 2.388564, 1, 1, 1, 1, 1,
1.645913, 2.090535, 0.8132669, 1, 1, 1, 1, 1,
1.659531, 1.520904, -0.254583, 1, 1, 1, 1, 1,
1.663378, 0.2433922, 1.385886, 1, 1, 1, 1, 1,
1.665555, -1.423312, 2.179486, 0, 0, 1, 1, 1,
1.670403, 0.113367, 1.168499, 1, 0, 0, 1, 1,
1.701506, -0.9425912, 1.066073, 1, 0, 0, 1, 1,
1.709172, 0.1498598, 3.713121, 1, 0, 0, 1, 1,
1.714849, -1.113191, 1.891852, 1, 0, 0, 1, 1,
1.715124, -0.1939673, 2.028705, 1, 0, 0, 1, 1,
1.71566, -1.577603, 0.5592645, 0, 0, 0, 1, 1,
1.74777, 0.9511432, 0.1642206, 0, 0, 0, 1, 1,
1.757516, 0.5271298, 1.967443, 0, 0, 0, 1, 1,
1.772459, 0.9715947, 2.318032, 0, 0, 0, 1, 1,
1.808314, -0.3852636, 1.00559, 0, 0, 0, 1, 1,
1.814034, 0.324183, 2.081181, 0, 0, 0, 1, 1,
1.856457, 0.5696504, 0.2147025, 0, 0, 0, 1, 1,
1.871487, 0.5962015, -1.0282, 1, 1, 1, 1, 1,
1.877419, -0.5263967, 2.331769, 1, 1, 1, 1, 1,
1.914777, 0.1989152, 2.875801, 1, 1, 1, 1, 1,
1.942906, 1.269804, 1.782174, 1, 1, 1, 1, 1,
1.943934, -0.1623256, 0.5993632, 1, 1, 1, 1, 1,
1.949777, 1.938691, 2.75796, 1, 1, 1, 1, 1,
1.953159, -0.8852905, 0.9997963, 1, 1, 1, 1, 1,
1.955746, -1.110121, 1.597356, 1, 1, 1, 1, 1,
1.973267, 0.3815373, 1.12783, 1, 1, 1, 1, 1,
1.988607, 1.033642, 2.357108, 1, 1, 1, 1, 1,
1.989, 0.3048408, 1.638644, 1, 1, 1, 1, 1,
2.001559, 0.3819311, 2.581887, 1, 1, 1, 1, 1,
2.018714, 0.7619557, 2.087043, 1, 1, 1, 1, 1,
2.043043, 1.033159, 1.573826, 1, 1, 1, 1, 1,
2.049019, 0.1402786, 2.375564, 1, 1, 1, 1, 1,
2.054338, -1.408675, 1.850896, 0, 0, 1, 1, 1,
2.079, 0.5691856, 1.444381, 1, 0, 0, 1, 1,
2.082224, -0.6540435, 5.244146, 1, 0, 0, 1, 1,
2.100428, 0.4735534, 0.6070557, 1, 0, 0, 1, 1,
2.122019, 0.4740936, 1.505997, 1, 0, 0, 1, 1,
2.134837, -0.285945, 3.091409, 1, 0, 0, 1, 1,
2.139985, -0.5478402, 3.165062, 0, 0, 0, 1, 1,
2.157274, 0.8062482, 0.8503493, 0, 0, 0, 1, 1,
2.177314, 1.277719, 1.469234, 0, 0, 0, 1, 1,
2.207641, 1.144884, 1.694626, 0, 0, 0, 1, 1,
2.208586, 0.671088, 0.7721248, 0, 0, 0, 1, 1,
2.212433, -0.2389031, 1.962509, 0, 0, 0, 1, 1,
2.254133, -0.8976325, 1.407195, 0, 0, 0, 1, 1,
2.31769, 2.078047, 1.535208, 1, 1, 1, 1, 1,
2.490411, 1.689525, 1.60126, 1, 1, 1, 1, 1,
2.567636, 1.532349, 1.468443, 1, 1, 1, 1, 1,
2.830656, -0.4152968, 2.437902, 1, 1, 1, 1, 1,
3.087238, 0.5279978, 2.991102, 1, 1, 1, 1, 1,
3.187358, -0.5780913, 1.045701, 1, 1, 1, 1, 1,
3.35972, 0.1866917, 0.6157687, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.536479;
var distance = 33.49648;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.07975149, 0.02674162, 0.05579591 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.49648);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
