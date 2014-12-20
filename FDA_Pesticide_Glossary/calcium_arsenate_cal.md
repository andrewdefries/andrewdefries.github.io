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
-3.815385, 0.4711484, -0.1302976, 1, 0, 0, 1,
-3.296537, 0.1526193, -2.256553, 1, 0.007843138, 0, 1,
-2.772615, 0.8730126, -0.4255777, 1, 0.01176471, 0, 1,
-2.717275, 0.01212989, -1.312163, 1, 0.01960784, 0, 1,
-2.696406, -1.138183, -1.292963, 1, 0.02352941, 0, 1,
-2.598909, -0.162383, -2.858715, 1, 0.03137255, 0, 1,
-2.582366, -0.0857885, -1.913865, 1, 0.03529412, 0, 1,
-2.559694, -1.415831, -2.249729, 1, 0.04313726, 0, 1,
-2.546876, 0.6748475, -1.277356, 1, 0.04705882, 0, 1,
-2.517115, 1.220336, 0.03307138, 1, 0.05490196, 0, 1,
-2.478219, -0.5354366, 0.189312, 1, 0.05882353, 0, 1,
-2.42356, -0.03705155, -1.936493, 1, 0.06666667, 0, 1,
-2.353404, 0.7222221, -0.6728579, 1, 0.07058824, 0, 1,
-2.342696, -0.1954879, -1.273589, 1, 0.07843138, 0, 1,
-2.324203, 0.6948854, -0.4939885, 1, 0.08235294, 0, 1,
-2.312581, -0.134481, -1.702182, 1, 0.09019608, 0, 1,
-2.308612, 1.085837, -0.5165217, 1, 0.09411765, 0, 1,
-2.292192, -0.635829, -1.629068, 1, 0.1019608, 0, 1,
-2.264783, -0.2826944, -3.324477, 1, 0.1098039, 0, 1,
-2.233023, -0.7980863, -3.078806, 1, 0.1137255, 0, 1,
-2.230527, -0.1655236, -2.480359, 1, 0.1215686, 0, 1,
-2.15794, -1.762043, -3.729542, 1, 0.1254902, 0, 1,
-2.14428, -0.2725296, -2.486381, 1, 0.1333333, 0, 1,
-2.138865, -0.4950821, -0.681437, 1, 0.1372549, 0, 1,
-2.083035, 0.1616537, -1.000189, 1, 0.145098, 0, 1,
-2.061694, -0.6931798, -1.744495, 1, 0.1490196, 0, 1,
-2.049236, 2.523421, -1.380885, 1, 0.1568628, 0, 1,
-2.047501, -0.4182928, -2.165586, 1, 0.1607843, 0, 1,
-2.045256, 3.127101, -1.275836, 1, 0.1686275, 0, 1,
-2.022281, 0.5756724, -1.40157, 1, 0.172549, 0, 1,
-1.990427, -0.2868512, -1.284322, 1, 0.1803922, 0, 1,
-1.9846, -0.5721726, -1.4382, 1, 0.1843137, 0, 1,
-1.978773, -0.3925467, 1.820646, 1, 0.1921569, 0, 1,
-1.966237, 1.060743, -2.302525, 1, 0.1960784, 0, 1,
-1.957302, 1.739652, -0.08724719, 1, 0.2039216, 0, 1,
-1.953541, -0.07407299, -1.646757, 1, 0.2117647, 0, 1,
-1.905167, 1.11533, -2.261925, 1, 0.2156863, 0, 1,
-1.900562, 0.429004, -2.373366, 1, 0.2235294, 0, 1,
-1.898338, -2.46636, -2.508605, 1, 0.227451, 0, 1,
-1.896526, -0.4161284, -2.420315, 1, 0.2352941, 0, 1,
-1.888895, 2.193066, -0.6901122, 1, 0.2392157, 0, 1,
-1.87142, 0.9611888, -2.227146, 1, 0.2470588, 0, 1,
-1.851887, 1.301779, 0.7493615, 1, 0.2509804, 0, 1,
-1.806753, -0.6094323, -1.724136, 1, 0.2588235, 0, 1,
-1.804272, 0.8493586, -1.776968, 1, 0.2627451, 0, 1,
-1.801444, 0.6848983, -1.484773, 1, 0.2705882, 0, 1,
-1.795026, -0.3858164, -2.754592, 1, 0.2745098, 0, 1,
-1.794415, -0.1626186, -3.407535, 1, 0.282353, 0, 1,
-1.789351, 1.139931, -3.211047, 1, 0.2862745, 0, 1,
-1.788071, 0.6302519, -0.446438, 1, 0.2941177, 0, 1,
-1.717324, -0.009570518, -0.3034791, 1, 0.3019608, 0, 1,
-1.707941, -0.7078226, -2.155985, 1, 0.3058824, 0, 1,
-1.706538, 1.007262, -2.62246, 1, 0.3137255, 0, 1,
-1.701193, 0.03300052, 0.2688556, 1, 0.3176471, 0, 1,
-1.699, -0.1221441, -1.383308, 1, 0.3254902, 0, 1,
-1.69292, 1.762092, -0.005354819, 1, 0.3294118, 0, 1,
-1.688576, 0.7191234, -0.8396965, 1, 0.3372549, 0, 1,
-1.670677, -0.6131808, -1.235051, 1, 0.3411765, 0, 1,
-1.660844, 0.220473, -0.5149909, 1, 0.3490196, 0, 1,
-1.660636, -1.734159, -1.900025, 1, 0.3529412, 0, 1,
-1.659779, 1.162244, -1.41167, 1, 0.3607843, 0, 1,
-1.628829, -1.367136, -2.740805, 1, 0.3647059, 0, 1,
-1.623435, 1.370771, -0.6128145, 1, 0.372549, 0, 1,
-1.615643, 0.2014001, -0.7247393, 1, 0.3764706, 0, 1,
-1.609074, 0.3225169, -3.923185, 1, 0.3843137, 0, 1,
-1.604193, 1.795923, -0.624931, 1, 0.3882353, 0, 1,
-1.58459, 0.9520864, -0.9949107, 1, 0.3960784, 0, 1,
-1.581806, -0.5809218, -0.8650566, 1, 0.4039216, 0, 1,
-1.56912, -1.174861, -1.652426, 1, 0.4078431, 0, 1,
-1.560357, 2.450043, -1.723703, 1, 0.4156863, 0, 1,
-1.557975, -0.3995233, -2.783502, 1, 0.4196078, 0, 1,
-1.546413, 1.805251, -1.597931, 1, 0.427451, 0, 1,
-1.54479, 1.071851, -2.126354, 1, 0.4313726, 0, 1,
-1.543733, 0.01213396, -2.597117, 1, 0.4392157, 0, 1,
-1.53048, -0.259653, -3.337305, 1, 0.4431373, 0, 1,
-1.527953, -0.7044632, -1.689377, 1, 0.4509804, 0, 1,
-1.519398, -0.5909096, -1.645859, 1, 0.454902, 0, 1,
-1.507033, 1.765083, -1.383878, 1, 0.4627451, 0, 1,
-1.490388, -1.210098, -3.478161, 1, 0.4666667, 0, 1,
-1.489211, 1.411944, 0.8455653, 1, 0.4745098, 0, 1,
-1.487494, 0.4353074, -0.4448002, 1, 0.4784314, 0, 1,
-1.477509, 0.7976521, -1.48041, 1, 0.4862745, 0, 1,
-1.476749, 0.9410414, -1.384771, 1, 0.4901961, 0, 1,
-1.463669, -1.779608, -3.727538, 1, 0.4980392, 0, 1,
-1.455969, -0.1585578, -3.508441, 1, 0.5058824, 0, 1,
-1.454288, 1.45715, -0.524152, 1, 0.509804, 0, 1,
-1.45147, -0.2998981, 0.06899161, 1, 0.5176471, 0, 1,
-1.441945, -0.4033706, -2.551551, 1, 0.5215687, 0, 1,
-1.434362, 0.3350574, -2.192077, 1, 0.5294118, 0, 1,
-1.432662, -0.867749, -3.02511, 1, 0.5333334, 0, 1,
-1.418439, -0.2909116, -2.246477, 1, 0.5411765, 0, 1,
-1.413175, -0.6922544, -2.193703, 1, 0.5450981, 0, 1,
-1.409847, -0.9452194, -1.822373, 1, 0.5529412, 0, 1,
-1.408478, -0.9621397, -2.815118, 1, 0.5568628, 0, 1,
-1.408054, 0.3096515, -0.1849579, 1, 0.5647059, 0, 1,
-1.401098, -0.6914003, -1.106749, 1, 0.5686275, 0, 1,
-1.394663, 0.915693, -0.7390659, 1, 0.5764706, 0, 1,
-1.3867, 0.1916689, -0.7292569, 1, 0.5803922, 0, 1,
-1.362526, 2.144509, 0.0516893, 1, 0.5882353, 0, 1,
-1.358595, 0.4906948, -0.9620027, 1, 0.5921569, 0, 1,
-1.358381, -1.562979, -1.699668, 1, 0.6, 0, 1,
-1.356631, 0.880685, -1.031307, 1, 0.6078432, 0, 1,
-1.349469, 1.206922, -0.4455473, 1, 0.6117647, 0, 1,
-1.349461, 0.8345408, -0.3141235, 1, 0.6196079, 0, 1,
-1.341985, 1.613558, -0.1117732, 1, 0.6235294, 0, 1,
-1.333294, 0.5850509, -1.876164, 1, 0.6313726, 0, 1,
-1.328414, 0.7008095, 0.7533688, 1, 0.6352941, 0, 1,
-1.327397, 1.104188, -0.898733, 1, 0.6431373, 0, 1,
-1.323568, 0.1937727, -1.165084, 1, 0.6470588, 0, 1,
-1.321961, 0.6210878, -2.617776, 1, 0.654902, 0, 1,
-1.319732, -0.6925973, -0.7438679, 1, 0.6588235, 0, 1,
-1.319252, -1.15631, -0.4908559, 1, 0.6666667, 0, 1,
-1.306979, -0.2550885, -1.287187, 1, 0.6705883, 0, 1,
-1.306379, 0.6854953, -1.284468, 1, 0.6784314, 0, 1,
-1.306272, 1.319131, -0.6966175, 1, 0.682353, 0, 1,
-1.303465, 0.07392532, -2.958022, 1, 0.6901961, 0, 1,
-1.299594, -0.4960358, -2.158355, 1, 0.6941177, 0, 1,
-1.287827, -1.793375, -2.501233, 1, 0.7019608, 0, 1,
-1.283944, -0.003961439, -0.04827071, 1, 0.7098039, 0, 1,
-1.27037, 0.3210276, -0.5112368, 1, 0.7137255, 0, 1,
-1.246848, -2.090478, -2.303763, 1, 0.7215686, 0, 1,
-1.24154, -0.5439786, -2.180605, 1, 0.7254902, 0, 1,
-1.240565, -0.2279102, -1.163129, 1, 0.7333333, 0, 1,
-1.240412, -0.4698201, -2.90044, 1, 0.7372549, 0, 1,
-1.227312, 1.647404, -1.006064, 1, 0.7450981, 0, 1,
-1.221659, 0.04929561, -1.673512, 1, 0.7490196, 0, 1,
-1.217264, -0.659514, -3.061651, 1, 0.7568628, 0, 1,
-1.216717, 0.04847073, -1.96202, 1, 0.7607843, 0, 1,
-1.212028, 0.3057762, -0.3399051, 1, 0.7686275, 0, 1,
-1.211113, 0.08068393, 0.6207617, 1, 0.772549, 0, 1,
-1.197343, -0.1022573, -0.06295294, 1, 0.7803922, 0, 1,
-1.196151, 1.96441, -1.787218, 1, 0.7843137, 0, 1,
-1.192373, -0.5766197, -1.70437, 1, 0.7921569, 0, 1,
-1.190943, 0.54177, -1.077243, 1, 0.7960784, 0, 1,
-1.18939, -0.4904233, -3.08784, 1, 0.8039216, 0, 1,
-1.186902, 0.9098623, -2.467336, 1, 0.8117647, 0, 1,
-1.182732, -2.654675, -1.885434, 1, 0.8156863, 0, 1,
-1.166162, -0.829781, -2.927942, 1, 0.8235294, 0, 1,
-1.142875, -0.255169, -1.646288, 1, 0.827451, 0, 1,
-1.142477, -1.269491, -2.832908, 1, 0.8352941, 0, 1,
-1.140643, 1.130179, -1.727169, 1, 0.8392157, 0, 1,
-1.132734, 1.040271, -0.8825707, 1, 0.8470588, 0, 1,
-1.123349, 0.6036068, -1.828882, 1, 0.8509804, 0, 1,
-1.11706, -0.1814671, -2.683441, 1, 0.8588235, 0, 1,
-1.115408, 0.3553526, -1.539641, 1, 0.8627451, 0, 1,
-1.11412, -0.6573752, -2.698333, 1, 0.8705882, 0, 1,
-1.113312, 0.6145507, 0.7258231, 1, 0.8745098, 0, 1,
-1.112619, 1.177694, 0.3708294, 1, 0.8823529, 0, 1,
-1.111779, 0.3490971, -1.659294, 1, 0.8862745, 0, 1,
-1.110755, -0.275353, -2.384713, 1, 0.8941177, 0, 1,
-1.109986, -0.900807, -0.5936753, 1, 0.8980392, 0, 1,
-1.107024, -0.1372745, -2.80291, 1, 0.9058824, 0, 1,
-1.103074, -0.1681783, -3.095074, 1, 0.9137255, 0, 1,
-1.084883, -0.3221215, -0.5139223, 1, 0.9176471, 0, 1,
-1.079452, 1.141331, -0.243871, 1, 0.9254902, 0, 1,
-1.064339, -0.6147146, -1.823629, 1, 0.9294118, 0, 1,
-1.060674, 0.6640727, -1.901565, 1, 0.9372549, 0, 1,
-1.049947, 0.3277208, -1.644121, 1, 0.9411765, 0, 1,
-1.039042, 2.787003, -1.438771, 1, 0.9490196, 0, 1,
-1.036917, 0.02630171, -2.65607, 1, 0.9529412, 0, 1,
-1.034947, -0.3753048, 0.5276161, 1, 0.9607843, 0, 1,
-1.031988, -0.9620107, -3.1888, 1, 0.9647059, 0, 1,
-1.026322, -0.5261118, -3.600717, 1, 0.972549, 0, 1,
-1.002588, -0.02983734, -0.8112722, 1, 0.9764706, 0, 1,
-0.9955938, -1.396372, -3.145728, 1, 0.9843137, 0, 1,
-0.9943038, 1.392263, -0.2185739, 1, 0.9882353, 0, 1,
-0.9916166, 0.1218954, -0.5389265, 1, 0.9960784, 0, 1,
-0.9890249, 1.094903, -0.8107249, 0.9960784, 1, 0, 1,
-0.9744372, -1.763361, -2.409364, 0.9921569, 1, 0, 1,
-0.9692826, 0.0120786, -1.226359, 0.9843137, 1, 0, 1,
-0.9558708, -0.3741025, -0.7621174, 0.9803922, 1, 0, 1,
-0.953679, 0.8655416, -0.5934055, 0.972549, 1, 0, 1,
-0.9486783, -0.2331848, -4.066833, 0.9686275, 1, 0, 1,
-0.9456708, -0.1967578, -2.597584, 0.9607843, 1, 0, 1,
-0.9453264, -2.036712, -3.199578, 0.9568627, 1, 0, 1,
-0.9420893, 0.06316859, 0.06474514, 0.9490196, 1, 0, 1,
-0.9390558, 0.4736823, -3.095124, 0.945098, 1, 0, 1,
-0.934034, 0.8451315, -0.7445651, 0.9372549, 1, 0, 1,
-0.9321419, -0.1204806, -0.3640933, 0.9333333, 1, 0, 1,
-0.9297417, 0.2731908, -1.216057, 0.9254902, 1, 0, 1,
-0.9252954, -0.5784682, -2.219183, 0.9215686, 1, 0, 1,
-0.9211552, 0.8270503, -1.484488, 0.9137255, 1, 0, 1,
-0.9170327, 2.239039, -1.058274, 0.9098039, 1, 0, 1,
-0.9121451, -1.724733, -2.948519, 0.9019608, 1, 0, 1,
-0.9099716, -1.438178, -4.050899, 0.8941177, 1, 0, 1,
-0.9027198, 0.7137252, -1.542685, 0.8901961, 1, 0, 1,
-0.8996043, 1.502083, 0.5826712, 0.8823529, 1, 0, 1,
-0.883202, 1.855833, -0.9386499, 0.8784314, 1, 0, 1,
-0.8737204, 0.03343654, -0.1866596, 0.8705882, 1, 0, 1,
-0.8715351, 0.03782396, -0.8158693, 0.8666667, 1, 0, 1,
-0.8699803, -0.2566785, -3.187743, 0.8588235, 1, 0, 1,
-0.8693299, 0.5862525, -1.333678, 0.854902, 1, 0, 1,
-0.8642318, -0.6682394, -0.4289625, 0.8470588, 1, 0, 1,
-0.8491259, 0.5209134, -0.1502531, 0.8431373, 1, 0, 1,
-0.8410841, -0.8416551, -3.196707, 0.8352941, 1, 0, 1,
-0.8303138, -0.4588407, -2.97534, 0.8313726, 1, 0, 1,
-0.8298267, -0.1989388, -3.098529, 0.8235294, 1, 0, 1,
-0.8272337, 3.029795, 0.1014414, 0.8196079, 1, 0, 1,
-0.8198672, 0.387251, -1.595064, 0.8117647, 1, 0, 1,
-0.8128451, -1.696995, -1.993686, 0.8078431, 1, 0, 1,
-0.8118135, -0.9220872, -2.409086, 0.8, 1, 0, 1,
-0.8098702, -1.405709, -2.4277, 0.7921569, 1, 0, 1,
-0.8042088, 0.7358706, -1.502954, 0.7882353, 1, 0, 1,
-0.8027464, -2.220106, -1.815709, 0.7803922, 1, 0, 1,
-0.8000042, 1.375393, 0.9854559, 0.7764706, 1, 0, 1,
-0.796226, -1.180293, -3.529436, 0.7686275, 1, 0, 1,
-0.7946489, 1.018168, -0.2638798, 0.7647059, 1, 0, 1,
-0.7943128, 1.252603, 0.8175308, 0.7568628, 1, 0, 1,
-0.7939982, 1.126458, 1.076548, 0.7529412, 1, 0, 1,
-0.7928264, 0.3423475, -3.333765, 0.7450981, 1, 0, 1,
-0.7920516, -1.5459, -1.727305, 0.7411765, 1, 0, 1,
-0.7907697, -0.6961018, -0.4769445, 0.7333333, 1, 0, 1,
-0.7821935, -0.7058989, -2.997161, 0.7294118, 1, 0, 1,
-0.7820312, 1.804907, -0.2765937, 0.7215686, 1, 0, 1,
-0.7818732, 0.7040816, -2.777402, 0.7176471, 1, 0, 1,
-0.7784653, -0.9315001, -0.3489454, 0.7098039, 1, 0, 1,
-0.7771395, 0.001189003, 0.5949608, 0.7058824, 1, 0, 1,
-0.7688149, 0.1197071, -1.210567, 0.6980392, 1, 0, 1,
-0.7660995, 0.9220882, -2.452797, 0.6901961, 1, 0, 1,
-0.7657803, -1.588324, -1.818421, 0.6862745, 1, 0, 1,
-0.76487, -0.2654134, -1.701861, 0.6784314, 1, 0, 1,
-0.7609771, -1.161839, -1.482478, 0.6745098, 1, 0, 1,
-0.7563125, 0.5345572, -0.8835989, 0.6666667, 1, 0, 1,
-0.7545078, 0.654434, -0.4151577, 0.6627451, 1, 0, 1,
-0.7507589, 0.6052319, 0.3263091, 0.654902, 1, 0, 1,
-0.7464176, -0.4912938, -1.710305, 0.6509804, 1, 0, 1,
-0.7442205, 1.015088, -0.868704, 0.6431373, 1, 0, 1,
-0.7391601, 1.669298, 1.307222, 0.6392157, 1, 0, 1,
-0.735414, 0.5737586, -1.511634, 0.6313726, 1, 0, 1,
-0.7342752, -1.110585, -1.222646, 0.627451, 1, 0, 1,
-0.7318642, 0.486596, -1.315283, 0.6196079, 1, 0, 1,
-0.7307051, 0.7800962, -0.4086703, 0.6156863, 1, 0, 1,
-0.7301598, 0.1485603, -0.824649, 0.6078432, 1, 0, 1,
-0.7288858, 0.4783986, -0.7734385, 0.6039216, 1, 0, 1,
-0.7265751, -0.3533459, -1.156709, 0.5960785, 1, 0, 1,
-0.7134452, -0.009018421, -2.382232, 0.5882353, 1, 0, 1,
-0.7044449, -0.3490447, -0.3398235, 0.5843138, 1, 0, 1,
-0.7041226, 0.8321553, 0.1808701, 0.5764706, 1, 0, 1,
-0.7005789, 1.377475, 0.04636765, 0.572549, 1, 0, 1,
-0.6894923, -0.276571, -2.185525, 0.5647059, 1, 0, 1,
-0.6875883, -0.7951948, -2.493993, 0.5607843, 1, 0, 1,
-0.6856158, -0.2663239, -3.459025, 0.5529412, 1, 0, 1,
-0.6788815, 0.6236202, -0.1606421, 0.5490196, 1, 0, 1,
-0.6731107, 0.4972732, -0.6767026, 0.5411765, 1, 0, 1,
-0.6728896, 0.3509026, -1.129902, 0.5372549, 1, 0, 1,
-0.6711419, -0.7450184, -1.16936, 0.5294118, 1, 0, 1,
-0.6691552, 1.72143, -2.666086, 0.5254902, 1, 0, 1,
-0.6622834, 1.637278, 0.5085087, 0.5176471, 1, 0, 1,
-0.66162, 0.1539271, -0.6824008, 0.5137255, 1, 0, 1,
-0.660754, -1.082857, -2.42993, 0.5058824, 1, 0, 1,
-0.6591903, 0.5517439, 0.01914003, 0.5019608, 1, 0, 1,
-0.6590485, -0.2730713, -3.954025, 0.4941176, 1, 0, 1,
-0.6546365, 0.7818587, -1.621115, 0.4862745, 1, 0, 1,
-0.6536517, 0.6306342, -0.9267713, 0.4823529, 1, 0, 1,
-0.6494895, 0.1488333, -1.071427, 0.4745098, 1, 0, 1,
-0.6428788, -1.102621, -2.184347, 0.4705882, 1, 0, 1,
-0.6417879, -0.36903, -2.225528, 0.4627451, 1, 0, 1,
-0.6393413, -0.8749142, -2.670225, 0.4588235, 1, 0, 1,
-0.6341518, -0.1035492, -0.7329789, 0.4509804, 1, 0, 1,
-0.6339688, 0.3622073, 0.8559319, 0.4470588, 1, 0, 1,
-0.6293681, -0.5951307, -3.2133, 0.4392157, 1, 0, 1,
-0.6292158, 0.08013184, -3.283549, 0.4352941, 1, 0, 1,
-0.6212513, 1.279174, -0.6372426, 0.427451, 1, 0, 1,
-0.6107661, 1.066473, -0.8581672, 0.4235294, 1, 0, 1,
-0.6088611, -0.2169113, -2.447067, 0.4156863, 1, 0, 1,
-0.6060322, -2.002578, -3.850583, 0.4117647, 1, 0, 1,
-0.6048839, -0.8552536, -1.874531, 0.4039216, 1, 0, 1,
-0.601896, 1.676853, -2.885373, 0.3960784, 1, 0, 1,
-0.5998757, 0.9785666, -1.305841, 0.3921569, 1, 0, 1,
-0.5932657, -0.5361257, -0.4170545, 0.3843137, 1, 0, 1,
-0.5925118, 1.791894, -0.7551177, 0.3803922, 1, 0, 1,
-0.5918319, 0.893685, -0.8855009, 0.372549, 1, 0, 1,
-0.5902203, -0.04131945, -0.9020732, 0.3686275, 1, 0, 1,
-0.5887296, -2.061723, -1.888491, 0.3607843, 1, 0, 1,
-0.587377, 0.4967184, -1.129703, 0.3568628, 1, 0, 1,
-0.5838079, -2.123411, -2.674586, 0.3490196, 1, 0, 1,
-0.5822374, 0.8326265, -1.127041, 0.345098, 1, 0, 1,
-0.580067, -0.2299093, -3.463156, 0.3372549, 1, 0, 1,
-0.5800241, -0.5425726, -2.383527, 0.3333333, 1, 0, 1,
-0.5762076, -1.457654, -2.99618, 0.3254902, 1, 0, 1,
-0.5743666, 1.299688, -0.3865546, 0.3215686, 1, 0, 1,
-0.5727692, 0.476372, -2.501177, 0.3137255, 1, 0, 1,
-0.5726972, 2.135725, -0.6193624, 0.3098039, 1, 0, 1,
-0.5715818, 0.6902386, -0.455624, 0.3019608, 1, 0, 1,
-0.5699446, -0.2815118, -2.09476, 0.2941177, 1, 0, 1,
-0.5693048, -0.04017229, -2.502754, 0.2901961, 1, 0, 1,
-0.5608065, 0.6157806, -3.038361, 0.282353, 1, 0, 1,
-0.5587782, 0.9675003, 0.1007989, 0.2784314, 1, 0, 1,
-0.5508844, 1.671083, -0.4658377, 0.2705882, 1, 0, 1,
-0.5483792, 0.0910567, -1.184898, 0.2666667, 1, 0, 1,
-0.5366827, -0.5629237, -1.951814, 0.2588235, 1, 0, 1,
-0.5360302, -0.08113683, -1.11539, 0.254902, 1, 0, 1,
-0.5338191, 0.1441938, 0.1004022, 0.2470588, 1, 0, 1,
-0.5310472, 1.234362, 0.1977856, 0.2431373, 1, 0, 1,
-0.5301991, 1.687308, -0.9177971, 0.2352941, 1, 0, 1,
-0.5292761, 1.817081, -0.3749947, 0.2313726, 1, 0, 1,
-0.527337, -0.2912409, -1.002407, 0.2235294, 1, 0, 1,
-0.526365, -1.57868, -2.269137, 0.2196078, 1, 0, 1,
-0.5189497, -1.056013, -2.588082, 0.2117647, 1, 0, 1,
-0.5189248, -0.7030606, -3.163536, 0.2078431, 1, 0, 1,
-0.5174339, -0.9411091, -3.651092, 0.2, 1, 0, 1,
-0.5164943, -0.8805469, -0.8094785, 0.1921569, 1, 0, 1,
-0.507973, -1.000396, -2.706112, 0.1882353, 1, 0, 1,
-0.5058721, -1.148945, -2.648813, 0.1803922, 1, 0, 1,
-0.5036815, -0.1492803, -0.85626, 0.1764706, 1, 0, 1,
-0.5022862, 0.9172155, -1.02899, 0.1686275, 1, 0, 1,
-0.4990647, 0.6172603, -1.880832, 0.1647059, 1, 0, 1,
-0.4971519, -0.7097026, -3.744042, 0.1568628, 1, 0, 1,
-0.4951181, -1.163058, -3.282498, 0.1529412, 1, 0, 1,
-0.4947257, -0.8245376, -2.907553, 0.145098, 1, 0, 1,
-0.4917099, -0.4969317, -1.789044, 0.1411765, 1, 0, 1,
-0.4904583, -1.135925, -1.913574, 0.1333333, 1, 0, 1,
-0.487074, 0.2459776, -1.302972, 0.1294118, 1, 0, 1,
-0.4812905, 1.288501, -1.401082, 0.1215686, 1, 0, 1,
-0.4799504, -0.1257617, -1.384708, 0.1176471, 1, 0, 1,
-0.4786037, -2.123573, -4.378313, 0.1098039, 1, 0, 1,
-0.4628901, -0.3332626, -1.625951, 0.1058824, 1, 0, 1,
-0.4567195, -0.5702132, -1.804538, 0.09803922, 1, 0, 1,
-0.4562512, -0.7445042, -1.785452, 0.09019608, 1, 0, 1,
-0.4555972, 0.2368344, -2.633554, 0.08627451, 1, 0, 1,
-0.4499224, 0.2751772, -0.6196371, 0.07843138, 1, 0, 1,
-0.449447, -1.07903, -3.57726, 0.07450981, 1, 0, 1,
-0.4491242, 0.7175376, -0.5187562, 0.06666667, 1, 0, 1,
-0.4448492, 0.1977941, -0.906458, 0.0627451, 1, 0, 1,
-0.4385431, -0.02401928, -3.385683, 0.05490196, 1, 0, 1,
-0.4341513, -0.3938411, -0.8737097, 0.05098039, 1, 0, 1,
-0.4335706, 0.2860828, -0.9266737, 0.04313726, 1, 0, 1,
-0.4329819, -0.9875314, -2.487394, 0.03921569, 1, 0, 1,
-0.4250967, 0.4349235, -0.7257009, 0.03137255, 1, 0, 1,
-0.4241777, -0.361327, -3.038674, 0.02745098, 1, 0, 1,
-0.4236645, -0.4739773, -1.198788, 0.01960784, 1, 0, 1,
-0.4199115, -0.3813436, -3.237201, 0.01568628, 1, 0, 1,
-0.4183819, 0.01492555, -1.729283, 0.007843138, 1, 0, 1,
-0.4169647, -1.68189, -3.342998, 0.003921569, 1, 0, 1,
-0.415857, -0.1175882, -2.111639, 0, 1, 0.003921569, 1,
-0.41086, -0.4847821, -2.295114, 0, 1, 0.01176471, 1,
-0.4028336, -0.07984556, -4.074893, 0, 1, 0.01568628, 1,
-0.4002742, 0.4086187, 0.21687, 0, 1, 0.02352941, 1,
-0.3966796, -0.3637893, -4.608907, 0, 1, 0.02745098, 1,
-0.3942551, 0.2723535, -1.577857, 0, 1, 0.03529412, 1,
-0.3932968, -0.8988141, -2.149397, 0, 1, 0.03921569, 1,
-0.3930716, 2.823061, -1.351205, 0, 1, 0.04705882, 1,
-0.3917538, 1.998619, -0.9591987, 0, 1, 0.05098039, 1,
-0.3908316, 2.359249, -2.22732, 0, 1, 0.05882353, 1,
-0.385666, 0.3918853, -0.3852629, 0, 1, 0.0627451, 1,
-0.3827955, 0.4516234, -0.9533538, 0, 1, 0.07058824, 1,
-0.3815241, 1.222316, -0.4442129, 0, 1, 0.07450981, 1,
-0.3800789, 2.429958, 1.276462, 0, 1, 0.08235294, 1,
-0.3769792, -0.07036193, -2.143393, 0, 1, 0.08627451, 1,
-0.376684, 0.4368918, -1.561362, 0, 1, 0.09411765, 1,
-0.3737552, 0.6761804, -0.4889947, 0, 1, 0.1019608, 1,
-0.3722142, -0.9619468, -2.369375, 0, 1, 0.1058824, 1,
-0.3690448, -0.6471694, -4.412246, 0, 1, 0.1137255, 1,
-0.3634479, 0.2629533, 0.1343124, 0, 1, 0.1176471, 1,
-0.3624807, -0.8635188, -2.929125, 0, 1, 0.1254902, 1,
-0.3614863, 0.2960337, -2.068627, 0, 1, 0.1294118, 1,
-0.3603571, 1.894724, -0.1766722, 0, 1, 0.1372549, 1,
-0.3599305, -1.259507, -2.657757, 0, 1, 0.1411765, 1,
-0.3589296, 0.2669876, -2.842794, 0, 1, 0.1490196, 1,
-0.3553863, -0.4353486, -2.138267, 0, 1, 0.1529412, 1,
-0.354472, 0.8628746, -0.07631478, 0, 1, 0.1607843, 1,
-0.3531685, 1.221407, 1.869312, 0, 1, 0.1647059, 1,
-0.3527757, -0.2672414, -4.082895, 0, 1, 0.172549, 1,
-0.351279, -1.300657, -1.711501, 0, 1, 0.1764706, 1,
-0.3484888, 0.04547648, -1.652622, 0, 1, 0.1843137, 1,
-0.3482822, -0.2520006, -2.984311, 0, 1, 0.1882353, 1,
-0.3480355, -0.7826209, -3.531548, 0, 1, 0.1960784, 1,
-0.3430293, -0.003656355, -2.187652, 0, 1, 0.2039216, 1,
-0.3423814, 1.028513, -0.3142277, 0, 1, 0.2078431, 1,
-0.338783, 0.3646051, -1.128299, 0, 1, 0.2156863, 1,
-0.3271388, -0.2942917, -1.756146, 0, 1, 0.2196078, 1,
-0.3265697, -0.429776, -1.567303, 0, 1, 0.227451, 1,
-0.3234617, 1.255348, 0.2218102, 0, 1, 0.2313726, 1,
-0.3136722, 0.1823963, -1.471248, 0, 1, 0.2392157, 1,
-0.3070348, -0.8966648, -1.513662, 0, 1, 0.2431373, 1,
-0.2938634, -0.03947864, -2.467105, 0, 1, 0.2509804, 1,
-0.293523, 0.4978425, -1.003282, 0, 1, 0.254902, 1,
-0.2919741, 0.01200309, -1.734173, 0, 1, 0.2627451, 1,
-0.2904359, 0.7655286, -2.886597, 0, 1, 0.2666667, 1,
-0.2901955, 0.07250468, -2.777054, 0, 1, 0.2745098, 1,
-0.2889693, 0.7930585, -0.02163732, 0, 1, 0.2784314, 1,
-0.2868417, 0.7674873, -1.015641, 0, 1, 0.2862745, 1,
-0.2844845, 0.8574364, 0.7508869, 0, 1, 0.2901961, 1,
-0.2834264, -1.152852, -4.212701, 0, 1, 0.2980392, 1,
-0.2799936, -0.2982966, -3.056614, 0, 1, 0.3058824, 1,
-0.2792788, 2.08176, 1.080301, 0, 1, 0.3098039, 1,
-0.2792413, -1.186795, -2.787941, 0, 1, 0.3176471, 1,
-0.2790558, 0.6404558, 0.8950253, 0, 1, 0.3215686, 1,
-0.274344, -0.4529133, -3.175896, 0, 1, 0.3294118, 1,
-0.2723525, 0.06237561, -0.8262363, 0, 1, 0.3333333, 1,
-0.2720699, -0.09910417, -3.059575, 0, 1, 0.3411765, 1,
-0.2698995, -1.78889, -3.651946, 0, 1, 0.345098, 1,
-0.2686343, -1.89264, -2.211172, 0, 1, 0.3529412, 1,
-0.2682722, 1.421486, -0.7504976, 0, 1, 0.3568628, 1,
-0.2671689, 0.7518022, -0.609252, 0, 1, 0.3647059, 1,
-0.2656068, -0.568353, -2.739238, 0, 1, 0.3686275, 1,
-0.2639664, 0.1594572, -0.709488, 0, 1, 0.3764706, 1,
-0.2622341, -1.656098, -3.09429, 0, 1, 0.3803922, 1,
-0.2619886, 1.026015, -0.103718, 0, 1, 0.3882353, 1,
-0.2572618, -0.4196649, -4.999114, 0, 1, 0.3921569, 1,
-0.2471556, -0.8715336, -3.715765, 0, 1, 0.4, 1,
-0.2437239, 0.09078947, -2.770561, 0, 1, 0.4078431, 1,
-0.239784, -0.6292179, -2.903588, 0, 1, 0.4117647, 1,
-0.2389322, -0.5894697, -1.361165, 0, 1, 0.4196078, 1,
-0.2382613, -1.134211, -3.085582, 0, 1, 0.4235294, 1,
-0.2328035, 0.2691849, -0.4334598, 0, 1, 0.4313726, 1,
-0.2317731, -0.1962447, -2.798999, 0, 1, 0.4352941, 1,
-0.2303431, 0.6246185, -0.3578045, 0, 1, 0.4431373, 1,
-0.2278272, 2.37107, 0.08657564, 0, 1, 0.4470588, 1,
-0.2275656, 1.539139, -0.4609453, 0, 1, 0.454902, 1,
-0.2199876, -0.6432125, -1.88513, 0, 1, 0.4588235, 1,
-0.2186369, -0.6601648, -3.847323, 0, 1, 0.4666667, 1,
-0.2158026, -3.525761, -3.292511, 0, 1, 0.4705882, 1,
-0.2155832, 0.4715292, -1.9402, 0, 1, 0.4784314, 1,
-0.2153516, 1.645683, 1.425974, 0, 1, 0.4823529, 1,
-0.2104501, -0.06750226, -2.246396, 0, 1, 0.4901961, 1,
-0.2082784, -0.498219, -3.778104, 0, 1, 0.4941176, 1,
-0.2055076, -0.2271048, -4.218209, 0, 1, 0.5019608, 1,
-0.204969, 2.187837, -1.062629, 0, 1, 0.509804, 1,
-0.2039589, -1.548076, -3.841306, 0, 1, 0.5137255, 1,
-0.2033575, 1.590503, 0.8133387, 0, 1, 0.5215687, 1,
-0.2030139, 0.4152979, -0.8885343, 0, 1, 0.5254902, 1,
-0.2002267, -1.181529, -1.110092, 0, 1, 0.5333334, 1,
-0.1942613, 0.1813062, -1.982466, 0, 1, 0.5372549, 1,
-0.1866403, -0.03588155, 0.01950448, 0, 1, 0.5450981, 1,
-0.1856956, -1.349144, -3.734274, 0, 1, 0.5490196, 1,
-0.179871, -1.878844, -4.273236, 0, 1, 0.5568628, 1,
-0.1781534, 2.189159, -0.8118697, 0, 1, 0.5607843, 1,
-0.1776941, 0.1661798, -0.628737, 0, 1, 0.5686275, 1,
-0.176487, -1.159574, -2.911366, 0, 1, 0.572549, 1,
-0.1756788, 1.025801, 0.8598201, 0, 1, 0.5803922, 1,
-0.1743074, -1.415373, -2.653833, 0, 1, 0.5843138, 1,
-0.1714519, -1.904153, -3.161711, 0, 1, 0.5921569, 1,
-0.1693355, 0.6108145, -0.3841155, 0, 1, 0.5960785, 1,
-0.1664975, -0.7652371, -5.156672, 0, 1, 0.6039216, 1,
-0.1660735, 1.999897, -2.257233, 0, 1, 0.6117647, 1,
-0.1640352, -2.882494, -2.190647, 0, 1, 0.6156863, 1,
-0.161925, 0.4714604, 1.210543, 0, 1, 0.6235294, 1,
-0.1529768, 0.5660424, -0.1875824, 0, 1, 0.627451, 1,
-0.1527741, -0.6516196, -1.973563, 0, 1, 0.6352941, 1,
-0.1515736, -0.5309142, -2.605789, 0, 1, 0.6392157, 1,
-0.1483915, 0.3733379, 0.6214091, 0, 1, 0.6470588, 1,
-0.1443106, 0.7743015, -0.5631562, 0, 1, 0.6509804, 1,
-0.1403649, -0.09116959, -2.374947, 0, 1, 0.6588235, 1,
-0.1388192, -0.7822655, -5.159379, 0, 1, 0.6627451, 1,
-0.13624, 0.5323747, 2.345882, 0, 1, 0.6705883, 1,
-0.1359281, -1.121532, -2.919723, 0, 1, 0.6745098, 1,
-0.1344505, 2.573709, 0.8527476, 0, 1, 0.682353, 1,
-0.124803, -1.300722, -3.324089, 0, 1, 0.6862745, 1,
-0.1220379, 1.484598, 0.6474382, 0, 1, 0.6941177, 1,
-0.1210923, -0.6913425, -3.190428, 0, 1, 0.7019608, 1,
-0.1208951, 1.188547, 1.854741, 0, 1, 0.7058824, 1,
-0.1196703, 1.15144, -1.098229, 0, 1, 0.7137255, 1,
-0.1189558, 1.665854, -0.8285289, 0, 1, 0.7176471, 1,
-0.1148188, -0.6426826, -2.368192, 0, 1, 0.7254902, 1,
-0.1132952, 0.1509679, -1.025693, 0, 1, 0.7294118, 1,
-0.1120893, 0.3428413, -0.8289242, 0, 1, 0.7372549, 1,
-0.1111328, -0.9119498, -3.324188, 0, 1, 0.7411765, 1,
-0.1098379, 0.1112979, -0.2594503, 0, 1, 0.7490196, 1,
-0.1098122, 0.9946941, -2.292705, 0, 1, 0.7529412, 1,
-0.1067099, 0.9990721, -0.2569777, 0, 1, 0.7607843, 1,
-0.1048955, -0.08122563, -1.773257, 0, 1, 0.7647059, 1,
-0.1001888, 0.6121724, -0.6477131, 0, 1, 0.772549, 1,
-0.09853526, -1.716814, -3.323183, 0, 1, 0.7764706, 1,
-0.09834012, 3.04806, -1.031692, 0, 1, 0.7843137, 1,
-0.09391384, 0.5696642, -0.3884226, 0, 1, 0.7882353, 1,
-0.09315576, -0.03634342, -1.215648, 0, 1, 0.7960784, 1,
-0.09287272, -0.320518, -3.798906, 0, 1, 0.8039216, 1,
-0.07643282, -0.3981321, -1.603016, 0, 1, 0.8078431, 1,
-0.06750393, -0.2617334, -2.844378, 0, 1, 0.8156863, 1,
-0.06710078, 1.475422, -0.4662738, 0, 1, 0.8196079, 1,
-0.0661971, 0.5297435, 1.041632, 0, 1, 0.827451, 1,
-0.06307143, 1.523157, 0.8724719, 0, 1, 0.8313726, 1,
-0.06077073, 0.7278993, 0.2473579, 0, 1, 0.8392157, 1,
-0.05583169, 1.491679, 1.098878, 0, 1, 0.8431373, 1,
-0.04679144, -0.5706779, -3.785151, 0, 1, 0.8509804, 1,
-0.03886477, 0.8790442, 0.135956, 0, 1, 0.854902, 1,
-0.0387463, 1.513416, 1.502393, 0, 1, 0.8627451, 1,
-0.03038413, 0.5841035, -0.9411629, 0, 1, 0.8666667, 1,
-0.02986494, -0.5119847, -2.842195, 0, 1, 0.8745098, 1,
-0.02634521, -0.8748811, -3.643051, 0, 1, 0.8784314, 1,
-0.01964349, 1.010696, -0.8379866, 0, 1, 0.8862745, 1,
-0.01609812, -1.661735, -1.050915, 0, 1, 0.8901961, 1,
-0.01352874, 0.2438062, -0.8378967, 0, 1, 0.8980392, 1,
-0.01244735, -1.227614, -2.565809, 0, 1, 0.9058824, 1,
-0.009394202, 0.288193, 1.823943, 0, 1, 0.9098039, 1,
-0.007794493, -0.543376, -1.978045, 0, 1, 0.9176471, 1,
-0.00657816, 1.454348, 0.520214, 0, 1, 0.9215686, 1,
-0.006251986, 1.84924, 0.8602443, 0, 1, 0.9294118, 1,
-0.001177474, 0.5513617, 0.1319297, 0, 1, 0.9333333, 1,
0.00632339, -0.9744901, 2.458292, 0, 1, 0.9411765, 1,
0.006886629, -0.2883396, 2.344794, 0, 1, 0.945098, 1,
0.007708756, 0.7158485, -1.524446, 0, 1, 0.9529412, 1,
0.01157017, -0.8668419, 3.807673, 0, 1, 0.9568627, 1,
0.01264775, 0.29966, 0.9693239, 0, 1, 0.9647059, 1,
0.01335458, 1.81025, -0.2985329, 0, 1, 0.9686275, 1,
0.01365207, 0.6523482, 1.588159, 0, 1, 0.9764706, 1,
0.01852498, 0.8293136, 0.6988547, 0, 1, 0.9803922, 1,
0.02231849, -0.6811426, 2.477288, 0, 1, 0.9882353, 1,
0.02298799, -0.5505835, 1.114015, 0, 1, 0.9921569, 1,
0.02425959, -1.828059, 3.886332, 0, 1, 1, 1,
0.02642729, 1.206019, -0.2113236, 0, 0.9921569, 1, 1,
0.02894667, -0.9839742, 3.186965, 0, 0.9882353, 1, 1,
0.03277373, 1.290569, -0.0636421, 0, 0.9803922, 1, 1,
0.03436021, 0.2769002, 1.490925, 0, 0.9764706, 1, 1,
0.03477861, -0.5026458, 2.637728, 0, 0.9686275, 1, 1,
0.03686368, 0.9319085, 1.171007, 0, 0.9647059, 1, 1,
0.0374273, -1.177781, 2.19591, 0, 0.9568627, 1, 1,
0.03920447, 0.9624216, -1.120467, 0, 0.9529412, 1, 1,
0.04003334, 0.4064505, 1.297087, 0, 0.945098, 1, 1,
0.04294189, 0.009333893, 0.3821169, 0, 0.9411765, 1, 1,
0.04323123, -0.3760898, 2.873219, 0, 0.9333333, 1, 1,
0.04466159, -1.218002, 3.118782, 0, 0.9294118, 1, 1,
0.04565884, -0.7590765, 1.219291, 0, 0.9215686, 1, 1,
0.04760936, 0.4961108, -1.756634, 0, 0.9176471, 1, 1,
0.05189682, -0.006932309, 1.596319, 0, 0.9098039, 1, 1,
0.05354225, -0.6625659, 2.291275, 0, 0.9058824, 1, 1,
0.05573748, 0.6261907, 0.6995914, 0, 0.8980392, 1, 1,
0.05710294, -1.907486, 3.803771, 0, 0.8901961, 1, 1,
0.06659622, -0.1518413, 1.902291, 0, 0.8862745, 1, 1,
0.06834406, -0.5373074, 2.699532, 0, 0.8784314, 1, 1,
0.06867257, -0.5148857, 2.018838, 0, 0.8745098, 1, 1,
0.07112336, 1.216455, 1.531557, 0, 0.8666667, 1, 1,
0.07357491, 0.2716986, 0.2532423, 0, 0.8627451, 1, 1,
0.07675943, -1.216485, 4.68359, 0, 0.854902, 1, 1,
0.07739049, 0.5472311, -0.1663808, 0, 0.8509804, 1, 1,
0.07999531, -0.3722422, 1.125748, 0, 0.8431373, 1, 1,
0.08144131, 0.6269435, 0.6408747, 0, 0.8392157, 1, 1,
0.08266418, -0.7263893, 3.935116, 0, 0.8313726, 1, 1,
0.08360379, 0.3768341, 0.7584546, 0, 0.827451, 1, 1,
0.08486094, 1.306323, -1.048659, 0, 0.8196079, 1, 1,
0.08642345, 1.23778, 1.091334, 0, 0.8156863, 1, 1,
0.08942098, -2.340678, 4.583189, 0, 0.8078431, 1, 1,
0.09630403, -1.105649, 4.168695, 0, 0.8039216, 1, 1,
0.09647283, -0.5002963, 2.299345, 0, 0.7960784, 1, 1,
0.1004392, 1.833742, 0.8758241, 0, 0.7882353, 1, 1,
0.1040475, 0.8324934, -0.3615776, 0, 0.7843137, 1, 1,
0.106179, -0.6438094, 2.594295, 0, 0.7764706, 1, 1,
0.1150483, -0.6182169, 3.780776, 0, 0.772549, 1, 1,
0.1237502, 0.09861717, 1.156333, 0, 0.7647059, 1, 1,
0.1241201, -0.3954867, 3.151626, 0, 0.7607843, 1, 1,
0.1267162, 1.273887, -0.560463, 0, 0.7529412, 1, 1,
0.1295591, 1.04454, 1.547158, 0, 0.7490196, 1, 1,
0.1308922, -0.6530962, 4.079636, 0, 0.7411765, 1, 1,
0.1336595, 1.253756, -0.3309766, 0, 0.7372549, 1, 1,
0.134761, -0.3654532, 3.307532, 0, 0.7294118, 1, 1,
0.1385192, -0.8668178, 2.405918, 0, 0.7254902, 1, 1,
0.1409735, 1.227377, -0.8816692, 0, 0.7176471, 1, 1,
0.1450464, -1.075594, 2.904685, 0, 0.7137255, 1, 1,
0.1473026, 0.4574493, -0.3823933, 0, 0.7058824, 1, 1,
0.1477557, -0.7512169, 1.367394, 0, 0.6980392, 1, 1,
0.1523425, -1.763836, 1.317672, 0, 0.6941177, 1, 1,
0.1549449, 0.7857132, 0.6415886, 0, 0.6862745, 1, 1,
0.164277, -1.619709, 1.270188, 0, 0.682353, 1, 1,
0.1676558, 0.5662898, 0.7240189, 0, 0.6745098, 1, 1,
0.1677283, 1.026592, 1.003149, 0, 0.6705883, 1, 1,
0.1709622, -1.038606, 3.394537, 0, 0.6627451, 1, 1,
0.1737797, -0.3095478, 1.891514, 0, 0.6588235, 1, 1,
0.178719, 0.1416455, 2.27843, 0, 0.6509804, 1, 1,
0.1797342, -1.173925, 2.618755, 0, 0.6470588, 1, 1,
0.1806639, 1.20511, -0.8395592, 0, 0.6392157, 1, 1,
0.1847273, -0.311746, 2.763596, 0, 0.6352941, 1, 1,
0.1869457, 0.3667658, 0.1263992, 0, 0.627451, 1, 1,
0.1962008, -0.3773159, 2.206145, 0, 0.6235294, 1, 1,
0.2057568, 0.7912262, -0.1382698, 0, 0.6156863, 1, 1,
0.2060211, -0.1113266, 2.986756, 0, 0.6117647, 1, 1,
0.2075168, -0.48153, 4.300186, 0, 0.6039216, 1, 1,
0.2075546, -0.06486759, 2.023758, 0, 0.5960785, 1, 1,
0.2093759, 1.052689, 0.6214215, 0, 0.5921569, 1, 1,
0.2115486, 0.512539, 2.109991, 0, 0.5843138, 1, 1,
0.2135449, 0.6619737, 1.651363, 0, 0.5803922, 1, 1,
0.2157968, 1.358495, 0.2060089, 0, 0.572549, 1, 1,
0.2203474, 1.378546, -0.9424766, 0, 0.5686275, 1, 1,
0.2213582, 0.6054634, -0.9573912, 0, 0.5607843, 1, 1,
0.2270728, -1.699309, 2.381834, 0, 0.5568628, 1, 1,
0.2314009, 1.450395, 0.4889853, 0, 0.5490196, 1, 1,
0.2350307, 1.320553, 1.031589, 0, 0.5450981, 1, 1,
0.2364284, 1.172096, 0.5569212, 0, 0.5372549, 1, 1,
0.2385128, 0.5828519, 0.1084108, 0, 0.5333334, 1, 1,
0.240739, 0.14634, -0.5238174, 0, 0.5254902, 1, 1,
0.2408223, -1.194709, 3.868248, 0, 0.5215687, 1, 1,
0.2490331, 0.4434005, 0.6568012, 0, 0.5137255, 1, 1,
0.2498712, 1.116871, -0.9519998, 0, 0.509804, 1, 1,
0.255576, -1.738518, 3.202752, 0, 0.5019608, 1, 1,
0.2644344, -0.5057176, 3.602072, 0, 0.4941176, 1, 1,
0.2681211, -0.6153781, 5.303564, 0, 0.4901961, 1, 1,
0.2718119, 1.448202, -0.8988616, 0, 0.4823529, 1, 1,
0.2731733, 0.3824514, 1.411154, 0, 0.4784314, 1, 1,
0.2739545, -1.083995, 1.747453, 0, 0.4705882, 1, 1,
0.2752696, -1.056854, 1.505615, 0, 0.4666667, 1, 1,
0.2762059, 0.4806609, 1.817827, 0, 0.4588235, 1, 1,
0.2775369, 0.2936459, 2.437952, 0, 0.454902, 1, 1,
0.2801794, 1.7162, -0.5700153, 0, 0.4470588, 1, 1,
0.2821073, 0.1914038, 1.161613, 0, 0.4431373, 1, 1,
0.2821503, 0.4234534, 1.262255, 0, 0.4352941, 1, 1,
0.28622, -0.9544408, 4.531616, 0, 0.4313726, 1, 1,
0.2865951, -0.5736101, 2.383277, 0, 0.4235294, 1, 1,
0.2881447, 0.1848839, 1.231395, 0, 0.4196078, 1, 1,
0.2904813, -0.3747746, 2.021391, 0, 0.4117647, 1, 1,
0.2938613, 0.1330411, 1.618772, 0, 0.4078431, 1, 1,
0.2965011, 1.040653, -0.6177573, 0, 0.4, 1, 1,
0.2984114, 1.603167, -0.636881, 0, 0.3921569, 1, 1,
0.3012976, 2.277645, -0.1674257, 0, 0.3882353, 1, 1,
0.3023608, -2.094899, 3.044065, 0, 0.3803922, 1, 1,
0.3046249, 1.56016, 0.8499895, 0, 0.3764706, 1, 1,
0.3082651, 1.602163, 0.9613156, 0, 0.3686275, 1, 1,
0.3090398, 0.8050941, -0.3075577, 0, 0.3647059, 1, 1,
0.3117178, 0.2991597, 1.387077, 0, 0.3568628, 1, 1,
0.3123139, -0.3261317, 3.478651, 0, 0.3529412, 1, 1,
0.3159727, -0.5076092, 2.94545, 0, 0.345098, 1, 1,
0.3170386, 0.744695, -0.5237523, 0, 0.3411765, 1, 1,
0.318203, 0.2591305, 1.880504, 0, 0.3333333, 1, 1,
0.3184831, 1.456854, -0.4637791, 0, 0.3294118, 1, 1,
0.3203625, 0.1452107, 1.624694, 0, 0.3215686, 1, 1,
0.3270128, -0.7116319, 1.975496, 0, 0.3176471, 1, 1,
0.3309202, -0.2809112, 1.074049, 0, 0.3098039, 1, 1,
0.3316508, 1.060417, -1.29917, 0, 0.3058824, 1, 1,
0.3321096, 1.584915, -0.3950774, 0, 0.2980392, 1, 1,
0.3353309, 0.8084385, 1.105931, 0, 0.2901961, 1, 1,
0.3379485, 0.9057986, 0.7205348, 0, 0.2862745, 1, 1,
0.3412853, -0.3799148, 3.474994, 0, 0.2784314, 1, 1,
0.3459733, -0.1389908, 3.38911, 0, 0.2745098, 1, 1,
0.3542169, 1.026391, 0.0145505, 0, 0.2666667, 1, 1,
0.3570949, 0.7606836, 0.5945133, 0, 0.2627451, 1, 1,
0.3581073, -2.288545, 2.889914, 0, 0.254902, 1, 1,
0.3603027, 0.7526305, 1.153394, 0, 0.2509804, 1, 1,
0.3606392, -1.181092, 4.041933, 0, 0.2431373, 1, 1,
0.3676733, 0.08444481, 2.399669, 0, 0.2392157, 1, 1,
0.3684576, 0.4885363, 2.856581, 0, 0.2313726, 1, 1,
0.3686034, -0.6096925, 3.121232, 0, 0.227451, 1, 1,
0.37707, 1.268724, -0.8881974, 0, 0.2196078, 1, 1,
0.3823246, 0.3928748, -0.3836351, 0, 0.2156863, 1, 1,
0.3847323, -0.006516178, 1.679574, 0, 0.2078431, 1, 1,
0.385945, -2.106491, 2.045809, 0, 0.2039216, 1, 1,
0.3896626, -0.5311518, 1.985788, 0, 0.1960784, 1, 1,
0.3911196, 0.6901996, 0.03209598, 0, 0.1882353, 1, 1,
0.3982034, 1.931586, 0.0865248, 0, 0.1843137, 1, 1,
0.3982735, -0.1631851, 2.280666, 0, 0.1764706, 1, 1,
0.3987872, 0.5544457, 1.721266, 0, 0.172549, 1, 1,
0.4006858, -1.974569, 2.741454, 0, 0.1647059, 1, 1,
0.4049887, 0.9621695, -0.7581255, 0, 0.1607843, 1, 1,
0.405252, 0.6635024, -0.3425041, 0, 0.1529412, 1, 1,
0.4098387, 1.520122, 0.9350027, 0, 0.1490196, 1, 1,
0.4225115, 0.707715, 1.987291, 0, 0.1411765, 1, 1,
0.4236178, 1.018255, 0.8522174, 0, 0.1372549, 1, 1,
0.4289348, -0.05461787, 1.467213, 0, 0.1294118, 1, 1,
0.4316491, 0.2225898, 2.731879, 0, 0.1254902, 1, 1,
0.4330959, 0.1343044, 2.480222, 0, 0.1176471, 1, 1,
0.4336823, 0.3361883, 0.4717146, 0, 0.1137255, 1, 1,
0.4337977, 1.602876, -0.5864933, 0, 0.1058824, 1, 1,
0.4411223, -0.9944195, 1.080688, 0, 0.09803922, 1, 1,
0.4465069, -0.48074, 2.687458, 0, 0.09411765, 1, 1,
0.4525462, 1.869684, 1.715065, 0, 0.08627451, 1, 1,
0.4564472, 0.6046911, 1.739288, 0, 0.08235294, 1, 1,
0.4599094, -0.9605144, 4.474311, 0, 0.07450981, 1, 1,
0.4631476, 1.160155, -0.8341864, 0, 0.07058824, 1, 1,
0.4702725, 0.208132, 2.581007, 0, 0.0627451, 1, 1,
0.4710325, -0.8258283, 1.890913, 0, 0.05882353, 1, 1,
0.47499, -0.6920869, 0.6512849, 0, 0.05098039, 1, 1,
0.4754434, 1.185125, -0.6570247, 0, 0.04705882, 1, 1,
0.4757242, 0.6015952, -0.3805565, 0, 0.03921569, 1, 1,
0.4759143, -0.5212126, 1.830327, 0, 0.03529412, 1, 1,
0.4772779, 0.418893, 0.2617211, 0, 0.02745098, 1, 1,
0.4808619, 0.946353, 0.3106667, 0, 0.02352941, 1, 1,
0.4831407, -1.296703, 3.273451, 0, 0.01568628, 1, 1,
0.4861186, -1.905512, 2.863798, 0, 0.01176471, 1, 1,
0.4873855, -2.266892, 3.552221, 0, 0.003921569, 1, 1,
0.491894, 0.4047026, 2.019217, 0.003921569, 0, 1, 1,
0.4977537, 2.654338, 1.257482, 0.007843138, 0, 1, 1,
0.4983417, -0.4236009, 1.696677, 0.01568628, 0, 1, 1,
0.499291, 0.6663005, 1.555662, 0.01960784, 0, 1, 1,
0.5002822, 1.718932, 0.599739, 0.02745098, 0, 1, 1,
0.5022491, -0.4993036, 3.369853, 0.03137255, 0, 1, 1,
0.5059886, -0.08606865, 1.839881, 0.03921569, 0, 1, 1,
0.5084503, 1.999885, -1.152196, 0.04313726, 0, 1, 1,
0.5117174, 0.09267066, 2.045075, 0.05098039, 0, 1, 1,
0.5144299, -0.4631971, 2.950019, 0.05490196, 0, 1, 1,
0.5192701, -0.791293, 0.6261029, 0.0627451, 0, 1, 1,
0.5226429, -0.1600067, 0.9351581, 0.06666667, 0, 1, 1,
0.523785, -0.3935412, 1.359467, 0.07450981, 0, 1, 1,
0.5254847, -1.272619, 1.530214, 0.07843138, 0, 1, 1,
0.5285971, -0.835879, 2.513063, 0.08627451, 0, 1, 1,
0.5314973, -0.3693472, 2.69931, 0.09019608, 0, 1, 1,
0.5340017, 0.5478446, 1.377679, 0.09803922, 0, 1, 1,
0.5340964, 0.1106553, 1.365512, 0.1058824, 0, 1, 1,
0.5416678, 0.6970288, 0.8961198, 0.1098039, 0, 1, 1,
0.5452966, -0.2700068, 1.148142, 0.1176471, 0, 1, 1,
0.5465502, -0.7119251, 4.062121, 0.1215686, 0, 1, 1,
0.5473195, 0.4150803, 2.10835, 0.1294118, 0, 1, 1,
0.5584683, 0.3865594, 1.47398, 0.1333333, 0, 1, 1,
0.5606894, 0.6368414, 0.1337782, 0.1411765, 0, 1, 1,
0.5638152, -0.2334345, 0.8666106, 0.145098, 0, 1, 1,
0.5652415, -0.5956074, 3.057302, 0.1529412, 0, 1, 1,
0.5715216, -0.1756287, 3.394526, 0.1568628, 0, 1, 1,
0.5785635, -0.6415362, 1.543606, 0.1647059, 0, 1, 1,
0.5904761, -2.404261, 4.003024, 0.1686275, 0, 1, 1,
0.5972589, 1.203318, 1.001379, 0.1764706, 0, 1, 1,
0.6100595, -0.899537, 5.341876, 0.1803922, 0, 1, 1,
0.6137446, -0.02041849, 3.358423, 0.1882353, 0, 1, 1,
0.6162172, -0.5701906, 2.345121, 0.1921569, 0, 1, 1,
0.6187214, -0.3754676, 2.27601, 0.2, 0, 1, 1,
0.6273235, 0.5482801, 1.242315, 0.2078431, 0, 1, 1,
0.6305407, -1.10489, 0.2694492, 0.2117647, 0, 1, 1,
0.6364, -0.2703804, 1.652445, 0.2196078, 0, 1, 1,
0.6377088, -0.8262881, 2.767714, 0.2235294, 0, 1, 1,
0.6380219, -0.1541838, 3.433645, 0.2313726, 0, 1, 1,
0.640723, 1.470447, -0.4232623, 0.2352941, 0, 1, 1,
0.6408368, 0.3447188, 1.263852, 0.2431373, 0, 1, 1,
0.6428359, 1.745842, 0.703442, 0.2470588, 0, 1, 1,
0.6452785, 0.3982378, -0.3370495, 0.254902, 0, 1, 1,
0.6455593, -1.089129, 3.176794, 0.2588235, 0, 1, 1,
0.6482008, -0.4334439, 2.544089, 0.2666667, 0, 1, 1,
0.6489145, 0.6138098, 2.507606, 0.2705882, 0, 1, 1,
0.6509284, 1.827423, -0.5409597, 0.2784314, 0, 1, 1,
0.6544333, 0.86063, 1.271386, 0.282353, 0, 1, 1,
0.6559194, 1.109399, 1.739852, 0.2901961, 0, 1, 1,
0.6643878, 0.4770941, 0.425959, 0.2941177, 0, 1, 1,
0.6655719, 0.3158021, 0.7135588, 0.3019608, 0, 1, 1,
0.6662138, -0.2630925, 3.227856, 0.3098039, 0, 1, 1,
0.6662247, 0.2202573, 1.358062, 0.3137255, 0, 1, 1,
0.6664178, -0.9884359, 3.602072, 0.3215686, 0, 1, 1,
0.6686845, -1.352548, 3.543748, 0.3254902, 0, 1, 1,
0.6876233, 1.456528, -0.9389492, 0.3333333, 0, 1, 1,
0.6882618, -0.6562636, 3.547484, 0.3372549, 0, 1, 1,
0.6925585, 1.221385, 2.783932, 0.345098, 0, 1, 1,
0.6996734, 0.3386684, 1.134209, 0.3490196, 0, 1, 1,
0.7031727, 0.7620167, 0.3141348, 0.3568628, 0, 1, 1,
0.7038743, -0.947202, 3.628547, 0.3607843, 0, 1, 1,
0.7044194, -0.6422645, 3.193257, 0.3686275, 0, 1, 1,
0.7061152, -1.2124, 1.350228, 0.372549, 0, 1, 1,
0.7090317, -1.629987, 2.63904, 0.3803922, 0, 1, 1,
0.7178007, -0.6307554, 1.553075, 0.3843137, 0, 1, 1,
0.7247658, -0.6335927, 2.074974, 0.3921569, 0, 1, 1,
0.7250326, -0.6718194, 1.993456, 0.3960784, 0, 1, 1,
0.7250947, 1.153558, 0.8615469, 0.4039216, 0, 1, 1,
0.7291251, 1.286236, 2.644637, 0.4117647, 0, 1, 1,
0.7299633, -0.3675771, 3.28674, 0.4156863, 0, 1, 1,
0.7311174, 0.07718684, 1.183037, 0.4235294, 0, 1, 1,
0.7345926, 0.9205061, 0.4158505, 0.427451, 0, 1, 1,
0.7447062, -0.7751713, 3.616079, 0.4352941, 0, 1, 1,
0.7548335, 1.281764, 0.9185891, 0.4392157, 0, 1, 1,
0.7611969, -1.877485, 1.71489, 0.4470588, 0, 1, 1,
0.7678107, 0.0853287, 1.584569, 0.4509804, 0, 1, 1,
0.7730556, 0.0398899, 3.759843, 0.4588235, 0, 1, 1,
0.7782391, 0.6624169, 1.757553, 0.4627451, 0, 1, 1,
0.7787325, -1.430286, 2.016241, 0.4705882, 0, 1, 1,
0.7827845, -0.3799979, 1.624333, 0.4745098, 0, 1, 1,
0.7859249, 0.0408508, 1.880738, 0.4823529, 0, 1, 1,
0.7883463, 0.9086257, 0.4109548, 0.4862745, 0, 1, 1,
0.7899758, 1.635785, 1.312642, 0.4941176, 0, 1, 1,
0.7901374, -0.337561, 0.3491664, 0.5019608, 0, 1, 1,
0.7960395, 1.459693, 1.318007, 0.5058824, 0, 1, 1,
0.8000478, -1.450183, 1.413267, 0.5137255, 0, 1, 1,
0.8044267, 0.04039118, 0.3219453, 0.5176471, 0, 1, 1,
0.8059804, -1.201612, 3.224301, 0.5254902, 0, 1, 1,
0.8062832, -1.155574, 2.406895, 0.5294118, 0, 1, 1,
0.8067006, -0.1299536, 1.409558, 0.5372549, 0, 1, 1,
0.8097265, 1.981384, 1.894693, 0.5411765, 0, 1, 1,
0.8105964, -0.656132, 2.285618, 0.5490196, 0, 1, 1,
0.8141503, -0.8803819, 3.485069, 0.5529412, 0, 1, 1,
0.814532, 0.002318504, 1.653694, 0.5607843, 0, 1, 1,
0.8155756, -0.8445792, 2.309228, 0.5647059, 0, 1, 1,
0.8158988, 0.2666346, 0.7479486, 0.572549, 0, 1, 1,
0.8167689, 0.7691551, 1.723882, 0.5764706, 0, 1, 1,
0.818955, 0.2976857, 1.544421, 0.5843138, 0, 1, 1,
0.8284658, -0.369241, 1.618724, 0.5882353, 0, 1, 1,
0.8304485, -0.4231746, 0.7624618, 0.5960785, 0, 1, 1,
0.8310621, -0.09023634, 1.767715, 0.6039216, 0, 1, 1,
0.8345616, -0.1697765, 2.233176, 0.6078432, 0, 1, 1,
0.8348881, -0.7947684, 1.313133, 0.6156863, 0, 1, 1,
0.8363054, -0.3875518, 3.203976, 0.6196079, 0, 1, 1,
0.8434623, 0.5245528, -0.2045639, 0.627451, 0, 1, 1,
0.8442948, 0.06194052, 2.83758, 0.6313726, 0, 1, 1,
0.8443473, 0.479412, 0.7972252, 0.6392157, 0, 1, 1,
0.8446006, -1.527087, 3.343083, 0.6431373, 0, 1, 1,
0.8466487, 0.3916762, 0.2828899, 0.6509804, 0, 1, 1,
0.8477151, -0.8461832, 2.993329, 0.654902, 0, 1, 1,
0.848287, -0.01660763, 0.5853295, 0.6627451, 0, 1, 1,
0.8517005, 0.1348241, 1.369792, 0.6666667, 0, 1, 1,
0.858212, -0.588352, 1.928436, 0.6745098, 0, 1, 1,
0.8628582, 0.278125, 2.611346, 0.6784314, 0, 1, 1,
0.8932615, -0.1704002, 1.586628, 0.6862745, 0, 1, 1,
0.8943397, -0.282853, 1.304792, 0.6901961, 0, 1, 1,
0.8953424, -3.222436, 0.8072432, 0.6980392, 0, 1, 1,
0.8967036, -0.5574986, 1.533761, 0.7058824, 0, 1, 1,
0.901858, 0.3023849, 2.954185, 0.7098039, 0, 1, 1,
0.9023899, 0.1660232, 2.187829, 0.7176471, 0, 1, 1,
0.9064496, 0.3031936, -0.2811454, 0.7215686, 0, 1, 1,
0.9140081, 0.8139952, 0.5117499, 0.7294118, 0, 1, 1,
0.9148213, 1.520427, 1.833994, 0.7333333, 0, 1, 1,
0.9173874, 0.5535643, 0.2267708, 0.7411765, 0, 1, 1,
0.9178413, -1.451801, 4.26868, 0.7450981, 0, 1, 1,
0.9247445, 0.3065906, 1.952309, 0.7529412, 0, 1, 1,
0.9302599, 0.3616618, 2.891399, 0.7568628, 0, 1, 1,
0.9330113, 0.5459664, 1.001315, 0.7647059, 0, 1, 1,
0.9358032, -1.212924, 3.504928, 0.7686275, 0, 1, 1,
0.9392298, -0.04009042, 3.012661, 0.7764706, 0, 1, 1,
0.9404559, -0.1286987, 1.31539, 0.7803922, 0, 1, 1,
0.942754, -0.5534298, 3.264639, 0.7882353, 0, 1, 1,
0.9446418, 0.9995446, 0.6893688, 0.7921569, 0, 1, 1,
0.9606397, 0.2552758, 1.618433, 0.8, 0, 1, 1,
0.9643229, 0.8475267, -0.2064383, 0.8078431, 0, 1, 1,
0.9662356, -0.2468492, 1.759684, 0.8117647, 0, 1, 1,
0.9672541, -0.06384806, 1.651563, 0.8196079, 0, 1, 1,
0.9699113, -0.5877857, 1.654261, 0.8235294, 0, 1, 1,
0.9699604, 1.130055, 0.5491381, 0.8313726, 0, 1, 1,
0.9727517, 0.5390572, 0.77178, 0.8352941, 0, 1, 1,
0.9743758, -0.6737256, 2.869813, 0.8431373, 0, 1, 1,
0.9762342, -1.332169, 1.866042, 0.8470588, 0, 1, 1,
0.9834496, 1.653953, -0.5666476, 0.854902, 0, 1, 1,
0.9874165, 0.2301072, 0.7724472, 0.8588235, 0, 1, 1,
0.9884705, -0.7890601, 3.084625, 0.8666667, 0, 1, 1,
1.016443, -0.9761044, 2.599403, 0.8705882, 0, 1, 1,
1.017506, -1.711159, 3.739955, 0.8784314, 0, 1, 1,
1.017692, 1.138964, 1.092291, 0.8823529, 0, 1, 1,
1.020769, 1.31951, 0.3121534, 0.8901961, 0, 1, 1,
1.023761, -1.30074, 1.063741, 0.8941177, 0, 1, 1,
1.024217, 0.6725808, 0.965768, 0.9019608, 0, 1, 1,
1.030976, -1.393938, 1.861339, 0.9098039, 0, 1, 1,
1.034727, -0.1533516, 2.324922, 0.9137255, 0, 1, 1,
1.035526, 2.056767, -1.105378, 0.9215686, 0, 1, 1,
1.037601, 0.246086, 1.197039, 0.9254902, 0, 1, 1,
1.041581, 0.1503031, 0.4251869, 0.9333333, 0, 1, 1,
1.048574, -0.51595, 1.577646, 0.9372549, 0, 1, 1,
1.05156, 0.8561831, -0.04444161, 0.945098, 0, 1, 1,
1.058017, 1.248605, 2.38101, 0.9490196, 0, 1, 1,
1.061742, 1.453407, -0.2056857, 0.9568627, 0, 1, 1,
1.072195, 0.4642901, 1.640457, 0.9607843, 0, 1, 1,
1.072532, 0.189738, 1.311545, 0.9686275, 0, 1, 1,
1.076439, 1.811166, 0.9532681, 0.972549, 0, 1, 1,
1.077809, 0.8379823, 0.6621284, 0.9803922, 0, 1, 1,
1.080724, -0.8078622, 3.5043, 0.9843137, 0, 1, 1,
1.081126, 0.3322892, 0.8233753, 0.9921569, 0, 1, 1,
1.090862, 0.1230836, 2.277936, 0.9960784, 0, 1, 1,
1.095186, -1.179004, 1.718263, 1, 0, 0.9960784, 1,
1.095487, 0.9764835, 1.10078, 1, 0, 0.9882353, 1,
1.107744, 1.202676, 0.6241666, 1, 0, 0.9843137, 1,
1.110381, -0.1895632, 1.908607, 1, 0, 0.9764706, 1,
1.119411, -0.2598632, 1.593937, 1, 0, 0.972549, 1,
1.119675, 1.544641, -0.5157073, 1, 0, 0.9647059, 1,
1.12626, 0.7847412, -0.01910164, 1, 0, 0.9607843, 1,
1.131432, -0.7238699, 1.329846, 1, 0, 0.9529412, 1,
1.137383, 0.9900445, -0.629891, 1, 0, 0.9490196, 1,
1.145509, -0.6585058, 2.040565, 1, 0, 0.9411765, 1,
1.147425, 0.7284192, 1.446657, 1, 0, 0.9372549, 1,
1.150151, 1.791998, 0.922591, 1, 0, 0.9294118, 1,
1.152806, 0.3073781, 0.7064805, 1, 0, 0.9254902, 1,
1.153597, 0.5573194, 2.217316, 1, 0, 0.9176471, 1,
1.156894, 0.02639267, 1.767831, 1, 0, 0.9137255, 1,
1.157384, 0.3342988, 1.488459, 1, 0, 0.9058824, 1,
1.159235, -0.5430893, 4.017953, 1, 0, 0.9019608, 1,
1.159709, 0.5181319, 1.881715, 1, 0, 0.8941177, 1,
1.162326, -0.6584184, 0.934737, 1, 0, 0.8862745, 1,
1.181992, -0.5436233, 1.770662, 1, 0, 0.8823529, 1,
1.193237, -1.149912, 2.897067, 1, 0, 0.8745098, 1,
1.196259, 2.030068, 3.017369, 1, 0, 0.8705882, 1,
1.205781, 0.4174924, 0.7741432, 1, 0, 0.8627451, 1,
1.206217, 0.3834989, -0.4711028, 1, 0, 0.8588235, 1,
1.209322, -1.469375, 4.083838, 1, 0, 0.8509804, 1,
1.213305, 1.950372, 0.7921953, 1, 0, 0.8470588, 1,
1.22455, 0.4472652, 1.603789, 1, 0, 0.8392157, 1,
1.22545, -1.727262, 2.787925, 1, 0, 0.8352941, 1,
1.234828, 0.5532336, 1.247213, 1, 0, 0.827451, 1,
1.234882, 1.307392, 1.234322, 1, 0, 0.8235294, 1,
1.241506, -0.04194014, 1.664243, 1, 0, 0.8156863, 1,
1.259167, 0.5012585, 2.01538, 1, 0, 0.8117647, 1,
1.259501, -1.071104, 2.603392, 1, 0, 0.8039216, 1,
1.266138, -0.8384314, 1.404915, 1, 0, 0.7960784, 1,
1.266776, -0.1083087, -0.4667762, 1, 0, 0.7921569, 1,
1.267767, 0.6869398, 1.201098, 1, 0, 0.7843137, 1,
1.268036, -0.461912, 1.84568, 1, 0, 0.7803922, 1,
1.272688, -0.690828, 0.6229055, 1, 0, 0.772549, 1,
1.274786, -1.977479, 2.684057, 1, 0, 0.7686275, 1,
1.276746, -0.5728949, 2.043986, 1, 0, 0.7607843, 1,
1.278062, 0.4435033, 2.012229, 1, 0, 0.7568628, 1,
1.278615, -0.5203862, 1.563483, 1, 0, 0.7490196, 1,
1.286936, -0.1253902, -0.3503623, 1, 0, 0.7450981, 1,
1.306676, -0.5505244, 2.696059, 1, 0, 0.7372549, 1,
1.307854, 1.912589, -0.1511708, 1, 0, 0.7333333, 1,
1.321385, -0.4208275, 4.248516, 1, 0, 0.7254902, 1,
1.323128, 0.04753901, 1.123177, 1, 0, 0.7215686, 1,
1.324092, 0.8734637, 1.80084, 1, 0, 0.7137255, 1,
1.328432, 0.165561, 2.600502, 1, 0, 0.7098039, 1,
1.329671, -0.433207, 1.493107, 1, 0, 0.7019608, 1,
1.337242, 0.5822746, 0.5186043, 1, 0, 0.6941177, 1,
1.338098, -0.1857965, 2.169294, 1, 0, 0.6901961, 1,
1.343885, 0.2164025, 1.450401, 1, 0, 0.682353, 1,
1.349219, 0.9137461, 1.231663, 1, 0, 0.6784314, 1,
1.35673, 0.3524684, 2.026995, 1, 0, 0.6705883, 1,
1.357892, -0.6298292, 1.551714, 1, 0, 0.6666667, 1,
1.363217, -0.4458746, 2.930309, 1, 0, 0.6588235, 1,
1.365649, -1.38632, 1.868238, 1, 0, 0.654902, 1,
1.378286, -0.05929098, 2.426566, 1, 0, 0.6470588, 1,
1.378779, 0.3974475, 1.826868, 1, 0, 0.6431373, 1,
1.38256, 0.4539835, 3.303524, 1, 0, 0.6352941, 1,
1.387071, -0.8382581, 2.123567, 1, 0, 0.6313726, 1,
1.392113, 1.541502, 1.992382, 1, 0, 0.6235294, 1,
1.393923, 1.557652, 1.904507, 1, 0, 0.6196079, 1,
1.399225, 0.5394414, 1.546809, 1, 0, 0.6117647, 1,
1.410345, -1.922289, 2.661466, 1, 0, 0.6078432, 1,
1.420452, 0.0760052, 1.868012, 1, 0, 0.6, 1,
1.422737, -0.6927468, 1.198515, 1, 0, 0.5921569, 1,
1.430891, -1.202848, 1.254386, 1, 0, 0.5882353, 1,
1.436607, 0.3631794, 2.263503, 1, 0, 0.5803922, 1,
1.441832, 0.2502417, 1.042296, 1, 0, 0.5764706, 1,
1.448425, 1.003358, 1.898337, 1, 0, 0.5686275, 1,
1.449678, 0.3814314, 3.167577, 1, 0, 0.5647059, 1,
1.469789, 1.079036, 1.825931, 1, 0, 0.5568628, 1,
1.495692, -0.3843906, 2.227178, 1, 0, 0.5529412, 1,
1.508564, 1.133964, -0.5321957, 1, 0, 0.5450981, 1,
1.519206, 0.3091651, 1.39934, 1, 0, 0.5411765, 1,
1.523158, -2.457662, 2.577755, 1, 0, 0.5333334, 1,
1.525776, -1.491965, 2.53422, 1, 0, 0.5294118, 1,
1.528911, -0.7078007, 4.48368, 1, 0, 0.5215687, 1,
1.535538, 0.1375145, 1.930829, 1, 0, 0.5176471, 1,
1.537741, 2.37198, 0.8680328, 1, 0, 0.509804, 1,
1.538663, -1.98969, 3.260317, 1, 0, 0.5058824, 1,
1.54577, -0.2505025, 0.8798878, 1, 0, 0.4980392, 1,
1.552057, -0.6927369, 2.804405, 1, 0, 0.4901961, 1,
1.564668, -0.4930076, 1.249029, 1, 0, 0.4862745, 1,
1.57954, -0.9790014, 1.827081, 1, 0, 0.4784314, 1,
1.580619, 0.6199315, 1.937507, 1, 0, 0.4745098, 1,
1.592486, -0.2940098, 0.2302213, 1, 0, 0.4666667, 1,
1.59825, 0.5801423, 1.228344, 1, 0, 0.4627451, 1,
1.601882, 0.3733208, 2.136998, 1, 0, 0.454902, 1,
1.614831, 0.04566878, -1.211136, 1, 0, 0.4509804, 1,
1.61691, -0.2872987, 0.6529782, 1, 0, 0.4431373, 1,
1.619651, 0.8672105, 0.7443688, 1, 0, 0.4392157, 1,
1.622513, -1.657405, 4.748343, 1, 0, 0.4313726, 1,
1.622782, 1.217664, 1.436764, 1, 0, 0.427451, 1,
1.624333, -1.034637, 2.294003, 1, 0, 0.4196078, 1,
1.627666, 0.02588827, 1.825007, 1, 0, 0.4156863, 1,
1.629071, 0.5934076, 1.859631, 1, 0, 0.4078431, 1,
1.632688, -0.1462881, 2.052162, 1, 0, 0.4039216, 1,
1.633556, -0.3954614, 0.5164294, 1, 0, 0.3960784, 1,
1.637532, 0.6546211, 0.9191687, 1, 0, 0.3882353, 1,
1.642933, -1.040283, 3.558855, 1, 0, 0.3843137, 1,
1.661744, -0.8913596, 1.098252, 1, 0, 0.3764706, 1,
1.675498, 1.808723, -1.405166, 1, 0, 0.372549, 1,
1.686536, -0.4890076, 1.017831, 1, 0, 0.3647059, 1,
1.687802, 1.308033, 0.7759075, 1, 0, 0.3607843, 1,
1.691963, -0.2416564, 0.8250324, 1, 0, 0.3529412, 1,
1.696841, 0.3153527, 1.188896, 1, 0, 0.3490196, 1,
1.697693, 1.011525, 1.060496, 1, 0, 0.3411765, 1,
1.718598, 0.0118983, 3.168287, 1, 0, 0.3372549, 1,
1.719029, 0.4179587, 1.628056, 1, 0, 0.3294118, 1,
1.721975, -1.370157, 1.280292, 1, 0, 0.3254902, 1,
1.755436, 1.899979, 0.09187447, 1, 0, 0.3176471, 1,
1.766255, 0.3695461, 0.7097631, 1, 0, 0.3137255, 1,
1.781438, 0.328503, 2.073515, 1, 0, 0.3058824, 1,
1.827089, -1.167451, 3.045046, 1, 0, 0.2980392, 1,
1.827645, 0.3761263, 0.3865525, 1, 0, 0.2941177, 1,
1.871583, 0.946465, 0.6553469, 1, 0, 0.2862745, 1,
1.873091, 0.1611929, 1.558088, 1, 0, 0.282353, 1,
1.904424, 0.3119375, 1.362059, 1, 0, 0.2745098, 1,
1.910058, -2.316056, 2.393356, 1, 0, 0.2705882, 1,
1.912275, 0.1823889, 2.531734, 1, 0, 0.2627451, 1,
1.920864, -0.1269221, 1.087467, 1, 0, 0.2588235, 1,
1.940153, -0.1609627, 4.827807, 1, 0, 0.2509804, 1,
1.944458, 0.4431679, 0.57005, 1, 0, 0.2470588, 1,
1.952602, -1.758534, 2.817034, 1, 0, 0.2392157, 1,
1.955639, -1.606703, 2.305543, 1, 0, 0.2352941, 1,
1.964192, -0.5894377, 1.985884, 1, 0, 0.227451, 1,
1.965708, -0.00507339, 0.5166097, 1, 0, 0.2235294, 1,
1.965785, -1.921473, 1.94611, 1, 0, 0.2156863, 1,
1.992602, -1.095297, 1.851954, 1, 0, 0.2117647, 1,
2.012051, -0.7787449, 2.811775, 1, 0, 0.2039216, 1,
2.015829, -0.001108943, 2.156264, 1, 0, 0.1960784, 1,
2.023504, 0.08025653, 2.124181, 1, 0, 0.1921569, 1,
2.040259, 0.2997861, 2.495667, 1, 0, 0.1843137, 1,
2.040716, -0.4325536, 2.299345, 1, 0, 0.1803922, 1,
2.047049, -0.4648409, 1.681955, 1, 0, 0.172549, 1,
2.049792, 0.3418298, 0.01462266, 1, 0, 0.1686275, 1,
2.058799, 2.411784, 1.197387, 1, 0, 0.1607843, 1,
2.105547, -0.9831794, 0.8690844, 1, 0, 0.1568628, 1,
2.111978, 0.2246221, 3.62079, 1, 0, 0.1490196, 1,
2.139398, 0.355944, 0.3730657, 1, 0, 0.145098, 1,
2.142668, 0.1493198, 1.271881, 1, 0, 0.1372549, 1,
2.1562, 0.3739883, 1.035569, 1, 0, 0.1333333, 1,
2.166411, -0.9900684, 3.921741, 1, 0, 0.1254902, 1,
2.178786, 1.010342, 1.770535, 1, 0, 0.1215686, 1,
2.184168, -0.9402755, 0.8539026, 1, 0, 0.1137255, 1,
2.262998, 0.02102194, 0.5984418, 1, 0, 0.1098039, 1,
2.269845, -0.4870457, -0.3501617, 1, 0, 0.1019608, 1,
2.272593, -1.145567, 1.773835, 1, 0, 0.09411765, 1,
2.276791, -0.8379756, 2.398314, 1, 0, 0.09019608, 1,
2.293884, 1.81985, 0.3442028, 1, 0, 0.08235294, 1,
2.350667, -0.9218961, 2.339824, 1, 0, 0.07843138, 1,
2.353263, -0.3670462, 1.796743, 1, 0, 0.07058824, 1,
2.455304, -1.959918, 3.590465, 1, 0, 0.06666667, 1,
2.493875, 0.5226746, 1.211364, 1, 0, 0.05882353, 1,
2.498878, -1.97572, 1.810439, 1, 0, 0.05490196, 1,
2.511229, -0.4286585, 2.311241, 1, 0, 0.04705882, 1,
2.54478, -1.261064, 1.204476, 1, 0, 0.04313726, 1,
2.56238, -0.4890181, 3.774756, 1, 0, 0.03529412, 1,
2.574492, -0.9447725, 2.047204, 1, 0, 0.03137255, 1,
2.674113, 0.6372962, 1.256604, 1, 0, 0.02352941, 1,
2.681849, 1.856583, 0.09378072, 1, 0, 0.01960784, 1,
2.732402, 0.1835638, 1.925813, 1, 0, 0.01176471, 1,
3.003509, -0.226361, -1.269206, 1, 0, 0.007843138, 1
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
-0.4059379, -4.653421, -6.939342, 0, -0.5, 0.5, 0.5,
-0.4059379, -4.653421, -6.939342, 1, -0.5, 0.5, 0.5,
-0.4059379, -4.653421, -6.939342, 1, 1.5, 0.5, 0.5,
-0.4059379, -4.653421, -6.939342, 0, 1.5, 0.5, 0.5
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
-4.971187, -0.19933, -6.939342, 0, -0.5, 0.5, 0.5,
-4.971187, -0.19933, -6.939342, 1, -0.5, 0.5, 0.5,
-4.971187, -0.19933, -6.939342, 1, 1.5, 0.5, 0.5,
-4.971187, -0.19933, -6.939342, 0, 1.5, 0.5, 0.5
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
-4.971187, -4.653421, 0.09124827, 0, -0.5, 0.5, 0.5,
-4.971187, -4.653421, 0.09124827, 1, -0.5, 0.5, 0.5,
-4.971187, -4.653421, 0.09124827, 1, 1.5, 0.5, 0.5,
-4.971187, -4.653421, 0.09124827, 0, 1.5, 0.5, 0.5
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
-3, -3.625554, -5.316898,
3, -3.625554, -5.316898,
-3, -3.625554, -5.316898,
-3, -3.796865, -5.587305,
-2, -3.625554, -5.316898,
-2, -3.796865, -5.587305,
-1, -3.625554, -5.316898,
-1, -3.796865, -5.587305,
0, -3.625554, -5.316898,
0, -3.796865, -5.587305,
1, -3.625554, -5.316898,
1, -3.796865, -5.587305,
2, -3.625554, -5.316898,
2, -3.796865, -5.587305,
3, -3.625554, -5.316898,
3, -3.796865, -5.587305
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
-3, -4.139487, -6.12812, 0, -0.5, 0.5, 0.5,
-3, -4.139487, -6.12812, 1, -0.5, 0.5, 0.5,
-3, -4.139487, -6.12812, 1, 1.5, 0.5, 0.5,
-3, -4.139487, -6.12812, 0, 1.5, 0.5, 0.5,
-2, -4.139487, -6.12812, 0, -0.5, 0.5, 0.5,
-2, -4.139487, -6.12812, 1, -0.5, 0.5, 0.5,
-2, -4.139487, -6.12812, 1, 1.5, 0.5, 0.5,
-2, -4.139487, -6.12812, 0, 1.5, 0.5, 0.5,
-1, -4.139487, -6.12812, 0, -0.5, 0.5, 0.5,
-1, -4.139487, -6.12812, 1, -0.5, 0.5, 0.5,
-1, -4.139487, -6.12812, 1, 1.5, 0.5, 0.5,
-1, -4.139487, -6.12812, 0, 1.5, 0.5, 0.5,
0, -4.139487, -6.12812, 0, -0.5, 0.5, 0.5,
0, -4.139487, -6.12812, 1, -0.5, 0.5, 0.5,
0, -4.139487, -6.12812, 1, 1.5, 0.5, 0.5,
0, -4.139487, -6.12812, 0, 1.5, 0.5, 0.5,
1, -4.139487, -6.12812, 0, -0.5, 0.5, 0.5,
1, -4.139487, -6.12812, 1, -0.5, 0.5, 0.5,
1, -4.139487, -6.12812, 1, 1.5, 0.5, 0.5,
1, -4.139487, -6.12812, 0, 1.5, 0.5, 0.5,
2, -4.139487, -6.12812, 0, -0.5, 0.5, 0.5,
2, -4.139487, -6.12812, 1, -0.5, 0.5, 0.5,
2, -4.139487, -6.12812, 1, 1.5, 0.5, 0.5,
2, -4.139487, -6.12812, 0, 1.5, 0.5, 0.5,
3, -4.139487, -6.12812, 0, -0.5, 0.5, 0.5,
3, -4.139487, -6.12812, 1, -0.5, 0.5, 0.5,
3, -4.139487, -6.12812, 1, 1.5, 0.5, 0.5,
3, -4.139487, -6.12812, 0, 1.5, 0.5, 0.5
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
-3.917668, -3, -5.316898,
-3.917668, 3, -5.316898,
-3.917668, -3, -5.316898,
-4.093255, -3, -5.587305,
-3.917668, -2, -5.316898,
-4.093255, -2, -5.587305,
-3.917668, -1, -5.316898,
-4.093255, -1, -5.587305,
-3.917668, 0, -5.316898,
-4.093255, 0, -5.587305,
-3.917668, 1, -5.316898,
-4.093255, 1, -5.587305,
-3.917668, 2, -5.316898,
-4.093255, 2, -5.587305,
-3.917668, 3, -5.316898,
-4.093255, 3, -5.587305
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
-4.444427, -3, -6.12812, 0, -0.5, 0.5, 0.5,
-4.444427, -3, -6.12812, 1, -0.5, 0.5, 0.5,
-4.444427, -3, -6.12812, 1, 1.5, 0.5, 0.5,
-4.444427, -3, -6.12812, 0, 1.5, 0.5, 0.5,
-4.444427, -2, -6.12812, 0, -0.5, 0.5, 0.5,
-4.444427, -2, -6.12812, 1, -0.5, 0.5, 0.5,
-4.444427, -2, -6.12812, 1, 1.5, 0.5, 0.5,
-4.444427, -2, -6.12812, 0, 1.5, 0.5, 0.5,
-4.444427, -1, -6.12812, 0, -0.5, 0.5, 0.5,
-4.444427, -1, -6.12812, 1, -0.5, 0.5, 0.5,
-4.444427, -1, -6.12812, 1, 1.5, 0.5, 0.5,
-4.444427, -1, -6.12812, 0, 1.5, 0.5, 0.5,
-4.444427, 0, -6.12812, 0, -0.5, 0.5, 0.5,
-4.444427, 0, -6.12812, 1, -0.5, 0.5, 0.5,
-4.444427, 0, -6.12812, 1, 1.5, 0.5, 0.5,
-4.444427, 0, -6.12812, 0, 1.5, 0.5, 0.5,
-4.444427, 1, -6.12812, 0, -0.5, 0.5, 0.5,
-4.444427, 1, -6.12812, 1, -0.5, 0.5, 0.5,
-4.444427, 1, -6.12812, 1, 1.5, 0.5, 0.5,
-4.444427, 1, -6.12812, 0, 1.5, 0.5, 0.5,
-4.444427, 2, -6.12812, 0, -0.5, 0.5, 0.5,
-4.444427, 2, -6.12812, 1, -0.5, 0.5, 0.5,
-4.444427, 2, -6.12812, 1, 1.5, 0.5, 0.5,
-4.444427, 2, -6.12812, 0, 1.5, 0.5, 0.5,
-4.444427, 3, -6.12812, 0, -0.5, 0.5, 0.5,
-4.444427, 3, -6.12812, 1, -0.5, 0.5, 0.5,
-4.444427, 3, -6.12812, 1, 1.5, 0.5, 0.5,
-4.444427, 3, -6.12812, 0, 1.5, 0.5, 0.5
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
-3.917668, -3.625554, -4,
-3.917668, -3.625554, 4,
-3.917668, -3.625554, -4,
-4.093255, -3.796865, -4,
-3.917668, -3.625554, -2,
-4.093255, -3.796865, -2,
-3.917668, -3.625554, 0,
-4.093255, -3.796865, 0,
-3.917668, -3.625554, 2,
-4.093255, -3.796865, 2,
-3.917668, -3.625554, 4,
-4.093255, -3.796865, 4
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
-4.444427, -4.139487, -4, 0, -0.5, 0.5, 0.5,
-4.444427, -4.139487, -4, 1, -0.5, 0.5, 0.5,
-4.444427, -4.139487, -4, 1, 1.5, 0.5, 0.5,
-4.444427, -4.139487, -4, 0, 1.5, 0.5, 0.5,
-4.444427, -4.139487, -2, 0, -0.5, 0.5, 0.5,
-4.444427, -4.139487, -2, 1, -0.5, 0.5, 0.5,
-4.444427, -4.139487, -2, 1, 1.5, 0.5, 0.5,
-4.444427, -4.139487, -2, 0, 1.5, 0.5, 0.5,
-4.444427, -4.139487, 0, 0, -0.5, 0.5, 0.5,
-4.444427, -4.139487, 0, 1, -0.5, 0.5, 0.5,
-4.444427, -4.139487, 0, 1, 1.5, 0.5, 0.5,
-4.444427, -4.139487, 0, 0, 1.5, 0.5, 0.5,
-4.444427, -4.139487, 2, 0, -0.5, 0.5, 0.5,
-4.444427, -4.139487, 2, 1, -0.5, 0.5, 0.5,
-4.444427, -4.139487, 2, 1, 1.5, 0.5, 0.5,
-4.444427, -4.139487, 2, 0, 1.5, 0.5, 0.5,
-4.444427, -4.139487, 4, 0, -0.5, 0.5, 0.5,
-4.444427, -4.139487, 4, 1, -0.5, 0.5, 0.5,
-4.444427, -4.139487, 4, 1, 1.5, 0.5, 0.5,
-4.444427, -4.139487, 4, 0, 1.5, 0.5, 0.5
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
-3.917668, -3.625554, -5.316898,
-3.917668, 3.226894, -5.316898,
-3.917668, -3.625554, 5.499394,
-3.917668, 3.226894, 5.499394,
-3.917668, -3.625554, -5.316898,
-3.917668, -3.625554, 5.499394,
-3.917668, 3.226894, -5.316898,
-3.917668, 3.226894, 5.499394,
-3.917668, -3.625554, -5.316898,
3.105792, -3.625554, -5.316898,
-3.917668, -3.625554, 5.499394,
3.105792, -3.625554, 5.499394,
-3.917668, 3.226894, -5.316898,
3.105792, 3.226894, -5.316898,
-3.917668, 3.226894, 5.499394,
3.105792, 3.226894, 5.499394,
3.105792, -3.625554, -5.316898,
3.105792, 3.226894, -5.316898,
3.105792, -3.625554, 5.499394,
3.105792, 3.226894, 5.499394,
3.105792, -3.625554, -5.316898,
3.105792, -3.625554, 5.499394,
3.105792, 3.226894, -5.316898,
3.105792, 3.226894, 5.499394
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
var radius = 7.79826;
var distance = 34.69534;
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
mvMatrix.translate( 0.4059379, 0.19933, -0.09124827 );
mvMatrix.scale( 1.200495, 1.230455, 0.7795306 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.69534);
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
calcium_arsenate_cal<-read.table("calcium_arsenate_cal.xyz")
```

```
## Error in read.table("calcium_arsenate_cal.xyz"): no lines available in input
```

```r
x<-calcium_arsenate_cal$V2
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_cal' not found
```

```r
y<-calcium_arsenate_cal$V3
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_cal' not found
```

```r
z<-calcium_arsenate_cal$V4
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_cal' not found
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
-3.815385, 0.4711484, -0.1302976, 0, 0, 1, 1, 1,
-3.296537, 0.1526193, -2.256553, 1, 0, 0, 1, 1,
-2.772615, 0.8730126, -0.4255777, 1, 0, 0, 1, 1,
-2.717275, 0.01212989, -1.312163, 1, 0, 0, 1, 1,
-2.696406, -1.138183, -1.292963, 1, 0, 0, 1, 1,
-2.598909, -0.162383, -2.858715, 1, 0, 0, 1, 1,
-2.582366, -0.0857885, -1.913865, 0, 0, 0, 1, 1,
-2.559694, -1.415831, -2.249729, 0, 0, 0, 1, 1,
-2.546876, 0.6748475, -1.277356, 0, 0, 0, 1, 1,
-2.517115, 1.220336, 0.03307138, 0, 0, 0, 1, 1,
-2.478219, -0.5354366, 0.189312, 0, 0, 0, 1, 1,
-2.42356, -0.03705155, -1.936493, 0, 0, 0, 1, 1,
-2.353404, 0.7222221, -0.6728579, 0, 0, 0, 1, 1,
-2.342696, -0.1954879, -1.273589, 1, 1, 1, 1, 1,
-2.324203, 0.6948854, -0.4939885, 1, 1, 1, 1, 1,
-2.312581, -0.134481, -1.702182, 1, 1, 1, 1, 1,
-2.308612, 1.085837, -0.5165217, 1, 1, 1, 1, 1,
-2.292192, -0.635829, -1.629068, 1, 1, 1, 1, 1,
-2.264783, -0.2826944, -3.324477, 1, 1, 1, 1, 1,
-2.233023, -0.7980863, -3.078806, 1, 1, 1, 1, 1,
-2.230527, -0.1655236, -2.480359, 1, 1, 1, 1, 1,
-2.15794, -1.762043, -3.729542, 1, 1, 1, 1, 1,
-2.14428, -0.2725296, -2.486381, 1, 1, 1, 1, 1,
-2.138865, -0.4950821, -0.681437, 1, 1, 1, 1, 1,
-2.083035, 0.1616537, -1.000189, 1, 1, 1, 1, 1,
-2.061694, -0.6931798, -1.744495, 1, 1, 1, 1, 1,
-2.049236, 2.523421, -1.380885, 1, 1, 1, 1, 1,
-2.047501, -0.4182928, -2.165586, 1, 1, 1, 1, 1,
-2.045256, 3.127101, -1.275836, 0, 0, 1, 1, 1,
-2.022281, 0.5756724, -1.40157, 1, 0, 0, 1, 1,
-1.990427, -0.2868512, -1.284322, 1, 0, 0, 1, 1,
-1.9846, -0.5721726, -1.4382, 1, 0, 0, 1, 1,
-1.978773, -0.3925467, 1.820646, 1, 0, 0, 1, 1,
-1.966237, 1.060743, -2.302525, 1, 0, 0, 1, 1,
-1.957302, 1.739652, -0.08724719, 0, 0, 0, 1, 1,
-1.953541, -0.07407299, -1.646757, 0, 0, 0, 1, 1,
-1.905167, 1.11533, -2.261925, 0, 0, 0, 1, 1,
-1.900562, 0.429004, -2.373366, 0, 0, 0, 1, 1,
-1.898338, -2.46636, -2.508605, 0, 0, 0, 1, 1,
-1.896526, -0.4161284, -2.420315, 0, 0, 0, 1, 1,
-1.888895, 2.193066, -0.6901122, 0, 0, 0, 1, 1,
-1.87142, 0.9611888, -2.227146, 1, 1, 1, 1, 1,
-1.851887, 1.301779, 0.7493615, 1, 1, 1, 1, 1,
-1.806753, -0.6094323, -1.724136, 1, 1, 1, 1, 1,
-1.804272, 0.8493586, -1.776968, 1, 1, 1, 1, 1,
-1.801444, 0.6848983, -1.484773, 1, 1, 1, 1, 1,
-1.795026, -0.3858164, -2.754592, 1, 1, 1, 1, 1,
-1.794415, -0.1626186, -3.407535, 1, 1, 1, 1, 1,
-1.789351, 1.139931, -3.211047, 1, 1, 1, 1, 1,
-1.788071, 0.6302519, -0.446438, 1, 1, 1, 1, 1,
-1.717324, -0.009570518, -0.3034791, 1, 1, 1, 1, 1,
-1.707941, -0.7078226, -2.155985, 1, 1, 1, 1, 1,
-1.706538, 1.007262, -2.62246, 1, 1, 1, 1, 1,
-1.701193, 0.03300052, 0.2688556, 1, 1, 1, 1, 1,
-1.699, -0.1221441, -1.383308, 1, 1, 1, 1, 1,
-1.69292, 1.762092, -0.005354819, 1, 1, 1, 1, 1,
-1.688576, 0.7191234, -0.8396965, 0, 0, 1, 1, 1,
-1.670677, -0.6131808, -1.235051, 1, 0, 0, 1, 1,
-1.660844, 0.220473, -0.5149909, 1, 0, 0, 1, 1,
-1.660636, -1.734159, -1.900025, 1, 0, 0, 1, 1,
-1.659779, 1.162244, -1.41167, 1, 0, 0, 1, 1,
-1.628829, -1.367136, -2.740805, 1, 0, 0, 1, 1,
-1.623435, 1.370771, -0.6128145, 0, 0, 0, 1, 1,
-1.615643, 0.2014001, -0.7247393, 0, 0, 0, 1, 1,
-1.609074, 0.3225169, -3.923185, 0, 0, 0, 1, 1,
-1.604193, 1.795923, -0.624931, 0, 0, 0, 1, 1,
-1.58459, 0.9520864, -0.9949107, 0, 0, 0, 1, 1,
-1.581806, -0.5809218, -0.8650566, 0, 0, 0, 1, 1,
-1.56912, -1.174861, -1.652426, 0, 0, 0, 1, 1,
-1.560357, 2.450043, -1.723703, 1, 1, 1, 1, 1,
-1.557975, -0.3995233, -2.783502, 1, 1, 1, 1, 1,
-1.546413, 1.805251, -1.597931, 1, 1, 1, 1, 1,
-1.54479, 1.071851, -2.126354, 1, 1, 1, 1, 1,
-1.543733, 0.01213396, -2.597117, 1, 1, 1, 1, 1,
-1.53048, -0.259653, -3.337305, 1, 1, 1, 1, 1,
-1.527953, -0.7044632, -1.689377, 1, 1, 1, 1, 1,
-1.519398, -0.5909096, -1.645859, 1, 1, 1, 1, 1,
-1.507033, 1.765083, -1.383878, 1, 1, 1, 1, 1,
-1.490388, -1.210098, -3.478161, 1, 1, 1, 1, 1,
-1.489211, 1.411944, 0.8455653, 1, 1, 1, 1, 1,
-1.487494, 0.4353074, -0.4448002, 1, 1, 1, 1, 1,
-1.477509, 0.7976521, -1.48041, 1, 1, 1, 1, 1,
-1.476749, 0.9410414, -1.384771, 1, 1, 1, 1, 1,
-1.463669, -1.779608, -3.727538, 1, 1, 1, 1, 1,
-1.455969, -0.1585578, -3.508441, 0, 0, 1, 1, 1,
-1.454288, 1.45715, -0.524152, 1, 0, 0, 1, 1,
-1.45147, -0.2998981, 0.06899161, 1, 0, 0, 1, 1,
-1.441945, -0.4033706, -2.551551, 1, 0, 0, 1, 1,
-1.434362, 0.3350574, -2.192077, 1, 0, 0, 1, 1,
-1.432662, -0.867749, -3.02511, 1, 0, 0, 1, 1,
-1.418439, -0.2909116, -2.246477, 0, 0, 0, 1, 1,
-1.413175, -0.6922544, -2.193703, 0, 0, 0, 1, 1,
-1.409847, -0.9452194, -1.822373, 0, 0, 0, 1, 1,
-1.408478, -0.9621397, -2.815118, 0, 0, 0, 1, 1,
-1.408054, 0.3096515, -0.1849579, 0, 0, 0, 1, 1,
-1.401098, -0.6914003, -1.106749, 0, 0, 0, 1, 1,
-1.394663, 0.915693, -0.7390659, 0, 0, 0, 1, 1,
-1.3867, 0.1916689, -0.7292569, 1, 1, 1, 1, 1,
-1.362526, 2.144509, 0.0516893, 1, 1, 1, 1, 1,
-1.358595, 0.4906948, -0.9620027, 1, 1, 1, 1, 1,
-1.358381, -1.562979, -1.699668, 1, 1, 1, 1, 1,
-1.356631, 0.880685, -1.031307, 1, 1, 1, 1, 1,
-1.349469, 1.206922, -0.4455473, 1, 1, 1, 1, 1,
-1.349461, 0.8345408, -0.3141235, 1, 1, 1, 1, 1,
-1.341985, 1.613558, -0.1117732, 1, 1, 1, 1, 1,
-1.333294, 0.5850509, -1.876164, 1, 1, 1, 1, 1,
-1.328414, 0.7008095, 0.7533688, 1, 1, 1, 1, 1,
-1.327397, 1.104188, -0.898733, 1, 1, 1, 1, 1,
-1.323568, 0.1937727, -1.165084, 1, 1, 1, 1, 1,
-1.321961, 0.6210878, -2.617776, 1, 1, 1, 1, 1,
-1.319732, -0.6925973, -0.7438679, 1, 1, 1, 1, 1,
-1.319252, -1.15631, -0.4908559, 1, 1, 1, 1, 1,
-1.306979, -0.2550885, -1.287187, 0, 0, 1, 1, 1,
-1.306379, 0.6854953, -1.284468, 1, 0, 0, 1, 1,
-1.306272, 1.319131, -0.6966175, 1, 0, 0, 1, 1,
-1.303465, 0.07392532, -2.958022, 1, 0, 0, 1, 1,
-1.299594, -0.4960358, -2.158355, 1, 0, 0, 1, 1,
-1.287827, -1.793375, -2.501233, 1, 0, 0, 1, 1,
-1.283944, -0.003961439, -0.04827071, 0, 0, 0, 1, 1,
-1.27037, 0.3210276, -0.5112368, 0, 0, 0, 1, 1,
-1.246848, -2.090478, -2.303763, 0, 0, 0, 1, 1,
-1.24154, -0.5439786, -2.180605, 0, 0, 0, 1, 1,
-1.240565, -0.2279102, -1.163129, 0, 0, 0, 1, 1,
-1.240412, -0.4698201, -2.90044, 0, 0, 0, 1, 1,
-1.227312, 1.647404, -1.006064, 0, 0, 0, 1, 1,
-1.221659, 0.04929561, -1.673512, 1, 1, 1, 1, 1,
-1.217264, -0.659514, -3.061651, 1, 1, 1, 1, 1,
-1.216717, 0.04847073, -1.96202, 1, 1, 1, 1, 1,
-1.212028, 0.3057762, -0.3399051, 1, 1, 1, 1, 1,
-1.211113, 0.08068393, 0.6207617, 1, 1, 1, 1, 1,
-1.197343, -0.1022573, -0.06295294, 1, 1, 1, 1, 1,
-1.196151, 1.96441, -1.787218, 1, 1, 1, 1, 1,
-1.192373, -0.5766197, -1.70437, 1, 1, 1, 1, 1,
-1.190943, 0.54177, -1.077243, 1, 1, 1, 1, 1,
-1.18939, -0.4904233, -3.08784, 1, 1, 1, 1, 1,
-1.186902, 0.9098623, -2.467336, 1, 1, 1, 1, 1,
-1.182732, -2.654675, -1.885434, 1, 1, 1, 1, 1,
-1.166162, -0.829781, -2.927942, 1, 1, 1, 1, 1,
-1.142875, -0.255169, -1.646288, 1, 1, 1, 1, 1,
-1.142477, -1.269491, -2.832908, 1, 1, 1, 1, 1,
-1.140643, 1.130179, -1.727169, 0, 0, 1, 1, 1,
-1.132734, 1.040271, -0.8825707, 1, 0, 0, 1, 1,
-1.123349, 0.6036068, -1.828882, 1, 0, 0, 1, 1,
-1.11706, -0.1814671, -2.683441, 1, 0, 0, 1, 1,
-1.115408, 0.3553526, -1.539641, 1, 0, 0, 1, 1,
-1.11412, -0.6573752, -2.698333, 1, 0, 0, 1, 1,
-1.113312, 0.6145507, 0.7258231, 0, 0, 0, 1, 1,
-1.112619, 1.177694, 0.3708294, 0, 0, 0, 1, 1,
-1.111779, 0.3490971, -1.659294, 0, 0, 0, 1, 1,
-1.110755, -0.275353, -2.384713, 0, 0, 0, 1, 1,
-1.109986, -0.900807, -0.5936753, 0, 0, 0, 1, 1,
-1.107024, -0.1372745, -2.80291, 0, 0, 0, 1, 1,
-1.103074, -0.1681783, -3.095074, 0, 0, 0, 1, 1,
-1.084883, -0.3221215, -0.5139223, 1, 1, 1, 1, 1,
-1.079452, 1.141331, -0.243871, 1, 1, 1, 1, 1,
-1.064339, -0.6147146, -1.823629, 1, 1, 1, 1, 1,
-1.060674, 0.6640727, -1.901565, 1, 1, 1, 1, 1,
-1.049947, 0.3277208, -1.644121, 1, 1, 1, 1, 1,
-1.039042, 2.787003, -1.438771, 1, 1, 1, 1, 1,
-1.036917, 0.02630171, -2.65607, 1, 1, 1, 1, 1,
-1.034947, -0.3753048, 0.5276161, 1, 1, 1, 1, 1,
-1.031988, -0.9620107, -3.1888, 1, 1, 1, 1, 1,
-1.026322, -0.5261118, -3.600717, 1, 1, 1, 1, 1,
-1.002588, -0.02983734, -0.8112722, 1, 1, 1, 1, 1,
-0.9955938, -1.396372, -3.145728, 1, 1, 1, 1, 1,
-0.9943038, 1.392263, -0.2185739, 1, 1, 1, 1, 1,
-0.9916166, 0.1218954, -0.5389265, 1, 1, 1, 1, 1,
-0.9890249, 1.094903, -0.8107249, 1, 1, 1, 1, 1,
-0.9744372, -1.763361, -2.409364, 0, 0, 1, 1, 1,
-0.9692826, 0.0120786, -1.226359, 1, 0, 0, 1, 1,
-0.9558708, -0.3741025, -0.7621174, 1, 0, 0, 1, 1,
-0.953679, 0.8655416, -0.5934055, 1, 0, 0, 1, 1,
-0.9486783, -0.2331848, -4.066833, 1, 0, 0, 1, 1,
-0.9456708, -0.1967578, -2.597584, 1, 0, 0, 1, 1,
-0.9453264, -2.036712, -3.199578, 0, 0, 0, 1, 1,
-0.9420893, 0.06316859, 0.06474514, 0, 0, 0, 1, 1,
-0.9390558, 0.4736823, -3.095124, 0, 0, 0, 1, 1,
-0.934034, 0.8451315, -0.7445651, 0, 0, 0, 1, 1,
-0.9321419, -0.1204806, -0.3640933, 0, 0, 0, 1, 1,
-0.9297417, 0.2731908, -1.216057, 0, 0, 0, 1, 1,
-0.9252954, -0.5784682, -2.219183, 0, 0, 0, 1, 1,
-0.9211552, 0.8270503, -1.484488, 1, 1, 1, 1, 1,
-0.9170327, 2.239039, -1.058274, 1, 1, 1, 1, 1,
-0.9121451, -1.724733, -2.948519, 1, 1, 1, 1, 1,
-0.9099716, -1.438178, -4.050899, 1, 1, 1, 1, 1,
-0.9027198, 0.7137252, -1.542685, 1, 1, 1, 1, 1,
-0.8996043, 1.502083, 0.5826712, 1, 1, 1, 1, 1,
-0.883202, 1.855833, -0.9386499, 1, 1, 1, 1, 1,
-0.8737204, 0.03343654, -0.1866596, 1, 1, 1, 1, 1,
-0.8715351, 0.03782396, -0.8158693, 1, 1, 1, 1, 1,
-0.8699803, -0.2566785, -3.187743, 1, 1, 1, 1, 1,
-0.8693299, 0.5862525, -1.333678, 1, 1, 1, 1, 1,
-0.8642318, -0.6682394, -0.4289625, 1, 1, 1, 1, 1,
-0.8491259, 0.5209134, -0.1502531, 1, 1, 1, 1, 1,
-0.8410841, -0.8416551, -3.196707, 1, 1, 1, 1, 1,
-0.8303138, -0.4588407, -2.97534, 1, 1, 1, 1, 1,
-0.8298267, -0.1989388, -3.098529, 0, 0, 1, 1, 1,
-0.8272337, 3.029795, 0.1014414, 1, 0, 0, 1, 1,
-0.8198672, 0.387251, -1.595064, 1, 0, 0, 1, 1,
-0.8128451, -1.696995, -1.993686, 1, 0, 0, 1, 1,
-0.8118135, -0.9220872, -2.409086, 1, 0, 0, 1, 1,
-0.8098702, -1.405709, -2.4277, 1, 0, 0, 1, 1,
-0.8042088, 0.7358706, -1.502954, 0, 0, 0, 1, 1,
-0.8027464, -2.220106, -1.815709, 0, 0, 0, 1, 1,
-0.8000042, 1.375393, 0.9854559, 0, 0, 0, 1, 1,
-0.796226, -1.180293, -3.529436, 0, 0, 0, 1, 1,
-0.7946489, 1.018168, -0.2638798, 0, 0, 0, 1, 1,
-0.7943128, 1.252603, 0.8175308, 0, 0, 0, 1, 1,
-0.7939982, 1.126458, 1.076548, 0, 0, 0, 1, 1,
-0.7928264, 0.3423475, -3.333765, 1, 1, 1, 1, 1,
-0.7920516, -1.5459, -1.727305, 1, 1, 1, 1, 1,
-0.7907697, -0.6961018, -0.4769445, 1, 1, 1, 1, 1,
-0.7821935, -0.7058989, -2.997161, 1, 1, 1, 1, 1,
-0.7820312, 1.804907, -0.2765937, 1, 1, 1, 1, 1,
-0.7818732, 0.7040816, -2.777402, 1, 1, 1, 1, 1,
-0.7784653, -0.9315001, -0.3489454, 1, 1, 1, 1, 1,
-0.7771395, 0.001189003, 0.5949608, 1, 1, 1, 1, 1,
-0.7688149, 0.1197071, -1.210567, 1, 1, 1, 1, 1,
-0.7660995, 0.9220882, -2.452797, 1, 1, 1, 1, 1,
-0.7657803, -1.588324, -1.818421, 1, 1, 1, 1, 1,
-0.76487, -0.2654134, -1.701861, 1, 1, 1, 1, 1,
-0.7609771, -1.161839, -1.482478, 1, 1, 1, 1, 1,
-0.7563125, 0.5345572, -0.8835989, 1, 1, 1, 1, 1,
-0.7545078, 0.654434, -0.4151577, 1, 1, 1, 1, 1,
-0.7507589, 0.6052319, 0.3263091, 0, 0, 1, 1, 1,
-0.7464176, -0.4912938, -1.710305, 1, 0, 0, 1, 1,
-0.7442205, 1.015088, -0.868704, 1, 0, 0, 1, 1,
-0.7391601, 1.669298, 1.307222, 1, 0, 0, 1, 1,
-0.735414, 0.5737586, -1.511634, 1, 0, 0, 1, 1,
-0.7342752, -1.110585, -1.222646, 1, 0, 0, 1, 1,
-0.7318642, 0.486596, -1.315283, 0, 0, 0, 1, 1,
-0.7307051, 0.7800962, -0.4086703, 0, 0, 0, 1, 1,
-0.7301598, 0.1485603, -0.824649, 0, 0, 0, 1, 1,
-0.7288858, 0.4783986, -0.7734385, 0, 0, 0, 1, 1,
-0.7265751, -0.3533459, -1.156709, 0, 0, 0, 1, 1,
-0.7134452, -0.009018421, -2.382232, 0, 0, 0, 1, 1,
-0.7044449, -0.3490447, -0.3398235, 0, 0, 0, 1, 1,
-0.7041226, 0.8321553, 0.1808701, 1, 1, 1, 1, 1,
-0.7005789, 1.377475, 0.04636765, 1, 1, 1, 1, 1,
-0.6894923, -0.276571, -2.185525, 1, 1, 1, 1, 1,
-0.6875883, -0.7951948, -2.493993, 1, 1, 1, 1, 1,
-0.6856158, -0.2663239, -3.459025, 1, 1, 1, 1, 1,
-0.6788815, 0.6236202, -0.1606421, 1, 1, 1, 1, 1,
-0.6731107, 0.4972732, -0.6767026, 1, 1, 1, 1, 1,
-0.6728896, 0.3509026, -1.129902, 1, 1, 1, 1, 1,
-0.6711419, -0.7450184, -1.16936, 1, 1, 1, 1, 1,
-0.6691552, 1.72143, -2.666086, 1, 1, 1, 1, 1,
-0.6622834, 1.637278, 0.5085087, 1, 1, 1, 1, 1,
-0.66162, 0.1539271, -0.6824008, 1, 1, 1, 1, 1,
-0.660754, -1.082857, -2.42993, 1, 1, 1, 1, 1,
-0.6591903, 0.5517439, 0.01914003, 1, 1, 1, 1, 1,
-0.6590485, -0.2730713, -3.954025, 1, 1, 1, 1, 1,
-0.6546365, 0.7818587, -1.621115, 0, 0, 1, 1, 1,
-0.6536517, 0.6306342, -0.9267713, 1, 0, 0, 1, 1,
-0.6494895, 0.1488333, -1.071427, 1, 0, 0, 1, 1,
-0.6428788, -1.102621, -2.184347, 1, 0, 0, 1, 1,
-0.6417879, -0.36903, -2.225528, 1, 0, 0, 1, 1,
-0.6393413, -0.8749142, -2.670225, 1, 0, 0, 1, 1,
-0.6341518, -0.1035492, -0.7329789, 0, 0, 0, 1, 1,
-0.6339688, 0.3622073, 0.8559319, 0, 0, 0, 1, 1,
-0.6293681, -0.5951307, -3.2133, 0, 0, 0, 1, 1,
-0.6292158, 0.08013184, -3.283549, 0, 0, 0, 1, 1,
-0.6212513, 1.279174, -0.6372426, 0, 0, 0, 1, 1,
-0.6107661, 1.066473, -0.8581672, 0, 0, 0, 1, 1,
-0.6088611, -0.2169113, -2.447067, 0, 0, 0, 1, 1,
-0.6060322, -2.002578, -3.850583, 1, 1, 1, 1, 1,
-0.6048839, -0.8552536, -1.874531, 1, 1, 1, 1, 1,
-0.601896, 1.676853, -2.885373, 1, 1, 1, 1, 1,
-0.5998757, 0.9785666, -1.305841, 1, 1, 1, 1, 1,
-0.5932657, -0.5361257, -0.4170545, 1, 1, 1, 1, 1,
-0.5925118, 1.791894, -0.7551177, 1, 1, 1, 1, 1,
-0.5918319, 0.893685, -0.8855009, 1, 1, 1, 1, 1,
-0.5902203, -0.04131945, -0.9020732, 1, 1, 1, 1, 1,
-0.5887296, -2.061723, -1.888491, 1, 1, 1, 1, 1,
-0.587377, 0.4967184, -1.129703, 1, 1, 1, 1, 1,
-0.5838079, -2.123411, -2.674586, 1, 1, 1, 1, 1,
-0.5822374, 0.8326265, -1.127041, 1, 1, 1, 1, 1,
-0.580067, -0.2299093, -3.463156, 1, 1, 1, 1, 1,
-0.5800241, -0.5425726, -2.383527, 1, 1, 1, 1, 1,
-0.5762076, -1.457654, -2.99618, 1, 1, 1, 1, 1,
-0.5743666, 1.299688, -0.3865546, 0, 0, 1, 1, 1,
-0.5727692, 0.476372, -2.501177, 1, 0, 0, 1, 1,
-0.5726972, 2.135725, -0.6193624, 1, 0, 0, 1, 1,
-0.5715818, 0.6902386, -0.455624, 1, 0, 0, 1, 1,
-0.5699446, -0.2815118, -2.09476, 1, 0, 0, 1, 1,
-0.5693048, -0.04017229, -2.502754, 1, 0, 0, 1, 1,
-0.5608065, 0.6157806, -3.038361, 0, 0, 0, 1, 1,
-0.5587782, 0.9675003, 0.1007989, 0, 0, 0, 1, 1,
-0.5508844, 1.671083, -0.4658377, 0, 0, 0, 1, 1,
-0.5483792, 0.0910567, -1.184898, 0, 0, 0, 1, 1,
-0.5366827, -0.5629237, -1.951814, 0, 0, 0, 1, 1,
-0.5360302, -0.08113683, -1.11539, 0, 0, 0, 1, 1,
-0.5338191, 0.1441938, 0.1004022, 0, 0, 0, 1, 1,
-0.5310472, 1.234362, 0.1977856, 1, 1, 1, 1, 1,
-0.5301991, 1.687308, -0.9177971, 1, 1, 1, 1, 1,
-0.5292761, 1.817081, -0.3749947, 1, 1, 1, 1, 1,
-0.527337, -0.2912409, -1.002407, 1, 1, 1, 1, 1,
-0.526365, -1.57868, -2.269137, 1, 1, 1, 1, 1,
-0.5189497, -1.056013, -2.588082, 1, 1, 1, 1, 1,
-0.5189248, -0.7030606, -3.163536, 1, 1, 1, 1, 1,
-0.5174339, -0.9411091, -3.651092, 1, 1, 1, 1, 1,
-0.5164943, -0.8805469, -0.8094785, 1, 1, 1, 1, 1,
-0.507973, -1.000396, -2.706112, 1, 1, 1, 1, 1,
-0.5058721, -1.148945, -2.648813, 1, 1, 1, 1, 1,
-0.5036815, -0.1492803, -0.85626, 1, 1, 1, 1, 1,
-0.5022862, 0.9172155, -1.02899, 1, 1, 1, 1, 1,
-0.4990647, 0.6172603, -1.880832, 1, 1, 1, 1, 1,
-0.4971519, -0.7097026, -3.744042, 1, 1, 1, 1, 1,
-0.4951181, -1.163058, -3.282498, 0, 0, 1, 1, 1,
-0.4947257, -0.8245376, -2.907553, 1, 0, 0, 1, 1,
-0.4917099, -0.4969317, -1.789044, 1, 0, 0, 1, 1,
-0.4904583, -1.135925, -1.913574, 1, 0, 0, 1, 1,
-0.487074, 0.2459776, -1.302972, 1, 0, 0, 1, 1,
-0.4812905, 1.288501, -1.401082, 1, 0, 0, 1, 1,
-0.4799504, -0.1257617, -1.384708, 0, 0, 0, 1, 1,
-0.4786037, -2.123573, -4.378313, 0, 0, 0, 1, 1,
-0.4628901, -0.3332626, -1.625951, 0, 0, 0, 1, 1,
-0.4567195, -0.5702132, -1.804538, 0, 0, 0, 1, 1,
-0.4562512, -0.7445042, -1.785452, 0, 0, 0, 1, 1,
-0.4555972, 0.2368344, -2.633554, 0, 0, 0, 1, 1,
-0.4499224, 0.2751772, -0.6196371, 0, 0, 0, 1, 1,
-0.449447, -1.07903, -3.57726, 1, 1, 1, 1, 1,
-0.4491242, 0.7175376, -0.5187562, 1, 1, 1, 1, 1,
-0.4448492, 0.1977941, -0.906458, 1, 1, 1, 1, 1,
-0.4385431, -0.02401928, -3.385683, 1, 1, 1, 1, 1,
-0.4341513, -0.3938411, -0.8737097, 1, 1, 1, 1, 1,
-0.4335706, 0.2860828, -0.9266737, 1, 1, 1, 1, 1,
-0.4329819, -0.9875314, -2.487394, 1, 1, 1, 1, 1,
-0.4250967, 0.4349235, -0.7257009, 1, 1, 1, 1, 1,
-0.4241777, -0.361327, -3.038674, 1, 1, 1, 1, 1,
-0.4236645, -0.4739773, -1.198788, 1, 1, 1, 1, 1,
-0.4199115, -0.3813436, -3.237201, 1, 1, 1, 1, 1,
-0.4183819, 0.01492555, -1.729283, 1, 1, 1, 1, 1,
-0.4169647, -1.68189, -3.342998, 1, 1, 1, 1, 1,
-0.415857, -0.1175882, -2.111639, 1, 1, 1, 1, 1,
-0.41086, -0.4847821, -2.295114, 1, 1, 1, 1, 1,
-0.4028336, -0.07984556, -4.074893, 0, 0, 1, 1, 1,
-0.4002742, 0.4086187, 0.21687, 1, 0, 0, 1, 1,
-0.3966796, -0.3637893, -4.608907, 1, 0, 0, 1, 1,
-0.3942551, 0.2723535, -1.577857, 1, 0, 0, 1, 1,
-0.3932968, -0.8988141, -2.149397, 1, 0, 0, 1, 1,
-0.3930716, 2.823061, -1.351205, 1, 0, 0, 1, 1,
-0.3917538, 1.998619, -0.9591987, 0, 0, 0, 1, 1,
-0.3908316, 2.359249, -2.22732, 0, 0, 0, 1, 1,
-0.385666, 0.3918853, -0.3852629, 0, 0, 0, 1, 1,
-0.3827955, 0.4516234, -0.9533538, 0, 0, 0, 1, 1,
-0.3815241, 1.222316, -0.4442129, 0, 0, 0, 1, 1,
-0.3800789, 2.429958, 1.276462, 0, 0, 0, 1, 1,
-0.3769792, -0.07036193, -2.143393, 0, 0, 0, 1, 1,
-0.376684, 0.4368918, -1.561362, 1, 1, 1, 1, 1,
-0.3737552, 0.6761804, -0.4889947, 1, 1, 1, 1, 1,
-0.3722142, -0.9619468, -2.369375, 1, 1, 1, 1, 1,
-0.3690448, -0.6471694, -4.412246, 1, 1, 1, 1, 1,
-0.3634479, 0.2629533, 0.1343124, 1, 1, 1, 1, 1,
-0.3624807, -0.8635188, -2.929125, 1, 1, 1, 1, 1,
-0.3614863, 0.2960337, -2.068627, 1, 1, 1, 1, 1,
-0.3603571, 1.894724, -0.1766722, 1, 1, 1, 1, 1,
-0.3599305, -1.259507, -2.657757, 1, 1, 1, 1, 1,
-0.3589296, 0.2669876, -2.842794, 1, 1, 1, 1, 1,
-0.3553863, -0.4353486, -2.138267, 1, 1, 1, 1, 1,
-0.354472, 0.8628746, -0.07631478, 1, 1, 1, 1, 1,
-0.3531685, 1.221407, 1.869312, 1, 1, 1, 1, 1,
-0.3527757, -0.2672414, -4.082895, 1, 1, 1, 1, 1,
-0.351279, -1.300657, -1.711501, 1, 1, 1, 1, 1,
-0.3484888, 0.04547648, -1.652622, 0, 0, 1, 1, 1,
-0.3482822, -0.2520006, -2.984311, 1, 0, 0, 1, 1,
-0.3480355, -0.7826209, -3.531548, 1, 0, 0, 1, 1,
-0.3430293, -0.003656355, -2.187652, 1, 0, 0, 1, 1,
-0.3423814, 1.028513, -0.3142277, 1, 0, 0, 1, 1,
-0.338783, 0.3646051, -1.128299, 1, 0, 0, 1, 1,
-0.3271388, -0.2942917, -1.756146, 0, 0, 0, 1, 1,
-0.3265697, -0.429776, -1.567303, 0, 0, 0, 1, 1,
-0.3234617, 1.255348, 0.2218102, 0, 0, 0, 1, 1,
-0.3136722, 0.1823963, -1.471248, 0, 0, 0, 1, 1,
-0.3070348, -0.8966648, -1.513662, 0, 0, 0, 1, 1,
-0.2938634, -0.03947864, -2.467105, 0, 0, 0, 1, 1,
-0.293523, 0.4978425, -1.003282, 0, 0, 0, 1, 1,
-0.2919741, 0.01200309, -1.734173, 1, 1, 1, 1, 1,
-0.2904359, 0.7655286, -2.886597, 1, 1, 1, 1, 1,
-0.2901955, 0.07250468, -2.777054, 1, 1, 1, 1, 1,
-0.2889693, 0.7930585, -0.02163732, 1, 1, 1, 1, 1,
-0.2868417, 0.7674873, -1.015641, 1, 1, 1, 1, 1,
-0.2844845, 0.8574364, 0.7508869, 1, 1, 1, 1, 1,
-0.2834264, -1.152852, -4.212701, 1, 1, 1, 1, 1,
-0.2799936, -0.2982966, -3.056614, 1, 1, 1, 1, 1,
-0.2792788, 2.08176, 1.080301, 1, 1, 1, 1, 1,
-0.2792413, -1.186795, -2.787941, 1, 1, 1, 1, 1,
-0.2790558, 0.6404558, 0.8950253, 1, 1, 1, 1, 1,
-0.274344, -0.4529133, -3.175896, 1, 1, 1, 1, 1,
-0.2723525, 0.06237561, -0.8262363, 1, 1, 1, 1, 1,
-0.2720699, -0.09910417, -3.059575, 1, 1, 1, 1, 1,
-0.2698995, -1.78889, -3.651946, 1, 1, 1, 1, 1,
-0.2686343, -1.89264, -2.211172, 0, 0, 1, 1, 1,
-0.2682722, 1.421486, -0.7504976, 1, 0, 0, 1, 1,
-0.2671689, 0.7518022, -0.609252, 1, 0, 0, 1, 1,
-0.2656068, -0.568353, -2.739238, 1, 0, 0, 1, 1,
-0.2639664, 0.1594572, -0.709488, 1, 0, 0, 1, 1,
-0.2622341, -1.656098, -3.09429, 1, 0, 0, 1, 1,
-0.2619886, 1.026015, -0.103718, 0, 0, 0, 1, 1,
-0.2572618, -0.4196649, -4.999114, 0, 0, 0, 1, 1,
-0.2471556, -0.8715336, -3.715765, 0, 0, 0, 1, 1,
-0.2437239, 0.09078947, -2.770561, 0, 0, 0, 1, 1,
-0.239784, -0.6292179, -2.903588, 0, 0, 0, 1, 1,
-0.2389322, -0.5894697, -1.361165, 0, 0, 0, 1, 1,
-0.2382613, -1.134211, -3.085582, 0, 0, 0, 1, 1,
-0.2328035, 0.2691849, -0.4334598, 1, 1, 1, 1, 1,
-0.2317731, -0.1962447, -2.798999, 1, 1, 1, 1, 1,
-0.2303431, 0.6246185, -0.3578045, 1, 1, 1, 1, 1,
-0.2278272, 2.37107, 0.08657564, 1, 1, 1, 1, 1,
-0.2275656, 1.539139, -0.4609453, 1, 1, 1, 1, 1,
-0.2199876, -0.6432125, -1.88513, 1, 1, 1, 1, 1,
-0.2186369, -0.6601648, -3.847323, 1, 1, 1, 1, 1,
-0.2158026, -3.525761, -3.292511, 1, 1, 1, 1, 1,
-0.2155832, 0.4715292, -1.9402, 1, 1, 1, 1, 1,
-0.2153516, 1.645683, 1.425974, 1, 1, 1, 1, 1,
-0.2104501, -0.06750226, -2.246396, 1, 1, 1, 1, 1,
-0.2082784, -0.498219, -3.778104, 1, 1, 1, 1, 1,
-0.2055076, -0.2271048, -4.218209, 1, 1, 1, 1, 1,
-0.204969, 2.187837, -1.062629, 1, 1, 1, 1, 1,
-0.2039589, -1.548076, -3.841306, 1, 1, 1, 1, 1,
-0.2033575, 1.590503, 0.8133387, 0, 0, 1, 1, 1,
-0.2030139, 0.4152979, -0.8885343, 1, 0, 0, 1, 1,
-0.2002267, -1.181529, -1.110092, 1, 0, 0, 1, 1,
-0.1942613, 0.1813062, -1.982466, 1, 0, 0, 1, 1,
-0.1866403, -0.03588155, 0.01950448, 1, 0, 0, 1, 1,
-0.1856956, -1.349144, -3.734274, 1, 0, 0, 1, 1,
-0.179871, -1.878844, -4.273236, 0, 0, 0, 1, 1,
-0.1781534, 2.189159, -0.8118697, 0, 0, 0, 1, 1,
-0.1776941, 0.1661798, -0.628737, 0, 0, 0, 1, 1,
-0.176487, -1.159574, -2.911366, 0, 0, 0, 1, 1,
-0.1756788, 1.025801, 0.8598201, 0, 0, 0, 1, 1,
-0.1743074, -1.415373, -2.653833, 0, 0, 0, 1, 1,
-0.1714519, -1.904153, -3.161711, 0, 0, 0, 1, 1,
-0.1693355, 0.6108145, -0.3841155, 1, 1, 1, 1, 1,
-0.1664975, -0.7652371, -5.156672, 1, 1, 1, 1, 1,
-0.1660735, 1.999897, -2.257233, 1, 1, 1, 1, 1,
-0.1640352, -2.882494, -2.190647, 1, 1, 1, 1, 1,
-0.161925, 0.4714604, 1.210543, 1, 1, 1, 1, 1,
-0.1529768, 0.5660424, -0.1875824, 1, 1, 1, 1, 1,
-0.1527741, -0.6516196, -1.973563, 1, 1, 1, 1, 1,
-0.1515736, -0.5309142, -2.605789, 1, 1, 1, 1, 1,
-0.1483915, 0.3733379, 0.6214091, 1, 1, 1, 1, 1,
-0.1443106, 0.7743015, -0.5631562, 1, 1, 1, 1, 1,
-0.1403649, -0.09116959, -2.374947, 1, 1, 1, 1, 1,
-0.1388192, -0.7822655, -5.159379, 1, 1, 1, 1, 1,
-0.13624, 0.5323747, 2.345882, 1, 1, 1, 1, 1,
-0.1359281, -1.121532, -2.919723, 1, 1, 1, 1, 1,
-0.1344505, 2.573709, 0.8527476, 1, 1, 1, 1, 1,
-0.124803, -1.300722, -3.324089, 0, 0, 1, 1, 1,
-0.1220379, 1.484598, 0.6474382, 1, 0, 0, 1, 1,
-0.1210923, -0.6913425, -3.190428, 1, 0, 0, 1, 1,
-0.1208951, 1.188547, 1.854741, 1, 0, 0, 1, 1,
-0.1196703, 1.15144, -1.098229, 1, 0, 0, 1, 1,
-0.1189558, 1.665854, -0.8285289, 1, 0, 0, 1, 1,
-0.1148188, -0.6426826, -2.368192, 0, 0, 0, 1, 1,
-0.1132952, 0.1509679, -1.025693, 0, 0, 0, 1, 1,
-0.1120893, 0.3428413, -0.8289242, 0, 0, 0, 1, 1,
-0.1111328, -0.9119498, -3.324188, 0, 0, 0, 1, 1,
-0.1098379, 0.1112979, -0.2594503, 0, 0, 0, 1, 1,
-0.1098122, 0.9946941, -2.292705, 0, 0, 0, 1, 1,
-0.1067099, 0.9990721, -0.2569777, 0, 0, 0, 1, 1,
-0.1048955, -0.08122563, -1.773257, 1, 1, 1, 1, 1,
-0.1001888, 0.6121724, -0.6477131, 1, 1, 1, 1, 1,
-0.09853526, -1.716814, -3.323183, 1, 1, 1, 1, 1,
-0.09834012, 3.04806, -1.031692, 1, 1, 1, 1, 1,
-0.09391384, 0.5696642, -0.3884226, 1, 1, 1, 1, 1,
-0.09315576, -0.03634342, -1.215648, 1, 1, 1, 1, 1,
-0.09287272, -0.320518, -3.798906, 1, 1, 1, 1, 1,
-0.07643282, -0.3981321, -1.603016, 1, 1, 1, 1, 1,
-0.06750393, -0.2617334, -2.844378, 1, 1, 1, 1, 1,
-0.06710078, 1.475422, -0.4662738, 1, 1, 1, 1, 1,
-0.0661971, 0.5297435, 1.041632, 1, 1, 1, 1, 1,
-0.06307143, 1.523157, 0.8724719, 1, 1, 1, 1, 1,
-0.06077073, 0.7278993, 0.2473579, 1, 1, 1, 1, 1,
-0.05583169, 1.491679, 1.098878, 1, 1, 1, 1, 1,
-0.04679144, -0.5706779, -3.785151, 1, 1, 1, 1, 1,
-0.03886477, 0.8790442, 0.135956, 0, 0, 1, 1, 1,
-0.0387463, 1.513416, 1.502393, 1, 0, 0, 1, 1,
-0.03038413, 0.5841035, -0.9411629, 1, 0, 0, 1, 1,
-0.02986494, -0.5119847, -2.842195, 1, 0, 0, 1, 1,
-0.02634521, -0.8748811, -3.643051, 1, 0, 0, 1, 1,
-0.01964349, 1.010696, -0.8379866, 1, 0, 0, 1, 1,
-0.01609812, -1.661735, -1.050915, 0, 0, 0, 1, 1,
-0.01352874, 0.2438062, -0.8378967, 0, 0, 0, 1, 1,
-0.01244735, -1.227614, -2.565809, 0, 0, 0, 1, 1,
-0.009394202, 0.288193, 1.823943, 0, 0, 0, 1, 1,
-0.007794493, -0.543376, -1.978045, 0, 0, 0, 1, 1,
-0.00657816, 1.454348, 0.520214, 0, 0, 0, 1, 1,
-0.006251986, 1.84924, 0.8602443, 0, 0, 0, 1, 1,
-0.001177474, 0.5513617, 0.1319297, 1, 1, 1, 1, 1,
0.00632339, -0.9744901, 2.458292, 1, 1, 1, 1, 1,
0.006886629, -0.2883396, 2.344794, 1, 1, 1, 1, 1,
0.007708756, 0.7158485, -1.524446, 1, 1, 1, 1, 1,
0.01157017, -0.8668419, 3.807673, 1, 1, 1, 1, 1,
0.01264775, 0.29966, 0.9693239, 1, 1, 1, 1, 1,
0.01335458, 1.81025, -0.2985329, 1, 1, 1, 1, 1,
0.01365207, 0.6523482, 1.588159, 1, 1, 1, 1, 1,
0.01852498, 0.8293136, 0.6988547, 1, 1, 1, 1, 1,
0.02231849, -0.6811426, 2.477288, 1, 1, 1, 1, 1,
0.02298799, -0.5505835, 1.114015, 1, 1, 1, 1, 1,
0.02425959, -1.828059, 3.886332, 1, 1, 1, 1, 1,
0.02642729, 1.206019, -0.2113236, 1, 1, 1, 1, 1,
0.02894667, -0.9839742, 3.186965, 1, 1, 1, 1, 1,
0.03277373, 1.290569, -0.0636421, 1, 1, 1, 1, 1,
0.03436021, 0.2769002, 1.490925, 0, 0, 1, 1, 1,
0.03477861, -0.5026458, 2.637728, 1, 0, 0, 1, 1,
0.03686368, 0.9319085, 1.171007, 1, 0, 0, 1, 1,
0.0374273, -1.177781, 2.19591, 1, 0, 0, 1, 1,
0.03920447, 0.9624216, -1.120467, 1, 0, 0, 1, 1,
0.04003334, 0.4064505, 1.297087, 1, 0, 0, 1, 1,
0.04294189, 0.009333893, 0.3821169, 0, 0, 0, 1, 1,
0.04323123, -0.3760898, 2.873219, 0, 0, 0, 1, 1,
0.04466159, -1.218002, 3.118782, 0, 0, 0, 1, 1,
0.04565884, -0.7590765, 1.219291, 0, 0, 0, 1, 1,
0.04760936, 0.4961108, -1.756634, 0, 0, 0, 1, 1,
0.05189682, -0.006932309, 1.596319, 0, 0, 0, 1, 1,
0.05354225, -0.6625659, 2.291275, 0, 0, 0, 1, 1,
0.05573748, 0.6261907, 0.6995914, 1, 1, 1, 1, 1,
0.05710294, -1.907486, 3.803771, 1, 1, 1, 1, 1,
0.06659622, -0.1518413, 1.902291, 1, 1, 1, 1, 1,
0.06834406, -0.5373074, 2.699532, 1, 1, 1, 1, 1,
0.06867257, -0.5148857, 2.018838, 1, 1, 1, 1, 1,
0.07112336, 1.216455, 1.531557, 1, 1, 1, 1, 1,
0.07357491, 0.2716986, 0.2532423, 1, 1, 1, 1, 1,
0.07675943, -1.216485, 4.68359, 1, 1, 1, 1, 1,
0.07739049, 0.5472311, -0.1663808, 1, 1, 1, 1, 1,
0.07999531, -0.3722422, 1.125748, 1, 1, 1, 1, 1,
0.08144131, 0.6269435, 0.6408747, 1, 1, 1, 1, 1,
0.08266418, -0.7263893, 3.935116, 1, 1, 1, 1, 1,
0.08360379, 0.3768341, 0.7584546, 1, 1, 1, 1, 1,
0.08486094, 1.306323, -1.048659, 1, 1, 1, 1, 1,
0.08642345, 1.23778, 1.091334, 1, 1, 1, 1, 1,
0.08942098, -2.340678, 4.583189, 0, 0, 1, 1, 1,
0.09630403, -1.105649, 4.168695, 1, 0, 0, 1, 1,
0.09647283, -0.5002963, 2.299345, 1, 0, 0, 1, 1,
0.1004392, 1.833742, 0.8758241, 1, 0, 0, 1, 1,
0.1040475, 0.8324934, -0.3615776, 1, 0, 0, 1, 1,
0.106179, -0.6438094, 2.594295, 1, 0, 0, 1, 1,
0.1150483, -0.6182169, 3.780776, 0, 0, 0, 1, 1,
0.1237502, 0.09861717, 1.156333, 0, 0, 0, 1, 1,
0.1241201, -0.3954867, 3.151626, 0, 0, 0, 1, 1,
0.1267162, 1.273887, -0.560463, 0, 0, 0, 1, 1,
0.1295591, 1.04454, 1.547158, 0, 0, 0, 1, 1,
0.1308922, -0.6530962, 4.079636, 0, 0, 0, 1, 1,
0.1336595, 1.253756, -0.3309766, 0, 0, 0, 1, 1,
0.134761, -0.3654532, 3.307532, 1, 1, 1, 1, 1,
0.1385192, -0.8668178, 2.405918, 1, 1, 1, 1, 1,
0.1409735, 1.227377, -0.8816692, 1, 1, 1, 1, 1,
0.1450464, -1.075594, 2.904685, 1, 1, 1, 1, 1,
0.1473026, 0.4574493, -0.3823933, 1, 1, 1, 1, 1,
0.1477557, -0.7512169, 1.367394, 1, 1, 1, 1, 1,
0.1523425, -1.763836, 1.317672, 1, 1, 1, 1, 1,
0.1549449, 0.7857132, 0.6415886, 1, 1, 1, 1, 1,
0.164277, -1.619709, 1.270188, 1, 1, 1, 1, 1,
0.1676558, 0.5662898, 0.7240189, 1, 1, 1, 1, 1,
0.1677283, 1.026592, 1.003149, 1, 1, 1, 1, 1,
0.1709622, -1.038606, 3.394537, 1, 1, 1, 1, 1,
0.1737797, -0.3095478, 1.891514, 1, 1, 1, 1, 1,
0.178719, 0.1416455, 2.27843, 1, 1, 1, 1, 1,
0.1797342, -1.173925, 2.618755, 1, 1, 1, 1, 1,
0.1806639, 1.20511, -0.8395592, 0, 0, 1, 1, 1,
0.1847273, -0.311746, 2.763596, 1, 0, 0, 1, 1,
0.1869457, 0.3667658, 0.1263992, 1, 0, 0, 1, 1,
0.1962008, -0.3773159, 2.206145, 1, 0, 0, 1, 1,
0.2057568, 0.7912262, -0.1382698, 1, 0, 0, 1, 1,
0.2060211, -0.1113266, 2.986756, 1, 0, 0, 1, 1,
0.2075168, -0.48153, 4.300186, 0, 0, 0, 1, 1,
0.2075546, -0.06486759, 2.023758, 0, 0, 0, 1, 1,
0.2093759, 1.052689, 0.6214215, 0, 0, 0, 1, 1,
0.2115486, 0.512539, 2.109991, 0, 0, 0, 1, 1,
0.2135449, 0.6619737, 1.651363, 0, 0, 0, 1, 1,
0.2157968, 1.358495, 0.2060089, 0, 0, 0, 1, 1,
0.2203474, 1.378546, -0.9424766, 0, 0, 0, 1, 1,
0.2213582, 0.6054634, -0.9573912, 1, 1, 1, 1, 1,
0.2270728, -1.699309, 2.381834, 1, 1, 1, 1, 1,
0.2314009, 1.450395, 0.4889853, 1, 1, 1, 1, 1,
0.2350307, 1.320553, 1.031589, 1, 1, 1, 1, 1,
0.2364284, 1.172096, 0.5569212, 1, 1, 1, 1, 1,
0.2385128, 0.5828519, 0.1084108, 1, 1, 1, 1, 1,
0.240739, 0.14634, -0.5238174, 1, 1, 1, 1, 1,
0.2408223, -1.194709, 3.868248, 1, 1, 1, 1, 1,
0.2490331, 0.4434005, 0.6568012, 1, 1, 1, 1, 1,
0.2498712, 1.116871, -0.9519998, 1, 1, 1, 1, 1,
0.255576, -1.738518, 3.202752, 1, 1, 1, 1, 1,
0.2644344, -0.5057176, 3.602072, 1, 1, 1, 1, 1,
0.2681211, -0.6153781, 5.303564, 1, 1, 1, 1, 1,
0.2718119, 1.448202, -0.8988616, 1, 1, 1, 1, 1,
0.2731733, 0.3824514, 1.411154, 1, 1, 1, 1, 1,
0.2739545, -1.083995, 1.747453, 0, 0, 1, 1, 1,
0.2752696, -1.056854, 1.505615, 1, 0, 0, 1, 1,
0.2762059, 0.4806609, 1.817827, 1, 0, 0, 1, 1,
0.2775369, 0.2936459, 2.437952, 1, 0, 0, 1, 1,
0.2801794, 1.7162, -0.5700153, 1, 0, 0, 1, 1,
0.2821073, 0.1914038, 1.161613, 1, 0, 0, 1, 1,
0.2821503, 0.4234534, 1.262255, 0, 0, 0, 1, 1,
0.28622, -0.9544408, 4.531616, 0, 0, 0, 1, 1,
0.2865951, -0.5736101, 2.383277, 0, 0, 0, 1, 1,
0.2881447, 0.1848839, 1.231395, 0, 0, 0, 1, 1,
0.2904813, -0.3747746, 2.021391, 0, 0, 0, 1, 1,
0.2938613, 0.1330411, 1.618772, 0, 0, 0, 1, 1,
0.2965011, 1.040653, -0.6177573, 0, 0, 0, 1, 1,
0.2984114, 1.603167, -0.636881, 1, 1, 1, 1, 1,
0.3012976, 2.277645, -0.1674257, 1, 1, 1, 1, 1,
0.3023608, -2.094899, 3.044065, 1, 1, 1, 1, 1,
0.3046249, 1.56016, 0.8499895, 1, 1, 1, 1, 1,
0.3082651, 1.602163, 0.9613156, 1, 1, 1, 1, 1,
0.3090398, 0.8050941, -0.3075577, 1, 1, 1, 1, 1,
0.3117178, 0.2991597, 1.387077, 1, 1, 1, 1, 1,
0.3123139, -0.3261317, 3.478651, 1, 1, 1, 1, 1,
0.3159727, -0.5076092, 2.94545, 1, 1, 1, 1, 1,
0.3170386, 0.744695, -0.5237523, 1, 1, 1, 1, 1,
0.318203, 0.2591305, 1.880504, 1, 1, 1, 1, 1,
0.3184831, 1.456854, -0.4637791, 1, 1, 1, 1, 1,
0.3203625, 0.1452107, 1.624694, 1, 1, 1, 1, 1,
0.3270128, -0.7116319, 1.975496, 1, 1, 1, 1, 1,
0.3309202, -0.2809112, 1.074049, 1, 1, 1, 1, 1,
0.3316508, 1.060417, -1.29917, 0, 0, 1, 1, 1,
0.3321096, 1.584915, -0.3950774, 1, 0, 0, 1, 1,
0.3353309, 0.8084385, 1.105931, 1, 0, 0, 1, 1,
0.3379485, 0.9057986, 0.7205348, 1, 0, 0, 1, 1,
0.3412853, -0.3799148, 3.474994, 1, 0, 0, 1, 1,
0.3459733, -0.1389908, 3.38911, 1, 0, 0, 1, 1,
0.3542169, 1.026391, 0.0145505, 0, 0, 0, 1, 1,
0.3570949, 0.7606836, 0.5945133, 0, 0, 0, 1, 1,
0.3581073, -2.288545, 2.889914, 0, 0, 0, 1, 1,
0.3603027, 0.7526305, 1.153394, 0, 0, 0, 1, 1,
0.3606392, -1.181092, 4.041933, 0, 0, 0, 1, 1,
0.3676733, 0.08444481, 2.399669, 0, 0, 0, 1, 1,
0.3684576, 0.4885363, 2.856581, 0, 0, 0, 1, 1,
0.3686034, -0.6096925, 3.121232, 1, 1, 1, 1, 1,
0.37707, 1.268724, -0.8881974, 1, 1, 1, 1, 1,
0.3823246, 0.3928748, -0.3836351, 1, 1, 1, 1, 1,
0.3847323, -0.006516178, 1.679574, 1, 1, 1, 1, 1,
0.385945, -2.106491, 2.045809, 1, 1, 1, 1, 1,
0.3896626, -0.5311518, 1.985788, 1, 1, 1, 1, 1,
0.3911196, 0.6901996, 0.03209598, 1, 1, 1, 1, 1,
0.3982034, 1.931586, 0.0865248, 1, 1, 1, 1, 1,
0.3982735, -0.1631851, 2.280666, 1, 1, 1, 1, 1,
0.3987872, 0.5544457, 1.721266, 1, 1, 1, 1, 1,
0.4006858, -1.974569, 2.741454, 1, 1, 1, 1, 1,
0.4049887, 0.9621695, -0.7581255, 1, 1, 1, 1, 1,
0.405252, 0.6635024, -0.3425041, 1, 1, 1, 1, 1,
0.4098387, 1.520122, 0.9350027, 1, 1, 1, 1, 1,
0.4225115, 0.707715, 1.987291, 1, 1, 1, 1, 1,
0.4236178, 1.018255, 0.8522174, 0, 0, 1, 1, 1,
0.4289348, -0.05461787, 1.467213, 1, 0, 0, 1, 1,
0.4316491, 0.2225898, 2.731879, 1, 0, 0, 1, 1,
0.4330959, 0.1343044, 2.480222, 1, 0, 0, 1, 1,
0.4336823, 0.3361883, 0.4717146, 1, 0, 0, 1, 1,
0.4337977, 1.602876, -0.5864933, 1, 0, 0, 1, 1,
0.4411223, -0.9944195, 1.080688, 0, 0, 0, 1, 1,
0.4465069, -0.48074, 2.687458, 0, 0, 0, 1, 1,
0.4525462, 1.869684, 1.715065, 0, 0, 0, 1, 1,
0.4564472, 0.6046911, 1.739288, 0, 0, 0, 1, 1,
0.4599094, -0.9605144, 4.474311, 0, 0, 0, 1, 1,
0.4631476, 1.160155, -0.8341864, 0, 0, 0, 1, 1,
0.4702725, 0.208132, 2.581007, 0, 0, 0, 1, 1,
0.4710325, -0.8258283, 1.890913, 1, 1, 1, 1, 1,
0.47499, -0.6920869, 0.6512849, 1, 1, 1, 1, 1,
0.4754434, 1.185125, -0.6570247, 1, 1, 1, 1, 1,
0.4757242, 0.6015952, -0.3805565, 1, 1, 1, 1, 1,
0.4759143, -0.5212126, 1.830327, 1, 1, 1, 1, 1,
0.4772779, 0.418893, 0.2617211, 1, 1, 1, 1, 1,
0.4808619, 0.946353, 0.3106667, 1, 1, 1, 1, 1,
0.4831407, -1.296703, 3.273451, 1, 1, 1, 1, 1,
0.4861186, -1.905512, 2.863798, 1, 1, 1, 1, 1,
0.4873855, -2.266892, 3.552221, 1, 1, 1, 1, 1,
0.491894, 0.4047026, 2.019217, 1, 1, 1, 1, 1,
0.4977537, 2.654338, 1.257482, 1, 1, 1, 1, 1,
0.4983417, -0.4236009, 1.696677, 1, 1, 1, 1, 1,
0.499291, 0.6663005, 1.555662, 1, 1, 1, 1, 1,
0.5002822, 1.718932, 0.599739, 1, 1, 1, 1, 1,
0.5022491, -0.4993036, 3.369853, 0, 0, 1, 1, 1,
0.5059886, -0.08606865, 1.839881, 1, 0, 0, 1, 1,
0.5084503, 1.999885, -1.152196, 1, 0, 0, 1, 1,
0.5117174, 0.09267066, 2.045075, 1, 0, 0, 1, 1,
0.5144299, -0.4631971, 2.950019, 1, 0, 0, 1, 1,
0.5192701, -0.791293, 0.6261029, 1, 0, 0, 1, 1,
0.5226429, -0.1600067, 0.9351581, 0, 0, 0, 1, 1,
0.523785, -0.3935412, 1.359467, 0, 0, 0, 1, 1,
0.5254847, -1.272619, 1.530214, 0, 0, 0, 1, 1,
0.5285971, -0.835879, 2.513063, 0, 0, 0, 1, 1,
0.5314973, -0.3693472, 2.69931, 0, 0, 0, 1, 1,
0.5340017, 0.5478446, 1.377679, 0, 0, 0, 1, 1,
0.5340964, 0.1106553, 1.365512, 0, 0, 0, 1, 1,
0.5416678, 0.6970288, 0.8961198, 1, 1, 1, 1, 1,
0.5452966, -0.2700068, 1.148142, 1, 1, 1, 1, 1,
0.5465502, -0.7119251, 4.062121, 1, 1, 1, 1, 1,
0.5473195, 0.4150803, 2.10835, 1, 1, 1, 1, 1,
0.5584683, 0.3865594, 1.47398, 1, 1, 1, 1, 1,
0.5606894, 0.6368414, 0.1337782, 1, 1, 1, 1, 1,
0.5638152, -0.2334345, 0.8666106, 1, 1, 1, 1, 1,
0.5652415, -0.5956074, 3.057302, 1, 1, 1, 1, 1,
0.5715216, -0.1756287, 3.394526, 1, 1, 1, 1, 1,
0.5785635, -0.6415362, 1.543606, 1, 1, 1, 1, 1,
0.5904761, -2.404261, 4.003024, 1, 1, 1, 1, 1,
0.5972589, 1.203318, 1.001379, 1, 1, 1, 1, 1,
0.6100595, -0.899537, 5.341876, 1, 1, 1, 1, 1,
0.6137446, -0.02041849, 3.358423, 1, 1, 1, 1, 1,
0.6162172, -0.5701906, 2.345121, 1, 1, 1, 1, 1,
0.6187214, -0.3754676, 2.27601, 0, 0, 1, 1, 1,
0.6273235, 0.5482801, 1.242315, 1, 0, 0, 1, 1,
0.6305407, -1.10489, 0.2694492, 1, 0, 0, 1, 1,
0.6364, -0.2703804, 1.652445, 1, 0, 0, 1, 1,
0.6377088, -0.8262881, 2.767714, 1, 0, 0, 1, 1,
0.6380219, -0.1541838, 3.433645, 1, 0, 0, 1, 1,
0.640723, 1.470447, -0.4232623, 0, 0, 0, 1, 1,
0.6408368, 0.3447188, 1.263852, 0, 0, 0, 1, 1,
0.6428359, 1.745842, 0.703442, 0, 0, 0, 1, 1,
0.6452785, 0.3982378, -0.3370495, 0, 0, 0, 1, 1,
0.6455593, -1.089129, 3.176794, 0, 0, 0, 1, 1,
0.6482008, -0.4334439, 2.544089, 0, 0, 0, 1, 1,
0.6489145, 0.6138098, 2.507606, 0, 0, 0, 1, 1,
0.6509284, 1.827423, -0.5409597, 1, 1, 1, 1, 1,
0.6544333, 0.86063, 1.271386, 1, 1, 1, 1, 1,
0.6559194, 1.109399, 1.739852, 1, 1, 1, 1, 1,
0.6643878, 0.4770941, 0.425959, 1, 1, 1, 1, 1,
0.6655719, 0.3158021, 0.7135588, 1, 1, 1, 1, 1,
0.6662138, -0.2630925, 3.227856, 1, 1, 1, 1, 1,
0.6662247, 0.2202573, 1.358062, 1, 1, 1, 1, 1,
0.6664178, -0.9884359, 3.602072, 1, 1, 1, 1, 1,
0.6686845, -1.352548, 3.543748, 1, 1, 1, 1, 1,
0.6876233, 1.456528, -0.9389492, 1, 1, 1, 1, 1,
0.6882618, -0.6562636, 3.547484, 1, 1, 1, 1, 1,
0.6925585, 1.221385, 2.783932, 1, 1, 1, 1, 1,
0.6996734, 0.3386684, 1.134209, 1, 1, 1, 1, 1,
0.7031727, 0.7620167, 0.3141348, 1, 1, 1, 1, 1,
0.7038743, -0.947202, 3.628547, 1, 1, 1, 1, 1,
0.7044194, -0.6422645, 3.193257, 0, 0, 1, 1, 1,
0.7061152, -1.2124, 1.350228, 1, 0, 0, 1, 1,
0.7090317, -1.629987, 2.63904, 1, 0, 0, 1, 1,
0.7178007, -0.6307554, 1.553075, 1, 0, 0, 1, 1,
0.7247658, -0.6335927, 2.074974, 1, 0, 0, 1, 1,
0.7250326, -0.6718194, 1.993456, 1, 0, 0, 1, 1,
0.7250947, 1.153558, 0.8615469, 0, 0, 0, 1, 1,
0.7291251, 1.286236, 2.644637, 0, 0, 0, 1, 1,
0.7299633, -0.3675771, 3.28674, 0, 0, 0, 1, 1,
0.7311174, 0.07718684, 1.183037, 0, 0, 0, 1, 1,
0.7345926, 0.9205061, 0.4158505, 0, 0, 0, 1, 1,
0.7447062, -0.7751713, 3.616079, 0, 0, 0, 1, 1,
0.7548335, 1.281764, 0.9185891, 0, 0, 0, 1, 1,
0.7611969, -1.877485, 1.71489, 1, 1, 1, 1, 1,
0.7678107, 0.0853287, 1.584569, 1, 1, 1, 1, 1,
0.7730556, 0.0398899, 3.759843, 1, 1, 1, 1, 1,
0.7782391, 0.6624169, 1.757553, 1, 1, 1, 1, 1,
0.7787325, -1.430286, 2.016241, 1, 1, 1, 1, 1,
0.7827845, -0.3799979, 1.624333, 1, 1, 1, 1, 1,
0.7859249, 0.0408508, 1.880738, 1, 1, 1, 1, 1,
0.7883463, 0.9086257, 0.4109548, 1, 1, 1, 1, 1,
0.7899758, 1.635785, 1.312642, 1, 1, 1, 1, 1,
0.7901374, -0.337561, 0.3491664, 1, 1, 1, 1, 1,
0.7960395, 1.459693, 1.318007, 1, 1, 1, 1, 1,
0.8000478, -1.450183, 1.413267, 1, 1, 1, 1, 1,
0.8044267, 0.04039118, 0.3219453, 1, 1, 1, 1, 1,
0.8059804, -1.201612, 3.224301, 1, 1, 1, 1, 1,
0.8062832, -1.155574, 2.406895, 1, 1, 1, 1, 1,
0.8067006, -0.1299536, 1.409558, 0, 0, 1, 1, 1,
0.8097265, 1.981384, 1.894693, 1, 0, 0, 1, 1,
0.8105964, -0.656132, 2.285618, 1, 0, 0, 1, 1,
0.8141503, -0.8803819, 3.485069, 1, 0, 0, 1, 1,
0.814532, 0.002318504, 1.653694, 1, 0, 0, 1, 1,
0.8155756, -0.8445792, 2.309228, 1, 0, 0, 1, 1,
0.8158988, 0.2666346, 0.7479486, 0, 0, 0, 1, 1,
0.8167689, 0.7691551, 1.723882, 0, 0, 0, 1, 1,
0.818955, 0.2976857, 1.544421, 0, 0, 0, 1, 1,
0.8284658, -0.369241, 1.618724, 0, 0, 0, 1, 1,
0.8304485, -0.4231746, 0.7624618, 0, 0, 0, 1, 1,
0.8310621, -0.09023634, 1.767715, 0, 0, 0, 1, 1,
0.8345616, -0.1697765, 2.233176, 0, 0, 0, 1, 1,
0.8348881, -0.7947684, 1.313133, 1, 1, 1, 1, 1,
0.8363054, -0.3875518, 3.203976, 1, 1, 1, 1, 1,
0.8434623, 0.5245528, -0.2045639, 1, 1, 1, 1, 1,
0.8442948, 0.06194052, 2.83758, 1, 1, 1, 1, 1,
0.8443473, 0.479412, 0.7972252, 1, 1, 1, 1, 1,
0.8446006, -1.527087, 3.343083, 1, 1, 1, 1, 1,
0.8466487, 0.3916762, 0.2828899, 1, 1, 1, 1, 1,
0.8477151, -0.8461832, 2.993329, 1, 1, 1, 1, 1,
0.848287, -0.01660763, 0.5853295, 1, 1, 1, 1, 1,
0.8517005, 0.1348241, 1.369792, 1, 1, 1, 1, 1,
0.858212, -0.588352, 1.928436, 1, 1, 1, 1, 1,
0.8628582, 0.278125, 2.611346, 1, 1, 1, 1, 1,
0.8932615, -0.1704002, 1.586628, 1, 1, 1, 1, 1,
0.8943397, -0.282853, 1.304792, 1, 1, 1, 1, 1,
0.8953424, -3.222436, 0.8072432, 1, 1, 1, 1, 1,
0.8967036, -0.5574986, 1.533761, 0, 0, 1, 1, 1,
0.901858, 0.3023849, 2.954185, 1, 0, 0, 1, 1,
0.9023899, 0.1660232, 2.187829, 1, 0, 0, 1, 1,
0.9064496, 0.3031936, -0.2811454, 1, 0, 0, 1, 1,
0.9140081, 0.8139952, 0.5117499, 1, 0, 0, 1, 1,
0.9148213, 1.520427, 1.833994, 1, 0, 0, 1, 1,
0.9173874, 0.5535643, 0.2267708, 0, 0, 0, 1, 1,
0.9178413, -1.451801, 4.26868, 0, 0, 0, 1, 1,
0.9247445, 0.3065906, 1.952309, 0, 0, 0, 1, 1,
0.9302599, 0.3616618, 2.891399, 0, 0, 0, 1, 1,
0.9330113, 0.5459664, 1.001315, 0, 0, 0, 1, 1,
0.9358032, -1.212924, 3.504928, 0, 0, 0, 1, 1,
0.9392298, -0.04009042, 3.012661, 0, 0, 0, 1, 1,
0.9404559, -0.1286987, 1.31539, 1, 1, 1, 1, 1,
0.942754, -0.5534298, 3.264639, 1, 1, 1, 1, 1,
0.9446418, 0.9995446, 0.6893688, 1, 1, 1, 1, 1,
0.9606397, 0.2552758, 1.618433, 1, 1, 1, 1, 1,
0.9643229, 0.8475267, -0.2064383, 1, 1, 1, 1, 1,
0.9662356, -0.2468492, 1.759684, 1, 1, 1, 1, 1,
0.9672541, -0.06384806, 1.651563, 1, 1, 1, 1, 1,
0.9699113, -0.5877857, 1.654261, 1, 1, 1, 1, 1,
0.9699604, 1.130055, 0.5491381, 1, 1, 1, 1, 1,
0.9727517, 0.5390572, 0.77178, 1, 1, 1, 1, 1,
0.9743758, -0.6737256, 2.869813, 1, 1, 1, 1, 1,
0.9762342, -1.332169, 1.866042, 1, 1, 1, 1, 1,
0.9834496, 1.653953, -0.5666476, 1, 1, 1, 1, 1,
0.9874165, 0.2301072, 0.7724472, 1, 1, 1, 1, 1,
0.9884705, -0.7890601, 3.084625, 1, 1, 1, 1, 1,
1.016443, -0.9761044, 2.599403, 0, 0, 1, 1, 1,
1.017506, -1.711159, 3.739955, 1, 0, 0, 1, 1,
1.017692, 1.138964, 1.092291, 1, 0, 0, 1, 1,
1.020769, 1.31951, 0.3121534, 1, 0, 0, 1, 1,
1.023761, -1.30074, 1.063741, 1, 0, 0, 1, 1,
1.024217, 0.6725808, 0.965768, 1, 0, 0, 1, 1,
1.030976, -1.393938, 1.861339, 0, 0, 0, 1, 1,
1.034727, -0.1533516, 2.324922, 0, 0, 0, 1, 1,
1.035526, 2.056767, -1.105378, 0, 0, 0, 1, 1,
1.037601, 0.246086, 1.197039, 0, 0, 0, 1, 1,
1.041581, 0.1503031, 0.4251869, 0, 0, 0, 1, 1,
1.048574, -0.51595, 1.577646, 0, 0, 0, 1, 1,
1.05156, 0.8561831, -0.04444161, 0, 0, 0, 1, 1,
1.058017, 1.248605, 2.38101, 1, 1, 1, 1, 1,
1.061742, 1.453407, -0.2056857, 1, 1, 1, 1, 1,
1.072195, 0.4642901, 1.640457, 1, 1, 1, 1, 1,
1.072532, 0.189738, 1.311545, 1, 1, 1, 1, 1,
1.076439, 1.811166, 0.9532681, 1, 1, 1, 1, 1,
1.077809, 0.8379823, 0.6621284, 1, 1, 1, 1, 1,
1.080724, -0.8078622, 3.5043, 1, 1, 1, 1, 1,
1.081126, 0.3322892, 0.8233753, 1, 1, 1, 1, 1,
1.090862, 0.1230836, 2.277936, 1, 1, 1, 1, 1,
1.095186, -1.179004, 1.718263, 1, 1, 1, 1, 1,
1.095487, 0.9764835, 1.10078, 1, 1, 1, 1, 1,
1.107744, 1.202676, 0.6241666, 1, 1, 1, 1, 1,
1.110381, -0.1895632, 1.908607, 1, 1, 1, 1, 1,
1.119411, -0.2598632, 1.593937, 1, 1, 1, 1, 1,
1.119675, 1.544641, -0.5157073, 1, 1, 1, 1, 1,
1.12626, 0.7847412, -0.01910164, 0, 0, 1, 1, 1,
1.131432, -0.7238699, 1.329846, 1, 0, 0, 1, 1,
1.137383, 0.9900445, -0.629891, 1, 0, 0, 1, 1,
1.145509, -0.6585058, 2.040565, 1, 0, 0, 1, 1,
1.147425, 0.7284192, 1.446657, 1, 0, 0, 1, 1,
1.150151, 1.791998, 0.922591, 1, 0, 0, 1, 1,
1.152806, 0.3073781, 0.7064805, 0, 0, 0, 1, 1,
1.153597, 0.5573194, 2.217316, 0, 0, 0, 1, 1,
1.156894, 0.02639267, 1.767831, 0, 0, 0, 1, 1,
1.157384, 0.3342988, 1.488459, 0, 0, 0, 1, 1,
1.159235, -0.5430893, 4.017953, 0, 0, 0, 1, 1,
1.159709, 0.5181319, 1.881715, 0, 0, 0, 1, 1,
1.162326, -0.6584184, 0.934737, 0, 0, 0, 1, 1,
1.181992, -0.5436233, 1.770662, 1, 1, 1, 1, 1,
1.193237, -1.149912, 2.897067, 1, 1, 1, 1, 1,
1.196259, 2.030068, 3.017369, 1, 1, 1, 1, 1,
1.205781, 0.4174924, 0.7741432, 1, 1, 1, 1, 1,
1.206217, 0.3834989, -0.4711028, 1, 1, 1, 1, 1,
1.209322, -1.469375, 4.083838, 1, 1, 1, 1, 1,
1.213305, 1.950372, 0.7921953, 1, 1, 1, 1, 1,
1.22455, 0.4472652, 1.603789, 1, 1, 1, 1, 1,
1.22545, -1.727262, 2.787925, 1, 1, 1, 1, 1,
1.234828, 0.5532336, 1.247213, 1, 1, 1, 1, 1,
1.234882, 1.307392, 1.234322, 1, 1, 1, 1, 1,
1.241506, -0.04194014, 1.664243, 1, 1, 1, 1, 1,
1.259167, 0.5012585, 2.01538, 1, 1, 1, 1, 1,
1.259501, -1.071104, 2.603392, 1, 1, 1, 1, 1,
1.266138, -0.8384314, 1.404915, 1, 1, 1, 1, 1,
1.266776, -0.1083087, -0.4667762, 0, 0, 1, 1, 1,
1.267767, 0.6869398, 1.201098, 1, 0, 0, 1, 1,
1.268036, -0.461912, 1.84568, 1, 0, 0, 1, 1,
1.272688, -0.690828, 0.6229055, 1, 0, 0, 1, 1,
1.274786, -1.977479, 2.684057, 1, 0, 0, 1, 1,
1.276746, -0.5728949, 2.043986, 1, 0, 0, 1, 1,
1.278062, 0.4435033, 2.012229, 0, 0, 0, 1, 1,
1.278615, -0.5203862, 1.563483, 0, 0, 0, 1, 1,
1.286936, -0.1253902, -0.3503623, 0, 0, 0, 1, 1,
1.306676, -0.5505244, 2.696059, 0, 0, 0, 1, 1,
1.307854, 1.912589, -0.1511708, 0, 0, 0, 1, 1,
1.321385, -0.4208275, 4.248516, 0, 0, 0, 1, 1,
1.323128, 0.04753901, 1.123177, 0, 0, 0, 1, 1,
1.324092, 0.8734637, 1.80084, 1, 1, 1, 1, 1,
1.328432, 0.165561, 2.600502, 1, 1, 1, 1, 1,
1.329671, -0.433207, 1.493107, 1, 1, 1, 1, 1,
1.337242, 0.5822746, 0.5186043, 1, 1, 1, 1, 1,
1.338098, -0.1857965, 2.169294, 1, 1, 1, 1, 1,
1.343885, 0.2164025, 1.450401, 1, 1, 1, 1, 1,
1.349219, 0.9137461, 1.231663, 1, 1, 1, 1, 1,
1.35673, 0.3524684, 2.026995, 1, 1, 1, 1, 1,
1.357892, -0.6298292, 1.551714, 1, 1, 1, 1, 1,
1.363217, -0.4458746, 2.930309, 1, 1, 1, 1, 1,
1.365649, -1.38632, 1.868238, 1, 1, 1, 1, 1,
1.378286, -0.05929098, 2.426566, 1, 1, 1, 1, 1,
1.378779, 0.3974475, 1.826868, 1, 1, 1, 1, 1,
1.38256, 0.4539835, 3.303524, 1, 1, 1, 1, 1,
1.387071, -0.8382581, 2.123567, 1, 1, 1, 1, 1,
1.392113, 1.541502, 1.992382, 0, 0, 1, 1, 1,
1.393923, 1.557652, 1.904507, 1, 0, 0, 1, 1,
1.399225, 0.5394414, 1.546809, 1, 0, 0, 1, 1,
1.410345, -1.922289, 2.661466, 1, 0, 0, 1, 1,
1.420452, 0.0760052, 1.868012, 1, 0, 0, 1, 1,
1.422737, -0.6927468, 1.198515, 1, 0, 0, 1, 1,
1.430891, -1.202848, 1.254386, 0, 0, 0, 1, 1,
1.436607, 0.3631794, 2.263503, 0, 0, 0, 1, 1,
1.441832, 0.2502417, 1.042296, 0, 0, 0, 1, 1,
1.448425, 1.003358, 1.898337, 0, 0, 0, 1, 1,
1.449678, 0.3814314, 3.167577, 0, 0, 0, 1, 1,
1.469789, 1.079036, 1.825931, 0, 0, 0, 1, 1,
1.495692, -0.3843906, 2.227178, 0, 0, 0, 1, 1,
1.508564, 1.133964, -0.5321957, 1, 1, 1, 1, 1,
1.519206, 0.3091651, 1.39934, 1, 1, 1, 1, 1,
1.523158, -2.457662, 2.577755, 1, 1, 1, 1, 1,
1.525776, -1.491965, 2.53422, 1, 1, 1, 1, 1,
1.528911, -0.7078007, 4.48368, 1, 1, 1, 1, 1,
1.535538, 0.1375145, 1.930829, 1, 1, 1, 1, 1,
1.537741, 2.37198, 0.8680328, 1, 1, 1, 1, 1,
1.538663, -1.98969, 3.260317, 1, 1, 1, 1, 1,
1.54577, -0.2505025, 0.8798878, 1, 1, 1, 1, 1,
1.552057, -0.6927369, 2.804405, 1, 1, 1, 1, 1,
1.564668, -0.4930076, 1.249029, 1, 1, 1, 1, 1,
1.57954, -0.9790014, 1.827081, 1, 1, 1, 1, 1,
1.580619, 0.6199315, 1.937507, 1, 1, 1, 1, 1,
1.592486, -0.2940098, 0.2302213, 1, 1, 1, 1, 1,
1.59825, 0.5801423, 1.228344, 1, 1, 1, 1, 1,
1.601882, 0.3733208, 2.136998, 0, 0, 1, 1, 1,
1.614831, 0.04566878, -1.211136, 1, 0, 0, 1, 1,
1.61691, -0.2872987, 0.6529782, 1, 0, 0, 1, 1,
1.619651, 0.8672105, 0.7443688, 1, 0, 0, 1, 1,
1.622513, -1.657405, 4.748343, 1, 0, 0, 1, 1,
1.622782, 1.217664, 1.436764, 1, 0, 0, 1, 1,
1.624333, -1.034637, 2.294003, 0, 0, 0, 1, 1,
1.627666, 0.02588827, 1.825007, 0, 0, 0, 1, 1,
1.629071, 0.5934076, 1.859631, 0, 0, 0, 1, 1,
1.632688, -0.1462881, 2.052162, 0, 0, 0, 1, 1,
1.633556, -0.3954614, 0.5164294, 0, 0, 0, 1, 1,
1.637532, 0.6546211, 0.9191687, 0, 0, 0, 1, 1,
1.642933, -1.040283, 3.558855, 0, 0, 0, 1, 1,
1.661744, -0.8913596, 1.098252, 1, 1, 1, 1, 1,
1.675498, 1.808723, -1.405166, 1, 1, 1, 1, 1,
1.686536, -0.4890076, 1.017831, 1, 1, 1, 1, 1,
1.687802, 1.308033, 0.7759075, 1, 1, 1, 1, 1,
1.691963, -0.2416564, 0.8250324, 1, 1, 1, 1, 1,
1.696841, 0.3153527, 1.188896, 1, 1, 1, 1, 1,
1.697693, 1.011525, 1.060496, 1, 1, 1, 1, 1,
1.718598, 0.0118983, 3.168287, 1, 1, 1, 1, 1,
1.719029, 0.4179587, 1.628056, 1, 1, 1, 1, 1,
1.721975, -1.370157, 1.280292, 1, 1, 1, 1, 1,
1.755436, 1.899979, 0.09187447, 1, 1, 1, 1, 1,
1.766255, 0.3695461, 0.7097631, 1, 1, 1, 1, 1,
1.781438, 0.328503, 2.073515, 1, 1, 1, 1, 1,
1.827089, -1.167451, 3.045046, 1, 1, 1, 1, 1,
1.827645, 0.3761263, 0.3865525, 1, 1, 1, 1, 1,
1.871583, 0.946465, 0.6553469, 0, 0, 1, 1, 1,
1.873091, 0.1611929, 1.558088, 1, 0, 0, 1, 1,
1.904424, 0.3119375, 1.362059, 1, 0, 0, 1, 1,
1.910058, -2.316056, 2.393356, 1, 0, 0, 1, 1,
1.912275, 0.1823889, 2.531734, 1, 0, 0, 1, 1,
1.920864, -0.1269221, 1.087467, 1, 0, 0, 1, 1,
1.940153, -0.1609627, 4.827807, 0, 0, 0, 1, 1,
1.944458, 0.4431679, 0.57005, 0, 0, 0, 1, 1,
1.952602, -1.758534, 2.817034, 0, 0, 0, 1, 1,
1.955639, -1.606703, 2.305543, 0, 0, 0, 1, 1,
1.964192, -0.5894377, 1.985884, 0, 0, 0, 1, 1,
1.965708, -0.00507339, 0.5166097, 0, 0, 0, 1, 1,
1.965785, -1.921473, 1.94611, 0, 0, 0, 1, 1,
1.992602, -1.095297, 1.851954, 1, 1, 1, 1, 1,
2.012051, -0.7787449, 2.811775, 1, 1, 1, 1, 1,
2.015829, -0.001108943, 2.156264, 1, 1, 1, 1, 1,
2.023504, 0.08025653, 2.124181, 1, 1, 1, 1, 1,
2.040259, 0.2997861, 2.495667, 1, 1, 1, 1, 1,
2.040716, -0.4325536, 2.299345, 1, 1, 1, 1, 1,
2.047049, -0.4648409, 1.681955, 1, 1, 1, 1, 1,
2.049792, 0.3418298, 0.01462266, 1, 1, 1, 1, 1,
2.058799, 2.411784, 1.197387, 1, 1, 1, 1, 1,
2.105547, -0.9831794, 0.8690844, 1, 1, 1, 1, 1,
2.111978, 0.2246221, 3.62079, 1, 1, 1, 1, 1,
2.139398, 0.355944, 0.3730657, 1, 1, 1, 1, 1,
2.142668, 0.1493198, 1.271881, 1, 1, 1, 1, 1,
2.1562, 0.3739883, 1.035569, 1, 1, 1, 1, 1,
2.166411, -0.9900684, 3.921741, 1, 1, 1, 1, 1,
2.178786, 1.010342, 1.770535, 0, 0, 1, 1, 1,
2.184168, -0.9402755, 0.8539026, 1, 0, 0, 1, 1,
2.262998, 0.02102194, 0.5984418, 1, 0, 0, 1, 1,
2.269845, -0.4870457, -0.3501617, 1, 0, 0, 1, 1,
2.272593, -1.145567, 1.773835, 1, 0, 0, 1, 1,
2.276791, -0.8379756, 2.398314, 1, 0, 0, 1, 1,
2.293884, 1.81985, 0.3442028, 0, 0, 0, 1, 1,
2.350667, -0.9218961, 2.339824, 0, 0, 0, 1, 1,
2.353263, -0.3670462, 1.796743, 0, 0, 0, 1, 1,
2.455304, -1.959918, 3.590465, 0, 0, 0, 1, 1,
2.493875, 0.5226746, 1.211364, 0, 0, 0, 1, 1,
2.498878, -1.97572, 1.810439, 0, 0, 0, 1, 1,
2.511229, -0.4286585, 2.311241, 0, 0, 0, 1, 1,
2.54478, -1.261064, 1.204476, 1, 1, 1, 1, 1,
2.56238, -0.4890181, 3.774756, 1, 1, 1, 1, 1,
2.574492, -0.9447725, 2.047204, 1, 1, 1, 1, 1,
2.674113, 0.6372962, 1.256604, 1, 1, 1, 1, 1,
2.681849, 1.856583, 0.09378072, 1, 1, 1, 1, 1,
2.732402, 0.1835638, 1.925813, 1, 1, 1, 1, 1,
3.003509, -0.226361, -1.269206, 1, 1, 1, 1, 1
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
var radius = 9.666964;
var distance = 33.9548;
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
mvMatrix.translate( 0.4059381, 0.1993299, -0.09124827 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.9548);
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
