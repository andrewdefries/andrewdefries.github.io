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
-3.703798, 2.006168, 0.2104032, 1, 0, 0, 1,
-2.917335, -0.3766946, -1.941764, 1, 0.007843138, 0, 1,
-2.499852, -0.4926426, -2.482622, 1, 0.01176471, 0, 1,
-2.311719, 0.1230369, -3.047677, 1, 0.01960784, 0, 1,
-2.242992, 0.06328017, -1.278155, 1, 0.02352941, 0, 1,
-2.227274, -1.051073, -1.792795, 1, 0.03137255, 0, 1,
-2.181319, -0.3222845, -3.913174, 1, 0.03529412, 0, 1,
-2.179804, -0.8857355, -2.361662, 1, 0.04313726, 0, 1,
-2.169555, 0.03662695, -1.922106, 1, 0.04705882, 0, 1,
-2.149363, -0.9665949, -3.207046, 1, 0.05490196, 0, 1,
-2.143524, 0.6169811, -1.424271, 1, 0.05882353, 0, 1,
-2.129373, 0.5336568, -2.027, 1, 0.06666667, 0, 1,
-2.101583, 0.9046264, -1.220198, 1, 0.07058824, 0, 1,
-2.090166, 2.206331, 0.2168219, 1, 0.07843138, 0, 1,
-2.001399, 0.3892358, -2.571281, 1, 0.08235294, 0, 1,
-1.94768, -0.4934451, -2.138469, 1, 0.09019608, 0, 1,
-1.926252, -1.02984, -0.9662658, 1, 0.09411765, 0, 1,
-1.918878, 0.01099036, -1.36105, 1, 0.1019608, 0, 1,
-1.88241, 1.855546, -1.656996, 1, 0.1098039, 0, 1,
-1.864984, 2.049893, -2.532958, 1, 0.1137255, 0, 1,
-1.851348, 1.357672, -1.605103, 1, 0.1215686, 0, 1,
-1.84985, -1.936718, -2.747489, 1, 0.1254902, 0, 1,
-1.848313, -0.7198281, -2.41087, 1, 0.1333333, 0, 1,
-1.820758, -1.144432, -1.244259, 1, 0.1372549, 0, 1,
-1.808922, -0.2279571, -1.126532, 1, 0.145098, 0, 1,
-1.808496, -1.690344, -2.178224, 1, 0.1490196, 0, 1,
-1.808313, -0.2605696, -3.575009, 1, 0.1568628, 0, 1,
-1.759788, 1.110315, -1.26013, 1, 0.1607843, 0, 1,
-1.755577, -0.3320146, -1.067286, 1, 0.1686275, 0, 1,
-1.745685, 0.05627771, -1.83836, 1, 0.172549, 0, 1,
-1.739978, 1.028884, -0.4263789, 1, 0.1803922, 0, 1,
-1.718272, 0.8081863, -1.785158, 1, 0.1843137, 0, 1,
-1.715328, -0.2228917, 0.02365064, 1, 0.1921569, 0, 1,
-1.712554, -2.079031, -1.51227, 1, 0.1960784, 0, 1,
-1.711022, -0.9698862, -2.067809, 1, 0.2039216, 0, 1,
-1.677762, 0.8639821, -1.916119, 1, 0.2117647, 0, 1,
-1.670296, -1.888302, -3.132056, 1, 0.2156863, 0, 1,
-1.653885, 0.5437867, -1.033596, 1, 0.2235294, 0, 1,
-1.647696, -0.3812639, -2.172149, 1, 0.227451, 0, 1,
-1.630353, 1.302335, -1.498652, 1, 0.2352941, 0, 1,
-1.618291, -0.1281688, -1.320138, 1, 0.2392157, 0, 1,
-1.613762, -0.3097025, -1.748329, 1, 0.2470588, 0, 1,
-1.609354, 0.1667892, -2.42415, 1, 0.2509804, 0, 1,
-1.601329, 0.5201463, -2.877568, 1, 0.2588235, 0, 1,
-1.600812, -1.56633, -2.999993, 1, 0.2627451, 0, 1,
-1.590018, -0.01838061, -2.675075, 1, 0.2705882, 0, 1,
-1.589719, -1.00775, -1.72552, 1, 0.2745098, 0, 1,
-1.580689, 0.161896, -1.829007, 1, 0.282353, 0, 1,
-1.575062, 0.08010855, -2.114053, 1, 0.2862745, 0, 1,
-1.567711, -0.2656729, -2.664805, 1, 0.2941177, 0, 1,
-1.555333, -1.140593, -1.809263, 1, 0.3019608, 0, 1,
-1.528251, -2.487692, -1.895534, 1, 0.3058824, 0, 1,
-1.521721, 0.06622144, -1.320626, 1, 0.3137255, 0, 1,
-1.520762, -1.75068, -2.214197, 1, 0.3176471, 0, 1,
-1.513165, -1.290349, -1.203371, 1, 0.3254902, 0, 1,
-1.511183, 0.2713757, -3.772331, 1, 0.3294118, 0, 1,
-1.510737, -0.3821533, -2.224333, 1, 0.3372549, 0, 1,
-1.498701, 1.119633, 0.1723893, 1, 0.3411765, 0, 1,
-1.49799, 2.114648, -1.973789, 1, 0.3490196, 0, 1,
-1.490038, 0.1407841, -0.9912221, 1, 0.3529412, 0, 1,
-1.486904, 1.464498, -0.1270503, 1, 0.3607843, 0, 1,
-1.479375, -0.1599097, -2.563133, 1, 0.3647059, 0, 1,
-1.469138, -0.8710874, -3.493236, 1, 0.372549, 0, 1,
-1.458941, 0.9597091, -1.156918, 1, 0.3764706, 0, 1,
-1.457731, -1.55916, -2.912789, 1, 0.3843137, 0, 1,
-1.456084, 2.692802, 0.2532703, 1, 0.3882353, 0, 1,
-1.455694, 0.6613628, -1.531348, 1, 0.3960784, 0, 1,
-1.450072, 0.01866618, -3.402101, 1, 0.4039216, 0, 1,
-1.425761, -1.239692, -1.350007, 1, 0.4078431, 0, 1,
-1.4055, 1.491943, -1.498, 1, 0.4156863, 0, 1,
-1.404576, -1.301519, -2.015913, 1, 0.4196078, 0, 1,
-1.374935, -0.3417352, -2.84006, 1, 0.427451, 0, 1,
-1.367613, -0.6004215, -1.636211, 1, 0.4313726, 0, 1,
-1.358238, -1.217816, -3.209648, 1, 0.4392157, 0, 1,
-1.348865, -0.4746485, -1.65684, 1, 0.4431373, 0, 1,
-1.336786, 0.7773613, -2.735731, 1, 0.4509804, 0, 1,
-1.326283, -2.515433, -3.652004, 1, 0.454902, 0, 1,
-1.324499, 1.933713, -0.5009579, 1, 0.4627451, 0, 1,
-1.317814, 0.1379062, -3.04626, 1, 0.4666667, 0, 1,
-1.313867, -1.328555, -2.977398, 1, 0.4745098, 0, 1,
-1.293835, -0.7297779, -1.403017, 1, 0.4784314, 0, 1,
-1.289088, 0.6254337, -0.5174115, 1, 0.4862745, 0, 1,
-1.288353, 0.02188542, -2.951784, 1, 0.4901961, 0, 1,
-1.283178, -0.5567599, -2.627261, 1, 0.4980392, 0, 1,
-1.27916, -0.725504, -1.431733, 1, 0.5058824, 0, 1,
-1.277351, 0.2031449, -1.874835, 1, 0.509804, 0, 1,
-1.272515, -1.075857, -3.401362, 1, 0.5176471, 0, 1,
-1.267354, 0.2068309, -1.863856, 1, 0.5215687, 0, 1,
-1.260757, 0.3656991, -0.7673677, 1, 0.5294118, 0, 1,
-1.260381, -1.090037, -2.543858, 1, 0.5333334, 0, 1,
-1.259272, 0.5501246, -0.005181072, 1, 0.5411765, 0, 1,
-1.254502, 3.000376, -2.086524, 1, 0.5450981, 0, 1,
-1.25357, 0.7645387, -2.116902, 1, 0.5529412, 0, 1,
-1.248352, 0.7270625, -1.606229, 1, 0.5568628, 0, 1,
-1.247808, 0.7202469, -1.141619, 1, 0.5647059, 0, 1,
-1.246443, 0.424215, -2.371754, 1, 0.5686275, 0, 1,
-1.242367, -0.7979074, -3.863553, 1, 0.5764706, 0, 1,
-1.240849, -1.51018, -3.089061, 1, 0.5803922, 0, 1,
-1.228774, -0.6491331, -2.687972, 1, 0.5882353, 0, 1,
-1.227628, -1.26924, -1.289341, 1, 0.5921569, 0, 1,
-1.203797, 0.8468246, -2.126915, 1, 0.6, 0, 1,
-1.191442, 0.3900962, -0.6168702, 1, 0.6078432, 0, 1,
-1.177236, 1.008537, -1.806988, 1, 0.6117647, 0, 1,
-1.174881, -0.485064, -2.919254, 1, 0.6196079, 0, 1,
-1.17263, -0.4412747, -2.214468, 1, 0.6235294, 0, 1,
-1.169498, -0.8597081, -3.211943, 1, 0.6313726, 0, 1,
-1.167666, -0.09157657, -2.795328, 1, 0.6352941, 0, 1,
-1.159225, 1.236243, -1.078303, 1, 0.6431373, 0, 1,
-1.155601, -1.827881, -1.237438, 1, 0.6470588, 0, 1,
-1.155388, 0.422668, -1.77394, 1, 0.654902, 0, 1,
-1.151424, 0.1075212, -1.701414, 1, 0.6588235, 0, 1,
-1.144137, 0.1971558, -1.568101, 1, 0.6666667, 0, 1,
-1.142134, 1.539055, 0.3759973, 1, 0.6705883, 0, 1,
-1.140534, -1.109754, -2.797275, 1, 0.6784314, 0, 1,
-1.136142, 1.404649, -2.314104, 1, 0.682353, 0, 1,
-1.135099, -0.009826122, -3.78677, 1, 0.6901961, 0, 1,
-1.130078, -0.5358349, -1.863855, 1, 0.6941177, 0, 1,
-1.127448, -1.233926, -4.18408, 1, 0.7019608, 0, 1,
-1.126786, -1.629081, -0.1727116, 1, 0.7098039, 0, 1,
-1.118027, 0.02706449, -0.1983192, 1, 0.7137255, 0, 1,
-1.112922, 1.427679, 0.1074881, 1, 0.7215686, 0, 1,
-1.109911, -0.2290962, -2.018253, 1, 0.7254902, 0, 1,
-1.104232, -0.5260319, -3.611693, 1, 0.7333333, 0, 1,
-1.096741, 0.08996511, -1.015548, 1, 0.7372549, 0, 1,
-1.096345, -0.003080777, -1.463343, 1, 0.7450981, 0, 1,
-1.09381, -0.4726782, -0.7901233, 1, 0.7490196, 0, 1,
-1.078907, -0.8860333, -0.6185797, 1, 0.7568628, 0, 1,
-1.063439, -0.8193327, -1.303538, 1, 0.7607843, 0, 1,
-1.062815, -2.283013, -2.294024, 1, 0.7686275, 0, 1,
-1.06002, -0.3430045, -2.575904, 1, 0.772549, 0, 1,
-1.059301, 1.348972, -3.122713, 1, 0.7803922, 0, 1,
-1.052093, -0.1339882, -1.489807, 1, 0.7843137, 0, 1,
-1.045946, -0.2086827, -1.145779, 1, 0.7921569, 0, 1,
-1.035877, -0.1867066, -1.961033, 1, 0.7960784, 0, 1,
-1.035856, -0.2009337, -1.400538, 1, 0.8039216, 0, 1,
-1.033858, 0.2326042, -1.152567, 1, 0.8117647, 0, 1,
-1.031565, -1.011697, -1.791389, 1, 0.8156863, 0, 1,
-1.030999, -1.39568, -2.63298, 1, 0.8235294, 0, 1,
-1.024918, -1.770265, -1.563943, 1, 0.827451, 0, 1,
-1.01942, -0.358482, -0.9400771, 1, 0.8352941, 0, 1,
-1.01493, 0.3635889, -0.2573467, 1, 0.8392157, 0, 1,
-1.003822, 0.2543521, 0.02667544, 1, 0.8470588, 0, 1,
-1.003045, 1.555189, -1.903691, 1, 0.8509804, 0, 1,
-1.002206, -0.4258478, -0.7503301, 1, 0.8588235, 0, 1,
-1.000347, -0.3207327, -2.471898, 1, 0.8627451, 0, 1,
-0.9987376, -0.8792998, -3.295591, 1, 0.8705882, 0, 1,
-0.9968401, 0.190272, -0.2487258, 1, 0.8745098, 0, 1,
-0.9907917, -1.788958, -4.465013, 1, 0.8823529, 0, 1,
-0.9850638, 0.5382107, -1.238366, 1, 0.8862745, 0, 1,
-0.984172, 1.248674, -2.543618, 1, 0.8941177, 0, 1,
-0.9833755, 0.1284765, -1.208909, 1, 0.8980392, 0, 1,
-0.9746383, 0.5643443, -1.799649, 1, 0.9058824, 0, 1,
-0.9723352, 0.4714325, 0.4605052, 1, 0.9137255, 0, 1,
-0.9709479, -1.069593, -3.630364, 1, 0.9176471, 0, 1,
-0.9696325, 0.106363, -3.117885, 1, 0.9254902, 0, 1,
-0.9688104, 0.6147334, -1.983, 1, 0.9294118, 0, 1,
-0.9634902, 0.7268382, 0.7969369, 1, 0.9372549, 0, 1,
-0.9617471, 1.211835, -1.304164, 1, 0.9411765, 0, 1,
-0.9592869, -0.3354835, -1.817831, 1, 0.9490196, 0, 1,
-0.9565607, 0.3776002, -1.58338, 1, 0.9529412, 0, 1,
-0.9525355, 0.8382351, -0.7316388, 1, 0.9607843, 0, 1,
-0.950834, -0.6177367, -1.211142, 1, 0.9647059, 0, 1,
-0.9474972, 0.1770996, 0.326525, 1, 0.972549, 0, 1,
-0.9349685, -0.499077, -1.206147, 1, 0.9764706, 0, 1,
-0.9299112, -2.307654, -1.951164, 1, 0.9843137, 0, 1,
-0.9265481, -0.5218236, -0.6520573, 1, 0.9882353, 0, 1,
-0.9257231, 1.303747, 0.2848749, 1, 0.9960784, 0, 1,
-0.9197981, -0.447381, -2.075593, 0.9960784, 1, 0, 1,
-0.918284, -0.8583958, -1.46084, 0.9921569, 1, 0, 1,
-0.9120612, 0.7977585, -2.75348, 0.9843137, 1, 0, 1,
-0.9092195, 1.596743, -0.4343406, 0.9803922, 1, 0, 1,
-0.9013994, -1.426995, -1.961974, 0.972549, 1, 0, 1,
-0.9000195, 0.3650263, -0.9226398, 0.9686275, 1, 0, 1,
-0.8988284, -0.3187852, -1.18644, 0.9607843, 1, 0, 1,
-0.8940232, -0.6558144, -4.057868, 0.9568627, 1, 0, 1,
-0.8919042, 0.7128243, -0.3121438, 0.9490196, 1, 0, 1,
-0.8867818, 2.628963, -0.1551546, 0.945098, 1, 0, 1,
-0.8841255, -0.3175676, -3.038335, 0.9372549, 1, 0, 1,
-0.867391, 1.635342, -0.5872273, 0.9333333, 1, 0, 1,
-0.861964, -0.7879173, -2.019148, 0.9254902, 1, 0, 1,
-0.8603386, -0.3648399, -0.7712914, 0.9215686, 1, 0, 1,
-0.8551216, -0.3176812, -1.958763, 0.9137255, 1, 0, 1,
-0.8532684, -1.078573, -2.842283, 0.9098039, 1, 0, 1,
-0.8499029, -0.6710835, -1.921135, 0.9019608, 1, 0, 1,
-0.8494521, -2.242718, -2.491526, 0.8941177, 1, 0, 1,
-0.8487543, -1.882252, -2.068541, 0.8901961, 1, 0, 1,
-0.8360187, -1.378589, -2.78953, 0.8823529, 1, 0, 1,
-0.8323921, -0.01142312, -1.536586, 0.8784314, 1, 0, 1,
-0.8183177, 0.2218796, -2.068842, 0.8705882, 1, 0, 1,
-0.8161877, 1.037616, -0.7252678, 0.8666667, 1, 0, 1,
-0.813504, 0.3162727, -1.323371, 0.8588235, 1, 0, 1,
-0.80927, 1.490981, 0.1579751, 0.854902, 1, 0, 1,
-0.807811, 1.326219, 1.354007, 0.8470588, 1, 0, 1,
-0.8014752, 1.427277, -2.108672, 0.8431373, 1, 0, 1,
-0.8005009, -1.475743, -4.438554, 0.8352941, 1, 0, 1,
-0.7916623, 0.649657, 0.1263311, 0.8313726, 1, 0, 1,
-0.790725, 0.4631983, -1.362652, 0.8235294, 1, 0, 1,
-0.7892079, -0.3060659, -2.110836, 0.8196079, 1, 0, 1,
-0.7811618, 0.0450024, -1.485494, 0.8117647, 1, 0, 1,
-0.7761022, -1.337946, -3.273538, 0.8078431, 1, 0, 1,
-0.7734263, -1.596456, -3.131441, 0.8, 1, 0, 1,
-0.7716346, -0.4278211, -3.03145, 0.7921569, 1, 0, 1,
-0.7685151, -0.7410618, -1.638978, 0.7882353, 1, 0, 1,
-0.7682825, 0.5994834, 0.5207851, 0.7803922, 1, 0, 1,
-0.7648386, 1.900197, -0.4537726, 0.7764706, 1, 0, 1,
-0.7644708, -1.625504, -1.99732, 0.7686275, 1, 0, 1,
-0.7639364, -1.069405, -3.922385, 0.7647059, 1, 0, 1,
-0.7638801, 0.8315862, -2.483516, 0.7568628, 1, 0, 1,
-0.7633705, 1.274614, 0.5159621, 0.7529412, 1, 0, 1,
-0.7615659, -1.098572, -3.498369, 0.7450981, 1, 0, 1,
-0.7608854, -1.450028, -5.480141, 0.7411765, 1, 0, 1,
-0.7596802, -0.7112669, -1.745806, 0.7333333, 1, 0, 1,
-0.7586282, -0.399576, -2.912279, 0.7294118, 1, 0, 1,
-0.7579734, -0.2937423, -0.5189605, 0.7215686, 1, 0, 1,
-0.7572358, 0.221979, -1.179088, 0.7176471, 1, 0, 1,
-0.756375, 1.220274, -1.120611, 0.7098039, 1, 0, 1,
-0.7561455, -0.4376296, -2.793324, 0.7058824, 1, 0, 1,
-0.7558282, 0.4509789, 0.1889014, 0.6980392, 1, 0, 1,
-0.7545635, -0.5086218, -1.592036, 0.6901961, 1, 0, 1,
-0.7486907, -0.346216, -1.762891, 0.6862745, 1, 0, 1,
-0.7452213, 0.9443058, -0.7043601, 0.6784314, 1, 0, 1,
-0.7437311, -1.224392, -2.09842, 0.6745098, 1, 0, 1,
-0.7429298, 0.5337288, -2.03212, 0.6666667, 1, 0, 1,
-0.7400638, -0.3991195, -1.068876, 0.6627451, 1, 0, 1,
-0.7345451, -1.688049, -1.532476, 0.654902, 1, 0, 1,
-0.734326, -1.080627, -3.118817, 0.6509804, 1, 0, 1,
-0.7273305, 0.561367, -2.64895, 0.6431373, 1, 0, 1,
-0.725777, 0.7914569, -1.432312, 0.6392157, 1, 0, 1,
-0.7251334, 1.559314, 0.3470576, 0.6313726, 1, 0, 1,
-0.7162688, 0.9202936, -2.249357, 0.627451, 1, 0, 1,
-0.7153872, 0.6879609, -0.1626394, 0.6196079, 1, 0, 1,
-0.7129056, -1.197338, -4.214023, 0.6156863, 1, 0, 1,
-0.7128268, -0.06324878, -3.024619, 0.6078432, 1, 0, 1,
-0.7115213, 0.4153543, 0.4513805, 0.6039216, 1, 0, 1,
-0.708427, 0.7772412, -3.055007, 0.5960785, 1, 0, 1,
-0.7055616, 0.7800903, -0.3404933, 0.5882353, 1, 0, 1,
-0.7034525, 0.8549013, 0.03095797, 0.5843138, 1, 0, 1,
-0.7024424, 0.4532111, 0.5067872, 0.5764706, 1, 0, 1,
-0.7013054, -1.583652, -2.808884, 0.572549, 1, 0, 1,
-0.7009838, 0.3945321, -1.20304, 0.5647059, 1, 0, 1,
-0.6986644, 2.104353, 0.1637332, 0.5607843, 1, 0, 1,
-0.6963711, -2.405677, -1.559854, 0.5529412, 1, 0, 1,
-0.6930537, 0.6384241, -1.963822, 0.5490196, 1, 0, 1,
-0.6929598, -1.195666, -2.95397, 0.5411765, 1, 0, 1,
-0.6903442, 0.3702694, -1.135605, 0.5372549, 1, 0, 1,
-0.6814541, -0.3124002, -2.493464, 0.5294118, 1, 0, 1,
-0.6809926, -0.7023836, -3.001377, 0.5254902, 1, 0, 1,
-0.6790777, 0.076964, -0.353917, 0.5176471, 1, 0, 1,
-0.6742503, -0.5849649, -3.806832, 0.5137255, 1, 0, 1,
-0.6741746, -0.3735189, -2.164913, 0.5058824, 1, 0, 1,
-0.6701298, -0.880954, -3.69559, 0.5019608, 1, 0, 1,
-0.6658667, 1.30541, -0.7802699, 0.4941176, 1, 0, 1,
-0.6639973, 0.218348, -1.301773, 0.4862745, 1, 0, 1,
-0.6627023, -1.958461, -3.033391, 0.4823529, 1, 0, 1,
-0.6605244, 0.1568982, -0.2435665, 0.4745098, 1, 0, 1,
-0.6593491, -0.1201866, -0.8746007, 0.4705882, 1, 0, 1,
-0.6574388, -1.215364, -1.996496, 0.4627451, 1, 0, 1,
-0.6544564, 1.069227, -0.2498667, 0.4588235, 1, 0, 1,
-0.6529194, -1.868084, -2.454775, 0.4509804, 1, 0, 1,
-0.6518199, -0.3910766, -2.071741, 0.4470588, 1, 0, 1,
-0.6514571, 1.212529, -0.1613607, 0.4392157, 1, 0, 1,
-0.6490372, 0.359165, -2.53388, 0.4352941, 1, 0, 1,
-0.6450894, 1.092031, -1.567524, 0.427451, 1, 0, 1,
-0.6439247, 1.667774, -0.434161, 0.4235294, 1, 0, 1,
-0.6432722, 0.7741221, -0.6384901, 0.4156863, 1, 0, 1,
-0.6392554, -0.507147, -2.634105, 0.4117647, 1, 0, 1,
-0.6380824, 0.6584016, -0.7366664, 0.4039216, 1, 0, 1,
-0.6363819, -0.3931207, -3.248626, 0.3960784, 1, 0, 1,
-0.6360202, -0.3523184, -1.15995, 0.3921569, 1, 0, 1,
-0.635351, 0.9429197, -1.714808, 0.3843137, 1, 0, 1,
-0.6316828, -1.904307, -3.800843, 0.3803922, 1, 0, 1,
-0.631572, -0.2239063, -2.445623, 0.372549, 1, 0, 1,
-0.6289033, -1.052419, -1.075675, 0.3686275, 1, 0, 1,
-0.624379, -0.391667, -3.51769, 0.3607843, 1, 0, 1,
-0.6175734, -0.4536667, -2.409703, 0.3568628, 1, 0, 1,
-0.616328, 3.106241, 0.2234262, 0.3490196, 1, 0, 1,
-0.6153162, 1.075173, -1.341163, 0.345098, 1, 0, 1,
-0.6094676, -0.8411579, -3.051655, 0.3372549, 1, 0, 1,
-0.6092879, -0.123419, -2.986146, 0.3333333, 1, 0, 1,
-0.6009927, 1.009835, -1.536496, 0.3254902, 1, 0, 1,
-0.5975742, -1.46857, -3.761867, 0.3215686, 1, 0, 1,
-0.595302, -1.14902, -1.430173, 0.3137255, 1, 0, 1,
-0.5948479, -0.1665754, -2.39924, 0.3098039, 1, 0, 1,
-0.5896267, 1.555905, -0.2858132, 0.3019608, 1, 0, 1,
-0.5834677, -0.1769158, -1.647503, 0.2941177, 1, 0, 1,
-0.5828368, -2.514313, -4.658199, 0.2901961, 1, 0, 1,
-0.5816511, -0.2648932, -0.5750835, 0.282353, 1, 0, 1,
-0.5808328, -0.177662, -0.822583, 0.2784314, 1, 0, 1,
-0.5747728, -0.1907289, -2.776509, 0.2705882, 1, 0, 1,
-0.5710348, 0.1776168, -2.271508, 0.2666667, 1, 0, 1,
-0.5694472, -0.9142563, -3.318503, 0.2588235, 1, 0, 1,
-0.5677663, -0.1654423, -3.104154, 0.254902, 1, 0, 1,
-0.5675367, -0.6343315, -1.836682, 0.2470588, 1, 0, 1,
-0.5658363, 0.4063452, -1.224347, 0.2431373, 1, 0, 1,
-0.5633802, 1.091577, -1.228036, 0.2352941, 1, 0, 1,
-0.5597575, 0.5751296, -0.9215907, 0.2313726, 1, 0, 1,
-0.5531502, -0.6277302, -3.115829, 0.2235294, 1, 0, 1,
-0.5478885, -0.2735365, -1.436749, 0.2196078, 1, 0, 1,
-0.5432705, -0.01964115, -2.455815, 0.2117647, 1, 0, 1,
-0.543086, -0.8110157, -2.578653, 0.2078431, 1, 0, 1,
-0.5392868, -0.07247475, -3.038856, 0.2, 1, 0, 1,
-0.5377592, 0.2159667, -1.755368, 0.1921569, 1, 0, 1,
-0.5363156, -1.945009, -3.94834, 0.1882353, 1, 0, 1,
-0.534595, 1.537995, 0.06966108, 0.1803922, 1, 0, 1,
-0.5323119, 0.2418432, -1.199, 0.1764706, 1, 0, 1,
-0.5295932, -1.052872, -2.191349, 0.1686275, 1, 0, 1,
-0.52709, 0.4099282, -0.8386901, 0.1647059, 1, 0, 1,
-0.5265407, -0.9413217, -4.547462, 0.1568628, 1, 0, 1,
-0.5251297, -0.9450374, -2.275837, 0.1529412, 1, 0, 1,
-0.524985, -0.7753944, -1.772771, 0.145098, 1, 0, 1,
-0.5230044, -0.5909824, -2.697672, 0.1411765, 1, 0, 1,
-0.5158893, 0.532888, -0.6506664, 0.1333333, 1, 0, 1,
-0.5136977, 1.56871, 0.1570535, 0.1294118, 1, 0, 1,
-0.5088513, 0.1476662, -0.4421439, 0.1215686, 1, 0, 1,
-0.5071504, -0.3707772, -2.76906, 0.1176471, 1, 0, 1,
-0.5056732, 0.9113904, 0.04321251, 0.1098039, 1, 0, 1,
-0.4977651, 0.2133049, -1.627178, 0.1058824, 1, 0, 1,
-0.4949611, -0.1710436, -3.209199, 0.09803922, 1, 0, 1,
-0.4932071, -0.5704401, -2.840076, 0.09019608, 1, 0, 1,
-0.4919825, -0.7097973, -2.914448, 0.08627451, 1, 0, 1,
-0.4909783, 0.5780673, 0.007742097, 0.07843138, 1, 0, 1,
-0.4892564, 1.125605, -0.3480783, 0.07450981, 1, 0, 1,
-0.4869785, -0.09321411, -0.5674565, 0.06666667, 1, 0, 1,
-0.4794591, -0.057389, -0.3150113, 0.0627451, 1, 0, 1,
-0.4790842, 0.2984368, -2.658184, 0.05490196, 1, 0, 1,
-0.4740962, -1.024458, -4.146515, 0.05098039, 1, 0, 1,
-0.4721775, 1.176692, 0.07548379, 0.04313726, 1, 0, 1,
-0.471044, 0.6197588, -0.6528903, 0.03921569, 1, 0, 1,
-0.4703692, 0.04106787, -1.341135, 0.03137255, 1, 0, 1,
-0.464097, 1.381056, 0.7652797, 0.02745098, 1, 0, 1,
-0.4634184, -0.5118999, -0.3288133, 0.01960784, 1, 0, 1,
-0.4621063, 0.02971973, -1.291934, 0.01568628, 1, 0, 1,
-0.4550112, 0.4901204, -1.577611, 0.007843138, 1, 0, 1,
-0.4545198, 0.4100708, -2.839382, 0.003921569, 1, 0, 1,
-0.4545041, 0.7433957, 0.2655984, 0, 1, 0.003921569, 1,
-0.451075, -0.3723938, -1.691053, 0, 1, 0.01176471, 1,
-0.4489263, 0.6267655, 0.1994358, 0, 1, 0.01568628, 1,
-0.4465678, 0.2595709, -2.009583, 0, 1, 0.02352941, 1,
-0.4447392, -0.002618388, -3.60314, 0, 1, 0.02745098, 1,
-0.4441299, -1.934831, -3.664055, 0, 1, 0.03529412, 1,
-0.4437937, -0.9889215, -2.832005, 0, 1, 0.03921569, 1,
-0.4434035, 1.132299, -0.5883712, 0, 1, 0.04705882, 1,
-0.4397016, 0.7403934, 1.253206, 0, 1, 0.05098039, 1,
-0.4371459, -1.418853, -3.442039, 0, 1, 0.05882353, 1,
-0.4330824, 1.078461, -0.2804968, 0, 1, 0.0627451, 1,
-0.4324256, -0.3897041, -3.608046, 0, 1, 0.07058824, 1,
-0.4323734, 1.17642, -1.30438, 0, 1, 0.07450981, 1,
-0.4319753, -0.1822989, -2.521667, 0, 1, 0.08235294, 1,
-0.4219565, 0.7608547, -1.248994, 0, 1, 0.08627451, 1,
-0.420637, 1.482625, 0.2850636, 0, 1, 0.09411765, 1,
-0.4189802, 0.211573, -0.9013274, 0, 1, 0.1019608, 1,
-0.4165064, 1.066904, -0.3234856, 0, 1, 0.1058824, 1,
-0.4131892, 0.2767971, 0.8268449, 0, 1, 0.1137255, 1,
-0.4075705, -0.4980102, -2.25843, 0, 1, 0.1176471, 1,
-0.4057775, -1.17525, -2.883734, 0, 1, 0.1254902, 1,
-0.4041167, 0.3820328, -0.4388916, 0, 1, 0.1294118, 1,
-0.4012101, 0.8665854, -1.392128, 0, 1, 0.1372549, 1,
-0.3949498, -3.539616, -3.005243, 0, 1, 0.1411765, 1,
-0.3894665, -0.8971368, -2.391145, 0, 1, 0.1490196, 1,
-0.3881263, 0.2103197, -0.9439522, 0, 1, 0.1529412, 1,
-0.3871248, 0.2145848, 0.1281327, 0, 1, 0.1607843, 1,
-0.3866396, -1.566296, -1.592297, 0, 1, 0.1647059, 1,
-0.3801829, 0.491553, 0.58507, 0, 1, 0.172549, 1,
-0.3801455, 0.1015688, -1.595147, 0, 1, 0.1764706, 1,
-0.3777464, 1.976279, 0.8939406, 0, 1, 0.1843137, 1,
-0.3743396, 1.798383, 0.03338063, 0, 1, 0.1882353, 1,
-0.3739106, 0.6958348, -1.756511, 0, 1, 0.1960784, 1,
-0.3712033, 1.633757, 0.3855665, 0, 1, 0.2039216, 1,
-0.3710096, -0.9171617, -4.19722, 0, 1, 0.2078431, 1,
-0.3694937, 0.02044296, -2.056141, 0, 1, 0.2156863, 1,
-0.3670674, 0.3948424, -2.295422, 0, 1, 0.2196078, 1,
-0.3651635, -0.8627665, -3.342033, 0, 1, 0.227451, 1,
-0.3628446, 1.022767, -0.7048126, 0, 1, 0.2313726, 1,
-0.3583548, -1.632977, -1.787786, 0, 1, 0.2392157, 1,
-0.3570673, 0.9417821, -0.0758904, 0, 1, 0.2431373, 1,
-0.3558929, -0.0710488, -2.205665, 0, 1, 0.2509804, 1,
-0.3520994, -0.1683286, -2.025081, 0, 1, 0.254902, 1,
-0.3517236, 0.07001554, -1.62818, 0, 1, 0.2627451, 1,
-0.3450645, 0.3088306, 0.1105274, 0, 1, 0.2666667, 1,
-0.344681, -0.3531902, 0.1986919, 0, 1, 0.2745098, 1,
-0.3445087, -1.292343, -2.241554, 0, 1, 0.2784314, 1,
-0.3429664, 0.6772845, -1.099189, 0, 1, 0.2862745, 1,
-0.339211, 0.02615056, -1.895552, 0, 1, 0.2901961, 1,
-0.3375326, -1.641588, -3.048099, 0, 1, 0.2980392, 1,
-0.3358067, 0.1623034, -0.1916902, 0, 1, 0.3058824, 1,
-0.3314059, -0.2336771, -0.566057, 0, 1, 0.3098039, 1,
-0.3282779, 0.08775441, -0.1907851, 0, 1, 0.3176471, 1,
-0.3255574, 1.246243, -0.6325365, 0, 1, 0.3215686, 1,
-0.3253317, 0.2082353, -2.883084, 0, 1, 0.3294118, 1,
-0.3227532, 0.7826043, -0.08980822, 0, 1, 0.3333333, 1,
-0.3198464, 0.1715456, -3.210913, 0, 1, 0.3411765, 1,
-0.3182982, -1.439391, -4.828908, 0, 1, 0.345098, 1,
-0.3163737, -0.9634108, -2.97124, 0, 1, 0.3529412, 1,
-0.3160293, 0.580576, -1.081139, 0, 1, 0.3568628, 1,
-0.3153407, 0.1210583, -1.370444, 0, 1, 0.3647059, 1,
-0.3143166, 1.367955, -1.067167, 0, 1, 0.3686275, 1,
-0.3112055, 2.104733, 0.7200286, 0, 1, 0.3764706, 1,
-0.3084467, -1.5248, -2.891511, 0, 1, 0.3803922, 1,
-0.2987315, -0.5160171, -2.159038, 0, 1, 0.3882353, 1,
-0.2966053, 0.2135969, -3.076247, 0, 1, 0.3921569, 1,
-0.2964278, 0.5715796, -1.444796, 0, 1, 0.4, 1,
-0.2914093, 0.6016982, 0.317178, 0, 1, 0.4078431, 1,
-0.2898926, -0.2336471, -3.649101, 0, 1, 0.4117647, 1,
-0.2897844, -1.509262, -0.8952657, 0, 1, 0.4196078, 1,
-0.2885513, 0.9227798, 0.3446736, 0, 1, 0.4235294, 1,
-0.288162, -0.0186033, -3.578901, 0, 1, 0.4313726, 1,
-0.2850368, -0.2579421, -1.935113, 0, 1, 0.4352941, 1,
-0.276587, 0.5557265, 1.269907, 0, 1, 0.4431373, 1,
-0.2683333, -2.204899, -2.387938, 0, 1, 0.4470588, 1,
-0.2675834, -0.6375655, -1.377106, 0, 1, 0.454902, 1,
-0.2631922, 0.07112643, -3.067536, 0, 1, 0.4588235, 1,
-0.261891, 1.071869, 0.2168659, 0, 1, 0.4666667, 1,
-0.2603802, 1.093163, -1.385473, 0, 1, 0.4705882, 1,
-0.2584826, 0.2568425, -1.271414, 0, 1, 0.4784314, 1,
-0.2574955, -0.08092533, -2.096344, 0, 1, 0.4823529, 1,
-0.2554832, 1.94118, 0.5438075, 0, 1, 0.4901961, 1,
-0.2554812, 0.7153838, 0.3716131, 0, 1, 0.4941176, 1,
-0.2547185, -1.205654, -2.223299, 0, 1, 0.5019608, 1,
-0.2526007, 0.2805088, -0.1392476, 0, 1, 0.509804, 1,
-0.2489273, 0.7357363, -0.5541084, 0, 1, 0.5137255, 1,
-0.2485893, -0.490263, -2.075037, 0, 1, 0.5215687, 1,
-0.2336865, 0.9709007, 0.6259035, 0, 1, 0.5254902, 1,
-0.2327462, 0.5615796, -0.9577891, 0, 1, 0.5333334, 1,
-0.2293665, -0.575649, -3.42451, 0, 1, 0.5372549, 1,
-0.2271711, -0.4746479, -2.650086, 0, 1, 0.5450981, 1,
-0.2213806, -0.3106211, -1.411565, 0, 1, 0.5490196, 1,
-0.2199903, -1.825429, -3.968134, 0, 1, 0.5568628, 1,
-0.2191504, -1.169466, -4.404748, 0, 1, 0.5607843, 1,
-0.2166851, -0.946285, -1.411361, 0, 1, 0.5686275, 1,
-0.2125871, -1.558429, -3.342707, 0, 1, 0.572549, 1,
-0.2088038, -1.427635, -2.747285, 0, 1, 0.5803922, 1,
-0.2073809, -0.3921834, -0.8521195, 0, 1, 0.5843138, 1,
-0.2054624, 0.2349754, -0.2531887, 0, 1, 0.5921569, 1,
-0.2037409, 0.8905497, -0.8879817, 0, 1, 0.5960785, 1,
-0.1985801, 0.6365204, -1.756193, 0, 1, 0.6039216, 1,
-0.1981762, -0.914489, -2.302885, 0, 1, 0.6117647, 1,
-0.1928347, -0.0716543, -1.485923, 0, 1, 0.6156863, 1,
-0.1877118, -0.920639, -2.578516, 0, 1, 0.6235294, 1,
-0.1843196, -1.534507, -2.621095, 0, 1, 0.627451, 1,
-0.1833063, 0.9894047, 0.2493892, 0, 1, 0.6352941, 1,
-0.1814901, -0.3184857, -2.417778, 0, 1, 0.6392157, 1,
-0.1813027, 0.6679521, 0.3744459, 0, 1, 0.6470588, 1,
-0.1808651, -0.2720959, -4.305705, 0, 1, 0.6509804, 1,
-0.1807916, 0.7338339, -0.2168533, 0, 1, 0.6588235, 1,
-0.1773764, 0.9155777, 1.387635, 0, 1, 0.6627451, 1,
-0.1749697, -0.8945968, -2.792207, 0, 1, 0.6705883, 1,
-0.1745956, -0.3145857, -2.955821, 0, 1, 0.6745098, 1,
-0.1708879, -0.3791994, -1.797973, 0, 1, 0.682353, 1,
-0.1667419, 0.5409086, -0.2444553, 0, 1, 0.6862745, 1,
-0.1657622, 0.03587429, -1.887142, 0, 1, 0.6941177, 1,
-0.1639688, 0.9775559, 0.1894268, 0, 1, 0.7019608, 1,
-0.1593221, 0.7588195, 0.01017515, 0, 1, 0.7058824, 1,
-0.1587858, 0.5793008, -0.122309, 0, 1, 0.7137255, 1,
-0.1567791, -0.1173166, -3.330679, 0, 1, 0.7176471, 1,
-0.1565802, 0.02869225, -1.72628, 0, 1, 0.7254902, 1,
-0.1483884, -0.2615507, -3.401647, 0, 1, 0.7294118, 1,
-0.1456736, 0.6563758, -0.1486199, 0, 1, 0.7372549, 1,
-0.1402087, 0.9437311, -0.5381882, 0, 1, 0.7411765, 1,
-0.1318299, 0.2435892, 0.09942126, 0, 1, 0.7490196, 1,
-0.131209, 2.132735, 1.139945, 0, 1, 0.7529412, 1,
-0.1298297, -0.4293474, -3.351561, 0, 1, 0.7607843, 1,
-0.1289174, -1.176297, -3.433136, 0, 1, 0.7647059, 1,
-0.1248461, -0.3032855, -2.964125, 0, 1, 0.772549, 1,
-0.1196707, 0.4542291, 1.185353, 0, 1, 0.7764706, 1,
-0.1186812, 1.108786, -0.1776279, 0, 1, 0.7843137, 1,
-0.118638, 0.2071971, -1.460241, 0, 1, 0.7882353, 1,
-0.1183528, 0.09997362, 0.02808205, 0, 1, 0.7960784, 1,
-0.117687, 0.2336249, -0.4633489, 0, 1, 0.8039216, 1,
-0.1142641, 0.1593935, -1.237692, 0, 1, 0.8078431, 1,
-0.1088004, -1.037088, -1.277319, 0, 1, 0.8156863, 1,
-0.1008981, 0.4373949, -0.9853951, 0, 1, 0.8196079, 1,
-0.09658266, -0.1012112, -3.085257, 0, 1, 0.827451, 1,
-0.0938677, 1.155986, 0.9212033, 0, 1, 0.8313726, 1,
-0.09357081, 1.369927, -0.02830857, 0, 1, 0.8392157, 1,
-0.09248435, 0.7181177, -0.6452712, 0, 1, 0.8431373, 1,
-0.08730389, 0.1929367, -1.284172, 0, 1, 0.8509804, 1,
-0.08392386, 0.8673019, 0.3122138, 0, 1, 0.854902, 1,
-0.08269284, -0.2211189, -3.91246, 0, 1, 0.8627451, 1,
-0.08004276, -0.6032795, -2.305464, 0, 1, 0.8666667, 1,
-0.07839081, -0.9331387, -2.30656, 0, 1, 0.8745098, 1,
-0.0752032, 0.03823324, -1.80779, 0, 1, 0.8784314, 1,
-0.07438856, -1.127762, -2.682434, 0, 1, 0.8862745, 1,
-0.07231749, 0.8578838, 0.1296135, 0, 1, 0.8901961, 1,
-0.06516968, -0.805281, -3.760258, 0, 1, 0.8980392, 1,
-0.06462716, 0.3624864, 0.743634, 0, 1, 0.9058824, 1,
-0.05565577, 1.210277, -2.004279, 0, 1, 0.9098039, 1,
-0.05198727, 0.9962694, -1.316951, 0, 1, 0.9176471, 1,
-0.05187779, -0.8532272, -1.586442, 0, 1, 0.9215686, 1,
-0.05161755, -0.1012922, -3.328486, 0, 1, 0.9294118, 1,
-0.04878913, 1.901267, 0.6226639, 0, 1, 0.9333333, 1,
-0.04699165, 0.9347814, -1.252743, 0, 1, 0.9411765, 1,
-0.04172242, -0.3919483, -3.359159, 0, 1, 0.945098, 1,
-0.04146197, -0.2481663, -3.58076, 0, 1, 0.9529412, 1,
-0.03863585, -0.1113769, -3.039147, 0, 1, 0.9568627, 1,
-0.03793051, 0.2586414, 0.6882049, 0, 1, 0.9647059, 1,
-0.03079912, 0.1453051, 1.626973, 0, 1, 0.9686275, 1,
-0.02589459, 1.808389, -0.5279024, 0, 1, 0.9764706, 1,
-0.01540413, 0.5508445, -0.2729883, 0, 1, 0.9803922, 1,
-0.0097394, -0.4720297, -3.23465, 0, 1, 0.9882353, 1,
-0.004882443, -0.7717511, -3.238088, 0, 1, 0.9921569, 1,
-0.002341605, 1.436533, -0.9793312, 0, 1, 1, 1,
-0.001321746, 1.837583, 0.07590969, 0, 0.9921569, 1, 1,
0.006444035, -0.4679874, 3.113885, 0, 0.9882353, 1, 1,
0.01028077, 0.2247906, 0.8892447, 0, 0.9803922, 1, 1,
0.01127441, 0.4105083, -1.086299, 0, 0.9764706, 1, 1,
0.01256313, 0.3492079, -0.2262077, 0, 0.9686275, 1, 1,
0.01405132, 0.6927943, 0.6763911, 0, 0.9647059, 1, 1,
0.01424853, 1.077462, 0.2433819, 0, 0.9568627, 1, 1,
0.01958509, -0.4567837, 2.488579, 0, 0.9529412, 1, 1,
0.02197146, -1.723631, 2.809193, 0, 0.945098, 1, 1,
0.02711775, -0.1329017, 4.637036, 0, 0.9411765, 1, 1,
0.02715749, 0.3841929, 1.102519, 0, 0.9333333, 1, 1,
0.02789208, -0.5423627, 2.356879, 0, 0.9294118, 1, 1,
0.02824278, -0.6433583, 3.93545, 0, 0.9215686, 1, 1,
0.04237811, 0.4632194, -0.5731339, 0, 0.9176471, 1, 1,
0.04425043, 0.8209644, 0.9198274, 0, 0.9098039, 1, 1,
0.04442994, 0.1614165, -0.4673496, 0, 0.9058824, 1, 1,
0.04729877, 0.4315622, 0.8609846, 0, 0.8980392, 1, 1,
0.0479066, -1.875133, 1.737818, 0, 0.8901961, 1, 1,
0.04839042, -1.032711, 3.643832, 0, 0.8862745, 1, 1,
0.04880038, -1.036207, 3.774028, 0, 0.8784314, 1, 1,
0.04888119, 0.5861242, 0.8373343, 0, 0.8745098, 1, 1,
0.04897616, -0.1498901, 1.342788, 0, 0.8666667, 1, 1,
0.04948283, 0.6319792, -0.4138657, 0, 0.8627451, 1, 1,
0.05673725, -0.2694644, 2.216388, 0, 0.854902, 1, 1,
0.06017936, -0.7812554, 1.288165, 0, 0.8509804, 1, 1,
0.06227661, -1.69321, 2.52663, 0, 0.8431373, 1, 1,
0.07089828, -0.8266103, 3.372538, 0, 0.8392157, 1, 1,
0.0742568, 0.4171114, -1.169539, 0, 0.8313726, 1, 1,
0.07926339, -0.4321994, 2.767325, 0, 0.827451, 1, 1,
0.07932489, -0.7637371, 5.085865, 0, 0.8196079, 1, 1,
0.08057304, -0.3849395, 1.773185, 0, 0.8156863, 1, 1,
0.08285756, -0.9680642, 2.591816, 0, 0.8078431, 1, 1,
0.08312801, 1.554669, -1.795337, 0, 0.8039216, 1, 1,
0.0843716, -0.4438602, 1.942869, 0, 0.7960784, 1, 1,
0.08556033, -1.180492, 3.099529, 0, 0.7882353, 1, 1,
0.08666836, 0.3042151, 0.601984, 0, 0.7843137, 1, 1,
0.08845994, -0.1575485, 2.389699, 0, 0.7764706, 1, 1,
0.08873846, -0.5576656, 2.742953, 0, 0.772549, 1, 1,
0.09269463, -2.064545, 4.328401, 0, 0.7647059, 1, 1,
0.09705388, 0.7515787, 1.441275, 0, 0.7607843, 1, 1,
0.09770726, -0.4404947, 3.345272, 0, 0.7529412, 1, 1,
0.09930286, 1.61139, 1.610602, 0, 0.7490196, 1, 1,
0.1035309, 1.940912, 0.4331799, 0, 0.7411765, 1, 1,
0.1041014, 1.382273, 0.03877473, 0, 0.7372549, 1, 1,
0.1051939, 0.09375978, 2.165524, 0, 0.7294118, 1, 1,
0.1076656, 0.001383849, 1.139897, 0, 0.7254902, 1, 1,
0.1088997, 0.05071328, 2.606565, 0, 0.7176471, 1, 1,
0.1107557, -0.3237293, 4.025642, 0, 0.7137255, 1, 1,
0.1111364, -0.8151676, 1.809583, 0, 0.7058824, 1, 1,
0.1117907, -0.600518, 4.046631, 0, 0.6980392, 1, 1,
0.1122368, -1.020699, 3.121121, 0, 0.6941177, 1, 1,
0.1141752, 1.313924, 0.8599224, 0, 0.6862745, 1, 1,
0.1158701, 0.8721604, 0.09957998, 0, 0.682353, 1, 1,
0.1161706, 0.3431389, 1.459464, 0, 0.6745098, 1, 1,
0.1229588, 1.021412, 1.398887, 0, 0.6705883, 1, 1,
0.1324105, -1.53782, 3.676053, 0, 0.6627451, 1, 1,
0.1341693, 1.467004, 0.7856801, 0, 0.6588235, 1, 1,
0.1371936, -0.4496162, 4.685511, 0, 0.6509804, 1, 1,
0.1389744, 0.6598197, 0.3697562, 0, 0.6470588, 1, 1,
0.1479528, -0.6097263, 3.982073, 0, 0.6392157, 1, 1,
0.1513302, -0.3945312, 3.007589, 0, 0.6352941, 1, 1,
0.1531936, 1.716875, 0.02489826, 0, 0.627451, 1, 1,
0.1560954, 0.8638429, 0.939998, 0, 0.6235294, 1, 1,
0.1576509, -0.8398304, 3.98478, 0, 0.6156863, 1, 1,
0.1630068, -0.6289391, 0.4912778, 0, 0.6117647, 1, 1,
0.1654725, -0.5380342, 3.470817, 0, 0.6039216, 1, 1,
0.1660882, 0.7473544, -1.670769, 0, 0.5960785, 1, 1,
0.1662662, -0.217642, 1.907045, 0, 0.5921569, 1, 1,
0.1701446, -0.6397572, 2.610353, 0, 0.5843138, 1, 1,
0.173993, 0.05598829, 1.145771, 0, 0.5803922, 1, 1,
0.174248, -0.3200618, 2.933666, 0, 0.572549, 1, 1,
0.1785536, 0.8754711, 0.6545727, 0, 0.5686275, 1, 1,
0.1838587, -0.4965627, 3.689883, 0, 0.5607843, 1, 1,
0.1844873, 0.2287002, 0.4831845, 0, 0.5568628, 1, 1,
0.1878821, -0.5484541, 1.754833, 0, 0.5490196, 1, 1,
0.1883748, -1.038238, 3.642069, 0, 0.5450981, 1, 1,
0.1913317, 0.3560316, -0.5079476, 0, 0.5372549, 1, 1,
0.1921948, 0.1957719, 1.210008, 0, 0.5333334, 1, 1,
0.1924022, 1.511356, -0.06021803, 0, 0.5254902, 1, 1,
0.1935797, 1.301749, 1.012209, 0, 0.5215687, 1, 1,
0.1936593, 0.6031303, 0.2566031, 0, 0.5137255, 1, 1,
0.1947174, -0.1917046, 1.906571, 0, 0.509804, 1, 1,
0.1962283, 0.2638086, 0.8635474, 0, 0.5019608, 1, 1,
0.2009155, -0.04927092, 1.767248, 0, 0.4941176, 1, 1,
0.2056074, -0.6243348, 2.557525, 0, 0.4901961, 1, 1,
0.2063822, -2.824561, 4.545854, 0, 0.4823529, 1, 1,
0.2069211, -0.9395123, 2.424193, 0, 0.4784314, 1, 1,
0.2090969, 0.01440562, 0.7195979, 0, 0.4705882, 1, 1,
0.2121911, 0.0006980828, 2.210724, 0, 0.4666667, 1, 1,
0.2123782, -0.9677967, 3.391821, 0, 0.4588235, 1, 1,
0.215688, -0.6747316, 3.194451, 0, 0.454902, 1, 1,
0.216503, 0.6665339, -0.03961959, 0, 0.4470588, 1, 1,
0.2174363, 0.2577568, 0.2900004, 0, 0.4431373, 1, 1,
0.2176138, 0.3552281, 0.01974901, 0, 0.4352941, 1, 1,
0.220488, -1.639233, 2.426397, 0, 0.4313726, 1, 1,
0.2275064, 0.8426881, 0.4252236, 0, 0.4235294, 1, 1,
0.2298093, -0.1538779, 3.532785, 0, 0.4196078, 1, 1,
0.2318391, -2.385605, 2.741301, 0, 0.4117647, 1, 1,
0.2327749, -0.6233151, 3.240574, 0, 0.4078431, 1, 1,
0.2358678, 0.007659142, 1.450896, 0, 0.4, 1, 1,
0.245676, -1.19298, 3.666245, 0, 0.3921569, 1, 1,
0.2484065, 1.114283, 1.773486, 0, 0.3882353, 1, 1,
0.2497677, 1.364184, 0.7050476, 0, 0.3803922, 1, 1,
0.2501296, -0.3390851, 3.673026, 0, 0.3764706, 1, 1,
0.2575879, -0.1160712, 2.548577, 0, 0.3686275, 1, 1,
0.2621254, -0.4126125, 3.035539, 0, 0.3647059, 1, 1,
0.265193, 0.2329809, -1.935089, 0, 0.3568628, 1, 1,
0.2668748, 0.3332831, 1.820425, 0, 0.3529412, 1, 1,
0.2710293, -1.492971, 3.413934, 0, 0.345098, 1, 1,
0.2730878, -0.9822941, 3.766792, 0, 0.3411765, 1, 1,
0.2755025, -0.1710402, 2.312373, 0, 0.3333333, 1, 1,
0.2789163, -1.498712, 4.081354, 0, 0.3294118, 1, 1,
0.2796342, 0.698717, 2.169349, 0, 0.3215686, 1, 1,
0.279865, 2.08128, 1.116364, 0, 0.3176471, 1, 1,
0.2844754, 1.670247, 1.050217, 0, 0.3098039, 1, 1,
0.2853036, -0.8718284, 2.316686, 0, 0.3058824, 1, 1,
0.285598, -0.8225186, 4.758003, 0, 0.2980392, 1, 1,
0.2869763, 1.343446, 1.112842, 0, 0.2901961, 1, 1,
0.2880896, -0.9022028, 3.932716, 0, 0.2862745, 1, 1,
0.2930707, 0.2249582, 0.1752568, 0, 0.2784314, 1, 1,
0.2936878, -1.267991, 2.943981, 0, 0.2745098, 1, 1,
0.2945199, -0.5230086, 1.957505, 0, 0.2666667, 1, 1,
0.2971325, 0.7086412, -0.7373562, 0, 0.2627451, 1, 1,
0.2998254, 0.3292308, 0.3366508, 0, 0.254902, 1, 1,
0.3013549, -1.261541, 1.094413, 0, 0.2509804, 1, 1,
0.3016407, -0.8145485, 2.405225, 0, 0.2431373, 1, 1,
0.304194, -1.654803, 1.66119, 0, 0.2392157, 1, 1,
0.3047011, -0.1678275, 2.870036, 0, 0.2313726, 1, 1,
0.307848, 0.07037196, 0.8350984, 0, 0.227451, 1, 1,
0.3099646, -1.421666, 2.551517, 0, 0.2196078, 1, 1,
0.3101475, 2.073289, -0.2833545, 0, 0.2156863, 1, 1,
0.3137255, 0.362225, 1.830601, 0, 0.2078431, 1, 1,
0.3163573, 1.04425, 1.287677, 0, 0.2039216, 1, 1,
0.3170078, 1.090106, 0.3272339, 0, 0.1960784, 1, 1,
0.3198835, -0.9024909, 1.958866, 0, 0.1882353, 1, 1,
0.3209804, 0.2972775, -1.648024, 0, 0.1843137, 1, 1,
0.3221525, 1.865834, 1.774859, 0, 0.1764706, 1, 1,
0.3280492, -0.5512906, 3.193271, 0, 0.172549, 1, 1,
0.3301443, -0.9169996, 1.651588, 0, 0.1647059, 1, 1,
0.3308237, 0.9172708, -2.389324, 0, 0.1607843, 1, 1,
0.3312303, 0.0715116, 2.542199, 0, 0.1529412, 1, 1,
0.3344112, -1.34802, 2.25493, 0, 0.1490196, 1, 1,
0.3349888, 0.8292545, 1.641695, 0, 0.1411765, 1, 1,
0.3352133, 0.5603147, 1.349328, 0, 0.1372549, 1, 1,
0.3373385, 1.667136, 0.256661, 0, 0.1294118, 1, 1,
0.3385698, 0.9351907, 0.6128348, 0, 0.1254902, 1, 1,
0.3424504, -1.024765, 4.588292, 0, 0.1176471, 1, 1,
0.3446193, 0.9373104, 1.52603, 0, 0.1137255, 1, 1,
0.346328, 1.377502, -0.9507596, 0, 0.1058824, 1, 1,
0.3497233, 0.02080815, 1.992288, 0, 0.09803922, 1, 1,
0.3537232, -0.2347572, 2.389974, 0, 0.09411765, 1, 1,
0.3621737, -0.1114753, 1.34896, 0, 0.08627451, 1, 1,
0.3664923, 0.7412186, -0.8501721, 0, 0.08235294, 1, 1,
0.3710855, 0.1744954, -0.06633694, 0, 0.07450981, 1, 1,
0.3727514, 0.8666401, 0.6891878, 0, 0.07058824, 1, 1,
0.3752057, -0.369437, 3.984124, 0, 0.0627451, 1, 1,
0.3777727, 0.1594396, 1.374637, 0, 0.05882353, 1, 1,
0.3788209, 0.5606411, 1.590176, 0, 0.05098039, 1, 1,
0.3793803, -0.1209505, -0.2074886, 0, 0.04705882, 1, 1,
0.3812459, 0.1148449, 2.020897, 0, 0.03921569, 1, 1,
0.3813628, 0.7859813, 1.8729, 0, 0.03529412, 1, 1,
0.3835746, -1.251635, 3.244925, 0, 0.02745098, 1, 1,
0.3837557, 0.3083559, 1.871801, 0, 0.02352941, 1, 1,
0.3850501, 0.374346, 0.8848701, 0, 0.01568628, 1, 1,
0.3914521, -1.384665, 2.355799, 0, 0.01176471, 1, 1,
0.3925717, -0.4315893, 0.7419761, 0, 0.003921569, 1, 1,
0.3971634, 1.119154, 0.6156976, 0.003921569, 0, 1, 1,
0.3974527, 1.00499, 2.240645, 0.007843138, 0, 1, 1,
0.4013314, 0.2893366, 0.3118513, 0.01568628, 0, 1, 1,
0.4016851, 0.1783959, 0.8029884, 0.01960784, 0, 1, 1,
0.4021065, -1.139879, 2.916685, 0.02745098, 0, 1, 1,
0.4044367, -0.9794891, 4.046193, 0.03137255, 0, 1, 1,
0.4094607, -1.408272, 2.498247, 0.03921569, 0, 1, 1,
0.4101103, 0.02048922, 0.8761444, 0.04313726, 0, 1, 1,
0.4129016, 0.2200411, 1.043649, 0.05098039, 0, 1, 1,
0.413932, 1.355986, -0.005142828, 0.05490196, 0, 1, 1,
0.4174865, 0.02155742, 1.606453, 0.0627451, 0, 1, 1,
0.4182056, -0.4302342, 1.335616, 0.06666667, 0, 1, 1,
0.420737, -0.1919542, 0.8370266, 0.07450981, 0, 1, 1,
0.4214576, -1.359371, 1.87449, 0.07843138, 0, 1, 1,
0.42215, -3.474727, 1.556769, 0.08627451, 0, 1, 1,
0.4256231, -0.6699298, 2.339437, 0.09019608, 0, 1, 1,
0.4302917, -2.050719, 2.91349, 0.09803922, 0, 1, 1,
0.4309451, 1.415427, 0.5342903, 0.1058824, 0, 1, 1,
0.4353625, -1.153538, 3.817938, 0.1098039, 0, 1, 1,
0.4396927, -1.425845, 2.358415, 0.1176471, 0, 1, 1,
0.4406599, 0.8802975, 0.08591229, 0.1215686, 0, 1, 1,
0.454937, 1.265543, 1.32467, 0.1294118, 0, 1, 1,
0.458332, 0.4744097, 0.4305758, 0.1333333, 0, 1, 1,
0.4610454, 1.547162, 0.5690696, 0.1411765, 0, 1, 1,
0.4647777, 0.9252998, -0.005489425, 0.145098, 0, 1, 1,
0.4666974, -0.3162596, 1.375283, 0.1529412, 0, 1, 1,
0.4733557, -1.042556, 1.313904, 0.1568628, 0, 1, 1,
0.479572, -0.00373951, 1.003406, 0.1647059, 0, 1, 1,
0.4818946, -1.056389, 2.608347, 0.1686275, 0, 1, 1,
0.4880384, 1.414922, -0.6325301, 0.1764706, 0, 1, 1,
0.4920106, -0.1804523, 1.358674, 0.1803922, 0, 1, 1,
0.4972398, -0.01255417, -0.278804, 0.1882353, 0, 1, 1,
0.4988324, 0.1665903, 0.7422982, 0.1921569, 0, 1, 1,
0.5058628, 0.6268662, -1.662448, 0.2, 0, 1, 1,
0.5067468, -0.3431759, 1.66617, 0.2078431, 0, 1, 1,
0.5079807, 0.07464224, 2.814093, 0.2117647, 0, 1, 1,
0.5113816, 0.8294756, 0.7930637, 0.2196078, 0, 1, 1,
0.5148959, 1.759122, -0.7591016, 0.2235294, 0, 1, 1,
0.5171077, 2.41287, 2.154299, 0.2313726, 0, 1, 1,
0.520955, -1.815289, 2.876665, 0.2352941, 0, 1, 1,
0.5211338, 0.422554, 0.803328, 0.2431373, 0, 1, 1,
0.526023, 0.060696, 4.003439, 0.2470588, 0, 1, 1,
0.5269042, -0.3313376, 2.709564, 0.254902, 0, 1, 1,
0.5329498, -0.8718116, 2.363069, 0.2588235, 0, 1, 1,
0.5407411, 0.559651, -0.04442923, 0.2666667, 0, 1, 1,
0.541843, -0.6821467, 2.619437, 0.2705882, 0, 1, 1,
0.5439439, 0.5939924, -0.5979379, 0.2784314, 0, 1, 1,
0.5465527, 1.584858, 0.2620457, 0.282353, 0, 1, 1,
0.5520619, 0.2530513, 0.3535948, 0.2901961, 0, 1, 1,
0.5536782, -1.938813, 3.638533, 0.2941177, 0, 1, 1,
0.5578403, 1.778937, 0.7159356, 0.3019608, 0, 1, 1,
0.5629914, 0.1104888, 0.6852646, 0.3098039, 0, 1, 1,
0.5666673, -0.3967583, 1.175558, 0.3137255, 0, 1, 1,
0.5694886, 0.07363784, 1.323792, 0.3215686, 0, 1, 1,
0.5704856, 1.681365, 0.4344659, 0.3254902, 0, 1, 1,
0.572927, 0.4103368, -0.374126, 0.3333333, 0, 1, 1,
0.5738932, 0.7437245, 3.322083, 0.3372549, 0, 1, 1,
0.57805, 0.8410752, 0.4133027, 0.345098, 0, 1, 1,
0.5830288, -0.258339, 1.105718, 0.3490196, 0, 1, 1,
0.5847481, 0.7426921, 2.0863, 0.3568628, 0, 1, 1,
0.5871779, -0.2927203, 4.125423, 0.3607843, 0, 1, 1,
0.5904977, -0.9142417, 1.305366, 0.3686275, 0, 1, 1,
0.5909475, 0.9276113, 0.5664937, 0.372549, 0, 1, 1,
0.6010062, 1.210741, 1.219682, 0.3803922, 0, 1, 1,
0.6017622, 0.8836842, 1.022305, 0.3843137, 0, 1, 1,
0.6020738, -0.1459773, 1.633624, 0.3921569, 0, 1, 1,
0.6040084, 0.2205219, 0.7655124, 0.3960784, 0, 1, 1,
0.6093773, -0.8929571, 2.46855, 0.4039216, 0, 1, 1,
0.6130811, -0.4158886, 0.05879102, 0.4117647, 0, 1, 1,
0.6157032, 0.135298, 1.862614, 0.4156863, 0, 1, 1,
0.6172872, 0.3878455, 2.172844, 0.4235294, 0, 1, 1,
0.6179531, -0.4709907, 2.402303, 0.427451, 0, 1, 1,
0.6234618, 0.3449222, 2.06295, 0.4352941, 0, 1, 1,
0.6241231, 1.350443, -0.2550074, 0.4392157, 0, 1, 1,
0.628862, 0.3519398, 1.520153, 0.4470588, 0, 1, 1,
0.6321521, -0.1594598, 1.156353, 0.4509804, 0, 1, 1,
0.6395907, 1.268822, 0.121036, 0.4588235, 0, 1, 1,
0.6467138, -0.5912102, 3.390479, 0.4627451, 0, 1, 1,
0.6477408, -0.4490653, 2.690797, 0.4705882, 0, 1, 1,
0.6494778, -0.9406865, 4.133525, 0.4745098, 0, 1, 1,
0.6499698, -0.4552407, 1.823712, 0.4823529, 0, 1, 1,
0.6577199, -0.3065793, 1.479257, 0.4862745, 0, 1, 1,
0.6610446, 0.1188925, 1.435376, 0.4941176, 0, 1, 1,
0.6670316, 0.914062, 1.518247, 0.5019608, 0, 1, 1,
0.6682789, 0.08524856, 1.843933, 0.5058824, 0, 1, 1,
0.6723006, -0.6286016, 2.756878, 0.5137255, 0, 1, 1,
0.6733528, 0.5686093, 2.222037, 0.5176471, 0, 1, 1,
0.6748252, -0.4824344, 1.56026, 0.5254902, 0, 1, 1,
0.6748549, 0.8629633, 0.03793743, 0.5294118, 0, 1, 1,
0.6760424, -0.05657145, 2.59572, 0.5372549, 0, 1, 1,
0.6769001, 0.8861168, 1.358614, 0.5411765, 0, 1, 1,
0.6785997, 0.03059183, 3.215621, 0.5490196, 0, 1, 1,
0.6817684, -1.37197, 1.969968, 0.5529412, 0, 1, 1,
0.6820261, -0.6320166, 3.747824, 0.5607843, 0, 1, 1,
0.6842248, -0.7158449, 3.311574, 0.5647059, 0, 1, 1,
0.6847891, -0.2848145, 0.9953664, 0.572549, 0, 1, 1,
0.6854055, 0.2094229, 1.617343, 0.5764706, 0, 1, 1,
0.6876586, 0.4665247, 2.57255, 0.5843138, 0, 1, 1,
0.688224, 0.1562039, 1.50871, 0.5882353, 0, 1, 1,
0.6915568, -1.421367, 2.290256, 0.5960785, 0, 1, 1,
0.698259, -0.4359089, 0.3304351, 0.6039216, 0, 1, 1,
0.6987657, 1.808237, 1.450702, 0.6078432, 0, 1, 1,
0.699063, -0.679483, 1.660326, 0.6156863, 0, 1, 1,
0.7007733, -1.120704, 4.745141, 0.6196079, 0, 1, 1,
0.7019756, 0.3190347, 2.087963, 0.627451, 0, 1, 1,
0.7047747, 0.413716, 1.451506, 0.6313726, 0, 1, 1,
0.7057097, -0.2025273, 2.262675, 0.6392157, 0, 1, 1,
0.7133111, -0.503396, 2.750533, 0.6431373, 0, 1, 1,
0.7157971, 0.1675371, 0.5429142, 0.6509804, 0, 1, 1,
0.7183979, 1.506012, 0.6679671, 0.654902, 0, 1, 1,
0.7212586, -1.588117, 1.909724, 0.6627451, 0, 1, 1,
0.7240739, 1.7296, 0.8134595, 0.6666667, 0, 1, 1,
0.7281435, -0.5968134, 2.496416, 0.6745098, 0, 1, 1,
0.7297863, 1.269608, -1.122802, 0.6784314, 0, 1, 1,
0.7375169, 0.1879751, 1.053928, 0.6862745, 0, 1, 1,
0.7382751, -1.100557, 2.83319, 0.6901961, 0, 1, 1,
0.7500296, -0.9652848, 2.219339, 0.6980392, 0, 1, 1,
0.759155, -0.6626745, 2.566642, 0.7058824, 0, 1, 1,
0.76367, -0.03014396, 2.361148, 0.7098039, 0, 1, 1,
0.7706054, -1.308409, 2.586558, 0.7176471, 0, 1, 1,
0.7717001, -0.2509806, 1.408336, 0.7215686, 0, 1, 1,
0.7767261, -2.387671, 2.958802, 0.7294118, 0, 1, 1,
0.7773386, -0.04671424, 2.322839, 0.7333333, 0, 1, 1,
0.7775999, -0.877143, 4.162766, 0.7411765, 0, 1, 1,
0.7780388, -1.487375, 2.95707, 0.7450981, 0, 1, 1,
0.7822526, -1.020196, 3.257108, 0.7529412, 0, 1, 1,
0.7846812, -0.380944, 2.118632, 0.7568628, 0, 1, 1,
0.788462, 0.3720018, 0.5227821, 0.7647059, 0, 1, 1,
0.793096, 0.00461336, 1.662135, 0.7686275, 0, 1, 1,
0.7975625, -0.530284, 0.03963753, 0.7764706, 0, 1, 1,
0.7984739, 1.286319, 1.778362, 0.7803922, 0, 1, 1,
0.8026665, -0.7541473, 2.130408, 0.7882353, 0, 1, 1,
0.8035594, -0.04620081, 1.30753, 0.7921569, 0, 1, 1,
0.8036805, -0.6348676, 3.205521, 0.8, 0, 1, 1,
0.8048234, 1.311605, 0.7035276, 0.8078431, 0, 1, 1,
0.8079461, -0.08779415, 0.5464541, 0.8117647, 0, 1, 1,
0.8083295, 2.860741, -0.6137081, 0.8196079, 0, 1, 1,
0.8114742, 1.068045, 1.078034, 0.8235294, 0, 1, 1,
0.8134505, 0.6618109, 3.067186, 0.8313726, 0, 1, 1,
0.8159709, 0.7022584, 1.10114, 0.8352941, 0, 1, 1,
0.8203095, 0.7990992, 0.2237423, 0.8431373, 0, 1, 1,
0.8209539, 1.753273, 0.433127, 0.8470588, 0, 1, 1,
0.8218588, -0.6473504, 1.659042, 0.854902, 0, 1, 1,
0.8219216, -0.4101571, 1.193913, 0.8588235, 0, 1, 1,
0.8293938, -0.008969962, 1.066177, 0.8666667, 0, 1, 1,
0.8324735, 0.3839006, 1.204279, 0.8705882, 0, 1, 1,
0.8377473, 1.041612, 1.301253, 0.8784314, 0, 1, 1,
0.842566, 0.671533, 2.927285, 0.8823529, 0, 1, 1,
0.8438653, -1.02844, 3.34659, 0.8901961, 0, 1, 1,
0.8442783, 0.7008761, 1.008391, 0.8941177, 0, 1, 1,
0.8455188, -0.2817297, 2.964627, 0.9019608, 0, 1, 1,
0.8456657, -1.234346, 3.351442, 0.9098039, 0, 1, 1,
0.8479012, -0.85217, 1.985121, 0.9137255, 0, 1, 1,
0.8541945, -1.175066, 1.360111, 0.9215686, 0, 1, 1,
0.8606981, 0.2545382, 1.510072, 0.9254902, 0, 1, 1,
0.8709852, 0.884874, -0.4378794, 0.9333333, 0, 1, 1,
0.8731893, 0.2819782, 1.479879, 0.9372549, 0, 1, 1,
0.881283, 0.009321348, 0.07566395, 0.945098, 0, 1, 1,
0.8860998, 0.6291986, 2.330378, 0.9490196, 0, 1, 1,
0.8860999, -1.13283, 2.03824, 0.9568627, 0, 1, 1,
0.8880279, -0.1279361, 4.459264, 0.9607843, 0, 1, 1,
0.8926019, 1.178871, 0.9291791, 0.9686275, 0, 1, 1,
0.9003432, 1.021734, -0.3954509, 0.972549, 0, 1, 1,
0.9011687, -0.4467874, 4.167654, 0.9803922, 0, 1, 1,
0.9051646, -0.7297778, 2.823814, 0.9843137, 0, 1, 1,
0.9067203, -0.7340894, 1.240177, 0.9921569, 0, 1, 1,
0.9068278, -0.1638671, 1.538429, 0.9960784, 0, 1, 1,
0.9403316, 0.1922075, 1.570738, 1, 0, 0.9960784, 1,
0.9430357, 0.8471223, 2.049689, 1, 0, 0.9882353, 1,
0.9570669, -1.133097, 0.937809, 1, 0, 0.9843137, 1,
0.9578109, 1.76941, 0.5768232, 1, 0, 0.9764706, 1,
0.9611735, 0.6626784, 1.793979, 1, 0, 0.972549, 1,
0.9614111, -0.1569633, 2.181062, 1, 0, 0.9647059, 1,
0.9719839, 0.2285461, 1.88803, 1, 0, 0.9607843, 1,
0.9814856, 0.8847439, 1.306037, 1, 0, 0.9529412, 1,
0.9816387, -0.8242626, 1.264783, 1, 0, 0.9490196, 1,
0.9848436, 1.152372, -0.08158642, 1, 0, 0.9411765, 1,
0.9894983, 1.215953, 0.11838, 1, 0, 0.9372549, 1,
0.9923565, -0.5475574, 2.148009, 1, 0, 0.9294118, 1,
0.9925013, -0.1505954, 1.898329, 1, 0, 0.9254902, 1,
0.9958973, -0.9946837, 1.047395, 1, 0, 0.9176471, 1,
0.9970376, -0.1583031, 1.681845, 1, 0, 0.9137255, 1,
0.9985985, -0.7538274, 2.602506, 1, 0, 0.9058824, 1,
1.002699, -0.4091298, 3.209669, 1, 0, 0.9019608, 1,
1.006225, 0.01951125, 1.491437, 1, 0, 0.8941177, 1,
1.010162, 1.215824, 1.064444, 1, 0, 0.8862745, 1,
1.015641, 0.2076664, 1.020992, 1, 0, 0.8823529, 1,
1.01623, 0.9563994, -1.188567, 1, 0, 0.8745098, 1,
1.022751, -0.1995206, 2.762249, 1, 0, 0.8705882, 1,
1.024407, 1.0394, 1.533079, 1, 0, 0.8627451, 1,
1.03009, 1.548463, -0.2408977, 1, 0, 0.8588235, 1,
1.032614, -0.05917337, 1.986185, 1, 0, 0.8509804, 1,
1.035775, 1.45229, 2.949708, 1, 0, 0.8470588, 1,
1.070104, -1.10938, 3.18697, 1, 0, 0.8392157, 1,
1.081005, 0.924342, -0.6551354, 1, 0, 0.8352941, 1,
1.081745, 0.3648854, 2.034336, 1, 0, 0.827451, 1,
1.087263, -0.5449869, 0.07443064, 1, 0, 0.8235294, 1,
1.087339, 0.2258474, 3.361206, 1, 0, 0.8156863, 1,
1.098428, -0.04220619, 3.925531, 1, 0, 0.8117647, 1,
1.098457, -1.259986, 2.282938, 1, 0, 0.8039216, 1,
1.099468, 0.4063972, 3.234601, 1, 0, 0.7960784, 1,
1.108146, -0.5076614, 2.688324, 1, 0, 0.7921569, 1,
1.109263, -0.7570632, 2.515925, 1, 0, 0.7843137, 1,
1.109421, -0.3637931, 3.114798, 1, 0, 0.7803922, 1,
1.117923, -1.463848, 3.247493, 1, 0, 0.772549, 1,
1.118627, -1.270423, 3.54364, 1, 0, 0.7686275, 1,
1.12036, -0.8195941, 0.1959964, 1, 0, 0.7607843, 1,
1.120426, 0.00531808, -0.4068379, 1, 0, 0.7568628, 1,
1.123847, 1.876779, -0.6751474, 1, 0, 0.7490196, 1,
1.132552, -0.7266427, 2.410573, 1, 0, 0.7450981, 1,
1.13605, -1.622271, 2.746106, 1, 0, 0.7372549, 1,
1.136447, 0.0859867, 1.810628, 1, 0, 0.7333333, 1,
1.146251, -1.782183, 0.8509818, 1, 0, 0.7254902, 1,
1.147347, -0.4552647, 1.565603, 1, 0, 0.7215686, 1,
1.148435, -2.123379, 3.639536, 1, 0, 0.7137255, 1,
1.148661, -2.00259, 1.703329, 1, 0, 0.7098039, 1,
1.150149, -0.9652433, 2.769121, 1, 0, 0.7019608, 1,
1.151752, 0.3117858, 1.801532, 1, 0, 0.6941177, 1,
1.16814, 1.17054, 0.3403163, 1, 0, 0.6901961, 1,
1.171605, -0.9560962, 3.189582, 1, 0, 0.682353, 1,
1.17299, -1.451081, 3.111426, 1, 0, 0.6784314, 1,
1.177902, 1.144501, 1.146365, 1, 0, 0.6705883, 1,
1.204128, 1.041938, 1.75496, 1, 0, 0.6666667, 1,
1.219035, -0.06072423, 0.9363214, 1, 0, 0.6588235, 1,
1.219431, -0.1376507, 2.895472, 1, 0, 0.654902, 1,
1.236317, -0.02714834, 0.3702822, 1, 0, 0.6470588, 1,
1.240584, 0.2312579, 3.744754, 1, 0, 0.6431373, 1,
1.243707, -0.5784363, 1.760234, 1, 0, 0.6352941, 1,
1.244389, -0.7348367, 2.457098, 1, 0, 0.6313726, 1,
1.245318, 0.2132449, 1.592706, 1, 0, 0.6235294, 1,
1.247573, -1.617708, 0.9191567, 1, 0, 0.6196079, 1,
1.254595, 2.423901, -1.339174, 1, 0, 0.6117647, 1,
1.259213, -0.3897974, 1.124323, 1, 0, 0.6078432, 1,
1.274901, -1.287482, 2.896566, 1, 0, 0.6, 1,
1.277511, -0.5887884, 3.36579, 1, 0, 0.5921569, 1,
1.279616, 0.5639244, 2.353111, 1, 0, 0.5882353, 1,
1.281269, -0.6112378, 1.005569, 1, 0, 0.5803922, 1,
1.289289, 0.5264869, 1.054644, 1, 0, 0.5764706, 1,
1.301624, -1.039565, 1.766974, 1, 0, 0.5686275, 1,
1.307455, -1.325681, 4.255995, 1, 0, 0.5647059, 1,
1.311813, 1.077807, 3.035183, 1, 0, 0.5568628, 1,
1.322252, 0.04998367, 0.7340729, 1, 0, 0.5529412, 1,
1.323137, 0.6738266, 0.9696034, 1, 0, 0.5450981, 1,
1.323431, 0.6598053, 1.852726, 1, 0, 0.5411765, 1,
1.329126, -0.5056576, 3.051565, 1, 0, 0.5333334, 1,
1.334213, 0.1938481, 0.7688385, 1, 0, 0.5294118, 1,
1.345272, 1.31036, 1.347038, 1, 0, 0.5215687, 1,
1.347633, -1.639127, 2.244002, 1, 0, 0.5176471, 1,
1.353695, -1.491693, 2.518381, 1, 0, 0.509804, 1,
1.353814, 0.4794108, 1.177416, 1, 0, 0.5058824, 1,
1.354352, 0.5464224, -0.2263774, 1, 0, 0.4980392, 1,
1.36437, -0.09008294, 2.063769, 1, 0, 0.4901961, 1,
1.367553, 0.8625492, 1.714906, 1, 0, 0.4862745, 1,
1.372399, 0.01899087, 2.04864, 1, 0, 0.4784314, 1,
1.376107, -1.69544, 3.063803, 1, 0, 0.4745098, 1,
1.383608, 0.9567826, 2.320581, 1, 0, 0.4666667, 1,
1.397271, 0.6748394, 0.6679507, 1, 0, 0.4627451, 1,
1.421746, 0.3575139, 2.567923, 1, 0, 0.454902, 1,
1.422171, -1.320006, 2.020397, 1, 0, 0.4509804, 1,
1.437741, -0.8345351, 0.533528, 1, 0, 0.4431373, 1,
1.448442, -0.1177515, 0.7083947, 1, 0, 0.4392157, 1,
1.449822, -0.1773367, 2.967868, 1, 0, 0.4313726, 1,
1.451633, -0.008693771, 2.077848, 1, 0, 0.427451, 1,
1.453676, 1.335402, 1.017938, 1, 0, 0.4196078, 1,
1.454294, 0.2247209, 0.9465693, 1, 0, 0.4156863, 1,
1.456581, 1.439674, -0.8463928, 1, 0, 0.4078431, 1,
1.469352, -1.152086, 3.917149, 1, 0, 0.4039216, 1,
1.470334, 0.6873239, 1.271622, 1, 0, 0.3960784, 1,
1.49012, 1.960834, 0.4853533, 1, 0, 0.3882353, 1,
1.51151, -2.221563, 1.951715, 1, 0, 0.3843137, 1,
1.51617, 0.5837784, 2.378077, 1, 0, 0.3764706, 1,
1.545211, 0.1649794, 2.983968, 1, 0, 0.372549, 1,
1.545312, 0.6116295, 2.235398, 1, 0, 0.3647059, 1,
1.545569, 0.1492781, 2.461842, 1, 0, 0.3607843, 1,
1.552819, 1.043121, 0.2970367, 1, 0, 0.3529412, 1,
1.559827, 0.06223654, 1.230582, 1, 0, 0.3490196, 1,
1.585209, -1.186952, 0.7474841, 1, 0, 0.3411765, 1,
1.592855, 1.08718, 1.173467, 1, 0, 0.3372549, 1,
1.593259, -0.8095691, 3.095463, 1, 0, 0.3294118, 1,
1.595861, 0.4746841, 0.7685453, 1, 0, 0.3254902, 1,
1.598897, 0.1972753, -0.2232838, 1, 0, 0.3176471, 1,
1.601798, 0.3220634, 1.593605, 1, 0, 0.3137255, 1,
1.620094, 2.860567, -0.3770456, 1, 0, 0.3058824, 1,
1.629405, 0.7842428, 1.138314, 1, 0, 0.2980392, 1,
1.638038, 0.2790755, 1.42043, 1, 0, 0.2941177, 1,
1.6496, -0.05355923, 2.192867, 1, 0, 0.2862745, 1,
1.660269, 0.206321, 1.658022, 1, 0, 0.282353, 1,
1.677166, 0.9059631, -0.3508658, 1, 0, 0.2745098, 1,
1.689105, 0.3304406, 2.162743, 1, 0, 0.2705882, 1,
1.695476, -0.3332488, 0.6998838, 1, 0, 0.2627451, 1,
1.698839, 1.302143, 0.6455583, 1, 0, 0.2588235, 1,
1.705375, 1.354006, 2.085698, 1, 0, 0.2509804, 1,
1.708701, 0.1758338, 2.279084, 1, 0, 0.2470588, 1,
1.727434, 2.533198, 1.433825, 1, 0, 0.2392157, 1,
1.740603, -2.359463, 2.873336, 1, 0, 0.2352941, 1,
1.743784, 0.2541394, 0.366219, 1, 0, 0.227451, 1,
1.764237, -1.224972, 1.410847, 1, 0, 0.2235294, 1,
1.778139, 0.563589, 0.9702954, 1, 0, 0.2156863, 1,
1.790713, 0.731809, 0.6595601, 1, 0, 0.2117647, 1,
1.79872, -0.8093734, 1.057078, 1, 0, 0.2039216, 1,
1.800958, 1.230786, 0.2515728, 1, 0, 0.1960784, 1,
1.806726, 0.2253999, 2.393543, 1, 0, 0.1921569, 1,
1.846954, 2.371623, 1.338498, 1, 0, 0.1843137, 1,
1.860677, -1.443528, 1.9736, 1, 0, 0.1803922, 1,
1.896673, 0.7579198, 1.877124, 1, 0, 0.172549, 1,
1.9135, 0.8935254, 2.063502, 1, 0, 0.1686275, 1,
1.937228, 1.069086, 0.1616092, 1, 0, 0.1607843, 1,
1.939091, -2.026877, 3.046631, 1, 0, 0.1568628, 1,
1.974062, 0.6374369, 3.551311, 1, 0, 0.1490196, 1,
1.979225, -1.281747, 2.918379, 1, 0, 0.145098, 1,
1.981513, 0.4849183, 1.34411, 1, 0, 0.1372549, 1,
2.008102, 0.7086065, 0.2584054, 1, 0, 0.1333333, 1,
2.027987, -1.114646, 2.880138, 1, 0, 0.1254902, 1,
2.032063, -0.7625827, 1.686495, 1, 0, 0.1215686, 1,
2.038185, 0.1053143, 0.7655209, 1, 0, 0.1137255, 1,
2.065886, -0.7666953, 1.467575, 1, 0, 0.1098039, 1,
2.091325, -0.1751195, 1.360755, 1, 0, 0.1019608, 1,
2.12977, -0.3837216, 1.189304, 1, 0, 0.09411765, 1,
2.244246, 0.9606433, 0.7676298, 1, 0, 0.09019608, 1,
2.249737, -0.546547, 2.655727, 1, 0, 0.08235294, 1,
2.266227, 2.681648, 2.06398, 1, 0, 0.07843138, 1,
2.294984, -0.1335458, 0.7049248, 1, 0, 0.07058824, 1,
2.329125, 0.4830006, 1.254183, 1, 0, 0.06666667, 1,
2.369147, -1.228002, 2.489964, 1, 0, 0.05882353, 1,
2.384856, -0.7259254, 2.311181, 1, 0, 0.05490196, 1,
2.392398, 0.0534384, 0.2198032, 1, 0, 0.04705882, 1,
2.416197, 0.7753393, 0.8682017, 1, 0, 0.04313726, 1,
2.431389, -0.3006395, 4.572091, 1, 0, 0.03529412, 1,
2.501711, 0.8358608, 1.489393, 1, 0, 0.03137255, 1,
2.623755, 0.6166182, 2.499077, 1, 0, 0.02352941, 1,
2.646064, -0.9639665, 4.035626, 1, 0, 0.01960784, 1,
2.882165, -1.109079, 1.405713, 1, 0, 0.01176471, 1,
3.207182, -0.2353826, 1.839815, 1, 0, 0.007843138, 1
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
-0.2483078, -4.666089, -7.271079, 0, -0.5, 0.5, 0.5,
-0.2483078, -4.666089, -7.271079, 1, -0.5, 0.5, 0.5,
-0.2483078, -4.666089, -7.271079, 1, 1.5, 0.5, 0.5,
-0.2483078, -4.666089, -7.271079, 0, 1.5, 0.5, 0.5
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
-4.875209, -0.2166878, -7.271079, 0, -0.5, 0.5, 0.5,
-4.875209, -0.2166878, -7.271079, 1, -0.5, 0.5, 0.5,
-4.875209, -0.2166878, -7.271079, 1, 1.5, 0.5, 0.5,
-4.875209, -0.2166878, -7.271079, 0, 1.5, 0.5, 0.5
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
-4.875209, -4.666089, -0.1971378, 0, -0.5, 0.5, 0.5,
-4.875209, -4.666089, -0.1971378, 1, -0.5, 0.5, 0.5,
-4.875209, -4.666089, -0.1971378, 1, 1.5, 0.5, 0.5,
-4.875209, -4.666089, -0.1971378, 0, 1.5, 0.5, 0.5
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
-3, -3.639304, -5.638631,
3, -3.639304, -5.638631,
-3, -3.639304, -5.638631,
-3, -3.810435, -5.910706,
-2, -3.639304, -5.638631,
-2, -3.810435, -5.910706,
-1, -3.639304, -5.638631,
-1, -3.810435, -5.910706,
0, -3.639304, -5.638631,
0, -3.810435, -5.910706,
1, -3.639304, -5.638631,
1, -3.810435, -5.910706,
2, -3.639304, -5.638631,
2, -3.810435, -5.910706,
3, -3.639304, -5.638631,
3, -3.810435, -5.910706
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
-3, -4.152697, -6.454854, 0, -0.5, 0.5, 0.5,
-3, -4.152697, -6.454854, 1, -0.5, 0.5, 0.5,
-3, -4.152697, -6.454854, 1, 1.5, 0.5, 0.5,
-3, -4.152697, -6.454854, 0, 1.5, 0.5, 0.5,
-2, -4.152697, -6.454854, 0, -0.5, 0.5, 0.5,
-2, -4.152697, -6.454854, 1, -0.5, 0.5, 0.5,
-2, -4.152697, -6.454854, 1, 1.5, 0.5, 0.5,
-2, -4.152697, -6.454854, 0, 1.5, 0.5, 0.5,
-1, -4.152697, -6.454854, 0, -0.5, 0.5, 0.5,
-1, -4.152697, -6.454854, 1, -0.5, 0.5, 0.5,
-1, -4.152697, -6.454854, 1, 1.5, 0.5, 0.5,
-1, -4.152697, -6.454854, 0, 1.5, 0.5, 0.5,
0, -4.152697, -6.454854, 0, -0.5, 0.5, 0.5,
0, -4.152697, -6.454854, 1, -0.5, 0.5, 0.5,
0, -4.152697, -6.454854, 1, 1.5, 0.5, 0.5,
0, -4.152697, -6.454854, 0, 1.5, 0.5, 0.5,
1, -4.152697, -6.454854, 0, -0.5, 0.5, 0.5,
1, -4.152697, -6.454854, 1, -0.5, 0.5, 0.5,
1, -4.152697, -6.454854, 1, 1.5, 0.5, 0.5,
1, -4.152697, -6.454854, 0, 1.5, 0.5, 0.5,
2, -4.152697, -6.454854, 0, -0.5, 0.5, 0.5,
2, -4.152697, -6.454854, 1, -0.5, 0.5, 0.5,
2, -4.152697, -6.454854, 1, 1.5, 0.5, 0.5,
2, -4.152697, -6.454854, 0, 1.5, 0.5, 0.5,
3, -4.152697, -6.454854, 0, -0.5, 0.5, 0.5,
3, -4.152697, -6.454854, 1, -0.5, 0.5, 0.5,
3, -4.152697, -6.454854, 1, 1.5, 0.5, 0.5,
3, -4.152697, -6.454854, 0, 1.5, 0.5, 0.5
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
-3.807462, -3, -5.638631,
-3.807462, 3, -5.638631,
-3.807462, -3, -5.638631,
-3.98542, -3, -5.910706,
-3.807462, -2, -5.638631,
-3.98542, -2, -5.910706,
-3.807462, -1, -5.638631,
-3.98542, -1, -5.910706,
-3.807462, 0, -5.638631,
-3.98542, 0, -5.910706,
-3.807462, 1, -5.638631,
-3.98542, 1, -5.910706,
-3.807462, 2, -5.638631,
-3.98542, 2, -5.910706,
-3.807462, 3, -5.638631,
-3.98542, 3, -5.910706
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
-4.341336, -3, -6.454854, 0, -0.5, 0.5, 0.5,
-4.341336, -3, -6.454854, 1, -0.5, 0.5, 0.5,
-4.341336, -3, -6.454854, 1, 1.5, 0.5, 0.5,
-4.341336, -3, -6.454854, 0, 1.5, 0.5, 0.5,
-4.341336, -2, -6.454854, 0, -0.5, 0.5, 0.5,
-4.341336, -2, -6.454854, 1, -0.5, 0.5, 0.5,
-4.341336, -2, -6.454854, 1, 1.5, 0.5, 0.5,
-4.341336, -2, -6.454854, 0, 1.5, 0.5, 0.5,
-4.341336, -1, -6.454854, 0, -0.5, 0.5, 0.5,
-4.341336, -1, -6.454854, 1, -0.5, 0.5, 0.5,
-4.341336, -1, -6.454854, 1, 1.5, 0.5, 0.5,
-4.341336, -1, -6.454854, 0, 1.5, 0.5, 0.5,
-4.341336, 0, -6.454854, 0, -0.5, 0.5, 0.5,
-4.341336, 0, -6.454854, 1, -0.5, 0.5, 0.5,
-4.341336, 0, -6.454854, 1, 1.5, 0.5, 0.5,
-4.341336, 0, -6.454854, 0, 1.5, 0.5, 0.5,
-4.341336, 1, -6.454854, 0, -0.5, 0.5, 0.5,
-4.341336, 1, -6.454854, 1, -0.5, 0.5, 0.5,
-4.341336, 1, -6.454854, 1, 1.5, 0.5, 0.5,
-4.341336, 1, -6.454854, 0, 1.5, 0.5, 0.5,
-4.341336, 2, -6.454854, 0, -0.5, 0.5, 0.5,
-4.341336, 2, -6.454854, 1, -0.5, 0.5, 0.5,
-4.341336, 2, -6.454854, 1, 1.5, 0.5, 0.5,
-4.341336, 2, -6.454854, 0, 1.5, 0.5, 0.5,
-4.341336, 3, -6.454854, 0, -0.5, 0.5, 0.5,
-4.341336, 3, -6.454854, 1, -0.5, 0.5, 0.5,
-4.341336, 3, -6.454854, 1, 1.5, 0.5, 0.5,
-4.341336, 3, -6.454854, 0, 1.5, 0.5, 0.5
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
-3.807462, -3.639304, -4,
-3.807462, -3.639304, 4,
-3.807462, -3.639304, -4,
-3.98542, -3.810435, -4,
-3.807462, -3.639304, -2,
-3.98542, -3.810435, -2,
-3.807462, -3.639304, 0,
-3.98542, -3.810435, 0,
-3.807462, -3.639304, 2,
-3.98542, -3.810435, 2,
-3.807462, -3.639304, 4,
-3.98542, -3.810435, 4
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
-4.341336, -4.152697, -4, 0, -0.5, 0.5, 0.5,
-4.341336, -4.152697, -4, 1, -0.5, 0.5, 0.5,
-4.341336, -4.152697, -4, 1, 1.5, 0.5, 0.5,
-4.341336, -4.152697, -4, 0, 1.5, 0.5, 0.5,
-4.341336, -4.152697, -2, 0, -0.5, 0.5, 0.5,
-4.341336, -4.152697, -2, 1, -0.5, 0.5, 0.5,
-4.341336, -4.152697, -2, 1, 1.5, 0.5, 0.5,
-4.341336, -4.152697, -2, 0, 1.5, 0.5, 0.5,
-4.341336, -4.152697, 0, 0, -0.5, 0.5, 0.5,
-4.341336, -4.152697, 0, 1, -0.5, 0.5, 0.5,
-4.341336, -4.152697, 0, 1, 1.5, 0.5, 0.5,
-4.341336, -4.152697, 0, 0, 1.5, 0.5, 0.5,
-4.341336, -4.152697, 2, 0, -0.5, 0.5, 0.5,
-4.341336, -4.152697, 2, 1, -0.5, 0.5, 0.5,
-4.341336, -4.152697, 2, 1, 1.5, 0.5, 0.5,
-4.341336, -4.152697, 2, 0, 1.5, 0.5, 0.5,
-4.341336, -4.152697, 4, 0, -0.5, 0.5, 0.5,
-4.341336, -4.152697, 4, 1, -0.5, 0.5, 0.5,
-4.341336, -4.152697, 4, 1, 1.5, 0.5, 0.5,
-4.341336, -4.152697, 4, 0, 1.5, 0.5, 0.5
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
-3.807462, -3.639304, -5.638631,
-3.807462, 3.205928, -5.638631,
-3.807462, -3.639304, 5.244355,
-3.807462, 3.205928, 5.244355,
-3.807462, -3.639304, -5.638631,
-3.807462, -3.639304, 5.244355,
-3.807462, 3.205928, -5.638631,
-3.807462, 3.205928, 5.244355,
-3.807462, -3.639304, -5.638631,
3.310847, -3.639304, -5.638631,
-3.807462, -3.639304, 5.244355,
3.310847, -3.639304, 5.244355,
-3.807462, 3.205928, -5.638631,
3.310847, 3.205928, -5.638631,
-3.807462, 3.205928, 5.244355,
3.310847, 3.205928, 5.244355,
3.310847, -3.639304, -5.638631,
3.310847, 3.205928, -5.638631,
3.310847, -3.639304, 5.244355,
3.310847, 3.205928, 5.244355,
3.310847, -3.639304, -5.638631,
3.310847, -3.639304, 5.244355,
3.310847, 3.205928, -5.638631,
3.310847, 3.205928, 5.244355
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
var radius = 7.847279;
var distance = 34.91343;
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
mvMatrix.translate( 0.2483078, 0.2166878, 0.1971378 );
mvMatrix.scale( 1.191945, 1.239495, 0.7796235 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.91343);
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
Propineb<-read.table("Propineb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propineb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propineb' not found
```

```r
y<-Propineb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propineb' not found
```

```r
z<-Propineb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propineb' not found
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
-3.703798, 2.006168, 0.2104032, 0, 0, 1, 1, 1,
-2.917335, -0.3766946, -1.941764, 1, 0, 0, 1, 1,
-2.499852, -0.4926426, -2.482622, 1, 0, 0, 1, 1,
-2.311719, 0.1230369, -3.047677, 1, 0, 0, 1, 1,
-2.242992, 0.06328017, -1.278155, 1, 0, 0, 1, 1,
-2.227274, -1.051073, -1.792795, 1, 0, 0, 1, 1,
-2.181319, -0.3222845, -3.913174, 0, 0, 0, 1, 1,
-2.179804, -0.8857355, -2.361662, 0, 0, 0, 1, 1,
-2.169555, 0.03662695, -1.922106, 0, 0, 0, 1, 1,
-2.149363, -0.9665949, -3.207046, 0, 0, 0, 1, 1,
-2.143524, 0.6169811, -1.424271, 0, 0, 0, 1, 1,
-2.129373, 0.5336568, -2.027, 0, 0, 0, 1, 1,
-2.101583, 0.9046264, -1.220198, 0, 0, 0, 1, 1,
-2.090166, 2.206331, 0.2168219, 1, 1, 1, 1, 1,
-2.001399, 0.3892358, -2.571281, 1, 1, 1, 1, 1,
-1.94768, -0.4934451, -2.138469, 1, 1, 1, 1, 1,
-1.926252, -1.02984, -0.9662658, 1, 1, 1, 1, 1,
-1.918878, 0.01099036, -1.36105, 1, 1, 1, 1, 1,
-1.88241, 1.855546, -1.656996, 1, 1, 1, 1, 1,
-1.864984, 2.049893, -2.532958, 1, 1, 1, 1, 1,
-1.851348, 1.357672, -1.605103, 1, 1, 1, 1, 1,
-1.84985, -1.936718, -2.747489, 1, 1, 1, 1, 1,
-1.848313, -0.7198281, -2.41087, 1, 1, 1, 1, 1,
-1.820758, -1.144432, -1.244259, 1, 1, 1, 1, 1,
-1.808922, -0.2279571, -1.126532, 1, 1, 1, 1, 1,
-1.808496, -1.690344, -2.178224, 1, 1, 1, 1, 1,
-1.808313, -0.2605696, -3.575009, 1, 1, 1, 1, 1,
-1.759788, 1.110315, -1.26013, 1, 1, 1, 1, 1,
-1.755577, -0.3320146, -1.067286, 0, 0, 1, 1, 1,
-1.745685, 0.05627771, -1.83836, 1, 0, 0, 1, 1,
-1.739978, 1.028884, -0.4263789, 1, 0, 0, 1, 1,
-1.718272, 0.8081863, -1.785158, 1, 0, 0, 1, 1,
-1.715328, -0.2228917, 0.02365064, 1, 0, 0, 1, 1,
-1.712554, -2.079031, -1.51227, 1, 0, 0, 1, 1,
-1.711022, -0.9698862, -2.067809, 0, 0, 0, 1, 1,
-1.677762, 0.8639821, -1.916119, 0, 0, 0, 1, 1,
-1.670296, -1.888302, -3.132056, 0, 0, 0, 1, 1,
-1.653885, 0.5437867, -1.033596, 0, 0, 0, 1, 1,
-1.647696, -0.3812639, -2.172149, 0, 0, 0, 1, 1,
-1.630353, 1.302335, -1.498652, 0, 0, 0, 1, 1,
-1.618291, -0.1281688, -1.320138, 0, 0, 0, 1, 1,
-1.613762, -0.3097025, -1.748329, 1, 1, 1, 1, 1,
-1.609354, 0.1667892, -2.42415, 1, 1, 1, 1, 1,
-1.601329, 0.5201463, -2.877568, 1, 1, 1, 1, 1,
-1.600812, -1.56633, -2.999993, 1, 1, 1, 1, 1,
-1.590018, -0.01838061, -2.675075, 1, 1, 1, 1, 1,
-1.589719, -1.00775, -1.72552, 1, 1, 1, 1, 1,
-1.580689, 0.161896, -1.829007, 1, 1, 1, 1, 1,
-1.575062, 0.08010855, -2.114053, 1, 1, 1, 1, 1,
-1.567711, -0.2656729, -2.664805, 1, 1, 1, 1, 1,
-1.555333, -1.140593, -1.809263, 1, 1, 1, 1, 1,
-1.528251, -2.487692, -1.895534, 1, 1, 1, 1, 1,
-1.521721, 0.06622144, -1.320626, 1, 1, 1, 1, 1,
-1.520762, -1.75068, -2.214197, 1, 1, 1, 1, 1,
-1.513165, -1.290349, -1.203371, 1, 1, 1, 1, 1,
-1.511183, 0.2713757, -3.772331, 1, 1, 1, 1, 1,
-1.510737, -0.3821533, -2.224333, 0, 0, 1, 1, 1,
-1.498701, 1.119633, 0.1723893, 1, 0, 0, 1, 1,
-1.49799, 2.114648, -1.973789, 1, 0, 0, 1, 1,
-1.490038, 0.1407841, -0.9912221, 1, 0, 0, 1, 1,
-1.486904, 1.464498, -0.1270503, 1, 0, 0, 1, 1,
-1.479375, -0.1599097, -2.563133, 1, 0, 0, 1, 1,
-1.469138, -0.8710874, -3.493236, 0, 0, 0, 1, 1,
-1.458941, 0.9597091, -1.156918, 0, 0, 0, 1, 1,
-1.457731, -1.55916, -2.912789, 0, 0, 0, 1, 1,
-1.456084, 2.692802, 0.2532703, 0, 0, 0, 1, 1,
-1.455694, 0.6613628, -1.531348, 0, 0, 0, 1, 1,
-1.450072, 0.01866618, -3.402101, 0, 0, 0, 1, 1,
-1.425761, -1.239692, -1.350007, 0, 0, 0, 1, 1,
-1.4055, 1.491943, -1.498, 1, 1, 1, 1, 1,
-1.404576, -1.301519, -2.015913, 1, 1, 1, 1, 1,
-1.374935, -0.3417352, -2.84006, 1, 1, 1, 1, 1,
-1.367613, -0.6004215, -1.636211, 1, 1, 1, 1, 1,
-1.358238, -1.217816, -3.209648, 1, 1, 1, 1, 1,
-1.348865, -0.4746485, -1.65684, 1, 1, 1, 1, 1,
-1.336786, 0.7773613, -2.735731, 1, 1, 1, 1, 1,
-1.326283, -2.515433, -3.652004, 1, 1, 1, 1, 1,
-1.324499, 1.933713, -0.5009579, 1, 1, 1, 1, 1,
-1.317814, 0.1379062, -3.04626, 1, 1, 1, 1, 1,
-1.313867, -1.328555, -2.977398, 1, 1, 1, 1, 1,
-1.293835, -0.7297779, -1.403017, 1, 1, 1, 1, 1,
-1.289088, 0.6254337, -0.5174115, 1, 1, 1, 1, 1,
-1.288353, 0.02188542, -2.951784, 1, 1, 1, 1, 1,
-1.283178, -0.5567599, -2.627261, 1, 1, 1, 1, 1,
-1.27916, -0.725504, -1.431733, 0, 0, 1, 1, 1,
-1.277351, 0.2031449, -1.874835, 1, 0, 0, 1, 1,
-1.272515, -1.075857, -3.401362, 1, 0, 0, 1, 1,
-1.267354, 0.2068309, -1.863856, 1, 0, 0, 1, 1,
-1.260757, 0.3656991, -0.7673677, 1, 0, 0, 1, 1,
-1.260381, -1.090037, -2.543858, 1, 0, 0, 1, 1,
-1.259272, 0.5501246, -0.005181072, 0, 0, 0, 1, 1,
-1.254502, 3.000376, -2.086524, 0, 0, 0, 1, 1,
-1.25357, 0.7645387, -2.116902, 0, 0, 0, 1, 1,
-1.248352, 0.7270625, -1.606229, 0, 0, 0, 1, 1,
-1.247808, 0.7202469, -1.141619, 0, 0, 0, 1, 1,
-1.246443, 0.424215, -2.371754, 0, 0, 0, 1, 1,
-1.242367, -0.7979074, -3.863553, 0, 0, 0, 1, 1,
-1.240849, -1.51018, -3.089061, 1, 1, 1, 1, 1,
-1.228774, -0.6491331, -2.687972, 1, 1, 1, 1, 1,
-1.227628, -1.26924, -1.289341, 1, 1, 1, 1, 1,
-1.203797, 0.8468246, -2.126915, 1, 1, 1, 1, 1,
-1.191442, 0.3900962, -0.6168702, 1, 1, 1, 1, 1,
-1.177236, 1.008537, -1.806988, 1, 1, 1, 1, 1,
-1.174881, -0.485064, -2.919254, 1, 1, 1, 1, 1,
-1.17263, -0.4412747, -2.214468, 1, 1, 1, 1, 1,
-1.169498, -0.8597081, -3.211943, 1, 1, 1, 1, 1,
-1.167666, -0.09157657, -2.795328, 1, 1, 1, 1, 1,
-1.159225, 1.236243, -1.078303, 1, 1, 1, 1, 1,
-1.155601, -1.827881, -1.237438, 1, 1, 1, 1, 1,
-1.155388, 0.422668, -1.77394, 1, 1, 1, 1, 1,
-1.151424, 0.1075212, -1.701414, 1, 1, 1, 1, 1,
-1.144137, 0.1971558, -1.568101, 1, 1, 1, 1, 1,
-1.142134, 1.539055, 0.3759973, 0, 0, 1, 1, 1,
-1.140534, -1.109754, -2.797275, 1, 0, 0, 1, 1,
-1.136142, 1.404649, -2.314104, 1, 0, 0, 1, 1,
-1.135099, -0.009826122, -3.78677, 1, 0, 0, 1, 1,
-1.130078, -0.5358349, -1.863855, 1, 0, 0, 1, 1,
-1.127448, -1.233926, -4.18408, 1, 0, 0, 1, 1,
-1.126786, -1.629081, -0.1727116, 0, 0, 0, 1, 1,
-1.118027, 0.02706449, -0.1983192, 0, 0, 0, 1, 1,
-1.112922, 1.427679, 0.1074881, 0, 0, 0, 1, 1,
-1.109911, -0.2290962, -2.018253, 0, 0, 0, 1, 1,
-1.104232, -0.5260319, -3.611693, 0, 0, 0, 1, 1,
-1.096741, 0.08996511, -1.015548, 0, 0, 0, 1, 1,
-1.096345, -0.003080777, -1.463343, 0, 0, 0, 1, 1,
-1.09381, -0.4726782, -0.7901233, 1, 1, 1, 1, 1,
-1.078907, -0.8860333, -0.6185797, 1, 1, 1, 1, 1,
-1.063439, -0.8193327, -1.303538, 1, 1, 1, 1, 1,
-1.062815, -2.283013, -2.294024, 1, 1, 1, 1, 1,
-1.06002, -0.3430045, -2.575904, 1, 1, 1, 1, 1,
-1.059301, 1.348972, -3.122713, 1, 1, 1, 1, 1,
-1.052093, -0.1339882, -1.489807, 1, 1, 1, 1, 1,
-1.045946, -0.2086827, -1.145779, 1, 1, 1, 1, 1,
-1.035877, -0.1867066, -1.961033, 1, 1, 1, 1, 1,
-1.035856, -0.2009337, -1.400538, 1, 1, 1, 1, 1,
-1.033858, 0.2326042, -1.152567, 1, 1, 1, 1, 1,
-1.031565, -1.011697, -1.791389, 1, 1, 1, 1, 1,
-1.030999, -1.39568, -2.63298, 1, 1, 1, 1, 1,
-1.024918, -1.770265, -1.563943, 1, 1, 1, 1, 1,
-1.01942, -0.358482, -0.9400771, 1, 1, 1, 1, 1,
-1.01493, 0.3635889, -0.2573467, 0, 0, 1, 1, 1,
-1.003822, 0.2543521, 0.02667544, 1, 0, 0, 1, 1,
-1.003045, 1.555189, -1.903691, 1, 0, 0, 1, 1,
-1.002206, -0.4258478, -0.7503301, 1, 0, 0, 1, 1,
-1.000347, -0.3207327, -2.471898, 1, 0, 0, 1, 1,
-0.9987376, -0.8792998, -3.295591, 1, 0, 0, 1, 1,
-0.9968401, 0.190272, -0.2487258, 0, 0, 0, 1, 1,
-0.9907917, -1.788958, -4.465013, 0, 0, 0, 1, 1,
-0.9850638, 0.5382107, -1.238366, 0, 0, 0, 1, 1,
-0.984172, 1.248674, -2.543618, 0, 0, 0, 1, 1,
-0.9833755, 0.1284765, -1.208909, 0, 0, 0, 1, 1,
-0.9746383, 0.5643443, -1.799649, 0, 0, 0, 1, 1,
-0.9723352, 0.4714325, 0.4605052, 0, 0, 0, 1, 1,
-0.9709479, -1.069593, -3.630364, 1, 1, 1, 1, 1,
-0.9696325, 0.106363, -3.117885, 1, 1, 1, 1, 1,
-0.9688104, 0.6147334, -1.983, 1, 1, 1, 1, 1,
-0.9634902, 0.7268382, 0.7969369, 1, 1, 1, 1, 1,
-0.9617471, 1.211835, -1.304164, 1, 1, 1, 1, 1,
-0.9592869, -0.3354835, -1.817831, 1, 1, 1, 1, 1,
-0.9565607, 0.3776002, -1.58338, 1, 1, 1, 1, 1,
-0.9525355, 0.8382351, -0.7316388, 1, 1, 1, 1, 1,
-0.950834, -0.6177367, -1.211142, 1, 1, 1, 1, 1,
-0.9474972, 0.1770996, 0.326525, 1, 1, 1, 1, 1,
-0.9349685, -0.499077, -1.206147, 1, 1, 1, 1, 1,
-0.9299112, -2.307654, -1.951164, 1, 1, 1, 1, 1,
-0.9265481, -0.5218236, -0.6520573, 1, 1, 1, 1, 1,
-0.9257231, 1.303747, 0.2848749, 1, 1, 1, 1, 1,
-0.9197981, -0.447381, -2.075593, 1, 1, 1, 1, 1,
-0.918284, -0.8583958, -1.46084, 0, 0, 1, 1, 1,
-0.9120612, 0.7977585, -2.75348, 1, 0, 0, 1, 1,
-0.9092195, 1.596743, -0.4343406, 1, 0, 0, 1, 1,
-0.9013994, -1.426995, -1.961974, 1, 0, 0, 1, 1,
-0.9000195, 0.3650263, -0.9226398, 1, 0, 0, 1, 1,
-0.8988284, -0.3187852, -1.18644, 1, 0, 0, 1, 1,
-0.8940232, -0.6558144, -4.057868, 0, 0, 0, 1, 1,
-0.8919042, 0.7128243, -0.3121438, 0, 0, 0, 1, 1,
-0.8867818, 2.628963, -0.1551546, 0, 0, 0, 1, 1,
-0.8841255, -0.3175676, -3.038335, 0, 0, 0, 1, 1,
-0.867391, 1.635342, -0.5872273, 0, 0, 0, 1, 1,
-0.861964, -0.7879173, -2.019148, 0, 0, 0, 1, 1,
-0.8603386, -0.3648399, -0.7712914, 0, 0, 0, 1, 1,
-0.8551216, -0.3176812, -1.958763, 1, 1, 1, 1, 1,
-0.8532684, -1.078573, -2.842283, 1, 1, 1, 1, 1,
-0.8499029, -0.6710835, -1.921135, 1, 1, 1, 1, 1,
-0.8494521, -2.242718, -2.491526, 1, 1, 1, 1, 1,
-0.8487543, -1.882252, -2.068541, 1, 1, 1, 1, 1,
-0.8360187, -1.378589, -2.78953, 1, 1, 1, 1, 1,
-0.8323921, -0.01142312, -1.536586, 1, 1, 1, 1, 1,
-0.8183177, 0.2218796, -2.068842, 1, 1, 1, 1, 1,
-0.8161877, 1.037616, -0.7252678, 1, 1, 1, 1, 1,
-0.813504, 0.3162727, -1.323371, 1, 1, 1, 1, 1,
-0.80927, 1.490981, 0.1579751, 1, 1, 1, 1, 1,
-0.807811, 1.326219, 1.354007, 1, 1, 1, 1, 1,
-0.8014752, 1.427277, -2.108672, 1, 1, 1, 1, 1,
-0.8005009, -1.475743, -4.438554, 1, 1, 1, 1, 1,
-0.7916623, 0.649657, 0.1263311, 1, 1, 1, 1, 1,
-0.790725, 0.4631983, -1.362652, 0, 0, 1, 1, 1,
-0.7892079, -0.3060659, -2.110836, 1, 0, 0, 1, 1,
-0.7811618, 0.0450024, -1.485494, 1, 0, 0, 1, 1,
-0.7761022, -1.337946, -3.273538, 1, 0, 0, 1, 1,
-0.7734263, -1.596456, -3.131441, 1, 0, 0, 1, 1,
-0.7716346, -0.4278211, -3.03145, 1, 0, 0, 1, 1,
-0.7685151, -0.7410618, -1.638978, 0, 0, 0, 1, 1,
-0.7682825, 0.5994834, 0.5207851, 0, 0, 0, 1, 1,
-0.7648386, 1.900197, -0.4537726, 0, 0, 0, 1, 1,
-0.7644708, -1.625504, -1.99732, 0, 0, 0, 1, 1,
-0.7639364, -1.069405, -3.922385, 0, 0, 0, 1, 1,
-0.7638801, 0.8315862, -2.483516, 0, 0, 0, 1, 1,
-0.7633705, 1.274614, 0.5159621, 0, 0, 0, 1, 1,
-0.7615659, -1.098572, -3.498369, 1, 1, 1, 1, 1,
-0.7608854, -1.450028, -5.480141, 1, 1, 1, 1, 1,
-0.7596802, -0.7112669, -1.745806, 1, 1, 1, 1, 1,
-0.7586282, -0.399576, -2.912279, 1, 1, 1, 1, 1,
-0.7579734, -0.2937423, -0.5189605, 1, 1, 1, 1, 1,
-0.7572358, 0.221979, -1.179088, 1, 1, 1, 1, 1,
-0.756375, 1.220274, -1.120611, 1, 1, 1, 1, 1,
-0.7561455, -0.4376296, -2.793324, 1, 1, 1, 1, 1,
-0.7558282, 0.4509789, 0.1889014, 1, 1, 1, 1, 1,
-0.7545635, -0.5086218, -1.592036, 1, 1, 1, 1, 1,
-0.7486907, -0.346216, -1.762891, 1, 1, 1, 1, 1,
-0.7452213, 0.9443058, -0.7043601, 1, 1, 1, 1, 1,
-0.7437311, -1.224392, -2.09842, 1, 1, 1, 1, 1,
-0.7429298, 0.5337288, -2.03212, 1, 1, 1, 1, 1,
-0.7400638, -0.3991195, -1.068876, 1, 1, 1, 1, 1,
-0.7345451, -1.688049, -1.532476, 0, 0, 1, 1, 1,
-0.734326, -1.080627, -3.118817, 1, 0, 0, 1, 1,
-0.7273305, 0.561367, -2.64895, 1, 0, 0, 1, 1,
-0.725777, 0.7914569, -1.432312, 1, 0, 0, 1, 1,
-0.7251334, 1.559314, 0.3470576, 1, 0, 0, 1, 1,
-0.7162688, 0.9202936, -2.249357, 1, 0, 0, 1, 1,
-0.7153872, 0.6879609, -0.1626394, 0, 0, 0, 1, 1,
-0.7129056, -1.197338, -4.214023, 0, 0, 0, 1, 1,
-0.7128268, -0.06324878, -3.024619, 0, 0, 0, 1, 1,
-0.7115213, 0.4153543, 0.4513805, 0, 0, 0, 1, 1,
-0.708427, 0.7772412, -3.055007, 0, 0, 0, 1, 1,
-0.7055616, 0.7800903, -0.3404933, 0, 0, 0, 1, 1,
-0.7034525, 0.8549013, 0.03095797, 0, 0, 0, 1, 1,
-0.7024424, 0.4532111, 0.5067872, 1, 1, 1, 1, 1,
-0.7013054, -1.583652, -2.808884, 1, 1, 1, 1, 1,
-0.7009838, 0.3945321, -1.20304, 1, 1, 1, 1, 1,
-0.6986644, 2.104353, 0.1637332, 1, 1, 1, 1, 1,
-0.6963711, -2.405677, -1.559854, 1, 1, 1, 1, 1,
-0.6930537, 0.6384241, -1.963822, 1, 1, 1, 1, 1,
-0.6929598, -1.195666, -2.95397, 1, 1, 1, 1, 1,
-0.6903442, 0.3702694, -1.135605, 1, 1, 1, 1, 1,
-0.6814541, -0.3124002, -2.493464, 1, 1, 1, 1, 1,
-0.6809926, -0.7023836, -3.001377, 1, 1, 1, 1, 1,
-0.6790777, 0.076964, -0.353917, 1, 1, 1, 1, 1,
-0.6742503, -0.5849649, -3.806832, 1, 1, 1, 1, 1,
-0.6741746, -0.3735189, -2.164913, 1, 1, 1, 1, 1,
-0.6701298, -0.880954, -3.69559, 1, 1, 1, 1, 1,
-0.6658667, 1.30541, -0.7802699, 1, 1, 1, 1, 1,
-0.6639973, 0.218348, -1.301773, 0, 0, 1, 1, 1,
-0.6627023, -1.958461, -3.033391, 1, 0, 0, 1, 1,
-0.6605244, 0.1568982, -0.2435665, 1, 0, 0, 1, 1,
-0.6593491, -0.1201866, -0.8746007, 1, 0, 0, 1, 1,
-0.6574388, -1.215364, -1.996496, 1, 0, 0, 1, 1,
-0.6544564, 1.069227, -0.2498667, 1, 0, 0, 1, 1,
-0.6529194, -1.868084, -2.454775, 0, 0, 0, 1, 1,
-0.6518199, -0.3910766, -2.071741, 0, 0, 0, 1, 1,
-0.6514571, 1.212529, -0.1613607, 0, 0, 0, 1, 1,
-0.6490372, 0.359165, -2.53388, 0, 0, 0, 1, 1,
-0.6450894, 1.092031, -1.567524, 0, 0, 0, 1, 1,
-0.6439247, 1.667774, -0.434161, 0, 0, 0, 1, 1,
-0.6432722, 0.7741221, -0.6384901, 0, 0, 0, 1, 1,
-0.6392554, -0.507147, -2.634105, 1, 1, 1, 1, 1,
-0.6380824, 0.6584016, -0.7366664, 1, 1, 1, 1, 1,
-0.6363819, -0.3931207, -3.248626, 1, 1, 1, 1, 1,
-0.6360202, -0.3523184, -1.15995, 1, 1, 1, 1, 1,
-0.635351, 0.9429197, -1.714808, 1, 1, 1, 1, 1,
-0.6316828, -1.904307, -3.800843, 1, 1, 1, 1, 1,
-0.631572, -0.2239063, -2.445623, 1, 1, 1, 1, 1,
-0.6289033, -1.052419, -1.075675, 1, 1, 1, 1, 1,
-0.624379, -0.391667, -3.51769, 1, 1, 1, 1, 1,
-0.6175734, -0.4536667, -2.409703, 1, 1, 1, 1, 1,
-0.616328, 3.106241, 0.2234262, 1, 1, 1, 1, 1,
-0.6153162, 1.075173, -1.341163, 1, 1, 1, 1, 1,
-0.6094676, -0.8411579, -3.051655, 1, 1, 1, 1, 1,
-0.6092879, -0.123419, -2.986146, 1, 1, 1, 1, 1,
-0.6009927, 1.009835, -1.536496, 1, 1, 1, 1, 1,
-0.5975742, -1.46857, -3.761867, 0, 0, 1, 1, 1,
-0.595302, -1.14902, -1.430173, 1, 0, 0, 1, 1,
-0.5948479, -0.1665754, -2.39924, 1, 0, 0, 1, 1,
-0.5896267, 1.555905, -0.2858132, 1, 0, 0, 1, 1,
-0.5834677, -0.1769158, -1.647503, 1, 0, 0, 1, 1,
-0.5828368, -2.514313, -4.658199, 1, 0, 0, 1, 1,
-0.5816511, -0.2648932, -0.5750835, 0, 0, 0, 1, 1,
-0.5808328, -0.177662, -0.822583, 0, 0, 0, 1, 1,
-0.5747728, -0.1907289, -2.776509, 0, 0, 0, 1, 1,
-0.5710348, 0.1776168, -2.271508, 0, 0, 0, 1, 1,
-0.5694472, -0.9142563, -3.318503, 0, 0, 0, 1, 1,
-0.5677663, -0.1654423, -3.104154, 0, 0, 0, 1, 1,
-0.5675367, -0.6343315, -1.836682, 0, 0, 0, 1, 1,
-0.5658363, 0.4063452, -1.224347, 1, 1, 1, 1, 1,
-0.5633802, 1.091577, -1.228036, 1, 1, 1, 1, 1,
-0.5597575, 0.5751296, -0.9215907, 1, 1, 1, 1, 1,
-0.5531502, -0.6277302, -3.115829, 1, 1, 1, 1, 1,
-0.5478885, -0.2735365, -1.436749, 1, 1, 1, 1, 1,
-0.5432705, -0.01964115, -2.455815, 1, 1, 1, 1, 1,
-0.543086, -0.8110157, -2.578653, 1, 1, 1, 1, 1,
-0.5392868, -0.07247475, -3.038856, 1, 1, 1, 1, 1,
-0.5377592, 0.2159667, -1.755368, 1, 1, 1, 1, 1,
-0.5363156, -1.945009, -3.94834, 1, 1, 1, 1, 1,
-0.534595, 1.537995, 0.06966108, 1, 1, 1, 1, 1,
-0.5323119, 0.2418432, -1.199, 1, 1, 1, 1, 1,
-0.5295932, -1.052872, -2.191349, 1, 1, 1, 1, 1,
-0.52709, 0.4099282, -0.8386901, 1, 1, 1, 1, 1,
-0.5265407, -0.9413217, -4.547462, 1, 1, 1, 1, 1,
-0.5251297, -0.9450374, -2.275837, 0, 0, 1, 1, 1,
-0.524985, -0.7753944, -1.772771, 1, 0, 0, 1, 1,
-0.5230044, -0.5909824, -2.697672, 1, 0, 0, 1, 1,
-0.5158893, 0.532888, -0.6506664, 1, 0, 0, 1, 1,
-0.5136977, 1.56871, 0.1570535, 1, 0, 0, 1, 1,
-0.5088513, 0.1476662, -0.4421439, 1, 0, 0, 1, 1,
-0.5071504, -0.3707772, -2.76906, 0, 0, 0, 1, 1,
-0.5056732, 0.9113904, 0.04321251, 0, 0, 0, 1, 1,
-0.4977651, 0.2133049, -1.627178, 0, 0, 0, 1, 1,
-0.4949611, -0.1710436, -3.209199, 0, 0, 0, 1, 1,
-0.4932071, -0.5704401, -2.840076, 0, 0, 0, 1, 1,
-0.4919825, -0.7097973, -2.914448, 0, 0, 0, 1, 1,
-0.4909783, 0.5780673, 0.007742097, 0, 0, 0, 1, 1,
-0.4892564, 1.125605, -0.3480783, 1, 1, 1, 1, 1,
-0.4869785, -0.09321411, -0.5674565, 1, 1, 1, 1, 1,
-0.4794591, -0.057389, -0.3150113, 1, 1, 1, 1, 1,
-0.4790842, 0.2984368, -2.658184, 1, 1, 1, 1, 1,
-0.4740962, -1.024458, -4.146515, 1, 1, 1, 1, 1,
-0.4721775, 1.176692, 0.07548379, 1, 1, 1, 1, 1,
-0.471044, 0.6197588, -0.6528903, 1, 1, 1, 1, 1,
-0.4703692, 0.04106787, -1.341135, 1, 1, 1, 1, 1,
-0.464097, 1.381056, 0.7652797, 1, 1, 1, 1, 1,
-0.4634184, -0.5118999, -0.3288133, 1, 1, 1, 1, 1,
-0.4621063, 0.02971973, -1.291934, 1, 1, 1, 1, 1,
-0.4550112, 0.4901204, -1.577611, 1, 1, 1, 1, 1,
-0.4545198, 0.4100708, -2.839382, 1, 1, 1, 1, 1,
-0.4545041, 0.7433957, 0.2655984, 1, 1, 1, 1, 1,
-0.451075, -0.3723938, -1.691053, 1, 1, 1, 1, 1,
-0.4489263, 0.6267655, 0.1994358, 0, 0, 1, 1, 1,
-0.4465678, 0.2595709, -2.009583, 1, 0, 0, 1, 1,
-0.4447392, -0.002618388, -3.60314, 1, 0, 0, 1, 1,
-0.4441299, -1.934831, -3.664055, 1, 0, 0, 1, 1,
-0.4437937, -0.9889215, -2.832005, 1, 0, 0, 1, 1,
-0.4434035, 1.132299, -0.5883712, 1, 0, 0, 1, 1,
-0.4397016, 0.7403934, 1.253206, 0, 0, 0, 1, 1,
-0.4371459, -1.418853, -3.442039, 0, 0, 0, 1, 1,
-0.4330824, 1.078461, -0.2804968, 0, 0, 0, 1, 1,
-0.4324256, -0.3897041, -3.608046, 0, 0, 0, 1, 1,
-0.4323734, 1.17642, -1.30438, 0, 0, 0, 1, 1,
-0.4319753, -0.1822989, -2.521667, 0, 0, 0, 1, 1,
-0.4219565, 0.7608547, -1.248994, 0, 0, 0, 1, 1,
-0.420637, 1.482625, 0.2850636, 1, 1, 1, 1, 1,
-0.4189802, 0.211573, -0.9013274, 1, 1, 1, 1, 1,
-0.4165064, 1.066904, -0.3234856, 1, 1, 1, 1, 1,
-0.4131892, 0.2767971, 0.8268449, 1, 1, 1, 1, 1,
-0.4075705, -0.4980102, -2.25843, 1, 1, 1, 1, 1,
-0.4057775, -1.17525, -2.883734, 1, 1, 1, 1, 1,
-0.4041167, 0.3820328, -0.4388916, 1, 1, 1, 1, 1,
-0.4012101, 0.8665854, -1.392128, 1, 1, 1, 1, 1,
-0.3949498, -3.539616, -3.005243, 1, 1, 1, 1, 1,
-0.3894665, -0.8971368, -2.391145, 1, 1, 1, 1, 1,
-0.3881263, 0.2103197, -0.9439522, 1, 1, 1, 1, 1,
-0.3871248, 0.2145848, 0.1281327, 1, 1, 1, 1, 1,
-0.3866396, -1.566296, -1.592297, 1, 1, 1, 1, 1,
-0.3801829, 0.491553, 0.58507, 1, 1, 1, 1, 1,
-0.3801455, 0.1015688, -1.595147, 1, 1, 1, 1, 1,
-0.3777464, 1.976279, 0.8939406, 0, 0, 1, 1, 1,
-0.3743396, 1.798383, 0.03338063, 1, 0, 0, 1, 1,
-0.3739106, 0.6958348, -1.756511, 1, 0, 0, 1, 1,
-0.3712033, 1.633757, 0.3855665, 1, 0, 0, 1, 1,
-0.3710096, -0.9171617, -4.19722, 1, 0, 0, 1, 1,
-0.3694937, 0.02044296, -2.056141, 1, 0, 0, 1, 1,
-0.3670674, 0.3948424, -2.295422, 0, 0, 0, 1, 1,
-0.3651635, -0.8627665, -3.342033, 0, 0, 0, 1, 1,
-0.3628446, 1.022767, -0.7048126, 0, 0, 0, 1, 1,
-0.3583548, -1.632977, -1.787786, 0, 0, 0, 1, 1,
-0.3570673, 0.9417821, -0.0758904, 0, 0, 0, 1, 1,
-0.3558929, -0.0710488, -2.205665, 0, 0, 0, 1, 1,
-0.3520994, -0.1683286, -2.025081, 0, 0, 0, 1, 1,
-0.3517236, 0.07001554, -1.62818, 1, 1, 1, 1, 1,
-0.3450645, 0.3088306, 0.1105274, 1, 1, 1, 1, 1,
-0.344681, -0.3531902, 0.1986919, 1, 1, 1, 1, 1,
-0.3445087, -1.292343, -2.241554, 1, 1, 1, 1, 1,
-0.3429664, 0.6772845, -1.099189, 1, 1, 1, 1, 1,
-0.339211, 0.02615056, -1.895552, 1, 1, 1, 1, 1,
-0.3375326, -1.641588, -3.048099, 1, 1, 1, 1, 1,
-0.3358067, 0.1623034, -0.1916902, 1, 1, 1, 1, 1,
-0.3314059, -0.2336771, -0.566057, 1, 1, 1, 1, 1,
-0.3282779, 0.08775441, -0.1907851, 1, 1, 1, 1, 1,
-0.3255574, 1.246243, -0.6325365, 1, 1, 1, 1, 1,
-0.3253317, 0.2082353, -2.883084, 1, 1, 1, 1, 1,
-0.3227532, 0.7826043, -0.08980822, 1, 1, 1, 1, 1,
-0.3198464, 0.1715456, -3.210913, 1, 1, 1, 1, 1,
-0.3182982, -1.439391, -4.828908, 1, 1, 1, 1, 1,
-0.3163737, -0.9634108, -2.97124, 0, 0, 1, 1, 1,
-0.3160293, 0.580576, -1.081139, 1, 0, 0, 1, 1,
-0.3153407, 0.1210583, -1.370444, 1, 0, 0, 1, 1,
-0.3143166, 1.367955, -1.067167, 1, 0, 0, 1, 1,
-0.3112055, 2.104733, 0.7200286, 1, 0, 0, 1, 1,
-0.3084467, -1.5248, -2.891511, 1, 0, 0, 1, 1,
-0.2987315, -0.5160171, -2.159038, 0, 0, 0, 1, 1,
-0.2966053, 0.2135969, -3.076247, 0, 0, 0, 1, 1,
-0.2964278, 0.5715796, -1.444796, 0, 0, 0, 1, 1,
-0.2914093, 0.6016982, 0.317178, 0, 0, 0, 1, 1,
-0.2898926, -0.2336471, -3.649101, 0, 0, 0, 1, 1,
-0.2897844, -1.509262, -0.8952657, 0, 0, 0, 1, 1,
-0.2885513, 0.9227798, 0.3446736, 0, 0, 0, 1, 1,
-0.288162, -0.0186033, -3.578901, 1, 1, 1, 1, 1,
-0.2850368, -0.2579421, -1.935113, 1, 1, 1, 1, 1,
-0.276587, 0.5557265, 1.269907, 1, 1, 1, 1, 1,
-0.2683333, -2.204899, -2.387938, 1, 1, 1, 1, 1,
-0.2675834, -0.6375655, -1.377106, 1, 1, 1, 1, 1,
-0.2631922, 0.07112643, -3.067536, 1, 1, 1, 1, 1,
-0.261891, 1.071869, 0.2168659, 1, 1, 1, 1, 1,
-0.2603802, 1.093163, -1.385473, 1, 1, 1, 1, 1,
-0.2584826, 0.2568425, -1.271414, 1, 1, 1, 1, 1,
-0.2574955, -0.08092533, -2.096344, 1, 1, 1, 1, 1,
-0.2554832, 1.94118, 0.5438075, 1, 1, 1, 1, 1,
-0.2554812, 0.7153838, 0.3716131, 1, 1, 1, 1, 1,
-0.2547185, -1.205654, -2.223299, 1, 1, 1, 1, 1,
-0.2526007, 0.2805088, -0.1392476, 1, 1, 1, 1, 1,
-0.2489273, 0.7357363, -0.5541084, 1, 1, 1, 1, 1,
-0.2485893, -0.490263, -2.075037, 0, 0, 1, 1, 1,
-0.2336865, 0.9709007, 0.6259035, 1, 0, 0, 1, 1,
-0.2327462, 0.5615796, -0.9577891, 1, 0, 0, 1, 1,
-0.2293665, -0.575649, -3.42451, 1, 0, 0, 1, 1,
-0.2271711, -0.4746479, -2.650086, 1, 0, 0, 1, 1,
-0.2213806, -0.3106211, -1.411565, 1, 0, 0, 1, 1,
-0.2199903, -1.825429, -3.968134, 0, 0, 0, 1, 1,
-0.2191504, -1.169466, -4.404748, 0, 0, 0, 1, 1,
-0.2166851, -0.946285, -1.411361, 0, 0, 0, 1, 1,
-0.2125871, -1.558429, -3.342707, 0, 0, 0, 1, 1,
-0.2088038, -1.427635, -2.747285, 0, 0, 0, 1, 1,
-0.2073809, -0.3921834, -0.8521195, 0, 0, 0, 1, 1,
-0.2054624, 0.2349754, -0.2531887, 0, 0, 0, 1, 1,
-0.2037409, 0.8905497, -0.8879817, 1, 1, 1, 1, 1,
-0.1985801, 0.6365204, -1.756193, 1, 1, 1, 1, 1,
-0.1981762, -0.914489, -2.302885, 1, 1, 1, 1, 1,
-0.1928347, -0.0716543, -1.485923, 1, 1, 1, 1, 1,
-0.1877118, -0.920639, -2.578516, 1, 1, 1, 1, 1,
-0.1843196, -1.534507, -2.621095, 1, 1, 1, 1, 1,
-0.1833063, 0.9894047, 0.2493892, 1, 1, 1, 1, 1,
-0.1814901, -0.3184857, -2.417778, 1, 1, 1, 1, 1,
-0.1813027, 0.6679521, 0.3744459, 1, 1, 1, 1, 1,
-0.1808651, -0.2720959, -4.305705, 1, 1, 1, 1, 1,
-0.1807916, 0.7338339, -0.2168533, 1, 1, 1, 1, 1,
-0.1773764, 0.9155777, 1.387635, 1, 1, 1, 1, 1,
-0.1749697, -0.8945968, -2.792207, 1, 1, 1, 1, 1,
-0.1745956, -0.3145857, -2.955821, 1, 1, 1, 1, 1,
-0.1708879, -0.3791994, -1.797973, 1, 1, 1, 1, 1,
-0.1667419, 0.5409086, -0.2444553, 0, 0, 1, 1, 1,
-0.1657622, 0.03587429, -1.887142, 1, 0, 0, 1, 1,
-0.1639688, 0.9775559, 0.1894268, 1, 0, 0, 1, 1,
-0.1593221, 0.7588195, 0.01017515, 1, 0, 0, 1, 1,
-0.1587858, 0.5793008, -0.122309, 1, 0, 0, 1, 1,
-0.1567791, -0.1173166, -3.330679, 1, 0, 0, 1, 1,
-0.1565802, 0.02869225, -1.72628, 0, 0, 0, 1, 1,
-0.1483884, -0.2615507, -3.401647, 0, 0, 0, 1, 1,
-0.1456736, 0.6563758, -0.1486199, 0, 0, 0, 1, 1,
-0.1402087, 0.9437311, -0.5381882, 0, 0, 0, 1, 1,
-0.1318299, 0.2435892, 0.09942126, 0, 0, 0, 1, 1,
-0.131209, 2.132735, 1.139945, 0, 0, 0, 1, 1,
-0.1298297, -0.4293474, -3.351561, 0, 0, 0, 1, 1,
-0.1289174, -1.176297, -3.433136, 1, 1, 1, 1, 1,
-0.1248461, -0.3032855, -2.964125, 1, 1, 1, 1, 1,
-0.1196707, 0.4542291, 1.185353, 1, 1, 1, 1, 1,
-0.1186812, 1.108786, -0.1776279, 1, 1, 1, 1, 1,
-0.118638, 0.2071971, -1.460241, 1, 1, 1, 1, 1,
-0.1183528, 0.09997362, 0.02808205, 1, 1, 1, 1, 1,
-0.117687, 0.2336249, -0.4633489, 1, 1, 1, 1, 1,
-0.1142641, 0.1593935, -1.237692, 1, 1, 1, 1, 1,
-0.1088004, -1.037088, -1.277319, 1, 1, 1, 1, 1,
-0.1008981, 0.4373949, -0.9853951, 1, 1, 1, 1, 1,
-0.09658266, -0.1012112, -3.085257, 1, 1, 1, 1, 1,
-0.0938677, 1.155986, 0.9212033, 1, 1, 1, 1, 1,
-0.09357081, 1.369927, -0.02830857, 1, 1, 1, 1, 1,
-0.09248435, 0.7181177, -0.6452712, 1, 1, 1, 1, 1,
-0.08730389, 0.1929367, -1.284172, 1, 1, 1, 1, 1,
-0.08392386, 0.8673019, 0.3122138, 0, 0, 1, 1, 1,
-0.08269284, -0.2211189, -3.91246, 1, 0, 0, 1, 1,
-0.08004276, -0.6032795, -2.305464, 1, 0, 0, 1, 1,
-0.07839081, -0.9331387, -2.30656, 1, 0, 0, 1, 1,
-0.0752032, 0.03823324, -1.80779, 1, 0, 0, 1, 1,
-0.07438856, -1.127762, -2.682434, 1, 0, 0, 1, 1,
-0.07231749, 0.8578838, 0.1296135, 0, 0, 0, 1, 1,
-0.06516968, -0.805281, -3.760258, 0, 0, 0, 1, 1,
-0.06462716, 0.3624864, 0.743634, 0, 0, 0, 1, 1,
-0.05565577, 1.210277, -2.004279, 0, 0, 0, 1, 1,
-0.05198727, 0.9962694, -1.316951, 0, 0, 0, 1, 1,
-0.05187779, -0.8532272, -1.586442, 0, 0, 0, 1, 1,
-0.05161755, -0.1012922, -3.328486, 0, 0, 0, 1, 1,
-0.04878913, 1.901267, 0.6226639, 1, 1, 1, 1, 1,
-0.04699165, 0.9347814, -1.252743, 1, 1, 1, 1, 1,
-0.04172242, -0.3919483, -3.359159, 1, 1, 1, 1, 1,
-0.04146197, -0.2481663, -3.58076, 1, 1, 1, 1, 1,
-0.03863585, -0.1113769, -3.039147, 1, 1, 1, 1, 1,
-0.03793051, 0.2586414, 0.6882049, 1, 1, 1, 1, 1,
-0.03079912, 0.1453051, 1.626973, 1, 1, 1, 1, 1,
-0.02589459, 1.808389, -0.5279024, 1, 1, 1, 1, 1,
-0.01540413, 0.5508445, -0.2729883, 1, 1, 1, 1, 1,
-0.0097394, -0.4720297, -3.23465, 1, 1, 1, 1, 1,
-0.004882443, -0.7717511, -3.238088, 1, 1, 1, 1, 1,
-0.002341605, 1.436533, -0.9793312, 1, 1, 1, 1, 1,
-0.001321746, 1.837583, 0.07590969, 1, 1, 1, 1, 1,
0.006444035, -0.4679874, 3.113885, 1, 1, 1, 1, 1,
0.01028077, 0.2247906, 0.8892447, 1, 1, 1, 1, 1,
0.01127441, 0.4105083, -1.086299, 0, 0, 1, 1, 1,
0.01256313, 0.3492079, -0.2262077, 1, 0, 0, 1, 1,
0.01405132, 0.6927943, 0.6763911, 1, 0, 0, 1, 1,
0.01424853, 1.077462, 0.2433819, 1, 0, 0, 1, 1,
0.01958509, -0.4567837, 2.488579, 1, 0, 0, 1, 1,
0.02197146, -1.723631, 2.809193, 1, 0, 0, 1, 1,
0.02711775, -0.1329017, 4.637036, 0, 0, 0, 1, 1,
0.02715749, 0.3841929, 1.102519, 0, 0, 0, 1, 1,
0.02789208, -0.5423627, 2.356879, 0, 0, 0, 1, 1,
0.02824278, -0.6433583, 3.93545, 0, 0, 0, 1, 1,
0.04237811, 0.4632194, -0.5731339, 0, 0, 0, 1, 1,
0.04425043, 0.8209644, 0.9198274, 0, 0, 0, 1, 1,
0.04442994, 0.1614165, -0.4673496, 0, 0, 0, 1, 1,
0.04729877, 0.4315622, 0.8609846, 1, 1, 1, 1, 1,
0.0479066, -1.875133, 1.737818, 1, 1, 1, 1, 1,
0.04839042, -1.032711, 3.643832, 1, 1, 1, 1, 1,
0.04880038, -1.036207, 3.774028, 1, 1, 1, 1, 1,
0.04888119, 0.5861242, 0.8373343, 1, 1, 1, 1, 1,
0.04897616, -0.1498901, 1.342788, 1, 1, 1, 1, 1,
0.04948283, 0.6319792, -0.4138657, 1, 1, 1, 1, 1,
0.05673725, -0.2694644, 2.216388, 1, 1, 1, 1, 1,
0.06017936, -0.7812554, 1.288165, 1, 1, 1, 1, 1,
0.06227661, -1.69321, 2.52663, 1, 1, 1, 1, 1,
0.07089828, -0.8266103, 3.372538, 1, 1, 1, 1, 1,
0.0742568, 0.4171114, -1.169539, 1, 1, 1, 1, 1,
0.07926339, -0.4321994, 2.767325, 1, 1, 1, 1, 1,
0.07932489, -0.7637371, 5.085865, 1, 1, 1, 1, 1,
0.08057304, -0.3849395, 1.773185, 1, 1, 1, 1, 1,
0.08285756, -0.9680642, 2.591816, 0, 0, 1, 1, 1,
0.08312801, 1.554669, -1.795337, 1, 0, 0, 1, 1,
0.0843716, -0.4438602, 1.942869, 1, 0, 0, 1, 1,
0.08556033, -1.180492, 3.099529, 1, 0, 0, 1, 1,
0.08666836, 0.3042151, 0.601984, 1, 0, 0, 1, 1,
0.08845994, -0.1575485, 2.389699, 1, 0, 0, 1, 1,
0.08873846, -0.5576656, 2.742953, 0, 0, 0, 1, 1,
0.09269463, -2.064545, 4.328401, 0, 0, 0, 1, 1,
0.09705388, 0.7515787, 1.441275, 0, 0, 0, 1, 1,
0.09770726, -0.4404947, 3.345272, 0, 0, 0, 1, 1,
0.09930286, 1.61139, 1.610602, 0, 0, 0, 1, 1,
0.1035309, 1.940912, 0.4331799, 0, 0, 0, 1, 1,
0.1041014, 1.382273, 0.03877473, 0, 0, 0, 1, 1,
0.1051939, 0.09375978, 2.165524, 1, 1, 1, 1, 1,
0.1076656, 0.001383849, 1.139897, 1, 1, 1, 1, 1,
0.1088997, 0.05071328, 2.606565, 1, 1, 1, 1, 1,
0.1107557, -0.3237293, 4.025642, 1, 1, 1, 1, 1,
0.1111364, -0.8151676, 1.809583, 1, 1, 1, 1, 1,
0.1117907, -0.600518, 4.046631, 1, 1, 1, 1, 1,
0.1122368, -1.020699, 3.121121, 1, 1, 1, 1, 1,
0.1141752, 1.313924, 0.8599224, 1, 1, 1, 1, 1,
0.1158701, 0.8721604, 0.09957998, 1, 1, 1, 1, 1,
0.1161706, 0.3431389, 1.459464, 1, 1, 1, 1, 1,
0.1229588, 1.021412, 1.398887, 1, 1, 1, 1, 1,
0.1324105, -1.53782, 3.676053, 1, 1, 1, 1, 1,
0.1341693, 1.467004, 0.7856801, 1, 1, 1, 1, 1,
0.1371936, -0.4496162, 4.685511, 1, 1, 1, 1, 1,
0.1389744, 0.6598197, 0.3697562, 1, 1, 1, 1, 1,
0.1479528, -0.6097263, 3.982073, 0, 0, 1, 1, 1,
0.1513302, -0.3945312, 3.007589, 1, 0, 0, 1, 1,
0.1531936, 1.716875, 0.02489826, 1, 0, 0, 1, 1,
0.1560954, 0.8638429, 0.939998, 1, 0, 0, 1, 1,
0.1576509, -0.8398304, 3.98478, 1, 0, 0, 1, 1,
0.1630068, -0.6289391, 0.4912778, 1, 0, 0, 1, 1,
0.1654725, -0.5380342, 3.470817, 0, 0, 0, 1, 1,
0.1660882, 0.7473544, -1.670769, 0, 0, 0, 1, 1,
0.1662662, -0.217642, 1.907045, 0, 0, 0, 1, 1,
0.1701446, -0.6397572, 2.610353, 0, 0, 0, 1, 1,
0.173993, 0.05598829, 1.145771, 0, 0, 0, 1, 1,
0.174248, -0.3200618, 2.933666, 0, 0, 0, 1, 1,
0.1785536, 0.8754711, 0.6545727, 0, 0, 0, 1, 1,
0.1838587, -0.4965627, 3.689883, 1, 1, 1, 1, 1,
0.1844873, 0.2287002, 0.4831845, 1, 1, 1, 1, 1,
0.1878821, -0.5484541, 1.754833, 1, 1, 1, 1, 1,
0.1883748, -1.038238, 3.642069, 1, 1, 1, 1, 1,
0.1913317, 0.3560316, -0.5079476, 1, 1, 1, 1, 1,
0.1921948, 0.1957719, 1.210008, 1, 1, 1, 1, 1,
0.1924022, 1.511356, -0.06021803, 1, 1, 1, 1, 1,
0.1935797, 1.301749, 1.012209, 1, 1, 1, 1, 1,
0.1936593, 0.6031303, 0.2566031, 1, 1, 1, 1, 1,
0.1947174, -0.1917046, 1.906571, 1, 1, 1, 1, 1,
0.1962283, 0.2638086, 0.8635474, 1, 1, 1, 1, 1,
0.2009155, -0.04927092, 1.767248, 1, 1, 1, 1, 1,
0.2056074, -0.6243348, 2.557525, 1, 1, 1, 1, 1,
0.2063822, -2.824561, 4.545854, 1, 1, 1, 1, 1,
0.2069211, -0.9395123, 2.424193, 1, 1, 1, 1, 1,
0.2090969, 0.01440562, 0.7195979, 0, 0, 1, 1, 1,
0.2121911, 0.0006980828, 2.210724, 1, 0, 0, 1, 1,
0.2123782, -0.9677967, 3.391821, 1, 0, 0, 1, 1,
0.215688, -0.6747316, 3.194451, 1, 0, 0, 1, 1,
0.216503, 0.6665339, -0.03961959, 1, 0, 0, 1, 1,
0.2174363, 0.2577568, 0.2900004, 1, 0, 0, 1, 1,
0.2176138, 0.3552281, 0.01974901, 0, 0, 0, 1, 1,
0.220488, -1.639233, 2.426397, 0, 0, 0, 1, 1,
0.2275064, 0.8426881, 0.4252236, 0, 0, 0, 1, 1,
0.2298093, -0.1538779, 3.532785, 0, 0, 0, 1, 1,
0.2318391, -2.385605, 2.741301, 0, 0, 0, 1, 1,
0.2327749, -0.6233151, 3.240574, 0, 0, 0, 1, 1,
0.2358678, 0.007659142, 1.450896, 0, 0, 0, 1, 1,
0.245676, -1.19298, 3.666245, 1, 1, 1, 1, 1,
0.2484065, 1.114283, 1.773486, 1, 1, 1, 1, 1,
0.2497677, 1.364184, 0.7050476, 1, 1, 1, 1, 1,
0.2501296, -0.3390851, 3.673026, 1, 1, 1, 1, 1,
0.2575879, -0.1160712, 2.548577, 1, 1, 1, 1, 1,
0.2621254, -0.4126125, 3.035539, 1, 1, 1, 1, 1,
0.265193, 0.2329809, -1.935089, 1, 1, 1, 1, 1,
0.2668748, 0.3332831, 1.820425, 1, 1, 1, 1, 1,
0.2710293, -1.492971, 3.413934, 1, 1, 1, 1, 1,
0.2730878, -0.9822941, 3.766792, 1, 1, 1, 1, 1,
0.2755025, -0.1710402, 2.312373, 1, 1, 1, 1, 1,
0.2789163, -1.498712, 4.081354, 1, 1, 1, 1, 1,
0.2796342, 0.698717, 2.169349, 1, 1, 1, 1, 1,
0.279865, 2.08128, 1.116364, 1, 1, 1, 1, 1,
0.2844754, 1.670247, 1.050217, 1, 1, 1, 1, 1,
0.2853036, -0.8718284, 2.316686, 0, 0, 1, 1, 1,
0.285598, -0.8225186, 4.758003, 1, 0, 0, 1, 1,
0.2869763, 1.343446, 1.112842, 1, 0, 0, 1, 1,
0.2880896, -0.9022028, 3.932716, 1, 0, 0, 1, 1,
0.2930707, 0.2249582, 0.1752568, 1, 0, 0, 1, 1,
0.2936878, -1.267991, 2.943981, 1, 0, 0, 1, 1,
0.2945199, -0.5230086, 1.957505, 0, 0, 0, 1, 1,
0.2971325, 0.7086412, -0.7373562, 0, 0, 0, 1, 1,
0.2998254, 0.3292308, 0.3366508, 0, 0, 0, 1, 1,
0.3013549, -1.261541, 1.094413, 0, 0, 0, 1, 1,
0.3016407, -0.8145485, 2.405225, 0, 0, 0, 1, 1,
0.304194, -1.654803, 1.66119, 0, 0, 0, 1, 1,
0.3047011, -0.1678275, 2.870036, 0, 0, 0, 1, 1,
0.307848, 0.07037196, 0.8350984, 1, 1, 1, 1, 1,
0.3099646, -1.421666, 2.551517, 1, 1, 1, 1, 1,
0.3101475, 2.073289, -0.2833545, 1, 1, 1, 1, 1,
0.3137255, 0.362225, 1.830601, 1, 1, 1, 1, 1,
0.3163573, 1.04425, 1.287677, 1, 1, 1, 1, 1,
0.3170078, 1.090106, 0.3272339, 1, 1, 1, 1, 1,
0.3198835, -0.9024909, 1.958866, 1, 1, 1, 1, 1,
0.3209804, 0.2972775, -1.648024, 1, 1, 1, 1, 1,
0.3221525, 1.865834, 1.774859, 1, 1, 1, 1, 1,
0.3280492, -0.5512906, 3.193271, 1, 1, 1, 1, 1,
0.3301443, -0.9169996, 1.651588, 1, 1, 1, 1, 1,
0.3308237, 0.9172708, -2.389324, 1, 1, 1, 1, 1,
0.3312303, 0.0715116, 2.542199, 1, 1, 1, 1, 1,
0.3344112, -1.34802, 2.25493, 1, 1, 1, 1, 1,
0.3349888, 0.8292545, 1.641695, 1, 1, 1, 1, 1,
0.3352133, 0.5603147, 1.349328, 0, 0, 1, 1, 1,
0.3373385, 1.667136, 0.256661, 1, 0, 0, 1, 1,
0.3385698, 0.9351907, 0.6128348, 1, 0, 0, 1, 1,
0.3424504, -1.024765, 4.588292, 1, 0, 0, 1, 1,
0.3446193, 0.9373104, 1.52603, 1, 0, 0, 1, 1,
0.346328, 1.377502, -0.9507596, 1, 0, 0, 1, 1,
0.3497233, 0.02080815, 1.992288, 0, 0, 0, 1, 1,
0.3537232, -0.2347572, 2.389974, 0, 0, 0, 1, 1,
0.3621737, -0.1114753, 1.34896, 0, 0, 0, 1, 1,
0.3664923, 0.7412186, -0.8501721, 0, 0, 0, 1, 1,
0.3710855, 0.1744954, -0.06633694, 0, 0, 0, 1, 1,
0.3727514, 0.8666401, 0.6891878, 0, 0, 0, 1, 1,
0.3752057, -0.369437, 3.984124, 0, 0, 0, 1, 1,
0.3777727, 0.1594396, 1.374637, 1, 1, 1, 1, 1,
0.3788209, 0.5606411, 1.590176, 1, 1, 1, 1, 1,
0.3793803, -0.1209505, -0.2074886, 1, 1, 1, 1, 1,
0.3812459, 0.1148449, 2.020897, 1, 1, 1, 1, 1,
0.3813628, 0.7859813, 1.8729, 1, 1, 1, 1, 1,
0.3835746, -1.251635, 3.244925, 1, 1, 1, 1, 1,
0.3837557, 0.3083559, 1.871801, 1, 1, 1, 1, 1,
0.3850501, 0.374346, 0.8848701, 1, 1, 1, 1, 1,
0.3914521, -1.384665, 2.355799, 1, 1, 1, 1, 1,
0.3925717, -0.4315893, 0.7419761, 1, 1, 1, 1, 1,
0.3971634, 1.119154, 0.6156976, 1, 1, 1, 1, 1,
0.3974527, 1.00499, 2.240645, 1, 1, 1, 1, 1,
0.4013314, 0.2893366, 0.3118513, 1, 1, 1, 1, 1,
0.4016851, 0.1783959, 0.8029884, 1, 1, 1, 1, 1,
0.4021065, -1.139879, 2.916685, 1, 1, 1, 1, 1,
0.4044367, -0.9794891, 4.046193, 0, 0, 1, 1, 1,
0.4094607, -1.408272, 2.498247, 1, 0, 0, 1, 1,
0.4101103, 0.02048922, 0.8761444, 1, 0, 0, 1, 1,
0.4129016, 0.2200411, 1.043649, 1, 0, 0, 1, 1,
0.413932, 1.355986, -0.005142828, 1, 0, 0, 1, 1,
0.4174865, 0.02155742, 1.606453, 1, 0, 0, 1, 1,
0.4182056, -0.4302342, 1.335616, 0, 0, 0, 1, 1,
0.420737, -0.1919542, 0.8370266, 0, 0, 0, 1, 1,
0.4214576, -1.359371, 1.87449, 0, 0, 0, 1, 1,
0.42215, -3.474727, 1.556769, 0, 0, 0, 1, 1,
0.4256231, -0.6699298, 2.339437, 0, 0, 0, 1, 1,
0.4302917, -2.050719, 2.91349, 0, 0, 0, 1, 1,
0.4309451, 1.415427, 0.5342903, 0, 0, 0, 1, 1,
0.4353625, -1.153538, 3.817938, 1, 1, 1, 1, 1,
0.4396927, -1.425845, 2.358415, 1, 1, 1, 1, 1,
0.4406599, 0.8802975, 0.08591229, 1, 1, 1, 1, 1,
0.454937, 1.265543, 1.32467, 1, 1, 1, 1, 1,
0.458332, 0.4744097, 0.4305758, 1, 1, 1, 1, 1,
0.4610454, 1.547162, 0.5690696, 1, 1, 1, 1, 1,
0.4647777, 0.9252998, -0.005489425, 1, 1, 1, 1, 1,
0.4666974, -0.3162596, 1.375283, 1, 1, 1, 1, 1,
0.4733557, -1.042556, 1.313904, 1, 1, 1, 1, 1,
0.479572, -0.00373951, 1.003406, 1, 1, 1, 1, 1,
0.4818946, -1.056389, 2.608347, 1, 1, 1, 1, 1,
0.4880384, 1.414922, -0.6325301, 1, 1, 1, 1, 1,
0.4920106, -0.1804523, 1.358674, 1, 1, 1, 1, 1,
0.4972398, -0.01255417, -0.278804, 1, 1, 1, 1, 1,
0.4988324, 0.1665903, 0.7422982, 1, 1, 1, 1, 1,
0.5058628, 0.6268662, -1.662448, 0, 0, 1, 1, 1,
0.5067468, -0.3431759, 1.66617, 1, 0, 0, 1, 1,
0.5079807, 0.07464224, 2.814093, 1, 0, 0, 1, 1,
0.5113816, 0.8294756, 0.7930637, 1, 0, 0, 1, 1,
0.5148959, 1.759122, -0.7591016, 1, 0, 0, 1, 1,
0.5171077, 2.41287, 2.154299, 1, 0, 0, 1, 1,
0.520955, -1.815289, 2.876665, 0, 0, 0, 1, 1,
0.5211338, 0.422554, 0.803328, 0, 0, 0, 1, 1,
0.526023, 0.060696, 4.003439, 0, 0, 0, 1, 1,
0.5269042, -0.3313376, 2.709564, 0, 0, 0, 1, 1,
0.5329498, -0.8718116, 2.363069, 0, 0, 0, 1, 1,
0.5407411, 0.559651, -0.04442923, 0, 0, 0, 1, 1,
0.541843, -0.6821467, 2.619437, 0, 0, 0, 1, 1,
0.5439439, 0.5939924, -0.5979379, 1, 1, 1, 1, 1,
0.5465527, 1.584858, 0.2620457, 1, 1, 1, 1, 1,
0.5520619, 0.2530513, 0.3535948, 1, 1, 1, 1, 1,
0.5536782, -1.938813, 3.638533, 1, 1, 1, 1, 1,
0.5578403, 1.778937, 0.7159356, 1, 1, 1, 1, 1,
0.5629914, 0.1104888, 0.6852646, 1, 1, 1, 1, 1,
0.5666673, -0.3967583, 1.175558, 1, 1, 1, 1, 1,
0.5694886, 0.07363784, 1.323792, 1, 1, 1, 1, 1,
0.5704856, 1.681365, 0.4344659, 1, 1, 1, 1, 1,
0.572927, 0.4103368, -0.374126, 1, 1, 1, 1, 1,
0.5738932, 0.7437245, 3.322083, 1, 1, 1, 1, 1,
0.57805, 0.8410752, 0.4133027, 1, 1, 1, 1, 1,
0.5830288, -0.258339, 1.105718, 1, 1, 1, 1, 1,
0.5847481, 0.7426921, 2.0863, 1, 1, 1, 1, 1,
0.5871779, -0.2927203, 4.125423, 1, 1, 1, 1, 1,
0.5904977, -0.9142417, 1.305366, 0, 0, 1, 1, 1,
0.5909475, 0.9276113, 0.5664937, 1, 0, 0, 1, 1,
0.6010062, 1.210741, 1.219682, 1, 0, 0, 1, 1,
0.6017622, 0.8836842, 1.022305, 1, 0, 0, 1, 1,
0.6020738, -0.1459773, 1.633624, 1, 0, 0, 1, 1,
0.6040084, 0.2205219, 0.7655124, 1, 0, 0, 1, 1,
0.6093773, -0.8929571, 2.46855, 0, 0, 0, 1, 1,
0.6130811, -0.4158886, 0.05879102, 0, 0, 0, 1, 1,
0.6157032, 0.135298, 1.862614, 0, 0, 0, 1, 1,
0.6172872, 0.3878455, 2.172844, 0, 0, 0, 1, 1,
0.6179531, -0.4709907, 2.402303, 0, 0, 0, 1, 1,
0.6234618, 0.3449222, 2.06295, 0, 0, 0, 1, 1,
0.6241231, 1.350443, -0.2550074, 0, 0, 0, 1, 1,
0.628862, 0.3519398, 1.520153, 1, 1, 1, 1, 1,
0.6321521, -0.1594598, 1.156353, 1, 1, 1, 1, 1,
0.6395907, 1.268822, 0.121036, 1, 1, 1, 1, 1,
0.6467138, -0.5912102, 3.390479, 1, 1, 1, 1, 1,
0.6477408, -0.4490653, 2.690797, 1, 1, 1, 1, 1,
0.6494778, -0.9406865, 4.133525, 1, 1, 1, 1, 1,
0.6499698, -0.4552407, 1.823712, 1, 1, 1, 1, 1,
0.6577199, -0.3065793, 1.479257, 1, 1, 1, 1, 1,
0.6610446, 0.1188925, 1.435376, 1, 1, 1, 1, 1,
0.6670316, 0.914062, 1.518247, 1, 1, 1, 1, 1,
0.6682789, 0.08524856, 1.843933, 1, 1, 1, 1, 1,
0.6723006, -0.6286016, 2.756878, 1, 1, 1, 1, 1,
0.6733528, 0.5686093, 2.222037, 1, 1, 1, 1, 1,
0.6748252, -0.4824344, 1.56026, 1, 1, 1, 1, 1,
0.6748549, 0.8629633, 0.03793743, 1, 1, 1, 1, 1,
0.6760424, -0.05657145, 2.59572, 0, 0, 1, 1, 1,
0.6769001, 0.8861168, 1.358614, 1, 0, 0, 1, 1,
0.6785997, 0.03059183, 3.215621, 1, 0, 0, 1, 1,
0.6817684, -1.37197, 1.969968, 1, 0, 0, 1, 1,
0.6820261, -0.6320166, 3.747824, 1, 0, 0, 1, 1,
0.6842248, -0.7158449, 3.311574, 1, 0, 0, 1, 1,
0.6847891, -0.2848145, 0.9953664, 0, 0, 0, 1, 1,
0.6854055, 0.2094229, 1.617343, 0, 0, 0, 1, 1,
0.6876586, 0.4665247, 2.57255, 0, 0, 0, 1, 1,
0.688224, 0.1562039, 1.50871, 0, 0, 0, 1, 1,
0.6915568, -1.421367, 2.290256, 0, 0, 0, 1, 1,
0.698259, -0.4359089, 0.3304351, 0, 0, 0, 1, 1,
0.6987657, 1.808237, 1.450702, 0, 0, 0, 1, 1,
0.699063, -0.679483, 1.660326, 1, 1, 1, 1, 1,
0.7007733, -1.120704, 4.745141, 1, 1, 1, 1, 1,
0.7019756, 0.3190347, 2.087963, 1, 1, 1, 1, 1,
0.7047747, 0.413716, 1.451506, 1, 1, 1, 1, 1,
0.7057097, -0.2025273, 2.262675, 1, 1, 1, 1, 1,
0.7133111, -0.503396, 2.750533, 1, 1, 1, 1, 1,
0.7157971, 0.1675371, 0.5429142, 1, 1, 1, 1, 1,
0.7183979, 1.506012, 0.6679671, 1, 1, 1, 1, 1,
0.7212586, -1.588117, 1.909724, 1, 1, 1, 1, 1,
0.7240739, 1.7296, 0.8134595, 1, 1, 1, 1, 1,
0.7281435, -0.5968134, 2.496416, 1, 1, 1, 1, 1,
0.7297863, 1.269608, -1.122802, 1, 1, 1, 1, 1,
0.7375169, 0.1879751, 1.053928, 1, 1, 1, 1, 1,
0.7382751, -1.100557, 2.83319, 1, 1, 1, 1, 1,
0.7500296, -0.9652848, 2.219339, 1, 1, 1, 1, 1,
0.759155, -0.6626745, 2.566642, 0, 0, 1, 1, 1,
0.76367, -0.03014396, 2.361148, 1, 0, 0, 1, 1,
0.7706054, -1.308409, 2.586558, 1, 0, 0, 1, 1,
0.7717001, -0.2509806, 1.408336, 1, 0, 0, 1, 1,
0.7767261, -2.387671, 2.958802, 1, 0, 0, 1, 1,
0.7773386, -0.04671424, 2.322839, 1, 0, 0, 1, 1,
0.7775999, -0.877143, 4.162766, 0, 0, 0, 1, 1,
0.7780388, -1.487375, 2.95707, 0, 0, 0, 1, 1,
0.7822526, -1.020196, 3.257108, 0, 0, 0, 1, 1,
0.7846812, -0.380944, 2.118632, 0, 0, 0, 1, 1,
0.788462, 0.3720018, 0.5227821, 0, 0, 0, 1, 1,
0.793096, 0.00461336, 1.662135, 0, 0, 0, 1, 1,
0.7975625, -0.530284, 0.03963753, 0, 0, 0, 1, 1,
0.7984739, 1.286319, 1.778362, 1, 1, 1, 1, 1,
0.8026665, -0.7541473, 2.130408, 1, 1, 1, 1, 1,
0.8035594, -0.04620081, 1.30753, 1, 1, 1, 1, 1,
0.8036805, -0.6348676, 3.205521, 1, 1, 1, 1, 1,
0.8048234, 1.311605, 0.7035276, 1, 1, 1, 1, 1,
0.8079461, -0.08779415, 0.5464541, 1, 1, 1, 1, 1,
0.8083295, 2.860741, -0.6137081, 1, 1, 1, 1, 1,
0.8114742, 1.068045, 1.078034, 1, 1, 1, 1, 1,
0.8134505, 0.6618109, 3.067186, 1, 1, 1, 1, 1,
0.8159709, 0.7022584, 1.10114, 1, 1, 1, 1, 1,
0.8203095, 0.7990992, 0.2237423, 1, 1, 1, 1, 1,
0.8209539, 1.753273, 0.433127, 1, 1, 1, 1, 1,
0.8218588, -0.6473504, 1.659042, 1, 1, 1, 1, 1,
0.8219216, -0.4101571, 1.193913, 1, 1, 1, 1, 1,
0.8293938, -0.008969962, 1.066177, 1, 1, 1, 1, 1,
0.8324735, 0.3839006, 1.204279, 0, 0, 1, 1, 1,
0.8377473, 1.041612, 1.301253, 1, 0, 0, 1, 1,
0.842566, 0.671533, 2.927285, 1, 0, 0, 1, 1,
0.8438653, -1.02844, 3.34659, 1, 0, 0, 1, 1,
0.8442783, 0.7008761, 1.008391, 1, 0, 0, 1, 1,
0.8455188, -0.2817297, 2.964627, 1, 0, 0, 1, 1,
0.8456657, -1.234346, 3.351442, 0, 0, 0, 1, 1,
0.8479012, -0.85217, 1.985121, 0, 0, 0, 1, 1,
0.8541945, -1.175066, 1.360111, 0, 0, 0, 1, 1,
0.8606981, 0.2545382, 1.510072, 0, 0, 0, 1, 1,
0.8709852, 0.884874, -0.4378794, 0, 0, 0, 1, 1,
0.8731893, 0.2819782, 1.479879, 0, 0, 0, 1, 1,
0.881283, 0.009321348, 0.07566395, 0, 0, 0, 1, 1,
0.8860998, 0.6291986, 2.330378, 1, 1, 1, 1, 1,
0.8860999, -1.13283, 2.03824, 1, 1, 1, 1, 1,
0.8880279, -0.1279361, 4.459264, 1, 1, 1, 1, 1,
0.8926019, 1.178871, 0.9291791, 1, 1, 1, 1, 1,
0.9003432, 1.021734, -0.3954509, 1, 1, 1, 1, 1,
0.9011687, -0.4467874, 4.167654, 1, 1, 1, 1, 1,
0.9051646, -0.7297778, 2.823814, 1, 1, 1, 1, 1,
0.9067203, -0.7340894, 1.240177, 1, 1, 1, 1, 1,
0.9068278, -0.1638671, 1.538429, 1, 1, 1, 1, 1,
0.9403316, 0.1922075, 1.570738, 1, 1, 1, 1, 1,
0.9430357, 0.8471223, 2.049689, 1, 1, 1, 1, 1,
0.9570669, -1.133097, 0.937809, 1, 1, 1, 1, 1,
0.9578109, 1.76941, 0.5768232, 1, 1, 1, 1, 1,
0.9611735, 0.6626784, 1.793979, 1, 1, 1, 1, 1,
0.9614111, -0.1569633, 2.181062, 1, 1, 1, 1, 1,
0.9719839, 0.2285461, 1.88803, 0, 0, 1, 1, 1,
0.9814856, 0.8847439, 1.306037, 1, 0, 0, 1, 1,
0.9816387, -0.8242626, 1.264783, 1, 0, 0, 1, 1,
0.9848436, 1.152372, -0.08158642, 1, 0, 0, 1, 1,
0.9894983, 1.215953, 0.11838, 1, 0, 0, 1, 1,
0.9923565, -0.5475574, 2.148009, 1, 0, 0, 1, 1,
0.9925013, -0.1505954, 1.898329, 0, 0, 0, 1, 1,
0.9958973, -0.9946837, 1.047395, 0, 0, 0, 1, 1,
0.9970376, -0.1583031, 1.681845, 0, 0, 0, 1, 1,
0.9985985, -0.7538274, 2.602506, 0, 0, 0, 1, 1,
1.002699, -0.4091298, 3.209669, 0, 0, 0, 1, 1,
1.006225, 0.01951125, 1.491437, 0, 0, 0, 1, 1,
1.010162, 1.215824, 1.064444, 0, 0, 0, 1, 1,
1.015641, 0.2076664, 1.020992, 1, 1, 1, 1, 1,
1.01623, 0.9563994, -1.188567, 1, 1, 1, 1, 1,
1.022751, -0.1995206, 2.762249, 1, 1, 1, 1, 1,
1.024407, 1.0394, 1.533079, 1, 1, 1, 1, 1,
1.03009, 1.548463, -0.2408977, 1, 1, 1, 1, 1,
1.032614, -0.05917337, 1.986185, 1, 1, 1, 1, 1,
1.035775, 1.45229, 2.949708, 1, 1, 1, 1, 1,
1.070104, -1.10938, 3.18697, 1, 1, 1, 1, 1,
1.081005, 0.924342, -0.6551354, 1, 1, 1, 1, 1,
1.081745, 0.3648854, 2.034336, 1, 1, 1, 1, 1,
1.087263, -0.5449869, 0.07443064, 1, 1, 1, 1, 1,
1.087339, 0.2258474, 3.361206, 1, 1, 1, 1, 1,
1.098428, -0.04220619, 3.925531, 1, 1, 1, 1, 1,
1.098457, -1.259986, 2.282938, 1, 1, 1, 1, 1,
1.099468, 0.4063972, 3.234601, 1, 1, 1, 1, 1,
1.108146, -0.5076614, 2.688324, 0, 0, 1, 1, 1,
1.109263, -0.7570632, 2.515925, 1, 0, 0, 1, 1,
1.109421, -0.3637931, 3.114798, 1, 0, 0, 1, 1,
1.117923, -1.463848, 3.247493, 1, 0, 0, 1, 1,
1.118627, -1.270423, 3.54364, 1, 0, 0, 1, 1,
1.12036, -0.8195941, 0.1959964, 1, 0, 0, 1, 1,
1.120426, 0.00531808, -0.4068379, 0, 0, 0, 1, 1,
1.123847, 1.876779, -0.6751474, 0, 0, 0, 1, 1,
1.132552, -0.7266427, 2.410573, 0, 0, 0, 1, 1,
1.13605, -1.622271, 2.746106, 0, 0, 0, 1, 1,
1.136447, 0.0859867, 1.810628, 0, 0, 0, 1, 1,
1.146251, -1.782183, 0.8509818, 0, 0, 0, 1, 1,
1.147347, -0.4552647, 1.565603, 0, 0, 0, 1, 1,
1.148435, -2.123379, 3.639536, 1, 1, 1, 1, 1,
1.148661, -2.00259, 1.703329, 1, 1, 1, 1, 1,
1.150149, -0.9652433, 2.769121, 1, 1, 1, 1, 1,
1.151752, 0.3117858, 1.801532, 1, 1, 1, 1, 1,
1.16814, 1.17054, 0.3403163, 1, 1, 1, 1, 1,
1.171605, -0.9560962, 3.189582, 1, 1, 1, 1, 1,
1.17299, -1.451081, 3.111426, 1, 1, 1, 1, 1,
1.177902, 1.144501, 1.146365, 1, 1, 1, 1, 1,
1.204128, 1.041938, 1.75496, 1, 1, 1, 1, 1,
1.219035, -0.06072423, 0.9363214, 1, 1, 1, 1, 1,
1.219431, -0.1376507, 2.895472, 1, 1, 1, 1, 1,
1.236317, -0.02714834, 0.3702822, 1, 1, 1, 1, 1,
1.240584, 0.2312579, 3.744754, 1, 1, 1, 1, 1,
1.243707, -0.5784363, 1.760234, 1, 1, 1, 1, 1,
1.244389, -0.7348367, 2.457098, 1, 1, 1, 1, 1,
1.245318, 0.2132449, 1.592706, 0, 0, 1, 1, 1,
1.247573, -1.617708, 0.9191567, 1, 0, 0, 1, 1,
1.254595, 2.423901, -1.339174, 1, 0, 0, 1, 1,
1.259213, -0.3897974, 1.124323, 1, 0, 0, 1, 1,
1.274901, -1.287482, 2.896566, 1, 0, 0, 1, 1,
1.277511, -0.5887884, 3.36579, 1, 0, 0, 1, 1,
1.279616, 0.5639244, 2.353111, 0, 0, 0, 1, 1,
1.281269, -0.6112378, 1.005569, 0, 0, 0, 1, 1,
1.289289, 0.5264869, 1.054644, 0, 0, 0, 1, 1,
1.301624, -1.039565, 1.766974, 0, 0, 0, 1, 1,
1.307455, -1.325681, 4.255995, 0, 0, 0, 1, 1,
1.311813, 1.077807, 3.035183, 0, 0, 0, 1, 1,
1.322252, 0.04998367, 0.7340729, 0, 0, 0, 1, 1,
1.323137, 0.6738266, 0.9696034, 1, 1, 1, 1, 1,
1.323431, 0.6598053, 1.852726, 1, 1, 1, 1, 1,
1.329126, -0.5056576, 3.051565, 1, 1, 1, 1, 1,
1.334213, 0.1938481, 0.7688385, 1, 1, 1, 1, 1,
1.345272, 1.31036, 1.347038, 1, 1, 1, 1, 1,
1.347633, -1.639127, 2.244002, 1, 1, 1, 1, 1,
1.353695, -1.491693, 2.518381, 1, 1, 1, 1, 1,
1.353814, 0.4794108, 1.177416, 1, 1, 1, 1, 1,
1.354352, 0.5464224, -0.2263774, 1, 1, 1, 1, 1,
1.36437, -0.09008294, 2.063769, 1, 1, 1, 1, 1,
1.367553, 0.8625492, 1.714906, 1, 1, 1, 1, 1,
1.372399, 0.01899087, 2.04864, 1, 1, 1, 1, 1,
1.376107, -1.69544, 3.063803, 1, 1, 1, 1, 1,
1.383608, 0.9567826, 2.320581, 1, 1, 1, 1, 1,
1.397271, 0.6748394, 0.6679507, 1, 1, 1, 1, 1,
1.421746, 0.3575139, 2.567923, 0, 0, 1, 1, 1,
1.422171, -1.320006, 2.020397, 1, 0, 0, 1, 1,
1.437741, -0.8345351, 0.533528, 1, 0, 0, 1, 1,
1.448442, -0.1177515, 0.7083947, 1, 0, 0, 1, 1,
1.449822, -0.1773367, 2.967868, 1, 0, 0, 1, 1,
1.451633, -0.008693771, 2.077848, 1, 0, 0, 1, 1,
1.453676, 1.335402, 1.017938, 0, 0, 0, 1, 1,
1.454294, 0.2247209, 0.9465693, 0, 0, 0, 1, 1,
1.456581, 1.439674, -0.8463928, 0, 0, 0, 1, 1,
1.469352, -1.152086, 3.917149, 0, 0, 0, 1, 1,
1.470334, 0.6873239, 1.271622, 0, 0, 0, 1, 1,
1.49012, 1.960834, 0.4853533, 0, 0, 0, 1, 1,
1.51151, -2.221563, 1.951715, 0, 0, 0, 1, 1,
1.51617, 0.5837784, 2.378077, 1, 1, 1, 1, 1,
1.545211, 0.1649794, 2.983968, 1, 1, 1, 1, 1,
1.545312, 0.6116295, 2.235398, 1, 1, 1, 1, 1,
1.545569, 0.1492781, 2.461842, 1, 1, 1, 1, 1,
1.552819, 1.043121, 0.2970367, 1, 1, 1, 1, 1,
1.559827, 0.06223654, 1.230582, 1, 1, 1, 1, 1,
1.585209, -1.186952, 0.7474841, 1, 1, 1, 1, 1,
1.592855, 1.08718, 1.173467, 1, 1, 1, 1, 1,
1.593259, -0.8095691, 3.095463, 1, 1, 1, 1, 1,
1.595861, 0.4746841, 0.7685453, 1, 1, 1, 1, 1,
1.598897, 0.1972753, -0.2232838, 1, 1, 1, 1, 1,
1.601798, 0.3220634, 1.593605, 1, 1, 1, 1, 1,
1.620094, 2.860567, -0.3770456, 1, 1, 1, 1, 1,
1.629405, 0.7842428, 1.138314, 1, 1, 1, 1, 1,
1.638038, 0.2790755, 1.42043, 1, 1, 1, 1, 1,
1.6496, -0.05355923, 2.192867, 0, 0, 1, 1, 1,
1.660269, 0.206321, 1.658022, 1, 0, 0, 1, 1,
1.677166, 0.9059631, -0.3508658, 1, 0, 0, 1, 1,
1.689105, 0.3304406, 2.162743, 1, 0, 0, 1, 1,
1.695476, -0.3332488, 0.6998838, 1, 0, 0, 1, 1,
1.698839, 1.302143, 0.6455583, 1, 0, 0, 1, 1,
1.705375, 1.354006, 2.085698, 0, 0, 0, 1, 1,
1.708701, 0.1758338, 2.279084, 0, 0, 0, 1, 1,
1.727434, 2.533198, 1.433825, 0, 0, 0, 1, 1,
1.740603, -2.359463, 2.873336, 0, 0, 0, 1, 1,
1.743784, 0.2541394, 0.366219, 0, 0, 0, 1, 1,
1.764237, -1.224972, 1.410847, 0, 0, 0, 1, 1,
1.778139, 0.563589, 0.9702954, 0, 0, 0, 1, 1,
1.790713, 0.731809, 0.6595601, 1, 1, 1, 1, 1,
1.79872, -0.8093734, 1.057078, 1, 1, 1, 1, 1,
1.800958, 1.230786, 0.2515728, 1, 1, 1, 1, 1,
1.806726, 0.2253999, 2.393543, 1, 1, 1, 1, 1,
1.846954, 2.371623, 1.338498, 1, 1, 1, 1, 1,
1.860677, -1.443528, 1.9736, 1, 1, 1, 1, 1,
1.896673, 0.7579198, 1.877124, 1, 1, 1, 1, 1,
1.9135, 0.8935254, 2.063502, 1, 1, 1, 1, 1,
1.937228, 1.069086, 0.1616092, 1, 1, 1, 1, 1,
1.939091, -2.026877, 3.046631, 1, 1, 1, 1, 1,
1.974062, 0.6374369, 3.551311, 1, 1, 1, 1, 1,
1.979225, -1.281747, 2.918379, 1, 1, 1, 1, 1,
1.981513, 0.4849183, 1.34411, 1, 1, 1, 1, 1,
2.008102, 0.7086065, 0.2584054, 1, 1, 1, 1, 1,
2.027987, -1.114646, 2.880138, 1, 1, 1, 1, 1,
2.032063, -0.7625827, 1.686495, 0, 0, 1, 1, 1,
2.038185, 0.1053143, 0.7655209, 1, 0, 0, 1, 1,
2.065886, -0.7666953, 1.467575, 1, 0, 0, 1, 1,
2.091325, -0.1751195, 1.360755, 1, 0, 0, 1, 1,
2.12977, -0.3837216, 1.189304, 1, 0, 0, 1, 1,
2.244246, 0.9606433, 0.7676298, 1, 0, 0, 1, 1,
2.249737, -0.546547, 2.655727, 0, 0, 0, 1, 1,
2.266227, 2.681648, 2.06398, 0, 0, 0, 1, 1,
2.294984, -0.1335458, 0.7049248, 0, 0, 0, 1, 1,
2.329125, 0.4830006, 1.254183, 0, 0, 0, 1, 1,
2.369147, -1.228002, 2.489964, 0, 0, 0, 1, 1,
2.384856, -0.7259254, 2.311181, 0, 0, 0, 1, 1,
2.392398, 0.0534384, 0.2198032, 0, 0, 0, 1, 1,
2.416197, 0.7753393, 0.8682017, 1, 1, 1, 1, 1,
2.431389, -0.3006395, 4.572091, 1, 1, 1, 1, 1,
2.501711, 0.8358608, 1.489393, 1, 1, 1, 1, 1,
2.623755, 0.6166182, 2.499077, 1, 1, 1, 1, 1,
2.646064, -0.9639665, 4.035626, 1, 1, 1, 1, 1,
2.882165, -1.109079, 1.405713, 1, 1, 1, 1, 1,
3.207182, -0.2353826, 1.839815, 1, 1, 1, 1, 1
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
var radius = 9.715885;
var distance = 34.12663;
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
mvMatrix.translate( 0.2483079, 0.2166879, 0.1971378 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.12663);
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