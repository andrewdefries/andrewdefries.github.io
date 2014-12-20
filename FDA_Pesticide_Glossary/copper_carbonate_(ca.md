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
-3.311397, 2.765827, -1.811097, 1, 0, 0, 1,
-2.771113, -1.508096, -3.495147, 1, 0.007843138, 0, 1,
-2.608808, -0.3527132, -1.723908, 1, 0.01176471, 0, 1,
-2.573345, -0.9501423, -1.910021, 1, 0.01960784, 0, 1,
-2.522138, 0.7298487, -2.082051, 1, 0.02352941, 0, 1,
-2.467143, -1.181478, 0.560815, 1, 0.03137255, 0, 1,
-2.394059, 1.298511, -2.398054, 1, 0.03529412, 0, 1,
-2.388472, 0.4998381, -1.983604, 1, 0.04313726, 0, 1,
-2.350689, -0.8165774, -3.661646, 1, 0.04705882, 0, 1,
-2.348612, 1.067576, -1.978192, 1, 0.05490196, 0, 1,
-2.270942, 1.355453, 0.05678544, 1, 0.05882353, 0, 1,
-2.263784, -0.9501797, -2.373685, 1, 0.06666667, 0, 1,
-2.127403, 0.3408627, -1.858791, 1, 0.07058824, 0, 1,
-2.058646, -0.8647231, -2.14204, 1, 0.07843138, 0, 1,
-2.050991, -0.451525, -2.519094, 1, 0.08235294, 0, 1,
-2.04576, -0.1900866, -3.01653, 1, 0.09019608, 0, 1,
-2.022346, 0.598568, -1.25684, 1, 0.09411765, 0, 1,
-1.989556, -1.116951, -2.344395, 1, 0.1019608, 0, 1,
-1.976903, -1.937092, -4.20958, 1, 0.1098039, 0, 1,
-1.934506, -1.419851, -1.561176, 1, 0.1137255, 0, 1,
-1.92672, -0.6876869, -2.008333, 1, 0.1215686, 0, 1,
-1.851415, 1.002778, 1.368812, 1, 0.1254902, 0, 1,
-1.841666, -0.09356987, -0.9845499, 1, 0.1333333, 0, 1,
-1.829608, -1.370885, -2.916137, 1, 0.1372549, 0, 1,
-1.777013, -2.493418, -3.592449, 1, 0.145098, 0, 1,
-1.765789, 0.8856164, -0.3798248, 1, 0.1490196, 0, 1,
-1.764144, 0.2377121, -0.7437019, 1, 0.1568628, 0, 1,
-1.75633, 0.7172795, -1.173143, 1, 0.1607843, 0, 1,
-1.753909, 0.3590282, -1.29335, 1, 0.1686275, 0, 1,
-1.751638, 0.3153243, -3.495497, 1, 0.172549, 0, 1,
-1.71807, 0.6383268, -2.388066, 1, 0.1803922, 0, 1,
-1.716002, 2.264466, -1.993651, 1, 0.1843137, 0, 1,
-1.709555, 2.238853, -0.6458768, 1, 0.1921569, 0, 1,
-1.702355, -0.8778222, -1.21828, 1, 0.1960784, 0, 1,
-1.695709, 0.09601577, -3.00176, 1, 0.2039216, 0, 1,
-1.693824, -0.1659985, -3.589276, 1, 0.2117647, 0, 1,
-1.684226, 1.185109, 0.1735637, 1, 0.2156863, 0, 1,
-1.683789, 0.3157894, -2.064671, 1, 0.2235294, 0, 1,
-1.680662, -0.1517797, -3.09403, 1, 0.227451, 0, 1,
-1.671439, -0.3760891, -0.701744, 1, 0.2352941, 0, 1,
-1.663615, 1.257451, -0.3381505, 1, 0.2392157, 0, 1,
-1.655855, 1.289454, -1.350101, 1, 0.2470588, 0, 1,
-1.649436, -1.32604, -1.607644, 1, 0.2509804, 0, 1,
-1.644834, -1.493738, -2.323004, 1, 0.2588235, 0, 1,
-1.637815, -0.6834288, -0.4902084, 1, 0.2627451, 0, 1,
-1.625647, -0.5261636, -2.363227, 1, 0.2705882, 0, 1,
-1.620336, -0.2943479, -1.661217, 1, 0.2745098, 0, 1,
-1.61629, 0.2213209, -1.495967, 1, 0.282353, 0, 1,
-1.613442, 0.6315498, -2.292025, 1, 0.2862745, 0, 1,
-1.606071, 1.020952, -1.174089, 1, 0.2941177, 0, 1,
-1.600365, -1.256034, -2.86046, 1, 0.3019608, 0, 1,
-1.598871, -0.4314726, -2.924459, 1, 0.3058824, 0, 1,
-1.588745, 0.3585494, -1.391274, 1, 0.3137255, 0, 1,
-1.580344, 1.612937, -1.448444, 1, 0.3176471, 0, 1,
-1.573802, 1.446238, -0.5813249, 1, 0.3254902, 0, 1,
-1.56638, 0.3308833, -0.3713487, 1, 0.3294118, 0, 1,
-1.562986, -2.129369, -1.816116, 1, 0.3372549, 0, 1,
-1.548881, -0.2070189, -2.449873, 1, 0.3411765, 0, 1,
-1.545766, -2.077225, -2.013203, 1, 0.3490196, 0, 1,
-1.544256, -0.9570778, -3.153172, 1, 0.3529412, 0, 1,
-1.544033, -0.2807446, -0.5527932, 1, 0.3607843, 0, 1,
-1.53307, 0.2391632, -2.6181, 1, 0.3647059, 0, 1,
-1.526318, 0.8348826, -1.532319, 1, 0.372549, 0, 1,
-1.518418, -0.01707777, -1.699522, 1, 0.3764706, 0, 1,
-1.510011, -1.029854, -1.278662, 1, 0.3843137, 0, 1,
-1.498544, 0.2977082, -0.6966467, 1, 0.3882353, 0, 1,
-1.491714, -0.2038483, -3.834895, 1, 0.3960784, 0, 1,
-1.490987, 1.186141, -1.829613, 1, 0.4039216, 0, 1,
-1.459527, -0.8252223, -2.928331, 1, 0.4078431, 0, 1,
-1.449393, 1.508986, -2.786798, 1, 0.4156863, 0, 1,
-1.44793, -0.7835349, -0.7498533, 1, 0.4196078, 0, 1,
-1.436846, -0.8907885, -2.813222, 1, 0.427451, 0, 1,
-1.420929, -0.8090685, -2.129609, 1, 0.4313726, 0, 1,
-1.419066, 0.8343781, -1.562703, 1, 0.4392157, 0, 1,
-1.408129, 0.6122844, -1.026334, 1, 0.4431373, 0, 1,
-1.400089, 0.154781, -1.139997, 1, 0.4509804, 0, 1,
-1.396305, -1.048058, -2.0364, 1, 0.454902, 0, 1,
-1.392633, 1.107289, -0.628771, 1, 0.4627451, 0, 1,
-1.39162, -0.2944099, -0.1877294, 1, 0.4666667, 0, 1,
-1.377867, -0.9593424, -2.396243, 1, 0.4745098, 0, 1,
-1.364547, -0.5108138, -2.62856, 1, 0.4784314, 0, 1,
-1.356977, -0.7495353, -2.629286, 1, 0.4862745, 0, 1,
-1.340154, 0.3866878, -1.960879, 1, 0.4901961, 0, 1,
-1.324535, 1.122789, -1.510278, 1, 0.4980392, 0, 1,
-1.320883, 2.865106, -0.03236403, 1, 0.5058824, 0, 1,
-1.314194, -0.3003433, -0.04786113, 1, 0.509804, 0, 1,
-1.308472, 0.03378695, -1.981148, 1, 0.5176471, 0, 1,
-1.307952, -0.8881934, -1.674584, 1, 0.5215687, 0, 1,
-1.291675, -1.221156, -1.043454, 1, 0.5294118, 0, 1,
-1.278974, 1.482463, -1.777504, 1, 0.5333334, 0, 1,
-1.259621, 0.7748504, -0.8709537, 1, 0.5411765, 0, 1,
-1.25866, -1.172861, -3.198749, 1, 0.5450981, 0, 1,
-1.255334, 1.04758, -3.138963, 1, 0.5529412, 0, 1,
-1.254983, -0.5448275, -4.323292, 1, 0.5568628, 0, 1,
-1.24006, -0.4233623, -1.965749, 1, 0.5647059, 0, 1,
-1.222678, 1.337309, 0.326913, 1, 0.5686275, 0, 1,
-1.221434, 0.7416745, -0.6344557, 1, 0.5764706, 0, 1,
-1.215771, 0.01922554, -3.020131, 1, 0.5803922, 0, 1,
-1.212193, -0.8806666, -1.955021, 1, 0.5882353, 0, 1,
-1.207294, -1.758878, -2.321231, 1, 0.5921569, 0, 1,
-1.200664, -0.2474448, -1.241327, 1, 0.6, 0, 1,
-1.198112, -1.533838, -2.5795, 1, 0.6078432, 0, 1,
-1.196345, 0.1156226, -1.900812, 1, 0.6117647, 0, 1,
-1.194946, 0.7551512, -1.702209, 1, 0.6196079, 0, 1,
-1.183265, 1.448683, 0.2101253, 1, 0.6235294, 0, 1,
-1.177871, 0.1162072, -1.313379, 1, 0.6313726, 0, 1,
-1.176671, -0.2143068, -0.9509172, 1, 0.6352941, 0, 1,
-1.174994, 1.17767, -1.038251, 1, 0.6431373, 0, 1,
-1.173596, -0.7760181, -2.613113, 1, 0.6470588, 0, 1,
-1.172633, 0.1127848, -1.951951, 1, 0.654902, 0, 1,
-1.167444, -0.8591383, -2.716999, 1, 0.6588235, 0, 1,
-1.167159, -0.3830776, -2.559711, 1, 0.6666667, 0, 1,
-1.155805, 1.849032, -1.415995, 1, 0.6705883, 0, 1,
-1.153708, 0.08396989, -1.025464, 1, 0.6784314, 0, 1,
-1.150009, -0.6164557, -2.944524, 1, 0.682353, 0, 1,
-1.145442, -2.293269, -2.383783, 1, 0.6901961, 0, 1,
-1.141359, 0.6055437, -0.8466613, 1, 0.6941177, 0, 1,
-1.135042, 0.586644, -2.367736, 1, 0.7019608, 0, 1,
-1.131603, -1.657445, -3.23891, 1, 0.7098039, 0, 1,
-1.124579, -1.356988, -1.128128, 1, 0.7137255, 0, 1,
-1.123071, 0.7784098, -1.261165, 1, 0.7215686, 0, 1,
-1.121166, 0.09415145, -0.4393854, 1, 0.7254902, 0, 1,
-1.118633, -0.02132468, -2.190927, 1, 0.7333333, 0, 1,
-1.115667, 0.04312355, -1.431994, 1, 0.7372549, 0, 1,
-1.115608, -0.7143369, -2.471273, 1, 0.7450981, 0, 1,
-1.115608, -0.447015, -1.264431, 1, 0.7490196, 0, 1,
-1.111211, 1.666841, -2.062477, 1, 0.7568628, 0, 1,
-1.109363, -0.4674121, -1.377205, 1, 0.7607843, 0, 1,
-1.109231, -0.9716142, -2.713851, 1, 0.7686275, 0, 1,
-1.104107, 0.8912941, -0.9137553, 1, 0.772549, 0, 1,
-1.099834, -0.350324, -3.01138, 1, 0.7803922, 0, 1,
-1.096599, -0.162551, -2.097239, 1, 0.7843137, 0, 1,
-1.085941, 0.8737484, -1.590468, 1, 0.7921569, 0, 1,
-1.07987, 1.549694, -0.8585622, 1, 0.7960784, 0, 1,
-1.075849, -1.779802, -1.128477, 1, 0.8039216, 0, 1,
-1.071263, -0.6473016, -2.811251, 1, 0.8117647, 0, 1,
-1.069222, 0.0001500114, -1.096664, 1, 0.8156863, 0, 1,
-1.068384, 0.5778615, 0.4937657, 1, 0.8235294, 0, 1,
-1.059287, -1.244306, -1.327381, 1, 0.827451, 0, 1,
-1.05821, -2.3093, -3.164495, 1, 0.8352941, 0, 1,
-1.058142, -0.3921729, -1.904367, 1, 0.8392157, 0, 1,
-1.055931, -0.4628387, -0.7273371, 1, 0.8470588, 0, 1,
-1.055531, -0.02417575, -1.600164, 1, 0.8509804, 0, 1,
-1.05361, -0.8581052, -2.484592, 1, 0.8588235, 0, 1,
-1.045616, -0.9566047, -2.196038, 1, 0.8627451, 0, 1,
-1.045095, 0.4567285, -1.638789, 1, 0.8705882, 0, 1,
-1.043602, -1.580465, -3.93292, 1, 0.8745098, 0, 1,
-1.0403, 2.193759, -1.077161, 1, 0.8823529, 0, 1,
-1.036148, -0.0689352, -0.5892639, 1, 0.8862745, 0, 1,
-1.023569, 0.4227105, 0.1876758, 1, 0.8941177, 0, 1,
-1.020253, -0.07966497, -1.90118, 1, 0.8980392, 0, 1,
-1.016176, 2.067125, -1.832314, 1, 0.9058824, 0, 1,
-1.010143, 1.838241, -0.395443, 1, 0.9137255, 0, 1,
-0.9935914, 0.07396211, 0.3393508, 1, 0.9176471, 0, 1,
-0.9917631, -0.6757256, -1.380759, 1, 0.9254902, 0, 1,
-0.9807328, -0.2919232, -3.784846, 1, 0.9294118, 0, 1,
-0.9735691, 0.007631993, 0.02792782, 1, 0.9372549, 0, 1,
-0.9721163, -0.6529949, -3.278886, 1, 0.9411765, 0, 1,
-0.9702152, 0.9681612, -0.6142496, 1, 0.9490196, 0, 1,
-0.9686704, 0.4516032, -2.040771, 1, 0.9529412, 0, 1,
-0.967179, -1.112337, -2.280401, 1, 0.9607843, 0, 1,
-0.9670401, -0.2395458, -1.360944, 1, 0.9647059, 0, 1,
-0.9639778, 0.6613816, -1.499083, 1, 0.972549, 0, 1,
-0.9616774, -0.4618566, -4.026236, 1, 0.9764706, 0, 1,
-0.960406, 1.274651, -1.418187, 1, 0.9843137, 0, 1,
-0.9518313, 0.3590956, 0.9661692, 1, 0.9882353, 0, 1,
-0.9478546, 0.3940416, -0.7608989, 1, 0.9960784, 0, 1,
-0.9425493, -1.565536, -3.240416, 0.9960784, 1, 0, 1,
-0.9335505, 0.6444274, -0.200094, 0.9921569, 1, 0, 1,
-0.9204783, 0.7432103, -1.092624, 0.9843137, 1, 0, 1,
-0.9173942, 0.1390065, -1.794304, 0.9803922, 1, 0, 1,
-0.91712, -2.385785, -4.408537, 0.972549, 1, 0, 1,
-0.9091217, -1.538572, -1.71694, 0.9686275, 1, 0, 1,
-0.9046843, 0.4096184, -2.851836, 0.9607843, 1, 0, 1,
-0.9045842, 0.9118881, 0.4322126, 0.9568627, 1, 0, 1,
-0.9038666, -0.7387286, -2.793363, 0.9490196, 1, 0, 1,
-0.8990099, 0.6505525, -0.06593945, 0.945098, 1, 0, 1,
-0.8975163, -0.7259554, -1.457678, 0.9372549, 1, 0, 1,
-0.8973965, 0.1794383, -0.6606876, 0.9333333, 1, 0, 1,
-0.8966582, 0.1466332, -0.3972361, 0.9254902, 1, 0, 1,
-0.8966395, -0.08856753, -1.133928, 0.9215686, 1, 0, 1,
-0.8916835, -1.027382, -1.434724, 0.9137255, 1, 0, 1,
-0.8902196, -1.169472, -3.658242, 0.9098039, 1, 0, 1,
-0.8897133, -0.8757711, -2.667589, 0.9019608, 1, 0, 1,
-0.8853476, -0.7253015, -2.883893, 0.8941177, 1, 0, 1,
-0.8778617, 0.285328, -2.478936, 0.8901961, 1, 0, 1,
-0.8744452, 0.9994127, 0.2637125, 0.8823529, 1, 0, 1,
-0.873528, 0.3416498, 0.6080793, 0.8784314, 1, 0, 1,
-0.8664441, 0.62986, -1.576813, 0.8705882, 1, 0, 1,
-0.8642615, -0.4079548, -3.905839, 0.8666667, 1, 0, 1,
-0.8580958, 0.7813838, -3.202319, 0.8588235, 1, 0, 1,
-0.8570991, 0.8103686, -1.690825, 0.854902, 1, 0, 1,
-0.8538327, -0.9363034, -2.14659, 0.8470588, 1, 0, 1,
-0.8505606, 0.6237541, -0.5627771, 0.8431373, 1, 0, 1,
-0.8505147, -0.3887192, -3.250998, 0.8352941, 1, 0, 1,
-0.8441575, -0.2917935, -0.1667574, 0.8313726, 1, 0, 1,
-0.8421164, 0.538101, 0.1705912, 0.8235294, 1, 0, 1,
-0.8417023, 1.032166, -0.4411162, 0.8196079, 1, 0, 1,
-0.8377801, 1.988624, -0.8966292, 0.8117647, 1, 0, 1,
-0.8330662, -2.096725, -6.693379, 0.8078431, 1, 0, 1,
-0.8308468, 0.697928, 0.7467599, 0.8, 1, 0, 1,
-0.8271011, -1.310503, -3.179643, 0.7921569, 1, 0, 1,
-0.8242606, -0.2848329, -1.645784, 0.7882353, 1, 0, 1,
-0.8114694, -0.06338347, 0.325557, 0.7803922, 1, 0, 1,
-0.8111181, 1.598579, 0.6192328, 0.7764706, 1, 0, 1,
-0.8063458, 1.02762, -0.8780176, 0.7686275, 1, 0, 1,
-0.803782, 0.4403593, -4.487288, 0.7647059, 1, 0, 1,
-0.8015509, 1.762316, 1.047202, 0.7568628, 1, 0, 1,
-0.7948092, -0.2618589, -0.528116, 0.7529412, 1, 0, 1,
-0.7940538, 1.248256, -1.848042, 0.7450981, 1, 0, 1,
-0.7921198, 0.6072817, -2.588957, 0.7411765, 1, 0, 1,
-0.791658, -1.484541, -2.10755, 0.7333333, 1, 0, 1,
-0.7863243, -0.2175287, -1.248279, 0.7294118, 1, 0, 1,
-0.7861681, 0.2479181, -1.000399, 0.7215686, 1, 0, 1,
-0.7856393, -0.9014779, -0.3674607, 0.7176471, 1, 0, 1,
-0.7830083, -1.029246, -3.728422, 0.7098039, 1, 0, 1,
-0.7815762, -0.5837188, -3.093087, 0.7058824, 1, 0, 1,
-0.7763561, 1.681903, -0.2764826, 0.6980392, 1, 0, 1,
-0.7756073, 0.3033895, -1.1853, 0.6901961, 1, 0, 1,
-0.774148, -0.07535385, -1.673929, 0.6862745, 1, 0, 1,
-0.7723731, -1.811291, -2.027987, 0.6784314, 1, 0, 1,
-0.7655881, -0.2891951, -2.365799, 0.6745098, 1, 0, 1,
-0.7620518, 0.4061402, -0.407205, 0.6666667, 1, 0, 1,
-0.7582693, -0.9034071, -3.517547, 0.6627451, 1, 0, 1,
-0.7554964, 0.5323052, -1.064328, 0.654902, 1, 0, 1,
-0.7545215, -0.9057989, -3.971003, 0.6509804, 1, 0, 1,
-0.7528573, -0.2391385, -1.870899, 0.6431373, 1, 0, 1,
-0.7527383, 0.05935594, -0.3899802, 0.6392157, 1, 0, 1,
-0.7482238, 0.2403436, -3.994817, 0.6313726, 1, 0, 1,
-0.7436656, -0.1884157, -4.042438, 0.627451, 1, 0, 1,
-0.7403212, -0.579444, -3.230412, 0.6196079, 1, 0, 1,
-0.7364619, -0.8389449, -2.709122, 0.6156863, 1, 0, 1,
-0.7160481, -0.1355422, -2.89179, 0.6078432, 1, 0, 1,
-0.7140945, 0.6467523, -1.074276, 0.6039216, 1, 0, 1,
-0.710575, 0.1183436, -0.9621769, 0.5960785, 1, 0, 1,
-0.7102867, -1.313506, -3.04126, 0.5882353, 1, 0, 1,
-0.709151, -0.4188017, -0.442667, 0.5843138, 1, 0, 1,
-0.7066497, -0.9532597, -2.265372, 0.5764706, 1, 0, 1,
-0.7058067, 1.621727, 0.979741, 0.572549, 1, 0, 1,
-0.7033886, 0.434641, -0.7974887, 0.5647059, 1, 0, 1,
-0.6958861, -1.325326, -3.888193, 0.5607843, 1, 0, 1,
-0.695004, -0.8127291, -2.120653, 0.5529412, 1, 0, 1,
-0.6943654, 1.134925, 1.787001, 0.5490196, 1, 0, 1,
-0.6942302, -0.9034503, -3.370437, 0.5411765, 1, 0, 1,
-0.6935421, -0.1588737, -1.214314, 0.5372549, 1, 0, 1,
-0.6923379, -1.108875, -2.686906, 0.5294118, 1, 0, 1,
-0.6901991, 0.253037, -2.28023, 0.5254902, 1, 0, 1,
-0.688382, -0.8325143, -2.486075, 0.5176471, 1, 0, 1,
-0.6840736, 1.029523, -2.190465, 0.5137255, 1, 0, 1,
-0.672662, -0.1577691, -3.135761, 0.5058824, 1, 0, 1,
-0.6658755, 1.619375, -0.5829951, 0.5019608, 1, 0, 1,
-0.6644524, 1.233726, -0.9878888, 0.4941176, 1, 0, 1,
-0.6602991, 1.280533, -0.7955745, 0.4862745, 1, 0, 1,
-0.6550354, 0.7149289, -1.42545, 0.4823529, 1, 0, 1,
-0.6485555, 0.6688474, -1.180278, 0.4745098, 1, 0, 1,
-0.6397153, -0.8394948, -2.560413, 0.4705882, 1, 0, 1,
-0.6349149, 1.110546, -0.9792765, 0.4627451, 1, 0, 1,
-0.6294997, -2.48312, -2.171717, 0.4588235, 1, 0, 1,
-0.6242754, 0.621453, -1.285931, 0.4509804, 1, 0, 1,
-0.6237868, 0.813315, -0.4104165, 0.4470588, 1, 0, 1,
-0.6222031, 0.4333955, -1.334402, 0.4392157, 1, 0, 1,
-0.6179747, 0.0821107, -2.955164, 0.4352941, 1, 0, 1,
-0.6179085, -0.7124485, -3.128725, 0.427451, 1, 0, 1,
-0.6160328, 0.87077, -0.2605441, 0.4235294, 1, 0, 1,
-0.6145011, -0.1893759, -0.7879682, 0.4156863, 1, 0, 1,
-0.611358, -0.7920054, -3.25704, 0.4117647, 1, 0, 1,
-0.6056018, -2.269967, -1.013116, 0.4039216, 1, 0, 1,
-0.5957869, 2.504471, -0.7621827, 0.3960784, 1, 0, 1,
-0.5869718, -0.7238968, -1.798083, 0.3921569, 1, 0, 1,
-0.5862301, 1.68097, -1.267165, 0.3843137, 1, 0, 1,
-0.5829012, 0.8278762, 0.5657457, 0.3803922, 1, 0, 1,
-0.5794715, -1.97699, -2.700199, 0.372549, 1, 0, 1,
-0.5769711, 0.3359652, -1.442391, 0.3686275, 1, 0, 1,
-0.5749227, -2.512579, -2.443965, 0.3607843, 1, 0, 1,
-0.5736575, -0.4437647, -1.435275, 0.3568628, 1, 0, 1,
-0.5732375, -0.6041035, -3.721399, 0.3490196, 1, 0, 1,
-0.5727726, 1.053438, -1.353299, 0.345098, 1, 0, 1,
-0.571215, -0.1002488, -1.19471, 0.3372549, 1, 0, 1,
-0.5708058, 0.01081149, -2.83912, 0.3333333, 1, 0, 1,
-0.5680248, 1.778523, -1.563397, 0.3254902, 1, 0, 1,
-0.5671741, 0.63912, -0.6413839, 0.3215686, 1, 0, 1,
-0.5634259, 1.603021, -1.413366, 0.3137255, 1, 0, 1,
-0.5631794, 0.6532504, -0.213578, 0.3098039, 1, 0, 1,
-0.5582982, -1.283197, -0.4717037, 0.3019608, 1, 0, 1,
-0.5576276, 0.4596906, -1.369892, 0.2941177, 1, 0, 1,
-0.5562808, 0.1342492, -0.5693186, 0.2901961, 1, 0, 1,
-0.5560094, 1.302763, 0.2570597, 0.282353, 1, 0, 1,
-0.5558398, 0.9382593, -0.3446042, 0.2784314, 1, 0, 1,
-0.5539539, 1.039737, 0.2737247, 0.2705882, 1, 0, 1,
-0.5498793, -0.9511167, -2.799886, 0.2666667, 1, 0, 1,
-0.5411322, 0.8186607, 0.5789148, 0.2588235, 1, 0, 1,
-0.538396, -0.05725603, -0.7024714, 0.254902, 1, 0, 1,
-0.5379834, -1.23159, -3.126184, 0.2470588, 1, 0, 1,
-0.5345885, -0.838747, -3.324803, 0.2431373, 1, 0, 1,
-0.5291699, -1.078915, -3.286421, 0.2352941, 1, 0, 1,
-0.5279176, 0.7820029, -0.9056886, 0.2313726, 1, 0, 1,
-0.5095545, -1.096309, -1.389552, 0.2235294, 1, 0, 1,
-0.5059873, -1.119769, -2.708243, 0.2196078, 1, 0, 1,
-0.50107, -1.858639, -4.151904, 0.2117647, 1, 0, 1,
-0.499362, -0.8945289, -3.448608, 0.2078431, 1, 0, 1,
-0.4977883, 0.6265036, 0.4533555, 0.2, 1, 0, 1,
-0.4884809, -1.105269, -3.907244, 0.1921569, 1, 0, 1,
-0.4822044, 0.1096867, -2.760003, 0.1882353, 1, 0, 1,
-0.4748366, 0.3258056, -1.223646, 0.1803922, 1, 0, 1,
-0.469956, 0.4888744, -0.01296048, 0.1764706, 1, 0, 1,
-0.4698436, -0.009525519, -2.615514, 0.1686275, 1, 0, 1,
-0.4686965, -0.8342643, -2.463455, 0.1647059, 1, 0, 1,
-0.463808, -0.3556854, -1.863677, 0.1568628, 1, 0, 1,
-0.462633, -0.5702978, -3.483664, 0.1529412, 1, 0, 1,
-0.4619408, -0.4185416, -1.903598, 0.145098, 1, 0, 1,
-0.4581728, 1.044097, -0.0195018, 0.1411765, 1, 0, 1,
-0.4565308, -0.9401649, -3.082511, 0.1333333, 1, 0, 1,
-0.4564247, 0.1707481, -0.1670856, 0.1294118, 1, 0, 1,
-0.4460875, 0.6521426, -1.748671, 0.1215686, 1, 0, 1,
-0.4450409, -0.1391504, -3.371671, 0.1176471, 1, 0, 1,
-0.4407768, -0.575862, -1.441349, 0.1098039, 1, 0, 1,
-0.4379039, -1.154064, -2.90697, 0.1058824, 1, 0, 1,
-0.4378183, 0.7527333, 1.181032, 0.09803922, 1, 0, 1,
-0.4373592, 0.5373129, -0.3653763, 0.09019608, 1, 0, 1,
-0.436299, 0.4693347, 0.6302187, 0.08627451, 1, 0, 1,
-0.431331, 1.801393, 0.5141107, 0.07843138, 1, 0, 1,
-0.4274403, 1.000836, -0.5516738, 0.07450981, 1, 0, 1,
-0.4218388, -0.3821155, -2.215082, 0.06666667, 1, 0, 1,
-0.4197614, -1.192139, -2.623245, 0.0627451, 1, 0, 1,
-0.4122129, -0.5920308, -2.605497, 0.05490196, 1, 0, 1,
-0.4087486, -0.6987377, -3.051105, 0.05098039, 1, 0, 1,
-0.4019739, 1.299326, 1.238078, 0.04313726, 1, 0, 1,
-0.3963501, -0.02177332, -0.06402873, 0.03921569, 1, 0, 1,
-0.3959239, -0.1326809, -1.774639, 0.03137255, 1, 0, 1,
-0.3955612, 0.6827605, 0.5094342, 0.02745098, 1, 0, 1,
-0.3893858, 0.3730431, -1.045512, 0.01960784, 1, 0, 1,
-0.389089, -0.4372334, -2.311416, 0.01568628, 1, 0, 1,
-0.3855433, -0.6825948, -3.09614, 0.007843138, 1, 0, 1,
-0.381525, -0.882589, -2.333525, 0.003921569, 1, 0, 1,
-0.3787331, -0.4780615, -2.496845, 0, 1, 0.003921569, 1,
-0.373132, -1.184305, -3.894265, 0, 1, 0.01176471, 1,
-0.3730707, 0.5901629, -1.605125, 0, 1, 0.01568628, 1,
-0.3620197, 1.315889, -0.1537301, 0, 1, 0.02352941, 1,
-0.3605465, -0.1979634, -1.779898, 0, 1, 0.02745098, 1,
-0.3570527, 1.011305, 0.1974374, 0, 1, 0.03529412, 1,
-0.3559979, -0.5544541, -1.719737, 0, 1, 0.03921569, 1,
-0.3550296, 0.8564343, -1.525159, 0, 1, 0.04705882, 1,
-0.3537164, 0.7907689, -0.1931369, 0, 1, 0.05098039, 1,
-0.3506545, -0.4284153, -2.774866, 0, 1, 0.05882353, 1,
-0.3455213, 0.1901104, -0.9837288, 0, 1, 0.0627451, 1,
-0.345478, -0.6543446, -2.490295, 0, 1, 0.07058824, 1,
-0.3449053, 1.498065, -0.0562805, 0, 1, 0.07450981, 1,
-0.3412625, 0.4511815, -1.841135, 0, 1, 0.08235294, 1,
-0.3382146, 0.738881, -1.08741, 0, 1, 0.08627451, 1,
-0.3329749, -0.4116727, -3.839072, 0, 1, 0.09411765, 1,
-0.3281274, -1.76722, -2.847628, 0, 1, 0.1019608, 1,
-0.3260731, -0.691089, -1.124017, 0, 1, 0.1058824, 1,
-0.3169617, -1.456282, -2.164687, 0, 1, 0.1137255, 1,
-0.3151987, 0.07666341, -0.2908883, 0, 1, 0.1176471, 1,
-0.3105918, 0.2644915, -0.9443748, 0, 1, 0.1254902, 1,
-0.3054477, 0.4269374, 0.08716471, 0, 1, 0.1294118, 1,
-0.295348, -1.913689, -2.337569, 0, 1, 0.1372549, 1,
-0.2906533, -0.2392593, -2.928991, 0, 1, 0.1411765, 1,
-0.2901533, 0.03309898, -1.858446, 0, 1, 0.1490196, 1,
-0.2882948, -0.7388725, -1.64535, 0, 1, 0.1529412, 1,
-0.2851872, 0.3155233, 0.1195813, 0, 1, 0.1607843, 1,
-0.2826834, 0.7097886, 0.03605358, 0, 1, 0.1647059, 1,
-0.282201, 1.543958, 0.3908598, 0, 1, 0.172549, 1,
-0.279975, 0.1402287, 0.04360208, 0, 1, 0.1764706, 1,
-0.2788576, 1.605783, 0.2466981, 0, 1, 0.1843137, 1,
-0.2782103, 0.8927592, 1.28195, 0, 1, 0.1882353, 1,
-0.2707585, -1.151168, -2.062627, 0, 1, 0.1960784, 1,
-0.2682149, -0.4427252, -2.911125, 0, 1, 0.2039216, 1,
-0.2679885, 0.9637652, 0.701906, 0, 1, 0.2078431, 1,
-0.2630421, 0.2460705, 0.1810834, 0, 1, 0.2156863, 1,
-0.2613392, 0.3142089, -0.7093334, 0, 1, 0.2196078, 1,
-0.2612768, -0.5976811, -2.620145, 0, 1, 0.227451, 1,
-0.2561145, 1.643286, 0.003978704, 0, 1, 0.2313726, 1,
-0.2546521, 2.172392, -0.4249519, 0, 1, 0.2392157, 1,
-0.2546438, -0.3169296, -3.330117, 0, 1, 0.2431373, 1,
-0.2532925, -0.3636441, -4.416438, 0, 1, 0.2509804, 1,
-0.2532679, -0.1386849, -3.676456, 0, 1, 0.254902, 1,
-0.2531815, -1.732955, -3.235844, 0, 1, 0.2627451, 1,
-0.2502104, -0.5430234, -2.063502, 0, 1, 0.2666667, 1,
-0.2497595, -0.9998497, -3.50293, 0, 1, 0.2745098, 1,
-0.2490991, -0.9156331, -1.226916, 0, 1, 0.2784314, 1,
-0.2468667, 1.613389, -1.403674, 0, 1, 0.2862745, 1,
-0.2465682, 3.047289, 0.979071, 0, 1, 0.2901961, 1,
-0.2457886, -1.640643, -3.224643, 0, 1, 0.2980392, 1,
-0.2444927, -0.8134602, -4.612492, 0, 1, 0.3058824, 1,
-0.2440027, -1.055984, -1.69499, 0, 1, 0.3098039, 1,
-0.2420862, 1.526248, 1.140486, 0, 1, 0.3176471, 1,
-0.2243365, 1.82697, -0.9420682, 0, 1, 0.3215686, 1,
-0.2217612, 0.1930905, -2.017296, 0, 1, 0.3294118, 1,
-0.2208473, 0.6072276, -0.5120959, 0, 1, 0.3333333, 1,
-0.2190715, 0.7494639, 1.660812, 0, 1, 0.3411765, 1,
-0.2158928, -1.443652, -1.177792, 0, 1, 0.345098, 1,
-0.2148804, 0.4134409, -1.391583, 0, 1, 0.3529412, 1,
-0.2038355, -1.093796, -2.954868, 0, 1, 0.3568628, 1,
-0.2006725, 0.2513454, -1.047762, 0, 1, 0.3647059, 1,
-0.1987647, 0.6354983, -0.9416417, 0, 1, 0.3686275, 1,
-0.1981514, -1.548696, -3.95635, 0, 1, 0.3764706, 1,
-0.1977848, 2.273609, 0.08781259, 0, 1, 0.3803922, 1,
-0.1928407, -0.9166777, -3.047982, 0, 1, 0.3882353, 1,
-0.1882876, -0.9059985, -1.436819, 0, 1, 0.3921569, 1,
-0.1854031, 0.6305871, -1.794186, 0, 1, 0.4, 1,
-0.1852416, 0.2332486, 0.3841499, 0, 1, 0.4078431, 1,
-0.1822568, -1.127543, -1.05433, 0, 1, 0.4117647, 1,
-0.1803243, 0.4216865, 0.6612716, 0, 1, 0.4196078, 1,
-0.1801758, -1.542138, -2.896755, 0, 1, 0.4235294, 1,
-0.1765412, -0.9936043, -3.171424, 0, 1, 0.4313726, 1,
-0.1731883, 0.3491502, 1.026551, 0, 1, 0.4352941, 1,
-0.1704121, -0.7806796, -4.012731, 0, 1, 0.4431373, 1,
-0.1699347, -0.7328613, -3.037429, 0, 1, 0.4470588, 1,
-0.1693882, -0.06870344, -1.769437, 0, 1, 0.454902, 1,
-0.1654888, -1.634692, -3.510144, 0, 1, 0.4588235, 1,
-0.1628731, -0.9062321, -1.839175, 0, 1, 0.4666667, 1,
-0.1611078, 0.1404093, -0.9779271, 0, 1, 0.4705882, 1,
-0.1601083, -0.8540934, -3.089656, 0, 1, 0.4784314, 1,
-0.1563737, 0.9469559, -0.5946178, 0, 1, 0.4823529, 1,
-0.1562949, -1.522332, -4.675779, 0, 1, 0.4901961, 1,
-0.1512406, 1.081957, 0.5668722, 0, 1, 0.4941176, 1,
-0.1510265, -0.9576842, -2.160277, 0, 1, 0.5019608, 1,
-0.1504738, 0.006621617, -2.481258, 0, 1, 0.509804, 1,
-0.1491101, -0.5128018, -2.618779, 0, 1, 0.5137255, 1,
-0.1438609, 0.2459492, -1.694565, 0, 1, 0.5215687, 1,
-0.1378741, 0.05332629, -0.9240333, 0, 1, 0.5254902, 1,
-0.1370138, -0.01856429, -0.1975826, 0, 1, 0.5333334, 1,
-0.1252031, -0.3996899, -3.895167, 0, 1, 0.5372549, 1,
-0.1220265, -1.479972, -3.822732, 0, 1, 0.5450981, 1,
-0.1133101, 0.4143399, 1.079485, 0, 1, 0.5490196, 1,
-0.1081866, 1.08641, -0.7638335, 0, 1, 0.5568628, 1,
-0.1070688, -0.852885, -2.325966, 0, 1, 0.5607843, 1,
-0.1049426, 1.20341, 0.4282387, 0, 1, 0.5686275, 1,
-0.1007037, 0.15858, -1.16004, 0, 1, 0.572549, 1,
-0.09742604, 0.2020804, 0.1747352, 0, 1, 0.5803922, 1,
-0.0968405, 0.7693749, 0.9807541, 0, 1, 0.5843138, 1,
-0.09288133, -1.237994, -1.358076, 0, 1, 0.5921569, 1,
-0.09084128, -0.1556363, -3.701869, 0, 1, 0.5960785, 1,
-0.08563972, 0.7619569, -1.112728, 0, 1, 0.6039216, 1,
-0.08080433, -0.03844341, -0.8557389, 0, 1, 0.6117647, 1,
-0.08014084, -0.902764, -3.044878, 0, 1, 0.6156863, 1,
-0.06699383, 0.4181007, 0.2990978, 0, 1, 0.6235294, 1,
-0.06458688, 1.193928, 1.081954, 0, 1, 0.627451, 1,
-0.05819486, -0.1082017, -3.377826, 0, 1, 0.6352941, 1,
-0.05815713, -0.09562949, -3.682175, 0, 1, 0.6392157, 1,
-0.05667954, 1.827926, -0.9090235, 0, 1, 0.6470588, 1,
-0.05465125, -0.1057058, -3.650789, 0, 1, 0.6509804, 1,
-0.04461062, 0.3732867, 0.1199152, 0, 1, 0.6588235, 1,
-0.04397107, -0.2686011, -3.299048, 0, 1, 0.6627451, 1,
-0.04212508, -1.009656, -1.699637, 0, 1, 0.6705883, 1,
-0.03905628, -0.709365, -3.684421, 0, 1, 0.6745098, 1,
-0.03340565, 0.1284032, 2.259313, 0, 1, 0.682353, 1,
-0.03082367, 0.3030572, 0.1924956, 0, 1, 0.6862745, 1,
-0.02934081, 1.309755, 0.05869435, 0, 1, 0.6941177, 1,
-0.02933924, 1.513457, -0.8697041, 0, 1, 0.7019608, 1,
-0.02828379, 2.879312, -1.470883, 0, 1, 0.7058824, 1,
-0.02589625, -0.3681616, -3.93019, 0, 1, 0.7137255, 1,
-0.01911673, -0.5391595, -3.666829, 0, 1, 0.7176471, 1,
-0.01608793, -0.249265, -3.507315, 0, 1, 0.7254902, 1,
-0.01324784, 0.2934178, -1.730555, 0, 1, 0.7294118, 1,
-0.01189394, 1.840985, -0.577698, 0, 1, 0.7372549, 1,
-0.01139119, 0.3445399, 0.01714316, 0, 1, 0.7411765, 1,
-0.01066841, 0.7881587, 0.1728724, 0, 1, 0.7490196, 1,
-0.007269396, -1.524235, -3.505986, 0, 1, 0.7529412, 1,
-0.003149099, -1.402772, -2.549634, 0, 1, 0.7607843, 1,
-0.0001595348, -0.855642, -2.520739, 0, 1, 0.7647059, 1,
0.001559673, -0.4045289, 1.390631, 0, 1, 0.772549, 1,
0.00671079, 0.9095052, -0.8947445, 0, 1, 0.7764706, 1,
0.00702327, 1.012733, 1.235258, 0, 1, 0.7843137, 1,
0.01303954, -1.346624, 3.282726, 0, 1, 0.7882353, 1,
0.01587821, -1.257707, 4.033425, 0, 1, 0.7960784, 1,
0.01721772, -0.9797806, 0.8769346, 0, 1, 0.8039216, 1,
0.01789205, -0.7912754, 3.988897, 0, 1, 0.8078431, 1,
0.01855817, -0.04157259, 2.931226, 0, 1, 0.8156863, 1,
0.01969755, -0.6123581, 4.311418, 0, 1, 0.8196079, 1,
0.02254684, -0.6989998, 3.650708, 0, 1, 0.827451, 1,
0.02254965, 0.2141301, -0.02307821, 0, 1, 0.8313726, 1,
0.0225498, 0.4386629, -1.478303, 0, 1, 0.8392157, 1,
0.02695318, 0.3851332, 1.951557, 0, 1, 0.8431373, 1,
0.02753713, -3.094699, 3.313916, 0, 1, 0.8509804, 1,
0.03015779, 0.08303086, -0.748323, 0, 1, 0.854902, 1,
0.04770093, -0.5068373, 2.912404, 0, 1, 0.8627451, 1,
0.04811053, 0.1414955, 1.973112, 0, 1, 0.8666667, 1,
0.04989139, -0.1942082, 3.483933, 0, 1, 0.8745098, 1,
0.05221937, 0.009133913, -1.248616, 0, 1, 0.8784314, 1,
0.05466931, 1.504685, -0.7012669, 0, 1, 0.8862745, 1,
0.05519354, -0.3303333, 3.1077, 0, 1, 0.8901961, 1,
0.05875395, 0.09038406, 0.2824376, 0, 1, 0.8980392, 1,
0.06627607, -0.9455911, 2.829908, 0, 1, 0.9058824, 1,
0.07050344, -1.322085, 3.307604, 0, 1, 0.9098039, 1,
0.070979, -0.3059506, 2.225067, 0, 1, 0.9176471, 1,
0.07678006, -0.2636717, 2.050609, 0, 1, 0.9215686, 1,
0.07815091, -1.635542, 2.748605, 0, 1, 0.9294118, 1,
0.08001252, 1.084342, -1.544147, 0, 1, 0.9333333, 1,
0.08120072, -0.4166948, 2.438392, 0, 1, 0.9411765, 1,
0.08428287, 2.244526, 2.537767, 0, 1, 0.945098, 1,
0.08503194, 0.622677, -0.651803, 0, 1, 0.9529412, 1,
0.08693057, -1.59117, 4.508108, 0, 1, 0.9568627, 1,
0.09327202, -0.2186911, 2.794425, 0, 1, 0.9647059, 1,
0.09486011, -0.343336, 2.824509, 0, 1, 0.9686275, 1,
0.09611927, 2.309138, 1.307074, 0, 1, 0.9764706, 1,
0.09730344, 0.6284413, 0.706667, 0, 1, 0.9803922, 1,
0.1018542, 1.361692, 0.783963, 0, 1, 0.9882353, 1,
0.1019164, -0.220872, 2.931834, 0, 1, 0.9921569, 1,
0.1093846, 0.09999725, 0.4446125, 0, 1, 1, 1,
0.1132644, 0.428601, 1.186507, 0, 0.9921569, 1, 1,
0.117429, 1.531705, -0.7886865, 0, 0.9882353, 1, 1,
0.1180157, 0.7401996, 1.751423, 0, 0.9803922, 1, 1,
0.1182329, 0.9902912, 0.07310357, 0, 0.9764706, 1, 1,
0.1188282, -0.7420014, 3.926205, 0, 0.9686275, 1, 1,
0.1190989, -1.186838, 4.146432, 0, 0.9647059, 1, 1,
0.1250083, -0.935064, 2.243096, 0, 0.9568627, 1, 1,
0.1265552, 0.4002868, 0.2366149, 0, 0.9529412, 1, 1,
0.1297101, 1.521068, 0.4306324, 0, 0.945098, 1, 1,
0.1311942, -0.07206977, 0.6524421, 0, 0.9411765, 1, 1,
0.1332426, 0.2413372, 1.796266, 0, 0.9333333, 1, 1,
0.1337238, -1.192682, 4.59476, 0, 0.9294118, 1, 1,
0.1338832, 0.6824914, 0.2585171, 0, 0.9215686, 1, 1,
0.1353857, -1.196831, 3.07723, 0, 0.9176471, 1, 1,
0.1353863, 2.254843, -0.5610008, 0, 0.9098039, 1, 1,
0.1373308, 0.03944345, 0.7366503, 0, 0.9058824, 1, 1,
0.1375474, 1.005929, -0.4062734, 0, 0.8980392, 1, 1,
0.1381139, 0.5546646, 0.5690659, 0, 0.8901961, 1, 1,
0.1393208, 0.4167195, 1.4319, 0, 0.8862745, 1, 1,
0.1435398, 1.683029, 1.742737, 0, 0.8784314, 1, 1,
0.1502291, -0.1409658, 0.2445471, 0, 0.8745098, 1, 1,
0.1506932, -2.775393, 3.76417, 0, 0.8666667, 1, 1,
0.1526802, -0.4180001, 3.352911, 0, 0.8627451, 1, 1,
0.154278, -1.258736, 1.843103, 0, 0.854902, 1, 1,
0.1602335, 1.819522, -0.2988481, 0, 0.8509804, 1, 1,
0.1636849, -0.1349048, 2.545228, 0, 0.8431373, 1, 1,
0.1659462, 0.6722864, 0.9513638, 0, 0.8392157, 1, 1,
0.167265, -0.3982085, 4.017622, 0, 0.8313726, 1, 1,
0.1710793, 0.07307097, 3.800104, 0, 0.827451, 1, 1,
0.1768508, 1.501445, 1.341905, 0, 0.8196079, 1, 1,
0.1791865, -0.2796483, 2.542601, 0, 0.8156863, 1, 1,
0.1794094, -1.048301, 5.551885, 0, 0.8078431, 1, 1,
0.1805721, 1.182503, -1.364311, 0, 0.8039216, 1, 1,
0.1842409, 1.176478, 0.4127164, 0, 0.7960784, 1, 1,
0.1861189, -0.3163567, 1.004991, 0, 0.7882353, 1, 1,
0.1898861, -0.4845835, 1.363322, 0, 0.7843137, 1, 1,
0.1906448, 0.115088, 1.850484, 0, 0.7764706, 1, 1,
0.1952445, 0.797131, -0.552161, 0, 0.772549, 1, 1,
0.1976541, -0.6627242, 0.7185714, 0, 0.7647059, 1, 1,
0.198277, 0.9797777, 1.497537, 0, 0.7607843, 1, 1,
0.1986025, 1.301964, 1.246002, 0, 0.7529412, 1, 1,
0.2013038, -1.606506, 1.893943, 0, 0.7490196, 1, 1,
0.202349, 1.447917, 0.6796263, 0, 0.7411765, 1, 1,
0.203378, -0.8128479, 6.294761, 0, 0.7372549, 1, 1,
0.2069561, -1.715494, 2.331341, 0, 0.7294118, 1, 1,
0.2112944, -1.901636, 3.340684, 0, 0.7254902, 1, 1,
0.2113867, -0.1789157, 1.405662, 0, 0.7176471, 1, 1,
0.2115582, 0.7232524, -0.9949265, 0, 0.7137255, 1, 1,
0.2117724, 0.4098782, 0.05563165, 0, 0.7058824, 1, 1,
0.2182447, -0.7805703, 1.81369, 0, 0.6980392, 1, 1,
0.224227, 0.06623355, 1.931982, 0, 0.6941177, 1, 1,
0.2311947, -0.1291542, 1.564703, 0, 0.6862745, 1, 1,
0.2332723, -0.412321, 2.409689, 0, 0.682353, 1, 1,
0.2339797, 1.327594, -0.5608062, 0, 0.6745098, 1, 1,
0.2350861, -0.4427181, 2.098472, 0, 0.6705883, 1, 1,
0.2352781, -0.5093902, 2.217275, 0, 0.6627451, 1, 1,
0.2378589, 1.944896, 0.5968539, 0, 0.6588235, 1, 1,
0.2407077, -0.706889, 1.499123, 0, 0.6509804, 1, 1,
0.2418453, 1.986389, 1.059648, 0, 0.6470588, 1, 1,
0.2425493, 0.701781, -0.4775482, 0, 0.6392157, 1, 1,
0.2456806, 1.928483, 0.0987061, 0, 0.6352941, 1, 1,
0.2456985, -0.7262334, 4.017544, 0, 0.627451, 1, 1,
0.2457731, -0.3358365, 1.139391, 0, 0.6235294, 1, 1,
0.2604432, -1.373555, 3.83272, 0, 0.6156863, 1, 1,
0.2630872, 0.8819796, 0.0620782, 0, 0.6117647, 1, 1,
0.2634963, 0.6349748, -1.723047, 0, 0.6039216, 1, 1,
0.2636067, -0.572328, 3.642748, 0, 0.5960785, 1, 1,
0.2636479, -0.1925239, 2.277389, 0, 0.5921569, 1, 1,
0.2658102, 0.5969205, 0.07510153, 0, 0.5843138, 1, 1,
0.2666938, -0.4858733, 2.495525, 0, 0.5803922, 1, 1,
0.2671154, -0.1293299, 2.470081, 0, 0.572549, 1, 1,
0.2766919, 1.36569, 2.118944, 0, 0.5686275, 1, 1,
0.2767584, -0.4769012, 2.996041, 0, 0.5607843, 1, 1,
0.2786988, 0.613942, -0.1673042, 0, 0.5568628, 1, 1,
0.2805463, -0.3097813, 2.929659, 0, 0.5490196, 1, 1,
0.2827149, 0.08889835, 0.6881559, 0, 0.5450981, 1, 1,
0.2873848, 2.500046, 0.5054481, 0, 0.5372549, 1, 1,
0.2883579, 0.5541223, 0.4093269, 0, 0.5333334, 1, 1,
0.2893603, 1.484924, 0.2421683, 0, 0.5254902, 1, 1,
0.2924981, -0.2335391, 3.078677, 0, 0.5215687, 1, 1,
0.2956545, 1.614413, -1.083385, 0, 0.5137255, 1, 1,
0.2965619, -0.2590882, 1.779013, 0, 0.509804, 1, 1,
0.2993985, 0.1462387, 0.4175187, 0, 0.5019608, 1, 1,
0.3038448, 0.8589129, -1.155158, 0, 0.4941176, 1, 1,
0.3040263, 0.7265111, 1.610881, 0, 0.4901961, 1, 1,
0.3042573, 0.7574848, 1.548117, 0, 0.4823529, 1, 1,
0.3048323, 1.07949, -1.319268, 0, 0.4784314, 1, 1,
0.3055162, -0.301597, 3.526695, 0, 0.4705882, 1, 1,
0.3080117, 0.944631, -0.07834703, 0, 0.4666667, 1, 1,
0.3083752, -0.7704815, 3.120948, 0, 0.4588235, 1, 1,
0.3100311, -0.2374825, 2.917701, 0, 0.454902, 1, 1,
0.3106358, 0.3135307, 1.571949, 0, 0.4470588, 1, 1,
0.3171892, -1.33751, 4.847828, 0, 0.4431373, 1, 1,
0.3186615, 1.123686, 0.7212335, 0, 0.4352941, 1, 1,
0.318814, -1.738596, 3.562536, 0, 0.4313726, 1, 1,
0.3207886, 0.5797588, 0.6693208, 0, 0.4235294, 1, 1,
0.3268141, 0.107182, 2.327779, 0, 0.4196078, 1, 1,
0.3294713, 0.7591162, 0.6642514, 0, 0.4117647, 1, 1,
0.3299862, -1.400627, 2.747759, 0, 0.4078431, 1, 1,
0.3301035, -0.6197455, 2.990003, 0, 0.4, 1, 1,
0.3315243, 0.9524828, 0.3266224, 0, 0.3921569, 1, 1,
0.3330635, 0.1981098, 0.849093, 0, 0.3882353, 1, 1,
0.3346314, 1.409856, 0.2107045, 0, 0.3803922, 1, 1,
0.3377297, 0.5520316, 0.7047938, 0, 0.3764706, 1, 1,
0.3412188, 0.456821, 1.328735, 0, 0.3686275, 1, 1,
0.3416764, -0.7406707, 3.756138, 0, 0.3647059, 1, 1,
0.342032, 0.06679755, 2.101735, 0, 0.3568628, 1, 1,
0.3425897, 1.180619, -0.05910138, 0, 0.3529412, 1, 1,
0.3448873, -0.8696107, 3.675496, 0, 0.345098, 1, 1,
0.3460752, -0.2231553, 2.059697, 0, 0.3411765, 1, 1,
0.3499179, 1.299034, 0.5327688, 0, 0.3333333, 1, 1,
0.3538305, -0.8253914, 2.964934, 0, 0.3294118, 1, 1,
0.3548406, 0.6471209, 0.8112869, 0, 0.3215686, 1, 1,
0.3576788, 0.3373603, 2.260762, 0, 0.3176471, 1, 1,
0.3641654, -0.01009258, -0.4226914, 0, 0.3098039, 1, 1,
0.3675828, -0.1452947, 1.460976, 0, 0.3058824, 1, 1,
0.3701498, -1.553805, 2.670506, 0, 0.2980392, 1, 1,
0.3728617, 0.8887727, -1.800715, 0, 0.2901961, 1, 1,
0.3732379, -0.7434537, 2.671697, 0, 0.2862745, 1, 1,
0.3777592, 0.5461486, -1.723278, 0, 0.2784314, 1, 1,
0.3787493, 0.913431, -1.160573, 0, 0.2745098, 1, 1,
0.3821015, 0.192289, 1.924331, 0, 0.2666667, 1, 1,
0.3832437, -0.6303399, 3.93012, 0, 0.2627451, 1, 1,
0.3858564, 0.225771, 2.078801, 0, 0.254902, 1, 1,
0.3888374, 0.9079125, -0.2549826, 0, 0.2509804, 1, 1,
0.389079, 1.859679, -0.7190099, 0, 0.2431373, 1, 1,
0.3918676, 0.9672242, -0.3353628, 0, 0.2392157, 1, 1,
0.3937074, 2.521882, 0.6907555, 0, 0.2313726, 1, 1,
0.3954993, -1.589075, 2.099558, 0, 0.227451, 1, 1,
0.3992116, -0.382089, 2.771819, 0, 0.2196078, 1, 1,
0.3998151, 0.5626575, 1.782992, 0, 0.2156863, 1, 1,
0.4029347, 1.540134, 1.762445, 0, 0.2078431, 1, 1,
0.412037, -1.17001, 3.053551, 0, 0.2039216, 1, 1,
0.4131721, 0.2168989, -0.253507, 0, 0.1960784, 1, 1,
0.4135881, 1.113569, -0.1133876, 0, 0.1882353, 1, 1,
0.4216802, -0.03669872, 0.5743451, 0, 0.1843137, 1, 1,
0.4261113, 0.7235594, -0.408107, 0, 0.1764706, 1, 1,
0.4307137, -0.7302791, 2.889624, 0, 0.172549, 1, 1,
0.4343694, 0.689061, -0.2105476, 0, 0.1647059, 1, 1,
0.4352448, 0.7430367, 1.47237, 0, 0.1607843, 1, 1,
0.4360711, -1.671097, 1.771906, 0, 0.1529412, 1, 1,
0.4392328, 1.871658, 0.483865, 0, 0.1490196, 1, 1,
0.441363, 1.061476, 1.154013, 0, 0.1411765, 1, 1,
0.4427352, 0.08836266, 1.25833, 0, 0.1372549, 1, 1,
0.4432502, 0.1031867, 0.9177215, 0, 0.1294118, 1, 1,
0.4439988, 1.153625, -0.1919603, 0, 0.1254902, 1, 1,
0.4444887, 1.791583, -0.004411919, 0, 0.1176471, 1, 1,
0.4460887, -0.9444879, 3.994003, 0, 0.1137255, 1, 1,
0.4529638, 0.6695272, 0.595432, 0, 0.1058824, 1, 1,
0.4530244, 0.3736263, 0.358348, 0, 0.09803922, 1, 1,
0.4589627, 0.9931822, 0.320182, 0, 0.09411765, 1, 1,
0.4618995, 1.211343, -1.601563, 0, 0.08627451, 1, 1,
0.4654518, -0.6105729, 3.774767, 0, 0.08235294, 1, 1,
0.4667434, 1.275215, -0.07415905, 0, 0.07450981, 1, 1,
0.4679413, -1.538805, 3.09198, 0, 0.07058824, 1, 1,
0.4687817, 0.3301631, 1.568886, 0, 0.0627451, 1, 1,
0.4710568, -0.0168252, 2.549563, 0, 0.05882353, 1, 1,
0.4713283, -1.73417, 2.369057, 0, 0.05098039, 1, 1,
0.4798726, 0.8153587, -0.06448026, 0, 0.04705882, 1, 1,
0.4801847, 1.498833, 1.400664, 0, 0.03921569, 1, 1,
0.483148, -0.6913713, 2.456449, 0, 0.03529412, 1, 1,
0.4845636, 1.182623, 0.1273258, 0, 0.02745098, 1, 1,
0.4864199, 0.2287988, -0.1236563, 0, 0.02352941, 1, 1,
0.4893993, 0.779774, 2.140967, 0, 0.01568628, 1, 1,
0.491668, -1.429005, 3.744906, 0, 0.01176471, 1, 1,
0.4927404, -0.1720361, 0.6906526, 0, 0.003921569, 1, 1,
0.494447, -0.5608185, 3.592133, 0.003921569, 0, 1, 1,
0.4948253, 0.6310875, -0.4687266, 0.007843138, 0, 1, 1,
0.4962491, -0.8743331, 2.217023, 0.01568628, 0, 1, 1,
0.4981448, -0.4920177, 3.324703, 0.01960784, 0, 1, 1,
0.4990111, -0.2605476, 1.037958, 0.02745098, 0, 1, 1,
0.4998803, 0.6442815, 2.315222, 0.03137255, 0, 1, 1,
0.5032592, 2.19084, 1.178427, 0.03921569, 0, 1, 1,
0.5032898, 0.563488, 1.838301, 0.04313726, 0, 1, 1,
0.5035341, 0.7802157, 0.4809804, 0.05098039, 0, 1, 1,
0.506667, 0.6638339, -1.023106, 0.05490196, 0, 1, 1,
0.5086856, 0.1504213, 1.677201, 0.0627451, 0, 1, 1,
0.512035, -0.25525, 1.58276, 0.06666667, 0, 1, 1,
0.5146308, 2.020138, -0.3812694, 0.07450981, 0, 1, 1,
0.5189909, 1.032758, 0.1633237, 0.07843138, 0, 1, 1,
0.5315961, -2.543322, 2.802774, 0.08627451, 0, 1, 1,
0.5395746, 0.1909591, 2.837199, 0.09019608, 0, 1, 1,
0.5407562, -1.601307, 3.008088, 0.09803922, 0, 1, 1,
0.5472916, -0.2885899, 1.877936, 0.1058824, 0, 1, 1,
0.5476866, -0.4182596, 2.026803, 0.1098039, 0, 1, 1,
0.5553281, -0.4232876, 3.509294, 0.1176471, 0, 1, 1,
0.5556211, 1.14777, 0.6578118, 0.1215686, 0, 1, 1,
0.5622935, -0.2793931, 1.382837, 0.1294118, 0, 1, 1,
0.5722497, -0.5570138, 1.442461, 0.1333333, 0, 1, 1,
0.5722812, -1.660114, 1.778261, 0.1411765, 0, 1, 1,
0.5788741, -0.7152557, 1.973683, 0.145098, 0, 1, 1,
0.5794191, 0.1474111, -0.1266141, 0.1529412, 0, 1, 1,
0.5805832, -0.009670734, 2.100573, 0.1568628, 0, 1, 1,
0.5815887, -1.534158, 2.404917, 0.1647059, 0, 1, 1,
0.581972, 2.418827, -0.3734448, 0.1686275, 0, 1, 1,
0.586009, -0.6925564, 0.7062616, 0.1764706, 0, 1, 1,
0.5863237, 0.6029702, 1.367344, 0.1803922, 0, 1, 1,
0.5873092, 1.178838, 0.8706296, 0.1882353, 0, 1, 1,
0.592891, -0.2518429, 3.003161, 0.1921569, 0, 1, 1,
0.5946874, -0.5230352, 1.384577, 0.2, 0, 1, 1,
0.6012229, 1.341914, 0.2697205, 0.2078431, 0, 1, 1,
0.6022798, 0.08761377, 0.6072434, 0.2117647, 0, 1, 1,
0.6045973, 0.9299881, 0.5072368, 0.2196078, 0, 1, 1,
0.6229442, 0.9829941, 1.090861, 0.2235294, 0, 1, 1,
0.6233971, -0.4828669, 2.418206, 0.2313726, 0, 1, 1,
0.6235451, 0.4630338, 1.794837, 0.2352941, 0, 1, 1,
0.62522, -0.9368913, 3.375534, 0.2431373, 0, 1, 1,
0.6273235, 1.031686, 1.061012, 0.2470588, 0, 1, 1,
0.6309667, 0.6558557, 1.288054, 0.254902, 0, 1, 1,
0.6321332, -0.3011041, 2.692682, 0.2588235, 0, 1, 1,
0.6379037, 0.13467, 2.295898, 0.2666667, 0, 1, 1,
0.6381586, -1.172072, 2.980315, 0.2705882, 0, 1, 1,
0.640165, 0.2295255, 0.3860414, 0.2784314, 0, 1, 1,
0.6431525, 2.244449, -1.530073, 0.282353, 0, 1, 1,
0.649127, -1.294881, 0.7752467, 0.2901961, 0, 1, 1,
0.6505538, -0.8378572, 0.965039, 0.2941177, 0, 1, 1,
0.6529028, 1.313045, 2.811307, 0.3019608, 0, 1, 1,
0.6559722, 1.404881, 0.9324859, 0.3098039, 0, 1, 1,
0.6586502, 0.5197239, 2.613667, 0.3137255, 0, 1, 1,
0.6602438, 0.1504942, 0.8158865, 0.3215686, 0, 1, 1,
0.6674164, -0.6397106, 2.460552, 0.3254902, 0, 1, 1,
0.6691509, -0.2761259, 0.6500643, 0.3333333, 0, 1, 1,
0.6718673, -0.09130523, 3.584944, 0.3372549, 0, 1, 1,
0.672246, -0.2899092, 1.280078, 0.345098, 0, 1, 1,
0.6738561, -0.5976638, 2.493968, 0.3490196, 0, 1, 1,
0.6815455, -0.9449897, 0.7800525, 0.3568628, 0, 1, 1,
0.6824865, 2.319787, -0.9268111, 0.3607843, 0, 1, 1,
0.6833661, 2.577338, -0.2452211, 0.3686275, 0, 1, 1,
0.6834491, -0.8524798, 1.844306, 0.372549, 0, 1, 1,
0.6864392, 0.6792809, 1.621196, 0.3803922, 0, 1, 1,
0.6867396, 0.2538396, 1.898964, 0.3843137, 0, 1, 1,
0.6915313, -0.3335586, 4.772449, 0.3921569, 0, 1, 1,
0.6935232, -1.552551, 3.051416, 0.3960784, 0, 1, 1,
0.6981238, 0.5808498, 0.4873842, 0.4039216, 0, 1, 1,
0.6999075, 0.5179522, 0.7747937, 0.4117647, 0, 1, 1,
0.7131944, -1.105943, 4.641384, 0.4156863, 0, 1, 1,
0.7136579, -0.1778724, 3.169321, 0.4235294, 0, 1, 1,
0.7138671, 0.8311372, -0.2522706, 0.427451, 0, 1, 1,
0.7163047, -1.039181, 1.890498, 0.4352941, 0, 1, 1,
0.7207189, 0.3966804, 1.80652, 0.4392157, 0, 1, 1,
0.7226118, -0.2530191, 1.87611, 0.4470588, 0, 1, 1,
0.7282349, 0.4022897, 0.5868192, 0.4509804, 0, 1, 1,
0.729969, -0.1574916, 3.921082, 0.4588235, 0, 1, 1,
0.7313465, 0.2532431, 1.68652, 0.4627451, 0, 1, 1,
0.7350082, 1.447376, 0.1219073, 0.4705882, 0, 1, 1,
0.7380739, 2.348574, 0.7067729, 0.4745098, 0, 1, 1,
0.7491322, -0.5996866, 1.550691, 0.4823529, 0, 1, 1,
0.7498561, 0.8115091, 1.824626, 0.4862745, 0, 1, 1,
0.750982, 0.1308301, 2.166106, 0.4941176, 0, 1, 1,
0.7510111, 0.1288625, 1.998269, 0.5019608, 0, 1, 1,
0.7523257, -1.818953, 2.688375, 0.5058824, 0, 1, 1,
0.7562354, -0.02768941, 0.5887781, 0.5137255, 0, 1, 1,
0.7563869, 0.08055312, 1.137513, 0.5176471, 0, 1, 1,
0.7574238, 0.4089654, -0.716591, 0.5254902, 0, 1, 1,
0.7591371, -0.1426014, 0.4651592, 0.5294118, 0, 1, 1,
0.7696753, 2.573001, 0.4631349, 0.5372549, 0, 1, 1,
0.7783327, -0.5298046, 2.196895, 0.5411765, 0, 1, 1,
0.7817595, -0.7755374, 2.663929, 0.5490196, 0, 1, 1,
0.7887917, -0.8089359, 1.585606, 0.5529412, 0, 1, 1,
0.79, 0.2715832, 1.809031, 0.5607843, 0, 1, 1,
0.7935063, 2.14508, -1.496954, 0.5647059, 0, 1, 1,
0.7945116, -0.4429959, 2.761247, 0.572549, 0, 1, 1,
0.7976051, 0.3629996, 2.860489, 0.5764706, 0, 1, 1,
0.8068429, -1.042987, 3.161768, 0.5843138, 0, 1, 1,
0.8084623, 0.03113799, 2.887151, 0.5882353, 0, 1, 1,
0.8117537, -0.861374, 1.885988, 0.5960785, 0, 1, 1,
0.8189061, 0.8595688, 1.303708, 0.6039216, 0, 1, 1,
0.8192179, 0.1515389, 2.023846, 0.6078432, 0, 1, 1,
0.8219693, -0.8894934, 1.201753, 0.6156863, 0, 1, 1,
0.8239124, 0.3545668, 1.17308, 0.6196079, 0, 1, 1,
0.8249037, -0.8610728, 1.790582, 0.627451, 0, 1, 1,
0.8264263, -1.410678, 2.629634, 0.6313726, 0, 1, 1,
0.8352889, -0.8058571, 1.494244, 0.6392157, 0, 1, 1,
0.844925, -0.5446277, 3.225311, 0.6431373, 0, 1, 1,
0.8461385, 0.1144873, 1.540341, 0.6509804, 0, 1, 1,
0.8474774, -0.9943208, 3.19574, 0.654902, 0, 1, 1,
0.8488058, -1.300269, 3.200977, 0.6627451, 0, 1, 1,
0.8544996, 1.99867, 2.076492, 0.6666667, 0, 1, 1,
0.8588876, 2.179924, 1.711311, 0.6745098, 0, 1, 1,
0.8634988, 0.6872524, 1.021069, 0.6784314, 0, 1, 1,
0.8639611, -0.2615325, 3.276371, 0.6862745, 0, 1, 1,
0.8699607, -0.6302125, 1.668572, 0.6901961, 0, 1, 1,
0.8709515, -0.3588285, 0.3685908, 0.6980392, 0, 1, 1,
0.872592, 0.1931937, 1.45678, 0.7058824, 0, 1, 1,
0.8729812, -1.458529, 2.669508, 0.7098039, 0, 1, 1,
0.8743715, 1.254094, 0.564102, 0.7176471, 0, 1, 1,
0.874869, 1.212743, -0.9519329, 0.7215686, 0, 1, 1,
0.8751329, -0.7191451, 3.474297, 0.7294118, 0, 1, 1,
0.8777851, 2.13497, 0.3891617, 0.7333333, 0, 1, 1,
0.880055, 0.2925926, 2.250839, 0.7411765, 0, 1, 1,
0.8822153, 0.1809609, 2.754806, 0.7450981, 0, 1, 1,
0.8856201, 0.4781144, 1.30465, 0.7529412, 0, 1, 1,
0.8884687, 0.4109447, -0.1248465, 0.7568628, 0, 1, 1,
0.8938223, -0.5566394, 3.389241, 0.7647059, 0, 1, 1,
0.8947173, -0.7027498, 3.038216, 0.7686275, 0, 1, 1,
0.9025939, -0.08652659, 2.138504, 0.7764706, 0, 1, 1,
0.9075494, 2.219499, 2.181051, 0.7803922, 0, 1, 1,
0.91141, -0.2418383, 0.6634124, 0.7882353, 0, 1, 1,
0.9168845, -0.4953031, 2.237198, 0.7921569, 0, 1, 1,
0.9217806, -0.4043956, 1.162339, 0.8, 0, 1, 1,
0.9253883, -1.450378, 2.474909, 0.8078431, 0, 1, 1,
0.9265183, 0.4470558, 0.9263333, 0.8117647, 0, 1, 1,
0.9299307, 0.2971487, 0.541798, 0.8196079, 0, 1, 1,
0.9332437, 0.7423458, 0.3472367, 0.8235294, 0, 1, 1,
0.9335717, 2.156574, -0.2509477, 0.8313726, 0, 1, 1,
0.9360726, -1.671549, 3.666085, 0.8352941, 0, 1, 1,
0.9373176, -0.005884785, 0.3981194, 0.8431373, 0, 1, 1,
0.9386112, -0.8529412, 2.259128, 0.8470588, 0, 1, 1,
0.9453466, -1.249973, 1.844711, 0.854902, 0, 1, 1,
0.9548485, -0.3575961, 0.8907016, 0.8588235, 0, 1, 1,
0.9575734, -0.8477852, 4.036643, 0.8666667, 0, 1, 1,
0.9713215, 0.7591007, 2.394797, 0.8705882, 0, 1, 1,
0.9734404, -0.7391348, 1.942375, 0.8784314, 0, 1, 1,
0.978591, -0.4327142, 1.419221, 0.8823529, 0, 1, 1,
0.9805804, -0.06317614, 1.692828, 0.8901961, 0, 1, 1,
0.9806413, -0.6778648, 2.134022, 0.8941177, 0, 1, 1,
0.9817009, 0.5549335, 2.429571, 0.9019608, 0, 1, 1,
0.9828776, -1.019372, 2.049876, 0.9098039, 0, 1, 1,
0.983757, -0.1826566, 2.451393, 0.9137255, 0, 1, 1,
0.9849263, 0.1298603, 1.082458, 0.9215686, 0, 1, 1,
0.9866288, 1.720377, -0.1913872, 0.9254902, 0, 1, 1,
0.9867227, -1.599126, 2.287409, 0.9333333, 0, 1, 1,
0.9923087, 0.5836543, 0.9904839, 0.9372549, 0, 1, 1,
0.9949549, -0.5701036, 1.894218, 0.945098, 0, 1, 1,
1.001277, -1.308426, 3.015004, 0.9490196, 0, 1, 1,
1.00198, -0.04478754, 0.7119874, 0.9568627, 0, 1, 1,
1.004525, 0.983412, -1.414446, 0.9607843, 0, 1, 1,
1.015984, 0.1631081, 3.135019, 0.9686275, 0, 1, 1,
1.016416, -0.3916799, 2.326785, 0.972549, 0, 1, 1,
1.017221, 0.105575, 2.2299, 0.9803922, 0, 1, 1,
1.02434, -1.026595, 2.345381, 0.9843137, 0, 1, 1,
1.025428, 0.3676569, 1.177541, 0.9921569, 0, 1, 1,
1.03566, 0.1915827, 3.187477, 0.9960784, 0, 1, 1,
1.036337, 0.0218672, 0.9493054, 1, 0, 0.9960784, 1,
1.038369, -0.9354271, 3.919856, 1, 0, 0.9882353, 1,
1.051778, -0.4867014, 2.333622, 1, 0, 0.9843137, 1,
1.05464, 3.265263, 0.1825232, 1, 0, 0.9764706, 1,
1.067335, 1.152303, -0.008671055, 1, 0, 0.972549, 1,
1.075711, 1.522575, -0.7915372, 1, 0, 0.9647059, 1,
1.07704, 0.1674393, 0.7086, 1, 0, 0.9607843, 1,
1.077082, -0.3498467, 1.61196, 1, 0, 0.9529412, 1,
1.078324, -0.4769677, 2.28336, 1, 0, 0.9490196, 1,
1.081182, -1.586977, 2.757903, 1, 0, 0.9411765, 1,
1.087181, 1.136223, -0.3755393, 1, 0, 0.9372549, 1,
1.093203, 0.5306165, 1.187739, 1, 0, 0.9294118, 1,
1.098155, 0.9246426, 1.282504, 1, 0, 0.9254902, 1,
1.102655, 1.289495, 0.7051018, 1, 0, 0.9176471, 1,
1.106179, -1.004942, 2.013601, 1, 0, 0.9137255, 1,
1.110722, 0.7431999, 1.881663, 1, 0, 0.9058824, 1,
1.114003, 0.6448405, 2.889626, 1, 0, 0.9019608, 1,
1.115838, -0.9615517, 1.223387, 1, 0, 0.8941177, 1,
1.11896, -1.063213, 2.904946, 1, 0, 0.8862745, 1,
1.120558, 0.8938656, 0.1367794, 1, 0, 0.8823529, 1,
1.126433, 0.2837027, 1.609525, 1, 0, 0.8745098, 1,
1.12828, -0.3852656, 3.111738, 1, 0, 0.8705882, 1,
1.130471, -1.758948, 0.865693, 1, 0, 0.8627451, 1,
1.132177, -0.5469751, 1.533925, 1, 0, 0.8588235, 1,
1.133947, -0.2194549, 1.013219, 1, 0, 0.8509804, 1,
1.139505, -0.7583451, 1.35428, 1, 0, 0.8470588, 1,
1.156316, 0.0207253, 2.139158, 1, 0, 0.8392157, 1,
1.165379, -0.5804592, 2.94906, 1, 0, 0.8352941, 1,
1.179268, -2.039274, 3.389208, 1, 0, 0.827451, 1,
1.193675, -0.161846, 2.739789, 1, 0, 0.8235294, 1,
1.211922, -0.465471, 1.893676, 1, 0, 0.8156863, 1,
1.213962, -2.043433, 1.35765, 1, 0, 0.8117647, 1,
1.215426, 0.5598893, 1.781053, 1, 0, 0.8039216, 1,
1.216549, -0.7374087, 0.2643464, 1, 0, 0.7960784, 1,
1.224949, 1.297431, 1.469924, 1, 0, 0.7921569, 1,
1.22746, 0.4454936, 1.513392, 1, 0, 0.7843137, 1,
1.233683, -1.802346, 3.247354, 1, 0, 0.7803922, 1,
1.235904, 0.1365033, 3.026996, 1, 0, 0.772549, 1,
1.240103, -0.2075817, 1.619388, 1, 0, 0.7686275, 1,
1.242506, 0.7679247, 1.4897, 1, 0, 0.7607843, 1,
1.242524, -0.5441411, 2.131544, 1, 0, 0.7568628, 1,
1.250297, -0.1371593, 1.875403, 1, 0, 0.7490196, 1,
1.253744, 0.870299, 0.652308, 1, 0, 0.7450981, 1,
1.257712, 1.152679, 1.955548, 1, 0, 0.7372549, 1,
1.259011, -1.152963, 3.264342, 1, 0, 0.7333333, 1,
1.261867, -0.8090395, 3.301978, 1, 0, 0.7254902, 1,
1.262738, 1.763451, 1.297846, 1, 0, 0.7215686, 1,
1.266652, -0.2114101, 1.899334, 1, 0, 0.7137255, 1,
1.272676, -0.505462, 1.652543, 1, 0, 0.7098039, 1,
1.276877, 1.287853, 1.338074, 1, 0, 0.7019608, 1,
1.281101, -1.36056, 3.18038, 1, 0, 0.6941177, 1,
1.29934, -1.495721, 1.483878, 1, 0, 0.6901961, 1,
1.301872, -1.698991, 2.26363, 1, 0, 0.682353, 1,
1.305818, -0.3375407, 1.753729, 1, 0, 0.6784314, 1,
1.313416, 0.5581589, 0.7479033, 1, 0, 0.6705883, 1,
1.321014, 0.7010505, 2.529753, 1, 0, 0.6666667, 1,
1.327335, 0.4895255, 1.062942, 1, 0, 0.6588235, 1,
1.349812, 0.8331902, -0.8900506, 1, 0, 0.654902, 1,
1.352722, -1.401238, 1.538458, 1, 0, 0.6470588, 1,
1.35346, -0.2068003, 3.736318, 1, 0, 0.6431373, 1,
1.357129, 0.786149, 1.553213, 1, 0, 0.6352941, 1,
1.368222, -0.2276971, -0.5962326, 1, 0, 0.6313726, 1,
1.376719, 0.7471036, 0.2516375, 1, 0, 0.6235294, 1,
1.379017, 0.01373478, 3.301993, 1, 0, 0.6196079, 1,
1.404976, 0.2389842, 0.5173132, 1, 0, 0.6117647, 1,
1.408138, -0.1166536, 1.036491, 1, 0, 0.6078432, 1,
1.410637, -0.6146958, 1.924571, 1, 0, 0.6, 1,
1.426195, -0.1445148, -0.5088077, 1, 0, 0.5921569, 1,
1.426252, -0.356597, 0.6466728, 1, 0, 0.5882353, 1,
1.427839, 0.9336711, -1.989763, 1, 0, 0.5803922, 1,
1.431481, 0.3746271, 2.1059, 1, 0, 0.5764706, 1,
1.433134, -1.856634, 4.751431, 1, 0, 0.5686275, 1,
1.439801, 0.416527, 0.128657, 1, 0, 0.5647059, 1,
1.44032, -1.365558, 3.085659, 1, 0, 0.5568628, 1,
1.457635, 0.9056506, -1.072887, 1, 0, 0.5529412, 1,
1.461562, -0.717963, 2.743483, 1, 0, 0.5450981, 1,
1.472612, -1.080918, 3.709902, 1, 0, 0.5411765, 1,
1.473159, 1.667468, 1.341519, 1, 0, 0.5333334, 1,
1.476419, -0.992386, 2.146982, 1, 0, 0.5294118, 1,
1.486991, 0.3368744, 1.428066, 1, 0, 0.5215687, 1,
1.492922, 1.749857, -0.4477473, 1, 0, 0.5176471, 1,
1.5075, -0.06485643, 3.259609, 1, 0, 0.509804, 1,
1.516167, 0.6780305, 2.377317, 1, 0, 0.5058824, 1,
1.518173, -0.2160453, 1.332382, 1, 0, 0.4980392, 1,
1.518993, 0.04461522, 1.206793, 1, 0, 0.4901961, 1,
1.526019, -0.306722, 2.165928, 1, 0, 0.4862745, 1,
1.53933, 1.556258, 1.237286, 1, 0, 0.4784314, 1,
1.542038, 0.3811116, 1.733939, 1, 0, 0.4745098, 1,
1.569034, -0.1448378, 2.845842, 1, 0, 0.4666667, 1,
1.57419, -1.407744, 2.253276, 1, 0, 0.4627451, 1,
1.586461, -0.9260342, 2.38305, 1, 0, 0.454902, 1,
1.590122, 0.7658306, 0.9543858, 1, 0, 0.4509804, 1,
1.593462, 1.36094, 0.5447657, 1, 0, 0.4431373, 1,
1.609278, 0.02254211, 0.6093233, 1, 0, 0.4392157, 1,
1.609544, -0.1660762, 1.20852, 1, 0, 0.4313726, 1,
1.624277, -1.124502, 1.397795, 1, 0, 0.427451, 1,
1.644628, 0.4100568, 1.713251, 1, 0, 0.4196078, 1,
1.647679, 0.9595551, 0.7815964, 1, 0, 0.4156863, 1,
1.651996, 1.498941, 0.07187927, 1, 0, 0.4078431, 1,
1.653513, 0.05216578, 1.697134, 1, 0, 0.4039216, 1,
1.671494, -0.4882889, 1.349837, 1, 0, 0.3960784, 1,
1.673858, 0.5990174, 1.623619, 1, 0, 0.3882353, 1,
1.686443, -0.4793177, 1.431071, 1, 0, 0.3843137, 1,
1.692265, -0.9133959, 3.644005, 1, 0, 0.3764706, 1,
1.696686, -1.818389, 3.296212, 1, 0, 0.372549, 1,
1.713082, 0.9512279, 1.126016, 1, 0, 0.3647059, 1,
1.715852, 0.2141636, 2.943545, 1, 0, 0.3607843, 1,
1.728455, 0.6308951, 1.435256, 1, 0, 0.3529412, 1,
1.731264, 1.110873, 2.652617, 1, 0, 0.3490196, 1,
1.739679, 0.2101866, 2.473007, 1, 0, 0.3411765, 1,
1.74625, 0.3881655, -0.489962, 1, 0, 0.3372549, 1,
1.748119, -0.6562973, 2.946352, 1, 0, 0.3294118, 1,
1.762414, 0.7443567, 0.640939, 1, 0, 0.3254902, 1,
1.765861, 0.4316982, 1.628271, 1, 0, 0.3176471, 1,
1.769011, 1.696395, 0.03873724, 1, 0, 0.3137255, 1,
1.784985, 1.206092, 1.353852, 1, 0, 0.3058824, 1,
1.82178, 0.9799476, 1.921196, 1, 0, 0.2980392, 1,
1.822581, -0.212802, 1.150136, 1, 0, 0.2941177, 1,
1.82286, -1.019543, 1.229397, 1, 0, 0.2862745, 1,
1.829668, -1.736575, 1.796679, 1, 0, 0.282353, 1,
1.83961, 0.08851177, 1.992085, 1, 0, 0.2745098, 1,
1.854278, 1.26902, 1.759877, 1, 0, 0.2705882, 1,
1.864365, -0.3274821, 2.458025, 1, 0, 0.2627451, 1,
1.87114, -0.5695069, 3.928762, 1, 0, 0.2588235, 1,
1.871614, -1.039506, 2.060882, 1, 0, 0.2509804, 1,
1.871644, -0.1948004, 1.919776, 1, 0, 0.2470588, 1,
1.891688, -1.087471, 0.7507834, 1, 0, 0.2392157, 1,
1.899358, 0.2136857, 1.912903, 1, 0, 0.2352941, 1,
1.914186, 0.04931734, -0.04099612, 1, 0, 0.227451, 1,
1.921142, -0.960615, 1.545755, 1, 0, 0.2235294, 1,
1.931279, -0.9614734, 0.1649187, 1, 0, 0.2156863, 1,
1.955786, -0.5012161, 1.264461, 1, 0, 0.2117647, 1,
1.961749, -0.09699883, 2.361814, 1, 0, 0.2039216, 1,
1.974152, -0.08126705, 0.5516093, 1, 0, 0.1960784, 1,
1.986819, 2.736489, 1.472929, 1, 0, 0.1921569, 1,
1.991718, -0.3646937, 0.9138941, 1, 0, 0.1843137, 1,
1.99482, 1.026485, -0.3411168, 1, 0, 0.1803922, 1,
2.002071, 0.2990776, -0.2898675, 1, 0, 0.172549, 1,
2.005871, 0.608075, 1.965659, 1, 0, 0.1686275, 1,
2.018906, 1.703878, 0.5116466, 1, 0, 0.1607843, 1,
2.025424, -1.177493, 1.344025, 1, 0, 0.1568628, 1,
2.043464, -0.07912744, 2.736183, 1, 0, 0.1490196, 1,
2.056158, -2.366519, 2.641526, 1, 0, 0.145098, 1,
2.063438, -1.117166, 1.984828, 1, 0, 0.1372549, 1,
2.07513, 0.5775024, 3.695363, 1, 0, 0.1333333, 1,
2.092204, -0.6044426, 2.767238, 1, 0, 0.1254902, 1,
2.108942, -1.071602, 3.127932, 1, 0, 0.1215686, 1,
2.116587, -1.503976, 2.862306, 1, 0, 0.1137255, 1,
2.127902, 1.346851, 1.900888, 1, 0, 0.1098039, 1,
2.1344, -1.273374, 1.397998, 1, 0, 0.1019608, 1,
2.163459, 1.647479, 2.427431, 1, 0, 0.09411765, 1,
2.268903, -0.2056904, 2.098253, 1, 0, 0.09019608, 1,
2.285172, 0.302502, 1.201493, 1, 0, 0.08235294, 1,
2.29108, -1.633214, 2.138774, 1, 0, 0.07843138, 1,
2.313128, -1.330126, 4.378166, 1, 0, 0.07058824, 1,
2.364022, -1.116274, 2.311956, 1, 0, 0.06666667, 1,
2.384493, -0.5040632, 2.73168, 1, 0, 0.05882353, 1,
2.441917, -0.139413, 0.9364192, 1, 0, 0.05490196, 1,
2.587813, -1.262824, 2.55514, 1, 0, 0.04705882, 1,
2.792598, -1.780597, 2.514043, 1, 0, 0.04313726, 1,
2.802916, -0.344719, 2.397241, 1, 0, 0.03529412, 1,
2.803188, 1.119354, 1.789701, 1, 0, 0.03137255, 1,
2.908556, 0.9690967, 0.5829906, 1, 0, 0.02352941, 1,
3.139176, 0.9608341, 0.9450997, 1, 0, 0.01960784, 1,
3.410345, -0.5145949, 0.1246356, 1, 0, 0.01176471, 1,
3.796536, 0.6341808, 2.230625, 1, 0, 0.007843138, 1
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
0.2425696, -4.172713, -8.894869, 0, -0.5, 0.5, 0.5,
0.2425696, -4.172713, -8.894869, 1, -0.5, 0.5, 0.5,
0.2425696, -4.172713, -8.894869, 1, 1.5, 0.5, 0.5,
0.2425696, -4.172713, -8.894869, 0, 1.5, 0.5, 0.5
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
-4.516192, 0.08528161, -8.894869, 0, -0.5, 0.5, 0.5,
-4.516192, 0.08528161, -8.894869, 1, -0.5, 0.5, 0.5,
-4.516192, 0.08528161, -8.894869, 1, 1.5, 0.5, 0.5,
-4.516192, 0.08528161, -8.894869, 0, 1.5, 0.5, 0.5
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
-4.516192, -4.172713, -0.1993091, 0, -0.5, 0.5, 0.5,
-4.516192, -4.172713, -0.1993091, 1, -0.5, 0.5, 0.5,
-4.516192, -4.172713, -0.1993091, 1, 1.5, 0.5, 0.5,
-4.516192, -4.172713, -0.1993091, 0, 1.5, 0.5, 0.5
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
-2, -3.190099, -6.888201,
2, -3.190099, -6.888201,
-2, -3.190099, -6.888201,
-2, -3.353868, -7.222646,
0, -3.190099, -6.888201,
0, -3.353868, -7.222646,
2, -3.190099, -6.888201,
2, -3.353868, -7.222646
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
"0",
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
-2, -3.681406, -7.891535, 0, -0.5, 0.5, 0.5,
-2, -3.681406, -7.891535, 1, -0.5, 0.5, 0.5,
-2, -3.681406, -7.891535, 1, 1.5, 0.5, 0.5,
-2, -3.681406, -7.891535, 0, 1.5, 0.5, 0.5,
0, -3.681406, -7.891535, 0, -0.5, 0.5, 0.5,
0, -3.681406, -7.891535, 1, -0.5, 0.5, 0.5,
0, -3.681406, -7.891535, 1, 1.5, 0.5, 0.5,
0, -3.681406, -7.891535, 0, 1.5, 0.5, 0.5,
2, -3.681406, -7.891535, 0, -0.5, 0.5, 0.5,
2, -3.681406, -7.891535, 1, -0.5, 0.5, 0.5,
2, -3.681406, -7.891535, 1, 1.5, 0.5, 0.5,
2, -3.681406, -7.891535, 0, 1.5, 0.5, 0.5
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
-3.418016, -3, -6.888201,
-3.418016, 3, -6.888201,
-3.418016, -3, -6.888201,
-3.601045, -3, -7.222646,
-3.418016, -2, -6.888201,
-3.601045, -2, -7.222646,
-3.418016, -1, -6.888201,
-3.601045, -1, -7.222646,
-3.418016, 0, -6.888201,
-3.601045, 0, -7.222646,
-3.418016, 1, -6.888201,
-3.601045, 1, -7.222646,
-3.418016, 2, -6.888201,
-3.601045, 2, -7.222646,
-3.418016, 3, -6.888201,
-3.601045, 3, -7.222646
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
-3.967104, -3, -7.891535, 0, -0.5, 0.5, 0.5,
-3.967104, -3, -7.891535, 1, -0.5, 0.5, 0.5,
-3.967104, -3, -7.891535, 1, 1.5, 0.5, 0.5,
-3.967104, -3, -7.891535, 0, 1.5, 0.5, 0.5,
-3.967104, -2, -7.891535, 0, -0.5, 0.5, 0.5,
-3.967104, -2, -7.891535, 1, -0.5, 0.5, 0.5,
-3.967104, -2, -7.891535, 1, 1.5, 0.5, 0.5,
-3.967104, -2, -7.891535, 0, 1.5, 0.5, 0.5,
-3.967104, -1, -7.891535, 0, -0.5, 0.5, 0.5,
-3.967104, -1, -7.891535, 1, -0.5, 0.5, 0.5,
-3.967104, -1, -7.891535, 1, 1.5, 0.5, 0.5,
-3.967104, -1, -7.891535, 0, 1.5, 0.5, 0.5,
-3.967104, 0, -7.891535, 0, -0.5, 0.5, 0.5,
-3.967104, 0, -7.891535, 1, -0.5, 0.5, 0.5,
-3.967104, 0, -7.891535, 1, 1.5, 0.5, 0.5,
-3.967104, 0, -7.891535, 0, 1.5, 0.5, 0.5,
-3.967104, 1, -7.891535, 0, -0.5, 0.5, 0.5,
-3.967104, 1, -7.891535, 1, -0.5, 0.5, 0.5,
-3.967104, 1, -7.891535, 1, 1.5, 0.5, 0.5,
-3.967104, 1, -7.891535, 0, 1.5, 0.5, 0.5,
-3.967104, 2, -7.891535, 0, -0.5, 0.5, 0.5,
-3.967104, 2, -7.891535, 1, -0.5, 0.5, 0.5,
-3.967104, 2, -7.891535, 1, 1.5, 0.5, 0.5,
-3.967104, 2, -7.891535, 0, 1.5, 0.5, 0.5,
-3.967104, 3, -7.891535, 0, -0.5, 0.5, 0.5,
-3.967104, 3, -7.891535, 1, -0.5, 0.5, 0.5,
-3.967104, 3, -7.891535, 1, 1.5, 0.5, 0.5,
-3.967104, 3, -7.891535, 0, 1.5, 0.5, 0.5
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
-3.418016, -3.190099, -6,
-3.418016, -3.190099, 6,
-3.418016, -3.190099, -6,
-3.601045, -3.353868, -6,
-3.418016, -3.190099, -4,
-3.601045, -3.353868, -4,
-3.418016, -3.190099, -2,
-3.601045, -3.353868, -2,
-3.418016, -3.190099, 0,
-3.601045, -3.353868, 0,
-3.418016, -3.190099, 2,
-3.601045, -3.353868, 2,
-3.418016, -3.190099, 4,
-3.601045, -3.353868, 4,
-3.418016, -3.190099, 6,
-3.601045, -3.353868, 6
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
"-6",
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
-3.967104, -3.681406, -6, 0, -0.5, 0.5, 0.5,
-3.967104, -3.681406, -6, 1, -0.5, 0.5, 0.5,
-3.967104, -3.681406, -6, 1, 1.5, 0.5, 0.5,
-3.967104, -3.681406, -6, 0, 1.5, 0.5, 0.5,
-3.967104, -3.681406, -4, 0, -0.5, 0.5, 0.5,
-3.967104, -3.681406, -4, 1, -0.5, 0.5, 0.5,
-3.967104, -3.681406, -4, 1, 1.5, 0.5, 0.5,
-3.967104, -3.681406, -4, 0, 1.5, 0.5, 0.5,
-3.967104, -3.681406, -2, 0, -0.5, 0.5, 0.5,
-3.967104, -3.681406, -2, 1, -0.5, 0.5, 0.5,
-3.967104, -3.681406, -2, 1, 1.5, 0.5, 0.5,
-3.967104, -3.681406, -2, 0, 1.5, 0.5, 0.5,
-3.967104, -3.681406, 0, 0, -0.5, 0.5, 0.5,
-3.967104, -3.681406, 0, 1, -0.5, 0.5, 0.5,
-3.967104, -3.681406, 0, 1, 1.5, 0.5, 0.5,
-3.967104, -3.681406, 0, 0, 1.5, 0.5, 0.5,
-3.967104, -3.681406, 2, 0, -0.5, 0.5, 0.5,
-3.967104, -3.681406, 2, 1, -0.5, 0.5, 0.5,
-3.967104, -3.681406, 2, 1, 1.5, 0.5, 0.5,
-3.967104, -3.681406, 2, 0, 1.5, 0.5, 0.5,
-3.967104, -3.681406, 4, 0, -0.5, 0.5, 0.5,
-3.967104, -3.681406, 4, 1, -0.5, 0.5, 0.5,
-3.967104, -3.681406, 4, 1, 1.5, 0.5, 0.5,
-3.967104, -3.681406, 4, 0, 1.5, 0.5, 0.5,
-3.967104, -3.681406, 6, 0, -0.5, 0.5, 0.5,
-3.967104, -3.681406, 6, 1, -0.5, 0.5, 0.5,
-3.967104, -3.681406, 6, 1, 1.5, 0.5, 0.5,
-3.967104, -3.681406, 6, 0, 1.5, 0.5, 0.5
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
-3.418016, -3.190099, -6.888201,
-3.418016, 3.360662, -6.888201,
-3.418016, -3.190099, 6.489583,
-3.418016, 3.360662, 6.489583,
-3.418016, -3.190099, -6.888201,
-3.418016, -3.190099, 6.489583,
-3.418016, 3.360662, -6.888201,
-3.418016, 3.360662, 6.489583,
-3.418016, -3.190099, -6.888201,
3.903155, -3.190099, -6.888201,
-3.418016, -3.190099, 6.489583,
3.903155, -3.190099, 6.489583,
-3.418016, 3.360662, -6.888201,
3.903155, 3.360662, -6.888201,
-3.418016, 3.360662, 6.489583,
3.903155, 3.360662, 6.489583,
3.903155, -3.190099, -6.888201,
3.903155, 3.360662, -6.888201,
3.903155, -3.190099, 6.489583,
3.903155, 3.360662, 6.489583,
3.903155, -3.190099, -6.888201,
3.903155, -3.190099, 6.489583,
3.903155, 3.360662, -6.888201,
3.903155, 3.360662, 6.489583
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
var radius = 8.862745;
var distance = 39.43135;
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
mvMatrix.translate( -0.2425696, -0.08528161, 0.1993091 );
mvMatrix.scale( 1.308885, 1.462818, 0.716305 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -39.43135);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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


