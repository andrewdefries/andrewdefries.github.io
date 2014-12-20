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
-3.521621, -1.524763, -1.353459, 1, 0, 0, 1,
-3.29306, 1.243644, -0.8106046, 1, 0.007843138, 0, 1,
-3.0306, 1.058095, -0.9798883, 1, 0.01176471, 0, 1,
-3.009039, -1.400447, -1.62145, 1, 0.01960784, 0, 1,
-2.992143, -0.8840227, -1.702829, 1, 0.02352941, 0, 1,
-2.765649, -0.6972947, -0.6566148, 1, 0.03137255, 0, 1,
-2.638091, -0.1633119, -1.189308, 1, 0.03529412, 0, 1,
-2.544112, 0.6965172, -2.074208, 1, 0.04313726, 0, 1,
-2.536087, 1.242659, -1.015009, 1, 0.04705882, 0, 1,
-2.465842, 0.2627704, -2.195657, 1, 0.05490196, 0, 1,
-2.436513, 0.6301574, -2.283859, 1, 0.05882353, 0, 1,
-2.399197, 0.4314062, -1.552747, 1, 0.06666667, 0, 1,
-2.338731, 1.819291, 0.04494669, 1, 0.07058824, 0, 1,
-2.3114, -1.646725, -2.590802, 1, 0.07843138, 0, 1,
-2.290997, -1.13395, 0.1973663, 1, 0.08235294, 0, 1,
-2.271596, -0.4916694, -1.754891, 1, 0.09019608, 0, 1,
-2.263592, 1.362103, -0.5451615, 1, 0.09411765, 0, 1,
-2.247436, -1.426044, -1.632569, 1, 0.1019608, 0, 1,
-2.242817, 2.541637, -1.138093, 1, 0.1098039, 0, 1,
-2.227022, 0.5524057, -0.5591738, 1, 0.1137255, 0, 1,
-2.206078, 1.014769, -0.7915479, 1, 0.1215686, 0, 1,
-2.147364, 1.274665, -3.186675, 1, 0.1254902, 0, 1,
-2.110276, -0.8034363, -1.571052, 1, 0.1333333, 0, 1,
-2.0357, -0.3948043, -2.474273, 1, 0.1372549, 0, 1,
-2.032001, -2.139596, -2.398007, 1, 0.145098, 0, 1,
-1.995486, -1.547022, -2.107666, 1, 0.1490196, 0, 1,
-1.986202, 0.4880253, 0.2400994, 1, 0.1568628, 0, 1,
-1.980209, 0.1669962, 1.552051, 1, 0.1607843, 0, 1,
-1.945556, -1.953501, -2.249652, 1, 0.1686275, 0, 1,
-1.92634, 0.09186359, -0.5168187, 1, 0.172549, 0, 1,
-1.92357, 0.648082, -4.091052, 1, 0.1803922, 0, 1,
-1.923551, 0.1636415, -1.555968, 1, 0.1843137, 0, 1,
-1.877407, -0.03704277, -3.158671, 1, 0.1921569, 0, 1,
-1.871756, 0.3059175, -3.56201, 1, 0.1960784, 0, 1,
-1.857046, 1.740402, -1.567708, 1, 0.2039216, 0, 1,
-1.854789, -0.4543085, -1.260615, 1, 0.2117647, 0, 1,
-1.85225, -0.4449004, -0.788695, 1, 0.2156863, 0, 1,
-1.846004, 0.3057041, -1.782646, 1, 0.2235294, 0, 1,
-1.806981, 1.918746, -0.580731, 1, 0.227451, 0, 1,
-1.803113, 0.9946139, -1.765555, 1, 0.2352941, 0, 1,
-1.783275, 1.119195, -2.245321, 1, 0.2392157, 0, 1,
-1.779983, -0.427838, -2.800665, 1, 0.2470588, 0, 1,
-1.779661, -0.9084392, -2.862825, 1, 0.2509804, 0, 1,
-1.778284, 0.4981202, -1.461157, 1, 0.2588235, 0, 1,
-1.773039, 1.337129, -2.663477, 1, 0.2627451, 0, 1,
-1.752295, 0.3252364, -1.127029, 1, 0.2705882, 0, 1,
-1.715846, 0.01169821, -1.626815, 1, 0.2745098, 0, 1,
-1.711097, 0.3192285, -1.764242, 1, 0.282353, 0, 1,
-1.699405, -0.04167333, -1.614326, 1, 0.2862745, 0, 1,
-1.680786, 2.031873, -1.450683, 1, 0.2941177, 0, 1,
-1.679265, 0.07109886, -1.110445, 1, 0.3019608, 0, 1,
-1.678225, 0.8497074, -1.414116, 1, 0.3058824, 0, 1,
-1.665422, 1.188154, -0.5644057, 1, 0.3137255, 0, 1,
-1.658423, -0.328162, -0.8903369, 1, 0.3176471, 0, 1,
-1.651308, -0.6782961, -2.284919, 1, 0.3254902, 0, 1,
-1.650748, -0.1894889, -1.709981, 1, 0.3294118, 0, 1,
-1.624854, 0.5413887, -2.761292, 1, 0.3372549, 0, 1,
-1.620231, -0.6345364, -1.609138, 1, 0.3411765, 0, 1,
-1.59923, 1.902421, -0.4766206, 1, 0.3490196, 0, 1,
-1.594523, -0.4728792, 0.09984276, 1, 0.3529412, 0, 1,
-1.581302, 0.7388406, -0.8080513, 1, 0.3607843, 0, 1,
-1.578395, 0.1311863, -1.549761, 1, 0.3647059, 0, 1,
-1.570968, 0.1636017, -2.904663, 1, 0.372549, 0, 1,
-1.564868, -0.1696779, -1.580497, 1, 0.3764706, 0, 1,
-1.559973, -0.9171923, -4.248814, 1, 0.3843137, 0, 1,
-1.5573, 0.1138246, -1.33841, 1, 0.3882353, 0, 1,
-1.554728, -1.711629, -1.473948, 1, 0.3960784, 0, 1,
-1.548307, -1.01668, -2.604541, 1, 0.4039216, 0, 1,
-1.533671, 0.5029449, -0.5980468, 1, 0.4078431, 0, 1,
-1.524728, -0.2124045, -1.162164, 1, 0.4156863, 0, 1,
-1.524327, -0.02924763, -2.662314, 1, 0.4196078, 0, 1,
-1.523602, -1.329522, -1.605274, 1, 0.427451, 0, 1,
-1.520396, -0.6338235, -2.434124, 1, 0.4313726, 0, 1,
-1.514083, -0.02073001, -1.695752, 1, 0.4392157, 0, 1,
-1.50811, 0.4495468, 0.2245235, 1, 0.4431373, 0, 1,
-1.505894, -0.6167402, -2.036007, 1, 0.4509804, 0, 1,
-1.492068, -0.813154, -0.8842881, 1, 0.454902, 0, 1,
-1.482339, -0.3309805, -0.8329974, 1, 0.4627451, 0, 1,
-1.472541, 1.503318, 0.3446994, 1, 0.4666667, 0, 1,
-1.470209, -1.013243, -0.2605669, 1, 0.4745098, 0, 1,
-1.468167, -1.115267, -2.501961, 1, 0.4784314, 0, 1,
-1.453334, -1.778653, -2.213638, 1, 0.4862745, 0, 1,
-1.451124, -0.9987579, -1.480319, 1, 0.4901961, 0, 1,
-1.448678, 2.250297, -0.9358057, 1, 0.4980392, 0, 1,
-1.443357, 0.30877, -1.945194, 1, 0.5058824, 0, 1,
-1.441079, 0.7499126, -1.204459, 1, 0.509804, 0, 1,
-1.430026, 1.492499, -0.1606595, 1, 0.5176471, 0, 1,
-1.425448, -0.8710612, -2.422456, 1, 0.5215687, 0, 1,
-1.416926, 0.3292761, -0.7661187, 1, 0.5294118, 0, 1,
-1.401698, 1.152735, -0.3605695, 1, 0.5333334, 0, 1,
-1.401464, -0.01226367, -0.5785859, 1, 0.5411765, 0, 1,
-1.398429, 0.1579929, -1.382309, 1, 0.5450981, 0, 1,
-1.382326, 1.270414, -0.4454257, 1, 0.5529412, 0, 1,
-1.380487, -0.7109433, -2.077516, 1, 0.5568628, 0, 1,
-1.373113, 0.5619366, -0.2526945, 1, 0.5647059, 0, 1,
-1.371412, 0.6496271, -1.73205, 1, 0.5686275, 0, 1,
-1.368302, 1.242797, -1.332476, 1, 0.5764706, 0, 1,
-1.366208, -0.1239986, -2.291534, 1, 0.5803922, 0, 1,
-1.363843, -0.6210315, -2.082535, 1, 0.5882353, 0, 1,
-1.35772, 1.224504, -0.9718685, 1, 0.5921569, 0, 1,
-1.353159, -0.7923703, -1.581484, 1, 0.6, 0, 1,
-1.346822, -1.580398, -2.042583, 1, 0.6078432, 0, 1,
-1.342577, 0.5632659, -0.9860979, 1, 0.6117647, 0, 1,
-1.341649, 0.5237809, -0.009373849, 1, 0.6196079, 0, 1,
-1.331972, -1.405756, -2.843022, 1, 0.6235294, 0, 1,
-1.330281, -0.2873466, -0.8399623, 1, 0.6313726, 0, 1,
-1.318421, 0.2821726, -2.466511, 1, 0.6352941, 0, 1,
-1.314794, 0.4470768, -0.9043878, 1, 0.6431373, 0, 1,
-1.313449, 0.9191897, -1.245467, 1, 0.6470588, 0, 1,
-1.312754, -0.3042233, -1.49162, 1, 0.654902, 0, 1,
-1.309557, 0.02929933, -1.806235, 1, 0.6588235, 0, 1,
-1.299683, 0.8060874, -2.595765, 1, 0.6666667, 0, 1,
-1.292918, -1.057283, -2.407911, 1, 0.6705883, 0, 1,
-1.28246, -0.5973046, -1.902043, 1, 0.6784314, 0, 1,
-1.257739, 0.7606403, -2.539908, 1, 0.682353, 0, 1,
-1.254562, -0.2899464, -1.299048, 1, 0.6901961, 0, 1,
-1.250339, -0.3743564, -2.497705, 1, 0.6941177, 0, 1,
-1.248281, -1.682694, -3.483075, 1, 0.7019608, 0, 1,
-1.248204, -0.1444014, -2.556341, 1, 0.7098039, 0, 1,
-1.229793, -0.9525471, -1.331456, 1, 0.7137255, 0, 1,
-1.225851, 1.48283, -0.5614694, 1, 0.7215686, 0, 1,
-1.224651, 0.1380394, -1.065233, 1, 0.7254902, 0, 1,
-1.223363, -0.3337205, -4.607024, 1, 0.7333333, 0, 1,
-1.219719, 1.213283, -2.607427, 1, 0.7372549, 0, 1,
-1.219551, 0.3829124, -1.032978, 1, 0.7450981, 0, 1,
-1.218389, -1.680245, -2.760872, 1, 0.7490196, 0, 1,
-1.211139, -0.8348251, -4.29221, 1, 0.7568628, 0, 1,
-1.203985, 1.739066, -0.157978, 1, 0.7607843, 0, 1,
-1.198238, -1.42188, -0.7938281, 1, 0.7686275, 0, 1,
-1.194419, 1.473769, -0.1050152, 1, 0.772549, 0, 1,
-1.192003, 1.747616, -0.006990489, 1, 0.7803922, 0, 1,
-1.186146, -2.129155, -2.095791, 1, 0.7843137, 0, 1,
-1.163112, -1.359306, -1.374704, 1, 0.7921569, 0, 1,
-1.161833, 0.3750606, -1.457909, 1, 0.7960784, 0, 1,
-1.161801, 1.251611, -0.5511964, 1, 0.8039216, 0, 1,
-1.161545, 0.5331979, -0.4931832, 1, 0.8117647, 0, 1,
-1.15911, 0.4890109, -0.4616101, 1, 0.8156863, 0, 1,
-1.141549, -0.01561152, -0.4035504, 1, 0.8235294, 0, 1,
-1.139657, 2.356004, -0.8765535, 1, 0.827451, 0, 1,
-1.139267, -0.3228128, -1.161473, 1, 0.8352941, 0, 1,
-1.137039, -0.3863823, -3.081487, 1, 0.8392157, 0, 1,
-1.11695, -0.1021545, -2.315315, 1, 0.8470588, 0, 1,
-1.112435, 0.8421912, -0.2686852, 1, 0.8509804, 0, 1,
-1.112394, -0.01914865, -1.612606, 1, 0.8588235, 0, 1,
-1.104746, 0.647385, -0.3678212, 1, 0.8627451, 0, 1,
-1.101941, -1.000783, -2.701161, 1, 0.8705882, 0, 1,
-1.09966, 1.264544, -1.459026, 1, 0.8745098, 0, 1,
-1.096687, -1.078792, -3.664756, 1, 0.8823529, 0, 1,
-1.091698, -0.3751486, -3.978802, 1, 0.8862745, 0, 1,
-1.089666, 1.116495, -2.365112, 1, 0.8941177, 0, 1,
-1.08231, -1.016038, -2.71676, 1, 0.8980392, 0, 1,
-1.070849, 1.279546, -0.9359109, 1, 0.9058824, 0, 1,
-1.070393, -2.410569, -3.756158, 1, 0.9137255, 0, 1,
-1.052943, 0.0992336, -0.1706005, 1, 0.9176471, 0, 1,
-1.051284, 0.7694818, -1.163538, 1, 0.9254902, 0, 1,
-1.048533, 1.810573, -1.21112, 1, 0.9294118, 0, 1,
-1.043998, 0.6710368, -0.972975, 1, 0.9372549, 0, 1,
-1.03585, 0.02528648, -0.5538074, 1, 0.9411765, 0, 1,
-1.034395, -1.05842, -3.45489, 1, 0.9490196, 0, 1,
-1.028413, -0.8733471, -1.860585, 1, 0.9529412, 0, 1,
-1.026735, -0.03662452, 0.1200636, 1, 0.9607843, 0, 1,
-1.021132, -0.1453238, -2.076492, 1, 0.9647059, 0, 1,
-1.020457, -0.3687071, -1.853478, 1, 0.972549, 0, 1,
-1.016849, -0.008089915, -1.223568, 1, 0.9764706, 0, 1,
-1.016076, 1.768611, -0.3190809, 1, 0.9843137, 0, 1,
-1.012446, 0.816955, 0.6287368, 1, 0.9882353, 0, 1,
-1.011007, 1.399425, 0.2056383, 1, 0.9960784, 0, 1,
-1.007277, -0.3847605, -1.802654, 0.9960784, 1, 0, 1,
-1.005616, 0.9905815, -0.8084515, 0.9921569, 1, 0, 1,
-1.000813, -1.079131, -2.684794, 0.9843137, 1, 0, 1,
-0.9931073, 0.4521106, -1.707961, 0.9803922, 1, 0, 1,
-0.9888903, 0.8553284, -2.916689, 0.972549, 1, 0, 1,
-0.9884457, -0.2904498, -1.666519, 0.9686275, 1, 0, 1,
-0.977017, 0.04222538, -1.60452, 0.9607843, 1, 0, 1,
-0.9532651, -0.5641893, -2.465154, 0.9568627, 1, 0, 1,
-0.9506373, -0.06404413, -2.933588, 0.9490196, 1, 0, 1,
-0.9430268, -0.8907943, -0.6710834, 0.945098, 1, 0, 1,
-0.9426067, -1.569467, -2.316133, 0.9372549, 1, 0, 1,
-0.933094, 0.8981969, -1.505596, 0.9333333, 1, 0, 1,
-0.9324816, 0.6919881, -1.661513, 0.9254902, 1, 0, 1,
-0.928822, -0.1321511, -1.06785, 0.9215686, 1, 0, 1,
-0.928661, 2.382484, 0.6769516, 0.9137255, 1, 0, 1,
-0.9245315, 0.6590322, -0.9059555, 0.9098039, 1, 0, 1,
-0.9231753, -0.1338005, -3.381852, 0.9019608, 1, 0, 1,
-0.9210031, 0.8593479, -0.1275457, 0.8941177, 1, 0, 1,
-0.903385, 1.853397, 0.3010061, 0.8901961, 1, 0, 1,
-0.90058, 2.068817, -1.290744, 0.8823529, 1, 0, 1,
-0.8929718, -2.026343, -3.45565, 0.8784314, 1, 0, 1,
-0.8869069, -0.7698855, -1.638653, 0.8705882, 1, 0, 1,
-0.8833181, -1.005731, -3.154033, 0.8666667, 1, 0, 1,
-0.8803778, 0.8013537, -1.751669, 0.8588235, 1, 0, 1,
-0.8795331, -0.9706258, -2.74558, 0.854902, 1, 0, 1,
-0.8792471, 0.3917286, -3.092618, 0.8470588, 1, 0, 1,
-0.8786936, -1.251347, -1.428128, 0.8431373, 1, 0, 1,
-0.8755395, -0.02327364, -2.959301, 0.8352941, 1, 0, 1,
-0.8736379, 0.04972963, -1.367274, 0.8313726, 1, 0, 1,
-0.873193, 0.6666949, -3.10606, 0.8235294, 1, 0, 1,
-0.8717217, -0.3338152, -2.644664, 0.8196079, 1, 0, 1,
-0.8657413, 0.08838134, -1.91019, 0.8117647, 1, 0, 1,
-0.8649904, -0.05056155, -1.717324, 0.8078431, 1, 0, 1,
-0.8624313, 0.9450294, -1.282329, 0.8, 1, 0, 1,
-0.85979, -0.4629691, -0.8759089, 0.7921569, 1, 0, 1,
-0.8591729, -0.1806689, -0.5326762, 0.7882353, 1, 0, 1,
-0.8525985, -0.5178147, -3.633494, 0.7803922, 1, 0, 1,
-0.8514093, 0.5177627, -0.1655776, 0.7764706, 1, 0, 1,
-0.8494179, -0.2409666, -2.065172, 0.7686275, 1, 0, 1,
-0.8481615, -0.229577, -2.050363, 0.7647059, 1, 0, 1,
-0.8478519, -0.1290019, -0.5679697, 0.7568628, 1, 0, 1,
-0.8456506, -3.216818, -3.858117, 0.7529412, 1, 0, 1,
-0.8415434, 1.620934, -1.146739, 0.7450981, 1, 0, 1,
-0.8404217, 0.1048342, -3.00455, 0.7411765, 1, 0, 1,
-0.839524, -0.3126308, -2.419047, 0.7333333, 1, 0, 1,
-0.8366562, -1.331586, -2.201614, 0.7294118, 1, 0, 1,
-0.836346, -1.415345, -1.795862, 0.7215686, 1, 0, 1,
-0.8344765, -0.6858848, -0.7980949, 0.7176471, 1, 0, 1,
-0.833825, 0.3546009, -1.656619, 0.7098039, 1, 0, 1,
-0.8249958, 0.6718554, 0.3235352, 0.7058824, 1, 0, 1,
-0.8237483, -1.360788, -2.480225, 0.6980392, 1, 0, 1,
-0.8212017, -0.06908719, -0.6042495, 0.6901961, 1, 0, 1,
-0.8187964, 0.1658906, -0.9546652, 0.6862745, 1, 0, 1,
-0.8165916, 0.09202777, -3.174074, 0.6784314, 1, 0, 1,
-0.8163192, 1.601776, 1.020767, 0.6745098, 1, 0, 1,
-0.8108116, 0.6056005, -2.323215, 0.6666667, 1, 0, 1,
-0.8032697, 0.6791747, -1.831337, 0.6627451, 1, 0, 1,
-0.7991512, -1.353367, -1.802275, 0.654902, 1, 0, 1,
-0.7932851, 0.3003162, -0.04062739, 0.6509804, 1, 0, 1,
-0.7930718, 0.3470774, -1.913946, 0.6431373, 1, 0, 1,
-0.7914512, -0.4036092, -1.117852, 0.6392157, 1, 0, 1,
-0.7856043, -1.688199, -2.659184, 0.6313726, 1, 0, 1,
-0.784465, -1.303599, -1.527483, 0.627451, 1, 0, 1,
-0.7819408, 0.4906312, -0.9357464, 0.6196079, 1, 0, 1,
-0.7738907, -0.4713864, -3.126789, 0.6156863, 1, 0, 1,
-0.7708673, 1.09801, 0.02384443, 0.6078432, 1, 0, 1,
-0.7641904, 0.4704175, -1.395004, 0.6039216, 1, 0, 1,
-0.7609803, -1.071541, -2.077594, 0.5960785, 1, 0, 1,
-0.7584257, -0.04575182, -0.6514893, 0.5882353, 1, 0, 1,
-0.7494313, -1.203625, -3.652635, 0.5843138, 1, 0, 1,
-0.7423896, 0.03428187, -0.5969564, 0.5764706, 1, 0, 1,
-0.7353853, 2.386436, -0.02357337, 0.572549, 1, 0, 1,
-0.7352325, 0.5558352, 0.490456, 0.5647059, 1, 0, 1,
-0.7312838, 1.057223, -0.1996869, 0.5607843, 1, 0, 1,
-0.7302488, 2.069733, -1.060802, 0.5529412, 1, 0, 1,
-0.7204379, -1.189049, -2.887673, 0.5490196, 1, 0, 1,
-0.7194118, -0.6128207, -2.579997, 0.5411765, 1, 0, 1,
-0.7154852, -2.186556, -1.645004, 0.5372549, 1, 0, 1,
-0.7070614, 1.545524, 0.305243, 0.5294118, 1, 0, 1,
-0.7048572, -0.557039, -4.121561, 0.5254902, 1, 0, 1,
-0.7005355, -2.185313, -1.612648, 0.5176471, 1, 0, 1,
-0.692533, -0.7522296, -2.064753, 0.5137255, 1, 0, 1,
-0.6900772, 0.284545, -0.8799416, 0.5058824, 1, 0, 1,
-0.6844837, -0.505421, -1.761491, 0.5019608, 1, 0, 1,
-0.6768415, -0.0703479, -1.442828, 0.4941176, 1, 0, 1,
-0.672999, -0.5398198, -2.025149, 0.4862745, 1, 0, 1,
-0.661629, 1.111096, 0.6986997, 0.4823529, 1, 0, 1,
-0.661501, -0.6164134, -3.227176, 0.4745098, 1, 0, 1,
-0.6586788, 0.06792463, 0.302425, 0.4705882, 1, 0, 1,
-0.6535894, -0.7841849, -2.956807, 0.4627451, 1, 0, 1,
-0.6466734, 1.418381, -0.7359645, 0.4588235, 1, 0, 1,
-0.6403405, 0.2519558, -1.024538, 0.4509804, 1, 0, 1,
-0.6384386, 0.1454349, 0.7348654, 0.4470588, 1, 0, 1,
-0.636647, 0.02383907, -3.069855, 0.4392157, 1, 0, 1,
-0.6357759, 0.1554163, -0.4601575, 0.4352941, 1, 0, 1,
-0.6342018, 0.3155515, -0.8687358, 0.427451, 1, 0, 1,
-0.6338139, 0.180711, -1.475431, 0.4235294, 1, 0, 1,
-0.6276655, 0.07158773, -1.995625, 0.4156863, 1, 0, 1,
-0.6251174, 1.693808, -1.471016, 0.4117647, 1, 0, 1,
-0.6196547, 0.1812713, -1.514587, 0.4039216, 1, 0, 1,
-0.6164383, -0.1844415, -1.17222, 0.3960784, 1, 0, 1,
-0.6122478, 1.024474, -0.6512617, 0.3921569, 1, 0, 1,
-0.609954, 1.490645, -1.556886, 0.3843137, 1, 0, 1,
-0.6059293, -1.462303, -3.196793, 0.3803922, 1, 0, 1,
-0.6041246, -1.338037, -3.182318, 0.372549, 1, 0, 1,
-0.603265, -0.5371016, -2.820929, 0.3686275, 1, 0, 1,
-0.602085, 1.328144, -0.8593021, 0.3607843, 1, 0, 1,
-0.5984479, -0.06744424, -2.744328, 0.3568628, 1, 0, 1,
-0.5981672, 0.4098354, -0.4125135, 0.3490196, 1, 0, 1,
-0.5978739, 0.8780402, -0.007923113, 0.345098, 1, 0, 1,
-0.5966712, 0.2925204, -0.1960706, 0.3372549, 1, 0, 1,
-0.5938947, -0.6295206, -1.794285, 0.3333333, 1, 0, 1,
-0.5920209, -1.215086, -1.632304, 0.3254902, 1, 0, 1,
-0.5914533, 1.642918, -0.8036828, 0.3215686, 1, 0, 1,
-0.5831004, 0.801455, 0.2050138, 0.3137255, 1, 0, 1,
-0.5821658, -0.89613, -1.637799, 0.3098039, 1, 0, 1,
-0.5812409, 1.716662, -1.379513, 0.3019608, 1, 0, 1,
-0.5787228, -0.1278531, -0.314724, 0.2941177, 1, 0, 1,
-0.5764465, 0.7658058, -0.9169415, 0.2901961, 1, 0, 1,
-0.5744178, 1.221128, -1.294051, 0.282353, 1, 0, 1,
-0.5720974, -1.494411, -2.861625, 0.2784314, 1, 0, 1,
-0.571728, 1.614204, -1.202637, 0.2705882, 1, 0, 1,
-0.5621296, -0.1866133, -1.82462, 0.2666667, 1, 0, 1,
-0.561957, 0.008849136, -3.041632, 0.2588235, 1, 0, 1,
-0.5601458, 0.7165605, -0.7075816, 0.254902, 1, 0, 1,
-0.5580801, 0.09943724, -1.913787, 0.2470588, 1, 0, 1,
-0.5552323, 0.3192963, -1.796449, 0.2431373, 1, 0, 1,
-0.5469646, 0.3123876, -1.818385, 0.2352941, 1, 0, 1,
-0.5388635, 0.8432562, -0.4168618, 0.2313726, 1, 0, 1,
-0.5332175, -1.367451, -2.950633, 0.2235294, 1, 0, 1,
-0.5312012, 2.387351, -0.1888143, 0.2196078, 1, 0, 1,
-0.5301239, 0.1582586, -1.499684, 0.2117647, 1, 0, 1,
-0.5221284, 0.06833284, -0.848318, 0.2078431, 1, 0, 1,
-0.5208264, 0.4893814, 0.4406613, 0.2, 1, 0, 1,
-0.5203221, 0.01103426, -1.865997, 0.1921569, 1, 0, 1,
-0.5197508, -1.143394, -4.15791, 0.1882353, 1, 0, 1,
-0.5171602, 0.3390854, -1.169364, 0.1803922, 1, 0, 1,
-0.5150262, -0.1968985, -1.65384, 0.1764706, 1, 0, 1,
-0.514246, 0.1918645, -1.349781, 0.1686275, 1, 0, 1,
-0.5118254, 1.180436, 0.01075252, 0.1647059, 1, 0, 1,
-0.5115959, -0.7336466, -2.341271, 0.1568628, 1, 0, 1,
-0.5100237, -1.153913, -3.996546, 0.1529412, 1, 0, 1,
-0.5094025, -0.170957, -3.243278, 0.145098, 1, 0, 1,
-0.508624, -0.8675407, -2.247272, 0.1411765, 1, 0, 1,
-0.5057009, -0.9289697, -2.750591, 0.1333333, 1, 0, 1,
-0.5037008, 0.7853087, -0.4512528, 0.1294118, 1, 0, 1,
-0.5031894, -0.7477644, -3.017622, 0.1215686, 1, 0, 1,
-0.4953878, 1.278552, -0.2866068, 0.1176471, 1, 0, 1,
-0.4920712, 0.1649619, -1.286642, 0.1098039, 1, 0, 1,
-0.4908977, -0.8402516, -0.9618456, 0.1058824, 1, 0, 1,
-0.4902129, -0.7422834, -4.559004, 0.09803922, 1, 0, 1,
-0.4889321, -0.4959886, -1.918469, 0.09019608, 1, 0, 1,
-0.4866104, -1.293578, -1.252308, 0.08627451, 1, 0, 1,
-0.4836661, 1.480167, -2.744972, 0.07843138, 1, 0, 1,
-0.4823749, 1.06153, -0.5793918, 0.07450981, 1, 0, 1,
-0.4781838, -1.047739, -1.955962, 0.06666667, 1, 0, 1,
-0.4773555, 0.8995844, -0.6311044, 0.0627451, 1, 0, 1,
-0.4711741, -0.7114671, -1.787124, 0.05490196, 1, 0, 1,
-0.4705863, 1.319108, -0.1177584, 0.05098039, 1, 0, 1,
-0.4674558, -0.4828764, -0.9985119, 0.04313726, 1, 0, 1,
-0.4660325, 0.002097192, -2.369634, 0.03921569, 1, 0, 1,
-0.4609483, -1.719768, -2.84079, 0.03137255, 1, 0, 1,
-0.4606717, 0.9641554, 0.6789702, 0.02745098, 1, 0, 1,
-0.459306, -0.6127235, -3.330929, 0.01960784, 1, 0, 1,
-0.4591134, 0.3363287, -0.6514205, 0.01568628, 1, 0, 1,
-0.4577053, -0.5359595, -1.05468, 0.007843138, 1, 0, 1,
-0.4570316, 0.3450304, -2.293641, 0.003921569, 1, 0, 1,
-0.4558962, -0.814366, -3.042041, 0, 1, 0.003921569, 1,
-0.4532797, 0.02220178, -2.758244, 0, 1, 0.01176471, 1,
-0.4502428, 0.7973408, 1.138828, 0, 1, 0.01568628, 1,
-0.4464885, 1.660631, -0.6596316, 0, 1, 0.02352941, 1,
-0.443524, -0.4439706, -2.17251, 0, 1, 0.02745098, 1,
-0.4416472, -0.5915167, -2.823261, 0, 1, 0.03529412, 1,
-0.4373455, 0.3508636, -0.2233955, 0, 1, 0.03921569, 1,
-0.4364927, 0.536365, -0.8352782, 0, 1, 0.04705882, 1,
-0.434238, -1.414585, -2.014531, 0, 1, 0.05098039, 1,
-0.4324815, -1.745023, -2.471896, 0, 1, 0.05882353, 1,
-0.43209, -1.010047, -2.003196, 0, 1, 0.0627451, 1,
-0.4304765, 2.653405, -1.193939, 0, 1, 0.07058824, 1,
-0.4300087, -0.3224097, -2.167049, 0, 1, 0.07450981, 1,
-0.4280445, -0.5538915, -4.781036, 0, 1, 0.08235294, 1,
-0.4250043, -1.056955, -4.668972, 0, 1, 0.08627451, 1,
-0.4210036, -0.3708881, -2.082023, 0, 1, 0.09411765, 1,
-0.4202022, 0.3763982, 0.1553295, 0, 1, 0.1019608, 1,
-0.4187568, 1.340557, -0.4778872, 0, 1, 0.1058824, 1,
-0.4165529, -0.1531488, -3.489786, 0, 1, 0.1137255, 1,
-0.416375, -1.475087, -3.847719, 0, 1, 0.1176471, 1,
-0.4158381, -0.9106326, -3.431246, 0, 1, 0.1254902, 1,
-0.4113416, 1.083894, -0.4261667, 0, 1, 0.1294118, 1,
-0.4101632, 0.2642661, -0.328797, 0, 1, 0.1372549, 1,
-0.4089238, -1.055025, -2.621791, 0, 1, 0.1411765, 1,
-0.408852, -0.9328634, -2.39842, 0, 1, 0.1490196, 1,
-0.4045612, -0.3033608, -2.652279, 0, 1, 0.1529412, 1,
-0.4019471, 0.5614067, 0.04348606, 0, 1, 0.1607843, 1,
-0.4012641, -0.3940872, -2.74194, 0, 1, 0.1647059, 1,
-0.4010553, -1.407946, -2.619508, 0, 1, 0.172549, 1,
-0.4000621, 0.05199333, -2.190528, 0, 1, 0.1764706, 1,
-0.3991168, 0.2567527, -0.5876306, 0, 1, 0.1843137, 1,
-0.3987498, -0.06011876, -2.065174, 0, 1, 0.1882353, 1,
-0.3963228, 0.01759879, -0.04576639, 0, 1, 0.1960784, 1,
-0.3934443, 0.1683112, -2.304359, 0, 1, 0.2039216, 1,
-0.3897748, 2.186704, 0.5371971, 0, 1, 0.2078431, 1,
-0.3880132, -0.1447301, 0.2347464, 0, 1, 0.2156863, 1,
-0.3862678, 1.597267, 2.048306, 0, 1, 0.2196078, 1,
-0.3737169, -0.3063928, -1.711798, 0, 1, 0.227451, 1,
-0.3729598, 0.7794533, 0.1083342, 0, 1, 0.2313726, 1,
-0.3695821, -1.20983, -1.463735, 0, 1, 0.2392157, 1,
-0.3683858, 0.4763161, -2.45143, 0, 1, 0.2431373, 1,
-0.3657541, 1.335532, 0.6200647, 0, 1, 0.2509804, 1,
-0.3635831, 2.695845, 0.5032861, 0, 1, 0.254902, 1,
-0.3614833, 1.148772, 0.4226381, 0, 1, 0.2627451, 1,
-0.3562427, 0.8332371, -0.6210996, 0, 1, 0.2666667, 1,
-0.3503865, 2.734085, -2.405892, 0, 1, 0.2745098, 1,
-0.3492433, -0.4720709, -2.79016, 0, 1, 0.2784314, 1,
-0.3488729, 0.6322503, 0.4545686, 0, 1, 0.2862745, 1,
-0.3448414, -0.2872438, -1.38811, 0, 1, 0.2901961, 1,
-0.344743, -0.1673483, -2.329035, 0, 1, 0.2980392, 1,
-0.3427068, -0.8633793, -1.158243, 0, 1, 0.3058824, 1,
-0.3421742, -1.319636, -3.300269, 0, 1, 0.3098039, 1,
-0.3419663, -0.3184191, -3.0562, 0, 1, 0.3176471, 1,
-0.3343678, 1.827142, -0.1630304, 0, 1, 0.3215686, 1,
-0.330765, -0.2569072, -2.387362, 0, 1, 0.3294118, 1,
-0.3296846, 1.349952, -1.567642, 0, 1, 0.3333333, 1,
-0.3276108, 2.121204, 0.343776, 0, 1, 0.3411765, 1,
-0.324878, 1.028822, 0.4737005, 0, 1, 0.345098, 1,
-0.3236618, 0.2550022, -2.253627, 0, 1, 0.3529412, 1,
-0.3227706, 0.2746823, -1.313375, 0, 1, 0.3568628, 1,
-0.3162377, 0.2882479, -1.534863, 0, 1, 0.3647059, 1,
-0.3144855, 1.202774, 0.4533006, 0, 1, 0.3686275, 1,
-0.3102785, 0.4152594, -0.4075893, 0, 1, 0.3764706, 1,
-0.3087414, -0.3681861, -2.589095, 0, 1, 0.3803922, 1,
-0.3072254, -1.028387, -3.016731, 0, 1, 0.3882353, 1,
-0.3057656, -0.6057252, -1.254048, 0, 1, 0.3921569, 1,
-0.3024967, -0.7583709, -2.383306, 0, 1, 0.4, 1,
-0.3020457, 1.788266, -2.359409, 0, 1, 0.4078431, 1,
-0.3020299, -0.3406716, -4.250578, 0, 1, 0.4117647, 1,
-0.3020152, 1.152429, -0.1733536, 0, 1, 0.4196078, 1,
-0.30022, -0.03804618, -1.644937, 0, 1, 0.4235294, 1,
-0.3000308, 0.2565367, -0.5448431, 0, 1, 0.4313726, 1,
-0.2998961, -0.3404202, -1.858184, 0, 1, 0.4352941, 1,
-0.2906063, -0.544686, -3.357731, 0, 1, 0.4431373, 1,
-0.2901037, 1.252019, -1.973614, 0, 1, 0.4470588, 1,
-0.2807128, -0.875359, -3.210403, 0, 1, 0.454902, 1,
-0.2801051, -0.572506, -1.036402, 0, 1, 0.4588235, 1,
-0.2782819, -1.672612, -4.01206, 0, 1, 0.4666667, 1,
-0.2775111, 0.6459234, -1.608456, 0, 1, 0.4705882, 1,
-0.2755266, -0.1407124, -2.639982, 0, 1, 0.4784314, 1,
-0.2735765, 0.5073299, -0.64591, 0, 1, 0.4823529, 1,
-0.2680956, 0.3660651, -1.188727, 0, 1, 0.4901961, 1,
-0.2669992, -0.9145626, -1.845621, 0, 1, 0.4941176, 1,
-0.2665668, 1.243792, 0.1172172, 0, 1, 0.5019608, 1,
-0.2595356, 0.7716451, -1.21756, 0, 1, 0.509804, 1,
-0.2589153, -0.8291484, -2.915878, 0, 1, 0.5137255, 1,
-0.2571342, 1.646316, -0.942287, 0, 1, 0.5215687, 1,
-0.2569959, -0.1675783, -2.893876, 0, 1, 0.5254902, 1,
-0.2536881, -0.1218051, -1.752186, 0, 1, 0.5333334, 1,
-0.2480596, -1.078267, -0.6210859, 0, 1, 0.5372549, 1,
-0.2415221, 1.161623, -0.1229078, 0, 1, 0.5450981, 1,
-0.2382384, -0.1190619, -3.807663, 0, 1, 0.5490196, 1,
-0.236472, -0.2121344, -1.999771, 0, 1, 0.5568628, 1,
-0.2330233, -1.220228, -1.695001, 0, 1, 0.5607843, 1,
-0.2299539, -1.3209, -3.745117, 0, 1, 0.5686275, 1,
-0.2253482, -0.1878753, -0.5937679, 0, 1, 0.572549, 1,
-0.224267, -0.6835826, -4.678833, 0, 1, 0.5803922, 1,
-0.2233721, 1.022846, 0.7560231, 0, 1, 0.5843138, 1,
-0.2226274, -0.06352188, -2.38912, 0, 1, 0.5921569, 1,
-0.2178955, -2.226786, -4.029846, 0, 1, 0.5960785, 1,
-0.2168536, -1.468944, -3.197494, 0, 1, 0.6039216, 1,
-0.2088044, -0.2172795, -2.497729, 0, 1, 0.6117647, 1,
-0.2042717, 1.100741, -0.4083348, 0, 1, 0.6156863, 1,
-0.2031842, -0.3835126, -1.874542, 0, 1, 0.6235294, 1,
-0.1995801, -0.427904, -2.19077, 0, 1, 0.627451, 1,
-0.1983853, 1.87086, 0.2400671, 0, 1, 0.6352941, 1,
-0.1920988, -0.9521337, -3.007568, 0, 1, 0.6392157, 1,
-0.1916384, -1.606153, -4.315248, 0, 1, 0.6470588, 1,
-0.1912412, -0.132497, -4.271671, 0, 1, 0.6509804, 1,
-0.1860384, -1.117473, -1.116552, 0, 1, 0.6588235, 1,
-0.1833176, -0.5981907, -3.927024, 0, 1, 0.6627451, 1,
-0.1826174, -0.5285827, -5.053874, 0, 1, 0.6705883, 1,
-0.1813146, 1.703406, -1.174064, 0, 1, 0.6745098, 1,
-0.1783388, -0.09295086, -2.289033, 0, 1, 0.682353, 1,
-0.1659973, -0.1803067, -3.593332, 0, 1, 0.6862745, 1,
-0.1656572, 0.9459959, -0.5782235, 0, 1, 0.6941177, 1,
-0.1639817, -0.5052407, -1.899276, 0, 1, 0.7019608, 1,
-0.16336, -0.6419671, -4.023893, 0, 1, 0.7058824, 1,
-0.1614912, -0.4120865, -0.8908576, 0, 1, 0.7137255, 1,
-0.1611572, -0.9561397, -3.589621, 0, 1, 0.7176471, 1,
-0.1610309, 1.587119, 0.3595377, 0, 1, 0.7254902, 1,
-0.1603663, -0.1070581, -0.5957685, 0, 1, 0.7294118, 1,
-0.1597807, 0.3622103, -1.404878, 0, 1, 0.7372549, 1,
-0.1572634, 0.542815, 0.4023875, 0, 1, 0.7411765, 1,
-0.1557327, 0.485926, -1.136724, 0, 1, 0.7490196, 1,
-0.1555419, 0.6672793, -0.7819036, 0, 1, 0.7529412, 1,
-0.1487384, -0.05205915, -0.4296797, 0, 1, 0.7607843, 1,
-0.1486726, -0.1962222, -3.017163, 0, 1, 0.7647059, 1,
-0.1454908, 0.8289829, -0.07806816, 0, 1, 0.772549, 1,
-0.1404383, -0.09970775, -0.7928526, 0, 1, 0.7764706, 1,
-0.137875, -1.290268, -3.166118, 0, 1, 0.7843137, 1,
-0.1366472, 2.16093, 0.4174155, 0, 1, 0.7882353, 1,
-0.1363508, -0.01338109, -2.865222, 0, 1, 0.7960784, 1,
-0.1359537, 1.022695, 0.3362784, 0, 1, 0.8039216, 1,
-0.1336364, 0.203582, -0.5206351, 0, 1, 0.8078431, 1,
-0.1289832, -0.02863237, -0.623344, 0, 1, 0.8156863, 1,
-0.1254043, -0.661774, -2.006576, 0, 1, 0.8196079, 1,
-0.1179916, 1.322611, 0.06954028, 0, 1, 0.827451, 1,
-0.1125122, 0.2862808, -0.5213525, 0, 1, 0.8313726, 1,
-0.112188, -0.5221674, -4.73959, 0, 1, 0.8392157, 1,
-0.1120888, 0.6533927, 1.325873, 0, 1, 0.8431373, 1,
-0.1084479, -0.4162663, -2.464439, 0, 1, 0.8509804, 1,
-0.1015694, -0.9456442, -1.795649, 0, 1, 0.854902, 1,
-0.09939943, -1.153751, -3.07321, 0, 1, 0.8627451, 1,
-0.09515727, -2.070924, -2.637471, 0, 1, 0.8666667, 1,
-0.09039565, 1.031773, -0.3954409, 0, 1, 0.8745098, 1,
-0.08401088, -1.69773, -4.932649, 0, 1, 0.8784314, 1,
-0.07973232, -0.798885, -2.819251, 0, 1, 0.8862745, 1,
-0.07938787, 1.198346, -1.496492, 0, 1, 0.8901961, 1,
-0.07865455, -0.05214766, -2.892294, 0, 1, 0.8980392, 1,
-0.07597518, 0.2243095, -2.234177, 0, 1, 0.9058824, 1,
-0.0719897, 0.1926225, -0.2729144, 0, 1, 0.9098039, 1,
-0.07130439, -0.01037274, -2.001278, 0, 1, 0.9176471, 1,
-0.0686906, -1.502308, -1.497186, 0, 1, 0.9215686, 1,
-0.0683669, -0.4294015, -4.727619, 0, 1, 0.9294118, 1,
-0.06797806, 0.9990985, -0.03707776, 0, 1, 0.9333333, 1,
-0.06796889, 0.6970738, -0.3818369, 0, 1, 0.9411765, 1,
-0.06793872, 1.658316, -0.082605, 0, 1, 0.945098, 1,
-0.06451725, -0.3427274, -2.102649, 0, 1, 0.9529412, 1,
-0.06416892, -1.898467, -3.083988, 0, 1, 0.9568627, 1,
-0.06409603, 1.558346, -1.008274, 0, 1, 0.9647059, 1,
-0.06183626, -1.130978, -2.7294, 0, 1, 0.9686275, 1,
-0.05961437, -0.2095053, -4.849889, 0, 1, 0.9764706, 1,
-0.05887543, 1.91564, -1.388901, 0, 1, 0.9803922, 1,
-0.05629507, -0.6686447, -2.713264, 0, 1, 0.9882353, 1,
-0.05571115, 0.2069863, -0.4641591, 0, 1, 0.9921569, 1,
-0.05277763, 1.303073, 0.1459596, 0, 1, 1, 1,
-0.05232454, 0.8063301, -0.02932448, 0, 0.9921569, 1, 1,
-0.05216604, 0.3681713, -0.1923142, 0, 0.9882353, 1, 1,
-0.0505598, -0.467389, -2.894828, 0, 0.9803922, 1, 1,
-0.04179024, 0.7530785, 0.4691873, 0, 0.9764706, 1, 1,
-0.0387185, -0.6702176, -3.282961, 0, 0.9686275, 1, 1,
-0.03797333, -0.9632951, -2.341694, 0, 0.9647059, 1, 1,
-0.0368172, 1.061151, -0.3346328, 0, 0.9568627, 1, 1,
-0.03599302, -0.7826931, -1.86583, 0, 0.9529412, 1, 1,
-0.03572225, 1.088946, -0.8193377, 0, 0.945098, 1, 1,
-0.03360836, 0.918833, -0.007021639, 0, 0.9411765, 1, 1,
-0.0334979, -0.1575035, -2.527465, 0, 0.9333333, 1, 1,
-0.03288754, 1.673911, 0.2635719, 0, 0.9294118, 1, 1,
-0.03070053, 1.177995, 1.232579, 0, 0.9215686, 1, 1,
-0.02990564, 0.2026547, -0.1957417, 0, 0.9176471, 1, 1,
-0.02916723, -0.5826635, -2.279503, 0, 0.9098039, 1, 1,
-0.02398588, -0.2262167, -5.22956, 0, 0.9058824, 1, 1,
-0.01966967, -0.7163126, -2.333473, 0, 0.8980392, 1, 1,
-0.01559624, 1.851011, 0.2691841, 0, 0.8901961, 1, 1,
-0.01359704, -0.6739743, -2.21278, 0, 0.8862745, 1, 1,
-0.01226298, 0.1260598, 0.1001955, 0, 0.8784314, 1, 1,
-0.0120771, 0.231285, 0.9952195, 0, 0.8745098, 1, 1,
-0.01061037, -0.8242636, -3.057788, 0, 0.8666667, 1, 1,
-0.007249095, -0.5498078, -2.856838, 0, 0.8627451, 1, 1,
-0.00272051, -0.5446617, -2.944427, 0, 0.854902, 1, 1,
0.008342119, 0.8491841, -0.9338465, 0, 0.8509804, 1, 1,
0.01192062, 1.216619, 0.5793495, 0, 0.8431373, 1, 1,
0.01697272, 0.6911038, -0.09341704, 0, 0.8392157, 1, 1,
0.01843864, -0.5351083, 3.780085, 0, 0.8313726, 1, 1,
0.01901996, -0.8107455, 3.753718, 0, 0.827451, 1, 1,
0.02216583, 0.5982251, -0.6724874, 0, 0.8196079, 1, 1,
0.02378931, -1.414567, 3.758033, 0, 0.8156863, 1, 1,
0.02819778, 1.213123, 0.1983639, 0, 0.8078431, 1, 1,
0.03107196, -0.6806819, 2.901204, 0, 0.8039216, 1, 1,
0.0378244, 0.7140529, 1.566357, 0, 0.7960784, 1, 1,
0.04076497, 0.418597, 1.643129, 0, 0.7882353, 1, 1,
0.04110571, 1.383662, -0.07906949, 0, 0.7843137, 1, 1,
0.04228079, -0.001388351, 1.703424, 0, 0.7764706, 1, 1,
0.04255515, 0.6301503, 0.978287, 0, 0.772549, 1, 1,
0.04761157, 1.780307, 1.537989, 0, 0.7647059, 1, 1,
0.05148897, 0.4504938, 0.2030497, 0, 0.7607843, 1, 1,
0.05749548, 0.5682588, 0.2154754, 0, 0.7529412, 1, 1,
0.06196835, -0.5654007, 4.625801, 0, 0.7490196, 1, 1,
0.06471865, 0.6714985, -0.4530878, 0, 0.7411765, 1, 1,
0.0694458, 1.79212, 0.08650618, 0, 0.7372549, 1, 1,
0.07151531, -0.2960954, 2.847926, 0, 0.7294118, 1, 1,
0.08084624, 0.4143122, 0.406569, 0, 0.7254902, 1, 1,
0.08126975, 0.9941658, -1.042159, 0, 0.7176471, 1, 1,
0.08325926, 0.9999959, 1.057226, 0, 0.7137255, 1, 1,
0.08347078, -1.219017, 3.065542, 0, 0.7058824, 1, 1,
0.08384699, 0.3999801, 1.249928, 0, 0.6980392, 1, 1,
0.08416726, 1.863082, -0.8672203, 0, 0.6941177, 1, 1,
0.08740426, -0.3424649, 2.161642, 0, 0.6862745, 1, 1,
0.09443989, -0.8730407, 3.106903, 0, 0.682353, 1, 1,
0.09506438, 1.504911, 0.1670522, 0, 0.6745098, 1, 1,
0.09822942, 1.652212, 1.452102, 0, 0.6705883, 1, 1,
0.09950556, 0.3877055, 0.3133153, 0, 0.6627451, 1, 1,
0.1002024, 1.580037, -1.054744, 0, 0.6588235, 1, 1,
0.1002683, 0.06088293, 1.149094, 0, 0.6509804, 1, 1,
0.1027684, 1.380656, 0.03911727, 0, 0.6470588, 1, 1,
0.1033858, -0.2885419, 2.011048, 0, 0.6392157, 1, 1,
0.1219904, 0.9616201, 0.008258687, 0, 0.6352941, 1, 1,
0.1254548, 0.2277091, 0.2901193, 0, 0.627451, 1, 1,
0.1282099, -0.8117245, 2.715517, 0, 0.6235294, 1, 1,
0.1321983, -0.7306875, 4.12491, 0, 0.6156863, 1, 1,
0.1392553, -0.1821787, 3.593763, 0, 0.6117647, 1, 1,
0.1400804, -0.8989074, 2.664851, 0, 0.6039216, 1, 1,
0.1422466, -1.36144, 2.588057, 0, 0.5960785, 1, 1,
0.1478622, -0.3922009, 3.226706, 0, 0.5921569, 1, 1,
0.1523318, -1.826144, 3.268496, 0, 0.5843138, 1, 1,
0.1539267, -1.098163, 2.429806, 0, 0.5803922, 1, 1,
0.1641823, -0.07069757, 0.4885708, 0, 0.572549, 1, 1,
0.1655001, -1.116219, 1.123256, 0, 0.5686275, 1, 1,
0.1705291, 0.2931159, -0.6229194, 0, 0.5607843, 1, 1,
0.1718198, 0.313171, 0.0866895, 0, 0.5568628, 1, 1,
0.1755892, 1.887674, -2.297738, 0, 0.5490196, 1, 1,
0.176153, -0.5593395, 0.8737807, 0, 0.5450981, 1, 1,
0.1775804, 0.1124316, 0.7601786, 0, 0.5372549, 1, 1,
0.1799953, 2.370221, -0.377818, 0, 0.5333334, 1, 1,
0.1827956, -1.401519, 4.42489, 0, 0.5254902, 1, 1,
0.1863983, 0.8937337, -0.2955485, 0, 0.5215687, 1, 1,
0.1890189, 0.9105161, 0.6661103, 0, 0.5137255, 1, 1,
0.1891221, -1.781999, 2.571108, 0, 0.509804, 1, 1,
0.1903437, -0.8694897, 2.316853, 0, 0.5019608, 1, 1,
0.1916519, -0.06851713, 0.5533084, 0, 0.4941176, 1, 1,
0.1945253, -0.01698329, 1.601515, 0, 0.4901961, 1, 1,
0.2017726, 1.158024, 0.8174114, 0, 0.4823529, 1, 1,
0.2054334, 0.1404541, -0.5450232, 0, 0.4784314, 1, 1,
0.2077951, -0.4124737, 2.300964, 0, 0.4705882, 1, 1,
0.2101295, -1.350296, 0.4927063, 0, 0.4666667, 1, 1,
0.2194476, 0.5301846, -0.6266098, 0, 0.4588235, 1, 1,
0.2209336, 0.9279286, -1.026516, 0, 0.454902, 1, 1,
0.2214777, -0.171068, 1.732758, 0, 0.4470588, 1, 1,
0.2263887, -1.393771, 3.078189, 0, 0.4431373, 1, 1,
0.2272205, -0.3001114, 1.068512, 0, 0.4352941, 1, 1,
0.2278581, 1.392885, -0.1492444, 0, 0.4313726, 1, 1,
0.233566, -0.737403, 2.607781, 0, 0.4235294, 1, 1,
0.2373116, 1.499226, 0.3844715, 0, 0.4196078, 1, 1,
0.2377618, -0.00877763, 2.326439, 0, 0.4117647, 1, 1,
0.2379997, -0.1969959, 1.952789, 0, 0.4078431, 1, 1,
0.2396633, 2.007269, -1.405555, 0, 0.4, 1, 1,
0.2455255, 0.4031644, 1.076029, 0, 0.3921569, 1, 1,
0.2485892, 2.16157, -0.03131521, 0, 0.3882353, 1, 1,
0.2495287, -0.6590666, 3.599557, 0, 0.3803922, 1, 1,
0.2496043, 0.1706806, 2.65809, 0, 0.3764706, 1, 1,
0.2525389, 0.5244395, 2.552338, 0, 0.3686275, 1, 1,
0.2542436, -1.021478, 1.807394, 0, 0.3647059, 1, 1,
0.2570826, 0.161329, 0.6617597, 0, 0.3568628, 1, 1,
0.2584579, 1.438171, 0.5309724, 0, 0.3529412, 1, 1,
0.2585583, -1.112928, 4.195224, 0, 0.345098, 1, 1,
0.2588204, -0.5138838, 1.75054, 0, 0.3411765, 1, 1,
0.2601577, -0.7802894, 1.553593, 0, 0.3333333, 1, 1,
0.2616231, 1.620867, -0.3746665, 0, 0.3294118, 1, 1,
0.262385, -2.435556, 1.691925, 0, 0.3215686, 1, 1,
0.2625562, 0.4536331, -0.1309031, 0, 0.3176471, 1, 1,
0.2657512, 1.703152, -1.256315, 0, 0.3098039, 1, 1,
0.2693008, -1.622673, 1.617236, 0, 0.3058824, 1, 1,
0.2707718, -0.1991793, 1.822741, 0, 0.2980392, 1, 1,
0.2764769, 0.4722209, -0.4335594, 0, 0.2901961, 1, 1,
0.2784824, 0.8147082, -0.326839, 0, 0.2862745, 1, 1,
0.2787, 0.1017092, 0.3610317, 0, 0.2784314, 1, 1,
0.2801045, 0.4379607, 0.8665123, 0, 0.2745098, 1, 1,
0.281817, 0.1554344, 0.3350997, 0, 0.2666667, 1, 1,
0.2827397, 0.9947056, 0.7433712, 0, 0.2627451, 1, 1,
0.2858301, -1.693718, 1.816826, 0, 0.254902, 1, 1,
0.2881619, -0.306621, 0.7642241, 0, 0.2509804, 1, 1,
0.2963808, 0.9698529, 2.106363, 0, 0.2431373, 1, 1,
0.2983744, 0.564683, 0.5107207, 0, 0.2392157, 1, 1,
0.2994602, 0.8137001, 1.01197, 0, 0.2313726, 1, 1,
0.300609, -0.8977428, 3.385265, 0, 0.227451, 1, 1,
0.3009057, 1.552464, -0.5518838, 0, 0.2196078, 1, 1,
0.3024035, 0.08588853, 0.5550093, 0, 0.2156863, 1, 1,
0.3051432, -0.7545794, 3.027812, 0, 0.2078431, 1, 1,
0.3111399, -1.437459, 3.359473, 0, 0.2039216, 1, 1,
0.3114589, -0.8442281, 4.705492, 0, 0.1960784, 1, 1,
0.3164462, -0.3405497, 4.055803, 0, 0.1882353, 1, 1,
0.3189098, -0.6338744, 1.620683, 0, 0.1843137, 1, 1,
0.3200585, 0.4439215, 0.03684419, 0, 0.1764706, 1, 1,
0.3292198, -0.9881839, 3.692753, 0, 0.172549, 1, 1,
0.3317885, 1.422917, 1.186688, 0, 0.1647059, 1, 1,
0.3333572, 0.2788888, 2.064019, 0, 0.1607843, 1, 1,
0.3388346, 1.801533, -0.629634, 0, 0.1529412, 1, 1,
0.3410216, 0.5649708, 0.1334011, 0, 0.1490196, 1, 1,
0.3446204, -1.288241, 1.65556, 0, 0.1411765, 1, 1,
0.3491292, 0.003279485, 1.970881, 0, 0.1372549, 1, 1,
0.3494261, 0.2376738, 1.238656, 0, 0.1294118, 1, 1,
0.3509982, 0.4661304, 2.294049, 0, 0.1254902, 1, 1,
0.35354, -0.3298487, 3.734049, 0, 0.1176471, 1, 1,
0.3553216, -0.8950629, 2.490912, 0, 0.1137255, 1, 1,
0.362161, -0.8744905, 2.827747, 0, 0.1058824, 1, 1,
0.3634406, -0.5052115, 3.622365, 0, 0.09803922, 1, 1,
0.3635873, 1.62737, 0.5139884, 0, 0.09411765, 1, 1,
0.3644482, -0.6866665, 1.83696, 0, 0.08627451, 1, 1,
0.367592, 0.1044321, 1.511887, 0, 0.08235294, 1, 1,
0.3711374, 0.3004429, 0.4774831, 0, 0.07450981, 1, 1,
0.3748463, -0.2143491, 2.581105, 0, 0.07058824, 1, 1,
0.3800842, 0.3692461, 0.1889532, 0, 0.0627451, 1, 1,
0.3839927, -1.200153, 0.7305102, 0, 0.05882353, 1, 1,
0.3840989, 0.4146215, 0.4009939, 0, 0.05098039, 1, 1,
0.3873901, 0.582235, 1.914435, 0, 0.04705882, 1, 1,
0.3938912, -0.009256092, 0.467285, 0, 0.03921569, 1, 1,
0.3949112, -1.32808, 3.656933, 0, 0.03529412, 1, 1,
0.3967665, -0.9760982, 2.151868, 0, 0.02745098, 1, 1,
0.3969307, -0.564283, 1.34586, 0, 0.02352941, 1, 1,
0.3973856, -1.360599, 4.575984, 0, 0.01568628, 1, 1,
0.4003599, -2.058694, 3.039394, 0, 0.01176471, 1, 1,
0.4065034, 0.1614646, 0.5980714, 0, 0.003921569, 1, 1,
0.4085099, 1.8315, -0.01307351, 0.003921569, 0, 1, 1,
0.4096713, 0.4683114, 0.8900875, 0.007843138, 0, 1, 1,
0.4105664, -1.883601, 1.498027, 0.01568628, 0, 1, 1,
0.4112576, -0.6157303, 2.719674, 0.01960784, 0, 1, 1,
0.4117389, 1.87527, 0.7400485, 0.02745098, 0, 1, 1,
0.4150642, -1.594359, 2.051195, 0.03137255, 0, 1, 1,
0.4187732, -0.3226181, 2.899219, 0.03921569, 0, 1, 1,
0.4247986, -0.930051, 3.337229, 0.04313726, 0, 1, 1,
0.4284646, -1.386899, 2.635874, 0.05098039, 0, 1, 1,
0.4296618, 0.3102303, 0.570897, 0.05490196, 0, 1, 1,
0.4337906, -0.4528383, 2.371493, 0.0627451, 0, 1, 1,
0.4363831, -0.04763154, 4.841891, 0.06666667, 0, 1, 1,
0.4366039, -0.213647, 0.7833112, 0.07450981, 0, 1, 1,
0.4412251, -0.2478084, 2.740269, 0.07843138, 0, 1, 1,
0.4414634, 0.9004225, -0.4141453, 0.08627451, 0, 1, 1,
0.4424013, 0.7816495, 0.6831552, 0.09019608, 0, 1, 1,
0.4455545, -2.442925, 2.360445, 0.09803922, 0, 1, 1,
0.448828, 0.4590798, 0.3735441, 0.1058824, 0, 1, 1,
0.4520674, 0.7126091, -2.075718, 0.1098039, 0, 1, 1,
0.4550877, 1.55154, -0.9304183, 0.1176471, 0, 1, 1,
0.4552895, 0.8915855, 0.7308526, 0.1215686, 0, 1, 1,
0.4589514, 0.3357381, 0.2300781, 0.1294118, 0, 1, 1,
0.4627238, -0.8571332, 2.976203, 0.1333333, 0, 1, 1,
0.4627539, 1.265582, -0.7102366, 0.1411765, 0, 1, 1,
0.463035, -0.3900422, 2.906601, 0.145098, 0, 1, 1,
0.4650928, 0.93271, 0.2760655, 0.1529412, 0, 1, 1,
0.4657326, 1.070182, 0.4498346, 0.1568628, 0, 1, 1,
0.4665871, -0.80669, 3.028911, 0.1647059, 0, 1, 1,
0.4714042, -0.6379234, 4.394638, 0.1686275, 0, 1, 1,
0.4754174, 0.6148404, 0.9224348, 0.1764706, 0, 1, 1,
0.476752, 0.8450905, -0.1034839, 0.1803922, 0, 1, 1,
0.4780548, 0.1739937, 0.371071, 0.1882353, 0, 1, 1,
0.4835637, -0.4603826, 2.598157, 0.1921569, 0, 1, 1,
0.4895146, -0.455792, 3.878137, 0.2, 0, 1, 1,
0.4929017, 1.579532, 2.471602, 0.2078431, 0, 1, 1,
0.4938749, 0.7615016, -0.8150334, 0.2117647, 0, 1, 1,
0.4991812, -0.03393693, 1.614289, 0.2196078, 0, 1, 1,
0.5010337, 0.8863675, -0.0376476, 0.2235294, 0, 1, 1,
0.5019293, 0.4589628, -0.7414574, 0.2313726, 0, 1, 1,
0.5082474, 0.5942832, -1.202759, 0.2352941, 0, 1, 1,
0.5088118, -0.3003638, 2.899326, 0.2431373, 0, 1, 1,
0.509397, -0.1869965, 0.9542302, 0.2470588, 0, 1, 1,
0.5133403, 1.197134, 1.936803, 0.254902, 0, 1, 1,
0.5169694, 0.9268148, 0.8713049, 0.2588235, 0, 1, 1,
0.5180859, 0.6094995, 0.1594067, 0.2666667, 0, 1, 1,
0.5229735, 0.02655477, 2.579828, 0.2705882, 0, 1, 1,
0.5245368, -0.532986, 1.623446, 0.2784314, 0, 1, 1,
0.5282531, -0.2622153, 1.815095, 0.282353, 0, 1, 1,
0.5323027, -0.7011661, 1.148662, 0.2901961, 0, 1, 1,
0.5324053, -0.008932661, 1.209351, 0.2941177, 0, 1, 1,
0.5328635, 0.3601842, 0.8141739, 0.3019608, 0, 1, 1,
0.5351009, 0.9988604, 1.117674, 0.3098039, 0, 1, 1,
0.5385343, 0.4915754, -0.8408403, 0.3137255, 0, 1, 1,
0.5386046, -1.14624, 1.605981, 0.3215686, 0, 1, 1,
0.5390171, -0.1031839, 1.026725, 0.3254902, 0, 1, 1,
0.5415206, 0.4538035, 1.396544, 0.3333333, 0, 1, 1,
0.5424549, 0.8142676, -0.2906676, 0.3372549, 0, 1, 1,
0.5427941, -0.6955319, 1.085357, 0.345098, 0, 1, 1,
0.5429949, -0.8437993, 2.92062, 0.3490196, 0, 1, 1,
0.5477503, -0.8736934, 2.037074, 0.3568628, 0, 1, 1,
0.5500373, -0.09973605, 1.27655, 0.3607843, 0, 1, 1,
0.5571089, 0.9916043, 1.57527, 0.3686275, 0, 1, 1,
0.5715039, -0.2865812, 0.549641, 0.372549, 0, 1, 1,
0.5732334, -0.1419941, 1.820262, 0.3803922, 0, 1, 1,
0.5735275, -0.7800301, 0.9529737, 0.3843137, 0, 1, 1,
0.5765573, -0.1571826, 0.6680946, 0.3921569, 0, 1, 1,
0.5800171, -0.8003115, 3.700723, 0.3960784, 0, 1, 1,
0.5895836, 2.299474, -0.7539397, 0.4039216, 0, 1, 1,
0.5896131, 0.8290963, 0.2522347, 0.4117647, 0, 1, 1,
0.5921375, 0.995644, -1.062489, 0.4156863, 0, 1, 1,
0.593661, -0.3065296, 3.685209, 0.4235294, 0, 1, 1,
0.6027603, 0.6716179, 1.468389, 0.427451, 0, 1, 1,
0.6053568, -0.04848684, 1.537753, 0.4352941, 0, 1, 1,
0.606409, 0.6740185, 1.802581, 0.4392157, 0, 1, 1,
0.6104977, 1.178474, 0.2624135, 0.4470588, 0, 1, 1,
0.6130205, 0.03445226, 1.621346, 0.4509804, 0, 1, 1,
0.6224425, 0.9655649, 1.348439, 0.4588235, 0, 1, 1,
0.6246032, -0.2884972, 3.017789, 0.4627451, 0, 1, 1,
0.6252975, -0.2251159, 1.498711, 0.4705882, 0, 1, 1,
0.6298594, 0.7174491, 0.8067144, 0.4745098, 0, 1, 1,
0.6299757, -1.137189, 4.427887, 0.4823529, 0, 1, 1,
0.6338236, -0.8179113, 3.384582, 0.4862745, 0, 1, 1,
0.6357596, 1.170298, 1.136179, 0.4941176, 0, 1, 1,
0.6366906, 0.4190178, -0.02248726, 0.5019608, 0, 1, 1,
0.6444517, 0.4215261, 0.9418486, 0.5058824, 0, 1, 1,
0.6449751, 0.3534504, 0.3960516, 0.5137255, 0, 1, 1,
0.6456738, -0.7015426, 2.597037, 0.5176471, 0, 1, 1,
0.6457897, 0.4586565, 0.8073183, 0.5254902, 0, 1, 1,
0.6478599, -1.215528, 4.072497, 0.5294118, 0, 1, 1,
0.6511709, -1.169734, 1.874987, 0.5372549, 0, 1, 1,
0.6593387, 0.2236057, 2.143039, 0.5411765, 0, 1, 1,
0.6625392, 1.499033, 1.592913, 0.5490196, 0, 1, 1,
0.6644908, -0.06042583, 1.359554, 0.5529412, 0, 1, 1,
0.6645223, -1.169449, 1.576872, 0.5607843, 0, 1, 1,
0.664775, -1.594595, 3.801485, 0.5647059, 0, 1, 1,
0.6744266, -0.008340939, 0.9776235, 0.572549, 0, 1, 1,
0.6756686, -0.4999975, 1.59231, 0.5764706, 0, 1, 1,
0.6829128, 0.06964742, 1.559113, 0.5843138, 0, 1, 1,
0.6835137, 0.4287336, 0.6170012, 0.5882353, 0, 1, 1,
0.6845689, 0.6113855, 2.586867, 0.5960785, 0, 1, 1,
0.7015122, 0.4709755, 2.079338, 0.6039216, 0, 1, 1,
0.710489, 0.1844736, 2.634433, 0.6078432, 0, 1, 1,
0.7219716, 0.6850353, 1.259819, 0.6156863, 0, 1, 1,
0.725596, -1.040013, 2.373811, 0.6196079, 0, 1, 1,
0.7291043, -0.2670667, 2.003788, 0.627451, 0, 1, 1,
0.7335835, -0.7260961, 1.107885, 0.6313726, 0, 1, 1,
0.7337003, 0.9024991, 1.219455, 0.6392157, 0, 1, 1,
0.7362289, 0.2764983, 0.3837425, 0.6431373, 0, 1, 1,
0.7375464, -0.2789224, 2.029243, 0.6509804, 0, 1, 1,
0.7630646, -1.376887, 3.095719, 0.654902, 0, 1, 1,
0.7640191, 0.5392932, -0.1587408, 0.6627451, 0, 1, 1,
0.7695674, -0.8025419, 3.124877, 0.6666667, 0, 1, 1,
0.7714214, 2.067161, 1.770442, 0.6745098, 0, 1, 1,
0.7738838, 0.08985255, 1.445853, 0.6784314, 0, 1, 1,
0.7739508, 0.5452038, 2.695834, 0.6862745, 0, 1, 1,
0.7743621, -0.4633946, 0.9494312, 0.6901961, 0, 1, 1,
0.7746119, 0.1916205, 0.1682687, 0.6980392, 0, 1, 1,
0.7766029, 2.096743, -0.01565701, 0.7058824, 0, 1, 1,
0.7820157, 0.04889508, 1.15401, 0.7098039, 0, 1, 1,
0.7832808, -0.2092991, 1.698524, 0.7176471, 0, 1, 1,
0.7890972, -0.943947, 2.517264, 0.7215686, 0, 1, 1,
0.7913028, 0.1242005, 1.364422, 0.7294118, 0, 1, 1,
0.7968085, -0.9674535, 1.267592, 0.7333333, 0, 1, 1,
0.8014154, 0.1766614, 2.296084, 0.7411765, 0, 1, 1,
0.8014454, 0.3127131, 2.024558, 0.7450981, 0, 1, 1,
0.8045152, -1.166817, 2.355412, 0.7529412, 0, 1, 1,
0.8139239, 0.9367509, 0.08263925, 0.7568628, 0, 1, 1,
0.8180259, -0.2269659, 2.980765, 0.7647059, 0, 1, 1,
0.8199688, -0.2613904, 1.911213, 0.7686275, 0, 1, 1,
0.8220435, -1.171155, 1.992031, 0.7764706, 0, 1, 1,
0.8279401, 0.2818868, 1.389694, 0.7803922, 0, 1, 1,
0.8283991, 1.934216, 1.045898, 0.7882353, 0, 1, 1,
0.8289213, -0.969038, 0.3711179, 0.7921569, 0, 1, 1,
0.8332064, 0.198019, 2.178357, 0.8, 0, 1, 1,
0.8449124, -0.2751017, 1.891478, 0.8078431, 0, 1, 1,
0.8515344, -0.7137263, 2.556298, 0.8117647, 0, 1, 1,
0.8516712, -1.12486, 2.221081, 0.8196079, 0, 1, 1,
0.8635066, -0.7082199, 4.663187, 0.8235294, 0, 1, 1,
0.8754336, 0.2757492, 2.477371, 0.8313726, 0, 1, 1,
0.8759623, -0.2531322, 2.506035, 0.8352941, 0, 1, 1,
0.8773973, -0.2919093, 2.729943, 0.8431373, 0, 1, 1,
0.8781709, -0.4841621, 1.794236, 0.8470588, 0, 1, 1,
0.8808027, -1.297468, 1.946177, 0.854902, 0, 1, 1,
0.884693, 1.389903, -0.9037153, 0.8588235, 0, 1, 1,
0.8849146, 0.1751713, 0.04365337, 0.8666667, 0, 1, 1,
0.8854154, -1.21521, 1.610844, 0.8705882, 0, 1, 1,
0.8865778, -0.3605749, 2.510035, 0.8784314, 0, 1, 1,
0.8976833, 0.2700538, 0.7202523, 0.8823529, 0, 1, 1,
0.9034362, 0.3072588, 2.68257, 0.8901961, 0, 1, 1,
0.90428, -0.112499, 0.8995718, 0.8941177, 0, 1, 1,
0.9049339, 1.263016, -0.9905022, 0.9019608, 0, 1, 1,
0.9104722, -0.1676074, 1.662455, 0.9098039, 0, 1, 1,
0.9132758, 2.159474, 1.398485, 0.9137255, 0, 1, 1,
0.9181299, 0.2185685, 1.717785, 0.9215686, 0, 1, 1,
0.9266534, -1.273844, 2.645811, 0.9254902, 0, 1, 1,
0.9312144, 2.08337, -1.423362, 0.9333333, 0, 1, 1,
0.9322118, -0.4206118, 0.6428602, 0.9372549, 0, 1, 1,
0.936115, 0.9268157, 1.392865, 0.945098, 0, 1, 1,
0.9372488, 0.8309475, 2.225101, 0.9490196, 0, 1, 1,
0.9380471, -0.3692285, 2.434732, 0.9568627, 0, 1, 1,
0.9434441, -0.3735985, 1.205003, 0.9607843, 0, 1, 1,
0.9435763, 1.068963, -1.482798, 0.9686275, 0, 1, 1,
0.948651, 1.255882, -0.6162786, 0.972549, 0, 1, 1,
0.9567623, 0.08106998, 0.3990833, 0.9803922, 0, 1, 1,
0.9582882, -1.043912, 1.711123, 0.9843137, 0, 1, 1,
0.9584129, 1.017744, 0.8652481, 0.9921569, 0, 1, 1,
0.9616323, -0.04081215, 1.141287, 0.9960784, 0, 1, 1,
0.9644465, -0.01453429, 3.70093, 1, 0, 0.9960784, 1,
0.9659023, 0.1731001, -0.1742004, 1, 0, 0.9882353, 1,
0.9683414, 1.638276, -1.025535, 1, 0, 0.9843137, 1,
0.9703063, 0.5131936, 3.682412, 1, 0, 0.9764706, 1,
0.9858262, 0.5070468, 0.4375899, 1, 0, 0.972549, 1,
0.9872689, 0.8083748, 0.4604118, 1, 0, 0.9647059, 1,
0.9881495, -0.08561295, 1.484097, 1, 0, 0.9607843, 1,
0.9932265, 1.911932, 1.422701, 1, 0, 0.9529412, 1,
0.9947417, -2.049159, 2.383802, 1, 0, 0.9490196, 1,
0.9984093, 1.342535, 0.05375647, 1, 0, 0.9411765, 1,
0.9990473, -0.4128871, 2.630514, 1, 0, 0.9372549, 1,
1.004134, -0.5232795, 1.285328, 1, 0, 0.9294118, 1,
1.007229, -0.9191902, 3.071316, 1, 0, 0.9254902, 1,
1.00816, -1.446822, 4.004923, 1, 0, 0.9176471, 1,
1.009515, -0.04800392, 1.438703, 1, 0, 0.9137255, 1,
1.021219, -1.620216, 3.392592, 1, 0, 0.9058824, 1,
1.026331, 0.657133, 0.8803572, 1, 0, 0.9019608, 1,
1.034252, -0.4645973, 0.6332956, 1, 0, 0.8941177, 1,
1.04316, -0.3432413, 1.752201, 1, 0, 0.8862745, 1,
1.04699, 0.416561, -0.8828995, 1, 0, 0.8823529, 1,
1.049606, -0.7971351, 1.671903, 1, 0, 0.8745098, 1,
1.053614, -0.4143954, 1.88633, 1, 0, 0.8705882, 1,
1.053992, -1.006833, 2.455846, 1, 0, 0.8627451, 1,
1.062251, -0.7009649, 2.062275, 1, 0, 0.8588235, 1,
1.064626, -0.6888374, 0.7381925, 1, 0, 0.8509804, 1,
1.065196, -0.7819893, 1.502619, 1, 0, 0.8470588, 1,
1.067928, 0.1998728, 0.01721419, 1, 0, 0.8392157, 1,
1.070904, 0.4108369, 1.128875, 1, 0, 0.8352941, 1,
1.071761, -0.807422, 3.112343, 1, 0, 0.827451, 1,
1.077561, 0.1579805, 1.34124, 1, 0, 0.8235294, 1,
1.083161, -0.1934235, 0.5264503, 1, 0, 0.8156863, 1,
1.092408, 0.6018849, 1.081979, 1, 0, 0.8117647, 1,
1.096095, -0.6301353, 1.450144, 1, 0, 0.8039216, 1,
1.102214, -1.004626, 3.303251, 1, 0, 0.7960784, 1,
1.104208, 0.4680294, 1.740183, 1, 0, 0.7921569, 1,
1.107245, 0.2125213, -0.2434282, 1, 0, 0.7843137, 1,
1.109901, 1.316779, 1.143708, 1, 0, 0.7803922, 1,
1.131276, 0.01266728, 2.03725, 1, 0, 0.772549, 1,
1.143386, -1.553227, 3.741836, 1, 0, 0.7686275, 1,
1.144222, -0.8308291, 2.101745, 1, 0, 0.7607843, 1,
1.144513, -0.3485672, 2.876004, 1, 0, 0.7568628, 1,
1.146919, 1.310333, -0.1488608, 1, 0, 0.7490196, 1,
1.149008, 0.2786365, 1.987287, 1, 0, 0.7450981, 1,
1.158874, 0.2856353, 1.772516, 1, 0, 0.7372549, 1,
1.159481, -0.7366872, 3.617828, 1, 0, 0.7333333, 1,
1.164605, -0.3746155, 1.648229, 1, 0, 0.7254902, 1,
1.16717, -1.413824, 0.5085669, 1, 0, 0.7215686, 1,
1.170593, -0.232633, 0.9824114, 1, 0, 0.7137255, 1,
1.17239, -1.308274, 1.382907, 1, 0, 0.7098039, 1,
1.177466, -0.1377003, 1.798307, 1, 0, 0.7019608, 1,
1.188368, -0.1963376, 1.048678, 1, 0, 0.6941177, 1,
1.190845, 0.06349774, 2.93525, 1, 0, 0.6901961, 1,
1.197592, -0.4895574, 2.151519, 1, 0, 0.682353, 1,
1.222892, 0.07842742, 0.3703303, 1, 0, 0.6784314, 1,
1.223016, 0.6298993, 0.6576746, 1, 0, 0.6705883, 1,
1.235874, -1.182169, 2.520524, 1, 0, 0.6666667, 1,
1.263611, -0.8356745, 0.2034182, 1, 0, 0.6588235, 1,
1.268101, -0.5526033, 3.114161, 1, 0, 0.654902, 1,
1.270795, -0.3273175, 0.4619322, 1, 0, 0.6470588, 1,
1.278179, 1.152799, 2.274983, 1, 0, 0.6431373, 1,
1.291424, 0.7043939, -1.783338, 1, 0, 0.6352941, 1,
1.295757, -0.3875306, 1.702294, 1, 0, 0.6313726, 1,
1.298019, 0.03775508, 1.957924, 1, 0, 0.6235294, 1,
1.301241, -0.6318151, 3.361501, 1, 0, 0.6196079, 1,
1.302462, -0.5010359, 1.777598, 1, 0, 0.6117647, 1,
1.305663, -0.02218897, 2.490339, 1, 0, 0.6078432, 1,
1.309677, 0.1201611, 0.4855766, 1, 0, 0.6, 1,
1.314164, -1.103209, 3.351552, 1, 0, 0.5921569, 1,
1.318423, 0.5207615, 2.329915, 1, 0, 0.5882353, 1,
1.324001, 0.3957466, 1.512815, 1, 0, 0.5803922, 1,
1.332971, 0.6393383, 0.8971654, 1, 0, 0.5764706, 1,
1.334886, -0.2160052, 1.86312, 1, 0, 0.5686275, 1,
1.348571, 0.1742549, 1.180213, 1, 0, 0.5647059, 1,
1.351898, 0.3346701, 0.6630375, 1, 0, 0.5568628, 1,
1.362048, 0.4409594, 0.1764199, 1, 0, 0.5529412, 1,
1.370156, 0.312988, 1.5464, 1, 0, 0.5450981, 1,
1.378847, -0.7781676, 3.329358, 1, 0, 0.5411765, 1,
1.379315, 0.1933815, 1.647436, 1, 0, 0.5333334, 1,
1.381122, 1.269849, 0.3074115, 1, 0, 0.5294118, 1,
1.392962, -0.8945425, 1.63384, 1, 0, 0.5215687, 1,
1.40882, 0.07276475, 0.7469149, 1, 0, 0.5176471, 1,
1.415962, 1.160794, -1.769549, 1, 0, 0.509804, 1,
1.440978, 0.1987901, 3.453479, 1, 0, 0.5058824, 1,
1.441404, -0.9246061, 2.88063, 1, 0, 0.4980392, 1,
1.443463, -0.7371455, 2.199224, 1, 0, 0.4901961, 1,
1.447473, -1.591083, 1.736556, 1, 0, 0.4862745, 1,
1.448727, -0.1829414, 0.5704293, 1, 0, 0.4784314, 1,
1.456269, -1.470135, 2.915866, 1, 0, 0.4745098, 1,
1.458023, 0.06039894, 2.02601, 1, 0, 0.4666667, 1,
1.461699, -3.290442, 2.513729, 1, 0, 0.4627451, 1,
1.475341, -0.5190269, -0.5123991, 1, 0, 0.454902, 1,
1.48232, -0.05249849, 0.6850387, 1, 0, 0.4509804, 1,
1.482474, -1.322786, 2.2245, 1, 0, 0.4431373, 1,
1.504599, -0.1489296, 0.990877, 1, 0, 0.4392157, 1,
1.51015, -0.5084182, 0.7345872, 1, 0, 0.4313726, 1,
1.516873, -0.6692885, 1.111733, 1, 0, 0.427451, 1,
1.527429, 0.7057548, 1.458889, 1, 0, 0.4196078, 1,
1.528382, -1.07945, 2.063313, 1, 0, 0.4156863, 1,
1.532854, -0.4763338, 1.582987, 1, 0, 0.4078431, 1,
1.545899, 0.2607792, -0.1044726, 1, 0, 0.4039216, 1,
1.546604, -1.526644, 3.038507, 1, 0, 0.3960784, 1,
1.55505, 0.1157543, 3.075988, 1, 0, 0.3882353, 1,
1.567388, 1.08907, 2.558401, 1, 0, 0.3843137, 1,
1.589437, -0.4279332, 2.491983, 1, 0, 0.3764706, 1,
1.59064, 0.7605265, -0.101642, 1, 0, 0.372549, 1,
1.598508, -1.323202, 2.527499, 1, 0, 0.3647059, 1,
1.598978, -0.007746111, -0.9050856, 1, 0, 0.3607843, 1,
1.602103, -0.3867806, 0.1714568, 1, 0, 0.3529412, 1,
1.602584, 0.7373062, 1.565161, 1, 0, 0.3490196, 1,
1.606506, -0.2489882, 1.380365, 1, 0, 0.3411765, 1,
1.607291, -0.03707308, 1.725102, 1, 0, 0.3372549, 1,
1.611547, -0.9648198, 2.75239, 1, 0, 0.3294118, 1,
1.615002, 0.3187572, 0.7891498, 1, 0, 0.3254902, 1,
1.621325, 1.309581, 0.566078, 1, 0, 0.3176471, 1,
1.632439, 1.597571, 1.303319, 1, 0, 0.3137255, 1,
1.632816, -1.432538, 1.112963, 1, 0, 0.3058824, 1,
1.633572, 0.9589664, -0.2504915, 1, 0, 0.2980392, 1,
1.643203, -0.4740318, -0.1441717, 1, 0, 0.2941177, 1,
1.644146, 0.5323442, 0.1950286, 1, 0, 0.2862745, 1,
1.646615, -0.2309316, 0.006797356, 1, 0, 0.282353, 1,
1.653856, 0.1495544, 0.2050095, 1, 0, 0.2745098, 1,
1.672781, -1.080625, 3.582073, 1, 0, 0.2705882, 1,
1.674249, 0.4806635, 0.7536406, 1, 0, 0.2627451, 1,
1.706764, 0.04284091, 2.034809, 1, 0, 0.2588235, 1,
1.709658, 0.7632392, 0.2910171, 1, 0, 0.2509804, 1,
1.726144, -0.5764827, 1.870896, 1, 0, 0.2470588, 1,
1.736744, -0.3551072, 1.723811, 1, 0, 0.2392157, 1,
1.738134, -0.3688093, 0.329682, 1, 0, 0.2352941, 1,
1.74496, 0.5258231, 1.705299, 1, 0, 0.227451, 1,
1.759526, -0.3825273, 3.253794, 1, 0, 0.2235294, 1,
1.770228, 0.5983044, 0.03410246, 1, 0, 0.2156863, 1,
1.78564, 0.4991503, 3.374576, 1, 0, 0.2117647, 1,
1.808378, -0.3076233, 1.592499, 1, 0, 0.2039216, 1,
1.813535, -0.6805152, 1.801421, 1, 0, 0.1960784, 1,
1.81677, -0.4650659, 2.272981, 1, 0, 0.1921569, 1,
1.818771, 0.0711755, 2.526731, 1, 0, 0.1843137, 1,
1.849781, 0.8522517, 2.86554, 1, 0, 0.1803922, 1,
1.855867, 1.328421, 1.730026, 1, 0, 0.172549, 1,
1.881787, 0.5506709, -0.2855965, 1, 0, 0.1686275, 1,
1.903654, -0.8080313, 2.813181, 1, 0, 0.1607843, 1,
1.928375, 1.29595, 1.387233, 1, 0, 0.1568628, 1,
1.961881, -0.2428533, 2.394862, 1, 0, 0.1490196, 1,
1.967208, 0.4541404, 0.2560481, 1, 0, 0.145098, 1,
1.992856, -0.4264959, 1.079696, 1, 0, 0.1372549, 1,
2.07281, -0.3100807, 3.349583, 1, 0, 0.1333333, 1,
2.080416, -2.584354, 3.1697, 1, 0, 0.1254902, 1,
2.094522, -1.914845, 2.591726, 1, 0, 0.1215686, 1,
2.105744, -0.9786634, 1.524917, 1, 0, 0.1137255, 1,
2.151846, 1.363936, 1.254369, 1, 0, 0.1098039, 1,
2.169222, 0.1303467, 0.1914935, 1, 0, 0.1019608, 1,
2.175291, -0.2346853, 0.5689405, 1, 0, 0.09411765, 1,
2.209257, -0.2547041, 2.676977, 1, 0, 0.09019608, 1,
2.209559, -1.454818, 2.30829, 1, 0, 0.08235294, 1,
2.267006, 1.522856, -0.7037465, 1, 0, 0.07843138, 1,
2.289675, -0.02356959, 1.840954, 1, 0, 0.07058824, 1,
2.301314, 0.4187531, 2.706312, 1, 0, 0.06666667, 1,
2.321014, 0.7236348, 2.072393, 1, 0, 0.05882353, 1,
2.34522, -0.9393617, 3.125131, 1, 0, 0.05490196, 1,
2.389553, 0.375729, 1.350043, 1, 0, 0.04705882, 1,
2.422826, 0.5184957, 2.141544, 1, 0, 0.04313726, 1,
2.496019, -0.5213919, 1.538763, 1, 0, 0.03529412, 1,
2.672071, 1.237607, 2.356605, 1, 0, 0.03137255, 1,
2.922056, -0.2216882, 2.811579, 1, 0, 0.02352941, 1,
3.083719, 0.9811659, 1.127887, 1, 0, 0.01960784, 1,
3.291852, 1.077582, 0.835456, 1, 0, 0.01176471, 1,
3.320599, -0.3785566, 1.166452, 1, 0, 0.007843138, 1
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
-0.1005112, -4.3116, -6.936671, 0, -0.5, 0.5, 0.5,
-0.1005112, -4.3116, -6.936671, 1, -0.5, 0.5, 0.5,
-0.1005112, -4.3116, -6.936671, 1, 1.5, 0.5, 0.5,
-0.1005112, -4.3116, -6.936671, 0, 1.5, 0.5, 0.5
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
-4.681377, -0.2781786, -6.936671, 0, -0.5, 0.5, 0.5,
-4.681377, -0.2781786, -6.936671, 1, -0.5, 0.5, 0.5,
-4.681377, -0.2781786, -6.936671, 1, 1.5, 0.5, 0.5,
-4.681377, -0.2781786, -6.936671, 0, 1.5, 0.5, 0.5
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
-4.681377, -4.3116, -0.1938348, 0, -0.5, 0.5, 0.5,
-4.681377, -4.3116, -0.1938348, 1, -0.5, 0.5, 0.5,
-4.681377, -4.3116, -0.1938348, 1, 1.5, 0.5, 0.5,
-4.681377, -4.3116, -0.1938348, 0, 1.5, 0.5, 0.5
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
-3, -3.38081, -5.380632,
3, -3.38081, -5.380632,
-3, -3.38081, -5.380632,
-3, -3.535942, -5.639972,
-2, -3.38081, -5.380632,
-2, -3.535942, -5.639972,
-1, -3.38081, -5.380632,
-1, -3.535942, -5.639972,
0, -3.38081, -5.380632,
0, -3.535942, -5.639972,
1, -3.38081, -5.380632,
1, -3.535942, -5.639972,
2, -3.38081, -5.380632,
2, -3.535942, -5.639972,
3, -3.38081, -5.380632,
3, -3.535942, -5.639972
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
-3, -3.846205, -6.158652, 0, -0.5, 0.5, 0.5,
-3, -3.846205, -6.158652, 1, -0.5, 0.5, 0.5,
-3, -3.846205, -6.158652, 1, 1.5, 0.5, 0.5,
-3, -3.846205, -6.158652, 0, 1.5, 0.5, 0.5,
-2, -3.846205, -6.158652, 0, -0.5, 0.5, 0.5,
-2, -3.846205, -6.158652, 1, -0.5, 0.5, 0.5,
-2, -3.846205, -6.158652, 1, 1.5, 0.5, 0.5,
-2, -3.846205, -6.158652, 0, 1.5, 0.5, 0.5,
-1, -3.846205, -6.158652, 0, -0.5, 0.5, 0.5,
-1, -3.846205, -6.158652, 1, -0.5, 0.5, 0.5,
-1, -3.846205, -6.158652, 1, 1.5, 0.5, 0.5,
-1, -3.846205, -6.158652, 0, 1.5, 0.5, 0.5,
0, -3.846205, -6.158652, 0, -0.5, 0.5, 0.5,
0, -3.846205, -6.158652, 1, -0.5, 0.5, 0.5,
0, -3.846205, -6.158652, 1, 1.5, 0.5, 0.5,
0, -3.846205, -6.158652, 0, 1.5, 0.5, 0.5,
1, -3.846205, -6.158652, 0, -0.5, 0.5, 0.5,
1, -3.846205, -6.158652, 1, -0.5, 0.5, 0.5,
1, -3.846205, -6.158652, 1, 1.5, 0.5, 0.5,
1, -3.846205, -6.158652, 0, 1.5, 0.5, 0.5,
2, -3.846205, -6.158652, 0, -0.5, 0.5, 0.5,
2, -3.846205, -6.158652, 1, -0.5, 0.5, 0.5,
2, -3.846205, -6.158652, 1, 1.5, 0.5, 0.5,
2, -3.846205, -6.158652, 0, 1.5, 0.5, 0.5,
3, -3.846205, -6.158652, 0, -0.5, 0.5, 0.5,
3, -3.846205, -6.158652, 1, -0.5, 0.5, 0.5,
3, -3.846205, -6.158652, 1, 1.5, 0.5, 0.5,
3, -3.846205, -6.158652, 0, 1.5, 0.5, 0.5
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
-3.624254, -3, -5.380632,
-3.624254, 2, -5.380632,
-3.624254, -3, -5.380632,
-3.800442, -3, -5.639972,
-3.624254, -2, -5.380632,
-3.800442, -2, -5.639972,
-3.624254, -1, -5.380632,
-3.800442, -1, -5.639972,
-3.624254, 0, -5.380632,
-3.800442, 0, -5.639972,
-3.624254, 1, -5.380632,
-3.800442, 1, -5.639972,
-3.624254, 2, -5.380632,
-3.800442, 2, -5.639972
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
-4.152816, -3, -6.158652, 0, -0.5, 0.5, 0.5,
-4.152816, -3, -6.158652, 1, -0.5, 0.5, 0.5,
-4.152816, -3, -6.158652, 1, 1.5, 0.5, 0.5,
-4.152816, -3, -6.158652, 0, 1.5, 0.5, 0.5,
-4.152816, -2, -6.158652, 0, -0.5, 0.5, 0.5,
-4.152816, -2, -6.158652, 1, -0.5, 0.5, 0.5,
-4.152816, -2, -6.158652, 1, 1.5, 0.5, 0.5,
-4.152816, -2, -6.158652, 0, 1.5, 0.5, 0.5,
-4.152816, -1, -6.158652, 0, -0.5, 0.5, 0.5,
-4.152816, -1, -6.158652, 1, -0.5, 0.5, 0.5,
-4.152816, -1, -6.158652, 1, 1.5, 0.5, 0.5,
-4.152816, -1, -6.158652, 0, 1.5, 0.5, 0.5,
-4.152816, 0, -6.158652, 0, -0.5, 0.5, 0.5,
-4.152816, 0, -6.158652, 1, -0.5, 0.5, 0.5,
-4.152816, 0, -6.158652, 1, 1.5, 0.5, 0.5,
-4.152816, 0, -6.158652, 0, 1.5, 0.5, 0.5,
-4.152816, 1, -6.158652, 0, -0.5, 0.5, 0.5,
-4.152816, 1, -6.158652, 1, -0.5, 0.5, 0.5,
-4.152816, 1, -6.158652, 1, 1.5, 0.5, 0.5,
-4.152816, 1, -6.158652, 0, 1.5, 0.5, 0.5,
-4.152816, 2, -6.158652, 0, -0.5, 0.5, 0.5,
-4.152816, 2, -6.158652, 1, -0.5, 0.5, 0.5,
-4.152816, 2, -6.158652, 1, 1.5, 0.5, 0.5,
-4.152816, 2, -6.158652, 0, 1.5, 0.5, 0.5
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
-3.624254, -3.38081, -4,
-3.624254, -3.38081, 4,
-3.624254, -3.38081, -4,
-3.800442, -3.535942, -4,
-3.624254, -3.38081, -2,
-3.800442, -3.535942, -2,
-3.624254, -3.38081, 0,
-3.800442, -3.535942, 0,
-3.624254, -3.38081, 2,
-3.800442, -3.535942, 2,
-3.624254, -3.38081, 4,
-3.800442, -3.535942, 4
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
-4.152816, -3.846205, -4, 0, -0.5, 0.5, 0.5,
-4.152816, -3.846205, -4, 1, -0.5, 0.5, 0.5,
-4.152816, -3.846205, -4, 1, 1.5, 0.5, 0.5,
-4.152816, -3.846205, -4, 0, 1.5, 0.5, 0.5,
-4.152816, -3.846205, -2, 0, -0.5, 0.5, 0.5,
-4.152816, -3.846205, -2, 1, -0.5, 0.5, 0.5,
-4.152816, -3.846205, -2, 1, 1.5, 0.5, 0.5,
-4.152816, -3.846205, -2, 0, 1.5, 0.5, 0.5,
-4.152816, -3.846205, 0, 0, -0.5, 0.5, 0.5,
-4.152816, -3.846205, 0, 1, -0.5, 0.5, 0.5,
-4.152816, -3.846205, 0, 1, 1.5, 0.5, 0.5,
-4.152816, -3.846205, 0, 0, 1.5, 0.5, 0.5,
-4.152816, -3.846205, 2, 0, -0.5, 0.5, 0.5,
-4.152816, -3.846205, 2, 1, -0.5, 0.5, 0.5,
-4.152816, -3.846205, 2, 1, 1.5, 0.5, 0.5,
-4.152816, -3.846205, 2, 0, 1.5, 0.5, 0.5,
-4.152816, -3.846205, 4, 0, -0.5, 0.5, 0.5,
-4.152816, -3.846205, 4, 1, -0.5, 0.5, 0.5,
-4.152816, -3.846205, 4, 1, 1.5, 0.5, 0.5,
-4.152816, -3.846205, 4, 0, 1.5, 0.5, 0.5
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
-3.624254, -3.38081, -5.380632,
-3.624254, 2.824453, -5.380632,
-3.624254, -3.38081, 4.992962,
-3.624254, 2.824453, 4.992962,
-3.624254, -3.38081, -5.380632,
-3.624254, -3.38081, 4.992962,
-3.624254, 2.824453, -5.380632,
-3.624254, 2.824453, 4.992962,
-3.624254, -3.38081, -5.380632,
3.423232, -3.38081, -5.380632,
-3.624254, -3.38081, 4.992962,
3.423232, -3.38081, 4.992962,
-3.624254, 2.824453, -5.380632,
3.423232, 2.824453, -5.380632,
-3.624254, 2.824453, 4.992962,
3.423232, 2.824453, 4.992962,
3.423232, -3.38081, -5.380632,
3.423232, 2.824453, -5.380632,
3.423232, -3.38081, 4.992962,
3.423232, 2.824453, 4.992962,
3.423232, -3.38081, -5.380632,
3.423232, -3.38081, 4.992962,
3.423232, 2.824453, -5.380632,
3.423232, 2.824453, 4.992962
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
var radius = 7.471604;
var distance = 33.24202;
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
mvMatrix.translate( 0.1005112, 0.2781786, 0.1938348 );
mvMatrix.scale( 1.146287, 1.30187, 0.7787508 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.24202);
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
bromofenoxim<-read.table("bromofenoxim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bromofenoxim$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromofenoxim' not found
```

```r
y<-bromofenoxim$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromofenoxim' not found
```

```r
z<-bromofenoxim$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromofenoxim' not found
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
-3.521621, -1.524763, -1.353459, 0, 0, 1, 1, 1,
-3.29306, 1.243644, -0.8106046, 1, 0, 0, 1, 1,
-3.0306, 1.058095, -0.9798883, 1, 0, 0, 1, 1,
-3.009039, -1.400447, -1.62145, 1, 0, 0, 1, 1,
-2.992143, -0.8840227, -1.702829, 1, 0, 0, 1, 1,
-2.765649, -0.6972947, -0.6566148, 1, 0, 0, 1, 1,
-2.638091, -0.1633119, -1.189308, 0, 0, 0, 1, 1,
-2.544112, 0.6965172, -2.074208, 0, 0, 0, 1, 1,
-2.536087, 1.242659, -1.015009, 0, 0, 0, 1, 1,
-2.465842, 0.2627704, -2.195657, 0, 0, 0, 1, 1,
-2.436513, 0.6301574, -2.283859, 0, 0, 0, 1, 1,
-2.399197, 0.4314062, -1.552747, 0, 0, 0, 1, 1,
-2.338731, 1.819291, 0.04494669, 0, 0, 0, 1, 1,
-2.3114, -1.646725, -2.590802, 1, 1, 1, 1, 1,
-2.290997, -1.13395, 0.1973663, 1, 1, 1, 1, 1,
-2.271596, -0.4916694, -1.754891, 1, 1, 1, 1, 1,
-2.263592, 1.362103, -0.5451615, 1, 1, 1, 1, 1,
-2.247436, -1.426044, -1.632569, 1, 1, 1, 1, 1,
-2.242817, 2.541637, -1.138093, 1, 1, 1, 1, 1,
-2.227022, 0.5524057, -0.5591738, 1, 1, 1, 1, 1,
-2.206078, 1.014769, -0.7915479, 1, 1, 1, 1, 1,
-2.147364, 1.274665, -3.186675, 1, 1, 1, 1, 1,
-2.110276, -0.8034363, -1.571052, 1, 1, 1, 1, 1,
-2.0357, -0.3948043, -2.474273, 1, 1, 1, 1, 1,
-2.032001, -2.139596, -2.398007, 1, 1, 1, 1, 1,
-1.995486, -1.547022, -2.107666, 1, 1, 1, 1, 1,
-1.986202, 0.4880253, 0.2400994, 1, 1, 1, 1, 1,
-1.980209, 0.1669962, 1.552051, 1, 1, 1, 1, 1,
-1.945556, -1.953501, -2.249652, 0, 0, 1, 1, 1,
-1.92634, 0.09186359, -0.5168187, 1, 0, 0, 1, 1,
-1.92357, 0.648082, -4.091052, 1, 0, 0, 1, 1,
-1.923551, 0.1636415, -1.555968, 1, 0, 0, 1, 1,
-1.877407, -0.03704277, -3.158671, 1, 0, 0, 1, 1,
-1.871756, 0.3059175, -3.56201, 1, 0, 0, 1, 1,
-1.857046, 1.740402, -1.567708, 0, 0, 0, 1, 1,
-1.854789, -0.4543085, -1.260615, 0, 0, 0, 1, 1,
-1.85225, -0.4449004, -0.788695, 0, 0, 0, 1, 1,
-1.846004, 0.3057041, -1.782646, 0, 0, 0, 1, 1,
-1.806981, 1.918746, -0.580731, 0, 0, 0, 1, 1,
-1.803113, 0.9946139, -1.765555, 0, 0, 0, 1, 1,
-1.783275, 1.119195, -2.245321, 0, 0, 0, 1, 1,
-1.779983, -0.427838, -2.800665, 1, 1, 1, 1, 1,
-1.779661, -0.9084392, -2.862825, 1, 1, 1, 1, 1,
-1.778284, 0.4981202, -1.461157, 1, 1, 1, 1, 1,
-1.773039, 1.337129, -2.663477, 1, 1, 1, 1, 1,
-1.752295, 0.3252364, -1.127029, 1, 1, 1, 1, 1,
-1.715846, 0.01169821, -1.626815, 1, 1, 1, 1, 1,
-1.711097, 0.3192285, -1.764242, 1, 1, 1, 1, 1,
-1.699405, -0.04167333, -1.614326, 1, 1, 1, 1, 1,
-1.680786, 2.031873, -1.450683, 1, 1, 1, 1, 1,
-1.679265, 0.07109886, -1.110445, 1, 1, 1, 1, 1,
-1.678225, 0.8497074, -1.414116, 1, 1, 1, 1, 1,
-1.665422, 1.188154, -0.5644057, 1, 1, 1, 1, 1,
-1.658423, -0.328162, -0.8903369, 1, 1, 1, 1, 1,
-1.651308, -0.6782961, -2.284919, 1, 1, 1, 1, 1,
-1.650748, -0.1894889, -1.709981, 1, 1, 1, 1, 1,
-1.624854, 0.5413887, -2.761292, 0, 0, 1, 1, 1,
-1.620231, -0.6345364, -1.609138, 1, 0, 0, 1, 1,
-1.59923, 1.902421, -0.4766206, 1, 0, 0, 1, 1,
-1.594523, -0.4728792, 0.09984276, 1, 0, 0, 1, 1,
-1.581302, 0.7388406, -0.8080513, 1, 0, 0, 1, 1,
-1.578395, 0.1311863, -1.549761, 1, 0, 0, 1, 1,
-1.570968, 0.1636017, -2.904663, 0, 0, 0, 1, 1,
-1.564868, -0.1696779, -1.580497, 0, 0, 0, 1, 1,
-1.559973, -0.9171923, -4.248814, 0, 0, 0, 1, 1,
-1.5573, 0.1138246, -1.33841, 0, 0, 0, 1, 1,
-1.554728, -1.711629, -1.473948, 0, 0, 0, 1, 1,
-1.548307, -1.01668, -2.604541, 0, 0, 0, 1, 1,
-1.533671, 0.5029449, -0.5980468, 0, 0, 0, 1, 1,
-1.524728, -0.2124045, -1.162164, 1, 1, 1, 1, 1,
-1.524327, -0.02924763, -2.662314, 1, 1, 1, 1, 1,
-1.523602, -1.329522, -1.605274, 1, 1, 1, 1, 1,
-1.520396, -0.6338235, -2.434124, 1, 1, 1, 1, 1,
-1.514083, -0.02073001, -1.695752, 1, 1, 1, 1, 1,
-1.50811, 0.4495468, 0.2245235, 1, 1, 1, 1, 1,
-1.505894, -0.6167402, -2.036007, 1, 1, 1, 1, 1,
-1.492068, -0.813154, -0.8842881, 1, 1, 1, 1, 1,
-1.482339, -0.3309805, -0.8329974, 1, 1, 1, 1, 1,
-1.472541, 1.503318, 0.3446994, 1, 1, 1, 1, 1,
-1.470209, -1.013243, -0.2605669, 1, 1, 1, 1, 1,
-1.468167, -1.115267, -2.501961, 1, 1, 1, 1, 1,
-1.453334, -1.778653, -2.213638, 1, 1, 1, 1, 1,
-1.451124, -0.9987579, -1.480319, 1, 1, 1, 1, 1,
-1.448678, 2.250297, -0.9358057, 1, 1, 1, 1, 1,
-1.443357, 0.30877, -1.945194, 0, 0, 1, 1, 1,
-1.441079, 0.7499126, -1.204459, 1, 0, 0, 1, 1,
-1.430026, 1.492499, -0.1606595, 1, 0, 0, 1, 1,
-1.425448, -0.8710612, -2.422456, 1, 0, 0, 1, 1,
-1.416926, 0.3292761, -0.7661187, 1, 0, 0, 1, 1,
-1.401698, 1.152735, -0.3605695, 1, 0, 0, 1, 1,
-1.401464, -0.01226367, -0.5785859, 0, 0, 0, 1, 1,
-1.398429, 0.1579929, -1.382309, 0, 0, 0, 1, 1,
-1.382326, 1.270414, -0.4454257, 0, 0, 0, 1, 1,
-1.380487, -0.7109433, -2.077516, 0, 0, 0, 1, 1,
-1.373113, 0.5619366, -0.2526945, 0, 0, 0, 1, 1,
-1.371412, 0.6496271, -1.73205, 0, 0, 0, 1, 1,
-1.368302, 1.242797, -1.332476, 0, 0, 0, 1, 1,
-1.366208, -0.1239986, -2.291534, 1, 1, 1, 1, 1,
-1.363843, -0.6210315, -2.082535, 1, 1, 1, 1, 1,
-1.35772, 1.224504, -0.9718685, 1, 1, 1, 1, 1,
-1.353159, -0.7923703, -1.581484, 1, 1, 1, 1, 1,
-1.346822, -1.580398, -2.042583, 1, 1, 1, 1, 1,
-1.342577, 0.5632659, -0.9860979, 1, 1, 1, 1, 1,
-1.341649, 0.5237809, -0.009373849, 1, 1, 1, 1, 1,
-1.331972, -1.405756, -2.843022, 1, 1, 1, 1, 1,
-1.330281, -0.2873466, -0.8399623, 1, 1, 1, 1, 1,
-1.318421, 0.2821726, -2.466511, 1, 1, 1, 1, 1,
-1.314794, 0.4470768, -0.9043878, 1, 1, 1, 1, 1,
-1.313449, 0.9191897, -1.245467, 1, 1, 1, 1, 1,
-1.312754, -0.3042233, -1.49162, 1, 1, 1, 1, 1,
-1.309557, 0.02929933, -1.806235, 1, 1, 1, 1, 1,
-1.299683, 0.8060874, -2.595765, 1, 1, 1, 1, 1,
-1.292918, -1.057283, -2.407911, 0, 0, 1, 1, 1,
-1.28246, -0.5973046, -1.902043, 1, 0, 0, 1, 1,
-1.257739, 0.7606403, -2.539908, 1, 0, 0, 1, 1,
-1.254562, -0.2899464, -1.299048, 1, 0, 0, 1, 1,
-1.250339, -0.3743564, -2.497705, 1, 0, 0, 1, 1,
-1.248281, -1.682694, -3.483075, 1, 0, 0, 1, 1,
-1.248204, -0.1444014, -2.556341, 0, 0, 0, 1, 1,
-1.229793, -0.9525471, -1.331456, 0, 0, 0, 1, 1,
-1.225851, 1.48283, -0.5614694, 0, 0, 0, 1, 1,
-1.224651, 0.1380394, -1.065233, 0, 0, 0, 1, 1,
-1.223363, -0.3337205, -4.607024, 0, 0, 0, 1, 1,
-1.219719, 1.213283, -2.607427, 0, 0, 0, 1, 1,
-1.219551, 0.3829124, -1.032978, 0, 0, 0, 1, 1,
-1.218389, -1.680245, -2.760872, 1, 1, 1, 1, 1,
-1.211139, -0.8348251, -4.29221, 1, 1, 1, 1, 1,
-1.203985, 1.739066, -0.157978, 1, 1, 1, 1, 1,
-1.198238, -1.42188, -0.7938281, 1, 1, 1, 1, 1,
-1.194419, 1.473769, -0.1050152, 1, 1, 1, 1, 1,
-1.192003, 1.747616, -0.006990489, 1, 1, 1, 1, 1,
-1.186146, -2.129155, -2.095791, 1, 1, 1, 1, 1,
-1.163112, -1.359306, -1.374704, 1, 1, 1, 1, 1,
-1.161833, 0.3750606, -1.457909, 1, 1, 1, 1, 1,
-1.161801, 1.251611, -0.5511964, 1, 1, 1, 1, 1,
-1.161545, 0.5331979, -0.4931832, 1, 1, 1, 1, 1,
-1.15911, 0.4890109, -0.4616101, 1, 1, 1, 1, 1,
-1.141549, -0.01561152, -0.4035504, 1, 1, 1, 1, 1,
-1.139657, 2.356004, -0.8765535, 1, 1, 1, 1, 1,
-1.139267, -0.3228128, -1.161473, 1, 1, 1, 1, 1,
-1.137039, -0.3863823, -3.081487, 0, 0, 1, 1, 1,
-1.11695, -0.1021545, -2.315315, 1, 0, 0, 1, 1,
-1.112435, 0.8421912, -0.2686852, 1, 0, 0, 1, 1,
-1.112394, -0.01914865, -1.612606, 1, 0, 0, 1, 1,
-1.104746, 0.647385, -0.3678212, 1, 0, 0, 1, 1,
-1.101941, -1.000783, -2.701161, 1, 0, 0, 1, 1,
-1.09966, 1.264544, -1.459026, 0, 0, 0, 1, 1,
-1.096687, -1.078792, -3.664756, 0, 0, 0, 1, 1,
-1.091698, -0.3751486, -3.978802, 0, 0, 0, 1, 1,
-1.089666, 1.116495, -2.365112, 0, 0, 0, 1, 1,
-1.08231, -1.016038, -2.71676, 0, 0, 0, 1, 1,
-1.070849, 1.279546, -0.9359109, 0, 0, 0, 1, 1,
-1.070393, -2.410569, -3.756158, 0, 0, 0, 1, 1,
-1.052943, 0.0992336, -0.1706005, 1, 1, 1, 1, 1,
-1.051284, 0.7694818, -1.163538, 1, 1, 1, 1, 1,
-1.048533, 1.810573, -1.21112, 1, 1, 1, 1, 1,
-1.043998, 0.6710368, -0.972975, 1, 1, 1, 1, 1,
-1.03585, 0.02528648, -0.5538074, 1, 1, 1, 1, 1,
-1.034395, -1.05842, -3.45489, 1, 1, 1, 1, 1,
-1.028413, -0.8733471, -1.860585, 1, 1, 1, 1, 1,
-1.026735, -0.03662452, 0.1200636, 1, 1, 1, 1, 1,
-1.021132, -0.1453238, -2.076492, 1, 1, 1, 1, 1,
-1.020457, -0.3687071, -1.853478, 1, 1, 1, 1, 1,
-1.016849, -0.008089915, -1.223568, 1, 1, 1, 1, 1,
-1.016076, 1.768611, -0.3190809, 1, 1, 1, 1, 1,
-1.012446, 0.816955, 0.6287368, 1, 1, 1, 1, 1,
-1.011007, 1.399425, 0.2056383, 1, 1, 1, 1, 1,
-1.007277, -0.3847605, -1.802654, 1, 1, 1, 1, 1,
-1.005616, 0.9905815, -0.8084515, 0, 0, 1, 1, 1,
-1.000813, -1.079131, -2.684794, 1, 0, 0, 1, 1,
-0.9931073, 0.4521106, -1.707961, 1, 0, 0, 1, 1,
-0.9888903, 0.8553284, -2.916689, 1, 0, 0, 1, 1,
-0.9884457, -0.2904498, -1.666519, 1, 0, 0, 1, 1,
-0.977017, 0.04222538, -1.60452, 1, 0, 0, 1, 1,
-0.9532651, -0.5641893, -2.465154, 0, 0, 0, 1, 1,
-0.9506373, -0.06404413, -2.933588, 0, 0, 0, 1, 1,
-0.9430268, -0.8907943, -0.6710834, 0, 0, 0, 1, 1,
-0.9426067, -1.569467, -2.316133, 0, 0, 0, 1, 1,
-0.933094, 0.8981969, -1.505596, 0, 0, 0, 1, 1,
-0.9324816, 0.6919881, -1.661513, 0, 0, 0, 1, 1,
-0.928822, -0.1321511, -1.06785, 0, 0, 0, 1, 1,
-0.928661, 2.382484, 0.6769516, 1, 1, 1, 1, 1,
-0.9245315, 0.6590322, -0.9059555, 1, 1, 1, 1, 1,
-0.9231753, -0.1338005, -3.381852, 1, 1, 1, 1, 1,
-0.9210031, 0.8593479, -0.1275457, 1, 1, 1, 1, 1,
-0.903385, 1.853397, 0.3010061, 1, 1, 1, 1, 1,
-0.90058, 2.068817, -1.290744, 1, 1, 1, 1, 1,
-0.8929718, -2.026343, -3.45565, 1, 1, 1, 1, 1,
-0.8869069, -0.7698855, -1.638653, 1, 1, 1, 1, 1,
-0.8833181, -1.005731, -3.154033, 1, 1, 1, 1, 1,
-0.8803778, 0.8013537, -1.751669, 1, 1, 1, 1, 1,
-0.8795331, -0.9706258, -2.74558, 1, 1, 1, 1, 1,
-0.8792471, 0.3917286, -3.092618, 1, 1, 1, 1, 1,
-0.8786936, -1.251347, -1.428128, 1, 1, 1, 1, 1,
-0.8755395, -0.02327364, -2.959301, 1, 1, 1, 1, 1,
-0.8736379, 0.04972963, -1.367274, 1, 1, 1, 1, 1,
-0.873193, 0.6666949, -3.10606, 0, 0, 1, 1, 1,
-0.8717217, -0.3338152, -2.644664, 1, 0, 0, 1, 1,
-0.8657413, 0.08838134, -1.91019, 1, 0, 0, 1, 1,
-0.8649904, -0.05056155, -1.717324, 1, 0, 0, 1, 1,
-0.8624313, 0.9450294, -1.282329, 1, 0, 0, 1, 1,
-0.85979, -0.4629691, -0.8759089, 1, 0, 0, 1, 1,
-0.8591729, -0.1806689, -0.5326762, 0, 0, 0, 1, 1,
-0.8525985, -0.5178147, -3.633494, 0, 0, 0, 1, 1,
-0.8514093, 0.5177627, -0.1655776, 0, 0, 0, 1, 1,
-0.8494179, -0.2409666, -2.065172, 0, 0, 0, 1, 1,
-0.8481615, -0.229577, -2.050363, 0, 0, 0, 1, 1,
-0.8478519, -0.1290019, -0.5679697, 0, 0, 0, 1, 1,
-0.8456506, -3.216818, -3.858117, 0, 0, 0, 1, 1,
-0.8415434, 1.620934, -1.146739, 1, 1, 1, 1, 1,
-0.8404217, 0.1048342, -3.00455, 1, 1, 1, 1, 1,
-0.839524, -0.3126308, -2.419047, 1, 1, 1, 1, 1,
-0.8366562, -1.331586, -2.201614, 1, 1, 1, 1, 1,
-0.836346, -1.415345, -1.795862, 1, 1, 1, 1, 1,
-0.8344765, -0.6858848, -0.7980949, 1, 1, 1, 1, 1,
-0.833825, 0.3546009, -1.656619, 1, 1, 1, 1, 1,
-0.8249958, 0.6718554, 0.3235352, 1, 1, 1, 1, 1,
-0.8237483, -1.360788, -2.480225, 1, 1, 1, 1, 1,
-0.8212017, -0.06908719, -0.6042495, 1, 1, 1, 1, 1,
-0.8187964, 0.1658906, -0.9546652, 1, 1, 1, 1, 1,
-0.8165916, 0.09202777, -3.174074, 1, 1, 1, 1, 1,
-0.8163192, 1.601776, 1.020767, 1, 1, 1, 1, 1,
-0.8108116, 0.6056005, -2.323215, 1, 1, 1, 1, 1,
-0.8032697, 0.6791747, -1.831337, 1, 1, 1, 1, 1,
-0.7991512, -1.353367, -1.802275, 0, 0, 1, 1, 1,
-0.7932851, 0.3003162, -0.04062739, 1, 0, 0, 1, 1,
-0.7930718, 0.3470774, -1.913946, 1, 0, 0, 1, 1,
-0.7914512, -0.4036092, -1.117852, 1, 0, 0, 1, 1,
-0.7856043, -1.688199, -2.659184, 1, 0, 0, 1, 1,
-0.784465, -1.303599, -1.527483, 1, 0, 0, 1, 1,
-0.7819408, 0.4906312, -0.9357464, 0, 0, 0, 1, 1,
-0.7738907, -0.4713864, -3.126789, 0, 0, 0, 1, 1,
-0.7708673, 1.09801, 0.02384443, 0, 0, 0, 1, 1,
-0.7641904, 0.4704175, -1.395004, 0, 0, 0, 1, 1,
-0.7609803, -1.071541, -2.077594, 0, 0, 0, 1, 1,
-0.7584257, -0.04575182, -0.6514893, 0, 0, 0, 1, 1,
-0.7494313, -1.203625, -3.652635, 0, 0, 0, 1, 1,
-0.7423896, 0.03428187, -0.5969564, 1, 1, 1, 1, 1,
-0.7353853, 2.386436, -0.02357337, 1, 1, 1, 1, 1,
-0.7352325, 0.5558352, 0.490456, 1, 1, 1, 1, 1,
-0.7312838, 1.057223, -0.1996869, 1, 1, 1, 1, 1,
-0.7302488, 2.069733, -1.060802, 1, 1, 1, 1, 1,
-0.7204379, -1.189049, -2.887673, 1, 1, 1, 1, 1,
-0.7194118, -0.6128207, -2.579997, 1, 1, 1, 1, 1,
-0.7154852, -2.186556, -1.645004, 1, 1, 1, 1, 1,
-0.7070614, 1.545524, 0.305243, 1, 1, 1, 1, 1,
-0.7048572, -0.557039, -4.121561, 1, 1, 1, 1, 1,
-0.7005355, -2.185313, -1.612648, 1, 1, 1, 1, 1,
-0.692533, -0.7522296, -2.064753, 1, 1, 1, 1, 1,
-0.6900772, 0.284545, -0.8799416, 1, 1, 1, 1, 1,
-0.6844837, -0.505421, -1.761491, 1, 1, 1, 1, 1,
-0.6768415, -0.0703479, -1.442828, 1, 1, 1, 1, 1,
-0.672999, -0.5398198, -2.025149, 0, 0, 1, 1, 1,
-0.661629, 1.111096, 0.6986997, 1, 0, 0, 1, 1,
-0.661501, -0.6164134, -3.227176, 1, 0, 0, 1, 1,
-0.6586788, 0.06792463, 0.302425, 1, 0, 0, 1, 1,
-0.6535894, -0.7841849, -2.956807, 1, 0, 0, 1, 1,
-0.6466734, 1.418381, -0.7359645, 1, 0, 0, 1, 1,
-0.6403405, 0.2519558, -1.024538, 0, 0, 0, 1, 1,
-0.6384386, 0.1454349, 0.7348654, 0, 0, 0, 1, 1,
-0.636647, 0.02383907, -3.069855, 0, 0, 0, 1, 1,
-0.6357759, 0.1554163, -0.4601575, 0, 0, 0, 1, 1,
-0.6342018, 0.3155515, -0.8687358, 0, 0, 0, 1, 1,
-0.6338139, 0.180711, -1.475431, 0, 0, 0, 1, 1,
-0.6276655, 0.07158773, -1.995625, 0, 0, 0, 1, 1,
-0.6251174, 1.693808, -1.471016, 1, 1, 1, 1, 1,
-0.6196547, 0.1812713, -1.514587, 1, 1, 1, 1, 1,
-0.6164383, -0.1844415, -1.17222, 1, 1, 1, 1, 1,
-0.6122478, 1.024474, -0.6512617, 1, 1, 1, 1, 1,
-0.609954, 1.490645, -1.556886, 1, 1, 1, 1, 1,
-0.6059293, -1.462303, -3.196793, 1, 1, 1, 1, 1,
-0.6041246, -1.338037, -3.182318, 1, 1, 1, 1, 1,
-0.603265, -0.5371016, -2.820929, 1, 1, 1, 1, 1,
-0.602085, 1.328144, -0.8593021, 1, 1, 1, 1, 1,
-0.5984479, -0.06744424, -2.744328, 1, 1, 1, 1, 1,
-0.5981672, 0.4098354, -0.4125135, 1, 1, 1, 1, 1,
-0.5978739, 0.8780402, -0.007923113, 1, 1, 1, 1, 1,
-0.5966712, 0.2925204, -0.1960706, 1, 1, 1, 1, 1,
-0.5938947, -0.6295206, -1.794285, 1, 1, 1, 1, 1,
-0.5920209, -1.215086, -1.632304, 1, 1, 1, 1, 1,
-0.5914533, 1.642918, -0.8036828, 0, 0, 1, 1, 1,
-0.5831004, 0.801455, 0.2050138, 1, 0, 0, 1, 1,
-0.5821658, -0.89613, -1.637799, 1, 0, 0, 1, 1,
-0.5812409, 1.716662, -1.379513, 1, 0, 0, 1, 1,
-0.5787228, -0.1278531, -0.314724, 1, 0, 0, 1, 1,
-0.5764465, 0.7658058, -0.9169415, 1, 0, 0, 1, 1,
-0.5744178, 1.221128, -1.294051, 0, 0, 0, 1, 1,
-0.5720974, -1.494411, -2.861625, 0, 0, 0, 1, 1,
-0.571728, 1.614204, -1.202637, 0, 0, 0, 1, 1,
-0.5621296, -0.1866133, -1.82462, 0, 0, 0, 1, 1,
-0.561957, 0.008849136, -3.041632, 0, 0, 0, 1, 1,
-0.5601458, 0.7165605, -0.7075816, 0, 0, 0, 1, 1,
-0.5580801, 0.09943724, -1.913787, 0, 0, 0, 1, 1,
-0.5552323, 0.3192963, -1.796449, 1, 1, 1, 1, 1,
-0.5469646, 0.3123876, -1.818385, 1, 1, 1, 1, 1,
-0.5388635, 0.8432562, -0.4168618, 1, 1, 1, 1, 1,
-0.5332175, -1.367451, -2.950633, 1, 1, 1, 1, 1,
-0.5312012, 2.387351, -0.1888143, 1, 1, 1, 1, 1,
-0.5301239, 0.1582586, -1.499684, 1, 1, 1, 1, 1,
-0.5221284, 0.06833284, -0.848318, 1, 1, 1, 1, 1,
-0.5208264, 0.4893814, 0.4406613, 1, 1, 1, 1, 1,
-0.5203221, 0.01103426, -1.865997, 1, 1, 1, 1, 1,
-0.5197508, -1.143394, -4.15791, 1, 1, 1, 1, 1,
-0.5171602, 0.3390854, -1.169364, 1, 1, 1, 1, 1,
-0.5150262, -0.1968985, -1.65384, 1, 1, 1, 1, 1,
-0.514246, 0.1918645, -1.349781, 1, 1, 1, 1, 1,
-0.5118254, 1.180436, 0.01075252, 1, 1, 1, 1, 1,
-0.5115959, -0.7336466, -2.341271, 1, 1, 1, 1, 1,
-0.5100237, -1.153913, -3.996546, 0, 0, 1, 1, 1,
-0.5094025, -0.170957, -3.243278, 1, 0, 0, 1, 1,
-0.508624, -0.8675407, -2.247272, 1, 0, 0, 1, 1,
-0.5057009, -0.9289697, -2.750591, 1, 0, 0, 1, 1,
-0.5037008, 0.7853087, -0.4512528, 1, 0, 0, 1, 1,
-0.5031894, -0.7477644, -3.017622, 1, 0, 0, 1, 1,
-0.4953878, 1.278552, -0.2866068, 0, 0, 0, 1, 1,
-0.4920712, 0.1649619, -1.286642, 0, 0, 0, 1, 1,
-0.4908977, -0.8402516, -0.9618456, 0, 0, 0, 1, 1,
-0.4902129, -0.7422834, -4.559004, 0, 0, 0, 1, 1,
-0.4889321, -0.4959886, -1.918469, 0, 0, 0, 1, 1,
-0.4866104, -1.293578, -1.252308, 0, 0, 0, 1, 1,
-0.4836661, 1.480167, -2.744972, 0, 0, 0, 1, 1,
-0.4823749, 1.06153, -0.5793918, 1, 1, 1, 1, 1,
-0.4781838, -1.047739, -1.955962, 1, 1, 1, 1, 1,
-0.4773555, 0.8995844, -0.6311044, 1, 1, 1, 1, 1,
-0.4711741, -0.7114671, -1.787124, 1, 1, 1, 1, 1,
-0.4705863, 1.319108, -0.1177584, 1, 1, 1, 1, 1,
-0.4674558, -0.4828764, -0.9985119, 1, 1, 1, 1, 1,
-0.4660325, 0.002097192, -2.369634, 1, 1, 1, 1, 1,
-0.4609483, -1.719768, -2.84079, 1, 1, 1, 1, 1,
-0.4606717, 0.9641554, 0.6789702, 1, 1, 1, 1, 1,
-0.459306, -0.6127235, -3.330929, 1, 1, 1, 1, 1,
-0.4591134, 0.3363287, -0.6514205, 1, 1, 1, 1, 1,
-0.4577053, -0.5359595, -1.05468, 1, 1, 1, 1, 1,
-0.4570316, 0.3450304, -2.293641, 1, 1, 1, 1, 1,
-0.4558962, -0.814366, -3.042041, 1, 1, 1, 1, 1,
-0.4532797, 0.02220178, -2.758244, 1, 1, 1, 1, 1,
-0.4502428, 0.7973408, 1.138828, 0, 0, 1, 1, 1,
-0.4464885, 1.660631, -0.6596316, 1, 0, 0, 1, 1,
-0.443524, -0.4439706, -2.17251, 1, 0, 0, 1, 1,
-0.4416472, -0.5915167, -2.823261, 1, 0, 0, 1, 1,
-0.4373455, 0.3508636, -0.2233955, 1, 0, 0, 1, 1,
-0.4364927, 0.536365, -0.8352782, 1, 0, 0, 1, 1,
-0.434238, -1.414585, -2.014531, 0, 0, 0, 1, 1,
-0.4324815, -1.745023, -2.471896, 0, 0, 0, 1, 1,
-0.43209, -1.010047, -2.003196, 0, 0, 0, 1, 1,
-0.4304765, 2.653405, -1.193939, 0, 0, 0, 1, 1,
-0.4300087, -0.3224097, -2.167049, 0, 0, 0, 1, 1,
-0.4280445, -0.5538915, -4.781036, 0, 0, 0, 1, 1,
-0.4250043, -1.056955, -4.668972, 0, 0, 0, 1, 1,
-0.4210036, -0.3708881, -2.082023, 1, 1, 1, 1, 1,
-0.4202022, 0.3763982, 0.1553295, 1, 1, 1, 1, 1,
-0.4187568, 1.340557, -0.4778872, 1, 1, 1, 1, 1,
-0.4165529, -0.1531488, -3.489786, 1, 1, 1, 1, 1,
-0.416375, -1.475087, -3.847719, 1, 1, 1, 1, 1,
-0.4158381, -0.9106326, -3.431246, 1, 1, 1, 1, 1,
-0.4113416, 1.083894, -0.4261667, 1, 1, 1, 1, 1,
-0.4101632, 0.2642661, -0.328797, 1, 1, 1, 1, 1,
-0.4089238, -1.055025, -2.621791, 1, 1, 1, 1, 1,
-0.408852, -0.9328634, -2.39842, 1, 1, 1, 1, 1,
-0.4045612, -0.3033608, -2.652279, 1, 1, 1, 1, 1,
-0.4019471, 0.5614067, 0.04348606, 1, 1, 1, 1, 1,
-0.4012641, -0.3940872, -2.74194, 1, 1, 1, 1, 1,
-0.4010553, -1.407946, -2.619508, 1, 1, 1, 1, 1,
-0.4000621, 0.05199333, -2.190528, 1, 1, 1, 1, 1,
-0.3991168, 0.2567527, -0.5876306, 0, 0, 1, 1, 1,
-0.3987498, -0.06011876, -2.065174, 1, 0, 0, 1, 1,
-0.3963228, 0.01759879, -0.04576639, 1, 0, 0, 1, 1,
-0.3934443, 0.1683112, -2.304359, 1, 0, 0, 1, 1,
-0.3897748, 2.186704, 0.5371971, 1, 0, 0, 1, 1,
-0.3880132, -0.1447301, 0.2347464, 1, 0, 0, 1, 1,
-0.3862678, 1.597267, 2.048306, 0, 0, 0, 1, 1,
-0.3737169, -0.3063928, -1.711798, 0, 0, 0, 1, 1,
-0.3729598, 0.7794533, 0.1083342, 0, 0, 0, 1, 1,
-0.3695821, -1.20983, -1.463735, 0, 0, 0, 1, 1,
-0.3683858, 0.4763161, -2.45143, 0, 0, 0, 1, 1,
-0.3657541, 1.335532, 0.6200647, 0, 0, 0, 1, 1,
-0.3635831, 2.695845, 0.5032861, 0, 0, 0, 1, 1,
-0.3614833, 1.148772, 0.4226381, 1, 1, 1, 1, 1,
-0.3562427, 0.8332371, -0.6210996, 1, 1, 1, 1, 1,
-0.3503865, 2.734085, -2.405892, 1, 1, 1, 1, 1,
-0.3492433, -0.4720709, -2.79016, 1, 1, 1, 1, 1,
-0.3488729, 0.6322503, 0.4545686, 1, 1, 1, 1, 1,
-0.3448414, -0.2872438, -1.38811, 1, 1, 1, 1, 1,
-0.344743, -0.1673483, -2.329035, 1, 1, 1, 1, 1,
-0.3427068, -0.8633793, -1.158243, 1, 1, 1, 1, 1,
-0.3421742, -1.319636, -3.300269, 1, 1, 1, 1, 1,
-0.3419663, -0.3184191, -3.0562, 1, 1, 1, 1, 1,
-0.3343678, 1.827142, -0.1630304, 1, 1, 1, 1, 1,
-0.330765, -0.2569072, -2.387362, 1, 1, 1, 1, 1,
-0.3296846, 1.349952, -1.567642, 1, 1, 1, 1, 1,
-0.3276108, 2.121204, 0.343776, 1, 1, 1, 1, 1,
-0.324878, 1.028822, 0.4737005, 1, 1, 1, 1, 1,
-0.3236618, 0.2550022, -2.253627, 0, 0, 1, 1, 1,
-0.3227706, 0.2746823, -1.313375, 1, 0, 0, 1, 1,
-0.3162377, 0.2882479, -1.534863, 1, 0, 0, 1, 1,
-0.3144855, 1.202774, 0.4533006, 1, 0, 0, 1, 1,
-0.3102785, 0.4152594, -0.4075893, 1, 0, 0, 1, 1,
-0.3087414, -0.3681861, -2.589095, 1, 0, 0, 1, 1,
-0.3072254, -1.028387, -3.016731, 0, 0, 0, 1, 1,
-0.3057656, -0.6057252, -1.254048, 0, 0, 0, 1, 1,
-0.3024967, -0.7583709, -2.383306, 0, 0, 0, 1, 1,
-0.3020457, 1.788266, -2.359409, 0, 0, 0, 1, 1,
-0.3020299, -0.3406716, -4.250578, 0, 0, 0, 1, 1,
-0.3020152, 1.152429, -0.1733536, 0, 0, 0, 1, 1,
-0.30022, -0.03804618, -1.644937, 0, 0, 0, 1, 1,
-0.3000308, 0.2565367, -0.5448431, 1, 1, 1, 1, 1,
-0.2998961, -0.3404202, -1.858184, 1, 1, 1, 1, 1,
-0.2906063, -0.544686, -3.357731, 1, 1, 1, 1, 1,
-0.2901037, 1.252019, -1.973614, 1, 1, 1, 1, 1,
-0.2807128, -0.875359, -3.210403, 1, 1, 1, 1, 1,
-0.2801051, -0.572506, -1.036402, 1, 1, 1, 1, 1,
-0.2782819, -1.672612, -4.01206, 1, 1, 1, 1, 1,
-0.2775111, 0.6459234, -1.608456, 1, 1, 1, 1, 1,
-0.2755266, -0.1407124, -2.639982, 1, 1, 1, 1, 1,
-0.2735765, 0.5073299, -0.64591, 1, 1, 1, 1, 1,
-0.2680956, 0.3660651, -1.188727, 1, 1, 1, 1, 1,
-0.2669992, -0.9145626, -1.845621, 1, 1, 1, 1, 1,
-0.2665668, 1.243792, 0.1172172, 1, 1, 1, 1, 1,
-0.2595356, 0.7716451, -1.21756, 1, 1, 1, 1, 1,
-0.2589153, -0.8291484, -2.915878, 1, 1, 1, 1, 1,
-0.2571342, 1.646316, -0.942287, 0, 0, 1, 1, 1,
-0.2569959, -0.1675783, -2.893876, 1, 0, 0, 1, 1,
-0.2536881, -0.1218051, -1.752186, 1, 0, 0, 1, 1,
-0.2480596, -1.078267, -0.6210859, 1, 0, 0, 1, 1,
-0.2415221, 1.161623, -0.1229078, 1, 0, 0, 1, 1,
-0.2382384, -0.1190619, -3.807663, 1, 0, 0, 1, 1,
-0.236472, -0.2121344, -1.999771, 0, 0, 0, 1, 1,
-0.2330233, -1.220228, -1.695001, 0, 0, 0, 1, 1,
-0.2299539, -1.3209, -3.745117, 0, 0, 0, 1, 1,
-0.2253482, -0.1878753, -0.5937679, 0, 0, 0, 1, 1,
-0.224267, -0.6835826, -4.678833, 0, 0, 0, 1, 1,
-0.2233721, 1.022846, 0.7560231, 0, 0, 0, 1, 1,
-0.2226274, -0.06352188, -2.38912, 0, 0, 0, 1, 1,
-0.2178955, -2.226786, -4.029846, 1, 1, 1, 1, 1,
-0.2168536, -1.468944, -3.197494, 1, 1, 1, 1, 1,
-0.2088044, -0.2172795, -2.497729, 1, 1, 1, 1, 1,
-0.2042717, 1.100741, -0.4083348, 1, 1, 1, 1, 1,
-0.2031842, -0.3835126, -1.874542, 1, 1, 1, 1, 1,
-0.1995801, -0.427904, -2.19077, 1, 1, 1, 1, 1,
-0.1983853, 1.87086, 0.2400671, 1, 1, 1, 1, 1,
-0.1920988, -0.9521337, -3.007568, 1, 1, 1, 1, 1,
-0.1916384, -1.606153, -4.315248, 1, 1, 1, 1, 1,
-0.1912412, -0.132497, -4.271671, 1, 1, 1, 1, 1,
-0.1860384, -1.117473, -1.116552, 1, 1, 1, 1, 1,
-0.1833176, -0.5981907, -3.927024, 1, 1, 1, 1, 1,
-0.1826174, -0.5285827, -5.053874, 1, 1, 1, 1, 1,
-0.1813146, 1.703406, -1.174064, 1, 1, 1, 1, 1,
-0.1783388, -0.09295086, -2.289033, 1, 1, 1, 1, 1,
-0.1659973, -0.1803067, -3.593332, 0, 0, 1, 1, 1,
-0.1656572, 0.9459959, -0.5782235, 1, 0, 0, 1, 1,
-0.1639817, -0.5052407, -1.899276, 1, 0, 0, 1, 1,
-0.16336, -0.6419671, -4.023893, 1, 0, 0, 1, 1,
-0.1614912, -0.4120865, -0.8908576, 1, 0, 0, 1, 1,
-0.1611572, -0.9561397, -3.589621, 1, 0, 0, 1, 1,
-0.1610309, 1.587119, 0.3595377, 0, 0, 0, 1, 1,
-0.1603663, -0.1070581, -0.5957685, 0, 0, 0, 1, 1,
-0.1597807, 0.3622103, -1.404878, 0, 0, 0, 1, 1,
-0.1572634, 0.542815, 0.4023875, 0, 0, 0, 1, 1,
-0.1557327, 0.485926, -1.136724, 0, 0, 0, 1, 1,
-0.1555419, 0.6672793, -0.7819036, 0, 0, 0, 1, 1,
-0.1487384, -0.05205915, -0.4296797, 0, 0, 0, 1, 1,
-0.1486726, -0.1962222, -3.017163, 1, 1, 1, 1, 1,
-0.1454908, 0.8289829, -0.07806816, 1, 1, 1, 1, 1,
-0.1404383, -0.09970775, -0.7928526, 1, 1, 1, 1, 1,
-0.137875, -1.290268, -3.166118, 1, 1, 1, 1, 1,
-0.1366472, 2.16093, 0.4174155, 1, 1, 1, 1, 1,
-0.1363508, -0.01338109, -2.865222, 1, 1, 1, 1, 1,
-0.1359537, 1.022695, 0.3362784, 1, 1, 1, 1, 1,
-0.1336364, 0.203582, -0.5206351, 1, 1, 1, 1, 1,
-0.1289832, -0.02863237, -0.623344, 1, 1, 1, 1, 1,
-0.1254043, -0.661774, -2.006576, 1, 1, 1, 1, 1,
-0.1179916, 1.322611, 0.06954028, 1, 1, 1, 1, 1,
-0.1125122, 0.2862808, -0.5213525, 1, 1, 1, 1, 1,
-0.112188, -0.5221674, -4.73959, 1, 1, 1, 1, 1,
-0.1120888, 0.6533927, 1.325873, 1, 1, 1, 1, 1,
-0.1084479, -0.4162663, -2.464439, 1, 1, 1, 1, 1,
-0.1015694, -0.9456442, -1.795649, 0, 0, 1, 1, 1,
-0.09939943, -1.153751, -3.07321, 1, 0, 0, 1, 1,
-0.09515727, -2.070924, -2.637471, 1, 0, 0, 1, 1,
-0.09039565, 1.031773, -0.3954409, 1, 0, 0, 1, 1,
-0.08401088, -1.69773, -4.932649, 1, 0, 0, 1, 1,
-0.07973232, -0.798885, -2.819251, 1, 0, 0, 1, 1,
-0.07938787, 1.198346, -1.496492, 0, 0, 0, 1, 1,
-0.07865455, -0.05214766, -2.892294, 0, 0, 0, 1, 1,
-0.07597518, 0.2243095, -2.234177, 0, 0, 0, 1, 1,
-0.0719897, 0.1926225, -0.2729144, 0, 0, 0, 1, 1,
-0.07130439, -0.01037274, -2.001278, 0, 0, 0, 1, 1,
-0.0686906, -1.502308, -1.497186, 0, 0, 0, 1, 1,
-0.0683669, -0.4294015, -4.727619, 0, 0, 0, 1, 1,
-0.06797806, 0.9990985, -0.03707776, 1, 1, 1, 1, 1,
-0.06796889, 0.6970738, -0.3818369, 1, 1, 1, 1, 1,
-0.06793872, 1.658316, -0.082605, 1, 1, 1, 1, 1,
-0.06451725, -0.3427274, -2.102649, 1, 1, 1, 1, 1,
-0.06416892, -1.898467, -3.083988, 1, 1, 1, 1, 1,
-0.06409603, 1.558346, -1.008274, 1, 1, 1, 1, 1,
-0.06183626, -1.130978, -2.7294, 1, 1, 1, 1, 1,
-0.05961437, -0.2095053, -4.849889, 1, 1, 1, 1, 1,
-0.05887543, 1.91564, -1.388901, 1, 1, 1, 1, 1,
-0.05629507, -0.6686447, -2.713264, 1, 1, 1, 1, 1,
-0.05571115, 0.2069863, -0.4641591, 1, 1, 1, 1, 1,
-0.05277763, 1.303073, 0.1459596, 1, 1, 1, 1, 1,
-0.05232454, 0.8063301, -0.02932448, 1, 1, 1, 1, 1,
-0.05216604, 0.3681713, -0.1923142, 1, 1, 1, 1, 1,
-0.0505598, -0.467389, -2.894828, 1, 1, 1, 1, 1,
-0.04179024, 0.7530785, 0.4691873, 0, 0, 1, 1, 1,
-0.0387185, -0.6702176, -3.282961, 1, 0, 0, 1, 1,
-0.03797333, -0.9632951, -2.341694, 1, 0, 0, 1, 1,
-0.0368172, 1.061151, -0.3346328, 1, 0, 0, 1, 1,
-0.03599302, -0.7826931, -1.86583, 1, 0, 0, 1, 1,
-0.03572225, 1.088946, -0.8193377, 1, 0, 0, 1, 1,
-0.03360836, 0.918833, -0.007021639, 0, 0, 0, 1, 1,
-0.0334979, -0.1575035, -2.527465, 0, 0, 0, 1, 1,
-0.03288754, 1.673911, 0.2635719, 0, 0, 0, 1, 1,
-0.03070053, 1.177995, 1.232579, 0, 0, 0, 1, 1,
-0.02990564, 0.2026547, -0.1957417, 0, 0, 0, 1, 1,
-0.02916723, -0.5826635, -2.279503, 0, 0, 0, 1, 1,
-0.02398588, -0.2262167, -5.22956, 0, 0, 0, 1, 1,
-0.01966967, -0.7163126, -2.333473, 1, 1, 1, 1, 1,
-0.01559624, 1.851011, 0.2691841, 1, 1, 1, 1, 1,
-0.01359704, -0.6739743, -2.21278, 1, 1, 1, 1, 1,
-0.01226298, 0.1260598, 0.1001955, 1, 1, 1, 1, 1,
-0.0120771, 0.231285, 0.9952195, 1, 1, 1, 1, 1,
-0.01061037, -0.8242636, -3.057788, 1, 1, 1, 1, 1,
-0.007249095, -0.5498078, -2.856838, 1, 1, 1, 1, 1,
-0.00272051, -0.5446617, -2.944427, 1, 1, 1, 1, 1,
0.008342119, 0.8491841, -0.9338465, 1, 1, 1, 1, 1,
0.01192062, 1.216619, 0.5793495, 1, 1, 1, 1, 1,
0.01697272, 0.6911038, -0.09341704, 1, 1, 1, 1, 1,
0.01843864, -0.5351083, 3.780085, 1, 1, 1, 1, 1,
0.01901996, -0.8107455, 3.753718, 1, 1, 1, 1, 1,
0.02216583, 0.5982251, -0.6724874, 1, 1, 1, 1, 1,
0.02378931, -1.414567, 3.758033, 1, 1, 1, 1, 1,
0.02819778, 1.213123, 0.1983639, 0, 0, 1, 1, 1,
0.03107196, -0.6806819, 2.901204, 1, 0, 0, 1, 1,
0.0378244, 0.7140529, 1.566357, 1, 0, 0, 1, 1,
0.04076497, 0.418597, 1.643129, 1, 0, 0, 1, 1,
0.04110571, 1.383662, -0.07906949, 1, 0, 0, 1, 1,
0.04228079, -0.001388351, 1.703424, 1, 0, 0, 1, 1,
0.04255515, 0.6301503, 0.978287, 0, 0, 0, 1, 1,
0.04761157, 1.780307, 1.537989, 0, 0, 0, 1, 1,
0.05148897, 0.4504938, 0.2030497, 0, 0, 0, 1, 1,
0.05749548, 0.5682588, 0.2154754, 0, 0, 0, 1, 1,
0.06196835, -0.5654007, 4.625801, 0, 0, 0, 1, 1,
0.06471865, 0.6714985, -0.4530878, 0, 0, 0, 1, 1,
0.0694458, 1.79212, 0.08650618, 0, 0, 0, 1, 1,
0.07151531, -0.2960954, 2.847926, 1, 1, 1, 1, 1,
0.08084624, 0.4143122, 0.406569, 1, 1, 1, 1, 1,
0.08126975, 0.9941658, -1.042159, 1, 1, 1, 1, 1,
0.08325926, 0.9999959, 1.057226, 1, 1, 1, 1, 1,
0.08347078, -1.219017, 3.065542, 1, 1, 1, 1, 1,
0.08384699, 0.3999801, 1.249928, 1, 1, 1, 1, 1,
0.08416726, 1.863082, -0.8672203, 1, 1, 1, 1, 1,
0.08740426, -0.3424649, 2.161642, 1, 1, 1, 1, 1,
0.09443989, -0.8730407, 3.106903, 1, 1, 1, 1, 1,
0.09506438, 1.504911, 0.1670522, 1, 1, 1, 1, 1,
0.09822942, 1.652212, 1.452102, 1, 1, 1, 1, 1,
0.09950556, 0.3877055, 0.3133153, 1, 1, 1, 1, 1,
0.1002024, 1.580037, -1.054744, 1, 1, 1, 1, 1,
0.1002683, 0.06088293, 1.149094, 1, 1, 1, 1, 1,
0.1027684, 1.380656, 0.03911727, 1, 1, 1, 1, 1,
0.1033858, -0.2885419, 2.011048, 0, 0, 1, 1, 1,
0.1219904, 0.9616201, 0.008258687, 1, 0, 0, 1, 1,
0.1254548, 0.2277091, 0.2901193, 1, 0, 0, 1, 1,
0.1282099, -0.8117245, 2.715517, 1, 0, 0, 1, 1,
0.1321983, -0.7306875, 4.12491, 1, 0, 0, 1, 1,
0.1392553, -0.1821787, 3.593763, 1, 0, 0, 1, 1,
0.1400804, -0.8989074, 2.664851, 0, 0, 0, 1, 1,
0.1422466, -1.36144, 2.588057, 0, 0, 0, 1, 1,
0.1478622, -0.3922009, 3.226706, 0, 0, 0, 1, 1,
0.1523318, -1.826144, 3.268496, 0, 0, 0, 1, 1,
0.1539267, -1.098163, 2.429806, 0, 0, 0, 1, 1,
0.1641823, -0.07069757, 0.4885708, 0, 0, 0, 1, 1,
0.1655001, -1.116219, 1.123256, 0, 0, 0, 1, 1,
0.1705291, 0.2931159, -0.6229194, 1, 1, 1, 1, 1,
0.1718198, 0.313171, 0.0866895, 1, 1, 1, 1, 1,
0.1755892, 1.887674, -2.297738, 1, 1, 1, 1, 1,
0.176153, -0.5593395, 0.8737807, 1, 1, 1, 1, 1,
0.1775804, 0.1124316, 0.7601786, 1, 1, 1, 1, 1,
0.1799953, 2.370221, -0.377818, 1, 1, 1, 1, 1,
0.1827956, -1.401519, 4.42489, 1, 1, 1, 1, 1,
0.1863983, 0.8937337, -0.2955485, 1, 1, 1, 1, 1,
0.1890189, 0.9105161, 0.6661103, 1, 1, 1, 1, 1,
0.1891221, -1.781999, 2.571108, 1, 1, 1, 1, 1,
0.1903437, -0.8694897, 2.316853, 1, 1, 1, 1, 1,
0.1916519, -0.06851713, 0.5533084, 1, 1, 1, 1, 1,
0.1945253, -0.01698329, 1.601515, 1, 1, 1, 1, 1,
0.2017726, 1.158024, 0.8174114, 1, 1, 1, 1, 1,
0.2054334, 0.1404541, -0.5450232, 1, 1, 1, 1, 1,
0.2077951, -0.4124737, 2.300964, 0, 0, 1, 1, 1,
0.2101295, -1.350296, 0.4927063, 1, 0, 0, 1, 1,
0.2194476, 0.5301846, -0.6266098, 1, 0, 0, 1, 1,
0.2209336, 0.9279286, -1.026516, 1, 0, 0, 1, 1,
0.2214777, -0.171068, 1.732758, 1, 0, 0, 1, 1,
0.2263887, -1.393771, 3.078189, 1, 0, 0, 1, 1,
0.2272205, -0.3001114, 1.068512, 0, 0, 0, 1, 1,
0.2278581, 1.392885, -0.1492444, 0, 0, 0, 1, 1,
0.233566, -0.737403, 2.607781, 0, 0, 0, 1, 1,
0.2373116, 1.499226, 0.3844715, 0, 0, 0, 1, 1,
0.2377618, -0.00877763, 2.326439, 0, 0, 0, 1, 1,
0.2379997, -0.1969959, 1.952789, 0, 0, 0, 1, 1,
0.2396633, 2.007269, -1.405555, 0, 0, 0, 1, 1,
0.2455255, 0.4031644, 1.076029, 1, 1, 1, 1, 1,
0.2485892, 2.16157, -0.03131521, 1, 1, 1, 1, 1,
0.2495287, -0.6590666, 3.599557, 1, 1, 1, 1, 1,
0.2496043, 0.1706806, 2.65809, 1, 1, 1, 1, 1,
0.2525389, 0.5244395, 2.552338, 1, 1, 1, 1, 1,
0.2542436, -1.021478, 1.807394, 1, 1, 1, 1, 1,
0.2570826, 0.161329, 0.6617597, 1, 1, 1, 1, 1,
0.2584579, 1.438171, 0.5309724, 1, 1, 1, 1, 1,
0.2585583, -1.112928, 4.195224, 1, 1, 1, 1, 1,
0.2588204, -0.5138838, 1.75054, 1, 1, 1, 1, 1,
0.2601577, -0.7802894, 1.553593, 1, 1, 1, 1, 1,
0.2616231, 1.620867, -0.3746665, 1, 1, 1, 1, 1,
0.262385, -2.435556, 1.691925, 1, 1, 1, 1, 1,
0.2625562, 0.4536331, -0.1309031, 1, 1, 1, 1, 1,
0.2657512, 1.703152, -1.256315, 1, 1, 1, 1, 1,
0.2693008, -1.622673, 1.617236, 0, 0, 1, 1, 1,
0.2707718, -0.1991793, 1.822741, 1, 0, 0, 1, 1,
0.2764769, 0.4722209, -0.4335594, 1, 0, 0, 1, 1,
0.2784824, 0.8147082, -0.326839, 1, 0, 0, 1, 1,
0.2787, 0.1017092, 0.3610317, 1, 0, 0, 1, 1,
0.2801045, 0.4379607, 0.8665123, 1, 0, 0, 1, 1,
0.281817, 0.1554344, 0.3350997, 0, 0, 0, 1, 1,
0.2827397, 0.9947056, 0.7433712, 0, 0, 0, 1, 1,
0.2858301, -1.693718, 1.816826, 0, 0, 0, 1, 1,
0.2881619, -0.306621, 0.7642241, 0, 0, 0, 1, 1,
0.2963808, 0.9698529, 2.106363, 0, 0, 0, 1, 1,
0.2983744, 0.564683, 0.5107207, 0, 0, 0, 1, 1,
0.2994602, 0.8137001, 1.01197, 0, 0, 0, 1, 1,
0.300609, -0.8977428, 3.385265, 1, 1, 1, 1, 1,
0.3009057, 1.552464, -0.5518838, 1, 1, 1, 1, 1,
0.3024035, 0.08588853, 0.5550093, 1, 1, 1, 1, 1,
0.3051432, -0.7545794, 3.027812, 1, 1, 1, 1, 1,
0.3111399, -1.437459, 3.359473, 1, 1, 1, 1, 1,
0.3114589, -0.8442281, 4.705492, 1, 1, 1, 1, 1,
0.3164462, -0.3405497, 4.055803, 1, 1, 1, 1, 1,
0.3189098, -0.6338744, 1.620683, 1, 1, 1, 1, 1,
0.3200585, 0.4439215, 0.03684419, 1, 1, 1, 1, 1,
0.3292198, -0.9881839, 3.692753, 1, 1, 1, 1, 1,
0.3317885, 1.422917, 1.186688, 1, 1, 1, 1, 1,
0.3333572, 0.2788888, 2.064019, 1, 1, 1, 1, 1,
0.3388346, 1.801533, -0.629634, 1, 1, 1, 1, 1,
0.3410216, 0.5649708, 0.1334011, 1, 1, 1, 1, 1,
0.3446204, -1.288241, 1.65556, 1, 1, 1, 1, 1,
0.3491292, 0.003279485, 1.970881, 0, 0, 1, 1, 1,
0.3494261, 0.2376738, 1.238656, 1, 0, 0, 1, 1,
0.3509982, 0.4661304, 2.294049, 1, 0, 0, 1, 1,
0.35354, -0.3298487, 3.734049, 1, 0, 0, 1, 1,
0.3553216, -0.8950629, 2.490912, 1, 0, 0, 1, 1,
0.362161, -0.8744905, 2.827747, 1, 0, 0, 1, 1,
0.3634406, -0.5052115, 3.622365, 0, 0, 0, 1, 1,
0.3635873, 1.62737, 0.5139884, 0, 0, 0, 1, 1,
0.3644482, -0.6866665, 1.83696, 0, 0, 0, 1, 1,
0.367592, 0.1044321, 1.511887, 0, 0, 0, 1, 1,
0.3711374, 0.3004429, 0.4774831, 0, 0, 0, 1, 1,
0.3748463, -0.2143491, 2.581105, 0, 0, 0, 1, 1,
0.3800842, 0.3692461, 0.1889532, 0, 0, 0, 1, 1,
0.3839927, -1.200153, 0.7305102, 1, 1, 1, 1, 1,
0.3840989, 0.4146215, 0.4009939, 1, 1, 1, 1, 1,
0.3873901, 0.582235, 1.914435, 1, 1, 1, 1, 1,
0.3938912, -0.009256092, 0.467285, 1, 1, 1, 1, 1,
0.3949112, -1.32808, 3.656933, 1, 1, 1, 1, 1,
0.3967665, -0.9760982, 2.151868, 1, 1, 1, 1, 1,
0.3969307, -0.564283, 1.34586, 1, 1, 1, 1, 1,
0.3973856, -1.360599, 4.575984, 1, 1, 1, 1, 1,
0.4003599, -2.058694, 3.039394, 1, 1, 1, 1, 1,
0.4065034, 0.1614646, 0.5980714, 1, 1, 1, 1, 1,
0.4085099, 1.8315, -0.01307351, 1, 1, 1, 1, 1,
0.4096713, 0.4683114, 0.8900875, 1, 1, 1, 1, 1,
0.4105664, -1.883601, 1.498027, 1, 1, 1, 1, 1,
0.4112576, -0.6157303, 2.719674, 1, 1, 1, 1, 1,
0.4117389, 1.87527, 0.7400485, 1, 1, 1, 1, 1,
0.4150642, -1.594359, 2.051195, 0, 0, 1, 1, 1,
0.4187732, -0.3226181, 2.899219, 1, 0, 0, 1, 1,
0.4247986, -0.930051, 3.337229, 1, 0, 0, 1, 1,
0.4284646, -1.386899, 2.635874, 1, 0, 0, 1, 1,
0.4296618, 0.3102303, 0.570897, 1, 0, 0, 1, 1,
0.4337906, -0.4528383, 2.371493, 1, 0, 0, 1, 1,
0.4363831, -0.04763154, 4.841891, 0, 0, 0, 1, 1,
0.4366039, -0.213647, 0.7833112, 0, 0, 0, 1, 1,
0.4412251, -0.2478084, 2.740269, 0, 0, 0, 1, 1,
0.4414634, 0.9004225, -0.4141453, 0, 0, 0, 1, 1,
0.4424013, 0.7816495, 0.6831552, 0, 0, 0, 1, 1,
0.4455545, -2.442925, 2.360445, 0, 0, 0, 1, 1,
0.448828, 0.4590798, 0.3735441, 0, 0, 0, 1, 1,
0.4520674, 0.7126091, -2.075718, 1, 1, 1, 1, 1,
0.4550877, 1.55154, -0.9304183, 1, 1, 1, 1, 1,
0.4552895, 0.8915855, 0.7308526, 1, 1, 1, 1, 1,
0.4589514, 0.3357381, 0.2300781, 1, 1, 1, 1, 1,
0.4627238, -0.8571332, 2.976203, 1, 1, 1, 1, 1,
0.4627539, 1.265582, -0.7102366, 1, 1, 1, 1, 1,
0.463035, -0.3900422, 2.906601, 1, 1, 1, 1, 1,
0.4650928, 0.93271, 0.2760655, 1, 1, 1, 1, 1,
0.4657326, 1.070182, 0.4498346, 1, 1, 1, 1, 1,
0.4665871, -0.80669, 3.028911, 1, 1, 1, 1, 1,
0.4714042, -0.6379234, 4.394638, 1, 1, 1, 1, 1,
0.4754174, 0.6148404, 0.9224348, 1, 1, 1, 1, 1,
0.476752, 0.8450905, -0.1034839, 1, 1, 1, 1, 1,
0.4780548, 0.1739937, 0.371071, 1, 1, 1, 1, 1,
0.4835637, -0.4603826, 2.598157, 1, 1, 1, 1, 1,
0.4895146, -0.455792, 3.878137, 0, 0, 1, 1, 1,
0.4929017, 1.579532, 2.471602, 1, 0, 0, 1, 1,
0.4938749, 0.7615016, -0.8150334, 1, 0, 0, 1, 1,
0.4991812, -0.03393693, 1.614289, 1, 0, 0, 1, 1,
0.5010337, 0.8863675, -0.0376476, 1, 0, 0, 1, 1,
0.5019293, 0.4589628, -0.7414574, 1, 0, 0, 1, 1,
0.5082474, 0.5942832, -1.202759, 0, 0, 0, 1, 1,
0.5088118, -0.3003638, 2.899326, 0, 0, 0, 1, 1,
0.509397, -0.1869965, 0.9542302, 0, 0, 0, 1, 1,
0.5133403, 1.197134, 1.936803, 0, 0, 0, 1, 1,
0.5169694, 0.9268148, 0.8713049, 0, 0, 0, 1, 1,
0.5180859, 0.6094995, 0.1594067, 0, 0, 0, 1, 1,
0.5229735, 0.02655477, 2.579828, 0, 0, 0, 1, 1,
0.5245368, -0.532986, 1.623446, 1, 1, 1, 1, 1,
0.5282531, -0.2622153, 1.815095, 1, 1, 1, 1, 1,
0.5323027, -0.7011661, 1.148662, 1, 1, 1, 1, 1,
0.5324053, -0.008932661, 1.209351, 1, 1, 1, 1, 1,
0.5328635, 0.3601842, 0.8141739, 1, 1, 1, 1, 1,
0.5351009, 0.9988604, 1.117674, 1, 1, 1, 1, 1,
0.5385343, 0.4915754, -0.8408403, 1, 1, 1, 1, 1,
0.5386046, -1.14624, 1.605981, 1, 1, 1, 1, 1,
0.5390171, -0.1031839, 1.026725, 1, 1, 1, 1, 1,
0.5415206, 0.4538035, 1.396544, 1, 1, 1, 1, 1,
0.5424549, 0.8142676, -0.2906676, 1, 1, 1, 1, 1,
0.5427941, -0.6955319, 1.085357, 1, 1, 1, 1, 1,
0.5429949, -0.8437993, 2.92062, 1, 1, 1, 1, 1,
0.5477503, -0.8736934, 2.037074, 1, 1, 1, 1, 1,
0.5500373, -0.09973605, 1.27655, 1, 1, 1, 1, 1,
0.5571089, 0.9916043, 1.57527, 0, 0, 1, 1, 1,
0.5715039, -0.2865812, 0.549641, 1, 0, 0, 1, 1,
0.5732334, -0.1419941, 1.820262, 1, 0, 0, 1, 1,
0.5735275, -0.7800301, 0.9529737, 1, 0, 0, 1, 1,
0.5765573, -0.1571826, 0.6680946, 1, 0, 0, 1, 1,
0.5800171, -0.8003115, 3.700723, 1, 0, 0, 1, 1,
0.5895836, 2.299474, -0.7539397, 0, 0, 0, 1, 1,
0.5896131, 0.8290963, 0.2522347, 0, 0, 0, 1, 1,
0.5921375, 0.995644, -1.062489, 0, 0, 0, 1, 1,
0.593661, -0.3065296, 3.685209, 0, 0, 0, 1, 1,
0.6027603, 0.6716179, 1.468389, 0, 0, 0, 1, 1,
0.6053568, -0.04848684, 1.537753, 0, 0, 0, 1, 1,
0.606409, 0.6740185, 1.802581, 0, 0, 0, 1, 1,
0.6104977, 1.178474, 0.2624135, 1, 1, 1, 1, 1,
0.6130205, 0.03445226, 1.621346, 1, 1, 1, 1, 1,
0.6224425, 0.9655649, 1.348439, 1, 1, 1, 1, 1,
0.6246032, -0.2884972, 3.017789, 1, 1, 1, 1, 1,
0.6252975, -0.2251159, 1.498711, 1, 1, 1, 1, 1,
0.6298594, 0.7174491, 0.8067144, 1, 1, 1, 1, 1,
0.6299757, -1.137189, 4.427887, 1, 1, 1, 1, 1,
0.6338236, -0.8179113, 3.384582, 1, 1, 1, 1, 1,
0.6357596, 1.170298, 1.136179, 1, 1, 1, 1, 1,
0.6366906, 0.4190178, -0.02248726, 1, 1, 1, 1, 1,
0.6444517, 0.4215261, 0.9418486, 1, 1, 1, 1, 1,
0.6449751, 0.3534504, 0.3960516, 1, 1, 1, 1, 1,
0.6456738, -0.7015426, 2.597037, 1, 1, 1, 1, 1,
0.6457897, 0.4586565, 0.8073183, 1, 1, 1, 1, 1,
0.6478599, -1.215528, 4.072497, 1, 1, 1, 1, 1,
0.6511709, -1.169734, 1.874987, 0, 0, 1, 1, 1,
0.6593387, 0.2236057, 2.143039, 1, 0, 0, 1, 1,
0.6625392, 1.499033, 1.592913, 1, 0, 0, 1, 1,
0.6644908, -0.06042583, 1.359554, 1, 0, 0, 1, 1,
0.6645223, -1.169449, 1.576872, 1, 0, 0, 1, 1,
0.664775, -1.594595, 3.801485, 1, 0, 0, 1, 1,
0.6744266, -0.008340939, 0.9776235, 0, 0, 0, 1, 1,
0.6756686, -0.4999975, 1.59231, 0, 0, 0, 1, 1,
0.6829128, 0.06964742, 1.559113, 0, 0, 0, 1, 1,
0.6835137, 0.4287336, 0.6170012, 0, 0, 0, 1, 1,
0.6845689, 0.6113855, 2.586867, 0, 0, 0, 1, 1,
0.7015122, 0.4709755, 2.079338, 0, 0, 0, 1, 1,
0.710489, 0.1844736, 2.634433, 0, 0, 0, 1, 1,
0.7219716, 0.6850353, 1.259819, 1, 1, 1, 1, 1,
0.725596, -1.040013, 2.373811, 1, 1, 1, 1, 1,
0.7291043, -0.2670667, 2.003788, 1, 1, 1, 1, 1,
0.7335835, -0.7260961, 1.107885, 1, 1, 1, 1, 1,
0.7337003, 0.9024991, 1.219455, 1, 1, 1, 1, 1,
0.7362289, 0.2764983, 0.3837425, 1, 1, 1, 1, 1,
0.7375464, -0.2789224, 2.029243, 1, 1, 1, 1, 1,
0.7630646, -1.376887, 3.095719, 1, 1, 1, 1, 1,
0.7640191, 0.5392932, -0.1587408, 1, 1, 1, 1, 1,
0.7695674, -0.8025419, 3.124877, 1, 1, 1, 1, 1,
0.7714214, 2.067161, 1.770442, 1, 1, 1, 1, 1,
0.7738838, 0.08985255, 1.445853, 1, 1, 1, 1, 1,
0.7739508, 0.5452038, 2.695834, 1, 1, 1, 1, 1,
0.7743621, -0.4633946, 0.9494312, 1, 1, 1, 1, 1,
0.7746119, 0.1916205, 0.1682687, 1, 1, 1, 1, 1,
0.7766029, 2.096743, -0.01565701, 0, 0, 1, 1, 1,
0.7820157, 0.04889508, 1.15401, 1, 0, 0, 1, 1,
0.7832808, -0.2092991, 1.698524, 1, 0, 0, 1, 1,
0.7890972, -0.943947, 2.517264, 1, 0, 0, 1, 1,
0.7913028, 0.1242005, 1.364422, 1, 0, 0, 1, 1,
0.7968085, -0.9674535, 1.267592, 1, 0, 0, 1, 1,
0.8014154, 0.1766614, 2.296084, 0, 0, 0, 1, 1,
0.8014454, 0.3127131, 2.024558, 0, 0, 0, 1, 1,
0.8045152, -1.166817, 2.355412, 0, 0, 0, 1, 1,
0.8139239, 0.9367509, 0.08263925, 0, 0, 0, 1, 1,
0.8180259, -0.2269659, 2.980765, 0, 0, 0, 1, 1,
0.8199688, -0.2613904, 1.911213, 0, 0, 0, 1, 1,
0.8220435, -1.171155, 1.992031, 0, 0, 0, 1, 1,
0.8279401, 0.2818868, 1.389694, 1, 1, 1, 1, 1,
0.8283991, 1.934216, 1.045898, 1, 1, 1, 1, 1,
0.8289213, -0.969038, 0.3711179, 1, 1, 1, 1, 1,
0.8332064, 0.198019, 2.178357, 1, 1, 1, 1, 1,
0.8449124, -0.2751017, 1.891478, 1, 1, 1, 1, 1,
0.8515344, -0.7137263, 2.556298, 1, 1, 1, 1, 1,
0.8516712, -1.12486, 2.221081, 1, 1, 1, 1, 1,
0.8635066, -0.7082199, 4.663187, 1, 1, 1, 1, 1,
0.8754336, 0.2757492, 2.477371, 1, 1, 1, 1, 1,
0.8759623, -0.2531322, 2.506035, 1, 1, 1, 1, 1,
0.8773973, -0.2919093, 2.729943, 1, 1, 1, 1, 1,
0.8781709, -0.4841621, 1.794236, 1, 1, 1, 1, 1,
0.8808027, -1.297468, 1.946177, 1, 1, 1, 1, 1,
0.884693, 1.389903, -0.9037153, 1, 1, 1, 1, 1,
0.8849146, 0.1751713, 0.04365337, 1, 1, 1, 1, 1,
0.8854154, -1.21521, 1.610844, 0, 0, 1, 1, 1,
0.8865778, -0.3605749, 2.510035, 1, 0, 0, 1, 1,
0.8976833, 0.2700538, 0.7202523, 1, 0, 0, 1, 1,
0.9034362, 0.3072588, 2.68257, 1, 0, 0, 1, 1,
0.90428, -0.112499, 0.8995718, 1, 0, 0, 1, 1,
0.9049339, 1.263016, -0.9905022, 1, 0, 0, 1, 1,
0.9104722, -0.1676074, 1.662455, 0, 0, 0, 1, 1,
0.9132758, 2.159474, 1.398485, 0, 0, 0, 1, 1,
0.9181299, 0.2185685, 1.717785, 0, 0, 0, 1, 1,
0.9266534, -1.273844, 2.645811, 0, 0, 0, 1, 1,
0.9312144, 2.08337, -1.423362, 0, 0, 0, 1, 1,
0.9322118, -0.4206118, 0.6428602, 0, 0, 0, 1, 1,
0.936115, 0.9268157, 1.392865, 0, 0, 0, 1, 1,
0.9372488, 0.8309475, 2.225101, 1, 1, 1, 1, 1,
0.9380471, -0.3692285, 2.434732, 1, 1, 1, 1, 1,
0.9434441, -0.3735985, 1.205003, 1, 1, 1, 1, 1,
0.9435763, 1.068963, -1.482798, 1, 1, 1, 1, 1,
0.948651, 1.255882, -0.6162786, 1, 1, 1, 1, 1,
0.9567623, 0.08106998, 0.3990833, 1, 1, 1, 1, 1,
0.9582882, -1.043912, 1.711123, 1, 1, 1, 1, 1,
0.9584129, 1.017744, 0.8652481, 1, 1, 1, 1, 1,
0.9616323, -0.04081215, 1.141287, 1, 1, 1, 1, 1,
0.9644465, -0.01453429, 3.70093, 1, 1, 1, 1, 1,
0.9659023, 0.1731001, -0.1742004, 1, 1, 1, 1, 1,
0.9683414, 1.638276, -1.025535, 1, 1, 1, 1, 1,
0.9703063, 0.5131936, 3.682412, 1, 1, 1, 1, 1,
0.9858262, 0.5070468, 0.4375899, 1, 1, 1, 1, 1,
0.9872689, 0.8083748, 0.4604118, 1, 1, 1, 1, 1,
0.9881495, -0.08561295, 1.484097, 0, 0, 1, 1, 1,
0.9932265, 1.911932, 1.422701, 1, 0, 0, 1, 1,
0.9947417, -2.049159, 2.383802, 1, 0, 0, 1, 1,
0.9984093, 1.342535, 0.05375647, 1, 0, 0, 1, 1,
0.9990473, -0.4128871, 2.630514, 1, 0, 0, 1, 1,
1.004134, -0.5232795, 1.285328, 1, 0, 0, 1, 1,
1.007229, -0.9191902, 3.071316, 0, 0, 0, 1, 1,
1.00816, -1.446822, 4.004923, 0, 0, 0, 1, 1,
1.009515, -0.04800392, 1.438703, 0, 0, 0, 1, 1,
1.021219, -1.620216, 3.392592, 0, 0, 0, 1, 1,
1.026331, 0.657133, 0.8803572, 0, 0, 0, 1, 1,
1.034252, -0.4645973, 0.6332956, 0, 0, 0, 1, 1,
1.04316, -0.3432413, 1.752201, 0, 0, 0, 1, 1,
1.04699, 0.416561, -0.8828995, 1, 1, 1, 1, 1,
1.049606, -0.7971351, 1.671903, 1, 1, 1, 1, 1,
1.053614, -0.4143954, 1.88633, 1, 1, 1, 1, 1,
1.053992, -1.006833, 2.455846, 1, 1, 1, 1, 1,
1.062251, -0.7009649, 2.062275, 1, 1, 1, 1, 1,
1.064626, -0.6888374, 0.7381925, 1, 1, 1, 1, 1,
1.065196, -0.7819893, 1.502619, 1, 1, 1, 1, 1,
1.067928, 0.1998728, 0.01721419, 1, 1, 1, 1, 1,
1.070904, 0.4108369, 1.128875, 1, 1, 1, 1, 1,
1.071761, -0.807422, 3.112343, 1, 1, 1, 1, 1,
1.077561, 0.1579805, 1.34124, 1, 1, 1, 1, 1,
1.083161, -0.1934235, 0.5264503, 1, 1, 1, 1, 1,
1.092408, 0.6018849, 1.081979, 1, 1, 1, 1, 1,
1.096095, -0.6301353, 1.450144, 1, 1, 1, 1, 1,
1.102214, -1.004626, 3.303251, 1, 1, 1, 1, 1,
1.104208, 0.4680294, 1.740183, 0, 0, 1, 1, 1,
1.107245, 0.2125213, -0.2434282, 1, 0, 0, 1, 1,
1.109901, 1.316779, 1.143708, 1, 0, 0, 1, 1,
1.131276, 0.01266728, 2.03725, 1, 0, 0, 1, 1,
1.143386, -1.553227, 3.741836, 1, 0, 0, 1, 1,
1.144222, -0.8308291, 2.101745, 1, 0, 0, 1, 1,
1.144513, -0.3485672, 2.876004, 0, 0, 0, 1, 1,
1.146919, 1.310333, -0.1488608, 0, 0, 0, 1, 1,
1.149008, 0.2786365, 1.987287, 0, 0, 0, 1, 1,
1.158874, 0.2856353, 1.772516, 0, 0, 0, 1, 1,
1.159481, -0.7366872, 3.617828, 0, 0, 0, 1, 1,
1.164605, -0.3746155, 1.648229, 0, 0, 0, 1, 1,
1.16717, -1.413824, 0.5085669, 0, 0, 0, 1, 1,
1.170593, -0.232633, 0.9824114, 1, 1, 1, 1, 1,
1.17239, -1.308274, 1.382907, 1, 1, 1, 1, 1,
1.177466, -0.1377003, 1.798307, 1, 1, 1, 1, 1,
1.188368, -0.1963376, 1.048678, 1, 1, 1, 1, 1,
1.190845, 0.06349774, 2.93525, 1, 1, 1, 1, 1,
1.197592, -0.4895574, 2.151519, 1, 1, 1, 1, 1,
1.222892, 0.07842742, 0.3703303, 1, 1, 1, 1, 1,
1.223016, 0.6298993, 0.6576746, 1, 1, 1, 1, 1,
1.235874, -1.182169, 2.520524, 1, 1, 1, 1, 1,
1.263611, -0.8356745, 0.2034182, 1, 1, 1, 1, 1,
1.268101, -0.5526033, 3.114161, 1, 1, 1, 1, 1,
1.270795, -0.3273175, 0.4619322, 1, 1, 1, 1, 1,
1.278179, 1.152799, 2.274983, 1, 1, 1, 1, 1,
1.291424, 0.7043939, -1.783338, 1, 1, 1, 1, 1,
1.295757, -0.3875306, 1.702294, 1, 1, 1, 1, 1,
1.298019, 0.03775508, 1.957924, 0, 0, 1, 1, 1,
1.301241, -0.6318151, 3.361501, 1, 0, 0, 1, 1,
1.302462, -0.5010359, 1.777598, 1, 0, 0, 1, 1,
1.305663, -0.02218897, 2.490339, 1, 0, 0, 1, 1,
1.309677, 0.1201611, 0.4855766, 1, 0, 0, 1, 1,
1.314164, -1.103209, 3.351552, 1, 0, 0, 1, 1,
1.318423, 0.5207615, 2.329915, 0, 0, 0, 1, 1,
1.324001, 0.3957466, 1.512815, 0, 0, 0, 1, 1,
1.332971, 0.6393383, 0.8971654, 0, 0, 0, 1, 1,
1.334886, -0.2160052, 1.86312, 0, 0, 0, 1, 1,
1.348571, 0.1742549, 1.180213, 0, 0, 0, 1, 1,
1.351898, 0.3346701, 0.6630375, 0, 0, 0, 1, 1,
1.362048, 0.4409594, 0.1764199, 0, 0, 0, 1, 1,
1.370156, 0.312988, 1.5464, 1, 1, 1, 1, 1,
1.378847, -0.7781676, 3.329358, 1, 1, 1, 1, 1,
1.379315, 0.1933815, 1.647436, 1, 1, 1, 1, 1,
1.381122, 1.269849, 0.3074115, 1, 1, 1, 1, 1,
1.392962, -0.8945425, 1.63384, 1, 1, 1, 1, 1,
1.40882, 0.07276475, 0.7469149, 1, 1, 1, 1, 1,
1.415962, 1.160794, -1.769549, 1, 1, 1, 1, 1,
1.440978, 0.1987901, 3.453479, 1, 1, 1, 1, 1,
1.441404, -0.9246061, 2.88063, 1, 1, 1, 1, 1,
1.443463, -0.7371455, 2.199224, 1, 1, 1, 1, 1,
1.447473, -1.591083, 1.736556, 1, 1, 1, 1, 1,
1.448727, -0.1829414, 0.5704293, 1, 1, 1, 1, 1,
1.456269, -1.470135, 2.915866, 1, 1, 1, 1, 1,
1.458023, 0.06039894, 2.02601, 1, 1, 1, 1, 1,
1.461699, -3.290442, 2.513729, 1, 1, 1, 1, 1,
1.475341, -0.5190269, -0.5123991, 0, 0, 1, 1, 1,
1.48232, -0.05249849, 0.6850387, 1, 0, 0, 1, 1,
1.482474, -1.322786, 2.2245, 1, 0, 0, 1, 1,
1.504599, -0.1489296, 0.990877, 1, 0, 0, 1, 1,
1.51015, -0.5084182, 0.7345872, 1, 0, 0, 1, 1,
1.516873, -0.6692885, 1.111733, 1, 0, 0, 1, 1,
1.527429, 0.7057548, 1.458889, 0, 0, 0, 1, 1,
1.528382, -1.07945, 2.063313, 0, 0, 0, 1, 1,
1.532854, -0.4763338, 1.582987, 0, 0, 0, 1, 1,
1.545899, 0.2607792, -0.1044726, 0, 0, 0, 1, 1,
1.546604, -1.526644, 3.038507, 0, 0, 0, 1, 1,
1.55505, 0.1157543, 3.075988, 0, 0, 0, 1, 1,
1.567388, 1.08907, 2.558401, 0, 0, 0, 1, 1,
1.589437, -0.4279332, 2.491983, 1, 1, 1, 1, 1,
1.59064, 0.7605265, -0.101642, 1, 1, 1, 1, 1,
1.598508, -1.323202, 2.527499, 1, 1, 1, 1, 1,
1.598978, -0.007746111, -0.9050856, 1, 1, 1, 1, 1,
1.602103, -0.3867806, 0.1714568, 1, 1, 1, 1, 1,
1.602584, 0.7373062, 1.565161, 1, 1, 1, 1, 1,
1.606506, -0.2489882, 1.380365, 1, 1, 1, 1, 1,
1.607291, -0.03707308, 1.725102, 1, 1, 1, 1, 1,
1.611547, -0.9648198, 2.75239, 1, 1, 1, 1, 1,
1.615002, 0.3187572, 0.7891498, 1, 1, 1, 1, 1,
1.621325, 1.309581, 0.566078, 1, 1, 1, 1, 1,
1.632439, 1.597571, 1.303319, 1, 1, 1, 1, 1,
1.632816, -1.432538, 1.112963, 1, 1, 1, 1, 1,
1.633572, 0.9589664, -0.2504915, 1, 1, 1, 1, 1,
1.643203, -0.4740318, -0.1441717, 1, 1, 1, 1, 1,
1.644146, 0.5323442, 0.1950286, 0, 0, 1, 1, 1,
1.646615, -0.2309316, 0.006797356, 1, 0, 0, 1, 1,
1.653856, 0.1495544, 0.2050095, 1, 0, 0, 1, 1,
1.672781, -1.080625, 3.582073, 1, 0, 0, 1, 1,
1.674249, 0.4806635, 0.7536406, 1, 0, 0, 1, 1,
1.706764, 0.04284091, 2.034809, 1, 0, 0, 1, 1,
1.709658, 0.7632392, 0.2910171, 0, 0, 0, 1, 1,
1.726144, -0.5764827, 1.870896, 0, 0, 0, 1, 1,
1.736744, -0.3551072, 1.723811, 0, 0, 0, 1, 1,
1.738134, -0.3688093, 0.329682, 0, 0, 0, 1, 1,
1.74496, 0.5258231, 1.705299, 0, 0, 0, 1, 1,
1.759526, -0.3825273, 3.253794, 0, 0, 0, 1, 1,
1.770228, 0.5983044, 0.03410246, 0, 0, 0, 1, 1,
1.78564, 0.4991503, 3.374576, 1, 1, 1, 1, 1,
1.808378, -0.3076233, 1.592499, 1, 1, 1, 1, 1,
1.813535, -0.6805152, 1.801421, 1, 1, 1, 1, 1,
1.81677, -0.4650659, 2.272981, 1, 1, 1, 1, 1,
1.818771, 0.0711755, 2.526731, 1, 1, 1, 1, 1,
1.849781, 0.8522517, 2.86554, 1, 1, 1, 1, 1,
1.855867, 1.328421, 1.730026, 1, 1, 1, 1, 1,
1.881787, 0.5506709, -0.2855965, 1, 1, 1, 1, 1,
1.903654, -0.8080313, 2.813181, 1, 1, 1, 1, 1,
1.928375, 1.29595, 1.387233, 1, 1, 1, 1, 1,
1.961881, -0.2428533, 2.394862, 1, 1, 1, 1, 1,
1.967208, 0.4541404, 0.2560481, 1, 1, 1, 1, 1,
1.992856, -0.4264959, 1.079696, 1, 1, 1, 1, 1,
2.07281, -0.3100807, 3.349583, 1, 1, 1, 1, 1,
2.080416, -2.584354, 3.1697, 1, 1, 1, 1, 1,
2.094522, -1.914845, 2.591726, 0, 0, 1, 1, 1,
2.105744, -0.9786634, 1.524917, 1, 0, 0, 1, 1,
2.151846, 1.363936, 1.254369, 1, 0, 0, 1, 1,
2.169222, 0.1303467, 0.1914935, 1, 0, 0, 1, 1,
2.175291, -0.2346853, 0.5689405, 1, 0, 0, 1, 1,
2.209257, -0.2547041, 2.676977, 1, 0, 0, 1, 1,
2.209559, -1.454818, 2.30829, 0, 0, 0, 1, 1,
2.267006, 1.522856, -0.7037465, 0, 0, 0, 1, 1,
2.289675, -0.02356959, 1.840954, 0, 0, 0, 1, 1,
2.301314, 0.4187531, 2.706312, 0, 0, 0, 1, 1,
2.321014, 0.7236348, 2.072393, 0, 0, 0, 1, 1,
2.34522, -0.9393617, 3.125131, 0, 0, 0, 1, 1,
2.389553, 0.375729, 1.350043, 0, 0, 0, 1, 1,
2.422826, 0.5184957, 2.141544, 1, 1, 1, 1, 1,
2.496019, -0.5213919, 1.538763, 1, 1, 1, 1, 1,
2.672071, 1.237607, 2.356605, 1, 1, 1, 1, 1,
2.922056, -0.2216882, 2.811579, 1, 1, 1, 1, 1,
3.083719, 0.9811659, 1.127887, 1, 1, 1, 1, 1,
3.291852, 1.077582, 0.835456, 1, 1, 1, 1, 1,
3.320599, -0.3785566, 1.166452, 1, 1, 1, 1, 1
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
var radius = 9.338634;
var distance = 32.80156;
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
mvMatrix.translate( 0.1005113, 0.2781786, 0.1938348 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.80156);
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
