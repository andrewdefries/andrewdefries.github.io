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
-2.963457, 0.6849734, -0.7440729, 1, 0, 0, 1,
-2.706128, 0.9039259, -3.838053, 1, 0.007843138, 0, 1,
-2.693088, 1.229905, -0.6519684, 1, 0.01176471, 0, 1,
-2.664957, 1.078816, -2.233997, 1, 0.01960784, 0, 1,
-2.639315, -0.04824675, -3.002753, 1, 0.02352941, 0, 1,
-2.598023, -0.5379068, -1.532365, 1, 0.03137255, 0, 1,
-2.500225, -1.653756, -0.8346166, 1, 0.03529412, 0, 1,
-2.49939, -0.7381117, -1.576152, 1, 0.04313726, 0, 1,
-2.467818, -1.497141, -2.713761, 1, 0.04705882, 0, 1,
-2.360108, -0.2729247, -0.4877084, 1, 0.05490196, 0, 1,
-2.346365, -0.8919284, -1.028525, 1, 0.05882353, 0, 1,
-2.290329, -0.912849, -2.349237, 1, 0.06666667, 0, 1,
-2.281351, -0.1318255, -1.639006, 1, 0.07058824, 0, 1,
-2.279329, 0.06466846, -1.369059, 1, 0.07843138, 0, 1,
-2.265926, -1.591761, -1.652841, 1, 0.08235294, 0, 1,
-2.265026, 2.229642, -2.129779, 1, 0.09019608, 0, 1,
-2.130351, -0.10545, -1.902681, 1, 0.09411765, 0, 1,
-2.118346, -0.5280204, -2.082701, 1, 0.1019608, 0, 1,
-2.106066, -0.3228791, -0.9335507, 1, 0.1098039, 0, 1,
-2.081028, 0.9939902, 0.5452671, 1, 0.1137255, 0, 1,
-2.059834, 0.007723981, -1.193367, 1, 0.1215686, 0, 1,
-2.050495, 0.1234474, -0.902068, 1, 0.1254902, 0, 1,
-2.045283, -0.674034, -2.633285, 1, 0.1333333, 0, 1,
-2.017597, 0.906944, -1.920605, 1, 0.1372549, 0, 1,
-2.016841, -1.036952, -3.089289, 1, 0.145098, 0, 1,
-1.98856, 0.1878699, -1.349364, 1, 0.1490196, 0, 1,
-1.933537, -0.2517906, -1.441053, 1, 0.1568628, 0, 1,
-1.912136, 0.4821447, -1.641247, 1, 0.1607843, 0, 1,
-1.903423, 0.3950539, -2.553865, 1, 0.1686275, 0, 1,
-1.889016, 0.6468965, -0.1316813, 1, 0.172549, 0, 1,
-1.883256, 1.240614, -1.607342, 1, 0.1803922, 0, 1,
-1.879376, 1.313051, -2.274189, 1, 0.1843137, 0, 1,
-1.876194, 0.2149262, -0.8788072, 1, 0.1921569, 0, 1,
-1.849235, -2.797469, -4.246593, 1, 0.1960784, 0, 1,
-1.813152, -0.188917, -2.774556, 1, 0.2039216, 0, 1,
-1.773271, -1.93913, -1.697938, 1, 0.2117647, 0, 1,
-1.768835, -0.09704487, -1.584854, 1, 0.2156863, 0, 1,
-1.751534, 0.1793604, 0.01788832, 1, 0.2235294, 0, 1,
-1.740047, -0.6955007, -3.756387, 1, 0.227451, 0, 1,
-1.72935, -0.05156843, -0.5292543, 1, 0.2352941, 0, 1,
-1.723211, -1.105165, -1.236075, 1, 0.2392157, 0, 1,
-1.721311, -1.211611, -1.191803, 1, 0.2470588, 0, 1,
-1.705824, -0.215853, -1.567742, 1, 0.2509804, 0, 1,
-1.700651, 0.005228809, -2.852612, 1, 0.2588235, 0, 1,
-1.697574, 1.035649, -2.385363, 1, 0.2627451, 0, 1,
-1.691416, -0.6213742, -2.499135, 1, 0.2705882, 0, 1,
-1.679699, 1.331043, 1.119032, 1, 0.2745098, 0, 1,
-1.677971, -0.8130729, -1.598852, 1, 0.282353, 0, 1,
-1.675928, 0.9773496, -2.599508, 1, 0.2862745, 0, 1,
-1.655332, 1.778978, -0.7039067, 1, 0.2941177, 0, 1,
-1.653799, -0.6266034, -1.424374, 1, 0.3019608, 0, 1,
-1.650519, -0.7506344, -2.443927, 1, 0.3058824, 0, 1,
-1.641706, -1.222588, -1.502382, 1, 0.3137255, 0, 1,
-1.612881, -0.9754459, -3.083964, 1, 0.3176471, 0, 1,
-1.599421, 1.821035, 0.6181388, 1, 0.3254902, 0, 1,
-1.595611, 0.06822462, -2.753097, 1, 0.3294118, 0, 1,
-1.591334, 0.2366694, -1.463447, 1, 0.3372549, 0, 1,
-1.58898, 0.1924532, -0.2717825, 1, 0.3411765, 0, 1,
-1.587229, -0.5477759, -1.782681, 1, 0.3490196, 0, 1,
-1.586814, 0.6145444, -1.602466, 1, 0.3529412, 0, 1,
-1.570039, 1.772689, -0.5383576, 1, 0.3607843, 0, 1,
-1.565951, 1.994349, -0.1519689, 1, 0.3647059, 0, 1,
-1.553002, 1.671076, -1.109217, 1, 0.372549, 0, 1,
-1.540341, 0.09189225, -1.571859, 1, 0.3764706, 0, 1,
-1.532791, -0.1165968, -1.555104, 1, 0.3843137, 0, 1,
-1.527101, 0.01802207, -0.5200449, 1, 0.3882353, 0, 1,
-1.516662, -0.8598855, -0.873745, 1, 0.3960784, 0, 1,
-1.512616, -0.1950116, -2.679858, 1, 0.4039216, 0, 1,
-1.501782, -0.2202778, -1.487389, 1, 0.4078431, 0, 1,
-1.479769, -0.1388477, -2.042163, 1, 0.4156863, 0, 1,
-1.479654, -0.964316, -2.601663, 1, 0.4196078, 0, 1,
-1.475605, 1.259964, -2.371495, 1, 0.427451, 0, 1,
-1.461829, 0.2414778, -1.161503, 1, 0.4313726, 0, 1,
-1.460792, 0.3710598, -0.8394158, 1, 0.4392157, 0, 1,
-1.451643, 0.2648128, -0.6925974, 1, 0.4431373, 0, 1,
-1.439323, -0.2689224, -2.832037, 1, 0.4509804, 0, 1,
-1.430765, 0.5176843, 1.103558, 1, 0.454902, 0, 1,
-1.430263, 0.7433967, -0.3379384, 1, 0.4627451, 0, 1,
-1.430013, 1.435727, -0.0190613, 1, 0.4666667, 0, 1,
-1.425596, 0.02330863, -1.571367, 1, 0.4745098, 0, 1,
-1.422129, -0.4583527, -1.84128, 1, 0.4784314, 0, 1,
-1.414031, -0.9553813, -2.530224, 1, 0.4862745, 0, 1,
-1.409838, 2.103634, -0.8269413, 1, 0.4901961, 0, 1,
-1.393487, -0.3821486, -2.603224, 1, 0.4980392, 0, 1,
-1.382989, -2.411511, -3.396665, 1, 0.5058824, 0, 1,
-1.374131, 0.1965435, -2.618976, 1, 0.509804, 0, 1,
-1.370988, 0.5313904, 0.802043, 1, 0.5176471, 0, 1,
-1.364129, 0.002214277, -2.309487, 1, 0.5215687, 0, 1,
-1.34537, 0.3634107, -2.26766, 1, 0.5294118, 0, 1,
-1.330238, -0.1616413, -1.346102, 1, 0.5333334, 0, 1,
-1.33023, -1.371079, -3.119986, 1, 0.5411765, 0, 1,
-1.316651, 0.6071475, -0.4638875, 1, 0.5450981, 0, 1,
-1.316358, 1.278481, -2.083842, 1, 0.5529412, 0, 1,
-1.316026, 0.3142252, -2.155397, 1, 0.5568628, 0, 1,
-1.307562, -1.041297, -1.751586, 1, 0.5647059, 0, 1,
-1.300724, -0.2559072, -0.1685733, 1, 0.5686275, 0, 1,
-1.292493, 2.196744, 1.775606, 1, 0.5764706, 0, 1,
-1.288337, -0.459126, -2.458375, 1, 0.5803922, 0, 1,
-1.284448, 0.03018519, -0.4889892, 1, 0.5882353, 0, 1,
-1.268454, -0.182742, -2.451895, 1, 0.5921569, 0, 1,
-1.26254, 0.3808927, -1.788076, 1, 0.6, 0, 1,
-1.260156, 0.2287385, -2.125073, 1, 0.6078432, 0, 1,
-1.250353, 0.4311836, -0.5195881, 1, 0.6117647, 0, 1,
-1.226856, 0.1431997, 0.1829055, 1, 0.6196079, 0, 1,
-1.226607, -0.8500987, -3.013691, 1, 0.6235294, 0, 1,
-1.215984, -1.575089, -2.393468, 1, 0.6313726, 0, 1,
-1.211974, 0.6880268, -0.8226916, 1, 0.6352941, 0, 1,
-1.204619, -1.498394, -2.018156, 1, 0.6431373, 0, 1,
-1.203199, 0.3062676, -0.7327357, 1, 0.6470588, 0, 1,
-1.200306, -0.5442404, -0.9187223, 1, 0.654902, 0, 1,
-1.200205, -0.4613006, -2.326155, 1, 0.6588235, 0, 1,
-1.193007, -0.2828302, -2.783687, 1, 0.6666667, 0, 1,
-1.18987, 1.193407, -2.310351, 1, 0.6705883, 0, 1,
-1.188908, 0.7563948, -0.8846884, 1, 0.6784314, 0, 1,
-1.179298, -2.676598, -2.2609, 1, 0.682353, 0, 1,
-1.174367, -1.269682, -3.64431, 1, 0.6901961, 0, 1,
-1.157659, -0.8331539, -1.307961, 1, 0.6941177, 0, 1,
-1.151586, 1.526327, 1.520112, 1, 0.7019608, 0, 1,
-1.14986, 0.7390026, -0.4744011, 1, 0.7098039, 0, 1,
-1.141281, 0.9962641, 0.6112661, 1, 0.7137255, 0, 1,
-1.139417, 0.2775077, -0.9485412, 1, 0.7215686, 0, 1,
-1.136293, -0.9030547, -4.057542, 1, 0.7254902, 0, 1,
-1.133261, -0.003704089, -0.01724518, 1, 0.7333333, 0, 1,
-1.130494, 2.109099, -2.284385, 1, 0.7372549, 0, 1,
-1.126444, -1.452449, -2.677819, 1, 0.7450981, 0, 1,
-1.125301, 0.165859, -1.598745, 1, 0.7490196, 0, 1,
-1.125251, -1.319775, -0.9843308, 1, 0.7568628, 0, 1,
-1.118454, -1.045152, -2.217958, 1, 0.7607843, 0, 1,
-1.118068, -0.392854, -2.022749, 1, 0.7686275, 0, 1,
-1.106293, 0.02364132, 0.7922266, 1, 0.772549, 0, 1,
-1.103343, -1.003988, -2.932111, 1, 0.7803922, 0, 1,
-1.095788, 0.1148809, -2.372425, 1, 0.7843137, 0, 1,
-1.092476, -3.296427, -3.459728, 1, 0.7921569, 0, 1,
-1.091752, -0.5055581, -1.095458, 1, 0.7960784, 0, 1,
-1.086355, -0.2826229, -1.901293, 1, 0.8039216, 0, 1,
-1.086278, -0.8437341, -2.655073, 1, 0.8117647, 0, 1,
-1.084254, -0.06090503, -1.285089, 1, 0.8156863, 0, 1,
-1.073184, -1.180736, -2.903343, 1, 0.8235294, 0, 1,
-1.072029, -1.861821, -2.303095, 1, 0.827451, 0, 1,
-1.068663, -0.6321775, -1.825701, 1, 0.8352941, 0, 1,
-1.066036, 0.2509514, -1.278433, 1, 0.8392157, 0, 1,
-1.055634, 0.5744169, -1.508984, 1, 0.8470588, 0, 1,
-1.04428, -0.7184795, -1.491722, 1, 0.8509804, 0, 1,
-1.040873, -1.135239, -4.180186, 1, 0.8588235, 0, 1,
-1.029752, 0.439858, -3.525681, 1, 0.8627451, 0, 1,
-1.019871, 1.969119, -1.179589, 1, 0.8705882, 0, 1,
-1.013497, 0.6178845, 0.9066975, 1, 0.8745098, 0, 1,
-1.012838, 0.02179897, -0.7339517, 1, 0.8823529, 0, 1,
-0.9954271, -0.9803453, -2.798405, 1, 0.8862745, 0, 1,
-0.9924557, -0.823266, -0.2838645, 1, 0.8941177, 0, 1,
-0.9923453, -1.537897, -2.170233, 1, 0.8980392, 0, 1,
-0.9921711, 0.3232656, -3.016048, 1, 0.9058824, 0, 1,
-0.986902, 0.6096749, -1.065295, 1, 0.9137255, 0, 1,
-0.9780381, 1.259131, 0.3957585, 1, 0.9176471, 0, 1,
-0.9773877, 0.1722747, -0.9899267, 1, 0.9254902, 0, 1,
-0.9686702, -1.415021, -2.285643, 1, 0.9294118, 0, 1,
-0.9602125, 0.399103, -2.924646, 1, 0.9372549, 0, 1,
-0.9569573, 1.565563, 0.1384767, 1, 0.9411765, 0, 1,
-0.9534846, -0.656508, -1.510064, 1, 0.9490196, 0, 1,
-0.9475196, 1.749381, -0.9667704, 1, 0.9529412, 0, 1,
-0.9460558, 0.3636641, -1.626613, 1, 0.9607843, 0, 1,
-0.944121, 2.577653, -2.055609, 1, 0.9647059, 0, 1,
-0.9414377, -1.544069, -1.694491, 1, 0.972549, 0, 1,
-0.9380402, 0.8112046, -0.1742445, 1, 0.9764706, 0, 1,
-0.935253, -1.055259, -3.236247, 1, 0.9843137, 0, 1,
-0.9351115, -1.284046, -3.474565, 1, 0.9882353, 0, 1,
-0.926423, 1.542355, -0.463915, 1, 0.9960784, 0, 1,
-0.9260528, -0.5124521, -1.208688, 0.9960784, 1, 0, 1,
-0.9256536, -1.998576, -3.527909, 0.9921569, 1, 0, 1,
-0.9254394, 0.03771508, -1.341233, 0.9843137, 1, 0, 1,
-0.9188759, -1.592095, -1.597738, 0.9803922, 1, 0, 1,
-0.9111623, -0.7744504, -2.969936, 0.972549, 1, 0, 1,
-0.9108633, -0.5464577, -3.066485, 0.9686275, 1, 0, 1,
-0.9071007, 3.241441, -0.8561347, 0.9607843, 1, 0, 1,
-0.9002331, 0.1249153, -2.049942, 0.9568627, 1, 0, 1,
-0.8989077, -0.5571384, -0.9161295, 0.9490196, 1, 0, 1,
-0.8940821, 0.9739167, -1.164172, 0.945098, 1, 0, 1,
-0.8926125, 0.2898126, -2.764777, 0.9372549, 1, 0, 1,
-0.8886749, -1.390352, -3.057478, 0.9333333, 1, 0, 1,
-0.8865844, -0.7757678, -3.245409, 0.9254902, 1, 0, 1,
-0.8843243, -0.8318831, -3.270251, 0.9215686, 1, 0, 1,
-0.8828899, 0.6770265, -0.3277318, 0.9137255, 1, 0, 1,
-0.8819438, 0.7153017, -1.71722, 0.9098039, 1, 0, 1,
-0.8794762, -0.733192, -2.15743, 0.9019608, 1, 0, 1,
-0.8684427, -1.113106, -2.938931, 0.8941177, 1, 0, 1,
-0.8663428, -0.1761037, -2.072746, 0.8901961, 1, 0, 1,
-0.8633068, -0.5853939, -1.738932, 0.8823529, 1, 0, 1,
-0.8556023, 1.638798, -0.9938117, 0.8784314, 1, 0, 1,
-0.854892, 0.06489608, -2.138699, 0.8705882, 1, 0, 1,
-0.8544765, 0.01771004, -1.937608, 0.8666667, 1, 0, 1,
-0.8502101, -1.08812, -0.2922147, 0.8588235, 1, 0, 1,
-0.8453729, 0.9523942, -1.279377, 0.854902, 1, 0, 1,
-0.8452528, 1.119971, -1.529053, 0.8470588, 1, 0, 1,
-0.8386341, -0.8142335, -1.914805, 0.8431373, 1, 0, 1,
-0.8333519, 1.919002, -0.7810284, 0.8352941, 1, 0, 1,
-0.8198019, -0.6614155, -2.512136, 0.8313726, 1, 0, 1,
-0.8195806, -0.5473431, -3.12525, 0.8235294, 1, 0, 1,
-0.8180189, -0.8766602, -3.22085, 0.8196079, 1, 0, 1,
-0.8123886, 0.579898, -0.1786999, 0.8117647, 1, 0, 1,
-0.8122497, -1.477014, -2.428179, 0.8078431, 1, 0, 1,
-0.8078283, 1.0286, 1.043158, 0.8, 1, 0, 1,
-0.8049859, -1.298763, -1.696506, 0.7921569, 1, 0, 1,
-0.8033217, 0.4359277, -1.387131, 0.7882353, 1, 0, 1,
-0.7996049, -0.9153597, -4.206479, 0.7803922, 1, 0, 1,
-0.7951076, -0.7202747, -2.515075, 0.7764706, 1, 0, 1,
-0.7939395, 0.6134559, -1.838257, 0.7686275, 1, 0, 1,
-0.7919073, -0.8928828, -1.982027, 0.7647059, 1, 0, 1,
-0.7840356, -0.5955521, -2.361195, 0.7568628, 1, 0, 1,
-0.7818306, 0.4524368, -0.6415365, 0.7529412, 1, 0, 1,
-0.7761012, 0.4329742, -1.192097, 0.7450981, 1, 0, 1,
-0.7734686, -0.5588681, -2.074865, 0.7411765, 1, 0, 1,
-0.7660028, -0.7111669, -1.034634, 0.7333333, 1, 0, 1,
-0.7651314, -1.257851, -2.77759, 0.7294118, 1, 0, 1,
-0.7644968, -0.691361, -1.951178, 0.7215686, 1, 0, 1,
-0.7636031, 0.3609844, -2.459862, 0.7176471, 1, 0, 1,
-0.7603412, 0.6372945, -1.520077, 0.7098039, 1, 0, 1,
-0.7587851, 0.06554286, -0.5303638, 0.7058824, 1, 0, 1,
-0.7581127, 1.05226, -1.967259, 0.6980392, 1, 0, 1,
-0.7575108, 0.4928186, -1.330397, 0.6901961, 1, 0, 1,
-0.7539349, 0.5663977, -0.09843175, 0.6862745, 1, 0, 1,
-0.7402092, -0.2845498, -4.102425, 0.6784314, 1, 0, 1,
-0.739955, -0.37968, -2.056088, 0.6745098, 1, 0, 1,
-0.7303227, 2.052443, -1.185543, 0.6666667, 1, 0, 1,
-0.7259167, 1.242711, -0.6756589, 0.6627451, 1, 0, 1,
-0.7257365, 0.04445015, -1.91901, 0.654902, 1, 0, 1,
-0.7254598, 0.664811, 0.6236565, 0.6509804, 1, 0, 1,
-0.7228839, -0.8859744, -2.546283, 0.6431373, 1, 0, 1,
-0.7226533, -0.2996783, -1.877788, 0.6392157, 1, 0, 1,
-0.7204602, -0.7631121, -1.244277, 0.6313726, 1, 0, 1,
-0.7195413, -1.371432, -1.690655, 0.627451, 1, 0, 1,
-0.7164114, 1.983387, -0.9950666, 0.6196079, 1, 0, 1,
-0.7138597, 0.9742862, 0.4471959, 0.6156863, 1, 0, 1,
-0.7090759, 0.5323156, -1.900889, 0.6078432, 1, 0, 1,
-0.7061936, -0.1211731, -0.6913053, 0.6039216, 1, 0, 1,
-0.7020897, -0.3471451, -3.675478, 0.5960785, 1, 0, 1,
-0.697513, -0.4069499, -1.988113, 0.5882353, 1, 0, 1,
-0.6974993, -1.676286, -2.990898, 0.5843138, 1, 0, 1,
-0.6943654, 1.108941, -0.2132052, 0.5764706, 1, 0, 1,
-0.6921261, -0.2766996, -1.468931, 0.572549, 1, 0, 1,
-0.6880921, -1.778125, -3.021462, 0.5647059, 1, 0, 1,
-0.6855853, -0.08623161, -0.8043275, 0.5607843, 1, 0, 1,
-0.6853825, 0.1756446, -0.6158527, 0.5529412, 1, 0, 1,
-0.6768269, 0.7303403, -1.323671, 0.5490196, 1, 0, 1,
-0.6757963, -0.08026696, -1.070684, 0.5411765, 1, 0, 1,
-0.6752197, -0.2275301, -3.055808, 0.5372549, 1, 0, 1,
-0.6736599, -0.2184204, -1.096188, 0.5294118, 1, 0, 1,
-0.6710699, 0.9024015, 0.5104914, 0.5254902, 1, 0, 1,
-0.670665, -0.6038892, -2.455522, 0.5176471, 1, 0, 1,
-0.6654372, 0.2641518, 0.1846804, 0.5137255, 1, 0, 1,
-0.664571, -2.669521, -1.946044, 0.5058824, 1, 0, 1,
-0.6630815, 0.8176624, -0.5505556, 0.5019608, 1, 0, 1,
-0.6600674, 1.029653, -0.2474944, 0.4941176, 1, 0, 1,
-0.6591488, -0.1587178, -1.388268, 0.4862745, 1, 0, 1,
-0.6590791, -1.338144, -0.7589369, 0.4823529, 1, 0, 1,
-0.6577105, 0.5864543, -0.2491524, 0.4745098, 1, 0, 1,
-0.6562735, 1.525974, 0.1867375, 0.4705882, 1, 0, 1,
-0.6534088, 0.9238064, -0.6822069, 0.4627451, 1, 0, 1,
-0.653019, 0.8078091, -1.341764, 0.4588235, 1, 0, 1,
-0.6526847, 1.627494, -0.4073218, 0.4509804, 1, 0, 1,
-0.6491833, 1.215811, -0.1710375, 0.4470588, 1, 0, 1,
-0.6478767, -0.1184829, -2.641212, 0.4392157, 1, 0, 1,
-0.6405642, 1.000682, -1.398767, 0.4352941, 1, 0, 1,
-0.6391559, -0.13962, -0.7244383, 0.427451, 1, 0, 1,
-0.6388639, 0.3880262, -0.6766161, 0.4235294, 1, 0, 1,
-0.6385484, -0.7336189, -3.125346, 0.4156863, 1, 0, 1,
-0.6364697, -1.026981, -2.635097, 0.4117647, 1, 0, 1,
-0.6350448, -0.7054116, -2.063955, 0.4039216, 1, 0, 1,
-0.63232, 0.5595167, 0.4798433, 0.3960784, 1, 0, 1,
-0.6317159, -0.3350912, -0.622521, 0.3921569, 1, 0, 1,
-0.62831, 0.2771772, -1.974681, 0.3843137, 1, 0, 1,
-0.6236251, -0.5673153, -2.616587, 0.3803922, 1, 0, 1,
-0.6217966, 0.5371431, 0.2027073, 0.372549, 1, 0, 1,
-0.6145693, -2.501133, -2.821644, 0.3686275, 1, 0, 1,
-0.6120877, 1.708144, -0.8109668, 0.3607843, 1, 0, 1,
-0.6101874, -1.084873, -3.289415, 0.3568628, 1, 0, 1,
-0.6085389, -0.9858977, -3.091892, 0.3490196, 1, 0, 1,
-0.6074338, -2.905752, -3.820503, 0.345098, 1, 0, 1,
-0.6031333, -0.6762642, -0.838973, 0.3372549, 1, 0, 1,
-0.5978642, 1.505311, -1.654525, 0.3333333, 1, 0, 1,
-0.5973682, -0.1504305, -2.491464, 0.3254902, 1, 0, 1,
-0.593914, -0.418939, -2.455674, 0.3215686, 1, 0, 1,
-0.5938732, 0.08769925, -1.503214, 0.3137255, 1, 0, 1,
-0.5822859, 0.7218835, -0.9240845, 0.3098039, 1, 0, 1,
-0.5774307, -0.7094513, -2.217706, 0.3019608, 1, 0, 1,
-0.5732598, -1.134618, -4.08949, 0.2941177, 1, 0, 1,
-0.5678877, 0.2634699, -1.827089, 0.2901961, 1, 0, 1,
-0.5674992, 0.4156212, 2.133399, 0.282353, 1, 0, 1,
-0.5633962, 0.6320453, 0.3749499, 0.2784314, 1, 0, 1,
-0.5528021, -0.7808528, -3.434376, 0.2705882, 1, 0, 1,
-0.5457516, -1.332585, -3.192176, 0.2666667, 1, 0, 1,
-0.5450589, 0.8849476, -0.8432024, 0.2588235, 1, 0, 1,
-0.5449203, -0.8930949, -3.922059, 0.254902, 1, 0, 1,
-0.5379946, -0.04551398, -1.852607, 0.2470588, 1, 0, 1,
-0.5369594, -0.01282227, -3.336961, 0.2431373, 1, 0, 1,
-0.5359216, 2.605503, -0.1433883, 0.2352941, 1, 0, 1,
-0.5358616, 0.3403748, -1.993069, 0.2313726, 1, 0, 1,
-0.5331284, -1.028882, -1.70507, 0.2235294, 1, 0, 1,
-0.5302574, -0.4034994, -1.132271, 0.2196078, 1, 0, 1,
-0.5300261, -0.0102564, -0.07684574, 0.2117647, 1, 0, 1,
-0.5277009, 1.921831, 0.1550108, 0.2078431, 1, 0, 1,
-0.5254385, -0.3101984, 1.191463, 0.2, 1, 0, 1,
-0.5205518, -1.371451, -2.971434, 0.1921569, 1, 0, 1,
-0.519176, 0.4046405, -1.697164, 0.1882353, 1, 0, 1,
-0.5073053, 0.1506802, -3.862265, 0.1803922, 1, 0, 1,
-0.5060772, 0.3076817, -0.4497522, 0.1764706, 1, 0, 1,
-0.5060092, 0.7535354, -0.207141, 0.1686275, 1, 0, 1,
-0.5040802, -1.83261, -3.438485, 0.1647059, 1, 0, 1,
-0.4912481, 1.262807, -1.944393, 0.1568628, 1, 0, 1,
-0.4893828, 1.408613, -0.3397747, 0.1529412, 1, 0, 1,
-0.4815901, 0.7192661, 0.2570103, 0.145098, 1, 0, 1,
-0.4734366, 2.821281, 1.353814, 0.1411765, 1, 0, 1,
-0.4730621, 1.303035, 1.018795, 0.1333333, 1, 0, 1,
-0.4711565, -0.6353294, -2.671776, 0.1294118, 1, 0, 1,
-0.4688761, 0.08085681, -3.090624, 0.1215686, 1, 0, 1,
-0.4622857, -1.53662, -3.203934, 0.1176471, 1, 0, 1,
-0.4556639, -0.2846876, -3.59337, 0.1098039, 1, 0, 1,
-0.4553617, -0.2277159, -0.7367684, 0.1058824, 1, 0, 1,
-0.4550498, -0.7042891, -3.00042, 0.09803922, 1, 0, 1,
-0.4486575, -0.3749074, -2.576702, 0.09019608, 1, 0, 1,
-0.4465666, -0.9982012, -4.089188, 0.08627451, 1, 0, 1,
-0.4423161, 0.4476461, -0.01282871, 0.07843138, 1, 0, 1,
-0.4399377, -1.978592, -3.317185, 0.07450981, 1, 0, 1,
-0.4386525, 1.433248, -0.4016778, 0.06666667, 1, 0, 1,
-0.4383186, 0.4943144, 1.83117, 0.0627451, 1, 0, 1,
-0.4354593, 0.5711699, -1.328258, 0.05490196, 1, 0, 1,
-0.4300978, 1.500427, -1.30073, 0.05098039, 1, 0, 1,
-0.4300042, 0.1774864, -0.1818606, 0.04313726, 1, 0, 1,
-0.4296847, 0.3383574, -0.8637898, 0.03921569, 1, 0, 1,
-0.4293851, -0.007777666, -2.319528, 0.03137255, 1, 0, 1,
-0.4273752, -2.428259, -2.523708, 0.02745098, 1, 0, 1,
-0.4237521, -0.1868919, -2.336717, 0.01960784, 1, 0, 1,
-0.4186133, 0.8145814, -1.399478, 0.01568628, 1, 0, 1,
-0.4176277, -1.541901, -2.823314, 0.007843138, 1, 0, 1,
-0.416197, 0.1553054, -2.369749, 0.003921569, 1, 0, 1,
-0.4158902, -0.06823622, -2.541502, 0, 1, 0.003921569, 1,
-0.4123466, 0.620941, -0.7469304, 0, 1, 0.01176471, 1,
-0.4047424, 0.1142821, -1.594701, 0, 1, 0.01568628, 1,
-0.4047109, -0.6365451, -2.117515, 0, 1, 0.02352941, 1,
-0.4046386, 0.8151068, -1.104, 0, 1, 0.02745098, 1,
-0.4044245, 0.183017, -0.6814135, 0, 1, 0.03529412, 1,
-0.4036993, -1.335986, -2.792016, 0, 1, 0.03921569, 1,
-0.3994625, -0.8084999, -3.942376, 0, 1, 0.04705882, 1,
-0.398773, 0.6479233, -1.611965, 0, 1, 0.05098039, 1,
-0.3932099, 0.8063604, 0.9736156, 0, 1, 0.05882353, 1,
-0.3838964, -0.3250095, -2.897092, 0, 1, 0.0627451, 1,
-0.3806517, -0.2226146, -1.025915, 0, 1, 0.07058824, 1,
-0.3772513, -1.373458, -1.170642, 0, 1, 0.07450981, 1,
-0.3759216, 0.7580677, -0.6441195, 0, 1, 0.08235294, 1,
-0.3720761, 0.7622477, -1.505811, 0, 1, 0.08627451, 1,
-0.3650034, -0.1491063, -2.064385, 0, 1, 0.09411765, 1,
-0.3610845, 0.5541588, -1.567822, 0, 1, 0.1019608, 1,
-0.3605138, 0.01842629, -1.160125, 0, 1, 0.1058824, 1,
-0.3596271, 0.7461248, 1.633165, 0, 1, 0.1137255, 1,
-0.3558078, -0.0794557, -2.916934, 0, 1, 0.1176471, 1,
-0.3552744, -0.6128685, -1.224208, 0, 1, 0.1254902, 1,
-0.3547138, 0.2246383, -0.4513922, 0, 1, 0.1294118, 1,
-0.3545741, -0.2608888, -1.223909, 0, 1, 0.1372549, 1,
-0.3468772, -0.01621622, -2.202915, 0, 1, 0.1411765, 1,
-0.3447877, 1.384197, -1.700068, 0, 1, 0.1490196, 1,
-0.3375131, -0.3291208, -0.5427318, 0, 1, 0.1529412, 1,
-0.3349276, -1.313701, -2.862148, 0, 1, 0.1607843, 1,
-0.3330846, -1.223934, -4.215318, 0, 1, 0.1647059, 1,
-0.3311882, 0.53714, 0.5085139, 0, 1, 0.172549, 1,
-0.327657, -0.5189573, -0.2293058, 0, 1, 0.1764706, 1,
-0.3269182, -0.8845932, -2.207859, 0, 1, 0.1843137, 1,
-0.3254165, -1.764182, -3.63966, 0, 1, 0.1882353, 1,
-0.3247536, -0.07526693, -1.403294, 0, 1, 0.1960784, 1,
-0.3220829, -1.446746, -2.02807, 0, 1, 0.2039216, 1,
-0.3202471, 0.7559385, -2.171445, 0, 1, 0.2078431, 1,
-0.3178788, 0.3076273, -0.8683684, 0, 1, 0.2156863, 1,
-0.3163189, 1.217733, -0.2211589, 0, 1, 0.2196078, 1,
-0.3138514, 0.4951516, -0.5196062, 0, 1, 0.227451, 1,
-0.3115933, 0.321404, -0.8391063, 0, 1, 0.2313726, 1,
-0.3024003, -0.1095783, -2.755109, 0, 1, 0.2392157, 1,
-0.3001522, -1.969447, -2.728875, 0, 1, 0.2431373, 1,
-0.2944899, -0.9453037, -2.538305, 0, 1, 0.2509804, 1,
-0.2888122, 2.340989, -0.494116, 0, 1, 0.254902, 1,
-0.2884258, -1.192294, -4.936511, 0, 1, 0.2627451, 1,
-0.2872586, 0.8392596, -0.2417032, 0, 1, 0.2666667, 1,
-0.2849415, 1.034516, -1.519138, 0, 1, 0.2745098, 1,
-0.2812257, 1.556262, -2.464515, 0, 1, 0.2784314, 1,
-0.2790962, 1.378804, 0.9181926, 0, 1, 0.2862745, 1,
-0.2724913, 0.06224053, -2.112453, 0, 1, 0.2901961, 1,
-0.2706826, 0.3049754, 1.601117, 0, 1, 0.2980392, 1,
-0.2651047, -0.1753633, -2.696065, 0, 1, 0.3058824, 1,
-0.2625252, -1.882103, -2.828356, 0, 1, 0.3098039, 1,
-0.2606893, 0.06763313, -0.9511396, 0, 1, 0.3176471, 1,
-0.2519508, -0.9601881, -2.039364, 0, 1, 0.3215686, 1,
-0.2456827, 0.3685447, 0.5522311, 0, 1, 0.3294118, 1,
-0.2446641, -0.1338665, -1.397566, 0, 1, 0.3333333, 1,
-0.2426081, -0.02573044, -1.794677, 0, 1, 0.3411765, 1,
-0.2379353, -0.6785409, -2.875409, 0, 1, 0.345098, 1,
-0.232787, -0.784553, -3.291222, 0, 1, 0.3529412, 1,
-0.2283406, 0.3047249, -0.485907, 0, 1, 0.3568628, 1,
-0.2282774, -0.3131441, -4.276603, 0, 1, 0.3647059, 1,
-0.2273727, 1.164191, 0.8853762, 0, 1, 0.3686275, 1,
-0.2255596, -0.03075626, -1.003048, 0, 1, 0.3764706, 1,
-0.2247842, 0.8963776, -0.5164251, 0, 1, 0.3803922, 1,
-0.2235746, 0.4071775, -3.281767, 0, 1, 0.3882353, 1,
-0.2203797, -1.148288, -3.156738, 0, 1, 0.3921569, 1,
-0.2186476, 1.357042, -2.339471, 0, 1, 0.4, 1,
-0.2159608, -0.5089759, -3.87877, 0, 1, 0.4078431, 1,
-0.2133557, 1.480379, -1.197361, 0, 1, 0.4117647, 1,
-0.202938, -1.264173, -2.395338, 0, 1, 0.4196078, 1,
-0.2022283, 0.7561048, -0.08794367, 0, 1, 0.4235294, 1,
-0.2015756, 0.5487484, -1.958549, 0, 1, 0.4313726, 1,
-0.200495, -1.083537, -2.55337, 0, 1, 0.4352941, 1,
-0.1924147, 0.8602327, 0.1418412, 0, 1, 0.4431373, 1,
-0.1922044, -0.7942331, -1.149051, 0, 1, 0.4470588, 1,
-0.1901707, 0.6449268, -0.02607867, 0, 1, 0.454902, 1,
-0.1893165, -0.6229931, -3.974994, 0, 1, 0.4588235, 1,
-0.1873561, -1.510802, -2.947206, 0, 1, 0.4666667, 1,
-0.1852103, -1.606019, -1.745818, 0, 1, 0.4705882, 1,
-0.183845, 0.8641104, 0.4471796, 0, 1, 0.4784314, 1,
-0.1836338, 1.153148, -0.03284855, 0, 1, 0.4823529, 1,
-0.1829734, -1.228108, -2.386276, 0, 1, 0.4901961, 1,
-0.1825005, -0.1865308, -0.814203, 0, 1, 0.4941176, 1,
-0.1784027, -0.9351544, -4.375447, 0, 1, 0.5019608, 1,
-0.1778751, 1.072105, 1.138027, 0, 1, 0.509804, 1,
-0.1761533, -0.06569792, -2.817921, 0, 1, 0.5137255, 1,
-0.1756041, 1.312261, 0.7383152, 0, 1, 0.5215687, 1,
-0.1750665, -1.653405, -2.159827, 0, 1, 0.5254902, 1,
-0.1727615, -0.1399712, -3.372251, 0, 1, 0.5333334, 1,
-0.1706221, 0.3597521, -0.09320308, 0, 1, 0.5372549, 1,
-0.17048, 0.2562485, -0.6065884, 0, 1, 0.5450981, 1,
-0.1654539, -0.3615432, -2.509467, 0, 1, 0.5490196, 1,
-0.1645624, -0.1621725, -0.9491141, 0, 1, 0.5568628, 1,
-0.1633398, -1.049152, -4.292821, 0, 1, 0.5607843, 1,
-0.1625162, -1.761057, -2.934536, 0, 1, 0.5686275, 1,
-0.1528382, -0.1444073, -3.387353, 0, 1, 0.572549, 1,
-0.1499236, 0.7163556, 0.01366295, 0, 1, 0.5803922, 1,
-0.1376568, 0.975234, -0.5983049, 0, 1, 0.5843138, 1,
-0.1350579, -1.804137, -1.764776, 0, 1, 0.5921569, 1,
-0.1350537, 0.6765234, -1.70022, 0, 1, 0.5960785, 1,
-0.1349988, 0.8813512, -0.1833213, 0, 1, 0.6039216, 1,
-0.1334485, -0.1640166, -1.335837, 0, 1, 0.6117647, 1,
-0.133294, -0.9206145, -3.320921, 0, 1, 0.6156863, 1,
-0.1322345, 0.7223384, -1.314161, 0, 1, 0.6235294, 1,
-0.1298414, -2.103728, -3.067758, 0, 1, 0.627451, 1,
-0.1297432, -0.323614, -1.789317, 0, 1, 0.6352941, 1,
-0.1284997, -0.363349, -1.773926, 0, 1, 0.6392157, 1,
-0.1242689, 0.7901485, -0.3082772, 0, 1, 0.6470588, 1,
-0.1190653, 0.3009919, 0.5226376, 0, 1, 0.6509804, 1,
-0.1140247, 0.06618353, -2.796033, 0, 1, 0.6588235, 1,
-0.1090152, 1.293251, -1.198874, 0, 1, 0.6627451, 1,
-0.1081486, -1.508281, -4.732089, 0, 1, 0.6705883, 1,
-0.1067041, -0.8700156, -2.744559, 0, 1, 0.6745098, 1,
-0.09694867, 0.1578924, -1.293131, 0, 1, 0.682353, 1,
-0.0966778, 1.673895, -1.682126, 0, 1, 0.6862745, 1,
-0.08436855, 1.026425, 0.5033287, 0, 1, 0.6941177, 1,
-0.08071666, -0.1222979, -1.612577, 0, 1, 0.7019608, 1,
-0.08044503, -0.8819385, -3.807931, 0, 1, 0.7058824, 1,
-0.08010734, 1.040012, -2.028712, 0, 1, 0.7137255, 1,
-0.07936473, -0.1398431, -1.670041, 0, 1, 0.7176471, 1,
-0.07650183, 0.4576466, 0.2534283, 0, 1, 0.7254902, 1,
-0.07644492, -0.4082069, -1.837998, 0, 1, 0.7294118, 1,
-0.07582969, -1.219726, -3.690344, 0, 1, 0.7372549, 1,
-0.0750894, 0.527936, 1.068237, 0, 1, 0.7411765, 1,
-0.07293782, -0.773111, -1.788305, 0, 1, 0.7490196, 1,
-0.07099933, 0.3121514, -1.803739, 0, 1, 0.7529412, 1,
-0.07003797, 0.1928298, -0.8563434, 0, 1, 0.7607843, 1,
-0.06957075, -0.7772047, -2.412067, 0, 1, 0.7647059, 1,
-0.06633393, -1.031294, -1.417836, 0, 1, 0.772549, 1,
-0.06243329, -0.3324317, -2.309987, 0, 1, 0.7764706, 1,
-0.06218886, -1.238778, -4.663198, 0, 1, 0.7843137, 1,
-0.0575866, -1.319203, -3.263013, 0, 1, 0.7882353, 1,
-0.05447508, -1.589296, -3.403401, 0, 1, 0.7960784, 1,
-0.05319713, -1.063584, -2.638322, 0, 1, 0.8039216, 1,
-0.05221175, 0.9413711, 0.5988568, 0, 1, 0.8078431, 1,
-0.05079347, 0.7226216, -1.644127, 0, 1, 0.8156863, 1,
-0.04841948, -0.7350621, -4.051408, 0, 1, 0.8196079, 1,
-0.04734113, -0.4678011, -2.410812, 0, 1, 0.827451, 1,
-0.0434556, 0.0325267, -1.163505, 0, 1, 0.8313726, 1,
-0.04302753, 0.624061, -0.6456677, 0, 1, 0.8392157, 1,
-0.03767065, 0.3810401, 0.09030653, 0, 1, 0.8431373, 1,
-0.03210396, -0.4444582, -1.603689, 0, 1, 0.8509804, 1,
-0.03184374, -0.5719526, -2.526947, 0, 1, 0.854902, 1,
-0.03114153, -0.4660477, -3.676018, 0, 1, 0.8627451, 1,
-0.02820423, -1.955786, -3.602106, 0, 1, 0.8666667, 1,
-0.02252428, -0.6697435, -2.592952, 0, 1, 0.8745098, 1,
-0.02002297, 0.3330683, -0.8862807, 0, 1, 0.8784314, 1,
-0.01899098, 1.931303, -0.2625872, 0, 1, 0.8862745, 1,
-0.01808046, -0.8351556, -1.975615, 0, 1, 0.8901961, 1,
-0.01697178, 0.0697208, -0.8941754, 0, 1, 0.8980392, 1,
-0.01296138, -0.605044, -3.523652, 0, 1, 0.9058824, 1,
-0.009187751, 0.09264737, -2.564209, 0, 1, 0.9098039, 1,
-0.003391403, -0.8686051, -2.77045, 0, 1, 0.9176471, 1,
-0.002129658, -1.266716, -3.10493, 0, 1, 0.9215686, 1,
0.001670445, 0.8708097, 0.8829595, 0, 1, 0.9294118, 1,
0.002847437, 0.6304485, -0.6203156, 0, 1, 0.9333333, 1,
0.004543013, -0.89769, 2.695311, 0, 1, 0.9411765, 1,
0.007816981, -0.457227, 3.98568, 0, 1, 0.945098, 1,
0.01819262, -0.4692367, 3.269784, 0, 1, 0.9529412, 1,
0.02173764, 0.8885633, 2.228555, 0, 1, 0.9568627, 1,
0.02555331, -1.425949, 3.201864, 0, 1, 0.9647059, 1,
0.02989051, -0.0946394, 3.731555, 0, 1, 0.9686275, 1,
0.03107919, -0.3525341, 3.734981, 0, 1, 0.9764706, 1,
0.03170803, 0.9433312, 1.412637, 0, 1, 0.9803922, 1,
0.03188522, -0.3631565, 2.495315, 0, 1, 0.9882353, 1,
0.03633506, -1.433285, 4.233178, 0, 1, 0.9921569, 1,
0.04071644, 1.429593, 2.313933, 0, 1, 1, 1,
0.04103169, 0.8956378, 0.08795793, 0, 0.9921569, 1, 1,
0.0421066, 0.2826576, -0.2223273, 0, 0.9882353, 1, 1,
0.0431157, 0.8554761, -2.085362, 0, 0.9803922, 1, 1,
0.04473315, -0.9185242, 4.399159, 0, 0.9764706, 1, 1,
0.04505827, 0.1437499, 0.3671881, 0, 0.9686275, 1, 1,
0.04897526, 0.608867, 0.7579525, 0, 0.9647059, 1, 1,
0.05031504, 1.709078, -0.3100021, 0, 0.9568627, 1, 1,
0.05426705, -0.157355, 1.68371, 0, 0.9529412, 1, 1,
0.05469093, -1.657526, 4.915569, 0, 0.945098, 1, 1,
0.05493572, 1.069196, 1.002679, 0, 0.9411765, 1, 1,
0.06072938, 0.4242457, -0.000187427, 0, 0.9333333, 1, 1,
0.06295333, 0.8657923, 2.409595, 0, 0.9294118, 1, 1,
0.06464525, -0.5157165, 2.009754, 0, 0.9215686, 1, 1,
0.06474787, -1.129545, 3.501971, 0, 0.9176471, 1, 1,
0.06598888, 1.468629, 0.4067117, 0, 0.9098039, 1, 1,
0.06629288, 2.170075, -2.491199, 0, 0.9058824, 1, 1,
0.06907492, 0.6380545, -0.7626502, 0, 0.8980392, 1, 1,
0.07110966, 1.263857, 0.9877824, 0, 0.8901961, 1, 1,
0.07445749, 1.204416, 2.622345, 0, 0.8862745, 1, 1,
0.07447448, -0.8619359, 2.569041, 0, 0.8784314, 1, 1,
0.0751831, -0.6431594, 2.002454, 0, 0.8745098, 1, 1,
0.07945923, 0.5498779, -0.1137174, 0, 0.8666667, 1, 1,
0.103963, 1.088289, -0.8415413, 0, 0.8627451, 1, 1,
0.1064072, 0.10972, 0.6752329, 0, 0.854902, 1, 1,
0.1092089, 0.03923486, 3.300137, 0, 0.8509804, 1, 1,
0.1125398, -0.4152055, 0.6494976, 0, 0.8431373, 1, 1,
0.1188803, -0.8375826, 5.349255, 0, 0.8392157, 1, 1,
0.121837, -1.264766, 2.767533, 0, 0.8313726, 1, 1,
0.1224558, 0.6913373, 1.161721, 0, 0.827451, 1, 1,
0.1243709, 1.501343, -0.4844393, 0, 0.8196079, 1, 1,
0.1270695, 0.3534712, -0.2226172, 0, 0.8156863, 1, 1,
0.1275219, -1.7254, 3.520649, 0, 0.8078431, 1, 1,
0.1302001, -0.2072819, 3.779824, 0, 0.8039216, 1, 1,
0.1304558, 0.5840397, 1.469865, 0, 0.7960784, 1, 1,
0.1323602, -0.9356509, 2.529012, 0, 0.7882353, 1, 1,
0.1363463, -1.477964, 2.249861, 0, 0.7843137, 1, 1,
0.1385137, 0.9998002, 0.02064636, 0, 0.7764706, 1, 1,
0.1393888, 1.030422, 0.3406573, 0, 0.772549, 1, 1,
0.1395572, -1.902799, 3.369114, 0, 0.7647059, 1, 1,
0.1408923, -0.3555307, -0.1506613, 0, 0.7607843, 1, 1,
0.1447168, 0.4588397, 0.7971216, 0, 0.7529412, 1, 1,
0.1476819, -1.420679, 3.176437, 0, 0.7490196, 1, 1,
0.1490694, -1.116382, 1.964802, 0, 0.7411765, 1, 1,
0.1520873, -0.6235136, 1.950206, 0, 0.7372549, 1, 1,
0.1543532, -1.243061, 5.207083, 0, 0.7294118, 1, 1,
0.1560316, -0.3936896, 4.020257, 0, 0.7254902, 1, 1,
0.1592934, 0.09421295, 1.137478, 0, 0.7176471, 1, 1,
0.15973, 0.7039156, 0.882705, 0, 0.7137255, 1, 1,
0.159843, -0.4784334, 1.855348, 0, 0.7058824, 1, 1,
0.1604821, 0.9328074, 0.4038179, 0, 0.6980392, 1, 1,
0.1632867, -0.4657834, 3.858599, 0, 0.6941177, 1, 1,
0.1704054, 0.205327, 0.2276142, 0, 0.6862745, 1, 1,
0.1706607, 0.3415478, -1.163978, 0, 0.682353, 1, 1,
0.1716443, -1.034593, 2.430684, 0, 0.6745098, 1, 1,
0.1717335, 2.229006, 0.2405276, 0, 0.6705883, 1, 1,
0.1783783, -0.4432029, 1.624282, 0, 0.6627451, 1, 1,
0.182482, 0.01655726, 0.5069533, 0, 0.6588235, 1, 1,
0.1870158, 0.2506003, 0.5832422, 0, 0.6509804, 1, 1,
0.1891881, -1.375344, 1.026656, 0, 0.6470588, 1, 1,
0.1898665, -0.09101608, 2.68558, 0, 0.6392157, 1, 1,
0.1912923, 0.9668381, -0.1224559, 0, 0.6352941, 1, 1,
0.1939165, 0.3678898, 0.9151099, 0, 0.627451, 1, 1,
0.1950304, -0.4734035, 2.852461, 0, 0.6235294, 1, 1,
0.1968197, 2.095529, -0.4364217, 0, 0.6156863, 1, 1,
0.2007438, -0.3118086, 1.985921, 0, 0.6117647, 1, 1,
0.2023587, 0.7441561, -1.180293, 0, 0.6039216, 1, 1,
0.2068064, -2.074485, 3.726566, 0, 0.5960785, 1, 1,
0.2082083, 0.2167953, 0.9617299, 0, 0.5921569, 1, 1,
0.2112738, 0.8132687, -1.000189, 0, 0.5843138, 1, 1,
0.2113088, 0.6700277, 2.475109, 0, 0.5803922, 1, 1,
0.2133007, 1.012117, -0.2738826, 0, 0.572549, 1, 1,
0.2139348, 1.922222, -2.323653, 0, 0.5686275, 1, 1,
0.214421, 0.4055305, 1.474773, 0, 0.5607843, 1, 1,
0.221679, 1.558358, -1.202844, 0, 0.5568628, 1, 1,
0.2236343, 1.569284, -0.5430579, 0, 0.5490196, 1, 1,
0.2261524, 0.1599294, 1.657227, 0, 0.5450981, 1, 1,
0.2324924, -1.743124, 2.321823, 0, 0.5372549, 1, 1,
0.2337847, -0.9197899, 2.315516, 0, 0.5333334, 1, 1,
0.2343885, -0.5098003, 0.9338707, 0, 0.5254902, 1, 1,
0.234459, -0.9509184, 3.588624, 0, 0.5215687, 1, 1,
0.238078, 1.041737, -0.5945688, 0, 0.5137255, 1, 1,
0.2385949, -0.3567325, 3.843238, 0, 0.509804, 1, 1,
0.2480721, 1.230008, 0.2457058, 0, 0.5019608, 1, 1,
0.2491165, -0.5690666, 5.729032, 0, 0.4941176, 1, 1,
0.2517093, 0.7705424, 0.08914232, 0, 0.4901961, 1, 1,
0.2524657, 1.342005, 1.123041, 0, 0.4823529, 1, 1,
0.2539446, 0.9534994, 0.8150229, 0, 0.4784314, 1, 1,
0.2573294, 0.4773179, 3.21958, 0, 0.4705882, 1, 1,
0.2583221, 0.3230821, 0.4789967, 0, 0.4666667, 1, 1,
0.2626676, 0.631178, -1.316976, 0, 0.4588235, 1, 1,
0.2776889, -0.5928584, 2.980897, 0, 0.454902, 1, 1,
0.2840747, -0.7624399, 3.099708, 0, 0.4470588, 1, 1,
0.2843532, -0.4606582, 1.860063, 0, 0.4431373, 1, 1,
0.2864735, -0.4338235, 3.861233, 0, 0.4352941, 1, 1,
0.2886685, -0.07170798, 1.999595, 0, 0.4313726, 1, 1,
0.2887687, -0.6770896, 1.463568, 0, 0.4235294, 1, 1,
0.2950374, -0.5208949, 2.027167, 0, 0.4196078, 1, 1,
0.2966449, 0.1890568, 0.4498065, 0, 0.4117647, 1, 1,
0.2968862, -0.9570502, 3.086421, 0, 0.4078431, 1, 1,
0.3002447, -1.667916, 3.452768, 0, 0.4, 1, 1,
0.3020509, 0.9140309, 0.271078, 0, 0.3921569, 1, 1,
0.3045971, 0.7166523, -0.6002597, 0, 0.3882353, 1, 1,
0.3047544, -1.846425, 2.729122, 0, 0.3803922, 1, 1,
0.3064136, -0.3575119, 2.661497, 0, 0.3764706, 1, 1,
0.3070424, 0.4693785, 0.5199124, 0, 0.3686275, 1, 1,
0.3076159, 1.162649, 2.302707, 0, 0.3647059, 1, 1,
0.3098969, 2.259447, -0.5182496, 0, 0.3568628, 1, 1,
0.3119535, -0.6063399, 3.167626, 0, 0.3529412, 1, 1,
0.31828, -0.07151296, 0.3422098, 0, 0.345098, 1, 1,
0.3230932, -1.288488, 2.52092, 0, 0.3411765, 1, 1,
0.3267136, -0.3907528, 3.168017, 0, 0.3333333, 1, 1,
0.3272843, -0.2891226, 3.955995, 0, 0.3294118, 1, 1,
0.3274568, 0.2491024, -0.7507079, 0, 0.3215686, 1, 1,
0.3279608, 0.7390497, -0.500797, 0, 0.3176471, 1, 1,
0.3285939, 0.9885364, 1.890232, 0, 0.3098039, 1, 1,
0.3316192, 0.1677248, 1.672494, 0, 0.3058824, 1, 1,
0.3364317, -0.6745487, 2.008439, 0, 0.2980392, 1, 1,
0.3365205, 1.655795, 1.860473, 0, 0.2901961, 1, 1,
0.3401456, 1.323339, 1.607428, 0, 0.2862745, 1, 1,
0.3423288, 0.815095, 1.149022, 0, 0.2784314, 1, 1,
0.3431496, -0.0183283, 0.6243708, 0, 0.2745098, 1, 1,
0.3449901, -0.1614756, 1.941126, 0, 0.2666667, 1, 1,
0.3486538, -0.7604698, 2.432807, 0, 0.2627451, 1, 1,
0.3508327, -0.9018894, 3.22245, 0, 0.254902, 1, 1,
0.3520105, -0.2461024, 2.225598, 0, 0.2509804, 1, 1,
0.3522557, 1.141958, 0.7934956, 0, 0.2431373, 1, 1,
0.3599142, -0.4422218, 2.926944, 0, 0.2392157, 1, 1,
0.3638501, 0.4482381, 1.719903, 0, 0.2313726, 1, 1,
0.3699132, -1.112732, 3.349096, 0, 0.227451, 1, 1,
0.3745603, -0.466578, 2.304649, 0, 0.2196078, 1, 1,
0.3751843, -0.236859, 0.5161201, 0, 0.2156863, 1, 1,
0.3768248, 1.15126, -2.675432, 0, 0.2078431, 1, 1,
0.3770726, 1.201392, 0.6177616, 0, 0.2039216, 1, 1,
0.3787211, 1.503325, 1.379531, 0, 0.1960784, 1, 1,
0.3869393, 0.9733766, 0.6622378, 0, 0.1882353, 1, 1,
0.3913435, -1.045189, 1.932475, 0, 0.1843137, 1, 1,
0.3948455, -0.8029512, 3.386215, 0, 0.1764706, 1, 1,
0.3973587, -0.5264459, 1.093056, 0, 0.172549, 1, 1,
0.3980561, -1.609461, 3.937259, 0, 0.1647059, 1, 1,
0.3992965, -0.8170766, 2.986392, 0, 0.1607843, 1, 1,
0.4031217, 0.8146459, 0.1393548, 0, 0.1529412, 1, 1,
0.405057, -1.290071, 4.763161, 0, 0.1490196, 1, 1,
0.4119896, 1.749189, 0.7126747, 0, 0.1411765, 1, 1,
0.412026, 1.224367, -0.7565398, 0, 0.1372549, 1, 1,
0.4129403, -0.8043367, 2.97013, 0, 0.1294118, 1, 1,
0.4135561, 0.4006948, 1.336464, 0, 0.1254902, 1, 1,
0.41662, 2.089027, 0.415789, 0, 0.1176471, 1, 1,
0.4194059, -0.6918458, 3.005127, 0, 0.1137255, 1, 1,
0.4236684, -0.02287774, 1.21679, 0, 0.1058824, 1, 1,
0.4251347, -0.0185721, 1.519393, 0, 0.09803922, 1, 1,
0.4269336, -1.301184, -0.3236452, 0, 0.09411765, 1, 1,
0.4277055, -0.05865348, 3.607691, 0, 0.08627451, 1, 1,
0.4294242, 0.1061774, 1.332421, 0, 0.08235294, 1, 1,
0.4344566, 0.5774435, -1.388936, 0, 0.07450981, 1, 1,
0.4346982, -0.6417183, 2.903603, 0, 0.07058824, 1, 1,
0.4382091, 0.6053767, 0.9163898, 0, 0.0627451, 1, 1,
0.444704, -0.5663564, 3.525766, 0, 0.05882353, 1, 1,
0.4537894, 0.4836739, 1.773461, 0, 0.05098039, 1, 1,
0.4578777, -0.8886294, 2.445607, 0, 0.04705882, 1, 1,
0.4610257, 0.3881515, -0.06667667, 0, 0.03921569, 1, 1,
0.4646922, 0.7478552, 0.9326282, 0, 0.03529412, 1, 1,
0.4676742, 1.377165, 0.06348454, 0, 0.02745098, 1, 1,
0.4726749, -2.077488, 3.157539, 0, 0.02352941, 1, 1,
0.4727961, -0.2080371, 2.49661, 0, 0.01568628, 1, 1,
0.4743353, 0.01420585, 2.524312, 0, 0.01176471, 1, 1,
0.4825827, 0.2303611, 1.196747, 0, 0.003921569, 1, 1,
0.4851983, 1.508824, 0.3458869, 0.003921569, 0, 1, 1,
0.4859592, -1.151807, 3.286023, 0.007843138, 0, 1, 1,
0.4919512, -0.0128446, 2.160451, 0.01568628, 0, 1, 1,
0.4927073, -0.897584, 1.139023, 0.01960784, 0, 1, 1,
0.4941166, -0.00749473, 2.449733, 0.02745098, 0, 1, 1,
0.4972782, -0.09189082, 1.621309, 0.03137255, 0, 1, 1,
0.4976978, 0.1694555, 0.9352033, 0.03921569, 0, 1, 1,
0.5030419, -1.616694, 2.218463, 0.04313726, 0, 1, 1,
0.5077353, 2.725244, 1.281125, 0.05098039, 0, 1, 1,
0.5078066, 0.2527965, 0.9263343, 0.05490196, 0, 1, 1,
0.5083587, 0.06313528, 1.403382, 0.0627451, 0, 1, 1,
0.5123929, -0.3767785, 2.940878, 0.06666667, 0, 1, 1,
0.5169866, 1.576982, 1.249527, 0.07450981, 0, 1, 1,
0.5171549, 0.2076376, 2.030523, 0.07843138, 0, 1, 1,
0.5207701, -0.1978617, 1.843237, 0.08627451, 0, 1, 1,
0.5226746, 1.413504, 0.852308, 0.09019608, 0, 1, 1,
0.5250869, -0.159278, 2.401953, 0.09803922, 0, 1, 1,
0.5257354, 1.138743, 0.5471971, 0.1058824, 0, 1, 1,
0.5287827, -0.1509169, 3.36686, 0.1098039, 0, 1, 1,
0.5306118, -0.7107878, 0.7790512, 0.1176471, 0, 1, 1,
0.5343754, -2.618534, 3.48484, 0.1215686, 0, 1, 1,
0.537985, -1.518513, 4.076239, 0.1294118, 0, 1, 1,
0.5404035, -0.09769717, 1.3328, 0.1333333, 0, 1, 1,
0.5433033, -0.00917263, 0.4375949, 0.1411765, 0, 1, 1,
0.5435145, 0.1756945, 1.728561, 0.145098, 0, 1, 1,
0.5502034, 1.499152, 1.181818, 0.1529412, 0, 1, 1,
0.5521899, 0.2807564, 0.3855065, 0.1568628, 0, 1, 1,
0.5590902, 0.7971155, 0.1038975, 0.1647059, 0, 1, 1,
0.5676364, -0.1387214, 3.185346, 0.1686275, 0, 1, 1,
0.5691229, 0.7391245, -0.4591047, 0.1764706, 0, 1, 1,
0.5754093, 0.3495901, 2.100393, 0.1803922, 0, 1, 1,
0.5807942, 0.7947842, 0.8077785, 0.1882353, 0, 1, 1,
0.5816771, -0.4165037, 1.356002, 0.1921569, 0, 1, 1,
0.5845161, 0.9610023, -0.2125884, 0.2, 0, 1, 1,
0.5852358, -0.6994882, 3.214714, 0.2078431, 0, 1, 1,
0.5890486, -0.193608, 1.701398, 0.2117647, 0, 1, 1,
0.6017587, 2.063016, 1.297529, 0.2196078, 0, 1, 1,
0.6019868, -2.179028, 2.718282, 0.2235294, 0, 1, 1,
0.6069041, -0.4991466, 2.158312, 0.2313726, 0, 1, 1,
0.6070384, -1.126935, 2.345795, 0.2352941, 0, 1, 1,
0.6087599, -0.07633411, 2.279097, 0.2431373, 0, 1, 1,
0.6132296, -0.4172056, 0.9017342, 0.2470588, 0, 1, 1,
0.6172307, 0.3809145, 0.577113, 0.254902, 0, 1, 1,
0.6181204, 0.5470904, 0.3056151, 0.2588235, 0, 1, 1,
0.6200772, -1.622501, 3.140439, 0.2666667, 0, 1, 1,
0.6277789, 1.36621, 0.2002696, 0.2705882, 0, 1, 1,
0.6327066, 1.606732, 1.104142, 0.2784314, 0, 1, 1,
0.63376, 0.03796712, -0.359904, 0.282353, 0, 1, 1,
0.6348857, 1.971, 0.1326981, 0.2901961, 0, 1, 1,
0.6350943, 0.9864969, -0.8649982, 0.2941177, 0, 1, 1,
0.6438066, 0.2047692, 1.449288, 0.3019608, 0, 1, 1,
0.6444396, 2.526978, 0.295774, 0.3098039, 0, 1, 1,
0.6492101, -0.8467589, 2.484728, 0.3137255, 0, 1, 1,
0.6587995, 0.8209415, 0.1592846, 0.3215686, 0, 1, 1,
0.6596863, -0.9909557, 2.411724, 0.3254902, 0, 1, 1,
0.6600842, 0.6649204, 1.437852, 0.3333333, 0, 1, 1,
0.6715003, -0.009386592, 1.213818, 0.3372549, 0, 1, 1,
0.6727127, -0.7791251, 1.571371, 0.345098, 0, 1, 1,
0.6733486, -1.27229, 2.931511, 0.3490196, 0, 1, 1,
0.6739312, -1.952373, 2.017728, 0.3568628, 0, 1, 1,
0.6747766, -1.629805, 1.423502, 0.3607843, 0, 1, 1,
0.676466, -0.3020413, 1.964452, 0.3686275, 0, 1, 1,
0.6808249, 0.5737879, -0.3664103, 0.372549, 0, 1, 1,
0.683164, 0.6928576, -0.02196446, 0.3803922, 0, 1, 1,
0.683186, 0.9612354, 0.8600699, 0.3843137, 0, 1, 1,
0.6842299, 0.2256116, -0.8930942, 0.3921569, 0, 1, 1,
0.6900306, -1.452619, 2.35079, 0.3960784, 0, 1, 1,
0.6905087, -1.010619, 4.270015, 0.4039216, 0, 1, 1,
0.6925914, 1.655273, 2.070227, 0.4117647, 0, 1, 1,
0.6983872, 0.0434578, 2.232761, 0.4156863, 0, 1, 1,
0.6987845, -0.6961175, 2.890054, 0.4235294, 0, 1, 1,
0.7112861, 1.450784, 0.2709523, 0.427451, 0, 1, 1,
0.7118671, -0.5397413, 2.384001, 0.4352941, 0, 1, 1,
0.7140066, -0.137567, 1.391608, 0.4392157, 0, 1, 1,
0.7146282, 0.8204477, -0.6439828, 0.4470588, 0, 1, 1,
0.7158859, -0.5947778, 2.633173, 0.4509804, 0, 1, 1,
0.7232251, -1.22387, 3.60631, 0.4588235, 0, 1, 1,
0.7242641, -0.7349424, 2.188686, 0.4627451, 0, 1, 1,
0.7245832, -0.8279666, 2.539281, 0.4705882, 0, 1, 1,
0.7294816, -0.1619022, 2.80808, 0.4745098, 0, 1, 1,
0.7358033, -0.09890082, 2.582376, 0.4823529, 0, 1, 1,
0.748898, 2.470689, -1.056, 0.4862745, 0, 1, 1,
0.7489547, 1.370312, 0.5973838, 0.4941176, 0, 1, 1,
0.7543063, 1.280679, 1.254827, 0.5019608, 0, 1, 1,
0.7553901, 0.2488537, 1.464814, 0.5058824, 0, 1, 1,
0.7597776, -0.06370711, 0.1455974, 0.5137255, 0, 1, 1,
0.7599954, 0.2701117, 2.756671, 0.5176471, 0, 1, 1,
0.7671399, -2.626704, 4.35474, 0.5254902, 0, 1, 1,
0.7715101, -0.04689131, 2.628946, 0.5294118, 0, 1, 1,
0.7723589, -0.9996333, 2.677506, 0.5372549, 0, 1, 1,
0.7739134, -0.6000019, 1.833116, 0.5411765, 0, 1, 1,
0.7750887, 0.2751057, 1.651895, 0.5490196, 0, 1, 1,
0.7816793, 1.246817, -0.1055766, 0.5529412, 0, 1, 1,
0.7831478, -0.3055319, 2.221789, 0.5607843, 0, 1, 1,
0.7842892, 0.3164783, -0.4768048, 0.5647059, 0, 1, 1,
0.7867213, -0.2759922, 1.055525, 0.572549, 0, 1, 1,
0.7876337, 0.1230954, 1.708481, 0.5764706, 0, 1, 1,
0.7898906, 0.6053786, 1.731974, 0.5843138, 0, 1, 1,
0.7910144, 0.5895451, 1.273893, 0.5882353, 0, 1, 1,
0.7920548, -0.04504096, 0.7525565, 0.5960785, 0, 1, 1,
0.7932491, -0.6432703, 2.133121, 0.6039216, 0, 1, 1,
0.8009666, -0.3785723, 2.340876, 0.6078432, 0, 1, 1,
0.8076428, -0.4466415, 2.55024, 0.6156863, 0, 1, 1,
0.8092467, 1.154021, 0.1361754, 0.6196079, 0, 1, 1,
0.8158411, 0.9167826, 0.7968343, 0.627451, 0, 1, 1,
0.8173836, -0.2833728, 1.26341, 0.6313726, 0, 1, 1,
0.8195632, 0.3520842, 0.953754, 0.6392157, 0, 1, 1,
0.8221166, 1.908595, 0.9811498, 0.6431373, 0, 1, 1,
0.8274499, 0.5949181, 1.335245, 0.6509804, 0, 1, 1,
0.828604, -0.357685, 1.022769, 0.654902, 0, 1, 1,
0.8319851, -0.944205, 1.883161, 0.6627451, 0, 1, 1,
0.8360255, 0.226769, 1.851992, 0.6666667, 0, 1, 1,
0.839129, 0.3837529, 0.6429818, 0.6745098, 0, 1, 1,
0.8412557, 0.7326651, 0.7764032, 0.6784314, 0, 1, 1,
0.8417801, -1.843791, 0.8504777, 0.6862745, 0, 1, 1,
0.8435374, 0.7115566, 0.5124536, 0.6901961, 0, 1, 1,
0.8466421, 0.2449418, 1.053829, 0.6980392, 0, 1, 1,
0.8508849, -0.7474719, 2.919908, 0.7058824, 0, 1, 1,
0.8517269, -0.9548062, 1.979122, 0.7098039, 0, 1, 1,
0.8521227, -0.9823495, 2.069118, 0.7176471, 0, 1, 1,
0.8547896, -0.9135182, 1.704616, 0.7215686, 0, 1, 1,
0.8556569, -0.2138731, 0.8494176, 0.7294118, 0, 1, 1,
0.8575905, -0.2609941, 2.597873, 0.7333333, 0, 1, 1,
0.857754, 0.9546621, 1.19149, 0.7411765, 0, 1, 1,
0.8715884, -2.305939, 3.714438, 0.7450981, 0, 1, 1,
0.8725963, -0.7094014, 0.9414797, 0.7529412, 0, 1, 1,
0.8732228, -0.3786342, 1.445316, 0.7568628, 0, 1, 1,
0.8759187, 2.37133, -0.4109376, 0.7647059, 0, 1, 1,
0.8767795, 0.5160499, 0.03806243, 0.7686275, 0, 1, 1,
0.8770344, -0.4836177, 0.8569447, 0.7764706, 0, 1, 1,
0.8795727, -1.813672, 2.574144, 0.7803922, 0, 1, 1,
0.8850345, -0.2029817, 1.438055, 0.7882353, 0, 1, 1,
0.889107, -0.4686, 2.479178, 0.7921569, 0, 1, 1,
0.9029303, -0.5122737, 1.302462, 0.8, 0, 1, 1,
0.9036883, -1.106647, 3.634781, 0.8078431, 0, 1, 1,
0.9047513, 0.5905082, 0.01394664, 0.8117647, 0, 1, 1,
0.9126992, 0.3818139, 0.2949278, 0.8196079, 0, 1, 1,
0.9137384, -0.2668617, 1.548743, 0.8235294, 0, 1, 1,
0.9144582, 1.401577, 0.7881749, 0.8313726, 0, 1, 1,
0.9161168, 0.334978, 1.33438, 0.8352941, 0, 1, 1,
0.9177865, 1.154931, 2.751732, 0.8431373, 0, 1, 1,
0.9236561, -0.9429814, 3.710312, 0.8470588, 0, 1, 1,
0.9242664, -0.1711044, 0.7053804, 0.854902, 0, 1, 1,
0.9244362, 0.4927258, 1.536771, 0.8588235, 0, 1, 1,
0.9256774, -0.1420281, 4.567686, 0.8666667, 0, 1, 1,
0.9272206, 0.5815775, -0.395462, 0.8705882, 0, 1, 1,
0.929187, -0.8932795, 2.488236, 0.8784314, 0, 1, 1,
0.9312565, -0.7556539, 0.09952846, 0.8823529, 0, 1, 1,
0.9329884, -0.2877342, 3.250575, 0.8901961, 0, 1, 1,
0.9348226, -2.378433, 4.063173, 0.8941177, 0, 1, 1,
0.9368773, -0.05891505, 1.294885, 0.9019608, 0, 1, 1,
0.942285, 0.343034, -0.2591916, 0.9098039, 0, 1, 1,
0.9432009, 0.5147743, 0.7140204, 0.9137255, 0, 1, 1,
0.9438538, 0.325388, 0.06572213, 0.9215686, 0, 1, 1,
0.9469855, -0.7055165, 1.968835, 0.9254902, 0, 1, 1,
0.9493769, -0.2108183, 2.112866, 0.9333333, 0, 1, 1,
0.9647705, -1.893533, 2.041416, 0.9372549, 0, 1, 1,
0.9685338, -2.104223, 2.117212, 0.945098, 0, 1, 1,
0.96868, 0.1063485, 0.6307268, 0.9490196, 0, 1, 1,
0.9695348, -0.0729212, 1.255178, 0.9568627, 0, 1, 1,
0.9783717, -0.6548089, 0.8463537, 0.9607843, 0, 1, 1,
0.9785711, -0.01611648, 3.117634, 0.9686275, 0, 1, 1,
0.9822429, 0.3426225, 0.7826483, 0.972549, 0, 1, 1,
0.9868874, 0.9953751, -0.3363889, 0.9803922, 0, 1, 1,
0.9920186, 1.465714, -0.6182117, 0.9843137, 0, 1, 1,
0.9921509, 1.315083, 1.464889, 0.9921569, 0, 1, 1,
0.9936985, 0.6434153, 1.276516, 0.9960784, 0, 1, 1,
1.003311, -0.3887928, 2.092891, 1, 0, 0.9960784, 1,
1.009199, 0.1603484, 2.787709, 1, 0, 0.9882353, 1,
1.011242, 0.06947334, 0.7209426, 1, 0, 0.9843137, 1,
1.011338, 1.528731, 0.3530805, 1, 0, 0.9764706, 1,
1.015684, -0.62164, 1.134481, 1, 0, 0.972549, 1,
1.022122, 0.1423213, 1.656319, 1, 0, 0.9647059, 1,
1.024891, 0.6897185, 0.5037869, 1, 0, 0.9607843, 1,
1.028391, 0.7287323, -0.006497508, 1, 0, 0.9529412, 1,
1.030927, -0.9485111, 3.291749, 1, 0, 0.9490196, 1,
1.03913, -0.6291509, 3.780421, 1, 0, 0.9411765, 1,
1.041124, 1.299239, 1.707203, 1, 0, 0.9372549, 1,
1.041706, -1.575775, 2.932396, 1, 0, 0.9294118, 1,
1.045126, -0.07834067, 1.926201, 1, 0, 0.9254902, 1,
1.054802, 1.586375, 0.4822215, 1, 0, 0.9176471, 1,
1.054888, 0.2224382, 1.387943, 1, 0, 0.9137255, 1,
1.054958, -0.1293571, 2.341484, 1, 0, 0.9058824, 1,
1.056776, 0.7352918, -0.05720405, 1, 0, 0.9019608, 1,
1.057888, -0.2449465, 1.608284, 1, 0, 0.8941177, 1,
1.058962, 0.2452769, 1.564374, 1, 0, 0.8862745, 1,
1.059504, -0.5817975, 1.650628, 1, 0, 0.8823529, 1,
1.061173, 0.6227366, 2.831131, 1, 0, 0.8745098, 1,
1.061256, -0.4074018, 0.9164191, 1, 0, 0.8705882, 1,
1.075661, 0.1070995, 0.09660216, 1, 0, 0.8627451, 1,
1.076043, 1.746491, 0.7640062, 1, 0, 0.8588235, 1,
1.080812, 1.510977, 2.253265, 1, 0, 0.8509804, 1,
1.082085, -0.5754239, 2.26293, 1, 0, 0.8470588, 1,
1.083919, -0.02433437, 1.160746, 1, 0, 0.8392157, 1,
1.088677, -1.610904, 2.248903, 1, 0, 0.8352941, 1,
1.08947, 0.9809422, 0.1946168, 1, 0, 0.827451, 1,
1.09206, 0.6491608, 1.685776, 1, 0, 0.8235294, 1,
1.097386, 1.486961, 0.524849, 1, 0, 0.8156863, 1,
1.099736, 0.3355435, 1.652772, 1, 0, 0.8117647, 1,
1.106311, -0.3129611, 3.15269, 1, 0, 0.8039216, 1,
1.110153, -1.787255, 2.601723, 1, 0, 0.7960784, 1,
1.113758, 0.7727107, 2.308849, 1, 0, 0.7921569, 1,
1.11748, 0.3332528, 0.9553136, 1, 0, 0.7843137, 1,
1.128242, -0.3508662, 2.012831, 1, 0, 0.7803922, 1,
1.13292, 0.3584991, 2.069424, 1, 0, 0.772549, 1,
1.136266, -1.52451, 1.895913, 1, 0, 0.7686275, 1,
1.136333, -0.6688619, 1.064307, 1, 0, 0.7607843, 1,
1.140509, -0.3545485, 0.3908691, 1, 0, 0.7568628, 1,
1.141222, 1.127082, 1.452576, 1, 0, 0.7490196, 1,
1.141815, -0.1291208, 0.647377, 1, 0, 0.7450981, 1,
1.142923, -1.827231, 1.629074, 1, 0, 0.7372549, 1,
1.150232, -1.68437, 3.310812, 1, 0, 0.7333333, 1,
1.153597, 1.200528, 0.8814803, 1, 0, 0.7254902, 1,
1.167125, -1.792249, 3.472438, 1, 0, 0.7215686, 1,
1.175623, 0.2517799, 1.216706, 1, 0, 0.7137255, 1,
1.177867, 1.368307, 1.193852, 1, 0, 0.7098039, 1,
1.178092, 0.009572403, 2.060464, 1, 0, 0.7019608, 1,
1.18687, 0.6022328, 0.8649961, 1, 0, 0.6941177, 1,
1.191938, -1.101836, 2.505438, 1, 0, 0.6901961, 1,
1.192077, 0.1863035, 1.539946, 1, 0, 0.682353, 1,
1.197794, -0.3844979, 2.951203, 1, 0, 0.6784314, 1,
1.198491, 0.4379436, 1.175914, 1, 0, 0.6705883, 1,
1.200672, -0.879771, 3.636194, 1, 0, 0.6666667, 1,
1.211959, 1.150849, -0.4827564, 1, 0, 0.6588235, 1,
1.214943, 1.649752, 1.88243, 1, 0, 0.654902, 1,
1.215186, -0.2933766, 2.755231, 1, 0, 0.6470588, 1,
1.227986, 1.795411, 0.5102187, 1, 0, 0.6431373, 1,
1.231049, -1.154127, 2.155262, 1, 0, 0.6352941, 1,
1.246111, 1.025058, 1.654393, 1, 0, 0.6313726, 1,
1.250648, -0.05244566, 3.080849, 1, 0, 0.6235294, 1,
1.263217, -1.666278, 2.700925, 1, 0, 0.6196079, 1,
1.282088, -0.6353056, 2.59625, 1, 0, 0.6117647, 1,
1.28888, 0.1213186, 1.139147, 1, 0, 0.6078432, 1,
1.290618, 0.3304055, 0.3651259, 1, 0, 0.6, 1,
1.292594, 0.9681822, 2.220705, 1, 0, 0.5921569, 1,
1.303728, -0.01020483, 2.005567, 1, 0, 0.5882353, 1,
1.311935, -1.090979, 1.624587, 1, 0, 0.5803922, 1,
1.314846, 0.8020371, 0.7458395, 1, 0, 0.5764706, 1,
1.3292, -0.1980907, 0.951253, 1, 0, 0.5686275, 1,
1.329495, -0.7353661, 2.238929, 1, 0, 0.5647059, 1,
1.330636, -0.1427726, 0.4090849, 1, 0, 0.5568628, 1,
1.359169, -0.03369035, 1.365997, 1, 0, 0.5529412, 1,
1.372391, -0.4579463, 2.602167, 1, 0, 0.5450981, 1,
1.380272, -0.1590876, 0.4579607, 1, 0, 0.5411765, 1,
1.381298, -1.925319, 4.655035, 1, 0, 0.5333334, 1,
1.381829, -1.934715, 2.934029, 1, 0, 0.5294118, 1,
1.38705, -0.09268353, 1.724182, 1, 0, 0.5215687, 1,
1.394569, -0.5970557, 3.32402, 1, 0, 0.5176471, 1,
1.396232, 1.400404, -0.6570933, 1, 0, 0.509804, 1,
1.396426, -0.3896986, 2.433616, 1, 0, 0.5058824, 1,
1.400712, -0.5288966, 1.080625, 1, 0, 0.4980392, 1,
1.414218, 0.624485, 1.803852, 1, 0, 0.4901961, 1,
1.41697, -0.03916789, 2.064592, 1, 0, 0.4862745, 1,
1.418276, -1.199045, 0.8742774, 1, 0, 0.4784314, 1,
1.437157, 0.6479638, 0.1021389, 1, 0, 0.4745098, 1,
1.438849, -0.991477, 1.379027, 1, 0, 0.4666667, 1,
1.442091, -1.136974, 1.705679, 1, 0, 0.4627451, 1,
1.445085, -0.9914604, 0.4736968, 1, 0, 0.454902, 1,
1.445941, -1.087685, 0.8086263, 1, 0, 0.4509804, 1,
1.459228, 0.1847558, 2.824219, 1, 0, 0.4431373, 1,
1.459967, 1.17543, 3.216316, 1, 0, 0.4392157, 1,
1.463061, 0.01482011, 0.8463283, 1, 0, 0.4313726, 1,
1.46477, 0.2926735, 0.734912, 1, 0, 0.427451, 1,
1.467788, 0.02926276, 2.047225, 1, 0, 0.4196078, 1,
1.482975, 0.3625115, 2.412295, 1, 0, 0.4156863, 1,
1.49365, 2.141492, 0.1178261, 1, 0, 0.4078431, 1,
1.494518, -0.04974616, 1.96409, 1, 0, 0.4039216, 1,
1.500861, 0.05480095, 0.8680723, 1, 0, 0.3960784, 1,
1.524955, 0.06187847, 0.1457725, 1, 0, 0.3882353, 1,
1.531698, 2.20785, 0.2340498, 1, 0, 0.3843137, 1,
1.535161, -0.4411922, 1.736909, 1, 0, 0.3764706, 1,
1.536056, -0.7909193, 2.955422, 1, 0, 0.372549, 1,
1.536603, 1.62845, 1.480046, 1, 0, 0.3647059, 1,
1.543818, -0.3597915, 2.218619, 1, 0, 0.3607843, 1,
1.549405, 0.07250921, 1.33144, 1, 0, 0.3529412, 1,
1.565243, -1.632881, 1.22727, 1, 0, 0.3490196, 1,
1.566378, -0.4307111, 3.517269, 1, 0, 0.3411765, 1,
1.568288, 0.3450615, 1.764075, 1, 0, 0.3372549, 1,
1.569513, 0.3893274, 1.959477, 1, 0, 0.3294118, 1,
1.578204, 0.6466144, 1.83868, 1, 0, 0.3254902, 1,
1.580459, 1.259771, 1.836559, 1, 0, 0.3176471, 1,
1.594574, -0.1209325, 2.241436, 1, 0, 0.3137255, 1,
1.614692, -0.9042284, 2.8333, 1, 0, 0.3058824, 1,
1.62133, 0.9321188, 1.183634, 1, 0, 0.2980392, 1,
1.634291, 0.6769577, 1.018747, 1, 0, 0.2941177, 1,
1.638572, -1.902263, 2.239043, 1, 0, 0.2862745, 1,
1.646594, -0.3969427, 1.020397, 1, 0, 0.282353, 1,
1.655775, 0.6792133, 1.950969, 1, 0, 0.2745098, 1,
1.664521, -0.6607897, 2.029455, 1, 0, 0.2705882, 1,
1.677439, -1.128966, 2.209278, 1, 0, 0.2627451, 1,
1.692875, -0.6020344, 1.810871, 1, 0, 0.2588235, 1,
1.727749, 0.2344218, 1.021376, 1, 0, 0.2509804, 1,
1.729245, -1.050451, 2.622371, 1, 0, 0.2470588, 1,
1.73322, -0.154003, 2.652484, 1, 0, 0.2392157, 1,
1.747829, 0.1629273, 0.3298081, 1, 0, 0.2352941, 1,
1.753468, 0.8362627, 0.4908888, 1, 0, 0.227451, 1,
1.764073, -1.167801, 1.141363, 1, 0, 0.2235294, 1,
1.774368, 0.05687127, 0.5160106, 1, 0, 0.2156863, 1,
1.777358, -0.6089725, 0.992664, 1, 0, 0.2117647, 1,
1.778477, -1.424204, 3.187798, 1, 0, 0.2039216, 1,
1.778994, -0.05458973, 1.550812, 1, 0, 0.1960784, 1,
1.782451, -0.2125195, 2.11735, 1, 0, 0.1921569, 1,
1.812426, -1.146852, 3.767843, 1, 0, 0.1843137, 1,
1.813771, 0.06839958, 1.532122, 1, 0, 0.1803922, 1,
1.816585, -0.0836881, 2.470785, 1, 0, 0.172549, 1,
1.81696, -0.5644873, 2.113888, 1, 0, 0.1686275, 1,
1.823342, -0.002476061, 0.06715451, 1, 0, 0.1607843, 1,
1.859428, 0.5478848, 0.1608207, 1, 0, 0.1568628, 1,
1.880176, -1.862754, 1.620932, 1, 0, 0.1490196, 1,
1.893804, -1.390315, 1.109191, 1, 0, 0.145098, 1,
1.956294, -0.4316522, 1.68381, 1, 0, 0.1372549, 1,
1.959349, -0.1355266, 0.2759887, 1, 0, 0.1333333, 1,
1.960232, 1.562389, 1.382437, 1, 0, 0.1254902, 1,
1.965283, -0.392002, 0.8891372, 1, 0, 0.1215686, 1,
1.971359, 0.01990172, 1.253196, 1, 0, 0.1137255, 1,
1.981424, 0.951532, -0.3912782, 1, 0, 0.1098039, 1,
1.988642, 0.9238922, 2.262815, 1, 0, 0.1019608, 1,
2.00591, 1.720603, -0.3586728, 1, 0, 0.09411765, 1,
2.015956, -0.4117597, 0.941961, 1, 0, 0.09019608, 1,
2.053835, -0.4286321, 3.167066, 1, 0, 0.08235294, 1,
2.069283, 0.7130434, 1.988179, 1, 0, 0.07843138, 1,
2.135334, 0.626496, 2.124258, 1, 0, 0.07058824, 1,
2.166702, -0.8256441, 1.483698, 1, 0, 0.06666667, 1,
2.176196, 0.9577739, 1.75861, 1, 0, 0.05882353, 1,
2.185262, -1.371081, 2.123152, 1, 0, 0.05490196, 1,
2.200036, 0.6236295, 1.562272, 1, 0, 0.04705882, 1,
2.236095, -0.6931277, 1.663319, 1, 0, 0.04313726, 1,
2.279298, -0.322655, 0.4222297, 1, 0, 0.03529412, 1,
2.325397, -0.8219469, 3.720644, 1, 0, 0.03137255, 1,
2.421834, 0.8947102, 1.603416, 1, 0, 0.02352941, 1,
2.468186, -0.9351922, 1.92846, 1, 0, 0.01960784, 1,
2.524887, -0.644424, 1.706416, 1, 0, 0.01176471, 1,
2.616244, -0.1823957, 1.735222, 1, 0, 0.007843138, 1
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
-0.1736063, -4.404596, -6.74432, 0, -0.5, 0.5, 0.5,
-0.1736063, -4.404596, -6.74432, 1, -0.5, 0.5, 0.5,
-0.1736063, -4.404596, -6.74432, 1, 1.5, 0.5, 0.5,
-0.1736063, -4.404596, -6.74432, 0, 1.5, 0.5, 0.5
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
-3.909216, -0.02749288, -6.74432, 0, -0.5, 0.5, 0.5,
-3.909216, -0.02749288, -6.74432, 1, -0.5, 0.5, 0.5,
-3.909216, -0.02749288, -6.74432, 1, 1.5, 0.5, 0.5,
-3.909216, -0.02749288, -6.74432, 0, 1.5, 0.5, 0.5
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
-3.909216, -4.404596, 0.3962605, 0, -0.5, 0.5, 0.5,
-3.909216, -4.404596, 0.3962605, 1, -0.5, 0.5, 0.5,
-3.909216, -4.404596, 0.3962605, 1, 1.5, 0.5, 0.5,
-3.909216, -4.404596, 0.3962605, 0, 1.5, 0.5, 0.5
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
-2, -3.394495, -5.096494,
2, -3.394495, -5.096494,
-2, -3.394495, -5.096494,
-2, -3.562845, -5.371132,
-1, -3.394495, -5.096494,
-1, -3.562845, -5.371132,
0, -3.394495, -5.096494,
0, -3.562845, -5.371132,
1, -3.394495, -5.096494,
1, -3.562845, -5.371132,
2, -3.394495, -5.096494,
2, -3.562845, -5.371132
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
-2, -3.899546, -5.920407, 0, -0.5, 0.5, 0.5,
-2, -3.899546, -5.920407, 1, -0.5, 0.5, 0.5,
-2, -3.899546, -5.920407, 1, 1.5, 0.5, 0.5,
-2, -3.899546, -5.920407, 0, 1.5, 0.5, 0.5,
-1, -3.899546, -5.920407, 0, -0.5, 0.5, 0.5,
-1, -3.899546, -5.920407, 1, -0.5, 0.5, 0.5,
-1, -3.899546, -5.920407, 1, 1.5, 0.5, 0.5,
-1, -3.899546, -5.920407, 0, 1.5, 0.5, 0.5,
0, -3.899546, -5.920407, 0, -0.5, 0.5, 0.5,
0, -3.899546, -5.920407, 1, -0.5, 0.5, 0.5,
0, -3.899546, -5.920407, 1, 1.5, 0.5, 0.5,
0, -3.899546, -5.920407, 0, 1.5, 0.5, 0.5,
1, -3.899546, -5.920407, 0, -0.5, 0.5, 0.5,
1, -3.899546, -5.920407, 1, -0.5, 0.5, 0.5,
1, -3.899546, -5.920407, 1, 1.5, 0.5, 0.5,
1, -3.899546, -5.920407, 0, 1.5, 0.5, 0.5,
2, -3.899546, -5.920407, 0, -0.5, 0.5, 0.5,
2, -3.899546, -5.920407, 1, -0.5, 0.5, 0.5,
2, -3.899546, -5.920407, 1, 1.5, 0.5, 0.5,
2, -3.899546, -5.920407, 0, 1.5, 0.5, 0.5
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
-3.047152, -3, -5.096494,
-3.047152, 3, -5.096494,
-3.047152, -3, -5.096494,
-3.19083, -3, -5.371132,
-3.047152, -2, -5.096494,
-3.19083, -2, -5.371132,
-3.047152, -1, -5.096494,
-3.19083, -1, -5.371132,
-3.047152, 0, -5.096494,
-3.19083, 0, -5.371132,
-3.047152, 1, -5.096494,
-3.19083, 1, -5.371132,
-3.047152, 2, -5.096494,
-3.19083, 2, -5.371132,
-3.047152, 3, -5.096494,
-3.19083, 3, -5.371132
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
-3.478184, -3, -5.920407, 0, -0.5, 0.5, 0.5,
-3.478184, -3, -5.920407, 1, -0.5, 0.5, 0.5,
-3.478184, -3, -5.920407, 1, 1.5, 0.5, 0.5,
-3.478184, -3, -5.920407, 0, 1.5, 0.5, 0.5,
-3.478184, -2, -5.920407, 0, -0.5, 0.5, 0.5,
-3.478184, -2, -5.920407, 1, -0.5, 0.5, 0.5,
-3.478184, -2, -5.920407, 1, 1.5, 0.5, 0.5,
-3.478184, -2, -5.920407, 0, 1.5, 0.5, 0.5,
-3.478184, -1, -5.920407, 0, -0.5, 0.5, 0.5,
-3.478184, -1, -5.920407, 1, -0.5, 0.5, 0.5,
-3.478184, -1, -5.920407, 1, 1.5, 0.5, 0.5,
-3.478184, -1, -5.920407, 0, 1.5, 0.5, 0.5,
-3.478184, 0, -5.920407, 0, -0.5, 0.5, 0.5,
-3.478184, 0, -5.920407, 1, -0.5, 0.5, 0.5,
-3.478184, 0, -5.920407, 1, 1.5, 0.5, 0.5,
-3.478184, 0, -5.920407, 0, 1.5, 0.5, 0.5,
-3.478184, 1, -5.920407, 0, -0.5, 0.5, 0.5,
-3.478184, 1, -5.920407, 1, -0.5, 0.5, 0.5,
-3.478184, 1, -5.920407, 1, 1.5, 0.5, 0.5,
-3.478184, 1, -5.920407, 0, 1.5, 0.5, 0.5,
-3.478184, 2, -5.920407, 0, -0.5, 0.5, 0.5,
-3.478184, 2, -5.920407, 1, -0.5, 0.5, 0.5,
-3.478184, 2, -5.920407, 1, 1.5, 0.5, 0.5,
-3.478184, 2, -5.920407, 0, 1.5, 0.5, 0.5,
-3.478184, 3, -5.920407, 0, -0.5, 0.5, 0.5,
-3.478184, 3, -5.920407, 1, -0.5, 0.5, 0.5,
-3.478184, 3, -5.920407, 1, 1.5, 0.5, 0.5,
-3.478184, 3, -5.920407, 0, 1.5, 0.5, 0.5
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
-3.047152, -3.394495, -4,
-3.047152, -3.394495, 4,
-3.047152, -3.394495, -4,
-3.19083, -3.562845, -4,
-3.047152, -3.394495, -2,
-3.19083, -3.562845, -2,
-3.047152, -3.394495, 0,
-3.19083, -3.562845, 0,
-3.047152, -3.394495, 2,
-3.19083, -3.562845, 2,
-3.047152, -3.394495, 4,
-3.19083, -3.562845, 4
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
-3.478184, -3.899546, -4, 0, -0.5, 0.5, 0.5,
-3.478184, -3.899546, -4, 1, -0.5, 0.5, 0.5,
-3.478184, -3.899546, -4, 1, 1.5, 0.5, 0.5,
-3.478184, -3.899546, -4, 0, 1.5, 0.5, 0.5,
-3.478184, -3.899546, -2, 0, -0.5, 0.5, 0.5,
-3.478184, -3.899546, -2, 1, -0.5, 0.5, 0.5,
-3.478184, -3.899546, -2, 1, 1.5, 0.5, 0.5,
-3.478184, -3.899546, -2, 0, 1.5, 0.5, 0.5,
-3.478184, -3.899546, 0, 0, -0.5, 0.5, 0.5,
-3.478184, -3.899546, 0, 1, -0.5, 0.5, 0.5,
-3.478184, -3.899546, 0, 1, 1.5, 0.5, 0.5,
-3.478184, -3.899546, 0, 0, 1.5, 0.5, 0.5,
-3.478184, -3.899546, 2, 0, -0.5, 0.5, 0.5,
-3.478184, -3.899546, 2, 1, -0.5, 0.5, 0.5,
-3.478184, -3.899546, 2, 1, 1.5, 0.5, 0.5,
-3.478184, -3.899546, 2, 0, 1.5, 0.5, 0.5,
-3.478184, -3.899546, 4, 0, -0.5, 0.5, 0.5,
-3.478184, -3.899546, 4, 1, -0.5, 0.5, 0.5,
-3.478184, -3.899546, 4, 1, 1.5, 0.5, 0.5,
-3.478184, -3.899546, 4, 0, 1.5, 0.5, 0.5
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
-3.047152, -3.394495, -5.096494,
-3.047152, 3.339509, -5.096494,
-3.047152, -3.394495, 5.889015,
-3.047152, 3.339509, 5.889015,
-3.047152, -3.394495, -5.096494,
-3.047152, -3.394495, 5.889015,
-3.047152, 3.339509, -5.096494,
-3.047152, 3.339509, 5.889015,
-3.047152, -3.394495, -5.096494,
2.69994, -3.394495, -5.096494,
-3.047152, -3.394495, 5.889015,
2.69994, -3.394495, 5.889015,
-3.047152, 3.339509, -5.096494,
2.69994, 3.339509, -5.096494,
-3.047152, 3.339509, 5.889015,
2.69994, 3.339509, 5.889015,
2.69994, -3.394495, -5.096494,
2.69994, 3.339509, -5.096494,
2.69994, -3.394495, 5.889015,
2.69994, 3.339509, 5.889015,
2.69994, -3.394495, -5.096494,
2.69994, -3.394495, 5.889015,
2.69994, 3.339509, -5.096494,
2.69994, 3.339509, 5.889015
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
var radius = 7.533807;
var distance = 33.51876;
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
mvMatrix.translate( 0.1736063, 0.02749288, -0.3962605 );
mvMatrix.scale( 1.41736, 1.209637, 0.741495 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.51876);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
fentin<-read.table("fentin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fentin$V2
```

```
## Error in eval(expr, envir, enclos): object 'fentin' not found
```

```r
y<-fentin$V3
```

```
## Error in eval(expr, envir, enclos): object 'fentin' not found
```

```r
z<-fentin$V4
```

```
## Error in eval(expr, envir, enclos): object 'fentin' not found
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
-2.963457, 0.6849734, -0.7440729, 0, 0, 1, 1, 1,
-2.706128, 0.9039259, -3.838053, 1, 0, 0, 1, 1,
-2.693088, 1.229905, -0.6519684, 1, 0, 0, 1, 1,
-2.664957, 1.078816, -2.233997, 1, 0, 0, 1, 1,
-2.639315, -0.04824675, -3.002753, 1, 0, 0, 1, 1,
-2.598023, -0.5379068, -1.532365, 1, 0, 0, 1, 1,
-2.500225, -1.653756, -0.8346166, 0, 0, 0, 1, 1,
-2.49939, -0.7381117, -1.576152, 0, 0, 0, 1, 1,
-2.467818, -1.497141, -2.713761, 0, 0, 0, 1, 1,
-2.360108, -0.2729247, -0.4877084, 0, 0, 0, 1, 1,
-2.346365, -0.8919284, -1.028525, 0, 0, 0, 1, 1,
-2.290329, -0.912849, -2.349237, 0, 0, 0, 1, 1,
-2.281351, -0.1318255, -1.639006, 0, 0, 0, 1, 1,
-2.279329, 0.06466846, -1.369059, 1, 1, 1, 1, 1,
-2.265926, -1.591761, -1.652841, 1, 1, 1, 1, 1,
-2.265026, 2.229642, -2.129779, 1, 1, 1, 1, 1,
-2.130351, -0.10545, -1.902681, 1, 1, 1, 1, 1,
-2.118346, -0.5280204, -2.082701, 1, 1, 1, 1, 1,
-2.106066, -0.3228791, -0.9335507, 1, 1, 1, 1, 1,
-2.081028, 0.9939902, 0.5452671, 1, 1, 1, 1, 1,
-2.059834, 0.007723981, -1.193367, 1, 1, 1, 1, 1,
-2.050495, 0.1234474, -0.902068, 1, 1, 1, 1, 1,
-2.045283, -0.674034, -2.633285, 1, 1, 1, 1, 1,
-2.017597, 0.906944, -1.920605, 1, 1, 1, 1, 1,
-2.016841, -1.036952, -3.089289, 1, 1, 1, 1, 1,
-1.98856, 0.1878699, -1.349364, 1, 1, 1, 1, 1,
-1.933537, -0.2517906, -1.441053, 1, 1, 1, 1, 1,
-1.912136, 0.4821447, -1.641247, 1, 1, 1, 1, 1,
-1.903423, 0.3950539, -2.553865, 0, 0, 1, 1, 1,
-1.889016, 0.6468965, -0.1316813, 1, 0, 0, 1, 1,
-1.883256, 1.240614, -1.607342, 1, 0, 0, 1, 1,
-1.879376, 1.313051, -2.274189, 1, 0, 0, 1, 1,
-1.876194, 0.2149262, -0.8788072, 1, 0, 0, 1, 1,
-1.849235, -2.797469, -4.246593, 1, 0, 0, 1, 1,
-1.813152, -0.188917, -2.774556, 0, 0, 0, 1, 1,
-1.773271, -1.93913, -1.697938, 0, 0, 0, 1, 1,
-1.768835, -0.09704487, -1.584854, 0, 0, 0, 1, 1,
-1.751534, 0.1793604, 0.01788832, 0, 0, 0, 1, 1,
-1.740047, -0.6955007, -3.756387, 0, 0, 0, 1, 1,
-1.72935, -0.05156843, -0.5292543, 0, 0, 0, 1, 1,
-1.723211, -1.105165, -1.236075, 0, 0, 0, 1, 1,
-1.721311, -1.211611, -1.191803, 1, 1, 1, 1, 1,
-1.705824, -0.215853, -1.567742, 1, 1, 1, 1, 1,
-1.700651, 0.005228809, -2.852612, 1, 1, 1, 1, 1,
-1.697574, 1.035649, -2.385363, 1, 1, 1, 1, 1,
-1.691416, -0.6213742, -2.499135, 1, 1, 1, 1, 1,
-1.679699, 1.331043, 1.119032, 1, 1, 1, 1, 1,
-1.677971, -0.8130729, -1.598852, 1, 1, 1, 1, 1,
-1.675928, 0.9773496, -2.599508, 1, 1, 1, 1, 1,
-1.655332, 1.778978, -0.7039067, 1, 1, 1, 1, 1,
-1.653799, -0.6266034, -1.424374, 1, 1, 1, 1, 1,
-1.650519, -0.7506344, -2.443927, 1, 1, 1, 1, 1,
-1.641706, -1.222588, -1.502382, 1, 1, 1, 1, 1,
-1.612881, -0.9754459, -3.083964, 1, 1, 1, 1, 1,
-1.599421, 1.821035, 0.6181388, 1, 1, 1, 1, 1,
-1.595611, 0.06822462, -2.753097, 1, 1, 1, 1, 1,
-1.591334, 0.2366694, -1.463447, 0, 0, 1, 1, 1,
-1.58898, 0.1924532, -0.2717825, 1, 0, 0, 1, 1,
-1.587229, -0.5477759, -1.782681, 1, 0, 0, 1, 1,
-1.586814, 0.6145444, -1.602466, 1, 0, 0, 1, 1,
-1.570039, 1.772689, -0.5383576, 1, 0, 0, 1, 1,
-1.565951, 1.994349, -0.1519689, 1, 0, 0, 1, 1,
-1.553002, 1.671076, -1.109217, 0, 0, 0, 1, 1,
-1.540341, 0.09189225, -1.571859, 0, 0, 0, 1, 1,
-1.532791, -0.1165968, -1.555104, 0, 0, 0, 1, 1,
-1.527101, 0.01802207, -0.5200449, 0, 0, 0, 1, 1,
-1.516662, -0.8598855, -0.873745, 0, 0, 0, 1, 1,
-1.512616, -0.1950116, -2.679858, 0, 0, 0, 1, 1,
-1.501782, -0.2202778, -1.487389, 0, 0, 0, 1, 1,
-1.479769, -0.1388477, -2.042163, 1, 1, 1, 1, 1,
-1.479654, -0.964316, -2.601663, 1, 1, 1, 1, 1,
-1.475605, 1.259964, -2.371495, 1, 1, 1, 1, 1,
-1.461829, 0.2414778, -1.161503, 1, 1, 1, 1, 1,
-1.460792, 0.3710598, -0.8394158, 1, 1, 1, 1, 1,
-1.451643, 0.2648128, -0.6925974, 1, 1, 1, 1, 1,
-1.439323, -0.2689224, -2.832037, 1, 1, 1, 1, 1,
-1.430765, 0.5176843, 1.103558, 1, 1, 1, 1, 1,
-1.430263, 0.7433967, -0.3379384, 1, 1, 1, 1, 1,
-1.430013, 1.435727, -0.0190613, 1, 1, 1, 1, 1,
-1.425596, 0.02330863, -1.571367, 1, 1, 1, 1, 1,
-1.422129, -0.4583527, -1.84128, 1, 1, 1, 1, 1,
-1.414031, -0.9553813, -2.530224, 1, 1, 1, 1, 1,
-1.409838, 2.103634, -0.8269413, 1, 1, 1, 1, 1,
-1.393487, -0.3821486, -2.603224, 1, 1, 1, 1, 1,
-1.382989, -2.411511, -3.396665, 0, 0, 1, 1, 1,
-1.374131, 0.1965435, -2.618976, 1, 0, 0, 1, 1,
-1.370988, 0.5313904, 0.802043, 1, 0, 0, 1, 1,
-1.364129, 0.002214277, -2.309487, 1, 0, 0, 1, 1,
-1.34537, 0.3634107, -2.26766, 1, 0, 0, 1, 1,
-1.330238, -0.1616413, -1.346102, 1, 0, 0, 1, 1,
-1.33023, -1.371079, -3.119986, 0, 0, 0, 1, 1,
-1.316651, 0.6071475, -0.4638875, 0, 0, 0, 1, 1,
-1.316358, 1.278481, -2.083842, 0, 0, 0, 1, 1,
-1.316026, 0.3142252, -2.155397, 0, 0, 0, 1, 1,
-1.307562, -1.041297, -1.751586, 0, 0, 0, 1, 1,
-1.300724, -0.2559072, -0.1685733, 0, 0, 0, 1, 1,
-1.292493, 2.196744, 1.775606, 0, 0, 0, 1, 1,
-1.288337, -0.459126, -2.458375, 1, 1, 1, 1, 1,
-1.284448, 0.03018519, -0.4889892, 1, 1, 1, 1, 1,
-1.268454, -0.182742, -2.451895, 1, 1, 1, 1, 1,
-1.26254, 0.3808927, -1.788076, 1, 1, 1, 1, 1,
-1.260156, 0.2287385, -2.125073, 1, 1, 1, 1, 1,
-1.250353, 0.4311836, -0.5195881, 1, 1, 1, 1, 1,
-1.226856, 0.1431997, 0.1829055, 1, 1, 1, 1, 1,
-1.226607, -0.8500987, -3.013691, 1, 1, 1, 1, 1,
-1.215984, -1.575089, -2.393468, 1, 1, 1, 1, 1,
-1.211974, 0.6880268, -0.8226916, 1, 1, 1, 1, 1,
-1.204619, -1.498394, -2.018156, 1, 1, 1, 1, 1,
-1.203199, 0.3062676, -0.7327357, 1, 1, 1, 1, 1,
-1.200306, -0.5442404, -0.9187223, 1, 1, 1, 1, 1,
-1.200205, -0.4613006, -2.326155, 1, 1, 1, 1, 1,
-1.193007, -0.2828302, -2.783687, 1, 1, 1, 1, 1,
-1.18987, 1.193407, -2.310351, 0, 0, 1, 1, 1,
-1.188908, 0.7563948, -0.8846884, 1, 0, 0, 1, 1,
-1.179298, -2.676598, -2.2609, 1, 0, 0, 1, 1,
-1.174367, -1.269682, -3.64431, 1, 0, 0, 1, 1,
-1.157659, -0.8331539, -1.307961, 1, 0, 0, 1, 1,
-1.151586, 1.526327, 1.520112, 1, 0, 0, 1, 1,
-1.14986, 0.7390026, -0.4744011, 0, 0, 0, 1, 1,
-1.141281, 0.9962641, 0.6112661, 0, 0, 0, 1, 1,
-1.139417, 0.2775077, -0.9485412, 0, 0, 0, 1, 1,
-1.136293, -0.9030547, -4.057542, 0, 0, 0, 1, 1,
-1.133261, -0.003704089, -0.01724518, 0, 0, 0, 1, 1,
-1.130494, 2.109099, -2.284385, 0, 0, 0, 1, 1,
-1.126444, -1.452449, -2.677819, 0, 0, 0, 1, 1,
-1.125301, 0.165859, -1.598745, 1, 1, 1, 1, 1,
-1.125251, -1.319775, -0.9843308, 1, 1, 1, 1, 1,
-1.118454, -1.045152, -2.217958, 1, 1, 1, 1, 1,
-1.118068, -0.392854, -2.022749, 1, 1, 1, 1, 1,
-1.106293, 0.02364132, 0.7922266, 1, 1, 1, 1, 1,
-1.103343, -1.003988, -2.932111, 1, 1, 1, 1, 1,
-1.095788, 0.1148809, -2.372425, 1, 1, 1, 1, 1,
-1.092476, -3.296427, -3.459728, 1, 1, 1, 1, 1,
-1.091752, -0.5055581, -1.095458, 1, 1, 1, 1, 1,
-1.086355, -0.2826229, -1.901293, 1, 1, 1, 1, 1,
-1.086278, -0.8437341, -2.655073, 1, 1, 1, 1, 1,
-1.084254, -0.06090503, -1.285089, 1, 1, 1, 1, 1,
-1.073184, -1.180736, -2.903343, 1, 1, 1, 1, 1,
-1.072029, -1.861821, -2.303095, 1, 1, 1, 1, 1,
-1.068663, -0.6321775, -1.825701, 1, 1, 1, 1, 1,
-1.066036, 0.2509514, -1.278433, 0, 0, 1, 1, 1,
-1.055634, 0.5744169, -1.508984, 1, 0, 0, 1, 1,
-1.04428, -0.7184795, -1.491722, 1, 0, 0, 1, 1,
-1.040873, -1.135239, -4.180186, 1, 0, 0, 1, 1,
-1.029752, 0.439858, -3.525681, 1, 0, 0, 1, 1,
-1.019871, 1.969119, -1.179589, 1, 0, 0, 1, 1,
-1.013497, 0.6178845, 0.9066975, 0, 0, 0, 1, 1,
-1.012838, 0.02179897, -0.7339517, 0, 0, 0, 1, 1,
-0.9954271, -0.9803453, -2.798405, 0, 0, 0, 1, 1,
-0.9924557, -0.823266, -0.2838645, 0, 0, 0, 1, 1,
-0.9923453, -1.537897, -2.170233, 0, 0, 0, 1, 1,
-0.9921711, 0.3232656, -3.016048, 0, 0, 0, 1, 1,
-0.986902, 0.6096749, -1.065295, 0, 0, 0, 1, 1,
-0.9780381, 1.259131, 0.3957585, 1, 1, 1, 1, 1,
-0.9773877, 0.1722747, -0.9899267, 1, 1, 1, 1, 1,
-0.9686702, -1.415021, -2.285643, 1, 1, 1, 1, 1,
-0.9602125, 0.399103, -2.924646, 1, 1, 1, 1, 1,
-0.9569573, 1.565563, 0.1384767, 1, 1, 1, 1, 1,
-0.9534846, -0.656508, -1.510064, 1, 1, 1, 1, 1,
-0.9475196, 1.749381, -0.9667704, 1, 1, 1, 1, 1,
-0.9460558, 0.3636641, -1.626613, 1, 1, 1, 1, 1,
-0.944121, 2.577653, -2.055609, 1, 1, 1, 1, 1,
-0.9414377, -1.544069, -1.694491, 1, 1, 1, 1, 1,
-0.9380402, 0.8112046, -0.1742445, 1, 1, 1, 1, 1,
-0.935253, -1.055259, -3.236247, 1, 1, 1, 1, 1,
-0.9351115, -1.284046, -3.474565, 1, 1, 1, 1, 1,
-0.926423, 1.542355, -0.463915, 1, 1, 1, 1, 1,
-0.9260528, -0.5124521, -1.208688, 1, 1, 1, 1, 1,
-0.9256536, -1.998576, -3.527909, 0, 0, 1, 1, 1,
-0.9254394, 0.03771508, -1.341233, 1, 0, 0, 1, 1,
-0.9188759, -1.592095, -1.597738, 1, 0, 0, 1, 1,
-0.9111623, -0.7744504, -2.969936, 1, 0, 0, 1, 1,
-0.9108633, -0.5464577, -3.066485, 1, 0, 0, 1, 1,
-0.9071007, 3.241441, -0.8561347, 1, 0, 0, 1, 1,
-0.9002331, 0.1249153, -2.049942, 0, 0, 0, 1, 1,
-0.8989077, -0.5571384, -0.9161295, 0, 0, 0, 1, 1,
-0.8940821, 0.9739167, -1.164172, 0, 0, 0, 1, 1,
-0.8926125, 0.2898126, -2.764777, 0, 0, 0, 1, 1,
-0.8886749, -1.390352, -3.057478, 0, 0, 0, 1, 1,
-0.8865844, -0.7757678, -3.245409, 0, 0, 0, 1, 1,
-0.8843243, -0.8318831, -3.270251, 0, 0, 0, 1, 1,
-0.8828899, 0.6770265, -0.3277318, 1, 1, 1, 1, 1,
-0.8819438, 0.7153017, -1.71722, 1, 1, 1, 1, 1,
-0.8794762, -0.733192, -2.15743, 1, 1, 1, 1, 1,
-0.8684427, -1.113106, -2.938931, 1, 1, 1, 1, 1,
-0.8663428, -0.1761037, -2.072746, 1, 1, 1, 1, 1,
-0.8633068, -0.5853939, -1.738932, 1, 1, 1, 1, 1,
-0.8556023, 1.638798, -0.9938117, 1, 1, 1, 1, 1,
-0.854892, 0.06489608, -2.138699, 1, 1, 1, 1, 1,
-0.8544765, 0.01771004, -1.937608, 1, 1, 1, 1, 1,
-0.8502101, -1.08812, -0.2922147, 1, 1, 1, 1, 1,
-0.8453729, 0.9523942, -1.279377, 1, 1, 1, 1, 1,
-0.8452528, 1.119971, -1.529053, 1, 1, 1, 1, 1,
-0.8386341, -0.8142335, -1.914805, 1, 1, 1, 1, 1,
-0.8333519, 1.919002, -0.7810284, 1, 1, 1, 1, 1,
-0.8198019, -0.6614155, -2.512136, 1, 1, 1, 1, 1,
-0.8195806, -0.5473431, -3.12525, 0, 0, 1, 1, 1,
-0.8180189, -0.8766602, -3.22085, 1, 0, 0, 1, 1,
-0.8123886, 0.579898, -0.1786999, 1, 0, 0, 1, 1,
-0.8122497, -1.477014, -2.428179, 1, 0, 0, 1, 1,
-0.8078283, 1.0286, 1.043158, 1, 0, 0, 1, 1,
-0.8049859, -1.298763, -1.696506, 1, 0, 0, 1, 1,
-0.8033217, 0.4359277, -1.387131, 0, 0, 0, 1, 1,
-0.7996049, -0.9153597, -4.206479, 0, 0, 0, 1, 1,
-0.7951076, -0.7202747, -2.515075, 0, 0, 0, 1, 1,
-0.7939395, 0.6134559, -1.838257, 0, 0, 0, 1, 1,
-0.7919073, -0.8928828, -1.982027, 0, 0, 0, 1, 1,
-0.7840356, -0.5955521, -2.361195, 0, 0, 0, 1, 1,
-0.7818306, 0.4524368, -0.6415365, 0, 0, 0, 1, 1,
-0.7761012, 0.4329742, -1.192097, 1, 1, 1, 1, 1,
-0.7734686, -0.5588681, -2.074865, 1, 1, 1, 1, 1,
-0.7660028, -0.7111669, -1.034634, 1, 1, 1, 1, 1,
-0.7651314, -1.257851, -2.77759, 1, 1, 1, 1, 1,
-0.7644968, -0.691361, -1.951178, 1, 1, 1, 1, 1,
-0.7636031, 0.3609844, -2.459862, 1, 1, 1, 1, 1,
-0.7603412, 0.6372945, -1.520077, 1, 1, 1, 1, 1,
-0.7587851, 0.06554286, -0.5303638, 1, 1, 1, 1, 1,
-0.7581127, 1.05226, -1.967259, 1, 1, 1, 1, 1,
-0.7575108, 0.4928186, -1.330397, 1, 1, 1, 1, 1,
-0.7539349, 0.5663977, -0.09843175, 1, 1, 1, 1, 1,
-0.7402092, -0.2845498, -4.102425, 1, 1, 1, 1, 1,
-0.739955, -0.37968, -2.056088, 1, 1, 1, 1, 1,
-0.7303227, 2.052443, -1.185543, 1, 1, 1, 1, 1,
-0.7259167, 1.242711, -0.6756589, 1, 1, 1, 1, 1,
-0.7257365, 0.04445015, -1.91901, 0, 0, 1, 1, 1,
-0.7254598, 0.664811, 0.6236565, 1, 0, 0, 1, 1,
-0.7228839, -0.8859744, -2.546283, 1, 0, 0, 1, 1,
-0.7226533, -0.2996783, -1.877788, 1, 0, 0, 1, 1,
-0.7204602, -0.7631121, -1.244277, 1, 0, 0, 1, 1,
-0.7195413, -1.371432, -1.690655, 1, 0, 0, 1, 1,
-0.7164114, 1.983387, -0.9950666, 0, 0, 0, 1, 1,
-0.7138597, 0.9742862, 0.4471959, 0, 0, 0, 1, 1,
-0.7090759, 0.5323156, -1.900889, 0, 0, 0, 1, 1,
-0.7061936, -0.1211731, -0.6913053, 0, 0, 0, 1, 1,
-0.7020897, -0.3471451, -3.675478, 0, 0, 0, 1, 1,
-0.697513, -0.4069499, -1.988113, 0, 0, 0, 1, 1,
-0.6974993, -1.676286, -2.990898, 0, 0, 0, 1, 1,
-0.6943654, 1.108941, -0.2132052, 1, 1, 1, 1, 1,
-0.6921261, -0.2766996, -1.468931, 1, 1, 1, 1, 1,
-0.6880921, -1.778125, -3.021462, 1, 1, 1, 1, 1,
-0.6855853, -0.08623161, -0.8043275, 1, 1, 1, 1, 1,
-0.6853825, 0.1756446, -0.6158527, 1, 1, 1, 1, 1,
-0.6768269, 0.7303403, -1.323671, 1, 1, 1, 1, 1,
-0.6757963, -0.08026696, -1.070684, 1, 1, 1, 1, 1,
-0.6752197, -0.2275301, -3.055808, 1, 1, 1, 1, 1,
-0.6736599, -0.2184204, -1.096188, 1, 1, 1, 1, 1,
-0.6710699, 0.9024015, 0.5104914, 1, 1, 1, 1, 1,
-0.670665, -0.6038892, -2.455522, 1, 1, 1, 1, 1,
-0.6654372, 0.2641518, 0.1846804, 1, 1, 1, 1, 1,
-0.664571, -2.669521, -1.946044, 1, 1, 1, 1, 1,
-0.6630815, 0.8176624, -0.5505556, 1, 1, 1, 1, 1,
-0.6600674, 1.029653, -0.2474944, 1, 1, 1, 1, 1,
-0.6591488, -0.1587178, -1.388268, 0, 0, 1, 1, 1,
-0.6590791, -1.338144, -0.7589369, 1, 0, 0, 1, 1,
-0.6577105, 0.5864543, -0.2491524, 1, 0, 0, 1, 1,
-0.6562735, 1.525974, 0.1867375, 1, 0, 0, 1, 1,
-0.6534088, 0.9238064, -0.6822069, 1, 0, 0, 1, 1,
-0.653019, 0.8078091, -1.341764, 1, 0, 0, 1, 1,
-0.6526847, 1.627494, -0.4073218, 0, 0, 0, 1, 1,
-0.6491833, 1.215811, -0.1710375, 0, 0, 0, 1, 1,
-0.6478767, -0.1184829, -2.641212, 0, 0, 0, 1, 1,
-0.6405642, 1.000682, -1.398767, 0, 0, 0, 1, 1,
-0.6391559, -0.13962, -0.7244383, 0, 0, 0, 1, 1,
-0.6388639, 0.3880262, -0.6766161, 0, 0, 0, 1, 1,
-0.6385484, -0.7336189, -3.125346, 0, 0, 0, 1, 1,
-0.6364697, -1.026981, -2.635097, 1, 1, 1, 1, 1,
-0.6350448, -0.7054116, -2.063955, 1, 1, 1, 1, 1,
-0.63232, 0.5595167, 0.4798433, 1, 1, 1, 1, 1,
-0.6317159, -0.3350912, -0.622521, 1, 1, 1, 1, 1,
-0.62831, 0.2771772, -1.974681, 1, 1, 1, 1, 1,
-0.6236251, -0.5673153, -2.616587, 1, 1, 1, 1, 1,
-0.6217966, 0.5371431, 0.2027073, 1, 1, 1, 1, 1,
-0.6145693, -2.501133, -2.821644, 1, 1, 1, 1, 1,
-0.6120877, 1.708144, -0.8109668, 1, 1, 1, 1, 1,
-0.6101874, -1.084873, -3.289415, 1, 1, 1, 1, 1,
-0.6085389, -0.9858977, -3.091892, 1, 1, 1, 1, 1,
-0.6074338, -2.905752, -3.820503, 1, 1, 1, 1, 1,
-0.6031333, -0.6762642, -0.838973, 1, 1, 1, 1, 1,
-0.5978642, 1.505311, -1.654525, 1, 1, 1, 1, 1,
-0.5973682, -0.1504305, -2.491464, 1, 1, 1, 1, 1,
-0.593914, -0.418939, -2.455674, 0, 0, 1, 1, 1,
-0.5938732, 0.08769925, -1.503214, 1, 0, 0, 1, 1,
-0.5822859, 0.7218835, -0.9240845, 1, 0, 0, 1, 1,
-0.5774307, -0.7094513, -2.217706, 1, 0, 0, 1, 1,
-0.5732598, -1.134618, -4.08949, 1, 0, 0, 1, 1,
-0.5678877, 0.2634699, -1.827089, 1, 0, 0, 1, 1,
-0.5674992, 0.4156212, 2.133399, 0, 0, 0, 1, 1,
-0.5633962, 0.6320453, 0.3749499, 0, 0, 0, 1, 1,
-0.5528021, -0.7808528, -3.434376, 0, 0, 0, 1, 1,
-0.5457516, -1.332585, -3.192176, 0, 0, 0, 1, 1,
-0.5450589, 0.8849476, -0.8432024, 0, 0, 0, 1, 1,
-0.5449203, -0.8930949, -3.922059, 0, 0, 0, 1, 1,
-0.5379946, -0.04551398, -1.852607, 0, 0, 0, 1, 1,
-0.5369594, -0.01282227, -3.336961, 1, 1, 1, 1, 1,
-0.5359216, 2.605503, -0.1433883, 1, 1, 1, 1, 1,
-0.5358616, 0.3403748, -1.993069, 1, 1, 1, 1, 1,
-0.5331284, -1.028882, -1.70507, 1, 1, 1, 1, 1,
-0.5302574, -0.4034994, -1.132271, 1, 1, 1, 1, 1,
-0.5300261, -0.0102564, -0.07684574, 1, 1, 1, 1, 1,
-0.5277009, 1.921831, 0.1550108, 1, 1, 1, 1, 1,
-0.5254385, -0.3101984, 1.191463, 1, 1, 1, 1, 1,
-0.5205518, -1.371451, -2.971434, 1, 1, 1, 1, 1,
-0.519176, 0.4046405, -1.697164, 1, 1, 1, 1, 1,
-0.5073053, 0.1506802, -3.862265, 1, 1, 1, 1, 1,
-0.5060772, 0.3076817, -0.4497522, 1, 1, 1, 1, 1,
-0.5060092, 0.7535354, -0.207141, 1, 1, 1, 1, 1,
-0.5040802, -1.83261, -3.438485, 1, 1, 1, 1, 1,
-0.4912481, 1.262807, -1.944393, 1, 1, 1, 1, 1,
-0.4893828, 1.408613, -0.3397747, 0, 0, 1, 1, 1,
-0.4815901, 0.7192661, 0.2570103, 1, 0, 0, 1, 1,
-0.4734366, 2.821281, 1.353814, 1, 0, 0, 1, 1,
-0.4730621, 1.303035, 1.018795, 1, 0, 0, 1, 1,
-0.4711565, -0.6353294, -2.671776, 1, 0, 0, 1, 1,
-0.4688761, 0.08085681, -3.090624, 1, 0, 0, 1, 1,
-0.4622857, -1.53662, -3.203934, 0, 0, 0, 1, 1,
-0.4556639, -0.2846876, -3.59337, 0, 0, 0, 1, 1,
-0.4553617, -0.2277159, -0.7367684, 0, 0, 0, 1, 1,
-0.4550498, -0.7042891, -3.00042, 0, 0, 0, 1, 1,
-0.4486575, -0.3749074, -2.576702, 0, 0, 0, 1, 1,
-0.4465666, -0.9982012, -4.089188, 0, 0, 0, 1, 1,
-0.4423161, 0.4476461, -0.01282871, 0, 0, 0, 1, 1,
-0.4399377, -1.978592, -3.317185, 1, 1, 1, 1, 1,
-0.4386525, 1.433248, -0.4016778, 1, 1, 1, 1, 1,
-0.4383186, 0.4943144, 1.83117, 1, 1, 1, 1, 1,
-0.4354593, 0.5711699, -1.328258, 1, 1, 1, 1, 1,
-0.4300978, 1.500427, -1.30073, 1, 1, 1, 1, 1,
-0.4300042, 0.1774864, -0.1818606, 1, 1, 1, 1, 1,
-0.4296847, 0.3383574, -0.8637898, 1, 1, 1, 1, 1,
-0.4293851, -0.007777666, -2.319528, 1, 1, 1, 1, 1,
-0.4273752, -2.428259, -2.523708, 1, 1, 1, 1, 1,
-0.4237521, -0.1868919, -2.336717, 1, 1, 1, 1, 1,
-0.4186133, 0.8145814, -1.399478, 1, 1, 1, 1, 1,
-0.4176277, -1.541901, -2.823314, 1, 1, 1, 1, 1,
-0.416197, 0.1553054, -2.369749, 1, 1, 1, 1, 1,
-0.4158902, -0.06823622, -2.541502, 1, 1, 1, 1, 1,
-0.4123466, 0.620941, -0.7469304, 1, 1, 1, 1, 1,
-0.4047424, 0.1142821, -1.594701, 0, 0, 1, 1, 1,
-0.4047109, -0.6365451, -2.117515, 1, 0, 0, 1, 1,
-0.4046386, 0.8151068, -1.104, 1, 0, 0, 1, 1,
-0.4044245, 0.183017, -0.6814135, 1, 0, 0, 1, 1,
-0.4036993, -1.335986, -2.792016, 1, 0, 0, 1, 1,
-0.3994625, -0.8084999, -3.942376, 1, 0, 0, 1, 1,
-0.398773, 0.6479233, -1.611965, 0, 0, 0, 1, 1,
-0.3932099, 0.8063604, 0.9736156, 0, 0, 0, 1, 1,
-0.3838964, -0.3250095, -2.897092, 0, 0, 0, 1, 1,
-0.3806517, -0.2226146, -1.025915, 0, 0, 0, 1, 1,
-0.3772513, -1.373458, -1.170642, 0, 0, 0, 1, 1,
-0.3759216, 0.7580677, -0.6441195, 0, 0, 0, 1, 1,
-0.3720761, 0.7622477, -1.505811, 0, 0, 0, 1, 1,
-0.3650034, -0.1491063, -2.064385, 1, 1, 1, 1, 1,
-0.3610845, 0.5541588, -1.567822, 1, 1, 1, 1, 1,
-0.3605138, 0.01842629, -1.160125, 1, 1, 1, 1, 1,
-0.3596271, 0.7461248, 1.633165, 1, 1, 1, 1, 1,
-0.3558078, -0.0794557, -2.916934, 1, 1, 1, 1, 1,
-0.3552744, -0.6128685, -1.224208, 1, 1, 1, 1, 1,
-0.3547138, 0.2246383, -0.4513922, 1, 1, 1, 1, 1,
-0.3545741, -0.2608888, -1.223909, 1, 1, 1, 1, 1,
-0.3468772, -0.01621622, -2.202915, 1, 1, 1, 1, 1,
-0.3447877, 1.384197, -1.700068, 1, 1, 1, 1, 1,
-0.3375131, -0.3291208, -0.5427318, 1, 1, 1, 1, 1,
-0.3349276, -1.313701, -2.862148, 1, 1, 1, 1, 1,
-0.3330846, -1.223934, -4.215318, 1, 1, 1, 1, 1,
-0.3311882, 0.53714, 0.5085139, 1, 1, 1, 1, 1,
-0.327657, -0.5189573, -0.2293058, 1, 1, 1, 1, 1,
-0.3269182, -0.8845932, -2.207859, 0, 0, 1, 1, 1,
-0.3254165, -1.764182, -3.63966, 1, 0, 0, 1, 1,
-0.3247536, -0.07526693, -1.403294, 1, 0, 0, 1, 1,
-0.3220829, -1.446746, -2.02807, 1, 0, 0, 1, 1,
-0.3202471, 0.7559385, -2.171445, 1, 0, 0, 1, 1,
-0.3178788, 0.3076273, -0.8683684, 1, 0, 0, 1, 1,
-0.3163189, 1.217733, -0.2211589, 0, 0, 0, 1, 1,
-0.3138514, 0.4951516, -0.5196062, 0, 0, 0, 1, 1,
-0.3115933, 0.321404, -0.8391063, 0, 0, 0, 1, 1,
-0.3024003, -0.1095783, -2.755109, 0, 0, 0, 1, 1,
-0.3001522, -1.969447, -2.728875, 0, 0, 0, 1, 1,
-0.2944899, -0.9453037, -2.538305, 0, 0, 0, 1, 1,
-0.2888122, 2.340989, -0.494116, 0, 0, 0, 1, 1,
-0.2884258, -1.192294, -4.936511, 1, 1, 1, 1, 1,
-0.2872586, 0.8392596, -0.2417032, 1, 1, 1, 1, 1,
-0.2849415, 1.034516, -1.519138, 1, 1, 1, 1, 1,
-0.2812257, 1.556262, -2.464515, 1, 1, 1, 1, 1,
-0.2790962, 1.378804, 0.9181926, 1, 1, 1, 1, 1,
-0.2724913, 0.06224053, -2.112453, 1, 1, 1, 1, 1,
-0.2706826, 0.3049754, 1.601117, 1, 1, 1, 1, 1,
-0.2651047, -0.1753633, -2.696065, 1, 1, 1, 1, 1,
-0.2625252, -1.882103, -2.828356, 1, 1, 1, 1, 1,
-0.2606893, 0.06763313, -0.9511396, 1, 1, 1, 1, 1,
-0.2519508, -0.9601881, -2.039364, 1, 1, 1, 1, 1,
-0.2456827, 0.3685447, 0.5522311, 1, 1, 1, 1, 1,
-0.2446641, -0.1338665, -1.397566, 1, 1, 1, 1, 1,
-0.2426081, -0.02573044, -1.794677, 1, 1, 1, 1, 1,
-0.2379353, -0.6785409, -2.875409, 1, 1, 1, 1, 1,
-0.232787, -0.784553, -3.291222, 0, 0, 1, 1, 1,
-0.2283406, 0.3047249, -0.485907, 1, 0, 0, 1, 1,
-0.2282774, -0.3131441, -4.276603, 1, 0, 0, 1, 1,
-0.2273727, 1.164191, 0.8853762, 1, 0, 0, 1, 1,
-0.2255596, -0.03075626, -1.003048, 1, 0, 0, 1, 1,
-0.2247842, 0.8963776, -0.5164251, 1, 0, 0, 1, 1,
-0.2235746, 0.4071775, -3.281767, 0, 0, 0, 1, 1,
-0.2203797, -1.148288, -3.156738, 0, 0, 0, 1, 1,
-0.2186476, 1.357042, -2.339471, 0, 0, 0, 1, 1,
-0.2159608, -0.5089759, -3.87877, 0, 0, 0, 1, 1,
-0.2133557, 1.480379, -1.197361, 0, 0, 0, 1, 1,
-0.202938, -1.264173, -2.395338, 0, 0, 0, 1, 1,
-0.2022283, 0.7561048, -0.08794367, 0, 0, 0, 1, 1,
-0.2015756, 0.5487484, -1.958549, 1, 1, 1, 1, 1,
-0.200495, -1.083537, -2.55337, 1, 1, 1, 1, 1,
-0.1924147, 0.8602327, 0.1418412, 1, 1, 1, 1, 1,
-0.1922044, -0.7942331, -1.149051, 1, 1, 1, 1, 1,
-0.1901707, 0.6449268, -0.02607867, 1, 1, 1, 1, 1,
-0.1893165, -0.6229931, -3.974994, 1, 1, 1, 1, 1,
-0.1873561, -1.510802, -2.947206, 1, 1, 1, 1, 1,
-0.1852103, -1.606019, -1.745818, 1, 1, 1, 1, 1,
-0.183845, 0.8641104, 0.4471796, 1, 1, 1, 1, 1,
-0.1836338, 1.153148, -0.03284855, 1, 1, 1, 1, 1,
-0.1829734, -1.228108, -2.386276, 1, 1, 1, 1, 1,
-0.1825005, -0.1865308, -0.814203, 1, 1, 1, 1, 1,
-0.1784027, -0.9351544, -4.375447, 1, 1, 1, 1, 1,
-0.1778751, 1.072105, 1.138027, 1, 1, 1, 1, 1,
-0.1761533, -0.06569792, -2.817921, 1, 1, 1, 1, 1,
-0.1756041, 1.312261, 0.7383152, 0, 0, 1, 1, 1,
-0.1750665, -1.653405, -2.159827, 1, 0, 0, 1, 1,
-0.1727615, -0.1399712, -3.372251, 1, 0, 0, 1, 1,
-0.1706221, 0.3597521, -0.09320308, 1, 0, 0, 1, 1,
-0.17048, 0.2562485, -0.6065884, 1, 0, 0, 1, 1,
-0.1654539, -0.3615432, -2.509467, 1, 0, 0, 1, 1,
-0.1645624, -0.1621725, -0.9491141, 0, 0, 0, 1, 1,
-0.1633398, -1.049152, -4.292821, 0, 0, 0, 1, 1,
-0.1625162, -1.761057, -2.934536, 0, 0, 0, 1, 1,
-0.1528382, -0.1444073, -3.387353, 0, 0, 0, 1, 1,
-0.1499236, 0.7163556, 0.01366295, 0, 0, 0, 1, 1,
-0.1376568, 0.975234, -0.5983049, 0, 0, 0, 1, 1,
-0.1350579, -1.804137, -1.764776, 0, 0, 0, 1, 1,
-0.1350537, 0.6765234, -1.70022, 1, 1, 1, 1, 1,
-0.1349988, 0.8813512, -0.1833213, 1, 1, 1, 1, 1,
-0.1334485, -0.1640166, -1.335837, 1, 1, 1, 1, 1,
-0.133294, -0.9206145, -3.320921, 1, 1, 1, 1, 1,
-0.1322345, 0.7223384, -1.314161, 1, 1, 1, 1, 1,
-0.1298414, -2.103728, -3.067758, 1, 1, 1, 1, 1,
-0.1297432, -0.323614, -1.789317, 1, 1, 1, 1, 1,
-0.1284997, -0.363349, -1.773926, 1, 1, 1, 1, 1,
-0.1242689, 0.7901485, -0.3082772, 1, 1, 1, 1, 1,
-0.1190653, 0.3009919, 0.5226376, 1, 1, 1, 1, 1,
-0.1140247, 0.06618353, -2.796033, 1, 1, 1, 1, 1,
-0.1090152, 1.293251, -1.198874, 1, 1, 1, 1, 1,
-0.1081486, -1.508281, -4.732089, 1, 1, 1, 1, 1,
-0.1067041, -0.8700156, -2.744559, 1, 1, 1, 1, 1,
-0.09694867, 0.1578924, -1.293131, 1, 1, 1, 1, 1,
-0.0966778, 1.673895, -1.682126, 0, 0, 1, 1, 1,
-0.08436855, 1.026425, 0.5033287, 1, 0, 0, 1, 1,
-0.08071666, -0.1222979, -1.612577, 1, 0, 0, 1, 1,
-0.08044503, -0.8819385, -3.807931, 1, 0, 0, 1, 1,
-0.08010734, 1.040012, -2.028712, 1, 0, 0, 1, 1,
-0.07936473, -0.1398431, -1.670041, 1, 0, 0, 1, 1,
-0.07650183, 0.4576466, 0.2534283, 0, 0, 0, 1, 1,
-0.07644492, -0.4082069, -1.837998, 0, 0, 0, 1, 1,
-0.07582969, -1.219726, -3.690344, 0, 0, 0, 1, 1,
-0.0750894, 0.527936, 1.068237, 0, 0, 0, 1, 1,
-0.07293782, -0.773111, -1.788305, 0, 0, 0, 1, 1,
-0.07099933, 0.3121514, -1.803739, 0, 0, 0, 1, 1,
-0.07003797, 0.1928298, -0.8563434, 0, 0, 0, 1, 1,
-0.06957075, -0.7772047, -2.412067, 1, 1, 1, 1, 1,
-0.06633393, -1.031294, -1.417836, 1, 1, 1, 1, 1,
-0.06243329, -0.3324317, -2.309987, 1, 1, 1, 1, 1,
-0.06218886, -1.238778, -4.663198, 1, 1, 1, 1, 1,
-0.0575866, -1.319203, -3.263013, 1, 1, 1, 1, 1,
-0.05447508, -1.589296, -3.403401, 1, 1, 1, 1, 1,
-0.05319713, -1.063584, -2.638322, 1, 1, 1, 1, 1,
-0.05221175, 0.9413711, 0.5988568, 1, 1, 1, 1, 1,
-0.05079347, 0.7226216, -1.644127, 1, 1, 1, 1, 1,
-0.04841948, -0.7350621, -4.051408, 1, 1, 1, 1, 1,
-0.04734113, -0.4678011, -2.410812, 1, 1, 1, 1, 1,
-0.0434556, 0.0325267, -1.163505, 1, 1, 1, 1, 1,
-0.04302753, 0.624061, -0.6456677, 1, 1, 1, 1, 1,
-0.03767065, 0.3810401, 0.09030653, 1, 1, 1, 1, 1,
-0.03210396, -0.4444582, -1.603689, 1, 1, 1, 1, 1,
-0.03184374, -0.5719526, -2.526947, 0, 0, 1, 1, 1,
-0.03114153, -0.4660477, -3.676018, 1, 0, 0, 1, 1,
-0.02820423, -1.955786, -3.602106, 1, 0, 0, 1, 1,
-0.02252428, -0.6697435, -2.592952, 1, 0, 0, 1, 1,
-0.02002297, 0.3330683, -0.8862807, 1, 0, 0, 1, 1,
-0.01899098, 1.931303, -0.2625872, 1, 0, 0, 1, 1,
-0.01808046, -0.8351556, -1.975615, 0, 0, 0, 1, 1,
-0.01697178, 0.0697208, -0.8941754, 0, 0, 0, 1, 1,
-0.01296138, -0.605044, -3.523652, 0, 0, 0, 1, 1,
-0.009187751, 0.09264737, -2.564209, 0, 0, 0, 1, 1,
-0.003391403, -0.8686051, -2.77045, 0, 0, 0, 1, 1,
-0.002129658, -1.266716, -3.10493, 0, 0, 0, 1, 1,
0.001670445, 0.8708097, 0.8829595, 0, 0, 0, 1, 1,
0.002847437, 0.6304485, -0.6203156, 1, 1, 1, 1, 1,
0.004543013, -0.89769, 2.695311, 1, 1, 1, 1, 1,
0.007816981, -0.457227, 3.98568, 1, 1, 1, 1, 1,
0.01819262, -0.4692367, 3.269784, 1, 1, 1, 1, 1,
0.02173764, 0.8885633, 2.228555, 1, 1, 1, 1, 1,
0.02555331, -1.425949, 3.201864, 1, 1, 1, 1, 1,
0.02989051, -0.0946394, 3.731555, 1, 1, 1, 1, 1,
0.03107919, -0.3525341, 3.734981, 1, 1, 1, 1, 1,
0.03170803, 0.9433312, 1.412637, 1, 1, 1, 1, 1,
0.03188522, -0.3631565, 2.495315, 1, 1, 1, 1, 1,
0.03633506, -1.433285, 4.233178, 1, 1, 1, 1, 1,
0.04071644, 1.429593, 2.313933, 1, 1, 1, 1, 1,
0.04103169, 0.8956378, 0.08795793, 1, 1, 1, 1, 1,
0.0421066, 0.2826576, -0.2223273, 1, 1, 1, 1, 1,
0.0431157, 0.8554761, -2.085362, 1, 1, 1, 1, 1,
0.04473315, -0.9185242, 4.399159, 0, 0, 1, 1, 1,
0.04505827, 0.1437499, 0.3671881, 1, 0, 0, 1, 1,
0.04897526, 0.608867, 0.7579525, 1, 0, 0, 1, 1,
0.05031504, 1.709078, -0.3100021, 1, 0, 0, 1, 1,
0.05426705, -0.157355, 1.68371, 1, 0, 0, 1, 1,
0.05469093, -1.657526, 4.915569, 1, 0, 0, 1, 1,
0.05493572, 1.069196, 1.002679, 0, 0, 0, 1, 1,
0.06072938, 0.4242457, -0.000187427, 0, 0, 0, 1, 1,
0.06295333, 0.8657923, 2.409595, 0, 0, 0, 1, 1,
0.06464525, -0.5157165, 2.009754, 0, 0, 0, 1, 1,
0.06474787, -1.129545, 3.501971, 0, 0, 0, 1, 1,
0.06598888, 1.468629, 0.4067117, 0, 0, 0, 1, 1,
0.06629288, 2.170075, -2.491199, 0, 0, 0, 1, 1,
0.06907492, 0.6380545, -0.7626502, 1, 1, 1, 1, 1,
0.07110966, 1.263857, 0.9877824, 1, 1, 1, 1, 1,
0.07445749, 1.204416, 2.622345, 1, 1, 1, 1, 1,
0.07447448, -0.8619359, 2.569041, 1, 1, 1, 1, 1,
0.0751831, -0.6431594, 2.002454, 1, 1, 1, 1, 1,
0.07945923, 0.5498779, -0.1137174, 1, 1, 1, 1, 1,
0.103963, 1.088289, -0.8415413, 1, 1, 1, 1, 1,
0.1064072, 0.10972, 0.6752329, 1, 1, 1, 1, 1,
0.1092089, 0.03923486, 3.300137, 1, 1, 1, 1, 1,
0.1125398, -0.4152055, 0.6494976, 1, 1, 1, 1, 1,
0.1188803, -0.8375826, 5.349255, 1, 1, 1, 1, 1,
0.121837, -1.264766, 2.767533, 1, 1, 1, 1, 1,
0.1224558, 0.6913373, 1.161721, 1, 1, 1, 1, 1,
0.1243709, 1.501343, -0.4844393, 1, 1, 1, 1, 1,
0.1270695, 0.3534712, -0.2226172, 1, 1, 1, 1, 1,
0.1275219, -1.7254, 3.520649, 0, 0, 1, 1, 1,
0.1302001, -0.2072819, 3.779824, 1, 0, 0, 1, 1,
0.1304558, 0.5840397, 1.469865, 1, 0, 0, 1, 1,
0.1323602, -0.9356509, 2.529012, 1, 0, 0, 1, 1,
0.1363463, -1.477964, 2.249861, 1, 0, 0, 1, 1,
0.1385137, 0.9998002, 0.02064636, 1, 0, 0, 1, 1,
0.1393888, 1.030422, 0.3406573, 0, 0, 0, 1, 1,
0.1395572, -1.902799, 3.369114, 0, 0, 0, 1, 1,
0.1408923, -0.3555307, -0.1506613, 0, 0, 0, 1, 1,
0.1447168, 0.4588397, 0.7971216, 0, 0, 0, 1, 1,
0.1476819, -1.420679, 3.176437, 0, 0, 0, 1, 1,
0.1490694, -1.116382, 1.964802, 0, 0, 0, 1, 1,
0.1520873, -0.6235136, 1.950206, 0, 0, 0, 1, 1,
0.1543532, -1.243061, 5.207083, 1, 1, 1, 1, 1,
0.1560316, -0.3936896, 4.020257, 1, 1, 1, 1, 1,
0.1592934, 0.09421295, 1.137478, 1, 1, 1, 1, 1,
0.15973, 0.7039156, 0.882705, 1, 1, 1, 1, 1,
0.159843, -0.4784334, 1.855348, 1, 1, 1, 1, 1,
0.1604821, 0.9328074, 0.4038179, 1, 1, 1, 1, 1,
0.1632867, -0.4657834, 3.858599, 1, 1, 1, 1, 1,
0.1704054, 0.205327, 0.2276142, 1, 1, 1, 1, 1,
0.1706607, 0.3415478, -1.163978, 1, 1, 1, 1, 1,
0.1716443, -1.034593, 2.430684, 1, 1, 1, 1, 1,
0.1717335, 2.229006, 0.2405276, 1, 1, 1, 1, 1,
0.1783783, -0.4432029, 1.624282, 1, 1, 1, 1, 1,
0.182482, 0.01655726, 0.5069533, 1, 1, 1, 1, 1,
0.1870158, 0.2506003, 0.5832422, 1, 1, 1, 1, 1,
0.1891881, -1.375344, 1.026656, 1, 1, 1, 1, 1,
0.1898665, -0.09101608, 2.68558, 0, 0, 1, 1, 1,
0.1912923, 0.9668381, -0.1224559, 1, 0, 0, 1, 1,
0.1939165, 0.3678898, 0.9151099, 1, 0, 0, 1, 1,
0.1950304, -0.4734035, 2.852461, 1, 0, 0, 1, 1,
0.1968197, 2.095529, -0.4364217, 1, 0, 0, 1, 1,
0.2007438, -0.3118086, 1.985921, 1, 0, 0, 1, 1,
0.2023587, 0.7441561, -1.180293, 0, 0, 0, 1, 1,
0.2068064, -2.074485, 3.726566, 0, 0, 0, 1, 1,
0.2082083, 0.2167953, 0.9617299, 0, 0, 0, 1, 1,
0.2112738, 0.8132687, -1.000189, 0, 0, 0, 1, 1,
0.2113088, 0.6700277, 2.475109, 0, 0, 0, 1, 1,
0.2133007, 1.012117, -0.2738826, 0, 0, 0, 1, 1,
0.2139348, 1.922222, -2.323653, 0, 0, 0, 1, 1,
0.214421, 0.4055305, 1.474773, 1, 1, 1, 1, 1,
0.221679, 1.558358, -1.202844, 1, 1, 1, 1, 1,
0.2236343, 1.569284, -0.5430579, 1, 1, 1, 1, 1,
0.2261524, 0.1599294, 1.657227, 1, 1, 1, 1, 1,
0.2324924, -1.743124, 2.321823, 1, 1, 1, 1, 1,
0.2337847, -0.9197899, 2.315516, 1, 1, 1, 1, 1,
0.2343885, -0.5098003, 0.9338707, 1, 1, 1, 1, 1,
0.234459, -0.9509184, 3.588624, 1, 1, 1, 1, 1,
0.238078, 1.041737, -0.5945688, 1, 1, 1, 1, 1,
0.2385949, -0.3567325, 3.843238, 1, 1, 1, 1, 1,
0.2480721, 1.230008, 0.2457058, 1, 1, 1, 1, 1,
0.2491165, -0.5690666, 5.729032, 1, 1, 1, 1, 1,
0.2517093, 0.7705424, 0.08914232, 1, 1, 1, 1, 1,
0.2524657, 1.342005, 1.123041, 1, 1, 1, 1, 1,
0.2539446, 0.9534994, 0.8150229, 1, 1, 1, 1, 1,
0.2573294, 0.4773179, 3.21958, 0, 0, 1, 1, 1,
0.2583221, 0.3230821, 0.4789967, 1, 0, 0, 1, 1,
0.2626676, 0.631178, -1.316976, 1, 0, 0, 1, 1,
0.2776889, -0.5928584, 2.980897, 1, 0, 0, 1, 1,
0.2840747, -0.7624399, 3.099708, 1, 0, 0, 1, 1,
0.2843532, -0.4606582, 1.860063, 1, 0, 0, 1, 1,
0.2864735, -0.4338235, 3.861233, 0, 0, 0, 1, 1,
0.2886685, -0.07170798, 1.999595, 0, 0, 0, 1, 1,
0.2887687, -0.6770896, 1.463568, 0, 0, 0, 1, 1,
0.2950374, -0.5208949, 2.027167, 0, 0, 0, 1, 1,
0.2966449, 0.1890568, 0.4498065, 0, 0, 0, 1, 1,
0.2968862, -0.9570502, 3.086421, 0, 0, 0, 1, 1,
0.3002447, -1.667916, 3.452768, 0, 0, 0, 1, 1,
0.3020509, 0.9140309, 0.271078, 1, 1, 1, 1, 1,
0.3045971, 0.7166523, -0.6002597, 1, 1, 1, 1, 1,
0.3047544, -1.846425, 2.729122, 1, 1, 1, 1, 1,
0.3064136, -0.3575119, 2.661497, 1, 1, 1, 1, 1,
0.3070424, 0.4693785, 0.5199124, 1, 1, 1, 1, 1,
0.3076159, 1.162649, 2.302707, 1, 1, 1, 1, 1,
0.3098969, 2.259447, -0.5182496, 1, 1, 1, 1, 1,
0.3119535, -0.6063399, 3.167626, 1, 1, 1, 1, 1,
0.31828, -0.07151296, 0.3422098, 1, 1, 1, 1, 1,
0.3230932, -1.288488, 2.52092, 1, 1, 1, 1, 1,
0.3267136, -0.3907528, 3.168017, 1, 1, 1, 1, 1,
0.3272843, -0.2891226, 3.955995, 1, 1, 1, 1, 1,
0.3274568, 0.2491024, -0.7507079, 1, 1, 1, 1, 1,
0.3279608, 0.7390497, -0.500797, 1, 1, 1, 1, 1,
0.3285939, 0.9885364, 1.890232, 1, 1, 1, 1, 1,
0.3316192, 0.1677248, 1.672494, 0, 0, 1, 1, 1,
0.3364317, -0.6745487, 2.008439, 1, 0, 0, 1, 1,
0.3365205, 1.655795, 1.860473, 1, 0, 0, 1, 1,
0.3401456, 1.323339, 1.607428, 1, 0, 0, 1, 1,
0.3423288, 0.815095, 1.149022, 1, 0, 0, 1, 1,
0.3431496, -0.0183283, 0.6243708, 1, 0, 0, 1, 1,
0.3449901, -0.1614756, 1.941126, 0, 0, 0, 1, 1,
0.3486538, -0.7604698, 2.432807, 0, 0, 0, 1, 1,
0.3508327, -0.9018894, 3.22245, 0, 0, 0, 1, 1,
0.3520105, -0.2461024, 2.225598, 0, 0, 0, 1, 1,
0.3522557, 1.141958, 0.7934956, 0, 0, 0, 1, 1,
0.3599142, -0.4422218, 2.926944, 0, 0, 0, 1, 1,
0.3638501, 0.4482381, 1.719903, 0, 0, 0, 1, 1,
0.3699132, -1.112732, 3.349096, 1, 1, 1, 1, 1,
0.3745603, -0.466578, 2.304649, 1, 1, 1, 1, 1,
0.3751843, -0.236859, 0.5161201, 1, 1, 1, 1, 1,
0.3768248, 1.15126, -2.675432, 1, 1, 1, 1, 1,
0.3770726, 1.201392, 0.6177616, 1, 1, 1, 1, 1,
0.3787211, 1.503325, 1.379531, 1, 1, 1, 1, 1,
0.3869393, 0.9733766, 0.6622378, 1, 1, 1, 1, 1,
0.3913435, -1.045189, 1.932475, 1, 1, 1, 1, 1,
0.3948455, -0.8029512, 3.386215, 1, 1, 1, 1, 1,
0.3973587, -0.5264459, 1.093056, 1, 1, 1, 1, 1,
0.3980561, -1.609461, 3.937259, 1, 1, 1, 1, 1,
0.3992965, -0.8170766, 2.986392, 1, 1, 1, 1, 1,
0.4031217, 0.8146459, 0.1393548, 1, 1, 1, 1, 1,
0.405057, -1.290071, 4.763161, 1, 1, 1, 1, 1,
0.4119896, 1.749189, 0.7126747, 1, 1, 1, 1, 1,
0.412026, 1.224367, -0.7565398, 0, 0, 1, 1, 1,
0.4129403, -0.8043367, 2.97013, 1, 0, 0, 1, 1,
0.4135561, 0.4006948, 1.336464, 1, 0, 0, 1, 1,
0.41662, 2.089027, 0.415789, 1, 0, 0, 1, 1,
0.4194059, -0.6918458, 3.005127, 1, 0, 0, 1, 1,
0.4236684, -0.02287774, 1.21679, 1, 0, 0, 1, 1,
0.4251347, -0.0185721, 1.519393, 0, 0, 0, 1, 1,
0.4269336, -1.301184, -0.3236452, 0, 0, 0, 1, 1,
0.4277055, -0.05865348, 3.607691, 0, 0, 0, 1, 1,
0.4294242, 0.1061774, 1.332421, 0, 0, 0, 1, 1,
0.4344566, 0.5774435, -1.388936, 0, 0, 0, 1, 1,
0.4346982, -0.6417183, 2.903603, 0, 0, 0, 1, 1,
0.4382091, 0.6053767, 0.9163898, 0, 0, 0, 1, 1,
0.444704, -0.5663564, 3.525766, 1, 1, 1, 1, 1,
0.4537894, 0.4836739, 1.773461, 1, 1, 1, 1, 1,
0.4578777, -0.8886294, 2.445607, 1, 1, 1, 1, 1,
0.4610257, 0.3881515, -0.06667667, 1, 1, 1, 1, 1,
0.4646922, 0.7478552, 0.9326282, 1, 1, 1, 1, 1,
0.4676742, 1.377165, 0.06348454, 1, 1, 1, 1, 1,
0.4726749, -2.077488, 3.157539, 1, 1, 1, 1, 1,
0.4727961, -0.2080371, 2.49661, 1, 1, 1, 1, 1,
0.4743353, 0.01420585, 2.524312, 1, 1, 1, 1, 1,
0.4825827, 0.2303611, 1.196747, 1, 1, 1, 1, 1,
0.4851983, 1.508824, 0.3458869, 1, 1, 1, 1, 1,
0.4859592, -1.151807, 3.286023, 1, 1, 1, 1, 1,
0.4919512, -0.0128446, 2.160451, 1, 1, 1, 1, 1,
0.4927073, -0.897584, 1.139023, 1, 1, 1, 1, 1,
0.4941166, -0.00749473, 2.449733, 1, 1, 1, 1, 1,
0.4972782, -0.09189082, 1.621309, 0, 0, 1, 1, 1,
0.4976978, 0.1694555, 0.9352033, 1, 0, 0, 1, 1,
0.5030419, -1.616694, 2.218463, 1, 0, 0, 1, 1,
0.5077353, 2.725244, 1.281125, 1, 0, 0, 1, 1,
0.5078066, 0.2527965, 0.9263343, 1, 0, 0, 1, 1,
0.5083587, 0.06313528, 1.403382, 1, 0, 0, 1, 1,
0.5123929, -0.3767785, 2.940878, 0, 0, 0, 1, 1,
0.5169866, 1.576982, 1.249527, 0, 0, 0, 1, 1,
0.5171549, 0.2076376, 2.030523, 0, 0, 0, 1, 1,
0.5207701, -0.1978617, 1.843237, 0, 0, 0, 1, 1,
0.5226746, 1.413504, 0.852308, 0, 0, 0, 1, 1,
0.5250869, -0.159278, 2.401953, 0, 0, 0, 1, 1,
0.5257354, 1.138743, 0.5471971, 0, 0, 0, 1, 1,
0.5287827, -0.1509169, 3.36686, 1, 1, 1, 1, 1,
0.5306118, -0.7107878, 0.7790512, 1, 1, 1, 1, 1,
0.5343754, -2.618534, 3.48484, 1, 1, 1, 1, 1,
0.537985, -1.518513, 4.076239, 1, 1, 1, 1, 1,
0.5404035, -0.09769717, 1.3328, 1, 1, 1, 1, 1,
0.5433033, -0.00917263, 0.4375949, 1, 1, 1, 1, 1,
0.5435145, 0.1756945, 1.728561, 1, 1, 1, 1, 1,
0.5502034, 1.499152, 1.181818, 1, 1, 1, 1, 1,
0.5521899, 0.2807564, 0.3855065, 1, 1, 1, 1, 1,
0.5590902, 0.7971155, 0.1038975, 1, 1, 1, 1, 1,
0.5676364, -0.1387214, 3.185346, 1, 1, 1, 1, 1,
0.5691229, 0.7391245, -0.4591047, 1, 1, 1, 1, 1,
0.5754093, 0.3495901, 2.100393, 1, 1, 1, 1, 1,
0.5807942, 0.7947842, 0.8077785, 1, 1, 1, 1, 1,
0.5816771, -0.4165037, 1.356002, 1, 1, 1, 1, 1,
0.5845161, 0.9610023, -0.2125884, 0, 0, 1, 1, 1,
0.5852358, -0.6994882, 3.214714, 1, 0, 0, 1, 1,
0.5890486, -0.193608, 1.701398, 1, 0, 0, 1, 1,
0.6017587, 2.063016, 1.297529, 1, 0, 0, 1, 1,
0.6019868, -2.179028, 2.718282, 1, 0, 0, 1, 1,
0.6069041, -0.4991466, 2.158312, 1, 0, 0, 1, 1,
0.6070384, -1.126935, 2.345795, 0, 0, 0, 1, 1,
0.6087599, -0.07633411, 2.279097, 0, 0, 0, 1, 1,
0.6132296, -0.4172056, 0.9017342, 0, 0, 0, 1, 1,
0.6172307, 0.3809145, 0.577113, 0, 0, 0, 1, 1,
0.6181204, 0.5470904, 0.3056151, 0, 0, 0, 1, 1,
0.6200772, -1.622501, 3.140439, 0, 0, 0, 1, 1,
0.6277789, 1.36621, 0.2002696, 0, 0, 0, 1, 1,
0.6327066, 1.606732, 1.104142, 1, 1, 1, 1, 1,
0.63376, 0.03796712, -0.359904, 1, 1, 1, 1, 1,
0.6348857, 1.971, 0.1326981, 1, 1, 1, 1, 1,
0.6350943, 0.9864969, -0.8649982, 1, 1, 1, 1, 1,
0.6438066, 0.2047692, 1.449288, 1, 1, 1, 1, 1,
0.6444396, 2.526978, 0.295774, 1, 1, 1, 1, 1,
0.6492101, -0.8467589, 2.484728, 1, 1, 1, 1, 1,
0.6587995, 0.8209415, 0.1592846, 1, 1, 1, 1, 1,
0.6596863, -0.9909557, 2.411724, 1, 1, 1, 1, 1,
0.6600842, 0.6649204, 1.437852, 1, 1, 1, 1, 1,
0.6715003, -0.009386592, 1.213818, 1, 1, 1, 1, 1,
0.6727127, -0.7791251, 1.571371, 1, 1, 1, 1, 1,
0.6733486, -1.27229, 2.931511, 1, 1, 1, 1, 1,
0.6739312, -1.952373, 2.017728, 1, 1, 1, 1, 1,
0.6747766, -1.629805, 1.423502, 1, 1, 1, 1, 1,
0.676466, -0.3020413, 1.964452, 0, 0, 1, 1, 1,
0.6808249, 0.5737879, -0.3664103, 1, 0, 0, 1, 1,
0.683164, 0.6928576, -0.02196446, 1, 0, 0, 1, 1,
0.683186, 0.9612354, 0.8600699, 1, 0, 0, 1, 1,
0.6842299, 0.2256116, -0.8930942, 1, 0, 0, 1, 1,
0.6900306, -1.452619, 2.35079, 1, 0, 0, 1, 1,
0.6905087, -1.010619, 4.270015, 0, 0, 0, 1, 1,
0.6925914, 1.655273, 2.070227, 0, 0, 0, 1, 1,
0.6983872, 0.0434578, 2.232761, 0, 0, 0, 1, 1,
0.6987845, -0.6961175, 2.890054, 0, 0, 0, 1, 1,
0.7112861, 1.450784, 0.2709523, 0, 0, 0, 1, 1,
0.7118671, -0.5397413, 2.384001, 0, 0, 0, 1, 1,
0.7140066, -0.137567, 1.391608, 0, 0, 0, 1, 1,
0.7146282, 0.8204477, -0.6439828, 1, 1, 1, 1, 1,
0.7158859, -0.5947778, 2.633173, 1, 1, 1, 1, 1,
0.7232251, -1.22387, 3.60631, 1, 1, 1, 1, 1,
0.7242641, -0.7349424, 2.188686, 1, 1, 1, 1, 1,
0.7245832, -0.8279666, 2.539281, 1, 1, 1, 1, 1,
0.7294816, -0.1619022, 2.80808, 1, 1, 1, 1, 1,
0.7358033, -0.09890082, 2.582376, 1, 1, 1, 1, 1,
0.748898, 2.470689, -1.056, 1, 1, 1, 1, 1,
0.7489547, 1.370312, 0.5973838, 1, 1, 1, 1, 1,
0.7543063, 1.280679, 1.254827, 1, 1, 1, 1, 1,
0.7553901, 0.2488537, 1.464814, 1, 1, 1, 1, 1,
0.7597776, -0.06370711, 0.1455974, 1, 1, 1, 1, 1,
0.7599954, 0.2701117, 2.756671, 1, 1, 1, 1, 1,
0.7671399, -2.626704, 4.35474, 1, 1, 1, 1, 1,
0.7715101, -0.04689131, 2.628946, 1, 1, 1, 1, 1,
0.7723589, -0.9996333, 2.677506, 0, 0, 1, 1, 1,
0.7739134, -0.6000019, 1.833116, 1, 0, 0, 1, 1,
0.7750887, 0.2751057, 1.651895, 1, 0, 0, 1, 1,
0.7816793, 1.246817, -0.1055766, 1, 0, 0, 1, 1,
0.7831478, -0.3055319, 2.221789, 1, 0, 0, 1, 1,
0.7842892, 0.3164783, -0.4768048, 1, 0, 0, 1, 1,
0.7867213, -0.2759922, 1.055525, 0, 0, 0, 1, 1,
0.7876337, 0.1230954, 1.708481, 0, 0, 0, 1, 1,
0.7898906, 0.6053786, 1.731974, 0, 0, 0, 1, 1,
0.7910144, 0.5895451, 1.273893, 0, 0, 0, 1, 1,
0.7920548, -0.04504096, 0.7525565, 0, 0, 0, 1, 1,
0.7932491, -0.6432703, 2.133121, 0, 0, 0, 1, 1,
0.8009666, -0.3785723, 2.340876, 0, 0, 0, 1, 1,
0.8076428, -0.4466415, 2.55024, 1, 1, 1, 1, 1,
0.8092467, 1.154021, 0.1361754, 1, 1, 1, 1, 1,
0.8158411, 0.9167826, 0.7968343, 1, 1, 1, 1, 1,
0.8173836, -0.2833728, 1.26341, 1, 1, 1, 1, 1,
0.8195632, 0.3520842, 0.953754, 1, 1, 1, 1, 1,
0.8221166, 1.908595, 0.9811498, 1, 1, 1, 1, 1,
0.8274499, 0.5949181, 1.335245, 1, 1, 1, 1, 1,
0.828604, -0.357685, 1.022769, 1, 1, 1, 1, 1,
0.8319851, -0.944205, 1.883161, 1, 1, 1, 1, 1,
0.8360255, 0.226769, 1.851992, 1, 1, 1, 1, 1,
0.839129, 0.3837529, 0.6429818, 1, 1, 1, 1, 1,
0.8412557, 0.7326651, 0.7764032, 1, 1, 1, 1, 1,
0.8417801, -1.843791, 0.8504777, 1, 1, 1, 1, 1,
0.8435374, 0.7115566, 0.5124536, 1, 1, 1, 1, 1,
0.8466421, 0.2449418, 1.053829, 1, 1, 1, 1, 1,
0.8508849, -0.7474719, 2.919908, 0, 0, 1, 1, 1,
0.8517269, -0.9548062, 1.979122, 1, 0, 0, 1, 1,
0.8521227, -0.9823495, 2.069118, 1, 0, 0, 1, 1,
0.8547896, -0.9135182, 1.704616, 1, 0, 0, 1, 1,
0.8556569, -0.2138731, 0.8494176, 1, 0, 0, 1, 1,
0.8575905, -0.2609941, 2.597873, 1, 0, 0, 1, 1,
0.857754, 0.9546621, 1.19149, 0, 0, 0, 1, 1,
0.8715884, -2.305939, 3.714438, 0, 0, 0, 1, 1,
0.8725963, -0.7094014, 0.9414797, 0, 0, 0, 1, 1,
0.8732228, -0.3786342, 1.445316, 0, 0, 0, 1, 1,
0.8759187, 2.37133, -0.4109376, 0, 0, 0, 1, 1,
0.8767795, 0.5160499, 0.03806243, 0, 0, 0, 1, 1,
0.8770344, -0.4836177, 0.8569447, 0, 0, 0, 1, 1,
0.8795727, -1.813672, 2.574144, 1, 1, 1, 1, 1,
0.8850345, -0.2029817, 1.438055, 1, 1, 1, 1, 1,
0.889107, -0.4686, 2.479178, 1, 1, 1, 1, 1,
0.9029303, -0.5122737, 1.302462, 1, 1, 1, 1, 1,
0.9036883, -1.106647, 3.634781, 1, 1, 1, 1, 1,
0.9047513, 0.5905082, 0.01394664, 1, 1, 1, 1, 1,
0.9126992, 0.3818139, 0.2949278, 1, 1, 1, 1, 1,
0.9137384, -0.2668617, 1.548743, 1, 1, 1, 1, 1,
0.9144582, 1.401577, 0.7881749, 1, 1, 1, 1, 1,
0.9161168, 0.334978, 1.33438, 1, 1, 1, 1, 1,
0.9177865, 1.154931, 2.751732, 1, 1, 1, 1, 1,
0.9236561, -0.9429814, 3.710312, 1, 1, 1, 1, 1,
0.9242664, -0.1711044, 0.7053804, 1, 1, 1, 1, 1,
0.9244362, 0.4927258, 1.536771, 1, 1, 1, 1, 1,
0.9256774, -0.1420281, 4.567686, 1, 1, 1, 1, 1,
0.9272206, 0.5815775, -0.395462, 0, 0, 1, 1, 1,
0.929187, -0.8932795, 2.488236, 1, 0, 0, 1, 1,
0.9312565, -0.7556539, 0.09952846, 1, 0, 0, 1, 1,
0.9329884, -0.2877342, 3.250575, 1, 0, 0, 1, 1,
0.9348226, -2.378433, 4.063173, 1, 0, 0, 1, 1,
0.9368773, -0.05891505, 1.294885, 1, 0, 0, 1, 1,
0.942285, 0.343034, -0.2591916, 0, 0, 0, 1, 1,
0.9432009, 0.5147743, 0.7140204, 0, 0, 0, 1, 1,
0.9438538, 0.325388, 0.06572213, 0, 0, 0, 1, 1,
0.9469855, -0.7055165, 1.968835, 0, 0, 0, 1, 1,
0.9493769, -0.2108183, 2.112866, 0, 0, 0, 1, 1,
0.9647705, -1.893533, 2.041416, 0, 0, 0, 1, 1,
0.9685338, -2.104223, 2.117212, 0, 0, 0, 1, 1,
0.96868, 0.1063485, 0.6307268, 1, 1, 1, 1, 1,
0.9695348, -0.0729212, 1.255178, 1, 1, 1, 1, 1,
0.9783717, -0.6548089, 0.8463537, 1, 1, 1, 1, 1,
0.9785711, -0.01611648, 3.117634, 1, 1, 1, 1, 1,
0.9822429, 0.3426225, 0.7826483, 1, 1, 1, 1, 1,
0.9868874, 0.9953751, -0.3363889, 1, 1, 1, 1, 1,
0.9920186, 1.465714, -0.6182117, 1, 1, 1, 1, 1,
0.9921509, 1.315083, 1.464889, 1, 1, 1, 1, 1,
0.9936985, 0.6434153, 1.276516, 1, 1, 1, 1, 1,
1.003311, -0.3887928, 2.092891, 1, 1, 1, 1, 1,
1.009199, 0.1603484, 2.787709, 1, 1, 1, 1, 1,
1.011242, 0.06947334, 0.7209426, 1, 1, 1, 1, 1,
1.011338, 1.528731, 0.3530805, 1, 1, 1, 1, 1,
1.015684, -0.62164, 1.134481, 1, 1, 1, 1, 1,
1.022122, 0.1423213, 1.656319, 1, 1, 1, 1, 1,
1.024891, 0.6897185, 0.5037869, 0, 0, 1, 1, 1,
1.028391, 0.7287323, -0.006497508, 1, 0, 0, 1, 1,
1.030927, -0.9485111, 3.291749, 1, 0, 0, 1, 1,
1.03913, -0.6291509, 3.780421, 1, 0, 0, 1, 1,
1.041124, 1.299239, 1.707203, 1, 0, 0, 1, 1,
1.041706, -1.575775, 2.932396, 1, 0, 0, 1, 1,
1.045126, -0.07834067, 1.926201, 0, 0, 0, 1, 1,
1.054802, 1.586375, 0.4822215, 0, 0, 0, 1, 1,
1.054888, 0.2224382, 1.387943, 0, 0, 0, 1, 1,
1.054958, -0.1293571, 2.341484, 0, 0, 0, 1, 1,
1.056776, 0.7352918, -0.05720405, 0, 0, 0, 1, 1,
1.057888, -0.2449465, 1.608284, 0, 0, 0, 1, 1,
1.058962, 0.2452769, 1.564374, 0, 0, 0, 1, 1,
1.059504, -0.5817975, 1.650628, 1, 1, 1, 1, 1,
1.061173, 0.6227366, 2.831131, 1, 1, 1, 1, 1,
1.061256, -0.4074018, 0.9164191, 1, 1, 1, 1, 1,
1.075661, 0.1070995, 0.09660216, 1, 1, 1, 1, 1,
1.076043, 1.746491, 0.7640062, 1, 1, 1, 1, 1,
1.080812, 1.510977, 2.253265, 1, 1, 1, 1, 1,
1.082085, -0.5754239, 2.26293, 1, 1, 1, 1, 1,
1.083919, -0.02433437, 1.160746, 1, 1, 1, 1, 1,
1.088677, -1.610904, 2.248903, 1, 1, 1, 1, 1,
1.08947, 0.9809422, 0.1946168, 1, 1, 1, 1, 1,
1.09206, 0.6491608, 1.685776, 1, 1, 1, 1, 1,
1.097386, 1.486961, 0.524849, 1, 1, 1, 1, 1,
1.099736, 0.3355435, 1.652772, 1, 1, 1, 1, 1,
1.106311, -0.3129611, 3.15269, 1, 1, 1, 1, 1,
1.110153, -1.787255, 2.601723, 1, 1, 1, 1, 1,
1.113758, 0.7727107, 2.308849, 0, 0, 1, 1, 1,
1.11748, 0.3332528, 0.9553136, 1, 0, 0, 1, 1,
1.128242, -0.3508662, 2.012831, 1, 0, 0, 1, 1,
1.13292, 0.3584991, 2.069424, 1, 0, 0, 1, 1,
1.136266, -1.52451, 1.895913, 1, 0, 0, 1, 1,
1.136333, -0.6688619, 1.064307, 1, 0, 0, 1, 1,
1.140509, -0.3545485, 0.3908691, 0, 0, 0, 1, 1,
1.141222, 1.127082, 1.452576, 0, 0, 0, 1, 1,
1.141815, -0.1291208, 0.647377, 0, 0, 0, 1, 1,
1.142923, -1.827231, 1.629074, 0, 0, 0, 1, 1,
1.150232, -1.68437, 3.310812, 0, 0, 0, 1, 1,
1.153597, 1.200528, 0.8814803, 0, 0, 0, 1, 1,
1.167125, -1.792249, 3.472438, 0, 0, 0, 1, 1,
1.175623, 0.2517799, 1.216706, 1, 1, 1, 1, 1,
1.177867, 1.368307, 1.193852, 1, 1, 1, 1, 1,
1.178092, 0.009572403, 2.060464, 1, 1, 1, 1, 1,
1.18687, 0.6022328, 0.8649961, 1, 1, 1, 1, 1,
1.191938, -1.101836, 2.505438, 1, 1, 1, 1, 1,
1.192077, 0.1863035, 1.539946, 1, 1, 1, 1, 1,
1.197794, -0.3844979, 2.951203, 1, 1, 1, 1, 1,
1.198491, 0.4379436, 1.175914, 1, 1, 1, 1, 1,
1.200672, -0.879771, 3.636194, 1, 1, 1, 1, 1,
1.211959, 1.150849, -0.4827564, 1, 1, 1, 1, 1,
1.214943, 1.649752, 1.88243, 1, 1, 1, 1, 1,
1.215186, -0.2933766, 2.755231, 1, 1, 1, 1, 1,
1.227986, 1.795411, 0.5102187, 1, 1, 1, 1, 1,
1.231049, -1.154127, 2.155262, 1, 1, 1, 1, 1,
1.246111, 1.025058, 1.654393, 1, 1, 1, 1, 1,
1.250648, -0.05244566, 3.080849, 0, 0, 1, 1, 1,
1.263217, -1.666278, 2.700925, 1, 0, 0, 1, 1,
1.282088, -0.6353056, 2.59625, 1, 0, 0, 1, 1,
1.28888, 0.1213186, 1.139147, 1, 0, 0, 1, 1,
1.290618, 0.3304055, 0.3651259, 1, 0, 0, 1, 1,
1.292594, 0.9681822, 2.220705, 1, 0, 0, 1, 1,
1.303728, -0.01020483, 2.005567, 0, 0, 0, 1, 1,
1.311935, -1.090979, 1.624587, 0, 0, 0, 1, 1,
1.314846, 0.8020371, 0.7458395, 0, 0, 0, 1, 1,
1.3292, -0.1980907, 0.951253, 0, 0, 0, 1, 1,
1.329495, -0.7353661, 2.238929, 0, 0, 0, 1, 1,
1.330636, -0.1427726, 0.4090849, 0, 0, 0, 1, 1,
1.359169, -0.03369035, 1.365997, 0, 0, 0, 1, 1,
1.372391, -0.4579463, 2.602167, 1, 1, 1, 1, 1,
1.380272, -0.1590876, 0.4579607, 1, 1, 1, 1, 1,
1.381298, -1.925319, 4.655035, 1, 1, 1, 1, 1,
1.381829, -1.934715, 2.934029, 1, 1, 1, 1, 1,
1.38705, -0.09268353, 1.724182, 1, 1, 1, 1, 1,
1.394569, -0.5970557, 3.32402, 1, 1, 1, 1, 1,
1.396232, 1.400404, -0.6570933, 1, 1, 1, 1, 1,
1.396426, -0.3896986, 2.433616, 1, 1, 1, 1, 1,
1.400712, -0.5288966, 1.080625, 1, 1, 1, 1, 1,
1.414218, 0.624485, 1.803852, 1, 1, 1, 1, 1,
1.41697, -0.03916789, 2.064592, 1, 1, 1, 1, 1,
1.418276, -1.199045, 0.8742774, 1, 1, 1, 1, 1,
1.437157, 0.6479638, 0.1021389, 1, 1, 1, 1, 1,
1.438849, -0.991477, 1.379027, 1, 1, 1, 1, 1,
1.442091, -1.136974, 1.705679, 1, 1, 1, 1, 1,
1.445085, -0.9914604, 0.4736968, 0, 0, 1, 1, 1,
1.445941, -1.087685, 0.8086263, 1, 0, 0, 1, 1,
1.459228, 0.1847558, 2.824219, 1, 0, 0, 1, 1,
1.459967, 1.17543, 3.216316, 1, 0, 0, 1, 1,
1.463061, 0.01482011, 0.8463283, 1, 0, 0, 1, 1,
1.46477, 0.2926735, 0.734912, 1, 0, 0, 1, 1,
1.467788, 0.02926276, 2.047225, 0, 0, 0, 1, 1,
1.482975, 0.3625115, 2.412295, 0, 0, 0, 1, 1,
1.49365, 2.141492, 0.1178261, 0, 0, 0, 1, 1,
1.494518, -0.04974616, 1.96409, 0, 0, 0, 1, 1,
1.500861, 0.05480095, 0.8680723, 0, 0, 0, 1, 1,
1.524955, 0.06187847, 0.1457725, 0, 0, 0, 1, 1,
1.531698, 2.20785, 0.2340498, 0, 0, 0, 1, 1,
1.535161, -0.4411922, 1.736909, 1, 1, 1, 1, 1,
1.536056, -0.7909193, 2.955422, 1, 1, 1, 1, 1,
1.536603, 1.62845, 1.480046, 1, 1, 1, 1, 1,
1.543818, -0.3597915, 2.218619, 1, 1, 1, 1, 1,
1.549405, 0.07250921, 1.33144, 1, 1, 1, 1, 1,
1.565243, -1.632881, 1.22727, 1, 1, 1, 1, 1,
1.566378, -0.4307111, 3.517269, 1, 1, 1, 1, 1,
1.568288, 0.3450615, 1.764075, 1, 1, 1, 1, 1,
1.569513, 0.3893274, 1.959477, 1, 1, 1, 1, 1,
1.578204, 0.6466144, 1.83868, 1, 1, 1, 1, 1,
1.580459, 1.259771, 1.836559, 1, 1, 1, 1, 1,
1.594574, -0.1209325, 2.241436, 1, 1, 1, 1, 1,
1.614692, -0.9042284, 2.8333, 1, 1, 1, 1, 1,
1.62133, 0.9321188, 1.183634, 1, 1, 1, 1, 1,
1.634291, 0.6769577, 1.018747, 1, 1, 1, 1, 1,
1.638572, -1.902263, 2.239043, 0, 0, 1, 1, 1,
1.646594, -0.3969427, 1.020397, 1, 0, 0, 1, 1,
1.655775, 0.6792133, 1.950969, 1, 0, 0, 1, 1,
1.664521, -0.6607897, 2.029455, 1, 0, 0, 1, 1,
1.677439, -1.128966, 2.209278, 1, 0, 0, 1, 1,
1.692875, -0.6020344, 1.810871, 1, 0, 0, 1, 1,
1.727749, 0.2344218, 1.021376, 0, 0, 0, 1, 1,
1.729245, -1.050451, 2.622371, 0, 0, 0, 1, 1,
1.73322, -0.154003, 2.652484, 0, 0, 0, 1, 1,
1.747829, 0.1629273, 0.3298081, 0, 0, 0, 1, 1,
1.753468, 0.8362627, 0.4908888, 0, 0, 0, 1, 1,
1.764073, -1.167801, 1.141363, 0, 0, 0, 1, 1,
1.774368, 0.05687127, 0.5160106, 0, 0, 0, 1, 1,
1.777358, -0.6089725, 0.992664, 1, 1, 1, 1, 1,
1.778477, -1.424204, 3.187798, 1, 1, 1, 1, 1,
1.778994, -0.05458973, 1.550812, 1, 1, 1, 1, 1,
1.782451, -0.2125195, 2.11735, 1, 1, 1, 1, 1,
1.812426, -1.146852, 3.767843, 1, 1, 1, 1, 1,
1.813771, 0.06839958, 1.532122, 1, 1, 1, 1, 1,
1.816585, -0.0836881, 2.470785, 1, 1, 1, 1, 1,
1.81696, -0.5644873, 2.113888, 1, 1, 1, 1, 1,
1.823342, -0.002476061, 0.06715451, 1, 1, 1, 1, 1,
1.859428, 0.5478848, 0.1608207, 1, 1, 1, 1, 1,
1.880176, -1.862754, 1.620932, 1, 1, 1, 1, 1,
1.893804, -1.390315, 1.109191, 1, 1, 1, 1, 1,
1.956294, -0.4316522, 1.68381, 1, 1, 1, 1, 1,
1.959349, -0.1355266, 0.2759887, 1, 1, 1, 1, 1,
1.960232, 1.562389, 1.382437, 1, 1, 1, 1, 1,
1.965283, -0.392002, 0.8891372, 0, 0, 1, 1, 1,
1.971359, 0.01990172, 1.253196, 1, 0, 0, 1, 1,
1.981424, 0.951532, -0.3912782, 1, 0, 0, 1, 1,
1.988642, 0.9238922, 2.262815, 1, 0, 0, 1, 1,
2.00591, 1.720603, -0.3586728, 1, 0, 0, 1, 1,
2.015956, -0.4117597, 0.941961, 1, 0, 0, 1, 1,
2.053835, -0.4286321, 3.167066, 0, 0, 0, 1, 1,
2.069283, 0.7130434, 1.988179, 0, 0, 0, 1, 1,
2.135334, 0.626496, 2.124258, 0, 0, 0, 1, 1,
2.166702, -0.8256441, 1.483698, 0, 0, 0, 1, 1,
2.176196, 0.9577739, 1.75861, 0, 0, 0, 1, 1,
2.185262, -1.371081, 2.123152, 0, 0, 0, 1, 1,
2.200036, 0.6236295, 1.562272, 0, 0, 0, 1, 1,
2.236095, -0.6931277, 1.663319, 1, 1, 1, 1, 1,
2.279298, -0.322655, 0.4222297, 1, 1, 1, 1, 1,
2.325397, -0.8219469, 3.720644, 1, 1, 1, 1, 1,
2.421834, 0.8947102, 1.603416, 1, 1, 1, 1, 1,
2.468186, -0.9351922, 1.92846, 1, 1, 1, 1, 1,
2.524887, -0.644424, 1.706416, 1, 1, 1, 1, 1,
2.616244, -0.1823957, 1.735222, 1, 1, 1, 1, 1
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
var radius = 9.378477;
var distance = 32.9415;
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
mvMatrix.translate( 0.1736063, 0.02749276, -0.3962605 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.9415);
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
