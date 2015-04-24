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
-3.435045, 1.330286, -0.3831718, 1, 0, 0, 1,
-3.377655, -1.280852, -1.537786, 1, 0.007843138, 0, 1,
-2.810029, -2.0514, -2.408977, 1, 0.01176471, 0, 1,
-2.781615, -0.2970276, 0.284827, 1, 0.01960784, 0, 1,
-2.700549, 1.307858, 0.4908324, 1, 0.02352941, 0, 1,
-2.662691, -0.3251248, -1.793736, 1, 0.03137255, 0, 1,
-2.528382, -1.701025, -1.789433, 1, 0.03529412, 0, 1,
-2.50241, 2.505393, -0.1308253, 1, 0.04313726, 0, 1,
-2.439184, 1.135844, 0.9266548, 1, 0.04705882, 0, 1,
-2.357427, 2.765793, -0.2028082, 1, 0.05490196, 0, 1,
-2.355392, -1.97324, -2.608483, 1, 0.05882353, 0, 1,
-2.341524, -0.4178747, -0.1764716, 1, 0.06666667, 0, 1,
-2.28289, 0.8803582, -2.20095, 1, 0.07058824, 0, 1,
-2.271779, 1.145875, -0.7224016, 1, 0.07843138, 0, 1,
-2.24897, -0.2505153, -0.7820156, 1, 0.08235294, 0, 1,
-2.23749, 0.7432583, 0.8249018, 1, 0.09019608, 0, 1,
-2.230856, 0.1645778, -2.062122, 1, 0.09411765, 0, 1,
-2.206526, -0.3440633, -1.189218, 1, 0.1019608, 0, 1,
-2.163826, -0.1509903, -1.444347, 1, 0.1098039, 0, 1,
-2.12161, 1.163937, -1.969591, 1, 0.1137255, 0, 1,
-2.106009, -1.109218, -1.873769, 1, 0.1215686, 0, 1,
-1.997551, -0.1087182, -1.811457, 1, 0.1254902, 0, 1,
-1.930655, -0.3795237, -0.9559249, 1, 0.1333333, 0, 1,
-1.904691, -0.2171155, -2.612659, 1, 0.1372549, 0, 1,
-1.901203, 1.059726, -1.488855, 1, 0.145098, 0, 1,
-1.900291, -1.330209, -1.653474, 1, 0.1490196, 0, 1,
-1.893112, 1.292075, -1.84072, 1, 0.1568628, 0, 1,
-1.886695, 1.149947, -2.084637, 1, 0.1607843, 0, 1,
-1.873996, -0.1804989, -2.770404, 1, 0.1686275, 0, 1,
-1.862897, -1.517068, -1.789256, 1, 0.172549, 0, 1,
-1.841847, -0.7269394, -0.3706023, 1, 0.1803922, 0, 1,
-1.839523, -0.8633347, -0.9684128, 1, 0.1843137, 0, 1,
-1.824172, -0.2348382, -2.927559, 1, 0.1921569, 0, 1,
-1.813214, -2.264776, -0.5498251, 1, 0.1960784, 0, 1,
-1.810467, -0.7866592, -1.641307, 1, 0.2039216, 0, 1,
-1.810218, -1.454229, -2.283957, 1, 0.2117647, 0, 1,
-1.799675, 1.389722, 0.1193632, 1, 0.2156863, 0, 1,
-1.78263, 1.374171, -0.2906158, 1, 0.2235294, 0, 1,
-1.779618, -0.3902128, -1.636338, 1, 0.227451, 0, 1,
-1.77279, 1.195492, -0.8159259, 1, 0.2352941, 0, 1,
-1.747216, 0.212999, -2.378483, 1, 0.2392157, 0, 1,
-1.732731, 0.7651194, -1.03911, 1, 0.2470588, 0, 1,
-1.721589, 0.5490494, -0.3335396, 1, 0.2509804, 0, 1,
-1.703691, -0.1378601, -3.564577, 1, 0.2588235, 0, 1,
-1.666084, -0.612459, -3.020649, 1, 0.2627451, 0, 1,
-1.660562, 1.292341, -0.2603806, 1, 0.2705882, 0, 1,
-1.648723, -0.4137185, -1.783069, 1, 0.2745098, 0, 1,
-1.647815, -0.6555794, -1.074912, 1, 0.282353, 0, 1,
-1.644124, 0.9187765, -1.970865, 1, 0.2862745, 0, 1,
-1.642392, 0.4626365, -1.607464, 1, 0.2941177, 0, 1,
-1.641351, -0.8960453, -2.445942, 1, 0.3019608, 0, 1,
-1.625573, -0.6131339, -0.1798049, 1, 0.3058824, 0, 1,
-1.608775, -1.61317, -2.635714, 1, 0.3137255, 0, 1,
-1.585627, 0.6055988, -1.733815, 1, 0.3176471, 0, 1,
-1.584841, 0.8856137, -0.5854723, 1, 0.3254902, 0, 1,
-1.584631, -1.6081, -2.843843, 1, 0.3294118, 0, 1,
-1.563907, 0.2793605, -0.8328636, 1, 0.3372549, 0, 1,
-1.550459, 0.5888634, -0.6369225, 1, 0.3411765, 0, 1,
-1.527713, 0.499524, -0.9078028, 1, 0.3490196, 0, 1,
-1.517533, -0.7582158, -0.8785806, 1, 0.3529412, 0, 1,
-1.514812, -0.6440929, -4.015312, 1, 0.3607843, 0, 1,
-1.513742, -0.8333614, -2.836001, 1, 0.3647059, 0, 1,
-1.509778, 1.409907, -1.295489, 1, 0.372549, 0, 1,
-1.468663, -0.9657476, -3.497717, 1, 0.3764706, 0, 1,
-1.467016, 0.8598798, -1.661313, 1, 0.3843137, 0, 1,
-1.456401, 1.691832, 0.8042483, 1, 0.3882353, 0, 1,
-1.452894, 0.7031156, -0.4063726, 1, 0.3960784, 0, 1,
-1.44861, -0.9208052, -1.884715, 1, 0.4039216, 0, 1,
-1.43367, -0.8446687, -2.275809, 1, 0.4078431, 0, 1,
-1.429974, -0.2785041, -2.665915, 1, 0.4156863, 0, 1,
-1.427329, 0.5464923, -1.780983, 1, 0.4196078, 0, 1,
-1.418128, 1.481319, -0.889817, 1, 0.427451, 0, 1,
-1.409395, -0.6489057, -1.877891, 1, 0.4313726, 0, 1,
-1.407798, 1.527557, -2.267297, 1, 0.4392157, 0, 1,
-1.398944, -0.4257312, -1.369813, 1, 0.4431373, 0, 1,
-1.396503, 0.92542, -0.9166844, 1, 0.4509804, 0, 1,
-1.394725, 1.167007, -2.760234, 1, 0.454902, 0, 1,
-1.385852, -0.5301023, -1.9844, 1, 0.4627451, 0, 1,
-1.384603, 1.064388, -0.6545722, 1, 0.4666667, 0, 1,
-1.376643, -0.0780085, -1.253079, 1, 0.4745098, 0, 1,
-1.369051, 0.2952811, -1.016524, 1, 0.4784314, 0, 1,
-1.367715, -0.837292, -2.267428, 1, 0.4862745, 0, 1,
-1.367076, -0.6862776, -2.932899, 1, 0.4901961, 0, 1,
-1.362741, 0.6347178, -1.930351, 1, 0.4980392, 0, 1,
-1.361657, -0.5054266, -0.6694711, 1, 0.5058824, 0, 1,
-1.356266, -0.2298986, -0.3277106, 1, 0.509804, 0, 1,
-1.335726, 0.4043885, -0.8531283, 1, 0.5176471, 0, 1,
-1.332336, 0.9500671, 0.2159823, 1, 0.5215687, 0, 1,
-1.327826, 1.603799, -0.3873159, 1, 0.5294118, 0, 1,
-1.326371, -0.4586842, -2.944867, 1, 0.5333334, 0, 1,
-1.322022, -1.152769, -2.962691, 1, 0.5411765, 0, 1,
-1.312024, -1.068307, -2.008245, 1, 0.5450981, 0, 1,
-1.310819, -0.718401, -2.049336, 1, 0.5529412, 0, 1,
-1.306214, 0.06807085, -1.777454, 1, 0.5568628, 0, 1,
-1.299542, 1.264187, -0.3353578, 1, 0.5647059, 0, 1,
-1.286185, 0.3948667, -1.592676, 1, 0.5686275, 0, 1,
-1.265526, 0.5219417, -1.526964, 1, 0.5764706, 0, 1,
-1.258483, 0.1308511, -3.56024, 1, 0.5803922, 0, 1,
-1.248331, -0.4233076, -1.436872, 1, 0.5882353, 0, 1,
-1.220439, -0.7504522, -2.51069, 1, 0.5921569, 0, 1,
-1.22, 1.02101, 0.06583188, 1, 0.6, 0, 1,
-1.212218, 0.1424717, -1.417994, 1, 0.6078432, 0, 1,
-1.193188, -0.8379684, -3.106595, 1, 0.6117647, 0, 1,
-1.183398, -0.2849441, -2.793636, 1, 0.6196079, 0, 1,
-1.183251, -1.149503, -2.14033, 1, 0.6235294, 0, 1,
-1.181545, -0.5722225, -2.030202, 1, 0.6313726, 0, 1,
-1.17707, -0.9253469, -1.800882, 1, 0.6352941, 0, 1,
-1.174495, -0.1169631, -0.5970414, 1, 0.6431373, 0, 1,
-1.173597, 0.1052186, -2.363918, 1, 0.6470588, 0, 1,
-1.164367, 0.3606349, -0.7747508, 1, 0.654902, 0, 1,
-1.161107, -1.173321, -1.866111, 1, 0.6588235, 0, 1,
-1.156329, -0.6074408, -2.748961, 1, 0.6666667, 0, 1,
-1.153706, 1.869747, -2.02576, 1, 0.6705883, 0, 1,
-1.1536, 0.6806481, -0.4650726, 1, 0.6784314, 0, 1,
-1.151795, -1.621561, -0.4515721, 1, 0.682353, 0, 1,
-1.149322, -1.38355, -1.220448, 1, 0.6901961, 0, 1,
-1.148337, 0.8705336, 0.3265176, 1, 0.6941177, 0, 1,
-1.148096, -0.7427568, -3.476639, 1, 0.7019608, 0, 1,
-1.143965, -1.732043, -2.518442, 1, 0.7098039, 0, 1,
-1.12862, 1.341146, -1.924876, 1, 0.7137255, 0, 1,
-1.125254, -1.281177, -2.237888, 1, 0.7215686, 0, 1,
-1.118451, -0.1389309, -0.8700814, 1, 0.7254902, 0, 1,
-1.115618, 0.3345389, -1.053582, 1, 0.7333333, 0, 1,
-1.11295, 0.8985337, 0.6804027, 1, 0.7372549, 0, 1,
-1.112924, -0.1646275, -1.95185, 1, 0.7450981, 0, 1,
-1.111535, 1.326739, -0.1502654, 1, 0.7490196, 0, 1,
-1.111245, 0.2454634, 0.1461545, 1, 0.7568628, 0, 1,
-1.099367, -0.7222969, -3.423998, 1, 0.7607843, 0, 1,
-1.097804, 0.4844377, -1.458694, 1, 0.7686275, 0, 1,
-1.089741, -0.005674001, -1.843832, 1, 0.772549, 0, 1,
-1.089277, 0.3891669, -1.53336, 1, 0.7803922, 0, 1,
-1.083842, -1.651354, -2.955628, 1, 0.7843137, 0, 1,
-1.077283, 2.616383, 0.08520612, 1, 0.7921569, 0, 1,
-1.074951, -1.000844, -2.319996, 1, 0.7960784, 0, 1,
-1.070084, -0.1586575, -0.111347, 1, 0.8039216, 0, 1,
-1.064916, -1.790889, -2.548379, 1, 0.8117647, 0, 1,
-1.064909, -0.2098706, -1.217332, 1, 0.8156863, 0, 1,
-1.061571, -0.6058688, -1.283649, 1, 0.8235294, 0, 1,
-1.058777, -1.756933, -3.111927, 1, 0.827451, 0, 1,
-1.058456, -0.2492256, -1.605557, 1, 0.8352941, 0, 1,
-1.050985, 0.1067614, -1.809512, 1, 0.8392157, 0, 1,
-1.047584, 1.419413, 1.302202, 1, 0.8470588, 0, 1,
-1.044637, -1.374465, -2.835798, 1, 0.8509804, 0, 1,
-1.039945, -0.2939179, -0.01636137, 1, 0.8588235, 0, 1,
-1.038867, 0.1900164, -0.9046702, 1, 0.8627451, 0, 1,
-1.037674, 1.687492, 1.901098, 1, 0.8705882, 0, 1,
-1.036492, 0.2837427, -1.107914, 1, 0.8745098, 0, 1,
-1.03607, -0.04812354, -2.061441, 1, 0.8823529, 0, 1,
-1.035083, 0.1509873, -1.214802, 1, 0.8862745, 0, 1,
-1.035022, 0.4739249, -0.5597799, 1, 0.8941177, 0, 1,
-1.027381, -1.916727, -3.899884, 1, 0.8980392, 0, 1,
-1.022193, 1.785315, -0.5915241, 1, 0.9058824, 0, 1,
-1.022158, -0.6973604, -2.8801, 1, 0.9137255, 0, 1,
-1.018963, -0.6982976, -2.50758, 1, 0.9176471, 0, 1,
-1.016989, -1.744104, -2.29356, 1, 0.9254902, 0, 1,
-1.010311, 0.5138873, -1.68291, 1, 0.9294118, 0, 1,
-1.0058, 2.173841, -1.756747, 1, 0.9372549, 0, 1,
-1.004132, 0.2661747, -1.830517, 1, 0.9411765, 0, 1,
-1.000721, 1.225969, 0.9581906, 1, 0.9490196, 0, 1,
-1.000029, -0.7480084, -3.555809, 1, 0.9529412, 0, 1,
-0.9979238, 1.759702, -0.8825721, 1, 0.9607843, 0, 1,
-0.9958919, 0.5748104, -0.5761904, 1, 0.9647059, 0, 1,
-0.9910037, -1.145732, -2.246284, 1, 0.972549, 0, 1,
-0.9909788, -0.6463886, -0.8234713, 1, 0.9764706, 0, 1,
-0.9880556, -1.021794, -2.910494, 1, 0.9843137, 0, 1,
-0.9820475, 2.094942, 0.5405875, 1, 0.9882353, 0, 1,
-0.9772971, 0.7193053, 0.3147861, 1, 0.9960784, 0, 1,
-0.9664332, 0.2644159, -1.197299, 0.9960784, 1, 0, 1,
-0.9655132, -0.1322802, -1.106524, 0.9921569, 1, 0, 1,
-0.9608117, -1.418118, -3.702122, 0.9843137, 1, 0, 1,
-0.9522303, -0.0001445748, -3.366364, 0.9803922, 1, 0, 1,
-0.9493934, -0.4933579, -1.337947, 0.972549, 1, 0, 1,
-0.9442844, -0.5061009, -0.9856374, 0.9686275, 1, 0, 1,
-0.939512, -1.462992, -1.954072, 0.9607843, 1, 0, 1,
-0.9387608, -0.6289421, -1.08838, 0.9568627, 1, 0, 1,
-0.9314528, -0.2435457, -2.846211, 0.9490196, 1, 0, 1,
-0.9262185, 1.461553, -2.760681, 0.945098, 1, 0, 1,
-0.9179667, 0.6680017, -1.356351, 0.9372549, 1, 0, 1,
-0.917287, 0.1223433, -1.391016, 0.9333333, 1, 0, 1,
-0.9155676, 1.015849, -1.303538, 0.9254902, 1, 0, 1,
-0.911135, -0.5894712, -3.350859, 0.9215686, 1, 0, 1,
-0.9048282, 1.72966, 0.1642809, 0.9137255, 1, 0, 1,
-0.903114, -1.259269, -3.022081, 0.9098039, 1, 0, 1,
-0.8992428, 0.004475178, -2.423553, 0.9019608, 1, 0, 1,
-0.8984213, 1.280998, -0.4516924, 0.8941177, 1, 0, 1,
-0.8980795, 1.45114, -1.505315, 0.8901961, 1, 0, 1,
-0.8962511, 0.6787218, 0.8559849, 0.8823529, 1, 0, 1,
-0.8939252, 0.05425172, 0.09903923, 0.8784314, 1, 0, 1,
-0.8910565, -0.5776322, -1.851893, 0.8705882, 1, 0, 1,
-0.8884995, 0.8923537, 0.1450974, 0.8666667, 1, 0, 1,
-0.887977, -1.181358, -3.466777, 0.8588235, 1, 0, 1,
-0.8871525, 0.7584053, -0.2678306, 0.854902, 1, 0, 1,
-0.8845282, -0.7922072, -3.159096, 0.8470588, 1, 0, 1,
-0.8838462, -0.7190912, -2.030519, 0.8431373, 1, 0, 1,
-0.8834473, -0.2537428, -0.211941, 0.8352941, 1, 0, 1,
-0.8770066, 0.4846151, -2.112345, 0.8313726, 1, 0, 1,
-0.8737717, 1.269118, 0.876018, 0.8235294, 1, 0, 1,
-0.8676637, -1.455564, -3.057618, 0.8196079, 1, 0, 1,
-0.8644944, 0.2103377, -0.4475559, 0.8117647, 1, 0, 1,
-0.8619733, -0.1911712, -3.789802, 0.8078431, 1, 0, 1,
-0.8578211, -0.6210739, -2.714672, 0.8, 1, 0, 1,
-0.8551008, 1.321625, -1.817341, 0.7921569, 1, 0, 1,
-0.8528896, 0.02167829, -1.229975, 0.7882353, 1, 0, 1,
-0.8519159, 1.025542, -2.026036, 0.7803922, 1, 0, 1,
-0.8477292, 0.3951753, -2.089956, 0.7764706, 1, 0, 1,
-0.8462447, 1.489437, 1.460922, 0.7686275, 1, 0, 1,
-0.8458002, 0.3429692, -1.251083, 0.7647059, 1, 0, 1,
-0.8451695, 1.607483, -1.552904, 0.7568628, 1, 0, 1,
-0.8385148, 0.4667909, -0.4786248, 0.7529412, 1, 0, 1,
-0.8383034, 0.789865, -1.817963, 0.7450981, 1, 0, 1,
-0.8376666, -0.6628382, -2.477326, 0.7411765, 1, 0, 1,
-0.8348652, 1.036493, -0.122874, 0.7333333, 1, 0, 1,
-0.8299645, -0.6921062, -3.14392, 0.7294118, 1, 0, 1,
-0.8285744, 0.0904021, -1.441476, 0.7215686, 1, 0, 1,
-0.827411, -0.7425343, -1.278233, 0.7176471, 1, 0, 1,
-0.8269533, -1.12612, -4.190054, 0.7098039, 1, 0, 1,
-0.8268245, -0.355329, -1.866209, 0.7058824, 1, 0, 1,
-0.8176894, -0.5213234, -1.668477, 0.6980392, 1, 0, 1,
-0.815125, 0.5820611, -1.827845, 0.6901961, 1, 0, 1,
-0.8136148, 2.369242, -1.64544, 0.6862745, 1, 0, 1,
-0.8093349, 1.94049, -0.08439215, 0.6784314, 1, 0, 1,
-0.8090737, 0.195288, -0.562041, 0.6745098, 1, 0, 1,
-0.8071752, 1.303965, 0.7440597, 0.6666667, 1, 0, 1,
-0.8045247, 0.4829245, -1.486095, 0.6627451, 1, 0, 1,
-0.8025677, -1.181866, -2.450777, 0.654902, 1, 0, 1,
-0.8016934, 0.2284375, -1.928461, 0.6509804, 1, 0, 1,
-0.7951797, 2.193684, 1.333838, 0.6431373, 1, 0, 1,
-0.7879077, 0.3783838, -2.571872, 0.6392157, 1, 0, 1,
-0.7817204, -0.2117841, -1.651156, 0.6313726, 1, 0, 1,
-0.7805339, 1.382795, 1.07209, 0.627451, 1, 0, 1,
-0.7778221, 1.108362, 0.1672835, 0.6196079, 1, 0, 1,
-0.7763401, 0.4887898, -0.4334177, 0.6156863, 1, 0, 1,
-0.7679034, 0.6181644, -2.038243, 0.6078432, 1, 0, 1,
-0.7652472, -0.2178992, -1.09407, 0.6039216, 1, 0, 1,
-0.7633026, 0.6964, -1.467758, 0.5960785, 1, 0, 1,
-0.761666, -0.1111791, -1.391243, 0.5882353, 1, 0, 1,
-0.7492939, 0.2406421, -0.9882258, 0.5843138, 1, 0, 1,
-0.7476318, 0.268159, -0.4483394, 0.5764706, 1, 0, 1,
-0.7464352, -1.071487, -2.599226, 0.572549, 1, 0, 1,
-0.7386836, -1.236931, -1.672013, 0.5647059, 1, 0, 1,
-0.7375288, 0.8006157, -2.491534, 0.5607843, 1, 0, 1,
-0.7372166, -0.2751177, -0.737151, 0.5529412, 1, 0, 1,
-0.7339661, -0.6426911, -0.7922685, 0.5490196, 1, 0, 1,
-0.7323156, 1.27143, -3.289069, 0.5411765, 1, 0, 1,
-0.7307258, -0.185834, -0.06265479, 0.5372549, 1, 0, 1,
-0.7184035, 0.1268254, -0.6409839, 0.5294118, 1, 0, 1,
-0.7159408, 0.3156043, -1.312887, 0.5254902, 1, 0, 1,
-0.7121729, -0.1338058, -0.8379452, 0.5176471, 1, 0, 1,
-0.7118374, -0.4967981, -2.987731, 0.5137255, 1, 0, 1,
-0.7117633, 0.1586301, -2.264709, 0.5058824, 1, 0, 1,
-0.7072867, -0.5603487, -1.737277, 0.5019608, 1, 0, 1,
-0.7066284, 0.6092654, -1.769976, 0.4941176, 1, 0, 1,
-0.7046739, 0.5094095, -3.558841, 0.4862745, 1, 0, 1,
-0.6955118, 0.5002702, 0.2204025, 0.4823529, 1, 0, 1,
-0.6920415, 0.009152588, -2.208171, 0.4745098, 1, 0, 1,
-0.6892444, 0.7211587, 0.5673048, 0.4705882, 1, 0, 1,
-0.6877126, -0.0544802, -2.61319, 0.4627451, 1, 0, 1,
-0.6866933, -2.226551, -3.698775, 0.4588235, 1, 0, 1,
-0.6823089, -0.7546074, -2.919527, 0.4509804, 1, 0, 1,
-0.6807379, -0.08462632, -0.0561459, 0.4470588, 1, 0, 1,
-0.6799402, 0.9586539, -1.578607, 0.4392157, 1, 0, 1,
-0.6776001, -1.02405, -1.986443, 0.4352941, 1, 0, 1,
-0.6774355, -0.04740055, -3.302041, 0.427451, 1, 0, 1,
-0.6674615, -1.992, -4.821628, 0.4235294, 1, 0, 1,
-0.6670976, -0.1836526, -0.6488284, 0.4156863, 1, 0, 1,
-0.6661126, 1.466533, 1.798038, 0.4117647, 1, 0, 1,
-0.6581287, -1.318727, -4.730258, 0.4039216, 1, 0, 1,
-0.6505715, -0.8874122, -0.7230567, 0.3960784, 1, 0, 1,
-0.6467763, -0.8283353, -2.503746, 0.3921569, 1, 0, 1,
-0.6440524, 1.392602, -1.486318, 0.3843137, 1, 0, 1,
-0.6379009, -0.7923582, -2.372555, 0.3803922, 1, 0, 1,
-0.6372715, -0.162014, -3.128319, 0.372549, 1, 0, 1,
-0.6368406, 0.2392112, -1.671883, 0.3686275, 1, 0, 1,
-0.6270868, 1.1195, 0.5969505, 0.3607843, 1, 0, 1,
-0.6141827, 0.4345359, -2.744103, 0.3568628, 1, 0, 1,
-0.6137465, 1.3962, -2.239049, 0.3490196, 1, 0, 1,
-0.6129512, 0.1122939, -0.4696256, 0.345098, 1, 0, 1,
-0.6096885, -0.9460157, -1.471491, 0.3372549, 1, 0, 1,
-0.5985271, -0.184986, -0.9947132, 0.3333333, 1, 0, 1,
-0.59526, -0.1816191, -1.895638, 0.3254902, 1, 0, 1,
-0.5924139, -1.317092, -2.965937, 0.3215686, 1, 0, 1,
-0.5900723, -1.101357, -1.52271, 0.3137255, 1, 0, 1,
-0.5877662, 0.6299474, -1.724956, 0.3098039, 1, 0, 1,
-0.5832921, 0.7196385, 0.361521, 0.3019608, 1, 0, 1,
-0.5745106, 0.7940331, -1.815273, 0.2941177, 1, 0, 1,
-0.5733907, -0.6195731, -4.693905, 0.2901961, 1, 0, 1,
-0.5704482, 0.4695937, -0.09595934, 0.282353, 1, 0, 1,
-0.5662313, -0.3714707, -0.4205865, 0.2784314, 1, 0, 1,
-0.5658119, -0.3168671, -1.627887, 0.2705882, 1, 0, 1,
-0.5538959, 1.604122, 2.447692, 0.2666667, 1, 0, 1,
-0.5528696, -0.2666175, -1.793581, 0.2588235, 1, 0, 1,
-0.5521339, 1.38397, -0.1564133, 0.254902, 1, 0, 1,
-0.5512437, -0.2766858, -0.8940777, 0.2470588, 1, 0, 1,
-0.5501204, 1.200514, -0.288545, 0.2431373, 1, 0, 1,
-0.5479921, 0.2170636, -1.345022, 0.2352941, 1, 0, 1,
-0.5465482, -0.8648753, -1.449996, 0.2313726, 1, 0, 1,
-0.544008, 0.4677465, -1.117646, 0.2235294, 1, 0, 1,
-0.5425667, 0.8991449, -0.7179672, 0.2196078, 1, 0, 1,
-0.542453, -0.7579871, -4.048673, 0.2117647, 1, 0, 1,
-0.5331158, 0.5961684, -0.7574636, 0.2078431, 1, 0, 1,
-0.5308904, 1.624542, 0.89482, 0.2, 1, 0, 1,
-0.5303416, -0.5242823, -3.329864, 0.1921569, 1, 0, 1,
-0.5240819, 0.1860945, -3.220334, 0.1882353, 1, 0, 1,
-0.5240295, -1.247053, -2.766181, 0.1803922, 1, 0, 1,
-0.519919, 0.8702077, 0.5126322, 0.1764706, 1, 0, 1,
-0.5158206, 1.174633, -1.001015, 0.1686275, 1, 0, 1,
-0.5156119, -0.7901148, -2.835618, 0.1647059, 1, 0, 1,
-0.5148162, 1.257457, -2.793022, 0.1568628, 1, 0, 1,
-0.5134531, 0.8119287, 0.6880255, 0.1529412, 1, 0, 1,
-0.513258, 1.6746, 0.1233257, 0.145098, 1, 0, 1,
-0.5127704, -0.7029316, -2.855128, 0.1411765, 1, 0, 1,
-0.5054864, 1.346855, 0.5856386, 0.1333333, 1, 0, 1,
-0.5050889, 1.840371, 0.05276848, 0.1294118, 1, 0, 1,
-0.5009629, -2.438071, -2.477578, 0.1215686, 1, 0, 1,
-0.4998406, 0.4780883, -3.606606, 0.1176471, 1, 0, 1,
-0.4991282, -0.5378824, -3.348412, 0.1098039, 1, 0, 1,
-0.4926462, -1.293171, -2.73885, 0.1058824, 1, 0, 1,
-0.4876404, -0.5905176, -2.213113, 0.09803922, 1, 0, 1,
-0.4820371, 0.9012344, -0.8074794, 0.09019608, 1, 0, 1,
-0.4798191, -0.6780957, -3.203244, 0.08627451, 1, 0, 1,
-0.4733723, 1.102467, -1.549948, 0.07843138, 1, 0, 1,
-0.4700183, -1.922158, -3.68435, 0.07450981, 1, 0, 1,
-0.463982, -1.338112, -4.407273, 0.06666667, 1, 0, 1,
-0.4632112, -0.5675296, -2.441464, 0.0627451, 1, 0, 1,
-0.4613865, 2.063045, -1.076742, 0.05490196, 1, 0, 1,
-0.4594187, -0.02946434, -1.460981, 0.05098039, 1, 0, 1,
-0.4580798, -0.3811637, -3.272951, 0.04313726, 1, 0, 1,
-0.4575642, 2.488548, 0.7595076, 0.03921569, 1, 0, 1,
-0.4523131, 0.6887152, -2.47781, 0.03137255, 1, 0, 1,
-0.4498506, -1.548801, -3.527428, 0.02745098, 1, 0, 1,
-0.4453512, -1.483974, -1.584917, 0.01960784, 1, 0, 1,
-0.444181, -0.7693028, -3.613238, 0.01568628, 1, 0, 1,
-0.4402241, 0.2626352, -1.897569, 0.007843138, 1, 0, 1,
-0.4340847, 0.1012376, -0.9654096, 0.003921569, 1, 0, 1,
-0.4333431, 1.870649, 0.05759976, 0, 1, 0.003921569, 1,
-0.4320802, 0.8082008, -0.986696, 0, 1, 0.01176471, 1,
-0.4278319, -2.12954, -3.106332, 0, 1, 0.01568628, 1,
-0.4267935, 0.3090611, 0.2861716, 0, 1, 0.02352941, 1,
-0.4262471, 1.123366, 0.3085621, 0, 1, 0.02745098, 1,
-0.4243154, 0.606868, -0.9251863, 0, 1, 0.03529412, 1,
-0.4230191, -0.7631094, -2.751388, 0, 1, 0.03921569, 1,
-0.4203079, 0.7087311, -0.4978326, 0, 1, 0.04705882, 1,
-0.419858, -2.007054, -1.190996, 0, 1, 0.05098039, 1,
-0.4171311, -0.9007587, -1.297238, 0, 1, 0.05882353, 1,
-0.4065531, -0.7379217, -2.946787, 0, 1, 0.0627451, 1,
-0.4053047, 0.6553859, -1.846202, 0, 1, 0.07058824, 1,
-0.3955705, -0.6622154, -4.145478, 0, 1, 0.07450981, 1,
-0.3950548, -0.6711522, -1.959431, 0, 1, 0.08235294, 1,
-0.3901573, 1.294332, -0.8005258, 0, 1, 0.08627451, 1,
-0.3867365, 3.347197, -0.2858869, 0, 1, 0.09411765, 1,
-0.3841744, -0.6366385, -3.059437, 0, 1, 0.1019608, 1,
-0.3840297, 1.621455, -0.7444954, 0, 1, 0.1058824, 1,
-0.3777921, 1.400138, -0.893171, 0, 1, 0.1137255, 1,
-0.3759103, -0.9749035, -1.678193, 0, 1, 0.1176471, 1,
-0.3725075, -1.211962, -1.890778, 0, 1, 0.1254902, 1,
-0.372137, -0.5595471, -1.79475, 0, 1, 0.1294118, 1,
-0.3717977, 1.027887, 0.2915891, 0, 1, 0.1372549, 1,
-0.3715066, -2.33655, -1.831233, 0, 1, 0.1411765, 1,
-0.371293, 1.737018, -0.5725942, 0, 1, 0.1490196, 1,
-0.369608, -1.339261, -3.173744, 0, 1, 0.1529412, 1,
-0.3693948, -0.4567995, -2.143864, 0, 1, 0.1607843, 1,
-0.3682096, 0.2112497, -2.47168, 0, 1, 0.1647059, 1,
-0.3679942, -0.5537821, -1.85503, 0, 1, 0.172549, 1,
-0.3597674, -1.162099, -0.7174711, 0, 1, 0.1764706, 1,
-0.3571767, -0.5968578, -1.97527, 0, 1, 0.1843137, 1,
-0.351161, -0.299123, -2.841459, 0, 1, 0.1882353, 1,
-0.340319, -0.1155962, -0.3225412, 0, 1, 0.1960784, 1,
-0.3386986, -1.393373, -2.64787, 0, 1, 0.2039216, 1,
-0.3349528, -2.046304, -4.16445, 0, 1, 0.2078431, 1,
-0.3337107, 0.559757, -0.8375651, 0, 1, 0.2156863, 1,
-0.3322053, 2.511179, -0.6720018, 0, 1, 0.2196078, 1,
-0.3291797, 0.9335293, 0.9927966, 0, 1, 0.227451, 1,
-0.327824, -0.2735316, -1.862291, 0, 1, 0.2313726, 1,
-0.3268459, -1.812121, -2.19774, 0, 1, 0.2392157, 1,
-0.3231283, -0.1390537, -1.76766, 0, 1, 0.2431373, 1,
-0.3201567, 0.04301854, -0.7027988, 0, 1, 0.2509804, 1,
-0.3198778, 1.237914, 1.331404, 0, 1, 0.254902, 1,
-0.3167561, -0.708329, -1.605699, 0, 1, 0.2627451, 1,
-0.3166886, 0.05247921, -1.936468, 0, 1, 0.2666667, 1,
-0.315917, 0.1149024, -0.5081272, 0, 1, 0.2745098, 1,
-0.3147871, 0.1519442, -2.882878, 0, 1, 0.2784314, 1,
-0.3145113, 0.6022075, 0.07494133, 0, 1, 0.2862745, 1,
-0.3131619, -1.941775, -0.4202787, 0, 1, 0.2901961, 1,
-0.3125894, -0.8154872, -2.014241, 0, 1, 0.2980392, 1,
-0.3112934, -1.73867, -2.529306, 0, 1, 0.3058824, 1,
-0.2991811, -0.896973, -4.217813, 0, 1, 0.3098039, 1,
-0.2947042, 0.02709474, -1.023561, 0, 1, 0.3176471, 1,
-0.29314, 1.259185, 0.6556095, 0, 1, 0.3215686, 1,
-0.2871612, -0.02957098, -2.443348, 0, 1, 0.3294118, 1,
-0.2839671, 0.1696113, -1.516502, 0, 1, 0.3333333, 1,
-0.2835818, 0.3067466, -2.683994, 0, 1, 0.3411765, 1,
-0.2824836, -0.8121645, -1.192645, 0, 1, 0.345098, 1,
-0.279571, -0.1267808, -3.670757, 0, 1, 0.3529412, 1,
-0.2775892, -0.5632885, -2.824056, 0, 1, 0.3568628, 1,
-0.2766152, -0.7382686, -2.186026, 0, 1, 0.3647059, 1,
-0.2758835, -0.04680787, -0.8074914, 0, 1, 0.3686275, 1,
-0.2755347, -0.3403526, -0.5597833, 0, 1, 0.3764706, 1,
-0.2733927, -1.438079, -2.98282, 0, 1, 0.3803922, 1,
-0.2729973, 0.7811818, 0.2782613, 0, 1, 0.3882353, 1,
-0.2727799, 0.124823, 0.176439, 0, 1, 0.3921569, 1,
-0.2707668, -0.2774104, -3.094758, 0, 1, 0.4, 1,
-0.2698006, -1.042838, -2.421482, 0, 1, 0.4078431, 1,
-0.2674699, 0.1322948, -0.6695019, 0, 1, 0.4117647, 1,
-0.2607872, -2.062883, -4.507685, 0, 1, 0.4196078, 1,
-0.2604207, 1.978539, 0.0955475, 0, 1, 0.4235294, 1,
-0.2534976, 0.3918822, -1.085529, 0, 1, 0.4313726, 1,
-0.2499344, 0.2434246, 0.3273064, 0, 1, 0.4352941, 1,
-0.2480641, -0.2659879, -2.886305, 0, 1, 0.4431373, 1,
-0.2470302, -0.6732965, -2.500872, 0, 1, 0.4470588, 1,
-0.2392342, -0.6885628, -3.179714, 0, 1, 0.454902, 1,
-0.237773, 1.058087, 0.3900816, 0, 1, 0.4588235, 1,
-0.2346857, 0.2953837, -0.573046, 0, 1, 0.4666667, 1,
-0.234055, 0.6995534, -1.687059, 0, 1, 0.4705882, 1,
-0.2329831, -0.1755178, -2.776551, 0, 1, 0.4784314, 1,
-0.2321509, -0.01169637, -3.433644, 0, 1, 0.4823529, 1,
-0.231866, -0.1381897, -1.703802, 0, 1, 0.4901961, 1,
-0.2315306, -0.1813544, -1.585268, 0, 1, 0.4941176, 1,
-0.2307185, -1.406446, -1.220449, 0, 1, 0.5019608, 1,
-0.2217218, -0.7662252, -2.973777, 0, 1, 0.509804, 1,
-0.2202462, 1.93279, -0.2236647, 0, 1, 0.5137255, 1,
-0.218317, -0.4513816, -2.665021, 0, 1, 0.5215687, 1,
-0.2149176, -1.831582, -3.544447, 0, 1, 0.5254902, 1,
-0.2136699, 0.1551929, 0.3033212, 0, 1, 0.5333334, 1,
-0.2090719, 0.573392, -2.755475, 0, 1, 0.5372549, 1,
-0.2080388, -0.826853, -3.820814, 0, 1, 0.5450981, 1,
-0.2031386, 0.04982416, -0.75785, 0, 1, 0.5490196, 1,
-0.2007974, 0.7411323, 0.4657072, 0, 1, 0.5568628, 1,
-0.2000534, 1.233623, -0.1282208, 0, 1, 0.5607843, 1,
-0.1985381, 0.5027227, -0.6284499, 0, 1, 0.5686275, 1,
-0.1961152, -0.1154194, 0.1917666, 0, 1, 0.572549, 1,
-0.1929473, 1.732435, -0.2733259, 0, 1, 0.5803922, 1,
-0.1912411, 0.4991945, -0.7155945, 0, 1, 0.5843138, 1,
-0.1883861, -0.3651436, -2.371215, 0, 1, 0.5921569, 1,
-0.187731, -0.9547963, -2.324712, 0, 1, 0.5960785, 1,
-0.1856008, -1.327959, -2.888985, 0, 1, 0.6039216, 1,
-0.1807736, 0.7164721, 0.5797132, 0, 1, 0.6117647, 1,
-0.1797157, -0.5279242, -1.517783, 0, 1, 0.6156863, 1,
-0.1791801, -0.8779479, -2.940898, 0, 1, 0.6235294, 1,
-0.1751662, -0.821456, -3.004188, 0, 1, 0.627451, 1,
-0.1741793, -0.3016766, -0.7930098, 0, 1, 0.6352941, 1,
-0.1718078, -0.2475019, -2.134092, 0, 1, 0.6392157, 1,
-0.1677764, 1.44429, -0.08993032, 0, 1, 0.6470588, 1,
-0.1649904, -0.6614474, -1.02733, 0, 1, 0.6509804, 1,
-0.1572691, 1.259503, 0.9150345, 0, 1, 0.6588235, 1,
-0.15595, 0.3292431, 0.1716407, 0, 1, 0.6627451, 1,
-0.1507944, -0.4343418, -1.201684, 0, 1, 0.6705883, 1,
-0.1486028, -1.354074, -3.609125, 0, 1, 0.6745098, 1,
-0.1476599, -0.9427904, -0.8009425, 0, 1, 0.682353, 1,
-0.1466792, -0.863119, -2.996248, 0, 1, 0.6862745, 1,
-0.1444986, -0.3821302, -2.714766, 0, 1, 0.6941177, 1,
-0.142443, -0.2831447, -2.44773, 0, 1, 0.7019608, 1,
-0.1413097, -0.7172921, -3.764625, 0, 1, 0.7058824, 1,
-0.1390823, -0.6494775, -1.264533, 0, 1, 0.7137255, 1,
-0.1331564, 1.29303, 0.8971022, 0, 1, 0.7176471, 1,
-0.133013, 1.722449, 0.4353134, 0, 1, 0.7254902, 1,
-0.1319847, 0.5885867, -1.045607, 0, 1, 0.7294118, 1,
-0.1282262, 0.2211564, -0.9664566, 0, 1, 0.7372549, 1,
-0.1242286, 0.1556435, -0.2888529, 0, 1, 0.7411765, 1,
-0.1231515, -0.6507468, -2.750411, 0, 1, 0.7490196, 1,
-0.1225876, 0.321935, -0.2681165, 0, 1, 0.7529412, 1,
-0.1217648, -1.658401, -2.236046, 0, 1, 0.7607843, 1,
-0.1204793, -0.1582216, -2.602933, 0, 1, 0.7647059, 1,
-0.1189992, 0.6108859, 0.3881014, 0, 1, 0.772549, 1,
-0.1188125, -1.940844, -2.237702, 0, 1, 0.7764706, 1,
-0.1179459, -1.402215, -3.98977, 0, 1, 0.7843137, 1,
-0.1176429, 0.461727, -0.7893221, 0, 1, 0.7882353, 1,
-0.1142514, -1.861923, -3.945436, 0, 1, 0.7960784, 1,
-0.1073267, 0.07516318, -0.271663, 0, 1, 0.8039216, 1,
-0.1053008, 2.380165, 0.3221196, 0, 1, 0.8078431, 1,
-0.1036144, 2.12081, -1.559267, 0, 1, 0.8156863, 1,
-0.1015323, -0.4766794, -4.241677, 0, 1, 0.8196079, 1,
-0.1008508, 0.1007058, 0.1635671, 0, 1, 0.827451, 1,
-0.100721, -0.9858658, -1.178418, 0, 1, 0.8313726, 1,
-0.09880812, 1.318066, 0.3436334, 0, 1, 0.8392157, 1,
-0.09761633, 0.1880098, -0.5804381, 0, 1, 0.8431373, 1,
-0.09731024, -0.7772898, -3.382068, 0, 1, 0.8509804, 1,
-0.09583274, -1.201199, -4.332681, 0, 1, 0.854902, 1,
-0.09485951, -1.245403, -2.966683, 0, 1, 0.8627451, 1,
-0.09244918, -0.189141, -3.18238, 0, 1, 0.8666667, 1,
-0.08913768, -0.6434295, -1.523614, 0, 1, 0.8745098, 1,
-0.08843032, 1.771092, -1.599769, 0, 1, 0.8784314, 1,
-0.0883555, 0.7027927, -1.27427, 0, 1, 0.8862745, 1,
-0.08678113, -0.3755184, -3.072427, 0, 1, 0.8901961, 1,
-0.08561879, 1.782219, 0.5907081, 0, 1, 0.8980392, 1,
-0.08464949, 3.50739, 0.1962486, 0, 1, 0.9058824, 1,
-0.08250058, -0.8327038, -2.465415, 0, 1, 0.9098039, 1,
-0.07862972, 0.1545502, -2.596333, 0, 1, 0.9176471, 1,
-0.07842625, -1.675836, -3.88693, 0, 1, 0.9215686, 1,
-0.0735691, 0.8004824, 0.02999162, 0, 1, 0.9294118, 1,
-0.07221231, -1.235465, -2.421658, 0, 1, 0.9333333, 1,
-0.06828785, 0.6235796, -1.33027, 0, 1, 0.9411765, 1,
-0.0638443, -2.074328, -2.430582, 0, 1, 0.945098, 1,
-0.0551901, -0.4916437, -3.501261, 0, 1, 0.9529412, 1,
-0.05268927, 0.1796277, 0.979912, 0, 1, 0.9568627, 1,
-0.0511591, 1.434856, -2.885023, 0, 1, 0.9647059, 1,
-0.05094189, 2.173599, -1.519947, 0, 1, 0.9686275, 1,
-0.05022907, -0.345299, -3.184386, 0, 1, 0.9764706, 1,
-0.0500065, 2.144295, 1.047293, 0, 1, 0.9803922, 1,
-0.04910598, 2.07881, -0.6322395, 0, 1, 0.9882353, 1,
-0.048074, -2.67626, -4.012729, 0, 1, 0.9921569, 1,
-0.04793001, 1.743145, 0.897584, 0, 1, 1, 1,
-0.04281928, 0.9809599, -0.5887607, 0, 0.9921569, 1, 1,
-0.04033774, -1.597834, -4.069062, 0, 0.9882353, 1, 1,
-0.03945046, -0.2484984, -1.49933, 0, 0.9803922, 1, 1,
-0.03941192, -2.145478, -3.339122, 0, 0.9764706, 1, 1,
-0.03852055, 2.298183, -0.1048265, 0, 0.9686275, 1, 1,
-0.03818494, -0.5667152, -3.857806, 0, 0.9647059, 1, 1,
-0.03711578, -0.6045482, -2.366838, 0, 0.9568627, 1, 1,
-0.03539431, 0.01091918, -0.5309912, 0, 0.9529412, 1, 1,
-0.02870093, 1.252677, -0.2958435, 0, 0.945098, 1, 1,
-0.02545598, -0.6282963, -2.806873, 0, 0.9411765, 1, 1,
-0.02384805, -1.060347, -2.923011, 0, 0.9333333, 1, 1,
-0.02281442, 1.038392, 0.2573767, 0, 0.9294118, 1, 1,
-0.020593, 0.03891246, -0.4408142, 0, 0.9215686, 1, 1,
-0.01961569, 0.05516461, -1.128401, 0, 0.9176471, 1, 1,
-0.01434966, 0.8021377, 0.5997065, 0, 0.9098039, 1, 1,
-0.006669305, 0.8625013, 0.01661418, 0, 0.9058824, 1, 1,
-0.005204941, 2.485277, -0.9035327, 0, 0.8980392, 1, 1,
-0.001041778, 0.1151054, -0.3520399, 0, 0.8901961, 1, 1,
0.004631749, 0.1763236, 0.5161115, 0, 0.8862745, 1, 1,
0.01565386, 0.6246008, -1.180952, 0, 0.8784314, 1, 1,
0.018583, 1.756941, -0.4160564, 0, 0.8745098, 1, 1,
0.0194147, 0.1209387, 1.294048, 0, 0.8666667, 1, 1,
0.02188284, 0.9370902, -0.5789237, 0, 0.8627451, 1, 1,
0.02712739, 0.3269367, -1.133321, 0, 0.854902, 1, 1,
0.0310121, 1.090057, -0.2098914, 0, 0.8509804, 1, 1,
0.0351103, -1.831958, 4.054379, 0, 0.8431373, 1, 1,
0.03560044, -0.6128535, 1.69319, 0, 0.8392157, 1, 1,
0.03750574, 0.3362705, -1.275707, 0, 0.8313726, 1, 1,
0.03950375, 0.5607692, -0.08498701, 0, 0.827451, 1, 1,
0.04233744, -0.2147762, 0.4593968, 0, 0.8196079, 1, 1,
0.04246093, 1.412275, 0.1111058, 0, 0.8156863, 1, 1,
0.0433551, 1.55797, 0.625828, 0, 0.8078431, 1, 1,
0.05502778, -0.3723422, 3.846128, 0, 0.8039216, 1, 1,
0.06191885, -0.8656663, 3.628981, 0, 0.7960784, 1, 1,
0.06411976, -1.232604, 2.916633, 0, 0.7882353, 1, 1,
0.06751418, -1.659152, 2.978154, 0, 0.7843137, 1, 1,
0.07196388, -0.4082709, 0.2308203, 0, 0.7764706, 1, 1,
0.07315147, 1.624266, -1.055372, 0, 0.772549, 1, 1,
0.07334682, 0.2447262, 1.680397, 0, 0.7647059, 1, 1,
0.07348122, 1.352852, 2.201192, 0, 0.7607843, 1, 1,
0.07595073, 0.7849475, 0.8126385, 0, 0.7529412, 1, 1,
0.07601343, -1.406714, 3.108372, 0, 0.7490196, 1, 1,
0.08108091, 1.185921, 1.193986, 0, 0.7411765, 1, 1,
0.08773986, -0.5084377, 3.527076, 0, 0.7372549, 1, 1,
0.0947701, 0.07347565, 0.9587012, 0, 0.7294118, 1, 1,
0.1006304, -0.2831251, 3.328841, 0, 0.7254902, 1, 1,
0.1013856, 0.6585152, 2.217664, 0, 0.7176471, 1, 1,
0.1023917, -0.5475131, 2.710104, 0, 0.7137255, 1, 1,
0.1071339, -1.287622, 2.519819, 0, 0.7058824, 1, 1,
0.1088735, 1.797397, 0.5743312, 0, 0.6980392, 1, 1,
0.1125661, 1.127319, -1.286258, 0, 0.6941177, 1, 1,
0.1127263, 0.874221, 0.04525423, 0, 0.6862745, 1, 1,
0.1155331, -1.292281, 2.772146, 0, 0.682353, 1, 1,
0.1169483, 0.6066268, -1.316456, 0, 0.6745098, 1, 1,
0.1172457, 0.02767961, 2.280461, 0, 0.6705883, 1, 1,
0.1191706, -0.05327786, 1.719966, 0, 0.6627451, 1, 1,
0.1209088, 0.3201098, 0.4635807, 0, 0.6588235, 1, 1,
0.1253168, 0.1692233, 1.367945, 0, 0.6509804, 1, 1,
0.1262248, 1.550697, 1.485509, 0, 0.6470588, 1, 1,
0.1288061, -0.2958642, 1.119696, 0, 0.6392157, 1, 1,
0.1298262, -1.879943, 1.892333, 0, 0.6352941, 1, 1,
0.1307362, -0.8387019, 1.49365, 0, 0.627451, 1, 1,
0.1307637, 0.9065362, 0.8743482, 0, 0.6235294, 1, 1,
0.1370351, 0.3269343, 0.3087668, 0, 0.6156863, 1, 1,
0.1414413, -0.6997241, 2.025416, 0, 0.6117647, 1, 1,
0.1429818, 0.3670511, 3.089988, 0, 0.6039216, 1, 1,
0.1441606, 0.3933644, -0.9987177, 0, 0.5960785, 1, 1,
0.1446403, -0.6099938, 3.115385, 0, 0.5921569, 1, 1,
0.1449596, -0.6865739, 4.731353, 0, 0.5843138, 1, 1,
0.1485773, -0.4177308, 2.848625, 0, 0.5803922, 1, 1,
0.1502193, 1.481225, -0.6435121, 0, 0.572549, 1, 1,
0.1507379, 0.5971014, 0.7737778, 0, 0.5686275, 1, 1,
0.1517722, -1.415774, 3.132004, 0, 0.5607843, 1, 1,
0.1540615, -0.602801, 2.516308, 0, 0.5568628, 1, 1,
0.1555224, 1.1492, 1.062333, 0, 0.5490196, 1, 1,
0.1558506, -0.7547371, 2.568884, 0, 0.5450981, 1, 1,
0.1568478, 0.9117752, -0.4648251, 0, 0.5372549, 1, 1,
0.159459, 0.7791065, 0.5454476, 0, 0.5333334, 1, 1,
0.1599087, -0.1093459, 0.1458068, 0, 0.5254902, 1, 1,
0.1666391, -0.3844136, 4.156404, 0, 0.5215687, 1, 1,
0.1669522, -0.4971038, 3.066722, 0, 0.5137255, 1, 1,
0.1675334, -0.2910007, 2.554261, 0, 0.509804, 1, 1,
0.1714685, -0.9099151, 3.7046, 0, 0.5019608, 1, 1,
0.1716515, 0.7248747, -1.060276, 0, 0.4941176, 1, 1,
0.1772104, -0.464544, 2.997195, 0, 0.4901961, 1, 1,
0.1828648, 0.005552065, 1.314808, 0, 0.4823529, 1, 1,
0.1861399, 1.145158, 0.1581306, 0, 0.4784314, 1, 1,
0.1870186, -0.9210802, 2.72867, 0, 0.4705882, 1, 1,
0.1903872, -0.03512739, 3.697052, 0, 0.4666667, 1, 1,
0.1926229, 0.4634301, 0.3805091, 0, 0.4588235, 1, 1,
0.1945058, -0.4691801, 2.959944, 0, 0.454902, 1, 1,
0.2006404, 0.7471164, 0.4756398, 0, 0.4470588, 1, 1,
0.2082345, 0.4124056, -0.6280096, 0, 0.4431373, 1, 1,
0.2099396, 0.7470329, -0.1589206, 0, 0.4352941, 1, 1,
0.2134141, 0.8299453, -1.315851, 0, 0.4313726, 1, 1,
0.2147592, 0.8844936, 0.5448937, 0, 0.4235294, 1, 1,
0.2160667, 1.09036, 1.656289, 0, 0.4196078, 1, 1,
0.2227067, 0.1128043, 1.631925, 0, 0.4117647, 1, 1,
0.2280868, -0.05732413, 1.669043, 0, 0.4078431, 1, 1,
0.2293727, -0.3342434, 1.1805, 0, 0.4, 1, 1,
0.2359848, -0.184013, 1.956861, 0, 0.3921569, 1, 1,
0.2418718, 1.649273, -1.43776, 0, 0.3882353, 1, 1,
0.2433659, 0.3873766, 0.3642162, 0, 0.3803922, 1, 1,
0.243674, 0.3933126, -0.2954341, 0, 0.3764706, 1, 1,
0.25021, -1.559791, 2.193809, 0, 0.3686275, 1, 1,
0.252478, 0.370516, 1.92148, 0, 0.3647059, 1, 1,
0.2559433, -0.9331368, 2.65085, 0, 0.3568628, 1, 1,
0.256641, -0.6346684, 2.694151, 0, 0.3529412, 1, 1,
0.2568378, -1.780105, 1.200273, 0, 0.345098, 1, 1,
0.2595483, 0.9030375, 0.1627042, 0, 0.3411765, 1, 1,
0.2612574, 0.5001013, 2.011978, 0, 0.3333333, 1, 1,
0.2619526, -0.7308926, 3.009691, 0, 0.3294118, 1, 1,
0.2652301, 1.664276, 1.157657, 0, 0.3215686, 1, 1,
0.2675515, 3.163827, -0.3690965, 0, 0.3176471, 1, 1,
0.2741976, 0.5735265, 0.3443426, 0, 0.3098039, 1, 1,
0.2743538, -0.05360296, 3.167646, 0, 0.3058824, 1, 1,
0.2745558, 1.041342, 0.2801733, 0, 0.2980392, 1, 1,
0.2799794, 0.2599202, 1.325267, 0, 0.2901961, 1, 1,
0.2802715, -0.05832787, 1.778143, 0, 0.2862745, 1, 1,
0.2810459, -0.2826596, 0.1383549, 0, 0.2784314, 1, 1,
0.282007, 0.2272061, 0.1405552, 0, 0.2745098, 1, 1,
0.2832958, -0.2871687, 2.004962, 0, 0.2666667, 1, 1,
0.2847238, 0.1522046, -1.94639, 0, 0.2627451, 1, 1,
0.2857488, -0.9766643, 2.39994, 0, 0.254902, 1, 1,
0.2857876, 0.920448, 2.302431, 0, 0.2509804, 1, 1,
0.2888806, -0.8838191, 3.650382, 0, 0.2431373, 1, 1,
0.2896406, 1.305763, -0.09439047, 0, 0.2392157, 1, 1,
0.2995452, -1.707418, 3.353458, 0, 0.2313726, 1, 1,
0.3011804, -1.919986, 2.358209, 0, 0.227451, 1, 1,
0.3030883, 0.891983, -0.461609, 0, 0.2196078, 1, 1,
0.3109103, 1.081077, 0.4829707, 0, 0.2156863, 1, 1,
0.3187995, -0.04862414, 0.8132353, 0, 0.2078431, 1, 1,
0.3198489, -0.7508112, 4.536627, 0, 0.2039216, 1, 1,
0.3217992, -0.6692138, 4.090443, 0, 0.1960784, 1, 1,
0.3410553, -0.6189612, 3.796908, 0, 0.1882353, 1, 1,
0.3442346, -0.1029806, 3.225912, 0, 0.1843137, 1, 1,
0.3504476, 0.2260657, 2.101915, 0, 0.1764706, 1, 1,
0.3524618, 0.2885566, 1.527085, 0, 0.172549, 1, 1,
0.3546405, -0.0711437, -0.1478994, 0, 0.1647059, 1, 1,
0.35843, 0.2219016, 1.125144, 0, 0.1607843, 1, 1,
0.3759376, -0.3542535, 3.77735, 0, 0.1529412, 1, 1,
0.3811729, -1.237675, 3.249287, 0, 0.1490196, 1, 1,
0.3860424, 0.6866484, 0.02003363, 0, 0.1411765, 1, 1,
0.3915601, -1.009179, 2.150869, 0, 0.1372549, 1, 1,
0.394166, -0.2855936, 1.384908, 0, 0.1294118, 1, 1,
0.3956552, -1.359287, 2.961766, 0, 0.1254902, 1, 1,
0.3959353, -0.7947006, 4.120712, 0, 0.1176471, 1, 1,
0.4053169, -0.4787062, 1.141687, 0, 0.1137255, 1, 1,
0.4091546, -0.603594, 2.88732, 0, 0.1058824, 1, 1,
0.409883, 0.9643382, 0.4534918, 0, 0.09803922, 1, 1,
0.4137861, -0.3348438, 4.075315, 0, 0.09411765, 1, 1,
0.4179535, -2.058041, 3.65903, 0, 0.08627451, 1, 1,
0.4181201, -1.418572, 3.246672, 0, 0.08235294, 1, 1,
0.4186063, -1.814198, 2.34744, 0, 0.07450981, 1, 1,
0.4201306, 0.2401596, 2.364069, 0, 0.07058824, 1, 1,
0.4260562, 0.5131938, -0.4366221, 0, 0.0627451, 1, 1,
0.4281247, -1.63469, 1.648457, 0, 0.05882353, 1, 1,
0.4329616, -1.148725, 3.464807, 0, 0.05098039, 1, 1,
0.4357879, 0.2992955, 0.03727893, 0, 0.04705882, 1, 1,
0.4398556, -1.114317, 3.091859, 0, 0.03921569, 1, 1,
0.4416842, -0.8050932, 1.531853, 0, 0.03529412, 1, 1,
0.444875, 2.127708, 0.1963227, 0, 0.02745098, 1, 1,
0.4482978, 0.2632469, 2.899632, 0, 0.02352941, 1, 1,
0.4518458, 0.5086514, -0.1655114, 0, 0.01568628, 1, 1,
0.4534959, 0.6687135, 1.105687, 0, 0.01176471, 1, 1,
0.4559516, 1.342809, 0.477851, 0, 0.003921569, 1, 1,
0.4568392, -0.598323, 2.456245, 0.003921569, 0, 1, 1,
0.4574543, -0.576992, 0.4361924, 0.007843138, 0, 1, 1,
0.4596133, 0.1593975, 0.1192083, 0.01568628, 0, 1, 1,
0.4637913, 0.01034583, 0.9729543, 0.01960784, 0, 1, 1,
0.4646223, -1.119316, 1.571998, 0.02745098, 0, 1, 1,
0.4660455, -0.7473443, 1.34488, 0.03137255, 0, 1, 1,
0.4680269, 2.163917, 0.1151095, 0.03921569, 0, 1, 1,
0.4682323, -0.05840305, 3.25814, 0.04313726, 0, 1, 1,
0.4712195, -0.3202335, 3.44942, 0.05098039, 0, 1, 1,
0.4765304, 1.032205, 0.3817935, 0.05490196, 0, 1, 1,
0.476705, 0.7632501, -0.08741771, 0.0627451, 0, 1, 1,
0.4807821, 0.7892175, -1.638029, 0.06666667, 0, 1, 1,
0.4858883, -0.7168745, 0.9595637, 0.07450981, 0, 1, 1,
0.4934499, 1.321968, 0.05842979, 0.07843138, 0, 1, 1,
0.4946188, -0.4010684, 2.577036, 0.08627451, 0, 1, 1,
0.5137237, 0.09593304, -0.6300468, 0.09019608, 0, 1, 1,
0.5153592, -0.8982848, 0.3453879, 0.09803922, 0, 1, 1,
0.5434532, 0.07877539, -0.5865092, 0.1058824, 0, 1, 1,
0.5437147, 0.2531757, 1.802133, 0.1098039, 0, 1, 1,
0.5500349, -1.521161, 2.530518, 0.1176471, 0, 1, 1,
0.5507452, -0.2337223, 1.345377, 0.1215686, 0, 1, 1,
0.5537148, -1.11938, 3.754346, 0.1294118, 0, 1, 1,
0.5568932, -0.05636745, 0.8927535, 0.1333333, 0, 1, 1,
0.5636321, -1.002656, 3.23386, 0.1411765, 0, 1, 1,
0.566631, -1.32063, 3.572388, 0.145098, 0, 1, 1,
0.5685449, 0.9061515, -1.617597, 0.1529412, 0, 1, 1,
0.5708178, -1.968207, 3.154262, 0.1568628, 0, 1, 1,
0.5723234, -0.3648779, 1.3913, 0.1647059, 0, 1, 1,
0.5769839, 1.164599, -0.1832513, 0.1686275, 0, 1, 1,
0.5798844, 0.1183877, -0.8921015, 0.1764706, 0, 1, 1,
0.5823649, 0.8362619, 0.5557265, 0.1803922, 0, 1, 1,
0.5876015, 0.9090539, 0.497244, 0.1882353, 0, 1, 1,
0.5877328, -1.531002, 3.734799, 0.1921569, 0, 1, 1,
0.589355, 0.6278684, -0.007882242, 0.2, 0, 1, 1,
0.5905522, 1.443011, -0.3505749, 0.2078431, 0, 1, 1,
0.5921589, -1.840016, 3.739762, 0.2117647, 0, 1, 1,
0.5923271, -1.129497, 1.646128, 0.2196078, 0, 1, 1,
0.5924883, -1.175604, 4.40579, 0.2235294, 0, 1, 1,
0.5928743, -0.5636203, 1.480036, 0.2313726, 0, 1, 1,
0.5953376, -0.5457325, 3.069333, 0.2352941, 0, 1, 1,
0.5970859, -0.551605, 3.25008, 0.2431373, 0, 1, 1,
0.5981319, -0.7479703, 0.3891842, 0.2470588, 0, 1, 1,
0.6022087, -0.4462243, 2.175104, 0.254902, 0, 1, 1,
0.6044427, -0.6962683, 2.015333, 0.2588235, 0, 1, 1,
0.607726, -1.73176, 1.707848, 0.2666667, 0, 1, 1,
0.6208583, -1.056839, 2.664453, 0.2705882, 0, 1, 1,
0.6210957, 0.5653905, -0.6747898, 0.2784314, 0, 1, 1,
0.6230418, 1.792336, -0.4069759, 0.282353, 0, 1, 1,
0.6238639, -0.007823571, 2.171615, 0.2901961, 0, 1, 1,
0.6296523, -1.023529, 3.258969, 0.2941177, 0, 1, 1,
0.630815, 1.610569, 0.6788321, 0.3019608, 0, 1, 1,
0.6312565, 0.4434728, 1.15126, 0.3098039, 0, 1, 1,
0.6326501, -0.02144657, 0.838446, 0.3137255, 0, 1, 1,
0.6385845, 0.1717225, 2.242411, 0.3215686, 0, 1, 1,
0.6471226, 0.4199858, 0.1761447, 0.3254902, 0, 1, 1,
0.6524766, 0.8219134, -0.3308284, 0.3333333, 0, 1, 1,
0.655888, 0.3085507, 0.5648738, 0.3372549, 0, 1, 1,
0.6602206, -0.6205962, 1.017892, 0.345098, 0, 1, 1,
0.6653646, -0.5816448, 1.347193, 0.3490196, 0, 1, 1,
0.6690112, -1.391059, 2.462489, 0.3568628, 0, 1, 1,
0.6706641, -1.341317, 1.782431, 0.3607843, 0, 1, 1,
0.6708423, -0.62324, 2.947387, 0.3686275, 0, 1, 1,
0.6756476, 0.9313577, 0.6506946, 0.372549, 0, 1, 1,
0.676738, -1.706544, 2.5799, 0.3803922, 0, 1, 1,
0.6777812, -0.141542, 2.15455, 0.3843137, 0, 1, 1,
0.6791294, -1.297022, 1.049515, 0.3921569, 0, 1, 1,
0.6811469, -0.6677336, 1.058711, 0.3960784, 0, 1, 1,
0.683202, -0.132732, 2.194482, 0.4039216, 0, 1, 1,
0.6865526, -1.510083, 2.620891, 0.4117647, 0, 1, 1,
0.6884282, 0.03023682, 1.904572, 0.4156863, 0, 1, 1,
0.6894999, 0.5092834, 1.211182, 0.4235294, 0, 1, 1,
0.6939465, -0.186814, 1.484502, 0.427451, 0, 1, 1,
0.7057893, 0.2395998, 1.041196, 0.4352941, 0, 1, 1,
0.7075399, -2.479526, 3.63803, 0.4392157, 0, 1, 1,
0.7083072, -1.47234, 3.01691, 0.4470588, 0, 1, 1,
0.7103844, -1.270193, 2.577949, 0.4509804, 0, 1, 1,
0.7122409, -0.1869654, 0.4449135, 0.4588235, 0, 1, 1,
0.7126151, -0.8942893, 3.72404, 0.4627451, 0, 1, 1,
0.7139427, -1.008972, 3.016668, 0.4705882, 0, 1, 1,
0.7180368, 0.03804776, 1.167858, 0.4745098, 0, 1, 1,
0.7189141, -0.1683671, 2.399661, 0.4823529, 0, 1, 1,
0.7221982, -0.140098, 0.7976806, 0.4862745, 0, 1, 1,
0.7255603, -0.5253765, 0.8511811, 0.4941176, 0, 1, 1,
0.7283273, -0.941097, 3.607547, 0.5019608, 0, 1, 1,
0.7368392, -1.341829, 0.6254846, 0.5058824, 0, 1, 1,
0.7404858, 1.009627, 0.2262929, 0.5137255, 0, 1, 1,
0.7416816, 0.6846334, -1.707791, 0.5176471, 0, 1, 1,
0.7420491, -0.7368624, 2.92664, 0.5254902, 0, 1, 1,
0.7441519, -0.7751951, 2.92955, 0.5294118, 0, 1, 1,
0.7454696, 0.06805383, 0.213547, 0.5372549, 0, 1, 1,
0.7455858, 0.7003187, 0.8506745, 0.5411765, 0, 1, 1,
0.7476568, 0.01920664, 0.6951361, 0.5490196, 0, 1, 1,
0.7498719, -0.4217299, 3.360047, 0.5529412, 0, 1, 1,
0.7540128, -0.07233796, 2.589211, 0.5607843, 0, 1, 1,
0.7548259, -0.8207719, 1.412941, 0.5647059, 0, 1, 1,
0.7550442, -1.114268, 3.188812, 0.572549, 0, 1, 1,
0.75798, 1.632414, 0.8074271, 0.5764706, 0, 1, 1,
0.7693089, -0.002392691, 1.530056, 0.5843138, 0, 1, 1,
0.7696182, -0.808096, 3.467108, 0.5882353, 0, 1, 1,
0.7719468, -0.6146089, 5.508749, 0.5960785, 0, 1, 1,
0.7737527, 0.7410732, 1.590923, 0.6039216, 0, 1, 1,
0.7770084, 0.7088452, -0.07263437, 0.6078432, 0, 1, 1,
0.7773258, -2.805821, 2.981754, 0.6156863, 0, 1, 1,
0.7835002, 1.987101, 0.03369509, 0.6196079, 0, 1, 1,
0.7860597, 0.6405004, 1.75714, 0.627451, 0, 1, 1,
0.7906165, -0.08779655, 3.02204, 0.6313726, 0, 1, 1,
0.7973657, -0.2831207, 1.761777, 0.6392157, 0, 1, 1,
0.797846, -0.36893, 0.527638, 0.6431373, 0, 1, 1,
0.8017089, 1.350373, -0.3887998, 0.6509804, 0, 1, 1,
0.8023866, 0.4172013, 1.829988, 0.654902, 0, 1, 1,
0.8038971, -0.5837387, 0.9972652, 0.6627451, 0, 1, 1,
0.8102908, 0.3747716, 0.9996061, 0.6666667, 0, 1, 1,
0.8116801, 0.7854231, -0.8957278, 0.6745098, 0, 1, 1,
0.8137498, -0.6198077, 1.84115, 0.6784314, 0, 1, 1,
0.8156484, -0.7674764, 3.598848, 0.6862745, 0, 1, 1,
0.820776, 1.767592, 1.624294, 0.6901961, 0, 1, 1,
0.822064, 1.63398, 1.289468, 0.6980392, 0, 1, 1,
0.8298012, 0.2029268, 1.845735, 0.7058824, 0, 1, 1,
0.8310076, 1.212211, 0.04691798, 0.7098039, 0, 1, 1,
0.8323451, -0.5141528, 1.705442, 0.7176471, 0, 1, 1,
0.8339952, -2.860152, 4.491317, 0.7215686, 0, 1, 1,
0.8500303, -0.1123566, 2.401971, 0.7294118, 0, 1, 1,
0.8502079, 1.534827, 1.453273, 0.7333333, 0, 1, 1,
0.8502967, -2.007195, 2.375102, 0.7411765, 0, 1, 1,
0.8569283, 0.3703103, 1.701433, 0.7450981, 0, 1, 1,
0.8577755, 0.7980828, -0.9844904, 0.7529412, 0, 1, 1,
0.8663931, -1.193725, 1.826957, 0.7568628, 0, 1, 1,
0.8686141, -0.8268524, 4.62243, 0.7647059, 0, 1, 1,
0.8777685, 1.627485, 0.2929745, 0.7686275, 0, 1, 1,
0.8784403, 0.2464464, -0.04803789, 0.7764706, 0, 1, 1,
0.8818069, 2.014014, 1.815034, 0.7803922, 0, 1, 1,
0.8885139, -1.312734, 2.234434, 0.7882353, 0, 1, 1,
0.8940612, 0.6776307, 1.611088, 0.7921569, 0, 1, 1,
0.8972269, -0.04060145, 0.6976854, 0.8, 0, 1, 1,
0.9086624, 0.7285017, 1.169737, 0.8078431, 0, 1, 1,
0.9088964, 0.2110745, 1.432882, 0.8117647, 0, 1, 1,
0.9091921, -0.6432607, 2.102911, 0.8196079, 0, 1, 1,
0.9096761, -0.01786376, 2.700461, 0.8235294, 0, 1, 1,
0.9271435, -1.538652, 2.430719, 0.8313726, 0, 1, 1,
0.9290137, 1.766045, 1.474929, 0.8352941, 0, 1, 1,
0.9350857, 0.3294709, 1.456855, 0.8431373, 0, 1, 1,
0.9371021, 0.04250281, 0.5707275, 0.8470588, 0, 1, 1,
0.9420035, -0.3535452, 2.066469, 0.854902, 0, 1, 1,
0.9453141, 0.2713315, 2.044672, 0.8588235, 0, 1, 1,
0.9484261, 0.3879189, 0.9887995, 0.8666667, 0, 1, 1,
0.9501352, -2.625329, 2.901016, 0.8705882, 0, 1, 1,
0.9505131, 0.01465465, 1.284544, 0.8784314, 0, 1, 1,
0.9644474, 1.147625, 1.175908, 0.8823529, 0, 1, 1,
0.9715788, -1.456686, 1.283493, 0.8901961, 0, 1, 1,
0.9722581, -0.5142553, 3.448814, 0.8941177, 0, 1, 1,
0.9738437, -1.183367, -0.5016291, 0.9019608, 0, 1, 1,
0.9753035, -0.5092615, 0.7856167, 0.9098039, 0, 1, 1,
0.9787723, 1.452256, 1.268113, 0.9137255, 0, 1, 1,
0.9832286, 0.7930583, 0.8680393, 0.9215686, 0, 1, 1,
0.9867761, -0.718349, 2.546489, 0.9254902, 0, 1, 1,
0.9936365, 1.973928, 0.408714, 0.9333333, 0, 1, 1,
1.004851, -0.8778169, 0.1472933, 0.9372549, 0, 1, 1,
1.015667, -0.7658162, 2.214607, 0.945098, 0, 1, 1,
1.019396, 1.368759, 0.1085143, 0.9490196, 0, 1, 1,
1.023439, -2.255836, 5.695313, 0.9568627, 0, 1, 1,
1.023621, 0.07178889, 1.133226, 0.9607843, 0, 1, 1,
1.028249, -0.2835394, 1.877463, 0.9686275, 0, 1, 1,
1.028992, 1.559253, -0.2674319, 0.972549, 0, 1, 1,
1.030358, 0.4140519, 0.5646479, 0.9803922, 0, 1, 1,
1.031778, -0.2881422, 0.9710553, 0.9843137, 0, 1, 1,
1.033273, 1.84449, 1.071411, 0.9921569, 0, 1, 1,
1.035785, -0.934648, 1.489668, 0.9960784, 0, 1, 1,
1.035964, 0.6381642, 1.815077, 1, 0, 0.9960784, 1,
1.044293, -0.7118257, 2.269218, 1, 0, 0.9882353, 1,
1.044913, 2.102757, 2.252828, 1, 0, 0.9843137, 1,
1.047445, 0.3204925, 1.673776, 1, 0, 0.9764706, 1,
1.063985, -1.163597, 5.547108, 1, 0, 0.972549, 1,
1.067123, 0.4198478, 1.83036, 1, 0, 0.9647059, 1,
1.067285, 0.8501394, 1.3898, 1, 0, 0.9607843, 1,
1.070798, 0.006553808, 3.531123, 1, 0, 0.9529412, 1,
1.071428, 0.08238208, 0.9782999, 1, 0, 0.9490196, 1,
1.078513, -1.110046, 1.473518, 1, 0, 0.9411765, 1,
1.082221, -0.1501641, 1.654216, 1, 0, 0.9372549, 1,
1.082908, -1.477772, 2.739868, 1, 0, 0.9294118, 1,
1.085806, 0.1127099, 1.011104, 1, 0, 0.9254902, 1,
1.086383, 0.422163, 1.32245, 1, 0, 0.9176471, 1,
1.091226, 0.352779, 1.912684, 1, 0, 0.9137255, 1,
1.093601, 0.1602958, -0.4372654, 1, 0, 0.9058824, 1,
1.099526, -1.082138, 3.124566, 1, 0, 0.9019608, 1,
1.105776, 0.305995, 0.5216625, 1, 0, 0.8941177, 1,
1.106691, 1.704388, 2.251111, 1, 0, 0.8862745, 1,
1.107793, 0.04512043, 2.402029, 1, 0, 0.8823529, 1,
1.108991, 0.6257048, 0.7962309, 1, 0, 0.8745098, 1,
1.109452, -0.4533926, 0.8469168, 1, 0, 0.8705882, 1,
1.111006, 0.7257318, 3.026711, 1, 0, 0.8627451, 1,
1.111576, -0.189203, 2.392168, 1, 0, 0.8588235, 1,
1.121024, -0.9593174, 1.592931, 1, 0, 0.8509804, 1,
1.127914, -0.4223545, 0.7300481, 1, 0, 0.8470588, 1,
1.128124, 0.7773008, 2.00371, 1, 0, 0.8392157, 1,
1.129817, 1.424802, 0.1375124, 1, 0, 0.8352941, 1,
1.132165, 0.01579318, -0.3058482, 1, 0, 0.827451, 1,
1.134748, 0.7879444, 2.324992, 1, 0, 0.8235294, 1,
1.135871, 0.708123, 0.7366152, 1, 0, 0.8156863, 1,
1.138417, -1.096621, 1.777633, 1, 0, 0.8117647, 1,
1.147626, 0.9146513, 0.6897534, 1, 0, 0.8039216, 1,
1.152571, 0.4190352, 2.259416, 1, 0, 0.7960784, 1,
1.163971, 1.079064, -0.9339885, 1, 0, 0.7921569, 1,
1.166601, 0.7546215, 2.304064, 1, 0, 0.7843137, 1,
1.166783, -0.3515995, 0.9026706, 1, 0, 0.7803922, 1,
1.167787, 0.2781991, 0.1814323, 1, 0, 0.772549, 1,
1.173235, 0.5689877, 2.788013, 1, 0, 0.7686275, 1,
1.173443, 0.6869986, 1.641852, 1, 0, 0.7607843, 1,
1.197399, -0.9556523, 3.662677, 1, 0, 0.7568628, 1,
1.198637, 0.1981729, 2.707232, 1, 0, 0.7490196, 1,
1.204505, -0.9383436, 3.576906, 1, 0, 0.7450981, 1,
1.20498, 0.3615385, -0.7433149, 1, 0, 0.7372549, 1,
1.206641, -0.09693645, -0.3454209, 1, 0, 0.7333333, 1,
1.210546, -0.4450362, 0.5354801, 1, 0, 0.7254902, 1,
1.216743, 0.3084035, -0.3176965, 1, 0, 0.7215686, 1,
1.224208, -0.6808597, 1.649256, 1, 0, 0.7137255, 1,
1.235469, 1.112162, 2.477865, 1, 0, 0.7098039, 1,
1.238713, -0.3061217, 3.433244, 1, 0, 0.7019608, 1,
1.240541, -0.5039847, 1.614203, 1, 0, 0.6941177, 1,
1.248201, 0.5634186, 1.704073, 1, 0, 0.6901961, 1,
1.265092, -0.8319761, 1.07976, 1, 0, 0.682353, 1,
1.267462, 1.000565, 0.6020833, 1, 0, 0.6784314, 1,
1.26843, -0.9301943, 3.776563, 1, 0, 0.6705883, 1,
1.273683, -0.6938041, 1.515887, 1, 0, 0.6666667, 1,
1.273751, 1.25061, 1.293088, 1, 0, 0.6588235, 1,
1.280782, -1.302202, 3.626939, 1, 0, 0.654902, 1,
1.284488, 0.2138394, 1.778871, 1, 0, 0.6470588, 1,
1.290555, 0.974211, 1.158948, 1, 0, 0.6431373, 1,
1.310313, 0.9358964, 1.136676, 1, 0, 0.6352941, 1,
1.312689, 1.018639, 2.520159, 1, 0, 0.6313726, 1,
1.317592, 0.7852353, 0.1723572, 1, 0, 0.6235294, 1,
1.323883, -0.1475773, 1.519656, 1, 0, 0.6196079, 1,
1.326537, 0.1228947, 1.877484, 1, 0, 0.6117647, 1,
1.329661, 0.1588467, 2.435603, 1, 0, 0.6078432, 1,
1.330895, -0.4102744, 2.027574, 1, 0, 0.6, 1,
1.33692, 0.3529052, 0.8137866, 1, 0, 0.5921569, 1,
1.346976, 0.924, -0.2385301, 1, 0, 0.5882353, 1,
1.355762, -0.2113385, 1.543888, 1, 0, 0.5803922, 1,
1.356085, 0.3295064, 1.604269, 1, 0, 0.5764706, 1,
1.358314, -0.9032045, 0.9090691, 1, 0, 0.5686275, 1,
1.362609, 0.02724027, 3.619503, 1, 0, 0.5647059, 1,
1.371721, 0.07066955, 0.5983913, 1, 0, 0.5568628, 1,
1.37262, 1.153657, 1.496865, 1, 0, 0.5529412, 1,
1.37465, 0.8930959, 1.820123, 1, 0, 0.5450981, 1,
1.383858, -1.546673, 3.659538, 1, 0, 0.5411765, 1,
1.387293, 0.9303505, 0.8619769, 1, 0, 0.5333334, 1,
1.416918, 0.6101368, 2.215423, 1, 0, 0.5294118, 1,
1.423502, -0.1741167, 2.212694, 1, 0, 0.5215687, 1,
1.424677, -0.3824124, 0.369022, 1, 0, 0.5176471, 1,
1.428274, 0.7099198, 1.034318, 1, 0, 0.509804, 1,
1.435172, 0.1462544, 3.273382, 1, 0, 0.5058824, 1,
1.446018, -0.69788, 2.062207, 1, 0, 0.4980392, 1,
1.459267, -0.2256647, 2.695569, 1, 0, 0.4901961, 1,
1.460837, 0.3664117, 2.427374, 1, 0, 0.4862745, 1,
1.490118, 0.2146025, 3.382569, 1, 0, 0.4784314, 1,
1.491216, 1.019993, 0.3449279, 1, 0, 0.4745098, 1,
1.500161, 0.06744877, 1.626047, 1, 0, 0.4666667, 1,
1.50211, 0.8039467, 1.395447, 1, 0, 0.4627451, 1,
1.511745, -0.5762025, 1.087681, 1, 0, 0.454902, 1,
1.537989, -0.7018422, 1.737194, 1, 0, 0.4509804, 1,
1.556255, 0.1816543, -0.252562, 1, 0, 0.4431373, 1,
1.563411, 0.3530067, 1.986733, 1, 0, 0.4392157, 1,
1.564037, 0.02326111, 0.9095709, 1, 0, 0.4313726, 1,
1.566195, -1.536048, 4.913058, 1, 0, 0.427451, 1,
1.566662, -0.2812391, -0.176093, 1, 0, 0.4196078, 1,
1.57199, -0.05768325, 1.401491, 1, 0, 0.4156863, 1,
1.574173, -0.3824158, 1.236348, 1, 0, 0.4078431, 1,
1.574637, -0.0725066, 2.420425, 1, 0, 0.4039216, 1,
1.582714, -0.3255317, 3.520866, 1, 0, 0.3960784, 1,
1.587499, -0.4378897, -0.3221645, 1, 0, 0.3882353, 1,
1.594961, -0.1521761, 0.878823, 1, 0, 0.3843137, 1,
1.595796, 0.9972508, 1.595244, 1, 0, 0.3764706, 1,
1.603409, -0.4050823, 2.126012, 1, 0, 0.372549, 1,
1.616177, 2.143638, 1.346048, 1, 0, 0.3647059, 1,
1.622931, -1.059774, 0.3215244, 1, 0, 0.3607843, 1,
1.625802, 0.7558751, 1.160579, 1, 0, 0.3529412, 1,
1.62692, -1.308272, 3.463653, 1, 0, 0.3490196, 1,
1.629556, -0.3962788, 2.679759, 1, 0, 0.3411765, 1,
1.663891, -1.416224, 1.718967, 1, 0, 0.3372549, 1,
1.676204, 0.1050985, 0.324401, 1, 0, 0.3294118, 1,
1.689731, -0.7917752, 3.454857, 1, 0, 0.3254902, 1,
1.704387, -0.1283287, 2.240323, 1, 0, 0.3176471, 1,
1.715637, 0.95289, -0.009771347, 1, 0, 0.3137255, 1,
1.717842, 0.1030836, 0.5382909, 1, 0, 0.3058824, 1,
1.722088, -0.1176087, 1.856439, 1, 0, 0.2980392, 1,
1.733681, -0.3124336, 1.677441, 1, 0, 0.2941177, 1,
1.73604, 0.6725368, 1.412245, 1, 0, 0.2862745, 1,
1.749636, -0.3217904, 1.799333, 1, 0, 0.282353, 1,
1.7574, 1.339369, 0.5655184, 1, 0, 0.2745098, 1,
1.768513, -0.8203008, 2.833594, 1, 0, 0.2705882, 1,
1.769031, -0.4764142, 1.761288, 1, 0, 0.2627451, 1,
1.785967, -0.9129204, 2.925343, 1, 0, 0.2588235, 1,
1.807142, 1.418294, 0.4004839, 1, 0, 0.2509804, 1,
1.815474, 0.6547652, 2.29471, 1, 0, 0.2470588, 1,
1.830709, -0.7492964, 2.200417, 1, 0, 0.2392157, 1,
1.836195, 0.4358555, 1.826022, 1, 0, 0.2352941, 1,
1.843532, 0.9712817, 2.596715, 1, 0, 0.227451, 1,
1.863943, -0.2850545, 1.51064, 1, 0, 0.2235294, 1,
1.865155, 0.4950731, 1.169969, 1, 0, 0.2156863, 1,
1.878028, -0.7629988, 2.092922, 1, 0, 0.2117647, 1,
1.894709, 0.7481881, -0.4238798, 1, 0, 0.2039216, 1,
1.896082, 1.669939, 0.7813026, 1, 0, 0.1960784, 1,
1.898992, 1.024376, 1.952849, 1, 0, 0.1921569, 1,
1.912791, -0.2953704, 1.182702, 1, 0, 0.1843137, 1,
1.925458, -0.06445812, 1.004765, 1, 0, 0.1803922, 1,
1.92843, 0.36206, 2.131836, 1, 0, 0.172549, 1,
1.928684, -1.325783, 1.000091, 1, 0, 0.1686275, 1,
1.929795, 1.775702, 0.6483743, 1, 0, 0.1607843, 1,
1.933235, -0.4748223, 1.215434, 1, 0, 0.1568628, 1,
1.937909, 0.3894525, 0.8046649, 1, 0, 0.1490196, 1,
1.939941, 0.01050966, 0.5166798, 1, 0, 0.145098, 1,
1.944839, -0.3945202, 2.777667, 1, 0, 0.1372549, 1,
1.962998, -1.084805, 2.761154, 1, 0, 0.1333333, 1,
1.973488, -0.2854427, 1.698129, 1, 0, 0.1254902, 1,
2.002084, 1.449643, 0.2126634, 1, 0, 0.1215686, 1,
2.047519, -0.7299062, 1.723008, 1, 0, 0.1137255, 1,
2.061628, -1.611749, 2.385399, 1, 0, 0.1098039, 1,
2.067681, -0.3967962, 1.312057, 1, 0, 0.1019608, 1,
2.068305, -0.1116738, 1.471086, 1, 0, 0.09411765, 1,
2.122246, -0.2629628, 3.231768, 1, 0, 0.09019608, 1,
2.126429, -1.038914, 2.515596, 1, 0, 0.08235294, 1,
2.130769, 0.4205526, 0.2420023, 1, 0, 0.07843138, 1,
2.140718, -1.114614, 2.604031, 1, 0, 0.07058824, 1,
2.142402, 1.804757, 0.888198, 1, 0, 0.06666667, 1,
2.147083, -0.01709484, 1.217759, 1, 0, 0.05882353, 1,
2.183075, 0.7037447, 2.29613, 1, 0, 0.05490196, 1,
2.214271, 0.1426359, 1.158844, 1, 0, 0.04705882, 1,
2.293602, -0.5158443, 1.399023, 1, 0, 0.04313726, 1,
2.379772, 0.5475809, 0.1466024, 1, 0, 0.03529412, 1,
2.560615, -0.8469805, 2.782406, 1, 0, 0.03137255, 1,
2.575465, 0.8201329, -0.3156323, 1, 0, 0.02352941, 1,
2.592579, -0.7914972, 2.290918, 1, 0, 0.01960784, 1,
2.891808, 0.6183525, 1.14905, 1, 0, 0.01176471, 1,
3.061906, 0.3728726, 1.47476, 1, 0, 0.007843138, 1
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
-0.1865698, -3.939451, -6.604249, 0, -0.5, 0.5, 0.5,
-0.1865698, -3.939451, -6.604249, 1, -0.5, 0.5, 0.5,
-0.1865698, -3.939451, -6.604249, 1, 1.5, 0.5, 0.5,
-0.1865698, -3.939451, -6.604249, 0, 1.5, 0.5, 0.5
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
-4.536279, 0.3236191, -6.604249, 0, -0.5, 0.5, 0.5,
-4.536279, 0.3236191, -6.604249, 1, -0.5, 0.5, 0.5,
-4.536279, 0.3236191, -6.604249, 1, 1.5, 0.5, 0.5,
-4.536279, 0.3236191, -6.604249, 0, 1.5, 0.5, 0.5
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
-4.536279, -3.939451, 0.4368424, 0, -0.5, 0.5, 0.5,
-4.536279, -3.939451, 0.4368424, 1, -0.5, 0.5, 0.5,
-4.536279, -3.939451, 0.4368424, 1, 1.5, 0.5, 0.5,
-4.536279, -3.939451, 0.4368424, 0, 1.5, 0.5, 0.5
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
-3, -2.955665, -4.979382,
3, -2.955665, -4.979382,
-3, -2.955665, -4.979382,
-3, -3.11963, -5.250194,
-2, -2.955665, -4.979382,
-2, -3.11963, -5.250194,
-1, -2.955665, -4.979382,
-1, -3.11963, -5.250194,
0, -2.955665, -4.979382,
0, -3.11963, -5.250194,
1, -2.955665, -4.979382,
1, -3.11963, -5.250194,
2, -2.955665, -4.979382,
2, -3.11963, -5.250194,
3, -2.955665, -4.979382,
3, -3.11963, -5.250194
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
-3, -3.447558, -5.791816, 0, -0.5, 0.5, 0.5,
-3, -3.447558, -5.791816, 1, -0.5, 0.5, 0.5,
-3, -3.447558, -5.791816, 1, 1.5, 0.5, 0.5,
-3, -3.447558, -5.791816, 0, 1.5, 0.5, 0.5,
-2, -3.447558, -5.791816, 0, -0.5, 0.5, 0.5,
-2, -3.447558, -5.791816, 1, -0.5, 0.5, 0.5,
-2, -3.447558, -5.791816, 1, 1.5, 0.5, 0.5,
-2, -3.447558, -5.791816, 0, 1.5, 0.5, 0.5,
-1, -3.447558, -5.791816, 0, -0.5, 0.5, 0.5,
-1, -3.447558, -5.791816, 1, -0.5, 0.5, 0.5,
-1, -3.447558, -5.791816, 1, 1.5, 0.5, 0.5,
-1, -3.447558, -5.791816, 0, 1.5, 0.5, 0.5,
0, -3.447558, -5.791816, 0, -0.5, 0.5, 0.5,
0, -3.447558, -5.791816, 1, -0.5, 0.5, 0.5,
0, -3.447558, -5.791816, 1, 1.5, 0.5, 0.5,
0, -3.447558, -5.791816, 0, 1.5, 0.5, 0.5,
1, -3.447558, -5.791816, 0, -0.5, 0.5, 0.5,
1, -3.447558, -5.791816, 1, -0.5, 0.5, 0.5,
1, -3.447558, -5.791816, 1, 1.5, 0.5, 0.5,
1, -3.447558, -5.791816, 0, 1.5, 0.5, 0.5,
2, -3.447558, -5.791816, 0, -0.5, 0.5, 0.5,
2, -3.447558, -5.791816, 1, -0.5, 0.5, 0.5,
2, -3.447558, -5.791816, 1, 1.5, 0.5, 0.5,
2, -3.447558, -5.791816, 0, 1.5, 0.5, 0.5,
3, -3.447558, -5.791816, 0, -0.5, 0.5, 0.5,
3, -3.447558, -5.791816, 1, -0.5, 0.5, 0.5,
3, -3.447558, -5.791816, 1, 1.5, 0.5, 0.5,
3, -3.447558, -5.791816, 0, 1.5, 0.5, 0.5
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
-3.5325, -2, -4.979382,
-3.5325, 3, -4.979382,
-3.5325, -2, -4.979382,
-3.699796, -2, -5.250194,
-3.5325, -1, -4.979382,
-3.699796, -1, -5.250194,
-3.5325, 0, -4.979382,
-3.699796, 0, -5.250194,
-3.5325, 1, -4.979382,
-3.699796, 1, -5.250194,
-3.5325, 2, -4.979382,
-3.699796, 2, -5.250194,
-3.5325, 3, -4.979382,
-3.699796, 3, -5.250194
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
-4.034389, -2, -5.791816, 0, -0.5, 0.5, 0.5,
-4.034389, -2, -5.791816, 1, -0.5, 0.5, 0.5,
-4.034389, -2, -5.791816, 1, 1.5, 0.5, 0.5,
-4.034389, -2, -5.791816, 0, 1.5, 0.5, 0.5,
-4.034389, -1, -5.791816, 0, -0.5, 0.5, 0.5,
-4.034389, -1, -5.791816, 1, -0.5, 0.5, 0.5,
-4.034389, -1, -5.791816, 1, 1.5, 0.5, 0.5,
-4.034389, -1, -5.791816, 0, 1.5, 0.5, 0.5,
-4.034389, 0, -5.791816, 0, -0.5, 0.5, 0.5,
-4.034389, 0, -5.791816, 1, -0.5, 0.5, 0.5,
-4.034389, 0, -5.791816, 1, 1.5, 0.5, 0.5,
-4.034389, 0, -5.791816, 0, 1.5, 0.5, 0.5,
-4.034389, 1, -5.791816, 0, -0.5, 0.5, 0.5,
-4.034389, 1, -5.791816, 1, -0.5, 0.5, 0.5,
-4.034389, 1, -5.791816, 1, 1.5, 0.5, 0.5,
-4.034389, 1, -5.791816, 0, 1.5, 0.5, 0.5,
-4.034389, 2, -5.791816, 0, -0.5, 0.5, 0.5,
-4.034389, 2, -5.791816, 1, -0.5, 0.5, 0.5,
-4.034389, 2, -5.791816, 1, 1.5, 0.5, 0.5,
-4.034389, 2, -5.791816, 0, 1.5, 0.5, 0.5,
-4.034389, 3, -5.791816, 0, -0.5, 0.5, 0.5,
-4.034389, 3, -5.791816, 1, -0.5, 0.5, 0.5,
-4.034389, 3, -5.791816, 1, 1.5, 0.5, 0.5,
-4.034389, 3, -5.791816, 0, 1.5, 0.5, 0.5
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
-3.5325, -2.955665, -4,
-3.5325, -2.955665, 4,
-3.5325, -2.955665, -4,
-3.699796, -3.11963, -4,
-3.5325, -2.955665, -2,
-3.699796, -3.11963, -2,
-3.5325, -2.955665, 0,
-3.699796, -3.11963, 0,
-3.5325, -2.955665, 2,
-3.699796, -3.11963, 2,
-3.5325, -2.955665, 4,
-3.699796, -3.11963, 4
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
-4.034389, -3.447558, -4, 0, -0.5, 0.5, 0.5,
-4.034389, -3.447558, -4, 1, -0.5, 0.5, 0.5,
-4.034389, -3.447558, -4, 1, 1.5, 0.5, 0.5,
-4.034389, -3.447558, -4, 0, 1.5, 0.5, 0.5,
-4.034389, -3.447558, -2, 0, -0.5, 0.5, 0.5,
-4.034389, -3.447558, -2, 1, -0.5, 0.5, 0.5,
-4.034389, -3.447558, -2, 1, 1.5, 0.5, 0.5,
-4.034389, -3.447558, -2, 0, 1.5, 0.5, 0.5,
-4.034389, -3.447558, 0, 0, -0.5, 0.5, 0.5,
-4.034389, -3.447558, 0, 1, -0.5, 0.5, 0.5,
-4.034389, -3.447558, 0, 1, 1.5, 0.5, 0.5,
-4.034389, -3.447558, 0, 0, 1.5, 0.5, 0.5,
-4.034389, -3.447558, 2, 0, -0.5, 0.5, 0.5,
-4.034389, -3.447558, 2, 1, -0.5, 0.5, 0.5,
-4.034389, -3.447558, 2, 1, 1.5, 0.5, 0.5,
-4.034389, -3.447558, 2, 0, 1.5, 0.5, 0.5,
-4.034389, -3.447558, 4, 0, -0.5, 0.5, 0.5,
-4.034389, -3.447558, 4, 1, -0.5, 0.5, 0.5,
-4.034389, -3.447558, 4, 1, 1.5, 0.5, 0.5,
-4.034389, -3.447558, 4, 0, 1.5, 0.5, 0.5
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
-3.5325, -2.955665, -4.979382,
-3.5325, 3.602904, -4.979382,
-3.5325, -2.955665, 5.853067,
-3.5325, 3.602904, 5.853067,
-3.5325, -2.955665, -4.979382,
-3.5325, -2.955665, 5.853067,
-3.5325, 3.602904, -4.979382,
-3.5325, 3.602904, 5.853067,
-3.5325, -2.955665, -4.979382,
3.15936, -2.955665, -4.979382,
-3.5325, -2.955665, 5.853067,
3.15936, -2.955665, 5.853067,
-3.5325, 3.602904, -4.979382,
3.15936, 3.602904, -4.979382,
-3.5325, 3.602904, 5.853067,
3.15936, 3.602904, 5.853067,
3.15936, -2.955665, -4.979382,
3.15936, 3.602904, -4.979382,
3.15936, -2.955665, 5.853067,
3.15936, 3.602904, 5.853067,
3.15936, -2.955665, -4.979382,
3.15936, -2.955665, 5.853067,
3.15936, 3.602904, -4.979382,
3.15936, 3.602904, 5.853067
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
var radius = 7.648007;
var distance = 34.02684;
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
mvMatrix.translate( 0.1865698, -0.3236191, -0.4368424 );
mvMatrix.scale( 1.235707, 1.26082, 0.7633708 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.02684);
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
disodium_arsenate_so<-read.table("disodium_arsenate_so.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 5 elements
```

```r
x<-disodium_arsenate_so$V2
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_so' not found
```

```r
y<-disodium_arsenate_so$V3
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_so' not found
```

```r
z<-disodium_arsenate_so$V4
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_so' not found
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
-3.435045, 1.330286, -0.3831718, 0, 0, 1, 1, 1,
-3.377655, -1.280852, -1.537786, 1, 0, 0, 1, 1,
-2.810029, -2.0514, -2.408977, 1, 0, 0, 1, 1,
-2.781615, -0.2970276, 0.284827, 1, 0, 0, 1, 1,
-2.700549, 1.307858, 0.4908324, 1, 0, 0, 1, 1,
-2.662691, -0.3251248, -1.793736, 1, 0, 0, 1, 1,
-2.528382, -1.701025, -1.789433, 0, 0, 0, 1, 1,
-2.50241, 2.505393, -0.1308253, 0, 0, 0, 1, 1,
-2.439184, 1.135844, 0.9266548, 0, 0, 0, 1, 1,
-2.357427, 2.765793, -0.2028082, 0, 0, 0, 1, 1,
-2.355392, -1.97324, -2.608483, 0, 0, 0, 1, 1,
-2.341524, -0.4178747, -0.1764716, 0, 0, 0, 1, 1,
-2.28289, 0.8803582, -2.20095, 0, 0, 0, 1, 1,
-2.271779, 1.145875, -0.7224016, 1, 1, 1, 1, 1,
-2.24897, -0.2505153, -0.7820156, 1, 1, 1, 1, 1,
-2.23749, 0.7432583, 0.8249018, 1, 1, 1, 1, 1,
-2.230856, 0.1645778, -2.062122, 1, 1, 1, 1, 1,
-2.206526, -0.3440633, -1.189218, 1, 1, 1, 1, 1,
-2.163826, -0.1509903, -1.444347, 1, 1, 1, 1, 1,
-2.12161, 1.163937, -1.969591, 1, 1, 1, 1, 1,
-2.106009, -1.109218, -1.873769, 1, 1, 1, 1, 1,
-1.997551, -0.1087182, -1.811457, 1, 1, 1, 1, 1,
-1.930655, -0.3795237, -0.9559249, 1, 1, 1, 1, 1,
-1.904691, -0.2171155, -2.612659, 1, 1, 1, 1, 1,
-1.901203, 1.059726, -1.488855, 1, 1, 1, 1, 1,
-1.900291, -1.330209, -1.653474, 1, 1, 1, 1, 1,
-1.893112, 1.292075, -1.84072, 1, 1, 1, 1, 1,
-1.886695, 1.149947, -2.084637, 1, 1, 1, 1, 1,
-1.873996, -0.1804989, -2.770404, 0, 0, 1, 1, 1,
-1.862897, -1.517068, -1.789256, 1, 0, 0, 1, 1,
-1.841847, -0.7269394, -0.3706023, 1, 0, 0, 1, 1,
-1.839523, -0.8633347, -0.9684128, 1, 0, 0, 1, 1,
-1.824172, -0.2348382, -2.927559, 1, 0, 0, 1, 1,
-1.813214, -2.264776, -0.5498251, 1, 0, 0, 1, 1,
-1.810467, -0.7866592, -1.641307, 0, 0, 0, 1, 1,
-1.810218, -1.454229, -2.283957, 0, 0, 0, 1, 1,
-1.799675, 1.389722, 0.1193632, 0, 0, 0, 1, 1,
-1.78263, 1.374171, -0.2906158, 0, 0, 0, 1, 1,
-1.779618, -0.3902128, -1.636338, 0, 0, 0, 1, 1,
-1.77279, 1.195492, -0.8159259, 0, 0, 0, 1, 1,
-1.747216, 0.212999, -2.378483, 0, 0, 0, 1, 1,
-1.732731, 0.7651194, -1.03911, 1, 1, 1, 1, 1,
-1.721589, 0.5490494, -0.3335396, 1, 1, 1, 1, 1,
-1.703691, -0.1378601, -3.564577, 1, 1, 1, 1, 1,
-1.666084, -0.612459, -3.020649, 1, 1, 1, 1, 1,
-1.660562, 1.292341, -0.2603806, 1, 1, 1, 1, 1,
-1.648723, -0.4137185, -1.783069, 1, 1, 1, 1, 1,
-1.647815, -0.6555794, -1.074912, 1, 1, 1, 1, 1,
-1.644124, 0.9187765, -1.970865, 1, 1, 1, 1, 1,
-1.642392, 0.4626365, -1.607464, 1, 1, 1, 1, 1,
-1.641351, -0.8960453, -2.445942, 1, 1, 1, 1, 1,
-1.625573, -0.6131339, -0.1798049, 1, 1, 1, 1, 1,
-1.608775, -1.61317, -2.635714, 1, 1, 1, 1, 1,
-1.585627, 0.6055988, -1.733815, 1, 1, 1, 1, 1,
-1.584841, 0.8856137, -0.5854723, 1, 1, 1, 1, 1,
-1.584631, -1.6081, -2.843843, 1, 1, 1, 1, 1,
-1.563907, 0.2793605, -0.8328636, 0, 0, 1, 1, 1,
-1.550459, 0.5888634, -0.6369225, 1, 0, 0, 1, 1,
-1.527713, 0.499524, -0.9078028, 1, 0, 0, 1, 1,
-1.517533, -0.7582158, -0.8785806, 1, 0, 0, 1, 1,
-1.514812, -0.6440929, -4.015312, 1, 0, 0, 1, 1,
-1.513742, -0.8333614, -2.836001, 1, 0, 0, 1, 1,
-1.509778, 1.409907, -1.295489, 0, 0, 0, 1, 1,
-1.468663, -0.9657476, -3.497717, 0, 0, 0, 1, 1,
-1.467016, 0.8598798, -1.661313, 0, 0, 0, 1, 1,
-1.456401, 1.691832, 0.8042483, 0, 0, 0, 1, 1,
-1.452894, 0.7031156, -0.4063726, 0, 0, 0, 1, 1,
-1.44861, -0.9208052, -1.884715, 0, 0, 0, 1, 1,
-1.43367, -0.8446687, -2.275809, 0, 0, 0, 1, 1,
-1.429974, -0.2785041, -2.665915, 1, 1, 1, 1, 1,
-1.427329, 0.5464923, -1.780983, 1, 1, 1, 1, 1,
-1.418128, 1.481319, -0.889817, 1, 1, 1, 1, 1,
-1.409395, -0.6489057, -1.877891, 1, 1, 1, 1, 1,
-1.407798, 1.527557, -2.267297, 1, 1, 1, 1, 1,
-1.398944, -0.4257312, -1.369813, 1, 1, 1, 1, 1,
-1.396503, 0.92542, -0.9166844, 1, 1, 1, 1, 1,
-1.394725, 1.167007, -2.760234, 1, 1, 1, 1, 1,
-1.385852, -0.5301023, -1.9844, 1, 1, 1, 1, 1,
-1.384603, 1.064388, -0.6545722, 1, 1, 1, 1, 1,
-1.376643, -0.0780085, -1.253079, 1, 1, 1, 1, 1,
-1.369051, 0.2952811, -1.016524, 1, 1, 1, 1, 1,
-1.367715, -0.837292, -2.267428, 1, 1, 1, 1, 1,
-1.367076, -0.6862776, -2.932899, 1, 1, 1, 1, 1,
-1.362741, 0.6347178, -1.930351, 1, 1, 1, 1, 1,
-1.361657, -0.5054266, -0.6694711, 0, 0, 1, 1, 1,
-1.356266, -0.2298986, -0.3277106, 1, 0, 0, 1, 1,
-1.335726, 0.4043885, -0.8531283, 1, 0, 0, 1, 1,
-1.332336, 0.9500671, 0.2159823, 1, 0, 0, 1, 1,
-1.327826, 1.603799, -0.3873159, 1, 0, 0, 1, 1,
-1.326371, -0.4586842, -2.944867, 1, 0, 0, 1, 1,
-1.322022, -1.152769, -2.962691, 0, 0, 0, 1, 1,
-1.312024, -1.068307, -2.008245, 0, 0, 0, 1, 1,
-1.310819, -0.718401, -2.049336, 0, 0, 0, 1, 1,
-1.306214, 0.06807085, -1.777454, 0, 0, 0, 1, 1,
-1.299542, 1.264187, -0.3353578, 0, 0, 0, 1, 1,
-1.286185, 0.3948667, -1.592676, 0, 0, 0, 1, 1,
-1.265526, 0.5219417, -1.526964, 0, 0, 0, 1, 1,
-1.258483, 0.1308511, -3.56024, 1, 1, 1, 1, 1,
-1.248331, -0.4233076, -1.436872, 1, 1, 1, 1, 1,
-1.220439, -0.7504522, -2.51069, 1, 1, 1, 1, 1,
-1.22, 1.02101, 0.06583188, 1, 1, 1, 1, 1,
-1.212218, 0.1424717, -1.417994, 1, 1, 1, 1, 1,
-1.193188, -0.8379684, -3.106595, 1, 1, 1, 1, 1,
-1.183398, -0.2849441, -2.793636, 1, 1, 1, 1, 1,
-1.183251, -1.149503, -2.14033, 1, 1, 1, 1, 1,
-1.181545, -0.5722225, -2.030202, 1, 1, 1, 1, 1,
-1.17707, -0.9253469, -1.800882, 1, 1, 1, 1, 1,
-1.174495, -0.1169631, -0.5970414, 1, 1, 1, 1, 1,
-1.173597, 0.1052186, -2.363918, 1, 1, 1, 1, 1,
-1.164367, 0.3606349, -0.7747508, 1, 1, 1, 1, 1,
-1.161107, -1.173321, -1.866111, 1, 1, 1, 1, 1,
-1.156329, -0.6074408, -2.748961, 1, 1, 1, 1, 1,
-1.153706, 1.869747, -2.02576, 0, 0, 1, 1, 1,
-1.1536, 0.6806481, -0.4650726, 1, 0, 0, 1, 1,
-1.151795, -1.621561, -0.4515721, 1, 0, 0, 1, 1,
-1.149322, -1.38355, -1.220448, 1, 0, 0, 1, 1,
-1.148337, 0.8705336, 0.3265176, 1, 0, 0, 1, 1,
-1.148096, -0.7427568, -3.476639, 1, 0, 0, 1, 1,
-1.143965, -1.732043, -2.518442, 0, 0, 0, 1, 1,
-1.12862, 1.341146, -1.924876, 0, 0, 0, 1, 1,
-1.125254, -1.281177, -2.237888, 0, 0, 0, 1, 1,
-1.118451, -0.1389309, -0.8700814, 0, 0, 0, 1, 1,
-1.115618, 0.3345389, -1.053582, 0, 0, 0, 1, 1,
-1.11295, 0.8985337, 0.6804027, 0, 0, 0, 1, 1,
-1.112924, -0.1646275, -1.95185, 0, 0, 0, 1, 1,
-1.111535, 1.326739, -0.1502654, 1, 1, 1, 1, 1,
-1.111245, 0.2454634, 0.1461545, 1, 1, 1, 1, 1,
-1.099367, -0.7222969, -3.423998, 1, 1, 1, 1, 1,
-1.097804, 0.4844377, -1.458694, 1, 1, 1, 1, 1,
-1.089741, -0.005674001, -1.843832, 1, 1, 1, 1, 1,
-1.089277, 0.3891669, -1.53336, 1, 1, 1, 1, 1,
-1.083842, -1.651354, -2.955628, 1, 1, 1, 1, 1,
-1.077283, 2.616383, 0.08520612, 1, 1, 1, 1, 1,
-1.074951, -1.000844, -2.319996, 1, 1, 1, 1, 1,
-1.070084, -0.1586575, -0.111347, 1, 1, 1, 1, 1,
-1.064916, -1.790889, -2.548379, 1, 1, 1, 1, 1,
-1.064909, -0.2098706, -1.217332, 1, 1, 1, 1, 1,
-1.061571, -0.6058688, -1.283649, 1, 1, 1, 1, 1,
-1.058777, -1.756933, -3.111927, 1, 1, 1, 1, 1,
-1.058456, -0.2492256, -1.605557, 1, 1, 1, 1, 1,
-1.050985, 0.1067614, -1.809512, 0, 0, 1, 1, 1,
-1.047584, 1.419413, 1.302202, 1, 0, 0, 1, 1,
-1.044637, -1.374465, -2.835798, 1, 0, 0, 1, 1,
-1.039945, -0.2939179, -0.01636137, 1, 0, 0, 1, 1,
-1.038867, 0.1900164, -0.9046702, 1, 0, 0, 1, 1,
-1.037674, 1.687492, 1.901098, 1, 0, 0, 1, 1,
-1.036492, 0.2837427, -1.107914, 0, 0, 0, 1, 1,
-1.03607, -0.04812354, -2.061441, 0, 0, 0, 1, 1,
-1.035083, 0.1509873, -1.214802, 0, 0, 0, 1, 1,
-1.035022, 0.4739249, -0.5597799, 0, 0, 0, 1, 1,
-1.027381, -1.916727, -3.899884, 0, 0, 0, 1, 1,
-1.022193, 1.785315, -0.5915241, 0, 0, 0, 1, 1,
-1.022158, -0.6973604, -2.8801, 0, 0, 0, 1, 1,
-1.018963, -0.6982976, -2.50758, 1, 1, 1, 1, 1,
-1.016989, -1.744104, -2.29356, 1, 1, 1, 1, 1,
-1.010311, 0.5138873, -1.68291, 1, 1, 1, 1, 1,
-1.0058, 2.173841, -1.756747, 1, 1, 1, 1, 1,
-1.004132, 0.2661747, -1.830517, 1, 1, 1, 1, 1,
-1.000721, 1.225969, 0.9581906, 1, 1, 1, 1, 1,
-1.000029, -0.7480084, -3.555809, 1, 1, 1, 1, 1,
-0.9979238, 1.759702, -0.8825721, 1, 1, 1, 1, 1,
-0.9958919, 0.5748104, -0.5761904, 1, 1, 1, 1, 1,
-0.9910037, -1.145732, -2.246284, 1, 1, 1, 1, 1,
-0.9909788, -0.6463886, -0.8234713, 1, 1, 1, 1, 1,
-0.9880556, -1.021794, -2.910494, 1, 1, 1, 1, 1,
-0.9820475, 2.094942, 0.5405875, 1, 1, 1, 1, 1,
-0.9772971, 0.7193053, 0.3147861, 1, 1, 1, 1, 1,
-0.9664332, 0.2644159, -1.197299, 1, 1, 1, 1, 1,
-0.9655132, -0.1322802, -1.106524, 0, 0, 1, 1, 1,
-0.9608117, -1.418118, -3.702122, 1, 0, 0, 1, 1,
-0.9522303, -0.0001445748, -3.366364, 1, 0, 0, 1, 1,
-0.9493934, -0.4933579, -1.337947, 1, 0, 0, 1, 1,
-0.9442844, -0.5061009, -0.9856374, 1, 0, 0, 1, 1,
-0.939512, -1.462992, -1.954072, 1, 0, 0, 1, 1,
-0.9387608, -0.6289421, -1.08838, 0, 0, 0, 1, 1,
-0.9314528, -0.2435457, -2.846211, 0, 0, 0, 1, 1,
-0.9262185, 1.461553, -2.760681, 0, 0, 0, 1, 1,
-0.9179667, 0.6680017, -1.356351, 0, 0, 0, 1, 1,
-0.917287, 0.1223433, -1.391016, 0, 0, 0, 1, 1,
-0.9155676, 1.015849, -1.303538, 0, 0, 0, 1, 1,
-0.911135, -0.5894712, -3.350859, 0, 0, 0, 1, 1,
-0.9048282, 1.72966, 0.1642809, 1, 1, 1, 1, 1,
-0.903114, -1.259269, -3.022081, 1, 1, 1, 1, 1,
-0.8992428, 0.004475178, -2.423553, 1, 1, 1, 1, 1,
-0.8984213, 1.280998, -0.4516924, 1, 1, 1, 1, 1,
-0.8980795, 1.45114, -1.505315, 1, 1, 1, 1, 1,
-0.8962511, 0.6787218, 0.8559849, 1, 1, 1, 1, 1,
-0.8939252, 0.05425172, 0.09903923, 1, 1, 1, 1, 1,
-0.8910565, -0.5776322, -1.851893, 1, 1, 1, 1, 1,
-0.8884995, 0.8923537, 0.1450974, 1, 1, 1, 1, 1,
-0.887977, -1.181358, -3.466777, 1, 1, 1, 1, 1,
-0.8871525, 0.7584053, -0.2678306, 1, 1, 1, 1, 1,
-0.8845282, -0.7922072, -3.159096, 1, 1, 1, 1, 1,
-0.8838462, -0.7190912, -2.030519, 1, 1, 1, 1, 1,
-0.8834473, -0.2537428, -0.211941, 1, 1, 1, 1, 1,
-0.8770066, 0.4846151, -2.112345, 1, 1, 1, 1, 1,
-0.8737717, 1.269118, 0.876018, 0, 0, 1, 1, 1,
-0.8676637, -1.455564, -3.057618, 1, 0, 0, 1, 1,
-0.8644944, 0.2103377, -0.4475559, 1, 0, 0, 1, 1,
-0.8619733, -0.1911712, -3.789802, 1, 0, 0, 1, 1,
-0.8578211, -0.6210739, -2.714672, 1, 0, 0, 1, 1,
-0.8551008, 1.321625, -1.817341, 1, 0, 0, 1, 1,
-0.8528896, 0.02167829, -1.229975, 0, 0, 0, 1, 1,
-0.8519159, 1.025542, -2.026036, 0, 0, 0, 1, 1,
-0.8477292, 0.3951753, -2.089956, 0, 0, 0, 1, 1,
-0.8462447, 1.489437, 1.460922, 0, 0, 0, 1, 1,
-0.8458002, 0.3429692, -1.251083, 0, 0, 0, 1, 1,
-0.8451695, 1.607483, -1.552904, 0, 0, 0, 1, 1,
-0.8385148, 0.4667909, -0.4786248, 0, 0, 0, 1, 1,
-0.8383034, 0.789865, -1.817963, 1, 1, 1, 1, 1,
-0.8376666, -0.6628382, -2.477326, 1, 1, 1, 1, 1,
-0.8348652, 1.036493, -0.122874, 1, 1, 1, 1, 1,
-0.8299645, -0.6921062, -3.14392, 1, 1, 1, 1, 1,
-0.8285744, 0.0904021, -1.441476, 1, 1, 1, 1, 1,
-0.827411, -0.7425343, -1.278233, 1, 1, 1, 1, 1,
-0.8269533, -1.12612, -4.190054, 1, 1, 1, 1, 1,
-0.8268245, -0.355329, -1.866209, 1, 1, 1, 1, 1,
-0.8176894, -0.5213234, -1.668477, 1, 1, 1, 1, 1,
-0.815125, 0.5820611, -1.827845, 1, 1, 1, 1, 1,
-0.8136148, 2.369242, -1.64544, 1, 1, 1, 1, 1,
-0.8093349, 1.94049, -0.08439215, 1, 1, 1, 1, 1,
-0.8090737, 0.195288, -0.562041, 1, 1, 1, 1, 1,
-0.8071752, 1.303965, 0.7440597, 1, 1, 1, 1, 1,
-0.8045247, 0.4829245, -1.486095, 1, 1, 1, 1, 1,
-0.8025677, -1.181866, -2.450777, 0, 0, 1, 1, 1,
-0.8016934, 0.2284375, -1.928461, 1, 0, 0, 1, 1,
-0.7951797, 2.193684, 1.333838, 1, 0, 0, 1, 1,
-0.7879077, 0.3783838, -2.571872, 1, 0, 0, 1, 1,
-0.7817204, -0.2117841, -1.651156, 1, 0, 0, 1, 1,
-0.7805339, 1.382795, 1.07209, 1, 0, 0, 1, 1,
-0.7778221, 1.108362, 0.1672835, 0, 0, 0, 1, 1,
-0.7763401, 0.4887898, -0.4334177, 0, 0, 0, 1, 1,
-0.7679034, 0.6181644, -2.038243, 0, 0, 0, 1, 1,
-0.7652472, -0.2178992, -1.09407, 0, 0, 0, 1, 1,
-0.7633026, 0.6964, -1.467758, 0, 0, 0, 1, 1,
-0.761666, -0.1111791, -1.391243, 0, 0, 0, 1, 1,
-0.7492939, 0.2406421, -0.9882258, 0, 0, 0, 1, 1,
-0.7476318, 0.268159, -0.4483394, 1, 1, 1, 1, 1,
-0.7464352, -1.071487, -2.599226, 1, 1, 1, 1, 1,
-0.7386836, -1.236931, -1.672013, 1, 1, 1, 1, 1,
-0.7375288, 0.8006157, -2.491534, 1, 1, 1, 1, 1,
-0.7372166, -0.2751177, -0.737151, 1, 1, 1, 1, 1,
-0.7339661, -0.6426911, -0.7922685, 1, 1, 1, 1, 1,
-0.7323156, 1.27143, -3.289069, 1, 1, 1, 1, 1,
-0.7307258, -0.185834, -0.06265479, 1, 1, 1, 1, 1,
-0.7184035, 0.1268254, -0.6409839, 1, 1, 1, 1, 1,
-0.7159408, 0.3156043, -1.312887, 1, 1, 1, 1, 1,
-0.7121729, -0.1338058, -0.8379452, 1, 1, 1, 1, 1,
-0.7118374, -0.4967981, -2.987731, 1, 1, 1, 1, 1,
-0.7117633, 0.1586301, -2.264709, 1, 1, 1, 1, 1,
-0.7072867, -0.5603487, -1.737277, 1, 1, 1, 1, 1,
-0.7066284, 0.6092654, -1.769976, 1, 1, 1, 1, 1,
-0.7046739, 0.5094095, -3.558841, 0, 0, 1, 1, 1,
-0.6955118, 0.5002702, 0.2204025, 1, 0, 0, 1, 1,
-0.6920415, 0.009152588, -2.208171, 1, 0, 0, 1, 1,
-0.6892444, 0.7211587, 0.5673048, 1, 0, 0, 1, 1,
-0.6877126, -0.0544802, -2.61319, 1, 0, 0, 1, 1,
-0.6866933, -2.226551, -3.698775, 1, 0, 0, 1, 1,
-0.6823089, -0.7546074, -2.919527, 0, 0, 0, 1, 1,
-0.6807379, -0.08462632, -0.0561459, 0, 0, 0, 1, 1,
-0.6799402, 0.9586539, -1.578607, 0, 0, 0, 1, 1,
-0.6776001, -1.02405, -1.986443, 0, 0, 0, 1, 1,
-0.6774355, -0.04740055, -3.302041, 0, 0, 0, 1, 1,
-0.6674615, -1.992, -4.821628, 0, 0, 0, 1, 1,
-0.6670976, -0.1836526, -0.6488284, 0, 0, 0, 1, 1,
-0.6661126, 1.466533, 1.798038, 1, 1, 1, 1, 1,
-0.6581287, -1.318727, -4.730258, 1, 1, 1, 1, 1,
-0.6505715, -0.8874122, -0.7230567, 1, 1, 1, 1, 1,
-0.6467763, -0.8283353, -2.503746, 1, 1, 1, 1, 1,
-0.6440524, 1.392602, -1.486318, 1, 1, 1, 1, 1,
-0.6379009, -0.7923582, -2.372555, 1, 1, 1, 1, 1,
-0.6372715, -0.162014, -3.128319, 1, 1, 1, 1, 1,
-0.6368406, 0.2392112, -1.671883, 1, 1, 1, 1, 1,
-0.6270868, 1.1195, 0.5969505, 1, 1, 1, 1, 1,
-0.6141827, 0.4345359, -2.744103, 1, 1, 1, 1, 1,
-0.6137465, 1.3962, -2.239049, 1, 1, 1, 1, 1,
-0.6129512, 0.1122939, -0.4696256, 1, 1, 1, 1, 1,
-0.6096885, -0.9460157, -1.471491, 1, 1, 1, 1, 1,
-0.5985271, -0.184986, -0.9947132, 1, 1, 1, 1, 1,
-0.59526, -0.1816191, -1.895638, 1, 1, 1, 1, 1,
-0.5924139, -1.317092, -2.965937, 0, 0, 1, 1, 1,
-0.5900723, -1.101357, -1.52271, 1, 0, 0, 1, 1,
-0.5877662, 0.6299474, -1.724956, 1, 0, 0, 1, 1,
-0.5832921, 0.7196385, 0.361521, 1, 0, 0, 1, 1,
-0.5745106, 0.7940331, -1.815273, 1, 0, 0, 1, 1,
-0.5733907, -0.6195731, -4.693905, 1, 0, 0, 1, 1,
-0.5704482, 0.4695937, -0.09595934, 0, 0, 0, 1, 1,
-0.5662313, -0.3714707, -0.4205865, 0, 0, 0, 1, 1,
-0.5658119, -0.3168671, -1.627887, 0, 0, 0, 1, 1,
-0.5538959, 1.604122, 2.447692, 0, 0, 0, 1, 1,
-0.5528696, -0.2666175, -1.793581, 0, 0, 0, 1, 1,
-0.5521339, 1.38397, -0.1564133, 0, 0, 0, 1, 1,
-0.5512437, -0.2766858, -0.8940777, 0, 0, 0, 1, 1,
-0.5501204, 1.200514, -0.288545, 1, 1, 1, 1, 1,
-0.5479921, 0.2170636, -1.345022, 1, 1, 1, 1, 1,
-0.5465482, -0.8648753, -1.449996, 1, 1, 1, 1, 1,
-0.544008, 0.4677465, -1.117646, 1, 1, 1, 1, 1,
-0.5425667, 0.8991449, -0.7179672, 1, 1, 1, 1, 1,
-0.542453, -0.7579871, -4.048673, 1, 1, 1, 1, 1,
-0.5331158, 0.5961684, -0.7574636, 1, 1, 1, 1, 1,
-0.5308904, 1.624542, 0.89482, 1, 1, 1, 1, 1,
-0.5303416, -0.5242823, -3.329864, 1, 1, 1, 1, 1,
-0.5240819, 0.1860945, -3.220334, 1, 1, 1, 1, 1,
-0.5240295, -1.247053, -2.766181, 1, 1, 1, 1, 1,
-0.519919, 0.8702077, 0.5126322, 1, 1, 1, 1, 1,
-0.5158206, 1.174633, -1.001015, 1, 1, 1, 1, 1,
-0.5156119, -0.7901148, -2.835618, 1, 1, 1, 1, 1,
-0.5148162, 1.257457, -2.793022, 1, 1, 1, 1, 1,
-0.5134531, 0.8119287, 0.6880255, 0, 0, 1, 1, 1,
-0.513258, 1.6746, 0.1233257, 1, 0, 0, 1, 1,
-0.5127704, -0.7029316, -2.855128, 1, 0, 0, 1, 1,
-0.5054864, 1.346855, 0.5856386, 1, 0, 0, 1, 1,
-0.5050889, 1.840371, 0.05276848, 1, 0, 0, 1, 1,
-0.5009629, -2.438071, -2.477578, 1, 0, 0, 1, 1,
-0.4998406, 0.4780883, -3.606606, 0, 0, 0, 1, 1,
-0.4991282, -0.5378824, -3.348412, 0, 0, 0, 1, 1,
-0.4926462, -1.293171, -2.73885, 0, 0, 0, 1, 1,
-0.4876404, -0.5905176, -2.213113, 0, 0, 0, 1, 1,
-0.4820371, 0.9012344, -0.8074794, 0, 0, 0, 1, 1,
-0.4798191, -0.6780957, -3.203244, 0, 0, 0, 1, 1,
-0.4733723, 1.102467, -1.549948, 0, 0, 0, 1, 1,
-0.4700183, -1.922158, -3.68435, 1, 1, 1, 1, 1,
-0.463982, -1.338112, -4.407273, 1, 1, 1, 1, 1,
-0.4632112, -0.5675296, -2.441464, 1, 1, 1, 1, 1,
-0.4613865, 2.063045, -1.076742, 1, 1, 1, 1, 1,
-0.4594187, -0.02946434, -1.460981, 1, 1, 1, 1, 1,
-0.4580798, -0.3811637, -3.272951, 1, 1, 1, 1, 1,
-0.4575642, 2.488548, 0.7595076, 1, 1, 1, 1, 1,
-0.4523131, 0.6887152, -2.47781, 1, 1, 1, 1, 1,
-0.4498506, -1.548801, -3.527428, 1, 1, 1, 1, 1,
-0.4453512, -1.483974, -1.584917, 1, 1, 1, 1, 1,
-0.444181, -0.7693028, -3.613238, 1, 1, 1, 1, 1,
-0.4402241, 0.2626352, -1.897569, 1, 1, 1, 1, 1,
-0.4340847, 0.1012376, -0.9654096, 1, 1, 1, 1, 1,
-0.4333431, 1.870649, 0.05759976, 1, 1, 1, 1, 1,
-0.4320802, 0.8082008, -0.986696, 1, 1, 1, 1, 1,
-0.4278319, -2.12954, -3.106332, 0, 0, 1, 1, 1,
-0.4267935, 0.3090611, 0.2861716, 1, 0, 0, 1, 1,
-0.4262471, 1.123366, 0.3085621, 1, 0, 0, 1, 1,
-0.4243154, 0.606868, -0.9251863, 1, 0, 0, 1, 1,
-0.4230191, -0.7631094, -2.751388, 1, 0, 0, 1, 1,
-0.4203079, 0.7087311, -0.4978326, 1, 0, 0, 1, 1,
-0.419858, -2.007054, -1.190996, 0, 0, 0, 1, 1,
-0.4171311, -0.9007587, -1.297238, 0, 0, 0, 1, 1,
-0.4065531, -0.7379217, -2.946787, 0, 0, 0, 1, 1,
-0.4053047, 0.6553859, -1.846202, 0, 0, 0, 1, 1,
-0.3955705, -0.6622154, -4.145478, 0, 0, 0, 1, 1,
-0.3950548, -0.6711522, -1.959431, 0, 0, 0, 1, 1,
-0.3901573, 1.294332, -0.8005258, 0, 0, 0, 1, 1,
-0.3867365, 3.347197, -0.2858869, 1, 1, 1, 1, 1,
-0.3841744, -0.6366385, -3.059437, 1, 1, 1, 1, 1,
-0.3840297, 1.621455, -0.7444954, 1, 1, 1, 1, 1,
-0.3777921, 1.400138, -0.893171, 1, 1, 1, 1, 1,
-0.3759103, -0.9749035, -1.678193, 1, 1, 1, 1, 1,
-0.3725075, -1.211962, -1.890778, 1, 1, 1, 1, 1,
-0.372137, -0.5595471, -1.79475, 1, 1, 1, 1, 1,
-0.3717977, 1.027887, 0.2915891, 1, 1, 1, 1, 1,
-0.3715066, -2.33655, -1.831233, 1, 1, 1, 1, 1,
-0.371293, 1.737018, -0.5725942, 1, 1, 1, 1, 1,
-0.369608, -1.339261, -3.173744, 1, 1, 1, 1, 1,
-0.3693948, -0.4567995, -2.143864, 1, 1, 1, 1, 1,
-0.3682096, 0.2112497, -2.47168, 1, 1, 1, 1, 1,
-0.3679942, -0.5537821, -1.85503, 1, 1, 1, 1, 1,
-0.3597674, -1.162099, -0.7174711, 1, 1, 1, 1, 1,
-0.3571767, -0.5968578, -1.97527, 0, 0, 1, 1, 1,
-0.351161, -0.299123, -2.841459, 1, 0, 0, 1, 1,
-0.340319, -0.1155962, -0.3225412, 1, 0, 0, 1, 1,
-0.3386986, -1.393373, -2.64787, 1, 0, 0, 1, 1,
-0.3349528, -2.046304, -4.16445, 1, 0, 0, 1, 1,
-0.3337107, 0.559757, -0.8375651, 1, 0, 0, 1, 1,
-0.3322053, 2.511179, -0.6720018, 0, 0, 0, 1, 1,
-0.3291797, 0.9335293, 0.9927966, 0, 0, 0, 1, 1,
-0.327824, -0.2735316, -1.862291, 0, 0, 0, 1, 1,
-0.3268459, -1.812121, -2.19774, 0, 0, 0, 1, 1,
-0.3231283, -0.1390537, -1.76766, 0, 0, 0, 1, 1,
-0.3201567, 0.04301854, -0.7027988, 0, 0, 0, 1, 1,
-0.3198778, 1.237914, 1.331404, 0, 0, 0, 1, 1,
-0.3167561, -0.708329, -1.605699, 1, 1, 1, 1, 1,
-0.3166886, 0.05247921, -1.936468, 1, 1, 1, 1, 1,
-0.315917, 0.1149024, -0.5081272, 1, 1, 1, 1, 1,
-0.3147871, 0.1519442, -2.882878, 1, 1, 1, 1, 1,
-0.3145113, 0.6022075, 0.07494133, 1, 1, 1, 1, 1,
-0.3131619, -1.941775, -0.4202787, 1, 1, 1, 1, 1,
-0.3125894, -0.8154872, -2.014241, 1, 1, 1, 1, 1,
-0.3112934, -1.73867, -2.529306, 1, 1, 1, 1, 1,
-0.2991811, -0.896973, -4.217813, 1, 1, 1, 1, 1,
-0.2947042, 0.02709474, -1.023561, 1, 1, 1, 1, 1,
-0.29314, 1.259185, 0.6556095, 1, 1, 1, 1, 1,
-0.2871612, -0.02957098, -2.443348, 1, 1, 1, 1, 1,
-0.2839671, 0.1696113, -1.516502, 1, 1, 1, 1, 1,
-0.2835818, 0.3067466, -2.683994, 1, 1, 1, 1, 1,
-0.2824836, -0.8121645, -1.192645, 1, 1, 1, 1, 1,
-0.279571, -0.1267808, -3.670757, 0, 0, 1, 1, 1,
-0.2775892, -0.5632885, -2.824056, 1, 0, 0, 1, 1,
-0.2766152, -0.7382686, -2.186026, 1, 0, 0, 1, 1,
-0.2758835, -0.04680787, -0.8074914, 1, 0, 0, 1, 1,
-0.2755347, -0.3403526, -0.5597833, 1, 0, 0, 1, 1,
-0.2733927, -1.438079, -2.98282, 1, 0, 0, 1, 1,
-0.2729973, 0.7811818, 0.2782613, 0, 0, 0, 1, 1,
-0.2727799, 0.124823, 0.176439, 0, 0, 0, 1, 1,
-0.2707668, -0.2774104, -3.094758, 0, 0, 0, 1, 1,
-0.2698006, -1.042838, -2.421482, 0, 0, 0, 1, 1,
-0.2674699, 0.1322948, -0.6695019, 0, 0, 0, 1, 1,
-0.2607872, -2.062883, -4.507685, 0, 0, 0, 1, 1,
-0.2604207, 1.978539, 0.0955475, 0, 0, 0, 1, 1,
-0.2534976, 0.3918822, -1.085529, 1, 1, 1, 1, 1,
-0.2499344, 0.2434246, 0.3273064, 1, 1, 1, 1, 1,
-0.2480641, -0.2659879, -2.886305, 1, 1, 1, 1, 1,
-0.2470302, -0.6732965, -2.500872, 1, 1, 1, 1, 1,
-0.2392342, -0.6885628, -3.179714, 1, 1, 1, 1, 1,
-0.237773, 1.058087, 0.3900816, 1, 1, 1, 1, 1,
-0.2346857, 0.2953837, -0.573046, 1, 1, 1, 1, 1,
-0.234055, 0.6995534, -1.687059, 1, 1, 1, 1, 1,
-0.2329831, -0.1755178, -2.776551, 1, 1, 1, 1, 1,
-0.2321509, -0.01169637, -3.433644, 1, 1, 1, 1, 1,
-0.231866, -0.1381897, -1.703802, 1, 1, 1, 1, 1,
-0.2315306, -0.1813544, -1.585268, 1, 1, 1, 1, 1,
-0.2307185, -1.406446, -1.220449, 1, 1, 1, 1, 1,
-0.2217218, -0.7662252, -2.973777, 1, 1, 1, 1, 1,
-0.2202462, 1.93279, -0.2236647, 1, 1, 1, 1, 1,
-0.218317, -0.4513816, -2.665021, 0, 0, 1, 1, 1,
-0.2149176, -1.831582, -3.544447, 1, 0, 0, 1, 1,
-0.2136699, 0.1551929, 0.3033212, 1, 0, 0, 1, 1,
-0.2090719, 0.573392, -2.755475, 1, 0, 0, 1, 1,
-0.2080388, -0.826853, -3.820814, 1, 0, 0, 1, 1,
-0.2031386, 0.04982416, -0.75785, 1, 0, 0, 1, 1,
-0.2007974, 0.7411323, 0.4657072, 0, 0, 0, 1, 1,
-0.2000534, 1.233623, -0.1282208, 0, 0, 0, 1, 1,
-0.1985381, 0.5027227, -0.6284499, 0, 0, 0, 1, 1,
-0.1961152, -0.1154194, 0.1917666, 0, 0, 0, 1, 1,
-0.1929473, 1.732435, -0.2733259, 0, 0, 0, 1, 1,
-0.1912411, 0.4991945, -0.7155945, 0, 0, 0, 1, 1,
-0.1883861, -0.3651436, -2.371215, 0, 0, 0, 1, 1,
-0.187731, -0.9547963, -2.324712, 1, 1, 1, 1, 1,
-0.1856008, -1.327959, -2.888985, 1, 1, 1, 1, 1,
-0.1807736, 0.7164721, 0.5797132, 1, 1, 1, 1, 1,
-0.1797157, -0.5279242, -1.517783, 1, 1, 1, 1, 1,
-0.1791801, -0.8779479, -2.940898, 1, 1, 1, 1, 1,
-0.1751662, -0.821456, -3.004188, 1, 1, 1, 1, 1,
-0.1741793, -0.3016766, -0.7930098, 1, 1, 1, 1, 1,
-0.1718078, -0.2475019, -2.134092, 1, 1, 1, 1, 1,
-0.1677764, 1.44429, -0.08993032, 1, 1, 1, 1, 1,
-0.1649904, -0.6614474, -1.02733, 1, 1, 1, 1, 1,
-0.1572691, 1.259503, 0.9150345, 1, 1, 1, 1, 1,
-0.15595, 0.3292431, 0.1716407, 1, 1, 1, 1, 1,
-0.1507944, -0.4343418, -1.201684, 1, 1, 1, 1, 1,
-0.1486028, -1.354074, -3.609125, 1, 1, 1, 1, 1,
-0.1476599, -0.9427904, -0.8009425, 1, 1, 1, 1, 1,
-0.1466792, -0.863119, -2.996248, 0, 0, 1, 1, 1,
-0.1444986, -0.3821302, -2.714766, 1, 0, 0, 1, 1,
-0.142443, -0.2831447, -2.44773, 1, 0, 0, 1, 1,
-0.1413097, -0.7172921, -3.764625, 1, 0, 0, 1, 1,
-0.1390823, -0.6494775, -1.264533, 1, 0, 0, 1, 1,
-0.1331564, 1.29303, 0.8971022, 1, 0, 0, 1, 1,
-0.133013, 1.722449, 0.4353134, 0, 0, 0, 1, 1,
-0.1319847, 0.5885867, -1.045607, 0, 0, 0, 1, 1,
-0.1282262, 0.2211564, -0.9664566, 0, 0, 0, 1, 1,
-0.1242286, 0.1556435, -0.2888529, 0, 0, 0, 1, 1,
-0.1231515, -0.6507468, -2.750411, 0, 0, 0, 1, 1,
-0.1225876, 0.321935, -0.2681165, 0, 0, 0, 1, 1,
-0.1217648, -1.658401, -2.236046, 0, 0, 0, 1, 1,
-0.1204793, -0.1582216, -2.602933, 1, 1, 1, 1, 1,
-0.1189992, 0.6108859, 0.3881014, 1, 1, 1, 1, 1,
-0.1188125, -1.940844, -2.237702, 1, 1, 1, 1, 1,
-0.1179459, -1.402215, -3.98977, 1, 1, 1, 1, 1,
-0.1176429, 0.461727, -0.7893221, 1, 1, 1, 1, 1,
-0.1142514, -1.861923, -3.945436, 1, 1, 1, 1, 1,
-0.1073267, 0.07516318, -0.271663, 1, 1, 1, 1, 1,
-0.1053008, 2.380165, 0.3221196, 1, 1, 1, 1, 1,
-0.1036144, 2.12081, -1.559267, 1, 1, 1, 1, 1,
-0.1015323, -0.4766794, -4.241677, 1, 1, 1, 1, 1,
-0.1008508, 0.1007058, 0.1635671, 1, 1, 1, 1, 1,
-0.100721, -0.9858658, -1.178418, 1, 1, 1, 1, 1,
-0.09880812, 1.318066, 0.3436334, 1, 1, 1, 1, 1,
-0.09761633, 0.1880098, -0.5804381, 1, 1, 1, 1, 1,
-0.09731024, -0.7772898, -3.382068, 1, 1, 1, 1, 1,
-0.09583274, -1.201199, -4.332681, 0, 0, 1, 1, 1,
-0.09485951, -1.245403, -2.966683, 1, 0, 0, 1, 1,
-0.09244918, -0.189141, -3.18238, 1, 0, 0, 1, 1,
-0.08913768, -0.6434295, -1.523614, 1, 0, 0, 1, 1,
-0.08843032, 1.771092, -1.599769, 1, 0, 0, 1, 1,
-0.0883555, 0.7027927, -1.27427, 1, 0, 0, 1, 1,
-0.08678113, -0.3755184, -3.072427, 0, 0, 0, 1, 1,
-0.08561879, 1.782219, 0.5907081, 0, 0, 0, 1, 1,
-0.08464949, 3.50739, 0.1962486, 0, 0, 0, 1, 1,
-0.08250058, -0.8327038, -2.465415, 0, 0, 0, 1, 1,
-0.07862972, 0.1545502, -2.596333, 0, 0, 0, 1, 1,
-0.07842625, -1.675836, -3.88693, 0, 0, 0, 1, 1,
-0.0735691, 0.8004824, 0.02999162, 0, 0, 0, 1, 1,
-0.07221231, -1.235465, -2.421658, 1, 1, 1, 1, 1,
-0.06828785, 0.6235796, -1.33027, 1, 1, 1, 1, 1,
-0.0638443, -2.074328, -2.430582, 1, 1, 1, 1, 1,
-0.0551901, -0.4916437, -3.501261, 1, 1, 1, 1, 1,
-0.05268927, 0.1796277, 0.979912, 1, 1, 1, 1, 1,
-0.0511591, 1.434856, -2.885023, 1, 1, 1, 1, 1,
-0.05094189, 2.173599, -1.519947, 1, 1, 1, 1, 1,
-0.05022907, -0.345299, -3.184386, 1, 1, 1, 1, 1,
-0.0500065, 2.144295, 1.047293, 1, 1, 1, 1, 1,
-0.04910598, 2.07881, -0.6322395, 1, 1, 1, 1, 1,
-0.048074, -2.67626, -4.012729, 1, 1, 1, 1, 1,
-0.04793001, 1.743145, 0.897584, 1, 1, 1, 1, 1,
-0.04281928, 0.9809599, -0.5887607, 1, 1, 1, 1, 1,
-0.04033774, -1.597834, -4.069062, 1, 1, 1, 1, 1,
-0.03945046, -0.2484984, -1.49933, 1, 1, 1, 1, 1,
-0.03941192, -2.145478, -3.339122, 0, 0, 1, 1, 1,
-0.03852055, 2.298183, -0.1048265, 1, 0, 0, 1, 1,
-0.03818494, -0.5667152, -3.857806, 1, 0, 0, 1, 1,
-0.03711578, -0.6045482, -2.366838, 1, 0, 0, 1, 1,
-0.03539431, 0.01091918, -0.5309912, 1, 0, 0, 1, 1,
-0.02870093, 1.252677, -0.2958435, 1, 0, 0, 1, 1,
-0.02545598, -0.6282963, -2.806873, 0, 0, 0, 1, 1,
-0.02384805, -1.060347, -2.923011, 0, 0, 0, 1, 1,
-0.02281442, 1.038392, 0.2573767, 0, 0, 0, 1, 1,
-0.020593, 0.03891246, -0.4408142, 0, 0, 0, 1, 1,
-0.01961569, 0.05516461, -1.128401, 0, 0, 0, 1, 1,
-0.01434966, 0.8021377, 0.5997065, 0, 0, 0, 1, 1,
-0.006669305, 0.8625013, 0.01661418, 0, 0, 0, 1, 1,
-0.005204941, 2.485277, -0.9035327, 1, 1, 1, 1, 1,
-0.001041778, 0.1151054, -0.3520399, 1, 1, 1, 1, 1,
0.004631749, 0.1763236, 0.5161115, 1, 1, 1, 1, 1,
0.01565386, 0.6246008, -1.180952, 1, 1, 1, 1, 1,
0.018583, 1.756941, -0.4160564, 1, 1, 1, 1, 1,
0.0194147, 0.1209387, 1.294048, 1, 1, 1, 1, 1,
0.02188284, 0.9370902, -0.5789237, 1, 1, 1, 1, 1,
0.02712739, 0.3269367, -1.133321, 1, 1, 1, 1, 1,
0.0310121, 1.090057, -0.2098914, 1, 1, 1, 1, 1,
0.0351103, -1.831958, 4.054379, 1, 1, 1, 1, 1,
0.03560044, -0.6128535, 1.69319, 1, 1, 1, 1, 1,
0.03750574, 0.3362705, -1.275707, 1, 1, 1, 1, 1,
0.03950375, 0.5607692, -0.08498701, 1, 1, 1, 1, 1,
0.04233744, -0.2147762, 0.4593968, 1, 1, 1, 1, 1,
0.04246093, 1.412275, 0.1111058, 1, 1, 1, 1, 1,
0.0433551, 1.55797, 0.625828, 0, 0, 1, 1, 1,
0.05502778, -0.3723422, 3.846128, 1, 0, 0, 1, 1,
0.06191885, -0.8656663, 3.628981, 1, 0, 0, 1, 1,
0.06411976, -1.232604, 2.916633, 1, 0, 0, 1, 1,
0.06751418, -1.659152, 2.978154, 1, 0, 0, 1, 1,
0.07196388, -0.4082709, 0.2308203, 1, 0, 0, 1, 1,
0.07315147, 1.624266, -1.055372, 0, 0, 0, 1, 1,
0.07334682, 0.2447262, 1.680397, 0, 0, 0, 1, 1,
0.07348122, 1.352852, 2.201192, 0, 0, 0, 1, 1,
0.07595073, 0.7849475, 0.8126385, 0, 0, 0, 1, 1,
0.07601343, -1.406714, 3.108372, 0, 0, 0, 1, 1,
0.08108091, 1.185921, 1.193986, 0, 0, 0, 1, 1,
0.08773986, -0.5084377, 3.527076, 0, 0, 0, 1, 1,
0.0947701, 0.07347565, 0.9587012, 1, 1, 1, 1, 1,
0.1006304, -0.2831251, 3.328841, 1, 1, 1, 1, 1,
0.1013856, 0.6585152, 2.217664, 1, 1, 1, 1, 1,
0.1023917, -0.5475131, 2.710104, 1, 1, 1, 1, 1,
0.1071339, -1.287622, 2.519819, 1, 1, 1, 1, 1,
0.1088735, 1.797397, 0.5743312, 1, 1, 1, 1, 1,
0.1125661, 1.127319, -1.286258, 1, 1, 1, 1, 1,
0.1127263, 0.874221, 0.04525423, 1, 1, 1, 1, 1,
0.1155331, -1.292281, 2.772146, 1, 1, 1, 1, 1,
0.1169483, 0.6066268, -1.316456, 1, 1, 1, 1, 1,
0.1172457, 0.02767961, 2.280461, 1, 1, 1, 1, 1,
0.1191706, -0.05327786, 1.719966, 1, 1, 1, 1, 1,
0.1209088, 0.3201098, 0.4635807, 1, 1, 1, 1, 1,
0.1253168, 0.1692233, 1.367945, 1, 1, 1, 1, 1,
0.1262248, 1.550697, 1.485509, 1, 1, 1, 1, 1,
0.1288061, -0.2958642, 1.119696, 0, 0, 1, 1, 1,
0.1298262, -1.879943, 1.892333, 1, 0, 0, 1, 1,
0.1307362, -0.8387019, 1.49365, 1, 0, 0, 1, 1,
0.1307637, 0.9065362, 0.8743482, 1, 0, 0, 1, 1,
0.1370351, 0.3269343, 0.3087668, 1, 0, 0, 1, 1,
0.1414413, -0.6997241, 2.025416, 1, 0, 0, 1, 1,
0.1429818, 0.3670511, 3.089988, 0, 0, 0, 1, 1,
0.1441606, 0.3933644, -0.9987177, 0, 0, 0, 1, 1,
0.1446403, -0.6099938, 3.115385, 0, 0, 0, 1, 1,
0.1449596, -0.6865739, 4.731353, 0, 0, 0, 1, 1,
0.1485773, -0.4177308, 2.848625, 0, 0, 0, 1, 1,
0.1502193, 1.481225, -0.6435121, 0, 0, 0, 1, 1,
0.1507379, 0.5971014, 0.7737778, 0, 0, 0, 1, 1,
0.1517722, -1.415774, 3.132004, 1, 1, 1, 1, 1,
0.1540615, -0.602801, 2.516308, 1, 1, 1, 1, 1,
0.1555224, 1.1492, 1.062333, 1, 1, 1, 1, 1,
0.1558506, -0.7547371, 2.568884, 1, 1, 1, 1, 1,
0.1568478, 0.9117752, -0.4648251, 1, 1, 1, 1, 1,
0.159459, 0.7791065, 0.5454476, 1, 1, 1, 1, 1,
0.1599087, -0.1093459, 0.1458068, 1, 1, 1, 1, 1,
0.1666391, -0.3844136, 4.156404, 1, 1, 1, 1, 1,
0.1669522, -0.4971038, 3.066722, 1, 1, 1, 1, 1,
0.1675334, -0.2910007, 2.554261, 1, 1, 1, 1, 1,
0.1714685, -0.9099151, 3.7046, 1, 1, 1, 1, 1,
0.1716515, 0.7248747, -1.060276, 1, 1, 1, 1, 1,
0.1772104, -0.464544, 2.997195, 1, 1, 1, 1, 1,
0.1828648, 0.005552065, 1.314808, 1, 1, 1, 1, 1,
0.1861399, 1.145158, 0.1581306, 1, 1, 1, 1, 1,
0.1870186, -0.9210802, 2.72867, 0, 0, 1, 1, 1,
0.1903872, -0.03512739, 3.697052, 1, 0, 0, 1, 1,
0.1926229, 0.4634301, 0.3805091, 1, 0, 0, 1, 1,
0.1945058, -0.4691801, 2.959944, 1, 0, 0, 1, 1,
0.2006404, 0.7471164, 0.4756398, 1, 0, 0, 1, 1,
0.2082345, 0.4124056, -0.6280096, 1, 0, 0, 1, 1,
0.2099396, 0.7470329, -0.1589206, 0, 0, 0, 1, 1,
0.2134141, 0.8299453, -1.315851, 0, 0, 0, 1, 1,
0.2147592, 0.8844936, 0.5448937, 0, 0, 0, 1, 1,
0.2160667, 1.09036, 1.656289, 0, 0, 0, 1, 1,
0.2227067, 0.1128043, 1.631925, 0, 0, 0, 1, 1,
0.2280868, -0.05732413, 1.669043, 0, 0, 0, 1, 1,
0.2293727, -0.3342434, 1.1805, 0, 0, 0, 1, 1,
0.2359848, -0.184013, 1.956861, 1, 1, 1, 1, 1,
0.2418718, 1.649273, -1.43776, 1, 1, 1, 1, 1,
0.2433659, 0.3873766, 0.3642162, 1, 1, 1, 1, 1,
0.243674, 0.3933126, -0.2954341, 1, 1, 1, 1, 1,
0.25021, -1.559791, 2.193809, 1, 1, 1, 1, 1,
0.252478, 0.370516, 1.92148, 1, 1, 1, 1, 1,
0.2559433, -0.9331368, 2.65085, 1, 1, 1, 1, 1,
0.256641, -0.6346684, 2.694151, 1, 1, 1, 1, 1,
0.2568378, -1.780105, 1.200273, 1, 1, 1, 1, 1,
0.2595483, 0.9030375, 0.1627042, 1, 1, 1, 1, 1,
0.2612574, 0.5001013, 2.011978, 1, 1, 1, 1, 1,
0.2619526, -0.7308926, 3.009691, 1, 1, 1, 1, 1,
0.2652301, 1.664276, 1.157657, 1, 1, 1, 1, 1,
0.2675515, 3.163827, -0.3690965, 1, 1, 1, 1, 1,
0.2741976, 0.5735265, 0.3443426, 1, 1, 1, 1, 1,
0.2743538, -0.05360296, 3.167646, 0, 0, 1, 1, 1,
0.2745558, 1.041342, 0.2801733, 1, 0, 0, 1, 1,
0.2799794, 0.2599202, 1.325267, 1, 0, 0, 1, 1,
0.2802715, -0.05832787, 1.778143, 1, 0, 0, 1, 1,
0.2810459, -0.2826596, 0.1383549, 1, 0, 0, 1, 1,
0.282007, 0.2272061, 0.1405552, 1, 0, 0, 1, 1,
0.2832958, -0.2871687, 2.004962, 0, 0, 0, 1, 1,
0.2847238, 0.1522046, -1.94639, 0, 0, 0, 1, 1,
0.2857488, -0.9766643, 2.39994, 0, 0, 0, 1, 1,
0.2857876, 0.920448, 2.302431, 0, 0, 0, 1, 1,
0.2888806, -0.8838191, 3.650382, 0, 0, 0, 1, 1,
0.2896406, 1.305763, -0.09439047, 0, 0, 0, 1, 1,
0.2995452, -1.707418, 3.353458, 0, 0, 0, 1, 1,
0.3011804, -1.919986, 2.358209, 1, 1, 1, 1, 1,
0.3030883, 0.891983, -0.461609, 1, 1, 1, 1, 1,
0.3109103, 1.081077, 0.4829707, 1, 1, 1, 1, 1,
0.3187995, -0.04862414, 0.8132353, 1, 1, 1, 1, 1,
0.3198489, -0.7508112, 4.536627, 1, 1, 1, 1, 1,
0.3217992, -0.6692138, 4.090443, 1, 1, 1, 1, 1,
0.3410553, -0.6189612, 3.796908, 1, 1, 1, 1, 1,
0.3442346, -0.1029806, 3.225912, 1, 1, 1, 1, 1,
0.3504476, 0.2260657, 2.101915, 1, 1, 1, 1, 1,
0.3524618, 0.2885566, 1.527085, 1, 1, 1, 1, 1,
0.3546405, -0.0711437, -0.1478994, 1, 1, 1, 1, 1,
0.35843, 0.2219016, 1.125144, 1, 1, 1, 1, 1,
0.3759376, -0.3542535, 3.77735, 1, 1, 1, 1, 1,
0.3811729, -1.237675, 3.249287, 1, 1, 1, 1, 1,
0.3860424, 0.6866484, 0.02003363, 1, 1, 1, 1, 1,
0.3915601, -1.009179, 2.150869, 0, 0, 1, 1, 1,
0.394166, -0.2855936, 1.384908, 1, 0, 0, 1, 1,
0.3956552, -1.359287, 2.961766, 1, 0, 0, 1, 1,
0.3959353, -0.7947006, 4.120712, 1, 0, 0, 1, 1,
0.4053169, -0.4787062, 1.141687, 1, 0, 0, 1, 1,
0.4091546, -0.603594, 2.88732, 1, 0, 0, 1, 1,
0.409883, 0.9643382, 0.4534918, 0, 0, 0, 1, 1,
0.4137861, -0.3348438, 4.075315, 0, 0, 0, 1, 1,
0.4179535, -2.058041, 3.65903, 0, 0, 0, 1, 1,
0.4181201, -1.418572, 3.246672, 0, 0, 0, 1, 1,
0.4186063, -1.814198, 2.34744, 0, 0, 0, 1, 1,
0.4201306, 0.2401596, 2.364069, 0, 0, 0, 1, 1,
0.4260562, 0.5131938, -0.4366221, 0, 0, 0, 1, 1,
0.4281247, -1.63469, 1.648457, 1, 1, 1, 1, 1,
0.4329616, -1.148725, 3.464807, 1, 1, 1, 1, 1,
0.4357879, 0.2992955, 0.03727893, 1, 1, 1, 1, 1,
0.4398556, -1.114317, 3.091859, 1, 1, 1, 1, 1,
0.4416842, -0.8050932, 1.531853, 1, 1, 1, 1, 1,
0.444875, 2.127708, 0.1963227, 1, 1, 1, 1, 1,
0.4482978, 0.2632469, 2.899632, 1, 1, 1, 1, 1,
0.4518458, 0.5086514, -0.1655114, 1, 1, 1, 1, 1,
0.4534959, 0.6687135, 1.105687, 1, 1, 1, 1, 1,
0.4559516, 1.342809, 0.477851, 1, 1, 1, 1, 1,
0.4568392, -0.598323, 2.456245, 1, 1, 1, 1, 1,
0.4574543, -0.576992, 0.4361924, 1, 1, 1, 1, 1,
0.4596133, 0.1593975, 0.1192083, 1, 1, 1, 1, 1,
0.4637913, 0.01034583, 0.9729543, 1, 1, 1, 1, 1,
0.4646223, -1.119316, 1.571998, 1, 1, 1, 1, 1,
0.4660455, -0.7473443, 1.34488, 0, 0, 1, 1, 1,
0.4680269, 2.163917, 0.1151095, 1, 0, 0, 1, 1,
0.4682323, -0.05840305, 3.25814, 1, 0, 0, 1, 1,
0.4712195, -0.3202335, 3.44942, 1, 0, 0, 1, 1,
0.4765304, 1.032205, 0.3817935, 1, 0, 0, 1, 1,
0.476705, 0.7632501, -0.08741771, 1, 0, 0, 1, 1,
0.4807821, 0.7892175, -1.638029, 0, 0, 0, 1, 1,
0.4858883, -0.7168745, 0.9595637, 0, 0, 0, 1, 1,
0.4934499, 1.321968, 0.05842979, 0, 0, 0, 1, 1,
0.4946188, -0.4010684, 2.577036, 0, 0, 0, 1, 1,
0.5137237, 0.09593304, -0.6300468, 0, 0, 0, 1, 1,
0.5153592, -0.8982848, 0.3453879, 0, 0, 0, 1, 1,
0.5434532, 0.07877539, -0.5865092, 0, 0, 0, 1, 1,
0.5437147, 0.2531757, 1.802133, 1, 1, 1, 1, 1,
0.5500349, -1.521161, 2.530518, 1, 1, 1, 1, 1,
0.5507452, -0.2337223, 1.345377, 1, 1, 1, 1, 1,
0.5537148, -1.11938, 3.754346, 1, 1, 1, 1, 1,
0.5568932, -0.05636745, 0.8927535, 1, 1, 1, 1, 1,
0.5636321, -1.002656, 3.23386, 1, 1, 1, 1, 1,
0.566631, -1.32063, 3.572388, 1, 1, 1, 1, 1,
0.5685449, 0.9061515, -1.617597, 1, 1, 1, 1, 1,
0.5708178, -1.968207, 3.154262, 1, 1, 1, 1, 1,
0.5723234, -0.3648779, 1.3913, 1, 1, 1, 1, 1,
0.5769839, 1.164599, -0.1832513, 1, 1, 1, 1, 1,
0.5798844, 0.1183877, -0.8921015, 1, 1, 1, 1, 1,
0.5823649, 0.8362619, 0.5557265, 1, 1, 1, 1, 1,
0.5876015, 0.9090539, 0.497244, 1, 1, 1, 1, 1,
0.5877328, -1.531002, 3.734799, 1, 1, 1, 1, 1,
0.589355, 0.6278684, -0.007882242, 0, 0, 1, 1, 1,
0.5905522, 1.443011, -0.3505749, 1, 0, 0, 1, 1,
0.5921589, -1.840016, 3.739762, 1, 0, 0, 1, 1,
0.5923271, -1.129497, 1.646128, 1, 0, 0, 1, 1,
0.5924883, -1.175604, 4.40579, 1, 0, 0, 1, 1,
0.5928743, -0.5636203, 1.480036, 1, 0, 0, 1, 1,
0.5953376, -0.5457325, 3.069333, 0, 0, 0, 1, 1,
0.5970859, -0.551605, 3.25008, 0, 0, 0, 1, 1,
0.5981319, -0.7479703, 0.3891842, 0, 0, 0, 1, 1,
0.6022087, -0.4462243, 2.175104, 0, 0, 0, 1, 1,
0.6044427, -0.6962683, 2.015333, 0, 0, 0, 1, 1,
0.607726, -1.73176, 1.707848, 0, 0, 0, 1, 1,
0.6208583, -1.056839, 2.664453, 0, 0, 0, 1, 1,
0.6210957, 0.5653905, -0.6747898, 1, 1, 1, 1, 1,
0.6230418, 1.792336, -0.4069759, 1, 1, 1, 1, 1,
0.6238639, -0.007823571, 2.171615, 1, 1, 1, 1, 1,
0.6296523, -1.023529, 3.258969, 1, 1, 1, 1, 1,
0.630815, 1.610569, 0.6788321, 1, 1, 1, 1, 1,
0.6312565, 0.4434728, 1.15126, 1, 1, 1, 1, 1,
0.6326501, -0.02144657, 0.838446, 1, 1, 1, 1, 1,
0.6385845, 0.1717225, 2.242411, 1, 1, 1, 1, 1,
0.6471226, 0.4199858, 0.1761447, 1, 1, 1, 1, 1,
0.6524766, 0.8219134, -0.3308284, 1, 1, 1, 1, 1,
0.655888, 0.3085507, 0.5648738, 1, 1, 1, 1, 1,
0.6602206, -0.6205962, 1.017892, 1, 1, 1, 1, 1,
0.6653646, -0.5816448, 1.347193, 1, 1, 1, 1, 1,
0.6690112, -1.391059, 2.462489, 1, 1, 1, 1, 1,
0.6706641, -1.341317, 1.782431, 1, 1, 1, 1, 1,
0.6708423, -0.62324, 2.947387, 0, 0, 1, 1, 1,
0.6756476, 0.9313577, 0.6506946, 1, 0, 0, 1, 1,
0.676738, -1.706544, 2.5799, 1, 0, 0, 1, 1,
0.6777812, -0.141542, 2.15455, 1, 0, 0, 1, 1,
0.6791294, -1.297022, 1.049515, 1, 0, 0, 1, 1,
0.6811469, -0.6677336, 1.058711, 1, 0, 0, 1, 1,
0.683202, -0.132732, 2.194482, 0, 0, 0, 1, 1,
0.6865526, -1.510083, 2.620891, 0, 0, 0, 1, 1,
0.6884282, 0.03023682, 1.904572, 0, 0, 0, 1, 1,
0.6894999, 0.5092834, 1.211182, 0, 0, 0, 1, 1,
0.6939465, -0.186814, 1.484502, 0, 0, 0, 1, 1,
0.7057893, 0.2395998, 1.041196, 0, 0, 0, 1, 1,
0.7075399, -2.479526, 3.63803, 0, 0, 0, 1, 1,
0.7083072, -1.47234, 3.01691, 1, 1, 1, 1, 1,
0.7103844, -1.270193, 2.577949, 1, 1, 1, 1, 1,
0.7122409, -0.1869654, 0.4449135, 1, 1, 1, 1, 1,
0.7126151, -0.8942893, 3.72404, 1, 1, 1, 1, 1,
0.7139427, -1.008972, 3.016668, 1, 1, 1, 1, 1,
0.7180368, 0.03804776, 1.167858, 1, 1, 1, 1, 1,
0.7189141, -0.1683671, 2.399661, 1, 1, 1, 1, 1,
0.7221982, -0.140098, 0.7976806, 1, 1, 1, 1, 1,
0.7255603, -0.5253765, 0.8511811, 1, 1, 1, 1, 1,
0.7283273, -0.941097, 3.607547, 1, 1, 1, 1, 1,
0.7368392, -1.341829, 0.6254846, 1, 1, 1, 1, 1,
0.7404858, 1.009627, 0.2262929, 1, 1, 1, 1, 1,
0.7416816, 0.6846334, -1.707791, 1, 1, 1, 1, 1,
0.7420491, -0.7368624, 2.92664, 1, 1, 1, 1, 1,
0.7441519, -0.7751951, 2.92955, 1, 1, 1, 1, 1,
0.7454696, 0.06805383, 0.213547, 0, 0, 1, 1, 1,
0.7455858, 0.7003187, 0.8506745, 1, 0, 0, 1, 1,
0.7476568, 0.01920664, 0.6951361, 1, 0, 0, 1, 1,
0.7498719, -0.4217299, 3.360047, 1, 0, 0, 1, 1,
0.7540128, -0.07233796, 2.589211, 1, 0, 0, 1, 1,
0.7548259, -0.8207719, 1.412941, 1, 0, 0, 1, 1,
0.7550442, -1.114268, 3.188812, 0, 0, 0, 1, 1,
0.75798, 1.632414, 0.8074271, 0, 0, 0, 1, 1,
0.7693089, -0.002392691, 1.530056, 0, 0, 0, 1, 1,
0.7696182, -0.808096, 3.467108, 0, 0, 0, 1, 1,
0.7719468, -0.6146089, 5.508749, 0, 0, 0, 1, 1,
0.7737527, 0.7410732, 1.590923, 0, 0, 0, 1, 1,
0.7770084, 0.7088452, -0.07263437, 0, 0, 0, 1, 1,
0.7773258, -2.805821, 2.981754, 1, 1, 1, 1, 1,
0.7835002, 1.987101, 0.03369509, 1, 1, 1, 1, 1,
0.7860597, 0.6405004, 1.75714, 1, 1, 1, 1, 1,
0.7906165, -0.08779655, 3.02204, 1, 1, 1, 1, 1,
0.7973657, -0.2831207, 1.761777, 1, 1, 1, 1, 1,
0.797846, -0.36893, 0.527638, 1, 1, 1, 1, 1,
0.8017089, 1.350373, -0.3887998, 1, 1, 1, 1, 1,
0.8023866, 0.4172013, 1.829988, 1, 1, 1, 1, 1,
0.8038971, -0.5837387, 0.9972652, 1, 1, 1, 1, 1,
0.8102908, 0.3747716, 0.9996061, 1, 1, 1, 1, 1,
0.8116801, 0.7854231, -0.8957278, 1, 1, 1, 1, 1,
0.8137498, -0.6198077, 1.84115, 1, 1, 1, 1, 1,
0.8156484, -0.7674764, 3.598848, 1, 1, 1, 1, 1,
0.820776, 1.767592, 1.624294, 1, 1, 1, 1, 1,
0.822064, 1.63398, 1.289468, 1, 1, 1, 1, 1,
0.8298012, 0.2029268, 1.845735, 0, 0, 1, 1, 1,
0.8310076, 1.212211, 0.04691798, 1, 0, 0, 1, 1,
0.8323451, -0.5141528, 1.705442, 1, 0, 0, 1, 1,
0.8339952, -2.860152, 4.491317, 1, 0, 0, 1, 1,
0.8500303, -0.1123566, 2.401971, 1, 0, 0, 1, 1,
0.8502079, 1.534827, 1.453273, 1, 0, 0, 1, 1,
0.8502967, -2.007195, 2.375102, 0, 0, 0, 1, 1,
0.8569283, 0.3703103, 1.701433, 0, 0, 0, 1, 1,
0.8577755, 0.7980828, -0.9844904, 0, 0, 0, 1, 1,
0.8663931, -1.193725, 1.826957, 0, 0, 0, 1, 1,
0.8686141, -0.8268524, 4.62243, 0, 0, 0, 1, 1,
0.8777685, 1.627485, 0.2929745, 0, 0, 0, 1, 1,
0.8784403, 0.2464464, -0.04803789, 0, 0, 0, 1, 1,
0.8818069, 2.014014, 1.815034, 1, 1, 1, 1, 1,
0.8885139, -1.312734, 2.234434, 1, 1, 1, 1, 1,
0.8940612, 0.6776307, 1.611088, 1, 1, 1, 1, 1,
0.8972269, -0.04060145, 0.6976854, 1, 1, 1, 1, 1,
0.9086624, 0.7285017, 1.169737, 1, 1, 1, 1, 1,
0.9088964, 0.2110745, 1.432882, 1, 1, 1, 1, 1,
0.9091921, -0.6432607, 2.102911, 1, 1, 1, 1, 1,
0.9096761, -0.01786376, 2.700461, 1, 1, 1, 1, 1,
0.9271435, -1.538652, 2.430719, 1, 1, 1, 1, 1,
0.9290137, 1.766045, 1.474929, 1, 1, 1, 1, 1,
0.9350857, 0.3294709, 1.456855, 1, 1, 1, 1, 1,
0.9371021, 0.04250281, 0.5707275, 1, 1, 1, 1, 1,
0.9420035, -0.3535452, 2.066469, 1, 1, 1, 1, 1,
0.9453141, 0.2713315, 2.044672, 1, 1, 1, 1, 1,
0.9484261, 0.3879189, 0.9887995, 1, 1, 1, 1, 1,
0.9501352, -2.625329, 2.901016, 0, 0, 1, 1, 1,
0.9505131, 0.01465465, 1.284544, 1, 0, 0, 1, 1,
0.9644474, 1.147625, 1.175908, 1, 0, 0, 1, 1,
0.9715788, -1.456686, 1.283493, 1, 0, 0, 1, 1,
0.9722581, -0.5142553, 3.448814, 1, 0, 0, 1, 1,
0.9738437, -1.183367, -0.5016291, 1, 0, 0, 1, 1,
0.9753035, -0.5092615, 0.7856167, 0, 0, 0, 1, 1,
0.9787723, 1.452256, 1.268113, 0, 0, 0, 1, 1,
0.9832286, 0.7930583, 0.8680393, 0, 0, 0, 1, 1,
0.9867761, -0.718349, 2.546489, 0, 0, 0, 1, 1,
0.9936365, 1.973928, 0.408714, 0, 0, 0, 1, 1,
1.004851, -0.8778169, 0.1472933, 0, 0, 0, 1, 1,
1.015667, -0.7658162, 2.214607, 0, 0, 0, 1, 1,
1.019396, 1.368759, 0.1085143, 1, 1, 1, 1, 1,
1.023439, -2.255836, 5.695313, 1, 1, 1, 1, 1,
1.023621, 0.07178889, 1.133226, 1, 1, 1, 1, 1,
1.028249, -0.2835394, 1.877463, 1, 1, 1, 1, 1,
1.028992, 1.559253, -0.2674319, 1, 1, 1, 1, 1,
1.030358, 0.4140519, 0.5646479, 1, 1, 1, 1, 1,
1.031778, -0.2881422, 0.9710553, 1, 1, 1, 1, 1,
1.033273, 1.84449, 1.071411, 1, 1, 1, 1, 1,
1.035785, -0.934648, 1.489668, 1, 1, 1, 1, 1,
1.035964, 0.6381642, 1.815077, 1, 1, 1, 1, 1,
1.044293, -0.7118257, 2.269218, 1, 1, 1, 1, 1,
1.044913, 2.102757, 2.252828, 1, 1, 1, 1, 1,
1.047445, 0.3204925, 1.673776, 1, 1, 1, 1, 1,
1.063985, -1.163597, 5.547108, 1, 1, 1, 1, 1,
1.067123, 0.4198478, 1.83036, 1, 1, 1, 1, 1,
1.067285, 0.8501394, 1.3898, 0, 0, 1, 1, 1,
1.070798, 0.006553808, 3.531123, 1, 0, 0, 1, 1,
1.071428, 0.08238208, 0.9782999, 1, 0, 0, 1, 1,
1.078513, -1.110046, 1.473518, 1, 0, 0, 1, 1,
1.082221, -0.1501641, 1.654216, 1, 0, 0, 1, 1,
1.082908, -1.477772, 2.739868, 1, 0, 0, 1, 1,
1.085806, 0.1127099, 1.011104, 0, 0, 0, 1, 1,
1.086383, 0.422163, 1.32245, 0, 0, 0, 1, 1,
1.091226, 0.352779, 1.912684, 0, 0, 0, 1, 1,
1.093601, 0.1602958, -0.4372654, 0, 0, 0, 1, 1,
1.099526, -1.082138, 3.124566, 0, 0, 0, 1, 1,
1.105776, 0.305995, 0.5216625, 0, 0, 0, 1, 1,
1.106691, 1.704388, 2.251111, 0, 0, 0, 1, 1,
1.107793, 0.04512043, 2.402029, 1, 1, 1, 1, 1,
1.108991, 0.6257048, 0.7962309, 1, 1, 1, 1, 1,
1.109452, -0.4533926, 0.8469168, 1, 1, 1, 1, 1,
1.111006, 0.7257318, 3.026711, 1, 1, 1, 1, 1,
1.111576, -0.189203, 2.392168, 1, 1, 1, 1, 1,
1.121024, -0.9593174, 1.592931, 1, 1, 1, 1, 1,
1.127914, -0.4223545, 0.7300481, 1, 1, 1, 1, 1,
1.128124, 0.7773008, 2.00371, 1, 1, 1, 1, 1,
1.129817, 1.424802, 0.1375124, 1, 1, 1, 1, 1,
1.132165, 0.01579318, -0.3058482, 1, 1, 1, 1, 1,
1.134748, 0.7879444, 2.324992, 1, 1, 1, 1, 1,
1.135871, 0.708123, 0.7366152, 1, 1, 1, 1, 1,
1.138417, -1.096621, 1.777633, 1, 1, 1, 1, 1,
1.147626, 0.9146513, 0.6897534, 1, 1, 1, 1, 1,
1.152571, 0.4190352, 2.259416, 1, 1, 1, 1, 1,
1.163971, 1.079064, -0.9339885, 0, 0, 1, 1, 1,
1.166601, 0.7546215, 2.304064, 1, 0, 0, 1, 1,
1.166783, -0.3515995, 0.9026706, 1, 0, 0, 1, 1,
1.167787, 0.2781991, 0.1814323, 1, 0, 0, 1, 1,
1.173235, 0.5689877, 2.788013, 1, 0, 0, 1, 1,
1.173443, 0.6869986, 1.641852, 1, 0, 0, 1, 1,
1.197399, -0.9556523, 3.662677, 0, 0, 0, 1, 1,
1.198637, 0.1981729, 2.707232, 0, 0, 0, 1, 1,
1.204505, -0.9383436, 3.576906, 0, 0, 0, 1, 1,
1.20498, 0.3615385, -0.7433149, 0, 0, 0, 1, 1,
1.206641, -0.09693645, -0.3454209, 0, 0, 0, 1, 1,
1.210546, -0.4450362, 0.5354801, 0, 0, 0, 1, 1,
1.216743, 0.3084035, -0.3176965, 0, 0, 0, 1, 1,
1.224208, -0.6808597, 1.649256, 1, 1, 1, 1, 1,
1.235469, 1.112162, 2.477865, 1, 1, 1, 1, 1,
1.238713, -0.3061217, 3.433244, 1, 1, 1, 1, 1,
1.240541, -0.5039847, 1.614203, 1, 1, 1, 1, 1,
1.248201, 0.5634186, 1.704073, 1, 1, 1, 1, 1,
1.265092, -0.8319761, 1.07976, 1, 1, 1, 1, 1,
1.267462, 1.000565, 0.6020833, 1, 1, 1, 1, 1,
1.26843, -0.9301943, 3.776563, 1, 1, 1, 1, 1,
1.273683, -0.6938041, 1.515887, 1, 1, 1, 1, 1,
1.273751, 1.25061, 1.293088, 1, 1, 1, 1, 1,
1.280782, -1.302202, 3.626939, 1, 1, 1, 1, 1,
1.284488, 0.2138394, 1.778871, 1, 1, 1, 1, 1,
1.290555, 0.974211, 1.158948, 1, 1, 1, 1, 1,
1.310313, 0.9358964, 1.136676, 1, 1, 1, 1, 1,
1.312689, 1.018639, 2.520159, 1, 1, 1, 1, 1,
1.317592, 0.7852353, 0.1723572, 0, 0, 1, 1, 1,
1.323883, -0.1475773, 1.519656, 1, 0, 0, 1, 1,
1.326537, 0.1228947, 1.877484, 1, 0, 0, 1, 1,
1.329661, 0.1588467, 2.435603, 1, 0, 0, 1, 1,
1.330895, -0.4102744, 2.027574, 1, 0, 0, 1, 1,
1.33692, 0.3529052, 0.8137866, 1, 0, 0, 1, 1,
1.346976, 0.924, -0.2385301, 0, 0, 0, 1, 1,
1.355762, -0.2113385, 1.543888, 0, 0, 0, 1, 1,
1.356085, 0.3295064, 1.604269, 0, 0, 0, 1, 1,
1.358314, -0.9032045, 0.9090691, 0, 0, 0, 1, 1,
1.362609, 0.02724027, 3.619503, 0, 0, 0, 1, 1,
1.371721, 0.07066955, 0.5983913, 0, 0, 0, 1, 1,
1.37262, 1.153657, 1.496865, 0, 0, 0, 1, 1,
1.37465, 0.8930959, 1.820123, 1, 1, 1, 1, 1,
1.383858, -1.546673, 3.659538, 1, 1, 1, 1, 1,
1.387293, 0.9303505, 0.8619769, 1, 1, 1, 1, 1,
1.416918, 0.6101368, 2.215423, 1, 1, 1, 1, 1,
1.423502, -0.1741167, 2.212694, 1, 1, 1, 1, 1,
1.424677, -0.3824124, 0.369022, 1, 1, 1, 1, 1,
1.428274, 0.7099198, 1.034318, 1, 1, 1, 1, 1,
1.435172, 0.1462544, 3.273382, 1, 1, 1, 1, 1,
1.446018, -0.69788, 2.062207, 1, 1, 1, 1, 1,
1.459267, -0.2256647, 2.695569, 1, 1, 1, 1, 1,
1.460837, 0.3664117, 2.427374, 1, 1, 1, 1, 1,
1.490118, 0.2146025, 3.382569, 1, 1, 1, 1, 1,
1.491216, 1.019993, 0.3449279, 1, 1, 1, 1, 1,
1.500161, 0.06744877, 1.626047, 1, 1, 1, 1, 1,
1.50211, 0.8039467, 1.395447, 1, 1, 1, 1, 1,
1.511745, -0.5762025, 1.087681, 0, 0, 1, 1, 1,
1.537989, -0.7018422, 1.737194, 1, 0, 0, 1, 1,
1.556255, 0.1816543, -0.252562, 1, 0, 0, 1, 1,
1.563411, 0.3530067, 1.986733, 1, 0, 0, 1, 1,
1.564037, 0.02326111, 0.9095709, 1, 0, 0, 1, 1,
1.566195, -1.536048, 4.913058, 1, 0, 0, 1, 1,
1.566662, -0.2812391, -0.176093, 0, 0, 0, 1, 1,
1.57199, -0.05768325, 1.401491, 0, 0, 0, 1, 1,
1.574173, -0.3824158, 1.236348, 0, 0, 0, 1, 1,
1.574637, -0.0725066, 2.420425, 0, 0, 0, 1, 1,
1.582714, -0.3255317, 3.520866, 0, 0, 0, 1, 1,
1.587499, -0.4378897, -0.3221645, 0, 0, 0, 1, 1,
1.594961, -0.1521761, 0.878823, 0, 0, 0, 1, 1,
1.595796, 0.9972508, 1.595244, 1, 1, 1, 1, 1,
1.603409, -0.4050823, 2.126012, 1, 1, 1, 1, 1,
1.616177, 2.143638, 1.346048, 1, 1, 1, 1, 1,
1.622931, -1.059774, 0.3215244, 1, 1, 1, 1, 1,
1.625802, 0.7558751, 1.160579, 1, 1, 1, 1, 1,
1.62692, -1.308272, 3.463653, 1, 1, 1, 1, 1,
1.629556, -0.3962788, 2.679759, 1, 1, 1, 1, 1,
1.663891, -1.416224, 1.718967, 1, 1, 1, 1, 1,
1.676204, 0.1050985, 0.324401, 1, 1, 1, 1, 1,
1.689731, -0.7917752, 3.454857, 1, 1, 1, 1, 1,
1.704387, -0.1283287, 2.240323, 1, 1, 1, 1, 1,
1.715637, 0.95289, -0.009771347, 1, 1, 1, 1, 1,
1.717842, 0.1030836, 0.5382909, 1, 1, 1, 1, 1,
1.722088, -0.1176087, 1.856439, 1, 1, 1, 1, 1,
1.733681, -0.3124336, 1.677441, 1, 1, 1, 1, 1,
1.73604, 0.6725368, 1.412245, 0, 0, 1, 1, 1,
1.749636, -0.3217904, 1.799333, 1, 0, 0, 1, 1,
1.7574, 1.339369, 0.5655184, 1, 0, 0, 1, 1,
1.768513, -0.8203008, 2.833594, 1, 0, 0, 1, 1,
1.769031, -0.4764142, 1.761288, 1, 0, 0, 1, 1,
1.785967, -0.9129204, 2.925343, 1, 0, 0, 1, 1,
1.807142, 1.418294, 0.4004839, 0, 0, 0, 1, 1,
1.815474, 0.6547652, 2.29471, 0, 0, 0, 1, 1,
1.830709, -0.7492964, 2.200417, 0, 0, 0, 1, 1,
1.836195, 0.4358555, 1.826022, 0, 0, 0, 1, 1,
1.843532, 0.9712817, 2.596715, 0, 0, 0, 1, 1,
1.863943, -0.2850545, 1.51064, 0, 0, 0, 1, 1,
1.865155, 0.4950731, 1.169969, 0, 0, 0, 1, 1,
1.878028, -0.7629988, 2.092922, 1, 1, 1, 1, 1,
1.894709, 0.7481881, -0.4238798, 1, 1, 1, 1, 1,
1.896082, 1.669939, 0.7813026, 1, 1, 1, 1, 1,
1.898992, 1.024376, 1.952849, 1, 1, 1, 1, 1,
1.912791, -0.2953704, 1.182702, 1, 1, 1, 1, 1,
1.925458, -0.06445812, 1.004765, 1, 1, 1, 1, 1,
1.92843, 0.36206, 2.131836, 1, 1, 1, 1, 1,
1.928684, -1.325783, 1.000091, 1, 1, 1, 1, 1,
1.929795, 1.775702, 0.6483743, 1, 1, 1, 1, 1,
1.933235, -0.4748223, 1.215434, 1, 1, 1, 1, 1,
1.937909, 0.3894525, 0.8046649, 1, 1, 1, 1, 1,
1.939941, 0.01050966, 0.5166798, 1, 1, 1, 1, 1,
1.944839, -0.3945202, 2.777667, 1, 1, 1, 1, 1,
1.962998, -1.084805, 2.761154, 1, 1, 1, 1, 1,
1.973488, -0.2854427, 1.698129, 1, 1, 1, 1, 1,
2.002084, 1.449643, 0.2126634, 0, 0, 1, 1, 1,
2.047519, -0.7299062, 1.723008, 1, 0, 0, 1, 1,
2.061628, -1.611749, 2.385399, 1, 0, 0, 1, 1,
2.067681, -0.3967962, 1.312057, 1, 0, 0, 1, 1,
2.068305, -0.1116738, 1.471086, 1, 0, 0, 1, 1,
2.122246, -0.2629628, 3.231768, 1, 0, 0, 1, 1,
2.126429, -1.038914, 2.515596, 0, 0, 0, 1, 1,
2.130769, 0.4205526, 0.2420023, 0, 0, 0, 1, 1,
2.140718, -1.114614, 2.604031, 0, 0, 0, 1, 1,
2.142402, 1.804757, 0.888198, 0, 0, 0, 1, 1,
2.147083, -0.01709484, 1.217759, 0, 0, 0, 1, 1,
2.183075, 0.7037447, 2.29613, 0, 0, 0, 1, 1,
2.214271, 0.1426359, 1.158844, 0, 0, 0, 1, 1,
2.293602, -0.5158443, 1.399023, 1, 1, 1, 1, 1,
2.379772, 0.5475809, 0.1466024, 1, 1, 1, 1, 1,
2.560615, -0.8469805, 2.782406, 1, 1, 1, 1, 1,
2.575465, 0.8201329, -0.3156323, 1, 1, 1, 1, 1,
2.592579, -0.7914972, 2.290918, 1, 1, 1, 1, 1,
2.891808, 0.6183525, 1.14905, 1, 1, 1, 1, 1,
3.061906, 0.3728726, 1.47476, 1, 1, 1, 1, 1
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
var radius = 9.508604;
var distance = 33.39857;
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
mvMatrix.translate( 0.1865697, -0.3236191, -0.4368424 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.39857);
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