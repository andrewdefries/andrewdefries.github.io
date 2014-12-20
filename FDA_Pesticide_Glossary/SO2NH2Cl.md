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
-3.387278, 1.86372, 0.9031376, 1, 0, 0, 1,
-3.151088, -1.498407, -0.9779771, 1, 0.007843138, 0, 1,
-3.148347, 0.7737212, -1.62704, 1, 0.01176471, 0, 1,
-2.806028, 0.4900555, -0.524568, 1, 0.01960784, 0, 1,
-2.568358, -0.3013387, -1.851035, 1, 0.02352941, 0, 1,
-2.511818, 0.1384261, -2.19118, 1, 0.03137255, 0, 1,
-2.471767, 1.790937, -1.330962, 1, 0.03529412, 0, 1,
-2.446124, 1.278232, 0.1184347, 1, 0.04313726, 0, 1,
-2.423222, -1.520766, -4.272747, 1, 0.04705882, 0, 1,
-2.394254, 0.7416755, -0.1831331, 1, 0.05490196, 0, 1,
-2.386621, -0.9976609, -2.679949, 1, 0.05882353, 0, 1,
-2.285606, 1.536487, 0.6333209, 1, 0.06666667, 0, 1,
-2.259936, -0.03403519, -2.863831, 1, 0.07058824, 0, 1,
-2.249615, 0.2925902, -1.282637, 1, 0.07843138, 0, 1,
-2.232892, 1.108922, -0.9795274, 1, 0.08235294, 0, 1,
-2.219135, 0.4869144, -2.275146, 1, 0.09019608, 0, 1,
-2.186138, 0.1587301, -1.267985, 1, 0.09411765, 0, 1,
-2.179836, -0.8479768, -3.148694, 1, 0.1019608, 0, 1,
-2.081628, -0.8792346, -2.547288, 1, 0.1098039, 0, 1,
-2.054251, 1.583223, -2.606874, 1, 0.1137255, 0, 1,
-2.037542, 0.8930719, -0.5328498, 1, 0.1215686, 0, 1,
-2.000025, 0.7192801, -0.8779896, 1, 0.1254902, 0, 1,
-1.990636, 0.6634322, -0.5488077, 1, 0.1333333, 0, 1,
-1.98682, 1.820921, 0.4136268, 1, 0.1372549, 0, 1,
-1.981448, -2.693415, -2.506953, 1, 0.145098, 0, 1,
-1.960144, 0.7049686, -1.45021, 1, 0.1490196, 0, 1,
-1.93831, -1.217189, -2.027867, 1, 0.1568628, 0, 1,
-1.936009, -0.6616598, -1.290432, 1, 0.1607843, 0, 1,
-1.911771, 0.2137164, -2.030257, 1, 0.1686275, 0, 1,
-1.890862, 0.3103643, -2.532557, 1, 0.172549, 0, 1,
-1.883254, 0.07841545, 0.5882561, 1, 0.1803922, 0, 1,
-1.859557, -1.684824, -1.76421, 1, 0.1843137, 0, 1,
-1.845963, -1.719159, -2.128626, 1, 0.1921569, 0, 1,
-1.841906, 1.582937, -0.5442541, 1, 0.1960784, 0, 1,
-1.840948, -0.2310008, 1.086874, 1, 0.2039216, 0, 1,
-1.839475, 0.2703806, -2.108249, 1, 0.2117647, 0, 1,
-1.83604, -0.8016827, -2.674877, 1, 0.2156863, 0, 1,
-1.823138, -0.1364975, 0.1362331, 1, 0.2235294, 0, 1,
-1.787759, -0.02305686, -2.141937, 1, 0.227451, 0, 1,
-1.779991, -0.9614338, -2.485397, 1, 0.2352941, 0, 1,
-1.769854, 0.7830902, -0.9659771, 1, 0.2392157, 0, 1,
-1.768886, 0.7321933, -2.687146, 1, 0.2470588, 0, 1,
-1.757907, -0.03182572, -1.889869, 1, 0.2509804, 0, 1,
-1.752552, -0.7067116, -3.674254, 1, 0.2588235, 0, 1,
-1.706172, -2.0423, -3.871459, 1, 0.2627451, 0, 1,
-1.694726, 0.8590178, -0.05883009, 1, 0.2705882, 0, 1,
-1.694043, 1.0075, -2.625388, 1, 0.2745098, 0, 1,
-1.693086, -0.2455598, -3.228517, 1, 0.282353, 0, 1,
-1.66657, 0.2903527, -1.734582, 1, 0.2862745, 0, 1,
-1.659475, -1.892236, -1.2953, 1, 0.2941177, 0, 1,
-1.655913, 0.2719042, -0.8065057, 1, 0.3019608, 0, 1,
-1.643483, -0.3186725, -1.175918, 1, 0.3058824, 0, 1,
-1.62494, -0.07331513, -2.134789, 1, 0.3137255, 0, 1,
-1.623065, 0.876147, -0.6116694, 1, 0.3176471, 0, 1,
-1.61571, 2.156483, -1.117128, 1, 0.3254902, 0, 1,
-1.615446, -0.6812977, -2.634584, 1, 0.3294118, 0, 1,
-1.609683, -0.9014313, -4.847912, 1, 0.3372549, 0, 1,
-1.600716, 0.5336705, -0.02442108, 1, 0.3411765, 0, 1,
-1.599365, -1.349811, -3.205998, 1, 0.3490196, 0, 1,
-1.582538, -0.2487872, -1.367208, 1, 0.3529412, 0, 1,
-1.578336, -0.07512401, -0.4276084, 1, 0.3607843, 0, 1,
-1.565853, -0.3537934, -2.194553, 1, 0.3647059, 0, 1,
-1.565233, 0.8662384, 1.520551, 1, 0.372549, 0, 1,
-1.545643, 0.1598439, -1.117768, 1, 0.3764706, 0, 1,
-1.513747, -0.8260097, -2.183441, 1, 0.3843137, 0, 1,
-1.512709, -0.6540033, -2.977797, 1, 0.3882353, 0, 1,
-1.511235, 1.502378, -1.672061, 1, 0.3960784, 0, 1,
-1.504463, 0.3098474, -0.8785354, 1, 0.4039216, 0, 1,
-1.49993, -0.1405318, 0.2171553, 1, 0.4078431, 0, 1,
-1.48614, 0.3787435, -1.346992, 1, 0.4156863, 0, 1,
-1.485193, -1.594397, -2.565328, 1, 0.4196078, 0, 1,
-1.477101, 0.3205287, -1.829186, 1, 0.427451, 0, 1,
-1.475516, -0.4196339, -1.812905, 1, 0.4313726, 0, 1,
-1.472916, 0.6811642, -1.466768, 1, 0.4392157, 0, 1,
-1.464653, -0.4428842, -3.830454, 1, 0.4431373, 0, 1,
-1.45564, -1.14977, -2.476156, 1, 0.4509804, 0, 1,
-1.455335, -0.2652421, -2.180585, 1, 0.454902, 0, 1,
-1.449987, -1.142863, -1.692884, 1, 0.4627451, 0, 1,
-1.447005, -0.5475325, -2.490639, 1, 0.4666667, 0, 1,
-1.442508, 0.008415504, -0.6310354, 1, 0.4745098, 0, 1,
-1.441674, -0.3724556, -1.552983, 1, 0.4784314, 0, 1,
-1.441138, -1.427474, -0.5866892, 1, 0.4862745, 0, 1,
-1.439921, -0.1721603, -1.103731, 1, 0.4901961, 0, 1,
-1.421958, 0.101967, -2.105159, 1, 0.4980392, 0, 1,
-1.421521, 1.578803, -0.9505848, 1, 0.5058824, 0, 1,
-1.413167, 0.2667992, -2.782351, 1, 0.509804, 0, 1,
-1.41264, -0.702998, -2.89277, 1, 0.5176471, 0, 1,
-1.407756, -0.233149, -0.4842856, 1, 0.5215687, 0, 1,
-1.392143, 1.191323, -0.9412895, 1, 0.5294118, 0, 1,
-1.388731, -1.261735, -1.893927, 1, 0.5333334, 0, 1,
-1.384147, 0.04803213, -1.339809, 1, 0.5411765, 0, 1,
-1.368422, 1.098783, -1.987458, 1, 0.5450981, 0, 1,
-1.368071, 0.3070297, -2.203853, 1, 0.5529412, 0, 1,
-1.354818, -0.9330245, -2.842431, 1, 0.5568628, 0, 1,
-1.343357, 0.6690352, -0.3650053, 1, 0.5647059, 0, 1,
-1.342426, -2.206581, -3.283447, 1, 0.5686275, 0, 1,
-1.341467, -0.7324744, -3.940337, 1, 0.5764706, 0, 1,
-1.335927, 0.06527501, -0.4701608, 1, 0.5803922, 0, 1,
-1.334343, 0.5798131, -1.561996, 1, 0.5882353, 0, 1,
-1.333644, -2.244287, -3.660211, 1, 0.5921569, 0, 1,
-1.328005, 0.09874805, -1.073187, 1, 0.6, 0, 1,
-1.32671, 0.6898921, -0.5527116, 1, 0.6078432, 0, 1,
-1.31806, 0.2512485, -1.545868, 1, 0.6117647, 0, 1,
-1.311963, -1.085788, -2.001117, 1, 0.6196079, 0, 1,
-1.31137, -1.190044, -2.710997, 1, 0.6235294, 0, 1,
-1.291943, 0.8283194, -2.076036, 1, 0.6313726, 0, 1,
-1.284358, 1.046218, -2.309248, 1, 0.6352941, 0, 1,
-1.283577, 0.777213, -0.4238153, 1, 0.6431373, 0, 1,
-1.281273, -2.485189, -1.937775, 1, 0.6470588, 0, 1,
-1.27999, -0.8522226, -2.1414, 1, 0.654902, 0, 1,
-1.270011, -0.9525614, -2.879572, 1, 0.6588235, 0, 1,
-1.262318, -1.676146, -2.228264, 1, 0.6666667, 0, 1,
-1.259839, 0.566366, -1.801561, 1, 0.6705883, 0, 1,
-1.257589, -1.051419, -3.914487, 1, 0.6784314, 0, 1,
-1.256858, -0.03776109, -1.034148, 1, 0.682353, 0, 1,
-1.253176, -0.3303597, -1.648392, 1, 0.6901961, 0, 1,
-1.250632, -2.311421, -3.000894, 1, 0.6941177, 0, 1,
-1.243986, 1.434725, -0.2023613, 1, 0.7019608, 0, 1,
-1.24388, 0.1645745, -1.991212, 1, 0.7098039, 0, 1,
-1.239465, -0.4220174, -0.6004276, 1, 0.7137255, 0, 1,
-1.232129, -1.159749, -2.69036, 1, 0.7215686, 0, 1,
-1.225757, 1.967022, -0.6495807, 1, 0.7254902, 0, 1,
-1.223356, 0.8843446, -0.8305503, 1, 0.7333333, 0, 1,
-1.208906, 0.7868357, 0.01655127, 1, 0.7372549, 0, 1,
-1.20716, 0.6888295, -0.4016176, 1, 0.7450981, 0, 1,
-1.199625, -0.4268448, -2.311625, 1, 0.7490196, 0, 1,
-1.198393, 0.4468409, -3.610895, 1, 0.7568628, 0, 1,
-1.173272, -1.096344, -1.57227, 1, 0.7607843, 0, 1,
-1.165449, 1.079089, -0.7135477, 1, 0.7686275, 0, 1,
-1.159031, -1.335818, -4.214856, 1, 0.772549, 0, 1,
-1.154288, -0.6080784, -2.892184, 1, 0.7803922, 0, 1,
-1.15271, -0.4856133, -2.730336, 1, 0.7843137, 0, 1,
-1.151565, 1.262985, -0.5365495, 1, 0.7921569, 0, 1,
-1.147815, 0.5466452, 0.1354196, 1, 0.7960784, 0, 1,
-1.129394, 0.9157125, -0.4355821, 1, 0.8039216, 0, 1,
-1.119976, -1.283199, -3.816534, 1, 0.8117647, 0, 1,
-1.114023, -1.305079, -2.319337, 1, 0.8156863, 0, 1,
-1.112555, 0.5553656, -2.161887, 1, 0.8235294, 0, 1,
-1.11184, 0.9052656, -1.255192, 1, 0.827451, 0, 1,
-1.104093, -0.7093514, -1.206121, 1, 0.8352941, 0, 1,
-1.08981, 0.987116, -0.6617067, 1, 0.8392157, 0, 1,
-1.07072, 0.8128281, -0.1368586, 1, 0.8470588, 0, 1,
-1.070471, -1.43928, -0.8568584, 1, 0.8509804, 0, 1,
-1.066986, -0.4141255, -1.701054, 1, 0.8588235, 0, 1,
-1.059406, -0.4866916, -1.356581, 1, 0.8627451, 0, 1,
-1.054882, 0.3693675, -1.606681, 1, 0.8705882, 0, 1,
-1.054521, 0.2875742, -1.38338, 1, 0.8745098, 0, 1,
-1.051247, 0.5762923, -2.287247, 1, 0.8823529, 0, 1,
-1.047381, -0.1845337, -1.890192, 1, 0.8862745, 0, 1,
-1.026905, 0.2842276, -2.961061, 1, 0.8941177, 0, 1,
-1.021611, 0.3354174, -2.52294, 1, 0.8980392, 0, 1,
-1.01908, -1.023245, -3.116007, 1, 0.9058824, 0, 1,
-1.014125, 2.086603, -1.371505, 1, 0.9137255, 0, 1,
-1.012609, -1.161665, -1.370543, 1, 0.9176471, 0, 1,
-1.010422, -2.385586, -3.522043, 1, 0.9254902, 0, 1,
-1.000888, 0.7766044, -0.418779, 1, 0.9294118, 0, 1,
-0.9985589, -0.9502791, -2.357539, 1, 0.9372549, 0, 1,
-0.9983472, -0.5011272, -2.335984, 1, 0.9411765, 0, 1,
-0.9974349, 0.6670724, -1.823157, 1, 0.9490196, 0, 1,
-0.9895775, -0.3323081, -2.45922, 1, 0.9529412, 0, 1,
-0.9866001, -0.7095622, -3.068068, 1, 0.9607843, 0, 1,
-0.9847084, -0.1953191, -2.385292, 1, 0.9647059, 0, 1,
-0.977382, -1.679147, -3.798444, 1, 0.972549, 0, 1,
-0.9745506, 0.6847122, -3.567529, 1, 0.9764706, 0, 1,
-0.9721464, 1.692406, -1.509295, 1, 0.9843137, 0, 1,
-0.9651554, -1.793271, -2.610237, 1, 0.9882353, 0, 1,
-0.9501196, -0.04868482, -0.3979892, 1, 0.9960784, 0, 1,
-0.9493008, -0.8233921, -2.516198, 0.9960784, 1, 0, 1,
-0.9492509, 1.208574, -2.345828, 0.9921569, 1, 0, 1,
-0.9462246, -1.888172, -3.557699, 0.9843137, 1, 0, 1,
-0.9444174, -1.630551, -2.932537, 0.9803922, 1, 0, 1,
-0.9416227, -0.6874309, -0.8208882, 0.972549, 1, 0, 1,
-0.9394841, 0.08977938, -2.902302, 0.9686275, 1, 0, 1,
-0.9391295, 1.682111, 1.421051, 0.9607843, 1, 0, 1,
-0.9381931, 0.1617791, -2.744672, 0.9568627, 1, 0, 1,
-0.9359586, 0.7568353, 0.04929349, 0.9490196, 1, 0, 1,
-0.9353069, -0.2187807, -2.434073, 0.945098, 1, 0, 1,
-0.9352911, -0.03278604, -1.42894, 0.9372549, 1, 0, 1,
-0.9271684, 0.4270098, -1.956883, 0.9333333, 1, 0, 1,
-0.9262834, -0.801396, -2.134016, 0.9254902, 1, 0, 1,
-0.9234081, 0.1929054, -1.830267, 0.9215686, 1, 0, 1,
-0.9137909, 0.451785, 0.8510666, 0.9137255, 1, 0, 1,
-0.9119116, 0.1471351, -1.774894, 0.9098039, 1, 0, 1,
-0.9105197, -0.3002291, -1.509471, 0.9019608, 1, 0, 1,
-0.9101399, 1.211088, -0.6884881, 0.8941177, 1, 0, 1,
-0.9080253, -1.32677, -2.235858, 0.8901961, 1, 0, 1,
-0.9056338, 1.95938, -0.2693422, 0.8823529, 1, 0, 1,
-0.9023207, -0.8715931, -2.439665, 0.8784314, 1, 0, 1,
-0.9020154, 1.054471, -2.410726, 0.8705882, 1, 0, 1,
-0.9000381, 0.7974577, -1.58857, 0.8666667, 1, 0, 1,
-0.8960502, -0.5797486, -3.205158, 0.8588235, 1, 0, 1,
-0.8903688, 0.8850321, -1.280651, 0.854902, 1, 0, 1,
-0.889326, 0.6928437, -0.6058879, 0.8470588, 1, 0, 1,
-0.8874254, 0.791931, -2.092745, 0.8431373, 1, 0, 1,
-0.885314, 1.758148, -0.8819183, 0.8352941, 1, 0, 1,
-0.8847524, 1.851263, 0.3706264, 0.8313726, 1, 0, 1,
-0.8828194, 0.8245669, -1.465384, 0.8235294, 1, 0, 1,
-0.8795046, 0.6526991, -2.452736, 0.8196079, 1, 0, 1,
-0.8772694, -0.1303722, -2.67485, 0.8117647, 1, 0, 1,
-0.8703022, -0.154666, -1.825556, 0.8078431, 1, 0, 1,
-0.8701478, -0.4041249, -1.235165, 0.8, 1, 0, 1,
-0.869503, 1.105203, 0.4188882, 0.7921569, 1, 0, 1,
-0.8569077, -0.1601602, -2.395764, 0.7882353, 1, 0, 1,
-0.8537896, -1.924098, -2.189081, 0.7803922, 1, 0, 1,
-0.8491501, 0.9348961, -0.8372387, 0.7764706, 1, 0, 1,
-0.8467771, 0.8437345, 0.171915, 0.7686275, 1, 0, 1,
-0.8442348, -0.4246345, -2.164308, 0.7647059, 1, 0, 1,
-0.8436524, -0.315987, -1.749667, 0.7568628, 1, 0, 1,
-0.8433843, 1.714769, 1.388177, 0.7529412, 1, 0, 1,
-0.8343572, 0.8598747, -0.289351, 0.7450981, 1, 0, 1,
-0.8331147, 0.244718, -1.558743, 0.7411765, 1, 0, 1,
-0.8307146, 2.150575, 0.182252, 0.7333333, 1, 0, 1,
-0.8291383, 0.3472469, -1.186267, 0.7294118, 1, 0, 1,
-0.8289655, -0.8343463, -2.327103, 0.7215686, 1, 0, 1,
-0.8284552, 0.5359186, -0.6376493, 0.7176471, 1, 0, 1,
-0.8257676, -0.3750818, -1.300355, 0.7098039, 1, 0, 1,
-0.8223048, -0.7579198, -2.857411, 0.7058824, 1, 0, 1,
-0.8218421, -0.07663473, -0.5590679, 0.6980392, 1, 0, 1,
-0.8177145, 0.2508123, -2.102551, 0.6901961, 1, 0, 1,
-0.8101799, -1.443835, -3.108999, 0.6862745, 1, 0, 1,
-0.8036149, -0.06398179, -3.534954, 0.6784314, 1, 0, 1,
-0.8013409, 0.2777629, -1.055189, 0.6745098, 1, 0, 1,
-0.7943682, 0.2031282, -0.4046965, 0.6666667, 1, 0, 1,
-0.7892469, 0.3544565, -1.376447, 0.6627451, 1, 0, 1,
-0.7784404, -0.435153, -0.06364223, 0.654902, 1, 0, 1,
-0.7722896, -0.9090142, -0.7521941, 0.6509804, 1, 0, 1,
-0.7713127, -0.8524398, -0.834585, 0.6431373, 1, 0, 1,
-0.7688413, 0.5905936, -0.746038, 0.6392157, 1, 0, 1,
-0.7678893, 0.9609988, -0.7047731, 0.6313726, 1, 0, 1,
-0.762616, 1.284782, -1.211597, 0.627451, 1, 0, 1,
-0.7617962, 1.721101, -0.5809703, 0.6196079, 1, 0, 1,
-0.7568684, -0.7382728, -3.109592, 0.6156863, 1, 0, 1,
-0.7560583, -1.506643, -3.013477, 0.6078432, 1, 0, 1,
-0.7558375, 1.585239, 0.5493593, 0.6039216, 1, 0, 1,
-0.7487242, 0.9724041, -0.8675904, 0.5960785, 1, 0, 1,
-0.7425924, -2.492899, -4.060811, 0.5882353, 1, 0, 1,
-0.738831, 0.7598061, -1.797936, 0.5843138, 1, 0, 1,
-0.7384362, 1.623438, -1.179202, 0.5764706, 1, 0, 1,
-0.7377277, -0.4368955, -2.013644, 0.572549, 1, 0, 1,
-0.7365367, -0.03952833, -1.197721, 0.5647059, 1, 0, 1,
-0.7345674, -0.6788624, -1.131305, 0.5607843, 1, 0, 1,
-0.7242624, -0.8717775, -3.985805, 0.5529412, 1, 0, 1,
-0.7192544, 1.119672, -1.855756, 0.5490196, 1, 0, 1,
-0.7171795, -0.5264563, -1.345207, 0.5411765, 1, 0, 1,
-0.7171375, 1.240998, 1.109212, 0.5372549, 1, 0, 1,
-0.7135693, 0.06592593, -2.333279, 0.5294118, 1, 0, 1,
-0.713129, 0.1764189, -1.905549, 0.5254902, 1, 0, 1,
-0.7125607, 0.9691589, 0.9645944, 0.5176471, 1, 0, 1,
-0.7026581, 0.4119168, -0.6574067, 0.5137255, 1, 0, 1,
-0.6989755, 1.03779, -1.66624, 0.5058824, 1, 0, 1,
-0.6971007, 0.6879239, 0.2248074, 0.5019608, 1, 0, 1,
-0.6969255, -1.61888, -1.798931, 0.4941176, 1, 0, 1,
-0.6960388, 1.081372, 0.6391955, 0.4862745, 1, 0, 1,
-0.694118, 0.5458339, -1.993772, 0.4823529, 1, 0, 1,
-0.6893743, 1.592401, 0.2738056, 0.4745098, 1, 0, 1,
-0.6892067, 0.1014835, -1.721057, 0.4705882, 1, 0, 1,
-0.6814059, 0.9502392, 0.6342814, 0.4627451, 1, 0, 1,
-0.6797678, -0.5714204, -3.254433, 0.4588235, 1, 0, 1,
-0.6774702, 0.6176798, -1.55649, 0.4509804, 1, 0, 1,
-0.670966, -0.6169073, -2.79862, 0.4470588, 1, 0, 1,
-0.6644469, -1.878231, -1.418794, 0.4392157, 1, 0, 1,
-0.6600477, 0.2956274, -1.391609, 0.4352941, 1, 0, 1,
-0.6494824, 1.776702, -0.8486853, 0.427451, 1, 0, 1,
-0.6493488, -0.6577712, -2.530401, 0.4235294, 1, 0, 1,
-0.646819, -0.5622106, -3.125243, 0.4156863, 1, 0, 1,
-0.6405845, 0.531935, -0.282136, 0.4117647, 1, 0, 1,
-0.6381738, -0.6947201, -2.040249, 0.4039216, 1, 0, 1,
-0.6381576, 0.3502911, -1.652816, 0.3960784, 1, 0, 1,
-0.6309336, -1.059693, -3.796749, 0.3921569, 1, 0, 1,
-0.6284082, 0.675088, -2.314987, 0.3843137, 1, 0, 1,
-0.6273667, -1.550235, -1.856415, 0.3803922, 1, 0, 1,
-0.6179669, 3.208098, 1.753946, 0.372549, 1, 0, 1,
-0.6118884, 0.6726219, -1.072324, 0.3686275, 1, 0, 1,
-0.6083313, 1.300067, -0.1782538, 0.3607843, 1, 0, 1,
-0.6070419, 0.4463846, -0.1685166, 0.3568628, 1, 0, 1,
-0.5939395, 0.9557313, -0.0451674, 0.3490196, 1, 0, 1,
-0.587454, 0.7672032, -1.830441, 0.345098, 1, 0, 1,
-0.5837469, -0.2527724, -2.279982, 0.3372549, 1, 0, 1,
-0.5810717, -0.7055023, -1.0178, 0.3333333, 1, 0, 1,
-0.5782722, 0.5036395, 0.3665613, 0.3254902, 1, 0, 1,
-0.5771708, 1.979085, -1.035246, 0.3215686, 1, 0, 1,
-0.5749094, -2.047787, -2.80186, 0.3137255, 1, 0, 1,
-0.5699719, 0.9688364, -0.7521155, 0.3098039, 1, 0, 1,
-0.566839, 0.5437825, -1.200561, 0.3019608, 1, 0, 1,
-0.5664458, 0.5328599, -1.11438, 0.2941177, 1, 0, 1,
-0.5618181, 3.217751, -0.434866, 0.2901961, 1, 0, 1,
-0.5524661, 1.2653, -0.1724961, 0.282353, 1, 0, 1,
-0.5489236, 0.7174961, -0.6315104, 0.2784314, 1, 0, 1,
-0.5483086, -0.003054082, -1.628726, 0.2705882, 1, 0, 1,
-0.5457996, 0.5309479, -1.003695, 0.2666667, 1, 0, 1,
-0.5427449, 0.7461143, -0.5383631, 0.2588235, 1, 0, 1,
-0.5383249, 2.033104, -0.01269, 0.254902, 1, 0, 1,
-0.5383143, 0.3765979, -0.132419, 0.2470588, 1, 0, 1,
-0.5346611, 0.781433, -0.3051682, 0.2431373, 1, 0, 1,
-0.5296232, 1.85766, -0.1719556, 0.2352941, 1, 0, 1,
-0.5277234, -0.3375272, -2.259708, 0.2313726, 1, 0, 1,
-0.5276798, -1.19193, -2.397663, 0.2235294, 1, 0, 1,
-0.5241831, 1.691781, -0.1985086, 0.2196078, 1, 0, 1,
-0.5236288, -1.187084, -1.853184, 0.2117647, 1, 0, 1,
-0.5187131, -0.1228631, -2.013279, 0.2078431, 1, 0, 1,
-0.515873, -0.6679935, -2.680296, 0.2, 1, 0, 1,
-0.511892, -1.493819, -4.035412, 0.1921569, 1, 0, 1,
-0.5098186, 0.2018183, -0.01485036, 0.1882353, 1, 0, 1,
-0.5083433, 0.3058843, -1.61024, 0.1803922, 1, 0, 1,
-0.5066297, 0.09557254, -0.8654686, 0.1764706, 1, 0, 1,
-0.5047504, 1.218546, -0.06417282, 0.1686275, 1, 0, 1,
-0.5010195, 1.364324, -0.2900643, 0.1647059, 1, 0, 1,
-0.4994397, -0.9049795, -1.769095, 0.1568628, 1, 0, 1,
-0.4991661, 1.053107, 2.080666, 0.1529412, 1, 0, 1,
-0.4988528, -2.136631, -4.395995, 0.145098, 1, 0, 1,
-0.4965566, 1.332891, -0.1181782, 0.1411765, 1, 0, 1,
-0.4927452, -1.372999, -1.742953, 0.1333333, 1, 0, 1,
-0.4907242, -0.9493412, -0.9559451, 0.1294118, 1, 0, 1,
-0.490305, 0.6206537, -0.5743814, 0.1215686, 1, 0, 1,
-0.4893379, 0.2992162, -1.501262, 0.1176471, 1, 0, 1,
-0.4847212, 0.3370251, -0.3680784, 0.1098039, 1, 0, 1,
-0.4841637, 0.6750853, 1.617978, 0.1058824, 1, 0, 1,
-0.4833093, -0.5127264, -3.197571, 0.09803922, 1, 0, 1,
-0.4826459, -1.238225, -3.932765, 0.09019608, 1, 0, 1,
-0.4782659, -0.2347761, -2.762965, 0.08627451, 1, 0, 1,
-0.4778738, 0.8639964, -0.3569634, 0.07843138, 1, 0, 1,
-0.4761633, -0.6238547, -3.915824, 0.07450981, 1, 0, 1,
-0.4731871, -0.2126402, -1.865317, 0.06666667, 1, 0, 1,
-0.4722516, -0.05342143, -1.133336, 0.0627451, 1, 0, 1,
-0.4709392, 0.5316906, -0.3513554, 0.05490196, 1, 0, 1,
-0.464206, 1.244708, 0.4480249, 0.05098039, 1, 0, 1,
-0.4602883, -0.7006297, -3.309393, 0.04313726, 1, 0, 1,
-0.4542051, 2.453311, 0.3173082, 0.03921569, 1, 0, 1,
-0.4481613, 1.765428, 1.8099, 0.03137255, 1, 0, 1,
-0.4393792, 1.156168, -0.4348011, 0.02745098, 1, 0, 1,
-0.4341872, -0.3930722, -2.269468, 0.01960784, 1, 0, 1,
-0.4339848, -0.334526, -2.132576, 0.01568628, 1, 0, 1,
-0.4277413, 1.5708, -2.526855, 0.007843138, 1, 0, 1,
-0.4276872, -0.5557389, -4.356449, 0.003921569, 1, 0, 1,
-0.422426, -0.3338121, -1.583982, 0, 1, 0.003921569, 1,
-0.4193016, 0.2858468, -0.2563051, 0, 1, 0.01176471, 1,
-0.4171135, 0.02952269, -2.065989, 0, 1, 0.01568628, 1,
-0.4125645, 0.3866189, -1.812029, 0, 1, 0.02352941, 1,
-0.4104631, 0.1472149, -0.5206341, 0, 1, 0.02745098, 1,
-0.4077797, 0.3453271, -1.099796, 0, 1, 0.03529412, 1,
-0.4077336, 0.5001302, -1.927679, 0, 1, 0.03921569, 1,
-0.4026754, -0.6196318, -2.392803, 0, 1, 0.04705882, 1,
-0.4009854, -0.003560602, -0.8040943, 0, 1, 0.05098039, 1,
-0.4004908, 0.2465614, -0.8498706, 0, 1, 0.05882353, 1,
-0.3993498, 0.2174078, -2.377023, 0, 1, 0.0627451, 1,
-0.3939031, 2.243048, 0.5586452, 0, 1, 0.07058824, 1,
-0.3930854, 0.9058764, 0.03589654, 0, 1, 0.07450981, 1,
-0.3926614, -0.4305159, -3.101395, 0, 1, 0.08235294, 1,
-0.3925289, 0.4346571, -2.490992, 0, 1, 0.08627451, 1,
-0.3878595, 0.1221718, -0.8041644, 0, 1, 0.09411765, 1,
-0.3871815, 0.03005315, 0.1821096, 0, 1, 0.1019608, 1,
-0.3858528, -0.1404954, -0.9732611, 0, 1, 0.1058824, 1,
-0.3845668, 0.2110542, -0.3849808, 0, 1, 0.1137255, 1,
-0.3831498, -0.7693548, -1.645714, 0, 1, 0.1176471, 1,
-0.3831452, 0.4269015, 0.2566487, 0, 1, 0.1254902, 1,
-0.3802926, 0.364836, -0.2622601, 0, 1, 0.1294118, 1,
-0.3800332, -0.8464412, -2.646971, 0, 1, 0.1372549, 1,
-0.3765991, -0.1343522, -0.2583891, 0, 1, 0.1411765, 1,
-0.3757611, -0.9501914, -2.977976, 0, 1, 0.1490196, 1,
-0.3753152, -2.556634, -3.65064, 0, 1, 0.1529412, 1,
-0.3729028, -1.475074, -2.519554, 0, 1, 0.1607843, 1,
-0.3722872, -0.06615378, -2.366176, 0, 1, 0.1647059, 1,
-0.3641838, 2.613728, -0.5528963, 0, 1, 0.172549, 1,
-0.3594987, 1.111804, 0.0939013, 0, 1, 0.1764706, 1,
-0.3587847, -0.6189172, -2.158074, 0, 1, 0.1843137, 1,
-0.351676, 1.517265, -1.043303, 0, 1, 0.1882353, 1,
-0.3484879, -0.4299972, -2.893141, 0, 1, 0.1960784, 1,
-0.3458863, -2.041017, -1.671925, 0, 1, 0.2039216, 1,
-0.3429389, -0.2807696, -2.121902, 0, 1, 0.2078431, 1,
-0.3427405, -1.546179, -3.999547, 0, 1, 0.2156863, 1,
-0.3420892, -0.1710417, -1.245271, 0, 1, 0.2196078, 1,
-0.3395743, 0.8322439, 0.4875118, 0, 1, 0.227451, 1,
-0.3336783, 0.4728984, 0.005093179, 0, 1, 0.2313726, 1,
-0.3296672, -1.569184, -0.9216645, 0, 1, 0.2392157, 1,
-0.3244009, 0.3566611, -0.8377635, 0, 1, 0.2431373, 1,
-0.3235928, 0.7778174, -0.584323, 0, 1, 0.2509804, 1,
-0.3233946, -0.3642076, -4.385011, 0, 1, 0.254902, 1,
-0.3207787, -0.5823992, -3.739531, 0, 1, 0.2627451, 1,
-0.3197201, -1.377056, -4.450692, 0, 1, 0.2666667, 1,
-0.3190394, -0.04828544, -2.407871, 0, 1, 0.2745098, 1,
-0.3175126, -0.8947942, -2.849664, 0, 1, 0.2784314, 1,
-0.3173829, -1.052055, -1.816861, 0, 1, 0.2862745, 1,
-0.3116566, 0.6656995, -1.39869, 0, 1, 0.2901961, 1,
-0.3062608, 0.541676, 0.5443091, 0, 1, 0.2980392, 1,
-0.3054985, -0.8159584, -3.408149, 0, 1, 0.3058824, 1,
-0.3052106, -1.425525, -2.98264, 0, 1, 0.3098039, 1,
-0.303668, 0.2926553, -1.143225, 0, 1, 0.3176471, 1,
-0.3023877, 0.676622, -0.7026694, 0, 1, 0.3215686, 1,
-0.3022521, -0.7318484, -2.796703, 0, 1, 0.3294118, 1,
-0.3009439, -1.78231, -3.523323, 0, 1, 0.3333333, 1,
-0.2986575, 1.091425, -1.902499, 0, 1, 0.3411765, 1,
-0.2978838, -1.156046, -3.02252, 0, 1, 0.345098, 1,
-0.2940781, -0.22883, -2.132706, 0, 1, 0.3529412, 1,
-0.2870619, 0.2962248, -2.279314, 0, 1, 0.3568628, 1,
-0.2869288, 0.9807019, -1.729551, 0, 1, 0.3647059, 1,
-0.2862737, 1.339067, -2.261371, 0, 1, 0.3686275, 1,
-0.2776231, -0.4529965, -2.508229, 0, 1, 0.3764706, 1,
-0.2691046, 0.8529772, -1.968466, 0, 1, 0.3803922, 1,
-0.2680019, -0.6850846, -2.243798, 0, 1, 0.3882353, 1,
-0.2604504, 2.13533, -1.303649, 0, 1, 0.3921569, 1,
-0.2603183, -1.7698, -2.981768, 0, 1, 0.4, 1,
-0.2602827, 0.1175143, 0.09499823, 0, 1, 0.4078431, 1,
-0.2586589, 0.05280268, 0.1610298, 0, 1, 0.4117647, 1,
-0.2565515, 1.276906, 0.9689916, 0, 1, 0.4196078, 1,
-0.254779, 0.4007459, -1.347799, 0, 1, 0.4235294, 1,
-0.2507269, 1.105635, -1.3033, 0, 1, 0.4313726, 1,
-0.2484082, -0.2108171, -1.943768, 0, 1, 0.4352941, 1,
-0.2479362, 0.5925994, 0.5294919, 0, 1, 0.4431373, 1,
-0.2440425, 0.5194997, -0.5182371, 0, 1, 0.4470588, 1,
-0.2383206, -0.7707607, -2.748755, 0, 1, 0.454902, 1,
-0.2339183, -0.1041175, -1.876424, 0, 1, 0.4588235, 1,
-0.233815, 0.7000728, -0.225627, 0, 1, 0.4666667, 1,
-0.2332653, 0.0893044, -0.02136626, 0, 1, 0.4705882, 1,
-0.2328734, -0.1365498, -0.6325735, 0, 1, 0.4784314, 1,
-0.2317998, 0.5390521, 0.2452702, 0, 1, 0.4823529, 1,
-0.2293942, -1.339973, -4.681917, 0, 1, 0.4901961, 1,
-0.2273676, 0.7570625, -0.7193337, 0, 1, 0.4941176, 1,
-0.2259959, -0.9100142, -5.10038, 0, 1, 0.5019608, 1,
-0.2233465, 0.213945, -1.641343, 0, 1, 0.509804, 1,
-0.2215834, -0.1822379, -1.420665, 0, 1, 0.5137255, 1,
-0.2202264, 0.4951317, 0.3090509, 0, 1, 0.5215687, 1,
-0.2198002, 0.4727037, -0.760066, 0, 1, 0.5254902, 1,
-0.2164283, -0.8581769, -3.741624, 0, 1, 0.5333334, 1,
-0.2102494, -0.4337373, -2.682151, 0, 1, 0.5372549, 1,
-0.2083177, -0.4783172, -2.622008, 0, 1, 0.5450981, 1,
-0.1980048, -0.8593007, -2.210688, 0, 1, 0.5490196, 1,
-0.1947505, -1.442831, -2.125935, 0, 1, 0.5568628, 1,
-0.1891491, 0.8282843, -0.6313899, 0, 1, 0.5607843, 1,
-0.1881217, -0.6733144, -2.971238, 0, 1, 0.5686275, 1,
-0.1799999, 0.9709165, 0.797453, 0, 1, 0.572549, 1,
-0.179334, 0.5924425, -1.082183, 0, 1, 0.5803922, 1,
-0.1793156, 1.761763, -0.351599, 0, 1, 0.5843138, 1,
-0.1762887, 0.395649, -1.377274, 0, 1, 0.5921569, 1,
-0.1740303, 1.252316, -2.61528, 0, 1, 0.5960785, 1,
-0.1701604, -0.08380335, -0.8307857, 0, 1, 0.6039216, 1,
-0.1696908, 1.180978, -0.3244606, 0, 1, 0.6117647, 1,
-0.1671345, 2.54515, -0.1741225, 0, 1, 0.6156863, 1,
-0.1659159, -0.03591564, -3.053445, 0, 1, 0.6235294, 1,
-0.1634697, -0.2783938, -1.004691, 0, 1, 0.627451, 1,
-0.1628242, 0.4777251, 0.6143455, 0, 1, 0.6352941, 1,
-0.1575252, 0.384826, 0.9315237, 0, 1, 0.6392157, 1,
-0.1558826, -0.9781626, -1.461888, 0, 1, 0.6470588, 1,
-0.1558799, -0.7902117, -2.07735, 0, 1, 0.6509804, 1,
-0.1545814, 0.3801634, -1.133038, 0, 1, 0.6588235, 1,
-0.1530005, -0.5618743, -2.591181, 0, 1, 0.6627451, 1,
-0.1525804, -1.049577, -3.811269, 0, 1, 0.6705883, 1,
-0.150277, -1.628945, -2.474582, 0, 1, 0.6745098, 1,
-0.1419434, 1.036712, 0.3484043, 0, 1, 0.682353, 1,
-0.1384334, 0.5298668, 0.4993598, 0, 1, 0.6862745, 1,
-0.1379783, -0.4185133, -2.481183, 0, 1, 0.6941177, 1,
-0.137248, -0.259046, -2.45179, 0, 1, 0.7019608, 1,
-0.1369379, -1.610105, -4.526381, 0, 1, 0.7058824, 1,
-0.1367218, -2.224267, -3.624718, 0, 1, 0.7137255, 1,
-0.1348068, 0.2922445, -2.485667, 0, 1, 0.7176471, 1,
-0.1337838, -1.332287, -2.388187, 0, 1, 0.7254902, 1,
-0.1335555, -0.6162739, -3.943245, 0, 1, 0.7294118, 1,
-0.1327337, -0.6670681, -3.125319, 0, 1, 0.7372549, 1,
-0.1303059, 0.2819841, -0.7059691, 0, 1, 0.7411765, 1,
-0.1250874, -0.2769036, -2.052319, 0, 1, 0.7490196, 1,
-0.1237732, -1.202105, -3.682521, 0, 1, 0.7529412, 1,
-0.1213102, -1.073777, -3.209857, 0, 1, 0.7607843, 1,
-0.1193254, 0.9243622, 1.033135, 0, 1, 0.7647059, 1,
-0.1167814, 0.02627457, -1.758021, 0, 1, 0.772549, 1,
-0.1162617, -0.6545002, -2.601115, 0, 1, 0.7764706, 1,
-0.1157815, -0.3344024, -2.090086, 0, 1, 0.7843137, 1,
-0.1104997, 1.21038, 1.005855, 0, 1, 0.7882353, 1,
-0.1103636, -1.067674, -2.634248, 0, 1, 0.7960784, 1,
-0.1102535, 0.8055784, 1.105653, 0, 1, 0.8039216, 1,
-0.109818, -0.350374, -2.88286, 0, 1, 0.8078431, 1,
-0.109, 1.261654, 0.006823129, 0, 1, 0.8156863, 1,
-0.1040188, 0.4507301, -0.2800271, 0, 1, 0.8196079, 1,
-0.1020789, 0.03531013, -1.527133, 0, 1, 0.827451, 1,
-0.09875434, 0.8895296, -0.9299343, 0, 1, 0.8313726, 1,
-0.09510173, 0.6703152, 0.6677341, 0, 1, 0.8392157, 1,
-0.08986107, 0.6629305, 0.1298463, 0, 1, 0.8431373, 1,
-0.08864963, 1.578085, -0.9231691, 0, 1, 0.8509804, 1,
-0.08740844, 1.150321, -0.4063846, 0, 1, 0.854902, 1,
-0.08679695, 0.3559025, 2.902399, 0, 1, 0.8627451, 1,
-0.08249927, -0.5218247, -2.474016, 0, 1, 0.8666667, 1,
-0.08073249, 0.8549125, -0.6924744, 0, 1, 0.8745098, 1,
-0.07915285, -0.9325512, -2.648938, 0, 1, 0.8784314, 1,
-0.07709972, -0.7501078, -3.756181, 0, 1, 0.8862745, 1,
-0.07098415, 0.2402604, -1.948874, 0, 1, 0.8901961, 1,
-0.0694679, 0.7590117, -0.6065323, 0, 1, 0.8980392, 1,
-0.06872479, -1.894683, -4.33479, 0, 1, 0.9058824, 1,
-0.06814575, -0.8339311, -3.25669, 0, 1, 0.9098039, 1,
-0.06455129, -2.069901, -4.324518, 0, 1, 0.9176471, 1,
-0.05713985, 0.544297, 0.09449066, 0, 1, 0.9215686, 1,
-0.05509595, 1.918384, -0.0405531, 0, 1, 0.9294118, 1,
-0.05309721, -1.174746, -4.37034, 0, 1, 0.9333333, 1,
-0.04976428, 0.3468186, -0.3789678, 0, 1, 0.9411765, 1,
-0.04976289, 0.6122764, -0.01698437, 0, 1, 0.945098, 1,
-0.04625917, -0.2737355, -2.787215, 0, 1, 0.9529412, 1,
-0.04011082, -0.1607632, -2.274147, 0, 1, 0.9568627, 1,
-0.03882169, -0.5063212, -3.543679, 0, 1, 0.9647059, 1,
-0.03859324, 0.4393864, 0.8670895, 0, 1, 0.9686275, 1,
-0.0375075, -0.1536209, -2.291054, 0, 1, 0.9764706, 1,
-0.03694246, -0.1015058, -3.329632, 0, 1, 0.9803922, 1,
-0.03522325, 1.188585, -0.2118578, 0, 1, 0.9882353, 1,
-0.03429024, -0.579643, -2.201681, 0, 1, 0.9921569, 1,
-0.03378958, 0.6414065, 0.1357137, 0, 1, 1, 1,
-0.02997219, -0.2354583, -3.384031, 0, 0.9921569, 1, 1,
-0.02856003, 0.431748, -0.1676596, 0, 0.9882353, 1, 1,
-0.02616225, 0.9807718, -2.142265, 0, 0.9803922, 1, 1,
-0.02176218, -0.4789844, -3.26006, 0, 0.9764706, 1, 1,
-0.01476004, 0.4579798, 1.009768, 0, 0.9686275, 1, 1,
-0.01232518, -1.650462, -3.878749, 0, 0.9647059, 1, 1,
-0.01030735, -1.114433, -3.574902, 0, 0.9568627, 1, 1,
-0.009875763, 0.3670766, -0.1232347, 0, 0.9529412, 1, 1,
-0.008732161, -0.3553121, -2.960557, 0, 0.945098, 1, 1,
-0.00740261, -0.3609902, -3.286098, 0, 0.9411765, 1, 1,
-0.002608396, 2.444941, -0.418047, 0, 0.9333333, 1, 1,
-0.001149714, -3.02367, -5.512467, 0, 0.9294118, 1, 1,
0.003199875, -1.52628, 2.153009, 0, 0.9215686, 1, 1,
0.00390553, -0.9625139, 1.810826, 0, 0.9176471, 1, 1,
0.005701659, -0.7440833, 5.088725, 0, 0.9098039, 1, 1,
0.007802116, 0.7159717, 1.915823, 0, 0.9058824, 1, 1,
0.009781444, -0.9766722, 3.582339, 0, 0.8980392, 1, 1,
0.01107385, 0.4409887, -0.6385125, 0, 0.8901961, 1, 1,
0.01365482, 0.7141552, -3.142022, 0, 0.8862745, 1, 1,
0.01388003, -1.259112, 2.752002, 0, 0.8784314, 1, 1,
0.01432963, -0.9308162, 1.821915, 0, 0.8745098, 1, 1,
0.01903204, -0.6295044, 3.705553, 0, 0.8666667, 1, 1,
0.02643886, 0.8904338, 1.000701, 0, 0.8627451, 1, 1,
0.02679162, -1.212485, 4.185726, 0, 0.854902, 1, 1,
0.02752425, 0.3923762, -1.695232, 0, 0.8509804, 1, 1,
0.02971755, -0.7198271, 3.305179, 0, 0.8431373, 1, 1,
0.03047803, -0.3469328, 3.08843, 0, 0.8392157, 1, 1,
0.03316485, 0.06210128, 0.3856106, 0, 0.8313726, 1, 1,
0.0372893, 1.071809, 0.3568982, 0, 0.827451, 1, 1,
0.04499955, -1.273691, 3.240312, 0, 0.8196079, 1, 1,
0.04537556, 0.2384854, 0.6999946, 0, 0.8156863, 1, 1,
0.04730381, 0.9754016, 0.1384331, 0, 0.8078431, 1, 1,
0.04861243, 0.8763933, -1.440938, 0, 0.8039216, 1, 1,
0.0503561, 0.142928, 0.7355645, 0, 0.7960784, 1, 1,
0.05388041, 0.6227764, 0.3023809, 0, 0.7882353, 1, 1,
0.0613759, -1.13904, 4.217805, 0, 0.7843137, 1, 1,
0.06338216, 1.987381, -0.450806, 0, 0.7764706, 1, 1,
0.06890052, -0.1877308, 3.395986, 0, 0.772549, 1, 1,
0.07332519, 3.033421, 0.08694702, 0, 0.7647059, 1, 1,
0.07888879, 0.4190769, -0.5253583, 0, 0.7607843, 1, 1,
0.08037051, -0.2419523, 4.46563, 0, 0.7529412, 1, 1,
0.08053203, -0.506295, 1.694273, 0, 0.7490196, 1, 1,
0.08061825, 0.6286382, 0.9968386, 0, 0.7411765, 1, 1,
0.08090141, -0.2713102, 1.803995, 0, 0.7372549, 1, 1,
0.08110666, -1.885965, 3.346112, 0, 0.7294118, 1, 1,
0.08290129, -0.4608905, 3.680302, 0, 0.7254902, 1, 1,
0.08510147, 0.5261381, 1.33159, 0, 0.7176471, 1, 1,
0.08706119, -1.999545, 2.463775, 0, 0.7137255, 1, 1,
0.09063688, 0.4445785, 0.8189479, 0, 0.7058824, 1, 1,
0.09182949, 1.584394, -0.1415057, 0, 0.6980392, 1, 1,
0.09323558, 0.9925544, -0.9843403, 0, 0.6941177, 1, 1,
0.09402997, 0.03622817, 0.6474562, 0, 0.6862745, 1, 1,
0.09471361, -0.1980996, 2.916992, 0, 0.682353, 1, 1,
0.09627714, -0.3138994, 1.350808, 0, 0.6745098, 1, 1,
0.09689999, -0.1257676, 3.370766, 0, 0.6705883, 1, 1,
0.09737786, -0.01983789, 2.092842, 0, 0.6627451, 1, 1,
0.1016173, 0.9812782, -0.2711048, 0, 0.6588235, 1, 1,
0.104314, -0.4950298, 1.433998, 0, 0.6509804, 1, 1,
0.1055819, 0.1173912, 0.5905791, 0, 0.6470588, 1, 1,
0.1064047, 0.6038312, 1.060045, 0, 0.6392157, 1, 1,
0.1121877, 1.166062, 0.7670847, 0, 0.6352941, 1, 1,
0.1135256, 1.133758, 0.7755405, 0, 0.627451, 1, 1,
0.1194555, 1.544895, 0.5441609, 0, 0.6235294, 1, 1,
0.1203396, 0.9745115, 0.6247628, 0, 0.6156863, 1, 1,
0.1259087, -1.729617, 1.418286, 0, 0.6117647, 1, 1,
0.1266816, -1.705556, 4.999496, 0, 0.6039216, 1, 1,
0.1303586, 0.7654063, 1.192343, 0, 0.5960785, 1, 1,
0.132078, 2.648734, 0.5650382, 0, 0.5921569, 1, 1,
0.1333398, 0.8389874, -0.3842497, 0, 0.5843138, 1, 1,
0.1346135, -1.657807, 3.869104, 0, 0.5803922, 1, 1,
0.1357629, 0.1715515, 1.606522, 0, 0.572549, 1, 1,
0.1398099, 0.5764646, 1.416862, 0, 0.5686275, 1, 1,
0.1399879, -0.1469297, 3.150798, 0, 0.5607843, 1, 1,
0.1436774, 0.6536674, -1.855314, 0, 0.5568628, 1, 1,
0.1442695, -2.03114, 3.347409, 0, 0.5490196, 1, 1,
0.1443376, 0.370553, 1.697964, 0, 0.5450981, 1, 1,
0.1469299, -0.5731686, 2.594375, 0, 0.5372549, 1, 1,
0.1508192, 0.597618, 1.085248, 0, 0.5333334, 1, 1,
0.1557711, -1.554049, 4.445477, 0, 0.5254902, 1, 1,
0.1565205, -0.7123616, 3.101381, 0, 0.5215687, 1, 1,
0.1590693, -1.411408, 3.488249, 0, 0.5137255, 1, 1,
0.1619442, 0.4306296, -0.5036292, 0, 0.509804, 1, 1,
0.1655159, 0.9226665, 0.5767304, 0, 0.5019608, 1, 1,
0.1688836, 0.1013652, 0.7794073, 0, 0.4941176, 1, 1,
0.1737671, -1.267847, 2.557547, 0, 0.4901961, 1, 1,
0.1827052, -0.06399854, 2.589832, 0, 0.4823529, 1, 1,
0.1867203, 0.9715353, 0.4281035, 0, 0.4784314, 1, 1,
0.1869706, 0.6049039, 1.497957, 0, 0.4705882, 1, 1,
0.1882319, -0.7106588, 4.245995, 0, 0.4666667, 1, 1,
0.1904878, 1.978852, 1.251627, 0, 0.4588235, 1, 1,
0.1947013, 0.7806042, 1.197697, 0, 0.454902, 1, 1,
0.1988152, 0.9578253, -0.4135858, 0, 0.4470588, 1, 1,
0.2000975, -0.6957383, 3.389892, 0, 0.4431373, 1, 1,
0.2063382, -0.5243931, 1.6728, 0, 0.4352941, 1, 1,
0.2108404, 0.211975, 0.2317366, 0, 0.4313726, 1, 1,
0.2117137, -1.224456, 4.198649, 0, 0.4235294, 1, 1,
0.2155305, 1.106729, 0.4025389, 0, 0.4196078, 1, 1,
0.2157783, 1.256642, 2.30419, 0, 0.4117647, 1, 1,
0.2160303, -0.1213303, 2.44168, 0, 0.4078431, 1, 1,
0.2165291, -0.8182881, 3.097706, 0, 0.4, 1, 1,
0.2232466, -0.3022347, 3.584201, 0, 0.3921569, 1, 1,
0.2258599, -1.184446, 3.718524, 0, 0.3882353, 1, 1,
0.2286348, -0.08629186, 3.301472, 0, 0.3803922, 1, 1,
0.2332818, -0.8690414, 2.862981, 0, 0.3764706, 1, 1,
0.2346779, 0.07382996, 0.3333715, 0, 0.3686275, 1, 1,
0.2397478, -0.4677988, 4.94807, 0, 0.3647059, 1, 1,
0.2397926, -1.312802, 4.020254, 0, 0.3568628, 1, 1,
0.2403432, -1.963843, 2.529678, 0, 0.3529412, 1, 1,
0.2421853, 1.416732, 1.533849, 0, 0.345098, 1, 1,
0.2434014, 0.6459733, -1.181797, 0, 0.3411765, 1, 1,
0.2484599, -2.602479, 2.255821, 0, 0.3333333, 1, 1,
0.2493737, 0.5643739, 0.3774756, 0, 0.3294118, 1, 1,
0.2497016, 0.7766278, 1.015669, 0, 0.3215686, 1, 1,
0.2497561, -1.026797, 4.228737, 0, 0.3176471, 1, 1,
0.2603961, -0.7794917, 3.33872, 0, 0.3098039, 1, 1,
0.2629512, 0.9070777, -0.3598174, 0, 0.3058824, 1, 1,
0.263535, 1.938024, 0.9979164, 0, 0.2980392, 1, 1,
0.2636518, 0.7467627, 2.050311, 0, 0.2901961, 1, 1,
0.2713999, -1.526079, 3.483684, 0, 0.2862745, 1, 1,
0.2719235, 1.114548, 0.6104073, 0, 0.2784314, 1, 1,
0.2731352, -0.4663341, 1.18499, 0, 0.2745098, 1, 1,
0.2745951, -1.682835, 3.725805, 0, 0.2666667, 1, 1,
0.2764758, -0.003396706, 1.164953, 0, 0.2627451, 1, 1,
0.279373, 2.939444, 1.286581, 0, 0.254902, 1, 1,
0.2801662, 1.436245, 0.234469, 0, 0.2509804, 1, 1,
0.282269, 1.006111, -0.06349765, 0, 0.2431373, 1, 1,
0.2827033, 0.27406, 0.198303, 0, 0.2392157, 1, 1,
0.2860153, -0.4311706, 1.511408, 0, 0.2313726, 1, 1,
0.2956672, -0.7641519, 1.559138, 0, 0.227451, 1, 1,
0.30153, 0.3905415, 1.121797, 0, 0.2196078, 1, 1,
0.3050839, -0.5958028, 2.136375, 0, 0.2156863, 1, 1,
0.3166835, 0.9920793, -0.7199782, 0, 0.2078431, 1, 1,
0.3276012, 0.3144325, -0.1738856, 0, 0.2039216, 1, 1,
0.3300901, 0.8166237, -0.600485, 0, 0.1960784, 1, 1,
0.3314961, 0.4412732, -0.7051544, 0, 0.1882353, 1, 1,
0.3327516, 2.981645, 0.9884729, 0, 0.1843137, 1, 1,
0.3333347, -0.4151261, 3.49633, 0, 0.1764706, 1, 1,
0.3403476, 1.752818, -0.7114637, 0, 0.172549, 1, 1,
0.3403739, -1.387635, 2.080429, 0, 0.1647059, 1, 1,
0.3417558, 0.6691296, 0.6042186, 0, 0.1607843, 1, 1,
0.3499884, -1.6978, 0.589672, 0, 0.1529412, 1, 1,
0.3517916, -0.1172305, 1.073288, 0, 0.1490196, 1, 1,
0.3556612, 1.343636, -0.04841585, 0, 0.1411765, 1, 1,
0.3561054, 0.06129885, 0.8060421, 0, 0.1372549, 1, 1,
0.3616045, 0.5980914, 0.7990486, 0, 0.1294118, 1, 1,
0.3646685, 0.1191363, 2.305202, 0, 0.1254902, 1, 1,
0.3661101, -0.7269418, 2.4631, 0, 0.1176471, 1, 1,
0.3687316, -1.00307, 1.727503, 0, 0.1137255, 1, 1,
0.3701222, -1.850642, 1.076967, 0, 0.1058824, 1, 1,
0.3722838, 0.562145, 0.4049689, 0, 0.09803922, 1, 1,
0.3744861, 0.306075, 1.076683, 0, 0.09411765, 1, 1,
0.3753226, 0.2589687, 1.087607, 0, 0.08627451, 1, 1,
0.3767322, 0.1393012, 2.791169, 0, 0.08235294, 1, 1,
0.377858, 1.253833, 0.7089873, 0, 0.07450981, 1, 1,
0.3805984, 0.2855624, 2.636672, 0, 0.07058824, 1, 1,
0.3824415, 0.3011158, 0.3301698, 0, 0.0627451, 1, 1,
0.3828994, 0.04199018, 1.16026, 0, 0.05882353, 1, 1,
0.3841204, -1.518425, 0.7804264, 0, 0.05098039, 1, 1,
0.3843793, -0.6752996, 3.160539, 0, 0.04705882, 1, 1,
0.3845827, 0.4051349, -0.2703835, 0, 0.03921569, 1, 1,
0.3847113, -0.375988, 4.65817, 0, 0.03529412, 1, 1,
0.3856572, -0.6376576, 4.051024, 0, 0.02745098, 1, 1,
0.3891046, -0.7927585, 3.013252, 0, 0.02352941, 1, 1,
0.3903798, 0.1531156, 1.045698, 0, 0.01568628, 1, 1,
0.3912761, 1.833538, 1.316786, 0, 0.01176471, 1, 1,
0.3913341, 0.9012077, 2.594212, 0, 0.003921569, 1, 1,
0.3920531, -0.6629957, 0.7262332, 0.003921569, 0, 1, 1,
0.395792, -0.3630574, 2.852854, 0.007843138, 0, 1, 1,
0.3999933, 1.334101, -1.593168, 0.01568628, 0, 1, 1,
0.4001171, -0.6608028, 2.213817, 0.01960784, 0, 1, 1,
0.4003927, 1.227855, -0.7609074, 0.02745098, 0, 1, 1,
0.4139492, -1.7543, 2.397936, 0.03137255, 0, 1, 1,
0.4173126, 2.012829, 0.6111105, 0.03921569, 0, 1, 1,
0.4193304, 1.911421, 0.09303529, 0.04313726, 0, 1, 1,
0.4211272, -0.7433737, 3.245029, 0.05098039, 0, 1, 1,
0.4265468, 1.319271, 0.5219804, 0.05490196, 0, 1, 1,
0.4293723, 0.1558942, 1.997382, 0.0627451, 0, 1, 1,
0.4376934, -0.0203098, -0.7285308, 0.06666667, 0, 1, 1,
0.4402572, -0.4787343, 1.358922, 0.07450981, 0, 1, 1,
0.4417545, -1.811207, 0.9847252, 0.07843138, 0, 1, 1,
0.4486426, -0.8354775, 2.074809, 0.08627451, 0, 1, 1,
0.4520801, 1.158642, 1.288723, 0.09019608, 0, 1, 1,
0.4551073, 0.5152829, 2.212021, 0.09803922, 0, 1, 1,
0.4567327, 1.016619, 1.544927, 0.1058824, 0, 1, 1,
0.4574766, -1.503341, 3.93298, 0.1098039, 0, 1, 1,
0.4580086, 0.9928055, 0.8747644, 0.1176471, 0, 1, 1,
0.4605911, 1.353649, 0.8378268, 0.1215686, 0, 1, 1,
0.4617319, -1.12871, 5.147705, 0.1294118, 0, 1, 1,
0.462197, 1.194057, 0.4655045, 0.1333333, 0, 1, 1,
0.4622266, 0.8265036, 2.084605, 0.1411765, 0, 1, 1,
0.4634153, -1.198102, 2.767847, 0.145098, 0, 1, 1,
0.465256, 0.8119135, -0.8630931, 0.1529412, 0, 1, 1,
0.4717254, -0.5626084, 2.4813, 0.1568628, 0, 1, 1,
0.4738413, 1.406986, 0.922689, 0.1647059, 0, 1, 1,
0.4746135, 1.22937, 0.9696647, 0.1686275, 0, 1, 1,
0.4755735, -0.1081653, 1.278876, 0.1764706, 0, 1, 1,
0.4758148, 1.171729, 1.539343, 0.1803922, 0, 1, 1,
0.4761668, -0.5696163, 2.825251, 0.1882353, 0, 1, 1,
0.4774157, 1.737683, 1.413313, 0.1921569, 0, 1, 1,
0.4801915, -1.444338, 3.352628, 0.2, 0, 1, 1,
0.4818227, -0.1120965, 2.53888, 0.2078431, 0, 1, 1,
0.4860877, 0.6517609, -0.7897102, 0.2117647, 0, 1, 1,
0.4886122, 0.365548, 2.739417, 0.2196078, 0, 1, 1,
0.4963312, 1.075965, 0.9546472, 0.2235294, 0, 1, 1,
0.4991654, 0.5625474, 1.369489, 0.2313726, 0, 1, 1,
0.4997373, 1.316509, -1.822679, 0.2352941, 0, 1, 1,
0.5008634, -1.212094, 1.430237, 0.2431373, 0, 1, 1,
0.5051432, 1.27818, -1.081727, 0.2470588, 0, 1, 1,
0.515443, -0.2598825, 0.7433094, 0.254902, 0, 1, 1,
0.5159631, 0.2054676, -0.1975625, 0.2588235, 0, 1, 1,
0.5171931, -0.2963535, 3.021112, 0.2666667, 0, 1, 1,
0.5206465, -0.03428375, 0.2983158, 0.2705882, 0, 1, 1,
0.5207394, -1.793977, 4.01635, 0.2784314, 0, 1, 1,
0.5233633, 1.109356, 0.9602391, 0.282353, 0, 1, 1,
0.526695, 0.5032504, 0.1113242, 0.2901961, 0, 1, 1,
0.5283143, -0.5388011, 2.878474, 0.2941177, 0, 1, 1,
0.5328194, 1.0512, -1.52313, 0.3019608, 0, 1, 1,
0.534726, -1.763757, 3.035565, 0.3098039, 0, 1, 1,
0.5356477, 1.066991, 0.8944218, 0.3137255, 0, 1, 1,
0.5393053, 0.1092213, 4.017549, 0.3215686, 0, 1, 1,
0.5411837, 1.407075, 0.4797369, 0.3254902, 0, 1, 1,
0.5434606, -1.011256, 2.448224, 0.3333333, 0, 1, 1,
0.5529116, -0.1930393, 2.015067, 0.3372549, 0, 1, 1,
0.5595266, -0.2798918, 3.39705, 0.345098, 0, 1, 1,
0.5627017, -1.130382, 2.085439, 0.3490196, 0, 1, 1,
0.5633317, -1.556062, 2.393267, 0.3568628, 0, 1, 1,
0.5674103, 1.037005, -0.6064255, 0.3607843, 0, 1, 1,
0.5732567, 0.2868211, -1.053304, 0.3686275, 0, 1, 1,
0.5738865, 0.4727174, 0.6422588, 0.372549, 0, 1, 1,
0.5761359, -0.8476995, 2.648126, 0.3803922, 0, 1, 1,
0.5765562, 0.6007094, -0.9585977, 0.3843137, 0, 1, 1,
0.5825701, -1.210676, 3.760485, 0.3921569, 0, 1, 1,
0.5887186, -0.3189715, 2.394559, 0.3960784, 0, 1, 1,
0.5913907, 0.1297488, 2.095312, 0.4039216, 0, 1, 1,
0.5925999, -0.6396351, 1.560638, 0.4117647, 0, 1, 1,
0.5931839, 0.2665793, 0.1924225, 0.4156863, 0, 1, 1,
0.5932218, 0.769859, -0.2543959, 0.4235294, 0, 1, 1,
0.5964558, -0.4361957, 1.587987, 0.427451, 0, 1, 1,
0.599169, 0.1451339, 1.584865, 0.4352941, 0, 1, 1,
0.6005931, -0.4309612, 1.460789, 0.4392157, 0, 1, 1,
0.6025785, 0.5992779, 0.1799481, 0.4470588, 0, 1, 1,
0.6069033, -0.3371333, 2.566426, 0.4509804, 0, 1, 1,
0.613049, -1.265961, 1.926773, 0.4588235, 0, 1, 1,
0.6244719, 0.4186019, -0.2738827, 0.4627451, 0, 1, 1,
0.6248858, 0.07117454, 1.974175, 0.4705882, 0, 1, 1,
0.6249543, 0.1517977, 0.3916675, 0.4745098, 0, 1, 1,
0.6259365, -0.9362844, 1.844269, 0.4823529, 0, 1, 1,
0.6261527, -0.3050227, 1.604834, 0.4862745, 0, 1, 1,
0.6272165, 0.623045, -0.3408639, 0.4941176, 0, 1, 1,
0.6275731, -0.9490689, 2.194946, 0.5019608, 0, 1, 1,
0.6339916, -0.02749249, 1.374743, 0.5058824, 0, 1, 1,
0.6351313, -0.8101919, 3.009496, 0.5137255, 0, 1, 1,
0.636489, -0.6930746, 1.866832, 0.5176471, 0, 1, 1,
0.6431555, -0.03541911, 2.551245, 0.5254902, 0, 1, 1,
0.6439165, -0.569214, 2.02245, 0.5294118, 0, 1, 1,
0.6450323, -1.773811, 3.032213, 0.5372549, 0, 1, 1,
0.6561303, -0.9960022, 3.684879, 0.5411765, 0, 1, 1,
0.6572505, 0.01446757, 1.684051, 0.5490196, 0, 1, 1,
0.6582928, -2.185016, 2.438603, 0.5529412, 0, 1, 1,
0.6593052, -0.9720693, 2.598486, 0.5607843, 0, 1, 1,
0.6619728, 0.2526816, 1.332585, 0.5647059, 0, 1, 1,
0.6644832, 1.089204, 0.7856864, 0.572549, 0, 1, 1,
0.6771241, 1.482246, -0.9636061, 0.5764706, 0, 1, 1,
0.6804234, 0.05678462, 2.120356, 0.5843138, 0, 1, 1,
0.6824459, -0.2214255, 0.07653107, 0.5882353, 0, 1, 1,
0.6926602, -0.235069, 1.010127, 0.5960785, 0, 1, 1,
0.6940911, 1.475856, -0.9313442, 0.6039216, 0, 1, 1,
0.6941339, -0.977514, 2.224683, 0.6078432, 0, 1, 1,
0.6956619, -0.4824451, 1.586065, 0.6156863, 0, 1, 1,
0.6977552, -0.09372482, 2.298181, 0.6196079, 0, 1, 1,
0.6995941, -0.08866589, 2.619834, 0.627451, 0, 1, 1,
0.7005797, -0.1315814, 1.650997, 0.6313726, 0, 1, 1,
0.7033172, 0.8344095, -1.332037, 0.6392157, 0, 1, 1,
0.7046368, 0.07598923, 2.015538, 0.6431373, 0, 1, 1,
0.7080806, -0.7962303, 2.517368, 0.6509804, 0, 1, 1,
0.7097875, -0.5060099, 0.8383521, 0.654902, 0, 1, 1,
0.7119126, 0.5309412, -0.28053, 0.6627451, 0, 1, 1,
0.7148887, 1.495215, -2.038714, 0.6666667, 0, 1, 1,
0.7239873, 0.8527138, -0.06101908, 0.6745098, 0, 1, 1,
0.7273962, 0.1252234, 2.22923, 0.6784314, 0, 1, 1,
0.7303751, 0.7456176, 1.619476, 0.6862745, 0, 1, 1,
0.7312788, -0.1017944, 1.448737, 0.6901961, 0, 1, 1,
0.7372401, -0.2537663, 0.0511531, 0.6980392, 0, 1, 1,
0.7427153, -0.7939547, 2.768919, 0.7058824, 0, 1, 1,
0.7438428, -0.07829084, 0.7953014, 0.7098039, 0, 1, 1,
0.7548833, 0.06010414, 1.41415, 0.7176471, 0, 1, 1,
0.7565227, -0.07692067, 0.4204504, 0.7215686, 0, 1, 1,
0.759006, 0.3285405, 0.08300505, 0.7294118, 0, 1, 1,
0.7607967, 0.6446636, 0.4327525, 0.7333333, 0, 1, 1,
0.7659875, -0.4271501, 1.537433, 0.7411765, 0, 1, 1,
0.7667307, 0.5911624, 0.5453879, 0.7450981, 0, 1, 1,
0.7770771, 1.284217, 1.056945, 0.7529412, 0, 1, 1,
0.7781742, 0.2014723, 1.507138, 0.7568628, 0, 1, 1,
0.7783942, 0.2870099, 0.1657085, 0.7647059, 0, 1, 1,
0.7860235, -1.993001, 3.838419, 0.7686275, 0, 1, 1,
0.788076, 0.9991211, -0.7254598, 0.7764706, 0, 1, 1,
0.7947599, -0.6081257, 2.414175, 0.7803922, 0, 1, 1,
0.7955537, 0.580027, 0.7387765, 0.7882353, 0, 1, 1,
0.8103006, -1.631318, 3.889054, 0.7921569, 0, 1, 1,
0.8205063, -0.5983775, 1.117888, 0.8, 0, 1, 1,
0.8232471, -2.957155, 3.401517, 0.8078431, 0, 1, 1,
0.8295057, 0.7952365, 0.7432091, 0.8117647, 0, 1, 1,
0.8296376, 1.705562, 1.652401, 0.8196079, 0, 1, 1,
0.8304766, -0.9356834, 3.141407, 0.8235294, 0, 1, 1,
0.8401479, 0.3581512, -0.1623545, 0.8313726, 0, 1, 1,
0.8422382, 1.472996, 0.05086835, 0.8352941, 0, 1, 1,
0.854415, 1.3328, 2.081158, 0.8431373, 0, 1, 1,
0.8632213, 0.007144577, 1.577007, 0.8470588, 0, 1, 1,
0.8634942, -0.9568619, 2.142574, 0.854902, 0, 1, 1,
0.8643044, 1.62666, 0.4303541, 0.8588235, 0, 1, 1,
0.8660547, -0.07531785, 0.6087856, 0.8666667, 0, 1, 1,
0.8680493, 1.447098, -0.940073, 0.8705882, 0, 1, 1,
0.8787862, -0.8314562, 0.5762438, 0.8784314, 0, 1, 1,
0.8807831, 0.3599862, 1.498665, 0.8823529, 0, 1, 1,
0.8897886, -0.4567856, 2.002497, 0.8901961, 0, 1, 1,
0.8932846, 0.02011707, 1.090816, 0.8941177, 0, 1, 1,
0.8938733, 1.088344, -0.3243662, 0.9019608, 0, 1, 1,
0.9056995, 0.1343827, -0.0422741, 0.9098039, 0, 1, 1,
0.90837, 0.6001592, -0.3203896, 0.9137255, 0, 1, 1,
0.9132451, 0.4473642, 0.7717009, 0.9215686, 0, 1, 1,
0.9178326, -1.444829, 2.03321, 0.9254902, 0, 1, 1,
0.918469, 0.8637741, 1.230316, 0.9333333, 0, 1, 1,
0.9200408, 0.8393476, 1.560979, 0.9372549, 0, 1, 1,
0.924014, 0.3885807, 2.245719, 0.945098, 0, 1, 1,
0.9276748, -1.522812, 4.020465, 0.9490196, 0, 1, 1,
0.9321231, -1.063864, 4.287959, 0.9568627, 0, 1, 1,
0.932786, 0.7825941, -0.5333707, 0.9607843, 0, 1, 1,
0.9368498, 0.4548052, 1.072099, 0.9686275, 0, 1, 1,
0.939702, 1.042357, 0.8877843, 0.972549, 0, 1, 1,
0.9405189, -0.2543372, 1.528827, 0.9803922, 0, 1, 1,
0.9412259, -0.7580225, 3.275742, 0.9843137, 0, 1, 1,
0.9551351, -0.01120041, 0.9968216, 0.9921569, 0, 1, 1,
0.9564811, -0.7826264, 3.032367, 0.9960784, 0, 1, 1,
0.95836, 0.2956439, 2.336854, 1, 0, 0.9960784, 1,
0.960953, -0.2863583, 2.772068, 1, 0, 0.9882353, 1,
0.9621472, -0.3236549, 2.498114, 1, 0, 0.9843137, 1,
0.9630467, -0.8210978, 3.187364, 1, 0, 0.9764706, 1,
0.9734921, -0.7668794, 2.102028, 1, 0, 0.972549, 1,
0.9755808, -0.1347372, 0.6407076, 1, 0, 0.9647059, 1,
0.9819984, 0.6666099, 3.362979, 1, 0, 0.9607843, 1,
0.9881732, -1.537524, 3.192128, 1, 0, 0.9529412, 1,
0.9997893, -1.387278, 4.081017, 1, 0, 0.9490196, 1,
1.004511, 0.5666233, 2.914359, 1, 0, 0.9411765, 1,
1.004562, -0.09098455, 1.052337, 1, 0, 0.9372549, 1,
1.017149, 0.7095466, 0.02484312, 1, 0, 0.9294118, 1,
1.021645, -0.5729092, 2.715522, 1, 0, 0.9254902, 1,
1.022232, 0.4831258, 1.791747, 1, 0, 0.9176471, 1,
1.026355, -0.02557841, 2.527073, 1, 0, 0.9137255, 1,
1.039057, -0.4565468, 2.998903, 1, 0, 0.9058824, 1,
1.03958, 0.8813886, 3.282701, 1, 0, 0.9019608, 1,
1.04064, 1.135882, 3.455865, 1, 0, 0.8941177, 1,
1.047814, 0.4031688, 1.362678, 1, 0, 0.8862745, 1,
1.054159, 2.355509, -0.8167132, 1, 0, 0.8823529, 1,
1.054599, 0.8094505, 0.2525667, 1, 0, 0.8745098, 1,
1.059753, -0.7397103, 2.23681, 1, 0, 0.8705882, 1,
1.066554, -0.5828492, 2.622636, 1, 0, 0.8627451, 1,
1.06784, -0.4989732, 2.867961, 1, 0, 0.8588235, 1,
1.069269, 0.08948617, 2.344861, 1, 0, 0.8509804, 1,
1.074841, 0.2824434, 1.674287, 1, 0, 0.8470588, 1,
1.080983, 1.030969, 1.021339, 1, 0, 0.8392157, 1,
1.085401, -0.9477386, 1.468567, 1, 0, 0.8352941, 1,
1.088496, -0.08163666, 1.62529, 1, 0, 0.827451, 1,
1.092828, -0.03714937, 1.348397, 1, 0, 0.8235294, 1,
1.098846, -1.893945, 3.661175, 1, 0, 0.8156863, 1,
1.101581, 1.312764, 0.2610363, 1, 0, 0.8117647, 1,
1.104961, 0.6725593, -0.055883, 1, 0, 0.8039216, 1,
1.107949, -2.199442, 2.899481, 1, 0, 0.7960784, 1,
1.110288, -1.186907, 2.427449, 1, 0, 0.7921569, 1,
1.12371, 0.03463355, 0.8987097, 1, 0, 0.7843137, 1,
1.124568, 1.677877, -1.307682, 1, 0, 0.7803922, 1,
1.132951, -0.1167505, 1.255418, 1, 0, 0.772549, 1,
1.137275, 0.03418226, 3.227074, 1, 0, 0.7686275, 1,
1.145539, -0.7338837, 2.295462, 1, 0, 0.7607843, 1,
1.153763, -0.9712416, 2.833274, 1, 0, 0.7568628, 1,
1.158569, 1.046073, 0.2508608, 1, 0, 0.7490196, 1,
1.165124, -1.796318, 2.548247, 1, 0, 0.7450981, 1,
1.170381, 0.5122334, 1.466147, 1, 0, 0.7372549, 1,
1.175918, 0.6594557, 2.074661, 1, 0, 0.7333333, 1,
1.181487, 1.3963, 1.406289, 1, 0, 0.7254902, 1,
1.181808, -0.3939896, 2.87688, 1, 0, 0.7215686, 1,
1.191468, 0.841592, 2.486016, 1, 0, 0.7137255, 1,
1.214093, -0.6516294, 3.864693, 1, 0, 0.7098039, 1,
1.223758, -1.599665, 1.818519, 1, 0, 0.7019608, 1,
1.245023, -0.4313001, 0.6155783, 1, 0, 0.6941177, 1,
1.246588, 0.3599552, 1.20309, 1, 0, 0.6901961, 1,
1.260304, -0.3872024, 2.840691, 1, 0, 0.682353, 1,
1.266743, 0.991244, -0.8198492, 1, 0, 0.6784314, 1,
1.267766, -2.422231, 2.217838, 1, 0, 0.6705883, 1,
1.269449, 0.3075095, 1.076359, 1, 0, 0.6666667, 1,
1.279104, -1.414893, 1.056496, 1, 0, 0.6588235, 1,
1.290505, -0.1528163, 2.886903, 1, 0, 0.654902, 1,
1.294336, -1.653977, 1.774255, 1, 0, 0.6470588, 1,
1.297232, 0.5246887, 1.289861, 1, 0, 0.6431373, 1,
1.299659, 0.5180382, 1.97641, 1, 0, 0.6352941, 1,
1.299705, -1.081979, 2.20814, 1, 0, 0.6313726, 1,
1.301475, -0.8014068, 2.853563, 1, 0, 0.6235294, 1,
1.302145, 1.279209, -0.9534168, 1, 0, 0.6196079, 1,
1.304123, -0.8652116, 3.275538, 1, 0, 0.6117647, 1,
1.305587, 0.5386052, 2.493307, 1, 0, 0.6078432, 1,
1.307916, -0.4003396, 0.1965371, 1, 0, 0.6, 1,
1.314242, 0.4838566, 1.117541, 1, 0, 0.5921569, 1,
1.32763, -2.101698, 3.057074, 1, 0, 0.5882353, 1,
1.327968, -0.6478766, 0.5295916, 1, 0, 0.5803922, 1,
1.329274, -1.186769, 3.479237, 1, 0, 0.5764706, 1,
1.344851, -0.7953938, 3.305512, 1, 0, 0.5686275, 1,
1.349423, -0.4068711, 2.372823, 1, 0, 0.5647059, 1,
1.353272, -1.990898, 3.051069, 1, 0, 0.5568628, 1,
1.362024, 0.2910609, 2.048096, 1, 0, 0.5529412, 1,
1.363834, 0.6976699, 0.7284438, 1, 0, 0.5450981, 1,
1.368444, 0.7475956, 1.733518, 1, 0, 0.5411765, 1,
1.370193, 0.2771617, 1.104298, 1, 0, 0.5333334, 1,
1.372544, -0.1834525, 1.581492, 1, 0, 0.5294118, 1,
1.37543, 1.697868, 0.0006714793, 1, 0, 0.5215687, 1,
1.381673, 0.9731027, 0.7335507, 1, 0, 0.5176471, 1,
1.384409, -0.2703505, 2.20966, 1, 0, 0.509804, 1,
1.404302, 0.308639, -0.4526818, 1, 0, 0.5058824, 1,
1.409662, -0.03058958, 0.386584, 1, 0, 0.4980392, 1,
1.413217, 0.7254022, 1.678543, 1, 0, 0.4901961, 1,
1.41729, -0.7197486, 3.376208, 1, 0, 0.4862745, 1,
1.418901, 0.8080392, 0.7671905, 1, 0, 0.4784314, 1,
1.419464, 0.8338664, 1.238527, 1, 0, 0.4745098, 1,
1.421656, 0.6151999, -0.1279874, 1, 0, 0.4666667, 1,
1.427065, 0.7693579, -0.3950517, 1, 0, 0.4627451, 1,
1.429292, 1.308907, -0.7773693, 1, 0, 0.454902, 1,
1.430063, -1.194865, 1.256853, 1, 0, 0.4509804, 1,
1.431, 0.07317144, 0.4687875, 1, 0, 0.4431373, 1,
1.431355, 0.8894041, 0.19899, 1, 0, 0.4392157, 1,
1.432593, 2.244306, 0.2485233, 1, 0, 0.4313726, 1,
1.43271, -2.386537, 4.095083, 1, 0, 0.427451, 1,
1.436708, -0.4939167, 2.628592, 1, 0, 0.4196078, 1,
1.442571, 0.3622268, 1.206975, 1, 0, 0.4156863, 1,
1.449127, -0.7776374, 0.9277382, 1, 0, 0.4078431, 1,
1.462971, 1.460807, -0.3778632, 1, 0, 0.4039216, 1,
1.465052, -1.017783, 1.848493, 1, 0, 0.3960784, 1,
1.479901, 0.09792177, 1.995909, 1, 0, 0.3882353, 1,
1.504537, -1.250305, 3.498491, 1, 0, 0.3843137, 1,
1.506823, 0.267661, 0.6144877, 1, 0, 0.3764706, 1,
1.521668, -0.4709271, 2.767031, 1, 0, 0.372549, 1,
1.567692, 1.121511, -1.170015, 1, 0, 0.3647059, 1,
1.576467, -0.5623474, 1.424808, 1, 0, 0.3607843, 1,
1.57779, 1.128075, 0.4146608, 1, 0, 0.3529412, 1,
1.613618, -0.04154635, 2.529495, 1, 0, 0.3490196, 1,
1.619177, 0.04987838, 2.072094, 1, 0, 0.3411765, 1,
1.628755, 0.9650864, 2.463036, 1, 0, 0.3372549, 1,
1.629777, -1.373639, 2.474064, 1, 0, 0.3294118, 1,
1.635726, -1.069933, 0.5160532, 1, 0, 0.3254902, 1,
1.637583, 0.4418692, 1.329037, 1, 0, 0.3176471, 1,
1.644782, -0.1243382, 1.068129, 1, 0, 0.3137255, 1,
1.660537, -2.4183, 3.762957, 1, 0, 0.3058824, 1,
1.665122, 2.280345, 0.6253541, 1, 0, 0.2980392, 1,
1.66992, -0.1841771, 3.126751, 1, 0, 0.2941177, 1,
1.671972, -0.08182848, 0.822225, 1, 0, 0.2862745, 1,
1.67212, -0.1198339, 2.184277, 1, 0, 0.282353, 1,
1.700529, -0.2317608, 2.366127, 1, 0, 0.2745098, 1,
1.710478, -0.6408463, 3.37722, 1, 0, 0.2705882, 1,
1.73545, 0.7644848, 0.2869852, 1, 0, 0.2627451, 1,
1.754782, 1.025979, 0.6067024, 1, 0, 0.2588235, 1,
1.758613, 0.5709374, 1.079604, 1, 0, 0.2509804, 1,
1.766806, 0.8378485, 2.606572, 1, 0, 0.2470588, 1,
1.786943, 0.353402, 2.037211, 1, 0, 0.2392157, 1,
1.813066, -0.09160034, 2.742412, 1, 0, 0.2352941, 1,
1.813539, -0.3787098, 2.094419, 1, 0, 0.227451, 1,
1.815816, 0.2951746, 0.1009068, 1, 0, 0.2235294, 1,
1.819241, -0.7558903, 1.055845, 1, 0, 0.2156863, 1,
1.828061, -0.9400216, 1.663675, 1, 0, 0.2117647, 1,
1.835152, 0.9614004, 2.420078, 1, 0, 0.2039216, 1,
1.836481, -0.1064464, 1.823021, 1, 0, 0.1960784, 1,
1.851132, -1.990618, 2.080775, 1, 0, 0.1921569, 1,
1.868476, 0.5994948, 1.673501, 1, 0, 0.1843137, 1,
1.875532, -0.5810785, 1.664245, 1, 0, 0.1803922, 1,
1.889296, -0.2873213, 0.7952113, 1, 0, 0.172549, 1,
1.899323, 0.1431843, 1.163087, 1, 0, 0.1686275, 1,
1.915822, 0.4665035, 1.788793, 1, 0, 0.1607843, 1,
1.936782, 0.6829734, 0.1048311, 1, 0, 0.1568628, 1,
1.955355, 0.7368853, 0.9265546, 1, 0, 0.1490196, 1,
1.96444, -1.545803, 2.204705, 1, 0, 0.145098, 1,
1.972718, 0.870009, 0.5913336, 1, 0, 0.1372549, 1,
1.993562, -0.8854563, -0.07875277, 1, 0, 0.1333333, 1,
2.011458, -0.3425542, 0.9715423, 1, 0, 0.1254902, 1,
2.033967, -0.2243543, 0.804939, 1, 0, 0.1215686, 1,
2.044442, 0.2722784, 2.368718, 1, 0, 0.1137255, 1,
2.121094, -0.6543075, 0.7278166, 1, 0, 0.1098039, 1,
2.179856, -0.5682377, 1.387391, 1, 0, 0.1019608, 1,
2.209365, 0.7260774, 0.6754941, 1, 0, 0.09411765, 1,
2.241404, -0.2531695, 1.150514, 1, 0, 0.09019608, 1,
2.291213, -0.1068665, -1.956929, 1, 0, 0.08235294, 1,
2.294624, 0.4151473, 0.3186283, 1, 0, 0.07843138, 1,
2.298323, -0.6857403, 2.608327, 1, 0, 0.07058824, 1,
2.3242, 0.5999528, 1.699764, 1, 0, 0.06666667, 1,
2.364948, -1.545505, 2.68204, 1, 0, 0.05882353, 1,
2.414467, -0.3366248, 1.940313, 1, 0, 0.05490196, 1,
2.414503, 0.3003761, 0.3548995, 1, 0, 0.04705882, 1,
2.609327, 0.2933545, 2.503802, 1, 0, 0.04313726, 1,
2.675145, 0.1858817, 1.431573, 1, 0, 0.03529412, 1,
2.730623, 0.06630709, 1.786223, 1, 0, 0.03137255, 1,
2.844011, -0.8902698, 3.432864, 1, 0, 0.02352941, 1,
2.936645, -0.3619727, 0.138253, 1, 0, 0.01960784, 1,
3.14921, -1.255528, 1.302915, 1, 0, 0.01176471, 1,
3.977257, -0.6456364, 0.919925, 1, 0, 0.007843138, 1
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
0.2949896, -4.081591, -7.319366, 0, -0.5, 0.5, 0.5,
0.2949896, -4.081591, -7.319366, 1, -0.5, 0.5, 0.5,
0.2949896, -4.081591, -7.319366, 1, 1.5, 0.5, 0.5,
0.2949896, -4.081591, -7.319366, 0, 1.5, 0.5, 0.5
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
-4.635567, 0.09704018, -7.319366, 0, -0.5, 0.5, 0.5,
-4.635567, 0.09704018, -7.319366, 1, -0.5, 0.5, 0.5,
-4.635567, 0.09704018, -7.319366, 1, 1.5, 0.5, 0.5,
-4.635567, 0.09704018, -7.319366, 0, 1.5, 0.5, 0.5
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
-4.635567, -4.081591, -0.1823812, 0, -0.5, 0.5, 0.5,
-4.635567, -4.081591, -0.1823812, 1, -0.5, 0.5, 0.5,
-4.635567, -4.081591, -0.1823812, 1, 1.5, 0.5, 0.5,
-4.635567, -4.081591, -0.1823812, 0, 1.5, 0.5, 0.5
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
-2, -3.117292, -5.672369,
2, -3.117292, -5.672369,
-2, -3.117292, -5.672369,
-2, -3.278008, -5.946869,
0, -3.117292, -5.672369,
0, -3.278008, -5.946869,
2, -3.117292, -5.672369,
2, -3.278008, -5.946869
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
-2, -3.599442, -6.495868, 0, -0.5, 0.5, 0.5,
-2, -3.599442, -6.495868, 1, -0.5, 0.5, 0.5,
-2, -3.599442, -6.495868, 1, 1.5, 0.5, 0.5,
-2, -3.599442, -6.495868, 0, 1.5, 0.5, 0.5,
0, -3.599442, -6.495868, 0, -0.5, 0.5, 0.5,
0, -3.599442, -6.495868, 1, -0.5, 0.5, 0.5,
0, -3.599442, -6.495868, 1, 1.5, 0.5, 0.5,
0, -3.599442, -6.495868, 0, 1.5, 0.5, 0.5,
2, -3.599442, -6.495868, 0, -0.5, 0.5, 0.5,
2, -3.599442, -6.495868, 1, -0.5, 0.5, 0.5,
2, -3.599442, -6.495868, 1, 1.5, 0.5, 0.5,
2, -3.599442, -6.495868, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.497746, -3, -5.672369,
-3.497746, 3, -5.672369,
-3.497746, -3, -5.672369,
-3.687383, -3, -5.946869,
-3.497746, -2, -5.672369,
-3.687383, -2, -5.946869,
-3.497746, -1, -5.672369,
-3.687383, -1, -5.946869,
-3.497746, 0, -5.672369,
-3.687383, 0, -5.946869,
-3.497746, 1, -5.672369,
-3.687383, 1, -5.946869,
-3.497746, 2, -5.672369,
-3.687383, 2, -5.946869,
-3.497746, 3, -5.672369,
-3.687383, 3, -5.946869
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
-4.066657, -3, -6.495868, 0, -0.5, 0.5, 0.5,
-4.066657, -3, -6.495868, 1, -0.5, 0.5, 0.5,
-4.066657, -3, -6.495868, 1, 1.5, 0.5, 0.5,
-4.066657, -3, -6.495868, 0, 1.5, 0.5, 0.5,
-4.066657, -2, -6.495868, 0, -0.5, 0.5, 0.5,
-4.066657, -2, -6.495868, 1, -0.5, 0.5, 0.5,
-4.066657, -2, -6.495868, 1, 1.5, 0.5, 0.5,
-4.066657, -2, -6.495868, 0, 1.5, 0.5, 0.5,
-4.066657, -1, -6.495868, 0, -0.5, 0.5, 0.5,
-4.066657, -1, -6.495868, 1, -0.5, 0.5, 0.5,
-4.066657, -1, -6.495868, 1, 1.5, 0.5, 0.5,
-4.066657, -1, -6.495868, 0, 1.5, 0.5, 0.5,
-4.066657, 0, -6.495868, 0, -0.5, 0.5, 0.5,
-4.066657, 0, -6.495868, 1, -0.5, 0.5, 0.5,
-4.066657, 0, -6.495868, 1, 1.5, 0.5, 0.5,
-4.066657, 0, -6.495868, 0, 1.5, 0.5, 0.5,
-4.066657, 1, -6.495868, 0, -0.5, 0.5, 0.5,
-4.066657, 1, -6.495868, 1, -0.5, 0.5, 0.5,
-4.066657, 1, -6.495868, 1, 1.5, 0.5, 0.5,
-4.066657, 1, -6.495868, 0, 1.5, 0.5, 0.5,
-4.066657, 2, -6.495868, 0, -0.5, 0.5, 0.5,
-4.066657, 2, -6.495868, 1, -0.5, 0.5, 0.5,
-4.066657, 2, -6.495868, 1, 1.5, 0.5, 0.5,
-4.066657, 2, -6.495868, 0, 1.5, 0.5, 0.5,
-4.066657, 3, -6.495868, 0, -0.5, 0.5, 0.5,
-4.066657, 3, -6.495868, 1, -0.5, 0.5, 0.5,
-4.066657, 3, -6.495868, 1, 1.5, 0.5, 0.5,
-4.066657, 3, -6.495868, 0, 1.5, 0.5, 0.5
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
-3.497746, -3.117292, -4,
-3.497746, -3.117292, 4,
-3.497746, -3.117292, -4,
-3.687383, -3.278008, -4,
-3.497746, -3.117292, -2,
-3.687383, -3.278008, -2,
-3.497746, -3.117292, 0,
-3.687383, -3.278008, 0,
-3.497746, -3.117292, 2,
-3.687383, -3.278008, 2,
-3.497746, -3.117292, 4,
-3.687383, -3.278008, 4
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
-4.066657, -3.599442, -4, 0, -0.5, 0.5, 0.5,
-4.066657, -3.599442, -4, 1, -0.5, 0.5, 0.5,
-4.066657, -3.599442, -4, 1, 1.5, 0.5, 0.5,
-4.066657, -3.599442, -4, 0, 1.5, 0.5, 0.5,
-4.066657, -3.599442, -2, 0, -0.5, 0.5, 0.5,
-4.066657, -3.599442, -2, 1, -0.5, 0.5, 0.5,
-4.066657, -3.599442, -2, 1, 1.5, 0.5, 0.5,
-4.066657, -3.599442, -2, 0, 1.5, 0.5, 0.5,
-4.066657, -3.599442, 0, 0, -0.5, 0.5, 0.5,
-4.066657, -3.599442, 0, 1, -0.5, 0.5, 0.5,
-4.066657, -3.599442, 0, 1, 1.5, 0.5, 0.5,
-4.066657, -3.599442, 0, 0, 1.5, 0.5, 0.5,
-4.066657, -3.599442, 2, 0, -0.5, 0.5, 0.5,
-4.066657, -3.599442, 2, 1, -0.5, 0.5, 0.5,
-4.066657, -3.599442, 2, 1, 1.5, 0.5, 0.5,
-4.066657, -3.599442, 2, 0, 1.5, 0.5, 0.5,
-4.066657, -3.599442, 4, 0, -0.5, 0.5, 0.5,
-4.066657, -3.599442, 4, 1, -0.5, 0.5, 0.5,
-4.066657, -3.599442, 4, 1, 1.5, 0.5, 0.5,
-4.066657, -3.599442, 4, 0, 1.5, 0.5, 0.5
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
-3.497746, -3.117292, -5.672369,
-3.497746, 3.311372, -5.672369,
-3.497746, -3.117292, 5.307607,
-3.497746, 3.311372, 5.307607,
-3.497746, -3.117292, -5.672369,
-3.497746, -3.117292, 5.307607,
-3.497746, 3.311372, -5.672369,
-3.497746, 3.311372, 5.307607,
-3.497746, -3.117292, -5.672369,
4.087725, -3.117292, -5.672369,
-3.497746, -3.117292, 5.307607,
4.087725, -3.117292, 5.307607,
-3.497746, 3.311372, -5.672369,
4.087725, 3.311372, -5.672369,
-3.497746, 3.311372, 5.307607,
4.087725, 3.311372, 5.307607,
4.087725, -3.117292, -5.672369,
4.087725, 3.311372, -5.672369,
4.087725, -3.117292, 5.307607,
4.087725, 3.311372, 5.307607,
4.087725, -3.117292, -5.672369,
4.087725, -3.117292, 5.307607,
4.087725, 3.311372, -5.672369,
4.087725, 3.311372, 5.307607
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
var radius = 7.909891;
var distance = 35.192;
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
mvMatrix.translate( -0.2949896, -0.09704018, 0.1823812 );
mvMatrix.scale( 1.127462, 1.330343, 0.7789023 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.192);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
SO2NH2Cl<-read.table("SO2NH2Cl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-SO2NH2Cl$V2
```

```
## Error in eval(expr, envir, enclos): object 'SO2NH2Cl' not found
```

```r
y<-SO2NH2Cl$V3
```

```
## Error in eval(expr, envir, enclos): object 'SO2NH2Cl' not found
```

```r
z<-SO2NH2Cl$V4
```

```
## Error in eval(expr, envir, enclos): object 'SO2NH2Cl' not found
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
-3.387278, 1.86372, 0.9031376, 0, 0, 1, 1, 1,
-3.151088, -1.498407, -0.9779771, 1, 0, 0, 1, 1,
-3.148347, 0.7737212, -1.62704, 1, 0, 0, 1, 1,
-2.806028, 0.4900555, -0.524568, 1, 0, 0, 1, 1,
-2.568358, -0.3013387, -1.851035, 1, 0, 0, 1, 1,
-2.511818, 0.1384261, -2.19118, 1, 0, 0, 1, 1,
-2.471767, 1.790937, -1.330962, 0, 0, 0, 1, 1,
-2.446124, 1.278232, 0.1184347, 0, 0, 0, 1, 1,
-2.423222, -1.520766, -4.272747, 0, 0, 0, 1, 1,
-2.394254, 0.7416755, -0.1831331, 0, 0, 0, 1, 1,
-2.386621, -0.9976609, -2.679949, 0, 0, 0, 1, 1,
-2.285606, 1.536487, 0.6333209, 0, 0, 0, 1, 1,
-2.259936, -0.03403519, -2.863831, 0, 0, 0, 1, 1,
-2.249615, 0.2925902, -1.282637, 1, 1, 1, 1, 1,
-2.232892, 1.108922, -0.9795274, 1, 1, 1, 1, 1,
-2.219135, 0.4869144, -2.275146, 1, 1, 1, 1, 1,
-2.186138, 0.1587301, -1.267985, 1, 1, 1, 1, 1,
-2.179836, -0.8479768, -3.148694, 1, 1, 1, 1, 1,
-2.081628, -0.8792346, -2.547288, 1, 1, 1, 1, 1,
-2.054251, 1.583223, -2.606874, 1, 1, 1, 1, 1,
-2.037542, 0.8930719, -0.5328498, 1, 1, 1, 1, 1,
-2.000025, 0.7192801, -0.8779896, 1, 1, 1, 1, 1,
-1.990636, 0.6634322, -0.5488077, 1, 1, 1, 1, 1,
-1.98682, 1.820921, 0.4136268, 1, 1, 1, 1, 1,
-1.981448, -2.693415, -2.506953, 1, 1, 1, 1, 1,
-1.960144, 0.7049686, -1.45021, 1, 1, 1, 1, 1,
-1.93831, -1.217189, -2.027867, 1, 1, 1, 1, 1,
-1.936009, -0.6616598, -1.290432, 1, 1, 1, 1, 1,
-1.911771, 0.2137164, -2.030257, 0, 0, 1, 1, 1,
-1.890862, 0.3103643, -2.532557, 1, 0, 0, 1, 1,
-1.883254, 0.07841545, 0.5882561, 1, 0, 0, 1, 1,
-1.859557, -1.684824, -1.76421, 1, 0, 0, 1, 1,
-1.845963, -1.719159, -2.128626, 1, 0, 0, 1, 1,
-1.841906, 1.582937, -0.5442541, 1, 0, 0, 1, 1,
-1.840948, -0.2310008, 1.086874, 0, 0, 0, 1, 1,
-1.839475, 0.2703806, -2.108249, 0, 0, 0, 1, 1,
-1.83604, -0.8016827, -2.674877, 0, 0, 0, 1, 1,
-1.823138, -0.1364975, 0.1362331, 0, 0, 0, 1, 1,
-1.787759, -0.02305686, -2.141937, 0, 0, 0, 1, 1,
-1.779991, -0.9614338, -2.485397, 0, 0, 0, 1, 1,
-1.769854, 0.7830902, -0.9659771, 0, 0, 0, 1, 1,
-1.768886, 0.7321933, -2.687146, 1, 1, 1, 1, 1,
-1.757907, -0.03182572, -1.889869, 1, 1, 1, 1, 1,
-1.752552, -0.7067116, -3.674254, 1, 1, 1, 1, 1,
-1.706172, -2.0423, -3.871459, 1, 1, 1, 1, 1,
-1.694726, 0.8590178, -0.05883009, 1, 1, 1, 1, 1,
-1.694043, 1.0075, -2.625388, 1, 1, 1, 1, 1,
-1.693086, -0.2455598, -3.228517, 1, 1, 1, 1, 1,
-1.66657, 0.2903527, -1.734582, 1, 1, 1, 1, 1,
-1.659475, -1.892236, -1.2953, 1, 1, 1, 1, 1,
-1.655913, 0.2719042, -0.8065057, 1, 1, 1, 1, 1,
-1.643483, -0.3186725, -1.175918, 1, 1, 1, 1, 1,
-1.62494, -0.07331513, -2.134789, 1, 1, 1, 1, 1,
-1.623065, 0.876147, -0.6116694, 1, 1, 1, 1, 1,
-1.61571, 2.156483, -1.117128, 1, 1, 1, 1, 1,
-1.615446, -0.6812977, -2.634584, 1, 1, 1, 1, 1,
-1.609683, -0.9014313, -4.847912, 0, 0, 1, 1, 1,
-1.600716, 0.5336705, -0.02442108, 1, 0, 0, 1, 1,
-1.599365, -1.349811, -3.205998, 1, 0, 0, 1, 1,
-1.582538, -0.2487872, -1.367208, 1, 0, 0, 1, 1,
-1.578336, -0.07512401, -0.4276084, 1, 0, 0, 1, 1,
-1.565853, -0.3537934, -2.194553, 1, 0, 0, 1, 1,
-1.565233, 0.8662384, 1.520551, 0, 0, 0, 1, 1,
-1.545643, 0.1598439, -1.117768, 0, 0, 0, 1, 1,
-1.513747, -0.8260097, -2.183441, 0, 0, 0, 1, 1,
-1.512709, -0.6540033, -2.977797, 0, 0, 0, 1, 1,
-1.511235, 1.502378, -1.672061, 0, 0, 0, 1, 1,
-1.504463, 0.3098474, -0.8785354, 0, 0, 0, 1, 1,
-1.49993, -0.1405318, 0.2171553, 0, 0, 0, 1, 1,
-1.48614, 0.3787435, -1.346992, 1, 1, 1, 1, 1,
-1.485193, -1.594397, -2.565328, 1, 1, 1, 1, 1,
-1.477101, 0.3205287, -1.829186, 1, 1, 1, 1, 1,
-1.475516, -0.4196339, -1.812905, 1, 1, 1, 1, 1,
-1.472916, 0.6811642, -1.466768, 1, 1, 1, 1, 1,
-1.464653, -0.4428842, -3.830454, 1, 1, 1, 1, 1,
-1.45564, -1.14977, -2.476156, 1, 1, 1, 1, 1,
-1.455335, -0.2652421, -2.180585, 1, 1, 1, 1, 1,
-1.449987, -1.142863, -1.692884, 1, 1, 1, 1, 1,
-1.447005, -0.5475325, -2.490639, 1, 1, 1, 1, 1,
-1.442508, 0.008415504, -0.6310354, 1, 1, 1, 1, 1,
-1.441674, -0.3724556, -1.552983, 1, 1, 1, 1, 1,
-1.441138, -1.427474, -0.5866892, 1, 1, 1, 1, 1,
-1.439921, -0.1721603, -1.103731, 1, 1, 1, 1, 1,
-1.421958, 0.101967, -2.105159, 1, 1, 1, 1, 1,
-1.421521, 1.578803, -0.9505848, 0, 0, 1, 1, 1,
-1.413167, 0.2667992, -2.782351, 1, 0, 0, 1, 1,
-1.41264, -0.702998, -2.89277, 1, 0, 0, 1, 1,
-1.407756, -0.233149, -0.4842856, 1, 0, 0, 1, 1,
-1.392143, 1.191323, -0.9412895, 1, 0, 0, 1, 1,
-1.388731, -1.261735, -1.893927, 1, 0, 0, 1, 1,
-1.384147, 0.04803213, -1.339809, 0, 0, 0, 1, 1,
-1.368422, 1.098783, -1.987458, 0, 0, 0, 1, 1,
-1.368071, 0.3070297, -2.203853, 0, 0, 0, 1, 1,
-1.354818, -0.9330245, -2.842431, 0, 0, 0, 1, 1,
-1.343357, 0.6690352, -0.3650053, 0, 0, 0, 1, 1,
-1.342426, -2.206581, -3.283447, 0, 0, 0, 1, 1,
-1.341467, -0.7324744, -3.940337, 0, 0, 0, 1, 1,
-1.335927, 0.06527501, -0.4701608, 1, 1, 1, 1, 1,
-1.334343, 0.5798131, -1.561996, 1, 1, 1, 1, 1,
-1.333644, -2.244287, -3.660211, 1, 1, 1, 1, 1,
-1.328005, 0.09874805, -1.073187, 1, 1, 1, 1, 1,
-1.32671, 0.6898921, -0.5527116, 1, 1, 1, 1, 1,
-1.31806, 0.2512485, -1.545868, 1, 1, 1, 1, 1,
-1.311963, -1.085788, -2.001117, 1, 1, 1, 1, 1,
-1.31137, -1.190044, -2.710997, 1, 1, 1, 1, 1,
-1.291943, 0.8283194, -2.076036, 1, 1, 1, 1, 1,
-1.284358, 1.046218, -2.309248, 1, 1, 1, 1, 1,
-1.283577, 0.777213, -0.4238153, 1, 1, 1, 1, 1,
-1.281273, -2.485189, -1.937775, 1, 1, 1, 1, 1,
-1.27999, -0.8522226, -2.1414, 1, 1, 1, 1, 1,
-1.270011, -0.9525614, -2.879572, 1, 1, 1, 1, 1,
-1.262318, -1.676146, -2.228264, 1, 1, 1, 1, 1,
-1.259839, 0.566366, -1.801561, 0, 0, 1, 1, 1,
-1.257589, -1.051419, -3.914487, 1, 0, 0, 1, 1,
-1.256858, -0.03776109, -1.034148, 1, 0, 0, 1, 1,
-1.253176, -0.3303597, -1.648392, 1, 0, 0, 1, 1,
-1.250632, -2.311421, -3.000894, 1, 0, 0, 1, 1,
-1.243986, 1.434725, -0.2023613, 1, 0, 0, 1, 1,
-1.24388, 0.1645745, -1.991212, 0, 0, 0, 1, 1,
-1.239465, -0.4220174, -0.6004276, 0, 0, 0, 1, 1,
-1.232129, -1.159749, -2.69036, 0, 0, 0, 1, 1,
-1.225757, 1.967022, -0.6495807, 0, 0, 0, 1, 1,
-1.223356, 0.8843446, -0.8305503, 0, 0, 0, 1, 1,
-1.208906, 0.7868357, 0.01655127, 0, 0, 0, 1, 1,
-1.20716, 0.6888295, -0.4016176, 0, 0, 0, 1, 1,
-1.199625, -0.4268448, -2.311625, 1, 1, 1, 1, 1,
-1.198393, 0.4468409, -3.610895, 1, 1, 1, 1, 1,
-1.173272, -1.096344, -1.57227, 1, 1, 1, 1, 1,
-1.165449, 1.079089, -0.7135477, 1, 1, 1, 1, 1,
-1.159031, -1.335818, -4.214856, 1, 1, 1, 1, 1,
-1.154288, -0.6080784, -2.892184, 1, 1, 1, 1, 1,
-1.15271, -0.4856133, -2.730336, 1, 1, 1, 1, 1,
-1.151565, 1.262985, -0.5365495, 1, 1, 1, 1, 1,
-1.147815, 0.5466452, 0.1354196, 1, 1, 1, 1, 1,
-1.129394, 0.9157125, -0.4355821, 1, 1, 1, 1, 1,
-1.119976, -1.283199, -3.816534, 1, 1, 1, 1, 1,
-1.114023, -1.305079, -2.319337, 1, 1, 1, 1, 1,
-1.112555, 0.5553656, -2.161887, 1, 1, 1, 1, 1,
-1.11184, 0.9052656, -1.255192, 1, 1, 1, 1, 1,
-1.104093, -0.7093514, -1.206121, 1, 1, 1, 1, 1,
-1.08981, 0.987116, -0.6617067, 0, 0, 1, 1, 1,
-1.07072, 0.8128281, -0.1368586, 1, 0, 0, 1, 1,
-1.070471, -1.43928, -0.8568584, 1, 0, 0, 1, 1,
-1.066986, -0.4141255, -1.701054, 1, 0, 0, 1, 1,
-1.059406, -0.4866916, -1.356581, 1, 0, 0, 1, 1,
-1.054882, 0.3693675, -1.606681, 1, 0, 0, 1, 1,
-1.054521, 0.2875742, -1.38338, 0, 0, 0, 1, 1,
-1.051247, 0.5762923, -2.287247, 0, 0, 0, 1, 1,
-1.047381, -0.1845337, -1.890192, 0, 0, 0, 1, 1,
-1.026905, 0.2842276, -2.961061, 0, 0, 0, 1, 1,
-1.021611, 0.3354174, -2.52294, 0, 0, 0, 1, 1,
-1.01908, -1.023245, -3.116007, 0, 0, 0, 1, 1,
-1.014125, 2.086603, -1.371505, 0, 0, 0, 1, 1,
-1.012609, -1.161665, -1.370543, 1, 1, 1, 1, 1,
-1.010422, -2.385586, -3.522043, 1, 1, 1, 1, 1,
-1.000888, 0.7766044, -0.418779, 1, 1, 1, 1, 1,
-0.9985589, -0.9502791, -2.357539, 1, 1, 1, 1, 1,
-0.9983472, -0.5011272, -2.335984, 1, 1, 1, 1, 1,
-0.9974349, 0.6670724, -1.823157, 1, 1, 1, 1, 1,
-0.9895775, -0.3323081, -2.45922, 1, 1, 1, 1, 1,
-0.9866001, -0.7095622, -3.068068, 1, 1, 1, 1, 1,
-0.9847084, -0.1953191, -2.385292, 1, 1, 1, 1, 1,
-0.977382, -1.679147, -3.798444, 1, 1, 1, 1, 1,
-0.9745506, 0.6847122, -3.567529, 1, 1, 1, 1, 1,
-0.9721464, 1.692406, -1.509295, 1, 1, 1, 1, 1,
-0.9651554, -1.793271, -2.610237, 1, 1, 1, 1, 1,
-0.9501196, -0.04868482, -0.3979892, 1, 1, 1, 1, 1,
-0.9493008, -0.8233921, -2.516198, 1, 1, 1, 1, 1,
-0.9492509, 1.208574, -2.345828, 0, 0, 1, 1, 1,
-0.9462246, -1.888172, -3.557699, 1, 0, 0, 1, 1,
-0.9444174, -1.630551, -2.932537, 1, 0, 0, 1, 1,
-0.9416227, -0.6874309, -0.8208882, 1, 0, 0, 1, 1,
-0.9394841, 0.08977938, -2.902302, 1, 0, 0, 1, 1,
-0.9391295, 1.682111, 1.421051, 1, 0, 0, 1, 1,
-0.9381931, 0.1617791, -2.744672, 0, 0, 0, 1, 1,
-0.9359586, 0.7568353, 0.04929349, 0, 0, 0, 1, 1,
-0.9353069, -0.2187807, -2.434073, 0, 0, 0, 1, 1,
-0.9352911, -0.03278604, -1.42894, 0, 0, 0, 1, 1,
-0.9271684, 0.4270098, -1.956883, 0, 0, 0, 1, 1,
-0.9262834, -0.801396, -2.134016, 0, 0, 0, 1, 1,
-0.9234081, 0.1929054, -1.830267, 0, 0, 0, 1, 1,
-0.9137909, 0.451785, 0.8510666, 1, 1, 1, 1, 1,
-0.9119116, 0.1471351, -1.774894, 1, 1, 1, 1, 1,
-0.9105197, -0.3002291, -1.509471, 1, 1, 1, 1, 1,
-0.9101399, 1.211088, -0.6884881, 1, 1, 1, 1, 1,
-0.9080253, -1.32677, -2.235858, 1, 1, 1, 1, 1,
-0.9056338, 1.95938, -0.2693422, 1, 1, 1, 1, 1,
-0.9023207, -0.8715931, -2.439665, 1, 1, 1, 1, 1,
-0.9020154, 1.054471, -2.410726, 1, 1, 1, 1, 1,
-0.9000381, 0.7974577, -1.58857, 1, 1, 1, 1, 1,
-0.8960502, -0.5797486, -3.205158, 1, 1, 1, 1, 1,
-0.8903688, 0.8850321, -1.280651, 1, 1, 1, 1, 1,
-0.889326, 0.6928437, -0.6058879, 1, 1, 1, 1, 1,
-0.8874254, 0.791931, -2.092745, 1, 1, 1, 1, 1,
-0.885314, 1.758148, -0.8819183, 1, 1, 1, 1, 1,
-0.8847524, 1.851263, 0.3706264, 1, 1, 1, 1, 1,
-0.8828194, 0.8245669, -1.465384, 0, 0, 1, 1, 1,
-0.8795046, 0.6526991, -2.452736, 1, 0, 0, 1, 1,
-0.8772694, -0.1303722, -2.67485, 1, 0, 0, 1, 1,
-0.8703022, -0.154666, -1.825556, 1, 0, 0, 1, 1,
-0.8701478, -0.4041249, -1.235165, 1, 0, 0, 1, 1,
-0.869503, 1.105203, 0.4188882, 1, 0, 0, 1, 1,
-0.8569077, -0.1601602, -2.395764, 0, 0, 0, 1, 1,
-0.8537896, -1.924098, -2.189081, 0, 0, 0, 1, 1,
-0.8491501, 0.9348961, -0.8372387, 0, 0, 0, 1, 1,
-0.8467771, 0.8437345, 0.171915, 0, 0, 0, 1, 1,
-0.8442348, -0.4246345, -2.164308, 0, 0, 0, 1, 1,
-0.8436524, -0.315987, -1.749667, 0, 0, 0, 1, 1,
-0.8433843, 1.714769, 1.388177, 0, 0, 0, 1, 1,
-0.8343572, 0.8598747, -0.289351, 1, 1, 1, 1, 1,
-0.8331147, 0.244718, -1.558743, 1, 1, 1, 1, 1,
-0.8307146, 2.150575, 0.182252, 1, 1, 1, 1, 1,
-0.8291383, 0.3472469, -1.186267, 1, 1, 1, 1, 1,
-0.8289655, -0.8343463, -2.327103, 1, 1, 1, 1, 1,
-0.8284552, 0.5359186, -0.6376493, 1, 1, 1, 1, 1,
-0.8257676, -0.3750818, -1.300355, 1, 1, 1, 1, 1,
-0.8223048, -0.7579198, -2.857411, 1, 1, 1, 1, 1,
-0.8218421, -0.07663473, -0.5590679, 1, 1, 1, 1, 1,
-0.8177145, 0.2508123, -2.102551, 1, 1, 1, 1, 1,
-0.8101799, -1.443835, -3.108999, 1, 1, 1, 1, 1,
-0.8036149, -0.06398179, -3.534954, 1, 1, 1, 1, 1,
-0.8013409, 0.2777629, -1.055189, 1, 1, 1, 1, 1,
-0.7943682, 0.2031282, -0.4046965, 1, 1, 1, 1, 1,
-0.7892469, 0.3544565, -1.376447, 1, 1, 1, 1, 1,
-0.7784404, -0.435153, -0.06364223, 0, 0, 1, 1, 1,
-0.7722896, -0.9090142, -0.7521941, 1, 0, 0, 1, 1,
-0.7713127, -0.8524398, -0.834585, 1, 0, 0, 1, 1,
-0.7688413, 0.5905936, -0.746038, 1, 0, 0, 1, 1,
-0.7678893, 0.9609988, -0.7047731, 1, 0, 0, 1, 1,
-0.762616, 1.284782, -1.211597, 1, 0, 0, 1, 1,
-0.7617962, 1.721101, -0.5809703, 0, 0, 0, 1, 1,
-0.7568684, -0.7382728, -3.109592, 0, 0, 0, 1, 1,
-0.7560583, -1.506643, -3.013477, 0, 0, 0, 1, 1,
-0.7558375, 1.585239, 0.5493593, 0, 0, 0, 1, 1,
-0.7487242, 0.9724041, -0.8675904, 0, 0, 0, 1, 1,
-0.7425924, -2.492899, -4.060811, 0, 0, 0, 1, 1,
-0.738831, 0.7598061, -1.797936, 0, 0, 0, 1, 1,
-0.7384362, 1.623438, -1.179202, 1, 1, 1, 1, 1,
-0.7377277, -0.4368955, -2.013644, 1, 1, 1, 1, 1,
-0.7365367, -0.03952833, -1.197721, 1, 1, 1, 1, 1,
-0.7345674, -0.6788624, -1.131305, 1, 1, 1, 1, 1,
-0.7242624, -0.8717775, -3.985805, 1, 1, 1, 1, 1,
-0.7192544, 1.119672, -1.855756, 1, 1, 1, 1, 1,
-0.7171795, -0.5264563, -1.345207, 1, 1, 1, 1, 1,
-0.7171375, 1.240998, 1.109212, 1, 1, 1, 1, 1,
-0.7135693, 0.06592593, -2.333279, 1, 1, 1, 1, 1,
-0.713129, 0.1764189, -1.905549, 1, 1, 1, 1, 1,
-0.7125607, 0.9691589, 0.9645944, 1, 1, 1, 1, 1,
-0.7026581, 0.4119168, -0.6574067, 1, 1, 1, 1, 1,
-0.6989755, 1.03779, -1.66624, 1, 1, 1, 1, 1,
-0.6971007, 0.6879239, 0.2248074, 1, 1, 1, 1, 1,
-0.6969255, -1.61888, -1.798931, 1, 1, 1, 1, 1,
-0.6960388, 1.081372, 0.6391955, 0, 0, 1, 1, 1,
-0.694118, 0.5458339, -1.993772, 1, 0, 0, 1, 1,
-0.6893743, 1.592401, 0.2738056, 1, 0, 0, 1, 1,
-0.6892067, 0.1014835, -1.721057, 1, 0, 0, 1, 1,
-0.6814059, 0.9502392, 0.6342814, 1, 0, 0, 1, 1,
-0.6797678, -0.5714204, -3.254433, 1, 0, 0, 1, 1,
-0.6774702, 0.6176798, -1.55649, 0, 0, 0, 1, 1,
-0.670966, -0.6169073, -2.79862, 0, 0, 0, 1, 1,
-0.6644469, -1.878231, -1.418794, 0, 0, 0, 1, 1,
-0.6600477, 0.2956274, -1.391609, 0, 0, 0, 1, 1,
-0.6494824, 1.776702, -0.8486853, 0, 0, 0, 1, 1,
-0.6493488, -0.6577712, -2.530401, 0, 0, 0, 1, 1,
-0.646819, -0.5622106, -3.125243, 0, 0, 0, 1, 1,
-0.6405845, 0.531935, -0.282136, 1, 1, 1, 1, 1,
-0.6381738, -0.6947201, -2.040249, 1, 1, 1, 1, 1,
-0.6381576, 0.3502911, -1.652816, 1, 1, 1, 1, 1,
-0.6309336, -1.059693, -3.796749, 1, 1, 1, 1, 1,
-0.6284082, 0.675088, -2.314987, 1, 1, 1, 1, 1,
-0.6273667, -1.550235, -1.856415, 1, 1, 1, 1, 1,
-0.6179669, 3.208098, 1.753946, 1, 1, 1, 1, 1,
-0.6118884, 0.6726219, -1.072324, 1, 1, 1, 1, 1,
-0.6083313, 1.300067, -0.1782538, 1, 1, 1, 1, 1,
-0.6070419, 0.4463846, -0.1685166, 1, 1, 1, 1, 1,
-0.5939395, 0.9557313, -0.0451674, 1, 1, 1, 1, 1,
-0.587454, 0.7672032, -1.830441, 1, 1, 1, 1, 1,
-0.5837469, -0.2527724, -2.279982, 1, 1, 1, 1, 1,
-0.5810717, -0.7055023, -1.0178, 1, 1, 1, 1, 1,
-0.5782722, 0.5036395, 0.3665613, 1, 1, 1, 1, 1,
-0.5771708, 1.979085, -1.035246, 0, 0, 1, 1, 1,
-0.5749094, -2.047787, -2.80186, 1, 0, 0, 1, 1,
-0.5699719, 0.9688364, -0.7521155, 1, 0, 0, 1, 1,
-0.566839, 0.5437825, -1.200561, 1, 0, 0, 1, 1,
-0.5664458, 0.5328599, -1.11438, 1, 0, 0, 1, 1,
-0.5618181, 3.217751, -0.434866, 1, 0, 0, 1, 1,
-0.5524661, 1.2653, -0.1724961, 0, 0, 0, 1, 1,
-0.5489236, 0.7174961, -0.6315104, 0, 0, 0, 1, 1,
-0.5483086, -0.003054082, -1.628726, 0, 0, 0, 1, 1,
-0.5457996, 0.5309479, -1.003695, 0, 0, 0, 1, 1,
-0.5427449, 0.7461143, -0.5383631, 0, 0, 0, 1, 1,
-0.5383249, 2.033104, -0.01269, 0, 0, 0, 1, 1,
-0.5383143, 0.3765979, -0.132419, 0, 0, 0, 1, 1,
-0.5346611, 0.781433, -0.3051682, 1, 1, 1, 1, 1,
-0.5296232, 1.85766, -0.1719556, 1, 1, 1, 1, 1,
-0.5277234, -0.3375272, -2.259708, 1, 1, 1, 1, 1,
-0.5276798, -1.19193, -2.397663, 1, 1, 1, 1, 1,
-0.5241831, 1.691781, -0.1985086, 1, 1, 1, 1, 1,
-0.5236288, -1.187084, -1.853184, 1, 1, 1, 1, 1,
-0.5187131, -0.1228631, -2.013279, 1, 1, 1, 1, 1,
-0.515873, -0.6679935, -2.680296, 1, 1, 1, 1, 1,
-0.511892, -1.493819, -4.035412, 1, 1, 1, 1, 1,
-0.5098186, 0.2018183, -0.01485036, 1, 1, 1, 1, 1,
-0.5083433, 0.3058843, -1.61024, 1, 1, 1, 1, 1,
-0.5066297, 0.09557254, -0.8654686, 1, 1, 1, 1, 1,
-0.5047504, 1.218546, -0.06417282, 1, 1, 1, 1, 1,
-0.5010195, 1.364324, -0.2900643, 1, 1, 1, 1, 1,
-0.4994397, -0.9049795, -1.769095, 1, 1, 1, 1, 1,
-0.4991661, 1.053107, 2.080666, 0, 0, 1, 1, 1,
-0.4988528, -2.136631, -4.395995, 1, 0, 0, 1, 1,
-0.4965566, 1.332891, -0.1181782, 1, 0, 0, 1, 1,
-0.4927452, -1.372999, -1.742953, 1, 0, 0, 1, 1,
-0.4907242, -0.9493412, -0.9559451, 1, 0, 0, 1, 1,
-0.490305, 0.6206537, -0.5743814, 1, 0, 0, 1, 1,
-0.4893379, 0.2992162, -1.501262, 0, 0, 0, 1, 1,
-0.4847212, 0.3370251, -0.3680784, 0, 0, 0, 1, 1,
-0.4841637, 0.6750853, 1.617978, 0, 0, 0, 1, 1,
-0.4833093, -0.5127264, -3.197571, 0, 0, 0, 1, 1,
-0.4826459, -1.238225, -3.932765, 0, 0, 0, 1, 1,
-0.4782659, -0.2347761, -2.762965, 0, 0, 0, 1, 1,
-0.4778738, 0.8639964, -0.3569634, 0, 0, 0, 1, 1,
-0.4761633, -0.6238547, -3.915824, 1, 1, 1, 1, 1,
-0.4731871, -0.2126402, -1.865317, 1, 1, 1, 1, 1,
-0.4722516, -0.05342143, -1.133336, 1, 1, 1, 1, 1,
-0.4709392, 0.5316906, -0.3513554, 1, 1, 1, 1, 1,
-0.464206, 1.244708, 0.4480249, 1, 1, 1, 1, 1,
-0.4602883, -0.7006297, -3.309393, 1, 1, 1, 1, 1,
-0.4542051, 2.453311, 0.3173082, 1, 1, 1, 1, 1,
-0.4481613, 1.765428, 1.8099, 1, 1, 1, 1, 1,
-0.4393792, 1.156168, -0.4348011, 1, 1, 1, 1, 1,
-0.4341872, -0.3930722, -2.269468, 1, 1, 1, 1, 1,
-0.4339848, -0.334526, -2.132576, 1, 1, 1, 1, 1,
-0.4277413, 1.5708, -2.526855, 1, 1, 1, 1, 1,
-0.4276872, -0.5557389, -4.356449, 1, 1, 1, 1, 1,
-0.422426, -0.3338121, -1.583982, 1, 1, 1, 1, 1,
-0.4193016, 0.2858468, -0.2563051, 1, 1, 1, 1, 1,
-0.4171135, 0.02952269, -2.065989, 0, 0, 1, 1, 1,
-0.4125645, 0.3866189, -1.812029, 1, 0, 0, 1, 1,
-0.4104631, 0.1472149, -0.5206341, 1, 0, 0, 1, 1,
-0.4077797, 0.3453271, -1.099796, 1, 0, 0, 1, 1,
-0.4077336, 0.5001302, -1.927679, 1, 0, 0, 1, 1,
-0.4026754, -0.6196318, -2.392803, 1, 0, 0, 1, 1,
-0.4009854, -0.003560602, -0.8040943, 0, 0, 0, 1, 1,
-0.4004908, 0.2465614, -0.8498706, 0, 0, 0, 1, 1,
-0.3993498, 0.2174078, -2.377023, 0, 0, 0, 1, 1,
-0.3939031, 2.243048, 0.5586452, 0, 0, 0, 1, 1,
-0.3930854, 0.9058764, 0.03589654, 0, 0, 0, 1, 1,
-0.3926614, -0.4305159, -3.101395, 0, 0, 0, 1, 1,
-0.3925289, 0.4346571, -2.490992, 0, 0, 0, 1, 1,
-0.3878595, 0.1221718, -0.8041644, 1, 1, 1, 1, 1,
-0.3871815, 0.03005315, 0.1821096, 1, 1, 1, 1, 1,
-0.3858528, -0.1404954, -0.9732611, 1, 1, 1, 1, 1,
-0.3845668, 0.2110542, -0.3849808, 1, 1, 1, 1, 1,
-0.3831498, -0.7693548, -1.645714, 1, 1, 1, 1, 1,
-0.3831452, 0.4269015, 0.2566487, 1, 1, 1, 1, 1,
-0.3802926, 0.364836, -0.2622601, 1, 1, 1, 1, 1,
-0.3800332, -0.8464412, -2.646971, 1, 1, 1, 1, 1,
-0.3765991, -0.1343522, -0.2583891, 1, 1, 1, 1, 1,
-0.3757611, -0.9501914, -2.977976, 1, 1, 1, 1, 1,
-0.3753152, -2.556634, -3.65064, 1, 1, 1, 1, 1,
-0.3729028, -1.475074, -2.519554, 1, 1, 1, 1, 1,
-0.3722872, -0.06615378, -2.366176, 1, 1, 1, 1, 1,
-0.3641838, 2.613728, -0.5528963, 1, 1, 1, 1, 1,
-0.3594987, 1.111804, 0.0939013, 1, 1, 1, 1, 1,
-0.3587847, -0.6189172, -2.158074, 0, 0, 1, 1, 1,
-0.351676, 1.517265, -1.043303, 1, 0, 0, 1, 1,
-0.3484879, -0.4299972, -2.893141, 1, 0, 0, 1, 1,
-0.3458863, -2.041017, -1.671925, 1, 0, 0, 1, 1,
-0.3429389, -0.2807696, -2.121902, 1, 0, 0, 1, 1,
-0.3427405, -1.546179, -3.999547, 1, 0, 0, 1, 1,
-0.3420892, -0.1710417, -1.245271, 0, 0, 0, 1, 1,
-0.3395743, 0.8322439, 0.4875118, 0, 0, 0, 1, 1,
-0.3336783, 0.4728984, 0.005093179, 0, 0, 0, 1, 1,
-0.3296672, -1.569184, -0.9216645, 0, 0, 0, 1, 1,
-0.3244009, 0.3566611, -0.8377635, 0, 0, 0, 1, 1,
-0.3235928, 0.7778174, -0.584323, 0, 0, 0, 1, 1,
-0.3233946, -0.3642076, -4.385011, 0, 0, 0, 1, 1,
-0.3207787, -0.5823992, -3.739531, 1, 1, 1, 1, 1,
-0.3197201, -1.377056, -4.450692, 1, 1, 1, 1, 1,
-0.3190394, -0.04828544, -2.407871, 1, 1, 1, 1, 1,
-0.3175126, -0.8947942, -2.849664, 1, 1, 1, 1, 1,
-0.3173829, -1.052055, -1.816861, 1, 1, 1, 1, 1,
-0.3116566, 0.6656995, -1.39869, 1, 1, 1, 1, 1,
-0.3062608, 0.541676, 0.5443091, 1, 1, 1, 1, 1,
-0.3054985, -0.8159584, -3.408149, 1, 1, 1, 1, 1,
-0.3052106, -1.425525, -2.98264, 1, 1, 1, 1, 1,
-0.303668, 0.2926553, -1.143225, 1, 1, 1, 1, 1,
-0.3023877, 0.676622, -0.7026694, 1, 1, 1, 1, 1,
-0.3022521, -0.7318484, -2.796703, 1, 1, 1, 1, 1,
-0.3009439, -1.78231, -3.523323, 1, 1, 1, 1, 1,
-0.2986575, 1.091425, -1.902499, 1, 1, 1, 1, 1,
-0.2978838, -1.156046, -3.02252, 1, 1, 1, 1, 1,
-0.2940781, -0.22883, -2.132706, 0, 0, 1, 1, 1,
-0.2870619, 0.2962248, -2.279314, 1, 0, 0, 1, 1,
-0.2869288, 0.9807019, -1.729551, 1, 0, 0, 1, 1,
-0.2862737, 1.339067, -2.261371, 1, 0, 0, 1, 1,
-0.2776231, -0.4529965, -2.508229, 1, 0, 0, 1, 1,
-0.2691046, 0.8529772, -1.968466, 1, 0, 0, 1, 1,
-0.2680019, -0.6850846, -2.243798, 0, 0, 0, 1, 1,
-0.2604504, 2.13533, -1.303649, 0, 0, 0, 1, 1,
-0.2603183, -1.7698, -2.981768, 0, 0, 0, 1, 1,
-0.2602827, 0.1175143, 0.09499823, 0, 0, 0, 1, 1,
-0.2586589, 0.05280268, 0.1610298, 0, 0, 0, 1, 1,
-0.2565515, 1.276906, 0.9689916, 0, 0, 0, 1, 1,
-0.254779, 0.4007459, -1.347799, 0, 0, 0, 1, 1,
-0.2507269, 1.105635, -1.3033, 1, 1, 1, 1, 1,
-0.2484082, -0.2108171, -1.943768, 1, 1, 1, 1, 1,
-0.2479362, 0.5925994, 0.5294919, 1, 1, 1, 1, 1,
-0.2440425, 0.5194997, -0.5182371, 1, 1, 1, 1, 1,
-0.2383206, -0.7707607, -2.748755, 1, 1, 1, 1, 1,
-0.2339183, -0.1041175, -1.876424, 1, 1, 1, 1, 1,
-0.233815, 0.7000728, -0.225627, 1, 1, 1, 1, 1,
-0.2332653, 0.0893044, -0.02136626, 1, 1, 1, 1, 1,
-0.2328734, -0.1365498, -0.6325735, 1, 1, 1, 1, 1,
-0.2317998, 0.5390521, 0.2452702, 1, 1, 1, 1, 1,
-0.2293942, -1.339973, -4.681917, 1, 1, 1, 1, 1,
-0.2273676, 0.7570625, -0.7193337, 1, 1, 1, 1, 1,
-0.2259959, -0.9100142, -5.10038, 1, 1, 1, 1, 1,
-0.2233465, 0.213945, -1.641343, 1, 1, 1, 1, 1,
-0.2215834, -0.1822379, -1.420665, 1, 1, 1, 1, 1,
-0.2202264, 0.4951317, 0.3090509, 0, 0, 1, 1, 1,
-0.2198002, 0.4727037, -0.760066, 1, 0, 0, 1, 1,
-0.2164283, -0.8581769, -3.741624, 1, 0, 0, 1, 1,
-0.2102494, -0.4337373, -2.682151, 1, 0, 0, 1, 1,
-0.2083177, -0.4783172, -2.622008, 1, 0, 0, 1, 1,
-0.1980048, -0.8593007, -2.210688, 1, 0, 0, 1, 1,
-0.1947505, -1.442831, -2.125935, 0, 0, 0, 1, 1,
-0.1891491, 0.8282843, -0.6313899, 0, 0, 0, 1, 1,
-0.1881217, -0.6733144, -2.971238, 0, 0, 0, 1, 1,
-0.1799999, 0.9709165, 0.797453, 0, 0, 0, 1, 1,
-0.179334, 0.5924425, -1.082183, 0, 0, 0, 1, 1,
-0.1793156, 1.761763, -0.351599, 0, 0, 0, 1, 1,
-0.1762887, 0.395649, -1.377274, 0, 0, 0, 1, 1,
-0.1740303, 1.252316, -2.61528, 1, 1, 1, 1, 1,
-0.1701604, -0.08380335, -0.8307857, 1, 1, 1, 1, 1,
-0.1696908, 1.180978, -0.3244606, 1, 1, 1, 1, 1,
-0.1671345, 2.54515, -0.1741225, 1, 1, 1, 1, 1,
-0.1659159, -0.03591564, -3.053445, 1, 1, 1, 1, 1,
-0.1634697, -0.2783938, -1.004691, 1, 1, 1, 1, 1,
-0.1628242, 0.4777251, 0.6143455, 1, 1, 1, 1, 1,
-0.1575252, 0.384826, 0.9315237, 1, 1, 1, 1, 1,
-0.1558826, -0.9781626, -1.461888, 1, 1, 1, 1, 1,
-0.1558799, -0.7902117, -2.07735, 1, 1, 1, 1, 1,
-0.1545814, 0.3801634, -1.133038, 1, 1, 1, 1, 1,
-0.1530005, -0.5618743, -2.591181, 1, 1, 1, 1, 1,
-0.1525804, -1.049577, -3.811269, 1, 1, 1, 1, 1,
-0.150277, -1.628945, -2.474582, 1, 1, 1, 1, 1,
-0.1419434, 1.036712, 0.3484043, 1, 1, 1, 1, 1,
-0.1384334, 0.5298668, 0.4993598, 0, 0, 1, 1, 1,
-0.1379783, -0.4185133, -2.481183, 1, 0, 0, 1, 1,
-0.137248, -0.259046, -2.45179, 1, 0, 0, 1, 1,
-0.1369379, -1.610105, -4.526381, 1, 0, 0, 1, 1,
-0.1367218, -2.224267, -3.624718, 1, 0, 0, 1, 1,
-0.1348068, 0.2922445, -2.485667, 1, 0, 0, 1, 1,
-0.1337838, -1.332287, -2.388187, 0, 0, 0, 1, 1,
-0.1335555, -0.6162739, -3.943245, 0, 0, 0, 1, 1,
-0.1327337, -0.6670681, -3.125319, 0, 0, 0, 1, 1,
-0.1303059, 0.2819841, -0.7059691, 0, 0, 0, 1, 1,
-0.1250874, -0.2769036, -2.052319, 0, 0, 0, 1, 1,
-0.1237732, -1.202105, -3.682521, 0, 0, 0, 1, 1,
-0.1213102, -1.073777, -3.209857, 0, 0, 0, 1, 1,
-0.1193254, 0.9243622, 1.033135, 1, 1, 1, 1, 1,
-0.1167814, 0.02627457, -1.758021, 1, 1, 1, 1, 1,
-0.1162617, -0.6545002, -2.601115, 1, 1, 1, 1, 1,
-0.1157815, -0.3344024, -2.090086, 1, 1, 1, 1, 1,
-0.1104997, 1.21038, 1.005855, 1, 1, 1, 1, 1,
-0.1103636, -1.067674, -2.634248, 1, 1, 1, 1, 1,
-0.1102535, 0.8055784, 1.105653, 1, 1, 1, 1, 1,
-0.109818, -0.350374, -2.88286, 1, 1, 1, 1, 1,
-0.109, 1.261654, 0.006823129, 1, 1, 1, 1, 1,
-0.1040188, 0.4507301, -0.2800271, 1, 1, 1, 1, 1,
-0.1020789, 0.03531013, -1.527133, 1, 1, 1, 1, 1,
-0.09875434, 0.8895296, -0.9299343, 1, 1, 1, 1, 1,
-0.09510173, 0.6703152, 0.6677341, 1, 1, 1, 1, 1,
-0.08986107, 0.6629305, 0.1298463, 1, 1, 1, 1, 1,
-0.08864963, 1.578085, -0.9231691, 1, 1, 1, 1, 1,
-0.08740844, 1.150321, -0.4063846, 0, 0, 1, 1, 1,
-0.08679695, 0.3559025, 2.902399, 1, 0, 0, 1, 1,
-0.08249927, -0.5218247, -2.474016, 1, 0, 0, 1, 1,
-0.08073249, 0.8549125, -0.6924744, 1, 0, 0, 1, 1,
-0.07915285, -0.9325512, -2.648938, 1, 0, 0, 1, 1,
-0.07709972, -0.7501078, -3.756181, 1, 0, 0, 1, 1,
-0.07098415, 0.2402604, -1.948874, 0, 0, 0, 1, 1,
-0.0694679, 0.7590117, -0.6065323, 0, 0, 0, 1, 1,
-0.06872479, -1.894683, -4.33479, 0, 0, 0, 1, 1,
-0.06814575, -0.8339311, -3.25669, 0, 0, 0, 1, 1,
-0.06455129, -2.069901, -4.324518, 0, 0, 0, 1, 1,
-0.05713985, 0.544297, 0.09449066, 0, 0, 0, 1, 1,
-0.05509595, 1.918384, -0.0405531, 0, 0, 0, 1, 1,
-0.05309721, -1.174746, -4.37034, 1, 1, 1, 1, 1,
-0.04976428, 0.3468186, -0.3789678, 1, 1, 1, 1, 1,
-0.04976289, 0.6122764, -0.01698437, 1, 1, 1, 1, 1,
-0.04625917, -0.2737355, -2.787215, 1, 1, 1, 1, 1,
-0.04011082, -0.1607632, -2.274147, 1, 1, 1, 1, 1,
-0.03882169, -0.5063212, -3.543679, 1, 1, 1, 1, 1,
-0.03859324, 0.4393864, 0.8670895, 1, 1, 1, 1, 1,
-0.0375075, -0.1536209, -2.291054, 1, 1, 1, 1, 1,
-0.03694246, -0.1015058, -3.329632, 1, 1, 1, 1, 1,
-0.03522325, 1.188585, -0.2118578, 1, 1, 1, 1, 1,
-0.03429024, -0.579643, -2.201681, 1, 1, 1, 1, 1,
-0.03378958, 0.6414065, 0.1357137, 1, 1, 1, 1, 1,
-0.02997219, -0.2354583, -3.384031, 1, 1, 1, 1, 1,
-0.02856003, 0.431748, -0.1676596, 1, 1, 1, 1, 1,
-0.02616225, 0.9807718, -2.142265, 1, 1, 1, 1, 1,
-0.02176218, -0.4789844, -3.26006, 0, 0, 1, 1, 1,
-0.01476004, 0.4579798, 1.009768, 1, 0, 0, 1, 1,
-0.01232518, -1.650462, -3.878749, 1, 0, 0, 1, 1,
-0.01030735, -1.114433, -3.574902, 1, 0, 0, 1, 1,
-0.009875763, 0.3670766, -0.1232347, 1, 0, 0, 1, 1,
-0.008732161, -0.3553121, -2.960557, 1, 0, 0, 1, 1,
-0.00740261, -0.3609902, -3.286098, 0, 0, 0, 1, 1,
-0.002608396, 2.444941, -0.418047, 0, 0, 0, 1, 1,
-0.001149714, -3.02367, -5.512467, 0, 0, 0, 1, 1,
0.003199875, -1.52628, 2.153009, 0, 0, 0, 1, 1,
0.00390553, -0.9625139, 1.810826, 0, 0, 0, 1, 1,
0.005701659, -0.7440833, 5.088725, 0, 0, 0, 1, 1,
0.007802116, 0.7159717, 1.915823, 0, 0, 0, 1, 1,
0.009781444, -0.9766722, 3.582339, 1, 1, 1, 1, 1,
0.01107385, 0.4409887, -0.6385125, 1, 1, 1, 1, 1,
0.01365482, 0.7141552, -3.142022, 1, 1, 1, 1, 1,
0.01388003, -1.259112, 2.752002, 1, 1, 1, 1, 1,
0.01432963, -0.9308162, 1.821915, 1, 1, 1, 1, 1,
0.01903204, -0.6295044, 3.705553, 1, 1, 1, 1, 1,
0.02643886, 0.8904338, 1.000701, 1, 1, 1, 1, 1,
0.02679162, -1.212485, 4.185726, 1, 1, 1, 1, 1,
0.02752425, 0.3923762, -1.695232, 1, 1, 1, 1, 1,
0.02971755, -0.7198271, 3.305179, 1, 1, 1, 1, 1,
0.03047803, -0.3469328, 3.08843, 1, 1, 1, 1, 1,
0.03316485, 0.06210128, 0.3856106, 1, 1, 1, 1, 1,
0.0372893, 1.071809, 0.3568982, 1, 1, 1, 1, 1,
0.04499955, -1.273691, 3.240312, 1, 1, 1, 1, 1,
0.04537556, 0.2384854, 0.6999946, 1, 1, 1, 1, 1,
0.04730381, 0.9754016, 0.1384331, 0, 0, 1, 1, 1,
0.04861243, 0.8763933, -1.440938, 1, 0, 0, 1, 1,
0.0503561, 0.142928, 0.7355645, 1, 0, 0, 1, 1,
0.05388041, 0.6227764, 0.3023809, 1, 0, 0, 1, 1,
0.0613759, -1.13904, 4.217805, 1, 0, 0, 1, 1,
0.06338216, 1.987381, -0.450806, 1, 0, 0, 1, 1,
0.06890052, -0.1877308, 3.395986, 0, 0, 0, 1, 1,
0.07332519, 3.033421, 0.08694702, 0, 0, 0, 1, 1,
0.07888879, 0.4190769, -0.5253583, 0, 0, 0, 1, 1,
0.08037051, -0.2419523, 4.46563, 0, 0, 0, 1, 1,
0.08053203, -0.506295, 1.694273, 0, 0, 0, 1, 1,
0.08061825, 0.6286382, 0.9968386, 0, 0, 0, 1, 1,
0.08090141, -0.2713102, 1.803995, 0, 0, 0, 1, 1,
0.08110666, -1.885965, 3.346112, 1, 1, 1, 1, 1,
0.08290129, -0.4608905, 3.680302, 1, 1, 1, 1, 1,
0.08510147, 0.5261381, 1.33159, 1, 1, 1, 1, 1,
0.08706119, -1.999545, 2.463775, 1, 1, 1, 1, 1,
0.09063688, 0.4445785, 0.8189479, 1, 1, 1, 1, 1,
0.09182949, 1.584394, -0.1415057, 1, 1, 1, 1, 1,
0.09323558, 0.9925544, -0.9843403, 1, 1, 1, 1, 1,
0.09402997, 0.03622817, 0.6474562, 1, 1, 1, 1, 1,
0.09471361, -0.1980996, 2.916992, 1, 1, 1, 1, 1,
0.09627714, -0.3138994, 1.350808, 1, 1, 1, 1, 1,
0.09689999, -0.1257676, 3.370766, 1, 1, 1, 1, 1,
0.09737786, -0.01983789, 2.092842, 1, 1, 1, 1, 1,
0.1016173, 0.9812782, -0.2711048, 1, 1, 1, 1, 1,
0.104314, -0.4950298, 1.433998, 1, 1, 1, 1, 1,
0.1055819, 0.1173912, 0.5905791, 1, 1, 1, 1, 1,
0.1064047, 0.6038312, 1.060045, 0, 0, 1, 1, 1,
0.1121877, 1.166062, 0.7670847, 1, 0, 0, 1, 1,
0.1135256, 1.133758, 0.7755405, 1, 0, 0, 1, 1,
0.1194555, 1.544895, 0.5441609, 1, 0, 0, 1, 1,
0.1203396, 0.9745115, 0.6247628, 1, 0, 0, 1, 1,
0.1259087, -1.729617, 1.418286, 1, 0, 0, 1, 1,
0.1266816, -1.705556, 4.999496, 0, 0, 0, 1, 1,
0.1303586, 0.7654063, 1.192343, 0, 0, 0, 1, 1,
0.132078, 2.648734, 0.5650382, 0, 0, 0, 1, 1,
0.1333398, 0.8389874, -0.3842497, 0, 0, 0, 1, 1,
0.1346135, -1.657807, 3.869104, 0, 0, 0, 1, 1,
0.1357629, 0.1715515, 1.606522, 0, 0, 0, 1, 1,
0.1398099, 0.5764646, 1.416862, 0, 0, 0, 1, 1,
0.1399879, -0.1469297, 3.150798, 1, 1, 1, 1, 1,
0.1436774, 0.6536674, -1.855314, 1, 1, 1, 1, 1,
0.1442695, -2.03114, 3.347409, 1, 1, 1, 1, 1,
0.1443376, 0.370553, 1.697964, 1, 1, 1, 1, 1,
0.1469299, -0.5731686, 2.594375, 1, 1, 1, 1, 1,
0.1508192, 0.597618, 1.085248, 1, 1, 1, 1, 1,
0.1557711, -1.554049, 4.445477, 1, 1, 1, 1, 1,
0.1565205, -0.7123616, 3.101381, 1, 1, 1, 1, 1,
0.1590693, -1.411408, 3.488249, 1, 1, 1, 1, 1,
0.1619442, 0.4306296, -0.5036292, 1, 1, 1, 1, 1,
0.1655159, 0.9226665, 0.5767304, 1, 1, 1, 1, 1,
0.1688836, 0.1013652, 0.7794073, 1, 1, 1, 1, 1,
0.1737671, -1.267847, 2.557547, 1, 1, 1, 1, 1,
0.1827052, -0.06399854, 2.589832, 1, 1, 1, 1, 1,
0.1867203, 0.9715353, 0.4281035, 1, 1, 1, 1, 1,
0.1869706, 0.6049039, 1.497957, 0, 0, 1, 1, 1,
0.1882319, -0.7106588, 4.245995, 1, 0, 0, 1, 1,
0.1904878, 1.978852, 1.251627, 1, 0, 0, 1, 1,
0.1947013, 0.7806042, 1.197697, 1, 0, 0, 1, 1,
0.1988152, 0.9578253, -0.4135858, 1, 0, 0, 1, 1,
0.2000975, -0.6957383, 3.389892, 1, 0, 0, 1, 1,
0.2063382, -0.5243931, 1.6728, 0, 0, 0, 1, 1,
0.2108404, 0.211975, 0.2317366, 0, 0, 0, 1, 1,
0.2117137, -1.224456, 4.198649, 0, 0, 0, 1, 1,
0.2155305, 1.106729, 0.4025389, 0, 0, 0, 1, 1,
0.2157783, 1.256642, 2.30419, 0, 0, 0, 1, 1,
0.2160303, -0.1213303, 2.44168, 0, 0, 0, 1, 1,
0.2165291, -0.8182881, 3.097706, 0, 0, 0, 1, 1,
0.2232466, -0.3022347, 3.584201, 1, 1, 1, 1, 1,
0.2258599, -1.184446, 3.718524, 1, 1, 1, 1, 1,
0.2286348, -0.08629186, 3.301472, 1, 1, 1, 1, 1,
0.2332818, -0.8690414, 2.862981, 1, 1, 1, 1, 1,
0.2346779, 0.07382996, 0.3333715, 1, 1, 1, 1, 1,
0.2397478, -0.4677988, 4.94807, 1, 1, 1, 1, 1,
0.2397926, -1.312802, 4.020254, 1, 1, 1, 1, 1,
0.2403432, -1.963843, 2.529678, 1, 1, 1, 1, 1,
0.2421853, 1.416732, 1.533849, 1, 1, 1, 1, 1,
0.2434014, 0.6459733, -1.181797, 1, 1, 1, 1, 1,
0.2484599, -2.602479, 2.255821, 1, 1, 1, 1, 1,
0.2493737, 0.5643739, 0.3774756, 1, 1, 1, 1, 1,
0.2497016, 0.7766278, 1.015669, 1, 1, 1, 1, 1,
0.2497561, -1.026797, 4.228737, 1, 1, 1, 1, 1,
0.2603961, -0.7794917, 3.33872, 1, 1, 1, 1, 1,
0.2629512, 0.9070777, -0.3598174, 0, 0, 1, 1, 1,
0.263535, 1.938024, 0.9979164, 1, 0, 0, 1, 1,
0.2636518, 0.7467627, 2.050311, 1, 0, 0, 1, 1,
0.2713999, -1.526079, 3.483684, 1, 0, 0, 1, 1,
0.2719235, 1.114548, 0.6104073, 1, 0, 0, 1, 1,
0.2731352, -0.4663341, 1.18499, 1, 0, 0, 1, 1,
0.2745951, -1.682835, 3.725805, 0, 0, 0, 1, 1,
0.2764758, -0.003396706, 1.164953, 0, 0, 0, 1, 1,
0.279373, 2.939444, 1.286581, 0, 0, 0, 1, 1,
0.2801662, 1.436245, 0.234469, 0, 0, 0, 1, 1,
0.282269, 1.006111, -0.06349765, 0, 0, 0, 1, 1,
0.2827033, 0.27406, 0.198303, 0, 0, 0, 1, 1,
0.2860153, -0.4311706, 1.511408, 0, 0, 0, 1, 1,
0.2956672, -0.7641519, 1.559138, 1, 1, 1, 1, 1,
0.30153, 0.3905415, 1.121797, 1, 1, 1, 1, 1,
0.3050839, -0.5958028, 2.136375, 1, 1, 1, 1, 1,
0.3166835, 0.9920793, -0.7199782, 1, 1, 1, 1, 1,
0.3276012, 0.3144325, -0.1738856, 1, 1, 1, 1, 1,
0.3300901, 0.8166237, -0.600485, 1, 1, 1, 1, 1,
0.3314961, 0.4412732, -0.7051544, 1, 1, 1, 1, 1,
0.3327516, 2.981645, 0.9884729, 1, 1, 1, 1, 1,
0.3333347, -0.4151261, 3.49633, 1, 1, 1, 1, 1,
0.3403476, 1.752818, -0.7114637, 1, 1, 1, 1, 1,
0.3403739, -1.387635, 2.080429, 1, 1, 1, 1, 1,
0.3417558, 0.6691296, 0.6042186, 1, 1, 1, 1, 1,
0.3499884, -1.6978, 0.589672, 1, 1, 1, 1, 1,
0.3517916, -0.1172305, 1.073288, 1, 1, 1, 1, 1,
0.3556612, 1.343636, -0.04841585, 1, 1, 1, 1, 1,
0.3561054, 0.06129885, 0.8060421, 0, 0, 1, 1, 1,
0.3616045, 0.5980914, 0.7990486, 1, 0, 0, 1, 1,
0.3646685, 0.1191363, 2.305202, 1, 0, 0, 1, 1,
0.3661101, -0.7269418, 2.4631, 1, 0, 0, 1, 1,
0.3687316, -1.00307, 1.727503, 1, 0, 0, 1, 1,
0.3701222, -1.850642, 1.076967, 1, 0, 0, 1, 1,
0.3722838, 0.562145, 0.4049689, 0, 0, 0, 1, 1,
0.3744861, 0.306075, 1.076683, 0, 0, 0, 1, 1,
0.3753226, 0.2589687, 1.087607, 0, 0, 0, 1, 1,
0.3767322, 0.1393012, 2.791169, 0, 0, 0, 1, 1,
0.377858, 1.253833, 0.7089873, 0, 0, 0, 1, 1,
0.3805984, 0.2855624, 2.636672, 0, 0, 0, 1, 1,
0.3824415, 0.3011158, 0.3301698, 0, 0, 0, 1, 1,
0.3828994, 0.04199018, 1.16026, 1, 1, 1, 1, 1,
0.3841204, -1.518425, 0.7804264, 1, 1, 1, 1, 1,
0.3843793, -0.6752996, 3.160539, 1, 1, 1, 1, 1,
0.3845827, 0.4051349, -0.2703835, 1, 1, 1, 1, 1,
0.3847113, -0.375988, 4.65817, 1, 1, 1, 1, 1,
0.3856572, -0.6376576, 4.051024, 1, 1, 1, 1, 1,
0.3891046, -0.7927585, 3.013252, 1, 1, 1, 1, 1,
0.3903798, 0.1531156, 1.045698, 1, 1, 1, 1, 1,
0.3912761, 1.833538, 1.316786, 1, 1, 1, 1, 1,
0.3913341, 0.9012077, 2.594212, 1, 1, 1, 1, 1,
0.3920531, -0.6629957, 0.7262332, 1, 1, 1, 1, 1,
0.395792, -0.3630574, 2.852854, 1, 1, 1, 1, 1,
0.3999933, 1.334101, -1.593168, 1, 1, 1, 1, 1,
0.4001171, -0.6608028, 2.213817, 1, 1, 1, 1, 1,
0.4003927, 1.227855, -0.7609074, 1, 1, 1, 1, 1,
0.4139492, -1.7543, 2.397936, 0, 0, 1, 1, 1,
0.4173126, 2.012829, 0.6111105, 1, 0, 0, 1, 1,
0.4193304, 1.911421, 0.09303529, 1, 0, 0, 1, 1,
0.4211272, -0.7433737, 3.245029, 1, 0, 0, 1, 1,
0.4265468, 1.319271, 0.5219804, 1, 0, 0, 1, 1,
0.4293723, 0.1558942, 1.997382, 1, 0, 0, 1, 1,
0.4376934, -0.0203098, -0.7285308, 0, 0, 0, 1, 1,
0.4402572, -0.4787343, 1.358922, 0, 0, 0, 1, 1,
0.4417545, -1.811207, 0.9847252, 0, 0, 0, 1, 1,
0.4486426, -0.8354775, 2.074809, 0, 0, 0, 1, 1,
0.4520801, 1.158642, 1.288723, 0, 0, 0, 1, 1,
0.4551073, 0.5152829, 2.212021, 0, 0, 0, 1, 1,
0.4567327, 1.016619, 1.544927, 0, 0, 0, 1, 1,
0.4574766, -1.503341, 3.93298, 1, 1, 1, 1, 1,
0.4580086, 0.9928055, 0.8747644, 1, 1, 1, 1, 1,
0.4605911, 1.353649, 0.8378268, 1, 1, 1, 1, 1,
0.4617319, -1.12871, 5.147705, 1, 1, 1, 1, 1,
0.462197, 1.194057, 0.4655045, 1, 1, 1, 1, 1,
0.4622266, 0.8265036, 2.084605, 1, 1, 1, 1, 1,
0.4634153, -1.198102, 2.767847, 1, 1, 1, 1, 1,
0.465256, 0.8119135, -0.8630931, 1, 1, 1, 1, 1,
0.4717254, -0.5626084, 2.4813, 1, 1, 1, 1, 1,
0.4738413, 1.406986, 0.922689, 1, 1, 1, 1, 1,
0.4746135, 1.22937, 0.9696647, 1, 1, 1, 1, 1,
0.4755735, -0.1081653, 1.278876, 1, 1, 1, 1, 1,
0.4758148, 1.171729, 1.539343, 1, 1, 1, 1, 1,
0.4761668, -0.5696163, 2.825251, 1, 1, 1, 1, 1,
0.4774157, 1.737683, 1.413313, 1, 1, 1, 1, 1,
0.4801915, -1.444338, 3.352628, 0, 0, 1, 1, 1,
0.4818227, -0.1120965, 2.53888, 1, 0, 0, 1, 1,
0.4860877, 0.6517609, -0.7897102, 1, 0, 0, 1, 1,
0.4886122, 0.365548, 2.739417, 1, 0, 0, 1, 1,
0.4963312, 1.075965, 0.9546472, 1, 0, 0, 1, 1,
0.4991654, 0.5625474, 1.369489, 1, 0, 0, 1, 1,
0.4997373, 1.316509, -1.822679, 0, 0, 0, 1, 1,
0.5008634, -1.212094, 1.430237, 0, 0, 0, 1, 1,
0.5051432, 1.27818, -1.081727, 0, 0, 0, 1, 1,
0.515443, -0.2598825, 0.7433094, 0, 0, 0, 1, 1,
0.5159631, 0.2054676, -0.1975625, 0, 0, 0, 1, 1,
0.5171931, -0.2963535, 3.021112, 0, 0, 0, 1, 1,
0.5206465, -0.03428375, 0.2983158, 0, 0, 0, 1, 1,
0.5207394, -1.793977, 4.01635, 1, 1, 1, 1, 1,
0.5233633, 1.109356, 0.9602391, 1, 1, 1, 1, 1,
0.526695, 0.5032504, 0.1113242, 1, 1, 1, 1, 1,
0.5283143, -0.5388011, 2.878474, 1, 1, 1, 1, 1,
0.5328194, 1.0512, -1.52313, 1, 1, 1, 1, 1,
0.534726, -1.763757, 3.035565, 1, 1, 1, 1, 1,
0.5356477, 1.066991, 0.8944218, 1, 1, 1, 1, 1,
0.5393053, 0.1092213, 4.017549, 1, 1, 1, 1, 1,
0.5411837, 1.407075, 0.4797369, 1, 1, 1, 1, 1,
0.5434606, -1.011256, 2.448224, 1, 1, 1, 1, 1,
0.5529116, -0.1930393, 2.015067, 1, 1, 1, 1, 1,
0.5595266, -0.2798918, 3.39705, 1, 1, 1, 1, 1,
0.5627017, -1.130382, 2.085439, 1, 1, 1, 1, 1,
0.5633317, -1.556062, 2.393267, 1, 1, 1, 1, 1,
0.5674103, 1.037005, -0.6064255, 1, 1, 1, 1, 1,
0.5732567, 0.2868211, -1.053304, 0, 0, 1, 1, 1,
0.5738865, 0.4727174, 0.6422588, 1, 0, 0, 1, 1,
0.5761359, -0.8476995, 2.648126, 1, 0, 0, 1, 1,
0.5765562, 0.6007094, -0.9585977, 1, 0, 0, 1, 1,
0.5825701, -1.210676, 3.760485, 1, 0, 0, 1, 1,
0.5887186, -0.3189715, 2.394559, 1, 0, 0, 1, 1,
0.5913907, 0.1297488, 2.095312, 0, 0, 0, 1, 1,
0.5925999, -0.6396351, 1.560638, 0, 0, 0, 1, 1,
0.5931839, 0.2665793, 0.1924225, 0, 0, 0, 1, 1,
0.5932218, 0.769859, -0.2543959, 0, 0, 0, 1, 1,
0.5964558, -0.4361957, 1.587987, 0, 0, 0, 1, 1,
0.599169, 0.1451339, 1.584865, 0, 0, 0, 1, 1,
0.6005931, -0.4309612, 1.460789, 0, 0, 0, 1, 1,
0.6025785, 0.5992779, 0.1799481, 1, 1, 1, 1, 1,
0.6069033, -0.3371333, 2.566426, 1, 1, 1, 1, 1,
0.613049, -1.265961, 1.926773, 1, 1, 1, 1, 1,
0.6244719, 0.4186019, -0.2738827, 1, 1, 1, 1, 1,
0.6248858, 0.07117454, 1.974175, 1, 1, 1, 1, 1,
0.6249543, 0.1517977, 0.3916675, 1, 1, 1, 1, 1,
0.6259365, -0.9362844, 1.844269, 1, 1, 1, 1, 1,
0.6261527, -0.3050227, 1.604834, 1, 1, 1, 1, 1,
0.6272165, 0.623045, -0.3408639, 1, 1, 1, 1, 1,
0.6275731, -0.9490689, 2.194946, 1, 1, 1, 1, 1,
0.6339916, -0.02749249, 1.374743, 1, 1, 1, 1, 1,
0.6351313, -0.8101919, 3.009496, 1, 1, 1, 1, 1,
0.636489, -0.6930746, 1.866832, 1, 1, 1, 1, 1,
0.6431555, -0.03541911, 2.551245, 1, 1, 1, 1, 1,
0.6439165, -0.569214, 2.02245, 1, 1, 1, 1, 1,
0.6450323, -1.773811, 3.032213, 0, 0, 1, 1, 1,
0.6561303, -0.9960022, 3.684879, 1, 0, 0, 1, 1,
0.6572505, 0.01446757, 1.684051, 1, 0, 0, 1, 1,
0.6582928, -2.185016, 2.438603, 1, 0, 0, 1, 1,
0.6593052, -0.9720693, 2.598486, 1, 0, 0, 1, 1,
0.6619728, 0.2526816, 1.332585, 1, 0, 0, 1, 1,
0.6644832, 1.089204, 0.7856864, 0, 0, 0, 1, 1,
0.6771241, 1.482246, -0.9636061, 0, 0, 0, 1, 1,
0.6804234, 0.05678462, 2.120356, 0, 0, 0, 1, 1,
0.6824459, -0.2214255, 0.07653107, 0, 0, 0, 1, 1,
0.6926602, -0.235069, 1.010127, 0, 0, 0, 1, 1,
0.6940911, 1.475856, -0.9313442, 0, 0, 0, 1, 1,
0.6941339, -0.977514, 2.224683, 0, 0, 0, 1, 1,
0.6956619, -0.4824451, 1.586065, 1, 1, 1, 1, 1,
0.6977552, -0.09372482, 2.298181, 1, 1, 1, 1, 1,
0.6995941, -0.08866589, 2.619834, 1, 1, 1, 1, 1,
0.7005797, -0.1315814, 1.650997, 1, 1, 1, 1, 1,
0.7033172, 0.8344095, -1.332037, 1, 1, 1, 1, 1,
0.7046368, 0.07598923, 2.015538, 1, 1, 1, 1, 1,
0.7080806, -0.7962303, 2.517368, 1, 1, 1, 1, 1,
0.7097875, -0.5060099, 0.8383521, 1, 1, 1, 1, 1,
0.7119126, 0.5309412, -0.28053, 1, 1, 1, 1, 1,
0.7148887, 1.495215, -2.038714, 1, 1, 1, 1, 1,
0.7239873, 0.8527138, -0.06101908, 1, 1, 1, 1, 1,
0.7273962, 0.1252234, 2.22923, 1, 1, 1, 1, 1,
0.7303751, 0.7456176, 1.619476, 1, 1, 1, 1, 1,
0.7312788, -0.1017944, 1.448737, 1, 1, 1, 1, 1,
0.7372401, -0.2537663, 0.0511531, 1, 1, 1, 1, 1,
0.7427153, -0.7939547, 2.768919, 0, 0, 1, 1, 1,
0.7438428, -0.07829084, 0.7953014, 1, 0, 0, 1, 1,
0.7548833, 0.06010414, 1.41415, 1, 0, 0, 1, 1,
0.7565227, -0.07692067, 0.4204504, 1, 0, 0, 1, 1,
0.759006, 0.3285405, 0.08300505, 1, 0, 0, 1, 1,
0.7607967, 0.6446636, 0.4327525, 1, 0, 0, 1, 1,
0.7659875, -0.4271501, 1.537433, 0, 0, 0, 1, 1,
0.7667307, 0.5911624, 0.5453879, 0, 0, 0, 1, 1,
0.7770771, 1.284217, 1.056945, 0, 0, 0, 1, 1,
0.7781742, 0.2014723, 1.507138, 0, 0, 0, 1, 1,
0.7783942, 0.2870099, 0.1657085, 0, 0, 0, 1, 1,
0.7860235, -1.993001, 3.838419, 0, 0, 0, 1, 1,
0.788076, 0.9991211, -0.7254598, 0, 0, 0, 1, 1,
0.7947599, -0.6081257, 2.414175, 1, 1, 1, 1, 1,
0.7955537, 0.580027, 0.7387765, 1, 1, 1, 1, 1,
0.8103006, -1.631318, 3.889054, 1, 1, 1, 1, 1,
0.8205063, -0.5983775, 1.117888, 1, 1, 1, 1, 1,
0.8232471, -2.957155, 3.401517, 1, 1, 1, 1, 1,
0.8295057, 0.7952365, 0.7432091, 1, 1, 1, 1, 1,
0.8296376, 1.705562, 1.652401, 1, 1, 1, 1, 1,
0.8304766, -0.9356834, 3.141407, 1, 1, 1, 1, 1,
0.8401479, 0.3581512, -0.1623545, 1, 1, 1, 1, 1,
0.8422382, 1.472996, 0.05086835, 1, 1, 1, 1, 1,
0.854415, 1.3328, 2.081158, 1, 1, 1, 1, 1,
0.8632213, 0.007144577, 1.577007, 1, 1, 1, 1, 1,
0.8634942, -0.9568619, 2.142574, 1, 1, 1, 1, 1,
0.8643044, 1.62666, 0.4303541, 1, 1, 1, 1, 1,
0.8660547, -0.07531785, 0.6087856, 1, 1, 1, 1, 1,
0.8680493, 1.447098, -0.940073, 0, 0, 1, 1, 1,
0.8787862, -0.8314562, 0.5762438, 1, 0, 0, 1, 1,
0.8807831, 0.3599862, 1.498665, 1, 0, 0, 1, 1,
0.8897886, -0.4567856, 2.002497, 1, 0, 0, 1, 1,
0.8932846, 0.02011707, 1.090816, 1, 0, 0, 1, 1,
0.8938733, 1.088344, -0.3243662, 1, 0, 0, 1, 1,
0.9056995, 0.1343827, -0.0422741, 0, 0, 0, 1, 1,
0.90837, 0.6001592, -0.3203896, 0, 0, 0, 1, 1,
0.9132451, 0.4473642, 0.7717009, 0, 0, 0, 1, 1,
0.9178326, -1.444829, 2.03321, 0, 0, 0, 1, 1,
0.918469, 0.8637741, 1.230316, 0, 0, 0, 1, 1,
0.9200408, 0.8393476, 1.560979, 0, 0, 0, 1, 1,
0.924014, 0.3885807, 2.245719, 0, 0, 0, 1, 1,
0.9276748, -1.522812, 4.020465, 1, 1, 1, 1, 1,
0.9321231, -1.063864, 4.287959, 1, 1, 1, 1, 1,
0.932786, 0.7825941, -0.5333707, 1, 1, 1, 1, 1,
0.9368498, 0.4548052, 1.072099, 1, 1, 1, 1, 1,
0.939702, 1.042357, 0.8877843, 1, 1, 1, 1, 1,
0.9405189, -0.2543372, 1.528827, 1, 1, 1, 1, 1,
0.9412259, -0.7580225, 3.275742, 1, 1, 1, 1, 1,
0.9551351, -0.01120041, 0.9968216, 1, 1, 1, 1, 1,
0.9564811, -0.7826264, 3.032367, 1, 1, 1, 1, 1,
0.95836, 0.2956439, 2.336854, 1, 1, 1, 1, 1,
0.960953, -0.2863583, 2.772068, 1, 1, 1, 1, 1,
0.9621472, -0.3236549, 2.498114, 1, 1, 1, 1, 1,
0.9630467, -0.8210978, 3.187364, 1, 1, 1, 1, 1,
0.9734921, -0.7668794, 2.102028, 1, 1, 1, 1, 1,
0.9755808, -0.1347372, 0.6407076, 1, 1, 1, 1, 1,
0.9819984, 0.6666099, 3.362979, 0, 0, 1, 1, 1,
0.9881732, -1.537524, 3.192128, 1, 0, 0, 1, 1,
0.9997893, -1.387278, 4.081017, 1, 0, 0, 1, 1,
1.004511, 0.5666233, 2.914359, 1, 0, 0, 1, 1,
1.004562, -0.09098455, 1.052337, 1, 0, 0, 1, 1,
1.017149, 0.7095466, 0.02484312, 1, 0, 0, 1, 1,
1.021645, -0.5729092, 2.715522, 0, 0, 0, 1, 1,
1.022232, 0.4831258, 1.791747, 0, 0, 0, 1, 1,
1.026355, -0.02557841, 2.527073, 0, 0, 0, 1, 1,
1.039057, -0.4565468, 2.998903, 0, 0, 0, 1, 1,
1.03958, 0.8813886, 3.282701, 0, 0, 0, 1, 1,
1.04064, 1.135882, 3.455865, 0, 0, 0, 1, 1,
1.047814, 0.4031688, 1.362678, 0, 0, 0, 1, 1,
1.054159, 2.355509, -0.8167132, 1, 1, 1, 1, 1,
1.054599, 0.8094505, 0.2525667, 1, 1, 1, 1, 1,
1.059753, -0.7397103, 2.23681, 1, 1, 1, 1, 1,
1.066554, -0.5828492, 2.622636, 1, 1, 1, 1, 1,
1.06784, -0.4989732, 2.867961, 1, 1, 1, 1, 1,
1.069269, 0.08948617, 2.344861, 1, 1, 1, 1, 1,
1.074841, 0.2824434, 1.674287, 1, 1, 1, 1, 1,
1.080983, 1.030969, 1.021339, 1, 1, 1, 1, 1,
1.085401, -0.9477386, 1.468567, 1, 1, 1, 1, 1,
1.088496, -0.08163666, 1.62529, 1, 1, 1, 1, 1,
1.092828, -0.03714937, 1.348397, 1, 1, 1, 1, 1,
1.098846, -1.893945, 3.661175, 1, 1, 1, 1, 1,
1.101581, 1.312764, 0.2610363, 1, 1, 1, 1, 1,
1.104961, 0.6725593, -0.055883, 1, 1, 1, 1, 1,
1.107949, -2.199442, 2.899481, 1, 1, 1, 1, 1,
1.110288, -1.186907, 2.427449, 0, 0, 1, 1, 1,
1.12371, 0.03463355, 0.8987097, 1, 0, 0, 1, 1,
1.124568, 1.677877, -1.307682, 1, 0, 0, 1, 1,
1.132951, -0.1167505, 1.255418, 1, 0, 0, 1, 1,
1.137275, 0.03418226, 3.227074, 1, 0, 0, 1, 1,
1.145539, -0.7338837, 2.295462, 1, 0, 0, 1, 1,
1.153763, -0.9712416, 2.833274, 0, 0, 0, 1, 1,
1.158569, 1.046073, 0.2508608, 0, 0, 0, 1, 1,
1.165124, -1.796318, 2.548247, 0, 0, 0, 1, 1,
1.170381, 0.5122334, 1.466147, 0, 0, 0, 1, 1,
1.175918, 0.6594557, 2.074661, 0, 0, 0, 1, 1,
1.181487, 1.3963, 1.406289, 0, 0, 0, 1, 1,
1.181808, -0.3939896, 2.87688, 0, 0, 0, 1, 1,
1.191468, 0.841592, 2.486016, 1, 1, 1, 1, 1,
1.214093, -0.6516294, 3.864693, 1, 1, 1, 1, 1,
1.223758, -1.599665, 1.818519, 1, 1, 1, 1, 1,
1.245023, -0.4313001, 0.6155783, 1, 1, 1, 1, 1,
1.246588, 0.3599552, 1.20309, 1, 1, 1, 1, 1,
1.260304, -0.3872024, 2.840691, 1, 1, 1, 1, 1,
1.266743, 0.991244, -0.8198492, 1, 1, 1, 1, 1,
1.267766, -2.422231, 2.217838, 1, 1, 1, 1, 1,
1.269449, 0.3075095, 1.076359, 1, 1, 1, 1, 1,
1.279104, -1.414893, 1.056496, 1, 1, 1, 1, 1,
1.290505, -0.1528163, 2.886903, 1, 1, 1, 1, 1,
1.294336, -1.653977, 1.774255, 1, 1, 1, 1, 1,
1.297232, 0.5246887, 1.289861, 1, 1, 1, 1, 1,
1.299659, 0.5180382, 1.97641, 1, 1, 1, 1, 1,
1.299705, -1.081979, 2.20814, 1, 1, 1, 1, 1,
1.301475, -0.8014068, 2.853563, 0, 0, 1, 1, 1,
1.302145, 1.279209, -0.9534168, 1, 0, 0, 1, 1,
1.304123, -0.8652116, 3.275538, 1, 0, 0, 1, 1,
1.305587, 0.5386052, 2.493307, 1, 0, 0, 1, 1,
1.307916, -0.4003396, 0.1965371, 1, 0, 0, 1, 1,
1.314242, 0.4838566, 1.117541, 1, 0, 0, 1, 1,
1.32763, -2.101698, 3.057074, 0, 0, 0, 1, 1,
1.327968, -0.6478766, 0.5295916, 0, 0, 0, 1, 1,
1.329274, -1.186769, 3.479237, 0, 0, 0, 1, 1,
1.344851, -0.7953938, 3.305512, 0, 0, 0, 1, 1,
1.349423, -0.4068711, 2.372823, 0, 0, 0, 1, 1,
1.353272, -1.990898, 3.051069, 0, 0, 0, 1, 1,
1.362024, 0.2910609, 2.048096, 0, 0, 0, 1, 1,
1.363834, 0.6976699, 0.7284438, 1, 1, 1, 1, 1,
1.368444, 0.7475956, 1.733518, 1, 1, 1, 1, 1,
1.370193, 0.2771617, 1.104298, 1, 1, 1, 1, 1,
1.372544, -0.1834525, 1.581492, 1, 1, 1, 1, 1,
1.37543, 1.697868, 0.0006714793, 1, 1, 1, 1, 1,
1.381673, 0.9731027, 0.7335507, 1, 1, 1, 1, 1,
1.384409, -0.2703505, 2.20966, 1, 1, 1, 1, 1,
1.404302, 0.308639, -0.4526818, 1, 1, 1, 1, 1,
1.409662, -0.03058958, 0.386584, 1, 1, 1, 1, 1,
1.413217, 0.7254022, 1.678543, 1, 1, 1, 1, 1,
1.41729, -0.7197486, 3.376208, 1, 1, 1, 1, 1,
1.418901, 0.8080392, 0.7671905, 1, 1, 1, 1, 1,
1.419464, 0.8338664, 1.238527, 1, 1, 1, 1, 1,
1.421656, 0.6151999, -0.1279874, 1, 1, 1, 1, 1,
1.427065, 0.7693579, -0.3950517, 1, 1, 1, 1, 1,
1.429292, 1.308907, -0.7773693, 0, 0, 1, 1, 1,
1.430063, -1.194865, 1.256853, 1, 0, 0, 1, 1,
1.431, 0.07317144, 0.4687875, 1, 0, 0, 1, 1,
1.431355, 0.8894041, 0.19899, 1, 0, 0, 1, 1,
1.432593, 2.244306, 0.2485233, 1, 0, 0, 1, 1,
1.43271, -2.386537, 4.095083, 1, 0, 0, 1, 1,
1.436708, -0.4939167, 2.628592, 0, 0, 0, 1, 1,
1.442571, 0.3622268, 1.206975, 0, 0, 0, 1, 1,
1.449127, -0.7776374, 0.9277382, 0, 0, 0, 1, 1,
1.462971, 1.460807, -0.3778632, 0, 0, 0, 1, 1,
1.465052, -1.017783, 1.848493, 0, 0, 0, 1, 1,
1.479901, 0.09792177, 1.995909, 0, 0, 0, 1, 1,
1.504537, -1.250305, 3.498491, 0, 0, 0, 1, 1,
1.506823, 0.267661, 0.6144877, 1, 1, 1, 1, 1,
1.521668, -0.4709271, 2.767031, 1, 1, 1, 1, 1,
1.567692, 1.121511, -1.170015, 1, 1, 1, 1, 1,
1.576467, -0.5623474, 1.424808, 1, 1, 1, 1, 1,
1.57779, 1.128075, 0.4146608, 1, 1, 1, 1, 1,
1.613618, -0.04154635, 2.529495, 1, 1, 1, 1, 1,
1.619177, 0.04987838, 2.072094, 1, 1, 1, 1, 1,
1.628755, 0.9650864, 2.463036, 1, 1, 1, 1, 1,
1.629777, -1.373639, 2.474064, 1, 1, 1, 1, 1,
1.635726, -1.069933, 0.5160532, 1, 1, 1, 1, 1,
1.637583, 0.4418692, 1.329037, 1, 1, 1, 1, 1,
1.644782, -0.1243382, 1.068129, 1, 1, 1, 1, 1,
1.660537, -2.4183, 3.762957, 1, 1, 1, 1, 1,
1.665122, 2.280345, 0.6253541, 1, 1, 1, 1, 1,
1.66992, -0.1841771, 3.126751, 1, 1, 1, 1, 1,
1.671972, -0.08182848, 0.822225, 0, 0, 1, 1, 1,
1.67212, -0.1198339, 2.184277, 1, 0, 0, 1, 1,
1.700529, -0.2317608, 2.366127, 1, 0, 0, 1, 1,
1.710478, -0.6408463, 3.37722, 1, 0, 0, 1, 1,
1.73545, 0.7644848, 0.2869852, 1, 0, 0, 1, 1,
1.754782, 1.025979, 0.6067024, 1, 0, 0, 1, 1,
1.758613, 0.5709374, 1.079604, 0, 0, 0, 1, 1,
1.766806, 0.8378485, 2.606572, 0, 0, 0, 1, 1,
1.786943, 0.353402, 2.037211, 0, 0, 0, 1, 1,
1.813066, -0.09160034, 2.742412, 0, 0, 0, 1, 1,
1.813539, -0.3787098, 2.094419, 0, 0, 0, 1, 1,
1.815816, 0.2951746, 0.1009068, 0, 0, 0, 1, 1,
1.819241, -0.7558903, 1.055845, 0, 0, 0, 1, 1,
1.828061, -0.9400216, 1.663675, 1, 1, 1, 1, 1,
1.835152, 0.9614004, 2.420078, 1, 1, 1, 1, 1,
1.836481, -0.1064464, 1.823021, 1, 1, 1, 1, 1,
1.851132, -1.990618, 2.080775, 1, 1, 1, 1, 1,
1.868476, 0.5994948, 1.673501, 1, 1, 1, 1, 1,
1.875532, -0.5810785, 1.664245, 1, 1, 1, 1, 1,
1.889296, -0.2873213, 0.7952113, 1, 1, 1, 1, 1,
1.899323, 0.1431843, 1.163087, 1, 1, 1, 1, 1,
1.915822, 0.4665035, 1.788793, 1, 1, 1, 1, 1,
1.936782, 0.6829734, 0.1048311, 1, 1, 1, 1, 1,
1.955355, 0.7368853, 0.9265546, 1, 1, 1, 1, 1,
1.96444, -1.545803, 2.204705, 1, 1, 1, 1, 1,
1.972718, 0.870009, 0.5913336, 1, 1, 1, 1, 1,
1.993562, -0.8854563, -0.07875277, 1, 1, 1, 1, 1,
2.011458, -0.3425542, 0.9715423, 1, 1, 1, 1, 1,
2.033967, -0.2243543, 0.804939, 0, 0, 1, 1, 1,
2.044442, 0.2722784, 2.368718, 1, 0, 0, 1, 1,
2.121094, -0.6543075, 0.7278166, 1, 0, 0, 1, 1,
2.179856, -0.5682377, 1.387391, 1, 0, 0, 1, 1,
2.209365, 0.7260774, 0.6754941, 1, 0, 0, 1, 1,
2.241404, -0.2531695, 1.150514, 1, 0, 0, 1, 1,
2.291213, -0.1068665, -1.956929, 0, 0, 0, 1, 1,
2.294624, 0.4151473, 0.3186283, 0, 0, 0, 1, 1,
2.298323, -0.6857403, 2.608327, 0, 0, 0, 1, 1,
2.3242, 0.5999528, 1.699764, 0, 0, 0, 1, 1,
2.364948, -1.545505, 2.68204, 0, 0, 0, 1, 1,
2.414467, -0.3366248, 1.940313, 0, 0, 0, 1, 1,
2.414503, 0.3003761, 0.3548995, 0, 0, 0, 1, 1,
2.609327, 0.2933545, 2.503802, 1, 1, 1, 1, 1,
2.675145, 0.1858817, 1.431573, 1, 1, 1, 1, 1,
2.730623, 0.06630709, 1.786223, 1, 1, 1, 1, 1,
2.844011, -0.8902698, 3.432864, 1, 1, 1, 1, 1,
2.936645, -0.3619727, 0.138253, 1, 1, 1, 1, 1,
3.14921, -1.255528, 1.302915, 1, 1, 1, 1, 1,
3.977257, -0.6456364, 0.919925, 1, 1, 1, 1, 1
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
var radius = 9.775397;
var distance = 34.33567;
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
mvMatrix.translate( -0.2949896, -0.09704018, 0.1823812 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.33567);
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
