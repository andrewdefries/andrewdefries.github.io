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
-3.25265, -0.5907934, -2.265996, 1, 0, 0, 1,
-2.566645, 2.315863, -0.4165671, 1, 0.007843138, 0, 1,
-2.516291, 1.146183, -1.451335, 1, 0.01176471, 0, 1,
-2.46003, -0.1175544, -2.091731, 1, 0.01960784, 0, 1,
-2.422656, -0.4272659, -1.652277, 1, 0.02352941, 0, 1,
-2.304617, 0.9951977, -1.817514, 1, 0.03137255, 0, 1,
-2.186817, -1.909565, -1.771158, 1, 0.03529412, 0, 1,
-2.163073, 0.6178012, -1.532564, 1, 0.04313726, 0, 1,
-2.143719, -0.7024087, -3.809237, 1, 0.04705882, 0, 1,
-2.138561, -2.008945, -3.339387, 1, 0.05490196, 0, 1,
-2.089965, -0.0159098, -2.676344, 1, 0.05882353, 0, 1,
-2.081492, -1.561629, -2.016757, 1, 0.06666667, 0, 1,
-2.078601, 0.9405339, -2.141776, 1, 0.07058824, 0, 1,
-2.022927, -0.1900402, -2.62012, 1, 0.07843138, 0, 1,
-2.015851, -0.008279549, -0.2069381, 1, 0.08235294, 0, 1,
-2.002948, 0.1224319, 0.2008668, 1, 0.09019608, 0, 1,
-1.998275, -0.2720233, -0.430887, 1, 0.09411765, 0, 1,
-1.983019, -0.7808506, -2.168226, 1, 0.1019608, 0, 1,
-1.961603, -0.02250789, -0.92802, 1, 0.1098039, 0, 1,
-1.949511, -0.4072428, -2.189815, 1, 0.1137255, 0, 1,
-1.936999, 0.341319, -1.737262, 1, 0.1215686, 0, 1,
-1.921538, 1.512435, -1.203718, 1, 0.1254902, 0, 1,
-1.916192, -2.412513, -2.705582, 1, 0.1333333, 0, 1,
-1.886276, -0.2223389, -2.364126, 1, 0.1372549, 0, 1,
-1.881895, -1.153351, -1.319719, 1, 0.145098, 0, 1,
-1.876537, -1.951335, -0.852409, 1, 0.1490196, 0, 1,
-1.855073, -0.1834467, -0.8799196, 1, 0.1568628, 0, 1,
-1.852825, -0.3932219, -1.509621, 1, 0.1607843, 0, 1,
-1.852751, -0.646381, -1.598124, 1, 0.1686275, 0, 1,
-1.847449, 1.404813, -1.839632, 1, 0.172549, 0, 1,
-1.827691, 0.3461066, -2.487209, 1, 0.1803922, 0, 1,
-1.796972, 1.282542, -0.1115211, 1, 0.1843137, 0, 1,
-1.781064, -0.0728741, -0.1438624, 1, 0.1921569, 0, 1,
-1.777652, -0.5017152, -1.718069, 1, 0.1960784, 0, 1,
-1.776487, -0.08165384, 0.5902137, 1, 0.2039216, 0, 1,
-1.761861, -0.3080204, -1.436581, 1, 0.2117647, 0, 1,
-1.759719, 0.2496469, -2.113074, 1, 0.2156863, 0, 1,
-1.756623, -0.4798218, -2.105128, 1, 0.2235294, 0, 1,
-1.739502, -0.05095891, -2.467933, 1, 0.227451, 0, 1,
-1.738516, -1.051178, -2.601501, 1, 0.2352941, 0, 1,
-1.730246, 0.03188264, -1.061969, 1, 0.2392157, 0, 1,
-1.729709, 1.239829, -0.4230117, 1, 0.2470588, 0, 1,
-1.715614, 2.110165, -1.336116, 1, 0.2509804, 0, 1,
-1.682668, 0.8679369, -2.050526, 1, 0.2588235, 0, 1,
-1.675419, -0.5796198, 0.9968209, 1, 0.2627451, 0, 1,
-1.673057, -1.074656, -3.34723, 1, 0.2705882, 0, 1,
-1.67028, 1.507101, -0.9887942, 1, 0.2745098, 0, 1,
-1.663883, -0.2841513, -3.924962, 1, 0.282353, 0, 1,
-1.659632, 0.3544924, -1.243858, 1, 0.2862745, 0, 1,
-1.658627, 1.121886, -1.707315, 1, 0.2941177, 0, 1,
-1.657838, 0.4519737, -2.042317, 1, 0.3019608, 0, 1,
-1.654773, -1.496343, -2.917798, 1, 0.3058824, 0, 1,
-1.653103, -0.5115808, 0.4992338, 1, 0.3137255, 0, 1,
-1.64515, -2.163425, -5.528101, 1, 0.3176471, 0, 1,
-1.618919, 0.409948, -0.9527995, 1, 0.3254902, 0, 1,
-1.616567, -0.4866217, -3.151801, 1, 0.3294118, 0, 1,
-1.601332, 0.1173442, -3.629847, 1, 0.3372549, 0, 1,
-1.577063, 1.403872, -0.03186076, 1, 0.3411765, 0, 1,
-1.561697, -1.455851, -2.423928, 1, 0.3490196, 0, 1,
-1.561499, -1.79459, -1.04109, 1, 0.3529412, 0, 1,
-1.560484, -0.430465, -1.746436, 1, 0.3607843, 0, 1,
-1.558903, -0.1064208, -1.976873, 1, 0.3647059, 0, 1,
-1.558509, -0.2280357, -1.423838, 1, 0.372549, 0, 1,
-1.555468, -0.586783, -0.8039793, 1, 0.3764706, 0, 1,
-1.552134, 1.508115, -1.242703, 1, 0.3843137, 0, 1,
-1.550049, 0.4857558, -1.254328, 1, 0.3882353, 0, 1,
-1.530182, -0.2963747, 0.3972328, 1, 0.3960784, 0, 1,
-1.508192, -0.6526268, -2.981869, 1, 0.4039216, 0, 1,
-1.504875, -0.8829127, -1.627437, 1, 0.4078431, 0, 1,
-1.487056, 0.3934256, -1.851593, 1, 0.4156863, 0, 1,
-1.486531, -0.257471, -1.239606, 1, 0.4196078, 0, 1,
-1.473285, -0.7176442, -1.753006, 1, 0.427451, 0, 1,
-1.469112, 0.607105, -3.900982, 1, 0.4313726, 0, 1,
-1.45739, -0.3774237, -2.816806, 1, 0.4392157, 0, 1,
-1.448353, -0.2485884, -1.71752, 1, 0.4431373, 0, 1,
-1.432805, 0.2550946, -1.738681, 1, 0.4509804, 0, 1,
-1.430295, 0.7647734, 0.7441517, 1, 0.454902, 0, 1,
-1.430263, -0.9250954, -2.718873, 1, 0.4627451, 0, 1,
-1.428711, -0.8752857, -1.017115, 1, 0.4666667, 0, 1,
-1.425802, 0.1400081, -1.776138, 1, 0.4745098, 0, 1,
-1.422656, 0.857777, -1.020576, 1, 0.4784314, 0, 1,
-1.416088, 0.8527275, -1.784219, 1, 0.4862745, 0, 1,
-1.400457, -0.3176422, -0.8872021, 1, 0.4901961, 0, 1,
-1.390957, 0.8282885, -0.7659684, 1, 0.4980392, 0, 1,
-1.363289, -0.4404293, -1.557264, 1, 0.5058824, 0, 1,
-1.361214, 0.5870234, -1.687407, 1, 0.509804, 0, 1,
-1.343145, 0.08775564, -1.835778, 1, 0.5176471, 0, 1,
-1.334733, 0.830587, -2.327802, 1, 0.5215687, 0, 1,
-1.31924, -0.6028168, -1.733224, 1, 0.5294118, 0, 1,
-1.312712, -1.59882, -2.670622, 1, 0.5333334, 0, 1,
-1.312202, 0.8906468, -0.9205106, 1, 0.5411765, 0, 1,
-1.308374, -0.02556741, -1.384071, 1, 0.5450981, 0, 1,
-1.307254, -0.03908304, -2.386964, 1, 0.5529412, 0, 1,
-1.302683, 1.145256, -0.8159166, 1, 0.5568628, 0, 1,
-1.296272, 1.437763, -0.1973463, 1, 0.5647059, 0, 1,
-1.291535, 0.8703194, -0.8433766, 1, 0.5686275, 0, 1,
-1.271829, -1.288624, -3.186704, 1, 0.5764706, 0, 1,
-1.248997, 0.6806861, -1.522399, 1, 0.5803922, 0, 1,
-1.244463, -1.046871, -2.599665, 1, 0.5882353, 0, 1,
-1.242853, 1.873179, -0.1105644, 1, 0.5921569, 0, 1,
-1.240734, 1.036152, 1.319057, 1, 0.6, 0, 1,
-1.239411, 1.747475, -1.028323, 1, 0.6078432, 0, 1,
-1.236284, 0.007422531, -2.457978, 1, 0.6117647, 0, 1,
-1.233715, -0.3885067, -0.504328, 1, 0.6196079, 0, 1,
-1.232067, 1.83695, 0.1763673, 1, 0.6235294, 0, 1,
-1.224316, -2.089534, -1.250746, 1, 0.6313726, 0, 1,
-1.215646, -1.216685, -3.09726, 1, 0.6352941, 0, 1,
-1.207172, -0.4432008, -0.2065937, 1, 0.6431373, 0, 1,
-1.202582, -0.7603474, -2.12322, 1, 0.6470588, 0, 1,
-1.188753, -1.321862, -1.683033, 1, 0.654902, 0, 1,
-1.181006, -2.116574, -3.869299, 1, 0.6588235, 0, 1,
-1.177347, -1.639799, -1.540007, 1, 0.6666667, 0, 1,
-1.17662, 1.22353, -1.130753, 1, 0.6705883, 0, 1,
-1.173932, 0.2850164, -2.896681, 1, 0.6784314, 0, 1,
-1.173547, -0.7679639, -1.899243, 1, 0.682353, 0, 1,
-1.172993, 0.677232, -2.120125, 1, 0.6901961, 0, 1,
-1.166433, 0.2742835, -1.245121, 1, 0.6941177, 0, 1,
-1.163875, 0.5134016, -1.168135, 1, 0.7019608, 0, 1,
-1.163613, 1.299446, -1.035251, 1, 0.7098039, 0, 1,
-1.163124, -0.03371089, -1.901511, 1, 0.7137255, 0, 1,
-1.157306, -0.7245577, -3.04096, 1, 0.7215686, 0, 1,
-1.152862, -1.284296, -0.6500069, 1, 0.7254902, 0, 1,
-1.148819, 0.8480932, -1.046569, 1, 0.7333333, 0, 1,
-1.148168, 1.893567, 0.5838498, 1, 0.7372549, 0, 1,
-1.14114, -0.2339596, -0.9153913, 1, 0.7450981, 0, 1,
-1.126581, -0.1760097, -1.885811, 1, 0.7490196, 0, 1,
-1.118253, 0.8173921, -0.9501878, 1, 0.7568628, 0, 1,
-1.117482, 1.072055, -1.7438, 1, 0.7607843, 0, 1,
-1.113304, -1.714451, -2.44159, 1, 0.7686275, 0, 1,
-1.107162, -0.1888124, -1.968839, 1, 0.772549, 0, 1,
-1.102333, -0.05930922, -0.7741625, 1, 0.7803922, 0, 1,
-1.099076, -1.629731, -2.833708, 1, 0.7843137, 0, 1,
-1.098843, 1.712621, -1.162654, 1, 0.7921569, 0, 1,
-1.090913, -1.113383, -2.813714, 1, 0.7960784, 0, 1,
-1.088239, -0.9783882, -1.550782, 1, 0.8039216, 0, 1,
-1.08506, -0.7835703, -2.637096, 1, 0.8117647, 0, 1,
-1.082847, 1.072898, -1.070657, 1, 0.8156863, 0, 1,
-1.082635, 0.08825421, -0.9376183, 1, 0.8235294, 0, 1,
-1.080097, 0.116745, -1.939136, 1, 0.827451, 0, 1,
-1.077962, -0.8778333, -2.01463, 1, 0.8352941, 0, 1,
-1.077736, 0.2278975, -0.6003084, 1, 0.8392157, 0, 1,
-1.07165, 1.028676, 0.8080329, 1, 0.8470588, 0, 1,
-1.066016, -1.755564, -2.760169, 1, 0.8509804, 0, 1,
-1.062925, -1.65104, -1.172974, 1, 0.8588235, 0, 1,
-1.062638, 0.2602397, -2.001361, 1, 0.8627451, 0, 1,
-1.061818, -0.2503757, -0.878082, 1, 0.8705882, 0, 1,
-1.047542, -0.7059397, -3.111836, 1, 0.8745098, 0, 1,
-1.047535, 0.5134734, -1.356921, 1, 0.8823529, 0, 1,
-1.044845, 1.884274, -0.8171512, 1, 0.8862745, 0, 1,
-1.042108, -0.7269559, -2.487342, 1, 0.8941177, 0, 1,
-1.037977, 0.3093517, -2.277879, 1, 0.8980392, 0, 1,
-1.035584, 1.309681, -2.073036, 1, 0.9058824, 0, 1,
-1.032115, 0.4239586, -2.302223, 1, 0.9137255, 0, 1,
-1.03166, 1.769637, -0.781962, 1, 0.9176471, 0, 1,
-1.025315, -0.9915712, -0.1632092, 1, 0.9254902, 0, 1,
-1.025114, 1.761942, -0.2876957, 1, 0.9294118, 0, 1,
-1.02267, -0.01652652, 0.2393604, 1, 0.9372549, 0, 1,
-1.006921, -0.1078755, -2.205383, 1, 0.9411765, 0, 1,
-0.9999515, -1.923351, -2.728552, 1, 0.9490196, 0, 1,
-0.9973371, -0.4890281, -2.553967, 1, 0.9529412, 0, 1,
-0.991922, -2.010633, -4.213921, 1, 0.9607843, 0, 1,
-0.9835169, -0.5104343, -0.7895297, 1, 0.9647059, 0, 1,
-0.9798664, 1.554836, 0.5289428, 1, 0.972549, 0, 1,
-0.9785503, -0.3332005, -4.354027, 1, 0.9764706, 0, 1,
-0.9722037, -1.404451, -3.727342, 1, 0.9843137, 0, 1,
-0.9716699, 0.2930151, 0.2418511, 1, 0.9882353, 0, 1,
-0.9710376, -0.6784562, -0.7423905, 1, 0.9960784, 0, 1,
-0.968708, 0.2557752, -0.3754953, 0.9960784, 1, 0, 1,
-0.9662649, 0.4644761, 0.2120846, 0.9921569, 1, 0, 1,
-0.9549499, 2.324924, 1.423715, 0.9843137, 1, 0, 1,
-0.9507851, -0.4895874, -2.02254, 0.9803922, 1, 0, 1,
-0.9503089, -0.2779549, -1.664278, 0.972549, 1, 0, 1,
-0.948359, 1.27189, -0.1781879, 0.9686275, 1, 0, 1,
-0.9414588, -0.6159642, -1.126605, 0.9607843, 1, 0, 1,
-0.932039, 0.8029889, 0.1358204, 0.9568627, 1, 0, 1,
-0.9300443, 1.820001, -1.051268, 0.9490196, 1, 0, 1,
-0.9251534, 0.6482222, -0.3100866, 0.945098, 1, 0, 1,
-0.9175341, 0.1566715, -2.153864, 0.9372549, 1, 0, 1,
-0.9164482, -0.4991477, -3.185669, 0.9333333, 1, 0, 1,
-0.9126024, -1.084147, -1.979598, 0.9254902, 1, 0, 1,
-0.9114821, 0.1993348, -3.244078, 0.9215686, 1, 0, 1,
-0.9107738, 0.2746247, -1.404949, 0.9137255, 1, 0, 1,
-0.908103, 0.1367471, 0.1071961, 0.9098039, 1, 0, 1,
-0.9073626, -0.7679108, -1.439762, 0.9019608, 1, 0, 1,
-0.9052154, 0.5349119, -0.2549939, 0.8941177, 1, 0, 1,
-0.8975652, -0.7154915, -1.561575, 0.8901961, 1, 0, 1,
-0.8918193, 1.304111, 0.361532, 0.8823529, 1, 0, 1,
-0.8909615, 1.838166, -0.4388214, 0.8784314, 1, 0, 1,
-0.8906696, -0.7276857, -2.437793, 0.8705882, 1, 0, 1,
-0.8891814, 0.8422062, -0.2585609, 0.8666667, 1, 0, 1,
-0.8884705, -0.6601949, -1.651484, 0.8588235, 1, 0, 1,
-0.8847228, -0.2398296, -2.501689, 0.854902, 1, 0, 1,
-0.8820036, -0.4560413, -4.418542, 0.8470588, 1, 0, 1,
-0.878432, 0.352614, -2.725308, 0.8431373, 1, 0, 1,
-0.8612688, -3.60747, -2.888811, 0.8352941, 1, 0, 1,
-0.8569257, 1.55011, -1.357768, 0.8313726, 1, 0, 1,
-0.850496, -0.5165964, -3.652491, 0.8235294, 1, 0, 1,
-0.8490607, -0.07194886, -1.418718, 0.8196079, 1, 0, 1,
-0.8477719, -0.1778796, -2.574293, 0.8117647, 1, 0, 1,
-0.8415495, 0.6053813, -2.165571, 0.8078431, 1, 0, 1,
-0.8398911, 0.4318914, -2.033938, 0.8, 1, 0, 1,
-0.839375, -0.718392, -0.8673145, 0.7921569, 1, 0, 1,
-0.8326064, -0.2307535, -2.500146, 0.7882353, 1, 0, 1,
-0.8310502, 1.01366, -0.4721553, 0.7803922, 1, 0, 1,
-0.8306008, 0.2859543, -0.2081983, 0.7764706, 1, 0, 1,
-0.828469, -0.3208038, -0.6969952, 0.7686275, 1, 0, 1,
-0.8173817, -0.7584851, -1.392648, 0.7647059, 1, 0, 1,
-0.8155014, -0.7551155, -3.842753, 0.7568628, 1, 0, 1,
-0.8079737, -0.5856485, -4.81537, 0.7529412, 1, 0, 1,
-0.8077175, 0.9485914, 0.4360432, 0.7450981, 1, 0, 1,
-0.805146, -0.3440347, -2.919978, 0.7411765, 1, 0, 1,
-0.805034, 0.04335019, -1.990639, 0.7333333, 1, 0, 1,
-0.8046581, 0.3235498, -1.016596, 0.7294118, 1, 0, 1,
-0.8039475, 0.8121459, 0.6376907, 0.7215686, 1, 0, 1,
-0.8028268, -0.3899733, -2.801013, 0.7176471, 1, 0, 1,
-0.8026121, 0.04838711, -0.9660031, 0.7098039, 1, 0, 1,
-0.8013006, -0.3234071, -2.491601, 0.7058824, 1, 0, 1,
-0.7997305, -1.115771, -2.201649, 0.6980392, 1, 0, 1,
-0.7988521, -1.232433, -1.557211, 0.6901961, 1, 0, 1,
-0.7965068, 0.5398909, -1.239953, 0.6862745, 1, 0, 1,
-0.796486, 0.3304046, -2.07159, 0.6784314, 1, 0, 1,
-0.7964538, -0.8880798, -2.273406, 0.6745098, 1, 0, 1,
-0.790176, 0.8945366, 0.6457717, 0.6666667, 1, 0, 1,
-0.7844808, 1.092622, 0.0680578, 0.6627451, 1, 0, 1,
-0.7840464, 1.424614, -0.4009252, 0.654902, 1, 0, 1,
-0.7664359, 0.721053, 1.655645, 0.6509804, 1, 0, 1,
-0.7586951, 0.2069849, -0.8157098, 0.6431373, 1, 0, 1,
-0.7559194, -2.051042, -1.388205, 0.6392157, 1, 0, 1,
-0.749917, -1.5009, -1.532254, 0.6313726, 1, 0, 1,
-0.743575, 1.951299, 0.740285, 0.627451, 1, 0, 1,
-0.7404937, 0.5595708, -1.716972, 0.6196079, 1, 0, 1,
-0.7333744, 0.5469295, 0.3191886, 0.6156863, 1, 0, 1,
-0.7311844, -1.214301, -4.666513, 0.6078432, 1, 0, 1,
-0.7207777, 0.7987639, -0.8834944, 0.6039216, 1, 0, 1,
-0.7194886, -1.030336, -3.395442, 0.5960785, 1, 0, 1,
-0.7188389, -0.3792987, -1.586431, 0.5882353, 1, 0, 1,
-0.7184309, 1.834495, -2.480325, 0.5843138, 1, 0, 1,
-0.7112076, 0.3035682, 0.1727567, 0.5764706, 1, 0, 1,
-0.7111147, 1.336073, 0.1624349, 0.572549, 1, 0, 1,
-0.7090368, -0.2484317, -2.623139, 0.5647059, 1, 0, 1,
-0.7074146, 1.064019, -1.28087, 0.5607843, 1, 0, 1,
-0.699505, 0.3119659, 0.4491939, 0.5529412, 1, 0, 1,
-0.6966681, -0.6160569, -2.689523, 0.5490196, 1, 0, 1,
-0.6965738, -1.135513, -2.128175, 0.5411765, 1, 0, 1,
-0.6965438, 1.562515, -1.480561, 0.5372549, 1, 0, 1,
-0.6955047, 0.1316157, -0.4331879, 0.5294118, 1, 0, 1,
-0.6953673, -0.8128359, -1.903409, 0.5254902, 1, 0, 1,
-0.6863089, -1.105841, -4.486428, 0.5176471, 1, 0, 1,
-0.6826233, -0.5851503, -1.50427, 0.5137255, 1, 0, 1,
-0.6807558, 1.083028, -0.1446239, 0.5058824, 1, 0, 1,
-0.6747909, -0.6368782, -4.397424, 0.5019608, 1, 0, 1,
-0.6701285, -0.4956713, -3.630858, 0.4941176, 1, 0, 1,
-0.6668975, -1.369926, -1.250603, 0.4862745, 1, 0, 1,
-0.6627302, 0.5099115, -1.635189, 0.4823529, 1, 0, 1,
-0.6507859, 0.223671, -1.513139, 0.4745098, 1, 0, 1,
-0.6474259, -0.6428267, -1.44958, 0.4705882, 1, 0, 1,
-0.6459959, 0.1883608, -2.940901, 0.4627451, 1, 0, 1,
-0.6456378, -0.1437515, -2.136818, 0.4588235, 1, 0, 1,
-0.6380992, 0.0454428, -2.094819, 0.4509804, 1, 0, 1,
-0.635631, 1.143565, -0.4669742, 0.4470588, 1, 0, 1,
-0.6261486, -0.5256532, -2.894762, 0.4392157, 1, 0, 1,
-0.6258179, 0.9803675, -2.12708, 0.4352941, 1, 0, 1,
-0.6234028, 1.184317, -0.3542017, 0.427451, 1, 0, 1,
-0.620103, -2.107374, -4.784686, 0.4235294, 1, 0, 1,
-0.6169605, -1.731636, -2.78913, 0.4156863, 1, 0, 1,
-0.612124, 0.5093701, 0.5295983, 0.4117647, 1, 0, 1,
-0.6118218, -0.07106412, -1.954951, 0.4039216, 1, 0, 1,
-0.6115679, -1.655734, -2.749943, 0.3960784, 1, 0, 1,
-0.6089053, 0.03741409, -1.272299, 0.3921569, 1, 0, 1,
-0.6075959, 1.866142, -0.2158195, 0.3843137, 1, 0, 1,
-0.6069, 0.816704, -1.638581, 0.3803922, 1, 0, 1,
-0.603334, 1.408521, 0.7220593, 0.372549, 1, 0, 1,
-0.6031407, 0.9732236, -1.302469, 0.3686275, 1, 0, 1,
-0.6010023, -0.6467569, -1.595359, 0.3607843, 1, 0, 1,
-0.5996253, -2.020208, -3.654493, 0.3568628, 1, 0, 1,
-0.5975906, 1.105945, -0.9696389, 0.3490196, 1, 0, 1,
-0.5972115, -0.7747903, -3.681041, 0.345098, 1, 0, 1,
-0.5786126, 0.8769931, -0.2143354, 0.3372549, 1, 0, 1,
-0.5771024, -0.2320461, -1.747005, 0.3333333, 1, 0, 1,
-0.5680937, -0.05422658, -1.03016, 0.3254902, 1, 0, 1,
-0.566478, -1.262237, -2.242769, 0.3215686, 1, 0, 1,
-0.5655022, -0.4530473, -2.172931, 0.3137255, 1, 0, 1,
-0.5628278, -0.8315264, -4.370697, 0.3098039, 1, 0, 1,
-0.5575616, -0.2298324, -1.428018, 0.3019608, 1, 0, 1,
-0.5553039, 0.972225, -0.3488092, 0.2941177, 1, 0, 1,
-0.5545958, -0.3913198, -0.5283682, 0.2901961, 1, 0, 1,
-0.550086, -0.3995795, -4.448524, 0.282353, 1, 0, 1,
-0.5497584, -0.2713305, -2.254034, 0.2784314, 1, 0, 1,
-0.5411007, -0.09069457, -0.2352867, 0.2705882, 1, 0, 1,
-0.5395066, 0.7795269, -0.2774307, 0.2666667, 1, 0, 1,
-0.5391623, -0.586352, -2.80233, 0.2588235, 1, 0, 1,
-0.5390639, 2.19929, -2.157245, 0.254902, 1, 0, 1,
-0.5377542, -1.220617, -2.38894, 0.2470588, 1, 0, 1,
-0.5342597, -1.72493, -1.876858, 0.2431373, 1, 0, 1,
-0.5297322, -0.2383372, -4.5372, 0.2352941, 1, 0, 1,
-0.5273434, 1.928082, 0.9285273, 0.2313726, 1, 0, 1,
-0.5260666, -1.325708, -2.245795, 0.2235294, 1, 0, 1,
-0.5193778, 0.3908147, -3.057742, 0.2196078, 1, 0, 1,
-0.5184292, 0.305816, -0.05153548, 0.2117647, 1, 0, 1,
-0.5117327, -0.63472, -1.935041, 0.2078431, 1, 0, 1,
-0.5103233, 1.137606, 0.7132446, 0.2, 1, 0, 1,
-0.5099099, -1.185188, -3.865031, 0.1921569, 1, 0, 1,
-0.5038437, 0.7100649, 0.7520012, 0.1882353, 1, 0, 1,
-0.5018013, -1.270298, -1.646418, 0.1803922, 1, 0, 1,
-0.4978439, -1.912814, -1.950912, 0.1764706, 1, 0, 1,
-0.4963863, 0.4461411, -1.164761, 0.1686275, 1, 0, 1,
-0.4883524, -1.545716, -1.781151, 0.1647059, 1, 0, 1,
-0.4879995, 0.8824395, -1.006135, 0.1568628, 1, 0, 1,
-0.4852165, 1.119703, -0.4392689, 0.1529412, 1, 0, 1,
-0.4802375, -0.4613301, -3.051792, 0.145098, 1, 0, 1,
-0.4767846, -0.1743591, -2.171596, 0.1411765, 1, 0, 1,
-0.4738812, 0.4345864, -1.773046, 0.1333333, 1, 0, 1,
-0.4626572, 0.3117941, -0.6585406, 0.1294118, 1, 0, 1,
-0.4539139, -1.488561, -1.651565, 0.1215686, 1, 0, 1,
-0.4507184, -0.01077912, -0.3946965, 0.1176471, 1, 0, 1,
-0.4500566, 0.5117251, -1.014277, 0.1098039, 1, 0, 1,
-0.4492659, -0.1368005, -1.029227, 0.1058824, 1, 0, 1,
-0.4487348, 0.8278654, -2.049294, 0.09803922, 1, 0, 1,
-0.4466735, -0.3917444, -0.3220486, 0.09019608, 1, 0, 1,
-0.4461719, -1.543611, -4.151917, 0.08627451, 1, 0, 1,
-0.4442841, 0.8194005, -0.3813008, 0.07843138, 1, 0, 1,
-0.441188, 0.6410922, -1.47303, 0.07450981, 1, 0, 1,
-0.4398793, 1.276573, -1.293542, 0.06666667, 1, 0, 1,
-0.43947, 0.6284345, 0.652752, 0.0627451, 1, 0, 1,
-0.4364217, 0.0240426, -0.6129071, 0.05490196, 1, 0, 1,
-0.435733, 0.2359007, -1.595115, 0.05098039, 1, 0, 1,
-0.4356767, 1.198107, -1.637771, 0.04313726, 1, 0, 1,
-0.4320866, 0.447449, -1.728962, 0.03921569, 1, 0, 1,
-0.4275464, -2.378058, -3.671345, 0.03137255, 1, 0, 1,
-0.422772, -1.38957, -2.762949, 0.02745098, 1, 0, 1,
-0.4217915, -0.7203729, -3.676569, 0.01960784, 1, 0, 1,
-0.4172071, 0.7170691, -0.5221136, 0.01568628, 1, 0, 1,
-0.4154187, -0.3667416, -1.159917, 0.007843138, 1, 0, 1,
-0.4125439, -0.184241, -1.385386, 0.003921569, 1, 0, 1,
-0.4117528, -0.8460174, -3.636381, 0, 1, 0.003921569, 1,
-0.4113027, 0.8564225, -0.9050305, 0, 1, 0.01176471, 1,
-0.409633, -0.807879, -3.933321, 0, 1, 0.01568628, 1,
-0.4088546, -0.7791106, -2.820537, 0, 1, 0.02352941, 1,
-0.4069701, 1.815818, -0.06588008, 0, 1, 0.02745098, 1,
-0.4058525, 0.9616749, -0.03190859, 0, 1, 0.03529412, 1,
-0.404864, 0.5249813, -0.5809979, 0, 1, 0.03921569, 1,
-0.4036934, 0.2607204, 0.7304257, 0, 1, 0.04705882, 1,
-0.4024787, -0.8606013, -4.078031, 0, 1, 0.05098039, 1,
-0.4003021, 1.740119, -2.416815, 0, 1, 0.05882353, 1,
-0.3980558, 0.2933145, -0.8352402, 0, 1, 0.0627451, 1,
-0.3976069, -0.6278483, -1.889514, 0, 1, 0.07058824, 1,
-0.396273, -0.1144226, -1.833175, 0, 1, 0.07450981, 1,
-0.3950027, -1.829427, -3.802789, 0, 1, 0.08235294, 1,
-0.3921359, -0.364676, -1.364859, 0, 1, 0.08627451, 1,
-0.3898455, 0.3208825, -1.940291, 0, 1, 0.09411765, 1,
-0.3892347, 0.7189699, 0.727031, 0, 1, 0.1019608, 1,
-0.3891287, 0.4156757, -0.8485884, 0, 1, 0.1058824, 1,
-0.3876232, -0.9088532, -2.074058, 0, 1, 0.1137255, 1,
-0.3873959, -0.2641449, -2.110866, 0, 1, 0.1176471, 1,
-0.3861385, 0.02964956, -2.522813, 0, 1, 0.1254902, 1,
-0.3851765, 0.3713766, -1.270025, 0, 1, 0.1294118, 1,
-0.3799571, 0.8864259, -0.7521071, 0, 1, 0.1372549, 1,
-0.3778559, 1.032802, 0.6844576, 0, 1, 0.1411765, 1,
-0.375163, 0.3127481, -0.1910928, 0, 1, 0.1490196, 1,
-0.3746944, -1.812767, -1.420808, 0, 1, 0.1529412, 1,
-0.3742884, 0.487851, 0.03897571, 0, 1, 0.1607843, 1,
-0.3704536, 0.7092711, -1.783374, 0, 1, 0.1647059, 1,
-0.3609509, 0.2594222, -0.5779187, 0, 1, 0.172549, 1,
-0.3586509, -1.078927, -1.806286, 0, 1, 0.1764706, 1,
-0.3574945, -0.01386763, -0.9281207, 0, 1, 0.1843137, 1,
-0.3559918, -2.382402, -2.994, 0, 1, 0.1882353, 1,
-0.3515036, 0.07549802, -1.346499, 0, 1, 0.1960784, 1,
-0.3500694, 0.02469996, -2.365519, 0, 1, 0.2039216, 1,
-0.3492344, -0.4183533, -1.477125, 0, 1, 0.2078431, 1,
-0.3488346, 0.3570935, -1.683534, 0, 1, 0.2156863, 1,
-0.3435517, -0.5565861, -1.461299, 0, 1, 0.2196078, 1,
-0.3434677, 1.748314, 0.1296581, 0, 1, 0.227451, 1,
-0.3389196, 2.1791, 1.460959, 0, 1, 0.2313726, 1,
-0.3386334, -0.7298888, -4.094504, 0, 1, 0.2392157, 1,
-0.3339368, -0.5420837, -3.447384, 0, 1, 0.2431373, 1,
-0.3334822, -1.07862, -0.9296689, 0, 1, 0.2509804, 1,
-0.3326452, -0.4763526, -1.820617, 0, 1, 0.254902, 1,
-0.3324432, -1.010057, -2.9972, 0, 1, 0.2627451, 1,
-0.3317195, 0.9131095, 1.198467, 0, 1, 0.2666667, 1,
-0.3297779, 0.7395558, -0.3387023, 0, 1, 0.2745098, 1,
-0.3283828, 0.6808543, -1.071523, 0, 1, 0.2784314, 1,
-0.3273309, -0.7375587, -3.273664, 0, 1, 0.2862745, 1,
-0.3212403, -0.3595647, -1.733667, 0, 1, 0.2901961, 1,
-0.3197574, -1.675768, -2.765103, 0, 1, 0.2980392, 1,
-0.3191577, 0.438526, -1.243071, 0, 1, 0.3058824, 1,
-0.3135626, -0.1374047, -3.385464, 0, 1, 0.3098039, 1,
-0.3123689, -0.8392652, -2.464161, 0, 1, 0.3176471, 1,
-0.3075576, -0.7226928, -1.011981, 0, 1, 0.3215686, 1,
-0.3072405, 0.1875841, -0.6990269, 0, 1, 0.3294118, 1,
-0.3063085, 0.3236063, -1.998005, 0, 1, 0.3333333, 1,
-0.3045361, -0.9893973, -4.082818, 0, 1, 0.3411765, 1,
-0.3034934, -0.507521, -3.086498, 0, 1, 0.345098, 1,
-0.3010282, -0.06165941, -3.021762, 0, 1, 0.3529412, 1,
-0.2970619, 2.409398, 0.04950821, 0, 1, 0.3568628, 1,
-0.2965241, 1.439551, -0.8014716, 0, 1, 0.3647059, 1,
-0.2949455, 0.2568072, -1.509126, 0, 1, 0.3686275, 1,
-0.2888906, -1.488244, -2.319133, 0, 1, 0.3764706, 1,
-0.2888364, -0.9663942, -2.893807, 0, 1, 0.3803922, 1,
-0.2810193, -0.1540318, -2.303552, 0, 1, 0.3882353, 1,
-0.2787512, 0.3751221, -2.955433, 0, 1, 0.3921569, 1,
-0.2783066, -0.1708157, -1.152565, 0, 1, 0.4, 1,
-0.2778465, 0.1905962, -1.56963, 0, 1, 0.4078431, 1,
-0.2752321, 0.7194237, -2.428231, 0, 1, 0.4117647, 1,
-0.2752088, 0.8549138, -1.195001, 0, 1, 0.4196078, 1,
-0.2692348, 1.519372, -0.4975052, 0, 1, 0.4235294, 1,
-0.2681007, 0.6952641, -0.6734797, 0, 1, 0.4313726, 1,
-0.2653021, -0.8169349, -3.367751, 0, 1, 0.4352941, 1,
-0.2636085, -0.0898158, -0.06982016, 0, 1, 0.4431373, 1,
-0.2602256, -0.002834099, -2.240376, 0, 1, 0.4470588, 1,
-0.2597134, 0.8467587, -0.1065529, 0, 1, 0.454902, 1,
-0.2595693, -0.1441747, -4.102911, 0, 1, 0.4588235, 1,
-0.2593058, -0.3337377, -4.323895, 0, 1, 0.4666667, 1,
-0.2553903, 1.45688, 0.6274703, 0, 1, 0.4705882, 1,
-0.2540799, -0.09648181, -3.051429, 0, 1, 0.4784314, 1,
-0.2539263, 0.2996138, 0.438614, 0, 1, 0.4823529, 1,
-0.2486821, -1.085968, -4.831657, 0, 1, 0.4901961, 1,
-0.2474522, 0.2920916, -0.8317049, 0, 1, 0.4941176, 1,
-0.2451044, 1.316543, 0.6215484, 0, 1, 0.5019608, 1,
-0.242927, -0.6220031, -2.322763, 0, 1, 0.509804, 1,
-0.2424487, 0.4773781, -0.5866147, 0, 1, 0.5137255, 1,
-0.2393989, -1.404871, -3.256706, 0, 1, 0.5215687, 1,
-0.2385597, -0.6309345, -5.226054, 0, 1, 0.5254902, 1,
-0.2375651, 1.011848, -0.7754862, 0, 1, 0.5333334, 1,
-0.2300883, 0.4465188, -0.5022687, 0, 1, 0.5372549, 1,
-0.2300854, 0.02336397, -2.687392, 0, 1, 0.5450981, 1,
-0.2299418, -0.8431562, -2.958848, 0, 1, 0.5490196, 1,
-0.2297936, -0.274853, -1.848441, 0, 1, 0.5568628, 1,
-0.2296482, -1.723893, -1.214088, 0, 1, 0.5607843, 1,
-0.2253899, 2.478499, 0.2268989, 0, 1, 0.5686275, 1,
-0.2240725, -1.194504, -4.227406, 0, 1, 0.572549, 1,
-0.2238809, 0.4851283, -1.494469, 0, 1, 0.5803922, 1,
-0.2230682, -0.9870856, -3.77912, 0, 1, 0.5843138, 1,
-0.2211759, 0.7752315, -0.9483353, 0, 1, 0.5921569, 1,
-0.2178168, 1.808434, 0.7542659, 0, 1, 0.5960785, 1,
-0.2171979, 0.1277561, -0.8295611, 0, 1, 0.6039216, 1,
-0.2143168, -1.04228, -2.054203, 0, 1, 0.6117647, 1,
-0.2139181, -0.6879838, -3.237295, 0, 1, 0.6156863, 1,
-0.207517, 0.301684, 0.06181993, 0, 1, 0.6235294, 1,
-0.2059205, 1.110908, -1.845975, 0, 1, 0.627451, 1,
-0.19716, -1.018035, -1.674253, 0, 1, 0.6352941, 1,
-0.1945433, -1.400237, -2.064643, 0, 1, 0.6392157, 1,
-0.1922281, -0.3898041, -2.993896, 0, 1, 0.6470588, 1,
-0.1898996, 1.913795, -1.252086, 0, 1, 0.6509804, 1,
-0.1896328, -0.09409146, -3.562088, 0, 1, 0.6588235, 1,
-0.1874984, 1.179588, 0.1724882, 0, 1, 0.6627451, 1,
-0.1818514, 1.300008, 0.4098788, 0, 1, 0.6705883, 1,
-0.1779126, -0.3048413, -2.205989, 0, 1, 0.6745098, 1,
-0.1751599, -0.2340872, -2.160125, 0, 1, 0.682353, 1,
-0.174545, -0.9204108, -3.83211, 0, 1, 0.6862745, 1,
-0.17387, 0.9899371, -0.1573391, 0, 1, 0.6941177, 1,
-0.173811, -0.4744182, -3.221635, 0, 1, 0.7019608, 1,
-0.1710086, -0.8012767, -2.408599, 0, 1, 0.7058824, 1,
-0.1641801, -1.239396, -1.856597, 0, 1, 0.7137255, 1,
-0.1626026, 0.7412207, 0.6658214, 0, 1, 0.7176471, 1,
-0.1568076, 2.300531, -0.7541581, 0, 1, 0.7254902, 1,
-0.1552992, -0.1426835, -2.602317, 0, 1, 0.7294118, 1,
-0.1552315, 0.1006862, 0.1895433, 0, 1, 0.7372549, 1,
-0.1509506, 0.7636884, 1.005085, 0, 1, 0.7411765, 1,
-0.1412053, 1.115876, -0.3632077, 0, 1, 0.7490196, 1,
-0.1386562, -1.720548, -3.477644, 0, 1, 0.7529412, 1,
-0.1372248, 0.1822885, -2.465873, 0, 1, 0.7607843, 1,
-0.1321009, 0.6435233, -0.5553698, 0, 1, 0.7647059, 1,
-0.1318977, -0.402769, -2.326965, 0, 1, 0.772549, 1,
-0.1309484, 0.1614755, 0.3721964, 0, 1, 0.7764706, 1,
-0.1276188, 0.4496629, 0.6890928, 0, 1, 0.7843137, 1,
-0.1260386, -1.193878, -2.60191, 0, 1, 0.7882353, 1,
-0.1252937, 2.044188, -1.381086, 0, 1, 0.7960784, 1,
-0.12385, -2.802344, -3.35797, 0, 1, 0.8039216, 1,
-0.1225179, -0.3583878, -2.755046, 0, 1, 0.8078431, 1,
-0.1214854, 2.241307, 0.9835605, 0, 1, 0.8156863, 1,
-0.1207412, 0.0212102, -0.9658923, 0, 1, 0.8196079, 1,
-0.1162439, -1.615131, -2.417474, 0, 1, 0.827451, 1,
-0.1144244, -0.6439977, -0.4991033, 0, 1, 0.8313726, 1,
-0.112663, -1.166604, -3.436019, 0, 1, 0.8392157, 1,
-0.1099848, -1.60011, -3.264495, 0, 1, 0.8431373, 1,
-0.1084723, -0.7929479, -4.521347, 0, 1, 0.8509804, 1,
-0.1070971, -2.089965, -2.962012, 0, 1, 0.854902, 1,
-0.1062857, 0.7484853, 0.7075589, 0, 1, 0.8627451, 1,
-0.1059754, 0.36245, 0.323739, 0, 1, 0.8666667, 1,
-0.1056781, -0.6939878, -3.555083, 0, 1, 0.8745098, 1,
-0.1038975, -0.6353758, -1.118936, 0, 1, 0.8784314, 1,
-0.103228, 0.5058853, 0.3769526, 0, 1, 0.8862745, 1,
-0.1024604, -0.8435192, -3.035399, 0, 1, 0.8901961, 1,
-0.1008672, -0.6012225, -2.389775, 0, 1, 0.8980392, 1,
-0.1007512, -0.09959308, -0.9256727, 0, 1, 0.9058824, 1,
-0.1003446, 0.5352098, 0.659645, 0, 1, 0.9098039, 1,
-0.0925991, -1.543846, -4.131669, 0, 1, 0.9176471, 1,
-0.09022381, -0.8866641, -3.403994, 0, 1, 0.9215686, 1,
-0.08533804, -0.9694884, -4.564422, 0, 1, 0.9294118, 1,
-0.08214439, 0.8183112, -0.5197671, 0, 1, 0.9333333, 1,
-0.07878334, 0.9004813, -0.9777853, 0, 1, 0.9411765, 1,
-0.06984013, -0.8777533, -2.917126, 0, 1, 0.945098, 1,
-0.06940713, -0.09050128, -2.340665, 0, 1, 0.9529412, 1,
-0.06849725, 1.717529, -0.965288, 0, 1, 0.9568627, 1,
-0.06717961, -0.7471038, -1.707662, 0, 1, 0.9647059, 1,
-0.06662917, 0.2760078, -0.006325568, 0, 1, 0.9686275, 1,
-0.06582014, -1.675244, -3.543214, 0, 1, 0.9764706, 1,
-0.06287137, -0.04123521, -3.285945, 0, 1, 0.9803922, 1,
-0.06031865, -1.173733, -3.000453, 0, 1, 0.9882353, 1,
-0.05965241, -0.7816471, -2.02041, 0, 1, 0.9921569, 1,
-0.0535352, -0.5228235, -1.75502, 0, 1, 1, 1,
-0.04896631, 1.259506, 1.12499, 0, 0.9921569, 1, 1,
-0.04805512, -0.2842925, -1.576814, 0, 0.9882353, 1, 1,
-0.04591415, 3.051039, 1.906062, 0, 0.9803922, 1, 1,
-0.04459042, -1.479258, -2.356348, 0, 0.9764706, 1, 1,
-0.04436975, -0.8499006, -3.737816, 0, 0.9686275, 1, 1,
-0.04429816, 0.1980527, -1.639254, 0, 0.9647059, 1, 1,
-0.03673631, 1.927965, -0.7438524, 0, 0.9568627, 1, 1,
-0.03639543, -1.815419, -4.872899, 0, 0.9529412, 1, 1,
-0.03166206, 0.660513, 0.952499, 0, 0.945098, 1, 1,
-0.02885046, 0.9983203, -1.315895, 0, 0.9411765, 1, 1,
-0.02741491, 2.298841, -1.298826, 0, 0.9333333, 1, 1,
-0.02647544, 1.638601, 1.047908, 0, 0.9294118, 1, 1,
-0.02589368, 0.6749055, -1.060115, 0, 0.9215686, 1, 1,
-0.02285882, -0.1907797, -3.949421, 0, 0.9176471, 1, 1,
-0.02210099, 0.1228743, -0.224874, 0, 0.9098039, 1, 1,
-0.01886878, 0.8703305, -1.731804, 0, 0.9058824, 1, 1,
-0.01859908, 0.4509935, -0.4988821, 0, 0.8980392, 1, 1,
-0.01794956, -1.093861, -2.618716, 0, 0.8901961, 1, 1,
-0.01789001, -0.400377, -4.190397, 0, 0.8862745, 1, 1,
-0.01721508, 0.107124, -2.024846, 0, 0.8784314, 1, 1,
-0.01641933, 1.309845, -0.1116512, 0, 0.8745098, 1, 1,
-0.01278038, 2.043724, 0.185574, 0, 0.8666667, 1, 1,
-0.004067122, -0.8509212, -4.338754, 0, 0.8627451, 1, 1,
0.002570688, -0.02673336, 2.822634, 0, 0.854902, 1, 1,
0.002645557, -0.9375243, 3.477017, 0, 0.8509804, 1, 1,
0.005112853, 0.3797486, -1.172205, 0, 0.8431373, 1, 1,
0.005470948, -0.2367465, 2.865674, 0, 0.8392157, 1, 1,
0.006665936, 0.4398242, -1.486908, 0, 0.8313726, 1, 1,
0.00789885, 1.398547, -0.8005511, 0, 0.827451, 1, 1,
0.007941362, 0.3400635, -0.08188695, 0, 0.8196079, 1, 1,
0.01176905, -0.4808449, 3.404241, 0, 0.8156863, 1, 1,
0.01308114, 1.839911, -1.709878, 0, 0.8078431, 1, 1,
0.01308991, 0.3579778, 0.3164524, 0, 0.8039216, 1, 1,
0.01539133, -1.583555, 2.243576, 0, 0.7960784, 1, 1,
0.01742713, -0.7126853, 2.754848, 0, 0.7882353, 1, 1,
0.01857231, 2.300545, -0.5786758, 0, 0.7843137, 1, 1,
0.02063151, -0.8109459, 1.333418, 0, 0.7764706, 1, 1,
0.02122657, 0.8527229, 0.0958231, 0, 0.772549, 1, 1,
0.02190657, -0.5136804, 1.751428, 0, 0.7647059, 1, 1,
0.02840988, 0.537505, -1.002339, 0, 0.7607843, 1, 1,
0.03062644, 0.4750476, -1.028534, 0, 0.7529412, 1, 1,
0.0306948, -0.6922588, 1.253525, 0, 0.7490196, 1, 1,
0.03326108, -0.4986155, 3.072835, 0, 0.7411765, 1, 1,
0.03556364, 1.415059, -0.06747565, 0, 0.7372549, 1, 1,
0.03661455, -0.09357833, 3.097038, 0, 0.7294118, 1, 1,
0.03714979, -0.8824085, 2.515129, 0, 0.7254902, 1, 1,
0.04123819, -2.188767, 4.176436, 0, 0.7176471, 1, 1,
0.04294788, 0.03300618, 2.531243, 0, 0.7137255, 1, 1,
0.04808657, 1.164515, -0.5478503, 0, 0.7058824, 1, 1,
0.05349432, 1.155211, 0.1155916, 0, 0.6980392, 1, 1,
0.0547403, -0.2127406, 4.742483, 0, 0.6941177, 1, 1,
0.05492593, 0.263319, -1.102093, 0, 0.6862745, 1, 1,
0.05645902, 0.2769638, -0.09361935, 0, 0.682353, 1, 1,
0.05742411, -1.299272, 5.103299, 0, 0.6745098, 1, 1,
0.05930645, 1.352485, -1.214841, 0, 0.6705883, 1, 1,
0.06194111, 1.281582, -0.7891946, 0, 0.6627451, 1, 1,
0.06247469, 0.9418064, -0.2340299, 0, 0.6588235, 1, 1,
0.06495798, -1.873325, 2.50426, 0, 0.6509804, 1, 1,
0.06742502, -1.723023, 3.63307, 0, 0.6470588, 1, 1,
0.06875641, 0.0737283, 1.042777, 0, 0.6392157, 1, 1,
0.07069913, -0.5454416, 3.569261, 0, 0.6352941, 1, 1,
0.07481527, -0.00475281, 0.2885151, 0, 0.627451, 1, 1,
0.08103707, 1.826837, -0.1752417, 0, 0.6235294, 1, 1,
0.08163904, 0.1526861, 0.5372609, 0, 0.6156863, 1, 1,
0.08623704, 0.8685097, 0.484662, 0, 0.6117647, 1, 1,
0.08640323, -0.4992665, 4.46362, 0, 0.6039216, 1, 1,
0.08928319, -0.3507859, 1.83215, 0, 0.5960785, 1, 1,
0.09068213, -0.9495065, 2.734207, 0, 0.5921569, 1, 1,
0.09099067, 0.4231773, 1.385339, 0, 0.5843138, 1, 1,
0.09476742, 0.7251002, 1.380209, 0, 0.5803922, 1, 1,
0.09919126, 1.282182, -2.396639, 0, 0.572549, 1, 1,
0.09960418, -1.659051, 2.710665, 0, 0.5686275, 1, 1,
0.1005731, 0.6092635, -0.04254343, 0, 0.5607843, 1, 1,
0.1032262, 0.2096533, -1.191236, 0, 0.5568628, 1, 1,
0.1115122, 0.7262411, 0.8680959, 0, 0.5490196, 1, 1,
0.1115443, -0.7626585, 2.727898, 0, 0.5450981, 1, 1,
0.1146267, 0.2214057, 1.858936, 0, 0.5372549, 1, 1,
0.1156105, 0.8006172, -0.43325, 0, 0.5333334, 1, 1,
0.1169696, -2.21243, 5.483701, 0, 0.5254902, 1, 1,
0.1229882, 0.3894838, 1.026323, 0, 0.5215687, 1, 1,
0.1257506, -0.1992619, 2.225073, 0, 0.5137255, 1, 1,
0.1268991, 0.2997204, 0.3183425, 0, 0.509804, 1, 1,
0.1278631, -0.8653225, 3.473711, 0, 0.5019608, 1, 1,
0.129845, 0.2650742, 0.2421944, 0, 0.4941176, 1, 1,
0.1323014, 1.153184, 0.01308971, 0, 0.4901961, 1, 1,
0.1352375, -0.3124511, 5.097402, 0, 0.4823529, 1, 1,
0.1372969, -0.6765539, 3.010245, 0, 0.4784314, 1, 1,
0.1423081, 1.026417, 1.04101, 0, 0.4705882, 1, 1,
0.1446683, 0.3203197, -0.9543711, 0, 0.4666667, 1, 1,
0.1476023, 0.4053483, 0.1232983, 0, 0.4588235, 1, 1,
0.1543697, -0.12505, 1.99249, 0, 0.454902, 1, 1,
0.163431, -0.3647221, 1.691485, 0, 0.4470588, 1, 1,
0.1644398, 0.394576, -0.1547352, 0, 0.4431373, 1, 1,
0.1644587, -0.05803304, 2.591189, 0, 0.4352941, 1, 1,
0.1685688, 1.365194, 0.6131703, 0, 0.4313726, 1, 1,
0.1706349, -0.7337987, 2.672164, 0, 0.4235294, 1, 1,
0.1748071, -0.6673287, 2.008385, 0, 0.4196078, 1, 1,
0.1787187, -0.3455727, 1.951936, 0, 0.4117647, 1, 1,
0.1794656, -1.003179, 3.875887, 0, 0.4078431, 1, 1,
0.1816883, -1.078868, 3.167629, 0, 0.4, 1, 1,
0.1861466, -1.938997, 4.064655, 0, 0.3921569, 1, 1,
0.1932262, -1.577921, 0.7182162, 0, 0.3882353, 1, 1,
0.2017402, -1.884152, 2.991443, 0, 0.3803922, 1, 1,
0.2031645, 0.201891, -0.6111977, 0, 0.3764706, 1, 1,
0.2047048, -0.3508283, 3.249314, 0, 0.3686275, 1, 1,
0.2052511, 0.4533077, 0.7090929, 0, 0.3647059, 1, 1,
0.2110967, -0.7494805, 3.430025, 0, 0.3568628, 1, 1,
0.2152329, -1.57394, 3.279826, 0, 0.3529412, 1, 1,
0.215403, 1.814693, 0.1699662, 0, 0.345098, 1, 1,
0.216028, -0.1706415, 3.854511, 0, 0.3411765, 1, 1,
0.217419, -0.1771287, 2.229111, 0, 0.3333333, 1, 1,
0.2186192, -0.4099105, 2.124075, 0, 0.3294118, 1, 1,
0.2189199, -1.235442, 3.266907, 0, 0.3215686, 1, 1,
0.2196972, 0.8424955, 0.5062588, 0, 0.3176471, 1, 1,
0.2231435, -0.455869, 3.291927, 0, 0.3098039, 1, 1,
0.2263657, 1.090542, 1.110617, 0, 0.3058824, 1, 1,
0.2292737, -0.4324231, 3.057057, 0, 0.2980392, 1, 1,
0.2347099, 0.4847149, -0.02734982, 0, 0.2901961, 1, 1,
0.2368343, 0.5096346, -0.8357913, 0, 0.2862745, 1, 1,
0.2411376, 0.2191039, 0.5400789, 0, 0.2784314, 1, 1,
0.2420042, 0.4468037, 0.883324, 0, 0.2745098, 1, 1,
0.2442254, -0.1774945, 0.5296496, 0, 0.2666667, 1, 1,
0.249097, -1.650823, 2.29321, 0, 0.2627451, 1, 1,
0.2510453, -0.104225, 2.410653, 0, 0.254902, 1, 1,
0.2530873, 0.37954, 0.6562909, 0, 0.2509804, 1, 1,
0.260224, 0.8643576, 0.1588813, 0, 0.2431373, 1, 1,
0.2649619, 1.382545, 1.08984, 0, 0.2392157, 1, 1,
0.2699363, 0.7727902, 2.325525, 0, 0.2313726, 1, 1,
0.2705494, -0.9971825, 3.329982, 0, 0.227451, 1, 1,
0.2752294, -1.694831, 2.64637, 0, 0.2196078, 1, 1,
0.2773731, -0.6936665, 3.668358, 0, 0.2156863, 1, 1,
0.2807052, -0.0928058, 3.367495, 0, 0.2078431, 1, 1,
0.2846759, 0.7120493, -2.133821, 0, 0.2039216, 1, 1,
0.2877148, -0.1498871, 1.389111, 0, 0.1960784, 1, 1,
0.2999822, 0.5906053, 1.229822, 0, 0.1882353, 1, 1,
0.3007708, 0.2660835, 1.528216, 0, 0.1843137, 1, 1,
0.3084957, 0.5936375, -2.061695, 0, 0.1764706, 1, 1,
0.3088683, -0.9971001, 2.596435, 0, 0.172549, 1, 1,
0.309125, 0.08932558, 1.634868, 0, 0.1647059, 1, 1,
0.3121549, 0.266697, 2.023624, 0, 0.1607843, 1, 1,
0.316725, -0.8541518, 4.69059, 0, 0.1529412, 1, 1,
0.3192693, -0.02631528, 1.742714, 0, 0.1490196, 1, 1,
0.3194037, 0.7778693, -0.4406359, 0, 0.1411765, 1, 1,
0.3263821, -1.078089, 2.014118, 0, 0.1372549, 1, 1,
0.3287141, -1.645656, 1.983349, 0, 0.1294118, 1, 1,
0.3297697, -0.2091193, 1.025497, 0, 0.1254902, 1, 1,
0.3338306, 0.7112424, 2.510109, 0, 0.1176471, 1, 1,
0.3358259, -0.1716031, -0.4184487, 0, 0.1137255, 1, 1,
0.3387794, -0.8639163, 3.907817, 0, 0.1058824, 1, 1,
0.3431478, -0.4278241, 2.871958, 0, 0.09803922, 1, 1,
0.3513499, 0.4612963, -1.071971, 0, 0.09411765, 1, 1,
0.3581384, -0.1393974, 2.942281, 0, 0.08627451, 1, 1,
0.3609914, -1.102517, 2.182807, 0, 0.08235294, 1, 1,
0.3626034, -0.1244747, 2.302016, 0, 0.07450981, 1, 1,
0.3651576, -0.0002450874, 2.505346, 0, 0.07058824, 1, 1,
0.3664111, -1.136097, 3.557787, 0, 0.0627451, 1, 1,
0.3688115, -0.201162, 1.711931, 0, 0.05882353, 1, 1,
0.3706546, -1.27077, 2.272119, 0, 0.05098039, 1, 1,
0.3725947, 0.6663533, 0.8935975, 0, 0.04705882, 1, 1,
0.3777253, 1.269504, -0.1212126, 0, 0.03921569, 1, 1,
0.3777851, -0.6394848, 3.638031, 0, 0.03529412, 1, 1,
0.3786753, 0.3178382, 0.7228842, 0, 0.02745098, 1, 1,
0.3797555, -1.636516, 3.136908, 0, 0.02352941, 1, 1,
0.3856695, -0.2005116, 2.310863, 0, 0.01568628, 1, 1,
0.3882368, -0.2491729, 2.098141, 0, 0.01176471, 1, 1,
0.3926235, 0.5920286, -0.8296985, 0, 0.003921569, 1, 1,
0.3941524, -0.3945814, 2.675444, 0.003921569, 0, 1, 1,
0.3943661, -0.3213694, 2.561068, 0.007843138, 0, 1, 1,
0.3990471, 2.788417, 0.4569695, 0.01568628, 0, 1, 1,
0.4013007, 1.789861, 1.311802, 0.01960784, 0, 1, 1,
0.4038211, -0.5512764, 2.602616, 0.02745098, 0, 1, 1,
0.4042475, -1.23487, 4.736537, 0.03137255, 0, 1, 1,
0.4116837, -0.4542755, 0.7877298, 0.03921569, 0, 1, 1,
0.4200524, -0.6910828, 2.720845, 0.04313726, 0, 1, 1,
0.4229232, 1.130663, 0.4336392, 0.05098039, 0, 1, 1,
0.4252689, 1.331907, -0.2892555, 0.05490196, 0, 1, 1,
0.4265831, -0.3174481, 0.9626582, 0.0627451, 0, 1, 1,
0.4268182, -1.319771, 4.353094, 0.06666667, 0, 1, 1,
0.4270299, 1.358054, 2.103146, 0.07450981, 0, 1, 1,
0.4288346, 0.02636448, 1.914792, 0.07843138, 0, 1, 1,
0.4297023, -1.540677, 4.713788, 0.08627451, 0, 1, 1,
0.4329094, 1.291485, 0.2268587, 0.09019608, 0, 1, 1,
0.4334042, -0.079743, 3.18939, 0.09803922, 0, 1, 1,
0.4365415, 0.4545867, -1.372067, 0.1058824, 0, 1, 1,
0.4377621, -0.03206418, 0.5609275, 0.1098039, 0, 1, 1,
0.4403753, 1.660527, 0.06460737, 0.1176471, 0, 1, 1,
0.4437629, -0.6671081, 1.860055, 0.1215686, 0, 1, 1,
0.4447217, 0.09943885, 1.864647, 0.1294118, 0, 1, 1,
0.4501933, -1.279418, 2.055652, 0.1333333, 0, 1, 1,
0.4610447, -1.16583, 3.065824, 0.1411765, 0, 1, 1,
0.4673776, 1.517698, 0.4636721, 0.145098, 0, 1, 1,
0.4687718, 0.1473825, 1.775072, 0.1529412, 0, 1, 1,
0.4691104, -1.340937, 3.3185, 0.1568628, 0, 1, 1,
0.4695614, 0.3731747, 0.6171827, 0.1647059, 0, 1, 1,
0.4703264, 1.000551, 1.305047, 0.1686275, 0, 1, 1,
0.4750096, 0.3465211, 0.265939, 0.1764706, 0, 1, 1,
0.4751868, 1.100574, 0.6903601, 0.1803922, 0, 1, 1,
0.477569, 0.2975221, 1.417222, 0.1882353, 0, 1, 1,
0.4777947, -0.2409271, 1.299828, 0.1921569, 0, 1, 1,
0.4811684, -0.921023, 1.91953, 0.2, 0, 1, 1,
0.4836299, -0.3319354, 1.0442, 0.2078431, 0, 1, 1,
0.4836324, -0.3070099, 2.485432, 0.2117647, 0, 1, 1,
0.4847332, -1.823588, 3.330938, 0.2196078, 0, 1, 1,
0.4897676, 1.345582, -0.8972295, 0.2235294, 0, 1, 1,
0.4904516, 1.100822, -1.135659, 0.2313726, 0, 1, 1,
0.4947261, -0.3596739, 3.695951, 0.2352941, 0, 1, 1,
0.4967327, -0.757721, 1.223199, 0.2431373, 0, 1, 1,
0.4984905, 0.6366197, -0.1213789, 0.2470588, 0, 1, 1,
0.5006751, 0.9220333, 0.2409619, 0.254902, 0, 1, 1,
0.5068346, -0.7971931, 4.661252, 0.2588235, 0, 1, 1,
0.5147895, 0.3480205, 0.9896963, 0.2666667, 0, 1, 1,
0.5172612, -0.1703026, 1.928113, 0.2705882, 0, 1, 1,
0.5189049, -0.1076824, 2.253644, 0.2784314, 0, 1, 1,
0.5226445, -1.210741, 4.249309, 0.282353, 0, 1, 1,
0.5267881, -0.05070578, 1.473606, 0.2901961, 0, 1, 1,
0.5280824, 0.6798507, 1.193754, 0.2941177, 0, 1, 1,
0.5296677, 1.317855, -0.1318343, 0.3019608, 0, 1, 1,
0.5303235, 1.881256, 1.199916, 0.3098039, 0, 1, 1,
0.5314016, 2.393103, -0.03620826, 0.3137255, 0, 1, 1,
0.5344341, -0.2496219, 1.528367, 0.3215686, 0, 1, 1,
0.5377604, 0.7022991, 1.016512, 0.3254902, 0, 1, 1,
0.542273, -0.02400653, 0.3335554, 0.3333333, 0, 1, 1,
0.5449665, -1.471155, 2.092606, 0.3372549, 0, 1, 1,
0.5453733, -0.9078038, 3.462949, 0.345098, 0, 1, 1,
0.5463501, 0.3376597, 1.674849, 0.3490196, 0, 1, 1,
0.5480838, -0.5923042, 2.929358, 0.3568628, 0, 1, 1,
0.5490479, 0.2655414, 1.546371, 0.3607843, 0, 1, 1,
0.5505692, -0.1826953, 2.117465, 0.3686275, 0, 1, 1,
0.5519509, -0.2566234, 2.93852, 0.372549, 0, 1, 1,
0.5566985, 0.03456044, 1.242194, 0.3803922, 0, 1, 1,
0.5576267, -0.9715336, 1.848308, 0.3843137, 0, 1, 1,
0.5585034, -1.090894, 4.181724, 0.3921569, 0, 1, 1,
0.5585805, -1.122774, 0.9183511, 0.3960784, 0, 1, 1,
0.5652089, 0.002809993, -0.002723734, 0.4039216, 0, 1, 1,
0.5656793, -0.6052898, 3.851838, 0.4117647, 0, 1, 1,
0.5680253, -0.5140651, 1.465991, 0.4156863, 0, 1, 1,
0.5733382, -1.711776, 4.225708, 0.4235294, 0, 1, 1,
0.5742071, 0.1615858, 2.009183, 0.427451, 0, 1, 1,
0.5782521, 1.015461, 0.3803929, 0.4352941, 0, 1, 1,
0.5868023, 0.2752007, -0.05186922, 0.4392157, 0, 1, 1,
0.5911424, 0.7873245, 1.583308, 0.4470588, 0, 1, 1,
0.5933836, 1.525896, 0.9082232, 0.4509804, 0, 1, 1,
0.605334, -1.17329, 3.842621, 0.4588235, 0, 1, 1,
0.6069754, -1.504395, 1.382818, 0.4627451, 0, 1, 1,
0.6113592, 0.5330621, -1.226588, 0.4705882, 0, 1, 1,
0.6146842, -1.149264, 2.299685, 0.4745098, 0, 1, 1,
0.6168163, 1.329747, 0.9741602, 0.4823529, 0, 1, 1,
0.6222904, 0.673006, -0.6045966, 0.4862745, 0, 1, 1,
0.630942, -1.600876, 4.053596, 0.4941176, 0, 1, 1,
0.635652, 0.509589, 0.7784292, 0.5019608, 0, 1, 1,
0.6416771, 0.9120477, 1.082973, 0.5058824, 0, 1, 1,
0.6423858, -1.305672, 2.210039, 0.5137255, 0, 1, 1,
0.642515, 0.750499, 1.717236, 0.5176471, 0, 1, 1,
0.6437052, 0.7323155, -1.206413, 0.5254902, 0, 1, 1,
0.6452158, -0.5965221, 3.230212, 0.5294118, 0, 1, 1,
0.647868, -0.2259978, 2.287916, 0.5372549, 0, 1, 1,
0.6492595, 0.04938072, 1.071758, 0.5411765, 0, 1, 1,
0.6512156, 1.292732, 0.7434655, 0.5490196, 0, 1, 1,
0.6530347, 0.3480025, 0.7236504, 0.5529412, 0, 1, 1,
0.6547526, -2.19163, 1.692173, 0.5607843, 0, 1, 1,
0.6569537, -2.782272, 2.936136, 0.5647059, 0, 1, 1,
0.6578482, -0.1902376, 1.910523, 0.572549, 0, 1, 1,
0.6599971, -1.599353, 1.856386, 0.5764706, 0, 1, 1,
0.6654781, -1.564454, 2.188889, 0.5843138, 0, 1, 1,
0.6679227, 1.682091, 0.6239765, 0.5882353, 0, 1, 1,
0.6716914, -0.6055937, 2.75827, 0.5960785, 0, 1, 1,
0.6721579, -0.7238868, 3.147286, 0.6039216, 0, 1, 1,
0.6843885, 0.07392832, 2.233524, 0.6078432, 0, 1, 1,
0.6871694, -0.2576717, 3.19907, 0.6156863, 0, 1, 1,
0.6875365, -2.196352, 0.8148085, 0.6196079, 0, 1, 1,
0.6890899, -0.6032401, 3.559566, 0.627451, 0, 1, 1,
0.6950235, 2.346288, -0.5063915, 0.6313726, 0, 1, 1,
0.6950455, 0.1095708, 0.243387, 0.6392157, 0, 1, 1,
0.6992707, 1.979061, 2.036382, 0.6431373, 0, 1, 1,
0.7043469, 0.6872335, -0.2714717, 0.6509804, 0, 1, 1,
0.7094249, -2.050651, 1.930238, 0.654902, 0, 1, 1,
0.7120613, -1.726549, 3.892627, 0.6627451, 0, 1, 1,
0.7223878, 0.1140003, 0.7710076, 0.6666667, 0, 1, 1,
0.7224619, 1.675575, 0.3720528, 0.6745098, 0, 1, 1,
0.7296039, 0.5043949, 2.779394, 0.6784314, 0, 1, 1,
0.7334903, 0.4689387, 2.93536, 0.6862745, 0, 1, 1,
0.739566, -1.00082, 2.896262, 0.6901961, 0, 1, 1,
0.7398659, 0.5255889, -0.2432053, 0.6980392, 0, 1, 1,
0.7430643, -1.751469, 2.292319, 0.7058824, 0, 1, 1,
0.7448596, 0.4896771, 2.179849, 0.7098039, 0, 1, 1,
0.7451823, 0.7015164, -0.6778482, 0.7176471, 0, 1, 1,
0.747691, 1.355614, 1.922498, 0.7215686, 0, 1, 1,
0.749926, -0.1949856, 2.984068, 0.7294118, 0, 1, 1,
0.7635015, -0.5900437, 2.526432, 0.7333333, 0, 1, 1,
0.7717162, 0.3572556, 2.242286, 0.7411765, 0, 1, 1,
0.7729179, -0.7995684, 3.481642, 0.7450981, 0, 1, 1,
0.7751823, 0.1204609, 0.9198793, 0.7529412, 0, 1, 1,
0.7806787, -2.182686, 4.037176, 0.7568628, 0, 1, 1,
0.7828336, 0.005305105, 1.188219, 0.7647059, 0, 1, 1,
0.7859685, 1.627197, 2.135521, 0.7686275, 0, 1, 1,
0.7862723, 0.3817444, -0.1100112, 0.7764706, 0, 1, 1,
0.7871527, -1.149881, 1.324512, 0.7803922, 0, 1, 1,
0.7883772, -0.7462347, 3.37832, 0.7882353, 0, 1, 1,
0.7891527, 0.01974738, 2.301918, 0.7921569, 0, 1, 1,
0.7961897, -0.04333987, 1.46203, 0.8, 0, 1, 1,
0.7991994, 1.697385, 1.397915, 0.8078431, 0, 1, 1,
0.8015264, -1.52387, 3.742414, 0.8117647, 0, 1, 1,
0.8096026, -2.185849, 1.427108, 0.8196079, 0, 1, 1,
0.8211696, -0.7311334, 2.617883, 0.8235294, 0, 1, 1,
0.8229578, 0.165702, 1.541251, 0.8313726, 0, 1, 1,
0.8267474, -0.6618575, 2.089016, 0.8352941, 0, 1, 1,
0.8286793, 1.885472, 0.5565162, 0.8431373, 0, 1, 1,
0.8334137, -0.7230831, 2.159745, 0.8470588, 0, 1, 1,
0.8366387, -0.004177121, 1.355201, 0.854902, 0, 1, 1,
0.839817, 0.1058808, 2.967301, 0.8588235, 0, 1, 1,
0.8400688, 1.806617, -0.3929259, 0.8666667, 0, 1, 1,
0.8491359, 0.9626693, 0.205784, 0.8705882, 0, 1, 1,
0.8497247, 1.174276, -1.778906, 0.8784314, 0, 1, 1,
0.8525875, -0.04149711, 2.968906, 0.8823529, 0, 1, 1,
0.8535143, 0.05161992, 2.02492, 0.8901961, 0, 1, 1,
0.8539456, 0.6432472, 0.07984897, 0.8941177, 0, 1, 1,
0.854598, 0.8070046, 2.008938, 0.9019608, 0, 1, 1,
0.8577347, 0.7517449, 1.355485, 0.9098039, 0, 1, 1,
0.862254, -0.8461816, 3.280215, 0.9137255, 0, 1, 1,
0.8683864, -0.4549307, 3.177455, 0.9215686, 0, 1, 1,
0.871222, -0.1828199, 0.3825364, 0.9254902, 0, 1, 1,
0.8744369, -1.272627, 1.45574, 0.9333333, 0, 1, 1,
0.8764217, -1.187849, 0.7517133, 0.9372549, 0, 1, 1,
0.8829668, 0.2419859, 1.598318, 0.945098, 0, 1, 1,
0.8840675, 0.8248595, 0.6240358, 0.9490196, 0, 1, 1,
0.8922926, 0.5104436, 0.6894419, 0.9568627, 0, 1, 1,
0.8982552, 0.6555317, 1.744103, 0.9607843, 0, 1, 1,
0.9071209, -0.2713778, -0.1971215, 0.9686275, 0, 1, 1,
0.9196128, 0.4231586, 0.6151254, 0.972549, 0, 1, 1,
0.9268997, -0.1337597, 1.374041, 0.9803922, 0, 1, 1,
0.9280713, 0.3635503, 0.8303595, 0.9843137, 0, 1, 1,
0.9292874, -1.170824, 2.037843, 0.9921569, 0, 1, 1,
0.9334562, -0.1907635, 0.0003602584, 0.9960784, 0, 1, 1,
0.9346524, 2.325392, 0.1588673, 1, 0, 0.9960784, 1,
0.9364561, -0.9841961, 2.715828, 1, 0, 0.9882353, 1,
0.9401258, -0.8803658, 0.9982986, 1, 0, 0.9843137, 1,
0.9431421, -0.7615193, -0.3382657, 1, 0, 0.9764706, 1,
0.9478033, -0.3362693, 1.985417, 1, 0, 0.972549, 1,
0.9486625, -0.578049, 2.458595, 1, 0, 0.9647059, 1,
0.9489859, -0.151233, 3.887969, 1, 0, 0.9607843, 1,
0.9586536, 0.2812912, 1.441526, 1, 0, 0.9529412, 1,
0.9618504, 0.4753968, 0.9196098, 1, 0, 0.9490196, 1,
0.9656479, 0.2217159, 2.340466, 1, 0, 0.9411765, 1,
0.9720529, 0.836256, 1.959453, 1, 0, 0.9372549, 1,
0.9729401, 0.07208624, 1.536096, 1, 0, 0.9294118, 1,
0.9752631, -0.9020553, 3.41388, 1, 0, 0.9254902, 1,
0.9764329, 2.873239, 1.276003, 1, 0, 0.9176471, 1,
0.9782706, 0.07092946, 0.7677068, 1, 0, 0.9137255, 1,
0.9822661, -0.6007904, 1.686859, 1, 0, 0.9058824, 1,
0.992783, -1.071471, 2.402985, 1, 0, 0.9019608, 1,
0.9956396, 0.1940832, 1.48216, 1, 0, 0.8941177, 1,
0.996386, -1.04459, 0.6693562, 1, 0, 0.8862745, 1,
1.003518, 0.9988363, 1.270292, 1, 0, 0.8823529, 1,
1.012513, 0.5158492, 0.4010812, 1, 0, 0.8745098, 1,
1.02593, 0.7193074, -0.108315, 1, 0, 0.8705882, 1,
1.034859, 2.769348, -0.5777596, 1, 0, 0.8627451, 1,
1.04241, 0.5115172, 1.118069, 1, 0, 0.8588235, 1,
1.045149, -0.5140355, 1.996875, 1, 0, 0.8509804, 1,
1.050733, 0.742999, -0.4270194, 1, 0, 0.8470588, 1,
1.052663, 0.3488905, 0.4559968, 1, 0, 0.8392157, 1,
1.055285, -1.774405, 4.871383, 1, 0, 0.8352941, 1,
1.058274, -1.026497, 3.946781, 1, 0, 0.827451, 1,
1.064681, -1.620934, 3.043487, 1, 0, 0.8235294, 1,
1.065737, 0.4149626, 1.543868, 1, 0, 0.8156863, 1,
1.066254, 0.03619515, 1.26365, 1, 0, 0.8117647, 1,
1.066431, -2.028, 3.498017, 1, 0, 0.8039216, 1,
1.070679, -0.5448858, 1.198998, 1, 0, 0.7960784, 1,
1.071658, 0.4259707, 0.8361992, 1, 0, 0.7921569, 1,
1.075055, -0.6814581, 1.370056, 1, 0, 0.7843137, 1,
1.080961, 0.3699834, 2.619554, 1, 0, 0.7803922, 1,
1.087648, -0.0009244552, 1.534508, 1, 0, 0.772549, 1,
1.088769, 0.217934, 2.041983, 1, 0, 0.7686275, 1,
1.095488, 0.3101035, 1.866989, 1, 0, 0.7607843, 1,
1.096206, 1.009596, 0.697693, 1, 0, 0.7568628, 1,
1.096811, -0.18208, 0.9567045, 1, 0, 0.7490196, 1,
1.100356, -0.3745917, 2.948928, 1, 0, 0.7450981, 1,
1.105887, 0.995386, 1.138525, 1, 0, 0.7372549, 1,
1.106495, 1.31997, 0.4406378, 1, 0, 0.7333333, 1,
1.110898, -0.01731644, 2.514539, 1, 0, 0.7254902, 1,
1.111568, 1.243297, -0.6457006, 1, 0, 0.7215686, 1,
1.11202, -1.093436, -0.6665927, 1, 0, 0.7137255, 1,
1.114803, -0.6586664, 2.504396, 1, 0, 0.7098039, 1,
1.117067, 0.1346238, 0.726162, 1, 0, 0.7019608, 1,
1.1171, -0.1962711, 1.258563, 1, 0, 0.6941177, 1,
1.117562, -0.6958005, 3.110202, 1, 0, 0.6901961, 1,
1.126306, 0.9603562, 1.020626, 1, 0, 0.682353, 1,
1.134698, 0.04020949, 0.0832249, 1, 0, 0.6784314, 1,
1.143446, -0.6474578, 2.826398, 1, 0, 0.6705883, 1,
1.145976, -0.6664423, 1.365632, 1, 0, 0.6666667, 1,
1.151258, 1.049789, 0.7683254, 1, 0, 0.6588235, 1,
1.153269, 1.940746, 0.6288032, 1, 0, 0.654902, 1,
1.188405, -1.638041, 1.399621, 1, 0, 0.6470588, 1,
1.191559, -0.1090461, 1.301392, 1, 0, 0.6431373, 1,
1.199047, -1.540853, 2.376591, 1, 0, 0.6352941, 1,
1.199583, -0.430259, -0.1956346, 1, 0, 0.6313726, 1,
1.200458, 0.1050911, 1.215535, 1, 0, 0.6235294, 1,
1.202484, 1.581592, -0.2347684, 1, 0, 0.6196079, 1,
1.208036, 0.7983959, 0.6660768, 1, 0, 0.6117647, 1,
1.223331, 0.09038373, 0.6996549, 1, 0, 0.6078432, 1,
1.223764, 0.735709, 1.474121, 1, 0, 0.6, 1,
1.227579, -2.392087, 1.126298, 1, 0, 0.5921569, 1,
1.239182, -0.429495, 0.5068079, 1, 0, 0.5882353, 1,
1.243264, 0.5088683, 0.879504, 1, 0, 0.5803922, 1,
1.244124, -0.4914384, 0.7101941, 1, 0, 0.5764706, 1,
1.244485, -0.7937074, 2.552624, 1, 0, 0.5686275, 1,
1.250107, -1.223014, 0.3723541, 1, 0, 0.5647059, 1,
1.259493, -0.4600686, 2.172101, 1, 0, 0.5568628, 1,
1.261861, -0.9897524, 1.929855, 1, 0, 0.5529412, 1,
1.2639, -2.17127, 0.4135716, 1, 0, 0.5450981, 1,
1.286027, -0.1077218, 1.658863, 1, 0, 0.5411765, 1,
1.287655, -0.4607638, 0.6224554, 1, 0, 0.5333334, 1,
1.289481, 0.1737811, 0.4913412, 1, 0, 0.5294118, 1,
1.289575, -0.9653385, 1.615889, 1, 0, 0.5215687, 1,
1.290372, -0.6007071, 2.863235, 1, 0, 0.5176471, 1,
1.299105, -0.4860448, 1.805876, 1, 0, 0.509804, 1,
1.312787, 0.9925075, -1.469646, 1, 0, 0.5058824, 1,
1.314108, 0.5821061, 0.3447844, 1, 0, 0.4980392, 1,
1.323018, -0.3442426, 1.276403, 1, 0, 0.4901961, 1,
1.329145, 0.6946771, 0.7302341, 1, 0, 0.4862745, 1,
1.334419, -0.8203109, 2.451857, 1, 0, 0.4784314, 1,
1.337384, 2.169847, -1.046973, 1, 0, 0.4745098, 1,
1.341062, -0.8814692, 1.792907, 1, 0, 0.4666667, 1,
1.343549, 0.5631943, 2.5214, 1, 0, 0.4627451, 1,
1.346908, -0.757938, 0.7884355, 1, 0, 0.454902, 1,
1.355934, 0.7155932, -1.173199, 1, 0, 0.4509804, 1,
1.36693, -0.8263472, 1.989786, 1, 0, 0.4431373, 1,
1.378163, -0.1811429, 0.6504441, 1, 0, 0.4392157, 1,
1.384073, -1.997892, 0.8350536, 1, 0, 0.4313726, 1,
1.392487, 0.3513778, 2.046817, 1, 0, 0.427451, 1,
1.39438, 1.057782, 0.8327638, 1, 0, 0.4196078, 1,
1.402154, -1.065522, 2.631367, 1, 0, 0.4156863, 1,
1.415542, -0.1012145, 0.897139, 1, 0, 0.4078431, 1,
1.434978, 1.413195, -0.09457318, 1, 0, 0.4039216, 1,
1.452964, -0.2114239, 3.859224, 1, 0, 0.3960784, 1,
1.462539, 0.1741963, 3.224774, 1, 0, 0.3882353, 1,
1.468941, -0.3300108, 3.062199, 1, 0, 0.3843137, 1,
1.478023, -0.6329367, 2.842464, 1, 0, 0.3764706, 1,
1.483559, -0.5468026, 1.566225, 1, 0, 0.372549, 1,
1.494662, -0.4738601, 2.943876, 1, 0, 0.3647059, 1,
1.496813, 0.2838704, 1.088519, 1, 0, 0.3607843, 1,
1.499092, 0.1538069, 1.909012, 1, 0, 0.3529412, 1,
1.503333, -0.5182355, 1.870014, 1, 0, 0.3490196, 1,
1.519484, -0.4162814, 3.947912, 1, 0, 0.3411765, 1,
1.521724, -0.5114185, 2.447766, 1, 0, 0.3372549, 1,
1.526199, 0.5788181, -0.6679553, 1, 0, 0.3294118, 1,
1.533611, -0.3780977, 2.103578, 1, 0, 0.3254902, 1,
1.546733, 1.232473, -0.1308409, 1, 0, 0.3176471, 1,
1.55957, -0.2588188, 3.459511, 1, 0, 0.3137255, 1,
1.566257, -2.040211, 0.5192805, 1, 0, 0.3058824, 1,
1.574557, 0.1226814, 0.9196362, 1, 0, 0.2980392, 1,
1.574804, 0.3040405, 1.339579, 1, 0, 0.2941177, 1,
1.582249, -2.16891, 3.435879, 1, 0, 0.2862745, 1,
1.58998, 0.3386247, 1.030563, 1, 0, 0.282353, 1,
1.598712, -2.066561, 2.415525, 1, 0, 0.2745098, 1,
1.618754, 1.362464, 0.6660243, 1, 0, 0.2705882, 1,
1.635717, 2.038475, 3.771608, 1, 0, 0.2627451, 1,
1.654186, 0.5909578, -0.1921395, 1, 0, 0.2588235, 1,
1.692907, -0.5515543, 2.362849, 1, 0, 0.2509804, 1,
1.701241, -1.063853, 1.857369, 1, 0, 0.2470588, 1,
1.714809, 0.8355599, 1.113432, 1, 0, 0.2392157, 1,
1.715713, -2.271291, 2.318162, 1, 0, 0.2352941, 1,
1.721337, -0.33192, 2.809326, 1, 0, 0.227451, 1,
1.729526, 0.08498702, 0.6531478, 1, 0, 0.2235294, 1,
1.734712, -0.6446641, 1.764517, 1, 0, 0.2156863, 1,
1.7586, 0.4807211, 1.262597, 1, 0, 0.2117647, 1,
1.765439, -1.635606, 0.8634473, 1, 0, 0.2039216, 1,
1.783046, -0.8605348, 2.389227, 1, 0, 0.1960784, 1,
1.791823, 0.7043917, 2.410878, 1, 0, 0.1921569, 1,
1.799077, -0.6506299, 1.886043, 1, 0, 0.1843137, 1,
1.834456, -0.500984, 2.669714, 1, 0, 0.1803922, 1,
1.838594, -1.442264, 2.507955, 1, 0, 0.172549, 1,
1.862198, -0.4002291, 2.45136, 1, 0, 0.1686275, 1,
1.89533, 0.7392908, -0.2806715, 1, 0, 0.1607843, 1,
1.897549, -0.3612654, 1.338452, 1, 0, 0.1568628, 1,
1.939595, -0.1115497, -0.1299298, 1, 0, 0.1490196, 1,
2.042984, -0.3628374, 4.266404, 1, 0, 0.145098, 1,
2.060734, 0.6514109, 0.5632637, 1, 0, 0.1372549, 1,
2.061918, -0.2581925, 2.51617, 1, 0, 0.1333333, 1,
2.080115, 2.427165, -0.4125497, 1, 0, 0.1254902, 1,
2.092116, 0.8353566, 2.222413, 1, 0, 0.1215686, 1,
2.169534, -1.573237, 2.063201, 1, 0, 0.1137255, 1,
2.176622, -0.4871526, 2.091933, 1, 0, 0.1098039, 1,
2.218292, 0.09083664, -0.502045, 1, 0, 0.1019608, 1,
2.387154, -0.5468269, 0.8433661, 1, 0, 0.09411765, 1,
2.431839, 0.06416946, 1.273448, 1, 0, 0.09019608, 1,
2.452647, -0.7624061, 0.612431, 1, 0, 0.08235294, 1,
2.453517, 2.266467, -0.3294078, 1, 0, 0.07843138, 1,
2.496765, -0.8553055, 2.009855, 1, 0, 0.07058824, 1,
2.543267, 0.1323394, 3.451192, 1, 0, 0.06666667, 1,
2.581548, 0.7919643, 2.241872, 1, 0, 0.05882353, 1,
2.64924, 0.9610034, 0.1059718, 1, 0, 0.05490196, 1,
2.720698, -1.44163, 3.890968, 1, 0, 0.04705882, 1,
2.762292, -0.2663332, 1.938769, 1, 0, 0.04313726, 1,
2.805278, -0.2348125, 1.63616, 1, 0, 0.03529412, 1,
2.839322, 0.1525135, 0.403503, 1, 0, 0.03137255, 1,
2.841712, 0.1787373, 1.824419, 1, 0, 0.02352941, 1,
2.995009, -1.170767, 2.910657, 1, 0, 0.01960784, 1,
3.011418, 1.297264, 2.105759, 1, 0, 0.01176471, 1,
3.279705, 0.08080824, 1.632771, 1, 0, 0.007843138, 1
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
0.01352787, -4.736087, -7.394602, 0, -0.5, 0.5, 0.5,
0.01352787, -4.736087, -7.394602, 1, -0.5, 0.5, 0.5,
0.01352787, -4.736087, -7.394602, 1, 1.5, 0.5, 0.5,
0.01352787, -4.736087, -7.394602, 0, 1.5, 0.5, 0.5
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
-4.359884, -0.2782158, -7.394602, 0, -0.5, 0.5, 0.5,
-4.359884, -0.2782158, -7.394602, 1, -0.5, 0.5, 0.5,
-4.359884, -0.2782158, -7.394602, 1, 1.5, 0.5, 0.5,
-4.359884, -0.2782158, -7.394602, 0, 1.5, 0.5, 0.5
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
-4.359884, -4.736087, -0.02220011, 0, -0.5, 0.5, 0.5,
-4.359884, -4.736087, -0.02220011, 1, -0.5, 0.5, 0.5,
-4.359884, -4.736087, -0.02220011, 1, 1.5, 0.5, 0.5,
-4.359884, -4.736087, -0.02220011, 0, 1.5, 0.5, 0.5
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
-3, -3.707348, -5.693278,
3, -3.707348, -5.693278,
-3, -3.707348, -5.693278,
-3, -3.878804, -5.976832,
-2, -3.707348, -5.693278,
-2, -3.878804, -5.976832,
-1, -3.707348, -5.693278,
-1, -3.878804, -5.976832,
0, -3.707348, -5.693278,
0, -3.878804, -5.976832,
1, -3.707348, -5.693278,
1, -3.878804, -5.976832,
2, -3.707348, -5.693278,
2, -3.878804, -5.976832,
3, -3.707348, -5.693278,
3, -3.878804, -5.976832
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
-3, -4.221717, -6.54394, 0, -0.5, 0.5, 0.5,
-3, -4.221717, -6.54394, 1, -0.5, 0.5, 0.5,
-3, -4.221717, -6.54394, 1, 1.5, 0.5, 0.5,
-3, -4.221717, -6.54394, 0, 1.5, 0.5, 0.5,
-2, -4.221717, -6.54394, 0, -0.5, 0.5, 0.5,
-2, -4.221717, -6.54394, 1, -0.5, 0.5, 0.5,
-2, -4.221717, -6.54394, 1, 1.5, 0.5, 0.5,
-2, -4.221717, -6.54394, 0, 1.5, 0.5, 0.5,
-1, -4.221717, -6.54394, 0, -0.5, 0.5, 0.5,
-1, -4.221717, -6.54394, 1, -0.5, 0.5, 0.5,
-1, -4.221717, -6.54394, 1, 1.5, 0.5, 0.5,
-1, -4.221717, -6.54394, 0, 1.5, 0.5, 0.5,
0, -4.221717, -6.54394, 0, -0.5, 0.5, 0.5,
0, -4.221717, -6.54394, 1, -0.5, 0.5, 0.5,
0, -4.221717, -6.54394, 1, 1.5, 0.5, 0.5,
0, -4.221717, -6.54394, 0, 1.5, 0.5, 0.5,
1, -4.221717, -6.54394, 0, -0.5, 0.5, 0.5,
1, -4.221717, -6.54394, 1, -0.5, 0.5, 0.5,
1, -4.221717, -6.54394, 1, 1.5, 0.5, 0.5,
1, -4.221717, -6.54394, 0, 1.5, 0.5, 0.5,
2, -4.221717, -6.54394, 0, -0.5, 0.5, 0.5,
2, -4.221717, -6.54394, 1, -0.5, 0.5, 0.5,
2, -4.221717, -6.54394, 1, 1.5, 0.5, 0.5,
2, -4.221717, -6.54394, 0, 1.5, 0.5, 0.5,
3, -4.221717, -6.54394, 0, -0.5, 0.5, 0.5,
3, -4.221717, -6.54394, 1, -0.5, 0.5, 0.5,
3, -4.221717, -6.54394, 1, 1.5, 0.5, 0.5,
3, -4.221717, -6.54394, 0, 1.5, 0.5, 0.5
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
-3.350635, -3, -5.693278,
-3.350635, 3, -5.693278,
-3.350635, -3, -5.693278,
-3.518843, -3, -5.976832,
-3.350635, -2, -5.693278,
-3.518843, -2, -5.976832,
-3.350635, -1, -5.693278,
-3.518843, -1, -5.976832,
-3.350635, 0, -5.693278,
-3.518843, 0, -5.976832,
-3.350635, 1, -5.693278,
-3.518843, 1, -5.976832,
-3.350635, 2, -5.693278,
-3.518843, 2, -5.976832,
-3.350635, 3, -5.693278,
-3.518843, 3, -5.976832
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3.855259, -3, -6.54394, 0, -0.5, 0.5, 0.5,
-3.855259, -3, -6.54394, 1, -0.5, 0.5, 0.5,
-3.855259, -3, -6.54394, 1, 1.5, 0.5, 0.5,
-3.855259, -3, -6.54394, 0, 1.5, 0.5, 0.5,
-3.855259, -2, -6.54394, 0, -0.5, 0.5, 0.5,
-3.855259, -2, -6.54394, 1, -0.5, 0.5, 0.5,
-3.855259, -2, -6.54394, 1, 1.5, 0.5, 0.5,
-3.855259, -2, -6.54394, 0, 1.5, 0.5, 0.5,
-3.855259, -1, -6.54394, 0, -0.5, 0.5, 0.5,
-3.855259, -1, -6.54394, 1, -0.5, 0.5, 0.5,
-3.855259, -1, -6.54394, 1, 1.5, 0.5, 0.5,
-3.855259, -1, -6.54394, 0, 1.5, 0.5, 0.5,
-3.855259, 0, -6.54394, 0, -0.5, 0.5, 0.5,
-3.855259, 0, -6.54394, 1, -0.5, 0.5, 0.5,
-3.855259, 0, -6.54394, 1, 1.5, 0.5, 0.5,
-3.855259, 0, -6.54394, 0, 1.5, 0.5, 0.5,
-3.855259, 1, -6.54394, 0, -0.5, 0.5, 0.5,
-3.855259, 1, -6.54394, 1, -0.5, 0.5, 0.5,
-3.855259, 1, -6.54394, 1, 1.5, 0.5, 0.5,
-3.855259, 1, -6.54394, 0, 1.5, 0.5, 0.5,
-3.855259, 2, -6.54394, 0, -0.5, 0.5, 0.5,
-3.855259, 2, -6.54394, 1, -0.5, 0.5, 0.5,
-3.855259, 2, -6.54394, 1, 1.5, 0.5, 0.5,
-3.855259, 2, -6.54394, 0, 1.5, 0.5, 0.5,
-3.855259, 3, -6.54394, 0, -0.5, 0.5, 0.5,
-3.855259, 3, -6.54394, 1, -0.5, 0.5, 0.5,
-3.855259, 3, -6.54394, 1, 1.5, 0.5, 0.5,
-3.855259, 3, -6.54394, 0, 1.5, 0.5, 0.5
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
-3.350635, -3.707348, -4,
-3.350635, -3.707348, 4,
-3.350635, -3.707348, -4,
-3.518843, -3.878804, -4,
-3.350635, -3.707348, -2,
-3.518843, -3.878804, -2,
-3.350635, -3.707348, 0,
-3.518843, -3.878804, 0,
-3.350635, -3.707348, 2,
-3.518843, -3.878804, 2,
-3.350635, -3.707348, 4,
-3.518843, -3.878804, 4
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
-3.855259, -4.221717, -4, 0, -0.5, 0.5, 0.5,
-3.855259, -4.221717, -4, 1, -0.5, 0.5, 0.5,
-3.855259, -4.221717, -4, 1, 1.5, 0.5, 0.5,
-3.855259, -4.221717, -4, 0, 1.5, 0.5, 0.5,
-3.855259, -4.221717, -2, 0, -0.5, 0.5, 0.5,
-3.855259, -4.221717, -2, 1, -0.5, 0.5, 0.5,
-3.855259, -4.221717, -2, 1, 1.5, 0.5, 0.5,
-3.855259, -4.221717, -2, 0, 1.5, 0.5, 0.5,
-3.855259, -4.221717, 0, 0, -0.5, 0.5, 0.5,
-3.855259, -4.221717, 0, 1, -0.5, 0.5, 0.5,
-3.855259, -4.221717, 0, 1, 1.5, 0.5, 0.5,
-3.855259, -4.221717, 0, 0, 1.5, 0.5, 0.5,
-3.855259, -4.221717, 2, 0, -0.5, 0.5, 0.5,
-3.855259, -4.221717, 2, 1, -0.5, 0.5, 0.5,
-3.855259, -4.221717, 2, 1, 1.5, 0.5, 0.5,
-3.855259, -4.221717, 2, 0, 1.5, 0.5, 0.5,
-3.855259, -4.221717, 4, 0, -0.5, 0.5, 0.5,
-3.855259, -4.221717, 4, 1, -0.5, 0.5, 0.5,
-3.855259, -4.221717, 4, 1, 1.5, 0.5, 0.5,
-3.855259, -4.221717, 4, 0, 1.5, 0.5, 0.5
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
-3.350635, -3.707348, -5.693278,
-3.350635, 3.150916, -5.693278,
-3.350635, -3.707348, 5.648878,
-3.350635, 3.150916, 5.648878,
-3.350635, -3.707348, -5.693278,
-3.350635, -3.707348, 5.648878,
-3.350635, 3.150916, -5.693278,
-3.350635, 3.150916, 5.648878,
-3.350635, -3.707348, -5.693278,
3.377691, -3.707348, -5.693278,
-3.350635, -3.707348, 5.648878,
3.377691, -3.707348, 5.648878,
-3.350635, 3.150916, -5.693278,
3.377691, 3.150916, -5.693278,
-3.350635, 3.150916, 5.648878,
3.377691, 3.150916, 5.648878,
3.377691, -3.707348, -5.693278,
3.377691, 3.150916, -5.693278,
3.377691, -3.707348, 5.648878,
3.377691, 3.150916, 5.648878,
3.377691, -3.707348, -5.693278,
3.377691, -3.707348, 5.648878,
3.377691, 3.150916, -5.693278,
3.377691, 3.150916, 5.648878
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
var radius = 7.937306;
var distance = 35.31397;
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
mvMatrix.translate( -0.01352787, 0.2782158, 0.02220011 );
mvMatrix.scale( 1.275499, 1.251333, 0.7566437 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.31397);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Paclobutrazol<-read.table("Paclobutrazol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Paclobutrazol$V2
```

```
## Error in eval(expr, envir, enclos): object 'Paclobutrazol' not found
```

```r
y<-Paclobutrazol$V3
```

```
## Error in eval(expr, envir, enclos): object 'Paclobutrazol' not found
```

```r
z<-Paclobutrazol$V4
```

```
## Error in eval(expr, envir, enclos): object 'Paclobutrazol' not found
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
-3.25265, -0.5907934, -2.265996, 0, 0, 1, 1, 1,
-2.566645, 2.315863, -0.4165671, 1, 0, 0, 1, 1,
-2.516291, 1.146183, -1.451335, 1, 0, 0, 1, 1,
-2.46003, -0.1175544, -2.091731, 1, 0, 0, 1, 1,
-2.422656, -0.4272659, -1.652277, 1, 0, 0, 1, 1,
-2.304617, 0.9951977, -1.817514, 1, 0, 0, 1, 1,
-2.186817, -1.909565, -1.771158, 0, 0, 0, 1, 1,
-2.163073, 0.6178012, -1.532564, 0, 0, 0, 1, 1,
-2.143719, -0.7024087, -3.809237, 0, 0, 0, 1, 1,
-2.138561, -2.008945, -3.339387, 0, 0, 0, 1, 1,
-2.089965, -0.0159098, -2.676344, 0, 0, 0, 1, 1,
-2.081492, -1.561629, -2.016757, 0, 0, 0, 1, 1,
-2.078601, 0.9405339, -2.141776, 0, 0, 0, 1, 1,
-2.022927, -0.1900402, -2.62012, 1, 1, 1, 1, 1,
-2.015851, -0.008279549, -0.2069381, 1, 1, 1, 1, 1,
-2.002948, 0.1224319, 0.2008668, 1, 1, 1, 1, 1,
-1.998275, -0.2720233, -0.430887, 1, 1, 1, 1, 1,
-1.983019, -0.7808506, -2.168226, 1, 1, 1, 1, 1,
-1.961603, -0.02250789, -0.92802, 1, 1, 1, 1, 1,
-1.949511, -0.4072428, -2.189815, 1, 1, 1, 1, 1,
-1.936999, 0.341319, -1.737262, 1, 1, 1, 1, 1,
-1.921538, 1.512435, -1.203718, 1, 1, 1, 1, 1,
-1.916192, -2.412513, -2.705582, 1, 1, 1, 1, 1,
-1.886276, -0.2223389, -2.364126, 1, 1, 1, 1, 1,
-1.881895, -1.153351, -1.319719, 1, 1, 1, 1, 1,
-1.876537, -1.951335, -0.852409, 1, 1, 1, 1, 1,
-1.855073, -0.1834467, -0.8799196, 1, 1, 1, 1, 1,
-1.852825, -0.3932219, -1.509621, 1, 1, 1, 1, 1,
-1.852751, -0.646381, -1.598124, 0, 0, 1, 1, 1,
-1.847449, 1.404813, -1.839632, 1, 0, 0, 1, 1,
-1.827691, 0.3461066, -2.487209, 1, 0, 0, 1, 1,
-1.796972, 1.282542, -0.1115211, 1, 0, 0, 1, 1,
-1.781064, -0.0728741, -0.1438624, 1, 0, 0, 1, 1,
-1.777652, -0.5017152, -1.718069, 1, 0, 0, 1, 1,
-1.776487, -0.08165384, 0.5902137, 0, 0, 0, 1, 1,
-1.761861, -0.3080204, -1.436581, 0, 0, 0, 1, 1,
-1.759719, 0.2496469, -2.113074, 0, 0, 0, 1, 1,
-1.756623, -0.4798218, -2.105128, 0, 0, 0, 1, 1,
-1.739502, -0.05095891, -2.467933, 0, 0, 0, 1, 1,
-1.738516, -1.051178, -2.601501, 0, 0, 0, 1, 1,
-1.730246, 0.03188264, -1.061969, 0, 0, 0, 1, 1,
-1.729709, 1.239829, -0.4230117, 1, 1, 1, 1, 1,
-1.715614, 2.110165, -1.336116, 1, 1, 1, 1, 1,
-1.682668, 0.8679369, -2.050526, 1, 1, 1, 1, 1,
-1.675419, -0.5796198, 0.9968209, 1, 1, 1, 1, 1,
-1.673057, -1.074656, -3.34723, 1, 1, 1, 1, 1,
-1.67028, 1.507101, -0.9887942, 1, 1, 1, 1, 1,
-1.663883, -0.2841513, -3.924962, 1, 1, 1, 1, 1,
-1.659632, 0.3544924, -1.243858, 1, 1, 1, 1, 1,
-1.658627, 1.121886, -1.707315, 1, 1, 1, 1, 1,
-1.657838, 0.4519737, -2.042317, 1, 1, 1, 1, 1,
-1.654773, -1.496343, -2.917798, 1, 1, 1, 1, 1,
-1.653103, -0.5115808, 0.4992338, 1, 1, 1, 1, 1,
-1.64515, -2.163425, -5.528101, 1, 1, 1, 1, 1,
-1.618919, 0.409948, -0.9527995, 1, 1, 1, 1, 1,
-1.616567, -0.4866217, -3.151801, 1, 1, 1, 1, 1,
-1.601332, 0.1173442, -3.629847, 0, 0, 1, 1, 1,
-1.577063, 1.403872, -0.03186076, 1, 0, 0, 1, 1,
-1.561697, -1.455851, -2.423928, 1, 0, 0, 1, 1,
-1.561499, -1.79459, -1.04109, 1, 0, 0, 1, 1,
-1.560484, -0.430465, -1.746436, 1, 0, 0, 1, 1,
-1.558903, -0.1064208, -1.976873, 1, 0, 0, 1, 1,
-1.558509, -0.2280357, -1.423838, 0, 0, 0, 1, 1,
-1.555468, -0.586783, -0.8039793, 0, 0, 0, 1, 1,
-1.552134, 1.508115, -1.242703, 0, 0, 0, 1, 1,
-1.550049, 0.4857558, -1.254328, 0, 0, 0, 1, 1,
-1.530182, -0.2963747, 0.3972328, 0, 0, 0, 1, 1,
-1.508192, -0.6526268, -2.981869, 0, 0, 0, 1, 1,
-1.504875, -0.8829127, -1.627437, 0, 0, 0, 1, 1,
-1.487056, 0.3934256, -1.851593, 1, 1, 1, 1, 1,
-1.486531, -0.257471, -1.239606, 1, 1, 1, 1, 1,
-1.473285, -0.7176442, -1.753006, 1, 1, 1, 1, 1,
-1.469112, 0.607105, -3.900982, 1, 1, 1, 1, 1,
-1.45739, -0.3774237, -2.816806, 1, 1, 1, 1, 1,
-1.448353, -0.2485884, -1.71752, 1, 1, 1, 1, 1,
-1.432805, 0.2550946, -1.738681, 1, 1, 1, 1, 1,
-1.430295, 0.7647734, 0.7441517, 1, 1, 1, 1, 1,
-1.430263, -0.9250954, -2.718873, 1, 1, 1, 1, 1,
-1.428711, -0.8752857, -1.017115, 1, 1, 1, 1, 1,
-1.425802, 0.1400081, -1.776138, 1, 1, 1, 1, 1,
-1.422656, 0.857777, -1.020576, 1, 1, 1, 1, 1,
-1.416088, 0.8527275, -1.784219, 1, 1, 1, 1, 1,
-1.400457, -0.3176422, -0.8872021, 1, 1, 1, 1, 1,
-1.390957, 0.8282885, -0.7659684, 1, 1, 1, 1, 1,
-1.363289, -0.4404293, -1.557264, 0, 0, 1, 1, 1,
-1.361214, 0.5870234, -1.687407, 1, 0, 0, 1, 1,
-1.343145, 0.08775564, -1.835778, 1, 0, 0, 1, 1,
-1.334733, 0.830587, -2.327802, 1, 0, 0, 1, 1,
-1.31924, -0.6028168, -1.733224, 1, 0, 0, 1, 1,
-1.312712, -1.59882, -2.670622, 1, 0, 0, 1, 1,
-1.312202, 0.8906468, -0.9205106, 0, 0, 0, 1, 1,
-1.308374, -0.02556741, -1.384071, 0, 0, 0, 1, 1,
-1.307254, -0.03908304, -2.386964, 0, 0, 0, 1, 1,
-1.302683, 1.145256, -0.8159166, 0, 0, 0, 1, 1,
-1.296272, 1.437763, -0.1973463, 0, 0, 0, 1, 1,
-1.291535, 0.8703194, -0.8433766, 0, 0, 0, 1, 1,
-1.271829, -1.288624, -3.186704, 0, 0, 0, 1, 1,
-1.248997, 0.6806861, -1.522399, 1, 1, 1, 1, 1,
-1.244463, -1.046871, -2.599665, 1, 1, 1, 1, 1,
-1.242853, 1.873179, -0.1105644, 1, 1, 1, 1, 1,
-1.240734, 1.036152, 1.319057, 1, 1, 1, 1, 1,
-1.239411, 1.747475, -1.028323, 1, 1, 1, 1, 1,
-1.236284, 0.007422531, -2.457978, 1, 1, 1, 1, 1,
-1.233715, -0.3885067, -0.504328, 1, 1, 1, 1, 1,
-1.232067, 1.83695, 0.1763673, 1, 1, 1, 1, 1,
-1.224316, -2.089534, -1.250746, 1, 1, 1, 1, 1,
-1.215646, -1.216685, -3.09726, 1, 1, 1, 1, 1,
-1.207172, -0.4432008, -0.2065937, 1, 1, 1, 1, 1,
-1.202582, -0.7603474, -2.12322, 1, 1, 1, 1, 1,
-1.188753, -1.321862, -1.683033, 1, 1, 1, 1, 1,
-1.181006, -2.116574, -3.869299, 1, 1, 1, 1, 1,
-1.177347, -1.639799, -1.540007, 1, 1, 1, 1, 1,
-1.17662, 1.22353, -1.130753, 0, 0, 1, 1, 1,
-1.173932, 0.2850164, -2.896681, 1, 0, 0, 1, 1,
-1.173547, -0.7679639, -1.899243, 1, 0, 0, 1, 1,
-1.172993, 0.677232, -2.120125, 1, 0, 0, 1, 1,
-1.166433, 0.2742835, -1.245121, 1, 0, 0, 1, 1,
-1.163875, 0.5134016, -1.168135, 1, 0, 0, 1, 1,
-1.163613, 1.299446, -1.035251, 0, 0, 0, 1, 1,
-1.163124, -0.03371089, -1.901511, 0, 0, 0, 1, 1,
-1.157306, -0.7245577, -3.04096, 0, 0, 0, 1, 1,
-1.152862, -1.284296, -0.6500069, 0, 0, 0, 1, 1,
-1.148819, 0.8480932, -1.046569, 0, 0, 0, 1, 1,
-1.148168, 1.893567, 0.5838498, 0, 0, 0, 1, 1,
-1.14114, -0.2339596, -0.9153913, 0, 0, 0, 1, 1,
-1.126581, -0.1760097, -1.885811, 1, 1, 1, 1, 1,
-1.118253, 0.8173921, -0.9501878, 1, 1, 1, 1, 1,
-1.117482, 1.072055, -1.7438, 1, 1, 1, 1, 1,
-1.113304, -1.714451, -2.44159, 1, 1, 1, 1, 1,
-1.107162, -0.1888124, -1.968839, 1, 1, 1, 1, 1,
-1.102333, -0.05930922, -0.7741625, 1, 1, 1, 1, 1,
-1.099076, -1.629731, -2.833708, 1, 1, 1, 1, 1,
-1.098843, 1.712621, -1.162654, 1, 1, 1, 1, 1,
-1.090913, -1.113383, -2.813714, 1, 1, 1, 1, 1,
-1.088239, -0.9783882, -1.550782, 1, 1, 1, 1, 1,
-1.08506, -0.7835703, -2.637096, 1, 1, 1, 1, 1,
-1.082847, 1.072898, -1.070657, 1, 1, 1, 1, 1,
-1.082635, 0.08825421, -0.9376183, 1, 1, 1, 1, 1,
-1.080097, 0.116745, -1.939136, 1, 1, 1, 1, 1,
-1.077962, -0.8778333, -2.01463, 1, 1, 1, 1, 1,
-1.077736, 0.2278975, -0.6003084, 0, 0, 1, 1, 1,
-1.07165, 1.028676, 0.8080329, 1, 0, 0, 1, 1,
-1.066016, -1.755564, -2.760169, 1, 0, 0, 1, 1,
-1.062925, -1.65104, -1.172974, 1, 0, 0, 1, 1,
-1.062638, 0.2602397, -2.001361, 1, 0, 0, 1, 1,
-1.061818, -0.2503757, -0.878082, 1, 0, 0, 1, 1,
-1.047542, -0.7059397, -3.111836, 0, 0, 0, 1, 1,
-1.047535, 0.5134734, -1.356921, 0, 0, 0, 1, 1,
-1.044845, 1.884274, -0.8171512, 0, 0, 0, 1, 1,
-1.042108, -0.7269559, -2.487342, 0, 0, 0, 1, 1,
-1.037977, 0.3093517, -2.277879, 0, 0, 0, 1, 1,
-1.035584, 1.309681, -2.073036, 0, 0, 0, 1, 1,
-1.032115, 0.4239586, -2.302223, 0, 0, 0, 1, 1,
-1.03166, 1.769637, -0.781962, 1, 1, 1, 1, 1,
-1.025315, -0.9915712, -0.1632092, 1, 1, 1, 1, 1,
-1.025114, 1.761942, -0.2876957, 1, 1, 1, 1, 1,
-1.02267, -0.01652652, 0.2393604, 1, 1, 1, 1, 1,
-1.006921, -0.1078755, -2.205383, 1, 1, 1, 1, 1,
-0.9999515, -1.923351, -2.728552, 1, 1, 1, 1, 1,
-0.9973371, -0.4890281, -2.553967, 1, 1, 1, 1, 1,
-0.991922, -2.010633, -4.213921, 1, 1, 1, 1, 1,
-0.9835169, -0.5104343, -0.7895297, 1, 1, 1, 1, 1,
-0.9798664, 1.554836, 0.5289428, 1, 1, 1, 1, 1,
-0.9785503, -0.3332005, -4.354027, 1, 1, 1, 1, 1,
-0.9722037, -1.404451, -3.727342, 1, 1, 1, 1, 1,
-0.9716699, 0.2930151, 0.2418511, 1, 1, 1, 1, 1,
-0.9710376, -0.6784562, -0.7423905, 1, 1, 1, 1, 1,
-0.968708, 0.2557752, -0.3754953, 1, 1, 1, 1, 1,
-0.9662649, 0.4644761, 0.2120846, 0, 0, 1, 1, 1,
-0.9549499, 2.324924, 1.423715, 1, 0, 0, 1, 1,
-0.9507851, -0.4895874, -2.02254, 1, 0, 0, 1, 1,
-0.9503089, -0.2779549, -1.664278, 1, 0, 0, 1, 1,
-0.948359, 1.27189, -0.1781879, 1, 0, 0, 1, 1,
-0.9414588, -0.6159642, -1.126605, 1, 0, 0, 1, 1,
-0.932039, 0.8029889, 0.1358204, 0, 0, 0, 1, 1,
-0.9300443, 1.820001, -1.051268, 0, 0, 0, 1, 1,
-0.9251534, 0.6482222, -0.3100866, 0, 0, 0, 1, 1,
-0.9175341, 0.1566715, -2.153864, 0, 0, 0, 1, 1,
-0.9164482, -0.4991477, -3.185669, 0, 0, 0, 1, 1,
-0.9126024, -1.084147, -1.979598, 0, 0, 0, 1, 1,
-0.9114821, 0.1993348, -3.244078, 0, 0, 0, 1, 1,
-0.9107738, 0.2746247, -1.404949, 1, 1, 1, 1, 1,
-0.908103, 0.1367471, 0.1071961, 1, 1, 1, 1, 1,
-0.9073626, -0.7679108, -1.439762, 1, 1, 1, 1, 1,
-0.9052154, 0.5349119, -0.2549939, 1, 1, 1, 1, 1,
-0.8975652, -0.7154915, -1.561575, 1, 1, 1, 1, 1,
-0.8918193, 1.304111, 0.361532, 1, 1, 1, 1, 1,
-0.8909615, 1.838166, -0.4388214, 1, 1, 1, 1, 1,
-0.8906696, -0.7276857, -2.437793, 1, 1, 1, 1, 1,
-0.8891814, 0.8422062, -0.2585609, 1, 1, 1, 1, 1,
-0.8884705, -0.6601949, -1.651484, 1, 1, 1, 1, 1,
-0.8847228, -0.2398296, -2.501689, 1, 1, 1, 1, 1,
-0.8820036, -0.4560413, -4.418542, 1, 1, 1, 1, 1,
-0.878432, 0.352614, -2.725308, 1, 1, 1, 1, 1,
-0.8612688, -3.60747, -2.888811, 1, 1, 1, 1, 1,
-0.8569257, 1.55011, -1.357768, 1, 1, 1, 1, 1,
-0.850496, -0.5165964, -3.652491, 0, 0, 1, 1, 1,
-0.8490607, -0.07194886, -1.418718, 1, 0, 0, 1, 1,
-0.8477719, -0.1778796, -2.574293, 1, 0, 0, 1, 1,
-0.8415495, 0.6053813, -2.165571, 1, 0, 0, 1, 1,
-0.8398911, 0.4318914, -2.033938, 1, 0, 0, 1, 1,
-0.839375, -0.718392, -0.8673145, 1, 0, 0, 1, 1,
-0.8326064, -0.2307535, -2.500146, 0, 0, 0, 1, 1,
-0.8310502, 1.01366, -0.4721553, 0, 0, 0, 1, 1,
-0.8306008, 0.2859543, -0.2081983, 0, 0, 0, 1, 1,
-0.828469, -0.3208038, -0.6969952, 0, 0, 0, 1, 1,
-0.8173817, -0.7584851, -1.392648, 0, 0, 0, 1, 1,
-0.8155014, -0.7551155, -3.842753, 0, 0, 0, 1, 1,
-0.8079737, -0.5856485, -4.81537, 0, 0, 0, 1, 1,
-0.8077175, 0.9485914, 0.4360432, 1, 1, 1, 1, 1,
-0.805146, -0.3440347, -2.919978, 1, 1, 1, 1, 1,
-0.805034, 0.04335019, -1.990639, 1, 1, 1, 1, 1,
-0.8046581, 0.3235498, -1.016596, 1, 1, 1, 1, 1,
-0.8039475, 0.8121459, 0.6376907, 1, 1, 1, 1, 1,
-0.8028268, -0.3899733, -2.801013, 1, 1, 1, 1, 1,
-0.8026121, 0.04838711, -0.9660031, 1, 1, 1, 1, 1,
-0.8013006, -0.3234071, -2.491601, 1, 1, 1, 1, 1,
-0.7997305, -1.115771, -2.201649, 1, 1, 1, 1, 1,
-0.7988521, -1.232433, -1.557211, 1, 1, 1, 1, 1,
-0.7965068, 0.5398909, -1.239953, 1, 1, 1, 1, 1,
-0.796486, 0.3304046, -2.07159, 1, 1, 1, 1, 1,
-0.7964538, -0.8880798, -2.273406, 1, 1, 1, 1, 1,
-0.790176, 0.8945366, 0.6457717, 1, 1, 1, 1, 1,
-0.7844808, 1.092622, 0.0680578, 1, 1, 1, 1, 1,
-0.7840464, 1.424614, -0.4009252, 0, 0, 1, 1, 1,
-0.7664359, 0.721053, 1.655645, 1, 0, 0, 1, 1,
-0.7586951, 0.2069849, -0.8157098, 1, 0, 0, 1, 1,
-0.7559194, -2.051042, -1.388205, 1, 0, 0, 1, 1,
-0.749917, -1.5009, -1.532254, 1, 0, 0, 1, 1,
-0.743575, 1.951299, 0.740285, 1, 0, 0, 1, 1,
-0.7404937, 0.5595708, -1.716972, 0, 0, 0, 1, 1,
-0.7333744, 0.5469295, 0.3191886, 0, 0, 0, 1, 1,
-0.7311844, -1.214301, -4.666513, 0, 0, 0, 1, 1,
-0.7207777, 0.7987639, -0.8834944, 0, 0, 0, 1, 1,
-0.7194886, -1.030336, -3.395442, 0, 0, 0, 1, 1,
-0.7188389, -0.3792987, -1.586431, 0, 0, 0, 1, 1,
-0.7184309, 1.834495, -2.480325, 0, 0, 0, 1, 1,
-0.7112076, 0.3035682, 0.1727567, 1, 1, 1, 1, 1,
-0.7111147, 1.336073, 0.1624349, 1, 1, 1, 1, 1,
-0.7090368, -0.2484317, -2.623139, 1, 1, 1, 1, 1,
-0.7074146, 1.064019, -1.28087, 1, 1, 1, 1, 1,
-0.699505, 0.3119659, 0.4491939, 1, 1, 1, 1, 1,
-0.6966681, -0.6160569, -2.689523, 1, 1, 1, 1, 1,
-0.6965738, -1.135513, -2.128175, 1, 1, 1, 1, 1,
-0.6965438, 1.562515, -1.480561, 1, 1, 1, 1, 1,
-0.6955047, 0.1316157, -0.4331879, 1, 1, 1, 1, 1,
-0.6953673, -0.8128359, -1.903409, 1, 1, 1, 1, 1,
-0.6863089, -1.105841, -4.486428, 1, 1, 1, 1, 1,
-0.6826233, -0.5851503, -1.50427, 1, 1, 1, 1, 1,
-0.6807558, 1.083028, -0.1446239, 1, 1, 1, 1, 1,
-0.6747909, -0.6368782, -4.397424, 1, 1, 1, 1, 1,
-0.6701285, -0.4956713, -3.630858, 1, 1, 1, 1, 1,
-0.6668975, -1.369926, -1.250603, 0, 0, 1, 1, 1,
-0.6627302, 0.5099115, -1.635189, 1, 0, 0, 1, 1,
-0.6507859, 0.223671, -1.513139, 1, 0, 0, 1, 1,
-0.6474259, -0.6428267, -1.44958, 1, 0, 0, 1, 1,
-0.6459959, 0.1883608, -2.940901, 1, 0, 0, 1, 1,
-0.6456378, -0.1437515, -2.136818, 1, 0, 0, 1, 1,
-0.6380992, 0.0454428, -2.094819, 0, 0, 0, 1, 1,
-0.635631, 1.143565, -0.4669742, 0, 0, 0, 1, 1,
-0.6261486, -0.5256532, -2.894762, 0, 0, 0, 1, 1,
-0.6258179, 0.9803675, -2.12708, 0, 0, 0, 1, 1,
-0.6234028, 1.184317, -0.3542017, 0, 0, 0, 1, 1,
-0.620103, -2.107374, -4.784686, 0, 0, 0, 1, 1,
-0.6169605, -1.731636, -2.78913, 0, 0, 0, 1, 1,
-0.612124, 0.5093701, 0.5295983, 1, 1, 1, 1, 1,
-0.6118218, -0.07106412, -1.954951, 1, 1, 1, 1, 1,
-0.6115679, -1.655734, -2.749943, 1, 1, 1, 1, 1,
-0.6089053, 0.03741409, -1.272299, 1, 1, 1, 1, 1,
-0.6075959, 1.866142, -0.2158195, 1, 1, 1, 1, 1,
-0.6069, 0.816704, -1.638581, 1, 1, 1, 1, 1,
-0.603334, 1.408521, 0.7220593, 1, 1, 1, 1, 1,
-0.6031407, 0.9732236, -1.302469, 1, 1, 1, 1, 1,
-0.6010023, -0.6467569, -1.595359, 1, 1, 1, 1, 1,
-0.5996253, -2.020208, -3.654493, 1, 1, 1, 1, 1,
-0.5975906, 1.105945, -0.9696389, 1, 1, 1, 1, 1,
-0.5972115, -0.7747903, -3.681041, 1, 1, 1, 1, 1,
-0.5786126, 0.8769931, -0.2143354, 1, 1, 1, 1, 1,
-0.5771024, -0.2320461, -1.747005, 1, 1, 1, 1, 1,
-0.5680937, -0.05422658, -1.03016, 1, 1, 1, 1, 1,
-0.566478, -1.262237, -2.242769, 0, 0, 1, 1, 1,
-0.5655022, -0.4530473, -2.172931, 1, 0, 0, 1, 1,
-0.5628278, -0.8315264, -4.370697, 1, 0, 0, 1, 1,
-0.5575616, -0.2298324, -1.428018, 1, 0, 0, 1, 1,
-0.5553039, 0.972225, -0.3488092, 1, 0, 0, 1, 1,
-0.5545958, -0.3913198, -0.5283682, 1, 0, 0, 1, 1,
-0.550086, -0.3995795, -4.448524, 0, 0, 0, 1, 1,
-0.5497584, -0.2713305, -2.254034, 0, 0, 0, 1, 1,
-0.5411007, -0.09069457, -0.2352867, 0, 0, 0, 1, 1,
-0.5395066, 0.7795269, -0.2774307, 0, 0, 0, 1, 1,
-0.5391623, -0.586352, -2.80233, 0, 0, 0, 1, 1,
-0.5390639, 2.19929, -2.157245, 0, 0, 0, 1, 1,
-0.5377542, -1.220617, -2.38894, 0, 0, 0, 1, 1,
-0.5342597, -1.72493, -1.876858, 1, 1, 1, 1, 1,
-0.5297322, -0.2383372, -4.5372, 1, 1, 1, 1, 1,
-0.5273434, 1.928082, 0.9285273, 1, 1, 1, 1, 1,
-0.5260666, -1.325708, -2.245795, 1, 1, 1, 1, 1,
-0.5193778, 0.3908147, -3.057742, 1, 1, 1, 1, 1,
-0.5184292, 0.305816, -0.05153548, 1, 1, 1, 1, 1,
-0.5117327, -0.63472, -1.935041, 1, 1, 1, 1, 1,
-0.5103233, 1.137606, 0.7132446, 1, 1, 1, 1, 1,
-0.5099099, -1.185188, -3.865031, 1, 1, 1, 1, 1,
-0.5038437, 0.7100649, 0.7520012, 1, 1, 1, 1, 1,
-0.5018013, -1.270298, -1.646418, 1, 1, 1, 1, 1,
-0.4978439, -1.912814, -1.950912, 1, 1, 1, 1, 1,
-0.4963863, 0.4461411, -1.164761, 1, 1, 1, 1, 1,
-0.4883524, -1.545716, -1.781151, 1, 1, 1, 1, 1,
-0.4879995, 0.8824395, -1.006135, 1, 1, 1, 1, 1,
-0.4852165, 1.119703, -0.4392689, 0, 0, 1, 1, 1,
-0.4802375, -0.4613301, -3.051792, 1, 0, 0, 1, 1,
-0.4767846, -0.1743591, -2.171596, 1, 0, 0, 1, 1,
-0.4738812, 0.4345864, -1.773046, 1, 0, 0, 1, 1,
-0.4626572, 0.3117941, -0.6585406, 1, 0, 0, 1, 1,
-0.4539139, -1.488561, -1.651565, 1, 0, 0, 1, 1,
-0.4507184, -0.01077912, -0.3946965, 0, 0, 0, 1, 1,
-0.4500566, 0.5117251, -1.014277, 0, 0, 0, 1, 1,
-0.4492659, -0.1368005, -1.029227, 0, 0, 0, 1, 1,
-0.4487348, 0.8278654, -2.049294, 0, 0, 0, 1, 1,
-0.4466735, -0.3917444, -0.3220486, 0, 0, 0, 1, 1,
-0.4461719, -1.543611, -4.151917, 0, 0, 0, 1, 1,
-0.4442841, 0.8194005, -0.3813008, 0, 0, 0, 1, 1,
-0.441188, 0.6410922, -1.47303, 1, 1, 1, 1, 1,
-0.4398793, 1.276573, -1.293542, 1, 1, 1, 1, 1,
-0.43947, 0.6284345, 0.652752, 1, 1, 1, 1, 1,
-0.4364217, 0.0240426, -0.6129071, 1, 1, 1, 1, 1,
-0.435733, 0.2359007, -1.595115, 1, 1, 1, 1, 1,
-0.4356767, 1.198107, -1.637771, 1, 1, 1, 1, 1,
-0.4320866, 0.447449, -1.728962, 1, 1, 1, 1, 1,
-0.4275464, -2.378058, -3.671345, 1, 1, 1, 1, 1,
-0.422772, -1.38957, -2.762949, 1, 1, 1, 1, 1,
-0.4217915, -0.7203729, -3.676569, 1, 1, 1, 1, 1,
-0.4172071, 0.7170691, -0.5221136, 1, 1, 1, 1, 1,
-0.4154187, -0.3667416, -1.159917, 1, 1, 1, 1, 1,
-0.4125439, -0.184241, -1.385386, 1, 1, 1, 1, 1,
-0.4117528, -0.8460174, -3.636381, 1, 1, 1, 1, 1,
-0.4113027, 0.8564225, -0.9050305, 1, 1, 1, 1, 1,
-0.409633, -0.807879, -3.933321, 0, 0, 1, 1, 1,
-0.4088546, -0.7791106, -2.820537, 1, 0, 0, 1, 1,
-0.4069701, 1.815818, -0.06588008, 1, 0, 0, 1, 1,
-0.4058525, 0.9616749, -0.03190859, 1, 0, 0, 1, 1,
-0.404864, 0.5249813, -0.5809979, 1, 0, 0, 1, 1,
-0.4036934, 0.2607204, 0.7304257, 1, 0, 0, 1, 1,
-0.4024787, -0.8606013, -4.078031, 0, 0, 0, 1, 1,
-0.4003021, 1.740119, -2.416815, 0, 0, 0, 1, 1,
-0.3980558, 0.2933145, -0.8352402, 0, 0, 0, 1, 1,
-0.3976069, -0.6278483, -1.889514, 0, 0, 0, 1, 1,
-0.396273, -0.1144226, -1.833175, 0, 0, 0, 1, 1,
-0.3950027, -1.829427, -3.802789, 0, 0, 0, 1, 1,
-0.3921359, -0.364676, -1.364859, 0, 0, 0, 1, 1,
-0.3898455, 0.3208825, -1.940291, 1, 1, 1, 1, 1,
-0.3892347, 0.7189699, 0.727031, 1, 1, 1, 1, 1,
-0.3891287, 0.4156757, -0.8485884, 1, 1, 1, 1, 1,
-0.3876232, -0.9088532, -2.074058, 1, 1, 1, 1, 1,
-0.3873959, -0.2641449, -2.110866, 1, 1, 1, 1, 1,
-0.3861385, 0.02964956, -2.522813, 1, 1, 1, 1, 1,
-0.3851765, 0.3713766, -1.270025, 1, 1, 1, 1, 1,
-0.3799571, 0.8864259, -0.7521071, 1, 1, 1, 1, 1,
-0.3778559, 1.032802, 0.6844576, 1, 1, 1, 1, 1,
-0.375163, 0.3127481, -0.1910928, 1, 1, 1, 1, 1,
-0.3746944, -1.812767, -1.420808, 1, 1, 1, 1, 1,
-0.3742884, 0.487851, 0.03897571, 1, 1, 1, 1, 1,
-0.3704536, 0.7092711, -1.783374, 1, 1, 1, 1, 1,
-0.3609509, 0.2594222, -0.5779187, 1, 1, 1, 1, 1,
-0.3586509, -1.078927, -1.806286, 1, 1, 1, 1, 1,
-0.3574945, -0.01386763, -0.9281207, 0, 0, 1, 1, 1,
-0.3559918, -2.382402, -2.994, 1, 0, 0, 1, 1,
-0.3515036, 0.07549802, -1.346499, 1, 0, 0, 1, 1,
-0.3500694, 0.02469996, -2.365519, 1, 0, 0, 1, 1,
-0.3492344, -0.4183533, -1.477125, 1, 0, 0, 1, 1,
-0.3488346, 0.3570935, -1.683534, 1, 0, 0, 1, 1,
-0.3435517, -0.5565861, -1.461299, 0, 0, 0, 1, 1,
-0.3434677, 1.748314, 0.1296581, 0, 0, 0, 1, 1,
-0.3389196, 2.1791, 1.460959, 0, 0, 0, 1, 1,
-0.3386334, -0.7298888, -4.094504, 0, 0, 0, 1, 1,
-0.3339368, -0.5420837, -3.447384, 0, 0, 0, 1, 1,
-0.3334822, -1.07862, -0.9296689, 0, 0, 0, 1, 1,
-0.3326452, -0.4763526, -1.820617, 0, 0, 0, 1, 1,
-0.3324432, -1.010057, -2.9972, 1, 1, 1, 1, 1,
-0.3317195, 0.9131095, 1.198467, 1, 1, 1, 1, 1,
-0.3297779, 0.7395558, -0.3387023, 1, 1, 1, 1, 1,
-0.3283828, 0.6808543, -1.071523, 1, 1, 1, 1, 1,
-0.3273309, -0.7375587, -3.273664, 1, 1, 1, 1, 1,
-0.3212403, -0.3595647, -1.733667, 1, 1, 1, 1, 1,
-0.3197574, -1.675768, -2.765103, 1, 1, 1, 1, 1,
-0.3191577, 0.438526, -1.243071, 1, 1, 1, 1, 1,
-0.3135626, -0.1374047, -3.385464, 1, 1, 1, 1, 1,
-0.3123689, -0.8392652, -2.464161, 1, 1, 1, 1, 1,
-0.3075576, -0.7226928, -1.011981, 1, 1, 1, 1, 1,
-0.3072405, 0.1875841, -0.6990269, 1, 1, 1, 1, 1,
-0.3063085, 0.3236063, -1.998005, 1, 1, 1, 1, 1,
-0.3045361, -0.9893973, -4.082818, 1, 1, 1, 1, 1,
-0.3034934, -0.507521, -3.086498, 1, 1, 1, 1, 1,
-0.3010282, -0.06165941, -3.021762, 0, 0, 1, 1, 1,
-0.2970619, 2.409398, 0.04950821, 1, 0, 0, 1, 1,
-0.2965241, 1.439551, -0.8014716, 1, 0, 0, 1, 1,
-0.2949455, 0.2568072, -1.509126, 1, 0, 0, 1, 1,
-0.2888906, -1.488244, -2.319133, 1, 0, 0, 1, 1,
-0.2888364, -0.9663942, -2.893807, 1, 0, 0, 1, 1,
-0.2810193, -0.1540318, -2.303552, 0, 0, 0, 1, 1,
-0.2787512, 0.3751221, -2.955433, 0, 0, 0, 1, 1,
-0.2783066, -0.1708157, -1.152565, 0, 0, 0, 1, 1,
-0.2778465, 0.1905962, -1.56963, 0, 0, 0, 1, 1,
-0.2752321, 0.7194237, -2.428231, 0, 0, 0, 1, 1,
-0.2752088, 0.8549138, -1.195001, 0, 0, 0, 1, 1,
-0.2692348, 1.519372, -0.4975052, 0, 0, 0, 1, 1,
-0.2681007, 0.6952641, -0.6734797, 1, 1, 1, 1, 1,
-0.2653021, -0.8169349, -3.367751, 1, 1, 1, 1, 1,
-0.2636085, -0.0898158, -0.06982016, 1, 1, 1, 1, 1,
-0.2602256, -0.002834099, -2.240376, 1, 1, 1, 1, 1,
-0.2597134, 0.8467587, -0.1065529, 1, 1, 1, 1, 1,
-0.2595693, -0.1441747, -4.102911, 1, 1, 1, 1, 1,
-0.2593058, -0.3337377, -4.323895, 1, 1, 1, 1, 1,
-0.2553903, 1.45688, 0.6274703, 1, 1, 1, 1, 1,
-0.2540799, -0.09648181, -3.051429, 1, 1, 1, 1, 1,
-0.2539263, 0.2996138, 0.438614, 1, 1, 1, 1, 1,
-0.2486821, -1.085968, -4.831657, 1, 1, 1, 1, 1,
-0.2474522, 0.2920916, -0.8317049, 1, 1, 1, 1, 1,
-0.2451044, 1.316543, 0.6215484, 1, 1, 1, 1, 1,
-0.242927, -0.6220031, -2.322763, 1, 1, 1, 1, 1,
-0.2424487, 0.4773781, -0.5866147, 1, 1, 1, 1, 1,
-0.2393989, -1.404871, -3.256706, 0, 0, 1, 1, 1,
-0.2385597, -0.6309345, -5.226054, 1, 0, 0, 1, 1,
-0.2375651, 1.011848, -0.7754862, 1, 0, 0, 1, 1,
-0.2300883, 0.4465188, -0.5022687, 1, 0, 0, 1, 1,
-0.2300854, 0.02336397, -2.687392, 1, 0, 0, 1, 1,
-0.2299418, -0.8431562, -2.958848, 1, 0, 0, 1, 1,
-0.2297936, -0.274853, -1.848441, 0, 0, 0, 1, 1,
-0.2296482, -1.723893, -1.214088, 0, 0, 0, 1, 1,
-0.2253899, 2.478499, 0.2268989, 0, 0, 0, 1, 1,
-0.2240725, -1.194504, -4.227406, 0, 0, 0, 1, 1,
-0.2238809, 0.4851283, -1.494469, 0, 0, 0, 1, 1,
-0.2230682, -0.9870856, -3.77912, 0, 0, 0, 1, 1,
-0.2211759, 0.7752315, -0.9483353, 0, 0, 0, 1, 1,
-0.2178168, 1.808434, 0.7542659, 1, 1, 1, 1, 1,
-0.2171979, 0.1277561, -0.8295611, 1, 1, 1, 1, 1,
-0.2143168, -1.04228, -2.054203, 1, 1, 1, 1, 1,
-0.2139181, -0.6879838, -3.237295, 1, 1, 1, 1, 1,
-0.207517, 0.301684, 0.06181993, 1, 1, 1, 1, 1,
-0.2059205, 1.110908, -1.845975, 1, 1, 1, 1, 1,
-0.19716, -1.018035, -1.674253, 1, 1, 1, 1, 1,
-0.1945433, -1.400237, -2.064643, 1, 1, 1, 1, 1,
-0.1922281, -0.3898041, -2.993896, 1, 1, 1, 1, 1,
-0.1898996, 1.913795, -1.252086, 1, 1, 1, 1, 1,
-0.1896328, -0.09409146, -3.562088, 1, 1, 1, 1, 1,
-0.1874984, 1.179588, 0.1724882, 1, 1, 1, 1, 1,
-0.1818514, 1.300008, 0.4098788, 1, 1, 1, 1, 1,
-0.1779126, -0.3048413, -2.205989, 1, 1, 1, 1, 1,
-0.1751599, -0.2340872, -2.160125, 1, 1, 1, 1, 1,
-0.174545, -0.9204108, -3.83211, 0, 0, 1, 1, 1,
-0.17387, 0.9899371, -0.1573391, 1, 0, 0, 1, 1,
-0.173811, -0.4744182, -3.221635, 1, 0, 0, 1, 1,
-0.1710086, -0.8012767, -2.408599, 1, 0, 0, 1, 1,
-0.1641801, -1.239396, -1.856597, 1, 0, 0, 1, 1,
-0.1626026, 0.7412207, 0.6658214, 1, 0, 0, 1, 1,
-0.1568076, 2.300531, -0.7541581, 0, 0, 0, 1, 1,
-0.1552992, -0.1426835, -2.602317, 0, 0, 0, 1, 1,
-0.1552315, 0.1006862, 0.1895433, 0, 0, 0, 1, 1,
-0.1509506, 0.7636884, 1.005085, 0, 0, 0, 1, 1,
-0.1412053, 1.115876, -0.3632077, 0, 0, 0, 1, 1,
-0.1386562, -1.720548, -3.477644, 0, 0, 0, 1, 1,
-0.1372248, 0.1822885, -2.465873, 0, 0, 0, 1, 1,
-0.1321009, 0.6435233, -0.5553698, 1, 1, 1, 1, 1,
-0.1318977, -0.402769, -2.326965, 1, 1, 1, 1, 1,
-0.1309484, 0.1614755, 0.3721964, 1, 1, 1, 1, 1,
-0.1276188, 0.4496629, 0.6890928, 1, 1, 1, 1, 1,
-0.1260386, -1.193878, -2.60191, 1, 1, 1, 1, 1,
-0.1252937, 2.044188, -1.381086, 1, 1, 1, 1, 1,
-0.12385, -2.802344, -3.35797, 1, 1, 1, 1, 1,
-0.1225179, -0.3583878, -2.755046, 1, 1, 1, 1, 1,
-0.1214854, 2.241307, 0.9835605, 1, 1, 1, 1, 1,
-0.1207412, 0.0212102, -0.9658923, 1, 1, 1, 1, 1,
-0.1162439, -1.615131, -2.417474, 1, 1, 1, 1, 1,
-0.1144244, -0.6439977, -0.4991033, 1, 1, 1, 1, 1,
-0.112663, -1.166604, -3.436019, 1, 1, 1, 1, 1,
-0.1099848, -1.60011, -3.264495, 1, 1, 1, 1, 1,
-0.1084723, -0.7929479, -4.521347, 1, 1, 1, 1, 1,
-0.1070971, -2.089965, -2.962012, 0, 0, 1, 1, 1,
-0.1062857, 0.7484853, 0.7075589, 1, 0, 0, 1, 1,
-0.1059754, 0.36245, 0.323739, 1, 0, 0, 1, 1,
-0.1056781, -0.6939878, -3.555083, 1, 0, 0, 1, 1,
-0.1038975, -0.6353758, -1.118936, 1, 0, 0, 1, 1,
-0.103228, 0.5058853, 0.3769526, 1, 0, 0, 1, 1,
-0.1024604, -0.8435192, -3.035399, 0, 0, 0, 1, 1,
-0.1008672, -0.6012225, -2.389775, 0, 0, 0, 1, 1,
-0.1007512, -0.09959308, -0.9256727, 0, 0, 0, 1, 1,
-0.1003446, 0.5352098, 0.659645, 0, 0, 0, 1, 1,
-0.0925991, -1.543846, -4.131669, 0, 0, 0, 1, 1,
-0.09022381, -0.8866641, -3.403994, 0, 0, 0, 1, 1,
-0.08533804, -0.9694884, -4.564422, 0, 0, 0, 1, 1,
-0.08214439, 0.8183112, -0.5197671, 1, 1, 1, 1, 1,
-0.07878334, 0.9004813, -0.9777853, 1, 1, 1, 1, 1,
-0.06984013, -0.8777533, -2.917126, 1, 1, 1, 1, 1,
-0.06940713, -0.09050128, -2.340665, 1, 1, 1, 1, 1,
-0.06849725, 1.717529, -0.965288, 1, 1, 1, 1, 1,
-0.06717961, -0.7471038, -1.707662, 1, 1, 1, 1, 1,
-0.06662917, 0.2760078, -0.006325568, 1, 1, 1, 1, 1,
-0.06582014, -1.675244, -3.543214, 1, 1, 1, 1, 1,
-0.06287137, -0.04123521, -3.285945, 1, 1, 1, 1, 1,
-0.06031865, -1.173733, -3.000453, 1, 1, 1, 1, 1,
-0.05965241, -0.7816471, -2.02041, 1, 1, 1, 1, 1,
-0.0535352, -0.5228235, -1.75502, 1, 1, 1, 1, 1,
-0.04896631, 1.259506, 1.12499, 1, 1, 1, 1, 1,
-0.04805512, -0.2842925, -1.576814, 1, 1, 1, 1, 1,
-0.04591415, 3.051039, 1.906062, 1, 1, 1, 1, 1,
-0.04459042, -1.479258, -2.356348, 0, 0, 1, 1, 1,
-0.04436975, -0.8499006, -3.737816, 1, 0, 0, 1, 1,
-0.04429816, 0.1980527, -1.639254, 1, 0, 0, 1, 1,
-0.03673631, 1.927965, -0.7438524, 1, 0, 0, 1, 1,
-0.03639543, -1.815419, -4.872899, 1, 0, 0, 1, 1,
-0.03166206, 0.660513, 0.952499, 1, 0, 0, 1, 1,
-0.02885046, 0.9983203, -1.315895, 0, 0, 0, 1, 1,
-0.02741491, 2.298841, -1.298826, 0, 0, 0, 1, 1,
-0.02647544, 1.638601, 1.047908, 0, 0, 0, 1, 1,
-0.02589368, 0.6749055, -1.060115, 0, 0, 0, 1, 1,
-0.02285882, -0.1907797, -3.949421, 0, 0, 0, 1, 1,
-0.02210099, 0.1228743, -0.224874, 0, 0, 0, 1, 1,
-0.01886878, 0.8703305, -1.731804, 0, 0, 0, 1, 1,
-0.01859908, 0.4509935, -0.4988821, 1, 1, 1, 1, 1,
-0.01794956, -1.093861, -2.618716, 1, 1, 1, 1, 1,
-0.01789001, -0.400377, -4.190397, 1, 1, 1, 1, 1,
-0.01721508, 0.107124, -2.024846, 1, 1, 1, 1, 1,
-0.01641933, 1.309845, -0.1116512, 1, 1, 1, 1, 1,
-0.01278038, 2.043724, 0.185574, 1, 1, 1, 1, 1,
-0.004067122, -0.8509212, -4.338754, 1, 1, 1, 1, 1,
0.002570688, -0.02673336, 2.822634, 1, 1, 1, 1, 1,
0.002645557, -0.9375243, 3.477017, 1, 1, 1, 1, 1,
0.005112853, 0.3797486, -1.172205, 1, 1, 1, 1, 1,
0.005470948, -0.2367465, 2.865674, 1, 1, 1, 1, 1,
0.006665936, 0.4398242, -1.486908, 1, 1, 1, 1, 1,
0.00789885, 1.398547, -0.8005511, 1, 1, 1, 1, 1,
0.007941362, 0.3400635, -0.08188695, 1, 1, 1, 1, 1,
0.01176905, -0.4808449, 3.404241, 1, 1, 1, 1, 1,
0.01308114, 1.839911, -1.709878, 0, 0, 1, 1, 1,
0.01308991, 0.3579778, 0.3164524, 1, 0, 0, 1, 1,
0.01539133, -1.583555, 2.243576, 1, 0, 0, 1, 1,
0.01742713, -0.7126853, 2.754848, 1, 0, 0, 1, 1,
0.01857231, 2.300545, -0.5786758, 1, 0, 0, 1, 1,
0.02063151, -0.8109459, 1.333418, 1, 0, 0, 1, 1,
0.02122657, 0.8527229, 0.0958231, 0, 0, 0, 1, 1,
0.02190657, -0.5136804, 1.751428, 0, 0, 0, 1, 1,
0.02840988, 0.537505, -1.002339, 0, 0, 0, 1, 1,
0.03062644, 0.4750476, -1.028534, 0, 0, 0, 1, 1,
0.0306948, -0.6922588, 1.253525, 0, 0, 0, 1, 1,
0.03326108, -0.4986155, 3.072835, 0, 0, 0, 1, 1,
0.03556364, 1.415059, -0.06747565, 0, 0, 0, 1, 1,
0.03661455, -0.09357833, 3.097038, 1, 1, 1, 1, 1,
0.03714979, -0.8824085, 2.515129, 1, 1, 1, 1, 1,
0.04123819, -2.188767, 4.176436, 1, 1, 1, 1, 1,
0.04294788, 0.03300618, 2.531243, 1, 1, 1, 1, 1,
0.04808657, 1.164515, -0.5478503, 1, 1, 1, 1, 1,
0.05349432, 1.155211, 0.1155916, 1, 1, 1, 1, 1,
0.0547403, -0.2127406, 4.742483, 1, 1, 1, 1, 1,
0.05492593, 0.263319, -1.102093, 1, 1, 1, 1, 1,
0.05645902, 0.2769638, -0.09361935, 1, 1, 1, 1, 1,
0.05742411, -1.299272, 5.103299, 1, 1, 1, 1, 1,
0.05930645, 1.352485, -1.214841, 1, 1, 1, 1, 1,
0.06194111, 1.281582, -0.7891946, 1, 1, 1, 1, 1,
0.06247469, 0.9418064, -0.2340299, 1, 1, 1, 1, 1,
0.06495798, -1.873325, 2.50426, 1, 1, 1, 1, 1,
0.06742502, -1.723023, 3.63307, 1, 1, 1, 1, 1,
0.06875641, 0.0737283, 1.042777, 0, 0, 1, 1, 1,
0.07069913, -0.5454416, 3.569261, 1, 0, 0, 1, 1,
0.07481527, -0.00475281, 0.2885151, 1, 0, 0, 1, 1,
0.08103707, 1.826837, -0.1752417, 1, 0, 0, 1, 1,
0.08163904, 0.1526861, 0.5372609, 1, 0, 0, 1, 1,
0.08623704, 0.8685097, 0.484662, 1, 0, 0, 1, 1,
0.08640323, -0.4992665, 4.46362, 0, 0, 0, 1, 1,
0.08928319, -0.3507859, 1.83215, 0, 0, 0, 1, 1,
0.09068213, -0.9495065, 2.734207, 0, 0, 0, 1, 1,
0.09099067, 0.4231773, 1.385339, 0, 0, 0, 1, 1,
0.09476742, 0.7251002, 1.380209, 0, 0, 0, 1, 1,
0.09919126, 1.282182, -2.396639, 0, 0, 0, 1, 1,
0.09960418, -1.659051, 2.710665, 0, 0, 0, 1, 1,
0.1005731, 0.6092635, -0.04254343, 1, 1, 1, 1, 1,
0.1032262, 0.2096533, -1.191236, 1, 1, 1, 1, 1,
0.1115122, 0.7262411, 0.8680959, 1, 1, 1, 1, 1,
0.1115443, -0.7626585, 2.727898, 1, 1, 1, 1, 1,
0.1146267, 0.2214057, 1.858936, 1, 1, 1, 1, 1,
0.1156105, 0.8006172, -0.43325, 1, 1, 1, 1, 1,
0.1169696, -2.21243, 5.483701, 1, 1, 1, 1, 1,
0.1229882, 0.3894838, 1.026323, 1, 1, 1, 1, 1,
0.1257506, -0.1992619, 2.225073, 1, 1, 1, 1, 1,
0.1268991, 0.2997204, 0.3183425, 1, 1, 1, 1, 1,
0.1278631, -0.8653225, 3.473711, 1, 1, 1, 1, 1,
0.129845, 0.2650742, 0.2421944, 1, 1, 1, 1, 1,
0.1323014, 1.153184, 0.01308971, 1, 1, 1, 1, 1,
0.1352375, -0.3124511, 5.097402, 1, 1, 1, 1, 1,
0.1372969, -0.6765539, 3.010245, 1, 1, 1, 1, 1,
0.1423081, 1.026417, 1.04101, 0, 0, 1, 1, 1,
0.1446683, 0.3203197, -0.9543711, 1, 0, 0, 1, 1,
0.1476023, 0.4053483, 0.1232983, 1, 0, 0, 1, 1,
0.1543697, -0.12505, 1.99249, 1, 0, 0, 1, 1,
0.163431, -0.3647221, 1.691485, 1, 0, 0, 1, 1,
0.1644398, 0.394576, -0.1547352, 1, 0, 0, 1, 1,
0.1644587, -0.05803304, 2.591189, 0, 0, 0, 1, 1,
0.1685688, 1.365194, 0.6131703, 0, 0, 0, 1, 1,
0.1706349, -0.7337987, 2.672164, 0, 0, 0, 1, 1,
0.1748071, -0.6673287, 2.008385, 0, 0, 0, 1, 1,
0.1787187, -0.3455727, 1.951936, 0, 0, 0, 1, 1,
0.1794656, -1.003179, 3.875887, 0, 0, 0, 1, 1,
0.1816883, -1.078868, 3.167629, 0, 0, 0, 1, 1,
0.1861466, -1.938997, 4.064655, 1, 1, 1, 1, 1,
0.1932262, -1.577921, 0.7182162, 1, 1, 1, 1, 1,
0.2017402, -1.884152, 2.991443, 1, 1, 1, 1, 1,
0.2031645, 0.201891, -0.6111977, 1, 1, 1, 1, 1,
0.2047048, -0.3508283, 3.249314, 1, 1, 1, 1, 1,
0.2052511, 0.4533077, 0.7090929, 1, 1, 1, 1, 1,
0.2110967, -0.7494805, 3.430025, 1, 1, 1, 1, 1,
0.2152329, -1.57394, 3.279826, 1, 1, 1, 1, 1,
0.215403, 1.814693, 0.1699662, 1, 1, 1, 1, 1,
0.216028, -0.1706415, 3.854511, 1, 1, 1, 1, 1,
0.217419, -0.1771287, 2.229111, 1, 1, 1, 1, 1,
0.2186192, -0.4099105, 2.124075, 1, 1, 1, 1, 1,
0.2189199, -1.235442, 3.266907, 1, 1, 1, 1, 1,
0.2196972, 0.8424955, 0.5062588, 1, 1, 1, 1, 1,
0.2231435, -0.455869, 3.291927, 1, 1, 1, 1, 1,
0.2263657, 1.090542, 1.110617, 0, 0, 1, 1, 1,
0.2292737, -0.4324231, 3.057057, 1, 0, 0, 1, 1,
0.2347099, 0.4847149, -0.02734982, 1, 0, 0, 1, 1,
0.2368343, 0.5096346, -0.8357913, 1, 0, 0, 1, 1,
0.2411376, 0.2191039, 0.5400789, 1, 0, 0, 1, 1,
0.2420042, 0.4468037, 0.883324, 1, 0, 0, 1, 1,
0.2442254, -0.1774945, 0.5296496, 0, 0, 0, 1, 1,
0.249097, -1.650823, 2.29321, 0, 0, 0, 1, 1,
0.2510453, -0.104225, 2.410653, 0, 0, 0, 1, 1,
0.2530873, 0.37954, 0.6562909, 0, 0, 0, 1, 1,
0.260224, 0.8643576, 0.1588813, 0, 0, 0, 1, 1,
0.2649619, 1.382545, 1.08984, 0, 0, 0, 1, 1,
0.2699363, 0.7727902, 2.325525, 0, 0, 0, 1, 1,
0.2705494, -0.9971825, 3.329982, 1, 1, 1, 1, 1,
0.2752294, -1.694831, 2.64637, 1, 1, 1, 1, 1,
0.2773731, -0.6936665, 3.668358, 1, 1, 1, 1, 1,
0.2807052, -0.0928058, 3.367495, 1, 1, 1, 1, 1,
0.2846759, 0.7120493, -2.133821, 1, 1, 1, 1, 1,
0.2877148, -0.1498871, 1.389111, 1, 1, 1, 1, 1,
0.2999822, 0.5906053, 1.229822, 1, 1, 1, 1, 1,
0.3007708, 0.2660835, 1.528216, 1, 1, 1, 1, 1,
0.3084957, 0.5936375, -2.061695, 1, 1, 1, 1, 1,
0.3088683, -0.9971001, 2.596435, 1, 1, 1, 1, 1,
0.309125, 0.08932558, 1.634868, 1, 1, 1, 1, 1,
0.3121549, 0.266697, 2.023624, 1, 1, 1, 1, 1,
0.316725, -0.8541518, 4.69059, 1, 1, 1, 1, 1,
0.3192693, -0.02631528, 1.742714, 1, 1, 1, 1, 1,
0.3194037, 0.7778693, -0.4406359, 1, 1, 1, 1, 1,
0.3263821, -1.078089, 2.014118, 0, 0, 1, 1, 1,
0.3287141, -1.645656, 1.983349, 1, 0, 0, 1, 1,
0.3297697, -0.2091193, 1.025497, 1, 0, 0, 1, 1,
0.3338306, 0.7112424, 2.510109, 1, 0, 0, 1, 1,
0.3358259, -0.1716031, -0.4184487, 1, 0, 0, 1, 1,
0.3387794, -0.8639163, 3.907817, 1, 0, 0, 1, 1,
0.3431478, -0.4278241, 2.871958, 0, 0, 0, 1, 1,
0.3513499, 0.4612963, -1.071971, 0, 0, 0, 1, 1,
0.3581384, -0.1393974, 2.942281, 0, 0, 0, 1, 1,
0.3609914, -1.102517, 2.182807, 0, 0, 0, 1, 1,
0.3626034, -0.1244747, 2.302016, 0, 0, 0, 1, 1,
0.3651576, -0.0002450874, 2.505346, 0, 0, 0, 1, 1,
0.3664111, -1.136097, 3.557787, 0, 0, 0, 1, 1,
0.3688115, -0.201162, 1.711931, 1, 1, 1, 1, 1,
0.3706546, -1.27077, 2.272119, 1, 1, 1, 1, 1,
0.3725947, 0.6663533, 0.8935975, 1, 1, 1, 1, 1,
0.3777253, 1.269504, -0.1212126, 1, 1, 1, 1, 1,
0.3777851, -0.6394848, 3.638031, 1, 1, 1, 1, 1,
0.3786753, 0.3178382, 0.7228842, 1, 1, 1, 1, 1,
0.3797555, -1.636516, 3.136908, 1, 1, 1, 1, 1,
0.3856695, -0.2005116, 2.310863, 1, 1, 1, 1, 1,
0.3882368, -0.2491729, 2.098141, 1, 1, 1, 1, 1,
0.3926235, 0.5920286, -0.8296985, 1, 1, 1, 1, 1,
0.3941524, -0.3945814, 2.675444, 1, 1, 1, 1, 1,
0.3943661, -0.3213694, 2.561068, 1, 1, 1, 1, 1,
0.3990471, 2.788417, 0.4569695, 1, 1, 1, 1, 1,
0.4013007, 1.789861, 1.311802, 1, 1, 1, 1, 1,
0.4038211, -0.5512764, 2.602616, 1, 1, 1, 1, 1,
0.4042475, -1.23487, 4.736537, 0, 0, 1, 1, 1,
0.4116837, -0.4542755, 0.7877298, 1, 0, 0, 1, 1,
0.4200524, -0.6910828, 2.720845, 1, 0, 0, 1, 1,
0.4229232, 1.130663, 0.4336392, 1, 0, 0, 1, 1,
0.4252689, 1.331907, -0.2892555, 1, 0, 0, 1, 1,
0.4265831, -0.3174481, 0.9626582, 1, 0, 0, 1, 1,
0.4268182, -1.319771, 4.353094, 0, 0, 0, 1, 1,
0.4270299, 1.358054, 2.103146, 0, 0, 0, 1, 1,
0.4288346, 0.02636448, 1.914792, 0, 0, 0, 1, 1,
0.4297023, -1.540677, 4.713788, 0, 0, 0, 1, 1,
0.4329094, 1.291485, 0.2268587, 0, 0, 0, 1, 1,
0.4334042, -0.079743, 3.18939, 0, 0, 0, 1, 1,
0.4365415, 0.4545867, -1.372067, 0, 0, 0, 1, 1,
0.4377621, -0.03206418, 0.5609275, 1, 1, 1, 1, 1,
0.4403753, 1.660527, 0.06460737, 1, 1, 1, 1, 1,
0.4437629, -0.6671081, 1.860055, 1, 1, 1, 1, 1,
0.4447217, 0.09943885, 1.864647, 1, 1, 1, 1, 1,
0.4501933, -1.279418, 2.055652, 1, 1, 1, 1, 1,
0.4610447, -1.16583, 3.065824, 1, 1, 1, 1, 1,
0.4673776, 1.517698, 0.4636721, 1, 1, 1, 1, 1,
0.4687718, 0.1473825, 1.775072, 1, 1, 1, 1, 1,
0.4691104, -1.340937, 3.3185, 1, 1, 1, 1, 1,
0.4695614, 0.3731747, 0.6171827, 1, 1, 1, 1, 1,
0.4703264, 1.000551, 1.305047, 1, 1, 1, 1, 1,
0.4750096, 0.3465211, 0.265939, 1, 1, 1, 1, 1,
0.4751868, 1.100574, 0.6903601, 1, 1, 1, 1, 1,
0.477569, 0.2975221, 1.417222, 1, 1, 1, 1, 1,
0.4777947, -0.2409271, 1.299828, 1, 1, 1, 1, 1,
0.4811684, -0.921023, 1.91953, 0, 0, 1, 1, 1,
0.4836299, -0.3319354, 1.0442, 1, 0, 0, 1, 1,
0.4836324, -0.3070099, 2.485432, 1, 0, 0, 1, 1,
0.4847332, -1.823588, 3.330938, 1, 0, 0, 1, 1,
0.4897676, 1.345582, -0.8972295, 1, 0, 0, 1, 1,
0.4904516, 1.100822, -1.135659, 1, 0, 0, 1, 1,
0.4947261, -0.3596739, 3.695951, 0, 0, 0, 1, 1,
0.4967327, -0.757721, 1.223199, 0, 0, 0, 1, 1,
0.4984905, 0.6366197, -0.1213789, 0, 0, 0, 1, 1,
0.5006751, 0.9220333, 0.2409619, 0, 0, 0, 1, 1,
0.5068346, -0.7971931, 4.661252, 0, 0, 0, 1, 1,
0.5147895, 0.3480205, 0.9896963, 0, 0, 0, 1, 1,
0.5172612, -0.1703026, 1.928113, 0, 0, 0, 1, 1,
0.5189049, -0.1076824, 2.253644, 1, 1, 1, 1, 1,
0.5226445, -1.210741, 4.249309, 1, 1, 1, 1, 1,
0.5267881, -0.05070578, 1.473606, 1, 1, 1, 1, 1,
0.5280824, 0.6798507, 1.193754, 1, 1, 1, 1, 1,
0.5296677, 1.317855, -0.1318343, 1, 1, 1, 1, 1,
0.5303235, 1.881256, 1.199916, 1, 1, 1, 1, 1,
0.5314016, 2.393103, -0.03620826, 1, 1, 1, 1, 1,
0.5344341, -0.2496219, 1.528367, 1, 1, 1, 1, 1,
0.5377604, 0.7022991, 1.016512, 1, 1, 1, 1, 1,
0.542273, -0.02400653, 0.3335554, 1, 1, 1, 1, 1,
0.5449665, -1.471155, 2.092606, 1, 1, 1, 1, 1,
0.5453733, -0.9078038, 3.462949, 1, 1, 1, 1, 1,
0.5463501, 0.3376597, 1.674849, 1, 1, 1, 1, 1,
0.5480838, -0.5923042, 2.929358, 1, 1, 1, 1, 1,
0.5490479, 0.2655414, 1.546371, 1, 1, 1, 1, 1,
0.5505692, -0.1826953, 2.117465, 0, 0, 1, 1, 1,
0.5519509, -0.2566234, 2.93852, 1, 0, 0, 1, 1,
0.5566985, 0.03456044, 1.242194, 1, 0, 0, 1, 1,
0.5576267, -0.9715336, 1.848308, 1, 0, 0, 1, 1,
0.5585034, -1.090894, 4.181724, 1, 0, 0, 1, 1,
0.5585805, -1.122774, 0.9183511, 1, 0, 0, 1, 1,
0.5652089, 0.002809993, -0.002723734, 0, 0, 0, 1, 1,
0.5656793, -0.6052898, 3.851838, 0, 0, 0, 1, 1,
0.5680253, -0.5140651, 1.465991, 0, 0, 0, 1, 1,
0.5733382, -1.711776, 4.225708, 0, 0, 0, 1, 1,
0.5742071, 0.1615858, 2.009183, 0, 0, 0, 1, 1,
0.5782521, 1.015461, 0.3803929, 0, 0, 0, 1, 1,
0.5868023, 0.2752007, -0.05186922, 0, 0, 0, 1, 1,
0.5911424, 0.7873245, 1.583308, 1, 1, 1, 1, 1,
0.5933836, 1.525896, 0.9082232, 1, 1, 1, 1, 1,
0.605334, -1.17329, 3.842621, 1, 1, 1, 1, 1,
0.6069754, -1.504395, 1.382818, 1, 1, 1, 1, 1,
0.6113592, 0.5330621, -1.226588, 1, 1, 1, 1, 1,
0.6146842, -1.149264, 2.299685, 1, 1, 1, 1, 1,
0.6168163, 1.329747, 0.9741602, 1, 1, 1, 1, 1,
0.6222904, 0.673006, -0.6045966, 1, 1, 1, 1, 1,
0.630942, -1.600876, 4.053596, 1, 1, 1, 1, 1,
0.635652, 0.509589, 0.7784292, 1, 1, 1, 1, 1,
0.6416771, 0.9120477, 1.082973, 1, 1, 1, 1, 1,
0.6423858, -1.305672, 2.210039, 1, 1, 1, 1, 1,
0.642515, 0.750499, 1.717236, 1, 1, 1, 1, 1,
0.6437052, 0.7323155, -1.206413, 1, 1, 1, 1, 1,
0.6452158, -0.5965221, 3.230212, 1, 1, 1, 1, 1,
0.647868, -0.2259978, 2.287916, 0, 0, 1, 1, 1,
0.6492595, 0.04938072, 1.071758, 1, 0, 0, 1, 1,
0.6512156, 1.292732, 0.7434655, 1, 0, 0, 1, 1,
0.6530347, 0.3480025, 0.7236504, 1, 0, 0, 1, 1,
0.6547526, -2.19163, 1.692173, 1, 0, 0, 1, 1,
0.6569537, -2.782272, 2.936136, 1, 0, 0, 1, 1,
0.6578482, -0.1902376, 1.910523, 0, 0, 0, 1, 1,
0.6599971, -1.599353, 1.856386, 0, 0, 0, 1, 1,
0.6654781, -1.564454, 2.188889, 0, 0, 0, 1, 1,
0.6679227, 1.682091, 0.6239765, 0, 0, 0, 1, 1,
0.6716914, -0.6055937, 2.75827, 0, 0, 0, 1, 1,
0.6721579, -0.7238868, 3.147286, 0, 0, 0, 1, 1,
0.6843885, 0.07392832, 2.233524, 0, 0, 0, 1, 1,
0.6871694, -0.2576717, 3.19907, 1, 1, 1, 1, 1,
0.6875365, -2.196352, 0.8148085, 1, 1, 1, 1, 1,
0.6890899, -0.6032401, 3.559566, 1, 1, 1, 1, 1,
0.6950235, 2.346288, -0.5063915, 1, 1, 1, 1, 1,
0.6950455, 0.1095708, 0.243387, 1, 1, 1, 1, 1,
0.6992707, 1.979061, 2.036382, 1, 1, 1, 1, 1,
0.7043469, 0.6872335, -0.2714717, 1, 1, 1, 1, 1,
0.7094249, -2.050651, 1.930238, 1, 1, 1, 1, 1,
0.7120613, -1.726549, 3.892627, 1, 1, 1, 1, 1,
0.7223878, 0.1140003, 0.7710076, 1, 1, 1, 1, 1,
0.7224619, 1.675575, 0.3720528, 1, 1, 1, 1, 1,
0.7296039, 0.5043949, 2.779394, 1, 1, 1, 1, 1,
0.7334903, 0.4689387, 2.93536, 1, 1, 1, 1, 1,
0.739566, -1.00082, 2.896262, 1, 1, 1, 1, 1,
0.7398659, 0.5255889, -0.2432053, 1, 1, 1, 1, 1,
0.7430643, -1.751469, 2.292319, 0, 0, 1, 1, 1,
0.7448596, 0.4896771, 2.179849, 1, 0, 0, 1, 1,
0.7451823, 0.7015164, -0.6778482, 1, 0, 0, 1, 1,
0.747691, 1.355614, 1.922498, 1, 0, 0, 1, 1,
0.749926, -0.1949856, 2.984068, 1, 0, 0, 1, 1,
0.7635015, -0.5900437, 2.526432, 1, 0, 0, 1, 1,
0.7717162, 0.3572556, 2.242286, 0, 0, 0, 1, 1,
0.7729179, -0.7995684, 3.481642, 0, 0, 0, 1, 1,
0.7751823, 0.1204609, 0.9198793, 0, 0, 0, 1, 1,
0.7806787, -2.182686, 4.037176, 0, 0, 0, 1, 1,
0.7828336, 0.005305105, 1.188219, 0, 0, 0, 1, 1,
0.7859685, 1.627197, 2.135521, 0, 0, 0, 1, 1,
0.7862723, 0.3817444, -0.1100112, 0, 0, 0, 1, 1,
0.7871527, -1.149881, 1.324512, 1, 1, 1, 1, 1,
0.7883772, -0.7462347, 3.37832, 1, 1, 1, 1, 1,
0.7891527, 0.01974738, 2.301918, 1, 1, 1, 1, 1,
0.7961897, -0.04333987, 1.46203, 1, 1, 1, 1, 1,
0.7991994, 1.697385, 1.397915, 1, 1, 1, 1, 1,
0.8015264, -1.52387, 3.742414, 1, 1, 1, 1, 1,
0.8096026, -2.185849, 1.427108, 1, 1, 1, 1, 1,
0.8211696, -0.7311334, 2.617883, 1, 1, 1, 1, 1,
0.8229578, 0.165702, 1.541251, 1, 1, 1, 1, 1,
0.8267474, -0.6618575, 2.089016, 1, 1, 1, 1, 1,
0.8286793, 1.885472, 0.5565162, 1, 1, 1, 1, 1,
0.8334137, -0.7230831, 2.159745, 1, 1, 1, 1, 1,
0.8366387, -0.004177121, 1.355201, 1, 1, 1, 1, 1,
0.839817, 0.1058808, 2.967301, 1, 1, 1, 1, 1,
0.8400688, 1.806617, -0.3929259, 1, 1, 1, 1, 1,
0.8491359, 0.9626693, 0.205784, 0, 0, 1, 1, 1,
0.8497247, 1.174276, -1.778906, 1, 0, 0, 1, 1,
0.8525875, -0.04149711, 2.968906, 1, 0, 0, 1, 1,
0.8535143, 0.05161992, 2.02492, 1, 0, 0, 1, 1,
0.8539456, 0.6432472, 0.07984897, 1, 0, 0, 1, 1,
0.854598, 0.8070046, 2.008938, 1, 0, 0, 1, 1,
0.8577347, 0.7517449, 1.355485, 0, 0, 0, 1, 1,
0.862254, -0.8461816, 3.280215, 0, 0, 0, 1, 1,
0.8683864, -0.4549307, 3.177455, 0, 0, 0, 1, 1,
0.871222, -0.1828199, 0.3825364, 0, 0, 0, 1, 1,
0.8744369, -1.272627, 1.45574, 0, 0, 0, 1, 1,
0.8764217, -1.187849, 0.7517133, 0, 0, 0, 1, 1,
0.8829668, 0.2419859, 1.598318, 0, 0, 0, 1, 1,
0.8840675, 0.8248595, 0.6240358, 1, 1, 1, 1, 1,
0.8922926, 0.5104436, 0.6894419, 1, 1, 1, 1, 1,
0.8982552, 0.6555317, 1.744103, 1, 1, 1, 1, 1,
0.9071209, -0.2713778, -0.1971215, 1, 1, 1, 1, 1,
0.9196128, 0.4231586, 0.6151254, 1, 1, 1, 1, 1,
0.9268997, -0.1337597, 1.374041, 1, 1, 1, 1, 1,
0.9280713, 0.3635503, 0.8303595, 1, 1, 1, 1, 1,
0.9292874, -1.170824, 2.037843, 1, 1, 1, 1, 1,
0.9334562, -0.1907635, 0.0003602584, 1, 1, 1, 1, 1,
0.9346524, 2.325392, 0.1588673, 1, 1, 1, 1, 1,
0.9364561, -0.9841961, 2.715828, 1, 1, 1, 1, 1,
0.9401258, -0.8803658, 0.9982986, 1, 1, 1, 1, 1,
0.9431421, -0.7615193, -0.3382657, 1, 1, 1, 1, 1,
0.9478033, -0.3362693, 1.985417, 1, 1, 1, 1, 1,
0.9486625, -0.578049, 2.458595, 1, 1, 1, 1, 1,
0.9489859, -0.151233, 3.887969, 0, 0, 1, 1, 1,
0.9586536, 0.2812912, 1.441526, 1, 0, 0, 1, 1,
0.9618504, 0.4753968, 0.9196098, 1, 0, 0, 1, 1,
0.9656479, 0.2217159, 2.340466, 1, 0, 0, 1, 1,
0.9720529, 0.836256, 1.959453, 1, 0, 0, 1, 1,
0.9729401, 0.07208624, 1.536096, 1, 0, 0, 1, 1,
0.9752631, -0.9020553, 3.41388, 0, 0, 0, 1, 1,
0.9764329, 2.873239, 1.276003, 0, 0, 0, 1, 1,
0.9782706, 0.07092946, 0.7677068, 0, 0, 0, 1, 1,
0.9822661, -0.6007904, 1.686859, 0, 0, 0, 1, 1,
0.992783, -1.071471, 2.402985, 0, 0, 0, 1, 1,
0.9956396, 0.1940832, 1.48216, 0, 0, 0, 1, 1,
0.996386, -1.04459, 0.6693562, 0, 0, 0, 1, 1,
1.003518, 0.9988363, 1.270292, 1, 1, 1, 1, 1,
1.012513, 0.5158492, 0.4010812, 1, 1, 1, 1, 1,
1.02593, 0.7193074, -0.108315, 1, 1, 1, 1, 1,
1.034859, 2.769348, -0.5777596, 1, 1, 1, 1, 1,
1.04241, 0.5115172, 1.118069, 1, 1, 1, 1, 1,
1.045149, -0.5140355, 1.996875, 1, 1, 1, 1, 1,
1.050733, 0.742999, -0.4270194, 1, 1, 1, 1, 1,
1.052663, 0.3488905, 0.4559968, 1, 1, 1, 1, 1,
1.055285, -1.774405, 4.871383, 1, 1, 1, 1, 1,
1.058274, -1.026497, 3.946781, 1, 1, 1, 1, 1,
1.064681, -1.620934, 3.043487, 1, 1, 1, 1, 1,
1.065737, 0.4149626, 1.543868, 1, 1, 1, 1, 1,
1.066254, 0.03619515, 1.26365, 1, 1, 1, 1, 1,
1.066431, -2.028, 3.498017, 1, 1, 1, 1, 1,
1.070679, -0.5448858, 1.198998, 1, 1, 1, 1, 1,
1.071658, 0.4259707, 0.8361992, 0, 0, 1, 1, 1,
1.075055, -0.6814581, 1.370056, 1, 0, 0, 1, 1,
1.080961, 0.3699834, 2.619554, 1, 0, 0, 1, 1,
1.087648, -0.0009244552, 1.534508, 1, 0, 0, 1, 1,
1.088769, 0.217934, 2.041983, 1, 0, 0, 1, 1,
1.095488, 0.3101035, 1.866989, 1, 0, 0, 1, 1,
1.096206, 1.009596, 0.697693, 0, 0, 0, 1, 1,
1.096811, -0.18208, 0.9567045, 0, 0, 0, 1, 1,
1.100356, -0.3745917, 2.948928, 0, 0, 0, 1, 1,
1.105887, 0.995386, 1.138525, 0, 0, 0, 1, 1,
1.106495, 1.31997, 0.4406378, 0, 0, 0, 1, 1,
1.110898, -0.01731644, 2.514539, 0, 0, 0, 1, 1,
1.111568, 1.243297, -0.6457006, 0, 0, 0, 1, 1,
1.11202, -1.093436, -0.6665927, 1, 1, 1, 1, 1,
1.114803, -0.6586664, 2.504396, 1, 1, 1, 1, 1,
1.117067, 0.1346238, 0.726162, 1, 1, 1, 1, 1,
1.1171, -0.1962711, 1.258563, 1, 1, 1, 1, 1,
1.117562, -0.6958005, 3.110202, 1, 1, 1, 1, 1,
1.126306, 0.9603562, 1.020626, 1, 1, 1, 1, 1,
1.134698, 0.04020949, 0.0832249, 1, 1, 1, 1, 1,
1.143446, -0.6474578, 2.826398, 1, 1, 1, 1, 1,
1.145976, -0.6664423, 1.365632, 1, 1, 1, 1, 1,
1.151258, 1.049789, 0.7683254, 1, 1, 1, 1, 1,
1.153269, 1.940746, 0.6288032, 1, 1, 1, 1, 1,
1.188405, -1.638041, 1.399621, 1, 1, 1, 1, 1,
1.191559, -0.1090461, 1.301392, 1, 1, 1, 1, 1,
1.199047, -1.540853, 2.376591, 1, 1, 1, 1, 1,
1.199583, -0.430259, -0.1956346, 1, 1, 1, 1, 1,
1.200458, 0.1050911, 1.215535, 0, 0, 1, 1, 1,
1.202484, 1.581592, -0.2347684, 1, 0, 0, 1, 1,
1.208036, 0.7983959, 0.6660768, 1, 0, 0, 1, 1,
1.223331, 0.09038373, 0.6996549, 1, 0, 0, 1, 1,
1.223764, 0.735709, 1.474121, 1, 0, 0, 1, 1,
1.227579, -2.392087, 1.126298, 1, 0, 0, 1, 1,
1.239182, -0.429495, 0.5068079, 0, 0, 0, 1, 1,
1.243264, 0.5088683, 0.879504, 0, 0, 0, 1, 1,
1.244124, -0.4914384, 0.7101941, 0, 0, 0, 1, 1,
1.244485, -0.7937074, 2.552624, 0, 0, 0, 1, 1,
1.250107, -1.223014, 0.3723541, 0, 0, 0, 1, 1,
1.259493, -0.4600686, 2.172101, 0, 0, 0, 1, 1,
1.261861, -0.9897524, 1.929855, 0, 0, 0, 1, 1,
1.2639, -2.17127, 0.4135716, 1, 1, 1, 1, 1,
1.286027, -0.1077218, 1.658863, 1, 1, 1, 1, 1,
1.287655, -0.4607638, 0.6224554, 1, 1, 1, 1, 1,
1.289481, 0.1737811, 0.4913412, 1, 1, 1, 1, 1,
1.289575, -0.9653385, 1.615889, 1, 1, 1, 1, 1,
1.290372, -0.6007071, 2.863235, 1, 1, 1, 1, 1,
1.299105, -0.4860448, 1.805876, 1, 1, 1, 1, 1,
1.312787, 0.9925075, -1.469646, 1, 1, 1, 1, 1,
1.314108, 0.5821061, 0.3447844, 1, 1, 1, 1, 1,
1.323018, -0.3442426, 1.276403, 1, 1, 1, 1, 1,
1.329145, 0.6946771, 0.7302341, 1, 1, 1, 1, 1,
1.334419, -0.8203109, 2.451857, 1, 1, 1, 1, 1,
1.337384, 2.169847, -1.046973, 1, 1, 1, 1, 1,
1.341062, -0.8814692, 1.792907, 1, 1, 1, 1, 1,
1.343549, 0.5631943, 2.5214, 1, 1, 1, 1, 1,
1.346908, -0.757938, 0.7884355, 0, 0, 1, 1, 1,
1.355934, 0.7155932, -1.173199, 1, 0, 0, 1, 1,
1.36693, -0.8263472, 1.989786, 1, 0, 0, 1, 1,
1.378163, -0.1811429, 0.6504441, 1, 0, 0, 1, 1,
1.384073, -1.997892, 0.8350536, 1, 0, 0, 1, 1,
1.392487, 0.3513778, 2.046817, 1, 0, 0, 1, 1,
1.39438, 1.057782, 0.8327638, 0, 0, 0, 1, 1,
1.402154, -1.065522, 2.631367, 0, 0, 0, 1, 1,
1.415542, -0.1012145, 0.897139, 0, 0, 0, 1, 1,
1.434978, 1.413195, -0.09457318, 0, 0, 0, 1, 1,
1.452964, -0.2114239, 3.859224, 0, 0, 0, 1, 1,
1.462539, 0.1741963, 3.224774, 0, 0, 0, 1, 1,
1.468941, -0.3300108, 3.062199, 0, 0, 0, 1, 1,
1.478023, -0.6329367, 2.842464, 1, 1, 1, 1, 1,
1.483559, -0.5468026, 1.566225, 1, 1, 1, 1, 1,
1.494662, -0.4738601, 2.943876, 1, 1, 1, 1, 1,
1.496813, 0.2838704, 1.088519, 1, 1, 1, 1, 1,
1.499092, 0.1538069, 1.909012, 1, 1, 1, 1, 1,
1.503333, -0.5182355, 1.870014, 1, 1, 1, 1, 1,
1.519484, -0.4162814, 3.947912, 1, 1, 1, 1, 1,
1.521724, -0.5114185, 2.447766, 1, 1, 1, 1, 1,
1.526199, 0.5788181, -0.6679553, 1, 1, 1, 1, 1,
1.533611, -0.3780977, 2.103578, 1, 1, 1, 1, 1,
1.546733, 1.232473, -0.1308409, 1, 1, 1, 1, 1,
1.55957, -0.2588188, 3.459511, 1, 1, 1, 1, 1,
1.566257, -2.040211, 0.5192805, 1, 1, 1, 1, 1,
1.574557, 0.1226814, 0.9196362, 1, 1, 1, 1, 1,
1.574804, 0.3040405, 1.339579, 1, 1, 1, 1, 1,
1.582249, -2.16891, 3.435879, 0, 0, 1, 1, 1,
1.58998, 0.3386247, 1.030563, 1, 0, 0, 1, 1,
1.598712, -2.066561, 2.415525, 1, 0, 0, 1, 1,
1.618754, 1.362464, 0.6660243, 1, 0, 0, 1, 1,
1.635717, 2.038475, 3.771608, 1, 0, 0, 1, 1,
1.654186, 0.5909578, -0.1921395, 1, 0, 0, 1, 1,
1.692907, -0.5515543, 2.362849, 0, 0, 0, 1, 1,
1.701241, -1.063853, 1.857369, 0, 0, 0, 1, 1,
1.714809, 0.8355599, 1.113432, 0, 0, 0, 1, 1,
1.715713, -2.271291, 2.318162, 0, 0, 0, 1, 1,
1.721337, -0.33192, 2.809326, 0, 0, 0, 1, 1,
1.729526, 0.08498702, 0.6531478, 0, 0, 0, 1, 1,
1.734712, -0.6446641, 1.764517, 0, 0, 0, 1, 1,
1.7586, 0.4807211, 1.262597, 1, 1, 1, 1, 1,
1.765439, -1.635606, 0.8634473, 1, 1, 1, 1, 1,
1.783046, -0.8605348, 2.389227, 1, 1, 1, 1, 1,
1.791823, 0.7043917, 2.410878, 1, 1, 1, 1, 1,
1.799077, -0.6506299, 1.886043, 1, 1, 1, 1, 1,
1.834456, -0.500984, 2.669714, 1, 1, 1, 1, 1,
1.838594, -1.442264, 2.507955, 1, 1, 1, 1, 1,
1.862198, -0.4002291, 2.45136, 1, 1, 1, 1, 1,
1.89533, 0.7392908, -0.2806715, 1, 1, 1, 1, 1,
1.897549, -0.3612654, 1.338452, 1, 1, 1, 1, 1,
1.939595, -0.1115497, -0.1299298, 1, 1, 1, 1, 1,
2.042984, -0.3628374, 4.266404, 1, 1, 1, 1, 1,
2.060734, 0.6514109, 0.5632637, 1, 1, 1, 1, 1,
2.061918, -0.2581925, 2.51617, 1, 1, 1, 1, 1,
2.080115, 2.427165, -0.4125497, 1, 1, 1, 1, 1,
2.092116, 0.8353566, 2.222413, 0, 0, 1, 1, 1,
2.169534, -1.573237, 2.063201, 1, 0, 0, 1, 1,
2.176622, -0.4871526, 2.091933, 1, 0, 0, 1, 1,
2.218292, 0.09083664, -0.502045, 1, 0, 0, 1, 1,
2.387154, -0.5468269, 0.8433661, 1, 0, 0, 1, 1,
2.431839, 0.06416946, 1.273448, 1, 0, 0, 1, 1,
2.452647, -0.7624061, 0.612431, 0, 0, 0, 1, 1,
2.453517, 2.266467, -0.3294078, 0, 0, 0, 1, 1,
2.496765, -0.8553055, 2.009855, 0, 0, 0, 1, 1,
2.543267, 0.1323394, 3.451192, 0, 0, 0, 1, 1,
2.581548, 0.7919643, 2.241872, 0, 0, 0, 1, 1,
2.64924, 0.9610034, 0.1059718, 0, 0, 0, 1, 1,
2.720698, -1.44163, 3.890968, 0, 0, 0, 1, 1,
2.762292, -0.2663332, 1.938769, 1, 1, 1, 1, 1,
2.805278, -0.2348125, 1.63616, 1, 1, 1, 1, 1,
2.839322, 0.1525135, 0.403503, 1, 1, 1, 1, 1,
2.841712, 0.1787373, 1.824419, 1, 1, 1, 1, 1,
2.995009, -1.170767, 2.910657, 1, 1, 1, 1, 1,
3.011418, 1.297264, 2.105759, 1, 1, 1, 1, 1,
3.279705, 0.08080824, 1.632771, 1, 1, 1, 1, 1
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
var radius = 9.793674;
var distance = 34.39986;
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
mvMatrix.translate( -0.01352787, 0.2782156, 0.02220011 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.39986);
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
