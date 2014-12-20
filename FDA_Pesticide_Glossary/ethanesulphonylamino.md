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
-3.216258, 0.9773499, -2.172568, 1, 0, 0, 1,
-2.908722, 0.1824069, -1.784454, 1, 0.007843138, 0, 1,
-2.699512, 0.4189966, -2.432778, 1, 0.01176471, 0, 1,
-2.669957, 1.057907, -0.3315216, 1, 0.01960784, 0, 1,
-2.66655, -0.142701, -0.8722806, 1, 0.02352941, 0, 1,
-2.648908, 0.3865123, -3.377836, 1, 0.03137255, 0, 1,
-2.605359, -0.3948525, -2.46071, 1, 0.03529412, 0, 1,
-2.605211, 1.465703, -0.3686356, 1, 0.04313726, 0, 1,
-2.564183, -1.159501, -0.686427, 1, 0.04705882, 0, 1,
-2.557668, 0.6627243, -1.748691, 1, 0.05490196, 0, 1,
-2.413794, 0.9760173, -0.9761643, 1, 0.05882353, 0, 1,
-2.353835, 0.6070457, 0.2845302, 1, 0.06666667, 0, 1,
-2.313705, 0.4127483, -1.918169, 1, 0.07058824, 0, 1,
-2.298383, 0.538142, -3.331437, 1, 0.07843138, 0, 1,
-2.259107, -1.308158, -1.614555, 1, 0.08235294, 0, 1,
-2.25056, -0.4176925, -2.363826, 1, 0.09019608, 0, 1,
-2.163774, 1.70721, -0.7800055, 1, 0.09411765, 0, 1,
-2.158218, -0.3973637, -2.179074, 1, 0.1019608, 0, 1,
-2.115098, 1.939572, 0.1202051, 1, 0.1098039, 0, 1,
-2.08051, 0.9413368, -1.280396, 1, 0.1137255, 0, 1,
-2.061042, 0.8958146, -0.871777, 1, 0.1215686, 0, 1,
-2.054954, 1.113865, -2.527926, 1, 0.1254902, 0, 1,
-2.049031, 1.272073, -1.186944, 1, 0.1333333, 0, 1,
-2.04162, -1.031588, -2.113209, 1, 0.1372549, 0, 1,
-2.025295, 0.7344967, -1.281411, 1, 0.145098, 0, 1,
-2.013327, 2.538524, -0.4801068, 1, 0.1490196, 0, 1,
-2.010436, -1.783861, -2.150359, 1, 0.1568628, 0, 1,
-2.004722, -1.195434, -2.621046, 1, 0.1607843, 0, 1,
-1.999464, -0.5689265, -4.178694, 1, 0.1686275, 0, 1,
-1.966964, 0.6610317, 0.08840462, 1, 0.172549, 0, 1,
-1.94085, -1.932334, -2.880873, 1, 0.1803922, 0, 1,
-1.936628, -0.5098006, 1.154693, 1, 0.1843137, 0, 1,
-1.907414, -1.553748, -1.659171, 1, 0.1921569, 0, 1,
-1.884546, 0.205389, -2.798392, 1, 0.1960784, 0, 1,
-1.874049, -0.3823419, -1.979004, 1, 0.2039216, 0, 1,
-1.872972, -1.651542, -1.381023, 1, 0.2117647, 0, 1,
-1.866469, -0.2403224, -3.397485, 1, 0.2156863, 0, 1,
-1.846548, -0.6421848, -0.9217193, 1, 0.2235294, 0, 1,
-1.832758, 0.4686139, -0.7964116, 1, 0.227451, 0, 1,
-1.820058, -1.190076, -3.371509, 1, 0.2352941, 0, 1,
-1.805852, -0.3625996, -1.118537, 1, 0.2392157, 0, 1,
-1.790559, -1.079429, -3.134698, 1, 0.2470588, 0, 1,
-1.782645, -0.3928802, 0.2024821, 1, 0.2509804, 0, 1,
-1.777649, -0.2146816, -0.9588478, 1, 0.2588235, 0, 1,
-1.754055, -2.289017, -2.37307, 1, 0.2627451, 0, 1,
-1.736988, 2.812296, -1.625824, 1, 0.2705882, 0, 1,
-1.725674, -0.8710479, -2.340848, 1, 0.2745098, 0, 1,
-1.723933, 0.2991507, -1.265951, 1, 0.282353, 0, 1,
-1.723326, 2.361653, -1.329312, 1, 0.2862745, 0, 1,
-1.702735, -0.4186899, -1.227435, 1, 0.2941177, 0, 1,
-1.69593, -0.8963673, -2.647545, 1, 0.3019608, 0, 1,
-1.6884, -1.524105, -3.012717, 1, 0.3058824, 0, 1,
-1.688396, -2.792631, -1.571862, 1, 0.3137255, 0, 1,
-1.682198, -1.208709, -2.16726, 1, 0.3176471, 0, 1,
-1.670076, 0.6500378, -1.202219, 1, 0.3254902, 0, 1,
-1.668477, -0.001309774, -1.339016, 1, 0.3294118, 0, 1,
-1.661121, -0.0530698, -2.06566, 1, 0.3372549, 0, 1,
-1.656882, 0.4433653, -3.726345, 1, 0.3411765, 0, 1,
-1.651107, -0.8491848, -1.465111, 1, 0.3490196, 0, 1,
-1.635922, 0.6244164, -1.383122, 1, 0.3529412, 0, 1,
-1.619072, -0.6692467, -2.56694, 1, 0.3607843, 0, 1,
-1.611785, -0.08389747, -1.884631, 1, 0.3647059, 0, 1,
-1.590566, 0.09394185, -0.6277887, 1, 0.372549, 0, 1,
-1.586006, 0.2185193, -0.6998357, 1, 0.3764706, 0, 1,
-1.58075, -0.4979741, -1.431428, 1, 0.3843137, 0, 1,
-1.579779, 1.419568, -0.9914352, 1, 0.3882353, 0, 1,
-1.579594, -0.3106389, -1.089374, 1, 0.3960784, 0, 1,
-1.562988, 0.3948351, 0.4691143, 1, 0.4039216, 0, 1,
-1.557305, -1.27027, -4.006981, 1, 0.4078431, 0, 1,
-1.555654, 0.7126935, 0.7659732, 1, 0.4156863, 0, 1,
-1.546595, -1.80932, -1.939885, 1, 0.4196078, 0, 1,
-1.531235, 0.4580686, -2.574196, 1, 0.427451, 0, 1,
-1.530085, -0.1560864, -2.710165, 1, 0.4313726, 0, 1,
-1.526653, 0.1550033, -1.870896, 1, 0.4392157, 0, 1,
-1.52201, 0.3247313, -3.085755, 1, 0.4431373, 0, 1,
-1.519086, 1.198031, -1.175366, 1, 0.4509804, 0, 1,
-1.500253, 1.710612, -0.9230342, 1, 0.454902, 0, 1,
-1.499944, -0.8500263, -1.642208, 1, 0.4627451, 0, 1,
-1.491918, 0.8482518, -0.04634537, 1, 0.4666667, 0, 1,
-1.489612, 2.20187, -0.5891216, 1, 0.4745098, 0, 1,
-1.486488, -0.5387926, -1.423441, 1, 0.4784314, 0, 1,
-1.482295, 1.108827, -1.249788, 1, 0.4862745, 0, 1,
-1.466457, 1.63404, -1.805136, 1, 0.4901961, 0, 1,
-1.449354, -0.5981842, -1.275272, 1, 0.4980392, 0, 1,
-1.443823, 3.025751, -0.0749663, 1, 0.5058824, 0, 1,
-1.435714, 0.6967439, -1.587103, 1, 0.509804, 0, 1,
-1.434935, -0.409011, -2.105401, 1, 0.5176471, 0, 1,
-1.426397, -1.080716, -2.379828, 1, 0.5215687, 0, 1,
-1.420707, 0.1864098, -1.724141, 1, 0.5294118, 0, 1,
-1.419152, 1.264451, -1.072101, 1, 0.5333334, 0, 1,
-1.412085, -0.3769855, -1.574788, 1, 0.5411765, 0, 1,
-1.393985, -0.7377862, -2.066305, 1, 0.5450981, 0, 1,
-1.379443, 0.3127353, -0.7978156, 1, 0.5529412, 0, 1,
-1.358834, 0.8843547, -1.857135, 1, 0.5568628, 0, 1,
-1.352905, 0.4959845, -0.2218492, 1, 0.5647059, 0, 1,
-1.349836, 1.145555, -1.83808, 1, 0.5686275, 0, 1,
-1.345841, 1.118418, -0.601599, 1, 0.5764706, 0, 1,
-1.344098, 0.858893, -2.530044, 1, 0.5803922, 0, 1,
-1.329806, 0.6881861, -2.855101, 1, 0.5882353, 0, 1,
-1.325368, 0.3418485, -1.234264, 1, 0.5921569, 0, 1,
-1.323435, -0.9265065, -2.783185, 1, 0.6, 0, 1,
-1.319872, -1.948158, -3.05286, 1, 0.6078432, 0, 1,
-1.317922, 0.8772539, -1.778075, 1, 0.6117647, 0, 1,
-1.313373, 0.7861984, -0.3149287, 1, 0.6196079, 0, 1,
-1.311506, -1.406772, -2.768978, 1, 0.6235294, 0, 1,
-1.305288, -1.026925, -2.270983, 1, 0.6313726, 0, 1,
-1.304713, 0.316197, -2.668591, 1, 0.6352941, 0, 1,
-1.294967, 1.153157, -0.7048364, 1, 0.6431373, 0, 1,
-1.290207, 0.8735277, -0.9369002, 1, 0.6470588, 0, 1,
-1.2878, -0.1136288, -2.73646, 1, 0.654902, 0, 1,
-1.283952, -0.9379803, -1.077752, 1, 0.6588235, 0, 1,
-1.274767, -0.5472116, -1.632968, 1, 0.6666667, 0, 1,
-1.272412, 1.978261, -0.4991863, 1, 0.6705883, 0, 1,
-1.269309, -2.041311, -2.827609, 1, 0.6784314, 0, 1,
-1.268167, -0.1386926, -2.096103, 1, 0.682353, 0, 1,
-1.259768, -1.248586, -2.271958, 1, 0.6901961, 0, 1,
-1.223252, -0.1804791, -1.449199, 1, 0.6941177, 0, 1,
-1.218907, -0.7212704, -1.232496, 1, 0.7019608, 0, 1,
-1.198155, -0.3948016, -1.279052, 1, 0.7098039, 0, 1,
-1.196331, 0.5410299, -0.8094035, 1, 0.7137255, 0, 1,
-1.175329, -0.1003397, -1.879163, 1, 0.7215686, 0, 1,
-1.174251, 0.6789592, -0.8446912, 1, 0.7254902, 0, 1,
-1.173603, 0.5559195, -3.442085, 1, 0.7333333, 0, 1,
-1.172784, -1.528258, -2.044604, 1, 0.7372549, 0, 1,
-1.169792, 0.08494437, -1.073748, 1, 0.7450981, 0, 1,
-1.159647, 1.069982, -0.3896208, 1, 0.7490196, 0, 1,
-1.159006, 1.906165, -0.2060561, 1, 0.7568628, 0, 1,
-1.145843, 0.5666525, 0.3366098, 1, 0.7607843, 0, 1,
-1.142467, -1.186607, -1.974673, 1, 0.7686275, 0, 1,
-1.128678, 2.035358, -0.4758126, 1, 0.772549, 0, 1,
-1.12342, 0.5147479, -1.755334, 1, 0.7803922, 0, 1,
-1.114702, -0.1736051, -1.721208, 1, 0.7843137, 0, 1,
-1.11047, 0.751532, 1.349812, 1, 0.7921569, 0, 1,
-1.107661, -1.139662, -2.495795, 1, 0.7960784, 0, 1,
-1.106351, 0.6197054, -0.2050962, 1, 0.8039216, 0, 1,
-1.102766, 0.4112912, -1.847812, 1, 0.8117647, 0, 1,
-1.09883, -0.1022836, -1.841184, 1, 0.8156863, 0, 1,
-1.088233, -1.011733, -3.344635, 1, 0.8235294, 0, 1,
-1.08441, 0.9020025, -1.179829, 1, 0.827451, 0, 1,
-1.070987, -0.6138132, -1.663143, 1, 0.8352941, 0, 1,
-1.063689, -0.1421077, -1.558772, 1, 0.8392157, 0, 1,
-1.057385, -1.967762, -3.193683, 1, 0.8470588, 0, 1,
-1.045557, 1.700533, -2.6379, 1, 0.8509804, 0, 1,
-1.04539, -0.7707776, -2.718132, 1, 0.8588235, 0, 1,
-1.041742, -0.8313853, -0.9900318, 1, 0.8627451, 0, 1,
-1.041626, -0.3105885, -0.2673167, 1, 0.8705882, 0, 1,
-1.03521, 0.6737989, -2.527156, 1, 0.8745098, 0, 1,
-1.032495, 1.391895, -3.209954, 1, 0.8823529, 0, 1,
-1.030187, 0.7847711, -1.21724, 1, 0.8862745, 0, 1,
-1.029981, -0.2725771, -2.534699, 1, 0.8941177, 0, 1,
-1.029756, -0.3575325, -1.30976, 1, 0.8980392, 0, 1,
-1.029753, -0.01251192, -0.2800677, 1, 0.9058824, 0, 1,
-1.028566, -0.43511, -1.565657, 1, 0.9137255, 0, 1,
-1.02493, -1.354307, -1.388833, 1, 0.9176471, 0, 1,
-1.023237, 0.3587481, -1.299799, 1, 0.9254902, 0, 1,
-1.01812, -0.1184013, -2.527781, 1, 0.9294118, 0, 1,
-1.013679, 0.05043274, -1.549734, 1, 0.9372549, 0, 1,
-1.008898, -0.1888992, -0.7215815, 1, 0.9411765, 0, 1,
-1.005782, 0.08425666, -1.96179, 1, 0.9490196, 0, 1,
-1.003121, 0.6349126, -0.618239, 1, 0.9529412, 0, 1,
-1.001505, 0.06608421, -0.2012993, 1, 0.9607843, 0, 1,
-0.9949259, -0.2963288, -3.537702, 1, 0.9647059, 0, 1,
-0.9808719, -0.4472651, -2.5349, 1, 0.972549, 0, 1,
-0.9691846, -0.2648515, -0.7815956, 1, 0.9764706, 0, 1,
-0.9687325, 1.252228, -1.219047, 1, 0.9843137, 0, 1,
-0.968196, 1.206002, 0.508868, 1, 0.9882353, 0, 1,
-0.9630738, 1.439482, -0.1875657, 1, 0.9960784, 0, 1,
-0.9615965, 1.681308, -0.6364954, 0.9960784, 1, 0, 1,
-0.9612193, -0.05801044, -2.819053, 0.9921569, 1, 0, 1,
-0.9519392, 1.094013, -1.183794, 0.9843137, 1, 0, 1,
-0.9469396, -0.7421089, -2.644573, 0.9803922, 1, 0, 1,
-0.9419179, 0.0634796, -1.721643, 0.972549, 1, 0, 1,
-0.9396518, -0.2229194, -3.017596, 0.9686275, 1, 0, 1,
-0.9380513, 1.850814, 0.179028, 0.9607843, 1, 0, 1,
-0.9241037, 0.1716831, 0.05105615, 0.9568627, 1, 0, 1,
-0.9237771, -1.616643, -1.785841, 0.9490196, 1, 0, 1,
-0.9171455, 0.8481116, -0.2631712, 0.945098, 1, 0, 1,
-0.9153351, -1.690417, -3.549831, 0.9372549, 1, 0, 1,
-0.9141514, -1.217558, -0.5495614, 0.9333333, 1, 0, 1,
-0.910516, 1.035575, -0.5354084, 0.9254902, 1, 0, 1,
-0.910504, -0.3757819, -2.32081, 0.9215686, 1, 0, 1,
-0.9095727, -0.3256626, -2.746215, 0.9137255, 1, 0, 1,
-0.9094197, -0.6722467, -4.122121, 0.9098039, 1, 0, 1,
-0.9094061, -0.8918526, -0.9566143, 0.9019608, 1, 0, 1,
-0.897265, 0.7687553, 0.8774366, 0.8941177, 1, 0, 1,
-0.8956667, -0.00290638, -0.8443294, 0.8901961, 1, 0, 1,
-0.8954171, 0.2364016, -1.622048, 0.8823529, 1, 0, 1,
-0.8820251, 0.4787497, -1.197096, 0.8784314, 1, 0, 1,
-0.8741149, 1.431995, -0.2395159, 0.8705882, 1, 0, 1,
-0.8712381, 0.6358088, -2.837588, 0.8666667, 1, 0, 1,
-0.8632698, -1.042461, -1.760623, 0.8588235, 1, 0, 1,
-0.8618225, 0.3860249, -1.070777, 0.854902, 1, 0, 1,
-0.8595576, 1.669749, -1.462882, 0.8470588, 1, 0, 1,
-0.8582781, -2.151923, -3.990251, 0.8431373, 1, 0, 1,
-0.8579491, 1.197887, -0.3923405, 0.8352941, 1, 0, 1,
-0.8576124, 0.5838767, 0.5468031, 0.8313726, 1, 0, 1,
-0.8545416, -0.1307481, -1.001022, 0.8235294, 1, 0, 1,
-0.8525949, 1.203184, -0.6617113, 0.8196079, 1, 0, 1,
-0.851954, -0.1094586, -2.914848, 0.8117647, 1, 0, 1,
-0.8476715, 0.3586406, -0.7184071, 0.8078431, 1, 0, 1,
-0.8389817, -0.9046628, -2.715669, 0.8, 1, 0, 1,
-0.8353636, 1.786575, -0.8672989, 0.7921569, 1, 0, 1,
-0.8343291, -0.6708661, -1.599931, 0.7882353, 1, 0, 1,
-0.8340986, -1.020099, -2.862701, 0.7803922, 1, 0, 1,
-0.829084, 0.2512262, -1.278206, 0.7764706, 1, 0, 1,
-0.8290287, -0.2885204, -2.417656, 0.7686275, 1, 0, 1,
-0.8289091, 0.6063923, -1.017529, 0.7647059, 1, 0, 1,
-0.8249476, 0.3292608, -0.2317495, 0.7568628, 1, 0, 1,
-0.8243546, 1.146289, 1.889755, 0.7529412, 1, 0, 1,
-0.8210967, -0.3244164, -1.807414, 0.7450981, 1, 0, 1,
-0.817944, 0.3960916, -0.4747692, 0.7411765, 1, 0, 1,
-0.8152828, 0.7742341, -1.391445, 0.7333333, 1, 0, 1,
-0.8120474, -1.234993, -2.749007, 0.7294118, 1, 0, 1,
-0.8105469, -0.5835639, -2.010752, 0.7215686, 1, 0, 1,
-0.8091992, -1.921129, -1.646246, 0.7176471, 1, 0, 1,
-0.8063272, -2.098359, -3.963907, 0.7098039, 1, 0, 1,
-0.8062407, -0.7448469, -1.203299, 0.7058824, 1, 0, 1,
-0.8054469, 0.1875943, 0.04680888, 0.6980392, 1, 0, 1,
-0.8043749, 0.008829709, -2.84485, 0.6901961, 1, 0, 1,
-0.7997029, -1.25105, -1.213422, 0.6862745, 1, 0, 1,
-0.7929152, -0.9994396, -2.342028, 0.6784314, 1, 0, 1,
-0.7879448, -1.028315, -3.619277, 0.6745098, 1, 0, 1,
-0.7844094, -0.6275595, -1.163748, 0.6666667, 1, 0, 1,
-0.7810491, -0.8140967, -4.159883, 0.6627451, 1, 0, 1,
-0.7780406, -0.7166111, -2.353275, 0.654902, 1, 0, 1,
-0.7698593, 0.4805915, -1.384685, 0.6509804, 1, 0, 1,
-0.7685603, -0.8983827, -1.242856, 0.6431373, 1, 0, 1,
-0.7610436, -0.5760675, -1.819719, 0.6392157, 1, 0, 1,
-0.7518337, -0.4177584, -1.084564, 0.6313726, 1, 0, 1,
-0.7448533, -0.5202073, -1.342213, 0.627451, 1, 0, 1,
-0.7425913, -0.5317146, -4.014437, 0.6196079, 1, 0, 1,
-0.7367588, 2.246161, 0.9062287, 0.6156863, 1, 0, 1,
-0.7363958, -0.5307265, -4.385198, 0.6078432, 1, 0, 1,
-0.7347022, 1.433163, -0.03366714, 0.6039216, 1, 0, 1,
-0.7337472, -0.3139949, -0.7518412, 0.5960785, 1, 0, 1,
-0.7336788, 0.4936392, -1.326489, 0.5882353, 1, 0, 1,
-0.7321978, -1.533751, -2.046931, 0.5843138, 1, 0, 1,
-0.727587, 1.774638, 0.4818462, 0.5764706, 1, 0, 1,
-0.727414, 0.3397757, -2.366757, 0.572549, 1, 0, 1,
-0.7125964, -0.6241433, -0.800962, 0.5647059, 1, 0, 1,
-0.7090316, 1.725583, -0.1171658, 0.5607843, 1, 0, 1,
-0.7069101, -0.8040895, -1.508557, 0.5529412, 1, 0, 1,
-0.7020877, 1.261769, -0.1092768, 0.5490196, 1, 0, 1,
-0.6997603, -0.9066687, -1.740032, 0.5411765, 1, 0, 1,
-0.6952913, 0.5490741, -2.964427, 0.5372549, 1, 0, 1,
-0.6904097, 0.2965559, 0.3917509, 0.5294118, 1, 0, 1,
-0.686491, -0.1232612, -2.495062, 0.5254902, 1, 0, 1,
-0.6838523, 0.6141848, -1.576437, 0.5176471, 1, 0, 1,
-0.6802763, 0.5540121, -1.41654, 0.5137255, 1, 0, 1,
-0.679889, -0.2169443, -1.597904, 0.5058824, 1, 0, 1,
-0.6761945, -1.647856, -1.937164, 0.5019608, 1, 0, 1,
-0.6745026, -0.6870158, -1.641549, 0.4941176, 1, 0, 1,
-0.6737769, -0.03197023, -1.851984, 0.4862745, 1, 0, 1,
-0.6735706, -0.08986489, -1.109188, 0.4823529, 1, 0, 1,
-0.6706765, 1.350557, -0.9758598, 0.4745098, 1, 0, 1,
-0.669159, -0.4414079, -1.932809, 0.4705882, 1, 0, 1,
-0.6690291, 0.4980017, -1.226297, 0.4627451, 1, 0, 1,
-0.6689823, -1.379984, -2.510703, 0.4588235, 1, 0, 1,
-0.6664536, -0.2470879, -4.073954, 0.4509804, 1, 0, 1,
-0.6659644, -0.01158005, 0.3282791, 0.4470588, 1, 0, 1,
-0.663367, -1.528729, -1.920621, 0.4392157, 1, 0, 1,
-0.6555331, 0.7978011, -2.45199, 0.4352941, 1, 0, 1,
-0.650341, -0.8347222, -1.034585, 0.427451, 1, 0, 1,
-0.6447141, 0.09151115, -2.667557, 0.4235294, 1, 0, 1,
-0.6366358, -0.411954, -1.206318, 0.4156863, 1, 0, 1,
-0.6304212, 0.337565, -2.078767, 0.4117647, 1, 0, 1,
-0.6292214, -0.05718833, -1.423701, 0.4039216, 1, 0, 1,
-0.6269894, -0.9485057, -3.032081, 0.3960784, 1, 0, 1,
-0.6263571, 0.5130056, -2.272227, 0.3921569, 1, 0, 1,
-0.6178456, 0.7413466, -0.6226272, 0.3843137, 1, 0, 1,
-0.6174551, 1.54348, 0.1032548, 0.3803922, 1, 0, 1,
-0.6167635, -2.481652, -2.444769, 0.372549, 1, 0, 1,
-0.6162971, -0.4706639, -2.229038, 0.3686275, 1, 0, 1,
-0.6151839, -0.3626035, 0.4785423, 0.3607843, 1, 0, 1,
-0.6150163, 0.07882866, -1.713518, 0.3568628, 1, 0, 1,
-0.613146, 0.2752061, -2.165311, 0.3490196, 1, 0, 1,
-0.6080387, -1.766799, -2.616317, 0.345098, 1, 0, 1,
-0.6032202, -0.3469902, -1.070938, 0.3372549, 1, 0, 1,
-0.6008163, 0.239192, -2.553401, 0.3333333, 1, 0, 1,
-0.6000972, 1.120625, -0.5401695, 0.3254902, 1, 0, 1,
-0.5957856, 0.3906023, -1.135782, 0.3215686, 1, 0, 1,
-0.5945457, 0.6386253, -1.050634, 0.3137255, 1, 0, 1,
-0.5904719, -0.6729884, -2.363871, 0.3098039, 1, 0, 1,
-0.5865931, -1.00596, -1.955837, 0.3019608, 1, 0, 1,
-0.5788099, -0.551492, -2.390998, 0.2941177, 1, 0, 1,
-0.5764315, 2.406147, -0.9797719, 0.2901961, 1, 0, 1,
-0.5687899, 0.4336955, -2.224997, 0.282353, 1, 0, 1,
-0.5658346, 1.089462, 1.674058, 0.2784314, 1, 0, 1,
-0.5637107, 0.1789251, -1.009746, 0.2705882, 1, 0, 1,
-0.5593857, 0.4891084, -0.3739226, 0.2666667, 1, 0, 1,
-0.5525387, 0.2140077, -1.04125, 0.2588235, 1, 0, 1,
-0.5505569, -1.683498, -3.38393, 0.254902, 1, 0, 1,
-0.5475987, 1.026154, -0.4639096, 0.2470588, 1, 0, 1,
-0.543537, -0.132934, -1.213824, 0.2431373, 1, 0, 1,
-0.5427997, 0.5373487, 0.6958067, 0.2352941, 1, 0, 1,
-0.5371777, 0.04168184, -1.288992, 0.2313726, 1, 0, 1,
-0.5354946, -0.4691695, -3.397226, 0.2235294, 1, 0, 1,
-0.5353432, -0.4819121, -2.794946, 0.2196078, 1, 0, 1,
-0.5347356, 1.089266, -0.9822811, 0.2117647, 1, 0, 1,
-0.5288234, -0.9262913, -1.461427, 0.2078431, 1, 0, 1,
-0.5274605, -0.3425623, -1.441601, 0.2, 1, 0, 1,
-0.5246166, -0.4438276, -1.541647, 0.1921569, 1, 0, 1,
-0.5202771, 1.068545, -0.1816041, 0.1882353, 1, 0, 1,
-0.5135812, 0.1231713, -0.4854869, 0.1803922, 1, 0, 1,
-0.5133561, -0.1110803, -1.933358, 0.1764706, 1, 0, 1,
-0.5103675, 0.1406998, -0.9238087, 0.1686275, 1, 0, 1,
-0.5101238, 0.9674824, 0.9173292, 0.1647059, 1, 0, 1,
-0.5096702, -1.152152, -2.497093, 0.1568628, 1, 0, 1,
-0.5088207, -1.038731, -2.429497, 0.1529412, 1, 0, 1,
-0.5030532, -0.4795078, -2.760523, 0.145098, 1, 0, 1,
-0.5016158, 2.285172, 1.817826, 0.1411765, 1, 0, 1,
-0.4980913, -0.5665114, -0.9551789, 0.1333333, 1, 0, 1,
-0.4936802, -0.1202792, -1.154573, 0.1294118, 1, 0, 1,
-0.4914387, 0.8539346, -2.011661, 0.1215686, 1, 0, 1,
-0.4838174, 0.3485437, -0.4373693, 0.1176471, 1, 0, 1,
-0.4820482, -0.6783915, -3.45704, 0.1098039, 1, 0, 1,
-0.481717, -0.476048, -1.449706, 0.1058824, 1, 0, 1,
-0.4799667, -0.6809042, -1.063105, 0.09803922, 1, 0, 1,
-0.4795174, -0.6700745, -1.745115, 0.09019608, 1, 0, 1,
-0.4743545, 1.361889, 0.7611423, 0.08627451, 1, 0, 1,
-0.4724962, -2.133889, -3.153815, 0.07843138, 1, 0, 1,
-0.4711813, 1.138311, -0.6533437, 0.07450981, 1, 0, 1,
-0.4710919, 0.2999209, -0.5588058, 0.06666667, 1, 0, 1,
-0.4665952, -1.099377, -3.086262, 0.0627451, 1, 0, 1,
-0.4659998, 0.1889638, -0.9663558, 0.05490196, 1, 0, 1,
-0.4636441, 1.06345, -1.217909, 0.05098039, 1, 0, 1,
-0.461072, 0.3705923, 0.1363716, 0.04313726, 1, 0, 1,
-0.459918, 0.2022623, -1.504164, 0.03921569, 1, 0, 1,
-0.4545577, -1.256099, -2.846562, 0.03137255, 1, 0, 1,
-0.4495854, -0.2093203, -1.816488, 0.02745098, 1, 0, 1,
-0.4404771, -0.1867348, -1.162361, 0.01960784, 1, 0, 1,
-0.4385412, -0.7782335, -2.270747, 0.01568628, 1, 0, 1,
-0.4343672, -2.038822, -2.933475, 0.007843138, 1, 0, 1,
-0.4322124, 0.5194253, -1.037476, 0.003921569, 1, 0, 1,
-0.4265928, 1.881828, -1.279427, 0, 1, 0.003921569, 1,
-0.4246272, -0.02152074, -2.052963, 0, 1, 0.01176471, 1,
-0.4172804, 0.7855158, 0.05678696, 0, 1, 0.01568628, 1,
-0.4156857, 0.0072782, -2.139771, 0, 1, 0.02352941, 1,
-0.4139137, 0.3232755, -2.136578, 0, 1, 0.02745098, 1,
-0.4124277, 1.074672, -0.4728339, 0, 1, 0.03529412, 1,
-0.4123134, 0.3129241, -0.82113, 0, 1, 0.03921569, 1,
-0.4011381, 0.5663776, 0.6148547, 0, 1, 0.04705882, 1,
-0.399116, -0.7103767, -2.547928, 0, 1, 0.05098039, 1,
-0.3987356, 1.618598, -0.6552258, 0, 1, 0.05882353, 1,
-0.396602, 0.4341078, 0.006805024, 0, 1, 0.0627451, 1,
-0.3853532, 0.1309426, -1.803272, 0, 1, 0.07058824, 1,
-0.3843716, 0.1063561, -2.168901, 0, 1, 0.07450981, 1,
-0.3831299, 0.6188177, -0.5441049, 0, 1, 0.08235294, 1,
-0.3770528, 0.1504558, -2.568983, 0, 1, 0.08627451, 1,
-0.3756735, 1.470844, -1.779636, 0, 1, 0.09411765, 1,
-0.3658233, -1.078415, -3.915142, 0, 1, 0.1019608, 1,
-0.3653373, -0.01944401, -1.06385, 0, 1, 0.1058824, 1,
-0.3653122, 1.35161, -1.220683, 0, 1, 0.1137255, 1,
-0.3603814, -1.003004, -1.957545, 0, 1, 0.1176471, 1,
-0.359719, 0.1395081, -0.360465, 0, 1, 0.1254902, 1,
-0.3560331, 0.1028088, -1.237272, 0, 1, 0.1294118, 1,
-0.3549095, -0.7703589, -3.79329, 0, 1, 0.1372549, 1,
-0.3491159, 1.199082, -0.8266034, 0, 1, 0.1411765, 1,
-0.3370403, -2.030085, -4.853434, 0, 1, 0.1490196, 1,
-0.3353123, 0.338816, -2.296082, 0, 1, 0.1529412, 1,
-0.3338447, 0.5400142, 0.405535, 0, 1, 0.1607843, 1,
-0.3336155, 0.19147, -0.3740239, 0, 1, 0.1647059, 1,
-0.332276, 0.3325662, -0.1254341, 0, 1, 0.172549, 1,
-0.3322602, 1.907653, 0.4647912, 0, 1, 0.1764706, 1,
-0.3316229, -0.865988, -3.593843, 0, 1, 0.1843137, 1,
-0.3309119, 1.036574, -2.627307, 0, 1, 0.1882353, 1,
-0.3295014, 0.6985834, -0.5737795, 0, 1, 0.1960784, 1,
-0.3288, 0.5934743, 1.232503, 0, 1, 0.2039216, 1,
-0.3283603, 0.2377215, -1.295262, 0, 1, 0.2078431, 1,
-0.3239581, -0.1456565, -3.295918, 0, 1, 0.2156863, 1,
-0.3225095, 1.536857, 0.6874977, 0, 1, 0.2196078, 1,
-0.3218222, -1.187019, -1.984086, 0, 1, 0.227451, 1,
-0.3209047, -0.2565577, -4.626062, 0, 1, 0.2313726, 1,
-0.3086286, 0.008827218, -3.070393, 0, 1, 0.2392157, 1,
-0.3052656, -0.9099755, -2.270792, 0, 1, 0.2431373, 1,
-0.3004295, 1.218188, -0.06483356, 0, 1, 0.2509804, 1,
-0.2961023, 1.507777, 0.7752687, 0, 1, 0.254902, 1,
-0.2941213, 1.336132, 1.040465, 0, 1, 0.2627451, 1,
-0.2931972, -0.9319577, -2.008105, 0, 1, 0.2666667, 1,
-0.2874666, -2.069317, -3.732761, 0, 1, 0.2745098, 1,
-0.2861141, 0.3979828, -1.743151, 0, 1, 0.2784314, 1,
-0.2851314, 1.138796, -1.182179, 0, 1, 0.2862745, 1,
-0.2827628, 0.3391483, -0.03494518, 0, 1, 0.2901961, 1,
-0.2818383, -0.2577925, -1.332618, 0, 1, 0.2980392, 1,
-0.2804376, -0.1169749, -1.070834, 0, 1, 0.3058824, 1,
-0.2802784, -0.5698369, -4.064219, 0, 1, 0.3098039, 1,
-0.2793434, -0.2204597, -3.172085, 0, 1, 0.3176471, 1,
-0.2781873, -0.3666389, -1.700874, 0, 1, 0.3215686, 1,
-0.2766322, -0.5805755, -2.57871, 0, 1, 0.3294118, 1,
-0.2693845, -1.790637, -3.642272, 0, 1, 0.3333333, 1,
-0.2685155, -0.5355101, -3.126534, 0, 1, 0.3411765, 1,
-0.2643451, -2.39859, -4.538269, 0, 1, 0.345098, 1,
-0.2584001, -0.02161288, -1.994215, 0, 1, 0.3529412, 1,
-0.2578396, 0.8313506, -2.199997, 0, 1, 0.3568628, 1,
-0.2559019, -1.287071, -2.835135, 0, 1, 0.3647059, 1,
-0.2514225, 0.01483092, -1.337128, 0, 1, 0.3686275, 1,
-0.2493652, -0.9845101, -4.122263, 0, 1, 0.3764706, 1,
-0.242398, -1.920844, -1.700588, 0, 1, 0.3803922, 1,
-0.2386209, -1.595575, -2.543327, 0, 1, 0.3882353, 1,
-0.2378507, 1.313526, -0.7912806, 0, 1, 0.3921569, 1,
-0.2378489, 1.08062, -0.09373231, 0, 1, 0.4, 1,
-0.2321145, 0.8351162, 0.3365535, 0, 1, 0.4078431, 1,
-0.2317538, -0.6071509, -1.982297, 0, 1, 0.4117647, 1,
-0.2290051, 1.65183, -0.2324218, 0, 1, 0.4196078, 1,
-0.2267157, -0.8023723, -3.364119, 0, 1, 0.4235294, 1,
-0.225793, -0.4539373, -2.900891, 0, 1, 0.4313726, 1,
-0.2241177, -0.578494, -1.216285, 0, 1, 0.4352941, 1,
-0.2240224, -1.275058, -5.77942, 0, 1, 0.4431373, 1,
-0.2235178, 0.5359241, 0.4958736, 0, 1, 0.4470588, 1,
-0.2232645, -0.3586317, -2.204495, 0, 1, 0.454902, 1,
-0.2217159, 1.028557, 0.4796569, 0, 1, 0.4588235, 1,
-0.2180501, -1.663433, -2.518101, 0, 1, 0.4666667, 1,
-0.2179319, 0.3925213, 0.9485062, 0, 1, 0.4705882, 1,
-0.2175437, -0.920592, -2.07693, 0, 1, 0.4784314, 1,
-0.2159387, 0.6524075, 0.03816732, 0, 1, 0.4823529, 1,
-0.2148347, 0.7777032, -1.377061, 0, 1, 0.4901961, 1,
-0.2143081, 1.505503, 0.03485998, 0, 1, 0.4941176, 1,
-0.1965505, -0.02328907, -1.636151, 0, 1, 0.5019608, 1,
-0.1948876, 0.9784452, -1.486015, 0, 1, 0.509804, 1,
-0.1876825, 1.839806, 0.2298296, 0, 1, 0.5137255, 1,
-0.1856417, 0.08508302, -1.220696, 0, 1, 0.5215687, 1,
-0.1802944, -0.6347252, -4.038775, 0, 1, 0.5254902, 1,
-0.1792562, -0.06018754, -2.544048, 0, 1, 0.5333334, 1,
-0.1773318, 1.276052, -1.837754, 0, 1, 0.5372549, 1,
-0.1770108, -0.6479205, -1.813565, 0, 1, 0.5450981, 1,
-0.1729879, -0.1459464, -2.984716, 0, 1, 0.5490196, 1,
-0.1710876, -0.06411893, -2.909724, 0, 1, 0.5568628, 1,
-0.1678178, -0.2900403, -1.940725, 0, 1, 0.5607843, 1,
-0.1667842, -0.6983291, -4.576049, 0, 1, 0.5686275, 1,
-0.1643682, -0.6143973, -3.134427, 0, 1, 0.572549, 1,
-0.1618961, -1.645029, -1.571721, 0, 1, 0.5803922, 1,
-0.1617603, -0.03607268, -1.555294, 0, 1, 0.5843138, 1,
-0.1545895, 0.1848555, -1.689458, 0, 1, 0.5921569, 1,
-0.1536572, -1.544579, -2.990886, 0, 1, 0.5960785, 1,
-0.1517699, 1.15396, 0.8549257, 0, 1, 0.6039216, 1,
-0.1505829, -0.1877123, -3.608757, 0, 1, 0.6117647, 1,
-0.1504389, -0.04221364, -1.088122, 0, 1, 0.6156863, 1,
-0.1493373, -0.1906276, -2.820473, 0, 1, 0.6235294, 1,
-0.1462822, -1.477963, -4.620948, 0, 1, 0.627451, 1,
-0.1458495, 0.5223843, -0.3085246, 0, 1, 0.6352941, 1,
-0.1458375, -0.4191532, -1.866236, 0, 1, 0.6392157, 1,
-0.1395305, -0.1150063, -2.551735, 0, 1, 0.6470588, 1,
-0.1364079, 1.253918, -0.4943655, 0, 1, 0.6509804, 1,
-0.132262, 1.212602, -2.482763, 0, 1, 0.6588235, 1,
-0.1319408, -1.643539, -3.62276, 0, 1, 0.6627451, 1,
-0.130862, -0.5944626, -2.906672, 0, 1, 0.6705883, 1,
-0.1253585, -0.4545205, -2.960855, 0, 1, 0.6745098, 1,
-0.1198248, 0.3849818, -0.1793146, 0, 1, 0.682353, 1,
-0.119412, 1.078926, -0.658241, 0, 1, 0.6862745, 1,
-0.1192626, 0.5948217, 0.2799192, 0, 1, 0.6941177, 1,
-0.1182353, 1.416657, -1.10474, 0, 1, 0.7019608, 1,
-0.1136621, -0.4570381, -2.598377, 0, 1, 0.7058824, 1,
-0.1125276, 1.913038, -1.405209, 0, 1, 0.7137255, 1,
-0.1125058, 0.05607048, -0.6639329, 0, 1, 0.7176471, 1,
-0.1091722, 0.4959986, 0.6853791, 0, 1, 0.7254902, 1,
-0.1014398, 0.5629448, -0.9317303, 0, 1, 0.7294118, 1,
-0.09796073, -0.9262701, -3.28238, 0, 1, 0.7372549, 1,
-0.0954581, -0.2520967, -1.408522, 0, 1, 0.7411765, 1,
-0.09504129, 0.3444026, -1.271202, 0, 1, 0.7490196, 1,
-0.09355759, -0.6398105, -5.307067, 0, 1, 0.7529412, 1,
-0.09172971, 0.6952057, -1.481039, 0, 1, 0.7607843, 1,
-0.08440012, -0.007036036, -1.885623, 0, 1, 0.7647059, 1,
-0.07952566, -0.2365631, -2.984193, 0, 1, 0.772549, 1,
-0.07902007, 0.535675, -0.4671568, 0, 1, 0.7764706, 1,
-0.07901745, 0.3919243, 0.8628721, 0, 1, 0.7843137, 1,
-0.07892259, -0.1012283, -4.009552, 0, 1, 0.7882353, 1,
-0.07875431, -0.2355381, -2.309439, 0, 1, 0.7960784, 1,
-0.07784477, -0.166645, -2.444946, 0, 1, 0.8039216, 1,
-0.07405467, 0.009460326, -0.3232746, 0, 1, 0.8078431, 1,
-0.07378562, 1.097631, 0.2287985, 0, 1, 0.8156863, 1,
-0.07193879, -0.9143906, -3.487874, 0, 1, 0.8196079, 1,
-0.07048744, -1.231575, -3.042137, 0, 1, 0.827451, 1,
-0.0668887, 1.524818, 0.3710001, 0, 1, 0.8313726, 1,
-0.06683832, -0.02312164, -3.1935, 0, 1, 0.8392157, 1,
-0.06682004, -0.4460477, -2.9229, 0, 1, 0.8431373, 1,
-0.06305123, -0.2184104, -4.185714, 0, 1, 0.8509804, 1,
-0.05710327, 0.8100129, -1.259405, 0, 1, 0.854902, 1,
-0.05447691, -0.2398324, -2.495201, 0, 1, 0.8627451, 1,
-0.05311015, -0.2715138, -2.673119, 0, 1, 0.8666667, 1,
-0.0483883, 0.9193085, 1.071825, 0, 1, 0.8745098, 1,
-0.04629927, -0.5142173, -1.803877, 0, 1, 0.8784314, 1,
-0.04392882, -0.01008182, -0.4009785, 0, 1, 0.8862745, 1,
-0.04143806, 1.132964, 1.429893, 0, 1, 0.8901961, 1,
-0.03975256, 0.6973118, 0.1796846, 0, 1, 0.8980392, 1,
-0.03737094, 0.07136339, -0.7875395, 0, 1, 0.9058824, 1,
-0.03504081, -1.306272, -3.853296, 0, 1, 0.9098039, 1,
-0.0324895, 0.8495897, -0.910431, 0, 1, 0.9176471, 1,
-0.0318747, -0.8456176, -3.217868, 0, 1, 0.9215686, 1,
-0.03012885, -0.9647174, -3.990944, 0, 1, 0.9294118, 1,
-0.0285515, 2.210999, 1.042119, 0, 1, 0.9333333, 1,
-0.02807355, -2.445867, -3.287955, 0, 1, 0.9411765, 1,
-0.02800657, -1.030488, -2.84606, 0, 1, 0.945098, 1,
-0.02682937, 0.1405019, -2.125496, 0, 1, 0.9529412, 1,
-0.01921273, -1.31037, -3.258606, 0, 1, 0.9568627, 1,
-0.01856541, 2.3568, -1.387156, 0, 1, 0.9647059, 1,
-0.01852717, 0.016963, -3.187807, 0, 1, 0.9686275, 1,
-0.01831304, 0.9874277, -2.565963, 0, 1, 0.9764706, 1,
-0.01605763, 1.7865, 1.109276, 0, 1, 0.9803922, 1,
-0.0156366, -1.006179, -2.761867, 0, 1, 0.9882353, 1,
-0.01372589, -0.8866431, -2.858123, 0, 1, 0.9921569, 1,
-0.01336495, 0.9136355, -0.3580694, 0, 1, 1, 1,
-0.01204824, -0.6048689, -5.088419, 0, 0.9921569, 1, 1,
-0.0120175, -0.3730851, -2.579943, 0, 0.9882353, 1, 1,
-0.01180535, 0.4960524, 0.278259, 0, 0.9803922, 1, 1,
-0.01028301, 1.202444, 0.4494513, 0, 0.9764706, 1, 1,
-0.01003082, -1.804549, -4.151143, 0, 0.9686275, 1, 1,
-0.005562281, 2.366218, -0.7567675, 0, 0.9647059, 1, 1,
0.002315202, -0.1300285, 2.596524, 0, 0.9568627, 1, 1,
0.002656929, -0.3436065, 4.049243, 0, 0.9529412, 1, 1,
0.004617654, -1.734613, 4.137447, 0, 0.945098, 1, 1,
0.006871382, 0.4383, 1.018744, 0, 0.9411765, 1, 1,
0.0108389, -0.8542386, 1.487713, 0, 0.9333333, 1, 1,
0.01285344, 1.236634, 1.077392, 0, 0.9294118, 1, 1,
0.01432968, -0.759966, 3.924246, 0, 0.9215686, 1, 1,
0.01611047, 1.712015, -2.323303, 0, 0.9176471, 1, 1,
0.01758423, 0.4092786, 1.575262, 0, 0.9098039, 1, 1,
0.02263344, 0.3875847, 0.5975119, 0, 0.9058824, 1, 1,
0.02930641, 1.294955, -0.2089846, 0, 0.8980392, 1, 1,
0.02987244, 1.030707, -0.7674376, 0, 0.8901961, 1, 1,
0.030719, -0.8146632, 4.652688, 0, 0.8862745, 1, 1,
0.03073553, 1.559652, 2.778416, 0, 0.8784314, 1, 1,
0.03312742, -1.025602, 2.425535, 0, 0.8745098, 1, 1,
0.03313267, -0.5601285, 4.135958, 0, 0.8666667, 1, 1,
0.03373657, 0.2421719, 0.06395531, 0, 0.8627451, 1, 1,
0.03476642, -0.7265328, 3.890789, 0, 0.854902, 1, 1,
0.05082645, -0.2060276, 2.141501, 0, 0.8509804, 1, 1,
0.05555167, 1.086758, 0.3575921, 0, 0.8431373, 1, 1,
0.06023379, 0.2648643, 1.7419, 0, 0.8392157, 1, 1,
0.06055973, -0.3122703, 2.650914, 0, 0.8313726, 1, 1,
0.066348, 1.859545, 1.71768, 0, 0.827451, 1, 1,
0.06702286, -0.554446, 3.760617, 0, 0.8196079, 1, 1,
0.06730438, -0.06677443, 2.442871, 0, 0.8156863, 1, 1,
0.07157923, -0.2334395, 3.84919, 0, 0.8078431, 1, 1,
0.07194541, 1.30507, 1.158601, 0, 0.8039216, 1, 1,
0.07287438, 1.994145, 1.540302, 0, 0.7960784, 1, 1,
0.07419115, 1.080258, 0.1966256, 0, 0.7882353, 1, 1,
0.07643512, 0.2860768, -0.3998265, 0, 0.7843137, 1, 1,
0.07742109, 1.916208, 0.06782148, 0, 0.7764706, 1, 1,
0.0822559, 0.4650989, 0.7532731, 0, 0.772549, 1, 1,
0.08525339, -0.9697714, 2.880896, 0, 0.7647059, 1, 1,
0.0861492, 0.4644009, 0.05653581, 0, 0.7607843, 1, 1,
0.09046598, 0.5769448, -0.1333054, 0, 0.7529412, 1, 1,
0.09122916, 0.6312498, 1.392121, 0, 0.7490196, 1, 1,
0.09475707, 0.4352749, -0.3785538, 0, 0.7411765, 1, 1,
0.09831841, 0.7963311, -0.5848748, 0, 0.7372549, 1, 1,
0.1027192, -1.471324, 3.879102, 0, 0.7294118, 1, 1,
0.103777, 0.4896056, 0.8576109, 0, 0.7254902, 1, 1,
0.1064637, 0.2546285, 0.3601165, 0, 0.7176471, 1, 1,
0.1066403, -0.684446, 3.576313, 0, 0.7137255, 1, 1,
0.1096424, 0.3547765, 0.3822863, 0, 0.7058824, 1, 1,
0.1108969, 0.2321426, 1.663863, 0, 0.6980392, 1, 1,
0.1133369, -0.1123648, 2.895134, 0, 0.6941177, 1, 1,
0.1142014, 0.6640198, 1.351336, 0, 0.6862745, 1, 1,
0.1169667, -1.439122, 2.02799, 0, 0.682353, 1, 1,
0.1178205, -0.7259851, 2.372436, 0, 0.6745098, 1, 1,
0.117921, 0.5054425, 0.9334988, 0, 0.6705883, 1, 1,
0.1202833, 0.7273731, -1.370772, 0, 0.6627451, 1, 1,
0.1221438, -0.322493, 2.164727, 0, 0.6588235, 1, 1,
0.1230691, -0.2214544, 2.818815, 0, 0.6509804, 1, 1,
0.1233138, -2.148262, 4.174384, 0, 0.6470588, 1, 1,
0.1254168, -0.1951465, 3.270214, 0, 0.6392157, 1, 1,
0.1272984, -1.17967, 0.910893, 0, 0.6352941, 1, 1,
0.1279151, 0.5264127, 0.2250913, 0, 0.627451, 1, 1,
0.1382849, 0.4741176, 0.7301093, 0, 0.6235294, 1, 1,
0.1405327, -0.05384894, 0.7357351, 0, 0.6156863, 1, 1,
0.1434428, -1.205688, 3.159164, 0, 0.6117647, 1, 1,
0.1438743, -0.9420054, 4.07306, 0, 0.6039216, 1, 1,
0.1462578, 0.5320615, 0.9684998, 0, 0.5960785, 1, 1,
0.1481041, 0.4670098, 2.525343, 0, 0.5921569, 1, 1,
0.1499861, -0.4585172, 3.519536, 0, 0.5843138, 1, 1,
0.1526558, 1.821576, 1.468028, 0, 0.5803922, 1, 1,
0.1545093, -0.6715323, 1.860304, 0, 0.572549, 1, 1,
0.1545543, 0.5086049, 0.7396453, 0, 0.5686275, 1, 1,
0.1573402, 0.1770072, 0.9276597, 0, 0.5607843, 1, 1,
0.1604675, 0.0737405, 1.099644, 0, 0.5568628, 1, 1,
0.160487, -2.160601, 3.034, 0, 0.5490196, 1, 1,
0.1625349, -0.5550371, 3.14699, 0, 0.5450981, 1, 1,
0.1633134, -0.2725734, 2.42754, 0, 0.5372549, 1, 1,
0.1658072, -0.01952215, 1.647765, 0, 0.5333334, 1, 1,
0.17249, -0.2887201, 2.935706, 0, 0.5254902, 1, 1,
0.1727223, 0.8568335, 0.1028379, 0, 0.5215687, 1, 1,
0.174125, 1.700165, -1.755194, 0, 0.5137255, 1, 1,
0.1754207, -0.1990747, 2.936245, 0, 0.509804, 1, 1,
0.1775811, -0.2030269, 3.559682, 0, 0.5019608, 1, 1,
0.179061, -0.6956208, 2.696179, 0, 0.4941176, 1, 1,
0.1824983, 1.306424, 1.494117, 0, 0.4901961, 1, 1,
0.1852049, -0.66433, 1.59443, 0, 0.4823529, 1, 1,
0.1855775, -0.8503628, 3.59125, 0, 0.4784314, 1, 1,
0.1867386, -1.76089, 3.830855, 0, 0.4705882, 1, 1,
0.1906917, 0.2401117, 0.9965071, 0, 0.4666667, 1, 1,
0.1909391, 1.252294, 1.656612, 0, 0.4588235, 1, 1,
0.1929552, 1.225213, -1.79247, 0, 0.454902, 1, 1,
0.1938034, 0.07120862, 1.343417, 0, 0.4470588, 1, 1,
0.1948178, 0.09008253, 1.594728, 0, 0.4431373, 1, 1,
0.1983322, 1.324246, -1.316015, 0, 0.4352941, 1, 1,
0.1985077, 0.6150727, 0.2935575, 0, 0.4313726, 1, 1,
0.1993025, -0.3243597, 1.314216, 0, 0.4235294, 1, 1,
0.2152815, 0.03568286, -0.1475676, 0, 0.4196078, 1, 1,
0.2157961, 0.2800081, 1.196956, 0, 0.4117647, 1, 1,
0.2162806, -2.163479, 2.806867, 0, 0.4078431, 1, 1,
0.2250414, 2.630079, 0.1116787, 0, 0.4, 1, 1,
0.2262319, 0.7625243, 0.6029534, 0, 0.3921569, 1, 1,
0.2278783, -0.6905375, 4.487404, 0, 0.3882353, 1, 1,
0.2294137, -1.378058, 3.119278, 0, 0.3803922, 1, 1,
0.232017, 1.214613, -0.4191136, 0, 0.3764706, 1, 1,
0.2362775, -0.3169414, 3.680598, 0, 0.3686275, 1, 1,
0.2377387, 0.4794125, 0.4921218, 0, 0.3647059, 1, 1,
0.2393572, 0.4705289, 1.732428, 0, 0.3568628, 1, 1,
0.2398968, 0.2644759, 0.08441328, 0, 0.3529412, 1, 1,
0.2425015, -1.840963, 3.939174, 0, 0.345098, 1, 1,
0.2438546, 1.234169, 0.5105664, 0, 0.3411765, 1, 1,
0.2457822, 0.3826961, 0.2338865, 0, 0.3333333, 1, 1,
0.2541249, 0.2377246, 0.145937, 0, 0.3294118, 1, 1,
0.2600998, -0.9819599, 3.108611, 0, 0.3215686, 1, 1,
0.2621601, 0.7992548, -1.089631, 0, 0.3176471, 1, 1,
0.2645398, -0.3914137, 2.693546, 0, 0.3098039, 1, 1,
0.267627, -0.1237718, 4.21629, 0, 0.3058824, 1, 1,
0.2691068, 0.1825867, 2.08566, 0, 0.2980392, 1, 1,
0.2729872, -0.7974412, 3.199544, 0, 0.2901961, 1, 1,
0.2770483, -0.5054603, 2.176784, 0, 0.2862745, 1, 1,
0.2796728, -0.8609513, 2.139036, 0, 0.2784314, 1, 1,
0.2809702, 0.8075882, 0.9697409, 0, 0.2745098, 1, 1,
0.2845838, -0.2770986, 2.952972, 0, 0.2666667, 1, 1,
0.2855786, 0.3477208, 0.2262512, 0, 0.2627451, 1, 1,
0.288445, 0.7721891, 0.6238493, 0, 0.254902, 1, 1,
0.289961, 0.2012833, 0.679086, 0, 0.2509804, 1, 1,
0.2911932, -1.842458, 2.073694, 0, 0.2431373, 1, 1,
0.2932795, 3.590504, -0.768645, 0, 0.2392157, 1, 1,
0.2952789, 1.107163, -0.1770764, 0, 0.2313726, 1, 1,
0.2981761, 0.4397492, 0.2138534, 0, 0.227451, 1, 1,
0.3024137, 0.8085074, -1.353753, 0, 0.2196078, 1, 1,
0.3081737, 1.652955, 0.03606452, 0, 0.2156863, 1, 1,
0.3116792, 0.1697115, 0.3994218, 0, 0.2078431, 1, 1,
0.3125402, 1.127594, -0.08106547, 0, 0.2039216, 1, 1,
0.31292, 0.412366, 0.2578117, 0, 0.1960784, 1, 1,
0.3146648, -0.1898164, 2.091392, 0, 0.1882353, 1, 1,
0.3167488, -1.283917, 3.279785, 0, 0.1843137, 1, 1,
0.3198616, -0.142668, 1.007384, 0, 0.1764706, 1, 1,
0.3218105, 1.394602, 0.6067346, 0, 0.172549, 1, 1,
0.327038, -1.978222, 2.581827, 0, 0.1647059, 1, 1,
0.3302808, 0.8349499, 0.8678421, 0, 0.1607843, 1, 1,
0.3304154, -0.5009046, 0.3441059, 0, 0.1529412, 1, 1,
0.333675, -0.7605937, 3.420837, 0, 0.1490196, 1, 1,
0.3342358, -0.4057418, 2.013153, 0, 0.1411765, 1, 1,
0.3419975, 1.482877, -0.214445, 0, 0.1372549, 1, 1,
0.3434806, -1.255752, 3.059988, 0, 0.1294118, 1, 1,
0.3503269, 5.749315e-05, 1.954825, 0, 0.1254902, 1, 1,
0.3506928, -0.3702492, 3.479846, 0, 0.1176471, 1, 1,
0.3509878, -2.28388, 1.678145, 0, 0.1137255, 1, 1,
0.3541127, -0.2468496, 4.052307, 0, 0.1058824, 1, 1,
0.3552903, -1.702378, 1.562536, 0, 0.09803922, 1, 1,
0.3583601, 0.08787361, 2.383313, 0, 0.09411765, 1, 1,
0.3596616, 0.8925208, -1.544715, 0, 0.08627451, 1, 1,
0.361929, 0.7123098, 0.4861963, 0, 0.08235294, 1, 1,
0.3626902, -2.152757, 1.952235, 0, 0.07450981, 1, 1,
0.3641737, -0.7652243, 4.041607, 0, 0.07058824, 1, 1,
0.3646749, 1.234444, 0.07120802, 0, 0.0627451, 1, 1,
0.37276, 0.9757937, -0.03691128, 0, 0.05882353, 1, 1,
0.3728391, 1.335327, -0.738885, 0, 0.05098039, 1, 1,
0.3757882, -1.039712, 3.838733, 0, 0.04705882, 1, 1,
0.3772219, -1.583595, 2.582546, 0, 0.03921569, 1, 1,
0.3792287, -0.344763, 2.695525, 0, 0.03529412, 1, 1,
0.3816461, 0.02344091, 1.923391, 0, 0.02745098, 1, 1,
0.3865313, -1.233362, 2.743946, 0, 0.02352941, 1, 1,
0.3917711, 0.5575739, 0.2568725, 0, 0.01568628, 1, 1,
0.3925434, 1.175837, -0.2945262, 0, 0.01176471, 1, 1,
0.3930809, -0.3507919, 1.52959, 0, 0.003921569, 1, 1,
0.3941953, -0.1864985, 4.738916, 0.003921569, 0, 1, 1,
0.3981397, 0.6486556, 1.37454, 0.007843138, 0, 1, 1,
0.4017305, 2.196659, 3.029388, 0.01568628, 0, 1, 1,
0.4021367, -0.4572486, 1.472634, 0.01960784, 0, 1, 1,
0.4034073, 1.527751, 1.494314, 0.02745098, 0, 1, 1,
0.4035114, 1.987183, -2.236962, 0.03137255, 0, 1, 1,
0.4045333, 0.1565846, 1.786855, 0.03921569, 0, 1, 1,
0.4125555, 1.357951, 0.3164068, 0.04313726, 0, 1, 1,
0.4158312, -0.669598, 2.43758, 0.05098039, 0, 1, 1,
0.4228317, -0.4933053, 1.738933, 0.05490196, 0, 1, 1,
0.4241551, -0.1314054, 0.9858448, 0.0627451, 0, 1, 1,
0.4246478, 0.9581138, 0.54286, 0.06666667, 0, 1, 1,
0.4249555, 1.463002, -0.4358326, 0.07450981, 0, 1, 1,
0.4257045, 0.02119362, 1.516012, 0.07843138, 0, 1, 1,
0.4361854, 2.19953, -1.293544, 0.08627451, 0, 1, 1,
0.4375638, -0.3592531, 2.956183, 0.09019608, 0, 1, 1,
0.438865, -0.4893283, 0.7361593, 0.09803922, 0, 1, 1,
0.4399059, 0.1829415, -0.1657669, 0.1058824, 0, 1, 1,
0.4400218, -0.7241991, 2.388332, 0.1098039, 0, 1, 1,
0.4403352, -0.8836056, 3.139286, 0.1176471, 0, 1, 1,
0.4476266, -0.00861411, 0.2507169, 0.1215686, 0, 1, 1,
0.4483292, 0.3986673, 0.4678192, 0.1294118, 0, 1, 1,
0.4567629, 0.497916, 2.55607, 0.1333333, 0, 1, 1,
0.4590593, 0.559417, 0.5649406, 0.1411765, 0, 1, 1,
0.4630346, -0.5197231, 2.723177, 0.145098, 0, 1, 1,
0.466217, -0.748838, 3.866631, 0.1529412, 0, 1, 1,
0.4668279, -0.8452681, 3.185105, 0.1568628, 0, 1, 1,
0.4683163, -0.3659122, 2.219214, 0.1647059, 0, 1, 1,
0.4702604, -1.393896, 3.364363, 0.1686275, 0, 1, 1,
0.4712772, 1.500079, -0.9920976, 0.1764706, 0, 1, 1,
0.4733562, 0.9682275, 0.2104421, 0.1803922, 0, 1, 1,
0.4739954, 2.855565, 0.7041119, 0.1882353, 0, 1, 1,
0.4756721, -0.3199231, 3.207356, 0.1921569, 0, 1, 1,
0.4759817, 0.2619459, 0.5801287, 0.2, 0, 1, 1,
0.4774339, -0.5737708, 2.695934, 0.2078431, 0, 1, 1,
0.4808469, -0.7243031, 1.909793, 0.2117647, 0, 1, 1,
0.481946, -0.6338489, 2.149302, 0.2196078, 0, 1, 1,
0.4894782, 1.178702, -0.3232709, 0.2235294, 0, 1, 1,
0.4911071, 0.2138942, 1.418526, 0.2313726, 0, 1, 1,
0.4936632, -0.5046642, 2.917835, 0.2352941, 0, 1, 1,
0.494738, -0.7066839, 2.111467, 0.2431373, 0, 1, 1,
0.4950982, 0.7702544, -0.05822391, 0.2470588, 0, 1, 1,
0.5021697, 0.063998, 1.892973, 0.254902, 0, 1, 1,
0.5024581, -1.677308, 2.840302, 0.2588235, 0, 1, 1,
0.5031716, 1.413843, -1.370899, 0.2666667, 0, 1, 1,
0.5037202, 0.5366349, -1.141574, 0.2705882, 0, 1, 1,
0.5088772, -0.2434366, 1.370175, 0.2784314, 0, 1, 1,
0.5196494, -1.065094, 1.473542, 0.282353, 0, 1, 1,
0.5217359, -0.704126, 2.164101, 0.2901961, 0, 1, 1,
0.52736, 0.8344011, 3.063862, 0.2941177, 0, 1, 1,
0.5306979, 0.6681678, -0.800429, 0.3019608, 0, 1, 1,
0.5413844, 0.3169282, 2.445754, 0.3098039, 0, 1, 1,
0.5424921, -0.129146, 2.964675, 0.3137255, 0, 1, 1,
0.5446087, 1.936596, 0.201229, 0.3215686, 0, 1, 1,
0.5584621, 1.120321, 0.4026643, 0.3254902, 0, 1, 1,
0.5594049, 0.04091819, 0.8670088, 0.3333333, 0, 1, 1,
0.5608842, -0.3238774, 1.068565, 0.3372549, 0, 1, 1,
0.5618162, -0.9804786, 2.85561, 0.345098, 0, 1, 1,
0.5708361, -1.117145, 2.841173, 0.3490196, 0, 1, 1,
0.5786009, -0.5186452, 1.599923, 0.3568628, 0, 1, 1,
0.578808, -0.5763096, 1.328242, 0.3607843, 0, 1, 1,
0.5823881, -0.04625668, 1.459212, 0.3686275, 0, 1, 1,
0.5855059, 0.3925087, 1.091311, 0.372549, 0, 1, 1,
0.5898672, 1.964973, -0.02444341, 0.3803922, 0, 1, 1,
0.5904877, 0.8847268, -0.6689983, 0.3843137, 0, 1, 1,
0.5908148, 0.0497944, 1.736635, 0.3921569, 0, 1, 1,
0.5960388, 0.5188092, 0.4661875, 0.3960784, 0, 1, 1,
0.5972598, -0.1468576, 3.222534, 0.4039216, 0, 1, 1,
0.6017744, 1.089131, 0.237438, 0.4117647, 0, 1, 1,
0.6019243, 0.7216442, 1.508804, 0.4156863, 0, 1, 1,
0.6041967, -1.020674, 2.064276, 0.4235294, 0, 1, 1,
0.604601, -0.5242247, 1.977708, 0.427451, 0, 1, 1,
0.6076719, 0.1222751, 2.934353, 0.4352941, 0, 1, 1,
0.6105165, 0.4668219, 0.7175059, 0.4392157, 0, 1, 1,
0.6136103, 0.6435422, 0.3390872, 0.4470588, 0, 1, 1,
0.6196955, -0.07253936, 2.893648, 0.4509804, 0, 1, 1,
0.6212485, -1.986607, 2.785052, 0.4588235, 0, 1, 1,
0.622626, 1.456584, 1.317718, 0.4627451, 0, 1, 1,
0.6227648, 0.04165921, 1.207319, 0.4705882, 0, 1, 1,
0.625751, 0.007631073, 1.925516, 0.4745098, 0, 1, 1,
0.6259825, 0.2748016, 1.251276, 0.4823529, 0, 1, 1,
0.6270211, 0.9354447, 2.529856, 0.4862745, 0, 1, 1,
0.6364684, -0.7470531, 2.861531, 0.4941176, 0, 1, 1,
0.6385685, -0.9309743, 3.365345, 0.5019608, 0, 1, 1,
0.6401089, -0.8795376, 2.006771, 0.5058824, 0, 1, 1,
0.6445295, 0.7965528, 0.6722781, 0.5137255, 0, 1, 1,
0.6447469, 0.2083509, 1.907685, 0.5176471, 0, 1, 1,
0.6452172, 0.4038866, -0.8274763, 0.5254902, 0, 1, 1,
0.6494458, 0.4374622, 0.1013593, 0.5294118, 0, 1, 1,
0.6646221, 0.974206, -1.308249, 0.5372549, 0, 1, 1,
0.6656698, 0.4151728, 0.3009327, 0.5411765, 0, 1, 1,
0.6709644, -0.02710839, 1.040081, 0.5490196, 0, 1, 1,
0.6709731, -0.07200088, 1.908895, 0.5529412, 0, 1, 1,
0.6744635, -0.2682503, 1.411885, 0.5607843, 0, 1, 1,
0.6759767, 0.7635412, 0.7370175, 0.5647059, 0, 1, 1,
0.6830999, -0.01583777, 2.759573, 0.572549, 0, 1, 1,
0.6848413, 0.4017002, 1.2519, 0.5764706, 0, 1, 1,
0.6863054, 0.4865839, -0.1143796, 0.5843138, 0, 1, 1,
0.6908981, 1.482126, 0.504161, 0.5882353, 0, 1, 1,
0.6951581, 0.1510936, 2.219143, 0.5960785, 0, 1, 1,
0.7003469, 1.074249, -0.2683661, 0.6039216, 0, 1, 1,
0.7023085, -0.4389865, 3.465588, 0.6078432, 0, 1, 1,
0.7024531, 1.211901, -0.9226364, 0.6156863, 0, 1, 1,
0.7105388, 0.2639861, 1.472849, 0.6196079, 0, 1, 1,
0.715983, -1.00641, 2.500508, 0.627451, 0, 1, 1,
0.7169222, 0.551109, 1.982005, 0.6313726, 0, 1, 1,
0.7170061, 1.434944, -1.8479, 0.6392157, 0, 1, 1,
0.7187825, -0.02765476, 1.720971, 0.6431373, 0, 1, 1,
0.7245764, -1.298547, 3.347403, 0.6509804, 0, 1, 1,
0.7289184, -0.2093461, 3.272882, 0.654902, 0, 1, 1,
0.7292769, -0.9622715, 3.332863, 0.6627451, 0, 1, 1,
0.7352575, 1.277113, 0.0722652, 0.6666667, 0, 1, 1,
0.7368818, -0.4879131, 3.499699, 0.6745098, 0, 1, 1,
0.7422943, 1.149408, 1.079412, 0.6784314, 0, 1, 1,
0.7434777, -1.171556, 2.206385, 0.6862745, 0, 1, 1,
0.7445834, -1.056023, 1.071874, 0.6901961, 0, 1, 1,
0.747162, 0.4386667, -0.262821, 0.6980392, 0, 1, 1,
0.7517499, 1.593951, 1.417836, 0.7058824, 0, 1, 1,
0.7620944, 0.8164903, -0.5207246, 0.7098039, 0, 1, 1,
0.7632725, -0.9671025, 2.072517, 0.7176471, 0, 1, 1,
0.773074, 1.351215, 1.356515, 0.7215686, 0, 1, 1,
0.7730914, -0.4520789, 3.437858, 0.7294118, 0, 1, 1,
0.7749927, -0.3926266, 1.954141, 0.7333333, 0, 1, 1,
0.7772094, 0.5944726, 1.502871, 0.7411765, 0, 1, 1,
0.7837965, -0.4613374, 2.94438, 0.7450981, 0, 1, 1,
0.7919477, -0.6829891, 2.346622, 0.7529412, 0, 1, 1,
0.796663, 1.042376, -0.117433, 0.7568628, 0, 1, 1,
0.799551, -1.282306, 0.9127714, 0.7647059, 0, 1, 1,
0.8060216, 1.279151, 0.5250731, 0.7686275, 0, 1, 1,
0.8109828, -0.4466747, 0.2752477, 0.7764706, 0, 1, 1,
0.813281, -0.06093711, 2.001643, 0.7803922, 0, 1, 1,
0.8163078, -1.40214, 0.7481474, 0.7882353, 0, 1, 1,
0.8181816, -1.215462, 4.308861, 0.7921569, 0, 1, 1,
0.8223312, -0.9632471, 4.038425, 0.8, 0, 1, 1,
0.8496885, -0.0322295, 1.775039, 0.8078431, 0, 1, 1,
0.8537623, -0.5594859, 1.595784, 0.8117647, 0, 1, 1,
0.8554931, -0.05913418, 1.365243, 0.8196079, 0, 1, 1,
0.8587257, -1.648214, 3.675203, 0.8235294, 0, 1, 1,
0.8645819, 1.898658, 0.726992, 0.8313726, 0, 1, 1,
0.8745367, -0.4454874, 0.2907829, 0.8352941, 0, 1, 1,
0.8746167, 1.481943, 0.9508188, 0.8431373, 0, 1, 1,
0.8757849, 0.9709975, 0.6435159, 0.8470588, 0, 1, 1,
0.8818879, -0.5999214, 2.602758, 0.854902, 0, 1, 1,
0.8827071, -0.7062134, 2.395016, 0.8588235, 0, 1, 1,
0.8953368, 1.4062, -0.536728, 0.8666667, 0, 1, 1,
0.8985081, -0.5015491, 2.93682, 0.8705882, 0, 1, 1,
0.9003322, 0.4203388, 2.73725, 0.8784314, 0, 1, 1,
0.9004685, -0.6467823, 2.620471, 0.8823529, 0, 1, 1,
0.9014158, -0.2098272, 1.688077, 0.8901961, 0, 1, 1,
0.9062606, -0.3910662, 3.712762, 0.8941177, 0, 1, 1,
0.9155297, 0.1807316, 2.202728, 0.9019608, 0, 1, 1,
0.9184083, -0.4793367, 2.041535, 0.9098039, 0, 1, 1,
0.9203056, -0.7381406, 3.705088, 0.9137255, 0, 1, 1,
0.9209613, -0.7785611, 2.162115, 0.9215686, 0, 1, 1,
0.9315298, -0.3970044, 1.185928, 0.9254902, 0, 1, 1,
0.933248, -0.1404265, 3.351252, 0.9333333, 0, 1, 1,
0.9358206, 0.4964741, 1.318151, 0.9372549, 0, 1, 1,
0.9396417, 1.568793, 0.8225138, 0.945098, 0, 1, 1,
0.9419903, -2.160822, 3.207778, 0.9490196, 0, 1, 1,
0.9459464, 0.6031823, -0.4694791, 0.9568627, 0, 1, 1,
0.9472706, -0.192819, 0.718421, 0.9607843, 0, 1, 1,
0.9518761, -0.7184465, 0.8039087, 0.9686275, 0, 1, 1,
0.957509, -1.86355, 2.048576, 0.972549, 0, 1, 1,
0.9580387, 1.604916, 0.6003619, 0.9803922, 0, 1, 1,
0.9624385, -0.06184624, 1.1581, 0.9843137, 0, 1, 1,
0.9656127, -0.3646189, -0.3116747, 0.9921569, 0, 1, 1,
0.9831988, -0.3205201, 0.4310755, 0.9960784, 0, 1, 1,
0.98448, 3.278044, 1.722721, 1, 0, 0.9960784, 1,
0.9859977, -1.718549, 1.911768, 1, 0, 0.9882353, 1,
0.9885497, 0.1654109, 1.095553, 1, 0, 0.9843137, 1,
0.9886106, 1.264104, 1.210027, 1, 0, 0.9764706, 1,
0.9975381, 0.4379126, 2.326712, 1, 0, 0.972549, 1,
0.9983654, 0.05634484, 1.224569, 1, 0, 0.9647059, 1,
1.001103, 0.1653485, 1.477951, 1, 0, 0.9607843, 1,
1.004665, -1.019921, 1.257827, 1, 0, 0.9529412, 1,
1.016774, 1.795362, 0.9003888, 1, 0, 0.9490196, 1,
1.025769, -1.604737, 3.341891, 1, 0, 0.9411765, 1,
1.028108, -0.194162, 2.108685, 1, 0, 0.9372549, 1,
1.031538, 0.3315733, 1.042289, 1, 0, 0.9294118, 1,
1.040803, -0.9291544, 2.879788, 1, 0, 0.9254902, 1,
1.042191, -1.651559, 2.583017, 1, 0, 0.9176471, 1,
1.044986, -0.00117668, 0.8958216, 1, 0, 0.9137255, 1,
1.045974, -1.915121, 3.273533, 1, 0, 0.9058824, 1,
1.047143, 0.3321254, -0.7898706, 1, 0, 0.9019608, 1,
1.053071, -0.4973643, 2.091793, 1, 0, 0.8941177, 1,
1.053932, 0.4763878, 1.888956, 1, 0, 0.8862745, 1,
1.056124, -0.4180806, 2.740675, 1, 0, 0.8823529, 1,
1.057078, 1.14823, 1.285057, 1, 0, 0.8745098, 1,
1.058486, -1.266489, 4.459057, 1, 0, 0.8705882, 1,
1.060802, 0.9134395, 1.257156, 1, 0, 0.8627451, 1,
1.061334, 1.133463, 0.5107595, 1, 0, 0.8588235, 1,
1.068122, 0.7989256, -0.2160743, 1, 0, 0.8509804, 1,
1.070515, -0.04642576, -0.1749914, 1, 0, 0.8470588, 1,
1.073496, -0.7110279, 3.48152, 1, 0, 0.8392157, 1,
1.081176, 0.8711577, 1.307365, 1, 0, 0.8352941, 1,
1.085262, -0.747457, 2.772586, 1, 0, 0.827451, 1,
1.0949, -0.04376786, 1.081478, 1, 0, 0.8235294, 1,
1.0965, 0.3001038, 2.668231, 1, 0, 0.8156863, 1,
1.101407, -0.683468, 2.792242, 1, 0, 0.8117647, 1,
1.101486, 0.4171579, 1.018728, 1, 0, 0.8039216, 1,
1.101894, -0.5655113, 2.373412, 1, 0, 0.7960784, 1,
1.105226, -0.1167411, 1.366159, 1, 0, 0.7921569, 1,
1.112654, 0.6238383, 0.1859917, 1, 0, 0.7843137, 1,
1.114886, -0.3692479, 1.439802, 1, 0, 0.7803922, 1,
1.118595, -0.04245595, 1.785377, 1, 0, 0.772549, 1,
1.121616, 2.348851, 0.009261631, 1, 0, 0.7686275, 1,
1.124755, 0.3800125, 1.593921, 1, 0, 0.7607843, 1,
1.130526, -0.4903426, 0.5117358, 1, 0, 0.7568628, 1,
1.130547, -0.9680859, 4.341525, 1, 0, 0.7490196, 1,
1.131115, -1.330868, 2.579138, 1, 0, 0.7450981, 1,
1.137886, -0.6396733, 2.808251, 1, 0, 0.7372549, 1,
1.148582, -0.0347662, 1.113954, 1, 0, 0.7333333, 1,
1.159261, -0.1985595, 2.000499, 1, 0, 0.7254902, 1,
1.162832, 0.6539771, 1.860844, 1, 0, 0.7215686, 1,
1.16381, -1.453499, 3.213274, 1, 0, 0.7137255, 1,
1.174046, -0.7864987, 3.067423, 1, 0, 0.7098039, 1,
1.176896, 0.8807962, 2.576247, 1, 0, 0.7019608, 1,
1.177727, -0.4537601, 3.06842, 1, 0, 0.6941177, 1,
1.180035, -0.06443527, 2.324534, 1, 0, 0.6901961, 1,
1.185514, 0.3208168, 1.444515, 1, 0, 0.682353, 1,
1.192155, -1.929427, 2.571891, 1, 0, 0.6784314, 1,
1.199766, 0.6040901, 1.046831, 1, 0, 0.6705883, 1,
1.2038, -0.5645555, 0.715974, 1, 0, 0.6666667, 1,
1.218332, 0.1767413, 1.145826, 1, 0, 0.6588235, 1,
1.222639, 0.09242749, 0.6817758, 1, 0, 0.654902, 1,
1.223628, -0.7324356, 1.876622, 1, 0, 0.6470588, 1,
1.227069, 0.5552546, 3.441144, 1, 0, 0.6431373, 1,
1.235153, -0.8280452, 0.2928128, 1, 0, 0.6352941, 1,
1.247573, 1.169272, 0.5875069, 1, 0, 0.6313726, 1,
1.248473, -0.6876616, 2.486417, 1, 0, 0.6235294, 1,
1.257338, 0.2121281, 2.587863, 1, 0, 0.6196079, 1,
1.2815, -0.727587, 2.702954, 1, 0, 0.6117647, 1,
1.288139, 2.372942, 0.9181809, 1, 0, 0.6078432, 1,
1.29782, -0.3452437, 2.462041, 1, 0, 0.6, 1,
1.299478, 0.07534484, 0.2404239, 1, 0, 0.5921569, 1,
1.299705, 1.081654, 0.601084, 1, 0, 0.5882353, 1,
1.310997, 1.46356, 1.43487, 1, 0, 0.5803922, 1,
1.314598, -0.8541873, 1.789388, 1, 0, 0.5764706, 1,
1.317007, -1.922193, 1.821776, 1, 0, 0.5686275, 1,
1.319287, -0.1588272, 0.5793498, 1, 0, 0.5647059, 1,
1.326824, 1.868708, 0.8006297, 1, 0, 0.5568628, 1,
1.327762, -0.4151733, 2.029789, 1, 0, 0.5529412, 1,
1.329139, -1.595435, 2.250701, 1, 0, 0.5450981, 1,
1.329788, 0.6299398, 2.683567, 1, 0, 0.5411765, 1,
1.330441, 0.1607361, 2.605167, 1, 0, 0.5333334, 1,
1.335532, 0.7699159, 0.1468728, 1, 0, 0.5294118, 1,
1.335959, -0.2107907, 3.57887, 1, 0, 0.5215687, 1,
1.339153, -0.9488059, 2.349425, 1, 0, 0.5176471, 1,
1.340237, 0.02458269, 3.18582, 1, 0, 0.509804, 1,
1.344614, -1.681766, 1.903487, 1, 0, 0.5058824, 1,
1.349374, -2.975772, 1.569971, 1, 0, 0.4980392, 1,
1.357496, 1.763329, 0.7979675, 1, 0, 0.4901961, 1,
1.358756, -0.6825088, 3.432003, 1, 0, 0.4862745, 1,
1.359635, -0.1616871, 0.4191952, 1, 0, 0.4784314, 1,
1.368851, -1.662979, 1.330907, 1, 0, 0.4745098, 1,
1.383759, -0.7114142, 1.778116, 1, 0, 0.4666667, 1,
1.389425, 1.901467, 1.700173, 1, 0, 0.4627451, 1,
1.397751, 0.9886334, -0.2860487, 1, 0, 0.454902, 1,
1.408227, -1.713882, 2.764562, 1, 0, 0.4509804, 1,
1.417963, 0.505141, -0.6458229, 1, 0, 0.4431373, 1,
1.423407, 0.1830357, 3.311951, 1, 0, 0.4392157, 1,
1.435887, -0.4868225, 2.936728, 1, 0, 0.4313726, 1,
1.441175, 1.125115, 1.62328, 1, 0, 0.427451, 1,
1.447967, -0.4953436, 1.817245, 1, 0, 0.4196078, 1,
1.45449, -1.602223, 2.655352, 1, 0, 0.4156863, 1,
1.473432, -0.007806178, 0.8026139, 1, 0, 0.4078431, 1,
1.477671, -1.51081, 3.516024, 1, 0, 0.4039216, 1,
1.485863, -0.3010302, 1.4255, 1, 0, 0.3960784, 1,
1.49999, 1.168783, 0.7728382, 1, 0, 0.3882353, 1,
1.504967, 0.2222966, 1.030944, 1, 0, 0.3843137, 1,
1.520201, -1.53089, 2.089292, 1, 0, 0.3764706, 1,
1.521625, 0.8464492, 0.2042271, 1, 0, 0.372549, 1,
1.524264, 0.6651477, 0.2065821, 1, 0, 0.3647059, 1,
1.525752, -0.5686329, 0.349241, 1, 0, 0.3607843, 1,
1.527292, -1.842172, 1.977933, 1, 0, 0.3529412, 1,
1.536587, 0.3427882, 0.3646463, 1, 0, 0.3490196, 1,
1.561853, 0.03659141, 0.178622, 1, 0, 0.3411765, 1,
1.580529, -0.6810395, -0.1419715, 1, 0, 0.3372549, 1,
1.584393, 0.8041487, 2.173303, 1, 0, 0.3294118, 1,
1.591812, -0.09526978, 1.374632, 1, 0, 0.3254902, 1,
1.601838, -1.563121, 3.237491, 1, 0, 0.3176471, 1,
1.604191, 0.7740067, 1.348482, 1, 0, 0.3137255, 1,
1.614681, -1.031459, 1.102335, 1, 0, 0.3058824, 1,
1.617737, 0.646605, 2.534934, 1, 0, 0.2980392, 1,
1.63008, 1.992631, 0.8568386, 1, 0, 0.2941177, 1,
1.669377, 0.1821015, 0.2681396, 1, 0, 0.2862745, 1,
1.696804, -0.4505934, 3.072302, 1, 0, 0.282353, 1,
1.711033, 0.8295105, 1.756172, 1, 0, 0.2745098, 1,
1.713372, 0.06975457, 2.148198, 1, 0, 0.2705882, 1,
1.71353, 2.463828, 0.7754455, 1, 0, 0.2627451, 1,
1.720346, -1.057521, 2.121372, 1, 0, 0.2588235, 1,
1.721347, 1.1161, 0.07891954, 1, 0, 0.2509804, 1,
1.724828, 0.4402453, 1.002119, 1, 0, 0.2470588, 1,
1.727134, 1.191366, -0.1087596, 1, 0, 0.2392157, 1,
1.745991, -0.746891, 2.501394, 1, 0, 0.2352941, 1,
1.746615, 0.5415621, 2.688578, 1, 0, 0.227451, 1,
1.760059, -0.3640824, 2.649576, 1, 0, 0.2235294, 1,
1.774521, -0.1925091, 0.8487963, 1, 0, 0.2156863, 1,
1.820138, 0.8641261, 2.792747, 1, 0, 0.2117647, 1,
1.833132, 0.4188765, 0.3493209, 1, 0, 0.2039216, 1,
1.839166, -1.069632, 2.44312, 1, 0, 0.1960784, 1,
1.841418, -1.126345, 1.401959, 1, 0, 0.1921569, 1,
1.863059, 1.457679, 2.254593, 1, 0, 0.1843137, 1,
1.87779, -0.311148, 1.518201, 1, 0, 0.1803922, 1,
1.88314, -0.04638277, 1.517285, 1, 0, 0.172549, 1,
1.898928, -1.452746, 3.643834, 1, 0, 0.1686275, 1,
1.907959, -1.053992, 1.948758, 1, 0, 0.1607843, 1,
1.90882, 1.143458, 0.986166, 1, 0, 0.1568628, 1,
1.909002, -0.1831464, 1.904331, 1, 0, 0.1490196, 1,
1.922051, 0.5712929, 0.8591245, 1, 0, 0.145098, 1,
1.935346, 0.8627315, 0.9364003, 1, 0, 0.1372549, 1,
1.942574, 0.3798335, 3.106512, 1, 0, 0.1333333, 1,
2.011645, 1.034166, 1.252998, 1, 0, 0.1254902, 1,
2.038218, 0.6785473, 2.601797, 1, 0, 0.1215686, 1,
2.043289, -0.639699, 1.700614, 1, 0, 0.1137255, 1,
2.044409, -0.5228367, 2.881473, 1, 0, 0.1098039, 1,
2.061676, -0.6218317, 2.768913, 1, 0, 0.1019608, 1,
2.074054, 0.02836046, 0.7711868, 1, 0, 0.09411765, 1,
2.120039, 0.2070888, 1.071628, 1, 0, 0.09019608, 1,
2.153238, 0.8080885, 2.799502, 1, 0, 0.08235294, 1,
2.190383, 0.5019379, 2.28866, 1, 0, 0.07843138, 1,
2.220058, -0.6209216, 2.013561, 1, 0, 0.07058824, 1,
2.28423, -0.09111789, 1.229948, 1, 0, 0.06666667, 1,
2.291188, 0.3759005, 0.3566909, 1, 0, 0.05882353, 1,
2.319507, 0.5108789, 1.213134, 1, 0, 0.05490196, 1,
2.327282, 0.7443103, 1.292022, 1, 0, 0.04705882, 1,
2.363367, 1.276924, 1.368759, 1, 0, 0.04313726, 1,
2.367969, -1.289725, 0.1426132, 1, 0, 0.03529412, 1,
2.436887, 0.179671, 0.2578713, 1, 0, 0.03137255, 1,
2.582836, 0.6151148, 2.91722, 1, 0, 0.02352941, 1,
2.665023, -0.03102542, 0.7081323, 1, 0, 0.01960784, 1,
3.061441, 0.1375165, 0.7823278, 1, 0, 0.01176471, 1,
3.440346, 1.46644, 0.9776873, 1, 0, 0.007843138, 1
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
0.1120443, -4.088756, -7.562278, 0, -0.5, 0.5, 0.5,
0.1120443, -4.088756, -7.562278, 1, -0.5, 0.5, 0.5,
0.1120443, -4.088756, -7.562278, 1, 1.5, 0.5, 0.5,
0.1120443, -4.088756, -7.562278, 0, 1.5, 0.5, 0.5
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
-4.344552, 0.3073659, -7.562278, 0, -0.5, 0.5, 0.5,
-4.344552, 0.3073659, -7.562278, 1, -0.5, 0.5, 0.5,
-4.344552, 0.3073659, -7.562278, 1, 1.5, 0.5, 0.5,
-4.344552, 0.3073659, -7.562278, 0, 1.5, 0.5, 0.5
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
-4.344552, -4.088756, -0.5202518, 0, -0.5, 0.5, 0.5,
-4.344552, -4.088756, -0.5202518, 1, -0.5, 0.5, 0.5,
-4.344552, -4.088756, -0.5202518, 1, 1.5, 0.5, 0.5,
-4.344552, -4.088756, -0.5202518, 0, 1.5, 0.5, 0.5
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
-3, -3.074266, -5.937195,
3, -3.074266, -5.937195,
-3, -3.074266, -5.937195,
-3, -3.243348, -6.208042,
-2, -3.074266, -5.937195,
-2, -3.243348, -6.208042,
-1, -3.074266, -5.937195,
-1, -3.243348, -6.208042,
0, -3.074266, -5.937195,
0, -3.243348, -6.208042,
1, -3.074266, -5.937195,
1, -3.243348, -6.208042,
2, -3.074266, -5.937195,
2, -3.243348, -6.208042,
3, -3.074266, -5.937195,
3, -3.243348, -6.208042
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
-3, -3.581511, -6.749736, 0, -0.5, 0.5, 0.5,
-3, -3.581511, -6.749736, 1, -0.5, 0.5, 0.5,
-3, -3.581511, -6.749736, 1, 1.5, 0.5, 0.5,
-3, -3.581511, -6.749736, 0, 1.5, 0.5, 0.5,
-2, -3.581511, -6.749736, 0, -0.5, 0.5, 0.5,
-2, -3.581511, -6.749736, 1, -0.5, 0.5, 0.5,
-2, -3.581511, -6.749736, 1, 1.5, 0.5, 0.5,
-2, -3.581511, -6.749736, 0, 1.5, 0.5, 0.5,
-1, -3.581511, -6.749736, 0, -0.5, 0.5, 0.5,
-1, -3.581511, -6.749736, 1, -0.5, 0.5, 0.5,
-1, -3.581511, -6.749736, 1, 1.5, 0.5, 0.5,
-1, -3.581511, -6.749736, 0, 1.5, 0.5, 0.5,
0, -3.581511, -6.749736, 0, -0.5, 0.5, 0.5,
0, -3.581511, -6.749736, 1, -0.5, 0.5, 0.5,
0, -3.581511, -6.749736, 1, 1.5, 0.5, 0.5,
0, -3.581511, -6.749736, 0, 1.5, 0.5, 0.5,
1, -3.581511, -6.749736, 0, -0.5, 0.5, 0.5,
1, -3.581511, -6.749736, 1, -0.5, 0.5, 0.5,
1, -3.581511, -6.749736, 1, 1.5, 0.5, 0.5,
1, -3.581511, -6.749736, 0, 1.5, 0.5, 0.5,
2, -3.581511, -6.749736, 0, -0.5, 0.5, 0.5,
2, -3.581511, -6.749736, 1, -0.5, 0.5, 0.5,
2, -3.581511, -6.749736, 1, 1.5, 0.5, 0.5,
2, -3.581511, -6.749736, 0, 1.5, 0.5, 0.5,
3, -3.581511, -6.749736, 0, -0.5, 0.5, 0.5,
3, -3.581511, -6.749736, 1, -0.5, 0.5, 0.5,
3, -3.581511, -6.749736, 1, 1.5, 0.5, 0.5,
3, -3.581511, -6.749736, 0, 1.5, 0.5, 0.5
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
-3.316107, -2, -5.937195,
-3.316107, 3, -5.937195,
-3.316107, -2, -5.937195,
-3.487514, -2, -6.208042,
-3.316107, -1, -5.937195,
-3.487514, -1, -6.208042,
-3.316107, 0, -5.937195,
-3.487514, 0, -6.208042,
-3.316107, 1, -5.937195,
-3.487514, 1, -6.208042,
-3.316107, 2, -5.937195,
-3.487514, 2, -6.208042,
-3.316107, 3, -5.937195,
-3.487514, 3, -6.208042
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
-3.83033, -2, -6.749736, 0, -0.5, 0.5, 0.5,
-3.83033, -2, -6.749736, 1, -0.5, 0.5, 0.5,
-3.83033, -2, -6.749736, 1, 1.5, 0.5, 0.5,
-3.83033, -2, -6.749736, 0, 1.5, 0.5, 0.5,
-3.83033, -1, -6.749736, 0, -0.5, 0.5, 0.5,
-3.83033, -1, -6.749736, 1, -0.5, 0.5, 0.5,
-3.83033, -1, -6.749736, 1, 1.5, 0.5, 0.5,
-3.83033, -1, -6.749736, 0, 1.5, 0.5, 0.5,
-3.83033, 0, -6.749736, 0, -0.5, 0.5, 0.5,
-3.83033, 0, -6.749736, 1, -0.5, 0.5, 0.5,
-3.83033, 0, -6.749736, 1, 1.5, 0.5, 0.5,
-3.83033, 0, -6.749736, 0, 1.5, 0.5, 0.5,
-3.83033, 1, -6.749736, 0, -0.5, 0.5, 0.5,
-3.83033, 1, -6.749736, 1, -0.5, 0.5, 0.5,
-3.83033, 1, -6.749736, 1, 1.5, 0.5, 0.5,
-3.83033, 1, -6.749736, 0, 1.5, 0.5, 0.5,
-3.83033, 2, -6.749736, 0, -0.5, 0.5, 0.5,
-3.83033, 2, -6.749736, 1, -0.5, 0.5, 0.5,
-3.83033, 2, -6.749736, 1, 1.5, 0.5, 0.5,
-3.83033, 2, -6.749736, 0, 1.5, 0.5, 0.5,
-3.83033, 3, -6.749736, 0, -0.5, 0.5, 0.5,
-3.83033, 3, -6.749736, 1, -0.5, 0.5, 0.5,
-3.83033, 3, -6.749736, 1, 1.5, 0.5, 0.5,
-3.83033, 3, -6.749736, 0, 1.5, 0.5, 0.5
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
-3.316107, -3.074266, -4,
-3.316107, -3.074266, 4,
-3.316107, -3.074266, -4,
-3.487514, -3.243348, -4,
-3.316107, -3.074266, -2,
-3.487514, -3.243348, -2,
-3.316107, -3.074266, 0,
-3.487514, -3.243348, 0,
-3.316107, -3.074266, 2,
-3.487514, -3.243348, 2,
-3.316107, -3.074266, 4,
-3.487514, -3.243348, 4
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
-3.83033, -3.581511, -4, 0, -0.5, 0.5, 0.5,
-3.83033, -3.581511, -4, 1, -0.5, 0.5, 0.5,
-3.83033, -3.581511, -4, 1, 1.5, 0.5, 0.5,
-3.83033, -3.581511, -4, 0, 1.5, 0.5, 0.5,
-3.83033, -3.581511, -2, 0, -0.5, 0.5, 0.5,
-3.83033, -3.581511, -2, 1, -0.5, 0.5, 0.5,
-3.83033, -3.581511, -2, 1, 1.5, 0.5, 0.5,
-3.83033, -3.581511, -2, 0, 1.5, 0.5, 0.5,
-3.83033, -3.581511, 0, 0, -0.5, 0.5, 0.5,
-3.83033, -3.581511, 0, 1, -0.5, 0.5, 0.5,
-3.83033, -3.581511, 0, 1, 1.5, 0.5, 0.5,
-3.83033, -3.581511, 0, 0, 1.5, 0.5, 0.5,
-3.83033, -3.581511, 2, 0, -0.5, 0.5, 0.5,
-3.83033, -3.581511, 2, 1, -0.5, 0.5, 0.5,
-3.83033, -3.581511, 2, 1, 1.5, 0.5, 0.5,
-3.83033, -3.581511, 2, 0, 1.5, 0.5, 0.5,
-3.83033, -3.581511, 4, 0, -0.5, 0.5, 0.5,
-3.83033, -3.581511, 4, 1, -0.5, 0.5, 0.5,
-3.83033, -3.581511, 4, 1, 1.5, 0.5, 0.5,
-3.83033, -3.581511, 4, 0, 1.5, 0.5, 0.5
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
-3.316107, -3.074266, -5.937195,
-3.316107, 3.688998, -5.937195,
-3.316107, -3.074266, 4.896691,
-3.316107, 3.688998, 4.896691,
-3.316107, -3.074266, -5.937195,
-3.316107, -3.074266, 4.896691,
-3.316107, 3.688998, -5.937195,
-3.316107, 3.688998, 4.896691,
-3.316107, -3.074266, -5.937195,
3.540195, -3.074266, -5.937195,
-3.316107, -3.074266, 4.896691,
3.540195, -3.074266, 4.896691,
-3.316107, 3.688998, -5.937195,
3.540195, 3.688998, -5.937195,
-3.316107, 3.688998, 4.896691,
3.540195, 3.688998, 4.896691,
3.540195, -3.074266, -5.937195,
3.540195, 3.688998, -5.937195,
3.540195, -3.074266, 4.896691,
3.540195, 3.688998, 4.896691,
3.540195, -3.074266, -5.937195,
3.540195, -3.074266, 4.896691,
3.540195, 3.688998, -5.937195,
3.540195, 3.688998, 4.896691
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
var radius = 7.740393;
var distance = 34.43788;
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
mvMatrix.translate( -0.1120443, -0.3073659, 0.5202518 );
mvMatrix.scale( 1.220638, 1.23743, 0.7724896 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.43788);
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
ethanesulphonylamino<-read.table("ethanesulphonylamino.xyz")
```

```
## Error in read.table("ethanesulphonylamino.xyz"): no lines available in input
```

```r
x<-ethanesulphonylamino$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethanesulphonylamino' not found
```

```r
y<-ethanesulphonylamino$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethanesulphonylamino' not found
```

```r
z<-ethanesulphonylamino$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethanesulphonylamino' not found
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
-3.216258, 0.9773499, -2.172568, 0, 0, 1, 1, 1,
-2.908722, 0.1824069, -1.784454, 1, 0, 0, 1, 1,
-2.699512, 0.4189966, -2.432778, 1, 0, 0, 1, 1,
-2.669957, 1.057907, -0.3315216, 1, 0, 0, 1, 1,
-2.66655, -0.142701, -0.8722806, 1, 0, 0, 1, 1,
-2.648908, 0.3865123, -3.377836, 1, 0, 0, 1, 1,
-2.605359, -0.3948525, -2.46071, 0, 0, 0, 1, 1,
-2.605211, 1.465703, -0.3686356, 0, 0, 0, 1, 1,
-2.564183, -1.159501, -0.686427, 0, 0, 0, 1, 1,
-2.557668, 0.6627243, -1.748691, 0, 0, 0, 1, 1,
-2.413794, 0.9760173, -0.9761643, 0, 0, 0, 1, 1,
-2.353835, 0.6070457, 0.2845302, 0, 0, 0, 1, 1,
-2.313705, 0.4127483, -1.918169, 0, 0, 0, 1, 1,
-2.298383, 0.538142, -3.331437, 1, 1, 1, 1, 1,
-2.259107, -1.308158, -1.614555, 1, 1, 1, 1, 1,
-2.25056, -0.4176925, -2.363826, 1, 1, 1, 1, 1,
-2.163774, 1.70721, -0.7800055, 1, 1, 1, 1, 1,
-2.158218, -0.3973637, -2.179074, 1, 1, 1, 1, 1,
-2.115098, 1.939572, 0.1202051, 1, 1, 1, 1, 1,
-2.08051, 0.9413368, -1.280396, 1, 1, 1, 1, 1,
-2.061042, 0.8958146, -0.871777, 1, 1, 1, 1, 1,
-2.054954, 1.113865, -2.527926, 1, 1, 1, 1, 1,
-2.049031, 1.272073, -1.186944, 1, 1, 1, 1, 1,
-2.04162, -1.031588, -2.113209, 1, 1, 1, 1, 1,
-2.025295, 0.7344967, -1.281411, 1, 1, 1, 1, 1,
-2.013327, 2.538524, -0.4801068, 1, 1, 1, 1, 1,
-2.010436, -1.783861, -2.150359, 1, 1, 1, 1, 1,
-2.004722, -1.195434, -2.621046, 1, 1, 1, 1, 1,
-1.999464, -0.5689265, -4.178694, 0, 0, 1, 1, 1,
-1.966964, 0.6610317, 0.08840462, 1, 0, 0, 1, 1,
-1.94085, -1.932334, -2.880873, 1, 0, 0, 1, 1,
-1.936628, -0.5098006, 1.154693, 1, 0, 0, 1, 1,
-1.907414, -1.553748, -1.659171, 1, 0, 0, 1, 1,
-1.884546, 0.205389, -2.798392, 1, 0, 0, 1, 1,
-1.874049, -0.3823419, -1.979004, 0, 0, 0, 1, 1,
-1.872972, -1.651542, -1.381023, 0, 0, 0, 1, 1,
-1.866469, -0.2403224, -3.397485, 0, 0, 0, 1, 1,
-1.846548, -0.6421848, -0.9217193, 0, 0, 0, 1, 1,
-1.832758, 0.4686139, -0.7964116, 0, 0, 0, 1, 1,
-1.820058, -1.190076, -3.371509, 0, 0, 0, 1, 1,
-1.805852, -0.3625996, -1.118537, 0, 0, 0, 1, 1,
-1.790559, -1.079429, -3.134698, 1, 1, 1, 1, 1,
-1.782645, -0.3928802, 0.2024821, 1, 1, 1, 1, 1,
-1.777649, -0.2146816, -0.9588478, 1, 1, 1, 1, 1,
-1.754055, -2.289017, -2.37307, 1, 1, 1, 1, 1,
-1.736988, 2.812296, -1.625824, 1, 1, 1, 1, 1,
-1.725674, -0.8710479, -2.340848, 1, 1, 1, 1, 1,
-1.723933, 0.2991507, -1.265951, 1, 1, 1, 1, 1,
-1.723326, 2.361653, -1.329312, 1, 1, 1, 1, 1,
-1.702735, -0.4186899, -1.227435, 1, 1, 1, 1, 1,
-1.69593, -0.8963673, -2.647545, 1, 1, 1, 1, 1,
-1.6884, -1.524105, -3.012717, 1, 1, 1, 1, 1,
-1.688396, -2.792631, -1.571862, 1, 1, 1, 1, 1,
-1.682198, -1.208709, -2.16726, 1, 1, 1, 1, 1,
-1.670076, 0.6500378, -1.202219, 1, 1, 1, 1, 1,
-1.668477, -0.001309774, -1.339016, 1, 1, 1, 1, 1,
-1.661121, -0.0530698, -2.06566, 0, 0, 1, 1, 1,
-1.656882, 0.4433653, -3.726345, 1, 0, 0, 1, 1,
-1.651107, -0.8491848, -1.465111, 1, 0, 0, 1, 1,
-1.635922, 0.6244164, -1.383122, 1, 0, 0, 1, 1,
-1.619072, -0.6692467, -2.56694, 1, 0, 0, 1, 1,
-1.611785, -0.08389747, -1.884631, 1, 0, 0, 1, 1,
-1.590566, 0.09394185, -0.6277887, 0, 0, 0, 1, 1,
-1.586006, 0.2185193, -0.6998357, 0, 0, 0, 1, 1,
-1.58075, -0.4979741, -1.431428, 0, 0, 0, 1, 1,
-1.579779, 1.419568, -0.9914352, 0, 0, 0, 1, 1,
-1.579594, -0.3106389, -1.089374, 0, 0, 0, 1, 1,
-1.562988, 0.3948351, 0.4691143, 0, 0, 0, 1, 1,
-1.557305, -1.27027, -4.006981, 0, 0, 0, 1, 1,
-1.555654, 0.7126935, 0.7659732, 1, 1, 1, 1, 1,
-1.546595, -1.80932, -1.939885, 1, 1, 1, 1, 1,
-1.531235, 0.4580686, -2.574196, 1, 1, 1, 1, 1,
-1.530085, -0.1560864, -2.710165, 1, 1, 1, 1, 1,
-1.526653, 0.1550033, -1.870896, 1, 1, 1, 1, 1,
-1.52201, 0.3247313, -3.085755, 1, 1, 1, 1, 1,
-1.519086, 1.198031, -1.175366, 1, 1, 1, 1, 1,
-1.500253, 1.710612, -0.9230342, 1, 1, 1, 1, 1,
-1.499944, -0.8500263, -1.642208, 1, 1, 1, 1, 1,
-1.491918, 0.8482518, -0.04634537, 1, 1, 1, 1, 1,
-1.489612, 2.20187, -0.5891216, 1, 1, 1, 1, 1,
-1.486488, -0.5387926, -1.423441, 1, 1, 1, 1, 1,
-1.482295, 1.108827, -1.249788, 1, 1, 1, 1, 1,
-1.466457, 1.63404, -1.805136, 1, 1, 1, 1, 1,
-1.449354, -0.5981842, -1.275272, 1, 1, 1, 1, 1,
-1.443823, 3.025751, -0.0749663, 0, 0, 1, 1, 1,
-1.435714, 0.6967439, -1.587103, 1, 0, 0, 1, 1,
-1.434935, -0.409011, -2.105401, 1, 0, 0, 1, 1,
-1.426397, -1.080716, -2.379828, 1, 0, 0, 1, 1,
-1.420707, 0.1864098, -1.724141, 1, 0, 0, 1, 1,
-1.419152, 1.264451, -1.072101, 1, 0, 0, 1, 1,
-1.412085, -0.3769855, -1.574788, 0, 0, 0, 1, 1,
-1.393985, -0.7377862, -2.066305, 0, 0, 0, 1, 1,
-1.379443, 0.3127353, -0.7978156, 0, 0, 0, 1, 1,
-1.358834, 0.8843547, -1.857135, 0, 0, 0, 1, 1,
-1.352905, 0.4959845, -0.2218492, 0, 0, 0, 1, 1,
-1.349836, 1.145555, -1.83808, 0, 0, 0, 1, 1,
-1.345841, 1.118418, -0.601599, 0, 0, 0, 1, 1,
-1.344098, 0.858893, -2.530044, 1, 1, 1, 1, 1,
-1.329806, 0.6881861, -2.855101, 1, 1, 1, 1, 1,
-1.325368, 0.3418485, -1.234264, 1, 1, 1, 1, 1,
-1.323435, -0.9265065, -2.783185, 1, 1, 1, 1, 1,
-1.319872, -1.948158, -3.05286, 1, 1, 1, 1, 1,
-1.317922, 0.8772539, -1.778075, 1, 1, 1, 1, 1,
-1.313373, 0.7861984, -0.3149287, 1, 1, 1, 1, 1,
-1.311506, -1.406772, -2.768978, 1, 1, 1, 1, 1,
-1.305288, -1.026925, -2.270983, 1, 1, 1, 1, 1,
-1.304713, 0.316197, -2.668591, 1, 1, 1, 1, 1,
-1.294967, 1.153157, -0.7048364, 1, 1, 1, 1, 1,
-1.290207, 0.8735277, -0.9369002, 1, 1, 1, 1, 1,
-1.2878, -0.1136288, -2.73646, 1, 1, 1, 1, 1,
-1.283952, -0.9379803, -1.077752, 1, 1, 1, 1, 1,
-1.274767, -0.5472116, -1.632968, 1, 1, 1, 1, 1,
-1.272412, 1.978261, -0.4991863, 0, 0, 1, 1, 1,
-1.269309, -2.041311, -2.827609, 1, 0, 0, 1, 1,
-1.268167, -0.1386926, -2.096103, 1, 0, 0, 1, 1,
-1.259768, -1.248586, -2.271958, 1, 0, 0, 1, 1,
-1.223252, -0.1804791, -1.449199, 1, 0, 0, 1, 1,
-1.218907, -0.7212704, -1.232496, 1, 0, 0, 1, 1,
-1.198155, -0.3948016, -1.279052, 0, 0, 0, 1, 1,
-1.196331, 0.5410299, -0.8094035, 0, 0, 0, 1, 1,
-1.175329, -0.1003397, -1.879163, 0, 0, 0, 1, 1,
-1.174251, 0.6789592, -0.8446912, 0, 0, 0, 1, 1,
-1.173603, 0.5559195, -3.442085, 0, 0, 0, 1, 1,
-1.172784, -1.528258, -2.044604, 0, 0, 0, 1, 1,
-1.169792, 0.08494437, -1.073748, 0, 0, 0, 1, 1,
-1.159647, 1.069982, -0.3896208, 1, 1, 1, 1, 1,
-1.159006, 1.906165, -0.2060561, 1, 1, 1, 1, 1,
-1.145843, 0.5666525, 0.3366098, 1, 1, 1, 1, 1,
-1.142467, -1.186607, -1.974673, 1, 1, 1, 1, 1,
-1.128678, 2.035358, -0.4758126, 1, 1, 1, 1, 1,
-1.12342, 0.5147479, -1.755334, 1, 1, 1, 1, 1,
-1.114702, -0.1736051, -1.721208, 1, 1, 1, 1, 1,
-1.11047, 0.751532, 1.349812, 1, 1, 1, 1, 1,
-1.107661, -1.139662, -2.495795, 1, 1, 1, 1, 1,
-1.106351, 0.6197054, -0.2050962, 1, 1, 1, 1, 1,
-1.102766, 0.4112912, -1.847812, 1, 1, 1, 1, 1,
-1.09883, -0.1022836, -1.841184, 1, 1, 1, 1, 1,
-1.088233, -1.011733, -3.344635, 1, 1, 1, 1, 1,
-1.08441, 0.9020025, -1.179829, 1, 1, 1, 1, 1,
-1.070987, -0.6138132, -1.663143, 1, 1, 1, 1, 1,
-1.063689, -0.1421077, -1.558772, 0, 0, 1, 1, 1,
-1.057385, -1.967762, -3.193683, 1, 0, 0, 1, 1,
-1.045557, 1.700533, -2.6379, 1, 0, 0, 1, 1,
-1.04539, -0.7707776, -2.718132, 1, 0, 0, 1, 1,
-1.041742, -0.8313853, -0.9900318, 1, 0, 0, 1, 1,
-1.041626, -0.3105885, -0.2673167, 1, 0, 0, 1, 1,
-1.03521, 0.6737989, -2.527156, 0, 0, 0, 1, 1,
-1.032495, 1.391895, -3.209954, 0, 0, 0, 1, 1,
-1.030187, 0.7847711, -1.21724, 0, 0, 0, 1, 1,
-1.029981, -0.2725771, -2.534699, 0, 0, 0, 1, 1,
-1.029756, -0.3575325, -1.30976, 0, 0, 0, 1, 1,
-1.029753, -0.01251192, -0.2800677, 0, 0, 0, 1, 1,
-1.028566, -0.43511, -1.565657, 0, 0, 0, 1, 1,
-1.02493, -1.354307, -1.388833, 1, 1, 1, 1, 1,
-1.023237, 0.3587481, -1.299799, 1, 1, 1, 1, 1,
-1.01812, -0.1184013, -2.527781, 1, 1, 1, 1, 1,
-1.013679, 0.05043274, -1.549734, 1, 1, 1, 1, 1,
-1.008898, -0.1888992, -0.7215815, 1, 1, 1, 1, 1,
-1.005782, 0.08425666, -1.96179, 1, 1, 1, 1, 1,
-1.003121, 0.6349126, -0.618239, 1, 1, 1, 1, 1,
-1.001505, 0.06608421, -0.2012993, 1, 1, 1, 1, 1,
-0.9949259, -0.2963288, -3.537702, 1, 1, 1, 1, 1,
-0.9808719, -0.4472651, -2.5349, 1, 1, 1, 1, 1,
-0.9691846, -0.2648515, -0.7815956, 1, 1, 1, 1, 1,
-0.9687325, 1.252228, -1.219047, 1, 1, 1, 1, 1,
-0.968196, 1.206002, 0.508868, 1, 1, 1, 1, 1,
-0.9630738, 1.439482, -0.1875657, 1, 1, 1, 1, 1,
-0.9615965, 1.681308, -0.6364954, 1, 1, 1, 1, 1,
-0.9612193, -0.05801044, -2.819053, 0, 0, 1, 1, 1,
-0.9519392, 1.094013, -1.183794, 1, 0, 0, 1, 1,
-0.9469396, -0.7421089, -2.644573, 1, 0, 0, 1, 1,
-0.9419179, 0.0634796, -1.721643, 1, 0, 0, 1, 1,
-0.9396518, -0.2229194, -3.017596, 1, 0, 0, 1, 1,
-0.9380513, 1.850814, 0.179028, 1, 0, 0, 1, 1,
-0.9241037, 0.1716831, 0.05105615, 0, 0, 0, 1, 1,
-0.9237771, -1.616643, -1.785841, 0, 0, 0, 1, 1,
-0.9171455, 0.8481116, -0.2631712, 0, 0, 0, 1, 1,
-0.9153351, -1.690417, -3.549831, 0, 0, 0, 1, 1,
-0.9141514, -1.217558, -0.5495614, 0, 0, 0, 1, 1,
-0.910516, 1.035575, -0.5354084, 0, 0, 0, 1, 1,
-0.910504, -0.3757819, -2.32081, 0, 0, 0, 1, 1,
-0.9095727, -0.3256626, -2.746215, 1, 1, 1, 1, 1,
-0.9094197, -0.6722467, -4.122121, 1, 1, 1, 1, 1,
-0.9094061, -0.8918526, -0.9566143, 1, 1, 1, 1, 1,
-0.897265, 0.7687553, 0.8774366, 1, 1, 1, 1, 1,
-0.8956667, -0.00290638, -0.8443294, 1, 1, 1, 1, 1,
-0.8954171, 0.2364016, -1.622048, 1, 1, 1, 1, 1,
-0.8820251, 0.4787497, -1.197096, 1, 1, 1, 1, 1,
-0.8741149, 1.431995, -0.2395159, 1, 1, 1, 1, 1,
-0.8712381, 0.6358088, -2.837588, 1, 1, 1, 1, 1,
-0.8632698, -1.042461, -1.760623, 1, 1, 1, 1, 1,
-0.8618225, 0.3860249, -1.070777, 1, 1, 1, 1, 1,
-0.8595576, 1.669749, -1.462882, 1, 1, 1, 1, 1,
-0.8582781, -2.151923, -3.990251, 1, 1, 1, 1, 1,
-0.8579491, 1.197887, -0.3923405, 1, 1, 1, 1, 1,
-0.8576124, 0.5838767, 0.5468031, 1, 1, 1, 1, 1,
-0.8545416, -0.1307481, -1.001022, 0, 0, 1, 1, 1,
-0.8525949, 1.203184, -0.6617113, 1, 0, 0, 1, 1,
-0.851954, -0.1094586, -2.914848, 1, 0, 0, 1, 1,
-0.8476715, 0.3586406, -0.7184071, 1, 0, 0, 1, 1,
-0.8389817, -0.9046628, -2.715669, 1, 0, 0, 1, 1,
-0.8353636, 1.786575, -0.8672989, 1, 0, 0, 1, 1,
-0.8343291, -0.6708661, -1.599931, 0, 0, 0, 1, 1,
-0.8340986, -1.020099, -2.862701, 0, 0, 0, 1, 1,
-0.829084, 0.2512262, -1.278206, 0, 0, 0, 1, 1,
-0.8290287, -0.2885204, -2.417656, 0, 0, 0, 1, 1,
-0.8289091, 0.6063923, -1.017529, 0, 0, 0, 1, 1,
-0.8249476, 0.3292608, -0.2317495, 0, 0, 0, 1, 1,
-0.8243546, 1.146289, 1.889755, 0, 0, 0, 1, 1,
-0.8210967, -0.3244164, -1.807414, 1, 1, 1, 1, 1,
-0.817944, 0.3960916, -0.4747692, 1, 1, 1, 1, 1,
-0.8152828, 0.7742341, -1.391445, 1, 1, 1, 1, 1,
-0.8120474, -1.234993, -2.749007, 1, 1, 1, 1, 1,
-0.8105469, -0.5835639, -2.010752, 1, 1, 1, 1, 1,
-0.8091992, -1.921129, -1.646246, 1, 1, 1, 1, 1,
-0.8063272, -2.098359, -3.963907, 1, 1, 1, 1, 1,
-0.8062407, -0.7448469, -1.203299, 1, 1, 1, 1, 1,
-0.8054469, 0.1875943, 0.04680888, 1, 1, 1, 1, 1,
-0.8043749, 0.008829709, -2.84485, 1, 1, 1, 1, 1,
-0.7997029, -1.25105, -1.213422, 1, 1, 1, 1, 1,
-0.7929152, -0.9994396, -2.342028, 1, 1, 1, 1, 1,
-0.7879448, -1.028315, -3.619277, 1, 1, 1, 1, 1,
-0.7844094, -0.6275595, -1.163748, 1, 1, 1, 1, 1,
-0.7810491, -0.8140967, -4.159883, 1, 1, 1, 1, 1,
-0.7780406, -0.7166111, -2.353275, 0, 0, 1, 1, 1,
-0.7698593, 0.4805915, -1.384685, 1, 0, 0, 1, 1,
-0.7685603, -0.8983827, -1.242856, 1, 0, 0, 1, 1,
-0.7610436, -0.5760675, -1.819719, 1, 0, 0, 1, 1,
-0.7518337, -0.4177584, -1.084564, 1, 0, 0, 1, 1,
-0.7448533, -0.5202073, -1.342213, 1, 0, 0, 1, 1,
-0.7425913, -0.5317146, -4.014437, 0, 0, 0, 1, 1,
-0.7367588, 2.246161, 0.9062287, 0, 0, 0, 1, 1,
-0.7363958, -0.5307265, -4.385198, 0, 0, 0, 1, 1,
-0.7347022, 1.433163, -0.03366714, 0, 0, 0, 1, 1,
-0.7337472, -0.3139949, -0.7518412, 0, 0, 0, 1, 1,
-0.7336788, 0.4936392, -1.326489, 0, 0, 0, 1, 1,
-0.7321978, -1.533751, -2.046931, 0, 0, 0, 1, 1,
-0.727587, 1.774638, 0.4818462, 1, 1, 1, 1, 1,
-0.727414, 0.3397757, -2.366757, 1, 1, 1, 1, 1,
-0.7125964, -0.6241433, -0.800962, 1, 1, 1, 1, 1,
-0.7090316, 1.725583, -0.1171658, 1, 1, 1, 1, 1,
-0.7069101, -0.8040895, -1.508557, 1, 1, 1, 1, 1,
-0.7020877, 1.261769, -0.1092768, 1, 1, 1, 1, 1,
-0.6997603, -0.9066687, -1.740032, 1, 1, 1, 1, 1,
-0.6952913, 0.5490741, -2.964427, 1, 1, 1, 1, 1,
-0.6904097, 0.2965559, 0.3917509, 1, 1, 1, 1, 1,
-0.686491, -0.1232612, -2.495062, 1, 1, 1, 1, 1,
-0.6838523, 0.6141848, -1.576437, 1, 1, 1, 1, 1,
-0.6802763, 0.5540121, -1.41654, 1, 1, 1, 1, 1,
-0.679889, -0.2169443, -1.597904, 1, 1, 1, 1, 1,
-0.6761945, -1.647856, -1.937164, 1, 1, 1, 1, 1,
-0.6745026, -0.6870158, -1.641549, 1, 1, 1, 1, 1,
-0.6737769, -0.03197023, -1.851984, 0, 0, 1, 1, 1,
-0.6735706, -0.08986489, -1.109188, 1, 0, 0, 1, 1,
-0.6706765, 1.350557, -0.9758598, 1, 0, 0, 1, 1,
-0.669159, -0.4414079, -1.932809, 1, 0, 0, 1, 1,
-0.6690291, 0.4980017, -1.226297, 1, 0, 0, 1, 1,
-0.6689823, -1.379984, -2.510703, 1, 0, 0, 1, 1,
-0.6664536, -0.2470879, -4.073954, 0, 0, 0, 1, 1,
-0.6659644, -0.01158005, 0.3282791, 0, 0, 0, 1, 1,
-0.663367, -1.528729, -1.920621, 0, 0, 0, 1, 1,
-0.6555331, 0.7978011, -2.45199, 0, 0, 0, 1, 1,
-0.650341, -0.8347222, -1.034585, 0, 0, 0, 1, 1,
-0.6447141, 0.09151115, -2.667557, 0, 0, 0, 1, 1,
-0.6366358, -0.411954, -1.206318, 0, 0, 0, 1, 1,
-0.6304212, 0.337565, -2.078767, 1, 1, 1, 1, 1,
-0.6292214, -0.05718833, -1.423701, 1, 1, 1, 1, 1,
-0.6269894, -0.9485057, -3.032081, 1, 1, 1, 1, 1,
-0.6263571, 0.5130056, -2.272227, 1, 1, 1, 1, 1,
-0.6178456, 0.7413466, -0.6226272, 1, 1, 1, 1, 1,
-0.6174551, 1.54348, 0.1032548, 1, 1, 1, 1, 1,
-0.6167635, -2.481652, -2.444769, 1, 1, 1, 1, 1,
-0.6162971, -0.4706639, -2.229038, 1, 1, 1, 1, 1,
-0.6151839, -0.3626035, 0.4785423, 1, 1, 1, 1, 1,
-0.6150163, 0.07882866, -1.713518, 1, 1, 1, 1, 1,
-0.613146, 0.2752061, -2.165311, 1, 1, 1, 1, 1,
-0.6080387, -1.766799, -2.616317, 1, 1, 1, 1, 1,
-0.6032202, -0.3469902, -1.070938, 1, 1, 1, 1, 1,
-0.6008163, 0.239192, -2.553401, 1, 1, 1, 1, 1,
-0.6000972, 1.120625, -0.5401695, 1, 1, 1, 1, 1,
-0.5957856, 0.3906023, -1.135782, 0, 0, 1, 1, 1,
-0.5945457, 0.6386253, -1.050634, 1, 0, 0, 1, 1,
-0.5904719, -0.6729884, -2.363871, 1, 0, 0, 1, 1,
-0.5865931, -1.00596, -1.955837, 1, 0, 0, 1, 1,
-0.5788099, -0.551492, -2.390998, 1, 0, 0, 1, 1,
-0.5764315, 2.406147, -0.9797719, 1, 0, 0, 1, 1,
-0.5687899, 0.4336955, -2.224997, 0, 0, 0, 1, 1,
-0.5658346, 1.089462, 1.674058, 0, 0, 0, 1, 1,
-0.5637107, 0.1789251, -1.009746, 0, 0, 0, 1, 1,
-0.5593857, 0.4891084, -0.3739226, 0, 0, 0, 1, 1,
-0.5525387, 0.2140077, -1.04125, 0, 0, 0, 1, 1,
-0.5505569, -1.683498, -3.38393, 0, 0, 0, 1, 1,
-0.5475987, 1.026154, -0.4639096, 0, 0, 0, 1, 1,
-0.543537, -0.132934, -1.213824, 1, 1, 1, 1, 1,
-0.5427997, 0.5373487, 0.6958067, 1, 1, 1, 1, 1,
-0.5371777, 0.04168184, -1.288992, 1, 1, 1, 1, 1,
-0.5354946, -0.4691695, -3.397226, 1, 1, 1, 1, 1,
-0.5353432, -0.4819121, -2.794946, 1, 1, 1, 1, 1,
-0.5347356, 1.089266, -0.9822811, 1, 1, 1, 1, 1,
-0.5288234, -0.9262913, -1.461427, 1, 1, 1, 1, 1,
-0.5274605, -0.3425623, -1.441601, 1, 1, 1, 1, 1,
-0.5246166, -0.4438276, -1.541647, 1, 1, 1, 1, 1,
-0.5202771, 1.068545, -0.1816041, 1, 1, 1, 1, 1,
-0.5135812, 0.1231713, -0.4854869, 1, 1, 1, 1, 1,
-0.5133561, -0.1110803, -1.933358, 1, 1, 1, 1, 1,
-0.5103675, 0.1406998, -0.9238087, 1, 1, 1, 1, 1,
-0.5101238, 0.9674824, 0.9173292, 1, 1, 1, 1, 1,
-0.5096702, -1.152152, -2.497093, 1, 1, 1, 1, 1,
-0.5088207, -1.038731, -2.429497, 0, 0, 1, 1, 1,
-0.5030532, -0.4795078, -2.760523, 1, 0, 0, 1, 1,
-0.5016158, 2.285172, 1.817826, 1, 0, 0, 1, 1,
-0.4980913, -0.5665114, -0.9551789, 1, 0, 0, 1, 1,
-0.4936802, -0.1202792, -1.154573, 1, 0, 0, 1, 1,
-0.4914387, 0.8539346, -2.011661, 1, 0, 0, 1, 1,
-0.4838174, 0.3485437, -0.4373693, 0, 0, 0, 1, 1,
-0.4820482, -0.6783915, -3.45704, 0, 0, 0, 1, 1,
-0.481717, -0.476048, -1.449706, 0, 0, 0, 1, 1,
-0.4799667, -0.6809042, -1.063105, 0, 0, 0, 1, 1,
-0.4795174, -0.6700745, -1.745115, 0, 0, 0, 1, 1,
-0.4743545, 1.361889, 0.7611423, 0, 0, 0, 1, 1,
-0.4724962, -2.133889, -3.153815, 0, 0, 0, 1, 1,
-0.4711813, 1.138311, -0.6533437, 1, 1, 1, 1, 1,
-0.4710919, 0.2999209, -0.5588058, 1, 1, 1, 1, 1,
-0.4665952, -1.099377, -3.086262, 1, 1, 1, 1, 1,
-0.4659998, 0.1889638, -0.9663558, 1, 1, 1, 1, 1,
-0.4636441, 1.06345, -1.217909, 1, 1, 1, 1, 1,
-0.461072, 0.3705923, 0.1363716, 1, 1, 1, 1, 1,
-0.459918, 0.2022623, -1.504164, 1, 1, 1, 1, 1,
-0.4545577, -1.256099, -2.846562, 1, 1, 1, 1, 1,
-0.4495854, -0.2093203, -1.816488, 1, 1, 1, 1, 1,
-0.4404771, -0.1867348, -1.162361, 1, 1, 1, 1, 1,
-0.4385412, -0.7782335, -2.270747, 1, 1, 1, 1, 1,
-0.4343672, -2.038822, -2.933475, 1, 1, 1, 1, 1,
-0.4322124, 0.5194253, -1.037476, 1, 1, 1, 1, 1,
-0.4265928, 1.881828, -1.279427, 1, 1, 1, 1, 1,
-0.4246272, -0.02152074, -2.052963, 1, 1, 1, 1, 1,
-0.4172804, 0.7855158, 0.05678696, 0, 0, 1, 1, 1,
-0.4156857, 0.0072782, -2.139771, 1, 0, 0, 1, 1,
-0.4139137, 0.3232755, -2.136578, 1, 0, 0, 1, 1,
-0.4124277, 1.074672, -0.4728339, 1, 0, 0, 1, 1,
-0.4123134, 0.3129241, -0.82113, 1, 0, 0, 1, 1,
-0.4011381, 0.5663776, 0.6148547, 1, 0, 0, 1, 1,
-0.399116, -0.7103767, -2.547928, 0, 0, 0, 1, 1,
-0.3987356, 1.618598, -0.6552258, 0, 0, 0, 1, 1,
-0.396602, 0.4341078, 0.006805024, 0, 0, 0, 1, 1,
-0.3853532, 0.1309426, -1.803272, 0, 0, 0, 1, 1,
-0.3843716, 0.1063561, -2.168901, 0, 0, 0, 1, 1,
-0.3831299, 0.6188177, -0.5441049, 0, 0, 0, 1, 1,
-0.3770528, 0.1504558, -2.568983, 0, 0, 0, 1, 1,
-0.3756735, 1.470844, -1.779636, 1, 1, 1, 1, 1,
-0.3658233, -1.078415, -3.915142, 1, 1, 1, 1, 1,
-0.3653373, -0.01944401, -1.06385, 1, 1, 1, 1, 1,
-0.3653122, 1.35161, -1.220683, 1, 1, 1, 1, 1,
-0.3603814, -1.003004, -1.957545, 1, 1, 1, 1, 1,
-0.359719, 0.1395081, -0.360465, 1, 1, 1, 1, 1,
-0.3560331, 0.1028088, -1.237272, 1, 1, 1, 1, 1,
-0.3549095, -0.7703589, -3.79329, 1, 1, 1, 1, 1,
-0.3491159, 1.199082, -0.8266034, 1, 1, 1, 1, 1,
-0.3370403, -2.030085, -4.853434, 1, 1, 1, 1, 1,
-0.3353123, 0.338816, -2.296082, 1, 1, 1, 1, 1,
-0.3338447, 0.5400142, 0.405535, 1, 1, 1, 1, 1,
-0.3336155, 0.19147, -0.3740239, 1, 1, 1, 1, 1,
-0.332276, 0.3325662, -0.1254341, 1, 1, 1, 1, 1,
-0.3322602, 1.907653, 0.4647912, 1, 1, 1, 1, 1,
-0.3316229, -0.865988, -3.593843, 0, 0, 1, 1, 1,
-0.3309119, 1.036574, -2.627307, 1, 0, 0, 1, 1,
-0.3295014, 0.6985834, -0.5737795, 1, 0, 0, 1, 1,
-0.3288, 0.5934743, 1.232503, 1, 0, 0, 1, 1,
-0.3283603, 0.2377215, -1.295262, 1, 0, 0, 1, 1,
-0.3239581, -0.1456565, -3.295918, 1, 0, 0, 1, 1,
-0.3225095, 1.536857, 0.6874977, 0, 0, 0, 1, 1,
-0.3218222, -1.187019, -1.984086, 0, 0, 0, 1, 1,
-0.3209047, -0.2565577, -4.626062, 0, 0, 0, 1, 1,
-0.3086286, 0.008827218, -3.070393, 0, 0, 0, 1, 1,
-0.3052656, -0.9099755, -2.270792, 0, 0, 0, 1, 1,
-0.3004295, 1.218188, -0.06483356, 0, 0, 0, 1, 1,
-0.2961023, 1.507777, 0.7752687, 0, 0, 0, 1, 1,
-0.2941213, 1.336132, 1.040465, 1, 1, 1, 1, 1,
-0.2931972, -0.9319577, -2.008105, 1, 1, 1, 1, 1,
-0.2874666, -2.069317, -3.732761, 1, 1, 1, 1, 1,
-0.2861141, 0.3979828, -1.743151, 1, 1, 1, 1, 1,
-0.2851314, 1.138796, -1.182179, 1, 1, 1, 1, 1,
-0.2827628, 0.3391483, -0.03494518, 1, 1, 1, 1, 1,
-0.2818383, -0.2577925, -1.332618, 1, 1, 1, 1, 1,
-0.2804376, -0.1169749, -1.070834, 1, 1, 1, 1, 1,
-0.2802784, -0.5698369, -4.064219, 1, 1, 1, 1, 1,
-0.2793434, -0.2204597, -3.172085, 1, 1, 1, 1, 1,
-0.2781873, -0.3666389, -1.700874, 1, 1, 1, 1, 1,
-0.2766322, -0.5805755, -2.57871, 1, 1, 1, 1, 1,
-0.2693845, -1.790637, -3.642272, 1, 1, 1, 1, 1,
-0.2685155, -0.5355101, -3.126534, 1, 1, 1, 1, 1,
-0.2643451, -2.39859, -4.538269, 1, 1, 1, 1, 1,
-0.2584001, -0.02161288, -1.994215, 0, 0, 1, 1, 1,
-0.2578396, 0.8313506, -2.199997, 1, 0, 0, 1, 1,
-0.2559019, -1.287071, -2.835135, 1, 0, 0, 1, 1,
-0.2514225, 0.01483092, -1.337128, 1, 0, 0, 1, 1,
-0.2493652, -0.9845101, -4.122263, 1, 0, 0, 1, 1,
-0.242398, -1.920844, -1.700588, 1, 0, 0, 1, 1,
-0.2386209, -1.595575, -2.543327, 0, 0, 0, 1, 1,
-0.2378507, 1.313526, -0.7912806, 0, 0, 0, 1, 1,
-0.2378489, 1.08062, -0.09373231, 0, 0, 0, 1, 1,
-0.2321145, 0.8351162, 0.3365535, 0, 0, 0, 1, 1,
-0.2317538, -0.6071509, -1.982297, 0, 0, 0, 1, 1,
-0.2290051, 1.65183, -0.2324218, 0, 0, 0, 1, 1,
-0.2267157, -0.8023723, -3.364119, 0, 0, 0, 1, 1,
-0.225793, -0.4539373, -2.900891, 1, 1, 1, 1, 1,
-0.2241177, -0.578494, -1.216285, 1, 1, 1, 1, 1,
-0.2240224, -1.275058, -5.77942, 1, 1, 1, 1, 1,
-0.2235178, 0.5359241, 0.4958736, 1, 1, 1, 1, 1,
-0.2232645, -0.3586317, -2.204495, 1, 1, 1, 1, 1,
-0.2217159, 1.028557, 0.4796569, 1, 1, 1, 1, 1,
-0.2180501, -1.663433, -2.518101, 1, 1, 1, 1, 1,
-0.2179319, 0.3925213, 0.9485062, 1, 1, 1, 1, 1,
-0.2175437, -0.920592, -2.07693, 1, 1, 1, 1, 1,
-0.2159387, 0.6524075, 0.03816732, 1, 1, 1, 1, 1,
-0.2148347, 0.7777032, -1.377061, 1, 1, 1, 1, 1,
-0.2143081, 1.505503, 0.03485998, 1, 1, 1, 1, 1,
-0.1965505, -0.02328907, -1.636151, 1, 1, 1, 1, 1,
-0.1948876, 0.9784452, -1.486015, 1, 1, 1, 1, 1,
-0.1876825, 1.839806, 0.2298296, 1, 1, 1, 1, 1,
-0.1856417, 0.08508302, -1.220696, 0, 0, 1, 1, 1,
-0.1802944, -0.6347252, -4.038775, 1, 0, 0, 1, 1,
-0.1792562, -0.06018754, -2.544048, 1, 0, 0, 1, 1,
-0.1773318, 1.276052, -1.837754, 1, 0, 0, 1, 1,
-0.1770108, -0.6479205, -1.813565, 1, 0, 0, 1, 1,
-0.1729879, -0.1459464, -2.984716, 1, 0, 0, 1, 1,
-0.1710876, -0.06411893, -2.909724, 0, 0, 0, 1, 1,
-0.1678178, -0.2900403, -1.940725, 0, 0, 0, 1, 1,
-0.1667842, -0.6983291, -4.576049, 0, 0, 0, 1, 1,
-0.1643682, -0.6143973, -3.134427, 0, 0, 0, 1, 1,
-0.1618961, -1.645029, -1.571721, 0, 0, 0, 1, 1,
-0.1617603, -0.03607268, -1.555294, 0, 0, 0, 1, 1,
-0.1545895, 0.1848555, -1.689458, 0, 0, 0, 1, 1,
-0.1536572, -1.544579, -2.990886, 1, 1, 1, 1, 1,
-0.1517699, 1.15396, 0.8549257, 1, 1, 1, 1, 1,
-0.1505829, -0.1877123, -3.608757, 1, 1, 1, 1, 1,
-0.1504389, -0.04221364, -1.088122, 1, 1, 1, 1, 1,
-0.1493373, -0.1906276, -2.820473, 1, 1, 1, 1, 1,
-0.1462822, -1.477963, -4.620948, 1, 1, 1, 1, 1,
-0.1458495, 0.5223843, -0.3085246, 1, 1, 1, 1, 1,
-0.1458375, -0.4191532, -1.866236, 1, 1, 1, 1, 1,
-0.1395305, -0.1150063, -2.551735, 1, 1, 1, 1, 1,
-0.1364079, 1.253918, -0.4943655, 1, 1, 1, 1, 1,
-0.132262, 1.212602, -2.482763, 1, 1, 1, 1, 1,
-0.1319408, -1.643539, -3.62276, 1, 1, 1, 1, 1,
-0.130862, -0.5944626, -2.906672, 1, 1, 1, 1, 1,
-0.1253585, -0.4545205, -2.960855, 1, 1, 1, 1, 1,
-0.1198248, 0.3849818, -0.1793146, 1, 1, 1, 1, 1,
-0.119412, 1.078926, -0.658241, 0, 0, 1, 1, 1,
-0.1192626, 0.5948217, 0.2799192, 1, 0, 0, 1, 1,
-0.1182353, 1.416657, -1.10474, 1, 0, 0, 1, 1,
-0.1136621, -0.4570381, -2.598377, 1, 0, 0, 1, 1,
-0.1125276, 1.913038, -1.405209, 1, 0, 0, 1, 1,
-0.1125058, 0.05607048, -0.6639329, 1, 0, 0, 1, 1,
-0.1091722, 0.4959986, 0.6853791, 0, 0, 0, 1, 1,
-0.1014398, 0.5629448, -0.9317303, 0, 0, 0, 1, 1,
-0.09796073, -0.9262701, -3.28238, 0, 0, 0, 1, 1,
-0.0954581, -0.2520967, -1.408522, 0, 0, 0, 1, 1,
-0.09504129, 0.3444026, -1.271202, 0, 0, 0, 1, 1,
-0.09355759, -0.6398105, -5.307067, 0, 0, 0, 1, 1,
-0.09172971, 0.6952057, -1.481039, 0, 0, 0, 1, 1,
-0.08440012, -0.007036036, -1.885623, 1, 1, 1, 1, 1,
-0.07952566, -0.2365631, -2.984193, 1, 1, 1, 1, 1,
-0.07902007, 0.535675, -0.4671568, 1, 1, 1, 1, 1,
-0.07901745, 0.3919243, 0.8628721, 1, 1, 1, 1, 1,
-0.07892259, -0.1012283, -4.009552, 1, 1, 1, 1, 1,
-0.07875431, -0.2355381, -2.309439, 1, 1, 1, 1, 1,
-0.07784477, -0.166645, -2.444946, 1, 1, 1, 1, 1,
-0.07405467, 0.009460326, -0.3232746, 1, 1, 1, 1, 1,
-0.07378562, 1.097631, 0.2287985, 1, 1, 1, 1, 1,
-0.07193879, -0.9143906, -3.487874, 1, 1, 1, 1, 1,
-0.07048744, -1.231575, -3.042137, 1, 1, 1, 1, 1,
-0.0668887, 1.524818, 0.3710001, 1, 1, 1, 1, 1,
-0.06683832, -0.02312164, -3.1935, 1, 1, 1, 1, 1,
-0.06682004, -0.4460477, -2.9229, 1, 1, 1, 1, 1,
-0.06305123, -0.2184104, -4.185714, 1, 1, 1, 1, 1,
-0.05710327, 0.8100129, -1.259405, 0, 0, 1, 1, 1,
-0.05447691, -0.2398324, -2.495201, 1, 0, 0, 1, 1,
-0.05311015, -0.2715138, -2.673119, 1, 0, 0, 1, 1,
-0.0483883, 0.9193085, 1.071825, 1, 0, 0, 1, 1,
-0.04629927, -0.5142173, -1.803877, 1, 0, 0, 1, 1,
-0.04392882, -0.01008182, -0.4009785, 1, 0, 0, 1, 1,
-0.04143806, 1.132964, 1.429893, 0, 0, 0, 1, 1,
-0.03975256, 0.6973118, 0.1796846, 0, 0, 0, 1, 1,
-0.03737094, 0.07136339, -0.7875395, 0, 0, 0, 1, 1,
-0.03504081, -1.306272, -3.853296, 0, 0, 0, 1, 1,
-0.0324895, 0.8495897, -0.910431, 0, 0, 0, 1, 1,
-0.0318747, -0.8456176, -3.217868, 0, 0, 0, 1, 1,
-0.03012885, -0.9647174, -3.990944, 0, 0, 0, 1, 1,
-0.0285515, 2.210999, 1.042119, 1, 1, 1, 1, 1,
-0.02807355, -2.445867, -3.287955, 1, 1, 1, 1, 1,
-0.02800657, -1.030488, -2.84606, 1, 1, 1, 1, 1,
-0.02682937, 0.1405019, -2.125496, 1, 1, 1, 1, 1,
-0.01921273, -1.31037, -3.258606, 1, 1, 1, 1, 1,
-0.01856541, 2.3568, -1.387156, 1, 1, 1, 1, 1,
-0.01852717, 0.016963, -3.187807, 1, 1, 1, 1, 1,
-0.01831304, 0.9874277, -2.565963, 1, 1, 1, 1, 1,
-0.01605763, 1.7865, 1.109276, 1, 1, 1, 1, 1,
-0.0156366, -1.006179, -2.761867, 1, 1, 1, 1, 1,
-0.01372589, -0.8866431, -2.858123, 1, 1, 1, 1, 1,
-0.01336495, 0.9136355, -0.3580694, 1, 1, 1, 1, 1,
-0.01204824, -0.6048689, -5.088419, 1, 1, 1, 1, 1,
-0.0120175, -0.3730851, -2.579943, 1, 1, 1, 1, 1,
-0.01180535, 0.4960524, 0.278259, 1, 1, 1, 1, 1,
-0.01028301, 1.202444, 0.4494513, 0, 0, 1, 1, 1,
-0.01003082, -1.804549, -4.151143, 1, 0, 0, 1, 1,
-0.005562281, 2.366218, -0.7567675, 1, 0, 0, 1, 1,
0.002315202, -0.1300285, 2.596524, 1, 0, 0, 1, 1,
0.002656929, -0.3436065, 4.049243, 1, 0, 0, 1, 1,
0.004617654, -1.734613, 4.137447, 1, 0, 0, 1, 1,
0.006871382, 0.4383, 1.018744, 0, 0, 0, 1, 1,
0.0108389, -0.8542386, 1.487713, 0, 0, 0, 1, 1,
0.01285344, 1.236634, 1.077392, 0, 0, 0, 1, 1,
0.01432968, -0.759966, 3.924246, 0, 0, 0, 1, 1,
0.01611047, 1.712015, -2.323303, 0, 0, 0, 1, 1,
0.01758423, 0.4092786, 1.575262, 0, 0, 0, 1, 1,
0.02263344, 0.3875847, 0.5975119, 0, 0, 0, 1, 1,
0.02930641, 1.294955, -0.2089846, 1, 1, 1, 1, 1,
0.02987244, 1.030707, -0.7674376, 1, 1, 1, 1, 1,
0.030719, -0.8146632, 4.652688, 1, 1, 1, 1, 1,
0.03073553, 1.559652, 2.778416, 1, 1, 1, 1, 1,
0.03312742, -1.025602, 2.425535, 1, 1, 1, 1, 1,
0.03313267, -0.5601285, 4.135958, 1, 1, 1, 1, 1,
0.03373657, 0.2421719, 0.06395531, 1, 1, 1, 1, 1,
0.03476642, -0.7265328, 3.890789, 1, 1, 1, 1, 1,
0.05082645, -0.2060276, 2.141501, 1, 1, 1, 1, 1,
0.05555167, 1.086758, 0.3575921, 1, 1, 1, 1, 1,
0.06023379, 0.2648643, 1.7419, 1, 1, 1, 1, 1,
0.06055973, -0.3122703, 2.650914, 1, 1, 1, 1, 1,
0.066348, 1.859545, 1.71768, 1, 1, 1, 1, 1,
0.06702286, -0.554446, 3.760617, 1, 1, 1, 1, 1,
0.06730438, -0.06677443, 2.442871, 1, 1, 1, 1, 1,
0.07157923, -0.2334395, 3.84919, 0, 0, 1, 1, 1,
0.07194541, 1.30507, 1.158601, 1, 0, 0, 1, 1,
0.07287438, 1.994145, 1.540302, 1, 0, 0, 1, 1,
0.07419115, 1.080258, 0.1966256, 1, 0, 0, 1, 1,
0.07643512, 0.2860768, -0.3998265, 1, 0, 0, 1, 1,
0.07742109, 1.916208, 0.06782148, 1, 0, 0, 1, 1,
0.0822559, 0.4650989, 0.7532731, 0, 0, 0, 1, 1,
0.08525339, -0.9697714, 2.880896, 0, 0, 0, 1, 1,
0.0861492, 0.4644009, 0.05653581, 0, 0, 0, 1, 1,
0.09046598, 0.5769448, -0.1333054, 0, 0, 0, 1, 1,
0.09122916, 0.6312498, 1.392121, 0, 0, 0, 1, 1,
0.09475707, 0.4352749, -0.3785538, 0, 0, 0, 1, 1,
0.09831841, 0.7963311, -0.5848748, 0, 0, 0, 1, 1,
0.1027192, -1.471324, 3.879102, 1, 1, 1, 1, 1,
0.103777, 0.4896056, 0.8576109, 1, 1, 1, 1, 1,
0.1064637, 0.2546285, 0.3601165, 1, 1, 1, 1, 1,
0.1066403, -0.684446, 3.576313, 1, 1, 1, 1, 1,
0.1096424, 0.3547765, 0.3822863, 1, 1, 1, 1, 1,
0.1108969, 0.2321426, 1.663863, 1, 1, 1, 1, 1,
0.1133369, -0.1123648, 2.895134, 1, 1, 1, 1, 1,
0.1142014, 0.6640198, 1.351336, 1, 1, 1, 1, 1,
0.1169667, -1.439122, 2.02799, 1, 1, 1, 1, 1,
0.1178205, -0.7259851, 2.372436, 1, 1, 1, 1, 1,
0.117921, 0.5054425, 0.9334988, 1, 1, 1, 1, 1,
0.1202833, 0.7273731, -1.370772, 1, 1, 1, 1, 1,
0.1221438, -0.322493, 2.164727, 1, 1, 1, 1, 1,
0.1230691, -0.2214544, 2.818815, 1, 1, 1, 1, 1,
0.1233138, -2.148262, 4.174384, 1, 1, 1, 1, 1,
0.1254168, -0.1951465, 3.270214, 0, 0, 1, 1, 1,
0.1272984, -1.17967, 0.910893, 1, 0, 0, 1, 1,
0.1279151, 0.5264127, 0.2250913, 1, 0, 0, 1, 1,
0.1382849, 0.4741176, 0.7301093, 1, 0, 0, 1, 1,
0.1405327, -0.05384894, 0.7357351, 1, 0, 0, 1, 1,
0.1434428, -1.205688, 3.159164, 1, 0, 0, 1, 1,
0.1438743, -0.9420054, 4.07306, 0, 0, 0, 1, 1,
0.1462578, 0.5320615, 0.9684998, 0, 0, 0, 1, 1,
0.1481041, 0.4670098, 2.525343, 0, 0, 0, 1, 1,
0.1499861, -0.4585172, 3.519536, 0, 0, 0, 1, 1,
0.1526558, 1.821576, 1.468028, 0, 0, 0, 1, 1,
0.1545093, -0.6715323, 1.860304, 0, 0, 0, 1, 1,
0.1545543, 0.5086049, 0.7396453, 0, 0, 0, 1, 1,
0.1573402, 0.1770072, 0.9276597, 1, 1, 1, 1, 1,
0.1604675, 0.0737405, 1.099644, 1, 1, 1, 1, 1,
0.160487, -2.160601, 3.034, 1, 1, 1, 1, 1,
0.1625349, -0.5550371, 3.14699, 1, 1, 1, 1, 1,
0.1633134, -0.2725734, 2.42754, 1, 1, 1, 1, 1,
0.1658072, -0.01952215, 1.647765, 1, 1, 1, 1, 1,
0.17249, -0.2887201, 2.935706, 1, 1, 1, 1, 1,
0.1727223, 0.8568335, 0.1028379, 1, 1, 1, 1, 1,
0.174125, 1.700165, -1.755194, 1, 1, 1, 1, 1,
0.1754207, -0.1990747, 2.936245, 1, 1, 1, 1, 1,
0.1775811, -0.2030269, 3.559682, 1, 1, 1, 1, 1,
0.179061, -0.6956208, 2.696179, 1, 1, 1, 1, 1,
0.1824983, 1.306424, 1.494117, 1, 1, 1, 1, 1,
0.1852049, -0.66433, 1.59443, 1, 1, 1, 1, 1,
0.1855775, -0.8503628, 3.59125, 1, 1, 1, 1, 1,
0.1867386, -1.76089, 3.830855, 0, 0, 1, 1, 1,
0.1906917, 0.2401117, 0.9965071, 1, 0, 0, 1, 1,
0.1909391, 1.252294, 1.656612, 1, 0, 0, 1, 1,
0.1929552, 1.225213, -1.79247, 1, 0, 0, 1, 1,
0.1938034, 0.07120862, 1.343417, 1, 0, 0, 1, 1,
0.1948178, 0.09008253, 1.594728, 1, 0, 0, 1, 1,
0.1983322, 1.324246, -1.316015, 0, 0, 0, 1, 1,
0.1985077, 0.6150727, 0.2935575, 0, 0, 0, 1, 1,
0.1993025, -0.3243597, 1.314216, 0, 0, 0, 1, 1,
0.2152815, 0.03568286, -0.1475676, 0, 0, 0, 1, 1,
0.2157961, 0.2800081, 1.196956, 0, 0, 0, 1, 1,
0.2162806, -2.163479, 2.806867, 0, 0, 0, 1, 1,
0.2250414, 2.630079, 0.1116787, 0, 0, 0, 1, 1,
0.2262319, 0.7625243, 0.6029534, 1, 1, 1, 1, 1,
0.2278783, -0.6905375, 4.487404, 1, 1, 1, 1, 1,
0.2294137, -1.378058, 3.119278, 1, 1, 1, 1, 1,
0.232017, 1.214613, -0.4191136, 1, 1, 1, 1, 1,
0.2362775, -0.3169414, 3.680598, 1, 1, 1, 1, 1,
0.2377387, 0.4794125, 0.4921218, 1, 1, 1, 1, 1,
0.2393572, 0.4705289, 1.732428, 1, 1, 1, 1, 1,
0.2398968, 0.2644759, 0.08441328, 1, 1, 1, 1, 1,
0.2425015, -1.840963, 3.939174, 1, 1, 1, 1, 1,
0.2438546, 1.234169, 0.5105664, 1, 1, 1, 1, 1,
0.2457822, 0.3826961, 0.2338865, 1, 1, 1, 1, 1,
0.2541249, 0.2377246, 0.145937, 1, 1, 1, 1, 1,
0.2600998, -0.9819599, 3.108611, 1, 1, 1, 1, 1,
0.2621601, 0.7992548, -1.089631, 1, 1, 1, 1, 1,
0.2645398, -0.3914137, 2.693546, 1, 1, 1, 1, 1,
0.267627, -0.1237718, 4.21629, 0, 0, 1, 1, 1,
0.2691068, 0.1825867, 2.08566, 1, 0, 0, 1, 1,
0.2729872, -0.7974412, 3.199544, 1, 0, 0, 1, 1,
0.2770483, -0.5054603, 2.176784, 1, 0, 0, 1, 1,
0.2796728, -0.8609513, 2.139036, 1, 0, 0, 1, 1,
0.2809702, 0.8075882, 0.9697409, 1, 0, 0, 1, 1,
0.2845838, -0.2770986, 2.952972, 0, 0, 0, 1, 1,
0.2855786, 0.3477208, 0.2262512, 0, 0, 0, 1, 1,
0.288445, 0.7721891, 0.6238493, 0, 0, 0, 1, 1,
0.289961, 0.2012833, 0.679086, 0, 0, 0, 1, 1,
0.2911932, -1.842458, 2.073694, 0, 0, 0, 1, 1,
0.2932795, 3.590504, -0.768645, 0, 0, 0, 1, 1,
0.2952789, 1.107163, -0.1770764, 0, 0, 0, 1, 1,
0.2981761, 0.4397492, 0.2138534, 1, 1, 1, 1, 1,
0.3024137, 0.8085074, -1.353753, 1, 1, 1, 1, 1,
0.3081737, 1.652955, 0.03606452, 1, 1, 1, 1, 1,
0.3116792, 0.1697115, 0.3994218, 1, 1, 1, 1, 1,
0.3125402, 1.127594, -0.08106547, 1, 1, 1, 1, 1,
0.31292, 0.412366, 0.2578117, 1, 1, 1, 1, 1,
0.3146648, -0.1898164, 2.091392, 1, 1, 1, 1, 1,
0.3167488, -1.283917, 3.279785, 1, 1, 1, 1, 1,
0.3198616, -0.142668, 1.007384, 1, 1, 1, 1, 1,
0.3218105, 1.394602, 0.6067346, 1, 1, 1, 1, 1,
0.327038, -1.978222, 2.581827, 1, 1, 1, 1, 1,
0.3302808, 0.8349499, 0.8678421, 1, 1, 1, 1, 1,
0.3304154, -0.5009046, 0.3441059, 1, 1, 1, 1, 1,
0.333675, -0.7605937, 3.420837, 1, 1, 1, 1, 1,
0.3342358, -0.4057418, 2.013153, 1, 1, 1, 1, 1,
0.3419975, 1.482877, -0.214445, 0, 0, 1, 1, 1,
0.3434806, -1.255752, 3.059988, 1, 0, 0, 1, 1,
0.3503269, 5.749315e-05, 1.954825, 1, 0, 0, 1, 1,
0.3506928, -0.3702492, 3.479846, 1, 0, 0, 1, 1,
0.3509878, -2.28388, 1.678145, 1, 0, 0, 1, 1,
0.3541127, -0.2468496, 4.052307, 1, 0, 0, 1, 1,
0.3552903, -1.702378, 1.562536, 0, 0, 0, 1, 1,
0.3583601, 0.08787361, 2.383313, 0, 0, 0, 1, 1,
0.3596616, 0.8925208, -1.544715, 0, 0, 0, 1, 1,
0.361929, 0.7123098, 0.4861963, 0, 0, 0, 1, 1,
0.3626902, -2.152757, 1.952235, 0, 0, 0, 1, 1,
0.3641737, -0.7652243, 4.041607, 0, 0, 0, 1, 1,
0.3646749, 1.234444, 0.07120802, 0, 0, 0, 1, 1,
0.37276, 0.9757937, -0.03691128, 1, 1, 1, 1, 1,
0.3728391, 1.335327, -0.738885, 1, 1, 1, 1, 1,
0.3757882, -1.039712, 3.838733, 1, 1, 1, 1, 1,
0.3772219, -1.583595, 2.582546, 1, 1, 1, 1, 1,
0.3792287, -0.344763, 2.695525, 1, 1, 1, 1, 1,
0.3816461, 0.02344091, 1.923391, 1, 1, 1, 1, 1,
0.3865313, -1.233362, 2.743946, 1, 1, 1, 1, 1,
0.3917711, 0.5575739, 0.2568725, 1, 1, 1, 1, 1,
0.3925434, 1.175837, -0.2945262, 1, 1, 1, 1, 1,
0.3930809, -0.3507919, 1.52959, 1, 1, 1, 1, 1,
0.3941953, -0.1864985, 4.738916, 1, 1, 1, 1, 1,
0.3981397, 0.6486556, 1.37454, 1, 1, 1, 1, 1,
0.4017305, 2.196659, 3.029388, 1, 1, 1, 1, 1,
0.4021367, -0.4572486, 1.472634, 1, 1, 1, 1, 1,
0.4034073, 1.527751, 1.494314, 1, 1, 1, 1, 1,
0.4035114, 1.987183, -2.236962, 0, 0, 1, 1, 1,
0.4045333, 0.1565846, 1.786855, 1, 0, 0, 1, 1,
0.4125555, 1.357951, 0.3164068, 1, 0, 0, 1, 1,
0.4158312, -0.669598, 2.43758, 1, 0, 0, 1, 1,
0.4228317, -0.4933053, 1.738933, 1, 0, 0, 1, 1,
0.4241551, -0.1314054, 0.9858448, 1, 0, 0, 1, 1,
0.4246478, 0.9581138, 0.54286, 0, 0, 0, 1, 1,
0.4249555, 1.463002, -0.4358326, 0, 0, 0, 1, 1,
0.4257045, 0.02119362, 1.516012, 0, 0, 0, 1, 1,
0.4361854, 2.19953, -1.293544, 0, 0, 0, 1, 1,
0.4375638, -0.3592531, 2.956183, 0, 0, 0, 1, 1,
0.438865, -0.4893283, 0.7361593, 0, 0, 0, 1, 1,
0.4399059, 0.1829415, -0.1657669, 0, 0, 0, 1, 1,
0.4400218, -0.7241991, 2.388332, 1, 1, 1, 1, 1,
0.4403352, -0.8836056, 3.139286, 1, 1, 1, 1, 1,
0.4476266, -0.00861411, 0.2507169, 1, 1, 1, 1, 1,
0.4483292, 0.3986673, 0.4678192, 1, 1, 1, 1, 1,
0.4567629, 0.497916, 2.55607, 1, 1, 1, 1, 1,
0.4590593, 0.559417, 0.5649406, 1, 1, 1, 1, 1,
0.4630346, -0.5197231, 2.723177, 1, 1, 1, 1, 1,
0.466217, -0.748838, 3.866631, 1, 1, 1, 1, 1,
0.4668279, -0.8452681, 3.185105, 1, 1, 1, 1, 1,
0.4683163, -0.3659122, 2.219214, 1, 1, 1, 1, 1,
0.4702604, -1.393896, 3.364363, 1, 1, 1, 1, 1,
0.4712772, 1.500079, -0.9920976, 1, 1, 1, 1, 1,
0.4733562, 0.9682275, 0.2104421, 1, 1, 1, 1, 1,
0.4739954, 2.855565, 0.7041119, 1, 1, 1, 1, 1,
0.4756721, -0.3199231, 3.207356, 1, 1, 1, 1, 1,
0.4759817, 0.2619459, 0.5801287, 0, 0, 1, 1, 1,
0.4774339, -0.5737708, 2.695934, 1, 0, 0, 1, 1,
0.4808469, -0.7243031, 1.909793, 1, 0, 0, 1, 1,
0.481946, -0.6338489, 2.149302, 1, 0, 0, 1, 1,
0.4894782, 1.178702, -0.3232709, 1, 0, 0, 1, 1,
0.4911071, 0.2138942, 1.418526, 1, 0, 0, 1, 1,
0.4936632, -0.5046642, 2.917835, 0, 0, 0, 1, 1,
0.494738, -0.7066839, 2.111467, 0, 0, 0, 1, 1,
0.4950982, 0.7702544, -0.05822391, 0, 0, 0, 1, 1,
0.5021697, 0.063998, 1.892973, 0, 0, 0, 1, 1,
0.5024581, -1.677308, 2.840302, 0, 0, 0, 1, 1,
0.5031716, 1.413843, -1.370899, 0, 0, 0, 1, 1,
0.5037202, 0.5366349, -1.141574, 0, 0, 0, 1, 1,
0.5088772, -0.2434366, 1.370175, 1, 1, 1, 1, 1,
0.5196494, -1.065094, 1.473542, 1, 1, 1, 1, 1,
0.5217359, -0.704126, 2.164101, 1, 1, 1, 1, 1,
0.52736, 0.8344011, 3.063862, 1, 1, 1, 1, 1,
0.5306979, 0.6681678, -0.800429, 1, 1, 1, 1, 1,
0.5413844, 0.3169282, 2.445754, 1, 1, 1, 1, 1,
0.5424921, -0.129146, 2.964675, 1, 1, 1, 1, 1,
0.5446087, 1.936596, 0.201229, 1, 1, 1, 1, 1,
0.5584621, 1.120321, 0.4026643, 1, 1, 1, 1, 1,
0.5594049, 0.04091819, 0.8670088, 1, 1, 1, 1, 1,
0.5608842, -0.3238774, 1.068565, 1, 1, 1, 1, 1,
0.5618162, -0.9804786, 2.85561, 1, 1, 1, 1, 1,
0.5708361, -1.117145, 2.841173, 1, 1, 1, 1, 1,
0.5786009, -0.5186452, 1.599923, 1, 1, 1, 1, 1,
0.578808, -0.5763096, 1.328242, 1, 1, 1, 1, 1,
0.5823881, -0.04625668, 1.459212, 0, 0, 1, 1, 1,
0.5855059, 0.3925087, 1.091311, 1, 0, 0, 1, 1,
0.5898672, 1.964973, -0.02444341, 1, 0, 0, 1, 1,
0.5904877, 0.8847268, -0.6689983, 1, 0, 0, 1, 1,
0.5908148, 0.0497944, 1.736635, 1, 0, 0, 1, 1,
0.5960388, 0.5188092, 0.4661875, 1, 0, 0, 1, 1,
0.5972598, -0.1468576, 3.222534, 0, 0, 0, 1, 1,
0.6017744, 1.089131, 0.237438, 0, 0, 0, 1, 1,
0.6019243, 0.7216442, 1.508804, 0, 0, 0, 1, 1,
0.6041967, -1.020674, 2.064276, 0, 0, 0, 1, 1,
0.604601, -0.5242247, 1.977708, 0, 0, 0, 1, 1,
0.6076719, 0.1222751, 2.934353, 0, 0, 0, 1, 1,
0.6105165, 0.4668219, 0.7175059, 0, 0, 0, 1, 1,
0.6136103, 0.6435422, 0.3390872, 1, 1, 1, 1, 1,
0.6196955, -0.07253936, 2.893648, 1, 1, 1, 1, 1,
0.6212485, -1.986607, 2.785052, 1, 1, 1, 1, 1,
0.622626, 1.456584, 1.317718, 1, 1, 1, 1, 1,
0.6227648, 0.04165921, 1.207319, 1, 1, 1, 1, 1,
0.625751, 0.007631073, 1.925516, 1, 1, 1, 1, 1,
0.6259825, 0.2748016, 1.251276, 1, 1, 1, 1, 1,
0.6270211, 0.9354447, 2.529856, 1, 1, 1, 1, 1,
0.6364684, -0.7470531, 2.861531, 1, 1, 1, 1, 1,
0.6385685, -0.9309743, 3.365345, 1, 1, 1, 1, 1,
0.6401089, -0.8795376, 2.006771, 1, 1, 1, 1, 1,
0.6445295, 0.7965528, 0.6722781, 1, 1, 1, 1, 1,
0.6447469, 0.2083509, 1.907685, 1, 1, 1, 1, 1,
0.6452172, 0.4038866, -0.8274763, 1, 1, 1, 1, 1,
0.6494458, 0.4374622, 0.1013593, 1, 1, 1, 1, 1,
0.6646221, 0.974206, -1.308249, 0, 0, 1, 1, 1,
0.6656698, 0.4151728, 0.3009327, 1, 0, 0, 1, 1,
0.6709644, -0.02710839, 1.040081, 1, 0, 0, 1, 1,
0.6709731, -0.07200088, 1.908895, 1, 0, 0, 1, 1,
0.6744635, -0.2682503, 1.411885, 1, 0, 0, 1, 1,
0.6759767, 0.7635412, 0.7370175, 1, 0, 0, 1, 1,
0.6830999, -0.01583777, 2.759573, 0, 0, 0, 1, 1,
0.6848413, 0.4017002, 1.2519, 0, 0, 0, 1, 1,
0.6863054, 0.4865839, -0.1143796, 0, 0, 0, 1, 1,
0.6908981, 1.482126, 0.504161, 0, 0, 0, 1, 1,
0.6951581, 0.1510936, 2.219143, 0, 0, 0, 1, 1,
0.7003469, 1.074249, -0.2683661, 0, 0, 0, 1, 1,
0.7023085, -0.4389865, 3.465588, 0, 0, 0, 1, 1,
0.7024531, 1.211901, -0.9226364, 1, 1, 1, 1, 1,
0.7105388, 0.2639861, 1.472849, 1, 1, 1, 1, 1,
0.715983, -1.00641, 2.500508, 1, 1, 1, 1, 1,
0.7169222, 0.551109, 1.982005, 1, 1, 1, 1, 1,
0.7170061, 1.434944, -1.8479, 1, 1, 1, 1, 1,
0.7187825, -0.02765476, 1.720971, 1, 1, 1, 1, 1,
0.7245764, -1.298547, 3.347403, 1, 1, 1, 1, 1,
0.7289184, -0.2093461, 3.272882, 1, 1, 1, 1, 1,
0.7292769, -0.9622715, 3.332863, 1, 1, 1, 1, 1,
0.7352575, 1.277113, 0.0722652, 1, 1, 1, 1, 1,
0.7368818, -0.4879131, 3.499699, 1, 1, 1, 1, 1,
0.7422943, 1.149408, 1.079412, 1, 1, 1, 1, 1,
0.7434777, -1.171556, 2.206385, 1, 1, 1, 1, 1,
0.7445834, -1.056023, 1.071874, 1, 1, 1, 1, 1,
0.747162, 0.4386667, -0.262821, 1, 1, 1, 1, 1,
0.7517499, 1.593951, 1.417836, 0, 0, 1, 1, 1,
0.7620944, 0.8164903, -0.5207246, 1, 0, 0, 1, 1,
0.7632725, -0.9671025, 2.072517, 1, 0, 0, 1, 1,
0.773074, 1.351215, 1.356515, 1, 0, 0, 1, 1,
0.7730914, -0.4520789, 3.437858, 1, 0, 0, 1, 1,
0.7749927, -0.3926266, 1.954141, 1, 0, 0, 1, 1,
0.7772094, 0.5944726, 1.502871, 0, 0, 0, 1, 1,
0.7837965, -0.4613374, 2.94438, 0, 0, 0, 1, 1,
0.7919477, -0.6829891, 2.346622, 0, 0, 0, 1, 1,
0.796663, 1.042376, -0.117433, 0, 0, 0, 1, 1,
0.799551, -1.282306, 0.9127714, 0, 0, 0, 1, 1,
0.8060216, 1.279151, 0.5250731, 0, 0, 0, 1, 1,
0.8109828, -0.4466747, 0.2752477, 0, 0, 0, 1, 1,
0.813281, -0.06093711, 2.001643, 1, 1, 1, 1, 1,
0.8163078, -1.40214, 0.7481474, 1, 1, 1, 1, 1,
0.8181816, -1.215462, 4.308861, 1, 1, 1, 1, 1,
0.8223312, -0.9632471, 4.038425, 1, 1, 1, 1, 1,
0.8496885, -0.0322295, 1.775039, 1, 1, 1, 1, 1,
0.8537623, -0.5594859, 1.595784, 1, 1, 1, 1, 1,
0.8554931, -0.05913418, 1.365243, 1, 1, 1, 1, 1,
0.8587257, -1.648214, 3.675203, 1, 1, 1, 1, 1,
0.8645819, 1.898658, 0.726992, 1, 1, 1, 1, 1,
0.8745367, -0.4454874, 0.2907829, 1, 1, 1, 1, 1,
0.8746167, 1.481943, 0.9508188, 1, 1, 1, 1, 1,
0.8757849, 0.9709975, 0.6435159, 1, 1, 1, 1, 1,
0.8818879, -0.5999214, 2.602758, 1, 1, 1, 1, 1,
0.8827071, -0.7062134, 2.395016, 1, 1, 1, 1, 1,
0.8953368, 1.4062, -0.536728, 1, 1, 1, 1, 1,
0.8985081, -0.5015491, 2.93682, 0, 0, 1, 1, 1,
0.9003322, 0.4203388, 2.73725, 1, 0, 0, 1, 1,
0.9004685, -0.6467823, 2.620471, 1, 0, 0, 1, 1,
0.9014158, -0.2098272, 1.688077, 1, 0, 0, 1, 1,
0.9062606, -0.3910662, 3.712762, 1, 0, 0, 1, 1,
0.9155297, 0.1807316, 2.202728, 1, 0, 0, 1, 1,
0.9184083, -0.4793367, 2.041535, 0, 0, 0, 1, 1,
0.9203056, -0.7381406, 3.705088, 0, 0, 0, 1, 1,
0.9209613, -0.7785611, 2.162115, 0, 0, 0, 1, 1,
0.9315298, -0.3970044, 1.185928, 0, 0, 0, 1, 1,
0.933248, -0.1404265, 3.351252, 0, 0, 0, 1, 1,
0.9358206, 0.4964741, 1.318151, 0, 0, 0, 1, 1,
0.9396417, 1.568793, 0.8225138, 0, 0, 0, 1, 1,
0.9419903, -2.160822, 3.207778, 1, 1, 1, 1, 1,
0.9459464, 0.6031823, -0.4694791, 1, 1, 1, 1, 1,
0.9472706, -0.192819, 0.718421, 1, 1, 1, 1, 1,
0.9518761, -0.7184465, 0.8039087, 1, 1, 1, 1, 1,
0.957509, -1.86355, 2.048576, 1, 1, 1, 1, 1,
0.9580387, 1.604916, 0.6003619, 1, 1, 1, 1, 1,
0.9624385, -0.06184624, 1.1581, 1, 1, 1, 1, 1,
0.9656127, -0.3646189, -0.3116747, 1, 1, 1, 1, 1,
0.9831988, -0.3205201, 0.4310755, 1, 1, 1, 1, 1,
0.98448, 3.278044, 1.722721, 1, 1, 1, 1, 1,
0.9859977, -1.718549, 1.911768, 1, 1, 1, 1, 1,
0.9885497, 0.1654109, 1.095553, 1, 1, 1, 1, 1,
0.9886106, 1.264104, 1.210027, 1, 1, 1, 1, 1,
0.9975381, 0.4379126, 2.326712, 1, 1, 1, 1, 1,
0.9983654, 0.05634484, 1.224569, 1, 1, 1, 1, 1,
1.001103, 0.1653485, 1.477951, 0, 0, 1, 1, 1,
1.004665, -1.019921, 1.257827, 1, 0, 0, 1, 1,
1.016774, 1.795362, 0.9003888, 1, 0, 0, 1, 1,
1.025769, -1.604737, 3.341891, 1, 0, 0, 1, 1,
1.028108, -0.194162, 2.108685, 1, 0, 0, 1, 1,
1.031538, 0.3315733, 1.042289, 1, 0, 0, 1, 1,
1.040803, -0.9291544, 2.879788, 0, 0, 0, 1, 1,
1.042191, -1.651559, 2.583017, 0, 0, 0, 1, 1,
1.044986, -0.00117668, 0.8958216, 0, 0, 0, 1, 1,
1.045974, -1.915121, 3.273533, 0, 0, 0, 1, 1,
1.047143, 0.3321254, -0.7898706, 0, 0, 0, 1, 1,
1.053071, -0.4973643, 2.091793, 0, 0, 0, 1, 1,
1.053932, 0.4763878, 1.888956, 0, 0, 0, 1, 1,
1.056124, -0.4180806, 2.740675, 1, 1, 1, 1, 1,
1.057078, 1.14823, 1.285057, 1, 1, 1, 1, 1,
1.058486, -1.266489, 4.459057, 1, 1, 1, 1, 1,
1.060802, 0.9134395, 1.257156, 1, 1, 1, 1, 1,
1.061334, 1.133463, 0.5107595, 1, 1, 1, 1, 1,
1.068122, 0.7989256, -0.2160743, 1, 1, 1, 1, 1,
1.070515, -0.04642576, -0.1749914, 1, 1, 1, 1, 1,
1.073496, -0.7110279, 3.48152, 1, 1, 1, 1, 1,
1.081176, 0.8711577, 1.307365, 1, 1, 1, 1, 1,
1.085262, -0.747457, 2.772586, 1, 1, 1, 1, 1,
1.0949, -0.04376786, 1.081478, 1, 1, 1, 1, 1,
1.0965, 0.3001038, 2.668231, 1, 1, 1, 1, 1,
1.101407, -0.683468, 2.792242, 1, 1, 1, 1, 1,
1.101486, 0.4171579, 1.018728, 1, 1, 1, 1, 1,
1.101894, -0.5655113, 2.373412, 1, 1, 1, 1, 1,
1.105226, -0.1167411, 1.366159, 0, 0, 1, 1, 1,
1.112654, 0.6238383, 0.1859917, 1, 0, 0, 1, 1,
1.114886, -0.3692479, 1.439802, 1, 0, 0, 1, 1,
1.118595, -0.04245595, 1.785377, 1, 0, 0, 1, 1,
1.121616, 2.348851, 0.009261631, 1, 0, 0, 1, 1,
1.124755, 0.3800125, 1.593921, 1, 0, 0, 1, 1,
1.130526, -0.4903426, 0.5117358, 0, 0, 0, 1, 1,
1.130547, -0.9680859, 4.341525, 0, 0, 0, 1, 1,
1.131115, -1.330868, 2.579138, 0, 0, 0, 1, 1,
1.137886, -0.6396733, 2.808251, 0, 0, 0, 1, 1,
1.148582, -0.0347662, 1.113954, 0, 0, 0, 1, 1,
1.159261, -0.1985595, 2.000499, 0, 0, 0, 1, 1,
1.162832, 0.6539771, 1.860844, 0, 0, 0, 1, 1,
1.16381, -1.453499, 3.213274, 1, 1, 1, 1, 1,
1.174046, -0.7864987, 3.067423, 1, 1, 1, 1, 1,
1.176896, 0.8807962, 2.576247, 1, 1, 1, 1, 1,
1.177727, -0.4537601, 3.06842, 1, 1, 1, 1, 1,
1.180035, -0.06443527, 2.324534, 1, 1, 1, 1, 1,
1.185514, 0.3208168, 1.444515, 1, 1, 1, 1, 1,
1.192155, -1.929427, 2.571891, 1, 1, 1, 1, 1,
1.199766, 0.6040901, 1.046831, 1, 1, 1, 1, 1,
1.2038, -0.5645555, 0.715974, 1, 1, 1, 1, 1,
1.218332, 0.1767413, 1.145826, 1, 1, 1, 1, 1,
1.222639, 0.09242749, 0.6817758, 1, 1, 1, 1, 1,
1.223628, -0.7324356, 1.876622, 1, 1, 1, 1, 1,
1.227069, 0.5552546, 3.441144, 1, 1, 1, 1, 1,
1.235153, -0.8280452, 0.2928128, 1, 1, 1, 1, 1,
1.247573, 1.169272, 0.5875069, 1, 1, 1, 1, 1,
1.248473, -0.6876616, 2.486417, 0, 0, 1, 1, 1,
1.257338, 0.2121281, 2.587863, 1, 0, 0, 1, 1,
1.2815, -0.727587, 2.702954, 1, 0, 0, 1, 1,
1.288139, 2.372942, 0.9181809, 1, 0, 0, 1, 1,
1.29782, -0.3452437, 2.462041, 1, 0, 0, 1, 1,
1.299478, 0.07534484, 0.2404239, 1, 0, 0, 1, 1,
1.299705, 1.081654, 0.601084, 0, 0, 0, 1, 1,
1.310997, 1.46356, 1.43487, 0, 0, 0, 1, 1,
1.314598, -0.8541873, 1.789388, 0, 0, 0, 1, 1,
1.317007, -1.922193, 1.821776, 0, 0, 0, 1, 1,
1.319287, -0.1588272, 0.5793498, 0, 0, 0, 1, 1,
1.326824, 1.868708, 0.8006297, 0, 0, 0, 1, 1,
1.327762, -0.4151733, 2.029789, 0, 0, 0, 1, 1,
1.329139, -1.595435, 2.250701, 1, 1, 1, 1, 1,
1.329788, 0.6299398, 2.683567, 1, 1, 1, 1, 1,
1.330441, 0.1607361, 2.605167, 1, 1, 1, 1, 1,
1.335532, 0.7699159, 0.1468728, 1, 1, 1, 1, 1,
1.335959, -0.2107907, 3.57887, 1, 1, 1, 1, 1,
1.339153, -0.9488059, 2.349425, 1, 1, 1, 1, 1,
1.340237, 0.02458269, 3.18582, 1, 1, 1, 1, 1,
1.344614, -1.681766, 1.903487, 1, 1, 1, 1, 1,
1.349374, -2.975772, 1.569971, 1, 1, 1, 1, 1,
1.357496, 1.763329, 0.7979675, 1, 1, 1, 1, 1,
1.358756, -0.6825088, 3.432003, 1, 1, 1, 1, 1,
1.359635, -0.1616871, 0.4191952, 1, 1, 1, 1, 1,
1.368851, -1.662979, 1.330907, 1, 1, 1, 1, 1,
1.383759, -0.7114142, 1.778116, 1, 1, 1, 1, 1,
1.389425, 1.901467, 1.700173, 1, 1, 1, 1, 1,
1.397751, 0.9886334, -0.2860487, 0, 0, 1, 1, 1,
1.408227, -1.713882, 2.764562, 1, 0, 0, 1, 1,
1.417963, 0.505141, -0.6458229, 1, 0, 0, 1, 1,
1.423407, 0.1830357, 3.311951, 1, 0, 0, 1, 1,
1.435887, -0.4868225, 2.936728, 1, 0, 0, 1, 1,
1.441175, 1.125115, 1.62328, 1, 0, 0, 1, 1,
1.447967, -0.4953436, 1.817245, 0, 0, 0, 1, 1,
1.45449, -1.602223, 2.655352, 0, 0, 0, 1, 1,
1.473432, -0.007806178, 0.8026139, 0, 0, 0, 1, 1,
1.477671, -1.51081, 3.516024, 0, 0, 0, 1, 1,
1.485863, -0.3010302, 1.4255, 0, 0, 0, 1, 1,
1.49999, 1.168783, 0.7728382, 0, 0, 0, 1, 1,
1.504967, 0.2222966, 1.030944, 0, 0, 0, 1, 1,
1.520201, -1.53089, 2.089292, 1, 1, 1, 1, 1,
1.521625, 0.8464492, 0.2042271, 1, 1, 1, 1, 1,
1.524264, 0.6651477, 0.2065821, 1, 1, 1, 1, 1,
1.525752, -0.5686329, 0.349241, 1, 1, 1, 1, 1,
1.527292, -1.842172, 1.977933, 1, 1, 1, 1, 1,
1.536587, 0.3427882, 0.3646463, 1, 1, 1, 1, 1,
1.561853, 0.03659141, 0.178622, 1, 1, 1, 1, 1,
1.580529, -0.6810395, -0.1419715, 1, 1, 1, 1, 1,
1.584393, 0.8041487, 2.173303, 1, 1, 1, 1, 1,
1.591812, -0.09526978, 1.374632, 1, 1, 1, 1, 1,
1.601838, -1.563121, 3.237491, 1, 1, 1, 1, 1,
1.604191, 0.7740067, 1.348482, 1, 1, 1, 1, 1,
1.614681, -1.031459, 1.102335, 1, 1, 1, 1, 1,
1.617737, 0.646605, 2.534934, 1, 1, 1, 1, 1,
1.63008, 1.992631, 0.8568386, 1, 1, 1, 1, 1,
1.669377, 0.1821015, 0.2681396, 0, 0, 1, 1, 1,
1.696804, -0.4505934, 3.072302, 1, 0, 0, 1, 1,
1.711033, 0.8295105, 1.756172, 1, 0, 0, 1, 1,
1.713372, 0.06975457, 2.148198, 1, 0, 0, 1, 1,
1.71353, 2.463828, 0.7754455, 1, 0, 0, 1, 1,
1.720346, -1.057521, 2.121372, 1, 0, 0, 1, 1,
1.721347, 1.1161, 0.07891954, 0, 0, 0, 1, 1,
1.724828, 0.4402453, 1.002119, 0, 0, 0, 1, 1,
1.727134, 1.191366, -0.1087596, 0, 0, 0, 1, 1,
1.745991, -0.746891, 2.501394, 0, 0, 0, 1, 1,
1.746615, 0.5415621, 2.688578, 0, 0, 0, 1, 1,
1.760059, -0.3640824, 2.649576, 0, 0, 0, 1, 1,
1.774521, -0.1925091, 0.8487963, 0, 0, 0, 1, 1,
1.820138, 0.8641261, 2.792747, 1, 1, 1, 1, 1,
1.833132, 0.4188765, 0.3493209, 1, 1, 1, 1, 1,
1.839166, -1.069632, 2.44312, 1, 1, 1, 1, 1,
1.841418, -1.126345, 1.401959, 1, 1, 1, 1, 1,
1.863059, 1.457679, 2.254593, 1, 1, 1, 1, 1,
1.87779, -0.311148, 1.518201, 1, 1, 1, 1, 1,
1.88314, -0.04638277, 1.517285, 1, 1, 1, 1, 1,
1.898928, -1.452746, 3.643834, 1, 1, 1, 1, 1,
1.907959, -1.053992, 1.948758, 1, 1, 1, 1, 1,
1.90882, 1.143458, 0.986166, 1, 1, 1, 1, 1,
1.909002, -0.1831464, 1.904331, 1, 1, 1, 1, 1,
1.922051, 0.5712929, 0.8591245, 1, 1, 1, 1, 1,
1.935346, 0.8627315, 0.9364003, 1, 1, 1, 1, 1,
1.942574, 0.3798335, 3.106512, 1, 1, 1, 1, 1,
2.011645, 1.034166, 1.252998, 1, 1, 1, 1, 1,
2.038218, 0.6785473, 2.601797, 0, 0, 1, 1, 1,
2.043289, -0.639699, 1.700614, 1, 0, 0, 1, 1,
2.044409, -0.5228367, 2.881473, 1, 0, 0, 1, 1,
2.061676, -0.6218317, 2.768913, 1, 0, 0, 1, 1,
2.074054, 0.02836046, 0.7711868, 1, 0, 0, 1, 1,
2.120039, 0.2070888, 1.071628, 1, 0, 0, 1, 1,
2.153238, 0.8080885, 2.799502, 0, 0, 0, 1, 1,
2.190383, 0.5019379, 2.28866, 0, 0, 0, 1, 1,
2.220058, -0.6209216, 2.013561, 0, 0, 0, 1, 1,
2.28423, -0.09111789, 1.229948, 0, 0, 0, 1, 1,
2.291188, 0.3759005, 0.3566909, 0, 0, 0, 1, 1,
2.319507, 0.5108789, 1.213134, 0, 0, 0, 1, 1,
2.327282, 0.7443103, 1.292022, 0, 0, 0, 1, 1,
2.363367, 1.276924, 1.368759, 1, 1, 1, 1, 1,
2.367969, -1.289725, 0.1426132, 1, 1, 1, 1, 1,
2.436887, 0.179671, 0.2578713, 1, 1, 1, 1, 1,
2.582836, 0.6151148, 2.91722, 1, 1, 1, 1, 1,
2.665023, -0.03102542, 0.7081323, 1, 1, 1, 1, 1,
3.061441, 0.1375165, 0.7823278, 1, 1, 1, 1, 1,
3.440346, 1.46644, 0.9776873, 1, 1, 1, 1, 1
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
var radius = 9.605756;
var distance = 33.73981;
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
mvMatrix.translate( -0.1120443, -0.3073658, 0.5202518 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.73981);
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
