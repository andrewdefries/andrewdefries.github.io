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
-3.683814, 0.07917292, -1.14049, 1, 0, 0, 1,
-2.801594, 0.9043703, -1.385979, 1, 0.007843138, 0, 1,
-2.796595, 0.7864203, 0.4931737, 1, 0.01176471, 0, 1,
-2.72473, 0.7041215, -1.258636, 1, 0.01960784, 0, 1,
-2.691304, -0.1281124, -0.7200547, 1, 0.02352941, 0, 1,
-2.605417, 0.114341, -0.6651615, 1, 0.03137255, 0, 1,
-2.473895, 0.7002209, -0.6096085, 1, 0.03529412, 0, 1,
-2.435643, -0.8441857, -2.045219, 1, 0.04313726, 0, 1,
-2.355335, 0.4676013, -2.066545, 1, 0.04705882, 0, 1,
-2.258717, 0.4017818, -2.487616, 1, 0.05490196, 0, 1,
-2.177045, -0.07859237, -1.850284, 1, 0.05882353, 0, 1,
-2.174839, 2.431583, -1.949256, 1, 0.06666667, 0, 1,
-2.15298, 1.01991, -1.489857, 1, 0.07058824, 0, 1,
-2.103618, 0.2292987, -2.213266, 1, 0.07843138, 0, 1,
-2.046798, -1.414179, -1.94608, 1, 0.08235294, 0, 1,
-2.032104, -0.6459739, -1.699504, 1, 0.09019608, 0, 1,
-2.028468, -0.8144542, -2.478578, 1, 0.09411765, 0, 1,
-1.973508, -1.223413, -1.354806, 1, 0.1019608, 0, 1,
-1.955646, -1.217756, -1.810698, 1, 0.1098039, 0, 1,
-1.86532, 0.2888944, -0.7279259, 1, 0.1137255, 0, 1,
-1.839368, 1.750502, -0.5115236, 1, 0.1215686, 0, 1,
-1.831674, -1.225692, -2.481218, 1, 0.1254902, 0, 1,
-1.827451, 0.1376478, -0.8660098, 1, 0.1333333, 0, 1,
-1.821569, -0.9716952, -2.875893, 1, 0.1372549, 0, 1,
-1.815415, 0.02973641, -0.6157855, 1, 0.145098, 0, 1,
-1.813607, 1.30975, 0.9070112, 1, 0.1490196, 0, 1,
-1.810744, 0.09740362, -1.067216, 1, 0.1568628, 0, 1,
-1.799292, -0.7428377, -0.8235015, 1, 0.1607843, 0, 1,
-1.786038, -0.2396463, -1.635016, 1, 0.1686275, 0, 1,
-1.752149, -0.3710961, -1.609697, 1, 0.172549, 0, 1,
-1.74407, 0.6875131, -2.678354, 1, 0.1803922, 0, 1,
-1.742105, -0.8927699, -2.708695, 1, 0.1843137, 0, 1,
-1.733101, -1.107263, -1.977384, 1, 0.1921569, 0, 1,
-1.728308, 0.2434602, -1.024055, 1, 0.1960784, 0, 1,
-1.717385, -0.01813749, -0.6932027, 1, 0.2039216, 0, 1,
-1.706236, -1.721906, -1.166149, 1, 0.2117647, 0, 1,
-1.690334, -1.001332, -3.444098, 1, 0.2156863, 0, 1,
-1.687407, 1.328206, -3.180102, 1, 0.2235294, 0, 1,
-1.669001, -1.004537, -2.145472, 1, 0.227451, 0, 1,
-1.668922, -1.178408, -2.96437, 1, 0.2352941, 0, 1,
-1.652293, -1.061681, -1.046151, 1, 0.2392157, 0, 1,
-1.647793, 1.475452, -1.067057, 1, 0.2470588, 0, 1,
-1.640804, 1.98655, 0.141867, 1, 0.2509804, 0, 1,
-1.628428, -1.209795, -2.655241, 1, 0.2588235, 0, 1,
-1.586774, 0.5070968, -2.80682, 1, 0.2627451, 0, 1,
-1.586553, -0.6480694, 0.0624067, 1, 0.2705882, 0, 1,
-1.580611, -0.4847308, -2.0627, 1, 0.2745098, 0, 1,
-1.570969, 0.06544729, -1.745449, 1, 0.282353, 0, 1,
-1.543927, -1.466772, -1.158102, 1, 0.2862745, 0, 1,
-1.541481, -0.2333054, -1.235559, 1, 0.2941177, 0, 1,
-1.537658, -0.5151007, -0.7549878, 1, 0.3019608, 0, 1,
-1.517401, -0.128626, -1.299543, 1, 0.3058824, 0, 1,
-1.512017, -0.6789832, -1.244734, 1, 0.3137255, 0, 1,
-1.503659, 1.008393, -0.168808, 1, 0.3176471, 0, 1,
-1.50049, -0.05272515, -0.6522248, 1, 0.3254902, 0, 1,
-1.477154, -0.6163155, -2.219029, 1, 0.3294118, 0, 1,
-1.46427, -0.2794246, -1.888165, 1, 0.3372549, 0, 1,
-1.460757, -1.031616, -0.6798761, 1, 0.3411765, 0, 1,
-1.457557, -1.774704, -2.045245, 1, 0.3490196, 0, 1,
-1.455565, -1.626242, -3.787688, 1, 0.3529412, 0, 1,
-1.452517, 0.315013, -1.295744, 1, 0.3607843, 0, 1,
-1.448677, 0.7582285, -1.665212, 1, 0.3647059, 0, 1,
-1.444446, -0.2400587, -1.715596, 1, 0.372549, 0, 1,
-1.436735, -1.034518, -3.261771, 1, 0.3764706, 0, 1,
-1.430935, 1.087925, -1.024256, 1, 0.3843137, 0, 1,
-1.419352, 0.8626419, -0.8711303, 1, 0.3882353, 0, 1,
-1.410475, -0.3681577, -3.007815, 1, 0.3960784, 0, 1,
-1.402651, -0.5858568, -0.8735411, 1, 0.4039216, 0, 1,
-1.39266, 0.422263, -1.673124, 1, 0.4078431, 0, 1,
-1.380409, -0.3609604, -1.28123, 1, 0.4156863, 0, 1,
-1.380173, -0.1607796, -2.381873, 1, 0.4196078, 0, 1,
-1.371028, -0.489532, -1.261681, 1, 0.427451, 0, 1,
-1.360078, 0.3350357, -1.335361, 1, 0.4313726, 0, 1,
-1.359984, 1.117726, -0.3862711, 1, 0.4392157, 0, 1,
-1.358242, 1.302666, -0.2891499, 1, 0.4431373, 0, 1,
-1.357799, 0.4805059, -2.006129, 1, 0.4509804, 0, 1,
-1.349525, -0.3798115, -1.792526, 1, 0.454902, 0, 1,
-1.345465, 0.3669039, -0.9956087, 1, 0.4627451, 0, 1,
-1.338023, 1.69556, -1.3806, 1, 0.4666667, 0, 1,
-1.337201, 0.8789521, -3.205663, 1, 0.4745098, 0, 1,
-1.331248, -0.4933617, -0.1431823, 1, 0.4784314, 0, 1,
-1.324485, 1.311959, -2.631556, 1, 0.4862745, 0, 1,
-1.322372, -0.1879922, -1.807196, 1, 0.4901961, 0, 1,
-1.319937, -0.2782163, -2.296069, 1, 0.4980392, 0, 1,
-1.316381, -1.386592, -3.350863, 1, 0.5058824, 0, 1,
-1.313059, -0.7143271, -1.439078, 1, 0.509804, 0, 1,
-1.308884, 2.47702, -1.678426, 1, 0.5176471, 0, 1,
-1.308368, 0.3549819, -1.913051, 1, 0.5215687, 0, 1,
-1.296965, -0.1978724, -1.677811, 1, 0.5294118, 0, 1,
-1.29583, 0.824443, -1.491328, 1, 0.5333334, 0, 1,
-1.288404, 1.225771, -1.52423, 1, 0.5411765, 0, 1,
-1.283152, 0.1024827, -2.30924, 1, 0.5450981, 0, 1,
-1.265201, 0.8397383, 0.1018983, 1, 0.5529412, 0, 1,
-1.259663, -1.071032, -2.124965, 1, 0.5568628, 0, 1,
-1.259243, -1.007531, -2.442634, 1, 0.5647059, 0, 1,
-1.259051, -0.3428242, -2.549659, 1, 0.5686275, 0, 1,
-1.258937, 1.164393, -3.065746, 1, 0.5764706, 0, 1,
-1.257724, -0.9022539, -1.349671, 1, 0.5803922, 0, 1,
-1.244038, -0.8317304, -0.3098256, 1, 0.5882353, 0, 1,
-1.233219, -0.1999191, -0.7241754, 1, 0.5921569, 0, 1,
-1.230484, -0.8138813, -2.082228, 1, 0.6, 0, 1,
-1.21773, -1.904363, -3.711589, 1, 0.6078432, 0, 1,
-1.21109, 0.2531554, -1.611691, 1, 0.6117647, 0, 1,
-1.208522, 0.4278497, -1.489978, 1, 0.6196079, 0, 1,
-1.207442, 0.348867, -1.182986, 1, 0.6235294, 0, 1,
-1.197732, -1.590592, -2.762811, 1, 0.6313726, 0, 1,
-1.19653, -2.454273, -3.503171, 1, 0.6352941, 0, 1,
-1.193678, -1.307652, -3.473577, 1, 0.6431373, 0, 1,
-1.193604, 1.480129, 0.2703595, 1, 0.6470588, 0, 1,
-1.19104, -0.1688719, -1.686329, 1, 0.654902, 0, 1,
-1.189758, 1.77484, -0.6152814, 1, 0.6588235, 0, 1,
-1.161401, -0.2579927, -3.004654, 1, 0.6666667, 0, 1,
-1.145362, -0.4319908, -1.479928, 1, 0.6705883, 0, 1,
-1.14069, 0.1285576, -0.2446109, 1, 0.6784314, 0, 1,
-1.129482, 0.9133054, -0.1661679, 1, 0.682353, 0, 1,
-1.125938, 1.095159, -0.7208392, 1, 0.6901961, 0, 1,
-1.122538, -0.4991485, -2.391462, 1, 0.6941177, 0, 1,
-1.120326, -0.3685333, -1.002682, 1, 0.7019608, 0, 1,
-1.115458, 0.05684119, -0.8871037, 1, 0.7098039, 0, 1,
-1.110262, -1.010351, -1.281999, 1, 0.7137255, 0, 1,
-1.10516, 0.3282812, -2.013236, 1, 0.7215686, 0, 1,
-1.103395, -0.3642451, -3.322798, 1, 0.7254902, 0, 1,
-1.099274, 1.304728, 0.04618884, 1, 0.7333333, 0, 1,
-1.092121, 1.320997, -1.572224, 1, 0.7372549, 0, 1,
-1.090163, 1.561261, -2.30644, 1, 0.7450981, 0, 1,
-1.086808, -0.9488886, -2.63664, 1, 0.7490196, 0, 1,
-1.085531, 1.209045, -0.9310936, 1, 0.7568628, 0, 1,
-1.081177, 0.09720217, -0.1163599, 1, 0.7607843, 0, 1,
-1.079572, 2.401629, -0.7736974, 1, 0.7686275, 0, 1,
-1.075232, -1.13122, -3.816385, 1, 0.772549, 0, 1,
-1.073615, 1.939827, -1.376304, 1, 0.7803922, 0, 1,
-1.072529, 0.2558761, -1.244823, 1, 0.7843137, 0, 1,
-1.069909, -0.9756851, -4.075925, 1, 0.7921569, 0, 1,
-1.066548, 0.2838447, -0.7734817, 1, 0.7960784, 0, 1,
-1.064692, -1.230873, -2.055823, 1, 0.8039216, 0, 1,
-1.063629, -0.6675843, -3.235806, 1, 0.8117647, 0, 1,
-1.055593, 0.07609221, -1.808524, 1, 0.8156863, 0, 1,
-1.053624, 0.1452283, -1.416504, 1, 0.8235294, 0, 1,
-1.051465, 2.167404, 0.5078614, 1, 0.827451, 0, 1,
-1.049418, 0.4071915, -2.578531, 1, 0.8352941, 0, 1,
-1.047177, 2.958548, -2.869937, 1, 0.8392157, 0, 1,
-1.045418, -0.1942503, -2.548719, 1, 0.8470588, 0, 1,
-1.040638, 1.327186, 0.1596211, 1, 0.8509804, 0, 1,
-1.036968, -2.131877, -4.040434, 1, 0.8588235, 0, 1,
-1.034735, -0.03548075, -2.024792, 1, 0.8627451, 0, 1,
-1.03226, 1.871648, -2.967139, 1, 0.8705882, 0, 1,
-1.03157, -0.4124882, -0.8293986, 1, 0.8745098, 0, 1,
-1.029408, -0.04275067, -0.6855829, 1, 0.8823529, 0, 1,
-1.022915, 2.009273, -0.7069778, 1, 0.8862745, 0, 1,
-1.019268, -0.7673025, -1.379331, 1, 0.8941177, 0, 1,
-1.013863, -2.192355, -3.368075, 1, 0.8980392, 0, 1,
-1.00973, 0.4236551, -2.687157, 1, 0.9058824, 0, 1,
-0.9954191, 0.8229194, -2.93463, 1, 0.9137255, 0, 1,
-0.9908864, -0.2837822, -0.805865, 1, 0.9176471, 0, 1,
-0.9867584, -1.49984, -3.002823, 1, 0.9254902, 0, 1,
-0.9795092, 0.7076589, -0.8405553, 1, 0.9294118, 0, 1,
-0.9792587, 1.023831, -0.5680851, 1, 0.9372549, 0, 1,
-0.9761015, -0.1339079, -1.222322, 1, 0.9411765, 0, 1,
-0.9759675, 0.0297112, -0.05710891, 1, 0.9490196, 0, 1,
-0.9719723, -1.704222, -2.636134, 1, 0.9529412, 0, 1,
-0.9702496, -0.5130128, -3.815312, 1, 0.9607843, 0, 1,
-0.9642256, 0.7109148, -1.589054, 1, 0.9647059, 0, 1,
-0.9580239, -0.9274439, -1.313168, 1, 0.972549, 0, 1,
-0.9522494, -2.491301, -2.622652, 1, 0.9764706, 0, 1,
-0.9447315, -0.4823668, -2.898901, 1, 0.9843137, 0, 1,
-0.9411977, 0.2079207, -0.1857124, 1, 0.9882353, 0, 1,
-0.9246022, -0.1487937, -1.106334, 1, 0.9960784, 0, 1,
-0.9245462, -1.353192, -2.301143, 0.9960784, 1, 0, 1,
-0.9178452, -1.207279, -0.8620855, 0.9921569, 1, 0, 1,
-0.9166805, 0.9355867, 0.4969062, 0.9843137, 1, 0, 1,
-0.9159146, -0.03700515, -0.1417602, 0.9803922, 1, 0, 1,
-0.9150868, 0.2878539, 1.973883, 0.972549, 1, 0, 1,
-0.9134471, -0.6515459, -3.475534, 0.9686275, 1, 0, 1,
-0.9122372, 0.145136, -0.5968006, 0.9607843, 1, 0, 1,
-0.9048463, 0.7671974, -2.544499, 0.9568627, 1, 0, 1,
-0.9033857, 0.3723097, -2.093529, 0.9490196, 1, 0, 1,
-0.9032855, 0.1317922, -0.3106887, 0.945098, 1, 0, 1,
-0.8949434, 1.230766, 0.2328228, 0.9372549, 1, 0, 1,
-0.8929828, 0.04161881, -2.081679, 0.9333333, 1, 0, 1,
-0.892969, -0.8850654, -3.230947, 0.9254902, 1, 0, 1,
-0.8829399, 0.1847847, -0.508936, 0.9215686, 1, 0, 1,
-0.8732489, -0.9784536, -2.626491, 0.9137255, 1, 0, 1,
-0.8729353, 0.2108975, -0.3264735, 0.9098039, 1, 0, 1,
-0.8611637, 1.048585, -2.387583, 0.9019608, 1, 0, 1,
-0.8583023, 2.096017, 0.5981168, 0.8941177, 1, 0, 1,
-0.8533933, -0.1714635, -2.023482, 0.8901961, 1, 0, 1,
-0.8524182, -0.06035814, -3.882241, 0.8823529, 1, 0, 1,
-0.8392575, -0.4664437, -2.176356, 0.8784314, 1, 0, 1,
-0.8383456, -1.330855, -4.787876, 0.8705882, 1, 0, 1,
-0.8292536, 0.07161149, 0.7692292, 0.8666667, 1, 0, 1,
-0.824601, -0.8783223, -2.226431, 0.8588235, 1, 0, 1,
-0.8216159, 0.8987225, -0.03242188, 0.854902, 1, 0, 1,
-0.8215289, -1.233212, -2.568077, 0.8470588, 1, 0, 1,
-0.8206235, -0.2913651, -2.645225, 0.8431373, 1, 0, 1,
-0.8194071, 1.469966, -0.11442, 0.8352941, 1, 0, 1,
-0.8165128, -1.759078, -2.518932, 0.8313726, 1, 0, 1,
-0.8126851, 0.9533615, -1.306992, 0.8235294, 1, 0, 1,
-0.8123481, 0.796865, -0.7545712, 0.8196079, 1, 0, 1,
-0.8021738, -1.176796, -1.111598, 0.8117647, 1, 0, 1,
-0.8020625, -0.006122165, -2.834374, 0.8078431, 1, 0, 1,
-0.8009464, 1.471111, -1.407809, 0.8, 1, 0, 1,
-0.7914556, 2.879626, 0.0123531, 0.7921569, 1, 0, 1,
-0.7826961, 1.08526, -0.8590024, 0.7882353, 1, 0, 1,
-0.7821564, -1.950038, -1.570817, 0.7803922, 1, 0, 1,
-0.7746104, -0.5630521, -1.17588, 0.7764706, 1, 0, 1,
-0.770129, -1.136354, -1.071209, 0.7686275, 1, 0, 1,
-0.7689444, 0.4986799, -1.175746, 0.7647059, 1, 0, 1,
-0.7639954, 0.6330996, -1.165892, 0.7568628, 1, 0, 1,
-0.7597733, -0.6358873, -1.112649, 0.7529412, 1, 0, 1,
-0.7593262, -0.9801069, -3.215077, 0.7450981, 1, 0, 1,
-0.7582802, 0.30411, -1.140879, 0.7411765, 1, 0, 1,
-0.7562481, 1.179932, -1.399169, 0.7333333, 1, 0, 1,
-0.7561248, 1.704156, -1.471001, 0.7294118, 1, 0, 1,
-0.7556459, 0.7963364, -0.786727, 0.7215686, 1, 0, 1,
-0.7521401, 0.02811993, 0.1574968, 0.7176471, 1, 0, 1,
-0.746103, -0.2963647, -2.449576, 0.7098039, 1, 0, 1,
-0.7436143, 1.306958, -2.307214, 0.7058824, 1, 0, 1,
-0.7434661, 1.152806, -0.7487108, 0.6980392, 1, 0, 1,
-0.7433457, 1.300631, -1.76074, 0.6901961, 1, 0, 1,
-0.7431804, 0.7461793, -0.2206712, 0.6862745, 1, 0, 1,
-0.7420346, -0.1804438, -1.621035, 0.6784314, 1, 0, 1,
-0.7416735, 0.08832025, -1.175344, 0.6745098, 1, 0, 1,
-0.7391227, 1.007697, 1.809326, 0.6666667, 1, 0, 1,
-0.7331468, -0.1265967, -2.436497, 0.6627451, 1, 0, 1,
-0.7280095, -2.417187, -4.859045, 0.654902, 1, 0, 1,
-0.725123, -0.4891016, -1.895283, 0.6509804, 1, 0, 1,
-0.7241205, -1.017554, -1.242468, 0.6431373, 1, 0, 1,
-0.7197053, 0.9099911, -1.103047, 0.6392157, 1, 0, 1,
-0.7172794, -0.2377496, -2.446516, 0.6313726, 1, 0, 1,
-0.71136, -1.43094, -1.701242, 0.627451, 1, 0, 1,
-0.7109818, 1.503551, -0.4042364, 0.6196079, 1, 0, 1,
-0.7074946, -1.09743, -0.1463017, 0.6156863, 1, 0, 1,
-0.7051818, 0.2798048, -2.202514, 0.6078432, 1, 0, 1,
-0.7032866, 0.2784803, -2.94226, 0.6039216, 1, 0, 1,
-0.6989645, 0.9186298, 0.6815577, 0.5960785, 1, 0, 1,
-0.6962745, 1.27461, 0.1934059, 0.5882353, 1, 0, 1,
-0.6921699, 0.7345207, -0.9940111, 0.5843138, 1, 0, 1,
-0.6901907, -0.1212236, -0.8678778, 0.5764706, 1, 0, 1,
-0.687907, 0.7836011, -0.4472831, 0.572549, 1, 0, 1,
-0.687033, 0.9407653, -0.1005811, 0.5647059, 1, 0, 1,
-0.6858077, -1.794702, -2.017443, 0.5607843, 1, 0, 1,
-0.6752764, 1.256947, -0.03964105, 0.5529412, 1, 0, 1,
-0.6725811, 0.5045078, -1.109012, 0.5490196, 1, 0, 1,
-0.6665179, -0.1364663, -2.122006, 0.5411765, 1, 0, 1,
-0.6582515, -1.240553, -3.008535, 0.5372549, 1, 0, 1,
-0.657281, -0.2486713, -1.814064, 0.5294118, 1, 0, 1,
-0.6525363, 0.7787694, -1.016048, 0.5254902, 1, 0, 1,
-0.6515066, 0.352188, 0.2588894, 0.5176471, 1, 0, 1,
-0.6493298, -0.4162547, -4.398118, 0.5137255, 1, 0, 1,
-0.6447248, -1.106771, -1.650307, 0.5058824, 1, 0, 1,
-0.6403957, 0.02976335, -1.276845, 0.5019608, 1, 0, 1,
-0.6402307, 1.080383, -0.508155, 0.4941176, 1, 0, 1,
-0.6287448, 1.557508, 0.1597781, 0.4862745, 1, 0, 1,
-0.6256286, -0.9659917, -3.863499, 0.4823529, 1, 0, 1,
-0.622435, 2.064669, 0.406907, 0.4745098, 1, 0, 1,
-0.6187823, 0.8772831, -0.4636164, 0.4705882, 1, 0, 1,
-0.6113971, 0.4941725, -1.014582, 0.4627451, 1, 0, 1,
-0.6090827, 0.3988992, 0.01667683, 0.4588235, 1, 0, 1,
-0.6084529, -0.9052101, -1.234282, 0.4509804, 1, 0, 1,
-0.6071035, -0.1593364, -1.504503, 0.4470588, 1, 0, 1,
-0.6040388, -0.6930277, -2.197762, 0.4392157, 1, 0, 1,
-0.5951599, -1.003195, -4.106042, 0.4352941, 1, 0, 1,
-0.5927873, 1.068532, 1.379523, 0.427451, 1, 0, 1,
-0.5922852, -1.059196, -2.542312, 0.4235294, 1, 0, 1,
-0.5913509, 0.2621493, -0.7863511, 0.4156863, 1, 0, 1,
-0.5884907, -1.70111, -1.961393, 0.4117647, 1, 0, 1,
-0.5852376, 0.5612735, -0.9309263, 0.4039216, 1, 0, 1,
-0.5758801, 0.4654623, -0.7956846, 0.3960784, 1, 0, 1,
-0.5741578, 0.08749492, -1.971961, 0.3921569, 1, 0, 1,
-0.5672984, -0.5132014, -2.365488, 0.3843137, 1, 0, 1,
-0.5639989, 0.3975159, -0.9749032, 0.3803922, 1, 0, 1,
-0.5631686, -0.3320122, -0.6113815, 0.372549, 1, 0, 1,
-0.5629169, -1.611571, -3.216602, 0.3686275, 1, 0, 1,
-0.5590255, -0.1699233, -1.797836, 0.3607843, 1, 0, 1,
-0.5556045, 0.2807313, -0.5989431, 0.3568628, 1, 0, 1,
-0.5513741, -0.2669364, -2.396703, 0.3490196, 1, 0, 1,
-0.5493652, 0.2725229, -1.114882, 0.345098, 1, 0, 1,
-0.5468703, -0.1862681, -3.141266, 0.3372549, 1, 0, 1,
-0.5452054, -2.465446, -2.207254, 0.3333333, 1, 0, 1,
-0.5432796, -2.051257, -3.942977, 0.3254902, 1, 0, 1,
-0.5398022, 0.6068393, -2.569778, 0.3215686, 1, 0, 1,
-0.5386354, -0.5767253, -1.413743, 0.3137255, 1, 0, 1,
-0.5297861, -0.4576219, -1.45524, 0.3098039, 1, 0, 1,
-0.5271092, -0.9045289, -1.331483, 0.3019608, 1, 0, 1,
-0.5261046, -0.4727913, -3.500386, 0.2941177, 1, 0, 1,
-0.5241739, 0.3305168, 0.6911134, 0.2901961, 1, 0, 1,
-0.5230691, -0.9551709, -2.815873, 0.282353, 1, 0, 1,
-0.5218518, 0.7842237, -0.5324194, 0.2784314, 1, 0, 1,
-0.513887, 0.2440211, -1.23074, 0.2705882, 1, 0, 1,
-0.5130202, -0.6874249, -1.860902, 0.2666667, 1, 0, 1,
-0.5119012, 0.630259, -1.519537, 0.2588235, 1, 0, 1,
-0.5096003, 1.399684, -0.7157347, 0.254902, 1, 0, 1,
-0.5079218, -0.9377505, -3.905232, 0.2470588, 1, 0, 1,
-0.5024326, -0.5462939, -2.258074, 0.2431373, 1, 0, 1,
-0.5013632, 0.4555159, -0.5844066, 0.2352941, 1, 0, 1,
-0.495827, 1.038685, -1.287861, 0.2313726, 1, 0, 1,
-0.4912338, -0.8152296, -1.772324, 0.2235294, 1, 0, 1,
-0.4877332, -0.4120191, -2.777302, 0.2196078, 1, 0, 1,
-0.4847471, -0.7065332, -3.200626, 0.2117647, 1, 0, 1,
-0.4846201, -0.3103198, -2.648536, 0.2078431, 1, 0, 1,
-0.4812877, -1.699193, -3.481898, 0.2, 1, 0, 1,
-0.4791348, 0.3514518, -2.324076, 0.1921569, 1, 0, 1,
-0.476402, -0.05322372, -0.2872848, 0.1882353, 1, 0, 1,
-0.4705724, -0.1240153, -0.5300319, 0.1803922, 1, 0, 1,
-0.4695769, 1.634795, -0.03308975, 0.1764706, 1, 0, 1,
-0.46567, -0.9286129, -3.481288, 0.1686275, 1, 0, 1,
-0.461191, -0.5871961, -3.002762, 0.1647059, 1, 0, 1,
-0.4609198, -2.834043, -2.916659, 0.1568628, 1, 0, 1,
-0.460513, -1.311049, -2.170303, 0.1529412, 1, 0, 1,
-0.4603221, 0.2256456, -0.6226884, 0.145098, 1, 0, 1,
-0.4580642, -0.4661506, -2.434601, 0.1411765, 1, 0, 1,
-0.4469399, 0.3436521, -1.925885, 0.1333333, 1, 0, 1,
-0.4427599, 0.3543524, 0.7949685, 0.1294118, 1, 0, 1,
-0.4408789, 1.31389, -1.131415, 0.1215686, 1, 0, 1,
-0.4373792, 1.037802, -0.7530281, 0.1176471, 1, 0, 1,
-0.431142, 0.9055035, 0.01905833, 0.1098039, 1, 0, 1,
-0.4302742, 0.8040903, -0.2569982, 0.1058824, 1, 0, 1,
-0.4299112, 1.191965, 0.4337424, 0.09803922, 1, 0, 1,
-0.4280198, 0.5626279, -0.583539, 0.09019608, 1, 0, 1,
-0.4268051, -1.843917, -2.740642, 0.08627451, 1, 0, 1,
-0.4245062, -1.596714, -2.463283, 0.07843138, 1, 0, 1,
-0.4235442, 0.6105232, -2.107464, 0.07450981, 1, 0, 1,
-0.4234808, -0.3916892, -1.07294, 0.06666667, 1, 0, 1,
-0.4227556, 1.417547, 0.5318936, 0.0627451, 1, 0, 1,
-0.411121, -0.730107, -3.73132, 0.05490196, 1, 0, 1,
-0.4062189, -0.3304304, -1.397819, 0.05098039, 1, 0, 1,
-0.4059284, -1.469916, -2.848346, 0.04313726, 1, 0, 1,
-0.4057875, -0.3986986, -3.355756, 0.03921569, 1, 0, 1,
-0.4052219, -0.3336741, -1.644726, 0.03137255, 1, 0, 1,
-0.4004994, -0.006781156, -0.5870119, 0.02745098, 1, 0, 1,
-0.3987071, -0.5292087, -2.345438, 0.01960784, 1, 0, 1,
-0.396453, -1.580354, -1.474828, 0.01568628, 1, 0, 1,
-0.3915043, -0.7109097, -2.88772, 0.007843138, 1, 0, 1,
-0.3835361, -0.6385435, -2.202156, 0.003921569, 1, 0, 1,
-0.3760657, -2.059055, -2.157465, 0, 1, 0.003921569, 1,
-0.372264, -0.3605625, -1.181397, 0, 1, 0.01176471, 1,
-0.3707701, -0.945059, -2.275386, 0, 1, 0.01568628, 1,
-0.3604201, 0.1987473, -0.4597735, 0, 1, 0.02352941, 1,
-0.3603017, 0.2407649, -0.287237, 0, 1, 0.02745098, 1,
-0.3515791, 1.195565, 0.06629489, 0, 1, 0.03529412, 1,
-0.3492811, -0.213458, -3.693503, 0, 1, 0.03921569, 1,
-0.3447725, 1.24473, -0.7627649, 0, 1, 0.04705882, 1,
-0.339483, -1.003402, -3.052107, 0, 1, 0.05098039, 1,
-0.3383683, -0.3359703, -3.866945, 0, 1, 0.05882353, 1,
-0.3372699, -1.09839, -2.365013, 0, 1, 0.0627451, 1,
-0.3260128, -0.3859188, -2.075214, 0, 1, 0.07058824, 1,
-0.3223526, -0.5581492, -3.028661, 0, 1, 0.07450981, 1,
-0.3210688, 0.2613647, 0.4821898, 0, 1, 0.08235294, 1,
-0.3173188, 0.03486943, -2.729148, 0, 1, 0.08627451, 1,
-0.3140319, -1.02375, -1.674986, 0, 1, 0.09411765, 1,
-0.3140056, 0.7719458, -0.3611814, 0, 1, 0.1019608, 1,
-0.3107889, 0.6418374, -0.8994594, 0, 1, 0.1058824, 1,
-0.3063633, 0.8107857, -0.09313924, 0, 1, 0.1137255, 1,
-0.3011954, 0.3162501, -1.032153, 0, 1, 0.1176471, 1,
-0.2939245, -0.5388924, -1.258315, 0, 1, 0.1254902, 1,
-0.293381, 1.647232, -0.4477782, 0, 1, 0.1294118, 1,
-0.2907007, -0.1007706, -2.16677, 0, 1, 0.1372549, 1,
-0.2897794, 1.325716, 0.3396867, 0, 1, 0.1411765, 1,
-0.2863069, -0.3516347, -0.6878898, 0, 1, 0.1490196, 1,
-0.2862012, 2.548802, 0.05648686, 0, 1, 0.1529412, 1,
-0.283727, 1.355465, -0.6826443, 0, 1, 0.1607843, 1,
-0.2777785, 1.118208, -1.726689, 0, 1, 0.1647059, 1,
-0.2745468, 0.9960944, 0.6560544, 0, 1, 0.172549, 1,
-0.2728248, -0.7693239, -4.543623, 0, 1, 0.1764706, 1,
-0.2714037, 1.370193, -1.531827, 0, 1, 0.1843137, 1,
-0.2712307, -1.319522, -3.353878, 0, 1, 0.1882353, 1,
-0.2708039, 0.6087429, -0.476006, 0, 1, 0.1960784, 1,
-0.2636416, -0.2405156, -4.209323, 0, 1, 0.2039216, 1,
-0.2631245, -0.2358544, -2.529291, 0, 1, 0.2078431, 1,
-0.2595827, 0.3894461, 0.178687, 0, 1, 0.2156863, 1,
-0.2571446, -0.04866326, -1.428328, 0, 1, 0.2196078, 1,
-0.2546562, -0.5072598, -2.550951, 0, 1, 0.227451, 1,
-0.2531629, 0.02344437, -3.222537, 0, 1, 0.2313726, 1,
-0.25001, -0.3772328, -4.177022, 0, 1, 0.2392157, 1,
-0.2490324, 0.9153234, -0.743639, 0, 1, 0.2431373, 1,
-0.2464099, -0.20494, -4.654197, 0, 1, 0.2509804, 1,
-0.2457412, 0.6237072, -1.594406, 0, 1, 0.254902, 1,
-0.2399782, -0.8717716, -3.556785, 0, 1, 0.2627451, 1,
-0.2368118, 0.02709104, 0.4692922, 0, 1, 0.2666667, 1,
-0.2363, -1.194714, -0.858496, 0, 1, 0.2745098, 1,
-0.2355171, -1.616249, -3.035884, 0, 1, 0.2784314, 1,
-0.2322786, -0.01117155, -0.6207384, 0, 1, 0.2862745, 1,
-0.2304136, -0.320904, -0.3400488, 0, 1, 0.2901961, 1,
-0.2263907, -0.8512246, -2.05053, 0, 1, 0.2980392, 1,
-0.2222863, 0.1380548, -2.078147, 0, 1, 0.3058824, 1,
-0.219585, 1.154145, 1.462156, 0, 1, 0.3098039, 1,
-0.2187412, 0.8861641, -0.2891428, 0, 1, 0.3176471, 1,
-0.2174281, 0.9944381, -0.2400847, 0, 1, 0.3215686, 1,
-0.2157265, -1.294653, -3.040462, 0, 1, 0.3294118, 1,
-0.210313, -0.8487249, -2.881177, 0, 1, 0.3333333, 1,
-0.2084297, 0.276477, -2.576151, 0, 1, 0.3411765, 1,
-0.2075029, 0.7054146, -0.7233954, 0, 1, 0.345098, 1,
-0.2048848, -1.831161, -3.917254, 0, 1, 0.3529412, 1,
-0.2043542, -0.01336036, -2.836065, 0, 1, 0.3568628, 1,
-0.2037237, -0.063447, -3.89829, 0, 1, 0.3647059, 1,
-0.1951823, -0.1493747, -2.331613, 0, 1, 0.3686275, 1,
-0.1928191, 1.733241, 0.3435878, 0, 1, 0.3764706, 1,
-0.1920496, 0.4668819, -0.1890738, 0, 1, 0.3803922, 1,
-0.1915489, -0.407515, -2.348005, 0, 1, 0.3882353, 1,
-0.1903098, -1.826405, -3.218256, 0, 1, 0.3921569, 1,
-0.1898155, 1.357332, 0.06513502, 0, 1, 0.4, 1,
-0.1897092, -0.1197101, -2.77265, 0, 1, 0.4078431, 1,
-0.1821923, 0.09011611, -0.2072798, 0, 1, 0.4117647, 1,
-0.1801862, -0.9099663, -2.460859, 0, 1, 0.4196078, 1,
-0.179558, -0.7240339, -3.502814, 0, 1, 0.4235294, 1,
-0.1793407, -1.144016, -3.298229, 0, 1, 0.4313726, 1,
-0.1791243, 1.402128, -0.5949865, 0, 1, 0.4352941, 1,
-0.1786414, -1.444486, -2.239578, 0, 1, 0.4431373, 1,
-0.1764426, -0.4104171, -2.001356, 0, 1, 0.4470588, 1,
-0.1698629, -0.5236217, -3.326984, 0, 1, 0.454902, 1,
-0.1693982, 1.626418, 0.8336359, 0, 1, 0.4588235, 1,
-0.1686366, 0.2264835, -1.116819, 0, 1, 0.4666667, 1,
-0.168294, -0.1367734, -3.308321, 0, 1, 0.4705882, 1,
-0.1669482, -0.1925463, -0.5720795, 0, 1, 0.4784314, 1,
-0.165479, 0.925812, 0.4731104, 0, 1, 0.4823529, 1,
-0.1629122, -0.01522779, -1.482091, 0, 1, 0.4901961, 1,
-0.1583558, -1.376722, -4.248263, 0, 1, 0.4941176, 1,
-0.1543835, 0.3165932, 0.8856188, 0, 1, 0.5019608, 1,
-0.1540134, -0.7284948, -1.855581, 0, 1, 0.509804, 1,
-0.1516966, 0.5327739, -0.06352822, 0, 1, 0.5137255, 1,
-0.1507914, 1.42972, 0.3166248, 0, 1, 0.5215687, 1,
-0.1494726, 2.795739, 0.02081178, 0, 1, 0.5254902, 1,
-0.1439892, 0.8050719, 0.004149095, 0, 1, 0.5333334, 1,
-0.1436242, 0.002935193, -1.272286, 0, 1, 0.5372549, 1,
-0.1332618, -0.2899282, -1.720071, 0, 1, 0.5450981, 1,
-0.1330375, 0.3634929, 0.2979168, 0, 1, 0.5490196, 1,
-0.132719, 0.1493188, -0.7132719, 0, 1, 0.5568628, 1,
-0.1323785, -0.6293215, -2.266439, 0, 1, 0.5607843, 1,
-0.1321077, 0.9323756, -1.701119, 0, 1, 0.5686275, 1,
-0.1312678, -0.9106889, -3.430217, 0, 1, 0.572549, 1,
-0.1266085, 2.648067, -0.1051265, 0, 1, 0.5803922, 1,
-0.1243332, -1.03352, -3.05951, 0, 1, 0.5843138, 1,
-0.1240511, 0.26554, 0.8310548, 0, 1, 0.5921569, 1,
-0.1238014, -0.03662458, -2.302112, 0, 1, 0.5960785, 1,
-0.1168165, -0.2133414, -3.697962, 0, 1, 0.6039216, 1,
-0.1156219, 1.316492, 0.07874806, 0, 1, 0.6117647, 1,
-0.1103352, -0.8082298, -3.077867, 0, 1, 0.6156863, 1,
-0.1085175, 0.04409225, 0.05259602, 0, 1, 0.6235294, 1,
-0.105621, 2.051667, 1.916859, 0, 1, 0.627451, 1,
-0.1040641, -1.554459, -3.459881, 0, 1, 0.6352941, 1,
-0.1026247, 1.057577, 0.05720391, 0, 1, 0.6392157, 1,
-0.0951165, -1.960716, -3.224937, 0, 1, 0.6470588, 1,
-0.09505213, -0.6878748, -3.428907, 0, 1, 0.6509804, 1,
-0.09389627, -1.144941, -2.988713, 0, 1, 0.6588235, 1,
-0.09298898, 0.3384123, -1.625592, 0, 1, 0.6627451, 1,
-0.08291239, -0.08706089, -2.74697, 0, 1, 0.6705883, 1,
-0.08290634, -0.1549948, -2.924288, 0, 1, 0.6745098, 1,
-0.08256136, -1.566263, -1.396654, 0, 1, 0.682353, 1,
-0.08040021, -0.06074341, -3.064696, 0, 1, 0.6862745, 1,
-0.07914094, 0.04940994, -1.000129, 0, 1, 0.6941177, 1,
-0.07755606, 0.2934519, 1.398607, 0, 1, 0.7019608, 1,
-0.07421109, 0.10557, -1.478745, 0, 1, 0.7058824, 1,
-0.0741924, -0.7763093, -2.441531, 0, 1, 0.7137255, 1,
-0.07360946, 0.03150902, -1.00016, 0, 1, 0.7176471, 1,
-0.07330997, 0.05754704, -1.583825, 0, 1, 0.7254902, 1,
-0.07249176, -1.390319, -0.8071815, 0, 1, 0.7294118, 1,
-0.07056041, -1.324113, -3.03353, 0, 1, 0.7372549, 1,
-0.07029475, 0.5986609, 0.1823393, 0, 1, 0.7411765, 1,
-0.06882872, -1.287252, -3.91864, 0, 1, 0.7490196, 1,
-0.06754415, -0.45629, -4.087287, 0, 1, 0.7529412, 1,
-0.06318585, 0.4115092, -1.130324, 0, 1, 0.7607843, 1,
-0.06223542, 1.329078, 0.3997599, 0, 1, 0.7647059, 1,
-0.05953379, -0.1782547, -3.624376, 0, 1, 0.772549, 1,
-0.05688412, 0.1078288, 0.4293552, 0, 1, 0.7764706, 1,
-0.05495759, -0.4049567, -3.674686, 0, 1, 0.7843137, 1,
-0.05321478, 0.5244133, -1.543234, 0, 1, 0.7882353, 1,
-0.05265603, -0.1997949, -3.479844, 0, 1, 0.7960784, 1,
-0.05040822, -1.295493, -3.604192, 0, 1, 0.8039216, 1,
-0.05025353, -0.6693705, -1.530286, 0, 1, 0.8078431, 1,
-0.0495965, -1.824006, -3.89539, 0, 1, 0.8156863, 1,
-0.049434, -2.063735, -4.337543, 0, 1, 0.8196079, 1,
-0.04901206, -0.9282297, -3.1943, 0, 1, 0.827451, 1,
-0.04658695, -0.7191752, -4.818331, 0, 1, 0.8313726, 1,
-0.04649256, -0.103394, -2.617962, 0, 1, 0.8392157, 1,
-0.04632454, 0.9265848, 0.738459, 0, 1, 0.8431373, 1,
-0.04553362, -1.100604, -1.924267, 0, 1, 0.8509804, 1,
-0.04388799, -2.186878, -3.035126, 0, 1, 0.854902, 1,
-0.04378423, -0.7949194, -2.328393, 0, 1, 0.8627451, 1,
-0.04034781, -0.2753954, -2.762837, 0, 1, 0.8666667, 1,
-0.03080105, -0.4399468, -5.456961, 0, 1, 0.8745098, 1,
-0.02956896, 0.7524291, 0.1564529, 0, 1, 0.8784314, 1,
-0.02919233, -2.527872, -2.192539, 0, 1, 0.8862745, 1,
-0.02881065, 0.06193179, 0.5721152, 0, 1, 0.8901961, 1,
-0.0273319, 0.3905576, 0.6366189, 0, 1, 0.8980392, 1,
-0.01956964, -0.5920922, -3.819431, 0, 1, 0.9058824, 1,
-0.01900683, 0.53686, 0.9747135, 0, 1, 0.9098039, 1,
-0.01610931, -0.2239164, -1.786412, 0, 1, 0.9176471, 1,
0.002528402, -2.082557, 1.939975, 0, 1, 0.9215686, 1,
0.006371372, 0.287498, -0.1761017, 0, 1, 0.9294118, 1,
0.007510343, -1.004033, 3.866002, 0, 1, 0.9333333, 1,
0.009442857, -2.246272, 3.293733, 0, 1, 0.9411765, 1,
0.01502787, -0.5131533, 3.180289, 0, 1, 0.945098, 1,
0.01815556, -0.7781696, 2.59486, 0, 1, 0.9529412, 1,
0.02291868, -0.4097836, 3.458543, 0, 1, 0.9568627, 1,
0.024021, 1.825974, -0.28021, 0, 1, 0.9647059, 1,
0.02731079, -1.654475, 2.584664, 0, 1, 0.9686275, 1,
0.02953095, -0.3602308, 1.790843, 0, 1, 0.9764706, 1,
0.02969821, 0.5889412, -0.9912376, 0, 1, 0.9803922, 1,
0.03036317, 1.922029, 0.1269784, 0, 1, 0.9882353, 1,
0.03047786, -0.299877, 2.588941, 0, 1, 0.9921569, 1,
0.03117279, 0.7933369, -0.2510084, 0, 1, 1, 1,
0.03224504, 0.2887516, 0.401626, 0, 0.9921569, 1, 1,
0.03332829, -0.5199174, 3.471113, 0, 0.9882353, 1, 1,
0.03488776, -0.7084186, 1.860165, 0, 0.9803922, 1, 1,
0.03582158, -0.4325957, 3.135324, 0, 0.9764706, 1, 1,
0.04556639, 0.9044715, 1.604906, 0, 0.9686275, 1, 1,
0.04710196, -0.2513716, 0.8366277, 0, 0.9647059, 1, 1,
0.04808703, -0.9658337, 3.358041, 0, 0.9568627, 1, 1,
0.0506591, 0.7316729, -0.1562147, 0, 0.9529412, 1, 1,
0.05260704, 1.076668, -1.735279, 0, 0.945098, 1, 1,
0.06105113, 1.053425, 1.292576, 0, 0.9411765, 1, 1,
0.06300079, 2.130327, -0.2381436, 0, 0.9333333, 1, 1,
0.06323531, -0.04334539, 0.8554476, 0, 0.9294118, 1, 1,
0.06361905, 0.02687776, 2.287618, 0, 0.9215686, 1, 1,
0.06374083, -0.09337442, 2.304116, 0, 0.9176471, 1, 1,
0.06546667, 0.7196426, 0.06758681, 0, 0.9098039, 1, 1,
0.06616378, 0.7615412, -1.504392, 0, 0.9058824, 1, 1,
0.07048727, 0.299325, 1.191549, 0, 0.8980392, 1, 1,
0.07828894, -0.08926548, 2.662453, 0, 0.8901961, 1, 1,
0.0824635, -0.05559022, 0.8094139, 0, 0.8862745, 1, 1,
0.08272087, 0.9579396, 0.2683217, 0, 0.8784314, 1, 1,
0.0832654, 0.005204516, 1.885892, 0, 0.8745098, 1, 1,
0.08788813, 0.03896141, 0.4880332, 0, 0.8666667, 1, 1,
0.08895035, 0.05516497, 0.8481169, 0, 0.8627451, 1, 1,
0.09096728, 1.271388, -1.64133, 0, 0.854902, 1, 1,
0.09199058, -0.9507399, 2.270573, 0, 0.8509804, 1, 1,
0.09257979, -1.769867, 2.676646, 0, 0.8431373, 1, 1,
0.0967705, -0.227928, 3.916046, 0, 0.8392157, 1, 1,
0.1030185, 1.304964, 0.9700279, 0, 0.8313726, 1, 1,
0.1055733, -0.9590085, 2.693656, 0, 0.827451, 1, 1,
0.1056034, -1.082555, 3.570319, 0, 0.8196079, 1, 1,
0.1109698, 1.814153, -0.1476768, 0, 0.8156863, 1, 1,
0.1168229, 0.4456391, 0.5702698, 0, 0.8078431, 1, 1,
0.1181963, 0.5165455, 0.6011111, 0, 0.8039216, 1, 1,
0.1188447, 1.975598, 0.5065812, 0, 0.7960784, 1, 1,
0.1233177, 0.7918757, -1.338738, 0, 0.7882353, 1, 1,
0.1268259, -1.035077, 4.130147, 0, 0.7843137, 1, 1,
0.1277775, 0.3116961, 0.4569111, 0, 0.7764706, 1, 1,
0.129107, 0.03363752, 2.026779, 0, 0.772549, 1, 1,
0.1299414, -0.4313227, 2.573007, 0, 0.7647059, 1, 1,
0.1301768, 0.1762364, 1.208017, 0, 0.7607843, 1, 1,
0.1355314, 0.3496705, 3.044209, 0, 0.7529412, 1, 1,
0.1394891, -0.7797022, 3.901378, 0, 0.7490196, 1, 1,
0.1413551, 0.8941767, -0.08493836, 0, 0.7411765, 1, 1,
0.1454729, -0.8859406, 3.28035, 0, 0.7372549, 1, 1,
0.1491913, 1.32869, 1.906513, 0, 0.7294118, 1, 1,
0.1491935, -0.07703719, 3.062391, 0, 0.7254902, 1, 1,
0.1569527, -0.02169154, 1.014321, 0, 0.7176471, 1, 1,
0.159565, -1.406078, 3.463732, 0, 0.7137255, 1, 1,
0.1636065, 0.6280709, 1.262369, 0, 0.7058824, 1, 1,
0.1684426, -1.096132, 3.223899, 0, 0.6980392, 1, 1,
0.1690761, 1.063434, 0.2143279, 0, 0.6941177, 1, 1,
0.1699301, 1.050376, -0.7203126, 0, 0.6862745, 1, 1,
0.1726983, -0.6114116, 3.39343, 0, 0.682353, 1, 1,
0.1756221, -1.022915, 3.636646, 0, 0.6745098, 1, 1,
0.1782099, 1.898128, 1.351599, 0, 0.6705883, 1, 1,
0.182595, 0.9623118, 0.04730074, 0, 0.6627451, 1, 1,
0.1842188, 1.849839, -0.9155813, 0, 0.6588235, 1, 1,
0.1898175, 1.036512, -1.5718, 0, 0.6509804, 1, 1,
0.1936522, -0.4848383, 2.745826, 0, 0.6470588, 1, 1,
0.1968742, -0.196549, 3.357381, 0, 0.6392157, 1, 1,
0.2020342, 1.733346, 0.879854, 0, 0.6352941, 1, 1,
0.2031617, 2.468725, 1.341108, 0, 0.627451, 1, 1,
0.2041941, -0.03700462, 2.413415, 0, 0.6235294, 1, 1,
0.2051288, -0.2829591, 3.647439, 0, 0.6156863, 1, 1,
0.2081141, 1.499272, -1.490874, 0, 0.6117647, 1, 1,
0.2093772, -0.3887432, 2.201113, 0, 0.6039216, 1, 1,
0.2098209, 1.188324, 1.360162, 0, 0.5960785, 1, 1,
0.2102153, -1.901003, 3.836827, 0, 0.5921569, 1, 1,
0.2124873, -0.07789133, -0.4352648, 0, 0.5843138, 1, 1,
0.2129073, -2.331785, 3.796868, 0, 0.5803922, 1, 1,
0.2131996, -0.3102798, 2.325227, 0, 0.572549, 1, 1,
0.2223853, -1.396382, 2.670173, 0, 0.5686275, 1, 1,
0.2268697, -1.074086, 1.751792, 0, 0.5607843, 1, 1,
0.2376052, 0.2691064, 1.864475, 0, 0.5568628, 1, 1,
0.2394603, -0.8063354, 1.305992, 0, 0.5490196, 1, 1,
0.2404831, 0.6451744, 1.67768, 0, 0.5450981, 1, 1,
0.2406414, -0.09532669, 2.050166, 0, 0.5372549, 1, 1,
0.2465126, 0.0521776, 1.837086, 0, 0.5333334, 1, 1,
0.249298, -1.47255, 2.263757, 0, 0.5254902, 1, 1,
0.2500063, 0.0258665, 1.655454, 0, 0.5215687, 1, 1,
0.2514511, 0.6828157, 0.3187249, 0, 0.5137255, 1, 1,
0.2533292, -0.3710043, 1.968375, 0, 0.509804, 1, 1,
0.2564023, 0.4181023, 0.1638464, 0, 0.5019608, 1, 1,
0.2591921, 1.718336, 0.2706289, 0, 0.4941176, 1, 1,
0.2621268, 0.8682389, 1.46944, 0, 0.4901961, 1, 1,
0.2649729, -0.3551427, 1.231269, 0, 0.4823529, 1, 1,
0.2674008, -1.281801, 3.009931, 0, 0.4784314, 1, 1,
0.2695316, -0.3728882, 2.905878, 0, 0.4705882, 1, 1,
0.2702071, 0.4062853, -0.5377183, 0, 0.4666667, 1, 1,
0.2737115, -0.4832746, 3.21238, 0, 0.4588235, 1, 1,
0.2762761, -0.0676436, -0.161246, 0, 0.454902, 1, 1,
0.281433, 0.7783049, 1.479443, 0, 0.4470588, 1, 1,
0.2863996, -1.292014, 1.910647, 0, 0.4431373, 1, 1,
0.2879437, 0.08457441, 0.7893709, 0, 0.4352941, 1, 1,
0.2950139, 0.1180419, 0.3186221, 0, 0.4313726, 1, 1,
0.2956395, 0.5829434, -0.03605674, 0, 0.4235294, 1, 1,
0.297278, -1.483628, 5.137584, 0, 0.4196078, 1, 1,
0.3017473, -0.3562848, 1.407476, 0, 0.4117647, 1, 1,
0.3077132, 1.636992, 0.4748614, 0, 0.4078431, 1, 1,
0.307864, 0.717134, 2.704206, 0, 0.4, 1, 1,
0.3084294, -2.352981, 2.435565, 0, 0.3921569, 1, 1,
0.3091868, -0.448661, 4.416523, 0, 0.3882353, 1, 1,
0.31021, 1.444024, -0.7018757, 0, 0.3803922, 1, 1,
0.3136529, 1.001282, -0.5767862, 0, 0.3764706, 1, 1,
0.3174741, -0.7921622, 2.171179, 0, 0.3686275, 1, 1,
0.3197098, 0.05197803, 0.3821227, 0, 0.3647059, 1, 1,
0.321295, 0.3633843, 0.179076, 0, 0.3568628, 1, 1,
0.3216053, 1.376511, -0.8143213, 0, 0.3529412, 1, 1,
0.3224172, -0.2270588, 2.387711, 0, 0.345098, 1, 1,
0.3227541, 1.877445, 1.759385, 0, 0.3411765, 1, 1,
0.3261609, -0.6560706, 2.423648, 0, 0.3333333, 1, 1,
0.3342887, -1.20154, 1.6482, 0, 0.3294118, 1, 1,
0.3369599, 0.1101085, 1.8806, 0, 0.3215686, 1, 1,
0.3394446, -0.1450824, 1.596898, 0, 0.3176471, 1, 1,
0.3439931, 1.46694, 1.359937, 0, 0.3098039, 1, 1,
0.3453759, 1.747873, 0.8878018, 0, 0.3058824, 1, 1,
0.3481157, -0.9391968, 2.161743, 0, 0.2980392, 1, 1,
0.349685, 0.8977108, -0.5058802, 0, 0.2901961, 1, 1,
0.3531398, -1.371343, 2.794458, 0, 0.2862745, 1, 1,
0.3532967, -2.294381, 3.352946, 0, 0.2784314, 1, 1,
0.3538248, -2.324776, 4.105546, 0, 0.2745098, 1, 1,
0.3546332, -0.4958678, 1.754859, 0, 0.2666667, 1, 1,
0.362105, -1.145743, 2.390373, 0, 0.2627451, 1, 1,
0.3637906, -0.5189164, 1.029903, 0, 0.254902, 1, 1,
0.3682455, 0.7943695, -0.3896737, 0, 0.2509804, 1, 1,
0.3742807, -1.405164, 4.377865, 0, 0.2431373, 1, 1,
0.3780578, -0.7507005, 2.415134, 0, 0.2392157, 1, 1,
0.3818337, -0.5921375, 3.092482, 0, 0.2313726, 1, 1,
0.382507, -1.267934, 2.695581, 0, 0.227451, 1, 1,
0.3827069, 2.467544, 0.5652119, 0, 0.2196078, 1, 1,
0.3854397, -0.8914549, 4.085868, 0, 0.2156863, 1, 1,
0.3881085, -1.498828, 1.171916, 0, 0.2078431, 1, 1,
0.3895937, -2.511145, 2.946635, 0, 0.2039216, 1, 1,
0.3911003, -0.9733632, 3.520032, 0, 0.1960784, 1, 1,
0.3966048, 1.345106, 0.1596894, 0, 0.1882353, 1, 1,
0.4018851, 0.5154319, 1.290489, 0, 0.1843137, 1, 1,
0.4067968, 0.008054818, 3.140067, 0, 0.1764706, 1, 1,
0.4091619, 0.1687663, 0.3521774, 0, 0.172549, 1, 1,
0.4114322, 1.533781, -2.196694, 0, 0.1647059, 1, 1,
0.4121301, 0.99029, 0.596368, 0, 0.1607843, 1, 1,
0.4122863, -1.388637, 3.740548, 0, 0.1529412, 1, 1,
0.4125068, 1.601501, -1.093898, 0, 0.1490196, 1, 1,
0.4150939, -0.2517985, 2.322529, 0, 0.1411765, 1, 1,
0.4175799, 3.443179, -0.3111373, 0, 0.1372549, 1, 1,
0.4181665, 0.4651505, -0.02993209, 0, 0.1294118, 1, 1,
0.4181702, -0.5991024, 4.385191, 0, 0.1254902, 1, 1,
0.4195906, -1.423006, 1.982462, 0, 0.1176471, 1, 1,
0.4197914, 0.8220986, 0.3133311, 0, 0.1137255, 1, 1,
0.4200141, 0.1821072, 1.953328, 0, 0.1058824, 1, 1,
0.4214104, 0.8361152, 0.3648848, 0, 0.09803922, 1, 1,
0.4231284, -0.762586, 3.311054, 0, 0.09411765, 1, 1,
0.4237719, 0.6821403, -0.6651783, 0, 0.08627451, 1, 1,
0.4253858, -0.9782949, 1.016267, 0, 0.08235294, 1, 1,
0.4282484, 0.7250983, 0.6420513, 0, 0.07450981, 1, 1,
0.4288425, -1.146609, 2.251236, 0, 0.07058824, 1, 1,
0.4316321, 0.08266576, 2.836054, 0, 0.0627451, 1, 1,
0.4331264, 0.9477553, -0.1097384, 0, 0.05882353, 1, 1,
0.435166, 0.4924976, 0.2936802, 0, 0.05098039, 1, 1,
0.4374031, 1.707445, -0.3583945, 0, 0.04705882, 1, 1,
0.4374227, -0.02218723, 1.971647, 0, 0.03921569, 1, 1,
0.4376638, 0.1523266, 2.150453, 0, 0.03529412, 1, 1,
0.4417679, 0.5549313, 0.3548699, 0, 0.02745098, 1, 1,
0.442068, 0.5372499, 1.799899, 0, 0.02352941, 1, 1,
0.4457214, 2.193193, 0.7217892, 0, 0.01568628, 1, 1,
0.4470879, 1.784145, -0.3775442, 0, 0.01176471, 1, 1,
0.4486784, -0.6901616, 2.342973, 0, 0.003921569, 1, 1,
0.4489399, 0.4909742, 0.784388, 0.003921569, 0, 1, 1,
0.4502012, 0.1085502, 2.972777, 0.007843138, 0, 1, 1,
0.45412, 0.7513723, 2.170716, 0.01568628, 0, 1, 1,
0.4556722, -0.8028005, 2.251076, 0.01960784, 0, 1, 1,
0.4613257, -0.8321348, 3.969925, 0.02745098, 0, 1, 1,
0.461623, 0.5072869, 1.808838, 0.03137255, 0, 1, 1,
0.4647468, -0.6205249, 0.369899, 0.03921569, 0, 1, 1,
0.464854, -0.7341448, 2.295032, 0.04313726, 0, 1, 1,
0.4661914, 1.682733, -0.9082377, 0.05098039, 0, 1, 1,
0.4705041, -0.9545478, 2.897167, 0.05490196, 0, 1, 1,
0.4715257, -1.47708, 4.608783, 0.0627451, 0, 1, 1,
0.4740271, -0.246248, 2.319623, 0.06666667, 0, 1, 1,
0.4744428, 1.164759, 0.9212518, 0.07450981, 0, 1, 1,
0.4761219, 1.320193, -0.9100834, 0.07843138, 0, 1, 1,
0.4766772, -0.5864868, 1.626881, 0.08627451, 0, 1, 1,
0.4779398, 0.6983852, -1.287603, 0.09019608, 0, 1, 1,
0.4798865, 0.9364471, 1.05921, 0.09803922, 0, 1, 1,
0.4799598, -0.7785013, 4.312328, 0.1058824, 0, 1, 1,
0.4813569, -0.6866246, 3.334461, 0.1098039, 0, 1, 1,
0.481528, 0.5900803, 2.063362, 0.1176471, 0, 1, 1,
0.4872478, -1.163161, 2.704626, 0.1215686, 0, 1, 1,
0.4891084, -1.017333, 2.607517, 0.1294118, 0, 1, 1,
0.4908248, -0.2474774, 2.355456, 0.1333333, 0, 1, 1,
0.4970698, 0.7309574, 1.092896, 0.1411765, 0, 1, 1,
0.502982, 1.251943, 0.3911139, 0.145098, 0, 1, 1,
0.5104552, 0.8789426, -0.9327936, 0.1529412, 0, 1, 1,
0.5193226, 0.658325, -0.01531056, 0.1568628, 0, 1, 1,
0.5219862, 1.26838, 0.1873915, 0.1647059, 0, 1, 1,
0.5238018, -0.2740841, 1.781953, 0.1686275, 0, 1, 1,
0.5241606, 1.243864, 0.8941917, 0.1764706, 0, 1, 1,
0.5295107, 0.7408393, -1.18203, 0.1803922, 0, 1, 1,
0.5336788, 0.8924215, 1.515084, 0.1882353, 0, 1, 1,
0.534214, -1.10911, 2.870387, 0.1921569, 0, 1, 1,
0.5361219, -0.6931197, 2.761469, 0.2, 0, 1, 1,
0.5418237, -1.85344, 2.073266, 0.2078431, 0, 1, 1,
0.5440465, -0.3192993, -0.2591948, 0.2117647, 0, 1, 1,
0.5515633, 0.4763633, 2.774448, 0.2196078, 0, 1, 1,
0.555209, 0.4476824, 0.3996866, 0.2235294, 0, 1, 1,
0.5570872, 0.7470037, 0.3709328, 0.2313726, 0, 1, 1,
0.5574969, -2.11279, 2.816881, 0.2352941, 0, 1, 1,
0.5611164, -0.8576075, 1.254362, 0.2431373, 0, 1, 1,
0.5642794, -0.5677286, 3.747671, 0.2470588, 0, 1, 1,
0.5711092, 0.319234, 0.5954684, 0.254902, 0, 1, 1,
0.5719117, 0.4620041, 1.07294, 0.2588235, 0, 1, 1,
0.5733793, 0.9253351, 0.1020943, 0.2666667, 0, 1, 1,
0.584094, -0.9320284, 3.702809, 0.2705882, 0, 1, 1,
0.584442, -1.348823, 3.106493, 0.2784314, 0, 1, 1,
0.5858883, 1.494128, 1.616114, 0.282353, 0, 1, 1,
0.5924824, -0.1187326, 2.190063, 0.2901961, 0, 1, 1,
0.5943762, 1.228633, 0.6091166, 0.2941177, 0, 1, 1,
0.5950883, 0.7762992, 1.004018, 0.3019608, 0, 1, 1,
0.5954871, 0.6629088, 1.462596, 0.3098039, 0, 1, 1,
0.5979445, 1.048954, 0.1581704, 0.3137255, 0, 1, 1,
0.5994711, -0.8733218, 1.991362, 0.3215686, 0, 1, 1,
0.6003, 1.794147, 1.112011, 0.3254902, 0, 1, 1,
0.602246, 1.000153, 0.1450649, 0.3333333, 0, 1, 1,
0.6061317, -1.45301, 1.977089, 0.3372549, 0, 1, 1,
0.6153154, -0.7617013, 1.831569, 0.345098, 0, 1, 1,
0.61883, -0.4896787, 2.275315, 0.3490196, 0, 1, 1,
0.6264271, 0.1849383, 0.2339596, 0.3568628, 0, 1, 1,
0.6270657, -0.007518393, 2.003548, 0.3607843, 0, 1, 1,
0.6292852, -0.4799217, 2.022931, 0.3686275, 0, 1, 1,
0.630288, -1.215512, 3.069982, 0.372549, 0, 1, 1,
0.6357085, -0.6773209, 1.7485, 0.3803922, 0, 1, 1,
0.6415527, -1.478333, 1.418965, 0.3843137, 0, 1, 1,
0.6423624, -0.05598383, 2.45193, 0.3921569, 0, 1, 1,
0.6443334, 1.156025, 2.207046, 0.3960784, 0, 1, 1,
0.6464369, 0.2733365, 1.417987, 0.4039216, 0, 1, 1,
0.6469569, 1.061809, 2.052737, 0.4117647, 0, 1, 1,
0.6479266, 0.2421898, 1.463641, 0.4156863, 0, 1, 1,
0.6480582, -0.2835174, 3.732631, 0.4235294, 0, 1, 1,
0.650417, 0.5703393, 1.374319, 0.427451, 0, 1, 1,
0.6510994, -1.520588, 3.046292, 0.4352941, 0, 1, 1,
0.6595613, 0.1327928, 2.604097, 0.4392157, 0, 1, 1,
0.6606163, 0.5048404, 2.186463, 0.4470588, 0, 1, 1,
0.6607288, 0.5113479, -1.619876, 0.4509804, 0, 1, 1,
0.6643007, 1.169732, 0.7633368, 0.4588235, 0, 1, 1,
0.6663639, 1.098871, 0.1023399, 0.4627451, 0, 1, 1,
0.6666299, 0.7020835, -1.432321, 0.4705882, 0, 1, 1,
0.6773475, 0.1584263, 2.07046, 0.4745098, 0, 1, 1,
0.6802211, 0.5944449, 2.008462, 0.4823529, 0, 1, 1,
0.6823072, 0.2828072, 1.746051, 0.4862745, 0, 1, 1,
0.6823495, 0.3205694, 0.9067022, 0.4941176, 0, 1, 1,
0.6864857, -0.4553722, 2.818825, 0.5019608, 0, 1, 1,
0.6918603, 2.478969, -0.05831447, 0.5058824, 0, 1, 1,
0.6930084, -0.6686102, 1.468386, 0.5137255, 0, 1, 1,
0.6965685, 0.3625546, 0.6442226, 0.5176471, 0, 1, 1,
0.6980798, 0.462782, 1.171005, 0.5254902, 0, 1, 1,
0.7011576, -0.4052826, 4.448612, 0.5294118, 0, 1, 1,
0.7012795, -0.4871801, 2.966367, 0.5372549, 0, 1, 1,
0.7097437, 0.2015323, 0.7505587, 0.5411765, 0, 1, 1,
0.7116871, 1.148044, 0.8850843, 0.5490196, 0, 1, 1,
0.7156644, 1.587177, -0.1001516, 0.5529412, 0, 1, 1,
0.7263248, -0.07805452, 1.017184, 0.5607843, 0, 1, 1,
0.7307182, -0.5746055, 1.335722, 0.5647059, 0, 1, 1,
0.7328388, 1.284989, 0.5317149, 0.572549, 0, 1, 1,
0.7330471, 0.9212088, 2.84892, 0.5764706, 0, 1, 1,
0.7334583, -1.152003, 3.005515, 0.5843138, 0, 1, 1,
0.7345379, 1.815289, 0.6197935, 0.5882353, 0, 1, 1,
0.7349251, 1.719779, 1.380296, 0.5960785, 0, 1, 1,
0.738823, -2.306341, 3.434607, 0.6039216, 0, 1, 1,
0.7401628, -0.2582059, -0.1123101, 0.6078432, 0, 1, 1,
0.7409115, 0.3154882, 0.5672234, 0.6156863, 0, 1, 1,
0.7435777, -0.5348607, 1.201592, 0.6196079, 0, 1, 1,
0.7451369, 0.3121105, 1.020185, 0.627451, 0, 1, 1,
0.7493743, -1.215908, 1.680347, 0.6313726, 0, 1, 1,
0.7497443, -0.2782433, 2.705941, 0.6392157, 0, 1, 1,
0.7533225, 0.2620608, -0.6020037, 0.6431373, 0, 1, 1,
0.7548632, 0.2603624, 1.373444, 0.6509804, 0, 1, 1,
0.7555808, 0.5353357, -0.9543279, 0.654902, 0, 1, 1,
0.7580132, 1.727573, -0.8068898, 0.6627451, 0, 1, 1,
0.7704692, -0.5478778, 2.023842, 0.6666667, 0, 1, 1,
0.7711131, 0.8380642, 1.085487, 0.6745098, 0, 1, 1,
0.7712163, -0.9190606, 2.110398, 0.6784314, 0, 1, 1,
0.7750075, 1.296704, 1.802731, 0.6862745, 0, 1, 1,
0.7755618, -1.096858, 1.246972, 0.6901961, 0, 1, 1,
0.7811749, -1.648568, 4.936643, 0.6980392, 0, 1, 1,
0.7844012, -0.7958859, 2.323555, 0.7058824, 0, 1, 1,
0.7852395, 1.093033, -0.7806323, 0.7098039, 0, 1, 1,
0.785498, -0.8065873, 1.616506, 0.7176471, 0, 1, 1,
0.7870296, -0.06069157, -0.3338917, 0.7215686, 0, 1, 1,
0.7891454, -1.025247, 4.510831, 0.7294118, 0, 1, 1,
0.7955489, -0.4181193, 3.171699, 0.7333333, 0, 1, 1,
0.7985682, 1.081623, 0.9909733, 0.7411765, 0, 1, 1,
0.7993838, -0.06218461, 1.595831, 0.7450981, 0, 1, 1,
0.7994691, 0.1822564, 1.268689, 0.7529412, 0, 1, 1,
0.803426, 0.7574589, 0.4809283, 0.7568628, 0, 1, 1,
0.804644, -0.2780175, 3.258235, 0.7647059, 0, 1, 1,
0.8056653, 0.2367828, 1.529868, 0.7686275, 0, 1, 1,
0.8063939, 0.6551908, 0.07143202, 0.7764706, 0, 1, 1,
0.8085012, -0.6423237, 3.001737, 0.7803922, 0, 1, 1,
0.8089978, -0.5848874, 2.47942, 0.7882353, 0, 1, 1,
0.8107355, 1.338716, 2.275248, 0.7921569, 0, 1, 1,
0.8126778, -1.677809, 0.5606933, 0.8, 0, 1, 1,
0.8181481, -1.973829, 2.222409, 0.8078431, 0, 1, 1,
0.8196561, 0.6862113, 1.11519, 0.8117647, 0, 1, 1,
0.8198729, -2.432076, 3.729308, 0.8196079, 0, 1, 1,
0.8207856, -0.5022902, 3.086849, 0.8235294, 0, 1, 1,
0.827193, -0.8592324, 2.297878, 0.8313726, 0, 1, 1,
0.8287148, -0.5450156, 1.779359, 0.8352941, 0, 1, 1,
0.8320861, 1.264216, -0.2301639, 0.8431373, 0, 1, 1,
0.8382952, -0.1106613, 1.81692, 0.8470588, 0, 1, 1,
0.8537694, -0.8397296, 1.323375, 0.854902, 0, 1, 1,
0.8583126, 0.5506862, 0.8328435, 0.8588235, 0, 1, 1,
0.8594611, 0.3736021, -0.1490166, 0.8666667, 0, 1, 1,
0.8635737, 1.40465, -0.5082647, 0.8705882, 0, 1, 1,
0.8645773, 2.71209, 0.0455196, 0.8784314, 0, 1, 1,
0.871608, -0.6739162, 2.036351, 0.8823529, 0, 1, 1,
0.8741515, 0.3335261, 2.348959, 0.8901961, 0, 1, 1,
0.8763371, 0.1876831, 1.850752, 0.8941177, 0, 1, 1,
0.8821179, -0.1160618, 1.994924, 0.9019608, 0, 1, 1,
0.8827879, 0.710425, 2.174153, 0.9098039, 0, 1, 1,
0.8845425, -0.1353931, 2.131636, 0.9137255, 0, 1, 1,
0.8846138, -0.6895835, 2.589798, 0.9215686, 0, 1, 1,
0.8860018, 0.2485649, 2.806076, 0.9254902, 0, 1, 1,
0.8900136, 0.4595606, 0.8600144, 0.9333333, 0, 1, 1,
0.8922878, 0.5302578, 1.956169, 0.9372549, 0, 1, 1,
0.9006637, -1.115574, 2.680219, 0.945098, 0, 1, 1,
0.9032584, -1.520586, 1.763508, 0.9490196, 0, 1, 1,
0.9043391, 0.4091798, 0.3544635, 0.9568627, 0, 1, 1,
0.906258, -0.443572, 2.415225, 0.9607843, 0, 1, 1,
0.9085128, 0.4277926, 1.014694, 0.9686275, 0, 1, 1,
0.9143394, 0.538731, 0.08154846, 0.972549, 0, 1, 1,
0.9174743, -0.8295967, 3.216424, 0.9803922, 0, 1, 1,
0.9240162, 0.4188716, 1.52669, 0.9843137, 0, 1, 1,
0.9311651, 1.593901, 0.6332415, 0.9921569, 0, 1, 1,
0.9314012, -0.3828141, 2.364331, 0.9960784, 0, 1, 1,
0.9315726, -1.14615, 1.225277, 1, 0, 0.9960784, 1,
0.9380314, -0.2113446, 0.7628531, 1, 0, 0.9882353, 1,
0.9389275, 1.51965, 1.172244, 1, 0, 0.9843137, 1,
0.94775, 0.4104919, 1.464487, 1, 0, 0.9764706, 1,
0.9542393, 1.700526, -0.1557399, 1, 0, 0.972549, 1,
0.9644715, 1.371117, 0.971386, 1, 0, 0.9647059, 1,
0.9782532, -0.6293815, 2.496985, 1, 0, 0.9607843, 1,
0.9817805, 1.576768, -0.5988479, 1, 0, 0.9529412, 1,
0.9858121, 0.08880803, 1.978519, 1, 0, 0.9490196, 1,
0.9868525, -0.2585309, 2.176585, 1, 0, 0.9411765, 1,
0.9943193, 0.1700738, 2.670687, 1, 0, 0.9372549, 1,
0.9984525, -2.089218, 2.076377, 1, 0, 0.9294118, 1,
1.003345, -0.6847801, 0.8778625, 1, 0, 0.9254902, 1,
1.004973, -1.057135, 1.142512, 1, 0, 0.9176471, 1,
1.006262, 0.006022051, 2.262635, 1, 0, 0.9137255, 1,
1.006347, -1.520132, 3.363369, 1, 0, 0.9058824, 1,
1.01056, 0.3508022, -0.08802885, 1, 0, 0.9019608, 1,
1.013394, 0.2112981, 1.396954, 1, 0, 0.8941177, 1,
1.025933, -1.207527, 1.977005, 1, 0, 0.8862745, 1,
1.028254, -1.121953, 3.663722, 1, 0, 0.8823529, 1,
1.032191, -0.5501753, 1.103698, 1, 0, 0.8745098, 1,
1.03493, -0.6121728, 1.220551, 1, 0, 0.8705882, 1,
1.038293, -0.3579896, 1.189256, 1, 0, 0.8627451, 1,
1.049602, -0.4143716, 2.283175, 1, 0, 0.8588235, 1,
1.050947, -1.47782, 1.562397, 1, 0, 0.8509804, 1,
1.057942, 1.816524, 0.3037797, 1, 0, 0.8470588, 1,
1.064067, 0.6554043, 1.339567, 1, 0, 0.8392157, 1,
1.064991, 2.638754, -0.78669, 1, 0, 0.8352941, 1,
1.066917, 2.111651, 0.2495062, 1, 0, 0.827451, 1,
1.071923, -0.9824603, 2.720464, 1, 0, 0.8235294, 1,
1.072701, 0.3685154, 1.120392, 1, 0, 0.8156863, 1,
1.079278, -0.4252692, 2.224833, 1, 0, 0.8117647, 1,
1.085481, -1.782889, 3.166671, 1, 0, 0.8039216, 1,
1.086167, -1.059415, 1.868343, 1, 0, 0.7960784, 1,
1.090238, 1.038642, 0.06397886, 1, 0, 0.7921569, 1,
1.097077, -0.1751058, 2.372916, 1, 0, 0.7843137, 1,
1.100684, 1.618671, 1.774754, 1, 0, 0.7803922, 1,
1.101554, -0.2705696, 0.2407975, 1, 0, 0.772549, 1,
1.104559, 0.4938268, 1.376571, 1, 0, 0.7686275, 1,
1.112389, 1.967669, 1.651209, 1, 0, 0.7607843, 1,
1.117047, 0.9356897, 0.03692214, 1, 0, 0.7568628, 1,
1.122139, 2.031691, 0.369476, 1, 0, 0.7490196, 1,
1.126665, 0.7911289, 3.100198, 1, 0, 0.7450981, 1,
1.127568, -0.2276295, 1.778465, 1, 0, 0.7372549, 1,
1.144173, 1.285458, 0.4195127, 1, 0, 0.7333333, 1,
1.146668, 0.02226879, 1.042576, 1, 0, 0.7254902, 1,
1.149416, 1.07833, -0.5137802, 1, 0, 0.7215686, 1,
1.153111, -1.073684, 3.234787, 1, 0, 0.7137255, 1,
1.164397, -1.572496, 1.625579, 1, 0, 0.7098039, 1,
1.17131, -1.260401, 1.767418, 1, 0, 0.7019608, 1,
1.181924, 0.1836647, 2.486498, 1, 0, 0.6941177, 1,
1.184858, -0.1745265, 2.291799, 1, 0, 0.6901961, 1,
1.193621, 1.173373, 1.109865, 1, 0, 0.682353, 1,
1.206458, -1.812562, 2.692139, 1, 0, 0.6784314, 1,
1.213043, -0.0147205, 1.28956, 1, 0, 0.6705883, 1,
1.213938, 1.573804, 1.123322, 1, 0, 0.6666667, 1,
1.214497, 1.3786, 2.739301, 1, 0, 0.6588235, 1,
1.217225, -1.885736, 1.837314, 1, 0, 0.654902, 1,
1.220939, -2.057109, 2.553311, 1, 0, 0.6470588, 1,
1.224723, -0.5530867, 2.512412, 1, 0, 0.6431373, 1,
1.237568, 0.4344044, 2.32836, 1, 0, 0.6352941, 1,
1.239264, -0.8132475, 2.506666, 1, 0, 0.6313726, 1,
1.243181, 0.5748806, 2.750091, 1, 0, 0.6235294, 1,
1.245843, 0.05176046, 0.2700901, 1, 0, 0.6196079, 1,
1.248835, 0.4991745, 1.602833, 1, 0, 0.6117647, 1,
1.24914, 1.40037, 0.5954946, 1, 0, 0.6078432, 1,
1.250926, 0.7505531, 1.091876, 1, 0, 0.6, 1,
1.252322, 0.344745, 2.436628, 1, 0, 0.5921569, 1,
1.252961, -0.6937836, 2.621549, 1, 0, 0.5882353, 1,
1.259351, -0.5855356, 1.339948, 1, 0, 0.5803922, 1,
1.267605, -1.199665, 1.32223, 1, 0, 0.5764706, 1,
1.273856, 1.522795, -1.480655, 1, 0, 0.5686275, 1,
1.280948, -0.2805393, 2.460169, 1, 0, 0.5647059, 1,
1.287026, 1.347074, 0.7394342, 1, 0, 0.5568628, 1,
1.311105, -1.025748, 2.165259, 1, 0, 0.5529412, 1,
1.316331, -0.7070636, 2.484803, 1, 0, 0.5450981, 1,
1.317032, 1.106737, 0.5748184, 1, 0, 0.5411765, 1,
1.322035, -0.6848126, 0.9505394, 1, 0, 0.5333334, 1,
1.340022, 0.5170884, 1.681666, 1, 0, 0.5294118, 1,
1.343911, 0.4429675, 1.658111, 1, 0, 0.5215687, 1,
1.344121, 1.395679, 0.3410193, 1, 0, 0.5176471, 1,
1.350621, -0.2194376, 2.527313, 1, 0, 0.509804, 1,
1.361072, 0.5631887, -0.9196286, 1, 0, 0.5058824, 1,
1.368026, 0.3910492, 0.04567705, 1, 0, 0.4980392, 1,
1.369035, 1.434153, 2.456045, 1, 0, 0.4901961, 1,
1.371536, 1.471927, -0.6831604, 1, 0, 0.4862745, 1,
1.374199, 1.226718, 0.3453715, 1, 0, 0.4784314, 1,
1.377726, -0.1953408, 1.400431, 1, 0, 0.4745098, 1,
1.37991, 0.1066638, 2.423683, 1, 0, 0.4666667, 1,
1.380547, -0.8743152, 3.767042, 1, 0, 0.4627451, 1,
1.383475, 0.558665, 1.022385, 1, 0, 0.454902, 1,
1.384601, 1.692971, -0.2066445, 1, 0, 0.4509804, 1,
1.388191, -0.7091647, 1.875863, 1, 0, 0.4431373, 1,
1.392208, -0.3705329, 1.992782, 1, 0, 0.4392157, 1,
1.392868, -0.3031056, 1.000181, 1, 0, 0.4313726, 1,
1.422966, 0.4455396, 2.484122, 1, 0, 0.427451, 1,
1.431026, 0.6618472, 1.033093, 1, 0, 0.4196078, 1,
1.436808, -1.197592, 2.936346, 1, 0, 0.4156863, 1,
1.437275, -0.3307428, 1.259971, 1, 0, 0.4078431, 1,
1.452242, -0.7571065, 0.645857, 1, 0, 0.4039216, 1,
1.453233, 0.7418741, 1.528274, 1, 0, 0.3960784, 1,
1.455931, -1.622177, 3.708131, 1, 0, 0.3882353, 1,
1.485216, -0.9366012, 2.976016, 1, 0, 0.3843137, 1,
1.505343, -1.260983, 2.980741, 1, 0, 0.3764706, 1,
1.508514, -0.7239052, -0.503639, 1, 0, 0.372549, 1,
1.513848, 0.01752684, 1.886493, 1, 0, 0.3647059, 1,
1.515256, 2.106283, -0.2043096, 1, 0, 0.3607843, 1,
1.523413, -0.9496881, 1.372199, 1, 0, 0.3529412, 1,
1.531557, 0.5980277, 0.4598962, 1, 0, 0.3490196, 1,
1.54186, -0.7610236, 0.6943761, 1, 0, 0.3411765, 1,
1.546036, 1.262816, -1.101174, 1, 0, 0.3372549, 1,
1.555893, 1.020325, 0.5375474, 1, 0, 0.3294118, 1,
1.561897, 0.8463332, 0.2535045, 1, 0, 0.3254902, 1,
1.566821, -0.07154813, 1.614864, 1, 0, 0.3176471, 1,
1.583337, 0.4394191, -0.03184566, 1, 0, 0.3137255, 1,
1.585645, -3.11459e-05, 0.5581037, 1, 0, 0.3058824, 1,
1.588122, 0.1301433, 1.825864, 1, 0, 0.2980392, 1,
1.594891, 0.2606233, 2.239891, 1, 0, 0.2941177, 1,
1.611975, -0.321662, 1.203684, 1, 0, 0.2862745, 1,
1.612493, -0.008896296, 1.97404, 1, 0, 0.282353, 1,
1.614805, 0.1914303, 2.405056, 1, 0, 0.2745098, 1,
1.672607, 0.2892634, 0.5078666, 1, 0, 0.2705882, 1,
1.700343, -1.525059, 1.276137, 1, 0, 0.2627451, 1,
1.707984, 0.5812401, -0.7072672, 1, 0, 0.2588235, 1,
1.726261, 1.27481, 1.75845, 1, 0, 0.2509804, 1,
1.728953, 0.8215842, -1.040754, 1, 0, 0.2470588, 1,
1.744471, 0.5239231, 1.971355, 1, 0, 0.2392157, 1,
1.751159, -1.708036, 1.758035, 1, 0, 0.2352941, 1,
1.755543, 0.5589222, 2.111153, 1, 0, 0.227451, 1,
1.759407, 1.09584, 1.013897, 1, 0, 0.2235294, 1,
1.772491, 0.9596059, -0.8181626, 1, 0, 0.2156863, 1,
1.781754, -0.3130061, 1.843421, 1, 0, 0.2117647, 1,
1.783542, 1.328611, 0.4707778, 1, 0, 0.2039216, 1,
1.846877, -0.9786505, 2.928395, 1, 0, 0.1960784, 1,
1.861894, -0.5540119, 2.980439, 1, 0, 0.1921569, 1,
1.884088, -1.013319, 0.04015461, 1, 0, 0.1843137, 1,
1.884116, -0.6467928, 1.888448, 1, 0, 0.1803922, 1,
1.910537, -0.08032409, 1.661679, 1, 0, 0.172549, 1,
1.923164, -1.015757, 2.223445, 1, 0, 0.1686275, 1,
1.954574, -1.214127, 1.613936, 1, 0, 0.1607843, 1,
1.95551, -0.886007, 0.9123091, 1, 0, 0.1568628, 1,
1.97264, 1.02658, 0.743848, 1, 0, 0.1490196, 1,
1.979051, 0.4570618, 2.644502, 1, 0, 0.145098, 1,
1.997292, 0.1223596, 1.349432, 1, 0, 0.1372549, 1,
2.023889, -0.6477752, 2.136971, 1, 0, 0.1333333, 1,
2.034646, 1.325973, 0.1901071, 1, 0, 0.1254902, 1,
2.048543, 0.3459935, -0.1320842, 1, 0, 0.1215686, 1,
2.089003, 1.31495, 0.8291478, 1, 0, 0.1137255, 1,
2.098879, -1.468545, 2.281812, 1, 0, 0.1098039, 1,
2.106427, 1.777934, 2.746561, 1, 0, 0.1019608, 1,
2.136888, 0.5729316, 1.128683, 1, 0, 0.09411765, 1,
2.157968, 0.5286911, 1.8088, 1, 0, 0.09019608, 1,
2.177173, -0.52389, 3.184638, 1, 0, 0.08235294, 1,
2.213808, -0.2163831, 1.773566, 1, 0, 0.07843138, 1,
2.232097, -0.5176587, 0.2249067, 1, 0, 0.07058824, 1,
2.251412, 0.2080203, 1.448711, 1, 0, 0.06666667, 1,
2.305696, 1.358374, 1.210732, 1, 0, 0.05882353, 1,
2.328772, 0.1421982, 2.647686, 1, 0, 0.05490196, 1,
2.370064, -1.038034, 0.8954889, 1, 0, 0.04705882, 1,
2.39448, -0.07798973, 1.460429, 1, 0, 0.04313726, 1,
2.55628, -0.6059961, 2.168365, 1, 0, 0.03529412, 1,
2.597117, -0.1672392, -0.4405617, 1, 0, 0.03137255, 1,
2.852628, -1.365859, 0.6749725, 1, 0, 0.02352941, 1,
2.985623, -0.3513912, 1.194499, 1, 0, 0.01960784, 1,
3.035189, 0.6116522, 1.743738, 1, 0, 0.01176471, 1,
3.536169, -0.2990586, 1.673389, 1, 0, 0.007843138, 1
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
-0.0738225, -3.898032, -7.252737, 0, -0.5, 0.5, 0.5,
-0.0738225, -3.898032, -7.252737, 1, -0.5, 0.5, 0.5,
-0.0738225, -3.898032, -7.252737, 1, 1.5, 0.5, 0.5,
-0.0738225, -3.898032, -7.252737, 0, 1.5, 0.5, 0.5
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
-4.907601, 0.3045683, -7.252737, 0, -0.5, 0.5, 0.5,
-4.907601, 0.3045683, -7.252737, 1, -0.5, 0.5, 0.5,
-4.907601, 0.3045683, -7.252737, 1, 1.5, 0.5, 0.5,
-4.907601, 0.3045683, -7.252737, 0, 1.5, 0.5, 0.5
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
-4.907601, -3.898032, -0.1596885, 0, -0.5, 0.5, 0.5,
-4.907601, -3.898032, -0.1596885, 1, -0.5, 0.5, 0.5,
-4.907601, -3.898032, -0.1596885, 1, 1.5, 0.5, 0.5,
-4.907601, -3.898032, -0.1596885, 0, 1.5, 0.5, 0.5
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
-2, -2.928201, -5.61588,
2, -2.928201, -5.61588,
-2, -2.928201, -5.61588,
-2, -3.089839, -5.888689,
0, -2.928201, -5.61588,
0, -3.089839, -5.888689,
2, -2.928201, -5.61588,
2, -3.089839, -5.888689
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
-2, -3.413116, -6.434308, 0, -0.5, 0.5, 0.5,
-2, -3.413116, -6.434308, 1, -0.5, 0.5, 0.5,
-2, -3.413116, -6.434308, 1, 1.5, 0.5, 0.5,
-2, -3.413116, -6.434308, 0, 1.5, 0.5, 0.5,
0, -3.413116, -6.434308, 0, -0.5, 0.5, 0.5,
0, -3.413116, -6.434308, 1, -0.5, 0.5, 0.5,
0, -3.413116, -6.434308, 1, 1.5, 0.5, 0.5,
0, -3.413116, -6.434308, 0, 1.5, 0.5, 0.5,
2, -3.413116, -6.434308, 0, -0.5, 0.5, 0.5,
2, -3.413116, -6.434308, 1, -0.5, 0.5, 0.5,
2, -3.413116, -6.434308, 1, 1.5, 0.5, 0.5,
2, -3.413116, -6.434308, 0, 1.5, 0.5, 0.5
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
-3.792114, -2, -5.61588,
-3.792114, 3, -5.61588,
-3.792114, -2, -5.61588,
-3.978029, -2, -5.888689,
-3.792114, -1, -5.61588,
-3.978029, -1, -5.888689,
-3.792114, 0, -5.61588,
-3.978029, 0, -5.888689,
-3.792114, 1, -5.61588,
-3.978029, 1, -5.888689,
-3.792114, 2, -5.61588,
-3.978029, 2, -5.888689,
-3.792114, 3, -5.61588,
-3.978029, 3, -5.888689
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
-4.349858, -2, -6.434308, 0, -0.5, 0.5, 0.5,
-4.349858, -2, -6.434308, 1, -0.5, 0.5, 0.5,
-4.349858, -2, -6.434308, 1, 1.5, 0.5, 0.5,
-4.349858, -2, -6.434308, 0, 1.5, 0.5, 0.5,
-4.349858, -1, -6.434308, 0, -0.5, 0.5, 0.5,
-4.349858, -1, -6.434308, 1, -0.5, 0.5, 0.5,
-4.349858, -1, -6.434308, 1, 1.5, 0.5, 0.5,
-4.349858, -1, -6.434308, 0, 1.5, 0.5, 0.5,
-4.349858, 0, -6.434308, 0, -0.5, 0.5, 0.5,
-4.349858, 0, -6.434308, 1, -0.5, 0.5, 0.5,
-4.349858, 0, -6.434308, 1, 1.5, 0.5, 0.5,
-4.349858, 0, -6.434308, 0, 1.5, 0.5, 0.5,
-4.349858, 1, -6.434308, 0, -0.5, 0.5, 0.5,
-4.349858, 1, -6.434308, 1, -0.5, 0.5, 0.5,
-4.349858, 1, -6.434308, 1, 1.5, 0.5, 0.5,
-4.349858, 1, -6.434308, 0, 1.5, 0.5, 0.5,
-4.349858, 2, -6.434308, 0, -0.5, 0.5, 0.5,
-4.349858, 2, -6.434308, 1, -0.5, 0.5, 0.5,
-4.349858, 2, -6.434308, 1, 1.5, 0.5, 0.5,
-4.349858, 2, -6.434308, 0, 1.5, 0.5, 0.5,
-4.349858, 3, -6.434308, 0, -0.5, 0.5, 0.5,
-4.349858, 3, -6.434308, 1, -0.5, 0.5, 0.5,
-4.349858, 3, -6.434308, 1, 1.5, 0.5, 0.5,
-4.349858, 3, -6.434308, 0, 1.5, 0.5, 0.5
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
-3.792114, -2.928201, -4,
-3.792114, -2.928201, 4,
-3.792114, -2.928201, -4,
-3.978029, -3.089839, -4,
-3.792114, -2.928201, -2,
-3.978029, -3.089839, -2,
-3.792114, -2.928201, 0,
-3.978029, -3.089839, 0,
-3.792114, -2.928201, 2,
-3.978029, -3.089839, 2,
-3.792114, -2.928201, 4,
-3.978029, -3.089839, 4
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
-4.349858, -3.413116, -4, 0, -0.5, 0.5, 0.5,
-4.349858, -3.413116, -4, 1, -0.5, 0.5, 0.5,
-4.349858, -3.413116, -4, 1, 1.5, 0.5, 0.5,
-4.349858, -3.413116, -4, 0, 1.5, 0.5, 0.5,
-4.349858, -3.413116, -2, 0, -0.5, 0.5, 0.5,
-4.349858, -3.413116, -2, 1, -0.5, 0.5, 0.5,
-4.349858, -3.413116, -2, 1, 1.5, 0.5, 0.5,
-4.349858, -3.413116, -2, 0, 1.5, 0.5, 0.5,
-4.349858, -3.413116, 0, 0, -0.5, 0.5, 0.5,
-4.349858, -3.413116, 0, 1, -0.5, 0.5, 0.5,
-4.349858, -3.413116, 0, 1, 1.5, 0.5, 0.5,
-4.349858, -3.413116, 0, 0, 1.5, 0.5, 0.5,
-4.349858, -3.413116, 2, 0, -0.5, 0.5, 0.5,
-4.349858, -3.413116, 2, 1, -0.5, 0.5, 0.5,
-4.349858, -3.413116, 2, 1, 1.5, 0.5, 0.5,
-4.349858, -3.413116, 2, 0, 1.5, 0.5, 0.5,
-4.349858, -3.413116, 4, 0, -0.5, 0.5, 0.5,
-4.349858, -3.413116, 4, 1, -0.5, 0.5, 0.5,
-4.349858, -3.413116, 4, 1, 1.5, 0.5, 0.5,
-4.349858, -3.413116, 4, 0, 1.5, 0.5, 0.5
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
-3.792114, -2.928201, -5.61588,
-3.792114, 3.537338, -5.61588,
-3.792114, -2.928201, 5.296503,
-3.792114, 3.537338, 5.296503,
-3.792114, -2.928201, -5.61588,
-3.792114, -2.928201, 5.296503,
-3.792114, 3.537338, -5.61588,
-3.792114, 3.537338, 5.296503,
-3.792114, -2.928201, -5.61588,
3.644469, -2.928201, -5.61588,
-3.792114, -2.928201, 5.296503,
3.644469, -2.928201, 5.296503,
-3.792114, 3.537338, -5.61588,
3.644469, 3.537338, -5.61588,
-3.792114, 3.537338, 5.296503,
3.644469, 3.537338, 5.296503,
3.644469, -2.928201, -5.61588,
3.644469, 3.537338, -5.61588,
3.644469, -2.928201, 5.296503,
3.644469, 3.537338, 5.296503,
3.644469, -2.928201, -5.61588,
3.644469, -2.928201, 5.296503,
3.644469, 3.537338, -5.61588,
3.644469, 3.537338, 5.296503
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
var radius = 7.851259;
var distance = 34.93114;
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
mvMatrix.translate( 0.0738225, -0.3045683, 0.1596885 );
mvMatrix.scale( 1.14151, 1.312951, 0.7779177 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.93114);
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
diafenthiuron<-read.table("diafenthiuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diafenthiuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'diafenthiuron' not found
```

```r
y<-diafenthiuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'diafenthiuron' not found
```

```r
z<-diafenthiuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'diafenthiuron' not found
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
-3.683814, 0.07917292, -1.14049, 0, 0, 1, 1, 1,
-2.801594, 0.9043703, -1.385979, 1, 0, 0, 1, 1,
-2.796595, 0.7864203, 0.4931737, 1, 0, 0, 1, 1,
-2.72473, 0.7041215, -1.258636, 1, 0, 0, 1, 1,
-2.691304, -0.1281124, -0.7200547, 1, 0, 0, 1, 1,
-2.605417, 0.114341, -0.6651615, 1, 0, 0, 1, 1,
-2.473895, 0.7002209, -0.6096085, 0, 0, 0, 1, 1,
-2.435643, -0.8441857, -2.045219, 0, 0, 0, 1, 1,
-2.355335, 0.4676013, -2.066545, 0, 0, 0, 1, 1,
-2.258717, 0.4017818, -2.487616, 0, 0, 0, 1, 1,
-2.177045, -0.07859237, -1.850284, 0, 0, 0, 1, 1,
-2.174839, 2.431583, -1.949256, 0, 0, 0, 1, 1,
-2.15298, 1.01991, -1.489857, 0, 0, 0, 1, 1,
-2.103618, 0.2292987, -2.213266, 1, 1, 1, 1, 1,
-2.046798, -1.414179, -1.94608, 1, 1, 1, 1, 1,
-2.032104, -0.6459739, -1.699504, 1, 1, 1, 1, 1,
-2.028468, -0.8144542, -2.478578, 1, 1, 1, 1, 1,
-1.973508, -1.223413, -1.354806, 1, 1, 1, 1, 1,
-1.955646, -1.217756, -1.810698, 1, 1, 1, 1, 1,
-1.86532, 0.2888944, -0.7279259, 1, 1, 1, 1, 1,
-1.839368, 1.750502, -0.5115236, 1, 1, 1, 1, 1,
-1.831674, -1.225692, -2.481218, 1, 1, 1, 1, 1,
-1.827451, 0.1376478, -0.8660098, 1, 1, 1, 1, 1,
-1.821569, -0.9716952, -2.875893, 1, 1, 1, 1, 1,
-1.815415, 0.02973641, -0.6157855, 1, 1, 1, 1, 1,
-1.813607, 1.30975, 0.9070112, 1, 1, 1, 1, 1,
-1.810744, 0.09740362, -1.067216, 1, 1, 1, 1, 1,
-1.799292, -0.7428377, -0.8235015, 1, 1, 1, 1, 1,
-1.786038, -0.2396463, -1.635016, 0, 0, 1, 1, 1,
-1.752149, -0.3710961, -1.609697, 1, 0, 0, 1, 1,
-1.74407, 0.6875131, -2.678354, 1, 0, 0, 1, 1,
-1.742105, -0.8927699, -2.708695, 1, 0, 0, 1, 1,
-1.733101, -1.107263, -1.977384, 1, 0, 0, 1, 1,
-1.728308, 0.2434602, -1.024055, 1, 0, 0, 1, 1,
-1.717385, -0.01813749, -0.6932027, 0, 0, 0, 1, 1,
-1.706236, -1.721906, -1.166149, 0, 0, 0, 1, 1,
-1.690334, -1.001332, -3.444098, 0, 0, 0, 1, 1,
-1.687407, 1.328206, -3.180102, 0, 0, 0, 1, 1,
-1.669001, -1.004537, -2.145472, 0, 0, 0, 1, 1,
-1.668922, -1.178408, -2.96437, 0, 0, 0, 1, 1,
-1.652293, -1.061681, -1.046151, 0, 0, 0, 1, 1,
-1.647793, 1.475452, -1.067057, 1, 1, 1, 1, 1,
-1.640804, 1.98655, 0.141867, 1, 1, 1, 1, 1,
-1.628428, -1.209795, -2.655241, 1, 1, 1, 1, 1,
-1.586774, 0.5070968, -2.80682, 1, 1, 1, 1, 1,
-1.586553, -0.6480694, 0.0624067, 1, 1, 1, 1, 1,
-1.580611, -0.4847308, -2.0627, 1, 1, 1, 1, 1,
-1.570969, 0.06544729, -1.745449, 1, 1, 1, 1, 1,
-1.543927, -1.466772, -1.158102, 1, 1, 1, 1, 1,
-1.541481, -0.2333054, -1.235559, 1, 1, 1, 1, 1,
-1.537658, -0.5151007, -0.7549878, 1, 1, 1, 1, 1,
-1.517401, -0.128626, -1.299543, 1, 1, 1, 1, 1,
-1.512017, -0.6789832, -1.244734, 1, 1, 1, 1, 1,
-1.503659, 1.008393, -0.168808, 1, 1, 1, 1, 1,
-1.50049, -0.05272515, -0.6522248, 1, 1, 1, 1, 1,
-1.477154, -0.6163155, -2.219029, 1, 1, 1, 1, 1,
-1.46427, -0.2794246, -1.888165, 0, 0, 1, 1, 1,
-1.460757, -1.031616, -0.6798761, 1, 0, 0, 1, 1,
-1.457557, -1.774704, -2.045245, 1, 0, 0, 1, 1,
-1.455565, -1.626242, -3.787688, 1, 0, 0, 1, 1,
-1.452517, 0.315013, -1.295744, 1, 0, 0, 1, 1,
-1.448677, 0.7582285, -1.665212, 1, 0, 0, 1, 1,
-1.444446, -0.2400587, -1.715596, 0, 0, 0, 1, 1,
-1.436735, -1.034518, -3.261771, 0, 0, 0, 1, 1,
-1.430935, 1.087925, -1.024256, 0, 0, 0, 1, 1,
-1.419352, 0.8626419, -0.8711303, 0, 0, 0, 1, 1,
-1.410475, -0.3681577, -3.007815, 0, 0, 0, 1, 1,
-1.402651, -0.5858568, -0.8735411, 0, 0, 0, 1, 1,
-1.39266, 0.422263, -1.673124, 0, 0, 0, 1, 1,
-1.380409, -0.3609604, -1.28123, 1, 1, 1, 1, 1,
-1.380173, -0.1607796, -2.381873, 1, 1, 1, 1, 1,
-1.371028, -0.489532, -1.261681, 1, 1, 1, 1, 1,
-1.360078, 0.3350357, -1.335361, 1, 1, 1, 1, 1,
-1.359984, 1.117726, -0.3862711, 1, 1, 1, 1, 1,
-1.358242, 1.302666, -0.2891499, 1, 1, 1, 1, 1,
-1.357799, 0.4805059, -2.006129, 1, 1, 1, 1, 1,
-1.349525, -0.3798115, -1.792526, 1, 1, 1, 1, 1,
-1.345465, 0.3669039, -0.9956087, 1, 1, 1, 1, 1,
-1.338023, 1.69556, -1.3806, 1, 1, 1, 1, 1,
-1.337201, 0.8789521, -3.205663, 1, 1, 1, 1, 1,
-1.331248, -0.4933617, -0.1431823, 1, 1, 1, 1, 1,
-1.324485, 1.311959, -2.631556, 1, 1, 1, 1, 1,
-1.322372, -0.1879922, -1.807196, 1, 1, 1, 1, 1,
-1.319937, -0.2782163, -2.296069, 1, 1, 1, 1, 1,
-1.316381, -1.386592, -3.350863, 0, 0, 1, 1, 1,
-1.313059, -0.7143271, -1.439078, 1, 0, 0, 1, 1,
-1.308884, 2.47702, -1.678426, 1, 0, 0, 1, 1,
-1.308368, 0.3549819, -1.913051, 1, 0, 0, 1, 1,
-1.296965, -0.1978724, -1.677811, 1, 0, 0, 1, 1,
-1.29583, 0.824443, -1.491328, 1, 0, 0, 1, 1,
-1.288404, 1.225771, -1.52423, 0, 0, 0, 1, 1,
-1.283152, 0.1024827, -2.30924, 0, 0, 0, 1, 1,
-1.265201, 0.8397383, 0.1018983, 0, 0, 0, 1, 1,
-1.259663, -1.071032, -2.124965, 0, 0, 0, 1, 1,
-1.259243, -1.007531, -2.442634, 0, 0, 0, 1, 1,
-1.259051, -0.3428242, -2.549659, 0, 0, 0, 1, 1,
-1.258937, 1.164393, -3.065746, 0, 0, 0, 1, 1,
-1.257724, -0.9022539, -1.349671, 1, 1, 1, 1, 1,
-1.244038, -0.8317304, -0.3098256, 1, 1, 1, 1, 1,
-1.233219, -0.1999191, -0.7241754, 1, 1, 1, 1, 1,
-1.230484, -0.8138813, -2.082228, 1, 1, 1, 1, 1,
-1.21773, -1.904363, -3.711589, 1, 1, 1, 1, 1,
-1.21109, 0.2531554, -1.611691, 1, 1, 1, 1, 1,
-1.208522, 0.4278497, -1.489978, 1, 1, 1, 1, 1,
-1.207442, 0.348867, -1.182986, 1, 1, 1, 1, 1,
-1.197732, -1.590592, -2.762811, 1, 1, 1, 1, 1,
-1.19653, -2.454273, -3.503171, 1, 1, 1, 1, 1,
-1.193678, -1.307652, -3.473577, 1, 1, 1, 1, 1,
-1.193604, 1.480129, 0.2703595, 1, 1, 1, 1, 1,
-1.19104, -0.1688719, -1.686329, 1, 1, 1, 1, 1,
-1.189758, 1.77484, -0.6152814, 1, 1, 1, 1, 1,
-1.161401, -0.2579927, -3.004654, 1, 1, 1, 1, 1,
-1.145362, -0.4319908, -1.479928, 0, 0, 1, 1, 1,
-1.14069, 0.1285576, -0.2446109, 1, 0, 0, 1, 1,
-1.129482, 0.9133054, -0.1661679, 1, 0, 0, 1, 1,
-1.125938, 1.095159, -0.7208392, 1, 0, 0, 1, 1,
-1.122538, -0.4991485, -2.391462, 1, 0, 0, 1, 1,
-1.120326, -0.3685333, -1.002682, 1, 0, 0, 1, 1,
-1.115458, 0.05684119, -0.8871037, 0, 0, 0, 1, 1,
-1.110262, -1.010351, -1.281999, 0, 0, 0, 1, 1,
-1.10516, 0.3282812, -2.013236, 0, 0, 0, 1, 1,
-1.103395, -0.3642451, -3.322798, 0, 0, 0, 1, 1,
-1.099274, 1.304728, 0.04618884, 0, 0, 0, 1, 1,
-1.092121, 1.320997, -1.572224, 0, 0, 0, 1, 1,
-1.090163, 1.561261, -2.30644, 0, 0, 0, 1, 1,
-1.086808, -0.9488886, -2.63664, 1, 1, 1, 1, 1,
-1.085531, 1.209045, -0.9310936, 1, 1, 1, 1, 1,
-1.081177, 0.09720217, -0.1163599, 1, 1, 1, 1, 1,
-1.079572, 2.401629, -0.7736974, 1, 1, 1, 1, 1,
-1.075232, -1.13122, -3.816385, 1, 1, 1, 1, 1,
-1.073615, 1.939827, -1.376304, 1, 1, 1, 1, 1,
-1.072529, 0.2558761, -1.244823, 1, 1, 1, 1, 1,
-1.069909, -0.9756851, -4.075925, 1, 1, 1, 1, 1,
-1.066548, 0.2838447, -0.7734817, 1, 1, 1, 1, 1,
-1.064692, -1.230873, -2.055823, 1, 1, 1, 1, 1,
-1.063629, -0.6675843, -3.235806, 1, 1, 1, 1, 1,
-1.055593, 0.07609221, -1.808524, 1, 1, 1, 1, 1,
-1.053624, 0.1452283, -1.416504, 1, 1, 1, 1, 1,
-1.051465, 2.167404, 0.5078614, 1, 1, 1, 1, 1,
-1.049418, 0.4071915, -2.578531, 1, 1, 1, 1, 1,
-1.047177, 2.958548, -2.869937, 0, 0, 1, 1, 1,
-1.045418, -0.1942503, -2.548719, 1, 0, 0, 1, 1,
-1.040638, 1.327186, 0.1596211, 1, 0, 0, 1, 1,
-1.036968, -2.131877, -4.040434, 1, 0, 0, 1, 1,
-1.034735, -0.03548075, -2.024792, 1, 0, 0, 1, 1,
-1.03226, 1.871648, -2.967139, 1, 0, 0, 1, 1,
-1.03157, -0.4124882, -0.8293986, 0, 0, 0, 1, 1,
-1.029408, -0.04275067, -0.6855829, 0, 0, 0, 1, 1,
-1.022915, 2.009273, -0.7069778, 0, 0, 0, 1, 1,
-1.019268, -0.7673025, -1.379331, 0, 0, 0, 1, 1,
-1.013863, -2.192355, -3.368075, 0, 0, 0, 1, 1,
-1.00973, 0.4236551, -2.687157, 0, 0, 0, 1, 1,
-0.9954191, 0.8229194, -2.93463, 0, 0, 0, 1, 1,
-0.9908864, -0.2837822, -0.805865, 1, 1, 1, 1, 1,
-0.9867584, -1.49984, -3.002823, 1, 1, 1, 1, 1,
-0.9795092, 0.7076589, -0.8405553, 1, 1, 1, 1, 1,
-0.9792587, 1.023831, -0.5680851, 1, 1, 1, 1, 1,
-0.9761015, -0.1339079, -1.222322, 1, 1, 1, 1, 1,
-0.9759675, 0.0297112, -0.05710891, 1, 1, 1, 1, 1,
-0.9719723, -1.704222, -2.636134, 1, 1, 1, 1, 1,
-0.9702496, -0.5130128, -3.815312, 1, 1, 1, 1, 1,
-0.9642256, 0.7109148, -1.589054, 1, 1, 1, 1, 1,
-0.9580239, -0.9274439, -1.313168, 1, 1, 1, 1, 1,
-0.9522494, -2.491301, -2.622652, 1, 1, 1, 1, 1,
-0.9447315, -0.4823668, -2.898901, 1, 1, 1, 1, 1,
-0.9411977, 0.2079207, -0.1857124, 1, 1, 1, 1, 1,
-0.9246022, -0.1487937, -1.106334, 1, 1, 1, 1, 1,
-0.9245462, -1.353192, -2.301143, 1, 1, 1, 1, 1,
-0.9178452, -1.207279, -0.8620855, 0, 0, 1, 1, 1,
-0.9166805, 0.9355867, 0.4969062, 1, 0, 0, 1, 1,
-0.9159146, -0.03700515, -0.1417602, 1, 0, 0, 1, 1,
-0.9150868, 0.2878539, 1.973883, 1, 0, 0, 1, 1,
-0.9134471, -0.6515459, -3.475534, 1, 0, 0, 1, 1,
-0.9122372, 0.145136, -0.5968006, 1, 0, 0, 1, 1,
-0.9048463, 0.7671974, -2.544499, 0, 0, 0, 1, 1,
-0.9033857, 0.3723097, -2.093529, 0, 0, 0, 1, 1,
-0.9032855, 0.1317922, -0.3106887, 0, 0, 0, 1, 1,
-0.8949434, 1.230766, 0.2328228, 0, 0, 0, 1, 1,
-0.8929828, 0.04161881, -2.081679, 0, 0, 0, 1, 1,
-0.892969, -0.8850654, -3.230947, 0, 0, 0, 1, 1,
-0.8829399, 0.1847847, -0.508936, 0, 0, 0, 1, 1,
-0.8732489, -0.9784536, -2.626491, 1, 1, 1, 1, 1,
-0.8729353, 0.2108975, -0.3264735, 1, 1, 1, 1, 1,
-0.8611637, 1.048585, -2.387583, 1, 1, 1, 1, 1,
-0.8583023, 2.096017, 0.5981168, 1, 1, 1, 1, 1,
-0.8533933, -0.1714635, -2.023482, 1, 1, 1, 1, 1,
-0.8524182, -0.06035814, -3.882241, 1, 1, 1, 1, 1,
-0.8392575, -0.4664437, -2.176356, 1, 1, 1, 1, 1,
-0.8383456, -1.330855, -4.787876, 1, 1, 1, 1, 1,
-0.8292536, 0.07161149, 0.7692292, 1, 1, 1, 1, 1,
-0.824601, -0.8783223, -2.226431, 1, 1, 1, 1, 1,
-0.8216159, 0.8987225, -0.03242188, 1, 1, 1, 1, 1,
-0.8215289, -1.233212, -2.568077, 1, 1, 1, 1, 1,
-0.8206235, -0.2913651, -2.645225, 1, 1, 1, 1, 1,
-0.8194071, 1.469966, -0.11442, 1, 1, 1, 1, 1,
-0.8165128, -1.759078, -2.518932, 1, 1, 1, 1, 1,
-0.8126851, 0.9533615, -1.306992, 0, 0, 1, 1, 1,
-0.8123481, 0.796865, -0.7545712, 1, 0, 0, 1, 1,
-0.8021738, -1.176796, -1.111598, 1, 0, 0, 1, 1,
-0.8020625, -0.006122165, -2.834374, 1, 0, 0, 1, 1,
-0.8009464, 1.471111, -1.407809, 1, 0, 0, 1, 1,
-0.7914556, 2.879626, 0.0123531, 1, 0, 0, 1, 1,
-0.7826961, 1.08526, -0.8590024, 0, 0, 0, 1, 1,
-0.7821564, -1.950038, -1.570817, 0, 0, 0, 1, 1,
-0.7746104, -0.5630521, -1.17588, 0, 0, 0, 1, 1,
-0.770129, -1.136354, -1.071209, 0, 0, 0, 1, 1,
-0.7689444, 0.4986799, -1.175746, 0, 0, 0, 1, 1,
-0.7639954, 0.6330996, -1.165892, 0, 0, 0, 1, 1,
-0.7597733, -0.6358873, -1.112649, 0, 0, 0, 1, 1,
-0.7593262, -0.9801069, -3.215077, 1, 1, 1, 1, 1,
-0.7582802, 0.30411, -1.140879, 1, 1, 1, 1, 1,
-0.7562481, 1.179932, -1.399169, 1, 1, 1, 1, 1,
-0.7561248, 1.704156, -1.471001, 1, 1, 1, 1, 1,
-0.7556459, 0.7963364, -0.786727, 1, 1, 1, 1, 1,
-0.7521401, 0.02811993, 0.1574968, 1, 1, 1, 1, 1,
-0.746103, -0.2963647, -2.449576, 1, 1, 1, 1, 1,
-0.7436143, 1.306958, -2.307214, 1, 1, 1, 1, 1,
-0.7434661, 1.152806, -0.7487108, 1, 1, 1, 1, 1,
-0.7433457, 1.300631, -1.76074, 1, 1, 1, 1, 1,
-0.7431804, 0.7461793, -0.2206712, 1, 1, 1, 1, 1,
-0.7420346, -0.1804438, -1.621035, 1, 1, 1, 1, 1,
-0.7416735, 0.08832025, -1.175344, 1, 1, 1, 1, 1,
-0.7391227, 1.007697, 1.809326, 1, 1, 1, 1, 1,
-0.7331468, -0.1265967, -2.436497, 1, 1, 1, 1, 1,
-0.7280095, -2.417187, -4.859045, 0, 0, 1, 1, 1,
-0.725123, -0.4891016, -1.895283, 1, 0, 0, 1, 1,
-0.7241205, -1.017554, -1.242468, 1, 0, 0, 1, 1,
-0.7197053, 0.9099911, -1.103047, 1, 0, 0, 1, 1,
-0.7172794, -0.2377496, -2.446516, 1, 0, 0, 1, 1,
-0.71136, -1.43094, -1.701242, 1, 0, 0, 1, 1,
-0.7109818, 1.503551, -0.4042364, 0, 0, 0, 1, 1,
-0.7074946, -1.09743, -0.1463017, 0, 0, 0, 1, 1,
-0.7051818, 0.2798048, -2.202514, 0, 0, 0, 1, 1,
-0.7032866, 0.2784803, -2.94226, 0, 0, 0, 1, 1,
-0.6989645, 0.9186298, 0.6815577, 0, 0, 0, 1, 1,
-0.6962745, 1.27461, 0.1934059, 0, 0, 0, 1, 1,
-0.6921699, 0.7345207, -0.9940111, 0, 0, 0, 1, 1,
-0.6901907, -0.1212236, -0.8678778, 1, 1, 1, 1, 1,
-0.687907, 0.7836011, -0.4472831, 1, 1, 1, 1, 1,
-0.687033, 0.9407653, -0.1005811, 1, 1, 1, 1, 1,
-0.6858077, -1.794702, -2.017443, 1, 1, 1, 1, 1,
-0.6752764, 1.256947, -0.03964105, 1, 1, 1, 1, 1,
-0.6725811, 0.5045078, -1.109012, 1, 1, 1, 1, 1,
-0.6665179, -0.1364663, -2.122006, 1, 1, 1, 1, 1,
-0.6582515, -1.240553, -3.008535, 1, 1, 1, 1, 1,
-0.657281, -0.2486713, -1.814064, 1, 1, 1, 1, 1,
-0.6525363, 0.7787694, -1.016048, 1, 1, 1, 1, 1,
-0.6515066, 0.352188, 0.2588894, 1, 1, 1, 1, 1,
-0.6493298, -0.4162547, -4.398118, 1, 1, 1, 1, 1,
-0.6447248, -1.106771, -1.650307, 1, 1, 1, 1, 1,
-0.6403957, 0.02976335, -1.276845, 1, 1, 1, 1, 1,
-0.6402307, 1.080383, -0.508155, 1, 1, 1, 1, 1,
-0.6287448, 1.557508, 0.1597781, 0, 0, 1, 1, 1,
-0.6256286, -0.9659917, -3.863499, 1, 0, 0, 1, 1,
-0.622435, 2.064669, 0.406907, 1, 0, 0, 1, 1,
-0.6187823, 0.8772831, -0.4636164, 1, 0, 0, 1, 1,
-0.6113971, 0.4941725, -1.014582, 1, 0, 0, 1, 1,
-0.6090827, 0.3988992, 0.01667683, 1, 0, 0, 1, 1,
-0.6084529, -0.9052101, -1.234282, 0, 0, 0, 1, 1,
-0.6071035, -0.1593364, -1.504503, 0, 0, 0, 1, 1,
-0.6040388, -0.6930277, -2.197762, 0, 0, 0, 1, 1,
-0.5951599, -1.003195, -4.106042, 0, 0, 0, 1, 1,
-0.5927873, 1.068532, 1.379523, 0, 0, 0, 1, 1,
-0.5922852, -1.059196, -2.542312, 0, 0, 0, 1, 1,
-0.5913509, 0.2621493, -0.7863511, 0, 0, 0, 1, 1,
-0.5884907, -1.70111, -1.961393, 1, 1, 1, 1, 1,
-0.5852376, 0.5612735, -0.9309263, 1, 1, 1, 1, 1,
-0.5758801, 0.4654623, -0.7956846, 1, 1, 1, 1, 1,
-0.5741578, 0.08749492, -1.971961, 1, 1, 1, 1, 1,
-0.5672984, -0.5132014, -2.365488, 1, 1, 1, 1, 1,
-0.5639989, 0.3975159, -0.9749032, 1, 1, 1, 1, 1,
-0.5631686, -0.3320122, -0.6113815, 1, 1, 1, 1, 1,
-0.5629169, -1.611571, -3.216602, 1, 1, 1, 1, 1,
-0.5590255, -0.1699233, -1.797836, 1, 1, 1, 1, 1,
-0.5556045, 0.2807313, -0.5989431, 1, 1, 1, 1, 1,
-0.5513741, -0.2669364, -2.396703, 1, 1, 1, 1, 1,
-0.5493652, 0.2725229, -1.114882, 1, 1, 1, 1, 1,
-0.5468703, -0.1862681, -3.141266, 1, 1, 1, 1, 1,
-0.5452054, -2.465446, -2.207254, 1, 1, 1, 1, 1,
-0.5432796, -2.051257, -3.942977, 1, 1, 1, 1, 1,
-0.5398022, 0.6068393, -2.569778, 0, 0, 1, 1, 1,
-0.5386354, -0.5767253, -1.413743, 1, 0, 0, 1, 1,
-0.5297861, -0.4576219, -1.45524, 1, 0, 0, 1, 1,
-0.5271092, -0.9045289, -1.331483, 1, 0, 0, 1, 1,
-0.5261046, -0.4727913, -3.500386, 1, 0, 0, 1, 1,
-0.5241739, 0.3305168, 0.6911134, 1, 0, 0, 1, 1,
-0.5230691, -0.9551709, -2.815873, 0, 0, 0, 1, 1,
-0.5218518, 0.7842237, -0.5324194, 0, 0, 0, 1, 1,
-0.513887, 0.2440211, -1.23074, 0, 0, 0, 1, 1,
-0.5130202, -0.6874249, -1.860902, 0, 0, 0, 1, 1,
-0.5119012, 0.630259, -1.519537, 0, 0, 0, 1, 1,
-0.5096003, 1.399684, -0.7157347, 0, 0, 0, 1, 1,
-0.5079218, -0.9377505, -3.905232, 0, 0, 0, 1, 1,
-0.5024326, -0.5462939, -2.258074, 1, 1, 1, 1, 1,
-0.5013632, 0.4555159, -0.5844066, 1, 1, 1, 1, 1,
-0.495827, 1.038685, -1.287861, 1, 1, 1, 1, 1,
-0.4912338, -0.8152296, -1.772324, 1, 1, 1, 1, 1,
-0.4877332, -0.4120191, -2.777302, 1, 1, 1, 1, 1,
-0.4847471, -0.7065332, -3.200626, 1, 1, 1, 1, 1,
-0.4846201, -0.3103198, -2.648536, 1, 1, 1, 1, 1,
-0.4812877, -1.699193, -3.481898, 1, 1, 1, 1, 1,
-0.4791348, 0.3514518, -2.324076, 1, 1, 1, 1, 1,
-0.476402, -0.05322372, -0.2872848, 1, 1, 1, 1, 1,
-0.4705724, -0.1240153, -0.5300319, 1, 1, 1, 1, 1,
-0.4695769, 1.634795, -0.03308975, 1, 1, 1, 1, 1,
-0.46567, -0.9286129, -3.481288, 1, 1, 1, 1, 1,
-0.461191, -0.5871961, -3.002762, 1, 1, 1, 1, 1,
-0.4609198, -2.834043, -2.916659, 1, 1, 1, 1, 1,
-0.460513, -1.311049, -2.170303, 0, 0, 1, 1, 1,
-0.4603221, 0.2256456, -0.6226884, 1, 0, 0, 1, 1,
-0.4580642, -0.4661506, -2.434601, 1, 0, 0, 1, 1,
-0.4469399, 0.3436521, -1.925885, 1, 0, 0, 1, 1,
-0.4427599, 0.3543524, 0.7949685, 1, 0, 0, 1, 1,
-0.4408789, 1.31389, -1.131415, 1, 0, 0, 1, 1,
-0.4373792, 1.037802, -0.7530281, 0, 0, 0, 1, 1,
-0.431142, 0.9055035, 0.01905833, 0, 0, 0, 1, 1,
-0.4302742, 0.8040903, -0.2569982, 0, 0, 0, 1, 1,
-0.4299112, 1.191965, 0.4337424, 0, 0, 0, 1, 1,
-0.4280198, 0.5626279, -0.583539, 0, 0, 0, 1, 1,
-0.4268051, -1.843917, -2.740642, 0, 0, 0, 1, 1,
-0.4245062, -1.596714, -2.463283, 0, 0, 0, 1, 1,
-0.4235442, 0.6105232, -2.107464, 1, 1, 1, 1, 1,
-0.4234808, -0.3916892, -1.07294, 1, 1, 1, 1, 1,
-0.4227556, 1.417547, 0.5318936, 1, 1, 1, 1, 1,
-0.411121, -0.730107, -3.73132, 1, 1, 1, 1, 1,
-0.4062189, -0.3304304, -1.397819, 1, 1, 1, 1, 1,
-0.4059284, -1.469916, -2.848346, 1, 1, 1, 1, 1,
-0.4057875, -0.3986986, -3.355756, 1, 1, 1, 1, 1,
-0.4052219, -0.3336741, -1.644726, 1, 1, 1, 1, 1,
-0.4004994, -0.006781156, -0.5870119, 1, 1, 1, 1, 1,
-0.3987071, -0.5292087, -2.345438, 1, 1, 1, 1, 1,
-0.396453, -1.580354, -1.474828, 1, 1, 1, 1, 1,
-0.3915043, -0.7109097, -2.88772, 1, 1, 1, 1, 1,
-0.3835361, -0.6385435, -2.202156, 1, 1, 1, 1, 1,
-0.3760657, -2.059055, -2.157465, 1, 1, 1, 1, 1,
-0.372264, -0.3605625, -1.181397, 1, 1, 1, 1, 1,
-0.3707701, -0.945059, -2.275386, 0, 0, 1, 1, 1,
-0.3604201, 0.1987473, -0.4597735, 1, 0, 0, 1, 1,
-0.3603017, 0.2407649, -0.287237, 1, 0, 0, 1, 1,
-0.3515791, 1.195565, 0.06629489, 1, 0, 0, 1, 1,
-0.3492811, -0.213458, -3.693503, 1, 0, 0, 1, 1,
-0.3447725, 1.24473, -0.7627649, 1, 0, 0, 1, 1,
-0.339483, -1.003402, -3.052107, 0, 0, 0, 1, 1,
-0.3383683, -0.3359703, -3.866945, 0, 0, 0, 1, 1,
-0.3372699, -1.09839, -2.365013, 0, 0, 0, 1, 1,
-0.3260128, -0.3859188, -2.075214, 0, 0, 0, 1, 1,
-0.3223526, -0.5581492, -3.028661, 0, 0, 0, 1, 1,
-0.3210688, 0.2613647, 0.4821898, 0, 0, 0, 1, 1,
-0.3173188, 0.03486943, -2.729148, 0, 0, 0, 1, 1,
-0.3140319, -1.02375, -1.674986, 1, 1, 1, 1, 1,
-0.3140056, 0.7719458, -0.3611814, 1, 1, 1, 1, 1,
-0.3107889, 0.6418374, -0.8994594, 1, 1, 1, 1, 1,
-0.3063633, 0.8107857, -0.09313924, 1, 1, 1, 1, 1,
-0.3011954, 0.3162501, -1.032153, 1, 1, 1, 1, 1,
-0.2939245, -0.5388924, -1.258315, 1, 1, 1, 1, 1,
-0.293381, 1.647232, -0.4477782, 1, 1, 1, 1, 1,
-0.2907007, -0.1007706, -2.16677, 1, 1, 1, 1, 1,
-0.2897794, 1.325716, 0.3396867, 1, 1, 1, 1, 1,
-0.2863069, -0.3516347, -0.6878898, 1, 1, 1, 1, 1,
-0.2862012, 2.548802, 0.05648686, 1, 1, 1, 1, 1,
-0.283727, 1.355465, -0.6826443, 1, 1, 1, 1, 1,
-0.2777785, 1.118208, -1.726689, 1, 1, 1, 1, 1,
-0.2745468, 0.9960944, 0.6560544, 1, 1, 1, 1, 1,
-0.2728248, -0.7693239, -4.543623, 1, 1, 1, 1, 1,
-0.2714037, 1.370193, -1.531827, 0, 0, 1, 1, 1,
-0.2712307, -1.319522, -3.353878, 1, 0, 0, 1, 1,
-0.2708039, 0.6087429, -0.476006, 1, 0, 0, 1, 1,
-0.2636416, -0.2405156, -4.209323, 1, 0, 0, 1, 1,
-0.2631245, -0.2358544, -2.529291, 1, 0, 0, 1, 1,
-0.2595827, 0.3894461, 0.178687, 1, 0, 0, 1, 1,
-0.2571446, -0.04866326, -1.428328, 0, 0, 0, 1, 1,
-0.2546562, -0.5072598, -2.550951, 0, 0, 0, 1, 1,
-0.2531629, 0.02344437, -3.222537, 0, 0, 0, 1, 1,
-0.25001, -0.3772328, -4.177022, 0, 0, 0, 1, 1,
-0.2490324, 0.9153234, -0.743639, 0, 0, 0, 1, 1,
-0.2464099, -0.20494, -4.654197, 0, 0, 0, 1, 1,
-0.2457412, 0.6237072, -1.594406, 0, 0, 0, 1, 1,
-0.2399782, -0.8717716, -3.556785, 1, 1, 1, 1, 1,
-0.2368118, 0.02709104, 0.4692922, 1, 1, 1, 1, 1,
-0.2363, -1.194714, -0.858496, 1, 1, 1, 1, 1,
-0.2355171, -1.616249, -3.035884, 1, 1, 1, 1, 1,
-0.2322786, -0.01117155, -0.6207384, 1, 1, 1, 1, 1,
-0.2304136, -0.320904, -0.3400488, 1, 1, 1, 1, 1,
-0.2263907, -0.8512246, -2.05053, 1, 1, 1, 1, 1,
-0.2222863, 0.1380548, -2.078147, 1, 1, 1, 1, 1,
-0.219585, 1.154145, 1.462156, 1, 1, 1, 1, 1,
-0.2187412, 0.8861641, -0.2891428, 1, 1, 1, 1, 1,
-0.2174281, 0.9944381, -0.2400847, 1, 1, 1, 1, 1,
-0.2157265, -1.294653, -3.040462, 1, 1, 1, 1, 1,
-0.210313, -0.8487249, -2.881177, 1, 1, 1, 1, 1,
-0.2084297, 0.276477, -2.576151, 1, 1, 1, 1, 1,
-0.2075029, 0.7054146, -0.7233954, 1, 1, 1, 1, 1,
-0.2048848, -1.831161, -3.917254, 0, 0, 1, 1, 1,
-0.2043542, -0.01336036, -2.836065, 1, 0, 0, 1, 1,
-0.2037237, -0.063447, -3.89829, 1, 0, 0, 1, 1,
-0.1951823, -0.1493747, -2.331613, 1, 0, 0, 1, 1,
-0.1928191, 1.733241, 0.3435878, 1, 0, 0, 1, 1,
-0.1920496, 0.4668819, -0.1890738, 1, 0, 0, 1, 1,
-0.1915489, -0.407515, -2.348005, 0, 0, 0, 1, 1,
-0.1903098, -1.826405, -3.218256, 0, 0, 0, 1, 1,
-0.1898155, 1.357332, 0.06513502, 0, 0, 0, 1, 1,
-0.1897092, -0.1197101, -2.77265, 0, 0, 0, 1, 1,
-0.1821923, 0.09011611, -0.2072798, 0, 0, 0, 1, 1,
-0.1801862, -0.9099663, -2.460859, 0, 0, 0, 1, 1,
-0.179558, -0.7240339, -3.502814, 0, 0, 0, 1, 1,
-0.1793407, -1.144016, -3.298229, 1, 1, 1, 1, 1,
-0.1791243, 1.402128, -0.5949865, 1, 1, 1, 1, 1,
-0.1786414, -1.444486, -2.239578, 1, 1, 1, 1, 1,
-0.1764426, -0.4104171, -2.001356, 1, 1, 1, 1, 1,
-0.1698629, -0.5236217, -3.326984, 1, 1, 1, 1, 1,
-0.1693982, 1.626418, 0.8336359, 1, 1, 1, 1, 1,
-0.1686366, 0.2264835, -1.116819, 1, 1, 1, 1, 1,
-0.168294, -0.1367734, -3.308321, 1, 1, 1, 1, 1,
-0.1669482, -0.1925463, -0.5720795, 1, 1, 1, 1, 1,
-0.165479, 0.925812, 0.4731104, 1, 1, 1, 1, 1,
-0.1629122, -0.01522779, -1.482091, 1, 1, 1, 1, 1,
-0.1583558, -1.376722, -4.248263, 1, 1, 1, 1, 1,
-0.1543835, 0.3165932, 0.8856188, 1, 1, 1, 1, 1,
-0.1540134, -0.7284948, -1.855581, 1, 1, 1, 1, 1,
-0.1516966, 0.5327739, -0.06352822, 1, 1, 1, 1, 1,
-0.1507914, 1.42972, 0.3166248, 0, 0, 1, 1, 1,
-0.1494726, 2.795739, 0.02081178, 1, 0, 0, 1, 1,
-0.1439892, 0.8050719, 0.004149095, 1, 0, 0, 1, 1,
-0.1436242, 0.002935193, -1.272286, 1, 0, 0, 1, 1,
-0.1332618, -0.2899282, -1.720071, 1, 0, 0, 1, 1,
-0.1330375, 0.3634929, 0.2979168, 1, 0, 0, 1, 1,
-0.132719, 0.1493188, -0.7132719, 0, 0, 0, 1, 1,
-0.1323785, -0.6293215, -2.266439, 0, 0, 0, 1, 1,
-0.1321077, 0.9323756, -1.701119, 0, 0, 0, 1, 1,
-0.1312678, -0.9106889, -3.430217, 0, 0, 0, 1, 1,
-0.1266085, 2.648067, -0.1051265, 0, 0, 0, 1, 1,
-0.1243332, -1.03352, -3.05951, 0, 0, 0, 1, 1,
-0.1240511, 0.26554, 0.8310548, 0, 0, 0, 1, 1,
-0.1238014, -0.03662458, -2.302112, 1, 1, 1, 1, 1,
-0.1168165, -0.2133414, -3.697962, 1, 1, 1, 1, 1,
-0.1156219, 1.316492, 0.07874806, 1, 1, 1, 1, 1,
-0.1103352, -0.8082298, -3.077867, 1, 1, 1, 1, 1,
-0.1085175, 0.04409225, 0.05259602, 1, 1, 1, 1, 1,
-0.105621, 2.051667, 1.916859, 1, 1, 1, 1, 1,
-0.1040641, -1.554459, -3.459881, 1, 1, 1, 1, 1,
-0.1026247, 1.057577, 0.05720391, 1, 1, 1, 1, 1,
-0.0951165, -1.960716, -3.224937, 1, 1, 1, 1, 1,
-0.09505213, -0.6878748, -3.428907, 1, 1, 1, 1, 1,
-0.09389627, -1.144941, -2.988713, 1, 1, 1, 1, 1,
-0.09298898, 0.3384123, -1.625592, 1, 1, 1, 1, 1,
-0.08291239, -0.08706089, -2.74697, 1, 1, 1, 1, 1,
-0.08290634, -0.1549948, -2.924288, 1, 1, 1, 1, 1,
-0.08256136, -1.566263, -1.396654, 1, 1, 1, 1, 1,
-0.08040021, -0.06074341, -3.064696, 0, 0, 1, 1, 1,
-0.07914094, 0.04940994, -1.000129, 1, 0, 0, 1, 1,
-0.07755606, 0.2934519, 1.398607, 1, 0, 0, 1, 1,
-0.07421109, 0.10557, -1.478745, 1, 0, 0, 1, 1,
-0.0741924, -0.7763093, -2.441531, 1, 0, 0, 1, 1,
-0.07360946, 0.03150902, -1.00016, 1, 0, 0, 1, 1,
-0.07330997, 0.05754704, -1.583825, 0, 0, 0, 1, 1,
-0.07249176, -1.390319, -0.8071815, 0, 0, 0, 1, 1,
-0.07056041, -1.324113, -3.03353, 0, 0, 0, 1, 1,
-0.07029475, 0.5986609, 0.1823393, 0, 0, 0, 1, 1,
-0.06882872, -1.287252, -3.91864, 0, 0, 0, 1, 1,
-0.06754415, -0.45629, -4.087287, 0, 0, 0, 1, 1,
-0.06318585, 0.4115092, -1.130324, 0, 0, 0, 1, 1,
-0.06223542, 1.329078, 0.3997599, 1, 1, 1, 1, 1,
-0.05953379, -0.1782547, -3.624376, 1, 1, 1, 1, 1,
-0.05688412, 0.1078288, 0.4293552, 1, 1, 1, 1, 1,
-0.05495759, -0.4049567, -3.674686, 1, 1, 1, 1, 1,
-0.05321478, 0.5244133, -1.543234, 1, 1, 1, 1, 1,
-0.05265603, -0.1997949, -3.479844, 1, 1, 1, 1, 1,
-0.05040822, -1.295493, -3.604192, 1, 1, 1, 1, 1,
-0.05025353, -0.6693705, -1.530286, 1, 1, 1, 1, 1,
-0.0495965, -1.824006, -3.89539, 1, 1, 1, 1, 1,
-0.049434, -2.063735, -4.337543, 1, 1, 1, 1, 1,
-0.04901206, -0.9282297, -3.1943, 1, 1, 1, 1, 1,
-0.04658695, -0.7191752, -4.818331, 1, 1, 1, 1, 1,
-0.04649256, -0.103394, -2.617962, 1, 1, 1, 1, 1,
-0.04632454, 0.9265848, 0.738459, 1, 1, 1, 1, 1,
-0.04553362, -1.100604, -1.924267, 1, 1, 1, 1, 1,
-0.04388799, -2.186878, -3.035126, 0, 0, 1, 1, 1,
-0.04378423, -0.7949194, -2.328393, 1, 0, 0, 1, 1,
-0.04034781, -0.2753954, -2.762837, 1, 0, 0, 1, 1,
-0.03080105, -0.4399468, -5.456961, 1, 0, 0, 1, 1,
-0.02956896, 0.7524291, 0.1564529, 1, 0, 0, 1, 1,
-0.02919233, -2.527872, -2.192539, 1, 0, 0, 1, 1,
-0.02881065, 0.06193179, 0.5721152, 0, 0, 0, 1, 1,
-0.0273319, 0.3905576, 0.6366189, 0, 0, 0, 1, 1,
-0.01956964, -0.5920922, -3.819431, 0, 0, 0, 1, 1,
-0.01900683, 0.53686, 0.9747135, 0, 0, 0, 1, 1,
-0.01610931, -0.2239164, -1.786412, 0, 0, 0, 1, 1,
0.002528402, -2.082557, 1.939975, 0, 0, 0, 1, 1,
0.006371372, 0.287498, -0.1761017, 0, 0, 0, 1, 1,
0.007510343, -1.004033, 3.866002, 1, 1, 1, 1, 1,
0.009442857, -2.246272, 3.293733, 1, 1, 1, 1, 1,
0.01502787, -0.5131533, 3.180289, 1, 1, 1, 1, 1,
0.01815556, -0.7781696, 2.59486, 1, 1, 1, 1, 1,
0.02291868, -0.4097836, 3.458543, 1, 1, 1, 1, 1,
0.024021, 1.825974, -0.28021, 1, 1, 1, 1, 1,
0.02731079, -1.654475, 2.584664, 1, 1, 1, 1, 1,
0.02953095, -0.3602308, 1.790843, 1, 1, 1, 1, 1,
0.02969821, 0.5889412, -0.9912376, 1, 1, 1, 1, 1,
0.03036317, 1.922029, 0.1269784, 1, 1, 1, 1, 1,
0.03047786, -0.299877, 2.588941, 1, 1, 1, 1, 1,
0.03117279, 0.7933369, -0.2510084, 1, 1, 1, 1, 1,
0.03224504, 0.2887516, 0.401626, 1, 1, 1, 1, 1,
0.03332829, -0.5199174, 3.471113, 1, 1, 1, 1, 1,
0.03488776, -0.7084186, 1.860165, 1, 1, 1, 1, 1,
0.03582158, -0.4325957, 3.135324, 0, 0, 1, 1, 1,
0.04556639, 0.9044715, 1.604906, 1, 0, 0, 1, 1,
0.04710196, -0.2513716, 0.8366277, 1, 0, 0, 1, 1,
0.04808703, -0.9658337, 3.358041, 1, 0, 0, 1, 1,
0.0506591, 0.7316729, -0.1562147, 1, 0, 0, 1, 1,
0.05260704, 1.076668, -1.735279, 1, 0, 0, 1, 1,
0.06105113, 1.053425, 1.292576, 0, 0, 0, 1, 1,
0.06300079, 2.130327, -0.2381436, 0, 0, 0, 1, 1,
0.06323531, -0.04334539, 0.8554476, 0, 0, 0, 1, 1,
0.06361905, 0.02687776, 2.287618, 0, 0, 0, 1, 1,
0.06374083, -0.09337442, 2.304116, 0, 0, 0, 1, 1,
0.06546667, 0.7196426, 0.06758681, 0, 0, 0, 1, 1,
0.06616378, 0.7615412, -1.504392, 0, 0, 0, 1, 1,
0.07048727, 0.299325, 1.191549, 1, 1, 1, 1, 1,
0.07828894, -0.08926548, 2.662453, 1, 1, 1, 1, 1,
0.0824635, -0.05559022, 0.8094139, 1, 1, 1, 1, 1,
0.08272087, 0.9579396, 0.2683217, 1, 1, 1, 1, 1,
0.0832654, 0.005204516, 1.885892, 1, 1, 1, 1, 1,
0.08788813, 0.03896141, 0.4880332, 1, 1, 1, 1, 1,
0.08895035, 0.05516497, 0.8481169, 1, 1, 1, 1, 1,
0.09096728, 1.271388, -1.64133, 1, 1, 1, 1, 1,
0.09199058, -0.9507399, 2.270573, 1, 1, 1, 1, 1,
0.09257979, -1.769867, 2.676646, 1, 1, 1, 1, 1,
0.0967705, -0.227928, 3.916046, 1, 1, 1, 1, 1,
0.1030185, 1.304964, 0.9700279, 1, 1, 1, 1, 1,
0.1055733, -0.9590085, 2.693656, 1, 1, 1, 1, 1,
0.1056034, -1.082555, 3.570319, 1, 1, 1, 1, 1,
0.1109698, 1.814153, -0.1476768, 1, 1, 1, 1, 1,
0.1168229, 0.4456391, 0.5702698, 0, 0, 1, 1, 1,
0.1181963, 0.5165455, 0.6011111, 1, 0, 0, 1, 1,
0.1188447, 1.975598, 0.5065812, 1, 0, 0, 1, 1,
0.1233177, 0.7918757, -1.338738, 1, 0, 0, 1, 1,
0.1268259, -1.035077, 4.130147, 1, 0, 0, 1, 1,
0.1277775, 0.3116961, 0.4569111, 1, 0, 0, 1, 1,
0.129107, 0.03363752, 2.026779, 0, 0, 0, 1, 1,
0.1299414, -0.4313227, 2.573007, 0, 0, 0, 1, 1,
0.1301768, 0.1762364, 1.208017, 0, 0, 0, 1, 1,
0.1355314, 0.3496705, 3.044209, 0, 0, 0, 1, 1,
0.1394891, -0.7797022, 3.901378, 0, 0, 0, 1, 1,
0.1413551, 0.8941767, -0.08493836, 0, 0, 0, 1, 1,
0.1454729, -0.8859406, 3.28035, 0, 0, 0, 1, 1,
0.1491913, 1.32869, 1.906513, 1, 1, 1, 1, 1,
0.1491935, -0.07703719, 3.062391, 1, 1, 1, 1, 1,
0.1569527, -0.02169154, 1.014321, 1, 1, 1, 1, 1,
0.159565, -1.406078, 3.463732, 1, 1, 1, 1, 1,
0.1636065, 0.6280709, 1.262369, 1, 1, 1, 1, 1,
0.1684426, -1.096132, 3.223899, 1, 1, 1, 1, 1,
0.1690761, 1.063434, 0.2143279, 1, 1, 1, 1, 1,
0.1699301, 1.050376, -0.7203126, 1, 1, 1, 1, 1,
0.1726983, -0.6114116, 3.39343, 1, 1, 1, 1, 1,
0.1756221, -1.022915, 3.636646, 1, 1, 1, 1, 1,
0.1782099, 1.898128, 1.351599, 1, 1, 1, 1, 1,
0.182595, 0.9623118, 0.04730074, 1, 1, 1, 1, 1,
0.1842188, 1.849839, -0.9155813, 1, 1, 1, 1, 1,
0.1898175, 1.036512, -1.5718, 1, 1, 1, 1, 1,
0.1936522, -0.4848383, 2.745826, 1, 1, 1, 1, 1,
0.1968742, -0.196549, 3.357381, 0, 0, 1, 1, 1,
0.2020342, 1.733346, 0.879854, 1, 0, 0, 1, 1,
0.2031617, 2.468725, 1.341108, 1, 0, 0, 1, 1,
0.2041941, -0.03700462, 2.413415, 1, 0, 0, 1, 1,
0.2051288, -0.2829591, 3.647439, 1, 0, 0, 1, 1,
0.2081141, 1.499272, -1.490874, 1, 0, 0, 1, 1,
0.2093772, -0.3887432, 2.201113, 0, 0, 0, 1, 1,
0.2098209, 1.188324, 1.360162, 0, 0, 0, 1, 1,
0.2102153, -1.901003, 3.836827, 0, 0, 0, 1, 1,
0.2124873, -0.07789133, -0.4352648, 0, 0, 0, 1, 1,
0.2129073, -2.331785, 3.796868, 0, 0, 0, 1, 1,
0.2131996, -0.3102798, 2.325227, 0, 0, 0, 1, 1,
0.2223853, -1.396382, 2.670173, 0, 0, 0, 1, 1,
0.2268697, -1.074086, 1.751792, 1, 1, 1, 1, 1,
0.2376052, 0.2691064, 1.864475, 1, 1, 1, 1, 1,
0.2394603, -0.8063354, 1.305992, 1, 1, 1, 1, 1,
0.2404831, 0.6451744, 1.67768, 1, 1, 1, 1, 1,
0.2406414, -0.09532669, 2.050166, 1, 1, 1, 1, 1,
0.2465126, 0.0521776, 1.837086, 1, 1, 1, 1, 1,
0.249298, -1.47255, 2.263757, 1, 1, 1, 1, 1,
0.2500063, 0.0258665, 1.655454, 1, 1, 1, 1, 1,
0.2514511, 0.6828157, 0.3187249, 1, 1, 1, 1, 1,
0.2533292, -0.3710043, 1.968375, 1, 1, 1, 1, 1,
0.2564023, 0.4181023, 0.1638464, 1, 1, 1, 1, 1,
0.2591921, 1.718336, 0.2706289, 1, 1, 1, 1, 1,
0.2621268, 0.8682389, 1.46944, 1, 1, 1, 1, 1,
0.2649729, -0.3551427, 1.231269, 1, 1, 1, 1, 1,
0.2674008, -1.281801, 3.009931, 1, 1, 1, 1, 1,
0.2695316, -0.3728882, 2.905878, 0, 0, 1, 1, 1,
0.2702071, 0.4062853, -0.5377183, 1, 0, 0, 1, 1,
0.2737115, -0.4832746, 3.21238, 1, 0, 0, 1, 1,
0.2762761, -0.0676436, -0.161246, 1, 0, 0, 1, 1,
0.281433, 0.7783049, 1.479443, 1, 0, 0, 1, 1,
0.2863996, -1.292014, 1.910647, 1, 0, 0, 1, 1,
0.2879437, 0.08457441, 0.7893709, 0, 0, 0, 1, 1,
0.2950139, 0.1180419, 0.3186221, 0, 0, 0, 1, 1,
0.2956395, 0.5829434, -0.03605674, 0, 0, 0, 1, 1,
0.297278, -1.483628, 5.137584, 0, 0, 0, 1, 1,
0.3017473, -0.3562848, 1.407476, 0, 0, 0, 1, 1,
0.3077132, 1.636992, 0.4748614, 0, 0, 0, 1, 1,
0.307864, 0.717134, 2.704206, 0, 0, 0, 1, 1,
0.3084294, -2.352981, 2.435565, 1, 1, 1, 1, 1,
0.3091868, -0.448661, 4.416523, 1, 1, 1, 1, 1,
0.31021, 1.444024, -0.7018757, 1, 1, 1, 1, 1,
0.3136529, 1.001282, -0.5767862, 1, 1, 1, 1, 1,
0.3174741, -0.7921622, 2.171179, 1, 1, 1, 1, 1,
0.3197098, 0.05197803, 0.3821227, 1, 1, 1, 1, 1,
0.321295, 0.3633843, 0.179076, 1, 1, 1, 1, 1,
0.3216053, 1.376511, -0.8143213, 1, 1, 1, 1, 1,
0.3224172, -0.2270588, 2.387711, 1, 1, 1, 1, 1,
0.3227541, 1.877445, 1.759385, 1, 1, 1, 1, 1,
0.3261609, -0.6560706, 2.423648, 1, 1, 1, 1, 1,
0.3342887, -1.20154, 1.6482, 1, 1, 1, 1, 1,
0.3369599, 0.1101085, 1.8806, 1, 1, 1, 1, 1,
0.3394446, -0.1450824, 1.596898, 1, 1, 1, 1, 1,
0.3439931, 1.46694, 1.359937, 1, 1, 1, 1, 1,
0.3453759, 1.747873, 0.8878018, 0, 0, 1, 1, 1,
0.3481157, -0.9391968, 2.161743, 1, 0, 0, 1, 1,
0.349685, 0.8977108, -0.5058802, 1, 0, 0, 1, 1,
0.3531398, -1.371343, 2.794458, 1, 0, 0, 1, 1,
0.3532967, -2.294381, 3.352946, 1, 0, 0, 1, 1,
0.3538248, -2.324776, 4.105546, 1, 0, 0, 1, 1,
0.3546332, -0.4958678, 1.754859, 0, 0, 0, 1, 1,
0.362105, -1.145743, 2.390373, 0, 0, 0, 1, 1,
0.3637906, -0.5189164, 1.029903, 0, 0, 0, 1, 1,
0.3682455, 0.7943695, -0.3896737, 0, 0, 0, 1, 1,
0.3742807, -1.405164, 4.377865, 0, 0, 0, 1, 1,
0.3780578, -0.7507005, 2.415134, 0, 0, 0, 1, 1,
0.3818337, -0.5921375, 3.092482, 0, 0, 0, 1, 1,
0.382507, -1.267934, 2.695581, 1, 1, 1, 1, 1,
0.3827069, 2.467544, 0.5652119, 1, 1, 1, 1, 1,
0.3854397, -0.8914549, 4.085868, 1, 1, 1, 1, 1,
0.3881085, -1.498828, 1.171916, 1, 1, 1, 1, 1,
0.3895937, -2.511145, 2.946635, 1, 1, 1, 1, 1,
0.3911003, -0.9733632, 3.520032, 1, 1, 1, 1, 1,
0.3966048, 1.345106, 0.1596894, 1, 1, 1, 1, 1,
0.4018851, 0.5154319, 1.290489, 1, 1, 1, 1, 1,
0.4067968, 0.008054818, 3.140067, 1, 1, 1, 1, 1,
0.4091619, 0.1687663, 0.3521774, 1, 1, 1, 1, 1,
0.4114322, 1.533781, -2.196694, 1, 1, 1, 1, 1,
0.4121301, 0.99029, 0.596368, 1, 1, 1, 1, 1,
0.4122863, -1.388637, 3.740548, 1, 1, 1, 1, 1,
0.4125068, 1.601501, -1.093898, 1, 1, 1, 1, 1,
0.4150939, -0.2517985, 2.322529, 1, 1, 1, 1, 1,
0.4175799, 3.443179, -0.3111373, 0, 0, 1, 1, 1,
0.4181665, 0.4651505, -0.02993209, 1, 0, 0, 1, 1,
0.4181702, -0.5991024, 4.385191, 1, 0, 0, 1, 1,
0.4195906, -1.423006, 1.982462, 1, 0, 0, 1, 1,
0.4197914, 0.8220986, 0.3133311, 1, 0, 0, 1, 1,
0.4200141, 0.1821072, 1.953328, 1, 0, 0, 1, 1,
0.4214104, 0.8361152, 0.3648848, 0, 0, 0, 1, 1,
0.4231284, -0.762586, 3.311054, 0, 0, 0, 1, 1,
0.4237719, 0.6821403, -0.6651783, 0, 0, 0, 1, 1,
0.4253858, -0.9782949, 1.016267, 0, 0, 0, 1, 1,
0.4282484, 0.7250983, 0.6420513, 0, 0, 0, 1, 1,
0.4288425, -1.146609, 2.251236, 0, 0, 0, 1, 1,
0.4316321, 0.08266576, 2.836054, 0, 0, 0, 1, 1,
0.4331264, 0.9477553, -0.1097384, 1, 1, 1, 1, 1,
0.435166, 0.4924976, 0.2936802, 1, 1, 1, 1, 1,
0.4374031, 1.707445, -0.3583945, 1, 1, 1, 1, 1,
0.4374227, -0.02218723, 1.971647, 1, 1, 1, 1, 1,
0.4376638, 0.1523266, 2.150453, 1, 1, 1, 1, 1,
0.4417679, 0.5549313, 0.3548699, 1, 1, 1, 1, 1,
0.442068, 0.5372499, 1.799899, 1, 1, 1, 1, 1,
0.4457214, 2.193193, 0.7217892, 1, 1, 1, 1, 1,
0.4470879, 1.784145, -0.3775442, 1, 1, 1, 1, 1,
0.4486784, -0.6901616, 2.342973, 1, 1, 1, 1, 1,
0.4489399, 0.4909742, 0.784388, 1, 1, 1, 1, 1,
0.4502012, 0.1085502, 2.972777, 1, 1, 1, 1, 1,
0.45412, 0.7513723, 2.170716, 1, 1, 1, 1, 1,
0.4556722, -0.8028005, 2.251076, 1, 1, 1, 1, 1,
0.4613257, -0.8321348, 3.969925, 1, 1, 1, 1, 1,
0.461623, 0.5072869, 1.808838, 0, 0, 1, 1, 1,
0.4647468, -0.6205249, 0.369899, 1, 0, 0, 1, 1,
0.464854, -0.7341448, 2.295032, 1, 0, 0, 1, 1,
0.4661914, 1.682733, -0.9082377, 1, 0, 0, 1, 1,
0.4705041, -0.9545478, 2.897167, 1, 0, 0, 1, 1,
0.4715257, -1.47708, 4.608783, 1, 0, 0, 1, 1,
0.4740271, -0.246248, 2.319623, 0, 0, 0, 1, 1,
0.4744428, 1.164759, 0.9212518, 0, 0, 0, 1, 1,
0.4761219, 1.320193, -0.9100834, 0, 0, 0, 1, 1,
0.4766772, -0.5864868, 1.626881, 0, 0, 0, 1, 1,
0.4779398, 0.6983852, -1.287603, 0, 0, 0, 1, 1,
0.4798865, 0.9364471, 1.05921, 0, 0, 0, 1, 1,
0.4799598, -0.7785013, 4.312328, 0, 0, 0, 1, 1,
0.4813569, -0.6866246, 3.334461, 1, 1, 1, 1, 1,
0.481528, 0.5900803, 2.063362, 1, 1, 1, 1, 1,
0.4872478, -1.163161, 2.704626, 1, 1, 1, 1, 1,
0.4891084, -1.017333, 2.607517, 1, 1, 1, 1, 1,
0.4908248, -0.2474774, 2.355456, 1, 1, 1, 1, 1,
0.4970698, 0.7309574, 1.092896, 1, 1, 1, 1, 1,
0.502982, 1.251943, 0.3911139, 1, 1, 1, 1, 1,
0.5104552, 0.8789426, -0.9327936, 1, 1, 1, 1, 1,
0.5193226, 0.658325, -0.01531056, 1, 1, 1, 1, 1,
0.5219862, 1.26838, 0.1873915, 1, 1, 1, 1, 1,
0.5238018, -0.2740841, 1.781953, 1, 1, 1, 1, 1,
0.5241606, 1.243864, 0.8941917, 1, 1, 1, 1, 1,
0.5295107, 0.7408393, -1.18203, 1, 1, 1, 1, 1,
0.5336788, 0.8924215, 1.515084, 1, 1, 1, 1, 1,
0.534214, -1.10911, 2.870387, 1, 1, 1, 1, 1,
0.5361219, -0.6931197, 2.761469, 0, 0, 1, 1, 1,
0.5418237, -1.85344, 2.073266, 1, 0, 0, 1, 1,
0.5440465, -0.3192993, -0.2591948, 1, 0, 0, 1, 1,
0.5515633, 0.4763633, 2.774448, 1, 0, 0, 1, 1,
0.555209, 0.4476824, 0.3996866, 1, 0, 0, 1, 1,
0.5570872, 0.7470037, 0.3709328, 1, 0, 0, 1, 1,
0.5574969, -2.11279, 2.816881, 0, 0, 0, 1, 1,
0.5611164, -0.8576075, 1.254362, 0, 0, 0, 1, 1,
0.5642794, -0.5677286, 3.747671, 0, 0, 0, 1, 1,
0.5711092, 0.319234, 0.5954684, 0, 0, 0, 1, 1,
0.5719117, 0.4620041, 1.07294, 0, 0, 0, 1, 1,
0.5733793, 0.9253351, 0.1020943, 0, 0, 0, 1, 1,
0.584094, -0.9320284, 3.702809, 0, 0, 0, 1, 1,
0.584442, -1.348823, 3.106493, 1, 1, 1, 1, 1,
0.5858883, 1.494128, 1.616114, 1, 1, 1, 1, 1,
0.5924824, -0.1187326, 2.190063, 1, 1, 1, 1, 1,
0.5943762, 1.228633, 0.6091166, 1, 1, 1, 1, 1,
0.5950883, 0.7762992, 1.004018, 1, 1, 1, 1, 1,
0.5954871, 0.6629088, 1.462596, 1, 1, 1, 1, 1,
0.5979445, 1.048954, 0.1581704, 1, 1, 1, 1, 1,
0.5994711, -0.8733218, 1.991362, 1, 1, 1, 1, 1,
0.6003, 1.794147, 1.112011, 1, 1, 1, 1, 1,
0.602246, 1.000153, 0.1450649, 1, 1, 1, 1, 1,
0.6061317, -1.45301, 1.977089, 1, 1, 1, 1, 1,
0.6153154, -0.7617013, 1.831569, 1, 1, 1, 1, 1,
0.61883, -0.4896787, 2.275315, 1, 1, 1, 1, 1,
0.6264271, 0.1849383, 0.2339596, 1, 1, 1, 1, 1,
0.6270657, -0.007518393, 2.003548, 1, 1, 1, 1, 1,
0.6292852, -0.4799217, 2.022931, 0, 0, 1, 1, 1,
0.630288, -1.215512, 3.069982, 1, 0, 0, 1, 1,
0.6357085, -0.6773209, 1.7485, 1, 0, 0, 1, 1,
0.6415527, -1.478333, 1.418965, 1, 0, 0, 1, 1,
0.6423624, -0.05598383, 2.45193, 1, 0, 0, 1, 1,
0.6443334, 1.156025, 2.207046, 1, 0, 0, 1, 1,
0.6464369, 0.2733365, 1.417987, 0, 0, 0, 1, 1,
0.6469569, 1.061809, 2.052737, 0, 0, 0, 1, 1,
0.6479266, 0.2421898, 1.463641, 0, 0, 0, 1, 1,
0.6480582, -0.2835174, 3.732631, 0, 0, 0, 1, 1,
0.650417, 0.5703393, 1.374319, 0, 0, 0, 1, 1,
0.6510994, -1.520588, 3.046292, 0, 0, 0, 1, 1,
0.6595613, 0.1327928, 2.604097, 0, 0, 0, 1, 1,
0.6606163, 0.5048404, 2.186463, 1, 1, 1, 1, 1,
0.6607288, 0.5113479, -1.619876, 1, 1, 1, 1, 1,
0.6643007, 1.169732, 0.7633368, 1, 1, 1, 1, 1,
0.6663639, 1.098871, 0.1023399, 1, 1, 1, 1, 1,
0.6666299, 0.7020835, -1.432321, 1, 1, 1, 1, 1,
0.6773475, 0.1584263, 2.07046, 1, 1, 1, 1, 1,
0.6802211, 0.5944449, 2.008462, 1, 1, 1, 1, 1,
0.6823072, 0.2828072, 1.746051, 1, 1, 1, 1, 1,
0.6823495, 0.3205694, 0.9067022, 1, 1, 1, 1, 1,
0.6864857, -0.4553722, 2.818825, 1, 1, 1, 1, 1,
0.6918603, 2.478969, -0.05831447, 1, 1, 1, 1, 1,
0.6930084, -0.6686102, 1.468386, 1, 1, 1, 1, 1,
0.6965685, 0.3625546, 0.6442226, 1, 1, 1, 1, 1,
0.6980798, 0.462782, 1.171005, 1, 1, 1, 1, 1,
0.7011576, -0.4052826, 4.448612, 1, 1, 1, 1, 1,
0.7012795, -0.4871801, 2.966367, 0, 0, 1, 1, 1,
0.7097437, 0.2015323, 0.7505587, 1, 0, 0, 1, 1,
0.7116871, 1.148044, 0.8850843, 1, 0, 0, 1, 1,
0.7156644, 1.587177, -0.1001516, 1, 0, 0, 1, 1,
0.7263248, -0.07805452, 1.017184, 1, 0, 0, 1, 1,
0.7307182, -0.5746055, 1.335722, 1, 0, 0, 1, 1,
0.7328388, 1.284989, 0.5317149, 0, 0, 0, 1, 1,
0.7330471, 0.9212088, 2.84892, 0, 0, 0, 1, 1,
0.7334583, -1.152003, 3.005515, 0, 0, 0, 1, 1,
0.7345379, 1.815289, 0.6197935, 0, 0, 0, 1, 1,
0.7349251, 1.719779, 1.380296, 0, 0, 0, 1, 1,
0.738823, -2.306341, 3.434607, 0, 0, 0, 1, 1,
0.7401628, -0.2582059, -0.1123101, 0, 0, 0, 1, 1,
0.7409115, 0.3154882, 0.5672234, 1, 1, 1, 1, 1,
0.7435777, -0.5348607, 1.201592, 1, 1, 1, 1, 1,
0.7451369, 0.3121105, 1.020185, 1, 1, 1, 1, 1,
0.7493743, -1.215908, 1.680347, 1, 1, 1, 1, 1,
0.7497443, -0.2782433, 2.705941, 1, 1, 1, 1, 1,
0.7533225, 0.2620608, -0.6020037, 1, 1, 1, 1, 1,
0.7548632, 0.2603624, 1.373444, 1, 1, 1, 1, 1,
0.7555808, 0.5353357, -0.9543279, 1, 1, 1, 1, 1,
0.7580132, 1.727573, -0.8068898, 1, 1, 1, 1, 1,
0.7704692, -0.5478778, 2.023842, 1, 1, 1, 1, 1,
0.7711131, 0.8380642, 1.085487, 1, 1, 1, 1, 1,
0.7712163, -0.9190606, 2.110398, 1, 1, 1, 1, 1,
0.7750075, 1.296704, 1.802731, 1, 1, 1, 1, 1,
0.7755618, -1.096858, 1.246972, 1, 1, 1, 1, 1,
0.7811749, -1.648568, 4.936643, 1, 1, 1, 1, 1,
0.7844012, -0.7958859, 2.323555, 0, 0, 1, 1, 1,
0.7852395, 1.093033, -0.7806323, 1, 0, 0, 1, 1,
0.785498, -0.8065873, 1.616506, 1, 0, 0, 1, 1,
0.7870296, -0.06069157, -0.3338917, 1, 0, 0, 1, 1,
0.7891454, -1.025247, 4.510831, 1, 0, 0, 1, 1,
0.7955489, -0.4181193, 3.171699, 1, 0, 0, 1, 1,
0.7985682, 1.081623, 0.9909733, 0, 0, 0, 1, 1,
0.7993838, -0.06218461, 1.595831, 0, 0, 0, 1, 1,
0.7994691, 0.1822564, 1.268689, 0, 0, 0, 1, 1,
0.803426, 0.7574589, 0.4809283, 0, 0, 0, 1, 1,
0.804644, -0.2780175, 3.258235, 0, 0, 0, 1, 1,
0.8056653, 0.2367828, 1.529868, 0, 0, 0, 1, 1,
0.8063939, 0.6551908, 0.07143202, 0, 0, 0, 1, 1,
0.8085012, -0.6423237, 3.001737, 1, 1, 1, 1, 1,
0.8089978, -0.5848874, 2.47942, 1, 1, 1, 1, 1,
0.8107355, 1.338716, 2.275248, 1, 1, 1, 1, 1,
0.8126778, -1.677809, 0.5606933, 1, 1, 1, 1, 1,
0.8181481, -1.973829, 2.222409, 1, 1, 1, 1, 1,
0.8196561, 0.6862113, 1.11519, 1, 1, 1, 1, 1,
0.8198729, -2.432076, 3.729308, 1, 1, 1, 1, 1,
0.8207856, -0.5022902, 3.086849, 1, 1, 1, 1, 1,
0.827193, -0.8592324, 2.297878, 1, 1, 1, 1, 1,
0.8287148, -0.5450156, 1.779359, 1, 1, 1, 1, 1,
0.8320861, 1.264216, -0.2301639, 1, 1, 1, 1, 1,
0.8382952, -0.1106613, 1.81692, 1, 1, 1, 1, 1,
0.8537694, -0.8397296, 1.323375, 1, 1, 1, 1, 1,
0.8583126, 0.5506862, 0.8328435, 1, 1, 1, 1, 1,
0.8594611, 0.3736021, -0.1490166, 1, 1, 1, 1, 1,
0.8635737, 1.40465, -0.5082647, 0, 0, 1, 1, 1,
0.8645773, 2.71209, 0.0455196, 1, 0, 0, 1, 1,
0.871608, -0.6739162, 2.036351, 1, 0, 0, 1, 1,
0.8741515, 0.3335261, 2.348959, 1, 0, 0, 1, 1,
0.8763371, 0.1876831, 1.850752, 1, 0, 0, 1, 1,
0.8821179, -0.1160618, 1.994924, 1, 0, 0, 1, 1,
0.8827879, 0.710425, 2.174153, 0, 0, 0, 1, 1,
0.8845425, -0.1353931, 2.131636, 0, 0, 0, 1, 1,
0.8846138, -0.6895835, 2.589798, 0, 0, 0, 1, 1,
0.8860018, 0.2485649, 2.806076, 0, 0, 0, 1, 1,
0.8900136, 0.4595606, 0.8600144, 0, 0, 0, 1, 1,
0.8922878, 0.5302578, 1.956169, 0, 0, 0, 1, 1,
0.9006637, -1.115574, 2.680219, 0, 0, 0, 1, 1,
0.9032584, -1.520586, 1.763508, 1, 1, 1, 1, 1,
0.9043391, 0.4091798, 0.3544635, 1, 1, 1, 1, 1,
0.906258, -0.443572, 2.415225, 1, 1, 1, 1, 1,
0.9085128, 0.4277926, 1.014694, 1, 1, 1, 1, 1,
0.9143394, 0.538731, 0.08154846, 1, 1, 1, 1, 1,
0.9174743, -0.8295967, 3.216424, 1, 1, 1, 1, 1,
0.9240162, 0.4188716, 1.52669, 1, 1, 1, 1, 1,
0.9311651, 1.593901, 0.6332415, 1, 1, 1, 1, 1,
0.9314012, -0.3828141, 2.364331, 1, 1, 1, 1, 1,
0.9315726, -1.14615, 1.225277, 1, 1, 1, 1, 1,
0.9380314, -0.2113446, 0.7628531, 1, 1, 1, 1, 1,
0.9389275, 1.51965, 1.172244, 1, 1, 1, 1, 1,
0.94775, 0.4104919, 1.464487, 1, 1, 1, 1, 1,
0.9542393, 1.700526, -0.1557399, 1, 1, 1, 1, 1,
0.9644715, 1.371117, 0.971386, 1, 1, 1, 1, 1,
0.9782532, -0.6293815, 2.496985, 0, 0, 1, 1, 1,
0.9817805, 1.576768, -0.5988479, 1, 0, 0, 1, 1,
0.9858121, 0.08880803, 1.978519, 1, 0, 0, 1, 1,
0.9868525, -0.2585309, 2.176585, 1, 0, 0, 1, 1,
0.9943193, 0.1700738, 2.670687, 1, 0, 0, 1, 1,
0.9984525, -2.089218, 2.076377, 1, 0, 0, 1, 1,
1.003345, -0.6847801, 0.8778625, 0, 0, 0, 1, 1,
1.004973, -1.057135, 1.142512, 0, 0, 0, 1, 1,
1.006262, 0.006022051, 2.262635, 0, 0, 0, 1, 1,
1.006347, -1.520132, 3.363369, 0, 0, 0, 1, 1,
1.01056, 0.3508022, -0.08802885, 0, 0, 0, 1, 1,
1.013394, 0.2112981, 1.396954, 0, 0, 0, 1, 1,
1.025933, -1.207527, 1.977005, 0, 0, 0, 1, 1,
1.028254, -1.121953, 3.663722, 1, 1, 1, 1, 1,
1.032191, -0.5501753, 1.103698, 1, 1, 1, 1, 1,
1.03493, -0.6121728, 1.220551, 1, 1, 1, 1, 1,
1.038293, -0.3579896, 1.189256, 1, 1, 1, 1, 1,
1.049602, -0.4143716, 2.283175, 1, 1, 1, 1, 1,
1.050947, -1.47782, 1.562397, 1, 1, 1, 1, 1,
1.057942, 1.816524, 0.3037797, 1, 1, 1, 1, 1,
1.064067, 0.6554043, 1.339567, 1, 1, 1, 1, 1,
1.064991, 2.638754, -0.78669, 1, 1, 1, 1, 1,
1.066917, 2.111651, 0.2495062, 1, 1, 1, 1, 1,
1.071923, -0.9824603, 2.720464, 1, 1, 1, 1, 1,
1.072701, 0.3685154, 1.120392, 1, 1, 1, 1, 1,
1.079278, -0.4252692, 2.224833, 1, 1, 1, 1, 1,
1.085481, -1.782889, 3.166671, 1, 1, 1, 1, 1,
1.086167, -1.059415, 1.868343, 1, 1, 1, 1, 1,
1.090238, 1.038642, 0.06397886, 0, 0, 1, 1, 1,
1.097077, -0.1751058, 2.372916, 1, 0, 0, 1, 1,
1.100684, 1.618671, 1.774754, 1, 0, 0, 1, 1,
1.101554, -0.2705696, 0.2407975, 1, 0, 0, 1, 1,
1.104559, 0.4938268, 1.376571, 1, 0, 0, 1, 1,
1.112389, 1.967669, 1.651209, 1, 0, 0, 1, 1,
1.117047, 0.9356897, 0.03692214, 0, 0, 0, 1, 1,
1.122139, 2.031691, 0.369476, 0, 0, 0, 1, 1,
1.126665, 0.7911289, 3.100198, 0, 0, 0, 1, 1,
1.127568, -0.2276295, 1.778465, 0, 0, 0, 1, 1,
1.144173, 1.285458, 0.4195127, 0, 0, 0, 1, 1,
1.146668, 0.02226879, 1.042576, 0, 0, 0, 1, 1,
1.149416, 1.07833, -0.5137802, 0, 0, 0, 1, 1,
1.153111, -1.073684, 3.234787, 1, 1, 1, 1, 1,
1.164397, -1.572496, 1.625579, 1, 1, 1, 1, 1,
1.17131, -1.260401, 1.767418, 1, 1, 1, 1, 1,
1.181924, 0.1836647, 2.486498, 1, 1, 1, 1, 1,
1.184858, -0.1745265, 2.291799, 1, 1, 1, 1, 1,
1.193621, 1.173373, 1.109865, 1, 1, 1, 1, 1,
1.206458, -1.812562, 2.692139, 1, 1, 1, 1, 1,
1.213043, -0.0147205, 1.28956, 1, 1, 1, 1, 1,
1.213938, 1.573804, 1.123322, 1, 1, 1, 1, 1,
1.214497, 1.3786, 2.739301, 1, 1, 1, 1, 1,
1.217225, -1.885736, 1.837314, 1, 1, 1, 1, 1,
1.220939, -2.057109, 2.553311, 1, 1, 1, 1, 1,
1.224723, -0.5530867, 2.512412, 1, 1, 1, 1, 1,
1.237568, 0.4344044, 2.32836, 1, 1, 1, 1, 1,
1.239264, -0.8132475, 2.506666, 1, 1, 1, 1, 1,
1.243181, 0.5748806, 2.750091, 0, 0, 1, 1, 1,
1.245843, 0.05176046, 0.2700901, 1, 0, 0, 1, 1,
1.248835, 0.4991745, 1.602833, 1, 0, 0, 1, 1,
1.24914, 1.40037, 0.5954946, 1, 0, 0, 1, 1,
1.250926, 0.7505531, 1.091876, 1, 0, 0, 1, 1,
1.252322, 0.344745, 2.436628, 1, 0, 0, 1, 1,
1.252961, -0.6937836, 2.621549, 0, 0, 0, 1, 1,
1.259351, -0.5855356, 1.339948, 0, 0, 0, 1, 1,
1.267605, -1.199665, 1.32223, 0, 0, 0, 1, 1,
1.273856, 1.522795, -1.480655, 0, 0, 0, 1, 1,
1.280948, -0.2805393, 2.460169, 0, 0, 0, 1, 1,
1.287026, 1.347074, 0.7394342, 0, 0, 0, 1, 1,
1.311105, -1.025748, 2.165259, 0, 0, 0, 1, 1,
1.316331, -0.7070636, 2.484803, 1, 1, 1, 1, 1,
1.317032, 1.106737, 0.5748184, 1, 1, 1, 1, 1,
1.322035, -0.6848126, 0.9505394, 1, 1, 1, 1, 1,
1.340022, 0.5170884, 1.681666, 1, 1, 1, 1, 1,
1.343911, 0.4429675, 1.658111, 1, 1, 1, 1, 1,
1.344121, 1.395679, 0.3410193, 1, 1, 1, 1, 1,
1.350621, -0.2194376, 2.527313, 1, 1, 1, 1, 1,
1.361072, 0.5631887, -0.9196286, 1, 1, 1, 1, 1,
1.368026, 0.3910492, 0.04567705, 1, 1, 1, 1, 1,
1.369035, 1.434153, 2.456045, 1, 1, 1, 1, 1,
1.371536, 1.471927, -0.6831604, 1, 1, 1, 1, 1,
1.374199, 1.226718, 0.3453715, 1, 1, 1, 1, 1,
1.377726, -0.1953408, 1.400431, 1, 1, 1, 1, 1,
1.37991, 0.1066638, 2.423683, 1, 1, 1, 1, 1,
1.380547, -0.8743152, 3.767042, 1, 1, 1, 1, 1,
1.383475, 0.558665, 1.022385, 0, 0, 1, 1, 1,
1.384601, 1.692971, -0.2066445, 1, 0, 0, 1, 1,
1.388191, -0.7091647, 1.875863, 1, 0, 0, 1, 1,
1.392208, -0.3705329, 1.992782, 1, 0, 0, 1, 1,
1.392868, -0.3031056, 1.000181, 1, 0, 0, 1, 1,
1.422966, 0.4455396, 2.484122, 1, 0, 0, 1, 1,
1.431026, 0.6618472, 1.033093, 0, 0, 0, 1, 1,
1.436808, -1.197592, 2.936346, 0, 0, 0, 1, 1,
1.437275, -0.3307428, 1.259971, 0, 0, 0, 1, 1,
1.452242, -0.7571065, 0.645857, 0, 0, 0, 1, 1,
1.453233, 0.7418741, 1.528274, 0, 0, 0, 1, 1,
1.455931, -1.622177, 3.708131, 0, 0, 0, 1, 1,
1.485216, -0.9366012, 2.976016, 0, 0, 0, 1, 1,
1.505343, -1.260983, 2.980741, 1, 1, 1, 1, 1,
1.508514, -0.7239052, -0.503639, 1, 1, 1, 1, 1,
1.513848, 0.01752684, 1.886493, 1, 1, 1, 1, 1,
1.515256, 2.106283, -0.2043096, 1, 1, 1, 1, 1,
1.523413, -0.9496881, 1.372199, 1, 1, 1, 1, 1,
1.531557, 0.5980277, 0.4598962, 1, 1, 1, 1, 1,
1.54186, -0.7610236, 0.6943761, 1, 1, 1, 1, 1,
1.546036, 1.262816, -1.101174, 1, 1, 1, 1, 1,
1.555893, 1.020325, 0.5375474, 1, 1, 1, 1, 1,
1.561897, 0.8463332, 0.2535045, 1, 1, 1, 1, 1,
1.566821, -0.07154813, 1.614864, 1, 1, 1, 1, 1,
1.583337, 0.4394191, -0.03184566, 1, 1, 1, 1, 1,
1.585645, -3.11459e-05, 0.5581037, 1, 1, 1, 1, 1,
1.588122, 0.1301433, 1.825864, 1, 1, 1, 1, 1,
1.594891, 0.2606233, 2.239891, 1, 1, 1, 1, 1,
1.611975, -0.321662, 1.203684, 0, 0, 1, 1, 1,
1.612493, -0.008896296, 1.97404, 1, 0, 0, 1, 1,
1.614805, 0.1914303, 2.405056, 1, 0, 0, 1, 1,
1.672607, 0.2892634, 0.5078666, 1, 0, 0, 1, 1,
1.700343, -1.525059, 1.276137, 1, 0, 0, 1, 1,
1.707984, 0.5812401, -0.7072672, 1, 0, 0, 1, 1,
1.726261, 1.27481, 1.75845, 0, 0, 0, 1, 1,
1.728953, 0.8215842, -1.040754, 0, 0, 0, 1, 1,
1.744471, 0.5239231, 1.971355, 0, 0, 0, 1, 1,
1.751159, -1.708036, 1.758035, 0, 0, 0, 1, 1,
1.755543, 0.5589222, 2.111153, 0, 0, 0, 1, 1,
1.759407, 1.09584, 1.013897, 0, 0, 0, 1, 1,
1.772491, 0.9596059, -0.8181626, 0, 0, 0, 1, 1,
1.781754, -0.3130061, 1.843421, 1, 1, 1, 1, 1,
1.783542, 1.328611, 0.4707778, 1, 1, 1, 1, 1,
1.846877, -0.9786505, 2.928395, 1, 1, 1, 1, 1,
1.861894, -0.5540119, 2.980439, 1, 1, 1, 1, 1,
1.884088, -1.013319, 0.04015461, 1, 1, 1, 1, 1,
1.884116, -0.6467928, 1.888448, 1, 1, 1, 1, 1,
1.910537, -0.08032409, 1.661679, 1, 1, 1, 1, 1,
1.923164, -1.015757, 2.223445, 1, 1, 1, 1, 1,
1.954574, -1.214127, 1.613936, 1, 1, 1, 1, 1,
1.95551, -0.886007, 0.9123091, 1, 1, 1, 1, 1,
1.97264, 1.02658, 0.743848, 1, 1, 1, 1, 1,
1.979051, 0.4570618, 2.644502, 1, 1, 1, 1, 1,
1.997292, 0.1223596, 1.349432, 1, 1, 1, 1, 1,
2.023889, -0.6477752, 2.136971, 1, 1, 1, 1, 1,
2.034646, 1.325973, 0.1901071, 1, 1, 1, 1, 1,
2.048543, 0.3459935, -0.1320842, 0, 0, 1, 1, 1,
2.089003, 1.31495, 0.8291478, 1, 0, 0, 1, 1,
2.098879, -1.468545, 2.281812, 1, 0, 0, 1, 1,
2.106427, 1.777934, 2.746561, 1, 0, 0, 1, 1,
2.136888, 0.5729316, 1.128683, 1, 0, 0, 1, 1,
2.157968, 0.5286911, 1.8088, 1, 0, 0, 1, 1,
2.177173, -0.52389, 3.184638, 0, 0, 0, 1, 1,
2.213808, -0.2163831, 1.773566, 0, 0, 0, 1, 1,
2.232097, -0.5176587, 0.2249067, 0, 0, 0, 1, 1,
2.251412, 0.2080203, 1.448711, 0, 0, 0, 1, 1,
2.305696, 1.358374, 1.210732, 0, 0, 0, 1, 1,
2.328772, 0.1421982, 2.647686, 0, 0, 0, 1, 1,
2.370064, -1.038034, 0.8954889, 0, 0, 0, 1, 1,
2.39448, -0.07798973, 1.460429, 1, 1, 1, 1, 1,
2.55628, -0.6059961, 2.168365, 1, 1, 1, 1, 1,
2.597117, -0.1672392, -0.4405617, 1, 1, 1, 1, 1,
2.852628, -1.365859, 0.6749725, 1, 1, 1, 1, 1,
2.985623, -0.3513912, 1.194499, 1, 1, 1, 1, 1,
3.035189, 0.6116522, 1.743738, 1, 1, 1, 1, 1,
3.536169, -0.2990586, 1.673389, 1, 1, 1, 1, 1
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
var radius = 9.717164;
var distance = 34.13113;
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
mvMatrix.translate( 0.0738225, -0.3045683, 0.1596885 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.13113);
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