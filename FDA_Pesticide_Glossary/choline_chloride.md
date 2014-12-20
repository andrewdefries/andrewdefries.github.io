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
-2.953936, 0.9758824, -3.102256, 1, 0, 0, 1,
-2.796126, -0.7006164, -2.211193, 1, 0.007843138, 0, 1,
-2.618975, 0.1854502, -2.944399, 1, 0.01176471, 0, 1,
-2.550132, -0.3241384, -0.8304497, 1, 0.01960784, 0, 1,
-2.542829, -1.361048, -2.54488, 1, 0.02352941, 0, 1,
-2.485157, 0.1311383, -3.300677, 1, 0.03137255, 0, 1,
-2.435179, 0.05036713, -3.35249, 1, 0.03529412, 0, 1,
-2.41238, 1.039195, -1.921337, 1, 0.04313726, 0, 1,
-2.390292, -1.041298, -1.179783, 1, 0.04705882, 0, 1,
-2.318975, 1.786964, -0.5323626, 1, 0.05490196, 0, 1,
-2.300554, 0.7054486, -1.901542, 1, 0.05882353, 0, 1,
-2.294703, -0.3839701, -1.793011, 1, 0.06666667, 0, 1,
-2.290339, 0.5975128, -0.7111734, 1, 0.07058824, 0, 1,
-2.256941, -2.207623, -0.7887968, 1, 0.07843138, 0, 1,
-2.256406, -0.4950599, 0.4414469, 1, 0.08235294, 0, 1,
-2.241075, 1.010643, -0.05708408, 1, 0.09019608, 0, 1,
-2.238995, -0.3419706, -2.252315, 1, 0.09411765, 0, 1,
-2.228076, -1.043747, -0.464579, 1, 0.1019608, 0, 1,
-2.19245, -1.26579, -2.994921, 1, 0.1098039, 0, 1,
-2.154732, 0.7345053, -0.7596582, 1, 0.1137255, 0, 1,
-2.129515, -0.9735631, -1.55733, 1, 0.1215686, 0, 1,
-2.125022, -0.1264598, -1.351719, 1, 0.1254902, 0, 1,
-2.124179, 0.4667235, -1.417343, 1, 0.1333333, 0, 1,
-2.085218, -0.9151708, -1.850874, 1, 0.1372549, 0, 1,
-2.074555, -0.5124, -1.379577, 1, 0.145098, 0, 1,
-2.041151, 0.5360252, -0.9287795, 1, 0.1490196, 0, 1,
-2.03953, 0.2892206, -0.8271944, 1, 0.1568628, 0, 1,
-2.025946, -0.3466139, -0.7575945, 1, 0.1607843, 0, 1,
-1.969444, -0.3260323, -2.866843, 1, 0.1686275, 0, 1,
-1.943463, 0.6315163, -0.2894674, 1, 0.172549, 0, 1,
-1.941183, 0.5576339, -0.7068574, 1, 0.1803922, 0, 1,
-1.937847, 0.483446, -2.951284, 1, 0.1843137, 0, 1,
-1.928555, 1.015075, -1.817912, 1, 0.1921569, 0, 1,
-1.926424, 1.008251, -1.85004, 1, 0.1960784, 0, 1,
-1.916125, -1.788134, -2.789828, 1, 0.2039216, 0, 1,
-1.907091, 1.143902, -1.710351, 1, 0.2117647, 0, 1,
-1.905006, -1.995563, -2.284574, 1, 0.2156863, 0, 1,
-1.898217, -0.1856984, -2.589607, 1, 0.2235294, 0, 1,
-1.887023, -0.6258117, -3.081153, 1, 0.227451, 0, 1,
-1.86553, 0.1791004, -1.064779, 1, 0.2352941, 0, 1,
-1.847546, -0.5418729, -2.162543, 1, 0.2392157, 0, 1,
-1.832925, -0.21537, -2.224273, 1, 0.2470588, 0, 1,
-1.82121, 0.2912973, -1.996709, 1, 0.2509804, 0, 1,
-1.813882, -1.364182, -0.1287741, 1, 0.2588235, 0, 1,
-1.787914, 0.4857521, -1.040593, 1, 0.2627451, 0, 1,
-1.785502, 1.454417, 0.2206162, 1, 0.2705882, 0, 1,
-1.783304, 1.095793, -1.151198, 1, 0.2745098, 0, 1,
-1.779903, 0.1899393, -1.247571, 1, 0.282353, 0, 1,
-1.728013, -0.4406758, -0.2479684, 1, 0.2862745, 0, 1,
-1.723061, -1.627988, -0.2293009, 1, 0.2941177, 0, 1,
-1.718097, -0.5285679, -0.3390641, 1, 0.3019608, 0, 1,
-1.716734, -0.9947936, -0.7351921, 1, 0.3058824, 0, 1,
-1.707012, -0.5587133, -1.379117, 1, 0.3137255, 0, 1,
-1.706924, -0.6373925, -2.616763, 1, 0.3176471, 0, 1,
-1.683843, -0.8193005, -3.011218, 1, 0.3254902, 0, 1,
-1.679611, -0.5601566, -2.129915, 1, 0.3294118, 0, 1,
-1.671585, 1.119868, 0.2117479, 1, 0.3372549, 0, 1,
-1.656008, 1.132099, 0.3089515, 1, 0.3411765, 0, 1,
-1.63831, -1.735322, -1.265687, 1, 0.3490196, 0, 1,
-1.625602, 0.481484, -2.568871, 1, 0.3529412, 0, 1,
-1.617181, -0.2809355, -1.304729, 1, 0.3607843, 0, 1,
-1.616346, -0.6198664, -2.189989, 1, 0.3647059, 0, 1,
-1.604931, -0.5861329, -3.047945, 1, 0.372549, 0, 1,
-1.602971, -0.7660728, -0.5927826, 1, 0.3764706, 0, 1,
-1.580984, -0.204085, -1.860977, 1, 0.3843137, 0, 1,
-1.577799, 1.040292, -2.146219, 1, 0.3882353, 0, 1,
-1.566748, -1.248913, -2.111778, 1, 0.3960784, 0, 1,
-1.565659, 1.346189, -0.7613127, 1, 0.4039216, 0, 1,
-1.554901, -1.564788, -1.615092, 1, 0.4078431, 0, 1,
-1.554323, -0.2498614, -2.180003, 1, 0.4156863, 0, 1,
-1.54069, 1.030535, -1.171034, 1, 0.4196078, 0, 1,
-1.540326, -0.1814934, -1.469916, 1, 0.427451, 0, 1,
-1.521584, 2.638538, -0.5103924, 1, 0.4313726, 0, 1,
-1.50358, 0.3083676, -1.047934, 1, 0.4392157, 0, 1,
-1.502114, 0.1752596, -0.7070726, 1, 0.4431373, 0, 1,
-1.49522, 1.441997, -1.077167, 1, 0.4509804, 0, 1,
-1.490459, 1.805824, -0.0215006, 1, 0.454902, 0, 1,
-1.478905, 1.203605, -0.8744634, 1, 0.4627451, 0, 1,
-1.473789, 0.350855, -1.465255, 1, 0.4666667, 0, 1,
-1.44762, -0.4081505, -1.66436, 1, 0.4745098, 0, 1,
-1.44639, -0.06768981, -0.9684246, 1, 0.4784314, 0, 1,
-1.446119, -2.353419, -4.290298, 1, 0.4862745, 0, 1,
-1.434812, 1.212841, 0.3844213, 1, 0.4901961, 0, 1,
-1.429014, 0.5564924, -2.8663, 1, 0.4980392, 0, 1,
-1.42259, 0.01758894, -2.257785, 1, 0.5058824, 0, 1,
-1.412138, 1.869798, 0.5906828, 1, 0.509804, 0, 1,
-1.396789, 0.7013062, -0.6006415, 1, 0.5176471, 0, 1,
-1.394598, 0.06819576, -1.56622, 1, 0.5215687, 0, 1,
-1.392072, 0.2479294, -1.560292, 1, 0.5294118, 0, 1,
-1.3795, 1.076513, -0.6050097, 1, 0.5333334, 0, 1,
-1.376611, -0.883092, -2.870375, 1, 0.5411765, 0, 1,
-1.368894, -0.07509685, -1.428871, 1, 0.5450981, 0, 1,
-1.368646, -1.322676, -2.08437, 1, 0.5529412, 0, 1,
-1.36423, 0.4699856, -0.2012599, 1, 0.5568628, 0, 1,
-1.361268, 1.728253, -0.7127033, 1, 0.5647059, 0, 1,
-1.349716, 0.5726515, -1.378305, 1, 0.5686275, 0, 1,
-1.34692, -0.2495444, -2.137076, 1, 0.5764706, 0, 1,
-1.343261, 0.5817565, 0.2407661, 1, 0.5803922, 0, 1,
-1.342506, 0.6335229, -2.368904, 1, 0.5882353, 0, 1,
-1.333533, -0.117954, -0.9769348, 1, 0.5921569, 0, 1,
-1.324916, -0.4859096, -2.493112, 1, 0.6, 0, 1,
-1.322785, 1.121257, -1.322244, 1, 0.6078432, 0, 1,
-1.30848, 0.1423278, -2.297247, 1, 0.6117647, 0, 1,
-1.303427, -1.856489, -4.280699, 1, 0.6196079, 0, 1,
-1.297616, -1.137463, -3.465512, 1, 0.6235294, 0, 1,
-1.296252, -1.867178, -2.617894, 1, 0.6313726, 0, 1,
-1.290582, 0.7265675, -1.058881, 1, 0.6352941, 0, 1,
-1.281916, 0.03081433, -2.828091, 1, 0.6431373, 0, 1,
-1.279759, 1.353604, 0.1690971, 1, 0.6470588, 0, 1,
-1.267318, -1.80813, -3.101902, 1, 0.654902, 0, 1,
-1.266163, -0.5078646, -1.303381, 1, 0.6588235, 0, 1,
-1.265158, -1.134827, -1.736575, 1, 0.6666667, 0, 1,
-1.25349, -0.6988207, -0.4158161, 1, 0.6705883, 0, 1,
-1.248321, 1.327994, -0.6853597, 1, 0.6784314, 0, 1,
-1.246694, 2.202948, 0.1724216, 1, 0.682353, 0, 1,
-1.243652, 2.242982, -1.487516, 1, 0.6901961, 0, 1,
-1.230778, -1.54257, -3.872462, 1, 0.6941177, 0, 1,
-1.22826, 2.201629, 0.4126328, 1, 0.7019608, 0, 1,
-1.220867, -2.075821, -0.9682924, 1, 0.7098039, 0, 1,
-1.220307, 1.037339, -0.6997851, 1, 0.7137255, 0, 1,
-1.219514, 0.5748197, 0.1745445, 1, 0.7215686, 0, 1,
-1.215852, -0.3979728, -1.809884, 1, 0.7254902, 0, 1,
-1.211979, 0.01534355, -2.1697, 1, 0.7333333, 0, 1,
-1.211052, -0.356887, -0.2211835, 1, 0.7372549, 0, 1,
-1.210535, 0.0881841, -1.685498, 1, 0.7450981, 0, 1,
-1.210254, 1.192441, -0.4602878, 1, 0.7490196, 0, 1,
-1.189421, -1.125844, -2.513568, 1, 0.7568628, 0, 1,
-1.189076, 1.044419, -0.3580564, 1, 0.7607843, 0, 1,
-1.171668, -0.007481895, -2.522141, 1, 0.7686275, 0, 1,
-1.166068, 0.1485564, -3.621001, 1, 0.772549, 0, 1,
-1.160582, -1.206729, -1.419833, 1, 0.7803922, 0, 1,
-1.159712, -0.8993894, -2.896954, 1, 0.7843137, 0, 1,
-1.144088, 1.324495, -1.215138, 1, 0.7921569, 0, 1,
-1.134456, 0.6719172, -0.2244387, 1, 0.7960784, 0, 1,
-1.134414, 1.497744, 0.4843633, 1, 0.8039216, 0, 1,
-1.132246, -0.586798, 0.5703803, 1, 0.8117647, 0, 1,
-1.130071, -0.2794748, -2.172579, 1, 0.8156863, 0, 1,
-1.122736, -0.415087, -2.522044, 1, 0.8235294, 0, 1,
-1.121214, 0.2604438, -2.024246, 1, 0.827451, 0, 1,
-1.112074, -1.696299, -3.815431, 1, 0.8352941, 0, 1,
-1.108411, -2.312216, -3.027739, 1, 0.8392157, 0, 1,
-1.108304, -0.1780639, -0.3450154, 1, 0.8470588, 0, 1,
-1.107192, 0.9002862, 0.2924902, 1, 0.8509804, 0, 1,
-1.106595, -1.222521, -2.027449, 1, 0.8588235, 0, 1,
-1.100624, -0.9162925, -2.081648, 1, 0.8627451, 0, 1,
-1.090408, 1.013386, 0.4754862, 1, 0.8705882, 0, 1,
-1.077663, -1.105645, -2.459915, 1, 0.8745098, 0, 1,
-1.075991, 1.141118, -0.2056484, 1, 0.8823529, 0, 1,
-1.075716, 0.4625689, -1.605417, 1, 0.8862745, 0, 1,
-1.075698, -0.8059161, -3.603633, 1, 0.8941177, 0, 1,
-1.071528, 0.5679753, -1.132746, 1, 0.8980392, 0, 1,
-1.065442, 0.5413184, -0.6460526, 1, 0.9058824, 0, 1,
-1.055772, -1.123639, -1.868831, 1, 0.9137255, 0, 1,
-1.044958, -0.6146066, -2.656354, 1, 0.9176471, 0, 1,
-1.038503, 1.93098, -0.5778567, 1, 0.9254902, 0, 1,
-1.035278, 1.159017, -1.891824, 1, 0.9294118, 0, 1,
-1.032985, 0.3785137, -0.9493181, 1, 0.9372549, 0, 1,
-1.031153, 0.711555, -2.591429, 1, 0.9411765, 0, 1,
-1.025535, -0.7354747, -0.7984451, 1, 0.9490196, 0, 1,
-1.020366, 0.7979004, -0.3961067, 1, 0.9529412, 0, 1,
-1.018209, 1.135859, 1.673846, 1, 0.9607843, 0, 1,
-1.016019, -1.228008, -3.90626, 1, 0.9647059, 0, 1,
-1.008923, 0.6926954, -3.625402, 1, 0.972549, 0, 1,
-1.008773, -1.649108, -2.990188, 1, 0.9764706, 0, 1,
-1.008164, -2.114733, -4.058208, 1, 0.9843137, 0, 1,
-1.000317, 0.2102942, -2.78691, 1, 0.9882353, 0, 1,
-0.9979273, 1.122091, -1.406946, 1, 0.9960784, 0, 1,
-0.9962222, -0.800721, -1.418483, 0.9960784, 1, 0, 1,
-0.9951251, -0.480354, -1.711447, 0.9921569, 1, 0, 1,
-0.9900256, -0.06041208, -2.097945, 0.9843137, 1, 0, 1,
-0.9849458, -1.391781, -2.409537, 0.9803922, 1, 0, 1,
-0.9799124, 1.099275, -0.5343387, 0.972549, 1, 0, 1,
-0.9779285, 0.1839919, 0.2556075, 0.9686275, 1, 0, 1,
-0.9694915, -1.797023, -2.489592, 0.9607843, 1, 0, 1,
-0.9619846, -1.849016, -2.530203, 0.9568627, 1, 0, 1,
-0.9583984, -2.555545, -2.130656, 0.9490196, 1, 0, 1,
-0.9525716, 0.4562109, 0.001581495, 0.945098, 1, 0, 1,
-0.9524667, 0.2216178, -1.686356, 0.9372549, 1, 0, 1,
-0.9514226, 0.4150476, -0.04386358, 0.9333333, 1, 0, 1,
-0.9461715, 0.252558, -0.628468, 0.9254902, 1, 0, 1,
-0.9447364, -0.584294, -0.378318, 0.9215686, 1, 0, 1,
-0.9425314, -0.07303603, -5.025171, 0.9137255, 1, 0, 1,
-0.9411121, 0.03824396, -1.033907, 0.9098039, 1, 0, 1,
-0.9351001, -0.7155104, -2.1747, 0.9019608, 1, 0, 1,
-0.9344667, -1.343494, -1.814887, 0.8941177, 1, 0, 1,
-0.9284903, -1.294802, -1.911949, 0.8901961, 1, 0, 1,
-0.9276178, -0.7456667, -2.09172, 0.8823529, 1, 0, 1,
-0.9233789, -1.548287, -2.263626, 0.8784314, 1, 0, 1,
-0.9189781, -0.5241821, -3.479639, 0.8705882, 1, 0, 1,
-0.9161466, -1.313059, -2.140027, 0.8666667, 1, 0, 1,
-0.9121755, -0.373245, -1.786919, 0.8588235, 1, 0, 1,
-0.9043272, -0.2821536, -1.074947, 0.854902, 1, 0, 1,
-0.9034371, -0.295284, -0.715626, 0.8470588, 1, 0, 1,
-0.9024396, -1.022719, -3.909982, 0.8431373, 1, 0, 1,
-0.8928602, 1.049457, -0.5294934, 0.8352941, 1, 0, 1,
-0.8917966, -0.7324124, -3.727119, 0.8313726, 1, 0, 1,
-0.8915976, -0.07420646, -1.37076, 0.8235294, 1, 0, 1,
-0.8910133, -0.7698268, -0.6998016, 0.8196079, 1, 0, 1,
-0.8881959, -1.133727, -2.249031, 0.8117647, 1, 0, 1,
-0.8873754, 0.9915907, 0.4221607, 0.8078431, 1, 0, 1,
-0.8831171, 0.09621505, 0.8785561, 0.8, 1, 0, 1,
-0.879055, 1.632655, -0.2410405, 0.7921569, 1, 0, 1,
-0.8788583, 0.2913919, -0.3467056, 0.7882353, 1, 0, 1,
-0.8763483, -1.388702, -2.114979, 0.7803922, 1, 0, 1,
-0.8661284, 0.614885, -2.142404, 0.7764706, 1, 0, 1,
-0.8609715, -0.2736582, -2.122953, 0.7686275, 1, 0, 1,
-0.8594587, -0.2038321, -1.979585, 0.7647059, 1, 0, 1,
-0.8581582, -0.3875193, -3.411639, 0.7568628, 1, 0, 1,
-0.8526781, 0.8937179, -3.338402, 0.7529412, 1, 0, 1,
-0.849121, -1.812478, -2.034685, 0.7450981, 1, 0, 1,
-0.8471529, 0.4214031, -2.341396, 0.7411765, 1, 0, 1,
-0.8300022, -0.5450407, -0.8555953, 0.7333333, 1, 0, 1,
-0.8292816, 2.038752, -0.08247317, 0.7294118, 1, 0, 1,
-0.8147669, -1.383234, -3.876307, 0.7215686, 1, 0, 1,
-0.8107978, -1.35261, -4.019266, 0.7176471, 1, 0, 1,
-0.8085658, 0.00513046, -3.077184, 0.7098039, 1, 0, 1,
-0.7981669, -1.065183, -3.228664, 0.7058824, 1, 0, 1,
-0.7969507, 0.8218691, -0.8066681, 0.6980392, 1, 0, 1,
-0.7959793, -0.9003775, -0.03886129, 0.6901961, 1, 0, 1,
-0.7941669, 1.982285, -1.78686, 0.6862745, 1, 0, 1,
-0.7928823, -0.4638275, -0.4234178, 0.6784314, 1, 0, 1,
-0.7870438, -0.9692427, -2.645927, 0.6745098, 1, 0, 1,
-0.7857555, -0.8286566, -2.65765, 0.6666667, 1, 0, 1,
-0.7831659, -1.359453, -1.987099, 0.6627451, 1, 0, 1,
-0.7737616, 0.297368, -2.900136, 0.654902, 1, 0, 1,
-0.7716881, -1.989618, -1.34723, 0.6509804, 1, 0, 1,
-0.7701849, 0.8709233, -0.4523102, 0.6431373, 1, 0, 1,
-0.7638184, -0.7064084, -0.6164104, 0.6392157, 1, 0, 1,
-0.7607465, -1.472642, -2.01712, 0.6313726, 1, 0, 1,
-0.7607285, 2.001043, -1.814052, 0.627451, 1, 0, 1,
-0.7583286, -0.5377178, -0.6993942, 0.6196079, 1, 0, 1,
-0.7524085, 0.2471448, -1.275565, 0.6156863, 1, 0, 1,
-0.7511045, 0.5986181, 0.6948818, 0.6078432, 1, 0, 1,
-0.7453409, 1.794165, -1.668062, 0.6039216, 1, 0, 1,
-0.7440071, -0.9177263, -3.07324, 0.5960785, 1, 0, 1,
-0.7430533, -1.420583, -4.875222, 0.5882353, 1, 0, 1,
-0.7427762, -0.6041265, -1.562975, 0.5843138, 1, 0, 1,
-0.7414062, 2.690204, 0.6000678, 0.5764706, 1, 0, 1,
-0.734712, -0.8570375, -0.3704432, 0.572549, 1, 0, 1,
-0.7343612, 0.776667, 0.8245984, 0.5647059, 1, 0, 1,
-0.7342147, 0.6058918, 0.09288771, 0.5607843, 1, 0, 1,
-0.7312192, -0.7135736, -3.380597, 0.5529412, 1, 0, 1,
-0.725207, -1.902376, -1.769644, 0.5490196, 1, 0, 1,
-0.7218544, -1.509956, -3.288479, 0.5411765, 1, 0, 1,
-0.7218258, 0.2522442, -3.41138, 0.5372549, 1, 0, 1,
-0.7182894, 0.278516, -0.8603405, 0.5294118, 1, 0, 1,
-0.7175796, 2.231208, -0.0001415357, 0.5254902, 1, 0, 1,
-0.7159433, 0.3994653, -0.1675251, 0.5176471, 1, 0, 1,
-0.7144865, 0.7550907, 0.3810804, 0.5137255, 1, 0, 1,
-0.7114331, 1.776553, 0.412169, 0.5058824, 1, 0, 1,
-0.7093251, 1.0487, -0.5510038, 0.5019608, 1, 0, 1,
-0.7018752, -0.08558396, -0.9568788, 0.4941176, 1, 0, 1,
-0.7006552, -0.2672068, -2.025825, 0.4862745, 1, 0, 1,
-0.6939186, 0.7138231, -1.135956, 0.4823529, 1, 0, 1,
-0.691878, 0.6009186, -1.517975, 0.4745098, 1, 0, 1,
-0.6889629, -0.6369491, -1.278671, 0.4705882, 1, 0, 1,
-0.6855924, -0.7417975, -2.064715, 0.4627451, 1, 0, 1,
-0.6851701, -0.6959293, -2.431993, 0.4588235, 1, 0, 1,
-0.6787624, -0.1424771, -1.638877, 0.4509804, 1, 0, 1,
-0.6743326, 1.03749, -0.8316531, 0.4470588, 1, 0, 1,
-0.6686352, -1.463727, -2.219029, 0.4392157, 1, 0, 1,
-0.6603512, -0.0549966, -1.09688, 0.4352941, 1, 0, 1,
-0.6581607, -0.2924229, -1.734108, 0.427451, 1, 0, 1,
-0.642068, -0.5167592, -3.00295, 0.4235294, 1, 0, 1,
-0.6354863, -0.8571625, -1.667795, 0.4156863, 1, 0, 1,
-0.6286623, -0.4491717, -3.049458, 0.4117647, 1, 0, 1,
-0.62683, -0.6242532, -2.161383, 0.4039216, 1, 0, 1,
-0.6265138, -0.5902493, -2.134935, 0.3960784, 1, 0, 1,
-0.6259454, 0.2957528, -1.728864, 0.3921569, 1, 0, 1,
-0.621394, -0.3095126, -1.622748, 0.3843137, 1, 0, 1,
-0.6191918, 0.2936487, -1.48725, 0.3803922, 1, 0, 1,
-0.6189682, 0.3660508, -1.645247, 0.372549, 1, 0, 1,
-0.6135473, 1.982874, -1.736126, 0.3686275, 1, 0, 1,
-0.6135194, -0.1801994, -2.019912, 0.3607843, 1, 0, 1,
-0.6123559, -0.01785986, -1.227581, 0.3568628, 1, 0, 1,
-0.6112583, -0.1103454, -1.85674, 0.3490196, 1, 0, 1,
-0.6092545, 1.265349, 1.445449, 0.345098, 1, 0, 1,
-0.608211, 0.2105263, -0.5607084, 0.3372549, 1, 0, 1,
-0.6056339, -1.618762, -3.182269, 0.3333333, 1, 0, 1,
-0.6045156, 0.24453, -0.2491462, 0.3254902, 1, 0, 1,
-0.6030686, -0.4902127, -2.913755, 0.3215686, 1, 0, 1,
-0.5985236, 1.154448, -0.11969, 0.3137255, 1, 0, 1,
-0.5906026, 0.6040734, -0.08054321, 0.3098039, 1, 0, 1,
-0.5891467, 1.315728, -1.61294, 0.3019608, 1, 0, 1,
-0.5846655, -1.182188, -4.016298, 0.2941177, 1, 0, 1,
-0.5827334, 0.5802703, -0.903959, 0.2901961, 1, 0, 1,
-0.5821694, 0.7384956, -0.5707451, 0.282353, 1, 0, 1,
-0.5796406, -1.503763, -3.703774, 0.2784314, 1, 0, 1,
-0.5795874, -0.5423522, -3.269235, 0.2705882, 1, 0, 1,
-0.5788641, 2.117966, -2.652327, 0.2666667, 1, 0, 1,
-0.5751705, -0.3931717, -1.543321, 0.2588235, 1, 0, 1,
-0.5734969, 0.9920525, 0.07399097, 0.254902, 1, 0, 1,
-0.5734458, 0.9572743, 0.1821315, 0.2470588, 1, 0, 1,
-0.5688286, 1.860153, -0.2572955, 0.2431373, 1, 0, 1,
-0.5685112, 0.95452, -0.6836323, 0.2352941, 1, 0, 1,
-0.5638357, 2.298501, -0.8118866, 0.2313726, 1, 0, 1,
-0.5597827, 0.01262249, -1.766762, 0.2235294, 1, 0, 1,
-0.5584885, -0.7069682, -2.190924, 0.2196078, 1, 0, 1,
-0.5562427, 0.8173167, 0.4089892, 0.2117647, 1, 0, 1,
-0.5481476, -0.3604992, -2.546117, 0.2078431, 1, 0, 1,
-0.5437797, -0.7657498, -2.487689, 0.2, 1, 0, 1,
-0.540783, -1.484843, -1.503576, 0.1921569, 1, 0, 1,
-0.536737, -1.435091, -2.153467, 0.1882353, 1, 0, 1,
-0.5284172, 0.8836575, 0.6836966, 0.1803922, 1, 0, 1,
-0.5253919, 0.8506569, -1.524631, 0.1764706, 1, 0, 1,
-0.5252436, -1.802061, -3.966935, 0.1686275, 1, 0, 1,
-0.5188519, -0.773977, 0.7009075, 0.1647059, 1, 0, 1,
-0.5144206, 1.002919, -1.338193, 0.1568628, 1, 0, 1,
-0.5119645, -0.3877469, -2.74591, 0.1529412, 1, 0, 1,
-0.5102682, 0.6138419, -1.174459, 0.145098, 1, 0, 1,
-0.5014209, 0.6956586, -0.6967531, 0.1411765, 1, 0, 1,
-0.4953118, 0.6843044, 0.8964967, 0.1333333, 1, 0, 1,
-0.4929049, -0.1885296, -2.041869, 0.1294118, 1, 0, 1,
-0.4871098, 0.9165265, -1.198784, 0.1215686, 1, 0, 1,
-0.4749172, -0.5206836, -3.056715, 0.1176471, 1, 0, 1,
-0.4727773, 1.263738, 0.1801898, 0.1098039, 1, 0, 1,
-0.4688244, -1.280514, -2.987653, 0.1058824, 1, 0, 1,
-0.4661754, 1.730227, 1.369984, 0.09803922, 1, 0, 1,
-0.4641422, 0.4101817, 0.1974595, 0.09019608, 1, 0, 1,
-0.460491, -1.187087, -1.916593, 0.08627451, 1, 0, 1,
-0.4574255, 0.573387, 0.3764355, 0.07843138, 1, 0, 1,
-0.4536712, 0.4235208, -0.3945987, 0.07450981, 1, 0, 1,
-0.4534735, -0.6403568, -2.647954, 0.06666667, 1, 0, 1,
-0.4437473, -0.4670134, -1.018344, 0.0627451, 1, 0, 1,
-0.4390252, -0.5151663, -4.043202, 0.05490196, 1, 0, 1,
-0.4365313, -0.1066766, -1.880855, 0.05098039, 1, 0, 1,
-0.435885, 0.5538185, 0.8455117, 0.04313726, 1, 0, 1,
-0.4355595, -0.8093824, -3.331705, 0.03921569, 1, 0, 1,
-0.4318893, 0.5531394, -0.3592889, 0.03137255, 1, 0, 1,
-0.4311139, -1.450179, -1.180433, 0.02745098, 1, 0, 1,
-0.4282725, -0.06281515, -3.393262, 0.01960784, 1, 0, 1,
-0.4238867, 1.119946, 0.5238639, 0.01568628, 1, 0, 1,
-0.4198849, -0.1765027, -1.903325, 0.007843138, 1, 0, 1,
-0.4186278, -0.30181, -1.729075, 0.003921569, 1, 0, 1,
-0.4171748, 1.881251, 1.14873, 0, 1, 0.003921569, 1,
-0.4158742, -1.428931, -3.239382, 0, 1, 0.01176471, 1,
-0.4137116, 0.83486, 0.2394118, 0, 1, 0.01568628, 1,
-0.40936, 2.261744, 0.8365366, 0, 1, 0.02352941, 1,
-0.4066068, 0.05544645, -0.4145498, 0, 1, 0.02745098, 1,
-0.4054844, -1.124894, -0.8466316, 0, 1, 0.03529412, 1,
-0.4049553, 1.413744, -0.08563767, 0, 1, 0.03921569, 1,
-0.39985, 0.6208289, -2.670887, 0, 1, 0.04705882, 1,
-0.3991713, -1.367206, -3.620177, 0, 1, 0.05098039, 1,
-0.3973873, 0.1362059, -3.53312, 0, 1, 0.05882353, 1,
-0.390828, -0.6715775, -1.074533, 0, 1, 0.0627451, 1,
-0.3888739, 0.9363872, -1.339056, 0, 1, 0.07058824, 1,
-0.386039, 1.043422, -0.9091018, 0, 1, 0.07450981, 1,
-0.3795965, 0.7096241, -0.9044097, 0, 1, 0.08235294, 1,
-0.3771496, -0.4218116, -2.021166, 0, 1, 0.08627451, 1,
-0.376899, -0.3290732, -1.918593, 0, 1, 0.09411765, 1,
-0.3699292, -0.990548, -0.1693937, 0, 1, 0.1019608, 1,
-0.3685063, 0.7034116, -2.756512, 0, 1, 0.1058824, 1,
-0.3667157, 0.2301783, -1.551693, 0, 1, 0.1137255, 1,
-0.3604896, -0.2095106, -1.605388, 0, 1, 0.1176471, 1,
-0.3577166, -0.6437655, -1.928503, 0, 1, 0.1254902, 1,
-0.3538817, -1.173142, 0.1949763, 0, 1, 0.1294118, 1,
-0.3503912, 0.02162414, -2.659027, 0, 1, 0.1372549, 1,
-0.3446765, 1.950437, 0.5936307, 0, 1, 0.1411765, 1,
-0.330705, 1.001813, -0.1936089, 0, 1, 0.1490196, 1,
-0.3300773, 1.149589, 1.26989, 0, 1, 0.1529412, 1,
-0.3288784, -0.5027447, -3.157119, 0, 1, 0.1607843, 1,
-0.3242507, 0.1219601, -0.4289469, 0, 1, 0.1647059, 1,
-0.3235183, -0.5774381, -3.757427, 0, 1, 0.172549, 1,
-0.315539, -0.3827477, -2.664387, 0, 1, 0.1764706, 1,
-0.3153151, 0.5531443, -0.5547177, 0, 1, 0.1843137, 1,
-0.3141065, 1.79754, 2.21159, 0, 1, 0.1882353, 1,
-0.3139736, 0.2842386, -0.88265, 0, 1, 0.1960784, 1,
-0.3118257, -0.7246321, -1.431491, 0, 1, 0.2039216, 1,
-0.3047979, -0.3350593, -0.6693004, 0, 1, 0.2078431, 1,
-0.3032304, -0.7673291, -4.221363, 0, 1, 0.2156863, 1,
-0.2978637, 1.722659, 0.6231793, 0, 1, 0.2196078, 1,
-0.2969733, -0.6857647, -1.832023, 0, 1, 0.227451, 1,
-0.2910323, -1.445128, -4.651059, 0, 1, 0.2313726, 1,
-0.2847722, -1.088286, -2.729162, 0, 1, 0.2392157, 1,
-0.2838631, -0.2946123, -3.048208, 0, 1, 0.2431373, 1,
-0.2779238, 0.364073, -0.2829908, 0, 1, 0.2509804, 1,
-0.2764443, -1.055277, -4.053021, 0, 1, 0.254902, 1,
-0.2730802, -0.657429, -3.080855, 0, 1, 0.2627451, 1,
-0.2708364, 1.76802, -0.859454, 0, 1, 0.2666667, 1,
-0.2697027, 0.01369212, -1.511197, 0, 1, 0.2745098, 1,
-0.2694387, -1.197636, -2.934059, 0, 1, 0.2784314, 1,
-0.269063, 0.1610807, -0.8938347, 0, 1, 0.2862745, 1,
-0.2661883, -0.6887366, -3.367387, 0, 1, 0.2901961, 1,
-0.2482498, 0.4602877, -0.4294218, 0, 1, 0.2980392, 1,
-0.247702, -0.5276374, -3.287175, 0, 1, 0.3058824, 1,
-0.2456238, -1.351015, -2.694974, 0, 1, 0.3098039, 1,
-0.2452496, 1.524842, -0.9049715, 0, 1, 0.3176471, 1,
-0.2432914, -0.2108905, -2.61536, 0, 1, 0.3215686, 1,
-0.2357664, 0.0657452, -0.08303513, 0, 1, 0.3294118, 1,
-0.2343895, 0.72755, -1.859015, 0, 1, 0.3333333, 1,
-0.2331693, -1.787391, -3.852654, 0, 1, 0.3411765, 1,
-0.2301722, -0.8956383, -2.419648, 0, 1, 0.345098, 1,
-0.2242145, -0.4918632, -2.4902, 0, 1, 0.3529412, 1,
-0.2241527, 1.07548, 1.122056, 0, 1, 0.3568628, 1,
-0.2218985, -0.5827963, -2.044435, 0, 1, 0.3647059, 1,
-0.2217249, 1.080614, -0.3605874, 0, 1, 0.3686275, 1,
-0.2178882, -0.2740103, -4.0979, 0, 1, 0.3764706, 1,
-0.2175598, -0.7540296, -2.238555, 0, 1, 0.3803922, 1,
-0.2146361, 0.1028863, -0.8436673, 0, 1, 0.3882353, 1,
-0.2100907, 0.2218598, -0.6292623, 0, 1, 0.3921569, 1,
-0.2093388, -0.5798055, -2.474702, 0, 1, 0.4, 1,
-0.2083962, -1.113523, -2.179061, 0, 1, 0.4078431, 1,
-0.2072462, -0.2340751, -2.706888, 0, 1, 0.4117647, 1,
-0.1986839, -0.8605835, -1.920419, 0, 1, 0.4196078, 1,
-0.1982736, 0.2055915, -0.5374832, 0, 1, 0.4235294, 1,
-0.1956629, -1.327233, -2.261878, 0, 1, 0.4313726, 1,
-0.1939056, 0.3203122, -1.915622, 0, 1, 0.4352941, 1,
-0.1874853, -2.120946, -2.090472, 0, 1, 0.4431373, 1,
-0.1849448, -1.896522, -2.568099, 0, 1, 0.4470588, 1,
-0.1631996, 0.08822193, 0.5710861, 0, 1, 0.454902, 1,
-0.1527745, 0.9914199, -1.839021, 0, 1, 0.4588235, 1,
-0.1448548, 1.173813, -1.836075, 0, 1, 0.4666667, 1,
-0.1430177, 1.351184, -0.4722321, 0, 1, 0.4705882, 1,
-0.1418132, 0.8612665, 0.116294, 0, 1, 0.4784314, 1,
-0.137822, -0.1110042, -0.3961594, 0, 1, 0.4823529, 1,
-0.1374945, 0.4366258, -0.395308, 0, 1, 0.4901961, 1,
-0.1350026, -0.8110766, -1.879503, 0, 1, 0.4941176, 1,
-0.1339251, -0.7391133, -5.690346, 0, 1, 0.5019608, 1,
-0.1314319, 0.05962077, -0.5308835, 0, 1, 0.509804, 1,
-0.1280507, -2.274169, -2.631427, 0, 1, 0.5137255, 1,
-0.1242255, 1.197978, 0.3471753, 0, 1, 0.5215687, 1,
-0.1218735, 0.426062, 1.003422, 0, 1, 0.5254902, 1,
-0.1205508, -0.7175301, -2.895778, 0, 1, 0.5333334, 1,
-0.1200222, 1.704885, 0.7267547, 0, 1, 0.5372549, 1,
-0.1167491, -2.296804, -4.755511, 0, 1, 0.5450981, 1,
-0.1120478, 0.2467923, -0.5946994, 0, 1, 0.5490196, 1,
-0.1074507, 0.4310242, -0.9300522, 0, 1, 0.5568628, 1,
-0.1067631, -2.003902, -1.626277, 0, 1, 0.5607843, 1,
-0.1066236, -2.107051, -3.974623, 0, 1, 0.5686275, 1,
-0.1052117, 0.6282197, 1.604241, 0, 1, 0.572549, 1,
-0.104572, 1.569221, 0.4808146, 0, 1, 0.5803922, 1,
-0.09754046, 0.3050306, 0.9236932, 0, 1, 0.5843138, 1,
-0.09594128, 0.4313355, 0.373786, 0, 1, 0.5921569, 1,
-0.09409792, -1.362685, -3.047853, 0, 1, 0.5960785, 1,
-0.08973857, 1.525584, 0.3002966, 0, 1, 0.6039216, 1,
-0.08789546, -1.428643, -4.275306, 0, 1, 0.6117647, 1,
-0.08741663, 1.321936, 0.2408796, 0, 1, 0.6156863, 1,
-0.08118122, -0.9767795, -5.265674, 0, 1, 0.6235294, 1,
-0.07949887, -0.7762731, -2.946769, 0, 1, 0.627451, 1,
-0.07764077, -0.07481637, -3.183529, 0, 1, 0.6352941, 1,
-0.07339272, 0.2661653, -0.7347687, 0, 1, 0.6392157, 1,
-0.07289154, 0.6161855, -1.171704, 0, 1, 0.6470588, 1,
-0.06970038, 0.4064037, -1.201319, 0, 1, 0.6509804, 1,
-0.06877156, -0.6309072, -2.726495, 0, 1, 0.6588235, 1,
-0.06523278, 0.4966529, 0.557251, 0, 1, 0.6627451, 1,
-0.06019637, -0.2087871, -4.427601, 0, 1, 0.6705883, 1,
-0.05463268, 0.995127, -0.7323064, 0, 1, 0.6745098, 1,
-0.05393695, -1.195341, -2.367365, 0, 1, 0.682353, 1,
-0.04963255, 0.7410812, -1.096312, 0, 1, 0.6862745, 1,
-0.04097316, -0.6331061, -3.348913, 0, 1, 0.6941177, 1,
-0.03996685, 0.9501061, 0.1976026, 0, 1, 0.7019608, 1,
-0.03940003, 0.4761389, 0.5017202, 0, 1, 0.7058824, 1,
-0.03820645, 1.260712, 1.710114, 0, 1, 0.7137255, 1,
-0.03749867, -1.686227, -3.668027, 0, 1, 0.7176471, 1,
-0.03511382, 0.3910351, -0.2713318, 0, 1, 0.7254902, 1,
-0.03227077, 1.120939, 0.1895685, 0, 1, 0.7294118, 1,
-0.03148204, 0.4920157, -0.2343549, 0, 1, 0.7372549, 1,
-0.03091811, -0.4233536, -3.682592, 0, 1, 0.7411765, 1,
-0.02904672, -0.3226293, -3.259741, 0, 1, 0.7490196, 1,
-0.02895708, 1.535644, 1.344009, 0, 1, 0.7529412, 1,
-0.02518236, -0.424244, -2.705598, 0, 1, 0.7607843, 1,
-0.02287744, 0.9834312, -0.4418164, 0, 1, 0.7647059, 1,
-0.0175873, 1.20456, -0.6659023, 0, 1, 0.772549, 1,
-0.01743837, 0.5302241, -2.111243, 0, 1, 0.7764706, 1,
-0.01646362, 0.3348244, 0.03431848, 0, 1, 0.7843137, 1,
-0.01150914, -1.128677, -3.891746, 0, 1, 0.7882353, 1,
-0.004932391, 1.491304, -0.3098468, 0, 1, 0.7960784, 1,
-0.004091104, 0.8285143, 0.5858618, 0, 1, 0.8039216, 1,
-0.003700396, -0.001098317, -1.882167, 0, 1, 0.8078431, 1,
-0.002933612, -1.041439, -3.116014, 0, 1, 0.8156863, 1,
-0.0007305536, 0.08436736, 2.335095, 0, 1, 0.8196079, 1,
0.001655205, 1.495756, -0.729046, 0, 1, 0.827451, 1,
0.002988008, -1.266925, 2.414718, 0, 1, 0.8313726, 1,
0.004937075, -0.3993067, 2.403909, 0, 1, 0.8392157, 1,
0.005211592, -0.1176443, 4.974581, 0, 1, 0.8431373, 1,
0.00700821, 1.408186, -0.1732291, 0, 1, 0.8509804, 1,
0.007093318, 0.2793843, -1.052489, 0, 1, 0.854902, 1,
0.007596054, -1.89693, 2.97326, 0, 1, 0.8627451, 1,
0.009409734, -1.781032, 4.733821, 0, 1, 0.8666667, 1,
0.01406293, 1.716509, 0.6777391, 0, 1, 0.8745098, 1,
0.01792975, -0.7932445, 1.855246, 0, 1, 0.8784314, 1,
0.0220113, 0.921176, 0.238596, 0, 1, 0.8862745, 1,
0.03546199, -0.506723, 2.616562, 0, 1, 0.8901961, 1,
0.03584031, -0.9613105, 4.340801, 0, 1, 0.8980392, 1,
0.03703225, -1.64042, 3.501688, 0, 1, 0.9058824, 1,
0.03769824, -0.3319319, 2.639421, 0, 1, 0.9098039, 1,
0.03791451, 1.048125, 0.3893462, 0, 1, 0.9176471, 1,
0.04027765, 1.027979, -1.200109, 0, 1, 0.9215686, 1,
0.04082631, 0.3140876, 0.4608721, 0, 1, 0.9294118, 1,
0.04150999, -1.360775, 1.849247, 0, 1, 0.9333333, 1,
0.04155885, -2.110402, 1.572811, 0, 1, 0.9411765, 1,
0.04203349, -1.328979, 2.852505, 0, 1, 0.945098, 1,
0.04499308, -0.9747338, 3.116314, 0, 1, 0.9529412, 1,
0.04580555, -0.2709327, 1.879703, 0, 1, 0.9568627, 1,
0.04643315, -1.156095, 2.061158, 0, 1, 0.9647059, 1,
0.04723427, 0.1688137, 1.105582, 0, 1, 0.9686275, 1,
0.0472464, -1.198028, 3.159797, 0, 1, 0.9764706, 1,
0.04949285, 1.056423, 0.07011662, 0, 1, 0.9803922, 1,
0.05471133, 0.756595, -0.5847789, 0, 1, 0.9882353, 1,
0.05679646, 0.1547051, 2.362115, 0, 1, 0.9921569, 1,
0.05834874, -0.1604752, 2.277452, 0, 1, 1, 1,
0.06123974, 0.7837676, -0.3496422, 0, 0.9921569, 1, 1,
0.06226591, -0.1314695, 2.049485, 0, 0.9882353, 1, 1,
0.0623839, 2.098183, -1.270682, 0, 0.9803922, 1, 1,
0.06557719, -0.1666759, 2.932156, 0, 0.9764706, 1, 1,
0.06821699, 0.3799118, 1.192074, 0, 0.9686275, 1, 1,
0.06873956, -1.629215, 2.892832, 0, 0.9647059, 1, 1,
0.06931362, -0.7736349, 2.774324, 0, 0.9568627, 1, 1,
0.07286005, -0.7101126, 3.250666, 0, 0.9529412, 1, 1,
0.07365753, -0.1940828, 3.147146, 0, 0.945098, 1, 1,
0.07402379, 0.2890219, 1.673781, 0, 0.9411765, 1, 1,
0.07481482, -0.9348899, 3.237453, 0, 0.9333333, 1, 1,
0.07828634, -0.5336396, 3.189331, 0, 0.9294118, 1, 1,
0.08573736, -0.491283, 4.696026, 0, 0.9215686, 1, 1,
0.08863873, 0.7188844, 0.4213876, 0, 0.9176471, 1, 1,
0.09015942, -0.2098491, 2.614675, 0, 0.9098039, 1, 1,
0.09727416, 1.430669, -1.006534, 0, 0.9058824, 1, 1,
0.09761482, 0.5546159, 1.400547, 0, 0.8980392, 1, 1,
0.1029386, -0.6329554, 4.391549, 0, 0.8901961, 1, 1,
0.1035619, 1.143569, -0.5296811, 0, 0.8862745, 1, 1,
0.1086602, -0.7607929, 3.925299, 0, 0.8784314, 1, 1,
0.1087284, 1.091613, 1.756363, 0, 0.8745098, 1, 1,
0.1129025, -0.9651471, 4.139728, 0, 0.8666667, 1, 1,
0.1129226, -0.5821875, 4.185307, 0, 0.8627451, 1, 1,
0.1139493, 0.8030184, -1.453986, 0, 0.854902, 1, 1,
0.1156519, -0.0691341, 1.346209, 0, 0.8509804, 1, 1,
0.116831, -0.8257872, 3.124894, 0, 0.8431373, 1, 1,
0.1221856, -0.5189023, 2.825409, 0, 0.8392157, 1, 1,
0.1238297, -0.3168575, 2.959964, 0, 0.8313726, 1, 1,
0.1250833, -0.5381529, 4.397578, 0, 0.827451, 1, 1,
0.1254952, 0.7003587, 1.462457, 0, 0.8196079, 1, 1,
0.1312941, 0.1697449, 1.634994, 0, 0.8156863, 1, 1,
0.1326031, 1.637375, 1.376068, 0, 0.8078431, 1, 1,
0.1334676, 2.242575, -0.579733, 0, 0.8039216, 1, 1,
0.1381733, 0.2469627, -0.2216603, 0, 0.7960784, 1, 1,
0.1408588, -0.6182302, 2.54816, 0, 0.7882353, 1, 1,
0.1418474, 0.2279803, 0.3751514, 0, 0.7843137, 1, 1,
0.1421866, -0.05435835, 1.776896, 0, 0.7764706, 1, 1,
0.1468908, 0.9973953, 0.9897442, 0, 0.772549, 1, 1,
0.1526037, -1.264541, 4.012536, 0, 0.7647059, 1, 1,
0.1536701, -0.2352289, 1.561312, 0, 0.7607843, 1, 1,
0.1594398, 0.1623934, -0.9161164, 0, 0.7529412, 1, 1,
0.1624886, 0.3048944, 1.601847, 0, 0.7490196, 1, 1,
0.1641553, 1.604057, -1.316589, 0, 0.7411765, 1, 1,
0.1683013, 0.2940159, 1.899212, 0, 0.7372549, 1, 1,
0.1713176, 0.1055962, -0.4630724, 0, 0.7294118, 1, 1,
0.1722461, -1.00765, 1.276577, 0, 0.7254902, 1, 1,
0.1726653, -1.144452, 1.961811, 0, 0.7176471, 1, 1,
0.172815, 1.180563, 0.03241711, 0, 0.7137255, 1, 1,
0.1732025, 1.105397, -0.8964491, 0, 0.7058824, 1, 1,
0.177454, 2.838688, -0.6934509, 0, 0.6980392, 1, 1,
0.1796138, 0.7133908, 1.194069, 0, 0.6941177, 1, 1,
0.186996, 0.5303018, -0.9782084, 0, 0.6862745, 1, 1,
0.1917265, -1.123509, 2.556331, 0, 0.682353, 1, 1,
0.1958805, 1.524477, 1.361412, 0, 0.6745098, 1, 1,
0.1962793, 1.209368, 0.5055275, 0, 0.6705883, 1, 1,
0.1966746, 0.08550967, 1.555729, 0, 0.6627451, 1, 1,
0.1968764, 1.355542, 0.458548, 0, 0.6588235, 1, 1,
0.1993263, -0.1538674, 4.043952, 0, 0.6509804, 1, 1,
0.2014714, 0.06194585, 2.098094, 0, 0.6470588, 1, 1,
0.2032402, -0.3231969, 2.339303, 0, 0.6392157, 1, 1,
0.2036102, -0.7855752, 3.279356, 0, 0.6352941, 1, 1,
0.2048624, 2.495404, 1.126188, 0, 0.627451, 1, 1,
0.2082855, 0.3670953, 1.451936, 0, 0.6235294, 1, 1,
0.2088727, 0.9704641, -1.112983, 0, 0.6156863, 1, 1,
0.2094946, 1.761908, -0.3969931, 0, 0.6117647, 1, 1,
0.210813, 0.6881342, 1.776707, 0, 0.6039216, 1, 1,
0.2128812, 0.411011, 1.038747, 0, 0.5960785, 1, 1,
0.2139559, -0.1861528, 1.737306, 0, 0.5921569, 1, 1,
0.2148267, 0.6107321, 1.773547, 0, 0.5843138, 1, 1,
0.2150391, -1.420289, 2.670187, 0, 0.5803922, 1, 1,
0.2180625, 1.673658, 1.951209, 0, 0.572549, 1, 1,
0.2234269, -1.453357, 3.174189, 0, 0.5686275, 1, 1,
0.223803, 1.16788, -0.4336982, 0, 0.5607843, 1, 1,
0.2254983, -2.519419, 1.204504, 0, 0.5568628, 1, 1,
0.2309769, 0.6746002, 1.209955, 0, 0.5490196, 1, 1,
0.2369056, -0.6796344, 2.694145, 0, 0.5450981, 1, 1,
0.2418341, -0.2181596, 2.340367, 0, 0.5372549, 1, 1,
0.2438964, -0.7591151, 2.947485, 0, 0.5333334, 1, 1,
0.2445621, 0.0978393, -0.07918983, 0, 0.5254902, 1, 1,
0.2567951, -0.7432162, 4.443328, 0, 0.5215687, 1, 1,
0.2600934, 0.797117, 0.2318311, 0, 0.5137255, 1, 1,
0.2629237, -0.2738699, 2.209143, 0, 0.509804, 1, 1,
0.2660571, -1.858471, 3.129125, 0, 0.5019608, 1, 1,
0.2665482, -1.665102, 2.844612, 0, 0.4941176, 1, 1,
0.2669895, -0.5553926, 1.288841, 0, 0.4901961, 1, 1,
0.2683047, -1.351965, 4.330062, 0, 0.4823529, 1, 1,
0.2685969, 0.7149774, -0.1640361, 0, 0.4784314, 1, 1,
0.2714915, -0.5426665, 3.514234, 0, 0.4705882, 1, 1,
0.2730096, 1.366652, -1.75516, 0, 0.4666667, 1, 1,
0.2746548, -2.184389, 2.649468, 0, 0.4588235, 1, 1,
0.2749802, 1.076924, 1.438285, 0, 0.454902, 1, 1,
0.2765657, 0.3872204, 2.585704, 0, 0.4470588, 1, 1,
0.2805432, 1.326455, -0.03276103, 0, 0.4431373, 1, 1,
0.2879162, 1.342903, 0.6660981, 0, 0.4352941, 1, 1,
0.2922212, 0.8263351, 1.018944, 0, 0.4313726, 1, 1,
0.2987841, 0.4550482, 1.150372, 0, 0.4235294, 1, 1,
0.2993395, 0.3814416, 2.381617, 0, 0.4196078, 1, 1,
0.301541, -0.5366756, 3.783182, 0, 0.4117647, 1, 1,
0.3034412, -1.64581, 2.424206, 0, 0.4078431, 1, 1,
0.3057318, 1.779388, -0.8015636, 0, 0.4, 1, 1,
0.3136826, -0.5037705, 2.475024, 0, 0.3921569, 1, 1,
0.3160817, -1.305225, 3.603016, 0, 0.3882353, 1, 1,
0.322503, 0.05408821, 2.3282, 0, 0.3803922, 1, 1,
0.3273394, 0.3581032, 1.627237, 0, 0.3764706, 1, 1,
0.3284162, 1.719786, 2.296976, 0, 0.3686275, 1, 1,
0.3299493, 0.7575099, 2.312936, 0, 0.3647059, 1, 1,
0.3356948, 0.3704436, -0.5725474, 0, 0.3568628, 1, 1,
0.3402695, 0.8048949, -1.117711, 0, 0.3529412, 1, 1,
0.3407582, -0.8284781, 2.532061, 0, 0.345098, 1, 1,
0.3451864, -0.5335057, 2.999365, 0, 0.3411765, 1, 1,
0.3520469, -0.9602591, 1.548918, 0, 0.3333333, 1, 1,
0.3536915, 1.300606, -0.8697864, 0, 0.3294118, 1, 1,
0.3582746, -0.7058247, 1.599059, 0, 0.3215686, 1, 1,
0.3623995, 1.588447, 0.2116197, 0, 0.3176471, 1, 1,
0.3652275, -1.232555, 3.305876, 0, 0.3098039, 1, 1,
0.3670065, 0.01598141, -0.4283077, 0, 0.3058824, 1, 1,
0.3699031, -0.5848245, 1.604657, 0, 0.2980392, 1, 1,
0.3716975, 0.8066711, 2.22172, 0, 0.2901961, 1, 1,
0.3734669, -0.1691428, 0.6658292, 0, 0.2862745, 1, 1,
0.3735726, 1.053813, 1.854141, 0, 0.2784314, 1, 1,
0.3746257, 0.4862555, -0.1747547, 0, 0.2745098, 1, 1,
0.3749021, -0.9731306, 2.603911, 0, 0.2666667, 1, 1,
0.3760747, -0.05000241, 3.401266, 0, 0.2627451, 1, 1,
0.378811, -0.9479979, 4.615382, 0, 0.254902, 1, 1,
0.3799853, -0.1334221, -0.3506939, 0, 0.2509804, 1, 1,
0.3810036, 0.2654202, 1.401004, 0, 0.2431373, 1, 1,
0.3834173, 0.3730955, -0.08846644, 0, 0.2392157, 1, 1,
0.3854138, -0.4534504, 3.33372, 0, 0.2313726, 1, 1,
0.3903544, -0.3781553, 3.690988, 0, 0.227451, 1, 1,
0.3912072, -0.1400745, 2.09043, 0, 0.2196078, 1, 1,
0.3944498, -0.939909, 2.558044, 0, 0.2156863, 1, 1,
0.3971648, 1.301852, 0.8353716, 0, 0.2078431, 1, 1,
0.3973665, -0.818123, 4.346432, 0, 0.2039216, 1, 1,
0.3974842, 0.5402464, -0.6484424, 0, 0.1960784, 1, 1,
0.3989408, 0.4550792, 3.744438, 0, 0.1882353, 1, 1,
0.4006152, -0.284015, 3.610751, 0, 0.1843137, 1, 1,
0.4010305, 0.2846015, 0.3109111, 0, 0.1764706, 1, 1,
0.4028086, -1.14428, 2.727965, 0, 0.172549, 1, 1,
0.4054012, 0.7129336, 0.4824693, 0, 0.1647059, 1, 1,
0.406942, 0.199511, 2.064618, 0, 0.1607843, 1, 1,
0.4121579, 0.704565, -1.463647, 0, 0.1529412, 1, 1,
0.4148709, 0.2434059, 3.459139, 0, 0.1490196, 1, 1,
0.4149608, 0.1668524, 0.6123104, 0, 0.1411765, 1, 1,
0.4153827, -1.863659, 2.458011, 0, 0.1372549, 1, 1,
0.4160233, -0.5782821, 3.591707, 0, 0.1294118, 1, 1,
0.4197748, 0.06429077, 2.94841, 0, 0.1254902, 1, 1,
0.4203929, -0.1844324, 1.374011, 0, 0.1176471, 1, 1,
0.4211294, 0.5432089, 1.254648, 0, 0.1137255, 1, 1,
0.4219752, -0.02754585, 2.170237, 0, 0.1058824, 1, 1,
0.4242277, 0.06571743, 1.815261, 0, 0.09803922, 1, 1,
0.424576, 1.349805, -1.40217, 0, 0.09411765, 1, 1,
0.4256839, 0.8522361, 1.393523, 0, 0.08627451, 1, 1,
0.4281388, 0.2731534, 2.084934, 0, 0.08235294, 1, 1,
0.4305573, 0.8244247, -0.3161877, 0, 0.07450981, 1, 1,
0.4339703, 2.045182, 1.35835, 0, 0.07058824, 1, 1,
0.4361959, 0.428193, -0.915786, 0, 0.0627451, 1, 1,
0.4376647, -0.3978573, 2.197819, 0, 0.05882353, 1, 1,
0.4404637, 0.06089621, 2.942093, 0, 0.05098039, 1, 1,
0.4407701, -0.07041005, 1.7073, 0, 0.04705882, 1, 1,
0.442057, -0.3246121, 1.550476, 0, 0.03921569, 1, 1,
0.4420668, -1.295863, 3.546968, 0, 0.03529412, 1, 1,
0.442266, 0.009629745, 1.833407, 0, 0.02745098, 1, 1,
0.4445344, -0.6959838, 2.810268, 0, 0.02352941, 1, 1,
0.4467502, 0.1596355, 2.046835, 0, 0.01568628, 1, 1,
0.4510172, -0.8883682, 2.337381, 0, 0.01176471, 1, 1,
0.4559133, -0.247962, 1.008309, 0, 0.003921569, 1, 1,
0.4561606, -0.4187985, 4.485915, 0.003921569, 0, 1, 1,
0.4620563, 0.741303, 0.6172672, 0.007843138, 0, 1, 1,
0.4620867, -1.800569, 3.090534, 0.01568628, 0, 1, 1,
0.4621044, -1.988172, 1.786705, 0.01960784, 0, 1, 1,
0.463915, -0.4532661, 1.780987, 0.02745098, 0, 1, 1,
0.464509, -0.002745846, 3.99664, 0.03137255, 0, 1, 1,
0.4665391, 1.574548, 0.6357704, 0.03921569, 0, 1, 1,
0.4679143, -0.1280733, 2.861845, 0.04313726, 0, 1, 1,
0.4697548, -0.13832, 1.270945, 0.05098039, 0, 1, 1,
0.4798417, -1.381172, 3.133802, 0.05490196, 0, 1, 1,
0.4810309, -0.4190223, 3.65751, 0.0627451, 0, 1, 1,
0.4880979, 1.246246, -1.798757, 0.06666667, 0, 1, 1,
0.4922635, 0.7679783, -0.9965462, 0.07450981, 0, 1, 1,
0.495543, -0.06051335, 1.274663, 0.07843138, 0, 1, 1,
0.4966105, -0.5021459, 3.372476, 0.08627451, 0, 1, 1,
0.5050191, -0.5059472, 1.99727, 0.09019608, 0, 1, 1,
0.5110629, 1.128031, 1.735357, 0.09803922, 0, 1, 1,
0.5133677, -1.230854, 2.5771, 0.1058824, 0, 1, 1,
0.5152051, 1.346883, 0.2416878, 0.1098039, 0, 1, 1,
0.5169528, -2.209263, 2.864273, 0.1176471, 0, 1, 1,
0.5171372, -0.765277, 2.205284, 0.1215686, 0, 1, 1,
0.5312041, 2.763642, 1.316951, 0.1294118, 0, 1, 1,
0.5330571, 0.8129203, 1.940161, 0.1333333, 0, 1, 1,
0.5335388, 0.3656602, 0.5658796, 0.1411765, 0, 1, 1,
0.5379039, 0.7835253, 0.584509, 0.145098, 0, 1, 1,
0.538395, 0.3376239, 0.5644394, 0.1529412, 0, 1, 1,
0.5409288, -0.9686312, 1.065805, 0.1568628, 0, 1, 1,
0.5412298, 1.341935, -1.509485, 0.1647059, 0, 1, 1,
0.5445796, 0.4486563, 0.7291983, 0.1686275, 0, 1, 1,
0.5458223, -0.2830307, 0.9066013, 0.1764706, 0, 1, 1,
0.5476995, -2.282094, 3.911468, 0.1803922, 0, 1, 1,
0.5494664, 0.5256284, 1.414347, 0.1882353, 0, 1, 1,
0.5517833, -1.501636, 0.9570176, 0.1921569, 0, 1, 1,
0.5523342, 0.8492112, -0.9234283, 0.2, 0, 1, 1,
0.5552794, 0.3198969, 2.195915, 0.2078431, 0, 1, 1,
0.5624935, -0.6268016, 3.001685, 0.2117647, 0, 1, 1,
0.5684689, 0.1764174, -0.09003413, 0.2196078, 0, 1, 1,
0.579711, 0.2315182, 1.237347, 0.2235294, 0, 1, 1,
0.580948, -1.089469, 2.463491, 0.2313726, 0, 1, 1,
0.5868585, -0.1383691, 1.368304, 0.2352941, 0, 1, 1,
0.5869058, 0.8036616, -0.6986731, 0.2431373, 0, 1, 1,
0.5880544, 0.4729401, 2.573596, 0.2470588, 0, 1, 1,
0.5896857, 0.2880452, 0.02629768, 0.254902, 0, 1, 1,
0.5948361, -0.2486474, 3.097945, 0.2588235, 0, 1, 1,
0.5957018, -0.1405654, 1.544767, 0.2666667, 0, 1, 1,
0.5989517, -1.106238, 3.669234, 0.2705882, 0, 1, 1,
0.6076871, -0.2034518, 2.803024, 0.2784314, 0, 1, 1,
0.6099532, 0.4223635, 1.694162, 0.282353, 0, 1, 1,
0.6182986, 0.5809748, 0.7436489, 0.2901961, 0, 1, 1,
0.6190679, 0.48871, 1.870963, 0.2941177, 0, 1, 1,
0.619136, 1.212423, 0.4132032, 0.3019608, 0, 1, 1,
0.6250402, 1.641715, 0.005762387, 0.3098039, 0, 1, 1,
0.6274891, 0.1058675, 1.438092, 0.3137255, 0, 1, 1,
0.628979, 0.6756149, 2.665558, 0.3215686, 0, 1, 1,
0.6301385, 1.489234, -0.7013977, 0.3254902, 0, 1, 1,
0.633303, 2.595572, -1.601578, 0.3333333, 0, 1, 1,
0.6357882, 0.012176, 1.667659, 0.3372549, 0, 1, 1,
0.6364884, 1.902275, 1.254691, 0.345098, 0, 1, 1,
0.6417949, 0.7353216, 0.5856856, 0.3490196, 0, 1, 1,
0.6420234, -1.356886, 3.410536, 0.3568628, 0, 1, 1,
0.6420651, 1.618968, 0.8669955, 0.3607843, 0, 1, 1,
0.643878, -0.2652504, 2.073062, 0.3686275, 0, 1, 1,
0.649025, 0.873157, 0.0127056, 0.372549, 0, 1, 1,
0.6546971, 0.3176757, 1.549893, 0.3803922, 0, 1, 1,
0.6547346, 0.04660206, 2.483534, 0.3843137, 0, 1, 1,
0.6577796, -1.249075, 3.798376, 0.3921569, 0, 1, 1,
0.659451, -2.248711, 3.001248, 0.3960784, 0, 1, 1,
0.6675116, -1.061209, 2.306305, 0.4039216, 0, 1, 1,
0.6690491, 2.610734, 2.258594, 0.4117647, 0, 1, 1,
0.6743503, -0.7492691, 3.684887, 0.4156863, 0, 1, 1,
0.6774737, -0.6262102, 2.591938, 0.4235294, 0, 1, 1,
0.6791871, 0.8946554, 2.679915, 0.427451, 0, 1, 1,
0.6805894, -1.810187, 2.543656, 0.4352941, 0, 1, 1,
0.6812423, 0.8367496, -0.6658323, 0.4392157, 0, 1, 1,
0.6848403, 1.055251, 0.1455225, 0.4470588, 0, 1, 1,
0.6928515, -1.652916, 0.5928467, 0.4509804, 0, 1, 1,
0.6960496, -0.02810628, 2.034731, 0.4588235, 0, 1, 1,
0.6978397, -0.5413072, 2.3586, 0.4627451, 0, 1, 1,
0.6982463, -0.3501307, 0.01697615, 0.4705882, 0, 1, 1,
0.7035212, 0.2512607, 1.350953, 0.4745098, 0, 1, 1,
0.7062672, -0.4363331, 3.248157, 0.4823529, 0, 1, 1,
0.7121443, -0.9057462, 1.526932, 0.4862745, 0, 1, 1,
0.7136898, 0.4612368, 0.3109112, 0.4941176, 0, 1, 1,
0.7148188, -0.4736709, 2.496529, 0.5019608, 0, 1, 1,
0.7258977, -2.285357, 3.464394, 0.5058824, 0, 1, 1,
0.7274507, -1.128328, 1.728599, 0.5137255, 0, 1, 1,
0.7285222, -0.1218436, 2.935867, 0.5176471, 0, 1, 1,
0.7292334, 0.9411349, -1.099805, 0.5254902, 0, 1, 1,
0.7331601, -0.1981934, 0.9991838, 0.5294118, 0, 1, 1,
0.7337866, 0.09594686, 0.7250589, 0.5372549, 0, 1, 1,
0.744898, 0.9305543, 0.8183349, 0.5411765, 0, 1, 1,
0.7496195, -0.7879099, 1.733959, 0.5490196, 0, 1, 1,
0.7532234, 1.115973, 2.393107, 0.5529412, 0, 1, 1,
0.7546896, -1.127258, 1.773809, 0.5607843, 0, 1, 1,
0.7564533, -1.524611, 2.945699, 0.5647059, 0, 1, 1,
0.7614629, -0.8908974, 2.807857, 0.572549, 0, 1, 1,
0.7662739, -1.500871, 2.290832, 0.5764706, 0, 1, 1,
0.7663579, -0.19667, 1.581892, 0.5843138, 0, 1, 1,
0.7716866, -0.4874847, 3.800931, 0.5882353, 0, 1, 1,
0.7748692, -2.345148, 3.584658, 0.5960785, 0, 1, 1,
0.7791444, 0.9856176, -0.1758459, 0.6039216, 0, 1, 1,
0.7798218, -0.3082609, 2.467542, 0.6078432, 0, 1, 1,
0.7863972, 0.2201339, 0.8763918, 0.6156863, 0, 1, 1,
0.7904746, 0.1795941, 2.667661, 0.6196079, 0, 1, 1,
0.7913197, -0.4752291, 1.134136, 0.627451, 0, 1, 1,
0.7971291, -0.1473618, 1.831995, 0.6313726, 0, 1, 1,
0.8014341, -2.161525, 0.3282433, 0.6392157, 0, 1, 1,
0.8031102, -0.2128909, 2.530673, 0.6431373, 0, 1, 1,
0.8046649, 0.1114223, -0.1565973, 0.6509804, 0, 1, 1,
0.8073285, 0.8142795, 0.5069179, 0.654902, 0, 1, 1,
0.8107313, -1.451111, 1.702522, 0.6627451, 0, 1, 1,
0.8109128, 0.3947236, 2.358732, 0.6666667, 0, 1, 1,
0.8138171, 0.6468163, 0.5077826, 0.6745098, 0, 1, 1,
0.8160078, 2.658102, 0.07191907, 0.6784314, 0, 1, 1,
0.8209177, -0.9635564, 3.444985, 0.6862745, 0, 1, 1,
0.8314589, -0.6453252, 3.184814, 0.6901961, 0, 1, 1,
0.8341092, -0.7014359, 3.173898, 0.6980392, 0, 1, 1,
0.834503, -0.47611, 1.450401, 0.7058824, 0, 1, 1,
0.8348987, -0.77868, 2.03727, 0.7098039, 0, 1, 1,
0.8359604, -0.2677987, 3.641675, 0.7176471, 0, 1, 1,
0.846719, -0.4036514, 0.6278372, 0.7215686, 0, 1, 1,
0.8468691, 1.978235, -0.1586401, 0.7294118, 0, 1, 1,
0.8490068, 0.3428699, 0.5914201, 0.7333333, 0, 1, 1,
0.849642, 0.1540077, 2.481524, 0.7411765, 0, 1, 1,
0.8693414, 0.09271858, 0.9332427, 0.7450981, 0, 1, 1,
0.8742487, 0.7148402, 0.6103166, 0.7529412, 0, 1, 1,
0.8790187, 2.157548, 0.02281839, 0.7568628, 0, 1, 1,
0.883761, -0.1270416, 0.5629371, 0.7647059, 0, 1, 1,
0.884921, 1.534807, 1.500249, 0.7686275, 0, 1, 1,
0.8862497, 1.299115, 0.5742462, 0.7764706, 0, 1, 1,
0.8887689, -2.280083, 1.962538, 0.7803922, 0, 1, 1,
0.8926196, 0.5174634, 2.432472, 0.7882353, 0, 1, 1,
0.8996556, 0.9134423, 0.6760877, 0.7921569, 0, 1, 1,
0.9059521, -1.43361, 1.802552, 0.8, 0, 1, 1,
0.9068468, 1.067652, 0.8323072, 0.8078431, 0, 1, 1,
0.9101987, 1.390676, -0.5622327, 0.8117647, 0, 1, 1,
0.9226772, -0.9319989, 3.138545, 0.8196079, 0, 1, 1,
0.9273361, 0.3630671, 0.5224664, 0.8235294, 0, 1, 1,
0.9349965, 1.135955, 2.355918, 0.8313726, 0, 1, 1,
0.9374856, -1.375972, 3.870862, 0.8352941, 0, 1, 1,
0.9408086, -0.1605454, 2.40608, 0.8431373, 0, 1, 1,
0.9479733, -0.1720153, 1.992402, 0.8470588, 0, 1, 1,
0.9487422, 2.181619, 0.5437311, 0.854902, 0, 1, 1,
0.9521081, -2.022256, 4.517468, 0.8588235, 0, 1, 1,
0.9542097, 0.1891675, 1.34692, 0.8666667, 0, 1, 1,
0.961679, -1.413143, 1.449869, 0.8705882, 0, 1, 1,
0.9645991, 1.803085, 1.238485, 0.8784314, 0, 1, 1,
0.971687, -0.6450325, 2.17851, 0.8823529, 0, 1, 1,
0.9743608, 0.04462577, 2.719289, 0.8901961, 0, 1, 1,
0.9759492, -0.2861012, 1.770444, 0.8941177, 0, 1, 1,
0.9806317, -0.5532014, 0.7431864, 0.9019608, 0, 1, 1,
0.9897346, -0.8730875, 3.24788, 0.9098039, 0, 1, 1,
0.9986223, -0.829672, 2.915697, 0.9137255, 0, 1, 1,
1.011828, 1.245489, -0.007994466, 0.9215686, 0, 1, 1,
1.018664, 0.1559399, 2.384109, 0.9254902, 0, 1, 1,
1.019273, 2.348776, 0.3481748, 0.9333333, 0, 1, 1,
1.023886, 0.1769132, 2.003933, 0.9372549, 0, 1, 1,
1.024817, 0.3913701, 2.370003, 0.945098, 0, 1, 1,
1.025771, 0.3460834, 1.63462, 0.9490196, 0, 1, 1,
1.027649, -0.1365049, 0.973989, 0.9568627, 0, 1, 1,
1.027915, -0.5987156, 0.9071301, 0.9607843, 0, 1, 1,
1.030683, 0.09266451, 2.843646, 0.9686275, 0, 1, 1,
1.032595, 0.7649982, 2.828172, 0.972549, 0, 1, 1,
1.033548, -0.4286439, 2.274985, 0.9803922, 0, 1, 1,
1.035379, -0.4762452, 1.962558, 0.9843137, 0, 1, 1,
1.039295, -1.465242, 3.439503, 0.9921569, 0, 1, 1,
1.04273, 0.4493025, 0.5191864, 0.9960784, 0, 1, 1,
1.051052, -0.681443, 1.319597, 1, 0, 0.9960784, 1,
1.052376, -0.3154679, 2.246391, 1, 0, 0.9882353, 1,
1.053029, 0.06257554, 1.966124, 1, 0, 0.9843137, 1,
1.076621, -0.6439112, 0.8122723, 1, 0, 0.9764706, 1,
1.077291, 0.08883891, 1.885759, 1, 0, 0.972549, 1,
1.085419, 0.2074379, -0.4575066, 1, 0, 0.9647059, 1,
1.097381, -0.8758692, 2.26519, 1, 0, 0.9607843, 1,
1.101937, -0.09460891, 2.098914, 1, 0, 0.9529412, 1,
1.115038, -0.5121259, 3.030137, 1, 0, 0.9490196, 1,
1.118352, 0.3268305, 3.198209, 1, 0, 0.9411765, 1,
1.120812, 0.2815788, 1.084826, 1, 0, 0.9372549, 1,
1.128691, -0.9649442, 0.7609742, 1, 0, 0.9294118, 1,
1.129714, -0.5005551, 3.19, 1, 0, 0.9254902, 1,
1.132534, -1.699126, 1.515673, 1, 0, 0.9176471, 1,
1.135703, -0.7449384, 2.297395, 1, 0, 0.9137255, 1,
1.139054, 0.6028126, 2.995051, 1, 0, 0.9058824, 1,
1.145217, -0.4772915, 4.393216, 1, 0, 0.9019608, 1,
1.148202, -1.80053, 2.223991, 1, 0, 0.8941177, 1,
1.151955, -0.4535444, 1.945872, 1, 0, 0.8862745, 1,
1.152223, 0.4573048, 1.421486, 1, 0, 0.8823529, 1,
1.154557, 0.109652, 0.4637851, 1, 0, 0.8745098, 1,
1.155838, -0.1603886, -0.1373267, 1, 0, 0.8705882, 1,
1.157688, -0.4869716, 1.924825, 1, 0, 0.8627451, 1,
1.158872, 1.430492, 1.039193, 1, 0, 0.8588235, 1,
1.160901, 1.212893, 1.43428, 1, 0, 0.8509804, 1,
1.161861, -0.2064604, 2.830276, 1, 0, 0.8470588, 1,
1.174049, 1.515846, 0.1250481, 1, 0, 0.8392157, 1,
1.177264, -0.1507626, 0.3103969, 1, 0, 0.8352941, 1,
1.177353, 1.583377, 1.690847, 1, 0, 0.827451, 1,
1.188057, -0.5968239, 1.557326, 1, 0, 0.8235294, 1,
1.188383, 0.3155575, 2.581585, 1, 0, 0.8156863, 1,
1.1909, -0.7302182, 1.179465, 1, 0, 0.8117647, 1,
1.191837, 0.712704, 0.2152058, 1, 0, 0.8039216, 1,
1.192117, -0.4954533, 2.163463, 1, 0, 0.7960784, 1,
1.193369, 0.2393592, 0.9855527, 1, 0, 0.7921569, 1,
1.196731, 0.7017996, 1.95441, 1, 0, 0.7843137, 1,
1.211877, -0.03473067, 1.020064, 1, 0, 0.7803922, 1,
1.216317, -0.6356435, 3.830352, 1, 0, 0.772549, 1,
1.221595, 2.024278, 0.9882513, 1, 0, 0.7686275, 1,
1.226676, 0.05510708, 1.560612, 1, 0, 0.7607843, 1,
1.232494, -0.4746485, 2.301073, 1, 0, 0.7568628, 1,
1.239175, 0.4639154, 3.814896, 1, 0, 0.7490196, 1,
1.249855, -0.0007570706, 0.5080825, 1, 0, 0.7450981, 1,
1.257467, -0.7556158, 2.322594, 1, 0, 0.7372549, 1,
1.259719, -0.2687396, 1.820277, 1, 0, 0.7333333, 1,
1.260657, -1.368185, 2.323955, 1, 0, 0.7254902, 1,
1.263128, -1.717474, 1.241724, 1, 0, 0.7215686, 1,
1.268529, -0.4581878, 0.181532, 1, 0, 0.7137255, 1,
1.276444, -0.2880194, 1.320103, 1, 0, 0.7098039, 1,
1.284297, -0.705455, 1.460803, 1, 0, 0.7019608, 1,
1.294198, -1.040743, 3.265267, 1, 0, 0.6941177, 1,
1.30354, -0.116235, 0.4012633, 1, 0, 0.6901961, 1,
1.305638, 0.1073198, 1.751875, 1, 0, 0.682353, 1,
1.307523, -1.341197, 1.399166, 1, 0, 0.6784314, 1,
1.313887, 0.9690372, 1.752333, 1, 0, 0.6705883, 1,
1.319685, 0.7885071, 0.7881388, 1, 0, 0.6666667, 1,
1.320541, -0.7270451, 1.860819, 1, 0, 0.6588235, 1,
1.324758, -0.2832801, 1.416648, 1, 0, 0.654902, 1,
1.330355, 1.869334, 1.637005, 1, 0, 0.6470588, 1,
1.336786, -1.925363, 1.167845, 1, 0, 0.6431373, 1,
1.342558, 0.595049, 0.816121, 1, 0, 0.6352941, 1,
1.343636, -0.5597711, 3.954262, 1, 0, 0.6313726, 1,
1.350451, 0.779276, 2.05318, 1, 0, 0.6235294, 1,
1.351887, 0.3614941, 1.5991, 1, 0, 0.6196079, 1,
1.363626, -0.3154683, 1.245529, 1, 0, 0.6117647, 1,
1.36725, -1.069373, 3.379849, 1, 0, 0.6078432, 1,
1.376263, 1.122425, 1.355655, 1, 0, 0.6, 1,
1.378192, -0.4992335, 1.939282, 1, 0, 0.5921569, 1,
1.379856, -2.125555, 2.260642, 1, 0, 0.5882353, 1,
1.391867, 0.8738025, 2.557952, 1, 0, 0.5803922, 1,
1.395089, -1.376538, 3.891832, 1, 0, 0.5764706, 1,
1.399114, 0.4750728, 1.32352, 1, 0, 0.5686275, 1,
1.399292, 0.709374, 1.291914, 1, 0, 0.5647059, 1,
1.40718, 1.022052, 0.4086054, 1, 0, 0.5568628, 1,
1.408099, 0.4488363, 1.04756, 1, 0, 0.5529412, 1,
1.425728, 0.5653473, 0.08631534, 1, 0, 0.5450981, 1,
1.432376, 0.1707728, 1.11859, 1, 0, 0.5411765, 1,
1.434789, -0.5536405, 0.6491207, 1, 0, 0.5333334, 1,
1.435549, 0.2820326, 2.49368, 1, 0, 0.5294118, 1,
1.457307, 1.636146, 0.6224988, 1, 0, 0.5215687, 1,
1.459059, -0.2160743, 1.665601, 1, 0, 0.5176471, 1,
1.461567, -2.009471, 2.377245, 1, 0, 0.509804, 1,
1.473167, 0.04723572, 1.745914, 1, 0, 0.5058824, 1,
1.488534, 0.5087664, 0.7354487, 1, 0, 0.4980392, 1,
1.502608, -1.19728, 3.010947, 1, 0, 0.4901961, 1,
1.516306, 0.9032108, -0.07736503, 1, 0, 0.4862745, 1,
1.524157, -0.4996419, 1.866051, 1, 0, 0.4784314, 1,
1.524869, -0.7317198, 1.732547, 1, 0, 0.4745098, 1,
1.537314, 1.444615, 0.319585, 1, 0, 0.4666667, 1,
1.543525, -0.4194241, 2.339048, 1, 0, 0.4627451, 1,
1.552925, 0.356755, 1.95171, 1, 0, 0.454902, 1,
1.573561, -0.5293697, 1.888215, 1, 0, 0.4509804, 1,
1.57451, -1.103602, 1.937419, 1, 0, 0.4431373, 1,
1.575454, -0.841849, 2.340209, 1, 0, 0.4392157, 1,
1.579587, -0.6162275, 1.618228, 1, 0, 0.4313726, 1,
1.581567, -0.6968493, 2.11829, 1, 0, 0.427451, 1,
1.595812, -1.147819, 0.7556514, 1, 0, 0.4196078, 1,
1.612512, -2.734978, 0.325646, 1, 0, 0.4156863, 1,
1.623919, 0.521298, 1.319891, 1, 0, 0.4078431, 1,
1.627882, 0.4221784, 2.79591, 1, 0, 0.4039216, 1,
1.645547, -0.4714131, 1.829288, 1, 0, 0.3960784, 1,
1.657321, 0.1407873, 0.5874158, 1, 0, 0.3882353, 1,
1.665652, 0.3978525, 0.01178384, 1, 0, 0.3843137, 1,
1.673317, -1.318638, 2.042079, 1, 0, 0.3764706, 1,
1.679504, -1.583786, 0.6091931, 1, 0, 0.372549, 1,
1.688816, -0.1995957, 1.827592, 1, 0, 0.3647059, 1,
1.690709, -1.31414, 0.9286541, 1, 0, 0.3607843, 1,
1.701121, -0.1556649, 2.707945, 1, 0, 0.3529412, 1,
1.701935, 0.5275798, 1.492611, 1, 0, 0.3490196, 1,
1.705826, 0.3942625, 0.2943385, 1, 0, 0.3411765, 1,
1.710061, 0.336136, 3.455206, 1, 0, 0.3372549, 1,
1.718304, 1.361239, 0.549862, 1, 0, 0.3294118, 1,
1.730399, -1.376535, 2.975065, 1, 0, 0.3254902, 1,
1.731307, -0.1845781, 1.363097, 1, 0, 0.3176471, 1,
1.734469, -0.8618944, 4.531069, 1, 0, 0.3137255, 1,
1.736829, -2.510333, 4.349186, 1, 0, 0.3058824, 1,
1.741146, 0.8061062, 1.041174, 1, 0, 0.2980392, 1,
1.741195, -0.3368234, 1.304729, 1, 0, 0.2941177, 1,
1.742139, -1.041343, 2.279809, 1, 0, 0.2862745, 1,
1.745414, -0.41172, 1.423431, 1, 0, 0.282353, 1,
1.768162, 0.9938999, 3.082558, 1, 0, 0.2745098, 1,
1.773757, 1.091971, 0.6468924, 1, 0, 0.2705882, 1,
1.779197, 0.707278, -0.8029917, 1, 0, 0.2627451, 1,
1.79031, 0.2468775, 1.807039, 1, 0, 0.2588235, 1,
1.79595, 1.274071, 0.300068, 1, 0, 0.2509804, 1,
1.803023, 0.6779931, 1.118693, 1, 0, 0.2470588, 1,
1.810245, 0.12409, 3.264562, 1, 0, 0.2392157, 1,
1.824498, 0.7741442, 0.4427883, 1, 0, 0.2352941, 1,
1.835349, -0.6220047, 3.055844, 1, 0, 0.227451, 1,
1.852324, 0.3860358, 3.518118, 1, 0, 0.2235294, 1,
1.856591, -0.1887024, 2.541169, 1, 0, 0.2156863, 1,
1.86694, -0.3721829, 2.116717, 1, 0, 0.2117647, 1,
1.868482, 0.6779706, 1.256228, 1, 0, 0.2039216, 1,
1.869969, 0.8457277, 2.572804, 1, 0, 0.1960784, 1,
1.872037, 1.015305, 0.3904286, 1, 0, 0.1921569, 1,
1.891568, 0.7734424, 1.799832, 1, 0, 0.1843137, 1,
1.891911, 0.8383024, 0.356976, 1, 0, 0.1803922, 1,
1.895298, 1.772372, 1.282377, 1, 0, 0.172549, 1,
1.906012, -0.06277065, 0.3781339, 1, 0, 0.1686275, 1,
1.951931, 1.730631, 2.563126, 1, 0, 0.1607843, 1,
1.969143, 0.4323578, 1.568088, 1, 0, 0.1568628, 1,
1.97308, 0.4831376, 3.006553, 1, 0, 0.1490196, 1,
1.977276, 0.1292017, 0.6493953, 1, 0, 0.145098, 1,
1.983193, 0.7756559, 1.631236, 1, 0, 0.1372549, 1,
1.983455, -1.860782, 2.897164, 1, 0, 0.1333333, 1,
2.000644, -0.4776837, 2.308667, 1, 0, 0.1254902, 1,
2.025942, -0.002882279, 3.020076, 1, 0, 0.1215686, 1,
2.038628, 0.2581643, 1.465312, 1, 0, 0.1137255, 1,
2.08859, -0.8766348, 2.110757, 1, 0, 0.1098039, 1,
2.115155, -0.995791, 1.012535, 1, 0, 0.1019608, 1,
2.128642, -0.7873912, 2.113477, 1, 0, 0.09411765, 1,
2.15309, 1.461111, 0.2257857, 1, 0, 0.09019608, 1,
2.169451, -0.2832838, -0.2403119, 1, 0, 0.08235294, 1,
2.211474, 0.3959053, 2.87854, 1, 0, 0.07843138, 1,
2.222748, 0.9838307, 0.8010538, 1, 0, 0.07058824, 1,
2.233292, 0.3228832, 1.728089, 1, 0, 0.06666667, 1,
2.244288, 0.3042916, 1.806134, 1, 0, 0.05882353, 1,
2.287421, -0.4911564, 1.327771, 1, 0, 0.05490196, 1,
2.347855, -1.374353, 3.594905, 1, 0, 0.04705882, 1,
2.357302, -1.062976, 1.819663, 1, 0, 0.04313726, 1,
2.453135, -0.3680785, 1.811735, 1, 0, 0.03529412, 1,
2.505444, 0.5736449, -0.3597643, 1, 0, 0.03137255, 1,
2.720731, 0.6686439, -0.07917137, 1, 0, 0.02352941, 1,
2.744495, 1.521908, 1.684332, 1, 0, 0.01960784, 1,
2.809861, 0.001654948, 2.109605, 1, 0, 0.01176471, 1,
3.136393, -0.07099704, 1.962464, 1, 0, 0.007843138, 1
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
0.09122825, -3.679715, -7.498051, 0, -0.5, 0.5, 0.5,
0.09122825, -3.679715, -7.498051, 1, -0.5, 0.5, 0.5,
0.09122825, -3.679715, -7.498051, 1, 1.5, 0.5, 0.5,
0.09122825, -3.679715, -7.498051, 0, 1.5, 0.5, 0.5
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
-3.986247, 0.05185497, -7.498051, 0, -0.5, 0.5, 0.5,
-3.986247, 0.05185497, -7.498051, 1, -0.5, 0.5, 0.5,
-3.986247, 0.05185497, -7.498051, 1, 1.5, 0.5, 0.5,
-3.986247, 0.05185497, -7.498051, 0, 1.5, 0.5, 0.5
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
-3.986247, -3.679715, -0.3578825, 0, -0.5, 0.5, 0.5,
-3.986247, -3.679715, -0.3578825, 1, -0.5, 0.5, 0.5,
-3.986247, -3.679715, -0.3578825, 1, 1.5, 0.5, 0.5,
-3.986247, -3.679715, -0.3578825, 0, 1.5, 0.5, 0.5
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
-2, -2.818583, -5.85032,
3, -2.818583, -5.85032,
-2, -2.818583, -5.85032,
-2, -2.962105, -6.124941,
-1, -2.818583, -5.85032,
-1, -2.962105, -6.124941,
0, -2.818583, -5.85032,
0, -2.962105, -6.124941,
1, -2.818583, -5.85032,
1, -2.962105, -6.124941,
2, -2.818583, -5.85032,
2, -2.962105, -6.124941,
3, -2.818583, -5.85032,
3, -2.962105, -6.124941
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
-2, -3.249149, -6.674185, 0, -0.5, 0.5, 0.5,
-2, -3.249149, -6.674185, 1, -0.5, 0.5, 0.5,
-2, -3.249149, -6.674185, 1, 1.5, 0.5, 0.5,
-2, -3.249149, -6.674185, 0, 1.5, 0.5, 0.5,
-1, -3.249149, -6.674185, 0, -0.5, 0.5, 0.5,
-1, -3.249149, -6.674185, 1, -0.5, 0.5, 0.5,
-1, -3.249149, -6.674185, 1, 1.5, 0.5, 0.5,
-1, -3.249149, -6.674185, 0, 1.5, 0.5, 0.5,
0, -3.249149, -6.674185, 0, -0.5, 0.5, 0.5,
0, -3.249149, -6.674185, 1, -0.5, 0.5, 0.5,
0, -3.249149, -6.674185, 1, 1.5, 0.5, 0.5,
0, -3.249149, -6.674185, 0, 1.5, 0.5, 0.5,
1, -3.249149, -6.674185, 0, -0.5, 0.5, 0.5,
1, -3.249149, -6.674185, 1, -0.5, 0.5, 0.5,
1, -3.249149, -6.674185, 1, 1.5, 0.5, 0.5,
1, -3.249149, -6.674185, 0, 1.5, 0.5, 0.5,
2, -3.249149, -6.674185, 0, -0.5, 0.5, 0.5,
2, -3.249149, -6.674185, 1, -0.5, 0.5, 0.5,
2, -3.249149, -6.674185, 1, 1.5, 0.5, 0.5,
2, -3.249149, -6.674185, 0, 1.5, 0.5, 0.5,
3, -3.249149, -6.674185, 0, -0.5, 0.5, 0.5,
3, -3.249149, -6.674185, 1, -0.5, 0.5, 0.5,
3, -3.249149, -6.674185, 1, 1.5, 0.5, 0.5,
3, -3.249149, -6.674185, 0, 1.5, 0.5, 0.5
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
-3.045291, -2, -5.85032,
-3.045291, 2, -5.85032,
-3.045291, -2, -5.85032,
-3.202117, -2, -6.124941,
-3.045291, -1, -5.85032,
-3.202117, -1, -6.124941,
-3.045291, 0, -5.85032,
-3.202117, 0, -6.124941,
-3.045291, 1, -5.85032,
-3.202117, 1, -6.124941,
-3.045291, 2, -5.85032,
-3.202117, 2, -6.124941
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
-3.515769, -2, -6.674185, 0, -0.5, 0.5, 0.5,
-3.515769, -2, -6.674185, 1, -0.5, 0.5, 0.5,
-3.515769, -2, -6.674185, 1, 1.5, 0.5, 0.5,
-3.515769, -2, -6.674185, 0, 1.5, 0.5, 0.5,
-3.515769, -1, -6.674185, 0, -0.5, 0.5, 0.5,
-3.515769, -1, -6.674185, 1, -0.5, 0.5, 0.5,
-3.515769, -1, -6.674185, 1, 1.5, 0.5, 0.5,
-3.515769, -1, -6.674185, 0, 1.5, 0.5, 0.5,
-3.515769, 0, -6.674185, 0, -0.5, 0.5, 0.5,
-3.515769, 0, -6.674185, 1, -0.5, 0.5, 0.5,
-3.515769, 0, -6.674185, 1, 1.5, 0.5, 0.5,
-3.515769, 0, -6.674185, 0, 1.5, 0.5, 0.5,
-3.515769, 1, -6.674185, 0, -0.5, 0.5, 0.5,
-3.515769, 1, -6.674185, 1, -0.5, 0.5, 0.5,
-3.515769, 1, -6.674185, 1, 1.5, 0.5, 0.5,
-3.515769, 1, -6.674185, 0, 1.5, 0.5, 0.5,
-3.515769, 2, -6.674185, 0, -0.5, 0.5, 0.5,
-3.515769, 2, -6.674185, 1, -0.5, 0.5, 0.5,
-3.515769, 2, -6.674185, 1, 1.5, 0.5, 0.5,
-3.515769, 2, -6.674185, 0, 1.5, 0.5, 0.5
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
-3.045291, -2.818583, -4,
-3.045291, -2.818583, 4,
-3.045291, -2.818583, -4,
-3.202117, -2.962105, -4,
-3.045291, -2.818583, -2,
-3.202117, -2.962105, -2,
-3.045291, -2.818583, 0,
-3.202117, -2.962105, 0,
-3.045291, -2.818583, 2,
-3.202117, -2.962105, 2,
-3.045291, -2.818583, 4,
-3.202117, -2.962105, 4
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
-3.515769, -3.249149, -4, 0, -0.5, 0.5, 0.5,
-3.515769, -3.249149, -4, 1, -0.5, 0.5, 0.5,
-3.515769, -3.249149, -4, 1, 1.5, 0.5, 0.5,
-3.515769, -3.249149, -4, 0, 1.5, 0.5, 0.5,
-3.515769, -3.249149, -2, 0, -0.5, 0.5, 0.5,
-3.515769, -3.249149, -2, 1, -0.5, 0.5, 0.5,
-3.515769, -3.249149, -2, 1, 1.5, 0.5, 0.5,
-3.515769, -3.249149, -2, 0, 1.5, 0.5, 0.5,
-3.515769, -3.249149, 0, 0, -0.5, 0.5, 0.5,
-3.515769, -3.249149, 0, 1, -0.5, 0.5, 0.5,
-3.515769, -3.249149, 0, 1, 1.5, 0.5, 0.5,
-3.515769, -3.249149, 0, 0, 1.5, 0.5, 0.5,
-3.515769, -3.249149, 2, 0, -0.5, 0.5, 0.5,
-3.515769, -3.249149, 2, 1, -0.5, 0.5, 0.5,
-3.515769, -3.249149, 2, 1, 1.5, 0.5, 0.5,
-3.515769, -3.249149, 2, 0, 1.5, 0.5, 0.5,
-3.515769, -3.249149, 4, 0, -0.5, 0.5, 0.5,
-3.515769, -3.249149, 4, 1, -0.5, 0.5, 0.5,
-3.515769, -3.249149, 4, 1, 1.5, 0.5, 0.5,
-3.515769, -3.249149, 4, 0, 1.5, 0.5, 0.5
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
-3.045291, -2.818583, -5.85032,
-3.045291, 2.922293, -5.85032,
-3.045291, -2.818583, 5.134555,
-3.045291, 2.922293, 5.134555,
-3.045291, -2.818583, -5.85032,
-3.045291, -2.818583, 5.134555,
-3.045291, 2.922293, -5.85032,
-3.045291, 2.922293, 5.134555,
-3.045291, -2.818583, -5.85032,
3.227747, -2.818583, -5.85032,
-3.045291, -2.818583, 5.134555,
3.227747, -2.818583, 5.134555,
-3.045291, 2.922293, -5.85032,
3.227747, 2.922293, -5.85032,
-3.045291, 2.922293, 5.134555,
3.227747, 2.922293, 5.134555,
3.227747, -2.818583, -5.85032,
3.227747, 2.922293, -5.85032,
3.227747, -2.818583, 5.134555,
3.227747, 2.922293, 5.134555,
3.227747, -2.818583, -5.85032,
3.227747, -2.818583, 5.134555,
3.227747, 2.922293, -5.85032,
3.227747, 2.922293, 5.134555
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
var radius = 7.417837;
var distance = 33.0028;
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
mvMatrix.translate( -0.09122825, -0.05185497, 0.3578825 );
mvMatrix.scale( 1.278537, 1.397053, 0.7301231 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.0028);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
choline_chloride<-read.table("choline_chloride.xyz")
```

```
## Error in read.table("choline_chloride.xyz"): no lines available in input
```

```r
x<-choline_chloride$V2
```

```
## Error in eval(expr, envir, enclos): object 'choline_chloride' not found
```

```r
y<-choline_chloride$V3
```

```
## Error in eval(expr, envir, enclos): object 'choline_chloride' not found
```

```r
z<-choline_chloride$V4
```

```
## Error in eval(expr, envir, enclos): object 'choline_chloride' not found
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
-2.953936, 0.9758824, -3.102256, 0, 0, 1, 1, 1,
-2.796126, -0.7006164, -2.211193, 1, 0, 0, 1, 1,
-2.618975, 0.1854502, -2.944399, 1, 0, 0, 1, 1,
-2.550132, -0.3241384, -0.8304497, 1, 0, 0, 1, 1,
-2.542829, -1.361048, -2.54488, 1, 0, 0, 1, 1,
-2.485157, 0.1311383, -3.300677, 1, 0, 0, 1, 1,
-2.435179, 0.05036713, -3.35249, 0, 0, 0, 1, 1,
-2.41238, 1.039195, -1.921337, 0, 0, 0, 1, 1,
-2.390292, -1.041298, -1.179783, 0, 0, 0, 1, 1,
-2.318975, 1.786964, -0.5323626, 0, 0, 0, 1, 1,
-2.300554, 0.7054486, -1.901542, 0, 0, 0, 1, 1,
-2.294703, -0.3839701, -1.793011, 0, 0, 0, 1, 1,
-2.290339, 0.5975128, -0.7111734, 0, 0, 0, 1, 1,
-2.256941, -2.207623, -0.7887968, 1, 1, 1, 1, 1,
-2.256406, -0.4950599, 0.4414469, 1, 1, 1, 1, 1,
-2.241075, 1.010643, -0.05708408, 1, 1, 1, 1, 1,
-2.238995, -0.3419706, -2.252315, 1, 1, 1, 1, 1,
-2.228076, -1.043747, -0.464579, 1, 1, 1, 1, 1,
-2.19245, -1.26579, -2.994921, 1, 1, 1, 1, 1,
-2.154732, 0.7345053, -0.7596582, 1, 1, 1, 1, 1,
-2.129515, -0.9735631, -1.55733, 1, 1, 1, 1, 1,
-2.125022, -0.1264598, -1.351719, 1, 1, 1, 1, 1,
-2.124179, 0.4667235, -1.417343, 1, 1, 1, 1, 1,
-2.085218, -0.9151708, -1.850874, 1, 1, 1, 1, 1,
-2.074555, -0.5124, -1.379577, 1, 1, 1, 1, 1,
-2.041151, 0.5360252, -0.9287795, 1, 1, 1, 1, 1,
-2.03953, 0.2892206, -0.8271944, 1, 1, 1, 1, 1,
-2.025946, -0.3466139, -0.7575945, 1, 1, 1, 1, 1,
-1.969444, -0.3260323, -2.866843, 0, 0, 1, 1, 1,
-1.943463, 0.6315163, -0.2894674, 1, 0, 0, 1, 1,
-1.941183, 0.5576339, -0.7068574, 1, 0, 0, 1, 1,
-1.937847, 0.483446, -2.951284, 1, 0, 0, 1, 1,
-1.928555, 1.015075, -1.817912, 1, 0, 0, 1, 1,
-1.926424, 1.008251, -1.85004, 1, 0, 0, 1, 1,
-1.916125, -1.788134, -2.789828, 0, 0, 0, 1, 1,
-1.907091, 1.143902, -1.710351, 0, 0, 0, 1, 1,
-1.905006, -1.995563, -2.284574, 0, 0, 0, 1, 1,
-1.898217, -0.1856984, -2.589607, 0, 0, 0, 1, 1,
-1.887023, -0.6258117, -3.081153, 0, 0, 0, 1, 1,
-1.86553, 0.1791004, -1.064779, 0, 0, 0, 1, 1,
-1.847546, -0.5418729, -2.162543, 0, 0, 0, 1, 1,
-1.832925, -0.21537, -2.224273, 1, 1, 1, 1, 1,
-1.82121, 0.2912973, -1.996709, 1, 1, 1, 1, 1,
-1.813882, -1.364182, -0.1287741, 1, 1, 1, 1, 1,
-1.787914, 0.4857521, -1.040593, 1, 1, 1, 1, 1,
-1.785502, 1.454417, 0.2206162, 1, 1, 1, 1, 1,
-1.783304, 1.095793, -1.151198, 1, 1, 1, 1, 1,
-1.779903, 0.1899393, -1.247571, 1, 1, 1, 1, 1,
-1.728013, -0.4406758, -0.2479684, 1, 1, 1, 1, 1,
-1.723061, -1.627988, -0.2293009, 1, 1, 1, 1, 1,
-1.718097, -0.5285679, -0.3390641, 1, 1, 1, 1, 1,
-1.716734, -0.9947936, -0.7351921, 1, 1, 1, 1, 1,
-1.707012, -0.5587133, -1.379117, 1, 1, 1, 1, 1,
-1.706924, -0.6373925, -2.616763, 1, 1, 1, 1, 1,
-1.683843, -0.8193005, -3.011218, 1, 1, 1, 1, 1,
-1.679611, -0.5601566, -2.129915, 1, 1, 1, 1, 1,
-1.671585, 1.119868, 0.2117479, 0, 0, 1, 1, 1,
-1.656008, 1.132099, 0.3089515, 1, 0, 0, 1, 1,
-1.63831, -1.735322, -1.265687, 1, 0, 0, 1, 1,
-1.625602, 0.481484, -2.568871, 1, 0, 0, 1, 1,
-1.617181, -0.2809355, -1.304729, 1, 0, 0, 1, 1,
-1.616346, -0.6198664, -2.189989, 1, 0, 0, 1, 1,
-1.604931, -0.5861329, -3.047945, 0, 0, 0, 1, 1,
-1.602971, -0.7660728, -0.5927826, 0, 0, 0, 1, 1,
-1.580984, -0.204085, -1.860977, 0, 0, 0, 1, 1,
-1.577799, 1.040292, -2.146219, 0, 0, 0, 1, 1,
-1.566748, -1.248913, -2.111778, 0, 0, 0, 1, 1,
-1.565659, 1.346189, -0.7613127, 0, 0, 0, 1, 1,
-1.554901, -1.564788, -1.615092, 0, 0, 0, 1, 1,
-1.554323, -0.2498614, -2.180003, 1, 1, 1, 1, 1,
-1.54069, 1.030535, -1.171034, 1, 1, 1, 1, 1,
-1.540326, -0.1814934, -1.469916, 1, 1, 1, 1, 1,
-1.521584, 2.638538, -0.5103924, 1, 1, 1, 1, 1,
-1.50358, 0.3083676, -1.047934, 1, 1, 1, 1, 1,
-1.502114, 0.1752596, -0.7070726, 1, 1, 1, 1, 1,
-1.49522, 1.441997, -1.077167, 1, 1, 1, 1, 1,
-1.490459, 1.805824, -0.0215006, 1, 1, 1, 1, 1,
-1.478905, 1.203605, -0.8744634, 1, 1, 1, 1, 1,
-1.473789, 0.350855, -1.465255, 1, 1, 1, 1, 1,
-1.44762, -0.4081505, -1.66436, 1, 1, 1, 1, 1,
-1.44639, -0.06768981, -0.9684246, 1, 1, 1, 1, 1,
-1.446119, -2.353419, -4.290298, 1, 1, 1, 1, 1,
-1.434812, 1.212841, 0.3844213, 1, 1, 1, 1, 1,
-1.429014, 0.5564924, -2.8663, 1, 1, 1, 1, 1,
-1.42259, 0.01758894, -2.257785, 0, 0, 1, 1, 1,
-1.412138, 1.869798, 0.5906828, 1, 0, 0, 1, 1,
-1.396789, 0.7013062, -0.6006415, 1, 0, 0, 1, 1,
-1.394598, 0.06819576, -1.56622, 1, 0, 0, 1, 1,
-1.392072, 0.2479294, -1.560292, 1, 0, 0, 1, 1,
-1.3795, 1.076513, -0.6050097, 1, 0, 0, 1, 1,
-1.376611, -0.883092, -2.870375, 0, 0, 0, 1, 1,
-1.368894, -0.07509685, -1.428871, 0, 0, 0, 1, 1,
-1.368646, -1.322676, -2.08437, 0, 0, 0, 1, 1,
-1.36423, 0.4699856, -0.2012599, 0, 0, 0, 1, 1,
-1.361268, 1.728253, -0.7127033, 0, 0, 0, 1, 1,
-1.349716, 0.5726515, -1.378305, 0, 0, 0, 1, 1,
-1.34692, -0.2495444, -2.137076, 0, 0, 0, 1, 1,
-1.343261, 0.5817565, 0.2407661, 1, 1, 1, 1, 1,
-1.342506, 0.6335229, -2.368904, 1, 1, 1, 1, 1,
-1.333533, -0.117954, -0.9769348, 1, 1, 1, 1, 1,
-1.324916, -0.4859096, -2.493112, 1, 1, 1, 1, 1,
-1.322785, 1.121257, -1.322244, 1, 1, 1, 1, 1,
-1.30848, 0.1423278, -2.297247, 1, 1, 1, 1, 1,
-1.303427, -1.856489, -4.280699, 1, 1, 1, 1, 1,
-1.297616, -1.137463, -3.465512, 1, 1, 1, 1, 1,
-1.296252, -1.867178, -2.617894, 1, 1, 1, 1, 1,
-1.290582, 0.7265675, -1.058881, 1, 1, 1, 1, 1,
-1.281916, 0.03081433, -2.828091, 1, 1, 1, 1, 1,
-1.279759, 1.353604, 0.1690971, 1, 1, 1, 1, 1,
-1.267318, -1.80813, -3.101902, 1, 1, 1, 1, 1,
-1.266163, -0.5078646, -1.303381, 1, 1, 1, 1, 1,
-1.265158, -1.134827, -1.736575, 1, 1, 1, 1, 1,
-1.25349, -0.6988207, -0.4158161, 0, 0, 1, 1, 1,
-1.248321, 1.327994, -0.6853597, 1, 0, 0, 1, 1,
-1.246694, 2.202948, 0.1724216, 1, 0, 0, 1, 1,
-1.243652, 2.242982, -1.487516, 1, 0, 0, 1, 1,
-1.230778, -1.54257, -3.872462, 1, 0, 0, 1, 1,
-1.22826, 2.201629, 0.4126328, 1, 0, 0, 1, 1,
-1.220867, -2.075821, -0.9682924, 0, 0, 0, 1, 1,
-1.220307, 1.037339, -0.6997851, 0, 0, 0, 1, 1,
-1.219514, 0.5748197, 0.1745445, 0, 0, 0, 1, 1,
-1.215852, -0.3979728, -1.809884, 0, 0, 0, 1, 1,
-1.211979, 0.01534355, -2.1697, 0, 0, 0, 1, 1,
-1.211052, -0.356887, -0.2211835, 0, 0, 0, 1, 1,
-1.210535, 0.0881841, -1.685498, 0, 0, 0, 1, 1,
-1.210254, 1.192441, -0.4602878, 1, 1, 1, 1, 1,
-1.189421, -1.125844, -2.513568, 1, 1, 1, 1, 1,
-1.189076, 1.044419, -0.3580564, 1, 1, 1, 1, 1,
-1.171668, -0.007481895, -2.522141, 1, 1, 1, 1, 1,
-1.166068, 0.1485564, -3.621001, 1, 1, 1, 1, 1,
-1.160582, -1.206729, -1.419833, 1, 1, 1, 1, 1,
-1.159712, -0.8993894, -2.896954, 1, 1, 1, 1, 1,
-1.144088, 1.324495, -1.215138, 1, 1, 1, 1, 1,
-1.134456, 0.6719172, -0.2244387, 1, 1, 1, 1, 1,
-1.134414, 1.497744, 0.4843633, 1, 1, 1, 1, 1,
-1.132246, -0.586798, 0.5703803, 1, 1, 1, 1, 1,
-1.130071, -0.2794748, -2.172579, 1, 1, 1, 1, 1,
-1.122736, -0.415087, -2.522044, 1, 1, 1, 1, 1,
-1.121214, 0.2604438, -2.024246, 1, 1, 1, 1, 1,
-1.112074, -1.696299, -3.815431, 1, 1, 1, 1, 1,
-1.108411, -2.312216, -3.027739, 0, 0, 1, 1, 1,
-1.108304, -0.1780639, -0.3450154, 1, 0, 0, 1, 1,
-1.107192, 0.9002862, 0.2924902, 1, 0, 0, 1, 1,
-1.106595, -1.222521, -2.027449, 1, 0, 0, 1, 1,
-1.100624, -0.9162925, -2.081648, 1, 0, 0, 1, 1,
-1.090408, 1.013386, 0.4754862, 1, 0, 0, 1, 1,
-1.077663, -1.105645, -2.459915, 0, 0, 0, 1, 1,
-1.075991, 1.141118, -0.2056484, 0, 0, 0, 1, 1,
-1.075716, 0.4625689, -1.605417, 0, 0, 0, 1, 1,
-1.075698, -0.8059161, -3.603633, 0, 0, 0, 1, 1,
-1.071528, 0.5679753, -1.132746, 0, 0, 0, 1, 1,
-1.065442, 0.5413184, -0.6460526, 0, 0, 0, 1, 1,
-1.055772, -1.123639, -1.868831, 0, 0, 0, 1, 1,
-1.044958, -0.6146066, -2.656354, 1, 1, 1, 1, 1,
-1.038503, 1.93098, -0.5778567, 1, 1, 1, 1, 1,
-1.035278, 1.159017, -1.891824, 1, 1, 1, 1, 1,
-1.032985, 0.3785137, -0.9493181, 1, 1, 1, 1, 1,
-1.031153, 0.711555, -2.591429, 1, 1, 1, 1, 1,
-1.025535, -0.7354747, -0.7984451, 1, 1, 1, 1, 1,
-1.020366, 0.7979004, -0.3961067, 1, 1, 1, 1, 1,
-1.018209, 1.135859, 1.673846, 1, 1, 1, 1, 1,
-1.016019, -1.228008, -3.90626, 1, 1, 1, 1, 1,
-1.008923, 0.6926954, -3.625402, 1, 1, 1, 1, 1,
-1.008773, -1.649108, -2.990188, 1, 1, 1, 1, 1,
-1.008164, -2.114733, -4.058208, 1, 1, 1, 1, 1,
-1.000317, 0.2102942, -2.78691, 1, 1, 1, 1, 1,
-0.9979273, 1.122091, -1.406946, 1, 1, 1, 1, 1,
-0.9962222, -0.800721, -1.418483, 1, 1, 1, 1, 1,
-0.9951251, -0.480354, -1.711447, 0, 0, 1, 1, 1,
-0.9900256, -0.06041208, -2.097945, 1, 0, 0, 1, 1,
-0.9849458, -1.391781, -2.409537, 1, 0, 0, 1, 1,
-0.9799124, 1.099275, -0.5343387, 1, 0, 0, 1, 1,
-0.9779285, 0.1839919, 0.2556075, 1, 0, 0, 1, 1,
-0.9694915, -1.797023, -2.489592, 1, 0, 0, 1, 1,
-0.9619846, -1.849016, -2.530203, 0, 0, 0, 1, 1,
-0.9583984, -2.555545, -2.130656, 0, 0, 0, 1, 1,
-0.9525716, 0.4562109, 0.001581495, 0, 0, 0, 1, 1,
-0.9524667, 0.2216178, -1.686356, 0, 0, 0, 1, 1,
-0.9514226, 0.4150476, -0.04386358, 0, 0, 0, 1, 1,
-0.9461715, 0.252558, -0.628468, 0, 0, 0, 1, 1,
-0.9447364, -0.584294, -0.378318, 0, 0, 0, 1, 1,
-0.9425314, -0.07303603, -5.025171, 1, 1, 1, 1, 1,
-0.9411121, 0.03824396, -1.033907, 1, 1, 1, 1, 1,
-0.9351001, -0.7155104, -2.1747, 1, 1, 1, 1, 1,
-0.9344667, -1.343494, -1.814887, 1, 1, 1, 1, 1,
-0.9284903, -1.294802, -1.911949, 1, 1, 1, 1, 1,
-0.9276178, -0.7456667, -2.09172, 1, 1, 1, 1, 1,
-0.9233789, -1.548287, -2.263626, 1, 1, 1, 1, 1,
-0.9189781, -0.5241821, -3.479639, 1, 1, 1, 1, 1,
-0.9161466, -1.313059, -2.140027, 1, 1, 1, 1, 1,
-0.9121755, -0.373245, -1.786919, 1, 1, 1, 1, 1,
-0.9043272, -0.2821536, -1.074947, 1, 1, 1, 1, 1,
-0.9034371, -0.295284, -0.715626, 1, 1, 1, 1, 1,
-0.9024396, -1.022719, -3.909982, 1, 1, 1, 1, 1,
-0.8928602, 1.049457, -0.5294934, 1, 1, 1, 1, 1,
-0.8917966, -0.7324124, -3.727119, 1, 1, 1, 1, 1,
-0.8915976, -0.07420646, -1.37076, 0, 0, 1, 1, 1,
-0.8910133, -0.7698268, -0.6998016, 1, 0, 0, 1, 1,
-0.8881959, -1.133727, -2.249031, 1, 0, 0, 1, 1,
-0.8873754, 0.9915907, 0.4221607, 1, 0, 0, 1, 1,
-0.8831171, 0.09621505, 0.8785561, 1, 0, 0, 1, 1,
-0.879055, 1.632655, -0.2410405, 1, 0, 0, 1, 1,
-0.8788583, 0.2913919, -0.3467056, 0, 0, 0, 1, 1,
-0.8763483, -1.388702, -2.114979, 0, 0, 0, 1, 1,
-0.8661284, 0.614885, -2.142404, 0, 0, 0, 1, 1,
-0.8609715, -0.2736582, -2.122953, 0, 0, 0, 1, 1,
-0.8594587, -0.2038321, -1.979585, 0, 0, 0, 1, 1,
-0.8581582, -0.3875193, -3.411639, 0, 0, 0, 1, 1,
-0.8526781, 0.8937179, -3.338402, 0, 0, 0, 1, 1,
-0.849121, -1.812478, -2.034685, 1, 1, 1, 1, 1,
-0.8471529, 0.4214031, -2.341396, 1, 1, 1, 1, 1,
-0.8300022, -0.5450407, -0.8555953, 1, 1, 1, 1, 1,
-0.8292816, 2.038752, -0.08247317, 1, 1, 1, 1, 1,
-0.8147669, -1.383234, -3.876307, 1, 1, 1, 1, 1,
-0.8107978, -1.35261, -4.019266, 1, 1, 1, 1, 1,
-0.8085658, 0.00513046, -3.077184, 1, 1, 1, 1, 1,
-0.7981669, -1.065183, -3.228664, 1, 1, 1, 1, 1,
-0.7969507, 0.8218691, -0.8066681, 1, 1, 1, 1, 1,
-0.7959793, -0.9003775, -0.03886129, 1, 1, 1, 1, 1,
-0.7941669, 1.982285, -1.78686, 1, 1, 1, 1, 1,
-0.7928823, -0.4638275, -0.4234178, 1, 1, 1, 1, 1,
-0.7870438, -0.9692427, -2.645927, 1, 1, 1, 1, 1,
-0.7857555, -0.8286566, -2.65765, 1, 1, 1, 1, 1,
-0.7831659, -1.359453, -1.987099, 1, 1, 1, 1, 1,
-0.7737616, 0.297368, -2.900136, 0, 0, 1, 1, 1,
-0.7716881, -1.989618, -1.34723, 1, 0, 0, 1, 1,
-0.7701849, 0.8709233, -0.4523102, 1, 0, 0, 1, 1,
-0.7638184, -0.7064084, -0.6164104, 1, 0, 0, 1, 1,
-0.7607465, -1.472642, -2.01712, 1, 0, 0, 1, 1,
-0.7607285, 2.001043, -1.814052, 1, 0, 0, 1, 1,
-0.7583286, -0.5377178, -0.6993942, 0, 0, 0, 1, 1,
-0.7524085, 0.2471448, -1.275565, 0, 0, 0, 1, 1,
-0.7511045, 0.5986181, 0.6948818, 0, 0, 0, 1, 1,
-0.7453409, 1.794165, -1.668062, 0, 0, 0, 1, 1,
-0.7440071, -0.9177263, -3.07324, 0, 0, 0, 1, 1,
-0.7430533, -1.420583, -4.875222, 0, 0, 0, 1, 1,
-0.7427762, -0.6041265, -1.562975, 0, 0, 0, 1, 1,
-0.7414062, 2.690204, 0.6000678, 1, 1, 1, 1, 1,
-0.734712, -0.8570375, -0.3704432, 1, 1, 1, 1, 1,
-0.7343612, 0.776667, 0.8245984, 1, 1, 1, 1, 1,
-0.7342147, 0.6058918, 0.09288771, 1, 1, 1, 1, 1,
-0.7312192, -0.7135736, -3.380597, 1, 1, 1, 1, 1,
-0.725207, -1.902376, -1.769644, 1, 1, 1, 1, 1,
-0.7218544, -1.509956, -3.288479, 1, 1, 1, 1, 1,
-0.7218258, 0.2522442, -3.41138, 1, 1, 1, 1, 1,
-0.7182894, 0.278516, -0.8603405, 1, 1, 1, 1, 1,
-0.7175796, 2.231208, -0.0001415357, 1, 1, 1, 1, 1,
-0.7159433, 0.3994653, -0.1675251, 1, 1, 1, 1, 1,
-0.7144865, 0.7550907, 0.3810804, 1, 1, 1, 1, 1,
-0.7114331, 1.776553, 0.412169, 1, 1, 1, 1, 1,
-0.7093251, 1.0487, -0.5510038, 1, 1, 1, 1, 1,
-0.7018752, -0.08558396, -0.9568788, 1, 1, 1, 1, 1,
-0.7006552, -0.2672068, -2.025825, 0, 0, 1, 1, 1,
-0.6939186, 0.7138231, -1.135956, 1, 0, 0, 1, 1,
-0.691878, 0.6009186, -1.517975, 1, 0, 0, 1, 1,
-0.6889629, -0.6369491, -1.278671, 1, 0, 0, 1, 1,
-0.6855924, -0.7417975, -2.064715, 1, 0, 0, 1, 1,
-0.6851701, -0.6959293, -2.431993, 1, 0, 0, 1, 1,
-0.6787624, -0.1424771, -1.638877, 0, 0, 0, 1, 1,
-0.6743326, 1.03749, -0.8316531, 0, 0, 0, 1, 1,
-0.6686352, -1.463727, -2.219029, 0, 0, 0, 1, 1,
-0.6603512, -0.0549966, -1.09688, 0, 0, 0, 1, 1,
-0.6581607, -0.2924229, -1.734108, 0, 0, 0, 1, 1,
-0.642068, -0.5167592, -3.00295, 0, 0, 0, 1, 1,
-0.6354863, -0.8571625, -1.667795, 0, 0, 0, 1, 1,
-0.6286623, -0.4491717, -3.049458, 1, 1, 1, 1, 1,
-0.62683, -0.6242532, -2.161383, 1, 1, 1, 1, 1,
-0.6265138, -0.5902493, -2.134935, 1, 1, 1, 1, 1,
-0.6259454, 0.2957528, -1.728864, 1, 1, 1, 1, 1,
-0.621394, -0.3095126, -1.622748, 1, 1, 1, 1, 1,
-0.6191918, 0.2936487, -1.48725, 1, 1, 1, 1, 1,
-0.6189682, 0.3660508, -1.645247, 1, 1, 1, 1, 1,
-0.6135473, 1.982874, -1.736126, 1, 1, 1, 1, 1,
-0.6135194, -0.1801994, -2.019912, 1, 1, 1, 1, 1,
-0.6123559, -0.01785986, -1.227581, 1, 1, 1, 1, 1,
-0.6112583, -0.1103454, -1.85674, 1, 1, 1, 1, 1,
-0.6092545, 1.265349, 1.445449, 1, 1, 1, 1, 1,
-0.608211, 0.2105263, -0.5607084, 1, 1, 1, 1, 1,
-0.6056339, -1.618762, -3.182269, 1, 1, 1, 1, 1,
-0.6045156, 0.24453, -0.2491462, 1, 1, 1, 1, 1,
-0.6030686, -0.4902127, -2.913755, 0, 0, 1, 1, 1,
-0.5985236, 1.154448, -0.11969, 1, 0, 0, 1, 1,
-0.5906026, 0.6040734, -0.08054321, 1, 0, 0, 1, 1,
-0.5891467, 1.315728, -1.61294, 1, 0, 0, 1, 1,
-0.5846655, -1.182188, -4.016298, 1, 0, 0, 1, 1,
-0.5827334, 0.5802703, -0.903959, 1, 0, 0, 1, 1,
-0.5821694, 0.7384956, -0.5707451, 0, 0, 0, 1, 1,
-0.5796406, -1.503763, -3.703774, 0, 0, 0, 1, 1,
-0.5795874, -0.5423522, -3.269235, 0, 0, 0, 1, 1,
-0.5788641, 2.117966, -2.652327, 0, 0, 0, 1, 1,
-0.5751705, -0.3931717, -1.543321, 0, 0, 0, 1, 1,
-0.5734969, 0.9920525, 0.07399097, 0, 0, 0, 1, 1,
-0.5734458, 0.9572743, 0.1821315, 0, 0, 0, 1, 1,
-0.5688286, 1.860153, -0.2572955, 1, 1, 1, 1, 1,
-0.5685112, 0.95452, -0.6836323, 1, 1, 1, 1, 1,
-0.5638357, 2.298501, -0.8118866, 1, 1, 1, 1, 1,
-0.5597827, 0.01262249, -1.766762, 1, 1, 1, 1, 1,
-0.5584885, -0.7069682, -2.190924, 1, 1, 1, 1, 1,
-0.5562427, 0.8173167, 0.4089892, 1, 1, 1, 1, 1,
-0.5481476, -0.3604992, -2.546117, 1, 1, 1, 1, 1,
-0.5437797, -0.7657498, -2.487689, 1, 1, 1, 1, 1,
-0.540783, -1.484843, -1.503576, 1, 1, 1, 1, 1,
-0.536737, -1.435091, -2.153467, 1, 1, 1, 1, 1,
-0.5284172, 0.8836575, 0.6836966, 1, 1, 1, 1, 1,
-0.5253919, 0.8506569, -1.524631, 1, 1, 1, 1, 1,
-0.5252436, -1.802061, -3.966935, 1, 1, 1, 1, 1,
-0.5188519, -0.773977, 0.7009075, 1, 1, 1, 1, 1,
-0.5144206, 1.002919, -1.338193, 1, 1, 1, 1, 1,
-0.5119645, -0.3877469, -2.74591, 0, 0, 1, 1, 1,
-0.5102682, 0.6138419, -1.174459, 1, 0, 0, 1, 1,
-0.5014209, 0.6956586, -0.6967531, 1, 0, 0, 1, 1,
-0.4953118, 0.6843044, 0.8964967, 1, 0, 0, 1, 1,
-0.4929049, -0.1885296, -2.041869, 1, 0, 0, 1, 1,
-0.4871098, 0.9165265, -1.198784, 1, 0, 0, 1, 1,
-0.4749172, -0.5206836, -3.056715, 0, 0, 0, 1, 1,
-0.4727773, 1.263738, 0.1801898, 0, 0, 0, 1, 1,
-0.4688244, -1.280514, -2.987653, 0, 0, 0, 1, 1,
-0.4661754, 1.730227, 1.369984, 0, 0, 0, 1, 1,
-0.4641422, 0.4101817, 0.1974595, 0, 0, 0, 1, 1,
-0.460491, -1.187087, -1.916593, 0, 0, 0, 1, 1,
-0.4574255, 0.573387, 0.3764355, 0, 0, 0, 1, 1,
-0.4536712, 0.4235208, -0.3945987, 1, 1, 1, 1, 1,
-0.4534735, -0.6403568, -2.647954, 1, 1, 1, 1, 1,
-0.4437473, -0.4670134, -1.018344, 1, 1, 1, 1, 1,
-0.4390252, -0.5151663, -4.043202, 1, 1, 1, 1, 1,
-0.4365313, -0.1066766, -1.880855, 1, 1, 1, 1, 1,
-0.435885, 0.5538185, 0.8455117, 1, 1, 1, 1, 1,
-0.4355595, -0.8093824, -3.331705, 1, 1, 1, 1, 1,
-0.4318893, 0.5531394, -0.3592889, 1, 1, 1, 1, 1,
-0.4311139, -1.450179, -1.180433, 1, 1, 1, 1, 1,
-0.4282725, -0.06281515, -3.393262, 1, 1, 1, 1, 1,
-0.4238867, 1.119946, 0.5238639, 1, 1, 1, 1, 1,
-0.4198849, -0.1765027, -1.903325, 1, 1, 1, 1, 1,
-0.4186278, -0.30181, -1.729075, 1, 1, 1, 1, 1,
-0.4171748, 1.881251, 1.14873, 1, 1, 1, 1, 1,
-0.4158742, -1.428931, -3.239382, 1, 1, 1, 1, 1,
-0.4137116, 0.83486, 0.2394118, 0, 0, 1, 1, 1,
-0.40936, 2.261744, 0.8365366, 1, 0, 0, 1, 1,
-0.4066068, 0.05544645, -0.4145498, 1, 0, 0, 1, 1,
-0.4054844, -1.124894, -0.8466316, 1, 0, 0, 1, 1,
-0.4049553, 1.413744, -0.08563767, 1, 0, 0, 1, 1,
-0.39985, 0.6208289, -2.670887, 1, 0, 0, 1, 1,
-0.3991713, -1.367206, -3.620177, 0, 0, 0, 1, 1,
-0.3973873, 0.1362059, -3.53312, 0, 0, 0, 1, 1,
-0.390828, -0.6715775, -1.074533, 0, 0, 0, 1, 1,
-0.3888739, 0.9363872, -1.339056, 0, 0, 0, 1, 1,
-0.386039, 1.043422, -0.9091018, 0, 0, 0, 1, 1,
-0.3795965, 0.7096241, -0.9044097, 0, 0, 0, 1, 1,
-0.3771496, -0.4218116, -2.021166, 0, 0, 0, 1, 1,
-0.376899, -0.3290732, -1.918593, 1, 1, 1, 1, 1,
-0.3699292, -0.990548, -0.1693937, 1, 1, 1, 1, 1,
-0.3685063, 0.7034116, -2.756512, 1, 1, 1, 1, 1,
-0.3667157, 0.2301783, -1.551693, 1, 1, 1, 1, 1,
-0.3604896, -0.2095106, -1.605388, 1, 1, 1, 1, 1,
-0.3577166, -0.6437655, -1.928503, 1, 1, 1, 1, 1,
-0.3538817, -1.173142, 0.1949763, 1, 1, 1, 1, 1,
-0.3503912, 0.02162414, -2.659027, 1, 1, 1, 1, 1,
-0.3446765, 1.950437, 0.5936307, 1, 1, 1, 1, 1,
-0.330705, 1.001813, -0.1936089, 1, 1, 1, 1, 1,
-0.3300773, 1.149589, 1.26989, 1, 1, 1, 1, 1,
-0.3288784, -0.5027447, -3.157119, 1, 1, 1, 1, 1,
-0.3242507, 0.1219601, -0.4289469, 1, 1, 1, 1, 1,
-0.3235183, -0.5774381, -3.757427, 1, 1, 1, 1, 1,
-0.315539, -0.3827477, -2.664387, 1, 1, 1, 1, 1,
-0.3153151, 0.5531443, -0.5547177, 0, 0, 1, 1, 1,
-0.3141065, 1.79754, 2.21159, 1, 0, 0, 1, 1,
-0.3139736, 0.2842386, -0.88265, 1, 0, 0, 1, 1,
-0.3118257, -0.7246321, -1.431491, 1, 0, 0, 1, 1,
-0.3047979, -0.3350593, -0.6693004, 1, 0, 0, 1, 1,
-0.3032304, -0.7673291, -4.221363, 1, 0, 0, 1, 1,
-0.2978637, 1.722659, 0.6231793, 0, 0, 0, 1, 1,
-0.2969733, -0.6857647, -1.832023, 0, 0, 0, 1, 1,
-0.2910323, -1.445128, -4.651059, 0, 0, 0, 1, 1,
-0.2847722, -1.088286, -2.729162, 0, 0, 0, 1, 1,
-0.2838631, -0.2946123, -3.048208, 0, 0, 0, 1, 1,
-0.2779238, 0.364073, -0.2829908, 0, 0, 0, 1, 1,
-0.2764443, -1.055277, -4.053021, 0, 0, 0, 1, 1,
-0.2730802, -0.657429, -3.080855, 1, 1, 1, 1, 1,
-0.2708364, 1.76802, -0.859454, 1, 1, 1, 1, 1,
-0.2697027, 0.01369212, -1.511197, 1, 1, 1, 1, 1,
-0.2694387, -1.197636, -2.934059, 1, 1, 1, 1, 1,
-0.269063, 0.1610807, -0.8938347, 1, 1, 1, 1, 1,
-0.2661883, -0.6887366, -3.367387, 1, 1, 1, 1, 1,
-0.2482498, 0.4602877, -0.4294218, 1, 1, 1, 1, 1,
-0.247702, -0.5276374, -3.287175, 1, 1, 1, 1, 1,
-0.2456238, -1.351015, -2.694974, 1, 1, 1, 1, 1,
-0.2452496, 1.524842, -0.9049715, 1, 1, 1, 1, 1,
-0.2432914, -0.2108905, -2.61536, 1, 1, 1, 1, 1,
-0.2357664, 0.0657452, -0.08303513, 1, 1, 1, 1, 1,
-0.2343895, 0.72755, -1.859015, 1, 1, 1, 1, 1,
-0.2331693, -1.787391, -3.852654, 1, 1, 1, 1, 1,
-0.2301722, -0.8956383, -2.419648, 1, 1, 1, 1, 1,
-0.2242145, -0.4918632, -2.4902, 0, 0, 1, 1, 1,
-0.2241527, 1.07548, 1.122056, 1, 0, 0, 1, 1,
-0.2218985, -0.5827963, -2.044435, 1, 0, 0, 1, 1,
-0.2217249, 1.080614, -0.3605874, 1, 0, 0, 1, 1,
-0.2178882, -0.2740103, -4.0979, 1, 0, 0, 1, 1,
-0.2175598, -0.7540296, -2.238555, 1, 0, 0, 1, 1,
-0.2146361, 0.1028863, -0.8436673, 0, 0, 0, 1, 1,
-0.2100907, 0.2218598, -0.6292623, 0, 0, 0, 1, 1,
-0.2093388, -0.5798055, -2.474702, 0, 0, 0, 1, 1,
-0.2083962, -1.113523, -2.179061, 0, 0, 0, 1, 1,
-0.2072462, -0.2340751, -2.706888, 0, 0, 0, 1, 1,
-0.1986839, -0.8605835, -1.920419, 0, 0, 0, 1, 1,
-0.1982736, 0.2055915, -0.5374832, 0, 0, 0, 1, 1,
-0.1956629, -1.327233, -2.261878, 1, 1, 1, 1, 1,
-0.1939056, 0.3203122, -1.915622, 1, 1, 1, 1, 1,
-0.1874853, -2.120946, -2.090472, 1, 1, 1, 1, 1,
-0.1849448, -1.896522, -2.568099, 1, 1, 1, 1, 1,
-0.1631996, 0.08822193, 0.5710861, 1, 1, 1, 1, 1,
-0.1527745, 0.9914199, -1.839021, 1, 1, 1, 1, 1,
-0.1448548, 1.173813, -1.836075, 1, 1, 1, 1, 1,
-0.1430177, 1.351184, -0.4722321, 1, 1, 1, 1, 1,
-0.1418132, 0.8612665, 0.116294, 1, 1, 1, 1, 1,
-0.137822, -0.1110042, -0.3961594, 1, 1, 1, 1, 1,
-0.1374945, 0.4366258, -0.395308, 1, 1, 1, 1, 1,
-0.1350026, -0.8110766, -1.879503, 1, 1, 1, 1, 1,
-0.1339251, -0.7391133, -5.690346, 1, 1, 1, 1, 1,
-0.1314319, 0.05962077, -0.5308835, 1, 1, 1, 1, 1,
-0.1280507, -2.274169, -2.631427, 1, 1, 1, 1, 1,
-0.1242255, 1.197978, 0.3471753, 0, 0, 1, 1, 1,
-0.1218735, 0.426062, 1.003422, 1, 0, 0, 1, 1,
-0.1205508, -0.7175301, -2.895778, 1, 0, 0, 1, 1,
-0.1200222, 1.704885, 0.7267547, 1, 0, 0, 1, 1,
-0.1167491, -2.296804, -4.755511, 1, 0, 0, 1, 1,
-0.1120478, 0.2467923, -0.5946994, 1, 0, 0, 1, 1,
-0.1074507, 0.4310242, -0.9300522, 0, 0, 0, 1, 1,
-0.1067631, -2.003902, -1.626277, 0, 0, 0, 1, 1,
-0.1066236, -2.107051, -3.974623, 0, 0, 0, 1, 1,
-0.1052117, 0.6282197, 1.604241, 0, 0, 0, 1, 1,
-0.104572, 1.569221, 0.4808146, 0, 0, 0, 1, 1,
-0.09754046, 0.3050306, 0.9236932, 0, 0, 0, 1, 1,
-0.09594128, 0.4313355, 0.373786, 0, 0, 0, 1, 1,
-0.09409792, -1.362685, -3.047853, 1, 1, 1, 1, 1,
-0.08973857, 1.525584, 0.3002966, 1, 1, 1, 1, 1,
-0.08789546, -1.428643, -4.275306, 1, 1, 1, 1, 1,
-0.08741663, 1.321936, 0.2408796, 1, 1, 1, 1, 1,
-0.08118122, -0.9767795, -5.265674, 1, 1, 1, 1, 1,
-0.07949887, -0.7762731, -2.946769, 1, 1, 1, 1, 1,
-0.07764077, -0.07481637, -3.183529, 1, 1, 1, 1, 1,
-0.07339272, 0.2661653, -0.7347687, 1, 1, 1, 1, 1,
-0.07289154, 0.6161855, -1.171704, 1, 1, 1, 1, 1,
-0.06970038, 0.4064037, -1.201319, 1, 1, 1, 1, 1,
-0.06877156, -0.6309072, -2.726495, 1, 1, 1, 1, 1,
-0.06523278, 0.4966529, 0.557251, 1, 1, 1, 1, 1,
-0.06019637, -0.2087871, -4.427601, 1, 1, 1, 1, 1,
-0.05463268, 0.995127, -0.7323064, 1, 1, 1, 1, 1,
-0.05393695, -1.195341, -2.367365, 1, 1, 1, 1, 1,
-0.04963255, 0.7410812, -1.096312, 0, 0, 1, 1, 1,
-0.04097316, -0.6331061, -3.348913, 1, 0, 0, 1, 1,
-0.03996685, 0.9501061, 0.1976026, 1, 0, 0, 1, 1,
-0.03940003, 0.4761389, 0.5017202, 1, 0, 0, 1, 1,
-0.03820645, 1.260712, 1.710114, 1, 0, 0, 1, 1,
-0.03749867, -1.686227, -3.668027, 1, 0, 0, 1, 1,
-0.03511382, 0.3910351, -0.2713318, 0, 0, 0, 1, 1,
-0.03227077, 1.120939, 0.1895685, 0, 0, 0, 1, 1,
-0.03148204, 0.4920157, -0.2343549, 0, 0, 0, 1, 1,
-0.03091811, -0.4233536, -3.682592, 0, 0, 0, 1, 1,
-0.02904672, -0.3226293, -3.259741, 0, 0, 0, 1, 1,
-0.02895708, 1.535644, 1.344009, 0, 0, 0, 1, 1,
-0.02518236, -0.424244, -2.705598, 0, 0, 0, 1, 1,
-0.02287744, 0.9834312, -0.4418164, 1, 1, 1, 1, 1,
-0.0175873, 1.20456, -0.6659023, 1, 1, 1, 1, 1,
-0.01743837, 0.5302241, -2.111243, 1, 1, 1, 1, 1,
-0.01646362, 0.3348244, 0.03431848, 1, 1, 1, 1, 1,
-0.01150914, -1.128677, -3.891746, 1, 1, 1, 1, 1,
-0.004932391, 1.491304, -0.3098468, 1, 1, 1, 1, 1,
-0.004091104, 0.8285143, 0.5858618, 1, 1, 1, 1, 1,
-0.003700396, -0.001098317, -1.882167, 1, 1, 1, 1, 1,
-0.002933612, -1.041439, -3.116014, 1, 1, 1, 1, 1,
-0.0007305536, 0.08436736, 2.335095, 1, 1, 1, 1, 1,
0.001655205, 1.495756, -0.729046, 1, 1, 1, 1, 1,
0.002988008, -1.266925, 2.414718, 1, 1, 1, 1, 1,
0.004937075, -0.3993067, 2.403909, 1, 1, 1, 1, 1,
0.005211592, -0.1176443, 4.974581, 1, 1, 1, 1, 1,
0.00700821, 1.408186, -0.1732291, 1, 1, 1, 1, 1,
0.007093318, 0.2793843, -1.052489, 0, 0, 1, 1, 1,
0.007596054, -1.89693, 2.97326, 1, 0, 0, 1, 1,
0.009409734, -1.781032, 4.733821, 1, 0, 0, 1, 1,
0.01406293, 1.716509, 0.6777391, 1, 0, 0, 1, 1,
0.01792975, -0.7932445, 1.855246, 1, 0, 0, 1, 1,
0.0220113, 0.921176, 0.238596, 1, 0, 0, 1, 1,
0.03546199, -0.506723, 2.616562, 0, 0, 0, 1, 1,
0.03584031, -0.9613105, 4.340801, 0, 0, 0, 1, 1,
0.03703225, -1.64042, 3.501688, 0, 0, 0, 1, 1,
0.03769824, -0.3319319, 2.639421, 0, 0, 0, 1, 1,
0.03791451, 1.048125, 0.3893462, 0, 0, 0, 1, 1,
0.04027765, 1.027979, -1.200109, 0, 0, 0, 1, 1,
0.04082631, 0.3140876, 0.4608721, 0, 0, 0, 1, 1,
0.04150999, -1.360775, 1.849247, 1, 1, 1, 1, 1,
0.04155885, -2.110402, 1.572811, 1, 1, 1, 1, 1,
0.04203349, -1.328979, 2.852505, 1, 1, 1, 1, 1,
0.04499308, -0.9747338, 3.116314, 1, 1, 1, 1, 1,
0.04580555, -0.2709327, 1.879703, 1, 1, 1, 1, 1,
0.04643315, -1.156095, 2.061158, 1, 1, 1, 1, 1,
0.04723427, 0.1688137, 1.105582, 1, 1, 1, 1, 1,
0.0472464, -1.198028, 3.159797, 1, 1, 1, 1, 1,
0.04949285, 1.056423, 0.07011662, 1, 1, 1, 1, 1,
0.05471133, 0.756595, -0.5847789, 1, 1, 1, 1, 1,
0.05679646, 0.1547051, 2.362115, 1, 1, 1, 1, 1,
0.05834874, -0.1604752, 2.277452, 1, 1, 1, 1, 1,
0.06123974, 0.7837676, -0.3496422, 1, 1, 1, 1, 1,
0.06226591, -0.1314695, 2.049485, 1, 1, 1, 1, 1,
0.0623839, 2.098183, -1.270682, 1, 1, 1, 1, 1,
0.06557719, -0.1666759, 2.932156, 0, 0, 1, 1, 1,
0.06821699, 0.3799118, 1.192074, 1, 0, 0, 1, 1,
0.06873956, -1.629215, 2.892832, 1, 0, 0, 1, 1,
0.06931362, -0.7736349, 2.774324, 1, 0, 0, 1, 1,
0.07286005, -0.7101126, 3.250666, 1, 0, 0, 1, 1,
0.07365753, -0.1940828, 3.147146, 1, 0, 0, 1, 1,
0.07402379, 0.2890219, 1.673781, 0, 0, 0, 1, 1,
0.07481482, -0.9348899, 3.237453, 0, 0, 0, 1, 1,
0.07828634, -0.5336396, 3.189331, 0, 0, 0, 1, 1,
0.08573736, -0.491283, 4.696026, 0, 0, 0, 1, 1,
0.08863873, 0.7188844, 0.4213876, 0, 0, 0, 1, 1,
0.09015942, -0.2098491, 2.614675, 0, 0, 0, 1, 1,
0.09727416, 1.430669, -1.006534, 0, 0, 0, 1, 1,
0.09761482, 0.5546159, 1.400547, 1, 1, 1, 1, 1,
0.1029386, -0.6329554, 4.391549, 1, 1, 1, 1, 1,
0.1035619, 1.143569, -0.5296811, 1, 1, 1, 1, 1,
0.1086602, -0.7607929, 3.925299, 1, 1, 1, 1, 1,
0.1087284, 1.091613, 1.756363, 1, 1, 1, 1, 1,
0.1129025, -0.9651471, 4.139728, 1, 1, 1, 1, 1,
0.1129226, -0.5821875, 4.185307, 1, 1, 1, 1, 1,
0.1139493, 0.8030184, -1.453986, 1, 1, 1, 1, 1,
0.1156519, -0.0691341, 1.346209, 1, 1, 1, 1, 1,
0.116831, -0.8257872, 3.124894, 1, 1, 1, 1, 1,
0.1221856, -0.5189023, 2.825409, 1, 1, 1, 1, 1,
0.1238297, -0.3168575, 2.959964, 1, 1, 1, 1, 1,
0.1250833, -0.5381529, 4.397578, 1, 1, 1, 1, 1,
0.1254952, 0.7003587, 1.462457, 1, 1, 1, 1, 1,
0.1312941, 0.1697449, 1.634994, 1, 1, 1, 1, 1,
0.1326031, 1.637375, 1.376068, 0, 0, 1, 1, 1,
0.1334676, 2.242575, -0.579733, 1, 0, 0, 1, 1,
0.1381733, 0.2469627, -0.2216603, 1, 0, 0, 1, 1,
0.1408588, -0.6182302, 2.54816, 1, 0, 0, 1, 1,
0.1418474, 0.2279803, 0.3751514, 1, 0, 0, 1, 1,
0.1421866, -0.05435835, 1.776896, 1, 0, 0, 1, 1,
0.1468908, 0.9973953, 0.9897442, 0, 0, 0, 1, 1,
0.1526037, -1.264541, 4.012536, 0, 0, 0, 1, 1,
0.1536701, -0.2352289, 1.561312, 0, 0, 0, 1, 1,
0.1594398, 0.1623934, -0.9161164, 0, 0, 0, 1, 1,
0.1624886, 0.3048944, 1.601847, 0, 0, 0, 1, 1,
0.1641553, 1.604057, -1.316589, 0, 0, 0, 1, 1,
0.1683013, 0.2940159, 1.899212, 0, 0, 0, 1, 1,
0.1713176, 0.1055962, -0.4630724, 1, 1, 1, 1, 1,
0.1722461, -1.00765, 1.276577, 1, 1, 1, 1, 1,
0.1726653, -1.144452, 1.961811, 1, 1, 1, 1, 1,
0.172815, 1.180563, 0.03241711, 1, 1, 1, 1, 1,
0.1732025, 1.105397, -0.8964491, 1, 1, 1, 1, 1,
0.177454, 2.838688, -0.6934509, 1, 1, 1, 1, 1,
0.1796138, 0.7133908, 1.194069, 1, 1, 1, 1, 1,
0.186996, 0.5303018, -0.9782084, 1, 1, 1, 1, 1,
0.1917265, -1.123509, 2.556331, 1, 1, 1, 1, 1,
0.1958805, 1.524477, 1.361412, 1, 1, 1, 1, 1,
0.1962793, 1.209368, 0.5055275, 1, 1, 1, 1, 1,
0.1966746, 0.08550967, 1.555729, 1, 1, 1, 1, 1,
0.1968764, 1.355542, 0.458548, 1, 1, 1, 1, 1,
0.1993263, -0.1538674, 4.043952, 1, 1, 1, 1, 1,
0.2014714, 0.06194585, 2.098094, 1, 1, 1, 1, 1,
0.2032402, -0.3231969, 2.339303, 0, 0, 1, 1, 1,
0.2036102, -0.7855752, 3.279356, 1, 0, 0, 1, 1,
0.2048624, 2.495404, 1.126188, 1, 0, 0, 1, 1,
0.2082855, 0.3670953, 1.451936, 1, 0, 0, 1, 1,
0.2088727, 0.9704641, -1.112983, 1, 0, 0, 1, 1,
0.2094946, 1.761908, -0.3969931, 1, 0, 0, 1, 1,
0.210813, 0.6881342, 1.776707, 0, 0, 0, 1, 1,
0.2128812, 0.411011, 1.038747, 0, 0, 0, 1, 1,
0.2139559, -0.1861528, 1.737306, 0, 0, 0, 1, 1,
0.2148267, 0.6107321, 1.773547, 0, 0, 0, 1, 1,
0.2150391, -1.420289, 2.670187, 0, 0, 0, 1, 1,
0.2180625, 1.673658, 1.951209, 0, 0, 0, 1, 1,
0.2234269, -1.453357, 3.174189, 0, 0, 0, 1, 1,
0.223803, 1.16788, -0.4336982, 1, 1, 1, 1, 1,
0.2254983, -2.519419, 1.204504, 1, 1, 1, 1, 1,
0.2309769, 0.6746002, 1.209955, 1, 1, 1, 1, 1,
0.2369056, -0.6796344, 2.694145, 1, 1, 1, 1, 1,
0.2418341, -0.2181596, 2.340367, 1, 1, 1, 1, 1,
0.2438964, -0.7591151, 2.947485, 1, 1, 1, 1, 1,
0.2445621, 0.0978393, -0.07918983, 1, 1, 1, 1, 1,
0.2567951, -0.7432162, 4.443328, 1, 1, 1, 1, 1,
0.2600934, 0.797117, 0.2318311, 1, 1, 1, 1, 1,
0.2629237, -0.2738699, 2.209143, 1, 1, 1, 1, 1,
0.2660571, -1.858471, 3.129125, 1, 1, 1, 1, 1,
0.2665482, -1.665102, 2.844612, 1, 1, 1, 1, 1,
0.2669895, -0.5553926, 1.288841, 1, 1, 1, 1, 1,
0.2683047, -1.351965, 4.330062, 1, 1, 1, 1, 1,
0.2685969, 0.7149774, -0.1640361, 1, 1, 1, 1, 1,
0.2714915, -0.5426665, 3.514234, 0, 0, 1, 1, 1,
0.2730096, 1.366652, -1.75516, 1, 0, 0, 1, 1,
0.2746548, -2.184389, 2.649468, 1, 0, 0, 1, 1,
0.2749802, 1.076924, 1.438285, 1, 0, 0, 1, 1,
0.2765657, 0.3872204, 2.585704, 1, 0, 0, 1, 1,
0.2805432, 1.326455, -0.03276103, 1, 0, 0, 1, 1,
0.2879162, 1.342903, 0.6660981, 0, 0, 0, 1, 1,
0.2922212, 0.8263351, 1.018944, 0, 0, 0, 1, 1,
0.2987841, 0.4550482, 1.150372, 0, 0, 0, 1, 1,
0.2993395, 0.3814416, 2.381617, 0, 0, 0, 1, 1,
0.301541, -0.5366756, 3.783182, 0, 0, 0, 1, 1,
0.3034412, -1.64581, 2.424206, 0, 0, 0, 1, 1,
0.3057318, 1.779388, -0.8015636, 0, 0, 0, 1, 1,
0.3136826, -0.5037705, 2.475024, 1, 1, 1, 1, 1,
0.3160817, -1.305225, 3.603016, 1, 1, 1, 1, 1,
0.322503, 0.05408821, 2.3282, 1, 1, 1, 1, 1,
0.3273394, 0.3581032, 1.627237, 1, 1, 1, 1, 1,
0.3284162, 1.719786, 2.296976, 1, 1, 1, 1, 1,
0.3299493, 0.7575099, 2.312936, 1, 1, 1, 1, 1,
0.3356948, 0.3704436, -0.5725474, 1, 1, 1, 1, 1,
0.3402695, 0.8048949, -1.117711, 1, 1, 1, 1, 1,
0.3407582, -0.8284781, 2.532061, 1, 1, 1, 1, 1,
0.3451864, -0.5335057, 2.999365, 1, 1, 1, 1, 1,
0.3520469, -0.9602591, 1.548918, 1, 1, 1, 1, 1,
0.3536915, 1.300606, -0.8697864, 1, 1, 1, 1, 1,
0.3582746, -0.7058247, 1.599059, 1, 1, 1, 1, 1,
0.3623995, 1.588447, 0.2116197, 1, 1, 1, 1, 1,
0.3652275, -1.232555, 3.305876, 1, 1, 1, 1, 1,
0.3670065, 0.01598141, -0.4283077, 0, 0, 1, 1, 1,
0.3699031, -0.5848245, 1.604657, 1, 0, 0, 1, 1,
0.3716975, 0.8066711, 2.22172, 1, 0, 0, 1, 1,
0.3734669, -0.1691428, 0.6658292, 1, 0, 0, 1, 1,
0.3735726, 1.053813, 1.854141, 1, 0, 0, 1, 1,
0.3746257, 0.4862555, -0.1747547, 1, 0, 0, 1, 1,
0.3749021, -0.9731306, 2.603911, 0, 0, 0, 1, 1,
0.3760747, -0.05000241, 3.401266, 0, 0, 0, 1, 1,
0.378811, -0.9479979, 4.615382, 0, 0, 0, 1, 1,
0.3799853, -0.1334221, -0.3506939, 0, 0, 0, 1, 1,
0.3810036, 0.2654202, 1.401004, 0, 0, 0, 1, 1,
0.3834173, 0.3730955, -0.08846644, 0, 0, 0, 1, 1,
0.3854138, -0.4534504, 3.33372, 0, 0, 0, 1, 1,
0.3903544, -0.3781553, 3.690988, 1, 1, 1, 1, 1,
0.3912072, -0.1400745, 2.09043, 1, 1, 1, 1, 1,
0.3944498, -0.939909, 2.558044, 1, 1, 1, 1, 1,
0.3971648, 1.301852, 0.8353716, 1, 1, 1, 1, 1,
0.3973665, -0.818123, 4.346432, 1, 1, 1, 1, 1,
0.3974842, 0.5402464, -0.6484424, 1, 1, 1, 1, 1,
0.3989408, 0.4550792, 3.744438, 1, 1, 1, 1, 1,
0.4006152, -0.284015, 3.610751, 1, 1, 1, 1, 1,
0.4010305, 0.2846015, 0.3109111, 1, 1, 1, 1, 1,
0.4028086, -1.14428, 2.727965, 1, 1, 1, 1, 1,
0.4054012, 0.7129336, 0.4824693, 1, 1, 1, 1, 1,
0.406942, 0.199511, 2.064618, 1, 1, 1, 1, 1,
0.4121579, 0.704565, -1.463647, 1, 1, 1, 1, 1,
0.4148709, 0.2434059, 3.459139, 1, 1, 1, 1, 1,
0.4149608, 0.1668524, 0.6123104, 1, 1, 1, 1, 1,
0.4153827, -1.863659, 2.458011, 0, 0, 1, 1, 1,
0.4160233, -0.5782821, 3.591707, 1, 0, 0, 1, 1,
0.4197748, 0.06429077, 2.94841, 1, 0, 0, 1, 1,
0.4203929, -0.1844324, 1.374011, 1, 0, 0, 1, 1,
0.4211294, 0.5432089, 1.254648, 1, 0, 0, 1, 1,
0.4219752, -0.02754585, 2.170237, 1, 0, 0, 1, 1,
0.4242277, 0.06571743, 1.815261, 0, 0, 0, 1, 1,
0.424576, 1.349805, -1.40217, 0, 0, 0, 1, 1,
0.4256839, 0.8522361, 1.393523, 0, 0, 0, 1, 1,
0.4281388, 0.2731534, 2.084934, 0, 0, 0, 1, 1,
0.4305573, 0.8244247, -0.3161877, 0, 0, 0, 1, 1,
0.4339703, 2.045182, 1.35835, 0, 0, 0, 1, 1,
0.4361959, 0.428193, -0.915786, 0, 0, 0, 1, 1,
0.4376647, -0.3978573, 2.197819, 1, 1, 1, 1, 1,
0.4404637, 0.06089621, 2.942093, 1, 1, 1, 1, 1,
0.4407701, -0.07041005, 1.7073, 1, 1, 1, 1, 1,
0.442057, -0.3246121, 1.550476, 1, 1, 1, 1, 1,
0.4420668, -1.295863, 3.546968, 1, 1, 1, 1, 1,
0.442266, 0.009629745, 1.833407, 1, 1, 1, 1, 1,
0.4445344, -0.6959838, 2.810268, 1, 1, 1, 1, 1,
0.4467502, 0.1596355, 2.046835, 1, 1, 1, 1, 1,
0.4510172, -0.8883682, 2.337381, 1, 1, 1, 1, 1,
0.4559133, -0.247962, 1.008309, 1, 1, 1, 1, 1,
0.4561606, -0.4187985, 4.485915, 1, 1, 1, 1, 1,
0.4620563, 0.741303, 0.6172672, 1, 1, 1, 1, 1,
0.4620867, -1.800569, 3.090534, 1, 1, 1, 1, 1,
0.4621044, -1.988172, 1.786705, 1, 1, 1, 1, 1,
0.463915, -0.4532661, 1.780987, 1, 1, 1, 1, 1,
0.464509, -0.002745846, 3.99664, 0, 0, 1, 1, 1,
0.4665391, 1.574548, 0.6357704, 1, 0, 0, 1, 1,
0.4679143, -0.1280733, 2.861845, 1, 0, 0, 1, 1,
0.4697548, -0.13832, 1.270945, 1, 0, 0, 1, 1,
0.4798417, -1.381172, 3.133802, 1, 0, 0, 1, 1,
0.4810309, -0.4190223, 3.65751, 1, 0, 0, 1, 1,
0.4880979, 1.246246, -1.798757, 0, 0, 0, 1, 1,
0.4922635, 0.7679783, -0.9965462, 0, 0, 0, 1, 1,
0.495543, -0.06051335, 1.274663, 0, 0, 0, 1, 1,
0.4966105, -0.5021459, 3.372476, 0, 0, 0, 1, 1,
0.5050191, -0.5059472, 1.99727, 0, 0, 0, 1, 1,
0.5110629, 1.128031, 1.735357, 0, 0, 0, 1, 1,
0.5133677, -1.230854, 2.5771, 0, 0, 0, 1, 1,
0.5152051, 1.346883, 0.2416878, 1, 1, 1, 1, 1,
0.5169528, -2.209263, 2.864273, 1, 1, 1, 1, 1,
0.5171372, -0.765277, 2.205284, 1, 1, 1, 1, 1,
0.5312041, 2.763642, 1.316951, 1, 1, 1, 1, 1,
0.5330571, 0.8129203, 1.940161, 1, 1, 1, 1, 1,
0.5335388, 0.3656602, 0.5658796, 1, 1, 1, 1, 1,
0.5379039, 0.7835253, 0.584509, 1, 1, 1, 1, 1,
0.538395, 0.3376239, 0.5644394, 1, 1, 1, 1, 1,
0.5409288, -0.9686312, 1.065805, 1, 1, 1, 1, 1,
0.5412298, 1.341935, -1.509485, 1, 1, 1, 1, 1,
0.5445796, 0.4486563, 0.7291983, 1, 1, 1, 1, 1,
0.5458223, -0.2830307, 0.9066013, 1, 1, 1, 1, 1,
0.5476995, -2.282094, 3.911468, 1, 1, 1, 1, 1,
0.5494664, 0.5256284, 1.414347, 1, 1, 1, 1, 1,
0.5517833, -1.501636, 0.9570176, 1, 1, 1, 1, 1,
0.5523342, 0.8492112, -0.9234283, 0, 0, 1, 1, 1,
0.5552794, 0.3198969, 2.195915, 1, 0, 0, 1, 1,
0.5624935, -0.6268016, 3.001685, 1, 0, 0, 1, 1,
0.5684689, 0.1764174, -0.09003413, 1, 0, 0, 1, 1,
0.579711, 0.2315182, 1.237347, 1, 0, 0, 1, 1,
0.580948, -1.089469, 2.463491, 1, 0, 0, 1, 1,
0.5868585, -0.1383691, 1.368304, 0, 0, 0, 1, 1,
0.5869058, 0.8036616, -0.6986731, 0, 0, 0, 1, 1,
0.5880544, 0.4729401, 2.573596, 0, 0, 0, 1, 1,
0.5896857, 0.2880452, 0.02629768, 0, 0, 0, 1, 1,
0.5948361, -0.2486474, 3.097945, 0, 0, 0, 1, 1,
0.5957018, -0.1405654, 1.544767, 0, 0, 0, 1, 1,
0.5989517, -1.106238, 3.669234, 0, 0, 0, 1, 1,
0.6076871, -0.2034518, 2.803024, 1, 1, 1, 1, 1,
0.6099532, 0.4223635, 1.694162, 1, 1, 1, 1, 1,
0.6182986, 0.5809748, 0.7436489, 1, 1, 1, 1, 1,
0.6190679, 0.48871, 1.870963, 1, 1, 1, 1, 1,
0.619136, 1.212423, 0.4132032, 1, 1, 1, 1, 1,
0.6250402, 1.641715, 0.005762387, 1, 1, 1, 1, 1,
0.6274891, 0.1058675, 1.438092, 1, 1, 1, 1, 1,
0.628979, 0.6756149, 2.665558, 1, 1, 1, 1, 1,
0.6301385, 1.489234, -0.7013977, 1, 1, 1, 1, 1,
0.633303, 2.595572, -1.601578, 1, 1, 1, 1, 1,
0.6357882, 0.012176, 1.667659, 1, 1, 1, 1, 1,
0.6364884, 1.902275, 1.254691, 1, 1, 1, 1, 1,
0.6417949, 0.7353216, 0.5856856, 1, 1, 1, 1, 1,
0.6420234, -1.356886, 3.410536, 1, 1, 1, 1, 1,
0.6420651, 1.618968, 0.8669955, 1, 1, 1, 1, 1,
0.643878, -0.2652504, 2.073062, 0, 0, 1, 1, 1,
0.649025, 0.873157, 0.0127056, 1, 0, 0, 1, 1,
0.6546971, 0.3176757, 1.549893, 1, 0, 0, 1, 1,
0.6547346, 0.04660206, 2.483534, 1, 0, 0, 1, 1,
0.6577796, -1.249075, 3.798376, 1, 0, 0, 1, 1,
0.659451, -2.248711, 3.001248, 1, 0, 0, 1, 1,
0.6675116, -1.061209, 2.306305, 0, 0, 0, 1, 1,
0.6690491, 2.610734, 2.258594, 0, 0, 0, 1, 1,
0.6743503, -0.7492691, 3.684887, 0, 0, 0, 1, 1,
0.6774737, -0.6262102, 2.591938, 0, 0, 0, 1, 1,
0.6791871, 0.8946554, 2.679915, 0, 0, 0, 1, 1,
0.6805894, -1.810187, 2.543656, 0, 0, 0, 1, 1,
0.6812423, 0.8367496, -0.6658323, 0, 0, 0, 1, 1,
0.6848403, 1.055251, 0.1455225, 1, 1, 1, 1, 1,
0.6928515, -1.652916, 0.5928467, 1, 1, 1, 1, 1,
0.6960496, -0.02810628, 2.034731, 1, 1, 1, 1, 1,
0.6978397, -0.5413072, 2.3586, 1, 1, 1, 1, 1,
0.6982463, -0.3501307, 0.01697615, 1, 1, 1, 1, 1,
0.7035212, 0.2512607, 1.350953, 1, 1, 1, 1, 1,
0.7062672, -0.4363331, 3.248157, 1, 1, 1, 1, 1,
0.7121443, -0.9057462, 1.526932, 1, 1, 1, 1, 1,
0.7136898, 0.4612368, 0.3109112, 1, 1, 1, 1, 1,
0.7148188, -0.4736709, 2.496529, 1, 1, 1, 1, 1,
0.7258977, -2.285357, 3.464394, 1, 1, 1, 1, 1,
0.7274507, -1.128328, 1.728599, 1, 1, 1, 1, 1,
0.7285222, -0.1218436, 2.935867, 1, 1, 1, 1, 1,
0.7292334, 0.9411349, -1.099805, 1, 1, 1, 1, 1,
0.7331601, -0.1981934, 0.9991838, 1, 1, 1, 1, 1,
0.7337866, 0.09594686, 0.7250589, 0, 0, 1, 1, 1,
0.744898, 0.9305543, 0.8183349, 1, 0, 0, 1, 1,
0.7496195, -0.7879099, 1.733959, 1, 0, 0, 1, 1,
0.7532234, 1.115973, 2.393107, 1, 0, 0, 1, 1,
0.7546896, -1.127258, 1.773809, 1, 0, 0, 1, 1,
0.7564533, -1.524611, 2.945699, 1, 0, 0, 1, 1,
0.7614629, -0.8908974, 2.807857, 0, 0, 0, 1, 1,
0.7662739, -1.500871, 2.290832, 0, 0, 0, 1, 1,
0.7663579, -0.19667, 1.581892, 0, 0, 0, 1, 1,
0.7716866, -0.4874847, 3.800931, 0, 0, 0, 1, 1,
0.7748692, -2.345148, 3.584658, 0, 0, 0, 1, 1,
0.7791444, 0.9856176, -0.1758459, 0, 0, 0, 1, 1,
0.7798218, -0.3082609, 2.467542, 0, 0, 0, 1, 1,
0.7863972, 0.2201339, 0.8763918, 1, 1, 1, 1, 1,
0.7904746, 0.1795941, 2.667661, 1, 1, 1, 1, 1,
0.7913197, -0.4752291, 1.134136, 1, 1, 1, 1, 1,
0.7971291, -0.1473618, 1.831995, 1, 1, 1, 1, 1,
0.8014341, -2.161525, 0.3282433, 1, 1, 1, 1, 1,
0.8031102, -0.2128909, 2.530673, 1, 1, 1, 1, 1,
0.8046649, 0.1114223, -0.1565973, 1, 1, 1, 1, 1,
0.8073285, 0.8142795, 0.5069179, 1, 1, 1, 1, 1,
0.8107313, -1.451111, 1.702522, 1, 1, 1, 1, 1,
0.8109128, 0.3947236, 2.358732, 1, 1, 1, 1, 1,
0.8138171, 0.6468163, 0.5077826, 1, 1, 1, 1, 1,
0.8160078, 2.658102, 0.07191907, 1, 1, 1, 1, 1,
0.8209177, -0.9635564, 3.444985, 1, 1, 1, 1, 1,
0.8314589, -0.6453252, 3.184814, 1, 1, 1, 1, 1,
0.8341092, -0.7014359, 3.173898, 1, 1, 1, 1, 1,
0.834503, -0.47611, 1.450401, 0, 0, 1, 1, 1,
0.8348987, -0.77868, 2.03727, 1, 0, 0, 1, 1,
0.8359604, -0.2677987, 3.641675, 1, 0, 0, 1, 1,
0.846719, -0.4036514, 0.6278372, 1, 0, 0, 1, 1,
0.8468691, 1.978235, -0.1586401, 1, 0, 0, 1, 1,
0.8490068, 0.3428699, 0.5914201, 1, 0, 0, 1, 1,
0.849642, 0.1540077, 2.481524, 0, 0, 0, 1, 1,
0.8693414, 0.09271858, 0.9332427, 0, 0, 0, 1, 1,
0.8742487, 0.7148402, 0.6103166, 0, 0, 0, 1, 1,
0.8790187, 2.157548, 0.02281839, 0, 0, 0, 1, 1,
0.883761, -0.1270416, 0.5629371, 0, 0, 0, 1, 1,
0.884921, 1.534807, 1.500249, 0, 0, 0, 1, 1,
0.8862497, 1.299115, 0.5742462, 0, 0, 0, 1, 1,
0.8887689, -2.280083, 1.962538, 1, 1, 1, 1, 1,
0.8926196, 0.5174634, 2.432472, 1, 1, 1, 1, 1,
0.8996556, 0.9134423, 0.6760877, 1, 1, 1, 1, 1,
0.9059521, -1.43361, 1.802552, 1, 1, 1, 1, 1,
0.9068468, 1.067652, 0.8323072, 1, 1, 1, 1, 1,
0.9101987, 1.390676, -0.5622327, 1, 1, 1, 1, 1,
0.9226772, -0.9319989, 3.138545, 1, 1, 1, 1, 1,
0.9273361, 0.3630671, 0.5224664, 1, 1, 1, 1, 1,
0.9349965, 1.135955, 2.355918, 1, 1, 1, 1, 1,
0.9374856, -1.375972, 3.870862, 1, 1, 1, 1, 1,
0.9408086, -0.1605454, 2.40608, 1, 1, 1, 1, 1,
0.9479733, -0.1720153, 1.992402, 1, 1, 1, 1, 1,
0.9487422, 2.181619, 0.5437311, 1, 1, 1, 1, 1,
0.9521081, -2.022256, 4.517468, 1, 1, 1, 1, 1,
0.9542097, 0.1891675, 1.34692, 1, 1, 1, 1, 1,
0.961679, -1.413143, 1.449869, 0, 0, 1, 1, 1,
0.9645991, 1.803085, 1.238485, 1, 0, 0, 1, 1,
0.971687, -0.6450325, 2.17851, 1, 0, 0, 1, 1,
0.9743608, 0.04462577, 2.719289, 1, 0, 0, 1, 1,
0.9759492, -0.2861012, 1.770444, 1, 0, 0, 1, 1,
0.9806317, -0.5532014, 0.7431864, 1, 0, 0, 1, 1,
0.9897346, -0.8730875, 3.24788, 0, 0, 0, 1, 1,
0.9986223, -0.829672, 2.915697, 0, 0, 0, 1, 1,
1.011828, 1.245489, -0.007994466, 0, 0, 0, 1, 1,
1.018664, 0.1559399, 2.384109, 0, 0, 0, 1, 1,
1.019273, 2.348776, 0.3481748, 0, 0, 0, 1, 1,
1.023886, 0.1769132, 2.003933, 0, 0, 0, 1, 1,
1.024817, 0.3913701, 2.370003, 0, 0, 0, 1, 1,
1.025771, 0.3460834, 1.63462, 1, 1, 1, 1, 1,
1.027649, -0.1365049, 0.973989, 1, 1, 1, 1, 1,
1.027915, -0.5987156, 0.9071301, 1, 1, 1, 1, 1,
1.030683, 0.09266451, 2.843646, 1, 1, 1, 1, 1,
1.032595, 0.7649982, 2.828172, 1, 1, 1, 1, 1,
1.033548, -0.4286439, 2.274985, 1, 1, 1, 1, 1,
1.035379, -0.4762452, 1.962558, 1, 1, 1, 1, 1,
1.039295, -1.465242, 3.439503, 1, 1, 1, 1, 1,
1.04273, 0.4493025, 0.5191864, 1, 1, 1, 1, 1,
1.051052, -0.681443, 1.319597, 1, 1, 1, 1, 1,
1.052376, -0.3154679, 2.246391, 1, 1, 1, 1, 1,
1.053029, 0.06257554, 1.966124, 1, 1, 1, 1, 1,
1.076621, -0.6439112, 0.8122723, 1, 1, 1, 1, 1,
1.077291, 0.08883891, 1.885759, 1, 1, 1, 1, 1,
1.085419, 0.2074379, -0.4575066, 1, 1, 1, 1, 1,
1.097381, -0.8758692, 2.26519, 0, 0, 1, 1, 1,
1.101937, -0.09460891, 2.098914, 1, 0, 0, 1, 1,
1.115038, -0.5121259, 3.030137, 1, 0, 0, 1, 1,
1.118352, 0.3268305, 3.198209, 1, 0, 0, 1, 1,
1.120812, 0.2815788, 1.084826, 1, 0, 0, 1, 1,
1.128691, -0.9649442, 0.7609742, 1, 0, 0, 1, 1,
1.129714, -0.5005551, 3.19, 0, 0, 0, 1, 1,
1.132534, -1.699126, 1.515673, 0, 0, 0, 1, 1,
1.135703, -0.7449384, 2.297395, 0, 0, 0, 1, 1,
1.139054, 0.6028126, 2.995051, 0, 0, 0, 1, 1,
1.145217, -0.4772915, 4.393216, 0, 0, 0, 1, 1,
1.148202, -1.80053, 2.223991, 0, 0, 0, 1, 1,
1.151955, -0.4535444, 1.945872, 0, 0, 0, 1, 1,
1.152223, 0.4573048, 1.421486, 1, 1, 1, 1, 1,
1.154557, 0.109652, 0.4637851, 1, 1, 1, 1, 1,
1.155838, -0.1603886, -0.1373267, 1, 1, 1, 1, 1,
1.157688, -0.4869716, 1.924825, 1, 1, 1, 1, 1,
1.158872, 1.430492, 1.039193, 1, 1, 1, 1, 1,
1.160901, 1.212893, 1.43428, 1, 1, 1, 1, 1,
1.161861, -0.2064604, 2.830276, 1, 1, 1, 1, 1,
1.174049, 1.515846, 0.1250481, 1, 1, 1, 1, 1,
1.177264, -0.1507626, 0.3103969, 1, 1, 1, 1, 1,
1.177353, 1.583377, 1.690847, 1, 1, 1, 1, 1,
1.188057, -0.5968239, 1.557326, 1, 1, 1, 1, 1,
1.188383, 0.3155575, 2.581585, 1, 1, 1, 1, 1,
1.1909, -0.7302182, 1.179465, 1, 1, 1, 1, 1,
1.191837, 0.712704, 0.2152058, 1, 1, 1, 1, 1,
1.192117, -0.4954533, 2.163463, 1, 1, 1, 1, 1,
1.193369, 0.2393592, 0.9855527, 0, 0, 1, 1, 1,
1.196731, 0.7017996, 1.95441, 1, 0, 0, 1, 1,
1.211877, -0.03473067, 1.020064, 1, 0, 0, 1, 1,
1.216317, -0.6356435, 3.830352, 1, 0, 0, 1, 1,
1.221595, 2.024278, 0.9882513, 1, 0, 0, 1, 1,
1.226676, 0.05510708, 1.560612, 1, 0, 0, 1, 1,
1.232494, -0.4746485, 2.301073, 0, 0, 0, 1, 1,
1.239175, 0.4639154, 3.814896, 0, 0, 0, 1, 1,
1.249855, -0.0007570706, 0.5080825, 0, 0, 0, 1, 1,
1.257467, -0.7556158, 2.322594, 0, 0, 0, 1, 1,
1.259719, -0.2687396, 1.820277, 0, 0, 0, 1, 1,
1.260657, -1.368185, 2.323955, 0, 0, 0, 1, 1,
1.263128, -1.717474, 1.241724, 0, 0, 0, 1, 1,
1.268529, -0.4581878, 0.181532, 1, 1, 1, 1, 1,
1.276444, -0.2880194, 1.320103, 1, 1, 1, 1, 1,
1.284297, -0.705455, 1.460803, 1, 1, 1, 1, 1,
1.294198, -1.040743, 3.265267, 1, 1, 1, 1, 1,
1.30354, -0.116235, 0.4012633, 1, 1, 1, 1, 1,
1.305638, 0.1073198, 1.751875, 1, 1, 1, 1, 1,
1.307523, -1.341197, 1.399166, 1, 1, 1, 1, 1,
1.313887, 0.9690372, 1.752333, 1, 1, 1, 1, 1,
1.319685, 0.7885071, 0.7881388, 1, 1, 1, 1, 1,
1.320541, -0.7270451, 1.860819, 1, 1, 1, 1, 1,
1.324758, -0.2832801, 1.416648, 1, 1, 1, 1, 1,
1.330355, 1.869334, 1.637005, 1, 1, 1, 1, 1,
1.336786, -1.925363, 1.167845, 1, 1, 1, 1, 1,
1.342558, 0.595049, 0.816121, 1, 1, 1, 1, 1,
1.343636, -0.5597711, 3.954262, 1, 1, 1, 1, 1,
1.350451, 0.779276, 2.05318, 0, 0, 1, 1, 1,
1.351887, 0.3614941, 1.5991, 1, 0, 0, 1, 1,
1.363626, -0.3154683, 1.245529, 1, 0, 0, 1, 1,
1.36725, -1.069373, 3.379849, 1, 0, 0, 1, 1,
1.376263, 1.122425, 1.355655, 1, 0, 0, 1, 1,
1.378192, -0.4992335, 1.939282, 1, 0, 0, 1, 1,
1.379856, -2.125555, 2.260642, 0, 0, 0, 1, 1,
1.391867, 0.8738025, 2.557952, 0, 0, 0, 1, 1,
1.395089, -1.376538, 3.891832, 0, 0, 0, 1, 1,
1.399114, 0.4750728, 1.32352, 0, 0, 0, 1, 1,
1.399292, 0.709374, 1.291914, 0, 0, 0, 1, 1,
1.40718, 1.022052, 0.4086054, 0, 0, 0, 1, 1,
1.408099, 0.4488363, 1.04756, 0, 0, 0, 1, 1,
1.425728, 0.5653473, 0.08631534, 1, 1, 1, 1, 1,
1.432376, 0.1707728, 1.11859, 1, 1, 1, 1, 1,
1.434789, -0.5536405, 0.6491207, 1, 1, 1, 1, 1,
1.435549, 0.2820326, 2.49368, 1, 1, 1, 1, 1,
1.457307, 1.636146, 0.6224988, 1, 1, 1, 1, 1,
1.459059, -0.2160743, 1.665601, 1, 1, 1, 1, 1,
1.461567, -2.009471, 2.377245, 1, 1, 1, 1, 1,
1.473167, 0.04723572, 1.745914, 1, 1, 1, 1, 1,
1.488534, 0.5087664, 0.7354487, 1, 1, 1, 1, 1,
1.502608, -1.19728, 3.010947, 1, 1, 1, 1, 1,
1.516306, 0.9032108, -0.07736503, 1, 1, 1, 1, 1,
1.524157, -0.4996419, 1.866051, 1, 1, 1, 1, 1,
1.524869, -0.7317198, 1.732547, 1, 1, 1, 1, 1,
1.537314, 1.444615, 0.319585, 1, 1, 1, 1, 1,
1.543525, -0.4194241, 2.339048, 1, 1, 1, 1, 1,
1.552925, 0.356755, 1.95171, 0, 0, 1, 1, 1,
1.573561, -0.5293697, 1.888215, 1, 0, 0, 1, 1,
1.57451, -1.103602, 1.937419, 1, 0, 0, 1, 1,
1.575454, -0.841849, 2.340209, 1, 0, 0, 1, 1,
1.579587, -0.6162275, 1.618228, 1, 0, 0, 1, 1,
1.581567, -0.6968493, 2.11829, 1, 0, 0, 1, 1,
1.595812, -1.147819, 0.7556514, 0, 0, 0, 1, 1,
1.612512, -2.734978, 0.325646, 0, 0, 0, 1, 1,
1.623919, 0.521298, 1.319891, 0, 0, 0, 1, 1,
1.627882, 0.4221784, 2.79591, 0, 0, 0, 1, 1,
1.645547, -0.4714131, 1.829288, 0, 0, 0, 1, 1,
1.657321, 0.1407873, 0.5874158, 0, 0, 0, 1, 1,
1.665652, 0.3978525, 0.01178384, 0, 0, 0, 1, 1,
1.673317, -1.318638, 2.042079, 1, 1, 1, 1, 1,
1.679504, -1.583786, 0.6091931, 1, 1, 1, 1, 1,
1.688816, -0.1995957, 1.827592, 1, 1, 1, 1, 1,
1.690709, -1.31414, 0.9286541, 1, 1, 1, 1, 1,
1.701121, -0.1556649, 2.707945, 1, 1, 1, 1, 1,
1.701935, 0.5275798, 1.492611, 1, 1, 1, 1, 1,
1.705826, 0.3942625, 0.2943385, 1, 1, 1, 1, 1,
1.710061, 0.336136, 3.455206, 1, 1, 1, 1, 1,
1.718304, 1.361239, 0.549862, 1, 1, 1, 1, 1,
1.730399, -1.376535, 2.975065, 1, 1, 1, 1, 1,
1.731307, -0.1845781, 1.363097, 1, 1, 1, 1, 1,
1.734469, -0.8618944, 4.531069, 1, 1, 1, 1, 1,
1.736829, -2.510333, 4.349186, 1, 1, 1, 1, 1,
1.741146, 0.8061062, 1.041174, 1, 1, 1, 1, 1,
1.741195, -0.3368234, 1.304729, 1, 1, 1, 1, 1,
1.742139, -1.041343, 2.279809, 0, 0, 1, 1, 1,
1.745414, -0.41172, 1.423431, 1, 0, 0, 1, 1,
1.768162, 0.9938999, 3.082558, 1, 0, 0, 1, 1,
1.773757, 1.091971, 0.6468924, 1, 0, 0, 1, 1,
1.779197, 0.707278, -0.8029917, 1, 0, 0, 1, 1,
1.79031, 0.2468775, 1.807039, 1, 0, 0, 1, 1,
1.79595, 1.274071, 0.300068, 0, 0, 0, 1, 1,
1.803023, 0.6779931, 1.118693, 0, 0, 0, 1, 1,
1.810245, 0.12409, 3.264562, 0, 0, 0, 1, 1,
1.824498, 0.7741442, 0.4427883, 0, 0, 0, 1, 1,
1.835349, -0.6220047, 3.055844, 0, 0, 0, 1, 1,
1.852324, 0.3860358, 3.518118, 0, 0, 0, 1, 1,
1.856591, -0.1887024, 2.541169, 0, 0, 0, 1, 1,
1.86694, -0.3721829, 2.116717, 1, 1, 1, 1, 1,
1.868482, 0.6779706, 1.256228, 1, 1, 1, 1, 1,
1.869969, 0.8457277, 2.572804, 1, 1, 1, 1, 1,
1.872037, 1.015305, 0.3904286, 1, 1, 1, 1, 1,
1.891568, 0.7734424, 1.799832, 1, 1, 1, 1, 1,
1.891911, 0.8383024, 0.356976, 1, 1, 1, 1, 1,
1.895298, 1.772372, 1.282377, 1, 1, 1, 1, 1,
1.906012, -0.06277065, 0.3781339, 1, 1, 1, 1, 1,
1.951931, 1.730631, 2.563126, 1, 1, 1, 1, 1,
1.969143, 0.4323578, 1.568088, 1, 1, 1, 1, 1,
1.97308, 0.4831376, 3.006553, 1, 1, 1, 1, 1,
1.977276, 0.1292017, 0.6493953, 1, 1, 1, 1, 1,
1.983193, 0.7756559, 1.631236, 1, 1, 1, 1, 1,
1.983455, -1.860782, 2.897164, 1, 1, 1, 1, 1,
2.000644, -0.4776837, 2.308667, 1, 1, 1, 1, 1,
2.025942, -0.002882279, 3.020076, 0, 0, 1, 1, 1,
2.038628, 0.2581643, 1.465312, 1, 0, 0, 1, 1,
2.08859, -0.8766348, 2.110757, 1, 0, 0, 1, 1,
2.115155, -0.995791, 1.012535, 1, 0, 0, 1, 1,
2.128642, -0.7873912, 2.113477, 1, 0, 0, 1, 1,
2.15309, 1.461111, 0.2257857, 1, 0, 0, 1, 1,
2.169451, -0.2832838, -0.2403119, 0, 0, 0, 1, 1,
2.211474, 0.3959053, 2.87854, 0, 0, 0, 1, 1,
2.222748, 0.9838307, 0.8010538, 0, 0, 0, 1, 1,
2.233292, 0.3228832, 1.728089, 0, 0, 0, 1, 1,
2.244288, 0.3042916, 1.806134, 0, 0, 0, 1, 1,
2.287421, -0.4911564, 1.327771, 0, 0, 0, 1, 1,
2.347855, -1.374353, 3.594905, 0, 0, 0, 1, 1,
2.357302, -1.062976, 1.819663, 1, 1, 1, 1, 1,
2.453135, -0.3680785, 1.811735, 1, 1, 1, 1, 1,
2.505444, 0.5736449, -0.3597643, 1, 1, 1, 1, 1,
2.720731, 0.6686439, -0.07917137, 1, 1, 1, 1, 1,
2.744495, 1.521908, 1.684332, 1, 1, 1, 1, 1,
2.809861, 0.001654948, 2.109605, 1, 1, 1, 1, 1,
3.136393, -0.07099704, 1.962464, 1, 1, 1, 1, 1
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
var radius = 9.255933;
var distance = 32.51107;
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
mvMatrix.translate( -0.09122825, -0.05185497, 0.3578825 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.51107);
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
