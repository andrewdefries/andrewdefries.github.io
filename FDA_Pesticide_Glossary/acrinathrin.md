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
-3.109521, -1.352401, -0.1058197, 1, 0, 0, 1,
-3.002462, -0.2570967, -1.853467, 1, 0.007843138, 0, 1,
-2.919257, 0.09525175, -1.982327, 1, 0.01176471, 0, 1,
-2.699265, 0.5038839, -1.004387, 1, 0.01960784, 0, 1,
-2.572234, -2.248912, -3.506053, 1, 0.02352941, 0, 1,
-2.54008, -0.1218406, -3.110715, 1, 0.03137255, 0, 1,
-2.514743, -0.03300916, -1.000399, 1, 0.03529412, 0, 1,
-2.378855, -1.959499, -4.270394, 1, 0.04313726, 0, 1,
-2.334453, -0.2509851, -3.312533, 1, 0.04705882, 0, 1,
-2.322776, 0.4981755, -2.75052, 1, 0.05490196, 0, 1,
-2.298717, 0.1168156, -0.02875431, 1, 0.05882353, 0, 1,
-2.290745, 2.888079, -0.6408455, 1, 0.06666667, 0, 1,
-2.260474, 0.00543104, -1.469786, 1, 0.07058824, 0, 1,
-2.245703, -0.2543139, -0.3197261, 1, 0.07843138, 0, 1,
-2.241431, 0.2282242, -0.1586752, 1, 0.08235294, 0, 1,
-2.224949, 1.457436, -2.487913, 1, 0.09019608, 0, 1,
-2.204456, -0.909286, -1.319638, 1, 0.09411765, 0, 1,
-2.175496, -0.2773903, -0.90454, 1, 0.1019608, 0, 1,
-2.090571, -0.6871083, -0.508948, 1, 0.1098039, 0, 1,
-2.075852, -0.3623659, -2.402703, 1, 0.1137255, 0, 1,
-2.059835, -0.4388171, -3.479712, 1, 0.1215686, 0, 1,
-2.045999, -0.1429207, -1.191977, 1, 0.1254902, 0, 1,
-2.04214, -1.119756, -3.497232, 1, 0.1333333, 0, 1,
-2.018651, 0.5040055, 0.1550213, 1, 0.1372549, 0, 1,
-2.011296, -1.036964, -2.767997, 1, 0.145098, 0, 1,
-1.988089, 0.4792079, -2.450386, 1, 0.1490196, 0, 1,
-1.95473, -0.2062034, -0.05966844, 1, 0.1568628, 0, 1,
-1.95081, -0.700095, -1.411418, 1, 0.1607843, 0, 1,
-1.930496, -1.561151, -3.224644, 1, 0.1686275, 0, 1,
-1.903714, -0.291894, -2.809355, 1, 0.172549, 0, 1,
-1.879749, -0.08966371, -1.327055, 1, 0.1803922, 0, 1,
-1.87223, 0.8940616, -0.2476086, 1, 0.1843137, 0, 1,
-1.84521, 1.100933, 0.1530538, 1, 0.1921569, 0, 1,
-1.822182, 0.4078343, -2.157097, 1, 0.1960784, 0, 1,
-1.806356, 1.195942, -2.014451, 1, 0.2039216, 0, 1,
-1.805386, -1.12594, -1.58185, 1, 0.2117647, 0, 1,
-1.796605, 2.466537, 1.946509, 1, 0.2156863, 0, 1,
-1.79385, -0.2011989, 0.9794731, 1, 0.2235294, 0, 1,
-1.7835, 2.090806, 0.09622806, 1, 0.227451, 0, 1,
-1.782478, 1.518013, -3.268897, 1, 0.2352941, 0, 1,
-1.782437, -0.03131672, -1.811707, 1, 0.2392157, 0, 1,
-1.75275, 0.1298908, -0.06659617, 1, 0.2470588, 0, 1,
-1.728639, 1.347827, -0.1511769, 1, 0.2509804, 0, 1,
-1.72689, 0.9488724, 0.6021746, 1, 0.2588235, 0, 1,
-1.720326, 1.301955, -1.852216, 1, 0.2627451, 0, 1,
-1.718753, 2.278144, -0.03820147, 1, 0.2705882, 0, 1,
-1.718211, -0.6537914, -2.721734, 1, 0.2745098, 0, 1,
-1.717706, -0.3564767, -1.150859, 1, 0.282353, 0, 1,
-1.703784, 0.6786817, -1.262008, 1, 0.2862745, 0, 1,
-1.695907, 1.104505, -1.397368, 1, 0.2941177, 0, 1,
-1.694454, 0.07419561, -0.5933915, 1, 0.3019608, 0, 1,
-1.668405, 1.051172, -1.083711, 1, 0.3058824, 0, 1,
-1.654405, 0.04035994, -1.965112, 1, 0.3137255, 0, 1,
-1.646407, -1.618302, -2.223593, 1, 0.3176471, 0, 1,
-1.645936, 1.7699, -1.522849, 1, 0.3254902, 0, 1,
-1.644812, 0.1603136, -0.1029497, 1, 0.3294118, 0, 1,
-1.638245, -1.177839, -0.1123101, 1, 0.3372549, 0, 1,
-1.629916, -0.2745623, -1.320925, 1, 0.3411765, 0, 1,
-1.602444, 0.3685231, -0.004685782, 1, 0.3490196, 0, 1,
-1.582187, 0.5239292, -0.585824, 1, 0.3529412, 0, 1,
-1.580417, -1.39265, -1.956884, 1, 0.3607843, 0, 1,
-1.571555, 1.15307, 0.2777956, 1, 0.3647059, 0, 1,
-1.562147, 1.426092, -0.02617223, 1, 0.372549, 0, 1,
-1.553905, -1.431399, -1.235955, 1, 0.3764706, 0, 1,
-1.541967, -0.0930232, -1.669399, 1, 0.3843137, 0, 1,
-1.540534, -1.710787, -1.688493, 1, 0.3882353, 0, 1,
-1.524009, -1.266893, -1.795303, 1, 0.3960784, 0, 1,
-1.520116, 0.8158916, -1.103404, 1, 0.4039216, 0, 1,
-1.491122, -1.442459, -0.3537798, 1, 0.4078431, 0, 1,
-1.488959, 0.2302985, -2.064754, 1, 0.4156863, 0, 1,
-1.4808, -0.7118707, -0.588292, 1, 0.4196078, 0, 1,
-1.480525, -0.031914, -2.194946, 1, 0.427451, 0, 1,
-1.460804, 0.6986796, -3.037691, 1, 0.4313726, 0, 1,
-1.448758, 0.15877, -2.269914, 1, 0.4392157, 0, 1,
-1.445356, 0.1215717, 0.3280561, 1, 0.4431373, 0, 1,
-1.443545, 0.409349, -2.212569, 1, 0.4509804, 0, 1,
-1.436875, 1.512286, 0.1807768, 1, 0.454902, 0, 1,
-1.429078, -1.506797, -2.505616, 1, 0.4627451, 0, 1,
-1.408056, -0.9611705, -2.423933, 1, 0.4666667, 0, 1,
-1.404443, -0.04314064, -1.264727, 1, 0.4745098, 0, 1,
-1.404359, -0.1252193, -0.9817135, 1, 0.4784314, 0, 1,
-1.401971, -0.09338555, -2.538967, 1, 0.4862745, 0, 1,
-1.396443, 0.9821668, 0.126203, 1, 0.4901961, 0, 1,
-1.394287, -0.2831437, -1.245222, 1, 0.4980392, 0, 1,
-1.382265, 0.05096661, 0.06466284, 1, 0.5058824, 0, 1,
-1.377675, 1.809737, -0.6994816, 1, 0.509804, 0, 1,
-1.373023, 0.1539247, -2.138872, 1, 0.5176471, 0, 1,
-1.363204, -0.1014111, -1.649612, 1, 0.5215687, 0, 1,
-1.358887, -2.064722, -2.308695, 1, 0.5294118, 0, 1,
-1.336199, -1.076145, -1.73031, 1, 0.5333334, 0, 1,
-1.32987, -0.612514, -2.152395, 1, 0.5411765, 0, 1,
-1.322811, 0.5465731, -2.123936, 1, 0.5450981, 0, 1,
-1.302696, 0.514067, -2.416723, 1, 0.5529412, 0, 1,
-1.300774, 0.698699, 0.1038695, 1, 0.5568628, 0, 1,
-1.298602, -0.2406601, -1.031887, 1, 0.5647059, 0, 1,
-1.292039, -0.2730599, -1.764527, 1, 0.5686275, 0, 1,
-1.291989, 0.6965079, -0.5141383, 1, 0.5764706, 0, 1,
-1.272121, -0.8570344, -2.831102, 1, 0.5803922, 0, 1,
-1.257253, 0.3685883, -2.253589, 1, 0.5882353, 0, 1,
-1.25198, 0.6472164, -0.6002766, 1, 0.5921569, 0, 1,
-1.247313, -0.008792719, -0.6143554, 1, 0.6, 0, 1,
-1.246707, -0.01140522, -1.853856, 1, 0.6078432, 0, 1,
-1.246655, -0.1558538, -2.546864, 1, 0.6117647, 0, 1,
-1.239904, -0.5114241, -2.652822, 1, 0.6196079, 0, 1,
-1.234089, -1.53539, -2.860258, 1, 0.6235294, 0, 1,
-1.232597, 1.281622, -0.07116479, 1, 0.6313726, 0, 1,
-1.228879, 1.357168, -0.5049381, 1, 0.6352941, 0, 1,
-1.228142, 0.8789913, -1.089857, 1, 0.6431373, 0, 1,
-1.227265, 0.245291, -1.361124, 1, 0.6470588, 0, 1,
-1.224059, -0.6455635, -2.931682, 1, 0.654902, 0, 1,
-1.223586, -2.329374, -1.35774, 1, 0.6588235, 0, 1,
-1.217557, -1.780204, -2.856652, 1, 0.6666667, 0, 1,
-1.217125, -0.4800434, -2.826293, 1, 0.6705883, 0, 1,
-1.206683, -0.6487774, -2.26358, 1, 0.6784314, 0, 1,
-1.195821, 0.2577451, -1.999489, 1, 0.682353, 0, 1,
-1.195619, -1.370209, -2.844102, 1, 0.6901961, 0, 1,
-1.191293, -1.821386, -3.742961, 1, 0.6941177, 0, 1,
-1.187793, 0.7349939, -2.147827, 1, 0.7019608, 0, 1,
-1.180772, -0.0430168, 0.8786753, 1, 0.7098039, 0, 1,
-1.175556, 0.1640518, -2.307307, 1, 0.7137255, 0, 1,
-1.166464, -0.7895262, -4.077023, 1, 0.7215686, 0, 1,
-1.159652, 0.5234065, -1.722696, 1, 0.7254902, 0, 1,
-1.138664, 0.5491706, -0.393757, 1, 0.7333333, 0, 1,
-1.136833, -0.7005472, -4.952358, 1, 0.7372549, 0, 1,
-1.130545, -1.813354, -2.198677, 1, 0.7450981, 0, 1,
-1.129106, 0.8184628, -0.7789428, 1, 0.7490196, 0, 1,
-1.12233, 0.2540635, -2.306188, 1, 0.7568628, 0, 1,
-1.115657, -0.2411239, -1.632741, 1, 0.7607843, 0, 1,
-1.107245, 0.4579298, -1.206453, 1, 0.7686275, 0, 1,
-1.103534, -0.3110325, -0.9011297, 1, 0.772549, 0, 1,
-1.102733, 0.448368, -2.006993, 1, 0.7803922, 0, 1,
-1.099463, -0.395076, -2.902295, 1, 0.7843137, 0, 1,
-1.099157, 2.34943, 0.01199874, 1, 0.7921569, 0, 1,
-1.09874, 0.003160715, -2.813688, 1, 0.7960784, 0, 1,
-1.097278, 0.8868628, -0.9419151, 1, 0.8039216, 0, 1,
-1.094136, -0.3973705, -2.230627, 1, 0.8117647, 0, 1,
-1.093026, -0.121903, -1.594966, 1, 0.8156863, 0, 1,
-1.091897, -0.5125545, -2.821352, 1, 0.8235294, 0, 1,
-1.087914, -0.5732177, -2.440942, 1, 0.827451, 0, 1,
-1.083031, 0.01947911, -1.064489, 1, 0.8352941, 0, 1,
-1.08253, 0.835432, -2.648098, 1, 0.8392157, 0, 1,
-1.078598, 1.171081, -2.145505, 1, 0.8470588, 0, 1,
-1.071994, 0.9300566, -0.09177259, 1, 0.8509804, 0, 1,
-1.069191, -0.0937453, -2.900205, 1, 0.8588235, 0, 1,
-1.05889, -1.088039, -2.142795, 1, 0.8627451, 0, 1,
-1.043111, -0.5245123, -3.301541, 1, 0.8705882, 0, 1,
-1.035252, 0.5191696, -1.850824, 1, 0.8745098, 0, 1,
-1.033895, 0.6135321, -0.8141493, 1, 0.8823529, 0, 1,
-1.031368, -1.854937, -2.098129, 1, 0.8862745, 0, 1,
-1.017956, -0.1840479, -1.087201, 1, 0.8941177, 0, 1,
-1.012544, -0.2714072, -1.932072, 1, 0.8980392, 0, 1,
-1.00882, 1.99261, -1.760432, 1, 0.9058824, 0, 1,
-1.00543, 1.59705, -0.07161, 1, 0.9137255, 0, 1,
-1.000802, -0.8447917, -2.235104, 1, 0.9176471, 0, 1,
-0.998533, 0.05179906, -0.03224386, 1, 0.9254902, 0, 1,
-0.9985086, -1.714734, -2.515191, 1, 0.9294118, 0, 1,
-0.9964024, -0.2956694, -2.551474, 1, 0.9372549, 0, 1,
-0.9944648, 1.188956, -1.437074, 1, 0.9411765, 0, 1,
-0.9935778, -1.575182, 0.5150886, 1, 0.9490196, 0, 1,
-0.9862506, -0.07332125, -1.790508, 1, 0.9529412, 0, 1,
-0.9828704, 1.598076, 0.3299406, 1, 0.9607843, 0, 1,
-0.9792868, 0.3798558, -0.3482529, 1, 0.9647059, 0, 1,
-0.9747449, -1.294318, -2.719546, 1, 0.972549, 0, 1,
-0.9626915, -1.670392, -1.650329, 1, 0.9764706, 0, 1,
-0.9599845, 1.723247, -0.4825543, 1, 0.9843137, 0, 1,
-0.9582283, -0.4395152, -0.0505541, 1, 0.9882353, 0, 1,
-0.9547811, -0.6431319, -2.20055, 1, 0.9960784, 0, 1,
-0.9542198, 0.1941596, -0.5567101, 0.9960784, 1, 0, 1,
-0.9522251, -0.2949778, -2.905197, 0.9921569, 1, 0, 1,
-0.9466115, 1.142939, 1.826106, 0.9843137, 1, 0, 1,
-0.9436383, -0.7927972, -1.101123, 0.9803922, 1, 0, 1,
-0.9435031, 0.7010044, -0.8350676, 0.972549, 1, 0, 1,
-0.9344696, -0.3347052, -1.009562, 0.9686275, 1, 0, 1,
-0.9339694, 0.3978532, -2.266452, 0.9607843, 1, 0, 1,
-0.9322811, 0.1183169, -2.914127, 0.9568627, 1, 0, 1,
-0.9285686, -0.1961219, -1.581966, 0.9490196, 1, 0, 1,
-0.92549, 0.355581, -0.6253459, 0.945098, 1, 0, 1,
-0.9242741, 0.7899719, -1.581976, 0.9372549, 1, 0, 1,
-0.9134579, -0.5362329, -1.688582, 0.9333333, 1, 0, 1,
-0.9104865, -0.8340285, -3.033659, 0.9254902, 1, 0, 1,
-0.9049249, -0.2153047, -1.800756, 0.9215686, 1, 0, 1,
-0.9033817, -0.8700907, -3.167556, 0.9137255, 1, 0, 1,
-0.8963851, 0.6012269, -1.594926, 0.9098039, 1, 0, 1,
-0.8957482, -0.9772531, -1.524722, 0.9019608, 1, 0, 1,
-0.8925152, -0.06138189, -1.307845, 0.8941177, 1, 0, 1,
-0.8921063, -0.2930107, -2.813546, 0.8901961, 1, 0, 1,
-0.8918071, 0.9605417, 0.4707169, 0.8823529, 1, 0, 1,
-0.8907802, 0.01887174, -2.042024, 0.8784314, 1, 0, 1,
-0.8897387, 0.02721965, -1.114127, 0.8705882, 1, 0, 1,
-0.8849804, 1.145261, -1.331619, 0.8666667, 1, 0, 1,
-0.8763263, 0.419778, -2.786029, 0.8588235, 1, 0, 1,
-0.8716677, 1.482684, -0.1258657, 0.854902, 1, 0, 1,
-0.8649013, -0.2435329, -1.759159, 0.8470588, 1, 0, 1,
-0.864165, 0.3954564, -1.368706, 0.8431373, 1, 0, 1,
-0.8625742, 2.230343, -0.4843631, 0.8352941, 1, 0, 1,
-0.8585318, -0.2262802, -2.197601, 0.8313726, 1, 0, 1,
-0.8577235, 1.647632, 0.9798234, 0.8235294, 1, 0, 1,
-0.8445094, 0.06190636, -1.728216, 0.8196079, 1, 0, 1,
-0.8442332, 1.132851, 0.1420723, 0.8117647, 1, 0, 1,
-0.8367624, 0.2076015, 0.7036152, 0.8078431, 1, 0, 1,
-0.8359642, -1.720088, -2.835669, 0.8, 1, 0, 1,
-0.8357541, -0.2220639, -0.9931936, 0.7921569, 1, 0, 1,
-0.8288669, 0.3422025, 1.013933, 0.7882353, 1, 0, 1,
-0.8274496, 1.161182, 0.524016, 0.7803922, 1, 0, 1,
-0.8243787, 0.2961497, -1.895853, 0.7764706, 1, 0, 1,
-0.8055528, -0.2355955, -1.655305, 0.7686275, 1, 0, 1,
-0.801575, 0.4274693, -3.090769, 0.7647059, 1, 0, 1,
-0.7989991, 1.577977, 0.00552164, 0.7568628, 1, 0, 1,
-0.7962998, 2.499712, -1.104227, 0.7529412, 1, 0, 1,
-0.7959756, 1.425362, -0.4329946, 0.7450981, 1, 0, 1,
-0.790285, 0.09047119, -0.560532, 0.7411765, 1, 0, 1,
-0.7900695, -0.6756123, 0.2117285, 0.7333333, 1, 0, 1,
-0.789892, -1.004119, -3.733458, 0.7294118, 1, 0, 1,
-0.789752, -0.5543949, -3.162161, 0.7215686, 1, 0, 1,
-0.7887519, 1.188679, -0.3976443, 0.7176471, 1, 0, 1,
-0.7808456, 0.1168582, -2.855614, 0.7098039, 1, 0, 1,
-0.7783867, 0.2233884, -1.699383, 0.7058824, 1, 0, 1,
-0.7763242, 0.2654833, -1.525228, 0.6980392, 1, 0, 1,
-0.7625792, -0.2025734, -1.37072, 0.6901961, 1, 0, 1,
-0.7612999, 1.767036, -1.087024, 0.6862745, 1, 0, 1,
-0.7606164, -0.7584332, -3.571837, 0.6784314, 1, 0, 1,
-0.7605546, 1.077002, 0.2740961, 0.6745098, 1, 0, 1,
-0.7507072, -1.433656, -2.997098, 0.6666667, 1, 0, 1,
-0.7467415, 1.215895, -1.108629, 0.6627451, 1, 0, 1,
-0.7464829, 0.1451407, -1.578175, 0.654902, 1, 0, 1,
-0.7458695, 1.62741, -0.2371294, 0.6509804, 1, 0, 1,
-0.7458574, -1.075482, -1.618932, 0.6431373, 1, 0, 1,
-0.7439553, -1.596865, -3.031071, 0.6392157, 1, 0, 1,
-0.7436749, 0.6563848, -2.632915, 0.6313726, 1, 0, 1,
-0.7430062, -0.04283052, -1.194036, 0.627451, 1, 0, 1,
-0.7397716, -1.201281, -3.860197, 0.6196079, 1, 0, 1,
-0.7394755, -0.4787138, -1.252826, 0.6156863, 1, 0, 1,
-0.7376366, -0.3021214, -0.6941016, 0.6078432, 1, 0, 1,
-0.7343235, 0.9994414, 0.4364592, 0.6039216, 1, 0, 1,
-0.7329612, 0.2523825, -2.457317, 0.5960785, 1, 0, 1,
-0.7294742, 0.2023244, -1.903266, 0.5882353, 1, 0, 1,
-0.7199148, -0.2095625, -2.814491, 0.5843138, 1, 0, 1,
-0.7118979, -0.5529627, -3.15238, 0.5764706, 1, 0, 1,
-0.7116855, 0.05679246, -2.388821, 0.572549, 1, 0, 1,
-0.7115319, -0.4696608, -2.510787, 0.5647059, 1, 0, 1,
-0.7102625, 0.4658131, -1.734524, 0.5607843, 1, 0, 1,
-0.7081977, -0.8931019, -1.607078, 0.5529412, 1, 0, 1,
-0.7062152, 2.282673, 0.6408863, 0.5490196, 1, 0, 1,
-0.7056804, 0.6036596, -0.6213528, 0.5411765, 1, 0, 1,
-0.7033924, -0.1871318, -2.141716, 0.5372549, 1, 0, 1,
-0.6992451, 0.603182, 0.8609146, 0.5294118, 1, 0, 1,
-0.6949374, 1.127093, 0.7221593, 0.5254902, 1, 0, 1,
-0.6945303, -2.766819, -4.247737, 0.5176471, 1, 0, 1,
-0.6916602, 0.7314622, -1.738557, 0.5137255, 1, 0, 1,
-0.6885825, 0.5966395, -2.451322, 0.5058824, 1, 0, 1,
-0.6877462, 0.1724563, -1.54523, 0.5019608, 1, 0, 1,
-0.6851605, 0.729236, -2.163119, 0.4941176, 1, 0, 1,
-0.6844835, 0.7293167, 0.3419342, 0.4862745, 1, 0, 1,
-0.6829417, -0.2483543, -2.792455, 0.4823529, 1, 0, 1,
-0.6797715, 1.488203, 0.1247267, 0.4745098, 1, 0, 1,
-0.6711224, 0.2600606, -0.548355, 0.4705882, 1, 0, 1,
-0.6706172, -0.02467326, -2.050645, 0.4627451, 1, 0, 1,
-0.6700974, -0.7441077, -0.6371202, 0.4588235, 1, 0, 1,
-0.6666919, 2.183427, 0.2559877, 0.4509804, 1, 0, 1,
-0.6655424, -1.686023, -3.118107, 0.4470588, 1, 0, 1,
-0.6546111, -0.6478804, -2.970558, 0.4392157, 1, 0, 1,
-0.6505749, -0.0838386, -1.595671, 0.4352941, 1, 0, 1,
-0.6503091, 0.2128385, -1.111667, 0.427451, 1, 0, 1,
-0.6484767, -1.855774, -2.168331, 0.4235294, 1, 0, 1,
-0.6471992, 0.09369174, -1.539196, 0.4156863, 1, 0, 1,
-0.6441337, -0.5803147, -2.166719, 0.4117647, 1, 0, 1,
-0.6416889, -0.4951812, -1.734173, 0.4039216, 1, 0, 1,
-0.640301, -0.501529, -2.191849, 0.3960784, 1, 0, 1,
-0.6284248, -0.1273925, -2.033596, 0.3921569, 1, 0, 1,
-0.6262617, 0.7180176, -0.6424921, 0.3843137, 1, 0, 1,
-0.6222497, 0.598389, -1.140645, 0.3803922, 1, 0, 1,
-0.6209343, 0.519223, -0.3681344, 0.372549, 1, 0, 1,
-0.6201569, -0.02270219, -2.872265, 0.3686275, 1, 0, 1,
-0.6124605, -2.026052, -3.483649, 0.3607843, 1, 0, 1,
-0.6112144, 0.1833809, -0.3835888, 0.3568628, 1, 0, 1,
-0.6108479, 0.4571255, -0.798943, 0.3490196, 1, 0, 1,
-0.6098531, 1.03353, 0.1733562, 0.345098, 1, 0, 1,
-0.6063756, -0.2058211, -0.1441891, 0.3372549, 1, 0, 1,
-0.606294, 1.339844, 0.2075628, 0.3333333, 1, 0, 1,
-0.6061712, -2.217347, -1.778061, 0.3254902, 1, 0, 1,
-0.6055778, -1.762607, -2.731549, 0.3215686, 1, 0, 1,
-0.6029994, 0.7514507, -1.175292, 0.3137255, 1, 0, 1,
-0.6024923, -1.556203, -2.888021, 0.3098039, 1, 0, 1,
-0.5950158, -0.6410439, 1.08027, 0.3019608, 1, 0, 1,
-0.5916482, 0.5247943, -0.5155006, 0.2941177, 1, 0, 1,
-0.5906068, 1.049421, -0.3621035, 0.2901961, 1, 0, 1,
-0.5810288, -1.593371, -2.297341, 0.282353, 1, 0, 1,
-0.5782164, 1.311607, -0.2931236, 0.2784314, 1, 0, 1,
-0.5779848, -1.185334, -1.319695, 0.2705882, 1, 0, 1,
-0.5756052, 1.50189, -0.5529475, 0.2666667, 1, 0, 1,
-0.5744509, -0.3892111, -1.378785, 0.2588235, 1, 0, 1,
-0.5733655, -0.5110703, -2.324203, 0.254902, 1, 0, 1,
-0.5703909, 0.9255049, -0.2429669, 0.2470588, 1, 0, 1,
-0.5685629, -1.020079, -3.565163, 0.2431373, 1, 0, 1,
-0.562339, -0.1877301, -2.907478, 0.2352941, 1, 0, 1,
-0.5585703, 0.6105765, -0.6438022, 0.2313726, 1, 0, 1,
-0.5562103, 0.2102333, -0.3054482, 0.2235294, 1, 0, 1,
-0.5547718, -0.7191318, -2.570331, 0.2196078, 1, 0, 1,
-0.5502253, 0.3841141, -1.600044, 0.2117647, 1, 0, 1,
-0.5444651, -0.1317016, 0.3877844, 0.2078431, 1, 0, 1,
-0.5443259, -0.3857627, -2.688136, 0.2, 1, 0, 1,
-0.5417153, -1.411512, -0.2850458, 0.1921569, 1, 0, 1,
-0.5392503, -0.9604963, -2.289775, 0.1882353, 1, 0, 1,
-0.5355564, 1.644772, 1.035942, 0.1803922, 1, 0, 1,
-0.5355263, -0.4589966, -2.664504, 0.1764706, 1, 0, 1,
-0.5340512, 1.601357, -0.1842014, 0.1686275, 1, 0, 1,
-0.5292568, -0.7996616, -3.70578, 0.1647059, 1, 0, 1,
-0.5250546, 1.479124, -0.5118605, 0.1568628, 1, 0, 1,
-0.5180086, -0.7899642, -2.313102, 0.1529412, 1, 0, 1,
-0.5134003, 0.0570025, -1.030152, 0.145098, 1, 0, 1,
-0.5118464, -0.2488801, -0.599421, 0.1411765, 1, 0, 1,
-0.5117895, -0.3517429, -3.442175, 0.1333333, 1, 0, 1,
-0.5116209, -1.177735, -2.304411, 0.1294118, 1, 0, 1,
-0.5101357, 0.3976846, -0.4533095, 0.1215686, 1, 0, 1,
-0.5099504, 1.003551, -1.52116, 0.1176471, 1, 0, 1,
-0.5068092, -1.00237, -1.920311, 0.1098039, 1, 0, 1,
-0.5066036, -1.24802, -4.372217, 0.1058824, 1, 0, 1,
-0.506562, -0.3957867, -1.728854, 0.09803922, 1, 0, 1,
-0.5022529, 2.140674, -0.8940462, 0.09019608, 1, 0, 1,
-0.5020879, -0.2663379, -2.242233, 0.08627451, 1, 0, 1,
-0.5018765, 2.162625, -1.143851, 0.07843138, 1, 0, 1,
-0.5015216, 0.09412958, -1.825107, 0.07450981, 1, 0, 1,
-0.4982928, 2.630858, 0.733215, 0.06666667, 1, 0, 1,
-0.497573, 0.5430561, -0.5971155, 0.0627451, 1, 0, 1,
-0.4958465, 0.5475602, 0.03690226, 0.05490196, 1, 0, 1,
-0.4956438, -0.4614255, -2.238718, 0.05098039, 1, 0, 1,
-0.4953195, 0.1869547, -2.520045, 0.04313726, 1, 0, 1,
-0.4925761, -0.9802859, -2.816101, 0.03921569, 1, 0, 1,
-0.4911288, -0.6115615, -3.507269, 0.03137255, 1, 0, 1,
-0.4882677, -0.4147781, -2.025346, 0.02745098, 1, 0, 1,
-0.4873538, -1.696771, -3.16991, 0.01960784, 1, 0, 1,
-0.4788916, 0.6740866, -0.3868256, 0.01568628, 1, 0, 1,
-0.4774948, 1.167455, -0.009106291, 0.007843138, 1, 0, 1,
-0.4773143, -1.073781, -1.631162, 0.003921569, 1, 0, 1,
-0.4689821, -0.2815347, -2.631838, 0, 1, 0.003921569, 1,
-0.4652667, -0.168661, -1.016008, 0, 1, 0.01176471, 1,
-0.4638802, -1.853767, -0.8519791, 0, 1, 0.01568628, 1,
-0.4612502, 0.998746, -0.1421472, 0, 1, 0.02352941, 1,
-0.4572449, -0.04531945, -2.16154, 0, 1, 0.02745098, 1,
-0.4516, 1.774298, -0.5937614, 0, 1, 0.03529412, 1,
-0.450413, -1.48453, -3.531167, 0, 1, 0.03921569, 1,
-0.4498582, -2.467971, -2.385305, 0, 1, 0.04705882, 1,
-0.448885, -1.295346, -1.242672, 0, 1, 0.05098039, 1,
-0.4483723, 1.145093, 0.06571255, 0, 1, 0.05882353, 1,
-0.4464352, 0.08296971, -0.7674792, 0, 1, 0.0627451, 1,
-0.4447798, -0.5490157, -0.825759, 0, 1, 0.07058824, 1,
-0.4433263, -2.166239, -2.822654, 0, 1, 0.07450981, 1,
-0.4334058, 1.364134, -0.5869619, 0, 1, 0.08235294, 1,
-0.4304656, 1.159806, 2.292194, 0, 1, 0.08627451, 1,
-0.4275884, -0.01907102, -2.125394, 0, 1, 0.09411765, 1,
-0.4252236, 0.5250592, 0.9394075, 0, 1, 0.1019608, 1,
-0.4187756, -1.636374, -2.2153, 0, 1, 0.1058824, 1,
-0.41432, -0.8123332, -2.203773, 0, 1, 0.1137255, 1,
-0.4101415, -0.1070071, -0.4647623, 0, 1, 0.1176471, 1,
-0.4091757, 0.7856848, -1.860601, 0, 1, 0.1254902, 1,
-0.3999316, 1.781432, -0.4999963, 0, 1, 0.1294118, 1,
-0.3933587, 0.054614, 0.5457854, 0, 1, 0.1372549, 1,
-0.3930351, -0.3326288, -1.79313, 0, 1, 0.1411765, 1,
-0.3919977, -1.176859, -3.599269, 0, 1, 0.1490196, 1,
-0.3889866, 1.06859, -0.1691511, 0, 1, 0.1529412, 1,
-0.3864233, -0.3108688, -1.417061, 0, 1, 0.1607843, 1,
-0.3844736, -0.4461125, -1.409166, 0, 1, 0.1647059, 1,
-0.381532, -0.7823806, -1.740159, 0, 1, 0.172549, 1,
-0.3813518, -0.6894829, -4.349682, 0, 1, 0.1764706, 1,
-0.3788756, 1.153339, 0.2706365, 0, 1, 0.1843137, 1,
-0.3767673, -0.3630608, -2.494668, 0, 1, 0.1882353, 1,
-0.3759712, -1.640743, -1.912387, 0, 1, 0.1960784, 1,
-0.3736657, -0.2243541, -2.084476, 0, 1, 0.2039216, 1,
-0.372985, -1.000221, -3.634497, 0, 1, 0.2078431, 1,
-0.3694194, -0.7757422, -2.714542, 0, 1, 0.2156863, 1,
-0.3658274, -1.9835, -4.579648, 0, 1, 0.2196078, 1,
-0.3609157, -1.03741, -3.120353, 0, 1, 0.227451, 1,
-0.3594696, -0.6237518, -2.138518, 0, 1, 0.2313726, 1,
-0.3476279, -1.474106, -1.688921, 0, 1, 0.2392157, 1,
-0.3452464, -1.263307, 0.02239739, 0, 1, 0.2431373, 1,
-0.3435726, 1.701087, 0.1679508, 0, 1, 0.2509804, 1,
-0.3418196, 1.022151, 0.02404507, 0, 1, 0.254902, 1,
-0.3413983, -0.205089, -2.801961, 0, 1, 0.2627451, 1,
-0.3381339, -0.05593986, -2.30625, 0, 1, 0.2666667, 1,
-0.3372936, 0.7236104, -0.526265, 0, 1, 0.2745098, 1,
-0.3304685, -0.4508533, -2.767399, 0, 1, 0.2784314, 1,
-0.3304578, 0.2978852, -1.845051, 0, 1, 0.2862745, 1,
-0.3303076, -0.9263787, -5.372293, 0, 1, 0.2901961, 1,
-0.3275264, -0.1776017, -1.235726, 0, 1, 0.2980392, 1,
-0.3240175, -0.8786339, -3.641246, 0, 1, 0.3058824, 1,
-0.3204786, -0.9020541, -0.6450344, 0, 1, 0.3098039, 1,
-0.3200565, 0.5938565, -1.900194, 0, 1, 0.3176471, 1,
-0.3199579, -0.1801885, -1.961054, 0, 1, 0.3215686, 1,
-0.3190536, -0.4604139, -2.539551, 0, 1, 0.3294118, 1,
-0.3176708, 0.3297183, 0.930801, 0, 1, 0.3333333, 1,
-0.3168965, -0.7156548, -2.862145, 0, 1, 0.3411765, 1,
-0.3168043, 1.369184, -1.361838, 0, 1, 0.345098, 1,
-0.3158148, -1.137282, -3.651209, 0, 1, 0.3529412, 1,
-0.3144628, 2.306085, 0.005618572, 0, 1, 0.3568628, 1,
-0.3143062, 0.2029821, -0.9163758, 0, 1, 0.3647059, 1,
-0.3131673, -0.9843119, -2.98932, 0, 1, 0.3686275, 1,
-0.3127609, 1.074478, -0.7974489, 0, 1, 0.3764706, 1,
-0.312701, -0.9627789, -3.32177, 0, 1, 0.3803922, 1,
-0.3095797, 2.271917, -2.701302, 0, 1, 0.3882353, 1,
-0.3052433, 0.4167483, -1.060138, 0, 1, 0.3921569, 1,
-0.3015126, 1.087313, -0.9631092, 0, 1, 0.4, 1,
-0.2975462, 0.8688479, -0.8700793, 0, 1, 0.4078431, 1,
-0.2929504, 2.526596, -1.482367, 0, 1, 0.4117647, 1,
-0.2914086, 1.367681, -0.8252236, 0, 1, 0.4196078, 1,
-0.2895853, -0.4975225, -1.691579, 0, 1, 0.4235294, 1,
-0.2872737, -0.3952214, -0.454351, 0, 1, 0.4313726, 1,
-0.2845294, 0.07317413, -2.129254, 0, 1, 0.4352941, 1,
-0.2825223, 0.5204457, -0.2762184, 0, 1, 0.4431373, 1,
-0.2807663, 0.2684402, -0.3162767, 0, 1, 0.4470588, 1,
-0.2805055, 0.3471627, -0.4498526, 0, 1, 0.454902, 1,
-0.2796055, 0.4706536, -1.407166, 0, 1, 0.4588235, 1,
-0.2581488, -0.2931224, -2.105753, 0, 1, 0.4666667, 1,
-0.2571914, -1.351843, -2.347942, 0, 1, 0.4705882, 1,
-0.2565673, -0.3982526, -2.630504, 0, 1, 0.4784314, 1,
-0.2558673, -0.8609345, -2.205079, 0, 1, 0.4823529, 1,
-0.254489, 0.3373204, -1.066963, 0, 1, 0.4901961, 1,
-0.2451246, 2.339082, -0.9212645, 0, 1, 0.4941176, 1,
-0.2440802, 0.5673813, -0.8470642, 0, 1, 0.5019608, 1,
-0.2436129, -0.019967, -0.3472348, 0, 1, 0.509804, 1,
-0.2378177, -1.618382, -2.886559, 0, 1, 0.5137255, 1,
-0.2263171, -0.6299963, -1.442578, 0, 1, 0.5215687, 1,
-0.2243475, 1.120848, -1.151723, 0, 1, 0.5254902, 1,
-0.2220337, 0.228022, -0.7923623, 0, 1, 0.5333334, 1,
-0.2179105, -0.7386367, -4.009625, 0, 1, 0.5372549, 1,
-0.2162908, -0.9934998, -1.987309, 0, 1, 0.5450981, 1,
-0.2159008, -0.7770015, -1.774796, 0, 1, 0.5490196, 1,
-0.2152982, 1.82293, 1.722769, 0, 1, 0.5568628, 1,
-0.2148722, -1.418839, -2.475265, 0, 1, 0.5607843, 1,
-0.2142741, -0.3269893, -3.607574, 0, 1, 0.5686275, 1,
-0.2130009, 1.226805, -2.216821, 0, 1, 0.572549, 1,
-0.2073541, 0.5502849, 0.1316453, 0, 1, 0.5803922, 1,
-0.2072316, 0.906016, 0.9098955, 0, 1, 0.5843138, 1,
-0.2070635, -1.40861, -3.202436, 0, 1, 0.5921569, 1,
-0.2069184, -0.3193792, -2.129924, 0, 1, 0.5960785, 1,
-0.2066787, -1.703384, -2.800446, 0, 1, 0.6039216, 1,
-0.2014613, 0.7472829, -0.1677222, 0, 1, 0.6117647, 1,
-0.1884531, 0.5159013, -0.5826194, 0, 1, 0.6156863, 1,
-0.1855852, -0.05520672, -0.4370678, 0, 1, 0.6235294, 1,
-0.182139, 1.018468, 0.1225288, 0, 1, 0.627451, 1,
-0.1812858, -1.107862, -1.084135, 0, 1, 0.6352941, 1,
-0.1757481, 2.577855, -1.314391, 0, 1, 0.6392157, 1,
-0.1748211, -0.3089162, -3.683812, 0, 1, 0.6470588, 1,
-0.1701065, -1.097887, -2.737539, 0, 1, 0.6509804, 1,
-0.1685299, 0.8176632, -3.733187, 0, 1, 0.6588235, 1,
-0.164448, 0.8995645, 0.8276071, 0, 1, 0.6627451, 1,
-0.16011, -0.2091079, -2.992058, 0, 1, 0.6705883, 1,
-0.1542188, -0.9444535, -3.80618, 0, 1, 0.6745098, 1,
-0.1529085, -0.345138, -2.826525, 0, 1, 0.682353, 1,
-0.1527743, -0.7517044, -3.70088, 0, 1, 0.6862745, 1,
-0.1527355, -0.2063936, -2.003682, 0, 1, 0.6941177, 1,
-0.1520456, -0.3684354, -2.258324, 0, 1, 0.7019608, 1,
-0.1484389, -0.3903237, -0.982833, 0, 1, 0.7058824, 1,
-0.1484111, -0.05635165, -0.7496052, 0, 1, 0.7137255, 1,
-0.1467617, 0.7016308, 0.238351, 0, 1, 0.7176471, 1,
-0.1451122, 1.682926, 0.8635438, 0, 1, 0.7254902, 1,
-0.1441544, 0.3443424, -0.6090292, 0, 1, 0.7294118, 1,
-0.1428788, -2.366927, -3.950143, 0, 1, 0.7372549, 1,
-0.1425142, -0.2605686, -3.045289, 0, 1, 0.7411765, 1,
-0.140701, 1.039418, -0.6865396, 0, 1, 0.7490196, 1,
-0.1402912, -2.130446, -3.763255, 0, 1, 0.7529412, 1,
-0.1389206, 1.259005, -0.5904503, 0, 1, 0.7607843, 1,
-0.1322947, -0.1615355, -3.720357, 0, 1, 0.7647059, 1,
-0.1317756, 0.7439191, -1.12798, 0, 1, 0.772549, 1,
-0.1202853, 0.5924793, 0.8845826, 0, 1, 0.7764706, 1,
-0.1177436, 0.9555463, 0.06743072, 0, 1, 0.7843137, 1,
-0.1157193, 0.2356832, -0.1855206, 0, 1, 0.7882353, 1,
-0.1087282, -1.309883, -2.738594, 0, 1, 0.7960784, 1,
-0.1070408, -0.2878591, -2.250648, 0, 1, 0.8039216, 1,
-0.1054944, 2.23383, 0.1873451, 0, 1, 0.8078431, 1,
-0.09119473, -1.572687, -1.818806, 0, 1, 0.8156863, 1,
-0.09051201, -2.03571, -2.839889, 0, 1, 0.8196079, 1,
-0.09047375, -1.542117, -4.261544, 0, 1, 0.827451, 1,
-0.08978925, -1.285542, -3.865873, 0, 1, 0.8313726, 1,
-0.08324119, 0.2259751, -1.917332, 0, 1, 0.8392157, 1,
-0.0828592, -0.4771573, -3.59913, 0, 1, 0.8431373, 1,
-0.07977641, 1.39144, -1.117968, 0, 1, 0.8509804, 1,
-0.07861821, 0.8487729, 1.009599, 0, 1, 0.854902, 1,
-0.07615005, 1.369119, 0.5809872, 0, 1, 0.8627451, 1,
-0.07325547, -0.380055, -4.128801, 0, 1, 0.8666667, 1,
-0.07181548, -0.8305671, -1.134617, 0, 1, 0.8745098, 1,
-0.07015088, -1.274776, -3.531168, 0, 1, 0.8784314, 1,
-0.0652629, 0.5446846, 1.598274, 0, 1, 0.8862745, 1,
-0.06269702, -0.311908, -2.357543, 0, 1, 0.8901961, 1,
-0.05925797, 1.108084, -1.249614, 0, 1, 0.8980392, 1,
-0.0572457, -0.8747336, -3.162366, 0, 1, 0.9058824, 1,
-0.0567935, -1.258923, -4.020309, 0, 1, 0.9098039, 1,
-0.0567845, 0.1807621, 0.634986, 0, 1, 0.9176471, 1,
-0.05611884, -0.3090307, -2.820698, 0, 1, 0.9215686, 1,
-0.05102318, 0.9731287, 0.5264193, 0, 1, 0.9294118, 1,
-0.05058507, 0.5044166, 0.2018365, 0, 1, 0.9333333, 1,
-0.04694804, 0.5267867, -0.2176138, 0, 1, 0.9411765, 1,
-0.04241154, 0.08214941, -0.7466333, 0, 1, 0.945098, 1,
-0.04020048, -2.77006, -3.434384, 0, 1, 0.9529412, 1,
-0.03724709, -1.383035, -4.649292, 0, 1, 0.9568627, 1,
-0.02918451, 0.1585706, -1.278986, 0, 1, 0.9647059, 1,
-0.02084166, 1.343845, 0.1977259, 0, 1, 0.9686275, 1,
-0.02061025, 1.158453, 0.9531859, 0, 1, 0.9764706, 1,
-0.01620327, 0.6090481, -0.4520279, 0, 1, 0.9803922, 1,
-0.01384289, -0.9831274, -3.157498, 0, 1, 0.9882353, 1,
-0.01020699, 0.7965735, -0.09426832, 0, 1, 0.9921569, 1,
-0.008216891, -0.5340285, -1.719059, 0, 1, 1, 1,
-0.007000338, 1.045866, -0.5358152, 0, 0.9921569, 1, 1,
-0.005808274, 1.637218, 0.04704322, 0, 0.9882353, 1, 1,
-0.004537096, 0.1116535, -2.082904, 0, 0.9803922, 1, 1,
-0.002250342, 0.07683067, 1.30295, 0, 0.9764706, 1, 1,
0.001659346, -1.158558, 3.29453, 0, 0.9686275, 1, 1,
0.00192348, -0.4637053, 4.301035, 0, 0.9647059, 1, 1,
0.003308515, 1.288134, -0.4346261, 0, 0.9568627, 1, 1,
0.00622471, 0.5599982, 0.4990824, 0, 0.9529412, 1, 1,
0.0104116, -0.6549574, 3.609317, 0, 0.945098, 1, 1,
0.01333311, 0.2982977, -1.066199, 0, 0.9411765, 1, 1,
0.01341171, -1.718003, 1.965577, 0, 0.9333333, 1, 1,
0.01941948, 0.7010431, 1.055349, 0, 0.9294118, 1, 1,
0.01970372, 1.145997, 0.3875414, 0, 0.9215686, 1, 1,
0.02192198, -0.3567679, 3.343988, 0, 0.9176471, 1, 1,
0.02518011, 0.4967611, -0.6181152, 0, 0.9098039, 1, 1,
0.02565964, 0.4003142, 0.5489265, 0, 0.9058824, 1, 1,
0.02872144, 1.368636, 2.769473, 0, 0.8980392, 1, 1,
0.03023645, -0.5607632, 4.870688, 0, 0.8901961, 1, 1,
0.03142262, -0.07483281, 2.768969, 0, 0.8862745, 1, 1,
0.03250119, -0.6586102, 2.53884, 0, 0.8784314, 1, 1,
0.03768353, -0.09319722, 1.969022, 0, 0.8745098, 1, 1,
0.03905305, 0.9925622, 1.299293, 0, 0.8666667, 1, 1,
0.03980146, 0.2138012, -1.931404, 0, 0.8627451, 1, 1,
0.04558158, -0.4600287, 4.178829, 0, 0.854902, 1, 1,
0.04723088, -0.2286167, 1.562962, 0, 0.8509804, 1, 1,
0.04884784, 0.2143374, 0.1818242, 0, 0.8431373, 1, 1,
0.05163374, 1.246478, 0.1946132, 0, 0.8392157, 1, 1,
0.05682082, 0.9860444, 1.135502, 0, 0.8313726, 1, 1,
0.06164052, 0.3098305, 1.094276, 0, 0.827451, 1, 1,
0.06671578, 1.166598, 0.5355973, 0, 0.8196079, 1, 1,
0.06919996, -0.3650246, 3.393348, 0, 0.8156863, 1, 1,
0.07293892, -1.568405, 1.83885, 0, 0.8078431, 1, 1,
0.08083779, 0.1576274, -0.8559322, 0, 0.8039216, 1, 1,
0.08262136, -0.4595649, 2.623945, 0, 0.7960784, 1, 1,
0.08337146, 0.004714406, 2.648668, 0, 0.7882353, 1, 1,
0.08671505, 0.4563191, 1.238554, 0, 0.7843137, 1, 1,
0.08973425, -1.136874, 4.409295, 0, 0.7764706, 1, 1,
0.09123251, 1.190292, -0.6662132, 0, 0.772549, 1, 1,
0.09159354, 0.04939969, 0.9224789, 0, 0.7647059, 1, 1,
0.0976426, 1.938752, 0.8859619, 0, 0.7607843, 1, 1,
0.101243, 0.5864782, 0.7018117, 0, 0.7529412, 1, 1,
0.10488, -0.6643929, 1.753164, 0, 0.7490196, 1, 1,
0.1071635, 0.9777421, -1.498751, 0, 0.7411765, 1, 1,
0.1088146, -0.8946366, 1.256091, 0, 0.7372549, 1, 1,
0.1099562, -2.132393, 3.780969, 0, 0.7294118, 1, 1,
0.1107104, -0.7827262, 1.211004, 0, 0.7254902, 1, 1,
0.110923, 0.6824111, 0.3764319, 0, 0.7176471, 1, 1,
0.1133194, 1.543711, -0.9857153, 0, 0.7137255, 1, 1,
0.1198421, 0.8457511, 1.316646, 0, 0.7058824, 1, 1,
0.1248101, 1.163681, 0.5249796, 0, 0.6980392, 1, 1,
0.1252595, 0.6495945, 0.4232896, 0, 0.6941177, 1, 1,
0.1281054, 0.7354941, -1.608133, 0, 0.6862745, 1, 1,
0.1285666, 1.101465, 0.0117177, 0, 0.682353, 1, 1,
0.1286321, -1.22961, 3.881401, 0, 0.6745098, 1, 1,
0.1313991, 1.257233, 0.8344257, 0, 0.6705883, 1, 1,
0.1317098, -0.29749, 3.227017, 0, 0.6627451, 1, 1,
0.1335492, -1.5085, 4.817474, 0, 0.6588235, 1, 1,
0.134293, -0.2649323, 2.325873, 0, 0.6509804, 1, 1,
0.1345615, 0.8454401, 0.4717992, 0, 0.6470588, 1, 1,
0.136276, 0.7376828, 1.589737, 0, 0.6392157, 1, 1,
0.1379051, -0.571945, 2.079724, 0, 0.6352941, 1, 1,
0.1395848, 1.214046, -0.3477913, 0, 0.627451, 1, 1,
0.139912, 1.382517, 0.8131198, 0, 0.6235294, 1, 1,
0.1402902, 1.443008, 0.3981853, 0, 0.6156863, 1, 1,
0.1411515, -0.5068363, 1.075581, 0, 0.6117647, 1, 1,
0.1416995, 0.8206552, -0.5116583, 0, 0.6039216, 1, 1,
0.1427024, -0.8747135, 3.034431, 0, 0.5960785, 1, 1,
0.1461343, 3.783945, 0.5719223, 0, 0.5921569, 1, 1,
0.1555217, -0.8637745, 2.765074, 0, 0.5843138, 1, 1,
0.1555758, 0.6176667, 0.2964422, 0, 0.5803922, 1, 1,
0.1693403, -2.359539, 3.800351, 0, 0.572549, 1, 1,
0.1706751, 0.8651302, -0.6433559, 0, 0.5686275, 1, 1,
0.1710969, -2.4184, 3.082132, 0, 0.5607843, 1, 1,
0.1748103, -1.659724, 1.656623, 0, 0.5568628, 1, 1,
0.1748476, 0.9323893, 1.125355, 0, 0.5490196, 1, 1,
0.1904297, 1.073092, 1.231838, 0, 0.5450981, 1, 1,
0.1957837, 2.121442, 0.1241105, 0, 0.5372549, 1, 1,
0.2002421, 0.1302928, 0.5915722, 0, 0.5333334, 1, 1,
0.2007769, -0.2299636, 3.470172, 0, 0.5254902, 1, 1,
0.2031056, 1.325639, -0.844855, 0, 0.5215687, 1, 1,
0.20482, 0.7613883, 0.8532448, 0, 0.5137255, 1, 1,
0.2052939, -1.147708, 1.13662, 0, 0.509804, 1, 1,
0.2079883, 0.2472271, 1.217475, 0, 0.5019608, 1, 1,
0.2132202, 0.4685056, 1.393171, 0, 0.4941176, 1, 1,
0.2153764, -1.739853, 4.718194, 0, 0.4901961, 1, 1,
0.2161043, 1.222029, 2.275353, 0, 0.4823529, 1, 1,
0.2242784, -0.369683, 3.306719, 0, 0.4784314, 1, 1,
0.2327057, -0.2769565, 2.771884, 0, 0.4705882, 1, 1,
0.2344799, 0.4945509, 0.2799769, 0, 0.4666667, 1, 1,
0.2370632, -0.9268303, 2.270556, 0, 0.4588235, 1, 1,
0.2380684, 0.9916282, 0.3025417, 0, 0.454902, 1, 1,
0.2401397, -1.890831, 2.09839, 0, 0.4470588, 1, 1,
0.2412622, 0.7368333, 1.569467, 0, 0.4431373, 1, 1,
0.2427577, 0.8977153, 0.4444738, 0, 0.4352941, 1, 1,
0.2480198, -0.9907793, 4.980635, 0, 0.4313726, 1, 1,
0.2505268, 1.032266, -0.1815424, 0, 0.4235294, 1, 1,
0.2523719, -0.7747493, 5.301908, 0, 0.4196078, 1, 1,
0.2535263, 0.04526281, 3.040232, 0, 0.4117647, 1, 1,
0.2540837, -0.3522396, 3.208737, 0, 0.4078431, 1, 1,
0.2608555, 0.6886182, 0.1613684, 0, 0.4, 1, 1,
0.2641474, 2.070858, -0.075748, 0, 0.3921569, 1, 1,
0.2656623, 1.19374, 0.1421626, 0, 0.3882353, 1, 1,
0.2661658, 0.390192, -0.726046, 0, 0.3803922, 1, 1,
0.2672604, 0.2470117, 2.215618, 0, 0.3764706, 1, 1,
0.267416, 0.5805471, -1.164773, 0, 0.3686275, 1, 1,
0.2698904, 0.2378914, 1.125599, 0, 0.3647059, 1, 1,
0.2781549, -0.8819245, 2.346421, 0, 0.3568628, 1, 1,
0.2795126, 0.1677671, 2.483748, 0, 0.3529412, 1, 1,
0.2796248, 0.5460652, 0.9652374, 0, 0.345098, 1, 1,
0.2806087, 1.393812, -0.02137927, 0, 0.3411765, 1, 1,
0.2836423, 0.9391143, 0.3575659, 0, 0.3333333, 1, 1,
0.2870055, 0.5690958, -0.5545885, 0, 0.3294118, 1, 1,
0.2899092, -0.3232952, 1.803143, 0, 0.3215686, 1, 1,
0.2903667, -1.575463, 5.4656, 0, 0.3176471, 1, 1,
0.2913395, 0.5769926, 0.2121054, 0, 0.3098039, 1, 1,
0.3010266, -0.2473969, 3.69248, 0, 0.3058824, 1, 1,
0.301351, -1.038494, 3.483588, 0, 0.2980392, 1, 1,
0.3122365, 1.158806, 1.232698, 0, 0.2901961, 1, 1,
0.3127765, 0.2532952, 0.3909772, 0, 0.2862745, 1, 1,
0.3148764, 0.1940974, 1.830391, 0, 0.2784314, 1, 1,
0.3172801, 0.3859078, 1.827003, 0, 0.2745098, 1, 1,
0.3181975, 0.1672748, 1.661833, 0, 0.2666667, 1, 1,
0.3216373, 2.128099, -0.7104557, 0, 0.2627451, 1, 1,
0.322511, 0.2663222, -0.252679, 0, 0.254902, 1, 1,
0.3240266, -0.9597287, 2.656716, 0, 0.2509804, 1, 1,
0.3260564, 0.835842, 1.454963, 0, 0.2431373, 1, 1,
0.3272955, -0.06956642, 2.988892, 0, 0.2392157, 1, 1,
0.3337063, -1.269551, 2.647492, 0, 0.2313726, 1, 1,
0.3350038, 0.1457661, 0.3953688, 0, 0.227451, 1, 1,
0.342025, -0.01330007, 2.37804, 0, 0.2196078, 1, 1,
0.3434766, 0.1059627, 1.423842, 0, 0.2156863, 1, 1,
0.3462293, -0.9646541, 4.543428, 0, 0.2078431, 1, 1,
0.3468191, -0.01212032, 2.755712, 0, 0.2039216, 1, 1,
0.3474133, 0.5144013, 1.037623, 0, 0.1960784, 1, 1,
0.3489473, -0.5254651, 0.7116342, 0, 0.1882353, 1, 1,
0.3519284, -0.1706833, 0.5374994, 0, 0.1843137, 1, 1,
0.3520595, -0.5609096, 1.261382, 0, 0.1764706, 1, 1,
0.353001, 0.4999873, 0.2691086, 0, 0.172549, 1, 1,
0.353407, 1.656501, 0.6278211, 0, 0.1647059, 1, 1,
0.3544714, 0.5283958, -1.644833, 0, 0.1607843, 1, 1,
0.3548366, -1.530134, 4.408941, 0, 0.1529412, 1, 1,
0.3677392, 0.7958836, -0.626923, 0, 0.1490196, 1, 1,
0.3696885, 1.115517, 1.181113, 0, 0.1411765, 1, 1,
0.3764231, 0.3304147, 0.470755, 0, 0.1372549, 1, 1,
0.3764946, -0.3051282, 1.463772, 0, 0.1294118, 1, 1,
0.3781798, 0.0001931014, 0.6445196, 0, 0.1254902, 1, 1,
0.3827281, -0.9813103, 2.94856, 0, 0.1176471, 1, 1,
0.3859393, 1.024083, -0.1959536, 0, 0.1137255, 1, 1,
0.39013, 0.1324801, 1.462398, 0, 0.1058824, 1, 1,
0.3933819, 0.4831817, 2.350893, 0, 0.09803922, 1, 1,
0.3934709, 1.211311, 0.5961705, 0, 0.09411765, 1, 1,
0.3948081, -0.8212004, 1.992007, 0, 0.08627451, 1, 1,
0.3982289, -0.5588412, 1.843586, 0, 0.08235294, 1, 1,
0.4014116, 1.528166, -0.9168191, 0, 0.07450981, 1, 1,
0.4037169, 1.469193, 0.5177974, 0, 0.07058824, 1, 1,
0.4054373, 0.5749025, 2.097951, 0, 0.0627451, 1, 1,
0.4073998, -0.9206074, 2.568366, 0, 0.05882353, 1, 1,
0.4074651, 0.1680226, 2.95404, 0, 0.05098039, 1, 1,
0.4136649, 0.05569504, 1.322039, 0, 0.04705882, 1, 1,
0.414041, 1.688036, -0.7130542, 0, 0.03921569, 1, 1,
0.4158614, 0.607421, -0.6880614, 0, 0.03529412, 1, 1,
0.4167492, 1.379156, -0.1538269, 0, 0.02745098, 1, 1,
0.4201709, -1.369187, 2.26469, 0, 0.02352941, 1, 1,
0.4239626, 1.959974, 1.129057, 0, 0.01568628, 1, 1,
0.4245929, 0.1626855, -0.9269273, 0, 0.01176471, 1, 1,
0.4270016, 0.593183, 1.753243, 0, 0.003921569, 1, 1,
0.4301087, -0.3888972, 1.256003, 0.003921569, 0, 1, 1,
0.4302365, -0.2695542, 2.365853, 0.007843138, 0, 1, 1,
0.4320988, 0.9579833, 0.4570277, 0.01568628, 0, 1, 1,
0.4333681, -0.3537289, 0.9609919, 0.01960784, 0, 1, 1,
0.4356351, 1.04797, 0.9342407, 0.02745098, 0, 1, 1,
0.4357144, 1.339234, 0.5213481, 0.03137255, 0, 1, 1,
0.4391052, 0.3530218, 0.6952274, 0.03921569, 0, 1, 1,
0.4417634, 0.6067636, -0.9896408, 0.04313726, 0, 1, 1,
0.4438435, -0.5388705, 3.354012, 0.05098039, 0, 1, 1,
0.4443938, 1.180391, -0.1591625, 0.05490196, 0, 1, 1,
0.4459966, 0.2719372, 0.8163024, 0.0627451, 0, 1, 1,
0.4508296, 0.4322156, -0.255123, 0.06666667, 0, 1, 1,
0.4521557, 0.8700835, 0.1841404, 0.07450981, 0, 1, 1,
0.4530842, -0.9510817, 0.2688939, 0.07843138, 0, 1, 1,
0.4570995, 0.3286399, -0.8546923, 0.08627451, 0, 1, 1,
0.4586599, 0.6887023, 0.9474372, 0.09019608, 0, 1, 1,
0.4651355, 1.343638, -0.2439636, 0.09803922, 0, 1, 1,
0.4688521, 0.5926162, -0.9362192, 0.1058824, 0, 1, 1,
0.4710943, 1.167764, -0.08702169, 0.1098039, 0, 1, 1,
0.4738518, -0.4198224, 2.28582, 0.1176471, 0, 1, 1,
0.4748543, -1.145232, 3.77438, 0.1215686, 0, 1, 1,
0.4793304, 0.6004636, 0.5708662, 0.1294118, 0, 1, 1,
0.4799398, -0.8809724, 1.627993, 0.1333333, 0, 1, 1,
0.4805245, 0.7528296, 1.341725, 0.1411765, 0, 1, 1,
0.4817106, 2.337301, 1.744157, 0.145098, 0, 1, 1,
0.4827242, 0.4170979, 0.1619332, 0.1529412, 0, 1, 1,
0.4955411, -1.169334, 4.309594, 0.1568628, 0, 1, 1,
0.4968435, -1.18656, 3.245258, 0.1647059, 0, 1, 1,
0.4975458, 0.9190876, 2.734646, 0.1686275, 0, 1, 1,
0.4985365, 0.613963, 0.2187745, 0.1764706, 0, 1, 1,
0.500604, -0.3981944, 1.981479, 0.1803922, 0, 1, 1,
0.5119545, 0.01825985, -0.112457, 0.1882353, 0, 1, 1,
0.5276157, -0.8007543, 4.266167, 0.1921569, 0, 1, 1,
0.5308172, -2.640559, 3.327655, 0.2, 0, 1, 1,
0.5322104, -1.258799, 1.653763, 0.2078431, 0, 1, 1,
0.5329351, 2.758154, -0.6492342, 0.2117647, 0, 1, 1,
0.5355108, 0.2481312, 1.90948, 0.2196078, 0, 1, 1,
0.5366988, -0.3453889, 1.833645, 0.2235294, 0, 1, 1,
0.5422736, 0.4746009, 1.434819, 0.2313726, 0, 1, 1,
0.5513898, -1.057662, 3.198206, 0.2352941, 0, 1, 1,
0.5608056, 1.548531, -0.859239, 0.2431373, 0, 1, 1,
0.5608959, -0.9881747, 2.239243, 0.2470588, 0, 1, 1,
0.5671181, 2.029948, -0.04122416, 0.254902, 0, 1, 1,
0.5712957, -0.1316146, 0.4714598, 0.2588235, 0, 1, 1,
0.5746356, 0.9404843, -0.1896807, 0.2666667, 0, 1, 1,
0.5763341, 0.02976315, 1.039307, 0.2705882, 0, 1, 1,
0.581732, 2.027731, -0.8257783, 0.2784314, 0, 1, 1,
0.5836869, 0.9894738, 1.415938, 0.282353, 0, 1, 1,
0.5839014, 0.6621775, 1.52835, 0.2901961, 0, 1, 1,
0.5849208, -0.4194029, 4.576735, 0.2941177, 0, 1, 1,
0.5851248, -1.104204, 3.472627, 0.3019608, 0, 1, 1,
0.5856963, 1.292295, -1.392872, 0.3098039, 0, 1, 1,
0.5896066, 1.134542, 0.9078342, 0.3137255, 0, 1, 1,
0.5897597, 0.9378105, -0.3284684, 0.3215686, 0, 1, 1,
0.5905961, -0.4371885, 2.714186, 0.3254902, 0, 1, 1,
0.5920123, -1.870914, 2.888353, 0.3333333, 0, 1, 1,
0.5946202, 0.7227523, -0.5270268, 0.3372549, 0, 1, 1,
0.5956873, 0.6528311, 0.8033524, 0.345098, 0, 1, 1,
0.5991939, -0.3044026, 3.309496, 0.3490196, 0, 1, 1,
0.6099373, 1.754671, 1.265157, 0.3568628, 0, 1, 1,
0.6139007, -0.920574, 3.328404, 0.3607843, 0, 1, 1,
0.6142213, 0.3883236, 0.4469693, 0.3686275, 0, 1, 1,
0.6219274, 2.14851, 0.4991062, 0.372549, 0, 1, 1,
0.6226462, 1.148374, 0.442087, 0.3803922, 0, 1, 1,
0.6228961, 0.2227833, -1.050433, 0.3843137, 0, 1, 1,
0.6247234, 0.1887967, 0.8172262, 0.3921569, 0, 1, 1,
0.6273746, -0.1332519, 1.158708, 0.3960784, 0, 1, 1,
0.6276326, -0.2342489, 2.433866, 0.4039216, 0, 1, 1,
0.6285378, -0.6104811, 3.194281, 0.4117647, 0, 1, 1,
0.633587, 1.585974, -0.6371236, 0.4156863, 0, 1, 1,
0.638484, -0.748027, 1.852267, 0.4235294, 0, 1, 1,
0.6402418, -0.4327799, 2.315774, 0.427451, 0, 1, 1,
0.6439615, -0.174697, 1.987832, 0.4352941, 0, 1, 1,
0.6472552, -0.5500981, 4.78445, 0.4392157, 0, 1, 1,
0.6510277, -1.224192, 2.168731, 0.4470588, 0, 1, 1,
0.6556686, -2.172554, 5.216469, 0.4509804, 0, 1, 1,
0.656496, 0.731091, 0.4166665, 0.4588235, 0, 1, 1,
0.659924, 0.1266918, 2.578932, 0.4627451, 0, 1, 1,
0.6604858, -0.867632, 2.812036, 0.4705882, 0, 1, 1,
0.6619685, 1.835596, 0.9008179, 0.4745098, 0, 1, 1,
0.6628017, 1.278506, 0.7989537, 0.4823529, 0, 1, 1,
0.6631106, 0.824362, 0.629898, 0.4862745, 0, 1, 1,
0.6721841, -1.296401, 2.180764, 0.4941176, 0, 1, 1,
0.6731052, 0.9480107, 0.7324326, 0.5019608, 0, 1, 1,
0.6756011, -1.077358, 2.618875, 0.5058824, 0, 1, 1,
0.6773378, 1.25242, -0.3220354, 0.5137255, 0, 1, 1,
0.6880493, -0.5553559, 3.134845, 0.5176471, 0, 1, 1,
0.6902855, -0.8159757, 2.427367, 0.5254902, 0, 1, 1,
0.6930537, 1.025348, 2.489897, 0.5294118, 0, 1, 1,
0.6950122, 0.9536527, 1.216356, 0.5372549, 0, 1, 1,
0.7001782, -0.6024533, 2.623125, 0.5411765, 0, 1, 1,
0.7016167, -0.6958264, 2.935915, 0.5490196, 0, 1, 1,
0.7027562, -1.209047, 1.203038, 0.5529412, 0, 1, 1,
0.7047005, -0.6664133, 2.619646, 0.5607843, 0, 1, 1,
0.7055646, 2.165913, 1.039469, 0.5647059, 0, 1, 1,
0.7058675, 2.496299, -1.053123, 0.572549, 0, 1, 1,
0.711107, 0.1667928, 2.493345, 0.5764706, 0, 1, 1,
0.7131348, -1.344321, 1.82738, 0.5843138, 0, 1, 1,
0.7138764, -0.5195179, 2.794438, 0.5882353, 0, 1, 1,
0.7196848, -1.367079, 2.332535, 0.5960785, 0, 1, 1,
0.7206595, 0.2429837, 4.199697, 0.6039216, 0, 1, 1,
0.7263978, -0.8621976, 0.4995537, 0.6078432, 0, 1, 1,
0.7294497, 1.184689, 1.588412, 0.6156863, 0, 1, 1,
0.7325149, -2.234522, 2.484631, 0.6196079, 0, 1, 1,
0.7351975, 0.6468416, 1.850416, 0.627451, 0, 1, 1,
0.7368519, -1.571719, 4.008141, 0.6313726, 0, 1, 1,
0.7397043, -1.317553, -0.3304718, 0.6392157, 0, 1, 1,
0.7400253, -1.64197, 2.653314, 0.6431373, 0, 1, 1,
0.7413807, -0.1232199, 4.530172, 0.6509804, 0, 1, 1,
0.743149, 0.7143804, 1.10222, 0.654902, 0, 1, 1,
0.7459388, -0.3532039, 2.486752, 0.6627451, 0, 1, 1,
0.7464277, -1.019676, 1.393254, 0.6666667, 0, 1, 1,
0.746486, 0.02374757, 0.4040332, 0.6745098, 0, 1, 1,
0.7489458, 1.709427, 1.049488, 0.6784314, 0, 1, 1,
0.7506843, -1.244469, 2.181777, 0.6862745, 0, 1, 1,
0.7536769, -0.7576605, 3.05566, 0.6901961, 0, 1, 1,
0.7542294, -1.414749, 4.073318, 0.6980392, 0, 1, 1,
0.7553254, 0.3422911, 2.397374, 0.7058824, 0, 1, 1,
0.7577248, 0.2877142, 1.60234, 0.7098039, 0, 1, 1,
0.7633103, -0.1125704, 1.34138, 0.7176471, 0, 1, 1,
0.7659258, 0.1180869, 0.5541755, 0.7215686, 0, 1, 1,
0.7709066, -0.1297115, 2.058403, 0.7294118, 0, 1, 1,
0.7712296, -0.4425915, 0.00661768, 0.7333333, 0, 1, 1,
0.7784413, -3.1111, 2.229972, 0.7411765, 0, 1, 1,
0.7805662, 0.1270554, 2.24486, 0.7450981, 0, 1, 1,
0.7833927, 0.311897, 1.298409, 0.7529412, 0, 1, 1,
0.7852411, -0.05314191, 0.8583512, 0.7568628, 0, 1, 1,
0.7884992, -0.6305809, 2.882146, 0.7647059, 0, 1, 1,
0.7902225, -0.9820557, 2.97869, 0.7686275, 0, 1, 1,
0.8065721, -1.096025, 2.142404, 0.7764706, 0, 1, 1,
0.8097465, -0.5387911, 1.420609, 0.7803922, 0, 1, 1,
0.8257436, -0.5227649, 2.374922, 0.7882353, 0, 1, 1,
0.8288867, 0.2802892, -0.5482077, 0.7921569, 0, 1, 1,
0.8336071, -0.4850442, 3.020929, 0.8, 0, 1, 1,
0.8338306, -0.1945814, 1.071621, 0.8078431, 0, 1, 1,
0.8353375, 0.4402799, 1.345814, 0.8117647, 0, 1, 1,
0.8444437, -0.8924404, 2.446975, 0.8196079, 0, 1, 1,
0.8501169, 0.972099, 1.705656, 0.8235294, 0, 1, 1,
0.8536198, 0.5139406, 1.416344, 0.8313726, 0, 1, 1,
0.8539045, -0.6324517, 1.506497, 0.8352941, 0, 1, 1,
0.8557474, 0.008397721, 2.907706, 0.8431373, 0, 1, 1,
0.8578026, 0.9780691, -0.514345, 0.8470588, 0, 1, 1,
0.8592772, -1.104108, 2.650061, 0.854902, 0, 1, 1,
0.8615831, -1.099326, 2.8089, 0.8588235, 0, 1, 1,
0.8620795, 0.8153162, 1.564191, 0.8666667, 0, 1, 1,
0.8795905, 0.7792059, 2.216658, 0.8705882, 0, 1, 1,
0.8865436, 0.9958494, 1.550052, 0.8784314, 0, 1, 1,
0.8875942, 0.3111877, 0.6097475, 0.8823529, 0, 1, 1,
0.8899091, 1.79334, -0.8320329, 0.8901961, 0, 1, 1,
0.890516, 0.5839409, 1.947794, 0.8941177, 0, 1, 1,
0.8919122, 1.446557, 0.1021054, 0.9019608, 0, 1, 1,
0.8937678, -0.1358485, 3.766882, 0.9098039, 0, 1, 1,
0.8943055, 1.834216, 0.7406837, 0.9137255, 0, 1, 1,
0.9059156, 0.4133362, 2.078619, 0.9215686, 0, 1, 1,
0.9095769, 0.2440989, 2.073492, 0.9254902, 0, 1, 1,
0.9097372, -0.8314685, 3.68161, 0.9333333, 0, 1, 1,
0.9184458, -1.04872, 0.4525673, 0.9372549, 0, 1, 1,
0.9231534, 2.06143, 1.639802, 0.945098, 0, 1, 1,
0.9240137, -1.48676, 3.472128, 0.9490196, 0, 1, 1,
0.9311171, 0.8629647, 1.817542, 0.9568627, 0, 1, 1,
0.9323259, 0.1016769, 2.078036, 0.9607843, 0, 1, 1,
0.9328356, -1.242773, 1.312581, 0.9686275, 0, 1, 1,
0.9435377, 1.259988, 1.784501, 0.972549, 0, 1, 1,
0.94694, -0.77319, 1.636905, 0.9803922, 0, 1, 1,
0.9511785, 1.022423, 2.035152, 0.9843137, 0, 1, 1,
0.9548289, 1.53208, 0.5353499, 0.9921569, 0, 1, 1,
0.9574393, -0.2312119, 2.032775, 0.9960784, 0, 1, 1,
0.9594719, -0.9400856, 3.641305, 1, 0, 0.9960784, 1,
0.9654688, -0.9877403, 1.587331, 1, 0, 0.9882353, 1,
0.9672159, 0.8363234, 0.5213227, 1, 0, 0.9843137, 1,
0.9681255, -1.146053, 3.490853, 1, 0, 0.9764706, 1,
0.971057, 0.02038734, 0.3322265, 1, 0, 0.972549, 1,
0.9727665, 0.5392824, 0.1738049, 1, 0, 0.9647059, 1,
0.9740246, 0.4107594, -0.09905487, 1, 0, 0.9607843, 1,
0.9781086, -1.15676, 1.814785, 1, 0, 0.9529412, 1,
0.9815505, 1.95199, 2.04572, 1, 0, 0.9490196, 1,
0.9847414, -0.4761479, 3.448611, 1, 0, 0.9411765, 1,
0.9977245, 0.1569636, 1.224999, 1, 0, 0.9372549, 1,
1.002339, 1.062474, 1.466366, 1, 0, 0.9294118, 1,
1.005643, -0.8392284, 0.7338172, 1, 0, 0.9254902, 1,
1.024166, -2.475102, 2.003317, 1, 0, 0.9176471, 1,
1.024744, -0.3106519, 2.543499, 1, 0, 0.9137255, 1,
1.034122, -0.8502744, 2.398859, 1, 0, 0.9058824, 1,
1.035192, -0.09152019, 3.518485, 1, 0, 0.9019608, 1,
1.036416, 0.00176766, 1.3352, 1, 0, 0.8941177, 1,
1.038688, -1.381718, 2.804911, 1, 0, 0.8862745, 1,
1.041943, -1.733182, 2.390148, 1, 0, 0.8823529, 1,
1.047663, 0.1183199, 1.739901, 1, 0, 0.8745098, 1,
1.050167, -0.8028122, 0.3399396, 1, 0, 0.8705882, 1,
1.055598, 2.330122, 0.6649231, 1, 0, 0.8627451, 1,
1.059897, 1.360125, -0.1539443, 1, 0, 0.8588235, 1,
1.067765, -0.9407533, 1.326917, 1, 0, 0.8509804, 1,
1.071242, 0.9401615, 1.249588, 1, 0, 0.8470588, 1,
1.073179, -0.1068434, 2.162609, 1, 0, 0.8392157, 1,
1.076341, 1.020049, 0.6769425, 1, 0, 0.8352941, 1,
1.080588, -0.7910488, 3.44662, 1, 0, 0.827451, 1,
1.080609, 0.09060573, 1.062271, 1, 0, 0.8235294, 1,
1.082337, 1.62672, 1.54186, 1, 0, 0.8156863, 1,
1.089369, -1.649387, 1.719982, 1, 0, 0.8117647, 1,
1.090153, -0.2451521, -0.4688045, 1, 0, 0.8039216, 1,
1.091357, -1.043923, 3.855094, 1, 0, 0.7960784, 1,
1.094517, 0.3936483, 2.454231, 1, 0, 0.7921569, 1,
1.097298, -0.08169495, 1.84079, 1, 0, 0.7843137, 1,
1.103169, -0.05242369, 0.939834, 1, 0, 0.7803922, 1,
1.103957, 0.1958541, 0.5071671, 1, 0, 0.772549, 1,
1.106915, 1.121871, 0.7326206, 1, 0, 0.7686275, 1,
1.1091, 1.117482, 2.043671, 1, 0, 0.7607843, 1,
1.111684, -0.9543243, 1.520087, 1, 0, 0.7568628, 1,
1.113666, -0.1796838, 4.168499, 1, 0, 0.7490196, 1,
1.124556, -0.9290689, 2.511721, 1, 0, 0.7450981, 1,
1.146423, -0.7770507, 3.222629, 1, 0, 0.7372549, 1,
1.1474, -0.6320801, 1.489818, 1, 0, 0.7333333, 1,
1.15456, 1.411538, -0.09232576, 1, 0, 0.7254902, 1,
1.155282, 1.257162, 1.286701, 1, 0, 0.7215686, 1,
1.156421, -1.068112, 3.346431, 1, 0, 0.7137255, 1,
1.166896, 0.4014337, 0.7418272, 1, 0, 0.7098039, 1,
1.17179, 1.160773, -0.07347456, 1, 0, 0.7019608, 1,
1.173882, -0.2437124, 1.316187, 1, 0, 0.6941177, 1,
1.178044, 0.4660383, 2.419434, 1, 0, 0.6901961, 1,
1.181275, -0.44041, 2.785042, 1, 0, 0.682353, 1,
1.188136, -0.877589, 1.833679, 1, 0, 0.6784314, 1,
1.189381, 0.3849669, 2.458556, 1, 0, 0.6705883, 1,
1.194506, -2.357275, 2.03297, 1, 0, 0.6666667, 1,
1.202123, -0.1976578, 0.7603315, 1, 0, 0.6588235, 1,
1.219785, -0.2356963, 0.6560825, 1, 0, 0.654902, 1,
1.226817, -0.6890824, 2.452727, 1, 0, 0.6470588, 1,
1.22918, -0.5774845, 0.7835331, 1, 0, 0.6431373, 1,
1.230727, 0.2915307, 2.102095, 1, 0, 0.6352941, 1,
1.23447, 0.9107631, 1.506552, 1, 0, 0.6313726, 1,
1.237931, 0.2102884, 0.1820392, 1, 0, 0.6235294, 1,
1.24312, 1.108077, 1.379986, 1, 0, 0.6196079, 1,
1.244638, 0.1996153, 2.836387, 1, 0, 0.6117647, 1,
1.249354, -1.05465, 2.28897, 1, 0, 0.6078432, 1,
1.251524, -1.708232, 4.198281, 1, 0, 0.6, 1,
1.256123, 0.6413356, 1.501391, 1, 0, 0.5921569, 1,
1.256574, -0.6820755, 2.018216, 1, 0, 0.5882353, 1,
1.259666, 1.142397, 0.4444332, 1, 0, 0.5803922, 1,
1.279254, -0.7350464, 2.65065, 1, 0, 0.5764706, 1,
1.282198, 0.3247534, 1.84989, 1, 0, 0.5686275, 1,
1.286068, 0.8181793, 0.9849226, 1, 0, 0.5647059, 1,
1.298598, -0.5163412, 3.295736, 1, 0, 0.5568628, 1,
1.309316, -0.599927, 1.823625, 1, 0, 0.5529412, 1,
1.311227, 0.04043703, -0.03718955, 1, 0, 0.5450981, 1,
1.313335, -2.396404, 3.251919, 1, 0, 0.5411765, 1,
1.317333, 1.794593, 2.254455, 1, 0, 0.5333334, 1,
1.328487, -0.2504114, 1.796923, 1, 0, 0.5294118, 1,
1.335461, -0.6457462, 2.36217, 1, 0, 0.5215687, 1,
1.342387, -1.624914, 2.258139, 1, 0, 0.5176471, 1,
1.354503, 1.153671, 1.182292, 1, 0, 0.509804, 1,
1.355681, -0.7595239, 1.721329, 1, 0, 0.5058824, 1,
1.357441, 0.1016858, 2.503259, 1, 0, 0.4980392, 1,
1.381088, -0.5950355, 1.490098, 1, 0, 0.4901961, 1,
1.381961, 0.8750069, 0.8215051, 1, 0, 0.4862745, 1,
1.391873, 1.369162, 0.643017, 1, 0, 0.4784314, 1,
1.396783, 0.3347506, 1.407212, 1, 0, 0.4745098, 1,
1.397434, 0.3796176, 2.391112, 1, 0, 0.4666667, 1,
1.399143, -0.1560254, 2.439857, 1, 0, 0.4627451, 1,
1.402455, 1.067445, 1.833377, 1, 0, 0.454902, 1,
1.403013, 0.9670775, 3.000909, 1, 0, 0.4509804, 1,
1.406265, 0.3730178, 1.841611, 1, 0, 0.4431373, 1,
1.410206, 0.1049988, 0.8475558, 1, 0, 0.4392157, 1,
1.422202, -1.857398, 3.853326, 1, 0, 0.4313726, 1,
1.424481, -2.606435, 1.573731, 1, 0, 0.427451, 1,
1.434119, 0.5870706, 0.1518934, 1, 0, 0.4196078, 1,
1.434305, -0.874086, 0.4528387, 1, 0, 0.4156863, 1,
1.452201, 1.260141, 1.424709, 1, 0, 0.4078431, 1,
1.460238, 1.316655, 2.628422, 1, 0, 0.4039216, 1,
1.471155, -1.300496, 2.220201, 1, 0, 0.3960784, 1,
1.490555, 0.1576063, 2.719286, 1, 0, 0.3882353, 1,
1.496569, -0.5022632, 2.879068, 1, 0, 0.3843137, 1,
1.516986, -2.242595, 1.85546, 1, 0, 0.3764706, 1,
1.518673, 0.4217696, 2.886325, 1, 0, 0.372549, 1,
1.527647, 0.9547534, -0.5564843, 1, 0, 0.3647059, 1,
1.548755, -0.2461371, 0.6797512, 1, 0, 0.3607843, 1,
1.571816, -0.6229244, 2.650668, 1, 0, 0.3529412, 1,
1.574442, -0.9363752, 1.419802, 1, 0, 0.3490196, 1,
1.574764, -1.908107, 2.927364, 1, 0, 0.3411765, 1,
1.577614, -1.01084, 1.458397, 1, 0, 0.3372549, 1,
1.583278, -0.6191995, 2.010344, 1, 0, 0.3294118, 1,
1.599505, -0.771807, 1.424445, 1, 0, 0.3254902, 1,
1.600118, -1.248125, 3.553193, 1, 0, 0.3176471, 1,
1.600926, -0.1356347, 3.92802, 1, 0, 0.3137255, 1,
1.603541, 0.4493057, 1.321059, 1, 0, 0.3058824, 1,
1.612226, 2.392642, -0.4764384, 1, 0, 0.2980392, 1,
1.622092, -0.3593898, 1.160767, 1, 0, 0.2941177, 1,
1.630477, -2.031656, 2.818343, 1, 0, 0.2862745, 1,
1.636721, 0.5371205, 0.5670936, 1, 0, 0.282353, 1,
1.671131, 0.2002244, 1.211016, 1, 0, 0.2745098, 1,
1.684866, 0.6938489, 0.6449846, 1, 0, 0.2705882, 1,
1.68512, 0.5012065, 0.9317042, 1, 0, 0.2627451, 1,
1.692064, 0.2682328, 3.94878, 1, 0, 0.2588235, 1,
1.715094, 0.041722, 1.376226, 1, 0, 0.2509804, 1,
1.716183, -0.6035879, 2.161265, 1, 0, 0.2470588, 1,
1.735774, -0.3380461, 1.393315, 1, 0, 0.2392157, 1,
1.740669, -0.6826561, 1.209729, 1, 0, 0.2352941, 1,
1.779327, -0.1063094, 0.9019853, 1, 0, 0.227451, 1,
1.787768, -1.003738, 0.6572986, 1, 0, 0.2235294, 1,
1.792404, -0.8921934, 1.841095, 1, 0, 0.2156863, 1,
1.800302, -1.135158, -0.04868797, 1, 0, 0.2117647, 1,
1.806038, -0.629007, 2.222102, 1, 0, 0.2039216, 1,
1.809929, -0.2397874, 2.750235, 1, 0, 0.1960784, 1,
1.836645, 0.0204164, 3.460192, 1, 0, 0.1921569, 1,
1.864658, -0.5671254, 1.18045, 1, 0, 0.1843137, 1,
1.868255, 0.3767742, 0.9281878, 1, 0, 0.1803922, 1,
1.873321, 1.58127, -0.008733209, 1, 0, 0.172549, 1,
1.899857, -1.142977, 2.17962, 1, 0, 0.1686275, 1,
1.928871, -0.1834849, 1.240435, 1, 0, 0.1607843, 1,
1.946432, 1.793939, 1.636571, 1, 0, 0.1568628, 1,
1.952554, 0.2926213, 0.1263611, 1, 0, 0.1490196, 1,
1.954259, 0.1121071, 1.884429, 1, 0, 0.145098, 1,
1.956199, 0.2880009, 1.613489, 1, 0, 0.1372549, 1,
1.961353, 1.552405, -1.127649, 1, 0, 0.1333333, 1,
2.023744, 0.6060351, 1.696948, 1, 0, 0.1254902, 1,
2.034245, 0.1713261, 1.387044, 1, 0, 0.1215686, 1,
2.036199, 0.915283, 0.8490599, 1, 0, 0.1137255, 1,
2.085237, 1.117992, 1.899942, 1, 0, 0.1098039, 1,
2.090652, 0.933645, 1.004257, 1, 0, 0.1019608, 1,
2.098399, 2.285982, 1.52154, 1, 0, 0.09411765, 1,
2.112881, -0.6348238, -0.1563636, 1, 0, 0.09019608, 1,
2.12442, -1.223289, 2.908405, 1, 0, 0.08235294, 1,
2.146388, 0.2688071, -0.1284868, 1, 0, 0.07843138, 1,
2.216294, -1.403994, 2.508528, 1, 0, 0.07058824, 1,
2.322386, 0.5229415, 2.374858, 1, 0, 0.06666667, 1,
2.343859, 0.2315086, -0.9876209, 1, 0, 0.05882353, 1,
2.363266, 0.8101554, 1.062594, 1, 0, 0.05490196, 1,
2.382952, -0.8503581, 2.089304, 1, 0, 0.04705882, 1,
2.417425, 0.2371528, 0.08662615, 1, 0, 0.04313726, 1,
2.452203, -1.508456, 2.121142, 1, 0, 0.03529412, 1,
2.505455, -0.6308669, 2.523868, 1, 0, 0.03137255, 1,
2.530821, 1.793121, -0.2464876, 1, 0, 0.02352941, 1,
2.590322, -0.7941822, 1.238246, 1, 0, 0.01960784, 1,
2.701359, -0.6147915, 1.388601, 1, 0, 0.01176471, 1,
2.838361, -0.6377534, 1.481753, 1, 0, 0.007843138, 1
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
-0.1355802, -4.27981, -7.209316, 0, -0.5, 0.5, 0.5,
-0.1355802, -4.27981, -7.209316, 1, -0.5, 0.5, 0.5,
-0.1355802, -4.27981, -7.209316, 1, 1.5, 0.5, 0.5,
-0.1355802, -4.27981, -7.209316, 0, 1.5, 0.5, 0.5
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
-4.117687, 0.3364228, -7.209316, 0, -0.5, 0.5, 0.5,
-4.117687, 0.3364228, -7.209316, 1, -0.5, 0.5, 0.5,
-4.117687, 0.3364228, -7.209316, 1, 1.5, 0.5, 0.5,
-4.117687, 0.3364228, -7.209316, 0, 1.5, 0.5, 0.5
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
-4.117687, -4.27981, 0.04665375, 0, -0.5, 0.5, 0.5,
-4.117687, -4.27981, 0.04665375, 1, -0.5, 0.5, 0.5,
-4.117687, -4.27981, 0.04665375, 1, 1.5, 0.5, 0.5,
-4.117687, -4.27981, 0.04665375, 0, 1.5, 0.5, 0.5
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
-3, -3.214525, -5.534862,
2, -3.214525, -5.534862,
-3, -3.214525, -5.534862,
-3, -3.392073, -5.813937,
-2, -3.214525, -5.534862,
-2, -3.392073, -5.813937,
-1, -3.214525, -5.534862,
-1, -3.392073, -5.813937,
0, -3.214525, -5.534862,
0, -3.392073, -5.813937,
1, -3.214525, -5.534862,
1, -3.392073, -5.813937,
2, -3.214525, -5.534862,
2, -3.392073, -5.813937
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
-3, -3.747168, -6.372088, 0, -0.5, 0.5, 0.5,
-3, -3.747168, -6.372088, 1, -0.5, 0.5, 0.5,
-3, -3.747168, -6.372088, 1, 1.5, 0.5, 0.5,
-3, -3.747168, -6.372088, 0, 1.5, 0.5, 0.5,
-2, -3.747168, -6.372088, 0, -0.5, 0.5, 0.5,
-2, -3.747168, -6.372088, 1, -0.5, 0.5, 0.5,
-2, -3.747168, -6.372088, 1, 1.5, 0.5, 0.5,
-2, -3.747168, -6.372088, 0, 1.5, 0.5, 0.5,
-1, -3.747168, -6.372088, 0, -0.5, 0.5, 0.5,
-1, -3.747168, -6.372088, 1, -0.5, 0.5, 0.5,
-1, -3.747168, -6.372088, 1, 1.5, 0.5, 0.5,
-1, -3.747168, -6.372088, 0, 1.5, 0.5, 0.5,
0, -3.747168, -6.372088, 0, -0.5, 0.5, 0.5,
0, -3.747168, -6.372088, 1, -0.5, 0.5, 0.5,
0, -3.747168, -6.372088, 1, 1.5, 0.5, 0.5,
0, -3.747168, -6.372088, 0, 1.5, 0.5, 0.5,
1, -3.747168, -6.372088, 0, -0.5, 0.5, 0.5,
1, -3.747168, -6.372088, 1, -0.5, 0.5, 0.5,
1, -3.747168, -6.372088, 1, 1.5, 0.5, 0.5,
1, -3.747168, -6.372088, 0, 1.5, 0.5, 0.5,
2, -3.747168, -6.372088, 0, -0.5, 0.5, 0.5,
2, -3.747168, -6.372088, 1, -0.5, 0.5, 0.5,
2, -3.747168, -6.372088, 1, 1.5, 0.5, 0.5,
2, -3.747168, -6.372088, 0, 1.5, 0.5, 0.5
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
-3.19874, -3, -5.534862,
-3.19874, 3, -5.534862,
-3.19874, -3, -5.534862,
-3.351898, -3, -5.813937,
-3.19874, -2, -5.534862,
-3.351898, -2, -5.813937,
-3.19874, -1, -5.534862,
-3.351898, -1, -5.813937,
-3.19874, 0, -5.534862,
-3.351898, 0, -5.813937,
-3.19874, 1, -5.534862,
-3.351898, 1, -5.813937,
-3.19874, 2, -5.534862,
-3.351898, 2, -5.813937,
-3.19874, 3, -5.534862,
-3.351898, 3, -5.813937
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
-3.658214, -3, -6.372088, 0, -0.5, 0.5, 0.5,
-3.658214, -3, -6.372088, 1, -0.5, 0.5, 0.5,
-3.658214, -3, -6.372088, 1, 1.5, 0.5, 0.5,
-3.658214, -3, -6.372088, 0, 1.5, 0.5, 0.5,
-3.658214, -2, -6.372088, 0, -0.5, 0.5, 0.5,
-3.658214, -2, -6.372088, 1, -0.5, 0.5, 0.5,
-3.658214, -2, -6.372088, 1, 1.5, 0.5, 0.5,
-3.658214, -2, -6.372088, 0, 1.5, 0.5, 0.5,
-3.658214, -1, -6.372088, 0, -0.5, 0.5, 0.5,
-3.658214, -1, -6.372088, 1, -0.5, 0.5, 0.5,
-3.658214, -1, -6.372088, 1, 1.5, 0.5, 0.5,
-3.658214, -1, -6.372088, 0, 1.5, 0.5, 0.5,
-3.658214, 0, -6.372088, 0, -0.5, 0.5, 0.5,
-3.658214, 0, -6.372088, 1, -0.5, 0.5, 0.5,
-3.658214, 0, -6.372088, 1, 1.5, 0.5, 0.5,
-3.658214, 0, -6.372088, 0, 1.5, 0.5, 0.5,
-3.658214, 1, -6.372088, 0, -0.5, 0.5, 0.5,
-3.658214, 1, -6.372088, 1, -0.5, 0.5, 0.5,
-3.658214, 1, -6.372088, 1, 1.5, 0.5, 0.5,
-3.658214, 1, -6.372088, 0, 1.5, 0.5, 0.5,
-3.658214, 2, -6.372088, 0, -0.5, 0.5, 0.5,
-3.658214, 2, -6.372088, 1, -0.5, 0.5, 0.5,
-3.658214, 2, -6.372088, 1, 1.5, 0.5, 0.5,
-3.658214, 2, -6.372088, 0, 1.5, 0.5, 0.5,
-3.658214, 3, -6.372088, 0, -0.5, 0.5, 0.5,
-3.658214, 3, -6.372088, 1, -0.5, 0.5, 0.5,
-3.658214, 3, -6.372088, 1, 1.5, 0.5, 0.5,
-3.658214, 3, -6.372088, 0, 1.5, 0.5, 0.5
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
-3.19874, -3.214525, -4,
-3.19874, -3.214525, 4,
-3.19874, -3.214525, -4,
-3.351898, -3.392073, -4,
-3.19874, -3.214525, -2,
-3.351898, -3.392073, -2,
-3.19874, -3.214525, 0,
-3.351898, -3.392073, 0,
-3.19874, -3.214525, 2,
-3.351898, -3.392073, 2,
-3.19874, -3.214525, 4,
-3.351898, -3.392073, 4
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
-3.658214, -3.747168, -4, 0, -0.5, 0.5, 0.5,
-3.658214, -3.747168, -4, 1, -0.5, 0.5, 0.5,
-3.658214, -3.747168, -4, 1, 1.5, 0.5, 0.5,
-3.658214, -3.747168, -4, 0, 1.5, 0.5, 0.5,
-3.658214, -3.747168, -2, 0, -0.5, 0.5, 0.5,
-3.658214, -3.747168, -2, 1, -0.5, 0.5, 0.5,
-3.658214, -3.747168, -2, 1, 1.5, 0.5, 0.5,
-3.658214, -3.747168, -2, 0, 1.5, 0.5, 0.5,
-3.658214, -3.747168, 0, 0, -0.5, 0.5, 0.5,
-3.658214, -3.747168, 0, 1, -0.5, 0.5, 0.5,
-3.658214, -3.747168, 0, 1, 1.5, 0.5, 0.5,
-3.658214, -3.747168, 0, 0, 1.5, 0.5, 0.5,
-3.658214, -3.747168, 2, 0, -0.5, 0.5, 0.5,
-3.658214, -3.747168, 2, 1, -0.5, 0.5, 0.5,
-3.658214, -3.747168, 2, 1, 1.5, 0.5, 0.5,
-3.658214, -3.747168, 2, 0, 1.5, 0.5, 0.5,
-3.658214, -3.747168, 4, 0, -0.5, 0.5, 0.5,
-3.658214, -3.747168, 4, 1, -0.5, 0.5, 0.5,
-3.658214, -3.747168, 4, 1, 1.5, 0.5, 0.5,
-3.658214, -3.747168, 4, 0, 1.5, 0.5, 0.5
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
-3.19874, -3.214525, -5.534862,
-3.19874, 3.887371, -5.534862,
-3.19874, -3.214525, 5.628169,
-3.19874, 3.887371, 5.628169,
-3.19874, -3.214525, -5.534862,
-3.19874, -3.214525, 5.628169,
-3.19874, 3.887371, -5.534862,
-3.19874, 3.887371, 5.628169,
-3.19874, -3.214525, -5.534862,
2.927579, -3.214525, -5.534862,
-3.19874, -3.214525, 5.628169,
2.927579, -3.214525, 5.628169,
-3.19874, 3.887371, -5.534862,
2.927579, 3.887371, -5.534862,
-3.19874, 3.887371, 5.628169,
2.927579, 3.887371, 5.628169,
2.927579, -3.214525, -5.534862,
2.927579, 3.887371, -5.534862,
2.927579, -3.214525, 5.628169,
2.927579, 3.887371, 5.628169,
2.927579, -3.214525, -5.534862,
2.927579, -3.214525, 5.628169,
2.927579, 3.887371, -5.534862,
2.927579, 3.887371, 5.628169
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
var radius = 7.785539;
var distance = 34.63874;
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
mvMatrix.translate( 0.1355802, -0.3364228, -0.04665375 );
mvMatrix.scale( 1.374051, 1.1853, 0.7540853 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.63874);
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
acrinathrin<-read.table("acrinathrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acrinathrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'acrinathrin' not found
```

```r
y<-acrinathrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'acrinathrin' not found
```

```r
z<-acrinathrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'acrinathrin' not found
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
-3.109521, -1.352401, -0.1058197, 0, 0, 1, 1, 1,
-3.002462, -0.2570967, -1.853467, 1, 0, 0, 1, 1,
-2.919257, 0.09525175, -1.982327, 1, 0, 0, 1, 1,
-2.699265, 0.5038839, -1.004387, 1, 0, 0, 1, 1,
-2.572234, -2.248912, -3.506053, 1, 0, 0, 1, 1,
-2.54008, -0.1218406, -3.110715, 1, 0, 0, 1, 1,
-2.514743, -0.03300916, -1.000399, 0, 0, 0, 1, 1,
-2.378855, -1.959499, -4.270394, 0, 0, 0, 1, 1,
-2.334453, -0.2509851, -3.312533, 0, 0, 0, 1, 1,
-2.322776, 0.4981755, -2.75052, 0, 0, 0, 1, 1,
-2.298717, 0.1168156, -0.02875431, 0, 0, 0, 1, 1,
-2.290745, 2.888079, -0.6408455, 0, 0, 0, 1, 1,
-2.260474, 0.00543104, -1.469786, 0, 0, 0, 1, 1,
-2.245703, -0.2543139, -0.3197261, 1, 1, 1, 1, 1,
-2.241431, 0.2282242, -0.1586752, 1, 1, 1, 1, 1,
-2.224949, 1.457436, -2.487913, 1, 1, 1, 1, 1,
-2.204456, -0.909286, -1.319638, 1, 1, 1, 1, 1,
-2.175496, -0.2773903, -0.90454, 1, 1, 1, 1, 1,
-2.090571, -0.6871083, -0.508948, 1, 1, 1, 1, 1,
-2.075852, -0.3623659, -2.402703, 1, 1, 1, 1, 1,
-2.059835, -0.4388171, -3.479712, 1, 1, 1, 1, 1,
-2.045999, -0.1429207, -1.191977, 1, 1, 1, 1, 1,
-2.04214, -1.119756, -3.497232, 1, 1, 1, 1, 1,
-2.018651, 0.5040055, 0.1550213, 1, 1, 1, 1, 1,
-2.011296, -1.036964, -2.767997, 1, 1, 1, 1, 1,
-1.988089, 0.4792079, -2.450386, 1, 1, 1, 1, 1,
-1.95473, -0.2062034, -0.05966844, 1, 1, 1, 1, 1,
-1.95081, -0.700095, -1.411418, 1, 1, 1, 1, 1,
-1.930496, -1.561151, -3.224644, 0, 0, 1, 1, 1,
-1.903714, -0.291894, -2.809355, 1, 0, 0, 1, 1,
-1.879749, -0.08966371, -1.327055, 1, 0, 0, 1, 1,
-1.87223, 0.8940616, -0.2476086, 1, 0, 0, 1, 1,
-1.84521, 1.100933, 0.1530538, 1, 0, 0, 1, 1,
-1.822182, 0.4078343, -2.157097, 1, 0, 0, 1, 1,
-1.806356, 1.195942, -2.014451, 0, 0, 0, 1, 1,
-1.805386, -1.12594, -1.58185, 0, 0, 0, 1, 1,
-1.796605, 2.466537, 1.946509, 0, 0, 0, 1, 1,
-1.79385, -0.2011989, 0.9794731, 0, 0, 0, 1, 1,
-1.7835, 2.090806, 0.09622806, 0, 0, 0, 1, 1,
-1.782478, 1.518013, -3.268897, 0, 0, 0, 1, 1,
-1.782437, -0.03131672, -1.811707, 0, 0, 0, 1, 1,
-1.75275, 0.1298908, -0.06659617, 1, 1, 1, 1, 1,
-1.728639, 1.347827, -0.1511769, 1, 1, 1, 1, 1,
-1.72689, 0.9488724, 0.6021746, 1, 1, 1, 1, 1,
-1.720326, 1.301955, -1.852216, 1, 1, 1, 1, 1,
-1.718753, 2.278144, -0.03820147, 1, 1, 1, 1, 1,
-1.718211, -0.6537914, -2.721734, 1, 1, 1, 1, 1,
-1.717706, -0.3564767, -1.150859, 1, 1, 1, 1, 1,
-1.703784, 0.6786817, -1.262008, 1, 1, 1, 1, 1,
-1.695907, 1.104505, -1.397368, 1, 1, 1, 1, 1,
-1.694454, 0.07419561, -0.5933915, 1, 1, 1, 1, 1,
-1.668405, 1.051172, -1.083711, 1, 1, 1, 1, 1,
-1.654405, 0.04035994, -1.965112, 1, 1, 1, 1, 1,
-1.646407, -1.618302, -2.223593, 1, 1, 1, 1, 1,
-1.645936, 1.7699, -1.522849, 1, 1, 1, 1, 1,
-1.644812, 0.1603136, -0.1029497, 1, 1, 1, 1, 1,
-1.638245, -1.177839, -0.1123101, 0, 0, 1, 1, 1,
-1.629916, -0.2745623, -1.320925, 1, 0, 0, 1, 1,
-1.602444, 0.3685231, -0.004685782, 1, 0, 0, 1, 1,
-1.582187, 0.5239292, -0.585824, 1, 0, 0, 1, 1,
-1.580417, -1.39265, -1.956884, 1, 0, 0, 1, 1,
-1.571555, 1.15307, 0.2777956, 1, 0, 0, 1, 1,
-1.562147, 1.426092, -0.02617223, 0, 0, 0, 1, 1,
-1.553905, -1.431399, -1.235955, 0, 0, 0, 1, 1,
-1.541967, -0.0930232, -1.669399, 0, 0, 0, 1, 1,
-1.540534, -1.710787, -1.688493, 0, 0, 0, 1, 1,
-1.524009, -1.266893, -1.795303, 0, 0, 0, 1, 1,
-1.520116, 0.8158916, -1.103404, 0, 0, 0, 1, 1,
-1.491122, -1.442459, -0.3537798, 0, 0, 0, 1, 1,
-1.488959, 0.2302985, -2.064754, 1, 1, 1, 1, 1,
-1.4808, -0.7118707, -0.588292, 1, 1, 1, 1, 1,
-1.480525, -0.031914, -2.194946, 1, 1, 1, 1, 1,
-1.460804, 0.6986796, -3.037691, 1, 1, 1, 1, 1,
-1.448758, 0.15877, -2.269914, 1, 1, 1, 1, 1,
-1.445356, 0.1215717, 0.3280561, 1, 1, 1, 1, 1,
-1.443545, 0.409349, -2.212569, 1, 1, 1, 1, 1,
-1.436875, 1.512286, 0.1807768, 1, 1, 1, 1, 1,
-1.429078, -1.506797, -2.505616, 1, 1, 1, 1, 1,
-1.408056, -0.9611705, -2.423933, 1, 1, 1, 1, 1,
-1.404443, -0.04314064, -1.264727, 1, 1, 1, 1, 1,
-1.404359, -0.1252193, -0.9817135, 1, 1, 1, 1, 1,
-1.401971, -0.09338555, -2.538967, 1, 1, 1, 1, 1,
-1.396443, 0.9821668, 0.126203, 1, 1, 1, 1, 1,
-1.394287, -0.2831437, -1.245222, 1, 1, 1, 1, 1,
-1.382265, 0.05096661, 0.06466284, 0, 0, 1, 1, 1,
-1.377675, 1.809737, -0.6994816, 1, 0, 0, 1, 1,
-1.373023, 0.1539247, -2.138872, 1, 0, 0, 1, 1,
-1.363204, -0.1014111, -1.649612, 1, 0, 0, 1, 1,
-1.358887, -2.064722, -2.308695, 1, 0, 0, 1, 1,
-1.336199, -1.076145, -1.73031, 1, 0, 0, 1, 1,
-1.32987, -0.612514, -2.152395, 0, 0, 0, 1, 1,
-1.322811, 0.5465731, -2.123936, 0, 0, 0, 1, 1,
-1.302696, 0.514067, -2.416723, 0, 0, 0, 1, 1,
-1.300774, 0.698699, 0.1038695, 0, 0, 0, 1, 1,
-1.298602, -0.2406601, -1.031887, 0, 0, 0, 1, 1,
-1.292039, -0.2730599, -1.764527, 0, 0, 0, 1, 1,
-1.291989, 0.6965079, -0.5141383, 0, 0, 0, 1, 1,
-1.272121, -0.8570344, -2.831102, 1, 1, 1, 1, 1,
-1.257253, 0.3685883, -2.253589, 1, 1, 1, 1, 1,
-1.25198, 0.6472164, -0.6002766, 1, 1, 1, 1, 1,
-1.247313, -0.008792719, -0.6143554, 1, 1, 1, 1, 1,
-1.246707, -0.01140522, -1.853856, 1, 1, 1, 1, 1,
-1.246655, -0.1558538, -2.546864, 1, 1, 1, 1, 1,
-1.239904, -0.5114241, -2.652822, 1, 1, 1, 1, 1,
-1.234089, -1.53539, -2.860258, 1, 1, 1, 1, 1,
-1.232597, 1.281622, -0.07116479, 1, 1, 1, 1, 1,
-1.228879, 1.357168, -0.5049381, 1, 1, 1, 1, 1,
-1.228142, 0.8789913, -1.089857, 1, 1, 1, 1, 1,
-1.227265, 0.245291, -1.361124, 1, 1, 1, 1, 1,
-1.224059, -0.6455635, -2.931682, 1, 1, 1, 1, 1,
-1.223586, -2.329374, -1.35774, 1, 1, 1, 1, 1,
-1.217557, -1.780204, -2.856652, 1, 1, 1, 1, 1,
-1.217125, -0.4800434, -2.826293, 0, 0, 1, 1, 1,
-1.206683, -0.6487774, -2.26358, 1, 0, 0, 1, 1,
-1.195821, 0.2577451, -1.999489, 1, 0, 0, 1, 1,
-1.195619, -1.370209, -2.844102, 1, 0, 0, 1, 1,
-1.191293, -1.821386, -3.742961, 1, 0, 0, 1, 1,
-1.187793, 0.7349939, -2.147827, 1, 0, 0, 1, 1,
-1.180772, -0.0430168, 0.8786753, 0, 0, 0, 1, 1,
-1.175556, 0.1640518, -2.307307, 0, 0, 0, 1, 1,
-1.166464, -0.7895262, -4.077023, 0, 0, 0, 1, 1,
-1.159652, 0.5234065, -1.722696, 0, 0, 0, 1, 1,
-1.138664, 0.5491706, -0.393757, 0, 0, 0, 1, 1,
-1.136833, -0.7005472, -4.952358, 0, 0, 0, 1, 1,
-1.130545, -1.813354, -2.198677, 0, 0, 0, 1, 1,
-1.129106, 0.8184628, -0.7789428, 1, 1, 1, 1, 1,
-1.12233, 0.2540635, -2.306188, 1, 1, 1, 1, 1,
-1.115657, -0.2411239, -1.632741, 1, 1, 1, 1, 1,
-1.107245, 0.4579298, -1.206453, 1, 1, 1, 1, 1,
-1.103534, -0.3110325, -0.9011297, 1, 1, 1, 1, 1,
-1.102733, 0.448368, -2.006993, 1, 1, 1, 1, 1,
-1.099463, -0.395076, -2.902295, 1, 1, 1, 1, 1,
-1.099157, 2.34943, 0.01199874, 1, 1, 1, 1, 1,
-1.09874, 0.003160715, -2.813688, 1, 1, 1, 1, 1,
-1.097278, 0.8868628, -0.9419151, 1, 1, 1, 1, 1,
-1.094136, -0.3973705, -2.230627, 1, 1, 1, 1, 1,
-1.093026, -0.121903, -1.594966, 1, 1, 1, 1, 1,
-1.091897, -0.5125545, -2.821352, 1, 1, 1, 1, 1,
-1.087914, -0.5732177, -2.440942, 1, 1, 1, 1, 1,
-1.083031, 0.01947911, -1.064489, 1, 1, 1, 1, 1,
-1.08253, 0.835432, -2.648098, 0, 0, 1, 1, 1,
-1.078598, 1.171081, -2.145505, 1, 0, 0, 1, 1,
-1.071994, 0.9300566, -0.09177259, 1, 0, 0, 1, 1,
-1.069191, -0.0937453, -2.900205, 1, 0, 0, 1, 1,
-1.05889, -1.088039, -2.142795, 1, 0, 0, 1, 1,
-1.043111, -0.5245123, -3.301541, 1, 0, 0, 1, 1,
-1.035252, 0.5191696, -1.850824, 0, 0, 0, 1, 1,
-1.033895, 0.6135321, -0.8141493, 0, 0, 0, 1, 1,
-1.031368, -1.854937, -2.098129, 0, 0, 0, 1, 1,
-1.017956, -0.1840479, -1.087201, 0, 0, 0, 1, 1,
-1.012544, -0.2714072, -1.932072, 0, 0, 0, 1, 1,
-1.00882, 1.99261, -1.760432, 0, 0, 0, 1, 1,
-1.00543, 1.59705, -0.07161, 0, 0, 0, 1, 1,
-1.000802, -0.8447917, -2.235104, 1, 1, 1, 1, 1,
-0.998533, 0.05179906, -0.03224386, 1, 1, 1, 1, 1,
-0.9985086, -1.714734, -2.515191, 1, 1, 1, 1, 1,
-0.9964024, -0.2956694, -2.551474, 1, 1, 1, 1, 1,
-0.9944648, 1.188956, -1.437074, 1, 1, 1, 1, 1,
-0.9935778, -1.575182, 0.5150886, 1, 1, 1, 1, 1,
-0.9862506, -0.07332125, -1.790508, 1, 1, 1, 1, 1,
-0.9828704, 1.598076, 0.3299406, 1, 1, 1, 1, 1,
-0.9792868, 0.3798558, -0.3482529, 1, 1, 1, 1, 1,
-0.9747449, -1.294318, -2.719546, 1, 1, 1, 1, 1,
-0.9626915, -1.670392, -1.650329, 1, 1, 1, 1, 1,
-0.9599845, 1.723247, -0.4825543, 1, 1, 1, 1, 1,
-0.9582283, -0.4395152, -0.0505541, 1, 1, 1, 1, 1,
-0.9547811, -0.6431319, -2.20055, 1, 1, 1, 1, 1,
-0.9542198, 0.1941596, -0.5567101, 1, 1, 1, 1, 1,
-0.9522251, -0.2949778, -2.905197, 0, 0, 1, 1, 1,
-0.9466115, 1.142939, 1.826106, 1, 0, 0, 1, 1,
-0.9436383, -0.7927972, -1.101123, 1, 0, 0, 1, 1,
-0.9435031, 0.7010044, -0.8350676, 1, 0, 0, 1, 1,
-0.9344696, -0.3347052, -1.009562, 1, 0, 0, 1, 1,
-0.9339694, 0.3978532, -2.266452, 1, 0, 0, 1, 1,
-0.9322811, 0.1183169, -2.914127, 0, 0, 0, 1, 1,
-0.9285686, -0.1961219, -1.581966, 0, 0, 0, 1, 1,
-0.92549, 0.355581, -0.6253459, 0, 0, 0, 1, 1,
-0.9242741, 0.7899719, -1.581976, 0, 0, 0, 1, 1,
-0.9134579, -0.5362329, -1.688582, 0, 0, 0, 1, 1,
-0.9104865, -0.8340285, -3.033659, 0, 0, 0, 1, 1,
-0.9049249, -0.2153047, -1.800756, 0, 0, 0, 1, 1,
-0.9033817, -0.8700907, -3.167556, 1, 1, 1, 1, 1,
-0.8963851, 0.6012269, -1.594926, 1, 1, 1, 1, 1,
-0.8957482, -0.9772531, -1.524722, 1, 1, 1, 1, 1,
-0.8925152, -0.06138189, -1.307845, 1, 1, 1, 1, 1,
-0.8921063, -0.2930107, -2.813546, 1, 1, 1, 1, 1,
-0.8918071, 0.9605417, 0.4707169, 1, 1, 1, 1, 1,
-0.8907802, 0.01887174, -2.042024, 1, 1, 1, 1, 1,
-0.8897387, 0.02721965, -1.114127, 1, 1, 1, 1, 1,
-0.8849804, 1.145261, -1.331619, 1, 1, 1, 1, 1,
-0.8763263, 0.419778, -2.786029, 1, 1, 1, 1, 1,
-0.8716677, 1.482684, -0.1258657, 1, 1, 1, 1, 1,
-0.8649013, -0.2435329, -1.759159, 1, 1, 1, 1, 1,
-0.864165, 0.3954564, -1.368706, 1, 1, 1, 1, 1,
-0.8625742, 2.230343, -0.4843631, 1, 1, 1, 1, 1,
-0.8585318, -0.2262802, -2.197601, 1, 1, 1, 1, 1,
-0.8577235, 1.647632, 0.9798234, 0, 0, 1, 1, 1,
-0.8445094, 0.06190636, -1.728216, 1, 0, 0, 1, 1,
-0.8442332, 1.132851, 0.1420723, 1, 0, 0, 1, 1,
-0.8367624, 0.2076015, 0.7036152, 1, 0, 0, 1, 1,
-0.8359642, -1.720088, -2.835669, 1, 0, 0, 1, 1,
-0.8357541, -0.2220639, -0.9931936, 1, 0, 0, 1, 1,
-0.8288669, 0.3422025, 1.013933, 0, 0, 0, 1, 1,
-0.8274496, 1.161182, 0.524016, 0, 0, 0, 1, 1,
-0.8243787, 0.2961497, -1.895853, 0, 0, 0, 1, 1,
-0.8055528, -0.2355955, -1.655305, 0, 0, 0, 1, 1,
-0.801575, 0.4274693, -3.090769, 0, 0, 0, 1, 1,
-0.7989991, 1.577977, 0.00552164, 0, 0, 0, 1, 1,
-0.7962998, 2.499712, -1.104227, 0, 0, 0, 1, 1,
-0.7959756, 1.425362, -0.4329946, 1, 1, 1, 1, 1,
-0.790285, 0.09047119, -0.560532, 1, 1, 1, 1, 1,
-0.7900695, -0.6756123, 0.2117285, 1, 1, 1, 1, 1,
-0.789892, -1.004119, -3.733458, 1, 1, 1, 1, 1,
-0.789752, -0.5543949, -3.162161, 1, 1, 1, 1, 1,
-0.7887519, 1.188679, -0.3976443, 1, 1, 1, 1, 1,
-0.7808456, 0.1168582, -2.855614, 1, 1, 1, 1, 1,
-0.7783867, 0.2233884, -1.699383, 1, 1, 1, 1, 1,
-0.7763242, 0.2654833, -1.525228, 1, 1, 1, 1, 1,
-0.7625792, -0.2025734, -1.37072, 1, 1, 1, 1, 1,
-0.7612999, 1.767036, -1.087024, 1, 1, 1, 1, 1,
-0.7606164, -0.7584332, -3.571837, 1, 1, 1, 1, 1,
-0.7605546, 1.077002, 0.2740961, 1, 1, 1, 1, 1,
-0.7507072, -1.433656, -2.997098, 1, 1, 1, 1, 1,
-0.7467415, 1.215895, -1.108629, 1, 1, 1, 1, 1,
-0.7464829, 0.1451407, -1.578175, 0, 0, 1, 1, 1,
-0.7458695, 1.62741, -0.2371294, 1, 0, 0, 1, 1,
-0.7458574, -1.075482, -1.618932, 1, 0, 0, 1, 1,
-0.7439553, -1.596865, -3.031071, 1, 0, 0, 1, 1,
-0.7436749, 0.6563848, -2.632915, 1, 0, 0, 1, 1,
-0.7430062, -0.04283052, -1.194036, 1, 0, 0, 1, 1,
-0.7397716, -1.201281, -3.860197, 0, 0, 0, 1, 1,
-0.7394755, -0.4787138, -1.252826, 0, 0, 0, 1, 1,
-0.7376366, -0.3021214, -0.6941016, 0, 0, 0, 1, 1,
-0.7343235, 0.9994414, 0.4364592, 0, 0, 0, 1, 1,
-0.7329612, 0.2523825, -2.457317, 0, 0, 0, 1, 1,
-0.7294742, 0.2023244, -1.903266, 0, 0, 0, 1, 1,
-0.7199148, -0.2095625, -2.814491, 0, 0, 0, 1, 1,
-0.7118979, -0.5529627, -3.15238, 1, 1, 1, 1, 1,
-0.7116855, 0.05679246, -2.388821, 1, 1, 1, 1, 1,
-0.7115319, -0.4696608, -2.510787, 1, 1, 1, 1, 1,
-0.7102625, 0.4658131, -1.734524, 1, 1, 1, 1, 1,
-0.7081977, -0.8931019, -1.607078, 1, 1, 1, 1, 1,
-0.7062152, 2.282673, 0.6408863, 1, 1, 1, 1, 1,
-0.7056804, 0.6036596, -0.6213528, 1, 1, 1, 1, 1,
-0.7033924, -0.1871318, -2.141716, 1, 1, 1, 1, 1,
-0.6992451, 0.603182, 0.8609146, 1, 1, 1, 1, 1,
-0.6949374, 1.127093, 0.7221593, 1, 1, 1, 1, 1,
-0.6945303, -2.766819, -4.247737, 1, 1, 1, 1, 1,
-0.6916602, 0.7314622, -1.738557, 1, 1, 1, 1, 1,
-0.6885825, 0.5966395, -2.451322, 1, 1, 1, 1, 1,
-0.6877462, 0.1724563, -1.54523, 1, 1, 1, 1, 1,
-0.6851605, 0.729236, -2.163119, 1, 1, 1, 1, 1,
-0.6844835, 0.7293167, 0.3419342, 0, 0, 1, 1, 1,
-0.6829417, -0.2483543, -2.792455, 1, 0, 0, 1, 1,
-0.6797715, 1.488203, 0.1247267, 1, 0, 0, 1, 1,
-0.6711224, 0.2600606, -0.548355, 1, 0, 0, 1, 1,
-0.6706172, -0.02467326, -2.050645, 1, 0, 0, 1, 1,
-0.6700974, -0.7441077, -0.6371202, 1, 0, 0, 1, 1,
-0.6666919, 2.183427, 0.2559877, 0, 0, 0, 1, 1,
-0.6655424, -1.686023, -3.118107, 0, 0, 0, 1, 1,
-0.6546111, -0.6478804, -2.970558, 0, 0, 0, 1, 1,
-0.6505749, -0.0838386, -1.595671, 0, 0, 0, 1, 1,
-0.6503091, 0.2128385, -1.111667, 0, 0, 0, 1, 1,
-0.6484767, -1.855774, -2.168331, 0, 0, 0, 1, 1,
-0.6471992, 0.09369174, -1.539196, 0, 0, 0, 1, 1,
-0.6441337, -0.5803147, -2.166719, 1, 1, 1, 1, 1,
-0.6416889, -0.4951812, -1.734173, 1, 1, 1, 1, 1,
-0.640301, -0.501529, -2.191849, 1, 1, 1, 1, 1,
-0.6284248, -0.1273925, -2.033596, 1, 1, 1, 1, 1,
-0.6262617, 0.7180176, -0.6424921, 1, 1, 1, 1, 1,
-0.6222497, 0.598389, -1.140645, 1, 1, 1, 1, 1,
-0.6209343, 0.519223, -0.3681344, 1, 1, 1, 1, 1,
-0.6201569, -0.02270219, -2.872265, 1, 1, 1, 1, 1,
-0.6124605, -2.026052, -3.483649, 1, 1, 1, 1, 1,
-0.6112144, 0.1833809, -0.3835888, 1, 1, 1, 1, 1,
-0.6108479, 0.4571255, -0.798943, 1, 1, 1, 1, 1,
-0.6098531, 1.03353, 0.1733562, 1, 1, 1, 1, 1,
-0.6063756, -0.2058211, -0.1441891, 1, 1, 1, 1, 1,
-0.606294, 1.339844, 0.2075628, 1, 1, 1, 1, 1,
-0.6061712, -2.217347, -1.778061, 1, 1, 1, 1, 1,
-0.6055778, -1.762607, -2.731549, 0, 0, 1, 1, 1,
-0.6029994, 0.7514507, -1.175292, 1, 0, 0, 1, 1,
-0.6024923, -1.556203, -2.888021, 1, 0, 0, 1, 1,
-0.5950158, -0.6410439, 1.08027, 1, 0, 0, 1, 1,
-0.5916482, 0.5247943, -0.5155006, 1, 0, 0, 1, 1,
-0.5906068, 1.049421, -0.3621035, 1, 0, 0, 1, 1,
-0.5810288, -1.593371, -2.297341, 0, 0, 0, 1, 1,
-0.5782164, 1.311607, -0.2931236, 0, 0, 0, 1, 1,
-0.5779848, -1.185334, -1.319695, 0, 0, 0, 1, 1,
-0.5756052, 1.50189, -0.5529475, 0, 0, 0, 1, 1,
-0.5744509, -0.3892111, -1.378785, 0, 0, 0, 1, 1,
-0.5733655, -0.5110703, -2.324203, 0, 0, 0, 1, 1,
-0.5703909, 0.9255049, -0.2429669, 0, 0, 0, 1, 1,
-0.5685629, -1.020079, -3.565163, 1, 1, 1, 1, 1,
-0.562339, -0.1877301, -2.907478, 1, 1, 1, 1, 1,
-0.5585703, 0.6105765, -0.6438022, 1, 1, 1, 1, 1,
-0.5562103, 0.2102333, -0.3054482, 1, 1, 1, 1, 1,
-0.5547718, -0.7191318, -2.570331, 1, 1, 1, 1, 1,
-0.5502253, 0.3841141, -1.600044, 1, 1, 1, 1, 1,
-0.5444651, -0.1317016, 0.3877844, 1, 1, 1, 1, 1,
-0.5443259, -0.3857627, -2.688136, 1, 1, 1, 1, 1,
-0.5417153, -1.411512, -0.2850458, 1, 1, 1, 1, 1,
-0.5392503, -0.9604963, -2.289775, 1, 1, 1, 1, 1,
-0.5355564, 1.644772, 1.035942, 1, 1, 1, 1, 1,
-0.5355263, -0.4589966, -2.664504, 1, 1, 1, 1, 1,
-0.5340512, 1.601357, -0.1842014, 1, 1, 1, 1, 1,
-0.5292568, -0.7996616, -3.70578, 1, 1, 1, 1, 1,
-0.5250546, 1.479124, -0.5118605, 1, 1, 1, 1, 1,
-0.5180086, -0.7899642, -2.313102, 0, 0, 1, 1, 1,
-0.5134003, 0.0570025, -1.030152, 1, 0, 0, 1, 1,
-0.5118464, -0.2488801, -0.599421, 1, 0, 0, 1, 1,
-0.5117895, -0.3517429, -3.442175, 1, 0, 0, 1, 1,
-0.5116209, -1.177735, -2.304411, 1, 0, 0, 1, 1,
-0.5101357, 0.3976846, -0.4533095, 1, 0, 0, 1, 1,
-0.5099504, 1.003551, -1.52116, 0, 0, 0, 1, 1,
-0.5068092, -1.00237, -1.920311, 0, 0, 0, 1, 1,
-0.5066036, -1.24802, -4.372217, 0, 0, 0, 1, 1,
-0.506562, -0.3957867, -1.728854, 0, 0, 0, 1, 1,
-0.5022529, 2.140674, -0.8940462, 0, 0, 0, 1, 1,
-0.5020879, -0.2663379, -2.242233, 0, 0, 0, 1, 1,
-0.5018765, 2.162625, -1.143851, 0, 0, 0, 1, 1,
-0.5015216, 0.09412958, -1.825107, 1, 1, 1, 1, 1,
-0.4982928, 2.630858, 0.733215, 1, 1, 1, 1, 1,
-0.497573, 0.5430561, -0.5971155, 1, 1, 1, 1, 1,
-0.4958465, 0.5475602, 0.03690226, 1, 1, 1, 1, 1,
-0.4956438, -0.4614255, -2.238718, 1, 1, 1, 1, 1,
-0.4953195, 0.1869547, -2.520045, 1, 1, 1, 1, 1,
-0.4925761, -0.9802859, -2.816101, 1, 1, 1, 1, 1,
-0.4911288, -0.6115615, -3.507269, 1, 1, 1, 1, 1,
-0.4882677, -0.4147781, -2.025346, 1, 1, 1, 1, 1,
-0.4873538, -1.696771, -3.16991, 1, 1, 1, 1, 1,
-0.4788916, 0.6740866, -0.3868256, 1, 1, 1, 1, 1,
-0.4774948, 1.167455, -0.009106291, 1, 1, 1, 1, 1,
-0.4773143, -1.073781, -1.631162, 1, 1, 1, 1, 1,
-0.4689821, -0.2815347, -2.631838, 1, 1, 1, 1, 1,
-0.4652667, -0.168661, -1.016008, 1, 1, 1, 1, 1,
-0.4638802, -1.853767, -0.8519791, 0, 0, 1, 1, 1,
-0.4612502, 0.998746, -0.1421472, 1, 0, 0, 1, 1,
-0.4572449, -0.04531945, -2.16154, 1, 0, 0, 1, 1,
-0.4516, 1.774298, -0.5937614, 1, 0, 0, 1, 1,
-0.450413, -1.48453, -3.531167, 1, 0, 0, 1, 1,
-0.4498582, -2.467971, -2.385305, 1, 0, 0, 1, 1,
-0.448885, -1.295346, -1.242672, 0, 0, 0, 1, 1,
-0.4483723, 1.145093, 0.06571255, 0, 0, 0, 1, 1,
-0.4464352, 0.08296971, -0.7674792, 0, 0, 0, 1, 1,
-0.4447798, -0.5490157, -0.825759, 0, 0, 0, 1, 1,
-0.4433263, -2.166239, -2.822654, 0, 0, 0, 1, 1,
-0.4334058, 1.364134, -0.5869619, 0, 0, 0, 1, 1,
-0.4304656, 1.159806, 2.292194, 0, 0, 0, 1, 1,
-0.4275884, -0.01907102, -2.125394, 1, 1, 1, 1, 1,
-0.4252236, 0.5250592, 0.9394075, 1, 1, 1, 1, 1,
-0.4187756, -1.636374, -2.2153, 1, 1, 1, 1, 1,
-0.41432, -0.8123332, -2.203773, 1, 1, 1, 1, 1,
-0.4101415, -0.1070071, -0.4647623, 1, 1, 1, 1, 1,
-0.4091757, 0.7856848, -1.860601, 1, 1, 1, 1, 1,
-0.3999316, 1.781432, -0.4999963, 1, 1, 1, 1, 1,
-0.3933587, 0.054614, 0.5457854, 1, 1, 1, 1, 1,
-0.3930351, -0.3326288, -1.79313, 1, 1, 1, 1, 1,
-0.3919977, -1.176859, -3.599269, 1, 1, 1, 1, 1,
-0.3889866, 1.06859, -0.1691511, 1, 1, 1, 1, 1,
-0.3864233, -0.3108688, -1.417061, 1, 1, 1, 1, 1,
-0.3844736, -0.4461125, -1.409166, 1, 1, 1, 1, 1,
-0.381532, -0.7823806, -1.740159, 1, 1, 1, 1, 1,
-0.3813518, -0.6894829, -4.349682, 1, 1, 1, 1, 1,
-0.3788756, 1.153339, 0.2706365, 0, 0, 1, 1, 1,
-0.3767673, -0.3630608, -2.494668, 1, 0, 0, 1, 1,
-0.3759712, -1.640743, -1.912387, 1, 0, 0, 1, 1,
-0.3736657, -0.2243541, -2.084476, 1, 0, 0, 1, 1,
-0.372985, -1.000221, -3.634497, 1, 0, 0, 1, 1,
-0.3694194, -0.7757422, -2.714542, 1, 0, 0, 1, 1,
-0.3658274, -1.9835, -4.579648, 0, 0, 0, 1, 1,
-0.3609157, -1.03741, -3.120353, 0, 0, 0, 1, 1,
-0.3594696, -0.6237518, -2.138518, 0, 0, 0, 1, 1,
-0.3476279, -1.474106, -1.688921, 0, 0, 0, 1, 1,
-0.3452464, -1.263307, 0.02239739, 0, 0, 0, 1, 1,
-0.3435726, 1.701087, 0.1679508, 0, 0, 0, 1, 1,
-0.3418196, 1.022151, 0.02404507, 0, 0, 0, 1, 1,
-0.3413983, -0.205089, -2.801961, 1, 1, 1, 1, 1,
-0.3381339, -0.05593986, -2.30625, 1, 1, 1, 1, 1,
-0.3372936, 0.7236104, -0.526265, 1, 1, 1, 1, 1,
-0.3304685, -0.4508533, -2.767399, 1, 1, 1, 1, 1,
-0.3304578, 0.2978852, -1.845051, 1, 1, 1, 1, 1,
-0.3303076, -0.9263787, -5.372293, 1, 1, 1, 1, 1,
-0.3275264, -0.1776017, -1.235726, 1, 1, 1, 1, 1,
-0.3240175, -0.8786339, -3.641246, 1, 1, 1, 1, 1,
-0.3204786, -0.9020541, -0.6450344, 1, 1, 1, 1, 1,
-0.3200565, 0.5938565, -1.900194, 1, 1, 1, 1, 1,
-0.3199579, -0.1801885, -1.961054, 1, 1, 1, 1, 1,
-0.3190536, -0.4604139, -2.539551, 1, 1, 1, 1, 1,
-0.3176708, 0.3297183, 0.930801, 1, 1, 1, 1, 1,
-0.3168965, -0.7156548, -2.862145, 1, 1, 1, 1, 1,
-0.3168043, 1.369184, -1.361838, 1, 1, 1, 1, 1,
-0.3158148, -1.137282, -3.651209, 0, 0, 1, 1, 1,
-0.3144628, 2.306085, 0.005618572, 1, 0, 0, 1, 1,
-0.3143062, 0.2029821, -0.9163758, 1, 0, 0, 1, 1,
-0.3131673, -0.9843119, -2.98932, 1, 0, 0, 1, 1,
-0.3127609, 1.074478, -0.7974489, 1, 0, 0, 1, 1,
-0.312701, -0.9627789, -3.32177, 1, 0, 0, 1, 1,
-0.3095797, 2.271917, -2.701302, 0, 0, 0, 1, 1,
-0.3052433, 0.4167483, -1.060138, 0, 0, 0, 1, 1,
-0.3015126, 1.087313, -0.9631092, 0, 0, 0, 1, 1,
-0.2975462, 0.8688479, -0.8700793, 0, 0, 0, 1, 1,
-0.2929504, 2.526596, -1.482367, 0, 0, 0, 1, 1,
-0.2914086, 1.367681, -0.8252236, 0, 0, 0, 1, 1,
-0.2895853, -0.4975225, -1.691579, 0, 0, 0, 1, 1,
-0.2872737, -0.3952214, -0.454351, 1, 1, 1, 1, 1,
-0.2845294, 0.07317413, -2.129254, 1, 1, 1, 1, 1,
-0.2825223, 0.5204457, -0.2762184, 1, 1, 1, 1, 1,
-0.2807663, 0.2684402, -0.3162767, 1, 1, 1, 1, 1,
-0.2805055, 0.3471627, -0.4498526, 1, 1, 1, 1, 1,
-0.2796055, 0.4706536, -1.407166, 1, 1, 1, 1, 1,
-0.2581488, -0.2931224, -2.105753, 1, 1, 1, 1, 1,
-0.2571914, -1.351843, -2.347942, 1, 1, 1, 1, 1,
-0.2565673, -0.3982526, -2.630504, 1, 1, 1, 1, 1,
-0.2558673, -0.8609345, -2.205079, 1, 1, 1, 1, 1,
-0.254489, 0.3373204, -1.066963, 1, 1, 1, 1, 1,
-0.2451246, 2.339082, -0.9212645, 1, 1, 1, 1, 1,
-0.2440802, 0.5673813, -0.8470642, 1, 1, 1, 1, 1,
-0.2436129, -0.019967, -0.3472348, 1, 1, 1, 1, 1,
-0.2378177, -1.618382, -2.886559, 1, 1, 1, 1, 1,
-0.2263171, -0.6299963, -1.442578, 0, 0, 1, 1, 1,
-0.2243475, 1.120848, -1.151723, 1, 0, 0, 1, 1,
-0.2220337, 0.228022, -0.7923623, 1, 0, 0, 1, 1,
-0.2179105, -0.7386367, -4.009625, 1, 0, 0, 1, 1,
-0.2162908, -0.9934998, -1.987309, 1, 0, 0, 1, 1,
-0.2159008, -0.7770015, -1.774796, 1, 0, 0, 1, 1,
-0.2152982, 1.82293, 1.722769, 0, 0, 0, 1, 1,
-0.2148722, -1.418839, -2.475265, 0, 0, 0, 1, 1,
-0.2142741, -0.3269893, -3.607574, 0, 0, 0, 1, 1,
-0.2130009, 1.226805, -2.216821, 0, 0, 0, 1, 1,
-0.2073541, 0.5502849, 0.1316453, 0, 0, 0, 1, 1,
-0.2072316, 0.906016, 0.9098955, 0, 0, 0, 1, 1,
-0.2070635, -1.40861, -3.202436, 0, 0, 0, 1, 1,
-0.2069184, -0.3193792, -2.129924, 1, 1, 1, 1, 1,
-0.2066787, -1.703384, -2.800446, 1, 1, 1, 1, 1,
-0.2014613, 0.7472829, -0.1677222, 1, 1, 1, 1, 1,
-0.1884531, 0.5159013, -0.5826194, 1, 1, 1, 1, 1,
-0.1855852, -0.05520672, -0.4370678, 1, 1, 1, 1, 1,
-0.182139, 1.018468, 0.1225288, 1, 1, 1, 1, 1,
-0.1812858, -1.107862, -1.084135, 1, 1, 1, 1, 1,
-0.1757481, 2.577855, -1.314391, 1, 1, 1, 1, 1,
-0.1748211, -0.3089162, -3.683812, 1, 1, 1, 1, 1,
-0.1701065, -1.097887, -2.737539, 1, 1, 1, 1, 1,
-0.1685299, 0.8176632, -3.733187, 1, 1, 1, 1, 1,
-0.164448, 0.8995645, 0.8276071, 1, 1, 1, 1, 1,
-0.16011, -0.2091079, -2.992058, 1, 1, 1, 1, 1,
-0.1542188, -0.9444535, -3.80618, 1, 1, 1, 1, 1,
-0.1529085, -0.345138, -2.826525, 1, 1, 1, 1, 1,
-0.1527743, -0.7517044, -3.70088, 0, 0, 1, 1, 1,
-0.1527355, -0.2063936, -2.003682, 1, 0, 0, 1, 1,
-0.1520456, -0.3684354, -2.258324, 1, 0, 0, 1, 1,
-0.1484389, -0.3903237, -0.982833, 1, 0, 0, 1, 1,
-0.1484111, -0.05635165, -0.7496052, 1, 0, 0, 1, 1,
-0.1467617, 0.7016308, 0.238351, 1, 0, 0, 1, 1,
-0.1451122, 1.682926, 0.8635438, 0, 0, 0, 1, 1,
-0.1441544, 0.3443424, -0.6090292, 0, 0, 0, 1, 1,
-0.1428788, -2.366927, -3.950143, 0, 0, 0, 1, 1,
-0.1425142, -0.2605686, -3.045289, 0, 0, 0, 1, 1,
-0.140701, 1.039418, -0.6865396, 0, 0, 0, 1, 1,
-0.1402912, -2.130446, -3.763255, 0, 0, 0, 1, 1,
-0.1389206, 1.259005, -0.5904503, 0, 0, 0, 1, 1,
-0.1322947, -0.1615355, -3.720357, 1, 1, 1, 1, 1,
-0.1317756, 0.7439191, -1.12798, 1, 1, 1, 1, 1,
-0.1202853, 0.5924793, 0.8845826, 1, 1, 1, 1, 1,
-0.1177436, 0.9555463, 0.06743072, 1, 1, 1, 1, 1,
-0.1157193, 0.2356832, -0.1855206, 1, 1, 1, 1, 1,
-0.1087282, -1.309883, -2.738594, 1, 1, 1, 1, 1,
-0.1070408, -0.2878591, -2.250648, 1, 1, 1, 1, 1,
-0.1054944, 2.23383, 0.1873451, 1, 1, 1, 1, 1,
-0.09119473, -1.572687, -1.818806, 1, 1, 1, 1, 1,
-0.09051201, -2.03571, -2.839889, 1, 1, 1, 1, 1,
-0.09047375, -1.542117, -4.261544, 1, 1, 1, 1, 1,
-0.08978925, -1.285542, -3.865873, 1, 1, 1, 1, 1,
-0.08324119, 0.2259751, -1.917332, 1, 1, 1, 1, 1,
-0.0828592, -0.4771573, -3.59913, 1, 1, 1, 1, 1,
-0.07977641, 1.39144, -1.117968, 1, 1, 1, 1, 1,
-0.07861821, 0.8487729, 1.009599, 0, 0, 1, 1, 1,
-0.07615005, 1.369119, 0.5809872, 1, 0, 0, 1, 1,
-0.07325547, -0.380055, -4.128801, 1, 0, 0, 1, 1,
-0.07181548, -0.8305671, -1.134617, 1, 0, 0, 1, 1,
-0.07015088, -1.274776, -3.531168, 1, 0, 0, 1, 1,
-0.0652629, 0.5446846, 1.598274, 1, 0, 0, 1, 1,
-0.06269702, -0.311908, -2.357543, 0, 0, 0, 1, 1,
-0.05925797, 1.108084, -1.249614, 0, 0, 0, 1, 1,
-0.0572457, -0.8747336, -3.162366, 0, 0, 0, 1, 1,
-0.0567935, -1.258923, -4.020309, 0, 0, 0, 1, 1,
-0.0567845, 0.1807621, 0.634986, 0, 0, 0, 1, 1,
-0.05611884, -0.3090307, -2.820698, 0, 0, 0, 1, 1,
-0.05102318, 0.9731287, 0.5264193, 0, 0, 0, 1, 1,
-0.05058507, 0.5044166, 0.2018365, 1, 1, 1, 1, 1,
-0.04694804, 0.5267867, -0.2176138, 1, 1, 1, 1, 1,
-0.04241154, 0.08214941, -0.7466333, 1, 1, 1, 1, 1,
-0.04020048, -2.77006, -3.434384, 1, 1, 1, 1, 1,
-0.03724709, -1.383035, -4.649292, 1, 1, 1, 1, 1,
-0.02918451, 0.1585706, -1.278986, 1, 1, 1, 1, 1,
-0.02084166, 1.343845, 0.1977259, 1, 1, 1, 1, 1,
-0.02061025, 1.158453, 0.9531859, 1, 1, 1, 1, 1,
-0.01620327, 0.6090481, -0.4520279, 1, 1, 1, 1, 1,
-0.01384289, -0.9831274, -3.157498, 1, 1, 1, 1, 1,
-0.01020699, 0.7965735, -0.09426832, 1, 1, 1, 1, 1,
-0.008216891, -0.5340285, -1.719059, 1, 1, 1, 1, 1,
-0.007000338, 1.045866, -0.5358152, 1, 1, 1, 1, 1,
-0.005808274, 1.637218, 0.04704322, 1, 1, 1, 1, 1,
-0.004537096, 0.1116535, -2.082904, 1, 1, 1, 1, 1,
-0.002250342, 0.07683067, 1.30295, 0, 0, 1, 1, 1,
0.001659346, -1.158558, 3.29453, 1, 0, 0, 1, 1,
0.00192348, -0.4637053, 4.301035, 1, 0, 0, 1, 1,
0.003308515, 1.288134, -0.4346261, 1, 0, 0, 1, 1,
0.00622471, 0.5599982, 0.4990824, 1, 0, 0, 1, 1,
0.0104116, -0.6549574, 3.609317, 1, 0, 0, 1, 1,
0.01333311, 0.2982977, -1.066199, 0, 0, 0, 1, 1,
0.01341171, -1.718003, 1.965577, 0, 0, 0, 1, 1,
0.01941948, 0.7010431, 1.055349, 0, 0, 0, 1, 1,
0.01970372, 1.145997, 0.3875414, 0, 0, 0, 1, 1,
0.02192198, -0.3567679, 3.343988, 0, 0, 0, 1, 1,
0.02518011, 0.4967611, -0.6181152, 0, 0, 0, 1, 1,
0.02565964, 0.4003142, 0.5489265, 0, 0, 0, 1, 1,
0.02872144, 1.368636, 2.769473, 1, 1, 1, 1, 1,
0.03023645, -0.5607632, 4.870688, 1, 1, 1, 1, 1,
0.03142262, -0.07483281, 2.768969, 1, 1, 1, 1, 1,
0.03250119, -0.6586102, 2.53884, 1, 1, 1, 1, 1,
0.03768353, -0.09319722, 1.969022, 1, 1, 1, 1, 1,
0.03905305, 0.9925622, 1.299293, 1, 1, 1, 1, 1,
0.03980146, 0.2138012, -1.931404, 1, 1, 1, 1, 1,
0.04558158, -0.4600287, 4.178829, 1, 1, 1, 1, 1,
0.04723088, -0.2286167, 1.562962, 1, 1, 1, 1, 1,
0.04884784, 0.2143374, 0.1818242, 1, 1, 1, 1, 1,
0.05163374, 1.246478, 0.1946132, 1, 1, 1, 1, 1,
0.05682082, 0.9860444, 1.135502, 1, 1, 1, 1, 1,
0.06164052, 0.3098305, 1.094276, 1, 1, 1, 1, 1,
0.06671578, 1.166598, 0.5355973, 1, 1, 1, 1, 1,
0.06919996, -0.3650246, 3.393348, 1, 1, 1, 1, 1,
0.07293892, -1.568405, 1.83885, 0, 0, 1, 1, 1,
0.08083779, 0.1576274, -0.8559322, 1, 0, 0, 1, 1,
0.08262136, -0.4595649, 2.623945, 1, 0, 0, 1, 1,
0.08337146, 0.004714406, 2.648668, 1, 0, 0, 1, 1,
0.08671505, 0.4563191, 1.238554, 1, 0, 0, 1, 1,
0.08973425, -1.136874, 4.409295, 1, 0, 0, 1, 1,
0.09123251, 1.190292, -0.6662132, 0, 0, 0, 1, 1,
0.09159354, 0.04939969, 0.9224789, 0, 0, 0, 1, 1,
0.0976426, 1.938752, 0.8859619, 0, 0, 0, 1, 1,
0.101243, 0.5864782, 0.7018117, 0, 0, 0, 1, 1,
0.10488, -0.6643929, 1.753164, 0, 0, 0, 1, 1,
0.1071635, 0.9777421, -1.498751, 0, 0, 0, 1, 1,
0.1088146, -0.8946366, 1.256091, 0, 0, 0, 1, 1,
0.1099562, -2.132393, 3.780969, 1, 1, 1, 1, 1,
0.1107104, -0.7827262, 1.211004, 1, 1, 1, 1, 1,
0.110923, 0.6824111, 0.3764319, 1, 1, 1, 1, 1,
0.1133194, 1.543711, -0.9857153, 1, 1, 1, 1, 1,
0.1198421, 0.8457511, 1.316646, 1, 1, 1, 1, 1,
0.1248101, 1.163681, 0.5249796, 1, 1, 1, 1, 1,
0.1252595, 0.6495945, 0.4232896, 1, 1, 1, 1, 1,
0.1281054, 0.7354941, -1.608133, 1, 1, 1, 1, 1,
0.1285666, 1.101465, 0.0117177, 1, 1, 1, 1, 1,
0.1286321, -1.22961, 3.881401, 1, 1, 1, 1, 1,
0.1313991, 1.257233, 0.8344257, 1, 1, 1, 1, 1,
0.1317098, -0.29749, 3.227017, 1, 1, 1, 1, 1,
0.1335492, -1.5085, 4.817474, 1, 1, 1, 1, 1,
0.134293, -0.2649323, 2.325873, 1, 1, 1, 1, 1,
0.1345615, 0.8454401, 0.4717992, 1, 1, 1, 1, 1,
0.136276, 0.7376828, 1.589737, 0, 0, 1, 1, 1,
0.1379051, -0.571945, 2.079724, 1, 0, 0, 1, 1,
0.1395848, 1.214046, -0.3477913, 1, 0, 0, 1, 1,
0.139912, 1.382517, 0.8131198, 1, 0, 0, 1, 1,
0.1402902, 1.443008, 0.3981853, 1, 0, 0, 1, 1,
0.1411515, -0.5068363, 1.075581, 1, 0, 0, 1, 1,
0.1416995, 0.8206552, -0.5116583, 0, 0, 0, 1, 1,
0.1427024, -0.8747135, 3.034431, 0, 0, 0, 1, 1,
0.1461343, 3.783945, 0.5719223, 0, 0, 0, 1, 1,
0.1555217, -0.8637745, 2.765074, 0, 0, 0, 1, 1,
0.1555758, 0.6176667, 0.2964422, 0, 0, 0, 1, 1,
0.1693403, -2.359539, 3.800351, 0, 0, 0, 1, 1,
0.1706751, 0.8651302, -0.6433559, 0, 0, 0, 1, 1,
0.1710969, -2.4184, 3.082132, 1, 1, 1, 1, 1,
0.1748103, -1.659724, 1.656623, 1, 1, 1, 1, 1,
0.1748476, 0.9323893, 1.125355, 1, 1, 1, 1, 1,
0.1904297, 1.073092, 1.231838, 1, 1, 1, 1, 1,
0.1957837, 2.121442, 0.1241105, 1, 1, 1, 1, 1,
0.2002421, 0.1302928, 0.5915722, 1, 1, 1, 1, 1,
0.2007769, -0.2299636, 3.470172, 1, 1, 1, 1, 1,
0.2031056, 1.325639, -0.844855, 1, 1, 1, 1, 1,
0.20482, 0.7613883, 0.8532448, 1, 1, 1, 1, 1,
0.2052939, -1.147708, 1.13662, 1, 1, 1, 1, 1,
0.2079883, 0.2472271, 1.217475, 1, 1, 1, 1, 1,
0.2132202, 0.4685056, 1.393171, 1, 1, 1, 1, 1,
0.2153764, -1.739853, 4.718194, 1, 1, 1, 1, 1,
0.2161043, 1.222029, 2.275353, 1, 1, 1, 1, 1,
0.2242784, -0.369683, 3.306719, 1, 1, 1, 1, 1,
0.2327057, -0.2769565, 2.771884, 0, 0, 1, 1, 1,
0.2344799, 0.4945509, 0.2799769, 1, 0, 0, 1, 1,
0.2370632, -0.9268303, 2.270556, 1, 0, 0, 1, 1,
0.2380684, 0.9916282, 0.3025417, 1, 0, 0, 1, 1,
0.2401397, -1.890831, 2.09839, 1, 0, 0, 1, 1,
0.2412622, 0.7368333, 1.569467, 1, 0, 0, 1, 1,
0.2427577, 0.8977153, 0.4444738, 0, 0, 0, 1, 1,
0.2480198, -0.9907793, 4.980635, 0, 0, 0, 1, 1,
0.2505268, 1.032266, -0.1815424, 0, 0, 0, 1, 1,
0.2523719, -0.7747493, 5.301908, 0, 0, 0, 1, 1,
0.2535263, 0.04526281, 3.040232, 0, 0, 0, 1, 1,
0.2540837, -0.3522396, 3.208737, 0, 0, 0, 1, 1,
0.2608555, 0.6886182, 0.1613684, 0, 0, 0, 1, 1,
0.2641474, 2.070858, -0.075748, 1, 1, 1, 1, 1,
0.2656623, 1.19374, 0.1421626, 1, 1, 1, 1, 1,
0.2661658, 0.390192, -0.726046, 1, 1, 1, 1, 1,
0.2672604, 0.2470117, 2.215618, 1, 1, 1, 1, 1,
0.267416, 0.5805471, -1.164773, 1, 1, 1, 1, 1,
0.2698904, 0.2378914, 1.125599, 1, 1, 1, 1, 1,
0.2781549, -0.8819245, 2.346421, 1, 1, 1, 1, 1,
0.2795126, 0.1677671, 2.483748, 1, 1, 1, 1, 1,
0.2796248, 0.5460652, 0.9652374, 1, 1, 1, 1, 1,
0.2806087, 1.393812, -0.02137927, 1, 1, 1, 1, 1,
0.2836423, 0.9391143, 0.3575659, 1, 1, 1, 1, 1,
0.2870055, 0.5690958, -0.5545885, 1, 1, 1, 1, 1,
0.2899092, -0.3232952, 1.803143, 1, 1, 1, 1, 1,
0.2903667, -1.575463, 5.4656, 1, 1, 1, 1, 1,
0.2913395, 0.5769926, 0.2121054, 1, 1, 1, 1, 1,
0.3010266, -0.2473969, 3.69248, 0, 0, 1, 1, 1,
0.301351, -1.038494, 3.483588, 1, 0, 0, 1, 1,
0.3122365, 1.158806, 1.232698, 1, 0, 0, 1, 1,
0.3127765, 0.2532952, 0.3909772, 1, 0, 0, 1, 1,
0.3148764, 0.1940974, 1.830391, 1, 0, 0, 1, 1,
0.3172801, 0.3859078, 1.827003, 1, 0, 0, 1, 1,
0.3181975, 0.1672748, 1.661833, 0, 0, 0, 1, 1,
0.3216373, 2.128099, -0.7104557, 0, 0, 0, 1, 1,
0.322511, 0.2663222, -0.252679, 0, 0, 0, 1, 1,
0.3240266, -0.9597287, 2.656716, 0, 0, 0, 1, 1,
0.3260564, 0.835842, 1.454963, 0, 0, 0, 1, 1,
0.3272955, -0.06956642, 2.988892, 0, 0, 0, 1, 1,
0.3337063, -1.269551, 2.647492, 0, 0, 0, 1, 1,
0.3350038, 0.1457661, 0.3953688, 1, 1, 1, 1, 1,
0.342025, -0.01330007, 2.37804, 1, 1, 1, 1, 1,
0.3434766, 0.1059627, 1.423842, 1, 1, 1, 1, 1,
0.3462293, -0.9646541, 4.543428, 1, 1, 1, 1, 1,
0.3468191, -0.01212032, 2.755712, 1, 1, 1, 1, 1,
0.3474133, 0.5144013, 1.037623, 1, 1, 1, 1, 1,
0.3489473, -0.5254651, 0.7116342, 1, 1, 1, 1, 1,
0.3519284, -0.1706833, 0.5374994, 1, 1, 1, 1, 1,
0.3520595, -0.5609096, 1.261382, 1, 1, 1, 1, 1,
0.353001, 0.4999873, 0.2691086, 1, 1, 1, 1, 1,
0.353407, 1.656501, 0.6278211, 1, 1, 1, 1, 1,
0.3544714, 0.5283958, -1.644833, 1, 1, 1, 1, 1,
0.3548366, -1.530134, 4.408941, 1, 1, 1, 1, 1,
0.3677392, 0.7958836, -0.626923, 1, 1, 1, 1, 1,
0.3696885, 1.115517, 1.181113, 1, 1, 1, 1, 1,
0.3764231, 0.3304147, 0.470755, 0, 0, 1, 1, 1,
0.3764946, -0.3051282, 1.463772, 1, 0, 0, 1, 1,
0.3781798, 0.0001931014, 0.6445196, 1, 0, 0, 1, 1,
0.3827281, -0.9813103, 2.94856, 1, 0, 0, 1, 1,
0.3859393, 1.024083, -0.1959536, 1, 0, 0, 1, 1,
0.39013, 0.1324801, 1.462398, 1, 0, 0, 1, 1,
0.3933819, 0.4831817, 2.350893, 0, 0, 0, 1, 1,
0.3934709, 1.211311, 0.5961705, 0, 0, 0, 1, 1,
0.3948081, -0.8212004, 1.992007, 0, 0, 0, 1, 1,
0.3982289, -0.5588412, 1.843586, 0, 0, 0, 1, 1,
0.4014116, 1.528166, -0.9168191, 0, 0, 0, 1, 1,
0.4037169, 1.469193, 0.5177974, 0, 0, 0, 1, 1,
0.4054373, 0.5749025, 2.097951, 0, 0, 0, 1, 1,
0.4073998, -0.9206074, 2.568366, 1, 1, 1, 1, 1,
0.4074651, 0.1680226, 2.95404, 1, 1, 1, 1, 1,
0.4136649, 0.05569504, 1.322039, 1, 1, 1, 1, 1,
0.414041, 1.688036, -0.7130542, 1, 1, 1, 1, 1,
0.4158614, 0.607421, -0.6880614, 1, 1, 1, 1, 1,
0.4167492, 1.379156, -0.1538269, 1, 1, 1, 1, 1,
0.4201709, -1.369187, 2.26469, 1, 1, 1, 1, 1,
0.4239626, 1.959974, 1.129057, 1, 1, 1, 1, 1,
0.4245929, 0.1626855, -0.9269273, 1, 1, 1, 1, 1,
0.4270016, 0.593183, 1.753243, 1, 1, 1, 1, 1,
0.4301087, -0.3888972, 1.256003, 1, 1, 1, 1, 1,
0.4302365, -0.2695542, 2.365853, 1, 1, 1, 1, 1,
0.4320988, 0.9579833, 0.4570277, 1, 1, 1, 1, 1,
0.4333681, -0.3537289, 0.9609919, 1, 1, 1, 1, 1,
0.4356351, 1.04797, 0.9342407, 1, 1, 1, 1, 1,
0.4357144, 1.339234, 0.5213481, 0, 0, 1, 1, 1,
0.4391052, 0.3530218, 0.6952274, 1, 0, 0, 1, 1,
0.4417634, 0.6067636, -0.9896408, 1, 0, 0, 1, 1,
0.4438435, -0.5388705, 3.354012, 1, 0, 0, 1, 1,
0.4443938, 1.180391, -0.1591625, 1, 0, 0, 1, 1,
0.4459966, 0.2719372, 0.8163024, 1, 0, 0, 1, 1,
0.4508296, 0.4322156, -0.255123, 0, 0, 0, 1, 1,
0.4521557, 0.8700835, 0.1841404, 0, 0, 0, 1, 1,
0.4530842, -0.9510817, 0.2688939, 0, 0, 0, 1, 1,
0.4570995, 0.3286399, -0.8546923, 0, 0, 0, 1, 1,
0.4586599, 0.6887023, 0.9474372, 0, 0, 0, 1, 1,
0.4651355, 1.343638, -0.2439636, 0, 0, 0, 1, 1,
0.4688521, 0.5926162, -0.9362192, 0, 0, 0, 1, 1,
0.4710943, 1.167764, -0.08702169, 1, 1, 1, 1, 1,
0.4738518, -0.4198224, 2.28582, 1, 1, 1, 1, 1,
0.4748543, -1.145232, 3.77438, 1, 1, 1, 1, 1,
0.4793304, 0.6004636, 0.5708662, 1, 1, 1, 1, 1,
0.4799398, -0.8809724, 1.627993, 1, 1, 1, 1, 1,
0.4805245, 0.7528296, 1.341725, 1, 1, 1, 1, 1,
0.4817106, 2.337301, 1.744157, 1, 1, 1, 1, 1,
0.4827242, 0.4170979, 0.1619332, 1, 1, 1, 1, 1,
0.4955411, -1.169334, 4.309594, 1, 1, 1, 1, 1,
0.4968435, -1.18656, 3.245258, 1, 1, 1, 1, 1,
0.4975458, 0.9190876, 2.734646, 1, 1, 1, 1, 1,
0.4985365, 0.613963, 0.2187745, 1, 1, 1, 1, 1,
0.500604, -0.3981944, 1.981479, 1, 1, 1, 1, 1,
0.5119545, 0.01825985, -0.112457, 1, 1, 1, 1, 1,
0.5276157, -0.8007543, 4.266167, 1, 1, 1, 1, 1,
0.5308172, -2.640559, 3.327655, 0, 0, 1, 1, 1,
0.5322104, -1.258799, 1.653763, 1, 0, 0, 1, 1,
0.5329351, 2.758154, -0.6492342, 1, 0, 0, 1, 1,
0.5355108, 0.2481312, 1.90948, 1, 0, 0, 1, 1,
0.5366988, -0.3453889, 1.833645, 1, 0, 0, 1, 1,
0.5422736, 0.4746009, 1.434819, 1, 0, 0, 1, 1,
0.5513898, -1.057662, 3.198206, 0, 0, 0, 1, 1,
0.5608056, 1.548531, -0.859239, 0, 0, 0, 1, 1,
0.5608959, -0.9881747, 2.239243, 0, 0, 0, 1, 1,
0.5671181, 2.029948, -0.04122416, 0, 0, 0, 1, 1,
0.5712957, -0.1316146, 0.4714598, 0, 0, 0, 1, 1,
0.5746356, 0.9404843, -0.1896807, 0, 0, 0, 1, 1,
0.5763341, 0.02976315, 1.039307, 0, 0, 0, 1, 1,
0.581732, 2.027731, -0.8257783, 1, 1, 1, 1, 1,
0.5836869, 0.9894738, 1.415938, 1, 1, 1, 1, 1,
0.5839014, 0.6621775, 1.52835, 1, 1, 1, 1, 1,
0.5849208, -0.4194029, 4.576735, 1, 1, 1, 1, 1,
0.5851248, -1.104204, 3.472627, 1, 1, 1, 1, 1,
0.5856963, 1.292295, -1.392872, 1, 1, 1, 1, 1,
0.5896066, 1.134542, 0.9078342, 1, 1, 1, 1, 1,
0.5897597, 0.9378105, -0.3284684, 1, 1, 1, 1, 1,
0.5905961, -0.4371885, 2.714186, 1, 1, 1, 1, 1,
0.5920123, -1.870914, 2.888353, 1, 1, 1, 1, 1,
0.5946202, 0.7227523, -0.5270268, 1, 1, 1, 1, 1,
0.5956873, 0.6528311, 0.8033524, 1, 1, 1, 1, 1,
0.5991939, -0.3044026, 3.309496, 1, 1, 1, 1, 1,
0.6099373, 1.754671, 1.265157, 1, 1, 1, 1, 1,
0.6139007, -0.920574, 3.328404, 1, 1, 1, 1, 1,
0.6142213, 0.3883236, 0.4469693, 0, 0, 1, 1, 1,
0.6219274, 2.14851, 0.4991062, 1, 0, 0, 1, 1,
0.6226462, 1.148374, 0.442087, 1, 0, 0, 1, 1,
0.6228961, 0.2227833, -1.050433, 1, 0, 0, 1, 1,
0.6247234, 0.1887967, 0.8172262, 1, 0, 0, 1, 1,
0.6273746, -0.1332519, 1.158708, 1, 0, 0, 1, 1,
0.6276326, -0.2342489, 2.433866, 0, 0, 0, 1, 1,
0.6285378, -0.6104811, 3.194281, 0, 0, 0, 1, 1,
0.633587, 1.585974, -0.6371236, 0, 0, 0, 1, 1,
0.638484, -0.748027, 1.852267, 0, 0, 0, 1, 1,
0.6402418, -0.4327799, 2.315774, 0, 0, 0, 1, 1,
0.6439615, -0.174697, 1.987832, 0, 0, 0, 1, 1,
0.6472552, -0.5500981, 4.78445, 0, 0, 0, 1, 1,
0.6510277, -1.224192, 2.168731, 1, 1, 1, 1, 1,
0.6556686, -2.172554, 5.216469, 1, 1, 1, 1, 1,
0.656496, 0.731091, 0.4166665, 1, 1, 1, 1, 1,
0.659924, 0.1266918, 2.578932, 1, 1, 1, 1, 1,
0.6604858, -0.867632, 2.812036, 1, 1, 1, 1, 1,
0.6619685, 1.835596, 0.9008179, 1, 1, 1, 1, 1,
0.6628017, 1.278506, 0.7989537, 1, 1, 1, 1, 1,
0.6631106, 0.824362, 0.629898, 1, 1, 1, 1, 1,
0.6721841, -1.296401, 2.180764, 1, 1, 1, 1, 1,
0.6731052, 0.9480107, 0.7324326, 1, 1, 1, 1, 1,
0.6756011, -1.077358, 2.618875, 1, 1, 1, 1, 1,
0.6773378, 1.25242, -0.3220354, 1, 1, 1, 1, 1,
0.6880493, -0.5553559, 3.134845, 1, 1, 1, 1, 1,
0.6902855, -0.8159757, 2.427367, 1, 1, 1, 1, 1,
0.6930537, 1.025348, 2.489897, 1, 1, 1, 1, 1,
0.6950122, 0.9536527, 1.216356, 0, 0, 1, 1, 1,
0.7001782, -0.6024533, 2.623125, 1, 0, 0, 1, 1,
0.7016167, -0.6958264, 2.935915, 1, 0, 0, 1, 1,
0.7027562, -1.209047, 1.203038, 1, 0, 0, 1, 1,
0.7047005, -0.6664133, 2.619646, 1, 0, 0, 1, 1,
0.7055646, 2.165913, 1.039469, 1, 0, 0, 1, 1,
0.7058675, 2.496299, -1.053123, 0, 0, 0, 1, 1,
0.711107, 0.1667928, 2.493345, 0, 0, 0, 1, 1,
0.7131348, -1.344321, 1.82738, 0, 0, 0, 1, 1,
0.7138764, -0.5195179, 2.794438, 0, 0, 0, 1, 1,
0.7196848, -1.367079, 2.332535, 0, 0, 0, 1, 1,
0.7206595, 0.2429837, 4.199697, 0, 0, 0, 1, 1,
0.7263978, -0.8621976, 0.4995537, 0, 0, 0, 1, 1,
0.7294497, 1.184689, 1.588412, 1, 1, 1, 1, 1,
0.7325149, -2.234522, 2.484631, 1, 1, 1, 1, 1,
0.7351975, 0.6468416, 1.850416, 1, 1, 1, 1, 1,
0.7368519, -1.571719, 4.008141, 1, 1, 1, 1, 1,
0.7397043, -1.317553, -0.3304718, 1, 1, 1, 1, 1,
0.7400253, -1.64197, 2.653314, 1, 1, 1, 1, 1,
0.7413807, -0.1232199, 4.530172, 1, 1, 1, 1, 1,
0.743149, 0.7143804, 1.10222, 1, 1, 1, 1, 1,
0.7459388, -0.3532039, 2.486752, 1, 1, 1, 1, 1,
0.7464277, -1.019676, 1.393254, 1, 1, 1, 1, 1,
0.746486, 0.02374757, 0.4040332, 1, 1, 1, 1, 1,
0.7489458, 1.709427, 1.049488, 1, 1, 1, 1, 1,
0.7506843, -1.244469, 2.181777, 1, 1, 1, 1, 1,
0.7536769, -0.7576605, 3.05566, 1, 1, 1, 1, 1,
0.7542294, -1.414749, 4.073318, 1, 1, 1, 1, 1,
0.7553254, 0.3422911, 2.397374, 0, 0, 1, 1, 1,
0.7577248, 0.2877142, 1.60234, 1, 0, 0, 1, 1,
0.7633103, -0.1125704, 1.34138, 1, 0, 0, 1, 1,
0.7659258, 0.1180869, 0.5541755, 1, 0, 0, 1, 1,
0.7709066, -0.1297115, 2.058403, 1, 0, 0, 1, 1,
0.7712296, -0.4425915, 0.00661768, 1, 0, 0, 1, 1,
0.7784413, -3.1111, 2.229972, 0, 0, 0, 1, 1,
0.7805662, 0.1270554, 2.24486, 0, 0, 0, 1, 1,
0.7833927, 0.311897, 1.298409, 0, 0, 0, 1, 1,
0.7852411, -0.05314191, 0.8583512, 0, 0, 0, 1, 1,
0.7884992, -0.6305809, 2.882146, 0, 0, 0, 1, 1,
0.7902225, -0.9820557, 2.97869, 0, 0, 0, 1, 1,
0.8065721, -1.096025, 2.142404, 0, 0, 0, 1, 1,
0.8097465, -0.5387911, 1.420609, 1, 1, 1, 1, 1,
0.8257436, -0.5227649, 2.374922, 1, 1, 1, 1, 1,
0.8288867, 0.2802892, -0.5482077, 1, 1, 1, 1, 1,
0.8336071, -0.4850442, 3.020929, 1, 1, 1, 1, 1,
0.8338306, -0.1945814, 1.071621, 1, 1, 1, 1, 1,
0.8353375, 0.4402799, 1.345814, 1, 1, 1, 1, 1,
0.8444437, -0.8924404, 2.446975, 1, 1, 1, 1, 1,
0.8501169, 0.972099, 1.705656, 1, 1, 1, 1, 1,
0.8536198, 0.5139406, 1.416344, 1, 1, 1, 1, 1,
0.8539045, -0.6324517, 1.506497, 1, 1, 1, 1, 1,
0.8557474, 0.008397721, 2.907706, 1, 1, 1, 1, 1,
0.8578026, 0.9780691, -0.514345, 1, 1, 1, 1, 1,
0.8592772, -1.104108, 2.650061, 1, 1, 1, 1, 1,
0.8615831, -1.099326, 2.8089, 1, 1, 1, 1, 1,
0.8620795, 0.8153162, 1.564191, 1, 1, 1, 1, 1,
0.8795905, 0.7792059, 2.216658, 0, 0, 1, 1, 1,
0.8865436, 0.9958494, 1.550052, 1, 0, 0, 1, 1,
0.8875942, 0.3111877, 0.6097475, 1, 0, 0, 1, 1,
0.8899091, 1.79334, -0.8320329, 1, 0, 0, 1, 1,
0.890516, 0.5839409, 1.947794, 1, 0, 0, 1, 1,
0.8919122, 1.446557, 0.1021054, 1, 0, 0, 1, 1,
0.8937678, -0.1358485, 3.766882, 0, 0, 0, 1, 1,
0.8943055, 1.834216, 0.7406837, 0, 0, 0, 1, 1,
0.9059156, 0.4133362, 2.078619, 0, 0, 0, 1, 1,
0.9095769, 0.2440989, 2.073492, 0, 0, 0, 1, 1,
0.9097372, -0.8314685, 3.68161, 0, 0, 0, 1, 1,
0.9184458, -1.04872, 0.4525673, 0, 0, 0, 1, 1,
0.9231534, 2.06143, 1.639802, 0, 0, 0, 1, 1,
0.9240137, -1.48676, 3.472128, 1, 1, 1, 1, 1,
0.9311171, 0.8629647, 1.817542, 1, 1, 1, 1, 1,
0.9323259, 0.1016769, 2.078036, 1, 1, 1, 1, 1,
0.9328356, -1.242773, 1.312581, 1, 1, 1, 1, 1,
0.9435377, 1.259988, 1.784501, 1, 1, 1, 1, 1,
0.94694, -0.77319, 1.636905, 1, 1, 1, 1, 1,
0.9511785, 1.022423, 2.035152, 1, 1, 1, 1, 1,
0.9548289, 1.53208, 0.5353499, 1, 1, 1, 1, 1,
0.9574393, -0.2312119, 2.032775, 1, 1, 1, 1, 1,
0.9594719, -0.9400856, 3.641305, 1, 1, 1, 1, 1,
0.9654688, -0.9877403, 1.587331, 1, 1, 1, 1, 1,
0.9672159, 0.8363234, 0.5213227, 1, 1, 1, 1, 1,
0.9681255, -1.146053, 3.490853, 1, 1, 1, 1, 1,
0.971057, 0.02038734, 0.3322265, 1, 1, 1, 1, 1,
0.9727665, 0.5392824, 0.1738049, 1, 1, 1, 1, 1,
0.9740246, 0.4107594, -0.09905487, 0, 0, 1, 1, 1,
0.9781086, -1.15676, 1.814785, 1, 0, 0, 1, 1,
0.9815505, 1.95199, 2.04572, 1, 0, 0, 1, 1,
0.9847414, -0.4761479, 3.448611, 1, 0, 0, 1, 1,
0.9977245, 0.1569636, 1.224999, 1, 0, 0, 1, 1,
1.002339, 1.062474, 1.466366, 1, 0, 0, 1, 1,
1.005643, -0.8392284, 0.7338172, 0, 0, 0, 1, 1,
1.024166, -2.475102, 2.003317, 0, 0, 0, 1, 1,
1.024744, -0.3106519, 2.543499, 0, 0, 0, 1, 1,
1.034122, -0.8502744, 2.398859, 0, 0, 0, 1, 1,
1.035192, -0.09152019, 3.518485, 0, 0, 0, 1, 1,
1.036416, 0.00176766, 1.3352, 0, 0, 0, 1, 1,
1.038688, -1.381718, 2.804911, 0, 0, 0, 1, 1,
1.041943, -1.733182, 2.390148, 1, 1, 1, 1, 1,
1.047663, 0.1183199, 1.739901, 1, 1, 1, 1, 1,
1.050167, -0.8028122, 0.3399396, 1, 1, 1, 1, 1,
1.055598, 2.330122, 0.6649231, 1, 1, 1, 1, 1,
1.059897, 1.360125, -0.1539443, 1, 1, 1, 1, 1,
1.067765, -0.9407533, 1.326917, 1, 1, 1, 1, 1,
1.071242, 0.9401615, 1.249588, 1, 1, 1, 1, 1,
1.073179, -0.1068434, 2.162609, 1, 1, 1, 1, 1,
1.076341, 1.020049, 0.6769425, 1, 1, 1, 1, 1,
1.080588, -0.7910488, 3.44662, 1, 1, 1, 1, 1,
1.080609, 0.09060573, 1.062271, 1, 1, 1, 1, 1,
1.082337, 1.62672, 1.54186, 1, 1, 1, 1, 1,
1.089369, -1.649387, 1.719982, 1, 1, 1, 1, 1,
1.090153, -0.2451521, -0.4688045, 1, 1, 1, 1, 1,
1.091357, -1.043923, 3.855094, 1, 1, 1, 1, 1,
1.094517, 0.3936483, 2.454231, 0, 0, 1, 1, 1,
1.097298, -0.08169495, 1.84079, 1, 0, 0, 1, 1,
1.103169, -0.05242369, 0.939834, 1, 0, 0, 1, 1,
1.103957, 0.1958541, 0.5071671, 1, 0, 0, 1, 1,
1.106915, 1.121871, 0.7326206, 1, 0, 0, 1, 1,
1.1091, 1.117482, 2.043671, 1, 0, 0, 1, 1,
1.111684, -0.9543243, 1.520087, 0, 0, 0, 1, 1,
1.113666, -0.1796838, 4.168499, 0, 0, 0, 1, 1,
1.124556, -0.9290689, 2.511721, 0, 0, 0, 1, 1,
1.146423, -0.7770507, 3.222629, 0, 0, 0, 1, 1,
1.1474, -0.6320801, 1.489818, 0, 0, 0, 1, 1,
1.15456, 1.411538, -0.09232576, 0, 0, 0, 1, 1,
1.155282, 1.257162, 1.286701, 0, 0, 0, 1, 1,
1.156421, -1.068112, 3.346431, 1, 1, 1, 1, 1,
1.166896, 0.4014337, 0.7418272, 1, 1, 1, 1, 1,
1.17179, 1.160773, -0.07347456, 1, 1, 1, 1, 1,
1.173882, -0.2437124, 1.316187, 1, 1, 1, 1, 1,
1.178044, 0.4660383, 2.419434, 1, 1, 1, 1, 1,
1.181275, -0.44041, 2.785042, 1, 1, 1, 1, 1,
1.188136, -0.877589, 1.833679, 1, 1, 1, 1, 1,
1.189381, 0.3849669, 2.458556, 1, 1, 1, 1, 1,
1.194506, -2.357275, 2.03297, 1, 1, 1, 1, 1,
1.202123, -0.1976578, 0.7603315, 1, 1, 1, 1, 1,
1.219785, -0.2356963, 0.6560825, 1, 1, 1, 1, 1,
1.226817, -0.6890824, 2.452727, 1, 1, 1, 1, 1,
1.22918, -0.5774845, 0.7835331, 1, 1, 1, 1, 1,
1.230727, 0.2915307, 2.102095, 1, 1, 1, 1, 1,
1.23447, 0.9107631, 1.506552, 1, 1, 1, 1, 1,
1.237931, 0.2102884, 0.1820392, 0, 0, 1, 1, 1,
1.24312, 1.108077, 1.379986, 1, 0, 0, 1, 1,
1.244638, 0.1996153, 2.836387, 1, 0, 0, 1, 1,
1.249354, -1.05465, 2.28897, 1, 0, 0, 1, 1,
1.251524, -1.708232, 4.198281, 1, 0, 0, 1, 1,
1.256123, 0.6413356, 1.501391, 1, 0, 0, 1, 1,
1.256574, -0.6820755, 2.018216, 0, 0, 0, 1, 1,
1.259666, 1.142397, 0.4444332, 0, 0, 0, 1, 1,
1.279254, -0.7350464, 2.65065, 0, 0, 0, 1, 1,
1.282198, 0.3247534, 1.84989, 0, 0, 0, 1, 1,
1.286068, 0.8181793, 0.9849226, 0, 0, 0, 1, 1,
1.298598, -0.5163412, 3.295736, 0, 0, 0, 1, 1,
1.309316, -0.599927, 1.823625, 0, 0, 0, 1, 1,
1.311227, 0.04043703, -0.03718955, 1, 1, 1, 1, 1,
1.313335, -2.396404, 3.251919, 1, 1, 1, 1, 1,
1.317333, 1.794593, 2.254455, 1, 1, 1, 1, 1,
1.328487, -0.2504114, 1.796923, 1, 1, 1, 1, 1,
1.335461, -0.6457462, 2.36217, 1, 1, 1, 1, 1,
1.342387, -1.624914, 2.258139, 1, 1, 1, 1, 1,
1.354503, 1.153671, 1.182292, 1, 1, 1, 1, 1,
1.355681, -0.7595239, 1.721329, 1, 1, 1, 1, 1,
1.357441, 0.1016858, 2.503259, 1, 1, 1, 1, 1,
1.381088, -0.5950355, 1.490098, 1, 1, 1, 1, 1,
1.381961, 0.8750069, 0.8215051, 1, 1, 1, 1, 1,
1.391873, 1.369162, 0.643017, 1, 1, 1, 1, 1,
1.396783, 0.3347506, 1.407212, 1, 1, 1, 1, 1,
1.397434, 0.3796176, 2.391112, 1, 1, 1, 1, 1,
1.399143, -0.1560254, 2.439857, 1, 1, 1, 1, 1,
1.402455, 1.067445, 1.833377, 0, 0, 1, 1, 1,
1.403013, 0.9670775, 3.000909, 1, 0, 0, 1, 1,
1.406265, 0.3730178, 1.841611, 1, 0, 0, 1, 1,
1.410206, 0.1049988, 0.8475558, 1, 0, 0, 1, 1,
1.422202, -1.857398, 3.853326, 1, 0, 0, 1, 1,
1.424481, -2.606435, 1.573731, 1, 0, 0, 1, 1,
1.434119, 0.5870706, 0.1518934, 0, 0, 0, 1, 1,
1.434305, -0.874086, 0.4528387, 0, 0, 0, 1, 1,
1.452201, 1.260141, 1.424709, 0, 0, 0, 1, 1,
1.460238, 1.316655, 2.628422, 0, 0, 0, 1, 1,
1.471155, -1.300496, 2.220201, 0, 0, 0, 1, 1,
1.490555, 0.1576063, 2.719286, 0, 0, 0, 1, 1,
1.496569, -0.5022632, 2.879068, 0, 0, 0, 1, 1,
1.516986, -2.242595, 1.85546, 1, 1, 1, 1, 1,
1.518673, 0.4217696, 2.886325, 1, 1, 1, 1, 1,
1.527647, 0.9547534, -0.5564843, 1, 1, 1, 1, 1,
1.548755, -0.2461371, 0.6797512, 1, 1, 1, 1, 1,
1.571816, -0.6229244, 2.650668, 1, 1, 1, 1, 1,
1.574442, -0.9363752, 1.419802, 1, 1, 1, 1, 1,
1.574764, -1.908107, 2.927364, 1, 1, 1, 1, 1,
1.577614, -1.01084, 1.458397, 1, 1, 1, 1, 1,
1.583278, -0.6191995, 2.010344, 1, 1, 1, 1, 1,
1.599505, -0.771807, 1.424445, 1, 1, 1, 1, 1,
1.600118, -1.248125, 3.553193, 1, 1, 1, 1, 1,
1.600926, -0.1356347, 3.92802, 1, 1, 1, 1, 1,
1.603541, 0.4493057, 1.321059, 1, 1, 1, 1, 1,
1.612226, 2.392642, -0.4764384, 1, 1, 1, 1, 1,
1.622092, -0.3593898, 1.160767, 1, 1, 1, 1, 1,
1.630477, -2.031656, 2.818343, 0, 0, 1, 1, 1,
1.636721, 0.5371205, 0.5670936, 1, 0, 0, 1, 1,
1.671131, 0.2002244, 1.211016, 1, 0, 0, 1, 1,
1.684866, 0.6938489, 0.6449846, 1, 0, 0, 1, 1,
1.68512, 0.5012065, 0.9317042, 1, 0, 0, 1, 1,
1.692064, 0.2682328, 3.94878, 1, 0, 0, 1, 1,
1.715094, 0.041722, 1.376226, 0, 0, 0, 1, 1,
1.716183, -0.6035879, 2.161265, 0, 0, 0, 1, 1,
1.735774, -0.3380461, 1.393315, 0, 0, 0, 1, 1,
1.740669, -0.6826561, 1.209729, 0, 0, 0, 1, 1,
1.779327, -0.1063094, 0.9019853, 0, 0, 0, 1, 1,
1.787768, -1.003738, 0.6572986, 0, 0, 0, 1, 1,
1.792404, -0.8921934, 1.841095, 0, 0, 0, 1, 1,
1.800302, -1.135158, -0.04868797, 1, 1, 1, 1, 1,
1.806038, -0.629007, 2.222102, 1, 1, 1, 1, 1,
1.809929, -0.2397874, 2.750235, 1, 1, 1, 1, 1,
1.836645, 0.0204164, 3.460192, 1, 1, 1, 1, 1,
1.864658, -0.5671254, 1.18045, 1, 1, 1, 1, 1,
1.868255, 0.3767742, 0.9281878, 1, 1, 1, 1, 1,
1.873321, 1.58127, -0.008733209, 1, 1, 1, 1, 1,
1.899857, -1.142977, 2.17962, 1, 1, 1, 1, 1,
1.928871, -0.1834849, 1.240435, 1, 1, 1, 1, 1,
1.946432, 1.793939, 1.636571, 1, 1, 1, 1, 1,
1.952554, 0.2926213, 0.1263611, 1, 1, 1, 1, 1,
1.954259, 0.1121071, 1.884429, 1, 1, 1, 1, 1,
1.956199, 0.2880009, 1.613489, 1, 1, 1, 1, 1,
1.961353, 1.552405, -1.127649, 1, 1, 1, 1, 1,
2.023744, 0.6060351, 1.696948, 1, 1, 1, 1, 1,
2.034245, 0.1713261, 1.387044, 0, 0, 1, 1, 1,
2.036199, 0.915283, 0.8490599, 1, 0, 0, 1, 1,
2.085237, 1.117992, 1.899942, 1, 0, 0, 1, 1,
2.090652, 0.933645, 1.004257, 1, 0, 0, 1, 1,
2.098399, 2.285982, 1.52154, 1, 0, 0, 1, 1,
2.112881, -0.6348238, -0.1563636, 1, 0, 0, 1, 1,
2.12442, -1.223289, 2.908405, 0, 0, 0, 1, 1,
2.146388, 0.2688071, -0.1284868, 0, 0, 0, 1, 1,
2.216294, -1.403994, 2.508528, 0, 0, 0, 1, 1,
2.322386, 0.5229415, 2.374858, 0, 0, 0, 1, 1,
2.343859, 0.2315086, -0.9876209, 0, 0, 0, 1, 1,
2.363266, 0.8101554, 1.062594, 0, 0, 0, 1, 1,
2.382952, -0.8503581, 2.089304, 0, 0, 0, 1, 1,
2.417425, 0.2371528, 0.08662615, 1, 1, 1, 1, 1,
2.452203, -1.508456, 2.121142, 1, 1, 1, 1, 1,
2.505455, -0.6308669, 2.523868, 1, 1, 1, 1, 1,
2.530821, 1.793121, -0.2464876, 1, 1, 1, 1, 1,
2.590322, -0.7941822, 1.238246, 1, 1, 1, 1, 1,
2.701359, -0.6147915, 1.388601, 1, 1, 1, 1, 1,
2.838361, -0.6377534, 1.481753, 1, 1, 1, 1, 1
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
var radius = 9.638382;
var distance = 33.8544;
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
mvMatrix.translate( 0.1355802, -0.3364227, -0.04665375 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.8544);
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