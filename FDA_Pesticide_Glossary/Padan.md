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
-3.452853, 0.5563124, -1.793548, 1, 0, 0, 1,
-3.433139, 1.198693, -3.380561, 1, 0.007843138, 0, 1,
-2.882195, 0.5083854, -1.405342, 1, 0.01176471, 0, 1,
-2.510139, 1.494973, -1.215398, 1, 0.01960784, 0, 1,
-2.479014, -0.3977692, 1.141035, 1, 0.02352941, 0, 1,
-2.443328, -0.8667252, -2.962975, 1, 0.03137255, 0, 1,
-2.406754, 1.019324, 0.003248614, 1, 0.03529412, 0, 1,
-2.382949, -0.3987127, -1.045971, 1, 0.04313726, 0, 1,
-2.358327, -0.7842978, -2.548105, 1, 0.04705882, 0, 1,
-2.355363, 1.259252, -2.322307, 1, 0.05490196, 0, 1,
-2.346307, -0.5839301, -1.63991, 1, 0.05882353, 0, 1,
-2.21776, -1.897541, -3.925337, 1, 0.06666667, 0, 1,
-2.201853, 0.4024631, -0.9541592, 1, 0.07058824, 0, 1,
-2.188167, 0.2398953, -0.9342416, 1, 0.07843138, 0, 1,
-2.1725, -0.6699628, -2.087447, 1, 0.08235294, 0, 1,
-2.154254, 0.3874813, -1.775896, 1, 0.09019608, 0, 1,
-2.150476, -0.8745778, -1.961784, 1, 0.09411765, 0, 1,
-2.13199, 0.5327431, -0.1919534, 1, 0.1019608, 0, 1,
-2.122892, 0.2548482, -1.734285, 1, 0.1098039, 0, 1,
-2.121661, -0.04299318, -1.892414, 1, 0.1137255, 0, 1,
-2.117909, 0.8684286, -2.023781, 1, 0.1215686, 0, 1,
-2.083989, 0.4806009, 0.4649771, 1, 0.1254902, 0, 1,
-2.074541, -0.3576098, -1.221415, 1, 0.1333333, 0, 1,
-2.06883, 1.960151, 0.0987278, 1, 0.1372549, 0, 1,
-2.060962, -1.58913, -3.3892, 1, 0.145098, 0, 1,
-2.046549, 2.23878, -1.644453, 1, 0.1490196, 0, 1,
-2.001966, 0.7002546, 1.205787, 1, 0.1568628, 0, 1,
-1.974729, 0.9055123, -1.621652, 1, 0.1607843, 0, 1,
-1.959483, -0.6894206, -1.44033, 1, 0.1686275, 0, 1,
-1.959267, -1.159809, -1.909135, 1, 0.172549, 0, 1,
-1.940854, -0.8535437, -0.7198817, 1, 0.1803922, 0, 1,
-1.927599, 1.219323, -1.234153, 1, 0.1843137, 0, 1,
-1.925226, 0.03460569, -0.1585072, 1, 0.1921569, 0, 1,
-1.92405, -1.58097, -4.041685, 1, 0.1960784, 0, 1,
-1.912422, -0.09735376, -2.135244, 1, 0.2039216, 0, 1,
-1.874009, -0.06104384, -1.406453, 1, 0.2117647, 0, 1,
-1.870874, -0.2755887, -2.048565, 1, 0.2156863, 0, 1,
-1.794816, 1.029926, -1.062924, 1, 0.2235294, 0, 1,
-1.792786, -0.2349301, -2.178362, 1, 0.227451, 0, 1,
-1.791174, -0.3426036, 0.4529115, 1, 0.2352941, 0, 1,
-1.775045, -0.2919037, -1.450428, 1, 0.2392157, 0, 1,
-1.770063, -0.5065885, -1.908055, 1, 0.2470588, 0, 1,
-1.744994, 0.7544649, -1.120259, 1, 0.2509804, 0, 1,
-1.737261, -1.798439, -0.4379048, 1, 0.2588235, 0, 1,
-1.734327, -0.8407202, -2.258909, 1, 0.2627451, 0, 1,
-1.724154, 0.4261819, -1.462841, 1, 0.2705882, 0, 1,
-1.715117, 0.3792376, -1.447412, 1, 0.2745098, 0, 1,
-1.681901, 0.179361, -0.3950784, 1, 0.282353, 0, 1,
-1.675255, 0.8187956, -1.656741, 1, 0.2862745, 0, 1,
-1.670169, 0.5488393, -3.222114, 1, 0.2941177, 0, 1,
-1.665307, 1.153576, 1.700543, 1, 0.3019608, 0, 1,
-1.652566, -1.299304, -3.797941, 1, 0.3058824, 0, 1,
-1.651188, 1.455381, -2.651662, 1, 0.3137255, 0, 1,
-1.63985, -0.5005089, -2.4556, 1, 0.3176471, 0, 1,
-1.616321, -0.8251204, -1.932546, 1, 0.3254902, 0, 1,
-1.610298, -1.781057, -4.686048, 1, 0.3294118, 0, 1,
-1.596841, -0.5025488, -2.924641, 1, 0.3372549, 0, 1,
-1.583208, 0.4974623, 0.1060285, 1, 0.3411765, 0, 1,
-1.575515, -0.3146108, -1.898965, 1, 0.3490196, 0, 1,
-1.56797, 1.442593, -2.296784, 1, 0.3529412, 0, 1,
-1.561789, -0.3214553, -0.5607638, 1, 0.3607843, 0, 1,
-1.556028, 0.5024266, -0.9392458, 1, 0.3647059, 0, 1,
-1.550393, -0.01917215, -1.206387, 1, 0.372549, 0, 1,
-1.544031, -2.165645, -0.4104096, 1, 0.3764706, 0, 1,
-1.538558, -2.432059, -0.9021093, 1, 0.3843137, 0, 1,
-1.513478, 0.764297, -0.2159766, 1, 0.3882353, 0, 1,
-1.511114, -1.964116, -3.600973, 1, 0.3960784, 0, 1,
-1.502998, -0.05229688, -1.260325, 1, 0.4039216, 0, 1,
-1.499179, -0.601352, -2.301937, 1, 0.4078431, 0, 1,
-1.490127, -0.3358516, -2.333895, 1, 0.4156863, 0, 1,
-1.488886, 0.02136168, -2.94958, 1, 0.4196078, 0, 1,
-1.471598, 0.7680596, -2.023051, 1, 0.427451, 0, 1,
-1.469076, 0.7367395, -2.881153, 1, 0.4313726, 0, 1,
-1.463463, 0.9471951, -2.732322, 1, 0.4392157, 0, 1,
-1.45311, -0.4206336, -2.910506, 1, 0.4431373, 0, 1,
-1.430478, 0.5510007, -0.8908844, 1, 0.4509804, 0, 1,
-1.421802, -0.2778476, -0.1521712, 1, 0.454902, 0, 1,
-1.413836, 0.8072801, -0.2810153, 1, 0.4627451, 0, 1,
-1.403884, -0.3348339, -1.181741, 1, 0.4666667, 0, 1,
-1.402847, -0.3189569, -2.15934, 1, 0.4745098, 0, 1,
-1.400501, 1.282807, -1.793889, 1, 0.4784314, 0, 1,
-1.392764, -0.6541155, -1.292711, 1, 0.4862745, 0, 1,
-1.38896, 1.490555, -0.06203254, 1, 0.4901961, 0, 1,
-1.388214, 0.86686, 0.3911572, 1, 0.4980392, 0, 1,
-1.366047, -0.5232539, -1.515287, 1, 0.5058824, 0, 1,
-1.361511, -0.07813777, -0.5195409, 1, 0.509804, 0, 1,
-1.359978, 1.064038, -1.684427, 1, 0.5176471, 0, 1,
-1.359066, 0.644466, -0.370201, 1, 0.5215687, 0, 1,
-1.358936, -2.292115, -1.831427, 1, 0.5294118, 0, 1,
-1.358211, 1.17426, -0.01366262, 1, 0.5333334, 0, 1,
-1.351816, 1.144088, 0.06903244, 1, 0.5411765, 0, 1,
-1.347335, 0.2325307, -1.084588, 1, 0.5450981, 0, 1,
-1.344307, -1.049625, -0.8067418, 1, 0.5529412, 0, 1,
-1.322157, -0.8178521, -0.9574189, 1, 0.5568628, 0, 1,
-1.314854, 0.6547685, -0.7963528, 1, 0.5647059, 0, 1,
-1.311575, 0.01551309, -1.352896, 1, 0.5686275, 0, 1,
-1.309909, -1.087665, -2.483837, 1, 0.5764706, 0, 1,
-1.307315, 1.308848, -0.6243435, 1, 0.5803922, 0, 1,
-1.299681, -0.5315911, -2.221538, 1, 0.5882353, 0, 1,
-1.29437, 0.00587415, -1.724414, 1, 0.5921569, 0, 1,
-1.288332, 0.4387012, -2.08552, 1, 0.6, 0, 1,
-1.282274, 0.1065913, -2.827051, 1, 0.6078432, 0, 1,
-1.279056, -0.8115813, -1.063205, 1, 0.6117647, 0, 1,
-1.275655, -0.9950617, 0.09133942, 1, 0.6196079, 0, 1,
-1.266209, -1.721632, -1.787365, 1, 0.6235294, 0, 1,
-1.26188, 0.6704184, 0.2484179, 1, 0.6313726, 0, 1,
-1.259623, 1.1095, -0.5987028, 1, 0.6352941, 0, 1,
-1.256435, -0.4050951, -3.929301, 1, 0.6431373, 0, 1,
-1.25145, -1.751434, -3.313393, 1, 0.6470588, 0, 1,
-1.248746, -0.2029669, -0.208122, 1, 0.654902, 0, 1,
-1.242513, 0.3599823, -1.219004, 1, 0.6588235, 0, 1,
-1.231561, -0.2152965, -0.8258739, 1, 0.6666667, 0, 1,
-1.231054, 0.1553629, -2.243936, 1, 0.6705883, 0, 1,
-1.224497, 0.9590352, 0.8626421, 1, 0.6784314, 0, 1,
-1.223969, 0.2186359, -0.2659522, 1, 0.682353, 0, 1,
-1.215802, 0.7129862, -1.317001, 1, 0.6901961, 0, 1,
-1.192166, 0.7273266, -0.6442101, 1, 0.6941177, 0, 1,
-1.188667, -0.287857, -3.283498, 1, 0.7019608, 0, 1,
-1.183161, 0.4307489, -2.454854, 1, 0.7098039, 0, 1,
-1.173511, -1.001327, -3.318766, 1, 0.7137255, 0, 1,
-1.171027, -1.450026, -2.120463, 1, 0.7215686, 0, 1,
-1.168907, -0.3873738, -2.651499, 1, 0.7254902, 0, 1,
-1.167404, -0.175212, -3.181284, 1, 0.7333333, 0, 1,
-1.152426, -0.4382541, -1.971532, 1, 0.7372549, 0, 1,
-1.141956, -0.5151415, -0.9071882, 1, 0.7450981, 0, 1,
-1.137593, -0.7088002, -2.720192, 1, 0.7490196, 0, 1,
-1.126927, -0.4246745, -2.057715, 1, 0.7568628, 0, 1,
-1.121243, -0.753444, -1.901865, 1, 0.7607843, 0, 1,
-1.116109, 1.086535, -1.091866, 1, 0.7686275, 0, 1,
-1.107355, -0.1991385, -1.865498, 1, 0.772549, 0, 1,
-1.10704, -0.3505467, -1.981181, 1, 0.7803922, 0, 1,
-1.103724, 0.3166593, 1.366738, 1, 0.7843137, 0, 1,
-1.103376, -0.9615593, -2.199851, 1, 0.7921569, 0, 1,
-1.096662, -1.505029, -2.345709, 1, 0.7960784, 0, 1,
-1.095734, 0.518494, -0.7319976, 1, 0.8039216, 0, 1,
-1.094357, -0.8909601, -1.343245, 1, 0.8117647, 0, 1,
-1.091429, 0.9445927, -1.145812, 1, 0.8156863, 0, 1,
-1.088274, -1.979802, -2.435491, 1, 0.8235294, 0, 1,
-1.084521, -0.2837079, -0.6540229, 1, 0.827451, 0, 1,
-1.075834, -1.003379, -3.391223, 1, 0.8352941, 0, 1,
-1.07489, -0.03655198, -2.696024, 1, 0.8392157, 0, 1,
-1.074211, -0.9489978, -2.319222, 1, 0.8470588, 0, 1,
-1.068821, 0.6894133, -0.3871872, 1, 0.8509804, 0, 1,
-1.06458, 1.386784, 1.441622, 1, 0.8588235, 0, 1,
-1.062726, 0.3959424, -1.907152, 1, 0.8627451, 0, 1,
-1.0622, -0.06168119, -0.722238, 1, 0.8705882, 0, 1,
-1.058449, 1.604746, -0.1532866, 1, 0.8745098, 0, 1,
-1.053183, -0.2548026, -0.6503869, 1, 0.8823529, 0, 1,
-1.048211, -0.7890843, -2.873098, 1, 0.8862745, 0, 1,
-1.043603, 0.7570439, -0.5163742, 1, 0.8941177, 0, 1,
-1.0424, 0.3946708, 0.01321862, 1, 0.8980392, 0, 1,
-1.041053, 0.1613376, -0.7004496, 1, 0.9058824, 0, 1,
-1.039316, 0.9455235, -1.543201, 1, 0.9137255, 0, 1,
-1.037326, 0.4608083, -1.222853, 1, 0.9176471, 0, 1,
-1.036053, 2.173732, -0.3440488, 1, 0.9254902, 0, 1,
-1.032172, 1.021058, -0.309189, 1, 0.9294118, 0, 1,
-1.022741, 0.05102012, -0.2023166, 1, 0.9372549, 0, 1,
-1.01502, 0.9036132, -0.6060365, 1, 0.9411765, 0, 1,
-1.011994, -1.158971, -1.41387, 1, 0.9490196, 0, 1,
-1.011472, -0.2032576, -0.956724, 1, 0.9529412, 0, 1,
-1.011021, -0.06448077, -2.144628, 1, 0.9607843, 0, 1,
-0.9970201, -2.063516, -0.9999341, 1, 0.9647059, 0, 1,
-0.9857305, 1.745588, -1.581365, 1, 0.972549, 0, 1,
-0.9831179, -0.4551242, -2.40907, 1, 0.9764706, 0, 1,
-0.9820754, -0.1551048, -2.236804, 1, 0.9843137, 0, 1,
-0.9816113, -2.018306, -4.223917, 1, 0.9882353, 0, 1,
-0.9789199, -0.8760641, -2.042545, 1, 0.9960784, 0, 1,
-0.9746436, 1.2128, -1.80487, 0.9960784, 1, 0, 1,
-0.9742764, 2.374326, -0.6532915, 0.9921569, 1, 0, 1,
-0.9740714, -1.467934, -2.653664, 0.9843137, 1, 0, 1,
-0.9709012, 0.3453811, -2.065792, 0.9803922, 1, 0, 1,
-0.9565135, -0.4253388, -4.630816, 0.972549, 1, 0, 1,
-0.9551104, -1.214972, -3.777726, 0.9686275, 1, 0, 1,
-0.9541236, -0.01193141, -0.5014863, 0.9607843, 1, 0, 1,
-0.946723, -1.903722, -3.282354, 0.9568627, 1, 0, 1,
-0.9391821, 0.2858961, -1.93826, 0.9490196, 1, 0, 1,
-0.9360696, -0.1518855, -1.434625, 0.945098, 1, 0, 1,
-0.929188, -0.7480792, -1.228689, 0.9372549, 1, 0, 1,
-0.9278833, -0.2748876, -1.241601, 0.9333333, 1, 0, 1,
-0.926345, -0.605651, -1.418125, 0.9254902, 1, 0, 1,
-0.9248081, -0.3023108, -2.384474, 0.9215686, 1, 0, 1,
-0.9238694, -0.4403781, -1.702596, 0.9137255, 1, 0, 1,
-0.9219586, -0.4032792, -2.364259, 0.9098039, 1, 0, 1,
-0.9172433, 0.3425579, -0.8303021, 0.9019608, 1, 0, 1,
-0.9167644, -0.5349855, -2.456024, 0.8941177, 1, 0, 1,
-0.9117674, -1.299294, -2.293729, 0.8901961, 1, 0, 1,
-0.9101864, -1.203613, -2.999727, 0.8823529, 1, 0, 1,
-0.9074351, -0.9919959, -1.938091, 0.8784314, 1, 0, 1,
-0.9045942, 1.277335, -2.166444, 0.8705882, 1, 0, 1,
-0.9030563, -1.550198, -2.487697, 0.8666667, 1, 0, 1,
-0.8983921, -0.03037697, -2.646744, 0.8588235, 1, 0, 1,
-0.8849881, 0.5034945, -1.130234, 0.854902, 1, 0, 1,
-0.880627, -1.467394, -2.763877, 0.8470588, 1, 0, 1,
-0.8799875, 0.9994677, -0.4955295, 0.8431373, 1, 0, 1,
-0.876811, 0.7670082, -1.324948, 0.8352941, 1, 0, 1,
-0.8724976, -2.051317, -4.17916, 0.8313726, 1, 0, 1,
-0.8714293, 0.1421461, -0.1881766, 0.8235294, 1, 0, 1,
-0.8705668, 0.4393427, -0.318301, 0.8196079, 1, 0, 1,
-0.8589594, 1.367145, -0.7932855, 0.8117647, 1, 0, 1,
-0.8512969, -0.6038274, -2.561811, 0.8078431, 1, 0, 1,
-0.8479877, 0.828768, -1.816749, 0.8, 1, 0, 1,
-0.8458874, 0.05043164, -1.392513, 0.7921569, 1, 0, 1,
-0.8355067, 0.4430356, -2.559699, 0.7882353, 1, 0, 1,
-0.83507, 0.669444, -0.2440343, 0.7803922, 1, 0, 1,
-0.8342265, 1.21265, -0.2087841, 0.7764706, 1, 0, 1,
-0.8342166, 1.953136, 1.068981, 0.7686275, 1, 0, 1,
-0.8341694, -1.186935, -2.977289, 0.7647059, 1, 0, 1,
-0.8326345, 0.0434396, -2.210233, 0.7568628, 1, 0, 1,
-0.8153435, 0.9446478, -1.173426, 0.7529412, 1, 0, 1,
-0.8139077, 0.7944994, -0.508739, 0.7450981, 1, 0, 1,
-0.8094809, -0.1228987, -0.7952479, 0.7411765, 1, 0, 1,
-0.8083168, 0.421778, -2.073435, 0.7333333, 1, 0, 1,
-0.8018342, -0.4895787, -3.216114, 0.7294118, 1, 0, 1,
-0.8011029, -1.340223, -4.008504, 0.7215686, 1, 0, 1,
-0.8004945, 0.04843896, -1.156687, 0.7176471, 1, 0, 1,
-0.7994884, -0.1984192, -1.249322, 0.7098039, 1, 0, 1,
-0.7957585, 0.2211229, 1.030713, 0.7058824, 1, 0, 1,
-0.7945114, -0.2867434, -0.4188315, 0.6980392, 1, 0, 1,
-0.7714123, -0.3596858, -3.427666, 0.6901961, 1, 0, 1,
-0.7708243, -0.1284931, -3.026744, 0.6862745, 1, 0, 1,
-0.7698395, -0.2471841, 0.3540042, 0.6784314, 1, 0, 1,
-0.7624806, -0.2180593, -2.459357, 0.6745098, 1, 0, 1,
-0.7574123, -0.2953438, -1.07291, 0.6666667, 1, 0, 1,
-0.7572431, 0.1529169, -0.4489115, 0.6627451, 1, 0, 1,
-0.7571848, 0.008280117, -2.024801, 0.654902, 1, 0, 1,
-0.7485716, -1.055249, -0.4663716, 0.6509804, 1, 0, 1,
-0.744302, -1.73799, -1.939124, 0.6431373, 1, 0, 1,
-0.7432486, 0.5259341, -0.5907038, 0.6392157, 1, 0, 1,
-0.7419512, -2.935034, -3.883542, 0.6313726, 1, 0, 1,
-0.7411702, -0.2920383, -0.7705243, 0.627451, 1, 0, 1,
-0.7340511, 0.2252567, -1.772171, 0.6196079, 1, 0, 1,
-0.7322131, 0.4374184, -1.685036, 0.6156863, 1, 0, 1,
-0.7284361, -0.7644012, -2.052197, 0.6078432, 1, 0, 1,
-0.7280913, 0.05836803, 0.07837576, 0.6039216, 1, 0, 1,
-0.7279301, -1.062566, -4.28103, 0.5960785, 1, 0, 1,
-0.7259851, 1.004951, -0.5662329, 0.5882353, 1, 0, 1,
-0.7235461, -0.857588, -2.806995, 0.5843138, 1, 0, 1,
-0.7197202, -0.03518379, -1.446631, 0.5764706, 1, 0, 1,
-0.7171215, -0.5840423, -2.489981, 0.572549, 1, 0, 1,
-0.7111626, -0.02582435, -1.966264, 0.5647059, 1, 0, 1,
-0.7105684, 0.6431639, -1.862178, 0.5607843, 1, 0, 1,
-0.7084071, -1.02077, -4.051659, 0.5529412, 1, 0, 1,
-0.7062365, -0.8440344, -1.991064, 0.5490196, 1, 0, 1,
-0.7025062, -0.7871285, -0.2149522, 0.5411765, 1, 0, 1,
-0.7002987, 1.000085, -0.5782339, 0.5372549, 1, 0, 1,
-0.6995146, 2.259253, -0.9677756, 0.5294118, 1, 0, 1,
-0.6975037, -0.4217171, -1.644206, 0.5254902, 1, 0, 1,
-0.6944561, -0.5922828, -3.053808, 0.5176471, 1, 0, 1,
-0.6944295, 0.3202442, -2.190555, 0.5137255, 1, 0, 1,
-0.6909516, -1.259289, -4.005033, 0.5058824, 1, 0, 1,
-0.689172, 0.6272178, 0.6499698, 0.5019608, 1, 0, 1,
-0.6834724, -0.8510036, -0.7993661, 0.4941176, 1, 0, 1,
-0.6800169, -0.5509556, -1.65261, 0.4862745, 1, 0, 1,
-0.6756348, -0.3634221, -2.907595, 0.4823529, 1, 0, 1,
-0.6682485, 1.256082, 0.2933201, 0.4745098, 1, 0, 1,
-0.6667145, 2.031219, -0.2169203, 0.4705882, 1, 0, 1,
-0.6607539, -2.218966, -2.05997, 0.4627451, 1, 0, 1,
-0.6582728, 0.2622744, -3.332706, 0.4588235, 1, 0, 1,
-0.655176, -0.8067861, -3.216353, 0.4509804, 1, 0, 1,
-0.6537184, -0.2722679, -0.9496593, 0.4470588, 1, 0, 1,
-0.6533293, 1.799633, -0.5116054, 0.4392157, 1, 0, 1,
-0.6496804, -0.7208919, -2.658886, 0.4352941, 1, 0, 1,
-0.6473658, 0.687767, -1.401431, 0.427451, 1, 0, 1,
-0.6472901, -1.459592, -2.753075, 0.4235294, 1, 0, 1,
-0.6466464, 0.4479497, -0.5123736, 0.4156863, 1, 0, 1,
-0.640706, 1.765469, -0.4149337, 0.4117647, 1, 0, 1,
-0.6381178, 1.105462, 0.1383364, 0.4039216, 1, 0, 1,
-0.635322, -0.34705, -3.968628, 0.3960784, 1, 0, 1,
-0.6345139, 0.5556523, -0.8643044, 0.3921569, 1, 0, 1,
-0.6333781, -0.455969, -3.047546, 0.3843137, 1, 0, 1,
-0.6289158, -0.3619332, -1.819721, 0.3803922, 1, 0, 1,
-0.6229869, -0.4781854, 0.09082472, 0.372549, 1, 0, 1,
-0.6138633, -0.3230781, -1.619473, 0.3686275, 1, 0, 1,
-0.6121475, -1.156547, -2.451634, 0.3607843, 1, 0, 1,
-0.6096418, -0.7029193, -3.683691, 0.3568628, 1, 0, 1,
-0.6084993, 0.691511, -0.4212366, 0.3490196, 1, 0, 1,
-0.6045212, 0.8692423, 1.092578, 0.345098, 1, 0, 1,
-0.601419, -0.7901587, -1.611328, 0.3372549, 1, 0, 1,
-0.5991732, -0.5805815, -3.636692, 0.3333333, 1, 0, 1,
-0.5982471, -0.3861887, -2.400205, 0.3254902, 1, 0, 1,
-0.5950276, 1.174989, -1.228075, 0.3215686, 1, 0, 1,
-0.5932583, 1.190411, -0.8387592, 0.3137255, 1, 0, 1,
-0.5843191, 0.2345981, 0.4533425, 0.3098039, 1, 0, 1,
-0.584208, -0.7022499, -2.072682, 0.3019608, 1, 0, 1,
-0.5831848, 0.1737725, -1.136771, 0.2941177, 1, 0, 1,
-0.5805599, -0.5024576, -3.360911, 0.2901961, 1, 0, 1,
-0.5787612, 0.5173991, 0.6096413, 0.282353, 1, 0, 1,
-0.5757034, -0.9672931, -5.060423, 0.2784314, 1, 0, 1,
-0.5738817, -1.433178, -4.019347, 0.2705882, 1, 0, 1,
-0.5734074, 1.020754, -0.9567354, 0.2666667, 1, 0, 1,
-0.5698723, -2.031024, -2.264024, 0.2588235, 1, 0, 1,
-0.5690497, 0.6517845, -1.71452, 0.254902, 1, 0, 1,
-0.568835, 0.934494, -0.2785081, 0.2470588, 1, 0, 1,
-0.5586723, -0.01494822, -1.808099, 0.2431373, 1, 0, 1,
-0.5555822, -0.8539866, -2.510325, 0.2352941, 1, 0, 1,
-0.5532954, 0.8958112, -2.312637, 0.2313726, 1, 0, 1,
-0.5446504, -0.8833201, -0.4186911, 0.2235294, 1, 0, 1,
-0.5445158, 0.2995598, -0.8390145, 0.2196078, 1, 0, 1,
-0.5414311, -0.1001685, -2.171629, 0.2117647, 1, 0, 1,
-0.5382888, 0.03874191, -4.994837, 0.2078431, 1, 0, 1,
-0.5340919, 0.6965548, -0.2764551, 0.2, 1, 0, 1,
-0.5319706, 0.002442078, -3.393129, 0.1921569, 1, 0, 1,
-0.5291311, -0.1368584, -0.9555089, 0.1882353, 1, 0, 1,
-0.5285568, -1.913229, -2.611602, 0.1803922, 1, 0, 1,
-0.5282243, -0.2669097, -1.025854, 0.1764706, 1, 0, 1,
-0.5280383, -0.07381392, -1.522406, 0.1686275, 1, 0, 1,
-0.5246669, -0.6308445, -4.349086, 0.1647059, 1, 0, 1,
-0.5236599, 0.235094, -0.895476, 0.1568628, 1, 0, 1,
-0.5201678, 1.608642, 0.06368962, 0.1529412, 1, 0, 1,
-0.5182049, 0.2912228, -0.9408711, 0.145098, 1, 0, 1,
-0.5152023, -0.09655829, -1.763843, 0.1411765, 1, 0, 1,
-0.5130813, 0.7406291, 0.1707541, 0.1333333, 1, 0, 1,
-0.5102298, 0.4406916, -0.853799, 0.1294118, 1, 0, 1,
-0.5073258, 0.4632217, -1.059064, 0.1215686, 1, 0, 1,
-0.5055773, 1.01233, 0.2008627, 0.1176471, 1, 0, 1,
-0.503891, 0.2245728, -1.000048, 0.1098039, 1, 0, 1,
-0.5013781, 1.770203, 0.5900664, 0.1058824, 1, 0, 1,
-0.4995729, -0.4971302, -2.811162, 0.09803922, 1, 0, 1,
-0.498809, -0.8573428, -3.658561, 0.09019608, 1, 0, 1,
-0.4969684, 0.07427525, -2.002998, 0.08627451, 1, 0, 1,
-0.4927798, 0.6262909, -0.4172052, 0.07843138, 1, 0, 1,
-0.4857646, -0.4080793, -0.9014362, 0.07450981, 1, 0, 1,
-0.4830528, 1.89513, 0.8995763, 0.06666667, 1, 0, 1,
-0.4798287, 0.2435006, -1.379937, 0.0627451, 1, 0, 1,
-0.4796103, -0.1071039, -0.8829114, 0.05490196, 1, 0, 1,
-0.4758819, -0.6331275, -2.393126, 0.05098039, 1, 0, 1,
-0.4738752, -0.7346173, -2.776006, 0.04313726, 1, 0, 1,
-0.473457, -0.3422216, -2.377217, 0.03921569, 1, 0, 1,
-0.4697549, 1.83304, -0.9639934, 0.03137255, 1, 0, 1,
-0.466107, 1.994308, 0.3383334, 0.02745098, 1, 0, 1,
-0.4567055, -0.9332722, -2.260194, 0.01960784, 1, 0, 1,
-0.4560868, 0.4868731, 0.5355422, 0.01568628, 1, 0, 1,
-0.4537677, -0.1130631, -2.58374, 0.007843138, 1, 0, 1,
-0.4526051, 0.6208598, -1.234757, 0.003921569, 1, 0, 1,
-0.4482268, -1.016161, -2.279178, 0, 1, 0.003921569, 1,
-0.4376796, -1.061595, -1.625631, 0, 1, 0.01176471, 1,
-0.435858, 0.5513918, -0.4277256, 0, 1, 0.01568628, 1,
-0.4357933, -0.1934455, -2.985807, 0, 1, 0.02352941, 1,
-0.4353295, -0.2938804, -2.734812, 0, 1, 0.02745098, 1,
-0.4352221, 1.875898, -1.206382, 0, 1, 0.03529412, 1,
-0.4347501, -1.825293, -2.29032, 0, 1, 0.03921569, 1,
-0.4330936, 0.4742936, -0.9845098, 0, 1, 0.04705882, 1,
-0.4307818, -0.08507149, -1.953517, 0, 1, 0.05098039, 1,
-0.4299192, -0.08727904, -2.436364, 0, 1, 0.05882353, 1,
-0.429697, 0.3571601, -1.079142, 0, 1, 0.0627451, 1,
-0.4289432, 0.6133658, -2.062631, 0, 1, 0.07058824, 1,
-0.4259104, 1.081789, -1.524865, 0, 1, 0.07450981, 1,
-0.4228819, -0.931406, -0.8464372, 0, 1, 0.08235294, 1,
-0.421811, 0.8425266, -0.3175888, 0, 1, 0.08627451, 1,
-0.4217295, 0.7098482, 1.935711, 0, 1, 0.09411765, 1,
-0.4147282, -1.87116, -3.722082, 0, 1, 0.1019608, 1,
-0.4135829, 0.181396, -0.1784203, 0, 1, 0.1058824, 1,
-0.4127697, -1.214925, -4.017169, 0, 1, 0.1137255, 1,
-0.4099565, -1.543715, -2.561371, 0, 1, 0.1176471, 1,
-0.4052572, 0.07107707, -0.09384721, 0, 1, 0.1254902, 1,
-0.4037091, 0.01651087, -1.53972, 0, 1, 0.1294118, 1,
-0.4023623, 0.8613062, 0.3961436, 0, 1, 0.1372549, 1,
-0.3979754, -0.07871269, -2.682392, 0, 1, 0.1411765, 1,
-0.3899308, 0.7571505, 1.084234, 0, 1, 0.1490196, 1,
-0.3885277, 0.3662616, 0.07626638, 0, 1, 0.1529412, 1,
-0.3831067, 2.348676, -2.149261, 0, 1, 0.1607843, 1,
-0.3826319, -0.4583205, -3.216663, 0, 1, 0.1647059, 1,
-0.3807307, 1.617817, -1.776978, 0, 1, 0.172549, 1,
-0.3806891, 0.4649791, 0.7423325, 0, 1, 0.1764706, 1,
-0.3775792, -0.2988386, -1.430316, 0, 1, 0.1843137, 1,
-0.3773206, 1.626884, 0.04387367, 0, 1, 0.1882353, 1,
-0.3753355, -1.093975, -3.79359, 0, 1, 0.1960784, 1,
-0.3742727, 0.5562663, 1.492153, 0, 1, 0.2039216, 1,
-0.3730484, 3.35028, 1.338637, 0, 1, 0.2078431, 1,
-0.3729602, 1.70041, -1.100459, 0, 1, 0.2156863, 1,
-0.3727176, -1.136173, -1.423923, 0, 1, 0.2196078, 1,
-0.3684205, -0.5371043, -3.141008, 0, 1, 0.227451, 1,
-0.3620802, -0.3806677, -3.261706, 0, 1, 0.2313726, 1,
-0.3554547, 1.158827, 1.17819, 0, 1, 0.2392157, 1,
-0.3550901, 0.672582, -0.7331274, 0, 1, 0.2431373, 1,
-0.3543527, -0.8246082, -3.70136, 0, 1, 0.2509804, 1,
-0.3478329, -1.389609, -2.629926, 0, 1, 0.254902, 1,
-0.337973, 0.4288928, -1.36016, 0, 1, 0.2627451, 1,
-0.336153, -0.07674152, -2.002266, 0, 1, 0.2666667, 1,
-0.3355133, 0.9286214, -0.1124319, 0, 1, 0.2745098, 1,
-0.3328077, 1.455759, 2.399424, 0, 1, 0.2784314, 1,
-0.3282572, 0.5437531, 0.7786567, 0, 1, 0.2862745, 1,
-0.3272611, 0.04753879, -0.708635, 0, 1, 0.2901961, 1,
-0.3265988, -0.5852919, -2.108521, 0, 1, 0.2980392, 1,
-0.3241628, 0.2916364, -1.389389, 0, 1, 0.3058824, 1,
-0.3213441, -0.3155949, -2.604522, 0, 1, 0.3098039, 1,
-0.3194461, -0.8971841, -3.279217, 0, 1, 0.3176471, 1,
-0.3191461, 0.6622224, 0.2846313, 0, 1, 0.3215686, 1,
-0.3158411, 1.323643, -1.520315, 0, 1, 0.3294118, 1,
-0.3075453, 0.9665333, -0.7450271, 0, 1, 0.3333333, 1,
-0.3072281, 0.5683854, -0.598106, 0, 1, 0.3411765, 1,
-0.3070684, -1.313462, -3.790861, 0, 1, 0.345098, 1,
-0.3068446, 0.7877146, -0.07081422, 0, 1, 0.3529412, 1,
-0.3055558, -1.330808, -3.092351, 0, 1, 0.3568628, 1,
-0.3052799, -0.3434373, -2.705769, 0, 1, 0.3647059, 1,
-0.3013537, -0.5385337, -0.9442231, 0, 1, 0.3686275, 1,
-0.2999125, -1.35956, -3.979913, 0, 1, 0.3764706, 1,
-0.2959586, -0.5908189, -2.880581, 0, 1, 0.3803922, 1,
-0.2922847, -0.5303614, -1.594859, 0, 1, 0.3882353, 1,
-0.2916323, 0.1396699, -0.8196407, 0, 1, 0.3921569, 1,
-0.2877309, 0.9415207, 0.3031016, 0, 1, 0.4, 1,
-0.2877274, -1.022369, -1.361998, 0, 1, 0.4078431, 1,
-0.2819703, -1.298203, -4.261288, 0, 1, 0.4117647, 1,
-0.2818765, 1.290957, 0.3775057, 0, 1, 0.4196078, 1,
-0.2807611, 0.9897454, -0.6136743, 0, 1, 0.4235294, 1,
-0.2798033, -1.198061, -2.192849, 0, 1, 0.4313726, 1,
-0.2781515, -1.209669, -3.200822, 0, 1, 0.4352941, 1,
-0.2713775, 1.231076, -0.1966026, 0, 1, 0.4431373, 1,
-0.270428, 0.4412919, 0.3676982, 0, 1, 0.4470588, 1,
-0.2677914, -0.4068046, -2.457194, 0, 1, 0.454902, 1,
-0.2649775, -0.06632022, -1.654, 0, 1, 0.4588235, 1,
-0.2644947, 0.6478766, -0.002928043, 0, 1, 0.4666667, 1,
-0.2627762, -0.6365638, -2.629329, 0, 1, 0.4705882, 1,
-0.260101, -0.07114305, -2.398442, 0, 1, 0.4784314, 1,
-0.2544086, -0.9952813, -1.387769, 0, 1, 0.4823529, 1,
-0.2519462, -0.6085253, -3.76904, 0, 1, 0.4901961, 1,
-0.2504655, -1.566678, -2.997763, 0, 1, 0.4941176, 1,
-0.2449834, 0.1745675, -2.30807, 0, 1, 0.5019608, 1,
-0.2397753, 0.3293146, -1.153427, 0, 1, 0.509804, 1,
-0.2336174, 0.2480978, -2.256429, 0, 1, 0.5137255, 1,
-0.2212438, -0.02567175, -1.529644, 0, 1, 0.5215687, 1,
-0.2169022, -0.7484969, -2.813533, 0, 1, 0.5254902, 1,
-0.2106709, 0.9662607, -0.1269593, 0, 1, 0.5333334, 1,
-0.2032588, -1.114119, -4.007768, 0, 1, 0.5372549, 1,
-0.2021783, 1.174346, -1.366998, 0, 1, 0.5450981, 1,
-0.2021211, 0.614882, 0.1082043, 0, 1, 0.5490196, 1,
-0.2011478, -0.2085303, -1.895074, 0, 1, 0.5568628, 1,
-0.1962478, -0.6153579, -2.181492, 0, 1, 0.5607843, 1,
-0.1927266, 1.517897, -0.3287517, 0, 1, 0.5686275, 1,
-0.188866, 0.2734441, -0.05251952, 0, 1, 0.572549, 1,
-0.1858018, 2.542637, -0.4620279, 0, 1, 0.5803922, 1,
-0.1834499, 0.355409, -0.7354046, 0, 1, 0.5843138, 1,
-0.1804556, -1.332549, -3.776796, 0, 1, 0.5921569, 1,
-0.1797141, -1.198868, -1.718165, 0, 1, 0.5960785, 1,
-0.1782576, -0.5309995, -4.835985, 0, 1, 0.6039216, 1,
-0.1715132, -1.628036, -1.988316, 0, 1, 0.6117647, 1,
-0.1702333, 0.5344102, -0.4341411, 0, 1, 0.6156863, 1,
-0.1690541, 0.4369744, -1.048051, 0, 1, 0.6235294, 1,
-0.1655685, -0.7439602, -3.675869, 0, 1, 0.627451, 1,
-0.1622326, -0.1209965, -3.107102, 0, 1, 0.6352941, 1,
-0.1615043, -0.5369036, -2.101365, 0, 1, 0.6392157, 1,
-0.1609568, -0.9474499, -1.77327, 0, 1, 0.6470588, 1,
-0.1551839, -1.078902, -3.714056, 0, 1, 0.6509804, 1,
-0.1528693, -0.4606127, -4.558394, 0, 1, 0.6588235, 1,
-0.1508864, -0.2932152, -1.30511, 0, 1, 0.6627451, 1,
-0.1479561, 1.132214, 1.396783, 0, 1, 0.6705883, 1,
-0.1478407, 0.188699, -0.6054884, 0, 1, 0.6745098, 1,
-0.1471329, 0.08137639, -0.3818035, 0, 1, 0.682353, 1,
-0.1470431, 1.359633, -1.217513, 0, 1, 0.6862745, 1,
-0.1464497, 1.444201, -0.7180068, 0, 1, 0.6941177, 1,
-0.1451521, -0.2950939, -1.138134, 0, 1, 0.7019608, 1,
-0.1446447, 0.4595494, -0.8475027, 0, 1, 0.7058824, 1,
-0.1426192, -0.2803258, -2.06763, 0, 1, 0.7137255, 1,
-0.1382584, 0.6097825, -0.07856098, 0, 1, 0.7176471, 1,
-0.1322131, -0.2284895, -3.180151, 0, 1, 0.7254902, 1,
-0.1320626, 1.494592, 0.5432056, 0, 1, 0.7294118, 1,
-0.131315, 0.1097426, -1.188088, 0, 1, 0.7372549, 1,
-0.1226206, 0.5524827, 0.1599407, 0, 1, 0.7411765, 1,
-0.1212678, 0.6690099, 0.06924707, 0, 1, 0.7490196, 1,
-0.1170047, -1.203413, -3.354955, 0, 1, 0.7529412, 1,
-0.1160029, 0.821715, -1.604562, 0, 1, 0.7607843, 1,
-0.1129718, -0.7997066, -1.751459, 0, 1, 0.7647059, 1,
-0.1126301, -1.671183, -3.173311, 0, 1, 0.772549, 1,
-0.1082719, -0.04534507, -2.063558, 0, 1, 0.7764706, 1,
-0.1054244, 0.1062219, -0.78352, 0, 1, 0.7843137, 1,
-0.1012141, -1.267166, -3.012336, 0, 1, 0.7882353, 1,
-0.09506603, 0.3814929, 1.207783, 0, 1, 0.7960784, 1,
-0.09278242, -1.502651, -2.695016, 0, 1, 0.8039216, 1,
-0.09055287, 0.9730504, 1.614586, 0, 1, 0.8078431, 1,
-0.08848358, -0.6524789, -2.265981, 0, 1, 0.8156863, 1,
-0.08806401, -0.1806339, -1.205348, 0, 1, 0.8196079, 1,
-0.08708295, -1.362313, -2.822691, 0, 1, 0.827451, 1,
-0.08597806, 0.7340755, 1.458742, 0, 1, 0.8313726, 1,
-0.08550374, 0.006960243, 1.022598, 0, 1, 0.8392157, 1,
-0.08298286, -0.6305814, -3.216657, 0, 1, 0.8431373, 1,
-0.08076961, 0.158508, -0.1758274, 0, 1, 0.8509804, 1,
-0.07942498, 0.6130308, 0.5357152, 0, 1, 0.854902, 1,
-0.07543056, -1.081127, -2.397226, 0, 1, 0.8627451, 1,
-0.07395548, -0.1571973, -3.13491, 0, 1, 0.8666667, 1,
-0.07269856, 0.8299657, -0.1958543, 0, 1, 0.8745098, 1,
-0.07098243, -0.9985911, -2.831272, 0, 1, 0.8784314, 1,
-0.06827945, -0.4127213, -1.264322, 0, 1, 0.8862745, 1,
-0.06502251, -1.632211, -1.943943, 0, 1, 0.8901961, 1,
-0.06336953, 0.9130884, -0.6927642, 0, 1, 0.8980392, 1,
-0.06201632, 1.115142, -0.7060208, 0, 1, 0.9058824, 1,
-0.06162335, -0.7236243, -4.855198, 0, 1, 0.9098039, 1,
-0.06150837, 0.1346441, -0.4875858, 0, 1, 0.9176471, 1,
-0.05790899, -0.6058412, -4.806271, 0, 1, 0.9215686, 1,
-0.05703524, 1.520704, 0.9657504, 0, 1, 0.9294118, 1,
-0.05604586, -0.4562167, -2.1326, 0, 1, 0.9333333, 1,
-0.05342982, 1.335833, -0.6202293, 0, 1, 0.9411765, 1,
-0.04926123, 1.286703, 0.3460203, 0, 1, 0.945098, 1,
-0.04204939, 0.5449997, 0.6670426, 0, 1, 0.9529412, 1,
-0.03613487, 2.124178, 2.215625, 0, 1, 0.9568627, 1,
-0.03458533, -0.7997369, -2.104412, 0, 1, 0.9647059, 1,
-0.02628677, -0.7462891, -3.029488, 0, 1, 0.9686275, 1,
-0.0244041, 1.460574, -0.9741118, 0, 1, 0.9764706, 1,
-0.02071143, 2.296365, -0.3562304, 0, 1, 0.9803922, 1,
-0.02017122, -1.02257, -2.552545, 0, 1, 0.9882353, 1,
-0.0196962, 1.394769, -1.888133, 0, 1, 0.9921569, 1,
-0.0180127, 0.6007488, 0.6575705, 0, 1, 1, 1,
-0.01662386, -1.053545, -2.906408, 0, 0.9921569, 1, 1,
-0.01195584, -0.7963906, -3.5875, 0, 0.9882353, 1, 1,
-0.007370062, 0.4023796, -0.8819532, 0, 0.9803922, 1, 1,
-0.005634271, -1.878272, -2.689761, 0, 0.9764706, 1, 1,
-0.003765495, 0.9913745, 0.8895407, 0, 0.9686275, 1, 1,
-0.002376647, 0.03378116, -0.2335148, 0, 0.9647059, 1, 1,
-0.001697842, 0.5874936, -0.7699804, 0, 0.9568627, 1, 1,
0.004057203, 0.1551382, -0.9762079, 0, 0.9529412, 1, 1,
0.004896777, 0.05919453, 0.905121, 0, 0.945098, 1, 1,
0.005182905, 0.1556653, 0.824867, 0, 0.9411765, 1, 1,
0.008833836, -1.516151, 4.135106, 0, 0.9333333, 1, 1,
0.009586954, 0.9656678, -0.1836417, 0, 0.9294118, 1, 1,
0.01021185, 0.4520955, 0.1964228, 0, 0.9215686, 1, 1,
0.01440993, 0.8108319, -0.08240126, 0, 0.9176471, 1, 1,
0.01961495, -0.1667341, 2.816826, 0, 0.9098039, 1, 1,
0.02110726, 0.4712304, -0.6462296, 0, 0.9058824, 1, 1,
0.02179027, 0.8732972, -0.1660353, 0, 0.8980392, 1, 1,
0.02554535, 0.3984166, 0.6984419, 0, 0.8901961, 1, 1,
0.02718964, -1.783442, 2.954832, 0, 0.8862745, 1, 1,
0.02737334, 0.1518893, -0.3783871, 0, 0.8784314, 1, 1,
0.03174758, 1.193915, 0.9163211, 0, 0.8745098, 1, 1,
0.03189613, 0.658398, 0.8502634, 0, 0.8666667, 1, 1,
0.0319976, -1.331066, 3.030764, 0, 0.8627451, 1, 1,
0.03242772, -0.3404932, 3.086522, 0, 0.854902, 1, 1,
0.03300161, 1.533195, -0.02327145, 0, 0.8509804, 1, 1,
0.03355321, 0.9136558, 0.5666842, 0, 0.8431373, 1, 1,
0.03716265, 1.064767, 0.2232976, 0, 0.8392157, 1, 1,
0.04459416, 0.3475973, 0.4580455, 0, 0.8313726, 1, 1,
0.04494804, -1.637804, 3.857102, 0, 0.827451, 1, 1,
0.0478301, -1.222586, 3.737335, 0, 0.8196079, 1, 1,
0.05038108, -0.7340796, 4.20447, 0, 0.8156863, 1, 1,
0.05085874, -0.4697988, 4.118773, 0, 0.8078431, 1, 1,
0.05366549, 0.7595128, 0.382894, 0, 0.8039216, 1, 1,
0.05372504, -0.1196456, 2.112175, 0, 0.7960784, 1, 1,
0.05878562, 0.2911573, 0.8297933, 0, 0.7882353, 1, 1,
0.06020586, -2.811862, 2.608274, 0, 0.7843137, 1, 1,
0.06073665, 0.5100163, 1.833851, 0, 0.7764706, 1, 1,
0.060823, 0.6894956, 0.8140855, 0, 0.772549, 1, 1,
0.0627241, -0.8769143, 4.135004, 0, 0.7647059, 1, 1,
0.06381238, 0.2282432, 0.4967963, 0, 0.7607843, 1, 1,
0.06653795, 0.1431757, 1.170019, 0, 0.7529412, 1, 1,
0.07114773, -0.3214008, 4.769571, 0, 0.7490196, 1, 1,
0.07277958, -1.372068, 3.076606, 0, 0.7411765, 1, 1,
0.0731158, 1.356791, -2.14376, 0, 0.7372549, 1, 1,
0.07391241, -0.2840546, 3.713233, 0, 0.7294118, 1, 1,
0.0799695, 1.498157, 2.248838, 0, 0.7254902, 1, 1,
0.08104204, -0.03564535, 0.9411598, 0, 0.7176471, 1, 1,
0.08425104, -1.222486, 3.022939, 0, 0.7137255, 1, 1,
0.0886295, -0.4080984, 2.422134, 0, 0.7058824, 1, 1,
0.08983514, -0.01604488, 1.827678, 0, 0.6980392, 1, 1,
0.0902152, -0.3360646, 1.294368, 0, 0.6941177, 1, 1,
0.09199463, -0.855733, 2.291503, 0, 0.6862745, 1, 1,
0.09251354, 1.713163, -1.780135, 0, 0.682353, 1, 1,
0.09290017, -0.3254258, 3.327322, 0, 0.6745098, 1, 1,
0.09490945, -0.6026023, 4.808079, 0, 0.6705883, 1, 1,
0.09533568, 0.2301577, 0.4873787, 0, 0.6627451, 1, 1,
0.09692162, -0.2103937, 3.811457, 0, 0.6588235, 1, 1,
0.09803452, 1.17999, -1.267518, 0, 0.6509804, 1, 1,
0.09956154, 0.3005178, 0.8979954, 0, 0.6470588, 1, 1,
0.1014044, -0.7317389, 2.300096, 0, 0.6392157, 1, 1,
0.1017913, 1.316151, -1.138343, 0, 0.6352941, 1, 1,
0.1049603, 0.9281276, 0.7283519, 0, 0.627451, 1, 1,
0.1094929, 2.694871, -0.2389007, 0, 0.6235294, 1, 1,
0.114605, 0.3804093, -1.497989, 0, 0.6156863, 1, 1,
0.1150448, -2.280881, 4.158516, 0, 0.6117647, 1, 1,
0.116967, -0.1070846, 2.769544, 0, 0.6039216, 1, 1,
0.1171117, -0.4879676, 2.107693, 0, 0.5960785, 1, 1,
0.1193473, -1.266812, 3.92205, 0, 0.5921569, 1, 1,
0.1233718, 0.8656582, -0.01226162, 0, 0.5843138, 1, 1,
0.1248125, -1.276751, 3.523901, 0, 0.5803922, 1, 1,
0.1268757, -0.4083793, 3.253143, 0, 0.572549, 1, 1,
0.1272568, 1.349304, 0.394874, 0, 0.5686275, 1, 1,
0.1278841, -0.107519, 3.018561, 0, 0.5607843, 1, 1,
0.1287744, -0.742398, 4.115334, 0, 0.5568628, 1, 1,
0.1292178, 1.487393, -1.082867, 0, 0.5490196, 1, 1,
0.1337208, -0.5116021, 2.156695, 0, 0.5450981, 1, 1,
0.1374615, -0.1552738, 4.051515, 0, 0.5372549, 1, 1,
0.1389147, 0.9946992, 0.6011724, 0, 0.5333334, 1, 1,
0.1408029, 0.03388715, -0.8260804, 0, 0.5254902, 1, 1,
0.1416574, -0.9360421, 3.722498, 0, 0.5215687, 1, 1,
0.142602, 0.3622032, 1.982105, 0, 0.5137255, 1, 1,
0.1440265, -0.1345561, 3.335704, 0, 0.509804, 1, 1,
0.1482783, 0.2974225, 1.960058, 0, 0.5019608, 1, 1,
0.1510462, 0.6684501, -0.7508145, 0, 0.4941176, 1, 1,
0.1545337, -0.3154084, 0.8374536, 0, 0.4901961, 1, 1,
0.1584271, -1.151465, 2.049516, 0, 0.4823529, 1, 1,
0.1626433, 0.4619687, -1.253842, 0, 0.4784314, 1, 1,
0.1654399, 0.8293933, -0.6110941, 0, 0.4705882, 1, 1,
0.16558, -0.789749, 4.31163, 0, 0.4666667, 1, 1,
0.1737179, -0.8230439, 2.744311, 0, 0.4588235, 1, 1,
0.1754764, 0.02766929, 1.07206, 0, 0.454902, 1, 1,
0.1763709, 0.06081283, 1.574666, 0, 0.4470588, 1, 1,
0.1764449, 1.001855, -0.6945829, 0, 0.4431373, 1, 1,
0.1765772, -2.439937, 0.7054836, 0, 0.4352941, 1, 1,
0.1770634, -1.296802, 3.241064, 0, 0.4313726, 1, 1,
0.179125, 0.1966748, 0.6867248, 0, 0.4235294, 1, 1,
0.1806407, -1.498916, 3.660494, 0, 0.4196078, 1, 1,
0.1815677, -1.029725, 2.833534, 0, 0.4117647, 1, 1,
0.1816287, 1.103241, 0.5714799, 0, 0.4078431, 1, 1,
0.1817356, 0.1987817, 0.4011994, 0, 0.4, 1, 1,
0.1823967, 0.1692732, 1.411263, 0, 0.3921569, 1, 1,
0.1832456, 1.676611, 1.023094, 0, 0.3882353, 1, 1,
0.1892317, 0.9747673, -1.41219, 0, 0.3803922, 1, 1,
0.1916819, -0.6437114, 2.659329, 0, 0.3764706, 1, 1,
0.1925929, 1.077524, 0.3333127, 0, 0.3686275, 1, 1,
0.1928832, -0.5661879, 3.939259, 0, 0.3647059, 1, 1,
0.1963249, 1.845184, 0.1562524, 0, 0.3568628, 1, 1,
0.2049063, -0.6184632, 3.104623, 0, 0.3529412, 1, 1,
0.2054537, -0.4863459, 2.453148, 0, 0.345098, 1, 1,
0.2123337, -0.6679497, 3.164436, 0, 0.3411765, 1, 1,
0.212778, 1.112559, 1.073053, 0, 0.3333333, 1, 1,
0.2134871, -1.06186, 1.560408, 0, 0.3294118, 1, 1,
0.2239605, 0.1194669, 1.859241, 0, 0.3215686, 1, 1,
0.2262022, -0.178345, 2.177568, 0, 0.3176471, 1, 1,
0.2282305, -0.07770663, 1.600831, 0, 0.3098039, 1, 1,
0.2292447, -0.0003606313, 1.320349, 0, 0.3058824, 1, 1,
0.2301077, -0.4711083, 1.589649, 0, 0.2980392, 1, 1,
0.2388443, 0.868786, 0.8953606, 0, 0.2901961, 1, 1,
0.2420626, 1.313674, -0.7787221, 0, 0.2862745, 1, 1,
0.2485575, -0.3275492, 1.749723, 0, 0.2784314, 1, 1,
0.2491024, 0.2353278, 2.440391, 0, 0.2745098, 1, 1,
0.2493348, 0.7608885, -0.2478293, 0, 0.2666667, 1, 1,
0.2520826, -1.795128, 2.671779, 0, 0.2627451, 1, 1,
0.2654291, 0.3815969, 0.8583244, 0, 0.254902, 1, 1,
0.2658207, 0.306928, 0.9882163, 0, 0.2509804, 1, 1,
0.2683683, 0.3623914, 1.178333, 0, 0.2431373, 1, 1,
0.27507, 0.6448563, 1.055683, 0, 0.2392157, 1, 1,
0.2773266, 1.004354, 1.583711, 0, 0.2313726, 1, 1,
0.2831443, -0.3462757, 1.388053, 0, 0.227451, 1, 1,
0.2867084, 0.5971268, 0.8124081, 0, 0.2196078, 1, 1,
0.2954674, 1.346625, -0.5682995, 0, 0.2156863, 1, 1,
0.3038471, -0.8424152, 1.363362, 0, 0.2078431, 1, 1,
0.3044279, -0.02502359, 2.586529, 0, 0.2039216, 1, 1,
0.3079843, -0.3838422, 2.934036, 0, 0.1960784, 1, 1,
0.3085321, -1.335657, 2.316271, 0, 0.1882353, 1, 1,
0.3121552, -2.224344, 5.352365, 0, 0.1843137, 1, 1,
0.3202015, -0.3932135, 3.103197, 0, 0.1764706, 1, 1,
0.3281357, -0.03044753, 2.245555, 0, 0.172549, 1, 1,
0.3294646, -1.475947, 2.455273, 0, 0.1647059, 1, 1,
0.3299674, 1.102616, -0.5360997, 0, 0.1607843, 1, 1,
0.3313577, 1.402468, 0.6617852, 0, 0.1529412, 1, 1,
0.3354376, -0.1734483, 1.664313, 0, 0.1490196, 1, 1,
0.3364059, 0.5545366, 0.6832103, 0, 0.1411765, 1, 1,
0.3419761, 0.5635518, 0.5991784, 0, 0.1372549, 1, 1,
0.3457485, -0.2584088, 2.302472, 0, 0.1294118, 1, 1,
0.3472008, -0.7035677, 2.787907, 0, 0.1254902, 1, 1,
0.3472294, -1.599781, 4.184162, 0, 0.1176471, 1, 1,
0.3581884, -1.081495, 4.026856, 0, 0.1137255, 1, 1,
0.3587998, 0.9690458, -0.08528288, 0, 0.1058824, 1, 1,
0.359853, 1.308049, 0.1995232, 0, 0.09803922, 1, 1,
0.3693544, 2.042267, 0.3801393, 0, 0.09411765, 1, 1,
0.3716174, -2.374923, 4.836373, 0, 0.08627451, 1, 1,
0.3723216, 0.6625074, -0.2458237, 0, 0.08235294, 1, 1,
0.3726657, -0.1215473, 3.460063, 0, 0.07450981, 1, 1,
0.3729471, 0.5027443, -1.350065, 0, 0.07058824, 1, 1,
0.3745981, -1.292483, 2.928629, 0, 0.0627451, 1, 1,
0.3854309, -1.037231, 2.081155, 0, 0.05882353, 1, 1,
0.3861512, -0.3573402, 1.397977, 0, 0.05098039, 1, 1,
0.3864006, 0.03247261, 0.9931899, 0, 0.04705882, 1, 1,
0.3873095, -0.4728065, 2.469959, 0, 0.03921569, 1, 1,
0.3884608, 0.9137793, 1.163017, 0, 0.03529412, 1, 1,
0.3889655, 0.2006993, 0.58322, 0, 0.02745098, 1, 1,
0.3901495, 0.937445, 0.2750178, 0, 0.02352941, 1, 1,
0.3920147, 0.9438756, 0.9305734, 0, 0.01568628, 1, 1,
0.392162, -0.2311441, 1.820459, 0, 0.01176471, 1, 1,
0.3926431, -0.166007, 1.780654, 0, 0.003921569, 1, 1,
0.4004881, 0.7272316, 1.428321, 0.003921569, 0, 1, 1,
0.4023842, 1.80143, 2.337991, 0.007843138, 0, 1, 1,
0.4044711, -2.451539, 4.596367, 0.01568628, 0, 1, 1,
0.4051886, 1.373801, -0.7587852, 0.01960784, 0, 1, 1,
0.4063141, 1.852863, 0.8026064, 0.02745098, 0, 1, 1,
0.4259982, -1.625611, 4.203897, 0.03137255, 0, 1, 1,
0.4266671, 1.14168, 2.242526, 0.03921569, 0, 1, 1,
0.4289269, 0.527647, -0.942991, 0.04313726, 0, 1, 1,
0.4315327, 0.5926046, 1.203851, 0.05098039, 0, 1, 1,
0.4361035, 0.7666876, -0.5711747, 0.05490196, 0, 1, 1,
0.4408627, 1.12965, 1.20233, 0.0627451, 0, 1, 1,
0.4432727, 0.4353923, 0.9314086, 0.06666667, 0, 1, 1,
0.4440975, 2.300643, -0.5785167, 0.07450981, 0, 1, 1,
0.4522415, -0.8696833, 3.32164, 0.07843138, 0, 1, 1,
0.4532414, 0.7788716, 1.89924, 0.08627451, 0, 1, 1,
0.4552045, 1.219006, -1.151961, 0.09019608, 0, 1, 1,
0.4552604, 0.8821103, -0.2129122, 0.09803922, 0, 1, 1,
0.4571663, 0.6960259, -0.2301708, 0.1058824, 0, 1, 1,
0.4693646, 0.9622548, 1.315047, 0.1098039, 0, 1, 1,
0.46953, -0.412221, 3.462209, 0.1176471, 0, 1, 1,
0.472101, 0.06132746, 1.660153, 0.1215686, 0, 1, 1,
0.4741724, -0.6051943, 2.438176, 0.1294118, 0, 1, 1,
0.4777162, 1.775092, 1.15874, 0.1333333, 0, 1, 1,
0.4790328, 1.644528, -0.1493821, 0.1411765, 0, 1, 1,
0.4822695, 0.9134086, 1.596787, 0.145098, 0, 1, 1,
0.4842947, 0.3928318, 0.362273, 0.1529412, 0, 1, 1,
0.4887698, 0.5561875, 2.058226, 0.1568628, 0, 1, 1,
0.4889627, -0.9883035, 1.794596, 0.1647059, 0, 1, 1,
0.4892662, 0.3032332, 2.016678, 0.1686275, 0, 1, 1,
0.4898037, -1.891075, 2.734869, 0.1764706, 0, 1, 1,
0.4923141, -1.493201, 2.231724, 0.1803922, 0, 1, 1,
0.4935985, -0.09098037, 2.794417, 0.1882353, 0, 1, 1,
0.4940612, -0.8092228, 0.7591149, 0.1921569, 0, 1, 1,
0.4966394, 0.2955766, -0.6838251, 0.2, 0, 1, 1,
0.4972379, 1.196002, 0.2284485, 0.2078431, 0, 1, 1,
0.5006441, -0.3035129, 1.531299, 0.2117647, 0, 1, 1,
0.5019695, 1.434326, 0.3476154, 0.2196078, 0, 1, 1,
0.5035657, 1.14929, 0.3063618, 0.2235294, 0, 1, 1,
0.5056501, 0.2605048, 2.314461, 0.2313726, 0, 1, 1,
0.5073357, -0.3931639, 1.701851, 0.2352941, 0, 1, 1,
0.5108184, -1.64868, 2.935738, 0.2431373, 0, 1, 1,
0.5240901, -1.129619, 2.30385, 0.2470588, 0, 1, 1,
0.5275198, -0.8675601, 3.654351, 0.254902, 0, 1, 1,
0.5293261, 0.3797508, 0.4043803, 0.2588235, 0, 1, 1,
0.5306445, -0.3762572, 1.909376, 0.2666667, 0, 1, 1,
0.5322621, -0.5584396, 1.170659, 0.2705882, 0, 1, 1,
0.5349407, -0.6092472, 1.149883, 0.2784314, 0, 1, 1,
0.5399156, 0.9952217, 0.03137727, 0.282353, 0, 1, 1,
0.5433715, 0.01175942, 2.672693, 0.2901961, 0, 1, 1,
0.5433913, -0.2763728, 3.023024, 0.2941177, 0, 1, 1,
0.5449896, 0.3462698, 0.6585535, 0.3019608, 0, 1, 1,
0.5460256, -0.960554, 2.251086, 0.3098039, 0, 1, 1,
0.5483388, 2.342607, -0.3594621, 0.3137255, 0, 1, 1,
0.5531293, -1.778899, 2.331695, 0.3215686, 0, 1, 1,
0.5540574, 0.05671513, 0.1566091, 0.3254902, 0, 1, 1,
0.5551489, -0.06104716, 2.088598, 0.3333333, 0, 1, 1,
0.5615455, 1.419576, 1.519911, 0.3372549, 0, 1, 1,
0.5638722, 0.6405933, 0.5019864, 0.345098, 0, 1, 1,
0.5682834, -0.02626708, 1.762995, 0.3490196, 0, 1, 1,
0.5695576, 0.6304261, 0.01034584, 0.3568628, 0, 1, 1,
0.5741049, -1.131524, 2.767112, 0.3607843, 0, 1, 1,
0.5746679, 0.06094741, 1.780759, 0.3686275, 0, 1, 1,
0.5793167, 2.071499, -0.8018741, 0.372549, 0, 1, 1,
0.5813205, -0.5024216, 1.018503, 0.3803922, 0, 1, 1,
0.5984306, 0.5483045, 0.615776, 0.3843137, 0, 1, 1,
0.6062345, -0.2547973, 1.661366, 0.3921569, 0, 1, 1,
0.6083083, -1.094996, 1.588502, 0.3960784, 0, 1, 1,
0.6103425, 1.42888, 1.69944, 0.4039216, 0, 1, 1,
0.6112113, 0.7835684, 0.8013097, 0.4117647, 0, 1, 1,
0.6119094, 0.9800419, 1.152563, 0.4156863, 0, 1, 1,
0.6128492, 1.576831, 1.172541, 0.4235294, 0, 1, 1,
0.6131091, 0.03373898, 0.4149564, 0.427451, 0, 1, 1,
0.6171003, 0.05371167, 1.041477, 0.4352941, 0, 1, 1,
0.6191043, 0.3121215, 0.6859394, 0.4392157, 0, 1, 1,
0.6210584, 1.902276, 0.6222597, 0.4470588, 0, 1, 1,
0.6257676, 1.521255, 1.304193, 0.4509804, 0, 1, 1,
0.6313713, -0.8751095, 4.867488, 0.4588235, 0, 1, 1,
0.6322718, 1.845683, -0.426553, 0.4627451, 0, 1, 1,
0.6327982, 0.6608979, 1.506513, 0.4705882, 0, 1, 1,
0.6349702, -0.5192448, 2.055844, 0.4745098, 0, 1, 1,
0.6397464, 0.6245987, 0.4251105, 0.4823529, 0, 1, 1,
0.6398451, -1.089741, 1.787908, 0.4862745, 0, 1, 1,
0.6426781, 0.7985452, 1.137483, 0.4941176, 0, 1, 1,
0.6501442, -0.4128548, 1.483795, 0.5019608, 0, 1, 1,
0.654726, 0.5362217, -0.8437522, 0.5058824, 0, 1, 1,
0.6557618, 1.996655, 1.254667, 0.5137255, 0, 1, 1,
0.6566113, -0.3317078, 4.254445, 0.5176471, 0, 1, 1,
0.6574885, -0.07825033, 1.975004, 0.5254902, 0, 1, 1,
0.6617507, 1.64627, 0.07302411, 0.5294118, 0, 1, 1,
0.6622418, 1.735719, 0.5082347, 0.5372549, 0, 1, 1,
0.6627121, -0.02165489, 1.669591, 0.5411765, 0, 1, 1,
0.6768447, -1.552148, 3.651543, 0.5490196, 0, 1, 1,
0.6789691, 2.318412, -0.07797922, 0.5529412, 0, 1, 1,
0.6825898, 0.393907, 1.307665, 0.5607843, 0, 1, 1,
0.6895991, 0.6881182, 1.6536, 0.5647059, 0, 1, 1,
0.6940297, 1.342225, 0.397488, 0.572549, 0, 1, 1,
0.6997606, -1.178812, 1.307422, 0.5764706, 0, 1, 1,
0.7083426, -0.2884277, 1.87539, 0.5843138, 0, 1, 1,
0.7151813, -0.1770106, 0.6107656, 0.5882353, 0, 1, 1,
0.7214658, 0.5801423, 0.1301046, 0.5960785, 0, 1, 1,
0.7249495, -1.904343, 3.614453, 0.6039216, 0, 1, 1,
0.7254927, -0.5386456, 3.231932, 0.6078432, 0, 1, 1,
0.7370677, -1.366523, 2.435704, 0.6156863, 0, 1, 1,
0.7380354, -1.367315, 3.379642, 0.6196079, 0, 1, 1,
0.7395621, 1.145922, 0.4416755, 0.627451, 0, 1, 1,
0.747192, -0.8721457, 1.678683, 0.6313726, 0, 1, 1,
0.7550375, 0.2923273, 1.490208, 0.6392157, 0, 1, 1,
0.761288, 0.2311444, 1.286783, 0.6431373, 0, 1, 1,
0.7670329, -0.3421544, 2.56702, 0.6509804, 0, 1, 1,
0.7689098, -1.315474, 2.970819, 0.654902, 0, 1, 1,
0.7727765, -0.2563973, 1.953181, 0.6627451, 0, 1, 1,
0.7729157, 0.8630688, 1.499661, 0.6666667, 0, 1, 1,
0.7771706, 0.8329672, 0.1191193, 0.6745098, 0, 1, 1,
0.7800314, -1.344368, 3.007428, 0.6784314, 0, 1, 1,
0.78096, 0.2406422, -0.2077533, 0.6862745, 0, 1, 1,
0.7841244, -0.6542106, 3.010058, 0.6901961, 0, 1, 1,
0.7847157, 0.3560934, 2.466622, 0.6980392, 0, 1, 1,
0.789171, 0.4240424, 0.6537978, 0.7058824, 0, 1, 1,
0.7908327, -0.4604761, 1.037875, 0.7098039, 0, 1, 1,
0.7920609, -0.7234297, 3.341014, 0.7176471, 0, 1, 1,
0.7924684, -1.048661, 2.930611, 0.7215686, 0, 1, 1,
0.7981532, -0.5250189, 2.598556, 0.7294118, 0, 1, 1,
0.8087882, 0.4040223, 2.274544, 0.7333333, 0, 1, 1,
0.812396, -1.29769, 2.785868, 0.7411765, 0, 1, 1,
0.8134237, -0.1118681, 1.986282, 0.7450981, 0, 1, 1,
0.821871, -0.6182281, 2.219921, 0.7529412, 0, 1, 1,
0.8231014, -0.9096842, 1.725272, 0.7568628, 0, 1, 1,
0.8278854, -1.15416, 3.567694, 0.7647059, 0, 1, 1,
0.8296704, 0.6308207, -0.3555809, 0.7686275, 0, 1, 1,
0.8325901, -1.066077, 2.151095, 0.7764706, 0, 1, 1,
0.8399173, -1.119777, 1.723517, 0.7803922, 0, 1, 1,
0.8455377, -0.5690678, 2.905665, 0.7882353, 0, 1, 1,
0.8500105, -0.2614062, 1.117403, 0.7921569, 0, 1, 1,
0.8515053, -0.7192972, 1.826316, 0.8, 0, 1, 1,
0.8534753, 1.134388, 1.591054, 0.8078431, 0, 1, 1,
0.8557472, 0.1885836, 1.469431, 0.8117647, 0, 1, 1,
0.8626223, -0.1719938, 1.029367, 0.8196079, 0, 1, 1,
0.8691314, -3.165716, 1.067522, 0.8235294, 0, 1, 1,
0.8699151, -1.204647, 3.586689, 0.8313726, 0, 1, 1,
0.8784059, -1.874976, 3.60461, 0.8352941, 0, 1, 1,
0.8805181, 1.040803, 1.431772, 0.8431373, 0, 1, 1,
0.8839508, 1.14162, -1.352093, 0.8470588, 0, 1, 1,
0.8898523, 1.562841, -0.7107423, 0.854902, 0, 1, 1,
0.8913248, -0.3564167, 3.651453, 0.8588235, 0, 1, 1,
0.9053064, -0.7685384, 1.967213, 0.8666667, 0, 1, 1,
0.9068678, 1.626635, -0.5460414, 0.8705882, 0, 1, 1,
0.9140749, 0.6206959, 2.516216, 0.8784314, 0, 1, 1,
0.9141698, -0.1307999, 3.079309, 0.8823529, 0, 1, 1,
0.9147236, -0.4360625, 0.5768524, 0.8901961, 0, 1, 1,
0.9222516, -0.9120852, 3.373967, 0.8941177, 0, 1, 1,
0.9226995, 0.931614, -0.7901544, 0.9019608, 0, 1, 1,
0.9238627, 0.8567183, 1.708048, 0.9098039, 0, 1, 1,
0.9303952, -1.156603, 2.722828, 0.9137255, 0, 1, 1,
0.9319745, -0.9551952, 2.515756, 0.9215686, 0, 1, 1,
0.9478176, 0.5512337, 1.731105, 0.9254902, 0, 1, 1,
0.9535926, 0.3608909, 1.791021, 0.9333333, 0, 1, 1,
0.9537182, -1.453241, 4.024687, 0.9372549, 0, 1, 1,
0.9537513, -0.7393845, 0.448148, 0.945098, 0, 1, 1,
0.9554679, -0.4187262, 2.348095, 0.9490196, 0, 1, 1,
0.957074, -0.2440059, 1.849261, 0.9568627, 0, 1, 1,
0.9611002, -1.562235, 0.896286, 0.9607843, 0, 1, 1,
0.9639822, -1.563219, 4.109631, 0.9686275, 0, 1, 1,
0.9688587, -0.08081836, 2.160398, 0.972549, 0, 1, 1,
0.9692796, 0.1420208, 1.107121, 0.9803922, 0, 1, 1,
0.9718522, -0.1024924, 2.488011, 0.9843137, 0, 1, 1,
0.9738639, -0.808736, 2.574758, 0.9921569, 0, 1, 1,
0.978159, 0.7419614, 0.0865801, 0.9960784, 0, 1, 1,
0.987322, -0.6895716, 0.3203656, 1, 0, 0.9960784, 1,
0.9886988, 0.481516, 2.433388, 1, 0, 0.9882353, 1,
0.9939811, -1.515091, 1.968033, 1, 0, 0.9843137, 1,
0.9980458, 1.055266, -1.546601, 1, 0, 0.9764706, 1,
0.9987389, -0.6928035, 3.561194, 1, 0, 0.972549, 1,
1.00517, -1.279576, 3.522779, 1, 0, 0.9647059, 1,
1.007081, 0.7248215, -0.8710042, 1, 0, 0.9607843, 1,
1.02183, -1.169053, 3.031805, 1, 0, 0.9529412, 1,
1.022868, 1.234613, -0.5832678, 1, 0, 0.9490196, 1,
1.025662, 0.9562888, 0.6703559, 1, 0, 0.9411765, 1,
1.028142, 0.9670628, 0.6672215, 1, 0, 0.9372549, 1,
1.033119, 0.9875832, 0.6205567, 1, 0, 0.9294118, 1,
1.03474, 1.492977, 1.121285, 1, 0, 0.9254902, 1,
1.047807, 0.4913444, 1.268522, 1, 0, 0.9176471, 1,
1.050789, -0.6632454, 3.119857, 1, 0, 0.9137255, 1,
1.051116, -0.7494637, 2.245168, 1, 0, 0.9058824, 1,
1.052884, 1.05526, -0.3751414, 1, 0, 0.9019608, 1,
1.055574, -0.03437229, 1.46289, 1, 0, 0.8941177, 1,
1.056639, -0.7612098, 1.717612, 1, 0, 0.8862745, 1,
1.06024, -1.174308, 2.943995, 1, 0, 0.8823529, 1,
1.06412, 1.87792, -0.1116307, 1, 0, 0.8745098, 1,
1.072071, 0.1854957, 1.715481, 1, 0, 0.8705882, 1,
1.072768, -0.9515176, 2.162139, 1, 0, 0.8627451, 1,
1.089899, -0.7585632, 0.390268, 1, 0, 0.8588235, 1,
1.114351, 0.9983913, 0.5034924, 1, 0, 0.8509804, 1,
1.114536, -1.52799, 3.330052, 1, 0, 0.8470588, 1,
1.115477, 0.01541206, 1.754152, 1, 0, 0.8392157, 1,
1.118265, 0.3503107, 0.3429801, 1, 0, 0.8352941, 1,
1.13493, 0.7915261, 2.642341, 1, 0, 0.827451, 1,
1.151326, -2.616138, 2.916562, 1, 0, 0.8235294, 1,
1.157816, 0.9973394, -0.69909, 1, 0, 0.8156863, 1,
1.15869, -0.1649579, 1.637156, 1, 0, 0.8117647, 1,
1.161759, 2.240191, 0.1798903, 1, 0, 0.8039216, 1,
1.162653, 0.6119462, 0.7921401, 1, 0, 0.7960784, 1,
1.16734, 0.682282, 1.291349, 1, 0, 0.7921569, 1,
1.173831, -0.09423618, 2.316057, 1, 0, 0.7843137, 1,
1.174145, -0.5744068, 2.046775, 1, 0, 0.7803922, 1,
1.180655, -1.181181, 3.230877, 1, 0, 0.772549, 1,
1.182115, 0.3410596, 1.23145, 1, 0, 0.7686275, 1,
1.184702, 1.538986, 0.7676318, 1, 0, 0.7607843, 1,
1.187242, -0.642396, 2.734848, 1, 0, 0.7568628, 1,
1.187385, 0.7506331, -0.06062918, 1, 0, 0.7490196, 1,
1.188096, -1.140471, 1.107909, 1, 0, 0.7450981, 1,
1.188365, 2.313845, -1.0926, 1, 0, 0.7372549, 1,
1.189669, 0.3925824, 2.702482, 1, 0, 0.7333333, 1,
1.196514, 0.8380103, 0.8618393, 1, 0, 0.7254902, 1,
1.200051, -0.683515, 3.195482, 1, 0, 0.7215686, 1,
1.202262, -1.533593, 2.359152, 1, 0, 0.7137255, 1,
1.20278, 0.119363, 2.437515, 1, 0, 0.7098039, 1,
1.204619, -1.783613, 1.084771, 1, 0, 0.7019608, 1,
1.217015, -0.1602509, 1.291272, 1, 0, 0.6941177, 1,
1.221656, -1.196351, 2.465348, 1, 0, 0.6901961, 1,
1.230271, -0.1991228, 0.2358068, 1, 0, 0.682353, 1,
1.251059, 0.3710448, 2.966102, 1, 0, 0.6784314, 1,
1.255311, 0.5563858, 2.50316, 1, 0, 0.6705883, 1,
1.258155, 0.7049205, 2.076496, 1, 0, 0.6666667, 1,
1.259218, 1.140063, 1.433638, 1, 0, 0.6588235, 1,
1.262745, -0.5698476, 0.8281174, 1, 0, 0.654902, 1,
1.271073, 0.6021482, 2.390352, 1, 0, 0.6470588, 1,
1.281091, 1.976268, -1.798348, 1, 0, 0.6431373, 1,
1.305289, 0.3336669, 2.325931, 1, 0, 0.6352941, 1,
1.308127, -1.544629, 3.38378, 1, 0, 0.6313726, 1,
1.322885, -1.271714, 2.206086, 1, 0, 0.6235294, 1,
1.323381, -0.004925461, 2.601376, 1, 0, 0.6196079, 1,
1.332388, 0.1143177, 3.276224, 1, 0, 0.6117647, 1,
1.346355, -1.440519, 1.649156, 1, 0, 0.6078432, 1,
1.347044, -0.2610244, 1.975047, 1, 0, 0.6, 1,
1.348888, 0.4738174, 1.512663, 1, 0, 0.5921569, 1,
1.357926, 0.395606, 0.6226135, 1, 0, 0.5882353, 1,
1.368616, 1.159075, 0.3752603, 1, 0, 0.5803922, 1,
1.377153, 0.8234943, 1.372681, 1, 0, 0.5764706, 1,
1.382414, -0.7438253, 1.343452, 1, 0, 0.5686275, 1,
1.385239, -0.823481, 0.7998284, 1, 0, 0.5647059, 1,
1.38837, -0.1415072, 2.649855, 1, 0, 0.5568628, 1,
1.391613, 0.449417, 2.106817, 1, 0, 0.5529412, 1,
1.404293, -1.083992, 2.24004, 1, 0, 0.5450981, 1,
1.406038, -1.222706, 3.828573, 1, 0, 0.5411765, 1,
1.409986, 2.666884, -0.1662271, 1, 0, 0.5333334, 1,
1.416071, 0.7525776, 1.535154, 1, 0, 0.5294118, 1,
1.42071, -0.4606618, 2.128948, 1, 0, 0.5215687, 1,
1.423329, 0.6146519, 0.896539, 1, 0, 0.5176471, 1,
1.427519, -0.33679, 1.901914, 1, 0, 0.509804, 1,
1.439002, -0.4901405, 0.6236185, 1, 0, 0.5058824, 1,
1.446077, -1.3347, 1.861681, 1, 0, 0.4980392, 1,
1.461994, -1.256935, 3.328647, 1, 0, 0.4901961, 1,
1.464013, -0.6590051, 1.339916, 1, 0, 0.4862745, 1,
1.464094, 0.2632772, 2.789331, 1, 0, 0.4784314, 1,
1.465006, 0.8463311, 1.204634, 1, 0, 0.4745098, 1,
1.465754, 1.285464, 0.1513621, 1, 0, 0.4666667, 1,
1.468176, 1.454623, 0.1942262, 1, 0, 0.4627451, 1,
1.469255, 0.4657093, 2.239643, 1, 0, 0.454902, 1,
1.477749, 2.298181, 0.01105107, 1, 0, 0.4509804, 1,
1.479366, -0.02738672, 0.5981162, 1, 0, 0.4431373, 1,
1.487032, 1.332154, 0.03081741, 1, 0, 0.4392157, 1,
1.492863, 0.8322222, 2.00127, 1, 0, 0.4313726, 1,
1.503219, -0.9406605, 1.978912, 1, 0, 0.427451, 1,
1.507172, 0.466358, -0.1413267, 1, 0, 0.4196078, 1,
1.516282, -0.9215684, 2.842724, 1, 0, 0.4156863, 1,
1.529881, 1.326884, -0.05083747, 1, 0, 0.4078431, 1,
1.536211, -0.1770345, 1.42049, 1, 0, 0.4039216, 1,
1.543574, 0.5980054, 0.7720361, 1, 0, 0.3960784, 1,
1.553088, -0.7622964, 2.420375, 1, 0, 0.3882353, 1,
1.555776, 0.2824363, 1.324921, 1, 0, 0.3843137, 1,
1.564113, -0.7039667, 0.7284427, 1, 0, 0.3764706, 1,
1.573867, -0.1588824, 2.747296, 1, 0, 0.372549, 1,
1.585386, 0.1247414, 1.297348, 1, 0, 0.3647059, 1,
1.586684, 0.7087424, 1.574092, 1, 0, 0.3607843, 1,
1.588936, 0.1309748, 3.090274, 1, 0, 0.3529412, 1,
1.594658, -1.435861, -0.02383243, 1, 0, 0.3490196, 1,
1.596041, -0.2778529, 1.140449, 1, 0, 0.3411765, 1,
1.599643, -1.904124, 2.883146, 1, 0, 0.3372549, 1,
1.610022, 0.855184, 0.520445, 1, 0, 0.3294118, 1,
1.610677, 0.3941112, 1.130996, 1, 0, 0.3254902, 1,
1.61528, -0.2572556, 2.04079, 1, 0, 0.3176471, 1,
1.627355, 0.6575776, 2.840973, 1, 0, 0.3137255, 1,
1.642332, 0.1889208, 1.844661, 1, 0, 0.3058824, 1,
1.644648, 0.03955049, 1.829579, 1, 0, 0.2980392, 1,
1.649273, -1.205737, 1.931876, 1, 0, 0.2941177, 1,
1.650936, 0.2130198, 0.9832283, 1, 0, 0.2862745, 1,
1.663888, 0.0440474, 3.593914, 1, 0, 0.282353, 1,
1.664044, 2.680204, 0.2023721, 1, 0, 0.2745098, 1,
1.665136, -0.6963153, 3.328176, 1, 0, 0.2705882, 1,
1.707619, -1.033394, 3.299686, 1, 0, 0.2627451, 1,
1.71696, 1.355806, 0.6191046, 1, 0, 0.2588235, 1,
1.724903, -0.6901062, 1.507239, 1, 0, 0.2509804, 1,
1.726084, -0.3873231, 1.468028, 1, 0, 0.2470588, 1,
1.733605, 0.8486639, 0.8098061, 1, 0, 0.2392157, 1,
1.749788, 0.1103435, 0.1293983, 1, 0, 0.2352941, 1,
1.757479, 1.227734, 0.9507998, 1, 0, 0.227451, 1,
1.762817, 0.9079667, 0.4180196, 1, 0, 0.2235294, 1,
1.768645, 0.4429951, 1.68742, 1, 0, 0.2156863, 1,
1.788835, -1.063608, 2.262483, 1, 0, 0.2117647, 1,
1.79182, 0.8776726, 3.080811, 1, 0, 0.2039216, 1,
1.79424, 0.7497756, 1.993868, 1, 0, 0.1960784, 1,
1.799791, -1.06621, 1.545145, 1, 0, 0.1921569, 1,
1.813547, -0.8671728, 2.144283, 1, 0, 0.1843137, 1,
1.81379, 0.7477436, 1.470632, 1, 0, 0.1803922, 1,
1.818613, 0.5600039, 1.489089, 1, 0, 0.172549, 1,
1.887787, 0.4980879, 1.893666, 1, 0, 0.1686275, 1,
1.896513, -0.5246443, -0.3234423, 1, 0, 0.1607843, 1,
1.911148, -1.245723, 2.242294, 1, 0, 0.1568628, 1,
1.968833, -1.917756, 2.510673, 1, 0, 0.1490196, 1,
1.985188, -0.8223916, 3.643554, 1, 0, 0.145098, 1,
2.009418, 0.27349, 1.416198, 1, 0, 0.1372549, 1,
2.015926, 0.2439076, 0.113854, 1, 0, 0.1333333, 1,
2.029343, -1.650181, 1.625031, 1, 0, 0.1254902, 1,
2.054395, -1.234723, 3.672955, 1, 0, 0.1215686, 1,
2.060143, 0.9542786, 3.339121, 1, 0, 0.1137255, 1,
2.113056, 0.1722689, 3.212707, 1, 0, 0.1098039, 1,
2.170943, -0.06687225, 2.944304, 1, 0, 0.1019608, 1,
2.201966, 2.722941, 2.773652, 1, 0, 0.09411765, 1,
2.226436, -0.3765259, 1.985237, 1, 0, 0.09019608, 1,
2.269023, -1.083878, 0.017341, 1, 0, 0.08235294, 1,
2.296696, -0.5902656, 4.111325, 1, 0, 0.07843138, 1,
2.334106, 0.07738229, 1.817543, 1, 0, 0.07058824, 1,
2.334302, 1.494981, 1.688645, 1, 0, 0.06666667, 1,
2.383581, 1.089674, 1.314881, 1, 0, 0.05882353, 1,
2.458675, -1.401042, 1.372937, 1, 0, 0.05490196, 1,
2.508776, 0.2517751, 1.45258, 1, 0, 0.04705882, 1,
2.517385, 1.014244, -0.3273176, 1, 0, 0.04313726, 1,
2.543275, 1.394227, 0.3678858, 1, 0, 0.03529412, 1,
2.629945, 0.5588037, 3.641174, 1, 0, 0.03137255, 1,
2.682586, 0.3054776, 1.390618, 1, 0, 0.02352941, 1,
2.859773, 0.2914776, 1.657401, 1, 0, 0.01960784, 1,
3.532271, 1.099313, 0.1915846, 1, 0, 0.01176471, 1,
3.542106, 1.473096, 1.133102, 1, 0, 0.007843138, 1
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
0.04462647, -4.270177, -6.82539, 0, -0.5, 0.5, 0.5,
0.04462647, -4.270177, -6.82539, 1, -0.5, 0.5, 0.5,
0.04462647, -4.270177, -6.82539, 1, 1.5, 0.5, 0.5,
0.04462647, -4.270177, -6.82539, 0, 1.5, 0.5, 0.5
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
-4.638498, 0.09228182, -6.82539, 0, -0.5, 0.5, 0.5,
-4.638498, 0.09228182, -6.82539, 1, -0.5, 0.5, 0.5,
-4.638498, 0.09228182, -6.82539, 1, 1.5, 0.5, 0.5,
-4.638498, 0.09228182, -6.82539, 0, 1.5, 0.5, 0.5
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
-4.638498, -4.270177, 0.1459711, 0, -0.5, 0.5, 0.5,
-4.638498, -4.270177, 0.1459711, 1, -0.5, 0.5, 0.5,
-4.638498, -4.270177, 0.1459711, 1, 1.5, 0.5, 0.5,
-4.638498, -4.270177, 0.1459711, 0, 1.5, 0.5, 0.5
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
-3, -3.263456, -5.216615,
3, -3.263456, -5.216615,
-3, -3.263456, -5.216615,
-3, -3.431243, -5.484744,
-2, -3.263456, -5.216615,
-2, -3.431243, -5.484744,
-1, -3.263456, -5.216615,
-1, -3.431243, -5.484744,
0, -3.263456, -5.216615,
0, -3.431243, -5.484744,
1, -3.263456, -5.216615,
1, -3.431243, -5.484744,
2, -3.263456, -5.216615,
2, -3.431243, -5.484744,
3, -3.263456, -5.216615,
3, -3.431243, -5.484744
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
-3, -3.766817, -6.021003, 0, -0.5, 0.5, 0.5,
-3, -3.766817, -6.021003, 1, -0.5, 0.5, 0.5,
-3, -3.766817, -6.021003, 1, 1.5, 0.5, 0.5,
-3, -3.766817, -6.021003, 0, 1.5, 0.5, 0.5,
-2, -3.766817, -6.021003, 0, -0.5, 0.5, 0.5,
-2, -3.766817, -6.021003, 1, -0.5, 0.5, 0.5,
-2, -3.766817, -6.021003, 1, 1.5, 0.5, 0.5,
-2, -3.766817, -6.021003, 0, 1.5, 0.5, 0.5,
-1, -3.766817, -6.021003, 0, -0.5, 0.5, 0.5,
-1, -3.766817, -6.021003, 1, -0.5, 0.5, 0.5,
-1, -3.766817, -6.021003, 1, 1.5, 0.5, 0.5,
-1, -3.766817, -6.021003, 0, 1.5, 0.5, 0.5,
0, -3.766817, -6.021003, 0, -0.5, 0.5, 0.5,
0, -3.766817, -6.021003, 1, -0.5, 0.5, 0.5,
0, -3.766817, -6.021003, 1, 1.5, 0.5, 0.5,
0, -3.766817, -6.021003, 0, 1.5, 0.5, 0.5,
1, -3.766817, -6.021003, 0, -0.5, 0.5, 0.5,
1, -3.766817, -6.021003, 1, -0.5, 0.5, 0.5,
1, -3.766817, -6.021003, 1, 1.5, 0.5, 0.5,
1, -3.766817, -6.021003, 0, 1.5, 0.5, 0.5,
2, -3.766817, -6.021003, 0, -0.5, 0.5, 0.5,
2, -3.766817, -6.021003, 1, -0.5, 0.5, 0.5,
2, -3.766817, -6.021003, 1, 1.5, 0.5, 0.5,
2, -3.766817, -6.021003, 0, 1.5, 0.5, 0.5,
3, -3.766817, -6.021003, 0, -0.5, 0.5, 0.5,
3, -3.766817, -6.021003, 1, -0.5, 0.5, 0.5,
3, -3.766817, -6.021003, 1, 1.5, 0.5, 0.5,
3, -3.766817, -6.021003, 0, 1.5, 0.5, 0.5
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
-3.557777, -3, -5.216615,
-3.557777, 3, -5.216615,
-3.557777, -3, -5.216615,
-3.737898, -3, -5.484744,
-3.557777, -2, -5.216615,
-3.737898, -2, -5.484744,
-3.557777, -1, -5.216615,
-3.737898, -1, -5.484744,
-3.557777, 0, -5.216615,
-3.737898, 0, -5.484744,
-3.557777, 1, -5.216615,
-3.737898, 1, -5.484744,
-3.557777, 2, -5.216615,
-3.737898, 2, -5.484744,
-3.557777, 3, -5.216615,
-3.737898, 3, -5.484744
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
-4.098138, -3, -6.021003, 0, -0.5, 0.5, 0.5,
-4.098138, -3, -6.021003, 1, -0.5, 0.5, 0.5,
-4.098138, -3, -6.021003, 1, 1.5, 0.5, 0.5,
-4.098138, -3, -6.021003, 0, 1.5, 0.5, 0.5,
-4.098138, -2, -6.021003, 0, -0.5, 0.5, 0.5,
-4.098138, -2, -6.021003, 1, -0.5, 0.5, 0.5,
-4.098138, -2, -6.021003, 1, 1.5, 0.5, 0.5,
-4.098138, -2, -6.021003, 0, 1.5, 0.5, 0.5,
-4.098138, -1, -6.021003, 0, -0.5, 0.5, 0.5,
-4.098138, -1, -6.021003, 1, -0.5, 0.5, 0.5,
-4.098138, -1, -6.021003, 1, 1.5, 0.5, 0.5,
-4.098138, -1, -6.021003, 0, 1.5, 0.5, 0.5,
-4.098138, 0, -6.021003, 0, -0.5, 0.5, 0.5,
-4.098138, 0, -6.021003, 1, -0.5, 0.5, 0.5,
-4.098138, 0, -6.021003, 1, 1.5, 0.5, 0.5,
-4.098138, 0, -6.021003, 0, 1.5, 0.5, 0.5,
-4.098138, 1, -6.021003, 0, -0.5, 0.5, 0.5,
-4.098138, 1, -6.021003, 1, -0.5, 0.5, 0.5,
-4.098138, 1, -6.021003, 1, 1.5, 0.5, 0.5,
-4.098138, 1, -6.021003, 0, 1.5, 0.5, 0.5,
-4.098138, 2, -6.021003, 0, -0.5, 0.5, 0.5,
-4.098138, 2, -6.021003, 1, -0.5, 0.5, 0.5,
-4.098138, 2, -6.021003, 1, 1.5, 0.5, 0.5,
-4.098138, 2, -6.021003, 0, 1.5, 0.5, 0.5,
-4.098138, 3, -6.021003, 0, -0.5, 0.5, 0.5,
-4.098138, 3, -6.021003, 1, -0.5, 0.5, 0.5,
-4.098138, 3, -6.021003, 1, 1.5, 0.5, 0.5,
-4.098138, 3, -6.021003, 0, 1.5, 0.5, 0.5
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
-3.557777, -3.263456, -4,
-3.557777, -3.263456, 4,
-3.557777, -3.263456, -4,
-3.737898, -3.431243, -4,
-3.557777, -3.263456, -2,
-3.737898, -3.431243, -2,
-3.557777, -3.263456, 0,
-3.737898, -3.431243, 0,
-3.557777, -3.263456, 2,
-3.737898, -3.431243, 2,
-3.557777, -3.263456, 4,
-3.737898, -3.431243, 4
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
-4.098138, -3.766817, -4, 0, -0.5, 0.5, 0.5,
-4.098138, -3.766817, -4, 1, -0.5, 0.5, 0.5,
-4.098138, -3.766817, -4, 1, 1.5, 0.5, 0.5,
-4.098138, -3.766817, -4, 0, 1.5, 0.5, 0.5,
-4.098138, -3.766817, -2, 0, -0.5, 0.5, 0.5,
-4.098138, -3.766817, -2, 1, -0.5, 0.5, 0.5,
-4.098138, -3.766817, -2, 1, 1.5, 0.5, 0.5,
-4.098138, -3.766817, -2, 0, 1.5, 0.5, 0.5,
-4.098138, -3.766817, 0, 0, -0.5, 0.5, 0.5,
-4.098138, -3.766817, 0, 1, -0.5, 0.5, 0.5,
-4.098138, -3.766817, 0, 1, 1.5, 0.5, 0.5,
-4.098138, -3.766817, 0, 0, 1.5, 0.5, 0.5,
-4.098138, -3.766817, 2, 0, -0.5, 0.5, 0.5,
-4.098138, -3.766817, 2, 1, -0.5, 0.5, 0.5,
-4.098138, -3.766817, 2, 1, 1.5, 0.5, 0.5,
-4.098138, -3.766817, 2, 0, 1.5, 0.5, 0.5,
-4.098138, -3.766817, 4, 0, -0.5, 0.5, 0.5,
-4.098138, -3.766817, 4, 1, -0.5, 0.5, 0.5,
-4.098138, -3.766817, 4, 1, 1.5, 0.5, 0.5,
-4.098138, -3.766817, 4, 0, 1.5, 0.5, 0.5
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
-3.557777, -3.263456, -5.216615,
-3.557777, 3.44802, -5.216615,
-3.557777, -3.263456, 5.508557,
-3.557777, 3.44802, 5.508557,
-3.557777, -3.263456, -5.216615,
-3.557777, -3.263456, 5.508557,
-3.557777, 3.44802, -5.216615,
-3.557777, 3.44802, 5.508557,
-3.557777, -3.263456, -5.216615,
3.64703, -3.263456, -5.216615,
-3.557777, -3.263456, 5.508557,
3.64703, -3.263456, 5.508557,
-3.557777, 3.44802, -5.216615,
3.64703, 3.44802, -5.216615,
-3.557777, 3.44802, 5.508557,
3.64703, 3.44802, 5.508557,
3.64703, -3.263456, -5.216615,
3.64703, 3.44802, -5.216615,
3.64703, -3.263456, 5.508557,
3.64703, 3.44802, 5.508557,
3.64703, -3.263456, -5.216615,
3.64703, -3.263456, 5.508557,
3.64703, 3.44802, -5.216615,
3.64703, 3.44802, 5.508557
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
var radius = 7.774553;
var distance = 34.58986;
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
mvMatrix.translate( -0.04462647, -0.09228182, -0.1459711 );
mvMatrix.scale( 1.166721, 1.252481, 0.7837636 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.58986);
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
Padan<-read.table("Padan.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Padan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Padan' not found
```

```r
y<-Padan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Padan' not found
```

```r
z<-Padan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Padan' not found
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
-3.452853, 0.5563124, -1.793548, 0, 0, 1, 1, 1,
-3.433139, 1.198693, -3.380561, 1, 0, 0, 1, 1,
-2.882195, 0.5083854, -1.405342, 1, 0, 0, 1, 1,
-2.510139, 1.494973, -1.215398, 1, 0, 0, 1, 1,
-2.479014, -0.3977692, 1.141035, 1, 0, 0, 1, 1,
-2.443328, -0.8667252, -2.962975, 1, 0, 0, 1, 1,
-2.406754, 1.019324, 0.003248614, 0, 0, 0, 1, 1,
-2.382949, -0.3987127, -1.045971, 0, 0, 0, 1, 1,
-2.358327, -0.7842978, -2.548105, 0, 0, 0, 1, 1,
-2.355363, 1.259252, -2.322307, 0, 0, 0, 1, 1,
-2.346307, -0.5839301, -1.63991, 0, 0, 0, 1, 1,
-2.21776, -1.897541, -3.925337, 0, 0, 0, 1, 1,
-2.201853, 0.4024631, -0.9541592, 0, 0, 0, 1, 1,
-2.188167, 0.2398953, -0.9342416, 1, 1, 1, 1, 1,
-2.1725, -0.6699628, -2.087447, 1, 1, 1, 1, 1,
-2.154254, 0.3874813, -1.775896, 1, 1, 1, 1, 1,
-2.150476, -0.8745778, -1.961784, 1, 1, 1, 1, 1,
-2.13199, 0.5327431, -0.1919534, 1, 1, 1, 1, 1,
-2.122892, 0.2548482, -1.734285, 1, 1, 1, 1, 1,
-2.121661, -0.04299318, -1.892414, 1, 1, 1, 1, 1,
-2.117909, 0.8684286, -2.023781, 1, 1, 1, 1, 1,
-2.083989, 0.4806009, 0.4649771, 1, 1, 1, 1, 1,
-2.074541, -0.3576098, -1.221415, 1, 1, 1, 1, 1,
-2.06883, 1.960151, 0.0987278, 1, 1, 1, 1, 1,
-2.060962, -1.58913, -3.3892, 1, 1, 1, 1, 1,
-2.046549, 2.23878, -1.644453, 1, 1, 1, 1, 1,
-2.001966, 0.7002546, 1.205787, 1, 1, 1, 1, 1,
-1.974729, 0.9055123, -1.621652, 1, 1, 1, 1, 1,
-1.959483, -0.6894206, -1.44033, 0, 0, 1, 1, 1,
-1.959267, -1.159809, -1.909135, 1, 0, 0, 1, 1,
-1.940854, -0.8535437, -0.7198817, 1, 0, 0, 1, 1,
-1.927599, 1.219323, -1.234153, 1, 0, 0, 1, 1,
-1.925226, 0.03460569, -0.1585072, 1, 0, 0, 1, 1,
-1.92405, -1.58097, -4.041685, 1, 0, 0, 1, 1,
-1.912422, -0.09735376, -2.135244, 0, 0, 0, 1, 1,
-1.874009, -0.06104384, -1.406453, 0, 0, 0, 1, 1,
-1.870874, -0.2755887, -2.048565, 0, 0, 0, 1, 1,
-1.794816, 1.029926, -1.062924, 0, 0, 0, 1, 1,
-1.792786, -0.2349301, -2.178362, 0, 0, 0, 1, 1,
-1.791174, -0.3426036, 0.4529115, 0, 0, 0, 1, 1,
-1.775045, -0.2919037, -1.450428, 0, 0, 0, 1, 1,
-1.770063, -0.5065885, -1.908055, 1, 1, 1, 1, 1,
-1.744994, 0.7544649, -1.120259, 1, 1, 1, 1, 1,
-1.737261, -1.798439, -0.4379048, 1, 1, 1, 1, 1,
-1.734327, -0.8407202, -2.258909, 1, 1, 1, 1, 1,
-1.724154, 0.4261819, -1.462841, 1, 1, 1, 1, 1,
-1.715117, 0.3792376, -1.447412, 1, 1, 1, 1, 1,
-1.681901, 0.179361, -0.3950784, 1, 1, 1, 1, 1,
-1.675255, 0.8187956, -1.656741, 1, 1, 1, 1, 1,
-1.670169, 0.5488393, -3.222114, 1, 1, 1, 1, 1,
-1.665307, 1.153576, 1.700543, 1, 1, 1, 1, 1,
-1.652566, -1.299304, -3.797941, 1, 1, 1, 1, 1,
-1.651188, 1.455381, -2.651662, 1, 1, 1, 1, 1,
-1.63985, -0.5005089, -2.4556, 1, 1, 1, 1, 1,
-1.616321, -0.8251204, -1.932546, 1, 1, 1, 1, 1,
-1.610298, -1.781057, -4.686048, 1, 1, 1, 1, 1,
-1.596841, -0.5025488, -2.924641, 0, 0, 1, 1, 1,
-1.583208, 0.4974623, 0.1060285, 1, 0, 0, 1, 1,
-1.575515, -0.3146108, -1.898965, 1, 0, 0, 1, 1,
-1.56797, 1.442593, -2.296784, 1, 0, 0, 1, 1,
-1.561789, -0.3214553, -0.5607638, 1, 0, 0, 1, 1,
-1.556028, 0.5024266, -0.9392458, 1, 0, 0, 1, 1,
-1.550393, -0.01917215, -1.206387, 0, 0, 0, 1, 1,
-1.544031, -2.165645, -0.4104096, 0, 0, 0, 1, 1,
-1.538558, -2.432059, -0.9021093, 0, 0, 0, 1, 1,
-1.513478, 0.764297, -0.2159766, 0, 0, 0, 1, 1,
-1.511114, -1.964116, -3.600973, 0, 0, 0, 1, 1,
-1.502998, -0.05229688, -1.260325, 0, 0, 0, 1, 1,
-1.499179, -0.601352, -2.301937, 0, 0, 0, 1, 1,
-1.490127, -0.3358516, -2.333895, 1, 1, 1, 1, 1,
-1.488886, 0.02136168, -2.94958, 1, 1, 1, 1, 1,
-1.471598, 0.7680596, -2.023051, 1, 1, 1, 1, 1,
-1.469076, 0.7367395, -2.881153, 1, 1, 1, 1, 1,
-1.463463, 0.9471951, -2.732322, 1, 1, 1, 1, 1,
-1.45311, -0.4206336, -2.910506, 1, 1, 1, 1, 1,
-1.430478, 0.5510007, -0.8908844, 1, 1, 1, 1, 1,
-1.421802, -0.2778476, -0.1521712, 1, 1, 1, 1, 1,
-1.413836, 0.8072801, -0.2810153, 1, 1, 1, 1, 1,
-1.403884, -0.3348339, -1.181741, 1, 1, 1, 1, 1,
-1.402847, -0.3189569, -2.15934, 1, 1, 1, 1, 1,
-1.400501, 1.282807, -1.793889, 1, 1, 1, 1, 1,
-1.392764, -0.6541155, -1.292711, 1, 1, 1, 1, 1,
-1.38896, 1.490555, -0.06203254, 1, 1, 1, 1, 1,
-1.388214, 0.86686, 0.3911572, 1, 1, 1, 1, 1,
-1.366047, -0.5232539, -1.515287, 0, 0, 1, 1, 1,
-1.361511, -0.07813777, -0.5195409, 1, 0, 0, 1, 1,
-1.359978, 1.064038, -1.684427, 1, 0, 0, 1, 1,
-1.359066, 0.644466, -0.370201, 1, 0, 0, 1, 1,
-1.358936, -2.292115, -1.831427, 1, 0, 0, 1, 1,
-1.358211, 1.17426, -0.01366262, 1, 0, 0, 1, 1,
-1.351816, 1.144088, 0.06903244, 0, 0, 0, 1, 1,
-1.347335, 0.2325307, -1.084588, 0, 0, 0, 1, 1,
-1.344307, -1.049625, -0.8067418, 0, 0, 0, 1, 1,
-1.322157, -0.8178521, -0.9574189, 0, 0, 0, 1, 1,
-1.314854, 0.6547685, -0.7963528, 0, 0, 0, 1, 1,
-1.311575, 0.01551309, -1.352896, 0, 0, 0, 1, 1,
-1.309909, -1.087665, -2.483837, 0, 0, 0, 1, 1,
-1.307315, 1.308848, -0.6243435, 1, 1, 1, 1, 1,
-1.299681, -0.5315911, -2.221538, 1, 1, 1, 1, 1,
-1.29437, 0.00587415, -1.724414, 1, 1, 1, 1, 1,
-1.288332, 0.4387012, -2.08552, 1, 1, 1, 1, 1,
-1.282274, 0.1065913, -2.827051, 1, 1, 1, 1, 1,
-1.279056, -0.8115813, -1.063205, 1, 1, 1, 1, 1,
-1.275655, -0.9950617, 0.09133942, 1, 1, 1, 1, 1,
-1.266209, -1.721632, -1.787365, 1, 1, 1, 1, 1,
-1.26188, 0.6704184, 0.2484179, 1, 1, 1, 1, 1,
-1.259623, 1.1095, -0.5987028, 1, 1, 1, 1, 1,
-1.256435, -0.4050951, -3.929301, 1, 1, 1, 1, 1,
-1.25145, -1.751434, -3.313393, 1, 1, 1, 1, 1,
-1.248746, -0.2029669, -0.208122, 1, 1, 1, 1, 1,
-1.242513, 0.3599823, -1.219004, 1, 1, 1, 1, 1,
-1.231561, -0.2152965, -0.8258739, 1, 1, 1, 1, 1,
-1.231054, 0.1553629, -2.243936, 0, 0, 1, 1, 1,
-1.224497, 0.9590352, 0.8626421, 1, 0, 0, 1, 1,
-1.223969, 0.2186359, -0.2659522, 1, 0, 0, 1, 1,
-1.215802, 0.7129862, -1.317001, 1, 0, 0, 1, 1,
-1.192166, 0.7273266, -0.6442101, 1, 0, 0, 1, 1,
-1.188667, -0.287857, -3.283498, 1, 0, 0, 1, 1,
-1.183161, 0.4307489, -2.454854, 0, 0, 0, 1, 1,
-1.173511, -1.001327, -3.318766, 0, 0, 0, 1, 1,
-1.171027, -1.450026, -2.120463, 0, 0, 0, 1, 1,
-1.168907, -0.3873738, -2.651499, 0, 0, 0, 1, 1,
-1.167404, -0.175212, -3.181284, 0, 0, 0, 1, 1,
-1.152426, -0.4382541, -1.971532, 0, 0, 0, 1, 1,
-1.141956, -0.5151415, -0.9071882, 0, 0, 0, 1, 1,
-1.137593, -0.7088002, -2.720192, 1, 1, 1, 1, 1,
-1.126927, -0.4246745, -2.057715, 1, 1, 1, 1, 1,
-1.121243, -0.753444, -1.901865, 1, 1, 1, 1, 1,
-1.116109, 1.086535, -1.091866, 1, 1, 1, 1, 1,
-1.107355, -0.1991385, -1.865498, 1, 1, 1, 1, 1,
-1.10704, -0.3505467, -1.981181, 1, 1, 1, 1, 1,
-1.103724, 0.3166593, 1.366738, 1, 1, 1, 1, 1,
-1.103376, -0.9615593, -2.199851, 1, 1, 1, 1, 1,
-1.096662, -1.505029, -2.345709, 1, 1, 1, 1, 1,
-1.095734, 0.518494, -0.7319976, 1, 1, 1, 1, 1,
-1.094357, -0.8909601, -1.343245, 1, 1, 1, 1, 1,
-1.091429, 0.9445927, -1.145812, 1, 1, 1, 1, 1,
-1.088274, -1.979802, -2.435491, 1, 1, 1, 1, 1,
-1.084521, -0.2837079, -0.6540229, 1, 1, 1, 1, 1,
-1.075834, -1.003379, -3.391223, 1, 1, 1, 1, 1,
-1.07489, -0.03655198, -2.696024, 0, 0, 1, 1, 1,
-1.074211, -0.9489978, -2.319222, 1, 0, 0, 1, 1,
-1.068821, 0.6894133, -0.3871872, 1, 0, 0, 1, 1,
-1.06458, 1.386784, 1.441622, 1, 0, 0, 1, 1,
-1.062726, 0.3959424, -1.907152, 1, 0, 0, 1, 1,
-1.0622, -0.06168119, -0.722238, 1, 0, 0, 1, 1,
-1.058449, 1.604746, -0.1532866, 0, 0, 0, 1, 1,
-1.053183, -0.2548026, -0.6503869, 0, 0, 0, 1, 1,
-1.048211, -0.7890843, -2.873098, 0, 0, 0, 1, 1,
-1.043603, 0.7570439, -0.5163742, 0, 0, 0, 1, 1,
-1.0424, 0.3946708, 0.01321862, 0, 0, 0, 1, 1,
-1.041053, 0.1613376, -0.7004496, 0, 0, 0, 1, 1,
-1.039316, 0.9455235, -1.543201, 0, 0, 0, 1, 1,
-1.037326, 0.4608083, -1.222853, 1, 1, 1, 1, 1,
-1.036053, 2.173732, -0.3440488, 1, 1, 1, 1, 1,
-1.032172, 1.021058, -0.309189, 1, 1, 1, 1, 1,
-1.022741, 0.05102012, -0.2023166, 1, 1, 1, 1, 1,
-1.01502, 0.9036132, -0.6060365, 1, 1, 1, 1, 1,
-1.011994, -1.158971, -1.41387, 1, 1, 1, 1, 1,
-1.011472, -0.2032576, -0.956724, 1, 1, 1, 1, 1,
-1.011021, -0.06448077, -2.144628, 1, 1, 1, 1, 1,
-0.9970201, -2.063516, -0.9999341, 1, 1, 1, 1, 1,
-0.9857305, 1.745588, -1.581365, 1, 1, 1, 1, 1,
-0.9831179, -0.4551242, -2.40907, 1, 1, 1, 1, 1,
-0.9820754, -0.1551048, -2.236804, 1, 1, 1, 1, 1,
-0.9816113, -2.018306, -4.223917, 1, 1, 1, 1, 1,
-0.9789199, -0.8760641, -2.042545, 1, 1, 1, 1, 1,
-0.9746436, 1.2128, -1.80487, 1, 1, 1, 1, 1,
-0.9742764, 2.374326, -0.6532915, 0, 0, 1, 1, 1,
-0.9740714, -1.467934, -2.653664, 1, 0, 0, 1, 1,
-0.9709012, 0.3453811, -2.065792, 1, 0, 0, 1, 1,
-0.9565135, -0.4253388, -4.630816, 1, 0, 0, 1, 1,
-0.9551104, -1.214972, -3.777726, 1, 0, 0, 1, 1,
-0.9541236, -0.01193141, -0.5014863, 1, 0, 0, 1, 1,
-0.946723, -1.903722, -3.282354, 0, 0, 0, 1, 1,
-0.9391821, 0.2858961, -1.93826, 0, 0, 0, 1, 1,
-0.9360696, -0.1518855, -1.434625, 0, 0, 0, 1, 1,
-0.929188, -0.7480792, -1.228689, 0, 0, 0, 1, 1,
-0.9278833, -0.2748876, -1.241601, 0, 0, 0, 1, 1,
-0.926345, -0.605651, -1.418125, 0, 0, 0, 1, 1,
-0.9248081, -0.3023108, -2.384474, 0, 0, 0, 1, 1,
-0.9238694, -0.4403781, -1.702596, 1, 1, 1, 1, 1,
-0.9219586, -0.4032792, -2.364259, 1, 1, 1, 1, 1,
-0.9172433, 0.3425579, -0.8303021, 1, 1, 1, 1, 1,
-0.9167644, -0.5349855, -2.456024, 1, 1, 1, 1, 1,
-0.9117674, -1.299294, -2.293729, 1, 1, 1, 1, 1,
-0.9101864, -1.203613, -2.999727, 1, 1, 1, 1, 1,
-0.9074351, -0.9919959, -1.938091, 1, 1, 1, 1, 1,
-0.9045942, 1.277335, -2.166444, 1, 1, 1, 1, 1,
-0.9030563, -1.550198, -2.487697, 1, 1, 1, 1, 1,
-0.8983921, -0.03037697, -2.646744, 1, 1, 1, 1, 1,
-0.8849881, 0.5034945, -1.130234, 1, 1, 1, 1, 1,
-0.880627, -1.467394, -2.763877, 1, 1, 1, 1, 1,
-0.8799875, 0.9994677, -0.4955295, 1, 1, 1, 1, 1,
-0.876811, 0.7670082, -1.324948, 1, 1, 1, 1, 1,
-0.8724976, -2.051317, -4.17916, 1, 1, 1, 1, 1,
-0.8714293, 0.1421461, -0.1881766, 0, 0, 1, 1, 1,
-0.8705668, 0.4393427, -0.318301, 1, 0, 0, 1, 1,
-0.8589594, 1.367145, -0.7932855, 1, 0, 0, 1, 1,
-0.8512969, -0.6038274, -2.561811, 1, 0, 0, 1, 1,
-0.8479877, 0.828768, -1.816749, 1, 0, 0, 1, 1,
-0.8458874, 0.05043164, -1.392513, 1, 0, 0, 1, 1,
-0.8355067, 0.4430356, -2.559699, 0, 0, 0, 1, 1,
-0.83507, 0.669444, -0.2440343, 0, 0, 0, 1, 1,
-0.8342265, 1.21265, -0.2087841, 0, 0, 0, 1, 1,
-0.8342166, 1.953136, 1.068981, 0, 0, 0, 1, 1,
-0.8341694, -1.186935, -2.977289, 0, 0, 0, 1, 1,
-0.8326345, 0.0434396, -2.210233, 0, 0, 0, 1, 1,
-0.8153435, 0.9446478, -1.173426, 0, 0, 0, 1, 1,
-0.8139077, 0.7944994, -0.508739, 1, 1, 1, 1, 1,
-0.8094809, -0.1228987, -0.7952479, 1, 1, 1, 1, 1,
-0.8083168, 0.421778, -2.073435, 1, 1, 1, 1, 1,
-0.8018342, -0.4895787, -3.216114, 1, 1, 1, 1, 1,
-0.8011029, -1.340223, -4.008504, 1, 1, 1, 1, 1,
-0.8004945, 0.04843896, -1.156687, 1, 1, 1, 1, 1,
-0.7994884, -0.1984192, -1.249322, 1, 1, 1, 1, 1,
-0.7957585, 0.2211229, 1.030713, 1, 1, 1, 1, 1,
-0.7945114, -0.2867434, -0.4188315, 1, 1, 1, 1, 1,
-0.7714123, -0.3596858, -3.427666, 1, 1, 1, 1, 1,
-0.7708243, -0.1284931, -3.026744, 1, 1, 1, 1, 1,
-0.7698395, -0.2471841, 0.3540042, 1, 1, 1, 1, 1,
-0.7624806, -0.2180593, -2.459357, 1, 1, 1, 1, 1,
-0.7574123, -0.2953438, -1.07291, 1, 1, 1, 1, 1,
-0.7572431, 0.1529169, -0.4489115, 1, 1, 1, 1, 1,
-0.7571848, 0.008280117, -2.024801, 0, 0, 1, 1, 1,
-0.7485716, -1.055249, -0.4663716, 1, 0, 0, 1, 1,
-0.744302, -1.73799, -1.939124, 1, 0, 0, 1, 1,
-0.7432486, 0.5259341, -0.5907038, 1, 0, 0, 1, 1,
-0.7419512, -2.935034, -3.883542, 1, 0, 0, 1, 1,
-0.7411702, -0.2920383, -0.7705243, 1, 0, 0, 1, 1,
-0.7340511, 0.2252567, -1.772171, 0, 0, 0, 1, 1,
-0.7322131, 0.4374184, -1.685036, 0, 0, 0, 1, 1,
-0.7284361, -0.7644012, -2.052197, 0, 0, 0, 1, 1,
-0.7280913, 0.05836803, 0.07837576, 0, 0, 0, 1, 1,
-0.7279301, -1.062566, -4.28103, 0, 0, 0, 1, 1,
-0.7259851, 1.004951, -0.5662329, 0, 0, 0, 1, 1,
-0.7235461, -0.857588, -2.806995, 0, 0, 0, 1, 1,
-0.7197202, -0.03518379, -1.446631, 1, 1, 1, 1, 1,
-0.7171215, -0.5840423, -2.489981, 1, 1, 1, 1, 1,
-0.7111626, -0.02582435, -1.966264, 1, 1, 1, 1, 1,
-0.7105684, 0.6431639, -1.862178, 1, 1, 1, 1, 1,
-0.7084071, -1.02077, -4.051659, 1, 1, 1, 1, 1,
-0.7062365, -0.8440344, -1.991064, 1, 1, 1, 1, 1,
-0.7025062, -0.7871285, -0.2149522, 1, 1, 1, 1, 1,
-0.7002987, 1.000085, -0.5782339, 1, 1, 1, 1, 1,
-0.6995146, 2.259253, -0.9677756, 1, 1, 1, 1, 1,
-0.6975037, -0.4217171, -1.644206, 1, 1, 1, 1, 1,
-0.6944561, -0.5922828, -3.053808, 1, 1, 1, 1, 1,
-0.6944295, 0.3202442, -2.190555, 1, 1, 1, 1, 1,
-0.6909516, -1.259289, -4.005033, 1, 1, 1, 1, 1,
-0.689172, 0.6272178, 0.6499698, 1, 1, 1, 1, 1,
-0.6834724, -0.8510036, -0.7993661, 1, 1, 1, 1, 1,
-0.6800169, -0.5509556, -1.65261, 0, 0, 1, 1, 1,
-0.6756348, -0.3634221, -2.907595, 1, 0, 0, 1, 1,
-0.6682485, 1.256082, 0.2933201, 1, 0, 0, 1, 1,
-0.6667145, 2.031219, -0.2169203, 1, 0, 0, 1, 1,
-0.6607539, -2.218966, -2.05997, 1, 0, 0, 1, 1,
-0.6582728, 0.2622744, -3.332706, 1, 0, 0, 1, 1,
-0.655176, -0.8067861, -3.216353, 0, 0, 0, 1, 1,
-0.6537184, -0.2722679, -0.9496593, 0, 0, 0, 1, 1,
-0.6533293, 1.799633, -0.5116054, 0, 0, 0, 1, 1,
-0.6496804, -0.7208919, -2.658886, 0, 0, 0, 1, 1,
-0.6473658, 0.687767, -1.401431, 0, 0, 0, 1, 1,
-0.6472901, -1.459592, -2.753075, 0, 0, 0, 1, 1,
-0.6466464, 0.4479497, -0.5123736, 0, 0, 0, 1, 1,
-0.640706, 1.765469, -0.4149337, 1, 1, 1, 1, 1,
-0.6381178, 1.105462, 0.1383364, 1, 1, 1, 1, 1,
-0.635322, -0.34705, -3.968628, 1, 1, 1, 1, 1,
-0.6345139, 0.5556523, -0.8643044, 1, 1, 1, 1, 1,
-0.6333781, -0.455969, -3.047546, 1, 1, 1, 1, 1,
-0.6289158, -0.3619332, -1.819721, 1, 1, 1, 1, 1,
-0.6229869, -0.4781854, 0.09082472, 1, 1, 1, 1, 1,
-0.6138633, -0.3230781, -1.619473, 1, 1, 1, 1, 1,
-0.6121475, -1.156547, -2.451634, 1, 1, 1, 1, 1,
-0.6096418, -0.7029193, -3.683691, 1, 1, 1, 1, 1,
-0.6084993, 0.691511, -0.4212366, 1, 1, 1, 1, 1,
-0.6045212, 0.8692423, 1.092578, 1, 1, 1, 1, 1,
-0.601419, -0.7901587, -1.611328, 1, 1, 1, 1, 1,
-0.5991732, -0.5805815, -3.636692, 1, 1, 1, 1, 1,
-0.5982471, -0.3861887, -2.400205, 1, 1, 1, 1, 1,
-0.5950276, 1.174989, -1.228075, 0, 0, 1, 1, 1,
-0.5932583, 1.190411, -0.8387592, 1, 0, 0, 1, 1,
-0.5843191, 0.2345981, 0.4533425, 1, 0, 0, 1, 1,
-0.584208, -0.7022499, -2.072682, 1, 0, 0, 1, 1,
-0.5831848, 0.1737725, -1.136771, 1, 0, 0, 1, 1,
-0.5805599, -0.5024576, -3.360911, 1, 0, 0, 1, 1,
-0.5787612, 0.5173991, 0.6096413, 0, 0, 0, 1, 1,
-0.5757034, -0.9672931, -5.060423, 0, 0, 0, 1, 1,
-0.5738817, -1.433178, -4.019347, 0, 0, 0, 1, 1,
-0.5734074, 1.020754, -0.9567354, 0, 0, 0, 1, 1,
-0.5698723, -2.031024, -2.264024, 0, 0, 0, 1, 1,
-0.5690497, 0.6517845, -1.71452, 0, 0, 0, 1, 1,
-0.568835, 0.934494, -0.2785081, 0, 0, 0, 1, 1,
-0.5586723, -0.01494822, -1.808099, 1, 1, 1, 1, 1,
-0.5555822, -0.8539866, -2.510325, 1, 1, 1, 1, 1,
-0.5532954, 0.8958112, -2.312637, 1, 1, 1, 1, 1,
-0.5446504, -0.8833201, -0.4186911, 1, 1, 1, 1, 1,
-0.5445158, 0.2995598, -0.8390145, 1, 1, 1, 1, 1,
-0.5414311, -0.1001685, -2.171629, 1, 1, 1, 1, 1,
-0.5382888, 0.03874191, -4.994837, 1, 1, 1, 1, 1,
-0.5340919, 0.6965548, -0.2764551, 1, 1, 1, 1, 1,
-0.5319706, 0.002442078, -3.393129, 1, 1, 1, 1, 1,
-0.5291311, -0.1368584, -0.9555089, 1, 1, 1, 1, 1,
-0.5285568, -1.913229, -2.611602, 1, 1, 1, 1, 1,
-0.5282243, -0.2669097, -1.025854, 1, 1, 1, 1, 1,
-0.5280383, -0.07381392, -1.522406, 1, 1, 1, 1, 1,
-0.5246669, -0.6308445, -4.349086, 1, 1, 1, 1, 1,
-0.5236599, 0.235094, -0.895476, 1, 1, 1, 1, 1,
-0.5201678, 1.608642, 0.06368962, 0, 0, 1, 1, 1,
-0.5182049, 0.2912228, -0.9408711, 1, 0, 0, 1, 1,
-0.5152023, -0.09655829, -1.763843, 1, 0, 0, 1, 1,
-0.5130813, 0.7406291, 0.1707541, 1, 0, 0, 1, 1,
-0.5102298, 0.4406916, -0.853799, 1, 0, 0, 1, 1,
-0.5073258, 0.4632217, -1.059064, 1, 0, 0, 1, 1,
-0.5055773, 1.01233, 0.2008627, 0, 0, 0, 1, 1,
-0.503891, 0.2245728, -1.000048, 0, 0, 0, 1, 1,
-0.5013781, 1.770203, 0.5900664, 0, 0, 0, 1, 1,
-0.4995729, -0.4971302, -2.811162, 0, 0, 0, 1, 1,
-0.498809, -0.8573428, -3.658561, 0, 0, 0, 1, 1,
-0.4969684, 0.07427525, -2.002998, 0, 0, 0, 1, 1,
-0.4927798, 0.6262909, -0.4172052, 0, 0, 0, 1, 1,
-0.4857646, -0.4080793, -0.9014362, 1, 1, 1, 1, 1,
-0.4830528, 1.89513, 0.8995763, 1, 1, 1, 1, 1,
-0.4798287, 0.2435006, -1.379937, 1, 1, 1, 1, 1,
-0.4796103, -0.1071039, -0.8829114, 1, 1, 1, 1, 1,
-0.4758819, -0.6331275, -2.393126, 1, 1, 1, 1, 1,
-0.4738752, -0.7346173, -2.776006, 1, 1, 1, 1, 1,
-0.473457, -0.3422216, -2.377217, 1, 1, 1, 1, 1,
-0.4697549, 1.83304, -0.9639934, 1, 1, 1, 1, 1,
-0.466107, 1.994308, 0.3383334, 1, 1, 1, 1, 1,
-0.4567055, -0.9332722, -2.260194, 1, 1, 1, 1, 1,
-0.4560868, 0.4868731, 0.5355422, 1, 1, 1, 1, 1,
-0.4537677, -0.1130631, -2.58374, 1, 1, 1, 1, 1,
-0.4526051, 0.6208598, -1.234757, 1, 1, 1, 1, 1,
-0.4482268, -1.016161, -2.279178, 1, 1, 1, 1, 1,
-0.4376796, -1.061595, -1.625631, 1, 1, 1, 1, 1,
-0.435858, 0.5513918, -0.4277256, 0, 0, 1, 1, 1,
-0.4357933, -0.1934455, -2.985807, 1, 0, 0, 1, 1,
-0.4353295, -0.2938804, -2.734812, 1, 0, 0, 1, 1,
-0.4352221, 1.875898, -1.206382, 1, 0, 0, 1, 1,
-0.4347501, -1.825293, -2.29032, 1, 0, 0, 1, 1,
-0.4330936, 0.4742936, -0.9845098, 1, 0, 0, 1, 1,
-0.4307818, -0.08507149, -1.953517, 0, 0, 0, 1, 1,
-0.4299192, -0.08727904, -2.436364, 0, 0, 0, 1, 1,
-0.429697, 0.3571601, -1.079142, 0, 0, 0, 1, 1,
-0.4289432, 0.6133658, -2.062631, 0, 0, 0, 1, 1,
-0.4259104, 1.081789, -1.524865, 0, 0, 0, 1, 1,
-0.4228819, -0.931406, -0.8464372, 0, 0, 0, 1, 1,
-0.421811, 0.8425266, -0.3175888, 0, 0, 0, 1, 1,
-0.4217295, 0.7098482, 1.935711, 1, 1, 1, 1, 1,
-0.4147282, -1.87116, -3.722082, 1, 1, 1, 1, 1,
-0.4135829, 0.181396, -0.1784203, 1, 1, 1, 1, 1,
-0.4127697, -1.214925, -4.017169, 1, 1, 1, 1, 1,
-0.4099565, -1.543715, -2.561371, 1, 1, 1, 1, 1,
-0.4052572, 0.07107707, -0.09384721, 1, 1, 1, 1, 1,
-0.4037091, 0.01651087, -1.53972, 1, 1, 1, 1, 1,
-0.4023623, 0.8613062, 0.3961436, 1, 1, 1, 1, 1,
-0.3979754, -0.07871269, -2.682392, 1, 1, 1, 1, 1,
-0.3899308, 0.7571505, 1.084234, 1, 1, 1, 1, 1,
-0.3885277, 0.3662616, 0.07626638, 1, 1, 1, 1, 1,
-0.3831067, 2.348676, -2.149261, 1, 1, 1, 1, 1,
-0.3826319, -0.4583205, -3.216663, 1, 1, 1, 1, 1,
-0.3807307, 1.617817, -1.776978, 1, 1, 1, 1, 1,
-0.3806891, 0.4649791, 0.7423325, 1, 1, 1, 1, 1,
-0.3775792, -0.2988386, -1.430316, 0, 0, 1, 1, 1,
-0.3773206, 1.626884, 0.04387367, 1, 0, 0, 1, 1,
-0.3753355, -1.093975, -3.79359, 1, 0, 0, 1, 1,
-0.3742727, 0.5562663, 1.492153, 1, 0, 0, 1, 1,
-0.3730484, 3.35028, 1.338637, 1, 0, 0, 1, 1,
-0.3729602, 1.70041, -1.100459, 1, 0, 0, 1, 1,
-0.3727176, -1.136173, -1.423923, 0, 0, 0, 1, 1,
-0.3684205, -0.5371043, -3.141008, 0, 0, 0, 1, 1,
-0.3620802, -0.3806677, -3.261706, 0, 0, 0, 1, 1,
-0.3554547, 1.158827, 1.17819, 0, 0, 0, 1, 1,
-0.3550901, 0.672582, -0.7331274, 0, 0, 0, 1, 1,
-0.3543527, -0.8246082, -3.70136, 0, 0, 0, 1, 1,
-0.3478329, -1.389609, -2.629926, 0, 0, 0, 1, 1,
-0.337973, 0.4288928, -1.36016, 1, 1, 1, 1, 1,
-0.336153, -0.07674152, -2.002266, 1, 1, 1, 1, 1,
-0.3355133, 0.9286214, -0.1124319, 1, 1, 1, 1, 1,
-0.3328077, 1.455759, 2.399424, 1, 1, 1, 1, 1,
-0.3282572, 0.5437531, 0.7786567, 1, 1, 1, 1, 1,
-0.3272611, 0.04753879, -0.708635, 1, 1, 1, 1, 1,
-0.3265988, -0.5852919, -2.108521, 1, 1, 1, 1, 1,
-0.3241628, 0.2916364, -1.389389, 1, 1, 1, 1, 1,
-0.3213441, -0.3155949, -2.604522, 1, 1, 1, 1, 1,
-0.3194461, -0.8971841, -3.279217, 1, 1, 1, 1, 1,
-0.3191461, 0.6622224, 0.2846313, 1, 1, 1, 1, 1,
-0.3158411, 1.323643, -1.520315, 1, 1, 1, 1, 1,
-0.3075453, 0.9665333, -0.7450271, 1, 1, 1, 1, 1,
-0.3072281, 0.5683854, -0.598106, 1, 1, 1, 1, 1,
-0.3070684, -1.313462, -3.790861, 1, 1, 1, 1, 1,
-0.3068446, 0.7877146, -0.07081422, 0, 0, 1, 1, 1,
-0.3055558, -1.330808, -3.092351, 1, 0, 0, 1, 1,
-0.3052799, -0.3434373, -2.705769, 1, 0, 0, 1, 1,
-0.3013537, -0.5385337, -0.9442231, 1, 0, 0, 1, 1,
-0.2999125, -1.35956, -3.979913, 1, 0, 0, 1, 1,
-0.2959586, -0.5908189, -2.880581, 1, 0, 0, 1, 1,
-0.2922847, -0.5303614, -1.594859, 0, 0, 0, 1, 1,
-0.2916323, 0.1396699, -0.8196407, 0, 0, 0, 1, 1,
-0.2877309, 0.9415207, 0.3031016, 0, 0, 0, 1, 1,
-0.2877274, -1.022369, -1.361998, 0, 0, 0, 1, 1,
-0.2819703, -1.298203, -4.261288, 0, 0, 0, 1, 1,
-0.2818765, 1.290957, 0.3775057, 0, 0, 0, 1, 1,
-0.2807611, 0.9897454, -0.6136743, 0, 0, 0, 1, 1,
-0.2798033, -1.198061, -2.192849, 1, 1, 1, 1, 1,
-0.2781515, -1.209669, -3.200822, 1, 1, 1, 1, 1,
-0.2713775, 1.231076, -0.1966026, 1, 1, 1, 1, 1,
-0.270428, 0.4412919, 0.3676982, 1, 1, 1, 1, 1,
-0.2677914, -0.4068046, -2.457194, 1, 1, 1, 1, 1,
-0.2649775, -0.06632022, -1.654, 1, 1, 1, 1, 1,
-0.2644947, 0.6478766, -0.002928043, 1, 1, 1, 1, 1,
-0.2627762, -0.6365638, -2.629329, 1, 1, 1, 1, 1,
-0.260101, -0.07114305, -2.398442, 1, 1, 1, 1, 1,
-0.2544086, -0.9952813, -1.387769, 1, 1, 1, 1, 1,
-0.2519462, -0.6085253, -3.76904, 1, 1, 1, 1, 1,
-0.2504655, -1.566678, -2.997763, 1, 1, 1, 1, 1,
-0.2449834, 0.1745675, -2.30807, 1, 1, 1, 1, 1,
-0.2397753, 0.3293146, -1.153427, 1, 1, 1, 1, 1,
-0.2336174, 0.2480978, -2.256429, 1, 1, 1, 1, 1,
-0.2212438, -0.02567175, -1.529644, 0, 0, 1, 1, 1,
-0.2169022, -0.7484969, -2.813533, 1, 0, 0, 1, 1,
-0.2106709, 0.9662607, -0.1269593, 1, 0, 0, 1, 1,
-0.2032588, -1.114119, -4.007768, 1, 0, 0, 1, 1,
-0.2021783, 1.174346, -1.366998, 1, 0, 0, 1, 1,
-0.2021211, 0.614882, 0.1082043, 1, 0, 0, 1, 1,
-0.2011478, -0.2085303, -1.895074, 0, 0, 0, 1, 1,
-0.1962478, -0.6153579, -2.181492, 0, 0, 0, 1, 1,
-0.1927266, 1.517897, -0.3287517, 0, 0, 0, 1, 1,
-0.188866, 0.2734441, -0.05251952, 0, 0, 0, 1, 1,
-0.1858018, 2.542637, -0.4620279, 0, 0, 0, 1, 1,
-0.1834499, 0.355409, -0.7354046, 0, 0, 0, 1, 1,
-0.1804556, -1.332549, -3.776796, 0, 0, 0, 1, 1,
-0.1797141, -1.198868, -1.718165, 1, 1, 1, 1, 1,
-0.1782576, -0.5309995, -4.835985, 1, 1, 1, 1, 1,
-0.1715132, -1.628036, -1.988316, 1, 1, 1, 1, 1,
-0.1702333, 0.5344102, -0.4341411, 1, 1, 1, 1, 1,
-0.1690541, 0.4369744, -1.048051, 1, 1, 1, 1, 1,
-0.1655685, -0.7439602, -3.675869, 1, 1, 1, 1, 1,
-0.1622326, -0.1209965, -3.107102, 1, 1, 1, 1, 1,
-0.1615043, -0.5369036, -2.101365, 1, 1, 1, 1, 1,
-0.1609568, -0.9474499, -1.77327, 1, 1, 1, 1, 1,
-0.1551839, -1.078902, -3.714056, 1, 1, 1, 1, 1,
-0.1528693, -0.4606127, -4.558394, 1, 1, 1, 1, 1,
-0.1508864, -0.2932152, -1.30511, 1, 1, 1, 1, 1,
-0.1479561, 1.132214, 1.396783, 1, 1, 1, 1, 1,
-0.1478407, 0.188699, -0.6054884, 1, 1, 1, 1, 1,
-0.1471329, 0.08137639, -0.3818035, 1, 1, 1, 1, 1,
-0.1470431, 1.359633, -1.217513, 0, 0, 1, 1, 1,
-0.1464497, 1.444201, -0.7180068, 1, 0, 0, 1, 1,
-0.1451521, -0.2950939, -1.138134, 1, 0, 0, 1, 1,
-0.1446447, 0.4595494, -0.8475027, 1, 0, 0, 1, 1,
-0.1426192, -0.2803258, -2.06763, 1, 0, 0, 1, 1,
-0.1382584, 0.6097825, -0.07856098, 1, 0, 0, 1, 1,
-0.1322131, -0.2284895, -3.180151, 0, 0, 0, 1, 1,
-0.1320626, 1.494592, 0.5432056, 0, 0, 0, 1, 1,
-0.131315, 0.1097426, -1.188088, 0, 0, 0, 1, 1,
-0.1226206, 0.5524827, 0.1599407, 0, 0, 0, 1, 1,
-0.1212678, 0.6690099, 0.06924707, 0, 0, 0, 1, 1,
-0.1170047, -1.203413, -3.354955, 0, 0, 0, 1, 1,
-0.1160029, 0.821715, -1.604562, 0, 0, 0, 1, 1,
-0.1129718, -0.7997066, -1.751459, 1, 1, 1, 1, 1,
-0.1126301, -1.671183, -3.173311, 1, 1, 1, 1, 1,
-0.1082719, -0.04534507, -2.063558, 1, 1, 1, 1, 1,
-0.1054244, 0.1062219, -0.78352, 1, 1, 1, 1, 1,
-0.1012141, -1.267166, -3.012336, 1, 1, 1, 1, 1,
-0.09506603, 0.3814929, 1.207783, 1, 1, 1, 1, 1,
-0.09278242, -1.502651, -2.695016, 1, 1, 1, 1, 1,
-0.09055287, 0.9730504, 1.614586, 1, 1, 1, 1, 1,
-0.08848358, -0.6524789, -2.265981, 1, 1, 1, 1, 1,
-0.08806401, -0.1806339, -1.205348, 1, 1, 1, 1, 1,
-0.08708295, -1.362313, -2.822691, 1, 1, 1, 1, 1,
-0.08597806, 0.7340755, 1.458742, 1, 1, 1, 1, 1,
-0.08550374, 0.006960243, 1.022598, 1, 1, 1, 1, 1,
-0.08298286, -0.6305814, -3.216657, 1, 1, 1, 1, 1,
-0.08076961, 0.158508, -0.1758274, 1, 1, 1, 1, 1,
-0.07942498, 0.6130308, 0.5357152, 0, 0, 1, 1, 1,
-0.07543056, -1.081127, -2.397226, 1, 0, 0, 1, 1,
-0.07395548, -0.1571973, -3.13491, 1, 0, 0, 1, 1,
-0.07269856, 0.8299657, -0.1958543, 1, 0, 0, 1, 1,
-0.07098243, -0.9985911, -2.831272, 1, 0, 0, 1, 1,
-0.06827945, -0.4127213, -1.264322, 1, 0, 0, 1, 1,
-0.06502251, -1.632211, -1.943943, 0, 0, 0, 1, 1,
-0.06336953, 0.9130884, -0.6927642, 0, 0, 0, 1, 1,
-0.06201632, 1.115142, -0.7060208, 0, 0, 0, 1, 1,
-0.06162335, -0.7236243, -4.855198, 0, 0, 0, 1, 1,
-0.06150837, 0.1346441, -0.4875858, 0, 0, 0, 1, 1,
-0.05790899, -0.6058412, -4.806271, 0, 0, 0, 1, 1,
-0.05703524, 1.520704, 0.9657504, 0, 0, 0, 1, 1,
-0.05604586, -0.4562167, -2.1326, 1, 1, 1, 1, 1,
-0.05342982, 1.335833, -0.6202293, 1, 1, 1, 1, 1,
-0.04926123, 1.286703, 0.3460203, 1, 1, 1, 1, 1,
-0.04204939, 0.5449997, 0.6670426, 1, 1, 1, 1, 1,
-0.03613487, 2.124178, 2.215625, 1, 1, 1, 1, 1,
-0.03458533, -0.7997369, -2.104412, 1, 1, 1, 1, 1,
-0.02628677, -0.7462891, -3.029488, 1, 1, 1, 1, 1,
-0.0244041, 1.460574, -0.9741118, 1, 1, 1, 1, 1,
-0.02071143, 2.296365, -0.3562304, 1, 1, 1, 1, 1,
-0.02017122, -1.02257, -2.552545, 1, 1, 1, 1, 1,
-0.0196962, 1.394769, -1.888133, 1, 1, 1, 1, 1,
-0.0180127, 0.6007488, 0.6575705, 1, 1, 1, 1, 1,
-0.01662386, -1.053545, -2.906408, 1, 1, 1, 1, 1,
-0.01195584, -0.7963906, -3.5875, 1, 1, 1, 1, 1,
-0.007370062, 0.4023796, -0.8819532, 1, 1, 1, 1, 1,
-0.005634271, -1.878272, -2.689761, 0, 0, 1, 1, 1,
-0.003765495, 0.9913745, 0.8895407, 1, 0, 0, 1, 1,
-0.002376647, 0.03378116, -0.2335148, 1, 0, 0, 1, 1,
-0.001697842, 0.5874936, -0.7699804, 1, 0, 0, 1, 1,
0.004057203, 0.1551382, -0.9762079, 1, 0, 0, 1, 1,
0.004896777, 0.05919453, 0.905121, 1, 0, 0, 1, 1,
0.005182905, 0.1556653, 0.824867, 0, 0, 0, 1, 1,
0.008833836, -1.516151, 4.135106, 0, 0, 0, 1, 1,
0.009586954, 0.9656678, -0.1836417, 0, 0, 0, 1, 1,
0.01021185, 0.4520955, 0.1964228, 0, 0, 0, 1, 1,
0.01440993, 0.8108319, -0.08240126, 0, 0, 0, 1, 1,
0.01961495, -0.1667341, 2.816826, 0, 0, 0, 1, 1,
0.02110726, 0.4712304, -0.6462296, 0, 0, 0, 1, 1,
0.02179027, 0.8732972, -0.1660353, 1, 1, 1, 1, 1,
0.02554535, 0.3984166, 0.6984419, 1, 1, 1, 1, 1,
0.02718964, -1.783442, 2.954832, 1, 1, 1, 1, 1,
0.02737334, 0.1518893, -0.3783871, 1, 1, 1, 1, 1,
0.03174758, 1.193915, 0.9163211, 1, 1, 1, 1, 1,
0.03189613, 0.658398, 0.8502634, 1, 1, 1, 1, 1,
0.0319976, -1.331066, 3.030764, 1, 1, 1, 1, 1,
0.03242772, -0.3404932, 3.086522, 1, 1, 1, 1, 1,
0.03300161, 1.533195, -0.02327145, 1, 1, 1, 1, 1,
0.03355321, 0.9136558, 0.5666842, 1, 1, 1, 1, 1,
0.03716265, 1.064767, 0.2232976, 1, 1, 1, 1, 1,
0.04459416, 0.3475973, 0.4580455, 1, 1, 1, 1, 1,
0.04494804, -1.637804, 3.857102, 1, 1, 1, 1, 1,
0.0478301, -1.222586, 3.737335, 1, 1, 1, 1, 1,
0.05038108, -0.7340796, 4.20447, 1, 1, 1, 1, 1,
0.05085874, -0.4697988, 4.118773, 0, 0, 1, 1, 1,
0.05366549, 0.7595128, 0.382894, 1, 0, 0, 1, 1,
0.05372504, -0.1196456, 2.112175, 1, 0, 0, 1, 1,
0.05878562, 0.2911573, 0.8297933, 1, 0, 0, 1, 1,
0.06020586, -2.811862, 2.608274, 1, 0, 0, 1, 1,
0.06073665, 0.5100163, 1.833851, 1, 0, 0, 1, 1,
0.060823, 0.6894956, 0.8140855, 0, 0, 0, 1, 1,
0.0627241, -0.8769143, 4.135004, 0, 0, 0, 1, 1,
0.06381238, 0.2282432, 0.4967963, 0, 0, 0, 1, 1,
0.06653795, 0.1431757, 1.170019, 0, 0, 0, 1, 1,
0.07114773, -0.3214008, 4.769571, 0, 0, 0, 1, 1,
0.07277958, -1.372068, 3.076606, 0, 0, 0, 1, 1,
0.0731158, 1.356791, -2.14376, 0, 0, 0, 1, 1,
0.07391241, -0.2840546, 3.713233, 1, 1, 1, 1, 1,
0.0799695, 1.498157, 2.248838, 1, 1, 1, 1, 1,
0.08104204, -0.03564535, 0.9411598, 1, 1, 1, 1, 1,
0.08425104, -1.222486, 3.022939, 1, 1, 1, 1, 1,
0.0886295, -0.4080984, 2.422134, 1, 1, 1, 1, 1,
0.08983514, -0.01604488, 1.827678, 1, 1, 1, 1, 1,
0.0902152, -0.3360646, 1.294368, 1, 1, 1, 1, 1,
0.09199463, -0.855733, 2.291503, 1, 1, 1, 1, 1,
0.09251354, 1.713163, -1.780135, 1, 1, 1, 1, 1,
0.09290017, -0.3254258, 3.327322, 1, 1, 1, 1, 1,
0.09490945, -0.6026023, 4.808079, 1, 1, 1, 1, 1,
0.09533568, 0.2301577, 0.4873787, 1, 1, 1, 1, 1,
0.09692162, -0.2103937, 3.811457, 1, 1, 1, 1, 1,
0.09803452, 1.17999, -1.267518, 1, 1, 1, 1, 1,
0.09956154, 0.3005178, 0.8979954, 1, 1, 1, 1, 1,
0.1014044, -0.7317389, 2.300096, 0, 0, 1, 1, 1,
0.1017913, 1.316151, -1.138343, 1, 0, 0, 1, 1,
0.1049603, 0.9281276, 0.7283519, 1, 0, 0, 1, 1,
0.1094929, 2.694871, -0.2389007, 1, 0, 0, 1, 1,
0.114605, 0.3804093, -1.497989, 1, 0, 0, 1, 1,
0.1150448, -2.280881, 4.158516, 1, 0, 0, 1, 1,
0.116967, -0.1070846, 2.769544, 0, 0, 0, 1, 1,
0.1171117, -0.4879676, 2.107693, 0, 0, 0, 1, 1,
0.1193473, -1.266812, 3.92205, 0, 0, 0, 1, 1,
0.1233718, 0.8656582, -0.01226162, 0, 0, 0, 1, 1,
0.1248125, -1.276751, 3.523901, 0, 0, 0, 1, 1,
0.1268757, -0.4083793, 3.253143, 0, 0, 0, 1, 1,
0.1272568, 1.349304, 0.394874, 0, 0, 0, 1, 1,
0.1278841, -0.107519, 3.018561, 1, 1, 1, 1, 1,
0.1287744, -0.742398, 4.115334, 1, 1, 1, 1, 1,
0.1292178, 1.487393, -1.082867, 1, 1, 1, 1, 1,
0.1337208, -0.5116021, 2.156695, 1, 1, 1, 1, 1,
0.1374615, -0.1552738, 4.051515, 1, 1, 1, 1, 1,
0.1389147, 0.9946992, 0.6011724, 1, 1, 1, 1, 1,
0.1408029, 0.03388715, -0.8260804, 1, 1, 1, 1, 1,
0.1416574, -0.9360421, 3.722498, 1, 1, 1, 1, 1,
0.142602, 0.3622032, 1.982105, 1, 1, 1, 1, 1,
0.1440265, -0.1345561, 3.335704, 1, 1, 1, 1, 1,
0.1482783, 0.2974225, 1.960058, 1, 1, 1, 1, 1,
0.1510462, 0.6684501, -0.7508145, 1, 1, 1, 1, 1,
0.1545337, -0.3154084, 0.8374536, 1, 1, 1, 1, 1,
0.1584271, -1.151465, 2.049516, 1, 1, 1, 1, 1,
0.1626433, 0.4619687, -1.253842, 1, 1, 1, 1, 1,
0.1654399, 0.8293933, -0.6110941, 0, 0, 1, 1, 1,
0.16558, -0.789749, 4.31163, 1, 0, 0, 1, 1,
0.1737179, -0.8230439, 2.744311, 1, 0, 0, 1, 1,
0.1754764, 0.02766929, 1.07206, 1, 0, 0, 1, 1,
0.1763709, 0.06081283, 1.574666, 1, 0, 0, 1, 1,
0.1764449, 1.001855, -0.6945829, 1, 0, 0, 1, 1,
0.1765772, -2.439937, 0.7054836, 0, 0, 0, 1, 1,
0.1770634, -1.296802, 3.241064, 0, 0, 0, 1, 1,
0.179125, 0.1966748, 0.6867248, 0, 0, 0, 1, 1,
0.1806407, -1.498916, 3.660494, 0, 0, 0, 1, 1,
0.1815677, -1.029725, 2.833534, 0, 0, 0, 1, 1,
0.1816287, 1.103241, 0.5714799, 0, 0, 0, 1, 1,
0.1817356, 0.1987817, 0.4011994, 0, 0, 0, 1, 1,
0.1823967, 0.1692732, 1.411263, 1, 1, 1, 1, 1,
0.1832456, 1.676611, 1.023094, 1, 1, 1, 1, 1,
0.1892317, 0.9747673, -1.41219, 1, 1, 1, 1, 1,
0.1916819, -0.6437114, 2.659329, 1, 1, 1, 1, 1,
0.1925929, 1.077524, 0.3333127, 1, 1, 1, 1, 1,
0.1928832, -0.5661879, 3.939259, 1, 1, 1, 1, 1,
0.1963249, 1.845184, 0.1562524, 1, 1, 1, 1, 1,
0.2049063, -0.6184632, 3.104623, 1, 1, 1, 1, 1,
0.2054537, -0.4863459, 2.453148, 1, 1, 1, 1, 1,
0.2123337, -0.6679497, 3.164436, 1, 1, 1, 1, 1,
0.212778, 1.112559, 1.073053, 1, 1, 1, 1, 1,
0.2134871, -1.06186, 1.560408, 1, 1, 1, 1, 1,
0.2239605, 0.1194669, 1.859241, 1, 1, 1, 1, 1,
0.2262022, -0.178345, 2.177568, 1, 1, 1, 1, 1,
0.2282305, -0.07770663, 1.600831, 1, 1, 1, 1, 1,
0.2292447, -0.0003606313, 1.320349, 0, 0, 1, 1, 1,
0.2301077, -0.4711083, 1.589649, 1, 0, 0, 1, 1,
0.2388443, 0.868786, 0.8953606, 1, 0, 0, 1, 1,
0.2420626, 1.313674, -0.7787221, 1, 0, 0, 1, 1,
0.2485575, -0.3275492, 1.749723, 1, 0, 0, 1, 1,
0.2491024, 0.2353278, 2.440391, 1, 0, 0, 1, 1,
0.2493348, 0.7608885, -0.2478293, 0, 0, 0, 1, 1,
0.2520826, -1.795128, 2.671779, 0, 0, 0, 1, 1,
0.2654291, 0.3815969, 0.8583244, 0, 0, 0, 1, 1,
0.2658207, 0.306928, 0.9882163, 0, 0, 0, 1, 1,
0.2683683, 0.3623914, 1.178333, 0, 0, 0, 1, 1,
0.27507, 0.6448563, 1.055683, 0, 0, 0, 1, 1,
0.2773266, 1.004354, 1.583711, 0, 0, 0, 1, 1,
0.2831443, -0.3462757, 1.388053, 1, 1, 1, 1, 1,
0.2867084, 0.5971268, 0.8124081, 1, 1, 1, 1, 1,
0.2954674, 1.346625, -0.5682995, 1, 1, 1, 1, 1,
0.3038471, -0.8424152, 1.363362, 1, 1, 1, 1, 1,
0.3044279, -0.02502359, 2.586529, 1, 1, 1, 1, 1,
0.3079843, -0.3838422, 2.934036, 1, 1, 1, 1, 1,
0.3085321, -1.335657, 2.316271, 1, 1, 1, 1, 1,
0.3121552, -2.224344, 5.352365, 1, 1, 1, 1, 1,
0.3202015, -0.3932135, 3.103197, 1, 1, 1, 1, 1,
0.3281357, -0.03044753, 2.245555, 1, 1, 1, 1, 1,
0.3294646, -1.475947, 2.455273, 1, 1, 1, 1, 1,
0.3299674, 1.102616, -0.5360997, 1, 1, 1, 1, 1,
0.3313577, 1.402468, 0.6617852, 1, 1, 1, 1, 1,
0.3354376, -0.1734483, 1.664313, 1, 1, 1, 1, 1,
0.3364059, 0.5545366, 0.6832103, 1, 1, 1, 1, 1,
0.3419761, 0.5635518, 0.5991784, 0, 0, 1, 1, 1,
0.3457485, -0.2584088, 2.302472, 1, 0, 0, 1, 1,
0.3472008, -0.7035677, 2.787907, 1, 0, 0, 1, 1,
0.3472294, -1.599781, 4.184162, 1, 0, 0, 1, 1,
0.3581884, -1.081495, 4.026856, 1, 0, 0, 1, 1,
0.3587998, 0.9690458, -0.08528288, 1, 0, 0, 1, 1,
0.359853, 1.308049, 0.1995232, 0, 0, 0, 1, 1,
0.3693544, 2.042267, 0.3801393, 0, 0, 0, 1, 1,
0.3716174, -2.374923, 4.836373, 0, 0, 0, 1, 1,
0.3723216, 0.6625074, -0.2458237, 0, 0, 0, 1, 1,
0.3726657, -0.1215473, 3.460063, 0, 0, 0, 1, 1,
0.3729471, 0.5027443, -1.350065, 0, 0, 0, 1, 1,
0.3745981, -1.292483, 2.928629, 0, 0, 0, 1, 1,
0.3854309, -1.037231, 2.081155, 1, 1, 1, 1, 1,
0.3861512, -0.3573402, 1.397977, 1, 1, 1, 1, 1,
0.3864006, 0.03247261, 0.9931899, 1, 1, 1, 1, 1,
0.3873095, -0.4728065, 2.469959, 1, 1, 1, 1, 1,
0.3884608, 0.9137793, 1.163017, 1, 1, 1, 1, 1,
0.3889655, 0.2006993, 0.58322, 1, 1, 1, 1, 1,
0.3901495, 0.937445, 0.2750178, 1, 1, 1, 1, 1,
0.3920147, 0.9438756, 0.9305734, 1, 1, 1, 1, 1,
0.392162, -0.2311441, 1.820459, 1, 1, 1, 1, 1,
0.3926431, -0.166007, 1.780654, 1, 1, 1, 1, 1,
0.4004881, 0.7272316, 1.428321, 1, 1, 1, 1, 1,
0.4023842, 1.80143, 2.337991, 1, 1, 1, 1, 1,
0.4044711, -2.451539, 4.596367, 1, 1, 1, 1, 1,
0.4051886, 1.373801, -0.7587852, 1, 1, 1, 1, 1,
0.4063141, 1.852863, 0.8026064, 1, 1, 1, 1, 1,
0.4259982, -1.625611, 4.203897, 0, 0, 1, 1, 1,
0.4266671, 1.14168, 2.242526, 1, 0, 0, 1, 1,
0.4289269, 0.527647, -0.942991, 1, 0, 0, 1, 1,
0.4315327, 0.5926046, 1.203851, 1, 0, 0, 1, 1,
0.4361035, 0.7666876, -0.5711747, 1, 0, 0, 1, 1,
0.4408627, 1.12965, 1.20233, 1, 0, 0, 1, 1,
0.4432727, 0.4353923, 0.9314086, 0, 0, 0, 1, 1,
0.4440975, 2.300643, -0.5785167, 0, 0, 0, 1, 1,
0.4522415, -0.8696833, 3.32164, 0, 0, 0, 1, 1,
0.4532414, 0.7788716, 1.89924, 0, 0, 0, 1, 1,
0.4552045, 1.219006, -1.151961, 0, 0, 0, 1, 1,
0.4552604, 0.8821103, -0.2129122, 0, 0, 0, 1, 1,
0.4571663, 0.6960259, -0.2301708, 0, 0, 0, 1, 1,
0.4693646, 0.9622548, 1.315047, 1, 1, 1, 1, 1,
0.46953, -0.412221, 3.462209, 1, 1, 1, 1, 1,
0.472101, 0.06132746, 1.660153, 1, 1, 1, 1, 1,
0.4741724, -0.6051943, 2.438176, 1, 1, 1, 1, 1,
0.4777162, 1.775092, 1.15874, 1, 1, 1, 1, 1,
0.4790328, 1.644528, -0.1493821, 1, 1, 1, 1, 1,
0.4822695, 0.9134086, 1.596787, 1, 1, 1, 1, 1,
0.4842947, 0.3928318, 0.362273, 1, 1, 1, 1, 1,
0.4887698, 0.5561875, 2.058226, 1, 1, 1, 1, 1,
0.4889627, -0.9883035, 1.794596, 1, 1, 1, 1, 1,
0.4892662, 0.3032332, 2.016678, 1, 1, 1, 1, 1,
0.4898037, -1.891075, 2.734869, 1, 1, 1, 1, 1,
0.4923141, -1.493201, 2.231724, 1, 1, 1, 1, 1,
0.4935985, -0.09098037, 2.794417, 1, 1, 1, 1, 1,
0.4940612, -0.8092228, 0.7591149, 1, 1, 1, 1, 1,
0.4966394, 0.2955766, -0.6838251, 0, 0, 1, 1, 1,
0.4972379, 1.196002, 0.2284485, 1, 0, 0, 1, 1,
0.5006441, -0.3035129, 1.531299, 1, 0, 0, 1, 1,
0.5019695, 1.434326, 0.3476154, 1, 0, 0, 1, 1,
0.5035657, 1.14929, 0.3063618, 1, 0, 0, 1, 1,
0.5056501, 0.2605048, 2.314461, 1, 0, 0, 1, 1,
0.5073357, -0.3931639, 1.701851, 0, 0, 0, 1, 1,
0.5108184, -1.64868, 2.935738, 0, 0, 0, 1, 1,
0.5240901, -1.129619, 2.30385, 0, 0, 0, 1, 1,
0.5275198, -0.8675601, 3.654351, 0, 0, 0, 1, 1,
0.5293261, 0.3797508, 0.4043803, 0, 0, 0, 1, 1,
0.5306445, -0.3762572, 1.909376, 0, 0, 0, 1, 1,
0.5322621, -0.5584396, 1.170659, 0, 0, 0, 1, 1,
0.5349407, -0.6092472, 1.149883, 1, 1, 1, 1, 1,
0.5399156, 0.9952217, 0.03137727, 1, 1, 1, 1, 1,
0.5433715, 0.01175942, 2.672693, 1, 1, 1, 1, 1,
0.5433913, -0.2763728, 3.023024, 1, 1, 1, 1, 1,
0.5449896, 0.3462698, 0.6585535, 1, 1, 1, 1, 1,
0.5460256, -0.960554, 2.251086, 1, 1, 1, 1, 1,
0.5483388, 2.342607, -0.3594621, 1, 1, 1, 1, 1,
0.5531293, -1.778899, 2.331695, 1, 1, 1, 1, 1,
0.5540574, 0.05671513, 0.1566091, 1, 1, 1, 1, 1,
0.5551489, -0.06104716, 2.088598, 1, 1, 1, 1, 1,
0.5615455, 1.419576, 1.519911, 1, 1, 1, 1, 1,
0.5638722, 0.6405933, 0.5019864, 1, 1, 1, 1, 1,
0.5682834, -0.02626708, 1.762995, 1, 1, 1, 1, 1,
0.5695576, 0.6304261, 0.01034584, 1, 1, 1, 1, 1,
0.5741049, -1.131524, 2.767112, 1, 1, 1, 1, 1,
0.5746679, 0.06094741, 1.780759, 0, 0, 1, 1, 1,
0.5793167, 2.071499, -0.8018741, 1, 0, 0, 1, 1,
0.5813205, -0.5024216, 1.018503, 1, 0, 0, 1, 1,
0.5984306, 0.5483045, 0.615776, 1, 0, 0, 1, 1,
0.6062345, -0.2547973, 1.661366, 1, 0, 0, 1, 1,
0.6083083, -1.094996, 1.588502, 1, 0, 0, 1, 1,
0.6103425, 1.42888, 1.69944, 0, 0, 0, 1, 1,
0.6112113, 0.7835684, 0.8013097, 0, 0, 0, 1, 1,
0.6119094, 0.9800419, 1.152563, 0, 0, 0, 1, 1,
0.6128492, 1.576831, 1.172541, 0, 0, 0, 1, 1,
0.6131091, 0.03373898, 0.4149564, 0, 0, 0, 1, 1,
0.6171003, 0.05371167, 1.041477, 0, 0, 0, 1, 1,
0.6191043, 0.3121215, 0.6859394, 0, 0, 0, 1, 1,
0.6210584, 1.902276, 0.6222597, 1, 1, 1, 1, 1,
0.6257676, 1.521255, 1.304193, 1, 1, 1, 1, 1,
0.6313713, -0.8751095, 4.867488, 1, 1, 1, 1, 1,
0.6322718, 1.845683, -0.426553, 1, 1, 1, 1, 1,
0.6327982, 0.6608979, 1.506513, 1, 1, 1, 1, 1,
0.6349702, -0.5192448, 2.055844, 1, 1, 1, 1, 1,
0.6397464, 0.6245987, 0.4251105, 1, 1, 1, 1, 1,
0.6398451, -1.089741, 1.787908, 1, 1, 1, 1, 1,
0.6426781, 0.7985452, 1.137483, 1, 1, 1, 1, 1,
0.6501442, -0.4128548, 1.483795, 1, 1, 1, 1, 1,
0.654726, 0.5362217, -0.8437522, 1, 1, 1, 1, 1,
0.6557618, 1.996655, 1.254667, 1, 1, 1, 1, 1,
0.6566113, -0.3317078, 4.254445, 1, 1, 1, 1, 1,
0.6574885, -0.07825033, 1.975004, 1, 1, 1, 1, 1,
0.6617507, 1.64627, 0.07302411, 1, 1, 1, 1, 1,
0.6622418, 1.735719, 0.5082347, 0, 0, 1, 1, 1,
0.6627121, -0.02165489, 1.669591, 1, 0, 0, 1, 1,
0.6768447, -1.552148, 3.651543, 1, 0, 0, 1, 1,
0.6789691, 2.318412, -0.07797922, 1, 0, 0, 1, 1,
0.6825898, 0.393907, 1.307665, 1, 0, 0, 1, 1,
0.6895991, 0.6881182, 1.6536, 1, 0, 0, 1, 1,
0.6940297, 1.342225, 0.397488, 0, 0, 0, 1, 1,
0.6997606, -1.178812, 1.307422, 0, 0, 0, 1, 1,
0.7083426, -0.2884277, 1.87539, 0, 0, 0, 1, 1,
0.7151813, -0.1770106, 0.6107656, 0, 0, 0, 1, 1,
0.7214658, 0.5801423, 0.1301046, 0, 0, 0, 1, 1,
0.7249495, -1.904343, 3.614453, 0, 0, 0, 1, 1,
0.7254927, -0.5386456, 3.231932, 0, 0, 0, 1, 1,
0.7370677, -1.366523, 2.435704, 1, 1, 1, 1, 1,
0.7380354, -1.367315, 3.379642, 1, 1, 1, 1, 1,
0.7395621, 1.145922, 0.4416755, 1, 1, 1, 1, 1,
0.747192, -0.8721457, 1.678683, 1, 1, 1, 1, 1,
0.7550375, 0.2923273, 1.490208, 1, 1, 1, 1, 1,
0.761288, 0.2311444, 1.286783, 1, 1, 1, 1, 1,
0.7670329, -0.3421544, 2.56702, 1, 1, 1, 1, 1,
0.7689098, -1.315474, 2.970819, 1, 1, 1, 1, 1,
0.7727765, -0.2563973, 1.953181, 1, 1, 1, 1, 1,
0.7729157, 0.8630688, 1.499661, 1, 1, 1, 1, 1,
0.7771706, 0.8329672, 0.1191193, 1, 1, 1, 1, 1,
0.7800314, -1.344368, 3.007428, 1, 1, 1, 1, 1,
0.78096, 0.2406422, -0.2077533, 1, 1, 1, 1, 1,
0.7841244, -0.6542106, 3.010058, 1, 1, 1, 1, 1,
0.7847157, 0.3560934, 2.466622, 1, 1, 1, 1, 1,
0.789171, 0.4240424, 0.6537978, 0, 0, 1, 1, 1,
0.7908327, -0.4604761, 1.037875, 1, 0, 0, 1, 1,
0.7920609, -0.7234297, 3.341014, 1, 0, 0, 1, 1,
0.7924684, -1.048661, 2.930611, 1, 0, 0, 1, 1,
0.7981532, -0.5250189, 2.598556, 1, 0, 0, 1, 1,
0.8087882, 0.4040223, 2.274544, 1, 0, 0, 1, 1,
0.812396, -1.29769, 2.785868, 0, 0, 0, 1, 1,
0.8134237, -0.1118681, 1.986282, 0, 0, 0, 1, 1,
0.821871, -0.6182281, 2.219921, 0, 0, 0, 1, 1,
0.8231014, -0.9096842, 1.725272, 0, 0, 0, 1, 1,
0.8278854, -1.15416, 3.567694, 0, 0, 0, 1, 1,
0.8296704, 0.6308207, -0.3555809, 0, 0, 0, 1, 1,
0.8325901, -1.066077, 2.151095, 0, 0, 0, 1, 1,
0.8399173, -1.119777, 1.723517, 1, 1, 1, 1, 1,
0.8455377, -0.5690678, 2.905665, 1, 1, 1, 1, 1,
0.8500105, -0.2614062, 1.117403, 1, 1, 1, 1, 1,
0.8515053, -0.7192972, 1.826316, 1, 1, 1, 1, 1,
0.8534753, 1.134388, 1.591054, 1, 1, 1, 1, 1,
0.8557472, 0.1885836, 1.469431, 1, 1, 1, 1, 1,
0.8626223, -0.1719938, 1.029367, 1, 1, 1, 1, 1,
0.8691314, -3.165716, 1.067522, 1, 1, 1, 1, 1,
0.8699151, -1.204647, 3.586689, 1, 1, 1, 1, 1,
0.8784059, -1.874976, 3.60461, 1, 1, 1, 1, 1,
0.8805181, 1.040803, 1.431772, 1, 1, 1, 1, 1,
0.8839508, 1.14162, -1.352093, 1, 1, 1, 1, 1,
0.8898523, 1.562841, -0.7107423, 1, 1, 1, 1, 1,
0.8913248, -0.3564167, 3.651453, 1, 1, 1, 1, 1,
0.9053064, -0.7685384, 1.967213, 1, 1, 1, 1, 1,
0.9068678, 1.626635, -0.5460414, 0, 0, 1, 1, 1,
0.9140749, 0.6206959, 2.516216, 1, 0, 0, 1, 1,
0.9141698, -0.1307999, 3.079309, 1, 0, 0, 1, 1,
0.9147236, -0.4360625, 0.5768524, 1, 0, 0, 1, 1,
0.9222516, -0.9120852, 3.373967, 1, 0, 0, 1, 1,
0.9226995, 0.931614, -0.7901544, 1, 0, 0, 1, 1,
0.9238627, 0.8567183, 1.708048, 0, 0, 0, 1, 1,
0.9303952, -1.156603, 2.722828, 0, 0, 0, 1, 1,
0.9319745, -0.9551952, 2.515756, 0, 0, 0, 1, 1,
0.9478176, 0.5512337, 1.731105, 0, 0, 0, 1, 1,
0.9535926, 0.3608909, 1.791021, 0, 0, 0, 1, 1,
0.9537182, -1.453241, 4.024687, 0, 0, 0, 1, 1,
0.9537513, -0.7393845, 0.448148, 0, 0, 0, 1, 1,
0.9554679, -0.4187262, 2.348095, 1, 1, 1, 1, 1,
0.957074, -0.2440059, 1.849261, 1, 1, 1, 1, 1,
0.9611002, -1.562235, 0.896286, 1, 1, 1, 1, 1,
0.9639822, -1.563219, 4.109631, 1, 1, 1, 1, 1,
0.9688587, -0.08081836, 2.160398, 1, 1, 1, 1, 1,
0.9692796, 0.1420208, 1.107121, 1, 1, 1, 1, 1,
0.9718522, -0.1024924, 2.488011, 1, 1, 1, 1, 1,
0.9738639, -0.808736, 2.574758, 1, 1, 1, 1, 1,
0.978159, 0.7419614, 0.0865801, 1, 1, 1, 1, 1,
0.987322, -0.6895716, 0.3203656, 1, 1, 1, 1, 1,
0.9886988, 0.481516, 2.433388, 1, 1, 1, 1, 1,
0.9939811, -1.515091, 1.968033, 1, 1, 1, 1, 1,
0.9980458, 1.055266, -1.546601, 1, 1, 1, 1, 1,
0.9987389, -0.6928035, 3.561194, 1, 1, 1, 1, 1,
1.00517, -1.279576, 3.522779, 1, 1, 1, 1, 1,
1.007081, 0.7248215, -0.8710042, 0, 0, 1, 1, 1,
1.02183, -1.169053, 3.031805, 1, 0, 0, 1, 1,
1.022868, 1.234613, -0.5832678, 1, 0, 0, 1, 1,
1.025662, 0.9562888, 0.6703559, 1, 0, 0, 1, 1,
1.028142, 0.9670628, 0.6672215, 1, 0, 0, 1, 1,
1.033119, 0.9875832, 0.6205567, 1, 0, 0, 1, 1,
1.03474, 1.492977, 1.121285, 0, 0, 0, 1, 1,
1.047807, 0.4913444, 1.268522, 0, 0, 0, 1, 1,
1.050789, -0.6632454, 3.119857, 0, 0, 0, 1, 1,
1.051116, -0.7494637, 2.245168, 0, 0, 0, 1, 1,
1.052884, 1.05526, -0.3751414, 0, 0, 0, 1, 1,
1.055574, -0.03437229, 1.46289, 0, 0, 0, 1, 1,
1.056639, -0.7612098, 1.717612, 0, 0, 0, 1, 1,
1.06024, -1.174308, 2.943995, 1, 1, 1, 1, 1,
1.06412, 1.87792, -0.1116307, 1, 1, 1, 1, 1,
1.072071, 0.1854957, 1.715481, 1, 1, 1, 1, 1,
1.072768, -0.9515176, 2.162139, 1, 1, 1, 1, 1,
1.089899, -0.7585632, 0.390268, 1, 1, 1, 1, 1,
1.114351, 0.9983913, 0.5034924, 1, 1, 1, 1, 1,
1.114536, -1.52799, 3.330052, 1, 1, 1, 1, 1,
1.115477, 0.01541206, 1.754152, 1, 1, 1, 1, 1,
1.118265, 0.3503107, 0.3429801, 1, 1, 1, 1, 1,
1.13493, 0.7915261, 2.642341, 1, 1, 1, 1, 1,
1.151326, -2.616138, 2.916562, 1, 1, 1, 1, 1,
1.157816, 0.9973394, -0.69909, 1, 1, 1, 1, 1,
1.15869, -0.1649579, 1.637156, 1, 1, 1, 1, 1,
1.161759, 2.240191, 0.1798903, 1, 1, 1, 1, 1,
1.162653, 0.6119462, 0.7921401, 1, 1, 1, 1, 1,
1.16734, 0.682282, 1.291349, 0, 0, 1, 1, 1,
1.173831, -0.09423618, 2.316057, 1, 0, 0, 1, 1,
1.174145, -0.5744068, 2.046775, 1, 0, 0, 1, 1,
1.180655, -1.181181, 3.230877, 1, 0, 0, 1, 1,
1.182115, 0.3410596, 1.23145, 1, 0, 0, 1, 1,
1.184702, 1.538986, 0.7676318, 1, 0, 0, 1, 1,
1.187242, -0.642396, 2.734848, 0, 0, 0, 1, 1,
1.187385, 0.7506331, -0.06062918, 0, 0, 0, 1, 1,
1.188096, -1.140471, 1.107909, 0, 0, 0, 1, 1,
1.188365, 2.313845, -1.0926, 0, 0, 0, 1, 1,
1.189669, 0.3925824, 2.702482, 0, 0, 0, 1, 1,
1.196514, 0.8380103, 0.8618393, 0, 0, 0, 1, 1,
1.200051, -0.683515, 3.195482, 0, 0, 0, 1, 1,
1.202262, -1.533593, 2.359152, 1, 1, 1, 1, 1,
1.20278, 0.119363, 2.437515, 1, 1, 1, 1, 1,
1.204619, -1.783613, 1.084771, 1, 1, 1, 1, 1,
1.217015, -0.1602509, 1.291272, 1, 1, 1, 1, 1,
1.221656, -1.196351, 2.465348, 1, 1, 1, 1, 1,
1.230271, -0.1991228, 0.2358068, 1, 1, 1, 1, 1,
1.251059, 0.3710448, 2.966102, 1, 1, 1, 1, 1,
1.255311, 0.5563858, 2.50316, 1, 1, 1, 1, 1,
1.258155, 0.7049205, 2.076496, 1, 1, 1, 1, 1,
1.259218, 1.140063, 1.433638, 1, 1, 1, 1, 1,
1.262745, -0.5698476, 0.8281174, 1, 1, 1, 1, 1,
1.271073, 0.6021482, 2.390352, 1, 1, 1, 1, 1,
1.281091, 1.976268, -1.798348, 1, 1, 1, 1, 1,
1.305289, 0.3336669, 2.325931, 1, 1, 1, 1, 1,
1.308127, -1.544629, 3.38378, 1, 1, 1, 1, 1,
1.322885, -1.271714, 2.206086, 0, 0, 1, 1, 1,
1.323381, -0.004925461, 2.601376, 1, 0, 0, 1, 1,
1.332388, 0.1143177, 3.276224, 1, 0, 0, 1, 1,
1.346355, -1.440519, 1.649156, 1, 0, 0, 1, 1,
1.347044, -0.2610244, 1.975047, 1, 0, 0, 1, 1,
1.348888, 0.4738174, 1.512663, 1, 0, 0, 1, 1,
1.357926, 0.395606, 0.6226135, 0, 0, 0, 1, 1,
1.368616, 1.159075, 0.3752603, 0, 0, 0, 1, 1,
1.377153, 0.8234943, 1.372681, 0, 0, 0, 1, 1,
1.382414, -0.7438253, 1.343452, 0, 0, 0, 1, 1,
1.385239, -0.823481, 0.7998284, 0, 0, 0, 1, 1,
1.38837, -0.1415072, 2.649855, 0, 0, 0, 1, 1,
1.391613, 0.449417, 2.106817, 0, 0, 0, 1, 1,
1.404293, -1.083992, 2.24004, 1, 1, 1, 1, 1,
1.406038, -1.222706, 3.828573, 1, 1, 1, 1, 1,
1.409986, 2.666884, -0.1662271, 1, 1, 1, 1, 1,
1.416071, 0.7525776, 1.535154, 1, 1, 1, 1, 1,
1.42071, -0.4606618, 2.128948, 1, 1, 1, 1, 1,
1.423329, 0.6146519, 0.896539, 1, 1, 1, 1, 1,
1.427519, -0.33679, 1.901914, 1, 1, 1, 1, 1,
1.439002, -0.4901405, 0.6236185, 1, 1, 1, 1, 1,
1.446077, -1.3347, 1.861681, 1, 1, 1, 1, 1,
1.461994, -1.256935, 3.328647, 1, 1, 1, 1, 1,
1.464013, -0.6590051, 1.339916, 1, 1, 1, 1, 1,
1.464094, 0.2632772, 2.789331, 1, 1, 1, 1, 1,
1.465006, 0.8463311, 1.204634, 1, 1, 1, 1, 1,
1.465754, 1.285464, 0.1513621, 1, 1, 1, 1, 1,
1.468176, 1.454623, 0.1942262, 1, 1, 1, 1, 1,
1.469255, 0.4657093, 2.239643, 0, 0, 1, 1, 1,
1.477749, 2.298181, 0.01105107, 1, 0, 0, 1, 1,
1.479366, -0.02738672, 0.5981162, 1, 0, 0, 1, 1,
1.487032, 1.332154, 0.03081741, 1, 0, 0, 1, 1,
1.492863, 0.8322222, 2.00127, 1, 0, 0, 1, 1,
1.503219, -0.9406605, 1.978912, 1, 0, 0, 1, 1,
1.507172, 0.466358, -0.1413267, 0, 0, 0, 1, 1,
1.516282, -0.9215684, 2.842724, 0, 0, 0, 1, 1,
1.529881, 1.326884, -0.05083747, 0, 0, 0, 1, 1,
1.536211, -0.1770345, 1.42049, 0, 0, 0, 1, 1,
1.543574, 0.5980054, 0.7720361, 0, 0, 0, 1, 1,
1.553088, -0.7622964, 2.420375, 0, 0, 0, 1, 1,
1.555776, 0.2824363, 1.324921, 0, 0, 0, 1, 1,
1.564113, -0.7039667, 0.7284427, 1, 1, 1, 1, 1,
1.573867, -0.1588824, 2.747296, 1, 1, 1, 1, 1,
1.585386, 0.1247414, 1.297348, 1, 1, 1, 1, 1,
1.586684, 0.7087424, 1.574092, 1, 1, 1, 1, 1,
1.588936, 0.1309748, 3.090274, 1, 1, 1, 1, 1,
1.594658, -1.435861, -0.02383243, 1, 1, 1, 1, 1,
1.596041, -0.2778529, 1.140449, 1, 1, 1, 1, 1,
1.599643, -1.904124, 2.883146, 1, 1, 1, 1, 1,
1.610022, 0.855184, 0.520445, 1, 1, 1, 1, 1,
1.610677, 0.3941112, 1.130996, 1, 1, 1, 1, 1,
1.61528, -0.2572556, 2.04079, 1, 1, 1, 1, 1,
1.627355, 0.6575776, 2.840973, 1, 1, 1, 1, 1,
1.642332, 0.1889208, 1.844661, 1, 1, 1, 1, 1,
1.644648, 0.03955049, 1.829579, 1, 1, 1, 1, 1,
1.649273, -1.205737, 1.931876, 1, 1, 1, 1, 1,
1.650936, 0.2130198, 0.9832283, 0, 0, 1, 1, 1,
1.663888, 0.0440474, 3.593914, 1, 0, 0, 1, 1,
1.664044, 2.680204, 0.2023721, 1, 0, 0, 1, 1,
1.665136, -0.6963153, 3.328176, 1, 0, 0, 1, 1,
1.707619, -1.033394, 3.299686, 1, 0, 0, 1, 1,
1.71696, 1.355806, 0.6191046, 1, 0, 0, 1, 1,
1.724903, -0.6901062, 1.507239, 0, 0, 0, 1, 1,
1.726084, -0.3873231, 1.468028, 0, 0, 0, 1, 1,
1.733605, 0.8486639, 0.8098061, 0, 0, 0, 1, 1,
1.749788, 0.1103435, 0.1293983, 0, 0, 0, 1, 1,
1.757479, 1.227734, 0.9507998, 0, 0, 0, 1, 1,
1.762817, 0.9079667, 0.4180196, 0, 0, 0, 1, 1,
1.768645, 0.4429951, 1.68742, 0, 0, 0, 1, 1,
1.788835, -1.063608, 2.262483, 1, 1, 1, 1, 1,
1.79182, 0.8776726, 3.080811, 1, 1, 1, 1, 1,
1.79424, 0.7497756, 1.993868, 1, 1, 1, 1, 1,
1.799791, -1.06621, 1.545145, 1, 1, 1, 1, 1,
1.813547, -0.8671728, 2.144283, 1, 1, 1, 1, 1,
1.81379, 0.7477436, 1.470632, 1, 1, 1, 1, 1,
1.818613, 0.5600039, 1.489089, 1, 1, 1, 1, 1,
1.887787, 0.4980879, 1.893666, 1, 1, 1, 1, 1,
1.896513, -0.5246443, -0.3234423, 1, 1, 1, 1, 1,
1.911148, -1.245723, 2.242294, 1, 1, 1, 1, 1,
1.968833, -1.917756, 2.510673, 1, 1, 1, 1, 1,
1.985188, -0.8223916, 3.643554, 1, 1, 1, 1, 1,
2.009418, 0.27349, 1.416198, 1, 1, 1, 1, 1,
2.015926, 0.2439076, 0.113854, 1, 1, 1, 1, 1,
2.029343, -1.650181, 1.625031, 1, 1, 1, 1, 1,
2.054395, -1.234723, 3.672955, 0, 0, 1, 1, 1,
2.060143, 0.9542786, 3.339121, 1, 0, 0, 1, 1,
2.113056, 0.1722689, 3.212707, 1, 0, 0, 1, 1,
2.170943, -0.06687225, 2.944304, 1, 0, 0, 1, 1,
2.201966, 2.722941, 2.773652, 1, 0, 0, 1, 1,
2.226436, -0.3765259, 1.985237, 1, 0, 0, 1, 1,
2.269023, -1.083878, 0.017341, 0, 0, 0, 1, 1,
2.296696, -0.5902656, 4.111325, 0, 0, 0, 1, 1,
2.334106, 0.07738229, 1.817543, 0, 0, 0, 1, 1,
2.334302, 1.494981, 1.688645, 0, 0, 0, 1, 1,
2.383581, 1.089674, 1.314881, 0, 0, 0, 1, 1,
2.458675, -1.401042, 1.372937, 0, 0, 0, 1, 1,
2.508776, 0.2517751, 1.45258, 0, 0, 0, 1, 1,
2.517385, 1.014244, -0.3273176, 1, 1, 1, 1, 1,
2.543275, 1.394227, 0.3678858, 1, 1, 1, 1, 1,
2.629945, 0.5588037, 3.641174, 1, 1, 1, 1, 1,
2.682586, 0.3054776, 1.390618, 1, 1, 1, 1, 1,
2.859773, 0.2914776, 1.657401, 1, 1, 1, 1, 1,
3.532271, 1.099313, 0.1915846, 1, 1, 1, 1, 1,
3.542106, 1.473096, 1.133102, 1, 1, 1, 1, 1
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
var radius = 9.64476;
var distance = 33.87681;
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
mvMatrix.translate( -0.04462624, -0.09228182, -0.1459711 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.87681);
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
