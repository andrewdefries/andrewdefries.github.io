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
-2.886702, 1.765631, -0.8488182, 1, 0, 0, 1,
-2.83329, -0.3136801, -0.7185507, 1, 0.007843138, 0, 1,
-2.650749, 0.3838819, -0.07564819, 1, 0.01176471, 0, 1,
-2.575452, 1.151552, 0.2190824, 1, 0.01960784, 0, 1,
-2.540404, 1.225279, -1.191089, 1, 0.02352941, 0, 1,
-2.5093, -1.26035, -2.160261, 1, 0.03137255, 0, 1,
-2.310968, 1.052112, -1.968716, 1, 0.03529412, 0, 1,
-2.299723, 0.2404185, -1.965499, 1, 0.04313726, 0, 1,
-2.25242, 0.007765918, -0.4380787, 1, 0.04705882, 0, 1,
-2.199, -2.243542, -0.88278, 1, 0.05490196, 0, 1,
-2.198321, 1.272264, -0.6433735, 1, 0.05882353, 0, 1,
-2.158996, -0.001746228, -0.6348138, 1, 0.06666667, 0, 1,
-2.142992, 0.79295, -1.626039, 1, 0.07058824, 0, 1,
-2.139751, -0.9516421, -2.653784, 1, 0.07843138, 0, 1,
-2.126168, -0.2153565, -1.638403, 1, 0.08235294, 0, 1,
-2.117572, 0.05607024, -3.189679, 1, 0.09019608, 0, 1,
-2.101804, -0.07548908, -1.14586, 1, 0.09411765, 0, 1,
-2.050525, -0.1654654, -2.229931, 1, 0.1019608, 0, 1,
-1.938325, -0.7977265, -1.693882, 1, 0.1098039, 0, 1,
-1.922584, 1.557097, 0.5560669, 1, 0.1137255, 0, 1,
-1.911654, 0.3060869, -2.502638, 1, 0.1215686, 0, 1,
-1.87751, 0.2969943, -0.09426881, 1, 0.1254902, 0, 1,
-1.867012, 0.6237267, -1.214906, 1, 0.1333333, 0, 1,
-1.86533, -0.8041266, -0.9680793, 1, 0.1372549, 0, 1,
-1.83813, 0.2489574, -2.185624, 1, 0.145098, 0, 1,
-1.825673, -1.748944, -2.873788, 1, 0.1490196, 0, 1,
-1.825503, -1.341553, -1.459886, 1, 0.1568628, 0, 1,
-1.804714, 0.04688824, -0.07911578, 1, 0.1607843, 0, 1,
-1.798114, -1.107882, -2.579596, 1, 0.1686275, 0, 1,
-1.78604, -0.1461555, -2.08284, 1, 0.172549, 0, 1,
-1.785405, -0.2806811, -2.051854, 1, 0.1803922, 0, 1,
-1.758483, -1.565918, -3.589246, 1, 0.1843137, 0, 1,
-1.749493, -0.7207384, -0.1342455, 1, 0.1921569, 0, 1,
-1.74845, 1.111979, 1.67755, 1, 0.1960784, 0, 1,
-1.734946, 0.4380826, -2.324077, 1, 0.2039216, 0, 1,
-1.724686, -0.1737991, 0.7214158, 1, 0.2117647, 0, 1,
-1.722758, 1.417079, -0.9346249, 1, 0.2156863, 0, 1,
-1.718016, 0.592016, -2.329095, 1, 0.2235294, 0, 1,
-1.7092, -0.5680343, -2.454319, 1, 0.227451, 0, 1,
-1.68523, 0.5406144, -1.125147, 1, 0.2352941, 0, 1,
-1.684729, 0.7622253, -0.3525453, 1, 0.2392157, 0, 1,
-1.643383, 0.8637305, -1.645148, 1, 0.2470588, 0, 1,
-1.633776, 1.196095, -2.597501, 1, 0.2509804, 0, 1,
-1.631705, 0.6356499, -2.271892, 1, 0.2588235, 0, 1,
-1.623995, 0.004270724, -2.515394, 1, 0.2627451, 0, 1,
-1.61474, 1.911783, -0.1706524, 1, 0.2705882, 0, 1,
-1.593921, -1.042802, -1.95887, 1, 0.2745098, 0, 1,
-1.587745, 0.7328519, 0.07109856, 1, 0.282353, 0, 1,
-1.567354, 0.5385323, -1.283437, 1, 0.2862745, 0, 1,
-1.565809, 0.5696065, -0.6732319, 1, 0.2941177, 0, 1,
-1.565178, 1.253938, -0.1189803, 1, 0.3019608, 0, 1,
-1.546056, 1.060062, -1.332823, 1, 0.3058824, 0, 1,
-1.541148, -1.110476, -2.209924, 1, 0.3137255, 0, 1,
-1.525039, 0.1436943, -1.893161, 1, 0.3176471, 0, 1,
-1.524444, -1.659407, -1.559309, 1, 0.3254902, 0, 1,
-1.521478, -0.274573, 0.6339511, 1, 0.3294118, 0, 1,
-1.503616, -0.6462688, -2.808169, 1, 0.3372549, 0, 1,
-1.498751, 1.057622, -1.612897, 1, 0.3411765, 0, 1,
-1.473773, 2.036242, -1.250983, 1, 0.3490196, 0, 1,
-1.468993, 1.036097, -0.8531185, 1, 0.3529412, 0, 1,
-1.455451, 0.9072922, -1.108019, 1, 0.3607843, 0, 1,
-1.452502, 0.4790457, -1.626475, 1, 0.3647059, 0, 1,
-1.430748, -0.01377334, -1.847512, 1, 0.372549, 0, 1,
-1.43018, 0.504484, -3.734273, 1, 0.3764706, 0, 1,
-1.424357, 0.4953195, -1.940889, 1, 0.3843137, 0, 1,
-1.411293, -1.464447, -0.9087409, 1, 0.3882353, 0, 1,
-1.409913, 1.126265, -1.255637, 1, 0.3960784, 0, 1,
-1.380109, 0.8976784, -1.170893, 1, 0.4039216, 0, 1,
-1.374258, 0.5563484, -2.044864, 1, 0.4078431, 0, 1,
-1.364766, -0.03442404, -1.057827, 1, 0.4156863, 0, 1,
-1.355276, 0.4856605, -2.366516, 1, 0.4196078, 0, 1,
-1.354227, -0.1012935, -1.111121, 1, 0.427451, 0, 1,
-1.348628, -1.527829, -2.728753, 1, 0.4313726, 0, 1,
-1.337922, -1.100885, -4.394704, 1, 0.4392157, 0, 1,
-1.336761, 0.5572234, -0.2536347, 1, 0.4431373, 0, 1,
-1.335655, -0.1471433, -4.191491, 1, 0.4509804, 0, 1,
-1.329111, -0.6241533, -1.093811, 1, 0.454902, 0, 1,
-1.325938, 0.9566233, -0.437096, 1, 0.4627451, 0, 1,
-1.323471, 1.043586, -2.176919, 1, 0.4666667, 0, 1,
-1.317776, 1.005021, -2.08313, 1, 0.4745098, 0, 1,
-1.314285, -0.6487312, -0.5615748, 1, 0.4784314, 0, 1,
-1.311106, -0.4474819, -0.9206409, 1, 0.4862745, 0, 1,
-1.310168, -0.5647549, -2.597505, 1, 0.4901961, 0, 1,
-1.30769, -0.245151, -0.8759736, 1, 0.4980392, 0, 1,
-1.306775, 0.3887966, -1.276758, 1, 0.5058824, 0, 1,
-1.306257, 0.8633985, -0.9958526, 1, 0.509804, 0, 1,
-1.301579, -1.42359, -1.562477, 1, 0.5176471, 0, 1,
-1.300368, -2.576883, -2.102943, 1, 0.5215687, 0, 1,
-1.296598, -0.4901535, -2.565211, 1, 0.5294118, 0, 1,
-1.275568, 0.4842197, -0.1714903, 1, 0.5333334, 0, 1,
-1.272632, -0.6017339, -2.552236, 1, 0.5411765, 0, 1,
-1.270355, 1.219539, -1.892665, 1, 0.5450981, 0, 1,
-1.261131, -0.1620517, -1.571411, 1, 0.5529412, 0, 1,
-1.252985, 1.920551, 0.3262219, 1, 0.5568628, 0, 1,
-1.251307, -0.07654217, -1.077174, 1, 0.5647059, 0, 1,
-1.246856, 0.948921, -1.470536, 1, 0.5686275, 0, 1,
-1.242707, 0.1687498, 0.002256269, 1, 0.5764706, 0, 1,
-1.238901, 0.2427768, -1.139689, 1, 0.5803922, 0, 1,
-1.238155, -1.062032, -1.667468, 1, 0.5882353, 0, 1,
-1.219879, -1.382314, -4.293446, 1, 0.5921569, 0, 1,
-1.208341, -1.143125, -2.26158, 1, 0.6, 0, 1,
-1.196224, -0.3382413, -2.258205, 1, 0.6078432, 0, 1,
-1.187478, -0.1633205, -2.041463, 1, 0.6117647, 0, 1,
-1.177432, 1.385148, -0.3349731, 1, 0.6196079, 0, 1,
-1.171253, -0.388016, -2.183358, 1, 0.6235294, 0, 1,
-1.168569, -0.7766606, -2.892437, 1, 0.6313726, 0, 1,
-1.166779, -0.2701114, -2.521291, 1, 0.6352941, 0, 1,
-1.1652, 2.090109, -0.6338958, 1, 0.6431373, 0, 1,
-1.165186, 2.479843, -1.072343, 1, 0.6470588, 0, 1,
-1.162014, -0.8864561, -2.415147, 1, 0.654902, 0, 1,
-1.161888, -0.3814404, -2.13223, 1, 0.6588235, 0, 1,
-1.156991, -0.4001667, -1.389096, 1, 0.6666667, 0, 1,
-1.145698, -0.5195268, -2.599367, 1, 0.6705883, 0, 1,
-1.144685, -1.19282, -1.84078, 1, 0.6784314, 0, 1,
-1.143177, 1.044574, -1.051753, 1, 0.682353, 0, 1,
-1.141643, 0.1413852, -2.538933, 1, 0.6901961, 0, 1,
-1.1399, 1.960213, -1.360573, 1, 0.6941177, 0, 1,
-1.125979, 0.2683608, -1.511402, 1, 0.7019608, 0, 1,
-1.11964, 1.111958, -0.3912315, 1, 0.7098039, 0, 1,
-1.106214, 0.8812267, -0.2472671, 1, 0.7137255, 0, 1,
-1.1029, 1.678909, -0.7729788, 1, 0.7215686, 0, 1,
-1.10124, 0.7319002, -0.1451705, 1, 0.7254902, 0, 1,
-1.101231, 1.33783, 0.003847733, 1, 0.7333333, 0, 1,
-1.100679, 0.274037, -1.515303, 1, 0.7372549, 0, 1,
-1.094334, 0.9055754, -0.3817888, 1, 0.7450981, 0, 1,
-1.08047, 0.119735, -2.541396, 1, 0.7490196, 0, 1,
-1.080181, -0.2145806, 0.052626, 1, 0.7568628, 0, 1,
-1.07903, 0.4063116, -0.4251474, 1, 0.7607843, 0, 1,
-1.073922, 0.6653127, -2.163767, 1, 0.7686275, 0, 1,
-1.070729, -0.2689723, -1.752265, 1, 0.772549, 0, 1,
-1.070513, -0.6634786, -3.537395, 1, 0.7803922, 0, 1,
-1.069323, -1.877068, -2.246279, 1, 0.7843137, 0, 1,
-1.068195, 2.381818, -0.3266606, 1, 0.7921569, 0, 1,
-1.064146, 1.265537, -0.7800424, 1, 0.7960784, 0, 1,
-1.059738, -1.091352, -2.654928, 1, 0.8039216, 0, 1,
-1.057829, 1.410178, -1.546457, 1, 0.8117647, 0, 1,
-1.050439, -0.1705006, -2.222649, 1, 0.8156863, 0, 1,
-1.044094, 1.444602, -0.2510699, 1, 0.8235294, 0, 1,
-1.042452, -1.210932, -1.500288, 1, 0.827451, 0, 1,
-1.039326, 0.1535079, -1.205613, 1, 0.8352941, 0, 1,
-1.035447, -1.128172, -0.7200299, 1, 0.8392157, 0, 1,
-1.034008, -1.26031, -3.145373, 1, 0.8470588, 0, 1,
-1.025018, -0.4723657, -2.341224, 1, 0.8509804, 0, 1,
-1.024243, -0.5236109, -1.27921, 1, 0.8588235, 0, 1,
-1.022181, 0.7354353, -1.326954, 1, 0.8627451, 0, 1,
-1.022108, 0.6288936, -0.7463571, 1, 0.8705882, 0, 1,
-1.02189, -1.562697, -2.467386, 1, 0.8745098, 0, 1,
-1.017369, -1.278536, -2.361515, 1, 0.8823529, 0, 1,
-1.016672, -0.505116, -1.810585, 1, 0.8862745, 0, 1,
-1.01388, 0.6254587, -1.218981, 1, 0.8941177, 0, 1,
-1.013122, -3.081399, -1.927114, 1, 0.8980392, 0, 1,
-1.010354, 0.4320184, -2.22834, 1, 0.9058824, 0, 1,
-0.9909354, 0.6118262, -2.728703, 1, 0.9137255, 0, 1,
-0.985471, 1.150499, -0.25193, 1, 0.9176471, 0, 1,
-0.983011, 0.522452, 0.3801296, 1, 0.9254902, 0, 1,
-0.9782356, -1.083379, -0.476376, 1, 0.9294118, 0, 1,
-0.9751749, -0.9444311, -3.411235, 1, 0.9372549, 0, 1,
-0.9722183, -0.6256312, -3.441868, 1, 0.9411765, 0, 1,
-0.9701958, -0.7115442, -3.458866, 1, 0.9490196, 0, 1,
-0.9659042, -0.2494072, -2.40245, 1, 0.9529412, 0, 1,
-0.9640872, -0.6847229, -1.733421, 1, 0.9607843, 0, 1,
-0.9634986, -0.2760232, -1.473391, 1, 0.9647059, 0, 1,
-0.9601353, 1.133212, -1.281963, 1, 0.972549, 0, 1,
-0.9587227, -0.5214637, -2.083652, 1, 0.9764706, 0, 1,
-0.9584668, 1.495167, -0.5169057, 1, 0.9843137, 0, 1,
-0.9535834, 0.525847, -0.2589894, 1, 0.9882353, 0, 1,
-0.9467211, -0.6923159, -2.516823, 1, 0.9960784, 0, 1,
-0.9369129, -0.1927139, -1.266782, 0.9960784, 1, 0, 1,
-0.9350837, 2.451267, 0.6473621, 0.9921569, 1, 0, 1,
-0.9303001, 0.7019641, 0.06435374, 0.9843137, 1, 0, 1,
-0.9258078, -1.724392, -4.028141, 0.9803922, 1, 0, 1,
-0.9235522, -2.113279, -4.431751, 0.972549, 1, 0, 1,
-0.9231858, -1.551791, -3.379858, 0.9686275, 1, 0, 1,
-0.9176342, 0.4111647, -1.551358, 0.9607843, 1, 0, 1,
-0.9136766, -1.425675, -2.820241, 0.9568627, 1, 0, 1,
-0.9071911, -0.7000813, -3.072808, 0.9490196, 1, 0, 1,
-0.9002739, -0.3499126, -2.164011, 0.945098, 1, 0, 1,
-0.8977975, 0.692811, -0.7232344, 0.9372549, 1, 0, 1,
-0.8954495, -0.8894548, -1.851238, 0.9333333, 1, 0, 1,
-0.8926387, -1.642401, -2.521396, 0.9254902, 1, 0, 1,
-0.8920608, -0.460547, -1.312972, 0.9215686, 1, 0, 1,
-0.8907517, -0.3534596, -0.352973, 0.9137255, 1, 0, 1,
-0.8861415, -0.2954069, -3.148268, 0.9098039, 1, 0, 1,
-0.8859, 0.6078158, -0.3694758, 0.9019608, 1, 0, 1,
-0.8738322, 0.6052595, -1.117122, 0.8941177, 1, 0, 1,
-0.8668589, 0.8600639, -1.850532, 0.8901961, 1, 0, 1,
-0.8634357, 0.8961387, -0.6051154, 0.8823529, 1, 0, 1,
-0.8607555, -0.2101999, -2.653483, 0.8784314, 1, 0, 1,
-0.8606386, -0.3427343, -2.132502, 0.8705882, 1, 0, 1,
-0.841637, -0.9138039, -1.410277, 0.8666667, 1, 0, 1,
-0.8388268, -0.7221198, -2.023941, 0.8588235, 1, 0, 1,
-0.8377993, 0.694632, -1.012219, 0.854902, 1, 0, 1,
-0.8315901, -0.1761551, -1.984407, 0.8470588, 1, 0, 1,
-0.8264809, 0.527335, -0.3305376, 0.8431373, 1, 0, 1,
-0.8193511, -0.7192454, -3.64662, 0.8352941, 1, 0, 1,
-0.81843, 0.552381, -0.08770532, 0.8313726, 1, 0, 1,
-0.8153715, 2.650669, 1.019119, 0.8235294, 1, 0, 1,
-0.8151284, -0.0683868, -1.873389, 0.8196079, 1, 0, 1,
-0.8143713, 0.332844, 0.4106728, 0.8117647, 1, 0, 1,
-0.8126151, -1.214597, -2.790987, 0.8078431, 1, 0, 1,
-0.8107941, -0.5796831, -2.43477, 0.8, 1, 0, 1,
-0.8107796, 3.199055, 0.5142298, 0.7921569, 1, 0, 1,
-0.8080909, -1.029114, -2.17162, 0.7882353, 1, 0, 1,
-0.8052874, 0.8941542, 0.03271365, 0.7803922, 1, 0, 1,
-0.8048661, -0.2131991, -3.031996, 0.7764706, 1, 0, 1,
-0.799738, -0.03606083, -1.580971, 0.7686275, 1, 0, 1,
-0.794452, -1.370135, -3.8098, 0.7647059, 1, 0, 1,
-0.7941287, -0.8290848, -0.3836124, 0.7568628, 1, 0, 1,
-0.7902904, 0.01889373, -2.11043, 0.7529412, 1, 0, 1,
-0.7881101, 0.08824982, -0.3652422, 0.7450981, 1, 0, 1,
-0.7811943, -0.4482315, -2.390115, 0.7411765, 1, 0, 1,
-0.7744766, -0.5677277, -2.902869, 0.7333333, 1, 0, 1,
-0.7736759, -1.029615, -1.759215, 0.7294118, 1, 0, 1,
-0.7716581, 0.447447, -1.32984, 0.7215686, 1, 0, 1,
-0.770106, -0.3400025, -1.796372, 0.7176471, 1, 0, 1,
-0.7693492, 1.484766, -0.8631009, 0.7098039, 1, 0, 1,
-0.7633892, 1.449859, -0.8678309, 0.7058824, 1, 0, 1,
-0.761386, 0.7196341, 0.09358711, 0.6980392, 1, 0, 1,
-0.7609382, -0.9359515, -3.24255, 0.6901961, 1, 0, 1,
-0.7596591, 1.156488, -1.638245, 0.6862745, 1, 0, 1,
-0.758077, -0.4474303, -0.448649, 0.6784314, 1, 0, 1,
-0.7578393, 1.085131, -0.9652784, 0.6745098, 1, 0, 1,
-0.749622, -0.4535996, -0.1340442, 0.6666667, 1, 0, 1,
-0.7454519, 0.4510268, 0.09357305, 0.6627451, 1, 0, 1,
-0.7431435, 0.2374655, -0.932894, 0.654902, 1, 0, 1,
-0.7393665, -1.558522, -2.362532, 0.6509804, 1, 0, 1,
-0.7380916, -1.196154, -4.180892, 0.6431373, 1, 0, 1,
-0.7346696, 1.500051, 0.4812919, 0.6392157, 1, 0, 1,
-0.7311174, -1.110772, -4.195113, 0.6313726, 1, 0, 1,
-0.7274602, -0.06371948, -0.9379413, 0.627451, 1, 0, 1,
-0.7249157, -0.5783616, -2.527747, 0.6196079, 1, 0, 1,
-0.7247702, -0.2833927, -0.8621637, 0.6156863, 1, 0, 1,
-0.7199681, 1.222808, -0.4947336, 0.6078432, 1, 0, 1,
-0.7122802, -0.328671, -1.981025, 0.6039216, 1, 0, 1,
-0.7089271, 0.8235441, 0.7715923, 0.5960785, 1, 0, 1,
-0.7077785, 0.6346435, -0.1657909, 0.5882353, 1, 0, 1,
-0.7029214, 0.528878, -0.2979856, 0.5843138, 1, 0, 1,
-0.7027907, -0.4448561, -1.680423, 0.5764706, 1, 0, 1,
-0.6989206, 0.4688857, -1.291099, 0.572549, 1, 0, 1,
-0.6961367, -0.9882827, -2.903214, 0.5647059, 1, 0, 1,
-0.6913572, -0.07421216, -2.46594, 0.5607843, 1, 0, 1,
-0.6890397, -1.185512, -1.83753, 0.5529412, 1, 0, 1,
-0.6874015, 0.1281191, 0.1836039, 0.5490196, 1, 0, 1,
-0.6861589, 0.1936059, -0.8337651, 0.5411765, 1, 0, 1,
-0.6828275, 0.1890258, 1.706602, 0.5372549, 1, 0, 1,
-0.6763633, -0.7716155, -3.438843, 0.5294118, 1, 0, 1,
-0.6751347, 1.288849, 3.300072, 0.5254902, 1, 0, 1,
-0.671553, 0.1456604, -0.7153338, 0.5176471, 1, 0, 1,
-0.6704265, -1.175719, -3.044974, 0.5137255, 1, 0, 1,
-0.6685762, 1.319112, 0.03468888, 0.5058824, 1, 0, 1,
-0.6672488, 0.4952059, -0.6852902, 0.5019608, 1, 0, 1,
-0.665311, 0.1439415, -2.934294, 0.4941176, 1, 0, 1,
-0.6619853, 3.368592, 0.4925464, 0.4862745, 1, 0, 1,
-0.6529996, 1.007879, -2.340347, 0.4823529, 1, 0, 1,
-0.6516628, 0.7093183, -0.4805038, 0.4745098, 1, 0, 1,
-0.6503436, 0.7442158, -2.141713, 0.4705882, 1, 0, 1,
-0.646946, 0.6828367, -1.79232, 0.4627451, 1, 0, 1,
-0.6435628, -0.8810062, -1.476, 0.4588235, 1, 0, 1,
-0.6405587, 1.489969, -1.21991, 0.4509804, 1, 0, 1,
-0.6400327, -0.4100949, -1.111365, 0.4470588, 1, 0, 1,
-0.6387973, -1.290497, -3.281702, 0.4392157, 1, 0, 1,
-0.6339468, 0.3261319, -0.2839215, 0.4352941, 1, 0, 1,
-0.6326594, 0.4034162, -2.308566, 0.427451, 1, 0, 1,
-0.6307985, 0.1771083, -1.327909, 0.4235294, 1, 0, 1,
-0.630113, -0.506552, -3.806069, 0.4156863, 1, 0, 1,
-0.6260367, -0.3604167, -1.580679, 0.4117647, 1, 0, 1,
-0.6255536, 0.6770186, 0.421644, 0.4039216, 1, 0, 1,
-0.6162835, -1.105049, -2.511643, 0.3960784, 1, 0, 1,
-0.6153515, -0.3919829, -1.697259, 0.3921569, 1, 0, 1,
-0.6142852, 2.300377, -0.7091988, 0.3843137, 1, 0, 1,
-0.612414, 0.3705035, -1.286505, 0.3803922, 1, 0, 1,
-0.6110392, -1.926126, -1.725967, 0.372549, 1, 0, 1,
-0.6088785, -1.893063, -4.847822, 0.3686275, 1, 0, 1,
-0.6035858, -0.1734556, -1.004346, 0.3607843, 1, 0, 1,
-0.5983053, 1.025085, -0.4136319, 0.3568628, 1, 0, 1,
-0.5908462, 0.2309851, -1.516695, 0.3490196, 1, 0, 1,
-0.5879522, 0.4714053, -3.281987, 0.345098, 1, 0, 1,
-0.5876564, 0.7959657, -2.812471, 0.3372549, 1, 0, 1,
-0.5854269, 0.5877001, 0.1489028, 0.3333333, 1, 0, 1,
-0.5818636, 0.4726744, 0.3349276, 0.3254902, 1, 0, 1,
-0.5799471, 0.4257282, -1.085622, 0.3215686, 1, 0, 1,
-0.5773027, 0.1950327, -3.738259, 0.3137255, 1, 0, 1,
-0.5731832, -0.03793548, -0.5262997, 0.3098039, 1, 0, 1,
-0.572736, 0.4413904, -1.86024, 0.3019608, 1, 0, 1,
-0.5671293, -0.6217565, -3.022518, 0.2941177, 1, 0, 1,
-0.5652459, -1.392957, -3.465902, 0.2901961, 1, 0, 1,
-0.5650433, -2.132195, -1.876938, 0.282353, 1, 0, 1,
-0.559262, -1.797412, -1.724171, 0.2784314, 1, 0, 1,
-0.5575452, -2.339177, -3.02801, 0.2705882, 1, 0, 1,
-0.5563039, 0.2714902, -2.429224, 0.2666667, 1, 0, 1,
-0.5523209, -1.370712, -3.30652, 0.2588235, 1, 0, 1,
-0.5504708, -0.3915233, -1.48804, 0.254902, 1, 0, 1,
-0.5502882, -0.7985573, -2.389724, 0.2470588, 1, 0, 1,
-0.5501061, -1.3985, -3.234833, 0.2431373, 1, 0, 1,
-0.5495378, -1.042388, -3.496845, 0.2352941, 1, 0, 1,
-0.5442958, -1.06832, -3.643782, 0.2313726, 1, 0, 1,
-0.5428458, -0.2922935, -0.7223423, 0.2235294, 1, 0, 1,
-0.5426207, -1.712376, -2.627058, 0.2196078, 1, 0, 1,
-0.5375667, -1.371306, -5.012393, 0.2117647, 1, 0, 1,
-0.5346261, -0.1911961, -2.931446, 0.2078431, 1, 0, 1,
-0.5330331, -0.4889283, -0.9480821, 0.2, 1, 0, 1,
-0.5326619, -1.680164, -5.084042, 0.1921569, 1, 0, 1,
-0.5273271, -1.455332, -3.141461, 0.1882353, 1, 0, 1,
-0.5258515, 0.3638958, -0.8160058, 0.1803922, 1, 0, 1,
-0.5255311, -0.5072052, -2.526259, 0.1764706, 1, 0, 1,
-0.5239902, 0.05330913, -1.970437, 0.1686275, 1, 0, 1,
-0.5233839, -1.752549, -3.773305, 0.1647059, 1, 0, 1,
-0.5185712, -0.500333, -2.807166, 0.1568628, 1, 0, 1,
-0.5166764, -0.8459495, -1.36682, 0.1529412, 1, 0, 1,
-0.5141336, -1.291682, -3.230877, 0.145098, 1, 0, 1,
-0.50826, 0.6946956, -0.5226526, 0.1411765, 1, 0, 1,
-0.5048808, -0.9554358, -2.236999, 0.1333333, 1, 0, 1,
-0.5038269, -0.6244138, -1.532646, 0.1294118, 1, 0, 1,
-0.5025437, 0.7041467, -1.022206, 0.1215686, 1, 0, 1,
-0.4978185, 1.155831, 0.1159052, 0.1176471, 1, 0, 1,
-0.4932013, 2.552029, -2.904329, 0.1098039, 1, 0, 1,
-0.4926383, 0.1061384, -1.522988, 0.1058824, 1, 0, 1,
-0.4888211, -1.167321, -2.848598, 0.09803922, 1, 0, 1,
-0.4865718, 1.52201, -0.9434386, 0.09019608, 1, 0, 1,
-0.4860776, 0.4309515, 0.1652662, 0.08627451, 1, 0, 1,
-0.484025, -1.264188, -2.812158, 0.07843138, 1, 0, 1,
-0.4817843, 0.6895015, -1.18007, 0.07450981, 1, 0, 1,
-0.4811678, 0.2734112, -1.960139, 0.06666667, 1, 0, 1,
-0.479867, 0.774924, -0.4258227, 0.0627451, 1, 0, 1,
-0.4796972, 2.013276, -1.414325, 0.05490196, 1, 0, 1,
-0.4787473, 1.065478, -0.1082729, 0.05098039, 1, 0, 1,
-0.4771811, 0.9612223, 0.3873305, 0.04313726, 1, 0, 1,
-0.4760701, -0.1743444, -1.801471, 0.03921569, 1, 0, 1,
-0.4755641, 0.5630299, -2.300328, 0.03137255, 1, 0, 1,
-0.4696756, -0.7599511, -2.131026, 0.02745098, 1, 0, 1,
-0.4515433, -0.4638869, -3.41267, 0.01960784, 1, 0, 1,
-0.4479682, 1.194907, -0.9788495, 0.01568628, 1, 0, 1,
-0.4469824, 0.09839847, -2.292534, 0.007843138, 1, 0, 1,
-0.444497, -0.1126373, -1.828534, 0.003921569, 1, 0, 1,
-0.4420493, 0.02112866, -2.667211, 0, 1, 0.003921569, 1,
-0.439483, 0.1746418, -0.2659711, 0, 1, 0.01176471, 1,
-0.4375425, 1.384804, -0.7206975, 0, 1, 0.01568628, 1,
-0.4367367, 1.741884, 0.3238822, 0, 1, 0.02352941, 1,
-0.4365339, 3.13417, 0.5209647, 0, 1, 0.02745098, 1,
-0.4339296, 0.681861, -1.066805, 0, 1, 0.03529412, 1,
-0.4303111, -0.9036374, -1.039725, 0, 1, 0.03921569, 1,
-0.4291631, -0.3369076, -2.779004, 0, 1, 0.04705882, 1,
-0.4249728, -0.5351941, -2.778658, 0, 1, 0.05098039, 1,
-0.4220972, 0.6035972, 0.453758, 0, 1, 0.05882353, 1,
-0.4182183, -0.5396847, -1.266593, 0, 1, 0.0627451, 1,
-0.416307, 0.6070834, -0.2601054, 0, 1, 0.07058824, 1,
-0.4045508, 0.4938528, -0.5705172, 0, 1, 0.07450981, 1,
-0.4040582, 0.8968945, 1.601508, 0, 1, 0.08235294, 1,
-0.402154, -0.8700283, -3.292833, 0, 1, 0.08627451, 1,
-0.3996983, 0.1004314, -0.1369347, 0, 1, 0.09411765, 1,
-0.3992037, 0.6565509, -0.7575668, 0, 1, 0.1019608, 1,
-0.396589, -0.4108222, -3.803821, 0, 1, 0.1058824, 1,
-0.3943686, -0.141332, -2.13107, 0, 1, 0.1137255, 1,
-0.3926208, 2.429543, -0.05828271, 0, 1, 0.1176471, 1,
-0.3922704, 1.827837, -1.609116, 0, 1, 0.1254902, 1,
-0.3879231, 0.4738817, 0.428899, 0, 1, 0.1294118, 1,
-0.3844969, -1.793872, -3.736437, 0, 1, 0.1372549, 1,
-0.3813437, -0.5769143, -3.700217, 0, 1, 0.1411765, 1,
-0.380673, 0.3597409, -1.755376, 0, 1, 0.1490196, 1,
-0.3751201, 0.05159142, -2.097497, 0, 1, 0.1529412, 1,
-0.3741021, -0.4414067, -3.602719, 0, 1, 0.1607843, 1,
-0.3729977, 0.8893492, 1.550887, 0, 1, 0.1647059, 1,
-0.3721654, 0.5538893, -2.859805, 0, 1, 0.172549, 1,
-0.3641857, 1.182339, 0.6779131, 0, 1, 0.1764706, 1,
-0.3614166, -0.6821338, -3.156841, 0, 1, 0.1843137, 1,
-0.3611258, 2.378415, -2.2727, 0, 1, 0.1882353, 1,
-0.3606397, -2.338552, -2.108039, 0, 1, 0.1960784, 1,
-0.3592384, 0.9033777, -0.6241266, 0, 1, 0.2039216, 1,
-0.356815, -1.260691, -2.678928, 0, 1, 0.2078431, 1,
-0.3551036, 0.4616241, -1.186916, 0, 1, 0.2156863, 1,
-0.3541207, -0.5440101, -1.694998, 0, 1, 0.2196078, 1,
-0.3528896, -1.463877, -1.237615, 0, 1, 0.227451, 1,
-0.3496455, 0.194851, 0.02774214, 0, 1, 0.2313726, 1,
-0.3479617, 0.02620544, -0.4614393, 0, 1, 0.2392157, 1,
-0.3474447, 0.9895135, 0.4783765, 0, 1, 0.2431373, 1,
-0.3469774, -0.1839283, -2.408415, 0, 1, 0.2509804, 1,
-0.3391834, -0.01834026, -0.478796, 0, 1, 0.254902, 1,
-0.3390663, 1.204183, -0.8806502, 0, 1, 0.2627451, 1,
-0.3386404, 1.386521, 0.469751, 0, 1, 0.2666667, 1,
-0.3382374, 0.5646933, -0.8588548, 0, 1, 0.2745098, 1,
-0.3370939, 1.149934, -0.3768981, 0, 1, 0.2784314, 1,
-0.3355528, -1.084387, -2.27498, 0, 1, 0.2862745, 1,
-0.3336365, 1.008024, 0.6378267, 0, 1, 0.2901961, 1,
-0.3298129, 0.07601558, -2.449993, 0, 1, 0.2980392, 1,
-0.3230515, 0.75716, -0.465285, 0, 1, 0.3058824, 1,
-0.3184285, -0.809428, -2.159811, 0, 1, 0.3098039, 1,
-0.3099739, -0.3670708, -2.072772, 0, 1, 0.3176471, 1,
-0.3036918, -2.11135, -5.556618, 0, 1, 0.3215686, 1,
-0.3013433, -1.020965, -3.618321, 0, 1, 0.3294118, 1,
-0.2997779, 0.1807755, -1.924883, 0, 1, 0.3333333, 1,
-0.2982275, -0.4259832, -1.515132, 0, 1, 0.3411765, 1,
-0.2981229, -0.9174513, -2.927524, 0, 1, 0.345098, 1,
-0.2928049, -1.109773, -3.427961, 0, 1, 0.3529412, 1,
-0.2896498, 1.441441, 1.214099, 0, 1, 0.3568628, 1,
-0.2872085, -0.8441349, -2.32632, 0, 1, 0.3647059, 1,
-0.2838255, 1.898282, 0.3271424, 0, 1, 0.3686275, 1,
-0.2813253, 2.292526, -0.9321138, 0, 1, 0.3764706, 1,
-0.2725239, 1.038733, -0.2276356, 0, 1, 0.3803922, 1,
-0.2694176, -0.04839074, -2.79998, 0, 1, 0.3882353, 1,
-0.2657212, 1.187596, -3.094306, 0, 1, 0.3921569, 1,
-0.2628887, -1.965416, -3.694131, 0, 1, 0.4, 1,
-0.2623166, 0.5694287, -0.2747357, 0, 1, 0.4078431, 1,
-0.2556907, -1.431791, -3.982867, 0, 1, 0.4117647, 1,
-0.2536172, 0.8313814, -0.1452098, 0, 1, 0.4196078, 1,
-0.2505662, 0.8094648, -0.9929063, 0, 1, 0.4235294, 1,
-0.2474359, -1.198994, -3.777261, 0, 1, 0.4313726, 1,
-0.2458093, -0.2812393, -1.150055, 0, 1, 0.4352941, 1,
-0.2434969, 0.9458352, -0.8526096, 0, 1, 0.4431373, 1,
-0.2423345, -0.7517701, -3.35323, 0, 1, 0.4470588, 1,
-0.2415716, 1.55497, 1.464476, 0, 1, 0.454902, 1,
-0.2412084, 1.71142, -0.9548705, 0, 1, 0.4588235, 1,
-0.2406198, -0.2537721, -1.836332, 0, 1, 0.4666667, 1,
-0.2399132, 0.5729967, -0.06127575, 0, 1, 0.4705882, 1,
-0.2384969, 0.03323184, -0.7938302, 0, 1, 0.4784314, 1,
-0.2248548, 0.6155149, 0.7085792, 0, 1, 0.4823529, 1,
-0.2239459, -0.8006238, -3.828108, 0, 1, 0.4901961, 1,
-0.2235168, -0.5474478, -3.621599, 0, 1, 0.4941176, 1,
-0.2212877, 0.9300371, -0.1150959, 0, 1, 0.5019608, 1,
-0.2163054, 0.1116653, -2.912605, 0, 1, 0.509804, 1,
-0.2142909, 2.319197, -1.09507, 0, 1, 0.5137255, 1,
-0.2075207, -2.43153, -5.198817, 0, 1, 0.5215687, 1,
-0.2071911, 0.531414, 2.329757, 0, 1, 0.5254902, 1,
-0.2066484, 0.713294, -0.9688017, 0, 1, 0.5333334, 1,
-0.2058542, 0.5302709, -1.671368, 0, 1, 0.5372549, 1,
-0.1957977, -0.7398514, -2.409071, 0, 1, 0.5450981, 1,
-0.1913799, -0.1053571, -0.7981246, 0, 1, 0.5490196, 1,
-0.1862897, 0.7544414, -1.530568, 0, 1, 0.5568628, 1,
-0.1843942, 1.00539, -2.333814, 0, 1, 0.5607843, 1,
-0.180555, 1.848856, 0.6998489, 0, 1, 0.5686275, 1,
-0.1795724, 0.6210996, -0.4691634, 0, 1, 0.572549, 1,
-0.1752405, 0.8376048, -0.5691371, 0, 1, 0.5803922, 1,
-0.1743862, 0.319237, 0.1375092, 0, 1, 0.5843138, 1,
-0.1743148, 1.689452, -0.9458141, 0, 1, 0.5921569, 1,
-0.1724916, -0.9221631, -0.9986941, 0, 1, 0.5960785, 1,
-0.1685834, 0.336023, -0.0838499, 0, 1, 0.6039216, 1,
-0.1652875, 0.01118235, -1.180625, 0, 1, 0.6117647, 1,
-0.164809, -1.790095, -4.050074, 0, 1, 0.6156863, 1,
-0.1645269, -1.541868, -1.006662, 0, 1, 0.6235294, 1,
-0.1576478, -0.5869814, -1.949521, 0, 1, 0.627451, 1,
-0.1572437, 1.29563, -0.682378, 0, 1, 0.6352941, 1,
-0.1518084, -1.255032, -5.367586, 0, 1, 0.6392157, 1,
-0.1512147, 0.61041, 1.219835, 0, 1, 0.6470588, 1,
-0.1463612, 0.4112529, 1.166341, 0, 1, 0.6509804, 1,
-0.1456525, 1.011136, -0.3268991, 0, 1, 0.6588235, 1,
-0.1440179, -0.2955017, -4.322262, 0, 1, 0.6627451, 1,
-0.1435702, -0.1223488, -2.079107, 0, 1, 0.6705883, 1,
-0.1421506, 0.03222561, -2.677577, 0, 1, 0.6745098, 1,
-0.141963, 0.4864534, -0.3462522, 0, 1, 0.682353, 1,
-0.1413038, 1.027622, -2.594519, 0, 1, 0.6862745, 1,
-0.1404968, 1.580582, -0.09332848, 0, 1, 0.6941177, 1,
-0.1363232, 1.498932, -1.342457, 0, 1, 0.7019608, 1,
-0.1353632, 0.4131078, -1.200183, 0, 1, 0.7058824, 1,
-0.1347519, 0.3473138, 0.8945237, 0, 1, 0.7137255, 1,
-0.1302503, 0.9382899, -0.3037747, 0, 1, 0.7176471, 1,
-0.1260861, 0.7303324, -1.193028, 0, 1, 0.7254902, 1,
-0.1198955, -0.504364, -2.153794, 0, 1, 0.7294118, 1,
-0.1198634, 1.00878, 0.02747007, 0, 1, 0.7372549, 1,
-0.1190211, -1.18487, -2.438207, 0, 1, 0.7411765, 1,
-0.11566, -0.4994794, -2.299472, 0, 1, 0.7490196, 1,
-0.1154652, -0.2430208, -2.651599, 0, 1, 0.7529412, 1,
-0.1146942, -0.3514035, -3.955957, 0, 1, 0.7607843, 1,
-0.1139588, 1.184795, -0.1450991, 0, 1, 0.7647059, 1,
-0.1133663, 1.283095, 0.6536814, 0, 1, 0.772549, 1,
-0.1116312, 0.861454, 0.1048085, 0, 1, 0.7764706, 1,
-0.1062914, -1.401309, -2.431359, 0, 1, 0.7843137, 1,
-0.1062488, -1.148222, -3.859382, 0, 1, 0.7882353, 1,
-0.103034, -0.3747573, -2.558961, 0, 1, 0.7960784, 1,
-0.1026334, 0.2027873, 0.5075902, 0, 1, 0.8039216, 1,
-0.101327, -0.7473041, -1.817617, 0, 1, 0.8078431, 1,
-0.09552217, -0.02159787, -1.505009, 0, 1, 0.8156863, 1,
-0.09388256, -2.873125, -3.457593, 0, 1, 0.8196079, 1,
-0.09307367, -1.036249, -4.555, 0, 1, 0.827451, 1,
-0.0924568, 1.407451, 1.816127, 0, 1, 0.8313726, 1,
-0.09010886, -0.06762268, -2.886317, 0, 1, 0.8392157, 1,
-0.08817172, -0.579312, -3.303256, 0, 1, 0.8431373, 1,
-0.0872147, 1.140409, -0.1873344, 0, 1, 0.8509804, 1,
-0.0861216, 1.643374, -0.3243891, 0, 1, 0.854902, 1,
-0.08498627, -0.5329295, -3.286019, 0, 1, 0.8627451, 1,
-0.08483972, -0.1569791, -1.712384, 0, 1, 0.8666667, 1,
-0.08315204, 1.784301, 0.9098126, 0, 1, 0.8745098, 1,
-0.08277468, 2.114696, -1.507397, 0, 1, 0.8784314, 1,
-0.08094217, 0.5172706, 0.6302324, 0, 1, 0.8862745, 1,
-0.07826614, 0.5695442, -1.216731, 0, 1, 0.8901961, 1,
-0.07822808, 1.451367, -0.07670522, 0, 1, 0.8980392, 1,
-0.0765709, 1.019358, 0.1696747, 0, 1, 0.9058824, 1,
-0.07628471, 0.07094283, -0.3712488, 0, 1, 0.9098039, 1,
-0.07455616, -0.4284791, -3.957093, 0, 1, 0.9176471, 1,
-0.07427208, -1.577782, -2.581725, 0, 1, 0.9215686, 1,
-0.07120439, -0.5092419, -3.691724, 0, 1, 0.9294118, 1,
-0.0669577, 1.655414, -1.014999, 0, 1, 0.9333333, 1,
-0.06672692, -0.7339338, -3.864319, 0, 1, 0.9411765, 1,
-0.06637874, -0.2007116, -1.949662, 0, 1, 0.945098, 1,
-0.05660868, 0.55988, -1.409271, 0, 1, 0.9529412, 1,
-0.05652807, 1.205612, 0.691174, 0, 1, 0.9568627, 1,
-0.05101085, 0.4867216, -0.2494385, 0, 1, 0.9647059, 1,
-0.04830283, 1.461819, 1.260484, 0, 1, 0.9686275, 1,
-0.0445257, -0.6131001, -3.707384, 0, 1, 0.9764706, 1,
-0.0438128, -0.2655251, -3.695562, 0, 1, 0.9803922, 1,
-0.04192799, -0.1399539, -2.979722, 0, 1, 0.9882353, 1,
-0.04145347, 2.79671, 1.648771, 0, 1, 0.9921569, 1,
-0.04003584, -1.196812, -1.421411, 0, 1, 1, 1,
-0.0305277, -1.182049, -5.852423, 0, 0.9921569, 1, 1,
-0.03050163, 0.6280894, 0.2336958, 0, 0.9882353, 1, 1,
-0.02973791, -0.2441775, -0.25205, 0, 0.9803922, 1, 1,
-0.02625706, -1.406626, -3.229437, 0, 0.9764706, 1, 1,
-0.02605346, -2.172981, -3.605134, 0, 0.9686275, 1, 1,
-0.02050786, -0.2944537, -3.754436, 0, 0.9647059, 1, 1,
-0.0153573, 0.9435635, 0.7218552, 0, 0.9568627, 1, 1,
-0.01516828, -0.4515482, -1.975592, 0, 0.9529412, 1, 1,
-0.01508728, -1.352135, -5.222574, 0, 0.945098, 1, 1,
-0.01076048, 0.998558, -2.438625, 0, 0.9411765, 1, 1,
-0.009075128, 0.5876099, -0.6717472, 0, 0.9333333, 1, 1,
-0.00840604, 1.337185, 3.07946, 0, 0.9294118, 1, 1,
-0.007234841, 1.343477, -1.159961, 0, 0.9215686, 1, 1,
-0.007022014, -1.741201, -3.073926, 0, 0.9176471, 1, 1,
-0.006024389, 1.21295, -1.245268, 0, 0.9098039, 1, 1,
-0.005158209, 0.07409397, -0.7093334, 0, 0.9058824, 1, 1,
0.002771597, -1.274433, 2.368385, 0, 0.8980392, 1, 1,
0.003581672, 0.8223121, 0.187711, 0, 0.8901961, 1, 1,
0.005589099, 0.3213001, 0.4006826, 0, 0.8862745, 1, 1,
0.006718015, -1.681096, 4.684833, 0, 0.8784314, 1, 1,
0.007157767, 2.213259, 1.214484, 0, 0.8745098, 1, 1,
0.007221993, 0.8004506, -0.2679059, 0, 0.8666667, 1, 1,
0.01108354, 0.3432073, 0.1917687, 0, 0.8627451, 1, 1,
0.01608727, -0.3403922, 3.163661, 0, 0.854902, 1, 1,
0.01635528, 0.8173485, -1.155043, 0, 0.8509804, 1, 1,
0.02259432, 1.251915, 0.9640554, 0, 0.8431373, 1, 1,
0.02552834, -1.983927, 3.520123, 0, 0.8392157, 1, 1,
0.03007072, 0.5071774, 0.5210902, 0, 0.8313726, 1, 1,
0.03502608, -0.3916253, 2.902253, 0, 0.827451, 1, 1,
0.03540387, 0.1134523, -0.1870891, 0, 0.8196079, 1, 1,
0.03733997, -1.449425, 3.616587, 0, 0.8156863, 1, 1,
0.03868724, -0.4028323, 1.196519, 0, 0.8078431, 1, 1,
0.03870874, 2.067752, -0.3893544, 0, 0.8039216, 1, 1,
0.04056447, 0.9450225, 0.5304632, 0, 0.7960784, 1, 1,
0.04393563, -0.1271291, 2.122859, 0, 0.7882353, 1, 1,
0.04490409, 0.5135749, -0.7068444, 0, 0.7843137, 1, 1,
0.04828371, 3.277144, -1.436141, 0, 0.7764706, 1, 1,
0.051038, 0.718285, -2.116969, 0, 0.772549, 1, 1,
0.05273058, 0.05575847, -0.09968562, 0, 0.7647059, 1, 1,
0.05764685, -1.313839, 2.774371, 0, 0.7607843, 1, 1,
0.05983103, -1.040983, 3.55082, 0, 0.7529412, 1, 1,
0.06000396, 0.6275448, 0.3320406, 0, 0.7490196, 1, 1,
0.06229513, 1.01027, 1.188657, 0, 0.7411765, 1, 1,
0.06330501, -0.6351052, 1.054687, 0, 0.7372549, 1, 1,
0.06343023, -0.2519021, 2.377458, 0, 0.7294118, 1, 1,
0.06459522, 0.3839522, -0.6654655, 0, 0.7254902, 1, 1,
0.06526536, 0.3225229, 0.1988176, 0, 0.7176471, 1, 1,
0.06724355, -1.201322, 1.252203, 0, 0.7137255, 1, 1,
0.06728496, -1.021859, 1.909153, 0, 0.7058824, 1, 1,
0.06917121, -1.314254, 2.634501, 0, 0.6980392, 1, 1,
0.07444024, -1.068531, 4.045861, 0, 0.6941177, 1, 1,
0.0779603, 1.050109, -0.7166368, 0, 0.6862745, 1, 1,
0.0851281, -0.5846592, 2.576633, 0, 0.682353, 1, 1,
0.08812884, -1.519013, 3.447491, 0, 0.6745098, 1, 1,
0.08876254, -0.6670756, 2.779129, 0, 0.6705883, 1, 1,
0.0934258, 1.150159, -1.103593, 0, 0.6627451, 1, 1,
0.09396166, 0.3496761, -0.1669668, 0, 0.6588235, 1, 1,
0.09481068, 0.1090983, 1.422841, 0, 0.6509804, 1, 1,
0.09686995, 1.005541, -0.2333257, 0, 0.6470588, 1, 1,
0.09748734, -2.266192, 1.67239, 0, 0.6392157, 1, 1,
0.09944338, 0.3608666, -1.838746, 0, 0.6352941, 1, 1,
0.1005623, 0.1625512, 1.71916, 0, 0.627451, 1, 1,
0.1012551, -0.7035879, 3.425949, 0, 0.6235294, 1, 1,
0.1054331, 0.4140908, -1.645564, 0, 0.6156863, 1, 1,
0.1067854, -0.9799288, 4.236876, 0, 0.6117647, 1, 1,
0.1075433, 1.677188, 0.528172, 0, 0.6039216, 1, 1,
0.1098164, 1.317914, 0.6997718, 0, 0.5960785, 1, 1,
0.1103173, -2.131229, 3.010288, 0, 0.5921569, 1, 1,
0.1103322, 0.9092596, -0.7909571, 0, 0.5843138, 1, 1,
0.1151573, 3.487387, -1.142889, 0, 0.5803922, 1, 1,
0.1164072, -0.3342711, 3.863239, 0, 0.572549, 1, 1,
0.1193845, 0.4004719, 1.592455, 0, 0.5686275, 1, 1,
0.1228713, 0.898524, 0.640029, 0, 0.5607843, 1, 1,
0.125994, 3.836072, -0.111947, 0, 0.5568628, 1, 1,
0.1289666, 0.1337736, 1.041517, 0, 0.5490196, 1, 1,
0.1296541, -1.126298, 3.440189, 0, 0.5450981, 1, 1,
0.1301276, -0.2459477, 1.256022, 0, 0.5372549, 1, 1,
0.1311109, 1.16846, 1.41497, 0, 0.5333334, 1, 1,
0.1319118, 0.1587512, 1.925199, 0, 0.5254902, 1, 1,
0.13759, -1.245945, 3.750849, 0, 0.5215687, 1, 1,
0.1417802, 0.8768945, 2.08144, 0, 0.5137255, 1, 1,
0.1419057, -1.124679, 3.854747, 0, 0.509804, 1, 1,
0.1437424, -0.9248309, 3.198997, 0, 0.5019608, 1, 1,
0.1448003, -1.340492, 3.358394, 0, 0.4941176, 1, 1,
0.1450511, -0.7556241, 2.676202, 0, 0.4901961, 1, 1,
0.1455502, -0.5054651, 2.594809, 0, 0.4823529, 1, 1,
0.1481925, 0.361889, -0.9073146, 0, 0.4784314, 1, 1,
0.1494531, 0.6888878, -0.8321413, 0, 0.4705882, 1, 1,
0.1543901, 0.3977886, 0.6458397, 0, 0.4666667, 1, 1,
0.1560858, -0.5803027, 1.577953, 0, 0.4588235, 1, 1,
0.1671343, 1.586979, 0.6727316, 0, 0.454902, 1, 1,
0.1675131, -1.86665, 2.946456, 0, 0.4470588, 1, 1,
0.1677451, 1.281671, 0.001422373, 0, 0.4431373, 1, 1,
0.1678963, -0.02286701, 5.00045, 0, 0.4352941, 1, 1,
0.1700551, 0.6087141, -0.7286741, 0, 0.4313726, 1, 1,
0.1718812, 0.545446, 1.637233, 0, 0.4235294, 1, 1,
0.1722299, 0.9624201, 0.4565479, 0, 0.4196078, 1, 1,
0.1728213, -0.4444354, 3.562923, 0, 0.4117647, 1, 1,
0.173048, -0.4031166, 3.615321, 0, 0.4078431, 1, 1,
0.1740975, -1.116462, 2.975261, 0, 0.4, 1, 1,
0.1768828, 0.1904585, -0.3645632, 0, 0.3921569, 1, 1,
0.1798814, 0.5178422, 0.8481659, 0, 0.3882353, 1, 1,
0.1840835, -1.001181, 3.541042, 0, 0.3803922, 1, 1,
0.1901, -0.5876697, 1.849447, 0, 0.3764706, 1, 1,
0.194911, 0.4589266, 0.7879836, 0, 0.3686275, 1, 1,
0.2000762, 0.3613871, 1.475357, 0, 0.3647059, 1, 1,
0.2011203, 0.4833499, 1.02786, 0, 0.3568628, 1, 1,
0.2029387, 0.5748606, -0.1481931, 0, 0.3529412, 1, 1,
0.2048609, 0.2287448, 0.8677469, 0, 0.345098, 1, 1,
0.2090564, -0.5022841, 2.904942, 0, 0.3411765, 1, 1,
0.2141815, -1.112591, 4.603112, 0, 0.3333333, 1, 1,
0.2254165, -0.2033012, 1.494622, 0, 0.3294118, 1, 1,
0.2258274, -0.8454727, 2.327719, 0, 0.3215686, 1, 1,
0.2314605, -1.957183, 4.415247, 0, 0.3176471, 1, 1,
0.2320226, 0.8400397, 0.7898136, 0, 0.3098039, 1, 1,
0.24115, -1.05207, 2.358973, 0, 0.3058824, 1, 1,
0.2428797, -1.19822, 1.852454, 0, 0.2980392, 1, 1,
0.2439405, -0.4293846, 1.980061, 0, 0.2901961, 1, 1,
0.2455597, 0.9275263, -0.2179015, 0, 0.2862745, 1, 1,
0.2466635, 0.3703449, 0.5410727, 0, 0.2784314, 1, 1,
0.2528546, 0.2968969, -0.9793311, 0, 0.2745098, 1, 1,
0.2528881, -0.8329408, 2.740222, 0, 0.2666667, 1, 1,
0.2581193, 0.6716405, 0.9478105, 0, 0.2627451, 1, 1,
0.2589075, -1.907827, 2.518806, 0, 0.254902, 1, 1,
0.2616804, 0.06990301, 2.927296, 0, 0.2509804, 1, 1,
0.2675993, 0.4195842, 0.5179248, 0, 0.2431373, 1, 1,
0.2680914, 0.6645808, -1.025128, 0, 0.2392157, 1, 1,
0.2748895, 0.4597562, 1.155052, 0, 0.2313726, 1, 1,
0.275162, 0.7260377, 0.5506248, 0, 0.227451, 1, 1,
0.2782524, -1.702214, 1.37855, 0, 0.2196078, 1, 1,
0.2792155, -0.1088218, 3.39182, 0, 0.2156863, 1, 1,
0.2815647, -0.8327963, 1.31244, 0, 0.2078431, 1, 1,
0.2892534, 0.4199401, 0.2666432, 0, 0.2039216, 1, 1,
0.289533, -0.4790996, 2.310162, 0, 0.1960784, 1, 1,
0.292842, 0.1182432, 3.040218, 0, 0.1882353, 1, 1,
0.2956858, -1.271526, 2.897253, 0, 0.1843137, 1, 1,
0.2959874, -0.7617682, 3.388171, 0, 0.1764706, 1, 1,
0.2970392, 1.478845, 0.4141898, 0, 0.172549, 1, 1,
0.2998433, -1.072461, 3.907083, 0, 0.1647059, 1, 1,
0.3026984, 1.797253, -0.4288711, 0, 0.1607843, 1, 1,
0.3048037, 0.4052316, 2.35018, 0, 0.1529412, 1, 1,
0.3060067, 0.4891217, 1.374166, 0, 0.1490196, 1, 1,
0.3069494, 1.759321, 0.7260379, 0, 0.1411765, 1, 1,
0.3107423, 1.757119, -0.1496523, 0, 0.1372549, 1, 1,
0.3116271, -0.3801328, 1.591842, 0, 0.1294118, 1, 1,
0.3151491, 1.2522, 0.1199632, 0, 0.1254902, 1, 1,
0.3157482, 0.1712498, -0.1748203, 0, 0.1176471, 1, 1,
0.3194669, -0.6354064, 3.872923, 0, 0.1137255, 1, 1,
0.3233956, 0.5358067, 1.087152, 0, 0.1058824, 1, 1,
0.3245761, -0.9404691, 3.555552, 0, 0.09803922, 1, 1,
0.3263828, 0.1725115, 2.066232, 0, 0.09411765, 1, 1,
0.3266256, 1.322025, 0.7859305, 0, 0.08627451, 1, 1,
0.332317, -0.9685157, 4.446948, 0, 0.08235294, 1, 1,
0.3339652, 2.134528, 2.029706, 0, 0.07450981, 1, 1,
0.3344762, -0.3839753, 3.03465, 0, 0.07058824, 1, 1,
0.3358168, -0.2406976, 0.9886474, 0, 0.0627451, 1, 1,
0.3420309, -1.762944, 3.468657, 0, 0.05882353, 1, 1,
0.3428305, -0.662531, 3.975401, 0, 0.05098039, 1, 1,
0.344206, 1.352809, 1.577545, 0, 0.04705882, 1, 1,
0.344853, 1.288059, -1.316228, 0, 0.03921569, 1, 1,
0.3498561, -1.158, 6.117945, 0, 0.03529412, 1, 1,
0.3500667, -0.6832945, 2.565302, 0, 0.02745098, 1, 1,
0.3508919, -0.6491579, 3.01545, 0, 0.02352941, 1, 1,
0.3547148, 0.8450683, 0.3002466, 0, 0.01568628, 1, 1,
0.3547784, -0.3790645, 3.440593, 0, 0.01176471, 1, 1,
0.3579769, 0.9123536, 0.614522, 0, 0.003921569, 1, 1,
0.3594355, 0.644425, -0.09725498, 0.003921569, 0, 1, 1,
0.3597946, -0.3239733, 1.711026, 0.007843138, 0, 1, 1,
0.3613624, -0.3980733, 2.034494, 0.01568628, 0, 1, 1,
0.3655306, -1.337861, 3.367252, 0.01960784, 0, 1, 1,
0.37284, 0.6368573, 0.121768, 0.02745098, 0, 1, 1,
0.3750537, 0.7579774, 1.68838, 0.03137255, 0, 1, 1,
0.3811401, -0.8855263, 2.465228, 0.03921569, 0, 1, 1,
0.3819079, 0.004621653, 3.066694, 0.04313726, 0, 1, 1,
0.3826945, 0.3492687, 2.846856, 0.05098039, 0, 1, 1,
0.3833649, 0.9982154, 2.040449, 0.05490196, 0, 1, 1,
0.3939999, -0.7873788, 4.390475, 0.0627451, 0, 1, 1,
0.3940958, 0.02694788, 1.819857, 0.06666667, 0, 1, 1,
0.3941976, -1.491252, 4.131054, 0.07450981, 0, 1, 1,
0.395873, -1.052474, 4.064845, 0.07843138, 0, 1, 1,
0.3958822, 0.320167, 2.313623, 0.08627451, 0, 1, 1,
0.4033487, 1.403268, -0.7530674, 0.09019608, 0, 1, 1,
0.4039958, 0.1533604, 2.980366, 0.09803922, 0, 1, 1,
0.4113127, -1.366845, 3.860413, 0.1058824, 0, 1, 1,
0.4118289, -0.4381821, 1.298702, 0.1098039, 0, 1, 1,
0.413029, -0.4562433, 0.7317729, 0.1176471, 0, 1, 1,
0.4198022, 1.163826, 0.2775352, 0.1215686, 0, 1, 1,
0.4226032, 1.043113, -0.04157424, 0.1294118, 0, 1, 1,
0.4308417, -1.508334, 3.813324, 0.1333333, 0, 1, 1,
0.4311885, -0.9130618, 3.231956, 0.1411765, 0, 1, 1,
0.4364939, 1.338096, 1.346848, 0.145098, 0, 1, 1,
0.438655, -0.08673315, 0.3657913, 0.1529412, 0, 1, 1,
0.447795, 2.224189, -0.191608, 0.1568628, 0, 1, 1,
0.448231, -0.2124043, 1.355575, 0.1647059, 0, 1, 1,
0.4482976, -0.3667628, 2.919198, 0.1686275, 0, 1, 1,
0.4515578, 0.3788201, 0.435746, 0.1764706, 0, 1, 1,
0.4524967, 1.324987, 0.04799858, 0.1803922, 0, 1, 1,
0.4554242, 2.715909, 1.069861, 0.1882353, 0, 1, 1,
0.456814, 1.28184, 0.8999588, 0.1921569, 0, 1, 1,
0.4587956, 0.2126085, 0.07102066, 0.2, 0, 1, 1,
0.4609512, 0.5790261, -0.1450824, 0.2078431, 0, 1, 1,
0.4633404, -0.9173207, 1.345498, 0.2117647, 0, 1, 1,
0.472221, 0.5639412, -0.8679293, 0.2196078, 0, 1, 1,
0.4722572, 0.2688616, 0.448837, 0.2235294, 0, 1, 1,
0.4776538, 0.09660154, 2.661706, 0.2313726, 0, 1, 1,
0.4776807, -0.1558553, 2.045642, 0.2352941, 0, 1, 1,
0.4819787, -2.341866, 1.768275, 0.2431373, 0, 1, 1,
0.4896484, -0.1108436, 0.9230725, 0.2470588, 0, 1, 1,
0.4914867, -2.135797, 3.076038, 0.254902, 0, 1, 1,
0.498069, 0.6419899, 1.249105, 0.2588235, 0, 1, 1,
0.5021205, -1.457468, 2.500589, 0.2666667, 0, 1, 1,
0.5023279, 0.7827384, 0.9086236, 0.2705882, 0, 1, 1,
0.5214631, -0.2559575, 2.357082, 0.2784314, 0, 1, 1,
0.526427, 0.8422422, 0.4341233, 0.282353, 0, 1, 1,
0.5344698, -0.5551443, 3.659885, 0.2901961, 0, 1, 1,
0.5379508, 0.5828935, 0.3047985, 0.2941177, 0, 1, 1,
0.5391761, 0.450039, 0.2970684, 0.3019608, 0, 1, 1,
0.5408611, 0.4546351, 2.611575, 0.3098039, 0, 1, 1,
0.5437583, 0.528933, 0.4697413, 0.3137255, 0, 1, 1,
0.5453003, -0.4573293, 3.128791, 0.3215686, 0, 1, 1,
0.5485395, 0.7848822, -0.3469259, 0.3254902, 0, 1, 1,
0.5487247, -1.421101, 2.267025, 0.3333333, 0, 1, 1,
0.5517601, 0.3118926, 1.759696, 0.3372549, 0, 1, 1,
0.5578937, 0.09352569, 2.165501, 0.345098, 0, 1, 1,
0.5597593, -0.5880774, 2.845351, 0.3490196, 0, 1, 1,
0.5603478, -0.197753, 1.467555, 0.3568628, 0, 1, 1,
0.5678288, -0.5506843, 3.018348, 0.3607843, 0, 1, 1,
0.56801, -1.360725, 3.645731, 0.3686275, 0, 1, 1,
0.5697572, 0.7774117, -1.02863, 0.372549, 0, 1, 1,
0.5715417, 0.7195973, -0.4322197, 0.3803922, 0, 1, 1,
0.5740246, 2.146668, 1.557272, 0.3843137, 0, 1, 1,
0.5761247, -1.263325, 2.205101, 0.3921569, 0, 1, 1,
0.5843555, 0.5008706, 0.6354573, 0.3960784, 0, 1, 1,
0.5847266, 0.6258265, 0.8357016, 0.4039216, 0, 1, 1,
0.5858659, 0.9549502, 1.901163, 0.4117647, 0, 1, 1,
0.5916976, 0.6609793, 0.9271296, 0.4156863, 0, 1, 1,
0.5975157, 0.994062, -0.4672608, 0.4235294, 0, 1, 1,
0.6030352, -0.03967152, 1.025349, 0.427451, 0, 1, 1,
0.604291, 0.9414675, 1.404928, 0.4352941, 0, 1, 1,
0.6119931, 1.454235, 0.1710166, 0.4392157, 0, 1, 1,
0.6155759, 1.787465, 1.006737, 0.4470588, 0, 1, 1,
0.6167378, 1.406662, 0.1253609, 0.4509804, 0, 1, 1,
0.6174276, -0.7224748, 3.108815, 0.4588235, 0, 1, 1,
0.6193489, -1.095541, 2.040437, 0.4627451, 0, 1, 1,
0.6231165, 0.856515, 0.565445, 0.4705882, 0, 1, 1,
0.624741, -2.652277, 3.012006, 0.4745098, 0, 1, 1,
0.6339382, 0.3055635, 0.7658236, 0.4823529, 0, 1, 1,
0.6358008, -1.25541, 3.513656, 0.4862745, 0, 1, 1,
0.6399314, 1.217914, -1.529069, 0.4941176, 0, 1, 1,
0.6410946, 0.001860368, 1.577348, 0.5019608, 0, 1, 1,
0.6478771, 2.298245, 0.2194269, 0.5058824, 0, 1, 1,
0.6508934, -1.32899, 3.190692, 0.5137255, 0, 1, 1,
0.654812, -0.1322396, 2.017734, 0.5176471, 0, 1, 1,
0.657497, 0.152293, 0.4555885, 0.5254902, 0, 1, 1,
0.6599039, 1.104345, 1.174295, 0.5294118, 0, 1, 1,
0.6626652, 0.6018468, 1.009523, 0.5372549, 0, 1, 1,
0.6645798, -0.2534646, 1.798989, 0.5411765, 0, 1, 1,
0.6650927, -0.498617, 2.56041, 0.5490196, 0, 1, 1,
0.6653102, 0.8268398, 0.6010228, 0.5529412, 0, 1, 1,
0.6779038, -0.2826197, 0.03198195, 0.5607843, 0, 1, 1,
0.6783034, -1.027643, 1.740839, 0.5647059, 0, 1, 1,
0.6783684, -0.5975462, 4.666275, 0.572549, 0, 1, 1,
0.6795785, -0.3789902, 1.540895, 0.5764706, 0, 1, 1,
0.6820468, -0.3934612, 2.236792, 0.5843138, 0, 1, 1,
0.6823854, -1.240809, 3.083512, 0.5882353, 0, 1, 1,
0.6826845, -0.8991805, 1.933793, 0.5960785, 0, 1, 1,
0.6827644, -1.173841, 4.223578, 0.6039216, 0, 1, 1,
0.6949348, -1.906707, 3.557016, 0.6078432, 0, 1, 1,
0.6984753, 0.6343869, -0.8980516, 0.6156863, 0, 1, 1,
0.70005, -0.9953801, 3.230979, 0.6196079, 0, 1, 1,
0.7032199, -0.5398602, 2.684428, 0.627451, 0, 1, 1,
0.7156622, -0.04024807, 1.161842, 0.6313726, 0, 1, 1,
0.7257745, 1.546627, 2.174688, 0.6392157, 0, 1, 1,
0.726039, 0.3050142, 2.294547, 0.6431373, 0, 1, 1,
0.7353191, -1.811117, 2.366927, 0.6509804, 0, 1, 1,
0.7390072, -1.156571, 2.16442, 0.654902, 0, 1, 1,
0.7390091, 0.5832198, 0.4788707, 0.6627451, 0, 1, 1,
0.7405372, -0.8727648, 3.587627, 0.6666667, 0, 1, 1,
0.7467871, 0.4883385, 1.466833, 0.6745098, 0, 1, 1,
0.7478984, -0.5506528, 2.560829, 0.6784314, 0, 1, 1,
0.7498232, 0.1985228, -0.5805627, 0.6862745, 0, 1, 1,
0.7584603, -0.5349718, 0.6385273, 0.6901961, 0, 1, 1,
0.7596205, -1.188569, 0.7337009, 0.6980392, 0, 1, 1,
0.7603824, -0.4857805, 3.536594, 0.7058824, 0, 1, 1,
0.7614614, -1.243277, 3.19134, 0.7098039, 0, 1, 1,
0.7663069, -0.4769401, 1.908098, 0.7176471, 0, 1, 1,
0.7672436, 0.4782148, 0.9458238, 0.7215686, 0, 1, 1,
0.7674508, 0.1810179, 1.333435, 0.7294118, 0, 1, 1,
0.7696764, -0.5319619, 1.272547, 0.7333333, 0, 1, 1,
0.7708824, 1.078943, -0.1405225, 0.7411765, 0, 1, 1,
0.7730981, -0.5757506, 1.102108, 0.7450981, 0, 1, 1,
0.7753841, 0.2685913, 2.256337, 0.7529412, 0, 1, 1,
0.7765759, -1.388283, 2.929024, 0.7568628, 0, 1, 1,
0.7860109, 2.588286, 1.136709, 0.7647059, 0, 1, 1,
0.7913798, 0.2329768, 2.26934, 0.7686275, 0, 1, 1,
0.7953845, -0.03427136, 1.968858, 0.7764706, 0, 1, 1,
0.7963358, 1.851371, 0.9539007, 0.7803922, 0, 1, 1,
0.8012612, 0.1841703, 1.606791, 0.7882353, 0, 1, 1,
0.8033069, 0.644785, 0.7412571, 0.7921569, 0, 1, 1,
0.8110937, -0.01517153, 0.4399678, 0.8, 0, 1, 1,
0.8149989, -0.2447687, 1.332198, 0.8078431, 0, 1, 1,
0.8186225, 0.1309762, 1.213818, 0.8117647, 0, 1, 1,
0.8305026, 0.7909087, 0.2468055, 0.8196079, 0, 1, 1,
0.833465, 0.7045672, 0.863897, 0.8235294, 0, 1, 1,
0.8398373, -0.6379183, 1.124979, 0.8313726, 0, 1, 1,
0.8410004, -0.5221492, 3.578253, 0.8352941, 0, 1, 1,
0.8416648, -0.2002347, 2.294705, 0.8431373, 0, 1, 1,
0.8425018, 0.09844331, 1.441507, 0.8470588, 0, 1, 1,
0.8479207, -0.1390282, 1.864194, 0.854902, 0, 1, 1,
0.8497969, 0.4908888, 0.6292518, 0.8588235, 0, 1, 1,
0.8545029, -0.3798956, 1.496562, 0.8666667, 0, 1, 1,
0.8591874, -1.924328, 2.654855, 0.8705882, 0, 1, 1,
0.8594363, 0.5316614, -0.2094246, 0.8784314, 0, 1, 1,
0.8871913, -0.3358068, 1.58697, 0.8823529, 0, 1, 1,
0.8905796, -0.572721, 2.28302, 0.8901961, 0, 1, 1,
0.8905918, 0.4097054, 1.121992, 0.8941177, 0, 1, 1,
0.8916464, 2.305332, -0.336872, 0.9019608, 0, 1, 1,
0.8939564, 0.6792518, 1.269722, 0.9098039, 0, 1, 1,
0.8964487, -0.4941697, 1.856151, 0.9137255, 0, 1, 1,
0.9044462, -0.289489, 2.271726, 0.9215686, 0, 1, 1,
0.9056497, -1.03168, 3.47369, 0.9254902, 0, 1, 1,
0.9079077, 0.3819744, 1.082106, 0.9333333, 0, 1, 1,
0.9082311, -0.5262663, 3.210206, 0.9372549, 0, 1, 1,
0.9084865, -1.156439, 3.901138, 0.945098, 0, 1, 1,
0.9087456, 0.343102, 1.663548, 0.9490196, 0, 1, 1,
0.9106295, -0.4125855, 2.914701, 0.9568627, 0, 1, 1,
0.915613, 0.6140501, 0.7197344, 0.9607843, 0, 1, 1,
0.919332, 1.000657, 0.5121249, 0.9686275, 0, 1, 1,
0.9230017, -0.732326, 1.557443, 0.972549, 0, 1, 1,
0.9264631, -0.6063755, 1.536131, 0.9803922, 0, 1, 1,
0.9295474, 1.206976, -0.6618847, 0.9843137, 0, 1, 1,
0.9365561, 1.039633, 0.6494256, 0.9921569, 0, 1, 1,
0.9372218, -0.4362854, 0.7411874, 0.9960784, 0, 1, 1,
0.9374342, -2.024634, 2.903639, 1, 0, 0.9960784, 1,
0.9420879, -0.8784004, 2.388311, 1, 0, 0.9882353, 1,
0.9553251, 0.1968428, 2.653395, 1, 0, 0.9843137, 1,
0.9606467, 1.460561, 0.1027909, 1, 0, 0.9764706, 1,
0.9607548, -1.130033, 2.427093, 1, 0, 0.972549, 1,
0.9620361, -0.9132502, 2.906067, 1, 0, 0.9647059, 1,
0.9664801, -0.7014704, 4.437178, 1, 0, 0.9607843, 1,
0.969224, -0.06009671, 2.780885, 1, 0, 0.9529412, 1,
0.975966, 0.7491456, 0.1508313, 1, 0, 0.9490196, 1,
0.976015, -0.1021744, 0.6215914, 1, 0, 0.9411765, 1,
0.9845576, -0.08237278, 2.33166, 1, 0, 0.9372549, 1,
0.9866365, 1.037376, 2.602458, 1, 0, 0.9294118, 1,
0.9904078, 1.008746, 1.396915, 1, 0, 0.9254902, 1,
0.9911821, 0.5401636, 0.746113, 1, 0, 0.9176471, 1,
0.9922392, -1.028598, 1.36825, 1, 0, 0.9137255, 1,
1.003062, -0.828927, 3.399963, 1, 0, 0.9058824, 1,
1.004808, -0.1172128, 1.884813, 1, 0, 0.9019608, 1,
1.008662, -0.1176797, 2.32832, 1, 0, 0.8941177, 1,
1.009099, -0.6639372, -0.4361306, 1, 0, 0.8862745, 1,
1.016499, 1.277385, -0.419735, 1, 0, 0.8823529, 1,
1.018402, 1.317497, 1.064397, 1, 0, 0.8745098, 1,
1.019027, 0.2921591, 2.079859, 1, 0, 0.8705882, 1,
1.020765, -1.174176, 3.580487, 1, 0, 0.8627451, 1,
1.02467, 0.4675938, 2.68363, 1, 0, 0.8588235, 1,
1.027459, -0.3824059, 1.244678, 1, 0, 0.8509804, 1,
1.02947, 0.5649221, 1.953903, 1, 0, 0.8470588, 1,
1.031979, -0.0177542, 0.1326015, 1, 0, 0.8392157, 1,
1.032454, 0.04624839, 2.005732, 1, 0, 0.8352941, 1,
1.039035, -0.05534077, 1.803576, 1, 0, 0.827451, 1,
1.046321, 0.7156353, 1.109114, 1, 0, 0.8235294, 1,
1.046787, -0.9093709, 2.257793, 1, 0, 0.8156863, 1,
1.057345, 0.3556545, 1.674344, 1, 0, 0.8117647, 1,
1.065217, -0.7423496, 3.12036, 1, 0, 0.8039216, 1,
1.065945, -0.1268223, 1.290934, 1, 0, 0.7960784, 1,
1.083483, 0.4730087, 0.4884277, 1, 0, 0.7921569, 1,
1.085022, -1.082652, 3.549399, 1, 0, 0.7843137, 1,
1.08806, 0.8550377, -0.7506691, 1, 0, 0.7803922, 1,
1.090997, 1.245931, 1.71699, 1, 0, 0.772549, 1,
1.093098, -0.4470095, -0.2638174, 1, 0, 0.7686275, 1,
1.093628, -1.578876, 3.265908, 1, 0, 0.7607843, 1,
1.094183, 0.3368458, 0.6348277, 1, 0, 0.7568628, 1,
1.095519, 0.5948856, 1.556538, 1, 0, 0.7490196, 1,
1.098919, 2.706173, -1.092118, 1, 0, 0.7450981, 1,
1.103491, 1.2293, 1.687547, 1, 0, 0.7372549, 1,
1.105164, 0.1053428, 2.640384, 1, 0, 0.7333333, 1,
1.105301, 0.2439626, 2.485664, 1, 0, 0.7254902, 1,
1.109718, 0.6460146, 0.8740042, 1, 0, 0.7215686, 1,
1.115577, -0.3435698, 1.914353, 1, 0, 0.7137255, 1,
1.117335, -0.1964456, 2.17996, 1, 0, 0.7098039, 1,
1.122938, -1.061609, 1.772659, 1, 0, 0.7019608, 1,
1.129431, -0.1882124, 0.8825152, 1, 0, 0.6941177, 1,
1.132626, -1.284823, 2.465456, 1, 0, 0.6901961, 1,
1.14005, -0.3331499, 4.51676, 1, 0, 0.682353, 1,
1.146649, -1.198795, 3.110854, 1, 0, 0.6784314, 1,
1.157554, 0.7459271, -0.3382641, 1, 0, 0.6705883, 1,
1.160203, 1.39309, 1.319206, 1, 0, 0.6666667, 1,
1.163529, 0.7863028, -1.140097, 1, 0, 0.6588235, 1,
1.173959, 0.1970489, -0.6797158, 1, 0, 0.654902, 1,
1.175707, -0.6609958, -0.7098045, 1, 0, 0.6470588, 1,
1.184224, -0.01521787, 1.357124, 1, 0, 0.6431373, 1,
1.1866, -1.012047, 3.24471, 1, 0, 0.6352941, 1,
1.203374, 1.441292, 0.6785485, 1, 0, 0.6313726, 1,
1.209136, -0.8008679, 2.901131, 1, 0, 0.6235294, 1,
1.212227, 0.1674802, 2.021516, 1, 0, 0.6196079, 1,
1.228431, -0.923553, 0.8056819, 1, 0, 0.6117647, 1,
1.232317, 0.1802677, 1.364334, 1, 0, 0.6078432, 1,
1.235021, 0.07422756, 3.340658, 1, 0, 0.6, 1,
1.23605, 1.374071, 1.126727, 1, 0, 0.5921569, 1,
1.253723, 0.1113273, 2.135056, 1, 0, 0.5882353, 1,
1.258777, -0.2694028, 2.693488, 1, 0, 0.5803922, 1,
1.279432, 0.6375881, 1.897611, 1, 0, 0.5764706, 1,
1.280536, 0.3929457, 2.096307, 1, 0, 0.5686275, 1,
1.289291, 1.363213, -0.6669102, 1, 0, 0.5647059, 1,
1.292268, -0.2120374, 2.523414, 1, 0, 0.5568628, 1,
1.310487, 1.06653, 0.6412516, 1, 0, 0.5529412, 1,
1.334522, 0.4761048, -0.2804591, 1, 0, 0.5450981, 1,
1.347142, -1.437932, 4.886085, 1, 0, 0.5411765, 1,
1.359749, -2.636888, 2.890817, 1, 0, 0.5333334, 1,
1.369025, -0.07019182, 1.061222, 1, 0, 0.5294118, 1,
1.383569, 0.8208659, 2.36955, 1, 0, 0.5215687, 1,
1.384427, -0.4223419, 1.344291, 1, 0, 0.5176471, 1,
1.385771, -1.039177, 1.226668, 1, 0, 0.509804, 1,
1.387483, -0.03511395, 1.062762, 1, 0, 0.5058824, 1,
1.391363, -2.598816, 1.016754, 1, 0, 0.4980392, 1,
1.397035, 0.1195032, 2.886367, 1, 0, 0.4901961, 1,
1.397046, -1.388981, 2.021924, 1, 0, 0.4862745, 1,
1.39976, -1.260507, 1.398515, 1, 0, 0.4784314, 1,
1.407482, 0.9247465, 1.086434, 1, 0, 0.4745098, 1,
1.408972, 0.7366068, 1.123478, 1, 0, 0.4666667, 1,
1.412482, 0.5070115, 3.338764, 1, 0, 0.4627451, 1,
1.418988, 0.7660763, 1.834799, 1, 0, 0.454902, 1,
1.433953, -0.4755071, 0.5644656, 1, 0, 0.4509804, 1,
1.442406, 1.193655, 1.302499, 1, 0, 0.4431373, 1,
1.446738, 0.05419631, 3.412197, 1, 0, 0.4392157, 1,
1.447644, -0.2751526, 3.500701, 1, 0, 0.4313726, 1,
1.460599, 0.6137784, 1.674106, 1, 0, 0.427451, 1,
1.463914, 1.450445, 3.294371, 1, 0, 0.4196078, 1,
1.471202, -0.520999, 0.4807242, 1, 0, 0.4156863, 1,
1.476333, -0.2395453, 1.826864, 1, 0, 0.4078431, 1,
1.488608, 0.2009517, 2.035237, 1, 0, 0.4039216, 1,
1.494774, -0.9188509, 0.6183566, 1, 0, 0.3960784, 1,
1.499491, 1.531586, 0.004653993, 1, 0, 0.3882353, 1,
1.503553, -1.049158, 2.586722, 1, 0, 0.3843137, 1,
1.510211, -1.109392, 1.103618, 1, 0, 0.3764706, 1,
1.513316, 1.067581, 0.4696672, 1, 0, 0.372549, 1,
1.5156, -0.6374198, 2.808456, 1, 0, 0.3647059, 1,
1.534852, -0.1382934, 2.369984, 1, 0, 0.3607843, 1,
1.539874, 0.5809081, -0.8061794, 1, 0, 0.3529412, 1,
1.574831, -3.320846, 3.379994, 1, 0, 0.3490196, 1,
1.58189, 0.3551121, -0.4385634, 1, 0, 0.3411765, 1,
1.59676, 0.9001263, 2.744073, 1, 0, 0.3372549, 1,
1.599258, 1.85421, 3.054755, 1, 0, 0.3294118, 1,
1.601192, 0.04751477, 1.124364, 1, 0, 0.3254902, 1,
1.607855, 0.6076089, 1.040849, 1, 0, 0.3176471, 1,
1.610432, -1.821249, 3.006671, 1, 0, 0.3137255, 1,
1.626119, -0.8212978, 2.630333, 1, 0, 0.3058824, 1,
1.629776, -0.1133365, 1.634612, 1, 0, 0.2980392, 1,
1.645483, 2.163893, 0.9508304, 1, 0, 0.2941177, 1,
1.647137, 0.6418455, 1.286992, 1, 0, 0.2862745, 1,
1.661628, -0.3100171, 2.668135, 1, 0, 0.282353, 1,
1.666998, 1.808517, -0.1900439, 1, 0, 0.2745098, 1,
1.711075, 0.6517342, 0.7179672, 1, 0, 0.2705882, 1,
1.716254, 0.4201151, 1.903201, 1, 0, 0.2627451, 1,
1.73236, -1.193009, 3.271546, 1, 0, 0.2588235, 1,
1.744705, 0.126468, 2.127019, 1, 0, 0.2509804, 1,
1.745996, -0.5682507, 2.847717, 1, 0, 0.2470588, 1,
1.758701, 0.3342865, 1.134849, 1, 0, 0.2392157, 1,
1.766997, 0.295854, -0.01007761, 1, 0, 0.2352941, 1,
1.77182, -1.103174, 2.945134, 1, 0, 0.227451, 1,
1.77265, 1.170301, 0.01454015, 1, 0, 0.2235294, 1,
1.775412, 1.804446, -0.1927466, 1, 0, 0.2156863, 1,
1.816158, -1.262796, 1.720714, 1, 0, 0.2117647, 1,
1.832277, -0.4005516, 0.8343228, 1, 0, 0.2039216, 1,
1.842427, -0.6363168, 0.7711409, 1, 0, 0.1960784, 1,
1.855553, -0.950086, 3.313873, 1, 0, 0.1921569, 1,
1.870425, -1.236874, 3.559251, 1, 0, 0.1843137, 1,
1.872718, 0.5546395, 2.953245, 1, 0, 0.1803922, 1,
1.877319, 0.8808402, 1.460551, 1, 0, 0.172549, 1,
1.896507, -1.388131, 3.796224, 1, 0, 0.1686275, 1,
1.921398, -0.4250943, 3.589416, 1, 0, 0.1607843, 1,
1.949701, 0.7392057, 0.6556064, 1, 0, 0.1568628, 1,
1.956664, -1.118965, 2.245287, 1, 0, 0.1490196, 1,
1.98223, 0.1795791, 2.86471, 1, 0, 0.145098, 1,
2.012884, 1.24123, -0.1144775, 1, 0, 0.1372549, 1,
2.034603, -1.428662, 1.36139, 1, 0, 0.1333333, 1,
2.03521, 0.1688702, 1.446421, 1, 0, 0.1254902, 1,
2.057983, 0.9681717, 0.2328796, 1, 0, 0.1215686, 1,
2.096705, -0.2267864, 2.369925, 1, 0, 0.1137255, 1,
2.100564, -0.2945751, 1.52311, 1, 0, 0.1098039, 1,
2.126215, 1.359958, -0.5491995, 1, 0, 0.1019608, 1,
2.144206, 0.1110117, 1.135778, 1, 0, 0.09411765, 1,
2.150503, -0.2182205, 1.835634, 1, 0, 0.09019608, 1,
2.190734, -0.1538858, 2.547223, 1, 0, 0.08235294, 1,
2.191605, -1.258529, 1.191933, 1, 0, 0.07843138, 1,
2.194052, 2.466097, 0.7326788, 1, 0, 0.07058824, 1,
2.227792, 0.2991111, 1.952488, 1, 0, 0.06666667, 1,
2.244154, -1.155537, 2.92073, 1, 0, 0.05882353, 1,
2.267631, 1.581011, 0.332634, 1, 0, 0.05490196, 1,
2.301857, 0.420096, 0.05860109, 1, 0, 0.04705882, 1,
2.333186, -0.2550217, 2.551362, 1, 0, 0.04313726, 1,
2.488863, 0.6563283, 0.573417, 1, 0, 0.03529412, 1,
2.522356, -1.409295, 2.121301, 1, 0, 0.03137255, 1,
2.646348, 0.1272171, 1.251253, 1, 0, 0.02352941, 1,
2.740967, -0.5331891, 1.280854, 1, 0, 0.01960784, 1,
2.826771, -0.8443611, 2.699163, 1, 0, 0.01176471, 1,
3.270826, 0.3607191, 1.93584, 1, 0, 0.007843138, 1
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
0.1920621, -4.533944, -7.8814, 0, -0.5, 0.5, 0.5,
0.1920621, -4.533944, -7.8814, 1, -0.5, 0.5, 0.5,
0.1920621, -4.533944, -7.8814, 1, 1.5, 0.5, 0.5,
0.1920621, -4.533944, -7.8814, 0, 1.5, 0.5, 0.5
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
-3.930403, 0.2576128, -7.8814, 0, -0.5, 0.5, 0.5,
-3.930403, 0.2576128, -7.8814, 1, -0.5, 0.5, 0.5,
-3.930403, 0.2576128, -7.8814, 1, 1.5, 0.5, 0.5,
-3.930403, 0.2576128, -7.8814, 0, 1.5, 0.5, 0.5
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
-3.930403, -4.533944, 0.132761, 0, -0.5, 0.5, 0.5,
-3.930403, -4.533944, 0.132761, 1, -0.5, 0.5, 0.5,
-3.930403, -4.533944, 0.132761, 1, 1.5, 0.5, 0.5,
-3.930403, -4.533944, 0.132761, 0, 1.5, 0.5, 0.5
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
-2, -3.4282, -6.031978,
3, -3.4282, -6.031978,
-2, -3.4282, -6.031978,
-2, -3.61249, -6.340215,
-1, -3.4282, -6.031978,
-1, -3.61249, -6.340215,
0, -3.4282, -6.031978,
0, -3.61249, -6.340215,
1, -3.4282, -6.031978,
1, -3.61249, -6.340215,
2, -3.4282, -6.031978,
2, -3.61249, -6.340215,
3, -3.4282, -6.031978,
3, -3.61249, -6.340215
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
-2, -3.981072, -6.956689, 0, -0.5, 0.5, 0.5,
-2, -3.981072, -6.956689, 1, -0.5, 0.5, 0.5,
-2, -3.981072, -6.956689, 1, 1.5, 0.5, 0.5,
-2, -3.981072, -6.956689, 0, 1.5, 0.5, 0.5,
-1, -3.981072, -6.956689, 0, -0.5, 0.5, 0.5,
-1, -3.981072, -6.956689, 1, -0.5, 0.5, 0.5,
-1, -3.981072, -6.956689, 1, 1.5, 0.5, 0.5,
-1, -3.981072, -6.956689, 0, 1.5, 0.5, 0.5,
0, -3.981072, -6.956689, 0, -0.5, 0.5, 0.5,
0, -3.981072, -6.956689, 1, -0.5, 0.5, 0.5,
0, -3.981072, -6.956689, 1, 1.5, 0.5, 0.5,
0, -3.981072, -6.956689, 0, 1.5, 0.5, 0.5,
1, -3.981072, -6.956689, 0, -0.5, 0.5, 0.5,
1, -3.981072, -6.956689, 1, -0.5, 0.5, 0.5,
1, -3.981072, -6.956689, 1, 1.5, 0.5, 0.5,
1, -3.981072, -6.956689, 0, 1.5, 0.5, 0.5,
2, -3.981072, -6.956689, 0, -0.5, 0.5, 0.5,
2, -3.981072, -6.956689, 1, -0.5, 0.5, 0.5,
2, -3.981072, -6.956689, 1, 1.5, 0.5, 0.5,
2, -3.981072, -6.956689, 0, 1.5, 0.5, 0.5,
3, -3.981072, -6.956689, 0, -0.5, 0.5, 0.5,
3, -3.981072, -6.956689, 1, -0.5, 0.5, 0.5,
3, -3.981072, -6.956689, 1, 1.5, 0.5, 0.5,
3, -3.981072, -6.956689, 0, 1.5, 0.5, 0.5
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
-2.979065, -2, -6.031978,
-2.979065, 2, -6.031978,
-2.979065, -2, -6.031978,
-3.137621, -2, -6.340215,
-2.979065, 0, -6.031978,
-3.137621, 0, -6.340215,
-2.979065, 2, -6.031978,
-3.137621, 2, -6.340215
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
-3.454734, -2, -6.956689, 0, -0.5, 0.5, 0.5,
-3.454734, -2, -6.956689, 1, -0.5, 0.5, 0.5,
-3.454734, -2, -6.956689, 1, 1.5, 0.5, 0.5,
-3.454734, -2, -6.956689, 0, 1.5, 0.5, 0.5,
-3.454734, 0, -6.956689, 0, -0.5, 0.5, 0.5,
-3.454734, 0, -6.956689, 1, -0.5, 0.5, 0.5,
-3.454734, 0, -6.956689, 1, 1.5, 0.5, 0.5,
-3.454734, 0, -6.956689, 0, 1.5, 0.5, 0.5,
-3.454734, 2, -6.956689, 0, -0.5, 0.5, 0.5,
-3.454734, 2, -6.956689, 1, -0.5, 0.5, 0.5,
-3.454734, 2, -6.956689, 1, 1.5, 0.5, 0.5,
-3.454734, 2, -6.956689, 0, 1.5, 0.5, 0.5
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
-2.979065, -3.4282, -4,
-2.979065, -3.4282, 6,
-2.979065, -3.4282, -4,
-3.137621, -3.61249, -4,
-2.979065, -3.4282, -2,
-3.137621, -3.61249, -2,
-2.979065, -3.4282, 0,
-3.137621, -3.61249, 0,
-2.979065, -3.4282, 2,
-3.137621, -3.61249, 2,
-2.979065, -3.4282, 4,
-3.137621, -3.61249, 4,
-2.979065, -3.4282, 6,
-3.137621, -3.61249, 6
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
"4",
"6"
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
-3.454734, -3.981072, -4, 0, -0.5, 0.5, 0.5,
-3.454734, -3.981072, -4, 1, -0.5, 0.5, 0.5,
-3.454734, -3.981072, -4, 1, 1.5, 0.5, 0.5,
-3.454734, -3.981072, -4, 0, 1.5, 0.5, 0.5,
-3.454734, -3.981072, -2, 0, -0.5, 0.5, 0.5,
-3.454734, -3.981072, -2, 1, -0.5, 0.5, 0.5,
-3.454734, -3.981072, -2, 1, 1.5, 0.5, 0.5,
-3.454734, -3.981072, -2, 0, 1.5, 0.5, 0.5,
-3.454734, -3.981072, 0, 0, -0.5, 0.5, 0.5,
-3.454734, -3.981072, 0, 1, -0.5, 0.5, 0.5,
-3.454734, -3.981072, 0, 1, 1.5, 0.5, 0.5,
-3.454734, -3.981072, 0, 0, 1.5, 0.5, 0.5,
-3.454734, -3.981072, 2, 0, -0.5, 0.5, 0.5,
-3.454734, -3.981072, 2, 1, -0.5, 0.5, 0.5,
-3.454734, -3.981072, 2, 1, 1.5, 0.5, 0.5,
-3.454734, -3.981072, 2, 0, 1.5, 0.5, 0.5,
-3.454734, -3.981072, 4, 0, -0.5, 0.5, 0.5,
-3.454734, -3.981072, 4, 1, -0.5, 0.5, 0.5,
-3.454734, -3.981072, 4, 1, 1.5, 0.5, 0.5,
-3.454734, -3.981072, 4, 0, 1.5, 0.5, 0.5,
-3.454734, -3.981072, 6, 0, -0.5, 0.5, 0.5,
-3.454734, -3.981072, 6, 1, -0.5, 0.5, 0.5,
-3.454734, -3.981072, 6, 1, 1.5, 0.5, 0.5,
-3.454734, -3.981072, 6, 0, 1.5, 0.5, 0.5
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
-2.979065, -3.4282, -6.031978,
-2.979065, 3.943425, -6.031978,
-2.979065, -3.4282, 6.2975,
-2.979065, 3.943425, 6.2975,
-2.979065, -3.4282, -6.031978,
-2.979065, -3.4282, 6.2975,
-2.979065, 3.943425, -6.031978,
-2.979065, 3.943425, 6.2975,
-2.979065, -3.4282, -6.031978,
3.363189, -3.4282, -6.031978,
-2.979065, -3.4282, 6.2975,
3.363189, -3.4282, 6.2975,
-2.979065, 3.943425, -6.031978,
3.363189, 3.943425, -6.031978,
-2.979065, 3.943425, 6.2975,
3.363189, 3.943425, 6.2975,
3.363189, -3.4282, -6.031978,
3.363189, 3.943425, -6.031978,
3.363189, -3.4282, 6.2975,
3.363189, 3.943425, 6.2975,
3.363189, -3.4282, -6.031978,
3.363189, -3.4282, 6.2975,
3.363189, 3.943425, -6.031978,
3.363189, 3.943425, 6.2975
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
var radius = 8.385044;
var distance = 37.30601;
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
mvMatrix.translate( -0.1920621, -0.2576128, -0.132761 );
mvMatrix.scale( 1.429472, 1.229861, 0.7353169 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.30601);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
azide<-read.table("azide.xyz")
```

```
## Error in read.table("azide.xyz"): no lines available in input
```

```r
x<-azide$V2
```

```
## Error in eval(expr, envir, enclos): object 'azide' not found
```

```r
y<-azide$V3
```

```
## Error in eval(expr, envir, enclos): object 'azide' not found
```

```r
z<-azide$V4
```

```
## Error in eval(expr, envir, enclos): object 'azide' not found
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
-2.886702, 1.765631, -0.8488182, 0, 0, 1, 1, 1,
-2.83329, -0.3136801, -0.7185507, 1, 0, 0, 1, 1,
-2.650749, 0.3838819, -0.07564819, 1, 0, 0, 1, 1,
-2.575452, 1.151552, 0.2190824, 1, 0, 0, 1, 1,
-2.540404, 1.225279, -1.191089, 1, 0, 0, 1, 1,
-2.5093, -1.26035, -2.160261, 1, 0, 0, 1, 1,
-2.310968, 1.052112, -1.968716, 0, 0, 0, 1, 1,
-2.299723, 0.2404185, -1.965499, 0, 0, 0, 1, 1,
-2.25242, 0.007765918, -0.4380787, 0, 0, 0, 1, 1,
-2.199, -2.243542, -0.88278, 0, 0, 0, 1, 1,
-2.198321, 1.272264, -0.6433735, 0, 0, 0, 1, 1,
-2.158996, -0.001746228, -0.6348138, 0, 0, 0, 1, 1,
-2.142992, 0.79295, -1.626039, 0, 0, 0, 1, 1,
-2.139751, -0.9516421, -2.653784, 1, 1, 1, 1, 1,
-2.126168, -0.2153565, -1.638403, 1, 1, 1, 1, 1,
-2.117572, 0.05607024, -3.189679, 1, 1, 1, 1, 1,
-2.101804, -0.07548908, -1.14586, 1, 1, 1, 1, 1,
-2.050525, -0.1654654, -2.229931, 1, 1, 1, 1, 1,
-1.938325, -0.7977265, -1.693882, 1, 1, 1, 1, 1,
-1.922584, 1.557097, 0.5560669, 1, 1, 1, 1, 1,
-1.911654, 0.3060869, -2.502638, 1, 1, 1, 1, 1,
-1.87751, 0.2969943, -0.09426881, 1, 1, 1, 1, 1,
-1.867012, 0.6237267, -1.214906, 1, 1, 1, 1, 1,
-1.86533, -0.8041266, -0.9680793, 1, 1, 1, 1, 1,
-1.83813, 0.2489574, -2.185624, 1, 1, 1, 1, 1,
-1.825673, -1.748944, -2.873788, 1, 1, 1, 1, 1,
-1.825503, -1.341553, -1.459886, 1, 1, 1, 1, 1,
-1.804714, 0.04688824, -0.07911578, 1, 1, 1, 1, 1,
-1.798114, -1.107882, -2.579596, 0, 0, 1, 1, 1,
-1.78604, -0.1461555, -2.08284, 1, 0, 0, 1, 1,
-1.785405, -0.2806811, -2.051854, 1, 0, 0, 1, 1,
-1.758483, -1.565918, -3.589246, 1, 0, 0, 1, 1,
-1.749493, -0.7207384, -0.1342455, 1, 0, 0, 1, 1,
-1.74845, 1.111979, 1.67755, 1, 0, 0, 1, 1,
-1.734946, 0.4380826, -2.324077, 0, 0, 0, 1, 1,
-1.724686, -0.1737991, 0.7214158, 0, 0, 0, 1, 1,
-1.722758, 1.417079, -0.9346249, 0, 0, 0, 1, 1,
-1.718016, 0.592016, -2.329095, 0, 0, 0, 1, 1,
-1.7092, -0.5680343, -2.454319, 0, 0, 0, 1, 1,
-1.68523, 0.5406144, -1.125147, 0, 0, 0, 1, 1,
-1.684729, 0.7622253, -0.3525453, 0, 0, 0, 1, 1,
-1.643383, 0.8637305, -1.645148, 1, 1, 1, 1, 1,
-1.633776, 1.196095, -2.597501, 1, 1, 1, 1, 1,
-1.631705, 0.6356499, -2.271892, 1, 1, 1, 1, 1,
-1.623995, 0.004270724, -2.515394, 1, 1, 1, 1, 1,
-1.61474, 1.911783, -0.1706524, 1, 1, 1, 1, 1,
-1.593921, -1.042802, -1.95887, 1, 1, 1, 1, 1,
-1.587745, 0.7328519, 0.07109856, 1, 1, 1, 1, 1,
-1.567354, 0.5385323, -1.283437, 1, 1, 1, 1, 1,
-1.565809, 0.5696065, -0.6732319, 1, 1, 1, 1, 1,
-1.565178, 1.253938, -0.1189803, 1, 1, 1, 1, 1,
-1.546056, 1.060062, -1.332823, 1, 1, 1, 1, 1,
-1.541148, -1.110476, -2.209924, 1, 1, 1, 1, 1,
-1.525039, 0.1436943, -1.893161, 1, 1, 1, 1, 1,
-1.524444, -1.659407, -1.559309, 1, 1, 1, 1, 1,
-1.521478, -0.274573, 0.6339511, 1, 1, 1, 1, 1,
-1.503616, -0.6462688, -2.808169, 0, 0, 1, 1, 1,
-1.498751, 1.057622, -1.612897, 1, 0, 0, 1, 1,
-1.473773, 2.036242, -1.250983, 1, 0, 0, 1, 1,
-1.468993, 1.036097, -0.8531185, 1, 0, 0, 1, 1,
-1.455451, 0.9072922, -1.108019, 1, 0, 0, 1, 1,
-1.452502, 0.4790457, -1.626475, 1, 0, 0, 1, 1,
-1.430748, -0.01377334, -1.847512, 0, 0, 0, 1, 1,
-1.43018, 0.504484, -3.734273, 0, 0, 0, 1, 1,
-1.424357, 0.4953195, -1.940889, 0, 0, 0, 1, 1,
-1.411293, -1.464447, -0.9087409, 0, 0, 0, 1, 1,
-1.409913, 1.126265, -1.255637, 0, 0, 0, 1, 1,
-1.380109, 0.8976784, -1.170893, 0, 0, 0, 1, 1,
-1.374258, 0.5563484, -2.044864, 0, 0, 0, 1, 1,
-1.364766, -0.03442404, -1.057827, 1, 1, 1, 1, 1,
-1.355276, 0.4856605, -2.366516, 1, 1, 1, 1, 1,
-1.354227, -0.1012935, -1.111121, 1, 1, 1, 1, 1,
-1.348628, -1.527829, -2.728753, 1, 1, 1, 1, 1,
-1.337922, -1.100885, -4.394704, 1, 1, 1, 1, 1,
-1.336761, 0.5572234, -0.2536347, 1, 1, 1, 1, 1,
-1.335655, -0.1471433, -4.191491, 1, 1, 1, 1, 1,
-1.329111, -0.6241533, -1.093811, 1, 1, 1, 1, 1,
-1.325938, 0.9566233, -0.437096, 1, 1, 1, 1, 1,
-1.323471, 1.043586, -2.176919, 1, 1, 1, 1, 1,
-1.317776, 1.005021, -2.08313, 1, 1, 1, 1, 1,
-1.314285, -0.6487312, -0.5615748, 1, 1, 1, 1, 1,
-1.311106, -0.4474819, -0.9206409, 1, 1, 1, 1, 1,
-1.310168, -0.5647549, -2.597505, 1, 1, 1, 1, 1,
-1.30769, -0.245151, -0.8759736, 1, 1, 1, 1, 1,
-1.306775, 0.3887966, -1.276758, 0, 0, 1, 1, 1,
-1.306257, 0.8633985, -0.9958526, 1, 0, 0, 1, 1,
-1.301579, -1.42359, -1.562477, 1, 0, 0, 1, 1,
-1.300368, -2.576883, -2.102943, 1, 0, 0, 1, 1,
-1.296598, -0.4901535, -2.565211, 1, 0, 0, 1, 1,
-1.275568, 0.4842197, -0.1714903, 1, 0, 0, 1, 1,
-1.272632, -0.6017339, -2.552236, 0, 0, 0, 1, 1,
-1.270355, 1.219539, -1.892665, 0, 0, 0, 1, 1,
-1.261131, -0.1620517, -1.571411, 0, 0, 0, 1, 1,
-1.252985, 1.920551, 0.3262219, 0, 0, 0, 1, 1,
-1.251307, -0.07654217, -1.077174, 0, 0, 0, 1, 1,
-1.246856, 0.948921, -1.470536, 0, 0, 0, 1, 1,
-1.242707, 0.1687498, 0.002256269, 0, 0, 0, 1, 1,
-1.238901, 0.2427768, -1.139689, 1, 1, 1, 1, 1,
-1.238155, -1.062032, -1.667468, 1, 1, 1, 1, 1,
-1.219879, -1.382314, -4.293446, 1, 1, 1, 1, 1,
-1.208341, -1.143125, -2.26158, 1, 1, 1, 1, 1,
-1.196224, -0.3382413, -2.258205, 1, 1, 1, 1, 1,
-1.187478, -0.1633205, -2.041463, 1, 1, 1, 1, 1,
-1.177432, 1.385148, -0.3349731, 1, 1, 1, 1, 1,
-1.171253, -0.388016, -2.183358, 1, 1, 1, 1, 1,
-1.168569, -0.7766606, -2.892437, 1, 1, 1, 1, 1,
-1.166779, -0.2701114, -2.521291, 1, 1, 1, 1, 1,
-1.1652, 2.090109, -0.6338958, 1, 1, 1, 1, 1,
-1.165186, 2.479843, -1.072343, 1, 1, 1, 1, 1,
-1.162014, -0.8864561, -2.415147, 1, 1, 1, 1, 1,
-1.161888, -0.3814404, -2.13223, 1, 1, 1, 1, 1,
-1.156991, -0.4001667, -1.389096, 1, 1, 1, 1, 1,
-1.145698, -0.5195268, -2.599367, 0, 0, 1, 1, 1,
-1.144685, -1.19282, -1.84078, 1, 0, 0, 1, 1,
-1.143177, 1.044574, -1.051753, 1, 0, 0, 1, 1,
-1.141643, 0.1413852, -2.538933, 1, 0, 0, 1, 1,
-1.1399, 1.960213, -1.360573, 1, 0, 0, 1, 1,
-1.125979, 0.2683608, -1.511402, 1, 0, 0, 1, 1,
-1.11964, 1.111958, -0.3912315, 0, 0, 0, 1, 1,
-1.106214, 0.8812267, -0.2472671, 0, 0, 0, 1, 1,
-1.1029, 1.678909, -0.7729788, 0, 0, 0, 1, 1,
-1.10124, 0.7319002, -0.1451705, 0, 0, 0, 1, 1,
-1.101231, 1.33783, 0.003847733, 0, 0, 0, 1, 1,
-1.100679, 0.274037, -1.515303, 0, 0, 0, 1, 1,
-1.094334, 0.9055754, -0.3817888, 0, 0, 0, 1, 1,
-1.08047, 0.119735, -2.541396, 1, 1, 1, 1, 1,
-1.080181, -0.2145806, 0.052626, 1, 1, 1, 1, 1,
-1.07903, 0.4063116, -0.4251474, 1, 1, 1, 1, 1,
-1.073922, 0.6653127, -2.163767, 1, 1, 1, 1, 1,
-1.070729, -0.2689723, -1.752265, 1, 1, 1, 1, 1,
-1.070513, -0.6634786, -3.537395, 1, 1, 1, 1, 1,
-1.069323, -1.877068, -2.246279, 1, 1, 1, 1, 1,
-1.068195, 2.381818, -0.3266606, 1, 1, 1, 1, 1,
-1.064146, 1.265537, -0.7800424, 1, 1, 1, 1, 1,
-1.059738, -1.091352, -2.654928, 1, 1, 1, 1, 1,
-1.057829, 1.410178, -1.546457, 1, 1, 1, 1, 1,
-1.050439, -0.1705006, -2.222649, 1, 1, 1, 1, 1,
-1.044094, 1.444602, -0.2510699, 1, 1, 1, 1, 1,
-1.042452, -1.210932, -1.500288, 1, 1, 1, 1, 1,
-1.039326, 0.1535079, -1.205613, 1, 1, 1, 1, 1,
-1.035447, -1.128172, -0.7200299, 0, 0, 1, 1, 1,
-1.034008, -1.26031, -3.145373, 1, 0, 0, 1, 1,
-1.025018, -0.4723657, -2.341224, 1, 0, 0, 1, 1,
-1.024243, -0.5236109, -1.27921, 1, 0, 0, 1, 1,
-1.022181, 0.7354353, -1.326954, 1, 0, 0, 1, 1,
-1.022108, 0.6288936, -0.7463571, 1, 0, 0, 1, 1,
-1.02189, -1.562697, -2.467386, 0, 0, 0, 1, 1,
-1.017369, -1.278536, -2.361515, 0, 0, 0, 1, 1,
-1.016672, -0.505116, -1.810585, 0, 0, 0, 1, 1,
-1.01388, 0.6254587, -1.218981, 0, 0, 0, 1, 1,
-1.013122, -3.081399, -1.927114, 0, 0, 0, 1, 1,
-1.010354, 0.4320184, -2.22834, 0, 0, 0, 1, 1,
-0.9909354, 0.6118262, -2.728703, 0, 0, 0, 1, 1,
-0.985471, 1.150499, -0.25193, 1, 1, 1, 1, 1,
-0.983011, 0.522452, 0.3801296, 1, 1, 1, 1, 1,
-0.9782356, -1.083379, -0.476376, 1, 1, 1, 1, 1,
-0.9751749, -0.9444311, -3.411235, 1, 1, 1, 1, 1,
-0.9722183, -0.6256312, -3.441868, 1, 1, 1, 1, 1,
-0.9701958, -0.7115442, -3.458866, 1, 1, 1, 1, 1,
-0.9659042, -0.2494072, -2.40245, 1, 1, 1, 1, 1,
-0.9640872, -0.6847229, -1.733421, 1, 1, 1, 1, 1,
-0.9634986, -0.2760232, -1.473391, 1, 1, 1, 1, 1,
-0.9601353, 1.133212, -1.281963, 1, 1, 1, 1, 1,
-0.9587227, -0.5214637, -2.083652, 1, 1, 1, 1, 1,
-0.9584668, 1.495167, -0.5169057, 1, 1, 1, 1, 1,
-0.9535834, 0.525847, -0.2589894, 1, 1, 1, 1, 1,
-0.9467211, -0.6923159, -2.516823, 1, 1, 1, 1, 1,
-0.9369129, -0.1927139, -1.266782, 1, 1, 1, 1, 1,
-0.9350837, 2.451267, 0.6473621, 0, 0, 1, 1, 1,
-0.9303001, 0.7019641, 0.06435374, 1, 0, 0, 1, 1,
-0.9258078, -1.724392, -4.028141, 1, 0, 0, 1, 1,
-0.9235522, -2.113279, -4.431751, 1, 0, 0, 1, 1,
-0.9231858, -1.551791, -3.379858, 1, 0, 0, 1, 1,
-0.9176342, 0.4111647, -1.551358, 1, 0, 0, 1, 1,
-0.9136766, -1.425675, -2.820241, 0, 0, 0, 1, 1,
-0.9071911, -0.7000813, -3.072808, 0, 0, 0, 1, 1,
-0.9002739, -0.3499126, -2.164011, 0, 0, 0, 1, 1,
-0.8977975, 0.692811, -0.7232344, 0, 0, 0, 1, 1,
-0.8954495, -0.8894548, -1.851238, 0, 0, 0, 1, 1,
-0.8926387, -1.642401, -2.521396, 0, 0, 0, 1, 1,
-0.8920608, -0.460547, -1.312972, 0, 0, 0, 1, 1,
-0.8907517, -0.3534596, -0.352973, 1, 1, 1, 1, 1,
-0.8861415, -0.2954069, -3.148268, 1, 1, 1, 1, 1,
-0.8859, 0.6078158, -0.3694758, 1, 1, 1, 1, 1,
-0.8738322, 0.6052595, -1.117122, 1, 1, 1, 1, 1,
-0.8668589, 0.8600639, -1.850532, 1, 1, 1, 1, 1,
-0.8634357, 0.8961387, -0.6051154, 1, 1, 1, 1, 1,
-0.8607555, -0.2101999, -2.653483, 1, 1, 1, 1, 1,
-0.8606386, -0.3427343, -2.132502, 1, 1, 1, 1, 1,
-0.841637, -0.9138039, -1.410277, 1, 1, 1, 1, 1,
-0.8388268, -0.7221198, -2.023941, 1, 1, 1, 1, 1,
-0.8377993, 0.694632, -1.012219, 1, 1, 1, 1, 1,
-0.8315901, -0.1761551, -1.984407, 1, 1, 1, 1, 1,
-0.8264809, 0.527335, -0.3305376, 1, 1, 1, 1, 1,
-0.8193511, -0.7192454, -3.64662, 1, 1, 1, 1, 1,
-0.81843, 0.552381, -0.08770532, 1, 1, 1, 1, 1,
-0.8153715, 2.650669, 1.019119, 0, 0, 1, 1, 1,
-0.8151284, -0.0683868, -1.873389, 1, 0, 0, 1, 1,
-0.8143713, 0.332844, 0.4106728, 1, 0, 0, 1, 1,
-0.8126151, -1.214597, -2.790987, 1, 0, 0, 1, 1,
-0.8107941, -0.5796831, -2.43477, 1, 0, 0, 1, 1,
-0.8107796, 3.199055, 0.5142298, 1, 0, 0, 1, 1,
-0.8080909, -1.029114, -2.17162, 0, 0, 0, 1, 1,
-0.8052874, 0.8941542, 0.03271365, 0, 0, 0, 1, 1,
-0.8048661, -0.2131991, -3.031996, 0, 0, 0, 1, 1,
-0.799738, -0.03606083, -1.580971, 0, 0, 0, 1, 1,
-0.794452, -1.370135, -3.8098, 0, 0, 0, 1, 1,
-0.7941287, -0.8290848, -0.3836124, 0, 0, 0, 1, 1,
-0.7902904, 0.01889373, -2.11043, 0, 0, 0, 1, 1,
-0.7881101, 0.08824982, -0.3652422, 1, 1, 1, 1, 1,
-0.7811943, -0.4482315, -2.390115, 1, 1, 1, 1, 1,
-0.7744766, -0.5677277, -2.902869, 1, 1, 1, 1, 1,
-0.7736759, -1.029615, -1.759215, 1, 1, 1, 1, 1,
-0.7716581, 0.447447, -1.32984, 1, 1, 1, 1, 1,
-0.770106, -0.3400025, -1.796372, 1, 1, 1, 1, 1,
-0.7693492, 1.484766, -0.8631009, 1, 1, 1, 1, 1,
-0.7633892, 1.449859, -0.8678309, 1, 1, 1, 1, 1,
-0.761386, 0.7196341, 0.09358711, 1, 1, 1, 1, 1,
-0.7609382, -0.9359515, -3.24255, 1, 1, 1, 1, 1,
-0.7596591, 1.156488, -1.638245, 1, 1, 1, 1, 1,
-0.758077, -0.4474303, -0.448649, 1, 1, 1, 1, 1,
-0.7578393, 1.085131, -0.9652784, 1, 1, 1, 1, 1,
-0.749622, -0.4535996, -0.1340442, 1, 1, 1, 1, 1,
-0.7454519, 0.4510268, 0.09357305, 1, 1, 1, 1, 1,
-0.7431435, 0.2374655, -0.932894, 0, 0, 1, 1, 1,
-0.7393665, -1.558522, -2.362532, 1, 0, 0, 1, 1,
-0.7380916, -1.196154, -4.180892, 1, 0, 0, 1, 1,
-0.7346696, 1.500051, 0.4812919, 1, 0, 0, 1, 1,
-0.7311174, -1.110772, -4.195113, 1, 0, 0, 1, 1,
-0.7274602, -0.06371948, -0.9379413, 1, 0, 0, 1, 1,
-0.7249157, -0.5783616, -2.527747, 0, 0, 0, 1, 1,
-0.7247702, -0.2833927, -0.8621637, 0, 0, 0, 1, 1,
-0.7199681, 1.222808, -0.4947336, 0, 0, 0, 1, 1,
-0.7122802, -0.328671, -1.981025, 0, 0, 0, 1, 1,
-0.7089271, 0.8235441, 0.7715923, 0, 0, 0, 1, 1,
-0.7077785, 0.6346435, -0.1657909, 0, 0, 0, 1, 1,
-0.7029214, 0.528878, -0.2979856, 0, 0, 0, 1, 1,
-0.7027907, -0.4448561, -1.680423, 1, 1, 1, 1, 1,
-0.6989206, 0.4688857, -1.291099, 1, 1, 1, 1, 1,
-0.6961367, -0.9882827, -2.903214, 1, 1, 1, 1, 1,
-0.6913572, -0.07421216, -2.46594, 1, 1, 1, 1, 1,
-0.6890397, -1.185512, -1.83753, 1, 1, 1, 1, 1,
-0.6874015, 0.1281191, 0.1836039, 1, 1, 1, 1, 1,
-0.6861589, 0.1936059, -0.8337651, 1, 1, 1, 1, 1,
-0.6828275, 0.1890258, 1.706602, 1, 1, 1, 1, 1,
-0.6763633, -0.7716155, -3.438843, 1, 1, 1, 1, 1,
-0.6751347, 1.288849, 3.300072, 1, 1, 1, 1, 1,
-0.671553, 0.1456604, -0.7153338, 1, 1, 1, 1, 1,
-0.6704265, -1.175719, -3.044974, 1, 1, 1, 1, 1,
-0.6685762, 1.319112, 0.03468888, 1, 1, 1, 1, 1,
-0.6672488, 0.4952059, -0.6852902, 1, 1, 1, 1, 1,
-0.665311, 0.1439415, -2.934294, 1, 1, 1, 1, 1,
-0.6619853, 3.368592, 0.4925464, 0, 0, 1, 1, 1,
-0.6529996, 1.007879, -2.340347, 1, 0, 0, 1, 1,
-0.6516628, 0.7093183, -0.4805038, 1, 0, 0, 1, 1,
-0.6503436, 0.7442158, -2.141713, 1, 0, 0, 1, 1,
-0.646946, 0.6828367, -1.79232, 1, 0, 0, 1, 1,
-0.6435628, -0.8810062, -1.476, 1, 0, 0, 1, 1,
-0.6405587, 1.489969, -1.21991, 0, 0, 0, 1, 1,
-0.6400327, -0.4100949, -1.111365, 0, 0, 0, 1, 1,
-0.6387973, -1.290497, -3.281702, 0, 0, 0, 1, 1,
-0.6339468, 0.3261319, -0.2839215, 0, 0, 0, 1, 1,
-0.6326594, 0.4034162, -2.308566, 0, 0, 0, 1, 1,
-0.6307985, 0.1771083, -1.327909, 0, 0, 0, 1, 1,
-0.630113, -0.506552, -3.806069, 0, 0, 0, 1, 1,
-0.6260367, -0.3604167, -1.580679, 1, 1, 1, 1, 1,
-0.6255536, 0.6770186, 0.421644, 1, 1, 1, 1, 1,
-0.6162835, -1.105049, -2.511643, 1, 1, 1, 1, 1,
-0.6153515, -0.3919829, -1.697259, 1, 1, 1, 1, 1,
-0.6142852, 2.300377, -0.7091988, 1, 1, 1, 1, 1,
-0.612414, 0.3705035, -1.286505, 1, 1, 1, 1, 1,
-0.6110392, -1.926126, -1.725967, 1, 1, 1, 1, 1,
-0.6088785, -1.893063, -4.847822, 1, 1, 1, 1, 1,
-0.6035858, -0.1734556, -1.004346, 1, 1, 1, 1, 1,
-0.5983053, 1.025085, -0.4136319, 1, 1, 1, 1, 1,
-0.5908462, 0.2309851, -1.516695, 1, 1, 1, 1, 1,
-0.5879522, 0.4714053, -3.281987, 1, 1, 1, 1, 1,
-0.5876564, 0.7959657, -2.812471, 1, 1, 1, 1, 1,
-0.5854269, 0.5877001, 0.1489028, 1, 1, 1, 1, 1,
-0.5818636, 0.4726744, 0.3349276, 1, 1, 1, 1, 1,
-0.5799471, 0.4257282, -1.085622, 0, 0, 1, 1, 1,
-0.5773027, 0.1950327, -3.738259, 1, 0, 0, 1, 1,
-0.5731832, -0.03793548, -0.5262997, 1, 0, 0, 1, 1,
-0.572736, 0.4413904, -1.86024, 1, 0, 0, 1, 1,
-0.5671293, -0.6217565, -3.022518, 1, 0, 0, 1, 1,
-0.5652459, -1.392957, -3.465902, 1, 0, 0, 1, 1,
-0.5650433, -2.132195, -1.876938, 0, 0, 0, 1, 1,
-0.559262, -1.797412, -1.724171, 0, 0, 0, 1, 1,
-0.5575452, -2.339177, -3.02801, 0, 0, 0, 1, 1,
-0.5563039, 0.2714902, -2.429224, 0, 0, 0, 1, 1,
-0.5523209, -1.370712, -3.30652, 0, 0, 0, 1, 1,
-0.5504708, -0.3915233, -1.48804, 0, 0, 0, 1, 1,
-0.5502882, -0.7985573, -2.389724, 0, 0, 0, 1, 1,
-0.5501061, -1.3985, -3.234833, 1, 1, 1, 1, 1,
-0.5495378, -1.042388, -3.496845, 1, 1, 1, 1, 1,
-0.5442958, -1.06832, -3.643782, 1, 1, 1, 1, 1,
-0.5428458, -0.2922935, -0.7223423, 1, 1, 1, 1, 1,
-0.5426207, -1.712376, -2.627058, 1, 1, 1, 1, 1,
-0.5375667, -1.371306, -5.012393, 1, 1, 1, 1, 1,
-0.5346261, -0.1911961, -2.931446, 1, 1, 1, 1, 1,
-0.5330331, -0.4889283, -0.9480821, 1, 1, 1, 1, 1,
-0.5326619, -1.680164, -5.084042, 1, 1, 1, 1, 1,
-0.5273271, -1.455332, -3.141461, 1, 1, 1, 1, 1,
-0.5258515, 0.3638958, -0.8160058, 1, 1, 1, 1, 1,
-0.5255311, -0.5072052, -2.526259, 1, 1, 1, 1, 1,
-0.5239902, 0.05330913, -1.970437, 1, 1, 1, 1, 1,
-0.5233839, -1.752549, -3.773305, 1, 1, 1, 1, 1,
-0.5185712, -0.500333, -2.807166, 1, 1, 1, 1, 1,
-0.5166764, -0.8459495, -1.36682, 0, 0, 1, 1, 1,
-0.5141336, -1.291682, -3.230877, 1, 0, 0, 1, 1,
-0.50826, 0.6946956, -0.5226526, 1, 0, 0, 1, 1,
-0.5048808, -0.9554358, -2.236999, 1, 0, 0, 1, 1,
-0.5038269, -0.6244138, -1.532646, 1, 0, 0, 1, 1,
-0.5025437, 0.7041467, -1.022206, 1, 0, 0, 1, 1,
-0.4978185, 1.155831, 0.1159052, 0, 0, 0, 1, 1,
-0.4932013, 2.552029, -2.904329, 0, 0, 0, 1, 1,
-0.4926383, 0.1061384, -1.522988, 0, 0, 0, 1, 1,
-0.4888211, -1.167321, -2.848598, 0, 0, 0, 1, 1,
-0.4865718, 1.52201, -0.9434386, 0, 0, 0, 1, 1,
-0.4860776, 0.4309515, 0.1652662, 0, 0, 0, 1, 1,
-0.484025, -1.264188, -2.812158, 0, 0, 0, 1, 1,
-0.4817843, 0.6895015, -1.18007, 1, 1, 1, 1, 1,
-0.4811678, 0.2734112, -1.960139, 1, 1, 1, 1, 1,
-0.479867, 0.774924, -0.4258227, 1, 1, 1, 1, 1,
-0.4796972, 2.013276, -1.414325, 1, 1, 1, 1, 1,
-0.4787473, 1.065478, -0.1082729, 1, 1, 1, 1, 1,
-0.4771811, 0.9612223, 0.3873305, 1, 1, 1, 1, 1,
-0.4760701, -0.1743444, -1.801471, 1, 1, 1, 1, 1,
-0.4755641, 0.5630299, -2.300328, 1, 1, 1, 1, 1,
-0.4696756, -0.7599511, -2.131026, 1, 1, 1, 1, 1,
-0.4515433, -0.4638869, -3.41267, 1, 1, 1, 1, 1,
-0.4479682, 1.194907, -0.9788495, 1, 1, 1, 1, 1,
-0.4469824, 0.09839847, -2.292534, 1, 1, 1, 1, 1,
-0.444497, -0.1126373, -1.828534, 1, 1, 1, 1, 1,
-0.4420493, 0.02112866, -2.667211, 1, 1, 1, 1, 1,
-0.439483, 0.1746418, -0.2659711, 1, 1, 1, 1, 1,
-0.4375425, 1.384804, -0.7206975, 0, 0, 1, 1, 1,
-0.4367367, 1.741884, 0.3238822, 1, 0, 0, 1, 1,
-0.4365339, 3.13417, 0.5209647, 1, 0, 0, 1, 1,
-0.4339296, 0.681861, -1.066805, 1, 0, 0, 1, 1,
-0.4303111, -0.9036374, -1.039725, 1, 0, 0, 1, 1,
-0.4291631, -0.3369076, -2.779004, 1, 0, 0, 1, 1,
-0.4249728, -0.5351941, -2.778658, 0, 0, 0, 1, 1,
-0.4220972, 0.6035972, 0.453758, 0, 0, 0, 1, 1,
-0.4182183, -0.5396847, -1.266593, 0, 0, 0, 1, 1,
-0.416307, 0.6070834, -0.2601054, 0, 0, 0, 1, 1,
-0.4045508, 0.4938528, -0.5705172, 0, 0, 0, 1, 1,
-0.4040582, 0.8968945, 1.601508, 0, 0, 0, 1, 1,
-0.402154, -0.8700283, -3.292833, 0, 0, 0, 1, 1,
-0.3996983, 0.1004314, -0.1369347, 1, 1, 1, 1, 1,
-0.3992037, 0.6565509, -0.7575668, 1, 1, 1, 1, 1,
-0.396589, -0.4108222, -3.803821, 1, 1, 1, 1, 1,
-0.3943686, -0.141332, -2.13107, 1, 1, 1, 1, 1,
-0.3926208, 2.429543, -0.05828271, 1, 1, 1, 1, 1,
-0.3922704, 1.827837, -1.609116, 1, 1, 1, 1, 1,
-0.3879231, 0.4738817, 0.428899, 1, 1, 1, 1, 1,
-0.3844969, -1.793872, -3.736437, 1, 1, 1, 1, 1,
-0.3813437, -0.5769143, -3.700217, 1, 1, 1, 1, 1,
-0.380673, 0.3597409, -1.755376, 1, 1, 1, 1, 1,
-0.3751201, 0.05159142, -2.097497, 1, 1, 1, 1, 1,
-0.3741021, -0.4414067, -3.602719, 1, 1, 1, 1, 1,
-0.3729977, 0.8893492, 1.550887, 1, 1, 1, 1, 1,
-0.3721654, 0.5538893, -2.859805, 1, 1, 1, 1, 1,
-0.3641857, 1.182339, 0.6779131, 1, 1, 1, 1, 1,
-0.3614166, -0.6821338, -3.156841, 0, 0, 1, 1, 1,
-0.3611258, 2.378415, -2.2727, 1, 0, 0, 1, 1,
-0.3606397, -2.338552, -2.108039, 1, 0, 0, 1, 1,
-0.3592384, 0.9033777, -0.6241266, 1, 0, 0, 1, 1,
-0.356815, -1.260691, -2.678928, 1, 0, 0, 1, 1,
-0.3551036, 0.4616241, -1.186916, 1, 0, 0, 1, 1,
-0.3541207, -0.5440101, -1.694998, 0, 0, 0, 1, 1,
-0.3528896, -1.463877, -1.237615, 0, 0, 0, 1, 1,
-0.3496455, 0.194851, 0.02774214, 0, 0, 0, 1, 1,
-0.3479617, 0.02620544, -0.4614393, 0, 0, 0, 1, 1,
-0.3474447, 0.9895135, 0.4783765, 0, 0, 0, 1, 1,
-0.3469774, -0.1839283, -2.408415, 0, 0, 0, 1, 1,
-0.3391834, -0.01834026, -0.478796, 0, 0, 0, 1, 1,
-0.3390663, 1.204183, -0.8806502, 1, 1, 1, 1, 1,
-0.3386404, 1.386521, 0.469751, 1, 1, 1, 1, 1,
-0.3382374, 0.5646933, -0.8588548, 1, 1, 1, 1, 1,
-0.3370939, 1.149934, -0.3768981, 1, 1, 1, 1, 1,
-0.3355528, -1.084387, -2.27498, 1, 1, 1, 1, 1,
-0.3336365, 1.008024, 0.6378267, 1, 1, 1, 1, 1,
-0.3298129, 0.07601558, -2.449993, 1, 1, 1, 1, 1,
-0.3230515, 0.75716, -0.465285, 1, 1, 1, 1, 1,
-0.3184285, -0.809428, -2.159811, 1, 1, 1, 1, 1,
-0.3099739, -0.3670708, -2.072772, 1, 1, 1, 1, 1,
-0.3036918, -2.11135, -5.556618, 1, 1, 1, 1, 1,
-0.3013433, -1.020965, -3.618321, 1, 1, 1, 1, 1,
-0.2997779, 0.1807755, -1.924883, 1, 1, 1, 1, 1,
-0.2982275, -0.4259832, -1.515132, 1, 1, 1, 1, 1,
-0.2981229, -0.9174513, -2.927524, 1, 1, 1, 1, 1,
-0.2928049, -1.109773, -3.427961, 0, 0, 1, 1, 1,
-0.2896498, 1.441441, 1.214099, 1, 0, 0, 1, 1,
-0.2872085, -0.8441349, -2.32632, 1, 0, 0, 1, 1,
-0.2838255, 1.898282, 0.3271424, 1, 0, 0, 1, 1,
-0.2813253, 2.292526, -0.9321138, 1, 0, 0, 1, 1,
-0.2725239, 1.038733, -0.2276356, 1, 0, 0, 1, 1,
-0.2694176, -0.04839074, -2.79998, 0, 0, 0, 1, 1,
-0.2657212, 1.187596, -3.094306, 0, 0, 0, 1, 1,
-0.2628887, -1.965416, -3.694131, 0, 0, 0, 1, 1,
-0.2623166, 0.5694287, -0.2747357, 0, 0, 0, 1, 1,
-0.2556907, -1.431791, -3.982867, 0, 0, 0, 1, 1,
-0.2536172, 0.8313814, -0.1452098, 0, 0, 0, 1, 1,
-0.2505662, 0.8094648, -0.9929063, 0, 0, 0, 1, 1,
-0.2474359, -1.198994, -3.777261, 1, 1, 1, 1, 1,
-0.2458093, -0.2812393, -1.150055, 1, 1, 1, 1, 1,
-0.2434969, 0.9458352, -0.8526096, 1, 1, 1, 1, 1,
-0.2423345, -0.7517701, -3.35323, 1, 1, 1, 1, 1,
-0.2415716, 1.55497, 1.464476, 1, 1, 1, 1, 1,
-0.2412084, 1.71142, -0.9548705, 1, 1, 1, 1, 1,
-0.2406198, -0.2537721, -1.836332, 1, 1, 1, 1, 1,
-0.2399132, 0.5729967, -0.06127575, 1, 1, 1, 1, 1,
-0.2384969, 0.03323184, -0.7938302, 1, 1, 1, 1, 1,
-0.2248548, 0.6155149, 0.7085792, 1, 1, 1, 1, 1,
-0.2239459, -0.8006238, -3.828108, 1, 1, 1, 1, 1,
-0.2235168, -0.5474478, -3.621599, 1, 1, 1, 1, 1,
-0.2212877, 0.9300371, -0.1150959, 1, 1, 1, 1, 1,
-0.2163054, 0.1116653, -2.912605, 1, 1, 1, 1, 1,
-0.2142909, 2.319197, -1.09507, 1, 1, 1, 1, 1,
-0.2075207, -2.43153, -5.198817, 0, 0, 1, 1, 1,
-0.2071911, 0.531414, 2.329757, 1, 0, 0, 1, 1,
-0.2066484, 0.713294, -0.9688017, 1, 0, 0, 1, 1,
-0.2058542, 0.5302709, -1.671368, 1, 0, 0, 1, 1,
-0.1957977, -0.7398514, -2.409071, 1, 0, 0, 1, 1,
-0.1913799, -0.1053571, -0.7981246, 1, 0, 0, 1, 1,
-0.1862897, 0.7544414, -1.530568, 0, 0, 0, 1, 1,
-0.1843942, 1.00539, -2.333814, 0, 0, 0, 1, 1,
-0.180555, 1.848856, 0.6998489, 0, 0, 0, 1, 1,
-0.1795724, 0.6210996, -0.4691634, 0, 0, 0, 1, 1,
-0.1752405, 0.8376048, -0.5691371, 0, 0, 0, 1, 1,
-0.1743862, 0.319237, 0.1375092, 0, 0, 0, 1, 1,
-0.1743148, 1.689452, -0.9458141, 0, 0, 0, 1, 1,
-0.1724916, -0.9221631, -0.9986941, 1, 1, 1, 1, 1,
-0.1685834, 0.336023, -0.0838499, 1, 1, 1, 1, 1,
-0.1652875, 0.01118235, -1.180625, 1, 1, 1, 1, 1,
-0.164809, -1.790095, -4.050074, 1, 1, 1, 1, 1,
-0.1645269, -1.541868, -1.006662, 1, 1, 1, 1, 1,
-0.1576478, -0.5869814, -1.949521, 1, 1, 1, 1, 1,
-0.1572437, 1.29563, -0.682378, 1, 1, 1, 1, 1,
-0.1518084, -1.255032, -5.367586, 1, 1, 1, 1, 1,
-0.1512147, 0.61041, 1.219835, 1, 1, 1, 1, 1,
-0.1463612, 0.4112529, 1.166341, 1, 1, 1, 1, 1,
-0.1456525, 1.011136, -0.3268991, 1, 1, 1, 1, 1,
-0.1440179, -0.2955017, -4.322262, 1, 1, 1, 1, 1,
-0.1435702, -0.1223488, -2.079107, 1, 1, 1, 1, 1,
-0.1421506, 0.03222561, -2.677577, 1, 1, 1, 1, 1,
-0.141963, 0.4864534, -0.3462522, 1, 1, 1, 1, 1,
-0.1413038, 1.027622, -2.594519, 0, 0, 1, 1, 1,
-0.1404968, 1.580582, -0.09332848, 1, 0, 0, 1, 1,
-0.1363232, 1.498932, -1.342457, 1, 0, 0, 1, 1,
-0.1353632, 0.4131078, -1.200183, 1, 0, 0, 1, 1,
-0.1347519, 0.3473138, 0.8945237, 1, 0, 0, 1, 1,
-0.1302503, 0.9382899, -0.3037747, 1, 0, 0, 1, 1,
-0.1260861, 0.7303324, -1.193028, 0, 0, 0, 1, 1,
-0.1198955, -0.504364, -2.153794, 0, 0, 0, 1, 1,
-0.1198634, 1.00878, 0.02747007, 0, 0, 0, 1, 1,
-0.1190211, -1.18487, -2.438207, 0, 0, 0, 1, 1,
-0.11566, -0.4994794, -2.299472, 0, 0, 0, 1, 1,
-0.1154652, -0.2430208, -2.651599, 0, 0, 0, 1, 1,
-0.1146942, -0.3514035, -3.955957, 0, 0, 0, 1, 1,
-0.1139588, 1.184795, -0.1450991, 1, 1, 1, 1, 1,
-0.1133663, 1.283095, 0.6536814, 1, 1, 1, 1, 1,
-0.1116312, 0.861454, 0.1048085, 1, 1, 1, 1, 1,
-0.1062914, -1.401309, -2.431359, 1, 1, 1, 1, 1,
-0.1062488, -1.148222, -3.859382, 1, 1, 1, 1, 1,
-0.103034, -0.3747573, -2.558961, 1, 1, 1, 1, 1,
-0.1026334, 0.2027873, 0.5075902, 1, 1, 1, 1, 1,
-0.101327, -0.7473041, -1.817617, 1, 1, 1, 1, 1,
-0.09552217, -0.02159787, -1.505009, 1, 1, 1, 1, 1,
-0.09388256, -2.873125, -3.457593, 1, 1, 1, 1, 1,
-0.09307367, -1.036249, -4.555, 1, 1, 1, 1, 1,
-0.0924568, 1.407451, 1.816127, 1, 1, 1, 1, 1,
-0.09010886, -0.06762268, -2.886317, 1, 1, 1, 1, 1,
-0.08817172, -0.579312, -3.303256, 1, 1, 1, 1, 1,
-0.0872147, 1.140409, -0.1873344, 1, 1, 1, 1, 1,
-0.0861216, 1.643374, -0.3243891, 0, 0, 1, 1, 1,
-0.08498627, -0.5329295, -3.286019, 1, 0, 0, 1, 1,
-0.08483972, -0.1569791, -1.712384, 1, 0, 0, 1, 1,
-0.08315204, 1.784301, 0.9098126, 1, 0, 0, 1, 1,
-0.08277468, 2.114696, -1.507397, 1, 0, 0, 1, 1,
-0.08094217, 0.5172706, 0.6302324, 1, 0, 0, 1, 1,
-0.07826614, 0.5695442, -1.216731, 0, 0, 0, 1, 1,
-0.07822808, 1.451367, -0.07670522, 0, 0, 0, 1, 1,
-0.0765709, 1.019358, 0.1696747, 0, 0, 0, 1, 1,
-0.07628471, 0.07094283, -0.3712488, 0, 0, 0, 1, 1,
-0.07455616, -0.4284791, -3.957093, 0, 0, 0, 1, 1,
-0.07427208, -1.577782, -2.581725, 0, 0, 0, 1, 1,
-0.07120439, -0.5092419, -3.691724, 0, 0, 0, 1, 1,
-0.0669577, 1.655414, -1.014999, 1, 1, 1, 1, 1,
-0.06672692, -0.7339338, -3.864319, 1, 1, 1, 1, 1,
-0.06637874, -0.2007116, -1.949662, 1, 1, 1, 1, 1,
-0.05660868, 0.55988, -1.409271, 1, 1, 1, 1, 1,
-0.05652807, 1.205612, 0.691174, 1, 1, 1, 1, 1,
-0.05101085, 0.4867216, -0.2494385, 1, 1, 1, 1, 1,
-0.04830283, 1.461819, 1.260484, 1, 1, 1, 1, 1,
-0.0445257, -0.6131001, -3.707384, 1, 1, 1, 1, 1,
-0.0438128, -0.2655251, -3.695562, 1, 1, 1, 1, 1,
-0.04192799, -0.1399539, -2.979722, 1, 1, 1, 1, 1,
-0.04145347, 2.79671, 1.648771, 1, 1, 1, 1, 1,
-0.04003584, -1.196812, -1.421411, 1, 1, 1, 1, 1,
-0.0305277, -1.182049, -5.852423, 1, 1, 1, 1, 1,
-0.03050163, 0.6280894, 0.2336958, 1, 1, 1, 1, 1,
-0.02973791, -0.2441775, -0.25205, 1, 1, 1, 1, 1,
-0.02625706, -1.406626, -3.229437, 0, 0, 1, 1, 1,
-0.02605346, -2.172981, -3.605134, 1, 0, 0, 1, 1,
-0.02050786, -0.2944537, -3.754436, 1, 0, 0, 1, 1,
-0.0153573, 0.9435635, 0.7218552, 1, 0, 0, 1, 1,
-0.01516828, -0.4515482, -1.975592, 1, 0, 0, 1, 1,
-0.01508728, -1.352135, -5.222574, 1, 0, 0, 1, 1,
-0.01076048, 0.998558, -2.438625, 0, 0, 0, 1, 1,
-0.009075128, 0.5876099, -0.6717472, 0, 0, 0, 1, 1,
-0.00840604, 1.337185, 3.07946, 0, 0, 0, 1, 1,
-0.007234841, 1.343477, -1.159961, 0, 0, 0, 1, 1,
-0.007022014, -1.741201, -3.073926, 0, 0, 0, 1, 1,
-0.006024389, 1.21295, -1.245268, 0, 0, 0, 1, 1,
-0.005158209, 0.07409397, -0.7093334, 0, 0, 0, 1, 1,
0.002771597, -1.274433, 2.368385, 1, 1, 1, 1, 1,
0.003581672, 0.8223121, 0.187711, 1, 1, 1, 1, 1,
0.005589099, 0.3213001, 0.4006826, 1, 1, 1, 1, 1,
0.006718015, -1.681096, 4.684833, 1, 1, 1, 1, 1,
0.007157767, 2.213259, 1.214484, 1, 1, 1, 1, 1,
0.007221993, 0.8004506, -0.2679059, 1, 1, 1, 1, 1,
0.01108354, 0.3432073, 0.1917687, 1, 1, 1, 1, 1,
0.01608727, -0.3403922, 3.163661, 1, 1, 1, 1, 1,
0.01635528, 0.8173485, -1.155043, 1, 1, 1, 1, 1,
0.02259432, 1.251915, 0.9640554, 1, 1, 1, 1, 1,
0.02552834, -1.983927, 3.520123, 1, 1, 1, 1, 1,
0.03007072, 0.5071774, 0.5210902, 1, 1, 1, 1, 1,
0.03502608, -0.3916253, 2.902253, 1, 1, 1, 1, 1,
0.03540387, 0.1134523, -0.1870891, 1, 1, 1, 1, 1,
0.03733997, -1.449425, 3.616587, 1, 1, 1, 1, 1,
0.03868724, -0.4028323, 1.196519, 0, 0, 1, 1, 1,
0.03870874, 2.067752, -0.3893544, 1, 0, 0, 1, 1,
0.04056447, 0.9450225, 0.5304632, 1, 0, 0, 1, 1,
0.04393563, -0.1271291, 2.122859, 1, 0, 0, 1, 1,
0.04490409, 0.5135749, -0.7068444, 1, 0, 0, 1, 1,
0.04828371, 3.277144, -1.436141, 1, 0, 0, 1, 1,
0.051038, 0.718285, -2.116969, 0, 0, 0, 1, 1,
0.05273058, 0.05575847, -0.09968562, 0, 0, 0, 1, 1,
0.05764685, -1.313839, 2.774371, 0, 0, 0, 1, 1,
0.05983103, -1.040983, 3.55082, 0, 0, 0, 1, 1,
0.06000396, 0.6275448, 0.3320406, 0, 0, 0, 1, 1,
0.06229513, 1.01027, 1.188657, 0, 0, 0, 1, 1,
0.06330501, -0.6351052, 1.054687, 0, 0, 0, 1, 1,
0.06343023, -0.2519021, 2.377458, 1, 1, 1, 1, 1,
0.06459522, 0.3839522, -0.6654655, 1, 1, 1, 1, 1,
0.06526536, 0.3225229, 0.1988176, 1, 1, 1, 1, 1,
0.06724355, -1.201322, 1.252203, 1, 1, 1, 1, 1,
0.06728496, -1.021859, 1.909153, 1, 1, 1, 1, 1,
0.06917121, -1.314254, 2.634501, 1, 1, 1, 1, 1,
0.07444024, -1.068531, 4.045861, 1, 1, 1, 1, 1,
0.0779603, 1.050109, -0.7166368, 1, 1, 1, 1, 1,
0.0851281, -0.5846592, 2.576633, 1, 1, 1, 1, 1,
0.08812884, -1.519013, 3.447491, 1, 1, 1, 1, 1,
0.08876254, -0.6670756, 2.779129, 1, 1, 1, 1, 1,
0.0934258, 1.150159, -1.103593, 1, 1, 1, 1, 1,
0.09396166, 0.3496761, -0.1669668, 1, 1, 1, 1, 1,
0.09481068, 0.1090983, 1.422841, 1, 1, 1, 1, 1,
0.09686995, 1.005541, -0.2333257, 1, 1, 1, 1, 1,
0.09748734, -2.266192, 1.67239, 0, 0, 1, 1, 1,
0.09944338, 0.3608666, -1.838746, 1, 0, 0, 1, 1,
0.1005623, 0.1625512, 1.71916, 1, 0, 0, 1, 1,
0.1012551, -0.7035879, 3.425949, 1, 0, 0, 1, 1,
0.1054331, 0.4140908, -1.645564, 1, 0, 0, 1, 1,
0.1067854, -0.9799288, 4.236876, 1, 0, 0, 1, 1,
0.1075433, 1.677188, 0.528172, 0, 0, 0, 1, 1,
0.1098164, 1.317914, 0.6997718, 0, 0, 0, 1, 1,
0.1103173, -2.131229, 3.010288, 0, 0, 0, 1, 1,
0.1103322, 0.9092596, -0.7909571, 0, 0, 0, 1, 1,
0.1151573, 3.487387, -1.142889, 0, 0, 0, 1, 1,
0.1164072, -0.3342711, 3.863239, 0, 0, 0, 1, 1,
0.1193845, 0.4004719, 1.592455, 0, 0, 0, 1, 1,
0.1228713, 0.898524, 0.640029, 1, 1, 1, 1, 1,
0.125994, 3.836072, -0.111947, 1, 1, 1, 1, 1,
0.1289666, 0.1337736, 1.041517, 1, 1, 1, 1, 1,
0.1296541, -1.126298, 3.440189, 1, 1, 1, 1, 1,
0.1301276, -0.2459477, 1.256022, 1, 1, 1, 1, 1,
0.1311109, 1.16846, 1.41497, 1, 1, 1, 1, 1,
0.1319118, 0.1587512, 1.925199, 1, 1, 1, 1, 1,
0.13759, -1.245945, 3.750849, 1, 1, 1, 1, 1,
0.1417802, 0.8768945, 2.08144, 1, 1, 1, 1, 1,
0.1419057, -1.124679, 3.854747, 1, 1, 1, 1, 1,
0.1437424, -0.9248309, 3.198997, 1, 1, 1, 1, 1,
0.1448003, -1.340492, 3.358394, 1, 1, 1, 1, 1,
0.1450511, -0.7556241, 2.676202, 1, 1, 1, 1, 1,
0.1455502, -0.5054651, 2.594809, 1, 1, 1, 1, 1,
0.1481925, 0.361889, -0.9073146, 1, 1, 1, 1, 1,
0.1494531, 0.6888878, -0.8321413, 0, 0, 1, 1, 1,
0.1543901, 0.3977886, 0.6458397, 1, 0, 0, 1, 1,
0.1560858, -0.5803027, 1.577953, 1, 0, 0, 1, 1,
0.1671343, 1.586979, 0.6727316, 1, 0, 0, 1, 1,
0.1675131, -1.86665, 2.946456, 1, 0, 0, 1, 1,
0.1677451, 1.281671, 0.001422373, 1, 0, 0, 1, 1,
0.1678963, -0.02286701, 5.00045, 0, 0, 0, 1, 1,
0.1700551, 0.6087141, -0.7286741, 0, 0, 0, 1, 1,
0.1718812, 0.545446, 1.637233, 0, 0, 0, 1, 1,
0.1722299, 0.9624201, 0.4565479, 0, 0, 0, 1, 1,
0.1728213, -0.4444354, 3.562923, 0, 0, 0, 1, 1,
0.173048, -0.4031166, 3.615321, 0, 0, 0, 1, 1,
0.1740975, -1.116462, 2.975261, 0, 0, 0, 1, 1,
0.1768828, 0.1904585, -0.3645632, 1, 1, 1, 1, 1,
0.1798814, 0.5178422, 0.8481659, 1, 1, 1, 1, 1,
0.1840835, -1.001181, 3.541042, 1, 1, 1, 1, 1,
0.1901, -0.5876697, 1.849447, 1, 1, 1, 1, 1,
0.194911, 0.4589266, 0.7879836, 1, 1, 1, 1, 1,
0.2000762, 0.3613871, 1.475357, 1, 1, 1, 1, 1,
0.2011203, 0.4833499, 1.02786, 1, 1, 1, 1, 1,
0.2029387, 0.5748606, -0.1481931, 1, 1, 1, 1, 1,
0.2048609, 0.2287448, 0.8677469, 1, 1, 1, 1, 1,
0.2090564, -0.5022841, 2.904942, 1, 1, 1, 1, 1,
0.2141815, -1.112591, 4.603112, 1, 1, 1, 1, 1,
0.2254165, -0.2033012, 1.494622, 1, 1, 1, 1, 1,
0.2258274, -0.8454727, 2.327719, 1, 1, 1, 1, 1,
0.2314605, -1.957183, 4.415247, 1, 1, 1, 1, 1,
0.2320226, 0.8400397, 0.7898136, 1, 1, 1, 1, 1,
0.24115, -1.05207, 2.358973, 0, 0, 1, 1, 1,
0.2428797, -1.19822, 1.852454, 1, 0, 0, 1, 1,
0.2439405, -0.4293846, 1.980061, 1, 0, 0, 1, 1,
0.2455597, 0.9275263, -0.2179015, 1, 0, 0, 1, 1,
0.2466635, 0.3703449, 0.5410727, 1, 0, 0, 1, 1,
0.2528546, 0.2968969, -0.9793311, 1, 0, 0, 1, 1,
0.2528881, -0.8329408, 2.740222, 0, 0, 0, 1, 1,
0.2581193, 0.6716405, 0.9478105, 0, 0, 0, 1, 1,
0.2589075, -1.907827, 2.518806, 0, 0, 0, 1, 1,
0.2616804, 0.06990301, 2.927296, 0, 0, 0, 1, 1,
0.2675993, 0.4195842, 0.5179248, 0, 0, 0, 1, 1,
0.2680914, 0.6645808, -1.025128, 0, 0, 0, 1, 1,
0.2748895, 0.4597562, 1.155052, 0, 0, 0, 1, 1,
0.275162, 0.7260377, 0.5506248, 1, 1, 1, 1, 1,
0.2782524, -1.702214, 1.37855, 1, 1, 1, 1, 1,
0.2792155, -0.1088218, 3.39182, 1, 1, 1, 1, 1,
0.2815647, -0.8327963, 1.31244, 1, 1, 1, 1, 1,
0.2892534, 0.4199401, 0.2666432, 1, 1, 1, 1, 1,
0.289533, -0.4790996, 2.310162, 1, 1, 1, 1, 1,
0.292842, 0.1182432, 3.040218, 1, 1, 1, 1, 1,
0.2956858, -1.271526, 2.897253, 1, 1, 1, 1, 1,
0.2959874, -0.7617682, 3.388171, 1, 1, 1, 1, 1,
0.2970392, 1.478845, 0.4141898, 1, 1, 1, 1, 1,
0.2998433, -1.072461, 3.907083, 1, 1, 1, 1, 1,
0.3026984, 1.797253, -0.4288711, 1, 1, 1, 1, 1,
0.3048037, 0.4052316, 2.35018, 1, 1, 1, 1, 1,
0.3060067, 0.4891217, 1.374166, 1, 1, 1, 1, 1,
0.3069494, 1.759321, 0.7260379, 1, 1, 1, 1, 1,
0.3107423, 1.757119, -0.1496523, 0, 0, 1, 1, 1,
0.3116271, -0.3801328, 1.591842, 1, 0, 0, 1, 1,
0.3151491, 1.2522, 0.1199632, 1, 0, 0, 1, 1,
0.3157482, 0.1712498, -0.1748203, 1, 0, 0, 1, 1,
0.3194669, -0.6354064, 3.872923, 1, 0, 0, 1, 1,
0.3233956, 0.5358067, 1.087152, 1, 0, 0, 1, 1,
0.3245761, -0.9404691, 3.555552, 0, 0, 0, 1, 1,
0.3263828, 0.1725115, 2.066232, 0, 0, 0, 1, 1,
0.3266256, 1.322025, 0.7859305, 0, 0, 0, 1, 1,
0.332317, -0.9685157, 4.446948, 0, 0, 0, 1, 1,
0.3339652, 2.134528, 2.029706, 0, 0, 0, 1, 1,
0.3344762, -0.3839753, 3.03465, 0, 0, 0, 1, 1,
0.3358168, -0.2406976, 0.9886474, 0, 0, 0, 1, 1,
0.3420309, -1.762944, 3.468657, 1, 1, 1, 1, 1,
0.3428305, -0.662531, 3.975401, 1, 1, 1, 1, 1,
0.344206, 1.352809, 1.577545, 1, 1, 1, 1, 1,
0.344853, 1.288059, -1.316228, 1, 1, 1, 1, 1,
0.3498561, -1.158, 6.117945, 1, 1, 1, 1, 1,
0.3500667, -0.6832945, 2.565302, 1, 1, 1, 1, 1,
0.3508919, -0.6491579, 3.01545, 1, 1, 1, 1, 1,
0.3547148, 0.8450683, 0.3002466, 1, 1, 1, 1, 1,
0.3547784, -0.3790645, 3.440593, 1, 1, 1, 1, 1,
0.3579769, 0.9123536, 0.614522, 1, 1, 1, 1, 1,
0.3594355, 0.644425, -0.09725498, 1, 1, 1, 1, 1,
0.3597946, -0.3239733, 1.711026, 1, 1, 1, 1, 1,
0.3613624, -0.3980733, 2.034494, 1, 1, 1, 1, 1,
0.3655306, -1.337861, 3.367252, 1, 1, 1, 1, 1,
0.37284, 0.6368573, 0.121768, 1, 1, 1, 1, 1,
0.3750537, 0.7579774, 1.68838, 0, 0, 1, 1, 1,
0.3811401, -0.8855263, 2.465228, 1, 0, 0, 1, 1,
0.3819079, 0.004621653, 3.066694, 1, 0, 0, 1, 1,
0.3826945, 0.3492687, 2.846856, 1, 0, 0, 1, 1,
0.3833649, 0.9982154, 2.040449, 1, 0, 0, 1, 1,
0.3939999, -0.7873788, 4.390475, 1, 0, 0, 1, 1,
0.3940958, 0.02694788, 1.819857, 0, 0, 0, 1, 1,
0.3941976, -1.491252, 4.131054, 0, 0, 0, 1, 1,
0.395873, -1.052474, 4.064845, 0, 0, 0, 1, 1,
0.3958822, 0.320167, 2.313623, 0, 0, 0, 1, 1,
0.4033487, 1.403268, -0.7530674, 0, 0, 0, 1, 1,
0.4039958, 0.1533604, 2.980366, 0, 0, 0, 1, 1,
0.4113127, -1.366845, 3.860413, 0, 0, 0, 1, 1,
0.4118289, -0.4381821, 1.298702, 1, 1, 1, 1, 1,
0.413029, -0.4562433, 0.7317729, 1, 1, 1, 1, 1,
0.4198022, 1.163826, 0.2775352, 1, 1, 1, 1, 1,
0.4226032, 1.043113, -0.04157424, 1, 1, 1, 1, 1,
0.4308417, -1.508334, 3.813324, 1, 1, 1, 1, 1,
0.4311885, -0.9130618, 3.231956, 1, 1, 1, 1, 1,
0.4364939, 1.338096, 1.346848, 1, 1, 1, 1, 1,
0.438655, -0.08673315, 0.3657913, 1, 1, 1, 1, 1,
0.447795, 2.224189, -0.191608, 1, 1, 1, 1, 1,
0.448231, -0.2124043, 1.355575, 1, 1, 1, 1, 1,
0.4482976, -0.3667628, 2.919198, 1, 1, 1, 1, 1,
0.4515578, 0.3788201, 0.435746, 1, 1, 1, 1, 1,
0.4524967, 1.324987, 0.04799858, 1, 1, 1, 1, 1,
0.4554242, 2.715909, 1.069861, 1, 1, 1, 1, 1,
0.456814, 1.28184, 0.8999588, 1, 1, 1, 1, 1,
0.4587956, 0.2126085, 0.07102066, 0, 0, 1, 1, 1,
0.4609512, 0.5790261, -0.1450824, 1, 0, 0, 1, 1,
0.4633404, -0.9173207, 1.345498, 1, 0, 0, 1, 1,
0.472221, 0.5639412, -0.8679293, 1, 0, 0, 1, 1,
0.4722572, 0.2688616, 0.448837, 1, 0, 0, 1, 1,
0.4776538, 0.09660154, 2.661706, 1, 0, 0, 1, 1,
0.4776807, -0.1558553, 2.045642, 0, 0, 0, 1, 1,
0.4819787, -2.341866, 1.768275, 0, 0, 0, 1, 1,
0.4896484, -0.1108436, 0.9230725, 0, 0, 0, 1, 1,
0.4914867, -2.135797, 3.076038, 0, 0, 0, 1, 1,
0.498069, 0.6419899, 1.249105, 0, 0, 0, 1, 1,
0.5021205, -1.457468, 2.500589, 0, 0, 0, 1, 1,
0.5023279, 0.7827384, 0.9086236, 0, 0, 0, 1, 1,
0.5214631, -0.2559575, 2.357082, 1, 1, 1, 1, 1,
0.526427, 0.8422422, 0.4341233, 1, 1, 1, 1, 1,
0.5344698, -0.5551443, 3.659885, 1, 1, 1, 1, 1,
0.5379508, 0.5828935, 0.3047985, 1, 1, 1, 1, 1,
0.5391761, 0.450039, 0.2970684, 1, 1, 1, 1, 1,
0.5408611, 0.4546351, 2.611575, 1, 1, 1, 1, 1,
0.5437583, 0.528933, 0.4697413, 1, 1, 1, 1, 1,
0.5453003, -0.4573293, 3.128791, 1, 1, 1, 1, 1,
0.5485395, 0.7848822, -0.3469259, 1, 1, 1, 1, 1,
0.5487247, -1.421101, 2.267025, 1, 1, 1, 1, 1,
0.5517601, 0.3118926, 1.759696, 1, 1, 1, 1, 1,
0.5578937, 0.09352569, 2.165501, 1, 1, 1, 1, 1,
0.5597593, -0.5880774, 2.845351, 1, 1, 1, 1, 1,
0.5603478, -0.197753, 1.467555, 1, 1, 1, 1, 1,
0.5678288, -0.5506843, 3.018348, 1, 1, 1, 1, 1,
0.56801, -1.360725, 3.645731, 0, 0, 1, 1, 1,
0.5697572, 0.7774117, -1.02863, 1, 0, 0, 1, 1,
0.5715417, 0.7195973, -0.4322197, 1, 0, 0, 1, 1,
0.5740246, 2.146668, 1.557272, 1, 0, 0, 1, 1,
0.5761247, -1.263325, 2.205101, 1, 0, 0, 1, 1,
0.5843555, 0.5008706, 0.6354573, 1, 0, 0, 1, 1,
0.5847266, 0.6258265, 0.8357016, 0, 0, 0, 1, 1,
0.5858659, 0.9549502, 1.901163, 0, 0, 0, 1, 1,
0.5916976, 0.6609793, 0.9271296, 0, 0, 0, 1, 1,
0.5975157, 0.994062, -0.4672608, 0, 0, 0, 1, 1,
0.6030352, -0.03967152, 1.025349, 0, 0, 0, 1, 1,
0.604291, 0.9414675, 1.404928, 0, 0, 0, 1, 1,
0.6119931, 1.454235, 0.1710166, 0, 0, 0, 1, 1,
0.6155759, 1.787465, 1.006737, 1, 1, 1, 1, 1,
0.6167378, 1.406662, 0.1253609, 1, 1, 1, 1, 1,
0.6174276, -0.7224748, 3.108815, 1, 1, 1, 1, 1,
0.6193489, -1.095541, 2.040437, 1, 1, 1, 1, 1,
0.6231165, 0.856515, 0.565445, 1, 1, 1, 1, 1,
0.624741, -2.652277, 3.012006, 1, 1, 1, 1, 1,
0.6339382, 0.3055635, 0.7658236, 1, 1, 1, 1, 1,
0.6358008, -1.25541, 3.513656, 1, 1, 1, 1, 1,
0.6399314, 1.217914, -1.529069, 1, 1, 1, 1, 1,
0.6410946, 0.001860368, 1.577348, 1, 1, 1, 1, 1,
0.6478771, 2.298245, 0.2194269, 1, 1, 1, 1, 1,
0.6508934, -1.32899, 3.190692, 1, 1, 1, 1, 1,
0.654812, -0.1322396, 2.017734, 1, 1, 1, 1, 1,
0.657497, 0.152293, 0.4555885, 1, 1, 1, 1, 1,
0.6599039, 1.104345, 1.174295, 1, 1, 1, 1, 1,
0.6626652, 0.6018468, 1.009523, 0, 0, 1, 1, 1,
0.6645798, -0.2534646, 1.798989, 1, 0, 0, 1, 1,
0.6650927, -0.498617, 2.56041, 1, 0, 0, 1, 1,
0.6653102, 0.8268398, 0.6010228, 1, 0, 0, 1, 1,
0.6779038, -0.2826197, 0.03198195, 1, 0, 0, 1, 1,
0.6783034, -1.027643, 1.740839, 1, 0, 0, 1, 1,
0.6783684, -0.5975462, 4.666275, 0, 0, 0, 1, 1,
0.6795785, -0.3789902, 1.540895, 0, 0, 0, 1, 1,
0.6820468, -0.3934612, 2.236792, 0, 0, 0, 1, 1,
0.6823854, -1.240809, 3.083512, 0, 0, 0, 1, 1,
0.6826845, -0.8991805, 1.933793, 0, 0, 0, 1, 1,
0.6827644, -1.173841, 4.223578, 0, 0, 0, 1, 1,
0.6949348, -1.906707, 3.557016, 0, 0, 0, 1, 1,
0.6984753, 0.6343869, -0.8980516, 1, 1, 1, 1, 1,
0.70005, -0.9953801, 3.230979, 1, 1, 1, 1, 1,
0.7032199, -0.5398602, 2.684428, 1, 1, 1, 1, 1,
0.7156622, -0.04024807, 1.161842, 1, 1, 1, 1, 1,
0.7257745, 1.546627, 2.174688, 1, 1, 1, 1, 1,
0.726039, 0.3050142, 2.294547, 1, 1, 1, 1, 1,
0.7353191, -1.811117, 2.366927, 1, 1, 1, 1, 1,
0.7390072, -1.156571, 2.16442, 1, 1, 1, 1, 1,
0.7390091, 0.5832198, 0.4788707, 1, 1, 1, 1, 1,
0.7405372, -0.8727648, 3.587627, 1, 1, 1, 1, 1,
0.7467871, 0.4883385, 1.466833, 1, 1, 1, 1, 1,
0.7478984, -0.5506528, 2.560829, 1, 1, 1, 1, 1,
0.7498232, 0.1985228, -0.5805627, 1, 1, 1, 1, 1,
0.7584603, -0.5349718, 0.6385273, 1, 1, 1, 1, 1,
0.7596205, -1.188569, 0.7337009, 1, 1, 1, 1, 1,
0.7603824, -0.4857805, 3.536594, 0, 0, 1, 1, 1,
0.7614614, -1.243277, 3.19134, 1, 0, 0, 1, 1,
0.7663069, -0.4769401, 1.908098, 1, 0, 0, 1, 1,
0.7672436, 0.4782148, 0.9458238, 1, 0, 0, 1, 1,
0.7674508, 0.1810179, 1.333435, 1, 0, 0, 1, 1,
0.7696764, -0.5319619, 1.272547, 1, 0, 0, 1, 1,
0.7708824, 1.078943, -0.1405225, 0, 0, 0, 1, 1,
0.7730981, -0.5757506, 1.102108, 0, 0, 0, 1, 1,
0.7753841, 0.2685913, 2.256337, 0, 0, 0, 1, 1,
0.7765759, -1.388283, 2.929024, 0, 0, 0, 1, 1,
0.7860109, 2.588286, 1.136709, 0, 0, 0, 1, 1,
0.7913798, 0.2329768, 2.26934, 0, 0, 0, 1, 1,
0.7953845, -0.03427136, 1.968858, 0, 0, 0, 1, 1,
0.7963358, 1.851371, 0.9539007, 1, 1, 1, 1, 1,
0.8012612, 0.1841703, 1.606791, 1, 1, 1, 1, 1,
0.8033069, 0.644785, 0.7412571, 1, 1, 1, 1, 1,
0.8110937, -0.01517153, 0.4399678, 1, 1, 1, 1, 1,
0.8149989, -0.2447687, 1.332198, 1, 1, 1, 1, 1,
0.8186225, 0.1309762, 1.213818, 1, 1, 1, 1, 1,
0.8305026, 0.7909087, 0.2468055, 1, 1, 1, 1, 1,
0.833465, 0.7045672, 0.863897, 1, 1, 1, 1, 1,
0.8398373, -0.6379183, 1.124979, 1, 1, 1, 1, 1,
0.8410004, -0.5221492, 3.578253, 1, 1, 1, 1, 1,
0.8416648, -0.2002347, 2.294705, 1, 1, 1, 1, 1,
0.8425018, 0.09844331, 1.441507, 1, 1, 1, 1, 1,
0.8479207, -0.1390282, 1.864194, 1, 1, 1, 1, 1,
0.8497969, 0.4908888, 0.6292518, 1, 1, 1, 1, 1,
0.8545029, -0.3798956, 1.496562, 1, 1, 1, 1, 1,
0.8591874, -1.924328, 2.654855, 0, 0, 1, 1, 1,
0.8594363, 0.5316614, -0.2094246, 1, 0, 0, 1, 1,
0.8871913, -0.3358068, 1.58697, 1, 0, 0, 1, 1,
0.8905796, -0.572721, 2.28302, 1, 0, 0, 1, 1,
0.8905918, 0.4097054, 1.121992, 1, 0, 0, 1, 1,
0.8916464, 2.305332, -0.336872, 1, 0, 0, 1, 1,
0.8939564, 0.6792518, 1.269722, 0, 0, 0, 1, 1,
0.8964487, -0.4941697, 1.856151, 0, 0, 0, 1, 1,
0.9044462, -0.289489, 2.271726, 0, 0, 0, 1, 1,
0.9056497, -1.03168, 3.47369, 0, 0, 0, 1, 1,
0.9079077, 0.3819744, 1.082106, 0, 0, 0, 1, 1,
0.9082311, -0.5262663, 3.210206, 0, 0, 0, 1, 1,
0.9084865, -1.156439, 3.901138, 0, 0, 0, 1, 1,
0.9087456, 0.343102, 1.663548, 1, 1, 1, 1, 1,
0.9106295, -0.4125855, 2.914701, 1, 1, 1, 1, 1,
0.915613, 0.6140501, 0.7197344, 1, 1, 1, 1, 1,
0.919332, 1.000657, 0.5121249, 1, 1, 1, 1, 1,
0.9230017, -0.732326, 1.557443, 1, 1, 1, 1, 1,
0.9264631, -0.6063755, 1.536131, 1, 1, 1, 1, 1,
0.9295474, 1.206976, -0.6618847, 1, 1, 1, 1, 1,
0.9365561, 1.039633, 0.6494256, 1, 1, 1, 1, 1,
0.9372218, -0.4362854, 0.7411874, 1, 1, 1, 1, 1,
0.9374342, -2.024634, 2.903639, 1, 1, 1, 1, 1,
0.9420879, -0.8784004, 2.388311, 1, 1, 1, 1, 1,
0.9553251, 0.1968428, 2.653395, 1, 1, 1, 1, 1,
0.9606467, 1.460561, 0.1027909, 1, 1, 1, 1, 1,
0.9607548, -1.130033, 2.427093, 1, 1, 1, 1, 1,
0.9620361, -0.9132502, 2.906067, 1, 1, 1, 1, 1,
0.9664801, -0.7014704, 4.437178, 0, 0, 1, 1, 1,
0.969224, -0.06009671, 2.780885, 1, 0, 0, 1, 1,
0.975966, 0.7491456, 0.1508313, 1, 0, 0, 1, 1,
0.976015, -0.1021744, 0.6215914, 1, 0, 0, 1, 1,
0.9845576, -0.08237278, 2.33166, 1, 0, 0, 1, 1,
0.9866365, 1.037376, 2.602458, 1, 0, 0, 1, 1,
0.9904078, 1.008746, 1.396915, 0, 0, 0, 1, 1,
0.9911821, 0.5401636, 0.746113, 0, 0, 0, 1, 1,
0.9922392, -1.028598, 1.36825, 0, 0, 0, 1, 1,
1.003062, -0.828927, 3.399963, 0, 0, 0, 1, 1,
1.004808, -0.1172128, 1.884813, 0, 0, 0, 1, 1,
1.008662, -0.1176797, 2.32832, 0, 0, 0, 1, 1,
1.009099, -0.6639372, -0.4361306, 0, 0, 0, 1, 1,
1.016499, 1.277385, -0.419735, 1, 1, 1, 1, 1,
1.018402, 1.317497, 1.064397, 1, 1, 1, 1, 1,
1.019027, 0.2921591, 2.079859, 1, 1, 1, 1, 1,
1.020765, -1.174176, 3.580487, 1, 1, 1, 1, 1,
1.02467, 0.4675938, 2.68363, 1, 1, 1, 1, 1,
1.027459, -0.3824059, 1.244678, 1, 1, 1, 1, 1,
1.02947, 0.5649221, 1.953903, 1, 1, 1, 1, 1,
1.031979, -0.0177542, 0.1326015, 1, 1, 1, 1, 1,
1.032454, 0.04624839, 2.005732, 1, 1, 1, 1, 1,
1.039035, -0.05534077, 1.803576, 1, 1, 1, 1, 1,
1.046321, 0.7156353, 1.109114, 1, 1, 1, 1, 1,
1.046787, -0.9093709, 2.257793, 1, 1, 1, 1, 1,
1.057345, 0.3556545, 1.674344, 1, 1, 1, 1, 1,
1.065217, -0.7423496, 3.12036, 1, 1, 1, 1, 1,
1.065945, -0.1268223, 1.290934, 1, 1, 1, 1, 1,
1.083483, 0.4730087, 0.4884277, 0, 0, 1, 1, 1,
1.085022, -1.082652, 3.549399, 1, 0, 0, 1, 1,
1.08806, 0.8550377, -0.7506691, 1, 0, 0, 1, 1,
1.090997, 1.245931, 1.71699, 1, 0, 0, 1, 1,
1.093098, -0.4470095, -0.2638174, 1, 0, 0, 1, 1,
1.093628, -1.578876, 3.265908, 1, 0, 0, 1, 1,
1.094183, 0.3368458, 0.6348277, 0, 0, 0, 1, 1,
1.095519, 0.5948856, 1.556538, 0, 0, 0, 1, 1,
1.098919, 2.706173, -1.092118, 0, 0, 0, 1, 1,
1.103491, 1.2293, 1.687547, 0, 0, 0, 1, 1,
1.105164, 0.1053428, 2.640384, 0, 0, 0, 1, 1,
1.105301, 0.2439626, 2.485664, 0, 0, 0, 1, 1,
1.109718, 0.6460146, 0.8740042, 0, 0, 0, 1, 1,
1.115577, -0.3435698, 1.914353, 1, 1, 1, 1, 1,
1.117335, -0.1964456, 2.17996, 1, 1, 1, 1, 1,
1.122938, -1.061609, 1.772659, 1, 1, 1, 1, 1,
1.129431, -0.1882124, 0.8825152, 1, 1, 1, 1, 1,
1.132626, -1.284823, 2.465456, 1, 1, 1, 1, 1,
1.14005, -0.3331499, 4.51676, 1, 1, 1, 1, 1,
1.146649, -1.198795, 3.110854, 1, 1, 1, 1, 1,
1.157554, 0.7459271, -0.3382641, 1, 1, 1, 1, 1,
1.160203, 1.39309, 1.319206, 1, 1, 1, 1, 1,
1.163529, 0.7863028, -1.140097, 1, 1, 1, 1, 1,
1.173959, 0.1970489, -0.6797158, 1, 1, 1, 1, 1,
1.175707, -0.6609958, -0.7098045, 1, 1, 1, 1, 1,
1.184224, -0.01521787, 1.357124, 1, 1, 1, 1, 1,
1.1866, -1.012047, 3.24471, 1, 1, 1, 1, 1,
1.203374, 1.441292, 0.6785485, 1, 1, 1, 1, 1,
1.209136, -0.8008679, 2.901131, 0, 0, 1, 1, 1,
1.212227, 0.1674802, 2.021516, 1, 0, 0, 1, 1,
1.228431, -0.923553, 0.8056819, 1, 0, 0, 1, 1,
1.232317, 0.1802677, 1.364334, 1, 0, 0, 1, 1,
1.235021, 0.07422756, 3.340658, 1, 0, 0, 1, 1,
1.23605, 1.374071, 1.126727, 1, 0, 0, 1, 1,
1.253723, 0.1113273, 2.135056, 0, 0, 0, 1, 1,
1.258777, -0.2694028, 2.693488, 0, 0, 0, 1, 1,
1.279432, 0.6375881, 1.897611, 0, 0, 0, 1, 1,
1.280536, 0.3929457, 2.096307, 0, 0, 0, 1, 1,
1.289291, 1.363213, -0.6669102, 0, 0, 0, 1, 1,
1.292268, -0.2120374, 2.523414, 0, 0, 0, 1, 1,
1.310487, 1.06653, 0.6412516, 0, 0, 0, 1, 1,
1.334522, 0.4761048, -0.2804591, 1, 1, 1, 1, 1,
1.347142, -1.437932, 4.886085, 1, 1, 1, 1, 1,
1.359749, -2.636888, 2.890817, 1, 1, 1, 1, 1,
1.369025, -0.07019182, 1.061222, 1, 1, 1, 1, 1,
1.383569, 0.8208659, 2.36955, 1, 1, 1, 1, 1,
1.384427, -0.4223419, 1.344291, 1, 1, 1, 1, 1,
1.385771, -1.039177, 1.226668, 1, 1, 1, 1, 1,
1.387483, -0.03511395, 1.062762, 1, 1, 1, 1, 1,
1.391363, -2.598816, 1.016754, 1, 1, 1, 1, 1,
1.397035, 0.1195032, 2.886367, 1, 1, 1, 1, 1,
1.397046, -1.388981, 2.021924, 1, 1, 1, 1, 1,
1.39976, -1.260507, 1.398515, 1, 1, 1, 1, 1,
1.407482, 0.9247465, 1.086434, 1, 1, 1, 1, 1,
1.408972, 0.7366068, 1.123478, 1, 1, 1, 1, 1,
1.412482, 0.5070115, 3.338764, 1, 1, 1, 1, 1,
1.418988, 0.7660763, 1.834799, 0, 0, 1, 1, 1,
1.433953, -0.4755071, 0.5644656, 1, 0, 0, 1, 1,
1.442406, 1.193655, 1.302499, 1, 0, 0, 1, 1,
1.446738, 0.05419631, 3.412197, 1, 0, 0, 1, 1,
1.447644, -0.2751526, 3.500701, 1, 0, 0, 1, 1,
1.460599, 0.6137784, 1.674106, 1, 0, 0, 1, 1,
1.463914, 1.450445, 3.294371, 0, 0, 0, 1, 1,
1.471202, -0.520999, 0.4807242, 0, 0, 0, 1, 1,
1.476333, -0.2395453, 1.826864, 0, 0, 0, 1, 1,
1.488608, 0.2009517, 2.035237, 0, 0, 0, 1, 1,
1.494774, -0.9188509, 0.6183566, 0, 0, 0, 1, 1,
1.499491, 1.531586, 0.004653993, 0, 0, 0, 1, 1,
1.503553, -1.049158, 2.586722, 0, 0, 0, 1, 1,
1.510211, -1.109392, 1.103618, 1, 1, 1, 1, 1,
1.513316, 1.067581, 0.4696672, 1, 1, 1, 1, 1,
1.5156, -0.6374198, 2.808456, 1, 1, 1, 1, 1,
1.534852, -0.1382934, 2.369984, 1, 1, 1, 1, 1,
1.539874, 0.5809081, -0.8061794, 1, 1, 1, 1, 1,
1.574831, -3.320846, 3.379994, 1, 1, 1, 1, 1,
1.58189, 0.3551121, -0.4385634, 1, 1, 1, 1, 1,
1.59676, 0.9001263, 2.744073, 1, 1, 1, 1, 1,
1.599258, 1.85421, 3.054755, 1, 1, 1, 1, 1,
1.601192, 0.04751477, 1.124364, 1, 1, 1, 1, 1,
1.607855, 0.6076089, 1.040849, 1, 1, 1, 1, 1,
1.610432, -1.821249, 3.006671, 1, 1, 1, 1, 1,
1.626119, -0.8212978, 2.630333, 1, 1, 1, 1, 1,
1.629776, -0.1133365, 1.634612, 1, 1, 1, 1, 1,
1.645483, 2.163893, 0.9508304, 1, 1, 1, 1, 1,
1.647137, 0.6418455, 1.286992, 0, 0, 1, 1, 1,
1.661628, -0.3100171, 2.668135, 1, 0, 0, 1, 1,
1.666998, 1.808517, -0.1900439, 1, 0, 0, 1, 1,
1.711075, 0.6517342, 0.7179672, 1, 0, 0, 1, 1,
1.716254, 0.4201151, 1.903201, 1, 0, 0, 1, 1,
1.73236, -1.193009, 3.271546, 1, 0, 0, 1, 1,
1.744705, 0.126468, 2.127019, 0, 0, 0, 1, 1,
1.745996, -0.5682507, 2.847717, 0, 0, 0, 1, 1,
1.758701, 0.3342865, 1.134849, 0, 0, 0, 1, 1,
1.766997, 0.295854, -0.01007761, 0, 0, 0, 1, 1,
1.77182, -1.103174, 2.945134, 0, 0, 0, 1, 1,
1.77265, 1.170301, 0.01454015, 0, 0, 0, 1, 1,
1.775412, 1.804446, -0.1927466, 0, 0, 0, 1, 1,
1.816158, -1.262796, 1.720714, 1, 1, 1, 1, 1,
1.832277, -0.4005516, 0.8343228, 1, 1, 1, 1, 1,
1.842427, -0.6363168, 0.7711409, 1, 1, 1, 1, 1,
1.855553, -0.950086, 3.313873, 1, 1, 1, 1, 1,
1.870425, -1.236874, 3.559251, 1, 1, 1, 1, 1,
1.872718, 0.5546395, 2.953245, 1, 1, 1, 1, 1,
1.877319, 0.8808402, 1.460551, 1, 1, 1, 1, 1,
1.896507, -1.388131, 3.796224, 1, 1, 1, 1, 1,
1.921398, -0.4250943, 3.589416, 1, 1, 1, 1, 1,
1.949701, 0.7392057, 0.6556064, 1, 1, 1, 1, 1,
1.956664, -1.118965, 2.245287, 1, 1, 1, 1, 1,
1.98223, 0.1795791, 2.86471, 1, 1, 1, 1, 1,
2.012884, 1.24123, -0.1144775, 1, 1, 1, 1, 1,
2.034603, -1.428662, 1.36139, 1, 1, 1, 1, 1,
2.03521, 0.1688702, 1.446421, 1, 1, 1, 1, 1,
2.057983, 0.9681717, 0.2328796, 0, 0, 1, 1, 1,
2.096705, -0.2267864, 2.369925, 1, 0, 0, 1, 1,
2.100564, -0.2945751, 1.52311, 1, 0, 0, 1, 1,
2.126215, 1.359958, -0.5491995, 1, 0, 0, 1, 1,
2.144206, 0.1110117, 1.135778, 1, 0, 0, 1, 1,
2.150503, -0.2182205, 1.835634, 1, 0, 0, 1, 1,
2.190734, -0.1538858, 2.547223, 0, 0, 0, 1, 1,
2.191605, -1.258529, 1.191933, 0, 0, 0, 1, 1,
2.194052, 2.466097, 0.7326788, 0, 0, 0, 1, 1,
2.227792, 0.2991111, 1.952488, 0, 0, 0, 1, 1,
2.244154, -1.155537, 2.92073, 0, 0, 0, 1, 1,
2.267631, 1.581011, 0.332634, 0, 0, 0, 1, 1,
2.301857, 0.420096, 0.05860109, 0, 0, 0, 1, 1,
2.333186, -0.2550217, 2.551362, 1, 1, 1, 1, 1,
2.488863, 0.6563283, 0.573417, 1, 1, 1, 1, 1,
2.522356, -1.409295, 2.121301, 1, 1, 1, 1, 1,
2.646348, 0.1272171, 1.251253, 1, 1, 1, 1, 1,
2.740967, -0.5331891, 1.280854, 1, 1, 1, 1, 1,
2.826771, -0.8443611, 2.699163, 1, 1, 1, 1, 1,
3.270826, 0.3607191, 1.93584, 1, 1, 1, 1, 1
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
var radius = 10.22417;
var distance = 35.91195;
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
mvMatrix.translate( -0.1920621, -0.2576129, -0.132761 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.91195);
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
