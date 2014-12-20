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
-3.818556, -0.7842981, -2.677644, 1, 0, 0, 1,
-3.810538, -0.942135, -2.662615, 1, 0.007843138, 0, 1,
-3.012229, 0.3875785, -2.69108, 1, 0.01176471, 0, 1,
-2.985058, -0.6584159, 0.932663, 1, 0.01960784, 0, 1,
-2.941002, -0.1657193, -1.557677, 1, 0.02352941, 0, 1,
-2.933779, -0.1466456, -1.782984, 1, 0.03137255, 0, 1,
-2.898145, -0.4944161, -1.516919, 1, 0.03529412, 0, 1,
-2.809466, 0.8421357, -0.5663406, 1, 0.04313726, 0, 1,
-2.794999, -0.7032688, -0.8550465, 1, 0.04705882, 0, 1,
-2.563523, -0.2358396, -2.251171, 1, 0.05490196, 0, 1,
-2.508936, -0.2351094, -0.360388, 1, 0.05882353, 0, 1,
-2.485052, 0.09119497, -1.407768, 1, 0.06666667, 0, 1,
-2.451324, 0.3859675, -2.647513, 1, 0.07058824, 0, 1,
-2.373583, -0.3957084, -0.5856565, 1, 0.07843138, 0, 1,
-2.364549, -1.019896, -1.666477, 1, 0.08235294, 0, 1,
-2.34195, -0.5048116, -2.892388, 1, 0.09019608, 0, 1,
-2.336005, -0.1152321, -1.369883, 1, 0.09411765, 0, 1,
-2.334745, -3.766856, -2.703888, 1, 0.1019608, 0, 1,
-2.320792, 0.1352131, -1.737079, 1, 0.1098039, 0, 1,
-2.297012, -0.9290062, 0.7903498, 1, 0.1137255, 0, 1,
-2.261218, -0.4895842, -1.587024, 1, 0.1215686, 0, 1,
-2.256816, 0.1357262, -2.24974, 1, 0.1254902, 0, 1,
-2.242954, 1.77582, -0.326169, 1, 0.1333333, 0, 1,
-2.231091, -0.5722376, -2.279752, 1, 0.1372549, 0, 1,
-2.202788, 0.2940954, -1.915956, 1, 0.145098, 0, 1,
-2.199717, -0.9233018, -1.90718, 1, 0.1490196, 0, 1,
-2.173903, 0.8961028, -1.986999, 1, 0.1568628, 0, 1,
-2.125976, -0.5877834, -2.281029, 1, 0.1607843, 0, 1,
-2.076109, -0.2915823, -1.888842, 1, 0.1686275, 0, 1,
-2.064233, -1.009848, -2.883901, 1, 0.172549, 0, 1,
-2.040322, 0.6968907, -0.8100956, 1, 0.1803922, 0, 1,
-2.03578, 0.08177782, -1.717089, 1, 0.1843137, 0, 1,
-2.023685, 0.8379412, -1.907892, 1, 0.1921569, 0, 1,
-2.012992, -0.8700976, -1.017553, 1, 0.1960784, 0, 1,
-2.011285, -0.7364752, -2.374828, 1, 0.2039216, 0, 1,
-1.994344, -1.107303, 0.08205026, 1, 0.2117647, 0, 1,
-1.968153, 0.4475482, -1.462855, 1, 0.2156863, 0, 1,
-1.959271, 1.36063, -0.4460863, 1, 0.2235294, 0, 1,
-1.943466, -0.5019464, -1.840138, 1, 0.227451, 0, 1,
-1.942897, 0.1954806, -0.6959168, 1, 0.2352941, 0, 1,
-1.931073, 0.5040252, -0.6419232, 1, 0.2392157, 0, 1,
-1.918671, 0.2810768, 0.1357104, 1, 0.2470588, 0, 1,
-1.911682, -0.783668, -2.788244, 1, 0.2509804, 0, 1,
-1.906402, 0.9681213, -1.687196, 1, 0.2588235, 0, 1,
-1.905673, -0.3955983, -2.682674, 1, 0.2627451, 0, 1,
-1.900033, -0.8500781, -2.832949, 1, 0.2705882, 0, 1,
-1.896886, -0.6738204, -1.615967, 1, 0.2745098, 0, 1,
-1.883872, 0.007379266, -1.12344, 1, 0.282353, 0, 1,
-1.870716, -0.2990972, -0.9517516, 1, 0.2862745, 0, 1,
-1.854437, 0.6307179, -2.959289, 1, 0.2941177, 0, 1,
-1.84555, 0.0175197, -1.863365, 1, 0.3019608, 0, 1,
-1.835616, -1.756129, -2.623734, 1, 0.3058824, 0, 1,
-1.827859, -1.109259, -1.380608, 1, 0.3137255, 0, 1,
-1.78804, 0.2210594, -1.791964, 1, 0.3176471, 0, 1,
-1.783681, -1.434232, -3.431602, 1, 0.3254902, 0, 1,
-1.772459, 0.9122126, -0.7148644, 1, 0.3294118, 0, 1,
-1.760583, -2.185081, -3.852767, 1, 0.3372549, 0, 1,
-1.757041, -0.7582055, -1.756359, 1, 0.3411765, 0, 1,
-1.738082, 1.196837, -0.8707026, 1, 0.3490196, 0, 1,
-1.737426, -1.694948, -2.906673, 1, 0.3529412, 0, 1,
-1.7064, -1.873294, -2.633536, 1, 0.3607843, 0, 1,
-1.700257, -0.2197644, -0.05780282, 1, 0.3647059, 0, 1,
-1.686194, -1.488039, -1.589096, 1, 0.372549, 0, 1,
-1.662094, 0.4047023, 0.04512059, 1, 0.3764706, 0, 1,
-1.644898, -0.2003814, -2.357965, 1, 0.3843137, 0, 1,
-1.64455, -0.7939236, -3.007893, 1, 0.3882353, 0, 1,
-1.615631, -0.8800168, -3.424008, 1, 0.3960784, 0, 1,
-1.587825, 0.984168, -0.08219092, 1, 0.4039216, 0, 1,
-1.570841, 2.446555, 0.009483082, 1, 0.4078431, 0, 1,
-1.566481, -0.5925173, -0.7297181, 1, 0.4156863, 0, 1,
-1.548639, -0.6945203, -1.209846, 1, 0.4196078, 0, 1,
-1.531183, -1.856637, -1.560938, 1, 0.427451, 0, 1,
-1.528107, -0.2437309, -0.2987391, 1, 0.4313726, 0, 1,
-1.527117, -0.9613237, -1.114498, 1, 0.4392157, 0, 1,
-1.520497, -0.1573512, -1.483308, 1, 0.4431373, 0, 1,
-1.498434, -0.006642424, -2.237271, 1, 0.4509804, 0, 1,
-1.485917, -1.467083, -2.587519, 1, 0.454902, 0, 1,
-1.479457, -1.67488, -1.795463, 1, 0.4627451, 0, 1,
-1.477785, -0.8043446, -1.954489, 1, 0.4666667, 0, 1,
-1.460072, -0.6541851, -2.389176, 1, 0.4745098, 0, 1,
-1.45538, -0.09486033, -2.690331, 1, 0.4784314, 0, 1,
-1.447131, -1.575386, -4.363535, 1, 0.4862745, 0, 1,
-1.445773, 0.5183116, -2.234947, 1, 0.4901961, 0, 1,
-1.437983, 0.1516126, -1.793591, 1, 0.4980392, 0, 1,
-1.432101, 0.1686973, -0.945573, 1, 0.5058824, 0, 1,
-1.427182, -0.4745993, -2.712872, 1, 0.509804, 0, 1,
-1.421701, 0.07965885, -3.901662, 1, 0.5176471, 0, 1,
-1.411319, -0.0854577, -2.105745, 1, 0.5215687, 0, 1,
-1.405845, 0.4687937, -1.392305, 1, 0.5294118, 0, 1,
-1.40584, -1.91634, -1.615925, 1, 0.5333334, 0, 1,
-1.400463, -0.5973324, -3.730398, 1, 0.5411765, 0, 1,
-1.399317, 2.347041, -0.1862047, 1, 0.5450981, 0, 1,
-1.388808, 0.2638255, -1.033013, 1, 0.5529412, 0, 1,
-1.387144, 1.051526, -1.060854, 1, 0.5568628, 0, 1,
-1.381363, -0.5936675, -2.910102, 1, 0.5647059, 0, 1,
-1.370572, 0.5537547, -2.443953, 1, 0.5686275, 0, 1,
-1.368966, -0.4955056, -2.333859, 1, 0.5764706, 0, 1,
-1.367572, -0.9862749, -1.510331, 1, 0.5803922, 0, 1,
-1.360798, -0.8542992, -1.277082, 1, 0.5882353, 0, 1,
-1.351622, 0.4014279, -1.320526, 1, 0.5921569, 0, 1,
-1.343251, -1.640133, -2.379246, 1, 0.6, 0, 1,
-1.339177, -0.09845611, -1.705612, 1, 0.6078432, 0, 1,
-1.335512, 0.3901881, -0.7450714, 1, 0.6117647, 0, 1,
-1.313894, -1.225263, -2.407013, 1, 0.6196079, 0, 1,
-1.305156, -0.6324297, -1.264694, 1, 0.6235294, 0, 1,
-1.299945, -0.4490972, -1.333934, 1, 0.6313726, 0, 1,
-1.270715, 0.3506335, -1.526728, 1, 0.6352941, 0, 1,
-1.256225, -0.100774, -2.538868, 1, 0.6431373, 0, 1,
-1.254351, 0.2717476, -0.9668678, 1, 0.6470588, 0, 1,
-1.246585, -1.176091, -2.242947, 1, 0.654902, 0, 1,
-1.244549, 0.9165059, -2.165241, 1, 0.6588235, 0, 1,
-1.24063, -1.048303, -1.581135, 1, 0.6666667, 0, 1,
-1.229938, -0.1121408, -2.577587, 1, 0.6705883, 0, 1,
-1.21859, -0.4234247, -1.036052, 1, 0.6784314, 0, 1,
-1.217131, -1.700689, -3.196692, 1, 0.682353, 0, 1,
-1.213056, 0.3867055, -0.1878857, 1, 0.6901961, 0, 1,
-1.203319, 0.4502391, -1.250779, 1, 0.6941177, 0, 1,
-1.196843, 0.4018364, -1.470085, 1, 0.7019608, 0, 1,
-1.196435, -0.8031333, -2.21593, 1, 0.7098039, 0, 1,
-1.188662, -1.220145, -2.702216, 1, 0.7137255, 0, 1,
-1.187522, -0.7253112, -1.586686, 1, 0.7215686, 0, 1,
-1.185447, 1.459877, -1.793604, 1, 0.7254902, 0, 1,
-1.174583, 0.2979064, -0.4077157, 1, 0.7333333, 0, 1,
-1.167006, 0.7096075, -1.436965, 1, 0.7372549, 0, 1,
-1.165658, 0.02401005, -0.1753794, 1, 0.7450981, 0, 1,
-1.160409, 1.326101, -0.8909311, 1, 0.7490196, 0, 1,
-1.154605, 0.1780315, -1.654818, 1, 0.7568628, 0, 1,
-1.154021, 1.224953, 0.1494406, 1, 0.7607843, 0, 1,
-1.148547, -1.106866, -2.25128, 1, 0.7686275, 0, 1,
-1.148389, -0.09731527, -1.496834, 1, 0.772549, 0, 1,
-1.148099, 3.587167, 0.04862072, 1, 0.7803922, 0, 1,
-1.131318, -0.5614364, -3.464674, 1, 0.7843137, 0, 1,
-1.130856, 1.12102, -0.331758, 1, 0.7921569, 0, 1,
-1.130091, -0.7846239, -3.889119, 1, 0.7960784, 0, 1,
-1.125528, -0.8264033, -0.6720671, 1, 0.8039216, 0, 1,
-1.121755, -0.3205806, -1.602778, 1, 0.8117647, 0, 1,
-1.113398, 1.173349, -1.288095, 1, 0.8156863, 0, 1,
-1.111913, 0.9140661, 0.1047277, 1, 0.8235294, 0, 1,
-1.107316, -0.9767017, -2.182371, 1, 0.827451, 0, 1,
-1.097673, 0.5996329, -1.174945, 1, 0.8352941, 0, 1,
-1.095588, -1.023331, -2.597646, 1, 0.8392157, 0, 1,
-1.093697, -1.00885, -3.187609, 1, 0.8470588, 0, 1,
-1.090734, -0.5075174, -2.634151, 1, 0.8509804, 0, 1,
-1.089892, -2.219521, -1.001281, 1, 0.8588235, 0, 1,
-1.087477, -1.447546, -2.78847, 1, 0.8627451, 0, 1,
-1.082244, -0.2617749, -1.580308, 1, 0.8705882, 0, 1,
-1.080731, 1.743404, -2.457674, 1, 0.8745098, 0, 1,
-1.080375, 0.01794377, -2.795333, 1, 0.8823529, 0, 1,
-1.080357, -0.09677124, -3.878531, 1, 0.8862745, 0, 1,
-1.077815, -1.739656, -2.182916, 1, 0.8941177, 0, 1,
-1.074649, -0.5646631, -1.785495, 1, 0.8980392, 0, 1,
-1.074001, 1.477683, 1.134917, 1, 0.9058824, 0, 1,
-1.069982, 1.11382, -2.694774, 1, 0.9137255, 0, 1,
-1.069953, 1.4382, -1.990583, 1, 0.9176471, 0, 1,
-1.059306, -1.780555, -2.062755, 1, 0.9254902, 0, 1,
-1.051605, -0.4223515, -1.330003, 1, 0.9294118, 0, 1,
-1.043744, 0.8635005, -1.206502, 1, 0.9372549, 0, 1,
-1.043424, -1.420005, -3.049912, 1, 0.9411765, 0, 1,
-1.040007, -1.483579, -3.75957, 1, 0.9490196, 0, 1,
-1.032101, 0.2220119, -1.485961, 1, 0.9529412, 0, 1,
-1.03015, 0.2801974, -1.225202, 1, 0.9607843, 0, 1,
-1.028406, 0.8585038, -1.697703, 1, 0.9647059, 0, 1,
-1.025126, 0.05429363, -0.262305, 1, 0.972549, 0, 1,
-1.022367, -1.50692, -2.978032, 1, 0.9764706, 0, 1,
-1.018725, -1.632149, -2.173189, 1, 0.9843137, 0, 1,
-1.01807, -1.20017, -2.309216, 1, 0.9882353, 0, 1,
-1.015947, -1.900423, -1.964319, 1, 0.9960784, 0, 1,
-1.014246, 1.514699, -1.274608, 0.9960784, 1, 0, 1,
-1.012972, 1.418531, -1.757424, 0.9921569, 1, 0, 1,
-1.009826, -0.1184606, -0.3444964, 0.9843137, 1, 0, 1,
-0.9988609, 0.631309, -1.242472, 0.9803922, 1, 0, 1,
-0.9897618, 0.4437017, -2.260154, 0.972549, 1, 0, 1,
-0.9888548, 1.245292, -1.318826, 0.9686275, 1, 0, 1,
-0.980524, 0.8543395, -0.5552009, 0.9607843, 1, 0, 1,
-0.9801989, 0.8318133, 0.6037016, 0.9568627, 1, 0, 1,
-0.9760448, -0.3912399, -2.414693, 0.9490196, 1, 0, 1,
-0.9748415, -0.276471, 0.2883677, 0.945098, 1, 0, 1,
-0.9599468, -0.8150872, -1.769542, 0.9372549, 1, 0, 1,
-0.9590922, -1.136909, -4.49827, 0.9333333, 1, 0, 1,
-0.9550388, -0.3473548, -1.019886, 0.9254902, 1, 0, 1,
-0.9547623, -0.606671, -2.358077, 0.9215686, 1, 0, 1,
-0.9527497, 0.8082262, -0.4338271, 0.9137255, 1, 0, 1,
-0.9442164, -0.3083766, -2.743043, 0.9098039, 1, 0, 1,
-0.9436923, 1.796393, 0.8661773, 0.9019608, 1, 0, 1,
-0.9436689, -0.9769465, -1.48436, 0.8941177, 1, 0, 1,
-0.9435749, 1.393556, -1.02707, 0.8901961, 1, 0, 1,
-0.9430349, 1.141272, -1.207931, 0.8823529, 1, 0, 1,
-0.9422073, 0.6374022, -1.370407, 0.8784314, 1, 0, 1,
-0.9399781, -1.323554, -4.155868, 0.8705882, 1, 0, 1,
-0.9393141, 0.9173356, -0.3841929, 0.8666667, 1, 0, 1,
-0.9359388, 1.575789, -0.9223313, 0.8588235, 1, 0, 1,
-0.9313992, 1.084052, -1.405067, 0.854902, 1, 0, 1,
-0.924979, -0.262873, -2.497447, 0.8470588, 1, 0, 1,
-0.9233632, 1.426756, -0.5511419, 0.8431373, 1, 0, 1,
-0.9225286, 1.588904, -1.570911, 0.8352941, 1, 0, 1,
-0.9121606, 0.2333042, -1.573229, 0.8313726, 1, 0, 1,
-0.9072789, -0.679952, -3.8102, 0.8235294, 1, 0, 1,
-0.8953735, -2.246838, -1.953126, 0.8196079, 1, 0, 1,
-0.8950418, -1.366739, -3.33204, 0.8117647, 1, 0, 1,
-0.8857616, -1.227087, -4.082298, 0.8078431, 1, 0, 1,
-0.883996, 0.4036241, -2.243374, 0.8, 1, 0, 1,
-0.8808497, 0.6679332, -0.4123967, 0.7921569, 1, 0, 1,
-0.8767363, -0.8423744, -3.067223, 0.7882353, 1, 0, 1,
-0.8680667, -1.711166, -1.277836, 0.7803922, 1, 0, 1,
-0.8677194, -0.2267458, -1.601344, 0.7764706, 1, 0, 1,
-0.8663623, 0.8671357, -0.6112303, 0.7686275, 1, 0, 1,
-0.8602644, 0.2076782, 0.5588638, 0.7647059, 1, 0, 1,
-0.858355, -1.778825, -3.51541, 0.7568628, 1, 0, 1,
-0.8581223, -0.1729544, -1.905965, 0.7529412, 1, 0, 1,
-0.8566706, 1.4249, -0.4500857, 0.7450981, 1, 0, 1,
-0.8565583, 0.2670588, -1.713631, 0.7411765, 1, 0, 1,
-0.8492239, 1.209849, -1.60597, 0.7333333, 1, 0, 1,
-0.8460482, 0.8449267, 0.1026716, 0.7294118, 1, 0, 1,
-0.8366371, -0.8176574, -3.35645, 0.7215686, 1, 0, 1,
-0.8334606, -0.6691523, -2.249614, 0.7176471, 1, 0, 1,
-0.8280632, -1.761685, -4.466703, 0.7098039, 1, 0, 1,
-0.8279497, -1.896657, -5.084181, 0.7058824, 1, 0, 1,
-0.82135, -0.6392035, -3.635399, 0.6980392, 1, 0, 1,
-0.8204781, 1.00814, 0.740699, 0.6901961, 1, 0, 1,
-0.8125671, -0.510599, -4.173635, 0.6862745, 1, 0, 1,
-0.8086032, -1.476495, -3.427825, 0.6784314, 1, 0, 1,
-0.8079681, 0.9246599, 1.296142, 0.6745098, 1, 0, 1,
-0.7971222, 0.0351162, -4.074646, 0.6666667, 1, 0, 1,
-0.7950482, 1.181378, 0.2110739, 0.6627451, 1, 0, 1,
-0.7943836, -1.197518, -3.233033, 0.654902, 1, 0, 1,
-0.7929927, -1.014653, -4.122411, 0.6509804, 1, 0, 1,
-0.7906979, -0.4286482, -1.158353, 0.6431373, 1, 0, 1,
-0.7903017, -1.025251, -1.726189, 0.6392157, 1, 0, 1,
-0.7887276, 0.5392439, -0.6897573, 0.6313726, 1, 0, 1,
-0.7826586, -0.3233031, -1.297469, 0.627451, 1, 0, 1,
-0.7792454, -1.795661, -3.149311, 0.6196079, 1, 0, 1,
-0.7783632, -1.328952, -1.429404, 0.6156863, 1, 0, 1,
-0.7668582, -1.516662, -2.339293, 0.6078432, 1, 0, 1,
-0.7668458, 1.177554, -0.1124781, 0.6039216, 1, 0, 1,
-0.7645081, -0.2109711, -3.509119, 0.5960785, 1, 0, 1,
-0.7641452, 0.2834185, -3.460205, 0.5882353, 1, 0, 1,
-0.7640755, 2.39967, 0.7860712, 0.5843138, 1, 0, 1,
-0.7629726, -0.1888729, -1.141476, 0.5764706, 1, 0, 1,
-0.7629575, 1.279485, 0.5435294, 0.572549, 1, 0, 1,
-0.7586738, 2.08665, -0.2022078, 0.5647059, 1, 0, 1,
-0.7582315, -1.013248, -0.980903, 0.5607843, 1, 0, 1,
-0.7515703, -0.5741962, -2.188348, 0.5529412, 1, 0, 1,
-0.7490786, -1.992873, -4.206053, 0.5490196, 1, 0, 1,
-0.7361937, -0.8563238, -1.368972, 0.5411765, 1, 0, 1,
-0.7330654, -0.7676466, -3.210097, 0.5372549, 1, 0, 1,
-0.7247757, -1.963035, -1.424461, 0.5294118, 1, 0, 1,
-0.72462, 0.8175908, 0.7809702, 0.5254902, 1, 0, 1,
-0.7216042, -0.2421658, -3.051256, 0.5176471, 1, 0, 1,
-0.7169715, -0.9418389, -1.430679, 0.5137255, 1, 0, 1,
-0.7157747, 0.9955729, -0.9320735, 0.5058824, 1, 0, 1,
-0.71464, -0.1658364, -1.938525, 0.5019608, 1, 0, 1,
-0.7143499, -0.9225197, -2.236473, 0.4941176, 1, 0, 1,
-0.7106975, -0.9874421, -3.078242, 0.4862745, 1, 0, 1,
-0.7082723, 0.710446, 1.024538, 0.4823529, 1, 0, 1,
-0.7043979, -0.04982669, -3.069748, 0.4745098, 1, 0, 1,
-0.695899, 1.01406, -0.2482041, 0.4705882, 1, 0, 1,
-0.6889561, 1.507994, 1.184704, 0.4627451, 1, 0, 1,
-0.6887274, 1.04491, 0.235583, 0.4588235, 1, 0, 1,
-0.6862854, -1.237495, -1.973548, 0.4509804, 1, 0, 1,
-0.6832724, -2.007157, -3.789011, 0.4470588, 1, 0, 1,
-0.682208, 1.907688, -0.318266, 0.4392157, 1, 0, 1,
-0.6794746, -1.618333, -1.585858, 0.4352941, 1, 0, 1,
-0.6734967, -0.1438373, -3.870403, 0.427451, 1, 0, 1,
-0.6693797, -0.6305307, -2.014328, 0.4235294, 1, 0, 1,
-0.6675534, 0.4171605, 0.2184956, 0.4156863, 1, 0, 1,
-0.6640794, -1.018193, -3.559168, 0.4117647, 1, 0, 1,
-0.6600623, 0.5579614, -0.3241098, 0.4039216, 1, 0, 1,
-0.6598995, 0.3569604, -2.051916, 0.3960784, 1, 0, 1,
-0.6579645, -0.4495694, -3.788388, 0.3921569, 1, 0, 1,
-0.6553813, 0.5647058, -1.209558, 0.3843137, 1, 0, 1,
-0.6539108, 0.1499228, 0.2426159, 0.3803922, 1, 0, 1,
-0.6492972, -2.142985, -2.535206, 0.372549, 1, 0, 1,
-0.6445699, -1.22021, -1.880506, 0.3686275, 1, 0, 1,
-0.6434838, -1.025324, -4.394828, 0.3607843, 1, 0, 1,
-0.6405181, 1.990796, -0.9231496, 0.3568628, 1, 0, 1,
-0.6394267, 1.025955, -1.041718, 0.3490196, 1, 0, 1,
-0.6282869, -0.3119771, -1.747374, 0.345098, 1, 0, 1,
-0.6262324, 0.4063554, -1.551342, 0.3372549, 1, 0, 1,
-0.6145914, 0.2616675, -2.469999, 0.3333333, 1, 0, 1,
-0.6132566, 0.5503655, 0.2582517, 0.3254902, 1, 0, 1,
-0.6116526, 1.376357, -0.9525664, 0.3215686, 1, 0, 1,
-0.6110136, -2.09997, -3.596103, 0.3137255, 1, 0, 1,
-0.6107162, 1.231074, -0.8094128, 0.3098039, 1, 0, 1,
-0.6070091, 1.677146, -0.7680662, 0.3019608, 1, 0, 1,
-0.605805, 0.1800806, -1.202272, 0.2941177, 1, 0, 1,
-0.6026987, -0.3244758, -1.471159, 0.2901961, 1, 0, 1,
-0.5930141, -0.8369218, -1.679792, 0.282353, 1, 0, 1,
-0.5906193, 0.3675642, 0.5750163, 0.2784314, 1, 0, 1,
-0.5899011, -1.928112, -2.538666, 0.2705882, 1, 0, 1,
-0.5886528, -0.6442074, -2.042287, 0.2666667, 1, 0, 1,
-0.5869787, 0.9879169, -1.825988, 0.2588235, 1, 0, 1,
-0.5824468, -1.137744, -1.8591, 0.254902, 1, 0, 1,
-0.5817992, -0.7262262, -1.758318, 0.2470588, 1, 0, 1,
-0.5816128, -1.298699, -2.888686, 0.2431373, 1, 0, 1,
-0.5800018, 0.5859128, -0.3413829, 0.2352941, 1, 0, 1,
-0.5786386, 0.3744046, 0.6648219, 0.2313726, 1, 0, 1,
-0.5737126, 0.3483397, -1.08091, 0.2235294, 1, 0, 1,
-0.5708846, -1.236491, -3.370181, 0.2196078, 1, 0, 1,
-0.569208, -0.5482404, -1.882431, 0.2117647, 1, 0, 1,
-0.5645453, -0.2380908, -2.630182, 0.2078431, 1, 0, 1,
-0.5539718, -0.2836141, -2.84626, 0.2, 1, 0, 1,
-0.5531888, -0.4371174, -2.039704, 0.1921569, 1, 0, 1,
-0.5514628, 0.6221506, -0.9709617, 0.1882353, 1, 0, 1,
-0.549363, 1.526801, -0.1965286, 0.1803922, 1, 0, 1,
-0.5470434, 0.6697213, -1.077809, 0.1764706, 1, 0, 1,
-0.5446615, 0.07114843, -1.035962, 0.1686275, 1, 0, 1,
-0.5432015, -0.1833552, -0.2612762, 0.1647059, 1, 0, 1,
-0.542059, 0.7882451, -1.349586, 0.1568628, 1, 0, 1,
-0.5386147, -1.779883, -3.822318, 0.1529412, 1, 0, 1,
-0.5344944, 1.075278, -2.652126, 0.145098, 1, 0, 1,
-0.5326024, -0.3175417, -1.059504, 0.1411765, 1, 0, 1,
-0.5270276, 0.5862228, -0.6042922, 0.1333333, 1, 0, 1,
-0.5262724, 1.114696, 0.6076666, 0.1294118, 1, 0, 1,
-0.5260079, -0.5654767, -3.557411, 0.1215686, 1, 0, 1,
-0.5248861, 1.976581, -0.475445, 0.1176471, 1, 0, 1,
-0.5248064, 0.4614004, -0.5707529, 0.1098039, 1, 0, 1,
-0.5247036, -1.778664, -4.604312, 0.1058824, 1, 0, 1,
-0.5241293, 1.234614, 1.252342, 0.09803922, 1, 0, 1,
-0.5230152, 0.3499047, 0.9584779, 0.09019608, 1, 0, 1,
-0.521804, 0.9401225, -0.5716822, 0.08627451, 1, 0, 1,
-0.5108834, -0.774722, -3.638497, 0.07843138, 1, 0, 1,
-0.5089659, 1.570999, -0.4327994, 0.07450981, 1, 0, 1,
-0.5069119, 1.123754, 0.6025093, 0.06666667, 1, 0, 1,
-0.5026084, -0.4703063, -1.664458, 0.0627451, 1, 0, 1,
-0.5008001, 1.709211, 0.4567607, 0.05490196, 1, 0, 1,
-0.4967579, -0.1348978, -1.926386, 0.05098039, 1, 0, 1,
-0.4959883, -0.2599718, -1.320745, 0.04313726, 1, 0, 1,
-0.4950547, -1.255819, -3.37472, 0.03921569, 1, 0, 1,
-0.48565, 0.9923353, -0.8087378, 0.03137255, 1, 0, 1,
-0.4832103, 0.8195711, -1.363877, 0.02745098, 1, 0, 1,
-0.4819517, -0.4302617, -2.967596, 0.01960784, 1, 0, 1,
-0.4775759, -1.024544, -2.5354, 0.01568628, 1, 0, 1,
-0.4762707, -0.8085462, -2.223146, 0.007843138, 1, 0, 1,
-0.4753698, 1.307218, -0.5317417, 0.003921569, 1, 0, 1,
-0.474686, -0.8623406, -3.423064, 0, 1, 0.003921569, 1,
-0.4743222, 2.560393, -1.337969, 0, 1, 0.01176471, 1,
-0.4732741, 0.6324808, 0.2188565, 0, 1, 0.01568628, 1,
-0.4726961, -0.3006736, -2.021764, 0, 1, 0.02352941, 1,
-0.4662153, 1.382609, -0.05047983, 0, 1, 0.02745098, 1,
-0.4616617, -0.2613113, -2.15295, 0, 1, 0.03529412, 1,
-0.4588501, -0.4466828, -3.897648, 0, 1, 0.03921569, 1,
-0.4508119, 0.7727959, -0.5052252, 0, 1, 0.04705882, 1,
-0.4496022, 1.250407, 1.682303, 0, 1, 0.05098039, 1,
-0.447709, 0.190799, -1.961313, 0, 1, 0.05882353, 1,
-0.4476472, -0.6274005, -2.699476, 0, 1, 0.0627451, 1,
-0.4462821, 0.632127, 0.268409, 0, 1, 0.07058824, 1,
-0.439462, 0.5607862, -0.5400441, 0, 1, 0.07450981, 1,
-0.4310797, 0.3433863, 0.6071593, 0, 1, 0.08235294, 1,
-0.4309277, 1.704515, 0.2608178, 0, 1, 0.08627451, 1,
-0.4305168, 0.1874459, -1.892306, 0, 1, 0.09411765, 1,
-0.4276604, -1.022575, -2.776686, 0, 1, 0.1019608, 1,
-0.4276041, -0.1586228, -2.472159, 0, 1, 0.1058824, 1,
-0.4232481, 2.063929, 1.081371, 0, 1, 0.1137255, 1,
-0.4180934, -0.008335171, -1.540919, 0, 1, 0.1176471, 1,
-0.4171856, 0.03014438, 0.06097298, 0, 1, 0.1254902, 1,
-0.4161713, 0.3043258, -2.189956, 0, 1, 0.1294118, 1,
-0.4159005, -0.742585, -3.910916, 0, 1, 0.1372549, 1,
-0.4138482, -0.6730912, -2.358882, 0, 1, 0.1411765, 1,
-0.4114853, 1.154612, -0.279358, 0, 1, 0.1490196, 1,
-0.4045061, 1.6995, -1.597708, 0, 1, 0.1529412, 1,
-0.4024723, 0.2035769, -1.441225, 0, 1, 0.1607843, 1,
-0.3936724, -0.7742126, -1.895126, 0, 1, 0.1647059, 1,
-0.3887171, 0.7209772, -0.3401024, 0, 1, 0.172549, 1,
-0.3869198, -0.4314081, -4.794777, 0, 1, 0.1764706, 1,
-0.3863307, 1.112846, 0.1568265, 0, 1, 0.1843137, 1,
-0.3862707, 0.9853179, -0.8006153, 0, 1, 0.1882353, 1,
-0.384253, 1.971691, 1.559086, 0, 1, 0.1960784, 1,
-0.3839638, -0.4603925, 0.1381543, 0, 1, 0.2039216, 1,
-0.381461, 0.292037, -1.663812, 0, 1, 0.2078431, 1,
-0.3801091, 0.7241881, -1.686689, 0, 1, 0.2156863, 1,
-0.3798977, -0.1876614, -1.082746, 0, 1, 0.2196078, 1,
-0.3721871, 0.7589213, 0.9966376, 0, 1, 0.227451, 1,
-0.3667327, -0.77089, -1.845326, 0, 1, 0.2313726, 1,
-0.3655357, -1.738631, -1.999712, 0, 1, 0.2392157, 1,
-0.3641019, 0.5657046, 0.4700805, 0, 1, 0.2431373, 1,
-0.3640188, -0.4183097, -2.802991, 0, 1, 0.2509804, 1,
-0.3627078, -1.686145, -3.822344, 0, 1, 0.254902, 1,
-0.3607342, 0.6198276, 1.220328, 0, 1, 0.2627451, 1,
-0.3604125, -0.7939296, -2.218164, 0, 1, 0.2666667, 1,
-0.3581461, 1.361138, 0.4119368, 0, 1, 0.2745098, 1,
-0.355453, -0.6735504, -3.352357, 0, 1, 0.2784314, 1,
-0.3535868, 0.3890827, 0.2400852, 0, 1, 0.2862745, 1,
-0.3510917, 0.7661502, -1.208086, 0, 1, 0.2901961, 1,
-0.3475919, 1.125148, 0.4791131, 0, 1, 0.2980392, 1,
-0.3471186, -0.8475782, -2.364671, 0, 1, 0.3058824, 1,
-0.3439064, -0.8913971, -2.858011, 0, 1, 0.3098039, 1,
-0.3414009, -0.7289599, -2.847589, 0, 1, 0.3176471, 1,
-0.3375647, -2.023673, -3.821112, 0, 1, 0.3215686, 1,
-0.3358086, 0.760865, -0.6343254, 0, 1, 0.3294118, 1,
-0.3349229, -0.3007077, 0.2499931, 0, 1, 0.3333333, 1,
-0.3343293, 0.2158657, -1.602888, 0, 1, 0.3411765, 1,
-0.3305729, 0.1538688, -1.498773, 0, 1, 0.345098, 1,
-0.3289571, 0.4888816, -0.4594075, 0, 1, 0.3529412, 1,
-0.3250332, -0.04646923, -2.206497, 0, 1, 0.3568628, 1,
-0.3246218, -1.395852, -2.286723, 0, 1, 0.3647059, 1,
-0.3231172, 0.2471696, -1.16956, 0, 1, 0.3686275, 1,
-0.3175779, -0.565391, -2.540428, 0, 1, 0.3764706, 1,
-0.3139553, 1.041985, 0.1884757, 0, 1, 0.3803922, 1,
-0.3059849, 0.914681, -2.622068, 0, 1, 0.3882353, 1,
-0.3029305, 0.09918195, -1.89326, 0, 1, 0.3921569, 1,
-0.302328, -0.4417292, -2.892152, 0, 1, 0.4, 1,
-0.3019227, 0.547282, 0.06256435, 0, 1, 0.4078431, 1,
-0.3011388, -1.024585, -4.805754, 0, 1, 0.4117647, 1,
-0.2950334, 0.6516916, -1.14697, 0, 1, 0.4196078, 1,
-0.2938271, 2.156157, 0.09764105, 0, 1, 0.4235294, 1,
-0.2936699, -0.4207059, -0.5451794, 0, 1, 0.4313726, 1,
-0.2903881, -1.096082, -3.458579, 0, 1, 0.4352941, 1,
-0.290062, 1.166392, 0.702557, 0, 1, 0.4431373, 1,
-0.2894271, 0.07453363, -0.4582915, 0, 1, 0.4470588, 1,
-0.2893981, 0.108603, -1.630262, 0, 1, 0.454902, 1,
-0.2827981, -1.419188, -3.168838, 0, 1, 0.4588235, 1,
-0.2799529, 1.308401, -0.4951035, 0, 1, 0.4666667, 1,
-0.2796742, 0.9434642, -1.363451, 0, 1, 0.4705882, 1,
-0.2794666, -0.8521359, -0.6322834, 0, 1, 0.4784314, 1,
-0.2749805, -0.9735476, -3.647251, 0, 1, 0.4823529, 1,
-0.2744095, 0.1244543, -1.439122, 0, 1, 0.4901961, 1,
-0.2727558, -0.3025787, -2.45313, 0, 1, 0.4941176, 1,
-0.2717388, 0.01952345, -0.8114879, 0, 1, 0.5019608, 1,
-0.2706398, 0.8941627, -1.544537, 0, 1, 0.509804, 1,
-0.2702605, 0.7920151, 0.04003946, 0, 1, 0.5137255, 1,
-0.2688762, -2.113166, -1.537905, 0, 1, 0.5215687, 1,
-0.2660978, 0.2180799, -0.164576, 0, 1, 0.5254902, 1,
-0.2644319, 1.210357, 0.9681399, 0, 1, 0.5333334, 1,
-0.2602882, -1.025373, -2.516752, 0, 1, 0.5372549, 1,
-0.2594849, 0.2153515, -0.973287, 0, 1, 0.5450981, 1,
-0.2588758, 0.1482484, -0.9118207, 0, 1, 0.5490196, 1,
-0.2534001, 1.516336, -1.464193, 0, 1, 0.5568628, 1,
-0.2520454, -0.2785284, -2.267256, 0, 1, 0.5607843, 1,
-0.2459789, -0.3178504, -1.212994, 0, 1, 0.5686275, 1,
-0.2437713, 2.457046, -1.666398, 0, 1, 0.572549, 1,
-0.2412942, 0.3432539, 0.2399667, 0, 1, 0.5803922, 1,
-0.2361649, 0.8831817, 0.7071878, 0, 1, 0.5843138, 1,
-0.2348749, -0.7915568, -1.458347, 0, 1, 0.5921569, 1,
-0.2337914, -1.35901, -4.022945, 0, 1, 0.5960785, 1,
-0.2331303, -0.5567483, -2.640688, 0, 1, 0.6039216, 1,
-0.2322855, -0.4514888, -2.597015, 0, 1, 0.6117647, 1,
-0.2223052, -2.032956, -3.232355, 0, 1, 0.6156863, 1,
-0.2185681, -0.9691626, -3.635018, 0, 1, 0.6235294, 1,
-0.2117069, -0.7065783, -2.716914, 0, 1, 0.627451, 1,
-0.2051529, -1.650065, -2.632497, 0, 1, 0.6352941, 1,
-0.2050997, -1.128984, -2.091142, 0, 1, 0.6392157, 1,
-0.2037442, -1.347015, -3.315424, 0, 1, 0.6470588, 1,
-0.2023321, 0.6087351, -1.332248, 0, 1, 0.6509804, 1,
-0.2014495, -0.2121313, -1.327112, 0, 1, 0.6588235, 1,
-0.2004702, 0.3582309, 0.4709173, 0, 1, 0.6627451, 1,
-0.198304, 0.09851245, -0.4424747, 0, 1, 0.6705883, 1,
-0.1942457, -0.6521444, -3.534219, 0, 1, 0.6745098, 1,
-0.1939264, -1.08967, -2.58466, 0, 1, 0.682353, 1,
-0.1922995, 1.171665, -0.7409186, 0, 1, 0.6862745, 1,
-0.1832414, 1.656802, -0.2489995, 0, 1, 0.6941177, 1,
-0.1822283, -1.61874, -2.563067, 0, 1, 0.7019608, 1,
-0.1804921, 1.116044, 0.575128, 0, 1, 0.7058824, 1,
-0.1767631, -1.104754, -3.716525, 0, 1, 0.7137255, 1,
-0.1762496, -0.2437842, -2.269846, 0, 1, 0.7176471, 1,
-0.1717615, 0.002538686, 0.4413817, 0, 1, 0.7254902, 1,
-0.1700923, 0.6705082, -1.326468, 0, 1, 0.7294118, 1,
-0.1664147, 0.02337318, -1.72512, 0, 1, 0.7372549, 1,
-0.1663074, 2.287649, 0.5459494, 0, 1, 0.7411765, 1,
-0.1638107, -1.981307, -2.136519, 0, 1, 0.7490196, 1,
-0.1555058, 0.1774091, -1.462022, 0, 1, 0.7529412, 1,
-0.1546942, -0.6294569, -3.919342, 0, 1, 0.7607843, 1,
-0.1543823, -1.113108, -1.911077, 0, 1, 0.7647059, 1,
-0.1533285, -0.1659074, -3.699793, 0, 1, 0.772549, 1,
-0.1481265, -0.5217925, -1.836896, 0, 1, 0.7764706, 1,
-0.1465988, -0.1279746, -2.414037, 0, 1, 0.7843137, 1,
-0.1452565, 1.085417, 0.4288204, 0, 1, 0.7882353, 1,
-0.1436789, -1.144734, -5.535133, 0, 1, 0.7960784, 1,
-0.1320381, -0.8682088, -3.558069, 0, 1, 0.8039216, 1,
-0.1319621, 0.7313881, 0.7935855, 0, 1, 0.8078431, 1,
-0.1308646, -1.122879, -2.990843, 0, 1, 0.8156863, 1,
-0.1296082, -0.5477098, -2.854514, 0, 1, 0.8196079, 1,
-0.1295399, -0.1784612, -3.253242, 0, 1, 0.827451, 1,
-0.1268944, -1.064002, -2.553668, 0, 1, 0.8313726, 1,
-0.1232554, -0.1032346, -1.186097, 0, 1, 0.8392157, 1,
-0.1198428, 1.212714, 0.8478373, 0, 1, 0.8431373, 1,
-0.1192685, 1.024925, -0.1495091, 0, 1, 0.8509804, 1,
-0.1186591, 0.9813918, -1.324148, 0, 1, 0.854902, 1,
-0.1170887, -1.584549, -2.262853, 0, 1, 0.8627451, 1,
-0.1155414, -0.1043936, -0.9992753, 0, 1, 0.8666667, 1,
-0.1139606, -1.928446, -2.065063, 0, 1, 0.8745098, 1,
-0.1124289, 0.05224554, -3.047221, 0, 1, 0.8784314, 1,
-0.112147, -3.432246, -3.561039, 0, 1, 0.8862745, 1,
-0.1112894, 0.004129649, -1.228548, 0, 1, 0.8901961, 1,
-0.110323, 1.06377, -0.1331074, 0, 1, 0.8980392, 1,
-0.1092584, 0.6725941, 0.440006, 0, 1, 0.9058824, 1,
-0.1058031, 1.071623, 0.9156133, 0, 1, 0.9098039, 1,
-0.1031271, 0.5506391, 0.9393679, 0, 1, 0.9176471, 1,
-0.09909938, -0.9649926, -2.007891, 0, 1, 0.9215686, 1,
-0.09723955, -0.3656928, -1.962717, 0, 1, 0.9294118, 1,
-0.09506929, 1.359434, -0.004035396, 0, 1, 0.9333333, 1,
-0.09320557, -0.1828959, -3.291255, 0, 1, 0.9411765, 1,
-0.09191786, 0.9460149, -0.7011582, 0, 1, 0.945098, 1,
-0.09138957, 0.6193293, -0.03350489, 0, 1, 0.9529412, 1,
-0.08917389, 1.418215, -1.236503, 0, 1, 0.9568627, 1,
-0.08856453, 0.3912192, -0.1759554, 0, 1, 0.9647059, 1,
-0.08846524, -0.8278992, -3.893055, 0, 1, 0.9686275, 1,
-0.08357751, -0.9211417, -2.849793, 0, 1, 0.9764706, 1,
-0.08165863, 0.5892218, -0.276574, 0, 1, 0.9803922, 1,
-0.08139114, 0.6258942, -0.7830933, 0, 1, 0.9882353, 1,
-0.0780687, -0.6186705, -2.886924, 0, 1, 0.9921569, 1,
-0.07505328, -1.604876, -3.668966, 0, 1, 1, 1,
-0.06958825, -1.098116, -3.341049, 0, 0.9921569, 1, 1,
-0.06460673, -1.061688, -3.268783, 0, 0.9882353, 1, 1,
-0.06407195, -0.5110868, 0.1308646, 0, 0.9803922, 1, 1,
-0.06352021, -0.749527, -2.226404, 0, 0.9764706, 1, 1,
-0.06302192, -0.657759, -3.109361, 0, 0.9686275, 1, 1,
-0.05580298, -1.77167, -2.19066, 0, 0.9647059, 1, 1,
-0.05411306, 0.2091471, 0.712419, 0, 0.9568627, 1, 1,
-0.05364486, 0.4834312, -0.381561, 0, 0.9529412, 1, 1,
-0.0531566, -0.6223823, -3.321178, 0, 0.945098, 1, 1,
-0.05250824, -0.07255351, -3.085008, 0, 0.9411765, 1, 1,
-0.05049955, 0.3823434, 1.546018, 0, 0.9333333, 1, 1,
-0.04838081, -1.210263, -3.148224, 0, 0.9294118, 1, 1,
-0.0452215, 0.4558469, -1.023161, 0, 0.9215686, 1, 1,
-0.03780966, 0.8229619, -0.2910745, 0, 0.9176471, 1, 1,
-0.03330818, -1.801866, -2.972749, 0, 0.9098039, 1, 1,
-0.03125086, 0.5995207, -0.6804681, 0, 0.9058824, 1, 1,
-0.02868956, -0.630477, -3.299459, 0, 0.8980392, 1, 1,
-0.02075684, 0.06165349, -0.9257958, 0, 0.8901961, 1, 1,
-0.01921755, 2.39662, 1.028399, 0, 0.8862745, 1, 1,
-0.01683952, -1.040631, -3.386805, 0, 0.8784314, 1, 1,
-0.01680041, -2.160615, -5.122502, 0, 0.8745098, 1, 1,
-0.00970526, 0.3016536, 1.050665, 0, 0.8666667, 1, 1,
-0.008416303, 2.043769, -0.145198, 0, 0.8627451, 1, 1,
-0.008314794, -0.9945694, -3.707839, 0, 0.854902, 1, 1,
-0.007379311, 1.180547, 0.6195573, 0, 0.8509804, 1, 1,
0.0009646796, -0.1604317, 5.578923, 0, 0.8431373, 1, 1,
0.001188329, 0.26013, 0.689853, 0, 0.8392157, 1, 1,
0.003127246, 0.5513275, -0.3926587, 0, 0.8313726, 1, 1,
0.00547503, -0.8090438, 2.321753, 0, 0.827451, 1, 1,
0.01229905, 0.1333378, 0.8673627, 0, 0.8196079, 1, 1,
0.01258729, -1.283582, 2.919586, 0, 0.8156863, 1, 1,
0.01433194, -0.3126694, 0.6923376, 0, 0.8078431, 1, 1,
0.01532517, 0.2243621, 2.173354, 0, 0.8039216, 1, 1,
0.01838574, 0.8736511, -1.068247, 0, 0.7960784, 1, 1,
0.01859046, -1.137802, 2.172515, 0, 0.7882353, 1, 1,
0.02715554, 1.060418, 1.045705, 0, 0.7843137, 1, 1,
0.02871397, -0.3389711, 1.879719, 0, 0.7764706, 1, 1,
0.031781, -0.2622056, 3.751966, 0, 0.772549, 1, 1,
0.03309905, 1.088863, -0.6420043, 0, 0.7647059, 1, 1,
0.03352662, 1.130857, 0.7381503, 0, 0.7607843, 1, 1,
0.04056237, 1.663652, -0.6088508, 0, 0.7529412, 1, 1,
0.04196815, 0.5480158, 0.1689448, 0, 0.7490196, 1, 1,
0.04887623, -2.017961, 1.456728, 0, 0.7411765, 1, 1,
0.0498581, 0.2320995, 0.3593588, 0, 0.7372549, 1, 1,
0.05059398, 1.313674, 1.558614, 0, 0.7294118, 1, 1,
0.05308588, -0.2830788, 2.192506, 0, 0.7254902, 1, 1,
0.05375878, -0.8147821, 2.122818, 0, 0.7176471, 1, 1,
0.05917441, -0.6364571, 4.077093, 0, 0.7137255, 1, 1,
0.06925838, 2.103234, 0.1444609, 0, 0.7058824, 1, 1,
0.06930231, 0.5000623, -0.8707754, 0, 0.6980392, 1, 1,
0.07140473, 0.2415879, -0.7195529, 0, 0.6941177, 1, 1,
0.07156229, 0.4699294, 0.9424461, 0, 0.6862745, 1, 1,
0.07526357, -0.594731, 4.306364, 0, 0.682353, 1, 1,
0.07701331, 1.367751, -0.8502616, 0, 0.6745098, 1, 1,
0.07777014, -3.140325, 4.878529, 0, 0.6705883, 1, 1,
0.07787505, -1.232748, 1.332551, 0, 0.6627451, 1, 1,
0.08004351, 0.7823064, -1.323177, 0, 0.6588235, 1, 1,
0.0807945, -0.7610859, 2.441905, 0, 0.6509804, 1, 1,
0.0851332, -0.6728171, 2.706735, 0, 0.6470588, 1, 1,
0.08520046, -0.5429236, 4.092729, 0, 0.6392157, 1, 1,
0.08603433, -0.5861447, 3.445464, 0, 0.6352941, 1, 1,
0.0917138, 1.888409, 0.09696041, 0, 0.627451, 1, 1,
0.09431176, 1.366472, 0.2541406, 0, 0.6235294, 1, 1,
0.09906876, -1.451653, 2.901695, 0, 0.6156863, 1, 1,
0.09998955, -1.173372, 1.692021, 0, 0.6117647, 1, 1,
0.101666, 1.092133, 0.1599643, 0, 0.6039216, 1, 1,
0.1034584, -1.050225, 3.917, 0, 0.5960785, 1, 1,
0.109531, 0.1995758, 1.202549, 0, 0.5921569, 1, 1,
0.1123155, 0.4039396, -0.3663164, 0, 0.5843138, 1, 1,
0.1141496, 0.1398848, 0.1351158, 0, 0.5803922, 1, 1,
0.1224534, -0.1186313, 2.90117, 0, 0.572549, 1, 1,
0.1239964, 1.228652, -1.698343, 0, 0.5686275, 1, 1,
0.1270951, -1.112418, 3.558243, 0, 0.5607843, 1, 1,
0.127918, 1.650227, -0.3620263, 0, 0.5568628, 1, 1,
0.1282521, 0.07057111, 0.8427212, 0, 0.5490196, 1, 1,
0.1286333, -1.042053, 3.097657, 0, 0.5450981, 1, 1,
0.1311135, -0.5959034, 3.771786, 0, 0.5372549, 1, 1,
0.1354235, 1.760732, 0.8589362, 0, 0.5333334, 1, 1,
0.1369893, -0.5841556, 2.067921, 0, 0.5254902, 1, 1,
0.1394145, -0.02715679, 1.935566, 0, 0.5215687, 1, 1,
0.1399467, -0.5226349, 4.769496, 0, 0.5137255, 1, 1,
0.142846, -0.9898183, 4.009307, 0, 0.509804, 1, 1,
0.145863, 0.3152276, -1.383449, 0, 0.5019608, 1, 1,
0.1507312, -0.59367, 2.101902, 0, 0.4941176, 1, 1,
0.1514188, -0.7010692, 4.048859, 0, 0.4901961, 1, 1,
0.1545746, 0.6348343, -0.4592593, 0, 0.4823529, 1, 1,
0.1547263, -1.636166, 4.215153, 0, 0.4784314, 1, 1,
0.1550375, -1.785193, 2.882592, 0, 0.4705882, 1, 1,
0.1577684, 0.1803719, 1.641114, 0, 0.4666667, 1, 1,
0.1699291, -1.514422, 2.466635, 0, 0.4588235, 1, 1,
0.1709498, 0.7735519, -0.6671782, 0, 0.454902, 1, 1,
0.1722507, -0.05988425, 1.73755, 0, 0.4470588, 1, 1,
0.1723644, -0.5919286, 1.798458, 0, 0.4431373, 1, 1,
0.1769273, 0.2632856, 0.412947, 0, 0.4352941, 1, 1,
0.178582, -0.4459762, 2.324208, 0, 0.4313726, 1, 1,
0.1785894, -1.541296, 1.828949, 0, 0.4235294, 1, 1,
0.1803539, 0.7163574, 1.709242, 0, 0.4196078, 1, 1,
0.1858495, -1.726745, 3.545403, 0, 0.4117647, 1, 1,
0.185975, -0.8725514, 2.232274, 0, 0.4078431, 1, 1,
0.1899689, 0.2447044, 0.6383442, 0, 0.4, 1, 1,
0.1905013, 0.4012183, -1.489513, 0, 0.3921569, 1, 1,
0.1915946, -0.6503201, 2.96862, 0, 0.3882353, 1, 1,
0.1921165, -1.107109, 3.817921, 0, 0.3803922, 1, 1,
0.1921734, -0.5238315, 1.793148, 0, 0.3764706, 1, 1,
0.1943437, 0.03209584, 1.040994, 0, 0.3686275, 1, 1,
0.1969968, 1.312708, -0.02561587, 0, 0.3647059, 1, 1,
0.2018438, -0.5460817, 2.110867, 0, 0.3568628, 1, 1,
0.2039278, 0.3217694, -0.272, 0, 0.3529412, 1, 1,
0.2041496, 1.635332, 0.3060062, 0, 0.345098, 1, 1,
0.2084084, 0.9177037, 0.6431447, 0, 0.3411765, 1, 1,
0.2122649, -1.698416, 3.791146, 0, 0.3333333, 1, 1,
0.2153244, 0.1751071, 2.331344, 0, 0.3294118, 1, 1,
0.2172536, 0.163487, 0.4690354, 0, 0.3215686, 1, 1,
0.2272595, -0.8042065, 5.601624, 0, 0.3176471, 1, 1,
0.2275522, 0.004164369, 1.359122, 0, 0.3098039, 1, 1,
0.2314548, 1.783231, 1.711971, 0, 0.3058824, 1, 1,
0.2343055, 0.9106859, 1.526146, 0, 0.2980392, 1, 1,
0.2347674, -0.142724, 4.63662, 0, 0.2901961, 1, 1,
0.2360869, 0.3783075, 2.494378, 0, 0.2862745, 1, 1,
0.2450762, 0.1278408, 1.351046, 0, 0.2784314, 1, 1,
0.246033, 0.6697959, 1.852835, 0, 0.2745098, 1, 1,
0.25154, -0.5242447, 2.378924, 0, 0.2666667, 1, 1,
0.2524618, -0.392496, 3.598618, 0, 0.2627451, 1, 1,
0.2539059, -1.344316, 3.703899, 0, 0.254902, 1, 1,
0.2548466, -0.7407976, 3.033791, 0, 0.2509804, 1, 1,
0.2569156, -0.8009643, 3.706477, 0, 0.2431373, 1, 1,
0.2573199, -0.2566481, 2.431747, 0, 0.2392157, 1, 1,
0.2599339, 0.2312396, 0.2426706, 0, 0.2313726, 1, 1,
0.2622368, -0.1953598, 1.81644, 0, 0.227451, 1, 1,
0.2635917, -1.704153, 3.236171, 0, 0.2196078, 1, 1,
0.2656139, -0.262029, 2.638686, 0, 0.2156863, 1, 1,
0.27189, 0.6673597, 1.333804, 0, 0.2078431, 1, 1,
0.2724017, 1.27657, -1.030793, 0, 0.2039216, 1, 1,
0.2762346, 1.029255, 1.038761, 0, 0.1960784, 1, 1,
0.2798622, -1.383992, 1.984269, 0, 0.1882353, 1, 1,
0.2879997, 0.6209732, 0.6765231, 0, 0.1843137, 1, 1,
0.2915684, 1.579978, 1.164839, 0, 0.1764706, 1, 1,
0.2918767, -0.5483606, 3.036319, 0, 0.172549, 1, 1,
0.293014, -1.527607, 2.805017, 0, 0.1647059, 1, 1,
0.2932285, -0.7413942, 2.53805, 0, 0.1607843, 1, 1,
0.2948337, 0.3797625, 0.8455474, 0, 0.1529412, 1, 1,
0.2956388, -1.191662, 1.573518, 0, 0.1490196, 1, 1,
0.298312, 1.915298, 0.2661746, 0, 0.1411765, 1, 1,
0.2985644, -1.471218, 1.308936, 0, 0.1372549, 1, 1,
0.3024084, -0.4831569, 3.159272, 0, 0.1294118, 1, 1,
0.3029443, -1.834536, 3.881186, 0, 0.1254902, 1, 1,
0.3033579, 0.765651, 0.5150808, 0, 0.1176471, 1, 1,
0.3107777, 2.081719, -0.0632844, 0, 0.1137255, 1, 1,
0.3151726, 0.5044841, -0.1681787, 0, 0.1058824, 1, 1,
0.3178418, 0.2245037, 0.3211817, 0, 0.09803922, 1, 1,
0.3189877, -0.9287001, 2.626475, 0, 0.09411765, 1, 1,
0.3203954, 1.143577, -0.2679222, 0, 0.08627451, 1, 1,
0.323911, 0.7517657, 0.5307672, 0, 0.08235294, 1, 1,
0.3245863, 0.5662395, 1.021774, 0, 0.07450981, 1, 1,
0.3258074, 0.3478892, 3.582288, 0, 0.07058824, 1, 1,
0.3270584, -0.4942445, 3.04146, 0, 0.0627451, 1, 1,
0.3285477, 0.0179048, 1.251676, 0, 0.05882353, 1, 1,
0.330334, -0.07186933, 0.74537, 0, 0.05098039, 1, 1,
0.3396879, -0.8026333, 2.985641, 0, 0.04705882, 1, 1,
0.3414936, -0.08374356, 2.128344, 0, 0.03921569, 1, 1,
0.3445791, -0.06179883, 1.377623, 0, 0.03529412, 1, 1,
0.3499251, -1.020007, 3.699593, 0, 0.02745098, 1, 1,
0.3510138, -0.08214018, 0.8268449, 0, 0.02352941, 1, 1,
0.3530238, 0.4928438, 1.783703, 0, 0.01568628, 1, 1,
0.3560015, -2.174349, 2.347144, 0, 0.01176471, 1, 1,
0.3566638, -0.5162878, 0.9895738, 0, 0.003921569, 1, 1,
0.35668, 0.4432106, 0.4573238, 0.003921569, 0, 1, 1,
0.359396, 0.6342817, 0.4269446, 0.007843138, 0, 1, 1,
0.3657811, -0.8155778, 3.547962, 0.01568628, 0, 1, 1,
0.3765868, -1.876057, 4.433304, 0.01960784, 0, 1, 1,
0.3811466, 1.244241, 1.490501, 0.02745098, 0, 1, 1,
0.3863411, -1.468555, 0.7887039, 0.03137255, 0, 1, 1,
0.3889867, 0.6026888, -0.1246578, 0.03921569, 0, 1, 1,
0.3914897, -0.001780126, 0.2217874, 0.04313726, 0, 1, 1,
0.3923326, -0.09287681, 2.709125, 0.05098039, 0, 1, 1,
0.3972966, 1.078646, -0.740939, 0.05490196, 0, 1, 1,
0.3978014, -0.07187191, 0.7613779, 0.0627451, 0, 1, 1,
0.3986064, 1.722024, -0.4517734, 0.06666667, 0, 1, 1,
0.3993973, 0.750149, -1.608929, 0.07450981, 0, 1, 1,
0.4015858, -1.177824, 3.021528, 0.07843138, 0, 1, 1,
0.4060908, -0.1560736, 0.7132916, 0.08627451, 0, 1, 1,
0.4116855, 1.753343, 1.371608, 0.09019608, 0, 1, 1,
0.4173358, -0.1188151, 0.5169544, 0.09803922, 0, 1, 1,
0.4222134, -0.06048786, 0.6241369, 0.1058824, 0, 1, 1,
0.4262126, -0.8960118, 4.211804, 0.1098039, 0, 1, 1,
0.4280132, -0.3913047, 0.666726, 0.1176471, 0, 1, 1,
0.4297795, 0.8601421, 0.3785852, 0.1215686, 0, 1, 1,
0.4382529, 0.8841288, 0.9917483, 0.1294118, 0, 1, 1,
0.4482806, -0.8724195, 1.672463, 0.1333333, 0, 1, 1,
0.4486066, -1.342186, 3.093894, 0.1411765, 0, 1, 1,
0.4500907, 0.8424534, 0.2619664, 0.145098, 0, 1, 1,
0.4509191, 0.9721359, -0.5080462, 0.1529412, 0, 1, 1,
0.4522736, 1.731699, 0.1217921, 0.1568628, 0, 1, 1,
0.4698002, -0.5287593, 3.498085, 0.1647059, 0, 1, 1,
0.469871, -0.008363031, 2.044766, 0.1686275, 0, 1, 1,
0.4699209, -0.3828726, 2.342321, 0.1764706, 0, 1, 1,
0.4744303, 0.6265985, 2.1484, 0.1803922, 0, 1, 1,
0.4799924, 1.035476, 0.1185599, 0.1882353, 0, 1, 1,
0.4816081, -1.150769, 2.55327, 0.1921569, 0, 1, 1,
0.4883873, 0.521659, 0.7823294, 0.2, 0, 1, 1,
0.4976829, 0.2995692, 2.140217, 0.2078431, 0, 1, 1,
0.5061367, -0.4737354, 2.470087, 0.2117647, 0, 1, 1,
0.5075338, 0.2898307, 0.2728846, 0.2196078, 0, 1, 1,
0.5125385, -0.9100447, 2.553168, 0.2235294, 0, 1, 1,
0.5214785, 1.184362, -0.4908051, 0.2313726, 0, 1, 1,
0.5272589, 0.7309882, -0.273832, 0.2352941, 0, 1, 1,
0.5298637, 0.1194825, 2.954232, 0.2431373, 0, 1, 1,
0.5323068, -1.341784, 1.6137, 0.2470588, 0, 1, 1,
0.5325415, 1.555775, 0.3740237, 0.254902, 0, 1, 1,
0.5413948, 1.169364, 0.03746744, 0.2588235, 0, 1, 1,
0.5453079, -0.3677091, 4.021492, 0.2666667, 0, 1, 1,
0.5468521, 0.3649364, 2.311995, 0.2705882, 0, 1, 1,
0.5508665, -0.4830629, 2.905781, 0.2784314, 0, 1, 1,
0.5515018, -1.72554, 3.552646, 0.282353, 0, 1, 1,
0.5529974, 0.4893369, 3.832285, 0.2901961, 0, 1, 1,
0.5570093, -0.3316383, 2.150804, 0.2941177, 0, 1, 1,
0.5591603, -0.1266462, 1.576839, 0.3019608, 0, 1, 1,
0.5653751, -0.04326651, 2.835772, 0.3098039, 0, 1, 1,
0.5667149, -1.050102, 1.203972, 0.3137255, 0, 1, 1,
0.5745276, -0.02468417, -0.1181848, 0.3215686, 0, 1, 1,
0.5750488, -0.8665482, 2.809256, 0.3254902, 0, 1, 1,
0.57546, -2.518761, 3.263893, 0.3333333, 0, 1, 1,
0.5755682, 1.085711, 0.9240273, 0.3372549, 0, 1, 1,
0.5759559, 0.775745, 0.4084679, 0.345098, 0, 1, 1,
0.5843296, -1.031044, 0.419447, 0.3490196, 0, 1, 1,
0.5856613, 0.2122556, 1.119311, 0.3568628, 0, 1, 1,
0.5895, -0.4627875, 2.706448, 0.3607843, 0, 1, 1,
0.5976095, -0.9789059, 5.198234, 0.3686275, 0, 1, 1,
0.5990575, 0.06597032, 0.3027041, 0.372549, 0, 1, 1,
0.6025867, -1.425332, 2.342845, 0.3803922, 0, 1, 1,
0.6026846, 1.679135, -0.397846, 0.3843137, 0, 1, 1,
0.6039927, -0.9578389, 3.564648, 0.3921569, 0, 1, 1,
0.6043518, 0.8122076, 1.416417, 0.3960784, 0, 1, 1,
0.6080639, 1.730631, -1.07407, 0.4039216, 0, 1, 1,
0.6108463, 1.000596, -0.7126508, 0.4117647, 0, 1, 1,
0.6121432, -1.11037, 1.800564, 0.4156863, 0, 1, 1,
0.6122174, 1.128286, -0.128515, 0.4235294, 0, 1, 1,
0.6142009, -0.5565968, 3.056183, 0.427451, 0, 1, 1,
0.6191252, 2.28978, 1.114257, 0.4352941, 0, 1, 1,
0.6198912, -0.3937818, 1.147403, 0.4392157, 0, 1, 1,
0.6215535, 0.1746046, 1.808163, 0.4470588, 0, 1, 1,
0.6253362, 0.9064507, 0.1662788, 0.4509804, 0, 1, 1,
0.6306872, -4.031356, 3.691716, 0.4588235, 0, 1, 1,
0.644036, -0.6146373, 3.475395, 0.4627451, 0, 1, 1,
0.6513513, 0.2622684, -0.9355125, 0.4705882, 0, 1, 1,
0.6517015, -0.3285512, 3.789787, 0.4745098, 0, 1, 1,
0.6541986, 1.160296, -0.5379299, 0.4823529, 0, 1, 1,
0.6651813, -1.00087, 2.863218, 0.4862745, 0, 1, 1,
0.6662093, 1.070087, -0.9456294, 0.4941176, 0, 1, 1,
0.6766749, -0.2189755, 2.626158, 0.5019608, 0, 1, 1,
0.680276, 2.399535, -0.1274923, 0.5058824, 0, 1, 1,
0.6804085, 0.8968629, 0.641089, 0.5137255, 0, 1, 1,
0.6815395, 1.752278, 0.4970774, 0.5176471, 0, 1, 1,
0.682582, -0.06187345, 1.587015, 0.5254902, 0, 1, 1,
0.6833401, 0.1462669, 0.352735, 0.5294118, 0, 1, 1,
0.6840079, -0.2700592, 1.824136, 0.5372549, 0, 1, 1,
0.6855957, 1.527675, 1.031932, 0.5411765, 0, 1, 1,
0.6863156, 1.288557, 0.7437919, 0.5490196, 0, 1, 1,
0.6887726, 1.265453, 0.775435, 0.5529412, 0, 1, 1,
0.6909326, 1.32209, -0.5972513, 0.5607843, 0, 1, 1,
0.6946774, -1.219222, 3.368356, 0.5647059, 0, 1, 1,
0.7001024, 0.6831207, 0.7820901, 0.572549, 0, 1, 1,
0.7012132, 0.5889362, 1.724484, 0.5764706, 0, 1, 1,
0.7070875, 0.2221683, 1.577306, 0.5843138, 0, 1, 1,
0.7157571, -0.3065998, 2.323081, 0.5882353, 0, 1, 1,
0.7166531, 0.9699797, -0.2047722, 0.5960785, 0, 1, 1,
0.7176349, 0.3801832, 1.417031, 0.6039216, 0, 1, 1,
0.7196549, 0.6889569, 3.07131, 0.6078432, 0, 1, 1,
0.7198526, 0.915668, 1.820458, 0.6156863, 0, 1, 1,
0.7335123, 0.02764534, 2.220885, 0.6196079, 0, 1, 1,
0.7341629, -0.660285, 1.455063, 0.627451, 0, 1, 1,
0.7399405, 1.894052, 1.560063, 0.6313726, 0, 1, 1,
0.7423388, -0.1540876, 1.262501, 0.6392157, 0, 1, 1,
0.7425895, 0.5488665, 1.328479, 0.6431373, 0, 1, 1,
0.7436687, 0.81301, 0.9370768, 0.6509804, 0, 1, 1,
0.7437179, -1.060607, 3.891602, 0.654902, 0, 1, 1,
0.7442076, -0.2212625, 0.5135877, 0.6627451, 0, 1, 1,
0.7526155, -0.7420014, 2.381641, 0.6666667, 0, 1, 1,
0.759489, 0.7831872, 1.760499, 0.6745098, 0, 1, 1,
0.7670319, -0.1998645, 2.504908, 0.6784314, 0, 1, 1,
0.7755, -1.481462, 4.10792, 0.6862745, 0, 1, 1,
0.7759452, 1.689553, 0.4535364, 0.6901961, 0, 1, 1,
0.7772167, -2.094568, 2.947437, 0.6980392, 0, 1, 1,
0.7791402, 0.4109854, 2.687738, 0.7058824, 0, 1, 1,
0.7817161, 0.1782766, 2.095236, 0.7098039, 0, 1, 1,
0.783484, -0.2759748, 2.840808, 0.7176471, 0, 1, 1,
0.7941185, 0.9503847, 0.4008497, 0.7215686, 0, 1, 1,
0.7943747, 0.608191, -1.617404, 0.7294118, 0, 1, 1,
0.7964415, -0.8869163, 1.780546, 0.7333333, 0, 1, 1,
0.8018919, 0.4178826, -0.6197656, 0.7411765, 0, 1, 1,
0.8047726, 0.3023439, 0.9750507, 0.7450981, 0, 1, 1,
0.8052977, -0.7123096, 2.22023, 0.7529412, 0, 1, 1,
0.8056473, 1.010633, -0.3575031, 0.7568628, 0, 1, 1,
0.80967, -0.7858747, 4.291246, 0.7647059, 0, 1, 1,
0.8113139, 0.4594719, -0.4600031, 0.7686275, 0, 1, 1,
0.8133545, -0.1252573, 3.351944, 0.7764706, 0, 1, 1,
0.8141279, 1.116645, 2.280905, 0.7803922, 0, 1, 1,
0.828388, 1.724729, -0.2816323, 0.7882353, 0, 1, 1,
0.8286216, -1.228393, 1.624901, 0.7921569, 0, 1, 1,
0.8311431, 1.900776, -0.664547, 0.8, 0, 1, 1,
0.8332199, 0.8494791, 1.820982, 0.8078431, 0, 1, 1,
0.8360298, 2.673978, -0.9534372, 0.8117647, 0, 1, 1,
0.8373337, 0.5010936, 0.9554756, 0.8196079, 0, 1, 1,
0.8399331, -0.04310365, 0.5209017, 0.8235294, 0, 1, 1,
0.8498939, 0.2214085, 1.543411, 0.8313726, 0, 1, 1,
0.8572654, 0.02496096, 3.190188, 0.8352941, 0, 1, 1,
0.857515, -2.223221, 3.643763, 0.8431373, 0, 1, 1,
0.8688626, 0.1604842, 0.9566332, 0.8470588, 0, 1, 1,
0.870656, -0.9899485, 3.04161, 0.854902, 0, 1, 1,
0.8718225, -1.548006, 2.36638, 0.8588235, 0, 1, 1,
0.8839685, 1.482188, 1.06156, 0.8666667, 0, 1, 1,
0.8842705, -2.539091, 3.688441, 0.8705882, 0, 1, 1,
0.8873363, -0.8380085, 2.377874, 0.8784314, 0, 1, 1,
0.8883703, -1.577947, 4.139723, 0.8823529, 0, 1, 1,
0.8965205, -0.5377051, 2.569087, 0.8901961, 0, 1, 1,
0.8983193, -0.2062515, 2.148025, 0.8941177, 0, 1, 1,
0.8992909, 0.2554284, 2.095111, 0.9019608, 0, 1, 1,
0.9013098, 0.41895, 1.024899, 0.9098039, 0, 1, 1,
0.9165086, -0.3568256, 1.606141, 0.9137255, 0, 1, 1,
0.9199303, 0.3104471, 0.8521563, 0.9215686, 0, 1, 1,
0.9199664, -0.1360135, 1.489789, 0.9254902, 0, 1, 1,
0.9207607, 0.6137634, -0.125163, 0.9333333, 0, 1, 1,
0.9215723, -0.7634372, 1.799399, 0.9372549, 0, 1, 1,
0.9232085, 0.4149283, 1.231092, 0.945098, 0, 1, 1,
0.925794, -0.4844882, 3.631448, 0.9490196, 0, 1, 1,
0.9309117, -0.05555246, 1.86623, 0.9568627, 0, 1, 1,
0.9361999, 1.439446, -1.380114, 0.9607843, 0, 1, 1,
0.9420478, -0.3771884, 1.110617, 0.9686275, 0, 1, 1,
0.953979, 1.91502, -0.5212717, 0.972549, 0, 1, 1,
0.9547396, 0.6892363, 2.756229, 0.9803922, 0, 1, 1,
0.9562137, -0.808588, 2.304408, 0.9843137, 0, 1, 1,
0.9638099, -0.3011583, 1.441948, 0.9921569, 0, 1, 1,
0.9721694, -1.799793, 3.858092, 0.9960784, 0, 1, 1,
0.9731112, 1.222146, 1.969757, 1, 0, 0.9960784, 1,
0.9851109, -0.5425699, 2.026474, 1, 0, 0.9882353, 1,
0.9925054, -0.4150804, 2.965595, 1, 0, 0.9843137, 1,
0.9947917, -2.132078, 2.546438, 1, 0, 0.9764706, 1,
1.006175, 0.5322595, 0.1798257, 1, 0, 0.972549, 1,
1.009733, -0.548151, 1.762133, 1, 0, 0.9647059, 1,
1.015591, -1.303435, 1.26786, 1, 0, 0.9607843, 1,
1.017022, -2.653443, 2.113282, 1, 0, 0.9529412, 1,
1.018708, 0.7653259, 0.4329752, 1, 0, 0.9490196, 1,
1.024535, 0.5274523, 1.637355, 1, 0, 0.9411765, 1,
1.037823, -0.886028, 2.118769, 1, 0, 0.9372549, 1,
1.041348, 0.8884276, -1.67723, 1, 0, 0.9294118, 1,
1.044723, -1.602898, 1.241262, 1, 0, 0.9254902, 1,
1.04763, -1.650058, 2.136999, 1, 0, 0.9176471, 1,
1.054467, 0.3818099, 2.003393, 1, 0, 0.9137255, 1,
1.058029, -0.1432719, 1.528722, 1, 0, 0.9058824, 1,
1.058344, -0.8094617, 1.363274, 1, 0, 0.9019608, 1,
1.071844, 0.7052568, 1.553872, 1, 0, 0.8941177, 1,
1.075907, 3.268211, 0.7950286, 1, 0, 0.8862745, 1,
1.091121, -0.3484385, 0.4238442, 1, 0, 0.8823529, 1,
1.101363, 2.338477, 1.403135, 1, 0, 0.8745098, 1,
1.105759, 0.08281531, 1.181358, 1, 0, 0.8705882, 1,
1.108199, 0.2249245, 1.236423, 1, 0, 0.8627451, 1,
1.111551, 1.966945, 1.284517, 1, 0, 0.8588235, 1,
1.112355, -1.217231, 2.189364, 1, 0, 0.8509804, 1,
1.122302, -0.9358732, 2.909824, 1, 0, 0.8470588, 1,
1.123247, -0.2996273, 1.022775, 1, 0, 0.8392157, 1,
1.124671, -0.8043314, 1.417057, 1, 0, 0.8352941, 1,
1.125458, 0.7710123, 2.21491, 1, 0, 0.827451, 1,
1.128117, -0.1865053, 2.208126, 1, 0, 0.8235294, 1,
1.137808, -1.898431, 2.842134, 1, 0, 0.8156863, 1,
1.153616, -0.5894076, 3.41197, 1, 0, 0.8117647, 1,
1.160924, -0.5223713, 1.701247, 1, 0, 0.8039216, 1,
1.162888, 0.8420307, 0.2989267, 1, 0, 0.7960784, 1,
1.174239, 1.314143, 0.4210913, 1, 0, 0.7921569, 1,
1.176125, -1.297878, 2.895633, 1, 0, 0.7843137, 1,
1.178666, -0.07375743, 0.5893371, 1, 0, 0.7803922, 1,
1.179856, -0.2300383, 2.132573, 1, 0, 0.772549, 1,
1.189828, -0.2989781, 0.8372942, 1, 0, 0.7686275, 1,
1.191385, -0.6633721, 1.887469, 1, 0, 0.7607843, 1,
1.191864, -0.9313952, -0.004325092, 1, 0, 0.7568628, 1,
1.193025, 1.159579, 1.022804, 1, 0, 0.7490196, 1,
1.193625, -0.9701046, 2.422379, 1, 0, 0.7450981, 1,
1.20162, -0.3666692, 2.500043, 1, 0, 0.7372549, 1,
1.20477, 0.8701828, 0.6475741, 1, 0, 0.7333333, 1,
1.206768, -0.1727143, 2.350226, 1, 0, 0.7254902, 1,
1.208286, -1.499547, 3.115163, 1, 0, 0.7215686, 1,
1.210095, -0.7391678, 2.57002, 1, 0, 0.7137255, 1,
1.217652, -0.3084773, 2.429514, 1, 0, 0.7098039, 1,
1.224497, 0.006659453, 0.9962283, 1, 0, 0.7019608, 1,
1.225263, -0.5821564, 3.429371, 1, 0, 0.6941177, 1,
1.233209, -0.494439, 1.225125, 1, 0, 0.6901961, 1,
1.234471, 0.1810266, 0.5026135, 1, 0, 0.682353, 1,
1.240654, 1.227943, 0.4893189, 1, 0, 0.6784314, 1,
1.24308, -0.5574368, -0.1162512, 1, 0, 0.6705883, 1,
1.247382, -1.716558, 2.550038, 1, 0, 0.6666667, 1,
1.25747, -1.750486, 3.411723, 1, 0, 0.6588235, 1,
1.280921, -0.2333418, 2.680367, 1, 0, 0.654902, 1,
1.288244, -0.3936933, 1.21115, 1, 0, 0.6470588, 1,
1.288289, -2.037917, 3.841117, 1, 0, 0.6431373, 1,
1.290037, -0.03089328, 1.721423, 1, 0, 0.6352941, 1,
1.295839, -0.1758167, 2.018404, 1, 0, 0.6313726, 1,
1.304793, 0.7862375, -0.2364122, 1, 0, 0.6235294, 1,
1.30841, 0.204434, 0.02405484, 1, 0, 0.6196079, 1,
1.32885, -1.334725, 0.5857466, 1, 0, 0.6117647, 1,
1.331017, 1.261311, 2.003408, 1, 0, 0.6078432, 1,
1.335481, 0.5921779, 0.9608091, 1, 0, 0.6, 1,
1.339909, -0.5057433, 2.476485, 1, 0, 0.5921569, 1,
1.346468, 1.357113, 0.7747806, 1, 0, 0.5882353, 1,
1.355972, 2.223082, 0.8255757, 1, 0, 0.5803922, 1,
1.366176, -1.339941, 2.528644, 1, 0, 0.5764706, 1,
1.369547, -1.968881, 2.869625, 1, 0, 0.5686275, 1,
1.406498, -2.004276, 3.10871, 1, 0, 0.5647059, 1,
1.412237, 0.5224701, 1.363419, 1, 0, 0.5568628, 1,
1.4124, -0.8003122, 3.86569, 1, 0, 0.5529412, 1,
1.414366, -1.764328, 1.837633, 1, 0, 0.5450981, 1,
1.416342, -0.165565, 1.754801, 1, 0, 0.5411765, 1,
1.425766, -0.1126366, 2.633191, 1, 0, 0.5333334, 1,
1.427015, 0.7178448, 2.426651, 1, 0, 0.5294118, 1,
1.430819, 0.1230815, 1.272009, 1, 0, 0.5215687, 1,
1.437179, 0.8990539, 0.4221405, 1, 0, 0.5176471, 1,
1.443693, -0.8600948, 1.779475, 1, 0, 0.509804, 1,
1.444938, 0.203516, 0.09434157, 1, 0, 0.5058824, 1,
1.451083, -0.1482267, 1.550885, 1, 0, 0.4980392, 1,
1.452923, 0.279388, 1.154187, 1, 0, 0.4901961, 1,
1.459999, 0.4897038, 0.7686679, 1, 0, 0.4862745, 1,
1.461042, -0.6325318, 2.797825, 1, 0, 0.4784314, 1,
1.475233, -0.6907197, 1.181751, 1, 0, 0.4745098, 1,
1.479381, 0.9455355, 1.462638, 1, 0, 0.4666667, 1,
1.49163, -0.4965769, 2.717516, 1, 0, 0.4627451, 1,
1.4961, -0.7759562, 2.140467, 1, 0, 0.454902, 1,
1.496293, -0.1288079, 1.050621, 1, 0, 0.4509804, 1,
1.4963, -0.528478, 2.281884, 1, 0, 0.4431373, 1,
1.498289, 0.7587999, 0.4165376, 1, 0, 0.4392157, 1,
1.507832, -0.9387902, 2.120225, 1, 0, 0.4313726, 1,
1.510038, -0.663759, 1.330223, 1, 0, 0.427451, 1,
1.513679, -1.378051, 1.184247, 1, 0, 0.4196078, 1,
1.525725, -0.5734841, 0.5291797, 1, 0, 0.4156863, 1,
1.530327, -0.003964652, 0.3986896, 1, 0, 0.4078431, 1,
1.536099, -0.7288084, 1.515058, 1, 0, 0.4039216, 1,
1.545165, 1.262057, 0.4850099, 1, 0, 0.3960784, 1,
1.551132, 0.3352681, 0.1561064, 1, 0, 0.3882353, 1,
1.551633, -1.849128, 0.8966252, 1, 0, 0.3843137, 1,
1.563663, 1.123713, 1.420067, 1, 0, 0.3764706, 1,
1.573126, -0.9788738, 2.052413, 1, 0, 0.372549, 1,
1.584611, -0.4698956, 1.393718, 1, 0, 0.3647059, 1,
1.596457, 0.04018197, 1.88312, 1, 0, 0.3607843, 1,
1.598871, -1.585033, 3.155574, 1, 0, 0.3529412, 1,
1.599051, -0.9688869, 2.954087, 1, 0, 0.3490196, 1,
1.610463, -1.871283, 3.020404, 1, 0, 0.3411765, 1,
1.613684, -0.3184079, 3.743995, 1, 0, 0.3372549, 1,
1.613752, 0.6794679, 0.9407082, 1, 0, 0.3294118, 1,
1.624611, -0.6834691, 3.181302, 1, 0, 0.3254902, 1,
1.639355, 1.166711, 2.608262, 1, 0, 0.3176471, 1,
1.642163, 0.1094927, 1.360491, 1, 0, 0.3137255, 1,
1.644935, 0.7369134, 0.7215165, 1, 0, 0.3058824, 1,
1.646255, 1.270715, 1.15282, 1, 0, 0.2980392, 1,
1.649459, 0.9127777, 1.475374, 1, 0, 0.2941177, 1,
1.654819, 0.1133526, 0.5213768, 1, 0, 0.2862745, 1,
1.680237, 0.3170214, 1.21028, 1, 0, 0.282353, 1,
1.682685, -0.3044522, 0.2971713, 1, 0, 0.2745098, 1,
1.697913, 0.6978436, 0.6532104, 1, 0, 0.2705882, 1,
1.714815, 0.9267036, -0.02440969, 1, 0, 0.2627451, 1,
1.718662, -0.07484211, 2.788336, 1, 0, 0.2588235, 1,
1.759468, -2.101816, 3.693513, 1, 0, 0.2509804, 1,
1.768809, 0.6676775, 1.639029, 1, 0, 0.2470588, 1,
1.770063, 0.3432288, 1.648199, 1, 0, 0.2392157, 1,
1.783681, 0.9733678, 0.4628362, 1, 0, 0.2352941, 1,
1.798991, 0.1978648, -0.4521371, 1, 0, 0.227451, 1,
1.800884, -1.032557, 3.485155, 1, 0, 0.2235294, 1,
1.811883, 0.4458959, 2.168167, 1, 0, 0.2156863, 1,
1.812616, 0.3766804, 0.5363072, 1, 0, 0.2117647, 1,
1.815192, 1.053839, 0.9747641, 1, 0, 0.2039216, 1,
1.822308, -0.5987605, 1.484717, 1, 0, 0.1960784, 1,
1.825931, -1.147681, 1.877256, 1, 0, 0.1921569, 1,
1.85495, -0.3278403, 1.021583, 1, 0, 0.1843137, 1,
1.860687, -0.4911917, 3.749538, 1, 0, 0.1803922, 1,
1.874852, -1.0601, 1.971056, 1, 0, 0.172549, 1,
1.900686, -0.2978225, -2.252653, 1, 0, 0.1686275, 1,
1.911496, 0.6228491, 3.109283, 1, 0, 0.1607843, 1,
1.914411, 0.9656758, 0.7482454, 1, 0, 0.1568628, 1,
1.914973, 1.225038, 1.083868, 1, 0, 0.1490196, 1,
1.943973, 0.5893745, 1.640991, 1, 0, 0.145098, 1,
1.960373, -0.6403643, 1.352177, 1, 0, 0.1372549, 1,
1.998378, 0.1146243, 2.027043, 1, 0, 0.1333333, 1,
2.000809, 1.093111, 0.1098688, 1, 0, 0.1254902, 1,
2.006112, 2.164712, 0.3960475, 1, 0, 0.1215686, 1,
2.017227, -1.406592, 3.068301, 1, 0, 0.1137255, 1,
2.031225, 0.6727666, 2.36964, 1, 0, 0.1098039, 1,
2.033648, -0.3155386, 1.253805, 1, 0, 0.1019608, 1,
2.038085, -1.799127, 3.354586, 1, 0, 0.09411765, 1,
2.047572, 1.463033, 0.5001697, 1, 0, 0.09019608, 1,
2.073121, -1.29282, 1.513844, 1, 0, 0.08235294, 1,
2.139265, 0.9715228, -0.7642701, 1, 0, 0.07843138, 1,
2.196001, 0.83595, 0.4064777, 1, 0, 0.07058824, 1,
2.198409, -1.850289, 3.26237, 1, 0, 0.06666667, 1,
2.203947, 0.641948, 1.227065, 1, 0, 0.05882353, 1,
2.214902, 0.3706783, 2.531692, 1, 0, 0.05490196, 1,
2.274171, -0.3581495, 1.104592, 1, 0, 0.04705882, 1,
2.292025, 0.912845, 1.912413, 1, 0, 0.04313726, 1,
2.320896, -1.458464, 1.230722, 1, 0, 0.03529412, 1,
2.37875, -0.1580008, 2.745021, 1, 0, 0.03137255, 1,
2.413237, -0.7317159, 3.608931, 1, 0, 0.02352941, 1,
2.429122, -0.1760161, 1.381746, 1, 0, 0.01960784, 1,
2.819184, -0.3383637, 2.250269, 1, 0, 0.01176471, 1,
2.828936, -0.1853076, 0.3646063, 1, 0, 0.007843138, 1
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
-0.4948099, -5.322696, -7.422813, 0, -0.5, 0.5, 0.5,
-0.4948099, -5.322696, -7.422813, 1, -0.5, 0.5, 0.5,
-0.4948099, -5.322696, -7.422813, 1, 1.5, 0.5, 0.5,
-0.4948099, -5.322696, -7.422813, 0, 1.5, 0.5, 0.5
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
-4.945306, -0.2220943, -7.422813, 0, -0.5, 0.5, 0.5,
-4.945306, -0.2220943, -7.422813, 1, -0.5, 0.5, 0.5,
-4.945306, -0.2220943, -7.422813, 1, 1.5, 0.5, 0.5,
-4.945306, -0.2220943, -7.422813, 0, 1.5, 0.5, 0.5
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
-4.945306, -5.322696, 0.03324533, 0, -0.5, 0.5, 0.5,
-4.945306, -5.322696, 0.03324533, 1, -0.5, 0.5, 0.5,
-4.945306, -5.322696, 0.03324533, 1, 1.5, 0.5, 0.5,
-4.945306, -5.322696, 0.03324533, 0, 1.5, 0.5, 0.5
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
-3, -4.145634, -5.702184,
2, -4.145634, -5.702184,
-3, -4.145634, -5.702184,
-3, -4.341811, -5.988955,
-2, -4.145634, -5.702184,
-2, -4.341811, -5.988955,
-1, -4.145634, -5.702184,
-1, -4.341811, -5.988955,
0, -4.145634, -5.702184,
0, -4.341811, -5.988955,
1, -4.145634, -5.702184,
1, -4.341811, -5.988955,
2, -4.145634, -5.702184,
2, -4.341811, -5.988955
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
-3, -4.734165, -6.562499, 0, -0.5, 0.5, 0.5,
-3, -4.734165, -6.562499, 1, -0.5, 0.5, 0.5,
-3, -4.734165, -6.562499, 1, 1.5, 0.5, 0.5,
-3, -4.734165, -6.562499, 0, 1.5, 0.5, 0.5,
-2, -4.734165, -6.562499, 0, -0.5, 0.5, 0.5,
-2, -4.734165, -6.562499, 1, -0.5, 0.5, 0.5,
-2, -4.734165, -6.562499, 1, 1.5, 0.5, 0.5,
-2, -4.734165, -6.562499, 0, 1.5, 0.5, 0.5,
-1, -4.734165, -6.562499, 0, -0.5, 0.5, 0.5,
-1, -4.734165, -6.562499, 1, -0.5, 0.5, 0.5,
-1, -4.734165, -6.562499, 1, 1.5, 0.5, 0.5,
-1, -4.734165, -6.562499, 0, 1.5, 0.5, 0.5,
0, -4.734165, -6.562499, 0, -0.5, 0.5, 0.5,
0, -4.734165, -6.562499, 1, -0.5, 0.5, 0.5,
0, -4.734165, -6.562499, 1, 1.5, 0.5, 0.5,
0, -4.734165, -6.562499, 0, 1.5, 0.5, 0.5,
1, -4.734165, -6.562499, 0, -0.5, 0.5, 0.5,
1, -4.734165, -6.562499, 1, -0.5, 0.5, 0.5,
1, -4.734165, -6.562499, 1, 1.5, 0.5, 0.5,
1, -4.734165, -6.562499, 0, 1.5, 0.5, 0.5,
2, -4.734165, -6.562499, 0, -0.5, 0.5, 0.5,
2, -4.734165, -6.562499, 1, -0.5, 0.5, 0.5,
2, -4.734165, -6.562499, 1, 1.5, 0.5, 0.5,
2, -4.734165, -6.562499, 0, 1.5, 0.5, 0.5
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
-3.918268, -4, -5.702184,
-3.918268, 2, -5.702184,
-3.918268, -4, -5.702184,
-4.089441, -4, -5.988955,
-3.918268, -2, -5.702184,
-4.089441, -2, -5.988955,
-3.918268, 0, -5.702184,
-4.089441, 0, -5.988955,
-3.918268, 2, -5.702184,
-4.089441, 2, -5.988955
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
-4.431787, -4, -6.562499, 0, -0.5, 0.5, 0.5,
-4.431787, -4, -6.562499, 1, -0.5, 0.5, 0.5,
-4.431787, -4, -6.562499, 1, 1.5, 0.5, 0.5,
-4.431787, -4, -6.562499, 0, 1.5, 0.5, 0.5,
-4.431787, -2, -6.562499, 0, -0.5, 0.5, 0.5,
-4.431787, -2, -6.562499, 1, -0.5, 0.5, 0.5,
-4.431787, -2, -6.562499, 1, 1.5, 0.5, 0.5,
-4.431787, -2, -6.562499, 0, 1.5, 0.5, 0.5,
-4.431787, 0, -6.562499, 0, -0.5, 0.5, 0.5,
-4.431787, 0, -6.562499, 1, -0.5, 0.5, 0.5,
-4.431787, 0, -6.562499, 1, 1.5, 0.5, 0.5,
-4.431787, 0, -6.562499, 0, 1.5, 0.5, 0.5,
-4.431787, 2, -6.562499, 0, -0.5, 0.5, 0.5,
-4.431787, 2, -6.562499, 1, -0.5, 0.5, 0.5,
-4.431787, 2, -6.562499, 1, 1.5, 0.5, 0.5,
-4.431787, 2, -6.562499, 0, 1.5, 0.5, 0.5
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
-3.918268, -4.145634, -4,
-3.918268, -4.145634, 4,
-3.918268, -4.145634, -4,
-4.089441, -4.341811, -4,
-3.918268, -4.145634, -2,
-4.089441, -4.341811, -2,
-3.918268, -4.145634, 0,
-4.089441, -4.341811, 0,
-3.918268, -4.145634, 2,
-4.089441, -4.341811, 2,
-3.918268, -4.145634, 4,
-4.089441, -4.341811, 4
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
-4.431787, -4.734165, -4, 0, -0.5, 0.5, 0.5,
-4.431787, -4.734165, -4, 1, -0.5, 0.5, 0.5,
-4.431787, -4.734165, -4, 1, 1.5, 0.5, 0.5,
-4.431787, -4.734165, -4, 0, 1.5, 0.5, 0.5,
-4.431787, -4.734165, -2, 0, -0.5, 0.5, 0.5,
-4.431787, -4.734165, -2, 1, -0.5, 0.5, 0.5,
-4.431787, -4.734165, -2, 1, 1.5, 0.5, 0.5,
-4.431787, -4.734165, -2, 0, 1.5, 0.5, 0.5,
-4.431787, -4.734165, 0, 0, -0.5, 0.5, 0.5,
-4.431787, -4.734165, 0, 1, -0.5, 0.5, 0.5,
-4.431787, -4.734165, 0, 1, 1.5, 0.5, 0.5,
-4.431787, -4.734165, 0, 0, 1.5, 0.5, 0.5,
-4.431787, -4.734165, 2, 0, -0.5, 0.5, 0.5,
-4.431787, -4.734165, 2, 1, -0.5, 0.5, 0.5,
-4.431787, -4.734165, 2, 1, 1.5, 0.5, 0.5,
-4.431787, -4.734165, 2, 0, 1.5, 0.5, 0.5,
-4.431787, -4.734165, 4, 0, -0.5, 0.5, 0.5,
-4.431787, -4.734165, 4, 1, -0.5, 0.5, 0.5,
-4.431787, -4.734165, 4, 1, 1.5, 0.5, 0.5,
-4.431787, -4.734165, 4, 0, 1.5, 0.5, 0.5
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
-3.918268, -4.145634, -5.702184,
-3.918268, 3.701445, -5.702184,
-3.918268, -4.145634, 5.768675,
-3.918268, 3.701445, 5.768675,
-3.918268, -4.145634, -5.702184,
-3.918268, -4.145634, 5.768675,
-3.918268, 3.701445, -5.702184,
-3.918268, 3.701445, 5.768675,
-3.918268, -4.145634, -5.702184,
2.928648, -4.145634, -5.702184,
-3.918268, -4.145634, 5.768675,
2.928648, -4.145634, 5.768675,
-3.918268, 3.701445, -5.702184,
2.928648, 3.701445, -5.702184,
-3.918268, 3.701445, 5.768675,
2.928648, 3.701445, 5.768675,
2.928648, -4.145634, -5.702184,
2.928648, 3.701445, -5.702184,
2.928648, -4.145634, 5.768675,
2.928648, 3.701445, 5.768675,
2.928648, -4.145634, -5.702184,
2.928648, -4.145634, 5.768675,
2.928648, 3.701445, -5.702184,
2.928648, 3.701445, 5.768675
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
var radius = 8.273038;
var distance = 36.80768;
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
mvMatrix.translate( 0.4948099, 0.2220943, -0.03324533 );
mvMatrix.scale( 1.306423, 1.139911, 0.7797996 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.80768);
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
Tribufos<-read.table("Tribufos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Tribufos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Tribufos' not found
```

```r
y<-Tribufos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Tribufos' not found
```

```r
z<-Tribufos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Tribufos' not found
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
-3.818556, -0.7842981, -2.677644, 0, 0, 1, 1, 1,
-3.810538, -0.942135, -2.662615, 1, 0, 0, 1, 1,
-3.012229, 0.3875785, -2.69108, 1, 0, 0, 1, 1,
-2.985058, -0.6584159, 0.932663, 1, 0, 0, 1, 1,
-2.941002, -0.1657193, -1.557677, 1, 0, 0, 1, 1,
-2.933779, -0.1466456, -1.782984, 1, 0, 0, 1, 1,
-2.898145, -0.4944161, -1.516919, 0, 0, 0, 1, 1,
-2.809466, 0.8421357, -0.5663406, 0, 0, 0, 1, 1,
-2.794999, -0.7032688, -0.8550465, 0, 0, 0, 1, 1,
-2.563523, -0.2358396, -2.251171, 0, 0, 0, 1, 1,
-2.508936, -0.2351094, -0.360388, 0, 0, 0, 1, 1,
-2.485052, 0.09119497, -1.407768, 0, 0, 0, 1, 1,
-2.451324, 0.3859675, -2.647513, 0, 0, 0, 1, 1,
-2.373583, -0.3957084, -0.5856565, 1, 1, 1, 1, 1,
-2.364549, -1.019896, -1.666477, 1, 1, 1, 1, 1,
-2.34195, -0.5048116, -2.892388, 1, 1, 1, 1, 1,
-2.336005, -0.1152321, -1.369883, 1, 1, 1, 1, 1,
-2.334745, -3.766856, -2.703888, 1, 1, 1, 1, 1,
-2.320792, 0.1352131, -1.737079, 1, 1, 1, 1, 1,
-2.297012, -0.9290062, 0.7903498, 1, 1, 1, 1, 1,
-2.261218, -0.4895842, -1.587024, 1, 1, 1, 1, 1,
-2.256816, 0.1357262, -2.24974, 1, 1, 1, 1, 1,
-2.242954, 1.77582, -0.326169, 1, 1, 1, 1, 1,
-2.231091, -0.5722376, -2.279752, 1, 1, 1, 1, 1,
-2.202788, 0.2940954, -1.915956, 1, 1, 1, 1, 1,
-2.199717, -0.9233018, -1.90718, 1, 1, 1, 1, 1,
-2.173903, 0.8961028, -1.986999, 1, 1, 1, 1, 1,
-2.125976, -0.5877834, -2.281029, 1, 1, 1, 1, 1,
-2.076109, -0.2915823, -1.888842, 0, 0, 1, 1, 1,
-2.064233, -1.009848, -2.883901, 1, 0, 0, 1, 1,
-2.040322, 0.6968907, -0.8100956, 1, 0, 0, 1, 1,
-2.03578, 0.08177782, -1.717089, 1, 0, 0, 1, 1,
-2.023685, 0.8379412, -1.907892, 1, 0, 0, 1, 1,
-2.012992, -0.8700976, -1.017553, 1, 0, 0, 1, 1,
-2.011285, -0.7364752, -2.374828, 0, 0, 0, 1, 1,
-1.994344, -1.107303, 0.08205026, 0, 0, 0, 1, 1,
-1.968153, 0.4475482, -1.462855, 0, 0, 0, 1, 1,
-1.959271, 1.36063, -0.4460863, 0, 0, 0, 1, 1,
-1.943466, -0.5019464, -1.840138, 0, 0, 0, 1, 1,
-1.942897, 0.1954806, -0.6959168, 0, 0, 0, 1, 1,
-1.931073, 0.5040252, -0.6419232, 0, 0, 0, 1, 1,
-1.918671, 0.2810768, 0.1357104, 1, 1, 1, 1, 1,
-1.911682, -0.783668, -2.788244, 1, 1, 1, 1, 1,
-1.906402, 0.9681213, -1.687196, 1, 1, 1, 1, 1,
-1.905673, -0.3955983, -2.682674, 1, 1, 1, 1, 1,
-1.900033, -0.8500781, -2.832949, 1, 1, 1, 1, 1,
-1.896886, -0.6738204, -1.615967, 1, 1, 1, 1, 1,
-1.883872, 0.007379266, -1.12344, 1, 1, 1, 1, 1,
-1.870716, -0.2990972, -0.9517516, 1, 1, 1, 1, 1,
-1.854437, 0.6307179, -2.959289, 1, 1, 1, 1, 1,
-1.84555, 0.0175197, -1.863365, 1, 1, 1, 1, 1,
-1.835616, -1.756129, -2.623734, 1, 1, 1, 1, 1,
-1.827859, -1.109259, -1.380608, 1, 1, 1, 1, 1,
-1.78804, 0.2210594, -1.791964, 1, 1, 1, 1, 1,
-1.783681, -1.434232, -3.431602, 1, 1, 1, 1, 1,
-1.772459, 0.9122126, -0.7148644, 1, 1, 1, 1, 1,
-1.760583, -2.185081, -3.852767, 0, 0, 1, 1, 1,
-1.757041, -0.7582055, -1.756359, 1, 0, 0, 1, 1,
-1.738082, 1.196837, -0.8707026, 1, 0, 0, 1, 1,
-1.737426, -1.694948, -2.906673, 1, 0, 0, 1, 1,
-1.7064, -1.873294, -2.633536, 1, 0, 0, 1, 1,
-1.700257, -0.2197644, -0.05780282, 1, 0, 0, 1, 1,
-1.686194, -1.488039, -1.589096, 0, 0, 0, 1, 1,
-1.662094, 0.4047023, 0.04512059, 0, 0, 0, 1, 1,
-1.644898, -0.2003814, -2.357965, 0, 0, 0, 1, 1,
-1.64455, -0.7939236, -3.007893, 0, 0, 0, 1, 1,
-1.615631, -0.8800168, -3.424008, 0, 0, 0, 1, 1,
-1.587825, 0.984168, -0.08219092, 0, 0, 0, 1, 1,
-1.570841, 2.446555, 0.009483082, 0, 0, 0, 1, 1,
-1.566481, -0.5925173, -0.7297181, 1, 1, 1, 1, 1,
-1.548639, -0.6945203, -1.209846, 1, 1, 1, 1, 1,
-1.531183, -1.856637, -1.560938, 1, 1, 1, 1, 1,
-1.528107, -0.2437309, -0.2987391, 1, 1, 1, 1, 1,
-1.527117, -0.9613237, -1.114498, 1, 1, 1, 1, 1,
-1.520497, -0.1573512, -1.483308, 1, 1, 1, 1, 1,
-1.498434, -0.006642424, -2.237271, 1, 1, 1, 1, 1,
-1.485917, -1.467083, -2.587519, 1, 1, 1, 1, 1,
-1.479457, -1.67488, -1.795463, 1, 1, 1, 1, 1,
-1.477785, -0.8043446, -1.954489, 1, 1, 1, 1, 1,
-1.460072, -0.6541851, -2.389176, 1, 1, 1, 1, 1,
-1.45538, -0.09486033, -2.690331, 1, 1, 1, 1, 1,
-1.447131, -1.575386, -4.363535, 1, 1, 1, 1, 1,
-1.445773, 0.5183116, -2.234947, 1, 1, 1, 1, 1,
-1.437983, 0.1516126, -1.793591, 1, 1, 1, 1, 1,
-1.432101, 0.1686973, -0.945573, 0, 0, 1, 1, 1,
-1.427182, -0.4745993, -2.712872, 1, 0, 0, 1, 1,
-1.421701, 0.07965885, -3.901662, 1, 0, 0, 1, 1,
-1.411319, -0.0854577, -2.105745, 1, 0, 0, 1, 1,
-1.405845, 0.4687937, -1.392305, 1, 0, 0, 1, 1,
-1.40584, -1.91634, -1.615925, 1, 0, 0, 1, 1,
-1.400463, -0.5973324, -3.730398, 0, 0, 0, 1, 1,
-1.399317, 2.347041, -0.1862047, 0, 0, 0, 1, 1,
-1.388808, 0.2638255, -1.033013, 0, 0, 0, 1, 1,
-1.387144, 1.051526, -1.060854, 0, 0, 0, 1, 1,
-1.381363, -0.5936675, -2.910102, 0, 0, 0, 1, 1,
-1.370572, 0.5537547, -2.443953, 0, 0, 0, 1, 1,
-1.368966, -0.4955056, -2.333859, 0, 0, 0, 1, 1,
-1.367572, -0.9862749, -1.510331, 1, 1, 1, 1, 1,
-1.360798, -0.8542992, -1.277082, 1, 1, 1, 1, 1,
-1.351622, 0.4014279, -1.320526, 1, 1, 1, 1, 1,
-1.343251, -1.640133, -2.379246, 1, 1, 1, 1, 1,
-1.339177, -0.09845611, -1.705612, 1, 1, 1, 1, 1,
-1.335512, 0.3901881, -0.7450714, 1, 1, 1, 1, 1,
-1.313894, -1.225263, -2.407013, 1, 1, 1, 1, 1,
-1.305156, -0.6324297, -1.264694, 1, 1, 1, 1, 1,
-1.299945, -0.4490972, -1.333934, 1, 1, 1, 1, 1,
-1.270715, 0.3506335, -1.526728, 1, 1, 1, 1, 1,
-1.256225, -0.100774, -2.538868, 1, 1, 1, 1, 1,
-1.254351, 0.2717476, -0.9668678, 1, 1, 1, 1, 1,
-1.246585, -1.176091, -2.242947, 1, 1, 1, 1, 1,
-1.244549, 0.9165059, -2.165241, 1, 1, 1, 1, 1,
-1.24063, -1.048303, -1.581135, 1, 1, 1, 1, 1,
-1.229938, -0.1121408, -2.577587, 0, 0, 1, 1, 1,
-1.21859, -0.4234247, -1.036052, 1, 0, 0, 1, 1,
-1.217131, -1.700689, -3.196692, 1, 0, 0, 1, 1,
-1.213056, 0.3867055, -0.1878857, 1, 0, 0, 1, 1,
-1.203319, 0.4502391, -1.250779, 1, 0, 0, 1, 1,
-1.196843, 0.4018364, -1.470085, 1, 0, 0, 1, 1,
-1.196435, -0.8031333, -2.21593, 0, 0, 0, 1, 1,
-1.188662, -1.220145, -2.702216, 0, 0, 0, 1, 1,
-1.187522, -0.7253112, -1.586686, 0, 0, 0, 1, 1,
-1.185447, 1.459877, -1.793604, 0, 0, 0, 1, 1,
-1.174583, 0.2979064, -0.4077157, 0, 0, 0, 1, 1,
-1.167006, 0.7096075, -1.436965, 0, 0, 0, 1, 1,
-1.165658, 0.02401005, -0.1753794, 0, 0, 0, 1, 1,
-1.160409, 1.326101, -0.8909311, 1, 1, 1, 1, 1,
-1.154605, 0.1780315, -1.654818, 1, 1, 1, 1, 1,
-1.154021, 1.224953, 0.1494406, 1, 1, 1, 1, 1,
-1.148547, -1.106866, -2.25128, 1, 1, 1, 1, 1,
-1.148389, -0.09731527, -1.496834, 1, 1, 1, 1, 1,
-1.148099, 3.587167, 0.04862072, 1, 1, 1, 1, 1,
-1.131318, -0.5614364, -3.464674, 1, 1, 1, 1, 1,
-1.130856, 1.12102, -0.331758, 1, 1, 1, 1, 1,
-1.130091, -0.7846239, -3.889119, 1, 1, 1, 1, 1,
-1.125528, -0.8264033, -0.6720671, 1, 1, 1, 1, 1,
-1.121755, -0.3205806, -1.602778, 1, 1, 1, 1, 1,
-1.113398, 1.173349, -1.288095, 1, 1, 1, 1, 1,
-1.111913, 0.9140661, 0.1047277, 1, 1, 1, 1, 1,
-1.107316, -0.9767017, -2.182371, 1, 1, 1, 1, 1,
-1.097673, 0.5996329, -1.174945, 1, 1, 1, 1, 1,
-1.095588, -1.023331, -2.597646, 0, 0, 1, 1, 1,
-1.093697, -1.00885, -3.187609, 1, 0, 0, 1, 1,
-1.090734, -0.5075174, -2.634151, 1, 0, 0, 1, 1,
-1.089892, -2.219521, -1.001281, 1, 0, 0, 1, 1,
-1.087477, -1.447546, -2.78847, 1, 0, 0, 1, 1,
-1.082244, -0.2617749, -1.580308, 1, 0, 0, 1, 1,
-1.080731, 1.743404, -2.457674, 0, 0, 0, 1, 1,
-1.080375, 0.01794377, -2.795333, 0, 0, 0, 1, 1,
-1.080357, -0.09677124, -3.878531, 0, 0, 0, 1, 1,
-1.077815, -1.739656, -2.182916, 0, 0, 0, 1, 1,
-1.074649, -0.5646631, -1.785495, 0, 0, 0, 1, 1,
-1.074001, 1.477683, 1.134917, 0, 0, 0, 1, 1,
-1.069982, 1.11382, -2.694774, 0, 0, 0, 1, 1,
-1.069953, 1.4382, -1.990583, 1, 1, 1, 1, 1,
-1.059306, -1.780555, -2.062755, 1, 1, 1, 1, 1,
-1.051605, -0.4223515, -1.330003, 1, 1, 1, 1, 1,
-1.043744, 0.8635005, -1.206502, 1, 1, 1, 1, 1,
-1.043424, -1.420005, -3.049912, 1, 1, 1, 1, 1,
-1.040007, -1.483579, -3.75957, 1, 1, 1, 1, 1,
-1.032101, 0.2220119, -1.485961, 1, 1, 1, 1, 1,
-1.03015, 0.2801974, -1.225202, 1, 1, 1, 1, 1,
-1.028406, 0.8585038, -1.697703, 1, 1, 1, 1, 1,
-1.025126, 0.05429363, -0.262305, 1, 1, 1, 1, 1,
-1.022367, -1.50692, -2.978032, 1, 1, 1, 1, 1,
-1.018725, -1.632149, -2.173189, 1, 1, 1, 1, 1,
-1.01807, -1.20017, -2.309216, 1, 1, 1, 1, 1,
-1.015947, -1.900423, -1.964319, 1, 1, 1, 1, 1,
-1.014246, 1.514699, -1.274608, 1, 1, 1, 1, 1,
-1.012972, 1.418531, -1.757424, 0, 0, 1, 1, 1,
-1.009826, -0.1184606, -0.3444964, 1, 0, 0, 1, 1,
-0.9988609, 0.631309, -1.242472, 1, 0, 0, 1, 1,
-0.9897618, 0.4437017, -2.260154, 1, 0, 0, 1, 1,
-0.9888548, 1.245292, -1.318826, 1, 0, 0, 1, 1,
-0.980524, 0.8543395, -0.5552009, 1, 0, 0, 1, 1,
-0.9801989, 0.8318133, 0.6037016, 0, 0, 0, 1, 1,
-0.9760448, -0.3912399, -2.414693, 0, 0, 0, 1, 1,
-0.9748415, -0.276471, 0.2883677, 0, 0, 0, 1, 1,
-0.9599468, -0.8150872, -1.769542, 0, 0, 0, 1, 1,
-0.9590922, -1.136909, -4.49827, 0, 0, 0, 1, 1,
-0.9550388, -0.3473548, -1.019886, 0, 0, 0, 1, 1,
-0.9547623, -0.606671, -2.358077, 0, 0, 0, 1, 1,
-0.9527497, 0.8082262, -0.4338271, 1, 1, 1, 1, 1,
-0.9442164, -0.3083766, -2.743043, 1, 1, 1, 1, 1,
-0.9436923, 1.796393, 0.8661773, 1, 1, 1, 1, 1,
-0.9436689, -0.9769465, -1.48436, 1, 1, 1, 1, 1,
-0.9435749, 1.393556, -1.02707, 1, 1, 1, 1, 1,
-0.9430349, 1.141272, -1.207931, 1, 1, 1, 1, 1,
-0.9422073, 0.6374022, -1.370407, 1, 1, 1, 1, 1,
-0.9399781, -1.323554, -4.155868, 1, 1, 1, 1, 1,
-0.9393141, 0.9173356, -0.3841929, 1, 1, 1, 1, 1,
-0.9359388, 1.575789, -0.9223313, 1, 1, 1, 1, 1,
-0.9313992, 1.084052, -1.405067, 1, 1, 1, 1, 1,
-0.924979, -0.262873, -2.497447, 1, 1, 1, 1, 1,
-0.9233632, 1.426756, -0.5511419, 1, 1, 1, 1, 1,
-0.9225286, 1.588904, -1.570911, 1, 1, 1, 1, 1,
-0.9121606, 0.2333042, -1.573229, 1, 1, 1, 1, 1,
-0.9072789, -0.679952, -3.8102, 0, 0, 1, 1, 1,
-0.8953735, -2.246838, -1.953126, 1, 0, 0, 1, 1,
-0.8950418, -1.366739, -3.33204, 1, 0, 0, 1, 1,
-0.8857616, -1.227087, -4.082298, 1, 0, 0, 1, 1,
-0.883996, 0.4036241, -2.243374, 1, 0, 0, 1, 1,
-0.8808497, 0.6679332, -0.4123967, 1, 0, 0, 1, 1,
-0.8767363, -0.8423744, -3.067223, 0, 0, 0, 1, 1,
-0.8680667, -1.711166, -1.277836, 0, 0, 0, 1, 1,
-0.8677194, -0.2267458, -1.601344, 0, 0, 0, 1, 1,
-0.8663623, 0.8671357, -0.6112303, 0, 0, 0, 1, 1,
-0.8602644, 0.2076782, 0.5588638, 0, 0, 0, 1, 1,
-0.858355, -1.778825, -3.51541, 0, 0, 0, 1, 1,
-0.8581223, -0.1729544, -1.905965, 0, 0, 0, 1, 1,
-0.8566706, 1.4249, -0.4500857, 1, 1, 1, 1, 1,
-0.8565583, 0.2670588, -1.713631, 1, 1, 1, 1, 1,
-0.8492239, 1.209849, -1.60597, 1, 1, 1, 1, 1,
-0.8460482, 0.8449267, 0.1026716, 1, 1, 1, 1, 1,
-0.8366371, -0.8176574, -3.35645, 1, 1, 1, 1, 1,
-0.8334606, -0.6691523, -2.249614, 1, 1, 1, 1, 1,
-0.8280632, -1.761685, -4.466703, 1, 1, 1, 1, 1,
-0.8279497, -1.896657, -5.084181, 1, 1, 1, 1, 1,
-0.82135, -0.6392035, -3.635399, 1, 1, 1, 1, 1,
-0.8204781, 1.00814, 0.740699, 1, 1, 1, 1, 1,
-0.8125671, -0.510599, -4.173635, 1, 1, 1, 1, 1,
-0.8086032, -1.476495, -3.427825, 1, 1, 1, 1, 1,
-0.8079681, 0.9246599, 1.296142, 1, 1, 1, 1, 1,
-0.7971222, 0.0351162, -4.074646, 1, 1, 1, 1, 1,
-0.7950482, 1.181378, 0.2110739, 1, 1, 1, 1, 1,
-0.7943836, -1.197518, -3.233033, 0, 0, 1, 1, 1,
-0.7929927, -1.014653, -4.122411, 1, 0, 0, 1, 1,
-0.7906979, -0.4286482, -1.158353, 1, 0, 0, 1, 1,
-0.7903017, -1.025251, -1.726189, 1, 0, 0, 1, 1,
-0.7887276, 0.5392439, -0.6897573, 1, 0, 0, 1, 1,
-0.7826586, -0.3233031, -1.297469, 1, 0, 0, 1, 1,
-0.7792454, -1.795661, -3.149311, 0, 0, 0, 1, 1,
-0.7783632, -1.328952, -1.429404, 0, 0, 0, 1, 1,
-0.7668582, -1.516662, -2.339293, 0, 0, 0, 1, 1,
-0.7668458, 1.177554, -0.1124781, 0, 0, 0, 1, 1,
-0.7645081, -0.2109711, -3.509119, 0, 0, 0, 1, 1,
-0.7641452, 0.2834185, -3.460205, 0, 0, 0, 1, 1,
-0.7640755, 2.39967, 0.7860712, 0, 0, 0, 1, 1,
-0.7629726, -0.1888729, -1.141476, 1, 1, 1, 1, 1,
-0.7629575, 1.279485, 0.5435294, 1, 1, 1, 1, 1,
-0.7586738, 2.08665, -0.2022078, 1, 1, 1, 1, 1,
-0.7582315, -1.013248, -0.980903, 1, 1, 1, 1, 1,
-0.7515703, -0.5741962, -2.188348, 1, 1, 1, 1, 1,
-0.7490786, -1.992873, -4.206053, 1, 1, 1, 1, 1,
-0.7361937, -0.8563238, -1.368972, 1, 1, 1, 1, 1,
-0.7330654, -0.7676466, -3.210097, 1, 1, 1, 1, 1,
-0.7247757, -1.963035, -1.424461, 1, 1, 1, 1, 1,
-0.72462, 0.8175908, 0.7809702, 1, 1, 1, 1, 1,
-0.7216042, -0.2421658, -3.051256, 1, 1, 1, 1, 1,
-0.7169715, -0.9418389, -1.430679, 1, 1, 1, 1, 1,
-0.7157747, 0.9955729, -0.9320735, 1, 1, 1, 1, 1,
-0.71464, -0.1658364, -1.938525, 1, 1, 1, 1, 1,
-0.7143499, -0.9225197, -2.236473, 1, 1, 1, 1, 1,
-0.7106975, -0.9874421, -3.078242, 0, 0, 1, 1, 1,
-0.7082723, 0.710446, 1.024538, 1, 0, 0, 1, 1,
-0.7043979, -0.04982669, -3.069748, 1, 0, 0, 1, 1,
-0.695899, 1.01406, -0.2482041, 1, 0, 0, 1, 1,
-0.6889561, 1.507994, 1.184704, 1, 0, 0, 1, 1,
-0.6887274, 1.04491, 0.235583, 1, 0, 0, 1, 1,
-0.6862854, -1.237495, -1.973548, 0, 0, 0, 1, 1,
-0.6832724, -2.007157, -3.789011, 0, 0, 0, 1, 1,
-0.682208, 1.907688, -0.318266, 0, 0, 0, 1, 1,
-0.6794746, -1.618333, -1.585858, 0, 0, 0, 1, 1,
-0.6734967, -0.1438373, -3.870403, 0, 0, 0, 1, 1,
-0.6693797, -0.6305307, -2.014328, 0, 0, 0, 1, 1,
-0.6675534, 0.4171605, 0.2184956, 0, 0, 0, 1, 1,
-0.6640794, -1.018193, -3.559168, 1, 1, 1, 1, 1,
-0.6600623, 0.5579614, -0.3241098, 1, 1, 1, 1, 1,
-0.6598995, 0.3569604, -2.051916, 1, 1, 1, 1, 1,
-0.6579645, -0.4495694, -3.788388, 1, 1, 1, 1, 1,
-0.6553813, 0.5647058, -1.209558, 1, 1, 1, 1, 1,
-0.6539108, 0.1499228, 0.2426159, 1, 1, 1, 1, 1,
-0.6492972, -2.142985, -2.535206, 1, 1, 1, 1, 1,
-0.6445699, -1.22021, -1.880506, 1, 1, 1, 1, 1,
-0.6434838, -1.025324, -4.394828, 1, 1, 1, 1, 1,
-0.6405181, 1.990796, -0.9231496, 1, 1, 1, 1, 1,
-0.6394267, 1.025955, -1.041718, 1, 1, 1, 1, 1,
-0.6282869, -0.3119771, -1.747374, 1, 1, 1, 1, 1,
-0.6262324, 0.4063554, -1.551342, 1, 1, 1, 1, 1,
-0.6145914, 0.2616675, -2.469999, 1, 1, 1, 1, 1,
-0.6132566, 0.5503655, 0.2582517, 1, 1, 1, 1, 1,
-0.6116526, 1.376357, -0.9525664, 0, 0, 1, 1, 1,
-0.6110136, -2.09997, -3.596103, 1, 0, 0, 1, 1,
-0.6107162, 1.231074, -0.8094128, 1, 0, 0, 1, 1,
-0.6070091, 1.677146, -0.7680662, 1, 0, 0, 1, 1,
-0.605805, 0.1800806, -1.202272, 1, 0, 0, 1, 1,
-0.6026987, -0.3244758, -1.471159, 1, 0, 0, 1, 1,
-0.5930141, -0.8369218, -1.679792, 0, 0, 0, 1, 1,
-0.5906193, 0.3675642, 0.5750163, 0, 0, 0, 1, 1,
-0.5899011, -1.928112, -2.538666, 0, 0, 0, 1, 1,
-0.5886528, -0.6442074, -2.042287, 0, 0, 0, 1, 1,
-0.5869787, 0.9879169, -1.825988, 0, 0, 0, 1, 1,
-0.5824468, -1.137744, -1.8591, 0, 0, 0, 1, 1,
-0.5817992, -0.7262262, -1.758318, 0, 0, 0, 1, 1,
-0.5816128, -1.298699, -2.888686, 1, 1, 1, 1, 1,
-0.5800018, 0.5859128, -0.3413829, 1, 1, 1, 1, 1,
-0.5786386, 0.3744046, 0.6648219, 1, 1, 1, 1, 1,
-0.5737126, 0.3483397, -1.08091, 1, 1, 1, 1, 1,
-0.5708846, -1.236491, -3.370181, 1, 1, 1, 1, 1,
-0.569208, -0.5482404, -1.882431, 1, 1, 1, 1, 1,
-0.5645453, -0.2380908, -2.630182, 1, 1, 1, 1, 1,
-0.5539718, -0.2836141, -2.84626, 1, 1, 1, 1, 1,
-0.5531888, -0.4371174, -2.039704, 1, 1, 1, 1, 1,
-0.5514628, 0.6221506, -0.9709617, 1, 1, 1, 1, 1,
-0.549363, 1.526801, -0.1965286, 1, 1, 1, 1, 1,
-0.5470434, 0.6697213, -1.077809, 1, 1, 1, 1, 1,
-0.5446615, 0.07114843, -1.035962, 1, 1, 1, 1, 1,
-0.5432015, -0.1833552, -0.2612762, 1, 1, 1, 1, 1,
-0.542059, 0.7882451, -1.349586, 1, 1, 1, 1, 1,
-0.5386147, -1.779883, -3.822318, 0, 0, 1, 1, 1,
-0.5344944, 1.075278, -2.652126, 1, 0, 0, 1, 1,
-0.5326024, -0.3175417, -1.059504, 1, 0, 0, 1, 1,
-0.5270276, 0.5862228, -0.6042922, 1, 0, 0, 1, 1,
-0.5262724, 1.114696, 0.6076666, 1, 0, 0, 1, 1,
-0.5260079, -0.5654767, -3.557411, 1, 0, 0, 1, 1,
-0.5248861, 1.976581, -0.475445, 0, 0, 0, 1, 1,
-0.5248064, 0.4614004, -0.5707529, 0, 0, 0, 1, 1,
-0.5247036, -1.778664, -4.604312, 0, 0, 0, 1, 1,
-0.5241293, 1.234614, 1.252342, 0, 0, 0, 1, 1,
-0.5230152, 0.3499047, 0.9584779, 0, 0, 0, 1, 1,
-0.521804, 0.9401225, -0.5716822, 0, 0, 0, 1, 1,
-0.5108834, -0.774722, -3.638497, 0, 0, 0, 1, 1,
-0.5089659, 1.570999, -0.4327994, 1, 1, 1, 1, 1,
-0.5069119, 1.123754, 0.6025093, 1, 1, 1, 1, 1,
-0.5026084, -0.4703063, -1.664458, 1, 1, 1, 1, 1,
-0.5008001, 1.709211, 0.4567607, 1, 1, 1, 1, 1,
-0.4967579, -0.1348978, -1.926386, 1, 1, 1, 1, 1,
-0.4959883, -0.2599718, -1.320745, 1, 1, 1, 1, 1,
-0.4950547, -1.255819, -3.37472, 1, 1, 1, 1, 1,
-0.48565, 0.9923353, -0.8087378, 1, 1, 1, 1, 1,
-0.4832103, 0.8195711, -1.363877, 1, 1, 1, 1, 1,
-0.4819517, -0.4302617, -2.967596, 1, 1, 1, 1, 1,
-0.4775759, -1.024544, -2.5354, 1, 1, 1, 1, 1,
-0.4762707, -0.8085462, -2.223146, 1, 1, 1, 1, 1,
-0.4753698, 1.307218, -0.5317417, 1, 1, 1, 1, 1,
-0.474686, -0.8623406, -3.423064, 1, 1, 1, 1, 1,
-0.4743222, 2.560393, -1.337969, 1, 1, 1, 1, 1,
-0.4732741, 0.6324808, 0.2188565, 0, 0, 1, 1, 1,
-0.4726961, -0.3006736, -2.021764, 1, 0, 0, 1, 1,
-0.4662153, 1.382609, -0.05047983, 1, 0, 0, 1, 1,
-0.4616617, -0.2613113, -2.15295, 1, 0, 0, 1, 1,
-0.4588501, -0.4466828, -3.897648, 1, 0, 0, 1, 1,
-0.4508119, 0.7727959, -0.5052252, 1, 0, 0, 1, 1,
-0.4496022, 1.250407, 1.682303, 0, 0, 0, 1, 1,
-0.447709, 0.190799, -1.961313, 0, 0, 0, 1, 1,
-0.4476472, -0.6274005, -2.699476, 0, 0, 0, 1, 1,
-0.4462821, 0.632127, 0.268409, 0, 0, 0, 1, 1,
-0.439462, 0.5607862, -0.5400441, 0, 0, 0, 1, 1,
-0.4310797, 0.3433863, 0.6071593, 0, 0, 0, 1, 1,
-0.4309277, 1.704515, 0.2608178, 0, 0, 0, 1, 1,
-0.4305168, 0.1874459, -1.892306, 1, 1, 1, 1, 1,
-0.4276604, -1.022575, -2.776686, 1, 1, 1, 1, 1,
-0.4276041, -0.1586228, -2.472159, 1, 1, 1, 1, 1,
-0.4232481, 2.063929, 1.081371, 1, 1, 1, 1, 1,
-0.4180934, -0.008335171, -1.540919, 1, 1, 1, 1, 1,
-0.4171856, 0.03014438, 0.06097298, 1, 1, 1, 1, 1,
-0.4161713, 0.3043258, -2.189956, 1, 1, 1, 1, 1,
-0.4159005, -0.742585, -3.910916, 1, 1, 1, 1, 1,
-0.4138482, -0.6730912, -2.358882, 1, 1, 1, 1, 1,
-0.4114853, 1.154612, -0.279358, 1, 1, 1, 1, 1,
-0.4045061, 1.6995, -1.597708, 1, 1, 1, 1, 1,
-0.4024723, 0.2035769, -1.441225, 1, 1, 1, 1, 1,
-0.3936724, -0.7742126, -1.895126, 1, 1, 1, 1, 1,
-0.3887171, 0.7209772, -0.3401024, 1, 1, 1, 1, 1,
-0.3869198, -0.4314081, -4.794777, 1, 1, 1, 1, 1,
-0.3863307, 1.112846, 0.1568265, 0, 0, 1, 1, 1,
-0.3862707, 0.9853179, -0.8006153, 1, 0, 0, 1, 1,
-0.384253, 1.971691, 1.559086, 1, 0, 0, 1, 1,
-0.3839638, -0.4603925, 0.1381543, 1, 0, 0, 1, 1,
-0.381461, 0.292037, -1.663812, 1, 0, 0, 1, 1,
-0.3801091, 0.7241881, -1.686689, 1, 0, 0, 1, 1,
-0.3798977, -0.1876614, -1.082746, 0, 0, 0, 1, 1,
-0.3721871, 0.7589213, 0.9966376, 0, 0, 0, 1, 1,
-0.3667327, -0.77089, -1.845326, 0, 0, 0, 1, 1,
-0.3655357, -1.738631, -1.999712, 0, 0, 0, 1, 1,
-0.3641019, 0.5657046, 0.4700805, 0, 0, 0, 1, 1,
-0.3640188, -0.4183097, -2.802991, 0, 0, 0, 1, 1,
-0.3627078, -1.686145, -3.822344, 0, 0, 0, 1, 1,
-0.3607342, 0.6198276, 1.220328, 1, 1, 1, 1, 1,
-0.3604125, -0.7939296, -2.218164, 1, 1, 1, 1, 1,
-0.3581461, 1.361138, 0.4119368, 1, 1, 1, 1, 1,
-0.355453, -0.6735504, -3.352357, 1, 1, 1, 1, 1,
-0.3535868, 0.3890827, 0.2400852, 1, 1, 1, 1, 1,
-0.3510917, 0.7661502, -1.208086, 1, 1, 1, 1, 1,
-0.3475919, 1.125148, 0.4791131, 1, 1, 1, 1, 1,
-0.3471186, -0.8475782, -2.364671, 1, 1, 1, 1, 1,
-0.3439064, -0.8913971, -2.858011, 1, 1, 1, 1, 1,
-0.3414009, -0.7289599, -2.847589, 1, 1, 1, 1, 1,
-0.3375647, -2.023673, -3.821112, 1, 1, 1, 1, 1,
-0.3358086, 0.760865, -0.6343254, 1, 1, 1, 1, 1,
-0.3349229, -0.3007077, 0.2499931, 1, 1, 1, 1, 1,
-0.3343293, 0.2158657, -1.602888, 1, 1, 1, 1, 1,
-0.3305729, 0.1538688, -1.498773, 1, 1, 1, 1, 1,
-0.3289571, 0.4888816, -0.4594075, 0, 0, 1, 1, 1,
-0.3250332, -0.04646923, -2.206497, 1, 0, 0, 1, 1,
-0.3246218, -1.395852, -2.286723, 1, 0, 0, 1, 1,
-0.3231172, 0.2471696, -1.16956, 1, 0, 0, 1, 1,
-0.3175779, -0.565391, -2.540428, 1, 0, 0, 1, 1,
-0.3139553, 1.041985, 0.1884757, 1, 0, 0, 1, 1,
-0.3059849, 0.914681, -2.622068, 0, 0, 0, 1, 1,
-0.3029305, 0.09918195, -1.89326, 0, 0, 0, 1, 1,
-0.302328, -0.4417292, -2.892152, 0, 0, 0, 1, 1,
-0.3019227, 0.547282, 0.06256435, 0, 0, 0, 1, 1,
-0.3011388, -1.024585, -4.805754, 0, 0, 0, 1, 1,
-0.2950334, 0.6516916, -1.14697, 0, 0, 0, 1, 1,
-0.2938271, 2.156157, 0.09764105, 0, 0, 0, 1, 1,
-0.2936699, -0.4207059, -0.5451794, 1, 1, 1, 1, 1,
-0.2903881, -1.096082, -3.458579, 1, 1, 1, 1, 1,
-0.290062, 1.166392, 0.702557, 1, 1, 1, 1, 1,
-0.2894271, 0.07453363, -0.4582915, 1, 1, 1, 1, 1,
-0.2893981, 0.108603, -1.630262, 1, 1, 1, 1, 1,
-0.2827981, -1.419188, -3.168838, 1, 1, 1, 1, 1,
-0.2799529, 1.308401, -0.4951035, 1, 1, 1, 1, 1,
-0.2796742, 0.9434642, -1.363451, 1, 1, 1, 1, 1,
-0.2794666, -0.8521359, -0.6322834, 1, 1, 1, 1, 1,
-0.2749805, -0.9735476, -3.647251, 1, 1, 1, 1, 1,
-0.2744095, 0.1244543, -1.439122, 1, 1, 1, 1, 1,
-0.2727558, -0.3025787, -2.45313, 1, 1, 1, 1, 1,
-0.2717388, 0.01952345, -0.8114879, 1, 1, 1, 1, 1,
-0.2706398, 0.8941627, -1.544537, 1, 1, 1, 1, 1,
-0.2702605, 0.7920151, 0.04003946, 1, 1, 1, 1, 1,
-0.2688762, -2.113166, -1.537905, 0, 0, 1, 1, 1,
-0.2660978, 0.2180799, -0.164576, 1, 0, 0, 1, 1,
-0.2644319, 1.210357, 0.9681399, 1, 0, 0, 1, 1,
-0.2602882, -1.025373, -2.516752, 1, 0, 0, 1, 1,
-0.2594849, 0.2153515, -0.973287, 1, 0, 0, 1, 1,
-0.2588758, 0.1482484, -0.9118207, 1, 0, 0, 1, 1,
-0.2534001, 1.516336, -1.464193, 0, 0, 0, 1, 1,
-0.2520454, -0.2785284, -2.267256, 0, 0, 0, 1, 1,
-0.2459789, -0.3178504, -1.212994, 0, 0, 0, 1, 1,
-0.2437713, 2.457046, -1.666398, 0, 0, 0, 1, 1,
-0.2412942, 0.3432539, 0.2399667, 0, 0, 0, 1, 1,
-0.2361649, 0.8831817, 0.7071878, 0, 0, 0, 1, 1,
-0.2348749, -0.7915568, -1.458347, 0, 0, 0, 1, 1,
-0.2337914, -1.35901, -4.022945, 1, 1, 1, 1, 1,
-0.2331303, -0.5567483, -2.640688, 1, 1, 1, 1, 1,
-0.2322855, -0.4514888, -2.597015, 1, 1, 1, 1, 1,
-0.2223052, -2.032956, -3.232355, 1, 1, 1, 1, 1,
-0.2185681, -0.9691626, -3.635018, 1, 1, 1, 1, 1,
-0.2117069, -0.7065783, -2.716914, 1, 1, 1, 1, 1,
-0.2051529, -1.650065, -2.632497, 1, 1, 1, 1, 1,
-0.2050997, -1.128984, -2.091142, 1, 1, 1, 1, 1,
-0.2037442, -1.347015, -3.315424, 1, 1, 1, 1, 1,
-0.2023321, 0.6087351, -1.332248, 1, 1, 1, 1, 1,
-0.2014495, -0.2121313, -1.327112, 1, 1, 1, 1, 1,
-0.2004702, 0.3582309, 0.4709173, 1, 1, 1, 1, 1,
-0.198304, 0.09851245, -0.4424747, 1, 1, 1, 1, 1,
-0.1942457, -0.6521444, -3.534219, 1, 1, 1, 1, 1,
-0.1939264, -1.08967, -2.58466, 1, 1, 1, 1, 1,
-0.1922995, 1.171665, -0.7409186, 0, 0, 1, 1, 1,
-0.1832414, 1.656802, -0.2489995, 1, 0, 0, 1, 1,
-0.1822283, -1.61874, -2.563067, 1, 0, 0, 1, 1,
-0.1804921, 1.116044, 0.575128, 1, 0, 0, 1, 1,
-0.1767631, -1.104754, -3.716525, 1, 0, 0, 1, 1,
-0.1762496, -0.2437842, -2.269846, 1, 0, 0, 1, 1,
-0.1717615, 0.002538686, 0.4413817, 0, 0, 0, 1, 1,
-0.1700923, 0.6705082, -1.326468, 0, 0, 0, 1, 1,
-0.1664147, 0.02337318, -1.72512, 0, 0, 0, 1, 1,
-0.1663074, 2.287649, 0.5459494, 0, 0, 0, 1, 1,
-0.1638107, -1.981307, -2.136519, 0, 0, 0, 1, 1,
-0.1555058, 0.1774091, -1.462022, 0, 0, 0, 1, 1,
-0.1546942, -0.6294569, -3.919342, 0, 0, 0, 1, 1,
-0.1543823, -1.113108, -1.911077, 1, 1, 1, 1, 1,
-0.1533285, -0.1659074, -3.699793, 1, 1, 1, 1, 1,
-0.1481265, -0.5217925, -1.836896, 1, 1, 1, 1, 1,
-0.1465988, -0.1279746, -2.414037, 1, 1, 1, 1, 1,
-0.1452565, 1.085417, 0.4288204, 1, 1, 1, 1, 1,
-0.1436789, -1.144734, -5.535133, 1, 1, 1, 1, 1,
-0.1320381, -0.8682088, -3.558069, 1, 1, 1, 1, 1,
-0.1319621, 0.7313881, 0.7935855, 1, 1, 1, 1, 1,
-0.1308646, -1.122879, -2.990843, 1, 1, 1, 1, 1,
-0.1296082, -0.5477098, -2.854514, 1, 1, 1, 1, 1,
-0.1295399, -0.1784612, -3.253242, 1, 1, 1, 1, 1,
-0.1268944, -1.064002, -2.553668, 1, 1, 1, 1, 1,
-0.1232554, -0.1032346, -1.186097, 1, 1, 1, 1, 1,
-0.1198428, 1.212714, 0.8478373, 1, 1, 1, 1, 1,
-0.1192685, 1.024925, -0.1495091, 1, 1, 1, 1, 1,
-0.1186591, 0.9813918, -1.324148, 0, 0, 1, 1, 1,
-0.1170887, -1.584549, -2.262853, 1, 0, 0, 1, 1,
-0.1155414, -0.1043936, -0.9992753, 1, 0, 0, 1, 1,
-0.1139606, -1.928446, -2.065063, 1, 0, 0, 1, 1,
-0.1124289, 0.05224554, -3.047221, 1, 0, 0, 1, 1,
-0.112147, -3.432246, -3.561039, 1, 0, 0, 1, 1,
-0.1112894, 0.004129649, -1.228548, 0, 0, 0, 1, 1,
-0.110323, 1.06377, -0.1331074, 0, 0, 0, 1, 1,
-0.1092584, 0.6725941, 0.440006, 0, 0, 0, 1, 1,
-0.1058031, 1.071623, 0.9156133, 0, 0, 0, 1, 1,
-0.1031271, 0.5506391, 0.9393679, 0, 0, 0, 1, 1,
-0.09909938, -0.9649926, -2.007891, 0, 0, 0, 1, 1,
-0.09723955, -0.3656928, -1.962717, 0, 0, 0, 1, 1,
-0.09506929, 1.359434, -0.004035396, 1, 1, 1, 1, 1,
-0.09320557, -0.1828959, -3.291255, 1, 1, 1, 1, 1,
-0.09191786, 0.9460149, -0.7011582, 1, 1, 1, 1, 1,
-0.09138957, 0.6193293, -0.03350489, 1, 1, 1, 1, 1,
-0.08917389, 1.418215, -1.236503, 1, 1, 1, 1, 1,
-0.08856453, 0.3912192, -0.1759554, 1, 1, 1, 1, 1,
-0.08846524, -0.8278992, -3.893055, 1, 1, 1, 1, 1,
-0.08357751, -0.9211417, -2.849793, 1, 1, 1, 1, 1,
-0.08165863, 0.5892218, -0.276574, 1, 1, 1, 1, 1,
-0.08139114, 0.6258942, -0.7830933, 1, 1, 1, 1, 1,
-0.0780687, -0.6186705, -2.886924, 1, 1, 1, 1, 1,
-0.07505328, -1.604876, -3.668966, 1, 1, 1, 1, 1,
-0.06958825, -1.098116, -3.341049, 1, 1, 1, 1, 1,
-0.06460673, -1.061688, -3.268783, 1, 1, 1, 1, 1,
-0.06407195, -0.5110868, 0.1308646, 1, 1, 1, 1, 1,
-0.06352021, -0.749527, -2.226404, 0, 0, 1, 1, 1,
-0.06302192, -0.657759, -3.109361, 1, 0, 0, 1, 1,
-0.05580298, -1.77167, -2.19066, 1, 0, 0, 1, 1,
-0.05411306, 0.2091471, 0.712419, 1, 0, 0, 1, 1,
-0.05364486, 0.4834312, -0.381561, 1, 0, 0, 1, 1,
-0.0531566, -0.6223823, -3.321178, 1, 0, 0, 1, 1,
-0.05250824, -0.07255351, -3.085008, 0, 0, 0, 1, 1,
-0.05049955, 0.3823434, 1.546018, 0, 0, 0, 1, 1,
-0.04838081, -1.210263, -3.148224, 0, 0, 0, 1, 1,
-0.0452215, 0.4558469, -1.023161, 0, 0, 0, 1, 1,
-0.03780966, 0.8229619, -0.2910745, 0, 0, 0, 1, 1,
-0.03330818, -1.801866, -2.972749, 0, 0, 0, 1, 1,
-0.03125086, 0.5995207, -0.6804681, 0, 0, 0, 1, 1,
-0.02868956, -0.630477, -3.299459, 1, 1, 1, 1, 1,
-0.02075684, 0.06165349, -0.9257958, 1, 1, 1, 1, 1,
-0.01921755, 2.39662, 1.028399, 1, 1, 1, 1, 1,
-0.01683952, -1.040631, -3.386805, 1, 1, 1, 1, 1,
-0.01680041, -2.160615, -5.122502, 1, 1, 1, 1, 1,
-0.00970526, 0.3016536, 1.050665, 1, 1, 1, 1, 1,
-0.008416303, 2.043769, -0.145198, 1, 1, 1, 1, 1,
-0.008314794, -0.9945694, -3.707839, 1, 1, 1, 1, 1,
-0.007379311, 1.180547, 0.6195573, 1, 1, 1, 1, 1,
0.0009646796, -0.1604317, 5.578923, 1, 1, 1, 1, 1,
0.001188329, 0.26013, 0.689853, 1, 1, 1, 1, 1,
0.003127246, 0.5513275, -0.3926587, 1, 1, 1, 1, 1,
0.00547503, -0.8090438, 2.321753, 1, 1, 1, 1, 1,
0.01229905, 0.1333378, 0.8673627, 1, 1, 1, 1, 1,
0.01258729, -1.283582, 2.919586, 1, 1, 1, 1, 1,
0.01433194, -0.3126694, 0.6923376, 0, 0, 1, 1, 1,
0.01532517, 0.2243621, 2.173354, 1, 0, 0, 1, 1,
0.01838574, 0.8736511, -1.068247, 1, 0, 0, 1, 1,
0.01859046, -1.137802, 2.172515, 1, 0, 0, 1, 1,
0.02715554, 1.060418, 1.045705, 1, 0, 0, 1, 1,
0.02871397, -0.3389711, 1.879719, 1, 0, 0, 1, 1,
0.031781, -0.2622056, 3.751966, 0, 0, 0, 1, 1,
0.03309905, 1.088863, -0.6420043, 0, 0, 0, 1, 1,
0.03352662, 1.130857, 0.7381503, 0, 0, 0, 1, 1,
0.04056237, 1.663652, -0.6088508, 0, 0, 0, 1, 1,
0.04196815, 0.5480158, 0.1689448, 0, 0, 0, 1, 1,
0.04887623, -2.017961, 1.456728, 0, 0, 0, 1, 1,
0.0498581, 0.2320995, 0.3593588, 0, 0, 0, 1, 1,
0.05059398, 1.313674, 1.558614, 1, 1, 1, 1, 1,
0.05308588, -0.2830788, 2.192506, 1, 1, 1, 1, 1,
0.05375878, -0.8147821, 2.122818, 1, 1, 1, 1, 1,
0.05917441, -0.6364571, 4.077093, 1, 1, 1, 1, 1,
0.06925838, 2.103234, 0.1444609, 1, 1, 1, 1, 1,
0.06930231, 0.5000623, -0.8707754, 1, 1, 1, 1, 1,
0.07140473, 0.2415879, -0.7195529, 1, 1, 1, 1, 1,
0.07156229, 0.4699294, 0.9424461, 1, 1, 1, 1, 1,
0.07526357, -0.594731, 4.306364, 1, 1, 1, 1, 1,
0.07701331, 1.367751, -0.8502616, 1, 1, 1, 1, 1,
0.07777014, -3.140325, 4.878529, 1, 1, 1, 1, 1,
0.07787505, -1.232748, 1.332551, 1, 1, 1, 1, 1,
0.08004351, 0.7823064, -1.323177, 1, 1, 1, 1, 1,
0.0807945, -0.7610859, 2.441905, 1, 1, 1, 1, 1,
0.0851332, -0.6728171, 2.706735, 1, 1, 1, 1, 1,
0.08520046, -0.5429236, 4.092729, 0, 0, 1, 1, 1,
0.08603433, -0.5861447, 3.445464, 1, 0, 0, 1, 1,
0.0917138, 1.888409, 0.09696041, 1, 0, 0, 1, 1,
0.09431176, 1.366472, 0.2541406, 1, 0, 0, 1, 1,
0.09906876, -1.451653, 2.901695, 1, 0, 0, 1, 1,
0.09998955, -1.173372, 1.692021, 1, 0, 0, 1, 1,
0.101666, 1.092133, 0.1599643, 0, 0, 0, 1, 1,
0.1034584, -1.050225, 3.917, 0, 0, 0, 1, 1,
0.109531, 0.1995758, 1.202549, 0, 0, 0, 1, 1,
0.1123155, 0.4039396, -0.3663164, 0, 0, 0, 1, 1,
0.1141496, 0.1398848, 0.1351158, 0, 0, 0, 1, 1,
0.1224534, -0.1186313, 2.90117, 0, 0, 0, 1, 1,
0.1239964, 1.228652, -1.698343, 0, 0, 0, 1, 1,
0.1270951, -1.112418, 3.558243, 1, 1, 1, 1, 1,
0.127918, 1.650227, -0.3620263, 1, 1, 1, 1, 1,
0.1282521, 0.07057111, 0.8427212, 1, 1, 1, 1, 1,
0.1286333, -1.042053, 3.097657, 1, 1, 1, 1, 1,
0.1311135, -0.5959034, 3.771786, 1, 1, 1, 1, 1,
0.1354235, 1.760732, 0.8589362, 1, 1, 1, 1, 1,
0.1369893, -0.5841556, 2.067921, 1, 1, 1, 1, 1,
0.1394145, -0.02715679, 1.935566, 1, 1, 1, 1, 1,
0.1399467, -0.5226349, 4.769496, 1, 1, 1, 1, 1,
0.142846, -0.9898183, 4.009307, 1, 1, 1, 1, 1,
0.145863, 0.3152276, -1.383449, 1, 1, 1, 1, 1,
0.1507312, -0.59367, 2.101902, 1, 1, 1, 1, 1,
0.1514188, -0.7010692, 4.048859, 1, 1, 1, 1, 1,
0.1545746, 0.6348343, -0.4592593, 1, 1, 1, 1, 1,
0.1547263, -1.636166, 4.215153, 1, 1, 1, 1, 1,
0.1550375, -1.785193, 2.882592, 0, 0, 1, 1, 1,
0.1577684, 0.1803719, 1.641114, 1, 0, 0, 1, 1,
0.1699291, -1.514422, 2.466635, 1, 0, 0, 1, 1,
0.1709498, 0.7735519, -0.6671782, 1, 0, 0, 1, 1,
0.1722507, -0.05988425, 1.73755, 1, 0, 0, 1, 1,
0.1723644, -0.5919286, 1.798458, 1, 0, 0, 1, 1,
0.1769273, 0.2632856, 0.412947, 0, 0, 0, 1, 1,
0.178582, -0.4459762, 2.324208, 0, 0, 0, 1, 1,
0.1785894, -1.541296, 1.828949, 0, 0, 0, 1, 1,
0.1803539, 0.7163574, 1.709242, 0, 0, 0, 1, 1,
0.1858495, -1.726745, 3.545403, 0, 0, 0, 1, 1,
0.185975, -0.8725514, 2.232274, 0, 0, 0, 1, 1,
0.1899689, 0.2447044, 0.6383442, 0, 0, 0, 1, 1,
0.1905013, 0.4012183, -1.489513, 1, 1, 1, 1, 1,
0.1915946, -0.6503201, 2.96862, 1, 1, 1, 1, 1,
0.1921165, -1.107109, 3.817921, 1, 1, 1, 1, 1,
0.1921734, -0.5238315, 1.793148, 1, 1, 1, 1, 1,
0.1943437, 0.03209584, 1.040994, 1, 1, 1, 1, 1,
0.1969968, 1.312708, -0.02561587, 1, 1, 1, 1, 1,
0.2018438, -0.5460817, 2.110867, 1, 1, 1, 1, 1,
0.2039278, 0.3217694, -0.272, 1, 1, 1, 1, 1,
0.2041496, 1.635332, 0.3060062, 1, 1, 1, 1, 1,
0.2084084, 0.9177037, 0.6431447, 1, 1, 1, 1, 1,
0.2122649, -1.698416, 3.791146, 1, 1, 1, 1, 1,
0.2153244, 0.1751071, 2.331344, 1, 1, 1, 1, 1,
0.2172536, 0.163487, 0.4690354, 1, 1, 1, 1, 1,
0.2272595, -0.8042065, 5.601624, 1, 1, 1, 1, 1,
0.2275522, 0.004164369, 1.359122, 1, 1, 1, 1, 1,
0.2314548, 1.783231, 1.711971, 0, 0, 1, 1, 1,
0.2343055, 0.9106859, 1.526146, 1, 0, 0, 1, 1,
0.2347674, -0.142724, 4.63662, 1, 0, 0, 1, 1,
0.2360869, 0.3783075, 2.494378, 1, 0, 0, 1, 1,
0.2450762, 0.1278408, 1.351046, 1, 0, 0, 1, 1,
0.246033, 0.6697959, 1.852835, 1, 0, 0, 1, 1,
0.25154, -0.5242447, 2.378924, 0, 0, 0, 1, 1,
0.2524618, -0.392496, 3.598618, 0, 0, 0, 1, 1,
0.2539059, -1.344316, 3.703899, 0, 0, 0, 1, 1,
0.2548466, -0.7407976, 3.033791, 0, 0, 0, 1, 1,
0.2569156, -0.8009643, 3.706477, 0, 0, 0, 1, 1,
0.2573199, -0.2566481, 2.431747, 0, 0, 0, 1, 1,
0.2599339, 0.2312396, 0.2426706, 0, 0, 0, 1, 1,
0.2622368, -0.1953598, 1.81644, 1, 1, 1, 1, 1,
0.2635917, -1.704153, 3.236171, 1, 1, 1, 1, 1,
0.2656139, -0.262029, 2.638686, 1, 1, 1, 1, 1,
0.27189, 0.6673597, 1.333804, 1, 1, 1, 1, 1,
0.2724017, 1.27657, -1.030793, 1, 1, 1, 1, 1,
0.2762346, 1.029255, 1.038761, 1, 1, 1, 1, 1,
0.2798622, -1.383992, 1.984269, 1, 1, 1, 1, 1,
0.2879997, 0.6209732, 0.6765231, 1, 1, 1, 1, 1,
0.2915684, 1.579978, 1.164839, 1, 1, 1, 1, 1,
0.2918767, -0.5483606, 3.036319, 1, 1, 1, 1, 1,
0.293014, -1.527607, 2.805017, 1, 1, 1, 1, 1,
0.2932285, -0.7413942, 2.53805, 1, 1, 1, 1, 1,
0.2948337, 0.3797625, 0.8455474, 1, 1, 1, 1, 1,
0.2956388, -1.191662, 1.573518, 1, 1, 1, 1, 1,
0.298312, 1.915298, 0.2661746, 1, 1, 1, 1, 1,
0.2985644, -1.471218, 1.308936, 0, 0, 1, 1, 1,
0.3024084, -0.4831569, 3.159272, 1, 0, 0, 1, 1,
0.3029443, -1.834536, 3.881186, 1, 0, 0, 1, 1,
0.3033579, 0.765651, 0.5150808, 1, 0, 0, 1, 1,
0.3107777, 2.081719, -0.0632844, 1, 0, 0, 1, 1,
0.3151726, 0.5044841, -0.1681787, 1, 0, 0, 1, 1,
0.3178418, 0.2245037, 0.3211817, 0, 0, 0, 1, 1,
0.3189877, -0.9287001, 2.626475, 0, 0, 0, 1, 1,
0.3203954, 1.143577, -0.2679222, 0, 0, 0, 1, 1,
0.323911, 0.7517657, 0.5307672, 0, 0, 0, 1, 1,
0.3245863, 0.5662395, 1.021774, 0, 0, 0, 1, 1,
0.3258074, 0.3478892, 3.582288, 0, 0, 0, 1, 1,
0.3270584, -0.4942445, 3.04146, 0, 0, 0, 1, 1,
0.3285477, 0.0179048, 1.251676, 1, 1, 1, 1, 1,
0.330334, -0.07186933, 0.74537, 1, 1, 1, 1, 1,
0.3396879, -0.8026333, 2.985641, 1, 1, 1, 1, 1,
0.3414936, -0.08374356, 2.128344, 1, 1, 1, 1, 1,
0.3445791, -0.06179883, 1.377623, 1, 1, 1, 1, 1,
0.3499251, -1.020007, 3.699593, 1, 1, 1, 1, 1,
0.3510138, -0.08214018, 0.8268449, 1, 1, 1, 1, 1,
0.3530238, 0.4928438, 1.783703, 1, 1, 1, 1, 1,
0.3560015, -2.174349, 2.347144, 1, 1, 1, 1, 1,
0.3566638, -0.5162878, 0.9895738, 1, 1, 1, 1, 1,
0.35668, 0.4432106, 0.4573238, 1, 1, 1, 1, 1,
0.359396, 0.6342817, 0.4269446, 1, 1, 1, 1, 1,
0.3657811, -0.8155778, 3.547962, 1, 1, 1, 1, 1,
0.3765868, -1.876057, 4.433304, 1, 1, 1, 1, 1,
0.3811466, 1.244241, 1.490501, 1, 1, 1, 1, 1,
0.3863411, -1.468555, 0.7887039, 0, 0, 1, 1, 1,
0.3889867, 0.6026888, -0.1246578, 1, 0, 0, 1, 1,
0.3914897, -0.001780126, 0.2217874, 1, 0, 0, 1, 1,
0.3923326, -0.09287681, 2.709125, 1, 0, 0, 1, 1,
0.3972966, 1.078646, -0.740939, 1, 0, 0, 1, 1,
0.3978014, -0.07187191, 0.7613779, 1, 0, 0, 1, 1,
0.3986064, 1.722024, -0.4517734, 0, 0, 0, 1, 1,
0.3993973, 0.750149, -1.608929, 0, 0, 0, 1, 1,
0.4015858, -1.177824, 3.021528, 0, 0, 0, 1, 1,
0.4060908, -0.1560736, 0.7132916, 0, 0, 0, 1, 1,
0.4116855, 1.753343, 1.371608, 0, 0, 0, 1, 1,
0.4173358, -0.1188151, 0.5169544, 0, 0, 0, 1, 1,
0.4222134, -0.06048786, 0.6241369, 0, 0, 0, 1, 1,
0.4262126, -0.8960118, 4.211804, 1, 1, 1, 1, 1,
0.4280132, -0.3913047, 0.666726, 1, 1, 1, 1, 1,
0.4297795, 0.8601421, 0.3785852, 1, 1, 1, 1, 1,
0.4382529, 0.8841288, 0.9917483, 1, 1, 1, 1, 1,
0.4482806, -0.8724195, 1.672463, 1, 1, 1, 1, 1,
0.4486066, -1.342186, 3.093894, 1, 1, 1, 1, 1,
0.4500907, 0.8424534, 0.2619664, 1, 1, 1, 1, 1,
0.4509191, 0.9721359, -0.5080462, 1, 1, 1, 1, 1,
0.4522736, 1.731699, 0.1217921, 1, 1, 1, 1, 1,
0.4698002, -0.5287593, 3.498085, 1, 1, 1, 1, 1,
0.469871, -0.008363031, 2.044766, 1, 1, 1, 1, 1,
0.4699209, -0.3828726, 2.342321, 1, 1, 1, 1, 1,
0.4744303, 0.6265985, 2.1484, 1, 1, 1, 1, 1,
0.4799924, 1.035476, 0.1185599, 1, 1, 1, 1, 1,
0.4816081, -1.150769, 2.55327, 1, 1, 1, 1, 1,
0.4883873, 0.521659, 0.7823294, 0, 0, 1, 1, 1,
0.4976829, 0.2995692, 2.140217, 1, 0, 0, 1, 1,
0.5061367, -0.4737354, 2.470087, 1, 0, 0, 1, 1,
0.5075338, 0.2898307, 0.2728846, 1, 0, 0, 1, 1,
0.5125385, -0.9100447, 2.553168, 1, 0, 0, 1, 1,
0.5214785, 1.184362, -0.4908051, 1, 0, 0, 1, 1,
0.5272589, 0.7309882, -0.273832, 0, 0, 0, 1, 1,
0.5298637, 0.1194825, 2.954232, 0, 0, 0, 1, 1,
0.5323068, -1.341784, 1.6137, 0, 0, 0, 1, 1,
0.5325415, 1.555775, 0.3740237, 0, 0, 0, 1, 1,
0.5413948, 1.169364, 0.03746744, 0, 0, 0, 1, 1,
0.5453079, -0.3677091, 4.021492, 0, 0, 0, 1, 1,
0.5468521, 0.3649364, 2.311995, 0, 0, 0, 1, 1,
0.5508665, -0.4830629, 2.905781, 1, 1, 1, 1, 1,
0.5515018, -1.72554, 3.552646, 1, 1, 1, 1, 1,
0.5529974, 0.4893369, 3.832285, 1, 1, 1, 1, 1,
0.5570093, -0.3316383, 2.150804, 1, 1, 1, 1, 1,
0.5591603, -0.1266462, 1.576839, 1, 1, 1, 1, 1,
0.5653751, -0.04326651, 2.835772, 1, 1, 1, 1, 1,
0.5667149, -1.050102, 1.203972, 1, 1, 1, 1, 1,
0.5745276, -0.02468417, -0.1181848, 1, 1, 1, 1, 1,
0.5750488, -0.8665482, 2.809256, 1, 1, 1, 1, 1,
0.57546, -2.518761, 3.263893, 1, 1, 1, 1, 1,
0.5755682, 1.085711, 0.9240273, 1, 1, 1, 1, 1,
0.5759559, 0.775745, 0.4084679, 1, 1, 1, 1, 1,
0.5843296, -1.031044, 0.419447, 1, 1, 1, 1, 1,
0.5856613, 0.2122556, 1.119311, 1, 1, 1, 1, 1,
0.5895, -0.4627875, 2.706448, 1, 1, 1, 1, 1,
0.5976095, -0.9789059, 5.198234, 0, 0, 1, 1, 1,
0.5990575, 0.06597032, 0.3027041, 1, 0, 0, 1, 1,
0.6025867, -1.425332, 2.342845, 1, 0, 0, 1, 1,
0.6026846, 1.679135, -0.397846, 1, 0, 0, 1, 1,
0.6039927, -0.9578389, 3.564648, 1, 0, 0, 1, 1,
0.6043518, 0.8122076, 1.416417, 1, 0, 0, 1, 1,
0.6080639, 1.730631, -1.07407, 0, 0, 0, 1, 1,
0.6108463, 1.000596, -0.7126508, 0, 0, 0, 1, 1,
0.6121432, -1.11037, 1.800564, 0, 0, 0, 1, 1,
0.6122174, 1.128286, -0.128515, 0, 0, 0, 1, 1,
0.6142009, -0.5565968, 3.056183, 0, 0, 0, 1, 1,
0.6191252, 2.28978, 1.114257, 0, 0, 0, 1, 1,
0.6198912, -0.3937818, 1.147403, 0, 0, 0, 1, 1,
0.6215535, 0.1746046, 1.808163, 1, 1, 1, 1, 1,
0.6253362, 0.9064507, 0.1662788, 1, 1, 1, 1, 1,
0.6306872, -4.031356, 3.691716, 1, 1, 1, 1, 1,
0.644036, -0.6146373, 3.475395, 1, 1, 1, 1, 1,
0.6513513, 0.2622684, -0.9355125, 1, 1, 1, 1, 1,
0.6517015, -0.3285512, 3.789787, 1, 1, 1, 1, 1,
0.6541986, 1.160296, -0.5379299, 1, 1, 1, 1, 1,
0.6651813, -1.00087, 2.863218, 1, 1, 1, 1, 1,
0.6662093, 1.070087, -0.9456294, 1, 1, 1, 1, 1,
0.6766749, -0.2189755, 2.626158, 1, 1, 1, 1, 1,
0.680276, 2.399535, -0.1274923, 1, 1, 1, 1, 1,
0.6804085, 0.8968629, 0.641089, 1, 1, 1, 1, 1,
0.6815395, 1.752278, 0.4970774, 1, 1, 1, 1, 1,
0.682582, -0.06187345, 1.587015, 1, 1, 1, 1, 1,
0.6833401, 0.1462669, 0.352735, 1, 1, 1, 1, 1,
0.6840079, -0.2700592, 1.824136, 0, 0, 1, 1, 1,
0.6855957, 1.527675, 1.031932, 1, 0, 0, 1, 1,
0.6863156, 1.288557, 0.7437919, 1, 0, 0, 1, 1,
0.6887726, 1.265453, 0.775435, 1, 0, 0, 1, 1,
0.6909326, 1.32209, -0.5972513, 1, 0, 0, 1, 1,
0.6946774, -1.219222, 3.368356, 1, 0, 0, 1, 1,
0.7001024, 0.6831207, 0.7820901, 0, 0, 0, 1, 1,
0.7012132, 0.5889362, 1.724484, 0, 0, 0, 1, 1,
0.7070875, 0.2221683, 1.577306, 0, 0, 0, 1, 1,
0.7157571, -0.3065998, 2.323081, 0, 0, 0, 1, 1,
0.7166531, 0.9699797, -0.2047722, 0, 0, 0, 1, 1,
0.7176349, 0.3801832, 1.417031, 0, 0, 0, 1, 1,
0.7196549, 0.6889569, 3.07131, 0, 0, 0, 1, 1,
0.7198526, 0.915668, 1.820458, 1, 1, 1, 1, 1,
0.7335123, 0.02764534, 2.220885, 1, 1, 1, 1, 1,
0.7341629, -0.660285, 1.455063, 1, 1, 1, 1, 1,
0.7399405, 1.894052, 1.560063, 1, 1, 1, 1, 1,
0.7423388, -0.1540876, 1.262501, 1, 1, 1, 1, 1,
0.7425895, 0.5488665, 1.328479, 1, 1, 1, 1, 1,
0.7436687, 0.81301, 0.9370768, 1, 1, 1, 1, 1,
0.7437179, -1.060607, 3.891602, 1, 1, 1, 1, 1,
0.7442076, -0.2212625, 0.5135877, 1, 1, 1, 1, 1,
0.7526155, -0.7420014, 2.381641, 1, 1, 1, 1, 1,
0.759489, 0.7831872, 1.760499, 1, 1, 1, 1, 1,
0.7670319, -0.1998645, 2.504908, 1, 1, 1, 1, 1,
0.7755, -1.481462, 4.10792, 1, 1, 1, 1, 1,
0.7759452, 1.689553, 0.4535364, 1, 1, 1, 1, 1,
0.7772167, -2.094568, 2.947437, 1, 1, 1, 1, 1,
0.7791402, 0.4109854, 2.687738, 0, 0, 1, 1, 1,
0.7817161, 0.1782766, 2.095236, 1, 0, 0, 1, 1,
0.783484, -0.2759748, 2.840808, 1, 0, 0, 1, 1,
0.7941185, 0.9503847, 0.4008497, 1, 0, 0, 1, 1,
0.7943747, 0.608191, -1.617404, 1, 0, 0, 1, 1,
0.7964415, -0.8869163, 1.780546, 1, 0, 0, 1, 1,
0.8018919, 0.4178826, -0.6197656, 0, 0, 0, 1, 1,
0.8047726, 0.3023439, 0.9750507, 0, 0, 0, 1, 1,
0.8052977, -0.7123096, 2.22023, 0, 0, 0, 1, 1,
0.8056473, 1.010633, -0.3575031, 0, 0, 0, 1, 1,
0.80967, -0.7858747, 4.291246, 0, 0, 0, 1, 1,
0.8113139, 0.4594719, -0.4600031, 0, 0, 0, 1, 1,
0.8133545, -0.1252573, 3.351944, 0, 0, 0, 1, 1,
0.8141279, 1.116645, 2.280905, 1, 1, 1, 1, 1,
0.828388, 1.724729, -0.2816323, 1, 1, 1, 1, 1,
0.8286216, -1.228393, 1.624901, 1, 1, 1, 1, 1,
0.8311431, 1.900776, -0.664547, 1, 1, 1, 1, 1,
0.8332199, 0.8494791, 1.820982, 1, 1, 1, 1, 1,
0.8360298, 2.673978, -0.9534372, 1, 1, 1, 1, 1,
0.8373337, 0.5010936, 0.9554756, 1, 1, 1, 1, 1,
0.8399331, -0.04310365, 0.5209017, 1, 1, 1, 1, 1,
0.8498939, 0.2214085, 1.543411, 1, 1, 1, 1, 1,
0.8572654, 0.02496096, 3.190188, 1, 1, 1, 1, 1,
0.857515, -2.223221, 3.643763, 1, 1, 1, 1, 1,
0.8688626, 0.1604842, 0.9566332, 1, 1, 1, 1, 1,
0.870656, -0.9899485, 3.04161, 1, 1, 1, 1, 1,
0.8718225, -1.548006, 2.36638, 1, 1, 1, 1, 1,
0.8839685, 1.482188, 1.06156, 1, 1, 1, 1, 1,
0.8842705, -2.539091, 3.688441, 0, 0, 1, 1, 1,
0.8873363, -0.8380085, 2.377874, 1, 0, 0, 1, 1,
0.8883703, -1.577947, 4.139723, 1, 0, 0, 1, 1,
0.8965205, -0.5377051, 2.569087, 1, 0, 0, 1, 1,
0.8983193, -0.2062515, 2.148025, 1, 0, 0, 1, 1,
0.8992909, 0.2554284, 2.095111, 1, 0, 0, 1, 1,
0.9013098, 0.41895, 1.024899, 0, 0, 0, 1, 1,
0.9165086, -0.3568256, 1.606141, 0, 0, 0, 1, 1,
0.9199303, 0.3104471, 0.8521563, 0, 0, 0, 1, 1,
0.9199664, -0.1360135, 1.489789, 0, 0, 0, 1, 1,
0.9207607, 0.6137634, -0.125163, 0, 0, 0, 1, 1,
0.9215723, -0.7634372, 1.799399, 0, 0, 0, 1, 1,
0.9232085, 0.4149283, 1.231092, 0, 0, 0, 1, 1,
0.925794, -0.4844882, 3.631448, 1, 1, 1, 1, 1,
0.9309117, -0.05555246, 1.86623, 1, 1, 1, 1, 1,
0.9361999, 1.439446, -1.380114, 1, 1, 1, 1, 1,
0.9420478, -0.3771884, 1.110617, 1, 1, 1, 1, 1,
0.953979, 1.91502, -0.5212717, 1, 1, 1, 1, 1,
0.9547396, 0.6892363, 2.756229, 1, 1, 1, 1, 1,
0.9562137, -0.808588, 2.304408, 1, 1, 1, 1, 1,
0.9638099, -0.3011583, 1.441948, 1, 1, 1, 1, 1,
0.9721694, -1.799793, 3.858092, 1, 1, 1, 1, 1,
0.9731112, 1.222146, 1.969757, 1, 1, 1, 1, 1,
0.9851109, -0.5425699, 2.026474, 1, 1, 1, 1, 1,
0.9925054, -0.4150804, 2.965595, 1, 1, 1, 1, 1,
0.9947917, -2.132078, 2.546438, 1, 1, 1, 1, 1,
1.006175, 0.5322595, 0.1798257, 1, 1, 1, 1, 1,
1.009733, -0.548151, 1.762133, 1, 1, 1, 1, 1,
1.015591, -1.303435, 1.26786, 0, 0, 1, 1, 1,
1.017022, -2.653443, 2.113282, 1, 0, 0, 1, 1,
1.018708, 0.7653259, 0.4329752, 1, 0, 0, 1, 1,
1.024535, 0.5274523, 1.637355, 1, 0, 0, 1, 1,
1.037823, -0.886028, 2.118769, 1, 0, 0, 1, 1,
1.041348, 0.8884276, -1.67723, 1, 0, 0, 1, 1,
1.044723, -1.602898, 1.241262, 0, 0, 0, 1, 1,
1.04763, -1.650058, 2.136999, 0, 0, 0, 1, 1,
1.054467, 0.3818099, 2.003393, 0, 0, 0, 1, 1,
1.058029, -0.1432719, 1.528722, 0, 0, 0, 1, 1,
1.058344, -0.8094617, 1.363274, 0, 0, 0, 1, 1,
1.071844, 0.7052568, 1.553872, 0, 0, 0, 1, 1,
1.075907, 3.268211, 0.7950286, 0, 0, 0, 1, 1,
1.091121, -0.3484385, 0.4238442, 1, 1, 1, 1, 1,
1.101363, 2.338477, 1.403135, 1, 1, 1, 1, 1,
1.105759, 0.08281531, 1.181358, 1, 1, 1, 1, 1,
1.108199, 0.2249245, 1.236423, 1, 1, 1, 1, 1,
1.111551, 1.966945, 1.284517, 1, 1, 1, 1, 1,
1.112355, -1.217231, 2.189364, 1, 1, 1, 1, 1,
1.122302, -0.9358732, 2.909824, 1, 1, 1, 1, 1,
1.123247, -0.2996273, 1.022775, 1, 1, 1, 1, 1,
1.124671, -0.8043314, 1.417057, 1, 1, 1, 1, 1,
1.125458, 0.7710123, 2.21491, 1, 1, 1, 1, 1,
1.128117, -0.1865053, 2.208126, 1, 1, 1, 1, 1,
1.137808, -1.898431, 2.842134, 1, 1, 1, 1, 1,
1.153616, -0.5894076, 3.41197, 1, 1, 1, 1, 1,
1.160924, -0.5223713, 1.701247, 1, 1, 1, 1, 1,
1.162888, 0.8420307, 0.2989267, 1, 1, 1, 1, 1,
1.174239, 1.314143, 0.4210913, 0, 0, 1, 1, 1,
1.176125, -1.297878, 2.895633, 1, 0, 0, 1, 1,
1.178666, -0.07375743, 0.5893371, 1, 0, 0, 1, 1,
1.179856, -0.2300383, 2.132573, 1, 0, 0, 1, 1,
1.189828, -0.2989781, 0.8372942, 1, 0, 0, 1, 1,
1.191385, -0.6633721, 1.887469, 1, 0, 0, 1, 1,
1.191864, -0.9313952, -0.004325092, 0, 0, 0, 1, 1,
1.193025, 1.159579, 1.022804, 0, 0, 0, 1, 1,
1.193625, -0.9701046, 2.422379, 0, 0, 0, 1, 1,
1.20162, -0.3666692, 2.500043, 0, 0, 0, 1, 1,
1.20477, 0.8701828, 0.6475741, 0, 0, 0, 1, 1,
1.206768, -0.1727143, 2.350226, 0, 0, 0, 1, 1,
1.208286, -1.499547, 3.115163, 0, 0, 0, 1, 1,
1.210095, -0.7391678, 2.57002, 1, 1, 1, 1, 1,
1.217652, -0.3084773, 2.429514, 1, 1, 1, 1, 1,
1.224497, 0.006659453, 0.9962283, 1, 1, 1, 1, 1,
1.225263, -0.5821564, 3.429371, 1, 1, 1, 1, 1,
1.233209, -0.494439, 1.225125, 1, 1, 1, 1, 1,
1.234471, 0.1810266, 0.5026135, 1, 1, 1, 1, 1,
1.240654, 1.227943, 0.4893189, 1, 1, 1, 1, 1,
1.24308, -0.5574368, -0.1162512, 1, 1, 1, 1, 1,
1.247382, -1.716558, 2.550038, 1, 1, 1, 1, 1,
1.25747, -1.750486, 3.411723, 1, 1, 1, 1, 1,
1.280921, -0.2333418, 2.680367, 1, 1, 1, 1, 1,
1.288244, -0.3936933, 1.21115, 1, 1, 1, 1, 1,
1.288289, -2.037917, 3.841117, 1, 1, 1, 1, 1,
1.290037, -0.03089328, 1.721423, 1, 1, 1, 1, 1,
1.295839, -0.1758167, 2.018404, 1, 1, 1, 1, 1,
1.304793, 0.7862375, -0.2364122, 0, 0, 1, 1, 1,
1.30841, 0.204434, 0.02405484, 1, 0, 0, 1, 1,
1.32885, -1.334725, 0.5857466, 1, 0, 0, 1, 1,
1.331017, 1.261311, 2.003408, 1, 0, 0, 1, 1,
1.335481, 0.5921779, 0.9608091, 1, 0, 0, 1, 1,
1.339909, -0.5057433, 2.476485, 1, 0, 0, 1, 1,
1.346468, 1.357113, 0.7747806, 0, 0, 0, 1, 1,
1.355972, 2.223082, 0.8255757, 0, 0, 0, 1, 1,
1.366176, -1.339941, 2.528644, 0, 0, 0, 1, 1,
1.369547, -1.968881, 2.869625, 0, 0, 0, 1, 1,
1.406498, -2.004276, 3.10871, 0, 0, 0, 1, 1,
1.412237, 0.5224701, 1.363419, 0, 0, 0, 1, 1,
1.4124, -0.8003122, 3.86569, 0, 0, 0, 1, 1,
1.414366, -1.764328, 1.837633, 1, 1, 1, 1, 1,
1.416342, -0.165565, 1.754801, 1, 1, 1, 1, 1,
1.425766, -0.1126366, 2.633191, 1, 1, 1, 1, 1,
1.427015, 0.7178448, 2.426651, 1, 1, 1, 1, 1,
1.430819, 0.1230815, 1.272009, 1, 1, 1, 1, 1,
1.437179, 0.8990539, 0.4221405, 1, 1, 1, 1, 1,
1.443693, -0.8600948, 1.779475, 1, 1, 1, 1, 1,
1.444938, 0.203516, 0.09434157, 1, 1, 1, 1, 1,
1.451083, -0.1482267, 1.550885, 1, 1, 1, 1, 1,
1.452923, 0.279388, 1.154187, 1, 1, 1, 1, 1,
1.459999, 0.4897038, 0.7686679, 1, 1, 1, 1, 1,
1.461042, -0.6325318, 2.797825, 1, 1, 1, 1, 1,
1.475233, -0.6907197, 1.181751, 1, 1, 1, 1, 1,
1.479381, 0.9455355, 1.462638, 1, 1, 1, 1, 1,
1.49163, -0.4965769, 2.717516, 1, 1, 1, 1, 1,
1.4961, -0.7759562, 2.140467, 0, 0, 1, 1, 1,
1.496293, -0.1288079, 1.050621, 1, 0, 0, 1, 1,
1.4963, -0.528478, 2.281884, 1, 0, 0, 1, 1,
1.498289, 0.7587999, 0.4165376, 1, 0, 0, 1, 1,
1.507832, -0.9387902, 2.120225, 1, 0, 0, 1, 1,
1.510038, -0.663759, 1.330223, 1, 0, 0, 1, 1,
1.513679, -1.378051, 1.184247, 0, 0, 0, 1, 1,
1.525725, -0.5734841, 0.5291797, 0, 0, 0, 1, 1,
1.530327, -0.003964652, 0.3986896, 0, 0, 0, 1, 1,
1.536099, -0.7288084, 1.515058, 0, 0, 0, 1, 1,
1.545165, 1.262057, 0.4850099, 0, 0, 0, 1, 1,
1.551132, 0.3352681, 0.1561064, 0, 0, 0, 1, 1,
1.551633, -1.849128, 0.8966252, 0, 0, 0, 1, 1,
1.563663, 1.123713, 1.420067, 1, 1, 1, 1, 1,
1.573126, -0.9788738, 2.052413, 1, 1, 1, 1, 1,
1.584611, -0.4698956, 1.393718, 1, 1, 1, 1, 1,
1.596457, 0.04018197, 1.88312, 1, 1, 1, 1, 1,
1.598871, -1.585033, 3.155574, 1, 1, 1, 1, 1,
1.599051, -0.9688869, 2.954087, 1, 1, 1, 1, 1,
1.610463, -1.871283, 3.020404, 1, 1, 1, 1, 1,
1.613684, -0.3184079, 3.743995, 1, 1, 1, 1, 1,
1.613752, 0.6794679, 0.9407082, 1, 1, 1, 1, 1,
1.624611, -0.6834691, 3.181302, 1, 1, 1, 1, 1,
1.639355, 1.166711, 2.608262, 1, 1, 1, 1, 1,
1.642163, 0.1094927, 1.360491, 1, 1, 1, 1, 1,
1.644935, 0.7369134, 0.7215165, 1, 1, 1, 1, 1,
1.646255, 1.270715, 1.15282, 1, 1, 1, 1, 1,
1.649459, 0.9127777, 1.475374, 1, 1, 1, 1, 1,
1.654819, 0.1133526, 0.5213768, 0, 0, 1, 1, 1,
1.680237, 0.3170214, 1.21028, 1, 0, 0, 1, 1,
1.682685, -0.3044522, 0.2971713, 1, 0, 0, 1, 1,
1.697913, 0.6978436, 0.6532104, 1, 0, 0, 1, 1,
1.714815, 0.9267036, -0.02440969, 1, 0, 0, 1, 1,
1.718662, -0.07484211, 2.788336, 1, 0, 0, 1, 1,
1.759468, -2.101816, 3.693513, 0, 0, 0, 1, 1,
1.768809, 0.6676775, 1.639029, 0, 0, 0, 1, 1,
1.770063, 0.3432288, 1.648199, 0, 0, 0, 1, 1,
1.783681, 0.9733678, 0.4628362, 0, 0, 0, 1, 1,
1.798991, 0.1978648, -0.4521371, 0, 0, 0, 1, 1,
1.800884, -1.032557, 3.485155, 0, 0, 0, 1, 1,
1.811883, 0.4458959, 2.168167, 0, 0, 0, 1, 1,
1.812616, 0.3766804, 0.5363072, 1, 1, 1, 1, 1,
1.815192, 1.053839, 0.9747641, 1, 1, 1, 1, 1,
1.822308, -0.5987605, 1.484717, 1, 1, 1, 1, 1,
1.825931, -1.147681, 1.877256, 1, 1, 1, 1, 1,
1.85495, -0.3278403, 1.021583, 1, 1, 1, 1, 1,
1.860687, -0.4911917, 3.749538, 1, 1, 1, 1, 1,
1.874852, -1.0601, 1.971056, 1, 1, 1, 1, 1,
1.900686, -0.2978225, -2.252653, 1, 1, 1, 1, 1,
1.911496, 0.6228491, 3.109283, 1, 1, 1, 1, 1,
1.914411, 0.9656758, 0.7482454, 1, 1, 1, 1, 1,
1.914973, 1.225038, 1.083868, 1, 1, 1, 1, 1,
1.943973, 0.5893745, 1.640991, 1, 1, 1, 1, 1,
1.960373, -0.6403643, 1.352177, 1, 1, 1, 1, 1,
1.998378, 0.1146243, 2.027043, 1, 1, 1, 1, 1,
2.000809, 1.093111, 0.1098688, 1, 1, 1, 1, 1,
2.006112, 2.164712, 0.3960475, 0, 0, 1, 1, 1,
2.017227, -1.406592, 3.068301, 1, 0, 0, 1, 1,
2.031225, 0.6727666, 2.36964, 1, 0, 0, 1, 1,
2.033648, -0.3155386, 1.253805, 1, 0, 0, 1, 1,
2.038085, -1.799127, 3.354586, 1, 0, 0, 1, 1,
2.047572, 1.463033, 0.5001697, 1, 0, 0, 1, 1,
2.073121, -1.29282, 1.513844, 0, 0, 0, 1, 1,
2.139265, 0.9715228, -0.7642701, 0, 0, 0, 1, 1,
2.196001, 0.83595, 0.4064777, 0, 0, 0, 1, 1,
2.198409, -1.850289, 3.26237, 0, 0, 0, 1, 1,
2.203947, 0.641948, 1.227065, 0, 0, 0, 1, 1,
2.214902, 0.3706783, 2.531692, 0, 0, 0, 1, 1,
2.274171, -0.3581495, 1.104592, 0, 0, 0, 1, 1,
2.292025, 0.912845, 1.912413, 1, 1, 1, 1, 1,
2.320896, -1.458464, 1.230722, 1, 1, 1, 1, 1,
2.37875, -0.1580008, 2.745021, 1, 1, 1, 1, 1,
2.413237, -0.7317159, 3.608931, 1, 1, 1, 1, 1,
2.429122, -0.1760161, 1.381746, 1, 1, 1, 1, 1,
2.819184, -0.3383637, 2.250269, 1, 1, 1, 1, 1,
2.828936, -0.1853076, 0.3646063, 1, 1, 1, 1, 1
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
var radius = 10.13955;
var distance = 35.61475;
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
mvMatrix.translate( 0.4948099, 0.2220943, -0.03324533 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.61475);
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
