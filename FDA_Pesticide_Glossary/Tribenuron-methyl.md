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
-3.323458, 0.644831, -1.397187, 1, 0, 0, 1,
-2.702667, -1.178105, -1.46968, 1, 0.007843138, 0, 1,
-2.63924, 0.4120599, -1.456427, 1, 0.01176471, 0, 1,
-2.590662, -1.062395, -2.741956, 1, 0.01960784, 0, 1,
-2.551193, -0.6877049, -1.763859, 1, 0.02352941, 0, 1,
-2.460931, 0.5464593, -1.753358, 1, 0.03137255, 0, 1,
-2.444908, -0.9903865, -1.700298, 1, 0.03529412, 0, 1,
-2.441817, 0.5836812, -1.131736, 1, 0.04313726, 0, 1,
-2.404305, 0.3196173, -2.778461, 1, 0.04705882, 0, 1,
-2.305465, 0.272351, -0.2544338, 1, 0.05490196, 0, 1,
-2.210869, 1.812573, -3.68867, 1, 0.05882353, 0, 1,
-2.196941, -0.483776, -1.9842, 1, 0.06666667, 0, 1,
-2.185726, 1.11644, -0.3103137, 1, 0.07058824, 0, 1,
-2.156052, -0.7551398, -2.556958, 1, 0.07843138, 0, 1,
-2.152627, 0.7642436, -2.120392, 1, 0.08235294, 0, 1,
-2.116548, 0.426263, -2.139782, 1, 0.09019608, 0, 1,
-2.110116, 0.2231294, -1.548088, 1, 0.09411765, 0, 1,
-2.108228, -2.048484, -0.8655812, 1, 0.1019608, 0, 1,
-2.088181, 0.1890363, -0.1973421, 1, 0.1098039, 0, 1,
-2.085427, 1.8967, 0.009663196, 1, 0.1137255, 0, 1,
-2.051169, -0.9422043, -1.01881, 1, 0.1215686, 0, 1,
-2.032828, -1.206457, -3.271658, 1, 0.1254902, 0, 1,
-2.010729, -0.3872864, -2.048187, 1, 0.1333333, 0, 1,
-1.9834, -1.19231, -1.197053, 1, 0.1372549, 0, 1,
-1.978062, -0.2225703, -0.5439423, 1, 0.145098, 0, 1,
-1.975969, -0.4371582, -0.1521074, 1, 0.1490196, 0, 1,
-1.938416, -1.66106, -2.413603, 1, 0.1568628, 0, 1,
-1.926908, -0.1294817, -1.395625, 1, 0.1607843, 0, 1,
-1.926908, -3.899483, -4.049918, 1, 0.1686275, 0, 1,
-1.900024, 3.016101, -2.165991, 1, 0.172549, 0, 1,
-1.87135, -0.3110785, -0.1086226, 1, 0.1803922, 0, 1,
-1.865186, -0.5274248, 0.4674816, 1, 0.1843137, 0, 1,
-1.838465, -0.02536557, -1.211977, 1, 0.1921569, 0, 1,
-1.834275, 1.440737, -2.252666, 1, 0.1960784, 0, 1,
-1.829779, -1.017498, -2.157777, 1, 0.2039216, 0, 1,
-1.825558, 1.563793, -0.05050695, 1, 0.2117647, 0, 1,
-1.824337, 0.6349483, -2.571529, 1, 0.2156863, 0, 1,
-1.823877, -1.756368, -1.925614, 1, 0.2235294, 0, 1,
-1.817866, 0.6645069, -1.818133, 1, 0.227451, 0, 1,
-1.792776, -0.4320721, -0.9333364, 1, 0.2352941, 0, 1,
-1.755789, -1.493557, -2.534554, 1, 0.2392157, 0, 1,
-1.745492, 0.159753, -2.483047, 1, 0.2470588, 0, 1,
-1.740861, -0.4525359, -0.4654254, 1, 0.2509804, 0, 1,
-1.736984, 1.295633, -0.2620428, 1, 0.2588235, 0, 1,
-1.711868, -1.122721, -1.652729, 1, 0.2627451, 0, 1,
-1.674516, -0.09012628, -2.70421, 1, 0.2705882, 0, 1,
-1.664701, -2.997857, -2.524075, 1, 0.2745098, 0, 1,
-1.649992, 0.8903384, -0.477319, 1, 0.282353, 0, 1,
-1.6468, -0.3471969, -1.553757, 1, 0.2862745, 0, 1,
-1.639727, 0.5508606, 0.2197159, 1, 0.2941177, 0, 1,
-1.627796, 1.45361, 0.1806826, 1, 0.3019608, 0, 1,
-1.618629, 1.372241, -1.44611, 1, 0.3058824, 0, 1,
-1.615721, 0.236692, -2.086281, 1, 0.3137255, 0, 1,
-1.61161, 1.079246, -1.167472, 1, 0.3176471, 0, 1,
-1.607082, -0.568814, -2.403929, 1, 0.3254902, 0, 1,
-1.605481, 0.3938738, 0.8166883, 1, 0.3294118, 0, 1,
-1.604233, -0.5347024, -1.613823, 1, 0.3372549, 0, 1,
-1.587863, -1.390967, -1.126106, 1, 0.3411765, 0, 1,
-1.586959, 2.144982, -0.130541, 1, 0.3490196, 0, 1,
-1.586861, -0.8760118, 0.1308748, 1, 0.3529412, 0, 1,
-1.58488, -1.080804, -0.7762743, 1, 0.3607843, 0, 1,
-1.575939, -1.710104, -3.0445, 1, 0.3647059, 0, 1,
-1.5667, -0.07985751, -1.09535, 1, 0.372549, 0, 1,
-1.553561, -0.8292122, -2.785953, 1, 0.3764706, 0, 1,
-1.543208, -0.03699991, -0.3484407, 1, 0.3843137, 0, 1,
-1.538943, -1.826223, -3.14695, 1, 0.3882353, 0, 1,
-1.537368, 1.967724, -1.455984, 1, 0.3960784, 0, 1,
-1.536597, 1.356675, -0.7863384, 1, 0.4039216, 0, 1,
-1.51744, 0.8700626, -0.659836, 1, 0.4078431, 0, 1,
-1.501301, -0.7590955, -2.571974, 1, 0.4156863, 0, 1,
-1.485142, 1.393086, -1.094707, 1, 0.4196078, 0, 1,
-1.478925, 1.208912, -1.46072, 1, 0.427451, 0, 1,
-1.470475, -0.756954, -1.133368, 1, 0.4313726, 0, 1,
-1.462629, 1.046083, -0.766371, 1, 0.4392157, 0, 1,
-1.447509, 2.497259, 0.6322113, 1, 0.4431373, 0, 1,
-1.433009, -0.04516369, -0.6156371, 1, 0.4509804, 0, 1,
-1.429106, -2.140656, -1.857148, 1, 0.454902, 0, 1,
-1.421041, -0.4694809, -0.7830777, 1, 0.4627451, 0, 1,
-1.416649, 0.134245, -2.321821, 1, 0.4666667, 0, 1,
-1.405644, 0.7160189, -0.9637768, 1, 0.4745098, 0, 1,
-1.385794, 0.8421837, -2.040008, 1, 0.4784314, 0, 1,
-1.383281, -0.609426, -2.197747, 1, 0.4862745, 0, 1,
-1.375867, 0.4676834, -1.089072, 1, 0.4901961, 0, 1,
-1.36985, -1.554203, -2.286743, 1, 0.4980392, 0, 1,
-1.362432, -1.635546, -3.522606, 1, 0.5058824, 0, 1,
-1.35693, 1.439378, -1.238402, 1, 0.509804, 0, 1,
-1.353101, -0.3994448, -1.207397, 1, 0.5176471, 0, 1,
-1.343616, -1.864823, -0.7563884, 1, 0.5215687, 0, 1,
-1.317172, -0.4244114, -1.37001, 1, 0.5294118, 0, 1,
-1.314324, 0.5987755, -0.7856088, 1, 0.5333334, 0, 1,
-1.314154, -0.9461987, -2.05954, 1, 0.5411765, 0, 1,
-1.311855, 0.521348, -1.245021, 1, 0.5450981, 0, 1,
-1.311815, -2.107668, -1.869047, 1, 0.5529412, 0, 1,
-1.309173, -0.8672406, -2.584036, 1, 0.5568628, 0, 1,
-1.306725, -0.8374804, -0.2150005, 1, 0.5647059, 0, 1,
-1.291958, 0.0849522, 0.202442, 1, 0.5686275, 0, 1,
-1.288308, -0.1509955, -1.072864, 1, 0.5764706, 0, 1,
-1.261069, 0.9755718, -0.1039542, 1, 0.5803922, 0, 1,
-1.254252, -0.9007003, -3.664646, 1, 0.5882353, 0, 1,
-1.252526, 1.418442, -1.525772, 1, 0.5921569, 0, 1,
-1.251424, -0.2571293, -1.979594, 1, 0.6, 0, 1,
-1.251252, 0.2189106, -1.305174, 1, 0.6078432, 0, 1,
-1.250968, 1.804051, -1.765178, 1, 0.6117647, 0, 1,
-1.24902, 0.4500338, 1.082923, 1, 0.6196079, 0, 1,
-1.247749, 0.3343882, -0.9467543, 1, 0.6235294, 0, 1,
-1.241858, -0.1039949, -0.8392849, 1, 0.6313726, 0, 1,
-1.234892, 1.112934, -2.332865, 1, 0.6352941, 0, 1,
-1.23315, -0.7104861, -1.511447, 1, 0.6431373, 0, 1,
-1.217538, 0.853516, 0.3320754, 1, 0.6470588, 0, 1,
-1.21179, -0.270292, -2.022598, 1, 0.654902, 0, 1,
-1.211386, -0.6156421, -0.7485564, 1, 0.6588235, 0, 1,
-1.206421, 0.2843251, -1.910502, 1, 0.6666667, 0, 1,
-1.206235, -1.071284, -2.759965, 1, 0.6705883, 0, 1,
-1.200127, 2.029746, -2.12141, 1, 0.6784314, 0, 1,
-1.197828, -2.135553, -3.062099, 1, 0.682353, 0, 1,
-1.194011, 0.9506999, -0.2423256, 1, 0.6901961, 0, 1,
-1.169623, -1.444442, -2.177714, 1, 0.6941177, 0, 1,
-1.16883, -0.6856912, -0.8873328, 1, 0.7019608, 0, 1,
-1.156443, 0.1406744, -3.226434, 1, 0.7098039, 0, 1,
-1.146832, 0.8818337, -0.5732892, 1, 0.7137255, 0, 1,
-1.14607, -1.131614, -2.362778, 1, 0.7215686, 0, 1,
-1.142066, 1.352189, -0.05119614, 1, 0.7254902, 0, 1,
-1.132503, 0.6893623, -1.454179, 1, 0.7333333, 0, 1,
-1.128275, 1.09381, -1.327326, 1, 0.7372549, 0, 1,
-1.126163, 0.6456336, -0.6797865, 1, 0.7450981, 0, 1,
-1.122928, 0.6371089, 0.3007237, 1, 0.7490196, 0, 1,
-1.120695, 0.442433, -1.686727, 1, 0.7568628, 0, 1,
-1.120176, -0.136641, -2.293519, 1, 0.7607843, 0, 1,
-1.116825, 1.079093, 0.02818386, 1, 0.7686275, 0, 1,
-1.116555, 1.659562, -1.88308, 1, 0.772549, 0, 1,
-1.11008, 0.03012181, -2.387034, 1, 0.7803922, 0, 1,
-1.107684, 1.992563, -0.07807492, 1, 0.7843137, 0, 1,
-1.103355, 0.8049643, -1.703441, 1, 0.7921569, 0, 1,
-1.09439, -0.1423637, -0.8669254, 1, 0.7960784, 0, 1,
-1.093078, -0.3015874, -2.301758, 1, 0.8039216, 0, 1,
-1.086008, 0.5684446, -0.4966851, 1, 0.8117647, 0, 1,
-1.082521, -0.1287323, -1.272565, 1, 0.8156863, 0, 1,
-1.075344, 0.7440683, -1.084825, 1, 0.8235294, 0, 1,
-1.075146, 0.5014186, -2.300391, 1, 0.827451, 0, 1,
-1.074093, 2.220086, -0.6089534, 1, 0.8352941, 0, 1,
-1.066357, 0.411423, -0.7949173, 1, 0.8392157, 0, 1,
-1.058531, -0.6662474, -0.2108476, 1, 0.8470588, 0, 1,
-1.055947, 1.3702, -1.964938, 1, 0.8509804, 0, 1,
-1.054216, -1.099157, -1.853448, 1, 0.8588235, 0, 1,
-1.053805, 1.04189, -0.5273969, 1, 0.8627451, 0, 1,
-1.050846, -0.7021913, -1.072126, 1, 0.8705882, 0, 1,
-1.050683, 0.4827471, -2.021075, 1, 0.8745098, 0, 1,
-1.041616, 0.02525422, 0.2454524, 1, 0.8823529, 0, 1,
-1.041056, -0.2261007, -1.325309, 1, 0.8862745, 0, 1,
-1.036622, 0.3627013, -1.935281, 1, 0.8941177, 0, 1,
-1.031044, 1.67004, -0.702561, 1, 0.8980392, 0, 1,
-1.018622, -0.3905792, -1.586853, 1, 0.9058824, 0, 1,
-1.018415, -2.339934, -2.321199, 1, 0.9137255, 0, 1,
-1.013612, -0.756049, -1.842096, 1, 0.9176471, 0, 1,
-1.002182, 1.361798, -0.1645145, 1, 0.9254902, 0, 1,
-0.9987513, 1.234086, -1.627596, 1, 0.9294118, 0, 1,
-0.9969006, 0.2282416, 0.3504703, 1, 0.9372549, 0, 1,
-0.9867377, -1.321184, -3.175194, 1, 0.9411765, 0, 1,
-0.9828278, -0.5306734, -2.138006, 1, 0.9490196, 0, 1,
-0.9793183, 1.945224, -1.198334, 1, 0.9529412, 0, 1,
-0.9777341, 1.098713, 0.1707952, 1, 0.9607843, 0, 1,
-0.9769679, 0.7636596, -0.715003, 1, 0.9647059, 0, 1,
-0.9714581, 1.421109, -1.86851, 1, 0.972549, 0, 1,
-0.9645519, -0.2676618, -1.701786, 1, 0.9764706, 0, 1,
-0.9596155, 0.6690897, -0.5800442, 1, 0.9843137, 0, 1,
-0.9517608, -3.117897, -2.286682, 1, 0.9882353, 0, 1,
-0.9504529, 0.5586721, 0.4257833, 1, 0.9960784, 0, 1,
-0.9475413, 0.377203, -2.22481, 0.9960784, 1, 0, 1,
-0.9422747, 1.298892, -0.8171884, 0.9921569, 1, 0, 1,
-0.9393151, 0.8738321, -0.05753865, 0.9843137, 1, 0, 1,
-0.9376764, -1.344304, -1.826205, 0.9803922, 1, 0, 1,
-0.9352462, -0.5569364, -1.911558, 0.972549, 1, 0, 1,
-0.9275045, 0.722135, -0.3650186, 0.9686275, 1, 0, 1,
-0.9272164, -0.1866884, -2.329234, 0.9607843, 1, 0, 1,
-0.923825, 0.2805525, -0.5962577, 0.9568627, 1, 0, 1,
-0.9238067, 0.1259704, 0.07647578, 0.9490196, 1, 0, 1,
-0.9180235, -2.393117, -1.66687, 0.945098, 1, 0, 1,
-0.9167147, 1.829771, -0.6696445, 0.9372549, 1, 0, 1,
-0.914503, -1.572589, -1.989897, 0.9333333, 1, 0, 1,
-0.9095179, -0.1296755, -1.184399, 0.9254902, 1, 0, 1,
-0.9079726, -0.4866426, -2.533192, 0.9215686, 1, 0, 1,
-0.8898029, 0.08665375, -0.7393568, 0.9137255, 1, 0, 1,
-0.8700452, -1.529915, -2.380393, 0.9098039, 1, 0, 1,
-0.8678769, 0.3688647, -1.973236, 0.9019608, 1, 0, 1,
-0.8677226, -1.550321, -3.185935, 0.8941177, 1, 0, 1,
-0.866875, 0.6353186, -0.09975896, 0.8901961, 1, 0, 1,
-0.8572276, -1.11531, -3.308586, 0.8823529, 1, 0, 1,
-0.8515195, -0.589098, -2.412141, 0.8784314, 1, 0, 1,
-0.8478577, -1.069306, -2.697015, 0.8705882, 1, 0, 1,
-0.8330874, 1.261137, -0.5656062, 0.8666667, 1, 0, 1,
-0.8313629, -1.255385, -3.489031, 0.8588235, 1, 0, 1,
-0.8257873, 0.1593068, -0.3019548, 0.854902, 1, 0, 1,
-0.8241277, 0.9605266, -0.8311081, 0.8470588, 1, 0, 1,
-0.821358, 0.09199005, 0.1646947, 0.8431373, 1, 0, 1,
-0.8174646, -1.071214, -2.824673, 0.8352941, 1, 0, 1,
-0.8154432, 0.7702879, -1.927581, 0.8313726, 1, 0, 1,
-0.8140161, 0.9022496, -1.7889, 0.8235294, 1, 0, 1,
-0.8139458, -0.5958511, -3.636105, 0.8196079, 1, 0, 1,
-0.8107135, -0.19235, -3.214493, 0.8117647, 1, 0, 1,
-0.8104679, -1.244547, -2.82241, 0.8078431, 1, 0, 1,
-0.8033496, -0.006537076, -1.955489, 0.8, 1, 0, 1,
-0.7997894, 1.164196, 0.2195649, 0.7921569, 1, 0, 1,
-0.797709, 1.714785, 0.4209462, 0.7882353, 1, 0, 1,
-0.7966262, -1.267205, -2.279975, 0.7803922, 1, 0, 1,
-0.7934467, 1.321694, -0.3016621, 0.7764706, 1, 0, 1,
-0.7926397, 0.8452142, -0.9404801, 0.7686275, 1, 0, 1,
-0.776588, 0.1724192, -1.609103, 0.7647059, 1, 0, 1,
-0.7751402, -0.5263456, -1.24184, 0.7568628, 1, 0, 1,
-0.7721916, -1.239597, -2.097554, 0.7529412, 1, 0, 1,
-0.7670379, -1.780442, -4.15447, 0.7450981, 1, 0, 1,
-0.7660042, 1.587306, 1.49625, 0.7411765, 1, 0, 1,
-0.7646592, -0.1933095, -1.818625, 0.7333333, 1, 0, 1,
-0.7629872, -0.4483197, -0.6072329, 0.7294118, 1, 0, 1,
-0.7574133, 0.2008855, -1.393909, 0.7215686, 1, 0, 1,
-0.7571138, 0.7991178, -2.089288, 0.7176471, 1, 0, 1,
-0.7559565, 0.6935634, -0.3166418, 0.7098039, 1, 0, 1,
-0.7548906, -0.6381835, -2.569337, 0.7058824, 1, 0, 1,
-0.7470498, 0.4134241, -2.266401, 0.6980392, 1, 0, 1,
-0.7464552, -0.3030379, -1.355907, 0.6901961, 1, 0, 1,
-0.7436025, -0.2342936, -2.248847, 0.6862745, 1, 0, 1,
-0.740953, -0.52685, -1.915585, 0.6784314, 1, 0, 1,
-0.7406952, -0.077957, -2.312773, 0.6745098, 1, 0, 1,
-0.7399858, 0.4556827, -3.60747, 0.6666667, 1, 0, 1,
-0.7307103, 0.1993656, -1.165814, 0.6627451, 1, 0, 1,
-0.7293741, -0.5819392, -2.115262, 0.654902, 1, 0, 1,
-0.7231334, 1.223773, -1.281408, 0.6509804, 1, 0, 1,
-0.7196354, 0.01280159, -1.92312, 0.6431373, 1, 0, 1,
-0.7192472, 1.46461, -1.38901, 0.6392157, 1, 0, 1,
-0.7171649, 0.1543855, -1.749465, 0.6313726, 1, 0, 1,
-0.7167641, 0.4189637, -0.5618684, 0.627451, 1, 0, 1,
-0.7119797, -1.424847, -2.58424, 0.6196079, 1, 0, 1,
-0.7092173, 1.001397, -1.659265, 0.6156863, 1, 0, 1,
-0.7086303, -0.3028125, -3.899963, 0.6078432, 1, 0, 1,
-0.7084672, -1.907946, -2.936592, 0.6039216, 1, 0, 1,
-0.7038548, -0.4470882, -2.93192, 0.5960785, 1, 0, 1,
-0.6990554, 1.181267, 0.4859827, 0.5882353, 1, 0, 1,
-0.6958982, -0.6451483, -3.6089, 0.5843138, 1, 0, 1,
-0.6919309, 1.284216, -1.396345, 0.5764706, 1, 0, 1,
-0.6869583, -0.4219344, -1.358298, 0.572549, 1, 0, 1,
-0.678472, 0.3031134, 0.03433162, 0.5647059, 1, 0, 1,
-0.676389, -0.02008059, -1.382715, 0.5607843, 1, 0, 1,
-0.6763571, 0.7237225, -0.8514418, 0.5529412, 1, 0, 1,
-0.6705676, -2.774153, -4.202424, 0.5490196, 1, 0, 1,
-0.6677076, -0.7341193, -0.7421748, 0.5411765, 1, 0, 1,
-0.6658882, -0.5817425, -2.09072, 0.5372549, 1, 0, 1,
-0.6572825, 0.5526419, -1.373158, 0.5294118, 1, 0, 1,
-0.6555619, -0.07909932, -0.1736846, 0.5254902, 1, 0, 1,
-0.6533852, -0.3387308, -1.974999, 0.5176471, 1, 0, 1,
-0.6526092, -0.2275958, -2.008984, 0.5137255, 1, 0, 1,
-0.6523971, -0.8654267, -1.485748, 0.5058824, 1, 0, 1,
-0.6509808, 1.193534, 0.3113668, 0.5019608, 1, 0, 1,
-0.6444929, 0.07311974, -1.511164, 0.4941176, 1, 0, 1,
-0.6438681, -1.475263, -3.639424, 0.4862745, 1, 0, 1,
-0.6436746, -0.1834815, -2.005758, 0.4823529, 1, 0, 1,
-0.6408518, -0.7424633, -1.323708, 0.4745098, 1, 0, 1,
-0.639636, -1.906263, -3.313393, 0.4705882, 1, 0, 1,
-0.6345938, 0.1270344, -1.584453, 0.4627451, 1, 0, 1,
-0.6321412, 0.3678164, -3.65363, 0.4588235, 1, 0, 1,
-0.6304787, 0.8831098, -1.878509, 0.4509804, 1, 0, 1,
-0.6284505, 0.6680533, -2.329123, 0.4470588, 1, 0, 1,
-0.6220265, 0.8948095, -0.7668564, 0.4392157, 1, 0, 1,
-0.6208774, -0.07410054, -1.284339, 0.4352941, 1, 0, 1,
-0.6206388, -0.1490576, -1.8101, 0.427451, 1, 0, 1,
-0.6159756, 2.747823, -0.4701895, 0.4235294, 1, 0, 1,
-0.6153046, 1.454983, -0.3886994, 0.4156863, 1, 0, 1,
-0.6126852, 0.9278544, 0.2909707, 0.4117647, 1, 0, 1,
-0.6077376, -1.059389, -3.411046, 0.4039216, 1, 0, 1,
-0.6074572, -1.196125, -2.734269, 0.3960784, 1, 0, 1,
-0.6073433, -0.4472355, -0.9231433, 0.3921569, 1, 0, 1,
-0.6011708, 2.359794, -1.255511, 0.3843137, 1, 0, 1,
-0.5955771, -0.3401921, -3.336342, 0.3803922, 1, 0, 1,
-0.5953587, 1.240933, -0.3338621, 0.372549, 1, 0, 1,
-0.5926464, -0.3167707, -1.998417, 0.3686275, 1, 0, 1,
-0.5874224, 1.443223, 1.321759, 0.3607843, 1, 0, 1,
-0.5853876, 0.9653732, -1.208038, 0.3568628, 1, 0, 1,
-0.5790007, 0.7340205, -1.870054, 0.3490196, 1, 0, 1,
-0.5779281, 0.5196831, -0.7248396, 0.345098, 1, 0, 1,
-0.5772606, -1.36388, -2.567434, 0.3372549, 1, 0, 1,
-0.5770095, -0.1244319, -1.665058, 0.3333333, 1, 0, 1,
-0.5672002, 0.02160195, -2.314449, 0.3254902, 1, 0, 1,
-0.5656425, -0.4198609, -1.45186, 0.3215686, 1, 0, 1,
-0.5647979, -1.162565, -1.649158, 0.3137255, 1, 0, 1,
-0.5643085, 0.8058087, -1.643758, 0.3098039, 1, 0, 1,
-0.5642392, -0.8662874, -2.485487, 0.3019608, 1, 0, 1,
-0.5631949, 0.1383732, 0.2081818, 0.2941177, 1, 0, 1,
-0.5582852, 1.016427, -2.748606, 0.2901961, 1, 0, 1,
-0.5562604, 1.528282, -0.6510928, 0.282353, 1, 0, 1,
-0.5533843, 0.3545722, -0.9256201, 0.2784314, 1, 0, 1,
-0.5524533, -0.789315, -2.568382, 0.2705882, 1, 0, 1,
-0.5515857, -0.5039882, -1.368829, 0.2666667, 1, 0, 1,
-0.5512842, -0.6782685, -1.707381, 0.2588235, 1, 0, 1,
-0.5509618, -2.083479, -2.895711, 0.254902, 1, 0, 1,
-0.5487146, -1.552434, -2.594836, 0.2470588, 1, 0, 1,
-0.5423655, -0.0163722, -1.494237, 0.2431373, 1, 0, 1,
-0.5399842, -0.6862534, -0.3654015, 0.2352941, 1, 0, 1,
-0.5399456, 0.799574, 0.5708391, 0.2313726, 1, 0, 1,
-0.538362, -0.9508497, -2.838565, 0.2235294, 1, 0, 1,
-0.5376074, 0.9235435, 0.8246343, 0.2196078, 1, 0, 1,
-0.5363994, -0.8135086, -3.470162, 0.2117647, 1, 0, 1,
-0.5359294, -2.206268, -3.943788, 0.2078431, 1, 0, 1,
-0.5235108, -0.3858652, -2.538312, 0.2, 1, 0, 1,
-0.5190521, 0.6636232, -0.4775757, 0.1921569, 1, 0, 1,
-0.5169259, -0.5911573, -1.043223, 0.1882353, 1, 0, 1,
-0.5101733, 0.04651913, -1.394177, 0.1803922, 1, 0, 1,
-0.5089549, 0.4712759, -1.342493, 0.1764706, 1, 0, 1,
-0.5076897, 0.9595946, 0.6160118, 0.1686275, 1, 0, 1,
-0.5068113, -0.6173893, -3.275652, 0.1647059, 1, 0, 1,
-0.5062338, 1.876079, 0.284996, 0.1568628, 1, 0, 1,
-0.5030124, -0.1298436, -3.113176, 0.1529412, 1, 0, 1,
-0.5025175, -1.270347, -2.291517, 0.145098, 1, 0, 1,
-0.5021132, 0.2833219, -2.037017, 0.1411765, 1, 0, 1,
-0.4958929, 0.3836161, -0.294572, 0.1333333, 1, 0, 1,
-0.4905574, -0.4954606, -4.11167, 0.1294118, 1, 0, 1,
-0.4903052, -1.021386, -4.023087, 0.1215686, 1, 0, 1,
-0.4886918, -1.11122, -1.425387, 0.1176471, 1, 0, 1,
-0.4855836, -0.8503937, -2.459351, 0.1098039, 1, 0, 1,
-0.4777831, -0.2195799, -3.047186, 0.1058824, 1, 0, 1,
-0.4764292, -1.724997, -2.2843, 0.09803922, 1, 0, 1,
-0.4751039, 0.1093596, -1.356903, 0.09019608, 1, 0, 1,
-0.4749725, 0.7724932, -0.4159168, 0.08627451, 1, 0, 1,
-0.4678741, -0.6410604, -1.202322, 0.07843138, 1, 0, 1,
-0.4668606, -0.5466895, -2.319392, 0.07450981, 1, 0, 1,
-0.462408, -0.6034428, -4.491019, 0.06666667, 1, 0, 1,
-0.4604096, 0.1860896, -0.449538, 0.0627451, 1, 0, 1,
-0.4597654, 0.3669564, -0.04127891, 0.05490196, 1, 0, 1,
-0.4578903, 1.618657, -1.80087, 0.05098039, 1, 0, 1,
-0.4510781, -1.081721, -3.720443, 0.04313726, 1, 0, 1,
-0.4509681, -1.060663, -3.374073, 0.03921569, 1, 0, 1,
-0.4497608, -1.821143, -2.223078, 0.03137255, 1, 0, 1,
-0.448011, -0.2479458, -1.08687, 0.02745098, 1, 0, 1,
-0.447277, -1.429206, -3.646017, 0.01960784, 1, 0, 1,
-0.4449675, 2.55019, -1.60369, 0.01568628, 1, 0, 1,
-0.4445829, 0.5906297, 0.435132, 0.007843138, 1, 0, 1,
-0.4407791, -1.273413, -1.509751, 0.003921569, 1, 0, 1,
-0.4375516, 0.6770189, -2.515435, 0, 1, 0.003921569, 1,
-0.4314196, -1.272017, -2.635864, 0, 1, 0.01176471, 1,
-0.4294216, 0.09364566, -0.3892832, 0, 1, 0.01568628, 1,
-0.429272, 0.5488294, -1.983903, 0, 1, 0.02352941, 1,
-0.4284941, 0.3162029, -2.485372, 0, 1, 0.02745098, 1,
-0.4261369, -0.09536123, -2.66255, 0, 1, 0.03529412, 1,
-0.4253967, 1.872809, 0.5163014, 0, 1, 0.03921569, 1,
-0.4230377, -1.552287, -4.846406, 0, 1, 0.04705882, 1,
-0.4219092, 0.330976, 0.8022485, 0, 1, 0.05098039, 1,
-0.4179642, -0.3511967, -2.037325, 0, 1, 0.05882353, 1,
-0.4145911, 0.1113184, -1.645095, 0, 1, 0.0627451, 1,
-0.4128574, 1.052187, 0.4117135, 0, 1, 0.07058824, 1,
-0.4117911, 1.113038, -1.164708, 0, 1, 0.07450981, 1,
-0.4043486, -0.6038541, -3.551591, 0, 1, 0.08235294, 1,
-0.4025739, -0.1673088, -2.991691, 0, 1, 0.08627451, 1,
-0.4021051, -1.780638, -2.353146, 0, 1, 0.09411765, 1,
-0.3959156, -0.9657052, -3.634346, 0, 1, 0.1019608, 1,
-0.3957931, -0.4848642, -3.740673, 0, 1, 0.1058824, 1,
-0.3951027, 1.149136, -1.38297, 0, 1, 0.1137255, 1,
-0.3944353, 2.422649, -0.2191667, 0, 1, 0.1176471, 1,
-0.3891264, 0.5817936, -2.024782, 0, 1, 0.1254902, 1,
-0.3870856, 0.2931527, -0.3430081, 0, 1, 0.1294118, 1,
-0.3865553, 0.3837522, -0.5275376, 0, 1, 0.1372549, 1,
-0.3841861, 0.2599723, 0.1052981, 0, 1, 0.1411765, 1,
-0.3800124, 0.9212995, -0.6059222, 0, 1, 0.1490196, 1,
-0.3762808, -0.8262175, -3.398568, 0, 1, 0.1529412, 1,
-0.375651, 0.8468031, 0.5063597, 0, 1, 0.1607843, 1,
-0.3686602, -0.4574359, -3.566685, 0, 1, 0.1647059, 1,
-0.3655726, -0.2826299, -1.322, 0, 1, 0.172549, 1,
-0.3653868, 1.245955, 1.777508, 0, 1, 0.1764706, 1,
-0.3610277, -1.027924, -2.948242, 0, 1, 0.1843137, 1,
-0.3606407, 0.3826281, -0.757667, 0, 1, 0.1882353, 1,
-0.3549969, 0.2792342, -2.22043, 0, 1, 0.1960784, 1,
-0.3548937, 1.064248, -0.4905615, 0, 1, 0.2039216, 1,
-0.3535444, 0.8240719, -1.435997, 0, 1, 0.2078431, 1,
-0.3520099, 0.4091454, -2.02093, 0, 1, 0.2156863, 1,
-0.3474489, 2.616784, -0.9095827, 0, 1, 0.2196078, 1,
-0.341916, 0.08448214, -1.317139, 0, 1, 0.227451, 1,
-0.3406363, 1.473244, -1.293549, 0, 1, 0.2313726, 1,
-0.3371828, -1.587196, -2.79896, 0, 1, 0.2392157, 1,
-0.3367568, 0.6890705, 0.4610185, 0, 1, 0.2431373, 1,
-0.3361335, -1.081418, -0.8254774, 0, 1, 0.2509804, 1,
-0.3358119, -0.7642702, -4.194395, 0, 1, 0.254902, 1,
-0.3285736, 2.027618, 0.6485589, 0, 1, 0.2627451, 1,
-0.3272047, -1.07644, -2.889703, 0, 1, 0.2666667, 1,
-0.3256553, 0.1446098, -2.443733, 0, 1, 0.2745098, 1,
-0.321363, -0.241383, -2.600468, 0, 1, 0.2784314, 1,
-0.3148131, -0.04217454, -1.237629, 0, 1, 0.2862745, 1,
-0.3051951, -0.5385694, -2.606138, 0, 1, 0.2901961, 1,
-0.3028888, -1.647269, -2.865874, 0, 1, 0.2980392, 1,
-0.302015, 0.0580658, -2.485488, 0, 1, 0.3058824, 1,
-0.3001676, -0.1575859, -2.593037, 0, 1, 0.3098039, 1,
-0.299581, 0.5018484, -1.355063, 0, 1, 0.3176471, 1,
-0.2980326, 0.4163278, 0.08287647, 0, 1, 0.3215686, 1,
-0.2882396, -1.080926, -2.917815, 0, 1, 0.3294118, 1,
-0.2867766, 0.3729787, -0.04441308, 0, 1, 0.3333333, 1,
-0.2843094, 0.2721142, -0.2458283, 0, 1, 0.3411765, 1,
-0.2837648, -0.6710559, -2.518854, 0, 1, 0.345098, 1,
-0.2815565, -0.3965587, -2.337368, 0, 1, 0.3529412, 1,
-0.2813097, -0.4825462, -2.678881, 0, 1, 0.3568628, 1,
-0.2793727, -1.137773, -2.424164, 0, 1, 0.3647059, 1,
-0.2791964, 0.3964286, -1.625179, 0, 1, 0.3686275, 1,
-0.2777934, -0.9535765, -2.089574, 0, 1, 0.3764706, 1,
-0.2756241, 0.6769809, 0.9570816, 0, 1, 0.3803922, 1,
-0.2709309, -0.7152854, -3.067141, 0, 1, 0.3882353, 1,
-0.2705776, 0.7363558, -0.5045138, 0, 1, 0.3921569, 1,
-0.2702669, -0.7073039, -1.888089, 0, 1, 0.4, 1,
-0.267368, -0.3500121, -4.396116, 0, 1, 0.4078431, 1,
-0.2614547, -1.125078, -1.057847, 0, 1, 0.4117647, 1,
-0.261383, 1.237811, 0.03280589, 0, 1, 0.4196078, 1,
-0.2604892, -0.4655606, -4.520296, 0, 1, 0.4235294, 1,
-0.2593365, -1.673056, -4.150396, 0, 1, 0.4313726, 1,
-0.25774, 0.7240227, 1.254001, 0, 1, 0.4352941, 1,
-0.2560845, -0.8666536, -3.913862, 0, 1, 0.4431373, 1,
-0.2545589, 0.5939831, -2.821516, 0, 1, 0.4470588, 1,
-0.251487, -1.712285, -3.648102, 0, 1, 0.454902, 1,
-0.2499886, -0.8589215, -2.527802, 0, 1, 0.4588235, 1,
-0.2433388, -0.3459088, -2.46499, 0, 1, 0.4666667, 1,
-0.2426038, 0.3126373, 0.08663367, 0, 1, 0.4705882, 1,
-0.2372235, 2.672466, 0.4121849, 0, 1, 0.4784314, 1,
-0.2360987, -0.3305938, -3.258046, 0, 1, 0.4823529, 1,
-0.2352424, -1.937294, -1.574693, 0, 1, 0.4901961, 1,
-0.2338114, 0.8896869, 0.9899656, 0, 1, 0.4941176, 1,
-0.2327881, -0.9194835, -1.604085, 0, 1, 0.5019608, 1,
-0.2297892, 0.8016362, -1.195892, 0, 1, 0.509804, 1,
-0.2254086, -1.468832, -3.414213, 0, 1, 0.5137255, 1,
-0.2207756, -0.3399705, -0.6733059, 0, 1, 0.5215687, 1,
-0.2166809, 0.09530868, -1.253848, 0, 1, 0.5254902, 1,
-0.2151999, 0.4197173, -1.531677, 0, 1, 0.5333334, 1,
-0.2151791, 1.23304, 0.152505, 0, 1, 0.5372549, 1,
-0.2124407, 0.06527481, -3.706047, 0, 1, 0.5450981, 1,
-0.2073129, -0.3925202, -2.805863, 0, 1, 0.5490196, 1,
-0.2041695, -0.8603036, -4.078969, 0, 1, 0.5568628, 1,
-0.202803, 0.5876083, -1.204038, 0, 1, 0.5607843, 1,
-0.1980226, -0.2906885, -4.190387, 0, 1, 0.5686275, 1,
-0.1930782, 0.01823017, -1.573321, 0, 1, 0.572549, 1,
-0.1929011, -0.3611799, -2.489732, 0, 1, 0.5803922, 1,
-0.1895018, -0.1443553, -3.81206, 0, 1, 0.5843138, 1,
-0.1889487, -0.2829856, -1.377318, 0, 1, 0.5921569, 1,
-0.1850546, -0.8881179, -3.188519, 0, 1, 0.5960785, 1,
-0.179466, -0.5149269, -3.284573, 0, 1, 0.6039216, 1,
-0.1688488, 0.3994215, -1.402846, 0, 1, 0.6117647, 1,
-0.1688233, 0.8967251, 0.227837, 0, 1, 0.6156863, 1,
-0.1651018, -0.3689872, -3.490409, 0, 1, 0.6235294, 1,
-0.1641234, 1.762885, -1.18672, 0, 1, 0.627451, 1,
-0.1641217, 0.03443267, -2.388878, 0, 1, 0.6352941, 1,
-0.1628839, 0.2491251, 0.6399881, 0, 1, 0.6392157, 1,
-0.1613163, -1.927262, -2.71472, 0, 1, 0.6470588, 1,
-0.1605006, -1.760781, -4.216313, 0, 1, 0.6509804, 1,
-0.1553774, -0.8658075, -2.380933, 0, 1, 0.6588235, 1,
-0.1547482, 1.31055, -0.8361243, 0, 1, 0.6627451, 1,
-0.1531928, 0.02294755, -1.488717, 0, 1, 0.6705883, 1,
-0.1481975, -1.843168, -2.566145, 0, 1, 0.6745098, 1,
-0.1426855, -0.363297, -3.167024, 0, 1, 0.682353, 1,
-0.1394471, 0.2889414, -0.6111676, 0, 1, 0.6862745, 1,
-0.1343054, 0.1126951, -1.619487, 0, 1, 0.6941177, 1,
-0.1322527, -0.05872425, -2.74809, 0, 1, 0.7019608, 1,
-0.1318418, 1.487392, 0.761237, 0, 1, 0.7058824, 1,
-0.1295088, -1.113077, -2.656605, 0, 1, 0.7137255, 1,
-0.129135, 0.9027753, -1.338575, 0, 1, 0.7176471, 1,
-0.1289566, -0.3243537, -4.556782, 0, 1, 0.7254902, 1,
-0.1269705, -1.139732, -2.389839, 0, 1, 0.7294118, 1,
-0.1240196, 0.0409794, -2.155943, 0, 1, 0.7372549, 1,
-0.1236188, -0.9624165, -2.132662, 0, 1, 0.7411765, 1,
-0.1210499, -0.6138709, -3.240361, 0, 1, 0.7490196, 1,
-0.1202598, -0.7813468, -3.276492, 0, 1, 0.7529412, 1,
-0.1197087, 0.01771487, -1.809182, 0, 1, 0.7607843, 1,
-0.1186528, 0.08591017, -1.200691, 0, 1, 0.7647059, 1,
-0.1148293, 0.9396468, -1.157016, 0, 1, 0.772549, 1,
-0.1141038, -0.2197887, -1.34842, 0, 1, 0.7764706, 1,
-0.1045303, 0.8897311, -0.3655294, 0, 1, 0.7843137, 1,
-0.09912891, -1.998939, -2.448382, 0, 1, 0.7882353, 1,
-0.09869207, 0.6512109, -0.2709279, 0, 1, 0.7960784, 1,
-0.09594704, -0.7507921, -2.446146, 0, 1, 0.8039216, 1,
-0.0953264, -0.3998284, -3.574291, 0, 1, 0.8078431, 1,
-0.09459863, 0.212052, -0.07467318, 0, 1, 0.8156863, 1,
-0.0855802, 1.386579, 1.624348, 0, 1, 0.8196079, 1,
-0.08285254, 1.637557, -0.7998636, 0, 1, 0.827451, 1,
-0.08003151, -0.05397107, -2.077389, 0, 1, 0.8313726, 1,
-0.07921734, 0.7234178, -0.003954841, 0, 1, 0.8392157, 1,
-0.07909346, -0.3523178, -1.802633, 0, 1, 0.8431373, 1,
-0.07818933, 0.4568207, -1.611444, 0, 1, 0.8509804, 1,
-0.07749557, 0.08209305, -2.27001, 0, 1, 0.854902, 1,
-0.07525468, -0.2928201, -4.425441, 0, 1, 0.8627451, 1,
-0.07478804, 1.303666, -0.3602087, 0, 1, 0.8666667, 1,
-0.0735628, 2.903409, 1.560392, 0, 1, 0.8745098, 1,
-0.06991946, 1.771503, 0.03212818, 0, 1, 0.8784314, 1,
-0.06822667, 0.5074006, 1.030874, 0, 1, 0.8862745, 1,
-0.06118709, 0.8569387, 0.5708226, 0, 1, 0.8901961, 1,
-0.05910395, 0.9467875, 0.2183607, 0, 1, 0.8980392, 1,
-0.05705984, -0.4166684, -1.28537, 0, 1, 0.9058824, 1,
-0.05479182, -0.9022615, -1.66226, 0, 1, 0.9098039, 1,
-0.0521991, 1.247275, 0.529162, 0, 1, 0.9176471, 1,
-0.05104352, 0.6937583, 0.2776885, 0, 1, 0.9215686, 1,
-0.04822633, 1.319668, 1.217037, 0, 1, 0.9294118, 1,
-0.0450812, 1.821097, 0.9414813, 0, 1, 0.9333333, 1,
-0.04490197, -0.5181251, -3.000823, 0, 1, 0.9411765, 1,
-0.04249591, 1.304062, 0.2006241, 0, 1, 0.945098, 1,
-0.04075269, 0.9531688, -1.401505, 0, 1, 0.9529412, 1,
-0.03992652, 1.349323, 2.087489, 0, 1, 0.9568627, 1,
-0.03951205, -0.1150303, -2.55792, 0, 1, 0.9647059, 1,
-0.0374796, 1.057067, 0.1451929, 0, 1, 0.9686275, 1,
-0.03706217, -0.2912659, -2.752839, 0, 1, 0.9764706, 1,
-0.03407372, -0.4039135, -3.536642, 0, 1, 0.9803922, 1,
-0.02926288, 0.189238, -1.001571, 0, 1, 0.9882353, 1,
-0.02732995, 0.8064839, 1.713455, 0, 1, 0.9921569, 1,
-0.02679984, -0.5039037, -4.729103, 0, 1, 1, 1,
-0.01946042, 0.03646342, 1.26359, 0, 0.9921569, 1, 1,
-0.01857223, 0.8901638, -0.9323323, 0, 0.9882353, 1, 1,
-0.01662781, 1.890863, -0.9974483, 0, 0.9803922, 1, 1,
-0.01225359, 0.7196964, -0.5237718, 0, 0.9764706, 1, 1,
-0.007737247, -0.8548181, -3.142628, 0, 0.9686275, 1, 1,
-0.005330639, -0.6817932, -2.518163, 0, 0.9647059, 1, 1,
-0.002872539, -0.8529595, -1.59982, 0, 0.9568627, 1, 1,
-0.001509936, 0.7671954, 0.1652014, 0, 0.9529412, 1, 1,
-0.001465683, 0.2571776, 1.413792, 0, 0.945098, 1, 1,
-0.0003768079, -0.7487476, -3.501388, 0, 0.9411765, 1, 1,
0.003040348, 0.2824012, 0.2161834, 0, 0.9333333, 1, 1,
0.003192473, -0.1048646, 3.582522, 0, 0.9294118, 1, 1,
0.00900077, -0.2259313, 2.497109, 0, 0.9215686, 1, 1,
0.01030501, 1.44532, 0.9583119, 0, 0.9176471, 1, 1,
0.01791407, 0.3035103, 1.569243, 0, 0.9098039, 1, 1,
0.03397222, 0.6812485, -0.5925641, 0, 0.9058824, 1, 1,
0.03641062, 0.6601855, -0.7050977, 0, 0.8980392, 1, 1,
0.03923035, 0.8639684, -1.613827, 0, 0.8901961, 1, 1,
0.03977415, 1.00785, 0.6892737, 0, 0.8862745, 1, 1,
0.06619179, 0.7594454, -1.584407, 0, 0.8784314, 1, 1,
0.06785326, -0.6556276, 2.663292, 0, 0.8745098, 1, 1,
0.06836714, 0.8992609, 2.042722, 0, 0.8666667, 1, 1,
0.06836808, -0.1503796, 4.177147, 0, 0.8627451, 1, 1,
0.06850238, 1.219335, -0.6223922, 0, 0.854902, 1, 1,
0.06888371, -1.711631, 2.533571, 0, 0.8509804, 1, 1,
0.06934184, 0.6529402, -0.3755628, 0, 0.8431373, 1, 1,
0.07237329, -1.144005, 1.989296, 0, 0.8392157, 1, 1,
0.07420416, 0.5851628, 0.5400777, 0, 0.8313726, 1, 1,
0.08471253, 1.344755, 2.518829, 0, 0.827451, 1, 1,
0.08501697, 0.7872678, -0.245838, 0, 0.8196079, 1, 1,
0.08794254, -1.332039, 2.98024, 0, 0.8156863, 1, 1,
0.08806803, -2.581931, 4.263662, 0, 0.8078431, 1, 1,
0.08953448, -0.1923133, 1.884834, 0, 0.8039216, 1, 1,
0.09553889, -1.013569, 3.766276, 0, 0.7960784, 1, 1,
0.09588506, -0.5203382, 2.617996, 0, 0.7882353, 1, 1,
0.09922747, -0.6041529, 3.772186, 0, 0.7843137, 1, 1,
0.1004876, -0.4828807, 3.766515, 0, 0.7764706, 1, 1,
0.101231, 0.2897581, 1.286041, 0, 0.772549, 1, 1,
0.1037832, -2.178279, 1.021554, 0, 0.7647059, 1, 1,
0.1062693, 0.7722346, 0.9189726, 0, 0.7607843, 1, 1,
0.1104144, -0.4429663, 2.074388, 0, 0.7529412, 1, 1,
0.1106707, 0.8537683, 0.600909, 0, 0.7490196, 1, 1,
0.1155188, -0.5190164, 2.279668, 0, 0.7411765, 1, 1,
0.116148, 0.4825327, -0.2695065, 0, 0.7372549, 1, 1,
0.121667, 0.2337382, 1.538737, 0, 0.7294118, 1, 1,
0.1236629, 0.2255583, 0.3162406, 0, 0.7254902, 1, 1,
0.1259633, 0.03850507, 2.686883, 0, 0.7176471, 1, 1,
0.1268756, -0.8566587, 1.285926, 0, 0.7137255, 1, 1,
0.1318795, -0.8202195, 2.571913, 0, 0.7058824, 1, 1,
0.1319455, -0.4164113, 2.017624, 0, 0.6980392, 1, 1,
0.1337666, 1.813936, -0.9156254, 0, 0.6941177, 1, 1,
0.1346085, -0.3010921, 1.870672, 0, 0.6862745, 1, 1,
0.1400596, -0.402696, 3.749405, 0, 0.682353, 1, 1,
0.1408451, 0.1614534, 1.533741, 0, 0.6745098, 1, 1,
0.1520471, 0.2427112, 0.1108958, 0, 0.6705883, 1, 1,
0.1526673, -1.007231, 2.934262, 0, 0.6627451, 1, 1,
0.1546948, -0.07252677, 0.5319338, 0, 0.6588235, 1, 1,
0.1560845, 1.622442, 1.197922, 0, 0.6509804, 1, 1,
0.1566005, 0.9117948, 0.5841854, 0, 0.6470588, 1, 1,
0.1596382, 0.3921708, -0.7844861, 0, 0.6392157, 1, 1,
0.1600891, -0.4307769, 2.469916, 0, 0.6352941, 1, 1,
0.1630327, -0.1914072, 1.443311, 0, 0.627451, 1, 1,
0.1644127, 1.055282, -1.045294, 0, 0.6235294, 1, 1,
0.1656009, 1.061068, 0.3351458, 0, 0.6156863, 1, 1,
0.1667474, 1.470492, 2.46459, 0, 0.6117647, 1, 1,
0.1672717, -0.2873643, 4.038628, 0, 0.6039216, 1, 1,
0.1678203, 0.1316703, 0.9995019, 0, 0.5960785, 1, 1,
0.1694697, 0.3519456, 1.907386, 0, 0.5921569, 1, 1,
0.1698774, -1.416212, 1.35225, 0, 0.5843138, 1, 1,
0.1727068, -0.3262432, 4.931938, 0, 0.5803922, 1, 1,
0.1750668, 0.3160354, 0.08087533, 0, 0.572549, 1, 1,
0.1754042, 0.09048654, 1.514671, 0, 0.5686275, 1, 1,
0.1778257, -0.1650166, 2.591443, 0, 0.5607843, 1, 1,
0.1817489, 0.6700553, -0.328538, 0, 0.5568628, 1, 1,
0.1936086, 0.3144464, 0.7002701, 0, 0.5490196, 1, 1,
0.19563, -0.8423339, 3.767022, 0, 0.5450981, 1, 1,
0.1960336, 1.23768, 1.257414, 0, 0.5372549, 1, 1,
0.1985333, -0.5094237, 2.98787, 0, 0.5333334, 1, 1,
0.2001004, 0.3568116, 0.201083, 0, 0.5254902, 1, 1,
0.20088, -0.9099359, 2.32056, 0, 0.5215687, 1, 1,
0.2024636, 1.083196, 0.6718401, 0, 0.5137255, 1, 1,
0.2031008, -0.3093654, 2.742647, 0, 0.509804, 1, 1,
0.2066042, 1.421893, -2.162707, 0, 0.5019608, 1, 1,
0.2091973, -0.9439391, 3.551315, 0, 0.4941176, 1, 1,
0.2111852, -0.3325625, 3.901561, 0, 0.4901961, 1, 1,
0.213947, -0.42833, 2.430867, 0, 0.4823529, 1, 1,
0.2194476, -0.9422297, 3.444386, 0, 0.4784314, 1, 1,
0.2195407, 0.4098777, 0.9628173, 0, 0.4705882, 1, 1,
0.2215088, -1.601509, 3.163342, 0, 0.4666667, 1, 1,
0.2255128, -0.200684, 0.7122443, 0, 0.4588235, 1, 1,
0.2278297, 0.8380075, 0.935592, 0, 0.454902, 1, 1,
0.2350183, 2.030021, -0.004477687, 0, 0.4470588, 1, 1,
0.2355224, 0.9758202, -0.9905335, 0, 0.4431373, 1, 1,
0.2376947, 0.5162152, -0.4811939, 0, 0.4352941, 1, 1,
0.2420894, -1.724328, 3.28553, 0, 0.4313726, 1, 1,
0.2457541, -0.3808927, 1.146816, 0, 0.4235294, 1, 1,
0.2482173, 0.8919775, -0.9763727, 0, 0.4196078, 1, 1,
0.2494623, -0.9286435, 2.877266, 0, 0.4117647, 1, 1,
0.2528979, 1.100068, 0.8057911, 0, 0.4078431, 1, 1,
0.2543424, -2.616669, 2.901802, 0, 0.4, 1, 1,
0.2565384, 0.690538, 0.7532101, 0, 0.3921569, 1, 1,
0.2579883, 1.478835, -1.375093, 0, 0.3882353, 1, 1,
0.2580134, -0.8155243, 3.675564, 0, 0.3803922, 1, 1,
0.2590175, 0.06006642, 1.807433, 0, 0.3764706, 1, 1,
0.2595934, -0.2851113, 2.903836, 0, 0.3686275, 1, 1,
0.2725027, -0.3410663, 2.421427, 0, 0.3647059, 1, 1,
0.2764097, -0.1318103, 1.31641, 0, 0.3568628, 1, 1,
0.2804011, -0.4843788, 0.6114315, 0, 0.3529412, 1, 1,
0.2830262, 0.0125255, 1.578444, 0, 0.345098, 1, 1,
0.2837757, -0.02699448, 1.529094, 0, 0.3411765, 1, 1,
0.2872614, 0.1408619, 2.44065, 0, 0.3333333, 1, 1,
0.2880717, -0.655085, 4.184231, 0, 0.3294118, 1, 1,
0.2885157, -0.2959626, 1.789318, 0, 0.3215686, 1, 1,
0.2913856, 0.6985305, 2.203808, 0, 0.3176471, 1, 1,
0.2952754, -0.7141996, 0.8301207, 0, 0.3098039, 1, 1,
0.2977841, -0.09383938, 0.4112833, 0, 0.3058824, 1, 1,
0.3020688, 1.076218, 0.5587984, 0, 0.2980392, 1, 1,
0.3036275, -1.416431, 4.856079, 0, 0.2901961, 1, 1,
0.3071297, -0.9793292, 5.362607, 0, 0.2862745, 1, 1,
0.3072371, -0.7413322, 3.670912, 0, 0.2784314, 1, 1,
0.3094706, -0.9211012, 3.58612, 0, 0.2745098, 1, 1,
0.3099518, -0.2155291, 1.499055, 0, 0.2666667, 1, 1,
0.3146012, -0.4450677, 2.439161, 0, 0.2627451, 1, 1,
0.3159653, 0.7817051, 0.8266684, 0, 0.254902, 1, 1,
0.3182513, 0.9365091, 0.9872313, 0, 0.2509804, 1, 1,
0.3209287, -1.460547, 1.569825, 0, 0.2431373, 1, 1,
0.3264727, 0.4727513, 0.9682233, 0, 0.2392157, 1, 1,
0.3301968, 0.05008812, 1.544423, 0, 0.2313726, 1, 1,
0.3325292, -0.004014135, 3.818887, 0, 0.227451, 1, 1,
0.3325303, -0.8643488, 2.274451, 0, 0.2196078, 1, 1,
0.3369402, -0.7185005, 2.379974, 0, 0.2156863, 1, 1,
0.3372673, -1.73471, 3.044408, 0, 0.2078431, 1, 1,
0.3373821, 1.316521, 0.04310469, 0, 0.2039216, 1, 1,
0.3381033, -0.1519851, 3.802226, 0, 0.1960784, 1, 1,
0.3384524, -0.1267038, 1.139367, 0, 0.1882353, 1, 1,
0.3404066, 1.132539, 0.8009903, 0, 0.1843137, 1, 1,
0.3434511, -0.8000602, 2.56896, 0, 0.1764706, 1, 1,
0.3442321, -1.107518, 3.020521, 0, 0.172549, 1, 1,
0.3499582, 0.6773424, 1.336931, 0, 0.1647059, 1, 1,
0.3517358, 0.743386, 1.739873, 0, 0.1607843, 1, 1,
0.3550803, 0.4488818, 0.4107895, 0, 0.1529412, 1, 1,
0.3559954, 0.3706774, -0.6428532, 0, 0.1490196, 1, 1,
0.3576469, -0.7050552, 1.258575, 0, 0.1411765, 1, 1,
0.3583408, -0.1060169, 2.491842, 0, 0.1372549, 1, 1,
0.3584844, 0.5627725, 0.4315992, 0, 0.1294118, 1, 1,
0.3622401, -1.926847, 3.736602, 0, 0.1254902, 1, 1,
0.3706225, -1.292299, 3.491942, 0, 0.1176471, 1, 1,
0.3741261, -0.6224163, 3.626205, 0, 0.1137255, 1, 1,
0.3755604, 0.4742495, 2.697161, 0, 0.1058824, 1, 1,
0.3762149, -0.9051468, 3.745537, 0, 0.09803922, 1, 1,
0.3783574, 0.142147, 0.7598854, 0, 0.09411765, 1, 1,
0.3801939, -1.155324, 2.662802, 0, 0.08627451, 1, 1,
0.3809102, -0.1360635, 2.333748, 0, 0.08235294, 1, 1,
0.3849636, -0.1839842, 2.322024, 0, 0.07450981, 1, 1,
0.3914806, -1.876696, 3.349112, 0, 0.07058824, 1, 1,
0.3955227, -2.104073, 2.895373, 0, 0.0627451, 1, 1,
0.3964796, -0.1588224, 1.25284, 0, 0.05882353, 1, 1,
0.3984303, -1.834435, 1.348884, 0, 0.05098039, 1, 1,
0.3995481, -0.6092845, 2.18398, 0, 0.04705882, 1, 1,
0.4017462, 1.328199, 0.1605, 0, 0.03921569, 1, 1,
0.4022988, -0.4167712, 0.8281946, 0, 0.03529412, 1, 1,
0.403215, -0.05220541, 0.004209226, 0, 0.02745098, 1, 1,
0.4070249, -0.1701857, 2.981751, 0, 0.02352941, 1, 1,
0.4087594, -0.103549, 1.957465, 0, 0.01568628, 1, 1,
0.4115985, -1.176931, 2.431799, 0, 0.01176471, 1, 1,
0.4139111, 0.3235819, 1.295017, 0, 0.003921569, 1, 1,
0.4144491, -0.8041524, 3.121009, 0.003921569, 0, 1, 1,
0.4162345, 0.856949, 2.559251, 0.007843138, 0, 1, 1,
0.4253666, 0.4966194, -0.2009119, 0.01568628, 0, 1, 1,
0.4273036, 0.5712281, -0.4856485, 0.01960784, 0, 1, 1,
0.4294435, -1.837476, 2.301279, 0.02745098, 0, 1, 1,
0.4297144, 0.07487397, 0.5082886, 0.03137255, 0, 1, 1,
0.4301022, 0.3328192, 0.6305773, 0.03921569, 0, 1, 1,
0.4375556, -0.1180935, 2.068087, 0.04313726, 0, 1, 1,
0.438362, 0.6917992, 1.046071, 0.05098039, 0, 1, 1,
0.4391405, -0.7088351, 2.643764, 0.05490196, 0, 1, 1,
0.4400931, -0.01044492, 2.123042, 0.0627451, 0, 1, 1,
0.4534501, 0.3114749, 0.1465467, 0.06666667, 0, 1, 1,
0.4550502, 1.352989, 1.719567, 0.07450981, 0, 1, 1,
0.4653161, -0.8255617, 2.125228, 0.07843138, 0, 1, 1,
0.4712992, 1.146679, 2.074604, 0.08627451, 0, 1, 1,
0.4745259, 1.43431, 0.9578295, 0.09019608, 0, 1, 1,
0.477769, 0.05475969, -0.1305371, 0.09803922, 0, 1, 1,
0.4784745, -0.100488, 2.309886, 0.1058824, 0, 1, 1,
0.4799506, 0.3519551, 0.5668868, 0.1098039, 0, 1, 1,
0.4813336, 0.4400353, 0.2067815, 0.1176471, 0, 1, 1,
0.4829395, 0.9070721, -0.9029124, 0.1215686, 0, 1, 1,
0.483087, 0.1595319, 1.889531, 0.1294118, 0, 1, 1,
0.4844613, -0.1536475, 1.558991, 0.1333333, 0, 1, 1,
0.4862372, -0.9101571, 1.398402, 0.1411765, 0, 1, 1,
0.4882517, -0.1665665, 2.134615, 0.145098, 0, 1, 1,
0.4969849, 1.254983, 1.906272, 0.1529412, 0, 1, 1,
0.4982144, -0.1645343, 2.723093, 0.1568628, 0, 1, 1,
0.498335, 0.418708, -1.295234, 0.1647059, 0, 1, 1,
0.5046078, -0.7035886, 2.425415, 0.1686275, 0, 1, 1,
0.5066928, 0.1143814, 2.189056, 0.1764706, 0, 1, 1,
0.5073287, 0.904196, 2.455551, 0.1803922, 0, 1, 1,
0.5085783, -0.04729809, 1.706592, 0.1882353, 0, 1, 1,
0.5087904, 0.7186795, 2.230709, 0.1921569, 0, 1, 1,
0.5095984, 0.2097709, 2.01727, 0.2, 0, 1, 1,
0.5137084, -0.195123, 3.458156, 0.2078431, 0, 1, 1,
0.5202832, -0.974434, 2.592909, 0.2117647, 0, 1, 1,
0.5254138, 1.475704, -0.06834746, 0.2196078, 0, 1, 1,
0.5266755, 0.7555518, 0.3411014, 0.2235294, 0, 1, 1,
0.5279036, 0.3636391, 0.8326913, 0.2313726, 0, 1, 1,
0.5279886, 0.1294449, 3.54934, 0.2352941, 0, 1, 1,
0.5353892, 0.6550053, 2.303887, 0.2431373, 0, 1, 1,
0.5372077, 0.643222, -1.628446, 0.2470588, 0, 1, 1,
0.5374995, -0.8610438, 4.455721, 0.254902, 0, 1, 1,
0.5455815, 0.02223365, 0.3901233, 0.2588235, 0, 1, 1,
0.5531473, 0.6214361, 2.080312, 0.2666667, 0, 1, 1,
0.5690601, -0.3010523, 3.780593, 0.2705882, 0, 1, 1,
0.5716286, 1.076787, 1.598556, 0.2784314, 0, 1, 1,
0.5754712, 0.2756843, 0.2795333, 0.282353, 0, 1, 1,
0.5811046, -1.194713, 2.136182, 0.2901961, 0, 1, 1,
0.5816867, -0.5593691, 1.077551, 0.2941177, 0, 1, 1,
0.585211, 1.956417, -0.5506031, 0.3019608, 0, 1, 1,
0.5882636, -0.5235598, 2.104132, 0.3098039, 0, 1, 1,
0.5885737, -1.727012, 2.466535, 0.3137255, 0, 1, 1,
0.588723, -0.3131102, 3.65819, 0.3215686, 0, 1, 1,
0.5913871, -0.4373757, 0.4703917, 0.3254902, 0, 1, 1,
0.5916744, 0.5008379, -1.084585, 0.3333333, 0, 1, 1,
0.5924342, 0.6040275, 0.3858951, 0.3372549, 0, 1, 1,
0.5949237, 1.512622, -0.09646375, 0.345098, 0, 1, 1,
0.5955833, -1.328903, 1.13781, 0.3490196, 0, 1, 1,
0.5961348, 0.8937238, -0.3712817, 0.3568628, 0, 1, 1,
0.5970914, -0.8543397, 1.696539, 0.3607843, 0, 1, 1,
0.6000289, 0.09782463, 3.236799, 0.3686275, 0, 1, 1,
0.6024054, -0.9829843, 3.536924, 0.372549, 0, 1, 1,
0.605021, -1.759739, 2.895286, 0.3803922, 0, 1, 1,
0.6050869, 0.267879, 1.426089, 0.3843137, 0, 1, 1,
0.6052058, -1.637225, 2.796883, 0.3921569, 0, 1, 1,
0.606093, 0.2401883, 1.562192, 0.3960784, 0, 1, 1,
0.6077728, -0.2898135, 3.393727, 0.4039216, 0, 1, 1,
0.6094203, -0.8883374, 0.9129816, 0.4117647, 0, 1, 1,
0.6110073, 1.727225, 0.724236, 0.4156863, 0, 1, 1,
0.6112447, 1.174503, -0.794122, 0.4235294, 0, 1, 1,
0.6140181, 1.944244, 1.667681, 0.427451, 0, 1, 1,
0.6218141, -0.01112367, 2.109069, 0.4352941, 0, 1, 1,
0.6280615, 1.129793, -0.4083959, 0.4392157, 0, 1, 1,
0.6301635, 0.6384408, 1.222098, 0.4470588, 0, 1, 1,
0.6314939, -1.168543, 3.655234, 0.4509804, 0, 1, 1,
0.6323739, -0.09234273, 0.3031564, 0.4588235, 0, 1, 1,
0.6344818, 1.721182, 0.5484125, 0.4627451, 0, 1, 1,
0.6346494, -0.3425616, 3.997022, 0.4705882, 0, 1, 1,
0.645876, -0.8468262, 0.6213905, 0.4745098, 0, 1, 1,
0.6466432, -0.6647694, 1.833053, 0.4823529, 0, 1, 1,
0.6475631, -0.659446, 1.901011, 0.4862745, 0, 1, 1,
0.6568196, -1.462342, 1.735418, 0.4941176, 0, 1, 1,
0.6576903, 0.3015767, 0.8327415, 0.5019608, 0, 1, 1,
0.6597486, -1.394995, 3.441746, 0.5058824, 0, 1, 1,
0.6685153, 1.416756, 1.137198, 0.5137255, 0, 1, 1,
0.6725057, -0.04425606, 0.9406002, 0.5176471, 0, 1, 1,
0.6767963, -1.598738, 1.26487, 0.5254902, 0, 1, 1,
0.6844963, 0.1550123, 0.798062, 0.5294118, 0, 1, 1,
0.685734, 0.5705892, -2.207122, 0.5372549, 0, 1, 1,
0.6860943, -1.334161, 2.732241, 0.5411765, 0, 1, 1,
0.6873493, -0.9613638, 2.880467, 0.5490196, 0, 1, 1,
0.6912901, 0.772597, 1.067708, 0.5529412, 0, 1, 1,
0.6919469, 0.4355799, 3.186148, 0.5607843, 0, 1, 1,
0.7017366, -1.139651, 2.528165, 0.5647059, 0, 1, 1,
0.7069903, 0.6853204, 0.8671291, 0.572549, 0, 1, 1,
0.7074812, 0.8618916, -0.0474673, 0.5764706, 0, 1, 1,
0.7088317, 2.092275, 0.9234345, 0.5843138, 0, 1, 1,
0.7091205, -0.3855675, 2.152649, 0.5882353, 0, 1, 1,
0.7125208, 0.5356985, 1.919104, 0.5960785, 0, 1, 1,
0.7163724, 1.672538, 1.562066, 0.6039216, 0, 1, 1,
0.7220063, -0.1250865, 2.646217, 0.6078432, 0, 1, 1,
0.7222775, 1.028472, 0.6889129, 0.6156863, 0, 1, 1,
0.7237653, -1.459819, 2.903793, 0.6196079, 0, 1, 1,
0.7250036, -0.38905, 3.127868, 0.627451, 0, 1, 1,
0.7268211, -0.9143759, 2.530184, 0.6313726, 0, 1, 1,
0.7337632, -1.359731, 2.350039, 0.6392157, 0, 1, 1,
0.7367392, 0.02712051, 1.152753, 0.6431373, 0, 1, 1,
0.7424818, -1.584677, 3.779326, 0.6509804, 0, 1, 1,
0.7433258, -0.3983974, 1.315586, 0.654902, 0, 1, 1,
0.7445942, -0.3928062, 3.310438, 0.6627451, 0, 1, 1,
0.7468935, -0.7892234, 2.042684, 0.6666667, 0, 1, 1,
0.74765, -0.5441606, 2.963774, 0.6745098, 0, 1, 1,
0.7635443, 0.2550071, 0.2305463, 0.6784314, 0, 1, 1,
0.7652311, 0.04451348, 1.344827, 0.6862745, 0, 1, 1,
0.7657731, -0.9003175, 3.900402, 0.6901961, 0, 1, 1,
0.7679749, 1.499528, 0.5080038, 0.6980392, 0, 1, 1,
0.7691881, 0.9062547, 1.371255, 0.7058824, 0, 1, 1,
0.7724001, 0.6798213, 0.7151665, 0.7098039, 0, 1, 1,
0.7807054, -0.6013927, 3.74099, 0.7176471, 0, 1, 1,
0.7813487, 0.2909592, 1.964733, 0.7215686, 0, 1, 1,
0.7837534, 0.2577785, -0.000224311, 0.7294118, 0, 1, 1,
0.7884842, 1.35458, -0.6486521, 0.7333333, 0, 1, 1,
0.7920091, 0.1430097, -0.2031092, 0.7411765, 0, 1, 1,
0.8010828, 1.386927, 1.22794, 0.7450981, 0, 1, 1,
0.8014361, -0.6427301, 2.695553, 0.7529412, 0, 1, 1,
0.8057092, -0.1025287, -0.4154623, 0.7568628, 0, 1, 1,
0.8096796, -1.549336, 2.233907, 0.7647059, 0, 1, 1,
0.8127384, -0.004512995, 0.8604505, 0.7686275, 0, 1, 1,
0.8133991, -0.7938628, 2.050452, 0.7764706, 0, 1, 1,
0.8173359, -0.8186805, 0.04633075, 0.7803922, 0, 1, 1,
0.8188623, 0.8475687, 0.9224831, 0.7882353, 0, 1, 1,
0.819348, -0.8234233, 3.625157, 0.7921569, 0, 1, 1,
0.825268, 0.08878752, 2.561546, 0.8, 0, 1, 1,
0.8263807, 0.1455263, 1.749469, 0.8078431, 0, 1, 1,
0.8285294, -0.147614, -0.8773336, 0.8117647, 0, 1, 1,
0.8385814, -0.4350355, 1.276863, 0.8196079, 0, 1, 1,
0.8404386, 0.04152929, 1.503582, 0.8235294, 0, 1, 1,
0.8404847, 0.251113, 0.4409094, 0.8313726, 0, 1, 1,
0.8419912, 0.1890366, 2.552177, 0.8352941, 0, 1, 1,
0.8494258, -0.5480928, 1.386909, 0.8431373, 0, 1, 1,
0.8531965, -0.4769637, 1.529613, 0.8470588, 0, 1, 1,
0.8544481, -0.3795317, 1.459237, 0.854902, 0, 1, 1,
0.8587102, -0.813422, 1.921997, 0.8588235, 0, 1, 1,
0.8596907, -2.784822, 4.002479, 0.8666667, 0, 1, 1,
0.8631132, -1.113001, 2.447258, 0.8705882, 0, 1, 1,
0.8706377, 0.8028291, 1.340168, 0.8784314, 0, 1, 1,
0.8710696, 0.2475711, 2.005069, 0.8823529, 0, 1, 1,
0.872225, 2.175776, 0.6699273, 0.8901961, 0, 1, 1,
0.8723736, -0.06667967, 1.623274, 0.8941177, 0, 1, 1,
0.8770078, -1.307181, 1.570371, 0.9019608, 0, 1, 1,
0.8777765, 1.549453, -1.93821, 0.9098039, 0, 1, 1,
0.880084, 0.3212875, 0.5820279, 0.9137255, 0, 1, 1,
0.8879321, -1.988283, 3.424295, 0.9215686, 0, 1, 1,
0.8919948, 1.857597, 0.3430846, 0.9254902, 0, 1, 1,
0.8988642, 0.7057675, 0.7907088, 0.9333333, 0, 1, 1,
0.9019717, -0.6607177, 2.478595, 0.9372549, 0, 1, 1,
0.9042431, 0.0406323, 0.6355109, 0.945098, 0, 1, 1,
0.9073911, 1.404619, -0.558621, 0.9490196, 0, 1, 1,
0.9097118, -0.3546412, 2.716974, 0.9568627, 0, 1, 1,
0.910947, 0.5900124, 2.249606, 0.9607843, 0, 1, 1,
0.9140562, 1.296264, 0.9375082, 0.9686275, 0, 1, 1,
0.9217308, -1.118886, 3.661011, 0.972549, 0, 1, 1,
0.9262255, -1.350979, 1.503783, 0.9803922, 0, 1, 1,
0.9276034, 0.5668591, 2.19751, 0.9843137, 0, 1, 1,
0.9341677, 0.01614188, 2.377489, 0.9921569, 0, 1, 1,
0.9419078, 0.7547902, 1.369836, 0.9960784, 0, 1, 1,
0.943468, 0.9962763, 1.710207, 1, 0, 0.9960784, 1,
0.9439315, -0.7455319, 3.451587, 1, 0, 0.9882353, 1,
0.9460251, -1.917905, 3.188567, 1, 0, 0.9843137, 1,
0.9558335, -0.4061048, 0.05798892, 1, 0, 0.9764706, 1,
0.9583612, 1.101514, 1.615615, 1, 0, 0.972549, 1,
0.9602796, -1.166662, 2.727841, 1, 0, 0.9647059, 1,
0.9694792, 0.5087264, 0.7278777, 1, 0, 0.9607843, 1,
0.9746255, 0.5123805, 0.5214735, 1, 0, 0.9529412, 1,
0.9766639, -1.599526, 2.491023, 1, 0, 0.9490196, 1,
0.97884, 0.4059681, 0.9965033, 1, 0, 0.9411765, 1,
0.9818309, -1.227317, 2.341878, 1, 0, 0.9372549, 1,
0.9831981, 0.5019396, 1.631102, 1, 0, 0.9294118, 1,
0.9906259, -1.518659, 1.965243, 1, 0, 0.9254902, 1,
1.006056, -0.7560096, 1.208528, 1, 0, 0.9176471, 1,
1.008226, -0.930972, 2.26406, 1, 0, 0.9137255, 1,
1.015415, 0.3019866, 2.414965, 1, 0, 0.9058824, 1,
1.018703, -1.428757, 0.829752, 1, 0, 0.9019608, 1,
1.022676, 0.6013569, -0.3464704, 1, 0, 0.8941177, 1,
1.027372, 2.326354, 0.6195841, 1, 0, 0.8862745, 1,
1.02885, 0.5149028, 2.447289, 1, 0, 0.8823529, 1,
1.029218, 1.880059, 0.4979691, 1, 0, 0.8745098, 1,
1.030229, -0.185891, 3.453724, 1, 0, 0.8705882, 1,
1.036256, 0.1287502, 0.1543346, 1, 0, 0.8627451, 1,
1.039888, -0.6130638, 1.646907, 1, 0, 0.8588235, 1,
1.046254, -1.087232, 4.761707, 1, 0, 0.8509804, 1,
1.049434, 2.150034, -0.08431846, 1, 0, 0.8470588, 1,
1.05582, -0.1883231, 3.007508, 1, 0, 0.8392157, 1,
1.060921, -0.1014605, 3.003186, 1, 0, 0.8352941, 1,
1.075788, -0.6055267, 2.545007, 1, 0, 0.827451, 1,
1.07868, -1.09498, 2.679771, 1, 0, 0.8235294, 1,
1.088097, 0.5148332, 2.422023, 1, 0, 0.8156863, 1,
1.089035, 0.7416484, 0.7281857, 1, 0, 0.8117647, 1,
1.094405, 0.5623607, 1.960066, 1, 0, 0.8039216, 1,
1.110182, -1.239091, 2.792169, 1, 0, 0.7960784, 1,
1.110672, 0.414563, 2.614101, 1, 0, 0.7921569, 1,
1.113709, 1.481837, 1.034993, 1, 0, 0.7843137, 1,
1.117288, 1.256163, 1.784719, 1, 0, 0.7803922, 1,
1.117676, 2.040511, 0.5742637, 1, 0, 0.772549, 1,
1.119238, -0.7891866, 2.473408, 1, 0, 0.7686275, 1,
1.120908, -0.5997374, 0.5334224, 1, 0, 0.7607843, 1,
1.121032, 0.6497913, 1.767029, 1, 0, 0.7568628, 1,
1.132918, -0.1615139, 2.2174, 1, 0, 0.7490196, 1,
1.144285, -0.7245241, 2.666448, 1, 0, 0.7450981, 1,
1.149631, -0.128317, 1.991522, 1, 0, 0.7372549, 1,
1.158665, 0.8299032, -0.349326, 1, 0, 0.7333333, 1,
1.159238, -1.491249, 3.360609, 1, 0, 0.7254902, 1,
1.172388, 0.3072705, 0.9106867, 1, 0, 0.7215686, 1,
1.17443, -0.01873307, 0.5608142, 1, 0, 0.7137255, 1,
1.179943, 0.6491323, 0.3002613, 1, 0, 0.7098039, 1,
1.182988, -0.2084062, 1.928516, 1, 0, 0.7019608, 1,
1.190598, -1.234376, 2.029136, 1, 0, 0.6941177, 1,
1.192157, -0.2862337, 1.5876, 1, 0, 0.6901961, 1,
1.19628, 0.4577354, 2.672158, 1, 0, 0.682353, 1,
1.196834, 0.3202186, 2.54473, 1, 0, 0.6784314, 1,
1.201189, 0.7329615, 1.509149, 1, 0, 0.6705883, 1,
1.202182, 1.438149, 2.383981, 1, 0, 0.6666667, 1,
1.208113, 1.713657, -1.002566, 1, 0, 0.6588235, 1,
1.220713, -1.573707, 2.222962, 1, 0, 0.654902, 1,
1.220831, 0.4200351, 1.523796, 1, 0, 0.6470588, 1,
1.226732, -0.9442486, 2.906333, 1, 0, 0.6431373, 1,
1.22705, 0.3910342, 1.409104, 1, 0, 0.6352941, 1,
1.23634, 1.819305, 0.824977, 1, 0, 0.6313726, 1,
1.237924, 1.984116, 1.483672, 1, 0, 0.6235294, 1,
1.240606, 1.329928, 1.076485, 1, 0, 0.6196079, 1,
1.243457, 1.770135, 1.648971, 1, 0, 0.6117647, 1,
1.25385, 0.7210746, 0.4314794, 1, 0, 0.6078432, 1,
1.254992, 1.069717, 0.7893862, 1, 0, 0.6, 1,
1.25738, -1.469059, 2.093794, 1, 0, 0.5921569, 1,
1.257561, -1.192226, 1.536409, 1, 0, 0.5882353, 1,
1.25832, 0.2429731, -0.4368691, 1, 0, 0.5803922, 1,
1.2609, 0.1010803, 3.218285, 1, 0, 0.5764706, 1,
1.261112, -0.4197375, 1.306074, 1, 0, 0.5686275, 1,
1.270463, 1.908406, 3.173244, 1, 0, 0.5647059, 1,
1.27825, -0.7880813, 2.157543, 1, 0, 0.5568628, 1,
1.280784, 0.5061191, 2.206852, 1, 0, 0.5529412, 1,
1.281069, 1.370702, 0.5669709, 1, 0, 0.5450981, 1,
1.291119, -0.01230076, 1.331756, 1, 0, 0.5411765, 1,
1.294113, -0.2411851, 3.33679, 1, 0, 0.5333334, 1,
1.30844, -1.116212, 3.468964, 1, 0, 0.5294118, 1,
1.321932, -0.235964, 1.307556, 1, 0, 0.5215687, 1,
1.328034, -1.233783, 2.025156, 1, 0, 0.5176471, 1,
1.331645, -1.659089, 5.008321, 1, 0, 0.509804, 1,
1.342644, -0.5843917, 2.647637, 1, 0, 0.5058824, 1,
1.344191, 0.3263959, 0.702544, 1, 0, 0.4980392, 1,
1.345385, -0.4748657, 2.732342, 1, 0, 0.4901961, 1,
1.357359, 0.4184506, 0.770714, 1, 0, 0.4862745, 1,
1.357552, -1.151816, 3.136877, 1, 0, 0.4784314, 1,
1.358693, 0.8336786, 0.8417823, 1, 0, 0.4745098, 1,
1.362491, 0.3871534, 1.317106, 1, 0, 0.4666667, 1,
1.366754, -0.6371119, 1.972697, 1, 0, 0.4627451, 1,
1.369626, -1.711541, 2.66055, 1, 0, 0.454902, 1,
1.371817, -0.9873754, 3.26882, 1, 0, 0.4509804, 1,
1.391254, -0.7750031, 2.383331, 1, 0, 0.4431373, 1,
1.392409, -0.5529171, 3.158321, 1, 0, 0.4392157, 1,
1.404493, -1.033794, 2.337409, 1, 0, 0.4313726, 1,
1.42729, -0.1789763, -0.02917099, 1, 0, 0.427451, 1,
1.448725, 0.9796646, 0.5154684, 1, 0, 0.4196078, 1,
1.452219, -1.670165, 2.388192, 1, 0, 0.4156863, 1,
1.452277, 0.7885607, 1.468666, 1, 0, 0.4078431, 1,
1.467747, 1.932625, 0.4715037, 1, 0, 0.4039216, 1,
1.471053, -1.017429, 0.4897065, 1, 0, 0.3960784, 1,
1.472963, -1.111815, 4.252745, 1, 0, 0.3882353, 1,
1.494628, 1.207653, 0.1801281, 1, 0, 0.3843137, 1,
1.504143, -0.02638168, 1.961206, 1, 0, 0.3764706, 1,
1.510314, -1.159782, 0.9377828, 1, 0, 0.372549, 1,
1.514318, 0.9864855, 0.9861389, 1, 0, 0.3647059, 1,
1.525914, -1.182286, 2.36274, 1, 0, 0.3607843, 1,
1.530913, 0.5202999, -0.277216, 1, 0, 0.3529412, 1,
1.534163, -0.3669609, 2.09143, 1, 0, 0.3490196, 1,
1.549135, -0.1237181, 0.8075879, 1, 0, 0.3411765, 1,
1.549694, -1.35532, 2.283769, 1, 0, 0.3372549, 1,
1.552703, 0.400117, 2.204961, 1, 0, 0.3294118, 1,
1.562263, -1.045971, 1.164997, 1, 0, 0.3254902, 1,
1.562747, 1.116358, 2.232557, 1, 0, 0.3176471, 1,
1.603742, -0.3930937, 0.637301, 1, 0, 0.3137255, 1,
1.606538, -0.8030634, 2.592974, 1, 0, 0.3058824, 1,
1.620436, -0.1748904, 1.706434, 1, 0, 0.2980392, 1,
1.638767, 0.09947856, 1.076735, 1, 0, 0.2941177, 1,
1.648243, -0.2154857, 2.38536, 1, 0, 0.2862745, 1,
1.659974, 1.452557, -0.1883966, 1, 0, 0.282353, 1,
1.67571, 0.1404555, 1.816558, 1, 0, 0.2745098, 1,
1.679181, 0.0279295, 0.8313124, 1, 0, 0.2705882, 1,
1.691539, -1.263344, 3.743271, 1, 0, 0.2627451, 1,
1.713443, 0.8379121, 1.062635, 1, 0, 0.2588235, 1,
1.719497, -0.1526166, 4.617735, 1, 0, 0.2509804, 1,
1.722727, -1.30804, 1.366308, 1, 0, 0.2470588, 1,
1.736021, -1.615917, 1.711876, 1, 0, 0.2392157, 1,
1.736337, 1.887671, 1.554589, 1, 0, 0.2352941, 1,
1.741343, 0.1078793, 4.210489, 1, 0, 0.227451, 1,
1.749223, 1.174557, 2.382707, 1, 0, 0.2235294, 1,
1.75356, -1.883662, 1.551851, 1, 0, 0.2156863, 1,
1.777322, -0.3019957, 2.776545, 1, 0, 0.2117647, 1,
1.790743, 0.718192, 1.554325, 1, 0, 0.2039216, 1,
1.81395, -0.6002368, 2.508125, 1, 0, 0.1960784, 1,
1.821149, -0.9239447, -0.8239232, 1, 0, 0.1921569, 1,
1.830316, 0.5234512, 1.49739, 1, 0, 0.1843137, 1,
1.830323, -0.5574766, 3.046404, 1, 0, 0.1803922, 1,
1.846212, 1.272879, 0.878313, 1, 0, 0.172549, 1,
1.855379, -0.186914, 3.773485, 1, 0, 0.1686275, 1,
1.857013, 1.856085, 0.08664411, 1, 0, 0.1607843, 1,
1.862543, 2.615871, -0.4840714, 1, 0, 0.1568628, 1,
1.879203, 1.351874, 0.8768877, 1, 0, 0.1490196, 1,
1.892233, 0.5627673, 0.9139891, 1, 0, 0.145098, 1,
1.903386, -0.7897515, 1.426103, 1, 0, 0.1372549, 1,
1.925758, -1.980601, 4.176976, 1, 0, 0.1333333, 1,
1.935125, 1.569484, 0.7597933, 1, 0, 0.1254902, 1,
1.943015, -0.04310877, 0.5617133, 1, 0, 0.1215686, 1,
1.96576, -1.07514, 2.181725, 1, 0, 0.1137255, 1,
1.974442, 0.5069838, 1.190686, 1, 0, 0.1098039, 1,
1.977933, -1.350218, 3.255685, 1, 0, 0.1019608, 1,
2.030936, -2.424104, 1.71793, 1, 0, 0.09411765, 1,
2.03407, -1.015638, 2.263532, 1, 0, 0.09019608, 1,
2.053974, -0.564742, 0.9879905, 1, 0, 0.08235294, 1,
2.137562, -0.2448262, 0.9120319, 1, 0, 0.07843138, 1,
2.19366, -1.032235, 0.4333269, 1, 0, 0.07058824, 1,
2.200773, 0.00996781, 1.318062, 1, 0, 0.06666667, 1,
2.335616, -0.5027401, 1.228743, 1, 0, 0.05882353, 1,
2.389428, -0.8161278, 2.145687, 1, 0, 0.05490196, 1,
2.553904, 1.12325, 0.9086947, 1, 0, 0.04705882, 1,
2.600435, -0.3230199, 0.4129075, 1, 0, 0.04313726, 1,
2.672389, -0.9096386, 0.8592911, 1, 0, 0.03529412, 1,
2.718816, 1.143941, 1.680254, 1, 0, 0.03137255, 1,
2.733859, -0.329048, 3.035562, 1, 0, 0.02352941, 1,
2.823427, -0.589581, 4.587389, 1, 0, 0.01960784, 1,
2.867706, -0.9330106, -0.2507399, 1, 0, 0.01176471, 1,
3.617036, 1.029747, 1.720916, 1, 0, 0.007843138, 1
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
0.146789, -5.071675, -6.576833, 0, -0.5, 0.5, 0.5,
0.146789, -5.071675, -6.576833, 1, -0.5, 0.5, 0.5,
0.146789, -5.071675, -6.576833, 1, 1.5, 0.5, 0.5,
0.146789, -5.071675, -6.576833, 0, 1.5, 0.5, 0.5
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
-4.499871, -0.4416912, -6.576833, 0, -0.5, 0.5, 0.5,
-4.499871, -0.4416912, -6.576833, 1, -0.5, 0.5, 0.5,
-4.499871, -0.4416912, -6.576833, 1, 1.5, 0.5, 0.5,
-4.499871, -0.4416912, -6.576833, 0, 1.5, 0.5, 0.5
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
-4.499871, -5.071675, 0.258101, 0, -0.5, 0.5, 0.5,
-4.499871, -5.071675, 0.258101, 1, -0.5, 0.5, 0.5,
-4.499871, -5.071675, 0.258101, 1, 1.5, 0.5, 0.5,
-4.499871, -5.071675, 0.258101, 0, 1.5, 0.5, 0.5
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
-3, -4.003217, -4.999541,
3, -4.003217, -4.999541,
-3, -4.003217, -4.999541,
-3, -4.181293, -5.262423,
-2, -4.003217, -4.999541,
-2, -4.181293, -5.262423,
-1, -4.003217, -4.999541,
-1, -4.181293, -5.262423,
0, -4.003217, -4.999541,
0, -4.181293, -5.262423,
1, -4.003217, -4.999541,
1, -4.181293, -5.262423,
2, -4.003217, -4.999541,
2, -4.181293, -5.262423,
3, -4.003217, -4.999541,
3, -4.181293, -5.262423
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
-3, -4.537446, -5.788187, 0, -0.5, 0.5, 0.5,
-3, -4.537446, -5.788187, 1, -0.5, 0.5, 0.5,
-3, -4.537446, -5.788187, 1, 1.5, 0.5, 0.5,
-3, -4.537446, -5.788187, 0, 1.5, 0.5, 0.5,
-2, -4.537446, -5.788187, 0, -0.5, 0.5, 0.5,
-2, -4.537446, -5.788187, 1, -0.5, 0.5, 0.5,
-2, -4.537446, -5.788187, 1, 1.5, 0.5, 0.5,
-2, -4.537446, -5.788187, 0, 1.5, 0.5, 0.5,
-1, -4.537446, -5.788187, 0, -0.5, 0.5, 0.5,
-1, -4.537446, -5.788187, 1, -0.5, 0.5, 0.5,
-1, -4.537446, -5.788187, 1, 1.5, 0.5, 0.5,
-1, -4.537446, -5.788187, 0, 1.5, 0.5, 0.5,
0, -4.537446, -5.788187, 0, -0.5, 0.5, 0.5,
0, -4.537446, -5.788187, 1, -0.5, 0.5, 0.5,
0, -4.537446, -5.788187, 1, 1.5, 0.5, 0.5,
0, -4.537446, -5.788187, 0, 1.5, 0.5, 0.5,
1, -4.537446, -5.788187, 0, -0.5, 0.5, 0.5,
1, -4.537446, -5.788187, 1, -0.5, 0.5, 0.5,
1, -4.537446, -5.788187, 1, 1.5, 0.5, 0.5,
1, -4.537446, -5.788187, 0, 1.5, 0.5, 0.5,
2, -4.537446, -5.788187, 0, -0.5, 0.5, 0.5,
2, -4.537446, -5.788187, 1, -0.5, 0.5, 0.5,
2, -4.537446, -5.788187, 1, 1.5, 0.5, 0.5,
2, -4.537446, -5.788187, 0, 1.5, 0.5, 0.5,
3, -4.537446, -5.788187, 0, -0.5, 0.5, 0.5,
3, -4.537446, -5.788187, 1, -0.5, 0.5, 0.5,
3, -4.537446, -5.788187, 1, 1.5, 0.5, 0.5,
3, -4.537446, -5.788187, 0, 1.5, 0.5, 0.5
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
-3.427565, -3, -4.999541,
-3.427565, 3, -4.999541,
-3.427565, -3, -4.999541,
-3.606283, -3, -5.262423,
-3.427565, -2, -4.999541,
-3.606283, -2, -5.262423,
-3.427565, -1, -4.999541,
-3.606283, -1, -5.262423,
-3.427565, 0, -4.999541,
-3.606283, 0, -5.262423,
-3.427565, 1, -4.999541,
-3.606283, 1, -5.262423,
-3.427565, 2, -4.999541,
-3.606283, 2, -5.262423,
-3.427565, 3, -4.999541,
-3.606283, 3, -5.262423
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
-3.963718, -3, -5.788187, 0, -0.5, 0.5, 0.5,
-3.963718, -3, -5.788187, 1, -0.5, 0.5, 0.5,
-3.963718, -3, -5.788187, 1, 1.5, 0.5, 0.5,
-3.963718, -3, -5.788187, 0, 1.5, 0.5, 0.5,
-3.963718, -2, -5.788187, 0, -0.5, 0.5, 0.5,
-3.963718, -2, -5.788187, 1, -0.5, 0.5, 0.5,
-3.963718, -2, -5.788187, 1, 1.5, 0.5, 0.5,
-3.963718, -2, -5.788187, 0, 1.5, 0.5, 0.5,
-3.963718, -1, -5.788187, 0, -0.5, 0.5, 0.5,
-3.963718, -1, -5.788187, 1, -0.5, 0.5, 0.5,
-3.963718, -1, -5.788187, 1, 1.5, 0.5, 0.5,
-3.963718, -1, -5.788187, 0, 1.5, 0.5, 0.5,
-3.963718, 0, -5.788187, 0, -0.5, 0.5, 0.5,
-3.963718, 0, -5.788187, 1, -0.5, 0.5, 0.5,
-3.963718, 0, -5.788187, 1, 1.5, 0.5, 0.5,
-3.963718, 0, -5.788187, 0, 1.5, 0.5, 0.5,
-3.963718, 1, -5.788187, 0, -0.5, 0.5, 0.5,
-3.963718, 1, -5.788187, 1, -0.5, 0.5, 0.5,
-3.963718, 1, -5.788187, 1, 1.5, 0.5, 0.5,
-3.963718, 1, -5.788187, 0, 1.5, 0.5, 0.5,
-3.963718, 2, -5.788187, 0, -0.5, 0.5, 0.5,
-3.963718, 2, -5.788187, 1, -0.5, 0.5, 0.5,
-3.963718, 2, -5.788187, 1, 1.5, 0.5, 0.5,
-3.963718, 2, -5.788187, 0, 1.5, 0.5, 0.5,
-3.963718, 3, -5.788187, 0, -0.5, 0.5, 0.5,
-3.963718, 3, -5.788187, 1, -0.5, 0.5, 0.5,
-3.963718, 3, -5.788187, 1, 1.5, 0.5, 0.5,
-3.963718, 3, -5.788187, 0, 1.5, 0.5, 0.5
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
-3.427565, -4.003217, -4,
-3.427565, -4.003217, 4,
-3.427565, -4.003217, -4,
-3.606283, -4.181293, -4,
-3.427565, -4.003217, -2,
-3.606283, -4.181293, -2,
-3.427565, -4.003217, 0,
-3.606283, -4.181293, 0,
-3.427565, -4.003217, 2,
-3.606283, -4.181293, 2,
-3.427565, -4.003217, 4,
-3.606283, -4.181293, 4
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
-3.963718, -4.537446, -4, 0, -0.5, 0.5, 0.5,
-3.963718, -4.537446, -4, 1, -0.5, 0.5, 0.5,
-3.963718, -4.537446, -4, 1, 1.5, 0.5, 0.5,
-3.963718, -4.537446, -4, 0, 1.5, 0.5, 0.5,
-3.963718, -4.537446, -2, 0, -0.5, 0.5, 0.5,
-3.963718, -4.537446, -2, 1, -0.5, 0.5, 0.5,
-3.963718, -4.537446, -2, 1, 1.5, 0.5, 0.5,
-3.963718, -4.537446, -2, 0, 1.5, 0.5, 0.5,
-3.963718, -4.537446, 0, 0, -0.5, 0.5, 0.5,
-3.963718, -4.537446, 0, 1, -0.5, 0.5, 0.5,
-3.963718, -4.537446, 0, 1, 1.5, 0.5, 0.5,
-3.963718, -4.537446, 0, 0, 1.5, 0.5, 0.5,
-3.963718, -4.537446, 2, 0, -0.5, 0.5, 0.5,
-3.963718, -4.537446, 2, 1, -0.5, 0.5, 0.5,
-3.963718, -4.537446, 2, 1, 1.5, 0.5, 0.5,
-3.963718, -4.537446, 2, 0, 1.5, 0.5, 0.5,
-3.963718, -4.537446, 4, 0, -0.5, 0.5, 0.5,
-3.963718, -4.537446, 4, 1, -0.5, 0.5, 0.5,
-3.963718, -4.537446, 4, 1, 1.5, 0.5, 0.5,
-3.963718, -4.537446, 4, 0, 1.5, 0.5, 0.5
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
-3.427565, -4.003217, -4.999541,
-3.427565, 3.119835, -4.999541,
-3.427565, -4.003217, 5.515743,
-3.427565, 3.119835, 5.515743,
-3.427565, -4.003217, -4.999541,
-3.427565, -4.003217, 5.515743,
-3.427565, 3.119835, -4.999541,
-3.427565, 3.119835, 5.515743,
-3.427565, -4.003217, -4.999541,
3.721143, -4.003217, -4.999541,
-3.427565, -4.003217, 5.515743,
3.721143, -4.003217, 5.515743,
-3.427565, 3.119835, -4.999541,
3.721143, 3.119835, -4.999541,
-3.427565, 3.119835, 5.515743,
3.721143, 3.119835, 5.515743,
3.721143, -4.003217, -4.999541,
3.721143, 3.119835, -4.999541,
3.721143, -4.003217, 5.515743,
3.721143, 3.119835, 5.515743,
3.721143, -4.003217, -4.999541,
3.721143, -4.003217, 5.515743,
3.721143, 3.119835, -4.999541,
3.721143, 3.119835, 5.515743
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
var radius = 7.782446;
var distance = 34.62498;
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
mvMatrix.translate( -0.146789, 0.4416912, -0.258101 );
mvMatrix.scale( 1.17707, 1.18131, 0.8002193 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.62498);
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
Tribenuron-methyl<-read.table("Tribenuron-methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Tribenuron-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Tribenuron' not found
```

```r
y<-Tribenuron-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Tribenuron' not found
```

```r
z<-Tribenuron-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Tribenuron' not found
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
-3.323458, 0.644831, -1.397187, 0, 0, 1, 1, 1,
-2.702667, -1.178105, -1.46968, 1, 0, 0, 1, 1,
-2.63924, 0.4120599, -1.456427, 1, 0, 0, 1, 1,
-2.590662, -1.062395, -2.741956, 1, 0, 0, 1, 1,
-2.551193, -0.6877049, -1.763859, 1, 0, 0, 1, 1,
-2.460931, 0.5464593, -1.753358, 1, 0, 0, 1, 1,
-2.444908, -0.9903865, -1.700298, 0, 0, 0, 1, 1,
-2.441817, 0.5836812, -1.131736, 0, 0, 0, 1, 1,
-2.404305, 0.3196173, -2.778461, 0, 0, 0, 1, 1,
-2.305465, 0.272351, -0.2544338, 0, 0, 0, 1, 1,
-2.210869, 1.812573, -3.68867, 0, 0, 0, 1, 1,
-2.196941, -0.483776, -1.9842, 0, 0, 0, 1, 1,
-2.185726, 1.11644, -0.3103137, 0, 0, 0, 1, 1,
-2.156052, -0.7551398, -2.556958, 1, 1, 1, 1, 1,
-2.152627, 0.7642436, -2.120392, 1, 1, 1, 1, 1,
-2.116548, 0.426263, -2.139782, 1, 1, 1, 1, 1,
-2.110116, 0.2231294, -1.548088, 1, 1, 1, 1, 1,
-2.108228, -2.048484, -0.8655812, 1, 1, 1, 1, 1,
-2.088181, 0.1890363, -0.1973421, 1, 1, 1, 1, 1,
-2.085427, 1.8967, 0.009663196, 1, 1, 1, 1, 1,
-2.051169, -0.9422043, -1.01881, 1, 1, 1, 1, 1,
-2.032828, -1.206457, -3.271658, 1, 1, 1, 1, 1,
-2.010729, -0.3872864, -2.048187, 1, 1, 1, 1, 1,
-1.9834, -1.19231, -1.197053, 1, 1, 1, 1, 1,
-1.978062, -0.2225703, -0.5439423, 1, 1, 1, 1, 1,
-1.975969, -0.4371582, -0.1521074, 1, 1, 1, 1, 1,
-1.938416, -1.66106, -2.413603, 1, 1, 1, 1, 1,
-1.926908, -0.1294817, -1.395625, 1, 1, 1, 1, 1,
-1.926908, -3.899483, -4.049918, 0, 0, 1, 1, 1,
-1.900024, 3.016101, -2.165991, 1, 0, 0, 1, 1,
-1.87135, -0.3110785, -0.1086226, 1, 0, 0, 1, 1,
-1.865186, -0.5274248, 0.4674816, 1, 0, 0, 1, 1,
-1.838465, -0.02536557, -1.211977, 1, 0, 0, 1, 1,
-1.834275, 1.440737, -2.252666, 1, 0, 0, 1, 1,
-1.829779, -1.017498, -2.157777, 0, 0, 0, 1, 1,
-1.825558, 1.563793, -0.05050695, 0, 0, 0, 1, 1,
-1.824337, 0.6349483, -2.571529, 0, 0, 0, 1, 1,
-1.823877, -1.756368, -1.925614, 0, 0, 0, 1, 1,
-1.817866, 0.6645069, -1.818133, 0, 0, 0, 1, 1,
-1.792776, -0.4320721, -0.9333364, 0, 0, 0, 1, 1,
-1.755789, -1.493557, -2.534554, 0, 0, 0, 1, 1,
-1.745492, 0.159753, -2.483047, 1, 1, 1, 1, 1,
-1.740861, -0.4525359, -0.4654254, 1, 1, 1, 1, 1,
-1.736984, 1.295633, -0.2620428, 1, 1, 1, 1, 1,
-1.711868, -1.122721, -1.652729, 1, 1, 1, 1, 1,
-1.674516, -0.09012628, -2.70421, 1, 1, 1, 1, 1,
-1.664701, -2.997857, -2.524075, 1, 1, 1, 1, 1,
-1.649992, 0.8903384, -0.477319, 1, 1, 1, 1, 1,
-1.6468, -0.3471969, -1.553757, 1, 1, 1, 1, 1,
-1.639727, 0.5508606, 0.2197159, 1, 1, 1, 1, 1,
-1.627796, 1.45361, 0.1806826, 1, 1, 1, 1, 1,
-1.618629, 1.372241, -1.44611, 1, 1, 1, 1, 1,
-1.615721, 0.236692, -2.086281, 1, 1, 1, 1, 1,
-1.61161, 1.079246, -1.167472, 1, 1, 1, 1, 1,
-1.607082, -0.568814, -2.403929, 1, 1, 1, 1, 1,
-1.605481, 0.3938738, 0.8166883, 1, 1, 1, 1, 1,
-1.604233, -0.5347024, -1.613823, 0, 0, 1, 1, 1,
-1.587863, -1.390967, -1.126106, 1, 0, 0, 1, 1,
-1.586959, 2.144982, -0.130541, 1, 0, 0, 1, 1,
-1.586861, -0.8760118, 0.1308748, 1, 0, 0, 1, 1,
-1.58488, -1.080804, -0.7762743, 1, 0, 0, 1, 1,
-1.575939, -1.710104, -3.0445, 1, 0, 0, 1, 1,
-1.5667, -0.07985751, -1.09535, 0, 0, 0, 1, 1,
-1.553561, -0.8292122, -2.785953, 0, 0, 0, 1, 1,
-1.543208, -0.03699991, -0.3484407, 0, 0, 0, 1, 1,
-1.538943, -1.826223, -3.14695, 0, 0, 0, 1, 1,
-1.537368, 1.967724, -1.455984, 0, 0, 0, 1, 1,
-1.536597, 1.356675, -0.7863384, 0, 0, 0, 1, 1,
-1.51744, 0.8700626, -0.659836, 0, 0, 0, 1, 1,
-1.501301, -0.7590955, -2.571974, 1, 1, 1, 1, 1,
-1.485142, 1.393086, -1.094707, 1, 1, 1, 1, 1,
-1.478925, 1.208912, -1.46072, 1, 1, 1, 1, 1,
-1.470475, -0.756954, -1.133368, 1, 1, 1, 1, 1,
-1.462629, 1.046083, -0.766371, 1, 1, 1, 1, 1,
-1.447509, 2.497259, 0.6322113, 1, 1, 1, 1, 1,
-1.433009, -0.04516369, -0.6156371, 1, 1, 1, 1, 1,
-1.429106, -2.140656, -1.857148, 1, 1, 1, 1, 1,
-1.421041, -0.4694809, -0.7830777, 1, 1, 1, 1, 1,
-1.416649, 0.134245, -2.321821, 1, 1, 1, 1, 1,
-1.405644, 0.7160189, -0.9637768, 1, 1, 1, 1, 1,
-1.385794, 0.8421837, -2.040008, 1, 1, 1, 1, 1,
-1.383281, -0.609426, -2.197747, 1, 1, 1, 1, 1,
-1.375867, 0.4676834, -1.089072, 1, 1, 1, 1, 1,
-1.36985, -1.554203, -2.286743, 1, 1, 1, 1, 1,
-1.362432, -1.635546, -3.522606, 0, 0, 1, 1, 1,
-1.35693, 1.439378, -1.238402, 1, 0, 0, 1, 1,
-1.353101, -0.3994448, -1.207397, 1, 0, 0, 1, 1,
-1.343616, -1.864823, -0.7563884, 1, 0, 0, 1, 1,
-1.317172, -0.4244114, -1.37001, 1, 0, 0, 1, 1,
-1.314324, 0.5987755, -0.7856088, 1, 0, 0, 1, 1,
-1.314154, -0.9461987, -2.05954, 0, 0, 0, 1, 1,
-1.311855, 0.521348, -1.245021, 0, 0, 0, 1, 1,
-1.311815, -2.107668, -1.869047, 0, 0, 0, 1, 1,
-1.309173, -0.8672406, -2.584036, 0, 0, 0, 1, 1,
-1.306725, -0.8374804, -0.2150005, 0, 0, 0, 1, 1,
-1.291958, 0.0849522, 0.202442, 0, 0, 0, 1, 1,
-1.288308, -0.1509955, -1.072864, 0, 0, 0, 1, 1,
-1.261069, 0.9755718, -0.1039542, 1, 1, 1, 1, 1,
-1.254252, -0.9007003, -3.664646, 1, 1, 1, 1, 1,
-1.252526, 1.418442, -1.525772, 1, 1, 1, 1, 1,
-1.251424, -0.2571293, -1.979594, 1, 1, 1, 1, 1,
-1.251252, 0.2189106, -1.305174, 1, 1, 1, 1, 1,
-1.250968, 1.804051, -1.765178, 1, 1, 1, 1, 1,
-1.24902, 0.4500338, 1.082923, 1, 1, 1, 1, 1,
-1.247749, 0.3343882, -0.9467543, 1, 1, 1, 1, 1,
-1.241858, -0.1039949, -0.8392849, 1, 1, 1, 1, 1,
-1.234892, 1.112934, -2.332865, 1, 1, 1, 1, 1,
-1.23315, -0.7104861, -1.511447, 1, 1, 1, 1, 1,
-1.217538, 0.853516, 0.3320754, 1, 1, 1, 1, 1,
-1.21179, -0.270292, -2.022598, 1, 1, 1, 1, 1,
-1.211386, -0.6156421, -0.7485564, 1, 1, 1, 1, 1,
-1.206421, 0.2843251, -1.910502, 1, 1, 1, 1, 1,
-1.206235, -1.071284, -2.759965, 0, 0, 1, 1, 1,
-1.200127, 2.029746, -2.12141, 1, 0, 0, 1, 1,
-1.197828, -2.135553, -3.062099, 1, 0, 0, 1, 1,
-1.194011, 0.9506999, -0.2423256, 1, 0, 0, 1, 1,
-1.169623, -1.444442, -2.177714, 1, 0, 0, 1, 1,
-1.16883, -0.6856912, -0.8873328, 1, 0, 0, 1, 1,
-1.156443, 0.1406744, -3.226434, 0, 0, 0, 1, 1,
-1.146832, 0.8818337, -0.5732892, 0, 0, 0, 1, 1,
-1.14607, -1.131614, -2.362778, 0, 0, 0, 1, 1,
-1.142066, 1.352189, -0.05119614, 0, 0, 0, 1, 1,
-1.132503, 0.6893623, -1.454179, 0, 0, 0, 1, 1,
-1.128275, 1.09381, -1.327326, 0, 0, 0, 1, 1,
-1.126163, 0.6456336, -0.6797865, 0, 0, 0, 1, 1,
-1.122928, 0.6371089, 0.3007237, 1, 1, 1, 1, 1,
-1.120695, 0.442433, -1.686727, 1, 1, 1, 1, 1,
-1.120176, -0.136641, -2.293519, 1, 1, 1, 1, 1,
-1.116825, 1.079093, 0.02818386, 1, 1, 1, 1, 1,
-1.116555, 1.659562, -1.88308, 1, 1, 1, 1, 1,
-1.11008, 0.03012181, -2.387034, 1, 1, 1, 1, 1,
-1.107684, 1.992563, -0.07807492, 1, 1, 1, 1, 1,
-1.103355, 0.8049643, -1.703441, 1, 1, 1, 1, 1,
-1.09439, -0.1423637, -0.8669254, 1, 1, 1, 1, 1,
-1.093078, -0.3015874, -2.301758, 1, 1, 1, 1, 1,
-1.086008, 0.5684446, -0.4966851, 1, 1, 1, 1, 1,
-1.082521, -0.1287323, -1.272565, 1, 1, 1, 1, 1,
-1.075344, 0.7440683, -1.084825, 1, 1, 1, 1, 1,
-1.075146, 0.5014186, -2.300391, 1, 1, 1, 1, 1,
-1.074093, 2.220086, -0.6089534, 1, 1, 1, 1, 1,
-1.066357, 0.411423, -0.7949173, 0, 0, 1, 1, 1,
-1.058531, -0.6662474, -0.2108476, 1, 0, 0, 1, 1,
-1.055947, 1.3702, -1.964938, 1, 0, 0, 1, 1,
-1.054216, -1.099157, -1.853448, 1, 0, 0, 1, 1,
-1.053805, 1.04189, -0.5273969, 1, 0, 0, 1, 1,
-1.050846, -0.7021913, -1.072126, 1, 0, 0, 1, 1,
-1.050683, 0.4827471, -2.021075, 0, 0, 0, 1, 1,
-1.041616, 0.02525422, 0.2454524, 0, 0, 0, 1, 1,
-1.041056, -0.2261007, -1.325309, 0, 0, 0, 1, 1,
-1.036622, 0.3627013, -1.935281, 0, 0, 0, 1, 1,
-1.031044, 1.67004, -0.702561, 0, 0, 0, 1, 1,
-1.018622, -0.3905792, -1.586853, 0, 0, 0, 1, 1,
-1.018415, -2.339934, -2.321199, 0, 0, 0, 1, 1,
-1.013612, -0.756049, -1.842096, 1, 1, 1, 1, 1,
-1.002182, 1.361798, -0.1645145, 1, 1, 1, 1, 1,
-0.9987513, 1.234086, -1.627596, 1, 1, 1, 1, 1,
-0.9969006, 0.2282416, 0.3504703, 1, 1, 1, 1, 1,
-0.9867377, -1.321184, -3.175194, 1, 1, 1, 1, 1,
-0.9828278, -0.5306734, -2.138006, 1, 1, 1, 1, 1,
-0.9793183, 1.945224, -1.198334, 1, 1, 1, 1, 1,
-0.9777341, 1.098713, 0.1707952, 1, 1, 1, 1, 1,
-0.9769679, 0.7636596, -0.715003, 1, 1, 1, 1, 1,
-0.9714581, 1.421109, -1.86851, 1, 1, 1, 1, 1,
-0.9645519, -0.2676618, -1.701786, 1, 1, 1, 1, 1,
-0.9596155, 0.6690897, -0.5800442, 1, 1, 1, 1, 1,
-0.9517608, -3.117897, -2.286682, 1, 1, 1, 1, 1,
-0.9504529, 0.5586721, 0.4257833, 1, 1, 1, 1, 1,
-0.9475413, 0.377203, -2.22481, 1, 1, 1, 1, 1,
-0.9422747, 1.298892, -0.8171884, 0, 0, 1, 1, 1,
-0.9393151, 0.8738321, -0.05753865, 1, 0, 0, 1, 1,
-0.9376764, -1.344304, -1.826205, 1, 0, 0, 1, 1,
-0.9352462, -0.5569364, -1.911558, 1, 0, 0, 1, 1,
-0.9275045, 0.722135, -0.3650186, 1, 0, 0, 1, 1,
-0.9272164, -0.1866884, -2.329234, 1, 0, 0, 1, 1,
-0.923825, 0.2805525, -0.5962577, 0, 0, 0, 1, 1,
-0.9238067, 0.1259704, 0.07647578, 0, 0, 0, 1, 1,
-0.9180235, -2.393117, -1.66687, 0, 0, 0, 1, 1,
-0.9167147, 1.829771, -0.6696445, 0, 0, 0, 1, 1,
-0.914503, -1.572589, -1.989897, 0, 0, 0, 1, 1,
-0.9095179, -0.1296755, -1.184399, 0, 0, 0, 1, 1,
-0.9079726, -0.4866426, -2.533192, 0, 0, 0, 1, 1,
-0.8898029, 0.08665375, -0.7393568, 1, 1, 1, 1, 1,
-0.8700452, -1.529915, -2.380393, 1, 1, 1, 1, 1,
-0.8678769, 0.3688647, -1.973236, 1, 1, 1, 1, 1,
-0.8677226, -1.550321, -3.185935, 1, 1, 1, 1, 1,
-0.866875, 0.6353186, -0.09975896, 1, 1, 1, 1, 1,
-0.8572276, -1.11531, -3.308586, 1, 1, 1, 1, 1,
-0.8515195, -0.589098, -2.412141, 1, 1, 1, 1, 1,
-0.8478577, -1.069306, -2.697015, 1, 1, 1, 1, 1,
-0.8330874, 1.261137, -0.5656062, 1, 1, 1, 1, 1,
-0.8313629, -1.255385, -3.489031, 1, 1, 1, 1, 1,
-0.8257873, 0.1593068, -0.3019548, 1, 1, 1, 1, 1,
-0.8241277, 0.9605266, -0.8311081, 1, 1, 1, 1, 1,
-0.821358, 0.09199005, 0.1646947, 1, 1, 1, 1, 1,
-0.8174646, -1.071214, -2.824673, 1, 1, 1, 1, 1,
-0.8154432, 0.7702879, -1.927581, 1, 1, 1, 1, 1,
-0.8140161, 0.9022496, -1.7889, 0, 0, 1, 1, 1,
-0.8139458, -0.5958511, -3.636105, 1, 0, 0, 1, 1,
-0.8107135, -0.19235, -3.214493, 1, 0, 0, 1, 1,
-0.8104679, -1.244547, -2.82241, 1, 0, 0, 1, 1,
-0.8033496, -0.006537076, -1.955489, 1, 0, 0, 1, 1,
-0.7997894, 1.164196, 0.2195649, 1, 0, 0, 1, 1,
-0.797709, 1.714785, 0.4209462, 0, 0, 0, 1, 1,
-0.7966262, -1.267205, -2.279975, 0, 0, 0, 1, 1,
-0.7934467, 1.321694, -0.3016621, 0, 0, 0, 1, 1,
-0.7926397, 0.8452142, -0.9404801, 0, 0, 0, 1, 1,
-0.776588, 0.1724192, -1.609103, 0, 0, 0, 1, 1,
-0.7751402, -0.5263456, -1.24184, 0, 0, 0, 1, 1,
-0.7721916, -1.239597, -2.097554, 0, 0, 0, 1, 1,
-0.7670379, -1.780442, -4.15447, 1, 1, 1, 1, 1,
-0.7660042, 1.587306, 1.49625, 1, 1, 1, 1, 1,
-0.7646592, -0.1933095, -1.818625, 1, 1, 1, 1, 1,
-0.7629872, -0.4483197, -0.6072329, 1, 1, 1, 1, 1,
-0.7574133, 0.2008855, -1.393909, 1, 1, 1, 1, 1,
-0.7571138, 0.7991178, -2.089288, 1, 1, 1, 1, 1,
-0.7559565, 0.6935634, -0.3166418, 1, 1, 1, 1, 1,
-0.7548906, -0.6381835, -2.569337, 1, 1, 1, 1, 1,
-0.7470498, 0.4134241, -2.266401, 1, 1, 1, 1, 1,
-0.7464552, -0.3030379, -1.355907, 1, 1, 1, 1, 1,
-0.7436025, -0.2342936, -2.248847, 1, 1, 1, 1, 1,
-0.740953, -0.52685, -1.915585, 1, 1, 1, 1, 1,
-0.7406952, -0.077957, -2.312773, 1, 1, 1, 1, 1,
-0.7399858, 0.4556827, -3.60747, 1, 1, 1, 1, 1,
-0.7307103, 0.1993656, -1.165814, 1, 1, 1, 1, 1,
-0.7293741, -0.5819392, -2.115262, 0, 0, 1, 1, 1,
-0.7231334, 1.223773, -1.281408, 1, 0, 0, 1, 1,
-0.7196354, 0.01280159, -1.92312, 1, 0, 0, 1, 1,
-0.7192472, 1.46461, -1.38901, 1, 0, 0, 1, 1,
-0.7171649, 0.1543855, -1.749465, 1, 0, 0, 1, 1,
-0.7167641, 0.4189637, -0.5618684, 1, 0, 0, 1, 1,
-0.7119797, -1.424847, -2.58424, 0, 0, 0, 1, 1,
-0.7092173, 1.001397, -1.659265, 0, 0, 0, 1, 1,
-0.7086303, -0.3028125, -3.899963, 0, 0, 0, 1, 1,
-0.7084672, -1.907946, -2.936592, 0, 0, 0, 1, 1,
-0.7038548, -0.4470882, -2.93192, 0, 0, 0, 1, 1,
-0.6990554, 1.181267, 0.4859827, 0, 0, 0, 1, 1,
-0.6958982, -0.6451483, -3.6089, 0, 0, 0, 1, 1,
-0.6919309, 1.284216, -1.396345, 1, 1, 1, 1, 1,
-0.6869583, -0.4219344, -1.358298, 1, 1, 1, 1, 1,
-0.678472, 0.3031134, 0.03433162, 1, 1, 1, 1, 1,
-0.676389, -0.02008059, -1.382715, 1, 1, 1, 1, 1,
-0.6763571, 0.7237225, -0.8514418, 1, 1, 1, 1, 1,
-0.6705676, -2.774153, -4.202424, 1, 1, 1, 1, 1,
-0.6677076, -0.7341193, -0.7421748, 1, 1, 1, 1, 1,
-0.6658882, -0.5817425, -2.09072, 1, 1, 1, 1, 1,
-0.6572825, 0.5526419, -1.373158, 1, 1, 1, 1, 1,
-0.6555619, -0.07909932, -0.1736846, 1, 1, 1, 1, 1,
-0.6533852, -0.3387308, -1.974999, 1, 1, 1, 1, 1,
-0.6526092, -0.2275958, -2.008984, 1, 1, 1, 1, 1,
-0.6523971, -0.8654267, -1.485748, 1, 1, 1, 1, 1,
-0.6509808, 1.193534, 0.3113668, 1, 1, 1, 1, 1,
-0.6444929, 0.07311974, -1.511164, 1, 1, 1, 1, 1,
-0.6438681, -1.475263, -3.639424, 0, 0, 1, 1, 1,
-0.6436746, -0.1834815, -2.005758, 1, 0, 0, 1, 1,
-0.6408518, -0.7424633, -1.323708, 1, 0, 0, 1, 1,
-0.639636, -1.906263, -3.313393, 1, 0, 0, 1, 1,
-0.6345938, 0.1270344, -1.584453, 1, 0, 0, 1, 1,
-0.6321412, 0.3678164, -3.65363, 1, 0, 0, 1, 1,
-0.6304787, 0.8831098, -1.878509, 0, 0, 0, 1, 1,
-0.6284505, 0.6680533, -2.329123, 0, 0, 0, 1, 1,
-0.6220265, 0.8948095, -0.7668564, 0, 0, 0, 1, 1,
-0.6208774, -0.07410054, -1.284339, 0, 0, 0, 1, 1,
-0.6206388, -0.1490576, -1.8101, 0, 0, 0, 1, 1,
-0.6159756, 2.747823, -0.4701895, 0, 0, 0, 1, 1,
-0.6153046, 1.454983, -0.3886994, 0, 0, 0, 1, 1,
-0.6126852, 0.9278544, 0.2909707, 1, 1, 1, 1, 1,
-0.6077376, -1.059389, -3.411046, 1, 1, 1, 1, 1,
-0.6074572, -1.196125, -2.734269, 1, 1, 1, 1, 1,
-0.6073433, -0.4472355, -0.9231433, 1, 1, 1, 1, 1,
-0.6011708, 2.359794, -1.255511, 1, 1, 1, 1, 1,
-0.5955771, -0.3401921, -3.336342, 1, 1, 1, 1, 1,
-0.5953587, 1.240933, -0.3338621, 1, 1, 1, 1, 1,
-0.5926464, -0.3167707, -1.998417, 1, 1, 1, 1, 1,
-0.5874224, 1.443223, 1.321759, 1, 1, 1, 1, 1,
-0.5853876, 0.9653732, -1.208038, 1, 1, 1, 1, 1,
-0.5790007, 0.7340205, -1.870054, 1, 1, 1, 1, 1,
-0.5779281, 0.5196831, -0.7248396, 1, 1, 1, 1, 1,
-0.5772606, -1.36388, -2.567434, 1, 1, 1, 1, 1,
-0.5770095, -0.1244319, -1.665058, 1, 1, 1, 1, 1,
-0.5672002, 0.02160195, -2.314449, 1, 1, 1, 1, 1,
-0.5656425, -0.4198609, -1.45186, 0, 0, 1, 1, 1,
-0.5647979, -1.162565, -1.649158, 1, 0, 0, 1, 1,
-0.5643085, 0.8058087, -1.643758, 1, 0, 0, 1, 1,
-0.5642392, -0.8662874, -2.485487, 1, 0, 0, 1, 1,
-0.5631949, 0.1383732, 0.2081818, 1, 0, 0, 1, 1,
-0.5582852, 1.016427, -2.748606, 1, 0, 0, 1, 1,
-0.5562604, 1.528282, -0.6510928, 0, 0, 0, 1, 1,
-0.5533843, 0.3545722, -0.9256201, 0, 0, 0, 1, 1,
-0.5524533, -0.789315, -2.568382, 0, 0, 0, 1, 1,
-0.5515857, -0.5039882, -1.368829, 0, 0, 0, 1, 1,
-0.5512842, -0.6782685, -1.707381, 0, 0, 0, 1, 1,
-0.5509618, -2.083479, -2.895711, 0, 0, 0, 1, 1,
-0.5487146, -1.552434, -2.594836, 0, 0, 0, 1, 1,
-0.5423655, -0.0163722, -1.494237, 1, 1, 1, 1, 1,
-0.5399842, -0.6862534, -0.3654015, 1, 1, 1, 1, 1,
-0.5399456, 0.799574, 0.5708391, 1, 1, 1, 1, 1,
-0.538362, -0.9508497, -2.838565, 1, 1, 1, 1, 1,
-0.5376074, 0.9235435, 0.8246343, 1, 1, 1, 1, 1,
-0.5363994, -0.8135086, -3.470162, 1, 1, 1, 1, 1,
-0.5359294, -2.206268, -3.943788, 1, 1, 1, 1, 1,
-0.5235108, -0.3858652, -2.538312, 1, 1, 1, 1, 1,
-0.5190521, 0.6636232, -0.4775757, 1, 1, 1, 1, 1,
-0.5169259, -0.5911573, -1.043223, 1, 1, 1, 1, 1,
-0.5101733, 0.04651913, -1.394177, 1, 1, 1, 1, 1,
-0.5089549, 0.4712759, -1.342493, 1, 1, 1, 1, 1,
-0.5076897, 0.9595946, 0.6160118, 1, 1, 1, 1, 1,
-0.5068113, -0.6173893, -3.275652, 1, 1, 1, 1, 1,
-0.5062338, 1.876079, 0.284996, 1, 1, 1, 1, 1,
-0.5030124, -0.1298436, -3.113176, 0, 0, 1, 1, 1,
-0.5025175, -1.270347, -2.291517, 1, 0, 0, 1, 1,
-0.5021132, 0.2833219, -2.037017, 1, 0, 0, 1, 1,
-0.4958929, 0.3836161, -0.294572, 1, 0, 0, 1, 1,
-0.4905574, -0.4954606, -4.11167, 1, 0, 0, 1, 1,
-0.4903052, -1.021386, -4.023087, 1, 0, 0, 1, 1,
-0.4886918, -1.11122, -1.425387, 0, 0, 0, 1, 1,
-0.4855836, -0.8503937, -2.459351, 0, 0, 0, 1, 1,
-0.4777831, -0.2195799, -3.047186, 0, 0, 0, 1, 1,
-0.4764292, -1.724997, -2.2843, 0, 0, 0, 1, 1,
-0.4751039, 0.1093596, -1.356903, 0, 0, 0, 1, 1,
-0.4749725, 0.7724932, -0.4159168, 0, 0, 0, 1, 1,
-0.4678741, -0.6410604, -1.202322, 0, 0, 0, 1, 1,
-0.4668606, -0.5466895, -2.319392, 1, 1, 1, 1, 1,
-0.462408, -0.6034428, -4.491019, 1, 1, 1, 1, 1,
-0.4604096, 0.1860896, -0.449538, 1, 1, 1, 1, 1,
-0.4597654, 0.3669564, -0.04127891, 1, 1, 1, 1, 1,
-0.4578903, 1.618657, -1.80087, 1, 1, 1, 1, 1,
-0.4510781, -1.081721, -3.720443, 1, 1, 1, 1, 1,
-0.4509681, -1.060663, -3.374073, 1, 1, 1, 1, 1,
-0.4497608, -1.821143, -2.223078, 1, 1, 1, 1, 1,
-0.448011, -0.2479458, -1.08687, 1, 1, 1, 1, 1,
-0.447277, -1.429206, -3.646017, 1, 1, 1, 1, 1,
-0.4449675, 2.55019, -1.60369, 1, 1, 1, 1, 1,
-0.4445829, 0.5906297, 0.435132, 1, 1, 1, 1, 1,
-0.4407791, -1.273413, -1.509751, 1, 1, 1, 1, 1,
-0.4375516, 0.6770189, -2.515435, 1, 1, 1, 1, 1,
-0.4314196, -1.272017, -2.635864, 1, 1, 1, 1, 1,
-0.4294216, 0.09364566, -0.3892832, 0, 0, 1, 1, 1,
-0.429272, 0.5488294, -1.983903, 1, 0, 0, 1, 1,
-0.4284941, 0.3162029, -2.485372, 1, 0, 0, 1, 1,
-0.4261369, -0.09536123, -2.66255, 1, 0, 0, 1, 1,
-0.4253967, 1.872809, 0.5163014, 1, 0, 0, 1, 1,
-0.4230377, -1.552287, -4.846406, 1, 0, 0, 1, 1,
-0.4219092, 0.330976, 0.8022485, 0, 0, 0, 1, 1,
-0.4179642, -0.3511967, -2.037325, 0, 0, 0, 1, 1,
-0.4145911, 0.1113184, -1.645095, 0, 0, 0, 1, 1,
-0.4128574, 1.052187, 0.4117135, 0, 0, 0, 1, 1,
-0.4117911, 1.113038, -1.164708, 0, 0, 0, 1, 1,
-0.4043486, -0.6038541, -3.551591, 0, 0, 0, 1, 1,
-0.4025739, -0.1673088, -2.991691, 0, 0, 0, 1, 1,
-0.4021051, -1.780638, -2.353146, 1, 1, 1, 1, 1,
-0.3959156, -0.9657052, -3.634346, 1, 1, 1, 1, 1,
-0.3957931, -0.4848642, -3.740673, 1, 1, 1, 1, 1,
-0.3951027, 1.149136, -1.38297, 1, 1, 1, 1, 1,
-0.3944353, 2.422649, -0.2191667, 1, 1, 1, 1, 1,
-0.3891264, 0.5817936, -2.024782, 1, 1, 1, 1, 1,
-0.3870856, 0.2931527, -0.3430081, 1, 1, 1, 1, 1,
-0.3865553, 0.3837522, -0.5275376, 1, 1, 1, 1, 1,
-0.3841861, 0.2599723, 0.1052981, 1, 1, 1, 1, 1,
-0.3800124, 0.9212995, -0.6059222, 1, 1, 1, 1, 1,
-0.3762808, -0.8262175, -3.398568, 1, 1, 1, 1, 1,
-0.375651, 0.8468031, 0.5063597, 1, 1, 1, 1, 1,
-0.3686602, -0.4574359, -3.566685, 1, 1, 1, 1, 1,
-0.3655726, -0.2826299, -1.322, 1, 1, 1, 1, 1,
-0.3653868, 1.245955, 1.777508, 1, 1, 1, 1, 1,
-0.3610277, -1.027924, -2.948242, 0, 0, 1, 1, 1,
-0.3606407, 0.3826281, -0.757667, 1, 0, 0, 1, 1,
-0.3549969, 0.2792342, -2.22043, 1, 0, 0, 1, 1,
-0.3548937, 1.064248, -0.4905615, 1, 0, 0, 1, 1,
-0.3535444, 0.8240719, -1.435997, 1, 0, 0, 1, 1,
-0.3520099, 0.4091454, -2.02093, 1, 0, 0, 1, 1,
-0.3474489, 2.616784, -0.9095827, 0, 0, 0, 1, 1,
-0.341916, 0.08448214, -1.317139, 0, 0, 0, 1, 1,
-0.3406363, 1.473244, -1.293549, 0, 0, 0, 1, 1,
-0.3371828, -1.587196, -2.79896, 0, 0, 0, 1, 1,
-0.3367568, 0.6890705, 0.4610185, 0, 0, 0, 1, 1,
-0.3361335, -1.081418, -0.8254774, 0, 0, 0, 1, 1,
-0.3358119, -0.7642702, -4.194395, 0, 0, 0, 1, 1,
-0.3285736, 2.027618, 0.6485589, 1, 1, 1, 1, 1,
-0.3272047, -1.07644, -2.889703, 1, 1, 1, 1, 1,
-0.3256553, 0.1446098, -2.443733, 1, 1, 1, 1, 1,
-0.321363, -0.241383, -2.600468, 1, 1, 1, 1, 1,
-0.3148131, -0.04217454, -1.237629, 1, 1, 1, 1, 1,
-0.3051951, -0.5385694, -2.606138, 1, 1, 1, 1, 1,
-0.3028888, -1.647269, -2.865874, 1, 1, 1, 1, 1,
-0.302015, 0.0580658, -2.485488, 1, 1, 1, 1, 1,
-0.3001676, -0.1575859, -2.593037, 1, 1, 1, 1, 1,
-0.299581, 0.5018484, -1.355063, 1, 1, 1, 1, 1,
-0.2980326, 0.4163278, 0.08287647, 1, 1, 1, 1, 1,
-0.2882396, -1.080926, -2.917815, 1, 1, 1, 1, 1,
-0.2867766, 0.3729787, -0.04441308, 1, 1, 1, 1, 1,
-0.2843094, 0.2721142, -0.2458283, 1, 1, 1, 1, 1,
-0.2837648, -0.6710559, -2.518854, 1, 1, 1, 1, 1,
-0.2815565, -0.3965587, -2.337368, 0, 0, 1, 1, 1,
-0.2813097, -0.4825462, -2.678881, 1, 0, 0, 1, 1,
-0.2793727, -1.137773, -2.424164, 1, 0, 0, 1, 1,
-0.2791964, 0.3964286, -1.625179, 1, 0, 0, 1, 1,
-0.2777934, -0.9535765, -2.089574, 1, 0, 0, 1, 1,
-0.2756241, 0.6769809, 0.9570816, 1, 0, 0, 1, 1,
-0.2709309, -0.7152854, -3.067141, 0, 0, 0, 1, 1,
-0.2705776, 0.7363558, -0.5045138, 0, 0, 0, 1, 1,
-0.2702669, -0.7073039, -1.888089, 0, 0, 0, 1, 1,
-0.267368, -0.3500121, -4.396116, 0, 0, 0, 1, 1,
-0.2614547, -1.125078, -1.057847, 0, 0, 0, 1, 1,
-0.261383, 1.237811, 0.03280589, 0, 0, 0, 1, 1,
-0.2604892, -0.4655606, -4.520296, 0, 0, 0, 1, 1,
-0.2593365, -1.673056, -4.150396, 1, 1, 1, 1, 1,
-0.25774, 0.7240227, 1.254001, 1, 1, 1, 1, 1,
-0.2560845, -0.8666536, -3.913862, 1, 1, 1, 1, 1,
-0.2545589, 0.5939831, -2.821516, 1, 1, 1, 1, 1,
-0.251487, -1.712285, -3.648102, 1, 1, 1, 1, 1,
-0.2499886, -0.8589215, -2.527802, 1, 1, 1, 1, 1,
-0.2433388, -0.3459088, -2.46499, 1, 1, 1, 1, 1,
-0.2426038, 0.3126373, 0.08663367, 1, 1, 1, 1, 1,
-0.2372235, 2.672466, 0.4121849, 1, 1, 1, 1, 1,
-0.2360987, -0.3305938, -3.258046, 1, 1, 1, 1, 1,
-0.2352424, -1.937294, -1.574693, 1, 1, 1, 1, 1,
-0.2338114, 0.8896869, 0.9899656, 1, 1, 1, 1, 1,
-0.2327881, -0.9194835, -1.604085, 1, 1, 1, 1, 1,
-0.2297892, 0.8016362, -1.195892, 1, 1, 1, 1, 1,
-0.2254086, -1.468832, -3.414213, 1, 1, 1, 1, 1,
-0.2207756, -0.3399705, -0.6733059, 0, 0, 1, 1, 1,
-0.2166809, 0.09530868, -1.253848, 1, 0, 0, 1, 1,
-0.2151999, 0.4197173, -1.531677, 1, 0, 0, 1, 1,
-0.2151791, 1.23304, 0.152505, 1, 0, 0, 1, 1,
-0.2124407, 0.06527481, -3.706047, 1, 0, 0, 1, 1,
-0.2073129, -0.3925202, -2.805863, 1, 0, 0, 1, 1,
-0.2041695, -0.8603036, -4.078969, 0, 0, 0, 1, 1,
-0.202803, 0.5876083, -1.204038, 0, 0, 0, 1, 1,
-0.1980226, -0.2906885, -4.190387, 0, 0, 0, 1, 1,
-0.1930782, 0.01823017, -1.573321, 0, 0, 0, 1, 1,
-0.1929011, -0.3611799, -2.489732, 0, 0, 0, 1, 1,
-0.1895018, -0.1443553, -3.81206, 0, 0, 0, 1, 1,
-0.1889487, -0.2829856, -1.377318, 0, 0, 0, 1, 1,
-0.1850546, -0.8881179, -3.188519, 1, 1, 1, 1, 1,
-0.179466, -0.5149269, -3.284573, 1, 1, 1, 1, 1,
-0.1688488, 0.3994215, -1.402846, 1, 1, 1, 1, 1,
-0.1688233, 0.8967251, 0.227837, 1, 1, 1, 1, 1,
-0.1651018, -0.3689872, -3.490409, 1, 1, 1, 1, 1,
-0.1641234, 1.762885, -1.18672, 1, 1, 1, 1, 1,
-0.1641217, 0.03443267, -2.388878, 1, 1, 1, 1, 1,
-0.1628839, 0.2491251, 0.6399881, 1, 1, 1, 1, 1,
-0.1613163, -1.927262, -2.71472, 1, 1, 1, 1, 1,
-0.1605006, -1.760781, -4.216313, 1, 1, 1, 1, 1,
-0.1553774, -0.8658075, -2.380933, 1, 1, 1, 1, 1,
-0.1547482, 1.31055, -0.8361243, 1, 1, 1, 1, 1,
-0.1531928, 0.02294755, -1.488717, 1, 1, 1, 1, 1,
-0.1481975, -1.843168, -2.566145, 1, 1, 1, 1, 1,
-0.1426855, -0.363297, -3.167024, 1, 1, 1, 1, 1,
-0.1394471, 0.2889414, -0.6111676, 0, 0, 1, 1, 1,
-0.1343054, 0.1126951, -1.619487, 1, 0, 0, 1, 1,
-0.1322527, -0.05872425, -2.74809, 1, 0, 0, 1, 1,
-0.1318418, 1.487392, 0.761237, 1, 0, 0, 1, 1,
-0.1295088, -1.113077, -2.656605, 1, 0, 0, 1, 1,
-0.129135, 0.9027753, -1.338575, 1, 0, 0, 1, 1,
-0.1289566, -0.3243537, -4.556782, 0, 0, 0, 1, 1,
-0.1269705, -1.139732, -2.389839, 0, 0, 0, 1, 1,
-0.1240196, 0.0409794, -2.155943, 0, 0, 0, 1, 1,
-0.1236188, -0.9624165, -2.132662, 0, 0, 0, 1, 1,
-0.1210499, -0.6138709, -3.240361, 0, 0, 0, 1, 1,
-0.1202598, -0.7813468, -3.276492, 0, 0, 0, 1, 1,
-0.1197087, 0.01771487, -1.809182, 0, 0, 0, 1, 1,
-0.1186528, 0.08591017, -1.200691, 1, 1, 1, 1, 1,
-0.1148293, 0.9396468, -1.157016, 1, 1, 1, 1, 1,
-0.1141038, -0.2197887, -1.34842, 1, 1, 1, 1, 1,
-0.1045303, 0.8897311, -0.3655294, 1, 1, 1, 1, 1,
-0.09912891, -1.998939, -2.448382, 1, 1, 1, 1, 1,
-0.09869207, 0.6512109, -0.2709279, 1, 1, 1, 1, 1,
-0.09594704, -0.7507921, -2.446146, 1, 1, 1, 1, 1,
-0.0953264, -0.3998284, -3.574291, 1, 1, 1, 1, 1,
-0.09459863, 0.212052, -0.07467318, 1, 1, 1, 1, 1,
-0.0855802, 1.386579, 1.624348, 1, 1, 1, 1, 1,
-0.08285254, 1.637557, -0.7998636, 1, 1, 1, 1, 1,
-0.08003151, -0.05397107, -2.077389, 1, 1, 1, 1, 1,
-0.07921734, 0.7234178, -0.003954841, 1, 1, 1, 1, 1,
-0.07909346, -0.3523178, -1.802633, 1, 1, 1, 1, 1,
-0.07818933, 0.4568207, -1.611444, 1, 1, 1, 1, 1,
-0.07749557, 0.08209305, -2.27001, 0, 0, 1, 1, 1,
-0.07525468, -0.2928201, -4.425441, 1, 0, 0, 1, 1,
-0.07478804, 1.303666, -0.3602087, 1, 0, 0, 1, 1,
-0.0735628, 2.903409, 1.560392, 1, 0, 0, 1, 1,
-0.06991946, 1.771503, 0.03212818, 1, 0, 0, 1, 1,
-0.06822667, 0.5074006, 1.030874, 1, 0, 0, 1, 1,
-0.06118709, 0.8569387, 0.5708226, 0, 0, 0, 1, 1,
-0.05910395, 0.9467875, 0.2183607, 0, 0, 0, 1, 1,
-0.05705984, -0.4166684, -1.28537, 0, 0, 0, 1, 1,
-0.05479182, -0.9022615, -1.66226, 0, 0, 0, 1, 1,
-0.0521991, 1.247275, 0.529162, 0, 0, 0, 1, 1,
-0.05104352, 0.6937583, 0.2776885, 0, 0, 0, 1, 1,
-0.04822633, 1.319668, 1.217037, 0, 0, 0, 1, 1,
-0.0450812, 1.821097, 0.9414813, 1, 1, 1, 1, 1,
-0.04490197, -0.5181251, -3.000823, 1, 1, 1, 1, 1,
-0.04249591, 1.304062, 0.2006241, 1, 1, 1, 1, 1,
-0.04075269, 0.9531688, -1.401505, 1, 1, 1, 1, 1,
-0.03992652, 1.349323, 2.087489, 1, 1, 1, 1, 1,
-0.03951205, -0.1150303, -2.55792, 1, 1, 1, 1, 1,
-0.0374796, 1.057067, 0.1451929, 1, 1, 1, 1, 1,
-0.03706217, -0.2912659, -2.752839, 1, 1, 1, 1, 1,
-0.03407372, -0.4039135, -3.536642, 1, 1, 1, 1, 1,
-0.02926288, 0.189238, -1.001571, 1, 1, 1, 1, 1,
-0.02732995, 0.8064839, 1.713455, 1, 1, 1, 1, 1,
-0.02679984, -0.5039037, -4.729103, 1, 1, 1, 1, 1,
-0.01946042, 0.03646342, 1.26359, 1, 1, 1, 1, 1,
-0.01857223, 0.8901638, -0.9323323, 1, 1, 1, 1, 1,
-0.01662781, 1.890863, -0.9974483, 1, 1, 1, 1, 1,
-0.01225359, 0.7196964, -0.5237718, 0, 0, 1, 1, 1,
-0.007737247, -0.8548181, -3.142628, 1, 0, 0, 1, 1,
-0.005330639, -0.6817932, -2.518163, 1, 0, 0, 1, 1,
-0.002872539, -0.8529595, -1.59982, 1, 0, 0, 1, 1,
-0.001509936, 0.7671954, 0.1652014, 1, 0, 0, 1, 1,
-0.001465683, 0.2571776, 1.413792, 1, 0, 0, 1, 1,
-0.0003768079, -0.7487476, -3.501388, 0, 0, 0, 1, 1,
0.003040348, 0.2824012, 0.2161834, 0, 0, 0, 1, 1,
0.003192473, -0.1048646, 3.582522, 0, 0, 0, 1, 1,
0.00900077, -0.2259313, 2.497109, 0, 0, 0, 1, 1,
0.01030501, 1.44532, 0.9583119, 0, 0, 0, 1, 1,
0.01791407, 0.3035103, 1.569243, 0, 0, 0, 1, 1,
0.03397222, 0.6812485, -0.5925641, 0, 0, 0, 1, 1,
0.03641062, 0.6601855, -0.7050977, 1, 1, 1, 1, 1,
0.03923035, 0.8639684, -1.613827, 1, 1, 1, 1, 1,
0.03977415, 1.00785, 0.6892737, 1, 1, 1, 1, 1,
0.06619179, 0.7594454, -1.584407, 1, 1, 1, 1, 1,
0.06785326, -0.6556276, 2.663292, 1, 1, 1, 1, 1,
0.06836714, 0.8992609, 2.042722, 1, 1, 1, 1, 1,
0.06836808, -0.1503796, 4.177147, 1, 1, 1, 1, 1,
0.06850238, 1.219335, -0.6223922, 1, 1, 1, 1, 1,
0.06888371, -1.711631, 2.533571, 1, 1, 1, 1, 1,
0.06934184, 0.6529402, -0.3755628, 1, 1, 1, 1, 1,
0.07237329, -1.144005, 1.989296, 1, 1, 1, 1, 1,
0.07420416, 0.5851628, 0.5400777, 1, 1, 1, 1, 1,
0.08471253, 1.344755, 2.518829, 1, 1, 1, 1, 1,
0.08501697, 0.7872678, -0.245838, 1, 1, 1, 1, 1,
0.08794254, -1.332039, 2.98024, 1, 1, 1, 1, 1,
0.08806803, -2.581931, 4.263662, 0, 0, 1, 1, 1,
0.08953448, -0.1923133, 1.884834, 1, 0, 0, 1, 1,
0.09553889, -1.013569, 3.766276, 1, 0, 0, 1, 1,
0.09588506, -0.5203382, 2.617996, 1, 0, 0, 1, 1,
0.09922747, -0.6041529, 3.772186, 1, 0, 0, 1, 1,
0.1004876, -0.4828807, 3.766515, 1, 0, 0, 1, 1,
0.101231, 0.2897581, 1.286041, 0, 0, 0, 1, 1,
0.1037832, -2.178279, 1.021554, 0, 0, 0, 1, 1,
0.1062693, 0.7722346, 0.9189726, 0, 0, 0, 1, 1,
0.1104144, -0.4429663, 2.074388, 0, 0, 0, 1, 1,
0.1106707, 0.8537683, 0.600909, 0, 0, 0, 1, 1,
0.1155188, -0.5190164, 2.279668, 0, 0, 0, 1, 1,
0.116148, 0.4825327, -0.2695065, 0, 0, 0, 1, 1,
0.121667, 0.2337382, 1.538737, 1, 1, 1, 1, 1,
0.1236629, 0.2255583, 0.3162406, 1, 1, 1, 1, 1,
0.1259633, 0.03850507, 2.686883, 1, 1, 1, 1, 1,
0.1268756, -0.8566587, 1.285926, 1, 1, 1, 1, 1,
0.1318795, -0.8202195, 2.571913, 1, 1, 1, 1, 1,
0.1319455, -0.4164113, 2.017624, 1, 1, 1, 1, 1,
0.1337666, 1.813936, -0.9156254, 1, 1, 1, 1, 1,
0.1346085, -0.3010921, 1.870672, 1, 1, 1, 1, 1,
0.1400596, -0.402696, 3.749405, 1, 1, 1, 1, 1,
0.1408451, 0.1614534, 1.533741, 1, 1, 1, 1, 1,
0.1520471, 0.2427112, 0.1108958, 1, 1, 1, 1, 1,
0.1526673, -1.007231, 2.934262, 1, 1, 1, 1, 1,
0.1546948, -0.07252677, 0.5319338, 1, 1, 1, 1, 1,
0.1560845, 1.622442, 1.197922, 1, 1, 1, 1, 1,
0.1566005, 0.9117948, 0.5841854, 1, 1, 1, 1, 1,
0.1596382, 0.3921708, -0.7844861, 0, 0, 1, 1, 1,
0.1600891, -0.4307769, 2.469916, 1, 0, 0, 1, 1,
0.1630327, -0.1914072, 1.443311, 1, 0, 0, 1, 1,
0.1644127, 1.055282, -1.045294, 1, 0, 0, 1, 1,
0.1656009, 1.061068, 0.3351458, 1, 0, 0, 1, 1,
0.1667474, 1.470492, 2.46459, 1, 0, 0, 1, 1,
0.1672717, -0.2873643, 4.038628, 0, 0, 0, 1, 1,
0.1678203, 0.1316703, 0.9995019, 0, 0, 0, 1, 1,
0.1694697, 0.3519456, 1.907386, 0, 0, 0, 1, 1,
0.1698774, -1.416212, 1.35225, 0, 0, 0, 1, 1,
0.1727068, -0.3262432, 4.931938, 0, 0, 0, 1, 1,
0.1750668, 0.3160354, 0.08087533, 0, 0, 0, 1, 1,
0.1754042, 0.09048654, 1.514671, 0, 0, 0, 1, 1,
0.1778257, -0.1650166, 2.591443, 1, 1, 1, 1, 1,
0.1817489, 0.6700553, -0.328538, 1, 1, 1, 1, 1,
0.1936086, 0.3144464, 0.7002701, 1, 1, 1, 1, 1,
0.19563, -0.8423339, 3.767022, 1, 1, 1, 1, 1,
0.1960336, 1.23768, 1.257414, 1, 1, 1, 1, 1,
0.1985333, -0.5094237, 2.98787, 1, 1, 1, 1, 1,
0.2001004, 0.3568116, 0.201083, 1, 1, 1, 1, 1,
0.20088, -0.9099359, 2.32056, 1, 1, 1, 1, 1,
0.2024636, 1.083196, 0.6718401, 1, 1, 1, 1, 1,
0.2031008, -0.3093654, 2.742647, 1, 1, 1, 1, 1,
0.2066042, 1.421893, -2.162707, 1, 1, 1, 1, 1,
0.2091973, -0.9439391, 3.551315, 1, 1, 1, 1, 1,
0.2111852, -0.3325625, 3.901561, 1, 1, 1, 1, 1,
0.213947, -0.42833, 2.430867, 1, 1, 1, 1, 1,
0.2194476, -0.9422297, 3.444386, 1, 1, 1, 1, 1,
0.2195407, 0.4098777, 0.9628173, 0, 0, 1, 1, 1,
0.2215088, -1.601509, 3.163342, 1, 0, 0, 1, 1,
0.2255128, -0.200684, 0.7122443, 1, 0, 0, 1, 1,
0.2278297, 0.8380075, 0.935592, 1, 0, 0, 1, 1,
0.2350183, 2.030021, -0.004477687, 1, 0, 0, 1, 1,
0.2355224, 0.9758202, -0.9905335, 1, 0, 0, 1, 1,
0.2376947, 0.5162152, -0.4811939, 0, 0, 0, 1, 1,
0.2420894, -1.724328, 3.28553, 0, 0, 0, 1, 1,
0.2457541, -0.3808927, 1.146816, 0, 0, 0, 1, 1,
0.2482173, 0.8919775, -0.9763727, 0, 0, 0, 1, 1,
0.2494623, -0.9286435, 2.877266, 0, 0, 0, 1, 1,
0.2528979, 1.100068, 0.8057911, 0, 0, 0, 1, 1,
0.2543424, -2.616669, 2.901802, 0, 0, 0, 1, 1,
0.2565384, 0.690538, 0.7532101, 1, 1, 1, 1, 1,
0.2579883, 1.478835, -1.375093, 1, 1, 1, 1, 1,
0.2580134, -0.8155243, 3.675564, 1, 1, 1, 1, 1,
0.2590175, 0.06006642, 1.807433, 1, 1, 1, 1, 1,
0.2595934, -0.2851113, 2.903836, 1, 1, 1, 1, 1,
0.2725027, -0.3410663, 2.421427, 1, 1, 1, 1, 1,
0.2764097, -0.1318103, 1.31641, 1, 1, 1, 1, 1,
0.2804011, -0.4843788, 0.6114315, 1, 1, 1, 1, 1,
0.2830262, 0.0125255, 1.578444, 1, 1, 1, 1, 1,
0.2837757, -0.02699448, 1.529094, 1, 1, 1, 1, 1,
0.2872614, 0.1408619, 2.44065, 1, 1, 1, 1, 1,
0.2880717, -0.655085, 4.184231, 1, 1, 1, 1, 1,
0.2885157, -0.2959626, 1.789318, 1, 1, 1, 1, 1,
0.2913856, 0.6985305, 2.203808, 1, 1, 1, 1, 1,
0.2952754, -0.7141996, 0.8301207, 1, 1, 1, 1, 1,
0.2977841, -0.09383938, 0.4112833, 0, 0, 1, 1, 1,
0.3020688, 1.076218, 0.5587984, 1, 0, 0, 1, 1,
0.3036275, -1.416431, 4.856079, 1, 0, 0, 1, 1,
0.3071297, -0.9793292, 5.362607, 1, 0, 0, 1, 1,
0.3072371, -0.7413322, 3.670912, 1, 0, 0, 1, 1,
0.3094706, -0.9211012, 3.58612, 1, 0, 0, 1, 1,
0.3099518, -0.2155291, 1.499055, 0, 0, 0, 1, 1,
0.3146012, -0.4450677, 2.439161, 0, 0, 0, 1, 1,
0.3159653, 0.7817051, 0.8266684, 0, 0, 0, 1, 1,
0.3182513, 0.9365091, 0.9872313, 0, 0, 0, 1, 1,
0.3209287, -1.460547, 1.569825, 0, 0, 0, 1, 1,
0.3264727, 0.4727513, 0.9682233, 0, 0, 0, 1, 1,
0.3301968, 0.05008812, 1.544423, 0, 0, 0, 1, 1,
0.3325292, -0.004014135, 3.818887, 1, 1, 1, 1, 1,
0.3325303, -0.8643488, 2.274451, 1, 1, 1, 1, 1,
0.3369402, -0.7185005, 2.379974, 1, 1, 1, 1, 1,
0.3372673, -1.73471, 3.044408, 1, 1, 1, 1, 1,
0.3373821, 1.316521, 0.04310469, 1, 1, 1, 1, 1,
0.3381033, -0.1519851, 3.802226, 1, 1, 1, 1, 1,
0.3384524, -0.1267038, 1.139367, 1, 1, 1, 1, 1,
0.3404066, 1.132539, 0.8009903, 1, 1, 1, 1, 1,
0.3434511, -0.8000602, 2.56896, 1, 1, 1, 1, 1,
0.3442321, -1.107518, 3.020521, 1, 1, 1, 1, 1,
0.3499582, 0.6773424, 1.336931, 1, 1, 1, 1, 1,
0.3517358, 0.743386, 1.739873, 1, 1, 1, 1, 1,
0.3550803, 0.4488818, 0.4107895, 1, 1, 1, 1, 1,
0.3559954, 0.3706774, -0.6428532, 1, 1, 1, 1, 1,
0.3576469, -0.7050552, 1.258575, 1, 1, 1, 1, 1,
0.3583408, -0.1060169, 2.491842, 0, 0, 1, 1, 1,
0.3584844, 0.5627725, 0.4315992, 1, 0, 0, 1, 1,
0.3622401, -1.926847, 3.736602, 1, 0, 0, 1, 1,
0.3706225, -1.292299, 3.491942, 1, 0, 0, 1, 1,
0.3741261, -0.6224163, 3.626205, 1, 0, 0, 1, 1,
0.3755604, 0.4742495, 2.697161, 1, 0, 0, 1, 1,
0.3762149, -0.9051468, 3.745537, 0, 0, 0, 1, 1,
0.3783574, 0.142147, 0.7598854, 0, 0, 0, 1, 1,
0.3801939, -1.155324, 2.662802, 0, 0, 0, 1, 1,
0.3809102, -0.1360635, 2.333748, 0, 0, 0, 1, 1,
0.3849636, -0.1839842, 2.322024, 0, 0, 0, 1, 1,
0.3914806, -1.876696, 3.349112, 0, 0, 0, 1, 1,
0.3955227, -2.104073, 2.895373, 0, 0, 0, 1, 1,
0.3964796, -0.1588224, 1.25284, 1, 1, 1, 1, 1,
0.3984303, -1.834435, 1.348884, 1, 1, 1, 1, 1,
0.3995481, -0.6092845, 2.18398, 1, 1, 1, 1, 1,
0.4017462, 1.328199, 0.1605, 1, 1, 1, 1, 1,
0.4022988, -0.4167712, 0.8281946, 1, 1, 1, 1, 1,
0.403215, -0.05220541, 0.004209226, 1, 1, 1, 1, 1,
0.4070249, -0.1701857, 2.981751, 1, 1, 1, 1, 1,
0.4087594, -0.103549, 1.957465, 1, 1, 1, 1, 1,
0.4115985, -1.176931, 2.431799, 1, 1, 1, 1, 1,
0.4139111, 0.3235819, 1.295017, 1, 1, 1, 1, 1,
0.4144491, -0.8041524, 3.121009, 1, 1, 1, 1, 1,
0.4162345, 0.856949, 2.559251, 1, 1, 1, 1, 1,
0.4253666, 0.4966194, -0.2009119, 1, 1, 1, 1, 1,
0.4273036, 0.5712281, -0.4856485, 1, 1, 1, 1, 1,
0.4294435, -1.837476, 2.301279, 1, 1, 1, 1, 1,
0.4297144, 0.07487397, 0.5082886, 0, 0, 1, 1, 1,
0.4301022, 0.3328192, 0.6305773, 1, 0, 0, 1, 1,
0.4375556, -0.1180935, 2.068087, 1, 0, 0, 1, 1,
0.438362, 0.6917992, 1.046071, 1, 0, 0, 1, 1,
0.4391405, -0.7088351, 2.643764, 1, 0, 0, 1, 1,
0.4400931, -0.01044492, 2.123042, 1, 0, 0, 1, 1,
0.4534501, 0.3114749, 0.1465467, 0, 0, 0, 1, 1,
0.4550502, 1.352989, 1.719567, 0, 0, 0, 1, 1,
0.4653161, -0.8255617, 2.125228, 0, 0, 0, 1, 1,
0.4712992, 1.146679, 2.074604, 0, 0, 0, 1, 1,
0.4745259, 1.43431, 0.9578295, 0, 0, 0, 1, 1,
0.477769, 0.05475969, -0.1305371, 0, 0, 0, 1, 1,
0.4784745, -0.100488, 2.309886, 0, 0, 0, 1, 1,
0.4799506, 0.3519551, 0.5668868, 1, 1, 1, 1, 1,
0.4813336, 0.4400353, 0.2067815, 1, 1, 1, 1, 1,
0.4829395, 0.9070721, -0.9029124, 1, 1, 1, 1, 1,
0.483087, 0.1595319, 1.889531, 1, 1, 1, 1, 1,
0.4844613, -0.1536475, 1.558991, 1, 1, 1, 1, 1,
0.4862372, -0.9101571, 1.398402, 1, 1, 1, 1, 1,
0.4882517, -0.1665665, 2.134615, 1, 1, 1, 1, 1,
0.4969849, 1.254983, 1.906272, 1, 1, 1, 1, 1,
0.4982144, -0.1645343, 2.723093, 1, 1, 1, 1, 1,
0.498335, 0.418708, -1.295234, 1, 1, 1, 1, 1,
0.5046078, -0.7035886, 2.425415, 1, 1, 1, 1, 1,
0.5066928, 0.1143814, 2.189056, 1, 1, 1, 1, 1,
0.5073287, 0.904196, 2.455551, 1, 1, 1, 1, 1,
0.5085783, -0.04729809, 1.706592, 1, 1, 1, 1, 1,
0.5087904, 0.7186795, 2.230709, 1, 1, 1, 1, 1,
0.5095984, 0.2097709, 2.01727, 0, 0, 1, 1, 1,
0.5137084, -0.195123, 3.458156, 1, 0, 0, 1, 1,
0.5202832, -0.974434, 2.592909, 1, 0, 0, 1, 1,
0.5254138, 1.475704, -0.06834746, 1, 0, 0, 1, 1,
0.5266755, 0.7555518, 0.3411014, 1, 0, 0, 1, 1,
0.5279036, 0.3636391, 0.8326913, 1, 0, 0, 1, 1,
0.5279886, 0.1294449, 3.54934, 0, 0, 0, 1, 1,
0.5353892, 0.6550053, 2.303887, 0, 0, 0, 1, 1,
0.5372077, 0.643222, -1.628446, 0, 0, 0, 1, 1,
0.5374995, -0.8610438, 4.455721, 0, 0, 0, 1, 1,
0.5455815, 0.02223365, 0.3901233, 0, 0, 0, 1, 1,
0.5531473, 0.6214361, 2.080312, 0, 0, 0, 1, 1,
0.5690601, -0.3010523, 3.780593, 0, 0, 0, 1, 1,
0.5716286, 1.076787, 1.598556, 1, 1, 1, 1, 1,
0.5754712, 0.2756843, 0.2795333, 1, 1, 1, 1, 1,
0.5811046, -1.194713, 2.136182, 1, 1, 1, 1, 1,
0.5816867, -0.5593691, 1.077551, 1, 1, 1, 1, 1,
0.585211, 1.956417, -0.5506031, 1, 1, 1, 1, 1,
0.5882636, -0.5235598, 2.104132, 1, 1, 1, 1, 1,
0.5885737, -1.727012, 2.466535, 1, 1, 1, 1, 1,
0.588723, -0.3131102, 3.65819, 1, 1, 1, 1, 1,
0.5913871, -0.4373757, 0.4703917, 1, 1, 1, 1, 1,
0.5916744, 0.5008379, -1.084585, 1, 1, 1, 1, 1,
0.5924342, 0.6040275, 0.3858951, 1, 1, 1, 1, 1,
0.5949237, 1.512622, -0.09646375, 1, 1, 1, 1, 1,
0.5955833, -1.328903, 1.13781, 1, 1, 1, 1, 1,
0.5961348, 0.8937238, -0.3712817, 1, 1, 1, 1, 1,
0.5970914, -0.8543397, 1.696539, 1, 1, 1, 1, 1,
0.6000289, 0.09782463, 3.236799, 0, 0, 1, 1, 1,
0.6024054, -0.9829843, 3.536924, 1, 0, 0, 1, 1,
0.605021, -1.759739, 2.895286, 1, 0, 0, 1, 1,
0.6050869, 0.267879, 1.426089, 1, 0, 0, 1, 1,
0.6052058, -1.637225, 2.796883, 1, 0, 0, 1, 1,
0.606093, 0.2401883, 1.562192, 1, 0, 0, 1, 1,
0.6077728, -0.2898135, 3.393727, 0, 0, 0, 1, 1,
0.6094203, -0.8883374, 0.9129816, 0, 0, 0, 1, 1,
0.6110073, 1.727225, 0.724236, 0, 0, 0, 1, 1,
0.6112447, 1.174503, -0.794122, 0, 0, 0, 1, 1,
0.6140181, 1.944244, 1.667681, 0, 0, 0, 1, 1,
0.6218141, -0.01112367, 2.109069, 0, 0, 0, 1, 1,
0.6280615, 1.129793, -0.4083959, 0, 0, 0, 1, 1,
0.6301635, 0.6384408, 1.222098, 1, 1, 1, 1, 1,
0.6314939, -1.168543, 3.655234, 1, 1, 1, 1, 1,
0.6323739, -0.09234273, 0.3031564, 1, 1, 1, 1, 1,
0.6344818, 1.721182, 0.5484125, 1, 1, 1, 1, 1,
0.6346494, -0.3425616, 3.997022, 1, 1, 1, 1, 1,
0.645876, -0.8468262, 0.6213905, 1, 1, 1, 1, 1,
0.6466432, -0.6647694, 1.833053, 1, 1, 1, 1, 1,
0.6475631, -0.659446, 1.901011, 1, 1, 1, 1, 1,
0.6568196, -1.462342, 1.735418, 1, 1, 1, 1, 1,
0.6576903, 0.3015767, 0.8327415, 1, 1, 1, 1, 1,
0.6597486, -1.394995, 3.441746, 1, 1, 1, 1, 1,
0.6685153, 1.416756, 1.137198, 1, 1, 1, 1, 1,
0.6725057, -0.04425606, 0.9406002, 1, 1, 1, 1, 1,
0.6767963, -1.598738, 1.26487, 1, 1, 1, 1, 1,
0.6844963, 0.1550123, 0.798062, 1, 1, 1, 1, 1,
0.685734, 0.5705892, -2.207122, 0, 0, 1, 1, 1,
0.6860943, -1.334161, 2.732241, 1, 0, 0, 1, 1,
0.6873493, -0.9613638, 2.880467, 1, 0, 0, 1, 1,
0.6912901, 0.772597, 1.067708, 1, 0, 0, 1, 1,
0.6919469, 0.4355799, 3.186148, 1, 0, 0, 1, 1,
0.7017366, -1.139651, 2.528165, 1, 0, 0, 1, 1,
0.7069903, 0.6853204, 0.8671291, 0, 0, 0, 1, 1,
0.7074812, 0.8618916, -0.0474673, 0, 0, 0, 1, 1,
0.7088317, 2.092275, 0.9234345, 0, 0, 0, 1, 1,
0.7091205, -0.3855675, 2.152649, 0, 0, 0, 1, 1,
0.7125208, 0.5356985, 1.919104, 0, 0, 0, 1, 1,
0.7163724, 1.672538, 1.562066, 0, 0, 0, 1, 1,
0.7220063, -0.1250865, 2.646217, 0, 0, 0, 1, 1,
0.7222775, 1.028472, 0.6889129, 1, 1, 1, 1, 1,
0.7237653, -1.459819, 2.903793, 1, 1, 1, 1, 1,
0.7250036, -0.38905, 3.127868, 1, 1, 1, 1, 1,
0.7268211, -0.9143759, 2.530184, 1, 1, 1, 1, 1,
0.7337632, -1.359731, 2.350039, 1, 1, 1, 1, 1,
0.7367392, 0.02712051, 1.152753, 1, 1, 1, 1, 1,
0.7424818, -1.584677, 3.779326, 1, 1, 1, 1, 1,
0.7433258, -0.3983974, 1.315586, 1, 1, 1, 1, 1,
0.7445942, -0.3928062, 3.310438, 1, 1, 1, 1, 1,
0.7468935, -0.7892234, 2.042684, 1, 1, 1, 1, 1,
0.74765, -0.5441606, 2.963774, 1, 1, 1, 1, 1,
0.7635443, 0.2550071, 0.2305463, 1, 1, 1, 1, 1,
0.7652311, 0.04451348, 1.344827, 1, 1, 1, 1, 1,
0.7657731, -0.9003175, 3.900402, 1, 1, 1, 1, 1,
0.7679749, 1.499528, 0.5080038, 1, 1, 1, 1, 1,
0.7691881, 0.9062547, 1.371255, 0, 0, 1, 1, 1,
0.7724001, 0.6798213, 0.7151665, 1, 0, 0, 1, 1,
0.7807054, -0.6013927, 3.74099, 1, 0, 0, 1, 1,
0.7813487, 0.2909592, 1.964733, 1, 0, 0, 1, 1,
0.7837534, 0.2577785, -0.000224311, 1, 0, 0, 1, 1,
0.7884842, 1.35458, -0.6486521, 1, 0, 0, 1, 1,
0.7920091, 0.1430097, -0.2031092, 0, 0, 0, 1, 1,
0.8010828, 1.386927, 1.22794, 0, 0, 0, 1, 1,
0.8014361, -0.6427301, 2.695553, 0, 0, 0, 1, 1,
0.8057092, -0.1025287, -0.4154623, 0, 0, 0, 1, 1,
0.8096796, -1.549336, 2.233907, 0, 0, 0, 1, 1,
0.8127384, -0.004512995, 0.8604505, 0, 0, 0, 1, 1,
0.8133991, -0.7938628, 2.050452, 0, 0, 0, 1, 1,
0.8173359, -0.8186805, 0.04633075, 1, 1, 1, 1, 1,
0.8188623, 0.8475687, 0.9224831, 1, 1, 1, 1, 1,
0.819348, -0.8234233, 3.625157, 1, 1, 1, 1, 1,
0.825268, 0.08878752, 2.561546, 1, 1, 1, 1, 1,
0.8263807, 0.1455263, 1.749469, 1, 1, 1, 1, 1,
0.8285294, -0.147614, -0.8773336, 1, 1, 1, 1, 1,
0.8385814, -0.4350355, 1.276863, 1, 1, 1, 1, 1,
0.8404386, 0.04152929, 1.503582, 1, 1, 1, 1, 1,
0.8404847, 0.251113, 0.4409094, 1, 1, 1, 1, 1,
0.8419912, 0.1890366, 2.552177, 1, 1, 1, 1, 1,
0.8494258, -0.5480928, 1.386909, 1, 1, 1, 1, 1,
0.8531965, -0.4769637, 1.529613, 1, 1, 1, 1, 1,
0.8544481, -0.3795317, 1.459237, 1, 1, 1, 1, 1,
0.8587102, -0.813422, 1.921997, 1, 1, 1, 1, 1,
0.8596907, -2.784822, 4.002479, 1, 1, 1, 1, 1,
0.8631132, -1.113001, 2.447258, 0, 0, 1, 1, 1,
0.8706377, 0.8028291, 1.340168, 1, 0, 0, 1, 1,
0.8710696, 0.2475711, 2.005069, 1, 0, 0, 1, 1,
0.872225, 2.175776, 0.6699273, 1, 0, 0, 1, 1,
0.8723736, -0.06667967, 1.623274, 1, 0, 0, 1, 1,
0.8770078, -1.307181, 1.570371, 1, 0, 0, 1, 1,
0.8777765, 1.549453, -1.93821, 0, 0, 0, 1, 1,
0.880084, 0.3212875, 0.5820279, 0, 0, 0, 1, 1,
0.8879321, -1.988283, 3.424295, 0, 0, 0, 1, 1,
0.8919948, 1.857597, 0.3430846, 0, 0, 0, 1, 1,
0.8988642, 0.7057675, 0.7907088, 0, 0, 0, 1, 1,
0.9019717, -0.6607177, 2.478595, 0, 0, 0, 1, 1,
0.9042431, 0.0406323, 0.6355109, 0, 0, 0, 1, 1,
0.9073911, 1.404619, -0.558621, 1, 1, 1, 1, 1,
0.9097118, -0.3546412, 2.716974, 1, 1, 1, 1, 1,
0.910947, 0.5900124, 2.249606, 1, 1, 1, 1, 1,
0.9140562, 1.296264, 0.9375082, 1, 1, 1, 1, 1,
0.9217308, -1.118886, 3.661011, 1, 1, 1, 1, 1,
0.9262255, -1.350979, 1.503783, 1, 1, 1, 1, 1,
0.9276034, 0.5668591, 2.19751, 1, 1, 1, 1, 1,
0.9341677, 0.01614188, 2.377489, 1, 1, 1, 1, 1,
0.9419078, 0.7547902, 1.369836, 1, 1, 1, 1, 1,
0.943468, 0.9962763, 1.710207, 1, 1, 1, 1, 1,
0.9439315, -0.7455319, 3.451587, 1, 1, 1, 1, 1,
0.9460251, -1.917905, 3.188567, 1, 1, 1, 1, 1,
0.9558335, -0.4061048, 0.05798892, 1, 1, 1, 1, 1,
0.9583612, 1.101514, 1.615615, 1, 1, 1, 1, 1,
0.9602796, -1.166662, 2.727841, 1, 1, 1, 1, 1,
0.9694792, 0.5087264, 0.7278777, 0, 0, 1, 1, 1,
0.9746255, 0.5123805, 0.5214735, 1, 0, 0, 1, 1,
0.9766639, -1.599526, 2.491023, 1, 0, 0, 1, 1,
0.97884, 0.4059681, 0.9965033, 1, 0, 0, 1, 1,
0.9818309, -1.227317, 2.341878, 1, 0, 0, 1, 1,
0.9831981, 0.5019396, 1.631102, 1, 0, 0, 1, 1,
0.9906259, -1.518659, 1.965243, 0, 0, 0, 1, 1,
1.006056, -0.7560096, 1.208528, 0, 0, 0, 1, 1,
1.008226, -0.930972, 2.26406, 0, 0, 0, 1, 1,
1.015415, 0.3019866, 2.414965, 0, 0, 0, 1, 1,
1.018703, -1.428757, 0.829752, 0, 0, 0, 1, 1,
1.022676, 0.6013569, -0.3464704, 0, 0, 0, 1, 1,
1.027372, 2.326354, 0.6195841, 0, 0, 0, 1, 1,
1.02885, 0.5149028, 2.447289, 1, 1, 1, 1, 1,
1.029218, 1.880059, 0.4979691, 1, 1, 1, 1, 1,
1.030229, -0.185891, 3.453724, 1, 1, 1, 1, 1,
1.036256, 0.1287502, 0.1543346, 1, 1, 1, 1, 1,
1.039888, -0.6130638, 1.646907, 1, 1, 1, 1, 1,
1.046254, -1.087232, 4.761707, 1, 1, 1, 1, 1,
1.049434, 2.150034, -0.08431846, 1, 1, 1, 1, 1,
1.05582, -0.1883231, 3.007508, 1, 1, 1, 1, 1,
1.060921, -0.1014605, 3.003186, 1, 1, 1, 1, 1,
1.075788, -0.6055267, 2.545007, 1, 1, 1, 1, 1,
1.07868, -1.09498, 2.679771, 1, 1, 1, 1, 1,
1.088097, 0.5148332, 2.422023, 1, 1, 1, 1, 1,
1.089035, 0.7416484, 0.7281857, 1, 1, 1, 1, 1,
1.094405, 0.5623607, 1.960066, 1, 1, 1, 1, 1,
1.110182, -1.239091, 2.792169, 1, 1, 1, 1, 1,
1.110672, 0.414563, 2.614101, 0, 0, 1, 1, 1,
1.113709, 1.481837, 1.034993, 1, 0, 0, 1, 1,
1.117288, 1.256163, 1.784719, 1, 0, 0, 1, 1,
1.117676, 2.040511, 0.5742637, 1, 0, 0, 1, 1,
1.119238, -0.7891866, 2.473408, 1, 0, 0, 1, 1,
1.120908, -0.5997374, 0.5334224, 1, 0, 0, 1, 1,
1.121032, 0.6497913, 1.767029, 0, 0, 0, 1, 1,
1.132918, -0.1615139, 2.2174, 0, 0, 0, 1, 1,
1.144285, -0.7245241, 2.666448, 0, 0, 0, 1, 1,
1.149631, -0.128317, 1.991522, 0, 0, 0, 1, 1,
1.158665, 0.8299032, -0.349326, 0, 0, 0, 1, 1,
1.159238, -1.491249, 3.360609, 0, 0, 0, 1, 1,
1.172388, 0.3072705, 0.9106867, 0, 0, 0, 1, 1,
1.17443, -0.01873307, 0.5608142, 1, 1, 1, 1, 1,
1.179943, 0.6491323, 0.3002613, 1, 1, 1, 1, 1,
1.182988, -0.2084062, 1.928516, 1, 1, 1, 1, 1,
1.190598, -1.234376, 2.029136, 1, 1, 1, 1, 1,
1.192157, -0.2862337, 1.5876, 1, 1, 1, 1, 1,
1.19628, 0.4577354, 2.672158, 1, 1, 1, 1, 1,
1.196834, 0.3202186, 2.54473, 1, 1, 1, 1, 1,
1.201189, 0.7329615, 1.509149, 1, 1, 1, 1, 1,
1.202182, 1.438149, 2.383981, 1, 1, 1, 1, 1,
1.208113, 1.713657, -1.002566, 1, 1, 1, 1, 1,
1.220713, -1.573707, 2.222962, 1, 1, 1, 1, 1,
1.220831, 0.4200351, 1.523796, 1, 1, 1, 1, 1,
1.226732, -0.9442486, 2.906333, 1, 1, 1, 1, 1,
1.22705, 0.3910342, 1.409104, 1, 1, 1, 1, 1,
1.23634, 1.819305, 0.824977, 1, 1, 1, 1, 1,
1.237924, 1.984116, 1.483672, 0, 0, 1, 1, 1,
1.240606, 1.329928, 1.076485, 1, 0, 0, 1, 1,
1.243457, 1.770135, 1.648971, 1, 0, 0, 1, 1,
1.25385, 0.7210746, 0.4314794, 1, 0, 0, 1, 1,
1.254992, 1.069717, 0.7893862, 1, 0, 0, 1, 1,
1.25738, -1.469059, 2.093794, 1, 0, 0, 1, 1,
1.257561, -1.192226, 1.536409, 0, 0, 0, 1, 1,
1.25832, 0.2429731, -0.4368691, 0, 0, 0, 1, 1,
1.2609, 0.1010803, 3.218285, 0, 0, 0, 1, 1,
1.261112, -0.4197375, 1.306074, 0, 0, 0, 1, 1,
1.270463, 1.908406, 3.173244, 0, 0, 0, 1, 1,
1.27825, -0.7880813, 2.157543, 0, 0, 0, 1, 1,
1.280784, 0.5061191, 2.206852, 0, 0, 0, 1, 1,
1.281069, 1.370702, 0.5669709, 1, 1, 1, 1, 1,
1.291119, -0.01230076, 1.331756, 1, 1, 1, 1, 1,
1.294113, -0.2411851, 3.33679, 1, 1, 1, 1, 1,
1.30844, -1.116212, 3.468964, 1, 1, 1, 1, 1,
1.321932, -0.235964, 1.307556, 1, 1, 1, 1, 1,
1.328034, -1.233783, 2.025156, 1, 1, 1, 1, 1,
1.331645, -1.659089, 5.008321, 1, 1, 1, 1, 1,
1.342644, -0.5843917, 2.647637, 1, 1, 1, 1, 1,
1.344191, 0.3263959, 0.702544, 1, 1, 1, 1, 1,
1.345385, -0.4748657, 2.732342, 1, 1, 1, 1, 1,
1.357359, 0.4184506, 0.770714, 1, 1, 1, 1, 1,
1.357552, -1.151816, 3.136877, 1, 1, 1, 1, 1,
1.358693, 0.8336786, 0.8417823, 1, 1, 1, 1, 1,
1.362491, 0.3871534, 1.317106, 1, 1, 1, 1, 1,
1.366754, -0.6371119, 1.972697, 1, 1, 1, 1, 1,
1.369626, -1.711541, 2.66055, 0, 0, 1, 1, 1,
1.371817, -0.9873754, 3.26882, 1, 0, 0, 1, 1,
1.391254, -0.7750031, 2.383331, 1, 0, 0, 1, 1,
1.392409, -0.5529171, 3.158321, 1, 0, 0, 1, 1,
1.404493, -1.033794, 2.337409, 1, 0, 0, 1, 1,
1.42729, -0.1789763, -0.02917099, 1, 0, 0, 1, 1,
1.448725, 0.9796646, 0.5154684, 0, 0, 0, 1, 1,
1.452219, -1.670165, 2.388192, 0, 0, 0, 1, 1,
1.452277, 0.7885607, 1.468666, 0, 0, 0, 1, 1,
1.467747, 1.932625, 0.4715037, 0, 0, 0, 1, 1,
1.471053, -1.017429, 0.4897065, 0, 0, 0, 1, 1,
1.472963, -1.111815, 4.252745, 0, 0, 0, 1, 1,
1.494628, 1.207653, 0.1801281, 0, 0, 0, 1, 1,
1.504143, -0.02638168, 1.961206, 1, 1, 1, 1, 1,
1.510314, -1.159782, 0.9377828, 1, 1, 1, 1, 1,
1.514318, 0.9864855, 0.9861389, 1, 1, 1, 1, 1,
1.525914, -1.182286, 2.36274, 1, 1, 1, 1, 1,
1.530913, 0.5202999, -0.277216, 1, 1, 1, 1, 1,
1.534163, -0.3669609, 2.09143, 1, 1, 1, 1, 1,
1.549135, -0.1237181, 0.8075879, 1, 1, 1, 1, 1,
1.549694, -1.35532, 2.283769, 1, 1, 1, 1, 1,
1.552703, 0.400117, 2.204961, 1, 1, 1, 1, 1,
1.562263, -1.045971, 1.164997, 1, 1, 1, 1, 1,
1.562747, 1.116358, 2.232557, 1, 1, 1, 1, 1,
1.603742, -0.3930937, 0.637301, 1, 1, 1, 1, 1,
1.606538, -0.8030634, 2.592974, 1, 1, 1, 1, 1,
1.620436, -0.1748904, 1.706434, 1, 1, 1, 1, 1,
1.638767, 0.09947856, 1.076735, 1, 1, 1, 1, 1,
1.648243, -0.2154857, 2.38536, 0, 0, 1, 1, 1,
1.659974, 1.452557, -0.1883966, 1, 0, 0, 1, 1,
1.67571, 0.1404555, 1.816558, 1, 0, 0, 1, 1,
1.679181, 0.0279295, 0.8313124, 1, 0, 0, 1, 1,
1.691539, -1.263344, 3.743271, 1, 0, 0, 1, 1,
1.713443, 0.8379121, 1.062635, 1, 0, 0, 1, 1,
1.719497, -0.1526166, 4.617735, 0, 0, 0, 1, 1,
1.722727, -1.30804, 1.366308, 0, 0, 0, 1, 1,
1.736021, -1.615917, 1.711876, 0, 0, 0, 1, 1,
1.736337, 1.887671, 1.554589, 0, 0, 0, 1, 1,
1.741343, 0.1078793, 4.210489, 0, 0, 0, 1, 1,
1.749223, 1.174557, 2.382707, 0, 0, 0, 1, 1,
1.75356, -1.883662, 1.551851, 0, 0, 0, 1, 1,
1.777322, -0.3019957, 2.776545, 1, 1, 1, 1, 1,
1.790743, 0.718192, 1.554325, 1, 1, 1, 1, 1,
1.81395, -0.6002368, 2.508125, 1, 1, 1, 1, 1,
1.821149, -0.9239447, -0.8239232, 1, 1, 1, 1, 1,
1.830316, 0.5234512, 1.49739, 1, 1, 1, 1, 1,
1.830323, -0.5574766, 3.046404, 1, 1, 1, 1, 1,
1.846212, 1.272879, 0.878313, 1, 1, 1, 1, 1,
1.855379, -0.186914, 3.773485, 1, 1, 1, 1, 1,
1.857013, 1.856085, 0.08664411, 1, 1, 1, 1, 1,
1.862543, 2.615871, -0.4840714, 1, 1, 1, 1, 1,
1.879203, 1.351874, 0.8768877, 1, 1, 1, 1, 1,
1.892233, 0.5627673, 0.9139891, 1, 1, 1, 1, 1,
1.903386, -0.7897515, 1.426103, 1, 1, 1, 1, 1,
1.925758, -1.980601, 4.176976, 1, 1, 1, 1, 1,
1.935125, 1.569484, 0.7597933, 1, 1, 1, 1, 1,
1.943015, -0.04310877, 0.5617133, 0, 0, 1, 1, 1,
1.96576, -1.07514, 2.181725, 1, 0, 0, 1, 1,
1.974442, 0.5069838, 1.190686, 1, 0, 0, 1, 1,
1.977933, -1.350218, 3.255685, 1, 0, 0, 1, 1,
2.030936, -2.424104, 1.71793, 1, 0, 0, 1, 1,
2.03407, -1.015638, 2.263532, 1, 0, 0, 1, 1,
2.053974, -0.564742, 0.9879905, 0, 0, 0, 1, 1,
2.137562, -0.2448262, 0.9120319, 0, 0, 0, 1, 1,
2.19366, -1.032235, 0.4333269, 0, 0, 0, 1, 1,
2.200773, 0.00996781, 1.318062, 0, 0, 0, 1, 1,
2.335616, -0.5027401, 1.228743, 0, 0, 0, 1, 1,
2.389428, -0.8161278, 2.145687, 0, 0, 0, 1, 1,
2.553904, 1.12325, 0.9086947, 0, 0, 0, 1, 1,
2.600435, -0.3230199, 0.4129075, 1, 1, 1, 1, 1,
2.672389, -0.9096386, 0.8592911, 1, 1, 1, 1, 1,
2.718816, 1.143941, 1.680254, 1, 1, 1, 1, 1,
2.733859, -0.329048, 3.035562, 1, 1, 1, 1, 1,
2.823427, -0.589581, 4.587389, 1, 1, 1, 1, 1,
2.867706, -0.9330106, -0.2507399, 1, 1, 1, 1, 1,
3.617036, 1.029747, 1.720916, 1, 1, 1, 1, 1
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
var radius = 9.65998;
var distance = 33.93027;
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
mvMatrix.translate( -0.1467891, 0.4416914, -0.258101 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.93027);
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