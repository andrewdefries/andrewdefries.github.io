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
-3.330748, -1.162744, -2.810891, 1, 0, 0, 1,
-3.120134, -0.538613, 0.5716588, 1, 0.007843138, 0, 1,
-2.921899, -1.571045, -1.833371, 1, 0.01176471, 0, 1,
-2.769788, -1.357932, -2.746701, 1, 0.01960784, 0, 1,
-2.68636, -1.028806, -3.095531, 1, 0.02352941, 0, 1,
-2.630301, 1.096708, -0.1895683, 1, 0.03137255, 0, 1,
-2.589663, 1.994128, -2.867966, 1, 0.03529412, 0, 1,
-2.537922, 0.338862, -1.752481, 1, 0.04313726, 0, 1,
-2.526, 0.9048188, -1.636768, 1, 0.04705882, 0, 1,
-2.508236, 1.680181, 1.067859, 1, 0.05490196, 0, 1,
-2.491683, 1.465319, -2.385214, 1, 0.05882353, 0, 1,
-2.427216, -0.8714232, -1.808552, 1, 0.06666667, 0, 1,
-2.396037, 1.403811, -2.090079, 1, 0.07058824, 0, 1,
-2.367431, -0.7131504, -0.5716165, 1, 0.07843138, 0, 1,
-2.214253, -0.4582992, -2.071308, 1, 0.08235294, 0, 1,
-2.182313, 1.244333, -1.01188, 1, 0.09019608, 0, 1,
-2.18198, 1.667158, -0.6246775, 1, 0.09411765, 0, 1,
-2.138901, -0.6858609, -2.063141, 1, 0.1019608, 0, 1,
-2.081891, -0.5827323, -2.387002, 1, 0.1098039, 0, 1,
-2.073553, 1.001294, -1.271173, 1, 0.1137255, 0, 1,
-2.034086, -1.201924, -2.523993, 1, 0.1215686, 0, 1,
-2.023857, 1.810195, -0.2252413, 1, 0.1254902, 0, 1,
-2.021977, 0.2000318, -0.8244913, 1, 0.1333333, 0, 1,
-2.005566, 0.9012446, -0.9912635, 1, 0.1372549, 0, 1,
-1.996481, -0.9926031, -1.914424, 1, 0.145098, 0, 1,
-1.992285, -0.5458274, -1.255289, 1, 0.1490196, 0, 1,
-1.991066, -1.149712, -2.29586, 1, 0.1568628, 0, 1,
-1.959279, 0.6166399, -1.500202, 1, 0.1607843, 0, 1,
-1.95083, 1.23712, -1.353526, 1, 0.1686275, 0, 1,
-1.937175, 0.8540004, 0.4180315, 1, 0.172549, 0, 1,
-1.924065, -1.607522, -3.319426, 1, 0.1803922, 0, 1,
-1.903511, 1.339837, -0.628459, 1, 0.1843137, 0, 1,
-1.84138, 2.720877, -1.105462, 1, 0.1921569, 0, 1,
-1.837437, 1.635081, -0.159645, 1, 0.1960784, 0, 1,
-1.803443, -1.238284, -2.319846, 1, 0.2039216, 0, 1,
-1.800566, 0.958709, -0.3082303, 1, 0.2117647, 0, 1,
-1.782673, -0.3163048, -0.8045365, 1, 0.2156863, 0, 1,
-1.764967, 2.211837, 1.446573, 1, 0.2235294, 0, 1,
-1.750134, -0.7371605, -3.17388, 1, 0.227451, 0, 1,
-1.735252, -0.8142997, -2.258055, 1, 0.2352941, 0, 1,
-1.717182, 0.6788191, -1.191989, 1, 0.2392157, 0, 1,
-1.716798, 0.6425341, 0.1841782, 1, 0.2470588, 0, 1,
-1.709076, 1.121276, -2.677142, 1, 0.2509804, 0, 1,
-1.695871, 0.5622495, -1.993784, 1, 0.2588235, 0, 1,
-1.663759, 0.7142732, -0.4937191, 1, 0.2627451, 0, 1,
-1.661637, 0.9739285, -0.05503525, 1, 0.2705882, 0, 1,
-1.644046, -0.1186294, -1.773208, 1, 0.2745098, 0, 1,
-1.639293, 0.4827208, -0.7366011, 1, 0.282353, 0, 1,
-1.631009, 0.2729349, -2.387528, 1, 0.2862745, 0, 1,
-1.629408, 0.7783821, -1.393752, 1, 0.2941177, 0, 1,
-1.604588, 1.827993, -0.7906955, 1, 0.3019608, 0, 1,
-1.584241, 0.7943605, -0.5202305, 1, 0.3058824, 0, 1,
-1.583664, -0.1609914, -2.733192, 1, 0.3137255, 0, 1,
-1.57304, 0.05050344, 0.01554815, 1, 0.3176471, 0, 1,
-1.572694, 0.7479529, -2.484448, 1, 0.3254902, 0, 1,
-1.570868, -0.1924313, -1.422074, 1, 0.3294118, 0, 1,
-1.56976, -0.3422354, -2.457876, 1, 0.3372549, 0, 1,
-1.568181, 0.1418463, -0.5743703, 1, 0.3411765, 0, 1,
-1.562813, -0.2702444, -3.406323, 1, 0.3490196, 0, 1,
-1.548188, -0.01113036, -2.065882, 1, 0.3529412, 0, 1,
-1.538129, 1.118322, -1.469555, 1, 0.3607843, 0, 1,
-1.533373, -0.5017553, -2.276214, 1, 0.3647059, 0, 1,
-1.533093, 1.34745, 0.05224591, 1, 0.372549, 0, 1,
-1.527125, 0.5981458, -2.257198, 1, 0.3764706, 0, 1,
-1.507343, 0.4032619, 0.06496569, 1, 0.3843137, 0, 1,
-1.495897, -0.09311569, -0.9746739, 1, 0.3882353, 0, 1,
-1.48763, -0.5872608, -0.6383151, 1, 0.3960784, 0, 1,
-1.486456, -0.3655002, -2.911125, 1, 0.4039216, 0, 1,
-1.478029, 1.583561, -0.5782391, 1, 0.4078431, 0, 1,
-1.471412, -1.746575, -1.173625, 1, 0.4156863, 0, 1,
-1.47015, 1.468441, -0.1353311, 1, 0.4196078, 0, 1,
-1.468112, 0.5910239, -1.782089, 1, 0.427451, 0, 1,
-1.466767, -1.667826, -3.493276, 1, 0.4313726, 0, 1,
-1.46399, 0.9542351, -1.863555, 1, 0.4392157, 0, 1,
-1.448594, 0.04090463, -1.620335, 1, 0.4431373, 0, 1,
-1.426691, 2.362481, -0.1782888, 1, 0.4509804, 0, 1,
-1.421084, -0.3590639, -2.822213, 1, 0.454902, 0, 1,
-1.415077, 1.396715, -2.046029, 1, 0.4627451, 0, 1,
-1.414307, -1.120729, -2.276903, 1, 0.4666667, 0, 1,
-1.406324, -0.2576286, -1.14652, 1, 0.4745098, 0, 1,
-1.394492, 0.03176257, -1.537912, 1, 0.4784314, 0, 1,
-1.393527, 1.197353, -0.149642, 1, 0.4862745, 0, 1,
-1.389011, -0.05230131, -2.405911, 1, 0.4901961, 0, 1,
-1.387832, 0.1670117, 0.004141386, 1, 0.4980392, 0, 1,
-1.361759, 1.904047, -1.00539, 1, 0.5058824, 0, 1,
-1.326979, 1.09524, 0.6667712, 1, 0.509804, 0, 1,
-1.314849, 1.451308, 1.828846, 1, 0.5176471, 0, 1,
-1.308803, 0.1624392, -1.218254, 1, 0.5215687, 0, 1,
-1.298134, 0.2009615, -2.482082, 1, 0.5294118, 0, 1,
-1.298034, -0.9275364, -2.243659, 1, 0.5333334, 0, 1,
-1.290575, 1.544374, -1.272367, 1, 0.5411765, 0, 1,
-1.288188, -1.546153, -1.772677, 1, 0.5450981, 0, 1,
-1.286443, -0.4096392, -1.506185, 1, 0.5529412, 0, 1,
-1.270196, -1.24347, -2.16853, 1, 0.5568628, 0, 1,
-1.262656, 0.7276766, 0.1460771, 1, 0.5647059, 0, 1,
-1.246353, 1.987562, -0.8723414, 1, 0.5686275, 0, 1,
-1.237015, 1.149803, -0.8433108, 1, 0.5764706, 0, 1,
-1.223459, 1.24063, -0.557218, 1, 0.5803922, 0, 1,
-1.221774, 1.355009, -1.481403, 1, 0.5882353, 0, 1,
-1.217093, -1.679246, -1.182526, 1, 0.5921569, 0, 1,
-1.216826, -0.5236037, -2.210408, 1, 0.6, 0, 1,
-1.214199, -0.2643227, -2.686001, 1, 0.6078432, 0, 1,
-1.210782, 1.945546, -2.420362, 1, 0.6117647, 0, 1,
-1.209186, -1.299616, -3.763914, 1, 0.6196079, 0, 1,
-1.201584, 0.3146585, -1.721901, 1, 0.6235294, 0, 1,
-1.196532, 0.7412748, -2.454615, 1, 0.6313726, 0, 1,
-1.189921, -1.04017, -1.711141, 1, 0.6352941, 0, 1,
-1.185587, 0.846896, -0.9928054, 1, 0.6431373, 0, 1,
-1.181108, 0.3996077, -0.2651783, 1, 0.6470588, 0, 1,
-1.178648, -0.6469453, -0.4931852, 1, 0.654902, 0, 1,
-1.172908, 0.3573844, -1.417445, 1, 0.6588235, 0, 1,
-1.172851, -0.8070272, -1.682033, 1, 0.6666667, 0, 1,
-1.159155, -0.4560775, -0.7279214, 1, 0.6705883, 0, 1,
-1.154786, -0.5240768, -3.281298, 1, 0.6784314, 0, 1,
-1.150637, 1.259993, -2.172731, 1, 0.682353, 0, 1,
-1.1451, 0.1622221, -0.6544618, 1, 0.6901961, 0, 1,
-1.142762, -1.236123, -2.054901, 1, 0.6941177, 0, 1,
-1.135484, 0.5847193, -0.7444119, 1, 0.7019608, 0, 1,
-1.122027, -0.8711892, -2.299669, 1, 0.7098039, 0, 1,
-1.119495, -1.163343, -1.431169, 1, 0.7137255, 0, 1,
-1.118377, 0.6157463, -0.6579345, 1, 0.7215686, 0, 1,
-1.115692, -0.7840829, -0.8458233, 1, 0.7254902, 0, 1,
-1.115489, 0.849363, -0.8256887, 1, 0.7333333, 0, 1,
-1.103131, 0.9572138, 0.04298448, 1, 0.7372549, 0, 1,
-1.099591, -0.3155445, 0.3546325, 1, 0.7450981, 0, 1,
-1.087773, 1.117219, -1.260105, 1, 0.7490196, 0, 1,
-1.087139, 0.2188364, -0.7000967, 1, 0.7568628, 0, 1,
-1.077948, 0.8876123, -2.485992, 1, 0.7607843, 0, 1,
-1.072556, 0.7659379, -1.899161, 1, 0.7686275, 0, 1,
-1.062019, 0.8579796, -3.090351, 1, 0.772549, 0, 1,
-1.058834, -0.7648854, -2.066996, 1, 0.7803922, 0, 1,
-1.056232, 0.1455645, -1.13518, 1, 0.7843137, 0, 1,
-1.055084, -0.1217282, -3.236662, 1, 0.7921569, 0, 1,
-1.051052, -0.1215245, -3.111034, 1, 0.7960784, 0, 1,
-1.038694, 1.124147, -0.1549334, 1, 0.8039216, 0, 1,
-1.02267, -0.9143675, -1.365851, 1, 0.8117647, 0, 1,
-1.021532, -0.006494529, -2.257823, 1, 0.8156863, 0, 1,
-1.01562, -0.5043203, -3.057639, 1, 0.8235294, 0, 1,
-1.002478, 1.77235, -1.22744, 1, 0.827451, 0, 1,
-1.000874, -0.9851511, -2.263197, 1, 0.8352941, 0, 1,
-0.9959109, 0.7605141, -1.05436, 1, 0.8392157, 0, 1,
-0.9922871, -0.5449244, -0.3562565, 1, 0.8470588, 0, 1,
-0.9861246, 0.2977819, -2.116341, 1, 0.8509804, 0, 1,
-0.9852916, 0.1802904, -3.169352, 1, 0.8588235, 0, 1,
-0.9787644, 0.4899623, 0.5279204, 1, 0.8627451, 0, 1,
-0.9767433, -0.3419884, -1.284289, 1, 0.8705882, 0, 1,
-0.97263, -0.1871603, -1.693077, 1, 0.8745098, 0, 1,
-0.9682244, -0.4290765, -0.2574238, 1, 0.8823529, 0, 1,
-0.962577, 1.323503, -2.11553, 1, 0.8862745, 0, 1,
-0.9584332, 0.5027087, -2.21874, 1, 0.8941177, 0, 1,
-0.9566266, 0.2416832, -1.378384, 1, 0.8980392, 0, 1,
-0.9550303, 1.670547, 0.8688152, 1, 0.9058824, 0, 1,
-0.9470381, -0.7779713, -1.292946, 1, 0.9137255, 0, 1,
-0.9395919, 0.3419296, 1.144129, 1, 0.9176471, 0, 1,
-0.9344624, 0.05359779, -2.255358, 1, 0.9254902, 0, 1,
-0.9305679, 0.4300542, -2.227, 1, 0.9294118, 0, 1,
-0.9302804, -1.496998, -1.832095, 1, 0.9372549, 0, 1,
-0.9277971, 0.42189, -0.4400703, 1, 0.9411765, 0, 1,
-0.9175592, 0.2334607, -1.342486, 1, 0.9490196, 0, 1,
-0.916003, 0.3722102, -1.474766, 1, 0.9529412, 0, 1,
-0.9148219, -0.06132757, -2.068872, 1, 0.9607843, 0, 1,
-0.9132583, -0.2937395, -2.499991, 1, 0.9647059, 0, 1,
-0.9118469, -0.3310192, -3.73586, 1, 0.972549, 0, 1,
-0.8969415, 0.6971843, -2.099325, 1, 0.9764706, 0, 1,
-0.896789, 0.2797283, -1.758457, 1, 0.9843137, 0, 1,
-0.8959141, 0.3668548, -1.582786, 1, 0.9882353, 0, 1,
-0.8951815, 0.9790338, -0.7813655, 1, 0.9960784, 0, 1,
-0.8940967, 0.1818934, -2.946975, 0.9960784, 1, 0, 1,
-0.8923476, -0.563814, -1.591944, 0.9921569, 1, 0, 1,
-0.8895933, 2.637233, -0.1089594, 0.9843137, 1, 0, 1,
-0.8879166, 0.2312627, -1.510267, 0.9803922, 1, 0, 1,
-0.8860121, 0.7509116, -1.569185, 0.972549, 1, 0, 1,
-0.8855688, -0.9251462, -2.344083, 0.9686275, 1, 0, 1,
-0.8827532, -1.063779, -2.5926, 0.9607843, 1, 0, 1,
-0.881115, 0.7894636, -1.476144, 0.9568627, 1, 0, 1,
-0.8778872, 1.153552, -1.543601, 0.9490196, 1, 0, 1,
-0.877306, 1.411077, -1.978554, 0.945098, 1, 0, 1,
-0.872672, -1.601025, -4.239822, 0.9372549, 1, 0, 1,
-0.8684775, -0.6172362, -2.436962, 0.9333333, 1, 0, 1,
-0.8638586, 0.882521, -0.9707559, 0.9254902, 1, 0, 1,
-0.8633348, 0.5797935, -0.6770313, 0.9215686, 1, 0, 1,
-0.8621218, 0.5308639, -1.413283, 0.9137255, 1, 0, 1,
-0.8607127, 1.424174, -1.106822, 0.9098039, 1, 0, 1,
-0.8554118, -0.01923403, -1.259338, 0.9019608, 1, 0, 1,
-0.8551224, -0.4395108, -2.912148, 0.8941177, 1, 0, 1,
-0.8544651, -0.04096963, -2.577937, 0.8901961, 1, 0, 1,
-0.848233, -0.953966, -1.719641, 0.8823529, 1, 0, 1,
-0.8476864, -0.3686676, -2.148108, 0.8784314, 1, 0, 1,
-0.8400775, -0.2349644, -0.7197684, 0.8705882, 1, 0, 1,
-0.8374912, -0.513617, -1.434894, 0.8666667, 1, 0, 1,
-0.8290563, 0.278942, -2.14742, 0.8588235, 1, 0, 1,
-0.8236142, 1.349123, -1.018919, 0.854902, 1, 0, 1,
-0.8227112, -1.00522, -1.575907, 0.8470588, 1, 0, 1,
-0.8180556, 0.1456057, -1.28496, 0.8431373, 1, 0, 1,
-0.8174796, 0.6032907, -0.9724734, 0.8352941, 1, 0, 1,
-0.8174579, -0.2082816, -0.6160138, 0.8313726, 1, 0, 1,
-0.8145329, -0.8432916, -4.943364, 0.8235294, 1, 0, 1,
-0.8122894, -1.066353, -1.653177, 0.8196079, 1, 0, 1,
-0.8032476, 0.05827949, -0.6881678, 0.8117647, 1, 0, 1,
-0.8016023, 1.813518, -0.1500539, 0.8078431, 1, 0, 1,
-0.7975751, -1.60374, -4.212854, 0.8, 1, 0, 1,
-0.7954427, 1.056501, 0.2217684, 0.7921569, 1, 0, 1,
-0.7903755, 0.07863032, -1.06558, 0.7882353, 1, 0, 1,
-0.7884589, -2.974383, -3.435665, 0.7803922, 1, 0, 1,
-0.7852941, 0.5829914, -1.967626, 0.7764706, 1, 0, 1,
-0.777712, 0.5331577, -0.2069702, 0.7686275, 1, 0, 1,
-0.7711587, -0.4720004, -1.399636, 0.7647059, 1, 0, 1,
-0.770084, 0.9057236, 0.1997134, 0.7568628, 1, 0, 1,
-0.7643275, 0.2594139, -0.1189604, 0.7529412, 1, 0, 1,
-0.7628316, 1.069597, 0.1608514, 0.7450981, 1, 0, 1,
-0.761333, 0.2772372, -0.6364118, 0.7411765, 1, 0, 1,
-0.7599503, 1.527864, -0.5473505, 0.7333333, 1, 0, 1,
-0.7561203, 1.553666, -0.1819649, 0.7294118, 1, 0, 1,
-0.7455264, 0.1312858, -0.82068, 0.7215686, 1, 0, 1,
-0.7448779, -1.249546, -4.752472, 0.7176471, 1, 0, 1,
-0.7433212, -0.4758341, -0.8337197, 0.7098039, 1, 0, 1,
-0.7416174, -0.653908, -2.942837, 0.7058824, 1, 0, 1,
-0.7345374, 1.707494, -0.2398663, 0.6980392, 1, 0, 1,
-0.7343899, -1.078035, -3.242734, 0.6901961, 1, 0, 1,
-0.7307981, 1.082687, 0.2424423, 0.6862745, 1, 0, 1,
-0.725469, -0.5447176, -2.86092, 0.6784314, 1, 0, 1,
-0.7235784, 1.275695, 0.9220386, 0.6745098, 1, 0, 1,
-0.7216678, -1.614014, -2.365537, 0.6666667, 1, 0, 1,
-0.7204478, -0.2740578, -2.307942, 0.6627451, 1, 0, 1,
-0.7188284, -1.659234, -2.763106, 0.654902, 1, 0, 1,
-0.7154267, -0.7054683, -1.912862, 0.6509804, 1, 0, 1,
-0.7027428, 0.1710184, -0.9878672, 0.6431373, 1, 0, 1,
-0.7015941, 0.08734976, -2.008096, 0.6392157, 1, 0, 1,
-0.6990758, -1.132252, -2.325142, 0.6313726, 1, 0, 1,
-0.6978122, 0.007742027, -1.71541, 0.627451, 1, 0, 1,
-0.6967902, 0.3830092, -2.257753, 0.6196079, 1, 0, 1,
-0.6967545, -0.2748308, -3.73759, 0.6156863, 1, 0, 1,
-0.695631, -0.7704527, -4.304187, 0.6078432, 1, 0, 1,
-0.6859107, -0.3339532, -1.360514, 0.6039216, 1, 0, 1,
-0.6846411, -0.9853271, -2.364296, 0.5960785, 1, 0, 1,
-0.6817452, 0.4437557, -0.2627403, 0.5882353, 1, 0, 1,
-0.6815441, 1.700166, -0.569456, 0.5843138, 1, 0, 1,
-0.6793343, -0.7185, -3.443471, 0.5764706, 1, 0, 1,
-0.6762878, -0.2468937, -3.26624, 0.572549, 1, 0, 1,
-0.6756735, -1.106532, -2.558522, 0.5647059, 1, 0, 1,
-0.6704023, 0.1173822, -2.311391, 0.5607843, 1, 0, 1,
-0.6690025, -0.7839718, -2.930316, 0.5529412, 1, 0, 1,
-0.6665304, 0.09708836, -2.603844, 0.5490196, 1, 0, 1,
-0.6640174, -0.5103694, -1.045767, 0.5411765, 1, 0, 1,
-0.6628566, 0.2734824, -1.926369, 0.5372549, 1, 0, 1,
-0.6614221, -0.3118489, -0.9880895, 0.5294118, 1, 0, 1,
-0.6595081, -0.4866059, -2.048511, 0.5254902, 1, 0, 1,
-0.6538785, -1.69444, -2.317773, 0.5176471, 1, 0, 1,
-0.6529502, 0.2236426, -0.9193838, 0.5137255, 1, 0, 1,
-0.6519014, 1.30987, -1.224133, 0.5058824, 1, 0, 1,
-0.6461678, 3.54835, -0.3891895, 0.5019608, 1, 0, 1,
-0.6427423, 1.784346, 0.2648537, 0.4941176, 1, 0, 1,
-0.6421059, 1.174695, -0.271546, 0.4862745, 1, 0, 1,
-0.6420851, -1.838181, -2.706619, 0.4823529, 1, 0, 1,
-0.6400241, 0.3467253, -2.208305, 0.4745098, 1, 0, 1,
-0.6400149, 0.7346236, -0.8590335, 0.4705882, 1, 0, 1,
-0.6398377, -0.4810784, -3.488742, 0.4627451, 1, 0, 1,
-0.636026, -0.5186942, -2.952647, 0.4588235, 1, 0, 1,
-0.6265534, -0.9923414, -2.819548, 0.4509804, 1, 0, 1,
-0.6219829, 0.3472683, -1.129175, 0.4470588, 1, 0, 1,
-0.6080111, -1.057433, -2.345158, 0.4392157, 1, 0, 1,
-0.6015266, 0.6120679, -1.704678, 0.4352941, 1, 0, 1,
-0.5998242, 1.495673, -0.009334398, 0.427451, 1, 0, 1,
-0.595925, 0.9998196, -0.3796604, 0.4235294, 1, 0, 1,
-0.5937718, -0.267414, -1.12197, 0.4156863, 1, 0, 1,
-0.5925881, 1.127258, -0.1537935, 0.4117647, 1, 0, 1,
-0.5889416, 0.7071183, -0.1917727, 0.4039216, 1, 0, 1,
-0.5855807, -1.208247, -2.994389, 0.3960784, 1, 0, 1,
-0.5846536, 0.2552691, -1.343177, 0.3921569, 1, 0, 1,
-0.5807064, 0.1001157, 0.323889, 0.3843137, 1, 0, 1,
-0.577171, -0.1177544, -0.5306596, 0.3803922, 1, 0, 1,
-0.5764773, -0.06080325, -1.41364, 0.372549, 1, 0, 1,
-0.5699522, -1.85805, -2.110658, 0.3686275, 1, 0, 1,
-0.5670785, -0.5748417, -0.9448149, 0.3607843, 1, 0, 1,
-0.5669844, -0.9769596, -3.320337, 0.3568628, 1, 0, 1,
-0.5666033, 0.4790935, 0.162814, 0.3490196, 1, 0, 1,
-0.5606892, -0.1187906, -2.824243, 0.345098, 1, 0, 1,
-0.5565404, -1.177346, -2.650451, 0.3372549, 1, 0, 1,
-0.5544801, -0.1041842, -0.7394962, 0.3333333, 1, 0, 1,
-0.5498344, 0.2471965, -1.075742, 0.3254902, 1, 0, 1,
-0.5490085, -2.143248, -2.14713, 0.3215686, 1, 0, 1,
-0.547901, -0.6022214, -1.292269, 0.3137255, 1, 0, 1,
-0.5449053, 1.175233, -1.341547, 0.3098039, 1, 0, 1,
-0.5420336, -0.9406807, -2.979307, 0.3019608, 1, 0, 1,
-0.5398111, -0.09243576, -2.348401, 0.2941177, 1, 0, 1,
-0.5383626, 0.9964886, 0.4268826, 0.2901961, 1, 0, 1,
-0.5374123, 0.8731865, -0.6520211, 0.282353, 1, 0, 1,
-0.5324965, -0.1770605, -2.661552, 0.2784314, 1, 0, 1,
-0.5316555, 1.952323, 0.3846298, 0.2705882, 1, 0, 1,
-0.5312471, 0.2169449, -0.6508999, 0.2666667, 1, 0, 1,
-0.5309536, 0.2334113, 0.1490996, 0.2588235, 1, 0, 1,
-0.5307035, 0.3017613, -1.442373, 0.254902, 1, 0, 1,
-0.530473, 0.7406241, 0.003336739, 0.2470588, 1, 0, 1,
-0.5273804, -0.497274, -1.897792, 0.2431373, 1, 0, 1,
-0.5248759, 0.2170419, -1.096652, 0.2352941, 1, 0, 1,
-0.5197403, 0.1655065, -0.6667779, 0.2313726, 1, 0, 1,
-0.5180359, 2.16479, -0.4963789, 0.2235294, 1, 0, 1,
-0.5169517, -0.3359712, -3.992764, 0.2196078, 1, 0, 1,
-0.5137207, 0.2569111, -1.077236, 0.2117647, 1, 0, 1,
-0.5061263, 0.3927428, -1.639884, 0.2078431, 1, 0, 1,
-0.5041571, 0.9962632, -1.682722, 0.2, 1, 0, 1,
-0.5011533, -0.40782, -0.1211632, 0.1921569, 1, 0, 1,
-0.5005863, 0.877414, 1.121265, 0.1882353, 1, 0, 1,
-0.497738, -1.320315, -1.61177, 0.1803922, 1, 0, 1,
-0.4973559, 0.3035381, -2.464342, 0.1764706, 1, 0, 1,
-0.4972414, -0.4167458, -3.32511, 0.1686275, 1, 0, 1,
-0.496296, 0.4619112, -1.097072, 0.1647059, 1, 0, 1,
-0.487147, -1.266225, -2.994051, 0.1568628, 1, 0, 1,
-0.4859389, -0.9080086, -1.782146, 0.1529412, 1, 0, 1,
-0.4819916, -0.9429402, -2.50448, 0.145098, 1, 0, 1,
-0.4788488, 0.2908023, -1.388753, 0.1411765, 1, 0, 1,
-0.4772326, -0.4845134, -1.333528, 0.1333333, 1, 0, 1,
-0.4746915, 0.07235205, -2.227777, 0.1294118, 1, 0, 1,
-0.4711685, 0.580143, -0.03093206, 0.1215686, 1, 0, 1,
-0.4705876, 0.7776251, -0.1657533, 0.1176471, 1, 0, 1,
-0.4685876, -0.3768711, -2.319514, 0.1098039, 1, 0, 1,
-0.4674268, -0.6523975, -2.12384, 0.1058824, 1, 0, 1,
-0.4585053, 1.000322, -1.689208, 0.09803922, 1, 0, 1,
-0.4574064, -0.4697142, -3.870175, 0.09019608, 1, 0, 1,
-0.4571035, 0.004033514, -2.244378, 0.08627451, 1, 0, 1,
-0.4562154, 1.415387, 0.4699263, 0.07843138, 1, 0, 1,
-0.4523658, 0.2994883, -2.359535, 0.07450981, 1, 0, 1,
-0.4519037, 0.4231649, -1.85072, 0.06666667, 1, 0, 1,
-0.4450416, 1.136852, 0.1033279, 0.0627451, 1, 0, 1,
-0.4411556, -1.512812, -2.783192, 0.05490196, 1, 0, 1,
-0.4402821, 1.523486, -1.666882, 0.05098039, 1, 0, 1,
-0.4366089, -0.5559301, -2.694719, 0.04313726, 1, 0, 1,
-0.4318238, -0.276048, -2.049813, 0.03921569, 1, 0, 1,
-0.4317163, 0.2313076, -3.691721, 0.03137255, 1, 0, 1,
-0.4274721, 0.9629769, -0.2432856, 0.02745098, 1, 0, 1,
-0.4267414, 0.1497623, -2.138335, 0.01960784, 1, 0, 1,
-0.4208387, -1.285451, -2.276135, 0.01568628, 1, 0, 1,
-0.4191047, 0.626751, 0.8118483, 0.007843138, 1, 0, 1,
-0.4175088, -0.2439836, -2.964909, 0.003921569, 1, 0, 1,
-0.4130456, 0.6883329, -1.755884, 0, 1, 0.003921569, 1,
-0.4129151, -0.6686208, -2.943021, 0, 1, 0.01176471, 1,
-0.4124258, 1.057919, -1.523803, 0, 1, 0.01568628, 1,
-0.4105658, 3.506097, 0.02997768, 0, 1, 0.02352941, 1,
-0.4071337, -0.493751, -2.045135, 0, 1, 0.02745098, 1,
-0.403069, 2.111599, -1.917465, 0, 1, 0.03529412, 1,
-0.395702, -1.085843, -1.588425, 0, 1, 0.03921569, 1,
-0.3894221, -0.2125397, -2.741543, 0, 1, 0.04705882, 1,
-0.3845531, 0.6814274, -0.2230298, 0, 1, 0.05098039, 1,
-0.3789494, 2.375213, 0.7560696, 0, 1, 0.05882353, 1,
-0.3767014, -1.438559, -4.229965, 0, 1, 0.0627451, 1,
-0.3749872, -0.2316321, -5.112771, 0, 1, 0.07058824, 1,
-0.3705257, 0.1860659, -0.465542, 0, 1, 0.07450981, 1,
-0.3701278, 0.09136208, -2.94877, 0, 1, 0.08235294, 1,
-0.367755, -1.329628, -3.360634, 0, 1, 0.08627451, 1,
-0.3599728, -1.948384, -3.478914, 0, 1, 0.09411765, 1,
-0.3585251, 0.3586753, -2.03812, 0, 1, 0.1019608, 1,
-0.3551571, -0.8005345, -3.711122, 0, 1, 0.1058824, 1,
-0.3544856, 0.1560219, -1.501906, 0, 1, 0.1137255, 1,
-0.3526074, -2.26227, -4.434594, 0, 1, 0.1176471, 1,
-0.345329, 0.5479258, -0.1276445, 0, 1, 0.1254902, 1,
-0.3435544, -0.7998036, -0.7672852, 0, 1, 0.1294118, 1,
-0.3428195, -0.9557126, -2.99255, 0, 1, 0.1372549, 1,
-0.3425035, 0.1525871, -0.03854371, 0, 1, 0.1411765, 1,
-0.3371125, -1.07553, -2.532685, 0, 1, 0.1490196, 1,
-0.3321642, 0.01031507, -0.6486362, 0, 1, 0.1529412, 1,
-0.3319535, 1.164794, 0.8868017, 0, 1, 0.1607843, 1,
-0.3298275, -0.7609218, -3.912943, 0, 1, 0.1647059, 1,
-0.3274181, 0.7027594, -0.9770317, 0, 1, 0.172549, 1,
-0.3247971, 0.7712764, -0.4711947, 0, 1, 0.1764706, 1,
-0.3153263, -0.3335541, -1.162177, 0, 1, 0.1843137, 1,
-0.3140809, 0.1777489, -1.841657, 0, 1, 0.1882353, 1,
-0.3060705, 0.8262284, -0.0909213, 0, 1, 0.1960784, 1,
-0.3058679, -0.3231249, -0.8562469, 0, 1, 0.2039216, 1,
-0.3057391, 0.8577197, 0.107532, 0, 1, 0.2078431, 1,
-0.2973334, -0.05758727, -0.481528, 0, 1, 0.2156863, 1,
-0.2940015, 0.5449315, -2.365274, 0, 1, 0.2196078, 1,
-0.2939987, -2.718132, -2.915618, 0, 1, 0.227451, 1,
-0.2916264, -0.2807213, -4.093478, 0, 1, 0.2313726, 1,
-0.2887074, 1.306489, 1.214335, 0, 1, 0.2392157, 1,
-0.2851199, -0.3106838, -2.086682, 0, 1, 0.2431373, 1,
-0.2844316, -0.6169589, -2.56948, 0, 1, 0.2509804, 1,
-0.2825388, 0.0753537, -0.2172855, 0, 1, 0.254902, 1,
-0.2821925, 0.6381301, 0.6009248, 0, 1, 0.2627451, 1,
-0.2794592, -0.8216569, -3.897639, 0, 1, 0.2666667, 1,
-0.2739803, -0.3456799, -3.231916, 0, 1, 0.2745098, 1,
-0.2721982, -0.952415, -2.023596, 0, 1, 0.2784314, 1,
-0.2702552, 0.07416898, -2.877404, 0, 1, 0.2862745, 1,
-0.266693, -0.3878012, -1.3563, 0, 1, 0.2901961, 1,
-0.2633668, -0.05277874, -0.7084484, 0, 1, 0.2980392, 1,
-0.2630237, -0.4927018, -1.375482, 0, 1, 0.3058824, 1,
-0.2628807, -0.3035103, -3.702857, 0, 1, 0.3098039, 1,
-0.2619107, -0.6135201, -3.227324, 0, 1, 0.3176471, 1,
-0.2546584, 0.8485813, -0.8006611, 0, 1, 0.3215686, 1,
-0.2542469, -1.261967, -2.833392, 0, 1, 0.3294118, 1,
-0.2486552, 1.242212, -1.078256, 0, 1, 0.3333333, 1,
-0.2469337, -0.9798046, -3.690991, 0, 1, 0.3411765, 1,
-0.2386403, -0.3903208, -2.30288, 0, 1, 0.345098, 1,
-0.2353088, -1.234566, -1.225236, 0, 1, 0.3529412, 1,
-0.2348666, 1.214434, -1.205243, 0, 1, 0.3568628, 1,
-0.2327019, 0.3979075, -0.1130087, 0, 1, 0.3647059, 1,
-0.2311969, -1.298698, -2.802591, 0, 1, 0.3686275, 1,
-0.226728, 1.085686, 0.3372095, 0, 1, 0.3764706, 1,
-0.2223404, -0.6715267, -5.010603, 0, 1, 0.3803922, 1,
-0.2169009, 1.030774, 0.1861219, 0, 1, 0.3882353, 1,
-0.2143836, 0.9426106, -1.832348, 0, 1, 0.3921569, 1,
-0.2129573, -0.7029915, -3.589811, 0, 1, 0.4, 1,
-0.2106337, 2.298839, 1.025108, 0, 1, 0.4078431, 1,
-0.2098635, -0.2146329, -0.3989521, 0, 1, 0.4117647, 1,
-0.2087675, -0.8728878, -2.732465, 0, 1, 0.4196078, 1,
-0.2086492, -1.475348, -3.700107, 0, 1, 0.4235294, 1,
-0.2074237, 1.247995, 1.917345, 0, 1, 0.4313726, 1,
-0.2067725, -0.1875607, -2.807952, 0, 1, 0.4352941, 1,
-0.2057874, 1.963142, -1.723675, 0, 1, 0.4431373, 1,
-0.1993545, -0.2481055, -1.222859, 0, 1, 0.4470588, 1,
-0.1958297, 0.3619372, -1.284773, 0, 1, 0.454902, 1,
-0.1918969, 0.7405409, 0.6883855, 0, 1, 0.4588235, 1,
-0.1892796, 0.5795735, 0.5355201, 0, 1, 0.4666667, 1,
-0.1888235, 0.1305115, -0.4259977, 0, 1, 0.4705882, 1,
-0.1873037, 0.6020813, -1.414734, 0, 1, 0.4784314, 1,
-0.1808451, -0.8819269, -4.333758, 0, 1, 0.4823529, 1,
-0.1800588, -0.6009508, -2.637606, 0, 1, 0.4901961, 1,
-0.1798951, 0.6118031, -0.3572401, 0, 1, 0.4941176, 1,
-0.1794893, 0.3566689, -2.715509, 0, 1, 0.5019608, 1,
-0.1761074, 0.479729, -1.916898, 0, 1, 0.509804, 1,
-0.1705502, -0.1597446, -2.000882, 0, 1, 0.5137255, 1,
-0.1694357, -0.1177856, -2.047611, 0, 1, 0.5215687, 1,
-0.1655972, 0.381333, 0.1122438, 0, 1, 0.5254902, 1,
-0.1633843, -1.125555, -4.85927, 0, 1, 0.5333334, 1,
-0.1563712, 0.0191324, -1.113698, 0, 1, 0.5372549, 1,
-0.1528305, -0.5175295, -1.09042, 0, 1, 0.5450981, 1,
-0.1519385, 0.05495121, -1.562922, 0, 1, 0.5490196, 1,
-0.1505932, 0.9647104, 0.2562602, 0, 1, 0.5568628, 1,
-0.1481464, 1.529686, -0.6792631, 0, 1, 0.5607843, 1,
-0.1478955, -0.1063558, -2.807338, 0, 1, 0.5686275, 1,
-0.1427569, -1.476644, -3.855458, 0, 1, 0.572549, 1,
-0.1321398, -0.5052583, -2.928804, 0, 1, 0.5803922, 1,
-0.1308685, 0.5366595, 1.64601, 0, 1, 0.5843138, 1,
-0.1212909, -0.2092337, -1.585995, 0, 1, 0.5921569, 1,
-0.1210463, 0.843564, -0.7596306, 0, 1, 0.5960785, 1,
-0.1130367, 1.292056, -0.1924912, 0, 1, 0.6039216, 1,
-0.1119341, -0.6179436, -2.843075, 0, 1, 0.6117647, 1,
-0.1096811, 1.106034, -1.89804, 0, 1, 0.6156863, 1,
-0.1084326, 0.5373955, -0.5404656, 0, 1, 0.6235294, 1,
-0.1056673, -0.8692583, -2.94247, 0, 1, 0.627451, 1,
-0.1049083, -0.8754691, -2.028687, 0, 1, 0.6352941, 1,
-0.1048972, 1.389279, -0.9184459, 0, 1, 0.6392157, 1,
-0.1031804, -0.06312622, -1.583905, 0, 1, 0.6470588, 1,
-0.1031069, -1.158427, -2.60567, 0, 1, 0.6509804, 1,
-0.09410392, -0.299327, -4.108484, 0, 1, 0.6588235, 1,
-0.08751412, 1.12568, 0.9217954, 0, 1, 0.6627451, 1,
-0.08586283, 0.09509286, -2.316931, 0, 1, 0.6705883, 1,
-0.08370955, 0.4707224, 1.173686, 0, 1, 0.6745098, 1,
-0.07474656, 1.005304, -1.34697, 0, 1, 0.682353, 1,
-0.07315277, 0.08208733, -1.791837, 0, 1, 0.6862745, 1,
-0.07291707, 2.843368, 0.5376962, 0, 1, 0.6941177, 1,
-0.07225211, 0.7467678, 1.428181, 0, 1, 0.7019608, 1,
-0.07190522, -0.3488555, -3.343927, 0, 1, 0.7058824, 1,
-0.07154141, -0.1286587, -2.608872, 0, 1, 0.7137255, 1,
-0.06926274, -0.9065295, -2.12248, 0, 1, 0.7176471, 1,
-0.06607508, 0.2224779, 1.40681, 0, 1, 0.7254902, 1,
-0.06554426, 0.1504278, -0.5787276, 0, 1, 0.7294118, 1,
-0.0573666, -0.3633013, -4.396367, 0, 1, 0.7372549, 1,
-0.05179144, -0.4497307, -2.658742, 0, 1, 0.7411765, 1,
-0.05151143, -0.945705, -2.422932, 0, 1, 0.7490196, 1,
-0.05045528, -0.9353166, -2.635219, 0, 1, 0.7529412, 1,
-0.0484598, 0.4538598, 0.183398, 0, 1, 0.7607843, 1,
-0.04625452, 0.8787802, 0.3111776, 0, 1, 0.7647059, 1,
-0.0390413, -0.7637222, -3.777872, 0, 1, 0.772549, 1,
-0.03825769, -1.867945, -3.378747, 0, 1, 0.7764706, 1,
-0.03762678, -0.7055953, -4.165098, 0, 1, 0.7843137, 1,
-0.03613929, 0.7662807, 0.3688959, 0, 1, 0.7882353, 1,
-0.03552093, 0.4124286, 0.435673, 0, 1, 0.7960784, 1,
-0.0320164, 0.621212, 1.378242, 0, 1, 0.8039216, 1,
-0.02622169, -0.2848397, -3.942338, 0, 1, 0.8078431, 1,
-0.02540826, -0.02233877, -2.327998, 0, 1, 0.8156863, 1,
-0.02024497, 0.5584972, 0.31048, 0, 1, 0.8196079, 1,
-0.01978286, 0.2552697, 0.02423945, 0, 1, 0.827451, 1,
-0.017783, -0.7426839, -2.33553, 0, 1, 0.8313726, 1,
-0.01630701, 0.040221, -0.4146066, 0, 1, 0.8392157, 1,
-0.01499367, 1.703598, -0.2182784, 0, 1, 0.8431373, 1,
-0.01474832, -0.1246199, -4.7545, 0, 1, 0.8509804, 1,
-0.01440943, 1.037129, -0.4820003, 0, 1, 0.854902, 1,
-0.01170741, -0.1589916, -0.2187445, 0, 1, 0.8627451, 1,
-0.01056349, 0.2076005, -0.9384371, 0, 1, 0.8666667, 1,
-0.01028016, -0.5633695, -5.343852, 0, 1, 0.8745098, 1,
-0.006899646, 0.02939672, -0.04154758, 0, 1, 0.8784314, 1,
-0.00351362, -0.1044487, -4.344729, 0, 1, 0.8862745, 1,
0.004551609, 1.241095, -1.271495, 0, 1, 0.8901961, 1,
0.005094169, -0.1266906, 2.825506, 0, 1, 0.8980392, 1,
0.007131612, 1.31454, -1.011662, 0, 1, 0.9058824, 1,
0.008628487, -0.1377712, 3.287825, 0, 1, 0.9098039, 1,
0.009408153, -0.5411171, 3.907666, 0, 1, 0.9176471, 1,
0.01032694, 0.7200706, -0.3010468, 0, 1, 0.9215686, 1,
0.01281713, -1.072128, 3.728231, 0, 1, 0.9294118, 1,
0.01579446, 2.418463, -0.0382633, 0, 1, 0.9333333, 1,
0.01582411, 0.7931013, -0.3807374, 0, 1, 0.9411765, 1,
0.01722719, 1.518264, 0.318953, 0, 1, 0.945098, 1,
0.01744264, -0.07703567, 2.523263, 0, 1, 0.9529412, 1,
0.0181222, 1.010476, -0.2762845, 0, 1, 0.9568627, 1,
0.01951995, 1.593378, 0.204442, 0, 1, 0.9647059, 1,
0.02283807, -1.195277, 4.43353, 0, 1, 0.9686275, 1,
0.0255272, -0.5646362, 3.520767, 0, 1, 0.9764706, 1,
0.02916655, 0.7930139, -0.9699439, 0, 1, 0.9803922, 1,
0.03080165, -3.443726, 3.601366, 0, 1, 0.9882353, 1,
0.03440481, -0.03326285, 2.828391, 0, 1, 0.9921569, 1,
0.03492, 0.1486496, 1.51077, 0, 1, 1, 1,
0.03705544, -0.3260819, 1.890062, 0, 0.9921569, 1, 1,
0.04066604, -0.7728649, 3.275857, 0, 0.9882353, 1, 1,
0.04413999, -0.5508822, 2.433855, 0, 0.9803922, 1, 1,
0.05119037, 0.2799458, -1.264921, 0, 0.9764706, 1, 1,
0.05270331, -0.2209615, 2.399363, 0, 0.9686275, 1, 1,
0.05318232, -0.3366425, 2.906504, 0, 0.9647059, 1, 1,
0.06078784, 0.7569155, 0.397681, 0, 0.9568627, 1, 1,
0.06734931, 0.2751647, -1.076104, 0, 0.9529412, 1, 1,
0.06950267, 0.2190087, 0.3427992, 0, 0.945098, 1, 1,
0.07415885, 0.1228007, 1.344886, 0, 0.9411765, 1, 1,
0.07544415, 0.3563755, 0.9882984, 0, 0.9333333, 1, 1,
0.07792891, 0.8762673, -1.926129, 0, 0.9294118, 1, 1,
0.07940607, -0.5834606, 4.167946, 0, 0.9215686, 1, 1,
0.08522853, -1.071083, 1.978739, 0, 0.9176471, 1, 1,
0.08546408, 0.473221, -0.3875477, 0, 0.9098039, 1, 1,
0.08948519, -0.4130834, 3.507185, 0, 0.9058824, 1, 1,
0.08974586, 1.040364, -0.1551592, 0, 0.8980392, 1, 1,
0.0902871, 1.340331, 1.094828, 0, 0.8901961, 1, 1,
0.09594475, 0.2450519, -1.802676, 0, 0.8862745, 1, 1,
0.09611849, -1.224179, 3.317534, 0, 0.8784314, 1, 1,
0.1029179, -0.4860912, 3.422559, 0, 0.8745098, 1, 1,
0.1044704, 0.730393, 0.9669994, 0, 0.8666667, 1, 1,
0.1046308, 0.2633717, 0.7038216, 0, 0.8627451, 1, 1,
0.1066447, -0.2922245, 2.812149, 0, 0.854902, 1, 1,
0.1111986, -0.9405417, 3.833293, 0, 0.8509804, 1, 1,
0.1112648, 1.666568, 1.294755, 0, 0.8431373, 1, 1,
0.1129045, 1.983875, 0.5351435, 0, 0.8392157, 1, 1,
0.1140466, 1.521668, -0.9375684, 0, 0.8313726, 1, 1,
0.1140984, -0.6826569, 2.160062, 0, 0.827451, 1, 1,
0.1141023, 0.8581996, -0.8505678, 0, 0.8196079, 1, 1,
0.1189844, 0.5739343, 0.6398819, 0, 0.8156863, 1, 1,
0.1205171, -1.251031, 2.909956, 0, 0.8078431, 1, 1,
0.1302075, 0.09898642, 0.8437825, 0, 0.8039216, 1, 1,
0.131572, 0.1677349, 0.4616079, 0, 0.7960784, 1, 1,
0.1333369, -2.280002, 2.878096, 0, 0.7882353, 1, 1,
0.1385326, -0.5415741, 2.211207, 0, 0.7843137, 1, 1,
0.1389583, -0.6408531, 4.635235, 0, 0.7764706, 1, 1,
0.1395717, -1.102897, 3.732799, 0, 0.772549, 1, 1,
0.1406392, 1.470046, 0.8795764, 0, 0.7647059, 1, 1,
0.1430931, -2.01758, 3.569375, 0, 0.7607843, 1, 1,
0.1435535, 0.9679918, 0.6438094, 0, 0.7529412, 1, 1,
0.1441586, -1.320433, 4.370285, 0, 0.7490196, 1, 1,
0.1450031, 0.0530428, 1.425829, 0, 0.7411765, 1, 1,
0.145097, -0.9842756, 2.348758, 0, 0.7372549, 1, 1,
0.1485639, -2.19013, 3.143735, 0, 0.7294118, 1, 1,
0.1493314, -0.3954295, 1.711972, 0, 0.7254902, 1, 1,
0.1503669, -0.01760768, 4.228778, 0, 0.7176471, 1, 1,
0.1504295, 1.191842, -0.4870897, 0, 0.7137255, 1, 1,
0.1512895, -1.065725, 2.784201, 0, 0.7058824, 1, 1,
0.1522162, 1.590135, 0.5831353, 0, 0.6980392, 1, 1,
0.1533406, 0.7498613, -0.9357165, 0, 0.6941177, 1, 1,
0.153439, 0.8461587, -0.2002014, 0, 0.6862745, 1, 1,
0.1588803, 0.5773528, -0.6931865, 0, 0.682353, 1, 1,
0.1598682, -0.3964023, 2.487136, 0, 0.6745098, 1, 1,
0.1621764, -0.2714864, 2.954271, 0, 0.6705883, 1, 1,
0.1640429, -1.746227, 3.844326, 0, 0.6627451, 1, 1,
0.1742719, 1.325972, -1.033947, 0, 0.6588235, 1, 1,
0.1777326, -0.2807525, 4.362072, 0, 0.6509804, 1, 1,
0.1801303, 2.205169, 0.2405122, 0, 0.6470588, 1, 1,
0.180478, -2.162625, 4.965446, 0, 0.6392157, 1, 1,
0.1818909, -0.4343791, 3.692046, 0, 0.6352941, 1, 1,
0.1829999, -0.08346745, 2.271171, 0, 0.627451, 1, 1,
0.1837925, -0.5804756, 3.150385, 0, 0.6235294, 1, 1,
0.1852788, -1.221968, 3.856396, 0, 0.6156863, 1, 1,
0.1888778, 1.805843, -1.059845, 0, 0.6117647, 1, 1,
0.1943633, -1.57699, 3.560425, 0, 0.6039216, 1, 1,
0.1970339, -0.1703779, -0.08528702, 0, 0.5960785, 1, 1,
0.1975848, -0.1735616, 0.6779683, 0, 0.5921569, 1, 1,
0.2019367, 1.01562, 0.02367236, 0, 0.5843138, 1, 1,
0.2020892, 1.078495, -1.400689, 0, 0.5803922, 1, 1,
0.2027835, -0.3476136, 2.99922, 0, 0.572549, 1, 1,
0.2064143, -0.1575764, 2.763932, 0, 0.5686275, 1, 1,
0.2072472, -0.5119479, 1.731617, 0, 0.5607843, 1, 1,
0.2085302, 0.1337262, 1.291489, 0, 0.5568628, 1, 1,
0.2110312, 1.018059, 0.8716961, 0, 0.5490196, 1, 1,
0.2113873, -1.151812, 2.778859, 0, 0.5450981, 1, 1,
0.2120009, -1.295729, 3.355207, 0, 0.5372549, 1, 1,
0.213844, 0.5220814, 0.9844573, 0, 0.5333334, 1, 1,
0.2151752, -1.141155, 2.274728, 0, 0.5254902, 1, 1,
0.2191007, 1.102329, -0.05751039, 0, 0.5215687, 1, 1,
0.2242676, -1.512003, 2.808866, 0, 0.5137255, 1, 1,
0.2272515, 0.3277911, 0.6616558, 0, 0.509804, 1, 1,
0.2276315, 1.05761, 1.437445, 0, 0.5019608, 1, 1,
0.2291194, -0.09474038, 2.590312, 0, 0.4941176, 1, 1,
0.2328253, 0.5006618, -0.1559756, 0, 0.4901961, 1, 1,
0.2360879, 0.08077892, 1.554268, 0, 0.4823529, 1, 1,
0.2363597, 1.165376, -2.004394, 0, 0.4784314, 1, 1,
0.2368945, -1.639181, 4.394898, 0, 0.4705882, 1, 1,
0.2423305, 1.912782, 0.1899669, 0, 0.4666667, 1, 1,
0.2438957, 0.8034556, 2.194111, 0, 0.4588235, 1, 1,
0.2470857, -1.470622, 4.77699, 0, 0.454902, 1, 1,
0.2620895, -0.9097423, 1.788021, 0, 0.4470588, 1, 1,
0.2625661, -0.1605702, 1.242517, 0, 0.4431373, 1, 1,
0.2628712, 0.4274958, 1.373734, 0, 0.4352941, 1, 1,
0.2641103, -0.8497099, 2.751134, 0, 0.4313726, 1, 1,
0.2645449, -0.1549178, 1.46142, 0, 0.4235294, 1, 1,
0.2710308, 0.4601603, 2.124345, 0, 0.4196078, 1, 1,
0.2715281, 0.1549611, 2.003241, 0, 0.4117647, 1, 1,
0.2738578, 0.6565875, 0.3540928, 0, 0.4078431, 1, 1,
0.2784752, -1.953503, 3.109914, 0, 0.4, 1, 1,
0.2823642, -0.4080969, 1.510896, 0, 0.3921569, 1, 1,
0.28265, 0.6951627, 0.4629214, 0, 0.3882353, 1, 1,
0.2839327, 0.1790604, 0.1819463, 0, 0.3803922, 1, 1,
0.2857947, 0.6071771, 2.678, 0, 0.3764706, 1, 1,
0.2872265, 0.9371732, -0.3274533, 0, 0.3686275, 1, 1,
0.2882927, 0.3672016, 0.5736117, 0, 0.3647059, 1, 1,
0.2919511, -0.549285, 2.910359, 0, 0.3568628, 1, 1,
0.2922614, 0.1532847, -1.104779, 0, 0.3529412, 1, 1,
0.3021141, 1.129373, 0.1291865, 0, 0.345098, 1, 1,
0.3041135, 0.5841659, 1.688994, 0, 0.3411765, 1, 1,
0.3054616, 0.8998996, 0.9619741, 0, 0.3333333, 1, 1,
0.3070107, 0.9244256, -0.6757187, 0, 0.3294118, 1, 1,
0.3105979, -0.01461097, 0.7971102, 0, 0.3215686, 1, 1,
0.3130627, 1.689435, 0.8234193, 0, 0.3176471, 1, 1,
0.3148304, 0.2603199, 0.3957941, 0, 0.3098039, 1, 1,
0.3148346, 0.8434101, 0.7390175, 0, 0.3058824, 1, 1,
0.3158445, 0.3129984, 1.640618, 0, 0.2980392, 1, 1,
0.3158672, 0.445749, 0.6157711, 0, 0.2901961, 1, 1,
0.3182828, -1.471461, 2.651959, 0, 0.2862745, 1, 1,
0.3212007, -0.4060554, 2.384548, 0, 0.2784314, 1, 1,
0.3319195, 1.139177, 0.705961, 0, 0.2745098, 1, 1,
0.3375466, 0.205538, 0.8280659, 0, 0.2666667, 1, 1,
0.3404502, -1.343767, 0.8700457, 0, 0.2627451, 1, 1,
0.3450983, 0.9854482, 1.31836, 0, 0.254902, 1, 1,
0.3512875, 1.370065, 0.2868484, 0, 0.2509804, 1, 1,
0.3553378, -1.053849, 2.159051, 0, 0.2431373, 1, 1,
0.3555445, 0.5659559, 0.8015954, 0, 0.2392157, 1, 1,
0.3568366, -0.3380927, 2.533765, 0, 0.2313726, 1, 1,
0.3570493, -2.199459, 3.044804, 0, 0.227451, 1, 1,
0.3588981, -0.3277291, 1.62638, 0, 0.2196078, 1, 1,
0.3604812, 0.2146415, 0.778406, 0, 0.2156863, 1, 1,
0.3609015, 0.4315212, 0.741545, 0, 0.2078431, 1, 1,
0.3624297, 1.603229, 0.3534834, 0, 0.2039216, 1, 1,
0.3652837, 1.092549, 0.1204721, 0, 0.1960784, 1, 1,
0.3656859, -1.134261, 3.80004, 0, 0.1882353, 1, 1,
0.3670705, 1.573843, 0.3029792, 0, 0.1843137, 1, 1,
0.3700757, -1.487221, 3.539175, 0, 0.1764706, 1, 1,
0.3746984, 0.240491, -0.3256226, 0, 0.172549, 1, 1,
0.3756668, -0.3709797, 2.121949, 0, 0.1647059, 1, 1,
0.3764803, -0.3296936, 1.878221, 0, 0.1607843, 1, 1,
0.37723, 0.4051642, 1.649865, 0, 0.1529412, 1, 1,
0.3772318, 1.676278, 0.7056791, 0, 0.1490196, 1, 1,
0.3781778, 0.1549683, 0.03884294, 0, 0.1411765, 1, 1,
0.3846862, 1.556342, 1.052569, 0, 0.1372549, 1, 1,
0.3883228, 0.4241885, 1.161663, 0, 0.1294118, 1, 1,
0.3887474, -1.783203, 2.268464, 0, 0.1254902, 1, 1,
0.389375, 1.369005, 0.1416259, 0, 0.1176471, 1, 1,
0.3915871, 1.152841, 0.4524893, 0, 0.1137255, 1, 1,
0.3916279, -2.091777, 3.4803, 0, 0.1058824, 1, 1,
0.3926864, -1.867017, 2.322113, 0, 0.09803922, 1, 1,
0.3940549, -1.505204, 0.9577366, 0, 0.09411765, 1, 1,
0.3946461, -0.6339041, 2.856056, 0, 0.08627451, 1, 1,
0.4016111, -1.368838, 3.978546, 0, 0.08235294, 1, 1,
0.4018096, 1.009913, -0.1938855, 0, 0.07450981, 1, 1,
0.4053136, -0.8954167, 2.254524, 0, 0.07058824, 1, 1,
0.4084307, -0.2625012, 3.425346, 0, 0.0627451, 1, 1,
0.4102498, 0.01428906, 1.676196, 0, 0.05882353, 1, 1,
0.413114, -1.344635, 1.316329, 0, 0.05098039, 1, 1,
0.4151064, -0.1333181, 1.920889, 0, 0.04705882, 1, 1,
0.4166949, -1.737822, 2.077329, 0, 0.03921569, 1, 1,
0.4168859, 0.1296424, 0.2473736, 0, 0.03529412, 1, 1,
0.4229143, 0.4797349, 0.2964816, 0, 0.02745098, 1, 1,
0.4250395, 0.6586709, 0.7238069, 0, 0.02352941, 1, 1,
0.4330588, -1.212932, 0.45286, 0, 0.01568628, 1, 1,
0.4332874, 1.294684, 0.1176681, 0, 0.01176471, 1, 1,
0.4436449, 0.07294708, 0.9968129, 0, 0.003921569, 1, 1,
0.4468002, 1.566042, 0.04407283, 0.003921569, 0, 1, 1,
0.4574247, -0.1754088, 0.4408841, 0.007843138, 0, 1, 1,
0.4580557, 0.2221044, 0.6966404, 0.01568628, 0, 1, 1,
0.4589838, 0.9871014, 1.018066, 0.01960784, 0, 1, 1,
0.4606871, 0.9334227, 0.8467805, 0.02745098, 0, 1, 1,
0.4617588, 1.286862, -0.9368598, 0.03137255, 0, 1, 1,
0.4637951, 1.313872, -0.4696557, 0.03921569, 0, 1, 1,
0.4638297, -0.9695516, 2.834515, 0.04313726, 0, 1, 1,
0.4668476, 1.480773, 0.4422959, 0.05098039, 0, 1, 1,
0.4768415, 1.527701, -1.457376, 0.05490196, 0, 1, 1,
0.4791805, -0.02889647, 0.736291, 0.0627451, 0, 1, 1,
0.4828383, 1.28044, -1.237625, 0.06666667, 0, 1, 1,
0.4849305, 0.6906393, 1.365114, 0.07450981, 0, 1, 1,
0.4891004, 1.47092, -1.433027, 0.07843138, 0, 1, 1,
0.4894333, 0.2665163, 0.43858, 0.08627451, 0, 1, 1,
0.4953923, -1.004557, 1.95832, 0.09019608, 0, 1, 1,
0.4973825, 2.366823, -0.9591708, 0.09803922, 0, 1, 1,
0.5019248, 0.8786001, 0.2621908, 0.1058824, 0, 1, 1,
0.5040327, -1.250029, 1.790324, 0.1098039, 0, 1, 1,
0.5055891, -0.04692436, 2.956546, 0.1176471, 0, 1, 1,
0.5073608, -0.7997065, 4.083083, 0.1215686, 0, 1, 1,
0.5112912, -1.077069, 2.371369, 0.1294118, 0, 1, 1,
0.514701, -1.340459, 1.731817, 0.1333333, 0, 1, 1,
0.5212908, 0.408709, 0.9794028, 0.1411765, 0, 1, 1,
0.5213926, 0.8837934, 0.8322515, 0.145098, 0, 1, 1,
0.5229859, -0.6804984, 1.964988, 0.1529412, 0, 1, 1,
0.526575, 1.415463, 0.01656122, 0.1568628, 0, 1, 1,
0.5271006, -0.5011209, 0.4944316, 0.1647059, 0, 1, 1,
0.5293934, -0.1423273, 2.50286, 0.1686275, 0, 1, 1,
0.5312884, 1.422841, 1.147929, 0.1764706, 0, 1, 1,
0.5321293, -2.341277, 3.426592, 0.1803922, 0, 1, 1,
0.5362294, -0.5608803, 2.081528, 0.1882353, 0, 1, 1,
0.5393752, 2.95452, -0.4675792, 0.1921569, 0, 1, 1,
0.5425482, 0.4707009, 0.8206351, 0.2, 0, 1, 1,
0.5445027, 1.266721, 2.845606, 0.2078431, 0, 1, 1,
0.5445103, -0.759625, 2.969439, 0.2117647, 0, 1, 1,
0.545872, 0.9596725, -0.2495825, 0.2196078, 0, 1, 1,
0.5512584, 0.2960034, 1.413922, 0.2235294, 0, 1, 1,
0.5513902, 1.211723, 0.5879918, 0.2313726, 0, 1, 1,
0.5531759, 0.2109614, 1.410831, 0.2352941, 0, 1, 1,
0.5577276, -1.029512, 3.693838, 0.2431373, 0, 1, 1,
0.5580401, 0.8153229, 0.6966917, 0.2470588, 0, 1, 1,
0.5625924, -0.1269892, 2.846553, 0.254902, 0, 1, 1,
0.5628687, 0.680357, -0.60787, 0.2588235, 0, 1, 1,
0.5684294, 1.622752, -0.245847, 0.2666667, 0, 1, 1,
0.5695114, 0.7792554, 0.7134656, 0.2705882, 0, 1, 1,
0.5718246, 1.688823, -0.9130225, 0.2784314, 0, 1, 1,
0.5742798, -0.005423955, 0.9546512, 0.282353, 0, 1, 1,
0.5755711, -0.8875853, 4.424258, 0.2901961, 0, 1, 1,
0.5769001, 0.2220855, 0.5974376, 0.2941177, 0, 1, 1,
0.5785131, -0.996938, 1.709651, 0.3019608, 0, 1, 1,
0.5796444, -1.012139, 1.959893, 0.3098039, 0, 1, 1,
0.5805186, -1.807716, 2.941808, 0.3137255, 0, 1, 1,
0.5833789, 0.1223323, 2.342299, 0.3215686, 0, 1, 1,
0.586103, 1.252986, 0.7256005, 0.3254902, 0, 1, 1,
0.5868074, -1.055373, 3.018067, 0.3333333, 0, 1, 1,
0.5911019, 0.02281048, -0.2502305, 0.3372549, 0, 1, 1,
0.5930945, -2.340021, 2.341989, 0.345098, 0, 1, 1,
0.5943595, -1.47705, 0.1323171, 0.3490196, 0, 1, 1,
0.5972485, -0.6198607, 3.453397, 0.3568628, 0, 1, 1,
0.6007609, 0.07289398, 2.438921, 0.3607843, 0, 1, 1,
0.6049484, 1.906091, 1.535121, 0.3686275, 0, 1, 1,
0.610231, -0.563691, 2.55603, 0.372549, 0, 1, 1,
0.6130123, -0.2784552, 0.6820659, 0.3803922, 0, 1, 1,
0.6142763, -1.492435, 3.825029, 0.3843137, 0, 1, 1,
0.6157408, -0.09287728, 1.780721, 0.3921569, 0, 1, 1,
0.6164886, 0.935998, 1.278896, 0.3960784, 0, 1, 1,
0.61901, 0.4188155, 0.3048111, 0.4039216, 0, 1, 1,
0.6221291, 1.561399, -0.1955301, 0.4117647, 0, 1, 1,
0.6239982, -0.3334853, 0.6423051, 0.4156863, 0, 1, 1,
0.6270139, -0.3683499, 2.725717, 0.4235294, 0, 1, 1,
0.6278003, -0.2404515, 0.9366285, 0.427451, 0, 1, 1,
0.6285029, 0.39189, 0.5141153, 0.4352941, 0, 1, 1,
0.6335496, 0.1044197, 3.245929, 0.4392157, 0, 1, 1,
0.6399468, 0.03679764, 1.407439, 0.4470588, 0, 1, 1,
0.6403555, 0.3231166, 2.003791, 0.4509804, 0, 1, 1,
0.6481709, -1.517437, 2.780016, 0.4588235, 0, 1, 1,
0.6505512, 1.701213, 0.5424342, 0.4627451, 0, 1, 1,
0.651727, 1.410933, -0.3918231, 0.4705882, 0, 1, 1,
0.6592755, 1.996343, -0.1095818, 0.4745098, 0, 1, 1,
0.6631014, 1.571296, 1.221664, 0.4823529, 0, 1, 1,
0.6643252, 1.425767, -0.8418976, 0.4862745, 0, 1, 1,
0.6682859, 1.635053, -1.482188, 0.4941176, 0, 1, 1,
0.6700953, 0.6510504, 2.220363, 0.5019608, 0, 1, 1,
0.6703167, -1.0372, 2.970992, 0.5058824, 0, 1, 1,
0.6744965, 0.6294689, 1.809919, 0.5137255, 0, 1, 1,
0.674877, 0.7317189, -0.8433083, 0.5176471, 0, 1, 1,
0.6773996, -1.022056, 2.425896, 0.5254902, 0, 1, 1,
0.6872485, 0.8104758, -1.097969, 0.5294118, 0, 1, 1,
0.6919741, -1.139202, 2.122387, 0.5372549, 0, 1, 1,
0.6923845, -0.3002251, 2.491965, 0.5411765, 0, 1, 1,
0.6926395, 0.07793314, 0.4326074, 0.5490196, 0, 1, 1,
0.6955817, -0.1442503, 1.783196, 0.5529412, 0, 1, 1,
0.6955965, 1.05581, 0.3740587, 0.5607843, 0, 1, 1,
0.6974057, -0.2191059, 3.006851, 0.5647059, 0, 1, 1,
0.697867, 1.884192, 1.617288, 0.572549, 0, 1, 1,
0.6992635, -0.6504418, 2.3866, 0.5764706, 0, 1, 1,
0.7049407, -0.01602625, 0.7115123, 0.5843138, 0, 1, 1,
0.7062947, 0.3197939, 1.812598, 0.5882353, 0, 1, 1,
0.709692, -0.9383253, 1.996617, 0.5960785, 0, 1, 1,
0.7105373, -1.977157, 1.579739, 0.6039216, 0, 1, 1,
0.7143298, 0.4657204, 2.001796, 0.6078432, 0, 1, 1,
0.7145551, 0.2167384, 2.04487, 0.6156863, 0, 1, 1,
0.7151786, -0.8383698, 2.21306, 0.6196079, 0, 1, 1,
0.7173438, 0.4227442, 0.2874803, 0.627451, 0, 1, 1,
0.7209736, -3.42297, 2.01638, 0.6313726, 0, 1, 1,
0.72317, 0.4121886, 2.398516, 0.6392157, 0, 1, 1,
0.724341, -0.8699597, 2.100467, 0.6431373, 0, 1, 1,
0.7248846, 0.1610154, 1.264001, 0.6509804, 0, 1, 1,
0.7298123, -0.4064323, 0.8014244, 0.654902, 0, 1, 1,
0.7313143, -0.3926996, 2.438491, 0.6627451, 0, 1, 1,
0.7355218, 0.6125652, 1.53601, 0.6666667, 0, 1, 1,
0.7359368, 0.0893729, 0.9716486, 0.6745098, 0, 1, 1,
0.7397129, 0.8108944, 2.618506, 0.6784314, 0, 1, 1,
0.7411183, -0.3101453, 1.387748, 0.6862745, 0, 1, 1,
0.7418461, 1.114621, 1.064125, 0.6901961, 0, 1, 1,
0.7486485, -0.629742, 1.992856, 0.6980392, 0, 1, 1,
0.7536148, 0.5880942, 1.34165, 0.7058824, 0, 1, 1,
0.7557821, -0.7870661, 2.11975, 0.7098039, 0, 1, 1,
0.756299, -1.538941, 3.204714, 0.7176471, 0, 1, 1,
0.7656211, -0.2210352, 1.061752, 0.7215686, 0, 1, 1,
0.7838292, 0.7585604, 1.518471, 0.7294118, 0, 1, 1,
0.7848498, 0.3967265, 0.6785862, 0.7333333, 0, 1, 1,
0.7910764, 0.1444323, 1.935111, 0.7411765, 0, 1, 1,
0.7950987, 0.6432657, 1.515484, 0.7450981, 0, 1, 1,
0.7970569, 0.4686292, 1.43833, 0.7529412, 0, 1, 1,
0.7983845, 0.7733204, 0.5791901, 0.7568628, 0, 1, 1,
0.7986925, 0.4880607, 0.4463711, 0.7647059, 0, 1, 1,
0.8094376, 1.878799, -0.7695522, 0.7686275, 0, 1, 1,
0.809752, -0.4534297, 2.886951, 0.7764706, 0, 1, 1,
0.810474, 0.1732548, 0.5167543, 0.7803922, 0, 1, 1,
0.819407, -0.5108382, 1.963249, 0.7882353, 0, 1, 1,
0.8240098, -0.05579674, 1.869916, 0.7921569, 0, 1, 1,
0.8316369, 0.4923027, 1.774538, 0.8, 0, 1, 1,
0.8344254, 0.09269089, 1.915599, 0.8078431, 0, 1, 1,
0.8345476, -0.4612859, 2.841256, 0.8117647, 0, 1, 1,
0.8359844, 1.057607, 0.3618284, 0.8196079, 0, 1, 1,
0.8411475, 0.3220991, 1.411637, 0.8235294, 0, 1, 1,
0.8433947, 0.5950661, 1.543254, 0.8313726, 0, 1, 1,
0.8467904, -0.0416472, 0.5403708, 0.8352941, 0, 1, 1,
0.8504301, -0.09320901, 0.6355143, 0.8431373, 0, 1, 1,
0.8777844, 0.8354058, 1.808519, 0.8470588, 0, 1, 1,
0.8780767, 2.036041, 1.627467, 0.854902, 0, 1, 1,
0.8806106, -0.4476826, 2.217991, 0.8588235, 0, 1, 1,
0.883253, 0.7568454, 1.121617, 0.8666667, 0, 1, 1,
0.8846396, 0.4129174, 1.040658, 0.8705882, 0, 1, 1,
0.8852, 1.501531, -0.480231, 0.8784314, 0, 1, 1,
0.8895783, 0.1778689, 1.157287, 0.8823529, 0, 1, 1,
0.8910015, -1.239321, 1.625471, 0.8901961, 0, 1, 1,
0.8935502, -0.2026033, 3.158468, 0.8941177, 0, 1, 1,
0.895315, -0.6662082, 0.9369829, 0.9019608, 0, 1, 1,
0.9053634, 1.434097, -0.2462504, 0.9098039, 0, 1, 1,
0.9106606, -0.4212929, 1.211353, 0.9137255, 0, 1, 1,
0.9131073, -1.046671, 3.121711, 0.9215686, 0, 1, 1,
0.913312, 1.499079, -0.7327444, 0.9254902, 0, 1, 1,
0.9177309, 0.9318711, 0.5656539, 0.9333333, 0, 1, 1,
0.9204497, -0.7461778, 1.89309, 0.9372549, 0, 1, 1,
0.9216231, -0.878782, 2.655882, 0.945098, 0, 1, 1,
0.9248325, -1.282425, 2.523694, 0.9490196, 0, 1, 1,
0.931958, 1.916206, 0.3991276, 0.9568627, 0, 1, 1,
0.9368184, -0.3307743, 1.369962, 0.9607843, 0, 1, 1,
0.9370003, 1.276019, 0.7456368, 0.9686275, 0, 1, 1,
0.9415678, 0.7554064, 2.043375, 0.972549, 0, 1, 1,
0.9456545, -1.626859, 2.74461, 0.9803922, 0, 1, 1,
0.9607261, 0.1969693, 0.5897954, 0.9843137, 0, 1, 1,
0.9620891, 0.8210247, 0.02786431, 0.9921569, 0, 1, 1,
0.9689234, -0.8131869, 0.2296692, 0.9960784, 0, 1, 1,
0.9696964, 0.3098743, 0.02723846, 1, 0, 0.9960784, 1,
0.9740901, -0.4846466, 2.077916, 1, 0, 0.9882353, 1,
0.9751117, 0.4144377, 3.276374, 1, 0, 0.9843137, 1,
0.9753088, -0.7884802, 2.880259, 1, 0, 0.9764706, 1,
0.9802986, 1.609363, -1.955796, 1, 0, 0.972549, 1,
0.9805817, -1.62396, 3.013821, 1, 0, 0.9647059, 1,
0.9924565, 0.9940329, 0.5616303, 1, 0, 0.9607843, 1,
0.9950914, -0.6433841, 1.582298, 1, 0, 0.9529412, 1,
0.9978672, -1.709301, 3.424482, 1, 0, 0.9490196, 1,
0.9992898, -0.8361983, 2.496068, 1, 0, 0.9411765, 1,
0.9994367, -1.025243, 2.705474, 1, 0, 0.9372549, 1,
1.005391, 1.014172, 0.2907806, 1, 0, 0.9294118, 1,
1.007408, 0.2237821, 1.005618, 1, 0, 0.9254902, 1,
1.014459, 0.4747217, 0.01932935, 1, 0, 0.9176471, 1,
1.023433, 2.140256, 0.4695022, 1, 0, 0.9137255, 1,
1.024585, -2.057328, 0.530875, 1, 0, 0.9058824, 1,
1.024625, -0.0067061, 2.774882, 1, 0, 0.9019608, 1,
1.026947, 1.542586, 0.8841819, 1, 0, 0.8941177, 1,
1.028497, 0.2127752, 0.5544695, 1, 0, 0.8862745, 1,
1.02908, -2.54347, 4.26637, 1, 0, 0.8823529, 1,
1.042044, 0.4572353, 2.270086, 1, 0, 0.8745098, 1,
1.049235, -0.4162078, 2.92614, 1, 0, 0.8705882, 1,
1.049783, 0.8921337, -0.2204174, 1, 0, 0.8627451, 1,
1.051979, -0.4654821, 2.85076, 1, 0, 0.8588235, 1,
1.056122, 0.940235, 1.397904, 1, 0, 0.8509804, 1,
1.057189, -1.025321, 2.285455, 1, 0, 0.8470588, 1,
1.063203, 0.674663, 1.962737, 1, 0, 0.8392157, 1,
1.068835, -1.503144, 3.232477, 1, 0, 0.8352941, 1,
1.073764, -0.9206179, -0.7552604, 1, 0, 0.827451, 1,
1.074452, 1.28629, 0.3631603, 1, 0, 0.8235294, 1,
1.079025, 0.4506104, 1.677739, 1, 0, 0.8156863, 1,
1.080537, 1.579982, -0.8008059, 1, 0, 0.8117647, 1,
1.082822, -0.2813682, -0.4181934, 1, 0, 0.8039216, 1,
1.092058, -1.020486, 4.210377, 1, 0, 0.7960784, 1,
1.109007, -0.7778867, 1.964026, 1, 0, 0.7921569, 1,
1.11349, -0.1989003, 1.892073, 1, 0, 0.7843137, 1,
1.12078, -1.477741, 2.248943, 1, 0, 0.7803922, 1,
1.122604, 0.3140049, -0.7648063, 1, 0, 0.772549, 1,
1.125452, -1.349726, 1.4454, 1, 0, 0.7686275, 1,
1.132372, -0.487204, 2.545865, 1, 0, 0.7607843, 1,
1.133567, -0.3466432, 3.679739, 1, 0, 0.7568628, 1,
1.148544, -0.7038765, 2.841952, 1, 0, 0.7490196, 1,
1.151307, 2.308126, 0.575289, 1, 0, 0.7450981, 1,
1.1537, 0.2499807, 1.791754, 1, 0, 0.7372549, 1,
1.154334, 1.077095, 1.394141, 1, 0, 0.7333333, 1,
1.15546, 0.3521831, 0.380377, 1, 0, 0.7254902, 1,
1.161717, 1.534413, 1.162058, 1, 0, 0.7215686, 1,
1.16995, 1.230382, 0.7358054, 1, 0, 0.7137255, 1,
1.173406, -1.476738, 2.146196, 1, 0, 0.7098039, 1,
1.181224, -1.101604, 2.358684, 1, 0, 0.7019608, 1,
1.1817, -1.849211, 3.226048, 1, 0, 0.6941177, 1,
1.183772, -0.8054363, 2.395681, 1, 0, 0.6901961, 1,
1.185465, 1.259075, 1.115729, 1, 0, 0.682353, 1,
1.195272, -0.2507928, 0.5811424, 1, 0, 0.6784314, 1,
1.195497, 0.6825587, 1.388396, 1, 0, 0.6705883, 1,
1.208156, 1.999821, 1.086295, 1, 0, 0.6666667, 1,
1.220616, -0.9061378, 3.073686, 1, 0, 0.6588235, 1,
1.222812, 1.532765, 0.5552484, 1, 0, 0.654902, 1,
1.224222, 1.193749, 0.5807273, 1, 0, 0.6470588, 1,
1.22753, 0.3410254, 1.83435, 1, 0, 0.6431373, 1,
1.228087, -0.4743711, 1.660481, 1, 0, 0.6352941, 1,
1.236389, -0.04363585, 2.052914, 1, 0, 0.6313726, 1,
1.236504, 1.760616, 0.9206138, 1, 0, 0.6235294, 1,
1.245737, 0.6586014, 0.6048269, 1, 0, 0.6196079, 1,
1.248665, -0.2699115, 0.1117504, 1, 0, 0.6117647, 1,
1.251428, 0.6729633, 2.742775, 1, 0, 0.6078432, 1,
1.267088, 1.860189, 2.259073, 1, 0, 0.6, 1,
1.270793, -0.09275655, 2.039989, 1, 0, 0.5921569, 1,
1.277361, 0.05868902, 2.914386, 1, 0, 0.5882353, 1,
1.277541, 2.286607, 0.04745462, 1, 0, 0.5803922, 1,
1.27927, 0.1965747, 2.124183, 1, 0, 0.5764706, 1,
1.294114, -1.192835, 1.998897, 1, 0, 0.5686275, 1,
1.311884, 1.573441, 1.462946, 1, 0, 0.5647059, 1,
1.316667, 1.691176, 0.02740117, 1, 0, 0.5568628, 1,
1.319281, 0.9484946, -0.1569906, 1, 0, 0.5529412, 1,
1.319514, -1.93507, 1.987385, 1, 0, 0.5450981, 1,
1.320166, -0.8256063, 1.89458, 1, 0, 0.5411765, 1,
1.32683, 0.1102118, 1.525407, 1, 0, 0.5333334, 1,
1.330573, -0.7803752, 1.0948, 1, 0, 0.5294118, 1,
1.339946, -2.069368, 4.766565, 1, 0, 0.5215687, 1,
1.341885, -0.07121319, 0.5360906, 1, 0, 0.5176471, 1,
1.346061, 0.09768462, 0.8598992, 1, 0, 0.509804, 1,
1.347834, 0.8217064, 2.041304, 1, 0, 0.5058824, 1,
1.350745, 0.1124479, 1.286772, 1, 0, 0.4980392, 1,
1.386612, -1.522375, 4.236501, 1, 0, 0.4901961, 1,
1.388324, 0.214876, 0.4438066, 1, 0, 0.4862745, 1,
1.390689, -0.0400235, 2.173166, 1, 0, 0.4784314, 1,
1.391579, 0.0263655, 2.341434, 1, 0, 0.4745098, 1,
1.395197, 0.4924322, 1.245896, 1, 0, 0.4666667, 1,
1.400648, -1.158288, 1.898362, 1, 0, 0.4627451, 1,
1.402474, 1.333476, 0.7714728, 1, 0, 0.454902, 1,
1.403904, -0.1587018, -0.1107477, 1, 0, 0.4509804, 1,
1.44361, -1.300758, 2.504588, 1, 0, 0.4431373, 1,
1.448302, -0.6464226, 2.287027, 1, 0, 0.4392157, 1,
1.453976, 1.218623, 1.33489, 1, 0, 0.4313726, 1,
1.45508, -1.292261, 2.027318, 1, 0, 0.427451, 1,
1.475425, -0.7197392, 3.163587, 1, 0, 0.4196078, 1,
1.48481, -1.075088, 3.496196, 1, 0, 0.4156863, 1,
1.496458, 0.8655825, 0.3283745, 1, 0, 0.4078431, 1,
1.51584, -0.1430805, 1.877677, 1, 0, 0.4039216, 1,
1.530243, 0.3086548, 1.500551, 1, 0, 0.3960784, 1,
1.532168, 0.6084967, -0.1319159, 1, 0, 0.3882353, 1,
1.53248, -2.351763, 1.994318, 1, 0, 0.3843137, 1,
1.534558, 0.623565, -0.3687896, 1, 0, 0.3764706, 1,
1.598741, 0.9974292, -0.94292, 1, 0, 0.372549, 1,
1.603056, 0.492097, 0.1102959, 1, 0, 0.3647059, 1,
1.614005, 0.6381756, 1.524138, 1, 0, 0.3607843, 1,
1.635592, -0.970751, 1.872473, 1, 0, 0.3529412, 1,
1.642494, 1.54286, 1.193666, 1, 0, 0.3490196, 1,
1.652072, 1.47173, -0.2434603, 1, 0, 0.3411765, 1,
1.66046, 0.4591974, 2.316386, 1, 0, 0.3372549, 1,
1.66197, -0.1626364, 1.847548, 1, 0, 0.3294118, 1,
1.66425, 2.561906, 0.4647728, 1, 0, 0.3254902, 1,
1.667238, -0.5590348, 2.802, 1, 0, 0.3176471, 1,
1.695127, -0.04424451, 0.9733408, 1, 0, 0.3137255, 1,
1.706439, 1.502715, -1.916939, 1, 0, 0.3058824, 1,
1.719593, -1.461414, 2.564484, 1, 0, 0.2980392, 1,
1.723336, -0.04594988, 2.727598, 1, 0, 0.2941177, 1,
1.725641, 1.487928, 1.253221, 1, 0, 0.2862745, 1,
1.726267, 0.9588277, 2.256765, 1, 0, 0.282353, 1,
1.741745, -1.590592, 2.293125, 1, 0, 0.2745098, 1,
1.741867, -1.304083, 2.084401, 1, 0, 0.2705882, 1,
1.754367, 0.0278284, 1.489035, 1, 0, 0.2627451, 1,
1.760495, 1.406525, 1.889323, 1, 0, 0.2588235, 1,
1.769966, 0.2304694, 1.610803, 1, 0, 0.2509804, 1,
1.78358, 0.2596906, 1.744398, 1, 0, 0.2470588, 1,
1.792276, -0.2679812, 1.254045, 1, 0, 0.2392157, 1,
1.796899, -0.4469093, 0.5283096, 1, 0, 0.2352941, 1,
1.83059, 1.359863, 2.261712, 1, 0, 0.227451, 1,
1.852455, 0.81467, 0.05315638, 1, 0, 0.2235294, 1,
1.868647, -0.2030944, 2.595155, 1, 0, 0.2156863, 1,
1.870059, -0.4515179, 3.473875, 1, 0, 0.2117647, 1,
1.871041, 0.1792669, -0.1363136, 1, 0, 0.2039216, 1,
1.873271, 1.221114, 1.474325, 1, 0, 0.1960784, 1,
1.889261, -0.105797, 2.012751, 1, 0, 0.1921569, 1,
1.893628, 0.7993544, 2.033579, 1, 0, 0.1843137, 1,
1.894481, -2.513317, 2.618127, 1, 0, 0.1803922, 1,
1.911868, -0.3373858, 1.949331, 1, 0, 0.172549, 1,
1.915021, 0.09662952, 1.179252, 1, 0, 0.1686275, 1,
1.936957, 0.5101385, -0.229062, 1, 0, 0.1607843, 1,
1.947663, -1.31694, 3.005986, 1, 0, 0.1568628, 1,
1.960641, -0.9345127, 2.184891, 1, 0, 0.1490196, 1,
1.97673, 0.496541, 0.3664533, 1, 0, 0.145098, 1,
1.986164, 0.6234243, -0.2820461, 1, 0, 0.1372549, 1,
1.99202, 0.4608496, 1.848843, 1, 0, 0.1333333, 1,
2.0136, 0.8474544, 1.863586, 1, 0, 0.1254902, 1,
2.021065, 0.7210967, 0.6116027, 1, 0, 0.1215686, 1,
2.050709, 1.375896, -1.909181, 1, 0, 0.1137255, 1,
2.061189, -0.1805133, 1.769115, 1, 0, 0.1098039, 1,
2.070863, 1.20795, 0.8082436, 1, 0, 0.1019608, 1,
2.111961, -0.219505, 2.617203, 1, 0, 0.09411765, 1,
2.183022, -0.7243695, 2.472732, 1, 0, 0.09019608, 1,
2.210134, -1.366416, 2.680387, 1, 0, 0.08235294, 1,
2.242807, 1.936761, -0.3912182, 1, 0, 0.07843138, 1,
2.249096, 0.01908655, 1.221543, 1, 0, 0.07058824, 1,
2.250384, 1.477298, 1.532456, 1, 0, 0.06666667, 1,
2.293758, 0.4195842, 2.935307, 1, 0, 0.05882353, 1,
2.303991, -2.619192, 4.194071, 1, 0, 0.05490196, 1,
2.420036, 0.668245, 1.839153, 1, 0, 0.04705882, 1,
2.557331, -0.8099369, 2.595765, 1, 0, 0.04313726, 1,
2.60491, -0.4379405, 1.434816, 1, 0, 0.03529412, 1,
2.676031, 1.199404, 0.468112, 1, 0, 0.03137255, 1,
2.73431, -1.205312, 1.836863, 1, 0, 0.02352941, 1,
2.770789, 0.602457, 1.120516, 1, 0, 0.01960784, 1,
2.782775, -0.472676, 0.4571458, 1, 0, 0.01176471, 1,
3.112332, 1.339557, 0.9399204, 1, 0, 0.007843138, 1
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
-0.1092083, -4.628882, -7.091278, 0, -0.5, 0.5, 0.5,
-0.1092083, -4.628882, -7.091278, 1, -0.5, 0.5, 0.5,
-0.1092083, -4.628882, -7.091278, 1, 1.5, 0.5, 0.5,
-0.1092083, -4.628882, -7.091278, 0, 1.5, 0.5, 0.5
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
-4.422851, 0.05231225, -7.091278, 0, -0.5, 0.5, 0.5,
-4.422851, 0.05231225, -7.091278, 1, -0.5, 0.5, 0.5,
-4.422851, 0.05231225, -7.091278, 1, 1.5, 0.5, 0.5,
-4.422851, 0.05231225, -7.091278, 0, 1.5, 0.5, 0.5
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
-4.422851, -4.628882, -0.189203, 0, -0.5, 0.5, 0.5,
-4.422851, -4.628882, -0.189203, 1, -0.5, 0.5, 0.5,
-4.422851, -4.628882, -0.189203, 1, 1.5, 0.5, 0.5,
-4.422851, -4.628882, -0.189203, 0, 1.5, 0.5, 0.5
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
-3, -3.548607, -5.498491,
3, -3.548607, -5.498491,
-3, -3.548607, -5.498491,
-3, -3.728653, -5.763956,
-2, -3.548607, -5.498491,
-2, -3.728653, -5.763956,
-1, -3.548607, -5.498491,
-1, -3.728653, -5.763956,
0, -3.548607, -5.498491,
0, -3.728653, -5.763956,
1, -3.548607, -5.498491,
1, -3.728653, -5.763956,
2, -3.548607, -5.498491,
2, -3.728653, -5.763956,
3, -3.548607, -5.498491,
3, -3.728653, -5.763956
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
-3, -4.088745, -6.294884, 0, -0.5, 0.5, 0.5,
-3, -4.088745, -6.294884, 1, -0.5, 0.5, 0.5,
-3, -4.088745, -6.294884, 1, 1.5, 0.5, 0.5,
-3, -4.088745, -6.294884, 0, 1.5, 0.5, 0.5,
-2, -4.088745, -6.294884, 0, -0.5, 0.5, 0.5,
-2, -4.088745, -6.294884, 1, -0.5, 0.5, 0.5,
-2, -4.088745, -6.294884, 1, 1.5, 0.5, 0.5,
-2, -4.088745, -6.294884, 0, 1.5, 0.5, 0.5,
-1, -4.088745, -6.294884, 0, -0.5, 0.5, 0.5,
-1, -4.088745, -6.294884, 1, -0.5, 0.5, 0.5,
-1, -4.088745, -6.294884, 1, 1.5, 0.5, 0.5,
-1, -4.088745, -6.294884, 0, 1.5, 0.5, 0.5,
0, -4.088745, -6.294884, 0, -0.5, 0.5, 0.5,
0, -4.088745, -6.294884, 1, -0.5, 0.5, 0.5,
0, -4.088745, -6.294884, 1, 1.5, 0.5, 0.5,
0, -4.088745, -6.294884, 0, 1.5, 0.5, 0.5,
1, -4.088745, -6.294884, 0, -0.5, 0.5, 0.5,
1, -4.088745, -6.294884, 1, -0.5, 0.5, 0.5,
1, -4.088745, -6.294884, 1, 1.5, 0.5, 0.5,
1, -4.088745, -6.294884, 0, 1.5, 0.5, 0.5,
2, -4.088745, -6.294884, 0, -0.5, 0.5, 0.5,
2, -4.088745, -6.294884, 1, -0.5, 0.5, 0.5,
2, -4.088745, -6.294884, 1, 1.5, 0.5, 0.5,
2, -4.088745, -6.294884, 0, 1.5, 0.5, 0.5,
3, -4.088745, -6.294884, 0, -0.5, 0.5, 0.5,
3, -4.088745, -6.294884, 1, -0.5, 0.5, 0.5,
3, -4.088745, -6.294884, 1, 1.5, 0.5, 0.5,
3, -4.088745, -6.294884, 0, 1.5, 0.5, 0.5
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
-3.427395, -3, -5.498491,
-3.427395, 3, -5.498491,
-3.427395, -3, -5.498491,
-3.593304, -3, -5.763956,
-3.427395, -2, -5.498491,
-3.593304, -2, -5.763956,
-3.427395, -1, -5.498491,
-3.593304, -1, -5.763956,
-3.427395, 0, -5.498491,
-3.593304, 0, -5.763956,
-3.427395, 1, -5.498491,
-3.593304, 1, -5.763956,
-3.427395, 2, -5.498491,
-3.593304, 2, -5.763956,
-3.427395, 3, -5.498491,
-3.593304, 3, -5.763956
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
-3.925122, -3, -6.294884, 0, -0.5, 0.5, 0.5,
-3.925122, -3, -6.294884, 1, -0.5, 0.5, 0.5,
-3.925122, -3, -6.294884, 1, 1.5, 0.5, 0.5,
-3.925122, -3, -6.294884, 0, 1.5, 0.5, 0.5,
-3.925122, -2, -6.294884, 0, -0.5, 0.5, 0.5,
-3.925122, -2, -6.294884, 1, -0.5, 0.5, 0.5,
-3.925122, -2, -6.294884, 1, 1.5, 0.5, 0.5,
-3.925122, -2, -6.294884, 0, 1.5, 0.5, 0.5,
-3.925122, -1, -6.294884, 0, -0.5, 0.5, 0.5,
-3.925122, -1, -6.294884, 1, -0.5, 0.5, 0.5,
-3.925122, -1, -6.294884, 1, 1.5, 0.5, 0.5,
-3.925122, -1, -6.294884, 0, 1.5, 0.5, 0.5,
-3.925122, 0, -6.294884, 0, -0.5, 0.5, 0.5,
-3.925122, 0, -6.294884, 1, -0.5, 0.5, 0.5,
-3.925122, 0, -6.294884, 1, 1.5, 0.5, 0.5,
-3.925122, 0, -6.294884, 0, 1.5, 0.5, 0.5,
-3.925122, 1, -6.294884, 0, -0.5, 0.5, 0.5,
-3.925122, 1, -6.294884, 1, -0.5, 0.5, 0.5,
-3.925122, 1, -6.294884, 1, 1.5, 0.5, 0.5,
-3.925122, 1, -6.294884, 0, 1.5, 0.5, 0.5,
-3.925122, 2, -6.294884, 0, -0.5, 0.5, 0.5,
-3.925122, 2, -6.294884, 1, -0.5, 0.5, 0.5,
-3.925122, 2, -6.294884, 1, 1.5, 0.5, 0.5,
-3.925122, 2, -6.294884, 0, 1.5, 0.5, 0.5,
-3.925122, 3, -6.294884, 0, -0.5, 0.5, 0.5,
-3.925122, 3, -6.294884, 1, -0.5, 0.5, 0.5,
-3.925122, 3, -6.294884, 1, 1.5, 0.5, 0.5,
-3.925122, 3, -6.294884, 0, 1.5, 0.5, 0.5
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
-3.427395, -3.548607, -4,
-3.427395, -3.548607, 4,
-3.427395, -3.548607, -4,
-3.593304, -3.728653, -4,
-3.427395, -3.548607, -2,
-3.593304, -3.728653, -2,
-3.427395, -3.548607, 0,
-3.593304, -3.728653, 0,
-3.427395, -3.548607, 2,
-3.593304, -3.728653, 2,
-3.427395, -3.548607, 4,
-3.593304, -3.728653, 4
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
-3.925122, -4.088745, -4, 0, -0.5, 0.5, 0.5,
-3.925122, -4.088745, -4, 1, -0.5, 0.5, 0.5,
-3.925122, -4.088745, -4, 1, 1.5, 0.5, 0.5,
-3.925122, -4.088745, -4, 0, 1.5, 0.5, 0.5,
-3.925122, -4.088745, -2, 0, -0.5, 0.5, 0.5,
-3.925122, -4.088745, -2, 1, -0.5, 0.5, 0.5,
-3.925122, -4.088745, -2, 1, 1.5, 0.5, 0.5,
-3.925122, -4.088745, -2, 0, 1.5, 0.5, 0.5,
-3.925122, -4.088745, 0, 0, -0.5, 0.5, 0.5,
-3.925122, -4.088745, 0, 1, -0.5, 0.5, 0.5,
-3.925122, -4.088745, 0, 1, 1.5, 0.5, 0.5,
-3.925122, -4.088745, 0, 0, 1.5, 0.5, 0.5,
-3.925122, -4.088745, 2, 0, -0.5, 0.5, 0.5,
-3.925122, -4.088745, 2, 1, -0.5, 0.5, 0.5,
-3.925122, -4.088745, 2, 1, 1.5, 0.5, 0.5,
-3.925122, -4.088745, 2, 0, 1.5, 0.5, 0.5,
-3.925122, -4.088745, 4, 0, -0.5, 0.5, 0.5,
-3.925122, -4.088745, 4, 1, -0.5, 0.5, 0.5,
-3.925122, -4.088745, 4, 1, 1.5, 0.5, 0.5,
-3.925122, -4.088745, 4, 0, 1.5, 0.5, 0.5
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
-3.427395, -3.548607, -5.498491,
-3.427395, 3.653231, -5.498491,
-3.427395, -3.548607, 5.120085,
-3.427395, 3.653231, 5.120085,
-3.427395, -3.548607, -5.498491,
-3.427395, -3.548607, 5.120085,
-3.427395, 3.653231, -5.498491,
-3.427395, 3.653231, 5.120085,
-3.427395, -3.548607, -5.498491,
3.208978, -3.548607, -5.498491,
-3.427395, -3.548607, 5.120085,
3.208978, -3.548607, 5.120085,
-3.427395, 3.653231, -5.498491,
3.208978, 3.653231, -5.498491,
-3.427395, 3.653231, 5.120085,
3.208978, 3.653231, 5.120085,
3.208978, -3.548607, -5.498491,
3.208978, 3.653231, -5.498491,
3.208978, -3.548607, 5.120085,
3.208978, 3.653231, 5.120085,
3.208978, -3.548607, -5.498491,
3.208978, -3.548607, 5.120085,
3.208978, 3.653231, -5.498491,
3.208978, 3.653231, 5.120085
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
var radius = 7.713424;
var distance = 34.31789;
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
mvMatrix.translate( 0.1092083, -0.05231225, 0.189203 );
mvMatrix.scale( 1.256696, 1.158025, 0.7854071 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.31789);
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
ammonium_sulfamate<-read.table("ammonium_sulfamate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ammonium_sulfamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulfamate' not found
```

```r
y<-ammonium_sulfamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulfamate' not found
```

```r
z<-ammonium_sulfamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulfamate' not found
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
-3.330748, -1.162744, -2.810891, 0, 0, 1, 1, 1,
-3.120134, -0.538613, 0.5716588, 1, 0, 0, 1, 1,
-2.921899, -1.571045, -1.833371, 1, 0, 0, 1, 1,
-2.769788, -1.357932, -2.746701, 1, 0, 0, 1, 1,
-2.68636, -1.028806, -3.095531, 1, 0, 0, 1, 1,
-2.630301, 1.096708, -0.1895683, 1, 0, 0, 1, 1,
-2.589663, 1.994128, -2.867966, 0, 0, 0, 1, 1,
-2.537922, 0.338862, -1.752481, 0, 0, 0, 1, 1,
-2.526, 0.9048188, -1.636768, 0, 0, 0, 1, 1,
-2.508236, 1.680181, 1.067859, 0, 0, 0, 1, 1,
-2.491683, 1.465319, -2.385214, 0, 0, 0, 1, 1,
-2.427216, -0.8714232, -1.808552, 0, 0, 0, 1, 1,
-2.396037, 1.403811, -2.090079, 0, 0, 0, 1, 1,
-2.367431, -0.7131504, -0.5716165, 1, 1, 1, 1, 1,
-2.214253, -0.4582992, -2.071308, 1, 1, 1, 1, 1,
-2.182313, 1.244333, -1.01188, 1, 1, 1, 1, 1,
-2.18198, 1.667158, -0.6246775, 1, 1, 1, 1, 1,
-2.138901, -0.6858609, -2.063141, 1, 1, 1, 1, 1,
-2.081891, -0.5827323, -2.387002, 1, 1, 1, 1, 1,
-2.073553, 1.001294, -1.271173, 1, 1, 1, 1, 1,
-2.034086, -1.201924, -2.523993, 1, 1, 1, 1, 1,
-2.023857, 1.810195, -0.2252413, 1, 1, 1, 1, 1,
-2.021977, 0.2000318, -0.8244913, 1, 1, 1, 1, 1,
-2.005566, 0.9012446, -0.9912635, 1, 1, 1, 1, 1,
-1.996481, -0.9926031, -1.914424, 1, 1, 1, 1, 1,
-1.992285, -0.5458274, -1.255289, 1, 1, 1, 1, 1,
-1.991066, -1.149712, -2.29586, 1, 1, 1, 1, 1,
-1.959279, 0.6166399, -1.500202, 1, 1, 1, 1, 1,
-1.95083, 1.23712, -1.353526, 0, 0, 1, 1, 1,
-1.937175, 0.8540004, 0.4180315, 1, 0, 0, 1, 1,
-1.924065, -1.607522, -3.319426, 1, 0, 0, 1, 1,
-1.903511, 1.339837, -0.628459, 1, 0, 0, 1, 1,
-1.84138, 2.720877, -1.105462, 1, 0, 0, 1, 1,
-1.837437, 1.635081, -0.159645, 1, 0, 0, 1, 1,
-1.803443, -1.238284, -2.319846, 0, 0, 0, 1, 1,
-1.800566, 0.958709, -0.3082303, 0, 0, 0, 1, 1,
-1.782673, -0.3163048, -0.8045365, 0, 0, 0, 1, 1,
-1.764967, 2.211837, 1.446573, 0, 0, 0, 1, 1,
-1.750134, -0.7371605, -3.17388, 0, 0, 0, 1, 1,
-1.735252, -0.8142997, -2.258055, 0, 0, 0, 1, 1,
-1.717182, 0.6788191, -1.191989, 0, 0, 0, 1, 1,
-1.716798, 0.6425341, 0.1841782, 1, 1, 1, 1, 1,
-1.709076, 1.121276, -2.677142, 1, 1, 1, 1, 1,
-1.695871, 0.5622495, -1.993784, 1, 1, 1, 1, 1,
-1.663759, 0.7142732, -0.4937191, 1, 1, 1, 1, 1,
-1.661637, 0.9739285, -0.05503525, 1, 1, 1, 1, 1,
-1.644046, -0.1186294, -1.773208, 1, 1, 1, 1, 1,
-1.639293, 0.4827208, -0.7366011, 1, 1, 1, 1, 1,
-1.631009, 0.2729349, -2.387528, 1, 1, 1, 1, 1,
-1.629408, 0.7783821, -1.393752, 1, 1, 1, 1, 1,
-1.604588, 1.827993, -0.7906955, 1, 1, 1, 1, 1,
-1.584241, 0.7943605, -0.5202305, 1, 1, 1, 1, 1,
-1.583664, -0.1609914, -2.733192, 1, 1, 1, 1, 1,
-1.57304, 0.05050344, 0.01554815, 1, 1, 1, 1, 1,
-1.572694, 0.7479529, -2.484448, 1, 1, 1, 1, 1,
-1.570868, -0.1924313, -1.422074, 1, 1, 1, 1, 1,
-1.56976, -0.3422354, -2.457876, 0, 0, 1, 1, 1,
-1.568181, 0.1418463, -0.5743703, 1, 0, 0, 1, 1,
-1.562813, -0.2702444, -3.406323, 1, 0, 0, 1, 1,
-1.548188, -0.01113036, -2.065882, 1, 0, 0, 1, 1,
-1.538129, 1.118322, -1.469555, 1, 0, 0, 1, 1,
-1.533373, -0.5017553, -2.276214, 1, 0, 0, 1, 1,
-1.533093, 1.34745, 0.05224591, 0, 0, 0, 1, 1,
-1.527125, 0.5981458, -2.257198, 0, 0, 0, 1, 1,
-1.507343, 0.4032619, 0.06496569, 0, 0, 0, 1, 1,
-1.495897, -0.09311569, -0.9746739, 0, 0, 0, 1, 1,
-1.48763, -0.5872608, -0.6383151, 0, 0, 0, 1, 1,
-1.486456, -0.3655002, -2.911125, 0, 0, 0, 1, 1,
-1.478029, 1.583561, -0.5782391, 0, 0, 0, 1, 1,
-1.471412, -1.746575, -1.173625, 1, 1, 1, 1, 1,
-1.47015, 1.468441, -0.1353311, 1, 1, 1, 1, 1,
-1.468112, 0.5910239, -1.782089, 1, 1, 1, 1, 1,
-1.466767, -1.667826, -3.493276, 1, 1, 1, 1, 1,
-1.46399, 0.9542351, -1.863555, 1, 1, 1, 1, 1,
-1.448594, 0.04090463, -1.620335, 1, 1, 1, 1, 1,
-1.426691, 2.362481, -0.1782888, 1, 1, 1, 1, 1,
-1.421084, -0.3590639, -2.822213, 1, 1, 1, 1, 1,
-1.415077, 1.396715, -2.046029, 1, 1, 1, 1, 1,
-1.414307, -1.120729, -2.276903, 1, 1, 1, 1, 1,
-1.406324, -0.2576286, -1.14652, 1, 1, 1, 1, 1,
-1.394492, 0.03176257, -1.537912, 1, 1, 1, 1, 1,
-1.393527, 1.197353, -0.149642, 1, 1, 1, 1, 1,
-1.389011, -0.05230131, -2.405911, 1, 1, 1, 1, 1,
-1.387832, 0.1670117, 0.004141386, 1, 1, 1, 1, 1,
-1.361759, 1.904047, -1.00539, 0, 0, 1, 1, 1,
-1.326979, 1.09524, 0.6667712, 1, 0, 0, 1, 1,
-1.314849, 1.451308, 1.828846, 1, 0, 0, 1, 1,
-1.308803, 0.1624392, -1.218254, 1, 0, 0, 1, 1,
-1.298134, 0.2009615, -2.482082, 1, 0, 0, 1, 1,
-1.298034, -0.9275364, -2.243659, 1, 0, 0, 1, 1,
-1.290575, 1.544374, -1.272367, 0, 0, 0, 1, 1,
-1.288188, -1.546153, -1.772677, 0, 0, 0, 1, 1,
-1.286443, -0.4096392, -1.506185, 0, 0, 0, 1, 1,
-1.270196, -1.24347, -2.16853, 0, 0, 0, 1, 1,
-1.262656, 0.7276766, 0.1460771, 0, 0, 0, 1, 1,
-1.246353, 1.987562, -0.8723414, 0, 0, 0, 1, 1,
-1.237015, 1.149803, -0.8433108, 0, 0, 0, 1, 1,
-1.223459, 1.24063, -0.557218, 1, 1, 1, 1, 1,
-1.221774, 1.355009, -1.481403, 1, 1, 1, 1, 1,
-1.217093, -1.679246, -1.182526, 1, 1, 1, 1, 1,
-1.216826, -0.5236037, -2.210408, 1, 1, 1, 1, 1,
-1.214199, -0.2643227, -2.686001, 1, 1, 1, 1, 1,
-1.210782, 1.945546, -2.420362, 1, 1, 1, 1, 1,
-1.209186, -1.299616, -3.763914, 1, 1, 1, 1, 1,
-1.201584, 0.3146585, -1.721901, 1, 1, 1, 1, 1,
-1.196532, 0.7412748, -2.454615, 1, 1, 1, 1, 1,
-1.189921, -1.04017, -1.711141, 1, 1, 1, 1, 1,
-1.185587, 0.846896, -0.9928054, 1, 1, 1, 1, 1,
-1.181108, 0.3996077, -0.2651783, 1, 1, 1, 1, 1,
-1.178648, -0.6469453, -0.4931852, 1, 1, 1, 1, 1,
-1.172908, 0.3573844, -1.417445, 1, 1, 1, 1, 1,
-1.172851, -0.8070272, -1.682033, 1, 1, 1, 1, 1,
-1.159155, -0.4560775, -0.7279214, 0, 0, 1, 1, 1,
-1.154786, -0.5240768, -3.281298, 1, 0, 0, 1, 1,
-1.150637, 1.259993, -2.172731, 1, 0, 0, 1, 1,
-1.1451, 0.1622221, -0.6544618, 1, 0, 0, 1, 1,
-1.142762, -1.236123, -2.054901, 1, 0, 0, 1, 1,
-1.135484, 0.5847193, -0.7444119, 1, 0, 0, 1, 1,
-1.122027, -0.8711892, -2.299669, 0, 0, 0, 1, 1,
-1.119495, -1.163343, -1.431169, 0, 0, 0, 1, 1,
-1.118377, 0.6157463, -0.6579345, 0, 0, 0, 1, 1,
-1.115692, -0.7840829, -0.8458233, 0, 0, 0, 1, 1,
-1.115489, 0.849363, -0.8256887, 0, 0, 0, 1, 1,
-1.103131, 0.9572138, 0.04298448, 0, 0, 0, 1, 1,
-1.099591, -0.3155445, 0.3546325, 0, 0, 0, 1, 1,
-1.087773, 1.117219, -1.260105, 1, 1, 1, 1, 1,
-1.087139, 0.2188364, -0.7000967, 1, 1, 1, 1, 1,
-1.077948, 0.8876123, -2.485992, 1, 1, 1, 1, 1,
-1.072556, 0.7659379, -1.899161, 1, 1, 1, 1, 1,
-1.062019, 0.8579796, -3.090351, 1, 1, 1, 1, 1,
-1.058834, -0.7648854, -2.066996, 1, 1, 1, 1, 1,
-1.056232, 0.1455645, -1.13518, 1, 1, 1, 1, 1,
-1.055084, -0.1217282, -3.236662, 1, 1, 1, 1, 1,
-1.051052, -0.1215245, -3.111034, 1, 1, 1, 1, 1,
-1.038694, 1.124147, -0.1549334, 1, 1, 1, 1, 1,
-1.02267, -0.9143675, -1.365851, 1, 1, 1, 1, 1,
-1.021532, -0.006494529, -2.257823, 1, 1, 1, 1, 1,
-1.01562, -0.5043203, -3.057639, 1, 1, 1, 1, 1,
-1.002478, 1.77235, -1.22744, 1, 1, 1, 1, 1,
-1.000874, -0.9851511, -2.263197, 1, 1, 1, 1, 1,
-0.9959109, 0.7605141, -1.05436, 0, 0, 1, 1, 1,
-0.9922871, -0.5449244, -0.3562565, 1, 0, 0, 1, 1,
-0.9861246, 0.2977819, -2.116341, 1, 0, 0, 1, 1,
-0.9852916, 0.1802904, -3.169352, 1, 0, 0, 1, 1,
-0.9787644, 0.4899623, 0.5279204, 1, 0, 0, 1, 1,
-0.9767433, -0.3419884, -1.284289, 1, 0, 0, 1, 1,
-0.97263, -0.1871603, -1.693077, 0, 0, 0, 1, 1,
-0.9682244, -0.4290765, -0.2574238, 0, 0, 0, 1, 1,
-0.962577, 1.323503, -2.11553, 0, 0, 0, 1, 1,
-0.9584332, 0.5027087, -2.21874, 0, 0, 0, 1, 1,
-0.9566266, 0.2416832, -1.378384, 0, 0, 0, 1, 1,
-0.9550303, 1.670547, 0.8688152, 0, 0, 0, 1, 1,
-0.9470381, -0.7779713, -1.292946, 0, 0, 0, 1, 1,
-0.9395919, 0.3419296, 1.144129, 1, 1, 1, 1, 1,
-0.9344624, 0.05359779, -2.255358, 1, 1, 1, 1, 1,
-0.9305679, 0.4300542, -2.227, 1, 1, 1, 1, 1,
-0.9302804, -1.496998, -1.832095, 1, 1, 1, 1, 1,
-0.9277971, 0.42189, -0.4400703, 1, 1, 1, 1, 1,
-0.9175592, 0.2334607, -1.342486, 1, 1, 1, 1, 1,
-0.916003, 0.3722102, -1.474766, 1, 1, 1, 1, 1,
-0.9148219, -0.06132757, -2.068872, 1, 1, 1, 1, 1,
-0.9132583, -0.2937395, -2.499991, 1, 1, 1, 1, 1,
-0.9118469, -0.3310192, -3.73586, 1, 1, 1, 1, 1,
-0.8969415, 0.6971843, -2.099325, 1, 1, 1, 1, 1,
-0.896789, 0.2797283, -1.758457, 1, 1, 1, 1, 1,
-0.8959141, 0.3668548, -1.582786, 1, 1, 1, 1, 1,
-0.8951815, 0.9790338, -0.7813655, 1, 1, 1, 1, 1,
-0.8940967, 0.1818934, -2.946975, 1, 1, 1, 1, 1,
-0.8923476, -0.563814, -1.591944, 0, 0, 1, 1, 1,
-0.8895933, 2.637233, -0.1089594, 1, 0, 0, 1, 1,
-0.8879166, 0.2312627, -1.510267, 1, 0, 0, 1, 1,
-0.8860121, 0.7509116, -1.569185, 1, 0, 0, 1, 1,
-0.8855688, -0.9251462, -2.344083, 1, 0, 0, 1, 1,
-0.8827532, -1.063779, -2.5926, 1, 0, 0, 1, 1,
-0.881115, 0.7894636, -1.476144, 0, 0, 0, 1, 1,
-0.8778872, 1.153552, -1.543601, 0, 0, 0, 1, 1,
-0.877306, 1.411077, -1.978554, 0, 0, 0, 1, 1,
-0.872672, -1.601025, -4.239822, 0, 0, 0, 1, 1,
-0.8684775, -0.6172362, -2.436962, 0, 0, 0, 1, 1,
-0.8638586, 0.882521, -0.9707559, 0, 0, 0, 1, 1,
-0.8633348, 0.5797935, -0.6770313, 0, 0, 0, 1, 1,
-0.8621218, 0.5308639, -1.413283, 1, 1, 1, 1, 1,
-0.8607127, 1.424174, -1.106822, 1, 1, 1, 1, 1,
-0.8554118, -0.01923403, -1.259338, 1, 1, 1, 1, 1,
-0.8551224, -0.4395108, -2.912148, 1, 1, 1, 1, 1,
-0.8544651, -0.04096963, -2.577937, 1, 1, 1, 1, 1,
-0.848233, -0.953966, -1.719641, 1, 1, 1, 1, 1,
-0.8476864, -0.3686676, -2.148108, 1, 1, 1, 1, 1,
-0.8400775, -0.2349644, -0.7197684, 1, 1, 1, 1, 1,
-0.8374912, -0.513617, -1.434894, 1, 1, 1, 1, 1,
-0.8290563, 0.278942, -2.14742, 1, 1, 1, 1, 1,
-0.8236142, 1.349123, -1.018919, 1, 1, 1, 1, 1,
-0.8227112, -1.00522, -1.575907, 1, 1, 1, 1, 1,
-0.8180556, 0.1456057, -1.28496, 1, 1, 1, 1, 1,
-0.8174796, 0.6032907, -0.9724734, 1, 1, 1, 1, 1,
-0.8174579, -0.2082816, -0.6160138, 1, 1, 1, 1, 1,
-0.8145329, -0.8432916, -4.943364, 0, 0, 1, 1, 1,
-0.8122894, -1.066353, -1.653177, 1, 0, 0, 1, 1,
-0.8032476, 0.05827949, -0.6881678, 1, 0, 0, 1, 1,
-0.8016023, 1.813518, -0.1500539, 1, 0, 0, 1, 1,
-0.7975751, -1.60374, -4.212854, 1, 0, 0, 1, 1,
-0.7954427, 1.056501, 0.2217684, 1, 0, 0, 1, 1,
-0.7903755, 0.07863032, -1.06558, 0, 0, 0, 1, 1,
-0.7884589, -2.974383, -3.435665, 0, 0, 0, 1, 1,
-0.7852941, 0.5829914, -1.967626, 0, 0, 0, 1, 1,
-0.777712, 0.5331577, -0.2069702, 0, 0, 0, 1, 1,
-0.7711587, -0.4720004, -1.399636, 0, 0, 0, 1, 1,
-0.770084, 0.9057236, 0.1997134, 0, 0, 0, 1, 1,
-0.7643275, 0.2594139, -0.1189604, 0, 0, 0, 1, 1,
-0.7628316, 1.069597, 0.1608514, 1, 1, 1, 1, 1,
-0.761333, 0.2772372, -0.6364118, 1, 1, 1, 1, 1,
-0.7599503, 1.527864, -0.5473505, 1, 1, 1, 1, 1,
-0.7561203, 1.553666, -0.1819649, 1, 1, 1, 1, 1,
-0.7455264, 0.1312858, -0.82068, 1, 1, 1, 1, 1,
-0.7448779, -1.249546, -4.752472, 1, 1, 1, 1, 1,
-0.7433212, -0.4758341, -0.8337197, 1, 1, 1, 1, 1,
-0.7416174, -0.653908, -2.942837, 1, 1, 1, 1, 1,
-0.7345374, 1.707494, -0.2398663, 1, 1, 1, 1, 1,
-0.7343899, -1.078035, -3.242734, 1, 1, 1, 1, 1,
-0.7307981, 1.082687, 0.2424423, 1, 1, 1, 1, 1,
-0.725469, -0.5447176, -2.86092, 1, 1, 1, 1, 1,
-0.7235784, 1.275695, 0.9220386, 1, 1, 1, 1, 1,
-0.7216678, -1.614014, -2.365537, 1, 1, 1, 1, 1,
-0.7204478, -0.2740578, -2.307942, 1, 1, 1, 1, 1,
-0.7188284, -1.659234, -2.763106, 0, 0, 1, 1, 1,
-0.7154267, -0.7054683, -1.912862, 1, 0, 0, 1, 1,
-0.7027428, 0.1710184, -0.9878672, 1, 0, 0, 1, 1,
-0.7015941, 0.08734976, -2.008096, 1, 0, 0, 1, 1,
-0.6990758, -1.132252, -2.325142, 1, 0, 0, 1, 1,
-0.6978122, 0.007742027, -1.71541, 1, 0, 0, 1, 1,
-0.6967902, 0.3830092, -2.257753, 0, 0, 0, 1, 1,
-0.6967545, -0.2748308, -3.73759, 0, 0, 0, 1, 1,
-0.695631, -0.7704527, -4.304187, 0, 0, 0, 1, 1,
-0.6859107, -0.3339532, -1.360514, 0, 0, 0, 1, 1,
-0.6846411, -0.9853271, -2.364296, 0, 0, 0, 1, 1,
-0.6817452, 0.4437557, -0.2627403, 0, 0, 0, 1, 1,
-0.6815441, 1.700166, -0.569456, 0, 0, 0, 1, 1,
-0.6793343, -0.7185, -3.443471, 1, 1, 1, 1, 1,
-0.6762878, -0.2468937, -3.26624, 1, 1, 1, 1, 1,
-0.6756735, -1.106532, -2.558522, 1, 1, 1, 1, 1,
-0.6704023, 0.1173822, -2.311391, 1, 1, 1, 1, 1,
-0.6690025, -0.7839718, -2.930316, 1, 1, 1, 1, 1,
-0.6665304, 0.09708836, -2.603844, 1, 1, 1, 1, 1,
-0.6640174, -0.5103694, -1.045767, 1, 1, 1, 1, 1,
-0.6628566, 0.2734824, -1.926369, 1, 1, 1, 1, 1,
-0.6614221, -0.3118489, -0.9880895, 1, 1, 1, 1, 1,
-0.6595081, -0.4866059, -2.048511, 1, 1, 1, 1, 1,
-0.6538785, -1.69444, -2.317773, 1, 1, 1, 1, 1,
-0.6529502, 0.2236426, -0.9193838, 1, 1, 1, 1, 1,
-0.6519014, 1.30987, -1.224133, 1, 1, 1, 1, 1,
-0.6461678, 3.54835, -0.3891895, 1, 1, 1, 1, 1,
-0.6427423, 1.784346, 0.2648537, 1, 1, 1, 1, 1,
-0.6421059, 1.174695, -0.271546, 0, 0, 1, 1, 1,
-0.6420851, -1.838181, -2.706619, 1, 0, 0, 1, 1,
-0.6400241, 0.3467253, -2.208305, 1, 0, 0, 1, 1,
-0.6400149, 0.7346236, -0.8590335, 1, 0, 0, 1, 1,
-0.6398377, -0.4810784, -3.488742, 1, 0, 0, 1, 1,
-0.636026, -0.5186942, -2.952647, 1, 0, 0, 1, 1,
-0.6265534, -0.9923414, -2.819548, 0, 0, 0, 1, 1,
-0.6219829, 0.3472683, -1.129175, 0, 0, 0, 1, 1,
-0.6080111, -1.057433, -2.345158, 0, 0, 0, 1, 1,
-0.6015266, 0.6120679, -1.704678, 0, 0, 0, 1, 1,
-0.5998242, 1.495673, -0.009334398, 0, 0, 0, 1, 1,
-0.595925, 0.9998196, -0.3796604, 0, 0, 0, 1, 1,
-0.5937718, -0.267414, -1.12197, 0, 0, 0, 1, 1,
-0.5925881, 1.127258, -0.1537935, 1, 1, 1, 1, 1,
-0.5889416, 0.7071183, -0.1917727, 1, 1, 1, 1, 1,
-0.5855807, -1.208247, -2.994389, 1, 1, 1, 1, 1,
-0.5846536, 0.2552691, -1.343177, 1, 1, 1, 1, 1,
-0.5807064, 0.1001157, 0.323889, 1, 1, 1, 1, 1,
-0.577171, -0.1177544, -0.5306596, 1, 1, 1, 1, 1,
-0.5764773, -0.06080325, -1.41364, 1, 1, 1, 1, 1,
-0.5699522, -1.85805, -2.110658, 1, 1, 1, 1, 1,
-0.5670785, -0.5748417, -0.9448149, 1, 1, 1, 1, 1,
-0.5669844, -0.9769596, -3.320337, 1, 1, 1, 1, 1,
-0.5666033, 0.4790935, 0.162814, 1, 1, 1, 1, 1,
-0.5606892, -0.1187906, -2.824243, 1, 1, 1, 1, 1,
-0.5565404, -1.177346, -2.650451, 1, 1, 1, 1, 1,
-0.5544801, -0.1041842, -0.7394962, 1, 1, 1, 1, 1,
-0.5498344, 0.2471965, -1.075742, 1, 1, 1, 1, 1,
-0.5490085, -2.143248, -2.14713, 0, 0, 1, 1, 1,
-0.547901, -0.6022214, -1.292269, 1, 0, 0, 1, 1,
-0.5449053, 1.175233, -1.341547, 1, 0, 0, 1, 1,
-0.5420336, -0.9406807, -2.979307, 1, 0, 0, 1, 1,
-0.5398111, -0.09243576, -2.348401, 1, 0, 0, 1, 1,
-0.5383626, 0.9964886, 0.4268826, 1, 0, 0, 1, 1,
-0.5374123, 0.8731865, -0.6520211, 0, 0, 0, 1, 1,
-0.5324965, -0.1770605, -2.661552, 0, 0, 0, 1, 1,
-0.5316555, 1.952323, 0.3846298, 0, 0, 0, 1, 1,
-0.5312471, 0.2169449, -0.6508999, 0, 0, 0, 1, 1,
-0.5309536, 0.2334113, 0.1490996, 0, 0, 0, 1, 1,
-0.5307035, 0.3017613, -1.442373, 0, 0, 0, 1, 1,
-0.530473, 0.7406241, 0.003336739, 0, 0, 0, 1, 1,
-0.5273804, -0.497274, -1.897792, 1, 1, 1, 1, 1,
-0.5248759, 0.2170419, -1.096652, 1, 1, 1, 1, 1,
-0.5197403, 0.1655065, -0.6667779, 1, 1, 1, 1, 1,
-0.5180359, 2.16479, -0.4963789, 1, 1, 1, 1, 1,
-0.5169517, -0.3359712, -3.992764, 1, 1, 1, 1, 1,
-0.5137207, 0.2569111, -1.077236, 1, 1, 1, 1, 1,
-0.5061263, 0.3927428, -1.639884, 1, 1, 1, 1, 1,
-0.5041571, 0.9962632, -1.682722, 1, 1, 1, 1, 1,
-0.5011533, -0.40782, -0.1211632, 1, 1, 1, 1, 1,
-0.5005863, 0.877414, 1.121265, 1, 1, 1, 1, 1,
-0.497738, -1.320315, -1.61177, 1, 1, 1, 1, 1,
-0.4973559, 0.3035381, -2.464342, 1, 1, 1, 1, 1,
-0.4972414, -0.4167458, -3.32511, 1, 1, 1, 1, 1,
-0.496296, 0.4619112, -1.097072, 1, 1, 1, 1, 1,
-0.487147, -1.266225, -2.994051, 1, 1, 1, 1, 1,
-0.4859389, -0.9080086, -1.782146, 0, 0, 1, 1, 1,
-0.4819916, -0.9429402, -2.50448, 1, 0, 0, 1, 1,
-0.4788488, 0.2908023, -1.388753, 1, 0, 0, 1, 1,
-0.4772326, -0.4845134, -1.333528, 1, 0, 0, 1, 1,
-0.4746915, 0.07235205, -2.227777, 1, 0, 0, 1, 1,
-0.4711685, 0.580143, -0.03093206, 1, 0, 0, 1, 1,
-0.4705876, 0.7776251, -0.1657533, 0, 0, 0, 1, 1,
-0.4685876, -0.3768711, -2.319514, 0, 0, 0, 1, 1,
-0.4674268, -0.6523975, -2.12384, 0, 0, 0, 1, 1,
-0.4585053, 1.000322, -1.689208, 0, 0, 0, 1, 1,
-0.4574064, -0.4697142, -3.870175, 0, 0, 0, 1, 1,
-0.4571035, 0.004033514, -2.244378, 0, 0, 0, 1, 1,
-0.4562154, 1.415387, 0.4699263, 0, 0, 0, 1, 1,
-0.4523658, 0.2994883, -2.359535, 1, 1, 1, 1, 1,
-0.4519037, 0.4231649, -1.85072, 1, 1, 1, 1, 1,
-0.4450416, 1.136852, 0.1033279, 1, 1, 1, 1, 1,
-0.4411556, -1.512812, -2.783192, 1, 1, 1, 1, 1,
-0.4402821, 1.523486, -1.666882, 1, 1, 1, 1, 1,
-0.4366089, -0.5559301, -2.694719, 1, 1, 1, 1, 1,
-0.4318238, -0.276048, -2.049813, 1, 1, 1, 1, 1,
-0.4317163, 0.2313076, -3.691721, 1, 1, 1, 1, 1,
-0.4274721, 0.9629769, -0.2432856, 1, 1, 1, 1, 1,
-0.4267414, 0.1497623, -2.138335, 1, 1, 1, 1, 1,
-0.4208387, -1.285451, -2.276135, 1, 1, 1, 1, 1,
-0.4191047, 0.626751, 0.8118483, 1, 1, 1, 1, 1,
-0.4175088, -0.2439836, -2.964909, 1, 1, 1, 1, 1,
-0.4130456, 0.6883329, -1.755884, 1, 1, 1, 1, 1,
-0.4129151, -0.6686208, -2.943021, 1, 1, 1, 1, 1,
-0.4124258, 1.057919, -1.523803, 0, 0, 1, 1, 1,
-0.4105658, 3.506097, 0.02997768, 1, 0, 0, 1, 1,
-0.4071337, -0.493751, -2.045135, 1, 0, 0, 1, 1,
-0.403069, 2.111599, -1.917465, 1, 0, 0, 1, 1,
-0.395702, -1.085843, -1.588425, 1, 0, 0, 1, 1,
-0.3894221, -0.2125397, -2.741543, 1, 0, 0, 1, 1,
-0.3845531, 0.6814274, -0.2230298, 0, 0, 0, 1, 1,
-0.3789494, 2.375213, 0.7560696, 0, 0, 0, 1, 1,
-0.3767014, -1.438559, -4.229965, 0, 0, 0, 1, 1,
-0.3749872, -0.2316321, -5.112771, 0, 0, 0, 1, 1,
-0.3705257, 0.1860659, -0.465542, 0, 0, 0, 1, 1,
-0.3701278, 0.09136208, -2.94877, 0, 0, 0, 1, 1,
-0.367755, -1.329628, -3.360634, 0, 0, 0, 1, 1,
-0.3599728, -1.948384, -3.478914, 1, 1, 1, 1, 1,
-0.3585251, 0.3586753, -2.03812, 1, 1, 1, 1, 1,
-0.3551571, -0.8005345, -3.711122, 1, 1, 1, 1, 1,
-0.3544856, 0.1560219, -1.501906, 1, 1, 1, 1, 1,
-0.3526074, -2.26227, -4.434594, 1, 1, 1, 1, 1,
-0.345329, 0.5479258, -0.1276445, 1, 1, 1, 1, 1,
-0.3435544, -0.7998036, -0.7672852, 1, 1, 1, 1, 1,
-0.3428195, -0.9557126, -2.99255, 1, 1, 1, 1, 1,
-0.3425035, 0.1525871, -0.03854371, 1, 1, 1, 1, 1,
-0.3371125, -1.07553, -2.532685, 1, 1, 1, 1, 1,
-0.3321642, 0.01031507, -0.6486362, 1, 1, 1, 1, 1,
-0.3319535, 1.164794, 0.8868017, 1, 1, 1, 1, 1,
-0.3298275, -0.7609218, -3.912943, 1, 1, 1, 1, 1,
-0.3274181, 0.7027594, -0.9770317, 1, 1, 1, 1, 1,
-0.3247971, 0.7712764, -0.4711947, 1, 1, 1, 1, 1,
-0.3153263, -0.3335541, -1.162177, 0, 0, 1, 1, 1,
-0.3140809, 0.1777489, -1.841657, 1, 0, 0, 1, 1,
-0.3060705, 0.8262284, -0.0909213, 1, 0, 0, 1, 1,
-0.3058679, -0.3231249, -0.8562469, 1, 0, 0, 1, 1,
-0.3057391, 0.8577197, 0.107532, 1, 0, 0, 1, 1,
-0.2973334, -0.05758727, -0.481528, 1, 0, 0, 1, 1,
-0.2940015, 0.5449315, -2.365274, 0, 0, 0, 1, 1,
-0.2939987, -2.718132, -2.915618, 0, 0, 0, 1, 1,
-0.2916264, -0.2807213, -4.093478, 0, 0, 0, 1, 1,
-0.2887074, 1.306489, 1.214335, 0, 0, 0, 1, 1,
-0.2851199, -0.3106838, -2.086682, 0, 0, 0, 1, 1,
-0.2844316, -0.6169589, -2.56948, 0, 0, 0, 1, 1,
-0.2825388, 0.0753537, -0.2172855, 0, 0, 0, 1, 1,
-0.2821925, 0.6381301, 0.6009248, 1, 1, 1, 1, 1,
-0.2794592, -0.8216569, -3.897639, 1, 1, 1, 1, 1,
-0.2739803, -0.3456799, -3.231916, 1, 1, 1, 1, 1,
-0.2721982, -0.952415, -2.023596, 1, 1, 1, 1, 1,
-0.2702552, 0.07416898, -2.877404, 1, 1, 1, 1, 1,
-0.266693, -0.3878012, -1.3563, 1, 1, 1, 1, 1,
-0.2633668, -0.05277874, -0.7084484, 1, 1, 1, 1, 1,
-0.2630237, -0.4927018, -1.375482, 1, 1, 1, 1, 1,
-0.2628807, -0.3035103, -3.702857, 1, 1, 1, 1, 1,
-0.2619107, -0.6135201, -3.227324, 1, 1, 1, 1, 1,
-0.2546584, 0.8485813, -0.8006611, 1, 1, 1, 1, 1,
-0.2542469, -1.261967, -2.833392, 1, 1, 1, 1, 1,
-0.2486552, 1.242212, -1.078256, 1, 1, 1, 1, 1,
-0.2469337, -0.9798046, -3.690991, 1, 1, 1, 1, 1,
-0.2386403, -0.3903208, -2.30288, 1, 1, 1, 1, 1,
-0.2353088, -1.234566, -1.225236, 0, 0, 1, 1, 1,
-0.2348666, 1.214434, -1.205243, 1, 0, 0, 1, 1,
-0.2327019, 0.3979075, -0.1130087, 1, 0, 0, 1, 1,
-0.2311969, -1.298698, -2.802591, 1, 0, 0, 1, 1,
-0.226728, 1.085686, 0.3372095, 1, 0, 0, 1, 1,
-0.2223404, -0.6715267, -5.010603, 1, 0, 0, 1, 1,
-0.2169009, 1.030774, 0.1861219, 0, 0, 0, 1, 1,
-0.2143836, 0.9426106, -1.832348, 0, 0, 0, 1, 1,
-0.2129573, -0.7029915, -3.589811, 0, 0, 0, 1, 1,
-0.2106337, 2.298839, 1.025108, 0, 0, 0, 1, 1,
-0.2098635, -0.2146329, -0.3989521, 0, 0, 0, 1, 1,
-0.2087675, -0.8728878, -2.732465, 0, 0, 0, 1, 1,
-0.2086492, -1.475348, -3.700107, 0, 0, 0, 1, 1,
-0.2074237, 1.247995, 1.917345, 1, 1, 1, 1, 1,
-0.2067725, -0.1875607, -2.807952, 1, 1, 1, 1, 1,
-0.2057874, 1.963142, -1.723675, 1, 1, 1, 1, 1,
-0.1993545, -0.2481055, -1.222859, 1, 1, 1, 1, 1,
-0.1958297, 0.3619372, -1.284773, 1, 1, 1, 1, 1,
-0.1918969, 0.7405409, 0.6883855, 1, 1, 1, 1, 1,
-0.1892796, 0.5795735, 0.5355201, 1, 1, 1, 1, 1,
-0.1888235, 0.1305115, -0.4259977, 1, 1, 1, 1, 1,
-0.1873037, 0.6020813, -1.414734, 1, 1, 1, 1, 1,
-0.1808451, -0.8819269, -4.333758, 1, 1, 1, 1, 1,
-0.1800588, -0.6009508, -2.637606, 1, 1, 1, 1, 1,
-0.1798951, 0.6118031, -0.3572401, 1, 1, 1, 1, 1,
-0.1794893, 0.3566689, -2.715509, 1, 1, 1, 1, 1,
-0.1761074, 0.479729, -1.916898, 1, 1, 1, 1, 1,
-0.1705502, -0.1597446, -2.000882, 1, 1, 1, 1, 1,
-0.1694357, -0.1177856, -2.047611, 0, 0, 1, 1, 1,
-0.1655972, 0.381333, 0.1122438, 1, 0, 0, 1, 1,
-0.1633843, -1.125555, -4.85927, 1, 0, 0, 1, 1,
-0.1563712, 0.0191324, -1.113698, 1, 0, 0, 1, 1,
-0.1528305, -0.5175295, -1.09042, 1, 0, 0, 1, 1,
-0.1519385, 0.05495121, -1.562922, 1, 0, 0, 1, 1,
-0.1505932, 0.9647104, 0.2562602, 0, 0, 0, 1, 1,
-0.1481464, 1.529686, -0.6792631, 0, 0, 0, 1, 1,
-0.1478955, -0.1063558, -2.807338, 0, 0, 0, 1, 1,
-0.1427569, -1.476644, -3.855458, 0, 0, 0, 1, 1,
-0.1321398, -0.5052583, -2.928804, 0, 0, 0, 1, 1,
-0.1308685, 0.5366595, 1.64601, 0, 0, 0, 1, 1,
-0.1212909, -0.2092337, -1.585995, 0, 0, 0, 1, 1,
-0.1210463, 0.843564, -0.7596306, 1, 1, 1, 1, 1,
-0.1130367, 1.292056, -0.1924912, 1, 1, 1, 1, 1,
-0.1119341, -0.6179436, -2.843075, 1, 1, 1, 1, 1,
-0.1096811, 1.106034, -1.89804, 1, 1, 1, 1, 1,
-0.1084326, 0.5373955, -0.5404656, 1, 1, 1, 1, 1,
-0.1056673, -0.8692583, -2.94247, 1, 1, 1, 1, 1,
-0.1049083, -0.8754691, -2.028687, 1, 1, 1, 1, 1,
-0.1048972, 1.389279, -0.9184459, 1, 1, 1, 1, 1,
-0.1031804, -0.06312622, -1.583905, 1, 1, 1, 1, 1,
-0.1031069, -1.158427, -2.60567, 1, 1, 1, 1, 1,
-0.09410392, -0.299327, -4.108484, 1, 1, 1, 1, 1,
-0.08751412, 1.12568, 0.9217954, 1, 1, 1, 1, 1,
-0.08586283, 0.09509286, -2.316931, 1, 1, 1, 1, 1,
-0.08370955, 0.4707224, 1.173686, 1, 1, 1, 1, 1,
-0.07474656, 1.005304, -1.34697, 1, 1, 1, 1, 1,
-0.07315277, 0.08208733, -1.791837, 0, 0, 1, 1, 1,
-0.07291707, 2.843368, 0.5376962, 1, 0, 0, 1, 1,
-0.07225211, 0.7467678, 1.428181, 1, 0, 0, 1, 1,
-0.07190522, -0.3488555, -3.343927, 1, 0, 0, 1, 1,
-0.07154141, -0.1286587, -2.608872, 1, 0, 0, 1, 1,
-0.06926274, -0.9065295, -2.12248, 1, 0, 0, 1, 1,
-0.06607508, 0.2224779, 1.40681, 0, 0, 0, 1, 1,
-0.06554426, 0.1504278, -0.5787276, 0, 0, 0, 1, 1,
-0.0573666, -0.3633013, -4.396367, 0, 0, 0, 1, 1,
-0.05179144, -0.4497307, -2.658742, 0, 0, 0, 1, 1,
-0.05151143, -0.945705, -2.422932, 0, 0, 0, 1, 1,
-0.05045528, -0.9353166, -2.635219, 0, 0, 0, 1, 1,
-0.0484598, 0.4538598, 0.183398, 0, 0, 0, 1, 1,
-0.04625452, 0.8787802, 0.3111776, 1, 1, 1, 1, 1,
-0.0390413, -0.7637222, -3.777872, 1, 1, 1, 1, 1,
-0.03825769, -1.867945, -3.378747, 1, 1, 1, 1, 1,
-0.03762678, -0.7055953, -4.165098, 1, 1, 1, 1, 1,
-0.03613929, 0.7662807, 0.3688959, 1, 1, 1, 1, 1,
-0.03552093, 0.4124286, 0.435673, 1, 1, 1, 1, 1,
-0.0320164, 0.621212, 1.378242, 1, 1, 1, 1, 1,
-0.02622169, -0.2848397, -3.942338, 1, 1, 1, 1, 1,
-0.02540826, -0.02233877, -2.327998, 1, 1, 1, 1, 1,
-0.02024497, 0.5584972, 0.31048, 1, 1, 1, 1, 1,
-0.01978286, 0.2552697, 0.02423945, 1, 1, 1, 1, 1,
-0.017783, -0.7426839, -2.33553, 1, 1, 1, 1, 1,
-0.01630701, 0.040221, -0.4146066, 1, 1, 1, 1, 1,
-0.01499367, 1.703598, -0.2182784, 1, 1, 1, 1, 1,
-0.01474832, -0.1246199, -4.7545, 1, 1, 1, 1, 1,
-0.01440943, 1.037129, -0.4820003, 0, 0, 1, 1, 1,
-0.01170741, -0.1589916, -0.2187445, 1, 0, 0, 1, 1,
-0.01056349, 0.2076005, -0.9384371, 1, 0, 0, 1, 1,
-0.01028016, -0.5633695, -5.343852, 1, 0, 0, 1, 1,
-0.006899646, 0.02939672, -0.04154758, 1, 0, 0, 1, 1,
-0.00351362, -0.1044487, -4.344729, 1, 0, 0, 1, 1,
0.004551609, 1.241095, -1.271495, 0, 0, 0, 1, 1,
0.005094169, -0.1266906, 2.825506, 0, 0, 0, 1, 1,
0.007131612, 1.31454, -1.011662, 0, 0, 0, 1, 1,
0.008628487, -0.1377712, 3.287825, 0, 0, 0, 1, 1,
0.009408153, -0.5411171, 3.907666, 0, 0, 0, 1, 1,
0.01032694, 0.7200706, -0.3010468, 0, 0, 0, 1, 1,
0.01281713, -1.072128, 3.728231, 0, 0, 0, 1, 1,
0.01579446, 2.418463, -0.0382633, 1, 1, 1, 1, 1,
0.01582411, 0.7931013, -0.3807374, 1, 1, 1, 1, 1,
0.01722719, 1.518264, 0.318953, 1, 1, 1, 1, 1,
0.01744264, -0.07703567, 2.523263, 1, 1, 1, 1, 1,
0.0181222, 1.010476, -0.2762845, 1, 1, 1, 1, 1,
0.01951995, 1.593378, 0.204442, 1, 1, 1, 1, 1,
0.02283807, -1.195277, 4.43353, 1, 1, 1, 1, 1,
0.0255272, -0.5646362, 3.520767, 1, 1, 1, 1, 1,
0.02916655, 0.7930139, -0.9699439, 1, 1, 1, 1, 1,
0.03080165, -3.443726, 3.601366, 1, 1, 1, 1, 1,
0.03440481, -0.03326285, 2.828391, 1, 1, 1, 1, 1,
0.03492, 0.1486496, 1.51077, 1, 1, 1, 1, 1,
0.03705544, -0.3260819, 1.890062, 1, 1, 1, 1, 1,
0.04066604, -0.7728649, 3.275857, 1, 1, 1, 1, 1,
0.04413999, -0.5508822, 2.433855, 1, 1, 1, 1, 1,
0.05119037, 0.2799458, -1.264921, 0, 0, 1, 1, 1,
0.05270331, -0.2209615, 2.399363, 1, 0, 0, 1, 1,
0.05318232, -0.3366425, 2.906504, 1, 0, 0, 1, 1,
0.06078784, 0.7569155, 0.397681, 1, 0, 0, 1, 1,
0.06734931, 0.2751647, -1.076104, 1, 0, 0, 1, 1,
0.06950267, 0.2190087, 0.3427992, 1, 0, 0, 1, 1,
0.07415885, 0.1228007, 1.344886, 0, 0, 0, 1, 1,
0.07544415, 0.3563755, 0.9882984, 0, 0, 0, 1, 1,
0.07792891, 0.8762673, -1.926129, 0, 0, 0, 1, 1,
0.07940607, -0.5834606, 4.167946, 0, 0, 0, 1, 1,
0.08522853, -1.071083, 1.978739, 0, 0, 0, 1, 1,
0.08546408, 0.473221, -0.3875477, 0, 0, 0, 1, 1,
0.08948519, -0.4130834, 3.507185, 0, 0, 0, 1, 1,
0.08974586, 1.040364, -0.1551592, 1, 1, 1, 1, 1,
0.0902871, 1.340331, 1.094828, 1, 1, 1, 1, 1,
0.09594475, 0.2450519, -1.802676, 1, 1, 1, 1, 1,
0.09611849, -1.224179, 3.317534, 1, 1, 1, 1, 1,
0.1029179, -0.4860912, 3.422559, 1, 1, 1, 1, 1,
0.1044704, 0.730393, 0.9669994, 1, 1, 1, 1, 1,
0.1046308, 0.2633717, 0.7038216, 1, 1, 1, 1, 1,
0.1066447, -0.2922245, 2.812149, 1, 1, 1, 1, 1,
0.1111986, -0.9405417, 3.833293, 1, 1, 1, 1, 1,
0.1112648, 1.666568, 1.294755, 1, 1, 1, 1, 1,
0.1129045, 1.983875, 0.5351435, 1, 1, 1, 1, 1,
0.1140466, 1.521668, -0.9375684, 1, 1, 1, 1, 1,
0.1140984, -0.6826569, 2.160062, 1, 1, 1, 1, 1,
0.1141023, 0.8581996, -0.8505678, 1, 1, 1, 1, 1,
0.1189844, 0.5739343, 0.6398819, 1, 1, 1, 1, 1,
0.1205171, -1.251031, 2.909956, 0, 0, 1, 1, 1,
0.1302075, 0.09898642, 0.8437825, 1, 0, 0, 1, 1,
0.131572, 0.1677349, 0.4616079, 1, 0, 0, 1, 1,
0.1333369, -2.280002, 2.878096, 1, 0, 0, 1, 1,
0.1385326, -0.5415741, 2.211207, 1, 0, 0, 1, 1,
0.1389583, -0.6408531, 4.635235, 1, 0, 0, 1, 1,
0.1395717, -1.102897, 3.732799, 0, 0, 0, 1, 1,
0.1406392, 1.470046, 0.8795764, 0, 0, 0, 1, 1,
0.1430931, -2.01758, 3.569375, 0, 0, 0, 1, 1,
0.1435535, 0.9679918, 0.6438094, 0, 0, 0, 1, 1,
0.1441586, -1.320433, 4.370285, 0, 0, 0, 1, 1,
0.1450031, 0.0530428, 1.425829, 0, 0, 0, 1, 1,
0.145097, -0.9842756, 2.348758, 0, 0, 0, 1, 1,
0.1485639, -2.19013, 3.143735, 1, 1, 1, 1, 1,
0.1493314, -0.3954295, 1.711972, 1, 1, 1, 1, 1,
0.1503669, -0.01760768, 4.228778, 1, 1, 1, 1, 1,
0.1504295, 1.191842, -0.4870897, 1, 1, 1, 1, 1,
0.1512895, -1.065725, 2.784201, 1, 1, 1, 1, 1,
0.1522162, 1.590135, 0.5831353, 1, 1, 1, 1, 1,
0.1533406, 0.7498613, -0.9357165, 1, 1, 1, 1, 1,
0.153439, 0.8461587, -0.2002014, 1, 1, 1, 1, 1,
0.1588803, 0.5773528, -0.6931865, 1, 1, 1, 1, 1,
0.1598682, -0.3964023, 2.487136, 1, 1, 1, 1, 1,
0.1621764, -0.2714864, 2.954271, 1, 1, 1, 1, 1,
0.1640429, -1.746227, 3.844326, 1, 1, 1, 1, 1,
0.1742719, 1.325972, -1.033947, 1, 1, 1, 1, 1,
0.1777326, -0.2807525, 4.362072, 1, 1, 1, 1, 1,
0.1801303, 2.205169, 0.2405122, 1, 1, 1, 1, 1,
0.180478, -2.162625, 4.965446, 0, 0, 1, 1, 1,
0.1818909, -0.4343791, 3.692046, 1, 0, 0, 1, 1,
0.1829999, -0.08346745, 2.271171, 1, 0, 0, 1, 1,
0.1837925, -0.5804756, 3.150385, 1, 0, 0, 1, 1,
0.1852788, -1.221968, 3.856396, 1, 0, 0, 1, 1,
0.1888778, 1.805843, -1.059845, 1, 0, 0, 1, 1,
0.1943633, -1.57699, 3.560425, 0, 0, 0, 1, 1,
0.1970339, -0.1703779, -0.08528702, 0, 0, 0, 1, 1,
0.1975848, -0.1735616, 0.6779683, 0, 0, 0, 1, 1,
0.2019367, 1.01562, 0.02367236, 0, 0, 0, 1, 1,
0.2020892, 1.078495, -1.400689, 0, 0, 0, 1, 1,
0.2027835, -0.3476136, 2.99922, 0, 0, 0, 1, 1,
0.2064143, -0.1575764, 2.763932, 0, 0, 0, 1, 1,
0.2072472, -0.5119479, 1.731617, 1, 1, 1, 1, 1,
0.2085302, 0.1337262, 1.291489, 1, 1, 1, 1, 1,
0.2110312, 1.018059, 0.8716961, 1, 1, 1, 1, 1,
0.2113873, -1.151812, 2.778859, 1, 1, 1, 1, 1,
0.2120009, -1.295729, 3.355207, 1, 1, 1, 1, 1,
0.213844, 0.5220814, 0.9844573, 1, 1, 1, 1, 1,
0.2151752, -1.141155, 2.274728, 1, 1, 1, 1, 1,
0.2191007, 1.102329, -0.05751039, 1, 1, 1, 1, 1,
0.2242676, -1.512003, 2.808866, 1, 1, 1, 1, 1,
0.2272515, 0.3277911, 0.6616558, 1, 1, 1, 1, 1,
0.2276315, 1.05761, 1.437445, 1, 1, 1, 1, 1,
0.2291194, -0.09474038, 2.590312, 1, 1, 1, 1, 1,
0.2328253, 0.5006618, -0.1559756, 1, 1, 1, 1, 1,
0.2360879, 0.08077892, 1.554268, 1, 1, 1, 1, 1,
0.2363597, 1.165376, -2.004394, 1, 1, 1, 1, 1,
0.2368945, -1.639181, 4.394898, 0, 0, 1, 1, 1,
0.2423305, 1.912782, 0.1899669, 1, 0, 0, 1, 1,
0.2438957, 0.8034556, 2.194111, 1, 0, 0, 1, 1,
0.2470857, -1.470622, 4.77699, 1, 0, 0, 1, 1,
0.2620895, -0.9097423, 1.788021, 1, 0, 0, 1, 1,
0.2625661, -0.1605702, 1.242517, 1, 0, 0, 1, 1,
0.2628712, 0.4274958, 1.373734, 0, 0, 0, 1, 1,
0.2641103, -0.8497099, 2.751134, 0, 0, 0, 1, 1,
0.2645449, -0.1549178, 1.46142, 0, 0, 0, 1, 1,
0.2710308, 0.4601603, 2.124345, 0, 0, 0, 1, 1,
0.2715281, 0.1549611, 2.003241, 0, 0, 0, 1, 1,
0.2738578, 0.6565875, 0.3540928, 0, 0, 0, 1, 1,
0.2784752, -1.953503, 3.109914, 0, 0, 0, 1, 1,
0.2823642, -0.4080969, 1.510896, 1, 1, 1, 1, 1,
0.28265, 0.6951627, 0.4629214, 1, 1, 1, 1, 1,
0.2839327, 0.1790604, 0.1819463, 1, 1, 1, 1, 1,
0.2857947, 0.6071771, 2.678, 1, 1, 1, 1, 1,
0.2872265, 0.9371732, -0.3274533, 1, 1, 1, 1, 1,
0.2882927, 0.3672016, 0.5736117, 1, 1, 1, 1, 1,
0.2919511, -0.549285, 2.910359, 1, 1, 1, 1, 1,
0.2922614, 0.1532847, -1.104779, 1, 1, 1, 1, 1,
0.3021141, 1.129373, 0.1291865, 1, 1, 1, 1, 1,
0.3041135, 0.5841659, 1.688994, 1, 1, 1, 1, 1,
0.3054616, 0.8998996, 0.9619741, 1, 1, 1, 1, 1,
0.3070107, 0.9244256, -0.6757187, 1, 1, 1, 1, 1,
0.3105979, -0.01461097, 0.7971102, 1, 1, 1, 1, 1,
0.3130627, 1.689435, 0.8234193, 1, 1, 1, 1, 1,
0.3148304, 0.2603199, 0.3957941, 1, 1, 1, 1, 1,
0.3148346, 0.8434101, 0.7390175, 0, 0, 1, 1, 1,
0.3158445, 0.3129984, 1.640618, 1, 0, 0, 1, 1,
0.3158672, 0.445749, 0.6157711, 1, 0, 0, 1, 1,
0.3182828, -1.471461, 2.651959, 1, 0, 0, 1, 1,
0.3212007, -0.4060554, 2.384548, 1, 0, 0, 1, 1,
0.3319195, 1.139177, 0.705961, 1, 0, 0, 1, 1,
0.3375466, 0.205538, 0.8280659, 0, 0, 0, 1, 1,
0.3404502, -1.343767, 0.8700457, 0, 0, 0, 1, 1,
0.3450983, 0.9854482, 1.31836, 0, 0, 0, 1, 1,
0.3512875, 1.370065, 0.2868484, 0, 0, 0, 1, 1,
0.3553378, -1.053849, 2.159051, 0, 0, 0, 1, 1,
0.3555445, 0.5659559, 0.8015954, 0, 0, 0, 1, 1,
0.3568366, -0.3380927, 2.533765, 0, 0, 0, 1, 1,
0.3570493, -2.199459, 3.044804, 1, 1, 1, 1, 1,
0.3588981, -0.3277291, 1.62638, 1, 1, 1, 1, 1,
0.3604812, 0.2146415, 0.778406, 1, 1, 1, 1, 1,
0.3609015, 0.4315212, 0.741545, 1, 1, 1, 1, 1,
0.3624297, 1.603229, 0.3534834, 1, 1, 1, 1, 1,
0.3652837, 1.092549, 0.1204721, 1, 1, 1, 1, 1,
0.3656859, -1.134261, 3.80004, 1, 1, 1, 1, 1,
0.3670705, 1.573843, 0.3029792, 1, 1, 1, 1, 1,
0.3700757, -1.487221, 3.539175, 1, 1, 1, 1, 1,
0.3746984, 0.240491, -0.3256226, 1, 1, 1, 1, 1,
0.3756668, -0.3709797, 2.121949, 1, 1, 1, 1, 1,
0.3764803, -0.3296936, 1.878221, 1, 1, 1, 1, 1,
0.37723, 0.4051642, 1.649865, 1, 1, 1, 1, 1,
0.3772318, 1.676278, 0.7056791, 1, 1, 1, 1, 1,
0.3781778, 0.1549683, 0.03884294, 1, 1, 1, 1, 1,
0.3846862, 1.556342, 1.052569, 0, 0, 1, 1, 1,
0.3883228, 0.4241885, 1.161663, 1, 0, 0, 1, 1,
0.3887474, -1.783203, 2.268464, 1, 0, 0, 1, 1,
0.389375, 1.369005, 0.1416259, 1, 0, 0, 1, 1,
0.3915871, 1.152841, 0.4524893, 1, 0, 0, 1, 1,
0.3916279, -2.091777, 3.4803, 1, 0, 0, 1, 1,
0.3926864, -1.867017, 2.322113, 0, 0, 0, 1, 1,
0.3940549, -1.505204, 0.9577366, 0, 0, 0, 1, 1,
0.3946461, -0.6339041, 2.856056, 0, 0, 0, 1, 1,
0.4016111, -1.368838, 3.978546, 0, 0, 0, 1, 1,
0.4018096, 1.009913, -0.1938855, 0, 0, 0, 1, 1,
0.4053136, -0.8954167, 2.254524, 0, 0, 0, 1, 1,
0.4084307, -0.2625012, 3.425346, 0, 0, 0, 1, 1,
0.4102498, 0.01428906, 1.676196, 1, 1, 1, 1, 1,
0.413114, -1.344635, 1.316329, 1, 1, 1, 1, 1,
0.4151064, -0.1333181, 1.920889, 1, 1, 1, 1, 1,
0.4166949, -1.737822, 2.077329, 1, 1, 1, 1, 1,
0.4168859, 0.1296424, 0.2473736, 1, 1, 1, 1, 1,
0.4229143, 0.4797349, 0.2964816, 1, 1, 1, 1, 1,
0.4250395, 0.6586709, 0.7238069, 1, 1, 1, 1, 1,
0.4330588, -1.212932, 0.45286, 1, 1, 1, 1, 1,
0.4332874, 1.294684, 0.1176681, 1, 1, 1, 1, 1,
0.4436449, 0.07294708, 0.9968129, 1, 1, 1, 1, 1,
0.4468002, 1.566042, 0.04407283, 1, 1, 1, 1, 1,
0.4574247, -0.1754088, 0.4408841, 1, 1, 1, 1, 1,
0.4580557, 0.2221044, 0.6966404, 1, 1, 1, 1, 1,
0.4589838, 0.9871014, 1.018066, 1, 1, 1, 1, 1,
0.4606871, 0.9334227, 0.8467805, 1, 1, 1, 1, 1,
0.4617588, 1.286862, -0.9368598, 0, 0, 1, 1, 1,
0.4637951, 1.313872, -0.4696557, 1, 0, 0, 1, 1,
0.4638297, -0.9695516, 2.834515, 1, 0, 0, 1, 1,
0.4668476, 1.480773, 0.4422959, 1, 0, 0, 1, 1,
0.4768415, 1.527701, -1.457376, 1, 0, 0, 1, 1,
0.4791805, -0.02889647, 0.736291, 1, 0, 0, 1, 1,
0.4828383, 1.28044, -1.237625, 0, 0, 0, 1, 1,
0.4849305, 0.6906393, 1.365114, 0, 0, 0, 1, 1,
0.4891004, 1.47092, -1.433027, 0, 0, 0, 1, 1,
0.4894333, 0.2665163, 0.43858, 0, 0, 0, 1, 1,
0.4953923, -1.004557, 1.95832, 0, 0, 0, 1, 1,
0.4973825, 2.366823, -0.9591708, 0, 0, 0, 1, 1,
0.5019248, 0.8786001, 0.2621908, 0, 0, 0, 1, 1,
0.5040327, -1.250029, 1.790324, 1, 1, 1, 1, 1,
0.5055891, -0.04692436, 2.956546, 1, 1, 1, 1, 1,
0.5073608, -0.7997065, 4.083083, 1, 1, 1, 1, 1,
0.5112912, -1.077069, 2.371369, 1, 1, 1, 1, 1,
0.514701, -1.340459, 1.731817, 1, 1, 1, 1, 1,
0.5212908, 0.408709, 0.9794028, 1, 1, 1, 1, 1,
0.5213926, 0.8837934, 0.8322515, 1, 1, 1, 1, 1,
0.5229859, -0.6804984, 1.964988, 1, 1, 1, 1, 1,
0.526575, 1.415463, 0.01656122, 1, 1, 1, 1, 1,
0.5271006, -0.5011209, 0.4944316, 1, 1, 1, 1, 1,
0.5293934, -0.1423273, 2.50286, 1, 1, 1, 1, 1,
0.5312884, 1.422841, 1.147929, 1, 1, 1, 1, 1,
0.5321293, -2.341277, 3.426592, 1, 1, 1, 1, 1,
0.5362294, -0.5608803, 2.081528, 1, 1, 1, 1, 1,
0.5393752, 2.95452, -0.4675792, 1, 1, 1, 1, 1,
0.5425482, 0.4707009, 0.8206351, 0, 0, 1, 1, 1,
0.5445027, 1.266721, 2.845606, 1, 0, 0, 1, 1,
0.5445103, -0.759625, 2.969439, 1, 0, 0, 1, 1,
0.545872, 0.9596725, -0.2495825, 1, 0, 0, 1, 1,
0.5512584, 0.2960034, 1.413922, 1, 0, 0, 1, 1,
0.5513902, 1.211723, 0.5879918, 1, 0, 0, 1, 1,
0.5531759, 0.2109614, 1.410831, 0, 0, 0, 1, 1,
0.5577276, -1.029512, 3.693838, 0, 0, 0, 1, 1,
0.5580401, 0.8153229, 0.6966917, 0, 0, 0, 1, 1,
0.5625924, -0.1269892, 2.846553, 0, 0, 0, 1, 1,
0.5628687, 0.680357, -0.60787, 0, 0, 0, 1, 1,
0.5684294, 1.622752, -0.245847, 0, 0, 0, 1, 1,
0.5695114, 0.7792554, 0.7134656, 0, 0, 0, 1, 1,
0.5718246, 1.688823, -0.9130225, 1, 1, 1, 1, 1,
0.5742798, -0.005423955, 0.9546512, 1, 1, 1, 1, 1,
0.5755711, -0.8875853, 4.424258, 1, 1, 1, 1, 1,
0.5769001, 0.2220855, 0.5974376, 1, 1, 1, 1, 1,
0.5785131, -0.996938, 1.709651, 1, 1, 1, 1, 1,
0.5796444, -1.012139, 1.959893, 1, 1, 1, 1, 1,
0.5805186, -1.807716, 2.941808, 1, 1, 1, 1, 1,
0.5833789, 0.1223323, 2.342299, 1, 1, 1, 1, 1,
0.586103, 1.252986, 0.7256005, 1, 1, 1, 1, 1,
0.5868074, -1.055373, 3.018067, 1, 1, 1, 1, 1,
0.5911019, 0.02281048, -0.2502305, 1, 1, 1, 1, 1,
0.5930945, -2.340021, 2.341989, 1, 1, 1, 1, 1,
0.5943595, -1.47705, 0.1323171, 1, 1, 1, 1, 1,
0.5972485, -0.6198607, 3.453397, 1, 1, 1, 1, 1,
0.6007609, 0.07289398, 2.438921, 1, 1, 1, 1, 1,
0.6049484, 1.906091, 1.535121, 0, 0, 1, 1, 1,
0.610231, -0.563691, 2.55603, 1, 0, 0, 1, 1,
0.6130123, -0.2784552, 0.6820659, 1, 0, 0, 1, 1,
0.6142763, -1.492435, 3.825029, 1, 0, 0, 1, 1,
0.6157408, -0.09287728, 1.780721, 1, 0, 0, 1, 1,
0.6164886, 0.935998, 1.278896, 1, 0, 0, 1, 1,
0.61901, 0.4188155, 0.3048111, 0, 0, 0, 1, 1,
0.6221291, 1.561399, -0.1955301, 0, 0, 0, 1, 1,
0.6239982, -0.3334853, 0.6423051, 0, 0, 0, 1, 1,
0.6270139, -0.3683499, 2.725717, 0, 0, 0, 1, 1,
0.6278003, -0.2404515, 0.9366285, 0, 0, 0, 1, 1,
0.6285029, 0.39189, 0.5141153, 0, 0, 0, 1, 1,
0.6335496, 0.1044197, 3.245929, 0, 0, 0, 1, 1,
0.6399468, 0.03679764, 1.407439, 1, 1, 1, 1, 1,
0.6403555, 0.3231166, 2.003791, 1, 1, 1, 1, 1,
0.6481709, -1.517437, 2.780016, 1, 1, 1, 1, 1,
0.6505512, 1.701213, 0.5424342, 1, 1, 1, 1, 1,
0.651727, 1.410933, -0.3918231, 1, 1, 1, 1, 1,
0.6592755, 1.996343, -0.1095818, 1, 1, 1, 1, 1,
0.6631014, 1.571296, 1.221664, 1, 1, 1, 1, 1,
0.6643252, 1.425767, -0.8418976, 1, 1, 1, 1, 1,
0.6682859, 1.635053, -1.482188, 1, 1, 1, 1, 1,
0.6700953, 0.6510504, 2.220363, 1, 1, 1, 1, 1,
0.6703167, -1.0372, 2.970992, 1, 1, 1, 1, 1,
0.6744965, 0.6294689, 1.809919, 1, 1, 1, 1, 1,
0.674877, 0.7317189, -0.8433083, 1, 1, 1, 1, 1,
0.6773996, -1.022056, 2.425896, 1, 1, 1, 1, 1,
0.6872485, 0.8104758, -1.097969, 1, 1, 1, 1, 1,
0.6919741, -1.139202, 2.122387, 0, 0, 1, 1, 1,
0.6923845, -0.3002251, 2.491965, 1, 0, 0, 1, 1,
0.6926395, 0.07793314, 0.4326074, 1, 0, 0, 1, 1,
0.6955817, -0.1442503, 1.783196, 1, 0, 0, 1, 1,
0.6955965, 1.05581, 0.3740587, 1, 0, 0, 1, 1,
0.6974057, -0.2191059, 3.006851, 1, 0, 0, 1, 1,
0.697867, 1.884192, 1.617288, 0, 0, 0, 1, 1,
0.6992635, -0.6504418, 2.3866, 0, 0, 0, 1, 1,
0.7049407, -0.01602625, 0.7115123, 0, 0, 0, 1, 1,
0.7062947, 0.3197939, 1.812598, 0, 0, 0, 1, 1,
0.709692, -0.9383253, 1.996617, 0, 0, 0, 1, 1,
0.7105373, -1.977157, 1.579739, 0, 0, 0, 1, 1,
0.7143298, 0.4657204, 2.001796, 0, 0, 0, 1, 1,
0.7145551, 0.2167384, 2.04487, 1, 1, 1, 1, 1,
0.7151786, -0.8383698, 2.21306, 1, 1, 1, 1, 1,
0.7173438, 0.4227442, 0.2874803, 1, 1, 1, 1, 1,
0.7209736, -3.42297, 2.01638, 1, 1, 1, 1, 1,
0.72317, 0.4121886, 2.398516, 1, 1, 1, 1, 1,
0.724341, -0.8699597, 2.100467, 1, 1, 1, 1, 1,
0.7248846, 0.1610154, 1.264001, 1, 1, 1, 1, 1,
0.7298123, -0.4064323, 0.8014244, 1, 1, 1, 1, 1,
0.7313143, -0.3926996, 2.438491, 1, 1, 1, 1, 1,
0.7355218, 0.6125652, 1.53601, 1, 1, 1, 1, 1,
0.7359368, 0.0893729, 0.9716486, 1, 1, 1, 1, 1,
0.7397129, 0.8108944, 2.618506, 1, 1, 1, 1, 1,
0.7411183, -0.3101453, 1.387748, 1, 1, 1, 1, 1,
0.7418461, 1.114621, 1.064125, 1, 1, 1, 1, 1,
0.7486485, -0.629742, 1.992856, 1, 1, 1, 1, 1,
0.7536148, 0.5880942, 1.34165, 0, 0, 1, 1, 1,
0.7557821, -0.7870661, 2.11975, 1, 0, 0, 1, 1,
0.756299, -1.538941, 3.204714, 1, 0, 0, 1, 1,
0.7656211, -0.2210352, 1.061752, 1, 0, 0, 1, 1,
0.7838292, 0.7585604, 1.518471, 1, 0, 0, 1, 1,
0.7848498, 0.3967265, 0.6785862, 1, 0, 0, 1, 1,
0.7910764, 0.1444323, 1.935111, 0, 0, 0, 1, 1,
0.7950987, 0.6432657, 1.515484, 0, 0, 0, 1, 1,
0.7970569, 0.4686292, 1.43833, 0, 0, 0, 1, 1,
0.7983845, 0.7733204, 0.5791901, 0, 0, 0, 1, 1,
0.7986925, 0.4880607, 0.4463711, 0, 0, 0, 1, 1,
0.8094376, 1.878799, -0.7695522, 0, 0, 0, 1, 1,
0.809752, -0.4534297, 2.886951, 0, 0, 0, 1, 1,
0.810474, 0.1732548, 0.5167543, 1, 1, 1, 1, 1,
0.819407, -0.5108382, 1.963249, 1, 1, 1, 1, 1,
0.8240098, -0.05579674, 1.869916, 1, 1, 1, 1, 1,
0.8316369, 0.4923027, 1.774538, 1, 1, 1, 1, 1,
0.8344254, 0.09269089, 1.915599, 1, 1, 1, 1, 1,
0.8345476, -0.4612859, 2.841256, 1, 1, 1, 1, 1,
0.8359844, 1.057607, 0.3618284, 1, 1, 1, 1, 1,
0.8411475, 0.3220991, 1.411637, 1, 1, 1, 1, 1,
0.8433947, 0.5950661, 1.543254, 1, 1, 1, 1, 1,
0.8467904, -0.0416472, 0.5403708, 1, 1, 1, 1, 1,
0.8504301, -0.09320901, 0.6355143, 1, 1, 1, 1, 1,
0.8777844, 0.8354058, 1.808519, 1, 1, 1, 1, 1,
0.8780767, 2.036041, 1.627467, 1, 1, 1, 1, 1,
0.8806106, -0.4476826, 2.217991, 1, 1, 1, 1, 1,
0.883253, 0.7568454, 1.121617, 1, 1, 1, 1, 1,
0.8846396, 0.4129174, 1.040658, 0, 0, 1, 1, 1,
0.8852, 1.501531, -0.480231, 1, 0, 0, 1, 1,
0.8895783, 0.1778689, 1.157287, 1, 0, 0, 1, 1,
0.8910015, -1.239321, 1.625471, 1, 0, 0, 1, 1,
0.8935502, -0.2026033, 3.158468, 1, 0, 0, 1, 1,
0.895315, -0.6662082, 0.9369829, 1, 0, 0, 1, 1,
0.9053634, 1.434097, -0.2462504, 0, 0, 0, 1, 1,
0.9106606, -0.4212929, 1.211353, 0, 0, 0, 1, 1,
0.9131073, -1.046671, 3.121711, 0, 0, 0, 1, 1,
0.913312, 1.499079, -0.7327444, 0, 0, 0, 1, 1,
0.9177309, 0.9318711, 0.5656539, 0, 0, 0, 1, 1,
0.9204497, -0.7461778, 1.89309, 0, 0, 0, 1, 1,
0.9216231, -0.878782, 2.655882, 0, 0, 0, 1, 1,
0.9248325, -1.282425, 2.523694, 1, 1, 1, 1, 1,
0.931958, 1.916206, 0.3991276, 1, 1, 1, 1, 1,
0.9368184, -0.3307743, 1.369962, 1, 1, 1, 1, 1,
0.9370003, 1.276019, 0.7456368, 1, 1, 1, 1, 1,
0.9415678, 0.7554064, 2.043375, 1, 1, 1, 1, 1,
0.9456545, -1.626859, 2.74461, 1, 1, 1, 1, 1,
0.9607261, 0.1969693, 0.5897954, 1, 1, 1, 1, 1,
0.9620891, 0.8210247, 0.02786431, 1, 1, 1, 1, 1,
0.9689234, -0.8131869, 0.2296692, 1, 1, 1, 1, 1,
0.9696964, 0.3098743, 0.02723846, 1, 1, 1, 1, 1,
0.9740901, -0.4846466, 2.077916, 1, 1, 1, 1, 1,
0.9751117, 0.4144377, 3.276374, 1, 1, 1, 1, 1,
0.9753088, -0.7884802, 2.880259, 1, 1, 1, 1, 1,
0.9802986, 1.609363, -1.955796, 1, 1, 1, 1, 1,
0.9805817, -1.62396, 3.013821, 1, 1, 1, 1, 1,
0.9924565, 0.9940329, 0.5616303, 0, 0, 1, 1, 1,
0.9950914, -0.6433841, 1.582298, 1, 0, 0, 1, 1,
0.9978672, -1.709301, 3.424482, 1, 0, 0, 1, 1,
0.9992898, -0.8361983, 2.496068, 1, 0, 0, 1, 1,
0.9994367, -1.025243, 2.705474, 1, 0, 0, 1, 1,
1.005391, 1.014172, 0.2907806, 1, 0, 0, 1, 1,
1.007408, 0.2237821, 1.005618, 0, 0, 0, 1, 1,
1.014459, 0.4747217, 0.01932935, 0, 0, 0, 1, 1,
1.023433, 2.140256, 0.4695022, 0, 0, 0, 1, 1,
1.024585, -2.057328, 0.530875, 0, 0, 0, 1, 1,
1.024625, -0.0067061, 2.774882, 0, 0, 0, 1, 1,
1.026947, 1.542586, 0.8841819, 0, 0, 0, 1, 1,
1.028497, 0.2127752, 0.5544695, 0, 0, 0, 1, 1,
1.02908, -2.54347, 4.26637, 1, 1, 1, 1, 1,
1.042044, 0.4572353, 2.270086, 1, 1, 1, 1, 1,
1.049235, -0.4162078, 2.92614, 1, 1, 1, 1, 1,
1.049783, 0.8921337, -0.2204174, 1, 1, 1, 1, 1,
1.051979, -0.4654821, 2.85076, 1, 1, 1, 1, 1,
1.056122, 0.940235, 1.397904, 1, 1, 1, 1, 1,
1.057189, -1.025321, 2.285455, 1, 1, 1, 1, 1,
1.063203, 0.674663, 1.962737, 1, 1, 1, 1, 1,
1.068835, -1.503144, 3.232477, 1, 1, 1, 1, 1,
1.073764, -0.9206179, -0.7552604, 1, 1, 1, 1, 1,
1.074452, 1.28629, 0.3631603, 1, 1, 1, 1, 1,
1.079025, 0.4506104, 1.677739, 1, 1, 1, 1, 1,
1.080537, 1.579982, -0.8008059, 1, 1, 1, 1, 1,
1.082822, -0.2813682, -0.4181934, 1, 1, 1, 1, 1,
1.092058, -1.020486, 4.210377, 1, 1, 1, 1, 1,
1.109007, -0.7778867, 1.964026, 0, 0, 1, 1, 1,
1.11349, -0.1989003, 1.892073, 1, 0, 0, 1, 1,
1.12078, -1.477741, 2.248943, 1, 0, 0, 1, 1,
1.122604, 0.3140049, -0.7648063, 1, 0, 0, 1, 1,
1.125452, -1.349726, 1.4454, 1, 0, 0, 1, 1,
1.132372, -0.487204, 2.545865, 1, 0, 0, 1, 1,
1.133567, -0.3466432, 3.679739, 0, 0, 0, 1, 1,
1.148544, -0.7038765, 2.841952, 0, 0, 0, 1, 1,
1.151307, 2.308126, 0.575289, 0, 0, 0, 1, 1,
1.1537, 0.2499807, 1.791754, 0, 0, 0, 1, 1,
1.154334, 1.077095, 1.394141, 0, 0, 0, 1, 1,
1.15546, 0.3521831, 0.380377, 0, 0, 0, 1, 1,
1.161717, 1.534413, 1.162058, 0, 0, 0, 1, 1,
1.16995, 1.230382, 0.7358054, 1, 1, 1, 1, 1,
1.173406, -1.476738, 2.146196, 1, 1, 1, 1, 1,
1.181224, -1.101604, 2.358684, 1, 1, 1, 1, 1,
1.1817, -1.849211, 3.226048, 1, 1, 1, 1, 1,
1.183772, -0.8054363, 2.395681, 1, 1, 1, 1, 1,
1.185465, 1.259075, 1.115729, 1, 1, 1, 1, 1,
1.195272, -0.2507928, 0.5811424, 1, 1, 1, 1, 1,
1.195497, 0.6825587, 1.388396, 1, 1, 1, 1, 1,
1.208156, 1.999821, 1.086295, 1, 1, 1, 1, 1,
1.220616, -0.9061378, 3.073686, 1, 1, 1, 1, 1,
1.222812, 1.532765, 0.5552484, 1, 1, 1, 1, 1,
1.224222, 1.193749, 0.5807273, 1, 1, 1, 1, 1,
1.22753, 0.3410254, 1.83435, 1, 1, 1, 1, 1,
1.228087, -0.4743711, 1.660481, 1, 1, 1, 1, 1,
1.236389, -0.04363585, 2.052914, 1, 1, 1, 1, 1,
1.236504, 1.760616, 0.9206138, 0, 0, 1, 1, 1,
1.245737, 0.6586014, 0.6048269, 1, 0, 0, 1, 1,
1.248665, -0.2699115, 0.1117504, 1, 0, 0, 1, 1,
1.251428, 0.6729633, 2.742775, 1, 0, 0, 1, 1,
1.267088, 1.860189, 2.259073, 1, 0, 0, 1, 1,
1.270793, -0.09275655, 2.039989, 1, 0, 0, 1, 1,
1.277361, 0.05868902, 2.914386, 0, 0, 0, 1, 1,
1.277541, 2.286607, 0.04745462, 0, 0, 0, 1, 1,
1.27927, 0.1965747, 2.124183, 0, 0, 0, 1, 1,
1.294114, -1.192835, 1.998897, 0, 0, 0, 1, 1,
1.311884, 1.573441, 1.462946, 0, 0, 0, 1, 1,
1.316667, 1.691176, 0.02740117, 0, 0, 0, 1, 1,
1.319281, 0.9484946, -0.1569906, 0, 0, 0, 1, 1,
1.319514, -1.93507, 1.987385, 1, 1, 1, 1, 1,
1.320166, -0.8256063, 1.89458, 1, 1, 1, 1, 1,
1.32683, 0.1102118, 1.525407, 1, 1, 1, 1, 1,
1.330573, -0.7803752, 1.0948, 1, 1, 1, 1, 1,
1.339946, -2.069368, 4.766565, 1, 1, 1, 1, 1,
1.341885, -0.07121319, 0.5360906, 1, 1, 1, 1, 1,
1.346061, 0.09768462, 0.8598992, 1, 1, 1, 1, 1,
1.347834, 0.8217064, 2.041304, 1, 1, 1, 1, 1,
1.350745, 0.1124479, 1.286772, 1, 1, 1, 1, 1,
1.386612, -1.522375, 4.236501, 1, 1, 1, 1, 1,
1.388324, 0.214876, 0.4438066, 1, 1, 1, 1, 1,
1.390689, -0.0400235, 2.173166, 1, 1, 1, 1, 1,
1.391579, 0.0263655, 2.341434, 1, 1, 1, 1, 1,
1.395197, 0.4924322, 1.245896, 1, 1, 1, 1, 1,
1.400648, -1.158288, 1.898362, 1, 1, 1, 1, 1,
1.402474, 1.333476, 0.7714728, 0, 0, 1, 1, 1,
1.403904, -0.1587018, -0.1107477, 1, 0, 0, 1, 1,
1.44361, -1.300758, 2.504588, 1, 0, 0, 1, 1,
1.448302, -0.6464226, 2.287027, 1, 0, 0, 1, 1,
1.453976, 1.218623, 1.33489, 1, 0, 0, 1, 1,
1.45508, -1.292261, 2.027318, 1, 0, 0, 1, 1,
1.475425, -0.7197392, 3.163587, 0, 0, 0, 1, 1,
1.48481, -1.075088, 3.496196, 0, 0, 0, 1, 1,
1.496458, 0.8655825, 0.3283745, 0, 0, 0, 1, 1,
1.51584, -0.1430805, 1.877677, 0, 0, 0, 1, 1,
1.530243, 0.3086548, 1.500551, 0, 0, 0, 1, 1,
1.532168, 0.6084967, -0.1319159, 0, 0, 0, 1, 1,
1.53248, -2.351763, 1.994318, 0, 0, 0, 1, 1,
1.534558, 0.623565, -0.3687896, 1, 1, 1, 1, 1,
1.598741, 0.9974292, -0.94292, 1, 1, 1, 1, 1,
1.603056, 0.492097, 0.1102959, 1, 1, 1, 1, 1,
1.614005, 0.6381756, 1.524138, 1, 1, 1, 1, 1,
1.635592, -0.970751, 1.872473, 1, 1, 1, 1, 1,
1.642494, 1.54286, 1.193666, 1, 1, 1, 1, 1,
1.652072, 1.47173, -0.2434603, 1, 1, 1, 1, 1,
1.66046, 0.4591974, 2.316386, 1, 1, 1, 1, 1,
1.66197, -0.1626364, 1.847548, 1, 1, 1, 1, 1,
1.66425, 2.561906, 0.4647728, 1, 1, 1, 1, 1,
1.667238, -0.5590348, 2.802, 1, 1, 1, 1, 1,
1.695127, -0.04424451, 0.9733408, 1, 1, 1, 1, 1,
1.706439, 1.502715, -1.916939, 1, 1, 1, 1, 1,
1.719593, -1.461414, 2.564484, 1, 1, 1, 1, 1,
1.723336, -0.04594988, 2.727598, 1, 1, 1, 1, 1,
1.725641, 1.487928, 1.253221, 0, 0, 1, 1, 1,
1.726267, 0.9588277, 2.256765, 1, 0, 0, 1, 1,
1.741745, -1.590592, 2.293125, 1, 0, 0, 1, 1,
1.741867, -1.304083, 2.084401, 1, 0, 0, 1, 1,
1.754367, 0.0278284, 1.489035, 1, 0, 0, 1, 1,
1.760495, 1.406525, 1.889323, 1, 0, 0, 1, 1,
1.769966, 0.2304694, 1.610803, 0, 0, 0, 1, 1,
1.78358, 0.2596906, 1.744398, 0, 0, 0, 1, 1,
1.792276, -0.2679812, 1.254045, 0, 0, 0, 1, 1,
1.796899, -0.4469093, 0.5283096, 0, 0, 0, 1, 1,
1.83059, 1.359863, 2.261712, 0, 0, 0, 1, 1,
1.852455, 0.81467, 0.05315638, 0, 0, 0, 1, 1,
1.868647, -0.2030944, 2.595155, 0, 0, 0, 1, 1,
1.870059, -0.4515179, 3.473875, 1, 1, 1, 1, 1,
1.871041, 0.1792669, -0.1363136, 1, 1, 1, 1, 1,
1.873271, 1.221114, 1.474325, 1, 1, 1, 1, 1,
1.889261, -0.105797, 2.012751, 1, 1, 1, 1, 1,
1.893628, 0.7993544, 2.033579, 1, 1, 1, 1, 1,
1.894481, -2.513317, 2.618127, 1, 1, 1, 1, 1,
1.911868, -0.3373858, 1.949331, 1, 1, 1, 1, 1,
1.915021, 0.09662952, 1.179252, 1, 1, 1, 1, 1,
1.936957, 0.5101385, -0.229062, 1, 1, 1, 1, 1,
1.947663, -1.31694, 3.005986, 1, 1, 1, 1, 1,
1.960641, -0.9345127, 2.184891, 1, 1, 1, 1, 1,
1.97673, 0.496541, 0.3664533, 1, 1, 1, 1, 1,
1.986164, 0.6234243, -0.2820461, 1, 1, 1, 1, 1,
1.99202, 0.4608496, 1.848843, 1, 1, 1, 1, 1,
2.0136, 0.8474544, 1.863586, 1, 1, 1, 1, 1,
2.021065, 0.7210967, 0.6116027, 0, 0, 1, 1, 1,
2.050709, 1.375896, -1.909181, 1, 0, 0, 1, 1,
2.061189, -0.1805133, 1.769115, 1, 0, 0, 1, 1,
2.070863, 1.20795, 0.8082436, 1, 0, 0, 1, 1,
2.111961, -0.219505, 2.617203, 1, 0, 0, 1, 1,
2.183022, -0.7243695, 2.472732, 1, 0, 0, 1, 1,
2.210134, -1.366416, 2.680387, 0, 0, 0, 1, 1,
2.242807, 1.936761, -0.3912182, 0, 0, 0, 1, 1,
2.249096, 0.01908655, 1.221543, 0, 0, 0, 1, 1,
2.250384, 1.477298, 1.532456, 0, 0, 0, 1, 1,
2.293758, 0.4195842, 2.935307, 0, 0, 0, 1, 1,
2.303991, -2.619192, 4.194071, 0, 0, 0, 1, 1,
2.420036, 0.668245, 1.839153, 0, 0, 0, 1, 1,
2.557331, -0.8099369, 2.595765, 1, 1, 1, 1, 1,
2.60491, -0.4379405, 1.434816, 1, 1, 1, 1, 1,
2.676031, 1.199404, 0.468112, 1, 1, 1, 1, 1,
2.73431, -1.205312, 1.836863, 1, 1, 1, 1, 1,
2.770789, 0.602457, 1.120516, 1, 1, 1, 1, 1,
2.782775, -0.472676, 0.4571458, 1, 1, 1, 1, 1,
3.112332, 1.339557, 0.9399204, 1, 1, 1, 1, 1
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
var radius = 9.584242;
var distance = 33.66425;
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
mvMatrix.translate( 0.1092086, -0.05231237, 0.189203 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.66425);
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
