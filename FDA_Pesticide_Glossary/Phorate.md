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
-4.476944, -1.947542, -3.843535, 1, 0, 0, 1,
-3.280494, -0.4732814, -2.413372, 1, 0.007843138, 0, 1,
-2.995977, 0.4704741, -0.6825241, 1, 0.01176471, 0, 1,
-2.988324, -0.6251304, -2.375183, 1, 0.01960784, 0, 1,
-2.900069, -0.5122297, -2.180032, 1, 0.02352941, 0, 1,
-2.781823, 0.1074953, -1.684782, 1, 0.03137255, 0, 1,
-2.675727, 0.4442393, -1.125726, 1, 0.03529412, 0, 1,
-2.634132, -0.825365, -3.128252, 1, 0.04313726, 0, 1,
-2.61585, 0.7454963, -0.4921313, 1, 0.04705882, 0, 1,
-2.561112, -0.8776565, -0.5811651, 1, 0.05490196, 0, 1,
-2.522043, 0.01557058, 0.003425928, 1, 0.05882353, 0, 1,
-2.508918, -1.163039, -0.2421366, 1, 0.06666667, 0, 1,
-2.488765, -0.6977662, -0.3032742, 1, 0.07058824, 0, 1,
-2.484486, -1.05351, -1.07046, 1, 0.07843138, 0, 1,
-2.447046, 0.8799039, -2.21749, 1, 0.08235294, 0, 1,
-2.409176, 0.04827851, -2.430799, 1, 0.09019608, 0, 1,
-2.408467, -0.5477964, -1.582273, 1, 0.09411765, 0, 1,
-2.346787, -1.302636, -2.027156, 1, 0.1019608, 0, 1,
-2.341749, -0.3197191, -1.077383, 1, 0.1098039, 0, 1,
-2.31862, 0.2538604, -1.33148, 1, 0.1137255, 0, 1,
-2.316662, -0.6277778, -3.181094, 1, 0.1215686, 0, 1,
-2.292212, -0.1796725, -2.540941, 1, 0.1254902, 0, 1,
-2.2867, 0.4092562, -2.069209, 1, 0.1333333, 0, 1,
-2.201956, 0.4491616, -0.3555054, 1, 0.1372549, 0, 1,
-2.15939, -0.1127518, -0.194602, 1, 0.145098, 0, 1,
-2.151672, -0.4117928, -2.055112, 1, 0.1490196, 0, 1,
-2.150057, 0.561905, -1.210581, 1, 0.1568628, 0, 1,
-2.127288, -0.8082092, -2.267659, 1, 0.1607843, 0, 1,
-2.117961, 1.056774, -1.857328, 1, 0.1686275, 0, 1,
-2.114882, -0.08589376, -1.6358, 1, 0.172549, 0, 1,
-2.063426, 0.6789194, -1.707184, 1, 0.1803922, 0, 1,
-2.062704, -0.227637, -1.214617, 1, 0.1843137, 0, 1,
-2.056115, 2.522672, -2.257377, 1, 0.1921569, 0, 1,
-2.041854, -1.293427, -2.803924, 1, 0.1960784, 0, 1,
-2.022141, 0.7615193, -0.1660061, 1, 0.2039216, 0, 1,
-1.997054, 0.3104938, -3.122809, 1, 0.2117647, 0, 1,
-1.947954, -0.4945012, -1.351189, 1, 0.2156863, 0, 1,
-1.94122, -0.8622606, -2.117623, 1, 0.2235294, 0, 1,
-1.940463, -1.147094, -2.117872, 1, 0.227451, 0, 1,
-1.91272, 0.09969926, -0.7933924, 1, 0.2352941, 0, 1,
-1.888778, -0.3839695, -1.358044, 1, 0.2392157, 0, 1,
-1.885373, -1.364152, -1.293878, 1, 0.2470588, 0, 1,
-1.855207, 0.194471, -3.065278, 1, 0.2509804, 0, 1,
-1.813555, 0.5993745, -1.045884, 1, 0.2588235, 0, 1,
-1.809345, 0.5873747, -1.134039, 1, 0.2627451, 0, 1,
-1.800297, -0.3242553, -0.7518824, 1, 0.2705882, 0, 1,
-1.798922, -1.461829, -1.801383, 1, 0.2745098, 0, 1,
-1.798581, 0.1430701, -2.742766, 1, 0.282353, 0, 1,
-1.791738, 1.104519, -1.699102, 1, 0.2862745, 0, 1,
-1.748648, 0.0601135, -1.127194, 1, 0.2941177, 0, 1,
-1.738376, 0.798134, -0.5661129, 1, 0.3019608, 0, 1,
-1.736105, 0.3237923, -1.392705, 1, 0.3058824, 0, 1,
-1.730289, 1.074918, -2.068617, 1, 0.3137255, 0, 1,
-1.728949, 0.6057619, -0.2220126, 1, 0.3176471, 0, 1,
-1.722178, 1.072746, -0.7512942, 1, 0.3254902, 0, 1,
-1.702756, 0.05195939, 0.2743132, 1, 0.3294118, 0, 1,
-1.692084, -0.6391984, -0.4518199, 1, 0.3372549, 0, 1,
-1.688094, 0.006063712, -2.382395, 1, 0.3411765, 0, 1,
-1.677433, 0.5252945, 0.3210913, 1, 0.3490196, 0, 1,
-1.671963, 0.8565663, -1.039923, 1, 0.3529412, 0, 1,
-1.670134, -0.6787471, -3.015784, 1, 0.3607843, 0, 1,
-1.669819, -1.641309, -2.260308, 1, 0.3647059, 0, 1,
-1.640263, 0.9768963, -1.065793, 1, 0.372549, 0, 1,
-1.638964, -0.5988892, -2.083758, 1, 0.3764706, 0, 1,
-1.634649, -0.4371854, -2.076747, 1, 0.3843137, 0, 1,
-1.614708, -0.4834039, -1.465723, 1, 0.3882353, 0, 1,
-1.611701, 0.2815911, -1.192513, 1, 0.3960784, 0, 1,
-1.600739, -1.341375, 0.1663548, 1, 0.4039216, 0, 1,
-1.598212, -0.5851241, -2.411794, 1, 0.4078431, 0, 1,
-1.589204, 1.311016, -0.2059723, 1, 0.4156863, 0, 1,
-1.585762, -0.8048501, -1.044493, 1, 0.4196078, 0, 1,
-1.579354, 0.3392972, -1.134304, 1, 0.427451, 0, 1,
-1.566166, 0.5266137, -1.926432, 1, 0.4313726, 0, 1,
-1.552589, -0.6052885, -2.43437, 1, 0.4392157, 0, 1,
-1.546214, -1.491782, -1.885678, 1, 0.4431373, 0, 1,
-1.531284, 0.7773187, -0.3651995, 1, 0.4509804, 0, 1,
-1.511433, -1.20893, -2.132066, 1, 0.454902, 0, 1,
-1.509282, -0.3631807, -3.164191, 1, 0.4627451, 0, 1,
-1.508002, -0.1927439, -1.438146, 1, 0.4666667, 0, 1,
-1.499883, -0.5817025, -4.052871, 1, 0.4745098, 0, 1,
-1.494279, 0.9383316, -0.4249591, 1, 0.4784314, 0, 1,
-1.490135, 0.8979179, -0.3512467, 1, 0.4862745, 0, 1,
-1.448295, 0.1714369, -0.8015178, 1, 0.4901961, 0, 1,
-1.43566, 0.1676507, -3.268889, 1, 0.4980392, 0, 1,
-1.426561, -0.1792092, -1.863614, 1, 0.5058824, 0, 1,
-1.425779, 0.8412663, 0.2470032, 1, 0.509804, 0, 1,
-1.405926, 1.889336, -1.465735, 1, 0.5176471, 0, 1,
-1.393914, -0.5146355, 0.385158, 1, 0.5215687, 0, 1,
-1.38253, -0.406334, -0.6202312, 1, 0.5294118, 0, 1,
-1.379797, 1.233732, -1.492526, 1, 0.5333334, 0, 1,
-1.376949, -0.1495258, -0.8616078, 1, 0.5411765, 0, 1,
-1.376696, 0.1596706, -3.583853, 1, 0.5450981, 0, 1,
-1.374977, -0.2231831, -2.690205, 1, 0.5529412, 0, 1,
-1.362466, -1.247289, -1.831554, 1, 0.5568628, 0, 1,
-1.312987, 0.9500622, -1.433505, 1, 0.5647059, 0, 1,
-1.291118, 0.08156732, -2.372663, 1, 0.5686275, 0, 1,
-1.286062, 0.2598543, -0.8655545, 1, 0.5764706, 0, 1,
-1.267694, 0.7287432, -1.419024, 1, 0.5803922, 0, 1,
-1.265202, 0.0820395, -1.719337, 1, 0.5882353, 0, 1,
-1.248015, -0.6693733, -3.297137, 1, 0.5921569, 0, 1,
-1.225523, -0.4026664, -2.183906, 1, 0.6, 0, 1,
-1.222236, -1.566305, -3.280544, 1, 0.6078432, 0, 1,
-1.220916, -0.9788749, -1.513858, 1, 0.6117647, 0, 1,
-1.22073, -0.2851142, -2.251287, 1, 0.6196079, 0, 1,
-1.218046, 0.4981089, -0.5055565, 1, 0.6235294, 0, 1,
-1.217008, 1.186922, -1.803853, 1, 0.6313726, 0, 1,
-1.216901, -1.360858, -1.875186, 1, 0.6352941, 0, 1,
-1.216856, -0.406434, -1.672223, 1, 0.6431373, 0, 1,
-1.208994, 2.438369, -2.511137, 1, 0.6470588, 0, 1,
-1.20764, -0.5269395, -1.932203, 1, 0.654902, 0, 1,
-1.203346, 0.2327631, -1.315676, 1, 0.6588235, 0, 1,
-1.202849, -1.038746, -0.6621038, 1, 0.6666667, 0, 1,
-1.197395, -1.057554, -1.982759, 1, 0.6705883, 0, 1,
-1.197248, 0.3251313, -5.639561, 1, 0.6784314, 0, 1,
-1.186559, 0.488067, 0.164464, 1, 0.682353, 0, 1,
-1.185479, -1.205908, -1.989622, 1, 0.6901961, 0, 1,
-1.169752, -1.075453, -3.830145, 1, 0.6941177, 0, 1,
-1.165095, 0.427331, -1.842201, 1, 0.7019608, 0, 1,
-1.149847, -0.7009345, -2.618442, 1, 0.7098039, 0, 1,
-1.148026, -0.8586428, -1.699533, 1, 0.7137255, 0, 1,
-1.147774, -1.240423, -1.53372, 1, 0.7215686, 0, 1,
-1.14203, -0.4099006, -0.1255619, 1, 0.7254902, 0, 1,
-1.13415, -0.02378998, -1.557458, 1, 0.7333333, 0, 1,
-1.117382, -1.080596, -2.416127, 1, 0.7372549, 0, 1,
-1.117216, -0.6232744, -2.288399, 1, 0.7450981, 0, 1,
-1.112543, -0.5529918, -0.8018451, 1, 0.7490196, 0, 1,
-1.103578, -0.2534811, -1.08929, 1, 0.7568628, 0, 1,
-1.102987, -2.304807, -1.140162, 1, 0.7607843, 0, 1,
-1.102413, 0.4293068, 0.1495616, 1, 0.7686275, 0, 1,
-1.10055, 0.8169517, -2.020523, 1, 0.772549, 0, 1,
-1.098895, 0.2204356, -0.3919964, 1, 0.7803922, 0, 1,
-1.098302, -0.9580376, -2.770494, 1, 0.7843137, 0, 1,
-1.098192, 0.5496129, -0.9918481, 1, 0.7921569, 0, 1,
-1.095681, -1.924218, -4.398407, 1, 0.7960784, 0, 1,
-1.094727, 0.1418197, -2.569213, 1, 0.8039216, 0, 1,
-1.091963, -0.3124363, -0.724565, 1, 0.8117647, 0, 1,
-1.088341, 1.047687, -0.9650378, 1, 0.8156863, 0, 1,
-1.086993, -0.5910345, -1.504043, 1, 0.8235294, 0, 1,
-1.075231, -0.4482165, -2.711147, 1, 0.827451, 0, 1,
-1.073657, 1.940374, -0.2552417, 1, 0.8352941, 0, 1,
-1.070445, -0.5505055, -2.594627, 1, 0.8392157, 0, 1,
-1.068062, -0.2072241, -2.048871, 1, 0.8470588, 0, 1,
-1.066754, 0.835411, -3.391008, 1, 0.8509804, 0, 1,
-1.066718, -0.1342326, -3.080903, 1, 0.8588235, 0, 1,
-1.066045, -0.9578993, -4.381695, 1, 0.8627451, 0, 1,
-1.060887, -1.205973, -3.79096, 1, 0.8705882, 0, 1,
-1.052903, -0.7197325, -1.022483, 1, 0.8745098, 0, 1,
-1.052644, -0.6920397, -1.709733, 1, 0.8823529, 0, 1,
-1.051244, 0.5301907, -3.463771, 1, 0.8862745, 0, 1,
-1.048902, 0.1124231, -1.582817, 1, 0.8941177, 0, 1,
-1.041762, 0.5449499, -0.5186085, 1, 0.8980392, 0, 1,
-1.038215, 0.931623, -1.099411, 1, 0.9058824, 0, 1,
-1.032308, 0.3449769, -2.135812, 1, 0.9137255, 0, 1,
-1.030471, -0.6703679, -1.7554, 1, 0.9176471, 0, 1,
-1.026851, -0.6716851, -0.9029108, 1, 0.9254902, 0, 1,
-1.012931, 0.006209623, -0.7896472, 1, 0.9294118, 0, 1,
-1.011439, -0.6751577, -1.328677, 1, 0.9372549, 0, 1,
-1.00575, 0.3701554, -1.308583, 1, 0.9411765, 0, 1,
-1.004403, -0.1017752, -3.155103, 1, 0.9490196, 0, 1,
-1.000091, 0.8815612, 0.2688262, 1, 0.9529412, 0, 1,
-0.997093, -1.014079, -1.597058, 1, 0.9607843, 0, 1,
-0.9883087, -0.5732086, -2.509562, 1, 0.9647059, 0, 1,
-0.9834812, -0.7117682, -2.691326, 1, 0.972549, 0, 1,
-0.9699016, 0.9062383, 0.7180238, 1, 0.9764706, 0, 1,
-0.9693857, 1.083163, -0.5382382, 1, 0.9843137, 0, 1,
-0.9630402, -1.206402, -3.906295, 1, 0.9882353, 0, 1,
-0.9617648, -0.166898, -1.168322, 1, 0.9960784, 0, 1,
-0.9586554, -1.306556, -3.828293, 0.9960784, 1, 0, 1,
-0.9576619, 0.9596268, -0.8640381, 0.9921569, 1, 0, 1,
-0.9509023, -1.014358, -2.54377, 0.9843137, 1, 0, 1,
-0.9447039, -0.08635671, -0.8390639, 0.9803922, 1, 0, 1,
-0.9359334, 0.1204015, -2.588495, 0.972549, 1, 0, 1,
-0.934631, -0.6322482, -2.32847, 0.9686275, 1, 0, 1,
-0.9223569, -1.573191, -2.748295, 0.9607843, 1, 0, 1,
-0.9184781, 0.7533886, -1.837157, 0.9568627, 1, 0, 1,
-0.9134964, 0.33167, -0.7313726, 0.9490196, 1, 0, 1,
-0.9098504, 0.7740448, -0.6611264, 0.945098, 1, 0, 1,
-0.9072384, -1.424252, -3.34941, 0.9372549, 1, 0, 1,
-0.905913, 0.8539289, -1.679393, 0.9333333, 1, 0, 1,
-0.9011283, -0.1931597, -1.036573, 0.9254902, 1, 0, 1,
-0.9003615, -2.206745, -3.126136, 0.9215686, 1, 0, 1,
-0.8967659, -0.2469894, -1.359017, 0.9137255, 1, 0, 1,
-0.8840364, 0.48398, -1.039773, 0.9098039, 1, 0, 1,
-0.8826218, -2.102671, -2.519065, 0.9019608, 1, 0, 1,
-0.8771005, 1.176524, 1.012591, 0.8941177, 1, 0, 1,
-0.8765832, 1.114664, -0.3585384, 0.8901961, 1, 0, 1,
-0.8668583, 1.284717, -1.69878, 0.8823529, 1, 0, 1,
-0.8667614, 0.4767253, 0.2996938, 0.8784314, 1, 0, 1,
-0.8661644, 0.8275802, -1.754163, 0.8705882, 1, 0, 1,
-0.8659315, -0.1028789, -2.797088, 0.8666667, 1, 0, 1,
-0.8587927, 0.05309952, -2.167918, 0.8588235, 1, 0, 1,
-0.8493639, 0.1458507, -1.431313, 0.854902, 1, 0, 1,
-0.8458943, -1.080388, -1.403712, 0.8470588, 1, 0, 1,
-0.845867, -1.093902, -2.420029, 0.8431373, 1, 0, 1,
-0.8458102, 1.690453, 0.2001454, 0.8352941, 1, 0, 1,
-0.8406783, 1.493658, -0.788151, 0.8313726, 1, 0, 1,
-0.8396834, -0.503998, -1.504654, 0.8235294, 1, 0, 1,
-0.8353832, -0.6779954, -3.520671, 0.8196079, 1, 0, 1,
-0.8344679, 1.218395, -0.06567352, 0.8117647, 1, 0, 1,
-0.8311978, -0.2711933, -0.05487824, 0.8078431, 1, 0, 1,
-0.8306885, -0.129921, -1.634205, 0.8, 1, 0, 1,
-0.8284492, 1.819035, -0.9050435, 0.7921569, 1, 0, 1,
-0.8281354, 0.6405801, -0.9838746, 0.7882353, 1, 0, 1,
-0.8215815, 1.923036, 0.02980545, 0.7803922, 1, 0, 1,
-0.8192576, 0.8505898, -0.8634351, 0.7764706, 1, 0, 1,
-0.8143734, 0.6177049, 1.004036, 0.7686275, 1, 0, 1,
-0.8093363, 0.8794494, -1.348233, 0.7647059, 1, 0, 1,
-0.7985049, -0.8515982, -1.077349, 0.7568628, 1, 0, 1,
-0.7913928, 0.1185405, -1.677121, 0.7529412, 1, 0, 1,
-0.7911621, 0.912483, -1.657517, 0.7450981, 1, 0, 1,
-0.7721558, 0.2560046, -0.8192537, 0.7411765, 1, 0, 1,
-0.7670885, 0.5975136, -3.045098, 0.7333333, 1, 0, 1,
-0.7669072, -0.9721271, -3.717524, 0.7294118, 1, 0, 1,
-0.7662368, 0.2155711, -1.599346, 0.7215686, 1, 0, 1,
-0.755294, -1.10385, -1.365546, 0.7176471, 1, 0, 1,
-0.7536365, -0.8160172, -2.404709, 0.7098039, 1, 0, 1,
-0.7531286, 0.1671521, -3.239669, 0.7058824, 1, 0, 1,
-0.7507867, -0.1492326, -0.86238, 0.6980392, 1, 0, 1,
-0.7453764, -1.454937, -2.430976, 0.6901961, 1, 0, 1,
-0.7451807, -0.8494045, -2.577654, 0.6862745, 1, 0, 1,
-0.7368195, -0.7277384, -3.391192, 0.6784314, 1, 0, 1,
-0.7292097, 0.2412465, -1.200653, 0.6745098, 1, 0, 1,
-0.7292032, -0.8589364, -2.11639, 0.6666667, 1, 0, 1,
-0.7265533, -0.1921653, -2.357996, 0.6627451, 1, 0, 1,
-0.7247075, 0.07403328, -1.283324, 0.654902, 1, 0, 1,
-0.7228999, 0.8622649, -1.221529, 0.6509804, 1, 0, 1,
-0.7172414, -0.6904137, -4.325787, 0.6431373, 1, 0, 1,
-0.7169906, 2.019265, -0.3304309, 0.6392157, 1, 0, 1,
-0.7135498, -0.6582387, -4.072241, 0.6313726, 1, 0, 1,
-0.7102357, 0.2651834, -0.4625154, 0.627451, 1, 0, 1,
-0.7048514, -0.6147314, -2.953687, 0.6196079, 1, 0, 1,
-0.6997775, 0.7945254, -1.232687, 0.6156863, 1, 0, 1,
-0.6968479, 0.5059431, 0.4779979, 0.6078432, 1, 0, 1,
-0.6942494, 0.4234394, -3.317727, 0.6039216, 1, 0, 1,
-0.6890802, -0.8459646, -3.367476, 0.5960785, 1, 0, 1,
-0.682734, 0.2599306, 0.01968669, 0.5882353, 1, 0, 1,
-0.680441, -0.4196749, -1.741331, 0.5843138, 1, 0, 1,
-0.6786883, 0.7823301, -0.9212953, 0.5764706, 1, 0, 1,
-0.6778132, 0.8691213, -1.417688, 0.572549, 1, 0, 1,
-0.6719798, 1.516855, -0.6977181, 0.5647059, 1, 0, 1,
-0.6697875, -0.6020658, -2.673951, 0.5607843, 1, 0, 1,
-0.6696878, -0.7375039, -3.559632, 0.5529412, 1, 0, 1,
-0.6683875, 1.622733, -0.0167265, 0.5490196, 1, 0, 1,
-0.6664425, -0.6609282, -0.318113, 0.5411765, 1, 0, 1,
-0.6631204, 0.4501543, 2.262084, 0.5372549, 1, 0, 1,
-0.6613434, 0.6257547, -2.026152, 0.5294118, 1, 0, 1,
-0.6583905, 2.885439, -1.053118, 0.5254902, 1, 0, 1,
-0.6577561, 0.264776, -0.8662468, 0.5176471, 1, 0, 1,
-0.6509491, -0.3155742, -2.099594, 0.5137255, 1, 0, 1,
-0.647401, -1.955122, -4.705626, 0.5058824, 1, 0, 1,
-0.6473311, -0.7361283, -2.45258, 0.5019608, 1, 0, 1,
-0.6432296, -0.5090081, -2.429697, 0.4941176, 1, 0, 1,
-0.6427868, -0.2791958, -3.713722, 0.4862745, 1, 0, 1,
-0.6427082, -0.3577586, -2.869912, 0.4823529, 1, 0, 1,
-0.6419291, -0.8523098, -2.494057, 0.4745098, 1, 0, 1,
-0.6416871, -0.4090862, -1.886782, 0.4705882, 1, 0, 1,
-0.6409702, 0.2424252, -0.8347657, 0.4627451, 1, 0, 1,
-0.6406305, -0.4127425, -0.9296746, 0.4588235, 1, 0, 1,
-0.6403177, 0.4087265, -0.1438073, 0.4509804, 1, 0, 1,
-0.6384266, 0.8277346, -0.086053, 0.4470588, 1, 0, 1,
-0.636129, 0.3189587, -1.211563, 0.4392157, 1, 0, 1,
-0.6355084, 0.6853978, 0.22963, 0.4352941, 1, 0, 1,
-0.6330903, 0.2091554, -0.1211058, 0.427451, 1, 0, 1,
-0.6312707, -0.5866205, -3.962276, 0.4235294, 1, 0, 1,
-0.6198628, 1.083485, -2.189898, 0.4156863, 1, 0, 1,
-0.6190885, -1.230709, -3.473733, 0.4117647, 1, 0, 1,
-0.6187951, -0.6508024, -3.169749, 0.4039216, 1, 0, 1,
-0.6180808, 0.5712773, -1.061866, 0.3960784, 1, 0, 1,
-0.6093306, -0.9200281, -3.684834, 0.3921569, 1, 0, 1,
-0.6062475, 0.2631553, -2.668591, 0.3843137, 1, 0, 1,
-0.6021075, -1.466365, -2.501361, 0.3803922, 1, 0, 1,
-0.597352, 0.1577443, -1.223989, 0.372549, 1, 0, 1,
-0.5968891, 1.373932, 0.1265493, 0.3686275, 1, 0, 1,
-0.596223, 0.1180547, -2.29755, 0.3607843, 1, 0, 1,
-0.5902846, 0.2449474, -1.740306, 0.3568628, 1, 0, 1,
-0.5892137, 1.316678, -0.340968, 0.3490196, 1, 0, 1,
-0.5870018, 0.3474296, -1.817858, 0.345098, 1, 0, 1,
-0.5855964, -0.7863911, -3.764054, 0.3372549, 1, 0, 1,
-0.5825846, -0.0004573226, -0.482253, 0.3333333, 1, 0, 1,
-0.5817161, 0.1462156, -2.781174, 0.3254902, 1, 0, 1,
-0.5796846, 1.343198, -1.999081, 0.3215686, 1, 0, 1,
-0.5785121, -0.607796, -1.446675, 0.3137255, 1, 0, 1,
-0.5646386, -1.478557, -5.867302, 0.3098039, 1, 0, 1,
-0.5632855, -0.02168664, -2.043006, 0.3019608, 1, 0, 1,
-0.5518405, 1.017856, 0.337384, 0.2941177, 1, 0, 1,
-0.5475921, 1.760851, 1.289003, 0.2901961, 1, 0, 1,
-0.5463915, -0.8751034, -3.597692, 0.282353, 1, 0, 1,
-0.5443528, 0.6906359, -2.009118, 0.2784314, 1, 0, 1,
-0.5435175, 0.7309874, -0.1126374, 0.2705882, 1, 0, 1,
-0.5434533, -0.2590028, -1.292042, 0.2666667, 1, 0, 1,
-0.5397499, -0.8725936, -3.977333, 0.2588235, 1, 0, 1,
-0.5396284, -0.6097329, -1.857321, 0.254902, 1, 0, 1,
-0.5378137, -0.03380787, -0.3745254, 0.2470588, 1, 0, 1,
-0.5349892, 1.158696, -0.5899014, 0.2431373, 1, 0, 1,
-0.5317385, 0.2431156, -3.03682, 0.2352941, 1, 0, 1,
-0.5233094, -0.9206176, -3.565762, 0.2313726, 1, 0, 1,
-0.5189706, -0.8623157, -3.117543, 0.2235294, 1, 0, 1,
-0.5188195, -0.4328931, -2.690242, 0.2196078, 1, 0, 1,
-0.516297, 0.6382862, 1.25908, 0.2117647, 1, 0, 1,
-0.516212, -0.6688017, -3.61287, 0.2078431, 1, 0, 1,
-0.5160342, 0.715197, -0.3025329, 0.2, 1, 0, 1,
-0.5134709, -1.020398, -2.598296, 0.1921569, 1, 0, 1,
-0.509351, 1.231578, 0.8335083, 0.1882353, 1, 0, 1,
-0.5078582, -0.3166276, -1.364146, 0.1803922, 1, 0, 1,
-0.5067865, -0.9821534, -1.914568, 0.1764706, 1, 0, 1,
-0.5050861, 0.6929271, -0.4641563, 0.1686275, 1, 0, 1,
-0.5009326, -0.006424667, -0.1962947, 0.1647059, 1, 0, 1,
-0.5007836, 0.07034333, -2.210162, 0.1568628, 1, 0, 1,
-0.5004649, -0.3259466, -0.7917141, 0.1529412, 1, 0, 1,
-0.4988533, -0.8870899, -2.939995, 0.145098, 1, 0, 1,
-0.4838769, 0.6450456, -0.66676, 0.1411765, 1, 0, 1,
-0.4797752, -0.9981951, -3.833305, 0.1333333, 1, 0, 1,
-0.4793643, 0.6123765, 0.9297795, 0.1294118, 1, 0, 1,
-0.472387, 0.6612352, -2.045791, 0.1215686, 1, 0, 1,
-0.4697907, -1.088317, -5.437248, 0.1176471, 1, 0, 1,
-0.4695119, 1.434427, -0.03074847, 0.1098039, 1, 0, 1,
-0.4679128, -1.448454, -2.945923, 0.1058824, 1, 0, 1,
-0.4650792, 0.3584437, 1.350986, 0.09803922, 1, 0, 1,
-0.4648005, 0.9090438, -0.8063148, 0.09019608, 1, 0, 1,
-0.4647609, -0.8588688, -2.514665, 0.08627451, 1, 0, 1,
-0.4558186, 0.5691583, -0.4157276, 0.07843138, 1, 0, 1,
-0.4550506, 0.06530102, -2.304979, 0.07450981, 1, 0, 1,
-0.4513956, 0.07976882, -0.3648435, 0.06666667, 1, 0, 1,
-0.4475486, -0.1424422, -3.144583, 0.0627451, 1, 0, 1,
-0.4451316, -1.189072, -1.829611, 0.05490196, 1, 0, 1,
-0.4440962, -0.1825231, -2.081321, 0.05098039, 1, 0, 1,
-0.4415369, 0.7850113, -1.349493, 0.04313726, 1, 0, 1,
-0.4340269, -1.239763, -0.3866898, 0.03921569, 1, 0, 1,
-0.4334595, 0.05025791, -0.6956519, 0.03137255, 1, 0, 1,
-0.4326257, 1.015936, -0.05833293, 0.02745098, 1, 0, 1,
-0.427907, -0.07159067, -1.784745, 0.01960784, 1, 0, 1,
-0.424264, 0.07250108, -1.371472, 0.01568628, 1, 0, 1,
-0.4210573, -0.728152, -3.879798, 0.007843138, 1, 0, 1,
-0.4194625, -1.144703, -1.491639, 0.003921569, 1, 0, 1,
-0.4176073, 0.5311125, -3.364868, 0, 1, 0.003921569, 1,
-0.4155423, -1.115893, -4.093212, 0, 1, 0.01176471, 1,
-0.4146701, 0.729072, 1.573621, 0, 1, 0.01568628, 1,
-0.4119637, 0.6391537, 0.3397275, 0, 1, 0.02352941, 1,
-0.4119577, -0.1101382, -2.105687, 0, 1, 0.02745098, 1,
-0.411625, -0.2535083, -2.42286, 0, 1, 0.03529412, 1,
-0.4115881, 1.381939, -1.191895, 0, 1, 0.03921569, 1,
-0.4058087, -0.2712826, -2.20396, 0, 1, 0.04705882, 1,
-0.399827, 1.549564, -0.7001277, 0, 1, 0.05098039, 1,
-0.3979224, 0.1365182, -0.8905463, 0, 1, 0.05882353, 1,
-0.3978587, -1.147285, -3.192402, 0, 1, 0.0627451, 1,
-0.395612, 0.03447253, -0.2298118, 0, 1, 0.07058824, 1,
-0.3953444, -0.002448909, -1.776935, 0, 1, 0.07450981, 1,
-0.3882779, 1.011465, -2.188213, 0, 1, 0.08235294, 1,
-0.3839358, 0.5701526, 2.082552, 0, 1, 0.08627451, 1,
-0.380429, 0.4619711, 0.07991542, 0, 1, 0.09411765, 1,
-0.3793759, 1.780983, -1.162755, 0, 1, 0.1019608, 1,
-0.3760216, -1.000322, -3.347197, 0, 1, 0.1058824, 1,
-0.3688467, -1.873654, -1.922555, 0, 1, 0.1137255, 1,
-0.3677981, 0.112632, -0.9667783, 0, 1, 0.1176471, 1,
-0.3674821, -0.4419682, -3.453323, 0, 1, 0.1254902, 1,
-0.3665704, -0.7328228, -2.700067, 0, 1, 0.1294118, 1,
-0.3628736, -1.211475, -1.722326, 0, 1, 0.1372549, 1,
-0.3626446, 1.83374, -1.385485, 0, 1, 0.1411765, 1,
-0.3626036, 1.744562, -0.2278125, 0, 1, 0.1490196, 1,
-0.3620875, -1.01624, -4.01923, 0, 1, 0.1529412, 1,
-0.3614545, 1.942659, -0.9916292, 0, 1, 0.1607843, 1,
-0.3603392, -0.4882427, -4.094944, 0, 1, 0.1647059, 1,
-0.3560079, -1.208283, -3.096143, 0, 1, 0.172549, 1,
-0.3548461, -1.724745, -2.385287, 0, 1, 0.1764706, 1,
-0.3547477, 1.612772, 1.090671, 0, 1, 0.1843137, 1,
-0.3524317, -0.796931, -2.990367, 0, 1, 0.1882353, 1,
-0.3511867, -1.08866, -2.870189, 0, 1, 0.1960784, 1,
-0.3510592, -0.1964851, -1.066148, 0, 1, 0.2039216, 1,
-0.3474153, -1.902116, -4.028569, 0, 1, 0.2078431, 1,
-0.3466139, 0.9966151, 2.012435, 0, 1, 0.2156863, 1,
-0.3428028, -1.369241, -2.071841, 0, 1, 0.2196078, 1,
-0.338418, 1.139577, -1.780607, 0, 1, 0.227451, 1,
-0.3350931, 0.06440216, -1.021761, 0, 1, 0.2313726, 1,
-0.3350463, -0.001723507, 0.0631528, 0, 1, 0.2392157, 1,
-0.3330481, 0.6619976, -0.2030906, 0, 1, 0.2431373, 1,
-0.3233119, 0.4645499, 0.3583499, 0, 1, 0.2509804, 1,
-0.3194819, 0.4988428, -0.560454, 0, 1, 0.254902, 1,
-0.3180287, 0.9568082, -0.3805272, 0, 1, 0.2627451, 1,
-0.3130306, -1.029075, -3.203114, 0, 1, 0.2666667, 1,
-0.3120364, 1.458436, 1.0744, 0, 1, 0.2745098, 1,
-0.3105083, 0.1339956, -2.650276, 0, 1, 0.2784314, 1,
-0.2995847, -0.7757701, -1.496815, 0, 1, 0.2862745, 1,
-0.2986647, -0.01479947, -1.178476, 0, 1, 0.2901961, 1,
-0.2971103, -0.9938591, -2.060812, 0, 1, 0.2980392, 1,
-0.2949744, -2.192885, -2.379377, 0, 1, 0.3058824, 1,
-0.2898413, 1.682683, 1.27345, 0, 1, 0.3098039, 1,
-0.2853728, -0.2713227, -2.875777, 0, 1, 0.3176471, 1,
-0.2850286, -1.142885, -0.9529214, 0, 1, 0.3215686, 1,
-0.2820609, -0.07015221, -1.308054, 0, 1, 0.3294118, 1,
-0.2752025, -1.08077, -3.35796, 0, 1, 0.3333333, 1,
-0.2743211, 0.2653837, -0.3419235, 0, 1, 0.3411765, 1,
-0.274087, -2.072257, -2.910372, 0, 1, 0.345098, 1,
-0.2702977, 0.5036294, 0.6967639, 0, 1, 0.3529412, 1,
-0.2679224, -0.3215368, -2.345814, 0, 1, 0.3568628, 1,
-0.266674, 0.1923224, -0.370241, 0, 1, 0.3647059, 1,
-0.2600198, 0.6456637, 0.9437796, 0, 1, 0.3686275, 1,
-0.2558962, -1.959595, -3.102085, 0, 1, 0.3764706, 1,
-0.2552054, -2.714972, -3.83174, 0, 1, 0.3803922, 1,
-0.2543945, 2.170151, 0.6785923, 0, 1, 0.3882353, 1,
-0.2520712, -0.3006457, -2.43487, 0, 1, 0.3921569, 1,
-0.2481755, 1.316493, -0.1067085, 0, 1, 0.4, 1,
-0.2435795, 0.007727319, -1.311029, 0, 1, 0.4078431, 1,
-0.2386989, -1.908701, -4.624234, 0, 1, 0.4117647, 1,
-0.2377773, -0.4861918, -2.489774, 0, 1, 0.4196078, 1,
-0.2354301, -1.279933, -3.882739, 0, 1, 0.4235294, 1,
-0.2310006, 1.674453, -0.4197997, 0, 1, 0.4313726, 1,
-0.2303475, -0.9950652, -1.100349, 0, 1, 0.4352941, 1,
-0.2298846, 0.5461057, -1.776939, 0, 1, 0.4431373, 1,
-0.2289575, -1.772161, -2.693782, 0, 1, 0.4470588, 1,
-0.2250998, 1.019186, -0.5806184, 0, 1, 0.454902, 1,
-0.2240642, 0.1902725, -2.116089, 0, 1, 0.4588235, 1,
-0.2235995, -0.5576575, -2.248073, 0, 1, 0.4666667, 1,
-0.2229473, 1.116566, -0.08758797, 0, 1, 0.4705882, 1,
-0.2215312, -0.9021925, -2.09117, 0, 1, 0.4784314, 1,
-0.2191758, 0.6096134, -0.7927176, 0, 1, 0.4823529, 1,
-0.215369, -1.283179, -3.106669, 0, 1, 0.4901961, 1,
-0.213195, 0.1609498, -1.392648, 0, 1, 0.4941176, 1,
-0.2127534, -0.06962059, -2.535266, 0, 1, 0.5019608, 1,
-0.2113656, 0.2069377, -1.258204, 0, 1, 0.509804, 1,
-0.2105031, 1.813009, 0.5554414, 0, 1, 0.5137255, 1,
-0.2090228, 0.0823076, -1.505111, 0, 1, 0.5215687, 1,
-0.2066666, 0.1605848, 1.355211, 0, 1, 0.5254902, 1,
-0.2064504, -1.528037, -1.693458, 0, 1, 0.5333334, 1,
-0.2033776, -0.5410691, -3.326668, 0, 1, 0.5372549, 1,
-0.2028443, 0.0399297, -1.925949, 0, 1, 0.5450981, 1,
-0.2013812, -0.5854861, -3.653635, 0, 1, 0.5490196, 1,
-0.1992178, 0.245154, -0.736354, 0, 1, 0.5568628, 1,
-0.1967033, -0.8117496, -3.425759, 0, 1, 0.5607843, 1,
-0.1962786, -0.1968908, -3.566155, 0, 1, 0.5686275, 1,
-0.1878536, 0.6620863, 0.7922396, 0, 1, 0.572549, 1,
-0.1875705, 0.9913647, -0.7127495, 0, 1, 0.5803922, 1,
-0.1853166, -0.8683515, -3.61294, 0, 1, 0.5843138, 1,
-0.1850524, 2.297124, -0.7009425, 0, 1, 0.5921569, 1,
-0.1814074, -0.1508732, -2.880082, 0, 1, 0.5960785, 1,
-0.1799127, -1.080824, -2.550701, 0, 1, 0.6039216, 1,
-0.1772048, -1.601522, -2.59951, 0, 1, 0.6117647, 1,
-0.1716718, 0.324451, -0.9182343, 0, 1, 0.6156863, 1,
-0.167812, -0.9000157, -2.32373, 0, 1, 0.6235294, 1,
-0.1676826, 0.9314522, -0.7476923, 0, 1, 0.627451, 1,
-0.162623, -1.038068, -3.252246, 0, 1, 0.6352941, 1,
-0.160035, -2.021236, -2.854499, 0, 1, 0.6392157, 1,
-0.1577643, 0.1419109, 0.2769821, 0, 1, 0.6470588, 1,
-0.155472, -0.0789753, -1.53006, 0, 1, 0.6509804, 1,
-0.1525843, 0.2030599, -2.145278, 0, 1, 0.6588235, 1,
-0.1512316, 0.619954, -1.624248, 0, 1, 0.6627451, 1,
-0.1510544, -0.5330149, -3.210469, 0, 1, 0.6705883, 1,
-0.1374093, 1.722032, -1.453964, 0, 1, 0.6745098, 1,
-0.1369089, 0.2886642, -0.5780773, 0, 1, 0.682353, 1,
-0.1317157, -1.423055, -2.631677, 0, 1, 0.6862745, 1,
-0.1304644, -1.229315, -2.313707, 0, 1, 0.6941177, 1,
-0.1294308, -1.054878, -2.714891, 0, 1, 0.7019608, 1,
-0.1293866, -2.172929, -3.316365, 0, 1, 0.7058824, 1,
-0.1269843, -0.5912278, -3.371516, 0, 1, 0.7137255, 1,
-0.1224449, 0.900914, 0.9952724, 0, 1, 0.7176471, 1,
-0.1205158, -1.735667, -3.491861, 0, 1, 0.7254902, 1,
-0.1199495, -0.9819476, -3.182667, 0, 1, 0.7294118, 1,
-0.1186304, -0.9505355, -2.823417, 0, 1, 0.7372549, 1,
-0.1175616, -0.2623775, -2.576866, 0, 1, 0.7411765, 1,
-0.1141119, 1.870452, -1.233265, 0, 1, 0.7490196, 1,
-0.1130646, 0.3216558, 0.4905261, 0, 1, 0.7529412, 1,
-0.11007, 0.9281921, -0.8900255, 0, 1, 0.7607843, 1,
-0.1053709, -0.7692587, -2.679441, 0, 1, 0.7647059, 1,
-0.1022421, -0.7068719, -3.696435, 0, 1, 0.772549, 1,
-0.1003592, 1.458794, 1.250714, 0, 1, 0.7764706, 1,
-0.09899688, -0.1984701, -3.252098, 0, 1, 0.7843137, 1,
-0.09800229, -1.834034, -3.314494, 0, 1, 0.7882353, 1,
-0.09367238, -0.8344052, -1.851995, 0, 1, 0.7960784, 1,
-0.08996449, 0.4673053, 1.748247, 0, 1, 0.8039216, 1,
-0.08834404, -1.886982, -3.679836, 0, 1, 0.8078431, 1,
-0.08580488, 1.493841, -0.8844183, 0, 1, 0.8156863, 1,
-0.08536319, 0.7689936, -0.6834605, 0, 1, 0.8196079, 1,
-0.08502432, -0.04112798, -0.3026357, 0, 1, 0.827451, 1,
-0.08482025, 0.3386338, 0.3801561, 0, 1, 0.8313726, 1,
-0.08209906, 0.2720349, 0.3803425, 0, 1, 0.8392157, 1,
-0.08191568, 0.832061, -0.2079123, 0, 1, 0.8431373, 1,
-0.08183556, 0.7501537, -0.7859302, 0, 1, 0.8509804, 1,
-0.08131141, -0.8100443, -2.253886, 0, 1, 0.854902, 1,
-0.0804835, -1.111982, -2.363816, 0, 1, 0.8627451, 1,
-0.07847182, -0.09390395, -4.452466, 0, 1, 0.8666667, 1,
-0.07620697, 0.914233, -2.292967, 0, 1, 0.8745098, 1,
-0.07616231, -0.8303342, -2.85864, 0, 1, 0.8784314, 1,
-0.07392518, 1.84798, -3.771781, 0, 1, 0.8862745, 1,
-0.07068198, -0.8452053, -3.446146, 0, 1, 0.8901961, 1,
-0.06887003, 0.07559579, -0.6828899, 0, 1, 0.8980392, 1,
-0.06403907, -0.7572227, -2.630215, 0, 1, 0.9058824, 1,
-0.05906417, 1.271968, 0.3219706, 0, 1, 0.9098039, 1,
-0.05575421, -0.7237874, -0.4266279, 0, 1, 0.9176471, 1,
-0.05352562, 2.123759, -1.355002, 0, 1, 0.9215686, 1,
-0.05321779, -0.142869, -3.237563, 0, 1, 0.9294118, 1,
-0.0523296, 1.453535, -1.214006, 0, 1, 0.9333333, 1,
-0.04845991, -2.295863, -2.570288, 0, 1, 0.9411765, 1,
-0.04827391, -0.4670361, -2.902347, 0, 1, 0.945098, 1,
-0.04591994, -0.799904, -4.004323, 0, 1, 0.9529412, 1,
-0.04591426, 0.4673196, 0.4351152, 0, 1, 0.9568627, 1,
-0.04506252, -0.4185962, -3.182395, 0, 1, 0.9647059, 1,
-0.04278669, 0.6738361, -1.283484, 0, 1, 0.9686275, 1,
-0.04116633, -1.267967, -2.834677, 0, 1, 0.9764706, 1,
-0.03830723, -0.7578824, -3.264182, 0, 1, 0.9803922, 1,
-0.037761, -1.480409, -2.772545, 0, 1, 0.9882353, 1,
-0.03384044, -0.04222314, -1.513507, 0, 1, 0.9921569, 1,
-0.032517, 0.04951729, -0.4109315, 0, 1, 1, 1,
-0.02789171, -1.045267, -1.815345, 0, 0.9921569, 1, 1,
-0.02534616, -1.091533, -4.602434, 0, 0.9882353, 1, 1,
-0.01981657, 0.8858333, 1.703294, 0, 0.9803922, 1, 1,
-0.01703718, -0.4101551, -3.151445, 0, 0.9764706, 1, 1,
-0.01597129, -1.122905, -1.38852, 0, 0.9686275, 1, 1,
-0.01540699, 0.8606921, -1.281906, 0, 0.9647059, 1, 1,
-0.01480663, 1.159221, 1.263833, 0, 0.9568627, 1, 1,
-0.01056234, -1.044637, -2.674451, 0, 0.9529412, 1, 1,
-0.007948663, 1.240455, -0.07320017, 0, 0.945098, 1, 1,
-0.005649577, -1.749613, -3.507123, 0, 0.9411765, 1, 1,
0.002262678, -2.362252, 2.318455, 0, 0.9333333, 1, 1,
0.008482854, 2.145618, 0.9636416, 0, 0.9294118, 1, 1,
0.01467525, -1.856819, 3.180096, 0, 0.9215686, 1, 1,
0.01743908, 0.002326949, 2.029249, 0, 0.9176471, 1, 1,
0.02032704, 0.7595195, -0.7814736, 0, 0.9098039, 1, 1,
0.02170235, -1.138915, 2.076246, 0, 0.9058824, 1, 1,
0.03116026, 0.140249, 0.6641768, 0, 0.8980392, 1, 1,
0.03741238, -1.166184, 1.541377, 0, 0.8901961, 1, 1,
0.04259997, 0.8961402, 0.9086317, 0, 0.8862745, 1, 1,
0.04687774, 0.2268947, 0.2404255, 0, 0.8784314, 1, 1,
0.04807524, 0.6106306, 0.4379182, 0, 0.8745098, 1, 1,
0.04900265, -1.17104, 3.190951, 0, 0.8666667, 1, 1,
0.05654744, -1.019834, 2.373468, 0, 0.8627451, 1, 1,
0.05732336, -0.9091155, 2.563562, 0, 0.854902, 1, 1,
0.06608935, 0.7466328, 0.9262272, 0, 0.8509804, 1, 1,
0.06877773, 1.05292, -1.238328, 0, 0.8431373, 1, 1,
0.06959786, 1.353462, 1.032135, 0, 0.8392157, 1, 1,
0.07458849, -1.858626, 1.763286, 0, 0.8313726, 1, 1,
0.07643095, -1.76273, 1.873182, 0, 0.827451, 1, 1,
0.07824744, 0.3537869, 1.19295, 0, 0.8196079, 1, 1,
0.08376812, 0.004308671, 2.636088, 0, 0.8156863, 1, 1,
0.08415174, 1.816959, -2.005591, 0, 0.8078431, 1, 1,
0.08598952, -0.8350859, 2.173717, 0, 0.8039216, 1, 1,
0.08707558, -0.2106752, 1.656398, 0, 0.7960784, 1, 1,
0.0899931, 1.209261, -1.638845, 0, 0.7882353, 1, 1,
0.09032782, 1.32577, -1.261577, 0, 0.7843137, 1, 1,
0.09246995, 0.5161041, -1.32446, 0, 0.7764706, 1, 1,
0.0932336, -0.8190721, 3.371408, 0, 0.772549, 1, 1,
0.09505172, -0.2084845, 2.796865, 0, 0.7647059, 1, 1,
0.1017113, -0.3905373, 3.322116, 0, 0.7607843, 1, 1,
0.1057434, 2.216197, 0.1836566, 0, 0.7529412, 1, 1,
0.1067713, 1.11787, 0.6677706, 0, 0.7490196, 1, 1,
0.1091443, 1.654289, 1.941085, 0, 0.7411765, 1, 1,
0.1097902, 1.270985, -0.1975564, 0, 0.7372549, 1, 1,
0.1211866, -1.101557, 4.799919, 0, 0.7294118, 1, 1,
0.1240004, 0.7008653, 0.6116687, 0, 0.7254902, 1, 1,
0.1291863, 0.229376, 0.2951254, 0, 0.7176471, 1, 1,
0.1305741, 0.523614, -0.2892904, 0, 0.7137255, 1, 1,
0.1324155, 0.8747596, 0.8866712, 0, 0.7058824, 1, 1,
0.1335373, -2.023881, 2.938375, 0, 0.6980392, 1, 1,
0.1355557, -1.027931, 1.749155, 0, 0.6941177, 1, 1,
0.1461825, -0.7287364, 2.659825, 0, 0.6862745, 1, 1,
0.1471587, -1.392431, 2.297697, 0, 0.682353, 1, 1,
0.1479338, 1.094921, 0.03639006, 0, 0.6745098, 1, 1,
0.1550728, 0.8735719, -1.210557, 0, 0.6705883, 1, 1,
0.1604258, 0.3188516, -0.06849579, 0, 0.6627451, 1, 1,
0.1614682, -1.154322, 3.494807, 0, 0.6588235, 1, 1,
0.162593, 1.136542, 1.073881, 0, 0.6509804, 1, 1,
0.163899, 1.782867, 2.139816, 0, 0.6470588, 1, 1,
0.1642219, 0.2949658, -1.608699, 0, 0.6392157, 1, 1,
0.1706415, -0.3916721, 2.352325, 0, 0.6352941, 1, 1,
0.17103, 0.8226707, -1.174408, 0, 0.627451, 1, 1,
0.1796373, -1.163306, 4.374348, 0, 0.6235294, 1, 1,
0.1811111, -0.2534497, 1.787427, 0, 0.6156863, 1, 1,
0.1813491, -0.3255018, 3.707104, 0, 0.6117647, 1, 1,
0.183933, -0.5464198, 2.505036, 0, 0.6039216, 1, 1,
0.1844828, 1.034468, -1.183532, 0, 0.5960785, 1, 1,
0.1873738, 1.140047, -0.895326, 0, 0.5921569, 1, 1,
0.1892096, 0.4008808, 0.9012224, 0, 0.5843138, 1, 1,
0.1910822, -0.8329823, 3.548602, 0, 0.5803922, 1, 1,
0.1937059, -0.2345242, 1.979226, 0, 0.572549, 1, 1,
0.1953019, -0.7786778, 3.688488, 0, 0.5686275, 1, 1,
0.1973225, 1.154271, 0.94771, 0, 0.5607843, 1, 1,
0.1984067, 1.556954, 0.3684092, 0, 0.5568628, 1, 1,
0.1986709, 0.1551678, 0.9348241, 0, 0.5490196, 1, 1,
0.211271, -1.028939, 5.714748, 0, 0.5450981, 1, 1,
0.2157256, 0.6631163, -0.1220177, 0, 0.5372549, 1, 1,
0.2180631, 0.1189847, 0.8797407, 0, 0.5333334, 1, 1,
0.2183878, -0.5441775, 2.53842, 0, 0.5254902, 1, 1,
0.2218615, 0.3612863, 1.653906, 0, 0.5215687, 1, 1,
0.2246726, -1.486049, 1.826989, 0, 0.5137255, 1, 1,
0.2260032, 1.754439, -1.708427, 0, 0.509804, 1, 1,
0.2345626, 0.01978085, 2.264997, 0, 0.5019608, 1, 1,
0.2370451, 0.7164643, 1.063047, 0, 0.4941176, 1, 1,
0.2379792, -1.083981, 3.430434, 0, 0.4901961, 1, 1,
0.2382733, 0.02863007, 0.216159, 0, 0.4823529, 1, 1,
0.2388514, -0.111891, 4.339723, 0, 0.4784314, 1, 1,
0.2400044, 0.229093, -0.135781, 0, 0.4705882, 1, 1,
0.2409357, 0.7807316, -0.9321675, 0, 0.4666667, 1, 1,
0.2411983, -0.3943691, 0.3790784, 0, 0.4588235, 1, 1,
0.2434238, 1.10131, 1.065675, 0, 0.454902, 1, 1,
0.247405, -0.606252, 2.9803, 0, 0.4470588, 1, 1,
0.2475808, -0.3896919, 3.302096, 0, 0.4431373, 1, 1,
0.2484397, 1.102712, 2.93261, 0, 0.4352941, 1, 1,
0.2543493, 1.212474, -0.9739408, 0, 0.4313726, 1, 1,
0.2565415, -1.801391, 2.739611, 0, 0.4235294, 1, 1,
0.2578145, 0.6795174, 1.942701, 0, 0.4196078, 1, 1,
0.263888, 0.6710466, 0.8310434, 0, 0.4117647, 1, 1,
0.2657218, 0.009264925, 3.377498, 0, 0.4078431, 1, 1,
0.2706871, 0.9870308, 0.8004395, 0, 0.4, 1, 1,
0.271429, 0.6757727, 1.574217, 0, 0.3921569, 1, 1,
0.2745986, -1.311086, 2.678788, 0, 0.3882353, 1, 1,
0.27622, -0.5714325, 2.313038, 0, 0.3803922, 1, 1,
0.2791181, 0.1864665, 0.8758803, 0, 0.3764706, 1, 1,
0.2821763, 0.7777632, -0.1102324, 0, 0.3686275, 1, 1,
0.2836874, -1.387567, 2.995671, 0, 0.3647059, 1, 1,
0.2875581, -1.293165, 3.632113, 0, 0.3568628, 1, 1,
0.2885923, -1.764472, 3.99071, 0, 0.3529412, 1, 1,
0.2918375, -0.8246561, 3.683259, 0, 0.345098, 1, 1,
0.295042, -0.8276647, 2.020322, 0, 0.3411765, 1, 1,
0.3058204, 0.9964574, -0.4317749, 0, 0.3333333, 1, 1,
0.3078672, 0.4685381, -0.4051265, 0, 0.3294118, 1, 1,
0.3079869, 1.701903, -0.9217393, 0, 0.3215686, 1, 1,
0.3080218, -0.9877727, 1.724819, 0, 0.3176471, 1, 1,
0.3122622, 0.08566439, 0.34986, 0, 0.3098039, 1, 1,
0.321175, -0.6220075, 2.913612, 0, 0.3058824, 1, 1,
0.3234282, 0.3242967, 0.2067782, 0, 0.2980392, 1, 1,
0.3256636, 1.147639, -0.408762, 0, 0.2901961, 1, 1,
0.3269534, -1.350583, 3.313255, 0, 0.2862745, 1, 1,
0.3283577, 1.676532, -0.09645275, 0, 0.2784314, 1, 1,
0.3294085, -0.6648521, 3.34938, 0, 0.2745098, 1, 1,
0.3314989, -1.512708, 4.743011, 0, 0.2666667, 1, 1,
0.3321099, -0.7078077, 3.192036, 0, 0.2627451, 1, 1,
0.3330054, -1.125104, 5.136054, 0, 0.254902, 1, 1,
0.3369448, 1.403829, 0.4649583, 0, 0.2509804, 1, 1,
0.3396146, -0.2456883, 2.068243, 0, 0.2431373, 1, 1,
0.3410016, -0.6694578, 1.652459, 0, 0.2392157, 1, 1,
0.3437711, 0.09068777, 1.382754, 0, 0.2313726, 1, 1,
0.3453114, 0.6616291, -0.369707, 0, 0.227451, 1, 1,
0.3505071, 2.082943, 2.373913, 0, 0.2196078, 1, 1,
0.3543604, 0.681465, -0.6394487, 0, 0.2156863, 1, 1,
0.3549905, 0.5906898, 1.487582, 0, 0.2078431, 1, 1,
0.3626732, -2.363894, 2.369328, 0, 0.2039216, 1, 1,
0.3647898, 1.854647, -0.8433679, 0, 0.1960784, 1, 1,
0.3699981, -0.3724023, 3.063945, 0, 0.1882353, 1, 1,
0.3758484, 1.508991, 0.1460845, 0, 0.1843137, 1, 1,
0.3896802, 0.8411396, 2.065936, 0, 0.1764706, 1, 1,
0.3925428, -0.04206495, 2.57281, 0, 0.172549, 1, 1,
0.3949753, -0.1945547, 1.846601, 0, 0.1647059, 1, 1,
0.3989979, 1.394407, 0.9752045, 0, 0.1607843, 1, 1,
0.4006816, 1.394533, 0.1741671, 0, 0.1529412, 1, 1,
0.401532, 0.73542, 0.378176, 0, 0.1490196, 1, 1,
0.4018291, 0.02758251, 1.620067, 0, 0.1411765, 1, 1,
0.4039817, -1.6293, 2.659548, 0, 0.1372549, 1, 1,
0.4099575, 1.919386, 1.377509, 0, 0.1294118, 1, 1,
0.4221533, 0.03511989, 0.6172712, 0, 0.1254902, 1, 1,
0.4225738, 1.717619, 1.862448, 0, 0.1176471, 1, 1,
0.4289735, -0.4291926, 4.804386, 0, 0.1137255, 1, 1,
0.4289794, -0.7585248, 1.734531, 0, 0.1058824, 1, 1,
0.4292761, -1.852626, 1.946282, 0, 0.09803922, 1, 1,
0.4361407, 0.5616353, -1.894662, 0, 0.09411765, 1, 1,
0.4362583, -0.210052, 2.284082, 0, 0.08627451, 1, 1,
0.436275, 0.9558013, 1.049639, 0, 0.08235294, 1, 1,
0.4367174, 1.69274, 0.3055337, 0, 0.07450981, 1, 1,
0.4406135, -1.129054, 2.112961, 0, 0.07058824, 1, 1,
0.4416828, 2.014129, -0.534519, 0, 0.0627451, 1, 1,
0.443253, 1.649428, 1.857132, 0, 0.05882353, 1, 1,
0.4449212, -0.4059126, 3.144933, 0, 0.05098039, 1, 1,
0.4496732, -0.8099407, 1.830698, 0, 0.04705882, 1, 1,
0.4569383, 1.051753, -1.345712, 0, 0.03921569, 1, 1,
0.4572005, 0.1206384, 0.8943248, 0, 0.03529412, 1, 1,
0.4599413, 1.85868, 0.291029, 0, 0.02745098, 1, 1,
0.4617452, 0.8643325, 1.376533, 0, 0.02352941, 1, 1,
0.4630071, 0.3227821, 0.5992414, 0, 0.01568628, 1, 1,
0.4656782, -0.7398046, 2.782506, 0, 0.01176471, 1, 1,
0.4691299, -0.6010278, 1.628016, 0, 0.003921569, 1, 1,
0.4714757, -0.1691607, 0.8961208, 0.003921569, 0, 1, 1,
0.47346, 0.4136147, 1.481154, 0.007843138, 0, 1, 1,
0.4837434, 1.587553, -1.357366, 0.01568628, 0, 1, 1,
0.485843, -0.1339613, 2.078803, 0.01960784, 0, 1, 1,
0.4871339, 0.4297551, 2.359218, 0.02745098, 0, 1, 1,
0.490638, 0.6352181, 1.111338, 0.03137255, 0, 1, 1,
0.4946581, 1.661081, 0.3694154, 0.03921569, 0, 1, 1,
0.4962565, -1.095861, 0.8470545, 0.04313726, 0, 1, 1,
0.4974895, -1.081462, 1.934703, 0.05098039, 0, 1, 1,
0.5095249, -0.2713159, 2.353618, 0.05490196, 0, 1, 1,
0.5106518, 1.905636, -0.487603, 0.0627451, 0, 1, 1,
0.5114812, -0.679, 2.303622, 0.06666667, 0, 1, 1,
0.5140489, -1.640375, 2.872273, 0.07450981, 0, 1, 1,
0.5194764, -1.198109, 2.675788, 0.07843138, 0, 1, 1,
0.5201519, -0.2959516, 2.652934, 0.08627451, 0, 1, 1,
0.5217752, -0.6748764, 2.346257, 0.09019608, 0, 1, 1,
0.5225166, 1.1875, 0.424736, 0.09803922, 0, 1, 1,
0.5241683, -0.9922687, 3.725574, 0.1058824, 0, 1, 1,
0.5243471, -0.08707515, 1.436682, 0.1098039, 0, 1, 1,
0.526448, -0.451348, 2.258984, 0.1176471, 0, 1, 1,
0.5353183, -0.5900889, 2.107536, 0.1215686, 0, 1, 1,
0.5423838, -1.398188, 2.628124, 0.1294118, 0, 1, 1,
0.5424241, -0.6444917, 1.997219, 0.1333333, 0, 1, 1,
0.5433458, 0.2360675, -0.02585927, 0.1411765, 0, 1, 1,
0.5450194, -0.5817714, 1.683492, 0.145098, 0, 1, 1,
0.5471046, 1.085994, 0.3089601, 0.1529412, 0, 1, 1,
0.5540502, -0.01853598, 0.774376, 0.1568628, 0, 1, 1,
0.5563318, 0.6434755, 0.6639663, 0.1647059, 0, 1, 1,
0.5572775, -0.2776159, 2.523336, 0.1686275, 0, 1, 1,
0.5573385, 0.04789333, 0.82019, 0.1764706, 0, 1, 1,
0.5583674, 1.811464, -0.4839852, 0.1803922, 0, 1, 1,
0.5629179, 0.3780279, 1.274747, 0.1882353, 0, 1, 1,
0.5677964, 1.682646, 1.220555, 0.1921569, 0, 1, 1,
0.5687584, -0.3906475, 0.770094, 0.2, 0, 1, 1,
0.5702696, -0.4413963, 2.445969, 0.2078431, 0, 1, 1,
0.5736413, -2.099948, 3.167252, 0.2117647, 0, 1, 1,
0.577418, -0.2306086, 1.795831, 0.2196078, 0, 1, 1,
0.5891441, -0.3600336, 2.357929, 0.2235294, 0, 1, 1,
0.5895325, 0.9707568, -0.04775138, 0.2313726, 0, 1, 1,
0.6051617, 2.194931, 0.9286213, 0.2352941, 0, 1, 1,
0.6083901, 0.6731941, 2.424282, 0.2431373, 0, 1, 1,
0.6123672, 0.06604689, 2.099057, 0.2470588, 0, 1, 1,
0.615343, -0.6184065, 4.356524, 0.254902, 0, 1, 1,
0.6174179, -1.156708, 1.567668, 0.2588235, 0, 1, 1,
0.6189738, -0.6151363, 2.289628, 0.2666667, 0, 1, 1,
0.6201381, 0.6125834, 0.2706303, 0.2705882, 0, 1, 1,
0.6261634, 0.6124303, 1.839915, 0.2784314, 0, 1, 1,
0.6320536, 1.575886, 2.022889, 0.282353, 0, 1, 1,
0.6321916, -1.301355, 1.357799, 0.2901961, 0, 1, 1,
0.6370977, -0.2681113, 3.224501, 0.2941177, 0, 1, 1,
0.6415841, 0.2636295, 0.6393883, 0.3019608, 0, 1, 1,
0.6446452, -1.495822, 1.134083, 0.3098039, 0, 1, 1,
0.6499129, -2.588189, 3.676201, 0.3137255, 0, 1, 1,
0.6508412, 2.325672, -0.930522, 0.3215686, 0, 1, 1,
0.6510953, -1.109748, 2.409501, 0.3254902, 0, 1, 1,
0.6529161, 0.6746984, 1.875116, 0.3333333, 0, 1, 1,
0.6538556, -0.2813346, 3.710686, 0.3372549, 0, 1, 1,
0.6558921, -0.2372887, 1.143033, 0.345098, 0, 1, 1,
0.656099, 0.3085404, 0.7592288, 0.3490196, 0, 1, 1,
0.6571891, -1.206057, 2.330281, 0.3568628, 0, 1, 1,
0.6595173, -0.210838, 3.34612, 0.3607843, 0, 1, 1,
0.6620382, 0.771309, 1.678314, 0.3686275, 0, 1, 1,
0.66284, -0.03425972, 2.608105, 0.372549, 0, 1, 1,
0.6658493, -0.4727125, 2.012527, 0.3803922, 0, 1, 1,
0.6669239, -0.8593653, 2.108701, 0.3843137, 0, 1, 1,
0.6676359, -0.7497379, 2.326948, 0.3921569, 0, 1, 1,
0.6727533, 0.7356678, 1.305444, 0.3960784, 0, 1, 1,
0.6761332, -1.21235, 4.182988, 0.4039216, 0, 1, 1,
0.6778024, -0.4852403, 2.34976, 0.4117647, 0, 1, 1,
0.6781981, 0.04281085, 1.718483, 0.4156863, 0, 1, 1,
0.6837261, -0.4033824, 1.805777, 0.4235294, 0, 1, 1,
0.6842039, -0.2804773, 1.450155, 0.427451, 0, 1, 1,
0.6855601, -2.230128, 2.924242, 0.4352941, 0, 1, 1,
0.6917488, 0.6143567, 0.2903404, 0.4392157, 0, 1, 1,
0.6918951, -2.022494, 2.467754, 0.4470588, 0, 1, 1,
0.695078, 0.3580264, 2.29163, 0.4509804, 0, 1, 1,
0.6956905, -0.0156522, 3.009413, 0.4588235, 0, 1, 1,
0.6961016, 0.8465611, 0.1574209, 0.4627451, 0, 1, 1,
0.7069733, 1.855879, 1.027208, 0.4705882, 0, 1, 1,
0.7153227, -1.409523, 5.111482, 0.4745098, 0, 1, 1,
0.7174015, 1.159711, 1.23533, 0.4823529, 0, 1, 1,
0.7183919, 0.02977006, 1.916595, 0.4862745, 0, 1, 1,
0.7239181, 1.579823, -0.2850808, 0.4941176, 0, 1, 1,
0.7255712, -0.3697743, 2.3911, 0.5019608, 0, 1, 1,
0.7262146, -4.569224, 4.565293, 0.5058824, 0, 1, 1,
0.7308314, -0.8156937, 1.497787, 0.5137255, 0, 1, 1,
0.7316999, 0.02109884, 1.75517, 0.5176471, 0, 1, 1,
0.7337509, 0.9778726, 0.4338174, 0.5254902, 0, 1, 1,
0.735819, 0.3835749, 0.7607239, 0.5294118, 0, 1, 1,
0.7483146, 0.2196546, 0.5298898, 0.5372549, 0, 1, 1,
0.7494642, 1.021825, 1.920694, 0.5411765, 0, 1, 1,
0.7498717, -0.1839234, 2.027735, 0.5490196, 0, 1, 1,
0.7531323, -1.289646, 2.833861, 0.5529412, 0, 1, 1,
0.7542844, -1.529505, 1.084279, 0.5607843, 0, 1, 1,
0.7545695, -0.3219673, 3.19993, 0.5647059, 0, 1, 1,
0.7564833, 1.022079, 0.9783725, 0.572549, 0, 1, 1,
0.7583559, 0.2313992, 1.559803, 0.5764706, 0, 1, 1,
0.7592148, 0.3894922, 3.079354, 0.5843138, 0, 1, 1,
0.7656555, -1.206076, 1.429929, 0.5882353, 0, 1, 1,
0.7689067, -1.471058, 1.763675, 0.5960785, 0, 1, 1,
0.7834207, -1.537599, 1.619242, 0.6039216, 0, 1, 1,
0.783506, -1.231024, 4.287406, 0.6078432, 0, 1, 1,
0.7887239, -0.1014847, 2.125888, 0.6156863, 0, 1, 1,
0.8008142, -0.3593053, 1.709669, 0.6196079, 0, 1, 1,
0.8015549, 0.613074, 1.564775, 0.627451, 0, 1, 1,
0.8056276, 0.6524286, 3.008953, 0.6313726, 0, 1, 1,
0.8072864, -0.1694424, 1.624998, 0.6392157, 0, 1, 1,
0.8079123, 2.722136, -0.2539546, 0.6431373, 0, 1, 1,
0.811448, 0.3113924, -0.432621, 0.6509804, 0, 1, 1,
0.8135599, -0.7531293, 2.786436, 0.654902, 0, 1, 1,
0.8151969, -3.676802, 2.797944, 0.6627451, 0, 1, 1,
0.817317, 0.5461766, 1.705426, 0.6666667, 0, 1, 1,
0.8194886, 0.4901594, 1.293606, 0.6745098, 0, 1, 1,
0.8208037, -1.139796, 4.042076, 0.6784314, 0, 1, 1,
0.8219733, 0.6926746, -0.007317994, 0.6862745, 0, 1, 1,
0.8255002, 0.5512801, 3.180415, 0.6901961, 0, 1, 1,
0.8273824, 0.5301384, 0.2739537, 0.6980392, 0, 1, 1,
0.8278068, -1.360722, 2.772746, 0.7058824, 0, 1, 1,
0.829313, -1.310579, 3.477772, 0.7098039, 0, 1, 1,
0.830287, -0.7512077, 4.620398, 0.7176471, 0, 1, 1,
0.8315786, 0.8907956, 0.4468185, 0.7215686, 0, 1, 1,
0.832122, -0.9762621, 4.136173, 0.7294118, 0, 1, 1,
0.8333727, 0.6466327, 0.0689821, 0.7333333, 0, 1, 1,
0.8339472, 0.6200874, 0.6507704, 0.7411765, 0, 1, 1,
0.8342859, 1.91001, -0.7331322, 0.7450981, 0, 1, 1,
0.8475246, 0.09981996, 0.1603123, 0.7529412, 0, 1, 1,
0.8504609, 2.628416, 2.608787, 0.7568628, 0, 1, 1,
0.8507868, 0.007776138, 2.658645, 0.7647059, 0, 1, 1,
0.8543775, -0.1547643, -1.050584, 0.7686275, 0, 1, 1,
0.8555824, 1.783849, 1.757622, 0.7764706, 0, 1, 1,
0.8564189, -0.919401, 2.244581, 0.7803922, 0, 1, 1,
0.8732551, 0.4464266, 1.439788, 0.7882353, 0, 1, 1,
0.8797309, -0.4185191, 2.283216, 0.7921569, 0, 1, 1,
0.8911088, -0.06215462, -0.8406207, 0.8, 0, 1, 1,
0.8971816, 0.0007111182, 1.248856, 0.8078431, 0, 1, 1,
0.9007587, 0.4871024, 1.254065, 0.8117647, 0, 1, 1,
0.9036511, 0.2078374, 1.300751, 0.8196079, 0, 1, 1,
0.9064025, -0.1054778, 0.1758541, 0.8235294, 0, 1, 1,
0.9092056, -1.03936, 3.281624, 0.8313726, 0, 1, 1,
0.9123873, -0.5427474, 1.644675, 0.8352941, 0, 1, 1,
0.9261903, 0.8566414, 0.05638523, 0.8431373, 0, 1, 1,
0.9262476, 1.190824, 0.2858506, 0.8470588, 0, 1, 1,
0.9263422, 0.6344157, 0.4246823, 0.854902, 0, 1, 1,
0.9274376, -0.244044, 1.252838, 0.8588235, 0, 1, 1,
0.9300435, 1.268589, 1.250625, 0.8666667, 0, 1, 1,
0.9325223, -0.4142702, 3.552936, 0.8705882, 0, 1, 1,
0.9391518, -1.343348, 1.805897, 0.8784314, 0, 1, 1,
0.9420123, -0.5430348, 0.1768959, 0.8823529, 0, 1, 1,
0.9560443, 0.05165528, 2.690721, 0.8901961, 0, 1, 1,
0.9629424, -1.311474, 3.446685, 0.8941177, 0, 1, 1,
0.9640082, -1.033381, 2.00665, 0.9019608, 0, 1, 1,
0.9678105, -1.11338, 2.850637, 0.9098039, 0, 1, 1,
0.9715449, 0.5507554, 1.661995, 0.9137255, 0, 1, 1,
0.9729463, -1.295057, 3.520608, 0.9215686, 0, 1, 1,
0.9766116, -0.05312989, 2.772511, 0.9254902, 0, 1, 1,
0.982144, -0.3008702, 0.3395936, 0.9333333, 0, 1, 1,
0.9838066, 1.70153, -0.1446577, 0.9372549, 0, 1, 1,
0.9853886, 0.7434961, -0.03048515, 0.945098, 0, 1, 1,
0.9905347, 0.113448, 1.046917, 0.9490196, 0, 1, 1,
0.9908412, -0.09890288, 0.730644, 0.9568627, 0, 1, 1,
0.9927909, -0.3858776, 3.566318, 0.9607843, 0, 1, 1,
1.000816, -0.4366924, 2.131437, 0.9686275, 0, 1, 1,
1.011441, 1.864919, 2.32412, 0.972549, 0, 1, 1,
1.011688, 0.777938, 1.232074, 0.9803922, 0, 1, 1,
1.025117, -2.313221, 2.979996, 0.9843137, 0, 1, 1,
1.028061, -0.3203003, 4.071856, 0.9921569, 0, 1, 1,
1.031673, 1.509949, 1.455863, 0.9960784, 0, 1, 1,
1.03685, -0.171877, -0.05865011, 1, 0, 0.9960784, 1,
1.037773, -0.07202812, 4.051253, 1, 0, 0.9882353, 1,
1.039765, 0.8043718, 0.9098347, 1, 0, 0.9843137, 1,
1.041744, -1.368516, 3.303548, 1, 0, 0.9764706, 1,
1.044279, 0.5791482, 2.52419, 1, 0, 0.972549, 1,
1.0448, -1.149078, 2.727898, 1, 0, 0.9647059, 1,
1.054002, 1.105262, 1.247804, 1, 0, 0.9607843, 1,
1.059789, 0.7592009, 1.977051, 1, 0, 0.9529412, 1,
1.066296, 0.02887488, 2.700144, 1, 0, 0.9490196, 1,
1.068571, -0.8892436, 1.007564, 1, 0, 0.9411765, 1,
1.070079, 1.185375, 0.4045695, 1, 0, 0.9372549, 1,
1.075679, -1.073554, 1.800428, 1, 0, 0.9294118, 1,
1.078959, 1.626613, -0.4853933, 1, 0, 0.9254902, 1,
1.080732, 0.004913662, 0.2071705, 1, 0, 0.9176471, 1,
1.081733, -2.014288, 2.182132, 1, 0, 0.9137255, 1,
1.081934, 1.276884, 0.1496221, 1, 0, 0.9058824, 1,
1.089634, -0.9478104, 4.206437, 1, 0, 0.9019608, 1,
1.098128, -0.3874644, 1.570297, 1, 0, 0.8941177, 1,
1.098358, 1.310068, 3.539254, 1, 0, 0.8862745, 1,
1.098788, -0.4949691, 1.056461, 1, 0, 0.8823529, 1,
1.101472, -1.002037, 3.637945, 1, 0, 0.8745098, 1,
1.111054, 1.062801, 1.522323, 1, 0, 0.8705882, 1,
1.118656, 1.093383, 0.3178759, 1, 0, 0.8627451, 1,
1.120356, 0.1379517, 0.9680071, 1, 0, 0.8588235, 1,
1.129477, 1.245443, 0.6284139, 1, 0, 0.8509804, 1,
1.131296, -1.121418, 1.570425, 1, 0, 0.8470588, 1,
1.137756, -0.4427805, 1.737567, 1, 0, 0.8392157, 1,
1.149881, -0.1329923, 1.372455, 1, 0, 0.8352941, 1,
1.152, 2.767982, 0.530788, 1, 0, 0.827451, 1,
1.163471, 0.6483495, 1.624259, 1, 0, 0.8235294, 1,
1.166047, -0.5026807, 1.656949, 1, 0, 0.8156863, 1,
1.177719, -0.387315, 0.02309265, 1, 0, 0.8117647, 1,
1.180477, 0.3048392, 1.24335, 1, 0, 0.8039216, 1,
1.187751, -0.2592371, 2.313173, 1, 0, 0.7960784, 1,
1.216566, -0.08228242, 1.741433, 1, 0, 0.7921569, 1,
1.220112, -1.177839, 1.228501, 1, 0, 0.7843137, 1,
1.22038, -1.375865, 0.7918709, 1, 0, 0.7803922, 1,
1.221358, 2.443974, -1.275888, 1, 0, 0.772549, 1,
1.228302, -0.6241106, 2.683729, 1, 0, 0.7686275, 1,
1.228942, -0.4542497, 1.360618, 1, 0, 0.7607843, 1,
1.235174, -0.006700777, 0.6557757, 1, 0, 0.7568628, 1,
1.244646, -1.107993, 2.960746, 1, 0, 0.7490196, 1,
1.248087, -0.09544844, 1.114947, 1, 0, 0.7450981, 1,
1.257091, 0.05186995, 1.314206, 1, 0, 0.7372549, 1,
1.258438, 0.02318619, 0.227157, 1, 0, 0.7333333, 1,
1.259761, 1.629068, 0.8097044, 1, 0, 0.7254902, 1,
1.26005, 0.1256232, 2.762874, 1, 0, 0.7215686, 1,
1.26008, -0.9558315, 0.2608277, 1, 0, 0.7137255, 1,
1.26994, -3.274111, 4.662135, 1, 0, 0.7098039, 1,
1.27715, -1.470319, 0.6295362, 1, 0, 0.7019608, 1,
1.281979, 0.5574129, 1.89409, 1, 0, 0.6941177, 1,
1.284452, 0.8862438, 0.2170971, 1, 0, 0.6901961, 1,
1.287683, 0.6156971, 2.854139, 1, 0, 0.682353, 1,
1.293144, -1.143781, 2.963615, 1, 0, 0.6784314, 1,
1.294435, -0.3542798, 0.305464, 1, 0, 0.6705883, 1,
1.301655, 0.9747498, 0.972667, 1, 0, 0.6666667, 1,
1.302414, 0.8437845, 2.092643, 1, 0, 0.6588235, 1,
1.308797, 0.3600175, 0.224418, 1, 0, 0.654902, 1,
1.310662, 0.7821563, 0.9287504, 1, 0, 0.6470588, 1,
1.322428, 1.573276, 1.328034, 1, 0, 0.6431373, 1,
1.324881, -1.932539, 2.414969, 1, 0, 0.6352941, 1,
1.330116, 0.4282643, -0.4049265, 1, 0, 0.6313726, 1,
1.332316, 1.069504, 2.183628, 1, 0, 0.6235294, 1,
1.337694, 0.6624866, 1.18879, 1, 0, 0.6196079, 1,
1.341911, 0.5794926, 0.4262162, 1, 0, 0.6117647, 1,
1.342933, 0.6509159, 1.125608, 1, 0, 0.6078432, 1,
1.348089, -0.3601439, 1.237596, 1, 0, 0.6, 1,
1.350739, -1.592601, 1.22017, 1, 0, 0.5921569, 1,
1.354978, -0.6053686, 1.717975, 1, 0, 0.5882353, 1,
1.357862, 1.201097, 1.859362, 1, 0, 0.5803922, 1,
1.358082, -0.003923146, 0.3094166, 1, 0, 0.5764706, 1,
1.35944, -0.06064478, 1.319933, 1, 0, 0.5686275, 1,
1.361776, -0.3485249, 2.31721, 1, 0, 0.5647059, 1,
1.364731, -0.4184768, 0.7510287, 1, 0, 0.5568628, 1,
1.375185, -2.972558, 2.598848, 1, 0, 0.5529412, 1,
1.380397, -0.2527279, 2.859386, 1, 0, 0.5450981, 1,
1.383359, -0.5129508, 1.713777, 1, 0, 0.5411765, 1,
1.387856, 1.958757, -0.4616817, 1, 0, 0.5333334, 1,
1.387888, -0.3746004, 2.321934, 1, 0, 0.5294118, 1,
1.405595, 0.8068011, 1.899704, 1, 0, 0.5215687, 1,
1.412969, 1.773805, -0.2407725, 1, 0, 0.5176471, 1,
1.415772, -0.8868162, 1.170865, 1, 0, 0.509804, 1,
1.419656, 0.2416688, 1.812757, 1, 0, 0.5058824, 1,
1.419863, -0.8667088, 1.589555, 1, 0, 0.4980392, 1,
1.43159, -1.248075, 3.455168, 1, 0, 0.4901961, 1,
1.437651, 0.5355613, 0.9619987, 1, 0, 0.4862745, 1,
1.437863, 0.4640726, 2.338217, 1, 0, 0.4784314, 1,
1.438732, -0.3428901, 0.5969154, 1, 0, 0.4745098, 1,
1.465156, 1.257174, -0.7830933, 1, 0, 0.4666667, 1,
1.465211, 0.2409163, 1.906035, 1, 0, 0.4627451, 1,
1.474737, 0.5489492, 1.60411, 1, 0, 0.454902, 1,
1.485995, -0.9399616, 2.692071, 1, 0, 0.4509804, 1,
1.494076, -0.8625728, 0.8316563, 1, 0, 0.4431373, 1,
1.509362, -2.018206, 4.205894, 1, 0, 0.4392157, 1,
1.522617, -0.495424, 0.3684703, 1, 0, 0.4313726, 1,
1.526897, -0.7523009, 1.887829, 1, 0, 0.427451, 1,
1.527076, -0.242817, 3.204826, 1, 0, 0.4196078, 1,
1.538215, 2.452051, 2.273711, 1, 0, 0.4156863, 1,
1.538747, -1.53204, 3.05328, 1, 0, 0.4078431, 1,
1.550174, -1.588066, 3.633979, 1, 0, 0.4039216, 1,
1.55134, 0.8471146, 1.424701, 1, 0, 0.3960784, 1,
1.552986, 0.4845952, 1.804793, 1, 0, 0.3882353, 1,
1.568505, 0.6342358, 0.9937794, 1, 0, 0.3843137, 1,
1.583897, 0.7422838, -0.936569, 1, 0, 0.3764706, 1,
1.588574, -0.2883324, -0.5006751, 1, 0, 0.372549, 1,
1.596989, 0.05538928, 1.152962, 1, 0, 0.3647059, 1,
1.605546, 0.420002, 0.5318923, 1, 0, 0.3607843, 1,
1.6059, -0.6106014, 3.590016, 1, 0, 0.3529412, 1,
1.611604, 1.198665, 1.539036, 1, 0, 0.3490196, 1,
1.613157, -0.5085411, 1.042144, 1, 0, 0.3411765, 1,
1.613215, -1.136037, 1.549983, 1, 0, 0.3372549, 1,
1.615311, 0.9350319, 1.628234, 1, 0, 0.3294118, 1,
1.62176, 0.6062949, 1.039381, 1, 0, 0.3254902, 1,
1.631733, -0.01540397, 1.846622, 1, 0, 0.3176471, 1,
1.644983, 1.28151, -0.2173052, 1, 0, 0.3137255, 1,
1.664194, 0.9786046, 1.2855, 1, 0, 0.3058824, 1,
1.667078, 1.575117, 0.1041959, 1, 0, 0.2980392, 1,
1.672871, -0.2130355, 3.010136, 1, 0, 0.2941177, 1,
1.704902, -0.8291453, 2.086622, 1, 0, 0.2862745, 1,
1.716945, -1.000525, 1.521514, 1, 0, 0.282353, 1,
1.728723, -1.174392, 1.009533, 1, 0, 0.2745098, 1,
1.745548, -0.2683429, 1.099416, 1, 0, 0.2705882, 1,
1.773437, -0.5018588, 1.54006, 1, 0, 0.2627451, 1,
1.776376, 0.926437, -0.1286903, 1, 0, 0.2588235, 1,
1.77904, 0.09050129, 1.712832, 1, 0, 0.2509804, 1,
1.784135, 0.7483286, 0.1503133, 1, 0, 0.2470588, 1,
1.790574, 0.3421285, 2.135111, 1, 0, 0.2392157, 1,
1.790607, 1.288181, 0.466832, 1, 0, 0.2352941, 1,
1.790895, -2.511796, 2.922461, 1, 0, 0.227451, 1,
1.810923, 0.5196558, 2.182982, 1, 0, 0.2235294, 1,
1.821794, -0.6548402, 0.4833141, 1, 0, 0.2156863, 1,
1.827535, 1.758492, 0.7955915, 1, 0, 0.2117647, 1,
1.846493, -2.874902, 0.5080718, 1, 0, 0.2039216, 1,
1.85325, 0.4933779, 3.10582, 1, 0, 0.1960784, 1,
1.859756, 0.3619169, 1.402363, 1, 0, 0.1921569, 1,
1.878775, 1.616863, 0.5852274, 1, 0, 0.1843137, 1,
1.879581, -1.280074, 2.186616, 1, 0, 0.1803922, 1,
1.881509, -0.5153987, 2.984758, 1, 0, 0.172549, 1,
1.91009, 0.7691597, 0.4453552, 1, 0, 0.1686275, 1,
1.914563, 1.808136, 1.406247, 1, 0, 0.1607843, 1,
1.920304, -0.8773652, 1.650791, 1, 0, 0.1568628, 1,
1.934368, 1.096589, -0.4753302, 1, 0, 0.1490196, 1,
1.936992, 1.404521, 1.022425, 1, 0, 0.145098, 1,
1.939651, 1.163316, 1.149593, 1, 0, 0.1372549, 1,
1.947293, 0.5756095, 1.617165, 1, 0, 0.1333333, 1,
1.949224, -0.717876, 1.995018, 1, 0, 0.1254902, 1,
1.973306, 0.4228633, 2.230726, 1, 0, 0.1215686, 1,
1.999278, 0.7509238, 0.3719051, 1, 0, 0.1137255, 1,
2.046063, -1.475794, 0.975962, 1, 0, 0.1098039, 1,
2.053643, -0.2092931, 2.099057, 1, 0, 0.1019608, 1,
2.066487, 0.8437169, 1.332731, 1, 0, 0.09411765, 1,
2.122733, 1.119875, 0.8775743, 1, 0, 0.09019608, 1,
2.126145, -0.03715046, 1.058503, 1, 0, 0.08235294, 1,
2.137177, 0.002325756, 1.706866, 1, 0, 0.07843138, 1,
2.157117, -2.484571, 2.073311, 1, 0, 0.07058824, 1,
2.201094, -0.4414071, 1.738655, 1, 0, 0.06666667, 1,
2.209311, -0.01166659, 0.08877643, 1, 0, 0.05882353, 1,
2.248103, 0.9806871, 3.162208, 1, 0, 0.05490196, 1,
2.268647, 0.6414089, 0.2291507, 1, 0, 0.04705882, 1,
2.269076, 0.3127409, -0.6261028, 1, 0, 0.04313726, 1,
2.286569, 0.3148032, 1.962204, 1, 0, 0.03529412, 1,
2.364962, -0.5608594, 0.07202392, 1, 0, 0.03137255, 1,
2.459538, -1.089582, 1.24432, 1, 0, 0.02352941, 1,
2.474334, 1.213217, -0.4051127, 1, 0, 0.01960784, 1,
2.47674, -0.7862501, 3.854599, 1, 0, 0.01176471, 1,
2.80817, 0.03163907, 1.646758, 1, 0, 0.007843138, 1
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
-0.8343869, -5.832789, -7.83046, 0, -0.5, 0.5, 0.5,
-0.8343869, -5.832789, -7.83046, 1, -0.5, 0.5, 0.5,
-0.8343869, -5.832789, -7.83046, 1, 1.5, 0.5, 0.5,
-0.8343869, -5.832789, -7.83046, 0, 1.5, 0.5, 0.5
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
-5.711771, -0.8418926, -7.83046, 0, -0.5, 0.5, 0.5,
-5.711771, -0.8418926, -7.83046, 1, -0.5, 0.5, 0.5,
-5.711771, -0.8418926, -7.83046, 1, 1.5, 0.5, 0.5,
-5.711771, -0.8418926, -7.83046, 0, 1.5, 0.5, 0.5
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
-5.711771, -5.832789, -0.07627702, 0, -0.5, 0.5, 0.5,
-5.711771, -5.832789, -0.07627702, 1, -0.5, 0.5, 0.5,
-5.711771, -5.832789, -0.07627702, 1, 1.5, 0.5, 0.5,
-5.711771, -5.832789, -0.07627702, 0, 1.5, 0.5, 0.5
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
-4, -4.681044, -6.041033,
2, -4.681044, -6.041033,
-4, -4.681044, -6.041033,
-4, -4.873002, -6.339271,
-2, -4.681044, -6.041033,
-2, -4.873002, -6.339271,
0, -4.681044, -6.041033,
0, -4.873002, -6.339271,
2, -4.681044, -6.041033,
2, -4.873002, -6.339271
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
"-4",
"-2",
"0",
"2"
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
-4, -5.256917, -6.935747, 0, -0.5, 0.5, 0.5,
-4, -5.256917, -6.935747, 1, -0.5, 0.5, 0.5,
-4, -5.256917, -6.935747, 1, 1.5, 0.5, 0.5,
-4, -5.256917, -6.935747, 0, 1.5, 0.5, 0.5,
-2, -5.256917, -6.935747, 0, -0.5, 0.5, 0.5,
-2, -5.256917, -6.935747, 1, -0.5, 0.5, 0.5,
-2, -5.256917, -6.935747, 1, 1.5, 0.5, 0.5,
-2, -5.256917, -6.935747, 0, 1.5, 0.5, 0.5,
0, -5.256917, -6.935747, 0, -0.5, 0.5, 0.5,
0, -5.256917, -6.935747, 1, -0.5, 0.5, 0.5,
0, -5.256917, -6.935747, 1, 1.5, 0.5, 0.5,
0, -5.256917, -6.935747, 0, 1.5, 0.5, 0.5,
2, -5.256917, -6.935747, 0, -0.5, 0.5, 0.5,
2, -5.256917, -6.935747, 1, -0.5, 0.5, 0.5,
2, -5.256917, -6.935747, 1, 1.5, 0.5, 0.5,
2, -5.256917, -6.935747, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.586221, -4, -6.041033,
-4.586221, 2, -6.041033,
-4.586221, -4, -6.041033,
-4.773812, -4, -6.339271,
-4.586221, -2, -6.041033,
-4.773812, -2, -6.339271,
-4.586221, 0, -6.041033,
-4.773812, 0, -6.339271,
-4.586221, 2, -6.041033,
-4.773812, 2, -6.339271
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
"-4",
"-2",
"0",
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
-5.148996, -4, -6.935747, 0, -0.5, 0.5, 0.5,
-5.148996, -4, -6.935747, 1, -0.5, 0.5, 0.5,
-5.148996, -4, -6.935747, 1, 1.5, 0.5, 0.5,
-5.148996, -4, -6.935747, 0, 1.5, 0.5, 0.5,
-5.148996, -2, -6.935747, 0, -0.5, 0.5, 0.5,
-5.148996, -2, -6.935747, 1, -0.5, 0.5, 0.5,
-5.148996, -2, -6.935747, 1, 1.5, 0.5, 0.5,
-5.148996, -2, -6.935747, 0, 1.5, 0.5, 0.5,
-5.148996, 0, -6.935747, 0, -0.5, 0.5, 0.5,
-5.148996, 0, -6.935747, 1, -0.5, 0.5, 0.5,
-5.148996, 0, -6.935747, 1, 1.5, 0.5, 0.5,
-5.148996, 0, -6.935747, 0, 1.5, 0.5, 0.5,
-5.148996, 2, -6.935747, 0, -0.5, 0.5, 0.5,
-5.148996, 2, -6.935747, 1, -0.5, 0.5, 0.5,
-5.148996, 2, -6.935747, 1, 1.5, 0.5, 0.5,
-5.148996, 2, -6.935747, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.586221, -4.681044, -4,
-4.586221, -4.681044, 4,
-4.586221, -4.681044, -4,
-4.773812, -4.873002, -4,
-4.586221, -4.681044, -2,
-4.773812, -4.873002, -2,
-4.586221, -4.681044, 0,
-4.773812, -4.873002, 0,
-4.586221, -4.681044, 2,
-4.773812, -4.873002, 2,
-4.586221, -4.681044, 4,
-4.773812, -4.873002, 4
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
-5.148996, -5.256917, -4, 0, -0.5, 0.5, 0.5,
-5.148996, -5.256917, -4, 1, -0.5, 0.5, 0.5,
-5.148996, -5.256917, -4, 1, 1.5, 0.5, 0.5,
-5.148996, -5.256917, -4, 0, 1.5, 0.5, 0.5,
-5.148996, -5.256917, -2, 0, -0.5, 0.5, 0.5,
-5.148996, -5.256917, -2, 1, -0.5, 0.5, 0.5,
-5.148996, -5.256917, -2, 1, 1.5, 0.5, 0.5,
-5.148996, -5.256917, -2, 0, 1.5, 0.5, 0.5,
-5.148996, -5.256917, 0, 0, -0.5, 0.5, 0.5,
-5.148996, -5.256917, 0, 1, -0.5, 0.5, 0.5,
-5.148996, -5.256917, 0, 1, 1.5, 0.5, 0.5,
-5.148996, -5.256917, 0, 0, 1.5, 0.5, 0.5,
-5.148996, -5.256917, 2, 0, -0.5, 0.5, 0.5,
-5.148996, -5.256917, 2, 1, -0.5, 0.5, 0.5,
-5.148996, -5.256917, 2, 1, 1.5, 0.5, 0.5,
-5.148996, -5.256917, 2, 0, 1.5, 0.5, 0.5,
-5.148996, -5.256917, 4, 0, -0.5, 0.5, 0.5,
-5.148996, -5.256917, 4, 1, -0.5, 0.5, 0.5,
-5.148996, -5.256917, 4, 1, 1.5, 0.5, 0.5,
-5.148996, -5.256917, 4, 0, 1.5, 0.5, 0.5
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
-4.586221, -4.681044, -6.041033,
-4.586221, 2.997259, -6.041033,
-4.586221, -4.681044, 5.888479,
-4.586221, 2.997259, 5.888479,
-4.586221, -4.681044, -6.041033,
-4.586221, -4.681044, 5.888479,
-4.586221, 2.997259, -6.041033,
-4.586221, 2.997259, 5.888479,
-4.586221, -4.681044, -6.041033,
2.917447, -4.681044, -6.041033,
-4.586221, -4.681044, 5.888479,
2.917447, -4.681044, 5.888479,
-4.586221, 2.997259, -6.041033,
2.917447, 2.997259, -6.041033,
-4.586221, 2.997259, 5.888479,
2.917447, 2.997259, 5.888479,
2.917447, -4.681044, -6.041033,
2.917447, 2.997259, -6.041033,
2.917447, -4.681044, 5.888479,
2.917447, 2.997259, 5.888479,
2.917447, -4.681044, -6.041033,
2.917447, -4.681044, 5.888479,
2.917447, 2.997259, -6.041033,
2.917447, 2.997259, 5.888479
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
var radius = 8.569924;
var distance = 38.12856;
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
mvMatrix.translate( 0.8343869, 0.8418926, 0.07627702 );
mvMatrix.scale( 1.234859, 1.206773, 0.7767267 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.12856);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Phorate<-read.table("Phorate.xyz")
```

```
## Error in read.table("Phorate.xyz"): no lines available in input
```

```r
x<-Phorate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phorate' not found
```

```r
y<-Phorate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phorate' not found
```

```r
z<-Phorate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phorate' not found
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
-4.476944, -1.947542, -3.843535, 0, 0, 1, 1, 1,
-3.280494, -0.4732814, -2.413372, 1, 0, 0, 1, 1,
-2.995977, 0.4704741, -0.6825241, 1, 0, 0, 1, 1,
-2.988324, -0.6251304, -2.375183, 1, 0, 0, 1, 1,
-2.900069, -0.5122297, -2.180032, 1, 0, 0, 1, 1,
-2.781823, 0.1074953, -1.684782, 1, 0, 0, 1, 1,
-2.675727, 0.4442393, -1.125726, 0, 0, 0, 1, 1,
-2.634132, -0.825365, -3.128252, 0, 0, 0, 1, 1,
-2.61585, 0.7454963, -0.4921313, 0, 0, 0, 1, 1,
-2.561112, -0.8776565, -0.5811651, 0, 0, 0, 1, 1,
-2.522043, 0.01557058, 0.003425928, 0, 0, 0, 1, 1,
-2.508918, -1.163039, -0.2421366, 0, 0, 0, 1, 1,
-2.488765, -0.6977662, -0.3032742, 0, 0, 0, 1, 1,
-2.484486, -1.05351, -1.07046, 1, 1, 1, 1, 1,
-2.447046, 0.8799039, -2.21749, 1, 1, 1, 1, 1,
-2.409176, 0.04827851, -2.430799, 1, 1, 1, 1, 1,
-2.408467, -0.5477964, -1.582273, 1, 1, 1, 1, 1,
-2.346787, -1.302636, -2.027156, 1, 1, 1, 1, 1,
-2.341749, -0.3197191, -1.077383, 1, 1, 1, 1, 1,
-2.31862, 0.2538604, -1.33148, 1, 1, 1, 1, 1,
-2.316662, -0.6277778, -3.181094, 1, 1, 1, 1, 1,
-2.292212, -0.1796725, -2.540941, 1, 1, 1, 1, 1,
-2.2867, 0.4092562, -2.069209, 1, 1, 1, 1, 1,
-2.201956, 0.4491616, -0.3555054, 1, 1, 1, 1, 1,
-2.15939, -0.1127518, -0.194602, 1, 1, 1, 1, 1,
-2.151672, -0.4117928, -2.055112, 1, 1, 1, 1, 1,
-2.150057, 0.561905, -1.210581, 1, 1, 1, 1, 1,
-2.127288, -0.8082092, -2.267659, 1, 1, 1, 1, 1,
-2.117961, 1.056774, -1.857328, 0, 0, 1, 1, 1,
-2.114882, -0.08589376, -1.6358, 1, 0, 0, 1, 1,
-2.063426, 0.6789194, -1.707184, 1, 0, 0, 1, 1,
-2.062704, -0.227637, -1.214617, 1, 0, 0, 1, 1,
-2.056115, 2.522672, -2.257377, 1, 0, 0, 1, 1,
-2.041854, -1.293427, -2.803924, 1, 0, 0, 1, 1,
-2.022141, 0.7615193, -0.1660061, 0, 0, 0, 1, 1,
-1.997054, 0.3104938, -3.122809, 0, 0, 0, 1, 1,
-1.947954, -0.4945012, -1.351189, 0, 0, 0, 1, 1,
-1.94122, -0.8622606, -2.117623, 0, 0, 0, 1, 1,
-1.940463, -1.147094, -2.117872, 0, 0, 0, 1, 1,
-1.91272, 0.09969926, -0.7933924, 0, 0, 0, 1, 1,
-1.888778, -0.3839695, -1.358044, 0, 0, 0, 1, 1,
-1.885373, -1.364152, -1.293878, 1, 1, 1, 1, 1,
-1.855207, 0.194471, -3.065278, 1, 1, 1, 1, 1,
-1.813555, 0.5993745, -1.045884, 1, 1, 1, 1, 1,
-1.809345, 0.5873747, -1.134039, 1, 1, 1, 1, 1,
-1.800297, -0.3242553, -0.7518824, 1, 1, 1, 1, 1,
-1.798922, -1.461829, -1.801383, 1, 1, 1, 1, 1,
-1.798581, 0.1430701, -2.742766, 1, 1, 1, 1, 1,
-1.791738, 1.104519, -1.699102, 1, 1, 1, 1, 1,
-1.748648, 0.0601135, -1.127194, 1, 1, 1, 1, 1,
-1.738376, 0.798134, -0.5661129, 1, 1, 1, 1, 1,
-1.736105, 0.3237923, -1.392705, 1, 1, 1, 1, 1,
-1.730289, 1.074918, -2.068617, 1, 1, 1, 1, 1,
-1.728949, 0.6057619, -0.2220126, 1, 1, 1, 1, 1,
-1.722178, 1.072746, -0.7512942, 1, 1, 1, 1, 1,
-1.702756, 0.05195939, 0.2743132, 1, 1, 1, 1, 1,
-1.692084, -0.6391984, -0.4518199, 0, 0, 1, 1, 1,
-1.688094, 0.006063712, -2.382395, 1, 0, 0, 1, 1,
-1.677433, 0.5252945, 0.3210913, 1, 0, 0, 1, 1,
-1.671963, 0.8565663, -1.039923, 1, 0, 0, 1, 1,
-1.670134, -0.6787471, -3.015784, 1, 0, 0, 1, 1,
-1.669819, -1.641309, -2.260308, 1, 0, 0, 1, 1,
-1.640263, 0.9768963, -1.065793, 0, 0, 0, 1, 1,
-1.638964, -0.5988892, -2.083758, 0, 0, 0, 1, 1,
-1.634649, -0.4371854, -2.076747, 0, 0, 0, 1, 1,
-1.614708, -0.4834039, -1.465723, 0, 0, 0, 1, 1,
-1.611701, 0.2815911, -1.192513, 0, 0, 0, 1, 1,
-1.600739, -1.341375, 0.1663548, 0, 0, 0, 1, 1,
-1.598212, -0.5851241, -2.411794, 0, 0, 0, 1, 1,
-1.589204, 1.311016, -0.2059723, 1, 1, 1, 1, 1,
-1.585762, -0.8048501, -1.044493, 1, 1, 1, 1, 1,
-1.579354, 0.3392972, -1.134304, 1, 1, 1, 1, 1,
-1.566166, 0.5266137, -1.926432, 1, 1, 1, 1, 1,
-1.552589, -0.6052885, -2.43437, 1, 1, 1, 1, 1,
-1.546214, -1.491782, -1.885678, 1, 1, 1, 1, 1,
-1.531284, 0.7773187, -0.3651995, 1, 1, 1, 1, 1,
-1.511433, -1.20893, -2.132066, 1, 1, 1, 1, 1,
-1.509282, -0.3631807, -3.164191, 1, 1, 1, 1, 1,
-1.508002, -0.1927439, -1.438146, 1, 1, 1, 1, 1,
-1.499883, -0.5817025, -4.052871, 1, 1, 1, 1, 1,
-1.494279, 0.9383316, -0.4249591, 1, 1, 1, 1, 1,
-1.490135, 0.8979179, -0.3512467, 1, 1, 1, 1, 1,
-1.448295, 0.1714369, -0.8015178, 1, 1, 1, 1, 1,
-1.43566, 0.1676507, -3.268889, 1, 1, 1, 1, 1,
-1.426561, -0.1792092, -1.863614, 0, 0, 1, 1, 1,
-1.425779, 0.8412663, 0.2470032, 1, 0, 0, 1, 1,
-1.405926, 1.889336, -1.465735, 1, 0, 0, 1, 1,
-1.393914, -0.5146355, 0.385158, 1, 0, 0, 1, 1,
-1.38253, -0.406334, -0.6202312, 1, 0, 0, 1, 1,
-1.379797, 1.233732, -1.492526, 1, 0, 0, 1, 1,
-1.376949, -0.1495258, -0.8616078, 0, 0, 0, 1, 1,
-1.376696, 0.1596706, -3.583853, 0, 0, 0, 1, 1,
-1.374977, -0.2231831, -2.690205, 0, 0, 0, 1, 1,
-1.362466, -1.247289, -1.831554, 0, 0, 0, 1, 1,
-1.312987, 0.9500622, -1.433505, 0, 0, 0, 1, 1,
-1.291118, 0.08156732, -2.372663, 0, 0, 0, 1, 1,
-1.286062, 0.2598543, -0.8655545, 0, 0, 0, 1, 1,
-1.267694, 0.7287432, -1.419024, 1, 1, 1, 1, 1,
-1.265202, 0.0820395, -1.719337, 1, 1, 1, 1, 1,
-1.248015, -0.6693733, -3.297137, 1, 1, 1, 1, 1,
-1.225523, -0.4026664, -2.183906, 1, 1, 1, 1, 1,
-1.222236, -1.566305, -3.280544, 1, 1, 1, 1, 1,
-1.220916, -0.9788749, -1.513858, 1, 1, 1, 1, 1,
-1.22073, -0.2851142, -2.251287, 1, 1, 1, 1, 1,
-1.218046, 0.4981089, -0.5055565, 1, 1, 1, 1, 1,
-1.217008, 1.186922, -1.803853, 1, 1, 1, 1, 1,
-1.216901, -1.360858, -1.875186, 1, 1, 1, 1, 1,
-1.216856, -0.406434, -1.672223, 1, 1, 1, 1, 1,
-1.208994, 2.438369, -2.511137, 1, 1, 1, 1, 1,
-1.20764, -0.5269395, -1.932203, 1, 1, 1, 1, 1,
-1.203346, 0.2327631, -1.315676, 1, 1, 1, 1, 1,
-1.202849, -1.038746, -0.6621038, 1, 1, 1, 1, 1,
-1.197395, -1.057554, -1.982759, 0, 0, 1, 1, 1,
-1.197248, 0.3251313, -5.639561, 1, 0, 0, 1, 1,
-1.186559, 0.488067, 0.164464, 1, 0, 0, 1, 1,
-1.185479, -1.205908, -1.989622, 1, 0, 0, 1, 1,
-1.169752, -1.075453, -3.830145, 1, 0, 0, 1, 1,
-1.165095, 0.427331, -1.842201, 1, 0, 0, 1, 1,
-1.149847, -0.7009345, -2.618442, 0, 0, 0, 1, 1,
-1.148026, -0.8586428, -1.699533, 0, 0, 0, 1, 1,
-1.147774, -1.240423, -1.53372, 0, 0, 0, 1, 1,
-1.14203, -0.4099006, -0.1255619, 0, 0, 0, 1, 1,
-1.13415, -0.02378998, -1.557458, 0, 0, 0, 1, 1,
-1.117382, -1.080596, -2.416127, 0, 0, 0, 1, 1,
-1.117216, -0.6232744, -2.288399, 0, 0, 0, 1, 1,
-1.112543, -0.5529918, -0.8018451, 1, 1, 1, 1, 1,
-1.103578, -0.2534811, -1.08929, 1, 1, 1, 1, 1,
-1.102987, -2.304807, -1.140162, 1, 1, 1, 1, 1,
-1.102413, 0.4293068, 0.1495616, 1, 1, 1, 1, 1,
-1.10055, 0.8169517, -2.020523, 1, 1, 1, 1, 1,
-1.098895, 0.2204356, -0.3919964, 1, 1, 1, 1, 1,
-1.098302, -0.9580376, -2.770494, 1, 1, 1, 1, 1,
-1.098192, 0.5496129, -0.9918481, 1, 1, 1, 1, 1,
-1.095681, -1.924218, -4.398407, 1, 1, 1, 1, 1,
-1.094727, 0.1418197, -2.569213, 1, 1, 1, 1, 1,
-1.091963, -0.3124363, -0.724565, 1, 1, 1, 1, 1,
-1.088341, 1.047687, -0.9650378, 1, 1, 1, 1, 1,
-1.086993, -0.5910345, -1.504043, 1, 1, 1, 1, 1,
-1.075231, -0.4482165, -2.711147, 1, 1, 1, 1, 1,
-1.073657, 1.940374, -0.2552417, 1, 1, 1, 1, 1,
-1.070445, -0.5505055, -2.594627, 0, 0, 1, 1, 1,
-1.068062, -0.2072241, -2.048871, 1, 0, 0, 1, 1,
-1.066754, 0.835411, -3.391008, 1, 0, 0, 1, 1,
-1.066718, -0.1342326, -3.080903, 1, 0, 0, 1, 1,
-1.066045, -0.9578993, -4.381695, 1, 0, 0, 1, 1,
-1.060887, -1.205973, -3.79096, 1, 0, 0, 1, 1,
-1.052903, -0.7197325, -1.022483, 0, 0, 0, 1, 1,
-1.052644, -0.6920397, -1.709733, 0, 0, 0, 1, 1,
-1.051244, 0.5301907, -3.463771, 0, 0, 0, 1, 1,
-1.048902, 0.1124231, -1.582817, 0, 0, 0, 1, 1,
-1.041762, 0.5449499, -0.5186085, 0, 0, 0, 1, 1,
-1.038215, 0.931623, -1.099411, 0, 0, 0, 1, 1,
-1.032308, 0.3449769, -2.135812, 0, 0, 0, 1, 1,
-1.030471, -0.6703679, -1.7554, 1, 1, 1, 1, 1,
-1.026851, -0.6716851, -0.9029108, 1, 1, 1, 1, 1,
-1.012931, 0.006209623, -0.7896472, 1, 1, 1, 1, 1,
-1.011439, -0.6751577, -1.328677, 1, 1, 1, 1, 1,
-1.00575, 0.3701554, -1.308583, 1, 1, 1, 1, 1,
-1.004403, -0.1017752, -3.155103, 1, 1, 1, 1, 1,
-1.000091, 0.8815612, 0.2688262, 1, 1, 1, 1, 1,
-0.997093, -1.014079, -1.597058, 1, 1, 1, 1, 1,
-0.9883087, -0.5732086, -2.509562, 1, 1, 1, 1, 1,
-0.9834812, -0.7117682, -2.691326, 1, 1, 1, 1, 1,
-0.9699016, 0.9062383, 0.7180238, 1, 1, 1, 1, 1,
-0.9693857, 1.083163, -0.5382382, 1, 1, 1, 1, 1,
-0.9630402, -1.206402, -3.906295, 1, 1, 1, 1, 1,
-0.9617648, -0.166898, -1.168322, 1, 1, 1, 1, 1,
-0.9586554, -1.306556, -3.828293, 1, 1, 1, 1, 1,
-0.9576619, 0.9596268, -0.8640381, 0, 0, 1, 1, 1,
-0.9509023, -1.014358, -2.54377, 1, 0, 0, 1, 1,
-0.9447039, -0.08635671, -0.8390639, 1, 0, 0, 1, 1,
-0.9359334, 0.1204015, -2.588495, 1, 0, 0, 1, 1,
-0.934631, -0.6322482, -2.32847, 1, 0, 0, 1, 1,
-0.9223569, -1.573191, -2.748295, 1, 0, 0, 1, 1,
-0.9184781, 0.7533886, -1.837157, 0, 0, 0, 1, 1,
-0.9134964, 0.33167, -0.7313726, 0, 0, 0, 1, 1,
-0.9098504, 0.7740448, -0.6611264, 0, 0, 0, 1, 1,
-0.9072384, -1.424252, -3.34941, 0, 0, 0, 1, 1,
-0.905913, 0.8539289, -1.679393, 0, 0, 0, 1, 1,
-0.9011283, -0.1931597, -1.036573, 0, 0, 0, 1, 1,
-0.9003615, -2.206745, -3.126136, 0, 0, 0, 1, 1,
-0.8967659, -0.2469894, -1.359017, 1, 1, 1, 1, 1,
-0.8840364, 0.48398, -1.039773, 1, 1, 1, 1, 1,
-0.8826218, -2.102671, -2.519065, 1, 1, 1, 1, 1,
-0.8771005, 1.176524, 1.012591, 1, 1, 1, 1, 1,
-0.8765832, 1.114664, -0.3585384, 1, 1, 1, 1, 1,
-0.8668583, 1.284717, -1.69878, 1, 1, 1, 1, 1,
-0.8667614, 0.4767253, 0.2996938, 1, 1, 1, 1, 1,
-0.8661644, 0.8275802, -1.754163, 1, 1, 1, 1, 1,
-0.8659315, -0.1028789, -2.797088, 1, 1, 1, 1, 1,
-0.8587927, 0.05309952, -2.167918, 1, 1, 1, 1, 1,
-0.8493639, 0.1458507, -1.431313, 1, 1, 1, 1, 1,
-0.8458943, -1.080388, -1.403712, 1, 1, 1, 1, 1,
-0.845867, -1.093902, -2.420029, 1, 1, 1, 1, 1,
-0.8458102, 1.690453, 0.2001454, 1, 1, 1, 1, 1,
-0.8406783, 1.493658, -0.788151, 1, 1, 1, 1, 1,
-0.8396834, -0.503998, -1.504654, 0, 0, 1, 1, 1,
-0.8353832, -0.6779954, -3.520671, 1, 0, 0, 1, 1,
-0.8344679, 1.218395, -0.06567352, 1, 0, 0, 1, 1,
-0.8311978, -0.2711933, -0.05487824, 1, 0, 0, 1, 1,
-0.8306885, -0.129921, -1.634205, 1, 0, 0, 1, 1,
-0.8284492, 1.819035, -0.9050435, 1, 0, 0, 1, 1,
-0.8281354, 0.6405801, -0.9838746, 0, 0, 0, 1, 1,
-0.8215815, 1.923036, 0.02980545, 0, 0, 0, 1, 1,
-0.8192576, 0.8505898, -0.8634351, 0, 0, 0, 1, 1,
-0.8143734, 0.6177049, 1.004036, 0, 0, 0, 1, 1,
-0.8093363, 0.8794494, -1.348233, 0, 0, 0, 1, 1,
-0.7985049, -0.8515982, -1.077349, 0, 0, 0, 1, 1,
-0.7913928, 0.1185405, -1.677121, 0, 0, 0, 1, 1,
-0.7911621, 0.912483, -1.657517, 1, 1, 1, 1, 1,
-0.7721558, 0.2560046, -0.8192537, 1, 1, 1, 1, 1,
-0.7670885, 0.5975136, -3.045098, 1, 1, 1, 1, 1,
-0.7669072, -0.9721271, -3.717524, 1, 1, 1, 1, 1,
-0.7662368, 0.2155711, -1.599346, 1, 1, 1, 1, 1,
-0.755294, -1.10385, -1.365546, 1, 1, 1, 1, 1,
-0.7536365, -0.8160172, -2.404709, 1, 1, 1, 1, 1,
-0.7531286, 0.1671521, -3.239669, 1, 1, 1, 1, 1,
-0.7507867, -0.1492326, -0.86238, 1, 1, 1, 1, 1,
-0.7453764, -1.454937, -2.430976, 1, 1, 1, 1, 1,
-0.7451807, -0.8494045, -2.577654, 1, 1, 1, 1, 1,
-0.7368195, -0.7277384, -3.391192, 1, 1, 1, 1, 1,
-0.7292097, 0.2412465, -1.200653, 1, 1, 1, 1, 1,
-0.7292032, -0.8589364, -2.11639, 1, 1, 1, 1, 1,
-0.7265533, -0.1921653, -2.357996, 1, 1, 1, 1, 1,
-0.7247075, 0.07403328, -1.283324, 0, 0, 1, 1, 1,
-0.7228999, 0.8622649, -1.221529, 1, 0, 0, 1, 1,
-0.7172414, -0.6904137, -4.325787, 1, 0, 0, 1, 1,
-0.7169906, 2.019265, -0.3304309, 1, 0, 0, 1, 1,
-0.7135498, -0.6582387, -4.072241, 1, 0, 0, 1, 1,
-0.7102357, 0.2651834, -0.4625154, 1, 0, 0, 1, 1,
-0.7048514, -0.6147314, -2.953687, 0, 0, 0, 1, 1,
-0.6997775, 0.7945254, -1.232687, 0, 0, 0, 1, 1,
-0.6968479, 0.5059431, 0.4779979, 0, 0, 0, 1, 1,
-0.6942494, 0.4234394, -3.317727, 0, 0, 0, 1, 1,
-0.6890802, -0.8459646, -3.367476, 0, 0, 0, 1, 1,
-0.682734, 0.2599306, 0.01968669, 0, 0, 0, 1, 1,
-0.680441, -0.4196749, -1.741331, 0, 0, 0, 1, 1,
-0.6786883, 0.7823301, -0.9212953, 1, 1, 1, 1, 1,
-0.6778132, 0.8691213, -1.417688, 1, 1, 1, 1, 1,
-0.6719798, 1.516855, -0.6977181, 1, 1, 1, 1, 1,
-0.6697875, -0.6020658, -2.673951, 1, 1, 1, 1, 1,
-0.6696878, -0.7375039, -3.559632, 1, 1, 1, 1, 1,
-0.6683875, 1.622733, -0.0167265, 1, 1, 1, 1, 1,
-0.6664425, -0.6609282, -0.318113, 1, 1, 1, 1, 1,
-0.6631204, 0.4501543, 2.262084, 1, 1, 1, 1, 1,
-0.6613434, 0.6257547, -2.026152, 1, 1, 1, 1, 1,
-0.6583905, 2.885439, -1.053118, 1, 1, 1, 1, 1,
-0.6577561, 0.264776, -0.8662468, 1, 1, 1, 1, 1,
-0.6509491, -0.3155742, -2.099594, 1, 1, 1, 1, 1,
-0.647401, -1.955122, -4.705626, 1, 1, 1, 1, 1,
-0.6473311, -0.7361283, -2.45258, 1, 1, 1, 1, 1,
-0.6432296, -0.5090081, -2.429697, 1, 1, 1, 1, 1,
-0.6427868, -0.2791958, -3.713722, 0, 0, 1, 1, 1,
-0.6427082, -0.3577586, -2.869912, 1, 0, 0, 1, 1,
-0.6419291, -0.8523098, -2.494057, 1, 0, 0, 1, 1,
-0.6416871, -0.4090862, -1.886782, 1, 0, 0, 1, 1,
-0.6409702, 0.2424252, -0.8347657, 1, 0, 0, 1, 1,
-0.6406305, -0.4127425, -0.9296746, 1, 0, 0, 1, 1,
-0.6403177, 0.4087265, -0.1438073, 0, 0, 0, 1, 1,
-0.6384266, 0.8277346, -0.086053, 0, 0, 0, 1, 1,
-0.636129, 0.3189587, -1.211563, 0, 0, 0, 1, 1,
-0.6355084, 0.6853978, 0.22963, 0, 0, 0, 1, 1,
-0.6330903, 0.2091554, -0.1211058, 0, 0, 0, 1, 1,
-0.6312707, -0.5866205, -3.962276, 0, 0, 0, 1, 1,
-0.6198628, 1.083485, -2.189898, 0, 0, 0, 1, 1,
-0.6190885, -1.230709, -3.473733, 1, 1, 1, 1, 1,
-0.6187951, -0.6508024, -3.169749, 1, 1, 1, 1, 1,
-0.6180808, 0.5712773, -1.061866, 1, 1, 1, 1, 1,
-0.6093306, -0.9200281, -3.684834, 1, 1, 1, 1, 1,
-0.6062475, 0.2631553, -2.668591, 1, 1, 1, 1, 1,
-0.6021075, -1.466365, -2.501361, 1, 1, 1, 1, 1,
-0.597352, 0.1577443, -1.223989, 1, 1, 1, 1, 1,
-0.5968891, 1.373932, 0.1265493, 1, 1, 1, 1, 1,
-0.596223, 0.1180547, -2.29755, 1, 1, 1, 1, 1,
-0.5902846, 0.2449474, -1.740306, 1, 1, 1, 1, 1,
-0.5892137, 1.316678, -0.340968, 1, 1, 1, 1, 1,
-0.5870018, 0.3474296, -1.817858, 1, 1, 1, 1, 1,
-0.5855964, -0.7863911, -3.764054, 1, 1, 1, 1, 1,
-0.5825846, -0.0004573226, -0.482253, 1, 1, 1, 1, 1,
-0.5817161, 0.1462156, -2.781174, 1, 1, 1, 1, 1,
-0.5796846, 1.343198, -1.999081, 0, 0, 1, 1, 1,
-0.5785121, -0.607796, -1.446675, 1, 0, 0, 1, 1,
-0.5646386, -1.478557, -5.867302, 1, 0, 0, 1, 1,
-0.5632855, -0.02168664, -2.043006, 1, 0, 0, 1, 1,
-0.5518405, 1.017856, 0.337384, 1, 0, 0, 1, 1,
-0.5475921, 1.760851, 1.289003, 1, 0, 0, 1, 1,
-0.5463915, -0.8751034, -3.597692, 0, 0, 0, 1, 1,
-0.5443528, 0.6906359, -2.009118, 0, 0, 0, 1, 1,
-0.5435175, 0.7309874, -0.1126374, 0, 0, 0, 1, 1,
-0.5434533, -0.2590028, -1.292042, 0, 0, 0, 1, 1,
-0.5397499, -0.8725936, -3.977333, 0, 0, 0, 1, 1,
-0.5396284, -0.6097329, -1.857321, 0, 0, 0, 1, 1,
-0.5378137, -0.03380787, -0.3745254, 0, 0, 0, 1, 1,
-0.5349892, 1.158696, -0.5899014, 1, 1, 1, 1, 1,
-0.5317385, 0.2431156, -3.03682, 1, 1, 1, 1, 1,
-0.5233094, -0.9206176, -3.565762, 1, 1, 1, 1, 1,
-0.5189706, -0.8623157, -3.117543, 1, 1, 1, 1, 1,
-0.5188195, -0.4328931, -2.690242, 1, 1, 1, 1, 1,
-0.516297, 0.6382862, 1.25908, 1, 1, 1, 1, 1,
-0.516212, -0.6688017, -3.61287, 1, 1, 1, 1, 1,
-0.5160342, 0.715197, -0.3025329, 1, 1, 1, 1, 1,
-0.5134709, -1.020398, -2.598296, 1, 1, 1, 1, 1,
-0.509351, 1.231578, 0.8335083, 1, 1, 1, 1, 1,
-0.5078582, -0.3166276, -1.364146, 1, 1, 1, 1, 1,
-0.5067865, -0.9821534, -1.914568, 1, 1, 1, 1, 1,
-0.5050861, 0.6929271, -0.4641563, 1, 1, 1, 1, 1,
-0.5009326, -0.006424667, -0.1962947, 1, 1, 1, 1, 1,
-0.5007836, 0.07034333, -2.210162, 1, 1, 1, 1, 1,
-0.5004649, -0.3259466, -0.7917141, 0, 0, 1, 1, 1,
-0.4988533, -0.8870899, -2.939995, 1, 0, 0, 1, 1,
-0.4838769, 0.6450456, -0.66676, 1, 0, 0, 1, 1,
-0.4797752, -0.9981951, -3.833305, 1, 0, 0, 1, 1,
-0.4793643, 0.6123765, 0.9297795, 1, 0, 0, 1, 1,
-0.472387, 0.6612352, -2.045791, 1, 0, 0, 1, 1,
-0.4697907, -1.088317, -5.437248, 0, 0, 0, 1, 1,
-0.4695119, 1.434427, -0.03074847, 0, 0, 0, 1, 1,
-0.4679128, -1.448454, -2.945923, 0, 0, 0, 1, 1,
-0.4650792, 0.3584437, 1.350986, 0, 0, 0, 1, 1,
-0.4648005, 0.9090438, -0.8063148, 0, 0, 0, 1, 1,
-0.4647609, -0.8588688, -2.514665, 0, 0, 0, 1, 1,
-0.4558186, 0.5691583, -0.4157276, 0, 0, 0, 1, 1,
-0.4550506, 0.06530102, -2.304979, 1, 1, 1, 1, 1,
-0.4513956, 0.07976882, -0.3648435, 1, 1, 1, 1, 1,
-0.4475486, -0.1424422, -3.144583, 1, 1, 1, 1, 1,
-0.4451316, -1.189072, -1.829611, 1, 1, 1, 1, 1,
-0.4440962, -0.1825231, -2.081321, 1, 1, 1, 1, 1,
-0.4415369, 0.7850113, -1.349493, 1, 1, 1, 1, 1,
-0.4340269, -1.239763, -0.3866898, 1, 1, 1, 1, 1,
-0.4334595, 0.05025791, -0.6956519, 1, 1, 1, 1, 1,
-0.4326257, 1.015936, -0.05833293, 1, 1, 1, 1, 1,
-0.427907, -0.07159067, -1.784745, 1, 1, 1, 1, 1,
-0.424264, 0.07250108, -1.371472, 1, 1, 1, 1, 1,
-0.4210573, -0.728152, -3.879798, 1, 1, 1, 1, 1,
-0.4194625, -1.144703, -1.491639, 1, 1, 1, 1, 1,
-0.4176073, 0.5311125, -3.364868, 1, 1, 1, 1, 1,
-0.4155423, -1.115893, -4.093212, 1, 1, 1, 1, 1,
-0.4146701, 0.729072, 1.573621, 0, 0, 1, 1, 1,
-0.4119637, 0.6391537, 0.3397275, 1, 0, 0, 1, 1,
-0.4119577, -0.1101382, -2.105687, 1, 0, 0, 1, 1,
-0.411625, -0.2535083, -2.42286, 1, 0, 0, 1, 1,
-0.4115881, 1.381939, -1.191895, 1, 0, 0, 1, 1,
-0.4058087, -0.2712826, -2.20396, 1, 0, 0, 1, 1,
-0.399827, 1.549564, -0.7001277, 0, 0, 0, 1, 1,
-0.3979224, 0.1365182, -0.8905463, 0, 0, 0, 1, 1,
-0.3978587, -1.147285, -3.192402, 0, 0, 0, 1, 1,
-0.395612, 0.03447253, -0.2298118, 0, 0, 0, 1, 1,
-0.3953444, -0.002448909, -1.776935, 0, 0, 0, 1, 1,
-0.3882779, 1.011465, -2.188213, 0, 0, 0, 1, 1,
-0.3839358, 0.5701526, 2.082552, 0, 0, 0, 1, 1,
-0.380429, 0.4619711, 0.07991542, 1, 1, 1, 1, 1,
-0.3793759, 1.780983, -1.162755, 1, 1, 1, 1, 1,
-0.3760216, -1.000322, -3.347197, 1, 1, 1, 1, 1,
-0.3688467, -1.873654, -1.922555, 1, 1, 1, 1, 1,
-0.3677981, 0.112632, -0.9667783, 1, 1, 1, 1, 1,
-0.3674821, -0.4419682, -3.453323, 1, 1, 1, 1, 1,
-0.3665704, -0.7328228, -2.700067, 1, 1, 1, 1, 1,
-0.3628736, -1.211475, -1.722326, 1, 1, 1, 1, 1,
-0.3626446, 1.83374, -1.385485, 1, 1, 1, 1, 1,
-0.3626036, 1.744562, -0.2278125, 1, 1, 1, 1, 1,
-0.3620875, -1.01624, -4.01923, 1, 1, 1, 1, 1,
-0.3614545, 1.942659, -0.9916292, 1, 1, 1, 1, 1,
-0.3603392, -0.4882427, -4.094944, 1, 1, 1, 1, 1,
-0.3560079, -1.208283, -3.096143, 1, 1, 1, 1, 1,
-0.3548461, -1.724745, -2.385287, 1, 1, 1, 1, 1,
-0.3547477, 1.612772, 1.090671, 0, 0, 1, 1, 1,
-0.3524317, -0.796931, -2.990367, 1, 0, 0, 1, 1,
-0.3511867, -1.08866, -2.870189, 1, 0, 0, 1, 1,
-0.3510592, -0.1964851, -1.066148, 1, 0, 0, 1, 1,
-0.3474153, -1.902116, -4.028569, 1, 0, 0, 1, 1,
-0.3466139, 0.9966151, 2.012435, 1, 0, 0, 1, 1,
-0.3428028, -1.369241, -2.071841, 0, 0, 0, 1, 1,
-0.338418, 1.139577, -1.780607, 0, 0, 0, 1, 1,
-0.3350931, 0.06440216, -1.021761, 0, 0, 0, 1, 1,
-0.3350463, -0.001723507, 0.0631528, 0, 0, 0, 1, 1,
-0.3330481, 0.6619976, -0.2030906, 0, 0, 0, 1, 1,
-0.3233119, 0.4645499, 0.3583499, 0, 0, 0, 1, 1,
-0.3194819, 0.4988428, -0.560454, 0, 0, 0, 1, 1,
-0.3180287, 0.9568082, -0.3805272, 1, 1, 1, 1, 1,
-0.3130306, -1.029075, -3.203114, 1, 1, 1, 1, 1,
-0.3120364, 1.458436, 1.0744, 1, 1, 1, 1, 1,
-0.3105083, 0.1339956, -2.650276, 1, 1, 1, 1, 1,
-0.2995847, -0.7757701, -1.496815, 1, 1, 1, 1, 1,
-0.2986647, -0.01479947, -1.178476, 1, 1, 1, 1, 1,
-0.2971103, -0.9938591, -2.060812, 1, 1, 1, 1, 1,
-0.2949744, -2.192885, -2.379377, 1, 1, 1, 1, 1,
-0.2898413, 1.682683, 1.27345, 1, 1, 1, 1, 1,
-0.2853728, -0.2713227, -2.875777, 1, 1, 1, 1, 1,
-0.2850286, -1.142885, -0.9529214, 1, 1, 1, 1, 1,
-0.2820609, -0.07015221, -1.308054, 1, 1, 1, 1, 1,
-0.2752025, -1.08077, -3.35796, 1, 1, 1, 1, 1,
-0.2743211, 0.2653837, -0.3419235, 1, 1, 1, 1, 1,
-0.274087, -2.072257, -2.910372, 1, 1, 1, 1, 1,
-0.2702977, 0.5036294, 0.6967639, 0, 0, 1, 1, 1,
-0.2679224, -0.3215368, -2.345814, 1, 0, 0, 1, 1,
-0.266674, 0.1923224, -0.370241, 1, 0, 0, 1, 1,
-0.2600198, 0.6456637, 0.9437796, 1, 0, 0, 1, 1,
-0.2558962, -1.959595, -3.102085, 1, 0, 0, 1, 1,
-0.2552054, -2.714972, -3.83174, 1, 0, 0, 1, 1,
-0.2543945, 2.170151, 0.6785923, 0, 0, 0, 1, 1,
-0.2520712, -0.3006457, -2.43487, 0, 0, 0, 1, 1,
-0.2481755, 1.316493, -0.1067085, 0, 0, 0, 1, 1,
-0.2435795, 0.007727319, -1.311029, 0, 0, 0, 1, 1,
-0.2386989, -1.908701, -4.624234, 0, 0, 0, 1, 1,
-0.2377773, -0.4861918, -2.489774, 0, 0, 0, 1, 1,
-0.2354301, -1.279933, -3.882739, 0, 0, 0, 1, 1,
-0.2310006, 1.674453, -0.4197997, 1, 1, 1, 1, 1,
-0.2303475, -0.9950652, -1.100349, 1, 1, 1, 1, 1,
-0.2298846, 0.5461057, -1.776939, 1, 1, 1, 1, 1,
-0.2289575, -1.772161, -2.693782, 1, 1, 1, 1, 1,
-0.2250998, 1.019186, -0.5806184, 1, 1, 1, 1, 1,
-0.2240642, 0.1902725, -2.116089, 1, 1, 1, 1, 1,
-0.2235995, -0.5576575, -2.248073, 1, 1, 1, 1, 1,
-0.2229473, 1.116566, -0.08758797, 1, 1, 1, 1, 1,
-0.2215312, -0.9021925, -2.09117, 1, 1, 1, 1, 1,
-0.2191758, 0.6096134, -0.7927176, 1, 1, 1, 1, 1,
-0.215369, -1.283179, -3.106669, 1, 1, 1, 1, 1,
-0.213195, 0.1609498, -1.392648, 1, 1, 1, 1, 1,
-0.2127534, -0.06962059, -2.535266, 1, 1, 1, 1, 1,
-0.2113656, 0.2069377, -1.258204, 1, 1, 1, 1, 1,
-0.2105031, 1.813009, 0.5554414, 1, 1, 1, 1, 1,
-0.2090228, 0.0823076, -1.505111, 0, 0, 1, 1, 1,
-0.2066666, 0.1605848, 1.355211, 1, 0, 0, 1, 1,
-0.2064504, -1.528037, -1.693458, 1, 0, 0, 1, 1,
-0.2033776, -0.5410691, -3.326668, 1, 0, 0, 1, 1,
-0.2028443, 0.0399297, -1.925949, 1, 0, 0, 1, 1,
-0.2013812, -0.5854861, -3.653635, 1, 0, 0, 1, 1,
-0.1992178, 0.245154, -0.736354, 0, 0, 0, 1, 1,
-0.1967033, -0.8117496, -3.425759, 0, 0, 0, 1, 1,
-0.1962786, -0.1968908, -3.566155, 0, 0, 0, 1, 1,
-0.1878536, 0.6620863, 0.7922396, 0, 0, 0, 1, 1,
-0.1875705, 0.9913647, -0.7127495, 0, 0, 0, 1, 1,
-0.1853166, -0.8683515, -3.61294, 0, 0, 0, 1, 1,
-0.1850524, 2.297124, -0.7009425, 0, 0, 0, 1, 1,
-0.1814074, -0.1508732, -2.880082, 1, 1, 1, 1, 1,
-0.1799127, -1.080824, -2.550701, 1, 1, 1, 1, 1,
-0.1772048, -1.601522, -2.59951, 1, 1, 1, 1, 1,
-0.1716718, 0.324451, -0.9182343, 1, 1, 1, 1, 1,
-0.167812, -0.9000157, -2.32373, 1, 1, 1, 1, 1,
-0.1676826, 0.9314522, -0.7476923, 1, 1, 1, 1, 1,
-0.162623, -1.038068, -3.252246, 1, 1, 1, 1, 1,
-0.160035, -2.021236, -2.854499, 1, 1, 1, 1, 1,
-0.1577643, 0.1419109, 0.2769821, 1, 1, 1, 1, 1,
-0.155472, -0.0789753, -1.53006, 1, 1, 1, 1, 1,
-0.1525843, 0.2030599, -2.145278, 1, 1, 1, 1, 1,
-0.1512316, 0.619954, -1.624248, 1, 1, 1, 1, 1,
-0.1510544, -0.5330149, -3.210469, 1, 1, 1, 1, 1,
-0.1374093, 1.722032, -1.453964, 1, 1, 1, 1, 1,
-0.1369089, 0.2886642, -0.5780773, 1, 1, 1, 1, 1,
-0.1317157, -1.423055, -2.631677, 0, 0, 1, 1, 1,
-0.1304644, -1.229315, -2.313707, 1, 0, 0, 1, 1,
-0.1294308, -1.054878, -2.714891, 1, 0, 0, 1, 1,
-0.1293866, -2.172929, -3.316365, 1, 0, 0, 1, 1,
-0.1269843, -0.5912278, -3.371516, 1, 0, 0, 1, 1,
-0.1224449, 0.900914, 0.9952724, 1, 0, 0, 1, 1,
-0.1205158, -1.735667, -3.491861, 0, 0, 0, 1, 1,
-0.1199495, -0.9819476, -3.182667, 0, 0, 0, 1, 1,
-0.1186304, -0.9505355, -2.823417, 0, 0, 0, 1, 1,
-0.1175616, -0.2623775, -2.576866, 0, 0, 0, 1, 1,
-0.1141119, 1.870452, -1.233265, 0, 0, 0, 1, 1,
-0.1130646, 0.3216558, 0.4905261, 0, 0, 0, 1, 1,
-0.11007, 0.9281921, -0.8900255, 0, 0, 0, 1, 1,
-0.1053709, -0.7692587, -2.679441, 1, 1, 1, 1, 1,
-0.1022421, -0.7068719, -3.696435, 1, 1, 1, 1, 1,
-0.1003592, 1.458794, 1.250714, 1, 1, 1, 1, 1,
-0.09899688, -0.1984701, -3.252098, 1, 1, 1, 1, 1,
-0.09800229, -1.834034, -3.314494, 1, 1, 1, 1, 1,
-0.09367238, -0.8344052, -1.851995, 1, 1, 1, 1, 1,
-0.08996449, 0.4673053, 1.748247, 1, 1, 1, 1, 1,
-0.08834404, -1.886982, -3.679836, 1, 1, 1, 1, 1,
-0.08580488, 1.493841, -0.8844183, 1, 1, 1, 1, 1,
-0.08536319, 0.7689936, -0.6834605, 1, 1, 1, 1, 1,
-0.08502432, -0.04112798, -0.3026357, 1, 1, 1, 1, 1,
-0.08482025, 0.3386338, 0.3801561, 1, 1, 1, 1, 1,
-0.08209906, 0.2720349, 0.3803425, 1, 1, 1, 1, 1,
-0.08191568, 0.832061, -0.2079123, 1, 1, 1, 1, 1,
-0.08183556, 0.7501537, -0.7859302, 1, 1, 1, 1, 1,
-0.08131141, -0.8100443, -2.253886, 0, 0, 1, 1, 1,
-0.0804835, -1.111982, -2.363816, 1, 0, 0, 1, 1,
-0.07847182, -0.09390395, -4.452466, 1, 0, 0, 1, 1,
-0.07620697, 0.914233, -2.292967, 1, 0, 0, 1, 1,
-0.07616231, -0.8303342, -2.85864, 1, 0, 0, 1, 1,
-0.07392518, 1.84798, -3.771781, 1, 0, 0, 1, 1,
-0.07068198, -0.8452053, -3.446146, 0, 0, 0, 1, 1,
-0.06887003, 0.07559579, -0.6828899, 0, 0, 0, 1, 1,
-0.06403907, -0.7572227, -2.630215, 0, 0, 0, 1, 1,
-0.05906417, 1.271968, 0.3219706, 0, 0, 0, 1, 1,
-0.05575421, -0.7237874, -0.4266279, 0, 0, 0, 1, 1,
-0.05352562, 2.123759, -1.355002, 0, 0, 0, 1, 1,
-0.05321779, -0.142869, -3.237563, 0, 0, 0, 1, 1,
-0.0523296, 1.453535, -1.214006, 1, 1, 1, 1, 1,
-0.04845991, -2.295863, -2.570288, 1, 1, 1, 1, 1,
-0.04827391, -0.4670361, -2.902347, 1, 1, 1, 1, 1,
-0.04591994, -0.799904, -4.004323, 1, 1, 1, 1, 1,
-0.04591426, 0.4673196, 0.4351152, 1, 1, 1, 1, 1,
-0.04506252, -0.4185962, -3.182395, 1, 1, 1, 1, 1,
-0.04278669, 0.6738361, -1.283484, 1, 1, 1, 1, 1,
-0.04116633, -1.267967, -2.834677, 1, 1, 1, 1, 1,
-0.03830723, -0.7578824, -3.264182, 1, 1, 1, 1, 1,
-0.037761, -1.480409, -2.772545, 1, 1, 1, 1, 1,
-0.03384044, -0.04222314, -1.513507, 1, 1, 1, 1, 1,
-0.032517, 0.04951729, -0.4109315, 1, 1, 1, 1, 1,
-0.02789171, -1.045267, -1.815345, 1, 1, 1, 1, 1,
-0.02534616, -1.091533, -4.602434, 1, 1, 1, 1, 1,
-0.01981657, 0.8858333, 1.703294, 1, 1, 1, 1, 1,
-0.01703718, -0.4101551, -3.151445, 0, 0, 1, 1, 1,
-0.01597129, -1.122905, -1.38852, 1, 0, 0, 1, 1,
-0.01540699, 0.8606921, -1.281906, 1, 0, 0, 1, 1,
-0.01480663, 1.159221, 1.263833, 1, 0, 0, 1, 1,
-0.01056234, -1.044637, -2.674451, 1, 0, 0, 1, 1,
-0.007948663, 1.240455, -0.07320017, 1, 0, 0, 1, 1,
-0.005649577, -1.749613, -3.507123, 0, 0, 0, 1, 1,
0.002262678, -2.362252, 2.318455, 0, 0, 0, 1, 1,
0.008482854, 2.145618, 0.9636416, 0, 0, 0, 1, 1,
0.01467525, -1.856819, 3.180096, 0, 0, 0, 1, 1,
0.01743908, 0.002326949, 2.029249, 0, 0, 0, 1, 1,
0.02032704, 0.7595195, -0.7814736, 0, 0, 0, 1, 1,
0.02170235, -1.138915, 2.076246, 0, 0, 0, 1, 1,
0.03116026, 0.140249, 0.6641768, 1, 1, 1, 1, 1,
0.03741238, -1.166184, 1.541377, 1, 1, 1, 1, 1,
0.04259997, 0.8961402, 0.9086317, 1, 1, 1, 1, 1,
0.04687774, 0.2268947, 0.2404255, 1, 1, 1, 1, 1,
0.04807524, 0.6106306, 0.4379182, 1, 1, 1, 1, 1,
0.04900265, -1.17104, 3.190951, 1, 1, 1, 1, 1,
0.05654744, -1.019834, 2.373468, 1, 1, 1, 1, 1,
0.05732336, -0.9091155, 2.563562, 1, 1, 1, 1, 1,
0.06608935, 0.7466328, 0.9262272, 1, 1, 1, 1, 1,
0.06877773, 1.05292, -1.238328, 1, 1, 1, 1, 1,
0.06959786, 1.353462, 1.032135, 1, 1, 1, 1, 1,
0.07458849, -1.858626, 1.763286, 1, 1, 1, 1, 1,
0.07643095, -1.76273, 1.873182, 1, 1, 1, 1, 1,
0.07824744, 0.3537869, 1.19295, 1, 1, 1, 1, 1,
0.08376812, 0.004308671, 2.636088, 1, 1, 1, 1, 1,
0.08415174, 1.816959, -2.005591, 0, 0, 1, 1, 1,
0.08598952, -0.8350859, 2.173717, 1, 0, 0, 1, 1,
0.08707558, -0.2106752, 1.656398, 1, 0, 0, 1, 1,
0.0899931, 1.209261, -1.638845, 1, 0, 0, 1, 1,
0.09032782, 1.32577, -1.261577, 1, 0, 0, 1, 1,
0.09246995, 0.5161041, -1.32446, 1, 0, 0, 1, 1,
0.0932336, -0.8190721, 3.371408, 0, 0, 0, 1, 1,
0.09505172, -0.2084845, 2.796865, 0, 0, 0, 1, 1,
0.1017113, -0.3905373, 3.322116, 0, 0, 0, 1, 1,
0.1057434, 2.216197, 0.1836566, 0, 0, 0, 1, 1,
0.1067713, 1.11787, 0.6677706, 0, 0, 0, 1, 1,
0.1091443, 1.654289, 1.941085, 0, 0, 0, 1, 1,
0.1097902, 1.270985, -0.1975564, 0, 0, 0, 1, 1,
0.1211866, -1.101557, 4.799919, 1, 1, 1, 1, 1,
0.1240004, 0.7008653, 0.6116687, 1, 1, 1, 1, 1,
0.1291863, 0.229376, 0.2951254, 1, 1, 1, 1, 1,
0.1305741, 0.523614, -0.2892904, 1, 1, 1, 1, 1,
0.1324155, 0.8747596, 0.8866712, 1, 1, 1, 1, 1,
0.1335373, -2.023881, 2.938375, 1, 1, 1, 1, 1,
0.1355557, -1.027931, 1.749155, 1, 1, 1, 1, 1,
0.1461825, -0.7287364, 2.659825, 1, 1, 1, 1, 1,
0.1471587, -1.392431, 2.297697, 1, 1, 1, 1, 1,
0.1479338, 1.094921, 0.03639006, 1, 1, 1, 1, 1,
0.1550728, 0.8735719, -1.210557, 1, 1, 1, 1, 1,
0.1604258, 0.3188516, -0.06849579, 1, 1, 1, 1, 1,
0.1614682, -1.154322, 3.494807, 1, 1, 1, 1, 1,
0.162593, 1.136542, 1.073881, 1, 1, 1, 1, 1,
0.163899, 1.782867, 2.139816, 1, 1, 1, 1, 1,
0.1642219, 0.2949658, -1.608699, 0, 0, 1, 1, 1,
0.1706415, -0.3916721, 2.352325, 1, 0, 0, 1, 1,
0.17103, 0.8226707, -1.174408, 1, 0, 0, 1, 1,
0.1796373, -1.163306, 4.374348, 1, 0, 0, 1, 1,
0.1811111, -0.2534497, 1.787427, 1, 0, 0, 1, 1,
0.1813491, -0.3255018, 3.707104, 1, 0, 0, 1, 1,
0.183933, -0.5464198, 2.505036, 0, 0, 0, 1, 1,
0.1844828, 1.034468, -1.183532, 0, 0, 0, 1, 1,
0.1873738, 1.140047, -0.895326, 0, 0, 0, 1, 1,
0.1892096, 0.4008808, 0.9012224, 0, 0, 0, 1, 1,
0.1910822, -0.8329823, 3.548602, 0, 0, 0, 1, 1,
0.1937059, -0.2345242, 1.979226, 0, 0, 0, 1, 1,
0.1953019, -0.7786778, 3.688488, 0, 0, 0, 1, 1,
0.1973225, 1.154271, 0.94771, 1, 1, 1, 1, 1,
0.1984067, 1.556954, 0.3684092, 1, 1, 1, 1, 1,
0.1986709, 0.1551678, 0.9348241, 1, 1, 1, 1, 1,
0.211271, -1.028939, 5.714748, 1, 1, 1, 1, 1,
0.2157256, 0.6631163, -0.1220177, 1, 1, 1, 1, 1,
0.2180631, 0.1189847, 0.8797407, 1, 1, 1, 1, 1,
0.2183878, -0.5441775, 2.53842, 1, 1, 1, 1, 1,
0.2218615, 0.3612863, 1.653906, 1, 1, 1, 1, 1,
0.2246726, -1.486049, 1.826989, 1, 1, 1, 1, 1,
0.2260032, 1.754439, -1.708427, 1, 1, 1, 1, 1,
0.2345626, 0.01978085, 2.264997, 1, 1, 1, 1, 1,
0.2370451, 0.7164643, 1.063047, 1, 1, 1, 1, 1,
0.2379792, -1.083981, 3.430434, 1, 1, 1, 1, 1,
0.2382733, 0.02863007, 0.216159, 1, 1, 1, 1, 1,
0.2388514, -0.111891, 4.339723, 1, 1, 1, 1, 1,
0.2400044, 0.229093, -0.135781, 0, 0, 1, 1, 1,
0.2409357, 0.7807316, -0.9321675, 1, 0, 0, 1, 1,
0.2411983, -0.3943691, 0.3790784, 1, 0, 0, 1, 1,
0.2434238, 1.10131, 1.065675, 1, 0, 0, 1, 1,
0.247405, -0.606252, 2.9803, 1, 0, 0, 1, 1,
0.2475808, -0.3896919, 3.302096, 1, 0, 0, 1, 1,
0.2484397, 1.102712, 2.93261, 0, 0, 0, 1, 1,
0.2543493, 1.212474, -0.9739408, 0, 0, 0, 1, 1,
0.2565415, -1.801391, 2.739611, 0, 0, 0, 1, 1,
0.2578145, 0.6795174, 1.942701, 0, 0, 0, 1, 1,
0.263888, 0.6710466, 0.8310434, 0, 0, 0, 1, 1,
0.2657218, 0.009264925, 3.377498, 0, 0, 0, 1, 1,
0.2706871, 0.9870308, 0.8004395, 0, 0, 0, 1, 1,
0.271429, 0.6757727, 1.574217, 1, 1, 1, 1, 1,
0.2745986, -1.311086, 2.678788, 1, 1, 1, 1, 1,
0.27622, -0.5714325, 2.313038, 1, 1, 1, 1, 1,
0.2791181, 0.1864665, 0.8758803, 1, 1, 1, 1, 1,
0.2821763, 0.7777632, -0.1102324, 1, 1, 1, 1, 1,
0.2836874, -1.387567, 2.995671, 1, 1, 1, 1, 1,
0.2875581, -1.293165, 3.632113, 1, 1, 1, 1, 1,
0.2885923, -1.764472, 3.99071, 1, 1, 1, 1, 1,
0.2918375, -0.8246561, 3.683259, 1, 1, 1, 1, 1,
0.295042, -0.8276647, 2.020322, 1, 1, 1, 1, 1,
0.3058204, 0.9964574, -0.4317749, 1, 1, 1, 1, 1,
0.3078672, 0.4685381, -0.4051265, 1, 1, 1, 1, 1,
0.3079869, 1.701903, -0.9217393, 1, 1, 1, 1, 1,
0.3080218, -0.9877727, 1.724819, 1, 1, 1, 1, 1,
0.3122622, 0.08566439, 0.34986, 1, 1, 1, 1, 1,
0.321175, -0.6220075, 2.913612, 0, 0, 1, 1, 1,
0.3234282, 0.3242967, 0.2067782, 1, 0, 0, 1, 1,
0.3256636, 1.147639, -0.408762, 1, 0, 0, 1, 1,
0.3269534, -1.350583, 3.313255, 1, 0, 0, 1, 1,
0.3283577, 1.676532, -0.09645275, 1, 0, 0, 1, 1,
0.3294085, -0.6648521, 3.34938, 1, 0, 0, 1, 1,
0.3314989, -1.512708, 4.743011, 0, 0, 0, 1, 1,
0.3321099, -0.7078077, 3.192036, 0, 0, 0, 1, 1,
0.3330054, -1.125104, 5.136054, 0, 0, 0, 1, 1,
0.3369448, 1.403829, 0.4649583, 0, 0, 0, 1, 1,
0.3396146, -0.2456883, 2.068243, 0, 0, 0, 1, 1,
0.3410016, -0.6694578, 1.652459, 0, 0, 0, 1, 1,
0.3437711, 0.09068777, 1.382754, 0, 0, 0, 1, 1,
0.3453114, 0.6616291, -0.369707, 1, 1, 1, 1, 1,
0.3505071, 2.082943, 2.373913, 1, 1, 1, 1, 1,
0.3543604, 0.681465, -0.6394487, 1, 1, 1, 1, 1,
0.3549905, 0.5906898, 1.487582, 1, 1, 1, 1, 1,
0.3626732, -2.363894, 2.369328, 1, 1, 1, 1, 1,
0.3647898, 1.854647, -0.8433679, 1, 1, 1, 1, 1,
0.3699981, -0.3724023, 3.063945, 1, 1, 1, 1, 1,
0.3758484, 1.508991, 0.1460845, 1, 1, 1, 1, 1,
0.3896802, 0.8411396, 2.065936, 1, 1, 1, 1, 1,
0.3925428, -0.04206495, 2.57281, 1, 1, 1, 1, 1,
0.3949753, -0.1945547, 1.846601, 1, 1, 1, 1, 1,
0.3989979, 1.394407, 0.9752045, 1, 1, 1, 1, 1,
0.4006816, 1.394533, 0.1741671, 1, 1, 1, 1, 1,
0.401532, 0.73542, 0.378176, 1, 1, 1, 1, 1,
0.4018291, 0.02758251, 1.620067, 1, 1, 1, 1, 1,
0.4039817, -1.6293, 2.659548, 0, 0, 1, 1, 1,
0.4099575, 1.919386, 1.377509, 1, 0, 0, 1, 1,
0.4221533, 0.03511989, 0.6172712, 1, 0, 0, 1, 1,
0.4225738, 1.717619, 1.862448, 1, 0, 0, 1, 1,
0.4289735, -0.4291926, 4.804386, 1, 0, 0, 1, 1,
0.4289794, -0.7585248, 1.734531, 1, 0, 0, 1, 1,
0.4292761, -1.852626, 1.946282, 0, 0, 0, 1, 1,
0.4361407, 0.5616353, -1.894662, 0, 0, 0, 1, 1,
0.4362583, -0.210052, 2.284082, 0, 0, 0, 1, 1,
0.436275, 0.9558013, 1.049639, 0, 0, 0, 1, 1,
0.4367174, 1.69274, 0.3055337, 0, 0, 0, 1, 1,
0.4406135, -1.129054, 2.112961, 0, 0, 0, 1, 1,
0.4416828, 2.014129, -0.534519, 0, 0, 0, 1, 1,
0.443253, 1.649428, 1.857132, 1, 1, 1, 1, 1,
0.4449212, -0.4059126, 3.144933, 1, 1, 1, 1, 1,
0.4496732, -0.8099407, 1.830698, 1, 1, 1, 1, 1,
0.4569383, 1.051753, -1.345712, 1, 1, 1, 1, 1,
0.4572005, 0.1206384, 0.8943248, 1, 1, 1, 1, 1,
0.4599413, 1.85868, 0.291029, 1, 1, 1, 1, 1,
0.4617452, 0.8643325, 1.376533, 1, 1, 1, 1, 1,
0.4630071, 0.3227821, 0.5992414, 1, 1, 1, 1, 1,
0.4656782, -0.7398046, 2.782506, 1, 1, 1, 1, 1,
0.4691299, -0.6010278, 1.628016, 1, 1, 1, 1, 1,
0.4714757, -0.1691607, 0.8961208, 1, 1, 1, 1, 1,
0.47346, 0.4136147, 1.481154, 1, 1, 1, 1, 1,
0.4837434, 1.587553, -1.357366, 1, 1, 1, 1, 1,
0.485843, -0.1339613, 2.078803, 1, 1, 1, 1, 1,
0.4871339, 0.4297551, 2.359218, 1, 1, 1, 1, 1,
0.490638, 0.6352181, 1.111338, 0, 0, 1, 1, 1,
0.4946581, 1.661081, 0.3694154, 1, 0, 0, 1, 1,
0.4962565, -1.095861, 0.8470545, 1, 0, 0, 1, 1,
0.4974895, -1.081462, 1.934703, 1, 0, 0, 1, 1,
0.5095249, -0.2713159, 2.353618, 1, 0, 0, 1, 1,
0.5106518, 1.905636, -0.487603, 1, 0, 0, 1, 1,
0.5114812, -0.679, 2.303622, 0, 0, 0, 1, 1,
0.5140489, -1.640375, 2.872273, 0, 0, 0, 1, 1,
0.5194764, -1.198109, 2.675788, 0, 0, 0, 1, 1,
0.5201519, -0.2959516, 2.652934, 0, 0, 0, 1, 1,
0.5217752, -0.6748764, 2.346257, 0, 0, 0, 1, 1,
0.5225166, 1.1875, 0.424736, 0, 0, 0, 1, 1,
0.5241683, -0.9922687, 3.725574, 0, 0, 0, 1, 1,
0.5243471, -0.08707515, 1.436682, 1, 1, 1, 1, 1,
0.526448, -0.451348, 2.258984, 1, 1, 1, 1, 1,
0.5353183, -0.5900889, 2.107536, 1, 1, 1, 1, 1,
0.5423838, -1.398188, 2.628124, 1, 1, 1, 1, 1,
0.5424241, -0.6444917, 1.997219, 1, 1, 1, 1, 1,
0.5433458, 0.2360675, -0.02585927, 1, 1, 1, 1, 1,
0.5450194, -0.5817714, 1.683492, 1, 1, 1, 1, 1,
0.5471046, 1.085994, 0.3089601, 1, 1, 1, 1, 1,
0.5540502, -0.01853598, 0.774376, 1, 1, 1, 1, 1,
0.5563318, 0.6434755, 0.6639663, 1, 1, 1, 1, 1,
0.5572775, -0.2776159, 2.523336, 1, 1, 1, 1, 1,
0.5573385, 0.04789333, 0.82019, 1, 1, 1, 1, 1,
0.5583674, 1.811464, -0.4839852, 1, 1, 1, 1, 1,
0.5629179, 0.3780279, 1.274747, 1, 1, 1, 1, 1,
0.5677964, 1.682646, 1.220555, 1, 1, 1, 1, 1,
0.5687584, -0.3906475, 0.770094, 0, 0, 1, 1, 1,
0.5702696, -0.4413963, 2.445969, 1, 0, 0, 1, 1,
0.5736413, -2.099948, 3.167252, 1, 0, 0, 1, 1,
0.577418, -0.2306086, 1.795831, 1, 0, 0, 1, 1,
0.5891441, -0.3600336, 2.357929, 1, 0, 0, 1, 1,
0.5895325, 0.9707568, -0.04775138, 1, 0, 0, 1, 1,
0.6051617, 2.194931, 0.9286213, 0, 0, 0, 1, 1,
0.6083901, 0.6731941, 2.424282, 0, 0, 0, 1, 1,
0.6123672, 0.06604689, 2.099057, 0, 0, 0, 1, 1,
0.615343, -0.6184065, 4.356524, 0, 0, 0, 1, 1,
0.6174179, -1.156708, 1.567668, 0, 0, 0, 1, 1,
0.6189738, -0.6151363, 2.289628, 0, 0, 0, 1, 1,
0.6201381, 0.6125834, 0.2706303, 0, 0, 0, 1, 1,
0.6261634, 0.6124303, 1.839915, 1, 1, 1, 1, 1,
0.6320536, 1.575886, 2.022889, 1, 1, 1, 1, 1,
0.6321916, -1.301355, 1.357799, 1, 1, 1, 1, 1,
0.6370977, -0.2681113, 3.224501, 1, 1, 1, 1, 1,
0.6415841, 0.2636295, 0.6393883, 1, 1, 1, 1, 1,
0.6446452, -1.495822, 1.134083, 1, 1, 1, 1, 1,
0.6499129, -2.588189, 3.676201, 1, 1, 1, 1, 1,
0.6508412, 2.325672, -0.930522, 1, 1, 1, 1, 1,
0.6510953, -1.109748, 2.409501, 1, 1, 1, 1, 1,
0.6529161, 0.6746984, 1.875116, 1, 1, 1, 1, 1,
0.6538556, -0.2813346, 3.710686, 1, 1, 1, 1, 1,
0.6558921, -0.2372887, 1.143033, 1, 1, 1, 1, 1,
0.656099, 0.3085404, 0.7592288, 1, 1, 1, 1, 1,
0.6571891, -1.206057, 2.330281, 1, 1, 1, 1, 1,
0.6595173, -0.210838, 3.34612, 1, 1, 1, 1, 1,
0.6620382, 0.771309, 1.678314, 0, 0, 1, 1, 1,
0.66284, -0.03425972, 2.608105, 1, 0, 0, 1, 1,
0.6658493, -0.4727125, 2.012527, 1, 0, 0, 1, 1,
0.6669239, -0.8593653, 2.108701, 1, 0, 0, 1, 1,
0.6676359, -0.7497379, 2.326948, 1, 0, 0, 1, 1,
0.6727533, 0.7356678, 1.305444, 1, 0, 0, 1, 1,
0.6761332, -1.21235, 4.182988, 0, 0, 0, 1, 1,
0.6778024, -0.4852403, 2.34976, 0, 0, 0, 1, 1,
0.6781981, 0.04281085, 1.718483, 0, 0, 0, 1, 1,
0.6837261, -0.4033824, 1.805777, 0, 0, 0, 1, 1,
0.6842039, -0.2804773, 1.450155, 0, 0, 0, 1, 1,
0.6855601, -2.230128, 2.924242, 0, 0, 0, 1, 1,
0.6917488, 0.6143567, 0.2903404, 0, 0, 0, 1, 1,
0.6918951, -2.022494, 2.467754, 1, 1, 1, 1, 1,
0.695078, 0.3580264, 2.29163, 1, 1, 1, 1, 1,
0.6956905, -0.0156522, 3.009413, 1, 1, 1, 1, 1,
0.6961016, 0.8465611, 0.1574209, 1, 1, 1, 1, 1,
0.7069733, 1.855879, 1.027208, 1, 1, 1, 1, 1,
0.7153227, -1.409523, 5.111482, 1, 1, 1, 1, 1,
0.7174015, 1.159711, 1.23533, 1, 1, 1, 1, 1,
0.7183919, 0.02977006, 1.916595, 1, 1, 1, 1, 1,
0.7239181, 1.579823, -0.2850808, 1, 1, 1, 1, 1,
0.7255712, -0.3697743, 2.3911, 1, 1, 1, 1, 1,
0.7262146, -4.569224, 4.565293, 1, 1, 1, 1, 1,
0.7308314, -0.8156937, 1.497787, 1, 1, 1, 1, 1,
0.7316999, 0.02109884, 1.75517, 1, 1, 1, 1, 1,
0.7337509, 0.9778726, 0.4338174, 1, 1, 1, 1, 1,
0.735819, 0.3835749, 0.7607239, 1, 1, 1, 1, 1,
0.7483146, 0.2196546, 0.5298898, 0, 0, 1, 1, 1,
0.7494642, 1.021825, 1.920694, 1, 0, 0, 1, 1,
0.7498717, -0.1839234, 2.027735, 1, 0, 0, 1, 1,
0.7531323, -1.289646, 2.833861, 1, 0, 0, 1, 1,
0.7542844, -1.529505, 1.084279, 1, 0, 0, 1, 1,
0.7545695, -0.3219673, 3.19993, 1, 0, 0, 1, 1,
0.7564833, 1.022079, 0.9783725, 0, 0, 0, 1, 1,
0.7583559, 0.2313992, 1.559803, 0, 0, 0, 1, 1,
0.7592148, 0.3894922, 3.079354, 0, 0, 0, 1, 1,
0.7656555, -1.206076, 1.429929, 0, 0, 0, 1, 1,
0.7689067, -1.471058, 1.763675, 0, 0, 0, 1, 1,
0.7834207, -1.537599, 1.619242, 0, 0, 0, 1, 1,
0.783506, -1.231024, 4.287406, 0, 0, 0, 1, 1,
0.7887239, -0.1014847, 2.125888, 1, 1, 1, 1, 1,
0.8008142, -0.3593053, 1.709669, 1, 1, 1, 1, 1,
0.8015549, 0.613074, 1.564775, 1, 1, 1, 1, 1,
0.8056276, 0.6524286, 3.008953, 1, 1, 1, 1, 1,
0.8072864, -0.1694424, 1.624998, 1, 1, 1, 1, 1,
0.8079123, 2.722136, -0.2539546, 1, 1, 1, 1, 1,
0.811448, 0.3113924, -0.432621, 1, 1, 1, 1, 1,
0.8135599, -0.7531293, 2.786436, 1, 1, 1, 1, 1,
0.8151969, -3.676802, 2.797944, 1, 1, 1, 1, 1,
0.817317, 0.5461766, 1.705426, 1, 1, 1, 1, 1,
0.8194886, 0.4901594, 1.293606, 1, 1, 1, 1, 1,
0.8208037, -1.139796, 4.042076, 1, 1, 1, 1, 1,
0.8219733, 0.6926746, -0.007317994, 1, 1, 1, 1, 1,
0.8255002, 0.5512801, 3.180415, 1, 1, 1, 1, 1,
0.8273824, 0.5301384, 0.2739537, 1, 1, 1, 1, 1,
0.8278068, -1.360722, 2.772746, 0, 0, 1, 1, 1,
0.829313, -1.310579, 3.477772, 1, 0, 0, 1, 1,
0.830287, -0.7512077, 4.620398, 1, 0, 0, 1, 1,
0.8315786, 0.8907956, 0.4468185, 1, 0, 0, 1, 1,
0.832122, -0.9762621, 4.136173, 1, 0, 0, 1, 1,
0.8333727, 0.6466327, 0.0689821, 1, 0, 0, 1, 1,
0.8339472, 0.6200874, 0.6507704, 0, 0, 0, 1, 1,
0.8342859, 1.91001, -0.7331322, 0, 0, 0, 1, 1,
0.8475246, 0.09981996, 0.1603123, 0, 0, 0, 1, 1,
0.8504609, 2.628416, 2.608787, 0, 0, 0, 1, 1,
0.8507868, 0.007776138, 2.658645, 0, 0, 0, 1, 1,
0.8543775, -0.1547643, -1.050584, 0, 0, 0, 1, 1,
0.8555824, 1.783849, 1.757622, 0, 0, 0, 1, 1,
0.8564189, -0.919401, 2.244581, 1, 1, 1, 1, 1,
0.8732551, 0.4464266, 1.439788, 1, 1, 1, 1, 1,
0.8797309, -0.4185191, 2.283216, 1, 1, 1, 1, 1,
0.8911088, -0.06215462, -0.8406207, 1, 1, 1, 1, 1,
0.8971816, 0.0007111182, 1.248856, 1, 1, 1, 1, 1,
0.9007587, 0.4871024, 1.254065, 1, 1, 1, 1, 1,
0.9036511, 0.2078374, 1.300751, 1, 1, 1, 1, 1,
0.9064025, -0.1054778, 0.1758541, 1, 1, 1, 1, 1,
0.9092056, -1.03936, 3.281624, 1, 1, 1, 1, 1,
0.9123873, -0.5427474, 1.644675, 1, 1, 1, 1, 1,
0.9261903, 0.8566414, 0.05638523, 1, 1, 1, 1, 1,
0.9262476, 1.190824, 0.2858506, 1, 1, 1, 1, 1,
0.9263422, 0.6344157, 0.4246823, 1, 1, 1, 1, 1,
0.9274376, -0.244044, 1.252838, 1, 1, 1, 1, 1,
0.9300435, 1.268589, 1.250625, 1, 1, 1, 1, 1,
0.9325223, -0.4142702, 3.552936, 0, 0, 1, 1, 1,
0.9391518, -1.343348, 1.805897, 1, 0, 0, 1, 1,
0.9420123, -0.5430348, 0.1768959, 1, 0, 0, 1, 1,
0.9560443, 0.05165528, 2.690721, 1, 0, 0, 1, 1,
0.9629424, -1.311474, 3.446685, 1, 0, 0, 1, 1,
0.9640082, -1.033381, 2.00665, 1, 0, 0, 1, 1,
0.9678105, -1.11338, 2.850637, 0, 0, 0, 1, 1,
0.9715449, 0.5507554, 1.661995, 0, 0, 0, 1, 1,
0.9729463, -1.295057, 3.520608, 0, 0, 0, 1, 1,
0.9766116, -0.05312989, 2.772511, 0, 0, 0, 1, 1,
0.982144, -0.3008702, 0.3395936, 0, 0, 0, 1, 1,
0.9838066, 1.70153, -0.1446577, 0, 0, 0, 1, 1,
0.9853886, 0.7434961, -0.03048515, 0, 0, 0, 1, 1,
0.9905347, 0.113448, 1.046917, 1, 1, 1, 1, 1,
0.9908412, -0.09890288, 0.730644, 1, 1, 1, 1, 1,
0.9927909, -0.3858776, 3.566318, 1, 1, 1, 1, 1,
1.000816, -0.4366924, 2.131437, 1, 1, 1, 1, 1,
1.011441, 1.864919, 2.32412, 1, 1, 1, 1, 1,
1.011688, 0.777938, 1.232074, 1, 1, 1, 1, 1,
1.025117, -2.313221, 2.979996, 1, 1, 1, 1, 1,
1.028061, -0.3203003, 4.071856, 1, 1, 1, 1, 1,
1.031673, 1.509949, 1.455863, 1, 1, 1, 1, 1,
1.03685, -0.171877, -0.05865011, 1, 1, 1, 1, 1,
1.037773, -0.07202812, 4.051253, 1, 1, 1, 1, 1,
1.039765, 0.8043718, 0.9098347, 1, 1, 1, 1, 1,
1.041744, -1.368516, 3.303548, 1, 1, 1, 1, 1,
1.044279, 0.5791482, 2.52419, 1, 1, 1, 1, 1,
1.0448, -1.149078, 2.727898, 1, 1, 1, 1, 1,
1.054002, 1.105262, 1.247804, 0, 0, 1, 1, 1,
1.059789, 0.7592009, 1.977051, 1, 0, 0, 1, 1,
1.066296, 0.02887488, 2.700144, 1, 0, 0, 1, 1,
1.068571, -0.8892436, 1.007564, 1, 0, 0, 1, 1,
1.070079, 1.185375, 0.4045695, 1, 0, 0, 1, 1,
1.075679, -1.073554, 1.800428, 1, 0, 0, 1, 1,
1.078959, 1.626613, -0.4853933, 0, 0, 0, 1, 1,
1.080732, 0.004913662, 0.2071705, 0, 0, 0, 1, 1,
1.081733, -2.014288, 2.182132, 0, 0, 0, 1, 1,
1.081934, 1.276884, 0.1496221, 0, 0, 0, 1, 1,
1.089634, -0.9478104, 4.206437, 0, 0, 0, 1, 1,
1.098128, -0.3874644, 1.570297, 0, 0, 0, 1, 1,
1.098358, 1.310068, 3.539254, 0, 0, 0, 1, 1,
1.098788, -0.4949691, 1.056461, 1, 1, 1, 1, 1,
1.101472, -1.002037, 3.637945, 1, 1, 1, 1, 1,
1.111054, 1.062801, 1.522323, 1, 1, 1, 1, 1,
1.118656, 1.093383, 0.3178759, 1, 1, 1, 1, 1,
1.120356, 0.1379517, 0.9680071, 1, 1, 1, 1, 1,
1.129477, 1.245443, 0.6284139, 1, 1, 1, 1, 1,
1.131296, -1.121418, 1.570425, 1, 1, 1, 1, 1,
1.137756, -0.4427805, 1.737567, 1, 1, 1, 1, 1,
1.149881, -0.1329923, 1.372455, 1, 1, 1, 1, 1,
1.152, 2.767982, 0.530788, 1, 1, 1, 1, 1,
1.163471, 0.6483495, 1.624259, 1, 1, 1, 1, 1,
1.166047, -0.5026807, 1.656949, 1, 1, 1, 1, 1,
1.177719, -0.387315, 0.02309265, 1, 1, 1, 1, 1,
1.180477, 0.3048392, 1.24335, 1, 1, 1, 1, 1,
1.187751, -0.2592371, 2.313173, 1, 1, 1, 1, 1,
1.216566, -0.08228242, 1.741433, 0, 0, 1, 1, 1,
1.220112, -1.177839, 1.228501, 1, 0, 0, 1, 1,
1.22038, -1.375865, 0.7918709, 1, 0, 0, 1, 1,
1.221358, 2.443974, -1.275888, 1, 0, 0, 1, 1,
1.228302, -0.6241106, 2.683729, 1, 0, 0, 1, 1,
1.228942, -0.4542497, 1.360618, 1, 0, 0, 1, 1,
1.235174, -0.006700777, 0.6557757, 0, 0, 0, 1, 1,
1.244646, -1.107993, 2.960746, 0, 0, 0, 1, 1,
1.248087, -0.09544844, 1.114947, 0, 0, 0, 1, 1,
1.257091, 0.05186995, 1.314206, 0, 0, 0, 1, 1,
1.258438, 0.02318619, 0.227157, 0, 0, 0, 1, 1,
1.259761, 1.629068, 0.8097044, 0, 0, 0, 1, 1,
1.26005, 0.1256232, 2.762874, 0, 0, 0, 1, 1,
1.26008, -0.9558315, 0.2608277, 1, 1, 1, 1, 1,
1.26994, -3.274111, 4.662135, 1, 1, 1, 1, 1,
1.27715, -1.470319, 0.6295362, 1, 1, 1, 1, 1,
1.281979, 0.5574129, 1.89409, 1, 1, 1, 1, 1,
1.284452, 0.8862438, 0.2170971, 1, 1, 1, 1, 1,
1.287683, 0.6156971, 2.854139, 1, 1, 1, 1, 1,
1.293144, -1.143781, 2.963615, 1, 1, 1, 1, 1,
1.294435, -0.3542798, 0.305464, 1, 1, 1, 1, 1,
1.301655, 0.9747498, 0.972667, 1, 1, 1, 1, 1,
1.302414, 0.8437845, 2.092643, 1, 1, 1, 1, 1,
1.308797, 0.3600175, 0.224418, 1, 1, 1, 1, 1,
1.310662, 0.7821563, 0.9287504, 1, 1, 1, 1, 1,
1.322428, 1.573276, 1.328034, 1, 1, 1, 1, 1,
1.324881, -1.932539, 2.414969, 1, 1, 1, 1, 1,
1.330116, 0.4282643, -0.4049265, 1, 1, 1, 1, 1,
1.332316, 1.069504, 2.183628, 0, 0, 1, 1, 1,
1.337694, 0.6624866, 1.18879, 1, 0, 0, 1, 1,
1.341911, 0.5794926, 0.4262162, 1, 0, 0, 1, 1,
1.342933, 0.6509159, 1.125608, 1, 0, 0, 1, 1,
1.348089, -0.3601439, 1.237596, 1, 0, 0, 1, 1,
1.350739, -1.592601, 1.22017, 1, 0, 0, 1, 1,
1.354978, -0.6053686, 1.717975, 0, 0, 0, 1, 1,
1.357862, 1.201097, 1.859362, 0, 0, 0, 1, 1,
1.358082, -0.003923146, 0.3094166, 0, 0, 0, 1, 1,
1.35944, -0.06064478, 1.319933, 0, 0, 0, 1, 1,
1.361776, -0.3485249, 2.31721, 0, 0, 0, 1, 1,
1.364731, -0.4184768, 0.7510287, 0, 0, 0, 1, 1,
1.375185, -2.972558, 2.598848, 0, 0, 0, 1, 1,
1.380397, -0.2527279, 2.859386, 1, 1, 1, 1, 1,
1.383359, -0.5129508, 1.713777, 1, 1, 1, 1, 1,
1.387856, 1.958757, -0.4616817, 1, 1, 1, 1, 1,
1.387888, -0.3746004, 2.321934, 1, 1, 1, 1, 1,
1.405595, 0.8068011, 1.899704, 1, 1, 1, 1, 1,
1.412969, 1.773805, -0.2407725, 1, 1, 1, 1, 1,
1.415772, -0.8868162, 1.170865, 1, 1, 1, 1, 1,
1.419656, 0.2416688, 1.812757, 1, 1, 1, 1, 1,
1.419863, -0.8667088, 1.589555, 1, 1, 1, 1, 1,
1.43159, -1.248075, 3.455168, 1, 1, 1, 1, 1,
1.437651, 0.5355613, 0.9619987, 1, 1, 1, 1, 1,
1.437863, 0.4640726, 2.338217, 1, 1, 1, 1, 1,
1.438732, -0.3428901, 0.5969154, 1, 1, 1, 1, 1,
1.465156, 1.257174, -0.7830933, 1, 1, 1, 1, 1,
1.465211, 0.2409163, 1.906035, 1, 1, 1, 1, 1,
1.474737, 0.5489492, 1.60411, 0, 0, 1, 1, 1,
1.485995, -0.9399616, 2.692071, 1, 0, 0, 1, 1,
1.494076, -0.8625728, 0.8316563, 1, 0, 0, 1, 1,
1.509362, -2.018206, 4.205894, 1, 0, 0, 1, 1,
1.522617, -0.495424, 0.3684703, 1, 0, 0, 1, 1,
1.526897, -0.7523009, 1.887829, 1, 0, 0, 1, 1,
1.527076, -0.242817, 3.204826, 0, 0, 0, 1, 1,
1.538215, 2.452051, 2.273711, 0, 0, 0, 1, 1,
1.538747, -1.53204, 3.05328, 0, 0, 0, 1, 1,
1.550174, -1.588066, 3.633979, 0, 0, 0, 1, 1,
1.55134, 0.8471146, 1.424701, 0, 0, 0, 1, 1,
1.552986, 0.4845952, 1.804793, 0, 0, 0, 1, 1,
1.568505, 0.6342358, 0.9937794, 0, 0, 0, 1, 1,
1.583897, 0.7422838, -0.936569, 1, 1, 1, 1, 1,
1.588574, -0.2883324, -0.5006751, 1, 1, 1, 1, 1,
1.596989, 0.05538928, 1.152962, 1, 1, 1, 1, 1,
1.605546, 0.420002, 0.5318923, 1, 1, 1, 1, 1,
1.6059, -0.6106014, 3.590016, 1, 1, 1, 1, 1,
1.611604, 1.198665, 1.539036, 1, 1, 1, 1, 1,
1.613157, -0.5085411, 1.042144, 1, 1, 1, 1, 1,
1.613215, -1.136037, 1.549983, 1, 1, 1, 1, 1,
1.615311, 0.9350319, 1.628234, 1, 1, 1, 1, 1,
1.62176, 0.6062949, 1.039381, 1, 1, 1, 1, 1,
1.631733, -0.01540397, 1.846622, 1, 1, 1, 1, 1,
1.644983, 1.28151, -0.2173052, 1, 1, 1, 1, 1,
1.664194, 0.9786046, 1.2855, 1, 1, 1, 1, 1,
1.667078, 1.575117, 0.1041959, 1, 1, 1, 1, 1,
1.672871, -0.2130355, 3.010136, 1, 1, 1, 1, 1,
1.704902, -0.8291453, 2.086622, 0, 0, 1, 1, 1,
1.716945, -1.000525, 1.521514, 1, 0, 0, 1, 1,
1.728723, -1.174392, 1.009533, 1, 0, 0, 1, 1,
1.745548, -0.2683429, 1.099416, 1, 0, 0, 1, 1,
1.773437, -0.5018588, 1.54006, 1, 0, 0, 1, 1,
1.776376, 0.926437, -0.1286903, 1, 0, 0, 1, 1,
1.77904, 0.09050129, 1.712832, 0, 0, 0, 1, 1,
1.784135, 0.7483286, 0.1503133, 0, 0, 0, 1, 1,
1.790574, 0.3421285, 2.135111, 0, 0, 0, 1, 1,
1.790607, 1.288181, 0.466832, 0, 0, 0, 1, 1,
1.790895, -2.511796, 2.922461, 0, 0, 0, 1, 1,
1.810923, 0.5196558, 2.182982, 0, 0, 0, 1, 1,
1.821794, -0.6548402, 0.4833141, 0, 0, 0, 1, 1,
1.827535, 1.758492, 0.7955915, 1, 1, 1, 1, 1,
1.846493, -2.874902, 0.5080718, 1, 1, 1, 1, 1,
1.85325, 0.4933779, 3.10582, 1, 1, 1, 1, 1,
1.859756, 0.3619169, 1.402363, 1, 1, 1, 1, 1,
1.878775, 1.616863, 0.5852274, 1, 1, 1, 1, 1,
1.879581, -1.280074, 2.186616, 1, 1, 1, 1, 1,
1.881509, -0.5153987, 2.984758, 1, 1, 1, 1, 1,
1.91009, 0.7691597, 0.4453552, 1, 1, 1, 1, 1,
1.914563, 1.808136, 1.406247, 1, 1, 1, 1, 1,
1.920304, -0.8773652, 1.650791, 1, 1, 1, 1, 1,
1.934368, 1.096589, -0.4753302, 1, 1, 1, 1, 1,
1.936992, 1.404521, 1.022425, 1, 1, 1, 1, 1,
1.939651, 1.163316, 1.149593, 1, 1, 1, 1, 1,
1.947293, 0.5756095, 1.617165, 1, 1, 1, 1, 1,
1.949224, -0.717876, 1.995018, 1, 1, 1, 1, 1,
1.973306, 0.4228633, 2.230726, 0, 0, 1, 1, 1,
1.999278, 0.7509238, 0.3719051, 1, 0, 0, 1, 1,
2.046063, -1.475794, 0.975962, 1, 0, 0, 1, 1,
2.053643, -0.2092931, 2.099057, 1, 0, 0, 1, 1,
2.066487, 0.8437169, 1.332731, 1, 0, 0, 1, 1,
2.122733, 1.119875, 0.8775743, 1, 0, 0, 1, 1,
2.126145, -0.03715046, 1.058503, 0, 0, 0, 1, 1,
2.137177, 0.002325756, 1.706866, 0, 0, 0, 1, 1,
2.157117, -2.484571, 2.073311, 0, 0, 0, 1, 1,
2.201094, -0.4414071, 1.738655, 0, 0, 0, 1, 1,
2.209311, -0.01166659, 0.08877643, 0, 0, 0, 1, 1,
2.248103, 0.9806871, 3.162208, 0, 0, 0, 1, 1,
2.268647, 0.6414089, 0.2291507, 0, 0, 0, 1, 1,
2.269076, 0.3127409, -0.6261028, 1, 1, 1, 1, 1,
2.286569, 0.3148032, 1.962204, 1, 1, 1, 1, 1,
2.364962, -0.5608594, 0.07202392, 1, 1, 1, 1, 1,
2.459538, -1.089582, 1.24432, 1, 1, 1, 1, 1,
2.474334, 1.213217, -0.4051127, 1, 1, 1, 1, 1,
2.47674, -0.7862501, 3.854599, 1, 1, 1, 1, 1,
2.80817, 0.03163907, 1.646758, 1, 1, 1, 1, 1
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
var radius = 10.43662;
var distance = 36.65818;
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
mvMatrix.translate( 0.8343869, 0.8418926, 0.07627702 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.65818);
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
