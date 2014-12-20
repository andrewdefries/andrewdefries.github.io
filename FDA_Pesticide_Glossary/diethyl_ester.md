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
-3.630234, -0.644582, -1.899517, 1, 0, 0, 1,
-2.956032, -0.7084656, -2.039274, 1, 0.007843138, 0, 1,
-2.838183, -1.431177, -1.2753, 1, 0.01176471, 0, 1,
-2.701631, -0.5689846, -2.418345, 1, 0.01960784, 0, 1,
-2.446246, 0.002198235, -2.699046, 1, 0.02352941, 0, 1,
-2.305206, 2.74262, 0.2761406, 1, 0.03137255, 0, 1,
-2.272081, -1.212074, -1.724355, 1, 0.03529412, 0, 1,
-2.228142, -0.1298046, -0.7723139, 1, 0.04313726, 0, 1,
-2.225854, -1.149318, -3.374621, 1, 0.04705882, 0, 1,
-2.191488, 0.03836127, -1.083405, 1, 0.05490196, 0, 1,
-2.17525, -1.409661, -1.299018, 1, 0.05882353, 0, 1,
-2.155134, 0.5503336, -1.375765, 1, 0.06666667, 0, 1,
-2.154055, 0.4000562, -1.297861, 1, 0.07058824, 0, 1,
-2.130005, 0.6002684, -1.937554, 1, 0.07843138, 0, 1,
-2.063744, 0.3202867, -1.790841, 1, 0.08235294, 0, 1,
-2.044631, 1.563578, -0.8700191, 1, 0.09019608, 0, 1,
-2.044047, -0.02203155, -2.943459, 1, 0.09411765, 0, 1,
-2.035884, -1.745568, -1.551583, 1, 0.1019608, 0, 1,
-2.022596, 1.184404, -1.964015, 1, 0.1098039, 0, 1,
-1.99942, -0.2782403, -1.536625, 1, 0.1137255, 0, 1,
-1.992272, 1.272958, -2.022911, 1, 0.1215686, 0, 1,
-1.990831, -0.3102942, -3.614266, 1, 0.1254902, 0, 1,
-1.980403, -0.9443047, -1.808767, 1, 0.1333333, 0, 1,
-1.975807, 2.0301, 0.9707187, 1, 0.1372549, 0, 1,
-1.975486, 0.04635465, -3.116775, 1, 0.145098, 0, 1,
-1.967062, 0.6438052, -2.884015, 1, 0.1490196, 0, 1,
-1.942922, -0.1783498, 1.07491, 1, 0.1568628, 0, 1,
-1.939098, -1.306732, -2.291369, 1, 0.1607843, 0, 1,
-1.937853, 0.1217431, -0.5946114, 1, 0.1686275, 0, 1,
-1.917561, -1.061326, -0.6026388, 1, 0.172549, 0, 1,
-1.904003, -1.84109, -3.346088, 1, 0.1803922, 0, 1,
-1.90114, 1.066178, -0.1881973, 1, 0.1843137, 0, 1,
-1.893671, -0.1786864, -0.3579777, 1, 0.1921569, 0, 1,
-1.893164, -1.305948, -0.2208267, 1, 0.1960784, 0, 1,
-1.888455, -0.7097857, -2.516288, 1, 0.2039216, 0, 1,
-1.88628, -0.5461308, -2.993753, 1, 0.2117647, 0, 1,
-1.878789, -1.508633, -3.492753, 1, 0.2156863, 0, 1,
-1.850613, 0.8448824, -0.6517983, 1, 0.2235294, 0, 1,
-1.833819, -0.1700221, -0.8194631, 1, 0.227451, 0, 1,
-1.803976, -0.6604314, -3.088113, 1, 0.2352941, 0, 1,
-1.799427, 0.2173978, -3.458446, 1, 0.2392157, 0, 1,
-1.778756, -1.348099, -2.059532, 1, 0.2470588, 0, 1,
-1.725136, -0.3826593, -1.603672, 1, 0.2509804, 0, 1,
-1.686632, 0.4872429, -1.766701, 1, 0.2588235, 0, 1,
-1.679563, 0.6808584, -1.48226, 1, 0.2627451, 0, 1,
-1.666273, -0.738908, -1.662605, 1, 0.2705882, 0, 1,
-1.665749, -0.7391568, -2.714713, 1, 0.2745098, 0, 1,
-1.642831, 0.2719313, -0.9821386, 1, 0.282353, 0, 1,
-1.641484, 1.134569, 0.1521051, 1, 0.2862745, 0, 1,
-1.629014, -0.821454, -0.7711327, 1, 0.2941177, 0, 1,
-1.62776, -0.4462442, -2.354634, 1, 0.3019608, 0, 1,
-1.619982, 0.3521793, -2.023755, 1, 0.3058824, 0, 1,
-1.615526, -0.8886179, -0.6137051, 1, 0.3137255, 0, 1,
-1.596899, 0.5715077, -3.130884, 1, 0.3176471, 0, 1,
-1.584994, 1.133102, 1.28222, 1, 0.3254902, 0, 1,
-1.573879, 0.2594397, -3.529579, 1, 0.3294118, 0, 1,
-1.569282, -0.1722861, -1.287477, 1, 0.3372549, 0, 1,
-1.559474, 0.6229407, -1.858336, 1, 0.3411765, 0, 1,
-1.548242, -0.5354699, -3.325351, 1, 0.3490196, 0, 1,
-1.547531, 0.3423479, -0.4672128, 1, 0.3529412, 0, 1,
-1.546242, 0.9695738, -1.906153, 1, 0.3607843, 0, 1,
-1.546172, -0.576377, -2.144877, 1, 0.3647059, 0, 1,
-1.529237, 1.004459, 0.5082635, 1, 0.372549, 0, 1,
-1.525218, 1.329854, -0.6386496, 1, 0.3764706, 0, 1,
-1.522693, 0.7935951, -2.059447, 1, 0.3843137, 0, 1,
-1.519714, -1.427667, -3.113857, 1, 0.3882353, 0, 1,
-1.50199, 0.3668733, -2.696655, 1, 0.3960784, 0, 1,
-1.490535, -1.417628, -2.734733, 1, 0.4039216, 0, 1,
-1.48133, -0.7008417, -2.026344, 1, 0.4078431, 0, 1,
-1.461353, -0.309949, -1.649169, 1, 0.4156863, 0, 1,
-1.453223, -0.220227, -2.938092, 1, 0.4196078, 0, 1,
-1.438201, -1.182823, -3.761907, 1, 0.427451, 0, 1,
-1.434918, 0.7988859, -1.899273, 1, 0.4313726, 0, 1,
-1.432287, -0.951151, -1.641026, 1, 0.4392157, 0, 1,
-1.428435, -0.8728697, -0.7268043, 1, 0.4431373, 0, 1,
-1.425075, 0.6391026, -0.3630607, 1, 0.4509804, 0, 1,
-1.419719, 2.099751, -0.832033, 1, 0.454902, 0, 1,
-1.416797, 0.6457259, -1.805318, 1, 0.4627451, 0, 1,
-1.412288, -0.4648427, -1.097266, 1, 0.4666667, 0, 1,
-1.4077, -0.5235932, -1.245395, 1, 0.4745098, 0, 1,
-1.402087, 1.087222, -0.4962267, 1, 0.4784314, 0, 1,
-1.401438, 1.146879, 0.4410377, 1, 0.4862745, 0, 1,
-1.388769, 1.276668, 0.4775559, 1, 0.4901961, 0, 1,
-1.388718, -0.06120384, -2.379576, 1, 0.4980392, 0, 1,
-1.360942, 1.672276, -0.496636, 1, 0.5058824, 0, 1,
-1.349959, 0.6658109, -0.8893716, 1, 0.509804, 0, 1,
-1.334383, -2.706516, -3.188212, 1, 0.5176471, 0, 1,
-1.329073, -2.729683, -4.109102, 1, 0.5215687, 0, 1,
-1.328141, -0.2097644, -0.7251278, 1, 0.5294118, 0, 1,
-1.324864, -1.621912, -2.433564, 1, 0.5333334, 0, 1,
-1.313492, 1.746355, -1.593592, 1, 0.5411765, 0, 1,
-1.310771, -0.9465186, -3.226578, 1, 0.5450981, 0, 1,
-1.310488, 0.3357545, -1.740827, 1, 0.5529412, 0, 1,
-1.309986, -1.431978, -4.533188, 1, 0.5568628, 0, 1,
-1.309302, 0.8111386, -1.036404, 1, 0.5647059, 0, 1,
-1.305296, -0.6750994, -2.527441, 1, 0.5686275, 0, 1,
-1.294652, -0.1486366, -2.85781, 1, 0.5764706, 0, 1,
-1.294129, 0.2215803, -2.908012, 1, 0.5803922, 0, 1,
-1.292777, -2.759066, -1.065006, 1, 0.5882353, 0, 1,
-1.291161, -0.5134404, -0.4570774, 1, 0.5921569, 0, 1,
-1.289173, 0.8910304, -0.9346846, 1, 0.6, 0, 1,
-1.283849, 1.38029, -1.670556, 1, 0.6078432, 0, 1,
-1.271831, 2.696003, -0.6507202, 1, 0.6117647, 0, 1,
-1.271286, -0.7154506, -2.370785, 1, 0.6196079, 0, 1,
-1.257309, -0.2471966, 1.750746, 1, 0.6235294, 0, 1,
-1.249624, -0.06279638, -2.550712, 1, 0.6313726, 0, 1,
-1.241585, 0.9832557, -1.676463, 1, 0.6352941, 0, 1,
-1.231875, -1.082006, -0.8442736, 1, 0.6431373, 0, 1,
-1.23093, 0.1729964, -1.608763, 1, 0.6470588, 0, 1,
-1.230768, -0.2359783, -1.932064, 1, 0.654902, 0, 1,
-1.213275, 1.413164, -1.208803, 1, 0.6588235, 0, 1,
-1.212661, 0.5173804, -1.491828, 1, 0.6666667, 0, 1,
-1.208516, -0.9849842, -2.569222, 1, 0.6705883, 0, 1,
-1.207717, -0.2788748, -0.5652657, 1, 0.6784314, 0, 1,
-1.206551, -0.349495, -1.563565, 1, 0.682353, 0, 1,
-1.203497, -0.3660932, -0.9516832, 1, 0.6901961, 0, 1,
-1.203452, -2.506598, -1.648337, 1, 0.6941177, 0, 1,
-1.200346, 0.9567335, -1.63871, 1, 0.7019608, 0, 1,
-1.196291, -0.8794606, -2.615736, 1, 0.7098039, 0, 1,
-1.1915, -1.529358, -2.914143, 1, 0.7137255, 0, 1,
-1.186622, -0.3165273, -0.02026194, 1, 0.7215686, 0, 1,
-1.17698, -0.8151022, -2.254734, 1, 0.7254902, 0, 1,
-1.15737, 0.2195061, -0.514216, 1, 0.7333333, 0, 1,
-1.150138, 1.088916, -1.781633, 1, 0.7372549, 0, 1,
-1.14213, -0.1358333, -1.532531, 1, 0.7450981, 0, 1,
-1.137681, 0.03492259, -1.016706, 1, 0.7490196, 0, 1,
-1.135761, 0.5989978, 0.1634749, 1, 0.7568628, 0, 1,
-1.134785, -0.4238166, -0.2049742, 1, 0.7607843, 0, 1,
-1.131877, 0.7550188, -1.302812, 1, 0.7686275, 0, 1,
-1.131341, -0.2917666, -2.495803, 1, 0.772549, 0, 1,
-1.128174, 0.09604253, -1.979636, 1, 0.7803922, 0, 1,
-1.117622, 1.364504, -0.7516147, 1, 0.7843137, 0, 1,
-1.114344, -1.106719, -1.005059, 1, 0.7921569, 0, 1,
-1.11331, -0.283543, -0.7748958, 1, 0.7960784, 0, 1,
-1.111555, -2.244045, -3.266673, 1, 0.8039216, 0, 1,
-1.10721, -0.7652249, -4.277207, 1, 0.8117647, 0, 1,
-1.094963, -0.1780969, -1.03393, 1, 0.8156863, 0, 1,
-1.092328, -0.8817847, -2.054335, 1, 0.8235294, 0, 1,
-1.08498, -0.08745292, -1.160378, 1, 0.827451, 0, 1,
-1.082324, -0.1685883, -2.165295, 1, 0.8352941, 0, 1,
-1.076404, 1.059757, -1.687301, 1, 0.8392157, 0, 1,
-1.072351, 0.118158, -1.600946, 1, 0.8470588, 0, 1,
-1.067093, -1.104877, -2.078049, 1, 0.8509804, 0, 1,
-1.063845, 0.8525826, -1.261117, 1, 0.8588235, 0, 1,
-1.06286, -0.7033678, -3.909167, 1, 0.8627451, 0, 1,
-1.059713, -0.820321, -2.164075, 1, 0.8705882, 0, 1,
-1.05406, 0.6533067, -0.8468062, 1, 0.8745098, 0, 1,
-1.048634, 0.4121368, -1.615733, 1, 0.8823529, 0, 1,
-1.040757, -0.9596902, -1.395377, 1, 0.8862745, 0, 1,
-1.039706, 0.02875595, -0.3236341, 1, 0.8941177, 0, 1,
-1.038159, 0.1313995, -2.378814, 1, 0.8980392, 0, 1,
-1.037256, 1.125032, -0.4367214, 1, 0.9058824, 0, 1,
-1.025348, -0.2641043, -1.854234, 1, 0.9137255, 0, 1,
-1.021798, -0.3078117, -1.940512, 1, 0.9176471, 0, 1,
-1.020969, -1.256899, -2.972542, 1, 0.9254902, 0, 1,
-1.018244, -0.9988726, -3.332428, 1, 0.9294118, 0, 1,
-1.012015, -0.6390963, -1.939199, 1, 0.9372549, 0, 1,
-1.011747, -2.837047, -2.53459, 1, 0.9411765, 0, 1,
-1.009963, 0.1973377, -2.44743, 1, 0.9490196, 0, 1,
-1.00965, -0.4311698, -2.118037, 1, 0.9529412, 0, 1,
-1.008233, -0.4766235, -0.226081, 1, 0.9607843, 0, 1,
-0.99678, 2.889945, -2.469193, 1, 0.9647059, 0, 1,
-0.9922228, -0.6936968, -2.378975, 1, 0.972549, 0, 1,
-0.9890274, 1.840387, -0.8359724, 1, 0.9764706, 0, 1,
-0.9873341, -1.156513, -2.215735, 1, 0.9843137, 0, 1,
-0.9856754, -0.5158882, -1.22999, 1, 0.9882353, 0, 1,
-0.9830475, -0.4764251, -1.0689, 1, 0.9960784, 0, 1,
-0.9792724, -0.3677598, -1.667634, 0.9960784, 1, 0, 1,
-0.9780133, -0.7237236, -2.265786, 0.9921569, 1, 0, 1,
-0.9686067, 2.741988, -1.53187, 0.9843137, 1, 0, 1,
-0.967143, 0.7267845, -0.7618251, 0.9803922, 1, 0, 1,
-0.967073, 0.5510185, -1.12768, 0.972549, 1, 0, 1,
-0.9643253, 0.3134294, -1.438562, 0.9686275, 1, 0, 1,
-0.9528635, -1.813388, -3.574095, 0.9607843, 1, 0, 1,
-0.9514768, 1.203845, -0.9730152, 0.9568627, 1, 0, 1,
-0.9509559, -0.5609289, -2.224027, 0.9490196, 1, 0, 1,
-0.9394287, 1.216587, -0.8451976, 0.945098, 1, 0, 1,
-0.9381524, 0.09415741, -1.363591, 0.9372549, 1, 0, 1,
-0.9311963, 0.300353, 1.069045, 0.9333333, 1, 0, 1,
-0.9304675, 0.6327301, -0.2269366, 0.9254902, 1, 0, 1,
-0.9263183, 0.3426136, 0.1626301, 0.9215686, 1, 0, 1,
-0.9239633, 0.559652, 0.01747754, 0.9137255, 1, 0, 1,
-0.9232401, -1.159377, -1.747136, 0.9098039, 1, 0, 1,
-0.9157276, -1.517353, -2.311415, 0.9019608, 1, 0, 1,
-0.9107853, 0.7669133, -0.279712, 0.8941177, 1, 0, 1,
-0.9098087, -1.796777, -3.56044, 0.8901961, 1, 0, 1,
-0.9069937, 1.327419, 0.3108169, 0.8823529, 1, 0, 1,
-0.9034399, 0.734615, -2.493058, 0.8784314, 1, 0, 1,
-0.9019527, -0.5171258, -1.782028, 0.8705882, 1, 0, 1,
-0.8962178, 0.7184678, -0.644712, 0.8666667, 1, 0, 1,
-0.8918183, -0.7556221, -2.849443, 0.8588235, 1, 0, 1,
-0.8917647, -0.448193, -2.924918, 0.854902, 1, 0, 1,
-0.8851495, -1.218345, -3.013211, 0.8470588, 1, 0, 1,
-0.8848088, 1.511887, -2.259355, 0.8431373, 1, 0, 1,
-0.8832747, -0.5219229, -2.282402, 0.8352941, 1, 0, 1,
-0.8822616, -1.082888, -3.447904, 0.8313726, 1, 0, 1,
-0.8801474, -0.8766436, -2.210785, 0.8235294, 1, 0, 1,
-0.8768242, -0.1350321, -0.9677372, 0.8196079, 1, 0, 1,
-0.875564, 1.193099, 1.992198, 0.8117647, 1, 0, 1,
-0.8682189, -1.043683, -1.827656, 0.8078431, 1, 0, 1,
-0.8469992, -0.4936392, -2.471253, 0.8, 1, 0, 1,
-0.8469241, -0.2161393, -1.21681, 0.7921569, 1, 0, 1,
-0.8456723, -1.446398, -5.4969, 0.7882353, 1, 0, 1,
-0.8428065, 1.356189, -0.6519166, 0.7803922, 1, 0, 1,
-0.8376637, 0.7952939, -2.014156, 0.7764706, 1, 0, 1,
-0.8214089, 0.7085923, -1.311382, 0.7686275, 1, 0, 1,
-0.8156707, -0.2458932, -3.333445, 0.7647059, 1, 0, 1,
-0.8046336, 0.2332079, -1.701764, 0.7568628, 1, 0, 1,
-0.8037056, -1.1795, -3.817305, 0.7529412, 1, 0, 1,
-0.8022863, -0.008839289, -0.2605285, 0.7450981, 1, 0, 1,
-0.7997614, 0.1539033, -0.999698, 0.7411765, 1, 0, 1,
-0.7978627, -1.126672, -2.879882, 0.7333333, 1, 0, 1,
-0.7942607, -2.023539, -1.921619, 0.7294118, 1, 0, 1,
-0.7930639, 0.6314696, -2.04681, 0.7215686, 1, 0, 1,
-0.7915599, 0.7016832, 0.7046721, 0.7176471, 1, 0, 1,
-0.7870088, 2.050014, -2.239908, 0.7098039, 1, 0, 1,
-0.7826228, -0.6482143, -2.886419, 0.7058824, 1, 0, 1,
-0.7798584, -0.7956984, -1.740821, 0.6980392, 1, 0, 1,
-0.7708406, 0.07536124, -0.8634226, 0.6901961, 1, 0, 1,
-0.7682188, -0.6963678, -4.968478, 0.6862745, 1, 0, 1,
-0.7626907, 0.9749264, -1.386562, 0.6784314, 1, 0, 1,
-0.7625348, -0.5551206, -3.110511, 0.6745098, 1, 0, 1,
-0.7608958, -0.200311, -3.074911, 0.6666667, 1, 0, 1,
-0.7516724, -1.385686, -3.394633, 0.6627451, 1, 0, 1,
-0.7390488, -0.4098396, -1.869142, 0.654902, 1, 0, 1,
-0.7324906, 1.110049, 1.410004, 0.6509804, 1, 0, 1,
-0.7308825, -1.061109, -2.228908, 0.6431373, 1, 0, 1,
-0.7288894, 0.0201473, -1.364363, 0.6392157, 1, 0, 1,
-0.7202134, -0.7059726, -3.117797, 0.6313726, 1, 0, 1,
-0.718501, -2.334731, -3.435986, 0.627451, 1, 0, 1,
-0.7155324, 0.2557261, -1.359727, 0.6196079, 1, 0, 1,
-0.7154142, -0.7299284, -0.7744139, 0.6156863, 1, 0, 1,
-0.7144042, -1.00384, -5.596616, 0.6078432, 1, 0, 1,
-0.7122002, -1.065699, -1.56242, 0.6039216, 1, 0, 1,
-0.7118729, 1.610744, 0.615005, 0.5960785, 1, 0, 1,
-0.7085498, -0.01786475, -1.313903, 0.5882353, 1, 0, 1,
-0.7049784, -1.905274, -1.847498, 0.5843138, 1, 0, 1,
-0.7048901, 0.8790071, -0.07209422, 0.5764706, 1, 0, 1,
-0.7037274, -0.3891698, -1.900944, 0.572549, 1, 0, 1,
-0.7017303, -2.453256, -1.754333, 0.5647059, 1, 0, 1,
-0.6961241, -0.9198033, -1.859369, 0.5607843, 1, 0, 1,
-0.6926123, 0.2717955, -1.023777, 0.5529412, 1, 0, 1,
-0.6909261, -0.1935271, -0.3401305, 0.5490196, 1, 0, 1,
-0.6883784, -1.14778, -1.882834, 0.5411765, 1, 0, 1,
-0.68617, -1.869535, -3.211819, 0.5372549, 1, 0, 1,
-0.6823596, 0.4183215, -2.251334, 0.5294118, 1, 0, 1,
-0.6800449, -0.4085259, -0.6355582, 0.5254902, 1, 0, 1,
-0.6736281, -0.7704338, -3.46639, 0.5176471, 1, 0, 1,
-0.6729356, 0.9995881, 1.219088, 0.5137255, 1, 0, 1,
-0.6726452, 0.3240482, 1.07094, 0.5058824, 1, 0, 1,
-0.6717834, -0.3013586, -4.471242, 0.5019608, 1, 0, 1,
-0.6697213, -1.534446, -3.224049, 0.4941176, 1, 0, 1,
-0.6690822, 0.4948528, -0.3813094, 0.4862745, 1, 0, 1,
-0.665078, 1.231527, -0.7577778, 0.4823529, 1, 0, 1,
-0.6604159, 1.05816, -0.1290736, 0.4745098, 1, 0, 1,
-0.659375, 1.121899, -1.92382, 0.4705882, 1, 0, 1,
-0.650294, 0.01048585, -1.299025, 0.4627451, 1, 0, 1,
-0.647028, -0.5782062, -2.116556, 0.4588235, 1, 0, 1,
-0.6428943, -0.1295016, -2.898588, 0.4509804, 1, 0, 1,
-0.6405724, -0.3455859, -2.985837, 0.4470588, 1, 0, 1,
-0.6405394, -0.4881426, -0.8560469, 0.4392157, 1, 0, 1,
-0.6392518, 2.103548, -0.4317792, 0.4352941, 1, 0, 1,
-0.6390926, -0.8365773, -2.219936, 0.427451, 1, 0, 1,
-0.6386746, 1.158172, -0.6341503, 0.4235294, 1, 0, 1,
-0.6220044, 0.5872554, -2.183495, 0.4156863, 1, 0, 1,
-0.6200776, 0.5291656, -0.1751088, 0.4117647, 1, 0, 1,
-0.6174208, -0.8796691, -3.524488, 0.4039216, 1, 0, 1,
-0.613361, 2.228827, -2.245258, 0.3960784, 1, 0, 1,
-0.6110333, 1.02909, 0.1470893, 0.3921569, 1, 0, 1,
-0.6109959, -0.1180794, -2.095973, 0.3843137, 1, 0, 1,
-0.6096234, 1.194581, -0.1583005, 0.3803922, 1, 0, 1,
-0.6090836, 1.110225, -0.03292106, 0.372549, 1, 0, 1,
-0.5960147, -0.7425026, -1.676548, 0.3686275, 1, 0, 1,
-0.5855318, -0.3389354, -1.022389, 0.3607843, 1, 0, 1,
-0.5847659, 0.5231516, -0.5401677, 0.3568628, 1, 0, 1,
-0.5790753, -0.9416668, -2.616493, 0.3490196, 1, 0, 1,
-0.5765991, 0.7434126, -1.396123, 0.345098, 1, 0, 1,
-0.5752792, -0.7045244, -2.928988, 0.3372549, 1, 0, 1,
-0.5750693, -0.5361032, -2.022498, 0.3333333, 1, 0, 1,
-0.5740097, 0.270124, -2.494077, 0.3254902, 1, 0, 1,
-0.5727187, -0.4448972, -1.247558, 0.3215686, 1, 0, 1,
-0.572332, -1.887335, -3.267363, 0.3137255, 1, 0, 1,
-0.5664001, -0.5985579, -1.362099, 0.3098039, 1, 0, 1,
-0.566104, 0.8451966, -0.5161737, 0.3019608, 1, 0, 1,
-0.5571012, -0.5035587, -2.087839, 0.2941177, 1, 0, 1,
-0.5555514, -0.3496782, -1.093728, 0.2901961, 1, 0, 1,
-0.5520116, 1.22379, -0.2670026, 0.282353, 1, 0, 1,
-0.542198, -1.502737, -3.305685, 0.2784314, 1, 0, 1,
-0.5408801, 1.94958, 1.284409, 0.2705882, 1, 0, 1,
-0.5351316, -1.285356, -3.739692, 0.2666667, 1, 0, 1,
-0.53315, -0.2580649, -1.716168, 0.2588235, 1, 0, 1,
-0.5326548, 0.5120639, -1.230887, 0.254902, 1, 0, 1,
-0.5324922, 1.174416, 0.5803266, 0.2470588, 1, 0, 1,
-0.5310106, -0.2830845, -0.3359365, 0.2431373, 1, 0, 1,
-0.5300685, -0.3485618, -2.083939, 0.2352941, 1, 0, 1,
-0.5265866, -1.021411, -0.8769516, 0.2313726, 1, 0, 1,
-0.5208445, 1.171652, -1.144369, 0.2235294, 1, 0, 1,
-0.5155722, 0.2863072, -1.073572, 0.2196078, 1, 0, 1,
-0.5142549, 1.778757, 1.434692, 0.2117647, 1, 0, 1,
-0.5129014, -0.2642214, -3.17946, 0.2078431, 1, 0, 1,
-0.5123388, 0.1590064, -0.6864974, 0.2, 1, 0, 1,
-0.5117304, -0.6381184, -4.426108, 0.1921569, 1, 0, 1,
-0.5100171, -0.8808567, -1.92539, 0.1882353, 1, 0, 1,
-0.5054737, -1.617654, -2.780056, 0.1803922, 1, 0, 1,
-0.5021323, -0.7117794, -3.63235, 0.1764706, 1, 0, 1,
-0.5019647, -0.5576637, -0.3935406, 0.1686275, 1, 0, 1,
-0.5009801, 0.8984431, -1.144746, 0.1647059, 1, 0, 1,
-0.4983023, 0.2871542, -1.678975, 0.1568628, 1, 0, 1,
-0.4981981, 2.116911, -0.4936467, 0.1529412, 1, 0, 1,
-0.4960932, -1.216581, -2.374106, 0.145098, 1, 0, 1,
-0.4951611, -0.2346345, -1.534216, 0.1411765, 1, 0, 1,
-0.494774, 0.6981146, 0.6023898, 0.1333333, 1, 0, 1,
-0.4927199, 2.641143, -0.9350578, 0.1294118, 1, 0, 1,
-0.4836886, 0.8671643, 0.5666072, 0.1215686, 1, 0, 1,
-0.4820963, -1.603625, -2.975182, 0.1176471, 1, 0, 1,
-0.4817482, 0.7293131, -0.4003465, 0.1098039, 1, 0, 1,
-0.4815566, -1.246557, -2.928762, 0.1058824, 1, 0, 1,
-0.4812298, -0.7023175, -4.323809, 0.09803922, 1, 0, 1,
-0.4777594, 0.2963673, -2.650204, 0.09019608, 1, 0, 1,
-0.4774057, -0.05394223, -1.491712, 0.08627451, 1, 0, 1,
-0.4746687, 0.6278793, -0.6894335, 0.07843138, 1, 0, 1,
-0.4703977, -0.4713363, -1.598412, 0.07450981, 1, 0, 1,
-0.4626288, 1.371886, -0.4403948, 0.06666667, 1, 0, 1,
-0.4613228, 0.39494, -0.5144086, 0.0627451, 1, 0, 1,
-0.4578962, 1.239524, -2.598474, 0.05490196, 1, 0, 1,
-0.4547307, 0.1325837, -2.198608, 0.05098039, 1, 0, 1,
-0.4488339, -0.006704545, -1.293466, 0.04313726, 1, 0, 1,
-0.4461799, 0.9547977, -1.818926, 0.03921569, 1, 0, 1,
-0.4425762, -1.637849, -3.108581, 0.03137255, 1, 0, 1,
-0.4363981, 0.02245162, -1.923041, 0.02745098, 1, 0, 1,
-0.4351366, 0.6096039, -0.5212361, 0.01960784, 1, 0, 1,
-0.4306695, 0.6485842, 0.8486903, 0.01568628, 1, 0, 1,
-0.4287058, -0.1542083, -0.1563683, 0.007843138, 1, 0, 1,
-0.4256875, 0.9647837, -0.3894839, 0.003921569, 1, 0, 1,
-0.421236, 1.695756, -0.6349496, 0, 1, 0.003921569, 1,
-0.4154652, -1.537812, -3.299222, 0, 1, 0.01176471, 1,
-0.4114954, -0.3329323, -3.515342, 0, 1, 0.01568628, 1,
-0.402799, 0.1341564, -0.3190333, 0, 1, 0.02352941, 1,
-0.4025941, -0.2423183, -2.678469, 0, 1, 0.02745098, 1,
-0.401731, 1.350851, -0.2118349, 0, 1, 0.03529412, 1,
-0.4015096, -1.844019, -2.975588, 0, 1, 0.03921569, 1,
-0.3993031, 0.2560537, -1.081123, 0, 1, 0.04705882, 1,
-0.3988149, 0.474643, -0.6084234, 0, 1, 0.05098039, 1,
-0.3954584, -0.1891772, -3.87216, 0, 1, 0.05882353, 1,
-0.3944029, 1.279812, -0.4314568, 0, 1, 0.0627451, 1,
-0.3942658, -0.7404089, -1.747955, 0, 1, 0.07058824, 1,
-0.3872141, 0.506347, -1.381733, 0, 1, 0.07450981, 1,
-0.3866471, 0.4342637, -0.8813102, 0, 1, 0.08235294, 1,
-0.3793069, -1.756555, -3.349399, 0, 1, 0.08627451, 1,
-0.3775259, 1.095276, -0.442028, 0, 1, 0.09411765, 1,
-0.3711211, 0.005664061, -0.5468384, 0, 1, 0.1019608, 1,
-0.3695062, 1.485397, -0.6756048, 0, 1, 0.1058824, 1,
-0.3654457, 0.638629, -1.935847, 0, 1, 0.1137255, 1,
-0.3652384, -0.9645441, -1.807605, 0, 1, 0.1176471, 1,
-0.3641023, 1.267854, -1.028409, 0, 1, 0.1254902, 1,
-0.3626971, 1.485992, -0.5476577, 0, 1, 0.1294118, 1,
-0.3613891, 0.6131106, -2.02701, 0, 1, 0.1372549, 1,
-0.3605776, 1.078361, 0.3679574, 0, 1, 0.1411765, 1,
-0.3562895, -0.1810975, -1.623212, 0, 1, 0.1490196, 1,
-0.3555032, 0.1201278, 0.2065389, 0, 1, 0.1529412, 1,
-0.3508815, -0.5064593, -1.575215, 0, 1, 0.1607843, 1,
-0.3502609, -1.733413, -4.040401, 0, 1, 0.1647059, 1,
-0.3494651, 0.3992571, 0.04663847, 0, 1, 0.172549, 1,
-0.3481588, -0.4038242, -1.638439, 0, 1, 0.1764706, 1,
-0.3398143, 0.5484288, 0.3878354, 0, 1, 0.1843137, 1,
-0.3392012, -2.542013, -2.808457, 0, 1, 0.1882353, 1,
-0.3386641, 1.209238, -1.385763, 0, 1, 0.1960784, 1,
-0.3358216, 1.244977, 0.4794459, 0, 1, 0.2039216, 1,
-0.3344317, 0.0742438, 0.0933267, 0, 1, 0.2078431, 1,
-0.3287649, 1.753917, -1.972849, 0, 1, 0.2156863, 1,
-0.3284531, -0.4873002, -2.440834, 0, 1, 0.2196078, 1,
-0.3263574, 1.287099, -0.302919, 0, 1, 0.227451, 1,
-0.324865, 0.2528216, -0.7070572, 0, 1, 0.2313726, 1,
-0.3224207, -1.062038, -1.653985, 0, 1, 0.2392157, 1,
-0.3203078, 1.27066, -0.4433063, 0, 1, 0.2431373, 1,
-0.3187829, -0.4320111, -1.938048, 0, 1, 0.2509804, 1,
-0.3173677, -0.3665084, -2.680247, 0, 1, 0.254902, 1,
-0.3169185, 0.7778719, 0.06247885, 0, 1, 0.2627451, 1,
-0.3169025, 0.2581767, -0.8232335, 0, 1, 0.2666667, 1,
-0.3108827, -0.6654813, -1.122201, 0, 1, 0.2745098, 1,
-0.3102398, -1.196339, -2.748133, 0, 1, 0.2784314, 1,
-0.3028051, -0.9317065, -3.173371, 0, 1, 0.2862745, 1,
-0.3006716, -0.5733429, -2.704681, 0, 1, 0.2901961, 1,
-0.2998175, -1.166127, -4.321092, 0, 1, 0.2980392, 1,
-0.2963405, 0.6948236, 0.05596397, 0, 1, 0.3058824, 1,
-0.2950224, -0.9242459, -2.054118, 0, 1, 0.3098039, 1,
-0.2946312, 0.06326436, -0.8655584, 0, 1, 0.3176471, 1,
-0.2940538, -0.8133733, -2.788635, 0, 1, 0.3215686, 1,
-0.2921235, -1.414204, -3.005494, 0, 1, 0.3294118, 1,
-0.289717, -1.368047, -4.051326, 0, 1, 0.3333333, 1,
-0.2889566, -1.106529, -3.54526, 0, 1, 0.3411765, 1,
-0.2867969, -0.1635198, -3.283851, 0, 1, 0.345098, 1,
-0.2835295, -0.6870839, -4.817813, 0, 1, 0.3529412, 1,
-0.2822343, 0.4355817, 0.01013975, 0, 1, 0.3568628, 1,
-0.2786437, 0.02601875, -1.338559, 0, 1, 0.3647059, 1,
-0.275344, -0.5931822, -2.562998, 0, 1, 0.3686275, 1,
-0.2726927, 0.6969908, 0.3622443, 0, 1, 0.3764706, 1,
-0.263262, 1.798709, 0.5711986, 0, 1, 0.3803922, 1,
-0.2569229, -0.4419353, -3.800816, 0, 1, 0.3882353, 1,
-0.2518957, -0.1496489, -2.02813, 0, 1, 0.3921569, 1,
-0.2508435, 1.379168, -0.2177614, 0, 1, 0.4, 1,
-0.2507152, 0.1032224, -1.230201, 0, 1, 0.4078431, 1,
-0.2484508, -0.3462251, -4.134394, 0, 1, 0.4117647, 1,
-0.2471706, -0.5576156, -2.882252, 0, 1, 0.4196078, 1,
-0.2432805, -1.055224, -4.357528, 0, 1, 0.4235294, 1,
-0.2424035, 0.6404696, -1.361779, 0, 1, 0.4313726, 1,
-0.2423979, -0.2011808, -2.193087, 0, 1, 0.4352941, 1,
-0.239417, 0.9300248, -0.5217062, 0, 1, 0.4431373, 1,
-0.2394086, 0.3584791, 0.3741449, 0, 1, 0.4470588, 1,
-0.2372053, 0.01951091, 0.9153466, 0, 1, 0.454902, 1,
-0.2368854, -0.4197758, -2.80994, 0, 1, 0.4588235, 1,
-0.2358067, 0.01021717, -2.703546, 0, 1, 0.4666667, 1,
-0.2351012, -0.6577229, -3.540797, 0, 1, 0.4705882, 1,
-0.2341725, 0.2815497, 0.1609693, 0, 1, 0.4784314, 1,
-0.23102, 1.054661, -0.878209, 0, 1, 0.4823529, 1,
-0.2160248, 0.04456254, -0.4601291, 0, 1, 0.4901961, 1,
-0.215486, -0.8294269, -2.16488, 0, 1, 0.4941176, 1,
-0.2135233, -1.073658, -4.663692, 0, 1, 0.5019608, 1,
-0.2093213, 1.271345, -1.441589, 0, 1, 0.509804, 1,
-0.2080069, 1.229204, -0.8394907, 0, 1, 0.5137255, 1,
-0.2075136, 0.1382269, 1.076879, 0, 1, 0.5215687, 1,
-0.2069097, -0.5203096, -2.700412, 0, 1, 0.5254902, 1,
-0.1995843, 0.5937595, -1.608272, 0, 1, 0.5333334, 1,
-0.1971926, 0.1848397, -1.897428, 0, 1, 0.5372549, 1,
-0.1922757, -0.2461149, -2.882117, 0, 1, 0.5450981, 1,
-0.1919743, 0.8751109, 0.884092, 0, 1, 0.5490196, 1,
-0.1906075, -1.065512, -2.347624, 0, 1, 0.5568628, 1,
-0.1811442, -0.09399166, -1.538301, 0, 1, 0.5607843, 1,
-0.176165, -0.783068, -2.745801, 0, 1, 0.5686275, 1,
-0.1750993, -0.8846676, -3.447134, 0, 1, 0.572549, 1,
-0.172881, 0.5653449, 0.8644865, 0, 1, 0.5803922, 1,
-0.1713042, -0.7663379, -2.36588, 0, 1, 0.5843138, 1,
-0.1637769, 1.182753, -1.648103, 0, 1, 0.5921569, 1,
-0.163761, -2.95236, -3.356928, 0, 1, 0.5960785, 1,
-0.1637219, 0.05412606, -2.396543, 0, 1, 0.6039216, 1,
-0.1624433, -1.255093, -2.655097, 0, 1, 0.6117647, 1,
-0.1618619, 1.045098, -0.6468077, 0, 1, 0.6156863, 1,
-0.1614821, -1.028503, -4.31969, 0, 1, 0.6235294, 1,
-0.1570596, 0.04369174, -1.768304, 0, 1, 0.627451, 1,
-0.1508286, 2.537628, -0.2844981, 0, 1, 0.6352941, 1,
-0.1507083, 0.9950261, 0.2980274, 0, 1, 0.6392157, 1,
-0.1493499, 0.1419245, -0.862636, 0, 1, 0.6470588, 1,
-0.1453815, 0.7843995, 0.797763, 0, 1, 0.6509804, 1,
-0.1440884, -1.168249, -2.39609, 0, 1, 0.6588235, 1,
-0.141892, -0.9204246, -4.569144, 0, 1, 0.6627451, 1,
-0.1401162, 0.506334, 0.4181447, 0, 1, 0.6705883, 1,
-0.1400119, -0.7262327, -4.363256, 0, 1, 0.6745098, 1,
-0.1245768, -1.373496, -3.626224, 0, 1, 0.682353, 1,
-0.1244693, 0.6491242, 1.283711, 0, 1, 0.6862745, 1,
-0.122348, 0.2540788, 0.2151761, 0, 1, 0.6941177, 1,
-0.1168726, -0.2392155, -2.654846, 0, 1, 0.7019608, 1,
-0.1107526, -0.05364519, -1.659528, 0, 1, 0.7058824, 1,
-0.1104351, -0.1629775, -4.109731, 0, 1, 0.7137255, 1,
-0.1098106, -0.6876596, -2.655335, 0, 1, 0.7176471, 1,
-0.1094347, 2.532784, 0.3472001, 0, 1, 0.7254902, 1,
-0.1091219, 0.4940544, -1.344961, 0, 1, 0.7294118, 1,
-0.1042479, -0.75826, -3.305429, 0, 1, 0.7372549, 1,
-0.1016697, 0.06050862, -0.264201, 0, 1, 0.7411765, 1,
-0.0986812, -1.29218, -2.078337, 0, 1, 0.7490196, 1,
-0.09596749, -0.1838188, -2.347272, 0, 1, 0.7529412, 1,
-0.09423298, 1.072818, 0.7526897, 0, 1, 0.7607843, 1,
-0.09305268, 0.0886246, -0.7182429, 0, 1, 0.7647059, 1,
-0.09218483, 0.4523464, -0.333577, 0, 1, 0.772549, 1,
-0.0889724, -0.5677689, -4.263037, 0, 1, 0.7764706, 1,
-0.08891927, -2.321802, -1.918248, 0, 1, 0.7843137, 1,
-0.08686265, -0.6843401, -3.271013, 0, 1, 0.7882353, 1,
-0.0859389, -0.2940315, -2.743678, 0, 1, 0.7960784, 1,
-0.0857434, -1.0791, -2.088803, 0, 1, 0.8039216, 1,
-0.08557589, 0.9540427, 0.4582363, 0, 1, 0.8078431, 1,
-0.08303345, -0.394921, -3.282983, 0, 1, 0.8156863, 1,
-0.08136746, 0.1035214, 0.07187353, 0, 1, 0.8196079, 1,
-0.07874543, -0.4328513, -5.007617, 0, 1, 0.827451, 1,
-0.07625666, -1.413615, -1.805673, 0, 1, 0.8313726, 1,
-0.07619368, 0.6382803, -1.200223, 0, 1, 0.8392157, 1,
-0.07258195, 0.4487177, 0.4238638, 0, 1, 0.8431373, 1,
-0.07069781, -0.3369466, -2.312343, 0, 1, 0.8509804, 1,
-0.06758244, 0.8794861, -0.5337886, 0, 1, 0.854902, 1,
-0.06728289, -1.922485, -2.425692, 0, 1, 0.8627451, 1,
-0.06521656, 1.852866, -0.3885677, 0, 1, 0.8666667, 1,
-0.05965152, 1.706824, -0.294422, 0, 1, 0.8745098, 1,
-0.05946587, 0.4520961, 0.3740264, 0, 1, 0.8784314, 1,
-0.05754867, 0.1475047, 0.01401674, 0, 1, 0.8862745, 1,
-0.05721267, 0.5122651, -1.005929, 0, 1, 0.8901961, 1,
-0.04736365, -1.783581, -3.294571, 0, 1, 0.8980392, 1,
-0.04602129, -0.8824704, -1.72662, 0, 1, 0.9058824, 1,
-0.04426592, 0.4989744, -0.2657702, 0, 1, 0.9098039, 1,
-0.03877436, 0.5617158, 0.2149714, 0, 1, 0.9176471, 1,
-0.03739051, -1.12325, -2.471184, 0, 1, 0.9215686, 1,
-0.03636292, 1.123319, -0.4735165, 0, 1, 0.9294118, 1,
-0.03551752, 0.8483394, 0.3610341, 0, 1, 0.9333333, 1,
-0.03463595, 1.073354, -2.508723, 0, 1, 0.9411765, 1,
-0.02604868, -2.448274, -3.640657, 0, 1, 0.945098, 1,
-0.02247989, 0.6464721, 0.4675917, 0, 1, 0.9529412, 1,
-0.02226508, -0.7430874, -5.04575, 0, 1, 0.9568627, 1,
-0.02170357, -0.8329951, -4.342309, 0, 1, 0.9647059, 1,
-0.0214913, 0.7777263, 0.5293673, 0, 1, 0.9686275, 1,
-0.0205862, -0.09084604, -3.591042, 0, 1, 0.9764706, 1,
-0.01967281, -0.4382036, -3.420229, 0, 1, 0.9803922, 1,
-0.01657939, -1.512084, -3.876592, 0, 1, 0.9882353, 1,
-0.01503467, -1.859921, -1.79733, 0, 1, 0.9921569, 1,
-0.01473305, -1.019906, -5.444102, 0, 1, 1, 1,
-0.01251872, 0.2856635, -0.139348, 0, 0.9921569, 1, 1,
-0.01235467, -1.41754, -1.861931, 0, 0.9882353, 1, 1,
-0.01098193, -0.4460937, -2.258802, 0, 0.9803922, 1, 1,
-0.008813455, -0.905162, -2.271961, 0, 0.9764706, 1, 1,
-0.004953092, -2.504035, -3.180545, 0, 0.9686275, 1, 1,
-0.0008787255, -0.5620652, -2.265732, 0, 0.9647059, 1, 1,
0.001261938, 1.715833, 1.31478, 0, 0.9568627, 1, 1,
0.00143562, 1.009102, 0.009559986, 0, 0.9529412, 1, 1,
0.001945561, -0.7236209, 2.357614, 0, 0.945098, 1, 1,
0.003911805, 0.4284855, 1.518686, 0, 0.9411765, 1, 1,
0.004653745, 0.6703402, 0.5467599, 0, 0.9333333, 1, 1,
0.01004633, 0.5707919, -0.8246981, 0, 0.9294118, 1, 1,
0.01369185, -0.24698, 3.002661, 0, 0.9215686, 1, 1,
0.01450095, -0.3935251, 3.35402, 0, 0.9176471, 1, 1,
0.01544048, 0.1166063, -0.1690521, 0, 0.9098039, 1, 1,
0.01584653, -0.5270693, 3.716101, 0, 0.9058824, 1, 1,
0.01599241, 0.5363393, 1.647102, 0, 0.8980392, 1, 1,
0.01689793, 1.159312, 1.002525, 0, 0.8901961, 1, 1,
0.01921766, -1.507284, 2.732626, 0, 0.8862745, 1, 1,
0.02398303, 0.5907844, 0.3168512, 0, 0.8784314, 1, 1,
0.02430329, -0.05882601, 3.695561, 0, 0.8745098, 1, 1,
0.03475504, 0.4320261, 0.6709476, 0, 0.8666667, 1, 1,
0.03798549, -0.7088504, 2.366506, 0, 0.8627451, 1, 1,
0.04273666, 1.618412, -0.3554053, 0, 0.854902, 1, 1,
0.04454226, 2.097537, -1.554137, 0, 0.8509804, 1, 1,
0.04553528, 0.7718488, 1.58963, 0, 0.8431373, 1, 1,
0.0501259, 1.517206, 0.2432064, 0, 0.8392157, 1, 1,
0.05585702, 0.8530508, 0.13865, 0, 0.8313726, 1, 1,
0.05630902, 0.5090193, -0.8106488, 0, 0.827451, 1, 1,
0.05960794, -1.503038, 3.391499, 0, 0.8196079, 1, 1,
0.06138714, -1.187269, 2.549834, 0, 0.8156863, 1, 1,
0.07050771, 0.7374113, 1.502233, 0, 0.8078431, 1, 1,
0.07468873, -1.851414, 1.7916, 0, 0.8039216, 1, 1,
0.07631832, 0.02691527, 0.865535, 0, 0.7960784, 1, 1,
0.08651894, -1.128493, 3.982428, 0, 0.7882353, 1, 1,
0.09007606, 0.2701596, 1.716468, 0, 0.7843137, 1, 1,
0.09154763, -0.6295415, 3.117825, 0, 0.7764706, 1, 1,
0.09167755, 0.01940521, 1.349002, 0, 0.772549, 1, 1,
0.09355908, 0.8319392, 0.08530212, 0, 0.7647059, 1, 1,
0.0978863, -1.521136, 2.839827, 0, 0.7607843, 1, 1,
0.1037659, 0.8923291, -0.8830662, 0, 0.7529412, 1, 1,
0.108465, -0.6523695, 2.912189, 0, 0.7490196, 1, 1,
0.1114183, 0.1354095, -0.31727, 0, 0.7411765, 1, 1,
0.115678, -0.1593324, 2.395906, 0, 0.7372549, 1, 1,
0.1161848, -0.5574104, 3.444514, 0, 0.7294118, 1, 1,
0.1185304, 1.301872, 1.485798, 0, 0.7254902, 1, 1,
0.1197674, -0.2525355, 2.562058, 0, 0.7176471, 1, 1,
0.1198998, 1.310522, -0.654976, 0, 0.7137255, 1, 1,
0.1239871, -0.3709831, 3.035726, 0, 0.7058824, 1, 1,
0.1248308, -0.1657452, 4.092748, 0, 0.6980392, 1, 1,
0.1283908, 0.2396175, 1.857654, 0, 0.6941177, 1, 1,
0.1294414, -0.6118387, 1.455455, 0, 0.6862745, 1, 1,
0.1302908, -0.1810991, 3.210577, 0, 0.682353, 1, 1,
0.1343286, 1.020095, -0.2290107, 0, 0.6745098, 1, 1,
0.1359561, -1.018375, 2.841697, 0, 0.6705883, 1, 1,
0.1398932, 0.5379961, 0.1825718, 0, 0.6627451, 1, 1,
0.1415899, 0.2430439, 0.1537883, 0, 0.6588235, 1, 1,
0.1440022, 1.640494, 2.146055, 0, 0.6509804, 1, 1,
0.1532007, -0.009367014, 1.471922, 0, 0.6470588, 1, 1,
0.1532495, 0.4721157, 0.4262018, 0, 0.6392157, 1, 1,
0.1596076, -0.121891, 2.367881, 0, 0.6352941, 1, 1,
0.1623748, 0.6385658, -0.5235753, 0, 0.627451, 1, 1,
0.1641916, 0.3671317, -0.6250423, 0, 0.6235294, 1, 1,
0.1658989, -0.5262468, 2.881525, 0, 0.6156863, 1, 1,
0.1737971, -0.2703235, 2.29542, 0, 0.6117647, 1, 1,
0.174457, 0.9115165, 0.9318218, 0, 0.6039216, 1, 1,
0.1757528, 0.960036, 0.4768992, 0, 0.5960785, 1, 1,
0.1816331, -0.07522158, 2.382532, 0, 0.5921569, 1, 1,
0.1872147, 0.09008362, 2.877159, 0, 0.5843138, 1, 1,
0.1889198, -0.9304016, 1.814567, 0, 0.5803922, 1, 1,
0.1926841, -0.530779, 3.193475, 0, 0.572549, 1, 1,
0.1973167, -1.170995, 4.492339, 0, 0.5686275, 1, 1,
0.1980212, -1.737552, 3.403922, 0, 0.5607843, 1, 1,
0.2022017, -0.644383, 1.975946, 0, 0.5568628, 1, 1,
0.2068524, 0.7082875, -0.3107768, 0, 0.5490196, 1, 1,
0.20809, 0.5644375, -0.5061001, 0, 0.5450981, 1, 1,
0.2102634, -2.11927, 2.28265, 0, 0.5372549, 1, 1,
0.2131263, 1.390406, -0.03631229, 0, 0.5333334, 1, 1,
0.2134538, -0.1692743, 3.752543, 0, 0.5254902, 1, 1,
0.2152824, 0.01105952, 2.635696, 0, 0.5215687, 1, 1,
0.2174492, 1.694585, 2.238044, 0, 0.5137255, 1, 1,
0.2217946, -0.7198639, 1.81022, 0, 0.509804, 1, 1,
0.2225498, -0.1076095, 2.16156, 0, 0.5019608, 1, 1,
0.2234716, 0.6008881, 1.000731, 0, 0.4941176, 1, 1,
0.2300536, -3.055787, 3.996012, 0, 0.4901961, 1, 1,
0.2379463, -0.4534479, 2.139027, 0, 0.4823529, 1, 1,
0.2417745, -0.7870429, 3.898374, 0, 0.4784314, 1, 1,
0.2440161, 0.4115006, 1.36052, 0, 0.4705882, 1, 1,
0.2496594, -1.319035, 3.118149, 0, 0.4666667, 1, 1,
0.255027, -1.633483, 3.041404, 0, 0.4588235, 1, 1,
0.2571438, 0.454516, -0.4758397, 0, 0.454902, 1, 1,
0.2574427, 0.8107526, 1.371791, 0, 0.4470588, 1, 1,
0.2578618, -1.887653, 4.742288, 0, 0.4431373, 1, 1,
0.2588608, 0.2827439, 1.079662, 0, 0.4352941, 1, 1,
0.2672977, -2.016382, 2.252129, 0, 0.4313726, 1, 1,
0.270818, -2.012414, 2.842866, 0, 0.4235294, 1, 1,
0.275924, 1.886318, 0.5407178, 0, 0.4196078, 1, 1,
0.2768967, -0.2559755, 2.519621, 0, 0.4117647, 1, 1,
0.2777097, -0.4889732, 2.910259, 0, 0.4078431, 1, 1,
0.2832963, -0.4076931, 2.462208, 0, 0.4, 1, 1,
0.2847674, -1.498068, 4.823841, 0, 0.3921569, 1, 1,
0.2902887, -1.735009, 4.402637, 0, 0.3882353, 1, 1,
0.290826, 0.523314, 0.8602516, 0, 0.3803922, 1, 1,
0.2909202, -1.699059, 2.580619, 0, 0.3764706, 1, 1,
0.2930217, -0.9642362, 1.47996, 0, 0.3686275, 1, 1,
0.2943266, -0.7588781, 1.940258, 0, 0.3647059, 1, 1,
0.2974978, -0.05261378, 0.8513512, 0, 0.3568628, 1, 1,
0.3096586, 0.4401979, 1.352013, 0, 0.3529412, 1, 1,
0.311079, 1.489507, -0.5121741, 0, 0.345098, 1, 1,
0.3153533, 0.5035624, -0.1493318, 0, 0.3411765, 1, 1,
0.3200045, 1.346406, -0.682658, 0, 0.3333333, 1, 1,
0.3231228, 0.7569516, -1.480098, 0, 0.3294118, 1, 1,
0.3255691, -0.1255475, 2.134913, 0, 0.3215686, 1, 1,
0.3286372, 1.840525, 0.2336655, 0, 0.3176471, 1, 1,
0.3316087, 2.525278, 1.136943, 0, 0.3098039, 1, 1,
0.3358391, -0.6786152, 2.948, 0, 0.3058824, 1, 1,
0.3385087, -0.1467366, 2.024402, 0, 0.2980392, 1, 1,
0.3407181, 0.203709, 1.736344, 0, 0.2901961, 1, 1,
0.3449503, -0.9845742, 2.166202, 0, 0.2862745, 1, 1,
0.358521, -0.3866729, 3.731741, 0, 0.2784314, 1, 1,
0.3596403, 0.2079177, 0.4315924, 0, 0.2745098, 1, 1,
0.3601702, 0.1094759, 2.500482, 0, 0.2666667, 1, 1,
0.3605819, -1.531595, 2.462586, 0, 0.2627451, 1, 1,
0.3611364, -2.283642, 2.376809, 0, 0.254902, 1, 1,
0.3640108, 1.066295, 0.8646392, 0, 0.2509804, 1, 1,
0.3651831, -0.1750633, 3.083096, 0, 0.2431373, 1, 1,
0.3661909, 1.111198, 2.360706, 0, 0.2392157, 1, 1,
0.3677397, -1.57708, 3.04691, 0, 0.2313726, 1, 1,
0.3696645, 1.707385, 0.1826157, 0, 0.227451, 1, 1,
0.3699412, -0.7399657, 4.701153, 0, 0.2196078, 1, 1,
0.3724976, -1.632416, 2.144299, 0, 0.2156863, 1, 1,
0.3801448, -1.019914, 2.432557, 0, 0.2078431, 1, 1,
0.3830804, 1.167362, -0.6156774, 0, 0.2039216, 1, 1,
0.384444, 0.7065394, 0.9963837, 0, 0.1960784, 1, 1,
0.3846369, -0.0004812967, 0.9370775, 0, 0.1882353, 1, 1,
0.3913307, 0.02853847, 1.452874, 0, 0.1843137, 1, 1,
0.3925203, 2.610416, 2.710102, 0, 0.1764706, 1, 1,
0.3933384, -0.9269748, 1.770275, 0, 0.172549, 1, 1,
0.3936043, 0.1036575, 0.6771358, 0, 0.1647059, 1, 1,
0.3968916, 0.791483, -0.02358966, 0, 0.1607843, 1, 1,
0.3971919, -0.9740907, 2.211927, 0, 0.1529412, 1, 1,
0.3978189, -1.133955, 2.833072, 0, 0.1490196, 1, 1,
0.398701, -0.4326157, 1.582294, 0, 0.1411765, 1, 1,
0.3992676, 1.506083, 1.185324, 0, 0.1372549, 1, 1,
0.4006433, 0.7889289, -0.8929232, 0, 0.1294118, 1, 1,
0.4057716, -0.125967, 0.7790744, 0, 0.1254902, 1, 1,
0.4112328, 1.362691, -1.922346, 0, 0.1176471, 1, 1,
0.4116174, -1.063722, 4.026981, 0, 0.1137255, 1, 1,
0.412847, -0.04214773, 1.321556, 0, 0.1058824, 1, 1,
0.4137796, -0.6493555, 4.256507, 0, 0.09803922, 1, 1,
0.4150814, -0.182069, 1.123149, 0, 0.09411765, 1, 1,
0.4182405, -0.02628594, 0.9987627, 0, 0.08627451, 1, 1,
0.4206702, 1.603702, 0.3029158, 0, 0.08235294, 1, 1,
0.4210543, 0.5992209, 2.960015, 0, 0.07450981, 1, 1,
0.4219417, -1.993341, 2.56843, 0, 0.07058824, 1, 1,
0.4329909, 0.848998, 0.1684193, 0, 0.0627451, 1, 1,
0.434148, -0.9345056, 1.858129, 0, 0.05882353, 1, 1,
0.4341587, -0.05607749, 1.619939, 0, 0.05098039, 1, 1,
0.4344289, 1.23633, -0.4499499, 0, 0.04705882, 1, 1,
0.4375347, -0.7165939, 2.761749, 0, 0.03921569, 1, 1,
0.4393552, 0.2757224, 0.8416276, 0, 0.03529412, 1, 1,
0.4408217, 0.348227, -0.8851286, 0, 0.02745098, 1, 1,
0.4444154, 0.5111501, 2.340087, 0, 0.02352941, 1, 1,
0.4455191, -0.6197464, 2.492862, 0, 0.01568628, 1, 1,
0.4462603, 0.06952199, 1.846831, 0, 0.01176471, 1, 1,
0.4501431, -0.524309, 3.347147, 0, 0.003921569, 1, 1,
0.4507035, 1.071135, -0.6784668, 0.003921569, 0, 1, 1,
0.4532241, -0.1630923, 3.611582, 0.007843138, 0, 1, 1,
0.4537553, -0.0325592, 0.9194381, 0.01568628, 0, 1, 1,
0.4558752, 1.135123, 0.8729143, 0.01960784, 0, 1, 1,
0.4565775, -0.4262037, 1.453522, 0.02745098, 0, 1, 1,
0.4566322, 0.3918262, -0.1497433, 0.03137255, 0, 1, 1,
0.4571498, 0.117603, 3.158464, 0.03921569, 0, 1, 1,
0.4574781, -1.315635, 1.776793, 0.04313726, 0, 1, 1,
0.4628445, 0.5255715, 0.1398608, 0.05098039, 0, 1, 1,
0.4629555, 1.249051, 0.402676, 0.05490196, 0, 1, 1,
0.469252, 1.597806, -0.8443671, 0.0627451, 0, 1, 1,
0.4724272, 0.4534043, 1.595846, 0.06666667, 0, 1, 1,
0.4731189, 1.779396, 0.1457694, 0.07450981, 0, 1, 1,
0.4770941, -0.4763392, 2.659597, 0.07843138, 0, 1, 1,
0.4773131, 1.965632, -1.271362, 0.08627451, 0, 1, 1,
0.4817372, 0.2458445, 1.056487, 0.09019608, 0, 1, 1,
0.4821299, -0.04606317, 1.915191, 0.09803922, 0, 1, 1,
0.4827177, 0.5863709, 2.197667, 0.1058824, 0, 1, 1,
0.4834247, 1.701035, -0.1380085, 0.1098039, 0, 1, 1,
0.4840688, 0.8767438, -0.1955461, 0.1176471, 0, 1, 1,
0.4850983, -0.6822962, 2.181739, 0.1215686, 0, 1, 1,
0.4951227, 0.5047467, 0.6936247, 0.1294118, 0, 1, 1,
0.495347, 1.59261, 1.214704, 0.1333333, 0, 1, 1,
0.5037758, 0.5635077, 0.7598661, 0.1411765, 0, 1, 1,
0.5097797, 0.673803, 1.170741, 0.145098, 0, 1, 1,
0.5103695, -1.980307, 2.670727, 0.1529412, 0, 1, 1,
0.5121914, -0.8679333, 2.189024, 0.1568628, 0, 1, 1,
0.5142231, 1.187567, 0.4118779, 0.1647059, 0, 1, 1,
0.51547, -1.608246, 1.040234, 0.1686275, 0, 1, 1,
0.5161873, 1.777658, -0.3827029, 0.1764706, 0, 1, 1,
0.5170426, -0.0283992, 2.442463, 0.1803922, 0, 1, 1,
0.5171152, 2.377971, 1.261553, 0.1882353, 0, 1, 1,
0.51757, -0.8787697, 1.880298, 0.1921569, 0, 1, 1,
0.5233571, -0.3170429, 2.752959, 0.2, 0, 1, 1,
0.5235912, -1.244063, 2.209738, 0.2078431, 0, 1, 1,
0.5330836, -1.580611, 2.380688, 0.2117647, 0, 1, 1,
0.5331846, 0.2518414, 0.3777306, 0.2196078, 0, 1, 1,
0.5355116, 1.333663, -0.2325325, 0.2235294, 0, 1, 1,
0.5418129, -1.79952, 2.449027, 0.2313726, 0, 1, 1,
0.5438621, 2.635579, -0.09993692, 0.2352941, 0, 1, 1,
0.547293, -1.364909, 3.409302, 0.2431373, 0, 1, 1,
0.548903, -0.2583115, 2.133857, 0.2470588, 0, 1, 1,
0.5510373, 0.4701527, 1.091843, 0.254902, 0, 1, 1,
0.5516805, -0.3860941, 1.20951, 0.2588235, 0, 1, 1,
0.5522307, 0.3516116, 1.616097, 0.2666667, 0, 1, 1,
0.5646014, -1.118997, 1.31493, 0.2705882, 0, 1, 1,
0.5675176, -0.404586, 2.067366, 0.2784314, 0, 1, 1,
0.5697672, -0.8061005, 3.568415, 0.282353, 0, 1, 1,
0.5716509, -0.06652988, 3.296336, 0.2901961, 0, 1, 1,
0.5748343, -0.5837639, 1.427407, 0.2941177, 0, 1, 1,
0.5760123, 0.0560872, 0.7298161, 0.3019608, 0, 1, 1,
0.5778723, 0.4463742, 0.6701282, 0.3098039, 0, 1, 1,
0.5779433, 1.471072, 0.9444324, 0.3137255, 0, 1, 1,
0.5800101, 0.7479818, 1.220164, 0.3215686, 0, 1, 1,
0.5837332, -1.382108, 2.468504, 0.3254902, 0, 1, 1,
0.5848424, 0.957081, 0.04674302, 0.3333333, 0, 1, 1,
0.5870503, 0.9523289, 1.599301, 0.3372549, 0, 1, 1,
0.5921285, -0.7432318, 2.516632, 0.345098, 0, 1, 1,
0.5929895, -1.059478, 0.9656724, 0.3490196, 0, 1, 1,
0.5962436, -1.79259, 2.699416, 0.3568628, 0, 1, 1,
0.5963216, -1.536916, 4.469902, 0.3607843, 0, 1, 1,
0.5972373, -0.3317585, 1.318415, 0.3686275, 0, 1, 1,
0.6032087, 0.1493955, 1.182752, 0.372549, 0, 1, 1,
0.6098109, 0.2319449, 2.957271, 0.3803922, 0, 1, 1,
0.6114372, 0.9520243, 1.421165, 0.3843137, 0, 1, 1,
0.6118554, 0.1042119, 1.380232, 0.3921569, 0, 1, 1,
0.6128292, 0.8658572, 1.742399, 0.3960784, 0, 1, 1,
0.6136385, -1.083747, 2.404405, 0.4039216, 0, 1, 1,
0.6152336, -0.4625532, 1.561541, 0.4117647, 0, 1, 1,
0.617079, 0.1241669, 1.203038, 0.4156863, 0, 1, 1,
0.6177379, -0.9455842, 1.36586, 0.4235294, 0, 1, 1,
0.6189519, 1.10045, 0.3681056, 0.427451, 0, 1, 1,
0.6225418, -0.3591973, 1.612569, 0.4352941, 0, 1, 1,
0.6235688, 0.5026826, 0.8820859, 0.4392157, 0, 1, 1,
0.6257356, 1.068871, 0.9619448, 0.4470588, 0, 1, 1,
0.6263366, 0.9730167, 0.7672742, 0.4509804, 0, 1, 1,
0.633353, -0.7784582, 1.481816, 0.4588235, 0, 1, 1,
0.6336212, 1.569524, 1.422532, 0.4627451, 0, 1, 1,
0.6445644, -0.07835519, 0.7170208, 0.4705882, 0, 1, 1,
0.6558375, -1.348313, 2.777643, 0.4745098, 0, 1, 1,
0.6575518, 0.976495, 0.3980103, 0.4823529, 0, 1, 1,
0.6586961, -1.440755, 1.705185, 0.4862745, 0, 1, 1,
0.6642844, 1.070818, 1.635496, 0.4941176, 0, 1, 1,
0.6778186, -0.8285406, 4.638975, 0.5019608, 0, 1, 1,
0.6842346, -0.5132864, 0.4185686, 0.5058824, 0, 1, 1,
0.6870666, 0.07732702, 0.51718, 0.5137255, 0, 1, 1,
0.6871057, -0.4202488, -0.03725214, 0.5176471, 0, 1, 1,
0.6882011, 1.554129, 0.4751573, 0.5254902, 0, 1, 1,
0.6906138, -1.565901, 4.064711, 0.5294118, 0, 1, 1,
0.6980612, 1.086025, 1.985258, 0.5372549, 0, 1, 1,
0.7091396, 2.259566, 0.09709826, 0.5411765, 0, 1, 1,
0.7108119, 1.422189, 0.8166314, 0.5490196, 0, 1, 1,
0.7126273, -0.09592614, 0.6253554, 0.5529412, 0, 1, 1,
0.7145566, -1.157274, 1.53347, 0.5607843, 0, 1, 1,
0.7163895, -0.1787635, 0.2263241, 0.5647059, 0, 1, 1,
0.7264308, 0.2627428, 3.047526, 0.572549, 0, 1, 1,
0.7273071, -0.7149125, 3.254591, 0.5764706, 0, 1, 1,
0.7276823, -0.675625, 2.476343, 0.5843138, 0, 1, 1,
0.728395, 1.070087, -0.1087762, 0.5882353, 0, 1, 1,
0.7295056, -2.050609, 2.022558, 0.5960785, 0, 1, 1,
0.7367781, 1.263732, 2.115582, 0.6039216, 0, 1, 1,
0.7395027, 1.2202, 0.7662751, 0.6078432, 0, 1, 1,
0.745641, -0.1998053, 1.248855, 0.6156863, 0, 1, 1,
0.7537454, 0.6319354, -0.7915758, 0.6196079, 0, 1, 1,
0.7568628, -0.2446958, 1.887185, 0.627451, 0, 1, 1,
0.7582878, -0.7627539, 2.889444, 0.6313726, 0, 1, 1,
0.7593989, -0.6906758, 1.199007, 0.6392157, 0, 1, 1,
0.7625058, 0.1579444, 1.985716, 0.6431373, 0, 1, 1,
0.7642562, -0.8857011, 1.988683, 0.6509804, 0, 1, 1,
0.7690954, 0.1153581, 1.645423, 0.654902, 0, 1, 1,
0.7693498, 1.031457, 0.9055843, 0.6627451, 0, 1, 1,
0.7738968, -0.01800694, 2.887758, 0.6666667, 0, 1, 1,
0.7756802, -0.2612339, 1.815402, 0.6745098, 0, 1, 1,
0.7786576, 0.7732896, 0.1668734, 0.6784314, 0, 1, 1,
0.7801651, 0.002766875, 0.9506096, 0.6862745, 0, 1, 1,
0.7807204, -1.271339, 3.267443, 0.6901961, 0, 1, 1,
0.7817525, -1.584637, 1.902649, 0.6980392, 0, 1, 1,
0.7847207, -1.091221, 1.710346, 0.7058824, 0, 1, 1,
0.7866185, -1.149424, 1.856683, 0.7098039, 0, 1, 1,
0.7906979, -0.1471479, 2.95694, 0.7176471, 0, 1, 1,
0.790875, 0.2073169, 2.437971, 0.7215686, 0, 1, 1,
0.793604, -0.608836, 2.076688, 0.7294118, 0, 1, 1,
0.7985937, -0.6193275, 1.938647, 0.7333333, 0, 1, 1,
0.7987615, -0.7328234, 2.482715, 0.7411765, 0, 1, 1,
0.7990757, -0.3988954, 2.242784, 0.7450981, 0, 1, 1,
0.8016152, -0.7859989, 3.011542, 0.7529412, 0, 1, 1,
0.8028603, 1.00475, -0.1509419, 0.7568628, 0, 1, 1,
0.8081487, 0.6512567, -1.855772, 0.7647059, 0, 1, 1,
0.8153901, 1.629387, 1.622843, 0.7686275, 0, 1, 1,
0.816511, -0.1811462, 2.202697, 0.7764706, 0, 1, 1,
0.8182896, 0.7815474, 0.4129908, 0.7803922, 0, 1, 1,
0.8200288, -0.07158484, 1.889415, 0.7882353, 0, 1, 1,
0.8402824, 0.187401, 1.224929, 0.7921569, 0, 1, 1,
0.8420035, -0.7981987, 1.233198, 0.8, 0, 1, 1,
0.8430052, -0.06557243, 1.454374, 0.8078431, 0, 1, 1,
0.849261, -1.220447, 3.387733, 0.8117647, 0, 1, 1,
0.8512768, -0.537957, 2.349323, 0.8196079, 0, 1, 1,
0.8594581, 1.209741, 0.2989045, 0.8235294, 0, 1, 1,
0.8599058, -0.9670764, 2.409616, 0.8313726, 0, 1, 1,
0.8599815, -0.8139716, 3.600893, 0.8352941, 0, 1, 1,
0.8621169, 0.6947789, 3.496665, 0.8431373, 0, 1, 1,
0.8677677, -0.717845, 0.5259169, 0.8470588, 0, 1, 1,
0.8722866, -0.6972164, 2.900955, 0.854902, 0, 1, 1,
0.8728458, -0.4405339, 2.146568, 0.8588235, 0, 1, 1,
0.8770229, 0.4845999, 1.232938, 0.8666667, 0, 1, 1,
0.885666, -1.567109, 0.5194764, 0.8705882, 0, 1, 1,
0.8920546, -0.709348, 1.172775, 0.8784314, 0, 1, 1,
0.9006577, -0.6628667, 1.781801, 0.8823529, 0, 1, 1,
0.9019105, -0.3476886, 3.827613, 0.8901961, 0, 1, 1,
0.9116056, 0.9315692, 0.1753092, 0.8941177, 0, 1, 1,
0.9130069, -1.904144, 1.958341, 0.9019608, 0, 1, 1,
0.9138944, -0.220738, 1.884561, 0.9098039, 0, 1, 1,
0.9147684, 2.639667, 0.1434815, 0.9137255, 0, 1, 1,
0.9156981, 0.2436327, 1.037887, 0.9215686, 0, 1, 1,
0.9236733, -1.166151, 2.386794, 0.9254902, 0, 1, 1,
0.9337465, -0.5449142, 3.038409, 0.9333333, 0, 1, 1,
0.9352821, -0.5965872, 1.118849, 0.9372549, 0, 1, 1,
0.9361484, -0.253414, 2.281327, 0.945098, 0, 1, 1,
0.9391074, 2.326594, -1.535897, 0.9490196, 0, 1, 1,
0.9426115, 0.406374, 0.4398745, 0.9568627, 0, 1, 1,
0.9449857, 0.6238459, 0.1971623, 0.9607843, 0, 1, 1,
0.9461264, -2.413583, 2.353221, 0.9686275, 0, 1, 1,
0.9461606, 0.1292195, 2.881909, 0.972549, 0, 1, 1,
0.9468257, 0.07852435, 0.2920327, 0.9803922, 0, 1, 1,
0.9517943, 0.6969708, -0.9240544, 0.9843137, 0, 1, 1,
0.9543412, 0.3350391, 0.1000258, 0.9921569, 0, 1, 1,
0.963176, -1.498596, 3.964474, 0.9960784, 0, 1, 1,
0.9632348, 0.6557863, 0.4972634, 1, 0, 0.9960784, 1,
0.9641621, 0.2933321, 1.28942, 1, 0, 0.9882353, 1,
0.9668, 0.2620007, 1.832941, 1, 0, 0.9843137, 1,
0.9721096, 0.1733929, -0.1057808, 1, 0, 0.9764706, 1,
0.974734, 1.308716, -1.891426, 1, 0, 0.972549, 1,
0.9765875, -0.9764828, 2.363972, 1, 0, 0.9647059, 1,
0.9864907, 0.3828933, 0.9541962, 1, 0, 0.9607843, 1,
0.9866449, -2.358152, 2.779682, 1, 0, 0.9529412, 1,
0.986762, -1.838116, 4.406507, 1, 0, 0.9490196, 1,
0.9881253, -0.8854312, 2.638848, 1, 0, 0.9411765, 1,
1.000679, 0.3495428, -0.6873581, 1, 0, 0.9372549, 1,
1.002513, 0.3995874, 0.2706543, 1, 0, 0.9294118, 1,
1.00475, 0.5650895, 0.6496301, 1, 0, 0.9254902, 1,
1.011941, -1.89725, 1.977636, 1, 0, 0.9176471, 1,
1.018917, 2.629657, -1.252861, 1, 0, 0.9137255, 1,
1.027802, 0.8247609, -0.6808771, 1, 0, 0.9058824, 1,
1.029944, -1.40816, 3.638937, 1, 0, 0.9019608, 1,
1.040395, -0.2444827, 1.281383, 1, 0, 0.8941177, 1,
1.048739, -1.498753, 3.488922, 1, 0, 0.8862745, 1,
1.069324, -1.629007, 1.587839, 1, 0, 0.8823529, 1,
1.074075, -0.3083345, 1.940094, 1, 0, 0.8745098, 1,
1.078877, -0.4145793, 2.119638, 1, 0, 0.8705882, 1,
1.079214, 2.355242, 1.216123, 1, 0, 0.8627451, 1,
1.079533, -0.3680243, 2.484129, 1, 0, 0.8588235, 1,
1.080613, -0.1557506, 1.673586, 1, 0, 0.8509804, 1,
1.083406, -0.03349608, 0.7825617, 1, 0, 0.8470588, 1,
1.085463, 1.567293, 2.29723, 1, 0, 0.8392157, 1,
1.086628, -0.3235221, 1.178355, 1, 0, 0.8352941, 1,
1.087317, -0.3945965, 3.004769, 1, 0, 0.827451, 1,
1.10054, 0.7645779, 0.6929141, 1, 0, 0.8235294, 1,
1.114032, 0.5383239, 1.77685, 1, 0, 0.8156863, 1,
1.120392, 1.10991, 2.017894, 1, 0, 0.8117647, 1,
1.124246, 0.9423703, 1.536927, 1, 0, 0.8039216, 1,
1.133042, 0.1829886, 2.112113, 1, 0, 0.7960784, 1,
1.137691, 1.980759, 1.388197, 1, 0, 0.7921569, 1,
1.139121, 0.02395647, 2.425295, 1, 0, 0.7843137, 1,
1.139807, -0.2626737, 2.990876, 1, 0, 0.7803922, 1,
1.149998, 0.6630332, 1.191585, 1, 0, 0.772549, 1,
1.152188, 1.759817, 1.426037, 1, 0, 0.7686275, 1,
1.153261, 1.125759, -0.4361093, 1, 0, 0.7607843, 1,
1.153457, 0.994714, 0.8537248, 1, 0, 0.7568628, 1,
1.155149, 0.3350123, 2.563693, 1, 0, 0.7490196, 1,
1.162677, 0.04500152, -0.2668216, 1, 0, 0.7450981, 1,
1.166506, -1.065919, 3.942163, 1, 0, 0.7372549, 1,
1.168213, 0.540078, 1.948164, 1, 0, 0.7333333, 1,
1.190211, -0.3830058, 1.55157, 1, 0, 0.7254902, 1,
1.19069, 0.2679883, 1.34743, 1, 0, 0.7215686, 1,
1.192535, -0.3352413, 1.660546, 1, 0, 0.7137255, 1,
1.19867, -1.147152, 2.793334, 1, 0, 0.7098039, 1,
1.205274, -0.006419543, 2.50921, 1, 0, 0.7019608, 1,
1.217978, 1.051437, 2.511873, 1, 0, 0.6941177, 1,
1.229657, -1.785272, 3.010411, 1, 0, 0.6901961, 1,
1.242433, 0.03535866, 1.268196, 1, 0, 0.682353, 1,
1.246226, 0.0681152, 0.1740671, 1, 0, 0.6784314, 1,
1.246961, 1.094751, 0.9068504, 1, 0, 0.6705883, 1,
1.250533, -1.257458, 1.845871, 1, 0, 0.6666667, 1,
1.254833, -0.8428054, 1.192106, 1, 0, 0.6588235, 1,
1.259984, 2.060507, -2.074788, 1, 0, 0.654902, 1,
1.261109, 0.3549247, 1.339275, 1, 0, 0.6470588, 1,
1.268922, 1.987081, -0.4783291, 1, 0, 0.6431373, 1,
1.269983, -0.1733052, 2.972505, 1, 0, 0.6352941, 1,
1.275013, -2.937592, 2.04691, 1, 0, 0.6313726, 1,
1.276141, -0.3506495, 2.117615, 1, 0, 0.6235294, 1,
1.287372, -0.4984311, 3.203374, 1, 0, 0.6196079, 1,
1.292283, -0.8341275, 2.684319, 1, 0, 0.6117647, 1,
1.29707, -0.002823141, 2.125741, 1, 0, 0.6078432, 1,
1.299284, 0.4414575, 1.978902, 1, 0, 0.6, 1,
1.300163, -1.454841, 3.76594, 1, 0, 0.5921569, 1,
1.309539, 1.179437, 0.7927958, 1, 0, 0.5882353, 1,
1.312111, -0.1677649, 1.467303, 1, 0, 0.5803922, 1,
1.331995, -1.17749, 3.51329, 1, 0, 0.5764706, 1,
1.335448, 0.5053913, 0.7052632, 1, 0, 0.5686275, 1,
1.347831, 2.003214, -0.2249004, 1, 0, 0.5647059, 1,
1.350609, 0.008845353, 1.915404, 1, 0, 0.5568628, 1,
1.358835, 0.2930429, 0.2137551, 1, 0, 0.5529412, 1,
1.36472, -0.8502683, 2.43945, 1, 0, 0.5450981, 1,
1.365699, -2.325267, 1.753718, 1, 0, 0.5411765, 1,
1.366189, 0.7159967, 2.484341, 1, 0, 0.5333334, 1,
1.370275, 1.313702, 1.992967, 1, 0, 0.5294118, 1,
1.386559, -1.554881, 0.9378316, 1, 0, 0.5215687, 1,
1.394137, -1.089548, 1.809221, 1, 0, 0.5176471, 1,
1.394485, -1.347245, 2.559503, 1, 0, 0.509804, 1,
1.398406, -1.102629, 1.684059, 1, 0, 0.5058824, 1,
1.400794, -0.6153533, 2.308256, 1, 0, 0.4980392, 1,
1.405953, 1.208572, 0.8577123, 1, 0, 0.4901961, 1,
1.429613, -0.8491137, 0.9954371, 1, 0, 0.4862745, 1,
1.429625, -0.3023257, 0.6003125, 1, 0, 0.4784314, 1,
1.437441, -0.7883256, 1.792469, 1, 0, 0.4745098, 1,
1.443438, -1.371201, 2.855772, 1, 0, 0.4666667, 1,
1.446517, -1.389514, 1.699657, 1, 0, 0.4627451, 1,
1.452697, -0.7234997, 1.954054, 1, 0, 0.454902, 1,
1.481505, -0.02244844, 2.978603, 1, 0, 0.4509804, 1,
1.481571, -0.2536707, 0.8318393, 1, 0, 0.4431373, 1,
1.496754, 0.4455403, 1.426994, 1, 0, 0.4392157, 1,
1.497109, -0.6185519, 2.970414, 1, 0, 0.4313726, 1,
1.504578, -0.2547591, 4.228781, 1, 0, 0.427451, 1,
1.511347, -0.4208929, 0.3967219, 1, 0, 0.4196078, 1,
1.51556, 0.5692059, 0.9855371, 1, 0, 0.4156863, 1,
1.516675, -0.3462378, 2.407225, 1, 0, 0.4078431, 1,
1.517385, 0.8864687, 0.4149871, 1, 0, 0.4039216, 1,
1.53911, -0.6379245, 1.456301, 1, 0, 0.3960784, 1,
1.552656, -0.04599031, 0.7649258, 1, 0, 0.3882353, 1,
1.559004, -0.3032497, -0.2388891, 1, 0, 0.3843137, 1,
1.572307, -1.221162, 0.8040684, 1, 0, 0.3764706, 1,
1.578108, -1.142906, 2.724646, 1, 0, 0.372549, 1,
1.579762, 0.0335178, -0.5815203, 1, 0, 0.3647059, 1,
1.581114, -0.3586677, 2.977865, 1, 0, 0.3607843, 1,
1.593879, -1.156266, 0.3743895, 1, 0, 0.3529412, 1,
1.597148, 1.234921, -0.2396742, 1, 0, 0.3490196, 1,
1.623707, 0.08290491, 1.284512, 1, 0, 0.3411765, 1,
1.631496, -0.610123, 2.200738, 1, 0, 0.3372549, 1,
1.633305, -0.5134135, 1.237091, 1, 0, 0.3294118, 1,
1.636334, -0.7293888, 2.384412, 1, 0, 0.3254902, 1,
1.684035, -0.7520205, 2.582547, 1, 0, 0.3176471, 1,
1.686105, -0.5759055, 1.391968, 1, 0, 0.3137255, 1,
1.687333, -0.5441929, 2.329918, 1, 0, 0.3058824, 1,
1.690974, -1.47835, 2.918013, 1, 0, 0.2980392, 1,
1.694948, 0.4281756, 0.3419297, 1, 0, 0.2941177, 1,
1.704682, 0.2611586, 1.657639, 1, 0, 0.2862745, 1,
1.708894, 1.178398, 0.9203894, 1, 0, 0.282353, 1,
1.716434, 0.1447707, 2.069129, 1, 0, 0.2745098, 1,
1.720864, -1.071222, 1.830071, 1, 0, 0.2705882, 1,
1.734707, -0.4071227, 2.029636, 1, 0, 0.2627451, 1,
1.740659, -0.7427137, 2.106941, 1, 0, 0.2588235, 1,
1.740703, 0.642765, 0.465611, 1, 0, 0.2509804, 1,
1.742163, -1.211812, 1.041604, 1, 0, 0.2470588, 1,
1.772418, 1.678777, 0.3715412, 1, 0, 0.2392157, 1,
1.785514, -0.3109758, 2.653841, 1, 0, 0.2352941, 1,
1.792753, 1.213639, 0.486875, 1, 0, 0.227451, 1,
1.811186, 2.195779, 0.2784731, 1, 0, 0.2235294, 1,
1.836046, -0.7077056, 0.9963313, 1, 0, 0.2156863, 1,
1.841832, 1.356717, 1.430183, 1, 0, 0.2117647, 1,
1.859126, -0.4674289, -0.3115343, 1, 0, 0.2039216, 1,
1.878393, -1.345692, 3.167925, 1, 0, 0.1960784, 1,
1.887825, 0.5576185, 1.86007, 1, 0, 0.1921569, 1,
1.903605, 0.4243759, 0.4493914, 1, 0, 0.1843137, 1,
1.912431, 0.5638313, 1.053763, 1, 0, 0.1803922, 1,
1.937623, 0.9069054, 1.686731, 1, 0, 0.172549, 1,
1.943919, -1.590572, 2.650198, 1, 0, 0.1686275, 1,
1.948966, 0.267709, 1.257495, 1, 0, 0.1607843, 1,
1.974893, 1.321422, -0.1090489, 1, 0, 0.1568628, 1,
1.977606, 0.5173345, 1.206898, 1, 0, 0.1490196, 1,
1.981429, 0.767408, 2.025599, 1, 0, 0.145098, 1,
1.996804, 0.6719056, -1.06921, 1, 0, 0.1372549, 1,
2.002855, -0.2902068, 2.590883, 1, 0, 0.1333333, 1,
2.008687, -0.4145076, 3.939425, 1, 0, 0.1254902, 1,
2.028079, 1.397576, 1.417945, 1, 0, 0.1215686, 1,
2.033109, -1.217141, 1.95444, 1, 0, 0.1137255, 1,
2.03381, 1.778843, 0.1216323, 1, 0, 0.1098039, 1,
2.038042, -1.671646, 2.624996, 1, 0, 0.1019608, 1,
2.048557, 0.02601459, 2.308808, 1, 0, 0.09411765, 1,
2.075964, -0.5041604, 1.114498, 1, 0, 0.09019608, 1,
2.078167, -0.337701, 1.196707, 1, 0, 0.08235294, 1,
2.089949, 0.2518542, 0.7997521, 1, 0, 0.07843138, 1,
2.108606, -0.5929875, 1.714123, 1, 0, 0.07058824, 1,
2.120981, 1.920094, 1.692251, 1, 0, 0.06666667, 1,
2.125279, -0.1357989, 2.4552, 1, 0, 0.05882353, 1,
2.202451, -0.4682077, 0.3014694, 1, 0, 0.05490196, 1,
2.292063, 0.9218858, 0.7629957, 1, 0, 0.04705882, 1,
2.294111, 2.948264, 0.514712, 1, 0, 0.04313726, 1,
2.478801, 0.1507462, 2.16897, 1, 0, 0.03529412, 1,
2.525448, 0.6783276, 1.594624, 1, 0, 0.03137255, 1,
2.607, 0.05590968, -0.1971669, 1, 0, 0.02352941, 1,
2.651139, -0.9995169, 1.939151, 1, 0, 0.01960784, 1,
2.89854, -0.2327544, 0.6077098, 1, 0, 0.01176471, 1,
3.083344, -0.9390432, 3.735586, 1, 0, 0.007843138, 1
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
-0.2734449, -4.073474, -7.362883, 0, -0.5, 0.5, 0.5,
-0.2734449, -4.073474, -7.362883, 1, -0.5, 0.5, 0.5,
-0.2734449, -4.073474, -7.362883, 1, 1.5, 0.5, 0.5,
-0.2734449, -4.073474, -7.362883, 0, 1.5, 0.5, 0.5
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
-4.768186, -0.0537616, -7.362883, 0, -0.5, 0.5, 0.5,
-4.768186, -0.0537616, -7.362883, 1, -0.5, 0.5, 0.5,
-4.768186, -0.0537616, -7.362883, 1, 1.5, 0.5, 0.5,
-4.768186, -0.0537616, -7.362883, 0, 1.5, 0.5, 0.5
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
-4.768186, -4.073474, -0.3863876, 0, -0.5, 0.5, 0.5,
-4.768186, -4.073474, -0.3863876, 1, -0.5, 0.5, 0.5,
-4.768186, -4.073474, -0.3863876, 1, 1.5, 0.5, 0.5,
-4.768186, -4.073474, -0.3863876, 0, 1.5, 0.5, 0.5
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
-3, -3.145848, -5.752923,
3, -3.145848, -5.752923,
-3, -3.145848, -5.752923,
-3, -3.300452, -6.021249,
-2, -3.145848, -5.752923,
-2, -3.300452, -6.021249,
-1, -3.145848, -5.752923,
-1, -3.300452, -6.021249,
0, -3.145848, -5.752923,
0, -3.300452, -6.021249,
1, -3.145848, -5.752923,
1, -3.300452, -6.021249,
2, -3.145848, -5.752923,
2, -3.300452, -6.021249,
3, -3.145848, -5.752923,
3, -3.300452, -6.021249
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
-3, -3.609661, -6.557903, 0, -0.5, 0.5, 0.5,
-3, -3.609661, -6.557903, 1, -0.5, 0.5, 0.5,
-3, -3.609661, -6.557903, 1, 1.5, 0.5, 0.5,
-3, -3.609661, -6.557903, 0, 1.5, 0.5, 0.5,
-2, -3.609661, -6.557903, 0, -0.5, 0.5, 0.5,
-2, -3.609661, -6.557903, 1, -0.5, 0.5, 0.5,
-2, -3.609661, -6.557903, 1, 1.5, 0.5, 0.5,
-2, -3.609661, -6.557903, 0, 1.5, 0.5, 0.5,
-1, -3.609661, -6.557903, 0, -0.5, 0.5, 0.5,
-1, -3.609661, -6.557903, 1, -0.5, 0.5, 0.5,
-1, -3.609661, -6.557903, 1, 1.5, 0.5, 0.5,
-1, -3.609661, -6.557903, 0, 1.5, 0.5, 0.5,
0, -3.609661, -6.557903, 0, -0.5, 0.5, 0.5,
0, -3.609661, -6.557903, 1, -0.5, 0.5, 0.5,
0, -3.609661, -6.557903, 1, 1.5, 0.5, 0.5,
0, -3.609661, -6.557903, 0, 1.5, 0.5, 0.5,
1, -3.609661, -6.557903, 0, -0.5, 0.5, 0.5,
1, -3.609661, -6.557903, 1, -0.5, 0.5, 0.5,
1, -3.609661, -6.557903, 1, 1.5, 0.5, 0.5,
1, -3.609661, -6.557903, 0, 1.5, 0.5, 0.5,
2, -3.609661, -6.557903, 0, -0.5, 0.5, 0.5,
2, -3.609661, -6.557903, 1, -0.5, 0.5, 0.5,
2, -3.609661, -6.557903, 1, 1.5, 0.5, 0.5,
2, -3.609661, -6.557903, 0, 1.5, 0.5, 0.5,
3, -3.609661, -6.557903, 0, -0.5, 0.5, 0.5,
3, -3.609661, -6.557903, 1, -0.5, 0.5, 0.5,
3, -3.609661, -6.557903, 1, 1.5, 0.5, 0.5,
3, -3.609661, -6.557903, 0, 1.5, 0.5, 0.5
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
-3.730938, -3, -5.752923,
-3.730938, 2, -5.752923,
-3.730938, -3, -5.752923,
-3.903813, -3, -6.021249,
-3.730938, -2, -5.752923,
-3.903813, -2, -6.021249,
-3.730938, -1, -5.752923,
-3.903813, -1, -6.021249,
-3.730938, 0, -5.752923,
-3.903813, 0, -6.021249,
-3.730938, 1, -5.752923,
-3.903813, 1, -6.021249,
-3.730938, 2, -5.752923,
-3.903813, 2, -6.021249
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
-4.249562, -3, -6.557903, 0, -0.5, 0.5, 0.5,
-4.249562, -3, -6.557903, 1, -0.5, 0.5, 0.5,
-4.249562, -3, -6.557903, 1, 1.5, 0.5, 0.5,
-4.249562, -3, -6.557903, 0, 1.5, 0.5, 0.5,
-4.249562, -2, -6.557903, 0, -0.5, 0.5, 0.5,
-4.249562, -2, -6.557903, 1, -0.5, 0.5, 0.5,
-4.249562, -2, -6.557903, 1, 1.5, 0.5, 0.5,
-4.249562, -2, -6.557903, 0, 1.5, 0.5, 0.5,
-4.249562, -1, -6.557903, 0, -0.5, 0.5, 0.5,
-4.249562, -1, -6.557903, 1, -0.5, 0.5, 0.5,
-4.249562, -1, -6.557903, 1, 1.5, 0.5, 0.5,
-4.249562, -1, -6.557903, 0, 1.5, 0.5, 0.5,
-4.249562, 0, -6.557903, 0, -0.5, 0.5, 0.5,
-4.249562, 0, -6.557903, 1, -0.5, 0.5, 0.5,
-4.249562, 0, -6.557903, 1, 1.5, 0.5, 0.5,
-4.249562, 0, -6.557903, 0, 1.5, 0.5, 0.5,
-4.249562, 1, -6.557903, 0, -0.5, 0.5, 0.5,
-4.249562, 1, -6.557903, 1, -0.5, 0.5, 0.5,
-4.249562, 1, -6.557903, 1, 1.5, 0.5, 0.5,
-4.249562, 1, -6.557903, 0, 1.5, 0.5, 0.5,
-4.249562, 2, -6.557903, 0, -0.5, 0.5, 0.5,
-4.249562, 2, -6.557903, 1, -0.5, 0.5, 0.5,
-4.249562, 2, -6.557903, 1, 1.5, 0.5, 0.5,
-4.249562, 2, -6.557903, 0, 1.5, 0.5, 0.5
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
-3.730938, -3.145848, -4,
-3.730938, -3.145848, 4,
-3.730938, -3.145848, -4,
-3.903813, -3.300452, -4,
-3.730938, -3.145848, -2,
-3.903813, -3.300452, -2,
-3.730938, -3.145848, 0,
-3.903813, -3.300452, 0,
-3.730938, -3.145848, 2,
-3.903813, -3.300452, 2,
-3.730938, -3.145848, 4,
-3.903813, -3.300452, 4
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
-4.249562, -3.609661, -4, 0, -0.5, 0.5, 0.5,
-4.249562, -3.609661, -4, 1, -0.5, 0.5, 0.5,
-4.249562, -3.609661, -4, 1, 1.5, 0.5, 0.5,
-4.249562, -3.609661, -4, 0, 1.5, 0.5, 0.5,
-4.249562, -3.609661, -2, 0, -0.5, 0.5, 0.5,
-4.249562, -3.609661, -2, 1, -0.5, 0.5, 0.5,
-4.249562, -3.609661, -2, 1, 1.5, 0.5, 0.5,
-4.249562, -3.609661, -2, 0, 1.5, 0.5, 0.5,
-4.249562, -3.609661, 0, 0, -0.5, 0.5, 0.5,
-4.249562, -3.609661, 0, 1, -0.5, 0.5, 0.5,
-4.249562, -3.609661, 0, 1, 1.5, 0.5, 0.5,
-4.249562, -3.609661, 0, 0, 1.5, 0.5, 0.5,
-4.249562, -3.609661, 2, 0, -0.5, 0.5, 0.5,
-4.249562, -3.609661, 2, 1, -0.5, 0.5, 0.5,
-4.249562, -3.609661, 2, 1, 1.5, 0.5, 0.5,
-4.249562, -3.609661, 2, 0, 1.5, 0.5, 0.5,
-4.249562, -3.609661, 4, 0, -0.5, 0.5, 0.5,
-4.249562, -3.609661, 4, 1, -0.5, 0.5, 0.5,
-4.249562, -3.609661, 4, 1, 1.5, 0.5, 0.5,
-4.249562, -3.609661, 4, 0, 1.5, 0.5, 0.5
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
-3.730938, -3.145848, -5.752923,
-3.730938, 3.038325, -5.752923,
-3.730938, -3.145848, 4.980147,
-3.730938, 3.038325, 4.980147,
-3.730938, -3.145848, -5.752923,
-3.730938, -3.145848, 4.980147,
-3.730938, 3.038325, -5.752923,
-3.730938, 3.038325, 4.980147,
-3.730938, -3.145848, -5.752923,
3.184048, -3.145848, -5.752923,
-3.730938, -3.145848, 4.980147,
3.184048, -3.145848, 4.980147,
-3.730938, 3.038325, -5.752923,
3.184048, 3.038325, -5.752923,
-3.730938, 3.038325, 4.980147,
3.184048, 3.038325, 4.980147,
3.184048, -3.145848, -5.752923,
3.184048, 3.038325, -5.752923,
3.184048, -3.145848, 4.980147,
3.184048, 3.038325, 4.980147,
3.184048, -3.145848, -5.752923,
3.184048, -3.145848, 4.980147,
3.184048, 3.038325, -5.752923,
3.184048, 3.038325, 4.980147
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
var radius = 7.575373;
var distance = 33.70369;
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
mvMatrix.translate( 0.2734449, 0.0537616, 0.3863876 );
mvMatrix.scale( 1.184477, 1.324452, 0.763122 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.70369);
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
diethyl_ester<-read.table("diethyl_ester.xyz")
```

```
## Error in read.table("diethyl_ester.xyz"): no lines available in input
```

```r
x<-diethyl_ester$V2
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_ester' not found
```

```r
y<-diethyl_ester$V3
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_ester' not found
```

```r
z<-diethyl_ester$V4
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_ester' not found
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
-3.630234, -0.644582, -1.899517, 0, 0, 1, 1, 1,
-2.956032, -0.7084656, -2.039274, 1, 0, 0, 1, 1,
-2.838183, -1.431177, -1.2753, 1, 0, 0, 1, 1,
-2.701631, -0.5689846, -2.418345, 1, 0, 0, 1, 1,
-2.446246, 0.002198235, -2.699046, 1, 0, 0, 1, 1,
-2.305206, 2.74262, 0.2761406, 1, 0, 0, 1, 1,
-2.272081, -1.212074, -1.724355, 0, 0, 0, 1, 1,
-2.228142, -0.1298046, -0.7723139, 0, 0, 0, 1, 1,
-2.225854, -1.149318, -3.374621, 0, 0, 0, 1, 1,
-2.191488, 0.03836127, -1.083405, 0, 0, 0, 1, 1,
-2.17525, -1.409661, -1.299018, 0, 0, 0, 1, 1,
-2.155134, 0.5503336, -1.375765, 0, 0, 0, 1, 1,
-2.154055, 0.4000562, -1.297861, 0, 0, 0, 1, 1,
-2.130005, 0.6002684, -1.937554, 1, 1, 1, 1, 1,
-2.063744, 0.3202867, -1.790841, 1, 1, 1, 1, 1,
-2.044631, 1.563578, -0.8700191, 1, 1, 1, 1, 1,
-2.044047, -0.02203155, -2.943459, 1, 1, 1, 1, 1,
-2.035884, -1.745568, -1.551583, 1, 1, 1, 1, 1,
-2.022596, 1.184404, -1.964015, 1, 1, 1, 1, 1,
-1.99942, -0.2782403, -1.536625, 1, 1, 1, 1, 1,
-1.992272, 1.272958, -2.022911, 1, 1, 1, 1, 1,
-1.990831, -0.3102942, -3.614266, 1, 1, 1, 1, 1,
-1.980403, -0.9443047, -1.808767, 1, 1, 1, 1, 1,
-1.975807, 2.0301, 0.9707187, 1, 1, 1, 1, 1,
-1.975486, 0.04635465, -3.116775, 1, 1, 1, 1, 1,
-1.967062, 0.6438052, -2.884015, 1, 1, 1, 1, 1,
-1.942922, -0.1783498, 1.07491, 1, 1, 1, 1, 1,
-1.939098, -1.306732, -2.291369, 1, 1, 1, 1, 1,
-1.937853, 0.1217431, -0.5946114, 0, 0, 1, 1, 1,
-1.917561, -1.061326, -0.6026388, 1, 0, 0, 1, 1,
-1.904003, -1.84109, -3.346088, 1, 0, 0, 1, 1,
-1.90114, 1.066178, -0.1881973, 1, 0, 0, 1, 1,
-1.893671, -0.1786864, -0.3579777, 1, 0, 0, 1, 1,
-1.893164, -1.305948, -0.2208267, 1, 0, 0, 1, 1,
-1.888455, -0.7097857, -2.516288, 0, 0, 0, 1, 1,
-1.88628, -0.5461308, -2.993753, 0, 0, 0, 1, 1,
-1.878789, -1.508633, -3.492753, 0, 0, 0, 1, 1,
-1.850613, 0.8448824, -0.6517983, 0, 0, 0, 1, 1,
-1.833819, -0.1700221, -0.8194631, 0, 0, 0, 1, 1,
-1.803976, -0.6604314, -3.088113, 0, 0, 0, 1, 1,
-1.799427, 0.2173978, -3.458446, 0, 0, 0, 1, 1,
-1.778756, -1.348099, -2.059532, 1, 1, 1, 1, 1,
-1.725136, -0.3826593, -1.603672, 1, 1, 1, 1, 1,
-1.686632, 0.4872429, -1.766701, 1, 1, 1, 1, 1,
-1.679563, 0.6808584, -1.48226, 1, 1, 1, 1, 1,
-1.666273, -0.738908, -1.662605, 1, 1, 1, 1, 1,
-1.665749, -0.7391568, -2.714713, 1, 1, 1, 1, 1,
-1.642831, 0.2719313, -0.9821386, 1, 1, 1, 1, 1,
-1.641484, 1.134569, 0.1521051, 1, 1, 1, 1, 1,
-1.629014, -0.821454, -0.7711327, 1, 1, 1, 1, 1,
-1.62776, -0.4462442, -2.354634, 1, 1, 1, 1, 1,
-1.619982, 0.3521793, -2.023755, 1, 1, 1, 1, 1,
-1.615526, -0.8886179, -0.6137051, 1, 1, 1, 1, 1,
-1.596899, 0.5715077, -3.130884, 1, 1, 1, 1, 1,
-1.584994, 1.133102, 1.28222, 1, 1, 1, 1, 1,
-1.573879, 0.2594397, -3.529579, 1, 1, 1, 1, 1,
-1.569282, -0.1722861, -1.287477, 0, 0, 1, 1, 1,
-1.559474, 0.6229407, -1.858336, 1, 0, 0, 1, 1,
-1.548242, -0.5354699, -3.325351, 1, 0, 0, 1, 1,
-1.547531, 0.3423479, -0.4672128, 1, 0, 0, 1, 1,
-1.546242, 0.9695738, -1.906153, 1, 0, 0, 1, 1,
-1.546172, -0.576377, -2.144877, 1, 0, 0, 1, 1,
-1.529237, 1.004459, 0.5082635, 0, 0, 0, 1, 1,
-1.525218, 1.329854, -0.6386496, 0, 0, 0, 1, 1,
-1.522693, 0.7935951, -2.059447, 0, 0, 0, 1, 1,
-1.519714, -1.427667, -3.113857, 0, 0, 0, 1, 1,
-1.50199, 0.3668733, -2.696655, 0, 0, 0, 1, 1,
-1.490535, -1.417628, -2.734733, 0, 0, 0, 1, 1,
-1.48133, -0.7008417, -2.026344, 0, 0, 0, 1, 1,
-1.461353, -0.309949, -1.649169, 1, 1, 1, 1, 1,
-1.453223, -0.220227, -2.938092, 1, 1, 1, 1, 1,
-1.438201, -1.182823, -3.761907, 1, 1, 1, 1, 1,
-1.434918, 0.7988859, -1.899273, 1, 1, 1, 1, 1,
-1.432287, -0.951151, -1.641026, 1, 1, 1, 1, 1,
-1.428435, -0.8728697, -0.7268043, 1, 1, 1, 1, 1,
-1.425075, 0.6391026, -0.3630607, 1, 1, 1, 1, 1,
-1.419719, 2.099751, -0.832033, 1, 1, 1, 1, 1,
-1.416797, 0.6457259, -1.805318, 1, 1, 1, 1, 1,
-1.412288, -0.4648427, -1.097266, 1, 1, 1, 1, 1,
-1.4077, -0.5235932, -1.245395, 1, 1, 1, 1, 1,
-1.402087, 1.087222, -0.4962267, 1, 1, 1, 1, 1,
-1.401438, 1.146879, 0.4410377, 1, 1, 1, 1, 1,
-1.388769, 1.276668, 0.4775559, 1, 1, 1, 1, 1,
-1.388718, -0.06120384, -2.379576, 1, 1, 1, 1, 1,
-1.360942, 1.672276, -0.496636, 0, 0, 1, 1, 1,
-1.349959, 0.6658109, -0.8893716, 1, 0, 0, 1, 1,
-1.334383, -2.706516, -3.188212, 1, 0, 0, 1, 1,
-1.329073, -2.729683, -4.109102, 1, 0, 0, 1, 1,
-1.328141, -0.2097644, -0.7251278, 1, 0, 0, 1, 1,
-1.324864, -1.621912, -2.433564, 1, 0, 0, 1, 1,
-1.313492, 1.746355, -1.593592, 0, 0, 0, 1, 1,
-1.310771, -0.9465186, -3.226578, 0, 0, 0, 1, 1,
-1.310488, 0.3357545, -1.740827, 0, 0, 0, 1, 1,
-1.309986, -1.431978, -4.533188, 0, 0, 0, 1, 1,
-1.309302, 0.8111386, -1.036404, 0, 0, 0, 1, 1,
-1.305296, -0.6750994, -2.527441, 0, 0, 0, 1, 1,
-1.294652, -0.1486366, -2.85781, 0, 0, 0, 1, 1,
-1.294129, 0.2215803, -2.908012, 1, 1, 1, 1, 1,
-1.292777, -2.759066, -1.065006, 1, 1, 1, 1, 1,
-1.291161, -0.5134404, -0.4570774, 1, 1, 1, 1, 1,
-1.289173, 0.8910304, -0.9346846, 1, 1, 1, 1, 1,
-1.283849, 1.38029, -1.670556, 1, 1, 1, 1, 1,
-1.271831, 2.696003, -0.6507202, 1, 1, 1, 1, 1,
-1.271286, -0.7154506, -2.370785, 1, 1, 1, 1, 1,
-1.257309, -0.2471966, 1.750746, 1, 1, 1, 1, 1,
-1.249624, -0.06279638, -2.550712, 1, 1, 1, 1, 1,
-1.241585, 0.9832557, -1.676463, 1, 1, 1, 1, 1,
-1.231875, -1.082006, -0.8442736, 1, 1, 1, 1, 1,
-1.23093, 0.1729964, -1.608763, 1, 1, 1, 1, 1,
-1.230768, -0.2359783, -1.932064, 1, 1, 1, 1, 1,
-1.213275, 1.413164, -1.208803, 1, 1, 1, 1, 1,
-1.212661, 0.5173804, -1.491828, 1, 1, 1, 1, 1,
-1.208516, -0.9849842, -2.569222, 0, 0, 1, 1, 1,
-1.207717, -0.2788748, -0.5652657, 1, 0, 0, 1, 1,
-1.206551, -0.349495, -1.563565, 1, 0, 0, 1, 1,
-1.203497, -0.3660932, -0.9516832, 1, 0, 0, 1, 1,
-1.203452, -2.506598, -1.648337, 1, 0, 0, 1, 1,
-1.200346, 0.9567335, -1.63871, 1, 0, 0, 1, 1,
-1.196291, -0.8794606, -2.615736, 0, 0, 0, 1, 1,
-1.1915, -1.529358, -2.914143, 0, 0, 0, 1, 1,
-1.186622, -0.3165273, -0.02026194, 0, 0, 0, 1, 1,
-1.17698, -0.8151022, -2.254734, 0, 0, 0, 1, 1,
-1.15737, 0.2195061, -0.514216, 0, 0, 0, 1, 1,
-1.150138, 1.088916, -1.781633, 0, 0, 0, 1, 1,
-1.14213, -0.1358333, -1.532531, 0, 0, 0, 1, 1,
-1.137681, 0.03492259, -1.016706, 1, 1, 1, 1, 1,
-1.135761, 0.5989978, 0.1634749, 1, 1, 1, 1, 1,
-1.134785, -0.4238166, -0.2049742, 1, 1, 1, 1, 1,
-1.131877, 0.7550188, -1.302812, 1, 1, 1, 1, 1,
-1.131341, -0.2917666, -2.495803, 1, 1, 1, 1, 1,
-1.128174, 0.09604253, -1.979636, 1, 1, 1, 1, 1,
-1.117622, 1.364504, -0.7516147, 1, 1, 1, 1, 1,
-1.114344, -1.106719, -1.005059, 1, 1, 1, 1, 1,
-1.11331, -0.283543, -0.7748958, 1, 1, 1, 1, 1,
-1.111555, -2.244045, -3.266673, 1, 1, 1, 1, 1,
-1.10721, -0.7652249, -4.277207, 1, 1, 1, 1, 1,
-1.094963, -0.1780969, -1.03393, 1, 1, 1, 1, 1,
-1.092328, -0.8817847, -2.054335, 1, 1, 1, 1, 1,
-1.08498, -0.08745292, -1.160378, 1, 1, 1, 1, 1,
-1.082324, -0.1685883, -2.165295, 1, 1, 1, 1, 1,
-1.076404, 1.059757, -1.687301, 0, 0, 1, 1, 1,
-1.072351, 0.118158, -1.600946, 1, 0, 0, 1, 1,
-1.067093, -1.104877, -2.078049, 1, 0, 0, 1, 1,
-1.063845, 0.8525826, -1.261117, 1, 0, 0, 1, 1,
-1.06286, -0.7033678, -3.909167, 1, 0, 0, 1, 1,
-1.059713, -0.820321, -2.164075, 1, 0, 0, 1, 1,
-1.05406, 0.6533067, -0.8468062, 0, 0, 0, 1, 1,
-1.048634, 0.4121368, -1.615733, 0, 0, 0, 1, 1,
-1.040757, -0.9596902, -1.395377, 0, 0, 0, 1, 1,
-1.039706, 0.02875595, -0.3236341, 0, 0, 0, 1, 1,
-1.038159, 0.1313995, -2.378814, 0, 0, 0, 1, 1,
-1.037256, 1.125032, -0.4367214, 0, 0, 0, 1, 1,
-1.025348, -0.2641043, -1.854234, 0, 0, 0, 1, 1,
-1.021798, -0.3078117, -1.940512, 1, 1, 1, 1, 1,
-1.020969, -1.256899, -2.972542, 1, 1, 1, 1, 1,
-1.018244, -0.9988726, -3.332428, 1, 1, 1, 1, 1,
-1.012015, -0.6390963, -1.939199, 1, 1, 1, 1, 1,
-1.011747, -2.837047, -2.53459, 1, 1, 1, 1, 1,
-1.009963, 0.1973377, -2.44743, 1, 1, 1, 1, 1,
-1.00965, -0.4311698, -2.118037, 1, 1, 1, 1, 1,
-1.008233, -0.4766235, -0.226081, 1, 1, 1, 1, 1,
-0.99678, 2.889945, -2.469193, 1, 1, 1, 1, 1,
-0.9922228, -0.6936968, -2.378975, 1, 1, 1, 1, 1,
-0.9890274, 1.840387, -0.8359724, 1, 1, 1, 1, 1,
-0.9873341, -1.156513, -2.215735, 1, 1, 1, 1, 1,
-0.9856754, -0.5158882, -1.22999, 1, 1, 1, 1, 1,
-0.9830475, -0.4764251, -1.0689, 1, 1, 1, 1, 1,
-0.9792724, -0.3677598, -1.667634, 1, 1, 1, 1, 1,
-0.9780133, -0.7237236, -2.265786, 0, 0, 1, 1, 1,
-0.9686067, 2.741988, -1.53187, 1, 0, 0, 1, 1,
-0.967143, 0.7267845, -0.7618251, 1, 0, 0, 1, 1,
-0.967073, 0.5510185, -1.12768, 1, 0, 0, 1, 1,
-0.9643253, 0.3134294, -1.438562, 1, 0, 0, 1, 1,
-0.9528635, -1.813388, -3.574095, 1, 0, 0, 1, 1,
-0.9514768, 1.203845, -0.9730152, 0, 0, 0, 1, 1,
-0.9509559, -0.5609289, -2.224027, 0, 0, 0, 1, 1,
-0.9394287, 1.216587, -0.8451976, 0, 0, 0, 1, 1,
-0.9381524, 0.09415741, -1.363591, 0, 0, 0, 1, 1,
-0.9311963, 0.300353, 1.069045, 0, 0, 0, 1, 1,
-0.9304675, 0.6327301, -0.2269366, 0, 0, 0, 1, 1,
-0.9263183, 0.3426136, 0.1626301, 0, 0, 0, 1, 1,
-0.9239633, 0.559652, 0.01747754, 1, 1, 1, 1, 1,
-0.9232401, -1.159377, -1.747136, 1, 1, 1, 1, 1,
-0.9157276, -1.517353, -2.311415, 1, 1, 1, 1, 1,
-0.9107853, 0.7669133, -0.279712, 1, 1, 1, 1, 1,
-0.9098087, -1.796777, -3.56044, 1, 1, 1, 1, 1,
-0.9069937, 1.327419, 0.3108169, 1, 1, 1, 1, 1,
-0.9034399, 0.734615, -2.493058, 1, 1, 1, 1, 1,
-0.9019527, -0.5171258, -1.782028, 1, 1, 1, 1, 1,
-0.8962178, 0.7184678, -0.644712, 1, 1, 1, 1, 1,
-0.8918183, -0.7556221, -2.849443, 1, 1, 1, 1, 1,
-0.8917647, -0.448193, -2.924918, 1, 1, 1, 1, 1,
-0.8851495, -1.218345, -3.013211, 1, 1, 1, 1, 1,
-0.8848088, 1.511887, -2.259355, 1, 1, 1, 1, 1,
-0.8832747, -0.5219229, -2.282402, 1, 1, 1, 1, 1,
-0.8822616, -1.082888, -3.447904, 1, 1, 1, 1, 1,
-0.8801474, -0.8766436, -2.210785, 0, 0, 1, 1, 1,
-0.8768242, -0.1350321, -0.9677372, 1, 0, 0, 1, 1,
-0.875564, 1.193099, 1.992198, 1, 0, 0, 1, 1,
-0.8682189, -1.043683, -1.827656, 1, 0, 0, 1, 1,
-0.8469992, -0.4936392, -2.471253, 1, 0, 0, 1, 1,
-0.8469241, -0.2161393, -1.21681, 1, 0, 0, 1, 1,
-0.8456723, -1.446398, -5.4969, 0, 0, 0, 1, 1,
-0.8428065, 1.356189, -0.6519166, 0, 0, 0, 1, 1,
-0.8376637, 0.7952939, -2.014156, 0, 0, 0, 1, 1,
-0.8214089, 0.7085923, -1.311382, 0, 0, 0, 1, 1,
-0.8156707, -0.2458932, -3.333445, 0, 0, 0, 1, 1,
-0.8046336, 0.2332079, -1.701764, 0, 0, 0, 1, 1,
-0.8037056, -1.1795, -3.817305, 0, 0, 0, 1, 1,
-0.8022863, -0.008839289, -0.2605285, 1, 1, 1, 1, 1,
-0.7997614, 0.1539033, -0.999698, 1, 1, 1, 1, 1,
-0.7978627, -1.126672, -2.879882, 1, 1, 1, 1, 1,
-0.7942607, -2.023539, -1.921619, 1, 1, 1, 1, 1,
-0.7930639, 0.6314696, -2.04681, 1, 1, 1, 1, 1,
-0.7915599, 0.7016832, 0.7046721, 1, 1, 1, 1, 1,
-0.7870088, 2.050014, -2.239908, 1, 1, 1, 1, 1,
-0.7826228, -0.6482143, -2.886419, 1, 1, 1, 1, 1,
-0.7798584, -0.7956984, -1.740821, 1, 1, 1, 1, 1,
-0.7708406, 0.07536124, -0.8634226, 1, 1, 1, 1, 1,
-0.7682188, -0.6963678, -4.968478, 1, 1, 1, 1, 1,
-0.7626907, 0.9749264, -1.386562, 1, 1, 1, 1, 1,
-0.7625348, -0.5551206, -3.110511, 1, 1, 1, 1, 1,
-0.7608958, -0.200311, -3.074911, 1, 1, 1, 1, 1,
-0.7516724, -1.385686, -3.394633, 1, 1, 1, 1, 1,
-0.7390488, -0.4098396, -1.869142, 0, 0, 1, 1, 1,
-0.7324906, 1.110049, 1.410004, 1, 0, 0, 1, 1,
-0.7308825, -1.061109, -2.228908, 1, 0, 0, 1, 1,
-0.7288894, 0.0201473, -1.364363, 1, 0, 0, 1, 1,
-0.7202134, -0.7059726, -3.117797, 1, 0, 0, 1, 1,
-0.718501, -2.334731, -3.435986, 1, 0, 0, 1, 1,
-0.7155324, 0.2557261, -1.359727, 0, 0, 0, 1, 1,
-0.7154142, -0.7299284, -0.7744139, 0, 0, 0, 1, 1,
-0.7144042, -1.00384, -5.596616, 0, 0, 0, 1, 1,
-0.7122002, -1.065699, -1.56242, 0, 0, 0, 1, 1,
-0.7118729, 1.610744, 0.615005, 0, 0, 0, 1, 1,
-0.7085498, -0.01786475, -1.313903, 0, 0, 0, 1, 1,
-0.7049784, -1.905274, -1.847498, 0, 0, 0, 1, 1,
-0.7048901, 0.8790071, -0.07209422, 1, 1, 1, 1, 1,
-0.7037274, -0.3891698, -1.900944, 1, 1, 1, 1, 1,
-0.7017303, -2.453256, -1.754333, 1, 1, 1, 1, 1,
-0.6961241, -0.9198033, -1.859369, 1, 1, 1, 1, 1,
-0.6926123, 0.2717955, -1.023777, 1, 1, 1, 1, 1,
-0.6909261, -0.1935271, -0.3401305, 1, 1, 1, 1, 1,
-0.6883784, -1.14778, -1.882834, 1, 1, 1, 1, 1,
-0.68617, -1.869535, -3.211819, 1, 1, 1, 1, 1,
-0.6823596, 0.4183215, -2.251334, 1, 1, 1, 1, 1,
-0.6800449, -0.4085259, -0.6355582, 1, 1, 1, 1, 1,
-0.6736281, -0.7704338, -3.46639, 1, 1, 1, 1, 1,
-0.6729356, 0.9995881, 1.219088, 1, 1, 1, 1, 1,
-0.6726452, 0.3240482, 1.07094, 1, 1, 1, 1, 1,
-0.6717834, -0.3013586, -4.471242, 1, 1, 1, 1, 1,
-0.6697213, -1.534446, -3.224049, 1, 1, 1, 1, 1,
-0.6690822, 0.4948528, -0.3813094, 0, 0, 1, 1, 1,
-0.665078, 1.231527, -0.7577778, 1, 0, 0, 1, 1,
-0.6604159, 1.05816, -0.1290736, 1, 0, 0, 1, 1,
-0.659375, 1.121899, -1.92382, 1, 0, 0, 1, 1,
-0.650294, 0.01048585, -1.299025, 1, 0, 0, 1, 1,
-0.647028, -0.5782062, -2.116556, 1, 0, 0, 1, 1,
-0.6428943, -0.1295016, -2.898588, 0, 0, 0, 1, 1,
-0.6405724, -0.3455859, -2.985837, 0, 0, 0, 1, 1,
-0.6405394, -0.4881426, -0.8560469, 0, 0, 0, 1, 1,
-0.6392518, 2.103548, -0.4317792, 0, 0, 0, 1, 1,
-0.6390926, -0.8365773, -2.219936, 0, 0, 0, 1, 1,
-0.6386746, 1.158172, -0.6341503, 0, 0, 0, 1, 1,
-0.6220044, 0.5872554, -2.183495, 0, 0, 0, 1, 1,
-0.6200776, 0.5291656, -0.1751088, 1, 1, 1, 1, 1,
-0.6174208, -0.8796691, -3.524488, 1, 1, 1, 1, 1,
-0.613361, 2.228827, -2.245258, 1, 1, 1, 1, 1,
-0.6110333, 1.02909, 0.1470893, 1, 1, 1, 1, 1,
-0.6109959, -0.1180794, -2.095973, 1, 1, 1, 1, 1,
-0.6096234, 1.194581, -0.1583005, 1, 1, 1, 1, 1,
-0.6090836, 1.110225, -0.03292106, 1, 1, 1, 1, 1,
-0.5960147, -0.7425026, -1.676548, 1, 1, 1, 1, 1,
-0.5855318, -0.3389354, -1.022389, 1, 1, 1, 1, 1,
-0.5847659, 0.5231516, -0.5401677, 1, 1, 1, 1, 1,
-0.5790753, -0.9416668, -2.616493, 1, 1, 1, 1, 1,
-0.5765991, 0.7434126, -1.396123, 1, 1, 1, 1, 1,
-0.5752792, -0.7045244, -2.928988, 1, 1, 1, 1, 1,
-0.5750693, -0.5361032, -2.022498, 1, 1, 1, 1, 1,
-0.5740097, 0.270124, -2.494077, 1, 1, 1, 1, 1,
-0.5727187, -0.4448972, -1.247558, 0, 0, 1, 1, 1,
-0.572332, -1.887335, -3.267363, 1, 0, 0, 1, 1,
-0.5664001, -0.5985579, -1.362099, 1, 0, 0, 1, 1,
-0.566104, 0.8451966, -0.5161737, 1, 0, 0, 1, 1,
-0.5571012, -0.5035587, -2.087839, 1, 0, 0, 1, 1,
-0.5555514, -0.3496782, -1.093728, 1, 0, 0, 1, 1,
-0.5520116, 1.22379, -0.2670026, 0, 0, 0, 1, 1,
-0.542198, -1.502737, -3.305685, 0, 0, 0, 1, 1,
-0.5408801, 1.94958, 1.284409, 0, 0, 0, 1, 1,
-0.5351316, -1.285356, -3.739692, 0, 0, 0, 1, 1,
-0.53315, -0.2580649, -1.716168, 0, 0, 0, 1, 1,
-0.5326548, 0.5120639, -1.230887, 0, 0, 0, 1, 1,
-0.5324922, 1.174416, 0.5803266, 0, 0, 0, 1, 1,
-0.5310106, -0.2830845, -0.3359365, 1, 1, 1, 1, 1,
-0.5300685, -0.3485618, -2.083939, 1, 1, 1, 1, 1,
-0.5265866, -1.021411, -0.8769516, 1, 1, 1, 1, 1,
-0.5208445, 1.171652, -1.144369, 1, 1, 1, 1, 1,
-0.5155722, 0.2863072, -1.073572, 1, 1, 1, 1, 1,
-0.5142549, 1.778757, 1.434692, 1, 1, 1, 1, 1,
-0.5129014, -0.2642214, -3.17946, 1, 1, 1, 1, 1,
-0.5123388, 0.1590064, -0.6864974, 1, 1, 1, 1, 1,
-0.5117304, -0.6381184, -4.426108, 1, 1, 1, 1, 1,
-0.5100171, -0.8808567, -1.92539, 1, 1, 1, 1, 1,
-0.5054737, -1.617654, -2.780056, 1, 1, 1, 1, 1,
-0.5021323, -0.7117794, -3.63235, 1, 1, 1, 1, 1,
-0.5019647, -0.5576637, -0.3935406, 1, 1, 1, 1, 1,
-0.5009801, 0.8984431, -1.144746, 1, 1, 1, 1, 1,
-0.4983023, 0.2871542, -1.678975, 1, 1, 1, 1, 1,
-0.4981981, 2.116911, -0.4936467, 0, 0, 1, 1, 1,
-0.4960932, -1.216581, -2.374106, 1, 0, 0, 1, 1,
-0.4951611, -0.2346345, -1.534216, 1, 0, 0, 1, 1,
-0.494774, 0.6981146, 0.6023898, 1, 0, 0, 1, 1,
-0.4927199, 2.641143, -0.9350578, 1, 0, 0, 1, 1,
-0.4836886, 0.8671643, 0.5666072, 1, 0, 0, 1, 1,
-0.4820963, -1.603625, -2.975182, 0, 0, 0, 1, 1,
-0.4817482, 0.7293131, -0.4003465, 0, 0, 0, 1, 1,
-0.4815566, -1.246557, -2.928762, 0, 0, 0, 1, 1,
-0.4812298, -0.7023175, -4.323809, 0, 0, 0, 1, 1,
-0.4777594, 0.2963673, -2.650204, 0, 0, 0, 1, 1,
-0.4774057, -0.05394223, -1.491712, 0, 0, 0, 1, 1,
-0.4746687, 0.6278793, -0.6894335, 0, 0, 0, 1, 1,
-0.4703977, -0.4713363, -1.598412, 1, 1, 1, 1, 1,
-0.4626288, 1.371886, -0.4403948, 1, 1, 1, 1, 1,
-0.4613228, 0.39494, -0.5144086, 1, 1, 1, 1, 1,
-0.4578962, 1.239524, -2.598474, 1, 1, 1, 1, 1,
-0.4547307, 0.1325837, -2.198608, 1, 1, 1, 1, 1,
-0.4488339, -0.006704545, -1.293466, 1, 1, 1, 1, 1,
-0.4461799, 0.9547977, -1.818926, 1, 1, 1, 1, 1,
-0.4425762, -1.637849, -3.108581, 1, 1, 1, 1, 1,
-0.4363981, 0.02245162, -1.923041, 1, 1, 1, 1, 1,
-0.4351366, 0.6096039, -0.5212361, 1, 1, 1, 1, 1,
-0.4306695, 0.6485842, 0.8486903, 1, 1, 1, 1, 1,
-0.4287058, -0.1542083, -0.1563683, 1, 1, 1, 1, 1,
-0.4256875, 0.9647837, -0.3894839, 1, 1, 1, 1, 1,
-0.421236, 1.695756, -0.6349496, 1, 1, 1, 1, 1,
-0.4154652, -1.537812, -3.299222, 1, 1, 1, 1, 1,
-0.4114954, -0.3329323, -3.515342, 0, 0, 1, 1, 1,
-0.402799, 0.1341564, -0.3190333, 1, 0, 0, 1, 1,
-0.4025941, -0.2423183, -2.678469, 1, 0, 0, 1, 1,
-0.401731, 1.350851, -0.2118349, 1, 0, 0, 1, 1,
-0.4015096, -1.844019, -2.975588, 1, 0, 0, 1, 1,
-0.3993031, 0.2560537, -1.081123, 1, 0, 0, 1, 1,
-0.3988149, 0.474643, -0.6084234, 0, 0, 0, 1, 1,
-0.3954584, -0.1891772, -3.87216, 0, 0, 0, 1, 1,
-0.3944029, 1.279812, -0.4314568, 0, 0, 0, 1, 1,
-0.3942658, -0.7404089, -1.747955, 0, 0, 0, 1, 1,
-0.3872141, 0.506347, -1.381733, 0, 0, 0, 1, 1,
-0.3866471, 0.4342637, -0.8813102, 0, 0, 0, 1, 1,
-0.3793069, -1.756555, -3.349399, 0, 0, 0, 1, 1,
-0.3775259, 1.095276, -0.442028, 1, 1, 1, 1, 1,
-0.3711211, 0.005664061, -0.5468384, 1, 1, 1, 1, 1,
-0.3695062, 1.485397, -0.6756048, 1, 1, 1, 1, 1,
-0.3654457, 0.638629, -1.935847, 1, 1, 1, 1, 1,
-0.3652384, -0.9645441, -1.807605, 1, 1, 1, 1, 1,
-0.3641023, 1.267854, -1.028409, 1, 1, 1, 1, 1,
-0.3626971, 1.485992, -0.5476577, 1, 1, 1, 1, 1,
-0.3613891, 0.6131106, -2.02701, 1, 1, 1, 1, 1,
-0.3605776, 1.078361, 0.3679574, 1, 1, 1, 1, 1,
-0.3562895, -0.1810975, -1.623212, 1, 1, 1, 1, 1,
-0.3555032, 0.1201278, 0.2065389, 1, 1, 1, 1, 1,
-0.3508815, -0.5064593, -1.575215, 1, 1, 1, 1, 1,
-0.3502609, -1.733413, -4.040401, 1, 1, 1, 1, 1,
-0.3494651, 0.3992571, 0.04663847, 1, 1, 1, 1, 1,
-0.3481588, -0.4038242, -1.638439, 1, 1, 1, 1, 1,
-0.3398143, 0.5484288, 0.3878354, 0, 0, 1, 1, 1,
-0.3392012, -2.542013, -2.808457, 1, 0, 0, 1, 1,
-0.3386641, 1.209238, -1.385763, 1, 0, 0, 1, 1,
-0.3358216, 1.244977, 0.4794459, 1, 0, 0, 1, 1,
-0.3344317, 0.0742438, 0.0933267, 1, 0, 0, 1, 1,
-0.3287649, 1.753917, -1.972849, 1, 0, 0, 1, 1,
-0.3284531, -0.4873002, -2.440834, 0, 0, 0, 1, 1,
-0.3263574, 1.287099, -0.302919, 0, 0, 0, 1, 1,
-0.324865, 0.2528216, -0.7070572, 0, 0, 0, 1, 1,
-0.3224207, -1.062038, -1.653985, 0, 0, 0, 1, 1,
-0.3203078, 1.27066, -0.4433063, 0, 0, 0, 1, 1,
-0.3187829, -0.4320111, -1.938048, 0, 0, 0, 1, 1,
-0.3173677, -0.3665084, -2.680247, 0, 0, 0, 1, 1,
-0.3169185, 0.7778719, 0.06247885, 1, 1, 1, 1, 1,
-0.3169025, 0.2581767, -0.8232335, 1, 1, 1, 1, 1,
-0.3108827, -0.6654813, -1.122201, 1, 1, 1, 1, 1,
-0.3102398, -1.196339, -2.748133, 1, 1, 1, 1, 1,
-0.3028051, -0.9317065, -3.173371, 1, 1, 1, 1, 1,
-0.3006716, -0.5733429, -2.704681, 1, 1, 1, 1, 1,
-0.2998175, -1.166127, -4.321092, 1, 1, 1, 1, 1,
-0.2963405, 0.6948236, 0.05596397, 1, 1, 1, 1, 1,
-0.2950224, -0.9242459, -2.054118, 1, 1, 1, 1, 1,
-0.2946312, 0.06326436, -0.8655584, 1, 1, 1, 1, 1,
-0.2940538, -0.8133733, -2.788635, 1, 1, 1, 1, 1,
-0.2921235, -1.414204, -3.005494, 1, 1, 1, 1, 1,
-0.289717, -1.368047, -4.051326, 1, 1, 1, 1, 1,
-0.2889566, -1.106529, -3.54526, 1, 1, 1, 1, 1,
-0.2867969, -0.1635198, -3.283851, 1, 1, 1, 1, 1,
-0.2835295, -0.6870839, -4.817813, 0, 0, 1, 1, 1,
-0.2822343, 0.4355817, 0.01013975, 1, 0, 0, 1, 1,
-0.2786437, 0.02601875, -1.338559, 1, 0, 0, 1, 1,
-0.275344, -0.5931822, -2.562998, 1, 0, 0, 1, 1,
-0.2726927, 0.6969908, 0.3622443, 1, 0, 0, 1, 1,
-0.263262, 1.798709, 0.5711986, 1, 0, 0, 1, 1,
-0.2569229, -0.4419353, -3.800816, 0, 0, 0, 1, 1,
-0.2518957, -0.1496489, -2.02813, 0, 0, 0, 1, 1,
-0.2508435, 1.379168, -0.2177614, 0, 0, 0, 1, 1,
-0.2507152, 0.1032224, -1.230201, 0, 0, 0, 1, 1,
-0.2484508, -0.3462251, -4.134394, 0, 0, 0, 1, 1,
-0.2471706, -0.5576156, -2.882252, 0, 0, 0, 1, 1,
-0.2432805, -1.055224, -4.357528, 0, 0, 0, 1, 1,
-0.2424035, 0.6404696, -1.361779, 1, 1, 1, 1, 1,
-0.2423979, -0.2011808, -2.193087, 1, 1, 1, 1, 1,
-0.239417, 0.9300248, -0.5217062, 1, 1, 1, 1, 1,
-0.2394086, 0.3584791, 0.3741449, 1, 1, 1, 1, 1,
-0.2372053, 0.01951091, 0.9153466, 1, 1, 1, 1, 1,
-0.2368854, -0.4197758, -2.80994, 1, 1, 1, 1, 1,
-0.2358067, 0.01021717, -2.703546, 1, 1, 1, 1, 1,
-0.2351012, -0.6577229, -3.540797, 1, 1, 1, 1, 1,
-0.2341725, 0.2815497, 0.1609693, 1, 1, 1, 1, 1,
-0.23102, 1.054661, -0.878209, 1, 1, 1, 1, 1,
-0.2160248, 0.04456254, -0.4601291, 1, 1, 1, 1, 1,
-0.215486, -0.8294269, -2.16488, 1, 1, 1, 1, 1,
-0.2135233, -1.073658, -4.663692, 1, 1, 1, 1, 1,
-0.2093213, 1.271345, -1.441589, 1, 1, 1, 1, 1,
-0.2080069, 1.229204, -0.8394907, 1, 1, 1, 1, 1,
-0.2075136, 0.1382269, 1.076879, 0, 0, 1, 1, 1,
-0.2069097, -0.5203096, -2.700412, 1, 0, 0, 1, 1,
-0.1995843, 0.5937595, -1.608272, 1, 0, 0, 1, 1,
-0.1971926, 0.1848397, -1.897428, 1, 0, 0, 1, 1,
-0.1922757, -0.2461149, -2.882117, 1, 0, 0, 1, 1,
-0.1919743, 0.8751109, 0.884092, 1, 0, 0, 1, 1,
-0.1906075, -1.065512, -2.347624, 0, 0, 0, 1, 1,
-0.1811442, -0.09399166, -1.538301, 0, 0, 0, 1, 1,
-0.176165, -0.783068, -2.745801, 0, 0, 0, 1, 1,
-0.1750993, -0.8846676, -3.447134, 0, 0, 0, 1, 1,
-0.172881, 0.5653449, 0.8644865, 0, 0, 0, 1, 1,
-0.1713042, -0.7663379, -2.36588, 0, 0, 0, 1, 1,
-0.1637769, 1.182753, -1.648103, 0, 0, 0, 1, 1,
-0.163761, -2.95236, -3.356928, 1, 1, 1, 1, 1,
-0.1637219, 0.05412606, -2.396543, 1, 1, 1, 1, 1,
-0.1624433, -1.255093, -2.655097, 1, 1, 1, 1, 1,
-0.1618619, 1.045098, -0.6468077, 1, 1, 1, 1, 1,
-0.1614821, -1.028503, -4.31969, 1, 1, 1, 1, 1,
-0.1570596, 0.04369174, -1.768304, 1, 1, 1, 1, 1,
-0.1508286, 2.537628, -0.2844981, 1, 1, 1, 1, 1,
-0.1507083, 0.9950261, 0.2980274, 1, 1, 1, 1, 1,
-0.1493499, 0.1419245, -0.862636, 1, 1, 1, 1, 1,
-0.1453815, 0.7843995, 0.797763, 1, 1, 1, 1, 1,
-0.1440884, -1.168249, -2.39609, 1, 1, 1, 1, 1,
-0.141892, -0.9204246, -4.569144, 1, 1, 1, 1, 1,
-0.1401162, 0.506334, 0.4181447, 1, 1, 1, 1, 1,
-0.1400119, -0.7262327, -4.363256, 1, 1, 1, 1, 1,
-0.1245768, -1.373496, -3.626224, 1, 1, 1, 1, 1,
-0.1244693, 0.6491242, 1.283711, 0, 0, 1, 1, 1,
-0.122348, 0.2540788, 0.2151761, 1, 0, 0, 1, 1,
-0.1168726, -0.2392155, -2.654846, 1, 0, 0, 1, 1,
-0.1107526, -0.05364519, -1.659528, 1, 0, 0, 1, 1,
-0.1104351, -0.1629775, -4.109731, 1, 0, 0, 1, 1,
-0.1098106, -0.6876596, -2.655335, 1, 0, 0, 1, 1,
-0.1094347, 2.532784, 0.3472001, 0, 0, 0, 1, 1,
-0.1091219, 0.4940544, -1.344961, 0, 0, 0, 1, 1,
-0.1042479, -0.75826, -3.305429, 0, 0, 0, 1, 1,
-0.1016697, 0.06050862, -0.264201, 0, 0, 0, 1, 1,
-0.0986812, -1.29218, -2.078337, 0, 0, 0, 1, 1,
-0.09596749, -0.1838188, -2.347272, 0, 0, 0, 1, 1,
-0.09423298, 1.072818, 0.7526897, 0, 0, 0, 1, 1,
-0.09305268, 0.0886246, -0.7182429, 1, 1, 1, 1, 1,
-0.09218483, 0.4523464, -0.333577, 1, 1, 1, 1, 1,
-0.0889724, -0.5677689, -4.263037, 1, 1, 1, 1, 1,
-0.08891927, -2.321802, -1.918248, 1, 1, 1, 1, 1,
-0.08686265, -0.6843401, -3.271013, 1, 1, 1, 1, 1,
-0.0859389, -0.2940315, -2.743678, 1, 1, 1, 1, 1,
-0.0857434, -1.0791, -2.088803, 1, 1, 1, 1, 1,
-0.08557589, 0.9540427, 0.4582363, 1, 1, 1, 1, 1,
-0.08303345, -0.394921, -3.282983, 1, 1, 1, 1, 1,
-0.08136746, 0.1035214, 0.07187353, 1, 1, 1, 1, 1,
-0.07874543, -0.4328513, -5.007617, 1, 1, 1, 1, 1,
-0.07625666, -1.413615, -1.805673, 1, 1, 1, 1, 1,
-0.07619368, 0.6382803, -1.200223, 1, 1, 1, 1, 1,
-0.07258195, 0.4487177, 0.4238638, 1, 1, 1, 1, 1,
-0.07069781, -0.3369466, -2.312343, 1, 1, 1, 1, 1,
-0.06758244, 0.8794861, -0.5337886, 0, 0, 1, 1, 1,
-0.06728289, -1.922485, -2.425692, 1, 0, 0, 1, 1,
-0.06521656, 1.852866, -0.3885677, 1, 0, 0, 1, 1,
-0.05965152, 1.706824, -0.294422, 1, 0, 0, 1, 1,
-0.05946587, 0.4520961, 0.3740264, 1, 0, 0, 1, 1,
-0.05754867, 0.1475047, 0.01401674, 1, 0, 0, 1, 1,
-0.05721267, 0.5122651, -1.005929, 0, 0, 0, 1, 1,
-0.04736365, -1.783581, -3.294571, 0, 0, 0, 1, 1,
-0.04602129, -0.8824704, -1.72662, 0, 0, 0, 1, 1,
-0.04426592, 0.4989744, -0.2657702, 0, 0, 0, 1, 1,
-0.03877436, 0.5617158, 0.2149714, 0, 0, 0, 1, 1,
-0.03739051, -1.12325, -2.471184, 0, 0, 0, 1, 1,
-0.03636292, 1.123319, -0.4735165, 0, 0, 0, 1, 1,
-0.03551752, 0.8483394, 0.3610341, 1, 1, 1, 1, 1,
-0.03463595, 1.073354, -2.508723, 1, 1, 1, 1, 1,
-0.02604868, -2.448274, -3.640657, 1, 1, 1, 1, 1,
-0.02247989, 0.6464721, 0.4675917, 1, 1, 1, 1, 1,
-0.02226508, -0.7430874, -5.04575, 1, 1, 1, 1, 1,
-0.02170357, -0.8329951, -4.342309, 1, 1, 1, 1, 1,
-0.0214913, 0.7777263, 0.5293673, 1, 1, 1, 1, 1,
-0.0205862, -0.09084604, -3.591042, 1, 1, 1, 1, 1,
-0.01967281, -0.4382036, -3.420229, 1, 1, 1, 1, 1,
-0.01657939, -1.512084, -3.876592, 1, 1, 1, 1, 1,
-0.01503467, -1.859921, -1.79733, 1, 1, 1, 1, 1,
-0.01473305, -1.019906, -5.444102, 1, 1, 1, 1, 1,
-0.01251872, 0.2856635, -0.139348, 1, 1, 1, 1, 1,
-0.01235467, -1.41754, -1.861931, 1, 1, 1, 1, 1,
-0.01098193, -0.4460937, -2.258802, 1, 1, 1, 1, 1,
-0.008813455, -0.905162, -2.271961, 0, 0, 1, 1, 1,
-0.004953092, -2.504035, -3.180545, 1, 0, 0, 1, 1,
-0.0008787255, -0.5620652, -2.265732, 1, 0, 0, 1, 1,
0.001261938, 1.715833, 1.31478, 1, 0, 0, 1, 1,
0.00143562, 1.009102, 0.009559986, 1, 0, 0, 1, 1,
0.001945561, -0.7236209, 2.357614, 1, 0, 0, 1, 1,
0.003911805, 0.4284855, 1.518686, 0, 0, 0, 1, 1,
0.004653745, 0.6703402, 0.5467599, 0, 0, 0, 1, 1,
0.01004633, 0.5707919, -0.8246981, 0, 0, 0, 1, 1,
0.01369185, -0.24698, 3.002661, 0, 0, 0, 1, 1,
0.01450095, -0.3935251, 3.35402, 0, 0, 0, 1, 1,
0.01544048, 0.1166063, -0.1690521, 0, 0, 0, 1, 1,
0.01584653, -0.5270693, 3.716101, 0, 0, 0, 1, 1,
0.01599241, 0.5363393, 1.647102, 1, 1, 1, 1, 1,
0.01689793, 1.159312, 1.002525, 1, 1, 1, 1, 1,
0.01921766, -1.507284, 2.732626, 1, 1, 1, 1, 1,
0.02398303, 0.5907844, 0.3168512, 1, 1, 1, 1, 1,
0.02430329, -0.05882601, 3.695561, 1, 1, 1, 1, 1,
0.03475504, 0.4320261, 0.6709476, 1, 1, 1, 1, 1,
0.03798549, -0.7088504, 2.366506, 1, 1, 1, 1, 1,
0.04273666, 1.618412, -0.3554053, 1, 1, 1, 1, 1,
0.04454226, 2.097537, -1.554137, 1, 1, 1, 1, 1,
0.04553528, 0.7718488, 1.58963, 1, 1, 1, 1, 1,
0.0501259, 1.517206, 0.2432064, 1, 1, 1, 1, 1,
0.05585702, 0.8530508, 0.13865, 1, 1, 1, 1, 1,
0.05630902, 0.5090193, -0.8106488, 1, 1, 1, 1, 1,
0.05960794, -1.503038, 3.391499, 1, 1, 1, 1, 1,
0.06138714, -1.187269, 2.549834, 1, 1, 1, 1, 1,
0.07050771, 0.7374113, 1.502233, 0, 0, 1, 1, 1,
0.07468873, -1.851414, 1.7916, 1, 0, 0, 1, 1,
0.07631832, 0.02691527, 0.865535, 1, 0, 0, 1, 1,
0.08651894, -1.128493, 3.982428, 1, 0, 0, 1, 1,
0.09007606, 0.2701596, 1.716468, 1, 0, 0, 1, 1,
0.09154763, -0.6295415, 3.117825, 1, 0, 0, 1, 1,
0.09167755, 0.01940521, 1.349002, 0, 0, 0, 1, 1,
0.09355908, 0.8319392, 0.08530212, 0, 0, 0, 1, 1,
0.0978863, -1.521136, 2.839827, 0, 0, 0, 1, 1,
0.1037659, 0.8923291, -0.8830662, 0, 0, 0, 1, 1,
0.108465, -0.6523695, 2.912189, 0, 0, 0, 1, 1,
0.1114183, 0.1354095, -0.31727, 0, 0, 0, 1, 1,
0.115678, -0.1593324, 2.395906, 0, 0, 0, 1, 1,
0.1161848, -0.5574104, 3.444514, 1, 1, 1, 1, 1,
0.1185304, 1.301872, 1.485798, 1, 1, 1, 1, 1,
0.1197674, -0.2525355, 2.562058, 1, 1, 1, 1, 1,
0.1198998, 1.310522, -0.654976, 1, 1, 1, 1, 1,
0.1239871, -0.3709831, 3.035726, 1, 1, 1, 1, 1,
0.1248308, -0.1657452, 4.092748, 1, 1, 1, 1, 1,
0.1283908, 0.2396175, 1.857654, 1, 1, 1, 1, 1,
0.1294414, -0.6118387, 1.455455, 1, 1, 1, 1, 1,
0.1302908, -0.1810991, 3.210577, 1, 1, 1, 1, 1,
0.1343286, 1.020095, -0.2290107, 1, 1, 1, 1, 1,
0.1359561, -1.018375, 2.841697, 1, 1, 1, 1, 1,
0.1398932, 0.5379961, 0.1825718, 1, 1, 1, 1, 1,
0.1415899, 0.2430439, 0.1537883, 1, 1, 1, 1, 1,
0.1440022, 1.640494, 2.146055, 1, 1, 1, 1, 1,
0.1532007, -0.009367014, 1.471922, 1, 1, 1, 1, 1,
0.1532495, 0.4721157, 0.4262018, 0, 0, 1, 1, 1,
0.1596076, -0.121891, 2.367881, 1, 0, 0, 1, 1,
0.1623748, 0.6385658, -0.5235753, 1, 0, 0, 1, 1,
0.1641916, 0.3671317, -0.6250423, 1, 0, 0, 1, 1,
0.1658989, -0.5262468, 2.881525, 1, 0, 0, 1, 1,
0.1737971, -0.2703235, 2.29542, 1, 0, 0, 1, 1,
0.174457, 0.9115165, 0.9318218, 0, 0, 0, 1, 1,
0.1757528, 0.960036, 0.4768992, 0, 0, 0, 1, 1,
0.1816331, -0.07522158, 2.382532, 0, 0, 0, 1, 1,
0.1872147, 0.09008362, 2.877159, 0, 0, 0, 1, 1,
0.1889198, -0.9304016, 1.814567, 0, 0, 0, 1, 1,
0.1926841, -0.530779, 3.193475, 0, 0, 0, 1, 1,
0.1973167, -1.170995, 4.492339, 0, 0, 0, 1, 1,
0.1980212, -1.737552, 3.403922, 1, 1, 1, 1, 1,
0.2022017, -0.644383, 1.975946, 1, 1, 1, 1, 1,
0.2068524, 0.7082875, -0.3107768, 1, 1, 1, 1, 1,
0.20809, 0.5644375, -0.5061001, 1, 1, 1, 1, 1,
0.2102634, -2.11927, 2.28265, 1, 1, 1, 1, 1,
0.2131263, 1.390406, -0.03631229, 1, 1, 1, 1, 1,
0.2134538, -0.1692743, 3.752543, 1, 1, 1, 1, 1,
0.2152824, 0.01105952, 2.635696, 1, 1, 1, 1, 1,
0.2174492, 1.694585, 2.238044, 1, 1, 1, 1, 1,
0.2217946, -0.7198639, 1.81022, 1, 1, 1, 1, 1,
0.2225498, -0.1076095, 2.16156, 1, 1, 1, 1, 1,
0.2234716, 0.6008881, 1.000731, 1, 1, 1, 1, 1,
0.2300536, -3.055787, 3.996012, 1, 1, 1, 1, 1,
0.2379463, -0.4534479, 2.139027, 1, 1, 1, 1, 1,
0.2417745, -0.7870429, 3.898374, 1, 1, 1, 1, 1,
0.2440161, 0.4115006, 1.36052, 0, 0, 1, 1, 1,
0.2496594, -1.319035, 3.118149, 1, 0, 0, 1, 1,
0.255027, -1.633483, 3.041404, 1, 0, 0, 1, 1,
0.2571438, 0.454516, -0.4758397, 1, 0, 0, 1, 1,
0.2574427, 0.8107526, 1.371791, 1, 0, 0, 1, 1,
0.2578618, -1.887653, 4.742288, 1, 0, 0, 1, 1,
0.2588608, 0.2827439, 1.079662, 0, 0, 0, 1, 1,
0.2672977, -2.016382, 2.252129, 0, 0, 0, 1, 1,
0.270818, -2.012414, 2.842866, 0, 0, 0, 1, 1,
0.275924, 1.886318, 0.5407178, 0, 0, 0, 1, 1,
0.2768967, -0.2559755, 2.519621, 0, 0, 0, 1, 1,
0.2777097, -0.4889732, 2.910259, 0, 0, 0, 1, 1,
0.2832963, -0.4076931, 2.462208, 0, 0, 0, 1, 1,
0.2847674, -1.498068, 4.823841, 1, 1, 1, 1, 1,
0.2902887, -1.735009, 4.402637, 1, 1, 1, 1, 1,
0.290826, 0.523314, 0.8602516, 1, 1, 1, 1, 1,
0.2909202, -1.699059, 2.580619, 1, 1, 1, 1, 1,
0.2930217, -0.9642362, 1.47996, 1, 1, 1, 1, 1,
0.2943266, -0.7588781, 1.940258, 1, 1, 1, 1, 1,
0.2974978, -0.05261378, 0.8513512, 1, 1, 1, 1, 1,
0.3096586, 0.4401979, 1.352013, 1, 1, 1, 1, 1,
0.311079, 1.489507, -0.5121741, 1, 1, 1, 1, 1,
0.3153533, 0.5035624, -0.1493318, 1, 1, 1, 1, 1,
0.3200045, 1.346406, -0.682658, 1, 1, 1, 1, 1,
0.3231228, 0.7569516, -1.480098, 1, 1, 1, 1, 1,
0.3255691, -0.1255475, 2.134913, 1, 1, 1, 1, 1,
0.3286372, 1.840525, 0.2336655, 1, 1, 1, 1, 1,
0.3316087, 2.525278, 1.136943, 1, 1, 1, 1, 1,
0.3358391, -0.6786152, 2.948, 0, 0, 1, 1, 1,
0.3385087, -0.1467366, 2.024402, 1, 0, 0, 1, 1,
0.3407181, 0.203709, 1.736344, 1, 0, 0, 1, 1,
0.3449503, -0.9845742, 2.166202, 1, 0, 0, 1, 1,
0.358521, -0.3866729, 3.731741, 1, 0, 0, 1, 1,
0.3596403, 0.2079177, 0.4315924, 1, 0, 0, 1, 1,
0.3601702, 0.1094759, 2.500482, 0, 0, 0, 1, 1,
0.3605819, -1.531595, 2.462586, 0, 0, 0, 1, 1,
0.3611364, -2.283642, 2.376809, 0, 0, 0, 1, 1,
0.3640108, 1.066295, 0.8646392, 0, 0, 0, 1, 1,
0.3651831, -0.1750633, 3.083096, 0, 0, 0, 1, 1,
0.3661909, 1.111198, 2.360706, 0, 0, 0, 1, 1,
0.3677397, -1.57708, 3.04691, 0, 0, 0, 1, 1,
0.3696645, 1.707385, 0.1826157, 1, 1, 1, 1, 1,
0.3699412, -0.7399657, 4.701153, 1, 1, 1, 1, 1,
0.3724976, -1.632416, 2.144299, 1, 1, 1, 1, 1,
0.3801448, -1.019914, 2.432557, 1, 1, 1, 1, 1,
0.3830804, 1.167362, -0.6156774, 1, 1, 1, 1, 1,
0.384444, 0.7065394, 0.9963837, 1, 1, 1, 1, 1,
0.3846369, -0.0004812967, 0.9370775, 1, 1, 1, 1, 1,
0.3913307, 0.02853847, 1.452874, 1, 1, 1, 1, 1,
0.3925203, 2.610416, 2.710102, 1, 1, 1, 1, 1,
0.3933384, -0.9269748, 1.770275, 1, 1, 1, 1, 1,
0.3936043, 0.1036575, 0.6771358, 1, 1, 1, 1, 1,
0.3968916, 0.791483, -0.02358966, 1, 1, 1, 1, 1,
0.3971919, -0.9740907, 2.211927, 1, 1, 1, 1, 1,
0.3978189, -1.133955, 2.833072, 1, 1, 1, 1, 1,
0.398701, -0.4326157, 1.582294, 1, 1, 1, 1, 1,
0.3992676, 1.506083, 1.185324, 0, 0, 1, 1, 1,
0.4006433, 0.7889289, -0.8929232, 1, 0, 0, 1, 1,
0.4057716, -0.125967, 0.7790744, 1, 0, 0, 1, 1,
0.4112328, 1.362691, -1.922346, 1, 0, 0, 1, 1,
0.4116174, -1.063722, 4.026981, 1, 0, 0, 1, 1,
0.412847, -0.04214773, 1.321556, 1, 0, 0, 1, 1,
0.4137796, -0.6493555, 4.256507, 0, 0, 0, 1, 1,
0.4150814, -0.182069, 1.123149, 0, 0, 0, 1, 1,
0.4182405, -0.02628594, 0.9987627, 0, 0, 0, 1, 1,
0.4206702, 1.603702, 0.3029158, 0, 0, 0, 1, 1,
0.4210543, 0.5992209, 2.960015, 0, 0, 0, 1, 1,
0.4219417, -1.993341, 2.56843, 0, 0, 0, 1, 1,
0.4329909, 0.848998, 0.1684193, 0, 0, 0, 1, 1,
0.434148, -0.9345056, 1.858129, 1, 1, 1, 1, 1,
0.4341587, -0.05607749, 1.619939, 1, 1, 1, 1, 1,
0.4344289, 1.23633, -0.4499499, 1, 1, 1, 1, 1,
0.4375347, -0.7165939, 2.761749, 1, 1, 1, 1, 1,
0.4393552, 0.2757224, 0.8416276, 1, 1, 1, 1, 1,
0.4408217, 0.348227, -0.8851286, 1, 1, 1, 1, 1,
0.4444154, 0.5111501, 2.340087, 1, 1, 1, 1, 1,
0.4455191, -0.6197464, 2.492862, 1, 1, 1, 1, 1,
0.4462603, 0.06952199, 1.846831, 1, 1, 1, 1, 1,
0.4501431, -0.524309, 3.347147, 1, 1, 1, 1, 1,
0.4507035, 1.071135, -0.6784668, 1, 1, 1, 1, 1,
0.4532241, -0.1630923, 3.611582, 1, 1, 1, 1, 1,
0.4537553, -0.0325592, 0.9194381, 1, 1, 1, 1, 1,
0.4558752, 1.135123, 0.8729143, 1, 1, 1, 1, 1,
0.4565775, -0.4262037, 1.453522, 1, 1, 1, 1, 1,
0.4566322, 0.3918262, -0.1497433, 0, 0, 1, 1, 1,
0.4571498, 0.117603, 3.158464, 1, 0, 0, 1, 1,
0.4574781, -1.315635, 1.776793, 1, 0, 0, 1, 1,
0.4628445, 0.5255715, 0.1398608, 1, 0, 0, 1, 1,
0.4629555, 1.249051, 0.402676, 1, 0, 0, 1, 1,
0.469252, 1.597806, -0.8443671, 1, 0, 0, 1, 1,
0.4724272, 0.4534043, 1.595846, 0, 0, 0, 1, 1,
0.4731189, 1.779396, 0.1457694, 0, 0, 0, 1, 1,
0.4770941, -0.4763392, 2.659597, 0, 0, 0, 1, 1,
0.4773131, 1.965632, -1.271362, 0, 0, 0, 1, 1,
0.4817372, 0.2458445, 1.056487, 0, 0, 0, 1, 1,
0.4821299, -0.04606317, 1.915191, 0, 0, 0, 1, 1,
0.4827177, 0.5863709, 2.197667, 0, 0, 0, 1, 1,
0.4834247, 1.701035, -0.1380085, 1, 1, 1, 1, 1,
0.4840688, 0.8767438, -0.1955461, 1, 1, 1, 1, 1,
0.4850983, -0.6822962, 2.181739, 1, 1, 1, 1, 1,
0.4951227, 0.5047467, 0.6936247, 1, 1, 1, 1, 1,
0.495347, 1.59261, 1.214704, 1, 1, 1, 1, 1,
0.5037758, 0.5635077, 0.7598661, 1, 1, 1, 1, 1,
0.5097797, 0.673803, 1.170741, 1, 1, 1, 1, 1,
0.5103695, -1.980307, 2.670727, 1, 1, 1, 1, 1,
0.5121914, -0.8679333, 2.189024, 1, 1, 1, 1, 1,
0.5142231, 1.187567, 0.4118779, 1, 1, 1, 1, 1,
0.51547, -1.608246, 1.040234, 1, 1, 1, 1, 1,
0.5161873, 1.777658, -0.3827029, 1, 1, 1, 1, 1,
0.5170426, -0.0283992, 2.442463, 1, 1, 1, 1, 1,
0.5171152, 2.377971, 1.261553, 1, 1, 1, 1, 1,
0.51757, -0.8787697, 1.880298, 1, 1, 1, 1, 1,
0.5233571, -0.3170429, 2.752959, 0, 0, 1, 1, 1,
0.5235912, -1.244063, 2.209738, 1, 0, 0, 1, 1,
0.5330836, -1.580611, 2.380688, 1, 0, 0, 1, 1,
0.5331846, 0.2518414, 0.3777306, 1, 0, 0, 1, 1,
0.5355116, 1.333663, -0.2325325, 1, 0, 0, 1, 1,
0.5418129, -1.79952, 2.449027, 1, 0, 0, 1, 1,
0.5438621, 2.635579, -0.09993692, 0, 0, 0, 1, 1,
0.547293, -1.364909, 3.409302, 0, 0, 0, 1, 1,
0.548903, -0.2583115, 2.133857, 0, 0, 0, 1, 1,
0.5510373, 0.4701527, 1.091843, 0, 0, 0, 1, 1,
0.5516805, -0.3860941, 1.20951, 0, 0, 0, 1, 1,
0.5522307, 0.3516116, 1.616097, 0, 0, 0, 1, 1,
0.5646014, -1.118997, 1.31493, 0, 0, 0, 1, 1,
0.5675176, -0.404586, 2.067366, 1, 1, 1, 1, 1,
0.5697672, -0.8061005, 3.568415, 1, 1, 1, 1, 1,
0.5716509, -0.06652988, 3.296336, 1, 1, 1, 1, 1,
0.5748343, -0.5837639, 1.427407, 1, 1, 1, 1, 1,
0.5760123, 0.0560872, 0.7298161, 1, 1, 1, 1, 1,
0.5778723, 0.4463742, 0.6701282, 1, 1, 1, 1, 1,
0.5779433, 1.471072, 0.9444324, 1, 1, 1, 1, 1,
0.5800101, 0.7479818, 1.220164, 1, 1, 1, 1, 1,
0.5837332, -1.382108, 2.468504, 1, 1, 1, 1, 1,
0.5848424, 0.957081, 0.04674302, 1, 1, 1, 1, 1,
0.5870503, 0.9523289, 1.599301, 1, 1, 1, 1, 1,
0.5921285, -0.7432318, 2.516632, 1, 1, 1, 1, 1,
0.5929895, -1.059478, 0.9656724, 1, 1, 1, 1, 1,
0.5962436, -1.79259, 2.699416, 1, 1, 1, 1, 1,
0.5963216, -1.536916, 4.469902, 1, 1, 1, 1, 1,
0.5972373, -0.3317585, 1.318415, 0, 0, 1, 1, 1,
0.6032087, 0.1493955, 1.182752, 1, 0, 0, 1, 1,
0.6098109, 0.2319449, 2.957271, 1, 0, 0, 1, 1,
0.6114372, 0.9520243, 1.421165, 1, 0, 0, 1, 1,
0.6118554, 0.1042119, 1.380232, 1, 0, 0, 1, 1,
0.6128292, 0.8658572, 1.742399, 1, 0, 0, 1, 1,
0.6136385, -1.083747, 2.404405, 0, 0, 0, 1, 1,
0.6152336, -0.4625532, 1.561541, 0, 0, 0, 1, 1,
0.617079, 0.1241669, 1.203038, 0, 0, 0, 1, 1,
0.6177379, -0.9455842, 1.36586, 0, 0, 0, 1, 1,
0.6189519, 1.10045, 0.3681056, 0, 0, 0, 1, 1,
0.6225418, -0.3591973, 1.612569, 0, 0, 0, 1, 1,
0.6235688, 0.5026826, 0.8820859, 0, 0, 0, 1, 1,
0.6257356, 1.068871, 0.9619448, 1, 1, 1, 1, 1,
0.6263366, 0.9730167, 0.7672742, 1, 1, 1, 1, 1,
0.633353, -0.7784582, 1.481816, 1, 1, 1, 1, 1,
0.6336212, 1.569524, 1.422532, 1, 1, 1, 1, 1,
0.6445644, -0.07835519, 0.7170208, 1, 1, 1, 1, 1,
0.6558375, -1.348313, 2.777643, 1, 1, 1, 1, 1,
0.6575518, 0.976495, 0.3980103, 1, 1, 1, 1, 1,
0.6586961, -1.440755, 1.705185, 1, 1, 1, 1, 1,
0.6642844, 1.070818, 1.635496, 1, 1, 1, 1, 1,
0.6778186, -0.8285406, 4.638975, 1, 1, 1, 1, 1,
0.6842346, -0.5132864, 0.4185686, 1, 1, 1, 1, 1,
0.6870666, 0.07732702, 0.51718, 1, 1, 1, 1, 1,
0.6871057, -0.4202488, -0.03725214, 1, 1, 1, 1, 1,
0.6882011, 1.554129, 0.4751573, 1, 1, 1, 1, 1,
0.6906138, -1.565901, 4.064711, 1, 1, 1, 1, 1,
0.6980612, 1.086025, 1.985258, 0, 0, 1, 1, 1,
0.7091396, 2.259566, 0.09709826, 1, 0, 0, 1, 1,
0.7108119, 1.422189, 0.8166314, 1, 0, 0, 1, 1,
0.7126273, -0.09592614, 0.6253554, 1, 0, 0, 1, 1,
0.7145566, -1.157274, 1.53347, 1, 0, 0, 1, 1,
0.7163895, -0.1787635, 0.2263241, 1, 0, 0, 1, 1,
0.7264308, 0.2627428, 3.047526, 0, 0, 0, 1, 1,
0.7273071, -0.7149125, 3.254591, 0, 0, 0, 1, 1,
0.7276823, -0.675625, 2.476343, 0, 0, 0, 1, 1,
0.728395, 1.070087, -0.1087762, 0, 0, 0, 1, 1,
0.7295056, -2.050609, 2.022558, 0, 0, 0, 1, 1,
0.7367781, 1.263732, 2.115582, 0, 0, 0, 1, 1,
0.7395027, 1.2202, 0.7662751, 0, 0, 0, 1, 1,
0.745641, -0.1998053, 1.248855, 1, 1, 1, 1, 1,
0.7537454, 0.6319354, -0.7915758, 1, 1, 1, 1, 1,
0.7568628, -0.2446958, 1.887185, 1, 1, 1, 1, 1,
0.7582878, -0.7627539, 2.889444, 1, 1, 1, 1, 1,
0.7593989, -0.6906758, 1.199007, 1, 1, 1, 1, 1,
0.7625058, 0.1579444, 1.985716, 1, 1, 1, 1, 1,
0.7642562, -0.8857011, 1.988683, 1, 1, 1, 1, 1,
0.7690954, 0.1153581, 1.645423, 1, 1, 1, 1, 1,
0.7693498, 1.031457, 0.9055843, 1, 1, 1, 1, 1,
0.7738968, -0.01800694, 2.887758, 1, 1, 1, 1, 1,
0.7756802, -0.2612339, 1.815402, 1, 1, 1, 1, 1,
0.7786576, 0.7732896, 0.1668734, 1, 1, 1, 1, 1,
0.7801651, 0.002766875, 0.9506096, 1, 1, 1, 1, 1,
0.7807204, -1.271339, 3.267443, 1, 1, 1, 1, 1,
0.7817525, -1.584637, 1.902649, 1, 1, 1, 1, 1,
0.7847207, -1.091221, 1.710346, 0, 0, 1, 1, 1,
0.7866185, -1.149424, 1.856683, 1, 0, 0, 1, 1,
0.7906979, -0.1471479, 2.95694, 1, 0, 0, 1, 1,
0.790875, 0.2073169, 2.437971, 1, 0, 0, 1, 1,
0.793604, -0.608836, 2.076688, 1, 0, 0, 1, 1,
0.7985937, -0.6193275, 1.938647, 1, 0, 0, 1, 1,
0.7987615, -0.7328234, 2.482715, 0, 0, 0, 1, 1,
0.7990757, -0.3988954, 2.242784, 0, 0, 0, 1, 1,
0.8016152, -0.7859989, 3.011542, 0, 0, 0, 1, 1,
0.8028603, 1.00475, -0.1509419, 0, 0, 0, 1, 1,
0.8081487, 0.6512567, -1.855772, 0, 0, 0, 1, 1,
0.8153901, 1.629387, 1.622843, 0, 0, 0, 1, 1,
0.816511, -0.1811462, 2.202697, 0, 0, 0, 1, 1,
0.8182896, 0.7815474, 0.4129908, 1, 1, 1, 1, 1,
0.8200288, -0.07158484, 1.889415, 1, 1, 1, 1, 1,
0.8402824, 0.187401, 1.224929, 1, 1, 1, 1, 1,
0.8420035, -0.7981987, 1.233198, 1, 1, 1, 1, 1,
0.8430052, -0.06557243, 1.454374, 1, 1, 1, 1, 1,
0.849261, -1.220447, 3.387733, 1, 1, 1, 1, 1,
0.8512768, -0.537957, 2.349323, 1, 1, 1, 1, 1,
0.8594581, 1.209741, 0.2989045, 1, 1, 1, 1, 1,
0.8599058, -0.9670764, 2.409616, 1, 1, 1, 1, 1,
0.8599815, -0.8139716, 3.600893, 1, 1, 1, 1, 1,
0.8621169, 0.6947789, 3.496665, 1, 1, 1, 1, 1,
0.8677677, -0.717845, 0.5259169, 1, 1, 1, 1, 1,
0.8722866, -0.6972164, 2.900955, 1, 1, 1, 1, 1,
0.8728458, -0.4405339, 2.146568, 1, 1, 1, 1, 1,
0.8770229, 0.4845999, 1.232938, 1, 1, 1, 1, 1,
0.885666, -1.567109, 0.5194764, 0, 0, 1, 1, 1,
0.8920546, -0.709348, 1.172775, 1, 0, 0, 1, 1,
0.9006577, -0.6628667, 1.781801, 1, 0, 0, 1, 1,
0.9019105, -0.3476886, 3.827613, 1, 0, 0, 1, 1,
0.9116056, 0.9315692, 0.1753092, 1, 0, 0, 1, 1,
0.9130069, -1.904144, 1.958341, 1, 0, 0, 1, 1,
0.9138944, -0.220738, 1.884561, 0, 0, 0, 1, 1,
0.9147684, 2.639667, 0.1434815, 0, 0, 0, 1, 1,
0.9156981, 0.2436327, 1.037887, 0, 0, 0, 1, 1,
0.9236733, -1.166151, 2.386794, 0, 0, 0, 1, 1,
0.9337465, -0.5449142, 3.038409, 0, 0, 0, 1, 1,
0.9352821, -0.5965872, 1.118849, 0, 0, 0, 1, 1,
0.9361484, -0.253414, 2.281327, 0, 0, 0, 1, 1,
0.9391074, 2.326594, -1.535897, 1, 1, 1, 1, 1,
0.9426115, 0.406374, 0.4398745, 1, 1, 1, 1, 1,
0.9449857, 0.6238459, 0.1971623, 1, 1, 1, 1, 1,
0.9461264, -2.413583, 2.353221, 1, 1, 1, 1, 1,
0.9461606, 0.1292195, 2.881909, 1, 1, 1, 1, 1,
0.9468257, 0.07852435, 0.2920327, 1, 1, 1, 1, 1,
0.9517943, 0.6969708, -0.9240544, 1, 1, 1, 1, 1,
0.9543412, 0.3350391, 0.1000258, 1, 1, 1, 1, 1,
0.963176, -1.498596, 3.964474, 1, 1, 1, 1, 1,
0.9632348, 0.6557863, 0.4972634, 1, 1, 1, 1, 1,
0.9641621, 0.2933321, 1.28942, 1, 1, 1, 1, 1,
0.9668, 0.2620007, 1.832941, 1, 1, 1, 1, 1,
0.9721096, 0.1733929, -0.1057808, 1, 1, 1, 1, 1,
0.974734, 1.308716, -1.891426, 1, 1, 1, 1, 1,
0.9765875, -0.9764828, 2.363972, 1, 1, 1, 1, 1,
0.9864907, 0.3828933, 0.9541962, 0, 0, 1, 1, 1,
0.9866449, -2.358152, 2.779682, 1, 0, 0, 1, 1,
0.986762, -1.838116, 4.406507, 1, 0, 0, 1, 1,
0.9881253, -0.8854312, 2.638848, 1, 0, 0, 1, 1,
1.000679, 0.3495428, -0.6873581, 1, 0, 0, 1, 1,
1.002513, 0.3995874, 0.2706543, 1, 0, 0, 1, 1,
1.00475, 0.5650895, 0.6496301, 0, 0, 0, 1, 1,
1.011941, -1.89725, 1.977636, 0, 0, 0, 1, 1,
1.018917, 2.629657, -1.252861, 0, 0, 0, 1, 1,
1.027802, 0.8247609, -0.6808771, 0, 0, 0, 1, 1,
1.029944, -1.40816, 3.638937, 0, 0, 0, 1, 1,
1.040395, -0.2444827, 1.281383, 0, 0, 0, 1, 1,
1.048739, -1.498753, 3.488922, 0, 0, 0, 1, 1,
1.069324, -1.629007, 1.587839, 1, 1, 1, 1, 1,
1.074075, -0.3083345, 1.940094, 1, 1, 1, 1, 1,
1.078877, -0.4145793, 2.119638, 1, 1, 1, 1, 1,
1.079214, 2.355242, 1.216123, 1, 1, 1, 1, 1,
1.079533, -0.3680243, 2.484129, 1, 1, 1, 1, 1,
1.080613, -0.1557506, 1.673586, 1, 1, 1, 1, 1,
1.083406, -0.03349608, 0.7825617, 1, 1, 1, 1, 1,
1.085463, 1.567293, 2.29723, 1, 1, 1, 1, 1,
1.086628, -0.3235221, 1.178355, 1, 1, 1, 1, 1,
1.087317, -0.3945965, 3.004769, 1, 1, 1, 1, 1,
1.10054, 0.7645779, 0.6929141, 1, 1, 1, 1, 1,
1.114032, 0.5383239, 1.77685, 1, 1, 1, 1, 1,
1.120392, 1.10991, 2.017894, 1, 1, 1, 1, 1,
1.124246, 0.9423703, 1.536927, 1, 1, 1, 1, 1,
1.133042, 0.1829886, 2.112113, 1, 1, 1, 1, 1,
1.137691, 1.980759, 1.388197, 0, 0, 1, 1, 1,
1.139121, 0.02395647, 2.425295, 1, 0, 0, 1, 1,
1.139807, -0.2626737, 2.990876, 1, 0, 0, 1, 1,
1.149998, 0.6630332, 1.191585, 1, 0, 0, 1, 1,
1.152188, 1.759817, 1.426037, 1, 0, 0, 1, 1,
1.153261, 1.125759, -0.4361093, 1, 0, 0, 1, 1,
1.153457, 0.994714, 0.8537248, 0, 0, 0, 1, 1,
1.155149, 0.3350123, 2.563693, 0, 0, 0, 1, 1,
1.162677, 0.04500152, -0.2668216, 0, 0, 0, 1, 1,
1.166506, -1.065919, 3.942163, 0, 0, 0, 1, 1,
1.168213, 0.540078, 1.948164, 0, 0, 0, 1, 1,
1.190211, -0.3830058, 1.55157, 0, 0, 0, 1, 1,
1.19069, 0.2679883, 1.34743, 0, 0, 0, 1, 1,
1.192535, -0.3352413, 1.660546, 1, 1, 1, 1, 1,
1.19867, -1.147152, 2.793334, 1, 1, 1, 1, 1,
1.205274, -0.006419543, 2.50921, 1, 1, 1, 1, 1,
1.217978, 1.051437, 2.511873, 1, 1, 1, 1, 1,
1.229657, -1.785272, 3.010411, 1, 1, 1, 1, 1,
1.242433, 0.03535866, 1.268196, 1, 1, 1, 1, 1,
1.246226, 0.0681152, 0.1740671, 1, 1, 1, 1, 1,
1.246961, 1.094751, 0.9068504, 1, 1, 1, 1, 1,
1.250533, -1.257458, 1.845871, 1, 1, 1, 1, 1,
1.254833, -0.8428054, 1.192106, 1, 1, 1, 1, 1,
1.259984, 2.060507, -2.074788, 1, 1, 1, 1, 1,
1.261109, 0.3549247, 1.339275, 1, 1, 1, 1, 1,
1.268922, 1.987081, -0.4783291, 1, 1, 1, 1, 1,
1.269983, -0.1733052, 2.972505, 1, 1, 1, 1, 1,
1.275013, -2.937592, 2.04691, 1, 1, 1, 1, 1,
1.276141, -0.3506495, 2.117615, 0, 0, 1, 1, 1,
1.287372, -0.4984311, 3.203374, 1, 0, 0, 1, 1,
1.292283, -0.8341275, 2.684319, 1, 0, 0, 1, 1,
1.29707, -0.002823141, 2.125741, 1, 0, 0, 1, 1,
1.299284, 0.4414575, 1.978902, 1, 0, 0, 1, 1,
1.300163, -1.454841, 3.76594, 1, 0, 0, 1, 1,
1.309539, 1.179437, 0.7927958, 0, 0, 0, 1, 1,
1.312111, -0.1677649, 1.467303, 0, 0, 0, 1, 1,
1.331995, -1.17749, 3.51329, 0, 0, 0, 1, 1,
1.335448, 0.5053913, 0.7052632, 0, 0, 0, 1, 1,
1.347831, 2.003214, -0.2249004, 0, 0, 0, 1, 1,
1.350609, 0.008845353, 1.915404, 0, 0, 0, 1, 1,
1.358835, 0.2930429, 0.2137551, 0, 0, 0, 1, 1,
1.36472, -0.8502683, 2.43945, 1, 1, 1, 1, 1,
1.365699, -2.325267, 1.753718, 1, 1, 1, 1, 1,
1.366189, 0.7159967, 2.484341, 1, 1, 1, 1, 1,
1.370275, 1.313702, 1.992967, 1, 1, 1, 1, 1,
1.386559, -1.554881, 0.9378316, 1, 1, 1, 1, 1,
1.394137, -1.089548, 1.809221, 1, 1, 1, 1, 1,
1.394485, -1.347245, 2.559503, 1, 1, 1, 1, 1,
1.398406, -1.102629, 1.684059, 1, 1, 1, 1, 1,
1.400794, -0.6153533, 2.308256, 1, 1, 1, 1, 1,
1.405953, 1.208572, 0.8577123, 1, 1, 1, 1, 1,
1.429613, -0.8491137, 0.9954371, 1, 1, 1, 1, 1,
1.429625, -0.3023257, 0.6003125, 1, 1, 1, 1, 1,
1.437441, -0.7883256, 1.792469, 1, 1, 1, 1, 1,
1.443438, -1.371201, 2.855772, 1, 1, 1, 1, 1,
1.446517, -1.389514, 1.699657, 1, 1, 1, 1, 1,
1.452697, -0.7234997, 1.954054, 0, 0, 1, 1, 1,
1.481505, -0.02244844, 2.978603, 1, 0, 0, 1, 1,
1.481571, -0.2536707, 0.8318393, 1, 0, 0, 1, 1,
1.496754, 0.4455403, 1.426994, 1, 0, 0, 1, 1,
1.497109, -0.6185519, 2.970414, 1, 0, 0, 1, 1,
1.504578, -0.2547591, 4.228781, 1, 0, 0, 1, 1,
1.511347, -0.4208929, 0.3967219, 0, 0, 0, 1, 1,
1.51556, 0.5692059, 0.9855371, 0, 0, 0, 1, 1,
1.516675, -0.3462378, 2.407225, 0, 0, 0, 1, 1,
1.517385, 0.8864687, 0.4149871, 0, 0, 0, 1, 1,
1.53911, -0.6379245, 1.456301, 0, 0, 0, 1, 1,
1.552656, -0.04599031, 0.7649258, 0, 0, 0, 1, 1,
1.559004, -0.3032497, -0.2388891, 0, 0, 0, 1, 1,
1.572307, -1.221162, 0.8040684, 1, 1, 1, 1, 1,
1.578108, -1.142906, 2.724646, 1, 1, 1, 1, 1,
1.579762, 0.0335178, -0.5815203, 1, 1, 1, 1, 1,
1.581114, -0.3586677, 2.977865, 1, 1, 1, 1, 1,
1.593879, -1.156266, 0.3743895, 1, 1, 1, 1, 1,
1.597148, 1.234921, -0.2396742, 1, 1, 1, 1, 1,
1.623707, 0.08290491, 1.284512, 1, 1, 1, 1, 1,
1.631496, -0.610123, 2.200738, 1, 1, 1, 1, 1,
1.633305, -0.5134135, 1.237091, 1, 1, 1, 1, 1,
1.636334, -0.7293888, 2.384412, 1, 1, 1, 1, 1,
1.684035, -0.7520205, 2.582547, 1, 1, 1, 1, 1,
1.686105, -0.5759055, 1.391968, 1, 1, 1, 1, 1,
1.687333, -0.5441929, 2.329918, 1, 1, 1, 1, 1,
1.690974, -1.47835, 2.918013, 1, 1, 1, 1, 1,
1.694948, 0.4281756, 0.3419297, 1, 1, 1, 1, 1,
1.704682, 0.2611586, 1.657639, 0, 0, 1, 1, 1,
1.708894, 1.178398, 0.9203894, 1, 0, 0, 1, 1,
1.716434, 0.1447707, 2.069129, 1, 0, 0, 1, 1,
1.720864, -1.071222, 1.830071, 1, 0, 0, 1, 1,
1.734707, -0.4071227, 2.029636, 1, 0, 0, 1, 1,
1.740659, -0.7427137, 2.106941, 1, 0, 0, 1, 1,
1.740703, 0.642765, 0.465611, 0, 0, 0, 1, 1,
1.742163, -1.211812, 1.041604, 0, 0, 0, 1, 1,
1.772418, 1.678777, 0.3715412, 0, 0, 0, 1, 1,
1.785514, -0.3109758, 2.653841, 0, 0, 0, 1, 1,
1.792753, 1.213639, 0.486875, 0, 0, 0, 1, 1,
1.811186, 2.195779, 0.2784731, 0, 0, 0, 1, 1,
1.836046, -0.7077056, 0.9963313, 0, 0, 0, 1, 1,
1.841832, 1.356717, 1.430183, 1, 1, 1, 1, 1,
1.859126, -0.4674289, -0.3115343, 1, 1, 1, 1, 1,
1.878393, -1.345692, 3.167925, 1, 1, 1, 1, 1,
1.887825, 0.5576185, 1.86007, 1, 1, 1, 1, 1,
1.903605, 0.4243759, 0.4493914, 1, 1, 1, 1, 1,
1.912431, 0.5638313, 1.053763, 1, 1, 1, 1, 1,
1.937623, 0.9069054, 1.686731, 1, 1, 1, 1, 1,
1.943919, -1.590572, 2.650198, 1, 1, 1, 1, 1,
1.948966, 0.267709, 1.257495, 1, 1, 1, 1, 1,
1.974893, 1.321422, -0.1090489, 1, 1, 1, 1, 1,
1.977606, 0.5173345, 1.206898, 1, 1, 1, 1, 1,
1.981429, 0.767408, 2.025599, 1, 1, 1, 1, 1,
1.996804, 0.6719056, -1.06921, 1, 1, 1, 1, 1,
2.002855, -0.2902068, 2.590883, 1, 1, 1, 1, 1,
2.008687, -0.4145076, 3.939425, 1, 1, 1, 1, 1,
2.028079, 1.397576, 1.417945, 0, 0, 1, 1, 1,
2.033109, -1.217141, 1.95444, 1, 0, 0, 1, 1,
2.03381, 1.778843, 0.1216323, 1, 0, 0, 1, 1,
2.038042, -1.671646, 2.624996, 1, 0, 0, 1, 1,
2.048557, 0.02601459, 2.308808, 1, 0, 0, 1, 1,
2.075964, -0.5041604, 1.114498, 1, 0, 0, 1, 1,
2.078167, -0.337701, 1.196707, 0, 0, 0, 1, 1,
2.089949, 0.2518542, 0.7997521, 0, 0, 0, 1, 1,
2.108606, -0.5929875, 1.714123, 0, 0, 0, 1, 1,
2.120981, 1.920094, 1.692251, 0, 0, 0, 1, 1,
2.125279, -0.1357989, 2.4552, 0, 0, 0, 1, 1,
2.202451, -0.4682077, 0.3014694, 0, 0, 0, 1, 1,
2.292063, 0.9218858, 0.7629957, 0, 0, 0, 1, 1,
2.294111, 2.948264, 0.514712, 1, 1, 1, 1, 1,
2.478801, 0.1507462, 2.16897, 1, 1, 1, 1, 1,
2.525448, 0.6783276, 1.594624, 1, 1, 1, 1, 1,
2.607, 0.05590968, -0.1971669, 1, 1, 1, 1, 1,
2.651139, -0.9995169, 1.939151, 1, 1, 1, 1, 1,
2.89854, -0.2327544, 0.6077098, 1, 1, 1, 1, 1,
3.083344, -0.9390432, 3.735586, 1, 1, 1, 1, 1
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
var radius = 9.434689;
var distance = 33.13895;
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
mvMatrix.translate( 0.2734449, 0.05376148, 0.3863876 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.13895);
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
