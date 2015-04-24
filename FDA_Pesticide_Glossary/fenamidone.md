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
-3.60488, -1.479815, -2.493758, 1, 0, 0, 1,
-2.877846, 0.1399985, -0.1206667, 1, 0.007843138, 0, 1,
-2.733287, -0.1369087, -1.430385, 1, 0.01176471, 0, 1,
-2.504788, -0.7157774, -1.035542, 1, 0.01960784, 0, 1,
-2.481262, 0.7338076, -2.420641, 1, 0.02352941, 0, 1,
-2.474066, 0.1339246, -3.2261, 1, 0.03137255, 0, 1,
-2.309883, -1.395108, -1.65201, 1, 0.03529412, 0, 1,
-2.290062, 0.5307465, -1.669219, 1, 0.04313726, 0, 1,
-2.235126, -0.7168541, -3.147429, 1, 0.04705882, 0, 1,
-2.203759, 0.3382551, -0.7408502, 1, 0.05490196, 0, 1,
-2.203309, 0.7264575, -2.81236, 1, 0.05882353, 0, 1,
-2.195542, 2.045951, -0.8441753, 1, 0.06666667, 0, 1,
-2.191421, -1.322799, -0.3137846, 1, 0.07058824, 0, 1,
-2.17598, 0.3352768, -0.1400236, 1, 0.07843138, 0, 1,
-2.136417, 0.8596464, -1.098615, 1, 0.08235294, 0, 1,
-2.112131, 0.9648157, 0.1293841, 1, 0.09019608, 0, 1,
-2.093597, 0.5523746, -1.068418, 1, 0.09411765, 0, 1,
-2.05732, -3.121543, -0.8325093, 1, 0.1019608, 0, 1,
-2.043802, -1.490579, -1.744547, 1, 0.1098039, 0, 1,
-2.005493, -0.2037012, -1.923401, 1, 0.1137255, 0, 1,
-1.945634, 0.7156644, -0.1926413, 1, 0.1215686, 0, 1,
-1.931898, -1.157211, -2.16891, 1, 0.1254902, 0, 1,
-1.928608, -0.902687, -0.007114581, 1, 0.1333333, 0, 1,
-1.917362, 0.08024962, -1.971385, 1, 0.1372549, 0, 1,
-1.91188, -1.556277, -1.386176, 1, 0.145098, 0, 1,
-1.907789, -0.5516757, -2.173328, 1, 0.1490196, 0, 1,
-1.903219, 0.5539979, -2.151258, 1, 0.1568628, 0, 1,
-1.883676, 1.968405, 0.0326873, 1, 0.1607843, 0, 1,
-1.873793, -0.007919701, -2.254579, 1, 0.1686275, 0, 1,
-1.864453, 0.07161207, -0.3659056, 1, 0.172549, 0, 1,
-1.82068, 0.7902444, -1.869712, 1, 0.1803922, 0, 1,
-1.816014, -1.76073, -2.96304, 1, 0.1843137, 0, 1,
-1.779275, -0.3163773, -2.036246, 1, 0.1921569, 0, 1,
-1.757705, -1.557289, -1.385993, 1, 0.1960784, 0, 1,
-1.748062, 1.473761, 0.03753577, 1, 0.2039216, 0, 1,
-1.716847, 0.02989776, -0.8073697, 1, 0.2117647, 0, 1,
-1.707829, -0.4548372, -3.812696, 1, 0.2156863, 0, 1,
-1.699891, -0.7591364, -1.566354, 1, 0.2235294, 0, 1,
-1.680725, 0.4136457, -0.6145126, 1, 0.227451, 0, 1,
-1.676835, -2.424535, -2.794598, 1, 0.2352941, 0, 1,
-1.67249, -0.8514664, -0.7490236, 1, 0.2392157, 0, 1,
-1.661541, -0.3983255, -0.02973291, 1, 0.2470588, 0, 1,
-1.644446, -0.3946685, -3.796556, 1, 0.2509804, 0, 1,
-1.644424, 0.7566658, -2.334879, 1, 0.2588235, 0, 1,
-1.640322, -1.42207, -0.9749746, 1, 0.2627451, 0, 1,
-1.639335, -0.3910826, -0.7015332, 1, 0.2705882, 0, 1,
-1.635262, -0.7620561, -2.705492, 1, 0.2745098, 0, 1,
-1.624857, 0.5340071, -0.004946374, 1, 0.282353, 0, 1,
-1.623837, -1.067219, -3.021837, 1, 0.2862745, 0, 1,
-1.623659, 0.02004808, -1.213579, 1, 0.2941177, 0, 1,
-1.613812, -3.072935, -3.28632, 1, 0.3019608, 0, 1,
-1.611689, 1.332167, 0.1313608, 1, 0.3058824, 0, 1,
-1.591175, 0.2421181, -0.5962396, 1, 0.3137255, 0, 1,
-1.569115, -0.4958443, -2.246609, 1, 0.3176471, 0, 1,
-1.560093, -1.071939, -3.240776, 1, 0.3254902, 0, 1,
-1.556967, -0.167899, 0.1168491, 1, 0.3294118, 0, 1,
-1.542469, -0.6103187, -1.131348, 1, 0.3372549, 0, 1,
-1.526953, 1.018708, -1.699768, 1, 0.3411765, 0, 1,
-1.505868, 0.4030539, -1.615513, 1, 0.3490196, 0, 1,
-1.503002, -0.05464117, -1.027661, 1, 0.3529412, 0, 1,
-1.502515, -0.6049765, -2.142091, 1, 0.3607843, 0, 1,
-1.500617, 0.2856849, -2.904039, 1, 0.3647059, 0, 1,
-1.48032, -0.09807582, -0.8001412, 1, 0.372549, 0, 1,
-1.473728, 1.709219, -1.294565, 1, 0.3764706, 0, 1,
-1.470507, -0.539933, -2.968055, 1, 0.3843137, 0, 1,
-1.458478, -0.7100994, -1.42291, 1, 0.3882353, 0, 1,
-1.454602, 0.820266, -1.658418, 1, 0.3960784, 0, 1,
-1.448836, -0.2392371, -3.360633, 1, 0.4039216, 0, 1,
-1.446122, -2.071386, -2.246213, 1, 0.4078431, 0, 1,
-1.444796, -0.7433796, -1.772046, 1, 0.4156863, 0, 1,
-1.441399, -0.3676361, -2.082118, 1, 0.4196078, 0, 1,
-1.43271, 0.6626471, -2.451523, 1, 0.427451, 0, 1,
-1.429637, -0.4857437, -0.6561328, 1, 0.4313726, 0, 1,
-1.406812, 1.313578, -1.888474, 1, 0.4392157, 0, 1,
-1.394884, -0.4164718, -0.3732006, 1, 0.4431373, 0, 1,
-1.391619, -1.444888, -1.915874, 1, 0.4509804, 0, 1,
-1.378505, 1.026567, -1.488691, 1, 0.454902, 0, 1,
-1.377803, -0.1971551, -1.259443, 1, 0.4627451, 0, 1,
-1.376652, 0.754366, -1.298096, 1, 0.4666667, 0, 1,
-1.37368, -0.4230182, -2.229484, 1, 0.4745098, 0, 1,
-1.369718, -0.1859387, -2.220382, 1, 0.4784314, 0, 1,
-1.367438, -1.526578, -3.048829, 1, 0.4862745, 0, 1,
-1.363539, 0.2210819, 0.5894563, 1, 0.4901961, 0, 1,
-1.348094, 0.4706932, -2.4235, 1, 0.4980392, 0, 1,
-1.342511, -0.03000736, -2.29793, 1, 0.5058824, 0, 1,
-1.340128, -2.599638, -1.705131, 1, 0.509804, 0, 1,
-1.334168, -1.745231, -3.672756, 1, 0.5176471, 0, 1,
-1.328389, -1.207568, -3.432013, 1, 0.5215687, 0, 1,
-1.324141, 0.8461261, -1.258467, 1, 0.5294118, 0, 1,
-1.314219, -0.4906274, -3.012587, 1, 0.5333334, 0, 1,
-1.307532, 1.438921, -1.369581, 1, 0.5411765, 0, 1,
-1.290581, 1.592262, -0.5908633, 1, 0.5450981, 0, 1,
-1.288077, -1.295887, -1.467106, 1, 0.5529412, 0, 1,
-1.28675, -0.3044159, -1.248007, 1, 0.5568628, 0, 1,
-1.279714, -1.21911, -3.650279, 1, 0.5647059, 0, 1,
-1.278251, -0.04990454, -3.859207, 1, 0.5686275, 0, 1,
-1.274384, -0.1336174, -2.570589, 1, 0.5764706, 0, 1,
-1.260431, 2.249688, -1.657784, 1, 0.5803922, 0, 1,
-1.242872, 0.7574236, -1.144314, 1, 0.5882353, 0, 1,
-1.24287, 0.8150417, -1.321218, 1, 0.5921569, 0, 1,
-1.242414, 0.3692977, -2.388267, 1, 0.6, 0, 1,
-1.235778, -1.376881, -2.161526, 1, 0.6078432, 0, 1,
-1.234755, 0.1831681, -0.6794928, 1, 0.6117647, 0, 1,
-1.222648, -0.09298786, -1.73422, 1, 0.6196079, 0, 1,
-1.217376, -0.1715677, -1.674609, 1, 0.6235294, 0, 1,
-1.211846, -0.8392687, -1.753401, 1, 0.6313726, 0, 1,
-1.204972, 0.2557865, -1.231961, 1, 0.6352941, 0, 1,
-1.198469, 0.8944663, -0.3180755, 1, 0.6431373, 0, 1,
-1.193692, 0.3600136, -0.767916, 1, 0.6470588, 0, 1,
-1.18457, -0.8271863, -2.310009, 1, 0.654902, 0, 1,
-1.173273, -0.7382253, -2.681455, 1, 0.6588235, 0, 1,
-1.169307, -0.6056675, -3.174272, 1, 0.6666667, 0, 1,
-1.169134, -0.8260559, -2.176072, 1, 0.6705883, 0, 1,
-1.164439, 0.1186095, -0.1308443, 1, 0.6784314, 0, 1,
-1.155373, -0.7516283, -2.559856, 1, 0.682353, 0, 1,
-1.154526, 0.1817241, -2.676418, 1, 0.6901961, 0, 1,
-1.146468, 0.3029311, -1.323525, 1, 0.6941177, 0, 1,
-1.146142, 0.3227181, -0.1789437, 1, 0.7019608, 0, 1,
-1.140515, 0.3851123, -0.9784943, 1, 0.7098039, 0, 1,
-1.133641, -0.9939685, -1.143927, 1, 0.7137255, 0, 1,
-1.126245, 0.9472997, -1.764818, 1, 0.7215686, 0, 1,
-1.125373, -2.901168, -0.9456508, 1, 0.7254902, 0, 1,
-1.124131, 1.813445, 1.325594, 1, 0.7333333, 0, 1,
-1.104582, -0.2292056, -3.158815, 1, 0.7372549, 0, 1,
-1.103636, -0.6467375, -1.800872, 1, 0.7450981, 0, 1,
-1.098134, -0.7587213, -2.698213, 1, 0.7490196, 0, 1,
-1.081711, -0.01092978, -1.547796, 1, 0.7568628, 0, 1,
-1.081532, -0.4610639, -2.747926, 1, 0.7607843, 0, 1,
-1.080727, 0.2914406, -1.293808, 1, 0.7686275, 0, 1,
-1.074558, -0.3103192, -2.170688, 1, 0.772549, 0, 1,
-1.065379, 0.09996781, -2.288221, 1, 0.7803922, 0, 1,
-1.058441, 0.3353504, -2.776757, 1, 0.7843137, 0, 1,
-1.046351, 0.4286405, -0.6099209, 1, 0.7921569, 0, 1,
-1.038445, 2.298104, -0.377833, 1, 0.7960784, 0, 1,
-1.036764, 1.901504, -2.340166, 1, 0.8039216, 0, 1,
-1.033931, -1.682051, -3.279776, 1, 0.8117647, 0, 1,
-1.027864, -1.822242, -4.049878, 1, 0.8156863, 0, 1,
-1.026518, 1.008062, -1.216346, 1, 0.8235294, 0, 1,
-1.026184, -0.8971837, -1.245398, 1, 0.827451, 0, 1,
-1.023103, 0.7839151, -2.878218, 1, 0.8352941, 0, 1,
-1.022347, -0.1929736, 0.1493957, 1, 0.8392157, 0, 1,
-1.019252, 0.3593183, -1.143846, 1, 0.8470588, 0, 1,
-1.018658, -1.03141, -2.833134, 1, 0.8509804, 0, 1,
-1.0139, 0.6796578, -1.441761, 1, 0.8588235, 0, 1,
-1.009097, 1.069355, -0.5583729, 1, 0.8627451, 0, 1,
-1.00826, -0.1637259, -2.52279, 1, 0.8705882, 0, 1,
-1.001416, -0.1368645, -2.048615, 1, 0.8745098, 0, 1,
-0.9931436, 0.6180456, -3.328984, 1, 0.8823529, 0, 1,
-0.9846452, 1.370988, 0.01712468, 1, 0.8862745, 0, 1,
-0.9808118, 0.9641089, 1.658495, 1, 0.8941177, 0, 1,
-0.9733105, 0.03363959, -1.994715, 1, 0.8980392, 0, 1,
-0.9709408, -1.810943, -2.172992, 1, 0.9058824, 0, 1,
-0.9678937, 0.4750792, 1.714739, 1, 0.9137255, 0, 1,
-0.9617962, 0.6331508, -0.3431452, 1, 0.9176471, 0, 1,
-0.9600356, 0.7132452, -0.9613426, 1, 0.9254902, 0, 1,
-0.9525365, 0.8750144, -0.7081239, 1, 0.9294118, 0, 1,
-0.9514922, 0.1567182, -2.716359, 1, 0.9372549, 0, 1,
-0.942171, 0.3249716, -2.146291, 1, 0.9411765, 0, 1,
-0.9385207, -1.941316, -1.991016, 1, 0.9490196, 0, 1,
-0.9375935, -0.6208268, -1.438981, 1, 0.9529412, 0, 1,
-0.9367753, 1.154387, -1.414962, 1, 0.9607843, 0, 1,
-0.9335322, -1.174813, -2.467144, 1, 0.9647059, 0, 1,
-0.9310412, -0.2369427, -2.742425, 1, 0.972549, 0, 1,
-0.93005, 0.544618, -1.1926, 1, 0.9764706, 0, 1,
-0.9264769, 0.9147921, 0.5832257, 1, 0.9843137, 0, 1,
-0.9243911, -0.7801611, -1.547487, 1, 0.9882353, 0, 1,
-0.9233319, 0.801892, -2.037046, 1, 0.9960784, 0, 1,
-0.9207771, 1.789217, 0.1910377, 0.9960784, 1, 0, 1,
-0.9178975, 1.231808, -1.758556, 0.9921569, 1, 0, 1,
-0.9165592, -1.887799, -2.581815, 0.9843137, 1, 0, 1,
-0.9153953, -1.000191, -1.122514, 0.9803922, 1, 0, 1,
-0.9073641, 1.805395, -1.00433, 0.972549, 1, 0, 1,
-0.9036691, 0.2343672, -0.9845843, 0.9686275, 1, 0, 1,
-0.8996685, -0.01575506, -0.808539, 0.9607843, 1, 0, 1,
-0.8975867, -1.355224, -3.351041, 0.9568627, 1, 0, 1,
-0.8969309, -1.4336, -4.213943, 0.9490196, 1, 0, 1,
-0.8959091, -0.6330899, -1.858206, 0.945098, 1, 0, 1,
-0.8955486, -0.6564853, -2.118649, 0.9372549, 1, 0, 1,
-0.8924929, -0.0302498, -1.210242, 0.9333333, 1, 0, 1,
-0.891403, 0.552783, 0.3191194, 0.9254902, 1, 0, 1,
-0.8862052, -0.1605324, -0.8436596, 0.9215686, 1, 0, 1,
-0.8853386, 0.3443757, -2.191513, 0.9137255, 1, 0, 1,
-0.8808649, 1.35609, -1.61074, 0.9098039, 1, 0, 1,
-0.8732585, 0.4175105, -0.08634912, 0.9019608, 1, 0, 1,
-0.8684217, 1.273092, 0.02928907, 0.8941177, 1, 0, 1,
-0.8624517, -0.5536235, -2.78272, 0.8901961, 1, 0, 1,
-0.8605772, 1.009783, -1.269916, 0.8823529, 1, 0, 1,
-0.8560603, -0.8879671, -1.386573, 0.8784314, 1, 0, 1,
-0.8531052, -0.466367, -0.79775, 0.8705882, 1, 0, 1,
-0.8438131, -1.363279, -2.861926, 0.8666667, 1, 0, 1,
-0.83902, 2.222049, -0.257257, 0.8588235, 1, 0, 1,
-0.8379789, -2.287944, -3.614755, 0.854902, 1, 0, 1,
-0.836102, 1.37608, 0.6439921, 0.8470588, 1, 0, 1,
-0.825797, -0.9899296, -2.593963, 0.8431373, 1, 0, 1,
-0.8256725, -0.9642582, -3.392166, 0.8352941, 1, 0, 1,
-0.8134931, -0.7042055, -1.246712, 0.8313726, 1, 0, 1,
-0.8129543, 0.5265182, -0.7024251, 0.8235294, 1, 0, 1,
-0.8098643, 0.8945129, 0.2425342, 0.8196079, 1, 0, 1,
-0.8059205, 0.3485626, -0.886694, 0.8117647, 1, 0, 1,
-0.8027418, -0.2249619, -0.4536763, 0.8078431, 1, 0, 1,
-0.7997186, -0.03729518, -1.549974, 0.8, 1, 0, 1,
-0.7933437, 0.3020078, -0.1465723, 0.7921569, 1, 0, 1,
-0.7874482, 0.8274897, -2.879877, 0.7882353, 1, 0, 1,
-0.7750139, -1.179221, -3.512274, 0.7803922, 1, 0, 1,
-0.77372, -0.9651477, -0.9720165, 0.7764706, 1, 0, 1,
-0.772689, -1.519046, -2.684684, 0.7686275, 1, 0, 1,
-0.7680707, 0.4463772, -2.465817, 0.7647059, 1, 0, 1,
-0.766286, 1.132322, -1.495793, 0.7568628, 1, 0, 1,
-0.7626915, -0.3144659, -2.488888, 0.7529412, 1, 0, 1,
-0.7590201, -0.3473566, -0.2341381, 0.7450981, 1, 0, 1,
-0.7582765, -0.5527217, -3.385308, 0.7411765, 1, 0, 1,
-0.7565461, -0.6015741, -0.671051, 0.7333333, 1, 0, 1,
-0.7552919, -1.317921, -1.712785, 0.7294118, 1, 0, 1,
-0.7452335, 0.4825464, -0.992888, 0.7215686, 1, 0, 1,
-0.7442998, -0.9795617, -2.030682, 0.7176471, 1, 0, 1,
-0.7378559, 0.2732184, -1.010874, 0.7098039, 1, 0, 1,
-0.7378041, 0.6726513, -0.2709863, 0.7058824, 1, 0, 1,
-0.7359476, -1.066378, -2.860561, 0.6980392, 1, 0, 1,
-0.7348041, -0.2907561, -2.341792, 0.6901961, 1, 0, 1,
-0.7316525, -1.221109, -3.270046, 0.6862745, 1, 0, 1,
-0.728236, -0.08643324, -3.177957, 0.6784314, 1, 0, 1,
-0.7174321, -0.7181163, -1.107229, 0.6745098, 1, 0, 1,
-0.7144627, 0.2962635, 1.165711, 0.6666667, 1, 0, 1,
-0.7121194, 0.2297003, -1.432836, 0.6627451, 1, 0, 1,
-0.709779, -0.9683891, -2.794472, 0.654902, 1, 0, 1,
-0.7088389, 2.06482, 0.8690718, 0.6509804, 1, 0, 1,
-0.6986133, -0.4672531, -2.61151, 0.6431373, 1, 0, 1,
-0.6985589, 0.6265723, -4.287393, 0.6392157, 1, 0, 1,
-0.6975519, -1.726003, -1.849306, 0.6313726, 1, 0, 1,
-0.691679, -1.840582, -2.795268, 0.627451, 1, 0, 1,
-0.6908368, 2.046049, -0.811, 0.6196079, 1, 0, 1,
-0.6877151, -0.9000577, -2.758992, 0.6156863, 1, 0, 1,
-0.6856077, 0.008372415, -0.9539383, 0.6078432, 1, 0, 1,
-0.6818371, -0.09295061, -0.7954133, 0.6039216, 1, 0, 1,
-0.6798074, -0.6350549, -2.792841, 0.5960785, 1, 0, 1,
-0.677977, -0.2511221, -1.139056, 0.5882353, 1, 0, 1,
-0.6726998, -0.007717227, -1.474314, 0.5843138, 1, 0, 1,
-0.6618746, -0.09989878, -0.7232385, 0.5764706, 1, 0, 1,
-0.6603037, 0.3677454, 2.488808, 0.572549, 1, 0, 1,
-0.6583405, -0.18064, -0.5548229, 0.5647059, 1, 0, 1,
-0.6571319, 0.1479294, -0.2452386, 0.5607843, 1, 0, 1,
-0.6560767, -0.6556262, -2.247179, 0.5529412, 1, 0, 1,
-0.6531249, -1.2748, -2.843994, 0.5490196, 1, 0, 1,
-0.6524618, -0.6788272, -3.356236, 0.5411765, 1, 0, 1,
-0.6517349, 1.13256, 0.1068645, 0.5372549, 1, 0, 1,
-0.6500683, 1.26752, -2.319733, 0.5294118, 1, 0, 1,
-0.6478009, 0.5194509, -1.154641, 0.5254902, 1, 0, 1,
-0.6457928, -0.7074664, -3.309348, 0.5176471, 1, 0, 1,
-0.644184, -0.677547, -3.104558, 0.5137255, 1, 0, 1,
-0.6439264, 1.858667, -0.767234, 0.5058824, 1, 0, 1,
-0.6428995, 0.6307427, -1.411587, 0.5019608, 1, 0, 1,
-0.6400481, 0.1067601, -2.935451, 0.4941176, 1, 0, 1,
-0.6396312, 0.8090914, 0.4863794, 0.4862745, 1, 0, 1,
-0.6379341, 0.5498034, -0.7580649, 0.4823529, 1, 0, 1,
-0.6352111, 0.4831113, -2.260573, 0.4745098, 1, 0, 1,
-0.6299276, -0.3301801, -0.4379977, 0.4705882, 1, 0, 1,
-0.6261653, 0.009977965, -2.764094, 0.4627451, 1, 0, 1,
-0.6247389, 0.4652919, -1.805956, 0.4588235, 1, 0, 1,
-0.6223382, 0.8992223, -1.444401, 0.4509804, 1, 0, 1,
-0.6209672, -0.7569747, -2.618659, 0.4470588, 1, 0, 1,
-0.6208999, -0.06030909, -2.467969, 0.4392157, 1, 0, 1,
-0.6164852, 0.3598072, -1.202885, 0.4352941, 1, 0, 1,
-0.6155841, -1.07727, -1.639633, 0.427451, 1, 0, 1,
-0.6128625, 0.1172455, -3.304183, 0.4235294, 1, 0, 1,
-0.6126726, -1.491473, -1.648484, 0.4156863, 1, 0, 1,
-0.6095256, -0.3422928, -1.999189, 0.4117647, 1, 0, 1,
-0.6079188, -2.956473, -1.387028, 0.4039216, 1, 0, 1,
-0.6038441, -0.7139977, -2.069224, 0.3960784, 1, 0, 1,
-0.5983728, 0.280927, -0.05191392, 0.3921569, 1, 0, 1,
-0.5982696, 1.877337, -1.494337, 0.3843137, 1, 0, 1,
-0.5965585, -1.758069, -3.186907, 0.3803922, 1, 0, 1,
-0.5945176, -0.2511078, -2.001745, 0.372549, 1, 0, 1,
-0.5919631, -1.819542, -2.977374, 0.3686275, 1, 0, 1,
-0.5901844, -1.35205, -4.305153, 0.3607843, 1, 0, 1,
-0.5900548, 0.6216379, -0.335235, 0.3568628, 1, 0, 1,
-0.5883437, -0.1508767, -2.518183, 0.3490196, 1, 0, 1,
-0.5878217, 0.4141063, -2.885275, 0.345098, 1, 0, 1,
-0.5870345, -2.066716, -2.638165, 0.3372549, 1, 0, 1,
-0.5850772, -0.5604725, -2.786092, 0.3333333, 1, 0, 1,
-0.5820993, 0.9953455, -1.416791, 0.3254902, 1, 0, 1,
-0.5758474, 0.2535511, -2.223716, 0.3215686, 1, 0, 1,
-0.5730057, -1.23692, -4.37107, 0.3137255, 1, 0, 1,
-0.567171, 2.348586, -1.789429, 0.3098039, 1, 0, 1,
-0.561124, -2.404114, -2.265773, 0.3019608, 1, 0, 1,
-0.5598888, -1.313285, -2.144521, 0.2941177, 1, 0, 1,
-0.5597693, 0.4425758, -1.281583, 0.2901961, 1, 0, 1,
-0.5553229, 0.675109, -1.987974, 0.282353, 1, 0, 1,
-0.5508684, -2.576479, -2.758925, 0.2784314, 1, 0, 1,
-0.5466828, -0.9581891, -2.90079, 0.2705882, 1, 0, 1,
-0.545714, 1.462195, -0.4454524, 0.2666667, 1, 0, 1,
-0.5430113, 0.1892225, 1.329135, 0.2588235, 1, 0, 1,
-0.5425524, -0.2830687, -1.474634, 0.254902, 1, 0, 1,
-0.5415713, -1.652836, -3.628777, 0.2470588, 1, 0, 1,
-0.5336676, 2.200026, 0.8791244, 0.2431373, 1, 0, 1,
-0.5310502, -0.5360457, -2.678294, 0.2352941, 1, 0, 1,
-0.5297535, 0.5408245, -0.09548675, 0.2313726, 1, 0, 1,
-0.5284477, -0.2469386, -0.8939515, 0.2235294, 1, 0, 1,
-0.5272776, -0.1365906, -0.6890187, 0.2196078, 1, 0, 1,
-0.5268554, 1.498806, 0.3285166, 0.2117647, 1, 0, 1,
-0.5247537, -0.5701578, -2.612506, 0.2078431, 1, 0, 1,
-0.5208385, -0.5444078, -2.560397, 0.2, 1, 0, 1,
-0.5146901, -0.573167, -3.206086, 0.1921569, 1, 0, 1,
-0.5127792, 1.588065, 1.521155, 0.1882353, 1, 0, 1,
-0.5096576, 0.6290429, 0.3140153, 0.1803922, 1, 0, 1,
-0.5043024, -2.27021, -2.251545, 0.1764706, 1, 0, 1,
-0.5009479, 0.07539297, -2.466687, 0.1686275, 1, 0, 1,
-0.497097, -0.05404615, -1.436977, 0.1647059, 1, 0, 1,
-0.4941995, 1.027609, -0.6557872, 0.1568628, 1, 0, 1,
-0.4935511, 0.8577716, -2.410576, 0.1529412, 1, 0, 1,
-0.4928886, -0.5592735, -1.917306, 0.145098, 1, 0, 1,
-0.4846932, -1.433538, -1.098803, 0.1411765, 1, 0, 1,
-0.4838622, 0.2956682, -1.625457, 0.1333333, 1, 0, 1,
-0.4800986, 0.7641528, -1.726956, 0.1294118, 1, 0, 1,
-0.4769892, 0.08343021, -0.4469802, 0.1215686, 1, 0, 1,
-0.4719035, -0.0132469, -1.598181, 0.1176471, 1, 0, 1,
-0.4709742, 0.2791905, -0.843344, 0.1098039, 1, 0, 1,
-0.467092, -0.449073, -1.276837, 0.1058824, 1, 0, 1,
-0.4665843, -0.07536773, -1.455128, 0.09803922, 1, 0, 1,
-0.4661391, -0.3772973, -2.835162, 0.09019608, 1, 0, 1,
-0.4646557, -0.3970981, -2.310634, 0.08627451, 1, 0, 1,
-0.4638234, 0.716647, -0.1574555, 0.07843138, 1, 0, 1,
-0.4601476, -0.001760315, -0.242382, 0.07450981, 1, 0, 1,
-0.4577507, 0.9382673, -0.02444504, 0.06666667, 1, 0, 1,
-0.4553557, -0.1404897, -1.650033, 0.0627451, 1, 0, 1,
-0.4547275, -0.8771925, -0.4408415, 0.05490196, 1, 0, 1,
-0.4508608, 0.8710684, -1.764006, 0.05098039, 1, 0, 1,
-0.4501702, 0.6059136, 0.252584, 0.04313726, 1, 0, 1,
-0.4483164, 0.5816146, 0.4365779, 0.03921569, 1, 0, 1,
-0.4419671, -1.178775, -2.177798, 0.03137255, 1, 0, 1,
-0.4410141, -0.9291454, -2.039384, 0.02745098, 1, 0, 1,
-0.4397112, -0.7421566, -1.926416, 0.01960784, 1, 0, 1,
-0.4356643, 0.1735889, -0.7399024, 0.01568628, 1, 0, 1,
-0.4352139, -1.17158, -1.354021, 0.007843138, 1, 0, 1,
-0.4283969, -0.9374725, -1.589169, 0.003921569, 1, 0, 1,
-0.4248395, 0.7358716, 0.1488411, 0, 1, 0.003921569, 1,
-0.4240801, -0.7922969, -2.382834, 0, 1, 0.01176471, 1,
-0.4230359, -1.921324, -0.5555339, 0, 1, 0.01568628, 1,
-0.4166727, -2.126558, -3.960707, 0, 1, 0.02352941, 1,
-0.411855, 0.7576612, -1.386695, 0, 1, 0.02745098, 1,
-0.4107777, -1.212359, -0.8678804, 0, 1, 0.03529412, 1,
-0.410122, 0.1077203, -1.922998, 0, 1, 0.03921569, 1,
-0.4075741, 0.794506, 0.3968554, 0, 1, 0.04705882, 1,
-0.4055876, -1.512585, -3.505719, 0, 1, 0.05098039, 1,
-0.4003116, 1.551568, -1.219071, 0, 1, 0.05882353, 1,
-0.3962177, -0.4781546, -2.510159, 0, 1, 0.0627451, 1,
-0.3957736, 0.3802691, -0.0167578, 0, 1, 0.07058824, 1,
-0.3843248, 0.5475647, -0.4194611, 0, 1, 0.07450981, 1,
-0.3833347, -1.802418, -5.007263, 0, 1, 0.08235294, 1,
-0.381318, -0.0780461, -3.322635, 0, 1, 0.08627451, 1,
-0.3806082, 0.6978431, 0.1872713, 0, 1, 0.09411765, 1,
-0.3801425, 0.4071316, 1.885587, 0, 1, 0.1019608, 1,
-0.379127, -0.1608736, -2.819902, 0, 1, 0.1058824, 1,
-0.3775655, -1.724036, -1.544319, 0, 1, 0.1137255, 1,
-0.3771555, 1.094211, -0.3122344, 0, 1, 0.1176471, 1,
-0.3741714, 1.405157, 0.2415141, 0, 1, 0.1254902, 1,
-0.3721665, -1.850744, -3.468837, 0, 1, 0.1294118, 1,
-0.3711773, 0.1211975, -1.080716, 0, 1, 0.1372549, 1,
-0.3702457, 0.5374926, 0.8106879, 0, 1, 0.1411765, 1,
-0.3701032, 0.3571308, -3.835786, 0, 1, 0.1490196, 1,
-0.3663216, -1.068077, -1.262978, 0, 1, 0.1529412, 1,
-0.3655593, 1.056395, -0.7760313, 0, 1, 0.1607843, 1,
-0.3629696, 0.1768111, -0.5335348, 0, 1, 0.1647059, 1,
-0.3458802, 1.744454, -1.085126, 0, 1, 0.172549, 1,
-0.3390276, -0.5455384, -1.199607, 0, 1, 0.1764706, 1,
-0.3360994, 0.03875313, -1.567388, 0, 1, 0.1843137, 1,
-0.3345568, -0.7734414, -4.740668, 0, 1, 0.1882353, 1,
-0.3306613, -0.6985821, -1.181504, 0, 1, 0.1960784, 1,
-0.3256407, 1.21207, 0.2774432, 0, 1, 0.2039216, 1,
-0.3245197, 0.3434412, 0.8759966, 0, 1, 0.2078431, 1,
-0.3244608, -0.27735, -2.282015, 0, 1, 0.2156863, 1,
-0.3236896, 1.744261, -1.516906, 0, 1, 0.2196078, 1,
-0.3232222, -0.9314758, -1.448562, 0, 1, 0.227451, 1,
-0.321009, -0.2512523, -1.779181, 0, 1, 0.2313726, 1,
-0.3158307, -0.5475817, -2.606418, 0, 1, 0.2392157, 1,
-0.3027103, -1.363507, -4.751979, 0, 1, 0.2431373, 1,
-0.3010102, -0.5586331, -1.423653, 0, 1, 0.2509804, 1,
-0.2968302, 1.466152, 0.2827586, 0, 1, 0.254902, 1,
-0.2962032, 0.616708, 0.3276242, 0, 1, 0.2627451, 1,
-0.2915201, -1.250963, -1.688313, 0, 1, 0.2666667, 1,
-0.2898693, -0.6768231, -2.003737, 0, 1, 0.2745098, 1,
-0.2872578, 0.112768, -3.070769, 0, 1, 0.2784314, 1,
-0.2851198, -3.222088, -3.188471, 0, 1, 0.2862745, 1,
-0.2829151, 0.7789539, 0.1727229, 0, 1, 0.2901961, 1,
-0.2791143, 0.6178526, 0.804269, 0, 1, 0.2980392, 1,
-0.2776997, -1.633886, -4.050874, 0, 1, 0.3058824, 1,
-0.2773585, 1.278139, 1.613733, 0, 1, 0.3098039, 1,
-0.2764823, 0.07480398, -1.623996, 0, 1, 0.3176471, 1,
-0.2740275, -0.7434268, -4.20006, 0, 1, 0.3215686, 1,
-0.2724098, 0.8030061, 0.3606908, 0, 1, 0.3294118, 1,
-0.2683105, 0.9667543, -1.543137, 0, 1, 0.3333333, 1,
-0.2619059, 0.4504909, -2.252578, 0, 1, 0.3411765, 1,
-0.2597243, -2.367459, -4.926675, 0, 1, 0.345098, 1,
-0.2568565, -0.4680447, -3.644312, 0, 1, 0.3529412, 1,
-0.2550479, 1.135775, -2.266187, 0, 1, 0.3568628, 1,
-0.2465984, -0.9248427, -1.8125, 0, 1, 0.3647059, 1,
-0.2452022, 0.4956917, 0.3970168, 0, 1, 0.3686275, 1,
-0.2449876, 1.338171, -0.9859012, 0, 1, 0.3764706, 1,
-0.2444392, -2.418967, -2.88816, 0, 1, 0.3803922, 1,
-0.2433438, 0.5097625, 0.1199201, 0, 1, 0.3882353, 1,
-0.2410188, -1.339763, -3.740216, 0, 1, 0.3921569, 1,
-0.2345665, 0.3009826, -0.8432354, 0, 1, 0.4, 1,
-0.2340276, -1.243526, -1.166492, 0, 1, 0.4078431, 1,
-0.2330607, 1.682748, -0.09059004, 0, 1, 0.4117647, 1,
-0.231949, 0.05563568, -0.4045528, 0, 1, 0.4196078, 1,
-0.2282926, 0.07120019, -1.975578, 0, 1, 0.4235294, 1,
-0.2257819, -0.7463542, -3.441387, 0, 1, 0.4313726, 1,
-0.2200179, 1.540702, -0.3122732, 0, 1, 0.4352941, 1,
-0.2198691, 1.910329, 0.03316731, 0, 1, 0.4431373, 1,
-0.2178866, -1.398304, -2.240132, 0, 1, 0.4470588, 1,
-0.2170914, -0.4060172, -1.930332, 0, 1, 0.454902, 1,
-0.2169468, -0.2179818, -3.327659, 0, 1, 0.4588235, 1,
-0.2157359, -0.6501566, -3.409912, 0, 1, 0.4666667, 1,
-0.2139384, -0.7351089, -3.82786, 0, 1, 0.4705882, 1,
-0.2130014, 0.706461, -0.3141292, 0, 1, 0.4784314, 1,
-0.2064238, 1.192628, -0.8074083, 0, 1, 0.4823529, 1,
-0.2022502, -0.6310731, -3.153919, 0, 1, 0.4901961, 1,
-0.2021305, 0.7348593, -0.7931882, 0, 1, 0.4941176, 1,
-0.2020429, -1.058379, -0.4364243, 0, 1, 0.5019608, 1,
-0.1979484, 0.8390903, 0.2882601, 0, 1, 0.509804, 1,
-0.1972168, 1.341942, 1.265411, 0, 1, 0.5137255, 1,
-0.1954672, 0.7058231, 0.8499824, 0, 1, 0.5215687, 1,
-0.1865123, -0.3784398, -4.737592, 0, 1, 0.5254902, 1,
-0.184999, 0.8745854, 1.418494, 0, 1, 0.5333334, 1,
-0.1845044, 0.2208236, -1.294801, 0, 1, 0.5372549, 1,
-0.1812816, -0.2581154, -2.677369, 0, 1, 0.5450981, 1,
-0.1772992, 0.6979045, -0.2083006, 0, 1, 0.5490196, 1,
-0.1726364, -0.1959326, -1.596058, 0, 1, 0.5568628, 1,
-0.1702666, 1.872658, 0.7902244, 0, 1, 0.5607843, 1,
-0.1699514, 0.8443241, 0.5910974, 0, 1, 0.5686275, 1,
-0.1692505, 0.05373773, -0.4255221, 0, 1, 0.572549, 1,
-0.1566193, 0.787033, 1.322226, 0, 1, 0.5803922, 1,
-0.1537053, 0.4756968, -1.531739, 0, 1, 0.5843138, 1,
-0.1509732, 0.3900126, -0.8228219, 0, 1, 0.5921569, 1,
-0.1477614, 1.292511, 0.5790384, 0, 1, 0.5960785, 1,
-0.1457581, -1.457453, -5.393098, 0, 1, 0.6039216, 1,
-0.1455627, -1.578716, -2.125713, 0, 1, 0.6117647, 1,
-0.1453521, -0.09826598, -2.862317, 0, 1, 0.6156863, 1,
-0.1373097, -1.097866, -2.929032, 0, 1, 0.6235294, 1,
-0.1324828, 0.3425528, -0.2625428, 0, 1, 0.627451, 1,
-0.1305857, 0.8231872, -0.128261, 0, 1, 0.6352941, 1,
-0.1289695, 1.095042, 2.021328, 0, 1, 0.6392157, 1,
-0.128616, -2.026936, -2.908345, 0, 1, 0.6470588, 1,
-0.1283714, 0.7110665, 2.192623, 0, 1, 0.6509804, 1,
-0.1280262, -0.4382963, -3.380451, 0, 1, 0.6588235, 1,
-0.1273419, -1.596691, -2.491112, 0, 1, 0.6627451, 1,
-0.1253397, 0.6413505, -0.3708361, 0, 1, 0.6705883, 1,
-0.1246919, -0.9460561, -3.063193, 0, 1, 0.6745098, 1,
-0.121844, 0.894639, 1.045216, 0, 1, 0.682353, 1,
-0.115204, -0.264607, -3.590273, 0, 1, 0.6862745, 1,
-0.1082018, 2.55189, -0.5845964, 0, 1, 0.6941177, 1,
-0.1001611, -1.570689, -3.893393, 0, 1, 0.7019608, 1,
-0.09817747, 0.2685615, -1.553896, 0, 1, 0.7058824, 1,
-0.09765352, -0.03101552, -2.028341, 0, 1, 0.7137255, 1,
-0.0939865, 0.2197614, -0.5987766, 0, 1, 0.7176471, 1,
-0.09288535, -0.5240245, -2.718018, 0, 1, 0.7254902, 1,
-0.09193395, -0.06200493, -2.210949, 0, 1, 0.7294118, 1,
-0.08153728, 0.6811352, 1.27837, 0, 1, 0.7372549, 1,
-0.08061451, 0.3168225, 0.2861215, 0, 1, 0.7411765, 1,
-0.07883123, -2.998329, -2.08001, 0, 1, 0.7490196, 1,
-0.07688133, 1.886338, -1.274258, 0, 1, 0.7529412, 1,
-0.07651895, 0.03600895, -1.885916, 0, 1, 0.7607843, 1,
-0.07504301, 0.7968178, -1.063551, 0, 1, 0.7647059, 1,
-0.07381289, 0.7613031, -0.2340565, 0, 1, 0.772549, 1,
-0.07060584, -2.175978, -3.761241, 0, 1, 0.7764706, 1,
-0.07051117, -0.7399222, -3.703836, 0, 1, 0.7843137, 1,
-0.06988122, 1.236392, 0.006727454, 0, 1, 0.7882353, 1,
-0.06943341, 0.3883018, -0.1790864, 0, 1, 0.7960784, 1,
-0.0688061, 1.199115, 1.092822, 0, 1, 0.8039216, 1,
-0.0674254, -0.7422101, -3.766331, 0, 1, 0.8078431, 1,
-0.0562797, 1.100392, -1.172343, 0, 1, 0.8156863, 1,
-0.05402326, -1.097552, -2.094494, 0, 1, 0.8196079, 1,
-0.05356172, 0.06489027, 0.3998965, 0, 1, 0.827451, 1,
-0.0533486, -0.8091314, -2.617146, 0, 1, 0.8313726, 1,
-0.04956383, -0.276028, -2.418805, 0, 1, 0.8392157, 1,
-0.04866251, -0.702977, -3.962038, 0, 1, 0.8431373, 1,
-0.04856608, 0.4305746, -0.1882766, 0, 1, 0.8509804, 1,
-0.04659119, 0.01669254, -2.935016, 0, 1, 0.854902, 1,
-0.04061226, 0.912493, 0.6681561, 0, 1, 0.8627451, 1,
-0.03704835, 1.386025, -0.7416558, 0, 1, 0.8666667, 1,
-0.03579776, 0.4563792, -1.524395, 0, 1, 0.8745098, 1,
-0.02498248, 0.8183373, -1.485649, 0, 1, 0.8784314, 1,
-0.02480459, 0.9635633, -0.7099442, 0, 1, 0.8862745, 1,
-0.02400046, -0.2567948, -2.865494, 0, 1, 0.8901961, 1,
-0.01522428, -2.249979, -1.713224, 0, 1, 0.8980392, 1,
-0.009103579, 0.8370153, 0.0525337, 0, 1, 0.9058824, 1,
0.00121035, -0.07741421, 3.796058, 0, 1, 0.9098039, 1,
0.002161945, 0.2737293, -0.7828665, 0, 1, 0.9176471, 1,
0.002857102, 0.8700892, 0.2903869, 0, 1, 0.9215686, 1,
0.006404016, -2.342393, 2.493048, 0, 1, 0.9294118, 1,
0.007189388, 0.9168368, -0.08067361, 0, 1, 0.9333333, 1,
0.01116263, -0.7531508, 2.485332, 0, 1, 0.9411765, 1,
0.01175226, -0.07607818, 1.621631, 0, 1, 0.945098, 1,
0.01231144, 0.7711121, -0.3230035, 0, 1, 0.9529412, 1,
0.01536691, 0.4055134, -0.4712429, 0, 1, 0.9568627, 1,
0.0159459, 2.493842, -1.459836, 0, 1, 0.9647059, 1,
0.01661815, -1.205023, 0.6220315, 0, 1, 0.9686275, 1,
0.0236661, -1.930256, 2.898939, 0, 1, 0.9764706, 1,
0.0249906, 0.2413014, 0.7563638, 0, 1, 0.9803922, 1,
0.02572789, -1.988362, 4.462054, 0, 1, 0.9882353, 1,
0.03451524, -0.06330306, 3.456726, 0, 1, 0.9921569, 1,
0.03452917, -0.06405275, 2.672068, 0, 1, 1, 1,
0.03522062, 2.614789, 0.386966, 0, 0.9921569, 1, 1,
0.03568749, 0.03331754, 0.5616115, 0, 0.9882353, 1, 1,
0.03638845, 0.2358874, -0.2331779, 0, 0.9803922, 1, 1,
0.03793262, -1.794999, 3.771967, 0, 0.9764706, 1, 1,
0.0494523, 0.5251268, 0.3591156, 0, 0.9686275, 1, 1,
0.05061046, 0.9825759, -0.7079186, 0, 0.9647059, 1, 1,
0.05100675, 0.662468, 0.7144511, 0, 0.9568627, 1, 1,
0.05295368, 0.6895921, 1.717058, 0, 0.9529412, 1, 1,
0.05441562, -0.6182541, 3.712286, 0, 0.945098, 1, 1,
0.0551543, -2.065885, 3.784466, 0, 0.9411765, 1, 1,
0.05818674, -0.7041686, 4.841006, 0, 0.9333333, 1, 1,
0.05847476, 0.6186051, -0.1583577, 0, 0.9294118, 1, 1,
0.05905836, -1.127045, 3.074306, 0, 0.9215686, 1, 1,
0.06074563, -0.3196508, 2.641502, 0, 0.9176471, 1, 1,
0.06094772, -0.6625823, 3.840468, 0, 0.9098039, 1, 1,
0.06390189, 1.775168, 1.660691, 0, 0.9058824, 1, 1,
0.0682029, 1.678368, 0.286211, 0, 0.8980392, 1, 1,
0.07421584, -1.099148, 3.907661, 0, 0.8901961, 1, 1,
0.07512821, -1.93241, 2.591111, 0, 0.8862745, 1, 1,
0.07548276, 2.645112, 0.2223767, 0, 0.8784314, 1, 1,
0.07768869, 0.7796022, -0.3894344, 0, 0.8745098, 1, 1,
0.08045134, -0.547401, 3.764737, 0, 0.8666667, 1, 1,
0.082697, -1.213889, 0.4996538, 0, 0.8627451, 1, 1,
0.08297257, -0.3139575, 2.472501, 0, 0.854902, 1, 1,
0.0830604, 0.8750985, -0.7253144, 0, 0.8509804, 1, 1,
0.08344244, -0.2933106, 1.7472, 0, 0.8431373, 1, 1,
0.08413136, 0.2150138, 2.700374, 0, 0.8392157, 1, 1,
0.08700458, -0.4362806, 2.377141, 0, 0.8313726, 1, 1,
0.08733058, 0.3359828, 0.5382684, 0, 0.827451, 1, 1,
0.08997722, -0.7266871, 2.886688, 0, 0.8196079, 1, 1,
0.09023034, -0.1316482, 3.385698, 0, 0.8156863, 1, 1,
0.09038665, -1.194797, 1.284223, 0, 0.8078431, 1, 1,
0.0908566, -0.7693995, 2.3528, 0, 0.8039216, 1, 1,
0.1019566, -1.935184, 5.162495, 0, 0.7960784, 1, 1,
0.1071438, -1.264941, 4.87671, 0, 0.7882353, 1, 1,
0.1111739, -0.2931167, 2.27325, 0, 0.7843137, 1, 1,
0.1140585, -1.439017, 2.454309, 0, 0.7764706, 1, 1,
0.1146008, -0.1368806, 3.730139, 0, 0.772549, 1, 1,
0.1214707, -0.2777229, 2.04241, 0, 0.7647059, 1, 1,
0.1308383, -0.2873608, 3.022514, 0, 0.7607843, 1, 1,
0.1325516, -0.7116031, 2.282022, 0, 0.7529412, 1, 1,
0.1340994, -1.13031, 3.097564, 0, 0.7490196, 1, 1,
0.135723, -0.8819829, 5.268547, 0, 0.7411765, 1, 1,
0.1379811, 1.130307, -1.369919, 0, 0.7372549, 1, 1,
0.1440293, 0.2919669, 0.5282167, 0, 0.7294118, 1, 1,
0.1444405, -0.9871596, 4.000849, 0, 0.7254902, 1, 1,
0.1455235, 0.7762831, -0.3688151, 0, 0.7176471, 1, 1,
0.1498599, 1.940325, 1.383709, 0, 0.7137255, 1, 1,
0.1512211, -1.284832, 2.669672, 0, 0.7058824, 1, 1,
0.1526909, -1.457289, 0.9052602, 0, 0.6980392, 1, 1,
0.1619153, -0.7349806, 1.581139, 0, 0.6941177, 1, 1,
0.1637735, -0.5715016, 1.173715, 0, 0.6862745, 1, 1,
0.1664177, 0.4032922, -2.798041, 0, 0.682353, 1, 1,
0.1669184, 0.7738899, -0.4531884, 0, 0.6745098, 1, 1,
0.1728208, 0.4959916, 0.5793941, 0, 0.6705883, 1, 1,
0.176586, 0.1485662, 1.796176, 0, 0.6627451, 1, 1,
0.182305, 1.202862, -1.024784, 0, 0.6588235, 1, 1,
0.1896247, -0.6104898, 2.493618, 0, 0.6509804, 1, 1,
0.1904164, 0.3963377, 2.147962, 0, 0.6470588, 1, 1,
0.1958719, -1.032718, 3.97969, 0, 0.6392157, 1, 1,
0.200806, 0.7229787, 0.5737291, 0, 0.6352941, 1, 1,
0.2029027, 0.7841952, -0.5440055, 0, 0.627451, 1, 1,
0.2034777, 0.7481295, -0.6242302, 0, 0.6235294, 1, 1,
0.2063504, 1.263254, -1.178931, 0, 0.6156863, 1, 1,
0.2068899, -0.6902936, 3.297847, 0, 0.6117647, 1, 1,
0.2108553, -2.084664, 3.134742, 0, 0.6039216, 1, 1,
0.213395, -0.480646, 3.363511, 0, 0.5960785, 1, 1,
0.2136998, 0.5411813, 0.3603354, 0, 0.5921569, 1, 1,
0.2151677, -2.249302, 3.957957, 0, 0.5843138, 1, 1,
0.215794, -0.6594301, 2.640381, 0, 0.5803922, 1, 1,
0.2162076, 0.9760733, -0.7787474, 0, 0.572549, 1, 1,
0.2196201, 0.283603, 1.298712, 0, 0.5686275, 1, 1,
0.2212365, 0.4340867, 1.259165, 0, 0.5607843, 1, 1,
0.225262, -0.5848083, 3.994287, 0, 0.5568628, 1, 1,
0.2288943, -0.6788998, 3.694783, 0, 0.5490196, 1, 1,
0.2289662, -0.7404958, 3.77723, 0, 0.5450981, 1, 1,
0.2308495, 1.380806, 1.335079, 0, 0.5372549, 1, 1,
0.2311208, -1.510169, 2.629185, 0, 0.5333334, 1, 1,
0.2316588, -0.3291385, 3.527034, 0, 0.5254902, 1, 1,
0.2321084, 0.4506727, -0.3000273, 0, 0.5215687, 1, 1,
0.2325773, 1.04822, 0.0325741, 0, 0.5137255, 1, 1,
0.2333125, -1.062937, 3.890829, 0, 0.509804, 1, 1,
0.2345552, -1.103073, 3.574475, 0, 0.5019608, 1, 1,
0.2352808, 1.228629, -0.589448, 0, 0.4941176, 1, 1,
0.235281, -0.4233893, 2.133679, 0, 0.4901961, 1, 1,
0.2376596, 0.9533382, 0.1556493, 0, 0.4823529, 1, 1,
0.2394567, 1.670455, 0.6844048, 0, 0.4784314, 1, 1,
0.24847, -0.02446152, 0.8685688, 0, 0.4705882, 1, 1,
0.2490271, -0.1855183, 2.617324, 0, 0.4666667, 1, 1,
0.2505165, -0.7641452, 3.406526, 0, 0.4588235, 1, 1,
0.2520267, -0.2729674, 4.707185, 0, 0.454902, 1, 1,
0.2525246, -0.7247101, 2.018681, 0, 0.4470588, 1, 1,
0.2531012, 3.154325, 0.4036456, 0, 0.4431373, 1, 1,
0.2600994, 0.6436442, 0.1238329, 0, 0.4352941, 1, 1,
0.2604403, -1.661181, 2.923663, 0, 0.4313726, 1, 1,
0.2615208, 1.285234, 0.1441832, 0, 0.4235294, 1, 1,
0.2617473, -0.1199268, 2.582875, 0, 0.4196078, 1, 1,
0.2621996, -0.7719312, 3.596656, 0, 0.4117647, 1, 1,
0.2655747, -0.6739098, 2.964772, 0, 0.4078431, 1, 1,
0.2665468, 0.1532269, 1.691551, 0, 0.4, 1, 1,
0.2673449, 2.958224, -0.07237007, 0, 0.3921569, 1, 1,
0.2687594, -1.850828, 3.644254, 0, 0.3882353, 1, 1,
0.2699246, 1.022196, -0.7734826, 0, 0.3803922, 1, 1,
0.2709596, 1.508998, 0.3130914, 0, 0.3764706, 1, 1,
0.2752962, -2.649515, 3.420742, 0, 0.3686275, 1, 1,
0.2761044, -1.69921, 3.2298, 0, 0.3647059, 1, 1,
0.2772485, -0.1356056, 1.404364, 0, 0.3568628, 1, 1,
0.2816539, 1.310405, 0.7079359, 0, 0.3529412, 1, 1,
0.2900199, 0.219001, 2.655944, 0, 0.345098, 1, 1,
0.2951261, 1.572776, 0.8103427, 0, 0.3411765, 1, 1,
0.2953312, -0.1063544, 1.564987, 0, 0.3333333, 1, 1,
0.2960857, 0.1029079, 1.695712, 0, 0.3294118, 1, 1,
0.3044936, 1.390452, 0.7664829, 0, 0.3215686, 1, 1,
0.3046722, 1.404646, -1.150157, 0, 0.3176471, 1, 1,
0.3056826, 1.090622, 0.5583317, 0, 0.3098039, 1, 1,
0.3067857, 0.3477157, 0.9118125, 0, 0.3058824, 1, 1,
0.3105612, 1.796745, 0.3530043, 0, 0.2980392, 1, 1,
0.3109172, -0.9628115, 3.871814, 0, 0.2901961, 1, 1,
0.3130485, 0.1995654, 0.9586726, 0, 0.2862745, 1, 1,
0.3143876, -1.853245, 3.820439, 0, 0.2784314, 1, 1,
0.3166527, 3.176066, 0.08690068, 0, 0.2745098, 1, 1,
0.3192312, 0.9922366, -0.8576941, 0, 0.2666667, 1, 1,
0.3192409, 2.003091, 0.9809964, 0, 0.2627451, 1, 1,
0.3203203, 0.8273937, -1.564379, 0, 0.254902, 1, 1,
0.3249558, -0.9307399, 3.307515, 0, 0.2509804, 1, 1,
0.3314765, -1.359295, 2.041998, 0, 0.2431373, 1, 1,
0.3317945, -0.9870796, 4.213662, 0, 0.2392157, 1, 1,
0.3321317, -0.2443407, 1.932186, 0, 0.2313726, 1, 1,
0.3322102, -0.8648253, 2.541755, 0, 0.227451, 1, 1,
0.333782, 0.1085179, 1.799209, 0, 0.2196078, 1, 1,
0.3380787, -0.688153, 3.535047, 0, 0.2156863, 1, 1,
0.3405276, 0.905957, 0.9482359, 0, 0.2078431, 1, 1,
0.3429215, -0.3491029, 2.232007, 0, 0.2039216, 1, 1,
0.3464539, -0.473761, 1.256346, 0, 0.1960784, 1, 1,
0.3515842, 0.6414921, -0.6185921, 0, 0.1882353, 1, 1,
0.3530198, -0.8411716, 5.565794, 0, 0.1843137, 1, 1,
0.3533594, 1.552398, 0.06409387, 0, 0.1764706, 1, 1,
0.3534926, 0.9049158, 1.108942, 0, 0.172549, 1, 1,
0.3536836, -0.4736437, 2.175369, 0, 0.1647059, 1, 1,
0.3557321, -0.5644904, 2.78246, 0, 0.1607843, 1, 1,
0.357913, -1.3504, 1.433571, 0, 0.1529412, 1, 1,
0.3664396, -0.09135833, 1.221758, 0, 0.1490196, 1, 1,
0.371545, -1.356887, 2.39511, 0, 0.1411765, 1, 1,
0.3735286, -0.09458019, 0.9566663, 0, 0.1372549, 1, 1,
0.3760937, 0.1548987, 0.6112527, 0, 0.1294118, 1, 1,
0.3776656, 0.0403157, 1.491026, 0, 0.1254902, 1, 1,
0.3784861, 0.1250448, 0.2837045, 0, 0.1176471, 1, 1,
0.3859859, 0.3415212, 1.108072, 0, 0.1137255, 1, 1,
0.387842, 1.248415, 0.6394224, 0, 0.1058824, 1, 1,
0.3915838, 1.374655, -0.7279536, 0, 0.09803922, 1, 1,
0.3938942, 1.917364, -1.885127, 0, 0.09411765, 1, 1,
0.3943238, 1.994225, 1.320606, 0, 0.08627451, 1, 1,
0.3959383, 0.7342526, 0.5312678, 0, 0.08235294, 1, 1,
0.3975487, -1.173722, 2.865639, 0, 0.07450981, 1, 1,
0.3997896, -0.4049588, 3.584802, 0, 0.07058824, 1, 1,
0.4002361, -0.4253634, 1.475914, 0, 0.0627451, 1, 1,
0.4033262, -0.8910843, 2.775158, 0, 0.05882353, 1, 1,
0.4054716, 0.9809176, 0.3518838, 0, 0.05098039, 1, 1,
0.405982, 0.1143339, 1.153417, 0, 0.04705882, 1, 1,
0.4083732, 0.282997, 2.699706, 0, 0.03921569, 1, 1,
0.4112612, 0.5319321, 1.248258, 0, 0.03529412, 1, 1,
0.4154984, -0.7679979, 2.114987, 0, 0.02745098, 1, 1,
0.4173164, -1.643322, 2.226079, 0, 0.02352941, 1, 1,
0.4173694, -0.01706339, 1.564278, 0, 0.01568628, 1, 1,
0.4198958, -0.3773828, 4.102436, 0, 0.01176471, 1, 1,
0.4219032, 1.696754, 0.916921, 0, 0.003921569, 1, 1,
0.4229653, -0.9246061, 2.448616, 0.003921569, 0, 1, 1,
0.4322405, -2.267829, 3.109298, 0.007843138, 0, 1, 1,
0.4356979, -0.229699, 3.225455, 0.01568628, 0, 1, 1,
0.4374789, -0.2227504, 1.751807, 0.01960784, 0, 1, 1,
0.4440083, -0.3884068, 3.711495, 0.02745098, 0, 1, 1,
0.4480157, 1.318554, 0.1614632, 0.03137255, 0, 1, 1,
0.4486685, -1.827425, 1.241535, 0.03921569, 0, 1, 1,
0.4527675, -0.07536497, 3.054372, 0.04313726, 0, 1, 1,
0.4618764, 0.6171284, 1.063551, 0.05098039, 0, 1, 1,
0.4629637, -0.8446434, 2.350113, 0.05490196, 0, 1, 1,
0.4652124, -1.486445, 3.500486, 0.0627451, 0, 1, 1,
0.4674624, -1.861373, 4.537762, 0.06666667, 0, 1, 1,
0.4749718, 0.1789642, 1.010897, 0.07450981, 0, 1, 1,
0.476721, -0.7682564, 3.347501, 0.07843138, 0, 1, 1,
0.4772311, -0.3846214, 1.978753, 0.08627451, 0, 1, 1,
0.480053, -0.9607109, 2.547496, 0.09019608, 0, 1, 1,
0.4814954, 1.69307, -0.1911793, 0.09803922, 0, 1, 1,
0.4862938, 1.153273, 1.564255, 0.1058824, 0, 1, 1,
0.4865605, 0.2697075, 0.9614434, 0.1098039, 0, 1, 1,
0.487088, -0.2809991, 1.91009, 0.1176471, 0, 1, 1,
0.4901581, -0.5419633, 2.414114, 0.1215686, 0, 1, 1,
0.4925115, 0.2064092, 0.9030003, 0.1294118, 0, 1, 1,
0.4972949, -0.03252107, -0.04520144, 0.1333333, 0, 1, 1,
0.497344, 1.794554, 0.1272886, 0.1411765, 0, 1, 1,
0.5036696, -1.522671, 2.917339, 0.145098, 0, 1, 1,
0.5042382, -0.2821285, 2.952177, 0.1529412, 0, 1, 1,
0.5053259, 0.4324265, 0.7479956, 0.1568628, 0, 1, 1,
0.5086727, -0.5891488, 2.988568, 0.1647059, 0, 1, 1,
0.5092659, -0.7200763, 2.54547, 0.1686275, 0, 1, 1,
0.5107119, -0.4802939, 2.213466, 0.1764706, 0, 1, 1,
0.5122954, -0.2183368, 1.895659, 0.1803922, 0, 1, 1,
0.5128459, 1.630382, 0.3108576, 0.1882353, 0, 1, 1,
0.5142576, 0.610852, 0.6995274, 0.1921569, 0, 1, 1,
0.5146087, 0.7762831, -1.329023, 0.2, 0, 1, 1,
0.5281776, 0.501778, 1.989613, 0.2078431, 0, 1, 1,
0.529596, 1.118079, -1.705621, 0.2117647, 0, 1, 1,
0.5304194, 0.225088, 2.451293, 0.2196078, 0, 1, 1,
0.5316933, 1.171396, 0.5843382, 0.2235294, 0, 1, 1,
0.5399283, 0.3923503, 2.216375, 0.2313726, 0, 1, 1,
0.5411881, 0.2962985, 1.67719, 0.2352941, 0, 1, 1,
0.5461452, 0.7400818, 1.55197, 0.2431373, 0, 1, 1,
0.5471448, 1.221181, 0.003307634, 0.2470588, 0, 1, 1,
0.5486191, 2.1268, -1.021764, 0.254902, 0, 1, 1,
0.5527377, -0.5752177, 1.920222, 0.2588235, 0, 1, 1,
0.5548471, -0.9551805, 1.161035, 0.2666667, 0, 1, 1,
0.5555046, -2.072174, 2.959311, 0.2705882, 0, 1, 1,
0.5560527, 0.8003649, 2.827819, 0.2784314, 0, 1, 1,
0.5731386, -0.7066915, 1.981795, 0.282353, 0, 1, 1,
0.5781325, -0.4602561, 3.147749, 0.2901961, 0, 1, 1,
0.5784606, 0.6369452, 1.048233, 0.2941177, 0, 1, 1,
0.5804564, -0.1608512, 1.24141, 0.3019608, 0, 1, 1,
0.5805679, -0.6395928, 1.201557, 0.3098039, 0, 1, 1,
0.5874682, -0.5740683, 1.263543, 0.3137255, 0, 1, 1,
0.5878286, -0.5623599, 1.634487, 0.3215686, 0, 1, 1,
0.5945922, 0.2377835, 3.302203, 0.3254902, 0, 1, 1,
0.5953064, 1.092323, 0.6467388, 0.3333333, 0, 1, 1,
0.5986772, 0.4581272, 1.70152, 0.3372549, 0, 1, 1,
0.6001193, 0.46289, 1.727164, 0.345098, 0, 1, 1,
0.6075172, 0.1683835, -0.08210135, 0.3490196, 0, 1, 1,
0.6127377, -1.070242, 2.064461, 0.3568628, 0, 1, 1,
0.6129001, -0.4107897, 0.6396597, 0.3607843, 0, 1, 1,
0.6129904, -0.9034027, 2.082118, 0.3686275, 0, 1, 1,
0.6153067, -0.6186098, 2.196247, 0.372549, 0, 1, 1,
0.6161915, 0.1169596, 1.570898, 0.3803922, 0, 1, 1,
0.617527, 1.254097, -0.1855098, 0.3843137, 0, 1, 1,
0.6205109, -0.9658511, 1.523832, 0.3921569, 0, 1, 1,
0.6220692, 1.48214, 1.353562, 0.3960784, 0, 1, 1,
0.6245976, 0.7972203, 1.657871, 0.4039216, 0, 1, 1,
0.6270581, -1.576862, 3.802891, 0.4117647, 0, 1, 1,
0.6360117, 1.992024, 0.3527716, 0.4156863, 0, 1, 1,
0.6362544, -0.2201551, 2.991417, 0.4235294, 0, 1, 1,
0.6452477, 0.1508387, 1.572471, 0.427451, 0, 1, 1,
0.6495861, 0.3397353, 0.1759549, 0.4352941, 0, 1, 1,
0.6533554, -0.3946063, 2.812392, 0.4392157, 0, 1, 1,
0.6564466, 0.9648221, 0.3345332, 0.4470588, 0, 1, 1,
0.6565962, 0.9960703, 0.4117843, 0.4509804, 0, 1, 1,
0.6587214, 0.2978738, 0.1958917, 0.4588235, 0, 1, 1,
0.6599908, -1.316276, 1.36472, 0.4627451, 0, 1, 1,
0.6600339, 0.7494501, 0.4633003, 0.4705882, 0, 1, 1,
0.6617443, -1.913507, 2.773891, 0.4745098, 0, 1, 1,
0.6663697, -2.951522, -0.02138477, 0.4823529, 0, 1, 1,
0.6690182, -0.06930573, -0.1623228, 0.4862745, 0, 1, 1,
0.6739487, -1.213026, 1.159667, 0.4941176, 0, 1, 1,
0.6780805, -0.8924887, 3.409457, 0.5019608, 0, 1, 1,
0.6869558, 0.4657384, 1.011461, 0.5058824, 0, 1, 1,
0.6906998, 0.3082289, 0.5343199, 0.5137255, 0, 1, 1,
0.6945831, -1.460352, 3.10789, 0.5176471, 0, 1, 1,
0.7032939, 0.7835264, -0.6630354, 0.5254902, 0, 1, 1,
0.7034959, 1.055794, 1.813947, 0.5294118, 0, 1, 1,
0.7040682, -0.2780865, 2.584513, 0.5372549, 0, 1, 1,
0.7109808, 0.9311908, 0.1132908, 0.5411765, 0, 1, 1,
0.7136482, 1.660135, 0.8547186, 0.5490196, 0, 1, 1,
0.7137216, -0.550817, 0.8109142, 0.5529412, 0, 1, 1,
0.7141036, -0.5163095, 0.8813583, 0.5607843, 0, 1, 1,
0.7167941, 2.70843, 2.234717, 0.5647059, 0, 1, 1,
0.7208019, 0.9061421, 0.1258514, 0.572549, 0, 1, 1,
0.7243425, -0.96655, 0.09853851, 0.5764706, 0, 1, 1,
0.724404, -0.8893608, 1.357273, 0.5843138, 0, 1, 1,
0.7259482, -0.7217744, 1.061719, 0.5882353, 0, 1, 1,
0.7268429, 1.32779, 0.6087274, 0.5960785, 0, 1, 1,
0.7279203, 0.2695277, 0.07171041, 0.6039216, 0, 1, 1,
0.7284777, -0.07955934, 0.6832751, 0.6078432, 0, 1, 1,
0.7290812, -0.1558164, 0.9393885, 0.6156863, 0, 1, 1,
0.7320535, 1.08596, 1.442686, 0.6196079, 0, 1, 1,
0.7327283, 0.2926557, 1.635911, 0.627451, 0, 1, 1,
0.7344658, 1.783709, 1.175434, 0.6313726, 0, 1, 1,
0.7393982, -1.360096, 3.083084, 0.6392157, 0, 1, 1,
0.7579963, -1.800651, 2.50492, 0.6431373, 0, 1, 1,
0.7607027, -0.7424838, 2.118492, 0.6509804, 0, 1, 1,
0.7649069, -1.641289, 0.7879389, 0.654902, 0, 1, 1,
0.7765422, 1.237524, 2.470989, 0.6627451, 0, 1, 1,
0.7813867, -0.7292266, 3.906636, 0.6666667, 0, 1, 1,
0.7830774, 1.599096, -1.0889, 0.6745098, 0, 1, 1,
0.7842374, 0.5061154, 1.146569, 0.6784314, 0, 1, 1,
0.7848553, 0.2682083, 1.640585, 0.6862745, 0, 1, 1,
0.7850971, -0.5282506, 1.734976, 0.6901961, 0, 1, 1,
0.7877734, 0.5715083, 0.03669114, 0.6980392, 0, 1, 1,
0.7879875, 1.837142, 0.4859452, 0.7058824, 0, 1, 1,
0.7890249, 0.2025268, 2.055878, 0.7098039, 0, 1, 1,
0.7906349, -0.4421342, 2.525234, 0.7176471, 0, 1, 1,
0.7945524, -0.04404825, 2.444775, 0.7215686, 0, 1, 1,
0.8050641, -0.8888846, 2.561616, 0.7294118, 0, 1, 1,
0.8059916, 0.2532785, 0.927282, 0.7333333, 0, 1, 1,
0.8070258, -0.09137412, 0.7200192, 0.7411765, 0, 1, 1,
0.8124518, -0.4694205, 2.820105, 0.7450981, 0, 1, 1,
0.8235843, -0.1802022, 1.578718, 0.7529412, 0, 1, 1,
0.8252787, 0.3618809, -0.7810777, 0.7568628, 0, 1, 1,
0.8260126, -1.25132, 2.470578, 0.7647059, 0, 1, 1,
0.8266229, -0.8390762, 2.345218, 0.7686275, 0, 1, 1,
0.8287054, 1.511521, -0.3146486, 0.7764706, 0, 1, 1,
0.8307843, -0.4003518, 2.266411, 0.7803922, 0, 1, 1,
0.8320335, -1.05506, 1.053473, 0.7882353, 0, 1, 1,
0.8346659, 0.8214877, 1.314571, 0.7921569, 0, 1, 1,
0.8354374, -0.2737943, 1.608688, 0.8, 0, 1, 1,
0.836226, -0.6262543, 3.609099, 0.8078431, 0, 1, 1,
0.8398232, 0.2979901, 1.675927, 0.8117647, 0, 1, 1,
0.8419307, 0.782677, 1.123239, 0.8196079, 0, 1, 1,
0.8427318, -1.296843, 1.862159, 0.8235294, 0, 1, 1,
0.8430381, -1.336086, 2.805845, 0.8313726, 0, 1, 1,
0.8451771, -1.448596, 1.888499, 0.8352941, 0, 1, 1,
0.8464484, -0.659134, 3.199229, 0.8431373, 0, 1, 1,
0.8467718, -0.778247, 0.2700873, 0.8470588, 0, 1, 1,
0.8514435, -0.1106476, 1.988374, 0.854902, 0, 1, 1,
0.8519983, 0.07464305, 1.312399, 0.8588235, 0, 1, 1,
0.8595037, 1.411408, 0.4793362, 0.8666667, 0, 1, 1,
0.8604029, -0.03231812, 2.466041, 0.8705882, 0, 1, 1,
0.8617726, 0.7084367, 1.717492, 0.8784314, 0, 1, 1,
0.8648688, 0.7158563, 1.239514, 0.8823529, 0, 1, 1,
0.8711514, 0.8945473, 1.770407, 0.8901961, 0, 1, 1,
0.8758655, 0.9779675, 0.906419, 0.8941177, 0, 1, 1,
0.8793683, 3.84721, -0.1206274, 0.9019608, 0, 1, 1,
0.8955371, 1.032608, 1.434699, 0.9098039, 0, 1, 1,
0.89726, 1.738353, 0.9349797, 0.9137255, 0, 1, 1,
0.90319, -0.2204237, 1.806645, 0.9215686, 0, 1, 1,
0.9115797, 0.1562388, 2.002256, 0.9254902, 0, 1, 1,
0.9166418, 0.2652546, 2.359114, 0.9333333, 0, 1, 1,
0.9243003, -0.9980204, 2.440083, 0.9372549, 0, 1, 1,
0.9301735, 1.081461, 1.791052, 0.945098, 0, 1, 1,
0.9353183, -0.7426646, 0.3155293, 0.9490196, 0, 1, 1,
0.9423398, -0.006658935, 2.675329, 0.9568627, 0, 1, 1,
0.9507979, -0.8431031, 1.609469, 0.9607843, 0, 1, 1,
0.9531974, -0.3918603, 2.016637, 0.9686275, 0, 1, 1,
0.9551083, -0.2731908, 2.800595, 0.972549, 0, 1, 1,
0.9607415, 0.1457569, 1.504946, 0.9803922, 0, 1, 1,
0.9644939, -0.1072112, 2.536757, 0.9843137, 0, 1, 1,
0.9871453, 1.780508, 0.2536713, 0.9921569, 0, 1, 1,
0.9884619, 0.4370632, 3.370673, 0.9960784, 0, 1, 1,
0.9980556, 0.3138049, 1.71692, 1, 0, 0.9960784, 1,
1.003371, -0.9167925, 2.208569, 1, 0, 0.9882353, 1,
1.015674, 0.4031023, 0.4349011, 1, 0, 0.9843137, 1,
1.018717, 0.8940672, -1.230353, 1, 0, 0.9764706, 1,
1.024415, -0.1496463, 3.270327, 1, 0, 0.972549, 1,
1.025697, -0.1793943, 1.543319, 1, 0, 0.9647059, 1,
1.029537, 1.11847, 2.279291, 1, 0, 0.9607843, 1,
1.032732, 0.6362785, 0.1261585, 1, 0, 0.9529412, 1,
1.035371, -0.06060629, 2.0092, 1, 0, 0.9490196, 1,
1.038341, -0.3687499, 1.877492, 1, 0, 0.9411765, 1,
1.040305, 0.9226426, -0.5331923, 1, 0, 0.9372549, 1,
1.042168, 0.760059, -0.2236577, 1, 0, 0.9294118, 1,
1.060738, -0.1034408, 1.147527, 1, 0, 0.9254902, 1,
1.060957, 1.133679, 0.6164976, 1, 0, 0.9176471, 1,
1.065297, -1.290512, 3.1173, 1, 0, 0.9137255, 1,
1.066054, -0.1701291, 1.228106, 1, 0, 0.9058824, 1,
1.070315, -1.379623, 2.512756, 1, 0, 0.9019608, 1,
1.076469, 0.1242332, 0.5590852, 1, 0, 0.8941177, 1,
1.076841, 0.05629743, 2.632652, 1, 0, 0.8862745, 1,
1.079021, 0.7691913, 1.558659, 1, 0, 0.8823529, 1,
1.081708, 1.224707, -0.456337, 1, 0, 0.8745098, 1,
1.086151, -1.105666, 1.281134, 1, 0, 0.8705882, 1,
1.089852, 1.370501, 0.8862044, 1, 0, 0.8627451, 1,
1.092046, -0.6599232, 1.777776, 1, 0, 0.8588235, 1,
1.093072, 0.5802196, 1.501679, 1, 0, 0.8509804, 1,
1.094913, 0.5403126, 2.956893, 1, 0, 0.8470588, 1,
1.099712, -0.5707531, 3.313507, 1, 0, 0.8392157, 1,
1.112254, 0.2088855, -0.5009902, 1, 0, 0.8352941, 1,
1.114886, 1.251458, 0.6546104, 1, 0, 0.827451, 1,
1.132092, 0.1500343, 2.242962, 1, 0, 0.8235294, 1,
1.138006, 0.7864403, 0.1875473, 1, 0, 0.8156863, 1,
1.140551, -0.1795622, 2.733688, 1, 0, 0.8117647, 1,
1.141279, 1.327774, 0.5496291, 1, 0, 0.8039216, 1,
1.141687, 0.8412116, 1.908494, 1, 0, 0.7960784, 1,
1.152655, 0.6233109, 0.2280516, 1, 0, 0.7921569, 1,
1.152895, -0.7289493, 3.638622, 1, 0, 0.7843137, 1,
1.159153, -0.053494, 1.082873, 1, 0, 0.7803922, 1,
1.15929, 1.364978, 0.3123093, 1, 0, 0.772549, 1,
1.160901, -0.5251676, 2.467233, 1, 0, 0.7686275, 1,
1.163619, 1.135863, 1.820649, 1, 0, 0.7607843, 1,
1.200974, 1.162699, 1.50328, 1, 0, 0.7568628, 1,
1.202555, -1.28883, 2.069298, 1, 0, 0.7490196, 1,
1.203757, 1.627501, 2.265478, 1, 0, 0.7450981, 1,
1.204816, 0.7676613, -0.8116376, 1, 0, 0.7372549, 1,
1.211798, -1.052635, 2.298342, 1, 0, 0.7333333, 1,
1.214579, 0.06893413, 0.5618746, 1, 0, 0.7254902, 1,
1.214986, 0.6117452, 0.6647668, 1, 0, 0.7215686, 1,
1.222222, 0.3348379, 0.2511315, 1, 0, 0.7137255, 1,
1.230607, 0.5338811, 1.457044, 1, 0, 0.7098039, 1,
1.231793, 1.187611, 1.361775, 1, 0, 0.7019608, 1,
1.235988, -0.08389442, 2.317899, 1, 0, 0.6941177, 1,
1.236957, 1.494584, -0.06149636, 1, 0, 0.6901961, 1,
1.248267, -0.6804814, 2.955869, 1, 0, 0.682353, 1,
1.249062, 0.08732608, 0.6569473, 1, 0, 0.6784314, 1,
1.250433, -0.2884472, 0.4994449, 1, 0, 0.6705883, 1,
1.251885, 0.6459711, 0.2156916, 1, 0, 0.6666667, 1,
1.252437, 0.371901, 3.008415, 1, 0, 0.6588235, 1,
1.25291, 1.080105, 0.207675, 1, 0, 0.654902, 1,
1.262591, 1.12927, 1.890146, 1, 0, 0.6470588, 1,
1.267648, 0.4594494, 0.2764787, 1, 0, 0.6431373, 1,
1.273576, -0.9751257, 1.824355, 1, 0, 0.6352941, 1,
1.283478, -0.2765658, 1.331971, 1, 0, 0.6313726, 1,
1.287722, -0.09430209, 3.607784, 1, 0, 0.6235294, 1,
1.29894, -0.6022972, 1.891955, 1, 0, 0.6196079, 1,
1.30513, 2.456159, 1.44965, 1, 0, 0.6117647, 1,
1.318288, -0.05034212, 1.837857, 1, 0, 0.6078432, 1,
1.33578, -0.2400222, 3.195308, 1, 0, 0.6, 1,
1.336621, 0.4121272, 2.133928, 1, 0, 0.5921569, 1,
1.34059, 1.076982, -0.6320917, 1, 0, 0.5882353, 1,
1.345646, 0.135615, 2.36436, 1, 0, 0.5803922, 1,
1.347311, -1.106352, 1.276269, 1, 0, 0.5764706, 1,
1.347886, 0.986708, 0.4151218, 1, 0, 0.5686275, 1,
1.347909, -0.7311879, 3.970455, 1, 0, 0.5647059, 1,
1.358286, -1.259583, 1.228084, 1, 0, 0.5568628, 1,
1.358528, 0.784403, 1.915152, 1, 0, 0.5529412, 1,
1.361427, 1.273377, -0.977277, 1, 0, 0.5450981, 1,
1.361961, -0.4804089, 2.613782, 1, 0, 0.5411765, 1,
1.367025, -1.19376, 1.389631, 1, 0, 0.5333334, 1,
1.367651, -0.8604507, -1.437155, 1, 0, 0.5294118, 1,
1.370616, 0.1214128, 0.4063843, 1, 0, 0.5215687, 1,
1.373649, -0.05457486, 1.339033, 1, 0, 0.5176471, 1,
1.376346, -0.4031038, 1.623595, 1, 0, 0.509804, 1,
1.3786, 0.6527247, 0.6878514, 1, 0, 0.5058824, 1,
1.380025, 1.052074, 0.3054527, 1, 0, 0.4980392, 1,
1.382254, -0.4353038, 1.147472, 1, 0, 0.4901961, 1,
1.384173, -1.713812, 2.208289, 1, 0, 0.4862745, 1,
1.385073, -1.176662, 2.741366, 1, 0, 0.4784314, 1,
1.393057, 0.8625679, 0.1942788, 1, 0, 0.4745098, 1,
1.396157, 0.5408514, -0.2858764, 1, 0, 0.4666667, 1,
1.397414, -0.09380842, 2.991437, 1, 0, 0.4627451, 1,
1.417411, 0.3165877, 1.944264, 1, 0, 0.454902, 1,
1.422931, -1.45036, 2.150767, 1, 0, 0.4509804, 1,
1.425303, 0.7208819, -0.6044471, 1, 0, 0.4431373, 1,
1.438475, -1.104784, 0.7572187, 1, 0, 0.4392157, 1,
1.460006, 1.241155, 2.386966, 1, 0, 0.4313726, 1,
1.463677, 0.1664359, 1.865132, 1, 0, 0.427451, 1,
1.464505, -1.48428, 2.904476, 1, 0, 0.4196078, 1,
1.467257, -1.685005, 2.365387, 1, 0, 0.4156863, 1,
1.467344, -0.7007485, -0.01034473, 1, 0, 0.4078431, 1,
1.467742, -0.5635784, 1.054163, 1, 0, 0.4039216, 1,
1.470197, -0.808601, 1.881905, 1, 0, 0.3960784, 1,
1.471089, 0.4229, 0.7030647, 1, 0, 0.3882353, 1,
1.474749, 0.8665283, 1.216628, 1, 0, 0.3843137, 1,
1.477738, 0.2729726, 1.735593, 1, 0, 0.3764706, 1,
1.480274, 0.89816, 1.360108, 1, 0, 0.372549, 1,
1.482702, -0.1471582, 1.548308, 1, 0, 0.3647059, 1,
1.487015, 1.053181, 1.600035, 1, 0, 0.3607843, 1,
1.50176, -0.1478384, 2.217598, 1, 0, 0.3529412, 1,
1.509053, -0.848339, 3.277693, 1, 0, 0.3490196, 1,
1.509459, -0.2997167, -0.1124896, 1, 0, 0.3411765, 1,
1.51226, -2.436896, 2.256594, 1, 0, 0.3372549, 1,
1.533191, 0.4413761, 0.9588969, 1, 0, 0.3294118, 1,
1.537014, -0.7599589, 1.410071, 1, 0, 0.3254902, 1,
1.543492, -0.530398, 1.542038, 1, 0, 0.3176471, 1,
1.54775, -1.3853, 2.966282, 1, 0, 0.3137255, 1,
1.549057, 0.1633053, 1.338923, 1, 0, 0.3058824, 1,
1.552073, -1.507959, 2.967597, 1, 0, 0.2980392, 1,
1.561152, -0.1768336, 1.811078, 1, 0, 0.2941177, 1,
1.56699, -0.4704183, 0.9511635, 1, 0, 0.2862745, 1,
1.594226, -0.932888, 3.826815, 1, 0, 0.282353, 1,
1.604427, -1.363727, 0.467783, 1, 0, 0.2745098, 1,
1.605807, 0.2779643, 1.856227, 1, 0, 0.2705882, 1,
1.613346, 0.08580799, 2.132699, 1, 0, 0.2627451, 1,
1.618127, -0.7339181, 2.72836, 1, 0, 0.2588235, 1,
1.629426, -1.064615, 1.866228, 1, 0, 0.2509804, 1,
1.634065, -0.4631648, 2.632289, 1, 0, 0.2470588, 1,
1.6395, -0.0897166, 2.366314, 1, 0, 0.2392157, 1,
1.651555, -0.2329133, 1.367606, 1, 0, 0.2352941, 1,
1.663409, -0.180031, 0.9713221, 1, 0, 0.227451, 1,
1.677084, 0.98397, 0.8135364, 1, 0, 0.2235294, 1,
1.683717, 2.612653, 1.476133, 1, 0, 0.2156863, 1,
1.697116, -1.606829, 0.4931123, 1, 0, 0.2117647, 1,
1.701961, 1.4226, 1.098881, 1, 0, 0.2039216, 1,
1.712025, -0.2122418, 2.57993, 1, 0, 0.1960784, 1,
1.72044, 0.05996346, 0.01717218, 1, 0, 0.1921569, 1,
1.722047, -0.7661241, -0.813134, 1, 0, 0.1843137, 1,
1.724699, 1.7872, 1.450774, 1, 0, 0.1803922, 1,
1.731692, 0.08701315, 0.6188622, 1, 0, 0.172549, 1,
1.736971, 0.5388928, 1.194399, 1, 0, 0.1686275, 1,
1.751396, 0.7814887, -0.9230683, 1, 0, 0.1607843, 1,
1.756806, 0.05862714, 1.323461, 1, 0, 0.1568628, 1,
1.761533, 1.000959, -0.114516, 1, 0, 0.1490196, 1,
1.809555, -0.432583, 2.297863, 1, 0, 0.145098, 1,
1.810202, 1.480058, -0.3063785, 1, 0, 0.1372549, 1,
1.827796, -1.058755, 3.596402, 1, 0, 0.1333333, 1,
1.828016, -0.008641453, 0.5618557, 1, 0, 0.1254902, 1,
1.829359, -1.110789, 1.801851, 1, 0, 0.1215686, 1,
1.839068, 1.597966, 1.900571, 1, 0, 0.1137255, 1,
1.841217, -0.8448029, 2.617595, 1, 0, 0.1098039, 1,
1.874472, 0.8430061, 1.312153, 1, 0, 0.1019608, 1,
1.886776, 0.2513594, 0.6359814, 1, 0, 0.09411765, 1,
2.010755, 2.192592, 0.336846, 1, 0, 0.09019608, 1,
2.024845, -0.09633686, 2.086632, 1, 0, 0.08235294, 1,
2.091665, -1.242777, 1.028368, 1, 0, 0.07843138, 1,
2.115989, -0.04956241, 0.9135637, 1, 0, 0.07058824, 1,
2.171088, -0.7226253, 3.207584, 1, 0, 0.06666667, 1,
2.188382, 0.5373065, 1.458802, 1, 0, 0.05882353, 1,
2.210122, 0.02279538, 0.9027404, 1, 0, 0.05490196, 1,
2.299577, 0.4065972, 0.2805828, 1, 0, 0.04705882, 1,
2.429732, -0.2010014, 2.860678, 1, 0, 0.04313726, 1,
2.468305, -1.383095, 2.10841, 1, 0, 0.03529412, 1,
2.530408, 0.3207193, 0.7376639, 1, 0, 0.03137255, 1,
2.595933, -1.420949, -0.2938971, 1, 0, 0.02352941, 1,
2.771128, -0.3828964, 2.487309, 1, 0, 0.01960784, 1,
2.991485, -0.6048938, 1.570673, 1, 0, 0.01176471, 1,
3.370017, 1.643596, 2.482333, 1, 0, 0.007843138, 1
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
-0.1174314, -4.420334, -7.25063, 0, -0.5, 0.5, 0.5,
-0.1174314, -4.420334, -7.25063, 1, -0.5, 0.5, 0.5,
-0.1174314, -4.420334, -7.25063, 1, 1.5, 0.5, 0.5,
-0.1174314, -4.420334, -7.25063, 0, 1.5, 0.5, 0.5
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
-4.787125, 0.3125613, -7.25063, 0, -0.5, 0.5, 0.5,
-4.787125, 0.3125613, -7.25063, 1, -0.5, 0.5, 0.5,
-4.787125, 0.3125613, -7.25063, 1, 1.5, 0.5, 0.5,
-4.787125, 0.3125613, -7.25063, 0, 1.5, 0.5, 0.5
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
-4.787125, -4.420334, 0.08634782, 0, -0.5, 0.5, 0.5,
-4.787125, -4.420334, 0.08634782, 1, -0.5, 0.5, 0.5,
-4.787125, -4.420334, 0.08634782, 1, 1.5, 0.5, 0.5,
-4.787125, -4.420334, 0.08634782, 0, 1.5, 0.5, 0.5
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
-3, -3.328127, -5.557481,
3, -3.328127, -5.557481,
-3, -3.328127, -5.557481,
-3, -3.510162, -5.839673,
-2, -3.328127, -5.557481,
-2, -3.510162, -5.839673,
-1, -3.328127, -5.557481,
-1, -3.510162, -5.839673,
0, -3.328127, -5.557481,
0, -3.510162, -5.839673,
1, -3.328127, -5.557481,
1, -3.510162, -5.839673,
2, -3.328127, -5.557481,
2, -3.510162, -5.839673,
3, -3.328127, -5.557481,
3, -3.510162, -5.839673
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
-3, -3.874231, -6.404056, 0, -0.5, 0.5, 0.5,
-3, -3.874231, -6.404056, 1, -0.5, 0.5, 0.5,
-3, -3.874231, -6.404056, 1, 1.5, 0.5, 0.5,
-3, -3.874231, -6.404056, 0, 1.5, 0.5, 0.5,
-2, -3.874231, -6.404056, 0, -0.5, 0.5, 0.5,
-2, -3.874231, -6.404056, 1, -0.5, 0.5, 0.5,
-2, -3.874231, -6.404056, 1, 1.5, 0.5, 0.5,
-2, -3.874231, -6.404056, 0, 1.5, 0.5, 0.5,
-1, -3.874231, -6.404056, 0, -0.5, 0.5, 0.5,
-1, -3.874231, -6.404056, 1, -0.5, 0.5, 0.5,
-1, -3.874231, -6.404056, 1, 1.5, 0.5, 0.5,
-1, -3.874231, -6.404056, 0, 1.5, 0.5, 0.5,
0, -3.874231, -6.404056, 0, -0.5, 0.5, 0.5,
0, -3.874231, -6.404056, 1, -0.5, 0.5, 0.5,
0, -3.874231, -6.404056, 1, 1.5, 0.5, 0.5,
0, -3.874231, -6.404056, 0, 1.5, 0.5, 0.5,
1, -3.874231, -6.404056, 0, -0.5, 0.5, 0.5,
1, -3.874231, -6.404056, 1, -0.5, 0.5, 0.5,
1, -3.874231, -6.404056, 1, 1.5, 0.5, 0.5,
1, -3.874231, -6.404056, 0, 1.5, 0.5, 0.5,
2, -3.874231, -6.404056, 0, -0.5, 0.5, 0.5,
2, -3.874231, -6.404056, 1, -0.5, 0.5, 0.5,
2, -3.874231, -6.404056, 1, 1.5, 0.5, 0.5,
2, -3.874231, -6.404056, 0, 1.5, 0.5, 0.5,
3, -3.874231, -6.404056, 0, -0.5, 0.5, 0.5,
3, -3.874231, -6.404056, 1, -0.5, 0.5, 0.5,
3, -3.874231, -6.404056, 1, 1.5, 0.5, 0.5,
3, -3.874231, -6.404056, 0, 1.5, 0.5, 0.5
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
-3.709503, -2, -5.557481,
-3.709503, 2, -5.557481,
-3.709503, -2, -5.557481,
-3.889107, -2, -5.839673,
-3.709503, 0, -5.557481,
-3.889107, 0, -5.839673,
-3.709503, 2, -5.557481,
-3.889107, 2, -5.839673
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
"0",
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
-4.248314, -2, -6.404056, 0, -0.5, 0.5, 0.5,
-4.248314, -2, -6.404056, 1, -0.5, 0.5, 0.5,
-4.248314, -2, -6.404056, 1, 1.5, 0.5, 0.5,
-4.248314, -2, -6.404056, 0, 1.5, 0.5, 0.5,
-4.248314, 0, -6.404056, 0, -0.5, 0.5, 0.5,
-4.248314, 0, -6.404056, 1, -0.5, 0.5, 0.5,
-4.248314, 0, -6.404056, 1, 1.5, 0.5, 0.5,
-4.248314, 0, -6.404056, 0, 1.5, 0.5, 0.5,
-4.248314, 2, -6.404056, 0, -0.5, 0.5, 0.5,
-4.248314, 2, -6.404056, 1, -0.5, 0.5, 0.5,
-4.248314, 2, -6.404056, 1, 1.5, 0.5, 0.5,
-4.248314, 2, -6.404056, 0, 1.5, 0.5, 0.5
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
-3.709503, -3.328127, -4,
-3.709503, -3.328127, 4,
-3.709503, -3.328127, -4,
-3.889107, -3.510162, -4,
-3.709503, -3.328127, -2,
-3.889107, -3.510162, -2,
-3.709503, -3.328127, 0,
-3.889107, -3.510162, 0,
-3.709503, -3.328127, 2,
-3.889107, -3.510162, 2,
-3.709503, -3.328127, 4,
-3.889107, -3.510162, 4
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
-4.248314, -3.874231, -4, 0, -0.5, 0.5, 0.5,
-4.248314, -3.874231, -4, 1, -0.5, 0.5, 0.5,
-4.248314, -3.874231, -4, 1, 1.5, 0.5, 0.5,
-4.248314, -3.874231, -4, 0, 1.5, 0.5, 0.5,
-4.248314, -3.874231, -2, 0, -0.5, 0.5, 0.5,
-4.248314, -3.874231, -2, 1, -0.5, 0.5, 0.5,
-4.248314, -3.874231, -2, 1, 1.5, 0.5, 0.5,
-4.248314, -3.874231, -2, 0, 1.5, 0.5, 0.5,
-4.248314, -3.874231, 0, 0, -0.5, 0.5, 0.5,
-4.248314, -3.874231, 0, 1, -0.5, 0.5, 0.5,
-4.248314, -3.874231, 0, 1, 1.5, 0.5, 0.5,
-4.248314, -3.874231, 0, 0, 1.5, 0.5, 0.5,
-4.248314, -3.874231, 2, 0, -0.5, 0.5, 0.5,
-4.248314, -3.874231, 2, 1, -0.5, 0.5, 0.5,
-4.248314, -3.874231, 2, 1, 1.5, 0.5, 0.5,
-4.248314, -3.874231, 2, 0, 1.5, 0.5, 0.5,
-4.248314, -3.874231, 4, 0, -0.5, 0.5, 0.5,
-4.248314, -3.874231, 4, 1, -0.5, 0.5, 0.5,
-4.248314, -3.874231, 4, 1, 1.5, 0.5, 0.5,
-4.248314, -3.874231, 4, 0, 1.5, 0.5, 0.5
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
-3.709503, -3.328127, -5.557481,
-3.709503, 3.95325, -5.557481,
-3.709503, -3.328127, 5.730177,
-3.709503, 3.95325, 5.730177,
-3.709503, -3.328127, -5.557481,
-3.709503, -3.328127, 5.730177,
-3.709503, 3.95325, -5.557481,
-3.709503, 3.95325, 5.730177,
-3.709503, -3.328127, -5.557481,
3.47464, -3.328127, -5.557481,
-3.709503, -3.328127, 5.730177,
3.47464, -3.328127, 5.730177,
-3.709503, 3.95325, -5.557481,
3.47464, 3.95325, -5.557481,
-3.709503, 3.95325, 5.730177,
3.47464, 3.95325, 5.730177,
3.47464, -3.328127, -5.557481,
3.47464, 3.95325, -5.557481,
3.47464, -3.328127, 5.730177,
3.47464, 3.95325, 5.730177,
3.47464, -3.328127, -5.557481,
3.47464, -3.328127, 5.730177,
3.47464, 3.95325, -5.557481,
3.47464, 3.95325, 5.730177
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
var radius = 8.134079;
var distance = 36.18943;
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
mvMatrix.translate( 0.1174314, -0.3125613, -0.08634782 );
mvMatrix.scale( 1.224186, 1.207838, 0.7791453 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.18943);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
fenamidone<-read.table("fenamidone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenamidone$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenamidone' not found
```

```r
y<-fenamidone$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenamidone' not found
```

```r
z<-fenamidone$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenamidone' not found
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
-3.60488, -1.479815, -2.493758, 0, 0, 1, 1, 1,
-2.877846, 0.1399985, -0.1206667, 1, 0, 0, 1, 1,
-2.733287, -0.1369087, -1.430385, 1, 0, 0, 1, 1,
-2.504788, -0.7157774, -1.035542, 1, 0, 0, 1, 1,
-2.481262, 0.7338076, -2.420641, 1, 0, 0, 1, 1,
-2.474066, 0.1339246, -3.2261, 1, 0, 0, 1, 1,
-2.309883, -1.395108, -1.65201, 0, 0, 0, 1, 1,
-2.290062, 0.5307465, -1.669219, 0, 0, 0, 1, 1,
-2.235126, -0.7168541, -3.147429, 0, 0, 0, 1, 1,
-2.203759, 0.3382551, -0.7408502, 0, 0, 0, 1, 1,
-2.203309, 0.7264575, -2.81236, 0, 0, 0, 1, 1,
-2.195542, 2.045951, -0.8441753, 0, 0, 0, 1, 1,
-2.191421, -1.322799, -0.3137846, 0, 0, 0, 1, 1,
-2.17598, 0.3352768, -0.1400236, 1, 1, 1, 1, 1,
-2.136417, 0.8596464, -1.098615, 1, 1, 1, 1, 1,
-2.112131, 0.9648157, 0.1293841, 1, 1, 1, 1, 1,
-2.093597, 0.5523746, -1.068418, 1, 1, 1, 1, 1,
-2.05732, -3.121543, -0.8325093, 1, 1, 1, 1, 1,
-2.043802, -1.490579, -1.744547, 1, 1, 1, 1, 1,
-2.005493, -0.2037012, -1.923401, 1, 1, 1, 1, 1,
-1.945634, 0.7156644, -0.1926413, 1, 1, 1, 1, 1,
-1.931898, -1.157211, -2.16891, 1, 1, 1, 1, 1,
-1.928608, -0.902687, -0.007114581, 1, 1, 1, 1, 1,
-1.917362, 0.08024962, -1.971385, 1, 1, 1, 1, 1,
-1.91188, -1.556277, -1.386176, 1, 1, 1, 1, 1,
-1.907789, -0.5516757, -2.173328, 1, 1, 1, 1, 1,
-1.903219, 0.5539979, -2.151258, 1, 1, 1, 1, 1,
-1.883676, 1.968405, 0.0326873, 1, 1, 1, 1, 1,
-1.873793, -0.007919701, -2.254579, 0, 0, 1, 1, 1,
-1.864453, 0.07161207, -0.3659056, 1, 0, 0, 1, 1,
-1.82068, 0.7902444, -1.869712, 1, 0, 0, 1, 1,
-1.816014, -1.76073, -2.96304, 1, 0, 0, 1, 1,
-1.779275, -0.3163773, -2.036246, 1, 0, 0, 1, 1,
-1.757705, -1.557289, -1.385993, 1, 0, 0, 1, 1,
-1.748062, 1.473761, 0.03753577, 0, 0, 0, 1, 1,
-1.716847, 0.02989776, -0.8073697, 0, 0, 0, 1, 1,
-1.707829, -0.4548372, -3.812696, 0, 0, 0, 1, 1,
-1.699891, -0.7591364, -1.566354, 0, 0, 0, 1, 1,
-1.680725, 0.4136457, -0.6145126, 0, 0, 0, 1, 1,
-1.676835, -2.424535, -2.794598, 0, 0, 0, 1, 1,
-1.67249, -0.8514664, -0.7490236, 0, 0, 0, 1, 1,
-1.661541, -0.3983255, -0.02973291, 1, 1, 1, 1, 1,
-1.644446, -0.3946685, -3.796556, 1, 1, 1, 1, 1,
-1.644424, 0.7566658, -2.334879, 1, 1, 1, 1, 1,
-1.640322, -1.42207, -0.9749746, 1, 1, 1, 1, 1,
-1.639335, -0.3910826, -0.7015332, 1, 1, 1, 1, 1,
-1.635262, -0.7620561, -2.705492, 1, 1, 1, 1, 1,
-1.624857, 0.5340071, -0.004946374, 1, 1, 1, 1, 1,
-1.623837, -1.067219, -3.021837, 1, 1, 1, 1, 1,
-1.623659, 0.02004808, -1.213579, 1, 1, 1, 1, 1,
-1.613812, -3.072935, -3.28632, 1, 1, 1, 1, 1,
-1.611689, 1.332167, 0.1313608, 1, 1, 1, 1, 1,
-1.591175, 0.2421181, -0.5962396, 1, 1, 1, 1, 1,
-1.569115, -0.4958443, -2.246609, 1, 1, 1, 1, 1,
-1.560093, -1.071939, -3.240776, 1, 1, 1, 1, 1,
-1.556967, -0.167899, 0.1168491, 1, 1, 1, 1, 1,
-1.542469, -0.6103187, -1.131348, 0, 0, 1, 1, 1,
-1.526953, 1.018708, -1.699768, 1, 0, 0, 1, 1,
-1.505868, 0.4030539, -1.615513, 1, 0, 0, 1, 1,
-1.503002, -0.05464117, -1.027661, 1, 0, 0, 1, 1,
-1.502515, -0.6049765, -2.142091, 1, 0, 0, 1, 1,
-1.500617, 0.2856849, -2.904039, 1, 0, 0, 1, 1,
-1.48032, -0.09807582, -0.8001412, 0, 0, 0, 1, 1,
-1.473728, 1.709219, -1.294565, 0, 0, 0, 1, 1,
-1.470507, -0.539933, -2.968055, 0, 0, 0, 1, 1,
-1.458478, -0.7100994, -1.42291, 0, 0, 0, 1, 1,
-1.454602, 0.820266, -1.658418, 0, 0, 0, 1, 1,
-1.448836, -0.2392371, -3.360633, 0, 0, 0, 1, 1,
-1.446122, -2.071386, -2.246213, 0, 0, 0, 1, 1,
-1.444796, -0.7433796, -1.772046, 1, 1, 1, 1, 1,
-1.441399, -0.3676361, -2.082118, 1, 1, 1, 1, 1,
-1.43271, 0.6626471, -2.451523, 1, 1, 1, 1, 1,
-1.429637, -0.4857437, -0.6561328, 1, 1, 1, 1, 1,
-1.406812, 1.313578, -1.888474, 1, 1, 1, 1, 1,
-1.394884, -0.4164718, -0.3732006, 1, 1, 1, 1, 1,
-1.391619, -1.444888, -1.915874, 1, 1, 1, 1, 1,
-1.378505, 1.026567, -1.488691, 1, 1, 1, 1, 1,
-1.377803, -0.1971551, -1.259443, 1, 1, 1, 1, 1,
-1.376652, 0.754366, -1.298096, 1, 1, 1, 1, 1,
-1.37368, -0.4230182, -2.229484, 1, 1, 1, 1, 1,
-1.369718, -0.1859387, -2.220382, 1, 1, 1, 1, 1,
-1.367438, -1.526578, -3.048829, 1, 1, 1, 1, 1,
-1.363539, 0.2210819, 0.5894563, 1, 1, 1, 1, 1,
-1.348094, 0.4706932, -2.4235, 1, 1, 1, 1, 1,
-1.342511, -0.03000736, -2.29793, 0, 0, 1, 1, 1,
-1.340128, -2.599638, -1.705131, 1, 0, 0, 1, 1,
-1.334168, -1.745231, -3.672756, 1, 0, 0, 1, 1,
-1.328389, -1.207568, -3.432013, 1, 0, 0, 1, 1,
-1.324141, 0.8461261, -1.258467, 1, 0, 0, 1, 1,
-1.314219, -0.4906274, -3.012587, 1, 0, 0, 1, 1,
-1.307532, 1.438921, -1.369581, 0, 0, 0, 1, 1,
-1.290581, 1.592262, -0.5908633, 0, 0, 0, 1, 1,
-1.288077, -1.295887, -1.467106, 0, 0, 0, 1, 1,
-1.28675, -0.3044159, -1.248007, 0, 0, 0, 1, 1,
-1.279714, -1.21911, -3.650279, 0, 0, 0, 1, 1,
-1.278251, -0.04990454, -3.859207, 0, 0, 0, 1, 1,
-1.274384, -0.1336174, -2.570589, 0, 0, 0, 1, 1,
-1.260431, 2.249688, -1.657784, 1, 1, 1, 1, 1,
-1.242872, 0.7574236, -1.144314, 1, 1, 1, 1, 1,
-1.24287, 0.8150417, -1.321218, 1, 1, 1, 1, 1,
-1.242414, 0.3692977, -2.388267, 1, 1, 1, 1, 1,
-1.235778, -1.376881, -2.161526, 1, 1, 1, 1, 1,
-1.234755, 0.1831681, -0.6794928, 1, 1, 1, 1, 1,
-1.222648, -0.09298786, -1.73422, 1, 1, 1, 1, 1,
-1.217376, -0.1715677, -1.674609, 1, 1, 1, 1, 1,
-1.211846, -0.8392687, -1.753401, 1, 1, 1, 1, 1,
-1.204972, 0.2557865, -1.231961, 1, 1, 1, 1, 1,
-1.198469, 0.8944663, -0.3180755, 1, 1, 1, 1, 1,
-1.193692, 0.3600136, -0.767916, 1, 1, 1, 1, 1,
-1.18457, -0.8271863, -2.310009, 1, 1, 1, 1, 1,
-1.173273, -0.7382253, -2.681455, 1, 1, 1, 1, 1,
-1.169307, -0.6056675, -3.174272, 1, 1, 1, 1, 1,
-1.169134, -0.8260559, -2.176072, 0, 0, 1, 1, 1,
-1.164439, 0.1186095, -0.1308443, 1, 0, 0, 1, 1,
-1.155373, -0.7516283, -2.559856, 1, 0, 0, 1, 1,
-1.154526, 0.1817241, -2.676418, 1, 0, 0, 1, 1,
-1.146468, 0.3029311, -1.323525, 1, 0, 0, 1, 1,
-1.146142, 0.3227181, -0.1789437, 1, 0, 0, 1, 1,
-1.140515, 0.3851123, -0.9784943, 0, 0, 0, 1, 1,
-1.133641, -0.9939685, -1.143927, 0, 0, 0, 1, 1,
-1.126245, 0.9472997, -1.764818, 0, 0, 0, 1, 1,
-1.125373, -2.901168, -0.9456508, 0, 0, 0, 1, 1,
-1.124131, 1.813445, 1.325594, 0, 0, 0, 1, 1,
-1.104582, -0.2292056, -3.158815, 0, 0, 0, 1, 1,
-1.103636, -0.6467375, -1.800872, 0, 0, 0, 1, 1,
-1.098134, -0.7587213, -2.698213, 1, 1, 1, 1, 1,
-1.081711, -0.01092978, -1.547796, 1, 1, 1, 1, 1,
-1.081532, -0.4610639, -2.747926, 1, 1, 1, 1, 1,
-1.080727, 0.2914406, -1.293808, 1, 1, 1, 1, 1,
-1.074558, -0.3103192, -2.170688, 1, 1, 1, 1, 1,
-1.065379, 0.09996781, -2.288221, 1, 1, 1, 1, 1,
-1.058441, 0.3353504, -2.776757, 1, 1, 1, 1, 1,
-1.046351, 0.4286405, -0.6099209, 1, 1, 1, 1, 1,
-1.038445, 2.298104, -0.377833, 1, 1, 1, 1, 1,
-1.036764, 1.901504, -2.340166, 1, 1, 1, 1, 1,
-1.033931, -1.682051, -3.279776, 1, 1, 1, 1, 1,
-1.027864, -1.822242, -4.049878, 1, 1, 1, 1, 1,
-1.026518, 1.008062, -1.216346, 1, 1, 1, 1, 1,
-1.026184, -0.8971837, -1.245398, 1, 1, 1, 1, 1,
-1.023103, 0.7839151, -2.878218, 1, 1, 1, 1, 1,
-1.022347, -0.1929736, 0.1493957, 0, 0, 1, 1, 1,
-1.019252, 0.3593183, -1.143846, 1, 0, 0, 1, 1,
-1.018658, -1.03141, -2.833134, 1, 0, 0, 1, 1,
-1.0139, 0.6796578, -1.441761, 1, 0, 0, 1, 1,
-1.009097, 1.069355, -0.5583729, 1, 0, 0, 1, 1,
-1.00826, -0.1637259, -2.52279, 1, 0, 0, 1, 1,
-1.001416, -0.1368645, -2.048615, 0, 0, 0, 1, 1,
-0.9931436, 0.6180456, -3.328984, 0, 0, 0, 1, 1,
-0.9846452, 1.370988, 0.01712468, 0, 0, 0, 1, 1,
-0.9808118, 0.9641089, 1.658495, 0, 0, 0, 1, 1,
-0.9733105, 0.03363959, -1.994715, 0, 0, 0, 1, 1,
-0.9709408, -1.810943, -2.172992, 0, 0, 0, 1, 1,
-0.9678937, 0.4750792, 1.714739, 0, 0, 0, 1, 1,
-0.9617962, 0.6331508, -0.3431452, 1, 1, 1, 1, 1,
-0.9600356, 0.7132452, -0.9613426, 1, 1, 1, 1, 1,
-0.9525365, 0.8750144, -0.7081239, 1, 1, 1, 1, 1,
-0.9514922, 0.1567182, -2.716359, 1, 1, 1, 1, 1,
-0.942171, 0.3249716, -2.146291, 1, 1, 1, 1, 1,
-0.9385207, -1.941316, -1.991016, 1, 1, 1, 1, 1,
-0.9375935, -0.6208268, -1.438981, 1, 1, 1, 1, 1,
-0.9367753, 1.154387, -1.414962, 1, 1, 1, 1, 1,
-0.9335322, -1.174813, -2.467144, 1, 1, 1, 1, 1,
-0.9310412, -0.2369427, -2.742425, 1, 1, 1, 1, 1,
-0.93005, 0.544618, -1.1926, 1, 1, 1, 1, 1,
-0.9264769, 0.9147921, 0.5832257, 1, 1, 1, 1, 1,
-0.9243911, -0.7801611, -1.547487, 1, 1, 1, 1, 1,
-0.9233319, 0.801892, -2.037046, 1, 1, 1, 1, 1,
-0.9207771, 1.789217, 0.1910377, 1, 1, 1, 1, 1,
-0.9178975, 1.231808, -1.758556, 0, 0, 1, 1, 1,
-0.9165592, -1.887799, -2.581815, 1, 0, 0, 1, 1,
-0.9153953, -1.000191, -1.122514, 1, 0, 0, 1, 1,
-0.9073641, 1.805395, -1.00433, 1, 0, 0, 1, 1,
-0.9036691, 0.2343672, -0.9845843, 1, 0, 0, 1, 1,
-0.8996685, -0.01575506, -0.808539, 1, 0, 0, 1, 1,
-0.8975867, -1.355224, -3.351041, 0, 0, 0, 1, 1,
-0.8969309, -1.4336, -4.213943, 0, 0, 0, 1, 1,
-0.8959091, -0.6330899, -1.858206, 0, 0, 0, 1, 1,
-0.8955486, -0.6564853, -2.118649, 0, 0, 0, 1, 1,
-0.8924929, -0.0302498, -1.210242, 0, 0, 0, 1, 1,
-0.891403, 0.552783, 0.3191194, 0, 0, 0, 1, 1,
-0.8862052, -0.1605324, -0.8436596, 0, 0, 0, 1, 1,
-0.8853386, 0.3443757, -2.191513, 1, 1, 1, 1, 1,
-0.8808649, 1.35609, -1.61074, 1, 1, 1, 1, 1,
-0.8732585, 0.4175105, -0.08634912, 1, 1, 1, 1, 1,
-0.8684217, 1.273092, 0.02928907, 1, 1, 1, 1, 1,
-0.8624517, -0.5536235, -2.78272, 1, 1, 1, 1, 1,
-0.8605772, 1.009783, -1.269916, 1, 1, 1, 1, 1,
-0.8560603, -0.8879671, -1.386573, 1, 1, 1, 1, 1,
-0.8531052, -0.466367, -0.79775, 1, 1, 1, 1, 1,
-0.8438131, -1.363279, -2.861926, 1, 1, 1, 1, 1,
-0.83902, 2.222049, -0.257257, 1, 1, 1, 1, 1,
-0.8379789, -2.287944, -3.614755, 1, 1, 1, 1, 1,
-0.836102, 1.37608, 0.6439921, 1, 1, 1, 1, 1,
-0.825797, -0.9899296, -2.593963, 1, 1, 1, 1, 1,
-0.8256725, -0.9642582, -3.392166, 1, 1, 1, 1, 1,
-0.8134931, -0.7042055, -1.246712, 1, 1, 1, 1, 1,
-0.8129543, 0.5265182, -0.7024251, 0, 0, 1, 1, 1,
-0.8098643, 0.8945129, 0.2425342, 1, 0, 0, 1, 1,
-0.8059205, 0.3485626, -0.886694, 1, 0, 0, 1, 1,
-0.8027418, -0.2249619, -0.4536763, 1, 0, 0, 1, 1,
-0.7997186, -0.03729518, -1.549974, 1, 0, 0, 1, 1,
-0.7933437, 0.3020078, -0.1465723, 1, 0, 0, 1, 1,
-0.7874482, 0.8274897, -2.879877, 0, 0, 0, 1, 1,
-0.7750139, -1.179221, -3.512274, 0, 0, 0, 1, 1,
-0.77372, -0.9651477, -0.9720165, 0, 0, 0, 1, 1,
-0.772689, -1.519046, -2.684684, 0, 0, 0, 1, 1,
-0.7680707, 0.4463772, -2.465817, 0, 0, 0, 1, 1,
-0.766286, 1.132322, -1.495793, 0, 0, 0, 1, 1,
-0.7626915, -0.3144659, -2.488888, 0, 0, 0, 1, 1,
-0.7590201, -0.3473566, -0.2341381, 1, 1, 1, 1, 1,
-0.7582765, -0.5527217, -3.385308, 1, 1, 1, 1, 1,
-0.7565461, -0.6015741, -0.671051, 1, 1, 1, 1, 1,
-0.7552919, -1.317921, -1.712785, 1, 1, 1, 1, 1,
-0.7452335, 0.4825464, -0.992888, 1, 1, 1, 1, 1,
-0.7442998, -0.9795617, -2.030682, 1, 1, 1, 1, 1,
-0.7378559, 0.2732184, -1.010874, 1, 1, 1, 1, 1,
-0.7378041, 0.6726513, -0.2709863, 1, 1, 1, 1, 1,
-0.7359476, -1.066378, -2.860561, 1, 1, 1, 1, 1,
-0.7348041, -0.2907561, -2.341792, 1, 1, 1, 1, 1,
-0.7316525, -1.221109, -3.270046, 1, 1, 1, 1, 1,
-0.728236, -0.08643324, -3.177957, 1, 1, 1, 1, 1,
-0.7174321, -0.7181163, -1.107229, 1, 1, 1, 1, 1,
-0.7144627, 0.2962635, 1.165711, 1, 1, 1, 1, 1,
-0.7121194, 0.2297003, -1.432836, 1, 1, 1, 1, 1,
-0.709779, -0.9683891, -2.794472, 0, 0, 1, 1, 1,
-0.7088389, 2.06482, 0.8690718, 1, 0, 0, 1, 1,
-0.6986133, -0.4672531, -2.61151, 1, 0, 0, 1, 1,
-0.6985589, 0.6265723, -4.287393, 1, 0, 0, 1, 1,
-0.6975519, -1.726003, -1.849306, 1, 0, 0, 1, 1,
-0.691679, -1.840582, -2.795268, 1, 0, 0, 1, 1,
-0.6908368, 2.046049, -0.811, 0, 0, 0, 1, 1,
-0.6877151, -0.9000577, -2.758992, 0, 0, 0, 1, 1,
-0.6856077, 0.008372415, -0.9539383, 0, 0, 0, 1, 1,
-0.6818371, -0.09295061, -0.7954133, 0, 0, 0, 1, 1,
-0.6798074, -0.6350549, -2.792841, 0, 0, 0, 1, 1,
-0.677977, -0.2511221, -1.139056, 0, 0, 0, 1, 1,
-0.6726998, -0.007717227, -1.474314, 0, 0, 0, 1, 1,
-0.6618746, -0.09989878, -0.7232385, 1, 1, 1, 1, 1,
-0.6603037, 0.3677454, 2.488808, 1, 1, 1, 1, 1,
-0.6583405, -0.18064, -0.5548229, 1, 1, 1, 1, 1,
-0.6571319, 0.1479294, -0.2452386, 1, 1, 1, 1, 1,
-0.6560767, -0.6556262, -2.247179, 1, 1, 1, 1, 1,
-0.6531249, -1.2748, -2.843994, 1, 1, 1, 1, 1,
-0.6524618, -0.6788272, -3.356236, 1, 1, 1, 1, 1,
-0.6517349, 1.13256, 0.1068645, 1, 1, 1, 1, 1,
-0.6500683, 1.26752, -2.319733, 1, 1, 1, 1, 1,
-0.6478009, 0.5194509, -1.154641, 1, 1, 1, 1, 1,
-0.6457928, -0.7074664, -3.309348, 1, 1, 1, 1, 1,
-0.644184, -0.677547, -3.104558, 1, 1, 1, 1, 1,
-0.6439264, 1.858667, -0.767234, 1, 1, 1, 1, 1,
-0.6428995, 0.6307427, -1.411587, 1, 1, 1, 1, 1,
-0.6400481, 0.1067601, -2.935451, 1, 1, 1, 1, 1,
-0.6396312, 0.8090914, 0.4863794, 0, 0, 1, 1, 1,
-0.6379341, 0.5498034, -0.7580649, 1, 0, 0, 1, 1,
-0.6352111, 0.4831113, -2.260573, 1, 0, 0, 1, 1,
-0.6299276, -0.3301801, -0.4379977, 1, 0, 0, 1, 1,
-0.6261653, 0.009977965, -2.764094, 1, 0, 0, 1, 1,
-0.6247389, 0.4652919, -1.805956, 1, 0, 0, 1, 1,
-0.6223382, 0.8992223, -1.444401, 0, 0, 0, 1, 1,
-0.6209672, -0.7569747, -2.618659, 0, 0, 0, 1, 1,
-0.6208999, -0.06030909, -2.467969, 0, 0, 0, 1, 1,
-0.6164852, 0.3598072, -1.202885, 0, 0, 0, 1, 1,
-0.6155841, -1.07727, -1.639633, 0, 0, 0, 1, 1,
-0.6128625, 0.1172455, -3.304183, 0, 0, 0, 1, 1,
-0.6126726, -1.491473, -1.648484, 0, 0, 0, 1, 1,
-0.6095256, -0.3422928, -1.999189, 1, 1, 1, 1, 1,
-0.6079188, -2.956473, -1.387028, 1, 1, 1, 1, 1,
-0.6038441, -0.7139977, -2.069224, 1, 1, 1, 1, 1,
-0.5983728, 0.280927, -0.05191392, 1, 1, 1, 1, 1,
-0.5982696, 1.877337, -1.494337, 1, 1, 1, 1, 1,
-0.5965585, -1.758069, -3.186907, 1, 1, 1, 1, 1,
-0.5945176, -0.2511078, -2.001745, 1, 1, 1, 1, 1,
-0.5919631, -1.819542, -2.977374, 1, 1, 1, 1, 1,
-0.5901844, -1.35205, -4.305153, 1, 1, 1, 1, 1,
-0.5900548, 0.6216379, -0.335235, 1, 1, 1, 1, 1,
-0.5883437, -0.1508767, -2.518183, 1, 1, 1, 1, 1,
-0.5878217, 0.4141063, -2.885275, 1, 1, 1, 1, 1,
-0.5870345, -2.066716, -2.638165, 1, 1, 1, 1, 1,
-0.5850772, -0.5604725, -2.786092, 1, 1, 1, 1, 1,
-0.5820993, 0.9953455, -1.416791, 1, 1, 1, 1, 1,
-0.5758474, 0.2535511, -2.223716, 0, 0, 1, 1, 1,
-0.5730057, -1.23692, -4.37107, 1, 0, 0, 1, 1,
-0.567171, 2.348586, -1.789429, 1, 0, 0, 1, 1,
-0.561124, -2.404114, -2.265773, 1, 0, 0, 1, 1,
-0.5598888, -1.313285, -2.144521, 1, 0, 0, 1, 1,
-0.5597693, 0.4425758, -1.281583, 1, 0, 0, 1, 1,
-0.5553229, 0.675109, -1.987974, 0, 0, 0, 1, 1,
-0.5508684, -2.576479, -2.758925, 0, 0, 0, 1, 1,
-0.5466828, -0.9581891, -2.90079, 0, 0, 0, 1, 1,
-0.545714, 1.462195, -0.4454524, 0, 0, 0, 1, 1,
-0.5430113, 0.1892225, 1.329135, 0, 0, 0, 1, 1,
-0.5425524, -0.2830687, -1.474634, 0, 0, 0, 1, 1,
-0.5415713, -1.652836, -3.628777, 0, 0, 0, 1, 1,
-0.5336676, 2.200026, 0.8791244, 1, 1, 1, 1, 1,
-0.5310502, -0.5360457, -2.678294, 1, 1, 1, 1, 1,
-0.5297535, 0.5408245, -0.09548675, 1, 1, 1, 1, 1,
-0.5284477, -0.2469386, -0.8939515, 1, 1, 1, 1, 1,
-0.5272776, -0.1365906, -0.6890187, 1, 1, 1, 1, 1,
-0.5268554, 1.498806, 0.3285166, 1, 1, 1, 1, 1,
-0.5247537, -0.5701578, -2.612506, 1, 1, 1, 1, 1,
-0.5208385, -0.5444078, -2.560397, 1, 1, 1, 1, 1,
-0.5146901, -0.573167, -3.206086, 1, 1, 1, 1, 1,
-0.5127792, 1.588065, 1.521155, 1, 1, 1, 1, 1,
-0.5096576, 0.6290429, 0.3140153, 1, 1, 1, 1, 1,
-0.5043024, -2.27021, -2.251545, 1, 1, 1, 1, 1,
-0.5009479, 0.07539297, -2.466687, 1, 1, 1, 1, 1,
-0.497097, -0.05404615, -1.436977, 1, 1, 1, 1, 1,
-0.4941995, 1.027609, -0.6557872, 1, 1, 1, 1, 1,
-0.4935511, 0.8577716, -2.410576, 0, 0, 1, 1, 1,
-0.4928886, -0.5592735, -1.917306, 1, 0, 0, 1, 1,
-0.4846932, -1.433538, -1.098803, 1, 0, 0, 1, 1,
-0.4838622, 0.2956682, -1.625457, 1, 0, 0, 1, 1,
-0.4800986, 0.7641528, -1.726956, 1, 0, 0, 1, 1,
-0.4769892, 0.08343021, -0.4469802, 1, 0, 0, 1, 1,
-0.4719035, -0.0132469, -1.598181, 0, 0, 0, 1, 1,
-0.4709742, 0.2791905, -0.843344, 0, 0, 0, 1, 1,
-0.467092, -0.449073, -1.276837, 0, 0, 0, 1, 1,
-0.4665843, -0.07536773, -1.455128, 0, 0, 0, 1, 1,
-0.4661391, -0.3772973, -2.835162, 0, 0, 0, 1, 1,
-0.4646557, -0.3970981, -2.310634, 0, 0, 0, 1, 1,
-0.4638234, 0.716647, -0.1574555, 0, 0, 0, 1, 1,
-0.4601476, -0.001760315, -0.242382, 1, 1, 1, 1, 1,
-0.4577507, 0.9382673, -0.02444504, 1, 1, 1, 1, 1,
-0.4553557, -0.1404897, -1.650033, 1, 1, 1, 1, 1,
-0.4547275, -0.8771925, -0.4408415, 1, 1, 1, 1, 1,
-0.4508608, 0.8710684, -1.764006, 1, 1, 1, 1, 1,
-0.4501702, 0.6059136, 0.252584, 1, 1, 1, 1, 1,
-0.4483164, 0.5816146, 0.4365779, 1, 1, 1, 1, 1,
-0.4419671, -1.178775, -2.177798, 1, 1, 1, 1, 1,
-0.4410141, -0.9291454, -2.039384, 1, 1, 1, 1, 1,
-0.4397112, -0.7421566, -1.926416, 1, 1, 1, 1, 1,
-0.4356643, 0.1735889, -0.7399024, 1, 1, 1, 1, 1,
-0.4352139, -1.17158, -1.354021, 1, 1, 1, 1, 1,
-0.4283969, -0.9374725, -1.589169, 1, 1, 1, 1, 1,
-0.4248395, 0.7358716, 0.1488411, 1, 1, 1, 1, 1,
-0.4240801, -0.7922969, -2.382834, 1, 1, 1, 1, 1,
-0.4230359, -1.921324, -0.5555339, 0, 0, 1, 1, 1,
-0.4166727, -2.126558, -3.960707, 1, 0, 0, 1, 1,
-0.411855, 0.7576612, -1.386695, 1, 0, 0, 1, 1,
-0.4107777, -1.212359, -0.8678804, 1, 0, 0, 1, 1,
-0.410122, 0.1077203, -1.922998, 1, 0, 0, 1, 1,
-0.4075741, 0.794506, 0.3968554, 1, 0, 0, 1, 1,
-0.4055876, -1.512585, -3.505719, 0, 0, 0, 1, 1,
-0.4003116, 1.551568, -1.219071, 0, 0, 0, 1, 1,
-0.3962177, -0.4781546, -2.510159, 0, 0, 0, 1, 1,
-0.3957736, 0.3802691, -0.0167578, 0, 0, 0, 1, 1,
-0.3843248, 0.5475647, -0.4194611, 0, 0, 0, 1, 1,
-0.3833347, -1.802418, -5.007263, 0, 0, 0, 1, 1,
-0.381318, -0.0780461, -3.322635, 0, 0, 0, 1, 1,
-0.3806082, 0.6978431, 0.1872713, 1, 1, 1, 1, 1,
-0.3801425, 0.4071316, 1.885587, 1, 1, 1, 1, 1,
-0.379127, -0.1608736, -2.819902, 1, 1, 1, 1, 1,
-0.3775655, -1.724036, -1.544319, 1, 1, 1, 1, 1,
-0.3771555, 1.094211, -0.3122344, 1, 1, 1, 1, 1,
-0.3741714, 1.405157, 0.2415141, 1, 1, 1, 1, 1,
-0.3721665, -1.850744, -3.468837, 1, 1, 1, 1, 1,
-0.3711773, 0.1211975, -1.080716, 1, 1, 1, 1, 1,
-0.3702457, 0.5374926, 0.8106879, 1, 1, 1, 1, 1,
-0.3701032, 0.3571308, -3.835786, 1, 1, 1, 1, 1,
-0.3663216, -1.068077, -1.262978, 1, 1, 1, 1, 1,
-0.3655593, 1.056395, -0.7760313, 1, 1, 1, 1, 1,
-0.3629696, 0.1768111, -0.5335348, 1, 1, 1, 1, 1,
-0.3458802, 1.744454, -1.085126, 1, 1, 1, 1, 1,
-0.3390276, -0.5455384, -1.199607, 1, 1, 1, 1, 1,
-0.3360994, 0.03875313, -1.567388, 0, 0, 1, 1, 1,
-0.3345568, -0.7734414, -4.740668, 1, 0, 0, 1, 1,
-0.3306613, -0.6985821, -1.181504, 1, 0, 0, 1, 1,
-0.3256407, 1.21207, 0.2774432, 1, 0, 0, 1, 1,
-0.3245197, 0.3434412, 0.8759966, 1, 0, 0, 1, 1,
-0.3244608, -0.27735, -2.282015, 1, 0, 0, 1, 1,
-0.3236896, 1.744261, -1.516906, 0, 0, 0, 1, 1,
-0.3232222, -0.9314758, -1.448562, 0, 0, 0, 1, 1,
-0.321009, -0.2512523, -1.779181, 0, 0, 0, 1, 1,
-0.3158307, -0.5475817, -2.606418, 0, 0, 0, 1, 1,
-0.3027103, -1.363507, -4.751979, 0, 0, 0, 1, 1,
-0.3010102, -0.5586331, -1.423653, 0, 0, 0, 1, 1,
-0.2968302, 1.466152, 0.2827586, 0, 0, 0, 1, 1,
-0.2962032, 0.616708, 0.3276242, 1, 1, 1, 1, 1,
-0.2915201, -1.250963, -1.688313, 1, 1, 1, 1, 1,
-0.2898693, -0.6768231, -2.003737, 1, 1, 1, 1, 1,
-0.2872578, 0.112768, -3.070769, 1, 1, 1, 1, 1,
-0.2851198, -3.222088, -3.188471, 1, 1, 1, 1, 1,
-0.2829151, 0.7789539, 0.1727229, 1, 1, 1, 1, 1,
-0.2791143, 0.6178526, 0.804269, 1, 1, 1, 1, 1,
-0.2776997, -1.633886, -4.050874, 1, 1, 1, 1, 1,
-0.2773585, 1.278139, 1.613733, 1, 1, 1, 1, 1,
-0.2764823, 0.07480398, -1.623996, 1, 1, 1, 1, 1,
-0.2740275, -0.7434268, -4.20006, 1, 1, 1, 1, 1,
-0.2724098, 0.8030061, 0.3606908, 1, 1, 1, 1, 1,
-0.2683105, 0.9667543, -1.543137, 1, 1, 1, 1, 1,
-0.2619059, 0.4504909, -2.252578, 1, 1, 1, 1, 1,
-0.2597243, -2.367459, -4.926675, 1, 1, 1, 1, 1,
-0.2568565, -0.4680447, -3.644312, 0, 0, 1, 1, 1,
-0.2550479, 1.135775, -2.266187, 1, 0, 0, 1, 1,
-0.2465984, -0.9248427, -1.8125, 1, 0, 0, 1, 1,
-0.2452022, 0.4956917, 0.3970168, 1, 0, 0, 1, 1,
-0.2449876, 1.338171, -0.9859012, 1, 0, 0, 1, 1,
-0.2444392, -2.418967, -2.88816, 1, 0, 0, 1, 1,
-0.2433438, 0.5097625, 0.1199201, 0, 0, 0, 1, 1,
-0.2410188, -1.339763, -3.740216, 0, 0, 0, 1, 1,
-0.2345665, 0.3009826, -0.8432354, 0, 0, 0, 1, 1,
-0.2340276, -1.243526, -1.166492, 0, 0, 0, 1, 1,
-0.2330607, 1.682748, -0.09059004, 0, 0, 0, 1, 1,
-0.231949, 0.05563568, -0.4045528, 0, 0, 0, 1, 1,
-0.2282926, 0.07120019, -1.975578, 0, 0, 0, 1, 1,
-0.2257819, -0.7463542, -3.441387, 1, 1, 1, 1, 1,
-0.2200179, 1.540702, -0.3122732, 1, 1, 1, 1, 1,
-0.2198691, 1.910329, 0.03316731, 1, 1, 1, 1, 1,
-0.2178866, -1.398304, -2.240132, 1, 1, 1, 1, 1,
-0.2170914, -0.4060172, -1.930332, 1, 1, 1, 1, 1,
-0.2169468, -0.2179818, -3.327659, 1, 1, 1, 1, 1,
-0.2157359, -0.6501566, -3.409912, 1, 1, 1, 1, 1,
-0.2139384, -0.7351089, -3.82786, 1, 1, 1, 1, 1,
-0.2130014, 0.706461, -0.3141292, 1, 1, 1, 1, 1,
-0.2064238, 1.192628, -0.8074083, 1, 1, 1, 1, 1,
-0.2022502, -0.6310731, -3.153919, 1, 1, 1, 1, 1,
-0.2021305, 0.7348593, -0.7931882, 1, 1, 1, 1, 1,
-0.2020429, -1.058379, -0.4364243, 1, 1, 1, 1, 1,
-0.1979484, 0.8390903, 0.2882601, 1, 1, 1, 1, 1,
-0.1972168, 1.341942, 1.265411, 1, 1, 1, 1, 1,
-0.1954672, 0.7058231, 0.8499824, 0, 0, 1, 1, 1,
-0.1865123, -0.3784398, -4.737592, 1, 0, 0, 1, 1,
-0.184999, 0.8745854, 1.418494, 1, 0, 0, 1, 1,
-0.1845044, 0.2208236, -1.294801, 1, 0, 0, 1, 1,
-0.1812816, -0.2581154, -2.677369, 1, 0, 0, 1, 1,
-0.1772992, 0.6979045, -0.2083006, 1, 0, 0, 1, 1,
-0.1726364, -0.1959326, -1.596058, 0, 0, 0, 1, 1,
-0.1702666, 1.872658, 0.7902244, 0, 0, 0, 1, 1,
-0.1699514, 0.8443241, 0.5910974, 0, 0, 0, 1, 1,
-0.1692505, 0.05373773, -0.4255221, 0, 0, 0, 1, 1,
-0.1566193, 0.787033, 1.322226, 0, 0, 0, 1, 1,
-0.1537053, 0.4756968, -1.531739, 0, 0, 0, 1, 1,
-0.1509732, 0.3900126, -0.8228219, 0, 0, 0, 1, 1,
-0.1477614, 1.292511, 0.5790384, 1, 1, 1, 1, 1,
-0.1457581, -1.457453, -5.393098, 1, 1, 1, 1, 1,
-0.1455627, -1.578716, -2.125713, 1, 1, 1, 1, 1,
-0.1453521, -0.09826598, -2.862317, 1, 1, 1, 1, 1,
-0.1373097, -1.097866, -2.929032, 1, 1, 1, 1, 1,
-0.1324828, 0.3425528, -0.2625428, 1, 1, 1, 1, 1,
-0.1305857, 0.8231872, -0.128261, 1, 1, 1, 1, 1,
-0.1289695, 1.095042, 2.021328, 1, 1, 1, 1, 1,
-0.128616, -2.026936, -2.908345, 1, 1, 1, 1, 1,
-0.1283714, 0.7110665, 2.192623, 1, 1, 1, 1, 1,
-0.1280262, -0.4382963, -3.380451, 1, 1, 1, 1, 1,
-0.1273419, -1.596691, -2.491112, 1, 1, 1, 1, 1,
-0.1253397, 0.6413505, -0.3708361, 1, 1, 1, 1, 1,
-0.1246919, -0.9460561, -3.063193, 1, 1, 1, 1, 1,
-0.121844, 0.894639, 1.045216, 1, 1, 1, 1, 1,
-0.115204, -0.264607, -3.590273, 0, 0, 1, 1, 1,
-0.1082018, 2.55189, -0.5845964, 1, 0, 0, 1, 1,
-0.1001611, -1.570689, -3.893393, 1, 0, 0, 1, 1,
-0.09817747, 0.2685615, -1.553896, 1, 0, 0, 1, 1,
-0.09765352, -0.03101552, -2.028341, 1, 0, 0, 1, 1,
-0.0939865, 0.2197614, -0.5987766, 1, 0, 0, 1, 1,
-0.09288535, -0.5240245, -2.718018, 0, 0, 0, 1, 1,
-0.09193395, -0.06200493, -2.210949, 0, 0, 0, 1, 1,
-0.08153728, 0.6811352, 1.27837, 0, 0, 0, 1, 1,
-0.08061451, 0.3168225, 0.2861215, 0, 0, 0, 1, 1,
-0.07883123, -2.998329, -2.08001, 0, 0, 0, 1, 1,
-0.07688133, 1.886338, -1.274258, 0, 0, 0, 1, 1,
-0.07651895, 0.03600895, -1.885916, 0, 0, 0, 1, 1,
-0.07504301, 0.7968178, -1.063551, 1, 1, 1, 1, 1,
-0.07381289, 0.7613031, -0.2340565, 1, 1, 1, 1, 1,
-0.07060584, -2.175978, -3.761241, 1, 1, 1, 1, 1,
-0.07051117, -0.7399222, -3.703836, 1, 1, 1, 1, 1,
-0.06988122, 1.236392, 0.006727454, 1, 1, 1, 1, 1,
-0.06943341, 0.3883018, -0.1790864, 1, 1, 1, 1, 1,
-0.0688061, 1.199115, 1.092822, 1, 1, 1, 1, 1,
-0.0674254, -0.7422101, -3.766331, 1, 1, 1, 1, 1,
-0.0562797, 1.100392, -1.172343, 1, 1, 1, 1, 1,
-0.05402326, -1.097552, -2.094494, 1, 1, 1, 1, 1,
-0.05356172, 0.06489027, 0.3998965, 1, 1, 1, 1, 1,
-0.0533486, -0.8091314, -2.617146, 1, 1, 1, 1, 1,
-0.04956383, -0.276028, -2.418805, 1, 1, 1, 1, 1,
-0.04866251, -0.702977, -3.962038, 1, 1, 1, 1, 1,
-0.04856608, 0.4305746, -0.1882766, 1, 1, 1, 1, 1,
-0.04659119, 0.01669254, -2.935016, 0, 0, 1, 1, 1,
-0.04061226, 0.912493, 0.6681561, 1, 0, 0, 1, 1,
-0.03704835, 1.386025, -0.7416558, 1, 0, 0, 1, 1,
-0.03579776, 0.4563792, -1.524395, 1, 0, 0, 1, 1,
-0.02498248, 0.8183373, -1.485649, 1, 0, 0, 1, 1,
-0.02480459, 0.9635633, -0.7099442, 1, 0, 0, 1, 1,
-0.02400046, -0.2567948, -2.865494, 0, 0, 0, 1, 1,
-0.01522428, -2.249979, -1.713224, 0, 0, 0, 1, 1,
-0.009103579, 0.8370153, 0.0525337, 0, 0, 0, 1, 1,
0.00121035, -0.07741421, 3.796058, 0, 0, 0, 1, 1,
0.002161945, 0.2737293, -0.7828665, 0, 0, 0, 1, 1,
0.002857102, 0.8700892, 0.2903869, 0, 0, 0, 1, 1,
0.006404016, -2.342393, 2.493048, 0, 0, 0, 1, 1,
0.007189388, 0.9168368, -0.08067361, 1, 1, 1, 1, 1,
0.01116263, -0.7531508, 2.485332, 1, 1, 1, 1, 1,
0.01175226, -0.07607818, 1.621631, 1, 1, 1, 1, 1,
0.01231144, 0.7711121, -0.3230035, 1, 1, 1, 1, 1,
0.01536691, 0.4055134, -0.4712429, 1, 1, 1, 1, 1,
0.0159459, 2.493842, -1.459836, 1, 1, 1, 1, 1,
0.01661815, -1.205023, 0.6220315, 1, 1, 1, 1, 1,
0.0236661, -1.930256, 2.898939, 1, 1, 1, 1, 1,
0.0249906, 0.2413014, 0.7563638, 1, 1, 1, 1, 1,
0.02572789, -1.988362, 4.462054, 1, 1, 1, 1, 1,
0.03451524, -0.06330306, 3.456726, 1, 1, 1, 1, 1,
0.03452917, -0.06405275, 2.672068, 1, 1, 1, 1, 1,
0.03522062, 2.614789, 0.386966, 1, 1, 1, 1, 1,
0.03568749, 0.03331754, 0.5616115, 1, 1, 1, 1, 1,
0.03638845, 0.2358874, -0.2331779, 1, 1, 1, 1, 1,
0.03793262, -1.794999, 3.771967, 0, 0, 1, 1, 1,
0.0494523, 0.5251268, 0.3591156, 1, 0, 0, 1, 1,
0.05061046, 0.9825759, -0.7079186, 1, 0, 0, 1, 1,
0.05100675, 0.662468, 0.7144511, 1, 0, 0, 1, 1,
0.05295368, 0.6895921, 1.717058, 1, 0, 0, 1, 1,
0.05441562, -0.6182541, 3.712286, 1, 0, 0, 1, 1,
0.0551543, -2.065885, 3.784466, 0, 0, 0, 1, 1,
0.05818674, -0.7041686, 4.841006, 0, 0, 0, 1, 1,
0.05847476, 0.6186051, -0.1583577, 0, 0, 0, 1, 1,
0.05905836, -1.127045, 3.074306, 0, 0, 0, 1, 1,
0.06074563, -0.3196508, 2.641502, 0, 0, 0, 1, 1,
0.06094772, -0.6625823, 3.840468, 0, 0, 0, 1, 1,
0.06390189, 1.775168, 1.660691, 0, 0, 0, 1, 1,
0.0682029, 1.678368, 0.286211, 1, 1, 1, 1, 1,
0.07421584, -1.099148, 3.907661, 1, 1, 1, 1, 1,
0.07512821, -1.93241, 2.591111, 1, 1, 1, 1, 1,
0.07548276, 2.645112, 0.2223767, 1, 1, 1, 1, 1,
0.07768869, 0.7796022, -0.3894344, 1, 1, 1, 1, 1,
0.08045134, -0.547401, 3.764737, 1, 1, 1, 1, 1,
0.082697, -1.213889, 0.4996538, 1, 1, 1, 1, 1,
0.08297257, -0.3139575, 2.472501, 1, 1, 1, 1, 1,
0.0830604, 0.8750985, -0.7253144, 1, 1, 1, 1, 1,
0.08344244, -0.2933106, 1.7472, 1, 1, 1, 1, 1,
0.08413136, 0.2150138, 2.700374, 1, 1, 1, 1, 1,
0.08700458, -0.4362806, 2.377141, 1, 1, 1, 1, 1,
0.08733058, 0.3359828, 0.5382684, 1, 1, 1, 1, 1,
0.08997722, -0.7266871, 2.886688, 1, 1, 1, 1, 1,
0.09023034, -0.1316482, 3.385698, 1, 1, 1, 1, 1,
0.09038665, -1.194797, 1.284223, 0, 0, 1, 1, 1,
0.0908566, -0.7693995, 2.3528, 1, 0, 0, 1, 1,
0.1019566, -1.935184, 5.162495, 1, 0, 0, 1, 1,
0.1071438, -1.264941, 4.87671, 1, 0, 0, 1, 1,
0.1111739, -0.2931167, 2.27325, 1, 0, 0, 1, 1,
0.1140585, -1.439017, 2.454309, 1, 0, 0, 1, 1,
0.1146008, -0.1368806, 3.730139, 0, 0, 0, 1, 1,
0.1214707, -0.2777229, 2.04241, 0, 0, 0, 1, 1,
0.1308383, -0.2873608, 3.022514, 0, 0, 0, 1, 1,
0.1325516, -0.7116031, 2.282022, 0, 0, 0, 1, 1,
0.1340994, -1.13031, 3.097564, 0, 0, 0, 1, 1,
0.135723, -0.8819829, 5.268547, 0, 0, 0, 1, 1,
0.1379811, 1.130307, -1.369919, 0, 0, 0, 1, 1,
0.1440293, 0.2919669, 0.5282167, 1, 1, 1, 1, 1,
0.1444405, -0.9871596, 4.000849, 1, 1, 1, 1, 1,
0.1455235, 0.7762831, -0.3688151, 1, 1, 1, 1, 1,
0.1498599, 1.940325, 1.383709, 1, 1, 1, 1, 1,
0.1512211, -1.284832, 2.669672, 1, 1, 1, 1, 1,
0.1526909, -1.457289, 0.9052602, 1, 1, 1, 1, 1,
0.1619153, -0.7349806, 1.581139, 1, 1, 1, 1, 1,
0.1637735, -0.5715016, 1.173715, 1, 1, 1, 1, 1,
0.1664177, 0.4032922, -2.798041, 1, 1, 1, 1, 1,
0.1669184, 0.7738899, -0.4531884, 1, 1, 1, 1, 1,
0.1728208, 0.4959916, 0.5793941, 1, 1, 1, 1, 1,
0.176586, 0.1485662, 1.796176, 1, 1, 1, 1, 1,
0.182305, 1.202862, -1.024784, 1, 1, 1, 1, 1,
0.1896247, -0.6104898, 2.493618, 1, 1, 1, 1, 1,
0.1904164, 0.3963377, 2.147962, 1, 1, 1, 1, 1,
0.1958719, -1.032718, 3.97969, 0, 0, 1, 1, 1,
0.200806, 0.7229787, 0.5737291, 1, 0, 0, 1, 1,
0.2029027, 0.7841952, -0.5440055, 1, 0, 0, 1, 1,
0.2034777, 0.7481295, -0.6242302, 1, 0, 0, 1, 1,
0.2063504, 1.263254, -1.178931, 1, 0, 0, 1, 1,
0.2068899, -0.6902936, 3.297847, 1, 0, 0, 1, 1,
0.2108553, -2.084664, 3.134742, 0, 0, 0, 1, 1,
0.213395, -0.480646, 3.363511, 0, 0, 0, 1, 1,
0.2136998, 0.5411813, 0.3603354, 0, 0, 0, 1, 1,
0.2151677, -2.249302, 3.957957, 0, 0, 0, 1, 1,
0.215794, -0.6594301, 2.640381, 0, 0, 0, 1, 1,
0.2162076, 0.9760733, -0.7787474, 0, 0, 0, 1, 1,
0.2196201, 0.283603, 1.298712, 0, 0, 0, 1, 1,
0.2212365, 0.4340867, 1.259165, 1, 1, 1, 1, 1,
0.225262, -0.5848083, 3.994287, 1, 1, 1, 1, 1,
0.2288943, -0.6788998, 3.694783, 1, 1, 1, 1, 1,
0.2289662, -0.7404958, 3.77723, 1, 1, 1, 1, 1,
0.2308495, 1.380806, 1.335079, 1, 1, 1, 1, 1,
0.2311208, -1.510169, 2.629185, 1, 1, 1, 1, 1,
0.2316588, -0.3291385, 3.527034, 1, 1, 1, 1, 1,
0.2321084, 0.4506727, -0.3000273, 1, 1, 1, 1, 1,
0.2325773, 1.04822, 0.0325741, 1, 1, 1, 1, 1,
0.2333125, -1.062937, 3.890829, 1, 1, 1, 1, 1,
0.2345552, -1.103073, 3.574475, 1, 1, 1, 1, 1,
0.2352808, 1.228629, -0.589448, 1, 1, 1, 1, 1,
0.235281, -0.4233893, 2.133679, 1, 1, 1, 1, 1,
0.2376596, 0.9533382, 0.1556493, 1, 1, 1, 1, 1,
0.2394567, 1.670455, 0.6844048, 1, 1, 1, 1, 1,
0.24847, -0.02446152, 0.8685688, 0, 0, 1, 1, 1,
0.2490271, -0.1855183, 2.617324, 1, 0, 0, 1, 1,
0.2505165, -0.7641452, 3.406526, 1, 0, 0, 1, 1,
0.2520267, -0.2729674, 4.707185, 1, 0, 0, 1, 1,
0.2525246, -0.7247101, 2.018681, 1, 0, 0, 1, 1,
0.2531012, 3.154325, 0.4036456, 1, 0, 0, 1, 1,
0.2600994, 0.6436442, 0.1238329, 0, 0, 0, 1, 1,
0.2604403, -1.661181, 2.923663, 0, 0, 0, 1, 1,
0.2615208, 1.285234, 0.1441832, 0, 0, 0, 1, 1,
0.2617473, -0.1199268, 2.582875, 0, 0, 0, 1, 1,
0.2621996, -0.7719312, 3.596656, 0, 0, 0, 1, 1,
0.2655747, -0.6739098, 2.964772, 0, 0, 0, 1, 1,
0.2665468, 0.1532269, 1.691551, 0, 0, 0, 1, 1,
0.2673449, 2.958224, -0.07237007, 1, 1, 1, 1, 1,
0.2687594, -1.850828, 3.644254, 1, 1, 1, 1, 1,
0.2699246, 1.022196, -0.7734826, 1, 1, 1, 1, 1,
0.2709596, 1.508998, 0.3130914, 1, 1, 1, 1, 1,
0.2752962, -2.649515, 3.420742, 1, 1, 1, 1, 1,
0.2761044, -1.69921, 3.2298, 1, 1, 1, 1, 1,
0.2772485, -0.1356056, 1.404364, 1, 1, 1, 1, 1,
0.2816539, 1.310405, 0.7079359, 1, 1, 1, 1, 1,
0.2900199, 0.219001, 2.655944, 1, 1, 1, 1, 1,
0.2951261, 1.572776, 0.8103427, 1, 1, 1, 1, 1,
0.2953312, -0.1063544, 1.564987, 1, 1, 1, 1, 1,
0.2960857, 0.1029079, 1.695712, 1, 1, 1, 1, 1,
0.3044936, 1.390452, 0.7664829, 1, 1, 1, 1, 1,
0.3046722, 1.404646, -1.150157, 1, 1, 1, 1, 1,
0.3056826, 1.090622, 0.5583317, 1, 1, 1, 1, 1,
0.3067857, 0.3477157, 0.9118125, 0, 0, 1, 1, 1,
0.3105612, 1.796745, 0.3530043, 1, 0, 0, 1, 1,
0.3109172, -0.9628115, 3.871814, 1, 0, 0, 1, 1,
0.3130485, 0.1995654, 0.9586726, 1, 0, 0, 1, 1,
0.3143876, -1.853245, 3.820439, 1, 0, 0, 1, 1,
0.3166527, 3.176066, 0.08690068, 1, 0, 0, 1, 1,
0.3192312, 0.9922366, -0.8576941, 0, 0, 0, 1, 1,
0.3192409, 2.003091, 0.9809964, 0, 0, 0, 1, 1,
0.3203203, 0.8273937, -1.564379, 0, 0, 0, 1, 1,
0.3249558, -0.9307399, 3.307515, 0, 0, 0, 1, 1,
0.3314765, -1.359295, 2.041998, 0, 0, 0, 1, 1,
0.3317945, -0.9870796, 4.213662, 0, 0, 0, 1, 1,
0.3321317, -0.2443407, 1.932186, 0, 0, 0, 1, 1,
0.3322102, -0.8648253, 2.541755, 1, 1, 1, 1, 1,
0.333782, 0.1085179, 1.799209, 1, 1, 1, 1, 1,
0.3380787, -0.688153, 3.535047, 1, 1, 1, 1, 1,
0.3405276, 0.905957, 0.9482359, 1, 1, 1, 1, 1,
0.3429215, -0.3491029, 2.232007, 1, 1, 1, 1, 1,
0.3464539, -0.473761, 1.256346, 1, 1, 1, 1, 1,
0.3515842, 0.6414921, -0.6185921, 1, 1, 1, 1, 1,
0.3530198, -0.8411716, 5.565794, 1, 1, 1, 1, 1,
0.3533594, 1.552398, 0.06409387, 1, 1, 1, 1, 1,
0.3534926, 0.9049158, 1.108942, 1, 1, 1, 1, 1,
0.3536836, -0.4736437, 2.175369, 1, 1, 1, 1, 1,
0.3557321, -0.5644904, 2.78246, 1, 1, 1, 1, 1,
0.357913, -1.3504, 1.433571, 1, 1, 1, 1, 1,
0.3664396, -0.09135833, 1.221758, 1, 1, 1, 1, 1,
0.371545, -1.356887, 2.39511, 1, 1, 1, 1, 1,
0.3735286, -0.09458019, 0.9566663, 0, 0, 1, 1, 1,
0.3760937, 0.1548987, 0.6112527, 1, 0, 0, 1, 1,
0.3776656, 0.0403157, 1.491026, 1, 0, 0, 1, 1,
0.3784861, 0.1250448, 0.2837045, 1, 0, 0, 1, 1,
0.3859859, 0.3415212, 1.108072, 1, 0, 0, 1, 1,
0.387842, 1.248415, 0.6394224, 1, 0, 0, 1, 1,
0.3915838, 1.374655, -0.7279536, 0, 0, 0, 1, 1,
0.3938942, 1.917364, -1.885127, 0, 0, 0, 1, 1,
0.3943238, 1.994225, 1.320606, 0, 0, 0, 1, 1,
0.3959383, 0.7342526, 0.5312678, 0, 0, 0, 1, 1,
0.3975487, -1.173722, 2.865639, 0, 0, 0, 1, 1,
0.3997896, -0.4049588, 3.584802, 0, 0, 0, 1, 1,
0.4002361, -0.4253634, 1.475914, 0, 0, 0, 1, 1,
0.4033262, -0.8910843, 2.775158, 1, 1, 1, 1, 1,
0.4054716, 0.9809176, 0.3518838, 1, 1, 1, 1, 1,
0.405982, 0.1143339, 1.153417, 1, 1, 1, 1, 1,
0.4083732, 0.282997, 2.699706, 1, 1, 1, 1, 1,
0.4112612, 0.5319321, 1.248258, 1, 1, 1, 1, 1,
0.4154984, -0.7679979, 2.114987, 1, 1, 1, 1, 1,
0.4173164, -1.643322, 2.226079, 1, 1, 1, 1, 1,
0.4173694, -0.01706339, 1.564278, 1, 1, 1, 1, 1,
0.4198958, -0.3773828, 4.102436, 1, 1, 1, 1, 1,
0.4219032, 1.696754, 0.916921, 1, 1, 1, 1, 1,
0.4229653, -0.9246061, 2.448616, 1, 1, 1, 1, 1,
0.4322405, -2.267829, 3.109298, 1, 1, 1, 1, 1,
0.4356979, -0.229699, 3.225455, 1, 1, 1, 1, 1,
0.4374789, -0.2227504, 1.751807, 1, 1, 1, 1, 1,
0.4440083, -0.3884068, 3.711495, 1, 1, 1, 1, 1,
0.4480157, 1.318554, 0.1614632, 0, 0, 1, 1, 1,
0.4486685, -1.827425, 1.241535, 1, 0, 0, 1, 1,
0.4527675, -0.07536497, 3.054372, 1, 0, 0, 1, 1,
0.4618764, 0.6171284, 1.063551, 1, 0, 0, 1, 1,
0.4629637, -0.8446434, 2.350113, 1, 0, 0, 1, 1,
0.4652124, -1.486445, 3.500486, 1, 0, 0, 1, 1,
0.4674624, -1.861373, 4.537762, 0, 0, 0, 1, 1,
0.4749718, 0.1789642, 1.010897, 0, 0, 0, 1, 1,
0.476721, -0.7682564, 3.347501, 0, 0, 0, 1, 1,
0.4772311, -0.3846214, 1.978753, 0, 0, 0, 1, 1,
0.480053, -0.9607109, 2.547496, 0, 0, 0, 1, 1,
0.4814954, 1.69307, -0.1911793, 0, 0, 0, 1, 1,
0.4862938, 1.153273, 1.564255, 0, 0, 0, 1, 1,
0.4865605, 0.2697075, 0.9614434, 1, 1, 1, 1, 1,
0.487088, -0.2809991, 1.91009, 1, 1, 1, 1, 1,
0.4901581, -0.5419633, 2.414114, 1, 1, 1, 1, 1,
0.4925115, 0.2064092, 0.9030003, 1, 1, 1, 1, 1,
0.4972949, -0.03252107, -0.04520144, 1, 1, 1, 1, 1,
0.497344, 1.794554, 0.1272886, 1, 1, 1, 1, 1,
0.5036696, -1.522671, 2.917339, 1, 1, 1, 1, 1,
0.5042382, -0.2821285, 2.952177, 1, 1, 1, 1, 1,
0.5053259, 0.4324265, 0.7479956, 1, 1, 1, 1, 1,
0.5086727, -0.5891488, 2.988568, 1, 1, 1, 1, 1,
0.5092659, -0.7200763, 2.54547, 1, 1, 1, 1, 1,
0.5107119, -0.4802939, 2.213466, 1, 1, 1, 1, 1,
0.5122954, -0.2183368, 1.895659, 1, 1, 1, 1, 1,
0.5128459, 1.630382, 0.3108576, 1, 1, 1, 1, 1,
0.5142576, 0.610852, 0.6995274, 1, 1, 1, 1, 1,
0.5146087, 0.7762831, -1.329023, 0, 0, 1, 1, 1,
0.5281776, 0.501778, 1.989613, 1, 0, 0, 1, 1,
0.529596, 1.118079, -1.705621, 1, 0, 0, 1, 1,
0.5304194, 0.225088, 2.451293, 1, 0, 0, 1, 1,
0.5316933, 1.171396, 0.5843382, 1, 0, 0, 1, 1,
0.5399283, 0.3923503, 2.216375, 1, 0, 0, 1, 1,
0.5411881, 0.2962985, 1.67719, 0, 0, 0, 1, 1,
0.5461452, 0.7400818, 1.55197, 0, 0, 0, 1, 1,
0.5471448, 1.221181, 0.003307634, 0, 0, 0, 1, 1,
0.5486191, 2.1268, -1.021764, 0, 0, 0, 1, 1,
0.5527377, -0.5752177, 1.920222, 0, 0, 0, 1, 1,
0.5548471, -0.9551805, 1.161035, 0, 0, 0, 1, 1,
0.5555046, -2.072174, 2.959311, 0, 0, 0, 1, 1,
0.5560527, 0.8003649, 2.827819, 1, 1, 1, 1, 1,
0.5731386, -0.7066915, 1.981795, 1, 1, 1, 1, 1,
0.5781325, -0.4602561, 3.147749, 1, 1, 1, 1, 1,
0.5784606, 0.6369452, 1.048233, 1, 1, 1, 1, 1,
0.5804564, -0.1608512, 1.24141, 1, 1, 1, 1, 1,
0.5805679, -0.6395928, 1.201557, 1, 1, 1, 1, 1,
0.5874682, -0.5740683, 1.263543, 1, 1, 1, 1, 1,
0.5878286, -0.5623599, 1.634487, 1, 1, 1, 1, 1,
0.5945922, 0.2377835, 3.302203, 1, 1, 1, 1, 1,
0.5953064, 1.092323, 0.6467388, 1, 1, 1, 1, 1,
0.5986772, 0.4581272, 1.70152, 1, 1, 1, 1, 1,
0.6001193, 0.46289, 1.727164, 1, 1, 1, 1, 1,
0.6075172, 0.1683835, -0.08210135, 1, 1, 1, 1, 1,
0.6127377, -1.070242, 2.064461, 1, 1, 1, 1, 1,
0.6129001, -0.4107897, 0.6396597, 1, 1, 1, 1, 1,
0.6129904, -0.9034027, 2.082118, 0, 0, 1, 1, 1,
0.6153067, -0.6186098, 2.196247, 1, 0, 0, 1, 1,
0.6161915, 0.1169596, 1.570898, 1, 0, 0, 1, 1,
0.617527, 1.254097, -0.1855098, 1, 0, 0, 1, 1,
0.6205109, -0.9658511, 1.523832, 1, 0, 0, 1, 1,
0.6220692, 1.48214, 1.353562, 1, 0, 0, 1, 1,
0.6245976, 0.7972203, 1.657871, 0, 0, 0, 1, 1,
0.6270581, -1.576862, 3.802891, 0, 0, 0, 1, 1,
0.6360117, 1.992024, 0.3527716, 0, 0, 0, 1, 1,
0.6362544, -0.2201551, 2.991417, 0, 0, 0, 1, 1,
0.6452477, 0.1508387, 1.572471, 0, 0, 0, 1, 1,
0.6495861, 0.3397353, 0.1759549, 0, 0, 0, 1, 1,
0.6533554, -0.3946063, 2.812392, 0, 0, 0, 1, 1,
0.6564466, 0.9648221, 0.3345332, 1, 1, 1, 1, 1,
0.6565962, 0.9960703, 0.4117843, 1, 1, 1, 1, 1,
0.6587214, 0.2978738, 0.1958917, 1, 1, 1, 1, 1,
0.6599908, -1.316276, 1.36472, 1, 1, 1, 1, 1,
0.6600339, 0.7494501, 0.4633003, 1, 1, 1, 1, 1,
0.6617443, -1.913507, 2.773891, 1, 1, 1, 1, 1,
0.6663697, -2.951522, -0.02138477, 1, 1, 1, 1, 1,
0.6690182, -0.06930573, -0.1623228, 1, 1, 1, 1, 1,
0.6739487, -1.213026, 1.159667, 1, 1, 1, 1, 1,
0.6780805, -0.8924887, 3.409457, 1, 1, 1, 1, 1,
0.6869558, 0.4657384, 1.011461, 1, 1, 1, 1, 1,
0.6906998, 0.3082289, 0.5343199, 1, 1, 1, 1, 1,
0.6945831, -1.460352, 3.10789, 1, 1, 1, 1, 1,
0.7032939, 0.7835264, -0.6630354, 1, 1, 1, 1, 1,
0.7034959, 1.055794, 1.813947, 1, 1, 1, 1, 1,
0.7040682, -0.2780865, 2.584513, 0, 0, 1, 1, 1,
0.7109808, 0.9311908, 0.1132908, 1, 0, 0, 1, 1,
0.7136482, 1.660135, 0.8547186, 1, 0, 0, 1, 1,
0.7137216, -0.550817, 0.8109142, 1, 0, 0, 1, 1,
0.7141036, -0.5163095, 0.8813583, 1, 0, 0, 1, 1,
0.7167941, 2.70843, 2.234717, 1, 0, 0, 1, 1,
0.7208019, 0.9061421, 0.1258514, 0, 0, 0, 1, 1,
0.7243425, -0.96655, 0.09853851, 0, 0, 0, 1, 1,
0.724404, -0.8893608, 1.357273, 0, 0, 0, 1, 1,
0.7259482, -0.7217744, 1.061719, 0, 0, 0, 1, 1,
0.7268429, 1.32779, 0.6087274, 0, 0, 0, 1, 1,
0.7279203, 0.2695277, 0.07171041, 0, 0, 0, 1, 1,
0.7284777, -0.07955934, 0.6832751, 0, 0, 0, 1, 1,
0.7290812, -0.1558164, 0.9393885, 1, 1, 1, 1, 1,
0.7320535, 1.08596, 1.442686, 1, 1, 1, 1, 1,
0.7327283, 0.2926557, 1.635911, 1, 1, 1, 1, 1,
0.7344658, 1.783709, 1.175434, 1, 1, 1, 1, 1,
0.7393982, -1.360096, 3.083084, 1, 1, 1, 1, 1,
0.7579963, -1.800651, 2.50492, 1, 1, 1, 1, 1,
0.7607027, -0.7424838, 2.118492, 1, 1, 1, 1, 1,
0.7649069, -1.641289, 0.7879389, 1, 1, 1, 1, 1,
0.7765422, 1.237524, 2.470989, 1, 1, 1, 1, 1,
0.7813867, -0.7292266, 3.906636, 1, 1, 1, 1, 1,
0.7830774, 1.599096, -1.0889, 1, 1, 1, 1, 1,
0.7842374, 0.5061154, 1.146569, 1, 1, 1, 1, 1,
0.7848553, 0.2682083, 1.640585, 1, 1, 1, 1, 1,
0.7850971, -0.5282506, 1.734976, 1, 1, 1, 1, 1,
0.7877734, 0.5715083, 0.03669114, 1, 1, 1, 1, 1,
0.7879875, 1.837142, 0.4859452, 0, 0, 1, 1, 1,
0.7890249, 0.2025268, 2.055878, 1, 0, 0, 1, 1,
0.7906349, -0.4421342, 2.525234, 1, 0, 0, 1, 1,
0.7945524, -0.04404825, 2.444775, 1, 0, 0, 1, 1,
0.8050641, -0.8888846, 2.561616, 1, 0, 0, 1, 1,
0.8059916, 0.2532785, 0.927282, 1, 0, 0, 1, 1,
0.8070258, -0.09137412, 0.7200192, 0, 0, 0, 1, 1,
0.8124518, -0.4694205, 2.820105, 0, 0, 0, 1, 1,
0.8235843, -0.1802022, 1.578718, 0, 0, 0, 1, 1,
0.8252787, 0.3618809, -0.7810777, 0, 0, 0, 1, 1,
0.8260126, -1.25132, 2.470578, 0, 0, 0, 1, 1,
0.8266229, -0.8390762, 2.345218, 0, 0, 0, 1, 1,
0.8287054, 1.511521, -0.3146486, 0, 0, 0, 1, 1,
0.8307843, -0.4003518, 2.266411, 1, 1, 1, 1, 1,
0.8320335, -1.05506, 1.053473, 1, 1, 1, 1, 1,
0.8346659, 0.8214877, 1.314571, 1, 1, 1, 1, 1,
0.8354374, -0.2737943, 1.608688, 1, 1, 1, 1, 1,
0.836226, -0.6262543, 3.609099, 1, 1, 1, 1, 1,
0.8398232, 0.2979901, 1.675927, 1, 1, 1, 1, 1,
0.8419307, 0.782677, 1.123239, 1, 1, 1, 1, 1,
0.8427318, -1.296843, 1.862159, 1, 1, 1, 1, 1,
0.8430381, -1.336086, 2.805845, 1, 1, 1, 1, 1,
0.8451771, -1.448596, 1.888499, 1, 1, 1, 1, 1,
0.8464484, -0.659134, 3.199229, 1, 1, 1, 1, 1,
0.8467718, -0.778247, 0.2700873, 1, 1, 1, 1, 1,
0.8514435, -0.1106476, 1.988374, 1, 1, 1, 1, 1,
0.8519983, 0.07464305, 1.312399, 1, 1, 1, 1, 1,
0.8595037, 1.411408, 0.4793362, 1, 1, 1, 1, 1,
0.8604029, -0.03231812, 2.466041, 0, 0, 1, 1, 1,
0.8617726, 0.7084367, 1.717492, 1, 0, 0, 1, 1,
0.8648688, 0.7158563, 1.239514, 1, 0, 0, 1, 1,
0.8711514, 0.8945473, 1.770407, 1, 0, 0, 1, 1,
0.8758655, 0.9779675, 0.906419, 1, 0, 0, 1, 1,
0.8793683, 3.84721, -0.1206274, 1, 0, 0, 1, 1,
0.8955371, 1.032608, 1.434699, 0, 0, 0, 1, 1,
0.89726, 1.738353, 0.9349797, 0, 0, 0, 1, 1,
0.90319, -0.2204237, 1.806645, 0, 0, 0, 1, 1,
0.9115797, 0.1562388, 2.002256, 0, 0, 0, 1, 1,
0.9166418, 0.2652546, 2.359114, 0, 0, 0, 1, 1,
0.9243003, -0.9980204, 2.440083, 0, 0, 0, 1, 1,
0.9301735, 1.081461, 1.791052, 0, 0, 0, 1, 1,
0.9353183, -0.7426646, 0.3155293, 1, 1, 1, 1, 1,
0.9423398, -0.006658935, 2.675329, 1, 1, 1, 1, 1,
0.9507979, -0.8431031, 1.609469, 1, 1, 1, 1, 1,
0.9531974, -0.3918603, 2.016637, 1, 1, 1, 1, 1,
0.9551083, -0.2731908, 2.800595, 1, 1, 1, 1, 1,
0.9607415, 0.1457569, 1.504946, 1, 1, 1, 1, 1,
0.9644939, -0.1072112, 2.536757, 1, 1, 1, 1, 1,
0.9871453, 1.780508, 0.2536713, 1, 1, 1, 1, 1,
0.9884619, 0.4370632, 3.370673, 1, 1, 1, 1, 1,
0.9980556, 0.3138049, 1.71692, 1, 1, 1, 1, 1,
1.003371, -0.9167925, 2.208569, 1, 1, 1, 1, 1,
1.015674, 0.4031023, 0.4349011, 1, 1, 1, 1, 1,
1.018717, 0.8940672, -1.230353, 1, 1, 1, 1, 1,
1.024415, -0.1496463, 3.270327, 1, 1, 1, 1, 1,
1.025697, -0.1793943, 1.543319, 1, 1, 1, 1, 1,
1.029537, 1.11847, 2.279291, 0, 0, 1, 1, 1,
1.032732, 0.6362785, 0.1261585, 1, 0, 0, 1, 1,
1.035371, -0.06060629, 2.0092, 1, 0, 0, 1, 1,
1.038341, -0.3687499, 1.877492, 1, 0, 0, 1, 1,
1.040305, 0.9226426, -0.5331923, 1, 0, 0, 1, 1,
1.042168, 0.760059, -0.2236577, 1, 0, 0, 1, 1,
1.060738, -0.1034408, 1.147527, 0, 0, 0, 1, 1,
1.060957, 1.133679, 0.6164976, 0, 0, 0, 1, 1,
1.065297, -1.290512, 3.1173, 0, 0, 0, 1, 1,
1.066054, -0.1701291, 1.228106, 0, 0, 0, 1, 1,
1.070315, -1.379623, 2.512756, 0, 0, 0, 1, 1,
1.076469, 0.1242332, 0.5590852, 0, 0, 0, 1, 1,
1.076841, 0.05629743, 2.632652, 0, 0, 0, 1, 1,
1.079021, 0.7691913, 1.558659, 1, 1, 1, 1, 1,
1.081708, 1.224707, -0.456337, 1, 1, 1, 1, 1,
1.086151, -1.105666, 1.281134, 1, 1, 1, 1, 1,
1.089852, 1.370501, 0.8862044, 1, 1, 1, 1, 1,
1.092046, -0.6599232, 1.777776, 1, 1, 1, 1, 1,
1.093072, 0.5802196, 1.501679, 1, 1, 1, 1, 1,
1.094913, 0.5403126, 2.956893, 1, 1, 1, 1, 1,
1.099712, -0.5707531, 3.313507, 1, 1, 1, 1, 1,
1.112254, 0.2088855, -0.5009902, 1, 1, 1, 1, 1,
1.114886, 1.251458, 0.6546104, 1, 1, 1, 1, 1,
1.132092, 0.1500343, 2.242962, 1, 1, 1, 1, 1,
1.138006, 0.7864403, 0.1875473, 1, 1, 1, 1, 1,
1.140551, -0.1795622, 2.733688, 1, 1, 1, 1, 1,
1.141279, 1.327774, 0.5496291, 1, 1, 1, 1, 1,
1.141687, 0.8412116, 1.908494, 1, 1, 1, 1, 1,
1.152655, 0.6233109, 0.2280516, 0, 0, 1, 1, 1,
1.152895, -0.7289493, 3.638622, 1, 0, 0, 1, 1,
1.159153, -0.053494, 1.082873, 1, 0, 0, 1, 1,
1.15929, 1.364978, 0.3123093, 1, 0, 0, 1, 1,
1.160901, -0.5251676, 2.467233, 1, 0, 0, 1, 1,
1.163619, 1.135863, 1.820649, 1, 0, 0, 1, 1,
1.200974, 1.162699, 1.50328, 0, 0, 0, 1, 1,
1.202555, -1.28883, 2.069298, 0, 0, 0, 1, 1,
1.203757, 1.627501, 2.265478, 0, 0, 0, 1, 1,
1.204816, 0.7676613, -0.8116376, 0, 0, 0, 1, 1,
1.211798, -1.052635, 2.298342, 0, 0, 0, 1, 1,
1.214579, 0.06893413, 0.5618746, 0, 0, 0, 1, 1,
1.214986, 0.6117452, 0.6647668, 0, 0, 0, 1, 1,
1.222222, 0.3348379, 0.2511315, 1, 1, 1, 1, 1,
1.230607, 0.5338811, 1.457044, 1, 1, 1, 1, 1,
1.231793, 1.187611, 1.361775, 1, 1, 1, 1, 1,
1.235988, -0.08389442, 2.317899, 1, 1, 1, 1, 1,
1.236957, 1.494584, -0.06149636, 1, 1, 1, 1, 1,
1.248267, -0.6804814, 2.955869, 1, 1, 1, 1, 1,
1.249062, 0.08732608, 0.6569473, 1, 1, 1, 1, 1,
1.250433, -0.2884472, 0.4994449, 1, 1, 1, 1, 1,
1.251885, 0.6459711, 0.2156916, 1, 1, 1, 1, 1,
1.252437, 0.371901, 3.008415, 1, 1, 1, 1, 1,
1.25291, 1.080105, 0.207675, 1, 1, 1, 1, 1,
1.262591, 1.12927, 1.890146, 1, 1, 1, 1, 1,
1.267648, 0.4594494, 0.2764787, 1, 1, 1, 1, 1,
1.273576, -0.9751257, 1.824355, 1, 1, 1, 1, 1,
1.283478, -0.2765658, 1.331971, 1, 1, 1, 1, 1,
1.287722, -0.09430209, 3.607784, 0, 0, 1, 1, 1,
1.29894, -0.6022972, 1.891955, 1, 0, 0, 1, 1,
1.30513, 2.456159, 1.44965, 1, 0, 0, 1, 1,
1.318288, -0.05034212, 1.837857, 1, 0, 0, 1, 1,
1.33578, -0.2400222, 3.195308, 1, 0, 0, 1, 1,
1.336621, 0.4121272, 2.133928, 1, 0, 0, 1, 1,
1.34059, 1.076982, -0.6320917, 0, 0, 0, 1, 1,
1.345646, 0.135615, 2.36436, 0, 0, 0, 1, 1,
1.347311, -1.106352, 1.276269, 0, 0, 0, 1, 1,
1.347886, 0.986708, 0.4151218, 0, 0, 0, 1, 1,
1.347909, -0.7311879, 3.970455, 0, 0, 0, 1, 1,
1.358286, -1.259583, 1.228084, 0, 0, 0, 1, 1,
1.358528, 0.784403, 1.915152, 0, 0, 0, 1, 1,
1.361427, 1.273377, -0.977277, 1, 1, 1, 1, 1,
1.361961, -0.4804089, 2.613782, 1, 1, 1, 1, 1,
1.367025, -1.19376, 1.389631, 1, 1, 1, 1, 1,
1.367651, -0.8604507, -1.437155, 1, 1, 1, 1, 1,
1.370616, 0.1214128, 0.4063843, 1, 1, 1, 1, 1,
1.373649, -0.05457486, 1.339033, 1, 1, 1, 1, 1,
1.376346, -0.4031038, 1.623595, 1, 1, 1, 1, 1,
1.3786, 0.6527247, 0.6878514, 1, 1, 1, 1, 1,
1.380025, 1.052074, 0.3054527, 1, 1, 1, 1, 1,
1.382254, -0.4353038, 1.147472, 1, 1, 1, 1, 1,
1.384173, -1.713812, 2.208289, 1, 1, 1, 1, 1,
1.385073, -1.176662, 2.741366, 1, 1, 1, 1, 1,
1.393057, 0.8625679, 0.1942788, 1, 1, 1, 1, 1,
1.396157, 0.5408514, -0.2858764, 1, 1, 1, 1, 1,
1.397414, -0.09380842, 2.991437, 1, 1, 1, 1, 1,
1.417411, 0.3165877, 1.944264, 0, 0, 1, 1, 1,
1.422931, -1.45036, 2.150767, 1, 0, 0, 1, 1,
1.425303, 0.7208819, -0.6044471, 1, 0, 0, 1, 1,
1.438475, -1.104784, 0.7572187, 1, 0, 0, 1, 1,
1.460006, 1.241155, 2.386966, 1, 0, 0, 1, 1,
1.463677, 0.1664359, 1.865132, 1, 0, 0, 1, 1,
1.464505, -1.48428, 2.904476, 0, 0, 0, 1, 1,
1.467257, -1.685005, 2.365387, 0, 0, 0, 1, 1,
1.467344, -0.7007485, -0.01034473, 0, 0, 0, 1, 1,
1.467742, -0.5635784, 1.054163, 0, 0, 0, 1, 1,
1.470197, -0.808601, 1.881905, 0, 0, 0, 1, 1,
1.471089, 0.4229, 0.7030647, 0, 0, 0, 1, 1,
1.474749, 0.8665283, 1.216628, 0, 0, 0, 1, 1,
1.477738, 0.2729726, 1.735593, 1, 1, 1, 1, 1,
1.480274, 0.89816, 1.360108, 1, 1, 1, 1, 1,
1.482702, -0.1471582, 1.548308, 1, 1, 1, 1, 1,
1.487015, 1.053181, 1.600035, 1, 1, 1, 1, 1,
1.50176, -0.1478384, 2.217598, 1, 1, 1, 1, 1,
1.509053, -0.848339, 3.277693, 1, 1, 1, 1, 1,
1.509459, -0.2997167, -0.1124896, 1, 1, 1, 1, 1,
1.51226, -2.436896, 2.256594, 1, 1, 1, 1, 1,
1.533191, 0.4413761, 0.9588969, 1, 1, 1, 1, 1,
1.537014, -0.7599589, 1.410071, 1, 1, 1, 1, 1,
1.543492, -0.530398, 1.542038, 1, 1, 1, 1, 1,
1.54775, -1.3853, 2.966282, 1, 1, 1, 1, 1,
1.549057, 0.1633053, 1.338923, 1, 1, 1, 1, 1,
1.552073, -1.507959, 2.967597, 1, 1, 1, 1, 1,
1.561152, -0.1768336, 1.811078, 1, 1, 1, 1, 1,
1.56699, -0.4704183, 0.9511635, 0, 0, 1, 1, 1,
1.594226, -0.932888, 3.826815, 1, 0, 0, 1, 1,
1.604427, -1.363727, 0.467783, 1, 0, 0, 1, 1,
1.605807, 0.2779643, 1.856227, 1, 0, 0, 1, 1,
1.613346, 0.08580799, 2.132699, 1, 0, 0, 1, 1,
1.618127, -0.7339181, 2.72836, 1, 0, 0, 1, 1,
1.629426, -1.064615, 1.866228, 0, 0, 0, 1, 1,
1.634065, -0.4631648, 2.632289, 0, 0, 0, 1, 1,
1.6395, -0.0897166, 2.366314, 0, 0, 0, 1, 1,
1.651555, -0.2329133, 1.367606, 0, 0, 0, 1, 1,
1.663409, -0.180031, 0.9713221, 0, 0, 0, 1, 1,
1.677084, 0.98397, 0.8135364, 0, 0, 0, 1, 1,
1.683717, 2.612653, 1.476133, 0, 0, 0, 1, 1,
1.697116, -1.606829, 0.4931123, 1, 1, 1, 1, 1,
1.701961, 1.4226, 1.098881, 1, 1, 1, 1, 1,
1.712025, -0.2122418, 2.57993, 1, 1, 1, 1, 1,
1.72044, 0.05996346, 0.01717218, 1, 1, 1, 1, 1,
1.722047, -0.7661241, -0.813134, 1, 1, 1, 1, 1,
1.724699, 1.7872, 1.450774, 1, 1, 1, 1, 1,
1.731692, 0.08701315, 0.6188622, 1, 1, 1, 1, 1,
1.736971, 0.5388928, 1.194399, 1, 1, 1, 1, 1,
1.751396, 0.7814887, -0.9230683, 1, 1, 1, 1, 1,
1.756806, 0.05862714, 1.323461, 1, 1, 1, 1, 1,
1.761533, 1.000959, -0.114516, 1, 1, 1, 1, 1,
1.809555, -0.432583, 2.297863, 1, 1, 1, 1, 1,
1.810202, 1.480058, -0.3063785, 1, 1, 1, 1, 1,
1.827796, -1.058755, 3.596402, 1, 1, 1, 1, 1,
1.828016, -0.008641453, 0.5618557, 1, 1, 1, 1, 1,
1.829359, -1.110789, 1.801851, 0, 0, 1, 1, 1,
1.839068, 1.597966, 1.900571, 1, 0, 0, 1, 1,
1.841217, -0.8448029, 2.617595, 1, 0, 0, 1, 1,
1.874472, 0.8430061, 1.312153, 1, 0, 0, 1, 1,
1.886776, 0.2513594, 0.6359814, 1, 0, 0, 1, 1,
2.010755, 2.192592, 0.336846, 1, 0, 0, 1, 1,
2.024845, -0.09633686, 2.086632, 0, 0, 0, 1, 1,
2.091665, -1.242777, 1.028368, 0, 0, 0, 1, 1,
2.115989, -0.04956241, 0.9135637, 0, 0, 0, 1, 1,
2.171088, -0.7226253, 3.207584, 0, 0, 0, 1, 1,
2.188382, 0.5373065, 1.458802, 0, 0, 0, 1, 1,
2.210122, 0.02279538, 0.9027404, 0, 0, 0, 1, 1,
2.299577, 0.4065972, 0.2805828, 0, 0, 0, 1, 1,
2.429732, -0.2010014, 2.860678, 1, 1, 1, 1, 1,
2.468305, -1.383095, 2.10841, 1, 1, 1, 1, 1,
2.530408, 0.3207193, 0.7376639, 1, 1, 1, 1, 1,
2.595933, -1.420949, -0.2938971, 1, 1, 1, 1, 1,
2.771128, -0.3828964, 2.487309, 1, 1, 1, 1, 1,
2.991485, -0.6048938, 1.570673, 1, 1, 1, 1, 1,
3.370017, 1.643596, 2.482333, 1, 1, 1, 1, 1
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
var radius = 10.00235;
var distance = 35.13282;
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
mvMatrix.translate( 0.1174312, -0.3125613, -0.08634782 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.13282);
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