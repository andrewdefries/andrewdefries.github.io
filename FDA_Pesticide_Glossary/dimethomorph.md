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
-2.993776, 0.3054335, -0.4621128, 1, 0, 0, 1,
-2.761339, -1.415289, -2.149163, 1, 0.007843138, 0, 1,
-2.753898, 0.6580484, -0.6201836, 1, 0.01176471, 0, 1,
-2.709428, -0.8314471, -3.642261, 1, 0.01960784, 0, 1,
-2.648506, 0.6258963, -2.431075, 1, 0.02352941, 0, 1,
-2.633469, -0.3135379, -0.6313221, 1, 0.03137255, 0, 1,
-2.62074, 1.116799, 1.59453, 1, 0.03529412, 0, 1,
-2.572475, -0.7536347, -2.353151, 1, 0.04313726, 0, 1,
-2.530396, 2.573144, 0.218902, 1, 0.04705882, 0, 1,
-2.51176, -1.188092, -2.900425, 1, 0.05490196, 0, 1,
-2.495202, -0.2237716, -0.9560141, 1, 0.05882353, 0, 1,
-2.363455, 0.1563467, -0.2049547, 1, 0.06666667, 0, 1,
-2.348487, -0.8891572, -0.4499629, 1, 0.07058824, 0, 1,
-2.266819, -0.4821236, -0.4920867, 1, 0.07843138, 0, 1,
-2.232282, 0.7354677, 0.3844503, 1, 0.08235294, 0, 1,
-2.22858, 0.2676687, -1.683526, 1, 0.09019608, 0, 1,
-2.227064, 0.6429487, -3.609838, 1, 0.09411765, 0, 1,
-2.209988, -0.3189554, 0.9939615, 1, 0.1019608, 0, 1,
-2.187929, 1.257717, -4.231598, 1, 0.1098039, 0, 1,
-2.170648, 1.336545, -0.9815378, 1, 0.1137255, 0, 1,
-2.154621, -0.1777432, -1.148539, 1, 0.1215686, 0, 1,
-2.139637, 1.010849, -0.8280934, 1, 0.1254902, 0, 1,
-2.133885, 0.08745328, -2.878521, 1, 0.1333333, 0, 1,
-2.109823, 0.593343, -1.13837, 1, 0.1372549, 0, 1,
-2.105214, 1.698525, -0.2307625, 1, 0.145098, 0, 1,
-2.070691, 1.340034, -0.8973781, 1, 0.1490196, 0, 1,
-2.058074, 0.507317, -1.128142, 1, 0.1568628, 0, 1,
-2.024775, 0.1979374, -0.8528786, 1, 0.1607843, 0, 1,
-1.999234, 1.420161, -2.216343, 1, 0.1686275, 0, 1,
-1.962936, 1.515162, -2.601836, 1, 0.172549, 0, 1,
-1.925187, 1.834074, -1.332552, 1, 0.1803922, 0, 1,
-1.915426, 1.432033, 0.5723702, 1, 0.1843137, 0, 1,
-1.89383, 0.001940288, -2.253587, 1, 0.1921569, 0, 1,
-1.875049, 1.345047, -0.6044576, 1, 0.1960784, 0, 1,
-1.85832, 0.3566921, -0.813277, 1, 0.2039216, 0, 1,
-1.856768, -0.2880125, -1.604733, 1, 0.2117647, 0, 1,
-1.841003, 0.242528, -1.370528, 1, 0.2156863, 0, 1,
-1.81724, 0.2791909, -0.6775255, 1, 0.2235294, 0, 1,
-1.814362, 2.598047, 0.556549, 1, 0.227451, 0, 1,
-1.813503, -0.4719017, -2.46158, 1, 0.2352941, 0, 1,
-1.807309, 1.08381, -0.2465353, 1, 0.2392157, 0, 1,
-1.797645, -0.3749285, -2.763741, 1, 0.2470588, 0, 1,
-1.794477, 1.654688, -0.5242752, 1, 0.2509804, 0, 1,
-1.793997, 0.6596187, -0.2971731, 1, 0.2588235, 0, 1,
-1.76789, 0.7727273, -1.658788, 1, 0.2627451, 0, 1,
-1.767648, -1.767662, -1.891176, 1, 0.2705882, 0, 1,
-1.761789, 1.088406, -1.127487, 1, 0.2745098, 0, 1,
-1.74984, 0.9263259, 1.108571, 1, 0.282353, 0, 1,
-1.745271, 2.584932, -0.4799432, 1, 0.2862745, 0, 1,
-1.742881, -0.9956309, -1.791229, 1, 0.2941177, 0, 1,
-1.734547, 1.197204, -0.6863683, 1, 0.3019608, 0, 1,
-1.722678, -0.2856994, -1.752311, 1, 0.3058824, 0, 1,
-1.710601, -0.5294172, -0.6597375, 1, 0.3137255, 0, 1,
-1.709699, 0.07757996, -3.572529, 1, 0.3176471, 0, 1,
-1.706889, 0.9147865, -1.766357, 1, 0.3254902, 0, 1,
-1.706506, -2.909352, -2.798061, 1, 0.3294118, 0, 1,
-1.705588, -0.4455943, -2.474794, 1, 0.3372549, 0, 1,
-1.70453, 0.0762851, -1.90823, 1, 0.3411765, 0, 1,
-1.702065, -0.8007994, -2.908854, 1, 0.3490196, 0, 1,
-1.697887, 1.051196, -0.2669182, 1, 0.3529412, 0, 1,
-1.680856, 1.530056, -2.036279, 1, 0.3607843, 0, 1,
-1.67281, 0.2370407, -1.507435, 1, 0.3647059, 0, 1,
-1.668724, 0.4122318, -2.379654, 1, 0.372549, 0, 1,
-1.667745, -0.5267289, -3.114632, 1, 0.3764706, 0, 1,
-1.657971, -0.4439044, -2.372412, 1, 0.3843137, 0, 1,
-1.651279, 0.5892258, -0.4998325, 1, 0.3882353, 0, 1,
-1.648745, 0.6834554, -0.6710246, 1, 0.3960784, 0, 1,
-1.640015, -0.06054572, -3.237268, 1, 0.4039216, 0, 1,
-1.635986, -0.7017839, -2.911518, 1, 0.4078431, 0, 1,
-1.632545, 0.2916157, -2.578032, 1, 0.4156863, 0, 1,
-1.631624, -0.3792525, -2.42485, 1, 0.4196078, 0, 1,
-1.630426, -0.1307829, -0.7777184, 1, 0.427451, 0, 1,
-1.628759, -2.804064, -1.50111, 1, 0.4313726, 0, 1,
-1.622723, -0.9230762, -1.188554, 1, 0.4392157, 0, 1,
-1.621952, 0.9507649, -0.1705904, 1, 0.4431373, 0, 1,
-1.621699, 2.201028, -1.524907, 1, 0.4509804, 0, 1,
-1.615536, 0.559504, -1.472949, 1, 0.454902, 0, 1,
-1.615126, -1.660686, -2.159748, 1, 0.4627451, 0, 1,
-1.599717, 0.7957425, -0.04175562, 1, 0.4666667, 0, 1,
-1.593052, -0.1426517, -0.697361, 1, 0.4745098, 0, 1,
-1.584456, -0.9254023, -2.183733, 1, 0.4784314, 0, 1,
-1.565974, 0.4679804, -2.0655, 1, 0.4862745, 0, 1,
-1.558488, 0.02268147, -0.9020366, 1, 0.4901961, 0, 1,
-1.54805, -0.428428, -2.438992, 1, 0.4980392, 0, 1,
-1.530105, -0.3346417, -1.962433, 1, 0.5058824, 0, 1,
-1.515175, -1.140489, -1.196787, 1, 0.509804, 0, 1,
-1.51135, -1.34598, -0.9111893, 1, 0.5176471, 0, 1,
-1.508047, 2.707122, -1.948231, 1, 0.5215687, 0, 1,
-1.506152, 1.218203, -2.415995, 1, 0.5294118, 0, 1,
-1.501686, -0.1547688, -1.178901, 1, 0.5333334, 0, 1,
-1.488924, 0.3224, -1.814264, 1, 0.5411765, 0, 1,
-1.478167, -0.9893465, -0.8485869, 1, 0.5450981, 0, 1,
-1.477136, 1.21653, -3.038128, 1, 0.5529412, 0, 1,
-1.47112, -0.8551715, -3.163329, 1, 0.5568628, 0, 1,
-1.470424, -0.2123463, -1.88937, 1, 0.5647059, 0, 1,
-1.465419, -0.168369, -3.395313, 1, 0.5686275, 0, 1,
-1.433331, -2.024266, -1.680086, 1, 0.5764706, 0, 1,
-1.429196, -0.4206181, -0.8335282, 1, 0.5803922, 0, 1,
-1.424527, 0.05321682, -0.8737085, 1, 0.5882353, 0, 1,
-1.419774, -0.2136409, -3.39344, 1, 0.5921569, 0, 1,
-1.415741, -0.9819499, -2.575155, 1, 0.6, 0, 1,
-1.411417, -0.1704557, -2.044555, 1, 0.6078432, 0, 1,
-1.400243, 0.9291976, -2.575686, 1, 0.6117647, 0, 1,
-1.396613, -0.3504407, -1.647973, 1, 0.6196079, 0, 1,
-1.386581, 0.9221337, -1.573468, 1, 0.6235294, 0, 1,
-1.378221, -0.7638664, -1.677247, 1, 0.6313726, 0, 1,
-1.372117, -1.380018, -1.437635, 1, 0.6352941, 0, 1,
-1.362664, 2.106641, 0.08502211, 1, 0.6431373, 0, 1,
-1.360678, 1.608112, 0.4059154, 1, 0.6470588, 0, 1,
-1.324581, 0.2211641, -2.25789, 1, 0.654902, 0, 1,
-1.31838, -0.5811658, -2.311959, 1, 0.6588235, 0, 1,
-1.312255, 0.4832227, -1.862998, 1, 0.6666667, 0, 1,
-1.306364, -1.473535, -4.674917, 1, 0.6705883, 0, 1,
-1.304109, 0.2570541, -1.804807, 1, 0.6784314, 0, 1,
-1.300095, 2.266102, -1.386007, 1, 0.682353, 0, 1,
-1.288741, 0.8769218, -0.2488464, 1, 0.6901961, 0, 1,
-1.288221, -0.305966, -1.419984, 1, 0.6941177, 0, 1,
-1.286967, -1.387369, -2.907192, 1, 0.7019608, 0, 1,
-1.284731, -1.130813, -2.792768, 1, 0.7098039, 0, 1,
-1.283111, 0.1300297, -2.892938, 1, 0.7137255, 0, 1,
-1.280891, 1.656168, -1.110178, 1, 0.7215686, 0, 1,
-1.270875, 1.04169, -1.070868, 1, 0.7254902, 0, 1,
-1.26631, 0.1526366, -2.057651, 1, 0.7333333, 0, 1,
-1.256451, -0.2124975, -2.391046, 1, 0.7372549, 0, 1,
-1.239405, -1.670608, -2.344609, 1, 0.7450981, 0, 1,
-1.228744, -0.3699986, -3.03012, 1, 0.7490196, 0, 1,
-1.22674, -0.3731922, -1.824089, 1, 0.7568628, 0, 1,
-1.225844, -0.03393685, -1.092702, 1, 0.7607843, 0, 1,
-1.22543, 0.6604076, -0.5093181, 1, 0.7686275, 0, 1,
-1.222123, 0.612492, -0.5467457, 1, 0.772549, 0, 1,
-1.219035, -0.2335199, -0.912368, 1, 0.7803922, 0, 1,
-1.214604, -0.4840135, -2.453621, 1, 0.7843137, 0, 1,
-1.211006, -0.2927964, -1.329596, 1, 0.7921569, 0, 1,
-1.202955, 0.5839417, -1.756818, 1, 0.7960784, 0, 1,
-1.200577, -0.7571938, -1.713596, 1, 0.8039216, 0, 1,
-1.19582, 0.1553778, 0.8200898, 1, 0.8117647, 0, 1,
-1.188025, -0.1792376, -2.454512, 1, 0.8156863, 0, 1,
-1.184907, 0.03995741, 0.4204617, 1, 0.8235294, 0, 1,
-1.17898, -0.715398, -1.894226, 1, 0.827451, 0, 1,
-1.178598, -0.9634941, -1.236451, 1, 0.8352941, 0, 1,
-1.171139, 1.240804, 1.062943, 1, 0.8392157, 0, 1,
-1.165337, -0.09639369, -1.894211, 1, 0.8470588, 0, 1,
-1.156915, 1.150075, -2.932965, 1, 0.8509804, 0, 1,
-1.154014, 1.575143, 0.3927746, 1, 0.8588235, 0, 1,
-1.139121, -1.196964, -2.558786, 1, 0.8627451, 0, 1,
-1.129536, -0.7374349, -2.234465, 1, 0.8705882, 0, 1,
-1.126684, -0.2681847, -1.045893, 1, 0.8745098, 0, 1,
-1.119869, -0.9161532, -0.6872802, 1, 0.8823529, 0, 1,
-1.119758, -0.8209969, -1.932458, 1, 0.8862745, 0, 1,
-1.115672, 1.180546, 0.08347016, 1, 0.8941177, 0, 1,
-1.113972, 1.057422, -0.4074675, 1, 0.8980392, 0, 1,
-1.109389, 0.2647264, -1.247973, 1, 0.9058824, 0, 1,
-1.108918, 0.09392031, -2.765522, 1, 0.9137255, 0, 1,
-1.108334, -0.5593802, -2.96933, 1, 0.9176471, 0, 1,
-1.095024, 2.164671, 0.1569778, 1, 0.9254902, 0, 1,
-1.092732, 1.192182, -2.596476, 1, 0.9294118, 0, 1,
-1.074458, -1.784117, -1.119888, 1, 0.9372549, 0, 1,
-1.057975, -1.38997, -3.316373, 1, 0.9411765, 0, 1,
-1.057685, 2.475109, -2.16817, 1, 0.9490196, 0, 1,
-1.055583, -1.189088, -2.884223, 1, 0.9529412, 0, 1,
-1.044465, -0.233013, -2.118843, 1, 0.9607843, 0, 1,
-1.042241, 0.3722141, -1.500214, 1, 0.9647059, 0, 1,
-1.038752, 0.4383574, -0.9457734, 1, 0.972549, 0, 1,
-1.035998, 0.9814346, -0.4985349, 1, 0.9764706, 0, 1,
-1.033943, 1.905666, 0.6066464, 1, 0.9843137, 0, 1,
-1.031982, 0.6634891, -1.2373, 1, 0.9882353, 0, 1,
-1.023922, -1.317127, -0.4830032, 1, 0.9960784, 0, 1,
-1.022048, -0.6033701, -1.783846, 0.9960784, 1, 0, 1,
-1.004547, -0.595135, -4.695153, 0.9921569, 1, 0, 1,
-0.9858478, -0.8467405, -2.480687, 0.9843137, 1, 0, 1,
-0.9832333, 1.17234, -1.481627, 0.9803922, 1, 0, 1,
-0.9831083, -0.9423593, -1.216729, 0.972549, 1, 0, 1,
-0.9760402, -0.2244021, -1.526325, 0.9686275, 1, 0, 1,
-0.9733567, 1.142979, 0.06714544, 0.9607843, 1, 0, 1,
-0.9720232, 1.440348, 0.2011362, 0.9568627, 1, 0, 1,
-0.9658785, 0.7123878, 0.4998622, 0.9490196, 1, 0, 1,
-0.9642822, -2.140228, -2.949695, 0.945098, 1, 0, 1,
-0.963061, 0.09409578, -0.6593978, 0.9372549, 1, 0, 1,
-0.9572887, -0.3251655, -1.916288, 0.9333333, 1, 0, 1,
-0.9551948, -1.706472, -3.898273, 0.9254902, 1, 0, 1,
-0.9522014, 0.01281059, -1.268904, 0.9215686, 1, 0, 1,
-0.9465626, 0.03562748, -3.135408, 0.9137255, 1, 0, 1,
-0.9393939, -0.2528484, 0.1893369, 0.9098039, 1, 0, 1,
-0.9377972, 2.169554, -1.04057, 0.9019608, 1, 0, 1,
-0.9362099, -0.7622125, -1.033594, 0.8941177, 1, 0, 1,
-0.9325199, 0.002235554, -2.002465, 0.8901961, 1, 0, 1,
-0.9284113, -0.3246695, -4.081473, 0.8823529, 1, 0, 1,
-0.9263623, -0.5154548, -1.615946, 0.8784314, 1, 0, 1,
-0.9249681, 1.468025, -1.04557, 0.8705882, 1, 0, 1,
-0.9175341, 0.9456271, -0.8319761, 0.8666667, 1, 0, 1,
-0.9136274, 0.9406632, 0.09109881, 0.8588235, 1, 0, 1,
-0.9124602, -0.4832317, -2.212589, 0.854902, 1, 0, 1,
-0.9118816, -1.671466, -1.83145, 0.8470588, 1, 0, 1,
-0.9080101, -0.3645114, -1.848979, 0.8431373, 1, 0, 1,
-0.9018028, -2.391935, -3.096574, 0.8352941, 1, 0, 1,
-0.897144, 0.3449453, -0.1845989, 0.8313726, 1, 0, 1,
-0.8970906, -0.6589426, -2.762831, 0.8235294, 1, 0, 1,
-0.8965819, -0.7425684, -2.401363, 0.8196079, 1, 0, 1,
-0.894317, -0.4127422, -1.378012, 0.8117647, 1, 0, 1,
-0.8936558, 0.8010557, -0.5191383, 0.8078431, 1, 0, 1,
-0.8879003, -0.063223, -2.255778, 0.8, 1, 0, 1,
-0.8835175, -0.3546605, -2.469039, 0.7921569, 1, 0, 1,
-0.8806581, 1.235512, -0.2958235, 0.7882353, 1, 0, 1,
-0.8622743, 0.7885828, 1.799292, 0.7803922, 1, 0, 1,
-0.8441625, -0.2622316, -2.88122, 0.7764706, 1, 0, 1,
-0.8372653, 1.20382, -2.140874, 0.7686275, 1, 0, 1,
-0.8287192, 0.1233755, 0.5948199, 0.7647059, 1, 0, 1,
-0.8259596, -1.797102, -2.881368, 0.7568628, 1, 0, 1,
-0.8206291, -0.7899857, -0.5582982, 0.7529412, 1, 0, 1,
-0.8187459, -0.1108183, -2.011948, 0.7450981, 1, 0, 1,
-0.817602, -0.2980928, -1.844727, 0.7411765, 1, 0, 1,
-0.8076014, -0.2226793, -0.5897839, 0.7333333, 1, 0, 1,
-0.802496, 0.8380157, -1.084889, 0.7294118, 1, 0, 1,
-0.8023143, -1.071003, -3.967986, 0.7215686, 1, 0, 1,
-0.7995614, 0.05531199, -2.01915, 0.7176471, 1, 0, 1,
-0.7980125, 0.1931173, -0.2149913, 0.7098039, 1, 0, 1,
-0.7973714, -2.058061, -3.150372, 0.7058824, 1, 0, 1,
-0.7909226, -0.3881902, -1.320153, 0.6980392, 1, 0, 1,
-0.7874127, -1.103405, -3.246949, 0.6901961, 1, 0, 1,
-0.7862976, -1.754839, -1.576232, 0.6862745, 1, 0, 1,
-0.7813671, -0.4150153, -1.649984, 0.6784314, 1, 0, 1,
-0.7812583, 1.83325, 1.344776, 0.6745098, 1, 0, 1,
-0.7778097, -0.9050909, -2.949835, 0.6666667, 1, 0, 1,
-0.7731468, 0.3110651, -0.9865426, 0.6627451, 1, 0, 1,
-0.7703546, 0.1228432, -0.1085162, 0.654902, 1, 0, 1,
-0.7682987, -1.258789, -3.063741, 0.6509804, 1, 0, 1,
-0.7677691, -1.733087, -3.507936, 0.6431373, 1, 0, 1,
-0.767152, 1.55646, -2.308577, 0.6392157, 1, 0, 1,
-0.765533, 1.94819, 0.3975492, 0.6313726, 1, 0, 1,
-0.7627902, 1.590239, 0.9798957, 0.627451, 1, 0, 1,
-0.7625822, 0.4449089, 0.1232553, 0.6196079, 1, 0, 1,
-0.7560956, 0.02385639, -3.923421, 0.6156863, 1, 0, 1,
-0.755518, 0.7016205, 0.9754077, 0.6078432, 1, 0, 1,
-0.750664, -0.8265232, -0.4468473, 0.6039216, 1, 0, 1,
-0.7497463, -1.119715, -2.736749, 0.5960785, 1, 0, 1,
-0.7493234, -0.08001387, -1.141346, 0.5882353, 1, 0, 1,
-0.7487554, 0.4389461, -1.477924, 0.5843138, 1, 0, 1,
-0.7478824, 1.03741, -0.3504399, 0.5764706, 1, 0, 1,
-0.7469565, 1.209525, -0.2448859, 0.572549, 1, 0, 1,
-0.7425405, 0.8557115, -2.910375, 0.5647059, 1, 0, 1,
-0.7370138, -0.3812342, -1.467386, 0.5607843, 1, 0, 1,
-0.7345461, 0.3717045, -2.821777, 0.5529412, 1, 0, 1,
-0.7239581, 0.3226708, -1.009903, 0.5490196, 1, 0, 1,
-0.7217836, 0.8414639, -0.9078482, 0.5411765, 1, 0, 1,
-0.7177639, -0.3521049, -1.955357, 0.5372549, 1, 0, 1,
-0.7171752, 0.2115923, -2.247936, 0.5294118, 1, 0, 1,
-0.6956951, -1.258489, -0.7341648, 0.5254902, 1, 0, 1,
-0.6914558, -1.918281, -1.520764, 0.5176471, 1, 0, 1,
-0.6848477, 1.031872, -1.105828, 0.5137255, 1, 0, 1,
-0.6835452, 0.261835, -1.980673, 0.5058824, 1, 0, 1,
-0.6830994, 0.6358671, 0.5179813, 0.5019608, 1, 0, 1,
-0.6775048, 0.6639955, -2.548248, 0.4941176, 1, 0, 1,
-0.6744828, 0.418285, -2.036981, 0.4862745, 1, 0, 1,
-0.6741798, 0.8366278, 0.3956803, 0.4823529, 1, 0, 1,
-0.670677, 0.1040512, -1.148069, 0.4745098, 1, 0, 1,
-0.6684808, -0.2064053, -2.104824, 0.4705882, 1, 0, 1,
-0.6683753, 0.03902365, -3.85714, 0.4627451, 1, 0, 1,
-0.6633433, 0.8254485, -1.056363, 0.4588235, 1, 0, 1,
-0.6610517, 0.2444632, 0.3054724, 0.4509804, 1, 0, 1,
-0.6574944, 0.9926825, -0.4017152, 0.4470588, 1, 0, 1,
-0.6487472, -0.02328404, -1.257504, 0.4392157, 1, 0, 1,
-0.6477533, -2.193107, -2.055177, 0.4352941, 1, 0, 1,
-0.6468773, 0.1919203, -2.90411, 0.427451, 1, 0, 1,
-0.6460222, 0.8421798, -1.934837, 0.4235294, 1, 0, 1,
-0.6453624, 0.3698451, -0.6739545, 0.4156863, 1, 0, 1,
-0.642563, 0.04702931, -1.642488, 0.4117647, 1, 0, 1,
-0.6421473, 0.9708503, -0.8886152, 0.4039216, 1, 0, 1,
-0.6272715, -0.3177138, -3.73577, 0.3960784, 1, 0, 1,
-0.6266249, 0.8538882, -1.44999, 0.3921569, 1, 0, 1,
-0.6237602, 0.4504264, -1.390686, 0.3843137, 1, 0, 1,
-0.621226, -0.3966285, -2.279345, 0.3803922, 1, 0, 1,
-0.6183984, -0.1486589, 0.2010491, 0.372549, 1, 0, 1,
-0.6164509, 0.4830143, 0.2450656, 0.3686275, 1, 0, 1,
-0.6129033, -0.04262231, -0.7710812, 0.3607843, 1, 0, 1,
-0.6109784, -0.524044, -2.344089, 0.3568628, 1, 0, 1,
-0.6097609, -0.9283957, -4.112006, 0.3490196, 1, 0, 1,
-0.6088078, 0.00799384, -2.15789, 0.345098, 1, 0, 1,
-0.6084689, 0.7393066, 0.1671859, 0.3372549, 1, 0, 1,
-0.6077688, 0.8507185, -2.381919, 0.3333333, 1, 0, 1,
-0.6063578, 0.5374417, -0.5075909, 0.3254902, 1, 0, 1,
-0.6043854, -0.3608866, -2.597374, 0.3215686, 1, 0, 1,
-0.602071, -0.02383267, -3.118609, 0.3137255, 1, 0, 1,
-0.5974994, 1.301087, -1.341936, 0.3098039, 1, 0, 1,
-0.5933852, 0.1636276, -1.145821, 0.3019608, 1, 0, 1,
-0.588703, -0.9163525, -1.117829, 0.2941177, 1, 0, 1,
-0.5853422, -0.7588012, -2.304631, 0.2901961, 1, 0, 1,
-0.5851584, -1.094475, -2.618429, 0.282353, 1, 0, 1,
-0.5850262, -0.838663, -2.433996, 0.2784314, 1, 0, 1,
-0.5833644, -0.3038549, -0.7531953, 0.2705882, 1, 0, 1,
-0.5806453, 1.677453, -1.321713, 0.2666667, 1, 0, 1,
-0.5802042, -0.2608616, -1.77633, 0.2588235, 1, 0, 1,
-0.5738752, -0.2133842, -1.27982, 0.254902, 1, 0, 1,
-0.569496, 0.04435606, -0.5693893, 0.2470588, 1, 0, 1,
-0.5661476, -0.2887505, -0.4005909, 0.2431373, 1, 0, 1,
-0.5604951, 1.825838, -0.9620769, 0.2352941, 1, 0, 1,
-0.5600242, -1.412399, -3.670951, 0.2313726, 1, 0, 1,
-0.5550365, -0.03957412, -2.913729, 0.2235294, 1, 0, 1,
-0.5537494, 1.306556, 0.9371069, 0.2196078, 1, 0, 1,
-0.5518292, -0.1692843, -1.712301, 0.2117647, 1, 0, 1,
-0.5515198, -1.541093, -3.353648, 0.2078431, 1, 0, 1,
-0.5512857, 0.2477417, 1.026817, 0.2, 1, 0, 1,
-0.5511563, 0.3416444, -0.2075122, 0.1921569, 1, 0, 1,
-0.5492159, -0.2721553, -1.291624, 0.1882353, 1, 0, 1,
-0.5479127, -1.363851, -3.611503, 0.1803922, 1, 0, 1,
-0.5447227, 1.619839, -0.9716556, 0.1764706, 1, 0, 1,
-0.5406299, -0.9819055, -2.914304, 0.1686275, 1, 0, 1,
-0.5369235, 0.9469221, 0.543468, 0.1647059, 1, 0, 1,
-0.5355331, 0.2613051, -3.465635, 0.1568628, 1, 0, 1,
-0.5338541, -0.1689848, -1.438835, 0.1529412, 1, 0, 1,
-0.5330477, -1.03973, -1.938247, 0.145098, 1, 0, 1,
-0.5255916, -0.8599839, -4.163624, 0.1411765, 1, 0, 1,
-0.5183043, 0.8900333, -0.6285099, 0.1333333, 1, 0, 1,
-0.5172501, -0.7756835, -3.08233, 0.1294118, 1, 0, 1,
-0.5113451, -1.748873, -3.90755, 0.1215686, 1, 0, 1,
-0.510419, 1.681219, 0.5140268, 0.1176471, 1, 0, 1,
-0.505848, 0.05482728, -0.7402526, 0.1098039, 1, 0, 1,
-0.5057707, 1.624532, -0.5685158, 0.1058824, 1, 0, 1,
-0.4993308, 2.038757, 0.3856152, 0.09803922, 1, 0, 1,
-0.4978784, 2.116382, -1.621628, 0.09019608, 1, 0, 1,
-0.4911073, 1.325462, 0.66417, 0.08627451, 1, 0, 1,
-0.4847433, 0.6228218, 0.7404934, 0.07843138, 1, 0, 1,
-0.4811383, -1.101373, -2.004062, 0.07450981, 1, 0, 1,
-0.4809688, -0.1328175, -1.845875, 0.06666667, 1, 0, 1,
-0.4725058, -1.101921, -2.165148, 0.0627451, 1, 0, 1,
-0.4722677, 0.3996358, -0.7205673, 0.05490196, 1, 0, 1,
-0.4706309, 1.024464, 0.5533271, 0.05098039, 1, 0, 1,
-0.4689256, -0.1578335, -1.497883, 0.04313726, 1, 0, 1,
-0.4650694, 0.6336255, -1.757859, 0.03921569, 1, 0, 1,
-0.4641054, -0.2570204, -1.626426, 0.03137255, 1, 0, 1,
-0.4606071, -1.546511, -2.845018, 0.02745098, 1, 0, 1,
-0.4598214, -0.5548702, -2.297599, 0.01960784, 1, 0, 1,
-0.4585308, 2.006929, 0.3353205, 0.01568628, 1, 0, 1,
-0.4507225, -0.03630196, -1.39715, 0.007843138, 1, 0, 1,
-0.4498842, -0.03320853, -1.337638, 0.003921569, 1, 0, 1,
-0.4476476, -0.2415743, -2.113836, 0, 1, 0.003921569, 1,
-0.4471184, 0.4148276, -2.758646, 0, 1, 0.01176471, 1,
-0.4470929, -1.356861, -1.807021, 0, 1, 0.01568628, 1,
-0.4452645, 2.360082, -0.7347925, 0, 1, 0.02352941, 1,
-0.4414183, 0.940895, -1.081108, 0, 1, 0.02745098, 1,
-0.4408662, -0.7435316, -2.710103, 0, 1, 0.03529412, 1,
-0.4383058, 0.9231637, -0.4818734, 0, 1, 0.03921569, 1,
-0.4351075, 0.9497091, 0.7405739, 0, 1, 0.04705882, 1,
-0.4297179, -0.5795406, -2.875053, 0, 1, 0.05098039, 1,
-0.4284064, 0.9213625, -2.052385, 0, 1, 0.05882353, 1,
-0.4272675, -0.02496439, -1.029585, 0, 1, 0.0627451, 1,
-0.4263165, 0.436742, -0.648177, 0, 1, 0.07058824, 1,
-0.4208159, -0.403072, -0.9372224, 0, 1, 0.07450981, 1,
-0.4189393, -2.496602, -2.494432, 0, 1, 0.08235294, 1,
-0.4127632, 0.6724843, 0.7110983, 0, 1, 0.08627451, 1,
-0.4124281, -0.9650946, -1.702011, 0, 1, 0.09411765, 1,
-0.408095, 0.5397081, 1.533344, 0, 1, 0.1019608, 1,
-0.403063, 0.586071, -0.850513, 0, 1, 0.1058824, 1,
-0.402548, 0.9818078, -0.8057715, 0, 1, 0.1137255, 1,
-0.3989307, -1.592066, -4.14351, 0, 1, 0.1176471, 1,
-0.3972174, 0.705606, -0.4753769, 0, 1, 0.1254902, 1,
-0.3941944, -1.9159, -4.829631, 0, 1, 0.1294118, 1,
-0.390333, -0.5902351, -2.687043, 0, 1, 0.1372549, 1,
-0.3878424, 0.9829444, -0.4840158, 0, 1, 0.1411765, 1,
-0.3877476, 0.6043007, -0.347034, 0, 1, 0.1490196, 1,
-0.3824435, 0.05015332, -1.582242, 0, 1, 0.1529412, 1,
-0.3813026, -0.316663, -1.75183, 0, 1, 0.1607843, 1,
-0.3812861, -1.390529, -3.389351, 0, 1, 0.1647059, 1,
-0.3791668, -0.2285606, -3.067318, 0, 1, 0.172549, 1,
-0.376854, 0.7834184, 0.2779818, 0, 1, 0.1764706, 1,
-0.37653, 0.1834993, -2.368196, 0, 1, 0.1843137, 1,
-0.3749659, -0.4817515, -3.140117, 0, 1, 0.1882353, 1,
-0.3727366, 0.6628844, 0.2215052, 0, 1, 0.1960784, 1,
-0.3708671, -0.3694058, -1.619957, 0, 1, 0.2039216, 1,
-0.3685198, -0.1111939, -1.040268, 0, 1, 0.2078431, 1,
-0.3675906, -0.4224509, -1.601484, 0, 1, 0.2156863, 1,
-0.3631373, 0.79734, -1.418286, 0, 1, 0.2196078, 1,
-0.3631068, 1.770368, -1.418767, 0, 1, 0.227451, 1,
-0.362262, -1.485408, -3.049243, 0, 1, 0.2313726, 1,
-0.3609778, -0.08451078, -1.492215, 0, 1, 0.2392157, 1,
-0.3600442, 0.8097696, -0.3630207, 0, 1, 0.2431373, 1,
-0.3594961, -1.408265, -2.401855, 0, 1, 0.2509804, 1,
-0.3589431, -0.707579, -2.591407, 0, 1, 0.254902, 1,
-0.3576772, -1.089175, -3.034897, 0, 1, 0.2627451, 1,
-0.3566203, 1.075812, -1.646541, 0, 1, 0.2666667, 1,
-0.3557947, 0.5499378, -2.089575, 0, 1, 0.2745098, 1,
-0.3550195, -0.8464157, -3.125146, 0, 1, 0.2784314, 1,
-0.3520461, 1.307199, -0.5005173, 0, 1, 0.2862745, 1,
-0.3505796, -0.1881033, -0.5420868, 0, 1, 0.2901961, 1,
-0.3497801, 0.1950879, 2.403023, 0, 1, 0.2980392, 1,
-0.3492165, 0.4483073, 0.5783982, 0, 1, 0.3058824, 1,
-0.3426278, 1.366871, -3.346798, 0, 1, 0.3098039, 1,
-0.3411801, -0.1537945, -2.326775, 0, 1, 0.3176471, 1,
-0.3408514, -0.2049527, -2.003392, 0, 1, 0.3215686, 1,
-0.3358452, -0.1084706, -2.221229, 0, 1, 0.3294118, 1,
-0.3335993, -0.04437095, -0.7672358, 0, 1, 0.3333333, 1,
-0.3257524, 1.243405, -0.2918208, 0, 1, 0.3411765, 1,
-0.3206138, -1.227434, -3.451122, 0, 1, 0.345098, 1,
-0.3166333, 1.810676, -1.739225, 0, 1, 0.3529412, 1,
-0.315762, -0.09324154, -2.726182, 0, 1, 0.3568628, 1,
-0.3094625, 0.2172187, -1.397427, 0, 1, 0.3647059, 1,
-0.3049132, 0.6208401, -1.478922, 0, 1, 0.3686275, 1,
-0.3042854, 0.4628485, 0.4924232, 0, 1, 0.3764706, 1,
-0.3020475, 0.9561043, 0.4826115, 0, 1, 0.3803922, 1,
-0.3014416, 0.09289372, -0.9910005, 0, 1, 0.3882353, 1,
-0.29956, -0.05925685, -0.6733778, 0, 1, 0.3921569, 1,
-0.2970452, -2.229637, -2.162058, 0, 1, 0.4, 1,
-0.2942913, 0.0477194, -1.801714, 0, 1, 0.4078431, 1,
-0.2901045, -0.389715, -1.536704, 0, 1, 0.4117647, 1,
-0.2892589, -0.1360412, -1.683644, 0, 1, 0.4196078, 1,
-0.2847101, 1.97882, -0.4364748, 0, 1, 0.4235294, 1,
-0.2792413, 0.5679277, -0.8483084, 0, 1, 0.4313726, 1,
-0.274029, 2.371673, 0.4895343, 0, 1, 0.4352941, 1,
-0.2726031, -0.5258083, -3.672786, 0, 1, 0.4431373, 1,
-0.2678815, 0.4341402, -0.7357967, 0, 1, 0.4470588, 1,
-0.2676027, 1.498226, 1.170144, 0, 1, 0.454902, 1,
-0.2660414, 0.5712348, -2.380134, 0, 1, 0.4588235, 1,
-0.2644415, -1.237458, -2.013466, 0, 1, 0.4666667, 1,
-0.2603754, 1.135642, -0.7287654, 0, 1, 0.4705882, 1,
-0.259228, -0.3793119, -3.213955, 0, 1, 0.4784314, 1,
-0.2581204, -1.92119, -1.313628, 0, 1, 0.4823529, 1,
-0.255528, 0.2596515, -1.639607, 0, 1, 0.4901961, 1,
-0.2499808, -0.2322795, -2.786474, 0, 1, 0.4941176, 1,
-0.2488571, -1.450341, -2.976955, 0, 1, 0.5019608, 1,
-0.241793, 0.3236248, -0.2763551, 0, 1, 0.509804, 1,
-0.2415505, 0.1902199, 0.264708, 0, 1, 0.5137255, 1,
-0.2388849, 0.8373987, 0.285192, 0, 1, 0.5215687, 1,
-0.2318123, -0.1128805, -2.055365, 0, 1, 0.5254902, 1,
-0.2290703, -0.5521035, -2.929168, 0, 1, 0.5333334, 1,
-0.2265154, -0.2548564, -3.964931, 0, 1, 0.5372549, 1,
-0.2225866, -1.178002, -3.646803, 0, 1, 0.5450981, 1,
-0.2194156, -0.6046505, -2.212465, 0, 1, 0.5490196, 1,
-0.2190189, -0.5608087, -2.226088, 0, 1, 0.5568628, 1,
-0.2188116, -1.343054, -2.345278, 0, 1, 0.5607843, 1,
-0.2136133, 0.03906892, -2.091214, 0, 1, 0.5686275, 1,
-0.2111882, -1.904388, -3.808136, 0, 1, 0.572549, 1,
-0.2108492, -0.3169878, -2.869197, 0, 1, 0.5803922, 1,
-0.2043588, 0.4918295, -1.342544, 0, 1, 0.5843138, 1,
-0.2010303, 1.87017, -0.9430625, 0, 1, 0.5921569, 1,
-0.2001423, -0.7453051, -1.873287, 0, 1, 0.5960785, 1,
-0.1986004, -0.3030882, -3.688591, 0, 1, 0.6039216, 1,
-0.1971831, 0.9740551, -1.056324, 0, 1, 0.6117647, 1,
-0.1952804, 0.2819413, -1.281048, 0, 1, 0.6156863, 1,
-0.1908237, -1.113624, -2.832242, 0, 1, 0.6235294, 1,
-0.1896026, -0.6810299, -3.217158, 0, 1, 0.627451, 1,
-0.1855099, -0.6975409, -0.6111605, 0, 1, 0.6352941, 1,
-0.1854458, -0.7032636, -4.446371, 0, 1, 0.6392157, 1,
-0.1851744, -0.3549759, -3.639608, 0, 1, 0.6470588, 1,
-0.179405, 0.4696644, 0.07012495, 0, 1, 0.6509804, 1,
-0.1788589, 0.5841581, 0.4334687, 0, 1, 0.6588235, 1,
-0.1788096, -0.2572386, -1.943558, 0, 1, 0.6627451, 1,
-0.176318, -0.2940859, -2.624189, 0, 1, 0.6705883, 1,
-0.1667341, -0.03091154, -1.286086, 0, 1, 0.6745098, 1,
-0.1644745, 0.3244179, -0.1362735, 0, 1, 0.682353, 1,
-0.1633914, 0.8756267, 0.8223501, 0, 1, 0.6862745, 1,
-0.1633564, 0.9475092, 1.169152, 0, 1, 0.6941177, 1,
-0.1630611, -0.5357773, -1.472063, 0, 1, 0.7019608, 1,
-0.1617481, -0.4406626, -1.638619, 0, 1, 0.7058824, 1,
-0.1565244, 0.6828039, 0.4558402, 0, 1, 0.7137255, 1,
-0.1526465, 1.738347, 1.279539, 0, 1, 0.7176471, 1,
-0.1504572, -1.027411, -3.519331, 0, 1, 0.7254902, 1,
-0.1472976, 2.068391, -0.908665, 0, 1, 0.7294118, 1,
-0.1458171, -0.4748979, -3.151277, 0, 1, 0.7372549, 1,
-0.1415727, 0.6872466, -0.09866054, 0, 1, 0.7411765, 1,
-0.135728, -1.242631, -2.698234, 0, 1, 0.7490196, 1,
-0.1355624, 0.862148, 0.485584, 0, 1, 0.7529412, 1,
-0.1350397, 1.401075, -1.984135, 0, 1, 0.7607843, 1,
-0.1323835, 0.8795495, -2.24322, 0, 1, 0.7647059, 1,
-0.1301195, -0.034898, -1.355106, 0, 1, 0.772549, 1,
-0.1194112, 1.187747, 1.188994, 0, 1, 0.7764706, 1,
-0.1160891, -0.1753151, -2.572454, 0, 1, 0.7843137, 1,
-0.1054663, 0.885969, -1.440021, 0, 1, 0.7882353, 1,
-0.09949995, 0.496876, 0.2481839, 0, 1, 0.7960784, 1,
-0.09568668, -1.176911, -2.702945, 0, 1, 0.8039216, 1,
-0.09563117, -0.1173117, -2.738045, 0, 1, 0.8078431, 1,
-0.09104057, -0.1656405, -2.586946, 0, 1, 0.8156863, 1,
-0.08820009, -0.2828116, -3.291149, 0, 1, 0.8196079, 1,
-0.08330356, 0.3925653, -0.9170009, 0, 1, 0.827451, 1,
-0.08041359, 0.2473628, -0.7966794, 0, 1, 0.8313726, 1,
-0.08001342, -0.9231621, -4.128903, 0, 1, 0.8392157, 1,
-0.07982828, 0.3916112, -2.035714, 0, 1, 0.8431373, 1,
-0.07907103, 2.197181, 0.4704323, 0, 1, 0.8509804, 1,
-0.07350913, 1.974667, -1.895035, 0, 1, 0.854902, 1,
-0.07150487, 2.18286, 0.5262067, 0, 1, 0.8627451, 1,
-0.0604852, -0.9322437, -3.010974, 0, 1, 0.8666667, 1,
-0.05872403, -0.6611874, -2.748177, 0, 1, 0.8745098, 1,
-0.05771941, 0.3917603, 0.2800448, 0, 1, 0.8784314, 1,
-0.05503685, -0.1035713, -3.460683, 0, 1, 0.8862745, 1,
-0.05174331, -0.5831235, -4.109297, 0, 1, 0.8901961, 1,
-0.04756433, -0.1205815, -2.60066, 0, 1, 0.8980392, 1,
-0.04674615, -0.6958854, -3.386045, 0, 1, 0.9058824, 1,
-0.04506861, 0.8089775, -2.167255, 0, 1, 0.9098039, 1,
-0.04192405, -0.2208556, -1.63062, 0, 1, 0.9176471, 1,
-0.03936414, 0.5837043, -0.4816645, 0, 1, 0.9215686, 1,
-0.03535088, -0.7923649, -1.571174, 0, 1, 0.9294118, 1,
-0.03457734, 1.55981, 1.662556, 0, 1, 0.9333333, 1,
-0.03163854, 1.385366, -0.623177, 0, 1, 0.9411765, 1,
-0.02767351, -0.632081, -2.90534, 0, 1, 0.945098, 1,
-0.02144771, 0.9418137, 0.4718495, 0, 1, 0.9529412, 1,
-0.01944423, -1.771362, -4.325722, 0, 1, 0.9568627, 1,
-0.01928834, 0.4192064, 0.9376286, 0, 1, 0.9647059, 1,
-0.005706536, 1.617632, 0.4374471, 0, 1, 0.9686275, 1,
-0.0004284119, 0.2047895, -1.168572, 0, 1, 0.9764706, 1,
0.00318152, 1.893843, 0.8232441, 0, 1, 0.9803922, 1,
0.004311681, 1.861939, -0.5044593, 0, 1, 0.9882353, 1,
0.01182481, -0.9131345, 3.984141, 0, 1, 0.9921569, 1,
0.01189459, -0.5999936, 0.7730373, 0, 1, 1, 1,
0.01221907, -0.9839189, 2.416722, 0, 0.9921569, 1, 1,
0.01236, 1.993088, 1.062823, 0, 0.9882353, 1, 1,
0.01421585, -0.06826476, 2.428608, 0, 0.9803922, 1, 1,
0.01478384, -0.1495287, 1.413886, 0, 0.9764706, 1, 1,
0.02909767, 0.123762, 0.475549, 0, 0.9686275, 1, 1,
0.04177503, 1.381814, 0.1031151, 0, 0.9647059, 1, 1,
0.04662503, -0.4980173, 3.080404, 0, 0.9568627, 1, 1,
0.05646468, 1.426513, -0.4780904, 0, 0.9529412, 1, 1,
0.05667229, -2.198336, 2.65666, 0, 0.945098, 1, 1,
0.06471111, -1.757421, 3.323016, 0, 0.9411765, 1, 1,
0.06600969, -1.002052, 2.301841, 0, 0.9333333, 1, 1,
0.06670063, -0.2492331, 3.019608, 0, 0.9294118, 1, 1,
0.06781682, 2.175866, 1.222803, 0, 0.9215686, 1, 1,
0.06973699, -0.389331, 1.958182, 0, 0.9176471, 1, 1,
0.07038672, -0.3779347, 5.28212, 0, 0.9098039, 1, 1,
0.07040633, -0.04595325, 4.192617, 0, 0.9058824, 1, 1,
0.07246296, 1.223755, 0.2456127, 0, 0.8980392, 1, 1,
0.07375449, 2.228599, 0.4813663, 0, 0.8901961, 1, 1,
0.07705521, 1.01838, -1.701869, 0, 0.8862745, 1, 1,
0.07737017, 1.711454, 0.2886598, 0, 0.8784314, 1, 1,
0.07825213, 0.5688258, 1.650253, 0, 0.8745098, 1, 1,
0.07906456, -0.4452077, 1.731789, 0, 0.8666667, 1, 1,
0.08049342, 0.6985539, 1.47924, 0, 0.8627451, 1, 1,
0.08467969, 0.3945778, 0.4634598, 0, 0.854902, 1, 1,
0.0864822, -1.998087, 1.936244, 0, 0.8509804, 1, 1,
0.09035283, 0.9178199, 0.473976, 0, 0.8431373, 1, 1,
0.09112251, -0.1777959, 2.742906, 0, 0.8392157, 1, 1,
0.09507233, 0.632046, -0.7007566, 0, 0.8313726, 1, 1,
0.09859487, -1.048881, 2.338516, 0, 0.827451, 1, 1,
0.09937278, -0.8215475, 0.5602612, 0, 0.8196079, 1, 1,
0.1041873, 0.6438934, 1.546759, 0, 0.8156863, 1, 1,
0.1104896, -0.2300296, 0.7742248, 0, 0.8078431, 1, 1,
0.1138934, -0.4883466, 1.772057, 0, 0.8039216, 1, 1,
0.1141148, 0.1312383, 1.358693, 0, 0.7960784, 1, 1,
0.1159782, 0.3449395, 0.1905732, 0, 0.7882353, 1, 1,
0.1162137, -0.4709018, 2.438789, 0, 0.7843137, 1, 1,
0.1167862, -0.01199718, 2.231903, 0, 0.7764706, 1, 1,
0.1191111, -0.4720441, 3.992214, 0, 0.772549, 1, 1,
0.1210012, -1.171157, 2.91541, 0, 0.7647059, 1, 1,
0.1271755, -1.01107, 4.51368, 0, 0.7607843, 1, 1,
0.1283585, 1.942342, 1.260475, 0, 0.7529412, 1, 1,
0.1313487, 0.7141074, 1.048695, 0, 0.7490196, 1, 1,
0.1319239, -1.657205, 2.846504, 0, 0.7411765, 1, 1,
0.1327685, -0.8035545, 3.371389, 0, 0.7372549, 1, 1,
0.1355186, 0.8686116, 0.1658234, 0, 0.7294118, 1, 1,
0.1356205, 1.550613, -0.0293375, 0, 0.7254902, 1, 1,
0.1392312, 1.256148, 0.3906839, 0, 0.7176471, 1, 1,
0.1396275, 0.1913604, 0.889542, 0, 0.7137255, 1, 1,
0.1418853, -0.4929012, 4.097709, 0, 0.7058824, 1, 1,
0.1490483, 0.6762972, 1.179906, 0, 0.6980392, 1, 1,
0.153539, -0.9886762, 2.017022, 0, 0.6941177, 1, 1,
0.1537797, -0.1429058, 2.412792, 0, 0.6862745, 1, 1,
0.1615627, 0.4546292, 0.3490416, 0, 0.682353, 1, 1,
0.1622745, -0.2878525, 4.143302, 0, 0.6745098, 1, 1,
0.167916, -0.3247436, 1.603642, 0, 0.6705883, 1, 1,
0.1712096, -0.3446201, 3.326178, 0, 0.6627451, 1, 1,
0.1797634, 0.4875386, 0.4720005, 0, 0.6588235, 1, 1,
0.1816983, 0.1722007, 1.031211, 0, 0.6509804, 1, 1,
0.1827113, -1.779602, 3.182525, 0, 0.6470588, 1, 1,
0.1844294, -1.543959, 1.818866, 0, 0.6392157, 1, 1,
0.1859543, -0.9568143, 2.832319, 0, 0.6352941, 1, 1,
0.1865105, -0.3619044, 3.522613, 0, 0.627451, 1, 1,
0.1875021, 0.7449682, 1.606898, 0, 0.6235294, 1, 1,
0.189379, -0.1207905, 2.557781, 0, 0.6156863, 1, 1,
0.1908149, -1.012617, 0.9027025, 0, 0.6117647, 1, 1,
0.1910285, -1.138994, 3.198542, 0, 0.6039216, 1, 1,
0.1966441, -0.7886998, 2.557664, 0, 0.5960785, 1, 1,
0.1980608, 2.380001, -0.3128998, 0, 0.5921569, 1, 1,
0.2047972, -0.7782402, 2.711879, 0, 0.5843138, 1, 1,
0.2095495, -0.5780001, 3.012579, 0, 0.5803922, 1, 1,
0.210562, -0.6951014, 1.132408, 0, 0.572549, 1, 1,
0.2136425, -0.885686, 1.605088, 0, 0.5686275, 1, 1,
0.213769, -1.83805, 6.206804, 0, 0.5607843, 1, 1,
0.2169593, -0.1492734, 0.322842, 0, 0.5568628, 1, 1,
0.2292395, -0.2371003, 1.594409, 0, 0.5490196, 1, 1,
0.2296489, 0.05985283, 2.100351, 0, 0.5450981, 1, 1,
0.2377321, 2.204674, -0.2919984, 0, 0.5372549, 1, 1,
0.2419401, 1.831048, -1.933527, 0, 0.5333334, 1, 1,
0.2462658, -0.6492025, 1.639372, 0, 0.5254902, 1, 1,
0.247784, 0.9876716, -0.850453, 0, 0.5215687, 1, 1,
0.2500218, -0.2202049, 3.116406, 0, 0.5137255, 1, 1,
0.2501359, 1.253015, -0.8780437, 0, 0.509804, 1, 1,
0.2540149, 0.3790587, 0.412479, 0, 0.5019608, 1, 1,
0.2606734, 1.381529, -0.447458, 0, 0.4941176, 1, 1,
0.2655722, 1.5045, 1.063095, 0, 0.4901961, 1, 1,
0.2686597, 2.21476, 1.510474, 0, 0.4823529, 1, 1,
0.2689452, 0.540948, -1.403203, 0, 0.4784314, 1, 1,
0.2709763, -0.4075135, 0.6310421, 0, 0.4705882, 1, 1,
0.2714438, -1.372576, 3.177055, 0, 0.4666667, 1, 1,
0.2747554, 1.167013, -1.44125, 0, 0.4588235, 1, 1,
0.2749991, 1.8636, -0.3517081, 0, 0.454902, 1, 1,
0.2758825, 0.07708913, 0.6713785, 0, 0.4470588, 1, 1,
0.2786694, -0.001150001, 2.034951, 0, 0.4431373, 1, 1,
0.2814868, 0.02859093, 3.34145, 0, 0.4352941, 1, 1,
0.2850948, -0.05588606, 1.507497, 0, 0.4313726, 1, 1,
0.2902531, -0.2418811, 1.356007, 0, 0.4235294, 1, 1,
0.2926392, 0.3526404, 1.129057, 0, 0.4196078, 1, 1,
0.2939245, -0.5114544, 2.01422, 0, 0.4117647, 1, 1,
0.2975569, 2.103651, 0.8242053, 0, 0.4078431, 1, 1,
0.297759, -0.7616355, 3.559742, 0, 0.4, 1, 1,
0.2992697, -0.03626546, 4.064584, 0, 0.3921569, 1, 1,
0.3011876, 1.347865, -1.802462, 0, 0.3882353, 1, 1,
0.3032255, 1.867625, -1.53556, 0, 0.3803922, 1, 1,
0.3071296, -0.7336623, 5.329261, 0, 0.3764706, 1, 1,
0.3106633, -0.7738075, 1.204494, 0, 0.3686275, 1, 1,
0.3126353, -0.1269615, 1.607051, 0, 0.3647059, 1, 1,
0.313094, -0.7977377, 2.348809, 0, 0.3568628, 1, 1,
0.3138728, -0.03988241, 2.225813, 0, 0.3529412, 1, 1,
0.3187873, -0.6076028, 1.684878, 0, 0.345098, 1, 1,
0.3201983, 0.02800624, 2.356696, 0, 0.3411765, 1, 1,
0.3214092, -1.226898, 2.621752, 0, 0.3333333, 1, 1,
0.3217811, 1.795802, -0.6745989, 0, 0.3294118, 1, 1,
0.3309904, -1.114321, 2.562986, 0, 0.3215686, 1, 1,
0.3328215, 0.5296196, 1.315558, 0, 0.3176471, 1, 1,
0.3345456, 0.4598785, 0.5833467, 0, 0.3098039, 1, 1,
0.3390916, -0.2985997, 1.530389, 0, 0.3058824, 1, 1,
0.3395161, -1.441545, 2.901783, 0, 0.2980392, 1, 1,
0.3399561, -0.1911402, 3.219513, 0, 0.2901961, 1, 1,
0.3423629, -1.054185, 3.425127, 0, 0.2862745, 1, 1,
0.3471603, 1.847232, -0.5080751, 0, 0.2784314, 1, 1,
0.3487014, 1.450182, -1.02852, 0, 0.2745098, 1, 1,
0.3517897, -0.08271112, 3.218889, 0, 0.2666667, 1, 1,
0.357638, 2.141859, -0.06916308, 0, 0.2627451, 1, 1,
0.358463, -0.1890531, 1.690114, 0, 0.254902, 1, 1,
0.3661391, -1.260777, 2.185965, 0, 0.2509804, 1, 1,
0.369177, 1.129961, 1.475849, 0, 0.2431373, 1, 1,
0.3699409, -1.981916, 2.547754, 0, 0.2392157, 1, 1,
0.3717418, -0.8908996, 1.445066, 0, 0.2313726, 1, 1,
0.3731472, -1.300625, 3.075092, 0, 0.227451, 1, 1,
0.3734657, 0.601378, 0.003607045, 0, 0.2196078, 1, 1,
0.373826, 1.10761, -0.7910947, 0, 0.2156863, 1, 1,
0.3747859, -0.5507102, 0.5584972, 0, 0.2078431, 1, 1,
0.3849618, 0.3365748, 2.141422, 0, 0.2039216, 1, 1,
0.3850423, 0.744746, -1.544232, 0, 0.1960784, 1, 1,
0.3885057, 0.3246013, 0.412287, 0, 0.1882353, 1, 1,
0.3934197, 0.3839901, 1.659671, 0, 0.1843137, 1, 1,
0.3936726, -0.4210996, 3.317635, 0, 0.1764706, 1, 1,
0.3977703, -1.720273, 4.067095, 0, 0.172549, 1, 1,
0.3997462, -1.018545, 2.090225, 0, 0.1647059, 1, 1,
0.401691, -0.520551, 2.39257, 0, 0.1607843, 1, 1,
0.4017996, -0.629186, 1.023419, 0, 0.1529412, 1, 1,
0.4072917, 0.617581, -0.1318112, 0, 0.1490196, 1, 1,
0.4086278, -0.3232003, 3.355424, 0, 0.1411765, 1, 1,
0.4145447, 0.6498005, -0.2992704, 0, 0.1372549, 1, 1,
0.4189408, -0.4572981, 3.367473, 0, 0.1294118, 1, 1,
0.4195109, 0.4225337, 2.235608, 0, 0.1254902, 1, 1,
0.419551, -0.655284, 4.46147, 0, 0.1176471, 1, 1,
0.4212423, -0.8425324, 2.454976, 0, 0.1137255, 1, 1,
0.4224691, -2.07618, 2.869896, 0, 0.1058824, 1, 1,
0.4269383, -1.927273, 2.378258, 0, 0.09803922, 1, 1,
0.4344484, 0.5914491, 1.416336, 0, 0.09411765, 1, 1,
0.4353857, 0.03075886, 1.262567, 0, 0.08627451, 1, 1,
0.4377608, 0.8428081, -0.07987813, 0, 0.08235294, 1, 1,
0.439279, 0.1431723, 0.143865, 0, 0.07450981, 1, 1,
0.4400609, 0.3535088, 0.2855535, 0, 0.07058824, 1, 1,
0.4413877, 0.1094463, 0.683723, 0, 0.0627451, 1, 1,
0.4421985, 0.4003763, 0.9132584, 0, 0.05882353, 1, 1,
0.4464171, -0.2030464, 3.119449, 0, 0.05098039, 1, 1,
0.4475445, -0.08848002, 0.1208129, 0, 0.04705882, 1, 1,
0.4501607, 0.8658208, 0.002092176, 0, 0.03921569, 1, 1,
0.461694, 0.186761, 0.6007377, 0, 0.03529412, 1, 1,
0.4661034, 0.1300965, 0.3762759, 0, 0.02745098, 1, 1,
0.4705007, 0.3457491, -0.8300968, 0, 0.02352941, 1, 1,
0.470771, -2.59778, 5.735078, 0, 0.01568628, 1, 1,
0.4822923, 0.6355677, -0.5744583, 0, 0.01176471, 1, 1,
0.4846602, -0.6676604, 4.01855, 0, 0.003921569, 1, 1,
0.4903257, -0.1903242, 1.460979, 0.003921569, 0, 1, 1,
0.4911445, -0.8007012, 1.920882, 0.007843138, 0, 1, 1,
0.4923472, 0.6246368, 0.1524073, 0.01568628, 0, 1, 1,
0.4989839, -0.9290263, 2.540873, 0.01960784, 0, 1, 1,
0.4996978, 0.6041089, 0.6134695, 0.02745098, 0, 1, 1,
0.5010042, -1.026951, 2.577004, 0.03137255, 0, 1, 1,
0.5013074, 0.3046604, -0.1679893, 0.03921569, 0, 1, 1,
0.5071448, -0.3520236, 2.706529, 0.04313726, 0, 1, 1,
0.5093558, -1.38759, 2.757209, 0.05098039, 0, 1, 1,
0.5106632, 1.058032, -0.7286767, 0.05490196, 0, 1, 1,
0.5120487, 2.237441, -0.6080961, 0.0627451, 0, 1, 1,
0.5132872, 0.1223845, 0.6406723, 0.06666667, 0, 1, 1,
0.513531, 0.5073389, 0.8028393, 0.07450981, 0, 1, 1,
0.5137221, 0.04618812, 1.637421, 0.07843138, 0, 1, 1,
0.5232848, 0.3018605, 3.1961, 0.08627451, 0, 1, 1,
0.5315203, 1.771553, 2.111709, 0.09019608, 0, 1, 1,
0.532094, 0.9350446, 0.2111625, 0.09803922, 0, 1, 1,
0.5368116, 0.2903514, 1.961547, 0.1058824, 0, 1, 1,
0.5368987, 0.2076023, 1.807418, 0.1098039, 0, 1, 1,
0.5378582, 0.2706624, 1.725085, 0.1176471, 0, 1, 1,
0.5382107, -0.5267337, 1.055801, 0.1215686, 0, 1, 1,
0.5382734, -0.4306437, 1.822176, 0.1294118, 0, 1, 1,
0.5560392, 1.646674, 0.113904, 0.1333333, 0, 1, 1,
0.556767, 1.378884, 1.371536, 0.1411765, 0, 1, 1,
0.5579315, 1.819143, 1.225986, 0.145098, 0, 1, 1,
0.5592804, -0.8039415, 3.888968, 0.1529412, 0, 1, 1,
0.5625331, 1.604431, 0.01051704, 0.1568628, 0, 1, 1,
0.5684772, -1.336889, 3.297751, 0.1647059, 0, 1, 1,
0.5723552, -0.1710935, 1.796504, 0.1686275, 0, 1, 1,
0.5751619, 0.02331045, 1.87416, 0.1764706, 0, 1, 1,
0.5754889, -0.9312505, 2.230896, 0.1803922, 0, 1, 1,
0.5780411, 1.917577, -0.5681199, 0.1882353, 0, 1, 1,
0.5817597, -1.757279, 2.394523, 0.1921569, 0, 1, 1,
0.5836831, 1.266455, -0.3275454, 0.2, 0, 1, 1,
0.5858103, -0.02154861, 3.333937, 0.2078431, 0, 1, 1,
0.5862967, -0.6953538, 1.987584, 0.2117647, 0, 1, 1,
0.5878587, 0.7819232, 1.601035, 0.2196078, 0, 1, 1,
0.5910208, 0.7391591, -0.08771422, 0.2235294, 0, 1, 1,
0.5917886, 0.5496601, 1.722775, 0.2313726, 0, 1, 1,
0.5924976, -1.500519, 2.352193, 0.2352941, 0, 1, 1,
0.592653, 0.8024125, 0.09954401, 0.2431373, 0, 1, 1,
0.5930637, 0.2886945, 0.1631043, 0.2470588, 0, 1, 1,
0.5952074, -0.9886157, 3.661688, 0.254902, 0, 1, 1,
0.5983399, 1.403292, 0.3461461, 0.2588235, 0, 1, 1,
0.6001526, 1.103274, 0.06919629, 0.2666667, 0, 1, 1,
0.6023371, 0.7395441, 1.339638, 0.2705882, 0, 1, 1,
0.6044467, -0.8217533, 0.6411769, 0.2784314, 0, 1, 1,
0.6044546, -1.329352, 1.908439, 0.282353, 0, 1, 1,
0.6104673, 0.8516288, 2.403518, 0.2901961, 0, 1, 1,
0.6164058, 0.2948275, 1.439317, 0.2941177, 0, 1, 1,
0.6197079, -0.8007481, 3.116582, 0.3019608, 0, 1, 1,
0.623643, -0.4151378, 2.338233, 0.3098039, 0, 1, 1,
0.6253992, -0.4423538, 1.160374, 0.3137255, 0, 1, 1,
0.6265404, -0.8072383, 2.077228, 0.3215686, 0, 1, 1,
0.6283418, -0.6377046, 2.193619, 0.3254902, 0, 1, 1,
0.6287344, 1.004774, 0.8177166, 0.3333333, 0, 1, 1,
0.6322744, -0.3322015, 1.702533, 0.3372549, 0, 1, 1,
0.636979, -2.002764, 2.176166, 0.345098, 0, 1, 1,
0.6400302, 0.8465981, 0.95849, 0.3490196, 0, 1, 1,
0.6423994, -0.01746893, 0.4950398, 0.3568628, 0, 1, 1,
0.6455339, -1.138578, 4.228304, 0.3607843, 0, 1, 1,
0.6513024, -1.722444, 2.656093, 0.3686275, 0, 1, 1,
0.6513761, -0.9222302, 3.804342, 0.372549, 0, 1, 1,
0.6517347, 0.6022727, 1.374012, 0.3803922, 0, 1, 1,
0.6520159, 1.790875, -1.112002, 0.3843137, 0, 1, 1,
0.6639381, -0.7379787, 2.09269, 0.3921569, 0, 1, 1,
0.6717006, -0.5353771, 4.089974, 0.3960784, 0, 1, 1,
0.6720321, 1.751979, -1.932053, 0.4039216, 0, 1, 1,
0.6725931, 2.010043, 0.9329948, 0.4117647, 0, 1, 1,
0.6739401, 0.6721479, 1.258087, 0.4156863, 0, 1, 1,
0.6751255, -0.1991131, 1.756136, 0.4235294, 0, 1, 1,
0.6777401, 0.4460547, 0.594565, 0.427451, 0, 1, 1,
0.6796053, 1.241804, 0.03080824, 0.4352941, 0, 1, 1,
0.6828719, 1.576328, 1.316058, 0.4392157, 0, 1, 1,
0.6863595, -0.2329753, 1.625866, 0.4470588, 0, 1, 1,
0.6867867, 0.7337714, 1.1989, 0.4509804, 0, 1, 1,
0.693711, 1.224739, 0.499707, 0.4588235, 0, 1, 1,
0.69704, -0.2867751, 1.374152, 0.4627451, 0, 1, 1,
0.7032456, -0.5828469, 1.635036, 0.4705882, 0, 1, 1,
0.7042218, 0.9259622, 1.287235, 0.4745098, 0, 1, 1,
0.705506, 0.07715008, 1.573099, 0.4823529, 0, 1, 1,
0.7068172, -1.449876, 2.349424, 0.4862745, 0, 1, 1,
0.7083313, -0.3770891, 3.571402, 0.4941176, 0, 1, 1,
0.7083435, -0.30031, 3.244855, 0.5019608, 0, 1, 1,
0.7096512, 1.231892, 1.609967, 0.5058824, 0, 1, 1,
0.7097884, -0.863629, 2.997567, 0.5137255, 0, 1, 1,
0.7217082, 0.2648553, 2.19712, 0.5176471, 0, 1, 1,
0.7240481, -1.188264, 3.403486, 0.5254902, 0, 1, 1,
0.7249233, 1.914783, 1.200834, 0.5294118, 0, 1, 1,
0.7255792, 0.5427495, 1.200858, 0.5372549, 0, 1, 1,
0.7266538, -1.537454, 3.640369, 0.5411765, 0, 1, 1,
0.727691, -0.3318871, 1.586222, 0.5490196, 0, 1, 1,
0.737443, -0.2131513, 1.619186, 0.5529412, 0, 1, 1,
0.74117, -0.1885675, 0.862076, 0.5607843, 0, 1, 1,
0.7412481, 0.1404045, 2.125234, 0.5647059, 0, 1, 1,
0.7430609, 0.408957, 0.8700601, 0.572549, 0, 1, 1,
0.7449068, -1.48951, 3.597233, 0.5764706, 0, 1, 1,
0.748986, 0.6121572, -0.8130159, 0.5843138, 0, 1, 1,
0.762677, -0.5468473, 2.485175, 0.5882353, 0, 1, 1,
0.7664963, 0.6575317, 1.731074, 0.5960785, 0, 1, 1,
0.771653, -1.116889, 1.67215, 0.6039216, 0, 1, 1,
0.7718115, 0.2739015, 0.4280027, 0.6078432, 0, 1, 1,
0.7741099, 0.6432207, 1.360426, 0.6156863, 0, 1, 1,
0.7744151, -1.195932, 2.668119, 0.6196079, 0, 1, 1,
0.7798674, 0.4889843, 2.345329, 0.627451, 0, 1, 1,
0.7891019, -0.3822932, 2.482696, 0.6313726, 0, 1, 1,
0.7896928, 0.6869394, 1.239942, 0.6392157, 0, 1, 1,
0.794481, -0.527598, 1.290875, 0.6431373, 0, 1, 1,
0.7952887, 0.6964365, 1.648691, 0.6509804, 0, 1, 1,
0.8012772, 1.297135, 0.6420997, 0.654902, 0, 1, 1,
0.8062268, 1.463183, 0.9948796, 0.6627451, 0, 1, 1,
0.8097399, -0.1179782, 2.28206, 0.6666667, 0, 1, 1,
0.8122239, 0.3780126, 1.655218, 0.6745098, 0, 1, 1,
0.8163807, -0.4928778, -0.1567607, 0.6784314, 0, 1, 1,
0.8184078, -1.167012, 4.301991, 0.6862745, 0, 1, 1,
0.8259552, -2.166678, 1.210945, 0.6901961, 0, 1, 1,
0.8401031, 1.034892, 2.094383, 0.6980392, 0, 1, 1,
0.8503155, 0.04551364, 0.5821437, 0.7058824, 0, 1, 1,
0.8513567, 0.5261928, 2.60089, 0.7098039, 0, 1, 1,
0.8555994, -0.5278072, 0.1802115, 0.7176471, 0, 1, 1,
0.8567333, -0.8730018, 2.598554, 0.7215686, 0, 1, 1,
0.8591689, -0.2984444, 2.810464, 0.7294118, 0, 1, 1,
0.8629686, -0.7755305, 0.05914434, 0.7333333, 0, 1, 1,
0.8631514, 1.650434, 0.5713207, 0.7411765, 0, 1, 1,
0.8649216, -0.1827914, 1.784418, 0.7450981, 0, 1, 1,
0.8670394, 1.145223, -0.9984912, 0.7529412, 0, 1, 1,
0.8733743, -0.01635104, 1.097642, 0.7568628, 0, 1, 1,
0.8740653, 0.1435034, 0.8618811, 0.7647059, 0, 1, 1,
0.8765917, 1.254203, 1.718157, 0.7686275, 0, 1, 1,
0.8803557, 0.746797, -0.5562771, 0.7764706, 0, 1, 1,
0.8843725, -0.3326944, 2.497445, 0.7803922, 0, 1, 1,
0.8850504, -0.2568115, 1.194175, 0.7882353, 0, 1, 1,
0.8876043, 0.2972757, 2.036586, 0.7921569, 0, 1, 1,
0.8958992, -1.611386, 3.170148, 0.8, 0, 1, 1,
0.9009852, 0.4975986, 2.55614, 0.8078431, 0, 1, 1,
0.9016487, 0.8123421, 0.7574158, 0.8117647, 0, 1, 1,
0.9134026, 0.2269376, 1.84114, 0.8196079, 0, 1, 1,
0.9154031, -1.544117, 2.06076, 0.8235294, 0, 1, 1,
0.9209763, 0.5689054, 2.175746, 0.8313726, 0, 1, 1,
0.9226778, 0.2967643, 1.663649, 0.8352941, 0, 1, 1,
0.9238501, 1.562706, 0.09193611, 0.8431373, 0, 1, 1,
0.9254131, -0.7506716, 2.602222, 0.8470588, 0, 1, 1,
0.9332536, 1.208586, 0.5895702, 0.854902, 0, 1, 1,
0.9420338, 0.4627006, 2.258917, 0.8588235, 0, 1, 1,
0.9466485, -1.526545, 3.155038, 0.8666667, 0, 1, 1,
0.9502671, 1.449212, 1.684309, 0.8705882, 0, 1, 1,
0.9543408, -0.1510564, 1.769225, 0.8784314, 0, 1, 1,
0.9549782, -0.7013322, 1.008881, 0.8823529, 0, 1, 1,
0.9560609, 0.2748372, -0.2452441, 0.8901961, 0, 1, 1,
0.9569849, 1.076359, 0.5765766, 0.8941177, 0, 1, 1,
0.9571708, 0.9597728, -0.95995, 0.9019608, 0, 1, 1,
0.9611965, -0.8386762, 2.614504, 0.9098039, 0, 1, 1,
0.9686266, 1.323919, 1.022296, 0.9137255, 0, 1, 1,
0.9705352, 1.098795, -0.703635, 0.9215686, 0, 1, 1,
0.9731104, 2.519429, -0.4172788, 0.9254902, 0, 1, 1,
0.9757501, -0.2102313, 0.2334184, 0.9333333, 0, 1, 1,
0.9819843, 1.191522, 1.61038, 0.9372549, 0, 1, 1,
0.9825462, 0.6286104, -0.3020384, 0.945098, 0, 1, 1,
0.9828221, 1.515699, -1.344252, 0.9490196, 0, 1, 1,
0.9871377, 0.6511875, 0.8714404, 0.9568627, 0, 1, 1,
0.9894142, 0.544681, -0.40273, 0.9607843, 0, 1, 1,
0.9987618, 1.07453, 0.784927, 0.9686275, 0, 1, 1,
0.9995929, 1.402373, 0.1014272, 0.972549, 0, 1, 1,
1.00086, -0.3659125, 1.51475, 0.9803922, 0, 1, 1,
1.001372, -0.1430771, 1.333709, 0.9843137, 0, 1, 1,
1.003476, 0.3676209, 0.3465541, 0.9921569, 0, 1, 1,
1.003601, -1.119493, 3.448145, 0.9960784, 0, 1, 1,
1.005341, -1.419182, 3.358741, 1, 0, 0.9960784, 1,
1.007671, 2.254664, -0.06964597, 1, 0, 0.9882353, 1,
1.013046, -0.8347999, 3.719477, 1, 0, 0.9843137, 1,
1.015504, -1.100414, 1.107208, 1, 0, 0.9764706, 1,
1.018129, -1.408603, 1.134149, 1, 0, 0.972549, 1,
1.018383, 1.394917, 1.285871, 1, 0, 0.9647059, 1,
1.024147, -0.446487, 1.234338, 1, 0, 0.9607843, 1,
1.028702, -2.442059, 1.245152, 1, 0, 0.9529412, 1,
1.029617, 0.3566637, 2.102106, 1, 0, 0.9490196, 1,
1.030084, 0.320787, 1.45931, 1, 0, 0.9411765, 1,
1.036626, -0.8977367, 2.298078, 1, 0, 0.9372549, 1,
1.036668, 0.5049452, 0.8000335, 1, 0, 0.9294118, 1,
1.038941, -0.5967132, 3.278858, 1, 0, 0.9254902, 1,
1.043446, -1.082538, 2.103342, 1, 0, 0.9176471, 1,
1.065583, 0.07685114, 1.293678, 1, 0, 0.9137255, 1,
1.07342, 0.07160518, 1.453034, 1, 0, 0.9058824, 1,
1.074846, 0.3970658, 0.7620393, 1, 0, 0.9019608, 1,
1.080141, -1.158068, 2.112273, 1, 0, 0.8941177, 1,
1.093883, -0.8889964, 1.165138, 1, 0, 0.8862745, 1,
1.096665, 0.3759308, 2.106488, 1, 0, 0.8823529, 1,
1.0999, -2.270797, 2.64549, 1, 0, 0.8745098, 1,
1.103142, -0.05073515, 0.8213506, 1, 0, 0.8705882, 1,
1.107785, -0.0764523, 1.247616, 1, 0, 0.8627451, 1,
1.110211, -2.079729, 2.08991, 1, 0, 0.8588235, 1,
1.113088, 1.504961, -1.9065, 1, 0, 0.8509804, 1,
1.115911, -1.205835, 2.829049, 1, 0, 0.8470588, 1,
1.124361, 1.342966, -1.150101, 1, 0, 0.8392157, 1,
1.129, 0.7394186, -0.2850756, 1, 0, 0.8352941, 1,
1.129042, -0.04617991, 3.006162, 1, 0, 0.827451, 1,
1.144007, 0.5648847, 1.194898, 1, 0, 0.8235294, 1,
1.144176, 0.8834873, 0.8658069, 1, 0, 0.8156863, 1,
1.145692, -0.3934724, 1.949495, 1, 0, 0.8117647, 1,
1.146362, 0.8819637, 2.428449, 1, 0, 0.8039216, 1,
1.152449, -0.7208042, 1.710263, 1, 0, 0.7960784, 1,
1.157835, 0.005699647, 1.20663, 1, 0, 0.7921569, 1,
1.175947, 0.8005542, 2.416981, 1, 0, 0.7843137, 1,
1.184762, 0.113319, 1.870627, 1, 0, 0.7803922, 1,
1.191811, 1.090088, 2.674553, 1, 0, 0.772549, 1,
1.192293, -0.1195107, 0.4534796, 1, 0, 0.7686275, 1,
1.202542, 1.038151, 1.350179, 1, 0, 0.7607843, 1,
1.205106, -0.04816804, -0.08638687, 1, 0, 0.7568628, 1,
1.208007, 1.009259, 2.834493, 1, 0, 0.7490196, 1,
1.213516, 1.157, -0.6328002, 1, 0, 0.7450981, 1,
1.215958, 0.1603779, 2.213339, 1, 0, 0.7372549, 1,
1.224145, 1.733691, -0.03594252, 1, 0, 0.7333333, 1,
1.225803, -1.083035, 2.417514, 1, 0, 0.7254902, 1,
1.231177, -0.6720234, 1.861207, 1, 0, 0.7215686, 1,
1.238312, -0.01885878, 1.985684, 1, 0, 0.7137255, 1,
1.24691, 0.6655676, 0.3819536, 1, 0, 0.7098039, 1,
1.248232, -1.23563, 3.418514, 1, 0, 0.7019608, 1,
1.249176, 0.1980192, 3.210528, 1, 0, 0.6941177, 1,
1.252502, -0.3480411, 0.7945618, 1, 0, 0.6901961, 1,
1.271405, 0.4077207, 2.291693, 1, 0, 0.682353, 1,
1.273171, 1.447455, 2.989978, 1, 0, 0.6784314, 1,
1.275604, -2.210627, 1.424143, 1, 0, 0.6705883, 1,
1.284712, 1.046631, 0.7740991, 1, 0, 0.6666667, 1,
1.301117, -1.00019, 2.923835, 1, 0, 0.6588235, 1,
1.304787, -0.1695076, 0.8561664, 1, 0, 0.654902, 1,
1.306994, -2.548494, 2.837308, 1, 0, 0.6470588, 1,
1.312769, -1.076958, 2.368045, 1, 0, 0.6431373, 1,
1.31454, -0.7040183, 1.723281, 1, 0, 0.6352941, 1,
1.315715, -0.9295858, 2.327878, 1, 0, 0.6313726, 1,
1.323586, 0.2963633, 1.427248, 1, 0, 0.6235294, 1,
1.331007, 1.421285, 0.5282872, 1, 0, 0.6196079, 1,
1.336762, 1.377874, 1.152739, 1, 0, 0.6117647, 1,
1.342944, 0.7162225, -0.3867607, 1, 0, 0.6078432, 1,
1.343163, 0.9048972, 1.362088, 1, 0, 0.6, 1,
1.343541, -0.6491972, 0.3468042, 1, 0, 0.5921569, 1,
1.343842, 0.1437404, 2.83926, 1, 0, 0.5882353, 1,
1.343969, -0.2684394, 1.776368, 1, 0, 0.5803922, 1,
1.34415, 0.8472821, 0.5127817, 1, 0, 0.5764706, 1,
1.345581, -2.478209, 2.693277, 1, 0, 0.5686275, 1,
1.348686, 0.163807, 1.571257, 1, 0, 0.5647059, 1,
1.357687, -0.3081682, 2.567763, 1, 0, 0.5568628, 1,
1.361114, -1.522369, 4.587083, 1, 0, 0.5529412, 1,
1.36733, 0.9357094, 0.8316796, 1, 0, 0.5450981, 1,
1.379081, -1.175148, 2.314133, 1, 0, 0.5411765, 1,
1.389273, -1.010654, 2.192637, 1, 0, 0.5333334, 1,
1.403313, 0.6597358, -0.6569182, 1, 0, 0.5294118, 1,
1.406063, 0.2822289, 1.501708, 1, 0, 0.5215687, 1,
1.408248, 0.9632471, 2.804051, 1, 0, 0.5176471, 1,
1.416641, -0.1430653, 0.6221378, 1, 0, 0.509804, 1,
1.419992, 0.009943691, 0.06600072, 1, 0, 0.5058824, 1,
1.448064, -0.5291908, 2.310171, 1, 0, 0.4980392, 1,
1.478026, -0.8212236, 1.558638, 1, 0, 0.4901961, 1,
1.48337, 1.37407, -0.0514521, 1, 0, 0.4862745, 1,
1.485097, 0.9628667, 1.049292, 1, 0, 0.4784314, 1,
1.487891, 0.03685391, 0.8915489, 1, 0, 0.4745098, 1,
1.490977, -0.6480556, 2.373381, 1, 0, 0.4666667, 1,
1.498191, 0.6840648, -0.1892081, 1, 0, 0.4627451, 1,
1.505145, -1.1826, 3.246913, 1, 0, 0.454902, 1,
1.509225, 1.078601, 0.9492664, 1, 0, 0.4509804, 1,
1.520455, -0.7974615, 1.671841, 1, 0, 0.4431373, 1,
1.533386, -1.073095, 1.317068, 1, 0, 0.4392157, 1,
1.536027, -0.6903638, 1.446822, 1, 0, 0.4313726, 1,
1.54363, -0.7473282, 0.5092199, 1, 0, 0.427451, 1,
1.543776, -1.699908, 2.151562, 1, 0, 0.4196078, 1,
1.552824, -1.989865, 4.394842, 1, 0, 0.4156863, 1,
1.570233, 0.6654405, 0.9290058, 1, 0, 0.4078431, 1,
1.571007, -0.4772929, 0.3254638, 1, 0, 0.4039216, 1,
1.57422, 0.05194103, 2.175975, 1, 0, 0.3960784, 1,
1.575493, -0.2241862, 1.717541, 1, 0, 0.3882353, 1,
1.594267, -0.7929567, 2.592495, 1, 0, 0.3843137, 1,
1.597827, -0.3111401, 2.323821, 1, 0, 0.3764706, 1,
1.608399, -1.290247, 0.5929357, 1, 0, 0.372549, 1,
1.631689, -1.012298, 3.459512, 1, 0, 0.3647059, 1,
1.633732, -2.037093, 2.050066, 1, 0, 0.3607843, 1,
1.635769, 0.6190211, 1.196416, 1, 0, 0.3529412, 1,
1.640676, 0.1913164, 2.192109, 1, 0, 0.3490196, 1,
1.645515, -0.05144883, 2.436466, 1, 0, 0.3411765, 1,
1.650264, 1.385546, 0.02889231, 1, 0, 0.3372549, 1,
1.652555, 0.7128304, 1.176862, 1, 0, 0.3294118, 1,
1.656164, 0.6280061, 0.9607023, 1, 0, 0.3254902, 1,
1.671124, -0.1700142, 2.051289, 1, 0, 0.3176471, 1,
1.692184, -0.4138882, 1.755444, 1, 0, 0.3137255, 1,
1.696153, 0.6060546, 1.626869, 1, 0, 0.3058824, 1,
1.697039, -0.7908819, 2.555056, 1, 0, 0.2980392, 1,
1.698965, -0.7165371, 2.232601, 1, 0, 0.2941177, 1,
1.700258, 0.07590643, -0.08182107, 1, 0, 0.2862745, 1,
1.702028, 0.4269953, 0.2017862, 1, 0, 0.282353, 1,
1.702978, -0.555147, 2.518027, 1, 0, 0.2745098, 1,
1.705208, -0.2953791, 4.066172, 1, 0, 0.2705882, 1,
1.710624, 1.556666, 2.362914, 1, 0, 0.2627451, 1,
1.713726, -1.577325, 3.342054, 1, 0, 0.2588235, 1,
1.714886, -1.063813, 3.243384, 1, 0, 0.2509804, 1,
1.719326, 0.1611591, 0.6305816, 1, 0, 0.2470588, 1,
1.728242, -0.7036163, 0.4380569, 1, 0, 0.2392157, 1,
1.741581, 1.038052, -0.1386762, 1, 0, 0.2352941, 1,
1.74193, -0.2880958, 1.70108, 1, 0, 0.227451, 1,
1.765656, -0.05705611, -0.06498528, 1, 0, 0.2235294, 1,
1.786444, 0.2870883, 1.29338, 1, 0, 0.2156863, 1,
1.809268, 1.315701, 1.684999, 1, 0, 0.2117647, 1,
1.816758, -0.633927, 3.519517, 1, 0, 0.2039216, 1,
1.827381, 0.04253932, 2.490792, 1, 0, 0.1960784, 1,
1.836156, -1.249251, 0.8022037, 1, 0, 0.1921569, 1,
1.843019, 0.6397956, 2.116195, 1, 0, 0.1843137, 1,
1.871824, 1.117708, 2.096927, 1, 0, 0.1803922, 1,
1.8735, -0.2927074, 3.403624, 1, 0, 0.172549, 1,
1.876994, -0.5103338, 1.366588, 1, 0, 0.1686275, 1,
1.916763, -0.8994273, 2.951392, 1, 0, 0.1607843, 1,
1.923812, 0.4829281, 1.807344, 1, 0, 0.1568628, 1,
1.99498, -1.166437, 2.650775, 1, 0, 0.1490196, 1,
2.008054, 0.5614464, -0.3820193, 1, 0, 0.145098, 1,
2.024824, 2.148608, 0.2921037, 1, 0, 0.1372549, 1,
2.037578, -2.133425, 0.1211819, 1, 0, 0.1333333, 1,
2.065845, -1.034486, -0.202687, 1, 0, 0.1254902, 1,
2.073689, -1.223122, 3.9439, 1, 0, 0.1215686, 1,
2.082727, 0.2507625, 1.956398, 1, 0, 0.1137255, 1,
2.105512, 0.122753, -0.3670523, 1, 0, 0.1098039, 1,
2.136603, 1.119261, -0.9209327, 1, 0, 0.1019608, 1,
2.152282, 0.9817371, 1.619824, 1, 0, 0.09411765, 1,
2.156817, -0.6088343, 1.72056, 1, 0, 0.09019608, 1,
2.192613, 0.4255122, 1.924633, 1, 0, 0.08235294, 1,
2.20277, 0.9824843, 2.03188, 1, 0, 0.07843138, 1,
2.241374, 1.553739, 1.897818, 1, 0, 0.07058824, 1,
2.304158, -1.942317, 1.367486, 1, 0, 0.06666667, 1,
2.310371, 0.595616, 1.669461, 1, 0, 0.05882353, 1,
2.358747, 0.3300974, 0.7867231, 1, 0, 0.05490196, 1,
2.386244, -1.539104, 2.082424, 1, 0, 0.04705882, 1,
2.527214, 0.01733993, 1.937539, 1, 0, 0.04313726, 1,
2.59249, 1.305232, 1.189914, 1, 0, 0.03529412, 1,
2.730748, 1.151794, 0.5235149, 1, 0, 0.03137255, 1,
2.752357, -0.9530073, 1.415353, 1, 0, 0.02352941, 1,
2.813571, -1.486254, 1.867979, 1, 0, 0.01960784, 1,
2.862087, 1.903525, 0.6500412, 1, 0, 0.01176471, 1,
3.348325, 1.358767, 0.7136295, 1, 0, 0.007843138, 1
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
0.1772742, -3.861344, -6.700306, 0, -0.5, 0.5, 0.5,
0.1772742, -3.861344, -6.700306, 1, -0.5, 0.5, 0.5,
0.1772742, -3.861344, -6.700306, 1, 1.5, 0.5, 0.5,
0.1772742, -3.861344, -6.700306, 0, 1.5, 0.5, 0.5
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
-4.068762, -0.1011151, -6.700306, 0, -0.5, 0.5, 0.5,
-4.068762, -0.1011151, -6.700306, 1, -0.5, 0.5, 0.5,
-4.068762, -0.1011151, -6.700306, 1, 1.5, 0.5, 0.5,
-4.068762, -0.1011151, -6.700306, 0, 1.5, 0.5, 0.5
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
-4.068762, -3.861344, 0.6885867, 0, -0.5, 0.5, 0.5,
-4.068762, -3.861344, 0.6885867, 1, -0.5, 0.5, 0.5,
-4.068762, -3.861344, 0.6885867, 1, 1.5, 0.5, 0.5,
-4.068762, -3.861344, 0.6885867, 0, 1.5, 0.5, 0.5
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
-2, -2.993599, -4.995177,
3, -2.993599, -4.995177,
-2, -2.993599, -4.995177,
-2, -3.138223, -5.279366,
-1, -2.993599, -4.995177,
-1, -3.138223, -5.279366,
0, -2.993599, -4.995177,
0, -3.138223, -5.279366,
1, -2.993599, -4.995177,
1, -3.138223, -5.279366,
2, -2.993599, -4.995177,
2, -3.138223, -5.279366,
3, -2.993599, -4.995177,
3, -3.138223, -5.279366
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
-2, -3.427471, -5.847742, 0, -0.5, 0.5, 0.5,
-2, -3.427471, -5.847742, 1, -0.5, 0.5, 0.5,
-2, -3.427471, -5.847742, 1, 1.5, 0.5, 0.5,
-2, -3.427471, -5.847742, 0, 1.5, 0.5, 0.5,
-1, -3.427471, -5.847742, 0, -0.5, 0.5, 0.5,
-1, -3.427471, -5.847742, 1, -0.5, 0.5, 0.5,
-1, -3.427471, -5.847742, 1, 1.5, 0.5, 0.5,
-1, -3.427471, -5.847742, 0, 1.5, 0.5, 0.5,
0, -3.427471, -5.847742, 0, -0.5, 0.5, 0.5,
0, -3.427471, -5.847742, 1, -0.5, 0.5, 0.5,
0, -3.427471, -5.847742, 1, 1.5, 0.5, 0.5,
0, -3.427471, -5.847742, 0, 1.5, 0.5, 0.5,
1, -3.427471, -5.847742, 0, -0.5, 0.5, 0.5,
1, -3.427471, -5.847742, 1, -0.5, 0.5, 0.5,
1, -3.427471, -5.847742, 1, 1.5, 0.5, 0.5,
1, -3.427471, -5.847742, 0, 1.5, 0.5, 0.5,
2, -3.427471, -5.847742, 0, -0.5, 0.5, 0.5,
2, -3.427471, -5.847742, 1, -0.5, 0.5, 0.5,
2, -3.427471, -5.847742, 1, 1.5, 0.5, 0.5,
2, -3.427471, -5.847742, 0, 1.5, 0.5, 0.5,
3, -3.427471, -5.847742, 0, -0.5, 0.5, 0.5,
3, -3.427471, -5.847742, 1, -0.5, 0.5, 0.5,
3, -3.427471, -5.847742, 1, 1.5, 0.5, 0.5,
3, -3.427471, -5.847742, 0, 1.5, 0.5, 0.5
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
-3.088907, -2, -4.995177,
-3.088907, 2, -4.995177,
-3.088907, -2, -4.995177,
-3.252217, -2, -5.279366,
-3.088907, -1, -4.995177,
-3.252217, -1, -5.279366,
-3.088907, 0, -4.995177,
-3.252217, 0, -5.279366,
-3.088907, 1, -4.995177,
-3.252217, 1, -5.279366,
-3.088907, 2, -4.995177,
-3.252217, 2, -5.279366
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
-3.578835, -2, -5.847742, 0, -0.5, 0.5, 0.5,
-3.578835, -2, -5.847742, 1, -0.5, 0.5, 0.5,
-3.578835, -2, -5.847742, 1, 1.5, 0.5, 0.5,
-3.578835, -2, -5.847742, 0, 1.5, 0.5, 0.5,
-3.578835, -1, -5.847742, 0, -0.5, 0.5, 0.5,
-3.578835, -1, -5.847742, 1, -0.5, 0.5, 0.5,
-3.578835, -1, -5.847742, 1, 1.5, 0.5, 0.5,
-3.578835, -1, -5.847742, 0, 1.5, 0.5, 0.5,
-3.578835, 0, -5.847742, 0, -0.5, 0.5, 0.5,
-3.578835, 0, -5.847742, 1, -0.5, 0.5, 0.5,
-3.578835, 0, -5.847742, 1, 1.5, 0.5, 0.5,
-3.578835, 0, -5.847742, 0, 1.5, 0.5, 0.5,
-3.578835, 1, -5.847742, 0, -0.5, 0.5, 0.5,
-3.578835, 1, -5.847742, 1, -0.5, 0.5, 0.5,
-3.578835, 1, -5.847742, 1, 1.5, 0.5, 0.5,
-3.578835, 1, -5.847742, 0, 1.5, 0.5, 0.5,
-3.578835, 2, -5.847742, 0, -0.5, 0.5, 0.5,
-3.578835, 2, -5.847742, 1, -0.5, 0.5, 0.5,
-3.578835, 2, -5.847742, 1, 1.5, 0.5, 0.5,
-3.578835, 2, -5.847742, 0, 1.5, 0.5, 0.5
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
-3.088907, -2.993599, -4,
-3.088907, -2.993599, 6,
-3.088907, -2.993599, -4,
-3.252217, -3.138223, -4,
-3.088907, -2.993599, -2,
-3.252217, -3.138223, -2,
-3.088907, -2.993599, 0,
-3.252217, -3.138223, 0,
-3.088907, -2.993599, 2,
-3.252217, -3.138223, 2,
-3.088907, -2.993599, 4,
-3.252217, -3.138223, 4,
-3.088907, -2.993599, 6,
-3.252217, -3.138223, 6
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
-3.578835, -3.427471, -4, 0, -0.5, 0.5, 0.5,
-3.578835, -3.427471, -4, 1, -0.5, 0.5, 0.5,
-3.578835, -3.427471, -4, 1, 1.5, 0.5, 0.5,
-3.578835, -3.427471, -4, 0, 1.5, 0.5, 0.5,
-3.578835, -3.427471, -2, 0, -0.5, 0.5, 0.5,
-3.578835, -3.427471, -2, 1, -0.5, 0.5, 0.5,
-3.578835, -3.427471, -2, 1, 1.5, 0.5, 0.5,
-3.578835, -3.427471, -2, 0, 1.5, 0.5, 0.5,
-3.578835, -3.427471, 0, 0, -0.5, 0.5, 0.5,
-3.578835, -3.427471, 0, 1, -0.5, 0.5, 0.5,
-3.578835, -3.427471, 0, 1, 1.5, 0.5, 0.5,
-3.578835, -3.427471, 0, 0, 1.5, 0.5, 0.5,
-3.578835, -3.427471, 2, 0, -0.5, 0.5, 0.5,
-3.578835, -3.427471, 2, 1, -0.5, 0.5, 0.5,
-3.578835, -3.427471, 2, 1, 1.5, 0.5, 0.5,
-3.578835, -3.427471, 2, 0, 1.5, 0.5, 0.5,
-3.578835, -3.427471, 4, 0, -0.5, 0.5, 0.5,
-3.578835, -3.427471, 4, 1, -0.5, 0.5, 0.5,
-3.578835, -3.427471, 4, 1, 1.5, 0.5, 0.5,
-3.578835, -3.427471, 4, 0, 1.5, 0.5, 0.5,
-3.578835, -3.427471, 6, 0, -0.5, 0.5, 0.5,
-3.578835, -3.427471, 6, 1, -0.5, 0.5, 0.5,
-3.578835, -3.427471, 6, 1, 1.5, 0.5, 0.5,
-3.578835, -3.427471, 6, 0, 1.5, 0.5, 0.5
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
-3.088907, -2.993599, -4.995177,
-3.088907, 2.791369, -4.995177,
-3.088907, -2.993599, 6.372351,
-3.088907, 2.791369, 6.372351,
-3.088907, -2.993599, -4.995177,
-3.088907, -2.993599, 6.372351,
-3.088907, 2.791369, -4.995177,
-3.088907, 2.791369, 6.372351,
-3.088907, -2.993599, -4.995177,
3.443456, -2.993599, -4.995177,
-3.088907, -2.993599, 6.372351,
3.443456, -2.993599, 6.372351,
-3.088907, 2.791369, -4.995177,
3.443456, 2.791369, -4.995177,
-3.088907, 2.791369, 6.372351,
3.443456, 2.791369, 6.372351,
3.443456, -2.993599, -4.995177,
3.443456, 2.791369, -4.995177,
3.443456, -2.993599, 6.372351,
3.443456, 2.791369, 6.372351,
3.443456, -2.993599, -4.995177,
3.443456, -2.993599, 6.372351,
3.443456, 2.791369, -4.995177,
3.443456, 2.791369, 6.372351
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
var radius = 7.652117;
var distance = 34.04514;
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
mvMatrix.translate( -0.1772742, 0.1011151, -0.6885867 );
mvMatrix.scale( 1.266558, 1.430193, 0.7278292 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.04514);
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
dimethomorph<-read.table("dimethomorph.xyz")
```

```
## Error in read.table("dimethomorph.xyz"): no lines available in input
```

```r
x<-dimethomorph$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethomorph' not found
```

```r
y<-dimethomorph$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethomorph' not found
```

```r
z<-dimethomorph$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethomorph' not found
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
-2.993776, 0.3054335, -0.4621128, 0, 0, 1, 1, 1,
-2.761339, -1.415289, -2.149163, 1, 0, 0, 1, 1,
-2.753898, 0.6580484, -0.6201836, 1, 0, 0, 1, 1,
-2.709428, -0.8314471, -3.642261, 1, 0, 0, 1, 1,
-2.648506, 0.6258963, -2.431075, 1, 0, 0, 1, 1,
-2.633469, -0.3135379, -0.6313221, 1, 0, 0, 1, 1,
-2.62074, 1.116799, 1.59453, 0, 0, 0, 1, 1,
-2.572475, -0.7536347, -2.353151, 0, 0, 0, 1, 1,
-2.530396, 2.573144, 0.218902, 0, 0, 0, 1, 1,
-2.51176, -1.188092, -2.900425, 0, 0, 0, 1, 1,
-2.495202, -0.2237716, -0.9560141, 0, 0, 0, 1, 1,
-2.363455, 0.1563467, -0.2049547, 0, 0, 0, 1, 1,
-2.348487, -0.8891572, -0.4499629, 0, 0, 0, 1, 1,
-2.266819, -0.4821236, -0.4920867, 1, 1, 1, 1, 1,
-2.232282, 0.7354677, 0.3844503, 1, 1, 1, 1, 1,
-2.22858, 0.2676687, -1.683526, 1, 1, 1, 1, 1,
-2.227064, 0.6429487, -3.609838, 1, 1, 1, 1, 1,
-2.209988, -0.3189554, 0.9939615, 1, 1, 1, 1, 1,
-2.187929, 1.257717, -4.231598, 1, 1, 1, 1, 1,
-2.170648, 1.336545, -0.9815378, 1, 1, 1, 1, 1,
-2.154621, -0.1777432, -1.148539, 1, 1, 1, 1, 1,
-2.139637, 1.010849, -0.8280934, 1, 1, 1, 1, 1,
-2.133885, 0.08745328, -2.878521, 1, 1, 1, 1, 1,
-2.109823, 0.593343, -1.13837, 1, 1, 1, 1, 1,
-2.105214, 1.698525, -0.2307625, 1, 1, 1, 1, 1,
-2.070691, 1.340034, -0.8973781, 1, 1, 1, 1, 1,
-2.058074, 0.507317, -1.128142, 1, 1, 1, 1, 1,
-2.024775, 0.1979374, -0.8528786, 1, 1, 1, 1, 1,
-1.999234, 1.420161, -2.216343, 0, 0, 1, 1, 1,
-1.962936, 1.515162, -2.601836, 1, 0, 0, 1, 1,
-1.925187, 1.834074, -1.332552, 1, 0, 0, 1, 1,
-1.915426, 1.432033, 0.5723702, 1, 0, 0, 1, 1,
-1.89383, 0.001940288, -2.253587, 1, 0, 0, 1, 1,
-1.875049, 1.345047, -0.6044576, 1, 0, 0, 1, 1,
-1.85832, 0.3566921, -0.813277, 0, 0, 0, 1, 1,
-1.856768, -0.2880125, -1.604733, 0, 0, 0, 1, 1,
-1.841003, 0.242528, -1.370528, 0, 0, 0, 1, 1,
-1.81724, 0.2791909, -0.6775255, 0, 0, 0, 1, 1,
-1.814362, 2.598047, 0.556549, 0, 0, 0, 1, 1,
-1.813503, -0.4719017, -2.46158, 0, 0, 0, 1, 1,
-1.807309, 1.08381, -0.2465353, 0, 0, 0, 1, 1,
-1.797645, -0.3749285, -2.763741, 1, 1, 1, 1, 1,
-1.794477, 1.654688, -0.5242752, 1, 1, 1, 1, 1,
-1.793997, 0.6596187, -0.2971731, 1, 1, 1, 1, 1,
-1.76789, 0.7727273, -1.658788, 1, 1, 1, 1, 1,
-1.767648, -1.767662, -1.891176, 1, 1, 1, 1, 1,
-1.761789, 1.088406, -1.127487, 1, 1, 1, 1, 1,
-1.74984, 0.9263259, 1.108571, 1, 1, 1, 1, 1,
-1.745271, 2.584932, -0.4799432, 1, 1, 1, 1, 1,
-1.742881, -0.9956309, -1.791229, 1, 1, 1, 1, 1,
-1.734547, 1.197204, -0.6863683, 1, 1, 1, 1, 1,
-1.722678, -0.2856994, -1.752311, 1, 1, 1, 1, 1,
-1.710601, -0.5294172, -0.6597375, 1, 1, 1, 1, 1,
-1.709699, 0.07757996, -3.572529, 1, 1, 1, 1, 1,
-1.706889, 0.9147865, -1.766357, 1, 1, 1, 1, 1,
-1.706506, -2.909352, -2.798061, 1, 1, 1, 1, 1,
-1.705588, -0.4455943, -2.474794, 0, 0, 1, 1, 1,
-1.70453, 0.0762851, -1.90823, 1, 0, 0, 1, 1,
-1.702065, -0.8007994, -2.908854, 1, 0, 0, 1, 1,
-1.697887, 1.051196, -0.2669182, 1, 0, 0, 1, 1,
-1.680856, 1.530056, -2.036279, 1, 0, 0, 1, 1,
-1.67281, 0.2370407, -1.507435, 1, 0, 0, 1, 1,
-1.668724, 0.4122318, -2.379654, 0, 0, 0, 1, 1,
-1.667745, -0.5267289, -3.114632, 0, 0, 0, 1, 1,
-1.657971, -0.4439044, -2.372412, 0, 0, 0, 1, 1,
-1.651279, 0.5892258, -0.4998325, 0, 0, 0, 1, 1,
-1.648745, 0.6834554, -0.6710246, 0, 0, 0, 1, 1,
-1.640015, -0.06054572, -3.237268, 0, 0, 0, 1, 1,
-1.635986, -0.7017839, -2.911518, 0, 0, 0, 1, 1,
-1.632545, 0.2916157, -2.578032, 1, 1, 1, 1, 1,
-1.631624, -0.3792525, -2.42485, 1, 1, 1, 1, 1,
-1.630426, -0.1307829, -0.7777184, 1, 1, 1, 1, 1,
-1.628759, -2.804064, -1.50111, 1, 1, 1, 1, 1,
-1.622723, -0.9230762, -1.188554, 1, 1, 1, 1, 1,
-1.621952, 0.9507649, -0.1705904, 1, 1, 1, 1, 1,
-1.621699, 2.201028, -1.524907, 1, 1, 1, 1, 1,
-1.615536, 0.559504, -1.472949, 1, 1, 1, 1, 1,
-1.615126, -1.660686, -2.159748, 1, 1, 1, 1, 1,
-1.599717, 0.7957425, -0.04175562, 1, 1, 1, 1, 1,
-1.593052, -0.1426517, -0.697361, 1, 1, 1, 1, 1,
-1.584456, -0.9254023, -2.183733, 1, 1, 1, 1, 1,
-1.565974, 0.4679804, -2.0655, 1, 1, 1, 1, 1,
-1.558488, 0.02268147, -0.9020366, 1, 1, 1, 1, 1,
-1.54805, -0.428428, -2.438992, 1, 1, 1, 1, 1,
-1.530105, -0.3346417, -1.962433, 0, 0, 1, 1, 1,
-1.515175, -1.140489, -1.196787, 1, 0, 0, 1, 1,
-1.51135, -1.34598, -0.9111893, 1, 0, 0, 1, 1,
-1.508047, 2.707122, -1.948231, 1, 0, 0, 1, 1,
-1.506152, 1.218203, -2.415995, 1, 0, 0, 1, 1,
-1.501686, -0.1547688, -1.178901, 1, 0, 0, 1, 1,
-1.488924, 0.3224, -1.814264, 0, 0, 0, 1, 1,
-1.478167, -0.9893465, -0.8485869, 0, 0, 0, 1, 1,
-1.477136, 1.21653, -3.038128, 0, 0, 0, 1, 1,
-1.47112, -0.8551715, -3.163329, 0, 0, 0, 1, 1,
-1.470424, -0.2123463, -1.88937, 0, 0, 0, 1, 1,
-1.465419, -0.168369, -3.395313, 0, 0, 0, 1, 1,
-1.433331, -2.024266, -1.680086, 0, 0, 0, 1, 1,
-1.429196, -0.4206181, -0.8335282, 1, 1, 1, 1, 1,
-1.424527, 0.05321682, -0.8737085, 1, 1, 1, 1, 1,
-1.419774, -0.2136409, -3.39344, 1, 1, 1, 1, 1,
-1.415741, -0.9819499, -2.575155, 1, 1, 1, 1, 1,
-1.411417, -0.1704557, -2.044555, 1, 1, 1, 1, 1,
-1.400243, 0.9291976, -2.575686, 1, 1, 1, 1, 1,
-1.396613, -0.3504407, -1.647973, 1, 1, 1, 1, 1,
-1.386581, 0.9221337, -1.573468, 1, 1, 1, 1, 1,
-1.378221, -0.7638664, -1.677247, 1, 1, 1, 1, 1,
-1.372117, -1.380018, -1.437635, 1, 1, 1, 1, 1,
-1.362664, 2.106641, 0.08502211, 1, 1, 1, 1, 1,
-1.360678, 1.608112, 0.4059154, 1, 1, 1, 1, 1,
-1.324581, 0.2211641, -2.25789, 1, 1, 1, 1, 1,
-1.31838, -0.5811658, -2.311959, 1, 1, 1, 1, 1,
-1.312255, 0.4832227, -1.862998, 1, 1, 1, 1, 1,
-1.306364, -1.473535, -4.674917, 0, 0, 1, 1, 1,
-1.304109, 0.2570541, -1.804807, 1, 0, 0, 1, 1,
-1.300095, 2.266102, -1.386007, 1, 0, 0, 1, 1,
-1.288741, 0.8769218, -0.2488464, 1, 0, 0, 1, 1,
-1.288221, -0.305966, -1.419984, 1, 0, 0, 1, 1,
-1.286967, -1.387369, -2.907192, 1, 0, 0, 1, 1,
-1.284731, -1.130813, -2.792768, 0, 0, 0, 1, 1,
-1.283111, 0.1300297, -2.892938, 0, 0, 0, 1, 1,
-1.280891, 1.656168, -1.110178, 0, 0, 0, 1, 1,
-1.270875, 1.04169, -1.070868, 0, 0, 0, 1, 1,
-1.26631, 0.1526366, -2.057651, 0, 0, 0, 1, 1,
-1.256451, -0.2124975, -2.391046, 0, 0, 0, 1, 1,
-1.239405, -1.670608, -2.344609, 0, 0, 0, 1, 1,
-1.228744, -0.3699986, -3.03012, 1, 1, 1, 1, 1,
-1.22674, -0.3731922, -1.824089, 1, 1, 1, 1, 1,
-1.225844, -0.03393685, -1.092702, 1, 1, 1, 1, 1,
-1.22543, 0.6604076, -0.5093181, 1, 1, 1, 1, 1,
-1.222123, 0.612492, -0.5467457, 1, 1, 1, 1, 1,
-1.219035, -0.2335199, -0.912368, 1, 1, 1, 1, 1,
-1.214604, -0.4840135, -2.453621, 1, 1, 1, 1, 1,
-1.211006, -0.2927964, -1.329596, 1, 1, 1, 1, 1,
-1.202955, 0.5839417, -1.756818, 1, 1, 1, 1, 1,
-1.200577, -0.7571938, -1.713596, 1, 1, 1, 1, 1,
-1.19582, 0.1553778, 0.8200898, 1, 1, 1, 1, 1,
-1.188025, -0.1792376, -2.454512, 1, 1, 1, 1, 1,
-1.184907, 0.03995741, 0.4204617, 1, 1, 1, 1, 1,
-1.17898, -0.715398, -1.894226, 1, 1, 1, 1, 1,
-1.178598, -0.9634941, -1.236451, 1, 1, 1, 1, 1,
-1.171139, 1.240804, 1.062943, 0, 0, 1, 1, 1,
-1.165337, -0.09639369, -1.894211, 1, 0, 0, 1, 1,
-1.156915, 1.150075, -2.932965, 1, 0, 0, 1, 1,
-1.154014, 1.575143, 0.3927746, 1, 0, 0, 1, 1,
-1.139121, -1.196964, -2.558786, 1, 0, 0, 1, 1,
-1.129536, -0.7374349, -2.234465, 1, 0, 0, 1, 1,
-1.126684, -0.2681847, -1.045893, 0, 0, 0, 1, 1,
-1.119869, -0.9161532, -0.6872802, 0, 0, 0, 1, 1,
-1.119758, -0.8209969, -1.932458, 0, 0, 0, 1, 1,
-1.115672, 1.180546, 0.08347016, 0, 0, 0, 1, 1,
-1.113972, 1.057422, -0.4074675, 0, 0, 0, 1, 1,
-1.109389, 0.2647264, -1.247973, 0, 0, 0, 1, 1,
-1.108918, 0.09392031, -2.765522, 0, 0, 0, 1, 1,
-1.108334, -0.5593802, -2.96933, 1, 1, 1, 1, 1,
-1.095024, 2.164671, 0.1569778, 1, 1, 1, 1, 1,
-1.092732, 1.192182, -2.596476, 1, 1, 1, 1, 1,
-1.074458, -1.784117, -1.119888, 1, 1, 1, 1, 1,
-1.057975, -1.38997, -3.316373, 1, 1, 1, 1, 1,
-1.057685, 2.475109, -2.16817, 1, 1, 1, 1, 1,
-1.055583, -1.189088, -2.884223, 1, 1, 1, 1, 1,
-1.044465, -0.233013, -2.118843, 1, 1, 1, 1, 1,
-1.042241, 0.3722141, -1.500214, 1, 1, 1, 1, 1,
-1.038752, 0.4383574, -0.9457734, 1, 1, 1, 1, 1,
-1.035998, 0.9814346, -0.4985349, 1, 1, 1, 1, 1,
-1.033943, 1.905666, 0.6066464, 1, 1, 1, 1, 1,
-1.031982, 0.6634891, -1.2373, 1, 1, 1, 1, 1,
-1.023922, -1.317127, -0.4830032, 1, 1, 1, 1, 1,
-1.022048, -0.6033701, -1.783846, 1, 1, 1, 1, 1,
-1.004547, -0.595135, -4.695153, 0, 0, 1, 1, 1,
-0.9858478, -0.8467405, -2.480687, 1, 0, 0, 1, 1,
-0.9832333, 1.17234, -1.481627, 1, 0, 0, 1, 1,
-0.9831083, -0.9423593, -1.216729, 1, 0, 0, 1, 1,
-0.9760402, -0.2244021, -1.526325, 1, 0, 0, 1, 1,
-0.9733567, 1.142979, 0.06714544, 1, 0, 0, 1, 1,
-0.9720232, 1.440348, 0.2011362, 0, 0, 0, 1, 1,
-0.9658785, 0.7123878, 0.4998622, 0, 0, 0, 1, 1,
-0.9642822, -2.140228, -2.949695, 0, 0, 0, 1, 1,
-0.963061, 0.09409578, -0.6593978, 0, 0, 0, 1, 1,
-0.9572887, -0.3251655, -1.916288, 0, 0, 0, 1, 1,
-0.9551948, -1.706472, -3.898273, 0, 0, 0, 1, 1,
-0.9522014, 0.01281059, -1.268904, 0, 0, 0, 1, 1,
-0.9465626, 0.03562748, -3.135408, 1, 1, 1, 1, 1,
-0.9393939, -0.2528484, 0.1893369, 1, 1, 1, 1, 1,
-0.9377972, 2.169554, -1.04057, 1, 1, 1, 1, 1,
-0.9362099, -0.7622125, -1.033594, 1, 1, 1, 1, 1,
-0.9325199, 0.002235554, -2.002465, 1, 1, 1, 1, 1,
-0.9284113, -0.3246695, -4.081473, 1, 1, 1, 1, 1,
-0.9263623, -0.5154548, -1.615946, 1, 1, 1, 1, 1,
-0.9249681, 1.468025, -1.04557, 1, 1, 1, 1, 1,
-0.9175341, 0.9456271, -0.8319761, 1, 1, 1, 1, 1,
-0.9136274, 0.9406632, 0.09109881, 1, 1, 1, 1, 1,
-0.9124602, -0.4832317, -2.212589, 1, 1, 1, 1, 1,
-0.9118816, -1.671466, -1.83145, 1, 1, 1, 1, 1,
-0.9080101, -0.3645114, -1.848979, 1, 1, 1, 1, 1,
-0.9018028, -2.391935, -3.096574, 1, 1, 1, 1, 1,
-0.897144, 0.3449453, -0.1845989, 1, 1, 1, 1, 1,
-0.8970906, -0.6589426, -2.762831, 0, 0, 1, 1, 1,
-0.8965819, -0.7425684, -2.401363, 1, 0, 0, 1, 1,
-0.894317, -0.4127422, -1.378012, 1, 0, 0, 1, 1,
-0.8936558, 0.8010557, -0.5191383, 1, 0, 0, 1, 1,
-0.8879003, -0.063223, -2.255778, 1, 0, 0, 1, 1,
-0.8835175, -0.3546605, -2.469039, 1, 0, 0, 1, 1,
-0.8806581, 1.235512, -0.2958235, 0, 0, 0, 1, 1,
-0.8622743, 0.7885828, 1.799292, 0, 0, 0, 1, 1,
-0.8441625, -0.2622316, -2.88122, 0, 0, 0, 1, 1,
-0.8372653, 1.20382, -2.140874, 0, 0, 0, 1, 1,
-0.8287192, 0.1233755, 0.5948199, 0, 0, 0, 1, 1,
-0.8259596, -1.797102, -2.881368, 0, 0, 0, 1, 1,
-0.8206291, -0.7899857, -0.5582982, 0, 0, 0, 1, 1,
-0.8187459, -0.1108183, -2.011948, 1, 1, 1, 1, 1,
-0.817602, -0.2980928, -1.844727, 1, 1, 1, 1, 1,
-0.8076014, -0.2226793, -0.5897839, 1, 1, 1, 1, 1,
-0.802496, 0.8380157, -1.084889, 1, 1, 1, 1, 1,
-0.8023143, -1.071003, -3.967986, 1, 1, 1, 1, 1,
-0.7995614, 0.05531199, -2.01915, 1, 1, 1, 1, 1,
-0.7980125, 0.1931173, -0.2149913, 1, 1, 1, 1, 1,
-0.7973714, -2.058061, -3.150372, 1, 1, 1, 1, 1,
-0.7909226, -0.3881902, -1.320153, 1, 1, 1, 1, 1,
-0.7874127, -1.103405, -3.246949, 1, 1, 1, 1, 1,
-0.7862976, -1.754839, -1.576232, 1, 1, 1, 1, 1,
-0.7813671, -0.4150153, -1.649984, 1, 1, 1, 1, 1,
-0.7812583, 1.83325, 1.344776, 1, 1, 1, 1, 1,
-0.7778097, -0.9050909, -2.949835, 1, 1, 1, 1, 1,
-0.7731468, 0.3110651, -0.9865426, 1, 1, 1, 1, 1,
-0.7703546, 0.1228432, -0.1085162, 0, 0, 1, 1, 1,
-0.7682987, -1.258789, -3.063741, 1, 0, 0, 1, 1,
-0.7677691, -1.733087, -3.507936, 1, 0, 0, 1, 1,
-0.767152, 1.55646, -2.308577, 1, 0, 0, 1, 1,
-0.765533, 1.94819, 0.3975492, 1, 0, 0, 1, 1,
-0.7627902, 1.590239, 0.9798957, 1, 0, 0, 1, 1,
-0.7625822, 0.4449089, 0.1232553, 0, 0, 0, 1, 1,
-0.7560956, 0.02385639, -3.923421, 0, 0, 0, 1, 1,
-0.755518, 0.7016205, 0.9754077, 0, 0, 0, 1, 1,
-0.750664, -0.8265232, -0.4468473, 0, 0, 0, 1, 1,
-0.7497463, -1.119715, -2.736749, 0, 0, 0, 1, 1,
-0.7493234, -0.08001387, -1.141346, 0, 0, 0, 1, 1,
-0.7487554, 0.4389461, -1.477924, 0, 0, 0, 1, 1,
-0.7478824, 1.03741, -0.3504399, 1, 1, 1, 1, 1,
-0.7469565, 1.209525, -0.2448859, 1, 1, 1, 1, 1,
-0.7425405, 0.8557115, -2.910375, 1, 1, 1, 1, 1,
-0.7370138, -0.3812342, -1.467386, 1, 1, 1, 1, 1,
-0.7345461, 0.3717045, -2.821777, 1, 1, 1, 1, 1,
-0.7239581, 0.3226708, -1.009903, 1, 1, 1, 1, 1,
-0.7217836, 0.8414639, -0.9078482, 1, 1, 1, 1, 1,
-0.7177639, -0.3521049, -1.955357, 1, 1, 1, 1, 1,
-0.7171752, 0.2115923, -2.247936, 1, 1, 1, 1, 1,
-0.6956951, -1.258489, -0.7341648, 1, 1, 1, 1, 1,
-0.6914558, -1.918281, -1.520764, 1, 1, 1, 1, 1,
-0.6848477, 1.031872, -1.105828, 1, 1, 1, 1, 1,
-0.6835452, 0.261835, -1.980673, 1, 1, 1, 1, 1,
-0.6830994, 0.6358671, 0.5179813, 1, 1, 1, 1, 1,
-0.6775048, 0.6639955, -2.548248, 1, 1, 1, 1, 1,
-0.6744828, 0.418285, -2.036981, 0, 0, 1, 1, 1,
-0.6741798, 0.8366278, 0.3956803, 1, 0, 0, 1, 1,
-0.670677, 0.1040512, -1.148069, 1, 0, 0, 1, 1,
-0.6684808, -0.2064053, -2.104824, 1, 0, 0, 1, 1,
-0.6683753, 0.03902365, -3.85714, 1, 0, 0, 1, 1,
-0.6633433, 0.8254485, -1.056363, 1, 0, 0, 1, 1,
-0.6610517, 0.2444632, 0.3054724, 0, 0, 0, 1, 1,
-0.6574944, 0.9926825, -0.4017152, 0, 0, 0, 1, 1,
-0.6487472, -0.02328404, -1.257504, 0, 0, 0, 1, 1,
-0.6477533, -2.193107, -2.055177, 0, 0, 0, 1, 1,
-0.6468773, 0.1919203, -2.90411, 0, 0, 0, 1, 1,
-0.6460222, 0.8421798, -1.934837, 0, 0, 0, 1, 1,
-0.6453624, 0.3698451, -0.6739545, 0, 0, 0, 1, 1,
-0.642563, 0.04702931, -1.642488, 1, 1, 1, 1, 1,
-0.6421473, 0.9708503, -0.8886152, 1, 1, 1, 1, 1,
-0.6272715, -0.3177138, -3.73577, 1, 1, 1, 1, 1,
-0.6266249, 0.8538882, -1.44999, 1, 1, 1, 1, 1,
-0.6237602, 0.4504264, -1.390686, 1, 1, 1, 1, 1,
-0.621226, -0.3966285, -2.279345, 1, 1, 1, 1, 1,
-0.6183984, -0.1486589, 0.2010491, 1, 1, 1, 1, 1,
-0.6164509, 0.4830143, 0.2450656, 1, 1, 1, 1, 1,
-0.6129033, -0.04262231, -0.7710812, 1, 1, 1, 1, 1,
-0.6109784, -0.524044, -2.344089, 1, 1, 1, 1, 1,
-0.6097609, -0.9283957, -4.112006, 1, 1, 1, 1, 1,
-0.6088078, 0.00799384, -2.15789, 1, 1, 1, 1, 1,
-0.6084689, 0.7393066, 0.1671859, 1, 1, 1, 1, 1,
-0.6077688, 0.8507185, -2.381919, 1, 1, 1, 1, 1,
-0.6063578, 0.5374417, -0.5075909, 1, 1, 1, 1, 1,
-0.6043854, -0.3608866, -2.597374, 0, 0, 1, 1, 1,
-0.602071, -0.02383267, -3.118609, 1, 0, 0, 1, 1,
-0.5974994, 1.301087, -1.341936, 1, 0, 0, 1, 1,
-0.5933852, 0.1636276, -1.145821, 1, 0, 0, 1, 1,
-0.588703, -0.9163525, -1.117829, 1, 0, 0, 1, 1,
-0.5853422, -0.7588012, -2.304631, 1, 0, 0, 1, 1,
-0.5851584, -1.094475, -2.618429, 0, 0, 0, 1, 1,
-0.5850262, -0.838663, -2.433996, 0, 0, 0, 1, 1,
-0.5833644, -0.3038549, -0.7531953, 0, 0, 0, 1, 1,
-0.5806453, 1.677453, -1.321713, 0, 0, 0, 1, 1,
-0.5802042, -0.2608616, -1.77633, 0, 0, 0, 1, 1,
-0.5738752, -0.2133842, -1.27982, 0, 0, 0, 1, 1,
-0.569496, 0.04435606, -0.5693893, 0, 0, 0, 1, 1,
-0.5661476, -0.2887505, -0.4005909, 1, 1, 1, 1, 1,
-0.5604951, 1.825838, -0.9620769, 1, 1, 1, 1, 1,
-0.5600242, -1.412399, -3.670951, 1, 1, 1, 1, 1,
-0.5550365, -0.03957412, -2.913729, 1, 1, 1, 1, 1,
-0.5537494, 1.306556, 0.9371069, 1, 1, 1, 1, 1,
-0.5518292, -0.1692843, -1.712301, 1, 1, 1, 1, 1,
-0.5515198, -1.541093, -3.353648, 1, 1, 1, 1, 1,
-0.5512857, 0.2477417, 1.026817, 1, 1, 1, 1, 1,
-0.5511563, 0.3416444, -0.2075122, 1, 1, 1, 1, 1,
-0.5492159, -0.2721553, -1.291624, 1, 1, 1, 1, 1,
-0.5479127, -1.363851, -3.611503, 1, 1, 1, 1, 1,
-0.5447227, 1.619839, -0.9716556, 1, 1, 1, 1, 1,
-0.5406299, -0.9819055, -2.914304, 1, 1, 1, 1, 1,
-0.5369235, 0.9469221, 0.543468, 1, 1, 1, 1, 1,
-0.5355331, 0.2613051, -3.465635, 1, 1, 1, 1, 1,
-0.5338541, -0.1689848, -1.438835, 0, 0, 1, 1, 1,
-0.5330477, -1.03973, -1.938247, 1, 0, 0, 1, 1,
-0.5255916, -0.8599839, -4.163624, 1, 0, 0, 1, 1,
-0.5183043, 0.8900333, -0.6285099, 1, 0, 0, 1, 1,
-0.5172501, -0.7756835, -3.08233, 1, 0, 0, 1, 1,
-0.5113451, -1.748873, -3.90755, 1, 0, 0, 1, 1,
-0.510419, 1.681219, 0.5140268, 0, 0, 0, 1, 1,
-0.505848, 0.05482728, -0.7402526, 0, 0, 0, 1, 1,
-0.5057707, 1.624532, -0.5685158, 0, 0, 0, 1, 1,
-0.4993308, 2.038757, 0.3856152, 0, 0, 0, 1, 1,
-0.4978784, 2.116382, -1.621628, 0, 0, 0, 1, 1,
-0.4911073, 1.325462, 0.66417, 0, 0, 0, 1, 1,
-0.4847433, 0.6228218, 0.7404934, 0, 0, 0, 1, 1,
-0.4811383, -1.101373, -2.004062, 1, 1, 1, 1, 1,
-0.4809688, -0.1328175, -1.845875, 1, 1, 1, 1, 1,
-0.4725058, -1.101921, -2.165148, 1, 1, 1, 1, 1,
-0.4722677, 0.3996358, -0.7205673, 1, 1, 1, 1, 1,
-0.4706309, 1.024464, 0.5533271, 1, 1, 1, 1, 1,
-0.4689256, -0.1578335, -1.497883, 1, 1, 1, 1, 1,
-0.4650694, 0.6336255, -1.757859, 1, 1, 1, 1, 1,
-0.4641054, -0.2570204, -1.626426, 1, 1, 1, 1, 1,
-0.4606071, -1.546511, -2.845018, 1, 1, 1, 1, 1,
-0.4598214, -0.5548702, -2.297599, 1, 1, 1, 1, 1,
-0.4585308, 2.006929, 0.3353205, 1, 1, 1, 1, 1,
-0.4507225, -0.03630196, -1.39715, 1, 1, 1, 1, 1,
-0.4498842, -0.03320853, -1.337638, 1, 1, 1, 1, 1,
-0.4476476, -0.2415743, -2.113836, 1, 1, 1, 1, 1,
-0.4471184, 0.4148276, -2.758646, 1, 1, 1, 1, 1,
-0.4470929, -1.356861, -1.807021, 0, 0, 1, 1, 1,
-0.4452645, 2.360082, -0.7347925, 1, 0, 0, 1, 1,
-0.4414183, 0.940895, -1.081108, 1, 0, 0, 1, 1,
-0.4408662, -0.7435316, -2.710103, 1, 0, 0, 1, 1,
-0.4383058, 0.9231637, -0.4818734, 1, 0, 0, 1, 1,
-0.4351075, 0.9497091, 0.7405739, 1, 0, 0, 1, 1,
-0.4297179, -0.5795406, -2.875053, 0, 0, 0, 1, 1,
-0.4284064, 0.9213625, -2.052385, 0, 0, 0, 1, 1,
-0.4272675, -0.02496439, -1.029585, 0, 0, 0, 1, 1,
-0.4263165, 0.436742, -0.648177, 0, 0, 0, 1, 1,
-0.4208159, -0.403072, -0.9372224, 0, 0, 0, 1, 1,
-0.4189393, -2.496602, -2.494432, 0, 0, 0, 1, 1,
-0.4127632, 0.6724843, 0.7110983, 0, 0, 0, 1, 1,
-0.4124281, -0.9650946, -1.702011, 1, 1, 1, 1, 1,
-0.408095, 0.5397081, 1.533344, 1, 1, 1, 1, 1,
-0.403063, 0.586071, -0.850513, 1, 1, 1, 1, 1,
-0.402548, 0.9818078, -0.8057715, 1, 1, 1, 1, 1,
-0.3989307, -1.592066, -4.14351, 1, 1, 1, 1, 1,
-0.3972174, 0.705606, -0.4753769, 1, 1, 1, 1, 1,
-0.3941944, -1.9159, -4.829631, 1, 1, 1, 1, 1,
-0.390333, -0.5902351, -2.687043, 1, 1, 1, 1, 1,
-0.3878424, 0.9829444, -0.4840158, 1, 1, 1, 1, 1,
-0.3877476, 0.6043007, -0.347034, 1, 1, 1, 1, 1,
-0.3824435, 0.05015332, -1.582242, 1, 1, 1, 1, 1,
-0.3813026, -0.316663, -1.75183, 1, 1, 1, 1, 1,
-0.3812861, -1.390529, -3.389351, 1, 1, 1, 1, 1,
-0.3791668, -0.2285606, -3.067318, 1, 1, 1, 1, 1,
-0.376854, 0.7834184, 0.2779818, 1, 1, 1, 1, 1,
-0.37653, 0.1834993, -2.368196, 0, 0, 1, 1, 1,
-0.3749659, -0.4817515, -3.140117, 1, 0, 0, 1, 1,
-0.3727366, 0.6628844, 0.2215052, 1, 0, 0, 1, 1,
-0.3708671, -0.3694058, -1.619957, 1, 0, 0, 1, 1,
-0.3685198, -0.1111939, -1.040268, 1, 0, 0, 1, 1,
-0.3675906, -0.4224509, -1.601484, 1, 0, 0, 1, 1,
-0.3631373, 0.79734, -1.418286, 0, 0, 0, 1, 1,
-0.3631068, 1.770368, -1.418767, 0, 0, 0, 1, 1,
-0.362262, -1.485408, -3.049243, 0, 0, 0, 1, 1,
-0.3609778, -0.08451078, -1.492215, 0, 0, 0, 1, 1,
-0.3600442, 0.8097696, -0.3630207, 0, 0, 0, 1, 1,
-0.3594961, -1.408265, -2.401855, 0, 0, 0, 1, 1,
-0.3589431, -0.707579, -2.591407, 0, 0, 0, 1, 1,
-0.3576772, -1.089175, -3.034897, 1, 1, 1, 1, 1,
-0.3566203, 1.075812, -1.646541, 1, 1, 1, 1, 1,
-0.3557947, 0.5499378, -2.089575, 1, 1, 1, 1, 1,
-0.3550195, -0.8464157, -3.125146, 1, 1, 1, 1, 1,
-0.3520461, 1.307199, -0.5005173, 1, 1, 1, 1, 1,
-0.3505796, -0.1881033, -0.5420868, 1, 1, 1, 1, 1,
-0.3497801, 0.1950879, 2.403023, 1, 1, 1, 1, 1,
-0.3492165, 0.4483073, 0.5783982, 1, 1, 1, 1, 1,
-0.3426278, 1.366871, -3.346798, 1, 1, 1, 1, 1,
-0.3411801, -0.1537945, -2.326775, 1, 1, 1, 1, 1,
-0.3408514, -0.2049527, -2.003392, 1, 1, 1, 1, 1,
-0.3358452, -0.1084706, -2.221229, 1, 1, 1, 1, 1,
-0.3335993, -0.04437095, -0.7672358, 1, 1, 1, 1, 1,
-0.3257524, 1.243405, -0.2918208, 1, 1, 1, 1, 1,
-0.3206138, -1.227434, -3.451122, 1, 1, 1, 1, 1,
-0.3166333, 1.810676, -1.739225, 0, 0, 1, 1, 1,
-0.315762, -0.09324154, -2.726182, 1, 0, 0, 1, 1,
-0.3094625, 0.2172187, -1.397427, 1, 0, 0, 1, 1,
-0.3049132, 0.6208401, -1.478922, 1, 0, 0, 1, 1,
-0.3042854, 0.4628485, 0.4924232, 1, 0, 0, 1, 1,
-0.3020475, 0.9561043, 0.4826115, 1, 0, 0, 1, 1,
-0.3014416, 0.09289372, -0.9910005, 0, 0, 0, 1, 1,
-0.29956, -0.05925685, -0.6733778, 0, 0, 0, 1, 1,
-0.2970452, -2.229637, -2.162058, 0, 0, 0, 1, 1,
-0.2942913, 0.0477194, -1.801714, 0, 0, 0, 1, 1,
-0.2901045, -0.389715, -1.536704, 0, 0, 0, 1, 1,
-0.2892589, -0.1360412, -1.683644, 0, 0, 0, 1, 1,
-0.2847101, 1.97882, -0.4364748, 0, 0, 0, 1, 1,
-0.2792413, 0.5679277, -0.8483084, 1, 1, 1, 1, 1,
-0.274029, 2.371673, 0.4895343, 1, 1, 1, 1, 1,
-0.2726031, -0.5258083, -3.672786, 1, 1, 1, 1, 1,
-0.2678815, 0.4341402, -0.7357967, 1, 1, 1, 1, 1,
-0.2676027, 1.498226, 1.170144, 1, 1, 1, 1, 1,
-0.2660414, 0.5712348, -2.380134, 1, 1, 1, 1, 1,
-0.2644415, -1.237458, -2.013466, 1, 1, 1, 1, 1,
-0.2603754, 1.135642, -0.7287654, 1, 1, 1, 1, 1,
-0.259228, -0.3793119, -3.213955, 1, 1, 1, 1, 1,
-0.2581204, -1.92119, -1.313628, 1, 1, 1, 1, 1,
-0.255528, 0.2596515, -1.639607, 1, 1, 1, 1, 1,
-0.2499808, -0.2322795, -2.786474, 1, 1, 1, 1, 1,
-0.2488571, -1.450341, -2.976955, 1, 1, 1, 1, 1,
-0.241793, 0.3236248, -0.2763551, 1, 1, 1, 1, 1,
-0.2415505, 0.1902199, 0.264708, 1, 1, 1, 1, 1,
-0.2388849, 0.8373987, 0.285192, 0, 0, 1, 1, 1,
-0.2318123, -0.1128805, -2.055365, 1, 0, 0, 1, 1,
-0.2290703, -0.5521035, -2.929168, 1, 0, 0, 1, 1,
-0.2265154, -0.2548564, -3.964931, 1, 0, 0, 1, 1,
-0.2225866, -1.178002, -3.646803, 1, 0, 0, 1, 1,
-0.2194156, -0.6046505, -2.212465, 1, 0, 0, 1, 1,
-0.2190189, -0.5608087, -2.226088, 0, 0, 0, 1, 1,
-0.2188116, -1.343054, -2.345278, 0, 0, 0, 1, 1,
-0.2136133, 0.03906892, -2.091214, 0, 0, 0, 1, 1,
-0.2111882, -1.904388, -3.808136, 0, 0, 0, 1, 1,
-0.2108492, -0.3169878, -2.869197, 0, 0, 0, 1, 1,
-0.2043588, 0.4918295, -1.342544, 0, 0, 0, 1, 1,
-0.2010303, 1.87017, -0.9430625, 0, 0, 0, 1, 1,
-0.2001423, -0.7453051, -1.873287, 1, 1, 1, 1, 1,
-0.1986004, -0.3030882, -3.688591, 1, 1, 1, 1, 1,
-0.1971831, 0.9740551, -1.056324, 1, 1, 1, 1, 1,
-0.1952804, 0.2819413, -1.281048, 1, 1, 1, 1, 1,
-0.1908237, -1.113624, -2.832242, 1, 1, 1, 1, 1,
-0.1896026, -0.6810299, -3.217158, 1, 1, 1, 1, 1,
-0.1855099, -0.6975409, -0.6111605, 1, 1, 1, 1, 1,
-0.1854458, -0.7032636, -4.446371, 1, 1, 1, 1, 1,
-0.1851744, -0.3549759, -3.639608, 1, 1, 1, 1, 1,
-0.179405, 0.4696644, 0.07012495, 1, 1, 1, 1, 1,
-0.1788589, 0.5841581, 0.4334687, 1, 1, 1, 1, 1,
-0.1788096, -0.2572386, -1.943558, 1, 1, 1, 1, 1,
-0.176318, -0.2940859, -2.624189, 1, 1, 1, 1, 1,
-0.1667341, -0.03091154, -1.286086, 1, 1, 1, 1, 1,
-0.1644745, 0.3244179, -0.1362735, 1, 1, 1, 1, 1,
-0.1633914, 0.8756267, 0.8223501, 0, 0, 1, 1, 1,
-0.1633564, 0.9475092, 1.169152, 1, 0, 0, 1, 1,
-0.1630611, -0.5357773, -1.472063, 1, 0, 0, 1, 1,
-0.1617481, -0.4406626, -1.638619, 1, 0, 0, 1, 1,
-0.1565244, 0.6828039, 0.4558402, 1, 0, 0, 1, 1,
-0.1526465, 1.738347, 1.279539, 1, 0, 0, 1, 1,
-0.1504572, -1.027411, -3.519331, 0, 0, 0, 1, 1,
-0.1472976, 2.068391, -0.908665, 0, 0, 0, 1, 1,
-0.1458171, -0.4748979, -3.151277, 0, 0, 0, 1, 1,
-0.1415727, 0.6872466, -0.09866054, 0, 0, 0, 1, 1,
-0.135728, -1.242631, -2.698234, 0, 0, 0, 1, 1,
-0.1355624, 0.862148, 0.485584, 0, 0, 0, 1, 1,
-0.1350397, 1.401075, -1.984135, 0, 0, 0, 1, 1,
-0.1323835, 0.8795495, -2.24322, 1, 1, 1, 1, 1,
-0.1301195, -0.034898, -1.355106, 1, 1, 1, 1, 1,
-0.1194112, 1.187747, 1.188994, 1, 1, 1, 1, 1,
-0.1160891, -0.1753151, -2.572454, 1, 1, 1, 1, 1,
-0.1054663, 0.885969, -1.440021, 1, 1, 1, 1, 1,
-0.09949995, 0.496876, 0.2481839, 1, 1, 1, 1, 1,
-0.09568668, -1.176911, -2.702945, 1, 1, 1, 1, 1,
-0.09563117, -0.1173117, -2.738045, 1, 1, 1, 1, 1,
-0.09104057, -0.1656405, -2.586946, 1, 1, 1, 1, 1,
-0.08820009, -0.2828116, -3.291149, 1, 1, 1, 1, 1,
-0.08330356, 0.3925653, -0.9170009, 1, 1, 1, 1, 1,
-0.08041359, 0.2473628, -0.7966794, 1, 1, 1, 1, 1,
-0.08001342, -0.9231621, -4.128903, 1, 1, 1, 1, 1,
-0.07982828, 0.3916112, -2.035714, 1, 1, 1, 1, 1,
-0.07907103, 2.197181, 0.4704323, 1, 1, 1, 1, 1,
-0.07350913, 1.974667, -1.895035, 0, 0, 1, 1, 1,
-0.07150487, 2.18286, 0.5262067, 1, 0, 0, 1, 1,
-0.0604852, -0.9322437, -3.010974, 1, 0, 0, 1, 1,
-0.05872403, -0.6611874, -2.748177, 1, 0, 0, 1, 1,
-0.05771941, 0.3917603, 0.2800448, 1, 0, 0, 1, 1,
-0.05503685, -0.1035713, -3.460683, 1, 0, 0, 1, 1,
-0.05174331, -0.5831235, -4.109297, 0, 0, 0, 1, 1,
-0.04756433, -0.1205815, -2.60066, 0, 0, 0, 1, 1,
-0.04674615, -0.6958854, -3.386045, 0, 0, 0, 1, 1,
-0.04506861, 0.8089775, -2.167255, 0, 0, 0, 1, 1,
-0.04192405, -0.2208556, -1.63062, 0, 0, 0, 1, 1,
-0.03936414, 0.5837043, -0.4816645, 0, 0, 0, 1, 1,
-0.03535088, -0.7923649, -1.571174, 0, 0, 0, 1, 1,
-0.03457734, 1.55981, 1.662556, 1, 1, 1, 1, 1,
-0.03163854, 1.385366, -0.623177, 1, 1, 1, 1, 1,
-0.02767351, -0.632081, -2.90534, 1, 1, 1, 1, 1,
-0.02144771, 0.9418137, 0.4718495, 1, 1, 1, 1, 1,
-0.01944423, -1.771362, -4.325722, 1, 1, 1, 1, 1,
-0.01928834, 0.4192064, 0.9376286, 1, 1, 1, 1, 1,
-0.005706536, 1.617632, 0.4374471, 1, 1, 1, 1, 1,
-0.0004284119, 0.2047895, -1.168572, 1, 1, 1, 1, 1,
0.00318152, 1.893843, 0.8232441, 1, 1, 1, 1, 1,
0.004311681, 1.861939, -0.5044593, 1, 1, 1, 1, 1,
0.01182481, -0.9131345, 3.984141, 1, 1, 1, 1, 1,
0.01189459, -0.5999936, 0.7730373, 1, 1, 1, 1, 1,
0.01221907, -0.9839189, 2.416722, 1, 1, 1, 1, 1,
0.01236, 1.993088, 1.062823, 1, 1, 1, 1, 1,
0.01421585, -0.06826476, 2.428608, 1, 1, 1, 1, 1,
0.01478384, -0.1495287, 1.413886, 0, 0, 1, 1, 1,
0.02909767, 0.123762, 0.475549, 1, 0, 0, 1, 1,
0.04177503, 1.381814, 0.1031151, 1, 0, 0, 1, 1,
0.04662503, -0.4980173, 3.080404, 1, 0, 0, 1, 1,
0.05646468, 1.426513, -0.4780904, 1, 0, 0, 1, 1,
0.05667229, -2.198336, 2.65666, 1, 0, 0, 1, 1,
0.06471111, -1.757421, 3.323016, 0, 0, 0, 1, 1,
0.06600969, -1.002052, 2.301841, 0, 0, 0, 1, 1,
0.06670063, -0.2492331, 3.019608, 0, 0, 0, 1, 1,
0.06781682, 2.175866, 1.222803, 0, 0, 0, 1, 1,
0.06973699, -0.389331, 1.958182, 0, 0, 0, 1, 1,
0.07038672, -0.3779347, 5.28212, 0, 0, 0, 1, 1,
0.07040633, -0.04595325, 4.192617, 0, 0, 0, 1, 1,
0.07246296, 1.223755, 0.2456127, 1, 1, 1, 1, 1,
0.07375449, 2.228599, 0.4813663, 1, 1, 1, 1, 1,
0.07705521, 1.01838, -1.701869, 1, 1, 1, 1, 1,
0.07737017, 1.711454, 0.2886598, 1, 1, 1, 1, 1,
0.07825213, 0.5688258, 1.650253, 1, 1, 1, 1, 1,
0.07906456, -0.4452077, 1.731789, 1, 1, 1, 1, 1,
0.08049342, 0.6985539, 1.47924, 1, 1, 1, 1, 1,
0.08467969, 0.3945778, 0.4634598, 1, 1, 1, 1, 1,
0.0864822, -1.998087, 1.936244, 1, 1, 1, 1, 1,
0.09035283, 0.9178199, 0.473976, 1, 1, 1, 1, 1,
0.09112251, -0.1777959, 2.742906, 1, 1, 1, 1, 1,
0.09507233, 0.632046, -0.7007566, 1, 1, 1, 1, 1,
0.09859487, -1.048881, 2.338516, 1, 1, 1, 1, 1,
0.09937278, -0.8215475, 0.5602612, 1, 1, 1, 1, 1,
0.1041873, 0.6438934, 1.546759, 1, 1, 1, 1, 1,
0.1104896, -0.2300296, 0.7742248, 0, 0, 1, 1, 1,
0.1138934, -0.4883466, 1.772057, 1, 0, 0, 1, 1,
0.1141148, 0.1312383, 1.358693, 1, 0, 0, 1, 1,
0.1159782, 0.3449395, 0.1905732, 1, 0, 0, 1, 1,
0.1162137, -0.4709018, 2.438789, 1, 0, 0, 1, 1,
0.1167862, -0.01199718, 2.231903, 1, 0, 0, 1, 1,
0.1191111, -0.4720441, 3.992214, 0, 0, 0, 1, 1,
0.1210012, -1.171157, 2.91541, 0, 0, 0, 1, 1,
0.1271755, -1.01107, 4.51368, 0, 0, 0, 1, 1,
0.1283585, 1.942342, 1.260475, 0, 0, 0, 1, 1,
0.1313487, 0.7141074, 1.048695, 0, 0, 0, 1, 1,
0.1319239, -1.657205, 2.846504, 0, 0, 0, 1, 1,
0.1327685, -0.8035545, 3.371389, 0, 0, 0, 1, 1,
0.1355186, 0.8686116, 0.1658234, 1, 1, 1, 1, 1,
0.1356205, 1.550613, -0.0293375, 1, 1, 1, 1, 1,
0.1392312, 1.256148, 0.3906839, 1, 1, 1, 1, 1,
0.1396275, 0.1913604, 0.889542, 1, 1, 1, 1, 1,
0.1418853, -0.4929012, 4.097709, 1, 1, 1, 1, 1,
0.1490483, 0.6762972, 1.179906, 1, 1, 1, 1, 1,
0.153539, -0.9886762, 2.017022, 1, 1, 1, 1, 1,
0.1537797, -0.1429058, 2.412792, 1, 1, 1, 1, 1,
0.1615627, 0.4546292, 0.3490416, 1, 1, 1, 1, 1,
0.1622745, -0.2878525, 4.143302, 1, 1, 1, 1, 1,
0.167916, -0.3247436, 1.603642, 1, 1, 1, 1, 1,
0.1712096, -0.3446201, 3.326178, 1, 1, 1, 1, 1,
0.1797634, 0.4875386, 0.4720005, 1, 1, 1, 1, 1,
0.1816983, 0.1722007, 1.031211, 1, 1, 1, 1, 1,
0.1827113, -1.779602, 3.182525, 1, 1, 1, 1, 1,
0.1844294, -1.543959, 1.818866, 0, 0, 1, 1, 1,
0.1859543, -0.9568143, 2.832319, 1, 0, 0, 1, 1,
0.1865105, -0.3619044, 3.522613, 1, 0, 0, 1, 1,
0.1875021, 0.7449682, 1.606898, 1, 0, 0, 1, 1,
0.189379, -0.1207905, 2.557781, 1, 0, 0, 1, 1,
0.1908149, -1.012617, 0.9027025, 1, 0, 0, 1, 1,
0.1910285, -1.138994, 3.198542, 0, 0, 0, 1, 1,
0.1966441, -0.7886998, 2.557664, 0, 0, 0, 1, 1,
0.1980608, 2.380001, -0.3128998, 0, 0, 0, 1, 1,
0.2047972, -0.7782402, 2.711879, 0, 0, 0, 1, 1,
0.2095495, -0.5780001, 3.012579, 0, 0, 0, 1, 1,
0.210562, -0.6951014, 1.132408, 0, 0, 0, 1, 1,
0.2136425, -0.885686, 1.605088, 0, 0, 0, 1, 1,
0.213769, -1.83805, 6.206804, 1, 1, 1, 1, 1,
0.2169593, -0.1492734, 0.322842, 1, 1, 1, 1, 1,
0.2292395, -0.2371003, 1.594409, 1, 1, 1, 1, 1,
0.2296489, 0.05985283, 2.100351, 1, 1, 1, 1, 1,
0.2377321, 2.204674, -0.2919984, 1, 1, 1, 1, 1,
0.2419401, 1.831048, -1.933527, 1, 1, 1, 1, 1,
0.2462658, -0.6492025, 1.639372, 1, 1, 1, 1, 1,
0.247784, 0.9876716, -0.850453, 1, 1, 1, 1, 1,
0.2500218, -0.2202049, 3.116406, 1, 1, 1, 1, 1,
0.2501359, 1.253015, -0.8780437, 1, 1, 1, 1, 1,
0.2540149, 0.3790587, 0.412479, 1, 1, 1, 1, 1,
0.2606734, 1.381529, -0.447458, 1, 1, 1, 1, 1,
0.2655722, 1.5045, 1.063095, 1, 1, 1, 1, 1,
0.2686597, 2.21476, 1.510474, 1, 1, 1, 1, 1,
0.2689452, 0.540948, -1.403203, 1, 1, 1, 1, 1,
0.2709763, -0.4075135, 0.6310421, 0, 0, 1, 1, 1,
0.2714438, -1.372576, 3.177055, 1, 0, 0, 1, 1,
0.2747554, 1.167013, -1.44125, 1, 0, 0, 1, 1,
0.2749991, 1.8636, -0.3517081, 1, 0, 0, 1, 1,
0.2758825, 0.07708913, 0.6713785, 1, 0, 0, 1, 1,
0.2786694, -0.001150001, 2.034951, 1, 0, 0, 1, 1,
0.2814868, 0.02859093, 3.34145, 0, 0, 0, 1, 1,
0.2850948, -0.05588606, 1.507497, 0, 0, 0, 1, 1,
0.2902531, -0.2418811, 1.356007, 0, 0, 0, 1, 1,
0.2926392, 0.3526404, 1.129057, 0, 0, 0, 1, 1,
0.2939245, -0.5114544, 2.01422, 0, 0, 0, 1, 1,
0.2975569, 2.103651, 0.8242053, 0, 0, 0, 1, 1,
0.297759, -0.7616355, 3.559742, 0, 0, 0, 1, 1,
0.2992697, -0.03626546, 4.064584, 1, 1, 1, 1, 1,
0.3011876, 1.347865, -1.802462, 1, 1, 1, 1, 1,
0.3032255, 1.867625, -1.53556, 1, 1, 1, 1, 1,
0.3071296, -0.7336623, 5.329261, 1, 1, 1, 1, 1,
0.3106633, -0.7738075, 1.204494, 1, 1, 1, 1, 1,
0.3126353, -0.1269615, 1.607051, 1, 1, 1, 1, 1,
0.313094, -0.7977377, 2.348809, 1, 1, 1, 1, 1,
0.3138728, -0.03988241, 2.225813, 1, 1, 1, 1, 1,
0.3187873, -0.6076028, 1.684878, 1, 1, 1, 1, 1,
0.3201983, 0.02800624, 2.356696, 1, 1, 1, 1, 1,
0.3214092, -1.226898, 2.621752, 1, 1, 1, 1, 1,
0.3217811, 1.795802, -0.6745989, 1, 1, 1, 1, 1,
0.3309904, -1.114321, 2.562986, 1, 1, 1, 1, 1,
0.3328215, 0.5296196, 1.315558, 1, 1, 1, 1, 1,
0.3345456, 0.4598785, 0.5833467, 1, 1, 1, 1, 1,
0.3390916, -0.2985997, 1.530389, 0, 0, 1, 1, 1,
0.3395161, -1.441545, 2.901783, 1, 0, 0, 1, 1,
0.3399561, -0.1911402, 3.219513, 1, 0, 0, 1, 1,
0.3423629, -1.054185, 3.425127, 1, 0, 0, 1, 1,
0.3471603, 1.847232, -0.5080751, 1, 0, 0, 1, 1,
0.3487014, 1.450182, -1.02852, 1, 0, 0, 1, 1,
0.3517897, -0.08271112, 3.218889, 0, 0, 0, 1, 1,
0.357638, 2.141859, -0.06916308, 0, 0, 0, 1, 1,
0.358463, -0.1890531, 1.690114, 0, 0, 0, 1, 1,
0.3661391, -1.260777, 2.185965, 0, 0, 0, 1, 1,
0.369177, 1.129961, 1.475849, 0, 0, 0, 1, 1,
0.3699409, -1.981916, 2.547754, 0, 0, 0, 1, 1,
0.3717418, -0.8908996, 1.445066, 0, 0, 0, 1, 1,
0.3731472, -1.300625, 3.075092, 1, 1, 1, 1, 1,
0.3734657, 0.601378, 0.003607045, 1, 1, 1, 1, 1,
0.373826, 1.10761, -0.7910947, 1, 1, 1, 1, 1,
0.3747859, -0.5507102, 0.5584972, 1, 1, 1, 1, 1,
0.3849618, 0.3365748, 2.141422, 1, 1, 1, 1, 1,
0.3850423, 0.744746, -1.544232, 1, 1, 1, 1, 1,
0.3885057, 0.3246013, 0.412287, 1, 1, 1, 1, 1,
0.3934197, 0.3839901, 1.659671, 1, 1, 1, 1, 1,
0.3936726, -0.4210996, 3.317635, 1, 1, 1, 1, 1,
0.3977703, -1.720273, 4.067095, 1, 1, 1, 1, 1,
0.3997462, -1.018545, 2.090225, 1, 1, 1, 1, 1,
0.401691, -0.520551, 2.39257, 1, 1, 1, 1, 1,
0.4017996, -0.629186, 1.023419, 1, 1, 1, 1, 1,
0.4072917, 0.617581, -0.1318112, 1, 1, 1, 1, 1,
0.4086278, -0.3232003, 3.355424, 1, 1, 1, 1, 1,
0.4145447, 0.6498005, -0.2992704, 0, 0, 1, 1, 1,
0.4189408, -0.4572981, 3.367473, 1, 0, 0, 1, 1,
0.4195109, 0.4225337, 2.235608, 1, 0, 0, 1, 1,
0.419551, -0.655284, 4.46147, 1, 0, 0, 1, 1,
0.4212423, -0.8425324, 2.454976, 1, 0, 0, 1, 1,
0.4224691, -2.07618, 2.869896, 1, 0, 0, 1, 1,
0.4269383, -1.927273, 2.378258, 0, 0, 0, 1, 1,
0.4344484, 0.5914491, 1.416336, 0, 0, 0, 1, 1,
0.4353857, 0.03075886, 1.262567, 0, 0, 0, 1, 1,
0.4377608, 0.8428081, -0.07987813, 0, 0, 0, 1, 1,
0.439279, 0.1431723, 0.143865, 0, 0, 0, 1, 1,
0.4400609, 0.3535088, 0.2855535, 0, 0, 0, 1, 1,
0.4413877, 0.1094463, 0.683723, 0, 0, 0, 1, 1,
0.4421985, 0.4003763, 0.9132584, 1, 1, 1, 1, 1,
0.4464171, -0.2030464, 3.119449, 1, 1, 1, 1, 1,
0.4475445, -0.08848002, 0.1208129, 1, 1, 1, 1, 1,
0.4501607, 0.8658208, 0.002092176, 1, 1, 1, 1, 1,
0.461694, 0.186761, 0.6007377, 1, 1, 1, 1, 1,
0.4661034, 0.1300965, 0.3762759, 1, 1, 1, 1, 1,
0.4705007, 0.3457491, -0.8300968, 1, 1, 1, 1, 1,
0.470771, -2.59778, 5.735078, 1, 1, 1, 1, 1,
0.4822923, 0.6355677, -0.5744583, 1, 1, 1, 1, 1,
0.4846602, -0.6676604, 4.01855, 1, 1, 1, 1, 1,
0.4903257, -0.1903242, 1.460979, 1, 1, 1, 1, 1,
0.4911445, -0.8007012, 1.920882, 1, 1, 1, 1, 1,
0.4923472, 0.6246368, 0.1524073, 1, 1, 1, 1, 1,
0.4989839, -0.9290263, 2.540873, 1, 1, 1, 1, 1,
0.4996978, 0.6041089, 0.6134695, 1, 1, 1, 1, 1,
0.5010042, -1.026951, 2.577004, 0, 0, 1, 1, 1,
0.5013074, 0.3046604, -0.1679893, 1, 0, 0, 1, 1,
0.5071448, -0.3520236, 2.706529, 1, 0, 0, 1, 1,
0.5093558, -1.38759, 2.757209, 1, 0, 0, 1, 1,
0.5106632, 1.058032, -0.7286767, 1, 0, 0, 1, 1,
0.5120487, 2.237441, -0.6080961, 1, 0, 0, 1, 1,
0.5132872, 0.1223845, 0.6406723, 0, 0, 0, 1, 1,
0.513531, 0.5073389, 0.8028393, 0, 0, 0, 1, 1,
0.5137221, 0.04618812, 1.637421, 0, 0, 0, 1, 1,
0.5232848, 0.3018605, 3.1961, 0, 0, 0, 1, 1,
0.5315203, 1.771553, 2.111709, 0, 0, 0, 1, 1,
0.532094, 0.9350446, 0.2111625, 0, 0, 0, 1, 1,
0.5368116, 0.2903514, 1.961547, 0, 0, 0, 1, 1,
0.5368987, 0.2076023, 1.807418, 1, 1, 1, 1, 1,
0.5378582, 0.2706624, 1.725085, 1, 1, 1, 1, 1,
0.5382107, -0.5267337, 1.055801, 1, 1, 1, 1, 1,
0.5382734, -0.4306437, 1.822176, 1, 1, 1, 1, 1,
0.5560392, 1.646674, 0.113904, 1, 1, 1, 1, 1,
0.556767, 1.378884, 1.371536, 1, 1, 1, 1, 1,
0.5579315, 1.819143, 1.225986, 1, 1, 1, 1, 1,
0.5592804, -0.8039415, 3.888968, 1, 1, 1, 1, 1,
0.5625331, 1.604431, 0.01051704, 1, 1, 1, 1, 1,
0.5684772, -1.336889, 3.297751, 1, 1, 1, 1, 1,
0.5723552, -0.1710935, 1.796504, 1, 1, 1, 1, 1,
0.5751619, 0.02331045, 1.87416, 1, 1, 1, 1, 1,
0.5754889, -0.9312505, 2.230896, 1, 1, 1, 1, 1,
0.5780411, 1.917577, -0.5681199, 1, 1, 1, 1, 1,
0.5817597, -1.757279, 2.394523, 1, 1, 1, 1, 1,
0.5836831, 1.266455, -0.3275454, 0, 0, 1, 1, 1,
0.5858103, -0.02154861, 3.333937, 1, 0, 0, 1, 1,
0.5862967, -0.6953538, 1.987584, 1, 0, 0, 1, 1,
0.5878587, 0.7819232, 1.601035, 1, 0, 0, 1, 1,
0.5910208, 0.7391591, -0.08771422, 1, 0, 0, 1, 1,
0.5917886, 0.5496601, 1.722775, 1, 0, 0, 1, 1,
0.5924976, -1.500519, 2.352193, 0, 0, 0, 1, 1,
0.592653, 0.8024125, 0.09954401, 0, 0, 0, 1, 1,
0.5930637, 0.2886945, 0.1631043, 0, 0, 0, 1, 1,
0.5952074, -0.9886157, 3.661688, 0, 0, 0, 1, 1,
0.5983399, 1.403292, 0.3461461, 0, 0, 0, 1, 1,
0.6001526, 1.103274, 0.06919629, 0, 0, 0, 1, 1,
0.6023371, 0.7395441, 1.339638, 0, 0, 0, 1, 1,
0.6044467, -0.8217533, 0.6411769, 1, 1, 1, 1, 1,
0.6044546, -1.329352, 1.908439, 1, 1, 1, 1, 1,
0.6104673, 0.8516288, 2.403518, 1, 1, 1, 1, 1,
0.6164058, 0.2948275, 1.439317, 1, 1, 1, 1, 1,
0.6197079, -0.8007481, 3.116582, 1, 1, 1, 1, 1,
0.623643, -0.4151378, 2.338233, 1, 1, 1, 1, 1,
0.6253992, -0.4423538, 1.160374, 1, 1, 1, 1, 1,
0.6265404, -0.8072383, 2.077228, 1, 1, 1, 1, 1,
0.6283418, -0.6377046, 2.193619, 1, 1, 1, 1, 1,
0.6287344, 1.004774, 0.8177166, 1, 1, 1, 1, 1,
0.6322744, -0.3322015, 1.702533, 1, 1, 1, 1, 1,
0.636979, -2.002764, 2.176166, 1, 1, 1, 1, 1,
0.6400302, 0.8465981, 0.95849, 1, 1, 1, 1, 1,
0.6423994, -0.01746893, 0.4950398, 1, 1, 1, 1, 1,
0.6455339, -1.138578, 4.228304, 1, 1, 1, 1, 1,
0.6513024, -1.722444, 2.656093, 0, 0, 1, 1, 1,
0.6513761, -0.9222302, 3.804342, 1, 0, 0, 1, 1,
0.6517347, 0.6022727, 1.374012, 1, 0, 0, 1, 1,
0.6520159, 1.790875, -1.112002, 1, 0, 0, 1, 1,
0.6639381, -0.7379787, 2.09269, 1, 0, 0, 1, 1,
0.6717006, -0.5353771, 4.089974, 1, 0, 0, 1, 1,
0.6720321, 1.751979, -1.932053, 0, 0, 0, 1, 1,
0.6725931, 2.010043, 0.9329948, 0, 0, 0, 1, 1,
0.6739401, 0.6721479, 1.258087, 0, 0, 0, 1, 1,
0.6751255, -0.1991131, 1.756136, 0, 0, 0, 1, 1,
0.6777401, 0.4460547, 0.594565, 0, 0, 0, 1, 1,
0.6796053, 1.241804, 0.03080824, 0, 0, 0, 1, 1,
0.6828719, 1.576328, 1.316058, 0, 0, 0, 1, 1,
0.6863595, -0.2329753, 1.625866, 1, 1, 1, 1, 1,
0.6867867, 0.7337714, 1.1989, 1, 1, 1, 1, 1,
0.693711, 1.224739, 0.499707, 1, 1, 1, 1, 1,
0.69704, -0.2867751, 1.374152, 1, 1, 1, 1, 1,
0.7032456, -0.5828469, 1.635036, 1, 1, 1, 1, 1,
0.7042218, 0.9259622, 1.287235, 1, 1, 1, 1, 1,
0.705506, 0.07715008, 1.573099, 1, 1, 1, 1, 1,
0.7068172, -1.449876, 2.349424, 1, 1, 1, 1, 1,
0.7083313, -0.3770891, 3.571402, 1, 1, 1, 1, 1,
0.7083435, -0.30031, 3.244855, 1, 1, 1, 1, 1,
0.7096512, 1.231892, 1.609967, 1, 1, 1, 1, 1,
0.7097884, -0.863629, 2.997567, 1, 1, 1, 1, 1,
0.7217082, 0.2648553, 2.19712, 1, 1, 1, 1, 1,
0.7240481, -1.188264, 3.403486, 1, 1, 1, 1, 1,
0.7249233, 1.914783, 1.200834, 1, 1, 1, 1, 1,
0.7255792, 0.5427495, 1.200858, 0, 0, 1, 1, 1,
0.7266538, -1.537454, 3.640369, 1, 0, 0, 1, 1,
0.727691, -0.3318871, 1.586222, 1, 0, 0, 1, 1,
0.737443, -0.2131513, 1.619186, 1, 0, 0, 1, 1,
0.74117, -0.1885675, 0.862076, 1, 0, 0, 1, 1,
0.7412481, 0.1404045, 2.125234, 1, 0, 0, 1, 1,
0.7430609, 0.408957, 0.8700601, 0, 0, 0, 1, 1,
0.7449068, -1.48951, 3.597233, 0, 0, 0, 1, 1,
0.748986, 0.6121572, -0.8130159, 0, 0, 0, 1, 1,
0.762677, -0.5468473, 2.485175, 0, 0, 0, 1, 1,
0.7664963, 0.6575317, 1.731074, 0, 0, 0, 1, 1,
0.771653, -1.116889, 1.67215, 0, 0, 0, 1, 1,
0.7718115, 0.2739015, 0.4280027, 0, 0, 0, 1, 1,
0.7741099, 0.6432207, 1.360426, 1, 1, 1, 1, 1,
0.7744151, -1.195932, 2.668119, 1, 1, 1, 1, 1,
0.7798674, 0.4889843, 2.345329, 1, 1, 1, 1, 1,
0.7891019, -0.3822932, 2.482696, 1, 1, 1, 1, 1,
0.7896928, 0.6869394, 1.239942, 1, 1, 1, 1, 1,
0.794481, -0.527598, 1.290875, 1, 1, 1, 1, 1,
0.7952887, 0.6964365, 1.648691, 1, 1, 1, 1, 1,
0.8012772, 1.297135, 0.6420997, 1, 1, 1, 1, 1,
0.8062268, 1.463183, 0.9948796, 1, 1, 1, 1, 1,
0.8097399, -0.1179782, 2.28206, 1, 1, 1, 1, 1,
0.8122239, 0.3780126, 1.655218, 1, 1, 1, 1, 1,
0.8163807, -0.4928778, -0.1567607, 1, 1, 1, 1, 1,
0.8184078, -1.167012, 4.301991, 1, 1, 1, 1, 1,
0.8259552, -2.166678, 1.210945, 1, 1, 1, 1, 1,
0.8401031, 1.034892, 2.094383, 1, 1, 1, 1, 1,
0.8503155, 0.04551364, 0.5821437, 0, 0, 1, 1, 1,
0.8513567, 0.5261928, 2.60089, 1, 0, 0, 1, 1,
0.8555994, -0.5278072, 0.1802115, 1, 0, 0, 1, 1,
0.8567333, -0.8730018, 2.598554, 1, 0, 0, 1, 1,
0.8591689, -0.2984444, 2.810464, 1, 0, 0, 1, 1,
0.8629686, -0.7755305, 0.05914434, 1, 0, 0, 1, 1,
0.8631514, 1.650434, 0.5713207, 0, 0, 0, 1, 1,
0.8649216, -0.1827914, 1.784418, 0, 0, 0, 1, 1,
0.8670394, 1.145223, -0.9984912, 0, 0, 0, 1, 1,
0.8733743, -0.01635104, 1.097642, 0, 0, 0, 1, 1,
0.8740653, 0.1435034, 0.8618811, 0, 0, 0, 1, 1,
0.8765917, 1.254203, 1.718157, 0, 0, 0, 1, 1,
0.8803557, 0.746797, -0.5562771, 0, 0, 0, 1, 1,
0.8843725, -0.3326944, 2.497445, 1, 1, 1, 1, 1,
0.8850504, -0.2568115, 1.194175, 1, 1, 1, 1, 1,
0.8876043, 0.2972757, 2.036586, 1, 1, 1, 1, 1,
0.8958992, -1.611386, 3.170148, 1, 1, 1, 1, 1,
0.9009852, 0.4975986, 2.55614, 1, 1, 1, 1, 1,
0.9016487, 0.8123421, 0.7574158, 1, 1, 1, 1, 1,
0.9134026, 0.2269376, 1.84114, 1, 1, 1, 1, 1,
0.9154031, -1.544117, 2.06076, 1, 1, 1, 1, 1,
0.9209763, 0.5689054, 2.175746, 1, 1, 1, 1, 1,
0.9226778, 0.2967643, 1.663649, 1, 1, 1, 1, 1,
0.9238501, 1.562706, 0.09193611, 1, 1, 1, 1, 1,
0.9254131, -0.7506716, 2.602222, 1, 1, 1, 1, 1,
0.9332536, 1.208586, 0.5895702, 1, 1, 1, 1, 1,
0.9420338, 0.4627006, 2.258917, 1, 1, 1, 1, 1,
0.9466485, -1.526545, 3.155038, 1, 1, 1, 1, 1,
0.9502671, 1.449212, 1.684309, 0, 0, 1, 1, 1,
0.9543408, -0.1510564, 1.769225, 1, 0, 0, 1, 1,
0.9549782, -0.7013322, 1.008881, 1, 0, 0, 1, 1,
0.9560609, 0.2748372, -0.2452441, 1, 0, 0, 1, 1,
0.9569849, 1.076359, 0.5765766, 1, 0, 0, 1, 1,
0.9571708, 0.9597728, -0.95995, 1, 0, 0, 1, 1,
0.9611965, -0.8386762, 2.614504, 0, 0, 0, 1, 1,
0.9686266, 1.323919, 1.022296, 0, 0, 0, 1, 1,
0.9705352, 1.098795, -0.703635, 0, 0, 0, 1, 1,
0.9731104, 2.519429, -0.4172788, 0, 0, 0, 1, 1,
0.9757501, -0.2102313, 0.2334184, 0, 0, 0, 1, 1,
0.9819843, 1.191522, 1.61038, 0, 0, 0, 1, 1,
0.9825462, 0.6286104, -0.3020384, 0, 0, 0, 1, 1,
0.9828221, 1.515699, -1.344252, 1, 1, 1, 1, 1,
0.9871377, 0.6511875, 0.8714404, 1, 1, 1, 1, 1,
0.9894142, 0.544681, -0.40273, 1, 1, 1, 1, 1,
0.9987618, 1.07453, 0.784927, 1, 1, 1, 1, 1,
0.9995929, 1.402373, 0.1014272, 1, 1, 1, 1, 1,
1.00086, -0.3659125, 1.51475, 1, 1, 1, 1, 1,
1.001372, -0.1430771, 1.333709, 1, 1, 1, 1, 1,
1.003476, 0.3676209, 0.3465541, 1, 1, 1, 1, 1,
1.003601, -1.119493, 3.448145, 1, 1, 1, 1, 1,
1.005341, -1.419182, 3.358741, 1, 1, 1, 1, 1,
1.007671, 2.254664, -0.06964597, 1, 1, 1, 1, 1,
1.013046, -0.8347999, 3.719477, 1, 1, 1, 1, 1,
1.015504, -1.100414, 1.107208, 1, 1, 1, 1, 1,
1.018129, -1.408603, 1.134149, 1, 1, 1, 1, 1,
1.018383, 1.394917, 1.285871, 1, 1, 1, 1, 1,
1.024147, -0.446487, 1.234338, 0, 0, 1, 1, 1,
1.028702, -2.442059, 1.245152, 1, 0, 0, 1, 1,
1.029617, 0.3566637, 2.102106, 1, 0, 0, 1, 1,
1.030084, 0.320787, 1.45931, 1, 0, 0, 1, 1,
1.036626, -0.8977367, 2.298078, 1, 0, 0, 1, 1,
1.036668, 0.5049452, 0.8000335, 1, 0, 0, 1, 1,
1.038941, -0.5967132, 3.278858, 0, 0, 0, 1, 1,
1.043446, -1.082538, 2.103342, 0, 0, 0, 1, 1,
1.065583, 0.07685114, 1.293678, 0, 0, 0, 1, 1,
1.07342, 0.07160518, 1.453034, 0, 0, 0, 1, 1,
1.074846, 0.3970658, 0.7620393, 0, 0, 0, 1, 1,
1.080141, -1.158068, 2.112273, 0, 0, 0, 1, 1,
1.093883, -0.8889964, 1.165138, 0, 0, 0, 1, 1,
1.096665, 0.3759308, 2.106488, 1, 1, 1, 1, 1,
1.0999, -2.270797, 2.64549, 1, 1, 1, 1, 1,
1.103142, -0.05073515, 0.8213506, 1, 1, 1, 1, 1,
1.107785, -0.0764523, 1.247616, 1, 1, 1, 1, 1,
1.110211, -2.079729, 2.08991, 1, 1, 1, 1, 1,
1.113088, 1.504961, -1.9065, 1, 1, 1, 1, 1,
1.115911, -1.205835, 2.829049, 1, 1, 1, 1, 1,
1.124361, 1.342966, -1.150101, 1, 1, 1, 1, 1,
1.129, 0.7394186, -0.2850756, 1, 1, 1, 1, 1,
1.129042, -0.04617991, 3.006162, 1, 1, 1, 1, 1,
1.144007, 0.5648847, 1.194898, 1, 1, 1, 1, 1,
1.144176, 0.8834873, 0.8658069, 1, 1, 1, 1, 1,
1.145692, -0.3934724, 1.949495, 1, 1, 1, 1, 1,
1.146362, 0.8819637, 2.428449, 1, 1, 1, 1, 1,
1.152449, -0.7208042, 1.710263, 1, 1, 1, 1, 1,
1.157835, 0.005699647, 1.20663, 0, 0, 1, 1, 1,
1.175947, 0.8005542, 2.416981, 1, 0, 0, 1, 1,
1.184762, 0.113319, 1.870627, 1, 0, 0, 1, 1,
1.191811, 1.090088, 2.674553, 1, 0, 0, 1, 1,
1.192293, -0.1195107, 0.4534796, 1, 0, 0, 1, 1,
1.202542, 1.038151, 1.350179, 1, 0, 0, 1, 1,
1.205106, -0.04816804, -0.08638687, 0, 0, 0, 1, 1,
1.208007, 1.009259, 2.834493, 0, 0, 0, 1, 1,
1.213516, 1.157, -0.6328002, 0, 0, 0, 1, 1,
1.215958, 0.1603779, 2.213339, 0, 0, 0, 1, 1,
1.224145, 1.733691, -0.03594252, 0, 0, 0, 1, 1,
1.225803, -1.083035, 2.417514, 0, 0, 0, 1, 1,
1.231177, -0.6720234, 1.861207, 0, 0, 0, 1, 1,
1.238312, -0.01885878, 1.985684, 1, 1, 1, 1, 1,
1.24691, 0.6655676, 0.3819536, 1, 1, 1, 1, 1,
1.248232, -1.23563, 3.418514, 1, 1, 1, 1, 1,
1.249176, 0.1980192, 3.210528, 1, 1, 1, 1, 1,
1.252502, -0.3480411, 0.7945618, 1, 1, 1, 1, 1,
1.271405, 0.4077207, 2.291693, 1, 1, 1, 1, 1,
1.273171, 1.447455, 2.989978, 1, 1, 1, 1, 1,
1.275604, -2.210627, 1.424143, 1, 1, 1, 1, 1,
1.284712, 1.046631, 0.7740991, 1, 1, 1, 1, 1,
1.301117, -1.00019, 2.923835, 1, 1, 1, 1, 1,
1.304787, -0.1695076, 0.8561664, 1, 1, 1, 1, 1,
1.306994, -2.548494, 2.837308, 1, 1, 1, 1, 1,
1.312769, -1.076958, 2.368045, 1, 1, 1, 1, 1,
1.31454, -0.7040183, 1.723281, 1, 1, 1, 1, 1,
1.315715, -0.9295858, 2.327878, 1, 1, 1, 1, 1,
1.323586, 0.2963633, 1.427248, 0, 0, 1, 1, 1,
1.331007, 1.421285, 0.5282872, 1, 0, 0, 1, 1,
1.336762, 1.377874, 1.152739, 1, 0, 0, 1, 1,
1.342944, 0.7162225, -0.3867607, 1, 0, 0, 1, 1,
1.343163, 0.9048972, 1.362088, 1, 0, 0, 1, 1,
1.343541, -0.6491972, 0.3468042, 1, 0, 0, 1, 1,
1.343842, 0.1437404, 2.83926, 0, 0, 0, 1, 1,
1.343969, -0.2684394, 1.776368, 0, 0, 0, 1, 1,
1.34415, 0.8472821, 0.5127817, 0, 0, 0, 1, 1,
1.345581, -2.478209, 2.693277, 0, 0, 0, 1, 1,
1.348686, 0.163807, 1.571257, 0, 0, 0, 1, 1,
1.357687, -0.3081682, 2.567763, 0, 0, 0, 1, 1,
1.361114, -1.522369, 4.587083, 0, 0, 0, 1, 1,
1.36733, 0.9357094, 0.8316796, 1, 1, 1, 1, 1,
1.379081, -1.175148, 2.314133, 1, 1, 1, 1, 1,
1.389273, -1.010654, 2.192637, 1, 1, 1, 1, 1,
1.403313, 0.6597358, -0.6569182, 1, 1, 1, 1, 1,
1.406063, 0.2822289, 1.501708, 1, 1, 1, 1, 1,
1.408248, 0.9632471, 2.804051, 1, 1, 1, 1, 1,
1.416641, -0.1430653, 0.6221378, 1, 1, 1, 1, 1,
1.419992, 0.009943691, 0.06600072, 1, 1, 1, 1, 1,
1.448064, -0.5291908, 2.310171, 1, 1, 1, 1, 1,
1.478026, -0.8212236, 1.558638, 1, 1, 1, 1, 1,
1.48337, 1.37407, -0.0514521, 1, 1, 1, 1, 1,
1.485097, 0.9628667, 1.049292, 1, 1, 1, 1, 1,
1.487891, 0.03685391, 0.8915489, 1, 1, 1, 1, 1,
1.490977, -0.6480556, 2.373381, 1, 1, 1, 1, 1,
1.498191, 0.6840648, -0.1892081, 1, 1, 1, 1, 1,
1.505145, -1.1826, 3.246913, 0, 0, 1, 1, 1,
1.509225, 1.078601, 0.9492664, 1, 0, 0, 1, 1,
1.520455, -0.7974615, 1.671841, 1, 0, 0, 1, 1,
1.533386, -1.073095, 1.317068, 1, 0, 0, 1, 1,
1.536027, -0.6903638, 1.446822, 1, 0, 0, 1, 1,
1.54363, -0.7473282, 0.5092199, 1, 0, 0, 1, 1,
1.543776, -1.699908, 2.151562, 0, 0, 0, 1, 1,
1.552824, -1.989865, 4.394842, 0, 0, 0, 1, 1,
1.570233, 0.6654405, 0.9290058, 0, 0, 0, 1, 1,
1.571007, -0.4772929, 0.3254638, 0, 0, 0, 1, 1,
1.57422, 0.05194103, 2.175975, 0, 0, 0, 1, 1,
1.575493, -0.2241862, 1.717541, 0, 0, 0, 1, 1,
1.594267, -0.7929567, 2.592495, 0, 0, 0, 1, 1,
1.597827, -0.3111401, 2.323821, 1, 1, 1, 1, 1,
1.608399, -1.290247, 0.5929357, 1, 1, 1, 1, 1,
1.631689, -1.012298, 3.459512, 1, 1, 1, 1, 1,
1.633732, -2.037093, 2.050066, 1, 1, 1, 1, 1,
1.635769, 0.6190211, 1.196416, 1, 1, 1, 1, 1,
1.640676, 0.1913164, 2.192109, 1, 1, 1, 1, 1,
1.645515, -0.05144883, 2.436466, 1, 1, 1, 1, 1,
1.650264, 1.385546, 0.02889231, 1, 1, 1, 1, 1,
1.652555, 0.7128304, 1.176862, 1, 1, 1, 1, 1,
1.656164, 0.6280061, 0.9607023, 1, 1, 1, 1, 1,
1.671124, -0.1700142, 2.051289, 1, 1, 1, 1, 1,
1.692184, -0.4138882, 1.755444, 1, 1, 1, 1, 1,
1.696153, 0.6060546, 1.626869, 1, 1, 1, 1, 1,
1.697039, -0.7908819, 2.555056, 1, 1, 1, 1, 1,
1.698965, -0.7165371, 2.232601, 1, 1, 1, 1, 1,
1.700258, 0.07590643, -0.08182107, 0, 0, 1, 1, 1,
1.702028, 0.4269953, 0.2017862, 1, 0, 0, 1, 1,
1.702978, -0.555147, 2.518027, 1, 0, 0, 1, 1,
1.705208, -0.2953791, 4.066172, 1, 0, 0, 1, 1,
1.710624, 1.556666, 2.362914, 1, 0, 0, 1, 1,
1.713726, -1.577325, 3.342054, 1, 0, 0, 1, 1,
1.714886, -1.063813, 3.243384, 0, 0, 0, 1, 1,
1.719326, 0.1611591, 0.6305816, 0, 0, 0, 1, 1,
1.728242, -0.7036163, 0.4380569, 0, 0, 0, 1, 1,
1.741581, 1.038052, -0.1386762, 0, 0, 0, 1, 1,
1.74193, -0.2880958, 1.70108, 0, 0, 0, 1, 1,
1.765656, -0.05705611, -0.06498528, 0, 0, 0, 1, 1,
1.786444, 0.2870883, 1.29338, 0, 0, 0, 1, 1,
1.809268, 1.315701, 1.684999, 1, 1, 1, 1, 1,
1.816758, -0.633927, 3.519517, 1, 1, 1, 1, 1,
1.827381, 0.04253932, 2.490792, 1, 1, 1, 1, 1,
1.836156, -1.249251, 0.8022037, 1, 1, 1, 1, 1,
1.843019, 0.6397956, 2.116195, 1, 1, 1, 1, 1,
1.871824, 1.117708, 2.096927, 1, 1, 1, 1, 1,
1.8735, -0.2927074, 3.403624, 1, 1, 1, 1, 1,
1.876994, -0.5103338, 1.366588, 1, 1, 1, 1, 1,
1.916763, -0.8994273, 2.951392, 1, 1, 1, 1, 1,
1.923812, 0.4829281, 1.807344, 1, 1, 1, 1, 1,
1.99498, -1.166437, 2.650775, 1, 1, 1, 1, 1,
2.008054, 0.5614464, -0.3820193, 1, 1, 1, 1, 1,
2.024824, 2.148608, 0.2921037, 1, 1, 1, 1, 1,
2.037578, -2.133425, 0.1211819, 1, 1, 1, 1, 1,
2.065845, -1.034486, -0.202687, 1, 1, 1, 1, 1,
2.073689, -1.223122, 3.9439, 0, 0, 1, 1, 1,
2.082727, 0.2507625, 1.956398, 1, 0, 0, 1, 1,
2.105512, 0.122753, -0.3670523, 1, 0, 0, 1, 1,
2.136603, 1.119261, -0.9209327, 1, 0, 0, 1, 1,
2.152282, 0.9817371, 1.619824, 1, 0, 0, 1, 1,
2.156817, -0.6088343, 1.72056, 1, 0, 0, 1, 1,
2.192613, 0.4255122, 1.924633, 0, 0, 0, 1, 1,
2.20277, 0.9824843, 2.03188, 0, 0, 0, 1, 1,
2.241374, 1.553739, 1.897818, 0, 0, 0, 1, 1,
2.304158, -1.942317, 1.367486, 0, 0, 0, 1, 1,
2.310371, 0.595616, 1.669461, 0, 0, 0, 1, 1,
2.358747, 0.3300974, 0.7867231, 0, 0, 0, 1, 1,
2.386244, -1.539104, 2.082424, 0, 0, 0, 1, 1,
2.527214, 0.01733993, 1.937539, 1, 1, 1, 1, 1,
2.59249, 1.305232, 1.189914, 1, 1, 1, 1, 1,
2.730748, 1.151794, 0.5235149, 1, 1, 1, 1, 1,
2.752357, -0.9530073, 1.415353, 1, 1, 1, 1, 1,
2.813571, -1.486254, 1.867979, 1, 1, 1, 1, 1,
2.862087, 1.903525, 0.6500412, 1, 1, 1, 1, 1,
3.348325, 1.358767, 0.7136295, 1, 1, 1, 1, 1
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
var radius = 9.4873;
var distance = 33.32374;
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
mvMatrix.translate( -0.1772743, 0.1011151, -0.6885867 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.32374);
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
