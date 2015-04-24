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
-3.366025, -1.452639, -2.433786, 1, 0, 0, 1,
-2.983845, 0.1742648, -1.582637, 1, 0.007843138, 0, 1,
-2.902267, -0.7145995, -1.970856, 1, 0.01176471, 0, 1,
-2.850642, 0.01842343, 0.08865112, 1, 0.01960784, 0, 1,
-2.785732, 0.4175361, -0.2600205, 1, 0.02352941, 0, 1,
-2.687391, -0.9399468, -1.007614, 1, 0.03137255, 0, 1,
-2.64407, -0.3434182, -4.306245, 1, 0.03529412, 0, 1,
-2.616556, -0.9737343, -2.554871, 1, 0.04313726, 0, 1,
-2.60402, -1.65676, -1.30804, 1, 0.04705882, 0, 1,
-2.57812, -1.255232, -2.166427, 1, 0.05490196, 0, 1,
-2.567776, -0.6955593, 0.1603484, 1, 0.05882353, 0, 1,
-2.447568, -0.8330113, -1.458795, 1, 0.06666667, 0, 1,
-2.409851, -0.1885908, -0.880804, 1, 0.07058824, 0, 1,
-2.403711, -2.116707, -1.555499, 1, 0.07843138, 0, 1,
-2.402778, -0.1277242, -0.01684782, 1, 0.08235294, 0, 1,
-2.367849, 0.8409659, -2.423997, 1, 0.09019608, 0, 1,
-2.364575, 1.633505, -2.811017, 1, 0.09411765, 0, 1,
-2.304965, -0.2832482, -2.290928, 1, 0.1019608, 0, 1,
-2.298226, 1.565749, -1.745484, 1, 0.1098039, 0, 1,
-2.291887, 0.3514374, 0.1642764, 1, 0.1137255, 0, 1,
-2.282888, 0.4053883, -1.3318, 1, 0.1215686, 0, 1,
-2.24974, 2.05774, -0.885955, 1, 0.1254902, 0, 1,
-2.209593, 0.09243486, -3.039957, 1, 0.1333333, 0, 1,
-2.198303, 1.162166, -2.64421, 1, 0.1372549, 0, 1,
-2.165581, 0.9411588, -0.0879921, 1, 0.145098, 0, 1,
-2.161623, 0.82816, -1.767053, 1, 0.1490196, 0, 1,
-2.153913, 0.3859475, -1.521055, 1, 0.1568628, 0, 1,
-2.132363, -0.1060386, -1.466881, 1, 0.1607843, 0, 1,
-2.121088, 2.739171, -1.113571, 1, 0.1686275, 0, 1,
-2.115447, 1.463113, -1.107107, 1, 0.172549, 0, 1,
-2.108087, -0.4277759, -4.834857, 1, 0.1803922, 0, 1,
-2.050725, -0.2958884, -2.659619, 1, 0.1843137, 0, 1,
-2.035976, -0.1636769, -1.086623, 1, 0.1921569, 0, 1,
-1.965796, -0.9981701, -2.295511, 1, 0.1960784, 0, 1,
-1.939125, -0.06521991, -0.8258286, 1, 0.2039216, 0, 1,
-1.926184, 0.5783098, -2.561213, 1, 0.2117647, 0, 1,
-1.919971, 0.3240592, -1.407851, 1, 0.2156863, 0, 1,
-1.909077, -0.2667235, -2.854952, 1, 0.2235294, 0, 1,
-1.879701, 0.3163122, -0.8486683, 1, 0.227451, 0, 1,
-1.866486, 1.658203, 0.9471539, 1, 0.2352941, 0, 1,
-1.841678, 1.00298, -0.8589583, 1, 0.2392157, 0, 1,
-1.835287, -0.2443444, -1.770054, 1, 0.2470588, 0, 1,
-1.814718, 0.1559166, -1.102253, 1, 0.2509804, 0, 1,
-1.797654, 0.7910399, -0.1641143, 1, 0.2588235, 0, 1,
-1.797219, -1.525406, -2.877768, 1, 0.2627451, 0, 1,
-1.782562, -1.450988, -0.8857751, 1, 0.2705882, 0, 1,
-1.754242, -1.244086, -2.644654, 1, 0.2745098, 0, 1,
-1.750535, 1.074757, -1.736786, 1, 0.282353, 0, 1,
-1.745068, 2.172614, -0.52266, 1, 0.2862745, 0, 1,
-1.726794, 0.6641922, -3.478777, 1, 0.2941177, 0, 1,
-1.726271, 0.4177998, -2.685388, 1, 0.3019608, 0, 1,
-1.718251, 1.170388, -1.902916, 1, 0.3058824, 0, 1,
-1.713076, 0.4704687, -1.212479, 1, 0.3137255, 0, 1,
-1.712709, 1.532988, -0.9209204, 1, 0.3176471, 0, 1,
-1.710614, 1.574145, -1.169154, 1, 0.3254902, 0, 1,
-1.704299, 2.009457, -0.9262964, 1, 0.3294118, 0, 1,
-1.687469, -0.5691032, -1.578795, 1, 0.3372549, 0, 1,
-1.679972, 1.753392, 0.8896931, 1, 0.3411765, 0, 1,
-1.677275, 0.6109741, -1.511123, 1, 0.3490196, 0, 1,
-1.676467, 0.3143492, 0.4793684, 1, 0.3529412, 0, 1,
-1.668526, -0.4675359, -1.614935, 1, 0.3607843, 0, 1,
-1.659367, 0.6479567, -1.308593, 1, 0.3647059, 0, 1,
-1.649866, 1.555608, -1.342695, 1, 0.372549, 0, 1,
-1.631843, -0.3988383, -1.954927, 1, 0.3764706, 0, 1,
-1.61822, -0.3249226, 0.189709, 1, 0.3843137, 0, 1,
-1.602536, -0.1581371, -2.072048, 1, 0.3882353, 0, 1,
-1.592609, -1.885816, -1.26887, 1, 0.3960784, 0, 1,
-1.590177, 0.5986997, -0.3402942, 1, 0.4039216, 0, 1,
-1.589201, -0.6861173, -2.082264, 1, 0.4078431, 0, 1,
-1.576137, 0.7411692, -0.4902642, 1, 0.4156863, 0, 1,
-1.57561, 0.957793, -1.713692, 1, 0.4196078, 0, 1,
-1.571994, -0.6907015, -1.484372, 1, 0.427451, 0, 1,
-1.567809, 0.240837, 0.3402998, 1, 0.4313726, 0, 1,
-1.546374, 0.7762367, -1.150582, 1, 0.4392157, 0, 1,
-1.545712, -1.637053, -2.239387, 1, 0.4431373, 0, 1,
-1.539558, 1.136618, -0.5730039, 1, 0.4509804, 0, 1,
-1.531104, 1.655093, -0.7857696, 1, 0.454902, 0, 1,
-1.5298, 1.179934, -0.1412188, 1, 0.4627451, 0, 1,
-1.520932, -0.8881326, -2.194781, 1, 0.4666667, 0, 1,
-1.51333, 0.5655994, -1.742763, 1, 0.4745098, 0, 1,
-1.506361, 0.9031808, -1.411982, 1, 0.4784314, 0, 1,
-1.505485, -0.4329214, -1.78854, 1, 0.4862745, 0, 1,
-1.489022, -1.135407, -1.097166, 1, 0.4901961, 0, 1,
-1.486704, 0.5469884, -0.9272801, 1, 0.4980392, 0, 1,
-1.480009, -0.7415788, -0.1854372, 1, 0.5058824, 0, 1,
-1.464666, 0.7283885, -2.062621, 1, 0.509804, 0, 1,
-1.463537, -0.6453442, -2.740665, 1, 0.5176471, 0, 1,
-1.444431, -1.256901, -2.002681, 1, 0.5215687, 0, 1,
-1.442672, 0.1076799, -1.785043, 1, 0.5294118, 0, 1,
-1.432626, 0.7520176, -0.9430618, 1, 0.5333334, 0, 1,
-1.421061, -0.3922648, -3.52511, 1, 0.5411765, 0, 1,
-1.419291, 1.447666, -1.287349, 1, 0.5450981, 0, 1,
-1.399251, -0.2921415, -1.665041, 1, 0.5529412, 0, 1,
-1.391322, -0.3957071, -3.332844, 1, 0.5568628, 0, 1,
-1.379621, 0.3481028, -1.261639, 1, 0.5647059, 0, 1,
-1.377906, -0.3069716, -3.414485, 1, 0.5686275, 0, 1,
-1.369225, 0.8290854, -1.294199, 1, 0.5764706, 0, 1,
-1.367584, 0.1974332, -1.607167, 1, 0.5803922, 0, 1,
-1.36114, 0.1448177, -1.537634, 1, 0.5882353, 0, 1,
-1.345522, 1.126089, -1.641823, 1, 0.5921569, 0, 1,
-1.323946, 0.6335964, -1.104004, 1, 0.6, 0, 1,
-1.317945, 2.0124, -1.023728, 1, 0.6078432, 0, 1,
-1.315772, -1.149714, -3.311045, 1, 0.6117647, 0, 1,
-1.305746, 0.6806624, -0.3549327, 1, 0.6196079, 0, 1,
-1.302432, -0.687868, -1.284267, 1, 0.6235294, 0, 1,
-1.299494, 0.6958898, -1.179507, 1, 0.6313726, 0, 1,
-1.277076, -1.342223, -1.033119, 1, 0.6352941, 0, 1,
-1.259575, -0.3856969, -1.698527, 1, 0.6431373, 0, 1,
-1.258023, -0.1198616, -1.994177, 1, 0.6470588, 0, 1,
-1.247662, -1.209662, -4.756386, 1, 0.654902, 0, 1,
-1.233611, -1.29046, -1.998597, 1, 0.6588235, 0, 1,
-1.216076, 1.224169, -2.298769, 1, 0.6666667, 0, 1,
-1.214066, -0.6425403, -4.582281, 1, 0.6705883, 0, 1,
-1.208723, 1.070966, -0.0977696, 1, 0.6784314, 0, 1,
-1.205567, 0.1322226, -2.565777, 1, 0.682353, 0, 1,
-1.203287, 1.006615, -1.922906, 1, 0.6901961, 0, 1,
-1.202812, -0.5013007, -3.864176, 1, 0.6941177, 0, 1,
-1.200734, 0.1132999, -0.8658797, 1, 0.7019608, 0, 1,
-1.191753, 0.2084744, -1.841966, 1, 0.7098039, 0, 1,
-1.185523, -1.007209, -2.204847, 1, 0.7137255, 0, 1,
-1.182334, 1.109618, -0.8088377, 1, 0.7215686, 0, 1,
-1.173282, 0.4666734, -0.2077403, 1, 0.7254902, 0, 1,
-1.171662, 1.091328, -0.003807454, 1, 0.7333333, 0, 1,
-1.168223, 1.948213, 0.7227858, 1, 0.7372549, 0, 1,
-1.167417, -0.07322973, -2.256665, 1, 0.7450981, 0, 1,
-1.166504, -0.3326969, -2.002115, 1, 0.7490196, 0, 1,
-1.157209, -0.5124279, -3.572042, 1, 0.7568628, 0, 1,
-1.156222, 1.077139, 0.7678564, 1, 0.7607843, 0, 1,
-1.144044, 1.413703, -2.076614, 1, 0.7686275, 0, 1,
-1.135946, -0.9761216, -3.537558, 1, 0.772549, 0, 1,
-1.13587, -0.02621719, -2.653315, 1, 0.7803922, 0, 1,
-1.129588, 0.3393055, -0.6637807, 1, 0.7843137, 0, 1,
-1.1295, 0.08134946, -1.595334, 1, 0.7921569, 0, 1,
-1.128523, 0.362589, -2.726022, 1, 0.7960784, 0, 1,
-1.125585, -1.249514, -0.7399007, 1, 0.8039216, 0, 1,
-1.121688, 1.772524, -1.938636, 1, 0.8117647, 0, 1,
-1.119152, 2.486414, 1.028615, 1, 0.8156863, 0, 1,
-1.115478, -0.1981117, -1.229548, 1, 0.8235294, 0, 1,
-1.113579, -0.9522945, -3.884882, 1, 0.827451, 0, 1,
-1.09731, -1.000948, -1.29535, 1, 0.8352941, 0, 1,
-1.097027, 0.7818785, -1.47754, 1, 0.8392157, 0, 1,
-1.095337, -1.297463, -2.668965, 1, 0.8470588, 0, 1,
-1.092558, 1.107622, -2.139864, 1, 0.8509804, 0, 1,
-1.085088, 1.790965, -0.5852829, 1, 0.8588235, 0, 1,
-1.083891, -0.5519393, -2.212366, 1, 0.8627451, 0, 1,
-1.078039, -0.533548, -1.081041, 1, 0.8705882, 0, 1,
-1.077419, -1.81997, -0.9089276, 1, 0.8745098, 0, 1,
-1.073549, 1.499845, -0.5271598, 1, 0.8823529, 0, 1,
-1.069911, 1.050381, -1.701203, 1, 0.8862745, 0, 1,
-1.0631, 0.7932777, -0.9371178, 1, 0.8941177, 0, 1,
-1.060803, 0.3127849, -2.914682, 1, 0.8980392, 0, 1,
-1.06014, -0.9802151, -2.274266, 1, 0.9058824, 0, 1,
-1.05803, 0.4516554, -0.2770325, 1, 0.9137255, 0, 1,
-1.055518, -0.4663606, -2.049324, 1, 0.9176471, 0, 1,
-1.05224, 1.73509, 1.191591, 1, 0.9254902, 0, 1,
-1.043236, -1.219395, -2.700065, 1, 0.9294118, 0, 1,
-1.033072, -0.496459, -1.159073, 1, 0.9372549, 0, 1,
-1.029656, -1.881614, -2.931551, 1, 0.9411765, 0, 1,
-1.02898, -0.5309935, -3.574414, 1, 0.9490196, 0, 1,
-1.024098, -0.7988966, -1.449857, 1, 0.9529412, 0, 1,
-1.018352, 0.5057273, -1.279657, 1, 0.9607843, 0, 1,
-1.016044, -0.6961494, -3.348013, 1, 0.9647059, 0, 1,
-1.013691, -0.5211965, -2.031412, 1, 0.972549, 0, 1,
-1.013327, -0.03269186, -0.176578, 1, 0.9764706, 0, 1,
-1.01008, -0.5792748, -0.9868261, 1, 0.9843137, 0, 1,
-1.008641, 1.005306, -1.821522, 1, 0.9882353, 0, 1,
-1.005953, -0.485014, -2.315425, 1, 0.9960784, 0, 1,
-1.002676, 0.1183079, -0.7821258, 0.9960784, 1, 0, 1,
-1.000457, 2.269535, -1.677591, 0.9921569, 1, 0, 1,
-0.9952304, -0.309603, -2.001456, 0.9843137, 1, 0, 1,
-0.9920062, -1.127585, -2.666286, 0.9803922, 1, 0, 1,
-0.9858614, -0.5154884, -1.793257, 0.972549, 1, 0, 1,
-0.9837956, -2.69391, -4.116353, 0.9686275, 1, 0, 1,
-0.981008, -1.170301, -3.622723, 0.9607843, 1, 0, 1,
-0.9809436, -0.2372146, -1.251465, 0.9568627, 1, 0, 1,
-0.9806964, 1.083951, -0.4099623, 0.9490196, 1, 0, 1,
-0.9802998, -0.5261935, -1.99148, 0.945098, 1, 0, 1,
-0.9797109, -0.4827126, -2.973381, 0.9372549, 1, 0, 1,
-0.9783497, -1.57409, -1.557479, 0.9333333, 1, 0, 1,
-0.9769282, -0.9728811, -1.688238, 0.9254902, 1, 0, 1,
-0.9762251, -1.204065, -1.80698, 0.9215686, 1, 0, 1,
-0.9639219, -0.4317757, -3.019129, 0.9137255, 1, 0, 1,
-0.9563554, -0.9142647, -2.844857, 0.9098039, 1, 0, 1,
-0.9525601, -0.5764528, -3.641633, 0.9019608, 1, 0, 1,
-0.9517112, 0.1883968, -0.2893773, 0.8941177, 1, 0, 1,
-0.9501464, -1.801767, -2.213265, 0.8901961, 1, 0, 1,
-0.9484254, -0.3118681, -2.251361, 0.8823529, 1, 0, 1,
-0.9450322, -0.05549276, -1.237884, 0.8784314, 1, 0, 1,
-0.9366663, -0.8351371, -2.111456, 0.8705882, 1, 0, 1,
-0.9332165, 0.2877646, -0.1544286, 0.8666667, 1, 0, 1,
-0.9315988, 0.006176382, -1.364482, 0.8588235, 1, 0, 1,
-0.9311873, -0.8083298, -1.547794, 0.854902, 1, 0, 1,
-0.9286161, 0.2759742, 0.2580095, 0.8470588, 1, 0, 1,
-0.9283597, 0.2633235, 0.488259, 0.8431373, 1, 0, 1,
-0.9241728, 0.9462314, -0.1139585, 0.8352941, 1, 0, 1,
-0.9216909, 1.362643, -1.767163, 0.8313726, 1, 0, 1,
-0.917513, 0.06368708, -2.318696, 0.8235294, 1, 0, 1,
-0.9162555, -1.489262, -2.295748, 0.8196079, 1, 0, 1,
-0.9151119, -0.6304992, -1.888946, 0.8117647, 1, 0, 1,
-0.9130156, -0.2414721, -1.099733, 0.8078431, 1, 0, 1,
-0.9088649, 2.786579, -0.526155, 0.8, 1, 0, 1,
-0.9079758, 1.665607, 2.158907, 0.7921569, 1, 0, 1,
-0.9071832, 0.1654236, -1.966765, 0.7882353, 1, 0, 1,
-0.9048802, 0.7365899, -1.345925, 0.7803922, 1, 0, 1,
-0.9019045, -0.1901713, -3.206073, 0.7764706, 1, 0, 1,
-0.9004544, 1.264036, 0.1138161, 0.7686275, 1, 0, 1,
-0.8902446, -0.03568844, -1.458283, 0.7647059, 1, 0, 1,
-0.8901539, 0.4360285, -1.139006, 0.7568628, 1, 0, 1,
-0.8818382, 0.1130418, -1.416375, 0.7529412, 1, 0, 1,
-0.8792707, 0.9189494, -0.6142548, 0.7450981, 1, 0, 1,
-0.866789, 0.9147133, -0.9022665, 0.7411765, 1, 0, 1,
-0.865863, 1.825965, -0.4413599, 0.7333333, 1, 0, 1,
-0.8638667, -1.964782, -2.121976, 0.7294118, 1, 0, 1,
-0.8609892, 0.2641434, -1.453285, 0.7215686, 1, 0, 1,
-0.8573138, -2.678668, -3.912674, 0.7176471, 1, 0, 1,
-0.8570885, -0.1038603, -3.192791, 0.7098039, 1, 0, 1,
-0.8559745, 0.04291999, -1.931617, 0.7058824, 1, 0, 1,
-0.8518439, -0.8012444, -4.032845, 0.6980392, 1, 0, 1,
-0.8511202, -1.523158, -3.716763, 0.6901961, 1, 0, 1,
-0.8455887, -0.8576474, -3.450262, 0.6862745, 1, 0, 1,
-0.8443378, 0.7040783, -1.362308, 0.6784314, 1, 0, 1,
-0.8426136, -0.5907609, -3.144294, 0.6745098, 1, 0, 1,
-0.8390556, 1.298823, 0.2188753, 0.6666667, 1, 0, 1,
-0.8381851, -0.6010938, -3.163882, 0.6627451, 1, 0, 1,
-0.8379996, 1.958655, -1.058807, 0.654902, 1, 0, 1,
-0.8375382, 0.9478208, -1.890883, 0.6509804, 1, 0, 1,
-0.8350917, 1.051931, 0.0740781, 0.6431373, 1, 0, 1,
-0.8274392, -0.4383112, -2.908516, 0.6392157, 1, 0, 1,
-0.8223111, 0.4494177, -2.158396, 0.6313726, 1, 0, 1,
-0.8207393, -1.521471, -3.561979, 0.627451, 1, 0, 1,
-0.8201882, -0.2049274, -0.8536374, 0.6196079, 1, 0, 1,
-0.8145354, -1.323799, -1.717138, 0.6156863, 1, 0, 1,
-0.8125104, -0.04571376, -2.208406, 0.6078432, 1, 0, 1,
-0.8033484, -0.532699, -2.057219, 0.6039216, 1, 0, 1,
-0.8004869, -1.135522, -2.508428, 0.5960785, 1, 0, 1,
-0.8001198, 1.365425, -0.7954461, 0.5882353, 1, 0, 1,
-0.8001143, 1.001114, -1.050595, 0.5843138, 1, 0, 1,
-0.7972918, -0.6784406, -1.911818, 0.5764706, 1, 0, 1,
-0.7972121, -0.4068374, -1.878331, 0.572549, 1, 0, 1,
-0.7883106, -1.851124, -2.854588, 0.5647059, 1, 0, 1,
-0.782764, -0.3363515, -2.31472, 0.5607843, 1, 0, 1,
-0.782374, 0.260965, -2.289433, 0.5529412, 1, 0, 1,
-0.7808768, -1.177768, -2.562349, 0.5490196, 1, 0, 1,
-0.7790115, 0.9976471, 0.3081764, 0.5411765, 1, 0, 1,
-0.7759788, -0.1599071, -2.154742, 0.5372549, 1, 0, 1,
-0.7752747, -0.5673531, -1.314225, 0.5294118, 1, 0, 1,
-0.774654, -1.440521, -2.918887, 0.5254902, 1, 0, 1,
-0.7715049, -0.4867152, 0.04566914, 0.5176471, 1, 0, 1,
-0.7658579, 0.004984008, 0.02367077, 0.5137255, 1, 0, 1,
-0.764138, 0.765642, 0.2564725, 0.5058824, 1, 0, 1,
-0.7629703, -1.924897, -2.647392, 0.5019608, 1, 0, 1,
-0.7565802, 1.972373, -1.639166, 0.4941176, 1, 0, 1,
-0.7454323, 1.581368, -0.3956888, 0.4862745, 1, 0, 1,
-0.7427732, -1.124055, -3.322573, 0.4823529, 1, 0, 1,
-0.7407367, -0.8490276, -2.875518, 0.4745098, 1, 0, 1,
-0.740472, -0.0340086, -0.3929299, 0.4705882, 1, 0, 1,
-0.7342939, 1.031975, -0.4462626, 0.4627451, 1, 0, 1,
-0.7289028, 0.5717059, -2.277337, 0.4588235, 1, 0, 1,
-0.7215717, 0.2255031, -1.636677, 0.4509804, 1, 0, 1,
-0.7183205, 1.31294, 0.06446975, 0.4470588, 1, 0, 1,
-0.7146504, 1.429288, 0.4360849, 0.4392157, 1, 0, 1,
-0.7115363, 1.164937, -0.5322232, 0.4352941, 1, 0, 1,
-0.7090399, 0.670648, -0.312725, 0.427451, 1, 0, 1,
-0.7080521, 1.666819, -0.1743292, 0.4235294, 1, 0, 1,
-0.7019156, -1.311292, -3.354518, 0.4156863, 1, 0, 1,
-0.6991579, -0.3349385, -2.760806, 0.4117647, 1, 0, 1,
-0.6950334, 0.6056126, -1.688834, 0.4039216, 1, 0, 1,
-0.6940089, 1.650596, 0.099941, 0.3960784, 1, 0, 1,
-0.6876507, -0.3638137, -2.179442, 0.3921569, 1, 0, 1,
-0.6866978, 1.026131, 0.1564736, 0.3843137, 1, 0, 1,
-0.6808773, 0.4765512, -1.446826, 0.3803922, 1, 0, 1,
-0.6765866, -0.2991467, -0.9104652, 0.372549, 1, 0, 1,
-0.6765234, -0.2734432, -1.56066, 0.3686275, 1, 0, 1,
-0.6633725, -0.6125441, -3.709667, 0.3607843, 1, 0, 1,
-0.6563746, 1.071844, 1.326913, 0.3568628, 1, 0, 1,
-0.6509185, 0.2418271, -2.878291, 0.3490196, 1, 0, 1,
-0.6509081, 1.222695, 0.9683047, 0.345098, 1, 0, 1,
-0.6491218, 0.4849773, -1.195616, 0.3372549, 1, 0, 1,
-0.648545, -2.010251, -4.165283, 0.3333333, 1, 0, 1,
-0.6461372, 1.10212, 0.1108103, 0.3254902, 1, 0, 1,
-0.6449612, -0.1358447, -1.36272, 0.3215686, 1, 0, 1,
-0.6448082, -0.3520962, -0.2532386, 0.3137255, 1, 0, 1,
-0.6426166, -1.143848, -0.7184275, 0.3098039, 1, 0, 1,
-0.6418721, -1.070363, -2.96711, 0.3019608, 1, 0, 1,
-0.6382796, 1.491136, -0.9462393, 0.2941177, 1, 0, 1,
-0.6369619, -0.5699682, -2.033726, 0.2901961, 1, 0, 1,
-0.632789, -0.7365386, -1.315552, 0.282353, 1, 0, 1,
-0.6273146, 0.6111811, -1.34103, 0.2784314, 1, 0, 1,
-0.6262196, -0.1778609, -0.2757306, 0.2705882, 1, 0, 1,
-0.6210561, 0.5193637, 0.09898867, 0.2666667, 1, 0, 1,
-0.6172951, 0.2325978, -1.283704, 0.2588235, 1, 0, 1,
-0.6151367, -0.324271, -1.149606, 0.254902, 1, 0, 1,
-0.6140682, 0.4309948, -2.272157, 0.2470588, 1, 0, 1,
-0.6129197, -0.8097304, -3.559787, 0.2431373, 1, 0, 1,
-0.6100688, -0.4029659, -2.97487, 0.2352941, 1, 0, 1,
-0.6093967, 1.236334, -2.002223, 0.2313726, 1, 0, 1,
-0.6085659, -1.186453, -1.675485, 0.2235294, 1, 0, 1,
-0.6069974, -0.0162097, -1.485205, 0.2196078, 1, 0, 1,
-0.6038311, -1.259622, -3.78576, 0.2117647, 1, 0, 1,
-0.5994875, 0.1514867, -2.517786, 0.2078431, 1, 0, 1,
-0.5956312, -0.5231897, -0.9846631, 0.2, 1, 0, 1,
-0.5892792, 0.5285897, -0.908456, 0.1921569, 1, 0, 1,
-0.587764, 0.9052032, 0.2589431, 0.1882353, 1, 0, 1,
-0.5864242, -0.01925281, -0.9220753, 0.1803922, 1, 0, 1,
-0.5846577, -0.6608428, -1.840113, 0.1764706, 1, 0, 1,
-0.5829119, 1.155042, -1.144479, 0.1686275, 1, 0, 1,
-0.581267, 1.734383, 0.147073, 0.1647059, 1, 0, 1,
-0.5716015, -1.356952, -2.2808, 0.1568628, 1, 0, 1,
-0.5684279, 0.06715693, -2.054376, 0.1529412, 1, 0, 1,
-0.5641423, 0.09190448, -1.347234, 0.145098, 1, 0, 1,
-0.5620658, -1.31454, -3.234419, 0.1411765, 1, 0, 1,
-0.5601922, 0.04128496, 0.4290925, 0.1333333, 1, 0, 1,
-0.5589083, -0.01347155, -1.420668, 0.1294118, 1, 0, 1,
-0.5543458, 1.226555, -0.6510972, 0.1215686, 1, 0, 1,
-0.5528657, 1.383679, -0.200043, 0.1176471, 1, 0, 1,
-0.5488725, 1.739543, -2.125362, 0.1098039, 1, 0, 1,
-0.5487643, -2.484759, -3.518354, 0.1058824, 1, 0, 1,
-0.5412663, -0.5129618, -1.736645, 0.09803922, 1, 0, 1,
-0.5391212, 1.421566, 0.7565818, 0.09019608, 1, 0, 1,
-0.5375538, -0.3158521, -2.005005, 0.08627451, 1, 0, 1,
-0.5359637, 1.168528, 0.3870035, 0.07843138, 1, 0, 1,
-0.5339229, 1.709712, 1.594578, 0.07450981, 1, 0, 1,
-0.5311441, -0.9105943, -2.609249, 0.06666667, 1, 0, 1,
-0.5294554, 1.299451, -1.360527, 0.0627451, 1, 0, 1,
-0.5273736, -1.455159, -1.744986, 0.05490196, 1, 0, 1,
-0.5260835, 0.04197429, -0.1487146, 0.05098039, 1, 0, 1,
-0.5148614, 0.1317832, -0.7060189, 0.04313726, 1, 0, 1,
-0.5147065, -0.2669147, -2.160943, 0.03921569, 1, 0, 1,
-0.5123281, 0.740407, 0.074908, 0.03137255, 1, 0, 1,
-0.5115128, -0.4030268, -2.437231, 0.02745098, 1, 0, 1,
-0.5097322, 0.7997206, -1.065769, 0.01960784, 1, 0, 1,
-0.5084545, 0.00365065, -1.733518, 0.01568628, 1, 0, 1,
-0.5079401, -0.1849674, -1.442155, 0.007843138, 1, 0, 1,
-0.506094, -0.3349049, -2.453849, 0.003921569, 1, 0, 1,
-0.5027723, 0.1924528, -1.562487, 0, 1, 0.003921569, 1,
-0.5006143, 0.5464169, -0.4082196, 0, 1, 0.01176471, 1,
-0.4945162, -0.1526814, -1.249617, 0, 1, 0.01568628, 1,
-0.4931103, 1.242644, -0.5930822, 0, 1, 0.02352941, 1,
-0.4887191, -0.2455088, -3.515135, 0, 1, 0.02745098, 1,
-0.4874043, 0.1427716, -0.01597502, 0, 1, 0.03529412, 1,
-0.4841058, -1.097064, -3.23816, 0, 1, 0.03921569, 1,
-0.4840364, 0.8742064, -0.720323, 0, 1, 0.04705882, 1,
-0.4745811, 0.6428982, -0.9245952, 0, 1, 0.05098039, 1,
-0.4740398, 0.2351102, -2.541015, 0, 1, 0.05882353, 1,
-0.4703102, -0.6422884, -2.338609, 0, 1, 0.0627451, 1,
-0.451142, -0.6662265, -3.427665, 0, 1, 0.07058824, 1,
-0.4426479, 1.546452, -1.109837, 0, 1, 0.07450981, 1,
-0.4418805, -0.1658411, -0.8734662, 0, 1, 0.08235294, 1,
-0.4375157, -0.2258111, -1.627976, 0, 1, 0.08627451, 1,
-0.4343516, 0.5137056, -0.838376, 0, 1, 0.09411765, 1,
-0.433475, 0.423996, -1.181297, 0, 1, 0.1019608, 1,
-0.4271988, 0.7697358, -0.9359989, 0, 1, 0.1058824, 1,
-0.4269848, 1.599127, -1.42831, 0, 1, 0.1137255, 1,
-0.4240111, -2.088041, -2.435138, 0, 1, 0.1176471, 1,
-0.423683, -0.553013, -0.7025759, 0, 1, 0.1254902, 1,
-0.4235233, -0.7661324, -3.772783, 0, 1, 0.1294118, 1,
-0.4234152, -0.9385662, -2.118935, 0, 1, 0.1372549, 1,
-0.42241, -0.1279077, -1.671688, 0, 1, 0.1411765, 1,
-0.4157528, 0.1103249, 0.02100845, 0, 1, 0.1490196, 1,
-0.4156693, 1.267458, 0.1832448, 0, 1, 0.1529412, 1,
-0.4093554, -0.6390085, -1.765285, 0, 1, 0.1607843, 1,
-0.4092311, 0.7102117, -0.2986341, 0, 1, 0.1647059, 1,
-0.4071126, -0.2050282, -1.352577, 0, 1, 0.172549, 1,
-0.3999682, 1.149737, 0.2957259, 0, 1, 0.1764706, 1,
-0.3981386, -0.6671339, -2.721053, 0, 1, 0.1843137, 1,
-0.3917552, -0.1264199, -1.213869, 0, 1, 0.1882353, 1,
-0.3913864, -1.426502, -2.034461, 0, 1, 0.1960784, 1,
-0.3900438, 0.5663501, -0.3214095, 0, 1, 0.2039216, 1,
-0.3899529, 0.2032435, -0.6630103, 0, 1, 0.2078431, 1,
-0.3878196, -0.03685781, -1.230206, 0, 1, 0.2156863, 1,
-0.3835495, 1.46419, 1.322202, 0, 1, 0.2196078, 1,
-0.3756441, -0.5943646, -2.979685, 0, 1, 0.227451, 1,
-0.3743294, -0.6213097, -2.509636, 0, 1, 0.2313726, 1,
-0.3724329, -0.2510288, -1.443543, 0, 1, 0.2392157, 1,
-0.3655894, -0.02677061, -1.672903, 0, 1, 0.2431373, 1,
-0.3651728, -1.73374, -4.584684, 0, 1, 0.2509804, 1,
-0.3647651, -0.2454554, -1.196167, 0, 1, 0.254902, 1,
-0.3634144, -0.6768004, -3.05572, 0, 1, 0.2627451, 1,
-0.3610412, 0.3496479, 0.2409163, 0, 1, 0.2666667, 1,
-0.3609191, -0.3120995, -2.911226, 0, 1, 0.2745098, 1,
-0.3542035, 0.208209, -0.09205653, 0, 1, 0.2784314, 1,
-0.3519022, -0.4709329, -2.966283, 0, 1, 0.2862745, 1,
-0.3511419, 0.8975874, -0.4284995, 0, 1, 0.2901961, 1,
-0.3482808, 0.1849324, -1.246517, 0, 1, 0.2980392, 1,
-0.3470953, -0.1952835, -2.540525, 0, 1, 0.3058824, 1,
-0.3406579, -0.1753526, -2.278983, 0, 1, 0.3098039, 1,
-0.3371298, 0.8878711, 0.7351956, 0, 1, 0.3176471, 1,
-0.3354404, -0.5803432, -1.463466, 0, 1, 0.3215686, 1,
-0.3307525, 1.23629, 0.08861049, 0, 1, 0.3294118, 1,
-0.3299736, 0.5021613, 0.7455024, 0, 1, 0.3333333, 1,
-0.3282813, 0.0813197, -2.12907, 0, 1, 0.3411765, 1,
-0.3279723, -1.05277, -3.153907, 0, 1, 0.345098, 1,
-0.3278726, 0.6977637, -0.8315733, 0, 1, 0.3529412, 1,
-0.3243571, -0.5613882, -3.350242, 0, 1, 0.3568628, 1,
-0.3237694, -1.095439, -2.224738, 0, 1, 0.3647059, 1,
-0.3191407, 1.443681, -0.8305227, 0, 1, 0.3686275, 1,
-0.3177847, -1.22716, -4.058178, 0, 1, 0.3764706, 1,
-0.3138945, 0.5590926, -1.678781, 0, 1, 0.3803922, 1,
-0.3079096, -2.175447, -3.073021, 0, 1, 0.3882353, 1,
-0.3019799, 0.5889518, 0.07173193, 0, 1, 0.3921569, 1,
-0.2973475, 1.336301, -1.962113, 0, 1, 0.4, 1,
-0.295129, -0.4825071, -2.011755, 0, 1, 0.4078431, 1,
-0.2911209, -0.2781215, -0.7948354, 0, 1, 0.4117647, 1,
-0.2866612, 1.322503, -0.01793892, 0, 1, 0.4196078, 1,
-0.2847786, -1.012404, -4.244345, 0, 1, 0.4235294, 1,
-0.2826941, -0.2458708, -2.860365, 0, 1, 0.4313726, 1,
-0.2765104, 2.445143, -0.02474517, 0, 1, 0.4352941, 1,
-0.2765071, 0.9759836, -0.324008, 0, 1, 0.4431373, 1,
-0.27568, -0.04862369, -1.413414, 0, 1, 0.4470588, 1,
-0.2726621, 0.639936, -0.5871145, 0, 1, 0.454902, 1,
-0.269895, 0.03958313, -1.123874, 0, 1, 0.4588235, 1,
-0.2646679, -0.4881879, -2.720284, 0, 1, 0.4666667, 1,
-0.2635946, -0.4486738, -3.098955, 0, 1, 0.4705882, 1,
-0.2621402, 0.6944579, -1.432057, 0, 1, 0.4784314, 1,
-0.2519757, 0.03667623, -3.17477, 0, 1, 0.4823529, 1,
-0.251363, -1.298581, -2.477192, 0, 1, 0.4901961, 1,
-0.2501509, 0.8370132, 0.259497, 0, 1, 0.4941176, 1,
-0.2443652, -0.4876033, -3.673505, 0, 1, 0.5019608, 1,
-0.2437064, -1.043042, -2.756571, 0, 1, 0.509804, 1,
-0.228646, -0.4181193, -2.625075, 0, 1, 0.5137255, 1,
-0.2261606, -0.06150668, -2.969719, 0, 1, 0.5215687, 1,
-0.2236846, -1.155191, -3.077402, 0, 1, 0.5254902, 1,
-0.2207434, -0.9544348, -2.728541, 0, 1, 0.5333334, 1,
-0.2187257, -0.182922, 0.3826694, 0, 1, 0.5372549, 1,
-0.2185905, -0.2793207, -3.201526, 0, 1, 0.5450981, 1,
-0.218464, 1.374146, -1.103169, 0, 1, 0.5490196, 1,
-0.2127223, 0.1874524, -0.6291333, 0, 1, 0.5568628, 1,
-0.2078835, 1.819524, -1.304861, 0, 1, 0.5607843, 1,
-0.2073862, -0.5011564, -3.97261, 0, 1, 0.5686275, 1,
-0.2065039, 0.4566008, 0.5618203, 0, 1, 0.572549, 1,
-0.2062828, -0.476193, -1.568371, 0, 1, 0.5803922, 1,
-0.2035434, -0.2406494, -1.58444, 0, 1, 0.5843138, 1,
-0.2021271, -1.744837, -1.261631, 0, 1, 0.5921569, 1,
-0.2014159, 3.066558, 0.2276154, 0, 1, 0.5960785, 1,
-0.2011869, 0.1163363, -2.210579, 0, 1, 0.6039216, 1,
-0.200762, 0.8826336, 0.2700638, 0, 1, 0.6117647, 1,
-0.1989273, -2.163183, -2.857459, 0, 1, 0.6156863, 1,
-0.1979875, -0.6224644, -3.773099, 0, 1, 0.6235294, 1,
-0.1942193, -1.122612, -4.853991, 0, 1, 0.627451, 1,
-0.188613, -0.1645688, -0.8364226, 0, 1, 0.6352941, 1,
-0.1844334, 0.04293481, -0.440644, 0, 1, 0.6392157, 1,
-0.1842875, -1.040668, -2.825629, 0, 1, 0.6470588, 1,
-0.184078, -0.3967838, -1.366763, 0, 1, 0.6509804, 1,
-0.1802032, -1.197643, -5.815753, 0, 1, 0.6588235, 1,
-0.178385, 3.006788, 1.002343, 0, 1, 0.6627451, 1,
-0.1726919, -1.157106, -3.47851, 0, 1, 0.6705883, 1,
-0.1719958, 0.7541651, -0.4608419, 0, 1, 0.6745098, 1,
-0.1689221, -0.200128, -2.538483, 0, 1, 0.682353, 1,
-0.1675965, 0.529521, -0.6461997, 0, 1, 0.6862745, 1,
-0.1672133, -0.09786943, 0.6692695, 0, 1, 0.6941177, 1,
-0.1640303, -0.2748655, -1.93269, 0, 1, 0.7019608, 1,
-0.163898, -0.02838909, 0.6364485, 0, 1, 0.7058824, 1,
-0.1617842, 1.613288, 0.1800579, 0, 1, 0.7137255, 1,
-0.1607111, 1.000781, -0.5897605, 0, 1, 0.7176471, 1,
-0.1591722, -1.275825, -4.486772, 0, 1, 0.7254902, 1,
-0.1506706, -0.01556664, -1.439825, 0, 1, 0.7294118, 1,
-0.149097, -0.1922188, -2.461163, 0, 1, 0.7372549, 1,
-0.1431267, 0.5273977, -0.1923969, 0, 1, 0.7411765, 1,
-0.1388566, 0.4926629, -1.002944, 0, 1, 0.7490196, 1,
-0.1352593, 0.7835219, -0.06795357, 0, 1, 0.7529412, 1,
-0.1346678, 1.011375, 1.060122, 0, 1, 0.7607843, 1,
-0.134528, -2.117173, -4.149659, 0, 1, 0.7647059, 1,
-0.1322274, -0.5227729, -3.688604, 0, 1, 0.772549, 1,
-0.1315089, -0.9968678, -2.819793, 0, 1, 0.7764706, 1,
-0.1300976, 0.08859323, -2.134069, 0, 1, 0.7843137, 1,
-0.1260612, -0.8978669, -4.075541, 0, 1, 0.7882353, 1,
-0.1256678, -1.562682, -1.601228, 0, 1, 0.7960784, 1,
-0.1253302, -0.5436938, -1.445365, 0, 1, 0.8039216, 1,
-0.1229644, -1.746922, -2.845381, 0, 1, 0.8078431, 1,
-0.1204332, -2.15333, -2.719436, 0, 1, 0.8156863, 1,
-0.1185599, 0.1466013, 1.565482, 0, 1, 0.8196079, 1,
-0.1170766, -0.4102979, -3.967652, 0, 1, 0.827451, 1,
-0.1110066, -2.782081, -1.590053, 0, 1, 0.8313726, 1,
-0.110438, 0.8492544, -0.6322255, 0, 1, 0.8392157, 1,
-0.1038641, -0.8497596, -3.873617, 0, 1, 0.8431373, 1,
-0.1032696, 1.09669, -0.5946475, 0, 1, 0.8509804, 1,
-0.09618413, -0.129883, -1.849198, 0, 1, 0.854902, 1,
-0.08621118, 1.140325, 0.7568803, 0, 1, 0.8627451, 1,
-0.08396861, 0.002766799, -0.08848143, 0, 1, 0.8666667, 1,
-0.08250873, 0.3827184, 0.5344083, 0, 1, 0.8745098, 1,
-0.08047893, 0.2661787, -1.680233, 0, 1, 0.8784314, 1,
-0.07796105, -1.792506, -2.475496, 0, 1, 0.8862745, 1,
-0.07638548, -1.093913, -3.07654, 0, 1, 0.8901961, 1,
-0.07633722, 0.2032171, -0.3013116, 0, 1, 0.8980392, 1,
-0.07368199, 0.1484951, -1.819602, 0, 1, 0.9058824, 1,
-0.06271633, -0.9782751, -2.903018, 0, 1, 0.9098039, 1,
-0.06141897, 1.223245, 2.018278, 0, 1, 0.9176471, 1,
-0.05999589, 0.444071, 0.2910489, 0, 1, 0.9215686, 1,
-0.05899844, 0.05823405, 1.356715, 0, 1, 0.9294118, 1,
-0.05843049, 0.6438436, 0.4238904, 0, 1, 0.9333333, 1,
-0.05438833, -0.6804549, -4.145691, 0, 1, 0.9411765, 1,
-0.05142907, 0.1726689, -0.5856988, 0, 1, 0.945098, 1,
-0.04898622, 0.7308998, 0.7464621, 0, 1, 0.9529412, 1,
-0.04570428, -1.651457, -2.478608, 0, 1, 0.9568627, 1,
-0.04244854, 0.661459, 0.6817231, 0, 1, 0.9647059, 1,
-0.0386581, 1.03407, -0.7250784, 0, 1, 0.9686275, 1,
-0.03787189, -3.836315e-05, -0.803111, 0, 1, 0.9764706, 1,
-0.03357219, 0.4329304, 0.5174624, 0, 1, 0.9803922, 1,
-0.03175329, -0.2766316, -4.342784, 0, 1, 0.9882353, 1,
-0.03153127, -0.6255014, -3.226046, 0, 1, 0.9921569, 1,
-0.02354183, -0.8545102, -1.858781, 0, 1, 1, 1,
-0.02184049, -0.7390485, -3.846648, 0, 0.9921569, 1, 1,
-0.01967176, 0.9826583, -0.2525212, 0, 0.9882353, 1, 1,
-0.01233759, 1.655061, 0.4539069, 0, 0.9803922, 1, 1,
-0.01038284, -1.492473, -4.015872, 0, 0.9764706, 1, 1,
-0.006942309, 0.2381944, -1.256913, 0, 0.9686275, 1, 1,
-0.004521563, -0.1963208, -5.418311, 0, 0.9647059, 1, 1,
-0.004331393, -1.968317, -3.001468, 0, 0.9568627, 1, 1,
-0.003788975, -0.8192294, -4.227894, 0, 0.9529412, 1, 1,
-0.002203358, -0.3965228, -1.922909, 0, 0.945098, 1, 1,
0.003896002, -1.603698, 2.274378, 0, 0.9411765, 1, 1,
0.004072363, 0.8027373, -0.4567246, 0, 0.9333333, 1, 1,
0.005009235, 1.507086, -0.05268255, 0, 0.9294118, 1, 1,
0.008418911, 0.1309145, 0.6918735, 0, 0.9215686, 1, 1,
0.009104937, -0.254821, 3.250048, 0, 0.9176471, 1, 1,
0.009972572, -0.03662169, 0.7097571, 0, 0.9098039, 1, 1,
0.01036446, -1.559471, 3.433419, 0, 0.9058824, 1, 1,
0.01071213, 0.111977, -0.984084, 0, 0.8980392, 1, 1,
0.01199419, -0.6014635, 3.138385, 0, 0.8901961, 1, 1,
0.01293265, 2.161561, -1.205819, 0, 0.8862745, 1, 1,
0.01344403, 1.768054, -0.3266647, 0, 0.8784314, 1, 1,
0.01472655, 1.45344, 0.3950875, 0, 0.8745098, 1, 1,
0.01825941, 0.5765853, 2.253948, 0, 0.8666667, 1, 1,
0.0198599, 1.71321, 0.899042, 0, 0.8627451, 1, 1,
0.01999404, -0.7993794, 3.140563, 0, 0.854902, 1, 1,
0.02111688, -0.4472786, 2.974645, 0, 0.8509804, 1, 1,
0.02611232, 1.06035, -0.3075286, 0, 0.8431373, 1, 1,
0.02670571, 0.4179921, 0.7218089, 0, 0.8392157, 1, 1,
0.03049689, 1.236622, 1.241246, 0, 0.8313726, 1, 1,
0.03114423, -0.5975927, 2.825828, 0, 0.827451, 1, 1,
0.03123642, -0.134619, 0.3409103, 0, 0.8196079, 1, 1,
0.03321825, 0.2583977, 0.7485772, 0, 0.8156863, 1, 1,
0.04115267, -0.1127065, 3.012879, 0, 0.8078431, 1, 1,
0.04594396, 0.2130008, 1.483658, 0, 0.8039216, 1, 1,
0.04808266, 2.600882, 1.028427, 0, 0.7960784, 1, 1,
0.04833941, 0.5742722, 0.03222513, 0, 0.7882353, 1, 1,
0.05583529, -0.4335479, 4.377602, 0, 0.7843137, 1, 1,
0.06140172, 0.6735004, -0.1930455, 0, 0.7764706, 1, 1,
0.06548949, -0.3537603, -0.02437919, 0, 0.772549, 1, 1,
0.06663444, 0.2420544, 0.3542647, 0, 0.7647059, 1, 1,
0.07212608, 0.8004327, -0.07617702, 0, 0.7607843, 1, 1,
0.07593074, 0.3350264, -1.433373, 0, 0.7529412, 1, 1,
0.07698301, -0.8750532, 3.430321, 0, 0.7490196, 1, 1,
0.07766788, -0.6097412, 3.355879, 0, 0.7411765, 1, 1,
0.08443473, 0.8586666, 1.224185, 0, 0.7372549, 1, 1,
0.08616321, -0.9153326, 2.821, 0, 0.7294118, 1, 1,
0.08619037, 0.01058122, 0.7793274, 0, 0.7254902, 1, 1,
0.08695325, -0.4691044, 3.047834, 0, 0.7176471, 1, 1,
0.08831733, -0.8076401, 3.285414, 0, 0.7137255, 1, 1,
0.08836747, -0.1517859, 3.751264, 0, 0.7058824, 1, 1,
0.0883904, 0.7872823, 0.5285314, 0, 0.6980392, 1, 1,
0.09461006, 1.522981, 1.979735, 0, 0.6941177, 1, 1,
0.09627529, -1.062325, 2.427009, 0, 0.6862745, 1, 1,
0.107541, -0.2836444, 2.205041, 0, 0.682353, 1, 1,
0.1079996, -0.2467241, 2.076655, 0, 0.6745098, 1, 1,
0.1099313, -0.8755081, 2.312986, 0, 0.6705883, 1, 1,
0.1127539, -0.305942, 1.657813, 0, 0.6627451, 1, 1,
0.113724, -1.079979, 3.495207, 0, 0.6588235, 1, 1,
0.1149644, -0.5295995, 2.401785, 0, 0.6509804, 1, 1,
0.1153606, 1.719625, -0.06674369, 0, 0.6470588, 1, 1,
0.1154783, -0.8627185, 1.104653, 0, 0.6392157, 1, 1,
0.1176668, 1.231006, -0.3941808, 0, 0.6352941, 1, 1,
0.1193943, 0.1973103, 1.074495, 0, 0.627451, 1, 1,
0.1202301, -1.076144, 2.17827, 0, 0.6235294, 1, 1,
0.1234349, -1.438342, 1.408957, 0, 0.6156863, 1, 1,
0.1240181, -1.648006, 1.802867, 0, 0.6117647, 1, 1,
0.1246424, -0.02144411, 2.252953, 0, 0.6039216, 1, 1,
0.1255313, -1.865463, 3.394057, 0, 0.5960785, 1, 1,
0.1255515, -0.9845234, 3.287448, 0, 0.5921569, 1, 1,
0.1260508, -0.8322948, 3.547598, 0, 0.5843138, 1, 1,
0.1305769, -0.4132888, 2.999201, 0, 0.5803922, 1, 1,
0.1313176, 1.206411, 0.3357342, 0, 0.572549, 1, 1,
0.1384292, 0.9382361, 1.870018, 0, 0.5686275, 1, 1,
0.1387927, -1.165341, 2.63927, 0, 0.5607843, 1, 1,
0.1392268, 0.7458772, -0.3955027, 0, 0.5568628, 1, 1,
0.1396459, 1.96519, -1.048849, 0, 0.5490196, 1, 1,
0.1474282, -0.3295394, 2.003896, 0, 0.5450981, 1, 1,
0.149194, 0.6804118, -2.715447, 0, 0.5372549, 1, 1,
0.1531675, 1.269703, -0.7191189, 0, 0.5333334, 1, 1,
0.1638259, 0.2305243, -0.1878711, 0, 0.5254902, 1, 1,
0.1662755, 0.8550592, 2.096857, 0, 0.5215687, 1, 1,
0.1665156, -0.6300102, 3.138259, 0, 0.5137255, 1, 1,
0.1687197, -0.3686924, 2.611102, 0, 0.509804, 1, 1,
0.172284, 1.168759, -0.19631, 0, 0.5019608, 1, 1,
0.1748612, 0.5992044, 0.02402698, 0, 0.4941176, 1, 1,
0.1764049, 0.02331845, 0.05370838, 0, 0.4901961, 1, 1,
0.1788126, 0.5584468, -0.1629522, 0, 0.4823529, 1, 1,
0.1789227, -1.685017, 4.341917, 0, 0.4784314, 1, 1,
0.180504, 0.3154424, 1.310404, 0, 0.4705882, 1, 1,
0.1849236, -2.111104, 3.431473, 0, 0.4666667, 1, 1,
0.1863827, 0.6436952, -0.7847716, 0, 0.4588235, 1, 1,
0.1918384, 0.2236672, 2.111217, 0, 0.454902, 1, 1,
0.1945145, 0.5744501, 1.030134, 0, 0.4470588, 1, 1,
0.1992598, 0.216859, 0.7051031, 0, 0.4431373, 1, 1,
0.2024174, 0.7091038, 0.6986066, 0, 0.4352941, 1, 1,
0.206409, -2.180142, 4.038018, 0, 0.4313726, 1, 1,
0.2103524, 0.2258334, 1.251899, 0, 0.4235294, 1, 1,
0.2147431, -0.0007745795, 0.4746873, 0, 0.4196078, 1, 1,
0.222677, -1.519592, 3.912158, 0, 0.4117647, 1, 1,
0.2257595, -0.218998, 0.8952363, 0, 0.4078431, 1, 1,
0.230112, 0.08889907, 2.178138, 0, 0.4, 1, 1,
0.2329411, 0.2593172, 0.2194649, 0, 0.3921569, 1, 1,
0.233435, 1.450832, 0.4680631, 0, 0.3882353, 1, 1,
0.23427, -1.190495, 3.896663, 0, 0.3803922, 1, 1,
0.2366555, 0.7175926, 0.4837514, 0, 0.3764706, 1, 1,
0.2445106, 0.08371893, 1.32592, 0, 0.3686275, 1, 1,
0.2468942, 1.145744, -1.114432, 0, 0.3647059, 1, 1,
0.256385, -0.03718257, 0.581146, 0, 0.3568628, 1, 1,
0.262056, 0.2465715, -0.1589378, 0, 0.3529412, 1, 1,
0.2645379, -0.0175625, 1.68014, 0, 0.345098, 1, 1,
0.2660582, 0.1255503, 1.74166, 0, 0.3411765, 1, 1,
0.2673683, -0.6389641, 1.969083, 0, 0.3333333, 1, 1,
0.2680768, -0.5503525, 3.206473, 0, 0.3294118, 1, 1,
0.2706684, -0.1177355, 2.77204, 0, 0.3215686, 1, 1,
0.2737063, 0.4842439, 0.9176573, 0, 0.3176471, 1, 1,
0.2741028, 0.2637575, 0.6553478, 0, 0.3098039, 1, 1,
0.2775167, -1.313932, 3.6366, 0, 0.3058824, 1, 1,
0.2803348, -0.09570692, 3.424874, 0, 0.2980392, 1, 1,
0.2823697, -1.289705, 2.368156, 0, 0.2901961, 1, 1,
0.2846727, -0.4989785, 2.762437, 0, 0.2862745, 1, 1,
0.2881273, -0.2588913, 3.639617, 0, 0.2784314, 1, 1,
0.2891271, 1.566182, 1.786856, 0, 0.2745098, 1, 1,
0.2919491, 0.2662439, 0.1686402, 0, 0.2666667, 1, 1,
0.2938277, 0.2331177, 0.2621169, 0, 0.2627451, 1, 1,
0.2971129, 0.3242137, 0.710282, 0, 0.254902, 1, 1,
0.3002542, -0.1608897, 1.076596, 0, 0.2509804, 1, 1,
0.3046676, -0.9905944, 1.359601, 0, 0.2431373, 1, 1,
0.3128621, 0.6183925, 3.004133, 0, 0.2392157, 1, 1,
0.3135715, -0.325262, 1.542043, 0, 0.2313726, 1, 1,
0.3167404, 0.3596296, 1.049943, 0, 0.227451, 1, 1,
0.3310359, 0.8167702, -0.1919706, 0, 0.2196078, 1, 1,
0.340699, 1.385921, 0.2800517, 0, 0.2156863, 1, 1,
0.3408948, 0.8400907, 1.288527, 0, 0.2078431, 1, 1,
0.3431109, 0.05543484, -1.059248, 0, 0.2039216, 1, 1,
0.3478724, -2.076021, 3.268943, 0, 0.1960784, 1, 1,
0.3525147, -0.08927836, 3.040927, 0, 0.1882353, 1, 1,
0.353278, -0.8696825, 2.898595, 0, 0.1843137, 1, 1,
0.3555436, 0.742109, 1.716999, 0, 0.1764706, 1, 1,
0.3555447, 0.6359326, 0.3102895, 0, 0.172549, 1, 1,
0.3565295, 0.7205558, 1.294825, 0, 0.1647059, 1, 1,
0.3566416, -0.6245899, 3.51117, 0, 0.1607843, 1, 1,
0.3602214, 0.2210981, 1.383449, 0, 0.1529412, 1, 1,
0.3608485, 0.9875902, 0.6322197, 0, 0.1490196, 1, 1,
0.3652197, 0.3275344, 0.6892657, 0, 0.1411765, 1, 1,
0.3667139, 0.2492062, 0.512254, 0, 0.1372549, 1, 1,
0.368057, -1.579406, 3.562679, 0, 0.1294118, 1, 1,
0.3769212, -0.05842507, 1.889933, 0, 0.1254902, 1, 1,
0.3797922, -0.9683287, 1.666452, 0, 0.1176471, 1, 1,
0.3805279, -1.223344, 1.784517, 0, 0.1137255, 1, 1,
0.386161, -0.274776, 1.976966, 0, 0.1058824, 1, 1,
0.3919065, 0.2670364, 0.08327841, 0, 0.09803922, 1, 1,
0.395159, -0.478688, 1.481563, 0, 0.09411765, 1, 1,
0.4032679, 0.4452664, 0.1125581, 0, 0.08627451, 1, 1,
0.4048677, -1.88868, 0.922572, 0, 0.08235294, 1, 1,
0.4063538, 0.812608, 2.088741, 0, 0.07450981, 1, 1,
0.4083205, -0.1673054, -0.243377, 0, 0.07058824, 1, 1,
0.4095874, 1.461884, 1.28983, 0, 0.0627451, 1, 1,
0.4142627, -1.492091, 1.8989, 0, 0.05882353, 1, 1,
0.4186974, -2.720134, 3.711092, 0, 0.05098039, 1, 1,
0.4214402, 1.47462, -0.7494009, 0, 0.04705882, 1, 1,
0.4258053, -1.297282, 4.864323, 0, 0.03921569, 1, 1,
0.4282448, -0.2396143, 3.200663, 0, 0.03529412, 1, 1,
0.4298505, 1.766882, 0.5380079, 0, 0.02745098, 1, 1,
0.430779, -0.5944596, 4.233673, 0, 0.02352941, 1, 1,
0.4443249, -0.3288962, 1.529126, 0, 0.01568628, 1, 1,
0.4476887, 1.067061, -1.206367, 0, 0.01176471, 1, 1,
0.4488969, -0.7301006, 2.865014, 0, 0.003921569, 1, 1,
0.4560914, -0.05885467, 1.325925, 0.003921569, 0, 1, 1,
0.4577891, 0.8601182, 0.7443463, 0.007843138, 0, 1, 1,
0.4655891, 0.5121268, 1.607881, 0.01568628, 0, 1, 1,
0.468807, -0.2286629, 0.06653699, 0.01960784, 0, 1, 1,
0.47127, -0.02452468, -0.1821056, 0.02745098, 0, 1, 1,
0.4719509, -0.08332041, 1.337623, 0.03137255, 0, 1, 1,
0.4760388, -0.6714618, 2.104704, 0.03921569, 0, 1, 1,
0.4777882, -1.171026, 3.114199, 0.04313726, 0, 1, 1,
0.4825012, -0.06219299, 2.18945, 0.05098039, 0, 1, 1,
0.483118, -1.314786, 3.516028, 0.05490196, 0, 1, 1,
0.4865978, -0.8192016, 0.7105808, 0.0627451, 0, 1, 1,
0.4967053, -0.7271355, 0.8844423, 0.06666667, 0, 1, 1,
0.497963, 1.158747, 1.048263, 0.07450981, 0, 1, 1,
0.498211, -0.6897522, 4.083609, 0.07843138, 0, 1, 1,
0.4985508, -0.3586014, 0.391797, 0.08627451, 0, 1, 1,
0.5027469, 1.795978, 0.4058973, 0.09019608, 0, 1, 1,
0.5079326, -1.155878, 0.2560466, 0.09803922, 0, 1, 1,
0.5117072, 0.1923168, 0.7548738, 0.1058824, 0, 1, 1,
0.5129389, 0.8266979, -0.7705094, 0.1098039, 0, 1, 1,
0.5182555, 1.140925, 0.3718581, 0.1176471, 0, 1, 1,
0.521869, 0.1534555, 0.09129008, 0.1215686, 0, 1, 1,
0.5273352, 0.04382357, 3.64694, 0.1294118, 0, 1, 1,
0.5285679, 2.929413, 2.290061, 0.1333333, 0, 1, 1,
0.5327076, -1.576492, 0.9679053, 0.1411765, 0, 1, 1,
0.5421598, 0.6478825, -0.49339, 0.145098, 0, 1, 1,
0.5437182, -0.2728837, 1.68489, 0.1529412, 0, 1, 1,
0.5438039, -0.1946042, 1.181189, 0.1568628, 0, 1, 1,
0.5474091, 0.04506559, 1.142882, 0.1647059, 0, 1, 1,
0.5479269, -1.135549, 3.527899, 0.1686275, 0, 1, 1,
0.5480067, -0.1542662, 1.520837, 0.1764706, 0, 1, 1,
0.5486742, -1.583219, 3.213622, 0.1803922, 0, 1, 1,
0.5491769, 0.6341641, 0.06472579, 0.1882353, 0, 1, 1,
0.5499309, 0.3971616, 2.757383, 0.1921569, 0, 1, 1,
0.5521578, -0.6655318, 2.41315, 0.2, 0, 1, 1,
0.5524732, 0.2506464, 1.673236, 0.2078431, 0, 1, 1,
0.5533444, -0.1082727, 0.9943548, 0.2117647, 0, 1, 1,
0.5552608, -1.08123, 4.312278, 0.2196078, 0, 1, 1,
0.5570964, 1.035948, 0.378859, 0.2235294, 0, 1, 1,
0.5587435, -2.017316, 3.902581, 0.2313726, 0, 1, 1,
0.5630206, -0.2791232, 3.472832, 0.2352941, 0, 1, 1,
0.5631064, -1.947521, 2.228789, 0.2431373, 0, 1, 1,
0.5650687, -0.8968605, 3.128172, 0.2470588, 0, 1, 1,
0.56889, -0.7323536, 1.234341, 0.254902, 0, 1, 1,
0.5706367, 0.2355748, 3.036896, 0.2588235, 0, 1, 1,
0.5723555, -1.192468, 2.517104, 0.2666667, 0, 1, 1,
0.5783041, -0.7974681, 2.634831, 0.2705882, 0, 1, 1,
0.5785976, -0.1284773, 0.7643597, 0.2784314, 0, 1, 1,
0.5815778, 0.4731386, 1.048349, 0.282353, 0, 1, 1,
0.5826786, -0.8023788, 1.992603, 0.2901961, 0, 1, 1,
0.593689, 0.1789326, 1.349707, 0.2941177, 0, 1, 1,
0.5948921, -0.5591918, 2.979389, 0.3019608, 0, 1, 1,
0.6090083, 0.6040555, 0.6696425, 0.3098039, 0, 1, 1,
0.6098477, -1.606188, 2.586454, 0.3137255, 0, 1, 1,
0.6121446, -0.5983689, -0.259552, 0.3215686, 0, 1, 1,
0.6129063, 1.537416, -1.586273, 0.3254902, 0, 1, 1,
0.6173201, 2.480379, -0.1522215, 0.3333333, 0, 1, 1,
0.6173661, -0.08462798, 0.6598457, 0.3372549, 0, 1, 1,
0.6197369, -0.4846954, 3.6164, 0.345098, 0, 1, 1,
0.6199138, 0.7940943, -0.1684277, 0.3490196, 0, 1, 1,
0.6279509, 0.00425382, 2.042979, 0.3568628, 0, 1, 1,
0.6289269, 1.4254, 0.6360846, 0.3607843, 0, 1, 1,
0.6342217, -1.868606, 3.700374, 0.3686275, 0, 1, 1,
0.6348836, 0.2337724, 1.752408, 0.372549, 0, 1, 1,
0.6357386, 1.622103, 0.7666515, 0.3803922, 0, 1, 1,
0.636683, -0.4475614, 2.22909, 0.3843137, 0, 1, 1,
0.637035, -0.0819061, 1.065467, 0.3921569, 0, 1, 1,
0.6509719, 1.072793, 1.535907, 0.3960784, 0, 1, 1,
0.6583279, 0.6060182, 0.5588456, 0.4039216, 0, 1, 1,
0.6641029, 0.1769983, -0.2265348, 0.4117647, 0, 1, 1,
0.6660182, -1.891749, 0.7681263, 0.4156863, 0, 1, 1,
0.6675013, 2.120119, 0.8200223, 0.4235294, 0, 1, 1,
0.668158, -0.7411684, 2.828631, 0.427451, 0, 1, 1,
0.6696544, 1.847049, 0.648702, 0.4352941, 0, 1, 1,
0.6754579, 0.8045142, 0.1530676, 0.4392157, 0, 1, 1,
0.6763678, 1.133349, -0.3835618, 0.4470588, 0, 1, 1,
0.6786929, -0.2796169, 2.072896, 0.4509804, 0, 1, 1,
0.6793728, 1.078617, 0.4526511, 0.4588235, 0, 1, 1,
0.6847102, 1.117581, 0.3937567, 0.4627451, 0, 1, 1,
0.6873757, -0.6444568, 3.132729, 0.4705882, 0, 1, 1,
0.6920881, -0.1945462, 1.627119, 0.4745098, 0, 1, 1,
0.6929583, -0.9654447, 2.939281, 0.4823529, 0, 1, 1,
0.6959669, 0.754357, 1.61034, 0.4862745, 0, 1, 1,
0.702432, -0.6998415, 0.9751719, 0.4941176, 0, 1, 1,
0.7070293, 0.2937701, 0.3497619, 0.5019608, 0, 1, 1,
0.7072232, -0.08009081, 2.287745, 0.5058824, 0, 1, 1,
0.7116234, 0.1843466, 2.262189, 0.5137255, 0, 1, 1,
0.713582, -1.867388, 3.80513, 0.5176471, 0, 1, 1,
0.7150265, 0.337548, -0.02540897, 0.5254902, 0, 1, 1,
0.7219608, -0.8837141, 2.810595, 0.5294118, 0, 1, 1,
0.7250599, -0.8800794, 1.915664, 0.5372549, 0, 1, 1,
0.7257474, -1.187573, 2.652628, 0.5411765, 0, 1, 1,
0.7257804, -0.7142105, 3.370838, 0.5490196, 0, 1, 1,
0.7287308, -0.4547778, 0.7555099, 0.5529412, 0, 1, 1,
0.7301859, 0.1725496, 0.4484842, 0.5607843, 0, 1, 1,
0.73663, -0.1037236, 1.767897, 0.5647059, 0, 1, 1,
0.7437375, 0.1112252, 0.1538631, 0.572549, 0, 1, 1,
0.7488271, -2.35635, 1.408301, 0.5764706, 0, 1, 1,
0.7651631, 1.635667, 2.047129, 0.5843138, 0, 1, 1,
0.7753089, -0.2379162, 2.311019, 0.5882353, 0, 1, 1,
0.7763091, 0.7097397, 1.408875, 0.5960785, 0, 1, 1,
0.7785391, -1.157489, 1.164053, 0.6039216, 0, 1, 1,
0.7814038, -1.125038, 4.087557, 0.6078432, 0, 1, 1,
0.7815367, -1.247158, 3.058692, 0.6156863, 0, 1, 1,
0.7822281, 0.919466, 1.986103, 0.6196079, 0, 1, 1,
0.7860464, -1.030985, 1.558949, 0.627451, 0, 1, 1,
0.7874771, 1.34137, -0.602003, 0.6313726, 0, 1, 1,
0.7891542, -0.9350466, 2.080331, 0.6392157, 0, 1, 1,
0.8003569, -0.1340566, 1.076972, 0.6431373, 0, 1, 1,
0.8008289, -0.2615649, 3.298207, 0.6509804, 0, 1, 1,
0.8055665, 0.1702675, 1.937561, 0.654902, 0, 1, 1,
0.8074543, -1.436317, 2.697929, 0.6627451, 0, 1, 1,
0.8123526, -0.8838044, 1.745941, 0.6666667, 0, 1, 1,
0.8213883, 0.1647663, 1.235551, 0.6745098, 0, 1, 1,
0.8224579, -0.3589669, 1.359749, 0.6784314, 0, 1, 1,
0.8323935, -1.642261, 2.964519, 0.6862745, 0, 1, 1,
0.8353577, -2.497901, 4.240684, 0.6901961, 0, 1, 1,
0.8373553, -0.8987674, 1.25749, 0.6980392, 0, 1, 1,
0.8409947, -0.3025889, 2.06049, 0.7058824, 0, 1, 1,
0.8420616, -0.2456867, 1.53013, 0.7098039, 0, 1, 1,
0.8447214, 1.363415, -1.050501, 0.7176471, 0, 1, 1,
0.8595989, -0.6612987, 3.416704, 0.7215686, 0, 1, 1,
0.8601903, -0.9152826, 0.8355752, 0.7294118, 0, 1, 1,
0.8629188, 0.6224929, 1.117259, 0.7333333, 0, 1, 1,
0.8646268, 1.96258, 0.429924, 0.7411765, 0, 1, 1,
0.8662009, 0.9506956, 0.7009471, 0.7450981, 0, 1, 1,
0.8666354, 0.7096183, 0.0370383, 0.7529412, 0, 1, 1,
0.8669298, 0.3989047, 0.8066519, 0.7568628, 0, 1, 1,
0.8674615, 1.069642, 0.595233, 0.7647059, 0, 1, 1,
0.8703331, -1.366187, 2.608142, 0.7686275, 0, 1, 1,
0.878586, -0.567117, 4.019083, 0.7764706, 0, 1, 1,
0.8799256, -0.1407444, 0.2909819, 0.7803922, 0, 1, 1,
0.8800992, 0.6546652, 0.8105968, 0.7882353, 0, 1, 1,
0.8854532, 1.204175, -1.409195, 0.7921569, 0, 1, 1,
0.886987, -0.6968291, 1.614414, 0.8, 0, 1, 1,
0.8879561, 0.2735267, 1.006013, 0.8078431, 0, 1, 1,
0.8966477, 0.04065535, 0.9127094, 0.8117647, 0, 1, 1,
0.8975503, -0.7169399, 2.993259, 0.8196079, 0, 1, 1,
0.8998933, 1.650894, 0.3760915, 0.8235294, 0, 1, 1,
0.9008963, 1.491352, -0.3126785, 0.8313726, 0, 1, 1,
0.9012293, -2.403607, 2.117768, 0.8352941, 0, 1, 1,
0.902083, -0.9083517, 1.367387, 0.8431373, 0, 1, 1,
0.9025005, -0.8058454, 1.395663, 0.8470588, 0, 1, 1,
0.9039354, 0.4557184, 2.524214, 0.854902, 0, 1, 1,
0.9045265, 0.9571487, 2.077785, 0.8588235, 0, 1, 1,
0.9050212, -0.1416512, 2.557665, 0.8666667, 0, 1, 1,
0.9071871, 0.1747237, 1.865777, 0.8705882, 0, 1, 1,
0.9092034, 1.466917, 1.585781, 0.8784314, 0, 1, 1,
0.9096579, 0.5507375, 1.687521, 0.8823529, 0, 1, 1,
0.9146235, 0.1310751, 1.817365, 0.8901961, 0, 1, 1,
0.916106, 0.7051019, 1.661524, 0.8941177, 0, 1, 1,
0.9177517, -0.1738351, 2.071577, 0.9019608, 0, 1, 1,
0.941338, -1.255921, 2.675497, 0.9098039, 0, 1, 1,
0.9416639, -0.3404641, 1.517833, 0.9137255, 0, 1, 1,
0.9504071, -0.1215643, 1.158253, 0.9215686, 0, 1, 1,
0.951211, -0.4010135, 3.184734, 0.9254902, 0, 1, 1,
0.951618, 0.1532976, 1.324874, 0.9333333, 0, 1, 1,
0.9572414, -1.199641, 2.924734, 0.9372549, 0, 1, 1,
0.9612683, 0.4309965, -0.0655754, 0.945098, 0, 1, 1,
0.9639093, -0.8071705, 1.725133, 0.9490196, 0, 1, 1,
0.9642079, -0.2370103, 2.13808, 0.9568627, 0, 1, 1,
0.9712017, -0.4922277, 1.624932, 0.9607843, 0, 1, 1,
0.9767967, -0.9555318, 1.599208, 0.9686275, 0, 1, 1,
0.9782353, -0.3364499, 3.402162, 0.972549, 0, 1, 1,
0.9797713, -0.5677387, 3.198651, 0.9803922, 0, 1, 1,
0.9851308, 0.02295801, 1.680958, 0.9843137, 0, 1, 1,
0.9977023, -0.4385955, 2.481676, 0.9921569, 0, 1, 1,
0.9994159, 0.3739474, -0.4337203, 0.9960784, 0, 1, 1,
1.000505, -0.8322839, 3.31958, 1, 0, 0.9960784, 1,
1.00519, 0.3820583, 1.236575, 1, 0, 0.9882353, 1,
1.010468, -0.4566694, 0.2180531, 1, 0, 0.9843137, 1,
1.013087, -0.5851673, 0.7013291, 1, 0, 0.9764706, 1,
1.013216, -0.3703626, 1.043014, 1, 0, 0.972549, 1,
1.018388, -0.1243426, 2.360505, 1, 0, 0.9647059, 1,
1.027827, 1.221201, 0.03289062, 1, 0, 0.9607843, 1,
1.028985, -0.5032544, 0.9274104, 1, 0, 0.9529412, 1,
1.032729, 0.9703525, -0.0233801, 1, 0, 0.9490196, 1,
1.034705, 0.2283007, 2.777715, 1, 0, 0.9411765, 1,
1.039396, 0.2154628, 2.28213, 1, 0, 0.9372549, 1,
1.04364, -1.573379, 2.995366, 1, 0, 0.9294118, 1,
1.057436, -0.75364, 0.9999127, 1, 0, 0.9254902, 1,
1.060333, 1.207536, 1.041537, 1, 0, 0.9176471, 1,
1.060946, 1.326867, 1.317337, 1, 0, 0.9137255, 1,
1.061858, -0.5991469, 4.110847, 1, 0, 0.9058824, 1,
1.063297, 1.716073, -0.08834288, 1, 0, 0.9019608, 1,
1.06773, -1.085115, 3.119955, 1, 0, 0.8941177, 1,
1.067878, -0.07535461, 2.217261, 1, 0, 0.8862745, 1,
1.06924, -0.03864143, 2.814668, 1, 0, 0.8823529, 1,
1.072523, -0.6181858, 3.132476, 1, 0, 0.8745098, 1,
1.072948, -1.12745, 0.4099006, 1, 0, 0.8705882, 1,
1.07494, 0.8843526, 0.7452012, 1, 0, 0.8627451, 1,
1.081859, 0.616827, 2.969515, 1, 0, 0.8588235, 1,
1.085001, 0.2277087, 1.852322, 1, 0, 0.8509804, 1,
1.088469, 0.07032748, 2.320116, 1, 0, 0.8470588, 1,
1.091742, 0.3379933, 0.6328698, 1, 0, 0.8392157, 1,
1.108245, -0.4198789, 0.9978949, 1, 0, 0.8352941, 1,
1.109226, 0.1263756, 1.129848, 1, 0, 0.827451, 1,
1.121331, 0.3443725, 0.1293768, 1, 0, 0.8235294, 1,
1.123772, -1.524058, 2.757518, 1, 0, 0.8156863, 1,
1.136756, 0.135757, 2.288641, 1, 0, 0.8117647, 1,
1.149176, -0.5035644, 1.670565, 1, 0, 0.8039216, 1,
1.151303, 0.8806175, 1.29997, 1, 0, 0.7960784, 1,
1.152086, -1.546853, 1.854378, 1, 0, 0.7921569, 1,
1.165046, 0.2258595, 0.02694577, 1, 0, 0.7843137, 1,
1.165309, 0.7936919, 0.9569432, 1, 0, 0.7803922, 1,
1.167164, -1.059675, 2.088141, 1, 0, 0.772549, 1,
1.167512, 0.9436601, 0.7038067, 1, 0, 0.7686275, 1,
1.185503, -0.160531, 1.72901, 1, 0, 0.7607843, 1,
1.186783, 1.531286, -0.02167895, 1, 0, 0.7568628, 1,
1.195702, 0.7888754, 0.91136, 1, 0, 0.7490196, 1,
1.200304, 1.678927, 1.549968, 1, 0, 0.7450981, 1,
1.200814, -0.2489116, 1.927272, 1, 0, 0.7372549, 1,
1.211853, 0.191626, 1.526393, 1, 0, 0.7333333, 1,
1.218222, -0.4632468, 3.457824, 1, 0, 0.7254902, 1,
1.221788, -0.5061391, 2.048531, 1, 0, 0.7215686, 1,
1.235074, -1.103674, 3.276263, 1, 0, 0.7137255, 1,
1.245666, 0.3454017, 2.651153, 1, 0, 0.7098039, 1,
1.248669, -0.5178691, 1.171814, 1, 0, 0.7019608, 1,
1.264374, -0.5915216, 1.142571, 1, 0, 0.6941177, 1,
1.277133, -0.8984445, 3.174193, 1, 0, 0.6901961, 1,
1.27722, 0.3333066, 0.5811915, 1, 0, 0.682353, 1,
1.282485, 0.9889115, 0.9209965, 1, 0, 0.6784314, 1,
1.284921, 0.2048576, 0.01401991, 1, 0, 0.6705883, 1,
1.287605, 1.18934, 0.2031551, 1, 0, 0.6666667, 1,
1.293427, -1.266438, 1.977965, 1, 0, 0.6588235, 1,
1.302106, 0.1584087, 0.08708403, 1, 0, 0.654902, 1,
1.304309, -1.23675, 3.267922, 1, 0, 0.6470588, 1,
1.309211, -1.184652, 3.025029, 1, 0, 0.6431373, 1,
1.310325, -0.1767114, 0.7681353, 1, 0, 0.6352941, 1,
1.311784, 1.152687, 2.029341, 1, 0, 0.6313726, 1,
1.315242, 2.472899, 1.236189, 1, 0, 0.6235294, 1,
1.320357, 0.2836428, 1.911918, 1, 0, 0.6196079, 1,
1.327213, 0.2771442, 1.3513, 1, 0, 0.6117647, 1,
1.333805, 0.289249, 2.170218, 1, 0, 0.6078432, 1,
1.337174, -1.787766, 2.766857, 1, 0, 0.6, 1,
1.341216, 0.5461516, 1.58346, 1, 0, 0.5921569, 1,
1.341537, 0.5259795, 1.396124, 1, 0, 0.5882353, 1,
1.344966, -0.6183377, 2.103647, 1, 0, 0.5803922, 1,
1.346304, 0.6493397, 2.337111, 1, 0, 0.5764706, 1,
1.354864, 1.293404, 0.8275994, 1, 0, 0.5686275, 1,
1.369223, 1.480173, 0.1548354, 1, 0, 0.5647059, 1,
1.375936, -0.05403611, 2.536442, 1, 0, 0.5568628, 1,
1.3869, -0.5809086, 2.796484, 1, 0, 0.5529412, 1,
1.395147, -1.104067, 2.040658, 1, 0, 0.5450981, 1,
1.397801, 0.2203737, 0.7308665, 1, 0, 0.5411765, 1,
1.403536, -0.9854546, 2.088764, 1, 0, 0.5333334, 1,
1.419173, -0.06733333, 2.721911, 1, 0, 0.5294118, 1,
1.419371, 0.7955148, 0.7507256, 1, 0, 0.5215687, 1,
1.425195, -0.07516777, 1.185871, 1, 0, 0.5176471, 1,
1.430814, 0.4690523, 0.8422843, 1, 0, 0.509804, 1,
1.435747, 0.6193188, 0.6845086, 1, 0, 0.5058824, 1,
1.451122, 0.5433412, -0.8788096, 1, 0, 0.4980392, 1,
1.461396, -0.6817458, 1.69042, 1, 0, 0.4901961, 1,
1.464254, -0.7756984, 1.769173, 1, 0, 0.4862745, 1,
1.482819, 0.5669873, 0.3203655, 1, 0, 0.4784314, 1,
1.49241, -0.2805453, 0.4527165, 1, 0, 0.4745098, 1,
1.496513, 1.606858, 1.596463, 1, 0, 0.4666667, 1,
1.497643, 1.498338, 1.265829, 1, 0, 0.4627451, 1,
1.502809, 0.01642812, 2.794738, 1, 0, 0.454902, 1,
1.511012, -0.07853749, 0.9361352, 1, 0, 0.4509804, 1,
1.520863, 0.8787341, 1.300023, 1, 0, 0.4431373, 1,
1.523317, 1.637046, 0.6813983, 1, 0, 0.4392157, 1,
1.530366, 1.036996, 1.223828, 1, 0, 0.4313726, 1,
1.537832, -0.2100859, 2.409612, 1, 0, 0.427451, 1,
1.539942, 1.831376, -0.1323241, 1, 0, 0.4196078, 1,
1.54873, -1.259639, 2.136566, 1, 0, 0.4156863, 1,
1.553641, 0.7335007, 2.585701, 1, 0, 0.4078431, 1,
1.554662, -0.8962407, 2.836882, 1, 0, 0.4039216, 1,
1.568839, 0.408046, 1.549705, 1, 0, 0.3960784, 1,
1.571752, -1.00327, 0.9929284, 1, 0, 0.3882353, 1,
1.579579, -0.9783269, 3.16255, 1, 0, 0.3843137, 1,
1.580345, 2.506836, -0.4254816, 1, 0, 0.3764706, 1,
1.585496, 0.03270818, 0.1046233, 1, 0, 0.372549, 1,
1.615342, -0.2546277, 2.827259, 1, 0, 0.3647059, 1,
1.621935, 0.04162763, 1.699867, 1, 0, 0.3607843, 1,
1.622833, -0.8609559, 1.595394, 1, 0, 0.3529412, 1,
1.63546, 1.146495, 0.1519266, 1, 0, 0.3490196, 1,
1.639035, -1.45219, 1.530341, 1, 0, 0.3411765, 1,
1.646132, -1.396073, 3.709814, 1, 0, 0.3372549, 1,
1.659788, 1.182325, 1.446428, 1, 0, 0.3294118, 1,
1.661853, -0.470095, 1.53238, 1, 0, 0.3254902, 1,
1.67508, 0.2258205, 1.457734, 1, 0, 0.3176471, 1,
1.680921, -0.2566184, 1.142118, 1, 0, 0.3137255, 1,
1.689591, 0.03936243, -0.5002043, 1, 0, 0.3058824, 1,
1.70204, 0.3213544, 2.48036, 1, 0, 0.2980392, 1,
1.726182, -0.2945272, 3.086046, 1, 0, 0.2941177, 1,
1.740429, 1.142597, 0.6971456, 1, 0, 0.2862745, 1,
1.745155, -0.9569259, 1.532825, 1, 0, 0.282353, 1,
1.746669, -1.022298, 1.523573, 1, 0, 0.2745098, 1,
1.75742, 0.5546731, 2.079733, 1, 0, 0.2705882, 1,
1.760455, 0.156833, 1.041455, 1, 0, 0.2627451, 1,
1.771765, 0.3741801, 1.205297, 1, 0, 0.2588235, 1,
1.792052, 1.449021, -0.8035967, 1, 0, 0.2509804, 1,
1.79793, 0.1539864, 1.150119, 1, 0, 0.2470588, 1,
1.80955, 0.5839957, 0.1376346, 1, 0, 0.2392157, 1,
1.81005, 0.6301855, 0.2279464, 1, 0, 0.2352941, 1,
1.812717, 0.3784154, 1.842633, 1, 0, 0.227451, 1,
1.831465, -0.2606386, 2.00684, 1, 0, 0.2235294, 1,
1.855328, 0.1892985, 0.8727604, 1, 0, 0.2156863, 1,
1.856062, -0.9109337, 1.495574, 1, 0, 0.2117647, 1,
1.87314, -0.1352316, 1.256705, 1, 0, 0.2039216, 1,
1.879154, -1.672569, 2.332511, 1, 0, 0.1960784, 1,
1.92614, 0.6556785, 0.06975482, 1, 0, 0.1921569, 1,
1.990267, 0.9276981, -0.5072327, 1, 0, 0.1843137, 1,
1.99091, -0.7323278, 1.87082, 1, 0, 0.1803922, 1,
1.998939, 0.3192903, 0.3163486, 1, 0, 0.172549, 1,
2.09412, 0.4761099, -0.04731376, 1, 0, 0.1686275, 1,
2.166682, -0.05077008, 0.6491464, 1, 0, 0.1607843, 1,
2.167239, -2.359686, 2.627263, 1, 0, 0.1568628, 1,
2.192633, -0.3602237, 1.684053, 1, 0, 0.1490196, 1,
2.19339, -1.423367, 2.945871, 1, 0, 0.145098, 1,
2.213379, -0.3855916, 2.892924, 1, 0, 0.1372549, 1,
2.242699, -0.9394934, 1.046816, 1, 0, 0.1333333, 1,
2.246573, 0.06021607, 2.192882, 1, 0, 0.1254902, 1,
2.26613, -0.4722953, 1.614562, 1, 0, 0.1215686, 1,
2.272549, -1.600368, 1.836465, 1, 0, 0.1137255, 1,
2.275719, 1.942537, -0.4507847, 1, 0, 0.1098039, 1,
2.319777, -0.4522045, 1.643223, 1, 0, 0.1019608, 1,
2.320447, 0.9392203, 1.600969, 1, 0, 0.09411765, 1,
2.350797, 0.01890109, 1.753569, 1, 0, 0.09019608, 1,
2.376078, 0.1870112, -0.2821227, 1, 0, 0.08235294, 1,
2.402485, -0.6750895, 1.889271, 1, 0, 0.07843138, 1,
2.40862, -0.7871267, -0.4042072, 1, 0, 0.07058824, 1,
2.413204, 0.5799832, 2.218047, 1, 0, 0.06666667, 1,
2.420454, -0.7891931, 2.723792, 1, 0, 0.05882353, 1,
2.493168, -0.2204341, 1.909699, 1, 0, 0.05490196, 1,
2.537054, 0.1646562, 0.462938, 1, 0, 0.04705882, 1,
2.538229, 2.296259, 2.538242, 1, 0, 0.04313726, 1,
2.540349, -0.5530419, 1.245302, 1, 0, 0.03529412, 1,
2.667197, 0.03296904, 4.084129, 1, 0, 0.03137255, 1,
2.802556, 1.240605, 0.8709368, 1, 0, 0.02352941, 1,
2.845522, -0.9169289, 1.144219, 1, 0, 0.01960784, 1,
2.931785, -1.29646, 2.954381, 1, 0, 0.01176471, 1,
3.165948, 1.116439, 1.101803, 1, 0, 0.007843138, 1
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
-0.1000389, -3.773426, -7.626026, 0, -0.5, 0.5, 0.5,
-0.1000389, -3.773426, -7.626026, 1, -0.5, 0.5, 0.5,
-0.1000389, -3.773426, -7.626026, 1, 1.5, 0.5, 0.5,
-0.1000389, -3.773426, -7.626026, 0, 1.5, 0.5, 0.5
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
-4.473195, 0.1422385, -7.626026, 0, -0.5, 0.5, 0.5,
-4.473195, 0.1422385, -7.626026, 1, -0.5, 0.5, 0.5,
-4.473195, 0.1422385, -7.626026, 1, 1.5, 0.5, 0.5,
-4.473195, 0.1422385, -7.626026, 0, 1.5, 0.5, 0.5
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
-4.473195, -3.773426, -0.4757149, 0, -0.5, 0.5, 0.5,
-4.473195, -3.773426, -0.4757149, 1, -0.5, 0.5, 0.5,
-4.473195, -3.773426, -0.4757149, 1, 1.5, 0.5, 0.5,
-4.473195, -3.773426, -0.4757149, 0, 1.5, 0.5, 0.5
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
-3, -2.869811, -5.975954,
3, -2.869811, -5.975954,
-3, -2.869811, -5.975954,
-3, -3.020413, -6.250966,
-2, -2.869811, -5.975954,
-2, -3.020413, -6.250966,
-1, -2.869811, -5.975954,
-1, -3.020413, -6.250966,
0, -2.869811, -5.975954,
0, -3.020413, -6.250966,
1, -2.869811, -5.975954,
1, -3.020413, -6.250966,
2, -2.869811, -5.975954,
2, -3.020413, -6.250966,
3, -2.869811, -5.975954,
3, -3.020413, -6.250966
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
-3, -3.321618, -6.80099, 0, -0.5, 0.5, 0.5,
-3, -3.321618, -6.80099, 1, -0.5, 0.5, 0.5,
-3, -3.321618, -6.80099, 1, 1.5, 0.5, 0.5,
-3, -3.321618, -6.80099, 0, 1.5, 0.5, 0.5,
-2, -3.321618, -6.80099, 0, -0.5, 0.5, 0.5,
-2, -3.321618, -6.80099, 1, -0.5, 0.5, 0.5,
-2, -3.321618, -6.80099, 1, 1.5, 0.5, 0.5,
-2, -3.321618, -6.80099, 0, 1.5, 0.5, 0.5,
-1, -3.321618, -6.80099, 0, -0.5, 0.5, 0.5,
-1, -3.321618, -6.80099, 1, -0.5, 0.5, 0.5,
-1, -3.321618, -6.80099, 1, 1.5, 0.5, 0.5,
-1, -3.321618, -6.80099, 0, 1.5, 0.5, 0.5,
0, -3.321618, -6.80099, 0, -0.5, 0.5, 0.5,
0, -3.321618, -6.80099, 1, -0.5, 0.5, 0.5,
0, -3.321618, -6.80099, 1, 1.5, 0.5, 0.5,
0, -3.321618, -6.80099, 0, 1.5, 0.5, 0.5,
1, -3.321618, -6.80099, 0, -0.5, 0.5, 0.5,
1, -3.321618, -6.80099, 1, -0.5, 0.5, 0.5,
1, -3.321618, -6.80099, 1, 1.5, 0.5, 0.5,
1, -3.321618, -6.80099, 0, 1.5, 0.5, 0.5,
2, -3.321618, -6.80099, 0, -0.5, 0.5, 0.5,
2, -3.321618, -6.80099, 1, -0.5, 0.5, 0.5,
2, -3.321618, -6.80099, 1, 1.5, 0.5, 0.5,
2, -3.321618, -6.80099, 0, 1.5, 0.5, 0.5,
3, -3.321618, -6.80099, 0, -0.5, 0.5, 0.5,
3, -3.321618, -6.80099, 1, -0.5, 0.5, 0.5,
3, -3.321618, -6.80099, 1, 1.5, 0.5, 0.5,
3, -3.321618, -6.80099, 0, 1.5, 0.5, 0.5
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
-3.464005, -2, -5.975954,
-3.464005, 3, -5.975954,
-3.464005, -2, -5.975954,
-3.632203, -2, -6.250966,
-3.464005, -1, -5.975954,
-3.632203, -1, -6.250966,
-3.464005, 0, -5.975954,
-3.632203, 0, -6.250966,
-3.464005, 1, -5.975954,
-3.632203, 1, -6.250966,
-3.464005, 2, -5.975954,
-3.632203, 2, -6.250966,
-3.464005, 3, -5.975954,
-3.632203, 3, -6.250966
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
-3.9686, -2, -6.80099, 0, -0.5, 0.5, 0.5,
-3.9686, -2, -6.80099, 1, -0.5, 0.5, 0.5,
-3.9686, -2, -6.80099, 1, 1.5, 0.5, 0.5,
-3.9686, -2, -6.80099, 0, 1.5, 0.5, 0.5,
-3.9686, -1, -6.80099, 0, -0.5, 0.5, 0.5,
-3.9686, -1, -6.80099, 1, -0.5, 0.5, 0.5,
-3.9686, -1, -6.80099, 1, 1.5, 0.5, 0.5,
-3.9686, -1, -6.80099, 0, 1.5, 0.5, 0.5,
-3.9686, 0, -6.80099, 0, -0.5, 0.5, 0.5,
-3.9686, 0, -6.80099, 1, -0.5, 0.5, 0.5,
-3.9686, 0, -6.80099, 1, 1.5, 0.5, 0.5,
-3.9686, 0, -6.80099, 0, 1.5, 0.5, 0.5,
-3.9686, 1, -6.80099, 0, -0.5, 0.5, 0.5,
-3.9686, 1, -6.80099, 1, -0.5, 0.5, 0.5,
-3.9686, 1, -6.80099, 1, 1.5, 0.5, 0.5,
-3.9686, 1, -6.80099, 0, 1.5, 0.5, 0.5,
-3.9686, 2, -6.80099, 0, -0.5, 0.5, 0.5,
-3.9686, 2, -6.80099, 1, -0.5, 0.5, 0.5,
-3.9686, 2, -6.80099, 1, 1.5, 0.5, 0.5,
-3.9686, 2, -6.80099, 0, 1.5, 0.5, 0.5,
-3.9686, 3, -6.80099, 0, -0.5, 0.5, 0.5,
-3.9686, 3, -6.80099, 1, -0.5, 0.5, 0.5,
-3.9686, 3, -6.80099, 1, 1.5, 0.5, 0.5,
-3.9686, 3, -6.80099, 0, 1.5, 0.5, 0.5
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
-3.464005, -2.869811, -4,
-3.464005, -2.869811, 4,
-3.464005, -2.869811, -4,
-3.632203, -3.020413, -4,
-3.464005, -2.869811, -2,
-3.632203, -3.020413, -2,
-3.464005, -2.869811, 0,
-3.632203, -3.020413, 0,
-3.464005, -2.869811, 2,
-3.632203, -3.020413, 2,
-3.464005, -2.869811, 4,
-3.632203, -3.020413, 4
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
-3.9686, -3.321618, -4, 0, -0.5, 0.5, 0.5,
-3.9686, -3.321618, -4, 1, -0.5, 0.5, 0.5,
-3.9686, -3.321618, -4, 1, 1.5, 0.5, 0.5,
-3.9686, -3.321618, -4, 0, 1.5, 0.5, 0.5,
-3.9686, -3.321618, -2, 0, -0.5, 0.5, 0.5,
-3.9686, -3.321618, -2, 1, -0.5, 0.5, 0.5,
-3.9686, -3.321618, -2, 1, 1.5, 0.5, 0.5,
-3.9686, -3.321618, -2, 0, 1.5, 0.5, 0.5,
-3.9686, -3.321618, 0, 0, -0.5, 0.5, 0.5,
-3.9686, -3.321618, 0, 1, -0.5, 0.5, 0.5,
-3.9686, -3.321618, 0, 1, 1.5, 0.5, 0.5,
-3.9686, -3.321618, 0, 0, 1.5, 0.5, 0.5,
-3.9686, -3.321618, 2, 0, -0.5, 0.5, 0.5,
-3.9686, -3.321618, 2, 1, -0.5, 0.5, 0.5,
-3.9686, -3.321618, 2, 1, 1.5, 0.5, 0.5,
-3.9686, -3.321618, 2, 0, 1.5, 0.5, 0.5,
-3.9686, -3.321618, 4, 0, -0.5, 0.5, 0.5,
-3.9686, -3.321618, 4, 1, -0.5, 0.5, 0.5,
-3.9686, -3.321618, 4, 1, 1.5, 0.5, 0.5,
-3.9686, -3.321618, 4, 0, 1.5, 0.5, 0.5
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
-3.464005, -2.869811, -5.975954,
-3.464005, 3.154288, -5.975954,
-3.464005, -2.869811, 5.024524,
-3.464005, 3.154288, 5.024524,
-3.464005, -2.869811, -5.975954,
-3.464005, -2.869811, 5.024524,
-3.464005, 3.154288, -5.975954,
-3.464005, 3.154288, 5.024524,
-3.464005, -2.869811, -5.975954,
3.263927, -2.869811, -5.975954,
-3.464005, -2.869811, 5.024524,
3.263927, -2.869811, 5.024524,
-3.464005, 3.154288, -5.975954,
3.263927, 3.154288, -5.975954,
-3.464005, 3.154288, 5.024524,
3.263927, 3.154288, 5.024524,
3.263927, -2.869811, -5.975954,
3.263927, 3.154288, -5.975954,
3.263927, -2.869811, 5.024524,
3.263927, 3.154288, 5.024524,
3.263927, -2.869811, -5.975954,
3.263927, -2.869811, 5.024524,
3.263927, 3.154288, -5.975954,
3.263927, 3.154288, 5.024524
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
var radius = 7.599903;
var distance = 33.81283;
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
mvMatrix.translate( 0.1000389, -0.1422385, 0.4757149 );
mvMatrix.scale( 1.221351, 1.364049, 0.7469825 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.81283);
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
calcium_arsenate_ars<-read.table("calcium_arsenate_ars.xyz", skip=1)
x<-calcium_arsenate_ars$V2
y<-calcium_arsenate_ars$V3
z<-calcium_arsenate_ars$V4
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
9, 9, 2, 0, 0, 1, 1, 1,
2, 5, 1, 1, 0, 0, 1, 1,
6, 6, 1, 1, 0, 0, 1, 1,
1, 7, 1, 1, 0, 0, 1, 1,
5, 2, 1, 1, 0, 0, 1, 1,
3, 3, 1, 1, 0, 0, 1, 1,
3, 4, 1, 0, 0, 0, 1, 1,
3, 8, 1, 0, 0, 0, 1, 1,
7, 4, 1, 0, 0, 0, 1, 1,
4, 4, 1, 0, 0, 0, 1, 1,
8, 1, 1, 0, 0, 0, 1, 1
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
var radius = 7.951258;
var distance = 27.92846;
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
mvMatrix.translate( -5, -5, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -27.92846);
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
for (var i = 0; i < 11; i++) {
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