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
-3.52524, 0.2396165, -1.297556, 1, 0, 0, 1,
-3.231496, -0.6904047, -4.770025, 1, 0.007843138, 0, 1,
-2.717555, -0.7165884, -2.075193, 1, 0.01176471, 0, 1,
-2.540161, -0.4023828, -0.7810681, 1, 0.01960784, 0, 1,
-2.461043, -0.5241721, -2.016669, 1, 0.02352941, 0, 1,
-2.272418, -0.7360122, -1.856857, 1, 0.03137255, 0, 1,
-2.236235, 0.4722362, 0.5769453, 1, 0.03529412, 0, 1,
-2.202487, 0.08698597, -1.487375, 1, 0.04313726, 0, 1,
-2.19923, -1.1616, -1.282041, 1, 0.04705882, 0, 1,
-2.184734, -1.58857, -0.8001558, 1, 0.05490196, 0, 1,
-2.16557, 1.674316, -1.756462, 1, 0.05882353, 0, 1,
-2.142308, 2.634704, -0.5319484, 1, 0.06666667, 0, 1,
-2.08637, -0.06808872, -0.5752461, 1, 0.07058824, 0, 1,
-2.075933, 1.052576, 0.1612163, 1, 0.07843138, 0, 1,
-2.066922, -0.3325783, -1.157515, 1, 0.08235294, 0, 1,
-2.062531, -1.102425, -1.746512, 1, 0.09019608, 0, 1,
-2.028347, 0.008722614, -0.8897322, 1, 0.09411765, 0, 1,
-2.016458, -1.183963, 0.5535212, 1, 0.1019608, 0, 1,
-2.002383, -0.181693, -1.158286, 1, 0.1098039, 0, 1,
-1.966051, 1.950774, -0.4245983, 1, 0.1137255, 0, 1,
-1.951775, -0.1206193, -1.227785, 1, 0.1215686, 0, 1,
-1.941502, 3.107324, -1.522533, 1, 0.1254902, 0, 1,
-1.899993, -0.3279692, -3.409796, 1, 0.1333333, 0, 1,
-1.891699, -0.2162441, -1.037145, 1, 0.1372549, 0, 1,
-1.889253, 1.548993, -0.7325287, 1, 0.145098, 0, 1,
-1.864727, -0.4748423, -3.256612, 1, 0.1490196, 0, 1,
-1.832747, -0.1427285, -1.004962, 1, 0.1568628, 0, 1,
-1.81466, 0.2542809, -1.594695, 1, 0.1607843, 0, 1,
-1.811989, -0.4537288, -2.056826, 1, 0.1686275, 0, 1,
-1.800414, -0.6308041, -1.495143, 1, 0.172549, 0, 1,
-1.788477, 0.4335969, -2.720454, 1, 0.1803922, 0, 1,
-1.748911, -2.072152, -2.720912, 1, 0.1843137, 0, 1,
-1.748375, -0.9212852, 0.167388, 1, 0.1921569, 0, 1,
-1.739854, -2.204243, -4.475107, 1, 0.1960784, 0, 1,
-1.729292, -1.524523, -1.52627, 1, 0.2039216, 0, 1,
-1.705817, 1.179803, -0.1347743, 1, 0.2117647, 0, 1,
-1.68135, 0.4487783, -0.3416827, 1, 0.2156863, 0, 1,
-1.677409, 2.731113, 0.7517928, 1, 0.2235294, 0, 1,
-1.671084, -0.8714334, -1.470691, 1, 0.227451, 0, 1,
-1.666598, 0.7676002, -1.803511, 1, 0.2352941, 0, 1,
-1.666476, 0.2636794, 0.6813286, 1, 0.2392157, 0, 1,
-1.659466, -0.3063502, -1.629905, 1, 0.2470588, 0, 1,
-1.651384, 0.8936336, 0.4093042, 1, 0.2509804, 0, 1,
-1.649061, 1.387759, -0.4531119, 1, 0.2588235, 0, 1,
-1.6364, 1.023332, -2.324443, 1, 0.2627451, 0, 1,
-1.6144, -0.5296199, -0.9073732, 1, 0.2705882, 0, 1,
-1.613164, 0.8419784, -1.911965, 1, 0.2745098, 0, 1,
-1.608548, 0.7081633, -2.264902, 1, 0.282353, 0, 1,
-1.60312, -0.09167415, -1.384347, 1, 0.2862745, 0, 1,
-1.582647, -1.590211, -2.805055, 1, 0.2941177, 0, 1,
-1.539485, 1.316825, -1.655028, 1, 0.3019608, 0, 1,
-1.524336, 1.226426, -1.812042, 1, 0.3058824, 0, 1,
-1.519248, 0.2620803, -1.231761, 1, 0.3137255, 0, 1,
-1.517643, 1.76547, 0.8903607, 1, 0.3176471, 0, 1,
-1.509751, -0.9564194, -5.13837, 1, 0.3254902, 0, 1,
-1.504976, 0.9458318, -2.738008, 1, 0.3294118, 0, 1,
-1.491299, -0.6306806, -1.590088, 1, 0.3372549, 0, 1,
-1.484392, -0.5105984, -1.827589, 1, 0.3411765, 0, 1,
-1.481104, -0.374658, -1.59591, 1, 0.3490196, 0, 1,
-1.466654, 0.8719018, -1.656564, 1, 0.3529412, 0, 1,
-1.461659, -0.2305935, -1.328706, 1, 0.3607843, 0, 1,
-1.460764, 0.3395823, -0.9773219, 1, 0.3647059, 0, 1,
-1.460709, -1.292309, -1.817613, 1, 0.372549, 0, 1,
-1.45251, -0.6460593, -2.710832, 1, 0.3764706, 0, 1,
-1.45251, -0.2465776, -0.8921031, 1, 0.3843137, 0, 1,
-1.449194, 1.79426, -0.9373721, 1, 0.3882353, 0, 1,
-1.442994, 0.3114203, -1.08098, 1, 0.3960784, 0, 1,
-1.435701, -0.02093643, -2.262877, 1, 0.4039216, 0, 1,
-1.430418, 0.1641205, -1.118311, 1, 0.4078431, 0, 1,
-1.424979, 1.716916, -0.05818056, 1, 0.4156863, 0, 1,
-1.424541, -0.7359732, -1.8009, 1, 0.4196078, 0, 1,
-1.423093, 1.349326, -1.606078, 1, 0.427451, 0, 1,
-1.396847, 0.4915363, -2.001091, 1, 0.4313726, 0, 1,
-1.387122, -0.5745704, -0.09268189, 1, 0.4392157, 0, 1,
-1.384205, 0.4747794, -2.998742, 1, 0.4431373, 0, 1,
-1.380227, -2.642578, -2.757906, 1, 0.4509804, 0, 1,
-1.378979, -1.651487, -2.23675, 1, 0.454902, 0, 1,
-1.378621, -0.777756, -1.209949, 1, 0.4627451, 0, 1,
-1.357859, 0.5650156, -2.712757, 1, 0.4666667, 0, 1,
-1.349675, 0.5980318, 0.8366555, 1, 0.4745098, 0, 1,
-1.337928, 0.00112363, -0.6122042, 1, 0.4784314, 0, 1,
-1.323306, -0.3539374, -1.135788, 1, 0.4862745, 0, 1,
-1.321529, -0.9966069, -2.4301, 1, 0.4901961, 0, 1,
-1.31259, 0.1550956, -2.591367, 1, 0.4980392, 0, 1,
-1.310864, -0.5786114, -0.8799295, 1, 0.5058824, 0, 1,
-1.292851, -0.9192899, -2.435657, 1, 0.509804, 0, 1,
-1.290934, 0.08123051, -1.056306, 1, 0.5176471, 0, 1,
-1.285872, -0.7041444, -1.307326, 1, 0.5215687, 0, 1,
-1.281385, -0.02725423, -1.224383, 1, 0.5294118, 0, 1,
-1.281049, -0.9883525, -2.328208, 1, 0.5333334, 0, 1,
-1.27903, -1.077314, -3.38829, 1, 0.5411765, 0, 1,
-1.267811, 1.148749, -0.07120553, 1, 0.5450981, 0, 1,
-1.260911, 1.440891, 0.1228441, 1, 0.5529412, 0, 1,
-1.252515, -1.626521, -2.776633, 1, 0.5568628, 0, 1,
-1.248433, -1.078673, -2.019647, 1, 0.5647059, 0, 1,
-1.247944, -1.356544, -2.153469, 1, 0.5686275, 0, 1,
-1.218253, -1.431398, -2.319675, 1, 0.5764706, 0, 1,
-1.216241, 0.8012956, -1.277064, 1, 0.5803922, 0, 1,
-1.21035, 1.143586, -1.23783, 1, 0.5882353, 0, 1,
-1.20844, -1.510903, -2.764101, 1, 0.5921569, 0, 1,
-1.197673, -0.3248277, -3.17282, 1, 0.6, 0, 1,
-1.195618, -0.525103, -2.031899, 1, 0.6078432, 0, 1,
-1.188968, 0.9910825, 1.14006, 1, 0.6117647, 0, 1,
-1.187304, 0.3954114, -2.339168, 1, 0.6196079, 0, 1,
-1.178884, -0.9527689, -2.613693, 1, 0.6235294, 0, 1,
-1.169633, 1.23222, -1.918905, 1, 0.6313726, 0, 1,
-1.165426, 1.364833, 0.1504686, 1, 0.6352941, 0, 1,
-1.162925, -0.5515444, -3.870193, 1, 0.6431373, 0, 1,
-1.155705, -0.02334366, -1.195922, 1, 0.6470588, 0, 1,
-1.136852, -0.6142057, -5.053069, 1, 0.654902, 0, 1,
-1.132637, 0.02403704, -1.574589, 1, 0.6588235, 0, 1,
-1.130893, 0.4540627, -3.572819, 1, 0.6666667, 0, 1,
-1.129128, 0.5063486, -0.8867788, 1, 0.6705883, 0, 1,
-1.127685, 0.1685472, -2.452851, 1, 0.6784314, 0, 1,
-1.125568, -0.4017286, -2.393378, 1, 0.682353, 0, 1,
-1.113065, 2.294567, -0.6109661, 1, 0.6901961, 0, 1,
-1.111759, 0.1609175, -2.398608, 1, 0.6941177, 0, 1,
-1.109972, 0.403148, -0.7291505, 1, 0.7019608, 0, 1,
-1.105353, 0.9280904, -1.902374, 1, 0.7098039, 0, 1,
-1.105197, -1.723436, -2.312394, 1, 0.7137255, 0, 1,
-1.096153, -0.1881448, -2.011008, 1, 0.7215686, 0, 1,
-1.096014, 1.091421, -1.07304, 1, 0.7254902, 0, 1,
-1.087744, 0.490384, -3.021419, 1, 0.7333333, 0, 1,
-1.085837, -1.437731, -2.145614, 1, 0.7372549, 0, 1,
-1.078923, 0.1079808, -2.813456, 1, 0.7450981, 0, 1,
-1.076092, -2.359387, -2.578883, 1, 0.7490196, 0, 1,
-1.075692, 0.9017867, -0.8260866, 1, 0.7568628, 0, 1,
-1.074715, -0.6929663, -3.493028, 1, 0.7607843, 0, 1,
-1.073699, 0.285366, -0.4604641, 1, 0.7686275, 0, 1,
-1.07348, -1.290555, -3.01859, 1, 0.772549, 0, 1,
-1.070886, 0.9468876, -0.2202279, 1, 0.7803922, 0, 1,
-1.068823, 1.679864, -1.642275, 1, 0.7843137, 0, 1,
-1.053703, -0.4929929, -1.382271, 1, 0.7921569, 0, 1,
-1.051267, -1.031196, -2.910211, 1, 0.7960784, 0, 1,
-1.041345, -0.6906884, -1.159333, 1, 0.8039216, 0, 1,
-1.038025, -0.03491274, -0.6416798, 1, 0.8117647, 0, 1,
-1.037389, -1.167643, -3.373934, 1, 0.8156863, 0, 1,
-1.036765, -0.3035828, -1.799711, 1, 0.8235294, 0, 1,
-1.033204, 0.4038855, -0.09638027, 1, 0.827451, 0, 1,
-1.019148, -1.056491, -1.583017, 1, 0.8352941, 0, 1,
-1.010767, 0.2342171, -0.6532583, 1, 0.8392157, 0, 1,
-1.007924, -0.6591706, -2.057505, 1, 0.8470588, 0, 1,
-1.006676, -0.9826379, -2.375427, 1, 0.8509804, 0, 1,
-1.002449, -1.179515, -3.262096, 1, 0.8588235, 0, 1,
-1.001058, 0.1358935, -0.3980494, 1, 0.8627451, 0, 1,
-0.9995253, -0.3193426, -3.909856, 1, 0.8705882, 0, 1,
-0.9964229, 1.392702, -0.3629538, 1, 0.8745098, 0, 1,
-0.9939558, -0.124915, -2.631004, 1, 0.8823529, 0, 1,
-0.9888229, -0.5946387, -1.727838, 1, 0.8862745, 0, 1,
-0.9884524, 0.02746894, -0.04621173, 1, 0.8941177, 0, 1,
-0.986721, -1.023777, -0.6974397, 1, 0.8980392, 0, 1,
-0.9803745, -0.6317646, -0.3189565, 1, 0.9058824, 0, 1,
-0.9799751, -2.071748, -3.221587, 1, 0.9137255, 0, 1,
-0.9763759, 1.306185, -1.260953, 1, 0.9176471, 0, 1,
-0.9762782, -0.1761104, -2.87538, 1, 0.9254902, 0, 1,
-0.9760372, 0.2569963, -0.8605222, 1, 0.9294118, 0, 1,
-0.9749352, -0.7843375, -2.927052, 1, 0.9372549, 0, 1,
-0.9743756, 1.674734, -1.117105, 1, 0.9411765, 0, 1,
-0.9713905, 0.723509, -0.8435327, 1, 0.9490196, 0, 1,
-0.9680684, -0.4029746, -1.160818, 1, 0.9529412, 0, 1,
-0.9677269, 1.479053, -0.2021111, 1, 0.9607843, 0, 1,
-0.9636111, -0.51025, -2.373408, 1, 0.9647059, 0, 1,
-0.9597023, 0.7206045, 0.05557126, 1, 0.972549, 0, 1,
-0.9594836, -0.5125726, -2.692295, 1, 0.9764706, 0, 1,
-0.9594301, -1.00292, -2.374564, 1, 0.9843137, 0, 1,
-0.955673, -1.181063, -1.157392, 1, 0.9882353, 0, 1,
-0.9555814, 1.401101, -0.479615, 1, 0.9960784, 0, 1,
-0.9545271, -1.397017, -3.352271, 0.9960784, 1, 0, 1,
-0.9527698, -0.1673627, -2.435087, 0.9921569, 1, 0, 1,
-0.9469507, -0.4126326, -1.947326, 0.9843137, 1, 0, 1,
-0.9452575, -1.639108, -2.894473, 0.9803922, 1, 0, 1,
-0.9419845, -1.051383, -1.481747, 0.972549, 1, 0, 1,
-0.9336932, 0.09206262, -1.359298, 0.9686275, 1, 0, 1,
-0.9262325, -0.04982771, -1.213951, 0.9607843, 1, 0, 1,
-0.9178382, -0.3908699, -1.481115, 0.9568627, 1, 0, 1,
-0.9166617, -0.208126, -1.943743, 0.9490196, 1, 0, 1,
-0.9129706, 0.8854323, 0.01204924, 0.945098, 1, 0, 1,
-0.8977531, 0.632032, 0.126371, 0.9372549, 1, 0, 1,
-0.8880369, 1.177264, -0.7113446, 0.9333333, 1, 0, 1,
-0.8822024, -0.1349864, -0.6623416, 0.9254902, 1, 0, 1,
-0.8809959, 1.155256, 0.9207956, 0.9215686, 1, 0, 1,
-0.8711959, -1.388924, -2.534186, 0.9137255, 1, 0, 1,
-0.8637896, 0.02903683, -1.745191, 0.9098039, 1, 0, 1,
-0.8634149, -0.786175, -2.24976, 0.9019608, 1, 0, 1,
-0.8621101, 1.361817, -1.675136, 0.8941177, 1, 0, 1,
-0.8604147, -1.621694, -1.961062, 0.8901961, 1, 0, 1,
-0.858961, -0.9370124, -3.086548, 0.8823529, 1, 0, 1,
-0.8588176, 0.9661505, -0.6662422, 0.8784314, 1, 0, 1,
-0.8587922, -0.4832129, -0.2970535, 0.8705882, 1, 0, 1,
-0.8547875, 0.5007502, -1.804224, 0.8666667, 1, 0, 1,
-0.8531837, 0.1532721, -1.003383, 0.8588235, 1, 0, 1,
-0.8468002, 0.4266143, 0.2291413, 0.854902, 1, 0, 1,
-0.844394, 0.5444326, -2.675633, 0.8470588, 1, 0, 1,
-0.8443267, 0.8585301, -0.214601, 0.8431373, 1, 0, 1,
-0.8408144, 0.02323684, -2.263604, 0.8352941, 1, 0, 1,
-0.8400776, 0.05717273, -0.08693255, 0.8313726, 1, 0, 1,
-0.8400148, -1.209488, -0.03954937, 0.8235294, 1, 0, 1,
-0.8347462, 0.2640662, -2.032331, 0.8196079, 1, 0, 1,
-0.8334937, 0.2424978, -0.5442724, 0.8117647, 1, 0, 1,
-0.8321386, -1.792748, -2.141896, 0.8078431, 1, 0, 1,
-0.8314587, -1.287021, -0.5926471, 0.8, 1, 0, 1,
-0.829059, -0.7249079, -2.858119, 0.7921569, 1, 0, 1,
-0.8178208, -2.669207, -4.357593, 0.7882353, 1, 0, 1,
-0.8169505, 0.5617293, -4.029406, 0.7803922, 1, 0, 1,
-0.8160501, 0.1175039, -0.7385483, 0.7764706, 1, 0, 1,
-0.8134384, -1.508915, -2.576286, 0.7686275, 1, 0, 1,
-0.8080133, -0.09287093, -0.9878748, 0.7647059, 1, 0, 1,
-0.8071601, -0.4124056, -2.119334, 0.7568628, 1, 0, 1,
-0.7981336, 0.6134221, -1.258978, 0.7529412, 1, 0, 1,
-0.7980591, -1.006478, -3.930348, 0.7450981, 1, 0, 1,
-0.7978792, -0.2972213, -1.946903, 0.7411765, 1, 0, 1,
-0.7936937, 1.635993, -1.528493, 0.7333333, 1, 0, 1,
-0.792502, -0.6313654, -2.144587, 0.7294118, 1, 0, 1,
-0.7917877, 0.4815206, -2.173373, 0.7215686, 1, 0, 1,
-0.7898055, 0.1467815, -1.622226, 0.7176471, 1, 0, 1,
-0.7894268, 0.532968, -1.376206, 0.7098039, 1, 0, 1,
-0.7859766, 1.111289, -1.239733, 0.7058824, 1, 0, 1,
-0.7723296, -0.8020627, -2.504008, 0.6980392, 1, 0, 1,
-0.7701516, 0.7364264, 0.472965, 0.6901961, 1, 0, 1,
-0.7691584, 0.3885248, -1.444004, 0.6862745, 1, 0, 1,
-0.7690526, -0.08857529, -1.826891, 0.6784314, 1, 0, 1,
-0.7638503, 1.241736, 1.34526, 0.6745098, 1, 0, 1,
-0.7567557, -0.01120114, -3.529201, 0.6666667, 1, 0, 1,
-0.7531986, -1.134365, -2.957732, 0.6627451, 1, 0, 1,
-0.7505137, -0.1204487, -0.4057217, 0.654902, 1, 0, 1,
-0.7440204, 0.7632355, 0.1338741, 0.6509804, 1, 0, 1,
-0.7421819, -0.4837772, -2.757536, 0.6431373, 1, 0, 1,
-0.7371951, -0.6521063, -1.074881, 0.6392157, 1, 0, 1,
-0.7345937, -0.4261363, -1.630326, 0.6313726, 1, 0, 1,
-0.7326095, 0.3425376, -0.06213334, 0.627451, 1, 0, 1,
-0.7286829, 0.3235724, 0.7140616, 0.6196079, 1, 0, 1,
-0.7266208, -1.206309, -1.558804, 0.6156863, 1, 0, 1,
-0.7236518, 0.3938713, -2.176762, 0.6078432, 1, 0, 1,
-0.7234657, -0.6780286, -3.4502, 0.6039216, 1, 0, 1,
-0.7194557, 1.378668, -1.292907, 0.5960785, 1, 0, 1,
-0.718482, 1.338893, -3.568193, 0.5882353, 1, 0, 1,
-0.7157479, -0.9833885, -2.291738, 0.5843138, 1, 0, 1,
-0.7141371, 0.4819883, -0.9248635, 0.5764706, 1, 0, 1,
-0.7139354, 1.016077, 0.04601444, 0.572549, 1, 0, 1,
-0.7115832, -1.408554, -3.706689, 0.5647059, 1, 0, 1,
-0.7108096, 2.155472, -0.456144, 0.5607843, 1, 0, 1,
-0.7073321, 1.313403, 1.525907, 0.5529412, 1, 0, 1,
-0.7045488, 1.859751, -1.343299, 0.5490196, 1, 0, 1,
-0.6976873, 1.706904, -1.729712, 0.5411765, 1, 0, 1,
-0.6958998, -0.3363535, -1.326532, 0.5372549, 1, 0, 1,
-0.6913352, -0.06344219, -2.646305, 0.5294118, 1, 0, 1,
-0.6887622, -1.291346, -2.057061, 0.5254902, 1, 0, 1,
-0.6837148, 1.508506, -0.1608224, 0.5176471, 1, 0, 1,
-0.6832174, -0.8174021, -2.136264, 0.5137255, 1, 0, 1,
-0.6802447, -1.366394, -1.719436, 0.5058824, 1, 0, 1,
-0.6787485, 0.5159761, -1.519009, 0.5019608, 1, 0, 1,
-0.6695325, -0.1435279, -0.7707814, 0.4941176, 1, 0, 1,
-0.6633081, 0.8741723, -1.450743, 0.4862745, 1, 0, 1,
-0.6618385, -0.4215654, -1.691014, 0.4823529, 1, 0, 1,
-0.6572302, -0.6263445, -0.3782038, 0.4745098, 1, 0, 1,
-0.6569091, -3.113953, -2.141032, 0.4705882, 1, 0, 1,
-0.6561038, -1.071598, -3.451668, 0.4627451, 1, 0, 1,
-0.6537505, 1.613527, -0.4043034, 0.4588235, 1, 0, 1,
-0.6518666, -1.388492, -3.020211, 0.4509804, 1, 0, 1,
-0.6477135, -0.9444939, -2.918755, 0.4470588, 1, 0, 1,
-0.643169, -0.428701, -1.147106, 0.4392157, 1, 0, 1,
-0.6409879, -0.9295607, -1.874758, 0.4352941, 1, 0, 1,
-0.6369576, 0.9263268, 0.3191891, 0.427451, 1, 0, 1,
-0.6329983, 0.1500884, -1.898382, 0.4235294, 1, 0, 1,
-0.6323833, -0.5778478, -2.097799, 0.4156863, 1, 0, 1,
-0.6314731, -1.021895, -3.42172, 0.4117647, 1, 0, 1,
-0.6298283, -0.5607036, -1.984162, 0.4039216, 1, 0, 1,
-0.6249016, -1.036126, -3.812492, 0.3960784, 1, 0, 1,
-0.621044, -1.472065, -3.285486, 0.3921569, 1, 0, 1,
-0.6187206, 0.4554699, -2.266237, 0.3843137, 1, 0, 1,
-0.6179696, 0.488857, -1.838305, 0.3803922, 1, 0, 1,
-0.6164683, 0.1195949, 0.7447873, 0.372549, 1, 0, 1,
-0.6162987, -0.7364954, -2.46337, 0.3686275, 1, 0, 1,
-0.6161194, 0.9280041, -0.1085458, 0.3607843, 1, 0, 1,
-0.6133211, -0.6827704, -0.6814001, 0.3568628, 1, 0, 1,
-0.6116723, -0.6354843, -2.061664, 0.3490196, 1, 0, 1,
-0.611425, 0.6516809, -1.461613, 0.345098, 1, 0, 1,
-0.6113084, -1.61446, -1.867292, 0.3372549, 1, 0, 1,
-0.610297, 0.07154799, -2.74647, 0.3333333, 1, 0, 1,
-0.606896, -0.3421141, -2.449935, 0.3254902, 1, 0, 1,
-0.6038146, -0.2228861, -5.231707, 0.3215686, 1, 0, 1,
-0.6024801, 0.475056, -0.08771341, 0.3137255, 1, 0, 1,
-0.6023425, 1.904179, -0.3092653, 0.3098039, 1, 0, 1,
-0.6020905, 1.549665, -1.510566, 0.3019608, 1, 0, 1,
-0.6015805, -0.2033072, -0.649335, 0.2941177, 1, 0, 1,
-0.6012933, -1.935689, -2.934878, 0.2901961, 1, 0, 1,
-0.5994324, 0.226931, -0.9809833, 0.282353, 1, 0, 1,
-0.5951558, 0.06215076, -0.6640282, 0.2784314, 1, 0, 1,
-0.5918415, -0.006803326, -0.9303889, 0.2705882, 1, 0, 1,
-0.5910321, -0.5894932, -2.643819, 0.2666667, 1, 0, 1,
-0.5900626, -0.3443217, -3.901057, 0.2588235, 1, 0, 1,
-0.5887609, 0.629754, -0.9827737, 0.254902, 1, 0, 1,
-0.587248, -1.446758, -2.986528, 0.2470588, 1, 0, 1,
-0.5840784, 0.8331593, -0.8228056, 0.2431373, 1, 0, 1,
-0.583681, -0.0200255, -1.909714, 0.2352941, 1, 0, 1,
-0.5817699, -0.6707827, -2.521916, 0.2313726, 1, 0, 1,
-0.5792117, -1.256595, -2.912986, 0.2235294, 1, 0, 1,
-0.576925, -0.9231674, -0.9800349, 0.2196078, 1, 0, 1,
-0.5755999, 0.1124474, -0.2893353, 0.2117647, 1, 0, 1,
-0.573124, -1.296746, -2.457909, 0.2078431, 1, 0, 1,
-0.5730945, -1.427216, -4.22461, 0.2, 1, 0, 1,
-0.571436, -0.6709126, -1.394708, 0.1921569, 1, 0, 1,
-0.5696424, -1.684773, -1.460788, 0.1882353, 1, 0, 1,
-0.567155, 0.4382601, -0.6020948, 0.1803922, 1, 0, 1,
-0.5649878, 0.2422096, -1.337772, 0.1764706, 1, 0, 1,
-0.561852, -1.333973, -2.336796, 0.1686275, 1, 0, 1,
-0.561163, 0.4297003, -1.336763, 0.1647059, 1, 0, 1,
-0.5592237, 0.5993866, -0.1646975, 0.1568628, 1, 0, 1,
-0.5585062, -0.7160708, -1.208918, 0.1529412, 1, 0, 1,
-0.5581771, 0.6902359, -1.849001, 0.145098, 1, 0, 1,
-0.5563335, 0.9742534, -0.4527784, 0.1411765, 1, 0, 1,
-0.5527987, 0.8038621, 0.4844785, 0.1333333, 1, 0, 1,
-0.5505122, 1.31346, -0.4156318, 0.1294118, 1, 0, 1,
-0.5502098, 0.7974876, -2.120438, 0.1215686, 1, 0, 1,
-0.5487967, 0.08893869, -0.7889737, 0.1176471, 1, 0, 1,
-0.5480686, -0.2045422, -2.863605, 0.1098039, 1, 0, 1,
-0.5464077, -0.9199412, -2.086506, 0.1058824, 1, 0, 1,
-0.5463846, 1.875663, -0.4571892, 0.09803922, 1, 0, 1,
-0.5429778, 0.3350332, -1.517796, 0.09019608, 1, 0, 1,
-0.5423331, -1.090488, -2.633136, 0.08627451, 1, 0, 1,
-0.54069, 0.6570895, -0.292038, 0.07843138, 1, 0, 1,
-0.5369516, 0.6972858, 0.07981396, 0.07450981, 1, 0, 1,
-0.5344325, 1.472301, -0.2774462, 0.06666667, 1, 0, 1,
-0.5275235, -2.818123, -2.546408, 0.0627451, 1, 0, 1,
-0.5220187, 0.60919, -1.614247, 0.05490196, 1, 0, 1,
-0.5188916, 0.3036199, 0.03775004, 0.05098039, 1, 0, 1,
-0.5167605, -0.6603552, -1.197683, 0.04313726, 1, 0, 1,
-0.51517, 0.8432734, -1.063351, 0.03921569, 1, 0, 1,
-0.5132118, 0.8914317, 0.3900363, 0.03137255, 1, 0, 1,
-0.5128412, -0.14151, -2.891241, 0.02745098, 1, 0, 1,
-0.5044476, 0.8499287, -0.7802373, 0.01960784, 1, 0, 1,
-0.5008563, 1.233108, -0.3690325, 0.01568628, 1, 0, 1,
-0.4994073, 1.571567, 0.7385663, 0.007843138, 1, 0, 1,
-0.4982323, 0.4704023, -0.7706251, 0.003921569, 1, 0, 1,
-0.4913067, -0.9511197, -4.140604, 0, 1, 0.003921569, 1,
-0.4904514, 0.7539716, 1.013581, 0, 1, 0.01176471, 1,
-0.4891194, -0.5030316, -3.570347, 0, 1, 0.01568628, 1,
-0.4890117, -0.7462511, -2.805341, 0, 1, 0.02352941, 1,
-0.4885331, 0.3910148, -1.494946, 0, 1, 0.02745098, 1,
-0.4847239, -0.5655791, -2.55977, 0, 1, 0.03529412, 1,
-0.4805455, 0.5983346, -1.682477, 0, 1, 0.03921569, 1,
-0.4746782, -0.6073893, -1.974443, 0, 1, 0.04705882, 1,
-0.4744968, 1.047614, 0.2731278, 0, 1, 0.05098039, 1,
-0.4738804, 2.414359, -1.479029, 0, 1, 0.05882353, 1,
-0.4733567, 0.9404778, -1.174394, 0, 1, 0.0627451, 1,
-0.4666112, -1.236444, -1.767487, 0, 1, 0.07058824, 1,
-0.4592131, 0.1642505, -0.5326645, 0, 1, 0.07450981, 1,
-0.4520248, 1.571157, 0.02975924, 0, 1, 0.08235294, 1,
-0.4504889, -0.2378328, -1.050606, 0, 1, 0.08627451, 1,
-0.4463009, -0.1782011, -2.528985, 0, 1, 0.09411765, 1,
-0.4456694, -1.233233, -1.987312, 0, 1, 0.1019608, 1,
-0.4456165, 0.2140587, -0.3634885, 0, 1, 0.1058824, 1,
-0.4431409, -0.4336942, -1.481457, 0, 1, 0.1137255, 1,
-0.4373451, 1.861191, 0.1805588, 0, 1, 0.1176471, 1,
-0.4361536, -0.5325252, -2.010098, 0, 1, 0.1254902, 1,
-0.4356903, 0.858879, -0.7123401, 0, 1, 0.1294118, 1,
-0.4325513, -1.339629, -2.52134, 0, 1, 0.1372549, 1,
-0.4323647, -0.08881777, -2.198227, 0, 1, 0.1411765, 1,
-0.4317604, 1.311784, 0.8003549, 0, 1, 0.1490196, 1,
-0.4314455, 1.306285, 0.2441619, 0, 1, 0.1529412, 1,
-0.4292687, -0.6137118, -2.562167, 0, 1, 0.1607843, 1,
-0.4270415, -0.205513, -1.372235, 0, 1, 0.1647059, 1,
-0.4264332, -0.6570869, -2.705292, 0, 1, 0.172549, 1,
-0.4219164, -1.140601, -2.628004, 0, 1, 0.1764706, 1,
-0.4215091, 0.5336327, -1.104278, 0, 1, 0.1843137, 1,
-0.421311, -1.927887, -3.451739, 0, 1, 0.1882353, 1,
-0.4199987, 0.6979771, -0.2259748, 0, 1, 0.1960784, 1,
-0.4102627, 1.182184, 1.087161, 0, 1, 0.2039216, 1,
-0.4055667, 0.9157161, -0.1069548, 0, 1, 0.2078431, 1,
-0.4020439, -0.7121324, -2.836782, 0, 1, 0.2156863, 1,
-0.3995727, 0.8725835, 0.3416226, 0, 1, 0.2196078, 1,
-0.398847, -0.06462196, -2.36858, 0, 1, 0.227451, 1,
-0.3982595, 0.6337286, -1.198881, 0, 1, 0.2313726, 1,
-0.3952185, -0.05537082, 0.3800331, 0, 1, 0.2392157, 1,
-0.3945437, -0.08773295, -1.278094, 0, 1, 0.2431373, 1,
-0.3926367, -1.159468, -2.134759, 0, 1, 0.2509804, 1,
-0.390668, 0.2620272, -1.295974, 0, 1, 0.254902, 1,
-0.3904797, 1.271325, 0.5952873, 0, 1, 0.2627451, 1,
-0.380672, -0.3800001, -1.522851, 0, 1, 0.2666667, 1,
-0.3758186, -0.5949395, -2.565405, 0, 1, 0.2745098, 1,
-0.3752534, 0.2643506, -1.482991, 0, 1, 0.2784314, 1,
-0.3700417, -0.477752, -1.264338, 0, 1, 0.2862745, 1,
-0.3678733, 0.2356585, -2.020416, 0, 1, 0.2901961, 1,
-0.361985, -1.308688, -3.287951, 0, 1, 0.2980392, 1,
-0.3617617, -1.986494, -2.863158, 0, 1, 0.3058824, 1,
-0.3617271, 0.7571059, -0.04089935, 0, 1, 0.3098039, 1,
-0.3606872, 0.2398529, -1.296591, 0, 1, 0.3176471, 1,
-0.3598973, -0.5629029, -1.186972, 0, 1, 0.3215686, 1,
-0.3554223, -1.418527, -4.063048, 0, 1, 0.3294118, 1,
-0.3459951, 0.5605161, 0.8304978, 0, 1, 0.3333333, 1,
-0.3455109, -0.4370829, -0.234714, 0, 1, 0.3411765, 1,
-0.3453538, 0.7369969, -0.1963904, 0, 1, 0.345098, 1,
-0.3377315, -0.23848, -2.301319, 0, 1, 0.3529412, 1,
-0.3356527, -0.7036893, -2.960491, 0, 1, 0.3568628, 1,
-0.3338522, -1.293231, -3.167386, 0, 1, 0.3647059, 1,
-0.3336544, -0.6384001, -3.885097, 0, 1, 0.3686275, 1,
-0.3258691, -1.847115, -2.458452, 0, 1, 0.3764706, 1,
-0.3258385, 0.06657999, -2.326783, 0, 1, 0.3803922, 1,
-0.3231561, -0.7395179, -3.691859, 0, 1, 0.3882353, 1,
-0.3222602, 0.4320836, -0.822428, 0, 1, 0.3921569, 1,
-0.3188817, -0.02333937, -1.796173, 0, 1, 0.4, 1,
-0.3152773, -1.345956, -1.38168, 0, 1, 0.4078431, 1,
-0.3122046, -1.367061, -3.651168, 0, 1, 0.4117647, 1,
-0.3092806, 0.2443387, -0.001299595, 0, 1, 0.4196078, 1,
-0.3022935, 0.7907503, -0.1909079, 0, 1, 0.4235294, 1,
-0.3013864, 0.05978613, -2.122626, 0, 1, 0.4313726, 1,
-0.2995189, -0.007177798, 0.7184051, 0, 1, 0.4352941, 1,
-0.2830332, -0.8501189, -2.499178, 0, 1, 0.4431373, 1,
-0.2808557, -0.02460816, -3.763753, 0, 1, 0.4470588, 1,
-0.2731383, -1.635638, -3.795857, 0, 1, 0.454902, 1,
-0.2668629, 0.1299681, -0.2488712, 0, 1, 0.4588235, 1,
-0.2638729, 0.9617012, 1.063272, 0, 1, 0.4666667, 1,
-0.2624676, -0.9273984, -4.981277, 0, 1, 0.4705882, 1,
-0.2615466, 0.7984036, -0.8334615, 0, 1, 0.4784314, 1,
-0.2578297, 0.3264087, 0.1345399, 0, 1, 0.4823529, 1,
-0.2551493, -0.2359541, -2.578801, 0, 1, 0.4901961, 1,
-0.2502596, -0.01434099, -1.375113, 0, 1, 0.4941176, 1,
-0.2441874, 0.01590018, -0.8471684, 0, 1, 0.5019608, 1,
-0.2384789, 1.057774, 0.616901, 0, 1, 0.509804, 1,
-0.2363919, -0.4164315, -4.334248, 0, 1, 0.5137255, 1,
-0.2349321, -0.4110754, -0.9803939, 0, 1, 0.5215687, 1,
-0.2263078, -1.860451, -2.561269, 0, 1, 0.5254902, 1,
-0.2262007, 0.8639809, 0.4194354, 0, 1, 0.5333334, 1,
-0.2260064, -0.4350735, -2.008388, 0, 1, 0.5372549, 1,
-0.2241993, -0.6005482, -3.386073, 0, 1, 0.5450981, 1,
-0.2228288, 0.7728978, -1.165264, 0, 1, 0.5490196, 1,
-0.220356, 1.383765, -1.652308, 0, 1, 0.5568628, 1,
-0.2202242, 0.2532741, -1.693743, 0, 1, 0.5607843, 1,
-0.219415, 1.449917, -0.4219387, 0, 1, 0.5686275, 1,
-0.218745, 0.3014129, -0.5285062, 0, 1, 0.572549, 1,
-0.218699, 1.03099, 2.142292, 0, 1, 0.5803922, 1,
-0.2173818, 0.7049834, -0.2596107, 0, 1, 0.5843138, 1,
-0.2153168, 2.180348, -0.7288982, 0, 1, 0.5921569, 1,
-0.2090037, -0.06009986, -1.343025, 0, 1, 0.5960785, 1,
-0.2071186, -0.002361195, -0.9636528, 0, 1, 0.6039216, 1,
-0.2015339, 0.2169633, -2.534949, 0, 1, 0.6117647, 1,
-0.2013879, 2.301817, -0.5231619, 0, 1, 0.6156863, 1,
-0.1950682, -0.3228416, -3.356423, 0, 1, 0.6235294, 1,
-0.1897797, 0.7567641, 1.930179, 0, 1, 0.627451, 1,
-0.1895595, 0.5189685, -1.3314, 0, 1, 0.6352941, 1,
-0.1863753, 0.4635738, -0.6634275, 0, 1, 0.6392157, 1,
-0.1851528, -0.2311434, -4.164162, 0, 1, 0.6470588, 1,
-0.1780833, 0.3508769, 1.169553, 0, 1, 0.6509804, 1,
-0.1776939, -0.395639, -2.029631, 0, 1, 0.6588235, 1,
-0.1751756, -1.847466, -2.640441, 0, 1, 0.6627451, 1,
-0.1693493, -0.2317621, -1.5826, 0, 1, 0.6705883, 1,
-0.165812, -1.976916, -3.099622, 0, 1, 0.6745098, 1,
-0.1639335, 0.05121851, -0.6687123, 0, 1, 0.682353, 1,
-0.1626091, -0.4513946, -2.954518, 0, 1, 0.6862745, 1,
-0.15567, -1.916818, -3.58215, 0, 1, 0.6941177, 1,
-0.1551242, -0.7891696, -4.020595, 0, 1, 0.7019608, 1,
-0.154651, 0.9955099, 1.03856, 0, 1, 0.7058824, 1,
-0.1544154, 1.693354, -1.704113, 0, 1, 0.7137255, 1,
-0.1514065, 0.8879932, -0.1141056, 0, 1, 0.7176471, 1,
-0.150696, -0.8042074, -2.074088, 0, 1, 0.7254902, 1,
-0.1489474, -0.5616581, -2.129214, 0, 1, 0.7294118, 1,
-0.1462785, -0.04093599, -1.272807, 0, 1, 0.7372549, 1,
-0.144018, -0.8698533, -2.725083, 0, 1, 0.7411765, 1,
-0.1433329, 1.137693, -1.682054, 0, 1, 0.7490196, 1,
-0.1417192, -1.474584, -4.420996, 0, 1, 0.7529412, 1,
-0.1346762, -0.01839433, -1.355622, 0, 1, 0.7607843, 1,
-0.1320398, -1.233924, -1.695494, 0, 1, 0.7647059, 1,
-0.1241706, 1.93241, 0.5702664, 0, 1, 0.772549, 1,
-0.1214528, -1.182189, -2.227925, 0, 1, 0.7764706, 1,
-0.1194689, -0.5922028, -3.374969, 0, 1, 0.7843137, 1,
-0.1182583, 1.175867, -1.838907, 0, 1, 0.7882353, 1,
-0.1180064, -1.099821, -2.861091, 0, 1, 0.7960784, 1,
-0.1160588, -0.3654018, -3.435699, 0, 1, 0.8039216, 1,
-0.1123737, -0.7502669, -3.197954, 0, 1, 0.8078431, 1,
-0.1108167, -0.5144841, -3.023785, 0, 1, 0.8156863, 1,
-0.1062294, 0.1750533, -0.4870375, 0, 1, 0.8196079, 1,
-0.1034167, 0.2675297, -0.1473253, 0, 1, 0.827451, 1,
-0.1020467, -1.153408, -2.08967, 0, 1, 0.8313726, 1,
-0.09667622, 0.9362944, -0.8486541, 0, 1, 0.8392157, 1,
-0.0853066, 0.6694689, -0.03418817, 0, 1, 0.8431373, 1,
-0.08321321, 0.7405231, 1.300152, 0, 1, 0.8509804, 1,
-0.08207767, 0.4986425, 1.321305, 0, 1, 0.854902, 1,
-0.07664444, -0.8356276, -3.939603, 0, 1, 0.8627451, 1,
-0.07081254, 1.694685, -0.3935614, 0, 1, 0.8666667, 1,
-0.06998841, 0.7675956, -0.1121475, 0, 1, 0.8745098, 1,
-0.06920496, -1.621568, -2.06365, 0, 1, 0.8784314, 1,
-0.06901418, 0.6972742, 0.4670699, 0, 1, 0.8862745, 1,
-0.06035223, 0.3759563, 2.343102, 0, 1, 0.8901961, 1,
-0.05619135, -0.9481781, -3.990502, 0, 1, 0.8980392, 1,
-0.05607802, -0.4279154, -2.696489, 0, 1, 0.9058824, 1,
-0.04902345, -0.0006822011, -0.7858787, 0, 1, 0.9098039, 1,
-0.0470712, -1.656971, -4.454183, 0, 1, 0.9176471, 1,
-0.04549217, -1.181764, -4.544628, 0, 1, 0.9215686, 1,
-0.03490117, 1.398091, 0.620629, 0, 1, 0.9294118, 1,
-0.03406714, 1.993634, -1.056668, 0, 1, 0.9333333, 1,
-0.03149378, -0.485802, -1.420828, 0, 1, 0.9411765, 1,
-0.03082228, 0.7550268, -0.8675729, 0, 1, 0.945098, 1,
-0.02712509, -1.551098, -2.205806, 0, 1, 0.9529412, 1,
-0.02525742, -2.117901, -3.110683, 0, 1, 0.9568627, 1,
-0.02241713, 0.1681911, 2.421792, 0, 1, 0.9647059, 1,
-0.02204214, -1.011462, -2.930509, 0, 1, 0.9686275, 1,
-0.02100322, 0.2596568, 0.5195413, 0, 1, 0.9764706, 1,
-0.01918797, -0.4871183, -3.667297, 0, 1, 0.9803922, 1,
-0.0178199, 0.6379414, -0.2542388, 0, 1, 0.9882353, 1,
-0.01064541, -0.3185388, -3.374958, 0, 1, 0.9921569, 1,
-0.009777932, -1.24619, -1.954572, 0, 1, 1, 1,
-0.008658787, -1.25403, -3.973404, 0, 0.9921569, 1, 1,
-0.005318141, -1.3653, -3.552899, 0, 0.9882353, 1, 1,
-0.001275917, -1.821978, -2.856962, 0, 0.9803922, 1, 1,
0.004021439, -0.07384577, 2.344161, 0, 0.9764706, 1, 1,
0.004909134, 0.186583, -0.6451284, 0, 0.9686275, 1, 1,
0.01166768, -0.5182728, 3.411681, 0, 0.9647059, 1, 1,
0.01303404, -0.6519164, 4.121332, 0, 0.9568627, 1, 1,
0.01492543, -1.066906, 2.667242, 0, 0.9529412, 1, 1,
0.01744265, 0.482004, 2.088091, 0, 0.945098, 1, 1,
0.01761957, -0.8011918, 3.671871, 0, 0.9411765, 1, 1,
0.01860653, -1.399547, 3.80374, 0, 0.9333333, 1, 1,
0.02103492, -1.46696, 1.785562, 0, 0.9294118, 1, 1,
0.02118939, -0.8832277, 3.579418, 0, 0.9215686, 1, 1,
0.02289322, -0.335178, 4.271009, 0, 0.9176471, 1, 1,
0.02303522, -0.139527, 3.974799, 0, 0.9098039, 1, 1,
0.02398911, 0.1653058, -0.5878426, 0, 0.9058824, 1, 1,
0.02673178, 0.8235171, 0.3690628, 0, 0.8980392, 1, 1,
0.02688385, -0.2754228, 3.255048, 0, 0.8901961, 1, 1,
0.02724816, -0.1163592, 2.735889, 0, 0.8862745, 1, 1,
0.02945449, -0.3075311, 3.178147, 0, 0.8784314, 1, 1,
0.03529257, 2.256933, 0.5507525, 0, 0.8745098, 1, 1,
0.04134088, 0.2754264, 2.06763, 0, 0.8666667, 1, 1,
0.0437048, -3.180579, 2.738281, 0, 0.8627451, 1, 1,
0.04516781, -0.4009019, 3.286908, 0, 0.854902, 1, 1,
0.05017911, -0.03077354, 3.499979, 0, 0.8509804, 1, 1,
0.05661881, -0.5421988, 1.752134, 0, 0.8431373, 1, 1,
0.05996999, 2.045158, -0.9529141, 0, 0.8392157, 1, 1,
0.06240857, -1.002054, 1.940022, 0, 0.8313726, 1, 1,
0.06706446, 1.118231, 0.4435056, 0, 0.827451, 1, 1,
0.07110533, 0.2406243, 0.7566714, 0, 0.8196079, 1, 1,
0.076988, 0.6348803, 0.427388, 0, 0.8156863, 1, 1,
0.07817025, -0.1000759, 2.94562, 0, 0.8078431, 1, 1,
0.07956102, 1.559551, 1.339504, 0, 0.8039216, 1, 1,
0.0810329, -1.090553, 1.433127, 0, 0.7960784, 1, 1,
0.08212943, 0.1344973, 0.7586761, 0, 0.7882353, 1, 1,
0.08340957, 0.1140819, 2.265909, 0, 0.7843137, 1, 1,
0.08348847, 1.651833, 0.2677951, 0, 0.7764706, 1, 1,
0.08374345, 0.6501221, 1.186773, 0, 0.772549, 1, 1,
0.08603553, -1.077564, 3.878226, 0, 0.7647059, 1, 1,
0.09511039, -0.8466043, 1.588624, 0, 0.7607843, 1, 1,
0.09544764, 0.9473569, -0.1768213, 0, 0.7529412, 1, 1,
0.09626096, 0.3521857, 0.2151615, 0, 0.7490196, 1, 1,
0.09731632, 1.477955, 1.026045, 0, 0.7411765, 1, 1,
0.09825273, -0.1376373, 3.252484, 0, 0.7372549, 1, 1,
0.1055913, -0.1947437, 1.729642, 0, 0.7294118, 1, 1,
0.106511, -0.8819953, 1.543247, 0, 0.7254902, 1, 1,
0.1074251, -0.1647253, 3.958056, 0, 0.7176471, 1, 1,
0.1117219, 0.8208421, 0.5371652, 0, 0.7137255, 1, 1,
0.1120855, -0.008317734, 2.128247, 0, 0.7058824, 1, 1,
0.1158383, -0.1655151, 0.5751151, 0, 0.6980392, 1, 1,
0.1163338, -1.80561, 4.727086, 0, 0.6941177, 1, 1,
0.1166821, 1.400233, -0.3193054, 0, 0.6862745, 1, 1,
0.1189403, 1.133589, -0.04117221, 0, 0.682353, 1, 1,
0.1195677, -1.784418, 3.158057, 0, 0.6745098, 1, 1,
0.12124, 0.9653967, 1.959587, 0, 0.6705883, 1, 1,
0.1246617, 0.142982, 0.6634169, 0, 0.6627451, 1, 1,
0.1249401, 0.3380428, 0.9992437, 0, 0.6588235, 1, 1,
0.1258164, 1.415873, 1.465852, 0, 0.6509804, 1, 1,
0.1261342, -0.9453067, 3.047619, 0, 0.6470588, 1, 1,
0.126327, 1.712878, 2.026639, 0, 0.6392157, 1, 1,
0.12633, 0.286588, 0.2556385, 0, 0.6352941, 1, 1,
0.1401679, -0.6650066, 3.245714, 0, 0.627451, 1, 1,
0.1416838, 0.3295214, -1.186272, 0, 0.6235294, 1, 1,
0.1477466, -0.08879302, 3.131904, 0, 0.6156863, 1, 1,
0.1485719, -0.1924672, 1.524236, 0, 0.6117647, 1, 1,
0.152144, 0.6917914, 0.164958, 0, 0.6039216, 1, 1,
0.1522042, 1.020641, -1.40885, 0, 0.5960785, 1, 1,
0.1544935, -0.9221399, 2.948303, 0, 0.5921569, 1, 1,
0.1561475, -1.373187, 4.616971, 0, 0.5843138, 1, 1,
0.1570784, 0.1293403, 1.580994, 0, 0.5803922, 1, 1,
0.1581673, 1.399476, 0.3230208, 0, 0.572549, 1, 1,
0.1585643, 0.879051, 0.4390954, 0, 0.5686275, 1, 1,
0.1586242, 0.5520022, -1.230938, 0, 0.5607843, 1, 1,
0.1593976, 1.484819, 0.9497833, 0, 0.5568628, 1, 1,
0.1654604, 0.03307174, 1.77111, 0, 0.5490196, 1, 1,
0.167788, -0.8286774, 2.75897, 0, 0.5450981, 1, 1,
0.1683202, -0.3256252, 3.605272, 0, 0.5372549, 1, 1,
0.169331, -0.3624354, 3.024366, 0, 0.5333334, 1, 1,
0.1726206, -0.05219732, 1.384367, 0, 0.5254902, 1, 1,
0.1756566, 0.7223628, -1.214117, 0, 0.5215687, 1, 1,
0.1758968, 1.380584, 0.5692794, 0, 0.5137255, 1, 1,
0.1758992, -1.860051, 3.233077, 0, 0.509804, 1, 1,
0.1760661, -0.2379774, 3.962773, 0, 0.5019608, 1, 1,
0.1777114, -1.061386, 3.511261, 0, 0.4941176, 1, 1,
0.1783863, -1.033471, 1.9311, 0, 0.4901961, 1, 1,
0.1841231, 0.1359048, 2.580324, 0, 0.4823529, 1, 1,
0.1915492, -0.2080495, 2.182708, 0, 0.4784314, 1, 1,
0.1919324, -1.327973, 3.653805, 0, 0.4705882, 1, 1,
0.1920011, 0.5294536, -0.06678316, 0, 0.4666667, 1, 1,
0.1929761, -0.4450711, 2.45493, 0, 0.4588235, 1, 1,
0.194906, -0.5769246, 2.587024, 0, 0.454902, 1, 1,
0.1951717, 0.0484291, 1.570745, 0, 0.4470588, 1, 1,
0.2018897, -0.7146389, 3.035098, 0, 0.4431373, 1, 1,
0.2194023, -0.9502377, 4.617029, 0, 0.4352941, 1, 1,
0.2301411, -0.7296774, 3.429482, 0, 0.4313726, 1, 1,
0.2308664, -0.2195579, 1.83076, 0, 0.4235294, 1, 1,
0.2369355, 0.9321862, 0.8204915, 0, 0.4196078, 1, 1,
0.2390443, -3.029727, 1.743318, 0, 0.4117647, 1, 1,
0.2392917, -1.11929, 4.279138, 0, 0.4078431, 1, 1,
0.2401027, 1.054347, 0.1462924, 0, 0.4, 1, 1,
0.2435812, 0.9817749, -0.4841677, 0, 0.3921569, 1, 1,
0.2493379, -0.4992567, 4.99296, 0, 0.3882353, 1, 1,
0.2494652, 0.8632003, 1.104411, 0, 0.3803922, 1, 1,
0.2524831, -0.1302287, 1.911892, 0, 0.3764706, 1, 1,
0.2551275, 0.2705839, 0.320733, 0, 0.3686275, 1, 1,
0.2553259, -1.293654, 3.504516, 0, 0.3647059, 1, 1,
0.2583736, 1.099618, -0.5066354, 0, 0.3568628, 1, 1,
0.2680171, 0.8746827, 2.380946, 0, 0.3529412, 1, 1,
0.2726993, 1.158092, 0.7007434, 0, 0.345098, 1, 1,
0.2733493, -0.1123293, 3.036325, 0, 0.3411765, 1, 1,
0.2789027, 0.2956625, 0.8248519, 0, 0.3333333, 1, 1,
0.2805241, 1.295807, 0.8274878, 0, 0.3294118, 1, 1,
0.2834859, -1.393668, 4.05326, 0, 0.3215686, 1, 1,
0.2878361, 0.368722, 0.7695833, 0, 0.3176471, 1, 1,
0.2911918, 0.003060518, 2.029265, 0, 0.3098039, 1, 1,
0.2960878, 0.3836655, 2.2828, 0, 0.3058824, 1, 1,
0.2962773, 1.552788, 1.247171, 0, 0.2980392, 1, 1,
0.2973344, 0.5759867, 0.3740606, 0, 0.2901961, 1, 1,
0.2986971, -2.038263, 1.462624, 0, 0.2862745, 1, 1,
0.3020782, -0.5328024, 4.085188, 0, 0.2784314, 1, 1,
0.3025925, -0.2157149, 1.352076, 0, 0.2745098, 1, 1,
0.3047937, -1.866078, 3.149889, 0, 0.2666667, 1, 1,
0.3067074, 1.118322, -0.2842665, 0, 0.2627451, 1, 1,
0.3070681, -0.4294891, 3.815361, 0, 0.254902, 1, 1,
0.3076505, -1.029497, 3.89743, 0, 0.2509804, 1, 1,
0.3122386, 1.184023, 0.02457341, 0, 0.2431373, 1, 1,
0.3131239, -1.517991, 4.511735, 0, 0.2392157, 1, 1,
0.315735, 0.6201444, 0.8195893, 0, 0.2313726, 1, 1,
0.3158066, 0.528409, 1.37148, 0, 0.227451, 1, 1,
0.3159219, 1.205168, 1.157515, 0, 0.2196078, 1, 1,
0.3238826, -1.170468, 0.9998228, 0, 0.2156863, 1, 1,
0.327731, 0.2006174, -1.471543, 0, 0.2078431, 1, 1,
0.3283189, 1.114884, 1.026669, 0, 0.2039216, 1, 1,
0.3286809, 0.3347752, -0.8796886, 0, 0.1960784, 1, 1,
0.3309346, -0.5403813, 3.081494, 0, 0.1882353, 1, 1,
0.3472842, -0.6442091, 2.773803, 0, 0.1843137, 1, 1,
0.3489602, -0.4208777, 2.408122, 0, 0.1764706, 1, 1,
0.3502217, 1.040633, 0.67513, 0, 0.172549, 1, 1,
0.3507942, 0.7126703, 1.431532, 0, 0.1647059, 1, 1,
0.3545777, 0.3756654, -1.090301, 0, 0.1607843, 1, 1,
0.3570801, 0.3220484, 0.576742, 0, 0.1529412, 1, 1,
0.3577276, -0.9997005, 2.600854, 0, 0.1490196, 1, 1,
0.3601792, -0.5138225, 1.064734, 0, 0.1411765, 1, 1,
0.3611694, 1.580972, -0.5110216, 0, 0.1372549, 1, 1,
0.3636402, 1.346801, -0.1875488, 0, 0.1294118, 1, 1,
0.3653416, -0.1857041, 0.1106839, 0, 0.1254902, 1, 1,
0.3704208, 0.4343558, -0.1124147, 0, 0.1176471, 1, 1,
0.3720711, 0.8889127, 0.8406007, 0, 0.1137255, 1, 1,
0.3727871, -1.396932, 3.447436, 0, 0.1058824, 1, 1,
0.3748148, 0.4856073, 0.4196217, 0, 0.09803922, 1, 1,
0.3755245, 0.5833507, 2.373949, 0, 0.09411765, 1, 1,
0.3756328, -0.5370916, 1.132267, 0, 0.08627451, 1, 1,
0.3764815, 1.074187, -0.003969437, 0, 0.08235294, 1, 1,
0.3768672, -0.3256091, 1.969698, 0, 0.07450981, 1, 1,
0.3798169, -0.3581533, 2.628768, 0, 0.07058824, 1, 1,
0.3865163, -0.05270308, 1.283406, 0, 0.0627451, 1, 1,
0.3869839, 0.9892671, -1.341138, 0, 0.05882353, 1, 1,
0.3873683, -1.842681, 4.175705, 0, 0.05098039, 1, 1,
0.3877591, 0.07909106, 1.208077, 0, 0.04705882, 1, 1,
0.390574, -0.7691544, 3.88107, 0, 0.03921569, 1, 1,
0.3911745, 1.113188, 0.2658248, 0, 0.03529412, 1, 1,
0.3938222, 0.6715025, 1.044823, 0, 0.02745098, 1, 1,
0.3965879, -0.3454924, 3.353714, 0, 0.02352941, 1, 1,
0.3966407, -1.183281, 4.231828, 0, 0.01568628, 1, 1,
0.3980045, 0.05675818, 2.928868, 0, 0.01176471, 1, 1,
0.398582, 1.07669, 1.778936, 0, 0.003921569, 1, 1,
0.4008395, -0.7649803, 3.228452, 0.003921569, 0, 1, 1,
0.4033402, -0.09525482, 2.353712, 0.007843138, 0, 1, 1,
0.4075225, 0.7366492, 0.719385, 0.01568628, 0, 1, 1,
0.4084517, 0.1959372, 2.354445, 0.01960784, 0, 1, 1,
0.410113, 0.229841, 0.7541146, 0.02745098, 0, 1, 1,
0.4104688, 1.293762, -0.7140452, 0.03137255, 0, 1, 1,
0.4122798, 0.4293895, 1.80055, 0.03921569, 0, 1, 1,
0.4136676, -1.22987, 1.904464, 0.04313726, 0, 1, 1,
0.4183446, -0.6967036, 2.999628, 0.05098039, 0, 1, 1,
0.4196155, -1.584866, 4.344396, 0.05490196, 0, 1, 1,
0.4219592, 1.208044, -0.01930039, 0.0627451, 0, 1, 1,
0.4226911, 0.4018271, -0.9089153, 0.06666667, 0, 1, 1,
0.4295237, 1.958709, 1.459849, 0.07450981, 0, 1, 1,
0.4305868, 3.070497, -1.414301, 0.07843138, 0, 1, 1,
0.4312334, -0.9096219, 2.672411, 0.08627451, 0, 1, 1,
0.4319557, 1.188382, -0.2338365, 0.09019608, 0, 1, 1,
0.4360436, 0.554003, 0.713312, 0.09803922, 0, 1, 1,
0.4374622, -0.8421454, 1.684565, 0.1058824, 0, 1, 1,
0.4382195, -1.270101, 2.981624, 0.1098039, 0, 1, 1,
0.4407569, 0.1131762, 1.393758, 0.1176471, 0, 1, 1,
0.4446419, 1.47862, 0.7413045, 0.1215686, 0, 1, 1,
0.4499793, 0.264946, 1.512195, 0.1294118, 0, 1, 1,
0.4531027, 0.7548578, 0.7826061, 0.1333333, 0, 1, 1,
0.4531796, 0.2879933, 1.798506, 0.1411765, 0, 1, 1,
0.4535792, -0.2966405, 3.694925, 0.145098, 0, 1, 1,
0.4540546, 0.3421982, 0.6755548, 0.1529412, 0, 1, 1,
0.4557752, 1.33865, 0.3857511, 0.1568628, 0, 1, 1,
0.4559063, 0.1606369, 0.3866765, 0.1647059, 0, 1, 1,
0.4626854, 0.8450022, -1.859959, 0.1686275, 0, 1, 1,
0.4746846, -0.1034459, 2.413596, 0.1764706, 0, 1, 1,
0.488162, 0.5532405, -2.386737, 0.1803922, 0, 1, 1,
0.489138, 0.6114227, 1.161545, 0.1882353, 0, 1, 1,
0.492669, 1.551523, -0.02759708, 0.1921569, 0, 1, 1,
0.4950134, -0.2254916, 0.8928293, 0.2, 0, 1, 1,
0.4952632, 1.079839, 4.536367, 0.2078431, 0, 1, 1,
0.497667, 1.36433, 0.2247615, 0.2117647, 0, 1, 1,
0.518707, 0.7487767, -0.0990836, 0.2196078, 0, 1, 1,
0.5195277, 0.954533, 1.719053, 0.2235294, 0, 1, 1,
0.5201147, 1.046399, 0.2676487, 0.2313726, 0, 1, 1,
0.5225347, -0.2116201, 2.226158, 0.2352941, 0, 1, 1,
0.5237137, 0.8326313, 0.5052488, 0.2431373, 0, 1, 1,
0.5241789, -1.107827, 2.657844, 0.2470588, 0, 1, 1,
0.5288717, -0.4034064, 1.524521, 0.254902, 0, 1, 1,
0.5472832, 0.05797433, 0.3774495, 0.2588235, 0, 1, 1,
0.5481755, -0.4568341, 2.002226, 0.2666667, 0, 1, 1,
0.5495906, 0.8130001, 0.514893, 0.2705882, 0, 1, 1,
0.5504412, 1.894769, -0.5922393, 0.2784314, 0, 1, 1,
0.5532097, -1.028403, 2.609912, 0.282353, 0, 1, 1,
0.5562332, 0.4099999, 2.673668, 0.2901961, 0, 1, 1,
0.5576555, -0.5309111, 2.75786, 0.2941177, 0, 1, 1,
0.5579376, -0.7244998, 1.932556, 0.3019608, 0, 1, 1,
0.5580769, 0.1474979, 0.7486066, 0.3098039, 0, 1, 1,
0.5597384, -0.1023793, -0.3950559, 0.3137255, 0, 1, 1,
0.5636055, 0.8043857, 1.529833, 0.3215686, 0, 1, 1,
0.5648789, -0.1167008, 0.4535815, 0.3254902, 0, 1, 1,
0.5675566, 1.107531, 0.2035861, 0.3333333, 0, 1, 1,
0.5677573, -0.7186537, 2.764603, 0.3372549, 0, 1, 1,
0.568389, 0.2188678, 2.236536, 0.345098, 0, 1, 1,
0.5714632, -0.09272296, 2.599877, 0.3490196, 0, 1, 1,
0.5815251, 1.046324, 0.5685265, 0.3568628, 0, 1, 1,
0.5828344, 1.305702, 0.2854514, 0.3607843, 0, 1, 1,
0.5855703, -1.545007, 2.599132, 0.3686275, 0, 1, 1,
0.588352, 1.216305, 0.9785866, 0.372549, 0, 1, 1,
0.5917724, -0.5893159, 2.814942, 0.3803922, 0, 1, 1,
0.5938749, -0.226899, 2.40764, 0.3843137, 0, 1, 1,
0.5988345, -1.250632, 3.408082, 0.3921569, 0, 1, 1,
0.6028997, -1.845576, 3.309411, 0.3960784, 0, 1, 1,
0.6053551, 1.243016, 0.3152652, 0.4039216, 0, 1, 1,
0.6062486, 0.8772177, 1.516971, 0.4117647, 0, 1, 1,
0.6076819, 0.9066465, -0.9258336, 0.4156863, 0, 1, 1,
0.6106254, -1.235322, 1.713975, 0.4235294, 0, 1, 1,
0.6123411, -1.468176, 1.220497, 0.427451, 0, 1, 1,
0.6147184, 1.772445, 1.751761, 0.4352941, 0, 1, 1,
0.6175613, 0.4736803, 1.211604, 0.4392157, 0, 1, 1,
0.6197009, -0.3850004, 0.89467, 0.4470588, 0, 1, 1,
0.6207431, 0.0296336, 1.709593, 0.4509804, 0, 1, 1,
0.6212034, -1.33621, 0.7015772, 0.4588235, 0, 1, 1,
0.6247413, -1.564172, 2.527814, 0.4627451, 0, 1, 1,
0.6254883, -0.6709167, 4.633707, 0.4705882, 0, 1, 1,
0.6268416, -0.355448, 3.439048, 0.4745098, 0, 1, 1,
0.626958, 0.4656437, 1.875062, 0.4823529, 0, 1, 1,
0.6293544, 0.03761676, 1.0207, 0.4862745, 0, 1, 1,
0.633586, -0.4429525, 1.688959, 0.4941176, 0, 1, 1,
0.6339967, 1.064157, -0.1719957, 0.5019608, 0, 1, 1,
0.6372378, -0.09238605, 0.4833245, 0.5058824, 0, 1, 1,
0.637319, -0.7683978, 3.845055, 0.5137255, 0, 1, 1,
0.6384988, 1.602275, -0.2752254, 0.5176471, 0, 1, 1,
0.644409, 0.7393134, -0.1989087, 0.5254902, 0, 1, 1,
0.645251, 0.518243, -0.03799699, 0.5294118, 0, 1, 1,
0.6453281, 0.3854291, 2.457861, 0.5372549, 0, 1, 1,
0.6462218, -1.456065, 3.837036, 0.5411765, 0, 1, 1,
0.647885, 0.399119, 1.514778, 0.5490196, 0, 1, 1,
0.648254, 0.7671478, -0.1724837, 0.5529412, 0, 1, 1,
0.6572594, 1.08238, 1.452853, 0.5607843, 0, 1, 1,
0.6597032, -0.833089, 2.988726, 0.5647059, 0, 1, 1,
0.6612156, 2.338504, -0.7434253, 0.572549, 0, 1, 1,
0.6620467, 2.8332, -0.1601089, 0.5764706, 0, 1, 1,
0.6662871, -0.2238723, 2.917002, 0.5843138, 0, 1, 1,
0.6695585, -0.2838832, 3.137353, 0.5882353, 0, 1, 1,
0.6711381, -1.663941, 0.9437122, 0.5960785, 0, 1, 1,
0.6744357, 0.2179134, 1.382877, 0.6039216, 0, 1, 1,
0.6777626, -0.569117, 1.461284, 0.6078432, 0, 1, 1,
0.679992, 0.5171397, 0.6114069, 0.6156863, 0, 1, 1,
0.6813171, 2.010948, -0.5290729, 0.6196079, 0, 1, 1,
0.681991, 1.391717, -0.213658, 0.627451, 0, 1, 1,
0.6844419, -0.3958132, 1.978222, 0.6313726, 0, 1, 1,
0.6910711, -1.707689, 2.988538, 0.6392157, 0, 1, 1,
0.6916016, 1.292132, 0.5886401, 0.6431373, 0, 1, 1,
0.6924428, -0.2920049, 2.362765, 0.6509804, 0, 1, 1,
0.6955627, 0.2746956, -0.03237367, 0.654902, 0, 1, 1,
0.7006693, -0.2761559, 2.293926, 0.6627451, 0, 1, 1,
0.7022656, 0.3943848, 3.152785, 0.6666667, 0, 1, 1,
0.703711, -0.3323938, 3.377576, 0.6745098, 0, 1, 1,
0.7048829, -1.089271, 4.165484, 0.6784314, 0, 1, 1,
0.7067121, 0.3521589, 1.2952, 0.6862745, 0, 1, 1,
0.7151474, -0.5640834, 1.871206, 0.6901961, 0, 1, 1,
0.7191246, -1.013407, 3.32513, 0.6980392, 0, 1, 1,
0.7211587, -1.013412, 4.349796, 0.7058824, 0, 1, 1,
0.7257121, -0.1424892, 0.06262245, 0.7098039, 0, 1, 1,
0.7312393, -0.3064947, 3.631653, 0.7176471, 0, 1, 1,
0.7323832, -1.146449, 2.08266, 0.7215686, 0, 1, 1,
0.7348669, -0.01754557, 3.40615, 0.7294118, 0, 1, 1,
0.7354193, -0.7370615, 1.382904, 0.7333333, 0, 1, 1,
0.7365894, 0.1709676, 1.002666, 0.7411765, 0, 1, 1,
0.7377374, -1.729321, 2.483396, 0.7450981, 0, 1, 1,
0.7380592, 1.37796, 0.4247301, 0.7529412, 0, 1, 1,
0.7450711, -0.2274015, 3.205812, 0.7568628, 0, 1, 1,
0.7564541, 1.091992, 1.016497, 0.7647059, 0, 1, 1,
0.7576925, 0.3284267, 0.1812618, 0.7686275, 0, 1, 1,
0.759961, 0.962482, 1.992913, 0.7764706, 0, 1, 1,
0.7626205, -0.8589259, 4.171574, 0.7803922, 0, 1, 1,
0.7627677, 0.3736425, 2.41944, 0.7882353, 0, 1, 1,
0.7691063, -0.3485251, 3.261335, 0.7921569, 0, 1, 1,
0.7706472, -0.2969751, 2.929616, 0.8, 0, 1, 1,
0.7734714, 0.4310936, 0.6877947, 0.8078431, 0, 1, 1,
0.7771158, -0.2525383, 1.17126, 0.8117647, 0, 1, 1,
0.77971, 0.07850882, 1.276858, 0.8196079, 0, 1, 1,
0.7797152, -2.129194, 2.712619, 0.8235294, 0, 1, 1,
0.782647, -0.4028715, 3.375756, 0.8313726, 0, 1, 1,
0.7833595, 0.7979452, -0.965396, 0.8352941, 0, 1, 1,
0.7889289, 1.033749, 0.7667497, 0.8431373, 0, 1, 1,
0.7962993, -0.1431104, 2.108488, 0.8470588, 0, 1, 1,
0.8197071, -0.06171217, 2.731487, 0.854902, 0, 1, 1,
0.8226621, 0.01039532, 3.165289, 0.8588235, 0, 1, 1,
0.8239987, 0.02348572, 1.317552, 0.8666667, 0, 1, 1,
0.8243818, 0.01853734, 2.311808, 0.8705882, 0, 1, 1,
0.8244296, -2.153843, 3.511774, 0.8784314, 0, 1, 1,
0.8249844, -0.2113187, 3.730405, 0.8823529, 0, 1, 1,
0.8250564, 0.07948964, -0.5017724, 0.8901961, 0, 1, 1,
0.8328661, -0.7045954, 1.058515, 0.8941177, 0, 1, 1,
0.8385066, -1.013799, 2.196394, 0.9019608, 0, 1, 1,
0.841769, -0.3763799, 0.2434092, 0.9098039, 0, 1, 1,
0.8457134, -0.7413836, 3.415601, 0.9137255, 0, 1, 1,
0.8492122, 0.5261626, 0.244855, 0.9215686, 0, 1, 1,
0.8531889, -1.411491, 2.859984, 0.9254902, 0, 1, 1,
0.8732963, 0.3948065, 1.420309, 0.9333333, 0, 1, 1,
0.8737795, -1.157299, 2.431559, 0.9372549, 0, 1, 1,
0.8795543, 1.380059, 1.49622, 0.945098, 0, 1, 1,
0.8804083, 0.9558784, -0.4938482, 0.9490196, 0, 1, 1,
0.8881463, 0.4202078, 0.74663, 0.9568627, 0, 1, 1,
0.8888992, -0.08390163, 2.034807, 0.9607843, 0, 1, 1,
0.8897564, 2.465934, -0.1237574, 0.9686275, 0, 1, 1,
0.8987053, -1.158512, 1.31364, 0.972549, 0, 1, 1,
0.8998322, 0.3830555, 2.51985, 0.9803922, 0, 1, 1,
0.9156653, -0.1599434, 2.806564, 0.9843137, 0, 1, 1,
0.9270287, -0.3524887, 2.452231, 0.9921569, 0, 1, 1,
0.9277904, 1.648178, 1.192963, 0.9960784, 0, 1, 1,
0.9314603, 0.3363334, 3.07277, 1, 0, 0.9960784, 1,
0.9371802, -0.1930328, 1.430191, 1, 0, 0.9882353, 1,
0.9474446, 0.3688036, 0.9379586, 1, 0, 0.9843137, 1,
0.9516913, -0.8652697, 2.327475, 1, 0, 0.9764706, 1,
0.9551669, -0.6285, 2.398525, 1, 0, 0.972549, 1,
0.9609063, -0.520919, 2.065646, 1, 0, 0.9647059, 1,
0.9622467, -0.2155311, 2.275939, 1, 0, 0.9607843, 1,
0.965396, 1.173834, 1.287456, 1, 0, 0.9529412, 1,
0.9660612, -0.8669247, 2.948838, 1, 0, 0.9490196, 1,
0.9684111, 0.5623405, 2.662239, 1, 0, 0.9411765, 1,
0.9717143, -1.494135, 1.113558, 1, 0, 0.9372549, 1,
0.9777445, -0.3943474, 0.09664576, 1, 0, 0.9294118, 1,
0.9824609, 0.5227776, -0.2958732, 1, 0, 0.9254902, 1,
0.9825986, -1.02428, 1.394296, 1, 0, 0.9176471, 1,
0.9857744, -1.814404, 1.783595, 1, 0, 0.9137255, 1,
0.9864498, -0.9404091, 2.007001, 1, 0, 0.9058824, 1,
0.9943252, 0.01416436, -0.6994035, 1, 0, 0.9019608, 1,
0.9967675, -1.431652, 2.175497, 1, 0, 0.8941177, 1,
1.019403, -0.8335539, 2.493024, 1, 0, 0.8862745, 1,
1.019934, 0.07022513, 2.070115, 1, 0, 0.8823529, 1,
1.023193, -0.7720706, 1.691319, 1, 0, 0.8745098, 1,
1.028917, -0.7815989, 3.619358, 1, 0, 0.8705882, 1,
1.030222, -0.9637403, 2.924584, 1, 0, 0.8627451, 1,
1.03279, -0.4655932, 2.955037, 1, 0, 0.8588235, 1,
1.039764, -0.5825912, 1.331955, 1, 0, 0.8509804, 1,
1.044432, -0.2273674, 2.246771, 1, 0, 0.8470588, 1,
1.049007, -0.414591, 1.664329, 1, 0, 0.8392157, 1,
1.05641, -1.355601, 3.460113, 1, 0, 0.8352941, 1,
1.061224, -0.4401415, 3.717994, 1, 0, 0.827451, 1,
1.066575, 0.351182, 2.841806, 1, 0, 0.8235294, 1,
1.074568, -2.048239, 1.064697, 1, 0, 0.8156863, 1,
1.078862, -0.7002683, 2.484718, 1, 0, 0.8117647, 1,
1.083241, 0.9211316, 1.500909, 1, 0, 0.8039216, 1,
1.098442, -1.654423, 1.039177, 1, 0, 0.7960784, 1,
1.099245, -2.003514, 2.760682, 1, 0, 0.7921569, 1,
1.102619, 0.5756963, 2.960041, 1, 0, 0.7843137, 1,
1.110396, 0.1376863, 2.385018, 1, 0, 0.7803922, 1,
1.111191, 0.9026962, 0.726487, 1, 0, 0.772549, 1,
1.114029, 0.9393888, 0.4075812, 1, 0, 0.7686275, 1,
1.120401, 1.986761, 1.022803, 1, 0, 0.7607843, 1,
1.125018, -1.11908, 3.193241, 1, 0, 0.7568628, 1,
1.125023, -2.426754, 3.619136, 1, 0, 0.7490196, 1,
1.125231, -0.05793474, 1.384407, 1, 0, 0.7450981, 1,
1.127037, -0.7395812, 2.876331, 1, 0, 0.7372549, 1,
1.137861, 0.2149433, 1.308581, 1, 0, 0.7333333, 1,
1.144071, -0.7633814, 2.669313, 1, 0, 0.7254902, 1,
1.150217, -0.8403427, 3.163692, 1, 0, 0.7215686, 1,
1.157538, 0.2762524, 0.2052294, 1, 0, 0.7137255, 1,
1.164786, 1.948201, -0.1621148, 1, 0, 0.7098039, 1,
1.171287, 0.9649605, 0.8251963, 1, 0, 0.7019608, 1,
1.174332, 0.09426457, 1.557578, 1, 0, 0.6941177, 1,
1.182742, -0.5980202, 2.863875, 1, 0, 0.6901961, 1,
1.198895, 0.2900324, 1.978877, 1, 0, 0.682353, 1,
1.211482, 0.1071393, -0.6415484, 1, 0, 0.6784314, 1,
1.214652, -1.599617, 0.9777518, 1, 0, 0.6705883, 1,
1.220425, 0.4848806, 2.654372, 1, 0, 0.6666667, 1,
1.230027, 0.7840517, 1.884943, 1, 0, 0.6588235, 1,
1.248836, -0.6684103, 3.091977, 1, 0, 0.654902, 1,
1.251247, -0.8516037, 2.546419, 1, 0, 0.6470588, 1,
1.271524, -0.02934385, 2.382237, 1, 0, 0.6431373, 1,
1.283131, 0.8418852, 1.19716, 1, 0, 0.6352941, 1,
1.283822, -0.07715555, -0.8404991, 1, 0, 0.6313726, 1,
1.288449, -0.4765974, 2.287842, 1, 0, 0.6235294, 1,
1.289803, 0.09704047, 1.833244, 1, 0, 0.6196079, 1,
1.299873, 1.158568, 0.004796464, 1, 0, 0.6117647, 1,
1.302186, 1.268316, 1.657845, 1, 0, 0.6078432, 1,
1.302954, 0.5066491, -0.6788285, 1, 0, 0.6, 1,
1.304054, 1.304943, 1.867622, 1, 0, 0.5921569, 1,
1.308639, 1.070862, 0.2609805, 1, 0, 0.5882353, 1,
1.328403, -0.0422767, 1.981527, 1, 0, 0.5803922, 1,
1.335228, 0.002930101, 0.2120797, 1, 0, 0.5764706, 1,
1.337142, 0.2776494, 0.5541356, 1, 0, 0.5686275, 1,
1.343047, 0.9993086, 0.6993914, 1, 0, 0.5647059, 1,
1.352115, -0.6580783, 1.952377, 1, 0, 0.5568628, 1,
1.354789, 0.5799714, -0.3768007, 1, 0, 0.5529412, 1,
1.357335, -1.043463, 0.8490919, 1, 0, 0.5450981, 1,
1.372432, 1.419405, 1.67732, 1, 0, 0.5411765, 1,
1.372605, 0.1168161, 1.222923, 1, 0, 0.5333334, 1,
1.372632, -0.8612825, 3.371235, 1, 0, 0.5294118, 1,
1.378849, -0.05381805, 0.5935015, 1, 0, 0.5215687, 1,
1.391358, -0.2825058, 2.245614, 1, 0, 0.5176471, 1,
1.394519, 0.05910449, 1.017766, 1, 0, 0.509804, 1,
1.404083, 0.9908823, 2.250846, 1, 0, 0.5058824, 1,
1.425194, 0.07250611, 2.720096, 1, 0, 0.4980392, 1,
1.439295, -2.937047, 3.368319, 1, 0, 0.4901961, 1,
1.439694, -0.6741856, -0.1211214, 1, 0, 0.4862745, 1,
1.441015, -0.7646739, 2.848756, 1, 0, 0.4784314, 1,
1.457379, 1.738178, 1.56251, 1, 0, 0.4745098, 1,
1.461418, 0.8980302, 0.4063634, 1, 0, 0.4666667, 1,
1.463974, 2.705507, 1.347467, 1, 0, 0.4627451, 1,
1.469237, 2.591874, 1.127078, 1, 0, 0.454902, 1,
1.476214, 1.570629, -0.5728695, 1, 0, 0.4509804, 1,
1.477224, -1.523397, 1.704435, 1, 0, 0.4431373, 1,
1.479409, 0.4480498, 1.803871, 1, 0, 0.4392157, 1,
1.486242, 0.5274926, 1.448007, 1, 0, 0.4313726, 1,
1.501205, -1.085852, 4.360897, 1, 0, 0.427451, 1,
1.515604, 0.5883555, 2.040657, 1, 0, 0.4196078, 1,
1.519767, -0.5081646, 1.545189, 1, 0, 0.4156863, 1,
1.543072, 0.7392681, -0.6563607, 1, 0, 0.4078431, 1,
1.555966, -1.027259, 3.174632, 1, 0, 0.4039216, 1,
1.561103, -0.4767169, 1.029016, 1, 0, 0.3960784, 1,
1.576215, 0.4537601, 1.62717, 1, 0, 0.3882353, 1,
1.587387, 0.2885959, 1.828742, 1, 0, 0.3843137, 1,
1.601812, 1.368974, 1.509409, 1, 0, 0.3764706, 1,
1.604518, -0.2693889, 1.615267, 1, 0, 0.372549, 1,
1.6179, 0.557128, 2.870524, 1, 0, 0.3647059, 1,
1.626167, -0.3437228, 1.616586, 1, 0, 0.3607843, 1,
1.637494, 0.5924358, -0.0444863, 1, 0, 0.3529412, 1,
1.650662, 1.455792, -1.488519, 1, 0, 0.3490196, 1,
1.669449, -0.2565922, 3.134598, 1, 0, 0.3411765, 1,
1.68432, 0.3050954, 1.073716, 1, 0, 0.3372549, 1,
1.688145, -0.9668739, 2.284566, 1, 0, 0.3294118, 1,
1.694249, -1.427702, 0.7038146, 1, 0, 0.3254902, 1,
1.704342, 0.1208351, 1.641838, 1, 0, 0.3176471, 1,
1.712981, -1.31663, 3.523274, 1, 0, 0.3137255, 1,
1.713058, 0.9093416, 1.367183, 1, 0, 0.3058824, 1,
1.714267, 0.5620133, 0.9419776, 1, 0, 0.2980392, 1,
1.72652, -0.5450412, 1.904173, 1, 0, 0.2941177, 1,
1.734042, -0.3872282, 1.855799, 1, 0, 0.2862745, 1,
1.74028, -0.2663997, 1.471534, 1, 0, 0.282353, 1,
1.740702, 1.387681, 0.3980445, 1, 0, 0.2745098, 1,
1.74344, -0.4812159, 1.354463, 1, 0, 0.2705882, 1,
1.762263, -0.07729836, 0.3604088, 1, 0, 0.2627451, 1,
1.791338, -0.1236781, 0.855533, 1, 0, 0.2588235, 1,
1.794109, 0.8273852, 0.4599333, 1, 0, 0.2509804, 1,
1.799228, -1.033169, 1.005458, 1, 0, 0.2470588, 1,
1.805653, -0.5456881, 1.808696, 1, 0, 0.2392157, 1,
1.838213, 1.815078, 0.4641958, 1, 0, 0.2352941, 1,
1.844577, -2.386899, 1.987312, 1, 0, 0.227451, 1,
1.858999, -1.19003, 2.020238, 1, 0, 0.2235294, 1,
1.912879, 1.090637, 1.284374, 1, 0, 0.2156863, 1,
1.919727, 1.407428, 1.373435, 1, 0, 0.2117647, 1,
1.921033, -1.430803, 0.4510825, 1, 0, 0.2039216, 1,
1.938248, 1.201529, -0.1701397, 1, 0, 0.1960784, 1,
1.941675, 0.382196, 0.145035, 1, 0, 0.1921569, 1,
1.944443, -1.369117, 1.012102, 1, 0, 0.1843137, 1,
1.978499, 0.7396495, -1.439912, 1, 0, 0.1803922, 1,
1.993294, -0.6911138, 0.5663465, 1, 0, 0.172549, 1,
2.00115, 1.701303, -0.04398376, 1, 0, 0.1686275, 1,
2.004838, 1.196926, -0.3455713, 1, 0, 0.1607843, 1,
2.037998, 1.022561, 1.21563, 1, 0, 0.1568628, 1,
2.050771, -0.8783469, 2.185579, 1, 0, 0.1490196, 1,
2.065344, 0.3840176, 2.275716, 1, 0, 0.145098, 1,
2.10232, -0.6032274, 1.329489, 1, 0, 0.1372549, 1,
2.110224, 1.974129, 0.1239313, 1, 0, 0.1333333, 1,
2.116098, -0.7876791, 2.586655, 1, 0, 0.1254902, 1,
2.12786, -0.5371638, 1.736522, 1, 0, 0.1215686, 1,
2.131107, 0.4333892, 0.4775823, 1, 0, 0.1137255, 1,
2.135784, -0.1499925, 2.670074, 1, 0, 0.1098039, 1,
2.148479, -1.256935, 3.469195, 1, 0, 0.1019608, 1,
2.206724, -0.008579104, 1.219801, 1, 0, 0.09411765, 1,
2.322772, 1.244851, 2.286948, 1, 0, 0.09019608, 1,
2.335322, 0.09715595, 1.876843, 1, 0, 0.08235294, 1,
2.336652, 1.138359, 1.305634, 1, 0, 0.07843138, 1,
2.354073, -0.2460798, -0.1502894, 1, 0, 0.07058824, 1,
2.362561, -0.9017144, 0.6130641, 1, 0, 0.06666667, 1,
2.425425, -0.6875389, 4.045845, 1, 0, 0.05882353, 1,
2.439968, 0.1250052, 2.254183, 1, 0, 0.05490196, 1,
2.45834, 0.63825, 1.847184, 1, 0, 0.04705882, 1,
2.519998, 0.145489, 1.272917, 1, 0, 0.04313726, 1,
2.637802, -0.3589741, 2.800241, 1, 0, 0.03529412, 1,
2.723122, -1.833769, 3.10335, 1, 0, 0.03137255, 1,
2.834863, 0.3874963, -0.08151436, 1, 0, 0.02352941, 1,
2.85843, 0.1707247, 4.295103, 1, 0, 0.01960784, 1,
3.296301, 0.654906, -0.940201, 1, 0, 0.01176471, 1,
3.369938, 0.8014607, -0.9391429, 1, 0, 0.007843138, 1
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
-0.07765067, -4.246378, -6.964787, 0, -0.5, 0.5, 0.5,
-0.07765067, -4.246378, -6.964787, 1, -0.5, 0.5, 0.5,
-0.07765067, -4.246378, -6.964787, 1, 1.5, 0.5, 0.5,
-0.07765067, -4.246378, -6.964787, 0, 1.5, 0.5, 0.5
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
-4.693973, -0.03662717, -6.964787, 0, -0.5, 0.5, 0.5,
-4.693973, -0.03662717, -6.964787, 1, -0.5, 0.5, 0.5,
-4.693973, -0.03662717, -6.964787, 1, 1.5, 0.5, 0.5,
-4.693973, -0.03662717, -6.964787, 0, 1.5, 0.5, 0.5
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
-4.693973, -4.246378, -0.1193733, 0, -0.5, 0.5, 0.5,
-4.693973, -4.246378, -0.1193733, 1, -0.5, 0.5, 0.5,
-4.693973, -4.246378, -0.1193733, 1, 1.5, 0.5, 0.5,
-4.693973, -4.246378, -0.1193733, 0, 1.5, 0.5, 0.5
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
-3, -3.274897, -5.385077,
3, -3.274897, -5.385077,
-3, -3.274897, -5.385077,
-3, -3.436811, -5.648362,
-2, -3.274897, -5.385077,
-2, -3.436811, -5.648362,
-1, -3.274897, -5.385077,
-1, -3.436811, -5.648362,
0, -3.274897, -5.385077,
0, -3.436811, -5.648362,
1, -3.274897, -5.385077,
1, -3.436811, -5.648362,
2, -3.274897, -5.385077,
2, -3.436811, -5.648362,
3, -3.274897, -5.385077,
3, -3.436811, -5.648362
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
-3, -3.760638, -6.174932, 0, -0.5, 0.5, 0.5,
-3, -3.760638, -6.174932, 1, -0.5, 0.5, 0.5,
-3, -3.760638, -6.174932, 1, 1.5, 0.5, 0.5,
-3, -3.760638, -6.174932, 0, 1.5, 0.5, 0.5,
-2, -3.760638, -6.174932, 0, -0.5, 0.5, 0.5,
-2, -3.760638, -6.174932, 1, -0.5, 0.5, 0.5,
-2, -3.760638, -6.174932, 1, 1.5, 0.5, 0.5,
-2, -3.760638, -6.174932, 0, 1.5, 0.5, 0.5,
-1, -3.760638, -6.174932, 0, -0.5, 0.5, 0.5,
-1, -3.760638, -6.174932, 1, -0.5, 0.5, 0.5,
-1, -3.760638, -6.174932, 1, 1.5, 0.5, 0.5,
-1, -3.760638, -6.174932, 0, 1.5, 0.5, 0.5,
0, -3.760638, -6.174932, 0, -0.5, 0.5, 0.5,
0, -3.760638, -6.174932, 1, -0.5, 0.5, 0.5,
0, -3.760638, -6.174932, 1, 1.5, 0.5, 0.5,
0, -3.760638, -6.174932, 0, 1.5, 0.5, 0.5,
1, -3.760638, -6.174932, 0, -0.5, 0.5, 0.5,
1, -3.760638, -6.174932, 1, -0.5, 0.5, 0.5,
1, -3.760638, -6.174932, 1, 1.5, 0.5, 0.5,
1, -3.760638, -6.174932, 0, 1.5, 0.5, 0.5,
2, -3.760638, -6.174932, 0, -0.5, 0.5, 0.5,
2, -3.760638, -6.174932, 1, -0.5, 0.5, 0.5,
2, -3.760638, -6.174932, 1, 1.5, 0.5, 0.5,
2, -3.760638, -6.174932, 0, 1.5, 0.5, 0.5,
3, -3.760638, -6.174932, 0, -0.5, 0.5, 0.5,
3, -3.760638, -6.174932, 1, -0.5, 0.5, 0.5,
3, -3.760638, -6.174932, 1, 1.5, 0.5, 0.5,
3, -3.760638, -6.174932, 0, 1.5, 0.5, 0.5
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
-3.628667, -3, -5.385077,
-3.628667, 3, -5.385077,
-3.628667, -3, -5.385077,
-3.806218, -3, -5.648362,
-3.628667, -2, -5.385077,
-3.806218, -2, -5.648362,
-3.628667, -1, -5.385077,
-3.806218, -1, -5.648362,
-3.628667, 0, -5.385077,
-3.806218, 0, -5.648362,
-3.628667, 1, -5.385077,
-3.806218, 1, -5.648362,
-3.628667, 2, -5.385077,
-3.806218, 2, -5.648362,
-3.628667, 3, -5.385077,
-3.806218, 3, -5.648362
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
-4.16132, -3, -6.174932, 0, -0.5, 0.5, 0.5,
-4.16132, -3, -6.174932, 1, -0.5, 0.5, 0.5,
-4.16132, -3, -6.174932, 1, 1.5, 0.5, 0.5,
-4.16132, -3, -6.174932, 0, 1.5, 0.5, 0.5,
-4.16132, -2, -6.174932, 0, -0.5, 0.5, 0.5,
-4.16132, -2, -6.174932, 1, -0.5, 0.5, 0.5,
-4.16132, -2, -6.174932, 1, 1.5, 0.5, 0.5,
-4.16132, -2, -6.174932, 0, 1.5, 0.5, 0.5,
-4.16132, -1, -6.174932, 0, -0.5, 0.5, 0.5,
-4.16132, -1, -6.174932, 1, -0.5, 0.5, 0.5,
-4.16132, -1, -6.174932, 1, 1.5, 0.5, 0.5,
-4.16132, -1, -6.174932, 0, 1.5, 0.5, 0.5,
-4.16132, 0, -6.174932, 0, -0.5, 0.5, 0.5,
-4.16132, 0, -6.174932, 1, -0.5, 0.5, 0.5,
-4.16132, 0, -6.174932, 1, 1.5, 0.5, 0.5,
-4.16132, 0, -6.174932, 0, 1.5, 0.5, 0.5,
-4.16132, 1, -6.174932, 0, -0.5, 0.5, 0.5,
-4.16132, 1, -6.174932, 1, -0.5, 0.5, 0.5,
-4.16132, 1, -6.174932, 1, 1.5, 0.5, 0.5,
-4.16132, 1, -6.174932, 0, 1.5, 0.5, 0.5,
-4.16132, 2, -6.174932, 0, -0.5, 0.5, 0.5,
-4.16132, 2, -6.174932, 1, -0.5, 0.5, 0.5,
-4.16132, 2, -6.174932, 1, 1.5, 0.5, 0.5,
-4.16132, 2, -6.174932, 0, 1.5, 0.5, 0.5,
-4.16132, 3, -6.174932, 0, -0.5, 0.5, 0.5,
-4.16132, 3, -6.174932, 1, -0.5, 0.5, 0.5,
-4.16132, 3, -6.174932, 1, 1.5, 0.5, 0.5,
-4.16132, 3, -6.174932, 0, 1.5, 0.5, 0.5
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
-3.628667, -3.274897, -4,
-3.628667, -3.274897, 4,
-3.628667, -3.274897, -4,
-3.806218, -3.436811, -4,
-3.628667, -3.274897, -2,
-3.806218, -3.436811, -2,
-3.628667, -3.274897, 0,
-3.806218, -3.436811, 0,
-3.628667, -3.274897, 2,
-3.806218, -3.436811, 2,
-3.628667, -3.274897, 4,
-3.806218, -3.436811, 4
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
-4.16132, -3.760638, -4, 0, -0.5, 0.5, 0.5,
-4.16132, -3.760638, -4, 1, -0.5, 0.5, 0.5,
-4.16132, -3.760638, -4, 1, 1.5, 0.5, 0.5,
-4.16132, -3.760638, -4, 0, 1.5, 0.5, 0.5,
-4.16132, -3.760638, -2, 0, -0.5, 0.5, 0.5,
-4.16132, -3.760638, -2, 1, -0.5, 0.5, 0.5,
-4.16132, -3.760638, -2, 1, 1.5, 0.5, 0.5,
-4.16132, -3.760638, -2, 0, 1.5, 0.5, 0.5,
-4.16132, -3.760638, 0, 0, -0.5, 0.5, 0.5,
-4.16132, -3.760638, 0, 1, -0.5, 0.5, 0.5,
-4.16132, -3.760638, 0, 1, 1.5, 0.5, 0.5,
-4.16132, -3.760638, 0, 0, 1.5, 0.5, 0.5,
-4.16132, -3.760638, 2, 0, -0.5, 0.5, 0.5,
-4.16132, -3.760638, 2, 1, -0.5, 0.5, 0.5,
-4.16132, -3.760638, 2, 1, 1.5, 0.5, 0.5,
-4.16132, -3.760638, 2, 0, 1.5, 0.5, 0.5,
-4.16132, -3.760638, 4, 0, -0.5, 0.5, 0.5,
-4.16132, -3.760638, 4, 1, -0.5, 0.5, 0.5,
-4.16132, -3.760638, 4, 1, 1.5, 0.5, 0.5,
-4.16132, -3.760638, 4, 0, 1.5, 0.5, 0.5
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
-3.628667, -3.274897, -5.385077,
-3.628667, 3.201643, -5.385077,
-3.628667, -3.274897, 5.14633,
-3.628667, 3.201643, 5.14633,
-3.628667, -3.274897, -5.385077,
-3.628667, -3.274897, 5.14633,
-3.628667, 3.201643, -5.385077,
-3.628667, 3.201643, 5.14633,
-3.628667, -3.274897, -5.385077,
3.473366, -3.274897, -5.385077,
-3.628667, -3.274897, 5.14633,
3.473366, -3.274897, 5.14633,
-3.628667, 3.201643, -5.385077,
3.473366, 3.201643, -5.385077,
-3.628667, 3.201643, 5.14633,
3.473366, 3.201643, 5.14633,
3.473366, -3.274897, -5.385077,
3.473366, 3.201643, -5.385077,
3.473366, -3.274897, 5.14633,
3.473366, 3.201643, 5.14633,
3.473366, -3.274897, -5.385077,
3.473366, -3.274897, 5.14633,
3.473366, 3.201643, -5.385077,
3.473366, 3.201643, 5.14633
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
var radius = 7.613578;
var distance = 33.87366;
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
mvMatrix.translate( 0.07765067, 0.03662717, 0.1193733 );
mvMatrix.scale( 1.159098, 1.271041, 0.7816572 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.87366);
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
dimethirimol<-read.table("dimethirimol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimethirimol$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethirimol' not found
```

```r
y<-dimethirimol$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethirimol' not found
```

```r
z<-dimethirimol$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethirimol' not found
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
-3.52524, 0.2396165, -1.297556, 0, 0, 1, 1, 1,
-3.231496, -0.6904047, -4.770025, 1, 0, 0, 1, 1,
-2.717555, -0.7165884, -2.075193, 1, 0, 0, 1, 1,
-2.540161, -0.4023828, -0.7810681, 1, 0, 0, 1, 1,
-2.461043, -0.5241721, -2.016669, 1, 0, 0, 1, 1,
-2.272418, -0.7360122, -1.856857, 1, 0, 0, 1, 1,
-2.236235, 0.4722362, 0.5769453, 0, 0, 0, 1, 1,
-2.202487, 0.08698597, -1.487375, 0, 0, 0, 1, 1,
-2.19923, -1.1616, -1.282041, 0, 0, 0, 1, 1,
-2.184734, -1.58857, -0.8001558, 0, 0, 0, 1, 1,
-2.16557, 1.674316, -1.756462, 0, 0, 0, 1, 1,
-2.142308, 2.634704, -0.5319484, 0, 0, 0, 1, 1,
-2.08637, -0.06808872, -0.5752461, 0, 0, 0, 1, 1,
-2.075933, 1.052576, 0.1612163, 1, 1, 1, 1, 1,
-2.066922, -0.3325783, -1.157515, 1, 1, 1, 1, 1,
-2.062531, -1.102425, -1.746512, 1, 1, 1, 1, 1,
-2.028347, 0.008722614, -0.8897322, 1, 1, 1, 1, 1,
-2.016458, -1.183963, 0.5535212, 1, 1, 1, 1, 1,
-2.002383, -0.181693, -1.158286, 1, 1, 1, 1, 1,
-1.966051, 1.950774, -0.4245983, 1, 1, 1, 1, 1,
-1.951775, -0.1206193, -1.227785, 1, 1, 1, 1, 1,
-1.941502, 3.107324, -1.522533, 1, 1, 1, 1, 1,
-1.899993, -0.3279692, -3.409796, 1, 1, 1, 1, 1,
-1.891699, -0.2162441, -1.037145, 1, 1, 1, 1, 1,
-1.889253, 1.548993, -0.7325287, 1, 1, 1, 1, 1,
-1.864727, -0.4748423, -3.256612, 1, 1, 1, 1, 1,
-1.832747, -0.1427285, -1.004962, 1, 1, 1, 1, 1,
-1.81466, 0.2542809, -1.594695, 1, 1, 1, 1, 1,
-1.811989, -0.4537288, -2.056826, 0, 0, 1, 1, 1,
-1.800414, -0.6308041, -1.495143, 1, 0, 0, 1, 1,
-1.788477, 0.4335969, -2.720454, 1, 0, 0, 1, 1,
-1.748911, -2.072152, -2.720912, 1, 0, 0, 1, 1,
-1.748375, -0.9212852, 0.167388, 1, 0, 0, 1, 1,
-1.739854, -2.204243, -4.475107, 1, 0, 0, 1, 1,
-1.729292, -1.524523, -1.52627, 0, 0, 0, 1, 1,
-1.705817, 1.179803, -0.1347743, 0, 0, 0, 1, 1,
-1.68135, 0.4487783, -0.3416827, 0, 0, 0, 1, 1,
-1.677409, 2.731113, 0.7517928, 0, 0, 0, 1, 1,
-1.671084, -0.8714334, -1.470691, 0, 0, 0, 1, 1,
-1.666598, 0.7676002, -1.803511, 0, 0, 0, 1, 1,
-1.666476, 0.2636794, 0.6813286, 0, 0, 0, 1, 1,
-1.659466, -0.3063502, -1.629905, 1, 1, 1, 1, 1,
-1.651384, 0.8936336, 0.4093042, 1, 1, 1, 1, 1,
-1.649061, 1.387759, -0.4531119, 1, 1, 1, 1, 1,
-1.6364, 1.023332, -2.324443, 1, 1, 1, 1, 1,
-1.6144, -0.5296199, -0.9073732, 1, 1, 1, 1, 1,
-1.613164, 0.8419784, -1.911965, 1, 1, 1, 1, 1,
-1.608548, 0.7081633, -2.264902, 1, 1, 1, 1, 1,
-1.60312, -0.09167415, -1.384347, 1, 1, 1, 1, 1,
-1.582647, -1.590211, -2.805055, 1, 1, 1, 1, 1,
-1.539485, 1.316825, -1.655028, 1, 1, 1, 1, 1,
-1.524336, 1.226426, -1.812042, 1, 1, 1, 1, 1,
-1.519248, 0.2620803, -1.231761, 1, 1, 1, 1, 1,
-1.517643, 1.76547, 0.8903607, 1, 1, 1, 1, 1,
-1.509751, -0.9564194, -5.13837, 1, 1, 1, 1, 1,
-1.504976, 0.9458318, -2.738008, 1, 1, 1, 1, 1,
-1.491299, -0.6306806, -1.590088, 0, 0, 1, 1, 1,
-1.484392, -0.5105984, -1.827589, 1, 0, 0, 1, 1,
-1.481104, -0.374658, -1.59591, 1, 0, 0, 1, 1,
-1.466654, 0.8719018, -1.656564, 1, 0, 0, 1, 1,
-1.461659, -0.2305935, -1.328706, 1, 0, 0, 1, 1,
-1.460764, 0.3395823, -0.9773219, 1, 0, 0, 1, 1,
-1.460709, -1.292309, -1.817613, 0, 0, 0, 1, 1,
-1.45251, -0.6460593, -2.710832, 0, 0, 0, 1, 1,
-1.45251, -0.2465776, -0.8921031, 0, 0, 0, 1, 1,
-1.449194, 1.79426, -0.9373721, 0, 0, 0, 1, 1,
-1.442994, 0.3114203, -1.08098, 0, 0, 0, 1, 1,
-1.435701, -0.02093643, -2.262877, 0, 0, 0, 1, 1,
-1.430418, 0.1641205, -1.118311, 0, 0, 0, 1, 1,
-1.424979, 1.716916, -0.05818056, 1, 1, 1, 1, 1,
-1.424541, -0.7359732, -1.8009, 1, 1, 1, 1, 1,
-1.423093, 1.349326, -1.606078, 1, 1, 1, 1, 1,
-1.396847, 0.4915363, -2.001091, 1, 1, 1, 1, 1,
-1.387122, -0.5745704, -0.09268189, 1, 1, 1, 1, 1,
-1.384205, 0.4747794, -2.998742, 1, 1, 1, 1, 1,
-1.380227, -2.642578, -2.757906, 1, 1, 1, 1, 1,
-1.378979, -1.651487, -2.23675, 1, 1, 1, 1, 1,
-1.378621, -0.777756, -1.209949, 1, 1, 1, 1, 1,
-1.357859, 0.5650156, -2.712757, 1, 1, 1, 1, 1,
-1.349675, 0.5980318, 0.8366555, 1, 1, 1, 1, 1,
-1.337928, 0.00112363, -0.6122042, 1, 1, 1, 1, 1,
-1.323306, -0.3539374, -1.135788, 1, 1, 1, 1, 1,
-1.321529, -0.9966069, -2.4301, 1, 1, 1, 1, 1,
-1.31259, 0.1550956, -2.591367, 1, 1, 1, 1, 1,
-1.310864, -0.5786114, -0.8799295, 0, 0, 1, 1, 1,
-1.292851, -0.9192899, -2.435657, 1, 0, 0, 1, 1,
-1.290934, 0.08123051, -1.056306, 1, 0, 0, 1, 1,
-1.285872, -0.7041444, -1.307326, 1, 0, 0, 1, 1,
-1.281385, -0.02725423, -1.224383, 1, 0, 0, 1, 1,
-1.281049, -0.9883525, -2.328208, 1, 0, 0, 1, 1,
-1.27903, -1.077314, -3.38829, 0, 0, 0, 1, 1,
-1.267811, 1.148749, -0.07120553, 0, 0, 0, 1, 1,
-1.260911, 1.440891, 0.1228441, 0, 0, 0, 1, 1,
-1.252515, -1.626521, -2.776633, 0, 0, 0, 1, 1,
-1.248433, -1.078673, -2.019647, 0, 0, 0, 1, 1,
-1.247944, -1.356544, -2.153469, 0, 0, 0, 1, 1,
-1.218253, -1.431398, -2.319675, 0, 0, 0, 1, 1,
-1.216241, 0.8012956, -1.277064, 1, 1, 1, 1, 1,
-1.21035, 1.143586, -1.23783, 1, 1, 1, 1, 1,
-1.20844, -1.510903, -2.764101, 1, 1, 1, 1, 1,
-1.197673, -0.3248277, -3.17282, 1, 1, 1, 1, 1,
-1.195618, -0.525103, -2.031899, 1, 1, 1, 1, 1,
-1.188968, 0.9910825, 1.14006, 1, 1, 1, 1, 1,
-1.187304, 0.3954114, -2.339168, 1, 1, 1, 1, 1,
-1.178884, -0.9527689, -2.613693, 1, 1, 1, 1, 1,
-1.169633, 1.23222, -1.918905, 1, 1, 1, 1, 1,
-1.165426, 1.364833, 0.1504686, 1, 1, 1, 1, 1,
-1.162925, -0.5515444, -3.870193, 1, 1, 1, 1, 1,
-1.155705, -0.02334366, -1.195922, 1, 1, 1, 1, 1,
-1.136852, -0.6142057, -5.053069, 1, 1, 1, 1, 1,
-1.132637, 0.02403704, -1.574589, 1, 1, 1, 1, 1,
-1.130893, 0.4540627, -3.572819, 1, 1, 1, 1, 1,
-1.129128, 0.5063486, -0.8867788, 0, 0, 1, 1, 1,
-1.127685, 0.1685472, -2.452851, 1, 0, 0, 1, 1,
-1.125568, -0.4017286, -2.393378, 1, 0, 0, 1, 1,
-1.113065, 2.294567, -0.6109661, 1, 0, 0, 1, 1,
-1.111759, 0.1609175, -2.398608, 1, 0, 0, 1, 1,
-1.109972, 0.403148, -0.7291505, 1, 0, 0, 1, 1,
-1.105353, 0.9280904, -1.902374, 0, 0, 0, 1, 1,
-1.105197, -1.723436, -2.312394, 0, 0, 0, 1, 1,
-1.096153, -0.1881448, -2.011008, 0, 0, 0, 1, 1,
-1.096014, 1.091421, -1.07304, 0, 0, 0, 1, 1,
-1.087744, 0.490384, -3.021419, 0, 0, 0, 1, 1,
-1.085837, -1.437731, -2.145614, 0, 0, 0, 1, 1,
-1.078923, 0.1079808, -2.813456, 0, 0, 0, 1, 1,
-1.076092, -2.359387, -2.578883, 1, 1, 1, 1, 1,
-1.075692, 0.9017867, -0.8260866, 1, 1, 1, 1, 1,
-1.074715, -0.6929663, -3.493028, 1, 1, 1, 1, 1,
-1.073699, 0.285366, -0.4604641, 1, 1, 1, 1, 1,
-1.07348, -1.290555, -3.01859, 1, 1, 1, 1, 1,
-1.070886, 0.9468876, -0.2202279, 1, 1, 1, 1, 1,
-1.068823, 1.679864, -1.642275, 1, 1, 1, 1, 1,
-1.053703, -0.4929929, -1.382271, 1, 1, 1, 1, 1,
-1.051267, -1.031196, -2.910211, 1, 1, 1, 1, 1,
-1.041345, -0.6906884, -1.159333, 1, 1, 1, 1, 1,
-1.038025, -0.03491274, -0.6416798, 1, 1, 1, 1, 1,
-1.037389, -1.167643, -3.373934, 1, 1, 1, 1, 1,
-1.036765, -0.3035828, -1.799711, 1, 1, 1, 1, 1,
-1.033204, 0.4038855, -0.09638027, 1, 1, 1, 1, 1,
-1.019148, -1.056491, -1.583017, 1, 1, 1, 1, 1,
-1.010767, 0.2342171, -0.6532583, 0, 0, 1, 1, 1,
-1.007924, -0.6591706, -2.057505, 1, 0, 0, 1, 1,
-1.006676, -0.9826379, -2.375427, 1, 0, 0, 1, 1,
-1.002449, -1.179515, -3.262096, 1, 0, 0, 1, 1,
-1.001058, 0.1358935, -0.3980494, 1, 0, 0, 1, 1,
-0.9995253, -0.3193426, -3.909856, 1, 0, 0, 1, 1,
-0.9964229, 1.392702, -0.3629538, 0, 0, 0, 1, 1,
-0.9939558, -0.124915, -2.631004, 0, 0, 0, 1, 1,
-0.9888229, -0.5946387, -1.727838, 0, 0, 0, 1, 1,
-0.9884524, 0.02746894, -0.04621173, 0, 0, 0, 1, 1,
-0.986721, -1.023777, -0.6974397, 0, 0, 0, 1, 1,
-0.9803745, -0.6317646, -0.3189565, 0, 0, 0, 1, 1,
-0.9799751, -2.071748, -3.221587, 0, 0, 0, 1, 1,
-0.9763759, 1.306185, -1.260953, 1, 1, 1, 1, 1,
-0.9762782, -0.1761104, -2.87538, 1, 1, 1, 1, 1,
-0.9760372, 0.2569963, -0.8605222, 1, 1, 1, 1, 1,
-0.9749352, -0.7843375, -2.927052, 1, 1, 1, 1, 1,
-0.9743756, 1.674734, -1.117105, 1, 1, 1, 1, 1,
-0.9713905, 0.723509, -0.8435327, 1, 1, 1, 1, 1,
-0.9680684, -0.4029746, -1.160818, 1, 1, 1, 1, 1,
-0.9677269, 1.479053, -0.2021111, 1, 1, 1, 1, 1,
-0.9636111, -0.51025, -2.373408, 1, 1, 1, 1, 1,
-0.9597023, 0.7206045, 0.05557126, 1, 1, 1, 1, 1,
-0.9594836, -0.5125726, -2.692295, 1, 1, 1, 1, 1,
-0.9594301, -1.00292, -2.374564, 1, 1, 1, 1, 1,
-0.955673, -1.181063, -1.157392, 1, 1, 1, 1, 1,
-0.9555814, 1.401101, -0.479615, 1, 1, 1, 1, 1,
-0.9545271, -1.397017, -3.352271, 1, 1, 1, 1, 1,
-0.9527698, -0.1673627, -2.435087, 0, 0, 1, 1, 1,
-0.9469507, -0.4126326, -1.947326, 1, 0, 0, 1, 1,
-0.9452575, -1.639108, -2.894473, 1, 0, 0, 1, 1,
-0.9419845, -1.051383, -1.481747, 1, 0, 0, 1, 1,
-0.9336932, 0.09206262, -1.359298, 1, 0, 0, 1, 1,
-0.9262325, -0.04982771, -1.213951, 1, 0, 0, 1, 1,
-0.9178382, -0.3908699, -1.481115, 0, 0, 0, 1, 1,
-0.9166617, -0.208126, -1.943743, 0, 0, 0, 1, 1,
-0.9129706, 0.8854323, 0.01204924, 0, 0, 0, 1, 1,
-0.8977531, 0.632032, 0.126371, 0, 0, 0, 1, 1,
-0.8880369, 1.177264, -0.7113446, 0, 0, 0, 1, 1,
-0.8822024, -0.1349864, -0.6623416, 0, 0, 0, 1, 1,
-0.8809959, 1.155256, 0.9207956, 0, 0, 0, 1, 1,
-0.8711959, -1.388924, -2.534186, 1, 1, 1, 1, 1,
-0.8637896, 0.02903683, -1.745191, 1, 1, 1, 1, 1,
-0.8634149, -0.786175, -2.24976, 1, 1, 1, 1, 1,
-0.8621101, 1.361817, -1.675136, 1, 1, 1, 1, 1,
-0.8604147, -1.621694, -1.961062, 1, 1, 1, 1, 1,
-0.858961, -0.9370124, -3.086548, 1, 1, 1, 1, 1,
-0.8588176, 0.9661505, -0.6662422, 1, 1, 1, 1, 1,
-0.8587922, -0.4832129, -0.2970535, 1, 1, 1, 1, 1,
-0.8547875, 0.5007502, -1.804224, 1, 1, 1, 1, 1,
-0.8531837, 0.1532721, -1.003383, 1, 1, 1, 1, 1,
-0.8468002, 0.4266143, 0.2291413, 1, 1, 1, 1, 1,
-0.844394, 0.5444326, -2.675633, 1, 1, 1, 1, 1,
-0.8443267, 0.8585301, -0.214601, 1, 1, 1, 1, 1,
-0.8408144, 0.02323684, -2.263604, 1, 1, 1, 1, 1,
-0.8400776, 0.05717273, -0.08693255, 1, 1, 1, 1, 1,
-0.8400148, -1.209488, -0.03954937, 0, 0, 1, 1, 1,
-0.8347462, 0.2640662, -2.032331, 1, 0, 0, 1, 1,
-0.8334937, 0.2424978, -0.5442724, 1, 0, 0, 1, 1,
-0.8321386, -1.792748, -2.141896, 1, 0, 0, 1, 1,
-0.8314587, -1.287021, -0.5926471, 1, 0, 0, 1, 1,
-0.829059, -0.7249079, -2.858119, 1, 0, 0, 1, 1,
-0.8178208, -2.669207, -4.357593, 0, 0, 0, 1, 1,
-0.8169505, 0.5617293, -4.029406, 0, 0, 0, 1, 1,
-0.8160501, 0.1175039, -0.7385483, 0, 0, 0, 1, 1,
-0.8134384, -1.508915, -2.576286, 0, 0, 0, 1, 1,
-0.8080133, -0.09287093, -0.9878748, 0, 0, 0, 1, 1,
-0.8071601, -0.4124056, -2.119334, 0, 0, 0, 1, 1,
-0.7981336, 0.6134221, -1.258978, 0, 0, 0, 1, 1,
-0.7980591, -1.006478, -3.930348, 1, 1, 1, 1, 1,
-0.7978792, -0.2972213, -1.946903, 1, 1, 1, 1, 1,
-0.7936937, 1.635993, -1.528493, 1, 1, 1, 1, 1,
-0.792502, -0.6313654, -2.144587, 1, 1, 1, 1, 1,
-0.7917877, 0.4815206, -2.173373, 1, 1, 1, 1, 1,
-0.7898055, 0.1467815, -1.622226, 1, 1, 1, 1, 1,
-0.7894268, 0.532968, -1.376206, 1, 1, 1, 1, 1,
-0.7859766, 1.111289, -1.239733, 1, 1, 1, 1, 1,
-0.7723296, -0.8020627, -2.504008, 1, 1, 1, 1, 1,
-0.7701516, 0.7364264, 0.472965, 1, 1, 1, 1, 1,
-0.7691584, 0.3885248, -1.444004, 1, 1, 1, 1, 1,
-0.7690526, -0.08857529, -1.826891, 1, 1, 1, 1, 1,
-0.7638503, 1.241736, 1.34526, 1, 1, 1, 1, 1,
-0.7567557, -0.01120114, -3.529201, 1, 1, 1, 1, 1,
-0.7531986, -1.134365, -2.957732, 1, 1, 1, 1, 1,
-0.7505137, -0.1204487, -0.4057217, 0, 0, 1, 1, 1,
-0.7440204, 0.7632355, 0.1338741, 1, 0, 0, 1, 1,
-0.7421819, -0.4837772, -2.757536, 1, 0, 0, 1, 1,
-0.7371951, -0.6521063, -1.074881, 1, 0, 0, 1, 1,
-0.7345937, -0.4261363, -1.630326, 1, 0, 0, 1, 1,
-0.7326095, 0.3425376, -0.06213334, 1, 0, 0, 1, 1,
-0.7286829, 0.3235724, 0.7140616, 0, 0, 0, 1, 1,
-0.7266208, -1.206309, -1.558804, 0, 0, 0, 1, 1,
-0.7236518, 0.3938713, -2.176762, 0, 0, 0, 1, 1,
-0.7234657, -0.6780286, -3.4502, 0, 0, 0, 1, 1,
-0.7194557, 1.378668, -1.292907, 0, 0, 0, 1, 1,
-0.718482, 1.338893, -3.568193, 0, 0, 0, 1, 1,
-0.7157479, -0.9833885, -2.291738, 0, 0, 0, 1, 1,
-0.7141371, 0.4819883, -0.9248635, 1, 1, 1, 1, 1,
-0.7139354, 1.016077, 0.04601444, 1, 1, 1, 1, 1,
-0.7115832, -1.408554, -3.706689, 1, 1, 1, 1, 1,
-0.7108096, 2.155472, -0.456144, 1, 1, 1, 1, 1,
-0.7073321, 1.313403, 1.525907, 1, 1, 1, 1, 1,
-0.7045488, 1.859751, -1.343299, 1, 1, 1, 1, 1,
-0.6976873, 1.706904, -1.729712, 1, 1, 1, 1, 1,
-0.6958998, -0.3363535, -1.326532, 1, 1, 1, 1, 1,
-0.6913352, -0.06344219, -2.646305, 1, 1, 1, 1, 1,
-0.6887622, -1.291346, -2.057061, 1, 1, 1, 1, 1,
-0.6837148, 1.508506, -0.1608224, 1, 1, 1, 1, 1,
-0.6832174, -0.8174021, -2.136264, 1, 1, 1, 1, 1,
-0.6802447, -1.366394, -1.719436, 1, 1, 1, 1, 1,
-0.6787485, 0.5159761, -1.519009, 1, 1, 1, 1, 1,
-0.6695325, -0.1435279, -0.7707814, 1, 1, 1, 1, 1,
-0.6633081, 0.8741723, -1.450743, 0, 0, 1, 1, 1,
-0.6618385, -0.4215654, -1.691014, 1, 0, 0, 1, 1,
-0.6572302, -0.6263445, -0.3782038, 1, 0, 0, 1, 1,
-0.6569091, -3.113953, -2.141032, 1, 0, 0, 1, 1,
-0.6561038, -1.071598, -3.451668, 1, 0, 0, 1, 1,
-0.6537505, 1.613527, -0.4043034, 1, 0, 0, 1, 1,
-0.6518666, -1.388492, -3.020211, 0, 0, 0, 1, 1,
-0.6477135, -0.9444939, -2.918755, 0, 0, 0, 1, 1,
-0.643169, -0.428701, -1.147106, 0, 0, 0, 1, 1,
-0.6409879, -0.9295607, -1.874758, 0, 0, 0, 1, 1,
-0.6369576, 0.9263268, 0.3191891, 0, 0, 0, 1, 1,
-0.6329983, 0.1500884, -1.898382, 0, 0, 0, 1, 1,
-0.6323833, -0.5778478, -2.097799, 0, 0, 0, 1, 1,
-0.6314731, -1.021895, -3.42172, 1, 1, 1, 1, 1,
-0.6298283, -0.5607036, -1.984162, 1, 1, 1, 1, 1,
-0.6249016, -1.036126, -3.812492, 1, 1, 1, 1, 1,
-0.621044, -1.472065, -3.285486, 1, 1, 1, 1, 1,
-0.6187206, 0.4554699, -2.266237, 1, 1, 1, 1, 1,
-0.6179696, 0.488857, -1.838305, 1, 1, 1, 1, 1,
-0.6164683, 0.1195949, 0.7447873, 1, 1, 1, 1, 1,
-0.6162987, -0.7364954, -2.46337, 1, 1, 1, 1, 1,
-0.6161194, 0.9280041, -0.1085458, 1, 1, 1, 1, 1,
-0.6133211, -0.6827704, -0.6814001, 1, 1, 1, 1, 1,
-0.6116723, -0.6354843, -2.061664, 1, 1, 1, 1, 1,
-0.611425, 0.6516809, -1.461613, 1, 1, 1, 1, 1,
-0.6113084, -1.61446, -1.867292, 1, 1, 1, 1, 1,
-0.610297, 0.07154799, -2.74647, 1, 1, 1, 1, 1,
-0.606896, -0.3421141, -2.449935, 1, 1, 1, 1, 1,
-0.6038146, -0.2228861, -5.231707, 0, 0, 1, 1, 1,
-0.6024801, 0.475056, -0.08771341, 1, 0, 0, 1, 1,
-0.6023425, 1.904179, -0.3092653, 1, 0, 0, 1, 1,
-0.6020905, 1.549665, -1.510566, 1, 0, 0, 1, 1,
-0.6015805, -0.2033072, -0.649335, 1, 0, 0, 1, 1,
-0.6012933, -1.935689, -2.934878, 1, 0, 0, 1, 1,
-0.5994324, 0.226931, -0.9809833, 0, 0, 0, 1, 1,
-0.5951558, 0.06215076, -0.6640282, 0, 0, 0, 1, 1,
-0.5918415, -0.006803326, -0.9303889, 0, 0, 0, 1, 1,
-0.5910321, -0.5894932, -2.643819, 0, 0, 0, 1, 1,
-0.5900626, -0.3443217, -3.901057, 0, 0, 0, 1, 1,
-0.5887609, 0.629754, -0.9827737, 0, 0, 0, 1, 1,
-0.587248, -1.446758, -2.986528, 0, 0, 0, 1, 1,
-0.5840784, 0.8331593, -0.8228056, 1, 1, 1, 1, 1,
-0.583681, -0.0200255, -1.909714, 1, 1, 1, 1, 1,
-0.5817699, -0.6707827, -2.521916, 1, 1, 1, 1, 1,
-0.5792117, -1.256595, -2.912986, 1, 1, 1, 1, 1,
-0.576925, -0.9231674, -0.9800349, 1, 1, 1, 1, 1,
-0.5755999, 0.1124474, -0.2893353, 1, 1, 1, 1, 1,
-0.573124, -1.296746, -2.457909, 1, 1, 1, 1, 1,
-0.5730945, -1.427216, -4.22461, 1, 1, 1, 1, 1,
-0.571436, -0.6709126, -1.394708, 1, 1, 1, 1, 1,
-0.5696424, -1.684773, -1.460788, 1, 1, 1, 1, 1,
-0.567155, 0.4382601, -0.6020948, 1, 1, 1, 1, 1,
-0.5649878, 0.2422096, -1.337772, 1, 1, 1, 1, 1,
-0.561852, -1.333973, -2.336796, 1, 1, 1, 1, 1,
-0.561163, 0.4297003, -1.336763, 1, 1, 1, 1, 1,
-0.5592237, 0.5993866, -0.1646975, 1, 1, 1, 1, 1,
-0.5585062, -0.7160708, -1.208918, 0, 0, 1, 1, 1,
-0.5581771, 0.6902359, -1.849001, 1, 0, 0, 1, 1,
-0.5563335, 0.9742534, -0.4527784, 1, 0, 0, 1, 1,
-0.5527987, 0.8038621, 0.4844785, 1, 0, 0, 1, 1,
-0.5505122, 1.31346, -0.4156318, 1, 0, 0, 1, 1,
-0.5502098, 0.7974876, -2.120438, 1, 0, 0, 1, 1,
-0.5487967, 0.08893869, -0.7889737, 0, 0, 0, 1, 1,
-0.5480686, -0.2045422, -2.863605, 0, 0, 0, 1, 1,
-0.5464077, -0.9199412, -2.086506, 0, 0, 0, 1, 1,
-0.5463846, 1.875663, -0.4571892, 0, 0, 0, 1, 1,
-0.5429778, 0.3350332, -1.517796, 0, 0, 0, 1, 1,
-0.5423331, -1.090488, -2.633136, 0, 0, 0, 1, 1,
-0.54069, 0.6570895, -0.292038, 0, 0, 0, 1, 1,
-0.5369516, 0.6972858, 0.07981396, 1, 1, 1, 1, 1,
-0.5344325, 1.472301, -0.2774462, 1, 1, 1, 1, 1,
-0.5275235, -2.818123, -2.546408, 1, 1, 1, 1, 1,
-0.5220187, 0.60919, -1.614247, 1, 1, 1, 1, 1,
-0.5188916, 0.3036199, 0.03775004, 1, 1, 1, 1, 1,
-0.5167605, -0.6603552, -1.197683, 1, 1, 1, 1, 1,
-0.51517, 0.8432734, -1.063351, 1, 1, 1, 1, 1,
-0.5132118, 0.8914317, 0.3900363, 1, 1, 1, 1, 1,
-0.5128412, -0.14151, -2.891241, 1, 1, 1, 1, 1,
-0.5044476, 0.8499287, -0.7802373, 1, 1, 1, 1, 1,
-0.5008563, 1.233108, -0.3690325, 1, 1, 1, 1, 1,
-0.4994073, 1.571567, 0.7385663, 1, 1, 1, 1, 1,
-0.4982323, 0.4704023, -0.7706251, 1, 1, 1, 1, 1,
-0.4913067, -0.9511197, -4.140604, 1, 1, 1, 1, 1,
-0.4904514, 0.7539716, 1.013581, 1, 1, 1, 1, 1,
-0.4891194, -0.5030316, -3.570347, 0, 0, 1, 1, 1,
-0.4890117, -0.7462511, -2.805341, 1, 0, 0, 1, 1,
-0.4885331, 0.3910148, -1.494946, 1, 0, 0, 1, 1,
-0.4847239, -0.5655791, -2.55977, 1, 0, 0, 1, 1,
-0.4805455, 0.5983346, -1.682477, 1, 0, 0, 1, 1,
-0.4746782, -0.6073893, -1.974443, 1, 0, 0, 1, 1,
-0.4744968, 1.047614, 0.2731278, 0, 0, 0, 1, 1,
-0.4738804, 2.414359, -1.479029, 0, 0, 0, 1, 1,
-0.4733567, 0.9404778, -1.174394, 0, 0, 0, 1, 1,
-0.4666112, -1.236444, -1.767487, 0, 0, 0, 1, 1,
-0.4592131, 0.1642505, -0.5326645, 0, 0, 0, 1, 1,
-0.4520248, 1.571157, 0.02975924, 0, 0, 0, 1, 1,
-0.4504889, -0.2378328, -1.050606, 0, 0, 0, 1, 1,
-0.4463009, -0.1782011, -2.528985, 1, 1, 1, 1, 1,
-0.4456694, -1.233233, -1.987312, 1, 1, 1, 1, 1,
-0.4456165, 0.2140587, -0.3634885, 1, 1, 1, 1, 1,
-0.4431409, -0.4336942, -1.481457, 1, 1, 1, 1, 1,
-0.4373451, 1.861191, 0.1805588, 1, 1, 1, 1, 1,
-0.4361536, -0.5325252, -2.010098, 1, 1, 1, 1, 1,
-0.4356903, 0.858879, -0.7123401, 1, 1, 1, 1, 1,
-0.4325513, -1.339629, -2.52134, 1, 1, 1, 1, 1,
-0.4323647, -0.08881777, -2.198227, 1, 1, 1, 1, 1,
-0.4317604, 1.311784, 0.8003549, 1, 1, 1, 1, 1,
-0.4314455, 1.306285, 0.2441619, 1, 1, 1, 1, 1,
-0.4292687, -0.6137118, -2.562167, 1, 1, 1, 1, 1,
-0.4270415, -0.205513, -1.372235, 1, 1, 1, 1, 1,
-0.4264332, -0.6570869, -2.705292, 1, 1, 1, 1, 1,
-0.4219164, -1.140601, -2.628004, 1, 1, 1, 1, 1,
-0.4215091, 0.5336327, -1.104278, 0, 0, 1, 1, 1,
-0.421311, -1.927887, -3.451739, 1, 0, 0, 1, 1,
-0.4199987, 0.6979771, -0.2259748, 1, 0, 0, 1, 1,
-0.4102627, 1.182184, 1.087161, 1, 0, 0, 1, 1,
-0.4055667, 0.9157161, -0.1069548, 1, 0, 0, 1, 1,
-0.4020439, -0.7121324, -2.836782, 1, 0, 0, 1, 1,
-0.3995727, 0.8725835, 0.3416226, 0, 0, 0, 1, 1,
-0.398847, -0.06462196, -2.36858, 0, 0, 0, 1, 1,
-0.3982595, 0.6337286, -1.198881, 0, 0, 0, 1, 1,
-0.3952185, -0.05537082, 0.3800331, 0, 0, 0, 1, 1,
-0.3945437, -0.08773295, -1.278094, 0, 0, 0, 1, 1,
-0.3926367, -1.159468, -2.134759, 0, 0, 0, 1, 1,
-0.390668, 0.2620272, -1.295974, 0, 0, 0, 1, 1,
-0.3904797, 1.271325, 0.5952873, 1, 1, 1, 1, 1,
-0.380672, -0.3800001, -1.522851, 1, 1, 1, 1, 1,
-0.3758186, -0.5949395, -2.565405, 1, 1, 1, 1, 1,
-0.3752534, 0.2643506, -1.482991, 1, 1, 1, 1, 1,
-0.3700417, -0.477752, -1.264338, 1, 1, 1, 1, 1,
-0.3678733, 0.2356585, -2.020416, 1, 1, 1, 1, 1,
-0.361985, -1.308688, -3.287951, 1, 1, 1, 1, 1,
-0.3617617, -1.986494, -2.863158, 1, 1, 1, 1, 1,
-0.3617271, 0.7571059, -0.04089935, 1, 1, 1, 1, 1,
-0.3606872, 0.2398529, -1.296591, 1, 1, 1, 1, 1,
-0.3598973, -0.5629029, -1.186972, 1, 1, 1, 1, 1,
-0.3554223, -1.418527, -4.063048, 1, 1, 1, 1, 1,
-0.3459951, 0.5605161, 0.8304978, 1, 1, 1, 1, 1,
-0.3455109, -0.4370829, -0.234714, 1, 1, 1, 1, 1,
-0.3453538, 0.7369969, -0.1963904, 1, 1, 1, 1, 1,
-0.3377315, -0.23848, -2.301319, 0, 0, 1, 1, 1,
-0.3356527, -0.7036893, -2.960491, 1, 0, 0, 1, 1,
-0.3338522, -1.293231, -3.167386, 1, 0, 0, 1, 1,
-0.3336544, -0.6384001, -3.885097, 1, 0, 0, 1, 1,
-0.3258691, -1.847115, -2.458452, 1, 0, 0, 1, 1,
-0.3258385, 0.06657999, -2.326783, 1, 0, 0, 1, 1,
-0.3231561, -0.7395179, -3.691859, 0, 0, 0, 1, 1,
-0.3222602, 0.4320836, -0.822428, 0, 0, 0, 1, 1,
-0.3188817, -0.02333937, -1.796173, 0, 0, 0, 1, 1,
-0.3152773, -1.345956, -1.38168, 0, 0, 0, 1, 1,
-0.3122046, -1.367061, -3.651168, 0, 0, 0, 1, 1,
-0.3092806, 0.2443387, -0.001299595, 0, 0, 0, 1, 1,
-0.3022935, 0.7907503, -0.1909079, 0, 0, 0, 1, 1,
-0.3013864, 0.05978613, -2.122626, 1, 1, 1, 1, 1,
-0.2995189, -0.007177798, 0.7184051, 1, 1, 1, 1, 1,
-0.2830332, -0.8501189, -2.499178, 1, 1, 1, 1, 1,
-0.2808557, -0.02460816, -3.763753, 1, 1, 1, 1, 1,
-0.2731383, -1.635638, -3.795857, 1, 1, 1, 1, 1,
-0.2668629, 0.1299681, -0.2488712, 1, 1, 1, 1, 1,
-0.2638729, 0.9617012, 1.063272, 1, 1, 1, 1, 1,
-0.2624676, -0.9273984, -4.981277, 1, 1, 1, 1, 1,
-0.2615466, 0.7984036, -0.8334615, 1, 1, 1, 1, 1,
-0.2578297, 0.3264087, 0.1345399, 1, 1, 1, 1, 1,
-0.2551493, -0.2359541, -2.578801, 1, 1, 1, 1, 1,
-0.2502596, -0.01434099, -1.375113, 1, 1, 1, 1, 1,
-0.2441874, 0.01590018, -0.8471684, 1, 1, 1, 1, 1,
-0.2384789, 1.057774, 0.616901, 1, 1, 1, 1, 1,
-0.2363919, -0.4164315, -4.334248, 1, 1, 1, 1, 1,
-0.2349321, -0.4110754, -0.9803939, 0, 0, 1, 1, 1,
-0.2263078, -1.860451, -2.561269, 1, 0, 0, 1, 1,
-0.2262007, 0.8639809, 0.4194354, 1, 0, 0, 1, 1,
-0.2260064, -0.4350735, -2.008388, 1, 0, 0, 1, 1,
-0.2241993, -0.6005482, -3.386073, 1, 0, 0, 1, 1,
-0.2228288, 0.7728978, -1.165264, 1, 0, 0, 1, 1,
-0.220356, 1.383765, -1.652308, 0, 0, 0, 1, 1,
-0.2202242, 0.2532741, -1.693743, 0, 0, 0, 1, 1,
-0.219415, 1.449917, -0.4219387, 0, 0, 0, 1, 1,
-0.218745, 0.3014129, -0.5285062, 0, 0, 0, 1, 1,
-0.218699, 1.03099, 2.142292, 0, 0, 0, 1, 1,
-0.2173818, 0.7049834, -0.2596107, 0, 0, 0, 1, 1,
-0.2153168, 2.180348, -0.7288982, 0, 0, 0, 1, 1,
-0.2090037, -0.06009986, -1.343025, 1, 1, 1, 1, 1,
-0.2071186, -0.002361195, -0.9636528, 1, 1, 1, 1, 1,
-0.2015339, 0.2169633, -2.534949, 1, 1, 1, 1, 1,
-0.2013879, 2.301817, -0.5231619, 1, 1, 1, 1, 1,
-0.1950682, -0.3228416, -3.356423, 1, 1, 1, 1, 1,
-0.1897797, 0.7567641, 1.930179, 1, 1, 1, 1, 1,
-0.1895595, 0.5189685, -1.3314, 1, 1, 1, 1, 1,
-0.1863753, 0.4635738, -0.6634275, 1, 1, 1, 1, 1,
-0.1851528, -0.2311434, -4.164162, 1, 1, 1, 1, 1,
-0.1780833, 0.3508769, 1.169553, 1, 1, 1, 1, 1,
-0.1776939, -0.395639, -2.029631, 1, 1, 1, 1, 1,
-0.1751756, -1.847466, -2.640441, 1, 1, 1, 1, 1,
-0.1693493, -0.2317621, -1.5826, 1, 1, 1, 1, 1,
-0.165812, -1.976916, -3.099622, 1, 1, 1, 1, 1,
-0.1639335, 0.05121851, -0.6687123, 1, 1, 1, 1, 1,
-0.1626091, -0.4513946, -2.954518, 0, 0, 1, 1, 1,
-0.15567, -1.916818, -3.58215, 1, 0, 0, 1, 1,
-0.1551242, -0.7891696, -4.020595, 1, 0, 0, 1, 1,
-0.154651, 0.9955099, 1.03856, 1, 0, 0, 1, 1,
-0.1544154, 1.693354, -1.704113, 1, 0, 0, 1, 1,
-0.1514065, 0.8879932, -0.1141056, 1, 0, 0, 1, 1,
-0.150696, -0.8042074, -2.074088, 0, 0, 0, 1, 1,
-0.1489474, -0.5616581, -2.129214, 0, 0, 0, 1, 1,
-0.1462785, -0.04093599, -1.272807, 0, 0, 0, 1, 1,
-0.144018, -0.8698533, -2.725083, 0, 0, 0, 1, 1,
-0.1433329, 1.137693, -1.682054, 0, 0, 0, 1, 1,
-0.1417192, -1.474584, -4.420996, 0, 0, 0, 1, 1,
-0.1346762, -0.01839433, -1.355622, 0, 0, 0, 1, 1,
-0.1320398, -1.233924, -1.695494, 1, 1, 1, 1, 1,
-0.1241706, 1.93241, 0.5702664, 1, 1, 1, 1, 1,
-0.1214528, -1.182189, -2.227925, 1, 1, 1, 1, 1,
-0.1194689, -0.5922028, -3.374969, 1, 1, 1, 1, 1,
-0.1182583, 1.175867, -1.838907, 1, 1, 1, 1, 1,
-0.1180064, -1.099821, -2.861091, 1, 1, 1, 1, 1,
-0.1160588, -0.3654018, -3.435699, 1, 1, 1, 1, 1,
-0.1123737, -0.7502669, -3.197954, 1, 1, 1, 1, 1,
-0.1108167, -0.5144841, -3.023785, 1, 1, 1, 1, 1,
-0.1062294, 0.1750533, -0.4870375, 1, 1, 1, 1, 1,
-0.1034167, 0.2675297, -0.1473253, 1, 1, 1, 1, 1,
-0.1020467, -1.153408, -2.08967, 1, 1, 1, 1, 1,
-0.09667622, 0.9362944, -0.8486541, 1, 1, 1, 1, 1,
-0.0853066, 0.6694689, -0.03418817, 1, 1, 1, 1, 1,
-0.08321321, 0.7405231, 1.300152, 1, 1, 1, 1, 1,
-0.08207767, 0.4986425, 1.321305, 0, 0, 1, 1, 1,
-0.07664444, -0.8356276, -3.939603, 1, 0, 0, 1, 1,
-0.07081254, 1.694685, -0.3935614, 1, 0, 0, 1, 1,
-0.06998841, 0.7675956, -0.1121475, 1, 0, 0, 1, 1,
-0.06920496, -1.621568, -2.06365, 1, 0, 0, 1, 1,
-0.06901418, 0.6972742, 0.4670699, 1, 0, 0, 1, 1,
-0.06035223, 0.3759563, 2.343102, 0, 0, 0, 1, 1,
-0.05619135, -0.9481781, -3.990502, 0, 0, 0, 1, 1,
-0.05607802, -0.4279154, -2.696489, 0, 0, 0, 1, 1,
-0.04902345, -0.0006822011, -0.7858787, 0, 0, 0, 1, 1,
-0.0470712, -1.656971, -4.454183, 0, 0, 0, 1, 1,
-0.04549217, -1.181764, -4.544628, 0, 0, 0, 1, 1,
-0.03490117, 1.398091, 0.620629, 0, 0, 0, 1, 1,
-0.03406714, 1.993634, -1.056668, 1, 1, 1, 1, 1,
-0.03149378, -0.485802, -1.420828, 1, 1, 1, 1, 1,
-0.03082228, 0.7550268, -0.8675729, 1, 1, 1, 1, 1,
-0.02712509, -1.551098, -2.205806, 1, 1, 1, 1, 1,
-0.02525742, -2.117901, -3.110683, 1, 1, 1, 1, 1,
-0.02241713, 0.1681911, 2.421792, 1, 1, 1, 1, 1,
-0.02204214, -1.011462, -2.930509, 1, 1, 1, 1, 1,
-0.02100322, 0.2596568, 0.5195413, 1, 1, 1, 1, 1,
-0.01918797, -0.4871183, -3.667297, 1, 1, 1, 1, 1,
-0.0178199, 0.6379414, -0.2542388, 1, 1, 1, 1, 1,
-0.01064541, -0.3185388, -3.374958, 1, 1, 1, 1, 1,
-0.009777932, -1.24619, -1.954572, 1, 1, 1, 1, 1,
-0.008658787, -1.25403, -3.973404, 1, 1, 1, 1, 1,
-0.005318141, -1.3653, -3.552899, 1, 1, 1, 1, 1,
-0.001275917, -1.821978, -2.856962, 1, 1, 1, 1, 1,
0.004021439, -0.07384577, 2.344161, 0, 0, 1, 1, 1,
0.004909134, 0.186583, -0.6451284, 1, 0, 0, 1, 1,
0.01166768, -0.5182728, 3.411681, 1, 0, 0, 1, 1,
0.01303404, -0.6519164, 4.121332, 1, 0, 0, 1, 1,
0.01492543, -1.066906, 2.667242, 1, 0, 0, 1, 1,
0.01744265, 0.482004, 2.088091, 1, 0, 0, 1, 1,
0.01761957, -0.8011918, 3.671871, 0, 0, 0, 1, 1,
0.01860653, -1.399547, 3.80374, 0, 0, 0, 1, 1,
0.02103492, -1.46696, 1.785562, 0, 0, 0, 1, 1,
0.02118939, -0.8832277, 3.579418, 0, 0, 0, 1, 1,
0.02289322, -0.335178, 4.271009, 0, 0, 0, 1, 1,
0.02303522, -0.139527, 3.974799, 0, 0, 0, 1, 1,
0.02398911, 0.1653058, -0.5878426, 0, 0, 0, 1, 1,
0.02673178, 0.8235171, 0.3690628, 1, 1, 1, 1, 1,
0.02688385, -0.2754228, 3.255048, 1, 1, 1, 1, 1,
0.02724816, -0.1163592, 2.735889, 1, 1, 1, 1, 1,
0.02945449, -0.3075311, 3.178147, 1, 1, 1, 1, 1,
0.03529257, 2.256933, 0.5507525, 1, 1, 1, 1, 1,
0.04134088, 0.2754264, 2.06763, 1, 1, 1, 1, 1,
0.0437048, -3.180579, 2.738281, 1, 1, 1, 1, 1,
0.04516781, -0.4009019, 3.286908, 1, 1, 1, 1, 1,
0.05017911, -0.03077354, 3.499979, 1, 1, 1, 1, 1,
0.05661881, -0.5421988, 1.752134, 1, 1, 1, 1, 1,
0.05996999, 2.045158, -0.9529141, 1, 1, 1, 1, 1,
0.06240857, -1.002054, 1.940022, 1, 1, 1, 1, 1,
0.06706446, 1.118231, 0.4435056, 1, 1, 1, 1, 1,
0.07110533, 0.2406243, 0.7566714, 1, 1, 1, 1, 1,
0.076988, 0.6348803, 0.427388, 1, 1, 1, 1, 1,
0.07817025, -0.1000759, 2.94562, 0, 0, 1, 1, 1,
0.07956102, 1.559551, 1.339504, 1, 0, 0, 1, 1,
0.0810329, -1.090553, 1.433127, 1, 0, 0, 1, 1,
0.08212943, 0.1344973, 0.7586761, 1, 0, 0, 1, 1,
0.08340957, 0.1140819, 2.265909, 1, 0, 0, 1, 1,
0.08348847, 1.651833, 0.2677951, 1, 0, 0, 1, 1,
0.08374345, 0.6501221, 1.186773, 0, 0, 0, 1, 1,
0.08603553, -1.077564, 3.878226, 0, 0, 0, 1, 1,
0.09511039, -0.8466043, 1.588624, 0, 0, 0, 1, 1,
0.09544764, 0.9473569, -0.1768213, 0, 0, 0, 1, 1,
0.09626096, 0.3521857, 0.2151615, 0, 0, 0, 1, 1,
0.09731632, 1.477955, 1.026045, 0, 0, 0, 1, 1,
0.09825273, -0.1376373, 3.252484, 0, 0, 0, 1, 1,
0.1055913, -0.1947437, 1.729642, 1, 1, 1, 1, 1,
0.106511, -0.8819953, 1.543247, 1, 1, 1, 1, 1,
0.1074251, -0.1647253, 3.958056, 1, 1, 1, 1, 1,
0.1117219, 0.8208421, 0.5371652, 1, 1, 1, 1, 1,
0.1120855, -0.008317734, 2.128247, 1, 1, 1, 1, 1,
0.1158383, -0.1655151, 0.5751151, 1, 1, 1, 1, 1,
0.1163338, -1.80561, 4.727086, 1, 1, 1, 1, 1,
0.1166821, 1.400233, -0.3193054, 1, 1, 1, 1, 1,
0.1189403, 1.133589, -0.04117221, 1, 1, 1, 1, 1,
0.1195677, -1.784418, 3.158057, 1, 1, 1, 1, 1,
0.12124, 0.9653967, 1.959587, 1, 1, 1, 1, 1,
0.1246617, 0.142982, 0.6634169, 1, 1, 1, 1, 1,
0.1249401, 0.3380428, 0.9992437, 1, 1, 1, 1, 1,
0.1258164, 1.415873, 1.465852, 1, 1, 1, 1, 1,
0.1261342, -0.9453067, 3.047619, 1, 1, 1, 1, 1,
0.126327, 1.712878, 2.026639, 0, 0, 1, 1, 1,
0.12633, 0.286588, 0.2556385, 1, 0, 0, 1, 1,
0.1401679, -0.6650066, 3.245714, 1, 0, 0, 1, 1,
0.1416838, 0.3295214, -1.186272, 1, 0, 0, 1, 1,
0.1477466, -0.08879302, 3.131904, 1, 0, 0, 1, 1,
0.1485719, -0.1924672, 1.524236, 1, 0, 0, 1, 1,
0.152144, 0.6917914, 0.164958, 0, 0, 0, 1, 1,
0.1522042, 1.020641, -1.40885, 0, 0, 0, 1, 1,
0.1544935, -0.9221399, 2.948303, 0, 0, 0, 1, 1,
0.1561475, -1.373187, 4.616971, 0, 0, 0, 1, 1,
0.1570784, 0.1293403, 1.580994, 0, 0, 0, 1, 1,
0.1581673, 1.399476, 0.3230208, 0, 0, 0, 1, 1,
0.1585643, 0.879051, 0.4390954, 0, 0, 0, 1, 1,
0.1586242, 0.5520022, -1.230938, 1, 1, 1, 1, 1,
0.1593976, 1.484819, 0.9497833, 1, 1, 1, 1, 1,
0.1654604, 0.03307174, 1.77111, 1, 1, 1, 1, 1,
0.167788, -0.8286774, 2.75897, 1, 1, 1, 1, 1,
0.1683202, -0.3256252, 3.605272, 1, 1, 1, 1, 1,
0.169331, -0.3624354, 3.024366, 1, 1, 1, 1, 1,
0.1726206, -0.05219732, 1.384367, 1, 1, 1, 1, 1,
0.1756566, 0.7223628, -1.214117, 1, 1, 1, 1, 1,
0.1758968, 1.380584, 0.5692794, 1, 1, 1, 1, 1,
0.1758992, -1.860051, 3.233077, 1, 1, 1, 1, 1,
0.1760661, -0.2379774, 3.962773, 1, 1, 1, 1, 1,
0.1777114, -1.061386, 3.511261, 1, 1, 1, 1, 1,
0.1783863, -1.033471, 1.9311, 1, 1, 1, 1, 1,
0.1841231, 0.1359048, 2.580324, 1, 1, 1, 1, 1,
0.1915492, -0.2080495, 2.182708, 1, 1, 1, 1, 1,
0.1919324, -1.327973, 3.653805, 0, 0, 1, 1, 1,
0.1920011, 0.5294536, -0.06678316, 1, 0, 0, 1, 1,
0.1929761, -0.4450711, 2.45493, 1, 0, 0, 1, 1,
0.194906, -0.5769246, 2.587024, 1, 0, 0, 1, 1,
0.1951717, 0.0484291, 1.570745, 1, 0, 0, 1, 1,
0.2018897, -0.7146389, 3.035098, 1, 0, 0, 1, 1,
0.2194023, -0.9502377, 4.617029, 0, 0, 0, 1, 1,
0.2301411, -0.7296774, 3.429482, 0, 0, 0, 1, 1,
0.2308664, -0.2195579, 1.83076, 0, 0, 0, 1, 1,
0.2369355, 0.9321862, 0.8204915, 0, 0, 0, 1, 1,
0.2390443, -3.029727, 1.743318, 0, 0, 0, 1, 1,
0.2392917, -1.11929, 4.279138, 0, 0, 0, 1, 1,
0.2401027, 1.054347, 0.1462924, 0, 0, 0, 1, 1,
0.2435812, 0.9817749, -0.4841677, 1, 1, 1, 1, 1,
0.2493379, -0.4992567, 4.99296, 1, 1, 1, 1, 1,
0.2494652, 0.8632003, 1.104411, 1, 1, 1, 1, 1,
0.2524831, -0.1302287, 1.911892, 1, 1, 1, 1, 1,
0.2551275, 0.2705839, 0.320733, 1, 1, 1, 1, 1,
0.2553259, -1.293654, 3.504516, 1, 1, 1, 1, 1,
0.2583736, 1.099618, -0.5066354, 1, 1, 1, 1, 1,
0.2680171, 0.8746827, 2.380946, 1, 1, 1, 1, 1,
0.2726993, 1.158092, 0.7007434, 1, 1, 1, 1, 1,
0.2733493, -0.1123293, 3.036325, 1, 1, 1, 1, 1,
0.2789027, 0.2956625, 0.8248519, 1, 1, 1, 1, 1,
0.2805241, 1.295807, 0.8274878, 1, 1, 1, 1, 1,
0.2834859, -1.393668, 4.05326, 1, 1, 1, 1, 1,
0.2878361, 0.368722, 0.7695833, 1, 1, 1, 1, 1,
0.2911918, 0.003060518, 2.029265, 1, 1, 1, 1, 1,
0.2960878, 0.3836655, 2.2828, 0, 0, 1, 1, 1,
0.2962773, 1.552788, 1.247171, 1, 0, 0, 1, 1,
0.2973344, 0.5759867, 0.3740606, 1, 0, 0, 1, 1,
0.2986971, -2.038263, 1.462624, 1, 0, 0, 1, 1,
0.3020782, -0.5328024, 4.085188, 1, 0, 0, 1, 1,
0.3025925, -0.2157149, 1.352076, 1, 0, 0, 1, 1,
0.3047937, -1.866078, 3.149889, 0, 0, 0, 1, 1,
0.3067074, 1.118322, -0.2842665, 0, 0, 0, 1, 1,
0.3070681, -0.4294891, 3.815361, 0, 0, 0, 1, 1,
0.3076505, -1.029497, 3.89743, 0, 0, 0, 1, 1,
0.3122386, 1.184023, 0.02457341, 0, 0, 0, 1, 1,
0.3131239, -1.517991, 4.511735, 0, 0, 0, 1, 1,
0.315735, 0.6201444, 0.8195893, 0, 0, 0, 1, 1,
0.3158066, 0.528409, 1.37148, 1, 1, 1, 1, 1,
0.3159219, 1.205168, 1.157515, 1, 1, 1, 1, 1,
0.3238826, -1.170468, 0.9998228, 1, 1, 1, 1, 1,
0.327731, 0.2006174, -1.471543, 1, 1, 1, 1, 1,
0.3283189, 1.114884, 1.026669, 1, 1, 1, 1, 1,
0.3286809, 0.3347752, -0.8796886, 1, 1, 1, 1, 1,
0.3309346, -0.5403813, 3.081494, 1, 1, 1, 1, 1,
0.3472842, -0.6442091, 2.773803, 1, 1, 1, 1, 1,
0.3489602, -0.4208777, 2.408122, 1, 1, 1, 1, 1,
0.3502217, 1.040633, 0.67513, 1, 1, 1, 1, 1,
0.3507942, 0.7126703, 1.431532, 1, 1, 1, 1, 1,
0.3545777, 0.3756654, -1.090301, 1, 1, 1, 1, 1,
0.3570801, 0.3220484, 0.576742, 1, 1, 1, 1, 1,
0.3577276, -0.9997005, 2.600854, 1, 1, 1, 1, 1,
0.3601792, -0.5138225, 1.064734, 1, 1, 1, 1, 1,
0.3611694, 1.580972, -0.5110216, 0, 0, 1, 1, 1,
0.3636402, 1.346801, -0.1875488, 1, 0, 0, 1, 1,
0.3653416, -0.1857041, 0.1106839, 1, 0, 0, 1, 1,
0.3704208, 0.4343558, -0.1124147, 1, 0, 0, 1, 1,
0.3720711, 0.8889127, 0.8406007, 1, 0, 0, 1, 1,
0.3727871, -1.396932, 3.447436, 1, 0, 0, 1, 1,
0.3748148, 0.4856073, 0.4196217, 0, 0, 0, 1, 1,
0.3755245, 0.5833507, 2.373949, 0, 0, 0, 1, 1,
0.3756328, -0.5370916, 1.132267, 0, 0, 0, 1, 1,
0.3764815, 1.074187, -0.003969437, 0, 0, 0, 1, 1,
0.3768672, -0.3256091, 1.969698, 0, 0, 0, 1, 1,
0.3798169, -0.3581533, 2.628768, 0, 0, 0, 1, 1,
0.3865163, -0.05270308, 1.283406, 0, 0, 0, 1, 1,
0.3869839, 0.9892671, -1.341138, 1, 1, 1, 1, 1,
0.3873683, -1.842681, 4.175705, 1, 1, 1, 1, 1,
0.3877591, 0.07909106, 1.208077, 1, 1, 1, 1, 1,
0.390574, -0.7691544, 3.88107, 1, 1, 1, 1, 1,
0.3911745, 1.113188, 0.2658248, 1, 1, 1, 1, 1,
0.3938222, 0.6715025, 1.044823, 1, 1, 1, 1, 1,
0.3965879, -0.3454924, 3.353714, 1, 1, 1, 1, 1,
0.3966407, -1.183281, 4.231828, 1, 1, 1, 1, 1,
0.3980045, 0.05675818, 2.928868, 1, 1, 1, 1, 1,
0.398582, 1.07669, 1.778936, 1, 1, 1, 1, 1,
0.4008395, -0.7649803, 3.228452, 1, 1, 1, 1, 1,
0.4033402, -0.09525482, 2.353712, 1, 1, 1, 1, 1,
0.4075225, 0.7366492, 0.719385, 1, 1, 1, 1, 1,
0.4084517, 0.1959372, 2.354445, 1, 1, 1, 1, 1,
0.410113, 0.229841, 0.7541146, 1, 1, 1, 1, 1,
0.4104688, 1.293762, -0.7140452, 0, 0, 1, 1, 1,
0.4122798, 0.4293895, 1.80055, 1, 0, 0, 1, 1,
0.4136676, -1.22987, 1.904464, 1, 0, 0, 1, 1,
0.4183446, -0.6967036, 2.999628, 1, 0, 0, 1, 1,
0.4196155, -1.584866, 4.344396, 1, 0, 0, 1, 1,
0.4219592, 1.208044, -0.01930039, 1, 0, 0, 1, 1,
0.4226911, 0.4018271, -0.9089153, 0, 0, 0, 1, 1,
0.4295237, 1.958709, 1.459849, 0, 0, 0, 1, 1,
0.4305868, 3.070497, -1.414301, 0, 0, 0, 1, 1,
0.4312334, -0.9096219, 2.672411, 0, 0, 0, 1, 1,
0.4319557, 1.188382, -0.2338365, 0, 0, 0, 1, 1,
0.4360436, 0.554003, 0.713312, 0, 0, 0, 1, 1,
0.4374622, -0.8421454, 1.684565, 0, 0, 0, 1, 1,
0.4382195, -1.270101, 2.981624, 1, 1, 1, 1, 1,
0.4407569, 0.1131762, 1.393758, 1, 1, 1, 1, 1,
0.4446419, 1.47862, 0.7413045, 1, 1, 1, 1, 1,
0.4499793, 0.264946, 1.512195, 1, 1, 1, 1, 1,
0.4531027, 0.7548578, 0.7826061, 1, 1, 1, 1, 1,
0.4531796, 0.2879933, 1.798506, 1, 1, 1, 1, 1,
0.4535792, -0.2966405, 3.694925, 1, 1, 1, 1, 1,
0.4540546, 0.3421982, 0.6755548, 1, 1, 1, 1, 1,
0.4557752, 1.33865, 0.3857511, 1, 1, 1, 1, 1,
0.4559063, 0.1606369, 0.3866765, 1, 1, 1, 1, 1,
0.4626854, 0.8450022, -1.859959, 1, 1, 1, 1, 1,
0.4746846, -0.1034459, 2.413596, 1, 1, 1, 1, 1,
0.488162, 0.5532405, -2.386737, 1, 1, 1, 1, 1,
0.489138, 0.6114227, 1.161545, 1, 1, 1, 1, 1,
0.492669, 1.551523, -0.02759708, 1, 1, 1, 1, 1,
0.4950134, -0.2254916, 0.8928293, 0, 0, 1, 1, 1,
0.4952632, 1.079839, 4.536367, 1, 0, 0, 1, 1,
0.497667, 1.36433, 0.2247615, 1, 0, 0, 1, 1,
0.518707, 0.7487767, -0.0990836, 1, 0, 0, 1, 1,
0.5195277, 0.954533, 1.719053, 1, 0, 0, 1, 1,
0.5201147, 1.046399, 0.2676487, 1, 0, 0, 1, 1,
0.5225347, -0.2116201, 2.226158, 0, 0, 0, 1, 1,
0.5237137, 0.8326313, 0.5052488, 0, 0, 0, 1, 1,
0.5241789, -1.107827, 2.657844, 0, 0, 0, 1, 1,
0.5288717, -0.4034064, 1.524521, 0, 0, 0, 1, 1,
0.5472832, 0.05797433, 0.3774495, 0, 0, 0, 1, 1,
0.5481755, -0.4568341, 2.002226, 0, 0, 0, 1, 1,
0.5495906, 0.8130001, 0.514893, 0, 0, 0, 1, 1,
0.5504412, 1.894769, -0.5922393, 1, 1, 1, 1, 1,
0.5532097, -1.028403, 2.609912, 1, 1, 1, 1, 1,
0.5562332, 0.4099999, 2.673668, 1, 1, 1, 1, 1,
0.5576555, -0.5309111, 2.75786, 1, 1, 1, 1, 1,
0.5579376, -0.7244998, 1.932556, 1, 1, 1, 1, 1,
0.5580769, 0.1474979, 0.7486066, 1, 1, 1, 1, 1,
0.5597384, -0.1023793, -0.3950559, 1, 1, 1, 1, 1,
0.5636055, 0.8043857, 1.529833, 1, 1, 1, 1, 1,
0.5648789, -0.1167008, 0.4535815, 1, 1, 1, 1, 1,
0.5675566, 1.107531, 0.2035861, 1, 1, 1, 1, 1,
0.5677573, -0.7186537, 2.764603, 1, 1, 1, 1, 1,
0.568389, 0.2188678, 2.236536, 1, 1, 1, 1, 1,
0.5714632, -0.09272296, 2.599877, 1, 1, 1, 1, 1,
0.5815251, 1.046324, 0.5685265, 1, 1, 1, 1, 1,
0.5828344, 1.305702, 0.2854514, 1, 1, 1, 1, 1,
0.5855703, -1.545007, 2.599132, 0, 0, 1, 1, 1,
0.588352, 1.216305, 0.9785866, 1, 0, 0, 1, 1,
0.5917724, -0.5893159, 2.814942, 1, 0, 0, 1, 1,
0.5938749, -0.226899, 2.40764, 1, 0, 0, 1, 1,
0.5988345, -1.250632, 3.408082, 1, 0, 0, 1, 1,
0.6028997, -1.845576, 3.309411, 1, 0, 0, 1, 1,
0.6053551, 1.243016, 0.3152652, 0, 0, 0, 1, 1,
0.6062486, 0.8772177, 1.516971, 0, 0, 0, 1, 1,
0.6076819, 0.9066465, -0.9258336, 0, 0, 0, 1, 1,
0.6106254, -1.235322, 1.713975, 0, 0, 0, 1, 1,
0.6123411, -1.468176, 1.220497, 0, 0, 0, 1, 1,
0.6147184, 1.772445, 1.751761, 0, 0, 0, 1, 1,
0.6175613, 0.4736803, 1.211604, 0, 0, 0, 1, 1,
0.6197009, -0.3850004, 0.89467, 1, 1, 1, 1, 1,
0.6207431, 0.0296336, 1.709593, 1, 1, 1, 1, 1,
0.6212034, -1.33621, 0.7015772, 1, 1, 1, 1, 1,
0.6247413, -1.564172, 2.527814, 1, 1, 1, 1, 1,
0.6254883, -0.6709167, 4.633707, 1, 1, 1, 1, 1,
0.6268416, -0.355448, 3.439048, 1, 1, 1, 1, 1,
0.626958, 0.4656437, 1.875062, 1, 1, 1, 1, 1,
0.6293544, 0.03761676, 1.0207, 1, 1, 1, 1, 1,
0.633586, -0.4429525, 1.688959, 1, 1, 1, 1, 1,
0.6339967, 1.064157, -0.1719957, 1, 1, 1, 1, 1,
0.6372378, -0.09238605, 0.4833245, 1, 1, 1, 1, 1,
0.637319, -0.7683978, 3.845055, 1, 1, 1, 1, 1,
0.6384988, 1.602275, -0.2752254, 1, 1, 1, 1, 1,
0.644409, 0.7393134, -0.1989087, 1, 1, 1, 1, 1,
0.645251, 0.518243, -0.03799699, 1, 1, 1, 1, 1,
0.6453281, 0.3854291, 2.457861, 0, 0, 1, 1, 1,
0.6462218, -1.456065, 3.837036, 1, 0, 0, 1, 1,
0.647885, 0.399119, 1.514778, 1, 0, 0, 1, 1,
0.648254, 0.7671478, -0.1724837, 1, 0, 0, 1, 1,
0.6572594, 1.08238, 1.452853, 1, 0, 0, 1, 1,
0.6597032, -0.833089, 2.988726, 1, 0, 0, 1, 1,
0.6612156, 2.338504, -0.7434253, 0, 0, 0, 1, 1,
0.6620467, 2.8332, -0.1601089, 0, 0, 0, 1, 1,
0.6662871, -0.2238723, 2.917002, 0, 0, 0, 1, 1,
0.6695585, -0.2838832, 3.137353, 0, 0, 0, 1, 1,
0.6711381, -1.663941, 0.9437122, 0, 0, 0, 1, 1,
0.6744357, 0.2179134, 1.382877, 0, 0, 0, 1, 1,
0.6777626, -0.569117, 1.461284, 0, 0, 0, 1, 1,
0.679992, 0.5171397, 0.6114069, 1, 1, 1, 1, 1,
0.6813171, 2.010948, -0.5290729, 1, 1, 1, 1, 1,
0.681991, 1.391717, -0.213658, 1, 1, 1, 1, 1,
0.6844419, -0.3958132, 1.978222, 1, 1, 1, 1, 1,
0.6910711, -1.707689, 2.988538, 1, 1, 1, 1, 1,
0.6916016, 1.292132, 0.5886401, 1, 1, 1, 1, 1,
0.6924428, -0.2920049, 2.362765, 1, 1, 1, 1, 1,
0.6955627, 0.2746956, -0.03237367, 1, 1, 1, 1, 1,
0.7006693, -0.2761559, 2.293926, 1, 1, 1, 1, 1,
0.7022656, 0.3943848, 3.152785, 1, 1, 1, 1, 1,
0.703711, -0.3323938, 3.377576, 1, 1, 1, 1, 1,
0.7048829, -1.089271, 4.165484, 1, 1, 1, 1, 1,
0.7067121, 0.3521589, 1.2952, 1, 1, 1, 1, 1,
0.7151474, -0.5640834, 1.871206, 1, 1, 1, 1, 1,
0.7191246, -1.013407, 3.32513, 1, 1, 1, 1, 1,
0.7211587, -1.013412, 4.349796, 0, 0, 1, 1, 1,
0.7257121, -0.1424892, 0.06262245, 1, 0, 0, 1, 1,
0.7312393, -0.3064947, 3.631653, 1, 0, 0, 1, 1,
0.7323832, -1.146449, 2.08266, 1, 0, 0, 1, 1,
0.7348669, -0.01754557, 3.40615, 1, 0, 0, 1, 1,
0.7354193, -0.7370615, 1.382904, 1, 0, 0, 1, 1,
0.7365894, 0.1709676, 1.002666, 0, 0, 0, 1, 1,
0.7377374, -1.729321, 2.483396, 0, 0, 0, 1, 1,
0.7380592, 1.37796, 0.4247301, 0, 0, 0, 1, 1,
0.7450711, -0.2274015, 3.205812, 0, 0, 0, 1, 1,
0.7564541, 1.091992, 1.016497, 0, 0, 0, 1, 1,
0.7576925, 0.3284267, 0.1812618, 0, 0, 0, 1, 1,
0.759961, 0.962482, 1.992913, 0, 0, 0, 1, 1,
0.7626205, -0.8589259, 4.171574, 1, 1, 1, 1, 1,
0.7627677, 0.3736425, 2.41944, 1, 1, 1, 1, 1,
0.7691063, -0.3485251, 3.261335, 1, 1, 1, 1, 1,
0.7706472, -0.2969751, 2.929616, 1, 1, 1, 1, 1,
0.7734714, 0.4310936, 0.6877947, 1, 1, 1, 1, 1,
0.7771158, -0.2525383, 1.17126, 1, 1, 1, 1, 1,
0.77971, 0.07850882, 1.276858, 1, 1, 1, 1, 1,
0.7797152, -2.129194, 2.712619, 1, 1, 1, 1, 1,
0.782647, -0.4028715, 3.375756, 1, 1, 1, 1, 1,
0.7833595, 0.7979452, -0.965396, 1, 1, 1, 1, 1,
0.7889289, 1.033749, 0.7667497, 1, 1, 1, 1, 1,
0.7962993, -0.1431104, 2.108488, 1, 1, 1, 1, 1,
0.8197071, -0.06171217, 2.731487, 1, 1, 1, 1, 1,
0.8226621, 0.01039532, 3.165289, 1, 1, 1, 1, 1,
0.8239987, 0.02348572, 1.317552, 1, 1, 1, 1, 1,
0.8243818, 0.01853734, 2.311808, 0, 0, 1, 1, 1,
0.8244296, -2.153843, 3.511774, 1, 0, 0, 1, 1,
0.8249844, -0.2113187, 3.730405, 1, 0, 0, 1, 1,
0.8250564, 0.07948964, -0.5017724, 1, 0, 0, 1, 1,
0.8328661, -0.7045954, 1.058515, 1, 0, 0, 1, 1,
0.8385066, -1.013799, 2.196394, 1, 0, 0, 1, 1,
0.841769, -0.3763799, 0.2434092, 0, 0, 0, 1, 1,
0.8457134, -0.7413836, 3.415601, 0, 0, 0, 1, 1,
0.8492122, 0.5261626, 0.244855, 0, 0, 0, 1, 1,
0.8531889, -1.411491, 2.859984, 0, 0, 0, 1, 1,
0.8732963, 0.3948065, 1.420309, 0, 0, 0, 1, 1,
0.8737795, -1.157299, 2.431559, 0, 0, 0, 1, 1,
0.8795543, 1.380059, 1.49622, 0, 0, 0, 1, 1,
0.8804083, 0.9558784, -0.4938482, 1, 1, 1, 1, 1,
0.8881463, 0.4202078, 0.74663, 1, 1, 1, 1, 1,
0.8888992, -0.08390163, 2.034807, 1, 1, 1, 1, 1,
0.8897564, 2.465934, -0.1237574, 1, 1, 1, 1, 1,
0.8987053, -1.158512, 1.31364, 1, 1, 1, 1, 1,
0.8998322, 0.3830555, 2.51985, 1, 1, 1, 1, 1,
0.9156653, -0.1599434, 2.806564, 1, 1, 1, 1, 1,
0.9270287, -0.3524887, 2.452231, 1, 1, 1, 1, 1,
0.9277904, 1.648178, 1.192963, 1, 1, 1, 1, 1,
0.9314603, 0.3363334, 3.07277, 1, 1, 1, 1, 1,
0.9371802, -0.1930328, 1.430191, 1, 1, 1, 1, 1,
0.9474446, 0.3688036, 0.9379586, 1, 1, 1, 1, 1,
0.9516913, -0.8652697, 2.327475, 1, 1, 1, 1, 1,
0.9551669, -0.6285, 2.398525, 1, 1, 1, 1, 1,
0.9609063, -0.520919, 2.065646, 1, 1, 1, 1, 1,
0.9622467, -0.2155311, 2.275939, 0, 0, 1, 1, 1,
0.965396, 1.173834, 1.287456, 1, 0, 0, 1, 1,
0.9660612, -0.8669247, 2.948838, 1, 0, 0, 1, 1,
0.9684111, 0.5623405, 2.662239, 1, 0, 0, 1, 1,
0.9717143, -1.494135, 1.113558, 1, 0, 0, 1, 1,
0.9777445, -0.3943474, 0.09664576, 1, 0, 0, 1, 1,
0.9824609, 0.5227776, -0.2958732, 0, 0, 0, 1, 1,
0.9825986, -1.02428, 1.394296, 0, 0, 0, 1, 1,
0.9857744, -1.814404, 1.783595, 0, 0, 0, 1, 1,
0.9864498, -0.9404091, 2.007001, 0, 0, 0, 1, 1,
0.9943252, 0.01416436, -0.6994035, 0, 0, 0, 1, 1,
0.9967675, -1.431652, 2.175497, 0, 0, 0, 1, 1,
1.019403, -0.8335539, 2.493024, 0, 0, 0, 1, 1,
1.019934, 0.07022513, 2.070115, 1, 1, 1, 1, 1,
1.023193, -0.7720706, 1.691319, 1, 1, 1, 1, 1,
1.028917, -0.7815989, 3.619358, 1, 1, 1, 1, 1,
1.030222, -0.9637403, 2.924584, 1, 1, 1, 1, 1,
1.03279, -0.4655932, 2.955037, 1, 1, 1, 1, 1,
1.039764, -0.5825912, 1.331955, 1, 1, 1, 1, 1,
1.044432, -0.2273674, 2.246771, 1, 1, 1, 1, 1,
1.049007, -0.414591, 1.664329, 1, 1, 1, 1, 1,
1.05641, -1.355601, 3.460113, 1, 1, 1, 1, 1,
1.061224, -0.4401415, 3.717994, 1, 1, 1, 1, 1,
1.066575, 0.351182, 2.841806, 1, 1, 1, 1, 1,
1.074568, -2.048239, 1.064697, 1, 1, 1, 1, 1,
1.078862, -0.7002683, 2.484718, 1, 1, 1, 1, 1,
1.083241, 0.9211316, 1.500909, 1, 1, 1, 1, 1,
1.098442, -1.654423, 1.039177, 1, 1, 1, 1, 1,
1.099245, -2.003514, 2.760682, 0, 0, 1, 1, 1,
1.102619, 0.5756963, 2.960041, 1, 0, 0, 1, 1,
1.110396, 0.1376863, 2.385018, 1, 0, 0, 1, 1,
1.111191, 0.9026962, 0.726487, 1, 0, 0, 1, 1,
1.114029, 0.9393888, 0.4075812, 1, 0, 0, 1, 1,
1.120401, 1.986761, 1.022803, 1, 0, 0, 1, 1,
1.125018, -1.11908, 3.193241, 0, 0, 0, 1, 1,
1.125023, -2.426754, 3.619136, 0, 0, 0, 1, 1,
1.125231, -0.05793474, 1.384407, 0, 0, 0, 1, 1,
1.127037, -0.7395812, 2.876331, 0, 0, 0, 1, 1,
1.137861, 0.2149433, 1.308581, 0, 0, 0, 1, 1,
1.144071, -0.7633814, 2.669313, 0, 0, 0, 1, 1,
1.150217, -0.8403427, 3.163692, 0, 0, 0, 1, 1,
1.157538, 0.2762524, 0.2052294, 1, 1, 1, 1, 1,
1.164786, 1.948201, -0.1621148, 1, 1, 1, 1, 1,
1.171287, 0.9649605, 0.8251963, 1, 1, 1, 1, 1,
1.174332, 0.09426457, 1.557578, 1, 1, 1, 1, 1,
1.182742, -0.5980202, 2.863875, 1, 1, 1, 1, 1,
1.198895, 0.2900324, 1.978877, 1, 1, 1, 1, 1,
1.211482, 0.1071393, -0.6415484, 1, 1, 1, 1, 1,
1.214652, -1.599617, 0.9777518, 1, 1, 1, 1, 1,
1.220425, 0.4848806, 2.654372, 1, 1, 1, 1, 1,
1.230027, 0.7840517, 1.884943, 1, 1, 1, 1, 1,
1.248836, -0.6684103, 3.091977, 1, 1, 1, 1, 1,
1.251247, -0.8516037, 2.546419, 1, 1, 1, 1, 1,
1.271524, -0.02934385, 2.382237, 1, 1, 1, 1, 1,
1.283131, 0.8418852, 1.19716, 1, 1, 1, 1, 1,
1.283822, -0.07715555, -0.8404991, 1, 1, 1, 1, 1,
1.288449, -0.4765974, 2.287842, 0, 0, 1, 1, 1,
1.289803, 0.09704047, 1.833244, 1, 0, 0, 1, 1,
1.299873, 1.158568, 0.004796464, 1, 0, 0, 1, 1,
1.302186, 1.268316, 1.657845, 1, 0, 0, 1, 1,
1.302954, 0.5066491, -0.6788285, 1, 0, 0, 1, 1,
1.304054, 1.304943, 1.867622, 1, 0, 0, 1, 1,
1.308639, 1.070862, 0.2609805, 0, 0, 0, 1, 1,
1.328403, -0.0422767, 1.981527, 0, 0, 0, 1, 1,
1.335228, 0.002930101, 0.2120797, 0, 0, 0, 1, 1,
1.337142, 0.2776494, 0.5541356, 0, 0, 0, 1, 1,
1.343047, 0.9993086, 0.6993914, 0, 0, 0, 1, 1,
1.352115, -0.6580783, 1.952377, 0, 0, 0, 1, 1,
1.354789, 0.5799714, -0.3768007, 0, 0, 0, 1, 1,
1.357335, -1.043463, 0.8490919, 1, 1, 1, 1, 1,
1.372432, 1.419405, 1.67732, 1, 1, 1, 1, 1,
1.372605, 0.1168161, 1.222923, 1, 1, 1, 1, 1,
1.372632, -0.8612825, 3.371235, 1, 1, 1, 1, 1,
1.378849, -0.05381805, 0.5935015, 1, 1, 1, 1, 1,
1.391358, -0.2825058, 2.245614, 1, 1, 1, 1, 1,
1.394519, 0.05910449, 1.017766, 1, 1, 1, 1, 1,
1.404083, 0.9908823, 2.250846, 1, 1, 1, 1, 1,
1.425194, 0.07250611, 2.720096, 1, 1, 1, 1, 1,
1.439295, -2.937047, 3.368319, 1, 1, 1, 1, 1,
1.439694, -0.6741856, -0.1211214, 1, 1, 1, 1, 1,
1.441015, -0.7646739, 2.848756, 1, 1, 1, 1, 1,
1.457379, 1.738178, 1.56251, 1, 1, 1, 1, 1,
1.461418, 0.8980302, 0.4063634, 1, 1, 1, 1, 1,
1.463974, 2.705507, 1.347467, 1, 1, 1, 1, 1,
1.469237, 2.591874, 1.127078, 0, 0, 1, 1, 1,
1.476214, 1.570629, -0.5728695, 1, 0, 0, 1, 1,
1.477224, -1.523397, 1.704435, 1, 0, 0, 1, 1,
1.479409, 0.4480498, 1.803871, 1, 0, 0, 1, 1,
1.486242, 0.5274926, 1.448007, 1, 0, 0, 1, 1,
1.501205, -1.085852, 4.360897, 1, 0, 0, 1, 1,
1.515604, 0.5883555, 2.040657, 0, 0, 0, 1, 1,
1.519767, -0.5081646, 1.545189, 0, 0, 0, 1, 1,
1.543072, 0.7392681, -0.6563607, 0, 0, 0, 1, 1,
1.555966, -1.027259, 3.174632, 0, 0, 0, 1, 1,
1.561103, -0.4767169, 1.029016, 0, 0, 0, 1, 1,
1.576215, 0.4537601, 1.62717, 0, 0, 0, 1, 1,
1.587387, 0.2885959, 1.828742, 0, 0, 0, 1, 1,
1.601812, 1.368974, 1.509409, 1, 1, 1, 1, 1,
1.604518, -0.2693889, 1.615267, 1, 1, 1, 1, 1,
1.6179, 0.557128, 2.870524, 1, 1, 1, 1, 1,
1.626167, -0.3437228, 1.616586, 1, 1, 1, 1, 1,
1.637494, 0.5924358, -0.0444863, 1, 1, 1, 1, 1,
1.650662, 1.455792, -1.488519, 1, 1, 1, 1, 1,
1.669449, -0.2565922, 3.134598, 1, 1, 1, 1, 1,
1.68432, 0.3050954, 1.073716, 1, 1, 1, 1, 1,
1.688145, -0.9668739, 2.284566, 1, 1, 1, 1, 1,
1.694249, -1.427702, 0.7038146, 1, 1, 1, 1, 1,
1.704342, 0.1208351, 1.641838, 1, 1, 1, 1, 1,
1.712981, -1.31663, 3.523274, 1, 1, 1, 1, 1,
1.713058, 0.9093416, 1.367183, 1, 1, 1, 1, 1,
1.714267, 0.5620133, 0.9419776, 1, 1, 1, 1, 1,
1.72652, -0.5450412, 1.904173, 1, 1, 1, 1, 1,
1.734042, -0.3872282, 1.855799, 0, 0, 1, 1, 1,
1.74028, -0.2663997, 1.471534, 1, 0, 0, 1, 1,
1.740702, 1.387681, 0.3980445, 1, 0, 0, 1, 1,
1.74344, -0.4812159, 1.354463, 1, 0, 0, 1, 1,
1.762263, -0.07729836, 0.3604088, 1, 0, 0, 1, 1,
1.791338, -0.1236781, 0.855533, 1, 0, 0, 1, 1,
1.794109, 0.8273852, 0.4599333, 0, 0, 0, 1, 1,
1.799228, -1.033169, 1.005458, 0, 0, 0, 1, 1,
1.805653, -0.5456881, 1.808696, 0, 0, 0, 1, 1,
1.838213, 1.815078, 0.4641958, 0, 0, 0, 1, 1,
1.844577, -2.386899, 1.987312, 0, 0, 0, 1, 1,
1.858999, -1.19003, 2.020238, 0, 0, 0, 1, 1,
1.912879, 1.090637, 1.284374, 0, 0, 0, 1, 1,
1.919727, 1.407428, 1.373435, 1, 1, 1, 1, 1,
1.921033, -1.430803, 0.4510825, 1, 1, 1, 1, 1,
1.938248, 1.201529, -0.1701397, 1, 1, 1, 1, 1,
1.941675, 0.382196, 0.145035, 1, 1, 1, 1, 1,
1.944443, -1.369117, 1.012102, 1, 1, 1, 1, 1,
1.978499, 0.7396495, -1.439912, 1, 1, 1, 1, 1,
1.993294, -0.6911138, 0.5663465, 1, 1, 1, 1, 1,
2.00115, 1.701303, -0.04398376, 1, 1, 1, 1, 1,
2.004838, 1.196926, -0.3455713, 1, 1, 1, 1, 1,
2.037998, 1.022561, 1.21563, 1, 1, 1, 1, 1,
2.050771, -0.8783469, 2.185579, 1, 1, 1, 1, 1,
2.065344, 0.3840176, 2.275716, 1, 1, 1, 1, 1,
2.10232, -0.6032274, 1.329489, 1, 1, 1, 1, 1,
2.110224, 1.974129, 0.1239313, 1, 1, 1, 1, 1,
2.116098, -0.7876791, 2.586655, 1, 1, 1, 1, 1,
2.12786, -0.5371638, 1.736522, 0, 0, 1, 1, 1,
2.131107, 0.4333892, 0.4775823, 1, 0, 0, 1, 1,
2.135784, -0.1499925, 2.670074, 1, 0, 0, 1, 1,
2.148479, -1.256935, 3.469195, 1, 0, 0, 1, 1,
2.206724, -0.008579104, 1.219801, 1, 0, 0, 1, 1,
2.322772, 1.244851, 2.286948, 1, 0, 0, 1, 1,
2.335322, 0.09715595, 1.876843, 0, 0, 0, 1, 1,
2.336652, 1.138359, 1.305634, 0, 0, 0, 1, 1,
2.354073, -0.2460798, -0.1502894, 0, 0, 0, 1, 1,
2.362561, -0.9017144, 0.6130641, 0, 0, 0, 1, 1,
2.425425, -0.6875389, 4.045845, 0, 0, 0, 1, 1,
2.439968, 0.1250052, 2.254183, 0, 0, 0, 1, 1,
2.45834, 0.63825, 1.847184, 0, 0, 0, 1, 1,
2.519998, 0.145489, 1.272917, 1, 1, 1, 1, 1,
2.637802, -0.3589741, 2.800241, 1, 1, 1, 1, 1,
2.723122, -1.833769, 3.10335, 1, 1, 1, 1, 1,
2.834863, 0.3874963, -0.08151436, 1, 1, 1, 1, 1,
2.85843, 0.1707247, 4.295103, 1, 1, 1, 1, 1,
3.296301, 0.654906, -0.940201, 1, 1, 1, 1, 1,
3.369938, 0.8014607, -0.9391429, 1, 1, 1, 1, 1
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
var radius = 9.482613;
var distance = 33.30727;
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
mvMatrix.translate( 0.07765079, 0.03662705, 0.1193733 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.30727);
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
