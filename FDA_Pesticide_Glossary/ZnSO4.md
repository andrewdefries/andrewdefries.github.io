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
-2.963545, -0.1889948, -2.249067, 1, 0, 0, 1,
-2.784065, -1.303537, -2.13094, 1, 0.007843138, 0, 1,
-2.527676, -0.4123309, -2.193554, 1, 0.01176471, 0, 1,
-2.489836, -0.3260862, -2.412267, 1, 0.01960784, 0, 1,
-2.429628, 0.4450665, -1.074412, 1, 0.02352941, 0, 1,
-2.393047, -1.572405, -2.353456, 1, 0.03137255, 0, 1,
-2.29886, 0.3867446, -1.792131, 1, 0.03529412, 0, 1,
-2.294084, -0.3821906, -1.345604, 1, 0.04313726, 0, 1,
-2.232034, 0.09165963, -2.175623, 1, 0.04705882, 0, 1,
-2.14503, 0.7858116, -2.325756, 1, 0.05490196, 0, 1,
-2.138833, 0.5619394, -1.472372, 1, 0.05882353, 0, 1,
-2.124595, -0.4460439, -0.7783748, 1, 0.06666667, 0, 1,
-2.047748, -1.090305, -2.49828, 1, 0.07058824, 0, 1,
-2.039439, 1.066945, -2.019855, 1, 0.07843138, 0, 1,
-2.032367, 0.1255876, -0.6278304, 1, 0.08235294, 0, 1,
-2.012711, -0.4313837, -2.710358, 1, 0.09019608, 0, 1,
-2.004509, -0.4618258, -1.361445, 1, 0.09411765, 0, 1,
-1.98337, 0.665714, -1.26815, 1, 0.1019608, 0, 1,
-1.978658, -0.2117972, -2.129191, 1, 0.1098039, 0, 1,
-1.977436, 0.1634067, -1.893608, 1, 0.1137255, 0, 1,
-1.958745, 0.6786631, -0.550563, 1, 0.1215686, 0, 1,
-1.957822, -0.8055202, -0.4865284, 1, 0.1254902, 0, 1,
-1.95362, -0.1970787, -0.1594199, 1, 0.1333333, 0, 1,
-1.939042, -1.202041, -2.849844, 1, 0.1372549, 0, 1,
-1.933465, -0.4219843, -1.281134, 1, 0.145098, 0, 1,
-1.916031, 1.171796, -0.911319, 1, 0.1490196, 0, 1,
-1.900604, 0.3391017, -2.403696, 1, 0.1568628, 0, 1,
-1.854595, 2.153882, -1.133941, 1, 0.1607843, 0, 1,
-1.849018, 0.7930121, 0.04696197, 1, 0.1686275, 0, 1,
-1.824326, -0.6755097, -1.097342, 1, 0.172549, 0, 1,
-1.818593, -0.7839453, -2.364048, 1, 0.1803922, 0, 1,
-1.802275, -0.8870567, -2.499144, 1, 0.1843137, 0, 1,
-1.7852, -1.23646, -2.268818, 1, 0.1921569, 0, 1,
-1.783155, 1.056651, -0.9676507, 1, 0.1960784, 0, 1,
-1.770778, -2.846237, -4.093231, 1, 0.2039216, 0, 1,
-1.753891, 0.4678622, -1.950113, 1, 0.2117647, 0, 1,
-1.751709, 2.172303, -1.118809, 1, 0.2156863, 0, 1,
-1.68855, 0.2536643, -1.132306, 1, 0.2235294, 0, 1,
-1.688254, -0.4975813, -2.145762, 1, 0.227451, 0, 1,
-1.683028, -1.176037, -3.245456, 1, 0.2352941, 0, 1,
-1.674265, -1.203364, -1.299653, 1, 0.2392157, 0, 1,
-1.664079, 0.8153026, -0.6243926, 1, 0.2470588, 0, 1,
-1.661271, -0.04125652, -2.727271, 1, 0.2509804, 0, 1,
-1.647081, 1.060387, -1.815338, 1, 0.2588235, 0, 1,
-1.626022, -0.5111852, -3.241875, 1, 0.2627451, 0, 1,
-1.603933, 1.862143, 0.07818112, 1, 0.2705882, 0, 1,
-1.594048, -1.660574, -3.925566, 1, 0.2745098, 0, 1,
-1.570838, 0.1411495, -0.7241969, 1, 0.282353, 0, 1,
-1.564639, -0.06706686, -1.676394, 1, 0.2862745, 0, 1,
-1.530712, 0.6742187, 0.5442873, 1, 0.2941177, 0, 1,
-1.529833, -0.7421346, -1.283495, 1, 0.3019608, 0, 1,
-1.521649, -1.286137, -2.474642, 1, 0.3058824, 0, 1,
-1.517298, -0.2015927, -0.02413327, 1, 0.3137255, 0, 1,
-1.517147, -0.2200864, -0.7920763, 1, 0.3176471, 0, 1,
-1.511361, 1.577849, -1.401584, 1, 0.3254902, 0, 1,
-1.508121, -0.7521742, -1.963197, 1, 0.3294118, 0, 1,
-1.5064, 0.0596494, -0.6735921, 1, 0.3372549, 0, 1,
-1.503535, -0.01248941, 0.2656192, 1, 0.3411765, 0, 1,
-1.49914, -1.985874, -2.450264, 1, 0.3490196, 0, 1,
-1.471039, 1.637584, -0.5215688, 1, 0.3529412, 0, 1,
-1.464693, 0.9691052, -0.6300893, 1, 0.3607843, 0, 1,
-1.46449, -1.047009, -3.578955, 1, 0.3647059, 0, 1,
-1.458767, -0.3985351, -3.018396, 1, 0.372549, 0, 1,
-1.456889, 1.538938, -2.416925, 1, 0.3764706, 0, 1,
-1.45312, -0.2664708, -0.3190263, 1, 0.3843137, 0, 1,
-1.450385, -0.04899914, -2.947354, 1, 0.3882353, 0, 1,
-1.44972, 0.5007973, -0.9742676, 1, 0.3960784, 0, 1,
-1.41877, 1.470449, -1.144002, 1, 0.4039216, 0, 1,
-1.401051, 1.875388, -1.615718, 1, 0.4078431, 0, 1,
-1.397845, -0.3110408, -1.701706, 1, 0.4156863, 0, 1,
-1.396388, 0.8140265, -1.556798, 1, 0.4196078, 0, 1,
-1.396018, -0.3491411, -3.046025, 1, 0.427451, 0, 1,
-1.39454, -1.350857, -4.556264, 1, 0.4313726, 0, 1,
-1.37267, 0.3721938, -2.904155, 1, 0.4392157, 0, 1,
-1.369289, -0.1189695, -2.108765, 1, 0.4431373, 0, 1,
-1.366377, 0.04013265, -0.9020602, 1, 0.4509804, 0, 1,
-1.363114, 1.46648, -3.220436, 1, 0.454902, 0, 1,
-1.363073, -0.277952, -2.879619, 1, 0.4627451, 0, 1,
-1.354753, 0.1368602, -0.9042594, 1, 0.4666667, 0, 1,
-1.35311, -1.56957, -2.018731, 1, 0.4745098, 0, 1,
-1.348605, 0.3076511, 0.2283026, 1, 0.4784314, 0, 1,
-1.336502, -1.856587, -2.015687, 1, 0.4862745, 0, 1,
-1.332857, -1.214401, -3.042298, 1, 0.4901961, 0, 1,
-1.313366, 1.274698, -2.488666, 1, 0.4980392, 0, 1,
-1.310706, -1.238157, -2.286378, 1, 0.5058824, 0, 1,
-1.304863, 1.359894, -0.07327075, 1, 0.509804, 0, 1,
-1.299508, -0.3924209, -3.311214, 1, 0.5176471, 0, 1,
-1.297066, 0.6163096, -0.3056359, 1, 0.5215687, 0, 1,
-1.296845, 0.1661275, -2.29397, 1, 0.5294118, 0, 1,
-1.295041, -1.70841, -3.537602, 1, 0.5333334, 0, 1,
-1.291042, 0.4539623, -2.90428, 1, 0.5411765, 0, 1,
-1.282757, -0.02546757, -0.4127984, 1, 0.5450981, 0, 1,
-1.279446, 0.8813164, -0.9718958, 1, 0.5529412, 0, 1,
-1.271366, 0.7985488, -4.060551, 1, 0.5568628, 0, 1,
-1.266805, 0.1365286, -0.923458, 1, 0.5647059, 0, 1,
-1.254583, -0.3566915, -1.290672, 1, 0.5686275, 0, 1,
-1.251531, -1.04852, -0.1585381, 1, 0.5764706, 0, 1,
-1.239515, -0.3365585, -0.9993237, 1, 0.5803922, 0, 1,
-1.239432, -1.423275, -2.230765, 1, 0.5882353, 0, 1,
-1.237472, 0.6928257, 0.2085494, 1, 0.5921569, 0, 1,
-1.231843, -1.21802, -2.320899, 1, 0.6, 0, 1,
-1.226934, -0.6258619, -3.171812, 1, 0.6078432, 0, 1,
-1.226376, -0.8002101, -2.555884, 1, 0.6117647, 0, 1,
-1.219735, -0.4406878, -1.869215, 1, 0.6196079, 0, 1,
-1.219427, 1.268231, -1.059612, 1, 0.6235294, 0, 1,
-1.217878, -0.01608507, -1.038465, 1, 0.6313726, 0, 1,
-1.215286, 1.425028, 0.09920442, 1, 0.6352941, 0, 1,
-1.20768, 0.4521005, -0.291727, 1, 0.6431373, 0, 1,
-1.206638, -1.512657, -2.300254, 1, 0.6470588, 0, 1,
-1.187599, 0.7877918, 0.7853203, 1, 0.654902, 0, 1,
-1.178084, 0.6610867, -0.5279893, 1, 0.6588235, 0, 1,
-1.175506, 0.3696884, 0.1620895, 1, 0.6666667, 0, 1,
-1.175382, -1.040161, -4.075497, 1, 0.6705883, 0, 1,
-1.17399, -0.1633514, -3.684937, 1, 0.6784314, 0, 1,
-1.171727, -0.9239342, -2.095553, 1, 0.682353, 0, 1,
-1.167307, 0.9873058, -1.659398, 1, 0.6901961, 0, 1,
-1.161227, -1.015188, -3.795207, 1, 0.6941177, 0, 1,
-1.156302, -0.7104223, -3.951443, 1, 0.7019608, 0, 1,
-1.148406, -0.5667627, -2.011239, 1, 0.7098039, 0, 1,
-1.148325, -0.6535757, -2.050335, 1, 0.7137255, 0, 1,
-1.133178, 0.7516828, -1.789068, 1, 0.7215686, 0, 1,
-1.129578, 1.077712, -1.282282, 1, 0.7254902, 0, 1,
-1.127918, 0.1335951, -1.072436, 1, 0.7333333, 0, 1,
-1.120098, 0.4563617, 0.2280931, 1, 0.7372549, 0, 1,
-1.111732, 1.751316, -0.9009395, 1, 0.7450981, 0, 1,
-1.096109, -0.01114504, -1.499128, 1, 0.7490196, 0, 1,
-1.091372, -0.1457103, -0.08283332, 1, 0.7568628, 0, 1,
-1.087412, -2.312356, -1.782784, 1, 0.7607843, 0, 1,
-1.086064, -0.2120353, -3.501534, 1, 0.7686275, 0, 1,
-1.082983, 0.9764766, 0.1413161, 1, 0.772549, 0, 1,
-1.078525, 0.03395416, -0.3580322, 1, 0.7803922, 0, 1,
-1.077566, -0.9970125, -2.519257, 1, 0.7843137, 0, 1,
-1.076855, 1.71385, -0.01664057, 1, 0.7921569, 0, 1,
-1.070575, 0.471461, -0.005289761, 1, 0.7960784, 0, 1,
-1.070114, -1.743636, -2.747685, 1, 0.8039216, 0, 1,
-1.065552, 0.1710113, -1.104981, 1, 0.8117647, 0, 1,
-1.060823, 1.166823, -0.2928497, 1, 0.8156863, 0, 1,
-1.058783, 1.406456, -0.9278694, 1, 0.8235294, 0, 1,
-1.051268, 1.419032, 0.705824, 1, 0.827451, 0, 1,
-1.048596, 0.3179462, -2.573325, 1, 0.8352941, 0, 1,
-1.041132, -0.4337535, 0.05409673, 1, 0.8392157, 0, 1,
-1.040354, 1.37108, -0.7322539, 1, 0.8470588, 0, 1,
-1.032983, -0.3858584, -2.716683, 1, 0.8509804, 0, 1,
-1.026359, -0.3404419, -3.184582, 1, 0.8588235, 0, 1,
-1.023109, -0.2420315, -1.018968, 1, 0.8627451, 0, 1,
-1.022298, 1.202667, 1.000923, 1, 0.8705882, 0, 1,
-1.020941, 1.313571, 0.02238421, 1, 0.8745098, 0, 1,
-1.02077, 0.5991154, -1.930361, 1, 0.8823529, 0, 1,
-1.018421, -0.3943104, -2.858268, 1, 0.8862745, 0, 1,
-1.014551, 0.3631095, -1.761888, 1, 0.8941177, 0, 1,
-1.014084, -0.5657443, -1.792068, 1, 0.8980392, 0, 1,
-0.9994825, 0.2061215, -1.788328, 1, 0.9058824, 0, 1,
-0.9994516, 1.245373, -1.357008, 1, 0.9137255, 0, 1,
-0.9948328, 0.6982347, -1.693156, 1, 0.9176471, 0, 1,
-0.9915267, -0.208239, -1.423305, 1, 0.9254902, 0, 1,
-0.9846476, -0.3899943, -1.476517, 1, 0.9294118, 0, 1,
-0.9808651, 1.685317, -0.3819596, 1, 0.9372549, 0, 1,
-0.9801692, -0.8284079, -1.983873, 1, 0.9411765, 0, 1,
-0.978246, -0.2043415, -1.65743, 1, 0.9490196, 0, 1,
-0.9616569, -0.1561504, -0.7854983, 1, 0.9529412, 0, 1,
-0.9593349, -1.76537, -2.577834, 1, 0.9607843, 0, 1,
-0.9584269, 1.925223, 0.9879372, 1, 0.9647059, 0, 1,
-0.958075, -2.10353, -2.160256, 1, 0.972549, 0, 1,
-0.9526848, -0.597308, -0.7492869, 1, 0.9764706, 0, 1,
-0.9469281, -1.472657, -1.945931, 1, 0.9843137, 0, 1,
-0.9466837, -0.1010426, -1.528923, 1, 0.9882353, 0, 1,
-0.9377972, -1.078431, -3.919322, 1, 0.9960784, 0, 1,
-0.9348312, 1.385973, -0.9081603, 0.9960784, 1, 0, 1,
-0.925124, 0.2023711, -1.182574, 0.9921569, 1, 0, 1,
-0.9217989, -0.5907978, -2.104686, 0.9843137, 1, 0, 1,
-0.9117071, -1.099564, -1.900247, 0.9803922, 1, 0, 1,
-0.9087017, 0.1037342, -1.001197, 0.972549, 1, 0, 1,
-0.9069226, -0.05058497, -1.472864, 0.9686275, 1, 0, 1,
-0.9041318, -0.6246735, -0.01612327, 0.9607843, 1, 0, 1,
-0.9027546, 0.148289, -1.351447, 0.9568627, 1, 0, 1,
-0.8981508, -2.020379, -3.787248, 0.9490196, 1, 0, 1,
-0.891701, -0.9471146, -2.959796, 0.945098, 1, 0, 1,
-0.8785042, -0.03566059, -3.078797, 0.9372549, 1, 0, 1,
-0.8750761, 0.05774343, -3.171566, 0.9333333, 1, 0, 1,
-0.8738368, -0.008184638, -1.51071, 0.9254902, 1, 0, 1,
-0.8711236, 0.6322381, -1.431352, 0.9215686, 1, 0, 1,
-0.8689643, 0.1329633, -1.61624, 0.9137255, 1, 0, 1,
-0.8675529, 0.02369626, -1.930637, 0.9098039, 1, 0, 1,
-0.8613801, 0.3560502, -3.020317, 0.9019608, 1, 0, 1,
-0.8518769, -1.963699, -4.032225, 0.8941177, 1, 0, 1,
-0.845815, 1.517956, 1.50278, 0.8901961, 1, 0, 1,
-0.8336183, -1.078001, -3.58936, 0.8823529, 1, 0, 1,
-0.8322874, 0.9757738, -1.044998, 0.8784314, 1, 0, 1,
-0.8296432, -1.245791, -1.540859, 0.8705882, 1, 0, 1,
-0.8141786, 1.25325, -0.2820501, 0.8666667, 1, 0, 1,
-0.790952, -0.3011018, -2.189494, 0.8588235, 1, 0, 1,
-0.7801762, -0.1488945, -0.0577752, 0.854902, 1, 0, 1,
-0.7755142, 0.6148432, 0.3582111, 0.8470588, 1, 0, 1,
-0.7711772, -0.08828828, -3.873489, 0.8431373, 1, 0, 1,
-0.7709782, -0.08768772, -1.630646, 0.8352941, 1, 0, 1,
-0.7694111, -0.2238142, -1.149342, 0.8313726, 1, 0, 1,
-0.7675833, 0.03524109, -2.418245, 0.8235294, 1, 0, 1,
-0.764109, -0.1498771, -1.103369, 0.8196079, 1, 0, 1,
-0.756171, 0.06756645, 0.2030874, 0.8117647, 1, 0, 1,
-0.7542883, 0.1152673, -0.7845874, 0.8078431, 1, 0, 1,
-0.7512646, -0.5757831, -2.080543, 0.8, 1, 0, 1,
-0.7422627, 0.5271538, -0.9859501, 0.7921569, 1, 0, 1,
-0.74154, 0.6197596, 0.1693143, 0.7882353, 1, 0, 1,
-0.7372298, -0.6037836, -2.717409, 0.7803922, 1, 0, 1,
-0.72171, -0.3078213, -0.9435377, 0.7764706, 1, 0, 1,
-0.7179047, -0.2202279, -2.047243, 0.7686275, 1, 0, 1,
-0.7127435, -0.7776218, -0.7766168, 0.7647059, 1, 0, 1,
-0.7105203, 0.8008727, -0.2077075, 0.7568628, 1, 0, 1,
-0.7077916, 0.5749876, -0.3423445, 0.7529412, 1, 0, 1,
-0.7064583, 1.285014, -1.309768, 0.7450981, 1, 0, 1,
-0.6977611, 1.116924, 0.4916264, 0.7411765, 1, 0, 1,
-0.6970457, -0.3679911, -1.743293, 0.7333333, 1, 0, 1,
-0.6894268, -2.122332, -3.728482, 0.7294118, 1, 0, 1,
-0.6848349, 0.006993228, 0.4479946, 0.7215686, 1, 0, 1,
-0.6845638, -0.8863621, -1.204716, 0.7176471, 1, 0, 1,
-0.6835415, 0.1625907, -0.8705317, 0.7098039, 1, 0, 1,
-0.6805149, 0.9171887, -1.187531, 0.7058824, 1, 0, 1,
-0.6798428, -1.427588, -2.334306, 0.6980392, 1, 0, 1,
-0.6771027, -0.1467756, -3.044647, 0.6901961, 1, 0, 1,
-0.6721765, 0.5769379, -2.217307, 0.6862745, 1, 0, 1,
-0.6681747, -0.7642767, -1.584172, 0.6784314, 1, 0, 1,
-0.667382, 0.1858801, -2.017483, 0.6745098, 1, 0, 1,
-0.6625009, 0.3760909, -0.3869604, 0.6666667, 1, 0, 1,
-0.6616391, 2.678935, -0.6514867, 0.6627451, 1, 0, 1,
-0.6564426, -1.344007, -3.723396, 0.654902, 1, 0, 1,
-0.655966, 3.236834, -0.0709125, 0.6509804, 1, 0, 1,
-0.6537601, 1.167421, -0.4665032, 0.6431373, 1, 0, 1,
-0.6523569, 1.25482, -1.821599, 0.6392157, 1, 0, 1,
-0.652169, 1.663403, 1.037292, 0.6313726, 1, 0, 1,
-0.6491289, 0.5326743, -0.9145465, 0.627451, 1, 0, 1,
-0.6473009, 0.2632785, -1.03864, 0.6196079, 1, 0, 1,
-0.6460735, 2.841738, -0.1251347, 0.6156863, 1, 0, 1,
-0.644951, -1.649336, -4.697872, 0.6078432, 1, 0, 1,
-0.6429611, 2.354204, 0.1425568, 0.6039216, 1, 0, 1,
-0.6422623, 0.2187634, -1.956134, 0.5960785, 1, 0, 1,
-0.6405154, 0.3080176, -0.7649054, 0.5882353, 1, 0, 1,
-0.6285014, 1.697833, 1.252717, 0.5843138, 1, 0, 1,
-0.6215405, 3.177087, -0.6737443, 0.5764706, 1, 0, 1,
-0.6195422, -1.214039, -2.111087, 0.572549, 1, 0, 1,
-0.612048, -2.176757, -3.373413, 0.5647059, 1, 0, 1,
-0.6110367, 0.1753345, -0.8661904, 0.5607843, 1, 0, 1,
-0.607664, 1.286633, -1.12694, 0.5529412, 1, 0, 1,
-0.6067339, -1.82573, -1.840796, 0.5490196, 1, 0, 1,
-0.6035843, -2.068316, -2.393904, 0.5411765, 1, 0, 1,
-0.5991803, 2.251126, -0.2590684, 0.5372549, 1, 0, 1,
-0.5921001, 0.4761707, 0.7909863, 0.5294118, 1, 0, 1,
-0.5885518, -0.9338903, -1.208066, 0.5254902, 1, 0, 1,
-0.5849472, -0.5767617, -1.781616, 0.5176471, 1, 0, 1,
-0.5826315, -1.009059, -4.342706, 0.5137255, 1, 0, 1,
-0.5796261, -0.2740447, -0.6418248, 0.5058824, 1, 0, 1,
-0.5773079, -0.9812474, -0.6609193, 0.5019608, 1, 0, 1,
-0.5754602, -0.8725688, -2.598394, 0.4941176, 1, 0, 1,
-0.5723819, -0.6382686, -1.339811, 0.4862745, 1, 0, 1,
-0.5712536, 1.722329, -1.753115, 0.4823529, 1, 0, 1,
-0.5699147, -0.1147552, -0.235144, 0.4745098, 1, 0, 1,
-0.5679965, -1.04711, -3.16237, 0.4705882, 1, 0, 1,
-0.5663006, 0.01302578, -1.797711, 0.4627451, 1, 0, 1,
-0.5661223, -0.6683282, -4.278259, 0.4588235, 1, 0, 1,
-0.5628267, -1.138906, -3.317861, 0.4509804, 1, 0, 1,
-0.5622061, 0.7672889, 0.4663506, 0.4470588, 1, 0, 1,
-0.5602226, 1.972048, 1.570766, 0.4392157, 1, 0, 1,
-0.5596897, -1.146393, -4.579217, 0.4352941, 1, 0, 1,
-0.5591703, 0.6197419, -0.8883191, 0.427451, 1, 0, 1,
-0.5509439, -0.867264, -2.207702, 0.4235294, 1, 0, 1,
-0.5465642, 0.3327471, -0.7984282, 0.4156863, 1, 0, 1,
-0.5455909, 1.096682, 0.821639, 0.4117647, 1, 0, 1,
-0.5411161, 0.2182319, 1.909001, 0.4039216, 1, 0, 1,
-0.5393924, 0.9527079, -1.667869, 0.3960784, 1, 0, 1,
-0.5367352, 0.8062036, -0.6190679, 0.3921569, 1, 0, 1,
-0.5347511, 1.095202, -1.288515, 0.3843137, 1, 0, 1,
-0.5308191, -0.3991481, -1.925883, 0.3803922, 1, 0, 1,
-0.5293224, -0.9966778, -2.495707, 0.372549, 1, 0, 1,
-0.5257836, 0.9767075, 1.06163, 0.3686275, 1, 0, 1,
-0.5251779, 0.5314422, -0.9227069, 0.3607843, 1, 0, 1,
-0.5225622, 1.398988, -0.9212213, 0.3568628, 1, 0, 1,
-0.5206503, 0.4296845, -0.81963, 0.3490196, 1, 0, 1,
-0.5202386, -1.219408, -3.176602, 0.345098, 1, 0, 1,
-0.5200964, -0.1363708, -1.387051, 0.3372549, 1, 0, 1,
-0.5110106, 1.332324, -0.9661446, 0.3333333, 1, 0, 1,
-0.5109051, 0.3495227, -0.6936498, 0.3254902, 1, 0, 1,
-0.5107561, 0.6356636, -1.127246, 0.3215686, 1, 0, 1,
-0.510497, -0.5557266, -1.398264, 0.3137255, 1, 0, 1,
-0.5074807, -0.7238322, -2.294828, 0.3098039, 1, 0, 1,
-0.5069958, -0.2942874, -2.896118, 0.3019608, 1, 0, 1,
-0.5063983, -1.156587, -2.175199, 0.2941177, 1, 0, 1,
-0.503073, 0.6097242, 0.3087238, 0.2901961, 1, 0, 1,
-0.5004368, -0.6665432, -3.518294, 0.282353, 1, 0, 1,
-0.4949657, 0.7468554, -1.034264, 0.2784314, 1, 0, 1,
-0.4925295, 1.688152, -0.2031561, 0.2705882, 1, 0, 1,
-0.4884927, -0.9737, -3.239654, 0.2666667, 1, 0, 1,
-0.4846049, 1.447883, 1.366693, 0.2588235, 1, 0, 1,
-0.4836268, -0.9610624, -1.758607, 0.254902, 1, 0, 1,
-0.4787389, -0.06339882, -1.90377, 0.2470588, 1, 0, 1,
-0.4782266, -0.3741006, -1.051496, 0.2431373, 1, 0, 1,
-0.4753418, 0.08781097, 0.1004716, 0.2352941, 1, 0, 1,
-0.4712843, -0.7361506, -2.16477, 0.2313726, 1, 0, 1,
-0.4671665, 1.488133, -0.3745039, 0.2235294, 1, 0, 1,
-0.4671108, -0.7584431, -2.620581, 0.2196078, 1, 0, 1,
-0.4664554, 1.572072, 0.9533363, 0.2117647, 1, 0, 1,
-0.4663735, -0.1839369, -2.818127, 0.2078431, 1, 0, 1,
-0.4646325, -0.7376173, -0.8097885, 0.2, 1, 0, 1,
-0.4630035, -0.5612769, -2.186956, 0.1921569, 1, 0, 1,
-0.4619674, 0.9356257, -1.046767, 0.1882353, 1, 0, 1,
-0.4614027, -1.106061, -1.886006, 0.1803922, 1, 0, 1,
-0.4580557, 0.6562929, 0.009016654, 0.1764706, 1, 0, 1,
-0.4556665, 2.329988, 0.2533451, 0.1686275, 1, 0, 1,
-0.4552576, -0.322303, -3.049258, 0.1647059, 1, 0, 1,
-0.4511061, -0.2107552, -2.221446, 0.1568628, 1, 0, 1,
-0.4503389, 0.1017526, -2.503496, 0.1529412, 1, 0, 1,
-0.4499872, 0.218358, 1.348072, 0.145098, 1, 0, 1,
-0.4489977, 1.606296, 0.9675107, 0.1411765, 1, 0, 1,
-0.4470013, 0.2433396, -0.7319574, 0.1333333, 1, 0, 1,
-0.4461039, 0.891072, 0.1259249, 0.1294118, 1, 0, 1,
-0.4429987, 2.172849, 0.2178333, 0.1215686, 1, 0, 1,
-0.4413195, -2.167035, -3.071077, 0.1176471, 1, 0, 1,
-0.4354257, 0.1000783, -1.615136, 0.1098039, 1, 0, 1,
-0.4318919, 0.309758, -1.051725, 0.1058824, 1, 0, 1,
-0.4313948, 1.549011, 0.6879324, 0.09803922, 1, 0, 1,
-0.4275942, -1.952632, -4.164974, 0.09019608, 1, 0, 1,
-0.42427, -0.6951873, -3.615974, 0.08627451, 1, 0, 1,
-0.4212151, 1.168696, -0.3273169, 0.07843138, 1, 0, 1,
-0.4211051, 2.182825, 0.1776571, 0.07450981, 1, 0, 1,
-0.4138608, 0.3329914, -0.7028373, 0.06666667, 1, 0, 1,
-0.4125104, 0.6493745, 0.03655035, 0.0627451, 1, 0, 1,
-0.4099494, -0.8274733, -2.380599, 0.05490196, 1, 0, 1,
-0.4056622, -0.7433572, -2.85446, 0.05098039, 1, 0, 1,
-0.4055922, 0.4241186, -1.77379, 0.04313726, 1, 0, 1,
-0.4005524, 0.3739271, 0.1679011, 0.03921569, 1, 0, 1,
-0.3980352, -0.5602318, -1.693412, 0.03137255, 1, 0, 1,
-0.3907385, -1.159918, -3.37427, 0.02745098, 1, 0, 1,
-0.3906632, -0.5781589, -3.241605, 0.01960784, 1, 0, 1,
-0.3859567, -1.577388, -2.267743, 0.01568628, 1, 0, 1,
-0.3795544, 0.8092037, -0.2069162, 0.007843138, 1, 0, 1,
-0.3793391, 1.390674, -1.584054, 0.003921569, 1, 0, 1,
-0.3788264, -0.9116065, -2.38182, 0, 1, 0.003921569, 1,
-0.3777068, 0.6255229, 0.08092288, 0, 1, 0.01176471, 1,
-0.3718626, 0.7059472, -1.924246, 0, 1, 0.01568628, 1,
-0.368833, 0.5822734, -1.610237, 0, 1, 0.02352941, 1,
-0.3678572, 0.5372787, -1.286224, 0, 1, 0.02745098, 1,
-0.3646955, 1.922854, 0.3187354, 0, 1, 0.03529412, 1,
-0.3628271, 0.1499344, -0.7678196, 0, 1, 0.03921569, 1,
-0.3609811, -1.145218, -2.243462, 0, 1, 0.04705882, 1,
-0.3601104, -0.2193453, -2.910708, 0, 1, 0.05098039, 1,
-0.3590722, -0.9710732, -4.008153, 0, 1, 0.05882353, 1,
-0.3569075, -0.7329165, -3.301996, 0, 1, 0.0627451, 1,
-0.3483011, -0.5148845, -1.574535, 0, 1, 0.07058824, 1,
-0.3476839, -1.198391, -1.804117, 0, 1, 0.07450981, 1,
-0.3447047, 0.2134944, -1.875395, 0, 1, 0.08235294, 1,
-0.3445636, 1.066327, -0.5305187, 0, 1, 0.08627451, 1,
-0.3442675, -0.364089, -2.374838, 0, 1, 0.09411765, 1,
-0.3442062, 1.512861, -0.345639, 0, 1, 0.1019608, 1,
-0.3384992, 0.06195405, -3.106321, 0, 1, 0.1058824, 1,
-0.3371834, 0.9020715, 1.837747, 0, 1, 0.1137255, 1,
-0.3366227, -0.07740273, -3.145451, 0, 1, 0.1176471, 1,
-0.3353516, -0.9401865, -3.287115, 0, 1, 0.1254902, 1,
-0.3332234, 0.8507974, -1.547907, 0, 1, 0.1294118, 1,
-0.3328308, -0.2639073, -2.202283, 0, 1, 0.1372549, 1,
-0.3313267, -0.08859304, 0.01439519, 0, 1, 0.1411765, 1,
-0.3284479, -0.5161164, -3.491465, 0, 1, 0.1490196, 1,
-0.3274335, 1.727248, 0.3655772, 0, 1, 0.1529412, 1,
-0.326231, -0.7569067, -1.72726, 0, 1, 0.1607843, 1,
-0.3252613, 1.654961, 0.5435376, 0, 1, 0.1647059, 1,
-0.3243971, 0.4249492, 0.9257702, 0, 1, 0.172549, 1,
-0.3171982, 0.4030015, -3.001636, 0, 1, 0.1764706, 1,
-0.3154908, 0.7685522, -0.7935791, 0, 1, 0.1843137, 1,
-0.3153305, -0.3350872, -4.25627, 0, 1, 0.1882353, 1,
-0.3142669, -2.079327, -2.024086, 0, 1, 0.1960784, 1,
-0.3137369, 1.500019, 1.65445, 0, 1, 0.2039216, 1,
-0.3119263, -1.579978, -3.341095, 0, 1, 0.2078431, 1,
-0.3102734, -0.1615892, -1.659308, 0, 1, 0.2156863, 1,
-0.3094903, -0.2857935, -1.02611, 0, 1, 0.2196078, 1,
-0.3037344, -0.2826292, -1.480327, 0, 1, 0.227451, 1,
-0.3034174, 2.110917, 0.4877079, 0, 1, 0.2313726, 1,
-0.2980222, -1.177742, -4.134094, 0, 1, 0.2392157, 1,
-0.2924262, -0.865109, -2.850312, 0, 1, 0.2431373, 1,
-0.2909814, 0.7348028, -2.850959, 0, 1, 0.2509804, 1,
-0.2877259, -0.2507132, -0.9451624, 0, 1, 0.254902, 1,
-0.2872956, 0.5750279, -0.3270754, 0, 1, 0.2627451, 1,
-0.28474, -0.7704693, -3.431264, 0, 1, 0.2666667, 1,
-0.2820581, -0.5748657, -1.085197, 0, 1, 0.2745098, 1,
-0.2787523, 0.6697929, 0.3972114, 0, 1, 0.2784314, 1,
-0.272198, 0.1460311, -1.626354, 0, 1, 0.2862745, 1,
-0.2677638, -0.3173392, -3.395384, 0, 1, 0.2901961, 1,
-0.2656373, 1.728956, -0.1498035, 0, 1, 0.2980392, 1,
-0.2645797, 0.001751764, -0.8226439, 0, 1, 0.3058824, 1,
-0.2592302, -0.0933815, -1.110309, 0, 1, 0.3098039, 1,
-0.2578883, -1.938617, -2.928391, 0, 1, 0.3176471, 1,
-0.2569754, 2.981725, -0.05815125, 0, 1, 0.3215686, 1,
-0.252994, -0.6452034, -3.624317, 0, 1, 0.3294118, 1,
-0.2498933, -0.1974149, -2.410209, 0, 1, 0.3333333, 1,
-0.2488245, 0.3829411, -0.7485267, 0, 1, 0.3411765, 1,
-0.2416061, 0.6289993, -0.353571, 0, 1, 0.345098, 1,
-0.2331124, -0.2504739, 0.1235458, 0, 1, 0.3529412, 1,
-0.2319297, -0.7537022, -3.696023, 0, 1, 0.3568628, 1,
-0.2317947, -1.165432, -3.478055, 0, 1, 0.3647059, 1,
-0.229519, 0.1122999, -1.081508, 0, 1, 0.3686275, 1,
-0.2284524, 0.7464677, -0.7327974, 0, 1, 0.3764706, 1,
-0.2240363, 0.93242, 0.2118075, 0, 1, 0.3803922, 1,
-0.2202171, 0.8238368, -0.4962778, 0, 1, 0.3882353, 1,
-0.2162523, 0.605392, -1.499143, 0, 1, 0.3921569, 1,
-0.2151961, 0.6288421, 0.1263792, 0, 1, 0.4, 1,
-0.2150779, -0.7799127, -2.566216, 0, 1, 0.4078431, 1,
-0.2103686, 0.787769, 0.2197971, 0, 1, 0.4117647, 1,
-0.2076017, -1.069488, -4.004126, 0, 1, 0.4196078, 1,
-0.2072048, 0.1390208, -1.885559, 0, 1, 0.4235294, 1,
-0.2029525, -2.126129, -4.071644, 0, 1, 0.4313726, 1,
-0.2009658, -0.5040249, -3.86617, 0, 1, 0.4352941, 1,
-0.2004592, 0.4799515, -1.627709, 0, 1, 0.4431373, 1,
-0.1963293, 0.6227295, 0.1829046, 0, 1, 0.4470588, 1,
-0.1945119, 0.6031942, -0.7440171, 0, 1, 0.454902, 1,
-0.1925561, -0.4824854, -3.68384, 0, 1, 0.4588235, 1,
-0.1897154, 0.4040608, -0.4366938, 0, 1, 0.4666667, 1,
-0.1892675, -1.317109, -3.64638, 0, 1, 0.4705882, 1,
-0.1887963, -0.5188579, -2.038483, 0, 1, 0.4784314, 1,
-0.1880616, -0.2912538, -2.349857, 0, 1, 0.4823529, 1,
-0.1854405, 0.8218448, 0.2565554, 0, 1, 0.4901961, 1,
-0.1813737, 0.8012452, -0.9494634, 0, 1, 0.4941176, 1,
-0.1806501, -0.4821037, -2.675286, 0, 1, 0.5019608, 1,
-0.1799773, -0.6757106, -3.821294, 0, 1, 0.509804, 1,
-0.1782216, -1.135979, -2.247685, 0, 1, 0.5137255, 1,
-0.1778711, -0.6607797, -3.874388, 0, 1, 0.5215687, 1,
-0.1768174, 0.6954961, -0.9732237, 0, 1, 0.5254902, 1,
-0.1743653, -0.0600042, -1.569223, 0, 1, 0.5333334, 1,
-0.1742794, -0.7128404, -2.420186, 0, 1, 0.5372549, 1,
-0.1740335, 0.4751446, 0.4787886, 0, 1, 0.5450981, 1,
-0.1736973, -1.258931, -2.717317, 0, 1, 0.5490196, 1,
-0.1733661, -0.744639, -2.997388, 0, 1, 0.5568628, 1,
-0.1712562, -0.9492043, -2.173962, 0, 1, 0.5607843, 1,
-0.1669168, -0.6702718, -1.5765, 0, 1, 0.5686275, 1,
-0.1658754, -2.263947, -3.786053, 0, 1, 0.572549, 1,
-0.1657835, -0.8908177, -2.493958, 0, 1, 0.5803922, 1,
-0.1651279, 2.321416, 0.4804102, 0, 1, 0.5843138, 1,
-0.1650339, -0.8341326, -2.806143, 0, 1, 0.5921569, 1,
-0.1610041, 0.4901491, -0.7139106, 0, 1, 0.5960785, 1,
-0.1606352, 1.042954, -0.8970221, 0, 1, 0.6039216, 1,
-0.1588661, -0.1991668, -3.903687, 0, 1, 0.6117647, 1,
-0.1545508, -0.6278381, -2.891147, 0, 1, 0.6156863, 1,
-0.1527977, -0.7613231, -2.963708, 0, 1, 0.6235294, 1,
-0.1483127, 0.04736624, -2.904513, 0, 1, 0.627451, 1,
-0.1471162, 1.113521, -0.5442778, 0, 1, 0.6352941, 1,
-0.1452388, 0.6998932, -1.152155, 0, 1, 0.6392157, 1,
-0.1452242, 0.8956563, 2.199738, 0, 1, 0.6470588, 1,
-0.1415867, 1.626776, -0.08535868, 0, 1, 0.6509804, 1,
-0.1412003, -0.6142284, -3.289709, 0, 1, 0.6588235, 1,
-0.137864, -0.2236388, -3.140548, 0, 1, 0.6627451, 1,
-0.1368466, -0.9311641, -2.477147, 0, 1, 0.6705883, 1,
-0.1336738, -1.354, -4.016271, 0, 1, 0.6745098, 1,
-0.1320933, -0.6916396, -2.140733, 0, 1, 0.682353, 1,
-0.1299849, 0.8366014, -0.5535682, 0, 1, 0.6862745, 1,
-0.1277661, -0.2689224, -3.977327, 0, 1, 0.6941177, 1,
-0.1277095, -0.1268908, -4.099618, 0, 1, 0.7019608, 1,
-0.1240917, 0.007593654, -2.040022, 0, 1, 0.7058824, 1,
-0.121678, 1.826585, -0.8400503, 0, 1, 0.7137255, 1,
-0.1167706, 0.2346311, -1.079477, 0, 1, 0.7176471, 1,
-0.115155, 2.043509, -1.503509, 0, 1, 0.7254902, 1,
-0.1133737, -0.418019, -2.523744, 0, 1, 0.7294118, 1,
-0.11043, 0.06698154, -1.392607, 0, 1, 0.7372549, 1,
-0.1056886, -1.660895, -2.048692, 0, 1, 0.7411765, 1,
-0.1030882, -0.1172166, -3.25812, 0, 1, 0.7490196, 1,
-0.1025376, -0.1968947, -2.292154, 0, 1, 0.7529412, 1,
-0.1019829, 0.0586511, -2.274867, 0, 1, 0.7607843, 1,
-0.09872202, -1.270675, -1.120673, 0, 1, 0.7647059, 1,
-0.09819987, 0.1549381, -1.71419, 0, 1, 0.772549, 1,
-0.09767699, -0.2384927, -2.924893, 0, 1, 0.7764706, 1,
-0.09460288, -1.35047, -4.750652, 0, 1, 0.7843137, 1,
-0.09435772, 0.2087316, 0.5746959, 0, 1, 0.7882353, 1,
-0.09423673, 0.4527267, -0.03726134, 0, 1, 0.7960784, 1,
-0.0941559, -1.84945, -3.283807, 0, 1, 0.8039216, 1,
-0.09328593, 1.026729, -1.118045, 0, 1, 0.8078431, 1,
-0.09287087, 0.7483335, -2.219234, 0, 1, 0.8156863, 1,
-0.08819295, 0.4026971, 0.1197462, 0, 1, 0.8196079, 1,
-0.08397433, -1.323718, -2.754548, 0, 1, 0.827451, 1,
-0.08068395, -0.142381, -2.068761, 0, 1, 0.8313726, 1,
-0.07621055, -0.6040619, -3.676909, 0, 1, 0.8392157, 1,
-0.07619213, 0.2688798, 0.9577664, 0, 1, 0.8431373, 1,
-0.07590324, -1.540014, -4.690142, 0, 1, 0.8509804, 1,
-0.07070752, -0.5236932, -2.581243, 0, 1, 0.854902, 1,
-0.06923802, 1.991586, 2.308656, 0, 1, 0.8627451, 1,
-0.06655835, 0.5701274, 1.856016, 0, 1, 0.8666667, 1,
-0.05020153, 0.832575, -0.9491867, 0, 1, 0.8745098, 1,
-0.04699805, 1.849488, -0.8616452, 0, 1, 0.8784314, 1,
-0.04579006, 1.845885, -1.552224, 0, 1, 0.8862745, 1,
-0.04415045, 1.893693, -0.2980338, 0, 1, 0.8901961, 1,
-0.04413244, 1.281391, -0.870476, 0, 1, 0.8980392, 1,
-0.04340732, 0.04777744, 0.9694076, 0, 1, 0.9058824, 1,
-0.04277089, -1.033068, -3.09756, 0, 1, 0.9098039, 1,
-0.04235257, 0.08873487, -0.3234049, 0, 1, 0.9176471, 1,
-0.03718178, -0.5483926, -1.000415, 0, 1, 0.9215686, 1,
-0.03221617, -0.4825368, -2.137362, 0, 1, 0.9294118, 1,
-0.02695889, 0.6456966, -1.238393, 0, 1, 0.9333333, 1,
-0.0267412, 2.271738, 1.040646, 0, 1, 0.9411765, 1,
-0.02013838, -0.9641292, -3.015188, 0, 1, 0.945098, 1,
-0.01899591, 0.9496397, -1.47208, 0, 1, 0.9529412, 1,
-0.01521731, 1.194874, -0.7118446, 0, 1, 0.9568627, 1,
-0.01341967, 1.346464, 0.7931654, 0, 1, 0.9647059, 1,
-0.009397727, -1.389553, -2.683018, 0, 1, 0.9686275, 1,
-0.003550162, -0.1684757, -4.220365, 0, 1, 0.9764706, 1,
-0.001742465, 0.04391975, 0.1441887, 0, 1, 0.9803922, 1,
0.001094189, 1.825787, -0.3914678, 0, 1, 0.9882353, 1,
0.001607672, -0.9353409, 3.718714, 0, 1, 0.9921569, 1,
0.004393601, -0.6886362, 2.933538, 0, 1, 1, 1,
0.007026252, 0.08444174, -1.476752, 0, 0.9921569, 1, 1,
0.007224341, -2.368004, 3.070101, 0, 0.9882353, 1, 1,
0.01046072, -0.411441, 1.509873, 0, 0.9803922, 1, 1,
0.01103862, -0.02049972, 2.398735, 0, 0.9764706, 1, 1,
0.01166461, 0.1374792, 0.6765789, 0, 0.9686275, 1, 1,
0.01351371, -1.649739, 3.493868, 0, 0.9647059, 1, 1,
0.01494623, -0.3382779, 3.256315, 0, 0.9568627, 1, 1,
0.01527503, -0.8311681, 4.340728, 0, 0.9529412, 1, 1,
0.01593576, 0.3358935, 0.8723937, 0, 0.945098, 1, 1,
0.02471303, 0.2312715, -0.862637, 0, 0.9411765, 1, 1,
0.02826509, -0.9225101, 3.115432, 0, 0.9333333, 1, 1,
0.03324352, -0.5656452, 3.647989, 0, 0.9294118, 1, 1,
0.03337997, 0.334127, 0.3967144, 0, 0.9215686, 1, 1,
0.0374269, 0.3532286, -0.7301204, 0, 0.9176471, 1, 1,
0.03862666, -0.1338752, 2.136083, 0, 0.9098039, 1, 1,
0.04003051, -1.195627, 2.836181, 0, 0.9058824, 1, 1,
0.04232088, 1.809885, 0.07269287, 0, 0.8980392, 1, 1,
0.0435564, -0.9524523, 3.930331, 0, 0.8901961, 1, 1,
0.04674175, 1.234275, -1.156808, 0, 0.8862745, 1, 1,
0.05297452, -0.3413241, 3.134438, 0, 0.8784314, 1, 1,
0.05357811, -0.3904275, 3.93514, 0, 0.8745098, 1, 1,
0.05480682, 1.37721, -0.6947079, 0, 0.8666667, 1, 1,
0.0549482, -1.055088, 2.339277, 0, 0.8627451, 1, 1,
0.05771414, -0.5598951, 4.097653, 0, 0.854902, 1, 1,
0.06002179, 0.9757323, -1.32205, 0, 0.8509804, 1, 1,
0.06488276, 1.419531, 0.3512902, 0, 0.8431373, 1, 1,
0.0657326, 0.446164, -0.4952825, 0, 0.8392157, 1, 1,
0.06957897, 1.560315, -1.223252, 0, 0.8313726, 1, 1,
0.06987558, 1.091429, 0.3442286, 0, 0.827451, 1, 1,
0.07104592, 0.9206982, -0.2802239, 0, 0.8196079, 1, 1,
0.07258406, -1.553672, 4.988274, 0, 0.8156863, 1, 1,
0.07371227, -0.1947784, 3.050538, 0, 0.8078431, 1, 1,
0.07555083, 0.6705964, -0.325544, 0, 0.8039216, 1, 1,
0.07765015, -0.2485092, 3.709694, 0, 0.7960784, 1, 1,
0.07965366, 0.913469, 1.164935, 0, 0.7882353, 1, 1,
0.08043712, -0.544903, 3.655233, 0, 0.7843137, 1, 1,
0.08704714, -0.5757044, 4.706157, 0, 0.7764706, 1, 1,
0.09516937, -0.9410659, 1.611369, 0, 0.772549, 1, 1,
0.0956286, 0.9040968, -0.116622, 0, 0.7647059, 1, 1,
0.09568534, -0.3230367, 2.70813, 0, 0.7607843, 1, 1,
0.09716663, -0.09034138, 1.386094, 0, 0.7529412, 1, 1,
0.1022454, -1.451786, 3.347982, 0, 0.7490196, 1, 1,
0.1045402, -0.4430512, 4.005316, 0, 0.7411765, 1, 1,
0.1098082, 0.5210621, -0.4952773, 0, 0.7372549, 1, 1,
0.1099336, -1.064289, 2.655767, 0, 0.7294118, 1, 1,
0.1099681, 0.05926723, 1.384029, 0, 0.7254902, 1, 1,
0.1178089, -0.5893497, 2.005815, 0, 0.7176471, 1, 1,
0.1219001, 0.332755, -0.2630262, 0, 0.7137255, 1, 1,
0.1267338, 1.667627, -0.3196941, 0, 0.7058824, 1, 1,
0.127645, 0.4944554, 1.053984, 0, 0.6980392, 1, 1,
0.1311549, 2.171478, -0.4231229, 0, 0.6941177, 1, 1,
0.1394725, 0.5833645, -0.4717391, 0, 0.6862745, 1, 1,
0.1398743, 0.8492333, 0.6370128, 0, 0.682353, 1, 1,
0.1430443, -1.59885, 3.128755, 0, 0.6745098, 1, 1,
0.1432363, 0.6410722, -0.04178988, 0, 0.6705883, 1, 1,
0.1481474, -0.5280942, 3.100446, 0, 0.6627451, 1, 1,
0.1482261, -1.019251, 1.11699, 0, 0.6588235, 1, 1,
0.1488133, 1.382941, 1.130791, 0, 0.6509804, 1, 1,
0.1489497, 0.8285301, 0.4299484, 0, 0.6470588, 1, 1,
0.1505689, -0.7964678, 1.358996, 0, 0.6392157, 1, 1,
0.1627043, 0.3332386, 2.134353, 0, 0.6352941, 1, 1,
0.1644914, -0.6087531, 3.835038, 0, 0.627451, 1, 1,
0.1649339, 0.06831233, 0.9975001, 0, 0.6235294, 1, 1,
0.1659326, -0.3461258, 2.840132, 0, 0.6156863, 1, 1,
0.1677454, -0.3625592, 3.875191, 0, 0.6117647, 1, 1,
0.1817444, -0.2992654, 1.590919, 0, 0.6039216, 1, 1,
0.1873462, 0.123221, -0.8781618, 0, 0.5960785, 1, 1,
0.1875366, -1.609489, 4.094278, 0, 0.5921569, 1, 1,
0.1877373, -0.4405361, 3.184855, 0, 0.5843138, 1, 1,
0.1904489, 0.4562091, -0.7871093, 0, 0.5803922, 1, 1,
0.1908088, -0.3313777, 2.564384, 0, 0.572549, 1, 1,
0.1916316, -0.7599485, 3.84825, 0, 0.5686275, 1, 1,
0.1962846, 2.220952, -1.071288, 0, 0.5607843, 1, 1,
0.2020797, 0.7893673, -0.652063, 0, 0.5568628, 1, 1,
0.2050015, 0.931436, 0.5893202, 0, 0.5490196, 1, 1,
0.206504, -0.7615591, 2.172029, 0, 0.5450981, 1, 1,
0.2081963, 0.03584511, 1.788403, 0, 0.5372549, 1, 1,
0.2137466, 0.3917041, 1.518032, 0, 0.5333334, 1, 1,
0.2210038, 0.8356901, 0.3132833, 0, 0.5254902, 1, 1,
0.2213704, -0.8723555, 2.303823, 0, 0.5215687, 1, 1,
0.224727, -0.09654191, 1.07708, 0, 0.5137255, 1, 1,
0.2252906, 0.2061298, -0.02400297, 0, 0.509804, 1, 1,
0.2265825, 1.441409, -1.116081, 0, 0.5019608, 1, 1,
0.2276765, 0.510901, 0.6739669, 0, 0.4941176, 1, 1,
0.2303646, -0.2379342, 4.913809, 0, 0.4901961, 1, 1,
0.2319974, 0.5058043, -0.03729787, 0, 0.4823529, 1, 1,
0.2329585, -0.4176551, 4.793244, 0, 0.4784314, 1, 1,
0.2334154, 1.819464, 0.08930125, 0, 0.4705882, 1, 1,
0.2341939, 1.503381, 1.103685, 0, 0.4666667, 1, 1,
0.2347144, 0.6557127, 0.06105723, 0, 0.4588235, 1, 1,
0.2349986, 0.2531436, -1.533425, 0, 0.454902, 1, 1,
0.2350482, -0.2177318, 2.640034, 0, 0.4470588, 1, 1,
0.2372633, -1.158563, 3.117847, 0, 0.4431373, 1, 1,
0.2380179, -1.029693, 3.484333, 0, 0.4352941, 1, 1,
0.2389522, -1.157985, 3.661372, 0, 0.4313726, 1, 1,
0.2416857, -1.025151, 4.325926, 0, 0.4235294, 1, 1,
0.2492323, -0.2435465, 3.721899, 0, 0.4196078, 1, 1,
0.2493654, -0.5496401, 2.77758, 0, 0.4117647, 1, 1,
0.2523897, -0.04870453, 1.960548, 0, 0.4078431, 1, 1,
0.2535751, 0.2113911, 2.165397, 0, 0.4, 1, 1,
0.2572626, 1.461346, 0.641728, 0, 0.3921569, 1, 1,
0.2579483, -0.9623711, 2.069819, 0, 0.3882353, 1, 1,
0.2588387, -0.3131577, 1.540893, 0, 0.3803922, 1, 1,
0.2631512, 0.1412895, 0.5105005, 0, 0.3764706, 1, 1,
0.2671102, 0.7166221, 0.317836, 0, 0.3686275, 1, 1,
0.2674241, -0.5589882, 3.892282, 0, 0.3647059, 1, 1,
0.2676536, 0.3631015, 4.347268, 0, 0.3568628, 1, 1,
0.2698118, -1.339699, 2.180965, 0, 0.3529412, 1, 1,
0.2705971, 0.219397, 1.449656, 0, 0.345098, 1, 1,
0.2709115, 1.664129, -0.8053579, 0, 0.3411765, 1, 1,
0.2725458, -1.126317, 3.355741, 0, 0.3333333, 1, 1,
0.2778103, -1.073849, 2.733169, 0, 0.3294118, 1, 1,
0.2787142, 0.8468411, 0.1285745, 0, 0.3215686, 1, 1,
0.2814141, 0.2471907, 1.619504, 0, 0.3176471, 1, 1,
0.2826498, 0.7533045, 0.108237, 0, 0.3098039, 1, 1,
0.2832415, -0.5650498, 2.69662, 0, 0.3058824, 1, 1,
0.2871235, -0.595966, 1.626607, 0, 0.2980392, 1, 1,
0.289282, 1.032158, 0.7270627, 0, 0.2901961, 1, 1,
0.2896974, -1.610445, 4.029455, 0, 0.2862745, 1, 1,
0.2985967, 0.6082897, 0.7266614, 0, 0.2784314, 1, 1,
0.3040127, -0.05415692, 2.069809, 0, 0.2745098, 1, 1,
0.3101945, -0.854348, 2.106965, 0, 0.2666667, 1, 1,
0.3114692, 0.3656089, 1.387282, 0, 0.2627451, 1, 1,
0.3159422, 0.1774528, 1.072315, 0, 0.254902, 1, 1,
0.3230812, -0.7546123, 3.997032, 0, 0.2509804, 1, 1,
0.3268277, -0.4981127, 4.638572, 0, 0.2431373, 1, 1,
0.3293226, -0.5809723, 1.446772, 0, 0.2392157, 1, 1,
0.3351027, 0.4347183, 1.240142, 0, 0.2313726, 1, 1,
0.3351591, 0.3402024, 1.561176, 0, 0.227451, 1, 1,
0.336174, -1.710291, 3.733329, 0, 0.2196078, 1, 1,
0.3411364, -1.376467, 2.700969, 0, 0.2156863, 1, 1,
0.349817, 0.6727476, -0.400052, 0, 0.2078431, 1, 1,
0.3520714, 0.6145496, -1.49711, 0, 0.2039216, 1, 1,
0.3531226, -1.66608, 1.810138, 0, 0.1960784, 1, 1,
0.3531373, -0.4174272, 4.064422, 0, 0.1882353, 1, 1,
0.3533458, -0.8436315, 2.495144, 0, 0.1843137, 1, 1,
0.3563711, 0.251512, 0.8904232, 0, 0.1764706, 1, 1,
0.3585061, 0.1240644, 2.718218, 0, 0.172549, 1, 1,
0.3585074, -0.9231297, 2.341339, 0, 0.1647059, 1, 1,
0.3642626, -1.564452, 2.524365, 0, 0.1607843, 1, 1,
0.3745, 0.259012, -0.1203038, 0, 0.1529412, 1, 1,
0.3792719, 1.05925, 1.094061, 0, 0.1490196, 1, 1,
0.380145, -0.8665317, 1.222824, 0, 0.1411765, 1, 1,
0.3820892, 0.6875615, -0.06432079, 0, 0.1372549, 1, 1,
0.3822506, 0.3408825, 0.9021457, 0, 0.1294118, 1, 1,
0.3827201, -1.283868, 2.432744, 0, 0.1254902, 1, 1,
0.3834996, 0.3454047, 0.09993261, 0, 0.1176471, 1, 1,
0.393384, -0.1871798, 2.276209, 0, 0.1137255, 1, 1,
0.3934259, 0.8227976, 0.5272642, 0, 0.1058824, 1, 1,
0.4037142, -0.1949285, 2.451741, 0, 0.09803922, 1, 1,
0.404656, -0.3581967, 1.33962, 0, 0.09411765, 1, 1,
0.405033, 0.3357209, 0.5932453, 0, 0.08627451, 1, 1,
0.4232841, -1.130785, 2.195849, 0, 0.08235294, 1, 1,
0.4286217, 1.54451, 0.03264391, 0, 0.07450981, 1, 1,
0.4287626, -0.1820977, 3.247984, 0, 0.07058824, 1, 1,
0.4352295, 0.3552952, 2.452267, 0, 0.0627451, 1, 1,
0.4361543, 0.0004608233, 1.564482, 0, 0.05882353, 1, 1,
0.4367246, 0.7043831, 1.176809, 0, 0.05098039, 1, 1,
0.4406914, 1.013849, 0.2892208, 0, 0.04705882, 1, 1,
0.4425738, -0.5896891, 1.73009, 0, 0.03921569, 1, 1,
0.4473265, 0.8619251, -0.7174246, 0, 0.03529412, 1, 1,
0.4473372, 0.4331091, -0.7463914, 0, 0.02745098, 1, 1,
0.4479228, 0.824013, 0.7422526, 0, 0.02352941, 1, 1,
0.4479946, 0.4941269, 1.576062, 0, 0.01568628, 1, 1,
0.4483257, 0.8423151, 0.07708893, 0, 0.01176471, 1, 1,
0.4488526, 0.1540796, 2.080286, 0, 0.003921569, 1, 1,
0.4546565, -0.3682678, 3.64907, 0.003921569, 0, 1, 1,
0.4550304, -1.585645, 1.720073, 0.007843138, 0, 1, 1,
0.4587683, 1.594539, -0.377365, 0.01568628, 0, 1, 1,
0.4590727, 0.09048334, 2.503537, 0.01960784, 0, 1, 1,
0.4675584, -0.03861492, 2.996571, 0.02745098, 0, 1, 1,
0.4823733, -0.6574041, 3.211978, 0.03137255, 0, 1, 1,
0.4839232, 0.2548571, 0.2126152, 0.03921569, 0, 1, 1,
0.4844094, -0.523746, 2.58741, 0.04313726, 0, 1, 1,
0.4847768, 1.399551, 1.610255, 0.05098039, 0, 1, 1,
0.4900132, -0.8091157, 3.26363, 0.05490196, 0, 1, 1,
0.4903048, -1.235727, 1.082409, 0.0627451, 0, 1, 1,
0.4903315, -1.392224, 3.319113, 0.06666667, 0, 1, 1,
0.492523, 0.4646901, 0.3261282, 0.07450981, 0, 1, 1,
0.492981, -1.740057, 2.809111, 0.07843138, 0, 1, 1,
0.4932537, 0.1526119, 1.64276, 0.08627451, 0, 1, 1,
0.4980509, 0.9181433, 0.1566102, 0.09019608, 0, 1, 1,
0.4984722, 1.848459, -1.137938, 0.09803922, 0, 1, 1,
0.5029247, -0.2288644, 0.7398407, 0.1058824, 0, 1, 1,
0.5068461, -0.6576394, 3.495753, 0.1098039, 0, 1, 1,
0.5093083, -0.024907, 0.2027885, 0.1176471, 0, 1, 1,
0.5093539, 1.417404, -0.045775, 0.1215686, 0, 1, 1,
0.5104009, 0.07316355, -0.234028, 0.1294118, 0, 1, 1,
0.5149369, -1.023633, 2.712756, 0.1333333, 0, 1, 1,
0.5185763, 0.309148, 2.085704, 0.1411765, 0, 1, 1,
0.5217195, -0.8100709, 2.080525, 0.145098, 0, 1, 1,
0.523463, 1.484939, 0.2842247, 0.1529412, 0, 1, 1,
0.5288554, -0.8014171, 4.921508, 0.1568628, 0, 1, 1,
0.5328742, 0.373337, -0.2673489, 0.1647059, 0, 1, 1,
0.5354385, 0.1670698, 0.810816, 0.1686275, 0, 1, 1,
0.5440043, -1.903368, 2.32998, 0.1764706, 0, 1, 1,
0.5442196, -1.281169, 1.228541, 0.1803922, 0, 1, 1,
0.5461115, 2.460903, -0.7408236, 0.1882353, 0, 1, 1,
0.5462531, -1.379937, 2.551519, 0.1921569, 0, 1, 1,
0.5528573, 0.1798283, -1.114044, 0.2, 0, 1, 1,
0.5534548, -0.3153721, 1.56783, 0.2078431, 0, 1, 1,
0.5572555, 1.657513, 2.056666, 0.2117647, 0, 1, 1,
0.5584018, -0.620029, 0.3546392, 0.2196078, 0, 1, 1,
0.5587579, 1.154116, 1.470396, 0.2235294, 0, 1, 1,
0.566828, 2.006973, -0.1901631, 0.2313726, 0, 1, 1,
0.5688877, 0.7567901, 1.666055, 0.2352941, 0, 1, 1,
0.5689519, 0.5115336, 0.5810527, 0.2431373, 0, 1, 1,
0.573503, -0.07504202, 1.174907, 0.2470588, 0, 1, 1,
0.575133, 0.09595596, 2.261581, 0.254902, 0, 1, 1,
0.5758908, -1.266741, 4.562263, 0.2588235, 0, 1, 1,
0.5771266, 0.1470201, 0.02203442, 0.2666667, 0, 1, 1,
0.5806086, -0.1729775, 0.6768647, 0.2705882, 0, 1, 1,
0.5851471, -1.350383, 2.071703, 0.2784314, 0, 1, 1,
0.5869914, -0.5568056, 3.279769, 0.282353, 0, 1, 1,
0.5878927, -0.9053637, 1.930337, 0.2901961, 0, 1, 1,
0.592972, -0.1585214, 1.659222, 0.2941177, 0, 1, 1,
0.6042733, 1.009225, 2.891253, 0.3019608, 0, 1, 1,
0.6043965, -0.6248123, 2.354425, 0.3098039, 0, 1, 1,
0.6049505, -1.255762, 3.694758, 0.3137255, 0, 1, 1,
0.605549, 0.07287762, 0.3511537, 0.3215686, 0, 1, 1,
0.6129864, -0.5538896, 2.87949, 0.3254902, 0, 1, 1,
0.6139919, -0.004381268, -0.7809274, 0.3333333, 0, 1, 1,
0.6142688, -0.9926898, 4.710103, 0.3372549, 0, 1, 1,
0.6282318, -0.4161179, 2.93756, 0.345098, 0, 1, 1,
0.6321774, 1.331019, 0.01603432, 0.3490196, 0, 1, 1,
0.6433525, -0.3980226, 2.191612, 0.3568628, 0, 1, 1,
0.6469622, -2.134673, 3.401019, 0.3607843, 0, 1, 1,
0.6557281, -1.659954, 3.163287, 0.3686275, 0, 1, 1,
0.6570641, 1.30823, 0.4511623, 0.372549, 0, 1, 1,
0.6630303, -1.024737, 1.484157, 0.3803922, 0, 1, 1,
0.6643894, 0.220536, 2.074357, 0.3843137, 0, 1, 1,
0.666824, 1.546952, 1.166833, 0.3921569, 0, 1, 1,
0.6767444, -0.0343323, 3.056578, 0.3960784, 0, 1, 1,
0.677595, 0.9996849, 0.3455573, 0.4039216, 0, 1, 1,
0.678427, 0.4732785, 2.664489, 0.4117647, 0, 1, 1,
0.6806239, 0.7564935, 2.11314, 0.4156863, 0, 1, 1,
0.6807868, 0.3740617, 0.4221937, 0.4235294, 0, 1, 1,
0.6833462, 0.3814355, 0.844266, 0.427451, 0, 1, 1,
0.6839433, 1.465642, 2.109011, 0.4352941, 0, 1, 1,
0.6842813, 1.00826, 0.9024279, 0.4392157, 0, 1, 1,
0.6844501, 1.665092, 1.113071, 0.4470588, 0, 1, 1,
0.6867822, 0.9047489, 0.9074614, 0.4509804, 0, 1, 1,
0.6871653, 1.020978, 1.291708, 0.4588235, 0, 1, 1,
0.6917328, 0.5743682, 2.61384, 0.4627451, 0, 1, 1,
0.6981516, 0.2042363, -0.1073868, 0.4705882, 0, 1, 1,
0.6992132, 0.2683949, 1.928209, 0.4745098, 0, 1, 1,
0.7020226, 0.2814577, 2.908396, 0.4823529, 0, 1, 1,
0.7020762, -0.8697281, 2.556704, 0.4862745, 0, 1, 1,
0.7056581, 1.198366, 0.5377573, 0.4941176, 0, 1, 1,
0.7093947, -0.565264, 0.5559959, 0.5019608, 0, 1, 1,
0.7131137, 0.3369606, -0.2412755, 0.5058824, 0, 1, 1,
0.7181012, -0.3247778, 1.965292, 0.5137255, 0, 1, 1,
0.7185828, 0.7459465, 1.677551, 0.5176471, 0, 1, 1,
0.7258996, -1.307938, 3.657192, 0.5254902, 0, 1, 1,
0.733761, -0.1930561, 0.9653178, 0.5294118, 0, 1, 1,
0.743855, -0.2954627, 1.111779, 0.5372549, 0, 1, 1,
0.7493172, 1.794037, -0.6022775, 0.5411765, 0, 1, 1,
0.7554035, 0.6417019, -0.1724325, 0.5490196, 0, 1, 1,
0.7602909, 2.054655, 0.5797126, 0.5529412, 0, 1, 1,
0.7661298, -0.9566017, 2.591705, 0.5607843, 0, 1, 1,
0.7667366, 1.288414, -0.8102314, 0.5647059, 0, 1, 1,
0.7705178, -0.1837893, 1.505337, 0.572549, 0, 1, 1,
0.7720461, -0.3865224, 3.146912, 0.5764706, 0, 1, 1,
0.7738873, -0.3772263, 1.607813, 0.5843138, 0, 1, 1,
0.7787412, -0.9097645, 1.626145, 0.5882353, 0, 1, 1,
0.7835392, 0.3605669, -0.02226893, 0.5960785, 0, 1, 1,
0.7856972, -0.3453521, 1.551401, 0.6039216, 0, 1, 1,
0.7868728, 1.641872, 0.7756732, 0.6078432, 0, 1, 1,
0.7880673, 0.1404189, 1.09854, 0.6156863, 0, 1, 1,
0.7880982, -0.0324157, 2.401539, 0.6196079, 0, 1, 1,
0.7897269, -1.000081, 2.804447, 0.627451, 0, 1, 1,
0.791203, -1.622905, 3.475845, 0.6313726, 0, 1, 1,
0.7927456, 0.4842954, -0.4783919, 0.6392157, 0, 1, 1,
0.7939189, 0.2612466, 1.133463, 0.6431373, 0, 1, 1,
0.7996104, -0.6936439, 2.476121, 0.6509804, 0, 1, 1,
0.8008216, 1.434181, 0.9964817, 0.654902, 0, 1, 1,
0.806572, -2.172819, 4.621743, 0.6627451, 0, 1, 1,
0.8114676, 2.0673, 0.2591665, 0.6666667, 0, 1, 1,
0.8148568, 0.3755805, 2.939703, 0.6745098, 0, 1, 1,
0.8297197, 3.469245, 0.6168995, 0.6784314, 0, 1, 1,
0.8358492, -0.1053889, 2.910967, 0.6862745, 0, 1, 1,
0.8359725, 1.272755, 1.419422, 0.6901961, 0, 1, 1,
0.8369421, -0.0503895, 2.796234, 0.6980392, 0, 1, 1,
0.8387258, 0.580947, 1.326547, 0.7058824, 0, 1, 1,
0.8391417, -1.999566, 3.457559, 0.7098039, 0, 1, 1,
0.8408757, -1.535376, 2.854713, 0.7176471, 0, 1, 1,
0.8493295, -1.330504, 2.440198, 0.7215686, 0, 1, 1,
0.8582492, -1.280093, 2.05971, 0.7294118, 0, 1, 1,
0.8649449, 0.4776985, -0.1045008, 0.7333333, 0, 1, 1,
0.8742113, -1.5244, 3.875507, 0.7411765, 0, 1, 1,
0.8758038, 0.6065308, -0.9718336, 0.7450981, 0, 1, 1,
0.8825865, -0.4252386, 1.308482, 0.7529412, 0, 1, 1,
0.8865267, 0.1288799, 3.043111, 0.7568628, 0, 1, 1,
0.8911087, 1.917401, 1.126308, 0.7647059, 0, 1, 1,
0.8934788, 0.3104776, 0.6943666, 0.7686275, 0, 1, 1,
0.898328, 0.7505108, 1.631511, 0.7764706, 0, 1, 1,
0.9095395, -0.9654664, 2.409794, 0.7803922, 0, 1, 1,
0.9096921, -2.599835, 3.148288, 0.7882353, 0, 1, 1,
0.9105214, -0.425695, 1.971858, 0.7921569, 0, 1, 1,
0.9221547, -1.953076, 2.072188, 0.8, 0, 1, 1,
0.9284869, -0.2088503, 1.109932, 0.8078431, 0, 1, 1,
0.9301192, -1.602746, 2.884971, 0.8117647, 0, 1, 1,
0.9306171, -0.4594953, 2.093744, 0.8196079, 0, 1, 1,
0.9340934, 0.5647725, -0.05532584, 0.8235294, 0, 1, 1,
0.9410904, -1.184289, 3.071609, 0.8313726, 0, 1, 1,
0.9414982, 0.08858781, 0.8715588, 0.8352941, 0, 1, 1,
0.9424071, 1.440816, -0.1127362, 0.8431373, 0, 1, 1,
0.9583091, 1.339106, -0.744975, 0.8470588, 0, 1, 1,
0.9590257, 0.3506966, 0.9733958, 0.854902, 0, 1, 1,
0.9594693, 0.9565738, 0.4018679, 0.8588235, 0, 1, 1,
0.9612889, -0.6670219, 1.355719, 0.8666667, 0, 1, 1,
0.9659373, 1.206278, 0.1117388, 0.8705882, 0, 1, 1,
0.9730137, -0.02174326, 2.986938, 0.8784314, 0, 1, 1,
0.9762254, 0.50756, 1.337758, 0.8823529, 0, 1, 1,
0.9778654, 0.758514, 0.3070037, 0.8901961, 0, 1, 1,
0.9800979, 0.188746, 2.787897, 0.8941177, 0, 1, 1,
0.981356, -0.954213, 2.667885, 0.9019608, 0, 1, 1,
0.9820977, -0.8679129, 1.296562, 0.9098039, 0, 1, 1,
0.9879855, -0.667601, 1.656328, 0.9137255, 0, 1, 1,
0.9937812, 0.3302234, 1.549331, 0.9215686, 0, 1, 1,
0.9990801, -0.314724, 0.3048337, 0.9254902, 0, 1, 1,
1.00887, -0.440755, 0.7529269, 0.9333333, 0, 1, 1,
1.009826, -0.8521508, 2.05146, 0.9372549, 0, 1, 1,
1.017103, 0.3825165, 0.2910093, 0.945098, 0, 1, 1,
1.020431, 1.192913, -0.2045882, 0.9490196, 0, 1, 1,
1.021704, -0.7725633, 0.7587969, 0.9568627, 0, 1, 1,
1.025822, -0.1892525, 1.336715, 0.9607843, 0, 1, 1,
1.026443, -0.1940516, 0.9988329, 0.9686275, 0, 1, 1,
1.032848, -1.073461, 2.805931, 0.972549, 0, 1, 1,
1.03646, -0.5255423, 2.90963, 0.9803922, 0, 1, 1,
1.042883, -1.042438, 0.9356844, 0.9843137, 0, 1, 1,
1.047541, 1.612626, -0.01117287, 0.9921569, 0, 1, 1,
1.055637, -0.64815, 3.02763, 0.9960784, 0, 1, 1,
1.058801, -0.1138413, 2.494332, 1, 0, 0.9960784, 1,
1.061598, -1.211121, 0.6659926, 1, 0, 0.9882353, 1,
1.065533, -0.4849987, 1.367503, 1, 0, 0.9843137, 1,
1.069989, -1.657465, 3.766511, 1, 0, 0.9764706, 1,
1.08283, -1.888339, 2.580582, 1, 0, 0.972549, 1,
1.088549, 0.01944795, 2.967765, 1, 0, 0.9647059, 1,
1.089748, 1.537848, -0.05473105, 1, 0, 0.9607843, 1,
1.091744, 0.03385751, 0.8342912, 1, 0, 0.9529412, 1,
1.094209, 0.04806573, 0.01723638, 1, 0, 0.9490196, 1,
1.103724, 0.4018826, 0.7905942, 1, 0, 0.9411765, 1,
1.107597, 0.7823215, 1.241557, 1, 0, 0.9372549, 1,
1.117968, -1.086989, 2.308491, 1, 0, 0.9294118, 1,
1.125354, -1.14387, 3.665264, 1, 0, 0.9254902, 1,
1.125597, 0.5251856, 0.5559918, 1, 0, 0.9176471, 1,
1.12835, 0.09481173, 1.24779, 1, 0, 0.9137255, 1,
1.129456, -0.3224885, 2.381699, 1, 0, 0.9058824, 1,
1.131194, 1.209253, 2.122581, 1, 0, 0.9019608, 1,
1.138737, 0.8323193, 1.658094, 1, 0, 0.8941177, 1,
1.138898, -0.6376118, 3.0769, 1, 0, 0.8862745, 1,
1.147039, 0.3542656, 1.908139, 1, 0, 0.8823529, 1,
1.151844, 0.7470653, 0.9638068, 1, 0, 0.8745098, 1,
1.153298, 0.1317728, 0.1065013, 1, 0, 0.8705882, 1,
1.159885, -1.151115, 1.42778, 1, 0, 0.8627451, 1,
1.164153, 1.055908, 2.248718, 1, 0, 0.8588235, 1,
1.169938, -0.1315388, 1.63517, 1, 0, 0.8509804, 1,
1.175664, 0.5820335, 1.66681, 1, 0, 0.8470588, 1,
1.182927, -1.436958, 2.875506, 1, 0, 0.8392157, 1,
1.18798, -0.2520666, 2.236619, 1, 0, 0.8352941, 1,
1.189036, 1.250884, -0.01800171, 1, 0, 0.827451, 1,
1.190185, -0.08908286, 0.1458855, 1, 0, 0.8235294, 1,
1.194373, 0.5523705, 0.4097446, 1, 0, 0.8156863, 1,
1.195318, 2.92668, -1.130371, 1, 0, 0.8117647, 1,
1.195973, 0.8679427, -1.415777, 1, 0, 0.8039216, 1,
1.203509, 0.7647294, 1.559374, 1, 0, 0.7960784, 1,
1.204484, -1.320823, 1.68006, 1, 0, 0.7921569, 1,
1.206823, 1.095531, 0.4972023, 1, 0, 0.7843137, 1,
1.214134, 0.4296341, 0.7366738, 1, 0, 0.7803922, 1,
1.221009, -0.3099464, 0.7410004, 1, 0, 0.772549, 1,
1.221729, 1.581659, 0.02886077, 1, 0, 0.7686275, 1,
1.225772, 0.8676922, -0.2341392, 1, 0, 0.7607843, 1,
1.228527, 0.5764225, 0.6578229, 1, 0, 0.7568628, 1,
1.231872, -0.6454552, 2.009876, 1, 0, 0.7490196, 1,
1.244846, 1.679173, 1.998775, 1, 0, 0.7450981, 1,
1.255008, -0.808375, 0.1880276, 1, 0, 0.7372549, 1,
1.275826, -1.430937, 3.671578, 1, 0, 0.7333333, 1,
1.291765, -0.4126866, 2.352298, 1, 0, 0.7254902, 1,
1.291848, -1.639177, 2.345545, 1, 0, 0.7215686, 1,
1.301605, -0.5002091, 0.6082926, 1, 0, 0.7137255, 1,
1.311614, 0.6190247, 0.8410112, 1, 0, 0.7098039, 1,
1.315665, 0.1056057, 0.1841181, 1, 0, 0.7019608, 1,
1.321564, -1.674128, 1.413691, 1, 0, 0.6941177, 1,
1.324538, 1.093335, 0.3130849, 1, 0, 0.6901961, 1,
1.326399, -0.3257824, 3.325311, 1, 0, 0.682353, 1,
1.329639, -0.7135591, 1.673634, 1, 0, 0.6784314, 1,
1.330596, -1.097121, 3.213107, 1, 0, 0.6705883, 1,
1.331115, -0.5047781, 2.283658, 1, 0, 0.6666667, 1,
1.33747, -0.5092099, 2.803708, 1, 0, 0.6588235, 1,
1.338512, 0.2257791, 0.906004, 1, 0, 0.654902, 1,
1.338956, 0.8142729, 0.9386814, 1, 0, 0.6470588, 1,
1.341158, -0.4457046, 1.059816, 1, 0, 0.6431373, 1,
1.344106, 0.3569024, -1.38765, 1, 0, 0.6352941, 1,
1.345247, 1.437315, 0.597492, 1, 0, 0.6313726, 1,
1.361881, -1.767498, 4.117118, 1, 0, 0.6235294, 1,
1.368345, 2.718037, 0.9309938, 1, 0, 0.6196079, 1,
1.371248, 3.269904, 1.888538, 1, 0, 0.6117647, 1,
1.386299, 0.197566, 1.202689, 1, 0, 0.6078432, 1,
1.391321, 1.054159, 1.169231, 1, 0, 0.6, 1,
1.40743, 0.4642242, -0.5454656, 1, 0, 0.5921569, 1,
1.411659, -1.611335, 2.264521, 1, 0, 0.5882353, 1,
1.422717, -0.8907214, 2.581495, 1, 0, 0.5803922, 1,
1.423666, 0.4929477, 0.3109534, 1, 0, 0.5764706, 1,
1.423885, -0.4057019, 2.693165, 1, 0, 0.5686275, 1,
1.434521, 0.2334467, 1.411358, 1, 0, 0.5647059, 1,
1.437132, 0.1102585, 2.408196, 1, 0, 0.5568628, 1,
1.448386, 0.5156471, 1.702073, 1, 0, 0.5529412, 1,
1.46317, -0.9933336, 1.814886, 1, 0, 0.5450981, 1,
1.480439, -0.1915015, -0.6817355, 1, 0, 0.5411765, 1,
1.482008, 1.76482, 0.6127129, 1, 0, 0.5333334, 1,
1.485917, -1.311818, 2.936921, 1, 0, 0.5294118, 1,
1.49046, 1.760427, 1.156353, 1, 0, 0.5215687, 1,
1.49303, 0.7289087, 2.914837, 1, 0, 0.5176471, 1,
1.49499, -0.4788021, 2.470694, 1, 0, 0.509804, 1,
1.498309, -1.092146, 2.691556, 1, 0, 0.5058824, 1,
1.500132, -0.3027832, -0.05438335, 1, 0, 0.4980392, 1,
1.515676, 0.5578873, 0.1155502, 1, 0, 0.4901961, 1,
1.516764, -1.259628, 3.168227, 1, 0, 0.4862745, 1,
1.517588, 0.301989, 2.818571, 1, 0, 0.4784314, 1,
1.530702, 1.31426, 0.4704917, 1, 0, 0.4745098, 1,
1.536067, 0.1748943, 0.8184908, 1, 0, 0.4666667, 1,
1.538019, 0.9691309, 1.760447, 1, 0, 0.4627451, 1,
1.544605, -0.1773391, 0.2862727, 1, 0, 0.454902, 1,
1.554006, 0.82361, 0.6587354, 1, 0, 0.4509804, 1,
1.564161, 0.949286, 1.98875, 1, 0, 0.4431373, 1,
1.569037, 0.513279, 1.694438, 1, 0, 0.4392157, 1,
1.5846, 1.042492, -0.4470906, 1, 0, 0.4313726, 1,
1.590289, -0.2353039, 1.94645, 1, 0, 0.427451, 1,
1.59835, 0.6849863, -0.5482485, 1, 0, 0.4196078, 1,
1.598562, 0.3976233, 3.014618, 1, 0, 0.4156863, 1,
1.605038, 1.330711, 1.604116, 1, 0, 0.4078431, 1,
1.611591, 0.147613, 1.729509, 1, 0, 0.4039216, 1,
1.611938, 0.9605521, 0.3446065, 1, 0, 0.3960784, 1,
1.61272, -0.768688, 2.240738, 1, 0, 0.3882353, 1,
1.61636, -0.02507524, 2.812562, 1, 0, 0.3843137, 1,
1.621266, 0.3102539, 0.1194598, 1, 0, 0.3764706, 1,
1.621896, 0.3642062, 1.033971, 1, 0, 0.372549, 1,
1.635675, 0.1819107, 0.6976036, 1, 0, 0.3647059, 1,
1.648293, -2.379854, 2.096895, 1, 0, 0.3607843, 1,
1.669449, -0.7956496, 2.488468, 1, 0, 0.3529412, 1,
1.678443, 1.673187, 1.459455, 1, 0, 0.3490196, 1,
1.680491, 1.903834, -0.1212064, 1, 0, 0.3411765, 1,
1.702426, -1.457707, 1.76096, 1, 0, 0.3372549, 1,
1.709292, -0.836703, 3.607426, 1, 0, 0.3294118, 1,
1.710605, -0.5208917, 0.6502435, 1, 0, 0.3254902, 1,
1.724717, -0.4757022, 1.550155, 1, 0, 0.3176471, 1,
1.728244, -0.8003902, 1.625185, 1, 0, 0.3137255, 1,
1.737953, 0.6379016, 1.587508, 1, 0, 0.3058824, 1,
1.783781, -0.9560443, 2.939832, 1, 0, 0.2980392, 1,
1.788022, -0.6074396, 2.022452, 1, 0, 0.2941177, 1,
1.789824, 0.8379769, 0.4013532, 1, 0, 0.2862745, 1,
1.793496, -1.210679, 1.370482, 1, 0, 0.282353, 1,
1.796804, 0.3469074, 1.421109, 1, 0, 0.2745098, 1,
1.798732, 0.2436754, 1.131162, 1, 0, 0.2705882, 1,
1.802671, -0.3594093, 1.393092, 1, 0, 0.2627451, 1,
1.810966, -0.2561219, 1.569921, 1, 0, 0.2588235, 1,
1.854031, 1.960445, 0.254397, 1, 0, 0.2509804, 1,
1.866825, 0.6406205, 1.910559, 1, 0, 0.2470588, 1,
1.867133, -1.260498, 0.8655621, 1, 0, 0.2392157, 1,
1.881279, 0.3409094, 1.66142, 1, 0, 0.2352941, 1,
1.902446, -1.309296, 1.868591, 1, 0, 0.227451, 1,
1.919992, 0.1742398, 4.14897, 1, 0, 0.2235294, 1,
1.973908, 0.6200169, 0.7549974, 1, 0, 0.2156863, 1,
1.986015, -0.617429, 2.09052, 1, 0, 0.2117647, 1,
1.987947, 1.291512, 1.246548, 1, 0, 0.2039216, 1,
2.007355, -1.218989, -0.1719281, 1, 0, 0.1960784, 1,
2.018541, 1.835338, -0.2241077, 1, 0, 0.1921569, 1,
2.02126, 0.6293103, 0.9473398, 1, 0, 0.1843137, 1,
2.024969, 0.7126622, 1.226338, 1, 0, 0.1803922, 1,
2.043073, -1.171593, 0.5943698, 1, 0, 0.172549, 1,
2.047475, 0.8504764, -0.5738187, 1, 0, 0.1686275, 1,
2.103687, 0.2119863, 0.4428463, 1, 0, 0.1607843, 1,
2.104902, 1.062265, 2.341375, 1, 0, 0.1568628, 1,
2.114017, -0.5011792, 2.738532, 1, 0, 0.1490196, 1,
2.117682, 1.397448, 0.202115, 1, 0, 0.145098, 1,
2.132118, 0.480965, 2.48274, 1, 0, 0.1372549, 1,
2.171374, 1.867865, 0.7189828, 1, 0, 0.1333333, 1,
2.17944, 1.532881, 1.335679, 1, 0, 0.1254902, 1,
2.220989, -0.7260841, 3.725664, 1, 0, 0.1215686, 1,
2.230272, -0.8467236, 0.5564935, 1, 0, 0.1137255, 1,
2.231323, -0.2546173, 0.9353234, 1, 0, 0.1098039, 1,
2.235615, -0.7627615, 1.116768, 1, 0, 0.1019608, 1,
2.237609, -0.1492047, 1.701393, 1, 0, 0.09411765, 1,
2.239402, 0.004218989, 2.026939, 1, 0, 0.09019608, 1,
2.258325, -0.7960769, 1.218826, 1, 0, 0.08235294, 1,
2.27817, 0.8584684, -0.257079, 1, 0, 0.07843138, 1,
2.292013, -0.06185634, 2.082113, 1, 0, 0.07058824, 1,
2.347, 1.231118, 1.217926, 1, 0, 0.06666667, 1,
2.352778, 0.3176917, 1.719249, 1, 0, 0.05882353, 1,
2.368207, -1.611125, 1.758392, 1, 0, 0.05490196, 1,
2.412677, 0.3047872, 1.842804, 1, 0, 0.04705882, 1,
2.434425, 0.4728236, 0.2690523, 1, 0, 0.04313726, 1,
2.493533, -0.3371688, 0.4831699, 1, 0, 0.03529412, 1,
2.54243, -0.6510575, 3.153636, 1, 0, 0.03137255, 1,
2.55225, -0.4877727, 2.754648, 1, 0, 0.02352941, 1,
2.599046, 1.209056, 1.811358, 1, 0, 0.01960784, 1,
2.834525, 0.4624851, 2.204123, 1, 0, 0.01176471, 1,
2.999304, -1.585215, 3.789845, 1, 0, 0.007843138, 1
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
0.01787972, -3.916711, -6.4014, 0, -0.5, 0.5, 0.5,
0.01787972, -3.916711, -6.4014, 1, -0.5, 0.5, 0.5,
0.01787972, -3.916711, -6.4014, 1, 1.5, 0.5, 0.5,
0.01787972, -3.916711, -6.4014, 0, 1.5, 0.5, 0.5
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
-3.974247, 0.3115039, -6.4014, 0, -0.5, 0.5, 0.5,
-3.974247, 0.3115039, -6.4014, 1, -0.5, 0.5, 0.5,
-3.974247, 0.3115039, -6.4014, 1, 1.5, 0.5, 0.5,
-3.974247, 0.3115039, -6.4014, 0, 1.5, 0.5, 0.5
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
-3.974247, -3.916711, 0.1188107, 0, -0.5, 0.5, 0.5,
-3.974247, -3.916711, 0.1188107, 1, -0.5, 0.5, 0.5,
-3.974247, -3.916711, 0.1188107, 1, 1.5, 0.5, 0.5,
-3.974247, -3.916711, 0.1188107, 0, 1.5, 0.5, 0.5
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
-2, -2.940969, -4.896736,
2, -2.940969, -4.896736,
-2, -2.940969, -4.896736,
-2, -3.103593, -5.147513,
-1, -2.940969, -4.896736,
-1, -3.103593, -5.147513,
0, -2.940969, -4.896736,
0, -3.103593, -5.147513,
1, -2.940969, -4.896736,
1, -3.103593, -5.147513,
2, -2.940969, -4.896736,
2, -3.103593, -5.147513
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
-2, -3.42884, -5.649068, 0, -0.5, 0.5, 0.5,
-2, -3.42884, -5.649068, 1, -0.5, 0.5, 0.5,
-2, -3.42884, -5.649068, 1, 1.5, 0.5, 0.5,
-2, -3.42884, -5.649068, 0, 1.5, 0.5, 0.5,
-1, -3.42884, -5.649068, 0, -0.5, 0.5, 0.5,
-1, -3.42884, -5.649068, 1, -0.5, 0.5, 0.5,
-1, -3.42884, -5.649068, 1, 1.5, 0.5, 0.5,
-1, -3.42884, -5.649068, 0, 1.5, 0.5, 0.5,
0, -3.42884, -5.649068, 0, -0.5, 0.5, 0.5,
0, -3.42884, -5.649068, 1, -0.5, 0.5, 0.5,
0, -3.42884, -5.649068, 1, 1.5, 0.5, 0.5,
0, -3.42884, -5.649068, 0, 1.5, 0.5, 0.5,
1, -3.42884, -5.649068, 0, -0.5, 0.5, 0.5,
1, -3.42884, -5.649068, 1, -0.5, 0.5, 0.5,
1, -3.42884, -5.649068, 1, 1.5, 0.5, 0.5,
1, -3.42884, -5.649068, 0, 1.5, 0.5, 0.5,
2, -3.42884, -5.649068, 0, -0.5, 0.5, 0.5,
2, -3.42884, -5.649068, 1, -0.5, 0.5, 0.5,
2, -3.42884, -5.649068, 1, 1.5, 0.5, 0.5,
2, -3.42884, -5.649068, 0, 1.5, 0.5, 0.5
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
-3.052987, -2, -4.896736,
-3.052987, 3, -4.896736,
-3.052987, -2, -4.896736,
-3.206531, -2, -5.147513,
-3.052987, -1, -4.896736,
-3.206531, -1, -5.147513,
-3.052987, 0, -4.896736,
-3.206531, 0, -5.147513,
-3.052987, 1, -4.896736,
-3.206531, 1, -5.147513,
-3.052987, 2, -4.896736,
-3.206531, 2, -5.147513,
-3.052987, 3, -4.896736,
-3.206531, 3, -5.147513
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
-3.513618, -2, -5.649068, 0, -0.5, 0.5, 0.5,
-3.513618, -2, -5.649068, 1, -0.5, 0.5, 0.5,
-3.513618, -2, -5.649068, 1, 1.5, 0.5, 0.5,
-3.513618, -2, -5.649068, 0, 1.5, 0.5, 0.5,
-3.513618, -1, -5.649068, 0, -0.5, 0.5, 0.5,
-3.513618, -1, -5.649068, 1, -0.5, 0.5, 0.5,
-3.513618, -1, -5.649068, 1, 1.5, 0.5, 0.5,
-3.513618, -1, -5.649068, 0, 1.5, 0.5, 0.5,
-3.513618, 0, -5.649068, 0, -0.5, 0.5, 0.5,
-3.513618, 0, -5.649068, 1, -0.5, 0.5, 0.5,
-3.513618, 0, -5.649068, 1, 1.5, 0.5, 0.5,
-3.513618, 0, -5.649068, 0, 1.5, 0.5, 0.5,
-3.513618, 1, -5.649068, 0, -0.5, 0.5, 0.5,
-3.513618, 1, -5.649068, 1, -0.5, 0.5, 0.5,
-3.513618, 1, -5.649068, 1, 1.5, 0.5, 0.5,
-3.513618, 1, -5.649068, 0, 1.5, 0.5, 0.5,
-3.513618, 2, -5.649068, 0, -0.5, 0.5, 0.5,
-3.513618, 2, -5.649068, 1, -0.5, 0.5, 0.5,
-3.513618, 2, -5.649068, 1, 1.5, 0.5, 0.5,
-3.513618, 2, -5.649068, 0, 1.5, 0.5, 0.5,
-3.513618, 3, -5.649068, 0, -0.5, 0.5, 0.5,
-3.513618, 3, -5.649068, 1, -0.5, 0.5, 0.5,
-3.513618, 3, -5.649068, 1, 1.5, 0.5, 0.5,
-3.513618, 3, -5.649068, 0, 1.5, 0.5, 0.5
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
-3.052987, -2.940969, -4,
-3.052987, -2.940969, 4,
-3.052987, -2.940969, -4,
-3.206531, -3.103593, -4,
-3.052987, -2.940969, -2,
-3.206531, -3.103593, -2,
-3.052987, -2.940969, 0,
-3.206531, -3.103593, 0,
-3.052987, -2.940969, 2,
-3.206531, -3.103593, 2,
-3.052987, -2.940969, 4,
-3.206531, -3.103593, 4
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
-3.513618, -3.42884, -4, 0, -0.5, 0.5, 0.5,
-3.513618, -3.42884, -4, 1, -0.5, 0.5, 0.5,
-3.513618, -3.42884, -4, 1, 1.5, 0.5, 0.5,
-3.513618, -3.42884, -4, 0, 1.5, 0.5, 0.5,
-3.513618, -3.42884, -2, 0, -0.5, 0.5, 0.5,
-3.513618, -3.42884, -2, 1, -0.5, 0.5, 0.5,
-3.513618, -3.42884, -2, 1, 1.5, 0.5, 0.5,
-3.513618, -3.42884, -2, 0, 1.5, 0.5, 0.5,
-3.513618, -3.42884, 0, 0, -0.5, 0.5, 0.5,
-3.513618, -3.42884, 0, 1, -0.5, 0.5, 0.5,
-3.513618, -3.42884, 0, 1, 1.5, 0.5, 0.5,
-3.513618, -3.42884, 0, 0, 1.5, 0.5, 0.5,
-3.513618, -3.42884, 2, 0, -0.5, 0.5, 0.5,
-3.513618, -3.42884, 2, 1, -0.5, 0.5, 0.5,
-3.513618, -3.42884, 2, 1, 1.5, 0.5, 0.5,
-3.513618, -3.42884, 2, 0, 1.5, 0.5, 0.5,
-3.513618, -3.42884, 4, 0, -0.5, 0.5, 0.5,
-3.513618, -3.42884, 4, 1, -0.5, 0.5, 0.5,
-3.513618, -3.42884, 4, 1, 1.5, 0.5, 0.5,
-3.513618, -3.42884, 4, 0, 1.5, 0.5, 0.5
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
-3.052987, -2.940969, -4.896736,
-3.052987, 3.563977, -4.896736,
-3.052987, -2.940969, 5.134357,
-3.052987, 3.563977, 5.134357,
-3.052987, -2.940969, -4.896736,
-3.052987, -2.940969, 5.134357,
-3.052987, 3.563977, -4.896736,
-3.052987, 3.563977, 5.134357,
-3.052987, -2.940969, -4.896736,
3.088747, -2.940969, -4.896736,
-3.052987, -2.940969, 5.134357,
3.088747, -2.940969, 5.134357,
-3.052987, 3.563977, -4.896736,
3.088747, 3.563977, -4.896736,
-3.052987, 3.563977, 5.134357,
3.088747, 3.563977, 5.134357,
3.088747, -2.940969, -4.896736,
3.088747, 3.563977, -4.896736,
3.088747, -2.940969, 5.134357,
3.088747, 3.563977, 5.134357,
3.088747, -2.940969, -4.896736,
3.088747, -2.940969, 5.134357,
3.088747, 3.563977, -4.896736,
3.088747, 3.563977, 5.134357
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
var radius = 7.177185;
var distance = 31.93211;
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
mvMatrix.translate( -0.01787972, -0.3115039, -0.1188107 );
mvMatrix.scale( 1.263505, 1.192956, 0.7736059 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.93211);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
ZnSO4<-read.table("ZnSO4.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ZnSO4$V2
```

```
## Error in eval(expr, envir, enclos): object 'ZnSO4' not found
```

```r
y<-ZnSO4$V3
```

```
## Error in eval(expr, envir, enclos): object 'ZnSO4' not found
```

```r
z<-ZnSO4$V4
```

```
## Error in eval(expr, envir, enclos): object 'ZnSO4' not found
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
-2.963545, -0.1889948, -2.249067, 0, 0, 1, 1, 1,
-2.784065, -1.303537, -2.13094, 1, 0, 0, 1, 1,
-2.527676, -0.4123309, -2.193554, 1, 0, 0, 1, 1,
-2.489836, -0.3260862, -2.412267, 1, 0, 0, 1, 1,
-2.429628, 0.4450665, -1.074412, 1, 0, 0, 1, 1,
-2.393047, -1.572405, -2.353456, 1, 0, 0, 1, 1,
-2.29886, 0.3867446, -1.792131, 0, 0, 0, 1, 1,
-2.294084, -0.3821906, -1.345604, 0, 0, 0, 1, 1,
-2.232034, 0.09165963, -2.175623, 0, 0, 0, 1, 1,
-2.14503, 0.7858116, -2.325756, 0, 0, 0, 1, 1,
-2.138833, 0.5619394, -1.472372, 0, 0, 0, 1, 1,
-2.124595, -0.4460439, -0.7783748, 0, 0, 0, 1, 1,
-2.047748, -1.090305, -2.49828, 0, 0, 0, 1, 1,
-2.039439, 1.066945, -2.019855, 1, 1, 1, 1, 1,
-2.032367, 0.1255876, -0.6278304, 1, 1, 1, 1, 1,
-2.012711, -0.4313837, -2.710358, 1, 1, 1, 1, 1,
-2.004509, -0.4618258, -1.361445, 1, 1, 1, 1, 1,
-1.98337, 0.665714, -1.26815, 1, 1, 1, 1, 1,
-1.978658, -0.2117972, -2.129191, 1, 1, 1, 1, 1,
-1.977436, 0.1634067, -1.893608, 1, 1, 1, 1, 1,
-1.958745, 0.6786631, -0.550563, 1, 1, 1, 1, 1,
-1.957822, -0.8055202, -0.4865284, 1, 1, 1, 1, 1,
-1.95362, -0.1970787, -0.1594199, 1, 1, 1, 1, 1,
-1.939042, -1.202041, -2.849844, 1, 1, 1, 1, 1,
-1.933465, -0.4219843, -1.281134, 1, 1, 1, 1, 1,
-1.916031, 1.171796, -0.911319, 1, 1, 1, 1, 1,
-1.900604, 0.3391017, -2.403696, 1, 1, 1, 1, 1,
-1.854595, 2.153882, -1.133941, 1, 1, 1, 1, 1,
-1.849018, 0.7930121, 0.04696197, 0, 0, 1, 1, 1,
-1.824326, -0.6755097, -1.097342, 1, 0, 0, 1, 1,
-1.818593, -0.7839453, -2.364048, 1, 0, 0, 1, 1,
-1.802275, -0.8870567, -2.499144, 1, 0, 0, 1, 1,
-1.7852, -1.23646, -2.268818, 1, 0, 0, 1, 1,
-1.783155, 1.056651, -0.9676507, 1, 0, 0, 1, 1,
-1.770778, -2.846237, -4.093231, 0, 0, 0, 1, 1,
-1.753891, 0.4678622, -1.950113, 0, 0, 0, 1, 1,
-1.751709, 2.172303, -1.118809, 0, 0, 0, 1, 1,
-1.68855, 0.2536643, -1.132306, 0, 0, 0, 1, 1,
-1.688254, -0.4975813, -2.145762, 0, 0, 0, 1, 1,
-1.683028, -1.176037, -3.245456, 0, 0, 0, 1, 1,
-1.674265, -1.203364, -1.299653, 0, 0, 0, 1, 1,
-1.664079, 0.8153026, -0.6243926, 1, 1, 1, 1, 1,
-1.661271, -0.04125652, -2.727271, 1, 1, 1, 1, 1,
-1.647081, 1.060387, -1.815338, 1, 1, 1, 1, 1,
-1.626022, -0.5111852, -3.241875, 1, 1, 1, 1, 1,
-1.603933, 1.862143, 0.07818112, 1, 1, 1, 1, 1,
-1.594048, -1.660574, -3.925566, 1, 1, 1, 1, 1,
-1.570838, 0.1411495, -0.7241969, 1, 1, 1, 1, 1,
-1.564639, -0.06706686, -1.676394, 1, 1, 1, 1, 1,
-1.530712, 0.6742187, 0.5442873, 1, 1, 1, 1, 1,
-1.529833, -0.7421346, -1.283495, 1, 1, 1, 1, 1,
-1.521649, -1.286137, -2.474642, 1, 1, 1, 1, 1,
-1.517298, -0.2015927, -0.02413327, 1, 1, 1, 1, 1,
-1.517147, -0.2200864, -0.7920763, 1, 1, 1, 1, 1,
-1.511361, 1.577849, -1.401584, 1, 1, 1, 1, 1,
-1.508121, -0.7521742, -1.963197, 1, 1, 1, 1, 1,
-1.5064, 0.0596494, -0.6735921, 0, 0, 1, 1, 1,
-1.503535, -0.01248941, 0.2656192, 1, 0, 0, 1, 1,
-1.49914, -1.985874, -2.450264, 1, 0, 0, 1, 1,
-1.471039, 1.637584, -0.5215688, 1, 0, 0, 1, 1,
-1.464693, 0.9691052, -0.6300893, 1, 0, 0, 1, 1,
-1.46449, -1.047009, -3.578955, 1, 0, 0, 1, 1,
-1.458767, -0.3985351, -3.018396, 0, 0, 0, 1, 1,
-1.456889, 1.538938, -2.416925, 0, 0, 0, 1, 1,
-1.45312, -0.2664708, -0.3190263, 0, 0, 0, 1, 1,
-1.450385, -0.04899914, -2.947354, 0, 0, 0, 1, 1,
-1.44972, 0.5007973, -0.9742676, 0, 0, 0, 1, 1,
-1.41877, 1.470449, -1.144002, 0, 0, 0, 1, 1,
-1.401051, 1.875388, -1.615718, 0, 0, 0, 1, 1,
-1.397845, -0.3110408, -1.701706, 1, 1, 1, 1, 1,
-1.396388, 0.8140265, -1.556798, 1, 1, 1, 1, 1,
-1.396018, -0.3491411, -3.046025, 1, 1, 1, 1, 1,
-1.39454, -1.350857, -4.556264, 1, 1, 1, 1, 1,
-1.37267, 0.3721938, -2.904155, 1, 1, 1, 1, 1,
-1.369289, -0.1189695, -2.108765, 1, 1, 1, 1, 1,
-1.366377, 0.04013265, -0.9020602, 1, 1, 1, 1, 1,
-1.363114, 1.46648, -3.220436, 1, 1, 1, 1, 1,
-1.363073, -0.277952, -2.879619, 1, 1, 1, 1, 1,
-1.354753, 0.1368602, -0.9042594, 1, 1, 1, 1, 1,
-1.35311, -1.56957, -2.018731, 1, 1, 1, 1, 1,
-1.348605, 0.3076511, 0.2283026, 1, 1, 1, 1, 1,
-1.336502, -1.856587, -2.015687, 1, 1, 1, 1, 1,
-1.332857, -1.214401, -3.042298, 1, 1, 1, 1, 1,
-1.313366, 1.274698, -2.488666, 1, 1, 1, 1, 1,
-1.310706, -1.238157, -2.286378, 0, 0, 1, 1, 1,
-1.304863, 1.359894, -0.07327075, 1, 0, 0, 1, 1,
-1.299508, -0.3924209, -3.311214, 1, 0, 0, 1, 1,
-1.297066, 0.6163096, -0.3056359, 1, 0, 0, 1, 1,
-1.296845, 0.1661275, -2.29397, 1, 0, 0, 1, 1,
-1.295041, -1.70841, -3.537602, 1, 0, 0, 1, 1,
-1.291042, 0.4539623, -2.90428, 0, 0, 0, 1, 1,
-1.282757, -0.02546757, -0.4127984, 0, 0, 0, 1, 1,
-1.279446, 0.8813164, -0.9718958, 0, 0, 0, 1, 1,
-1.271366, 0.7985488, -4.060551, 0, 0, 0, 1, 1,
-1.266805, 0.1365286, -0.923458, 0, 0, 0, 1, 1,
-1.254583, -0.3566915, -1.290672, 0, 0, 0, 1, 1,
-1.251531, -1.04852, -0.1585381, 0, 0, 0, 1, 1,
-1.239515, -0.3365585, -0.9993237, 1, 1, 1, 1, 1,
-1.239432, -1.423275, -2.230765, 1, 1, 1, 1, 1,
-1.237472, 0.6928257, 0.2085494, 1, 1, 1, 1, 1,
-1.231843, -1.21802, -2.320899, 1, 1, 1, 1, 1,
-1.226934, -0.6258619, -3.171812, 1, 1, 1, 1, 1,
-1.226376, -0.8002101, -2.555884, 1, 1, 1, 1, 1,
-1.219735, -0.4406878, -1.869215, 1, 1, 1, 1, 1,
-1.219427, 1.268231, -1.059612, 1, 1, 1, 1, 1,
-1.217878, -0.01608507, -1.038465, 1, 1, 1, 1, 1,
-1.215286, 1.425028, 0.09920442, 1, 1, 1, 1, 1,
-1.20768, 0.4521005, -0.291727, 1, 1, 1, 1, 1,
-1.206638, -1.512657, -2.300254, 1, 1, 1, 1, 1,
-1.187599, 0.7877918, 0.7853203, 1, 1, 1, 1, 1,
-1.178084, 0.6610867, -0.5279893, 1, 1, 1, 1, 1,
-1.175506, 0.3696884, 0.1620895, 1, 1, 1, 1, 1,
-1.175382, -1.040161, -4.075497, 0, 0, 1, 1, 1,
-1.17399, -0.1633514, -3.684937, 1, 0, 0, 1, 1,
-1.171727, -0.9239342, -2.095553, 1, 0, 0, 1, 1,
-1.167307, 0.9873058, -1.659398, 1, 0, 0, 1, 1,
-1.161227, -1.015188, -3.795207, 1, 0, 0, 1, 1,
-1.156302, -0.7104223, -3.951443, 1, 0, 0, 1, 1,
-1.148406, -0.5667627, -2.011239, 0, 0, 0, 1, 1,
-1.148325, -0.6535757, -2.050335, 0, 0, 0, 1, 1,
-1.133178, 0.7516828, -1.789068, 0, 0, 0, 1, 1,
-1.129578, 1.077712, -1.282282, 0, 0, 0, 1, 1,
-1.127918, 0.1335951, -1.072436, 0, 0, 0, 1, 1,
-1.120098, 0.4563617, 0.2280931, 0, 0, 0, 1, 1,
-1.111732, 1.751316, -0.9009395, 0, 0, 0, 1, 1,
-1.096109, -0.01114504, -1.499128, 1, 1, 1, 1, 1,
-1.091372, -0.1457103, -0.08283332, 1, 1, 1, 1, 1,
-1.087412, -2.312356, -1.782784, 1, 1, 1, 1, 1,
-1.086064, -0.2120353, -3.501534, 1, 1, 1, 1, 1,
-1.082983, 0.9764766, 0.1413161, 1, 1, 1, 1, 1,
-1.078525, 0.03395416, -0.3580322, 1, 1, 1, 1, 1,
-1.077566, -0.9970125, -2.519257, 1, 1, 1, 1, 1,
-1.076855, 1.71385, -0.01664057, 1, 1, 1, 1, 1,
-1.070575, 0.471461, -0.005289761, 1, 1, 1, 1, 1,
-1.070114, -1.743636, -2.747685, 1, 1, 1, 1, 1,
-1.065552, 0.1710113, -1.104981, 1, 1, 1, 1, 1,
-1.060823, 1.166823, -0.2928497, 1, 1, 1, 1, 1,
-1.058783, 1.406456, -0.9278694, 1, 1, 1, 1, 1,
-1.051268, 1.419032, 0.705824, 1, 1, 1, 1, 1,
-1.048596, 0.3179462, -2.573325, 1, 1, 1, 1, 1,
-1.041132, -0.4337535, 0.05409673, 0, 0, 1, 1, 1,
-1.040354, 1.37108, -0.7322539, 1, 0, 0, 1, 1,
-1.032983, -0.3858584, -2.716683, 1, 0, 0, 1, 1,
-1.026359, -0.3404419, -3.184582, 1, 0, 0, 1, 1,
-1.023109, -0.2420315, -1.018968, 1, 0, 0, 1, 1,
-1.022298, 1.202667, 1.000923, 1, 0, 0, 1, 1,
-1.020941, 1.313571, 0.02238421, 0, 0, 0, 1, 1,
-1.02077, 0.5991154, -1.930361, 0, 0, 0, 1, 1,
-1.018421, -0.3943104, -2.858268, 0, 0, 0, 1, 1,
-1.014551, 0.3631095, -1.761888, 0, 0, 0, 1, 1,
-1.014084, -0.5657443, -1.792068, 0, 0, 0, 1, 1,
-0.9994825, 0.2061215, -1.788328, 0, 0, 0, 1, 1,
-0.9994516, 1.245373, -1.357008, 0, 0, 0, 1, 1,
-0.9948328, 0.6982347, -1.693156, 1, 1, 1, 1, 1,
-0.9915267, -0.208239, -1.423305, 1, 1, 1, 1, 1,
-0.9846476, -0.3899943, -1.476517, 1, 1, 1, 1, 1,
-0.9808651, 1.685317, -0.3819596, 1, 1, 1, 1, 1,
-0.9801692, -0.8284079, -1.983873, 1, 1, 1, 1, 1,
-0.978246, -0.2043415, -1.65743, 1, 1, 1, 1, 1,
-0.9616569, -0.1561504, -0.7854983, 1, 1, 1, 1, 1,
-0.9593349, -1.76537, -2.577834, 1, 1, 1, 1, 1,
-0.9584269, 1.925223, 0.9879372, 1, 1, 1, 1, 1,
-0.958075, -2.10353, -2.160256, 1, 1, 1, 1, 1,
-0.9526848, -0.597308, -0.7492869, 1, 1, 1, 1, 1,
-0.9469281, -1.472657, -1.945931, 1, 1, 1, 1, 1,
-0.9466837, -0.1010426, -1.528923, 1, 1, 1, 1, 1,
-0.9377972, -1.078431, -3.919322, 1, 1, 1, 1, 1,
-0.9348312, 1.385973, -0.9081603, 1, 1, 1, 1, 1,
-0.925124, 0.2023711, -1.182574, 0, 0, 1, 1, 1,
-0.9217989, -0.5907978, -2.104686, 1, 0, 0, 1, 1,
-0.9117071, -1.099564, -1.900247, 1, 0, 0, 1, 1,
-0.9087017, 0.1037342, -1.001197, 1, 0, 0, 1, 1,
-0.9069226, -0.05058497, -1.472864, 1, 0, 0, 1, 1,
-0.9041318, -0.6246735, -0.01612327, 1, 0, 0, 1, 1,
-0.9027546, 0.148289, -1.351447, 0, 0, 0, 1, 1,
-0.8981508, -2.020379, -3.787248, 0, 0, 0, 1, 1,
-0.891701, -0.9471146, -2.959796, 0, 0, 0, 1, 1,
-0.8785042, -0.03566059, -3.078797, 0, 0, 0, 1, 1,
-0.8750761, 0.05774343, -3.171566, 0, 0, 0, 1, 1,
-0.8738368, -0.008184638, -1.51071, 0, 0, 0, 1, 1,
-0.8711236, 0.6322381, -1.431352, 0, 0, 0, 1, 1,
-0.8689643, 0.1329633, -1.61624, 1, 1, 1, 1, 1,
-0.8675529, 0.02369626, -1.930637, 1, 1, 1, 1, 1,
-0.8613801, 0.3560502, -3.020317, 1, 1, 1, 1, 1,
-0.8518769, -1.963699, -4.032225, 1, 1, 1, 1, 1,
-0.845815, 1.517956, 1.50278, 1, 1, 1, 1, 1,
-0.8336183, -1.078001, -3.58936, 1, 1, 1, 1, 1,
-0.8322874, 0.9757738, -1.044998, 1, 1, 1, 1, 1,
-0.8296432, -1.245791, -1.540859, 1, 1, 1, 1, 1,
-0.8141786, 1.25325, -0.2820501, 1, 1, 1, 1, 1,
-0.790952, -0.3011018, -2.189494, 1, 1, 1, 1, 1,
-0.7801762, -0.1488945, -0.0577752, 1, 1, 1, 1, 1,
-0.7755142, 0.6148432, 0.3582111, 1, 1, 1, 1, 1,
-0.7711772, -0.08828828, -3.873489, 1, 1, 1, 1, 1,
-0.7709782, -0.08768772, -1.630646, 1, 1, 1, 1, 1,
-0.7694111, -0.2238142, -1.149342, 1, 1, 1, 1, 1,
-0.7675833, 0.03524109, -2.418245, 0, 0, 1, 1, 1,
-0.764109, -0.1498771, -1.103369, 1, 0, 0, 1, 1,
-0.756171, 0.06756645, 0.2030874, 1, 0, 0, 1, 1,
-0.7542883, 0.1152673, -0.7845874, 1, 0, 0, 1, 1,
-0.7512646, -0.5757831, -2.080543, 1, 0, 0, 1, 1,
-0.7422627, 0.5271538, -0.9859501, 1, 0, 0, 1, 1,
-0.74154, 0.6197596, 0.1693143, 0, 0, 0, 1, 1,
-0.7372298, -0.6037836, -2.717409, 0, 0, 0, 1, 1,
-0.72171, -0.3078213, -0.9435377, 0, 0, 0, 1, 1,
-0.7179047, -0.2202279, -2.047243, 0, 0, 0, 1, 1,
-0.7127435, -0.7776218, -0.7766168, 0, 0, 0, 1, 1,
-0.7105203, 0.8008727, -0.2077075, 0, 0, 0, 1, 1,
-0.7077916, 0.5749876, -0.3423445, 0, 0, 0, 1, 1,
-0.7064583, 1.285014, -1.309768, 1, 1, 1, 1, 1,
-0.6977611, 1.116924, 0.4916264, 1, 1, 1, 1, 1,
-0.6970457, -0.3679911, -1.743293, 1, 1, 1, 1, 1,
-0.6894268, -2.122332, -3.728482, 1, 1, 1, 1, 1,
-0.6848349, 0.006993228, 0.4479946, 1, 1, 1, 1, 1,
-0.6845638, -0.8863621, -1.204716, 1, 1, 1, 1, 1,
-0.6835415, 0.1625907, -0.8705317, 1, 1, 1, 1, 1,
-0.6805149, 0.9171887, -1.187531, 1, 1, 1, 1, 1,
-0.6798428, -1.427588, -2.334306, 1, 1, 1, 1, 1,
-0.6771027, -0.1467756, -3.044647, 1, 1, 1, 1, 1,
-0.6721765, 0.5769379, -2.217307, 1, 1, 1, 1, 1,
-0.6681747, -0.7642767, -1.584172, 1, 1, 1, 1, 1,
-0.667382, 0.1858801, -2.017483, 1, 1, 1, 1, 1,
-0.6625009, 0.3760909, -0.3869604, 1, 1, 1, 1, 1,
-0.6616391, 2.678935, -0.6514867, 1, 1, 1, 1, 1,
-0.6564426, -1.344007, -3.723396, 0, 0, 1, 1, 1,
-0.655966, 3.236834, -0.0709125, 1, 0, 0, 1, 1,
-0.6537601, 1.167421, -0.4665032, 1, 0, 0, 1, 1,
-0.6523569, 1.25482, -1.821599, 1, 0, 0, 1, 1,
-0.652169, 1.663403, 1.037292, 1, 0, 0, 1, 1,
-0.6491289, 0.5326743, -0.9145465, 1, 0, 0, 1, 1,
-0.6473009, 0.2632785, -1.03864, 0, 0, 0, 1, 1,
-0.6460735, 2.841738, -0.1251347, 0, 0, 0, 1, 1,
-0.644951, -1.649336, -4.697872, 0, 0, 0, 1, 1,
-0.6429611, 2.354204, 0.1425568, 0, 0, 0, 1, 1,
-0.6422623, 0.2187634, -1.956134, 0, 0, 0, 1, 1,
-0.6405154, 0.3080176, -0.7649054, 0, 0, 0, 1, 1,
-0.6285014, 1.697833, 1.252717, 0, 0, 0, 1, 1,
-0.6215405, 3.177087, -0.6737443, 1, 1, 1, 1, 1,
-0.6195422, -1.214039, -2.111087, 1, 1, 1, 1, 1,
-0.612048, -2.176757, -3.373413, 1, 1, 1, 1, 1,
-0.6110367, 0.1753345, -0.8661904, 1, 1, 1, 1, 1,
-0.607664, 1.286633, -1.12694, 1, 1, 1, 1, 1,
-0.6067339, -1.82573, -1.840796, 1, 1, 1, 1, 1,
-0.6035843, -2.068316, -2.393904, 1, 1, 1, 1, 1,
-0.5991803, 2.251126, -0.2590684, 1, 1, 1, 1, 1,
-0.5921001, 0.4761707, 0.7909863, 1, 1, 1, 1, 1,
-0.5885518, -0.9338903, -1.208066, 1, 1, 1, 1, 1,
-0.5849472, -0.5767617, -1.781616, 1, 1, 1, 1, 1,
-0.5826315, -1.009059, -4.342706, 1, 1, 1, 1, 1,
-0.5796261, -0.2740447, -0.6418248, 1, 1, 1, 1, 1,
-0.5773079, -0.9812474, -0.6609193, 1, 1, 1, 1, 1,
-0.5754602, -0.8725688, -2.598394, 1, 1, 1, 1, 1,
-0.5723819, -0.6382686, -1.339811, 0, 0, 1, 1, 1,
-0.5712536, 1.722329, -1.753115, 1, 0, 0, 1, 1,
-0.5699147, -0.1147552, -0.235144, 1, 0, 0, 1, 1,
-0.5679965, -1.04711, -3.16237, 1, 0, 0, 1, 1,
-0.5663006, 0.01302578, -1.797711, 1, 0, 0, 1, 1,
-0.5661223, -0.6683282, -4.278259, 1, 0, 0, 1, 1,
-0.5628267, -1.138906, -3.317861, 0, 0, 0, 1, 1,
-0.5622061, 0.7672889, 0.4663506, 0, 0, 0, 1, 1,
-0.5602226, 1.972048, 1.570766, 0, 0, 0, 1, 1,
-0.5596897, -1.146393, -4.579217, 0, 0, 0, 1, 1,
-0.5591703, 0.6197419, -0.8883191, 0, 0, 0, 1, 1,
-0.5509439, -0.867264, -2.207702, 0, 0, 0, 1, 1,
-0.5465642, 0.3327471, -0.7984282, 0, 0, 0, 1, 1,
-0.5455909, 1.096682, 0.821639, 1, 1, 1, 1, 1,
-0.5411161, 0.2182319, 1.909001, 1, 1, 1, 1, 1,
-0.5393924, 0.9527079, -1.667869, 1, 1, 1, 1, 1,
-0.5367352, 0.8062036, -0.6190679, 1, 1, 1, 1, 1,
-0.5347511, 1.095202, -1.288515, 1, 1, 1, 1, 1,
-0.5308191, -0.3991481, -1.925883, 1, 1, 1, 1, 1,
-0.5293224, -0.9966778, -2.495707, 1, 1, 1, 1, 1,
-0.5257836, 0.9767075, 1.06163, 1, 1, 1, 1, 1,
-0.5251779, 0.5314422, -0.9227069, 1, 1, 1, 1, 1,
-0.5225622, 1.398988, -0.9212213, 1, 1, 1, 1, 1,
-0.5206503, 0.4296845, -0.81963, 1, 1, 1, 1, 1,
-0.5202386, -1.219408, -3.176602, 1, 1, 1, 1, 1,
-0.5200964, -0.1363708, -1.387051, 1, 1, 1, 1, 1,
-0.5110106, 1.332324, -0.9661446, 1, 1, 1, 1, 1,
-0.5109051, 0.3495227, -0.6936498, 1, 1, 1, 1, 1,
-0.5107561, 0.6356636, -1.127246, 0, 0, 1, 1, 1,
-0.510497, -0.5557266, -1.398264, 1, 0, 0, 1, 1,
-0.5074807, -0.7238322, -2.294828, 1, 0, 0, 1, 1,
-0.5069958, -0.2942874, -2.896118, 1, 0, 0, 1, 1,
-0.5063983, -1.156587, -2.175199, 1, 0, 0, 1, 1,
-0.503073, 0.6097242, 0.3087238, 1, 0, 0, 1, 1,
-0.5004368, -0.6665432, -3.518294, 0, 0, 0, 1, 1,
-0.4949657, 0.7468554, -1.034264, 0, 0, 0, 1, 1,
-0.4925295, 1.688152, -0.2031561, 0, 0, 0, 1, 1,
-0.4884927, -0.9737, -3.239654, 0, 0, 0, 1, 1,
-0.4846049, 1.447883, 1.366693, 0, 0, 0, 1, 1,
-0.4836268, -0.9610624, -1.758607, 0, 0, 0, 1, 1,
-0.4787389, -0.06339882, -1.90377, 0, 0, 0, 1, 1,
-0.4782266, -0.3741006, -1.051496, 1, 1, 1, 1, 1,
-0.4753418, 0.08781097, 0.1004716, 1, 1, 1, 1, 1,
-0.4712843, -0.7361506, -2.16477, 1, 1, 1, 1, 1,
-0.4671665, 1.488133, -0.3745039, 1, 1, 1, 1, 1,
-0.4671108, -0.7584431, -2.620581, 1, 1, 1, 1, 1,
-0.4664554, 1.572072, 0.9533363, 1, 1, 1, 1, 1,
-0.4663735, -0.1839369, -2.818127, 1, 1, 1, 1, 1,
-0.4646325, -0.7376173, -0.8097885, 1, 1, 1, 1, 1,
-0.4630035, -0.5612769, -2.186956, 1, 1, 1, 1, 1,
-0.4619674, 0.9356257, -1.046767, 1, 1, 1, 1, 1,
-0.4614027, -1.106061, -1.886006, 1, 1, 1, 1, 1,
-0.4580557, 0.6562929, 0.009016654, 1, 1, 1, 1, 1,
-0.4556665, 2.329988, 0.2533451, 1, 1, 1, 1, 1,
-0.4552576, -0.322303, -3.049258, 1, 1, 1, 1, 1,
-0.4511061, -0.2107552, -2.221446, 1, 1, 1, 1, 1,
-0.4503389, 0.1017526, -2.503496, 0, 0, 1, 1, 1,
-0.4499872, 0.218358, 1.348072, 1, 0, 0, 1, 1,
-0.4489977, 1.606296, 0.9675107, 1, 0, 0, 1, 1,
-0.4470013, 0.2433396, -0.7319574, 1, 0, 0, 1, 1,
-0.4461039, 0.891072, 0.1259249, 1, 0, 0, 1, 1,
-0.4429987, 2.172849, 0.2178333, 1, 0, 0, 1, 1,
-0.4413195, -2.167035, -3.071077, 0, 0, 0, 1, 1,
-0.4354257, 0.1000783, -1.615136, 0, 0, 0, 1, 1,
-0.4318919, 0.309758, -1.051725, 0, 0, 0, 1, 1,
-0.4313948, 1.549011, 0.6879324, 0, 0, 0, 1, 1,
-0.4275942, -1.952632, -4.164974, 0, 0, 0, 1, 1,
-0.42427, -0.6951873, -3.615974, 0, 0, 0, 1, 1,
-0.4212151, 1.168696, -0.3273169, 0, 0, 0, 1, 1,
-0.4211051, 2.182825, 0.1776571, 1, 1, 1, 1, 1,
-0.4138608, 0.3329914, -0.7028373, 1, 1, 1, 1, 1,
-0.4125104, 0.6493745, 0.03655035, 1, 1, 1, 1, 1,
-0.4099494, -0.8274733, -2.380599, 1, 1, 1, 1, 1,
-0.4056622, -0.7433572, -2.85446, 1, 1, 1, 1, 1,
-0.4055922, 0.4241186, -1.77379, 1, 1, 1, 1, 1,
-0.4005524, 0.3739271, 0.1679011, 1, 1, 1, 1, 1,
-0.3980352, -0.5602318, -1.693412, 1, 1, 1, 1, 1,
-0.3907385, -1.159918, -3.37427, 1, 1, 1, 1, 1,
-0.3906632, -0.5781589, -3.241605, 1, 1, 1, 1, 1,
-0.3859567, -1.577388, -2.267743, 1, 1, 1, 1, 1,
-0.3795544, 0.8092037, -0.2069162, 1, 1, 1, 1, 1,
-0.3793391, 1.390674, -1.584054, 1, 1, 1, 1, 1,
-0.3788264, -0.9116065, -2.38182, 1, 1, 1, 1, 1,
-0.3777068, 0.6255229, 0.08092288, 1, 1, 1, 1, 1,
-0.3718626, 0.7059472, -1.924246, 0, 0, 1, 1, 1,
-0.368833, 0.5822734, -1.610237, 1, 0, 0, 1, 1,
-0.3678572, 0.5372787, -1.286224, 1, 0, 0, 1, 1,
-0.3646955, 1.922854, 0.3187354, 1, 0, 0, 1, 1,
-0.3628271, 0.1499344, -0.7678196, 1, 0, 0, 1, 1,
-0.3609811, -1.145218, -2.243462, 1, 0, 0, 1, 1,
-0.3601104, -0.2193453, -2.910708, 0, 0, 0, 1, 1,
-0.3590722, -0.9710732, -4.008153, 0, 0, 0, 1, 1,
-0.3569075, -0.7329165, -3.301996, 0, 0, 0, 1, 1,
-0.3483011, -0.5148845, -1.574535, 0, 0, 0, 1, 1,
-0.3476839, -1.198391, -1.804117, 0, 0, 0, 1, 1,
-0.3447047, 0.2134944, -1.875395, 0, 0, 0, 1, 1,
-0.3445636, 1.066327, -0.5305187, 0, 0, 0, 1, 1,
-0.3442675, -0.364089, -2.374838, 1, 1, 1, 1, 1,
-0.3442062, 1.512861, -0.345639, 1, 1, 1, 1, 1,
-0.3384992, 0.06195405, -3.106321, 1, 1, 1, 1, 1,
-0.3371834, 0.9020715, 1.837747, 1, 1, 1, 1, 1,
-0.3366227, -0.07740273, -3.145451, 1, 1, 1, 1, 1,
-0.3353516, -0.9401865, -3.287115, 1, 1, 1, 1, 1,
-0.3332234, 0.8507974, -1.547907, 1, 1, 1, 1, 1,
-0.3328308, -0.2639073, -2.202283, 1, 1, 1, 1, 1,
-0.3313267, -0.08859304, 0.01439519, 1, 1, 1, 1, 1,
-0.3284479, -0.5161164, -3.491465, 1, 1, 1, 1, 1,
-0.3274335, 1.727248, 0.3655772, 1, 1, 1, 1, 1,
-0.326231, -0.7569067, -1.72726, 1, 1, 1, 1, 1,
-0.3252613, 1.654961, 0.5435376, 1, 1, 1, 1, 1,
-0.3243971, 0.4249492, 0.9257702, 1, 1, 1, 1, 1,
-0.3171982, 0.4030015, -3.001636, 1, 1, 1, 1, 1,
-0.3154908, 0.7685522, -0.7935791, 0, 0, 1, 1, 1,
-0.3153305, -0.3350872, -4.25627, 1, 0, 0, 1, 1,
-0.3142669, -2.079327, -2.024086, 1, 0, 0, 1, 1,
-0.3137369, 1.500019, 1.65445, 1, 0, 0, 1, 1,
-0.3119263, -1.579978, -3.341095, 1, 0, 0, 1, 1,
-0.3102734, -0.1615892, -1.659308, 1, 0, 0, 1, 1,
-0.3094903, -0.2857935, -1.02611, 0, 0, 0, 1, 1,
-0.3037344, -0.2826292, -1.480327, 0, 0, 0, 1, 1,
-0.3034174, 2.110917, 0.4877079, 0, 0, 0, 1, 1,
-0.2980222, -1.177742, -4.134094, 0, 0, 0, 1, 1,
-0.2924262, -0.865109, -2.850312, 0, 0, 0, 1, 1,
-0.2909814, 0.7348028, -2.850959, 0, 0, 0, 1, 1,
-0.2877259, -0.2507132, -0.9451624, 0, 0, 0, 1, 1,
-0.2872956, 0.5750279, -0.3270754, 1, 1, 1, 1, 1,
-0.28474, -0.7704693, -3.431264, 1, 1, 1, 1, 1,
-0.2820581, -0.5748657, -1.085197, 1, 1, 1, 1, 1,
-0.2787523, 0.6697929, 0.3972114, 1, 1, 1, 1, 1,
-0.272198, 0.1460311, -1.626354, 1, 1, 1, 1, 1,
-0.2677638, -0.3173392, -3.395384, 1, 1, 1, 1, 1,
-0.2656373, 1.728956, -0.1498035, 1, 1, 1, 1, 1,
-0.2645797, 0.001751764, -0.8226439, 1, 1, 1, 1, 1,
-0.2592302, -0.0933815, -1.110309, 1, 1, 1, 1, 1,
-0.2578883, -1.938617, -2.928391, 1, 1, 1, 1, 1,
-0.2569754, 2.981725, -0.05815125, 1, 1, 1, 1, 1,
-0.252994, -0.6452034, -3.624317, 1, 1, 1, 1, 1,
-0.2498933, -0.1974149, -2.410209, 1, 1, 1, 1, 1,
-0.2488245, 0.3829411, -0.7485267, 1, 1, 1, 1, 1,
-0.2416061, 0.6289993, -0.353571, 1, 1, 1, 1, 1,
-0.2331124, -0.2504739, 0.1235458, 0, 0, 1, 1, 1,
-0.2319297, -0.7537022, -3.696023, 1, 0, 0, 1, 1,
-0.2317947, -1.165432, -3.478055, 1, 0, 0, 1, 1,
-0.229519, 0.1122999, -1.081508, 1, 0, 0, 1, 1,
-0.2284524, 0.7464677, -0.7327974, 1, 0, 0, 1, 1,
-0.2240363, 0.93242, 0.2118075, 1, 0, 0, 1, 1,
-0.2202171, 0.8238368, -0.4962778, 0, 0, 0, 1, 1,
-0.2162523, 0.605392, -1.499143, 0, 0, 0, 1, 1,
-0.2151961, 0.6288421, 0.1263792, 0, 0, 0, 1, 1,
-0.2150779, -0.7799127, -2.566216, 0, 0, 0, 1, 1,
-0.2103686, 0.787769, 0.2197971, 0, 0, 0, 1, 1,
-0.2076017, -1.069488, -4.004126, 0, 0, 0, 1, 1,
-0.2072048, 0.1390208, -1.885559, 0, 0, 0, 1, 1,
-0.2029525, -2.126129, -4.071644, 1, 1, 1, 1, 1,
-0.2009658, -0.5040249, -3.86617, 1, 1, 1, 1, 1,
-0.2004592, 0.4799515, -1.627709, 1, 1, 1, 1, 1,
-0.1963293, 0.6227295, 0.1829046, 1, 1, 1, 1, 1,
-0.1945119, 0.6031942, -0.7440171, 1, 1, 1, 1, 1,
-0.1925561, -0.4824854, -3.68384, 1, 1, 1, 1, 1,
-0.1897154, 0.4040608, -0.4366938, 1, 1, 1, 1, 1,
-0.1892675, -1.317109, -3.64638, 1, 1, 1, 1, 1,
-0.1887963, -0.5188579, -2.038483, 1, 1, 1, 1, 1,
-0.1880616, -0.2912538, -2.349857, 1, 1, 1, 1, 1,
-0.1854405, 0.8218448, 0.2565554, 1, 1, 1, 1, 1,
-0.1813737, 0.8012452, -0.9494634, 1, 1, 1, 1, 1,
-0.1806501, -0.4821037, -2.675286, 1, 1, 1, 1, 1,
-0.1799773, -0.6757106, -3.821294, 1, 1, 1, 1, 1,
-0.1782216, -1.135979, -2.247685, 1, 1, 1, 1, 1,
-0.1778711, -0.6607797, -3.874388, 0, 0, 1, 1, 1,
-0.1768174, 0.6954961, -0.9732237, 1, 0, 0, 1, 1,
-0.1743653, -0.0600042, -1.569223, 1, 0, 0, 1, 1,
-0.1742794, -0.7128404, -2.420186, 1, 0, 0, 1, 1,
-0.1740335, 0.4751446, 0.4787886, 1, 0, 0, 1, 1,
-0.1736973, -1.258931, -2.717317, 1, 0, 0, 1, 1,
-0.1733661, -0.744639, -2.997388, 0, 0, 0, 1, 1,
-0.1712562, -0.9492043, -2.173962, 0, 0, 0, 1, 1,
-0.1669168, -0.6702718, -1.5765, 0, 0, 0, 1, 1,
-0.1658754, -2.263947, -3.786053, 0, 0, 0, 1, 1,
-0.1657835, -0.8908177, -2.493958, 0, 0, 0, 1, 1,
-0.1651279, 2.321416, 0.4804102, 0, 0, 0, 1, 1,
-0.1650339, -0.8341326, -2.806143, 0, 0, 0, 1, 1,
-0.1610041, 0.4901491, -0.7139106, 1, 1, 1, 1, 1,
-0.1606352, 1.042954, -0.8970221, 1, 1, 1, 1, 1,
-0.1588661, -0.1991668, -3.903687, 1, 1, 1, 1, 1,
-0.1545508, -0.6278381, -2.891147, 1, 1, 1, 1, 1,
-0.1527977, -0.7613231, -2.963708, 1, 1, 1, 1, 1,
-0.1483127, 0.04736624, -2.904513, 1, 1, 1, 1, 1,
-0.1471162, 1.113521, -0.5442778, 1, 1, 1, 1, 1,
-0.1452388, 0.6998932, -1.152155, 1, 1, 1, 1, 1,
-0.1452242, 0.8956563, 2.199738, 1, 1, 1, 1, 1,
-0.1415867, 1.626776, -0.08535868, 1, 1, 1, 1, 1,
-0.1412003, -0.6142284, -3.289709, 1, 1, 1, 1, 1,
-0.137864, -0.2236388, -3.140548, 1, 1, 1, 1, 1,
-0.1368466, -0.9311641, -2.477147, 1, 1, 1, 1, 1,
-0.1336738, -1.354, -4.016271, 1, 1, 1, 1, 1,
-0.1320933, -0.6916396, -2.140733, 1, 1, 1, 1, 1,
-0.1299849, 0.8366014, -0.5535682, 0, 0, 1, 1, 1,
-0.1277661, -0.2689224, -3.977327, 1, 0, 0, 1, 1,
-0.1277095, -0.1268908, -4.099618, 1, 0, 0, 1, 1,
-0.1240917, 0.007593654, -2.040022, 1, 0, 0, 1, 1,
-0.121678, 1.826585, -0.8400503, 1, 0, 0, 1, 1,
-0.1167706, 0.2346311, -1.079477, 1, 0, 0, 1, 1,
-0.115155, 2.043509, -1.503509, 0, 0, 0, 1, 1,
-0.1133737, -0.418019, -2.523744, 0, 0, 0, 1, 1,
-0.11043, 0.06698154, -1.392607, 0, 0, 0, 1, 1,
-0.1056886, -1.660895, -2.048692, 0, 0, 0, 1, 1,
-0.1030882, -0.1172166, -3.25812, 0, 0, 0, 1, 1,
-0.1025376, -0.1968947, -2.292154, 0, 0, 0, 1, 1,
-0.1019829, 0.0586511, -2.274867, 0, 0, 0, 1, 1,
-0.09872202, -1.270675, -1.120673, 1, 1, 1, 1, 1,
-0.09819987, 0.1549381, -1.71419, 1, 1, 1, 1, 1,
-0.09767699, -0.2384927, -2.924893, 1, 1, 1, 1, 1,
-0.09460288, -1.35047, -4.750652, 1, 1, 1, 1, 1,
-0.09435772, 0.2087316, 0.5746959, 1, 1, 1, 1, 1,
-0.09423673, 0.4527267, -0.03726134, 1, 1, 1, 1, 1,
-0.0941559, -1.84945, -3.283807, 1, 1, 1, 1, 1,
-0.09328593, 1.026729, -1.118045, 1, 1, 1, 1, 1,
-0.09287087, 0.7483335, -2.219234, 1, 1, 1, 1, 1,
-0.08819295, 0.4026971, 0.1197462, 1, 1, 1, 1, 1,
-0.08397433, -1.323718, -2.754548, 1, 1, 1, 1, 1,
-0.08068395, -0.142381, -2.068761, 1, 1, 1, 1, 1,
-0.07621055, -0.6040619, -3.676909, 1, 1, 1, 1, 1,
-0.07619213, 0.2688798, 0.9577664, 1, 1, 1, 1, 1,
-0.07590324, -1.540014, -4.690142, 1, 1, 1, 1, 1,
-0.07070752, -0.5236932, -2.581243, 0, 0, 1, 1, 1,
-0.06923802, 1.991586, 2.308656, 1, 0, 0, 1, 1,
-0.06655835, 0.5701274, 1.856016, 1, 0, 0, 1, 1,
-0.05020153, 0.832575, -0.9491867, 1, 0, 0, 1, 1,
-0.04699805, 1.849488, -0.8616452, 1, 0, 0, 1, 1,
-0.04579006, 1.845885, -1.552224, 1, 0, 0, 1, 1,
-0.04415045, 1.893693, -0.2980338, 0, 0, 0, 1, 1,
-0.04413244, 1.281391, -0.870476, 0, 0, 0, 1, 1,
-0.04340732, 0.04777744, 0.9694076, 0, 0, 0, 1, 1,
-0.04277089, -1.033068, -3.09756, 0, 0, 0, 1, 1,
-0.04235257, 0.08873487, -0.3234049, 0, 0, 0, 1, 1,
-0.03718178, -0.5483926, -1.000415, 0, 0, 0, 1, 1,
-0.03221617, -0.4825368, -2.137362, 0, 0, 0, 1, 1,
-0.02695889, 0.6456966, -1.238393, 1, 1, 1, 1, 1,
-0.0267412, 2.271738, 1.040646, 1, 1, 1, 1, 1,
-0.02013838, -0.9641292, -3.015188, 1, 1, 1, 1, 1,
-0.01899591, 0.9496397, -1.47208, 1, 1, 1, 1, 1,
-0.01521731, 1.194874, -0.7118446, 1, 1, 1, 1, 1,
-0.01341967, 1.346464, 0.7931654, 1, 1, 1, 1, 1,
-0.009397727, -1.389553, -2.683018, 1, 1, 1, 1, 1,
-0.003550162, -0.1684757, -4.220365, 1, 1, 1, 1, 1,
-0.001742465, 0.04391975, 0.1441887, 1, 1, 1, 1, 1,
0.001094189, 1.825787, -0.3914678, 1, 1, 1, 1, 1,
0.001607672, -0.9353409, 3.718714, 1, 1, 1, 1, 1,
0.004393601, -0.6886362, 2.933538, 1, 1, 1, 1, 1,
0.007026252, 0.08444174, -1.476752, 1, 1, 1, 1, 1,
0.007224341, -2.368004, 3.070101, 1, 1, 1, 1, 1,
0.01046072, -0.411441, 1.509873, 1, 1, 1, 1, 1,
0.01103862, -0.02049972, 2.398735, 0, 0, 1, 1, 1,
0.01166461, 0.1374792, 0.6765789, 1, 0, 0, 1, 1,
0.01351371, -1.649739, 3.493868, 1, 0, 0, 1, 1,
0.01494623, -0.3382779, 3.256315, 1, 0, 0, 1, 1,
0.01527503, -0.8311681, 4.340728, 1, 0, 0, 1, 1,
0.01593576, 0.3358935, 0.8723937, 1, 0, 0, 1, 1,
0.02471303, 0.2312715, -0.862637, 0, 0, 0, 1, 1,
0.02826509, -0.9225101, 3.115432, 0, 0, 0, 1, 1,
0.03324352, -0.5656452, 3.647989, 0, 0, 0, 1, 1,
0.03337997, 0.334127, 0.3967144, 0, 0, 0, 1, 1,
0.0374269, 0.3532286, -0.7301204, 0, 0, 0, 1, 1,
0.03862666, -0.1338752, 2.136083, 0, 0, 0, 1, 1,
0.04003051, -1.195627, 2.836181, 0, 0, 0, 1, 1,
0.04232088, 1.809885, 0.07269287, 1, 1, 1, 1, 1,
0.0435564, -0.9524523, 3.930331, 1, 1, 1, 1, 1,
0.04674175, 1.234275, -1.156808, 1, 1, 1, 1, 1,
0.05297452, -0.3413241, 3.134438, 1, 1, 1, 1, 1,
0.05357811, -0.3904275, 3.93514, 1, 1, 1, 1, 1,
0.05480682, 1.37721, -0.6947079, 1, 1, 1, 1, 1,
0.0549482, -1.055088, 2.339277, 1, 1, 1, 1, 1,
0.05771414, -0.5598951, 4.097653, 1, 1, 1, 1, 1,
0.06002179, 0.9757323, -1.32205, 1, 1, 1, 1, 1,
0.06488276, 1.419531, 0.3512902, 1, 1, 1, 1, 1,
0.0657326, 0.446164, -0.4952825, 1, 1, 1, 1, 1,
0.06957897, 1.560315, -1.223252, 1, 1, 1, 1, 1,
0.06987558, 1.091429, 0.3442286, 1, 1, 1, 1, 1,
0.07104592, 0.9206982, -0.2802239, 1, 1, 1, 1, 1,
0.07258406, -1.553672, 4.988274, 1, 1, 1, 1, 1,
0.07371227, -0.1947784, 3.050538, 0, 0, 1, 1, 1,
0.07555083, 0.6705964, -0.325544, 1, 0, 0, 1, 1,
0.07765015, -0.2485092, 3.709694, 1, 0, 0, 1, 1,
0.07965366, 0.913469, 1.164935, 1, 0, 0, 1, 1,
0.08043712, -0.544903, 3.655233, 1, 0, 0, 1, 1,
0.08704714, -0.5757044, 4.706157, 1, 0, 0, 1, 1,
0.09516937, -0.9410659, 1.611369, 0, 0, 0, 1, 1,
0.0956286, 0.9040968, -0.116622, 0, 0, 0, 1, 1,
0.09568534, -0.3230367, 2.70813, 0, 0, 0, 1, 1,
0.09716663, -0.09034138, 1.386094, 0, 0, 0, 1, 1,
0.1022454, -1.451786, 3.347982, 0, 0, 0, 1, 1,
0.1045402, -0.4430512, 4.005316, 0, 0, 0, 1, 1,
0.1098082, 0.5210621, -0.4952773, 0, 0, 0, 1, 1,
0.1099336, -1.064289, 2.655767, 1, 1, 1, 1, 1,
0.1099681, 0.05926723, 1.384029, 1, 1, 1, 1, 1,
0.1178089, -0.5893497, 2.005815, 1, 1, 1, 1, 1,
0.1219001, 0.332755, -0.2630262, 1, 1, 1, 1, 1,
0.1267338, 1.667627, -0.3196941, 1, 1, 1, 1, 1,
0.127645, 0.4944554, 1.053984, 1, 1, 1, 1, 1,
0.1311549, 2.171478, -0.4231229, 1, 1, 1, 1, 1,
0.1394725, 0.5833645, -0.4717391, 1, 1, 1, 1, 1,
0.1398743, 0.8492333, 0.6370128, 1, 1, 1, 1, 1,
0.1430443, -1.59885, 3.128755, 1, 1, 1, 1, 1,
0.1432363, 0.6410722, -0.04178988, 1, 1, 1, 1, 1,
0.1481474, -0.5280942, 3.100446, 1, 1, 1, 1, 1,
0.1482261, -1.019251, 1.11699, 1, 1, 1, 1, 1,
0.1488133, 1.382941, 1.130791, 1, 1, 1, 1, 1,
0.1489497, 0.8285301, 0.4299484, 1, 1, 1, 1, 1,
0.1505689, -0.7964678, 1.358996, 0, 0, 1, 1, 1,
0.1627043, 0.3332386, 2.134353, 1, 0, 0, 1, 1,
0.1644914, -0.6087531, 3.835038, 1, 0, 0, 1, 1,
0.1649339, 0.06831233, 0.9975001, 1, 0, 0, 1, 1,
0.1659326, -0.3461258, 2.840132, 1, 0, 0, 1, 1,
0.1677454, -0.3625592, 3.875191, 1, 0, 0, 1, 1,
0.1817444, -0.2992654, 1.590919, 0, 0, 0, 1, 1,
0.1873462, 0.123221, -0.8781618, 0, 0, 0, 1, 1,
0.1875366, -1.609489, 4.094278, 0, 0, 0, 1, 1,
0.1877373, -0.4405361, 3.184855, 0, 0, 0, 1, 1,
0.1904489, 0.4562091, -0.7871093, 0, 0, 0, 1, 1,
0.1908088, -0.3313777, 2.564384, 0, 0, 0, 1, 1,
0.1916316, -0.7599485, 3.84825, 0, 0, 0, 1, 1,
0.1962846, 2.220952, -1.071288, 1, 1, 1, 1, 1,
0.2020797, 0.7893673, -0.652063, 1, 1, 1, 1, 1,
0.2050015, 0.931436, 0.5893202, 1, 1, 1, 1, 1,
0.206504, -0.7615591, 2.172029, 1, 1, 1, 1, 1,
0.2081963, 0.03584511, 1.788403, 1, 1, 1, 1, 1,
0.2137466, 0.3917041, 1.518032, 1, 1, 1, 1, 1,
0.2210038, 0.8356901, 0.3132833, 1, 1, 1, 1, 1,
0.2213704, -0.8723555, 2.303823, 1, 1, 1, 1, 1,
0.224727, -0.09654191, 1.07708, 1, 1, 1, 1, 1,
0.2252906, 0.2061298, -0.02400297, 1, 1, 1, 1, 1,
0.2265825, 1.441409, -1.116081, 1, 1, 1, 1, 1,
0.2276765, 0.510901, 0.6739669, 1, 1, 1, 1, 1,
0.2303646, -0.2379342, 4.913809, 1, 1, 1, 1, 1,
0.2319974, 0.5058043, -0.03729787, 1, 1, 1, 1, 1,
0.2329585, -0.4176551, 4.793244, 1, 1, 1, 1, 1,
0.2334154, 1.819464, 0.08930125, 0, 0, 1, 1, 1,
0.2341939, 1.503381, 1.103685, 1, 0, 0, 1, 1,
0.2347144, 0.6557127, 0.06105723, 1, 0, 0, 1, 1,
0.2349986, 0.2531436, -1.533425, 1, 0, 0, 1, 1,
0.2350482, -0.2177318, 2.640034, 1, 0, 0, 1, 1,
0.2372633, -1.158563, 3.117847, 1, 0, 0, 1, 1,
0.2380179, -1.029693, 3.484333, 0, 0, 0, 1, 1,
0.2389522, -1.157985, 3.661372, 0, 0, 0, 1, 1,
0.2416857, -1.025151, 4.325926, 0, 0, 0, 1, 1,
0.2492323, -0.2435465, 3.721899, 0, 0, 0, 1, 1,
0.2493654, -0.5496401, 2.77758, 0, 0, 0, 1, 1,
0.2523897, -0.04870453, 1.960548, 0, 0, 0, 1, 1,
0.2535751, 0.2113911, 2.165397, 0, 0, 0, 1, 1,
0.2572626, 1.461346, 0.641728, 1, 1, 1, 1, 1,
0.2579483, -0.9623711, 2.069819, 1, 1, 1, 1, 1,
0.2588387, -0.3131577, 1.540893, 1, 1, 1, 1, 1,
0.2631512, 0.1412895, 0.5105005, 1, 1, 1, 1, 1,
0.2671102, 0.7166221, 0.317836, 1, 1, 1, 1, 1,
0.2674241, -0.5589882, 3.892282, 1, 1, 1, 1, 1,
0.2676536, 0.3631015, 4.347268, 1, 1, 1, 1, 1,
0.2698118, -1.339699, 2.180965, 1, 1, 1, 1, 1,
0.2705971, 0.219397, 1.449656, 1, 1, 1, 1, 1,
0.2709115, 1.664129, -0.8053579, 1, 1, 1, 1, 1,
0.2725458, -1.126317, 3.355741, 1, 1, 1, 1, 1,
0.2778103, -1.073849, 2.733169, 1, 1, 1, 1, 1,
0.2787142, 0.8468411, 0.1285745, 1, 1, 1, 1, 1,
0.2814141, 0.2471907, 1.619504, 1, 1, 1, 1, 1,
0.2826498, 0.7533045, 0.108237, 1, 1, 1, 1, 1,
0.2832415, -0.5650498, 2.69662, 0, 0, 1, 1, 1,
0.2871235, -0.595966, 1.626607, 1, 0, 0, 1, 1,
0.289282, 1.032158, 0.7270627, 1, 0, 0, 1, 1,
0.2896974, -1.610445, 4.029455, 1, 0, 0, 1, 1,
0.2985967, 0.6082897, 0.7266614, 1, 0, 0, 1, 1,
0.3040127, -0.05415692, 2.069809, 1, 0, 0, 1, 1,
0.3101945, -0.854348, 2.106965, 0, 0, 0, 1, 1,
0.3114692, 0.3656089, 1.387282, 0, 0, 0, 1, 1,
0.3159422, 0.1774528, 1.072315, 0, 0, 0, 1, 1,
0.3230812, -0.7546123, 3.997032, 0, 0, 0, 1, 1,
0.3268277, -0.4981127, 4.638572, 0, 0, 0, 1, 1,
0.3293226, -0.5809723, 1.446772, 0, 0, 0, 1, 1,
0.3351027, 0.4347183, 1.240142, 0, 0, 0, 1, 1,
0.3351591, 0.3402024, 1.561176, 1, 1, 1, 1, 1,
0.336174, -1.710291, 3.733329, 1, 1, 1, 1, 1,
0.3411364, -1.376467, 2.700969, 1, 1, 1, 1, 1,
0.349817, 0.6727476, -0.400052, 1, 1, 1, 1, 1,
0.3520714, 0.6145496, -1.49711, 1, 1, 1, 1, 1,
0.3531226, -1.66608, 1.810138, 1, 1, 1, 1, 1,
0.3531373, -0.4174272, 4.064422, 1, 1, 1, 1, 1,
0.3533458, -0.8436315, 2.495144, 1, 1, 1, 1, 1,
0.3563711, 0.251512, 0.8904232, 1, 1, 1, 1, 1,
0.3585061, 0.1240644, 2.718218, 1, 1, 1, 1, 1,
0.3585074, -0.9231297, 2.341339, 1, 1, 1, 1, 1,
0.3642626, -1.564452, 2.524365, 1, 1, 1, 1, 1,
0.3745, 0.259012, -0.1203038, 1, 1, 1, 1, 1,
0.3792719, 1.05925, 1.094061, 1, 1, 1, 1, 1,
0.380145, -0.8665317, 1.222824, 1, 1, 1, 1, 1,
0.3820892, 0.6875615, -0.06432079, 0, 0, 1, 1, 1,
0.3822506, 0.3408825, 0.9021457, 1, 0, 0, 1, 1,
0.3827201, -1.283868, 2.432744, 1, 0, 0, 1, 1,
0.3834996, 0.3454047, 0.09993261, 1, 0, 0, 1, 1,
0.393384, -0.1871798, 2.276209, 1, 0, 0, 1, 1,
0.3934259, 0.8227976, 0.5272642, 1, 0, 0, 1, 1,
0.4037142, -0.1949285, 2.451741, 0, 0, 0, 1, 1,
0.404656, -0.3581967, 1.33962, 0, 0, 0, 1, 1,
0.405033, 0.3357209, 0.5932453, 0, 0, 0, 1, 1,
0.4232841, -1.130785, 2.195849, 0, 0, 0, 1, 1,
0.4286217, 1.54451, 0.03264391, 0, 0, 0, 1, 1,
0.4287626, -0.1820977, 3.247984, 0, 0, 0, 1, 1,
0.4352295, 0.3552952, 2.452267, 0, 0, 0, 1, 1,
0.4361543, 0.0004608233, 1.564482, 1, 1, 1, 1, 1,
0.4367246, 0.7043831, 1.176809, 1, 1, 1, 1, 1,
0.4406914, 1.013849, 0.2892208, 1, 1, 1, 1, 1,
0.4425738, -0.5896891, 1.73009, 1, 1, 1, 1, 1,
0.4473265, 0.8619251, -0.7174246, 1, 1, 1, 1, 1,
0.4473372, 0.4331091, -0.7463914, 1, 1, 1, 1, 1,
0.4479228, 0.824013, 0.7422526, 1, 1, 1, 1, 1,
0.4479946, 0.4941269, 1.576062, 1, 1, 1, 1, 1,
0.4483257, 0.8423151, 0.07708893, 1, 1, 1, 1, 1,
0.4488526, 0.1540796, 2.080286, 1, 1, 1, 1, 1,
0.4546565, -0.3682678, 3.64907, 1, 1, 1, 1, 1,
0.4550304, -1.585645, 1.720073, 1, 1, 1, 1, 1,
0.4587683, 1.594539, -0.377365, 1, 1, 1, 1, 1,
0.4590727, 0.09048334, 2.503537, 1, 1, 1, 1, 1,
0.4675584, -0.03861492, 2.996571, 1, 1, 1, 1, 1,
0.4823733, -0.6574041, 3.211978, 0, 0, 1, 1, 1,
0.4839232, 0.2548571, 0.2126152, 1, 0, 0, 1, 1,
0.4844094, -0.523746, 2.58741, 1, 0, 0, 1, 1,
0.4847768, 1.399551, 1.610255, 1, 0, 0, 1, 1,
0.4900132, -0.8091157, 3.26363, 1, 0, 0, 1, 1,
0.4903048, -1.235727, 1.082409, 1, 0, 0, 1, 1,
0.4903315, -1.392224, 3.319113, 0, 0, 0, 1, 1,
0.492523, 0.4646901, 0.3261282, 0, 0, 0, 1, 1,
0.492981, -1.740057, 2.809111, 0, 0, 0, 1, 1,
0.4932537, 0.1526119, 1.64276, 0, 0, 0, 1, 1,
0.4980509, 0.9181433, 0.1566102, 0, 0, 0, 1, 1,
0.4984722, 1.848459, -1.137938, 0, 0, 0, 1, 1,
0.5029247, -0.2288644, 0.7398407, 0, 0, 0, 1, 1,
0.5068461, -0.6576394, 3.495753, 1, 1, 1, 1, 1,
0.5093083, -0.024907, 0.2027885, 1, 1, 1, 1, 1,
0.5093539, 1.417404, -0.045775, 1, 1, 1, 1, 1,
0.5104009, 0.07316355, -0.234028, 1, 1, 1, 1, 1,
0.5149369, -1.023633, 2.712756, 1, 1, 1, 1, 1,
0.5185763, 0.309148, 2.085704, 1, 1, 1, 1, 1,
0.5217195, -0.8100709, 2.080525, 1, 1, 1, 1, 1,
0.523463, 1.484939, 0.2842247, 1, 1, 1, 1, 1,
0.5288554, -0.8014171, 4.921508, 1, 1, 1, 1, 1,
0.5328742, 0.373337, -0.2673489, 1, 1, 1, 1, 1,
0.5354385, 0.1670698, 0.810816, 1, 1, 1, 1, 1,
0.5440043, -1.903368, 2.32998, 1, 1, 1, 1, 1,
0.5442196, -1.281169, 1.228541, 1, 1, 1, 1, 1,
0.5461115, 2.460903, -0.7408236, 1, 1, 1, 1, 1,
0.5462531, -1.379937, 2.551519, 1, 1, 1, 1, 1,
0.5528573, 0.1798283, -1.114044, 0, 0, 1, 1, 1,
0.5534548, -0.3153721, 1.56783, 1, 0, 0, 1, 1,
0.5572555, 1.657513, 2.056666, 1, 0, 0, 1, 1,
0.5584018, -0.620029, 0.3546392, 1, 0, 0, 1, 1,
0.5587579, 1.154116, 1.470396, 1, 0, 0, 1, 1,
0.566828, 2.006973, -0.1901631, 1, 0, 0, 1, 1,
0.5688877, 0.7567901, 1.666055, 0, 0, 0, 1, 1,
0.5689519, 0.5115336, 0.5810527, 0, 0, 0, 1, 1,
0.573503, -0.07504202, 1.174907, 0, 0, 0, 1, 1,
0.575133, 0.09595596, 2.261581, 0, 0, 0, 1, 1,
0.5758908, -1.266741, 4.562263, 0, 0, 0, 1, 1,
0.5771266, 0.1470201, 0.02203442, 0, 0, 0, 1, 1,
0.5806086, -0.1729775, 0.6768647, 0, 0, 0, 1, 1,
0.5851471, -1.350383, 2.071703, 1, 1, 1, 1, 1,
0.5869914, -0.5568056, 3.279769, 1, 1, 1, 1, 1,
0.5878927, -0.9053637, 1.930337, 1, 1, 1, 1, 1,
0.592972, -0.1585214, 1.659222, 1, 1, 1, 1, 1,
0.6042733, 1.009225, 2.891253, 1, 1, 1, 1, 1,
0.6043965, -0.6248123, 2.354425, 1, 1, 1, 1, 1,
0.6049505, -1.255762, 3.694758, 1, 1, 1, 1, 1,
0.605549, 0.07287762, 0.3511537, 1, 1, 1, 1, 1,
0.6129864, -0.5538896, 2.87949, 1, 1, 1, 1, 1,
0.6139919, -0.004381268, -0.7809274, 1, 1, 1, 1, 1,
0.6142688, -0.9926898, 4.710103, 1, 1, 1, 1, 1,
0.6282318, -0.4161179, 2.93756, 1, 1, 1, 1, 1,
0.6321774, 1.331019, 0.01603432, 1, 1, 1, 1, 1,
0.6433525, -0.3980226, 2.191612, 1, 1, 1, 1, 1,
0.6469622, -2.134673, 3.401019, 1, 1, 1, 1, 1,
0.6557281, -1.659954, 3.163287, 0, 0, 1, 1, 1,
0.6570641, 1.30823, 0.4511623, 1, 0, 0, 1, 1,
0.6630303, -1.024737, 1.484157, 1, 0, 0, 1, 1,
0.6643894, 0.220536, 2.074357, 1, 0, 0, 1, 1,
0.666824, 1.546952, 1.166833, 1, 0, 0, 1, 1,
0.6767444, -0.0343323, 3.056578, 1, 0, 0, 1, 1,
0.677595, 0.9996849, 0.3455573, 0, 0, 0, 1, 1,
0.678427, 0.4732785, 2.664489, 0, 0, 0, 1, 1,
0.6806239, 0.7564935, 2.11314, 0, 0, 0, 1, 1,
0.6807868, 0.3740617, 0.4221937, 0, 0, 0, 1, 1,
0.6833462, 0.3814355, 0.844266, 0, 0, 0, 1, 1,
0.6839433, 1.465642, 2.109011, 0, 0, 0, 1, 1,
0.6842813, 1.00826, 0.9024279, 0, 0, 0, 1, 1,
0.6844501, 1.665092, 1.113071, 1, 1, 1, 1, 1,
0.6867822, 0.9047489, 0.9074614, 1, 1, 1, 1, 1,
0.6871653, 1.020978, 1.291708, 1, 1, 1, 1, 1,
0.6917328, 0.5743682, 2.61384, 1, 1, 1, 1, 1,
0.6981516, 0.2042363, -0.1073868, 1, 1, 1, 1, 1,
0.6992132, 0.2683949, 1.928209, 1, 1, 1, 1, 1,
0.7020226, 0.2814577, 2.908396, 1, 1, 1, 1, 1,
0.7020762, -0.8697281, 2.556704, 1, 1, 1, 1, 1,
0.7056581, 1.198366, 0.5377573, 1, 1, 1, 1, 1,
0.7093947, -0.565264, 0.5559959, 1, 1, 1, 1, 1,
0.7131137, 0.3369606, -0.2412755, 1, 1, 1, 1, 1,
0.7181012, -0.3247778, 1.965292, 1, 1, 1, 1, 1,
0.7185828, 0.7459465, 1.677551, 1, 1, 1, 1, 1,
0.7258996, -1.307938, 3.657192, 1, 1, 1, 1, 1,
0.733761, -0.1930561, 0.9653178, 1, 1, 1, 1, 1,
0.743855, -0.2954627, 1.111779, 0, 0, 1, 1, 1,
0.7493172, 1.794037, -0.6022775, 1, 0, 0, 1, 1,
0.7554035, 0.6417019, -0.1724325, 1, 0, 0, 1, 1,
0.7602909, 2.054655, 0.5797126, 1, 0, 0, 1, 1,
0.7661298, -0.9566017, 2.591705, 1, 0, 0, 1, 1,
0.7667366, 1.288414, -0.8102314, 1, 0, 0, 1, 1,
0.7705178, -0.1837893, 1.505337, 0, 0, 0, 1, 1,
0.7720461, -0.3865224, 3.146912, 0, 0, 0, 1, 1,
0.7738873, -0.3772263, 1.607813, 0, 0, 0, 1, 1,
0.7787412, -0.9097645, 1.626145, 0, 0, 0, 1, 1,
0.7835392, 0.3605669, -0.02226893, 0, 0, 0, 1, 1,
0.7856972, -0.3453521, 1.551401, 0, 0, 0, 1, 1,
0.7868728, 1.641872, 0.7756732, 0, 0, 0, 1, 1,
0.7880673, 0.1404189, 1.09854, 1, 1, 1, 1, 1,
0.7880982, -0.0324157, 2.401539, 1, 1, 1, 1, 1,
0.7897269, -1.000081, 2.804447, 1, 1, 1, 1, 1,
0.791203, -1.622905, 3.475845, 1, 1, 1, 1, 1,
0.7927456, 0.4842954, -0.4783919, 1, 1, 1, 1, 1,
0.7939189, 0.2612466, 1.133463, 1, 1, 1, 1, 1,
0.7996104, -0.6936439, 2.476121, 1, 1, 1, 1, 1,
0.8008216, 1.434181, 0.9964817, 1, 1, 1, 1, 1,
0.806572, -2.172819, 4.621743, 1, 1, 1, 1, 1,
0.8114676, 2.0673, 0.2591665, 1, 1, 1, 1, 1,
0.8148568, 0.3755805, 2.939703, 1, 1, 1, 1, 1,
0.8297197, 3.469245, 0.6168995, 1, 1, 1, 1, 1,
0.8358492, -0.1053889, 2.910967, 1, 1, 1, 1, 1,
0.8359725, 1.272755, 1.419422, 1, 1, 1, 1, 1,
0.8369421, -0.0503895, 2.796234, 1, 1, 1, 1, 1,
0.8387258, 0.580947, 1.326547, 0, 0, 1, 1, 1,
0.8391417, -1.999566, 3.457559, 1, 0, 0, 1, 1,
0.8408757, -1.535376, 2.854713, 1, 0, 0, 1, 1,
0.8493295, -1.330504, 2.440198, 1, 0, 0, 1, 1,
0.8582492, -1.280093, 2.05971, 1, 0, 0, 1, 1,
0.8649449, 0.4776985, -0.1045008, 1, 0, 0, 1, 1,
0.8742113, -1.5244, 3.875507, 0, 0, 0, 1, 1,
0.8758038, 0.6065308, -0.9718336, 0, 0, 0, 1, 1,
0.8825865, -0.4252386, 1.308482, 0, 0, 0, 1, 1,
0.8865267, 0.1288799, 3.043111, 0, 0, 0, 1, 1,
0.8911087, 1.917401, 1.126308, 0, 0, 0, 1, 1,
0.8934788, 0.3104776, 0.6943666, 0, 0, 0, 1, 1,
0.898328, 0.7505108, 1.631511, 0, 0, 0, 1, 1,
0.9095395, -0.9654664, 2.409794, 1, 1, 1, 1, 1,
0.9096921, -2.599835, 3.148288, 1, 1, 1, 1, 1,
0.9105214, -0.425695, 1.971858, 1, 1, 1, 1, 1,
0.9221547, -1.953076, 2.072188, 1, 1, 1, 1, 1,
0.9284869, -0.2088503, 1.109932, 1, 1, 1, 1, 1,
0.9301192, -1.602746, 2.884971, 1, 1, 1, 1, 1,
0.9306171, -0.4594953, 2.093744, 1, 1, 1, 1, 1,
0.9340934, 0.5647725, -0.05532584, 1, 1, 1, 1, 1,
0.9410904, -1.184289, 3.071609, 1, 1, 1, 1, 1,
0.9414982, 0.08858781, 0.8715588, 1, 1, 1, 1, 1,
0.9424071, 1.440816, -0.1127362, 1, 1, 1, 1, 1,
0.9583091, 1.339106, -0.744975, 1, 1, 1, 1, 1,
0.9590257, 0.3506966, 0.9733958, 1, 1, 1, 1, 1,
0.9594693, 0.9565738, 0.4018679, 1, 1, 1, 1, 1,
0.9612889, -0.6670219, 1.355719, 1, 1, 1, 1, 1,
0.9659373, 1.206278, 0.1117388, 0, 0, 1, 1, 1,
0.9730137, -0.02174326, 2.986938, 1, 0, 0, 1, 1,
0.9762254, 0.50756, 1.337758, 1, 0, 0, 1, 1,
0.9778654, 0.758514, 0.3070037, 1, 0, 0, 1, 1,
0.9800979, 0.188746, 2.787897, 1, 0, 0, 1, 1,
0.981356, -0.954213, 2.667885, 1, 0, 0, 1, 1,
0.9820977, -0.8679129, 1.296562, 0, 0, 0, 1, 1,
0.9879855, -0.667601, 1.656328, 0, 0, 0, 1, 1,
0.9937812, 0.3302234, 1.549331, 0, 0, 0, 1, 1,
0.9990801, -0.314724, 0.3048337, 0, 0, 0, 1, 1,
1.00887, -0.440755, 0.7529269, 0, 0, 0, 1, 1,
1.009826, -0.8521508, 2.05146, 0, 0, 0, 1, 1,
1.017103, 0.3825165, 0.2910093, 0, 0, 0, 1, 1,
1.020431, 1.192913, -0.2045882, 1, 1, 1, 1, 1,
1.021704, -0.7725633, 0.7587969, 1, 1, 1, 1, 1,
1.025822, -0.1892525, 1.336715, 1, 1, 1, 1, 1,
1.026443, -0.1940516, 0.9988329, 1, 1, 1, 1, 1,
1.032848, -1.073461, 2.805931, 1, 1, 1, 1, 1,
1.03646, -0.5255423, 2.90963, 1, 1, 1, 1, 1,
1.042883, -1.042438, 0.9356844, 1, 1, 1, 1, 1,
1.047541, 1.612626, -0.01117287, 1, 1, 1, 1, 1,
1.055637, -0.64815, 3.02763, 1, 1, 1, 1, 1,
1.058801, -0.1138413, 2.494332, 1, 1, 1, 1, 1,
1.061598, -1.211121, 0.6659926, 1, 1, 1, 1, 1,
1.065533, -0.4849987, 1.367503, 1, 1, 1, 1, 1,
1.069989, -1.657465, 3.766511, 1, 1, 1, 1, 1,
1.08283, -1.888339, 2.580582, 1, 1, 1, 1, 1,
1.088549, 0.01944795, 2.967765, 1, 1, 1, 1, 1,
1.089748, 1.537848, -0.05473105, 0, 0, 1, 1, 1,
1.091744, 0.03385751, 0.8342912, 1, 0, 0, 1, 1,
1.094209, 0.04806573, 0.01723638, 1, 0, 0, 1, 1,
1.103724, 0.4018826, 0.7905942, 1, 0, 0, 1, 1,
1.107597, 0.7823215, 1.241557, 1, 0, 0, 1, 1,
1.117968, -1.086989, 2.308491, 1, 0, 0, 1, 1,
1.125354, -1.14387, 3.665264, 0, 0, 0, 1, 1,
1.125597, 0.5251856, 0.5559918, 0, 0, 0, 1, 1,
1.12835, 0.09481173, 1.24779, 0, 0, 0, 1, 1,
1.129456, -0.3224885, 2.381699, 0, 0, 0, 1, 1,
1.131194, 1.209253, 2.122581, 0, 0, 0, 1, 1,
1.138737, 0.8323193, 1.658094, 0, 0, 0, 1, 1,
1.138898, -0.6376118, 3.0769, 0, 0, 0, 1, 1,
1.147039, 0.3542656, 1.908139, 1, 1, 1, 1, 1,
1.151844, 0.7470653, 0.9638068, 1, 1, 1, 1, 1,
1.153298, 0.1317728, 0.1065013, 1, 1, 1, 1, 1,
1.159885, -1.151115, 1.42778, 1, 1, 1, 1, 1,
1.164153, 1.055908, 2.248718, 1, 1, 1, 1, 1,
1.169938, -0.1315388, 1.63517, 1, 1, 1, 1, 1,
1.175664, 0.5820335, 1.66681, 1, 1, 1, 1, 1,
1.182927, -1.436958, 2.875506, 1, 1, 1, 1, 1,
1.18798, -0.2520666, 2.236619, 1, 1, 1, 1, 1,
1.189036, 1.250884, -0.01800171, 1, 1, 1, 1, 1,
1.190185, -0.08908286, 0.1458855, 1, 1, 1, 1, 1,
1.194373, 0.5523705, 0.4097446, 1, 1, 1, 1, 1,
1.195318, 2.92668, -1.130371, 1, 1, 1, 1, 1,
1.195973, 0.8679427, -1.415777, 1, 1, 1, 1, 1,
1.203509, 0.7647294, 1.559374, 1, 1, 1, 1, 1,
1.204484, -1.320823, 1.68006, 0, 0, 1, 1, 1,
1.206823, 1.095531, 0.4972023, 1, 0, 0, 1, 1,
1.214134, 0.4296341, 0.7366738, 1, 0, 0, 1, 1,
1.221009, -0.3099464, 0.7410004, 1, 0, 0, 1, 1,
1.221729, 1.581659, 0.02886077, 1, 0, 0, 1, 1,
1.225772, 0.8676922, -0.2341392, 1, 0, 0, 1, 1,
1.228527, 0.5764225, 0.6578229, 0, 0, 0, 1, 1,
1.231872, -0.6454552, 2.009876, 0, 0, 0, 1, 1,
1.244846, 1.679173, 1.998775, 0, 0, 0, 1, 1,
1.255008, -0.808375, 0.1880276, 0, 0, 0, 1, 1,
1.275826, -1.430937, 3.671578, 0, 0, 0, 1, 1,
1.291765, -0.4126866, 2.352298, 0, 0, 0, 1, 1,
1.291848, -1.639177, 2.345545, 0, 0, 0, 1, 1,
1.301605, -0.5002091, 0.6082926, 1, 1, 1, 1, 1,
1.311614, 0.6190247, 0.8410112, 1, 1, 1, 1, 1,
1.315665, 0.1056057, 0.1841181, 1, 1, 1, 1, 1,
1.321564, -1.674128, 1.413691, 1, 1, 1, 1, 1,
1.324538, 1.093335, 0.3130849, 1, 1, 1, 1, 1,
1.326399, -0.3257824, 3.325311, 1, 1, 1, 1, 1,
1.329639, -0.7135591, 1.673634, 1, 1, 1, 1, 1,
1.330596, -1.097121, 3.213107, 1, 1, 1, 1, 1,
1.331115, -0.5047781, 2.283658, 1, 1, 1, 1, 1,
1.33747, -0.5092099, 2.803708, 1, 1, 1, 1, 1,
1.338512, 0.2257791, 0.906004, 1, 1, 1, 1, 1,
1.338956, 0.8142729, 0.9386814, 1, 1, 1, 1, 1,
1.341158, -0.4457046, 1.059816, 1, 1, 1, 1, 1,
1.344106, 0.3569024, -1.38765, 1, 1, 1, 1, 1,
1.345247, 1.437315, 0.597492, 1, 1, 1, 1, 1,
1.361881, -1.767498, 4.117118, 0, 0, 1, 1, 1,
1.368345, 2.718037, 0.9309938, 1, 0, 0, 1, 1,
1.371248, 3.269904, 1.888538, 1, 0, 0, 1, 1,
1.386299, 0.197566, 1.202689, 1, 0, 0, 1, 1,
1.391321, 1.054159, 1.169231, 1, 0, 0, 1, 1,
1.40743, 0.4642242, -0.5454656, 1, 0, 0, 1, 1,
1.411659, -1.611335, 2.264521, 0, 0, 0, 1, 1,
1.422717, -0.8907214, 2.581495, 0, 0, 0, 1, 1,
1.423666, 0.4929477, 0.3109534, 0, 0, 0, 1, 1,
1.423885, -0.4057019, 2.693165, 0, 0, 0, 1, 1,
1.434521, 0.2334467, 1.411358, 0, 0, 0, 1, 1,
1.437132, 0.1102585, 2.408196, 0, 0, 0, 1, 1,
1.448386, 0.5156471, 1.702073, 0, 0, 0, 1, 1,
1.46317, -0.9933336, 1.814886, 1, 1, 1, 1, 1,
1.480439, -0.1915015, -0.6817355, 1, 1, 1, 1, 1,
1.482008, 1.76482, 0.6127129, 1, 1, 1, 1, 1,
1.485917, -1.311818, 2.936921, 1, 1, 1, 1, 1,
1.49046, 1.760427, 1.156353, 1, 1, 1, 1, 1,
1.49303, 0.7289087, 2.914837, 1, 1, 1, 1, 1,
1.49499, -0.4788021, 2.470694, 1, 1, 1, 1, 1,
1.498309, -1.092146, 2.691556, 1, 1, 1, 1, 1,
1.500132, -0.3027832, -0.05438335, 1, 1, 1, 1, 1,
1.515676, 0.5578873, 0.1155502, 1, 1, 1, 1, 1,
1.516764, -1.259628, 3.168227, 1, 1, 1, 1, 1,
1.517588, 0.301989, 2.818571, 1, 1, 1, 1, 1,
1.530702, 1.31426, 0.4704917, 1, 1, 1, 1, 1,
1.536067, 0.1748943, 0.8184908, 1, 1, 1, 1, 1,
1.538019, 0.9691309, 1.760447, 1, 1, 1, 1, 1,
1.544605, -0.1773391, 0.2862727, 0, 0, 1, 1, 1,
1.554006, 0.82361, 0.6587354, 1, 0, 0, 1, 1,
1.564161, 0.949286, 1.98875, 1, 0, 0, 1, 1,
1.569037, 0.513279, 1.694438, 1, 0, 0, 1, 1,
1.5846, 1.042492, -0.4470906, 1, 0, 0, 1, 1,
1.590289, -0.2353039, 1.94645, 1, 0, 0, 1, 1,
1.59835, 0.6849863, -0.5482485, 0, 0, 0, 1, 1,
1.598562, 0.3976233, 3.014618, 0, 0, 0, 1, 1,
1.605038, 1.330711, 1.604116, 0, 0, 0, 1, 1,
1.611591, 0.147613, 1.729509, 0, 0, 0, 1, 1,
1.611938, 0.9605521, 0.3446065, 0, 0, 0, 1, 1,
1.61272, -0.768688, 2.240738, 0, 0, 0, 1, 1,
1.61636, -0.02507524, 2.812562, 0, 0, 0, 1, 1,
1.621266, 0.3102539, 0.1194598, 1, 1, 1, 1, 1,
1.621896, 0.3642062, 1.033971, 1, 1, 1, 1, 1,
1.635675, 0.1819107, 0.6976036, 1, 1, 1, 1, 1,
1.648293, -2.379854, 2.096895, 1, 1, 1, 1, 1,
1.669449, -0.7956496, 2.488468, 1, 1, 1, 1, 1,
1.678443, 1.673187, 1.459455, 1, 1, 1, 1, 1,
1.680491, 1.903834, -0.1212064, 1, 1, 1, 1, 1,
1.702426, -1.457707, 1.76096, 1, 1, 1, 1, 1,
1.709292, -0.836703, 3.607426, 1, 1, 1, 1, 1,
1.710605, -0.5208917, 0.6502435, 1, 1, 1, 1, 1,
1.724717, -0.4757022, 1.550155, 1, 1, 1, 1, 1,
1.728244, -0.8003902, 1.625185, 1, 1, 1, 1, 1,
1.737953, 0.6379016, 1.587508, 1, 1, 1, 1, 1,
1.783781, -0.9560443, 2.939832, 1, 1, 1, 1, 1,
1.788022, -0.6074396, 2.022452, 1, 1, 1, 1, 1,
1.789824, 0.8379769, 0.4013532, 0, 0, 1, 1, 1,
1.793496, -1.210679, 1.370482, 1, 0, 0, 1, 1,
1.796804, 0.3469074, 1.421109, 1, 0, 0, 1, 1,
1.798732, 0.2436754, 1.131162, 1, 0, 0, 1, 1,
1.802671, -0.3594093, 1.393092, 1, 0, 0, 1, 1,
1.810966, -0.2561219, 1.569921, 1, 0, 0, 1, 1,
1.854031, 1.960445, 0.254397, 0, 0, 0, 1, 1,
1.866825, 0.6406205, 1.910559, 0, 0, 0, 1, 1,
1.867133, -1.260498, 0.8655621, 0, 0, 0, 1, 1,
1.881279, 0.3409094, 1.66142, 0, 0, 0, 1, 1,
1.902446, -1.309296, 1.868591, 0, 0, 0, 1, 1,
1.919992, 0.1742398, 4.14897, 0, 0, 0, 1, 1,
1.973908, 0.6200169, 0.7549974, 0, 0, 0, 1, 1,
1.986015, -0.617429, 2.09052, 1, 1, 1, 1, 1,
1.987947, 1.291512, 1.246548, 1, 1, 1, 1, 1,
2.007355, -1.218989, -0.1719281, 1, 1, 1, 1, 1,
2.018541, 1.835338, -0.2241077, 1, 1, 1, 1, 1,
2.02126, 0.6293103, 0.9473398, 1, 1, 1, 1, 1,
2.024969, 0.7126622, 1.226338, 1, 1, 1, 1, 1,
2.043073, -1.171593, 0.5943698, 1, 1, 1, 1, 1,
2.047475, 0.8504764, -0.5738187, 1, 1, 1, 1, 1,
2.103687, 0.2119863, 0.4428463, 1, 1, 1, 1, 1,
2.104902, 1.062265, 2.341375, 1, 1, 1, 1, 1,
2.114017, -0.5011792, 2.738532, 1, 1, 1, 1, 1,
2.117682, 1.397448, 0.202115, 1, 1, 1, 1, 1,
2.132118, 0.480965, 2.48274, 1, 1, 1, 1, 1,
2.171374, 1.867865, 0.7189828, 1, 1, 1, 1, 1,
2.17944, 1.532881, 1.335679, 1, 1, 1, 1, 1,
2.220989, -0.7260841, 3.725664, 0, 0, 1, 1, 1,
2.230272, -0.8467236, 0.5564935, 1, 0, 0, 1, 1,
2.231323, -0.2546173, 0.9353234, 1, 0, 0, 1, 1,
2.235615, -0.7627615, 1.116768, 1, 0, 0, 1, 1,
2.237609, -0.1492047, 1.701393, 1, 0, 0, 1, 1,
2.239402, 0.004218989, 2.026939, 1, 0, 0, 1, 1,
2.258325, -0.7960769, 1.218826, 0, 0, 0, 1, 1,
2.27817, 0.8584684, -0.257079, 0, 0, 0, 1, 1,
2.292013, -0.06185634, 2.082113, 0, 0, 0, 1, 1,
2.347, 1.231118, 1.217926, 0, 0, 0, 1, 1,
2.352778, 0.3176917, 1.719249, 0, 0, 0, 1, 1,
2.368207, -1.611125, 1.758392, 0, 0, 0, 1, 1,
2.412677, 0.3047872, 1.842804, 0, 0, 0, 1, 1,
2.434425, 0.4728236, 0.2690523, 1, 1, 1, 1, 1,
2.493533, -0.3371688, 0.4831699, 1, 1, 1, 1, 1,
2.54243, -0.6510575, 3.153636, 1, 1, 1, 1, 1,
2.55225, -0.4877727, 2.754648, 1, 1, 1, 1, 1,
2.599046, 1.209056, 1.811358, 1, 1, 1, 1, 1,
2.834525, 0.4624851, 2.204123, 1, 1, 1, 1, 1,
2.999304, -1.585215, 3.789845, 1, 1, 1, 1, 1
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
var radius = 9.043388;
var distance = 31.76452;
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
mvMatrix.translate( -0.01787972, -0.311504, -0.1188107 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.76452);
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
