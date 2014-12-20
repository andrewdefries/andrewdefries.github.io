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
-2.972858, -0.8109289, -0.7992237, 1, 0, 0, 1,
-2.835951, -1.067097, -2.265063, 1, 0.007843138, 0, 1,
-2.798568, -0.652623, -0.698736, 1, 0.01176471, 0, 1,
-2.715652, 0.3005655, -0.9076996, 1, 0.01960784, 0, 1,
-2.512146, 1.23901, -3.5777, 1, 0.02352941, 0, 1,
-2.435446, 0.05489566, -2.78105, 1, 0.03137255, 0, 1,
-2.401901, -1.098883, -2.223794, 1, 0.03529412, 0, 1,
-2.375854, 1.577634, -2.197214, 1, 0.04313726, 0, 1,
-2.356668, -0.267588, -1.297862, 1, 0.04705882, 0, 1,
-2.303038, -0.6412787, -1.359219, 1, 0.05490196, 0, 1,
-2.218635, -0.242692, -2.228545, 1, 0.05882353, 0, 1,
-2.121215, 0.5891033, -0.08155764, 1, 0.06666667, 0, 1,
-2.052723, -0.3418668, -0.3895412, 1, 0.07058824, 0, 1,
-2.020402, 0.2119772, -1.05591, 1, 0.07843138, 0, 1,
-1.982745, 0.6119328, -1.622895, 1, 0.08235294, 0, 1,
-1.975424, -0.3287141, -3.472617, 1, 0.09019608, 0, 1,
-1.961409, 0.432632, -0.8477152, 1, 0.09411765, 0, 1,
-1.935626, 0.0907678, -1.492914, 1, 0.1019608, 0, 1,
-1.926439, 0.7038522, -2.883045, 1, 0.1098039, 0, 1,
-1.925576, 0.139571, -1.913211, 1, 0.1137255, 0, 1,
-1.918644, -0.7760718, -1.889311, 1, 0.1215686, 0, 1,
-1.916249, -0.02561884, -2.884133, 1, 0.1254902, 0, 1,
-1.91518, 1.744869, -1.48753, 1, 0.1333333, 0, 1,
-1.905756, 0.8477014, -0.8862182, 1, 0.1372549, 0, 1,
-1.879612, -1.081343, -2.186535, 1, 0.145098, 0, 1,
-1.854872, 2.51421, 0.3178347, 1, 0.1490196, 0, 1,
-1.848073, -1.640314, -3.152864, 1, 0.1568628, 0, 1,
-1.790732, -1.606458, -2.26803, 1, 0.1607843, 0, 1,
-1.778625, -0.1707715, -1.084805, 1, 0.1686275, 0, 1,
-1.773464, -1.296047, -2.347375, 1, 0.172549, 0, 1,
-1.761281, 0.2665005, -0.6467555, 1, 0.1803922, 0, 1,
-1.758011, 1.276659, 0.4971859, 1, 0.1843137, 0, 1,
-1.750716, 0.530209, -0.4956338, 1, 0.1921569, 0, 1,
-1.747653, 2.264004, -1.40673, 1, 0.1960784, 0, 1,
-1.737286, 1.089617, 0.1777896, 1, 0.2039216, 0, 1,
-1.732838, -0.924502, -3.73465, 1, 0.2117647, 0, 1,
-1.722575, -0.1598903, -1.958397, 1, 0.2156863, 0, 1,
-1.721376, -0.5757688, -2.245507, 1, 0.2235294, 0, 1,
-1.716679, 0.2632778, -1.907856, 1, 0.227451, 0, 1,
-1.706049, -1.134882, -3.446703, 1, 0.2352941, 0, 1,
-1.693087, 1.886736, 0.8296727, 1, 0.2392157, 0, 1,
-1.684884, 0.4519315, -2.365801, 1, 0.2470588, 0, 1,
-1.667256, 0.3301961, -0.757742, 1, 0.2509804, 0, 1,
-1.661193, 0.6362961, -3.639156, 1, 0.2588235, 0, 1,
-1.654305, -3.507742, -3.31784, 1, 0.2627451, 0, 1,
-1.624283, -1.195193, -1.754185, 1, 0.2705882, 0, 1,
-1.615859, 0.9040657, -1.968742, 1, 0.2745098, 0, 1,
-1.593954, -1.13981, -1.962522, 1, 0.282353, 0, 1,
-1.591817, -1.950352, -1.161595, 1, 0.2862745, 0, 1,
-1.588574, 0.7186989, 0.5398496, 1, 0.2941177, 0, 1,
-1.587638, -1.365525, -4.122395, 1, 0.3019608, 0, 1,
-1.5649, 0.3457041, -2.621846, 1, 0.3058824, 0, 1,
-1.557344, 0.03586749, -1.178411, 1, 0.3137255, 0, 1,
-1.548674, 1.308871, -0.2239936, 1, 0.3176471, 0, 1,
-1.547345, -0.6013617, -4.507698, 1, 0.3254902, 0, 1,
-1.539262, 0.2779789, -2.000017, 1, 0.3294118, 0, 1,
-1.53902, 0.5707746, -1.48539, 1, 0.3372549, 0, 1,
-1.535211, -0.06199881, 0.0755391, 1, 0.3411765, 0, 1,
-1.533067, -0.6441745, -0.6136591, 1, 0.3490196, 0, 1,
-1.522049, 0.7474537, -0.5348336, 1, 0.3529412, 0, 1,
-1.521096, -0.2578635, -0.8782855, 1, 0.3607843, 0, 1,
-1.514944, -0.4088186, -0.6902641, 1, 0.3647059, 0, 1,
-1.505545, 0.08038884, 0.03614041, 1, 0.372549, 0, 1,
-1.501714, -0.1647515, -0.9014578, 1, 0.3764706, 0, 1,
-1.493475, 0.6307302, -0.3615512, 1, 0.3843137, 0, 1,
-1.476867, 0.2681097, -0.3504758, 1, 0.3882353, 0, 1,
-1.476138, -0.526503, -1.321278, 1, 0.3960784, 0, 1,
-1.473497, 1.132116, -0.117111, 1, 0.4039216, 0, 1,
-1.467353, 0.3444457, -0.914535, 1, 0.4078431, 0, 1,
-1.46612, 2.761731, 0.7376788, 1, 0.4156863, 0, 1,
-1.462071, -1.350827, -2.252344, 1, 0.4196078, 0, 1,
-1.455273, 0.6961828, -2.259361, 1, 0.427451, 0, 1,
-1.440151, 1.045195, 0.4044295, 1, 0.4313726, 0, 1,
-1.436807, -1.089738, -1.731342, 1, 0.4392157, 0, 1,
-1.427294, -0.2543037, -1.396711, 1, 0.4431373, 0, 1,
-1.419383, -1.063538, -1.341885, 1, 0.4509804, 0, 1,
-1.399664, 1.370802, 0.820898, 1, 0.454902, 0, 1,
-1.392084, -1.899628, -2.344283, 1, 0.4627451, 0, 1,
-1.388802, -0.5662958, -0.6724243, 1, 0.4666667, 0, 1,
-1.356314, 0.148646, -2.487747, 1, 0.4745098, 0, 1,
-1.354277, -1.478151, -2.0943, 1, 0.4784314, 0, 1,
-1.353587, 1.616306, -0.4472163, 1, 0.4862745, 0, 1,
-1.352151, 1.152273, -1.439768, 1, 0.4901961, 0, 1,
-1.352105, 0.5783993, -1.426462, 1, 0.4980392, 0, 1,
-1.347163, 0.01984839, -0.556173, 1, 0.5058824, 0, 1,
-1.345552, 0.08938943, -1.177474, 1, 0.509804, 0, 1,
-1.342528, 1.745216, -0.7697831, 1, 0.5176471, 0, 1,
-1.339517, 1.818284, -0.9775958, 1, 0.5215687, 0, 1,
-1.337638, -0.5558164, -1.020985, 1, 0.5294118, 0, 1,
-1.31671, 0.2479981, -2.574145, 1, 0.5333334, 0, 1,
-1.307111, 0.9632704, -1.327049, 1, 0.5411765, 0, 1,
-1.305948, -0.1819536, 0.8379095, 1, 0.5450981, 0, 1,
-1.288883, -0.5212405, -1.810853, 1, 0.5529412, 0, 1,
-1.286098, 1.691347, -0.5755122, 1, 0.5568628, 0, 1,
-1.285233, -0.2847309, -1.916503, 1, 0.5647059, 0, 1,
-1.284884, -0.04016688, -0.6841364, 1, 0.5686275, 0, 1,
-1.28006, -1.99606, -3.197899, 1, 0.5764706, 0, 1,
-1.279702, 1.197034, -1.161469, 1, 0.5803922, 0, 1,
-1.279313, -1.160676, -3.200106, 1, 0.5882353, 0, 1,
-1.275642, -0.4057818, -0.4249623, 1, 0.5921569, 0, 1,
-1.270007, -0.6536843, -2.187016, 1, 0.6, 0, 1,
-1.26632, 1.412683, -1.577771, 1, 0.6078432, 0, 1,
-1.265996, -0.6473963, 0.4531047, 1, 0.6117647, 0, 1,
-1.26308, -0.5154783, -0.8428478, 1, 0.6196079, 0, 1,
-1.251295, 1.418333, -0.4971603, 1, 0.6235294, 0, 1,
-1.247646, 0.9696172, -0.5187146, 1, 0.6313726, 0, 1,
-1.246317, 0.7282198, -1.621932, 1, 0.6352941, 0, 1,
-1.241421, -0.3057792, -1.917453, 1, 0.6431373, 0, 1,
-1.239291, -1.883263, -1.891368, 1, 0.6470588, 0, 1,
-1.23751, 0.4659117, -1.292502, 1, 0.654902, 0, 1,
-1.234386, 0.001089841, -1.655432, 1, 0.6588235, 0, 1,
-1.232203, 0.1422101, -1.521181, 1, 0.6666667, 0, 1,
-1.225946, -0.4515798, -1.406318, 1, 0.6705883, 0, 1,
-1.20629, -0.9966587, -0.8477562, 1, 0.6784314, 0, 1,
-1.205052, -0.2595106, -3.036048, 1, 0.682353, 0, 1,
-1.195911, 0.5242781, -0.844184, 1, 0.6901961, 0, 1,
-1.189103, -1.024863, 0.08382144, 1, 0.6941177, 0, 1,
-1.182477, 0.7175836, -1.199303, 1, 0.7019608, 0, 1,
-1.172749, 0.1216118, -2.427301, 1, 0.7098039, 0, 1,
-1.170608, 0.05302683, -2.335403, 1, 0.7137255, 0, 1,
-1.165997, 0.1499511, -1.680049, 1, 0.7215686, 0, 1,
-1.162745, 1.670971, -1.38552, 1, 0.7254902, 0, 1,
-1.16167, -0.8447849, -3.624807, 1, 0.7333333, 0, 1,
-1.158205, -0.6706182, -1.086544, 1, 0.7372549, 0, 1,
-1.153741, -0.1736924, -0.9162489, 1, 0.7450981, 0, 1,
-1.149851, -0.6003329, -2.10551, 1, 0.7490196, 0, 1,
-1.147346, 0.1506967, -2.181546, 1, 0.7568628, 0, 1,
-1.142404, -0.7429211, -2.562563, 1, 0.7607843, 0, 1,
-1.140046, -0.02494132, -1.390919, 1, 0.7686275, 0, 1,
-1.139699, -0.02105684, -1.229235, 1, 0.772549, 0, 1,
-1.139364, -0.2082884, -2.750217, 1, 0.7803922, 0, 1,
-1.138075, -1.166826, -1.769933, 1, 0.7843137, 0, 1,
-1.136361, -1.656979, -1.762066, 1, 0.7921569, 0, 1,
-1.131874, -1.532147, -2.897203, 1, 0.7960784, 0, 1,
-1.125994, 0.2302018, -3.497076, 1, 0.8039216, 0, 1,
-1.124915, -0.9774002, -2.608616, 1, 0.8117647, 0, 1,
-1.123436, 0.0784766, -2.4087, 1, 0.8156863, 0, 1,
-1.117704, -0.4931068, -0.9341858, 1, 0.8235294, 0, 1,
-1.112956, 0.3582633, -1.99824, 1, 0.827451, 0, 1,
-1.112656, -1.055825, -3.019716, 1, 0.8352941, 0, 1,
-1.107871, 2.655664, -0.8447452, 1, 0.8392157, 0, 1,
-1.104166, 0.005062507, -3.419132, 1, 0.8470588, 0, 1,
-1.093561, -0.02994201, -3.179961, 1, 0.8509804, 0, 1,
-1.087611, -1.102752, -1.487272, 1, 0.8588235, 0, 1,
-1.083645, -1.468471, -1.874088, 1, 0.8627451, 0, 1,
-1.083208, 0.7540237, -0.6251574, 1, 0.8705882, 0, 1,
-1.08202, -1.007504, -1.073317, 1, 0.8745098, 0, 1,
-1.081779, 0.234472, -0.3511076, 1, 0.8823529, 0, 1,
-1.081121, 1.060463, -0.02150389, 1, 0.8862745, 0, 1,
-1.078297, -2.158013, -2.886724, 1, 0.8941177, 0, 1,
-1.075726, -0.8229682, -1.863159, 1, 0.8980392, 0, 1,
-1.074433, 1.034728, -1.122298, 1, 0.9058824, 0, 1,
-1.067954, -0.7214716, -2.745097, 1, 0.9137255, 0, 1,
-1.067897, -0.3841049, -2.095479, 1, 0.9176471, 0, 1,
-1.064739, 0.1186558, -2.565389, 1, 0.9254902, 0, 1,
-1.061545, -0.568714, -2.789003, 1, 0.9294118, 0, 1,
-1.061442, 0.4269416, 1.161771, 1, 0.9372549, 0, 1,
-1.056464, 3.040802, 0.3112164, 1, 0.9411765, 0, 1,
-1.043582, -0.6672279, -2.025196, 1, 0.9490196, 0, 1,
-1.042357, -1.430076, -2.053793, 1, 0.9529412, 0, 1,
-1.040728, -0.5935273, -2.15088, 1, 0.9607843, 0, 1,
-1.036594, -0.3652923, -1.340254, 1, 0.9647059, 0, 1,
-1.033994, 0.8145812, 0.3376501, 1, 0.972549, 0, 1,
-1.031511, 0.01944925, -2.179467, 1, 0.9764706, 0, 1,
-1.030664, 1.610275, -0.5057593, 1, 0.9843137, 0, 1,
-1.030355, -1.416863, -0.332702, 1, 0.9882353, 0, 1,
-1.028374, -0.03723114, -0.2195277, 1, 0.9960784, 0, 1,
-1.026003, -1.357408, -3.70119, 0.9960784, 1, 0, 1,
-1.022507, 0.8770056, -0.6878642, 0.9921569, 1, 0, 1,
-1.020066, -1.355982, -1.933547, 0.9843137, 1, 0, 1,
-1.019672, -0.5861253, -3.425972, 0.9803922, 1, 0, 1,
-1.019162, 2.088077, -0.8134227, 0.972549, 1, 0, 1,
-1.010169, -0.5773255, -0.5097489, 0.9686275, 1, 0, 1,
-1.008247, 0.8365465, -1.387303, 0.9607843, 1, 0, 1,
-1.00298, -0.6788277, 0.5637, 0.9568627, 1, 0, 1,
-1.001401, -1.834563, -2.852512, 0.9490196, 1, 0, 1,
-0.9911146, 0.4744638, -3.04029, 0.945098, 1, 0, 1,
-0.9901762, 0.03060593, -0.009269973, 0.9372549, 1, 0, 1,
-0.9830003, -0.6049355, -3.656428, 0.9333333, 1, 0, 1,
-0.973479, 1.400709, -1.041352, 0.9254902, 1, 0, 1,
-0.9691724, -0.9488196, -2.479195, 0.9215686, 1, 0, 1,
-0.9673726, -0.6020579, -3.138484, 0.9137255, 1, 0, 1,
-0.9620237, 0.3776249, -1.173879, 0.9098039, 1, 0, 1,
-0.9590457, 1.413213, -0.675487, 0.9019608, 1, 0, 1,
-0.9529648, -1.487438, -3.370584, 0.8941177, 1, 0, 1,
-0.9486825, -0.9568272, -1.744088, 0.8901961, 1, 0, 1,
-0.9477109, 1.094596, 0.2019192, 0.8823529, 1, 0, 1,
-0.9408432, -0.6372164, -2.195757, 0.8784314, 1, 0, 1,
-0.9391679, -0.1947404, -0.1106009, 0.8705882, 1, 0, 1,
-0.9333748, -0.3042874, -2.495245, 0.8666667, 1, 0, 1,
-0.9290382, -2.896864, -3.654114, 0.8588235, 1, 0, 1,
-0.9238319, -1.46847, -3.235444, 0.854902, 1, 0, 1,
-0.9218774, 0.774795, -1.260762, 0.8470588, 1, 0, 1,
-0.9182231, -1.270979, -2.680557, 0.8431373, 1, 0, 1,
-0.9158667, 2.257582, -2.436168, 0.8352941, 1, 0, 1,
-0.9146731, 0.5662236, -1.157292, 0.8313726, 1, 0, 1,
-0.9144979, 0.7353752, -1.568155, 0.8235294, 1, 0, 1,
-0.9141442, 1.444422, 0.365292, 0.8196079, 1, 0, 1,
-0.9134758, -0.04476265, -2.919939, 0.8117647, 1, 0, 1,
-0.9088821, -0.2219827, -2.062892, 0.8078431, 1, 0, 1,
-0.9029012, -0.9009116, -3.345745, 0.8, 1, 0, 1,
-0.8964661, 0.4029633, -1.404766, 0.7921569, 1, 0, 1,
-0.8949697, 0.3675365, -1.464759, 0.7882353, 1, 0, 1,
-0.8921535, 1.795631, -1.182944, 0.7803922, 1, 0, 1,
-0.8910186, 0.5776038, -0.9255881, 0.7764706, 1, 0, 1,
-0.8900632, -0.11056, -1.211621, 0.7686275, 1, 0, 1,
-0.8814377, -1.169181, -2.619576, 0.7647059, 1, 0, 1,
-0.8804388, -0.7091861, -2.827805, 0.7568628, 1, 0, 1,
-0.8799004, -1.875213, -3.036717, 0.7529412, 1, 0, 1,
-0.871065, 0.6275249, 0.2250336, 0.7450981, 1, 0, 1,
-0.8661311, -0.2464125, -2.419814, 0.7411765, 1, 0, 1,
-0.8575746, -0.8782176, -2.195076, 0.7333333, 1, 0, 1,
-0.8486035, 0.6673645, -0.6157698, 0.7294118, 1, 0, 1,
-0.8468414, -1.369263, -1.976757, 0.7215686, 1, 0, 1,
-0.8421217, -0.3916823, -3.61979, 0.7176471, 1, 0, 1,
-0.8408492, -0.4789656, -2.254237, 0.7098039, 1, 0, 1,
-0.8327706, 2.302394, -1.266749, 0.7058824, 1, 0, 1,
-0.8327308, 1.812303, 0.131069, 0.6980392, 1, 0, 1,
-0.8258648, -1.868302, -3.375955, 0.6901961, 1, 0, 1,
-0.8236787, -0.787881, -3.475122, 0.6862745, 1, 0, 1,
-0.8228654, -1.176239, -2.864925, 0.6784314, 1, 0, 1,
-0.8224887, 0.3856196, -1.354328, 0.6745098, 1, 0, 1,
-0.8177664, -1.421213, -2.785593, 0.6666667, 1, 0, 1,
-0.8141717, -1.406512, -2.418913, 0.6627451, 1, 0, 1,
-0.8113258, 0.8035663, -0.7660075, 0.654902, 1, 0, 1,
-0.8093717, -0.4898566, -2.954139, 0.6509804, 1, 0, 1,
-0.8087577, 0.7730838, -1.915171, 0.6431373, 1, 0, 1,
-0.8040333, 0.7109274, -0.7316262, 0.6392157, 1, 0, 1,
-0.7903426, 0.5599885, 1.302689, 0.6313726, 1, 0, 1,
-0.7877163, -1.796793, -2.439559, 0.627451, 1, 0, 1,
-0.7825009, -0.8223366, -1.273704, 0.6196079, 1, 0, 1,
-0.7816117, 1.42502, -0.1826712, 0.6156863, 1, 0, 1,
-0.7815199, -2.372714, -4.025225, 0.6078432, 1, 0, 1,
-0.7758796, -0.1160396, -2.178412, 0.6039216, 1, 0, 1,
-0.7714869, -0.6691636, -1.463079, 0.5960785, 1, 0, 1,
-0.7642651, -0.350716, -1.890718, 0.5882353, 1, 0, 1,
-0.7625957, 0.1274417, -1.980921, 0.5843138, 1, 0, 1,
-0.7625098, -0.4394044, -3.839642, 0.5764706, 1, 0, 1,
-0.7615545, -1.151791, -2.642584, 0.572549, 1, 0, 1,
-0.7614256, 1.659324, 0.05363093, 0.5647059, 1, 0, 1,
-0.7545624, -0.09192776, -2.597482, 0.5607843, 1, 0, 1,
-0.7515152, -0.5932972, -3.762663, 0.5529412, 1, 0, 1,
-0.7473498, 1.945989, -0.9598155, 0.5490196, 1, 0, 1,
-0.7453728, -2.894416, -2.229465, 0.5411765, 1, 0, 1,
-0.7443723, -0.4356341, -1.344378, 0.5372549, 1, 0, 1,
-0.7425718, 0.4099422, -1.472427, 0.5294118, 1, 0, 1,
-0.7329539, -2.939256, -2.70353, 0.5254902, 1, 0, 1,
-0.7317046, 1.141687, -0.7944627, 0.5176471, 1, 0, 1,
-0.7264353, 0.7749127, -0.7850281, 0.5137255, 1, 0, 1,
-0.7188446, -1.155916, -1.716802, 0.5058824, 1, 0, 1,
-0.7152867, 0.7982147, -1.631729, 0.5019608, 1, 0, 1,
-0.7051411, 0.1148996, -0.3170103, 0.4941176, 1, 0, 1,
-0.7011371, 0.1615995, -2.393305, 0.4862745, 1, 0, 1,
-0.7003484, 1.786992, -0.7445632, 0.4823529, 1, 0, 1,
-0.6998914, 0.275175, 1.444111, 0.4745098, 1, 0, 1,
-0.6960184, 0.1514662, -2.421569, 0.4705882, 1, 0, 1,
-0.69204, -0.4826545, -1.497837, 0.4627451, 1, 0, 1,
-0.6906797, 0.1601019, -1.965652, 0.4588235, 1, 0, 1,
-0.6874357, -0.966274, -3.68508, 0.4509804, 1, 0, 1,
-0.6821486, 0.91812, -0.7209916, 0.4470588, 1, 0, 1,
-0.676358, 2.197075, -0.01275922, 0.4392157, 1, 0, 1,
-0.6751764, 0.3524964, -1.428352, 0.4352941, 1, 0, 1,
-0.6734441, 1.831132, -1.63722, 0.427451, 1, 0, 1,
-0.6688361, -1.317697, -3.14997, 0.4235294, 1, 0, 1,
-0.6614658, -1.798696, -2.495636, 0.4156863, 1, 0, 1,
-0.6595285, 1.768605, 0.06965761, 0.4117647, 1, 0, 1,
-0.6552334, 1.685232, -0.06408437, 0.4039216, 1, 0, 1,
-0.6483877, -0.05648437, -2.181653, 0.3960784, 1, 0, 1,
-0.6405713, 0.07821518, -1.941744, 0.3921569, 1, 0, 1,
-0.6394614, -0.3370743, -2.218284, 0.3843137, 1, 0, 1,
-0.6372492, -1.272883, -2.889193, 0.3803922, 1, 0, 1,
-0.635044, -0.02927161, -2.101016, 0.372549, 1, 0, 1,
-0.625964, 2.046304, -0.9416995, 0.3686275, 1, 0, 1,
-0.6241969, 1.073627, 1.259677, 0.3607843, 1, 0, 1,
-0.6126964, -1.232449, -3.528522, 0.3568628, 1, 0, 1,
-0.6125927, -0.9635249, -2.230875, 0.3490196, 1, 0, 1,
-0.6119366, -0.8609994, -2.042593, 0.345098, 1, 0, 1,
-0.6118934, 1.196349, 0.1727648, 0.3372549, 1, 0, 1,
-0.6094586, 0.3381255, -0.5003344, 0.3333333, 1, 0, 1,
-0.6046261, -0.2781788, -1.96879, 0.3254902, 1, 0, 1,
-0.6041471, 1.32239, -0.7315483, 0.3215686, 1, 0, 1,
-0.6039153, 1.085181, 0.4835413, 0.3137255, 1, 0, 1,
-0.6018199, -1.047685, -2.98064, 0.3098039, 1, 0, 1,
-0.5977467, -0.1553914, -2.372521, 0.3019608, 1, 0, 1,
-0.5959213, 1.249302, 0.8312175, 0.2941177, 1, 0, 1,
-0.5916905, 1.264111, -0.4652659, 0.2901961, 1, 0, 1,
-0.590291, -0.5788857, -1.136932, 0.282353, 1, 0, 1,
-0.5897468, 0.2127074, -0.8364598, 0.2784314, 1, 0, 1,
-0.5873985, 0.2335513, 0.8653191, 0.2705882, 1, 0, 1,
-0.5863924, 0.2893409, -0.1196029, 0.2666667, 1, 0, 1,
-0.5842586, 0.821779, -0.7269751, 0.2588235, 1, 0, 1,
-0.5797303, 0.8284774, -1.247154, 0.254902, 1, 0, 1,
-0.5777871, 0.5226138, 0.3597169, 0.2470588, 1, 0, 1,
-0.5769224, 0.9540566, 2.371113, 0.2431373, 1, 0, 1,
-0.5769217, -0.4879101, -3.577129, 0.2352941, 1, 0, 1,
-0.5697655, -1.314379, -2.465694, 0.2313726, 1, 0, 1,
-0.5686977, -0.2609843, -1.358754, 0.2235294, 1, 0, 1,
-0.5676774, 0.259697, -0.6417769, 0.2196078, 1, 0, 1,
-0.5673506, -0.641351, -1.652793, 0.2117647, 1, 0, 1,
-0.5662324, 0.1444372, -0.009638386, 0.2078431, 1, 0, 1,
-0.5640984, 1.185744, -0.1531804, 0.2, 1, 0, 1,
-0.5585459, 2.26947, 1.010791, 0.1921569, 1, 0, 1,
-0.5556086, -0.05507111, -3.989969, 0.1882353, 1, 0, 1,
-0.553202, 0.2585867, -1.506271, 0.1803922, 1, 0, 1,
-0.5529755, -0.9372561, -3.999235, 0.1764706, 1, 0, 1,
-0.551937, -0.06501861, -2.810281, 0.1686275, 1, 0, 1,
-0.5510115, 0.01683162, 0.1193827, 0.1647059, 1, 0, 1,
-0.5499072, 0.3826043, -1.409591, 0.1568628, 1, 0, 1,
-0.5450909, -0.7965899, -2.672515, 0.1529412, 1, 0, 1,
-0.5431156, -2.709768, -5.502529, 0.145098, 1, 0, 1,
-0.5422009, 0.6201588, -1.241415, 0.1411765, 1, 0, 1,
-0.5409681, 1.78468, -1.017448, 0.1333333, 1, 0, 1,
-0.5395583, 1.227701, -0.5602971, 0.1294118, 1, 0, 1,
-0.5380523, 1.92465, 0.6840945, 0.1215686, 1, 0, 1,
-0.5368429, 0.5894034, -2.529987, 0.1176471, 1, 0, 1,
-0.5339175, 0.4834649, -0.1075893, 0.1098039, 1, 0, 1,
-0.5339084, 0.3567506, -0.1947279, 0.1058824, 1, 0, 1,
-0.5322229, -1.537874, -4.245812, 0.09803922, 1, 0, 1,
-0.5274978, 0.07365913, -1.511605, 0.09019608, 1, 0, 1,
-0.526893, -1.230755, -1.575368, 0.08627451, 1, 0, 1,
-0.5230596, -1.069846, -3.040496, 0.07843138, 1, 0, 1,
-0.5203072, 1.166708, -0.9902276, 0.07450981, 1, 0, 1,
-0.5163031, 0.6378782, -0.4703723, 0.06666667, 1, 0, 1,
-0.5116019, -0.5055804, -2.075938, 0.0627451, 1, 0, 1,
-0.5107514, -0.2124446, -1.442686, 0.05490196, 1, 0, 1,
-0.5092441, 1.871877, 1.363344, 0.05098039, 1, 0, 1,
-0.5051351, -0.5503865, -2.387321, 0.04313726, 1, 0, 1,
-0.5026902, -0.02049674, -1.023927, 0.03921569, 1, 0, 1,
-0.5021132, 0.09228184, -0.1255937, 0.03137255, 1, 0, 1,
-0.4974134, -1.117587, -2.551082, 0.02745098, 1, 0, 1,
-0.4941893, -0.7436902, -2.267353, 0.01960784, 1, 0, 1,
-0.4924865, 0.4339757, -2.647835, 0.01568628, 1, 0, 1,
-0.4898036, 0.6080716, -1.227851, 0.007843138, 1, 0, 1,
-0.4888285, -0.07932729, -2.766386, 0.003921569, 1, 0, 1,
-0.4883668, 0.2863417, -1.184307, 0, 1, 0.003921569, 1,
-0.4869891, 0.06513509, -1.127789, 0, 1, 0.01176471, 1,
-0.4813493, 0.4379078, -3.295288, 0, 1, 0.01568628, 1,
-0.4781162, 0.7627862, 0.4813643, 0, 1, 0.02352941, 1,
-0.4776921, -1.222158, -3.999175, 0, 1, 0.02745098, 1,
-0.4735494, 0.7826561, 0.4500013, 0, 1, 0.03529412, 1,
-0.4727267, 1.140893, -1.956856, 0, 1, 0.03921569, 1,
-0.4722236, 1.14709, 0.307703, 0, 1, 0.04705882, 1,
-0.4718182, -2.112479, -2.288795, 0, 1, 0.05098039, 1,
-0.4658859, 0.3247951, -0.9240119, 0, 1, 0.05882353, 1,
-0.4635138, -0.4757976, -2.831977, 0, 1, 0.0627451, 1,
-0.4611612, -0.08677309, -0.02109453, 0, 1, 0.07058824, 1,
-0.450493, 0.5614942, -0.7735108, 0, 1, 0.07450981, 1,
-0.4470302, -0.7308244, -1.974662, 0, 1, 0.08235294, 1,
-0.4435201, -0.6856565, -2.433376, 0, 1, 0.08627451, 1,
-0.440201, 0.6997486, -0.3343806, 0, 1, 0.09411765, 1,
-0.4400928, 1.349883, 0.4051861, 0, 1, 0.1019608, 1,
-0.4370595, -0.8675559, -4.068021, 0, 1, 0.1058824, 1,
-0.4346419, 0.9272882, -1.128273, 0, 1, 0.1137255, 1,
-0.4198438, -0.4337934, 0.09550306, 0, 1, 0.1176471, 1,
-0.4190661, -1.507028, -1.878058, 0, 1, 0.1254902, 1,
-0.4174269, -1.715445, -1.737761, 0, 1, 0.1294118, 1,
-0.4144605, -0.7678171, -1.72915, 0, 1, 0.1372549, 1,
-0.4130986, -1.24337, -3.255463, 0, 1, 0.1411765, 1,
-0.410326, 1.695002, -0.4040945, 0, 1, 0.1490196, 1,
-0.4076268, 0.541542, 0.01942712, 0, 1, 0.1529412, 1,
-0.4046611, 1.457129, -1.2317, 0, 1, 0.1607843, 1,
-0.400157, -1.045948, -3.263837, 0, 1, 0.1647059, 1,
-0.3989417, 0.0790803, -1.921883, 0, 1, 0.172549, 1,
-0.3983559, -0.3177453, -1.773678, 0, 1, 0.1764706, 1,
-0.3945107, 0.3500142, -0.01228411, 0, 1, 0.1843137, 1,
-0.3904971, 0.09258945, -0.4547918, 0, 1, 0.1882353, 1,
-0.3870565, 1.355761, -0.6551031, 0, 1, 0.1960784, 1,
-0.3765459, -0.3178326, -2.62986, 0, 1, 0.2039216, 1,
-0.3761103, 2.113309, 0.1115778, 0, 1, 0.2078431, 1,
-0.3685203, -0.07357041, -2.271894, 0, 1, 0.2156863, 1,
-0.3641943, -1.478733, -3.676001, 0, 1, 0.2196078, 1,
-0.3623627, -1.614478, -2.585165, 0, 1, 0.227451, 1,
-0.3562475, -0.1359428, -1.775772, 0, 1, 0.2313726, 1,
-0.3536317, 0.7065378, -1.58134, 0, 1, 0.2392157, 1,
-0.349433, 0.08414355, -1.177821, 0, 1, 0.2431373, 1,
-0.3399154, 0.80321, -0.9355408, 0, 1, 0.2509804, 1,
-0.3382503, -0.9574677, -1.953583, 0, 1, 0.254902, 1,
-0.338035, 0.3557513, 0.07297789, 0, 1, 0.2627451, 1,
-0.3361448, 0.722725, 1.11596, 0, 1, 0.2666667, 1,
-0.324636, -1.543385, -2.537899, 0, 1, 0.2745098, 1,
-0.3230403, 1.976099, 0.579596, 0, 1, 0.2784314, 1,
-0.3220157, -0.1921576, 0.08808274, 0, 1, 0.2862745, 1,
-0.3217611, 1.437671, 0.2075312, 0, 1, 0.2901961, 1,
-0.3211058, 0.05373385, -1.526595, 0, 1, 0.2980392, 1,
-0.3183986, 1.010502, 0.5750822, 0, 1, 0.3058824, 1,
-0.3181045, -0.06451522, -2.372922, 0, 1, 0.3098039, 1,
-0.3178678, 0.3798225, -0.7721816, 0, 1, 0.3176471, 1,
-0.3159293, -1.005887, -2.980077, 0, 1, 0.3215686, 1,
-0.3150843, 1.087785, -0.6284003, 0, 1, 0.3294118, 1,
-0.3099973, -0.1757234, -3.323051, 0, 1, 0.3333333, 1,
-0.3084526, -0.9505821, -3.058702, 0, 1, 0.3411765, 1,
-0.307383, 1.934471, -0.5534164, 0, 1, 0.345098, 1,
-0.3062372, -1.777341, -1.855392, 0, 1, 0.3529412, 1,
-0.3055682, -0.2464845, -2.8655, 0, 1, 0.3568628, 1,
-0.3022658, 1.830552, 0.3196553, 0, 1, 0.3647059, 1,
-0.2943729, -1.410455, -3.874604, 0, 1, 0.3686275, 1,
-0.291208, 0.08396474, -0.3392388, 0, 1, 0.3764706, 1,
-0.2864304, -0.8403302, -4.059566, 0, 1, 0.3803922, 1,
-0.2770956, 0.8316432, -0.2350724, 0, 1, 0.3882353, 1,
-0.2754286, 1.048344, -0.002718694, 0, 1, 0.3921569, 1,
-0.2736635, 1.158033, -0.1547963, 0, 1, 0.4, 1,
-0.2706479, 0.2560274, -2.279726, 0, 1, 0.4078431, 1,
-0.2649074, 0.426277, -0.3134783, 0, 1, 0.4117647, 1,
-0.2557377, 1.565711, 1.241664, 0, 1, 0.4196078, 1,
-0.2549239, -0.6687368, -2.230832, 0, 1, 0.4235294, 1,
-0.2532463, -1.239271, -3.373469, 0, 1, 0.4313726, 1,
-0.2512528, -1.762962, -5.153521, 0, 1, 0.4352941, 1,
-0.2491381, -0.6995221, -4.512031, 0, 1, 0.4431373, 1,
-0.2407163, 0.05871639, -1.875959, 0, 1, 0.4470588, 1,
-0.2381036, -0.1646062, -4.348892, 0, 1, 0.454902, 1,
-0.2338985, -0.09038126, -3.578217, 0, 1, 0.4588235, 1,
-0.2334824, -1.630813, -3.197537, 0, 1, 0.4666667, 1,
-0.2299611, 0.7725123, -0.6581458, 0, 1, 0.4705882, 1,
-0.2290313, 0.8844091, -0.2739168, 0, 1, 0.4784314, 1,
-0.2245674, 1.483389, -0.6734527, 0, 1, 0.4823529, 1,
-0.2228647, 1.126052, -0.8598521, 0, 1, 0.4901961, 1,
-0.2188938, 0.2454826, -0.1850356, 0, 1, 0.4941176, 1,
-0.2181149, 0.2044846, -1.557006, 0, 1, 0.5019608, 1,
-0.2154791, 0.9243335, -2.109678, 0, 1, 0.509804, 1,
-0.2143071, -1.360872, -3.15021, 0, 1, 0.5137255, 1,
-0.2140045, 0.1087564, -1.663051, 0, 1, 0.5215687, 1,
-0.2103288, -0.6938958, -3.036658, 0, 1, 0.5254902, 1,
-0.2077547, 1.515102, -0.282787, 0, 1, 0.5333334, 1,
-0.2001118, -0.1000583, -1.178087, 0, 1, 0.5372549, 1,
-0.1992412, -0.1683101, -2.901138, 0, 1, 0.5450981, 1,
-0.1983624, 1.061888, 1.120158, 0, 1, 0.5490196, 1,
-0.196146, 1.424073, 0.725067, 0, 1, 0.5568628, 1,
-0.1945083, -0.1348454, -3.572356, 0, 1, 0.5607843, 1,
-0.1885679, -0.9900523, -1.770333, 0, 1, 0.5686275, 1,
-0.188455, 0.9333544, -0.8876374, 0, 1, 0.572549, 1,
-0.188168, -1.564556, -3.436443, 0, 1, 0.5803922, 1,
-0.1878494, -2.610682, -2.907157, 0, 1, 0.5843138, 1,
-0.1875414, 0.006600781, -0.5068956, 0, 1, 0.5921569, 1,
-0.1871771, -0.3121775, -1.267073, 0, 1, 0.5960785, 1,
-0.185081, 0.3909958, -1.05523, 0, 1, 0.6039216, 1,
-0.1849994, 1.149812, -0.5538061, 0, 1, 0.6117647, 1,
-0.1845023, -2.313425, -1.995521, 0, 1, 0.6156863, 1,
-0.1799042, -0.7607923, -2.566276, 0, 1, 0.6235294, 1,
-0.1769496, -0.9668392, -3.104099, 0, 1, 0.627451, 1,
-0.1766705, -0.1982509, -1.582167, 0, 1, 0.6352941, 1,
-0.1748098, -1.844518, -4.098477, 0, 1, 0.6392157, 1,
-0.1720504, 0.3149471, -1.884566, 0, 1, 0.6470588, 1,
-0.1681452, -1.62189, -2.838374, 0, 1, 0.6509804, 1,
-0.1673398, -0.9058021, -4.173812, 0, 1, 0.6588235, 1,
-0.1615269, 0.1749828, -3.199364, 0, 1, 0.6627451, 1,
-0.1611572, -0.0171007, -2.628015, 0, 1, 0.6705883, 1,
-0.1554384, -0.6884643, -3.703384, 0, 1, 0.6745098, 1,
-0.154966, 0.3456331, -1.004255, 0, 1, 0.682353, 1,
-0.1545595, -0.7662446, -2.201064, 0, 1, 0.6862745, 1,
-0.152657, 0.8865283, -0.2041755, 0, 1, 0.6941177, 1,
-0.1504683, -0.7573302, -3.472563, 0, 1, 0.7019608, 1,
-0.1463784, -0.5288817, -2.645329, 0, 1, 0.7058824, 1,
-0.1404298, 1.803053, -0.2449085, 0, 1, 0.7137255, 1,
-0.136266, -0.1846215, -3.413966, 0, 1, 0.7176471, 1,
-0.1338045, -0.007242769, -1.8024, 0, 1, 0.7254902, 1,
-0.1239325, -0.8585334, -3.332363, 0, 1, 0.7294118, 1,
-0.1229289, 0.8614433, -1.218363, 0, 1, 0.7372549, 1,
-0.1187714, -0.535579, -3.330618, 0, 1, 0.7411765, 1,
-0.1173461, 0.4415457, 0.6065242, 0, 1, 0.7490196, 1,
-0.1173003, -0.3051167, -4.50793, 0, 1, 0.7529412, 1,
-0.1089726, -0.2599211, -2.349461, 0, 1, 0.7607843, 1,
-0.1036041, -1.329427, -4.123136, 0, 1, 0.7647059, 1,
-0.09601563, 0.0260121, -1.202516, 0, 1, 0.772549, 1,
-0.09376812, 0.6507034, -0.5772097, 0, 1, 0.7764706, 1,
-0.09368562, -0.5508194, -4.64102, 0, 1, 0.7843137, 1,
-0.09231158, 2.179611, -0.744055, 0, 1, 0.7882353, 1,
-0.09143822, 0.7310043, 0.8580783, 0, 1, 0.7960784, 1,
-0.0854282, 1.159901, 0.8659335, 0, 1, 0.8039216, 1,
-0.08320548, 1.939944, -0.02355971, 0, 1, 0.8078431, 1,
-0.08317312, -0.219163, -0.7254974, 0, 1, 0.8156863, 1,
-0.08081058, 0.4296309, -0.7346509, 0, 1, 0.8196079, 1,
-0.08000985, -0.4728496, -4.493097, 0, 1, 0.827451, 1,
-0.07537355, 0.1287272, -1.371944, 0, 1, 0.8313726, 1,
-0.07061812, 0.3759856, -0.4416905, 0, 1, 0.8392157, 1,
-0.06912941, 0.9471368, 0.3965872, 0, 1, 0.8431373, 1,
-0.06750678, -0.2766866, -2.859579, 0, 1, 0.8509804, 1,
-0.06267464, 0.2074637, -0.1451544, 0, 1, 0.854902, 1,
-0.06065964, -1.124415, -2.118551, 0, 1, 0.8627451, 1,
-0.06054652, 0.6770655, 1.161561, 0, 1, 0.8666667, 1,
-0.0595872, 1.458656, -1.044879, 0, 1, 0.8745098, 1,
-0.05302199, 0.208292, 1.15949, 0, 1, 0.8784314, 1,
-0.0466526, -0.7545271, -2.845535, 0, 1, 0.8862745, 1,
-0.04414801, -0.9227884, -3.233865, 0, 1, 0.8901961, 1,
-0.04214101, 0.759852, 0.6843214, 0, 1, 0.8980392, 1,
-0.03677753, 0.7482148, 0.2680758, 0, 1, 0.9058824, 1,
-0.03420695, 1.120684, -0.9812719, 0, 1, 0.9098039, 1,
-0.03391894, -0.2664366, -1.289636, 0, 1, 0.9176471, 1,
-0.02960618, 1.710426, -0.8237013, 0, 1, 0.9215686, 1,
-0.01788756, -0.3134434, -2.960746, 0, 1, 0.9294118, 1,
-0.01620798, 0.3299034, 0.08100865, 0, 1, 0.9333333, 1,
-0.01122249, -0.2564419, -2.215513, 0, 1, 0.9411765, 1,
-0.01041663, 0.3470829, 0.3368386, 0, 1, 0.945098, 1,
-0.003302496, 0.8113787, -0.1222283, 0, 1, 0.9529412, 1,
0.004435309, -1.245343, 3.737561, 0, 1, 0.9568627, 1,
0.007846582, 0.8224766, -0.2464524, 0, 1, 0.9647059, 1,
0.009615426, -1.409587, 3.944249, 0, 1, 0.9686275, 1,
0.01466387, 0.4548171, 1.956014, 0, 1, 0.9764706, 1,
0.01525434, 0.5865018, -0.8639169, 0, 1, 0.9803922, 1,
0.01536247, -1.004089, 3.879247, 0, 1, 0.9882353, 1,
0.02024642, -0.7962223, 2.79081, 0, 1, 0.9921569, 1,
0.0215769, 0.6873636, 2.033664, 0, 1, 1, 1,
0.02200091, 1.115655, 0.2609436, 0, 0.9921569, 1, 1,
0.02504098, -0.3240114, 2.566103, 0, 0.9882353, 1, 1,
0.02535635, -0.864361, 2.579861, 0, 0.9803922, 1, 1,
0.03019376, -0.1972214, 2.80775, 0, 0.9764706, 1, 1,
0.04277605, -1.46641, 3.801704, 0, 0.9686275, 1, 1,
0.04539173, 1.408893, 0.05982492, 0, 0.9647059, 1, 1,
0.05560804, 0.02141932, 0.4326698, 0, 0.9568627, 1, 1,
0.05875032, 0.3763679, 0.09345901, 0, 0.9529412, 1, 1,
0.06003899, -0.8440549, 3.438509, 0, 0.945098, 1, 1,
0.06030801, 2.13381, 0.3679318, 0, 0.9411765, 1, 1,
0.06318562, 1.537459, -0.7150335, 0, 0.9333333, 1, 1,
0.07037692, -0.2072166, 1.614938, 0, 0.9294118, 1, 1,
0.07298166, 0.4770729, -0.8952312, 0, 0.9215686, 1, 1,
0.07498181, 0.2135463, 1.335452, 0, 0.9176471, 1, 1,
0.07551836, -0.3931622, 2.472764, 0, 0.9098039, 1, 1,
0.08078809, -0.4151725, 1.705261, 0, 0.9058824, 1, 1,
0.08180001, -0.7327287, 2.624145, 0, 0.8980392, 1, 1,
0.08309653, 0.002857916, 1.628545, 0, 0.8901961, 1, 1,
0.08377872, -0.4515875, 3.6575, 0, 0.8862745, 1, 1,
0.085207, -0.6301039, 3.862956, 0, 0.8784314, 1, 1,
0.08882896, -0.0675743, 1.957407, 0, 0.8745098, 1, 1,
0.09397384, -0.3895298, 1.919076, 0, 0.8666667, 1, 1,
0.09420383, 0.09347692, 0.06014532, 0, 0.8627451, 1, 1,
0.1077695, -1.338513, 2.835927, 0, 0.854902, 1, 1,
0.10838, 0.1680775, 2.105638, 0, 0.8509804, 1, 1,
0.1085967, 1.721551, 1.139112, 0, 0.8431373, 1, 1,
0.1100394, -0.9629957, 2.772927, 0, 0.8392157, 1, 1,
0.1122747, 0.9943298, 0.2418476, 0, 0.8313726, 1, 1,
0.118273, -0.76024, 2.597754, 0, 0.827451, 1, 1,
0.1195078, -1.394739, 1.340469, 0, 0.8196079, 1, 1,
0.1260268, -1.094429, 2.464823, 0, 0.8156863, 1, 1,
0.1270709, 0.3713683, 0.6497316, 0, 0.8078431, 1, 1,
0.1289577, 1.360562, 0.1888724, 0, 0.8039216, 1, 1,
0.1306688, 0.7396794, 2.411555, 0, 0.7960784, 1, 1,
0.1319391, 1.843354, 1.921371, 0, 0.7882353, 1, 1,
0.1345127, -0.2771569, 2.974827, 0, 0.7843137, 1, 1,
0.1370297, -0.5695669, 2.96599, 0, 0.7764706, 1, 1,
0.1370663, -0.5972232, 3.52979, 0, 0.772549, 1, 1,
0.1385192, 0.9278543, -0.1508209, 0, 0.7647059, 1, 1,
0.1388184, 0.2255333, 1.470943, 0, 0.7607843, 1, 1,
0.1402417, 0.6844981, -1.446527, 0, 0.7529412, 1, 1,
0.142485, -0.1416179, 3.731969, 0, 0.7490196, 1, 1,
0.1457567, 0.9110721, -1.265444, 0, 0.7411765, 1, 1,
0.146989, 0.3925162, 0.9020609, 0, 0.7372549, 1, 1,
0.1488729, -1.387303, 1.906124, 0, 0.7294118, 1, 1,
0.1502326, 1.467064, -0.0625754, 0, 0.7254902, 1, 1,
0.1601785, -0.3892616, 3.902032, 0, 0.7176471, 1, 1,
0.1602707, -0.9366605, 2.76609, 0, 0.7137255, 1, 1,
0.16237, -0.09063698, 2.625859, 0, 0.7058824, 1, 1,
0.1679859, 2.210665, 0.2798986, 0, 0.6980392, 1, 1,
0.1679983, 1.744049, 0.3481019, 0, 0.6941177, 1, 1,
0.1689185, -0.1733672, 1.637184, 0, 0.6862745, 1, 1,
0.1800514, -0.08246937, 3.065714, 0, 0.682353, 1, 1,
0.1804492, -0.9861452, 2.976671, 0, 0.6745098, 1, 1,
0.1836926, 0.2630793, 0.9523186, 0, 0.6705883, 1, 1,
0.1864762, 2.247363, 0.9801219, 0, 0.6627451, 1, 1,
0.1890262, 2.306605, 1.40468, 0, 0.6588235, 1, 1,
0.1987235, -0.8941952, 3.352658, 0, 0.6509804, 1, 1,
0.2023655, 0.5552836, 0.8791318, 0, 0.6470588, 1, 1,
0.2044843, -0.8303707, 3.685076, 0, 0.6392157, 1, 1,
0.2057991, -0.1983225, 4.458707, 0, 0.6352941, 1, 1,
0.2096727, -0.1074611, 2.202454, 0, 0.627451, 1, 1,
0.2119201, 0.484883, -0.6844519, 0, 0.6235294, 1, 1,
0.2123428, 1.243513, -1.712463, 0, 0.6156863, 1, 1,
0.2135304, -0.7612656, 1.62191, 0, 0.6117647, 1, 1,
0.2137933, 0.2644622, 1.314139, 0, 0.6039216, 1, 1,
0.2187326, 0.4181161, 1.162074, 0, 0.5960785, 1, 1,
0.2191759, 1.554467, -0.6775407, 0, 0.5921569, 1, 1,
0.2213354, -0.7451046, 2.002586, 0, 0.5843138, 1, 1,
0.2222576, 1.966514, -1.671384, 0, 0.5803922, 1, 1,
0.223703, 1.357283, 0.02234174, 0, 0.572549, 1, 1,
0.2259527, 1.967461, 1.198848, 0, 0.5686275, 1, 1,
0.2313055, 2.763008, 0.01858861, 0, 0.5607843, 1, 1,
0.2338248, 0.156694, -0.06553639, 0, 0.5568628, 1, 1,
0.2373949, 1.393884, 1.035582, 0, 0.5490196, 1, 1,
0.2410777, -1.265033, 2.586245, 0, 0.5450981, 1, 1,
0.2446562, -0.970462, 2.65767, 0, 0.5372549, 1, 1,
0.2450204, 0.6494671, 0.9282612, 0, 0.5333334, 1, 1,
0.2457815, 1.061575, -1.627863, 0, 0.5254902, 1, 1,
0.2489175, -1.407847, 1.947245, 0, 0.5215687, 1, 1,
0.2510474, -0.6633294, 3.360744, 0, 0.5137255, 1, 1,
0.2513065, 1.625437, 0.1382747, 0, 0.509804, 1, 1,
0.2517423, -0.325625, 0.5963322, 0, 0.5019608, 1, 1,
0.2519538, -0.2668485, 3.838398, 0, 0.4941176, 1, 1,
0.2535531, -1.437148, 2.455887, 0, 0.4901961, 1, 1,
0.2550673, -0.6045496, 1.450777, 0, 0.4823529, 1, 1,
0.256764, 0.2099263, 0.8230912, 0, 0.4784314, 1, 1,
0.2579358, -0.4616111, 2.639156, 0, 0.4705882, 1, 1,
0.2584954, 2.346106, -1.440851, 0, 0.4666667, 1, 1,
0.2637045, 0.129641, 2.22271, 0, 0.4588235, 1, 1,
0.2675377, -0.2667165, 2.786904, 0, 0.454902, 1, 1,
0.2685307, -1.22445, 1.970312, 0, 0.4470588, 1, 1,
0.2713298, -0.1882446, 3.705369, 0, 0.4431373, 1, 1,
0.27278, -0.05985732, 2.360967, 0, 0.4352941, 1, 1,
0.2784655, -0.3663872, 2.116183, 0, 0.4313726, 1, 1,
0.2813574, 0.01688292, 1.140832, 0, 0.4235294, 1, 1,
0.2900572, 0.6966959, 1.152288, 0, 0.4196078, 1, 1,
0.2958595, -0.5660822, 2.191899, 0, 0.4117647, 1, 1,
0.2958858, 2.154999, 2.264008, 0, 0.4078431, 1, 1,
0.2968922, 0.6093921, 0.5539147, 0, 0.4, 1, 1,
0.2978587, 1.523482, 0.555177, 0, 0.3921569, 1, 1,
0.309413, -0.752849, 3.604472, 0, 0.3882353, 1, 1,
0.3101556, -1.465951, 3.162633, 0, 0.3803922, 1, 1,
0.315142, -0.2044729, 2.444595, 0, 0.3764706, 1, 1,
0.3199634, 1.192543, 0.3153192, 0, 0.3686275, 1, 1,
0.3211547, 1.014509, -0.4186861, 0, 0.3647059, 1, 1,
0.3221767, -1.493566, 1.979303, 0, 0.3568628, 1, 1,
0.3226073, -0.4332632, 1.9035, 0, 0.3529412, 1, 1,
0.3226323, 0.257954, 0.8523693, 0, 0.345098, 1, 1,
0.3241541, -0.05297881, 1.492722, 0, 0.3411765, 1, 1,
0.3247816, 1.676955, -1.381952, 0, 0.3333333, 1, 1,
0.3256058, 0.4032223, 0.3598184, 0, 0.3294118, 1, 1,
0.325764, 0.427134, -0.8392961, 0, 0.3215686, 1, 1,
0.326952, 2.551502, 0.313987, 0, 0.3176471, 1, 1,
0.329745, -0.7521179, 2.916034, 0, 0.3098039, 1, 1,
0.3305806, -1.021943, 3.819552, 0, 0.3058824, 1, 1,
0.3314222, 1.195584, 0.3059288, 0, 0.2980392, 1, 1,
0.3325644, -0.2561285, 2.621451, 0, 0.2901961, 1, 1,
0.3375349, -0.778225, 4.023778, 0, 0.2862745, 1, 1,
0.3381612, -1.424689, 4.482195, 0, 0.2784314, 1, 1,
0.3441373, -0.1828347, 2.785151, 0, 0.2745098, 1, 1,
0.3457047, -0.6053296, 2.185568, 0, 0.2666667, 1, 1,
0.346437, 0.5557951, -1.031142, 0, 0.2627451, 1, 1,
0.3524417, 0.08738375, 0.6614835, 0, 0.254902, 1, 1,
0.3559731, 1.155243, 0.1705861, 0, 0.2509804, 1, 1,
0.358006, -2.30375, 4.004818, 0, 0.2431373, 1, 1,
0.3584613, 0.5854578, 0.001735841, 0, 0.2392157, 1, 1,
0.3620447, 1.356906, 1.672098, 0, 0.2313726, 1, 1,
0.3621936, -1.153852, 2.109655, 0, 0.227451, 1, 1,
0.362518, 0.6966248, -0.5415596, 0, 0.2196078, 1, 1,
0.3713505, 1.571035, 0.1401129, 0, 0.2156863, 1, 1,
0.3790187, -0.02286571, 2.028125, 0, 0.2078431, 1, 1,
0.3791876, 0.8998333, -1.144203, 0, 0.2039216, 1, 1,
0.3818288, -1.531309, 3.009354, 0, 0.1960784, 1, 1,
0.3874414, -0.3071582, 4.40607, 0, 0.1882353, 1, 1,
0.3878084, -0.5302669, 1.425786, 0, 0.1843137, 1, 1,
0.3884894, 1.67853, 0.6570908, 0, 0.1764706, 1, 1,
0.3896136, 0.04517272, -0.3295354, 0, 0.172549, 1, 1,
0.3918554, -0.9781766, 3.080637, 0, 0.1647059, 1, 1,
0.3946177, -0.878565, 3.015584, 0, 0.1607843, 1, 1,
0.3949134, -0.4489951, 5.099223, 0, 0.1529412, 1, 1,
0.3968704, -0.771986, 1.651966, 0, 0.1490196, 1, 1,
0.3983697, 1.415939, 1.568913, 0, 0.1411765, 1, 1,
0.3990963, 1.35928, -0.541173, 0, 0.1372549, 1, 1,
0.401866, -0.7415377, 3.026109, 0, 0.1294118, 1, 1,
0.4103231, 0.5683509, 0.6625228, 0, 0.1254902, 1, 1,
0.4106273, -0.08969837, 1.059883, 0, 0.1176471, 1, 1,
0.4149559, -0.563996, 4.064109, 0, 0.1137255, 1, 1,
0.4156592, -1.097625, 3.347632, 0, 0.1058824, 1, 1,
0.416752, -0.5448462, 2.31109, 0, 0.09803922, 1, 1,
0.422476, -0.5819564, 2.239164, 0, 0.09411765, 1, 1,
0.4225195, 0.6528098, -0.1920186, 0, 0.08627451, 1, 1,
0.423417, -1.267738, 2.261333, 0, 0.08235294, 1, 1,
0.4246324, -0.9853618, 1.943592, 0, 0.07450981, 1, 1,
0.425807, -2.147616, 2.987408, 0, 0.07058824, 1, 1,
0.4269368, -0.459964, 1.50122, 0, 0.0627451, 1, 1,
0.4350927, 0.1786307, 1.156734, 0, 0.05882353, 1, 1,
0.4358211, -0.6673728, 3.288116, 0, 0.05098039, 1, 1,
0.4362628, -0.4617797, 3.502048, 0, 0.04705882, 1, 1,
0.4363553, -0.7779108, 2.116554, 0, 0.03921569, 1, 1,
0.4416778, 0.9595334, 1.52229, 0, 0.03529412, 1, 1,
0.4482058, -0.8375271, 1.222089, 0, 0.02745098, 1, 1,
0.4485774, 0.3302179, 1.690661, 0, 0.02352941, 1, 1,
0.4497846, 0.3286754, 0.4058579, 0, 0.01568628, 1, 1,
0.4509588, 0.6816946, -1.287117, 0, 0.01176471, 1, 1,
0.4542029, -0.662143, 1.942452, 0, 0.003921569, 1, 1,
0.4598637, -0.1933954, 2.503823, 0.003921569, 0, 1, 1,
0.4625136, 0.4051771, 0.1885584, 0.007843138, 0, 1, 1,
0.4630804, 0.7658181, 0.3708338, 0.01568628, 0, 1, 1,
0.4714182, -0.0155505, 2.761312, 0.01960784, 0, 1, 1,
0.4725411, -0.8317855, 1.66748, 0.02745098, 0, 1, 1,
0.474135, 0.4426269, 1.84038, 0.03137255, 0, 1, 1,
0.4749864, -1.798116, 2.937944, 0.03921569, 0, 1, 1,
0.4774266, 0.3710355, -0.8755522, 0.04313726, 0, 1, 1,
0.4798841, -0.3861414, 3.9783, 0.05098039, 0, 1, 1,
0.4807262, 0.4092805, -0.5536658, 0.05490196, 0, 1, 1,
0.4814892, 1.950867, 0.5665448, 0.0627451, 0, 1, 1,
0.4841493, -0.2165836, 3.315116, 0.06666667, 0, 1, 1,
0.490544, -0.7733485, 1.899665, 0.07450981, 0, 1, 1,
0.4907978, -0.5060636, 0.7810903, 0.07843138, 0, 1, 1,
0.4943316, 0.08023249, 2.266756, 0.08627451, 0, 1, 1,
0.4946258, 0.6471637, 0.212756, 0.09019608, 0, 1, 1,
0.4980547, 0.5275488, 2.932326, 0.09803922, 0, 1, 1,
0.4989279, 2.133716, 0.009526075, 0.1058824, 0, 1, 1,
0.4994822, 0.4523503, 2.175484, 0.1098039, 0, 1, 1,
0.5049414, 0.7503682, 0.3056491, 0.1176471, 0, 1, 1,
0.5091646, -1.071333, 4.280713, 0.1215686, 0, 1, 1,
0.5112315, 0.6745461, 1.993084, 0.1294118, 0, 1, 1,
0.5116863, 0.4513927, 0.2423479, 0.1333333, 0, 1, 1,
0.5218842, 0.7921919, 2.00306, 0.1411765, 0, 1, 1,
0.5221849, 0.8694156, -0.3826568, 0.145098, 0, 1, 1,
0.5237898, 1.490466, 0.4188083, 0.1529412, 0, 1, 1,
0.5241926, 1.605579, 1.622955, 0.1568628, 0, 1, 1,
0.5392566, 0.3904541, 0.8721017, 0.1647059, 0, 1, 1,
0.5399064, -1.742172, 2.913606, 0.1686275, 0, 1, 1,
0.5515164, 1.000652, -1.226504, 0.1764706, 0, 1, 1,
0.551891, 1.755365, -0.5052586, 0.1803922, 0, 1, 1,
0.5546184, -0.8352374, 2.767094, 0.1882353, 0, 1, 1,
0.5618107, 1.732638, -0.3490109, 0.1921569, 0, 1, 1,
0.5659302, 0.6902195, 0.5976453, 0.2, 0, 1, 1,
0.5660332, 0.5210622, 0.8436174, 0.2078431, 0, 1, 1,
0.5663974, -0.2241808, 2.550989, 0.2117647, 0, 1, 1,
0.5771889, 0.7298735, 0.07008269, 0.2196078, 0, 1, 1,
0.5790666, -1.574471, 3.264385, 0.2235294, 0, 1, 1,
0.5839747, -1.225848, 3.257391, 0.2313726, 0, 1, 1,
0.5845225, -1.25074, 2.723624, 0.2352941, 0, 1, 1,
0.5876577, -2.154775, 2.295745, 0.2431373, 0, 1, 1,
0.5910283, 0.4172366, -0.8628485, 0.2470588, 0, 1, 1,
0.594559, 0.290803, 1.254235, 0.254902, 0, 1, 1,
0.600534, 0.7014689, -0.7777511, 0.2588235, 0, 1, 1,
0.6009368, -0.7615038, 3.640689, 0.2666667, 0, 1, 1,
0.6105133, 0.4825031, 0.7967282, 0.2705882, 0, 1, 1,
0.6134667, 1.115625, 1.509766, 0.2784314, 0, 1, 1,
0.6150687, -0.02982778, 1.974957, 0.282353, 0, 1, 1,
0.6166366, 0.6901485, 0.6314641, 0.2901961, 0, 1, 1,
0.6184376, -0.7702996, 2.018776, 0.2941177, 0, 1, 1,
0.6189823, -0.6036052, 1.910958, 0.3019608, 0, 1, 1,
0.6205939, 0.5059633, -0.6480735, 0.3098039, 0, 1, 1,
0.6207896, -2.275965, 3.178942, 0.3137255, 0, 1, 1,
0.6241141, -0.4552918, 4.132861, 0.3215686, 0, 1, 1,
0.6253316, -0.5747625, 1.981582, 0.3254902, 0, 1, 1,
0.6270411, 0.6466722, 1.296197, 0.3333333, 0, 1, 1,
0.6291599, -0.820718, 1.060614, 0.3372549, 0, 1, 1,
0.6305041, -0.6793429, 3.17154, 0.345098, 0, 1, 1,
0.631465, 0.5031381, -1.672923, 0.3490196, 0, 1, 1,
0.6387153, -0.1485993, 0.431303, 0.3568628, 0, 1, 1,
0.6393518, -0.009340215, 1.045732, 0.3607843, 0, 1, 1,
0.6402387, -0.5260971, 4.226135, 0.3686275, 0, 1, 1,
0.6438667, 0.4473773, 3.143783, 0.372549, 0, 1, 1,
0.6521087, 0.2911022, 1.676869, 0.3803922, 0, 1, 1,
0.6560979, 0.2937144, 1.229502, 0.3843137, 0, 1, 1,
0.6594475, -0.7014939, 1.498097, 0.3921569, 0, 1, 1,
0.6660973, 0.521633, 0.3786568, 0.3960784, 0, 1, 1,
0.6677549, 0.3620637, 1.637165, 0.4039216, 0, 1, 1,
0.6694036, 1.506635, -0.2555146, 0.4117647, 0, 1, 1,
0.6717208, 1.269675, 1.027197, 0.4156863, 0, 1, 1,
0.6728289, -1.602321, 2.226846, 0.4235294, 0, 1, 1,
0.6784633, 0.382466, 1.524585, 0.427451, 0, 1, 1,
0.6791782, -1.106978, 1.599897, 0.4352941, 0, 1, 1,
0.6845744, 0.7162211, 1.293013, 0.4392157, 0, 1, 1,
0.6884239, -0.466515, 4.478342, 0.4470588, 0, 1, 1,
0.7009198, -1.002553, 3.329656, 0.4509804, 0, 1, 1,
0.702834, 0.1947682, -0.02093455, 0.4588235, 0, 1, 1,
0.7083183, 0.575735, -0.3502612, 0.4627451, 0, 1, 1,
0.7106858, -0.2168292, 0.454299, 0.4705882, 0, 1, 1,
0.7117795, 0.4474329, 2.38725, 0.4745098, 0, 1, 1,
0.7118158, -0.03150432, 1.239266, 0.4823529, 0, 1, 1,
0.7125262, 0.04654256, 1.130371, 0.4862745, 0, 1, 1,
0.7130768, -1.91155, 4.357438, 0.4941176, 0, 1, 1,
0.7133453, 0.452888, 1.029598, 0.5019608, 0, 1, 1,
0.7151993, 0.6553179, 0.814423, 0.5058824, 0, 1, 1,
0.7192872, -1.394409, 3.161913, 0.5137255, 0, 1, 1,
0.7271487, -0.2531461, 1.811598, 0.5176471, 0, 1, 1,
0.7300431, -0.1271864, 1.48724, 0.5254902, 0, 1, 1,
0.7303223, 1.01995, 1.829991, 0.5294118, 0, 1, 1,
0.7362217, -0.8791491, 2.685176, 0.5372549, 0, 1, 1,
0.7403619, 0.9861127, 2.371338, 0.5411765, 0, 1, 1,
0.7449849, -0.2498871, 2.638636, 0.5490196, 0, 1, 1,
0.7471071, 1.83385, -0.5710912, 0.5529412, 0, 1, 1,
0.750556, 1.463452, -0.4844802, 0.5607843, 0, 1, 1,
0.7508594, 0.9034795, -0.8583773, 0.5647059, 0, 1, 1,
0.7519491, 0.6639372, -0.9423134, 0.572549, 0, 1, 1,
0.7524678, 0.9198745, -0.3168082, 0.5764706, 0, 1, 1,
0.7564479, -1.051596, 2.696735, 0.5843138, 0, 1, 1,
0.7574676, 0.4828923, 1.332825, 0.5882353, 0, 1, 1,
0.7613353, -0.2753635, 2.130528, 0.5960785, 0, 1, 1,
0.7666532, 1.608831, -0.2875705, 0.6039216, 0, 1, 1,
0.7694451, 2.204278, -0.5369544, 0.6078432, 0, 1, 1,
0.7696598, -0.4243409, 2.939679, 0.6156863, 0, 1, 1,
0.7716585, 1.404334, 0.5380325, 0.6196079, 0, 1, 1,
0.7737511, 2.199043, -1.835948, 0.627451, 0, 1, 1,
0.7738929, 0.573831, 0.6877446, 0.6313726, 0, 1, 1,
0.7758039, -0.3109092, 2.201649, 0.6392157, 0, 1, 1,
0.7852539, -0.1847269, 3.418926, 0.6431373, 0, 1, 1,
0.7887946, 0.0902628, 1.609899, 0.6509804, 0, 1, 1,
0.7896945, -0.2484288, 2.637251, 0.654902, 0, 1, 1,
0.7929885, -0.1833265, 1.246992, 0.6627451, 0, 1, 1,
0.7978091, 1.17614, 0.2154858, 0.6666667, 0, 1, 1,
0.8029259, 0.7076166, 1.637595, 0.6745098, 0, 1, 1,
0.8108376, -0.7605872, 1.769279, 0.6784314, 0, 1, 1,
0.8127335, -0.1822042, 1.572859, 0.6862745, 0, 1, 1,
0.8157339, -1.052616, 0.4959484, 0.6901961, 0, 1, 1,
0.8198291, -1.329384, 3.047385, 0.6980392, 0, 1, 1,
0.8236092, -1.385165, 2.218914, 0.7058824, 0, 1, 1,
0.8268164, 0.9307216, 0.6474243, 0.7098039, 0, 1, 1,
0.8305661, -0.1423098, 1.824653, 0.7176471, 0, 1, 1,
0.8326294, -1.166493, 0.5316085, 0.7215686, 0, 1, 1,
0.8344482, -0.3483351, 2.354461, 0.7294118, 0, 1, 1,
0.8455267, -0.4025822, 1.740022, 0.7333333, 0, 1, 1,
0.848034, 0.4981597, -0.1859729, 0.7411765, 0, 1, 1,
0.8480539, 1.194568, 1.623946, 0.7450981, 0, 1, 1,
0.849491, -0.409398, 1.783958, 0.7529412, 0, 1, 1,
0.8627518, 0.6048999, 2.388502, 0.7568628, 0, 1, 1,
0.864012, 0.1978335, 0.8279389, 0.7647059, 0, 1, 1,
0.867128, 2.174405, 0.6914812, 0.7686275, 0, 1, 1,
0.8719068, 0.410662, 0.6382216, 0.7764706, 0, 1, 1,
0.8729843, -0.7725462, 1.643867, 0.7803922, 0, 1, 1,
0.88135, 1.242371, 3.1466, 0.7882353, 0, 1, 1,
0.8836287, 1.231919, 1.798273, 0.7921569, 0, 1, 1,
0.8933615, 0.2082576, 1.488172, 0.8, 0, 1, 1,
0.8963717, -0.2963834, 1.865806, 0.8078431, 0, 1, 1,
0.8972688, 1.188669, 0.2270481, 0.8117647, 0, 1, 1,
0.8994877, -0.8141398, 4.065532, 0.8196079, 0, 1, 1,
0.9003811, 0.4109492, -0.5004681, 0.8235294, 0, 1, 1,
0.9029584, -0.6175768, 2.493067, 0.8313726, 0, 1, 1,
0.9083514, -0.3480811, 1.470016, 0.8352941, 0, 1, 1,
0.9120007, -0.1418094, 2.493186, 0.8431373, 0, 1, 1,
0.9141688, -0.5389068, 2.13447, 0.8470588, 0, 1, 1,
0.915807, 1.539371, 0.6231341, 0.854902, 0, 1, 1,
0.9360426, 2.115912, 1.482626, 0.8588235, 0, 1, 1,
0.9423838, 0.2758347, 1.40114, 0.8666667, 0, 1, 1,
0.9428517, -0.4768347, 4.024869, 0.8705882, 0, 1, 1,
0.9480553, -0.7707705, 2.074493, 0.8784314, 0, 1, 1,
0.961433, -1.273703, 1.826533, 0.8823529, 0, 1, 1,
0.964806, 0.5712757, 1.306665, 0.8901961, 0, 1, 1,
0.9744975, -1.437141, 3.580992, 0.8941177, 0, 1, 1,
0.976923, -0.6688602, 1.885248, 0.9019608, 0, 1, 1,
0.9779631, -0.8897398, 3.233888, 0.9098039, 0, 1, 1,
0.9816531, -0.874832, 3.09205, 0.9137255, 0, 1, 1,
0.9817664, -0.6760901, 1.599512, 0.9215686, 0, 1, 1,
0.9867617, -0.9399971, 2.79342, 0.9254902, 0, 1, 1,
0.9894308, 1.512973, 0.574101, 0.9333333, 0, 1, 1,
0.9897155, 1.034291, -0.5801631, 0.9372549, 0, 1, 1,
0.9898127, -0.08728331, 2.18572, 0.945098, 0, 1, 1,
0.9958327, -1.20701, 1.721616, 0.9490196, 0, 1, 1,
0.9958515, 0.8228148, -0.4195533, 0.9568627, 0, 1, 1,
0.9982178, 0.08000878, 1.226576, 0.9607843, 0, 1, 1,
0.9986543, -0.7572551, 2.22098, 0.9686275, 0, 1, 1,
1.011173, -0.08750129, 2.07547, 0.972549, 0, 1, 1,
1.012989, 0.3898997, 1.200976, 0.9803922, 0, 1, 1,
1.013669, -1.399461, 1.416518, 0.9843137, 0, 1, 1,
1.019062, -1.126963, 3.513409, 0.9921569, 0, 1, 1,
1.024544, 0.7457683, 0.3720012, 0.9960784, 0, 1, 1,
1.043466, -0.1101866, 1.217167, 1, 0, 0.9960784, 1,
1.045542, 1.995792, 0.7428486, 1, 0, 0.9882353, 1,
1.049435, 1.631515, 0.74907, 1, 0, 0.9843137, 1,
1.052377, -0.561913, 2.722637, 1, 0, 0.9764706, 1,
1.057594, -0.9116359, 2.463302, 1, 0, 0.972549, 1,
1.058028, -0.3363087, 3.237869, 1, 0, 0.9647059, 1,
1.058272, 1.569321, 0.4101801, 1, 0, 0.9607843, 1,
1.065456, -1.694266, 1.649483, 1, 0, 0.9529412, 1,
1.087915, 1.753739, 1.001888, 1, 0, 0.9490196, 1,
1.097173, 0.4490018, 1.584054, 1, 0, 0.9411765, 1,
1.098516, -2.029685, 3.889991, 1, 0, 0.9372549, 1,
1.129023, -1.647961, 2.016409, 1, 0, 0.9294118, 1,
1.140575, -0.05868352, 2.180877, 1, 0, 0.9254902, 1,
1.14298, -0.128162, -0.6410874, 1, 0, 0.9176471, 1,
1.143949, -1.350863, 2.779937, 1, 0, 0.9137255, 1,
1.145654, 0.1482298, 1.729548, 1, 0, 0.9058824, 1,
1.146841, -1.782421, 1.675084, 1, 0, 0.9019608, 1,
1.153202, -0.3105518, 0.8991297, 1, 0, 0.8941177, 1,
1.16241, 0.5890029, 2.768386, 1, 0, 0.8862745, 1,
1.165213, 1.090712, 0.02765327, 1, 0, 0.8823529, 1,
1.167764, 0.675087, -0.225605, 1, 0, 0.8745098, 1,
1.16793, 0.4074185, 0.6996286, 1, 0, 0.8705882, 1,
1.168242, 0.6974795, -0.111902, 1, 0, 0.8627451, 1,
1.18013, -0.2899, 2.375612, 1, 0, 0.8588235, 1,
1.184067, 1.326399, 2.402717, 1, 0, 0.8509804, 1,
1.184884, -1.163939, 0.7050537, 1, 0, 0.8470588, 1,
1.193446, 0.7729992, 1.877008, 1, 0, 0.8392157, 1,
1.195413, 1.025231, -0.6478397, 1, 0, 0.8352941, 1,
1.212259, -0.951027, 1.899917, 1, 0, 0.827451, 1,
1.213561, 0.5408438, 1.603229, 1, 0, 0.8235294, 1,
1.216718, 1.69906, -0.1629132, 1, 0, 0.8156863, 1,
1.22545, -1.011676, 0.5014756, 1, 0, 0.8117647, 1,
1.227395, 0.9861737, 1.849988, 1, 0, 0.8039216, 1,
1.227769, -0.4767517, 2.762135, 1, 0, 0.7960784, 1,
1.227997, -0.006068562, 0.9022296, 1, 0, 0.7921569, 1,
1.229666, 0.7928906, 1.293782, 1, 0, 0.7843137, 1,
1.240853, 0.5956567, 3.276947, 1, 0, 0.7803922, 1,
1.241111, 0.213457, 1.931007, 1, 0, 0.772549, 1,
1.241481, 1.731136, 0.6875578, 1, 0, 0.7686275, 1,
1.244835, -0.186691, 3.276586, 1, 0, 0.7607843, 1,
1.247072, 0.963946, 2.988146, 1, 0, 0.7568628, 1,
1.255011, 0.3969505, 1.390269, 1, 0, 0.7490196, 1,
1.263678, -1.200394, 3.333123, 1, 0, 0.7450981, 1,
1.269951, 0.7395746, -0.1830627, 1, 0, 0.7372549, 1,
1.2723, 0.2238655, 2.527803, 1, 0, 0.7333333, 1,
1.276684, -1.295376, 1.459964, 1, 0, 0.7254902, 1,
1.276809, 1.558844, 0.8235355, 1, 0, 0.7215686, 1,
1.285042, -0.0004525782, 1.668809, 1, 0, 0.7137255, 1,
1.28554, -0.8375775, 2.553941, 1, 0, 0.7098039, 1,
1.288222, -0.2525997, 2.926437, 1, 0, 0.7019608, 1,
1.292521, 0.7082578, 1.879245, 1, 0, 0.6941177, 1,
1.292646, 2.033149, 0.8488383, 1, 0, 0.6901961, 1,
1.298137, 0.4078793, 2.995814, 1, 0, 0.682353, 1,
1.301916, 1.768437, -0.09063791, 1, 0, 0.6784314, 1,
1.302657, 1.651582, 1.358349, 1, 0, 0.6705883, 1,
1.312541, -1.3559, 3.465575, 1, 0, 0.6666667, 1,
1.32141, -0.5030609, 1.139011, 1, 0, 0.6588235, 1,
1.328111, 0.4979854, 2.040743, 1, 0, 0.654902, 1,
1.331738, -0.9368428, 2.185318, 1, 0, 0.6470588, 1,
1.344322, -0.1923306, 2.142313, 1, 0, 0.6431373, 1,
1.348523, -1.067004, 2.843551, 1, 0, 0.6352941, 1,
1.350862, -1.270365, -0.2346666, 1, 0, 0.6313726, 1,
1.354875, -1.996875, 2.257617, 1, 0, 0.6235294, 1,
1.358307, -1.742471, 1.3923, 1, 0, 0.6196079, 1,
1.359766, -0.3739582, 0.7109849, 1, 0, 0.6117647, 1,
1.365165, -1.424045, 2.629241, 1, 0, 0.6078432, 1,
1.366052, -1.090998, 1.23145, 1, 0, 0.6, 1,
1.36816, 1.208312, 0.6819847, 1, 0, 0.5921569, 1,
1.369883, 0.4233747, -0.01035357, 1, 0, 0.5882353, 1,
1.371614, 0.1886123, -0.1207659, 1, 0, 0.5803922, 1,
1.379066, 0.1533946, 0.8881932, 1, 0, 0.5764706, 1,
1.389921, -0.3078792, 3.287456, 1, 0, 0.5686275, 1,
1.392928, 1.665712, -1.634241, 1, 0, 0.5647059, 1,
1.39346, -0.5217197, 1.818953, 1, 0, 0.5568628, 1,
1.397646, 0.2924612, 1.345667, 1, 0, 0.5529412, 1,
1.400061, 0.7565114, 0.2518098, 1, 0, 0.5450981, 1,
1.400456, 0.3247325, -0.04691728, 1, 0, 0.5411765, 1,
1.404781, 0.1267486, 2.856713, 1, 0, 0.5333334, 1,
1.41198, -0.4160599, 2.406921, 1, 0, 0.5294118, 1,
1.4138, -1.133569, 2.156416, 1, 0, 0.5215687, 1,
1.431299, -0.9697069, 1.360904, 1, 0, 0.5176471, 1,
1.431492, -1.242608, 3.140897, 1, 0, 0.509804, 1,
1.440485, -0.7378031, 4.263052, 1, 0, 0.5058824, 1,
1.441215, -1.609037, 2.178658, 1, 0, 0.4980392, 1,
1.458576, -0.9731402, 1.726919, 1, 0, 0.4901961, 1,
1.46952, -1.784313, 2.205045, 1, 0, 0.4862745, 1,
1.474274, -0.1201988, 3.084726, 1, 0, 0.4784314, 1,
1.48242, 0.09906487, 1.96593, 1, 0, 0.4745098, 1,
1.497348, 0.08252122, 1.11174, 1, 0, 0.4666667, 1,
1.49836, -0.5373214, 2.849473, 1, 0, 0.4627451, 1,
1.499504, 0.778923, 1.197528, 1, 0, 0.454902, 1,
1.500379, -0.6645226, 2.839713, 1, 0, 0.4509804, 1,
1.507014, 0.4756188, 1.292679, 1, 0, 0.4431373, 1,
1.507097, -2.634226, 1.370718, 1, 0, 0.4392157, 1,
1.512197, 0.6817989, 0.002745506, 1, 0, 0.4313726, 1,
1.519277, 1.565598, 0.2342397, 1, 0, 0.427451, 1,
1.522921, 1.093268, 1.273489, 1, 0, 0.4196078, 1,
1.526601, 1.066187, 1.504527, 1, 0, 0.4156863, 1,
1.542694, 1.133778, 0.4844738, 1, 0, 0.4078431, 1,
1.549931, -0.3446633, 0.930514, 1, 0, 0.4039216, 1,
1.56558, -0.3580067, 2.301594, 1, 0, 0.3960784, 1,
1.5761, 0.05677251, 0.03873001, 1, 0, 0.3882353, 1,
1.576556, 1.539571, 0.5222073, 1, 0, 0.3843137, 1,
1.57864, -0.6771531, 2.617392, 1, 0, 0.3764706, 1,
1.579202, -2.245371, 2.085389, 1, 0, 0.372549, 1,
1.585258, -1.526074, 2.52432, 1, 0, 0.3647059, 1,
1.590082, -2.451514, 0.8650834, 1, 0, 0.3607843, 1,
1.608244, 1.17221, -0.04923156, 1, 0, 0.3529412, 1,
1.608325, -0.6077271, 2.536373, 1, 0, 0.3490196, 1,
1.624505, 1.545908, 1.130634, 1, 0, 0.3411765, 1,
1.654925, 0.5985468, 0.3602467, 1, 0, 0.3372549, 1,
1.662085, -0.3022047, 2.850101, 1, 0, 0.3294118, 1,
1.662989, 1.521129, 1.017748, 1, 0, 0.3254902, 1,
1.66412, 0.5092379, 2.862081, 1, 0, 0.3176471, 1,
1.678112, 0.3014501, 1.724616, 1, 0, 0.3137255, 1,
1.67957, 0.4530897, -0.1285862, 1, 0, 0.3058824, 1,
1.679803, -0.06018054, -0.0293282, 1, 0, 0.2980392, 1,
1.680957, -0.9884856, 1.899458, 1, 0, 0.2941177, 1,
1.683788, -0.1956498, 1.157268, 1, 0, 0.2862745, 1,
1.739168, -1.215856, 1.982005, 1, 0, 0.282353, 1,
1.744244, 0.3473513, 1.154022, 1, 0, 0.2745098, 1,
1.754767, 0.8952465, 1.866072, 1, 0, 0.2705882, 1,
1.766943, -0.9195542, 2.000177, 1, 0, 0.2627451, 1,
1.802008, 0.429729, -0.9928701, 1, 0, 0.2588235, 1,
1.805606, -0.007577017, 0.145346, 1, 0, 0.2509804, 1,
1.806636, -1.736387, 0.8787765, 1, 0, 0.2470588, 1,
1.815429, 1.92473, 0.8442988, 1, 0, 0.2392157, 1,
1.827417, -1.651923, 2.33481, 1, 0, 0.2352941, 1,
1.831694, -1.575142, 2.536371, 1, 0, 0.227451, 1,
1.846941, -1.077935, 2.553087, 1, 0, 0.2235294, 1,
1.862257, 1.309816, 0.715816, 1, 0, 0.2156863, 1,
1.865039, 0.7861558, 1.403231, 1, 0, 0.2117647, 1,
1.868217, -0.3542029, 1.116717, 1, 0, 0.2039216, 1,
1.876578, 0.660831, 1.602532, 1, 0, 0.1960784, 1,
1.878906, -0.5401206, 2.551005, 1, 0, 0.1921569, 1,
1.887831, -0.3248734, 2.168447, 1, 0, 0.1843137, 1,
1.894835, -0.656745, 1.58568, 1, 0, 0.1803922, 1,
1.895701, 0.5520468, 0.7449802, 1, 0, 0.172549, 1,
1.92308, -0.7016602, 0.5925198, 1, 0, 0.1686275, 1,
1.924358, -0.0635452, 2.001069, 1, 0, 0.1607843, 1,
1.957765, -1.647849, 0.6791747, 1, 0, 0.1568628, 1,
1.960207, -0.4033684, 2.26835, 1, 0, 0.1490196, 1,
1.963581, 0.3381863, 0.03879406, 1, 0, 0.145098, 1,
1.979579, 1.356785, -0.7396074, 1, 0, 0.1372549, 1,
2.009786, 0.06711256, 0.7994429, 1, 0, 0.1333333, 1,
2.01348, 0.1142302, 0.287295, 1, 0, 0.1254902, 1,
2.0254, -0.6665947, 1.524634, 1, 0, 0.1215686, 1,
2.060734, -0.4049694, 2.943726, 1, 0, 0.1137255, 1,
2.08119, 0.8643237, 1.513111, 1, 0, 0.1098039, 1,
2.101066, 0.4066217, 1.343438, 1, 0, 0.1019608, 1,
2.121179, 0.7324528, 0.6031501, 1, 0, 0.09411765, 1,
2.125058, -0.6011628, 2.204059, 1, 0, 0.09019608, 1,
2.179813, 1.068449, 0.1519994, 1, 0, 0.08235294, 1,
2.184206, 0.7009357, 2.946789, 1, 0, 0.07843138, 1,
2.217936, -0.6090025, 0.4739828, 1, 0, 0.07058824, 1,
2.21878, 1.153846, -0.1541191, 1, 0, 0.06666667, 1,
2.229707, 0.357719, -0.2659396, 1, 0, 0.05882353, 1,
2.37646, 0.2065819, 2.044935, 1, 0, 0.05490196, 1,
2.441303, 1.848998, 2.330277, 1, 0, 0.04705882, 1,
2.487957, 0.7615946, 0.8050128, 1, 0, 0.04313726, 1,
2.523576, -0.2613771, 2.408444, 1, 0, 0.03529412, 1,
2.546206, 0.2552035, 1.534229, 1, 0, 0.03137255, 1,
2.5857, -1.340386, 2.794058, 1, 0, 0.02352941, 1,
2.638689, -0.4029608, 0.5520368, 1, 0, 0.01960784, 1,
2.836142, -1.219267, 2.97749, 1, 0, 0.01176471, 1,
3.066713, 0.2553201, 1.096113, 1, 0, 0.007843138, 1
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
0.04692781, -4.617721, -7.299526, 0, -0.5, 0.5, 0.5,
0.04692781, -4.617721, -7.299526, 1, -0.5, 0.5, 0.5,
0.04692781, -4.617721, -7.299526, 1, 1.5, 0.5, 0.5,
0.04692781, -4.617721, -7.299526, 0, 1.5, 0.5, 0.5
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
-3.996565, -0.2334702, -7.299526, 0, -0.5, 0.5, 0.5,
-3.996565, -0.2334702, -7.299526, 1, -0.5, 0.5, 0.5,
-3.996565, -0.2334702, -7.299526, 1, 1.5, 0.5, 0.5,
-3.996565, -0.2334702, -7.299526, 0, 1.5, 0.5, 0.5
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
-3.996565, -4.617721, -0.201653, 0, -0.5, 0.5, 0.5,
-3.996565, -4.617721, -0.201653, 1, -0.5, 0.5, 0.5,
-3.996565, -4.617721, -0.201653, 1, 1.5, 0.5, 0.5,
-3.996565, -4.617721, -0.201653, 0, 1.5, 0.5, 0.5
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
-2, -3.605971, -5.661555,
3, -3.605971, -5.661555,
-2, -3.605971, -5.661555,
-2, -3.774595, -5.934551,
-1, -3.605971, -5.661555,
-1, -3.774595, -5.934551,
0, -3.605971, -5.661555,
0, -3.774595, -5.934551,
1, -3.605971, -5.661555,
1, -3.774595, -5.934551,
2, -3.605971, -5.661555,
2, -3.774595, -5.934551,
3, -3.605971, -5.661555,
3, -3.774595, -5.934551
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
-2, -4.111845, -6.480541, 0, -0.5, 0.5, 0.5,
-2, -4.111845, -6.480541, 1, -0.5, 0.5, 0.5,
-2, -4.111845, -6.480541, 1, 1.5, 0.5, 0.5,
-2, -4.111845, -6.480541, 0, 1.5, 0.5, 0.5,
-1, -4.111845, -6.480541, 0, -0.5, 0.5, 0.5,
-1, -4.111845, -6.480541, 1, -0.5, 0.5, 0.5,
-1, -4.111845, -6.480541, 1, 1.5, 0.5, 0.5,
-1, -4.111845, -6.480541, 0, 1.5, 0.5, 0.5,
0, -4.111845, -6.480541, 0, -0.5, 0.5, 0.5,
0, -4.111845, -6.480541, 1, -0.5, 0.5, 0.5,
0, -4.111845, -6.480541, 1, 1.5, 0.5, 0.5,
0, -4.111845, -6.480541, 0, 1.5, 0.5, 0.5,
1, -4.111845, -6.480541, 0, -0.5, 0.5, 0.5,
1, -4.111845, -6.480541, 1, -0.5, 0.5, 0.5,
1, -4.111845, -6.480541, 1, 1.5, 0.5, 0.5,
1, -4.111845, -6.480541, 0, 1.5, 0.5, 0.5,
2, -4.111845, -6.480541, 0, -0.5, 0.5, 0.5,
2, -4.111845, -6.480541, 1, -0.5, 0.5, 0.5,
2, -4.111845, -6.480541, 1, 1.5, 0.5, 0.5,
2, -4.111845, -6.480541, 0, 1.5, 0.5, 0.5,
3, -4.111845, -6.480541, 0, -0.5, 0.5, 0.5,
3, -4.111845, -6.480541, 1, -0.5, 0.5, 0.5,
3, -4.111845, -6.480541, 1, 1.5, 0.5, 0.5,
3, -4.111845, -6.480541, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.063451, -3, -5.661555,
-3.063451, 3, -5.661555,
-3.063451, -3, -5.661555,
-3.21897, -3, -5.934551,
-3.063451, -2, -5.661555,
-3.21897, -2, -5.934551,
-3.063451, -1, -5.661555,
-3.21897, -1, -5.934551,
-3.063451, 0, -5.661555,
-3.21897, 0, -5.934551,
-3.063451, 1, -5.661555,
-3.21897, 1, -5.934551,
-3.063451, 2, -5.661555,
-3.21897, 2, -5.934551,
-3.063451, 3, -5.661555,
-3.21897, 3, -5.934551
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
-3.530008, -3, -6.480541, 0, -0.5, 0.5, 0.5,
-3.530008, -3, -6.480541, 1, -0.5, 0.5, 0.5,
-3.530008, -3, -6.480541, 1, 1.5, 0.5, 0.5,
-3.530008, -3, -6.480541, 0, 1.5, 0.5, 0.5,
-3.530008, -2, -6.480541, 0, -0.5, 0.5, 0.5,
-3.530008, -2, -6.480541, 1, -0.5, 0.5, 0.5,
-3.530008, -2, -6.480541, 1, 1.5, 0.5, 0.5,
-3.530008, -2, -6.480541, 0, 1.5, 0.5, 0.5,
-3.530008, -1, -6.480541, 0, -0.5, 0.5, 0.5,
-3.530008, -1, -6.480541, 1, -0.5, 0.5, 0.5,
-3.530008, -1, -6.480541, 1, 1.5, 0.5, 0.5,
-3.530008, -1, -6.480541, 0, 1.5, 0.5, 0.5,
-3.530008, 0, -6.480541, 0, -0.5, 0.5, 0.5,
-3.530008, 0, -6.480541, 1, -0.5, 0.5, 0.5,
-3.530008, 0, -6.480541, 1, 1.5, 0.5, 0.5,
-3.530008, 0, -6.480541, 0, 1.5, 0.5, 0.5,
-3.530008, 1, -6.480541, 0, -0.5, 0.5, 0.5,
-3.530008, 1, -6.480541, 1, -0.5, 0.5, 0.5,
-3.530008, 1, -6.480541, 1, 1.5, 0.5, 0.5,
-3.530008, 1, -6.480541, 0, 1.5, 0.5, 0.5,
-3.530008, 2, -6.480541, 0, -0.5, 0.5, 0.5,
-3.530008, 2, -6.480541, 1, -0.5, 0.5, 0.5,
-3.530008, 2, -6.480541, 1, 1.5, 0.5, 0.5,
-3.530008, 2, -6.480541, 0, 1.5, 0.5, 0.5,
-3.530008, 3, -6.480541, 0, -0.5, 0.5, 0.5,
-3.530008, 3, -6.480541, 1, -0.5, 0.5, 0.5,
-3.530008, 3, -6.480541, 1, 1.5, 0.5, 0.5,
-3.530008, 3, -6.480541, 0, 1.5, 0.5, 0.5
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
-3.063451, -3.605971, -4,
-3.063451, -3.605971, 4,
-3.063451, -3.605971, -4,
-3.21897, -3.774595, -4,
-3.063451, -3.605971, -2,
-3.21897, -3.774595, -2,
-3.063451, -3.605971, 0,
-3.21897, -3.774595, 0,
-3.063451, -3.605971, 2,
-3.21897, -3.774595, 2,
-3.063451, -3.605971, 4,
-3.21897, -3.774595, 4
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
-3.530008, -4.111845, -4, 0, -0.5, 0.5, 0.5,
-3.530008, -4.111845, -4, 1, -0.5, 0.5, 0.5,
-3.530008, -4.111845, -4, 1, 1.5, 0.5, 0.5,
-3.530008, -4.111845, -4, 0, 1.5, 0.5, 0.5,
-3.530008, -4.111845, -2, 0, -0.5, 0.5, 0.5,
-3.530008, -4.111845, -2, 1, -0.5, 0.5, 0.5,
-3.530008, -4.111845, -2, 1, 1.5, 0.5, 0.5,
-3.530008, -4.111845, -2, 0, 1.5, 0.5, 0.5,
-3.530008, -4.111845, 0, 0, -0.5, 0.5, 0.5,
-3.530008, -4.111845, 0, 1, -0.5, 0.5, 0.5,
-3.530008, -4.111845, 0, 1, 1.5, 0.5, 0.5,
-3.530008, -4.111845, 0, 0, 1.5, 0.5, 0.5,
-3.530008, -4.111845, 2, 0, -0.5, 0.5, 0.5,
-3.530008, -4.111845, 2, 1, -0.5, 0.5, 0.5,
-3.530008, -4.111845, 2, 1, 1.5, 0.5, 0.5,
-3.530008, -4.111845, 2, 0, 1.5, 0.5, 0.5,
-3.530008, -4.111845, 4, 0, -0.5, 0.5, 0.5,
-3.530008, -4.111845, 4, 1, -0.5, 0.5, 0.5,
-3.530008, -4.111845, 4, 1, 1.5, 0.5, 0.5,
-3.530008, -4.111845, 4, 0, 1.5, 0.5, 0.5
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
-3.063451, -3.605971, -5.661555,
-3.063451, 3.13903, -5.661555,
-3.063451, -3.605971, 5.258249,
-3.063451, 3.13903, 5.258249,
-3.063451, -3.605971, -5.661555,
-3.063451, -3.605971, 5.258249,
-3.063451, 3.13903, -5.661555,
-3.063451, 3.13903, 5.258249,
-3.063451, -3.605971, -5.661555,
3.157307, -3.605971, -5.661555,
-3.063451, -3.605971, 5.258249,
3.157307, -3.605971, 5.258249,
-3.063451, 3.13903, -5.661555,
3.157307, 3.13903, -5.661555,
-3.063451, 3.13903, 5.258249,
3.157307, 3.13903, 5.258249,
3.157307, -3.605971, -5.661555,
3.157307, 3.13903, -5.661555,
3.157307, -3.605971, 5.258249,
3.157307, 3.13903, 5.258249,
3.157307, -3.605971, -5.661555,
3.157307, -3.605971, 5.258249,
3.157307, 3.13903, -5.661555,
3.157307, 3.13903, 5.258249
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
var radius = 7.6162;
var distance = 33.88533;
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
mvMatrix.translate( -0.04692781, 0.2334702, 0.201653 );
mvMatrix.scale( 1.323759, 1.220872, 0.7541146 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.88533);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Propionitril<-read.table("Propionitril.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propionitril$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propionitril' not found
```

```r
y<-Propionitril$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propionitril' not found
```

```r
z<-Propionitril$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propionitril' not found
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
-2.972858, -0.8109289, -0.7992237, 0, 0, 1, 1, 1,
-2.835951, -1.067097, -2.265063, 1, 0, 0, 1, 1,
-2.798568, -0.652623, -0.698736, 1, 0, 0, 1, 1,
-2.715652, 0.3005655, -0.9076996, 1, 0, 0, 1, 1,
-2.512146, 1.23901, -3.5777, 1, 0, 0, 1, 1,
-2.435446, 0.05489566, -2.78105, 1, 0, 0, 1, 1,
-2.401901, -1.098883, -2.223794, 0, 0, 0, 1, 1,
-2.375854, 1.577634, -2.197214, 0, 0, 0, 1, 1,
-2.356668, -0.267588, -1.297862, 0, 0, 0, 1, 1,
-2.303038, -0.6412787, -1.359219, 0, 0, 0, 1, 1,
-2.218635, -0.242692, -2.228545, 0, 0, 0, 1, 1,
-2.121215, 0.5891033, -0.08155764, 0, 0, 0, 1, 1,
-2.052723, -0.3418668, -0.3895412, 0, 0, 0, 1, 1,
-2.020402, 0.2119772, -1.05591, 1, 1, 1, 1, 1,
-1.982745, 0.6119328, -1.622895, 1, 1, 1, 1, 1,
-1.975424, -0.3287141, -3.472617, 1, 1, 1, 1, 1,
-1.961409, 0.432632, -0.8477152, 1, 1, 1, 1, 1,
-1.935626, 0.0907678, -1.492914, 1, 1, 1, 1, 1,
-1.926439, 0.7038522, -2.883045, 1, 1, 1, 1, 1,
-1.925576, 0.139571, -1.913211, 1, 1, 1, 1, 1,
-1.918644, -0.7760718, -1.889311, 1, 1, 1, 1, 1,
-1.916249, -0.02561884, -2.884133, 1, 1, 1, 1, 1,
-1.91518, 1.744869, -1.48753, 1, 1, 1, 1, 1,
-1.905756, 0.8477014, -0.8862182, 1, 1, 1, 1, 1,
-1.879612, -1.081343, -2.186535, 1, 1, 1, 1, 1,
-1.854872, 2.51421, 0.3178347, 1, 1, 1, 1, 1,
-1.848073, -1.640314, -3.152864, 1, 1, 1, 1, 1,
-1.790732, -1.606458, -2.26803, 1, 1, 1, 1, 1,
-1.778625, -0.1707715, -1.084805, 0, 0, 1, 1, 1,
-1.773464, -1.296047, -2.347375, 1, 0, 0, 1, 1,
-1.761281, 0.2665005, -0.6467555, 1, 0, 0, 1, 1,
-1.758011, 1.276659, 0.4971859, 1, 0, 0, 1, 1,
-1.750716, 0.530209, -0.4956338, 1, 0, 0, 1, 1,
-1.747653, 2.264004, -1.40673, 1, 0, 0, 1, 1,
-1.737286, 1.089617, 0.1777896, 0, 0, 0, 1, 1,
-1.732838, -0.924502, -3.73465, 0, 0, 0, 1, 1,
-1.722575, -0.1598903, -1.958397, 0, 0, 0, 1, 1,
-1.721376, -0.5757688, -2.245507, 0, 0, 0, 1, 1,
-1.716679, 0.2632778, -1.907856, 0, 0, 0, 1, 1,
-1.706049, -1.134882, -3.446703, 0, 0, 0, 1, 1,
-1.693087, 1.886736, 0.8296727, 0, 0, 0, 1, 1,
-1.684884, 0.4519315, -2.365801, 1, 1, 1, 1, 1,
-1.667256, 0.3301961, -0.757742, 1, 1, 1, 1, 1,
-1.661193, 0.6362961, -3.639156, 1, 1, 1, 1, 1,
-1.654305, -3.507742, -3.31784, 1, 1, 1, 1, 1,
-1.624283, -1.195193, -1.754185, 1, 1, 1, 1, 1,
-1.615859, 0.9040657, -1.968742, 1, 1, 1, 1, 1,
-1.593954, -1.13981, -1.962522, 1, 1, 1, 1, 1,
-1.591817, -1.950352, -1.161595, 1, 1, 1, 1, 1,
-1.588574, 0.7186989, 0.5398496, 1, 1, 1, 1, 1,
-1.587638, -1.365525, -4.122395, 1, 1, 1, 1, 1,
-1.5649, 0.3457041, -2.621846, 1, 1, 1, 1, 1,
-1.557344, 0.03586749, -1.178411, 1, 1, 1, 1, 1,
-1.548674, 1.308871, -0.2239936, 1, 1, 1, 1, 1,
-1.547345, -0.6013617, -4.507698, 1, 1, 1, 1, 1,
-1.539262, 0.2779789, -2.000017, 1, 1, 1, 1, 1,
-1.53902, 0.5707746, -1.48539, 0, 0, 1, 1, 1,
-1.535211, -0.06199881, 0.0755391, 1, 0, 0, 1, 1,
-1.533067, -0.6441745, -0.6136591, 1, 0, 0, 1, 1,
-1.522049, 0.7474537, -0.5348336, 1, 0, 0, 1, 1,
-1.521096, -0.2578635, -0.8782855, 1, 0, 0, 1, 1,
-1.514944, -0.4088186, -0.6902641, 1, 0, 0, 1, 1,
-1.505545, 0.08038884, 0.03614041, 0, 0, 0, 1, 1,
-1.501714, -0.1647515, -0.9014578, 0, 0, 0, 1, 1,
-1.493475, 0.6307302, -0.3615512, 0, 0, 0, 1, 1,
-1.476867, 0.2681097, -0.3504758, 0, 0, 0, 1, 1,
-1.476138, -0.526503, -1.321278, 0, 0, 0, 1, 1,
-1.473497, 1.132116, -0.117111, 0, 0, 0, 1, 1,
-1.467353, 0.3444457, -0.914535, 0, 0, 0, 1, 1,
-1.46612, 2.761731, 0.7376788, 1, 1, 1, 1, 1,
-1.462071, -1.350827, -2.252344, 1, 1, 1, 1, 1,
-1.455273, 0.6961828, -2.259361, 1, 1, 1, 1, 1,
-1.440151, 1.045195, 0.4044295, 1, 1, 1, 1, 1,
-1.436807, -1.089738, -1.731342, 1, 1, 1, 1, 1,
-1.427294, -0.2543037, -1.396711, 1, 1, 1, 1, 1,
-1.419383, -1.063538, -1.341885, 1, 1, 1, 1, 1,
-1.399664, 1.370802, 0.820898, 1, 1, 1, 1, 1,
-1.392084, -1.899628, -2.344283, 1, 1, 1, 1, 1,
-1.388802, -0.5662958, -0.6724243, 1, 1, 1, 1, 1,
-1.356314, 0.148646, -2.487747, 1, 1, 1, 1, 1,
-1.354277, -1.478151, -2.0943, 1, 1, 1, 1, 1,
-1.353587, 1.616306, -0.4472163, 1, 1, 1, 1, 1,
-1.352151, 1.152273, -1.439768, 1, 1, 1, 1, 1,
-1.352105, 0.5783993, -1.426462, 1, 1, 1, 1, 1,
-1.347163, 0.01984839, -0.556173, 0, 0, 1, 1, 1,
-1.345552, 0.08938943, -1.177474, 1, 0, 0, 1, 1,
-1.342528, 1.745216, -0.7697831, 1, 0, 0, 1, 1,
-1.339517, 1.818284, -0.9775958, 1, 0, 0, 1, 1,
-1.337638, -0.5558164, -1.020985, 1, 0, 0, 1, 1,
-1.31671, 0.2479981, -2.574145, 1, 0, 0, 1, 1,
-1.307111, 0.9632704, -1.327049, 0, 0, 0, 1, 1,
-1.305948, -0.1819536, 0.8379095, 0, 0, 0, 1, 1,
-1.288883, -0.5212405, -1.810853, 0, 0, 0, 1, 1,
-1.286098, 1.691347, -0.5755122, 0, 0, 0, 1, 1,
-1.285233, -0.2847309, -1.916503, 0, 0, 0, 1, 1,
-1.284884, -0.04016688, -0.6841364, 0, 0, 0, 1, 1,
-1.28006, -1.99606, -3.197899, 0, 0, 0, 1, 1,
-1.279702, 1.197034, -1.161469, 1, 1, 1, 1, 1,
-1.279313, -1.160676, -3.200106, 1, 1, 1, 1, 1,
-1.275642, -0.4057818, -0.4249623, 1, 1, 1, 1, 1,
-1.270007, -0.6536843, -2.187016, 1, 1, 1, 1, 1,
-1.26632, 1.412683, -1.577771, 1, 1, 1, 1, 1,
-1.265996, -0.6473963, 0.4531047, 1, 1, 1, 1, 1,
-1.26308, -0.5154783, -0.8428478, 1, 1, 1, 1, 1,
-1.251295, 1.418333, -0.4971603, 1, 1, 1, 1, 1,
-1.247646, 0.9696172, -0.5187146, 1, 1, 1, 1, 1,
-1.246317, 0.7282198, -1.621932, 1, 1, 1, 1, 1,
-1.241421, -0.3057792, -1.917453, 1, 1, 1, 1, 1,
-1.239291, -1.883263, -1.891368, 1, 1, 1, 1, 1,
-1.23751, 0.4659117, -1.292502, 1, 1, 1, 1, 1,
-1.234386, 0.001089841, -1.655432, 1, 1, 1, 1, 1,
-1.232203, 0.1422101, -1.521181, 1, 1, 1, 1, 1,
-1.225946, -0.4515798, -1.406318, 0, 0, 1, 1, 1,
-1.20629, -0.9966587, -0.8477562, 1, 0, 0, 1, 1,
-1.205052, -0.2595106, -3.036048, 1, 0, 0, 1, 1,
-1.195911, 0.5242781, -0.844184, 1, 0, 0, 1, 1,
-1.189103, -1.024863, 0.08382144, 1, 0, 0, 1, 1,
-1.182477, 0.7175836, -1.199303, 1, 0, 0, 1, 1,
-1.172749, 0.1216118, -2.427301, 0, 0, 0, 1, 1,
-1.170608, 0.05302683, -2.335403, 0, 0, 0, 1, 1,
-1.165997, 0.1499511, -1.680049, 0, 0, 0, 1, 1,
-1.162745, 1.670971, -1.38552, 0, 0, 0, 1, 1,
-1.16167, -0.8447849, -3.624807, 0, 0, 0, 1, 1,
-1.158205, -0.6706182, -1.086544, 0, 0, 0, 1, 1,
-1.153741, -0.1736924, -0.9162489, 0, 0, 0, 1, 1,
-1.149851, -0.6003329, -2.10551, 1, 1, 1, 1, 1,
-1.147346, 0.1506967, -2.181546, 1, 1, 1, 1, 1,
-1.142404, -0.7429211, -2.562563, 1, 1, 1, 1, 1,
-1.140046, -0.02494132, -1.390919, 1, 1, 1, 1, 1,
-1.139699, -0.02105684, -1.229235, 1, 1, 1, 1, 1,
-1.139364, -0.2082884, -2.750217, 1, 1, 1, 1, 1,
-1.138075, -1.166826, -1.769933, 1, 1, 1, 1, 1,
-1.136361, -1.656979, -1.762066, 1, 1, 1, 1, 1,
-1.131874, -1.532147, -2.897203, 1, 1, 1, 1, 1,
-1.125994, 0.2302018, -3.497076, 1, 1, 1, 1, 1,
-1.124915, -0.9774002, -2.608616, 1, 1, 1, 1, 1,
-1.123436, 0.0784766, -2.4087, 1, 1, 1, 1, 1,
-1.117704, -0.4931068, -0.9341858, 1, 1, 1, 1, 1,
-1.112956, 0.3582633, -1.99824, 1, 1, 1, 1, 1,
-1.112656, -1.055825, -3.019716, 1, 1, 1, 1, 1,
-1.107871, 2.655664, -0.8447452, 0, 0, 1, 1, 1,
-1.104166, 0.005062507, -3.419132, 1, 0, 0, 1, 1,
-1.093561, -0.02994201, -3.179961, 1, 0, 0, 1, 1,
-1.087611, -1.102752, -1.487272, 1, 0, 0, 1, 1,
-1.083645, -1.468471, -1.874088, 1, 0, 0, 1, 1,
-1.083208, 0.7540237, -0.6251574, 1, 0, 0, 1, 1,
-1.08202, -1.007504, -1.073317, 0, 0, 0, 1, 1,
-1.081779, 0.234472, -0.3511076, 0, 0, 0, 1, 1,
-1.081121, 1.060463, -0.02150389, 0, 0, 0, 1, 1,
-1.078297, -2.158013, -2.886724, 0, 0, 0, 1, 1,
-1.075726, -0.8229682, -1.863159, 0, 0, 0, 1, 1,
-1.074433, 1.034728, -1.122298, 0, 0, 0, 1, 1,
-1.067954, -0.7214716, -2.745097, 0, 0, 0, 1, 1,
-1.067897, -0.3841049, -2.095479, 1, 1, 1, 1, 1,
-1.064739, 0.1186558, -2.565389, 1, 1, 1, 1, 1,
-1.061545, -0.568714, -2.789003, 1, 1, 1, 1, 1,
-1.061442, 0.4269416, 1.161771, 1, 1, 1, 1, 1,
-1.056464, 3.040802, 0.3112164, 1, 1, 1, 1, 1,
-1.043582, -0.6672279, -2.025196, 1, 1, 1, 1, 1,
-1.042357, -1.430076, -2.053793, 1, 1, 1, 1, 1,
-1.040728, -0.5935273, -2.15088, 1, 1, 1, 1, 1,
-1.036594, -0.3652923, -1.340254, 1, 1, 1, 1, 1,
-1.033994, 0.8145812, 0.3376501, 1, 1, 1, 1, 1,
-1.031511, 0.01944925, -2.179467, 1, 1, 1, 1, 1,
-1.030664, 1.610275, -0.5057593, 1, 1, 1, 1, 1,
-1.030355, -1.416863, -0.332702, 1, 1, 1, 1, 1,
-1.028374, -0.03723114, -0.2195277, 1, 1, 1, 1, 1,
-1.026003, -1.357408, -3.70119, 1, 1, 1, 1, 1,
-1.022507, 0.8770056, -0.6878642, 0, 0, 1, 1, 1,
-1.020066, -1.355982, -1.933547, 1, 0, 0, 1, 1,
-1.019672, -0.5861253, -3.425972, 1, 0, 0, 1, 1,
-1.019162, 2.088077, -0.8134227, 1, 0, 0, 1, 1,
-1.010169, -0.5773255, -0.5097489, 1, 0, 0, 1, 1,
-1.008247, 0.8365465, -1.387303, 1, 0, 0, 1, 1,
-1.00298, -0.6788277, 0.5637, 0, 0, 0, 1, 1,
-1.001401, -1.834563, -2.852512, 0, 0, 0, 1, 1,
-0.9911146, 0.4744638, -3.04029, 0, 0, 0, 1, 1,
-0.9901762, 0.03060593, -0.009269973, 0, 0, 0, 1, 1,
-0.9830003, -0.6049355, -3.656428, 0, 0, 0, 1, 1,
-0.973479, 1.400709, -1.041352, 0, 0, 0, 1, 1,
-0.9691724, -0.9488196, -2.479195, 0, 0, 0, 1, 1,
-0.9673726, -0.6020579, -3.138484, 1, 1, 1, 1, 1,
-0.9620237, 0.3776249, -1.173879, 1, 1, 1, 1, 1,
-0.9590457, 1.413213, -0.675487, 1, 1, 1, 1, 1,
-0.9529648, -1.487438, -3.370584, 1, 1, 1, 1, 1,
-0.9486825, -0.9568272, -1.744088, 1, 1, 1, 1, 1,
-0.9477109, 1.094596, 0.2019192, 1, 1, 1, 1, 1,
-0.9408432, -0.6372164, -2.195757, 1, 1, 1, 1, 1,
-0.9391679, -0.1947404, -0.1106009, 1, 1, 1, 1, 1,
-0.9333748, -0.3042874, -2.495245, 1, 1, 1, 1, 1,
-0.9290382, -2.896864, -3.654114, 1, 1, 1, 1, 1,
-0.9238319, -1.46847, -3.235444, 1, 1, 1, 1, 1,
-0.9218774, 0.774795, -1.260762, 1, 1, 1, 1, 1,
-0.9182231, -1.270979, -2.680557, 1, 1, 1, 1, 1,
-0.9158667, 2.257582, -2.436168, 1, 1, 1, 1, 1,
-0.9146731, 0.5662236, -1.157292, 1, 1, 1, 1, 1,
-0.9144979, 0.7353752, -1.568155, 0, 0, 1, 1, 1,
-0.9141442, 1.444422, 0.365292, 1, 0, 0, 1, 1,
-0.9134758, -0.04476265, -2.919939, 1, 0, 0, 1, 1,
-0.9088821, -0.2219827, -2.062892, 1, 0, 0, 1, 1,
-0.9029012, -0.9009116, -3.345745, 1, 0, 0, 1, 1,
-0.8964661, 0.4029633, -1.404766, 1, 0, 0, 1, 1,
-0.8949697, 0.3675365, -1.464759, 0, 0, 0, 1, 1,
-0.8921535, 1.795631, -1.182944, 0, 0, 0, 1, 1,
-0.8910186, 0.5776038, -0.9255881, 0, 0, 0, 1, 1,
-0.8900632, -0.11056, -1.211621, 0, 0, 0, 1, 1,
-0.8814377, -1.169181, -2.619576, 0, 0, 0, 1, 1,
-0.8804388, -0.7091861, -2.827805, 0, 0, 0, 1, 1,
-0.8799004, -1.875213, -3.036717, 0, 0, 0, 1, 1,
-0.871065, 0.6275249, 0.2250336, 1, 1, 1, 1, 1,
-0.8661311, -0.2464125, -2.419814, 1, 1, 1, 1, 1,
-0.8575746, -0.8782176, -2.195076, 1, 1, 1, 1, 1,
-0.8486035, 0.6673645, -0.6157698, 1, 1, 1, 1, 1,
-0.8468414, -1.369263, -1.976757, 1, 1, 1, 1, 1,
-0.8421217, -0.3916823, -3.61979, 1, 1, 1, 1, 1,
-0.8408492, -0.4789656, -2.254237, 1, 1, 1, 1, 1,
-0.8327706, 2.302394, -1.266749, 1, 1, 1, 1, 1,
-0.8327308, 1.812303, 0.131069, 1, 1, 1, 1, 1,
-0.8258648, -1.868302, -3.375955, 1, 1, 1, 1, 1,
-0.8236787, -0.787881, -3.475122, 1, 1, 1, 1, 1,
-0.8228654, -1.176239, -2.864925, 1, 1, 1, 1, 1,
-0.8224887, 0.3856196, -1.354328, 1, 1, 1, 1, 1,
-0.8177664, -1.421213, -2.785593, 1, 1, 1, 1, 1,
-0.8141717, -1.406512, -2.418913, 1, 1, 1, 1, 1,
-0.8113258, 0.8035663, -0.7660075, 0, 0, 1, 1, 1,
-0.8093717, -0.4898566, -2.954139, 1, 0, 0, 1, 1,
-0.8087577, 0.7730838, -1.915171, 1, 0, 0, 1, 1,
-0.8040333, 0.7109274, -0.7316262, 1, 0, 0, 1, 1,
-0.7903426, 0.5599885, 1.302689, 1, 0, 0, 1, 1,
-0.7877163, -1.796793, -2.439559, 1, 0, 0, 1, 1,
-0.7825009, -0.8223366, -1.273704, 0, 0, 0, 1, 1,
-0.7816117, 1.42502, -0.1826712, 0, 0, 0, 1, 1,
-0.7815199, -2.372714, -4.025225, 0, 0, 0, 1, 1,
-0.7758796, -0.1160396, -2.178412, 0, 0, 0, 1, 1,
-0.7714869, -0.6691636, -1.463079, 0, 0, 0, 1, 1,
-0.7642651, -0.350716, -1.890718, 0, 0, 0, 1, 1,
-0.7625957, 0.1274417, -1.980921, 0, 0, 0, 1, 1,
-0.7625098, -0.4394044, -3.839642, 1, 1, 1, 1, 1,
-0.7615545, -1.151791, -2.642584, 1, 1, 1, 1, 1,
-0.7614256, 1.659324, 0.05363093, 1, 1, 1, 1, 1,
-0.7545624, -0.09192776, -2.597482, 1, 1, 1, 1, 1,
-0.7515152, -0.5932972, -3.762663, 1, 1, 1, 1, 1,
-0.7473498, 1.945989, -0.9598155, 1, 1, 1, 1, 1,
-0.7453728, -2.894416, -2.229465, 1, 1, 1, 1, 1,
-0.7443723, -0.4356341, -1.344378, 1, 1, 1, 1, 1,
-0.7425718, 0.4099422, -1.472427, 1, 1, 1, 1, 1,
-0.7329539, -2.939256, -2.70353, 1, 1, 1, 1, 1,
-0.7317046, 1.141687, -0.7944627, 1, 1, 1, 1, 1,
-0.7264353, 0.7749127, -0.7850281, 1, 1, 1, 1, 1,
-0.7188446, -1.155916, -1.716802, 1, 1, 1, 1, 1,
-0.7152867, 0.7982147, -1.631729, 1, 1, 1, 1, 1,
-0.7051411, 0.1148996, -0.3170103, 1, 1, 1, 1, 1,
-0.7011371, 0.1615995, -2.393305, 0, 0, 1, 1, 1,
-0.7003484, 1.786992, -0.7445632, 1, 0, 0, 1, 1,
-0.6998914, 0.275175, 1.444111, 1, 0, 0, 1, 1,
-0.6960184, 0.1514662, -2.421569, 1, 0, 0, 1, 1,
-0.69204, -0.4826545, -1.497837, 1, 0, 0, 1, 1,
-0.6906797, 0.1601019, -1.965652, 1, 0, 0, 1, 1,
-0.6874357, -0.966274, -3.68508, 0, 0, 0, 1, 1,
-0.6821486, 0.91812, -0.7209916, 0, 0, 0, 1, 1,
-0.676358, 2.197075, -0.01275922, 0, 0, 0, 1, 1,
-0.6751764, 0.3524964, -1.428352, 0, 0, 0, 1, 1,
-0.6734441, 1.831132, -1.63722, 0, 0, 0, 1, 1,
-0.6688361, -1.317697, -3.14997, 0, 0, 0, 1, 1,
-0.6614658, -1.798696, -2.495636, 0, 0, 0, 1, 1,
-0.6595285, 1.768605, 0.06965761, 1, 1, 1, 1, 1,
-0.6552334, 1.685232, -0.06408437, 1, 1, 1, 1, 1,
-0.6483877, -0.05648437, -2.181653, 1, 1, 1, 1, 1,
-0.6405713, 0.07821518, -1.941744, 1, 1, 1, 1, 1,
-0.6394614, -0.3370743, -2.218284, 1, 1, 1, 1, 1,
-0.6372492, -1.272883, -2.889193, 1, 1, 1, 1, 1,
-0.635044, -0.02927161, -2.101016, 1, 1, 1, 1, 1,
-0.625964, 2.046304, -0.9416995, 1, 1, 1, 1, 1,
-0.6241969, 1.073627, 1.259677, 1, 1, 1, 1, 1,
-0.6126964, -1.232449, -3.528522, 1, 1, 1, 1, 1,
-0.6125927, -0.9635249, -2.230875, 1, 1, 1, 1, 1,
-0.6119366, -0.8609994, -2.042593, 1, 1, 1, 1, 1,
-0.6118934, 1.196349, 0.1727648, 1, 1, 1, 1, 1,
-0.6094586, 0.3381255, -0.5003344, 1, 1, 1, 1, 1,
-0.6046261, -0.2781788, -1.96879, 1, 1, 1, 1, 1,
-0.6041471, 1.32239, -0.7315483, 0, 0, 1, 1, 1,
-0.6039153, 1.085181, 0.4835413, 1, 0, 0, 1, 1,
-0.6018199, -1.047685, -2.98064, 1, 0, 0, 1, 1,
-0.5977467, -0.1553914, -2.372521, 1, 0, 0, 1, 1,
-0.5959213, 1.249302, 0.8312175, 1, 0, 0, 1, 1,
-0.5916905, 1.264111, -0.4652659, 1, 0, 0, 1, 1,
-0.590291, -0.5788857, -1.136932, 0, 0, 0, 1, 1,
-0.5897468, 0.2127074, -0.8364598, 0, 0, 0, 1, 1,
-0.5873985, 0.2335513, 0.8653191, 0, 0, 0, 1, 1,
-0.5863924, 0.2893409, -0.1196029, 0, 0, 0, 1, 1,
-0.5842586, 0.821779, -0.7269751, 0, 0, 0, 1, 1,
-0.5797303, 0.8284774, -1.247154, 0, 0, 0, 1, 1,
-0.5777871, 0.5226138, 0.3597169, 0, 0, 0, 1, 1,
-0.5769224, 0.9540566, 2.371113, 1, 1, 1, 1, 1,
-0.5769217, -0.4879101, -3.577129, 1, 1, 1, 1, 1,
-0.5697655, -1.314379, -2.465694, 1, 1, 1, 1, 1,
-0.5686977, -0.2609843, -1.358754, 1, 1, 1, 1, 1,
-0.5676774, 0.259697, -0.6417769, 1, 1, 1, 1, 1,
-0.5673506, -0.641351, -1.652793, 1, 1, 1, 1, 1,
-0.5662324, 0.1444372, -0.009638386, 1, 1, 1, 1, 1,
-0.5640984, 1.185744, -0.1531804, 1, 1, 1, 1, 1,
-0.5585459, 2.26947, 1.010791, 1, 1, 1, 1, 1,
-0.5556086, -0.05507111, -3.989969, 1, 1, 1, 1, 1,
-0.553202, 0.2585867, -1.506271, 1, 1, 1, 1, 1,
-0.5529755, -0.9372561, -3.999235, 1, 1, 1, 1, 1,
-0.551937, -0.06501861, -2.810281, 1, 1, 1, 1, 1,
-0.5510115, 0.01683162, 0.1193827, 1, 1, 1, 1, 1,
-0.5499072, 0.3826043, -1.409591, 1, 1, 1, 1, 1,
-0.5450909, -0.7965899, -2.672515, 0, 0, 1, 1, 1,
-0.5431156, -2.709768, -5.502529, 1, 0, 0, 1, 1,
-0.5422009, 0.6201588, -1.241415, 1, 0, 0, 1, 1,
-0.5409681, 1.78468, -1.017448, 1, 0, 0, 1, 1,
-0.5395583, 1.227701, -0.5602971, 1, 0, 0, 1, 1,
-0.5380523, 1.92465, 0.6840945, 1, 0, 0, 1, 1,
-0.5368429, 0.5894034, -2.529987, 0, 0, 0, 1, 1,
-0.5339175, 0.4834649, -0.1075893, 0, 0, 0, 1, 1,
-0.5339084, 0.3567506, -0.1947279, 0, 0, 0, 1, 1,
-0.5322229, -1.537874, -4.245812, 0, 0, 0, 1, 1,
-0.5274978, 0.07365913, -1.511605, 0, 0, 0, 1, 1,
-0.526893, -1.230755, -1.575368, 0, 0, 0, 1, 1,
-0.5230596, -1.069846, -3.040496, 0, 0, 0, 1, 1,
-0.5203072, 1.166708, -0.9902276, 1, 1, 1, 1, 1,
-0.5163031, 0.6378782, -0.4703723, 1, 1, 1, 1, 1,
-0.5116019, -0.5055804, -2.075938, 1, 1, 1, 1, 1,
-0.5107514, -0.2124446, -1.442686, 1, 1, 1, 1, 1,
-0.5092441, 1.871877, 1.363344, 1, 1, 1, 1, 1,
-0.5051351, -0.5503865, -2.387321, 1, 1, 1, 1, 1,
-0.5026902, -0.02049674, -1.023927, 1, 1, 1, 1, 1,
-0.5021132, 0.09228184, -0.1255937, 1, 1, 1, 1, 1,
-0.4974134, -1.117587, -2.551082, 1, 1, 1, 1, 1,
-0.4941893, -0.7436902, -2.267353, 1, 1, 1, 1, 1,
-0.4924865, 0.4339757, -2.647835, 1, 1, 1, 1, 1,
-0.4898036, 0.6080716, -1.227851, 1, 1, 1, 1, 1,
-0.4888285, -0.07932729, -2.766386, 1, 1, 1, 1, 1,
-0.4883668, 0.2863417, -1.184307, 1, 1, 1, 1, 1,
-0.4869891, 0.06513509, -1.127789, 1, 1, 1, 1, 1,
-0.4813493, 0.4379078, -3.295288, 0, 0, 1, 1, 1,
-0.4781162, 0.7627862, 0.4813643, 1, 0, 0, 1, 1,
-0.4776921, -1.222158, -3.999175, 1, 0, 0, 1, 1,
-0.4735494, 0.7826561, 0.4500013, 1, 0, 0, 1, 1,
-0.4727267, 1.140893, -1.956856, 1, 0, 0, 1, 1,
-0.4722236, 1.14709, 0.307703, 1, 0, 0, 1, 1,
-0.4718182, -2.112479, -2.288795, 0, 0, 0, 1, 1,
-0.4658859, 0.3247951, -0.9240119, 0, 0, 0, 1, 1,
-0.4635138, -0.4757976, -2.831977, 0, 0, 0, 1, 1,
-0.4611612, -0.08677309, -0.02109453, 0, 0, 0, 1, 1,
-0.450493, 0.5614942, -0.7735108, 0, 0, 0, 1, 1,
-0.4470302, -0.7308244, -1.974662, 0, 0, 0, 1, 1,
-0.4435201, -0.6856565, -2.433376, 0, 0, 0, 1, 1,
-0.440201, 0.6997486, -0.3343806, 1, 1, 1, 1, 1,
-0.4400928, 1.349883, 0.4051861, 1, 1, 1, 1, 1,
-0.4370595, -0.8675559, -4.068021, 1, 1, 1, 1, 1,
-0.4346419, 0.9272882, -1.128273, 1, 1, 1, 1, 1,
-0.4198438, -0.4337934, 0.09550306, 1, 1, 1, 1, 1,
-0.4190661, -1.507028, -1.878058, 1, 1, 1, 1, 1,
-0.4174269, -1.715445, -1.737761, 1, 1, 1, 1, 1,
-0.4144605, -0.7678171, -1.72915, 1, 1, 1, 1, 1,
-0.4130986, -1.24337, -3.255463, 1, 1, 1, 1, 1,
-0.410326, 1.695002, -0.4040945, 1, 1, 1, 1, 1,
-0.4076268, 0.541542, 0.01942712, 1, 1, 1, 1, 1,
-0.4046611, 1.457129, -1.2317, 1, 1, 1, 1, 1,
-0.400157, -1.045948, -3.263837, 1, 1, 1, 1, 1,
-0.3989417, 0.0790803, -1.921883, 1, 1, 1, 1, 1,
-0.3983559, -0.3177453, -1.773678, 1, 1, 1, 1, 1,
-0.3945107, 0.3500142, -0.01228411, 0, 0, 1, 1, 1,
-0.3904971, 0.09258945, -0.4547918, 1, 0, 0, 1, 1,
-0.3870565, 1.355761, -0.6551031, 1, 0, 0, 1, 1,
-0.3765459, -0.3178326, -2.62986, 1, 0, 0, 1, 1,
-0.3761103, 2.113309, 0.1115778, 1, 0, 0, 1, 1,
-0.3685203, -0.07357041, -2.271894, 1, 0, 0, 1, 1,
-0.3641943, -1.478733, -3.676001, 0, 0, 0, 1, 1,
-0.3623627, -1.614478, -2.585165, 0, 0, 0, 1, 1,
-0.3562475, -0.1359428, -1.775772, 0, 0, 0, 1, 1,
-0.3536317, 0.7065378, -1.58134, 0, 0, 0, 1, 1,
-0.349433, 0.08414355, -1.177821, 0, 0, 0, 1, 1,
-0.3399154, 0.80321, -0.9355408, 0, 0, 0, 1, 1,
-0.3382503, -0.9574677, -1.953583, 0, 0, 0, 1, 1,
-0.338035, 0.3557513, 0.07297789, 1, 1, 1, 1, 1,
-0.3361448, 0.722725, 1.11596, 1, 1, 1, 1, 1,
-0.324636, -1.543385, -2.537899, 1, 1, 1, 1, 1,
-0.3230403, 1.976099, 0.579596, 1, 1, 1, 1, 1,
-0.3220157, -0.1921576, 0.08808274, 1, 1, 1, 1, 1,
-0.3217611, 1.437671, 0.2075312, 1, 1, 1, 1, 1,
-0.3211058, 0.05373385, -1.526595, 1, 1, 1, 1, 1,
-0.3183986, 1.010502, 0.5750822, 1, 1, 1, 1, 1,
-0.3181045, -0.06451522, -2.372922, 1, 1, 1, 1, 1,
-0.3178678, 0.3798225, -0.7721816, 1, 1, 1, 1, 1,
-0.3159293, -1.005887, -2.980077, 1, 1, 1, 1, 1,
-0.3150843, 1.087785, -0.6284003, 1, 1, 1, 1, 1,
-0.3099973, -0.1757234, -3.323051, 1, 1, 1, 1, 1,
-0.3084526, -0.9505821, -3.058702, 1, 1, 1, 1, 1,
-0.307383, 1.934471, -0.5534164, 1, 1, 1, 1, 1,
-0.3062372, -1.777341, -1.855392, 0, 0, 1, 1, 1,
-0.3055682, -0.2464845, -2.8655, 1, 0, 0, 1, 1,
-0.3022658, 1.830552, 0.3196553, 1, 0, 0, 1, 1,
-0.2943729, -1.410455, -3.874604, 1, 0, 0, 1, 1,
-0.291208, 0.08396474, -0.3392388, 1, 0, 0, 1, 1,
-0.2864304, -0.8403302, -4.059566, 1, 0, 0, 1, 1,
-0.2770956, 0.8316432, -0.2350724, 0, 0, 0, 1, 1,
-0.2754286, 1.048344, -0.002718694, 0, 0, 0, 1, 1,
-0.2736635, 1.158033, -0.1547963, 0, 0, 0, 1, 1,
-0.2706479, 0.2560274, -2.279726, 0, 0, 0, 1, 1,
-0.2649074, 0.426277, -0.3134783, 0, 0, 0, 1, 1,
-0.2557377, 1.565711, 1.241664, 0, 0, 0, 1, 1,
-0.2549239, -0.6687368, -2.230832, 0, 0, 0, 1, 1,
-0.2532463, -1.239271, -3.373469, 1, 1, 1, 1, 1,
-0.2512528, -1.762962, -5.153521, 1, 1, 1, 1, 1,
-0.2491381, -0.6995221, -4.512031, 1, 1, 1, 1, 1,
-0.2407163, 0.05871639, -1.875959, 1, 1, 1, 1, 1,
-0.2381036, -0.1646062, -4.348892, 1, 1, 1, 1, 1,
-0.2338985, -0.09038126, -3.578217, 1, 1, 1, 1, 1,
-0.2334824, -1.630813, -3.197537, 1, 1, 1, 1, 1,
-0.2299611, 0.7725123, -0.6581458, 1, 1, 1, 1, 1,
-0.2290313, 0.8844091, -0.2739168, 1, 1, 1, 1, 1,
-0.2245674, 1.483389, -0.6734527, 1, 1, 1, 1, 1,
-0.2228647, 1.126052, -0.8598521, 1, 1, 1, 1, 1,
-0.2188938, 0.2454826, -0.1850356, 1, 1, 1, 1, 1,
-0.2181149, 0.2044846, -1.557006, 1, 1, 1, 1, 1,
-0.2154791, 0.9243335, -2.109678, 1, 1, 1, 1, 1,
-0.2143071, -1.360872, -3.15021, 1, 1, 1, 1, 1,
-0.2140045, 0.1087564, -1.663051, 0, 0, 1, 1, 1,
-0.2103288, -0.6938958, -3.036658, 1, 0, 0, 1, 1,
-0.2077547, 1.515102, -0.282787, 1, 0, 0, 1, 1,
-0.2001118, -0.1000583, -1.178087, 1, 0, 0, 1, 1,
-0.1992412, -0.1683101, -2.901138, 1, 0, 0, 1, 1,
-0.1983624, 1.061888, 1.120158, 1, 0, 0, 1, 1,
-0.196146, 1.424073, 0.725067, 0, 0, 0, 1, 1,
-0.1945083, -0.1348454, -3.572356, 0, 0, 0, 1, 1,
-0.1885679, -0.9900523, -1.770333, 0, 0, 0, 1, 1,
-0.188455, 0.9333544, -0.8876374, 0, 0, 0, 1, 1,
-0.188168, -1.564556, -3.436443, 0, 0, 0, 1, 1,
-0.1878494, -2.610682, -2.907157, 0, 0, 0, 1, 1,
-0.1875414, 0.006600781, -0.5068956, 0, 0, 0, 1, 1,
-0.1871771, -0.3121775, -1.267073, 1, 1, 1, 1, 1,
-0.185081, 0.3909958, -1.05523, 1, 1, 1, 1, 1,
-0.1849994, 1.149812, -0.5538061, 1, 1, 1, 1, 1,
-0.1845023, -2.313425, -1.995521, 1, 1, 1, 1, 1,
-0.1799042, -0.7607923, -2.566276, 1, 1, 1, 1, 1,
-0.1769496, -0.9668392, -3.104099, 1, 1, 1, 1, 1,
-0.1766705, -0.1982509, -1.582167, 1, 1, 1, 1, 1,
-0.1748098, -1.844518, -4.098477, 1, 1, 1, 1, 1,
-0.1720504, 0.3149471, -1.884566, 1, 1, 1, 1, 1,
-0.1681452, -1.62189, -2.838374, 1, 1, 1, 1, 1,
-0.1673398, -0.9058021, -4.173812, 1, 1, 1, 1, 1,
-0.1615269, 0.1749828, -3.199364, 1, 1, 1, 1, 1,
-0.1611572, -0.0171007, -2.628015, 1, 1, 1, 1, 1,
-0.1554384, -0.6884643, -3.703384, 1, 1, 1, 1, 1,
-0.154966, 0.3456331, -1.004255, 1, 1, 1, 1, 1,
-0.1545595, -0.7662446, -2.201064, 0, 0, 1, 1, 1,
-0.152657, 0.8865283, -0.2041755, 1, 0, 0, 1, 1,
-0.1504683, -0.7573302, -3.472563, 1, 0, 0, 1, 1,
-0.1463784, -0.5288817, -2.645329, 1, 0, 0, 1, 1,
-0.1404298, 1.803053, -0.2449085, 1, 0, 0, 1, 1,
-0.136266, -0.1846215, -3.413966, 1, 0, 0, 1, 1,
-0.1338045, -0.007242769, -1.8024, 0, 0, 0, 1, 1,
-0.1239325, -0.8585334, -3.332363, 0, 0, 0, 1, 1,
-0.1229289, 0.8614433, -1.218363, 0, 0, 0, 1, 1,
-0.1187714, -0.535579, -3.330618, 0, 0, 0, 1, 1,
-0.1173461, 0.4415457, 0.6065242, 0, 0, 0, 1, 1,
-0.1173003, -0.3051167, -4.50793, 0, 0, 0, 1, 1,
-0.1089726, -0.2599211, -2.349461, 0, 0, 0, 1, 1,
-0.1036041, -1.329427, -4.123136, 1, 1, 1, 1, 1,
-0.09601563, 0.0260121, -1.202516, 1, 1, 1, 1, 1,
-0.09376812, 0.6507034, -0.5772097, 1, 1, 1, 1, 1,
-0.09368562, -0.5508194, -4.64102, 1, 1, 1, 1, 1,
-0.09231158, 2.179611, -0.744055, 1, 1, 1, 1, 1,
-0.09143822, 0.7310043, 0.8580783, 1, 1, 1, 1, 1,
-0.0854282, 1.159901, 0.8659335, 1, 1, 1, 1, 1,
-0.08320548, 1.939944, -0.02355971, 1, 1, 1, 1, 1,
-0.08317312, -0.219163, -0.7254974, 1, 1, 1, 1, 1,
-0.08081058, 0.4296309, -0.7346509, 1, 1, 1, 1, 1,
-0.08000985, -0.4728496, -4.493097, 1, 1, 1, 1, 1,
-0.07537355, 0.1287272, -1.371944, 1, 1, 1, 1, 1,
-0.07061812, 0.3759856, -0.4416905, 1, 1, 1, 1, 1,
-0.06912941, 0.9471368, 0.3965872, 1, 1, 1, 1, 1,
-0.06750678, -0.2766866, -2.859579, 1, 1, 1, 1, 1,
-0.06267464, 0.2074637, -0.1451544, 0, 0, 1, 1, 1,
-0.06065964, -1.124415, -2.118551, 1, 0, 0, 1, 1,
-0.06054652, 0.6770655, 1.161561, 1, 0, 0, 1, 1,
-0.0595872, 1.458656, -1.044879, 1, 0, 0, 1, 1,
-0.05302199, 0.208292, 1.15949, 1, 0, 0, 1, 1,
-0.0466526, -0.7545271, -2.845535, 1, 0, 0, 1, 1,
-0.04414801, -0.9227884, -3.233865, 0, 0, 0, 1, 1,
-0.04214101, 0.759852, 0.6843214, 0, 0, 0, 1, 1,
-0.03677753, 0.7482148, 0.2680758, 0, 0, 0, 1, 1,
-0.03420695, 1.120684, -0.9812719, 0, 0, 0, 1, 1,
-0.03391894, -0.2664366, -1.289636, 0, 0, 0, 1, 1,
-0.02960618, 1.710426, -0.8237013, 0, 0, 0, 1, 1,
-0.01788756, -0.3134434, -2.960746, 0, 0, 0, 1, 1,
-0.01620798, 0.3299034, 0.08100865, 1, 1, 1, 1, 1,
-0.01122249, -0.2564419, -2.215513, 1, 1, 1, 1, 1,
-0.01041663, 0.3470829, 0.3368386, 1, 1, 1, 1, 1,
-0.003302496, 0.8113787, -0.1222283, 1, 1, 1, 1, 1,
0.004435309, -1.245343, 3.737561, 1, 1, 1, 1, 1,
0.007846582, 0.8224766, -0.2464524, 1, 1, 1, 1, 1,
0.009615426, -1.409587, 3.944249, 1, 1, 1, 1, 1,
0.01466387, 0.4548171, 1.956014, 1, 1, 1, 1, 1,
0.01525434, 0.5865018, -0.8639169, 1, 1, 1, 1, 1,
0.01536247, -1.004089, 3.879247, 1, 1, 1, 1, 1,
0.02024642, -0.7962223, 2.79081, 1, 1, 1, 1, 1,
0.0215769, 0.6873636, 2.033664, 1, 1, 1, 1, 1,
0.02200091, 1.115655, 0.2609436, 1, 1, 1, 1, 1,
0.02504098, -0.3240114, 2.566103, 1, 1, 1, 1, 1,
0.02535635, -0.864361, 2.579861, 1, 1, 1, 1, 1,
0.03019376, -0.1972214, 2.80775, 0, 0, 1, 1, 1,
0.04277605, -1.46641, 3.801704, 1, 0, 0, 1, 1,
0.04539173, 1.408893, 0.05982492, 1, 0, 0, 1, 1,
0.05560804, 0.02141932, 0.4326698, 1, 0, 0, 1, 1,
0.05875032, 0.3763679, 0.09345901, 1, 0, 0, 1, 1,
0.06003899, -0.8440549, 3.438509, 1, 0, 0, 1, 1,
0.06030801, 2.13381, 0.3679318, 0, 0, 0, 1, 1,
0.06318562, 1.537459, -0.7150335, 0, 0, 0, 1, 1,
0.07037692, -0.2072166, 1.614938, 0, 0, 0, 1, 1,
0.07298166, 0.4770729, -0.8952312, 0, 0, 0, 1, 1,
0.07498181, 0.2135463, 1.335452, 0, 0, 0, 1, 1,
0.07551836, -0.3931622, 2.472764, 0, 0, 0, 1, 1,
0.08078809, -0.4151725, 1.705261, 0, 0, 0, 1, 1,
0.08180001, -0.7327287, 2.624145, 1, 1, 1, 1, 1,
0.08309653, 0.002857916, 1.628545, 1, 1, 1, 1, 1,
0.08377872, -0.4515875, 3.6575, 1, 1, 1, 1, 1,
0.085207, -0.6301039, 3.862956, 1, 1, 1, 1, 1,
0.08882896, -0.0675743, 1.957407, 1, 1, 1, 1, 1,
0.09397384, -0.3895298, 1.919076, 1, 1, 1, 1, 1,
0.09420383, 0.09347692, 0.06014532, 1, 1, 1, 1, 1,
0.1077695, -1.338513, 2.835927, 1, 1, 1, 1, 1,
0.10838, 0.1680775, 2.105638, 1, 1, 1, 1, 1,
0.1085967, 1.721551, 1.139112, 1, 1, 1, 1, 1,
0.1100394, -0.9629957, 2.772927, 1, 1, 1, 1, 1,
0.1122747, 0.9943298, 0.2418476, 1, 1, 1, 1, 1,
0.118273, -0.76024, 2.597754, 1, 1, 1, 1, 1,
0.1195078, -1.394739, 1.340469, 1, 1, 1, 1, 1,
0.1260268, -1.094429, 2.464823, 1, 1, 1, 1, 1,
0.1270709, 0.3713683, 0.6497316, 0, 0, 1, 1, 1,
0.1289577, 1.360562, 0.1888724, 1, 0, 0, 1, 1,
0.1306688, 0.7396794, 2.411555, 1, 0, 0, 1, 1,
0.1319391, 1.843354, 1.921371, 1, 0, 0, 1, 1,
0.1345127, -0.2771569, 2.974827, 1, 0, 0, 1, 1,
0.1370297, -0.5695669, 2.96599, 1, 0, 0, 1, 1,
0.1370663, -0.5972232, 3.52979, 0, 0, 0, 1, 1,
0.1385192, 0.9278543, -0.1508209, 0, 0, 0, 1, 1,
0.1388184, 0.2255333, 1.470943, 0, 0, 0, 1, 1,
0.1402417, 0.6844981, -1.446527, 0, 0, 0, 1, 1,
0.142485, -0.1416179, 3.731969, 0, 0, 0, 1, 1,
0.1457567, 0.9110721, -1.265444, 0, 0, 0, 1, 1,
0.146989, 0.3925162, 0.9020609, 0, 0, 0, 1, 1,
0.1488729, -1.387303, 1.906124, 1, 1, 1, 1, 1,
0.1502326, 1.467064, -0.0625754, 1, 1, 1, 1, 1,
0.1601785, -0.3892616, 3.902032, 1, 1, 1, 1, 1,
0.1602707, -0.9366605, 2.76609, 1, 1, 1, 1, 1,
0.16237, -0.09063698, 2.625859, 1, 1, 1, 1, 1,
0.1679859, 2.210665, 0.2798986, 1, 1, 1, 1, 1,
0.1679983, 1.744049, 0.3481019, 1, 1, 1, 1, 1,
0.1689185, -0.1733672, 1.637184, 1, 1, 1, 1, 1,
0.1800514, -0.08246937, 3.065714, 1, 1, 1, 1, 1,
0.1804492, -0.9861452, 2.976671, 1, 1, 1, 1, 1,
0.1836926, 0.2630793, 0.9523186, 1, 1, 1, 1, 1,
0.1864762, 2.247363, 0.9801219, 1, 1, 1, 1, 1,
0.1890262, 2.306605, 1.40468, 1, 1, 1, 1, 1,
0.1987235, -0.8941952, 3.352658, 1, 1, 1, 1, 1,
0.2023655, 0.5552836, 0.8791318, 1, 1, 1, 1, 1,
0.2044843, -0.8303707, 3.685076, 0, 0, 1, 1, 1,
0.2057991, -0.1983225, 4.458707, 1, 0, 0, 1, 1,
0.2096727, -0.1074611, 2.202454, 1, 0, 0, 1, 1,
0.2119201, 0.484883, -0.6844519, 1, 0, 0, 1, 1,
0.2123428, 1.243513, -1.712463, 1, 0, 0, 1, 1,
0.2135304, -0.7612656, 1.62191, 1, 0, 0, 1, 1,
0.2137933, 0.2644622, 1.314139, 0, 0, 0, 1, 1,
0.2187326, 0.4181161, 1.162074, 0, 0, 0, 1, 1,
0.2191759, 1.554467, -0.6775407, 0, 0, 0, 1, 1,
0.2213354, -0.7451046, 2.002586, 0, 0, 0, 1, 1,
0.2222576, 1.966514, -1.671384, 0, 0, 0, 1, 1,
0.223703, 1.357283, 0.02234174, 0, 0, 0, 1, 1,
0.2259527, 1.967461, 1.198848, 0, 0, 0, 1, 1,
0.2313055, 2.763008, 0.01858861, 1, 1, 1, 1, 1,
0.2338248, 0.156694, -0.06553639, 1, 1, 1, 1, 1,
0.2373949, 1.393884, 1.035582, 1, 1, 1, 1, 1,
0.2410777, -1.265033, 2.586245, 1, 1, 1, 1, 1,
0.2446562, -0.970462, 2.65767, 1, 1, 1, 1, 1,
0.2450204, 0.6494671, 0.9282612, 1, 1, 1, 1, 1,
0.2457815, 1.061575, -1.627863, 1, 1, 1, 1, 1,
0.2489175, -1.407847, 1.947245, 1, 1, 1, 1, 1,
0.2510474, -0.6633294, 3.360744, 1, 1, 1, 1, 1,
0.2513065, 1.625437, 0.1382747, 1, 1, 1, 1, 1,
0.2517423, -0.325625, 0.5963322, 1, 1, 1, 1, 1,
0.2519538, -0.2668485, 3.838398, 1, 1, 1, 1, 1,
0.2535531, -1.437148, 2.455887, 1, 1, 1, 1, 1,
0.2550673, -0.6045496, 1.450777, 1, 1, 1, 1, 1,
0.256764, 0.2099263, 0.8230912, 1, 1, 1, 1, 1,
0.2579358, -0.4616111, 2.639156, 0, 0, 1, 1, 1,
0.2584954, 2.346106, -1.440851, 1, 0, 0, 1, 1,
0.2637045, 0.129641, 2.22271, 1, 0, 0, 1, 1,
0.2675377, -0.2667165, 2.786904, 1, 0, 0, 1, 1,
0.2685307, -1.22445, 1.970312, 1, 0, 0, 1, 1,
0.2713298, -0.1882446, 3.705369, 1, 0, 0, 1, 1,
0.27278, -0.05985732, 2.360967, 0, 0, 0, 1, 1,
0.2784655, -0.3663872, 2.116183, 0, 0, 0, 1, 1,
0.2813574, 0.01688292, 1.140832, 0, 0, 0, 1, 1,
0.2900572, 0.6966959, 1.152288, 0, 0, 0, 1, 1,
0.2958595, -0.5660822, 2.191899, 0, 0, 0, 1, 1,
0.2958858, 2.154999, 2.264008, 0, 0, 0, 1, 1,
0.2968922, 0.6093921, 0.5539147, 0, 0, 0, 1, 1,
0.2978587, 1.523482, 0.555177, 1, 1, 1, 1, 1,
0.309413, -0.752849, 3.604472, 1, 1, 1, 1, 1,
0.3101556, -1.465951, 3.162633, 1, 1, 1, 1, 1,
0.315142, -0.2044729, 2.444595, 1, 1, 1, 1, 1,
0.3199634, 1.192543, 0.3153192, 1, 1, 1, 1, 1,
0.3211547, 1.014509, -0.4186861, 1, 1, 1, 1, 1,
0.3221767, -1.493566, 1.979303, 1, 1, 1, 1, 1,
0.3226073, -0.4332632, 1.9035, 1, 1, 1, 1, 1,
0.3226323, 0.257954, 0.8523693, 1, 1, 1, 1, 1,
0.3241541, -0.05297881, 1.492722, 1, 1, 1, 1, 1,
0.3247816, 1.676955, -1.381952, 1, 1, 1, 1, 1,
0.3256058, 0.4032223, 0.3598184, 1, 1, 1, 1, 1,
0.325764, 0.427134, -0.8392961, 1, 1, 1, 1, 1,
0.326952, 2.551502, 0.313987, 1, 1, 1, 1, 1,
0.329745, -0.7521179, 2.916034, 1, 1, 1, 1, 1,
0.3305806, -1.021943, 3.819552, 0, 0, 1, 1, 1,
0.3314222, 1.195584, 0.3059288, 1, 0, 0, 1, 1,
0.3325644, -0.2561285, 2.621451, 1, 0, 0, 1, 1,
0.3375349, -0.778225, 4.023778, 1, 0, 0, 1, 1,
0.3381612, -1.424689, 4.482195, 1, 0, 0, 1, 1,
0.3441373, -0.1828347, 2.785151, 1, 0, 0, 1, 1,
0.3457047, -0.6053296, 2.185568, 0, 0, 0, 1, 1,
0.346437, 0.5557951, -1.031142, 0, 0, 0, 1, 1,
0.3524417, 0.08738375, 0.6614835, 0, 0, 0, 1, 1,
0.3559731, 1.155243, 0.1705861, 0, 0, 0, 1, 1,
0.358006, -2.30375, 4.004818, 0, 0, 0, 1, 1,
0.3584613, 0.5854578, 0.001735841, 0, 0, 0, 1, 1,
0.3620447, 1.356906, 1.672098, 0, 0, 0, 1, 1,
0.3621936, -1.153852, 2.109655, 1, 1, 1, 1, 1,
0.362518, 0.6966248, -0.5415596, 1, 1, 1, 1, 1,
0.3713505, 1.571035, 0.1401129, 1, 1, 1, 1, 1,
0.3790187, -0.02286571, 2.028125, 1, 1, 1, 1, 1,
0.3791876, 0.8998333, -1.144203, 1, 1, 1, 1, 1,
0.3818288, -1.531309, 3.009354, 1, 1, 1, 1, 1,
0.3874414, -0.3071582, 4.40607, 1, 1, 1, 1, 1,
0.3878084, -0.5302669, 1.425786, 1, 1, 1, 1, 1,
0.3884894, 1.67853, 0.6570908, 1, 1, 1, 1, 1,
0.3896136, 0.04517272, -0.3295354, 1, 1, 1, 1, 1,
0.3918554, -0.9781766, 3.080637, 1, 1, 1, 1, 1,
0.3946177, -0.878565, 3.015584, 1, 1, 1, 1, 1,
0.3949134, -0.4489951, 5.099223, 1, 1, 1, 1, 1,
0.3968704, -0.771986, 1.651966, 1, 1, 1, 1, 1,
0.3983697, 1.415939, 1.568913, 1, 1, 1, 1, 1,
0.3990963, 1.35928, -0.541173, 0, 0, 1, 1, 1,
0.401866, -0.7415377, 3.026109, 1, 0, 0, 1, 1,
0.4103231, 0.5683509, 0.6625228, 1, 0, 0, 1, 1,
0.4106273, -0.08969837, 1.059883, 1, 0, 0, 1, 1,
0.4149559, -0.563996, 4.064109, 1, 0, 0, 1, 1,
0.4156592, -1.097625, 3.347632, 1, 0, 0, 1, 1,
0.416752, -0.5448462, 2.31109, 0, 0, 0, 1, 1,
0.422476, -0.5819564, 2.239164, 0, 0, 0, 1, 1,
0.4225195, 0.6528098, -0.1920186, 0, 0, 0, 1, 1,
0.423417, -1.267738, 2.261333, 0, 0, 0, 1, 1,
0.4246324, -0.9853618, 1.943592, 0, 0, 0, 1, 1,
0.425807, -2.147616, 2.987408, 0, 0, 0, 1, 1,
0.4269368, -0.459964, 1.50122, 0, 0, 0, 1, 1,
0.4350927, 0.1786307, 1.156734, 1, 1, 1, 1, 1,
0.4358211, -0.6673728, 3.288116, 1, 1, 1, 1, 1,
0.4362628, -0.4617797, 3.502048, 1, 1, 1, 1, 1,
0.4363553, -0.7779108, 2.116554, 1, 1, 1, 1, 1,
0.4416778, 0.9595334, 1.52229, 1, 1, 1, 1, 1,
0.4482058, -0.8375271, 1.222089, 1, 1, 1, 1, 1,
0.4485774, 0.3302179, 1.690661, 1, 1, 1, 1, 1,
0.4497846, 0.3286754, 0.4058579, 1, 1, 1, 1, 1,
0.4509588, 0.6816946, -1.287117, 1, 1, 1, 1, 1,
0.4542029, -0.662143, 1.942452, 1, 1, 1, 1, 1,
0.4598637, -0.1933954, 2.503823, 1, 1, 1, 1, 1,
0.4625136, 0.4051771, 0.1885584, 1, 1, 1, 1, 1,
0.4630804, 0.7658181, 0.3708338, 1, 1, 1, 1, 1,
0.4714182, -0.0155505, 2.761312, 1, 1, 1, 1, 1,
0.4725411, -0.8317855, 1.66748, 1, 1, 1, 1, 1,
0.474135, 0.4426269, 1.84038, 0, 0, 1, 1, 1,
0.4749864, -1.798116, 2.937944, 1, 0, 0, 1, 1,
0.4774266, 0.3710355, -0.8755522, 1, 0, 0, 1, 1,
0.4798841, -0.3861414, 3.9783, 1, 0, 0, 1, 1,
0.4807262, 0.4092805, -0.5536658, 1, 0, 0, 1, 1,
0.4814892, 1.950867, 0.5665448, 1, 0, 0, 1, 1,
0.4841493, -0.2165836, 3.315116, 0, 0, 0, 1, 1,
0.490544, -0.7733485, 1.899665, 0, 0, 0, 1, 1,
0.4907978, -0.5060636, 0.7810903, 0, 0, 0, 1, 1,
0.4943316, 0.08023249, 2.266756, 0, 0, 0, 1, 1,
0.4946258, 0.6471637, 0.212756, 0, 0, 0, 1, 1,
0.4980547, 0.5275488, 2.932326, 0, 0, 0, 1, 1,
0.4989279, 2.133716, 0.009526075, 0, 0, 0, 1, 1,
0.4994822, 0.4523503, 2.175484, 1, 1, 1, 1, 1,
0.5049414, 0.7503682, 0.3056491, 1, 1, 1, 1, 1,
0.5091646, -1.071333, 4.280713, 1, 1, 1, 1, 1,
0.5112315, 0.6745461, 1.993084, 1, 1, 1, 1, 1,
0.5116863, 0.4513927, 0.2423479, 1, 1, 1, 1, 1,
0.5218842, 0.7921919, 2.00306, 1, 1, 1, 1, 1,
0.5221849, 0.8694156, -0.3826568, 1, 1, 1, 1, 1,
0.5237898, 1.490466, 0.4188083, 1, 1, 1, 1, 1,
0.5241926, 1.605579, 1.622955, 1, 1, 1, 1, 1,
0.5392566, 0.3904541, 0.8721017, 1, 1, 1, 1, 1,
0.5399064, -1.742172, 2.913606, 1, 1, 1, 1, 1,
0.5515164, 1.000652, -1.226504, 1, 1, 1, 1, 1,
0.551891, 1.755365, -0.5052586, 1, 1, 1, 1, 1,
0.5546184, -0.8352374, 2.767094, 1, 1, 1, 1, 1,
0.5618107, 1.732638, -0.3490109, 1, 1, 1, 1, 1,
0.5659302, 0.6902195, 0.5976453, 0, 0, 1, 1, 1,
0.5660332, 0.5210622, 0.8436174, 1, 0, 0, 1, 1,
0.5663974, -0.2241808, 2.550989, 1, 0, 0, 1, 1,
0.5771889, 0.7298735, 0.07008269, 1, 0, 0, 1, 1,
0.5790666, -1.574471, 3.264385, 1, 0, 0, 1, 1,
0.5839747, -1.225848, 3.257391, 1, 0, 0, 1, 1,
0.5845225, -1.25074, 2.723624, 0, 0, 0, 1, 1,
0.5876577, -2.154775, 2.295745, 0, 0, 0, 1, 1,
0.5910283, 0.4172366, -0.8628485, 0, 0, 0, 1, 1,
0.594559, 0.290803, 1.254235, 0, 0, 0, 1, 1,
0.600534, 0.7014689, -0.7777511, 0, 0, 0, 1, 1,
0.6009368, -0.7615038, 3.640689, 0, 0, 0, 1, 1,
0.6105133, 0.4825031, 0.7967282, 0, 0, 0, 1, 1,
0.6134667, 1.115625, 1.509766, 1, 1, 1, 1, 1,
0.6150687, -0.02982778, 1.974957, 1, 1, 1, 1, 1,
0.6166366, 0.6901485, 0.6314641, 1, 1, 1, 1, 1,
0.6184376, -0.7702996, 2.018776, 1, 1, 1, 1, 1,
0.6189823, -0.6036052, 1.910958, 1, 1, 1, 1, 1,
0.6205939, 0.5059633, -0.6480735, 1, 1, 1, 1, 1,
0.6207896, -2.275965, 3.178942, 1, 1, 1, 1, 1,
0.6241141, -0.4552918, 4.132861, 1, 1, 1, 1, 1,
0.6253316, -0.5747625, 1.981582, 1, 1, 1, 1, 1,
0.6270411, 0.6466722, 1.296197, 1, 1, 1, 1, 1,
0.6291599, -0.820718, 1.060614, 1, 1, 1, 1, 1,
0.6305041, -0.6793429, 3.17154, 1, 1, 1, 1, 1,
0.631465, 0.5031381, -1.672923, 1, 1, 1, 1, 1,
0.6387153, -0.1485993, 0.431303, 1, 1, 1, 1, 1,
0.6393518, -0.009340215, 1.045732, 1, 1, 1, 1, 1,
0.6402387, -0.5260971, 4.226135, 0, 0, 1, 1, 1,
0.6438667, 0.4473773, 3.143783, 1, 0, 0, 1, 1,
0.6521087, 0.2911022, 1.676869, 1, 0, 0, 1, 1,
0.6560979, 0.2937144, 1.229502, 1, 0, 0, 1, 1,
0.6594475, -0.7014939, 1.498097, 1, 0, 0, 1, 1,
0.6660973, 0.521633, 0.3786568, 1, 0, 0, 1, 1,
0.6677549, 0.3620637, 1.637165, 0, 0, 0, 1, 1,
0.6694036, 1.506635, -0.2555146, 0, 0, 0, 1, 1,
0.6717208, 1.269675, 1.027197, 0, 0, 0, 1, 1,
0.6728289, -1.602321, 2.226846, 0, 0, 0, 1, 1,
0.6784633, 0.382466, 1.524585, 0, 0, 0, 1, 1,
0.6791782, -1.106978, 1.599897, 0, 0, 0, 1, 1,
0.6845744, 0.7162211, 1.293013, 0, 0, 0, 1, 1,
0.6884239, -0.466515, 4.478342, 1, 1, 1, 1, 1,
0.7009198, -1.002553, 3.329656, 1, 1, 1, 1, 1,
0.702834, 0.1947682, -0.02093455, 1, 1, 1, 1, 1,
0.7083183, 0.575735, -0.3502612, 1, 1, 1, 1, 1,
0.7106858, -0.2168292, 0.454299, 1, 1, 1, 1, 1,
0.7117795, 0.4474329, 2.38725, 1, 1, 1, 1, 1,
0.7118158, -0.03150432, 1.239266, 1, 1, 1, 1, 1,
0.7125262, 0.04654256, 1.130371, 1, 1, 1, 1, 1,
0.7130768, -1.91155, 4.357438, 1, 1, 1, 1, 1,
0.7133453, 0.452888, 1.029598, 1, 1, 1, 1, 1,
0.7151993, 0.6553179, 0.814423, 1, 1, 1, 1, 1,
0.7192872, -1.394409, 3.161913, 1, 1, 1, 1, 1,
0.7271487, -0.2531461, 1.811598, 1, 1, 1, 1, 1,
0.7300431, -0.1271864, 1.48724, 1, 1, 1, 1, 1,
0.7303223, 1.01995, 1.829991, 1, 1, 1, 1, 1,
0.7362217, -0.8791491, 2.685176, 0, 0, 1, 1, 1,
0.7403619, 0.9861127, 2.371338, 1, 0, 0, 1, 1,
0.7449849, -0.2498871, 2.638636, 1, 0, 0, 1, 1,
0.7471071, 1.83385, -0.5710912, 1, 0, 0, 1, 1,
0.750556, 1.463452, -0.4844802, 1, 0, 0, 1, 1,
0.7508594, 0.9034795, -0.8583773, 1, 0, 0, 1, 1,
0.7519491, 0.6639372, -0.9423134, 0, 0, 0, 1, 1,
0.7524678, 0.9198745, -0.3168082, 0, 0, 0, 1, 1,
0.7564479, -1.051596, 2.696735, 0, 0, 0, 1, 1,
0.7574676, 0.4828923, 1.332825, 0, 0, 0, 1, 1,
0.7613353, -0.2753635, 2.130528, 0, 0, 0, 1, 1,
0.7666532, 1.608831, -0.2875705, 0, 0, 0, 1, 1,
0.7694451, 2.204278, -0.5369544, 0, 0, 0, 1, 1,
0.7696598, -0.4243409, 2.939679, 1, 1, 1, 1, 1,
0.7716585, 1.404334, 0.5380325, 1, 1, 1, 1, 1,
0.7737511, 2.199043, -1.835948, 1, 1, 1, 1, 1,
0.7738929, 0.573831, 0.6877446, 1, 1, 1, 1, 1,
0.7758039, -0.3109092, 2.201649, 1, 1, 1, 1, 1,
0.7852539, -0.1847269, 3.418926, 1, 1, 1, 1, 1,
0.7887946, 0.0902628, 1.609899, 1, 1, 1, 1, 1,
0.7896945, -0.2484288, 2.637251, 1, 1, 1, 1, 1,
0.7929885, -0.1833265, 1.246992, 1, 1, 1, 1, 1,
0.7978091, 1.17614, 0.2154858, 1, 1, 1, 1, 1,
0.8029259, 0.7076166, 1.637595, 1, 1, 1, 1, 1,
0.8108376, -0.7605872, 1.769279, 1, 1, 1, 1, 1,
0.8127335, -0.1822042, 1.572859, 1, 1, 1, 1, 1,
0.8157339, -1.052616, 0.4959484, 1, 1, 1, 1, 1,
0.8198291, -1.329384, 3.047385, 1, 1, 1, 1, 1,
0.8236092, -1.385165, 2.218914, 0, 0, 1, 1, 1,
0.8268164, 0.9307216, 0.6474243, 1, 0, 0, 1, 1,
0.8305661, -0.1423098, 1.824653, 1, 0, 0, 1, 1,
0.8326294, -1.166493, 0.5316085, 1, 0, 0, 1, 1,
0.8344482, -0.3483351, 2.354461, 1, 0, 0, 1, 1,
0.8455267, -0.4025822, 1.740022, 1, 0, 0, 1, 1,
0.848034, 0.4981597, -0.1859729, 0, 0, 0, 1, 1,
0.8480539, 1.194568, 1.623946, 0, 0, 0, 1, 1,
0.849491, -0.409398, 1.783958, 0, 0, 0, 1, 1,
0.8627518, 0.6048999, 2.388502, 0, 0, 0, 1, 1,
0.864012, 0.1978335, 0.8279389, 0, 0, 0, 1, 1,
0.867128, 2.174405, 0.6914812, 0, 0, 0, 1, 1,
0.8719068, 0.410662, 0.6382216, 0, 0, 0, 1, 1,
0.8729843, -0.7725462, 1.643867, 1, 1, 1, 1, 1,
0.88135, 1.242371, 3.1466, 1, 1, 1, 1, 1,
0.8836287, 1.231919, 1.798273, 1, 1, 1, 1, 1,
0.8933615, 0.2082576, 1.488172, 1, 1, 1, 1, 1,
0.8963717, -0.2963834, 1.865806, 1, 1, 1, 1, 1,
0.8972688, 1.188669, 0.2270481, 1, 1, 1, 1, 1,
0.8994877, -0.8141398, 4.065532, 1, 1, 1, 1, 1,
0.9003811, 0.4109492, -0.5004681, 1, 1, 1, 1, 1,
0.9029584, -0.6175768, 2.493067, 1, 1, 1, 1, 1,
0.9083514, -0.3480811, 1.470016, 1, 1, 1, 1, 1,
0.9120007, -0.1418094, 2.493186, 1, 1, 1, 1, 1,
0.9141688, -0.5389068, 2.13447, 1, 1, 1, 1, 1,
0.915807, 1.539371, 0.6231341, 1, 1, 1, 1, 1,
0.9360426, 2.115912, 1.482626, 1, 1, 1, 1, 1,
0.9423838, 0.2758347, 1.40114, 1, 1, 1, 1, 1,
0.9428517, -0.4768347, 4.024869, 0, 0, 1, 1, 1,
0.9480553, -0.7707705, 2.074493, 1, 0, 0, 1, 1,
0.961433, -1.273703, 1.826533, 1, 0, 0, 1, 1,
0.964806, 0.5712757, 1.306665, 1, 0, 0, 1, 1,
0.9744975, -1.437141, 3.580992, 1, 0, 0, 1, 1,
0.976923, -0.6688602, 1.885248, 1, 0, 0, 1, 1,
0.9779631, -0.8897398, 3.233888, 0, 0, 0, 1, 1,
0.9816531, -0.874832, 3.09205, 0, 0, 0, 1, 1,
0.9817664, -0.6760901, 1.599512, 0, 0, 0, 1, 1,
0.9867617, -0.9399971, 2.79342, 0, 0, 0, 1, 1,
0.9894308, 1.512973, 0.574101, 0, 0, 0, 1, 1,
0.9897155, 1.034291, -0.5801631, 0, 0, 0, 1, 1,
0.9898127, -0.08728331, 2.18572, 0, 0, 0, 1, 1,
0.9958327, -1.20701, 1.721616, 1, 1, 1, 1, 1,
0.9958515, 0.8228148, -0.4195533, 1, 1, 1, 1, 1,
0.9982178, 0.08000878, 1.226576, 1, 1, 1, 1, 1,
0.9986543, -0.7572551, 2.22098, 1, 1, 1, 1, 1,
1.011173, -0.08750129, 2.07547, 1, 1, 1, 1, 1,
1.012989, 0.3898997, 1.200976, 1, 1, 1, 1, 1,
1.013669, -1.399461, 1.416518, 1, 1, 1, 1, 1,
1.019062, -1.126963, 3.513409, 1, 1, 1, 1, 1,
1.024544, 0.7457683, 0.3720012, 1, 1, 1, 1, 1,
1.043466, -0.1101866, 1.217167, 1, 1, 1, 1, 1,
1.045542, 1.995792, 0.7428486, 1, 1, 1, 1, 1,
1.049435, 1.631515, 0.74907, 1, 1, 1, 1, 1,
1.052377, -0.561913, 2.722637, 1, 1, 1, 1, 1,
1.057594, -0.9116359, 2.463302, 1, 1, 1, 1, 1,
1.058028, -0.3363087, 3.237869, 1, 1, 1, 1, 1,
1.058272, 1.569321, 0.4101801, 0, 0, 1, 1, 1,
1.065456, -1.694266, 1.649483, 1, 0, 0, 1, 1,
1.087915, 1.753739, 1.001888, 1, 0, 0, 1, 1,
1.097173, 0.4490018, 1.584054, 1, 0, 0, 1, 1,
1.098516, -2.029685, 3.889991, 1, 0, 0, 1, 1,
1.129023, -1.647961, 2.016409, 1, 0, 0, 1, 1,
1.140575, -0.05868352, 2.180877, 0, 0, 0, 1, 1,
1.14298, -0.128162, -0.6410874, 0, 0, 0, 1, 1,
1.143949, -1.350863, 2.779937, 0, 0, 0, 1, 1,
1.145654, 0.1482298, 1.729548, 0, 0, 0, 1, 1,
1.146841, -1.782421, 1.675084, 0, 0, 0, 1, 1,
1.153202, -0.3105518, 0.8991297, 0, 0, 0, 1, 1,
1.16241, 0.5890029, 2.768386, 0, 0, 0, 1, 1,
1.165213, 1.090712, 0.02765327, 1, 1, 1, 1, 1,
1.167764, 0.675087, -0.225605, 1, 1, 1, 1, 1,
1.16793, 0.4074185, 0.6996286, 1, 1, 1, 1, 1,
1.168242, 0.6974795, -0.111902, 1, 1, 1, 1, 1,
1.18013, -0.2899, 2.375612, 1, 1, 1, 1, 1,
1.184067, 1.326399, 2.402717, 1, 1, 1, 1, 1,
1.184884, -1.163939, 0.7050537, 1, 1, 1, 1, 1,
1.193446, 0.7729992, 1.877008, 1, 1, 1, 1, 1,
1.195413, 1.025231, -0.6478397, 1, 1, 1, 1, 1,
1.212259, -0.951027, 1.899917, 1, 1, 1, 1, 1,
1.213561, 0.5408438, 1.603229, 1, 1, 1, 1, 1,
1.216718, 1.69906, -0.1629132, 1, 1, 1, 1, 1,
1.22545, -1.011676, 0.5014756, 1, 1, 1, 1, 1,
1.227395, 0.9861737, 1.849988, 1, 1, 1, 1, 1,
1.227769, -0.4767517, 2.762135, 1, 1, 1, 1, 1,
1.227997, -0.006068562, 0.9022296, 0, 0, 1, 1, 1,
1.229666, 0.7928906, 1.293782, 1, 0, 0, 1, 1,
1.240853, 0.5956567, 3.276947, 1, 0, 0, 1, 1,
1.241111, 0.213457, 1.931007, 1, 0, 0, 1, 1,
1.241481, 1.731136, 0.6875578, 1, 0, 0, 1, 1,
1.244835, -0.186691, 3.276586, 1, 0, 0, 1, 1,
1.247072, 0.963946, 2.988146, 0, 0, 0, 1, 1,
1.255011, 0.3969505, 1.390269, 0, 0, 0, 1, 1,
1.263678, -1.200394, 3.333123, 0, 0, 0, 1, 1,
1.269951, 0.7395746, -0.1830627, 0, 0, 0, 1, 1,
1.2723, 0.2238655, 2.527803, 0, 0, 0, 1, 1,
1.276684, -1.295376, 1.459964, 0, 0, 0, 1, 1,
1.276809, 1.558844, 0.8235355, 0, 0, 0, 1, 1,
1.285042, -0.0004525782, 1.668809, 1, 1, 1, 1, 1,
1.28554, -0.8375775, 2.553941, 1, 1, 1, 1, 1,
1.288222, -0.2525997, 2.926437, 1, 1, 1, 1, 1,
1.292521, 0.7082578, 1.879245, 1, 1, 1, 1, 1,
1.292646, 2.033149, 0.8488383, 1, 1, 1, 1, 1,
1.298137, 0.4078793, 2.995814, 1, 1, 1, 1, 1,
1.301916, 1.768437, -0.09063791, 1, 1, 1, 1, 1,
1.302657, 1.651582, 1.358349, 1, 1, 1, 1, 1,
1.312541, -1.3559, 3.465575, 1, 1, 1, 1, 1,
1.32141, -0.5030609, 1.139011, 1, 1, 1, 1, 1,
1.328111, 0.4979854, 2.040743, 1, 1, 1, 1, 1,
1.331738, -0.9368428, 2.185318, 1, 1, 1, 1, 1,
1.344322, -0.1923306, 2.142313, 1, 1, 1, 1, 1,
1.348523, -1.067004, 2.843551, 1, 1, 1, 1, 1,
1.350862, -1.270365, -0.2346666, 1, 1, 1, 1, 1,
1.354875, -1.996875, 2.257617, 0, 0, 1, 1, 1,
1.358307, -1.742471, 1.3923, 1, 0, 0, 1, 1,
1.359766, -0.3739582, 0.7109849, 1, 0, 0, 1, 1,
1.365165, -1.424045, 2.629241, 1, 0, 0, 1, 1,
1.366052, -1.090998, 1.23145, 1, 0, 0, 1, 1,
1.36816, 1.208312, 0.6819847, 1, 0, 0, 1, 1,
1.369883, 0.4233747, -0.01035357, 0, 0, 0, 1, 1,
1.371614, 0.1886123, -0.1207659, 0, 0, 0, 1, 1,
1.379066, 0.1533946, 0.8881932, 0, 0, 0, 1, 1,
1.389921, -0.3078792, 3.287456, 0, 0, 0, 1, 1,
1.392928, 1.665712, -1.634241, 0, 0, 0, 1, 1,
1.39346, -0.5217197, 1.818953, 0, 0, 0, 1, 1,
1.397646, 0.2924612, 1.345667, 0, 0, 0, 1, 1,
1.400061, 0.7565114, 0.2518098, 1, 1, 1, 1, 1,
1.400456, 0.3247325, -0.04691728, 1, 1, 1, 1, 1,
1.404781, 0.1267486, 2.856713, 1, 1, 1, 1, 1,
1.41198, -0.4160599, 2.406921, 1, 1, 1, 1, 1,
1.4138, -1.133569, 2.156416, 1, 1, 1, 1, 1,
1.431299, -0.9697069, 1.360904, 1, 1, 1, 1, 1,
1.431492, -1.242608, 3.140897, 1, 1, 1, 1, 1,
1.440485, -0.7378031, 4.263052, 1, 1, 1, 1, 1,
1.441215, -1.609037, 2.178658, 1, 1, 1, 1, 1,
1.458576, -0.9731402, 1.726919, 1, 1, 1, 1, 1,
1.46952, -1.784313, 2.205045, 1, 1, 1, 1, 1,
1.474274, -0.1201988, 3.084726, 1, 1, 1, 1, 1,
1.48242, 0.09906487, 1.96593, 1, 1, 1, 1, 1,
1.497348, 0.08252122, 1.11174, 1, 1, 1, 1, 1,
1.49836, -0.5373214, 2.849473, 1, 1, 1, 1, 1,
1.499504, 0.778923, 1.197528, 0, 0, 1, 1, 1,
1.500379, -0.6645226, 2.839713, 1, 0, 0, 1, 1,
1.507014, 0.4756188, 1.292679, 1, 0, 0, 1, 1,
1.507097, -2.634226, 1.370718, 1, 0, 0, 1, 1,
1.512197, 0.6817989, 0.002745506, 1, 0, 0, 1, 1,
1.519277, 1.565598, 0.2342397, 1, 0, 0, 1, 1,
1.522921, 1.093268, 1.273489, 0, 0, 0, 1, 1,
1.526601, 1.066187, 1.504527, 0, 0, 0, 1, 1,
1.542694, 1.133778, 0.4844738, 0, 0, 0, 1, 1,
1.549931, -0.3446633, 0.930514, 0, 0, 0, 1, 1,
1.56558, -0.3580067, 2.301594, 0, 0, 0, 1, 1,
1.5761, 0.05677251, 0.03873001, 0, 0, 0, 1, 1,
1.576556, 1.539571, 0.5222073, 0, 0, 0, 1, 1,
1.57864, -0.6771531, 2.617392, 1, 1, 1, 1, 1,
1.579202, -2.245371, 2.085389, 1, 1, 1, 1, 1,
1.585258, -1.526074, 2.52432, 1, 1, 1, 1, 1,
1.590082, -2.451514, 0.8650834, 1, 1, 1, 1, 1,
1.608244, 1.17221, -0.04923156, 1, 1, 1, 1, 1,
1.608325, -0.6077271, 2.536373, 1, 1, 1, 1, 1,
1.624505, 1.545908, 1.130634, 1, 1, 1, 1, 1,
1.654925, 0.5985468, 0.3602467, 1, 1, 1, 1, 1,
1.662085, -0.3022047, 2.850101, 1, 1, 1, 1, 1,
1.662989, 1.521129, 1.017748, 1, 1, 1, 1, 1,
1.66412, 0.5092379, 2.862081, 1, 1, 1, 1, 1,
1.678112, 0.3014501, 1.724616, 1, 1, 1, 1, 1,
1.67957, 0.4530897, -0.1285862, 1, 1, 1, 1, 1,
1.679803, -0.06018054, -0.0293282, 1, 1, 1, 1, 1,
1.680957, -0.9884856, 1.899458, 1, 1, 1, 1, 1,
1.683788, -0.1956498, 1.157268, 0, 0, 1, 1, 1,
1.739168, -1.215856, 1.982005, 1, 0, 0, 1, 1,
1.744244, 0.3473513, 1.154022, 1, 0, 0, 1, 1,
1.754767, 0.8952465, 1.866072, 1, 0, 0, 1, 1,
1.766943, -0.9195542, 2.000177, 1, 0, 0, 1, 1,
1.802008, 0.429729, -0.9928701, 1, 0, 0, 1, 1,
1.805606, -0.007577017, 0.145346, 0, 0, 0, 1, 1,
1.806636, -1.736387, 0.8787765, 0, 0, 0, 1, 1,
1.815429, 1.92473, 0.8442988, 0, 0, 0, 1, 1,
1.827417, -1.651923, 2.33481, 0, 0, 0, 1, 1,
1.831694, -1.575142, 2.536371, 0, 0, 0, 1, 1,
1.846941, -1.077935, 2.553087, 0, 0, 0, 1, 1,
1.862257, 1.309816, 0.715816, 0, 0, 0, 1, 1,
1.865039, 0.7861558, 1.403231, 1, 1, 1, 1, 1,
1.868217, -0.3542029, 1.116717, 1, 1, 1, 1, 1,
1.876578, 0.660831, 1.602532, 1, 1, 1, 1, 1,
1.878906, -0.5401206, 2.551005, 1, 1, 1, 1, 1,
1.887831, -0.3248734, 2.168447, 1, 1, 1, 1, 1,
1.894835, -0.656745, 1.58568, 1, 1, 1, 1, 1,
1.895701, 0.5520468, 0.7449802, 1, 1, 1, 1, 1,
1.92308, -0.7016602, 0.5925198, 1, 1, 1, 1, 1,
1.924358, -0.0635452, 2.001069, 1, 1, 1, 1, 1,
1.957765, -1.647849, 0.6791747, 1, 1, 1, 1, 1,
1.960207, -0.4033684, 2.26835, 1, 1, 1, 1, 1,
1.963581, 0.3381863, 0.03879406, 1, 1, 1, 1, 1,
1.979579, 1.356785, -0.7396074, 1, 1, 1, 1, 1,
2.009786, 0.06711256, 0.7994429, 1, 1, 1, 1, 1,
2.01348, 0.1142302, 0.287295, 1, 1, 1, 1, 1,
2.0254, -0.6665947, 1.524634, 0, 0, 1, 1, 1,
2.060734, -0.4049694, 2.943726, 1, 0, 0, 1, 1,
2.08119, 0.8643237, 1.513111, 1, 0, 0, 1, 1,
2.101066, 0.4066217, 1.343438, 1, 0, 0, 1, 1,
2.121179, 0.7324528, 0.6031501, 1, 0, 0, 1, 1,
2.125058, -0.6011628, 2.204059, 1, 0, 0, 1, 1,
2.179813, 1.068449, 0.1519994, 0, 0, 0, 1, 1,
2.184206, 0.7009357, 2.946789, 0, 0, 0, 1, 1,
2.217936, -0.6090025, 0.4739828, 0, 0, 0, 1, 1,
2.21878, 1.153846, -0.1541191, 0, 0, 0, 1, 1,
2.229707, 0.357719, -0.2659396, 0, 0, 0, 1, 1,
2.37646, 0.2065819, 2.044935, 0, 0, 0, 1, 1,
2.441303, 1.848998, 2.330277, 0, 0, 0, 1, 1,
2.487957, 0.7615946, 0.8050128, 1, 1, 1, 1, 1,
2.523576, -0.2613771, 2.408444, 1, 1, 1, 1, 1,
2.546206, 0.2552035, 1.534229, 1, 1, 1, 1, 1,
2.5857, -1.340386, 2.794058, 1, 1, 1, 1, 1,
2.638689, -0.4029608, 0.5520368, 1, 1, 1, 1, 1,
2.836142, -1.219267, 2.97749, 1, 1, 1, 1, 1,
3.066713, 0.2553201, 1.096113, 1, 1, 1, 1, 1
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
var radius = 9.47081;
var distance = 33.26582;
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
mvMatrix.translate( -0.04692781, 0.2334702, 0.201653 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.26582);
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
