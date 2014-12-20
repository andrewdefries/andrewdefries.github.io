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
-2.998432, -0.740599, -2.626333, 1, 0, 0, 1,
-2.89656, -0.2974686, 0.07126704, 1, 0.007843138, 0, 1,
-2.800796, 0.8309194, -1.841277, 1, 0.01176471, 0, 1,
-2.705507, -0.2716592, -3.951866, 1, 0.01960784, 0, 1,
-2.510042, 0.5353951, -1.479946, 1, 0.02352941, 0, 1,
-2.486429, 0.5328364, -0.5318735, 1, 0.03137255, 0, 1,
-2.457146, -0.5765065, -1.585611, 1, 0.03529412, 0, 1,
-2.420431, -0.1157465, -2.671139, 1, 0.04313726, 0, 1,
-2.322586, -1.14382, -0.07348909, 1, 0.04705882, 0, 1,
-2.316318, -0.4585512, -2.46455, 1, 0.05490196, 0, 1,
-2.300329, -1.07392, -2.328465, 1, 0.05882353, 0, 1,
-2.285413, 0.7610574, -0.6084529, 1, 0.06666667, 0, 1,
-2.223794, -0.7604682, -1.72422, 1, 0.07058824, 0, 1,
-2.217192, -0.3149911, -3.648687, 1, 0.07843138, 0, 1,
-2.217047, 0.8190602, -1.345129, 1, 0.08235294, 0, 1,
-2.152416, -0.3463646, -1.209132, 1, 0.09019608, 0, 1,
-2.150949, 0.2223941, -1.660344, 1, 0.09411765, 0, 1,
-2.140367, -1.785606, -1.943287, 1, 0.1019608, 0, 1,
-2.103536, 0.5604791, -1.166446, 1, 0.1098039, 0, 1,
-2.077583, 0.05837494, -2.966358, 1, 0.1137255, 0, 1,
-2.050874, -0.6315193, -1.462879, 1, 0.1215686, 0, 1,
-2.047901, 0.2457848, -0.1614743, 1, 0.1254902, 0, 1,
-2.035394, -0.8600929, -1.138507, 1, 0.1333333, 0, 1,
-1.992062, -0.4764051, -0.848426, 1, 0.1372549, 0, 1,
-1.959886, -1.197312, -1.793678, 1, 0.145098, 0, 1,
-1.954825, 0.02900532, -1.503845, 1, 0.1490196, 0, 1,
-1.90465, 0.8020915, -0.6091981, 1, 0.1568628, 0, 1,
-1.832814, 2.223289, 0.9652534, 1, 0.1607843, 0, 1,
-1.805488, 0.9853747, -0.5314882, 1, 0.1686275, 0, 1,
-1.787725, -1.341927, -2.945748, 1, 0.172549, 0, 1,
-1.784442, -1.286461, -2.912578, 1, 0.1803922, 0, 1,
-1.779916, -0.8292734, -1.794014, 1, 0.1843137, 0, 1,
-1.768274, -1.390796, -2.124974, 1, 0.1921569, 0, 1,
-1.763096, -0.1475666, -1.88186, 1, 0.1960784, 0, 1,
-1.755409, -0.7910351, -3.813793, 1, 0.2039216, 0, 1,
-1.753615, 0.4960107, -2.026572, 1, 0.2117647, 0, 1,
-1.748634, -0.1739568, -0.9921471, 1, 0.2156863, 0, 1,
-1.746894, 1.484502, -2.181324, 1, 0.2235294, 0, 1,
-1.745428, -1.493039, -3.235456, 1, 0.227451, 0, 1,
-1.738076, -0.9338534, -1.711924, 1, 0.2352941, 0, 1,
-1.73617, -0.8748409, -1.345719, 1, 0.2392157, 0, 1,
-1.731642, -0.3867926, -2.445781, 1, 0.2470588, 0, 1,
-1.696868, 0.946606, -1.394697, 1, 0.2509804, 0, 1,
-1.685705, -0.7137038, -3.734988, 1, 0.2588235, 0, 1,
-1.683945, 2.463679, -1.326329, 1, 0.2627451, 0, 1,
-1.670523, 0.9718087, -1.671915, 1, 0.2705882, 0, 1,
-1.658923, -0.5841553, -0.9070193, 1, 0.2745098, 0, 1,
-1.653394, 0.6580562, -1.306906, 1, 0.282353, 0, 1,
-1.650733, 0.6548609, -1.377296, 1, 0.2862745, 0, 1,
-1.648672, -0.3223667, -3.217615, 1, 0.2941177, 0, 1,
-1.63391, 0.9592495, 0.4516554, 1, 0.3019608, 0, 1,
-1.627154, 0.177347, -2.585653, 1, 0.3058824, 0, 1,
-1.596543, -0.9053574, -3.009947, 1, 0.3137255, 0, 1,
-1.589592, -0.4586274, -1.825361, 1, 0.3176471, 0, 1,
-1.589228, -1.392322, -0.5249778, 1, 0.3254902, 0, 1,
-1.581575, -0.02866416, -1.555014, 1, 0.3294118, 0, 1,
-1.579579, -0.9820243, -1.034858, 1, 0.3372549, 0, 1,
-1.550323, 1.937876, -0.4958064, 1, 0.3411765, 0, 1,
-1.537084, 0.7965801, -1.058939, 1, 0.3490196, 0, 1,
-1.53192, 0.5443555, -2.957107, 1, 0.3529412, 0, 1,
-1.523301, 1.31362, 1.201188, 1, 0.3607843, 0, 1,
-1.507009, 0.7270629, -0.4772459, 1, 0.3647059, 0, 1,
-1.492617, -0.4286809, -3.093598, 1, 0.372549, 0, 1,
-1.490463, -0.02511344, -1.244386, 1, 0.3764706, 0, 1,
-1.486255, -1.843172, -1.403989, 1, 0.3843137, 0, 1,
-1.480558, -0.09351256, -2.391192, 1, 0.3882353, 0, 1,
-1.479945, -0.09482912, -2.146645, 1, 0.3960784, 0, 1,
-1.478644, -1.18957, -0.8070287, 1, 0.4039216, 0, 1,
-1.477851, 0.05675744, 0.2065514, 1, 0.4078431, 0, 1,
-1.46768, -2.278549, -1.71846, 1, 0.4156863, 0, 1,
-1.465673, 0.28144, -1.320283, 1, 0.4196078, 0, 1,
-1.465041, 0.5331619, -1.410854, 1, 0.427451, 0, 1,
-1.461802, 1.562566, 1.073518, 1, 0.4313726, 0, 1,
-1.461075, -0.2021799, 0.3386322, 1, 0.4392157, 0, 1,
-1.460657, -0.3583324, -1.047404, 1, 0.4431373, 0, 1,
-1.459286, -0.4900496, -0.6069726, 1, 0.4509804, 0, 1,
-1.446012, 0.1201106, -0.4145328, 1, 0.454902, 0, 1,
-1.438036, 0.5087931, -2.280949, 1, 0.4627451, 0, 1,
-1.434481, 0.5279535, -2.909548, 1, 0.4666667, 0, 1,
-1.434363, 1.249837, -1.417981, 1, 0.4745098, 0, 1,
-1.430092, -0.06998454, -3.404895, 1, 0.4784314, 0, 1,
-1.423922, -0.07812835, -0.9371092, 1, 0.4862745, 0, 1,
-1.423687, 0.6179561, -1.83037, 1, 0.4901961, 0, 1,
-1.422726, 0.02682807, -1.400149, 1, 0.4980392, 0, 1,
-1.418659, -0.1754599, -1.810262, 1, 0.5058824, 0, 1,
-1.418385, 0.7888654, -1.646134, 1, 0.509804, 0, 1,
-1.415641, 1.109853, -1.918128, 1, 0.5176471, 0, 1,
-1.397751, -0.01941848, -1.905349, 1, 0.5215687, 0, 1,
-1.387606, 1.760366, -1.542285, 1, 0.5294118, 0, 1,
-1.386738, -0.6851484, -2.444064, 1, 0.5333334, 0, 1,
-1.381154, -2.047816, -1.844455, 1, 0.5411765, 0, 1,
-1.377343, -1.183307, -2.259896, 1, 0.5450981, 0, 1,
-1.372138, 0.201813, -0.2702074, 1, 0.5529412, 0, 1,
-1.360339, 2.173715, -0.8252493, 1, 0.5568628, 0, 1,
-1.35782, 0.593244, -1.349587, 1, 0.5647059, 0, 1,
-1.352983, -1.461025, -1.353341, 1, 0.5686275, 0, 1,
-1.350645, 0.03604269, -2.120541, 1, 0.5764706, 0, 1,
-1.343388, -1.85831, -1.414304, 1, 0.5803922, 0, 1,
-1.341704, 0.1657704, 0.5717408, 1, 0.5882353, 0, 1,
-1.330217, -2.127976, -2.541977, 1, 0.5921569, 0, 1,
-1.326134, -0.2817332, -0.7414667, 1, 0.6, 0, 1,
-1.322949, -1.372778, -4.1782, 1, 0.6078432, 0, 1,
-1.322503, 1.503928, -0.8803561, 1, 0.6117647, 0, 1,
-1.322362, 0.3450857, 0.1496722, 1, 0.6196079, 0, 1,
-1.297171, 0.8423828, -0.6840157, 1, 0.6235294, 0, 1,
-1.289399, -0.06390682, -1.651478, 1, 0.6313726, 0, 1,
-1.287701, -0.1532034, -1.981446, 1, 0.6352941, 0, 1,
-1.286698, 0.8459159, -0.3165761, 1, 0.6431373, 0, 1,
-1.278833, 1.904649, -0.4595085, 1, 0.6470588, 0, 1,
-1.273134, -0.3933935, -1.00118, 1, 0.654902, 0, 1,
-1.262772, -0.5010535, -1.278849, 1, 0.6588235, 0, 1,
-1.25521, 0.8067005, -0.9511721, 1, 0.6666667, 0, 1,
-1.248526, 0.2902813, -2.378347, 1, 0.6705883, 0, 1,
-1.236921, 1.872849, -0.5691453, 1, 0.6784314, 0, 1,
-1.236824, -0.5426919, -1.554917, 1, 0.682353, 0, 1,
-1.229256, -0.6274448, 0.7614129, 1, 0.6901961, 0, 1,
-1.229062, -0.2492627, -1.957068, 1, 0.6941177, 0, 1,
-1.228769, -0.335199, -0.6815303, 1, 0.7019608, 0, 1,
-1.228037, -1.068278, -1.518673, 1, 0.7098039, 0, 1,
-1.227271, -0.4897114, -2.193443, 1, 0.7137255, 0, 1,
-1.221521, 0.2048154, -2.353245, 1, 0.7215686, 0, 1,
-1.20424, 0.5156202, -2.782741, 1, 0.7254902, 0, 1,
-1.203008, -0.8935913, -3.236744, 1, 0.7333333, 0, 1,
-1.20262, -0.796821, -1.926736, 1, 0.7372549, 0, 1,
-1.202556, 0.6901168, -1.54354, 1, 0.7450981, 0, 1,
-1.19958, -0.5393624, -1.488005, 1, 0.7490196, 0, 1,
-1.198645, 1.452432, -2.354483, 1, 0.7568628, 0, 1,
-1.196242, 0.2523953, 0.8436704, 1, 0.7607843, 0, 1,
-1.194354, -0.0269703, -0.2824727, 1, 0.7686275, 0, 1,
-1.182246, -0.6603905, -2.567936, 1, 0.772549, 0, 1,
-1.182203, -2.023976, -1.45525, 1, 0.7803922, 0, 1,
-1.180421, 0.1318763, -1.635667, 1, 0.7843137, 0, 1,
-1.174424, -1.372928, -3.033034, 1, 0.7921569, 0, 1,
-1.173686, -0.8352913, -2.333946, 1, 0.7960784, 0, 1,
-1.170672, 0.3713792, -1.811739, 1, 0.8039216, 0, 1,
-1.15198, -1.072257, -2.589216, 1, 0.8117647, 0, 1,
-1.147912, -0.8495027, -2.054578, 1, 0.8156863, 0, 1,
-1.138154, 0.4508137, -2.240666, 1, 0.8235294, 0, 1,
-1.129746, -0.6866056, -0.6282477, 1, 0.827451, 0, 1,
-1.125105, 1.024374, -1.52281, 1, 0.8352941, 0, 1,
-1.120845, -0.3022401, -1.517508, 1, 0.8392157, 0, 1,
-1.120337, -0.028094, -2.207527, 1, 0.8470588, 0, 1,
-1.115826, 0.559141, -2.430549, 1, 0.8509804, 0, 1,
-1.115653, 0.4387538, -0.97711, 1, 0.8588235, 0, 1,
-1.113274, 0.6461889, -2.034928, 1, 0.8627451, 0, 1,
-1.111138, 0.1953918, -1.511689, 1, 0.8705882, 0, 1,
-1.105019, 1.631294, 0.638086, 1, 0.8745098, 0, 1,
-1.098246, -0.2481884, -0.3434247, 1, 0.8823529, 0, 1,
-1.097843, 0.2147686, -0.795029, 1, 0.8862745, 0, 1,
-1.094885, 0.05891112, -0.6476909, 1, 0.8941177, 0, 1,
-1.093902, -2.541355, -2.178364, 1, 0.8980392, 0, 1,
-1.093809, -0.1199763, -0.2408016, 1, 0.9058824, 0, 1,
-1.091751, 1.012509, -1.125657, 1, 0.9137255, 0, 1,
-1.090948, -0.6941235, -3.036239, 1, 0.9176471, 0, 1,
-1.090578, -0.1243153, -0.8689681, 1, 0.9254902, 0, 1,
-1.083124, -0.4629691, -2.98364, 1, 0.9294118, 0, 1,
-1.08042, 1.340432, -2.565456, 1, 0.9372549, 0, 1,
-1.073721, -0.9704158, -3.731705, 1, 0.9411765, 0, 1,
-1.059775, 0.6370223, -0.5796462, 1, 0.9490196, 0, 1,
-1.053346, -0.9243678, -1.660287, 1, 0.9529412, 0, 1,
-1.049756, -0.5951494, -1.643769, 1, 0.9607843, 0, 1,
-1.042639, 0.06413067, -1.39449, 1, 0.9647059, 0, 1,
-1.039024, 1.13542, -2.027915, 1, 0.972549, 0, 1,
-1.02514, 0.5145112, 1.677707, 1, 0.9764706, 0, 1,
-1.021127, 0.04591347, -2.239289, 1, 0.9843137, 0, 1,
-1.020321, 1.002504, -1.141704, 1, 0.9882353, 0, 1,
-1.008436, -0.2176144, -2.896378, 1, 0.9960784, 0, 1,
-1.00594, -0.6187732, -1.936525, 0.9960784, 1, 0, 1,
-1.005867, 0.8411393, 0.2846152, 0.9921569, 1, 0, 1,
-0.998301, -1.037459, -2.060652, 0.9843137, 1, 0, 1,
-0.9969113, 1.478974, -0.4921527, 0.9803922, 1, 0, 1,
-0.9897422, -0.2635078, -2.807513, 0.972549, 1, 0, 1,
-0.9795197, 0.7855332, -0.2231693, 0.9686275, 1, 0, 1,
-0.9760031, 0.1703724, -1.796235, 0.9607843, 1, 0, 1,
-0.9721785, 0.06864231, -1.988418, 0.9568627, 1, 0, 1,
-0.971841, -1.28119, -3.626489, 0.9490196, 1, 0, 1,
-0.969582, -0.1070351, -2.195971, 0.945098, 1, 0, 1,
-0.9691194, -2.010372, -1.695779, 0.9372549, 1, 0, 1,
-0.9629272, 0.3093357, -1.718563, 0.9333333, 1, 0, 1,
-0.9623581, -0.004766334, -2.320916, 0.9254902, 1, 0, 1,
-0.9621207, -2.345104, -2.119016, 0.9215686, 1, 0, 1,
-0.9589012, -0.4294967, -2.787008, 0.9137255, 1, 0, 1,
-0.9583252, -0.3111158, -1.514138, 0.9098039, 1, 0, 1,
-0.9567274, -0.09353682, -0.6267084, 0.9019608, 1, 0, 1,
-0.9560902, 0.9446123, -1.997257, 0.8941177, 1, 0, 1,
-0.9493146, -0.7462965, -3.379121, 0.8901961, 1, 0, 1,
-0.9488934, 0.01484223, -2.541192, 0.8823529, 1, 0, 1,
-0.9377124, 1.133842, -1.040835, 0.8784314, 1, 0, 1,
-0.9343954, -0.6288838, -1.730511, 0.8705882, 1, 0, 1,
-0.9253778, 0.1803244, -1.818205, 0.8666667, 1, 0, 1,
-0.9145061, -0.2573665, -2.147725, 0.8588235, 1, 0, 1,
-0.911457, -0.2955928, -2.506556, 0.854902, 1, 0, 1,
-0.9100546, -0.880695, -0.9163129, 0.8470588, 1, 0, 1,
-0.9084095, 1.993108, 0.5050937, 0.8431373, 1, 0, 1,
-0.9081336, 1.405684, -1.132211, 0.8352941, 1, 0, 1,
-0.9078263, -0.8438712, -1.494959, 0.8313726, 1, 0, 1,
-0.9029779, -0.5462971, -2.234716, 0.8235294, 1, 0, 1,
-0.8936319, 1.025991, -1.890363, 0.8196079, 1, 0, 1,
-0.8906835, -0.1403267, -3.878155, 0.8117647, 1, 0, 1,
-0.8904444, -0.3696147, -1.511379, 0.8078431, 1, 0, 1,
-0.8890651, -0.278125, -1.328232, 0.8, 1, 0, 1,
-0.8883138, -0.1665629, -1.300685, 0.7921569, 1, 0, 1,
-0.8845512, -1.634448, -1.162113, 0.7882353, 1, 0, 1,
-0.8820391, -1.324926, -2.356813, 0.7803922, 1, 0, 1,
-0.8815179, -0.2404016, -0.78424, 0.7764706, 1, 0, 1,
-0.8676013, 0.2060526, -1.06316, 0.7686275, 1, 0, 1,
-0.8649182, 0.2564743, -0.6453575, 0.7647059, 1, 0, 1,
-0.8634018, 2.10125, -2.006396, 0.7568628, 1, 0, 1,
-0.8554578, 0.3946348, -0.01911723, 0.7529412, 1, 0, 1,
-0.8437367, 1.453793, -0.3037363, 0.7450981, 1, 0, 1,
-0.8417162, -0.1426934, -1.764596, 0.7411765, 1, 0, 1,
-0.8413422, -0.2564928, -1.700687, 0.7333333, 1, 0, 1,
-0.8408048, 0.09672792, -2.10161, 0.7294118, 1, 0, 1,
-0.8395425, -0.9486783, -1.455803, 0.7215686, 1, 0, 1,
-0.8357811, 0.9527838, 0.8108408, 0.7176471, 1, 0, 1,
-0.8309001, -1.434017, -2.196772, 0.7098039, 1, 0, 1,
-0.8293971, -1.265208, -2.185798, 0.7058824, 1, 0, 1,
-0.8279902, 0.3549378, -1.508716, 0.6980392, 1, 0, 1,
-0.8198383, -0.1146402, -1.39769, 0.6901961, 1, 0, 1,
-0.8187274, 0.4993291, -1.13451, 0.6862745, 1, 0, 1,
-0.8180467, 0.06726431, -0.6909659, 0.6784314, 1, 0, 1,
-0.815088, -0.8647125, -1.374566, 0.6745098, 1, 0, 1,
-0.8101221, 0.1138581, -3.901995, 0.6666667, 1, 0, 1,
-0.8097945, -0.5663621, -2.965732, 0.6627451, 1, 0, 1,
-0.8094123, -0.8210185, -3.108507, 0.654902, 1, 0, 1,
-0.8089891, -0.1288986, -0.9117656, 0.6509804, 1, 0, 1,
-0.8038088, 0.05012071, -1.839473, 0.6431373, 1, 0, 1,
-0.8002771, 1.103201, -0.9492709, 0.6392157, 1, 0, 1,
-0.7994745, -0.5861818, -2.720941, 0.6313726, 1, 0, 1,
-0.7979982, -1.161524, -2.714085, 0.627451, 1, 0, 1,
-0.795121, -2.338164, -2.519745, 0.6196079, 1, 0, 1,
-0.7896016, -0.06623019, -0.5429258, 0.6156863, 1, 0, 1,
-0.7879336, -1.89404, -3.851741, 0.6078432, 1, 0, 1,
-0.7871827, 0.07706835, -2.81798, 0.6039216, 1, 0, 1,
-0.787055, -0.2799563, -2.840326, 0.5960785, 1, 0, 1,
-0.7866886, 0.9384518, -2.039633, 0.5882353, 1, 0, 1,
-0.786144, -0.1970688, -2.301743, 0.5843138, 1, 0, 1,
-0.7809621, -1.208652, -1.758312, 0.5764706, 1, 0, 1,
-0.7804159, 0.2724267, -0.5952448, 0.572549, 1, 0, 1,
-0.778604, -1.061645, -3.628348, 0.5647059, 1, 0, 1,
-0.7687533, -1.172544, -3.564724, 0.5607843, 1, 0, 1,
-0.7664829, 0.4433296, -2.272704, 0.5529412, 1, 0, 1,
-0.7612275, 0.9606535, -1.803041, 0.5490196, 1, 0, 1,
-0.7386852, 0.1108327, -0.2884409, 0.5411765, 1, 0, 1,
-0.737023, -0.02545996, -0.1075959, 0.5372549, 1, 0, 1,
-0.7342233, -1.871575, -4.26453, 0.5294118, 1, 0, 1,
-0.7301391, 1.388355, -1.140452, 0.5254902, 1, 0, 1,
-0.7288157, 1.33043, -1.33282, 0.5176471, 1, 0, 1,
-0.7272996, 2.656583, -0.3497081, 0.5137255, 1, 0, 1,
-0.7243584, -0.187095, -0.7340983, 0.5058824, 1, 0, 1,
-0.7142881, 0.2130282, -0.8874969, 0.5019608, 1, 0, 1,
-0.7128972, 0.6648561, -0.3670924, 0.4941176, 1, 0, 1,
-0.7126747, -0.4901095, -0.5077851, 0.4862745, 1, 0, 1,
-0.7085119, -0.7770523, -1.918351, 0.4823529, 1, 0, 1,
-0.7067635, 0.1388782, -2.38687, 0.4745098, 1, 0, 1,
-0.7040977, -0.4659584, -2.182389, 0.4705882, 1, 0, 1,
-0.7039464, 0.2176623, -1.487296, 0.4627451, 1, 0, 1,
-0.6968057, 0.7863652, -2.384105, 0.4588235, 1, 0, 1,
-0.6957127, 1.190758, 0.6847632, 0.4509804, 1, 0, 1,
-0.6919532, -0.2128814, -0.2259793, 0.4470588, 1, 0, 1,
-0.6896558, 1.573091, 0.6618483, 0.4392157, 1, 0, 1,
-0.6886992, 1.216333, -1.587444, 0.4352941, 1, 0, 1,
-0.6869004, -1.449084, -0.7178067, 0.427451, 1, 0, 1,
-0.6863077, -0.6880065, -1.147162, 0.4235294, 1, 0, 1,
-0.6845105, -0.7161632, -3.106009, 0.4156863, 1, 0, 1,
-0.6808983, -1.030548, -2.623953, 0.4117647, 1, 0, 1,
-0.6766262, 0.5574589, -0.8578574, 0.4039216, 1, 0, 1,
-0.6743392, 0.9725356, 0.769313, 0.3960784, 1, 0, 1,
-0.6690837, -0.8099343, -2.216051, 0.3921569, 1, 0, 1,
-0.6625417, 0.0670855, 0.1100801, 0.3843137, 1, 0, 1,
-0.6603068, -0.7110162, -3.507252, 0.3803922, 1, 0, 1,
-0.6532291, 0.04212379, -0.9468358, 0.372549, 1, 0, 1,
-0.6507779, 1.213033, -1.124655, 0.3686275, 1, 0, 1,
-0.6499664, 1.965222, -1.209196, 0.3607843, 1, 0, 1,
-0.6473528, -0.4414242, -2.490204, 0.3568628, 1, 0, 1,
-0.6381105, 1.466391, -1.272304, 0.3490196, 1, 0, 1,
-0.6348581, 1.764097, -1.355402, 0.345098, 1, 0, 1,
-0.6348371, 0.5119543, -1.339206, 0.3372549, 1, 0, 1,
-0.6309716, -0.5166728, -1.605032, 0.3333333, 1, 0, 1,
-0.6272104, -0.2753764, -1.027789, 0.3254902, 1, 0, 1,
-0.6256546, 0.7842392, -2.38941, 0.3215686, 1, 0, 1,
-0.6232774, 0.5796772, 0.4481118, 0.3137255, 1, 0, 1,
-0.6212675, -1.259679, -3.624258, 0.3098039, 1, 0, 1,
-0.6190664, -0.8009358, -2.43786, 0.3019608, 1, 0, 1,
-0.6151197, 0.8068992, -0.04710036, 0.2941177, 1, 0, 1,
-0.6099302, 0.9796124, 0.7093657, 0.2901961, 1, 0, 1,
-0.6098658, 0.1598578, -0.9939679, 0.282353, 1, 0, 1,
-0.6076344, 0.8102313, 0.1954102, 0.2784314, 1, 0, 1,
-0.6061525, 1.202865, -0.05997903, 0.2705882, 1, 0, 1,
-0.6054341, -0.8579797, -2.153375, 0.2666667, 1, 0, 1,
-0.6052392, -0.8506592, -1.047356, 0.2588235, 1, 0, 1,
-0.6051288, 0.4720363, -0.7706298, 0.254902, 1, 0, 1,
-0.6046522, 0.6966751, 0.6201414, 0.2470588, 1, 0, 1,
-0.602097, 1.489993, -1.15123, 0.2431373, 1, 0, 1,
-0.5991387, 0.6447093, -1.143765, 0.2352941, 1, 0, 1,
-0.5986966, -0.9814076, -1.999995, 0.2313726, 1, 0, 1,
-0.5912419, 1.090392, -1.447369, 0.2235294, 1, 0, 1,
-0.5737649, 0.1807301, 0.01949231, 0.2196078, 1, 0, 1,
-0.5709965, 1.344601, -0.6293902, 0.2117647, 1, 0, 1,
-0.5655508, 0.1517161, -1.583125, 0.2078431, 1, 0, 1,
-0.5644541, -2.518494, -4.763972, 0.2, 1, 0, 1,
-0.5606764, 1.692943, 0.08005556, 0.1921569, 1, 0, 1,
-0.560505, 0.2284207, -3.155528, 0.1882353, 1, 0, 1,
-0.555382, 0.9850252, 0.4534264, 0.1803922, 1, 0, 1,
-0.554301, 0.6868865, -1.791829, 0.1764706, 1, 0, 1,
-0.5527726, -0.3148688, -0.9359739, 0.1686275, 1, 0, 1,
-0.5491241, -1.102263, -1.775636, 0.1647059, 1, 0, 1,
-0.5486807, 0.7194343, -0.4476728, 0.1568628, 1, 0, 1,
-0.5483201, 1.460438, -0.9897784, 0.1529412, 1, 0, 1,
-0.5470405, 1.398334, -0.3694697, 0.145098, 1, 0, 1,
-0.5450283, 0.8192454, -0.9053041, 0.1411765, 1, 0, 1,
-0.5403675, 1.728351, 0.2440699, 0.1333333, 1, 0, 1,
-0.5362731, -1.25283, -2.725786, 0.1294118, 1, 0, 1,
-0.5353107, 0.4183297, -0.769947, 0.1215686, 1, 0, 1,
-0.5232814, -0.5533423, -2.740142, 0.1176471, 1, 0, 1,
-0.5223458, 0.255915, -0.1403056, 0.1098039, 1, 0, 1,
-0.517944, -1.717043, -3.646377, 0.1058824, 1, 0, 1,
-0.5173015, -0.02373903, -2.623252, 0.09803922, 1, 0, 1,
-0.5163669, -1.442077, -1.072286, 0.09019608, 1, 0, 1,
-0.5162891, 0.7114885, -0.5610096, 0.08627451, 1, 0, 1,
-0.5162005, -0.1298479, -2.353559, 0.07843138, 1, 0, 1,
-0.5161521, -0.4875057, -2.900423, 0.07450981, 1, 0, 1,
-0.5154213, 1.491482, -1.166828, 0.06666667, 1, 0, 1,
-0.5149072, -1.502801, -1.506113, 0.0627451, 1, 0, 1,
-0.5119985, -1.009665, -2.893146, 0.05490196, 1, 0, 1,
-0.5033305, 1.63697, -0.1334397, 0.05098039, 1, 0, 1,
-0.4988662, 0.3929871, 0.4093719, 0.04313726, 1, 0, 1,
-0.4986023, -0.1578621, -3.747708, 0.03921569, 1, 0, 1,
-0.4901895, -1.651462, -2.307636, 0.03137255, 1, 0, 1,
-0.4874669, -1.56475, -3.024188, 0.02745098, 1, 0, 1,
-0.4859253, 0.770156, -1.542213, 0.01960784, 1, 0, 1,
-0.4851628, -0.4650531, -1.09126, 0.01568628, 1, 0, 1,
-0.4831814, -0.171793, -1.627153, 0.007843138, 1, 0, 1,
-0.4781664, 1.223597, 0.1159409, 0.003921569, 1, 0, 1,
-0.4778971, -0.3077006, -2.1889, 0, 1, 0.003921569, 1,
-0.4775454, 0.4621392, 0.4983697, 0, 1, 0.01176471, 1,
-0.4733134, -0.4250849, -2.320541, 0, 1, 0.01568628, 1,
-0.472078, -2.423514, -0.8542599, 0, 1, 0.02352941, 1,
-0.4701799, -0.6615879, -1.370289, 0, 1, 0.02745098, 1,
-0.4684361, -1.124237, -2.891737, 0, 1, 0.03529412, 1,
-0.4667919, -0.05904555, -0.8702676, 0, 1, 0.03921569, 1,
-0.4654839, -0.5333437, -4.034514, 0, 1, 0.04705882, 1,
-0.4630277, 0.4635237, -1.994448, 0, 1, 0.05098039, 1,
-0.4603447, 0.3040636, -1.496932, 0, 1, 0.05882353, 1,
-0.4579309, 0.1745081, -1.885612, 0, 1, 0.0627451, 1,
-0.4516106, 0.84642, -3.447131, 0, 1, 0.07058824, 1,
-0.4494001, 1.543112, -0.8525389, 0, 1, 0.07450981, 1,
-0.4441903, 0.0375561, -3.516272, 0, 1, 0.08235294, 1,
-0.4413032, 1.185666, -0.6460351, 0, 1, 0.08627451, 1,
-0.4392907, 1.410878, -0.1484963, 0, 1, 0.09411765, 1,
-0.4368697, -0.3189141, -1.730756, 0, 1, 0.1019608, 1,
-0.4359532, -0.3111185, -3.03721, 0, 1, 0.1058824, 1,
-0.4340608, 0.5811602, 0.5642938, 0, 1, 0.1137255, 1,
-0.4340279, -0.5220485, -1.248281, 0, 1, 0.1176471, 1,
-0.4322925, -0.3821609, -2.337229, 0, 1, 0.1254902, 1,
-0.4290377, -0.5814298, -2.056647, 0, 1, 0.1294118, 1,
-0.4251023, -0.7759946, -3.72535, 0, 1, 0.1372549, 1,
-0.4243886, 0.7999313, -0.8875384, 0, 1, 0.1411765, 1,
-0.4225637, 0.8391324, -0.135155, 0, 1, 0.1490196, 1,
-0.4184415, 1.828123, -0.6278023, 0, 1, 0.1529412, 1,
-0.4174657, -0.5897584, 0.02054761, 0, 1, 0.1607843, 1,
-0.4167755, -0.6929267, -2.608112, 0, 1, 0.1647059, 1,
-0.4160262, 0.7163818, 2.227102, 0, 1, 0.172549, 1,
-0.4116803, -1.352525, -3.277633, 0, 1, 0.1764706, 1,
-0.4094934, -0.7266906, -3.547736, 0, 1, 0.1843137, 1,
-0.4072336, 0.2982689, -0.4110833, 0, 1, 0.1882353, 1,
-0.4029992, 0.1589106, -0.524093, 0, 1, 0.1960784, 1,
-0.4026725, 0.3315121, 0.3644538, 0, 1, 0.2039216, 1,
-0.4017082, -0.04939337, -2.665876, 0, 1, 0.2078431, 1,
-0.4004427, -0.5224004, -3.076025, 0, 1, 0.2156863, 1,
-0.3972776, -1.1716, -3.557391, 0, 1, 0.2196078, 1,
-0.3962526, 1.002105, -2.300455, 0, 1, 0.227451, 1,
-0.3950043, 0.6127752, 0.05240944, 0, 1, 0.2313726, 1,
-0.3942827, -0.02544354, -0.6980135, 0, 1, 0.2392157, 1,
-0.3923843, -1.45805, -2.072773, 0, 1, 0.2431373, 1,
-0.3885971, 1.195936, -0.3199247, 0, 1, 0.2509804, 1,
-0.3881833, 1.089046, 1.908658, 0, 1, 0.254902, 1,
-0.3877428, 0.05991457, -2.001146, 0, 1, 0.2627451, 1,
-0.3874065, 0.8143885, 1.497535, 0, 1, 0.2666667, 1,
-0.3807141, 1.963899, -1.065617, 0, 1, 0.2745098, 1,
-0.3729615, 1.009226, -1.607356, 0, 1, 0.2784314, 1,
-0.372184, 0.4064178, 0.07347625, 0, 1, 0.2862745, 1,
-0.3694448, -0.008908097, -2.708307, 0, 1, 0.2901961, 1,
-0.3661036, 0.1283755, -2.091425, 0, 1, 0.2980392, 1,
-0.3640423, 1.169867, 0.22483, 0, 1, 0.3058824, 1,
-0.3639843, -2.16978, -3.546932, 0, 1, 0.3098039, 1,
-0.3614548, 1.760733, 0.5993275, 0, 1, 0.3176471, 1,
-0.3601305, -0.5765054, -2.077022, 0, 1, 0.3215686, 1,
-0.3588098, -0.08598754, -2.028251, 0, 1, 0.3294118, 1,
-0.3533288, 0.2912514, 0.3959008, 0, 1, 0.3333333, 1,
-0.3527634, 0.6025103, -1.956631, 0, 1, 0.3411765, 1,
-0.3511104, 0.4103585, -0.8190365, 0, 1, 0.345098, 1,
-0.3508916, 1.032312, 0.8255333, 0, 1, 0.3529412, 1,
-0.3441315, -0.1207618, -0.5210503, 0, 1, 0.3568628, 1,
-0.3434051, -1.022783, -2.80501, 0, 1, 0.3647059, 1,
-0.3385429, -1.59861, -2.717309, 0, 1, 0.3686275, 1,
-0.3372806, -1.451407, -2.134364, 0, 1, 0.3764706, 1,
-0.3369848, 0.6995296, -0.01916593, 0, 1, 0.3803922, 1,
-0.3326764, 1.362379, -2.408875, 0, 1, 0.3882353, 1,
-0.3317197, 1.132748, -1.128763, 0, 1, 0.3921569, 1,
-0.3314024, 1.23161, -0.81194, 0, 1, 0.4, 1,
-0.3282088, -0.9707235, -2.658843, 0, 1, 0.4078431, 1,
-0.328005, -0.617, -2.990227, 0, 1, 0.4117647, 1,
-0.3264287, -0.8625087, -3.215258, 0, 1, 0.4196078, 1,
-0.3259262, -0.9841822, -2.270678, 0, 1, 0.4235294, 1,
-0.3207339, 0.2700797, 0.5407278, 0, 1, 0.4313726, 1,
-0.3205485, -0.3018414, -1.449417, 0, 1, 0.4352941, 1,
-0.3188343, 0.97888, -0.9201828, 0, 1, 0.4431373, 1,
-0.3133371, -0.8719988, -0.7161717, 0, 1, 0.4470588, 1,
-0.3105131, -0.8611208, -1.724903, 0, 1, 0.454902, 1,
-0.3102463, -0.4778447, -2.637453, 0, 1, 0.4588235, 1,
-0.3094521, -2.410354, -2.432135, 0, 1, 0.4666667, 1,
-0.3045918, -1.848318, -4.097396, 0, 1, 0.4705882, 1,
-0.3024661, -0.069158, -1.76195, 0, 1, 0.4784314, 1,
-0.3015999, 0.9530184, 1.063828, 0, 1, 0.4823529, 1,
-0.3001677, 0.7695059, -0.9225864, 0, 1, 0.4901961, 1,
-0.2978688, -0.1726104, -2.116355, 0, 1, 0.4941176, 1,
-0.2970555, 1.331222, -0.2339448, 0, 1, 0.5019608, 1,
-0.2955374, -1.528256, -4.158741, 0, 1, 0.509804, 1,
-0.2887537, -0.002453849, -0.9555594, 0, 1, 0.5137255, 1,
-0.2856319, -0.08492167, -2.542711, 0, 1, 0.5215687, 1,
-0.2741972, 1.593983, -0.8808609, 0, 1, 0.5254902, 1,
-0.2735982, -0.9896658, -3.994812, 0, 1, 0.5333334, 1,
-0.2731417, 1.489317, -0.6892498, 0, 1, 0.5372549, 1,
-0.2724595, 0.5386761, -0.9777843, 0, 1, 0.5450981, 1,
-0.270421, -1.332477, -3.384219, 0, 1, 0.5490196, 1,
-0.2693911, 0.3965912, 0.8949301, 0, 1, 0.5568628, 1,
-0.2681361, 1.087242, -0.01197424, 0, 1, 0.5607843, 1,
-0.2584449, 0.2644981, -0.3074185, 0, 1, 0.5686275, 1,
-0.2566082, -0.6484593, -4.106086, 0, 1, 0.572549, 1,
-0.2561024, -0.4734356, -3.305415, 0, 1, 0.5803922, 1,
-0.2560173, 1.742365, -0.9267732, 0, 1, 0.5843138, 1,
-0.2542614, 0.2235231, -0.5613339, 0, 1, 0.5921569, 1,
-0.2461814, -0.4385357, -3.24749, 0, 1, 0.5960785, 1,
-0.2441421, 0.5422748, -1.2511, 0, 1, 0.6039216, 1,
-0.2437109, -1.917089, -3.357366, 0, 1, 0.6117647, 1,
-0.2417301, -0.1271315, -2.696585, 0, 1, 0.6156863, 1,
-0.2335133, -0.1700411, -2.075224, 0, 1, 0.6235294, 1,
-0.2280763, 0.2087239, -1.202491, 0, 1, 0.627451, 1,
-0.2215715, -0.489507, -2.924101, 0, 1, 0.6352941, 1,
-0.2035275, 1.657059, -0.007606968, 0, 1, 0.6392157, 1,
-0.2006547, -0.3439422, -1.642224, 0, 1, 0.6470588, 1,
-0.2003026, -0.1284226, -1.687618, 0, 1, 0.6509804, 1,
-0.1991218, -0.2377605, -0.4179718, 0, 1, 0.6588235, 1,
-0.1975116, -0.4178014, -2.467061, 0, 1, 0.6627451, 1,
-0.1954982, -0.9224764, -3.830811, 0, 1, 0.6705883, 1,
-0.1902038, -0.4945548, -4.795912, 0, 1, 0.6745098, 1,
-0.188784, -0.5134792, -3.614986, 0, 1, 0.682353, 1,
-0.1874014, -0.2646326, -4.37218, 0, 1, 0.6862745, 1,
-0.1872798, -0.0308918, -1.312947, 0, 1, 0.6941177, 1,
-0.1854338, -0.7726388, -0.09347535, 0, 1, 0.7019608, 1,
-0.1853788, -1.438455, -2.790964, 0, 1, 0.7058824, 1,
-0.183827, 1.070004, -0.3231305, 0, 1, 0.7137255, 1,
-0.1802926, 1.302405, 1.937378, 0, 1, 0.7176471, 1,
-0.1718158, -0.6087863, -2.297991, 0, 1, 0.7254902, 1,
-0.1703249, 1.467228, -1.383231, 0, 1, 0.7294118, 1,
-0.168373, 0.977834, -1.318422, 0, 1, 0.7372549, 1,
-0.1664046, 0.2656083, -0.8690073, 0, 1, 0.7411765, 1,
-0.165174, 1.413485, 0.05489621, 0, 1, 0.7490196, 1,
-0.1620783, 0.1190842, -2.178102, 0, 1, 0.7529412, 1,
-0.1617227, 0.2655404, -1.740926, 0, 1, 0.7607843, 1,
-0.154484, 1.325587, -0.8282908, 0, 1, 0.7647059, 1,
-0.1503112, 1.485393, 1.163572, 0, 1, 0.772549, 1,
-0.1462329, -0.8975567, -1.261053, 0, 1, 0.7764706, 1,
-0.146161, -2.145747, -3.236369, 0, 1, 0.7843137, 1,
-0.1431753, 1.386962, 0.6021388, 0, 1, 0.7882353, 1,
-0.1420302, 1.269942, -0.1327585, 0, 1, 0.7960784, 1,
-0.1356759, 2.626464, 0.6637343, 0, 1, 0.8039216, 1,
-0.1329735, 1.251851, -0.1243004, 0, 1, 0.8078431, 1,
-0.1326391, 1.177076, -0.2340672, 0, 1, 0.8156863, 1,
-0.1299775, 1.342097, 0.7140802, 0, 1, 0.8196079, 1,
-0.1298832, 1.100216, -0.06570009, 0, 1, 0.827451, 1,
-0.1288396, 0.2059763, -0.299417, 0, 1, 0.8313726, 1,
-0.1208662, -0.3594857, -1.933779, 0, 1, 0.8392157, 1,
-0.1180597, -0.08674276, -1.866834, 0, 1, 0.8431373, 1,
-0.1166364, 0.7202471, 0.9566406, 0, 1, 0.8509804, 1,
-0.1084271, 0.7883359, -2.052715, 0, 1, 0.854902, 1,
-0.1076586, 1.074533, 0.8499144, 0, 1, 0.8627451, 1,
-0.1057125, -0.7539666, -2.516301, 0, 1, 0.8666667, 1,
-0.104424, -1.366292, -3.734294, 0, 1, 0.8745098, 1,
-0.09914713, 0.6876515, 1.204982, 0, 1, 0.8784314, 1,
-0.09843036, -1.430338, -2.400353, 0, 1, 0.8862745, 1,
-0.09803522, 0.6037629, 0.6011771, 0, 1, 0.8901961, 1,
-0.09799484, -0.2069232, -2.397622, 0, 1, 0.8980392, 1,
-0.09694959, 0.32774, -1.163082, 0, 1, 0.9058824, 1,
-0.09639177, -1.676198, -3.487534, 0, 1, 0.9098039, 1,
-0.09521083, 0.9354036, -0.6015602, 0, 1, 0.9176471, 1,
-0.08842287, 0.04231993, -0.4395748, 0, 1, 0.9215686, 1,
-0.08803848, -0.7925286, -4.349392, 0, 1, 0.9294118, 1,
-0.08471561, -2.382721, -2.318977, 0, 1, 0.9333333, 1,
-0.08457388, 0.6190636, 0.7521981, 0, 1, 0.9411765, 1,
-0.08339242, 0.1106677, -2.243176, 0, 1, 0.945098, 1,
-0.08045944, -1.104367, -1.537459, 0, 1, 0.9529412, 1,
-0.08037857, 0.6551813, -1.086034, 0, 1, 0.9568627, 1,
-0.08034278, -0.2043575, -3.090757, 0, 1, 0.9647059, 1,
-0.07289586, -1.255319, -1.807399, 0, 1, 0.9686275, 1,
-0.06996586, -0.5853387, -3.812587, 0, 1, 0.9764706, 1,
-0.06911464, -1.821249, -4.431354, 0, 1, 0.9803922, 1,
-0.06631103, -0.726342, -2.368396, 0, 1, 0.9882353, 1,
-0.0656253, 0.5804738, -2.165954, 0, 1, 0.9921569, 1,
-0.06365272, 1.08497, 0.4106872, 0, 1, 1, 1,
-0.06302883, 0.6109147, 0.497162, 0, 0.9921569, 1, 1,
-0.06221879, -0.7866712, -1.157221, 0, 0.9882353, 1, 1,
-0.05829225, -1.912811, -1.876989, 0, 0.9803922, 1, 1,
-0.05810792, -0.07683407, -2.471027, 0, 0.9764706, 1, 1,
-0.0581068, 0.1601272, -0.6970647, 0, 0.9686275, 1, 1,
-0.05785213, -1.06094, -3.266357, 0, 0.9647059, 1, 1,
-0.05582031, -1.415116, -3.114912, 0, 0.9568627, 1, 1,
-0.05214887, 0.7781972, 1.21677, 0, 0.9529412, 1, 1,
-0.04823937, 0.7438859, 0.08258753, 0, 0.945098, 1, 1,
-0.04688596, -2.816867, -2.713884, 0, 0.9411765, 1, 1,
-0.04040776, -1.244367, -3.837071, 0, 0.9333333, 1, 1,
-0.03801432, -0.5267246, -2.987104, 0, 0.9294118, 1, 1,
-0.03702739, 0.1007999, 0.4860616, 0, 0.9215686, 1, 1,
-0.03483899, -2.40936, -3.660815, 0, 0.9176471, 1, 1,
-0.0339875, -0.2546572, -2.569515, 0, 0.9098039, 1, 1,
-0.03029253, -0.2277251, -2.634297, 0, 0.9058824, 1, 1,
-0.02717843, -1.36595, -3.565455, 0, 0.8980392, 1, 1,
-0.02321391, 1.306068, -1.575398, 0, 0.8901961, 1, 1,
-0.02125955, 1.125964, -0.08106277, 0, 0.8862745, 1, 1,
-0.01780669, -2.885518, -2.450007, 0, 0.8784314, 1, 1,
-0.01510596, -2.61131, -1.1951, 0, 0.8745098, 1, 1,
-0.01427778, 0.1759595, -2.102974, 0, 0.8666667, 1, 1,
-0.01370743, 0.3001519, 0.6008748, 0, 0.8627451, 1, 1,
-0.01309222, 0.09912141, -1.176713, 0, 0.854902, 1, 1,
-0.01132092, 0.7013477, 0.249692, 0, 0.8509804, 1, 1,
-0.007955721, -0.6488831, -2.66507, 0, 0.8431373, 1, 1,
-0.00614194, 1.179149, -0.1932199, 0, 0.8392157, 1, 1,
0.004605968, -0.04955003, 3.10726, 0, 0.8313726, 1, 1,
0.009362979, 1.230581, 1.362826, 0, 0.827451, 1, 1,
0.01289359, -0.5373733, 3.402975, 0, 0.8196079, 1, 1,
0.01291433, 1.185363, 0.9278227, 0, 0.8156863, 1, 1,
0.01376912, 0.2163949, -0.1806276, 0, 0.8078431, 1, 1,
0.01435146, -0.2377014, 1.30184, 0, 0.8039216, 1, 1,
0.01656456, 0.6355787, 0.1620938, 0, 0.7960784, 1, 1,
0.01823284, 0.2693394, 1.875996, 0, 0.7882353, 1, 1,
0.02297976, 0.4770606, 2.186648, 0, 0.7843137, 1, 1,
0.02396092, 0.3163075, -0.6325717, 0, 0.7764706, 1, 1,
0.02675856, 0.6351601, -0.9258493, 0, 0.772549, 1, 1,
0.02690208, -1.54901, 1.110501, 0, 0.7647059, 1, 1,
0.02770891, 0.06771202, 1.769649, 0, 0.7607843, 1, 1,
0.03257808, 0.95489, 1.895586, 0, 0.7529412, 1, 1,
0.03260568, 0.4279042, 1.216945, 0, 0.7490196, 1, 1,
0.03741131, 1.152032, 1.197953, 0, 0.7411765, 1, 1,
0.03763165, 0.08421276, 1.018402, 0, 0.7372549, 1, 1,
0.03882046, -1.887331, 3.600332, 0, 0.7294118, 1, 1,
0.0434145, 0.9770151, -1.729774, 0, 0.7254902, 1, 1,
0.04466277, 0.8372763, 1.392091, 0, 0.7176471, 1, 1,
0.04494286, 0.2533641, -0.4366734, 0, 0.7137255, 1, 1,
0.05252122, 1.352287, 0.1462042, 0, 0.7058824, 1, 1,
0.05486157, 0.8448966, -0.8884495, 0, 0.6980392, 1, 1,
0.05740341, 0.7234342, 0.9855071, 0, 0.6941177, 1, 1,
0.05788216, -0.6242052, 2.405839, 0, 0.6862745, 1, 1,
0.05863471, -0.6427186, 3.151935, 0, 0.682353, 1, 1,
0.05907179, -0.1628213, 1.659936, 0, 0.6745098, 1, 1,
0.06065685, 2.069027, 0.3408969, 0, 0.6705883, 1, 1,
0.06227864, -0.5303668, 2.818162, 0, 0.6627451, 1, 1,
0.06767282, -0.7770295, 2.852339, 0, 0.6588235, 1, 1,
0.06773479, -0.5567213, 2.733764, 0, 0.6509804, 1, 1,
0.06836487, -0.1283653, 1.115599, 0, 0.6470588, 1, 1,
0.06920813, -1.856626, 1.731727, 0, 0.6392157, 1, 1,
0.07123683, 0.07156628, 1.618605, 0, 0.6352941, 1, 1,
0.07188015, -1.053322, 2.831599, 0, 0.627451, 1, 1,
0.07271486, -0.5672759, 3.510219, 0, 0.6235294, 1, 1,
0.07568898, 0.340448, -0.6750606, 0, 0.6156863, 1, 1,
0.07805372, -0.233265, 2.749306, 0, 0.6117647, 1, 1,
0.07981498, -0.1237256, 3.890991, 0, 0.6039216, 1, 1,
0.0832087, -1.575995, 2.282098, 0, 0.5960785, 1, 1,
0.08820503, -2.345644, 1.237678, 0, 0.5921569, 1, 1,
0.09231818, 0.8944011, 1.165065, 0, 0.5843138, 1, 1,
0.09421326, 0.0279775, 2.39103, 0, 0.5803922, 1, 1,
0.09541394, 0.8936322, 1.288334, 0, 0.572549, 1, 1,
0.09721738, 2.356035, -0.7218543, 0, 0.5686275, 1, 1,
0.09816097, 0.5422928, -0.432895, 0, 0.5607843, 1, 1,
0.1029624, 1.155379, -0.8882583, 0, 0.5568628, 1, 1,
0.1077433, -0.4609558, 3.449082, 0, 0.5490196, 1, 1,
0.1091052, 0.6226722, -1.493203, 0, 0.5450981, 1, 1,
0.1092768, -0.524184, 4.065622, 0, 0.5372549, 1, 1,
0.1131281, -0.9761164, 1.903869, 0, 0.5333334, 1, 1,
0.1164457, 0.6356884, 0.1484022, 0, 0.5254902, 1, 1,
0.1171669, 1.939001, 0.3493928, 0, 0.5215687, 1, 1,
0.1235834, -1.333851, 2.457784, 0, 0.5137255, 1, 1,
0.1240959, 1.043437, -0.3556526, 0, 0.509804, 1, 1,
0.1249784, 0.1501856, 0.7696468, 0, 0.5019608, 1, 1,
0.1271466, -0.1174535, 1.169465, 0, 0.4941176, 1, 1,
0.1311851, -0.09159669, 3.365027, 0, 0.4901961, 1, 1,
0.1330387, -0.2008569, 3.174068, 0, 0.4823529, 1, 1,
0.1349266, 0.3486042, 1.313259, 0, 0.4784314, 1, 1,
0.1398965, -0.9535558, 3.900042, 0, 0.4705882, 1, 1,
0.147563, -0.8384043, 4.445311, 0, 0.4666667, 1, 1,
0.1497782, -1.943174, 0.6140228, 0, 0.4588235, 1, 1,
0.1553784, -0.5216747, 3.777343, 0, 0.454902, 1, 1,
0.1567447, 1.324736, 1.03489, 0, 0.4470588, 1, 1,
0.158793, 0.2169514, 0.6762867, 0, 0.4431373, 1, 1,
0.1597524, 0.1139414, 1.628886, 0, 0.4352941, 1, 1,
0.1669648, -0.02376237, 0.7703129, 0, 0.4313726, 1, 1,
0.1693203, -0.5080231, 2.614006, 0, 0.4235294, 1, 1,
0.1735254, -0.6140091, 2.867677, 0, 0.4196078, 1, 1,
0.1762759, -0.9015416, 1.884782, 0, 0.4117647, 1, 1,
0.1768826, 0.2243428, -0.4442306, 0, 0.4078431, 1, 1,
0.1789243, 2.663074, -0.2542465, 0, 0.4, 1, 1,
0.1835735, 0.468613, 0.4788803, 0, 0.3921569, 1, 1,
0.1838565, 0.1151915, 2.223169, 0, 0.3882353, 1, 1,
0.1850539, 0.7183152, 1.608597, 0, 0.3803922, 1, 1,
0.1892019, -0.9805807, 1.222603, 0, 0.3764706, 1, 1,
0.1920441, -1.311693, 3.063628, 0, 0.3686275, 1, 1,
0.1921319, 1.021408, 0.152649, 0, 0.3647059, 1, 1,
0.1931976, -0.5206372, 2.586422, 0, 0.3568628, 1, 1,
0.211199, 0.1424102, -1.886141, 0, 0.3529412, 1, 1,
0.2149906, -1.546264, 2.886002, 0, 0.345098, 1, 1,
0.2179769, 0.1427181, 1.902305, 0, 0.3411765, 1, 1,
0.2223689, -0.6276175, 2.63972, 0, 0.3333333, 1, 1,
0.2228447, 0.02228497, 3.105633, 0, 0.3294118, 1, 1,
0.2300345, 0.4537301, 0.6458959, 0, 0.3215686, 1, 1,
0.2347617, 1.500046, -2.346572, 0, 0.3176471, 1, 1,
0.235193, 0.3338172, 1.689354, 0, 0.3098039, 1, 1,
0.2353348, -1.219431, 2.189649, 0, 0.3058824, 1, 1,
0.2393943, -0.9876382, 3.235024, 0, 0.2980392, 1, 1,
0.2439797, 0.9633986, -0.5556627, 0, 0.2901961, 1, 1,
0.2472537, -1.751545, 1.756542, 0, 0.2862745, 1, 1,
0.2474688, -1.7656, 2.760414, 0, 0.2784314, 1, 1,
0.2491089, -1.922856, 4.991873, 0, 0.2745098, 1, 1,
0.251671, -2.264674, 2.856023, 0, 0.2666667, 1, 1,
0.2544899, -1.003632, 2.820674, 0, 0.2627451, 1, 1,
0.2566182, 1.200894, 2.081879, 0, 0.254902, 1, 1,
0.2573188, -0.9228696, 1.259834, 0, 0.2509804, 1, 1,
0.2596074, 2.016751, 0.5864264, 0, 0.2431373, 1, 1,
0.2709955, -0.5393573, 2.606685, 0, 0.2392157, 1, 1,
0.2727565, -1.566283, 4.104365, 0, 0.2313726, 1, 1,
0.2758319, 0.9172089, 0.7156103, 0, 0.227451, 1, 1,
0.2758465, -0.6305508, 1.188589, 0, 0.2196078, 1, 1,
0.2771967, 0.03751121, 1.573857, 0, 0.2156863, 1, 1,
0.2803942, 0.9082409, -0.6709785, 0, 0.2078431, 1, 1,
0.2817738, -1.408669, 4.173087, 0, 0.2039216, 1, 1,
0.2862007, 2.618858, 0.6378224, 0, 0.1960784, 1, 1,
0.288281, 1.012494, -0.1257003, 0, 0.1882353, 1, 1,
0.2886447, 0.01473755, 4.128369, 0, 0.1843137, 1, 1,
0.2920883, -1.348387, 2.274011, 0, 0.1764706, 1, 1,
0.2959038, -0.7840351, 2.870414, 0, 0.172549, 1, 1,
0.302125, -0.1291874, 1.72345, 0, 0.1647059, 1, 1,
0.3064766, -1.170365, 3.713295, 0, 0.1607843, 1, 1,
0.3076448, 0.8067346, 1.455648, 0, 0.1529412, 1, 1,
0.315941, 0.9101067, -1.384046, 0, 0.1490196, 1, 1,
0.325096, 0.3589015, 0.1530467, 0, 0.1411765, 1, 1,
0.3307561, -0.6520317, 3.913685, 0, 0.1372549, 1, 1,
0.3310807, -0.08874444, 2.8785, 0, 0.1294118, 1, 1,
0.3334549, -1.078987, 3.272804, 0, 0.1254902, 1, 1,
0.3335262, -0.1529577, 2.284117, 0, 0.1176471, 1, 1,
0.3393421, -0.4570566, 3.648542, 0, 0.1137255, 1, 1,
0.3403013, -0.5794068, 2.610539, 0, 0.1058824, 1, 1,
0.3489005, -1.588143, 3.188977, 0, 0.09803922, 1, 1,
0.3662328, 1.32122, -0.8289287, 0, 0.09411765, 1, 1,
0.370699, 0.606368, -0.5503294, 0, 0.08627451, 1, 1,
0.3716657, 0.02515811, 2.288081, 0, 0.08235294, 1, 1,
0.3744072, 0.4763217, 1.170545, 0, 0.07450981, 1, 1,
0.3756359, 1.088499, 1.507888, 0, 0.07058824, 1, 1,
0.3771816, -1.03568, 0.5821223, 0, 0.0627451, 1, 1,
0.3801585, -0.628256, 1.202352, 0, 0.05882353, 1, 1,
0.3818186, 0.6791846, 0.1665199, 0, 0.05098039, 1, 1,
0.3824884, -1.646495, 3.933877, 0, 0.04705882, 1, 1,
0.3842047, -0.535023, 2.091025, 0, 0.03921569, 1, 1,
0.3849311, -0.06260427, 1.883392, 0, 0.03529412, 1, 1,
0.3865324, -1.751714, 4.620251, 0, 0.02745098, 1, 1,
0.3903679, 1.188052, -1.055937, 0, 0.02352941, 1, 1,
0.3917393, -0.3501016, 3.359676, 0, 0.01568628, 1, 1,
0.3985581, 1.451622, 1.562553, 0, 0.01176471, 1, 1,
0.4021737, -0.373636, 3.206098, 0, 0.003921569, 1, 1,
0.4021994, -1.24003, 2.797043, 0.003921569, 0, 1, 1,
0.4040565, -0.5432577, 4.757491, 0.007843138, 0, 1, 1,
0.4049001, 0.7542231, 0.669792, 0.01568628, 0, 1, 1,
0.4068685, 2.315157, 2.655877, 0.01960784, 0, 1, 1,
0.4071158, -0.8346322, 4.432469, 0.02745098, 0, 1, 1,
0.407312, -1.572093, 2.535071, 0.03137255, 0, 1, 1,
0.4085813, 1.910219, -0.02907338, 0.03921569, 0, 1, 1,
0.4104836, 2.770483, 0.8994544, 0.04313726, 0, 1, 1,
0.4155999, -1.34781, 3.094616, 0.05098039, 0, 1, 1,
0.4167675, -0.9112964, 3.524665, 0.05490196, 0, 1, 1,
0.4183075, -0.07660744, 1.309031, 0.0627451, 0, 1, 1,
0.4187994, 1.070754, 0.3754197, 0.06666667, 0, 1, 1,
0.421489, 0.5631226, 1.489588, 0.07450981, 0, 1, 1,
0.4228346, -0.8384093, 2.500105, 0.07843138, 0, 1, 1,
0.4247996, -0.1206409, 1.22529, 0.08627451, 0, 1, 1,
0.4270087, -0.2695848, 2.03026, 0.09019608, 0, 1, 1,
0.4292344, -0.3228488, 0.9600755, 0.09803922, 0, 1, 1,
0.4317698, -1.066814, 2.938848, 0.1058824, 0, 1, 1,
0.4324406, 0.3356682, 1.222529, 0.1098039, 0, 1, 1,
0.4333145, -0.5324674, 3.151123, 0.1176471, 0, 1, 1,
0.4359483, 0.1554501, 3.815876, 0.1215686, 0, 1, 1,
0.4369342, -0.7769562, 3.103201, 0.1294118, 0, 1, 1,
0.4381464, -1.374173, 3.208443, 0.1333333, 0, 1, 1,
0.4389893, 0.4479363, -0.8333166, 0.1411765, 0, 1, 1,
0.4448356, -0.43348, 1.7663, 0.145098, 0, 1, 1,
0.4494033, -0.8811675, 3.348917, 0.1529412, 0, 1, 1,
0.4554313, -0.1503299, 3.020926, 0.1568628, 0, 1, 1,
0.4558411, 0.423475, 0.8596023, 0.1647059, 0, 1, 1,
0.4580842, -2.185292, 1.260238, 0.1686275, 0, 1, 1,
0.4605393, -0.6986065, 2.937246, 0.1764706, 0, 1, 1,
0.4718788, -1.92281, 3.680949, 0.1803922, 0, 1, 1,
0.4736296, 0.9693131, -2.223395, 0.1882353, 0, 1, 1,
0.476065, -1.403833, 4.053126, 0.1921569, 0, 1, 1,
0.4783088, -0.8402529, 2.706195, 0.2, 0, 1, 1,
0.4822698, 1.999457, -0.070622, 0.2078431, 0, 1, 1,
0.4844748, 0.9676816, 0.6743043, 0.2117647, 0, 1, 1,
0.4863324, 0.7266385, 0.985394, 0.2196078, 0, 1, 1,
0.4866667, 1.373786, 1.836036, 0.2235294, 0, 1, 1,
0.4874201, -0.2117258, 2.665902, 0.2313726, 0, 1, 1,
0.4877757, -0.9083462, 1.747807, 0.2352941, 0, 1, 1,
0.488497, 0.6287738, -0.2961059, 0.2431373, 0, 1, 1,
0.4956971, 0.7344379, 1.326976, 0.2470588, 0, 1, 1,
0.4990106, 0.1591227, 1.020523, 0.254902, 0, 1, 1,
0.4997917, 1.54788, -0.7714365, 0.2588235, 0, 1, 1,
0.5000166, 2.098579, 0.8950581, 0.2666667, 0, 1, 1,
0.5001107, 0.0708892, 0.8849642, 0.2705882, 0, 1, 1,
0.5022039, -1.235543, 2.315977, 0.2784314, 0, 1, 1,
0.5063335, -2.667168, 1.950096, 0.282353, 0, 1, 1,
0.5127591, -0.8496647, 2.930407, 0.2901961, 0, 1, 1,
0.5138853, 1.961246, 0.691277, 0.2941177, 0, 1, 1,
0.5177132, -0.9278519, 0.9575154, 0.3019608, 0, 1, 1,
0.5187703, -0.9911343, 2.269919, 0.3098039, 0, 1, 1,
0.5249617, -1.467985, 2.621484, 0.3137255, 0, 1, 1,
0.5315939, -0.4656331, 2.888603, 0.3215686, 0, 1, 1,
0.531655, 1.363329, -1.035587, 0.3254902, 0, 1, 1,
0.5348066, -0.07066758, 0.5277458, 0.3333333, 0, 1, 1,
0.5368596, -1.555015, 2.215482, 0.3372549, 0, 1, 1,
0.5471113, -0.8716942, 3.240377, 0.345098, 0, 1, 1,
0.5477862, 0.6488079, 0.6827939, 0.3490196, 0, 1, 1,
0.5507528, -0.2844214, 0.54081, 0.3568628, 0, 1, 1,
0.5527357, 0.6367305, 1.010067, 0.3607843, 0, 1, 1,
0.554171, -0.5746271, 1.713984, 0.3686275, 0, 1, 1,
0.5630091, -1.355739, 2.281045, 0.372549, 0, 1, 1,
0.5634117, -1.01973, 2.63277, 0.3803922, 0, 1, 1,
0.5707765, -1.11294, 2.671162, 0.3843137, 0, 1, 1,
0.5764204, -0.4652923, 1.68939, 0.3921569, 0, 1, 1,
0.5985721, -0.5529285, 3.142796, 0.3960784, 0, 1, 1,
0.6095653, 1.054278, 1.873621, 0.4039216, 0, 1, 1,
0.6113592, -0.1843084, 0.4917605, 0.4117647, 0, 1, 1,
0.6129495, 0.6119846, 1.548374, 0.4156863, 0, 1, 1,
0.6132548, -1.299601, 3.363509, 0.4235294, 0, 1, 1,
0.6133361, 1.463514, -0.2225043, 0.427451, 0, 1, 1,
0.6146202, 0.6658059, -0.375804, 0.4352941, 0, 1, 1,
0.615207, 0.8207267, 0.6122112, 0.4392157, 0, 1, 1,
0.6271836, -1.957129, 2.812746, 0.4470588, 0, 1, 1,
0.6285556, -1.38383, 3.121666, 0.4509804, 0, 1, 1,
0.6288847, 0.9025514, 0.6226732, 0.4588235, 0, 1, 1,
0.630461, 0.529129, -0.4098845, 0.4627451, 0, 1, 1,
0.6330735, -0.9054805, 1.156151, 0.4705882, 0, 1, 1,
0.6356126, -0.47126, 4.317336, 0.4745098, 0, 1, 1,
0.6385496, 1.200174, 0.4285541, 0.4823529, 0, 1, 1,
0.6445975, -0.1702261, 2.429604, 0.4862745, 0, 1, 1,
0.6494966, -0.2067122, 2.457213, 0.4941176, 0, 1, 1,
0.6499002, -0.7087488, 2.652208, 0.5019608, 0, 1, 1,
0.6517875, -0.8938205, 2.773825, 0.5058824, 0, 1, 1,
0.6575459, -0.6410469, 2.258961, 0.5137255, 0, 1, 1,
0.6651856, 0.9126474, 0.5124218, 0.5176471, 0, 1, 1,
0.66544, -0.2858367, 0.3781179, 0.5254902, 0, 1, 1,
0.6702822, -0.201437, 1.30418, 0.5294118, 0, 1, 1,
0.670819, 1.102173, 0.07228603, 0.5372549, 0, 1, 1,
0.6711236, 1.180047, 2.363472, 0.5411765, 0, 1, 1,
0.6733699, 1.248315, 0.07214155, 0.5490196, 0, 1, 1,
0.6795017, 1.641249, -0.01224998, 0.5529412, 0, 1, 1,
0.6840836, 0.3922531, 1.920181, 0.5607843, 0, 1, 1,
0.6884369, -0.2685517, 2.969465, 0.5647059, 0, 1, 1,
0.6887881, -0.8747982, 3.578523, 0.572549, 0, 1, 1,
0.6903856, 0.1336568, 2.994202, 0.5764706, 0, 1, 1,
0.690515, 0.03450379, 1.187104, 0.5843138, 0, 1, 1,
0.6995835, -0.616495, 2.298658, 0.5882353, 0, 1, 1,
0.7010524, -1.107954, 3.555788, 0.5960785, 0, 1, 1,
0.7022257, 0.5356036, -1.202996, 0.6039216, 0, 1, 1,
0.7056444, -0.5324585, 2.916832, 0.6078432, 0, 1, 1,
0.7093241, 1.045031, 2.393084, 0.6156863, 0, 1, 1,
0.7108659, 0.9411935, 0.0722635, 0.6196079, 0, 1, 1,
0.7118538, -0.2962205, 1.498779, 0.627451, 0, 1, 1,
0.7141125, 0.7270392, 1.137491, 0.6313726, 0, 1, 1,
0.7230315, -0.1276398, 1.718932, 0.6392157, 0, 1, 1,
0.7247908, 0.4550054, -0.2129788, 0.6431373, 0, 1, 1,
0.7314678, -0.3132221, 1.311421, 0.6509804, 0, 1, 1,
0.7339272, -0.831547, 2.392927, 0.654902, 0, 1, 1,
0.7384157, 0.4559062, 1.082632, 0.6627451, 0, 1, 1,
0.7392163, -0.5323518, 2.121608, 0.6666667, 0, 1, 1,
0.7394819, -1.324744, 2.6047, 0.6745098, 0, 1, 1,
0.7399062, 0.1152655, 2.24425, 0.6784314, 0, 1, 1,
0.7459129, -1.954255, 3.644783, 0.6862745, 0, 1, 1,
0.749118, 0.6101992, 1.491893, 0.6901961, 0, 1, 1,
0.7519246, -0.4823431, 4.053626, 0.6980392, 0, 1, 1,
0.7596219, 0.2294984, 1.647253, 0.7058824, 0, 1, 1,
0.7596795, 2.327353, -0.2117296, 0.7098039, 0, 1, 1,
0.7602535, -0.07047132, 2.598922, 0.7176471, 0, 1, 1,
0.7604921, -0.4112658, 2.069281, 0.7215686, 0, 1, 1,
0.7614605, 0.4458703, -0.2374014, 0.7294118, 0, 1, 1,
0.7699401, 0.8954332, -0.6199161, 0.7333333, 0, 1, 1,
0.771165, 0.05582576, 0.8470969, 0.7411765, 0, 1, 1,
0.7717018, 0.3263537, 0.2707002, 0.7450981, 0, 1, 1,
0.7784223, 0.8565874, -0.6174476, 0.7529412, 0, 1, 1,
0.7904963, 0.2818596, 1.301586, 0.7568628, 0, 1, 1,
0.8015838, 1.202974, 0.7813564, 0.7647059, 0, 1, 1,
0.8047828, 1.032419, 2.22451, 0.7686275, 0, 1, 1,
0.8083789, 1.459609, 0.1466026, 0.7764706, 0, 1, 1,
0.8105754, 0.6580827, 2.603943, 0.7803922, 0, 1, 1,
0.814023, 0.5186826, 1.724292, 0.7882353, 0, 1, 1,
0.8152267, -0.1510143, 1.808948, 0.7921569, 0, 1, 1,
0.8174415, 0.3697499, -0.8172237, 0.8, 0, 1, 1,
0.8176942, 0.81451, -0.8392537, 0.8078431, 0, 1, 1,
0.8188788, -0.2655419, 1.367579, 0.8117647, 0, 1, 1,
0.8232846, 0.04332327, 0.6573877, 0.8196079, 0, 1, 1,
0.823361, -0.1851293, 2.269301, 0.8235294, 0, 1, 1,
0.8397705, -1.360447, 1.701458, 0.8313726, 0, 1, 1,
0.8458815, 1.149989, 0.7446926, 0.8352941, 0, 1, 1,
0.8491802, 0.5808232, 0.3135027, 0.8431373, 0, 1, 1,
0.8541767, 0.9720455, 2.284451, 0.8470588, 0, 1, 1,
0.8551416, -0.3807426, 0.5552097, 0.854902, 0, 1, 1,
0.8577171, -1.203653, 1.712444, 0.8588235, 0, 1, 1,
0.8584917, 0.8453208, 1.803348, 0.8666667, 0, 1, 1,
0.8592158, 0.01767848, 1.224834, 0.8705882, 0, 1, 1,
0.8622689, -0.8107153, 1.169101, 0.8784314, 0, 1, 1,
0.864657, -1.721618, 2.009114, 0.8823529, 0, 1, 1,
0.8648583, -0.00888559, 2.1031, 0.8901961, 0, 1, 1,
0.8650151, -0.6686162, 2.354542, 0.8941177, 0, 1, 1,
0.8651346, 0.03777822, 1.186914, 0.9019608, 0, 1, 1,
0.870644, 0.7992286, -0.2415055, 0.9098039, 0, 1, 1,
0.8735272, 0.2603427, 2.02144, 0.9137255, 0, 1, 1,
0.87508, 0.3150624, 2.331057, 0.9215686, 0, 1, 1,
0.8768474, -1.32802, 3.62824, 0.9254902, 0, 1, 1,
0.8782126, -1.051405, 1.761058, 0.9333333, 0, 1, 1,
0.8783029, -1.535383, 3.079775, 0.9372549, 0, 1, 1,
0.8929889, 0.4159271, 0.6906047, 0.945098, 0, 1, 1,
0.8966749, -0.0785071, 2.448585, 0.9490196, 0, 1, 1,
0.8987547, 0.05847202, 2.05312, 0.9568627, 0, 1, 1,
0.89984, -1.39691, 1.954146, 0.9607843, 0, 1, 1,
0.9029109, -0.6769384, 0.8497815, 0.9686275, 0, 1, 1,
0.9131471, -0.8891587, 1.339856, 0.972549, 0, 1, 1,
0.9162067, 0.9636915, 0.4307334, 0.9803922, 0, 1, 1,
0.9269453, 1.988323, 1.814308, 0.9843137, 0, 1, 1,
0.9282413, -0.962436, 2.35678, 0.9921569, 0, 1, 1,
0.9283596, -1.029194, 2.197266, 0.9960784, 0, 1, 1,
0.9288605, 0.1506724, 3.052142, 1, 0, 0.9960784, 1,
0.9310447, -0.03327614, 0.6568673, 1, 0, 0.9882353, 1,
0.9320492, 0.6471967, 2.612432, 1, 0, 0.9843137, 1,
0.9349047, -1.997246, 3.075328, 1, 0, 0.9764706, 1,
0.9372496, -0.04102136, 4.290793, 1, 0, 0.972549, 1,
0.943141, 0.1421435, 0.6393657, 1, 0, 0.9647059, 1,
0.9434474, 1.427545, 1.65525, 1, 0, 0.9607843, 1,
0.9486122, -3.241579, 2.392529, 1, 0, 0.9529412, 1,
0.9568999, -1.191833, 2.511943, 1, 0, 0.9490196, 1,
0.958073, -0.6579413, 4.379857, 1, 0, 0.9411765, 1,
0.962311, 0.3685624, -0.1467684, 1, 0, 0.9372549, 1,
0.9681359, -1.131687, 2.799082, 1, 0, 0.9294118, 1,
0.9770503, -0.06174071, 2.18874, 1, 0, 0.9254902, 1,
0.9810464, -0.1573868, 1.007707, 1, 0, 0.9176471, 1,
0.984454, 1.060005, -0.9664494, 1, 0, 0.9137255, 1,
0.9879029, -0.09633546, 2.37869, 1, 0, 0.9058824, 1,
0.996171, -0.7624704, 0.9775055, 1, 0, 0.9019608, 1,
0.9963588, -0.0069962, 3.041541, 1, 0, 0.8941177, 1,
0.9995084, 1.945001, -2.339205, 1, 0, 0.8862745, 1,
1.009862, -1.367449, 2.877556, 1, 0, 0.8823529, 1,
1.010334, -0.3124591, 2.693415, 1, 0, 0.8745098, 1,
1.016814, 0.8185331, 0.5920682, 1, 0, 0.8705882, 1,
1.019568, -1.583662, 3.59551, 1, 0, 0.8627451, 1,
1.02278, 0.1417721, 1.114702, 1, 0, 0.8588235, 1,
1.022805, 0.4654744, 2.926609, 1, 0, 0.8509804, 1,
1.023384, 0.05278537, 1.922468, 1, 0, 0.8470588, 1,
1.027611, 0.03895174, 2.915022, 1, 0, 0.8392157, 1,
1.029411, 0.4921287, 3.241532, 1, 0, 0.8352941, 1,
1.031185, -0.2034533, 1.209537, 1, 0, 0.827451, 1,
1.034165, 0.9226894, 1.74944, 1, 0, 0.8235294, 1,
1.035142, 2.213726, 1.421959, 1, 0, 0.8156863, 1,
1.037716, 1.514116, 0.8117456, 1, 0, 0.8117647, 1,
1.041184, -0.5415903, 3.776665, 1, 0, 0.8039216, 1,
1.041744, -0.5301603, 1.845403, 1, 0, 0.7960784, 1,
1.047905, -0.07874404, -0.4118802, 1, 0, 0.7921569, 1,
1.06231, 0.5071424, 0.4159674, 1, 0, 0.7843137, 1,
1.064509, 1.726217, -0.6534039, 1, 0, 0.7803922, 1,
1.065428, 1.69668, 0.175993, 1, 0, 0.772549, 1,
1.068276, 0.9783931, 0.2945669, 1, 0, 0.7686275, 1,
1.074937, 0.5920891, -0.3208168, 1, 0, 0.7607843, 1,
1.078227, -2.12491, 2.248659, 1, 0, 0.7568628, 1,
1.080479, 0.4167849, 1.265849, 1, 0, 0.7490196, 1,
1.081522, -0.5378118, 3.786113, 1, 0, 0.7450981, 1,
1.089837, -0.4155225, 2.064425, 1, 0, 0.7372549, 1,
1.093476, 0.06693322, -0.6858408, 1, 0, 0.7333333, 1,
1.099707, -1.691737, 1.756929, 1, 0, 0.7254902, 1,
1.104312, 0.2827853, 2.264389, 1, 0, 0.7215686, 1,
1.111764, -0.6478302, 1.495898, 1, 0, 0.7137255, 1,
1.112283, 0.4161786, 1.404668, 1, 0, 0.7098039, 1,
1.127115, 1.798146, -0.01902556, 1, 0, 0.7019608, 1,
1.128778, 2.092005, 0.5439793, 1, 0, 0.6941177, 1,
1.131555, -1.692985, 3.138634, 1, 0, 0.6901961, 1,
1.13159, -0.6844983, 2.866727, 1, 0, 0.682353, 1,
1.136964, 0.845047, 0.5370577, 1, 0, 0.6784314, 1,
1.137423, 1.317926, 2.016311, 1, 0, 0.6705883, 1,
1.139286, -1.802544, 3.753835, 1, 0, 0.6666667, 1,
1.140622, 0.5341832, 0.9204144, 1, 0, 0.6588235, 1,
1.145667, 0.2666669, 2.049269, 1, 0, 0.654902, 1,
1.150464, -0.2675103, 1.864522, 1, 0, 0.6470588, 1,
1.159905, 0.1280041, 0.1031808, 1, 0, 0.6431373, 1,
1.173645, -0.80034, 1.819624, 1, 0, 0.6352941, 1,
1.173866, -2.458937, 3.146952, 1, 0, 0.6313726, 1,
1.174947, 0.5360939, 2.856602, 1, 0, 0.6235294, 1,
1.175078, 0.8911833, 0.8933188, 1, 0, 0.6196079, 1,
1.175572, -0.6316633, 1.83568, 1, 0, 0.6117647, 1,
1.195294, 1.162207, -0.1178995, 1, 0, 0.6078432, 1,
1.196513, 0.6385677, 0.8548258, 1, 0, 0.6, 1,
1.198714, 1.537364, 0.6259018, 1, 0, 0.5921569, 1,
1.200186, 0.4407697, 0.8763252, 1, 0, 0.5882353, 1,
1.200668, -1.384678, 2.225384, 1, 0, 0.5803922, 1,
1.203334, 1.486587, -1.123485, 1, 0, 0.5764706, 1,
1.212509, -0.3030851, 1.727181, 1, 0, 0.5686275, 1,
1.222976, -1.671317, 0.4953708, 1, 0, 0.5647059, 1,
1.224918, 0.5102302, 1.94286, 1, 0, 0.5568628, 1,
1.22593, 0.2833593, 0.5459642, 1, 0, 0.5529412, 1,
1.234891, 1.662758, 0.9997695, 1, 0, 0.5450981, 1,
1.235065, 0.7061791, 1.95616, 1, 0, 0.5411765, 1,
1.240282, 0.2510648, 0.7779245, 1, 0, 0.5333334, 1,
1.246062, 0.2372455, 1.146844, 1, 0, 0.5294118, 1,
1.254829, -1.066696, 3.021182, 1, 0, 0.5215687, 1,
1.257491, 1.457486, -0.2041493, 1, 0, 0.5176471, 1,
1.277456, 0.7174402, 0.7408152, 1, 0, 0.509804, 1,
1.278625, 1.08267, 0.7112725, 1, 0, 0.5058824, 1,
1.278912, -2.136824, 2.258268, 1, 0, 0.4980392, 1,
1.279769, 0.174022, -0.7665687, 1, 0, 0.4901961, 1,
1.281746, 0.09134306, 1.559768, 1, 0, 0.4862745, 1,
1.2826, 0.8567188, 0.5657868, 1, 0, 0.4784314, 1,
1.288996, 3.105002, 1.45741, 1, 0, 0.4745098, 1,
1.290408, -2.133931, 1.301503, 1, 0, 0.4666667, 1,
1.302856, 0.9100935, 1.718489, 1, 0, 0.4627451, 1,
1.307755, 2.45332, 0.770839, 1, 0, 0.454902, 1,
1.313897, 0.3951438, 0.1420618, 1, 0, 0.4509804, 1,
1.32322, -0.9076911, 2.317767, 1, 0, 0.4431373, 1,
1.325414, 0.5337167, 2.397898, 1, 0, 0.4392157, 1,
1.341918, 0.3933783, 1.028691, 1, 0, 0.4313726, 1,
1.366275, 0.4504431, 1.600835, 1, 0, 0.427451, 1,
1.367672, -0.4368983, 1.806874, 1, 0, 0.4196078, 1,
1.368807, 1.678116, 0.3255783, 1, 0, 0.4156863, 1,
1.383548, 1.096421, 0.09134579, 1, 0, 0.4078431, 1,
1.396266, -0.6463268, 1.838961, 1, 0, 0.4039216, 1,
1.409846, -0.7592937, 2.923376, 1, 0, 0.3960784, 1,
1.41832, 1.575533, 0.4580582, 1, 0, 0.3882353, 1,
1.420433, -0.1043216, 1.523536, 1, 0, 0.3843137, 1,
1.430865, -0.7958615, 2.013343, 1, 0, 0.3764706, 1,
1.439643, 0.3271435, 1.592644, 1, 0, 0.372549, 1,
1.45032, 1.296775, 0.1482741, 1, 0, 0.3647059, 1,
1.453543, 2.255311, 0.9965505, 1, 0, 0.3607843, 1,
1.46088, 0.5842049, 0.7805974, 1, 0, 0.3529412, 1,
1.48798, -1.133321, 2.33821, 1, 0, 0.3490196, 1,
1.490107, -2.273458, 3.597583, 1, 0, 0.3411765, 1,
1.495697, -0.721909, 1.799837, 1, 0, 0.3372549, 1,
1.499535, 0.2695653, 1.202639, 1, 0, 0.3294118, 1,
1.500463, 0.07863473, 1.207817, 1, 0, 0.3254902, 1,
1.511159, 0.343238, 2.524315, 1, 0, 0.3176471, 1,
1.515482, -0.055394, 0.4716242, 1, 0, 0.3137255, 1,
1.52321, 0.4122387, -0.2625612, 1, 0, 0.3058824, 1,
1.544962, -0.8201917, 1.308776, 1, 0, 0.2980392, 1,
1.554223, 1.625925, 0.9318019, 1, 0, 0.2941177, 1,
1.593489, 0.1020782, 0.4349665, 1, 0, 0.2862745, 1,
1.613086, 0.1561914, -0.3462296, 1, 0, 0.282353, 1,
1.621225, -1.095986, 4.295457, 1, 0, 0.2745098, 1,
1.624, -0.3345487, 2.010267, 1, 0, 0.2705882, 1,
1.632562, 0.8278206, 1.309169, 1, 0, 0.2627451, 1,
1.639377, 0.1006052, 0.962456, 1, 0, 0.2588235, 1,
1.6464, -1.333805, 3.642372, 1, 0, 0.2509804, 1,
1.656211, 0.9631608, 3.517359, 1, 0, 0.2470588, 1,
1.666047, 0.1844201, 1.013688, 1, 0, 0.2392157, 1,
1.671418, 0.2117172, 0.4008744, 1, 0, 0.2352941, 1,
1.67372, -0.003831335, 0.003235141, 1, 0, 0.227451, 1,
1.679168, 0.2009717, 1.679292, 1, 0, 0.2235294, 1,
1.67926, 0.4344176, 1.290816, 1, 0, 0.2156863, 1,
1.685148, 0.6150798, 0.3318697, 1, 0, 0.2117647, 1,
1.692563, 0.4455562, 1.877015, 1, 0, 0.2039216, 1,
1.701651, 0.63518, 0.4940763, 1, 0, 0.1960784, 1,
1.724417, 0.6192895, 1.442078, 1, 0, 0.1921569, 1,
1.725512, 1.369509, 0.5113793, 1, 0, 0.1843137, 1,
1.736652, 1.081391, -0.3536981, 1, 0, 0.1803922, 1,
1.748313, -0.4788518, 2.781796, 1, 0, 0.172549, 1,
1.785219, 0.3176081, -0.5083922, 1, 0, 0.1686275, 1,
1.801756, -0.2764293, 1.771391, 1, 0, 0.1607843, 1,
1.813459, -1.545677, 4.084169, 1, 0, 0.1568628, 1,
1.831614, -0.1278039, 2.729051, 1, 0, 0.1490196, 1,
1.851624, 0.7083859, 1.340592, 1, 0, 0.145098, 1,
1.85863, 1.383774, 0.7468515, 1, 0, 0.1372549, 1,
1.975999, 1.660785, -0.7183032, 1, 0, 0.1333333, 1,
1.996373, -0.1462926, 2.146373, 1, 0, 0.1254902, 1,
1.998235, -0.8801169, 2.606607, 1, 0, 0.1215686, 1,
2.000226, 1.324093, 1.957917, 1, 0, 0.1137255, 1,
2.024104, 0.2283205, 2.02994, 1, 0, 0.1098039, 1,
2.094839, -0.6643449, 2.422143, 1, 0, 0.1019608, 1,
2.103981, 0.562601, 1.607225, 1, 0, 0.09411765, 1,
2.117103, 1.123042, -0.505172, 1, 0, 0.09019608, 1,
2.159983, -0.2389627, 0.8616067, 1, 0, 0.08235294, 1,
2.164876, -1.41476, 3.226062, 1, 0, 0.07843138, 1,
2.175886, 0.2748114, 2.467254, 1, 0, 0.07058824, 1,
2.248263, 0.6132485, 1.502733, 1, 0, 0.06666667, 1,
2.250201, 0.2487844, 2.38081, 1, 0, 0.05882353, 1,
2.335236, -1.334101, 2.368504, 1, 0, 0.05490196, 1,
2.33547, 0.643703, 0.3709068, 1, 0, 0.04705882, 1,
2.337609, 1.136153, 1.555636, 1, 0, 0.04313726, 1,
2.354198, -0.8921638, 2.976962, 1, 0, 0.03529412, 1,
2.363164, 1.330153, 0.4092442, 1, 0, 0.03137255, 1,
2.520257, 0.3981219, 2.308451, 1, 0, 0.02352941, 1,
2.522914, -0.636311, 2.099458, 1, 0, 0.01960784, 1,
2.72027, -0.7051954, 0.2756845, 1, 0, 0.01176471, 1,
3.50972, -0.136281, 1.108181, 1, 0, 0.007843138, 1
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
0.2556443, -4.317325, -6.454941, 0, -0.5, 0.5, 0.5,
0.2556443, -4.317325, -6.454941, 1, -0.5, 0.5, 0.5,
0.2556443, -4.317325, -6.454941, 1, 1.5, 0.5, 0.5,
0.2556443, -4.317325, -6.454941, 0, 1.5, 0.5, 0.5
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
-4.101563, -0.0682888, -6.454941, 0, -0.5, 0.5, 0.5,
-4.101563, -0.0682888, -6.454941, 1, -0.5, 0.5, 0.5,
-4.101563, -0.0682888, -6.454941, 1, 1.5, 0.5, 0.5,
-4.101563, -0.0682888, -6.454941, 0, 1.5, 0.5, 0.5
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
-4.101563, -4.317325, 0.09798074, 0, -0.5, 0.5, 0.5,
-4.101563, -4.317325, 0.09798074, 1, -0.5, 0.5, 0.5,
-4.101563, -4.317325, 0.09798074, 1, 1.5, 0.5, 0.5,
-4.101563, -4.317325, 0.09798074, 0, 1.5, 0.5, 0.5
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
-2, -3.336778, -4.942729,
3, -3.336778, -4.942729,
-2, -3.336778, -4.942729,
-2, -3.500202, -5.194764,
-1, -3.336778, -4.942729,
-1, -3.500202, -5.194764,
0, -3.336778, -4.942729,
0, -3.500202, -5.194764,
1, -3.336778, -4.942729,
1, -3.500202, -5.194764,
2, -3.336778, -4.942729,
2, -3.500202, -5.194764,
3, -3.336778, -4.942729,
3, -3.500202, -5.194764
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
-2, -3.827051, -5.698835, 0, -0.5, 0.5, 0.5,
-2, -3.827051, -5.698835, 1, -0.5, 0.5, 0.5,
-2, -3.827051, -5.698835, 1, 1.5, 0.5, 0.5,
-2, -3.827051, -5.698835, 0, 1.5, 0.5, 0.5,
-1, -3.827051, -5.698835, 0, -0.5, 0.5, 0.5,
-1, -3.827051, -5.698835, 1, -0.5, 0.5, 0.5,
-1, -3.827051, -5.698835, 1, 1.5, 0.5, 0.5,
-1, -3.827051, -5.698835, 0, 1.5, 0.5, 0.5,
0, -3.827051, -5.698835, 0, -0.5, 0.5, 0.5,
0, -3.827051, -5.698835, 1, -0.5, 0.5, 0.5,
0, -3.827051, -5.698835, 1, 1.5, 0.5, 0.5,
0, -3.827051, -5.698835, 0, 1.5, 0.5, 0.5,
1, -3.827051, -5.698835, 0, -0.5, 0.5, 0.5,
1, -3.827051, -5.698835, 1, -0.5, 0.5, 0.5,
1, -3.827051, -5.698835, 1, 1.5, 0.5, 0.5,
1, -3.827051, -5.698835, 0, 1.5, 0.5, 0.5,
2, -3.827051, -5.698835, 0, -0.5, 0.5, 0.5,
2, -3.827051, -5.698835, 1, -0.5, 0.5, 0.5,
2, -3.827051, -5.698835, 1, 1.5, 0.5, 0.5,
2, -3.827051, -5.698835, 0, 1.5, 0.5, 0.5,
3, -3.827051, -5.698835, 0, -0.5, 0.5, 0.5,
3, -3.827051, -5.698835, 1, -0.5, 0.5, 0.5,
3, -3.827051, -5.698835, 1, 1.5, 0.5, 0.5,
3, -3.827051, -5.698835, 0, 1.5, 0.5, 0.5
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
-3.096054, -3, -4.942729,
-3.096054, 3, -4.942729,
-3.096054, -3, -4.942729,
-3.263639, -3, -5.194764,
-3.096054, -2, -4.942729,
-3.263639, -2, -5.194764,
-3.096054, -1, -4.942729,
-3.263639, -1, -5.194764,
-3.096054, 0, -4.942729,
-3.263639, 0, -5.194764,
-3.096054, 1, -4.942729,
-3.263639, 1, -5.194764,
-3.096054, 2, -4.942729,
-3.263639, 2, -5.194764,
-3.096054, 3, -4.942729,
-3.263639, 3, -5.194764
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
-3.598809, -3, -5.698835, 0, -0.5, 0.5, 0.5,
-3.598809, -3, -5.698835, 1, -0.5, 0.5, 0.5,
-3.598809, -3, -5.698835, 1, 1.5, 0.5, 0.5,
-3.598809, -3, -5.698835, 0, 1.5, 0.5, 0.5,
-3.598809, -2, -5.698835, 0, -0.5, 0.5, 0.5,
-3.598809, -2, -5.698835, 1, -0.5, 0.5, 0.5,
-3.598809, -2, -5.698835, 1, 1.5, 0.5, 0.5,
-3.598809, -2, -5.698835, 0, 1.5, 0.5, 0.5,
-3.598809, -1, -5.698835, 0, -0.5, 0.5, 0.5,
-3.598809, -1, -5.698835, 1, -0.5, 0.5, 0.5,
-3.598809, -1, -5.698835, 1, 1.5, 0.5, 0.5,
-3.598809, -1, -5.698835, 0, 1.5, 0.5, 0.5,
-3.598809, 0, -5.698835, 0, -0.5, 0.5, 0.5,
-3.598809, 0, -5.698835, 1, -0.5, 0.5, 0.5,
-3.598809, 0, -5.698835, 1, 1.5, 0.5, 0.5,
-3.598809, 0, -5.698835, 0, 1.5, 0.5, 0.5,
-3.598809, 1, -5.698835, 0, -0.5, 0.5, 0.5,
-3.598809, 1, -5.698835, 1, -0.5, 0.5, 0.5,
-3.598809, 1, -5.698835, 1, 1.5, 0.5, 0.5,
-3.598809, 1, -5.698835, 0, 1.5, 0.5, 0.5,
-3.598809, 2, -5.698835, 0, -0.5, 0.5, 0.5,
-3.598809, 2, -5.698835, 1, -0.5, 0.5, 0.5,
-3.598809, 2, -5.698835, 1, 1.5, 0.5, 0.5,
-3.598809, 2, -5.698835, 0, 1.5, 0.5, 0.5,
-3.598809, 3, -5.698835, 0, -0.5, 0.5, 0.5,
-3.598809, 3, -5.698835, 1, -0.5, 0.5, 0.5,
-3.598809, 3, -5.698835, 1, 1.5, 0.5, 0.5,
-3.598809, 3, -5.698835, 0, 1.5, 0.5, 0.5
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
-3.096054, -3.336778, -4,
-3.096054, -3.336778, 4,
-3.096054, -3.336778, -4,
-3.263639, -3.500202, -4,
-3.096054, -3.336778, -2,
-3.263639, -3.500202, -2,
-3.096054, -3.336778, 0,
-3.263639, -3.500202, 0,
-3.096054, -3.336778, 2,
-3.263639, -3.500202, 2,
-3.096054, -3.336778, 4,
-3.263639, -3.500202, 4
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
-3.598809, -3.827051, -4, 0, -0.5, 0.5, 0.5,
-3.598809, -3.827051, -4, 1, -0.5, 0.5, 0.5,
-3.598809, -3.827051, -4, 1, 1.5, 0.5, 0.5,
-3.598809, -3.827051, -4, 0, 1.5, 0.5, 0.5,
-3.598809, -3.827051, -2, 0, -0.5, 0.5, 0.5,
-3.598809, -3.827051, -2, 1, -0.5, 0.5, 0.5,
-3.598809, -3.827051, -2, 1, 1.5, 0.5, 0.5,
-3.598809, -3.827051, -2, 0, 1.5, 0.5, 0.5,
-3.598809, -3.827051, 0, 0, -0.5, 0.5, 0.5,
-3.598809, -3.827051, 0, 1, -0.5, 0.5, 0.5,
-3.598809, -3.827051, 0, 1, 1.5, 0.5, 0.5,
-3.598809, -3.827051, 0, 0, 1.5, 0.5, 0.5,
-3.598809, -3.827051, 2, 0, -0.5, 0.5, 0.5,
-3.598809, -3.827051, 2, 1, -0.5, 0.5, 0.5,
-3.598809, -3.827051, 2, 1, 1.5, 0.5, 0.5,
-3.598809, -3.827051, 2, 0, 1.5, 0.5, 0.5,
-3.598809, -3.827051, 4, 0, -0.5, 0.5, 0.5,
-3.598809, -3.827051, 4, 1, -0.5, 0.5, 0.5,
-3.598809, -3.827051, 4, 1, 1.5, 0.5, 0.5,
-3.598809, -3.827051, 4, 0, 1.5, 0.5, 0.5
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
-3.096054, -3.336778, -4.942729,
-3.096054, 3.2002, -4.942729,
-3.096054, -3.336778, 5.13869,
-3.096054, 3.2002, 5.13869,
-3.096054, -3.336778, -4.942729,
-3.096054, -3.336778, 5.13869,
-3.096054, 3.2002, -4.942729,
-3.096054, 3.2002, 5.13869,
-3.096054, -3.336778, -4.942729,
3.607343, -3.336778, -4.942729,
-3.096054, -3.336778, 5.13869,
3.607343, -3.336778, 5.13869,
-3.096054, 3.2002, -4.942729,
3.607343, 3.2002, -4.942729,
-3.096054, 3.2002, 5.13869,
3.607343, 3.2002, 5.13869,
3.607343, -3.336778, -4.942729,
3.607343, 3.2002, -4.942729,
3.607343, -3.336778, 5.13869,
3.607343, 3.2002, 5.13869,
3.607343, -3.336778, -4.942729,
3.607343, -3.336778, 5.13869,
3.607343, 3.2002, -4.942729,
3.607343, 3.2002, 5.13869
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
var radius = 7.346894;
var distance = 32.68716;
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
mvMatrix.translate( -0.2556443, 0.0682888, -0.09798074 );
mvMatrix.scale( 1.185012, 1.21518, 0.7879452 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.68716);
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
chlorfenson<-read.table("chlorfenson.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorfenson$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorfenson' not found
```

```r
y<-chlorfenson$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorfenson' not found
```

```r
z<-chlorfenson$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorfenson' not found
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
-2.998432, -0.740599, -2.626333, 0, 0, 1, 1, 1,
-2.89656, -0.2974686, 0.07126704, 1, 0, 0, 1, 1,
-2.800796, 0.8309194, -1.841277, 1, 0, 0, 1, 1,
-2.705507, -0.2716592, -3.951866, 1, 0, 0, 1, 1,
-2.510042, 0.5353951, -1.479946, 1, 0, 0, 1, 1,
-2.486429, 0.5328364, -0.5318735, 1, 0, 0, 1, 1,
-2.457146, -0.5765065, -1.585611, 0, 0, 0, 1, 1,
-2.420431, -0.1157465, -2.671139, 0, 0, 0, 1, 1,
-2.322586, -1.14382, -0.07348909, 0, 0, 0, 1, 1,
-2.316318, -0.4585512, -2.46455, 0, 0, 0, 1, 1,
-2.300329, -1.07392, -2.328465, 0, 0, 0, 1, 1,
-2.285413, 0.7610574, -0.6084529, 0, 0, 0, 1, 1,
-2.223794, -0.7604682, -1.72422, 0, 0, 0, 1, 1,
-2.217192, -0.3149911, -3.648687, 1, 1, 1, 1, 1,
-2.217047, 0.8190602, -1.345129, 1, 1, 1, 1, 1,
-2.152416, -0.3463646, -1.209132, 1, 1, 1, 1, 1,
-2.150949, 0.2223941, -1.660344, 1, 1, 1, 1, 1,
-2.140367, -1.785606, -1.943287, 1, 1, 1, 1, 1,
-2.103536, 0.5604791, -1.166446, 1, 1, 1, 1, 1,
-2.077583, 0.05837494, -2.966358, 1, 1, 1, 1, 1,
-2.050874, -0.6315193, -1.462879, 1, 1, 1, 1, 1,
-2.047901, 0.2457848, -0.1614743, 1, 1, 1, 1, 1,
-2.035394, -0.8600929, -1.138507, 1, 1, 1, 1, 1,
-1.992062, -0.4764051, -0.848426, 1, 1, 1, 1, 1,
-1.959886, -1.197312, -1.793678, 1, 1, 1, 1, 1,
-1.954825, 0.02900532, -1.503845, 1, 1, 1, 1, 1,
-1.90465, 0.8020915, -0.6091981, 1, 1, 1, 1, 1,
-1.832814, 2.223289, 0.9652534, 1, 1, 1, 1, 1,
-1.805488, 0.9853747, -0.5314882, 0, 0, 1, 1, 1,
-1.787725, -1.341927, -2.945748, 1, 0, 0, 1, 1,
-1.784442, -1.286461, -2.912578, 1, 0, 0, 1, 1,
-1.779916, -0.8292734, -1.794014, 1, 0, 0, 1, 1,
-1.768274, -1.390796, -2.124974, 1, 0, 0, 1, 1,
-1.763096, -0.1475666, -1.88186, 1, 0, 0, 1, 1,
-1.755409, -0.7910351, -3.813793, 0, 0, 0, 1, 1,
-1.753615, 0.4960107, -2.026572, 0, 0, 0, 1, 1,
-1.748634, -0.1739568, -0.9921471, 0, 0, 0, 1, 1,
-1.746894, 1.484502, -2.181324, 0, 0, 0, 1, 1,
-1.745428, -1.493039, -3.235456, 0, 0, 0, 1, 1,
-1.738076, -0.9338534, -1.711924, 0, 0, 0, 1, 1,
-1.73617, -0.8748409, -1.345719, 0, 0, 0, 1, 1,
-1.731642, -0.3867926, -2.445781, 1, 1, 1, 1, 1,
-1.696868, 0.946606, -1.394697, 1, 1, 1, 1, 1,
-1.685705, -0.7137038, -3.734988, 1, 1, 1, 1, 1,
-1.683945, 2.463679, -1.326329, 1, 1, 1, 1, 1,
-1.670523, 0.9718087, -1.671915, 1, 1, 1, 1, 1,
-1.658923, -0.5841553, -0.9070193, 1, 1, 1, 1, 1,
-1.653394, 0.6580562, -1.306906, 1, 1, 1, 1, 1,
-1.650733, 0.6548609, -1.377296, 1, 1, 1, 1, 1,
-1.648672, -0.3223667, -3.217615, 1, 1, 1, 1, 1,
-1.63391, 0.9592495, 0.4516554, 1, 1, 1, 1, 1,
-1.627154, 0.177347, -2.585653, 1, 1, 1, 1, 1,
-1.596543, -0.9053574, -3.009947, 1, 1, 1, 1, 1,
-1.589592, -0.4586274, -1.825361, 1, 1, 1, 1, 1,
-1.589228, -1.392322, -0.5249778, 1, 1, 1, 1, 1,
-1.581575, -0.02866416, -1.555014, 1, 1, 1, 1, 1,
-1.579579, -0.9820243, -1.034858, 0, 0, 1, 1, 1,
-1.550323, 1.937876, -0.4958064, 1, 0, 0, 1, 1,
-1.537084, 0.7965801, -1.058939, 1, 0, 0, 1, 1,
-1.53192, 0.5443555, -2.957107, 1, 0, 0, 1, 1,
-1.523301, 1.31362, 1.201188, 1, 0, 0, 1, 1,
-1.507009, 0.7270629, -0.4772459, 1, 0, 0, 1, 1,
-1.492617, -0.4286809, -3.093598, 0, 0, 0, 1, 1,
-1.490463, -0.02511344, -1.244386, 0, 0, 0, 1, 1,
-1.486255, -1.843172, -1.403989, 0, 0, 0, 1, 1,
-1.480558, -0.09351256, -2.391192, 0, 0, 0, 1, 1,
-1.479945, -0.09482912, -2.146645, 0, 0, 0, 1, 1,
-1.478644, -1.18957, -0.8070287, 0, 0, 0, 1, 1,
-1.477851, 0.05675744, 0.2065514, 0, 0, 0, 1, 1,
-1.46768, -2.278549, -1.71846, 1, 1, 1, 1, 1,
-1.465673, 0.28144, -1.320283, 1, 1, 1, 1, 1,
-1.465041, 0.5331619, -1.410854, 1, 1, 1, 1, 1,
-1.461802, 1.562566, 1.073518, 1, 1, 1, 1, 1,
-1.461075, -0.2021799, 0.3386322, 1, 1, 1, 1, 1,
-1.460657, -0.3583324, -1.047404, 1, 1, 1, 1, 1,
-1.459286, -0.4900496, -0.6069726, 1, 1, 1, 1, 1,
-1.446012, 0.1201106, -0.4145328, 1, 1, 1, 1, 1,
-1.438036, 0.5087931, -2.280949, 1, 1, 1, 1, 1,
-1.434481, 0.5279535, -2.909548, 1, 1, 1, 1, 1,
-1.434363, 1.249837, -1.417981, 1, 1, 1, 1, 1,
-1.430092, -0.06998454, -3.404895, 1, 1, 1, 1, 1,
-1.423922, -0.07812835, -0.9371092, 1, 1, 1, 1, 1,
-1.423687, 0.6179561, -1.83037, 1, 1, 1, 1, 1,
-1.422726, 0.02682807, -1.400149, 1, 1, 1, 1, 1,
-1.418659, -0.1754599, -1.810262, 0, 0, 1, 1, 1,
-1.418385, 0.7888654, -1.646134, 1, 0, 0, 1, 1,
-1.415641, 1.109853, -1.918128, 1, 0, 0, 1, 1,
-1.397751, -0.01941848, -1.905349, 1, 0, 0, 1, 1,
-1.387606, 1.760366, -1.542285, 1, 0, 0, 1, 1,
-1.386738, -0.6851484, -2.444064, 1, 0, 0, 1, 1,
-1.381154, -2.047816, -1.844455, 0, 0, 0, 1, 1,
-1.377343, -1.183307, -2.259896, 0, 0, 0, 1, 1,
-1.372138, 0.201813, -0.2702074, 0, 0, 0, 1, 1,
-1.360339, 2.173715, -0.8252493, 0, 0, 0, 1, 1,
-1.35782, 0.593244, -1.349587, 0, 0, 0, 1, 1,
-1.352983, -1.461025, -1.353341, 0, 0, 0, 1, 1,
-1.350645, 0.03604269, -2.120541, 0, 0, 0, 1, 1,
-1.343388, -1.85831, -1.414304, 1, 1, 1, 1, 1,
-1.341704, 0.1657704, 0.5717408, 1, 1, 1, 1, 1,
-1.330217, -2.127976, -2.541977, 1, 1, 1, 1, 1,
-1.326134, -0.2817332, -0.7414667, 1, 1, 1, 1, 1,
-1.322949, -1.372778, -4.1782, 1, 1, 1, 1, 1,
-1.322503, 1.503928, -0.8803561, 1, 1, 1, 1, 1,
-1.322362, 0.3450857, 0.1496722, 1, 1, 1, 1, 1,
-1.297171, 0.8423828, -0.6840157, 1, 1, 1, 1, 1,
-1.289399, -0.06390682, -1.651478, 1, 1, 1, 1, 1,
-1.287701, -0.1532034, -1.981446, 1, 1, 1, 1, 1,
-1.286698, 0.8459159, -0.3165761, 1, 1, 1, 1, 1,
-1.278833, 1.904649, -0.4595085, 1, 1, 1, 1, 1,
-1.273134, -0.3933935, -1.00118, 1, 1, 1, 1, 1,
-1.262772, -0.5010535, -1.278849, 1, 1, 1, 1, 1,
-1.25521, 0.8067005, -0.9511721, 1, 1, 1, 1, 1,
-1.248526, 0.2902813, -2.378347, 0, 0, 1, 1, 1,
-1.236921, 1.872849, -0.5691453, 1, 0, 0, 1, 1,
-1.236824, -0.5426919, -1.554917, 1, 0, 0, 1, 1,
-1.229256, -0.6274448, 0.7614129, 1, 0, 0, 1, 1,
-1.229062, -0.2492627, -1.957068, 1, 0, 0, 1, 1,
-1.228769, -0.335199, -0.6815303, 1, 0, 0, 1, 1,
-1.228037, -1.068278, -1.518673, 0, 0, 0, 1, 1,
-1.227271, -0.4897114, -2.193443, 0, 0, 0, 1, 1,
-1.221521, 0.2048154, -2.353245, 0, 0, 0, 1, 1,
-1.20424, 0.5156202, -2.782741, 0, 0, 0, 1, 1,
-1.203008, -0.8935913, -3.236744, 0, 0, 0, 1, 1,
-1.20262, -0.796821, -1.926736, 0, 0, 0, 1, 1,
-1.202556, 0.6901168, -1.54354, 0, 0, 0, 1, 1,
-1.19958, -0.5393624, -1.488005, 1, 1, 1, 1, 1,
-1.198645, 1.452432, -2.354483, 1, 1, 1, 1, 1,
-1.196242, 0.2523953, 0.8436704, 1, 1, 1, 1, 1,
-1.194354, -0.0269703, -0.2824727, 1, 1, 1, 1, 1,
-1.182246, -0.6603905, -2.567936, 1, 1, 1, 1, 1,
-1.182203, -2.023976, -1.45525, 1, 1, 1, 1, 1,
-1.180421, 0.1318763, -1.635667, 1, 1, 1, 1, 1,
-1.174424, -1.372928, -3.033034, 1, 1, 1, 1, 1,
-1.173686, -0.8352913, -2.333946, 1, 1, 1, 1, 1,
-1.170672, 0.3713792, -1.811739, 1, 1, 1, 1, 1,
-1.15198, -1.072257, -2.589216, 1, 1, 1, 1, 1,
-1.147912, -0.8495027, -2.054578, 1, 1, 1, 1, 1,
-1.138154, 0.4508137, -2.240666, 1, 1, 1, 1, 1,
-1.129746, -0.6866056, -0.6282477, 1, 1, 1, 1, 1,
-1.125105, 1.024374, -1.52281, 1, 1, 1, 1, 1,
-1.120845, -0.3022401, -1.517508, 0, 0, 1, 1, 1,
-1.120337, -0.028094, -2.207527, 1, 0, 0, 1, 1,
-1.115826, 0.559141, -2.430549, 1, 0, 0, 1, 1,
-1.115653, 0.4387538, -0.97711, 1, 0, 0, 1, 1,
-1.113274, 0.6461889, -2.034928, 1, 0, 0, 1, 1,
-1.111138, 0.1953918, -1.511689, 1, 0, 0, 1, 1,
-1.105019, 1.631294, 0.638086, 0, 0, 0, 1, 1,
-1.098246, -0.2481884, -0.3434247, 0, 0, 0, 1, 1,
-1.097843, 0.2147686, -0.795029, 0, 0, 0, 1, 1,
-1.094885, 0.05891112, -0.6476909, 0, 0, 0, 1, 1,
-1.093902, -2.541355, -2.178364, 0, 0, 0, 1, 1,
-1.093809, -0.1199763, -0.2408016, 0, 0, 0, 1, 1,
-1.091751, 1.012509, -1.125657, 0, 0, 0, 1, 1,
-1.090948, -0.6941235, -3.036239, 1, 1, 1, 1, 1,
-1.090578, -0.1243153, -0.8689681, 1, 1, 1, 1, 1,
-1.083124, -0.4629691, -2.98364, 1, 1, 1, 1, 1,
-1.08042, 1.340432, -2.565456, 1, 1, 1, 1, 1,
-1.073721, -0.9704158, -3.731705, 1, 1, 1, 1, 1,
-1.059775, 0.6370223, -0.5796462, 1, 1, 1, 1, 1,
-1.053346, -0.9243678, -1.660287, 1, 1, 1, 1, 1,
-1.049756, -0.5951494, -1.643769, 1, 1, 1, 1, 1,
-1.042639, 0.06413067, -1.39449, 1, 1, 1, 1, 1,
-1.039024, 1.13542, -2.027915, 1, 1, 1, 1, 1,
-1.02514, 0.5145112, 1.677707, 1, 1, 1, 1, 1,
-1.021127, 0.04591347, -2.239289, 1, 1, 1, 1, 1,
-1.020321, 1.002504, -1.141704, 1, 1, 1, 1, 1,
-1.008436, -0.2176144, -2.896378, 1, 1, 1, 1, 1,
-1.00594, -0.6187732, -1.936525, 1, 1, 1, 1, 1,
-1.005867, 0.8411393, 0.2846152, 0, 0, 1, 1, 1,
-0.998301, -1.037459, -2.060652, 1, 0, 0, 1, 1,
-0.9969113, 1.478974, -0.4921527, 1, 0, 0, 1, 1,
-0.9897422, -0.2635078, -2.807513, 1, 0, 0, 1, 1,
-0.9795197, 0.7855332, -0.2231693, 1, 0, 0, 1, 1,
-0.9760031, 0.1703724, -1.796235, 1, 0, 0, 1, 1,
-0.9721785, 0.06864231, -1.988418, 0, 0, 0, 1, 1,
-0.971841, -1.28119, -3.626489, 0, 0, 0, 1, 1,
-0.969582, -0.1070351, -2.195971, 0, 0, 0, 1, 1,
-0.9691194, -2.010372, -1.695779, 0, 0, 0, 1, 1,
-0.9629272, 0.3093357, -1.718563, 0, 0, 0, 1, 1,
-0.9623581, -0.004766334, -2.320916, 0, 0, 0, 1, 1,
-0.9621207, -2.345104, -2.119016, 0, 0, 0, 1, 1,
-0.9589012, -0.4294967, -2.787008, 1, 1, 1, 1, 1,
-0.9583252, -0.3111158, -1.514138, 1, 1, 1, 1, 1,
-0.9567274, -0.09353682, -0.6267084, 1, 1, 1, 1, 1,
-0.9560902, 0.9446123, -1.997257, 1, 1, 1, 1, 1,
-0.9493146, -0.7462965, -3.379121, 1, 1, 1, 1, 1,
-0.9488934, 0.01484223, -2.541192, 1, 1, 1, 1, 1,
-0.9377124, 1.133842, -1.040835, 1, 1, 1, 1, 1,
-0.9343954, -0.6288838, -1.730511, 1, 1, 1, 1, 1,
-0.9253778, 0.1803244, -1.818205, 1, 1, 1, 1, 1,
-0.9145061, -0.2573665, -2.147725, 1, 1, 1, 1, 1,
-0.911457, -0.2955928, -2.506556, 1, 1, 1, 1, 1,
-0.9100546, -0.880695, -0.9163129, 1, 1, 1, 1, 1,
-0.9084095, 1.993108, 0.5050937, 1, 1, 1, 1, 1,
-0.9081336, 1.405684, -1.132211, 1, 1, 1, 1, 1,
-0.9078263, -0.8438712, -1.494959, 1, 1, 1, 1, 1,
-0.9029779, -0.5462971, -2.234716, 0, 0, 1, 1, 1,
-0.8936319, 1.025991, -1.890363, 1, 0, 0, 1, 1,
-0.8906835, -0.1403267, -3.878155, 1, 0, 0, 1, 1,
-0.8904444, -0.3696147, -1.511379, 1, 0, 0, 1, 1,
-0.8890651, -0.278125, -1.328232, 1, 0, 0, 1, 1,
-0.8883138, -0.1665629, -1.300685, 1, 0, 0, 1, 1,
-0.8845512, -1.634448, -1.162113, 0, 0, 0, 1, 1,
-0.8820391, -1.324926, -2.356813, 0, 0, 0, 1, 1,
-0.8815179, -0.2404016, -0.78424, 0, 0, 0, 1, 1,
-0.8676013, 0.2060526, -1.06316, 0, 0, 0, 1, 1,
-0.8649182, 0.2564743, -0.6453575, 0, 0, 0, 1, 1,
-0.8634018, 2.10125, -2.006396, 0, 0, 0, 1, 1,
-0.8554578, 0.3946348, -0.01911723, 0, 0, 0, 1, 1,
-0.8437367, 1.453793, -0.3037363, 1, 1, 1, 1, 1,
-0.8417162, -0.1426934, -1.764596, 1, 1, 1, 1, 1,
-0.8413422, -0.2564928, -1.700687, 1, 1, 1, 1, 1,
-0.8408048, 0.09672792, -2.10161, 1, 1, 1, 1, 1,
-0.8395425, -0.9486783, -1.455803, 1, 1, 1, 1, 1,
-0.8357811, 0.9527838, 0.8108408, 1, 1, 1, 1, 1,
-0.8309001, -1.434017, -2.196772, 1, 1, 1, 1, 1,
-0.8293971, -1.265208, -2.185798, 1, 1, 1, 1, 1,
-0.8279902, 0.3549378, -1.508716, 1, 1, 1, 1, 1,
-0.8198383, -0.1146402, -1.39769, 1, 1, 1, 1, 1,
-0.8187274, 0.4993291, -1.13451, 1, 1, 1, 1, 1,
-0.8180467, 0.06726431, -0.6909659, 1, 1, 1, 1, 1,
-0.815088, -0.8647125, -1.374566, 1, 1, 1, 1, 1,
-0.8101221, 0.1138581, -3.901995, 1, 1, 1, 1, 1,
-0.8097945, -0.5663621, -2.965732, 1, 1, 1, 1, 1,
-0.8094123, -0.8210185, -3.108507, 0, 0, 1, 1, 1,
-0.8089891, -0.1288986, -0.9117656, 1, 0, 0, 1, 1,
-0.8038088, 0.05012071, -1.839473, 1, 0, 0, 1, 1,
-0.8002771, 1.103201, -0.9492709, 1, 0, 0, 1, 1,
-0.7994745, -0.5861818, -2.720941, 1, 0, 0, 1, 1,
-0.7979982, -1.161524, -2.714085, 1, 0, 0, 1, 1,
-0.795121, -2.338164, -2.519745, 0, 0, 0, 1, 1,
-0.7896016, -0.06623019, -0.5429258, 0, 0, 0, 1, 1,
-0.7879336, -1.89404, -3.851741, 0, 0, 0, 1, 1,
-0.7871827, 0.07706835, -2.81798, 0, 0, 0, 1, 1,
-0.787055, -0.2799563, -2.840326, 0, 0, 0, 1, 1,
-0.7866886, 0.9384518, -2.039633, 0, 0, 0, 1, 1,
-0.786144, -0.1970688, -2.301743, 0, 0, 0, 1, 1,
-0.7809621, -1.208652, -1.758312, 1, 1, 1, 1, 1,
-0.7804159, 0.2724267, -0.5952448, 1, 1, 1, 1, 1,
-0.778604, -1.061645, -3.628348, 1, 1, 1, 1, 1,
-0.7687533, -1.172544, -3.564724, 1, 1, 1, 1, 1,
-0.7664829, 0.4433296, -2.272704, 1, 1, 1, 1, 1,
-0.7612275, 0.9606535, -1.803041, 1, 1, 1, 1, 1,
-0.7386852, 0.1108327, -0.2884409, 1, 1, 1, 1, 1,
-0.737023, -0.02545996, -0.1075959, 1, 1, 1, 1, 1,
-0.7342233, -1.871575, -4.26453, 1, 1, 1, 1, 1,
-0.7301391, 1.388355, -1.140452, 1, 1, 1, 1, 1,
-0.7288157, 1.33043, -1.33282, 1, 1, 1, 1, 1,
-0.7272996, 2.656583, -0.3497081, 1, 1, 1, 1, 1,
-0.7243584, -0.187095, -0.7340983, 1, 1, 1, 1, 1,
-0.7142881, 0.2130282, -0.8874969, 1, 1, 1, 1, 1,
-0.7128972, 0.6648561, -0.3670924, 1, 1, 1, 1, 1,
-0.7126747, -0.4901095, -0.5077851, 0, 0, 1, 1, 1,
-0.7085119, -0.7770523, -1.918351, 1, 0, 0, 1, 1,
-0.7067635, 0.1388782, -2.38687, 1, 0, 0, 1, 1,
-0.7040977, -0.4659584, -2.182389, 1, 0, 0, 1, 1,
-0.7039464, 0.2176623, -1.487296, 1, 0, 0, 1, 1,
-0.6968057, 0.7863652, -2.384105, 1, 0, 0, 1, 1,
-0.6957127, 1.190758, 0.6847632, 0, 0, 0, 1, 1,
-0.6919532, -0.2128814, -0.2259793, 0, 0, 0, 1, 1,
-0.6896558, 1.573091, 0.6618483, 0, 0, 0, 1, 1,
-0.6886992, 1.216333, -1.587444, 0, 0, 0, 1, 1,
-0.6869004, -1.449084, -0.7178067, 0, 0, 0, 1, 1,
-0.6863077, -0.6880065, -1.147162, 0, 0, 0, 1, 1,
-0.6845105, -0.7161632, -3.106009, 0, 0, 0, 1, 1,
-0.6808983, -1.030548, -2.623953, 1, 1, 1, 1, 1,
-0.6766262, 0.5574589, -0.8578574, 1, 1, 1, 1, 1,
-0.6743392, 0.9725356, 0.769313, 1, 1, 1, 1, 1,
-0.6690837, -0.8099343, -2.216051, 1, 1, 1, 1, 1,
-0.6625417, 0.0670855, 0.1100801, 1, 1, 1, 1, 1,
-0.6603068, -0.7110162, -3.507252, 1, 1, 1, 1, 1,
-0.6532291, 0.04212379, -0.9468358, 1, 1, 1, 1, 1,
-0.6507779, 1.213033, -1.124655, 1, 1, 1, 1, 1,
-0.6499664, 1.965222, -1.209196, 1, 1, 1, 1, 1,
-0.6473528, -0.4414242, -2.490204, 1, 1, 1, 1, 1,
-0.6381105, 1.466391, -1.272304, 1, 1, 1, 1, 1,
-0.6348581, 1.764097, -1.355402, 1, 1, 1, 1, 1,
-0.6348371, 0.5119543, -1.339206, 1, 1, 1, 1, 1,
-0.6309716, -0.5166728, -1.605032, 1, 1, 1, 1, 1,
-0.6272104, -0.2753764, -1.027789, 1, 1, 1, 1, 1,
-0.6256546, 0.7842392, -2.38941, 0, 0, 1, 1, 1,
-0.6232774, 0.5796772, 0.4481118, 1, 0, 0, 1, 1,
-0.6212675, -1.259679, -3.624258, 1, 0, 0, 1, 1,
-0.6190664, -0.8009358, -2.43786, 1, 0, 0, 1, 1,
-0.6151197, 0.8068992, -0.04710036, 1, 0, 0, 1, 1,
-0.6099302, 0.9796124, 0.7093657, 1, 0, 0, 1, 1,
-0.6098658, 0.1598578, -0.9939679, 0, 0, 0, 1, 1,
-0.6076344, 0.8102313, 0.1954102, 0, 0, 0, 1, 1,
-0.6061525, 1.202865, -0.05997903, 0, 0, 0, 1, 1,
-0.6054341, -0.8579797, -2.153375, 0, 0, 0, 1, 1,
-0.6052392, -0.8506592, -1.047356, 0, 0, 0, 1, 1,
-0.6051288, 0.4720363, -0.7706298, 0, 0, 0, 1, 1,
-0.6046522, 0.6966751, 0.6201414, 0, 0, 0, 1, 1,
-0.602097, 1.489993, -1.15123, 1, 1, 1, 1, 1,
-0.5991387, 0.6447093, -1.143765, 1, 1, 1, 1, 1,
-0.5986966, -0.9814076, -1.999995, 1, 1, 1, 1, 1,
-0.5912419, 1.090392, -1.447369, 1, 1, 1, 1, 1,
-0.5737649, 0.1807301, 0.01949231, 1, 1, 1, 1, 1,
-0.5709965, 1.344601, -0.6293902, 1, 1, 1, 1, 1,
-0.5655508, 0.1517161, -1.583125, 1, 1, 1, 1, 1,
-0.5644541, -2.518494, -4.763972, 1, 1, 1, 1, 1,
-0.5606764, 1.692943, 0.08005556, 1, 1, 1, 1, 1,
-0.560505, 0.2284207, -3.155528, 1, 1, 1, 1, 1,
-0.555382, 0.9850252, 0.4534264, 1, 1, 1, 1, 1,
-0.554301, 0.6868865, -1.791829, 1, 1, 1, 1, 1,
-0.5527726, -0.3148688, -0.9359739, 1, 1, 1, 1, 1,
-0.5491241, -1.102263, -1.775636, 1, 1, 1, 1, 1,
-0.5486807, 0.7194343, -0.4476728, 1, 1, 1, 1, 1,
-0.5483201, 1.460438, -0.9897784, 0, 0, 1, 1, 1,
-0.5470405, 1.398334, -0.3694697, 1, 0, 0, 1, 1,
-0.5450283, 0.8192454, -0.9053041, 1, 0, 0, 1, 1,
-0.5403675, 1.728351, 0.2440699, 1, 0, 0, 1, 1,
-0.5362731, -1.25283, -2.725786, 1, 0, 0, 1, 1,
-0.5353107, 0.4183297, -0.769947, 1, 0, 0, 1, 1,
-0.5232814, -0.5533423, -2.740142, 0, 0, 0, 1, 1,
-0.5223458, 0.255915, -0.1403056, 0, 0, 0, 1, 1,
-0.517944, -1.717043, -3.646377, 0, 0, 0, 1, 1,
-0.5173015, -0.02373903, -2.623252, 0, 0, 0, 1, 1,
-0.5163669, -1.442077, -1.072286, 0, 0, 0, 1, 1,
-0.5162891, 0.7114885, -0.5610096, 0, 0, 0, 1, 1,
-0.5162005, -0.1298479, -2.353559, 0, 0, 0, 1, 1,
-0.5161521, -0.4875057, -2.900423, 1, 1, 1, 1, 1,
-0.5154213, 1.491482, -1.166828, 1, 1, 1, 1, 1,
-0.5149072, -1.502801, -1.506113, 1, 1, 1, 1, 1,
-0.5119985, -1.009665, -2.893146, 1, 1, 1, 1, 1,
-0.5033305, 1.63697, -0.1334397, 1, 1, 1, 1, 1,
-0.4988662, 0.3929871, 0.4093719, 1, 1, 1, 1, 1,
-0.4986023, -0.1578621, -3.747708, 1, 1, 1, 1, 1,
-0.4901895, -1.651462, -2.307636, 1, 1, 1, 1, 1,
-0.4874669, -1.56475, -3.024188, 1, 1, 1, 1, 1,
-0.4859253, 0.770156, -1.542213, 1, 1, 1, 1, 1,
-0.4851628, -0.4650531, -1.09126, 1, 1, 1, 1, 1,
-0.4831814, -0.171793, -1.627153, 1, 1, 1, 1, 1,
-0.4781664, 1.223597, 0.1159409, 1, 1, 1, 1, 1,
-0.4778971, -0.3077006, -2.1889, 1, 1, 1, 1, 1,
-0.4775454, 0.4621392, 0.4983697, 1, 1, 1, 1, 1,
-0.4733134, -0.4250849, -2.320541, 0, 0, 1, 1, 1,
-0.472078, -2.423514, -0.8542599, 1, 0, 0, 1, 1,
-0.4701799, -0.6615879, -1.370289, 1, 0, 0, 1, 1,
-0.4684361, -1.124237, -2.891737, 1, 0, 0, 1, 1,
-0.4667919, -0.05904555, -0.8702676, 1, 0, 0, 1, 1,
-0.4654839, -0.5333437, -4.034514, 1, 0, 0, 1, 1,
-0.4630277, 0.4635237, -1.994448, 0, 0, 0, 1, 1,
-0.4603447, 0.3040636, -1.496932, 0, 0, 0, 1, 1,
-0.4579309, 0.1745081, -1.885612, 0, 0, 0, 1, 1,
-0.4516106, 0.84642, -3.447131, 0, 0, 0, 1, 1,
-0.4494001, 1.543112, -0.8525389, 0, 0, 0, 1, 1,
-0.4441903, 0.0375561, -3.516272, 0, 0, 0, 1, 1,
-0.4413032, 1.185666, -0.6460351, 0, 0, 0, 1, 1,
-0.4392907, 1.410878, -0.1484963, 1, 1, 1, 1, 1,
-0.4368697, -0.3189141, -1.730756, 1, 1, 1, 1, 1,
-0.4359532, -0.3111185, -3.03721, 1, 1, 1, 1, 1,
-0.4340608, 0.5811602, 0.5642938, 1, 1, 1, 1, 1,
-0.4340279, -0.5220485, -1.248281, 1, 1, 1, 1, 1,
-0.4322925, -0.3821609, -2.337229, 1, 1, 1, 1, 1,
-0.4290377, -0.5814298, -2.056647, 1, 1, 1, 1, 1,
-0.4251023, -0.7759946, -3.72535, 1, 1, 1, 1, 1,
-0.4243886, 0.7999313, -0.8875384, 1, 1, 1, 1, 1,
-0.4225637, 0.8391324, -0.135155, 1, 1, 1, 1, 1,
-0.4184415, 1.828123, -0.6278023, 1, 1, 1, 1, 1,
-0.4174657, -0.5897584, 0.02054761, 1, 1, 1, 1, 1,
-0.4167755, -0.6929267, -2.608112, 1, 1, 1, 1, 1,
-0.4160262, 0.7163818, 2.227102, 1, 1, 1, 1, 1,
-0.4116803, -1.352525, -3.277633, 1, 1, 1, 1, 1,
-0.4094934, -0.7266906, -3.547736, 0, 0, 1, 1, 1,
-0.4072336, 0.2982689, -0.4110833, 1, 0, 0, 1, 1,
-0.4029992, 0.1589106, -0.524093, 1, 0, 0, 1, 1,
-0.4026725, 0.3315121, 0.3644538, 1, 0, 0, 1, 1,
-0.4017082, -0.04939337, -2.665876, 1, 0, 0, 1, 1,
-0.4004427, -0.5224004, -3.076025, 1, 0, 0, 1, 1,
-0.3972776, -1.1716, -3.557391, 0, 0, 0, 1, 1,
-0.3962526, 1.002105, -2.300455, 0, 0, 0, 1, 1,
-0.3950043, 0.6127752, 0.05240944, 0, 0, 0, 1, 1,
-0.3942827, -0.02544354, -0.6980135, 0, 0, 0, 1, 1,
-0.3923843, -1.45805, -2.072773, 0, 0, 0, 1, 1,
-0.3885971, 1.195936, -0.3199247, 0, 0, 0, 1, 1,
-0.3881833, 1.089046, 1.908658, 0, 0, 0, 1, 1,
-0.3877428, 0.05991457, -2.001146, 1, 1, 1, 1, 1,
-0.3874065, 0.8143885, 1.497535, 1, 1, 1, 1, 1,
-0.3807141, 1.963899, -1.065617, 1, 1, 1, 1, 1,
-0.3729615, 1.009226, -1.607356, 1, 1, 1, 1, 1,
-0.372184, 0.4064178, 0.07347625, 1, 1, 1, 1, 1,
-0.3694448, -0.008908097, -2.708307, 1, 1, 1, 1, 1,
-0.3661036, 0.1283755, -2.091425, 1, 1, 1, 1, 1,
-0.3640423, 1.169867, 0.22483, 1, 1, 1, 1, 1,
-0.3639843, -2.16978, -3.546932, 1, 1, 1, 1, 1,
-0.3614548, 1.760733, 0.5993275, 1, 1, 1, 1, 1,
-0.3601305, -0.5765054, -2.077022, 1, 1, 1, 1, 1,
-0.3588098, -0.08598754, -2.028251, 1, 1, 1, 1, 1,
-0.3533288, 0.2912514, 0.3959008, 1, 1, 1, 1, 1,
-0.3527634, 0.6025103, -1.956631, 1, 1, 1, 1, 1,
-0.3511104, 0.4103585, -0.8190365, 1, 1, 1, 1, 1,
-0.3508916, 1.032312, 0.8255333, 0, 0, 1, 1, 1,
-0.3441315, -0.1207618, -0.5210503, 1, 0, 0, 1, 1,
-0.3434051, -1.022783, -2.80501, 1, 0, 0, 1, 1,
-0.3385429, -1.59861, -2.717309, 1, 0, 0, 1, 1,
-0.3372806, -1.451407, -2.134364, 1, 0, 0, 1, 1,
-0.3369848, 0.6995296, -0.01916593, 1, 0, 0, 1, 1,
-0.3326764, 1.362379, -2.408875, 0, 0, 0, 1, 1,
-0.3317197, 1.132748, -1.128763, 0, 0, 0, 1, 1,
-0.3314024, 1.23161, -0.81194, 0, 0, 0, 1, 1,
-0.3282088, -0.9707235, -2.658843, 0, 0, 0, 1, 1,
-0.328005, -0.617, -2.990227, 0, 0, 0, 1, 1,
-0.3264287, -0.8625087, -3.215258, 0, 0, 0, 1, 1,
-0.3259262, -0.9841822, -2.270678, 0, 0, 0, 1, 1,
-0.3207339, 0.2700797, 0.5407278, 1, 1, 1, 1, 1,
-0.3205485, -0.3018414, -1.449417, 1, 1, 1, 1, 1,
-0.3188343, 0.97888, -0.9201828, 1, 1, 1, 1, 1,
-0.3133371, -0.8719988, -0.7161717, 1, 1, 1, 1, 1,
-0.3105131, -0.8611208, -1.724903, 1, 1, 1, 1, 1,
-0.3102463, -0.4778447, -2.637453, 1, 1, 1, 1, 1,
-0.3094521, -2.410354, -2.432135, 1, 1, 1, 1, 1,
-0.3045918, -1.848318, -4.097396, 1, 1, 1, 1, 1,
-0.3024661, -0.069158, -1.76195, 1, 1, 1, 1, 1,
-0.3015999, 0.9530184, 1.063828, 1, 1, 1, 1, 1,
-0.3001677, 0.7695059, -0.9225864, 1, 1, 1, 1, 1,
-0.2978688, -0.1726104, -2.116355, 1, 1, 1, 1, 1,
-0.2970555, 1.331222, -0.2339448, 1, 1, 1, 1, 1,
-0.2955374, -1.528256, -4.158741, 1, 1, 1, 1, 1,
-0.2887537, -0.002453849, -0.9555594, 1, 1, 1, 1, 1,
-0.2856319, -0.08492167, -2.542711, 0, 0, 1, 1, 1,
-0.2741972, 1.593983, -0.8808609, 1, 0, 0, 1, 1,
-0.2735982, -0.9896658, -3.994812, 1, 0, 0, 1, 1,
-0.2731417, 1.489317, -0.6892498, 1, 0, 0, 1, 1,
-0.2724595, 0.5386761, -0.9777843, 1, 0, 0, 1, 1,
-0.270421, -1.332477, -3.384219, 1, 0, 0, 1, 1,
-0.2693911, 0.3965912, 0.8949301, 0, 0, 0, 1, 1,
-0.2681361, 1.087242, -0.01197424, 0, 0, 0, 1, 1,
-0.2584449, 0.2644981, -0.3074185, 0, 0, 0, 1, 1,
-0.2566082, -0.6484593, -4.106086, 0, 0, 0, 1, 1,
-0.2561024, -0.4734356, -3.305415, 0, 0, 0, 1, 1,
-0.2560173, 1.742365, -0.9267732, 0, 0, 0, 1, 1,
-0.2542614, 0.2235231, -0.5613339, 0, 0, 0, 1, 1,
-0.2461814, -0.4385357, -3.24749, 1, 1, 1, 1, 1,
-0.2441421, 0.5422748, -1.2511, 1, 1, 1, 1, 1,
-0.2437109, -1.917089, -3.357366, 1, 1, 1, 1, 1,
-0.2417301, -0.1271315, -2.696585, 1, 1, 1, 1, 1,
-0.2335133, -0.1700411, -2.075224, 1, 1, 1, 1, 1,
-0.2280763, 0.2087239, -1.202491, 1, 1, 1, 1, 1,
-0.2215715, -0.489507, -2.924101, 1, 1, 1, 1, 1,
-0.2035275, 1.657059, -0.007606968, 1, 1, 1, 1, 1,
-0.2006547, -0.3439422, -1.642224, 1, 1, 1, 1, 1,
-0.2003026, -0.1284226, -1.687618, 1, 1, 1, 1, 1,
-0.1991218, -0.2377605, -0.4179718, 1, 1, 1, 1, 1,
-0.1975116, -0.4178014, -2.467061, 1, 1, 1, 1, 1,
-0.1954982, -0.9224764, -3.830811, 1, 1, 1, 1, 1,
-0.1902038, -0.4945548, -4.795912, 1, 1, 1, 1, 1,
-0.188784, -0.5134792, -3.614986, 1, 1, 1, 1, 1,
-0.1874014, -0.2646326, -4.37218, 0, 0, 1, 1, 1,
-0.1872798, -0.0308918, -1.312947, 1, 0, 0, 1, 1,
-0.1854338, -0.7726388, -0.09347535, 1, 0, 0, 1, 1,
-0.1853788, -1.438455, -2.790964, 1, 0, 0, 1, 1,
-0.183827, 1.070004, -0.3231305, 1, 0, 0, 1, 1,
-0.1802926, 1.302405, 1.937378, 1, 0, 0, 1, 1,
-0.1718158, -0.6087863, -2.297991, 0, 0, 0, 1, 1,
-0.1703249, 1.467228, -1.383231, 0, 0, 0, 1, 1,
-0.168373, 0.977834, -1.318422, 0, 0, 0, 1, 1,
-0.1664046, 0.2656083, -0.8690073, 0, 0, 0, 1, 1,
-0.165174, 1.413485, 0.05489621, 0, 0, 0, 1, 1,
-0.1620783, 0.1190842, -2.178102, 0, 0, 0, 1, 1,
-0.1617227, 0.2655404, -1.740926, 0, 0, 0, 1, 1,
-0.154484, 1.325587, -0.8282908, 1, 1, 1, 1, 1,
-0.1503112, 1.485393, 1.163572, 1, 1, 1, 1, 1,
-0.1462329, -0.8975567, -1.261053, 1, 1, 1, 1, 1,
-0.146161, -2.145747, -3.236369, 1, 1, 1, 1, 1,
-0.1431753, 1.386962, 0.6021388, 1, 1, 1, 1, 1,
-0.1420302, 1.269942, -0.1327585, 1, 1, 1, 1, 1,
-0.1356759, 2.626464, 0.6637343, 1, 1, 1, 1, 1,
-0.1329735, 1.251851, -0.1243004, 1, 1, 1, 1, 1,
-0.1326391, 1.177076, -0.2340672, 1, 1, 1, 1, 1,
-0.1299775, 1.342097, 0.7140802, 1, 1, 1, 1, 1,
-0.1298832, 1.100216, -0.06570009, 1, 1, 1, 1, 1,
-0.1288396, 0.2059763, -0.299417, 1, 1, 1, 1, 1,
-0.1208662, -0.3594857, -1.933779, 1, 1, 1, 1, 1,
-0.1180597, -0.08674276, -1.866834, 1, 1, 1, 1, 1,
-0.1166364, 0.7202471, 0.9566406, 1, 1, 1, 1, 1,
-0.1084271, 0.7883359, -2.052715, 0, 0, 1, 1, 1,
-0.1076586, 1.074533, 0.8499144, 1, 0, 0, 1, 1,
-0.1057125, -0.7539666, -2.516301, 1, 0, 0, 1, 1,
-0.104424, -1.366292, -3.734294, 1, 0, 0, 1, 1,
-0.09914713, 0.6876515, 1.204982, 1, 0, 0, 1, 1,
-0.09843036, -1.430338, -2.400353, 1, 0, 0, 1, 1,
-0.09803522, 0.6037629, 0.6011771, 0, 0, 0, 1, 1,
-0.09799484, -0.2069232, -2.397622, 0, 0, 0, 1, 1,
-0.09694959, 0.32774, -1.163082, 0, 0, 0, 1, 1,
-0.09639177, -1.676198, -3.487534, 0, 0, 0, 1, 1,
-0.09521083, 0.9354036, -0.6015602, 0, 0, 0, 1, 1,
-0.08842287, 0.04231993, -0.4395748, 0, 0, 0, 1, 1,
-0.08803848, -0.7925286, -4.349392, 0, 0, 0, 1, 1,
-0.08471561, -2.382721, -2.318977, 1, 1, 1, 1, 1,
-0.08457388, 0.6190636, 0.7521981, 1, 1, 1, 1, 1,
-0.08339242, 0.1106677, -2.243176, 1, 1, 1, 1, 1,
-0.08045944, -1.104367, -1.537459, 1, 1, 1, 1, 1,
-0.08037857, 0.6551813, -1.086034, 1, 1, 1, 1, 1,
-0.08034278, -0.2043575, -3.090757, 1, 1, 1, 1, 1,
-0.07289586, -1.255319, -1.807399, 1, 1, 1, 1, 1,
-0.06996586, -0.5853387, -3.812587, 1, 1, 1, 1, 1,
-0.06911464, -1.821249, -4.431354, 1, 1, 1, 1, 1,
-0.06631103, -0.726342, -2.368396, 1, 1, 1, 1, 1,
-0.0656253, 0.5804738, -2.165954, 1, 1, 1, 1, 1,
-0.06365272, 1.08497, 0.4106872, 1, 1, 1, 1, 1,
-0.06302883, 0.6109147, 0.497162, 1, 1, 1, 1, 1,
-0.06221879, -0.7866712, -1.157221, 1, 1, 1, 1, 1,
-0.05829225, -1.912811, -1.876989, 1, 1, 1, 1, 1,
-0.05810792, -0.07683407, -2.471027, 0, 0, 1, 1, 1,
-0.0581068, 0.1601272, -0.6970647, 1, 0, 0, 1, 1,
-0.05785213, -1.06094, -3.266357, 1, 0, 0, 1, 1,
-0.05582031, -1.415116, -3.114912, 1, 0, 0, 1, 1,
-0.05214887, 0.7781972, 1.21677, 1, 0, 0, 1, 1,
-0.04823937, 0.7438859, 0.08258753, 1, 0, 0, 1, 1,
-0.04688596, -2.816867, -2.713884, 0, 0, 0, 1, 1,
-0.04040776, -1.244367, -3.837071, 0, 0, 0, 1, 1,
-0.03801432, -0.5267246, -2.987104, 0, 0, 0, 1, 1,
-0.03702739, 0.1007999, 0.4860616, 0, 0, 0, 1, 1,
-0.03483899, -2.40936, -3.660815, 0, 0, 0, 1, 1,
-0.0339875, -0.2546572, -2.569515, 0, 0, 0, 1, 1,
-0.03029253, -0.2277251, -2.634297, 0, 0, 0, 1, 1,
-0.02717843, -1.36595, -3.565455, 1, 1, 1, 1, 1,
-0.02321391, 1.306068, -1.575398, 1, 1, 1, 1, 1,
-0.02125955, 1.125964, -0.08106277, 1, 1, 1, 1, 1,
-0.01780669, -2.885518, -2.450007, 1, 1, 1, 1, 1,
-0.01510596, -2.61131, -1.1951, 1, 1, 1, 1, 1,
-0.01427778, 0.1759595, -2.102974, 1, 1, 1, 1, 1,
-0.01370743, 0.3001519, 0.6008748, 1, 1, 1, 1, 1,
-0.01309222, 0.09912141, -1.176713, 1, 1, 1, 1, 1,
-0.01132092, 0.7013477, 0.249692, 1, 1, 1, 1, 1,
-0.007955721, -0.6488831, -2.66507, 1, 1, 1, 1, 1,
-0.00614194, 1.179149, -0.1932199, 1, 1, 1, 1, 1,
0.004605968, -0.04955003, 3.10726, 1, 1, 1, 1, 1,
0.009362979, 1.230581, 1.362826, 1, 1, 1, 1, 1,
0.01289359, -0.5373733, 3.402975, 1, 1, 1, 1, 1,
0.01291433, 1.185363, 0.9278227, 1, 1, 1, 1, 1,
0.01376912, 0.2163949, -0.1806276, 0, 0, 1, 1, 1,
0.01435146, -0.2377014, 1.30184, 1, 0, 0, 1, 1,
0.01656456, 0.6355787, 0.1620938, 1, 0, 0, 1, 1,
0.01823284, 0.2693394, 1.875996, 1, 0, 0, 1, 1,
0.02297976, 0.4770606, 2.186648, 1, 0, 0, 1, 1,
0.02396092, 0.3163075, -0.6325717, 1, 0, 0, 1, 1,
0.02675856, 0.6351601, -0.9258493, 0, 0, 0, 1, 1,
0.02690208, -1.54901, 1.110501, 0, 0, 0, 1, 1,
0.02770891, 0.06771202, 1.769649, 0, 0, 0, 1, 1,
0.03257808, 0.95489, 1.895586, 0, 0, 0, 1, 1,
0.03260568, 0.4279042, 1.216945, 0, 0, 0, 1, 1,
0.03741131, 1.152032, 1.197953, 0, 0, 0, 1, 1,
0.03763165, 0.08421276, 1.018402, 0, 0, 0, 1, 1,
0.03882046, -1.887331, 3.600332, 1, 1, 1, 1, 1,
0.0434145, 0.9770151, -1.729774, 1, 1, 1, 1, 1,
0.04466277, 0.8372763, 1.392091, 1, 1, 1, 1, 1,
0.04494286, 0.2533641, -0.4366734, 1, 1, 1, 1, 1,
0.05252122, 1.352287, 0.1462042, 1, 1, 1, 1, 1,
0.05486157, 0.8448966, -0.8884495, 1, 1, 1, 1, 1,
0.05740341, 0.7234342, 0.9855071, 1, 1, 1, 1, 1,
0.05788216, -0.6242052, 2.405839, 1, 1, 1, 1, 1,
0.05863471, -0.6427186, 3.151935, 1, 1, 1, 1, 1,
0.05907179, -0.1628213, 1.659936, 1, 1, 1, 1, 1,
0.06065685, 2.069027, 0.3408969, 1, 1, 1, 1, 1,
0.06227864, -0.5303668, 2.818162, 1, 1, 1, 1, 1,
0.06767282, -0.7770295, 2.852339, 1, 1, 1, 1, 1,
0.06773479, -0.5567213, 2.733764, 1, 1, 1, 1, 1,
0.06836487, -0.1283653, 1.115599, 1, 1, 1, 1, 1,
0.06920813, -1.856626, 1.731727, 0, 0, 1, 1, 1,
0.07123683, 0.07156628, 1.618605, 1, 0, 0, 1, 1,
0.07188015, -1.053322, 2.831599, 1, 0, 0, 1, 1,
0.07271486, -0.5672759, 3.510219, 1, 0, 0, 1, 1,
0.07568898, 0.340448, -0.6750606, 1, 0, 0, 1, 1,
0.07805372, -0.233265, 2.749306, 1, 0, 0, 1, 1,
0.07981498, -0.1237256, 3.890991, 0, 0, 0, 1, 1,
0.0832087, -1.575995, 2.282098, 0, 0, 0, 1, 1,
0.08820503, -2.345644, 1.237678, 0, 0, 0, 1, 1,
0.09231818, 0.8944011, 1.165065, 0, 0, 0, 1, 1,
0.09421326, 0.0279775, 2.39103, 0, 0, 0, 1, 1,
0.09541394, 0.8936322, 1.288334, 0, 0, 0, 1, 1,
0.09721738, 2.356035, -0.7218543, 0, 0, 0, 1, 1,
0.09816097, 0.5422928, -0.432895, 1, 1, 1, 1, 1,
0.1029624, 1.155379, -0.8882583, 1, 1, 1, 1, 1,
0.1077433, -0.4609558, 3.449082, 1, 1, 1, 1, 1,
0.1091052, 0.6226722, -1.493203, 1, 1, 1, 1, 1,
0.1092768, -0.524184, 4.065622, 1, 1, 1, 1, 1,
0.1131281, -0.9761164, 1.903869, 1, 1, 1, 1, 1,
0.1164457, 0.6356884, 0.1484022, 1, 1, 1, 1, 1,
0.1171669, 1.939001, 0.3493928, 1, 1, 1, 1, 1,
0.1235834, -1.333851, 2.457784, 1, 1, 1, 1, 1,
0.1240959, 1.043437, -0.3556526, 1, 1, 1, 1, 1,
0.1249784, 0.1501856, 0.7696468, 1, 1, 1, 1, 1,
0.1271466, -0.1174535, 1.169465, 1, 1, 1, 1, 1,
0.1311851, -0.09159669, 3.365027, 1, 1, 1, 1, 1,
0.1330387, -0.2008569, 3.174068, 1, 1, 1, 1, 1,
0.1349266, 0.3486042, 1.313259, 1, 1, 1, 1, 1,
0.1398965, -0.9535558, 3.900042, 0, 0, 1, 1, 1,
0.147563, -0.8384043, 4.445311, 1, 0, 0, 1, 1,
0.1497782, -1.943174, 0.6140228, 1, 0, 0, 1, 1,
0.1553784, -0.5216747, 3.777343, 1, 0, 0, 1, 1,
0.1567447, 1.324736, 1.03489, 1, 0, 0, 1, 1,
0.158793, 0.2169514, 0.6762867, 1, 0, 0, 1, 1,
0.1597524, 0.1139414, 1.628886, 0, 0, 0, 1, 1,
0.1669648, -0.02376237, 0.7703129, 0, 0, 0, 1, 1,
0.1693203, -0.5080231, 2.614006, 0, 0, 0, 1, 1,
0.1735254, -0.6140091, 2.867677, 0, 0, 0, 1, 1,
0.1762759, -0.9015416, 1.884782, 0, 0, 0, 1, 1,
0.1768826, 0.2243428, -0.4442306, 0, 0, 0, 1, 1,
0.1789243, 2.663074, -0.2542465, 0, 0, 0, 1, 1,
0.1835735, 0.468613, 0.4788803, 1, 1, 1, 1, 1,
0.1838565, 0.1151915, 2.223169, 1, 1, 1, 1, 1,
0.1850539, 0.7183152, 1.608597, 1, 1, 1, 1, 1,
0.1892019, -0.9805807, 1.222603, 1, 1, 1, 1, 1,
0.1920441, -1.311693, 3.063628, 1, 1, 1, 1, 1,
0.1921319, 1.021408, 0.152649, 1, 1, 1, 1, 1,
0.1931976, -0.5206372, 2.586422, 1, 1, 1, 1, 1,
0.211199, 0.1424102, -1.886141, 1, 1, 1, 1, 1,
0.2149906, -1.546264, 2.886002, 1, 1, 1, 1, 1,
0.2179769, 0.1427181, 1.902305, 1, 1, 1, 1, 1,
0.2223689, -0.6276175, 2.63972, 1, 1, 1, 1, 1,
0.2228447, 0.02228497, 3.105633, 1, 1, 1, 1, 1,
0.2300345, 0.4537301, 0.6458959, 1, 1, 1, 1, 1,
0.2347617, 1.500046, -2.346572, 1, 1, 1, 1, 1,
0.235193, 0.3338172, 1.689354, 1, 1, 1, 1, 1,
0.2353348, -1.219431, 2.189649, 0, 0, 1, 1, 1,
0.2393943, -0.9876382, 3.235024, 1, 0, 0, 1, 1,
0.2439797, 0.9633986, -0.5556627, 1, 0, 0, 1, 1,
0.2472537, -1.751545, 1.756542, 1, 0, 0, 1, 1,
0.2474688, -1.7656, 2.760414, 1, 0, 0, 1, 1,
0.2491089, -1.922856, 4.991873, 1, 0, 0, 1, 1,
0.251671, -2.264674, 2.856023, 0, 0, 0, 1, 1,
0.2544899, -1.003632, 2.820674, 0, 0, 0, 1, 1,
0.2566182, 1.200894, 2.081879, 0, 0, 0, 1, 1,
0.2573188, -0.9228696, 1.259834, 0, 0, 0, 1, 1,
0.2596074, 2.016751, 0.5864264, 0, 0, 0, 1, 1,
0.2709955, -0.5393573, 2.606685, 0, 0, 0, 1, 1,
0.2727565, -1.566283, 4.104365, 0, 0, 0, 1, 1,
0.2758319, 0.9172089, 0.7156103, 1, 1, 1, 1, 1,
0.2758465, -0.6305508, 1.188589, 1, 1, 1, 1, 1,
0.2771967, 0.03751121, 1.573857, 1, 1, 1, 1, 1,
0.2803942, 0.9082409, -0.6709785, 1, 1, 1, 1, 1,
0.2817738, -1.408669, 4.173087, 1, 1, 1, 1, 1,
0.2862007, 2.618858, 0.6378224, 1, 1, 1, 1, 1,
0.288281, 1.012494, -0.1257003, 1, 1, 1, 1, 1,
0.2886447, 0.01473755, 4.128369, 1, 1, 1, 1, 1,
0.2920883, -1.348387, 2.274011, 1, 1, 1, 1, 1,
0.2959038, -0.7840351, 2.870414, 1, 1, 1, 1, 1,
0.302125, -0.1291874, 1.72345, 1, 1, 1, 1, 1,
0.3064766, -1.170365, 3.713295, 1, 1, 1, 1, 1,
0.3076448, 0.8067346, 1.455648, 1, 1, 1, 1, 1,
0.315941, 0.9101067, -1.384046, 1, 1, 1, 1, 1,
0.325096, 0.3589015, 0.1530467, 1, 1, 1, 1, 1,
0.3307561, -0.6520317, 3.913685, 0, 0, 1, 1, 1,
0.3310807, -0.08874444, 2.8785, 1, 0, 0, 1, 1,
0.3334549, -1.078987, 3.272804, 1, 0, 0, 1, 1,
0.3335262, -0.1529577, 2.284117, 1, 0, 0, 1, 1,
0.3393421, -0.4570566, 3.648542, 1, 0, 0, 1, 1,
0.3403013, -0.5794068, 2.610539, 1, 0, 0, 1, 1,
0.3489005, -1.588143, 3.188977, 0, 0, 0, 1, 1,
0.3662328, 1.32122, -0.8289287, 0, 0, 0, 1, 1,
0.370699, 0.606368, -0.5503294, 0, 0, 0, 1, 1,
0.3716657, 0.02515811, 2.288081, 0, 0, 0, 1, 1,
0.3744072, 0.4763217, 1.170545, 0, 0, 0, 1, 1,
0.3756359, 1.088499, 1.507888, 0, 0, 0, 1, 1,
0.3771816, -1.03568, 0.5821223, 0, 0, 0, 1, 1,
0.3801585, -0.628256, 1.202352, 1, 1, 1, 1, 1,
0.3818186, 0.6791846, 0.1665199, 1, 1, 1, 1, 1,
0.3824884, -1.646495, 3.933877, 1, 1, 1, 1, 1,
0.3842047, -0.535023, 2.091025, 1, 1, 1, 1, 1,
0.3849311, -0.06260427, 1.883392, 1, 1, 1, 1, 1,
0.3865324, -1.751714, 4.620251, 1, 1, 1, 1, 1,
0.3903679, 1.188052, -1.055937, 1, 1, 1, 1, 1,
0.3917393, -0.3501016, 3.359676, 1, 1, 1, 1, 1,
0.3985581, 1.451622, 1.562553, 1, 1, 1, 1, 1,
0.4021737, -0.373636, 3.206098, 1, 1, 1, 1, 1,
0.4021994, -1.24003, 2.797043, 1, 1, 1, 1, 1,
0.4040565, -0.5432577, 4.757491, 1, 1, 1, 1, 1,
0.4049001, 0.7542231, 0.669792, 1, 1, 1, 1, 1,
0.4068685, 2.315157, 2.655877, 1, 1, 1, 1, 1,
0.4071158, -0.8346322, 4.432469, 1, 1, 1, 1, 1,
0.407312, -1.572093, 2.535071, 0, 0, 1, 1, 1,
0.4085813, 1.910219, -0.02907338, 1, 0, 0, 1, 1,
0.4104836, 2.770483, 0.8994544, 1, 0, 0, 1, 1,
0.4155999, -1.34781, 3.094616, 1, 0, 0, 1, 1,
0.4167675, -0.9112964, 3.524665, 1, 0, 0, 1, 1,
0.4183075, -0.07660744, 1.309031, 1, 0, 0, 1, 1,
0.4187994, 1.070754, 0.3754197, 0, 0, 0, 1, 1,
0.421489, 0.5631226, 1.489588, 0, 0, 0, 1, 1,
0.4228346, -0.8384093, 2.500105, 0, 0, 0, 1, 1,
0.4247996, -0.1206409, 1.22529, 0, 0, 0, 1, 1,
0.4270087, -0.2695848, 2.03026, 0, 0, 0, 1, 1,
0.4292344, -0.3228488, 0.9600755, 0, 0, 0, 1, 1,
0.4317698, -1.066814, 2.938848, 0, 0, 0, 1, 1,
0.4324406, 0.3356682, 1.222529, 1, 1, 1, 1, 1,
0.4333145, -0.5324674, 3.151123, 1, 1, 1, 1, 1,
0.4359483, 0.1554501, 3.815876, 1, 1, 1, 1, 1,
0.4369342, -0.7769562, 3.103201, 1, 1, 1, 1, 1,
0.4381464, -1.374173, 3.208443, 1, 1, 1, 1, 1,
0.4389893, 0.4479363, -0.8333166, 1, 1, 1, 1, 1,
0.4448356, -0.43348, 1.7663, 1, 1, 1, 1, 1,
0.4494033, -0.8811675, 3.348917, 1, 1, 1, 1, 1,
0.4554313, -0.1503299, 3.020926, 1, 1, 1, 1, 1,
0.4558411, 0.423475, 0.8596023, 1, 1, 1, 1, 1,
0.4580842, -2.185292, 1.260238, 1, 1, 1, 1, 1,
0.4605393, -0.6986065, 2.937246, 1, 1, 1, 1, 1,
0.4718788, -1.92281, 3.680949, 1, 1, 1, 1, 1,
0.4736296, 0.9693131, -2.223395, 1, 1, 1, 1, 1,
0.476065, -1.403833, 4.053126, 1, 1, 1, 1, 1,
0.4783088, -0.8402529, 2.706195, 0, 0, 1, 1, 1,
0.4822698, 1.999457, -0.070622, 1, 0, 0, 1, 1,
0.4844748, 0.9676816, 0.6743043, 1, 0, 0, 1, 1,
0.4863324, 0.7266385, 0.985394, 1, 0, 0, 1, 1,
0.4866667, 1.373786, 1.836036, 1, 0, 0, 1, 1,
0.4874201, -0.2117258, 2.665902, 1, 0, 0, 1, 1,
0.4877757, -0.9083462, 1.747807, 0, 0, 0, 1, 1,
0.488497, 0.6287738, -0.2961059, 0, 0, 0, 1, 1,
0.4956971, 0.7344379, 1.326976, 0, 0, 0, 1, 1,
0.4990106, 0.1591227, 1.020523, 0, 0, 0, 1, 1,
0.4997917, 1.54788, -0.7714365, 0, 0, 0, 1, 1,
0.5000166, 2.098579, 0.8950581, 0, 0, 0, 1, 1,
0.5001107, 0.0708892, 0.8849642, 0, 0, 0, 1, 1,
0.5022039, -1.235543, 2.315977, 1, 1, 1, 1, 1,
0.5063335, -2.667168, 1.950096, 1, 1, 1, 1, 1,
0.5127591, -0.8496647, 2.930407, 1, 1, 1, 1, 1,
0.5138853, 1.961246, 0.691277, 1, 1, 1, 1, 1,
0.5177132, -0.9278519, 0.9575154, 1, 1, 1, 1, 1,
0.5187703, -0.9911343, 2.269919, 1, 1, 1, 1, 1,
0.5249617, -1.467985, 2.621484, 1, 1, 1, 1, 1,
0.5315939, -0.4656331, 2.888603, 1, 1, 1, 1, 1,
0.531655, 1.363329, -1.035587, 1, 1, 1, 1, 1,
0.5348066, -0.07066758, 0.5277458, 1, 1, 1, 1, 1,
0.5368596, -1.555015, 2.215482, 1, 1, 1, 1, 1,
0.5471113, -0.8716942, 3.240377, 1, 1, 1, 1, 1,
0.5477862, 0.6488079, 0.6827939, 1, 1, 1, 1, 1,
0.5507528, -0.2844214, 0.54081, 1, 1, 1, 1, 1,
0.5527357, 0.6367305, 1.010067, 1, 1, 1, 1, 1,
0.554171, -0.5746271, 1.713984, 0, 0, 1, 1, 1,
0.5630091, -1.355739, 2.281045, 1, 0, 0, 1, 1,
0.5634117, -1.01973, 2.63277, 1, 0, 0, 1, 1,
0.5707765, -1.11294, 2.671162, 1, 0, 0, 1, 1,
0.5764204, -0.4652923, 1.68939, 1, 0, 0, 1, 1,
0.5985721, -0.5529285, 3.142796, 1, 0, 0, 1, 1,
0.6095653, 1.054278, 1.873621, 0, 0, 0, 1, 1,
0.6113592, -0.1843084, 0.4917605, 0, 0, 0, 1, 1,
0.6129495, 0.6119846, 1.548374, 0, 0, 0, 1, 1,
0.6132548, -1.299601, 3.363509, 0, 0, 0, 1, 1,
0.6133361, 1.463514, -0.2225043, 0, 0, 0, 1, 1,
0.6146202, 0.6658059, -0.375804, 0, 0, 0, 1, 1,
0.615207, 0.8207267, 0.6122112, 0, 0, 0, 1, 1,
0.6271836, -1.957129, 2.812746, 1, 1, 1, 1, 1,
0.6285556, -1.38383, 3.121666, 1, 1, 1, 1, 1,
0.6288847, 0.9025514, 0.6226732, 1, 1, 1, 1, 1,
0.630461, 0.529129, -0.4098845, 1, 1, 1, 1, 1,
0.6330735, -0.9054805, 1.156151, 1, 1, 1, 1, 1,
0.6356126, -0.47126, 4.317336, 1, 1, 1, 1, 1,
0.6385496, 1.200174, 0.4285541, 1, 1, 1, 1, 1,
0.6445975, -0.1702261, 2.429604, 1, 1, 1, 1, 1,
0.6494966, -0.2067122, 2.457213, 1, 1, 1, 1, 1,
0.6499002, -0.7087488, 2.652208, 1, 1, 1, 1, 1,
0.6517875, -0.8938205, 2.773825, 1, 1, 1, 1, 1,
0.6575459, -0.6410469, 2.258961, 1, 1, 1, 1, 1,
0.6651856, 0.9126474, 0.5124218, 1, 1, 1, 1, 1,
0.66544, -0.2858367, 0.3781179, 1, 1, 1, 1, 1,
0.6702822, -0.201437, 1.30418, 1, 1, 1, 1, 1,
0.670819, 1.102173, 0.07228603, 0, 0, 1, 1, 1,
0.6711236, 1.180047, 2.363472, 1, 0, 0, 1, 1,
0.6733699, 1.248315, 0.07214155, 1, 0, 0, 1, 1,
0.6795017, 1.641249, -0.01224998, 1, 0, 0, 1, 1,
0.6840836, 0.3922531, 1.920181, 1, 0, 0, 1, 1,
0.6884369, -0.2685517, 2.969465, 1, 0, 0, 1, 1,
0.6887881, -0.8747982, 3.578523, 0, 0, 0, 1, 1,
0.6903856, 0.1336568, 2.994202, 0, 0, 0, 1, 1,
0.690515, 0.03450379, 1.187104, 0, 0, 0, 1, 1,
0.6995835, -0.616495, 2.298658, 0, 0, 0, 1, 1,
0.7010524, -1.107954, 3.555788, 0, 0, 0, 1, 1,
0.7022257, 0.5356036, -1.202996, 0, 0, 0, 1, 1,
0.7056444, -0.5324585, 2.916832, 0, 0, 0, 1, 1,
0.7093241, 1.045031, 2.393084, 1, 1, 1, 1, 1,
0.7108659, 0.9411935, 0.0722635, 1, 1, 1, 1, 1,
0.7118538, -0.2962205, 1.498779, 1, 1, 1, 1, 1,
0.7141125, 0.7270392, 1.137491, 1, 1, 1, 1, 1,
0.7230315, -0.1276398, 1.718932, 1, 1, 1, 1, 1,
0.7247908, 0.4550054, -0.2129788, 1, 1, 1, 1, 1,
0.7314678, -0.3132221, 1.311421, 1, 1, 1, 1, 1,
0.7339272, -0.831547, 2.392927, 1, 1, 1, 1, 1,
0.7384157, 0.4559062, 1.082632, 1, 1, 1, 1, 1,
0.7392163, -0.5323518, 2.121608, 1, 1, 1, 1, 1,
0.7394819, -1.324744, 2.6047, 1, 1, 1, 1, 1,
0.7399062, 0.1152655, 2.24425, 1, 1, 1, 1, 1,
0.7459129, -1.954255, 3.644783, 1, 1, 1, 1, 1,
0.749118, 0.6101992, 1.491893, 1, 1, 1, 1, 1,
0.7519246, -0.4823431, 4.053626, 1, 1, 1, 1, 1,
0.7596219, 0.2294984, 1.647253, 0, 0, 1, 1, 1,
0.7596795, 2.327353, -0.2117296, 1, 0, 0, 1, 1,
0.7602535, -0.07047132, 2.598922, 1, 0, 0, 1, 1,
0.7604921, -0.4112658, 2.069281, 1, 0, 0, 1, 1,
0.7614605, 0.4458703, -0.2374014, 1, 0, 0, 1, 1,
0.7699401, 0.8954332, -0.6199161, 1, 0, 0, 1, 1,
0.771165, 0.05582576, 0.8470969, 0, 0, 0, 1, 1,
0.7717018, 0.3263537, 0.2707002, 0, 0, 0, 1, 1,
0.7784223, 0.8565874, -0.6174476, 0, 0, 0, 1, 1,
0.7904963, 0.2818596, 1.301586, 0, 0, 0, 1, 1,
0.8015838, 1.202974, 0.7813564, 0, 0, 0, 1, 1,
0.8047828, 1.032419, 2.22451, 0, 0, 0, 1, 1,
0.8083789, 1.459609, 0.1466026, 0, 0, 0, 1, 1,
0.8105754, 0.6580827, 2.603943, 1, 1, 1, 1, 1,
0.814023, 0.5186826, 1.724292, 1, 1, 1, 1, 1,
0.8152267, -0.1510143, 1.808948, 1, 1, 1, 1, 1,
0.8174415, 0.3697499, -0.8172237, 1, 1, 1, 1, 1,
0.8176942, 0.81451, -0.8392537, 1, 1, 1, 1, 1,
0.8188788, -0.2655419, 1.367579, 1, 1, 1, 1, 1,
0.8232846, 0.04332327, 0.6573877, 1, 1, 1, 1, 1,
0.823361, -0.1851293, 2.269301, 1, 1, 1, 1, 1,
0.8397705, -1.360447, 1.701458, 1, 1, 1, 1, 1,
0.8458815, 1.149989, 0.7446926, 1, 1, 1, 1, 1,
0.8491802, 0.5808232, 0.3135027, 1, 1, 1, 1, 1,
0.8541767, 0.9720455, 2.284451, 1, 1, 1, 1, 1,
0.8551416, -0.3807426, 0.5552097, 1, 1, 1, 1, 1,
0.8577171, -1.203653, 1.712444, 1, 1, 1, 1, 1,
0.8584917, 0.8453208, 1.803348, 1, 1, 1, 1, 1,
0.8592158, 0.01767848, 1.224834, 0, 0, 1, 1, 1,
0.8622689, -0.8107153, 1.169101, 1, 0, 0, 1, 1,
0.864657, -1.721618, 2.009114, 1, 0, 0, 1, 1,
0.8648583, -0.00888559, 2.1031, 1, 0, 0, 1, 1,
0.8650151, -0.6686162, 2.354542, 1, 0, 0, 1, 1,
0.8651346, 0.03777822, 1.186914, 1, 0, 0, 1, 1,
0.870644, 0.7992286, -0.2415055, 0, 0, 0, 1, 1,
0.8735272, 0.2603427, 2.02144, 0, 0, 0, 1, 1,
0.87508, 0.3150624, 2.331057, 0, 0, 0, 1, 1,
0.8768474, -1.32802, 3.62824, 0, 0, 0, 1, 1,
0.8782126, -1.051405, 1.761058, 0, 0, 0, 1, 1,
0.8783029, -1.535383, 3.079775, 0, 0, 0, 1, 1,
0.8929889, 0.4159271, 0.6906047, 0, 0, 0, 1, 1,
0.8966749, -0.0785071, 2.448585, 1, 1, 1, 1, 1,
0.8987547, 0.05847202, 2.05312, 1, 1, 1, 1, 1,
0.89984, -1.39691, 1.954146, 1, 1, 1, 1, 1,
0.9029109, -0.6769384, 0.8497815, 1, 1, 1, 1, 1,
0.9131471, -0.8891587, 1.339856, 1, 1, 1, 1, 1,
0.9162067, 0.9636915, 0.4307334, 1, 1, 1, 1, 1,
0.9269453, 1.988323, 1.814308, 1, 1, 1, 1, 1,
0.9282413, -0.962436, 2.35678, 1, 1, 1, 1, 1,
0.9283596, -1.029194, 2.197266, 1, 1, 1, 1, 1,
0.9288605, 0.1506724, 3.052142, 1, 1, 1, 1, 1,
0.9310447, -0.03327614, 0.6568673, 1, 1, 1, 1, 1,
0.9320492, 0.6471967, 2.612432, 1, 1, 1, 1, 1,
0.9349047, -1.997246, 3.075328, 1, 1, 1, 1, 1,
0.9372496, -0.04102136, 4.290793, 1, 1, 1, 1, 1,
0.943141, 0.1421435, 0.6393657, 1, 1, 1, 1, 1,
0.9434474, 1.427545, 1.65525, 0, 0, 1, 1, 1,
0.9486122, -3.241579, 2.392529, 1, 0, 0, 1, 1,
0.9568999, -1.191833, 2.511943, 1, 0, 0, 1, 1,
0.958073, -0.6579413, 4.379857, 1, 0, 0, 1, 1,
0.962311, 0.3685624, -0.1467684, 1, 0, 0, 1, 1,
0.9681359, -1.131687, 2.799082, 1, 0, 0, 1, 1,
0.9770503, -0.06174071, 2.18874, 0, 0, 0, 1, 1,
0.9810464, -0.1573868, 1.007707, 0, 0, 0, 1, 1,
0.984454, 1.060005, -0.9664494, 0, 0, 0, 1, 1,
0.9879029, -0.09633546, 2.37869, 0, 0, 0, 1, 1,
0.996171, -0.7624704, 0.9775055, 0, 0, 0, 1, 1,
0.9963588, -0.0069962, 3.041541, 0, 0, 0, 1, 1,
0.9995084, 1.945001, -2.339205, 0, 0, 0, 1, 1,
1.009862, -1.367449, 2.877556, 1, 1, 1, 1, 1,
1.010334, -0.3124591, 2.693415, 1, 1, 1, 1, 1,
1.016814, 0.8185331, 0.5920682, 1, 1, 1, 1, 1,
1.019568, -1.583662, 3.59551, 1, 1, 1, 1, 1,
1.02278, 0.1417721, 1.114702, 1, 1, 1, 1, 1,
1.022805, 0.4654744, 2.926609, 1, 1, 1, 1, 1,
1.023384, 0.05278537, 1.922468, 1, 1, 1, 1, 1,
1.027611, 0.03895174, 2.915022, 1, 1, 1, 1, 1,
1.029411, 0.4921287, 3.241532, 1, 1, 1, 1, 1,
1.031185, -0.2034533, 1.209537, 1, 1, 1, 1, 1,
1.034165, 0.9226894, 1.74944, 1, 1, 1, 1, 1,
1.035142, 2.213726, 1.421959, 1, 1, 1, 1, 1,
1.037716, 1.514116, 0.8117456, 1, 1, 1, 1, 1,
1.041184, -0.5415903, 3.776665, 1, 1, 1, 1, 1,
1.041744, -0.5301603, 1.845403, 1, 1, 1, 1, 1,
1.047905, -0.07874404, -0.4118802, 0, 0, 1, 1, 1,
1.06231, 0.5071424, 0.4159674, 1, 0, 0, 1, 1,
1.064509, 1.726217, -0.6534039, 1, 0, 0, 1, 1,
1.065428, 1.69668, 0.175993, 1, 0, 0, 1, 1,
1.068276, 0.9783931, 0.2945669, 1, 0, 0, 1, 1,
1.074937, 0.5920891, -0.3208168, 1, 0, 0, 1, 1,
1.078227, -2.12491, 2.248659, 0, 0, 0, 1, 1,
1.080479, 0.4167849, 1.265849, 0, 0, 0, 1, 1,
1.081522, -0.5378118, 3.786113, 0, 0, 0, 1, 1,
1.089837, -0.4155225, 2.064425, 0, 0, 0, 1, 1,
1.093476, 0.06693322, -0.6858408, 0, 0, 0, 1, 1,
1.099707, -1.691737, 1.756929, 0, 0, 0, 1, 1,
1.104312, 0.2827853, 2.264389, 0, 0, 0, 1, 1,
1.111764, -0.6478302, 1.495898, 1, 1, 1, 1, 1,
1.112283, 0.4161786, 1.404668, 1, 1, 1, 1, 1,
1.127115, 1.798146, -0.01902556, 1, 1, 1, 1, 1,
1.128778, 2.092005, 0.5439793, 1, 1, 1, 1, 1,
1.131555, -1.692985, 3.138634, 1, 1, 1, 1, 1,
1.13159, -0.6844983, 2.866727, 1, 1, 1, 1, 1,
1.136964, 0.845047, 0.5370577, 1, 1, 1, 1, 1,
1.137423, 1.317926, 2.016311, 1, 1, 1, 1, 1,
1.139286, -1.802544, 3.753835, 1, 1, 1, 1, 1,
1.140622, 0.5341832, 0.9204144, 1, 1, 1, 1, 1,
1.145667, 0.2666669, 2.049269, 1, 1, 1, 1, 1,
1.150464, -0.2675103, 1.864522, 1, 1, 1, 1, 1,
1.159905, 0.1280041, 0.1031808, 1, 1, 1, 1, 1,
1.173645, -0.80034, 1.819624, 1, 1, 1, 1, 1,
1.173866, -2.458937, 3.146952, 1, 1, 1, 1, 1,
1.174947, 0.5360939, 2.856602, 0, 0, 1, 1, 1,
1.175078, 0.8911833, 0.8933188, 1, 0, 0, 1, 1,
1.175572, -0.6316633, 1.83568, 1, 0, 0, 1, 1,
1.195294, 1.162207, -0.1178995, 1, 0, 0, 1, 1,
1.196513, 0.6385677, 0.8548258, 1, 0, 0, 1, 1,
1.198714, 1.537364, 0.6259018, 1, 0, 0, 1, 1,
1.200186, 0.4407697, 0.8763252, 0, 0, 0, 1, 1,
1.200668, -1.384678, 2.225384, 0, 0, 0, 1, 1,
1.203334, 1.486587, -1.123485, 0, 0, 0, 1, 1,
1.212509, -0.3030851, 1.727181, 0, 0, 0, 1, 1,
1.222976, -1.671317, 0.4953708, 0, 0, 0, 1, 1,
1.224918, 0.5102302, 1.94286, 0, 0, 0, 1, 1,
1.22593, 0.2833593, 0.5459642, 0, 0, 0, 1, 1,
1.234891, 1.662758, 0.9997695, 1, 1, 1, 1, 1,
1.235065, 0.7061791, 1.95616, 1, 1, 1, 1, 1,
1.240282, 0.2510648, 0.7779245, 1, 1, 1, 1, 1,
1.246062, 0.2372455, 1.146844, 1, 1, 1, 1, 1,
1.254829, -1.066696, 3.021182, 1, 1, 1, 1, 1,
1.257491, 1.457486, -0.2041493, 1, 1, 1, 1, 1,
1.277456, 0.7174402, 0.7408152, 1, 1, 1, 1, 1,
1.278625, 1.08267, 0.7112725, 1, 1, 1, 1, 1,
1.278912, -2.136824, 2.258268, 1, 1, 1, 1, 1,
1.279769, 0.174022, -0.7665687, 1, 1, 1, 1, 1,
1.281746, 0.09134306, 1.559768, 1, 1, 1, 1, 1,
1.2826, 0.8567188, 0.5657868, 1, 1, 1, 1, 1,
1.288996, 3.105002, 1.45741, 1, 1, 1, 1, 1,
1.290408, -2.133931, 1.301503, 1, 1, 1, 1, 1,
1.302856, 0.9100935, 1.718489, 1, 1, 1, 1, 1,
1.307755, 2.45332, 0.770839, 0, 0, 1, 1, 1,
1.313897, 0.3951438, 0.1420618, 1, 0, 0, 1, 1,
1.32322, -0.9076911, 2.317767, 1, 0, 0, 1, 1,
1.325414, 0.5337167, 2.397898, 1, 0, 0, 1, 1,
1.341918, 0.3933783, 1.028691, 1, 0, 0, 1, 1,
1.366275, 0.4504431, 1.600835, 1, 0, 0, 1, 1,
1.367672, -0.4368983, 1.806874, 0, 0, 0, 1, 1,
1.368807, 1.678116, 0.3255783, 0, 0, 0, 1, 1,
1.383548, 1.096421, 0.09134579, 0, 0, 0, 1, 1,
1.396266, -0.6463268, 1.838961, 0, 0, 0, 1, 1,
1.409846, -0.7592937, 2.923376, 0, 0, 0, 1, 1,
1.41832, 1.575533, 0.4580582, 0, 0, 0, 1, 1,
1.420433, -0.1043216, 1.523536, 0, 0, 0, 1, 1,
1.430865, -0.7958615, 2.013343, 1, 1, 1, 1, 1,
1.439643, 0.3271435, 1.592644, 1, 1, 1, 1, 1,
1.45032, 1.296775, 0.1482741, 1, 1, 1, 1, 1,
1.453543, 2.255311, 0.9965505, 1, 1, 1, 1, 1,
1.46088, 0.5842049, 0.7805974, 1, 1, 1, 1, 1,
1.48798, -1.133321, 2.33821, 1, 1, 1, 1, 1,
1.490107, -2.273458, 3.597583, 1, 1, 1, 1, 1,
1.495697, -0.721909, 1.799837, 1, 1, 1, 1, 1,
1.499535, 0.2695653, 1.202639, 1, 1, 1, 1, 1,
1.500463, 0.07863473, 1.207817, 1, 1, 1, 1, 1,
1.511159, 0.343238, 2.524315, 1, 1, 1, 1, 1,
1.515482, -0.055394, 0.4716242, 1, 1, 1, 1, 1,
1.52321, 0.4122387, -0.2625612, 1, 1, 1, 1, 1,
1.544962, -0.8201917, 1.308776, 1, 1, 1, 1, 1,
1.554223, 1.625925, 0.9318019, 1, 1, 1, 1, 1,
1.593489, 0.1020782, 0.4349665, 0, 0, 1, 1, 1,
1.613086, 0.1561914, -0.3462296, 1, 0, 0, 1, 1,
1.621225, -1.095986, 4.295457, 1, 0, 0, 1, 1,
1.624, -0.3345487, 2.010267, 1, 0, 0, 1, 1,
1.632562, 0.8278206, 1.309169, 1, 0, 0, 1, 1,
1.639377, 0.1006052, 0.962456, 1, 0, 0, 1, 1,
1.6464, -1.333805, 3.642372, 0, 0, 0, 1, 1,
1.656211, 0.9631608, 3.517359, 0, 0, 0, 1, 1,
1.666047, 0.1844201, 1.013688, 0, 0, 0, 1, 1,
1.671418, 0.2117172, 0.4008744, 0, 0, 0, 1, 1,
1.67372, -0.003831335, 0.003235141, 0, 0, 0, 1, 1,
1.679168, 0.2009717, 1.679292, 0, 0, 0, 1, 1,
1.67926, 0.4344176, 1.290816, 0, 0, 0, 1, 1,
1.685148, 0.6150798, 0.3318697, 1, 1, 1, 1, 1,
1.692563, 0.4455562, 1.877015, 1, 1, 1, 1, 1,
1.701651, 0.63518, 0.4940763, 1, 1, 1, 1, 1,
1.724417, 0.6192895, 1.442078, 1, 1, 1, 1, 1,
1.725512, 1.369509, 0.5113793, 1, 1, 1, 1, 1,
1.736652, 1.081391, -0.3536981, 1, 1, 1, 1, 1,
1.748313, -0.4788518, 2.781796, 1, 1, 1, 1, 1,
1.785219, 0.3176081, -0.5083922, 1, 1, 1, 1, 1,
1.801756, -0.2764293, 1.771391, 1, 1, 1, 1, 1,
1.813459, -1.545677, 4.084169, 1, 1, 1, 1, 1,
1.831614, -0.1278039, 2.729051, 1, 1, 1, 1, 1,
1.851624, 0.7083859, 1.340592, 1, 1, 1, 1, 1,
1.85863, 1.383774, 0.7468515, 1, 1, 1, 1, 1,
1.975999, 1.660785, -0.7183032, 1, 1, 1, 1, 1,
1.996373, -0.1462926, 2.146373, 1, 1, 1, 1, 1,
1.998235, -0.8801169, 2.606607, 0, 0, 1, 1, 1,
2.000226, 1.324093, 1.957917, 1, 0, 0, 1, 1,
2.024104, 0.2283205, 2.02994, 1, 0, 0, 1, 1,
2.094839, -0.6643449, 2.422143, 1, 0, 0, 1, 1,
2.103981, 0.562601, 1.607225, 1, 0, 0, 1, 1,
2.117103, 1.123042, -0.505172, 1, 0, 0, 1, 1,
2.159983, -0.2389627, 0.8616067, 0, 0, 0, 1, 1,
2.164876, -1.41476, 3.226062, 0, 0, 0, 1, 1,
2.175886, 0.2748114, 2.467254, 0, 0, 0, 1, 1,
2.248263, 0.6132485, 1.502733, 0, 0, 0, 1, 1,
2.250201, 0.2487844, 2.38081, 0, 0, 0, 1, 1,
2.335236, -1.334101, 2.368504, 0, 0, 0, 1, 1,
2.33547, 0.643703, 0.3709068, 0, 0, 0, 1, 1,
2.337609, 1.136153, 1.555636, 1, 1, 1, 1, 1,
2.354198, -0.8921638, 2.976962, 1, 1, 1, 1, 1,
2.363164, 1.330153, 0.4092442, 1, 1, 1, 1, 1,
2.520257, 0.3981219, 2.308451, 1, 1, 1, 1, 1,
2.522914, -0.636311, 2.099458, 1, 1, 1, 1, 1,
2.72027, -0.7051954, 0.2756845, 1, 1, 1, 1, 1,
3.50972, -0.136281, 1.108181, 1, 1, 1, 1, 1
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
var radius = 9.219777;
var distance = 32.38408;
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
mvMatrix.translate( -0.2556443, 0.0682888, -0.09798074 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.38408);
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
