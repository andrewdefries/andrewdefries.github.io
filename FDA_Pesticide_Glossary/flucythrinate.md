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
-3.575461, -0.3340883, -0.926026, 1, 0, 0, 1,
-2.90135, -0.1161435, -2.367378, 1, 0.007843138, 0, 1,
-2.817442, 0.6539616, -1.836031, 1, 0.01176471, 0, 1,
-2.775427, -1.391369, -3.053024, 1, 0.01960784, 0, 1,
-2.735513, 1.244237, -2.92134, 1, 0.02352941, 0, 1,
-2.656594, 0.1065223, -2.703169, 1, 0.03137255, 0, 1,
-2.594311, 0.1760194, -2.614504, 1, 0.03529412, 0, 1,
-2.550671, 0.8408812, -0.7309351, 1, 0.04313726, 0, 1,
-2.42418, 0.6278331, 0.04259631, 1, 0.04705882, 0, 1,
-2.364556, -0.03181183, 0.01036861, 1, 0.05490196, 0, 1,
-2.355869, -1.488228, -1.036508, 1, 0.05882353, 0, 1,
-2.32408, 0.6113834, -0.8087554, 1, 0.06666667, 0, 1,
-2.319159, 1.213666, 0.2854982, 1, 0.07058824, 0, 1,
-2.283504, -1.79685, -4.586464, 1, 0.07843138, 0, 1,
-2.27909, -0.07052556, -1.147611, 1, 0.08235294, 0, 1,
-2.2219, 0.4071266, 0.2516389, 1, 0.09019608, 0, 1,
-2.172626, -0.6032902, -2.50809, 1, 0.09411765, 0, 1,
-2.153322, -0.1612521, -3.814396, 1, 0.1019608, 0, 1,
-2.131543, 0.9989426, 0.2681466, 1, 0.1098039, 0, 1,
-2.124994, 0.6023971, 0.5273275, 1, 0.1137255, 0, 1,
-2.085949, 0.625703, -0.2985237, 1, 0.1215686, 0, 1,
-2.078966, -0.2574462, -3.272567, 1, 0.1254902, 0, 1,
-2.072147, 0.3837083, -1.456632, 1, 0.1333333, 0, 1,
-2.070601, 2.109859, -0.6007718, 1, 0.1372549, 0, 1,
-2.048893, 0.3209183, -1.482348, 1, 0.145098, 0, 1,
-2.03842, 0.3223804, -1.500482, 1, 0.1490196, 0, 1,
-2.015371, -2.227711, -2.450707, 1, 0.1568628, 0, 1,
-2.013655, 0.1898263, -1.736346, 1, 0.1607843, 0, 1,
-1.99504, -0.9098512, -3.315618, 1, 0.1686275, 0, 1,
-1.990099, -0.08699919, -4.000425, 1, 0.172549, 0, 1,
-1.981911, 0.2566617, -0.9230157, 1, 0.1803922, 0, 1,
-1.95447, 0.2395424, -2.166137, 1, 0.1843137, 0, 1,
-1.953738, 0.1801986, -2.383683, 1, 0.1921569, 0, 1,
-1.953174, 0.3620643, -2.657398, 1, 0.1960784, 0, 1,
-1.946591, -0.6896108, -2.491605, 1, 0.2039216, 0, 1,
-1.944867, -0.4699447, -1.335433, 1, 0.2117647, 0, 1,
-1.94069, -0.7808238, -1.974198, 1, 0.2156863, 0, 1,
-1.930277, 1.08548, -0.7066909, 1, 0.2235294, 0, 1,
-1.908342, -0.6633242, -0.682327, 1, 0.227451, 0, 1,
-1.90769, 0.1316455, -3.26494, 1, 0.2352941, 0, 1,
-1.876295, 0.2213217, -1.148, 1, 0.2392157, 0, 1,
-1.874712, -0.3060226, -1.556393, 1, 0.2470588, 0, 1,
-1.798056, -0.0620314, -2.827955, 1, 0.2509804, 0, 1,
-1.79719, -0.5540785, -0.5292697, 1, 0.2588235, 0, 1,
-1.792761, 0.6921256, -1.440447, 1, 0.2627451, 0, 1,
-1.767261, 0.8191262, -0.6226284, 1, 0.2705882, 0, 1,
-1.746219, -0.7430184, -2.279386, 1, 0.2745098, 0, 1,
-1.736417, 0.5635489, -0.001633441, 1, 0.282353, 0, 1,
-1.726261, -1.424387, 1.037682, 1, 0.2862745, 0, 1,
-1.726069, -0.1259986, -1.265935, 1, 0.2941177, 0, 1,
-1.689163, 0.8640168, -1.869672, 1, 0.3019608, 0, 1,
-1.685919, 0.8535503, -0.1691996, 1, 0.3058824, 0, 1,
-1.674577, -0.5978597, -2.282525, 1, 0.3137255, 0, 1,
-1.671837, -0.2434158, -1.917435, 1, 0.3176471, 0, 1,
-1.666459, 1.323191, -1.155321, 1, 0.3254902, 0, 1,
-1.618221, 0.7785754, -0.4251095, 1, 0.3294118, 0, 1,
-1.614834, 1.003816, -0.9256, 1, 0.3372549, 0, 1,
-1.614387, 0.6621545, -1.92737, 1, 0.3411765, 0, 1,
-1.598699, -2.286375, -2.492131, 1, 0.3490196, 0, 1,
-1.594995, 0.2611407, -0.1045105, 1, 0.3529412, 0, 1,
-1.578405, 1.32654, 1.606588, 1, 0.3607843, 0, 1,
-1.576054, 0.2028224, -0.2677352, 1, 0.3647059, 0, 1,
-1.575244, 0.3455473, -1.130426, 1, 0.372549, 0, 1,
-1.565662, 1.198265, -1.505915, 1, 0.3764706, 0, 1,
-1.561176, -2.651888, -3.720938, 1, 0.3843137, 0, 1,
-1.55627, -0.3790391, -1.385261, 1, 0.3882353, 0, 1,
-1.548672, 1.521793, 0.4459567, 1, 0.3960784, 0, 1,
-1.537233, 1.121263, -1.161176, 1, 0.4039216, 0, 1,
-1.53401, -0.9244694, 0.1145604, 1, 0.4078431, 0, 1,
-1.529498, 0.6812776, -2.456704, 1, 0.4156863, 0, 1,
-1.527474, 0.1851098, -0.904723, 1, 0.4196078, 0, 1,
-1.521965, -1.841377, -3.543539, 1, 0.427451, 0, 1,
-1.515533, -0.4124522, -1.380176, 1, 0.4313726, 0, 1,
-1.513577, 0.3660506, 0.1048863, 1, 0.4392157, 0, 1,
-1.494084, -1.43499, -2.645059, 1, 0.4431373, 0, 1,
-1.49087, 1.539324, -0.4402758, 1, 0.4509804, 0, 1,
-1.477547, 1.142166, -0.8488501, 1, 0.454902, 0, 1,
-1.467932, -0.4403815, -1.661199, 1, 0.4627451, 0, 1,
-1.466321, -1.950507, -2.760485, 1, 0.4666667, 0, 1,
-1.46466, 0.1370003, -1.548729, 1, 0.4745098, 0, 1,
-1.463896, -1.356499, -3.236757, 1, 0.4784314, 0, 1,
-1.462505, -0.4575529, -1.4109, 1, 0.4862745, 0, 1,
-1.46028, 0.9562814, 0.7501541, 1, 0.4901961, 0, 1,
-1.446881, 0.8532487, -2.33878, 1, 0.4980392, 0, 1,
-1.444741, -0.4002644, -3.012531, 1, 0.5058824, 0, 1,
-1.419801, 0.8954875, -0.5250221, 1, 0.509804, 0, 1,
-1.417207, 1.26443, -1.16411, 1, 0.5176471, 0, 1,
-1.414655, 1.376514, -0.06093441, 1, 0.5215687, 0, 1,
-1.41185, -0.4084341, -2.004996, 1, 0.5294118, 0, 1,
-1.391002, 0.462172, -0.6995984, 1, 0.5333334, 0, 1,
-1.379665, -0.2495293, -1.670697, 1, 0.5411765, 0, 1,
-1.355665, -1.146049, -1.974884, 1, 0.5450981, 0, 1,
-1.352852, 0.9344776, -1.585104, 1, 0.5529412, 0, 1,
-1.342234, -0.07879075, -2.479663, 1, 0.5568628, 0, 1,
-1.334152, 0.3747786, -1.254631, 1, 0.5647059, 0, 1,
-1.328686, -0.1895342, -1.120408, 1, 0.5686275, 0, 1,
-1.32346, 1.835704, -0.4764805, 1, 0.5764706, 0, 1,
-1.319266, 1.31916, -0.6086139, 1, 0.5803922, 0, 1,
-1.318098, 0.4335816, 0.1728893, 1, 0.5882353, 0, 1,
-1.316499, -1.412624, -1.21133, 1, 0.5921569, 0, 1,
-1.315394, -0.8294315, -1.490645, 1, 0.6, 0, 1,
-1.315041, -0.7738605, -4.77517, 1, 0.6078432, 0, 1,
-1.305436, 2.106209, -1.096446, 1, 0.6117647, 0, 1,
-1.296056, 0.7211304, -0.8488234, 1, 0.6196079, 0, 1,
-1.279377, 0.1935772, -1.424392, 1, 0.6235294, 0, 1,
-1.279242, 1.547617, -1.248219, 1, 0.6313726, 0, 1,
-1.277458, -2.067951, -3.478029, 1, 0.6352941, 0, 1,
-1.241932, 0.3761153, -2.004897, 1, 0.6431373, 0, 1,
-1.241716, 1.500539, -0.7821867, 1, 0.6470588, 0, 1,
-1.235911, -0.5077057, -3.050942, 1, 0.654902, 0, 1,
-1.233481, 0.3523812, -1.56991, 1, 0.6588235, 0, 1,
-1.233284, 0.2396291, -1.501898, 1, 0.6666667, 0, 1,
-1.227408, 2.48069, 0.3540526, 1, 0.6705883, 0, 1,
-1.226806, -0.8017919, -1.937189, 1, 0.6784314, 0, 1,
-1.224221, -0.7985253, -1.094643, 1, 0.682353, 0, 1,
-1.199566, 0.4146267, -3.288053, 1, 0.6901961, 0, 1,
-1.196917, 0.2340927, -2.374073, 1, 0.6941177, 0, 1,
-1.194462, -0.3244031, -1.455746, 1, 0.7019608, 0, 1,
-1.184234, 0.6743501, -0.5761389, 1, 0.7098039, 0, 1,
-1.170159, -0.7054669, -1.066384, 1, 0.7137255, 0, 1,
-1.168976, 1.521559, 0.005370979, 1, 0.7215686, 0, 1,
-1.166658, -0.546331, -1.835265, 1, 0.7254902, 0, 1,
-1.162726, -1.407068, -2.747481, 1, 0.7333333, 0, 1,
-1.154202, 1.817234, 0.7437329, 1, 0.7372549, 0, 1,
-1.148467, 0.5849469, -0.2423839, 1, 0.7450981, 0, 1,
-1.148409, 1.615564, 0.2165223, 1, 0.7490196, 0, 1,
-1.14716, -0.2584139, -2.276471, 1, 0.7568628, 0, 1,
-1.144485, 0.3933127, -0.716848, 1, 0.7607843, 0, 1,
-1.142444, 0.7758894, -1.99855, 1, 0.7686275, 0, 1,
-1.140449, -0.9553829, -3.060238, 1, 0.772549, 0, 1,
-1.127682, 1.895563, 1.007376, 1, 0.7803922, 0, 1,
-1.125852, 0.1230766, -2.837981, 1, 0.7843137, 0, 1,
-1.11111, -0.522484, -1.432015, 1, 0.7921569, 0, 1,
-1.102232, -0.4834823, -2.055901, 1, 0.7960784, 0, 1,
-1.098262, 0.3678633, -2.524258, 1, 0.8039216, 0, 1,
-1.095608, -1.037746, -2.129681, 1, 0.8117647, 0, 1,
-1.094585, 0.9605414, 0.3627035, 1, 0.8156863, 0, 1,
-1.093588, 0.4168282, -1.158707, 1, 0.8235294, 0, 1,
-1.09056, -0.03374385, -1.957654, 1, 0.827451, 0, 1,
-1.088252, 0.8047046, -0.3505332, 1, 0.8352941, 0, 1,
-1.078446, -0.08319496, -1.453077, 1, 0.8392157, 0, 1,
-1.075848, -0.9061298, -3.310673, 1, 0.8470588, 0, 1,
-1.074002, 0.2789516, -1.209768, 1, 0.8509804, 0, 1,
-1.073409, 0.4526651, -0.6749359, 1, 0.8588235, 0, 1,
-1.069881, -0.6998404, -2.485256, 1, 0.8627451, 0, 1,
-1.067811, 0.7172244, -2.833152, 1, 0.8705882, 0, 1,
-1.051351, 0.4549627, -3.261063, 1, 0.8745098, 0, 1,
-1.051312, 0.8250361, -1.751465, 1, 0.8823529, 0, 1,
-1.018326, 2.898626, 0.4264138, 1, 0.8862745, 0, 1,
-1.015981, -0.5290868, -0.965363, 1, 0.8941177, 0, 1,
-1.015216, -0.9383852, -2.891278, 1, 0.8980392, 0, 1,
-1.012064, 0.5252258, 0.05830408, 1, 0.9058824, 0, 1,
-1.008722, -0.7134905, -1.802154, 1, 0.9137255, 0, 1,
-1.006977, -1.18591, -4.260184, 1, 0.9176471, 0, 1,
-1.003786, 1.134314, -1.504748, 1, 0.9254902, 0, 1,
-0.9870617, -1.017518, -1.192086, 1, 0.9294118, 0, 1,
-0.9856633, -0.08167777, -3.321598, 1, 0.9372549, 0, 1,
-0.9816637, -0.946119, -3.025964, 1, 0.9411765, 0, 1,
-0.9773746, -2.495472, -3.128037, 1, 0.9490196, 0, 1,
-0.9767737, -0.4252012, -0.9603599, 1, 0.9529412, 0, 1,
-0.975726, -0.4519101, -3.992988, 1, 0.9607843, 0, 1,
-0.9756995, 0.6960106, -1.891142, 1, 0.9647059, 0, 1,
-0.9709981, -0.1204079, -0.9211046, 1, 0.972549, 0, 1,
-0.9660871, -1.012064, -1.98676, 1, 0.9764706, 0, 1,
-0.9638066, -1.752399, -0.6621351, 1, 0.9843137, 0, 1,
-0.9548518, -0.3460087, -3.484149, 1, 0.9882353, 0, 1,
-0.9521403, 0.5708765, -0.1021069, 1, 0.9960784, 0, 1,
-0.9508588, 1.556391, -0.1299386, 0.9960784, 1, 0, 1,
-0.9495402, -1.100665, -3.712569, 0.9921569, 1, 0, 1,
-0.9490917, -1.014364, -1.734434, 0.9843137, 1, 0, 1,
-0.9489217, -0.9000157, -2.256563, 0.9803922, 1, 0, 1,
-0.9467558, -0.7732076, -1.941876, 0.972549, 1, 0, 1,
-0.9441094, -2.551178, -3.535098, 0.9686275, 1, 0, 1,
-0.9430836, -2.14848, -2.006675, 0.9607843, 1, 0, 1,
-0.9427552, -0.9738829, -2.651392, 0.9568627, 1, 0, 1,
-0.9408343, 0.04349557, -2.068185, 0.9490196, 1, 0, 1,
-0.9376726, -1.537192, -1.893153, 0.945098, 1, 0, 1,
-0.9319155, 0.720989, -0.7604, 0.9372549, 1, 0, 1,
-0.915948, -2.146094, -2.526353, 0.9333333, 1, 0, 1,
-0.9042004, 0.09907191, -0.2050333, 0.9254902, 1, 0, 1,
-0.9029576, -1.600992, -2.300426, 0.9215686, 1, 0, 1,
-0.8986875, -0.166067, -0.1473646, 0.9137255, 1, 0, 1,
-0.8945248, -0.9127528, -2.049587, 0.9098039, 1, 0, 1,
-0.8904684, -0.4452428, -2.980327, 0.9019608, 1, 0, 1,
-0.8799617, -1.194505, -1.958878, 0.8941177, 1, 0, 1,
-0.8705165, 0.1159954, -2.08876, 0.8901961, 1, 0, 1,
-0.8691841, 0.2181178, -2.000978, 0.8823529, 1, 0, 1,
-0.8635197, -0.7768494, -2.233732, 0.8784314, 1, 0, 1,
-0.8617907, 1.573759, -0.7662492, 0.8705882, 1, 0, 1,
-0.8600615, -0.6482846, -1.998526, 0.8666667, 1, 0, 1,
-0.8516678, -0.2730912, -2.196308, 0.8588235, 1, 0, 1,
-0.8516505, 0.01540265, -0.0541277, 0.854902, 1, 0, 1,
-0.8506937, -0.9689763, -2.176781, 0.8470588, 1, 0, 1,
-0.8482904, 1.510834, -1.907155, 0.8431373, 1, 0, 1,
-0.8437864, -0.6478146, -2.333162, 0.8352941, 1, 0, 1,
-0.8351265, 0.5992777, 0.01753897, 0.8313726, 1, 0, 1,
-0.8324302, 1.020816, -2.271955, 0.8235294, 1, 0, 1,
-0.8317917, -0.04675767, -2.390319, 0.8196079, 1, 0, 1,
-0.8311847, -0.5441206, -3.187855, 0.8117647, 1, 0, 1,
-0.8260858, -0.7591115, -1.463002, 0.8078431, 1, 0, 1,
-0.8200866, -0.1168861, -1.422599, 0.8, 1, 0, 1,
-0.8187285, 0.6361232, -1.684534, 0.7921569, 1, 0, 1,
-0.8185971, -1.130459, -3.471271, 0.7882353, 1, 0, 1,
-0.8183873, -1.193281, -1.989647, 0.7803922, 1, 0, 1,
-0.8134055, 0.514326, -2.07311, 0.7764706, 1, 0, 1,
-0.8053389, -0.6727802, -1.886805, 0.7686275, 1, 0, 1,
-0.8041738, -2.144094, -3.664348, 0.7647059, 1, 0, 1,
-0.8040057, 0.6024228, -1.004514, 0.7568628, 1, 0, 1,
-0.8038462, 0.4382824, -0.7318799, 0.7529412, 1, 0, 1,
-0.7978765, 0.9940082, 0.6256861, 0.7450981, 1, 0, 1,
-0.7974284, -0.3202515, -1.957673, 0.7411765, 1, 0, 1,
-0.7957144, -0.1912421, -1.341635, 0.7333333, 1, 0, 1,
-0.7926069, 0.1896624, 0.2018959, 0.7294118, 1, 0, 1,
-0.79224, 0.3018942, -2.765023, 0.7215686, 1, 0, 1,
-0.7815135, 0.5097655, -1.880542, 0.7176471, 1, 0, 1,
-0.7793332, -2.681442, -4.623647, 0.7098039, 1, 0, 1,
-0.7791083, 0.4164361, -1.698254, 0.7058824, 1, 0, 1,
-0.7790799, 0.6027754, -1.612635, 0.6980392, 1, 0, 1,
-0.7776114, -0.1999192, -2.548857, 0.6901961, 1, 0, 1,
-0.7767774, -0.9581981, -3.285446, 0.6862745, 1, 0, 1,
-0.7758539, 0.1564647, 0.3115444, 0.6784314, 1, 0, 1,
-0.7754571, 0.1757249, -1.693952, 0.6745098, 1, 0, 1,
-0.7685457, 1.319054, -1.483428, 0.6666667, 1, 0, 1,
-0.7667619, 0.4353046, -2.451074, 0.6627451, 1, 0, 1,
-0.7657298, -0.3731486, -1.895319, 0.654902, 1, 0, 1,
-0.7636577, -0.5203696, -3.564617, 0.6509804, 1, 0, 1,
-0.7548724, 3.002729, -0.6799478, 0.6431373, 1, 0, 1,
-0.7526692, 0.8398212, -0.8861881, 0.6392157, 1, 0, 1,
-0.7525288, -0.8059819, -1.571482, 0.6313726, 1, 0, 1,
-0.7495707, 0.5404763, -0.356004, 0.627451, 1, 0, 1,
-0.7453003, -0.1934419, -1.77335, 0.6196079, 1, 0, 1,
-0.7452702, 0.781549, 0.7408045, 0.6156863, 1, 0, 1,
-0.7415809, 0.9209393, -1.490638, 0.6078432, 1, 0, 1,
-0.740545, -0.2717376, -2.120462, 0.6039216, 1, 0, 1,
-0.7393605, -0.3329263, -2.147932, 0.5960785, 1, 0, 1,
-0.7370746, 0.5306454, -2.402468, 0.5882353, 1, 0, 1,
-0.7361379, -1.020021, -3.891039, 0.5843138, 1, 0, 1,
-0.7348258, 0.5352282, -2.047258, 0.5764706, 1, 0, 1,
-0.7312822, 0.4750101, -1.20462, 0.572549, 1, 0, 1,
-0.7298239, -0.2336454, -0.6741993, 0.5647059, 1, 0, 1,
-0.729064, -0.56204, -2.050471, 0.5607843, 1, 0, 1,
-0.7286852, -0.8328406, -1.645453, 0.5529412, 1, 0, 1,
-0.7285773, -0.2654757, -1.840242, 0.5490196, 1, 0, 1,
-0.7125462, 0.3447416, -1.554013, 0.5411765, 1, 0, 1,
-0.7125106, 0.8637384, -0.3421865, 0.5372549, 1, 0, 1,
-0.7107899, -0.9027795, -2.770092, 0.5294118, 1, 0, 1,
-0.7100149, 0.6750374, -3.233847, 0.5254902, 1, 0, 1,
-0.7094265, 1.377857, -0.3151188, 0.5176471, 1, 0, 1,
-0.7090799, 0.6852915, 1.672155, 0.5137255, 1, 0, 1,
-0.7077507, 1.598936, -0.1515946, 0.5058824, 1, 0, 1,
-0.7071888, -1.540553, -3.894688, 0.5019608, 1, 0, 1,
-0.7065004, 1.279567, 0.5371752, 0.4941176, 1, 0, 1,
-0.7064296, 0.2490804, -2.211499, 0.4862745, 1, 0, 1,
-0.7058027, -1.887525, -3.737412, 0.4823529, 1, 0, 1,
-0.701369, -0.5790571, -3.790625, 0.4745098, 1, 0, 1,
-0.6997882, -0.1168816, -0.7258176, 0.4705882, 1, 0, 1,
-0.6956365, -0.2034884, -1.545891, 0.4627451, 1, 0, 1,
-0.6932987, -0.4055983, -2.337539, 0.4588235, 1, 0, 1,
-0.6922647, 0.1944354, -2.906511, 0.4509804, 1, 0, 1,
-0.6900424, -0.3535648, -1.533446, 0.4470588, 1, 0, 1,
-0.6854349, -0.6004452, -2.001111, 0.4392157, 1, 0, 1,
-0.6733607, -0.2820491, -2.486013, 0.4352941, 1, 0, 1,
-0.6714221, 1.419274, 1.65053, 0.427451, 1, 0, 1,
-0.670193, 0.9081534, 0.9335508, 0.4235294, 1, 0, 1,
-0.6669151, 0.3372633, -0.8317938, 0.4156863, 1, 0, 1,
-0.6632115, 0.8817257, -0.7074669, 0.4117647, 1, 0, 1,
-0.6619989, -0.5398282, -2.995041, 0.4039216, 1, 0, 1,
-0.6571046, 3.132524, -0.04492323, 0.3960784, 1, 0, 1,
-0.6465743, -0.1165724, -2.341098, 0.3921569, 1, 0, 1,
-0.6424165, 0.8989066, -0.5950545, 0.3843137, 1, 0, 1,
-0.6418715, -0.7233348, -3.180822, 0.3803922, 1, 0, 1,
-0.6405382, 0.9208801, -0.2824548, 0.372549, 1, 0, 1,
-0.638342, -0.3970113, -1.089239, 0.3686275, 1, 0, 1,
-0.6284388, -0.9921582, -2.084845, 0.3607843, 1, 0, 1,
-0.6273797, -1.623206, -5.017272, 0.3568628, 1, 0, 1,
-0.6227466, -1.897262, -4.159245, 0.3490196, 1, 0, 1,
-0.612769, 1.543131, 0.1618827, 0.345098, 1, 0, 1,
-0.6100289, 1.024232, -1.830796, 0.3372549, 1, 0, 1,
-0.6056906, -1.487965, -1.258148, 0.3333333, 1, 0, 1,
-0.6025831, -0.2752562, -1.428372, 0.3254902, 1, 0, 1,
-0.5994232, 0.2828171, -1.870556, 0.3215686, 1, 0, 1,
-0.5988953, 1.216038, 0.6774426, 0.3137255, 1, 0, 1,
-0.5959163, -0.5963848, -2.465048, 0.3098039, 1, 0, 1,
-0.5949486, -1.840031, -4.969228, 0.3019608, 1, 0, 1,
-0.5897067, 0.5171602, -1.992497, 0.2941177, 1, 0, 1,
-0.5863715, -0.1257896, -1.695439, 0.2901961, 1, 0, 1,
-0.5783235, 0.7532808, -1.296927, 0.282353, 1, 0, 1,
-0.5755649, -1.435163, -2.497885, 0.2784314, 1, 0, 1,
-0.5720941, -1.314976, -3.724184, 0.2705882, 1, 0, 1,
-0.5702709, -1.08377, -1.222959, 0.2666667, 1, 0, 1,
-0.5693672, 0.6226032, 1.381005, 0.2588235, 1, 0, 1,
-0.5653419, -0.1936447, -1.998718, 0.254902, 1, 0, 1,
-0.5617826, 0.7993038, -0.3522215, 0.2470588, 1, 0, 1,
-0.5533812, -0.5005135, -2.503773, 0.2431373, 1, 0, 1,
-0.5459032, 0.8897268, -2.663841, 0.2352941, 1, 0, 1,
-0.5445881, -0.6201164, -3.188845, 0.2313726, 1, 0, 1,
-0.5434447, 1.130955, -0.5561371, 0.2235294, 1, 0, 1,
-0.5426264, 1.356567, -0.7309579, 0.2196078, 1, 0, 1,
-0.5357272, 0.6520886, -0.02066696, 0.2117647, 1, 0, 1,
-0.5312847, 0.3225505, 0.4556426, 0.2078431, 1, 0, 1,
-0.5288784, 0.2965983, -0.7457748, 0.2, 1, 0, 1,
-0.5270894, 1.689211, -0.3608148, 0.1921569, 1, 0, 1,
-0.5257891, 0.06827159, -0.5942395, 0.1882353, 1, 0, 1,
-0.5242714, 0.7147037, -1.056061, 0.1803922, 1, 0, 1,
-0.514329, -1.28889, -3.304893, 0.1764706, 1, 0, 1,
-0.5095646, -0.8548293, -2.192978, 0.1686275, 1, 0, 1,
-0.5081224, 0.01224236, -3.436227, 0.1647059, 1, 0, 1,
-0.5077668, 1.461163, 2.969701, 0.1568628, 1, 0, 1,
-0.5049583, 0.9362497, -1.026955, 0.1529412, 1, 0, 1,
-0.5030581, 0.1390998, -0.5624993, 0.145098, 1, 0, 1,
-0.4998321, -0.239845, -1.936068, 0.1411765, 1, 0, 1,
-0.4991271, -0.2893766, -1.934276, 0.1333333, 1, 0, 1,
-0.4979347, 0.7994267, 1.378987, 0.1294118, 1, 0, 1,
-0.4968659, 0.9080815, -0.8020823, 0.1215686, 1, 0, 1,
-0.4908372, 0.08597855, -3.261811, 0.1176471, 1, 0, 1,
-0.4880909, -1.636175, -3.969376, 0.1098039, 1, 0, 1,
-0.4845275, 1.232274, -1.281937, 0.1058824, 1, 0, 1,
-0.484456, 0.9708048, 0.8290069, 0.09803922, 1, 0, 1,
-0.4775655, 0.1414582, -2.404191, 0.09019608, 1, 0, 1,
-0.4739985, -0.1035115, -1.969874, 0.08627451, 1, 0, 1,
-0.4715727, 1.36199, -1.736061, 0.07843138, 1, 0, 1,
-0.4699163, -0.1174237, -2.075384, 0.07450981, 1, 0, 1,
-0.4695365, -0.1026973, -1.811086, 0.06666667, 1, 0, 1,
-0.4694395, -1.03966, -3.99536, 0.0627451, 1, 0, 1,
-0.4659532, -1.273393, -3.121191, 0.05490196, 1, 0, 1,
-0.4654669, 1.15421, 0.1396224, 0.05098039, 1, 0, 1,
-0.4631936, 0.5619261, 0.4154128, 0.04313726, 1, 0, 1,
-0.4559423, 0.814811, -0.3353518, 0.03921569, 1, 0, 1,
-0.4556138, 1.75012, 1.65976, 0.03137255, 1, 0, 1,
-0.4497792, 0.5023091, -1.219674, 0.02745098, 1, 0, 1,
-0.4395359, -0.7332276, -3.653775, 0.01960784, 1, 0, 1,
-0.4386194, -0.8226316, -2.412376, 0.01568628, 1, 0, 1,
-0.4343813, 0.8314145, -0.9327685, 0.007843138, 1, 0, 1,
-0.4313012, 0.5825337, -1.664588, 0.003921569, 1, 0, 1,
-0.4311195, -0.5228116, -1.919548, 0, 1, 0.003921569, 1,
-0.4281611, 0.04399383, -1.986553, 0, 1, 0.01176471, 1,
-0.4261157, 0.1785997, -2.827191, 0, 1, 0.01568628, 1,
-0.4211824, -0.6857935, -1.761328, 0, 1, 0.02352941, 1,
-0.4201624, 1.128958, 0.9967349, 0, 1, 0.02745098, 1,
-0.4162611, 1.496909, 1.098951, 0, 1, 0.03529412, 1,
-0.4142668, 0.01161603, -0.6235884, 0, 1, 0.03921569, 1,
-0.408331, 0.7289072, -0.2504582, 0, 1, 0.04705882, 1,
-0.4076421, 0.5940309, 1.27462, 0, 1, 0.05098039, 1,
-0.4064929, 0.4876877, -0.7361196, 0, 1, 0.05882353, 1,
-0.4017048, 0.9814214, -1.881371, 0, 1, 0.0627451, 1,
-0.400955, 0.07597869, -3.49435, 0, 1, 0.07058824, 1,
-0.3997534, -0.7822523, -0.297287, 0, 1, 0.07450981, 1,
-0.3956317, 0.296152, -0.4164207, 0, 1, 0.08235294, 1,
-0.392878, 0.2588277, 1.420029, 0, 1, 0.08627451, 1,
-0.391546, 1.394786, -1.797031, 0, 1, 0.09411765, 1,
-0.3848179, 0.06771724, 0.117262, 0, 1, 0.1019608, 1,
-0.3842174, -0.5753173, -3.147579, 0, 1, 0.1058824, 1,
-0.375211, -0.6921958, -2.311748, 0, 1, 0.1137255, 1,
-0.3718527, -1.598542, -2.347055, 0, 1, 0.1176471, 1,
-0.3712139, 1.022429, 0.977024, 0, 1, 0.1254902, 1,
-0.3711973, 0.9444209, -1.600781, 0, 1, 0.1294118, 1,
-0.3670434, -1.61711, -3.051845, 0, 1, 0.1372549, 1,
-0.3662416, -1.152857, -3.958839, 0, 1, 0.1411765, 1,
-0.3631883, -0.2302653, -2.661631, 0, 1, 0.1490196, 1,
-0.3622243, -0.4228533, -1.977536, 0, 1, 0.1529412, 1,
-0.3618517, -0.1014871, -3.143697, 0, 1, 0.1607843, 1,
-0.3616289, 2.069547, 1.91381, 0, 1, 0.1647059, 1,
-0.3552632, 2.013902, -0.08330829, 0, 1, 0.172549, 1,
-0.3523495, 0.2668035, -2.765728, 0, 1, 0.1764706, 1,
-0.3503745, -0.02139445, -2.451402, 0, 1, 0.1843137, 1,
-0.3498518, 0.5486451, -3.063136, 0, 1, 0.1882353, 1,
-0.3494464, -0.256851, 0.1594058, 0, 1, 0.1960784, 1,
-0.3477418, 0.9654102, -1.088868, 0, 1, 0.2039216, 1,
-0.346733, 0.08274345, -1.652081, 0, 1, 0.2078431, 1,
-0.3460655, -0.2299554, -0.930519, 0, 1, 0.2156863, 1,
-0.3452877, 3.060391, 0.08352102, 0, 1, 0.2196078, 1,
-0.3422485, -0.6258325, -2.541301, 0, 1, 0.227451, 1,
-0.3422335, 0.2761475, -2.394992, 0, 1, 0.2313726, 1,
-0.340125, 0.7786529, 0.8941908, 0, 1, 0.2392157, 1,
-0.3389456, -1.219086, -1.355638, 0, 1, 0.2431373, 1,
-0.3388485, 0.5145743, -0.2688541, 0, 1, 0.2509804, 1,
-0.3372731, 2.039022, -1.69963, 0, 1, 0.254902, 1,
-0.3365475, -1.645866, -4.063728, 0, 1, 0.2627451, 1,
-0.3323903, 0.3930397, 0.7246063, 0, 1, 0.2666667, 1,
-0.3318531, -0.7591994, -2.719684, 0, 1, 0.2745098, 1,
-0.3291822, -0.6370758, -1.532644, 0, 1, 0.2784314, 1,
-0.3270623, -0.4948932, -2.671937, 0, 1, 0.2862745, 1,
-0.3269483, 0.1686861, 0.5843688, 0, 1, 0.2901961, 1,
-0.324258, 0.3219587, -1.141787, 0, 1, 0.2980392, 1,
-0.3231336, 0.47936, -0.6488108, 0, 1, 0.3058824, 1,
-0.3214222, -0.6944681, -1.758973, 0, 1, 0.3098039, 1,
-0.3209354, -0.7906865, -3.4539, 0, 1, 0.3176471, 1,
-0.3157775, 0.3522704, 0.17918, 0, 1, 0.3215686, 1,
-0.3117042, -1.737223, -2.693542, 0, 1, 0.3294118, 1,
-0.3113245, -1.088427, -2.112486, 0, 1, 0.3333333, 1,
-0.3077153, 0.5474908, -1.067744, 0, 1, 0.3411765, 1,
-0.3075644, 1.433974, 0.6979718, 0, 1, 0.345098, 1,
-0.3073337, 0.780261, 0.1029058, 0, 1, 0.3529412, 1,
-0.3069198, -0.8811083, -2.964959, 0, 1, 0.3568628, 1,
-0.3008719, -0.904881, -3.082933, 0, 1, 0.3647059, 1,
-0.2989116, 0.2660708, -1.358067, 0, 1, 0.3686275, 1,
-0.2965936, -0.1852933, -2.819546, 0, 1, 0.3764706, 1,
-0.2964187, -1.204739, -2.499062, 0, 1, 0.3803922, 1,
-0.2865633, 0.4134854, -1.24068, 0, 1, 0.3882353, 1,
-0.2842267, -1.024976, -3.226614, 0, 1, 0.3921569, 1,
-0.2835978, 1.725025, -1.9376, 0, 1, 0.4, 1,
-0.2820541, -0.06855838, -2.952623, 0, 1, 0.4078431, 1,
-0.2785471, -1.722233, -2.889448, 0, 1, 0.4117647, 1,
-0.2777232, -0.8964242, -4.635609, 0, 1, 0.4196078, 1,
-0.2765676, 0.9736487, -2.298151, 0, 1, 0.4235294, 1,
-0.2731683, -0.2852179, -2.001601, 0, 1, 0.4313726, 1,
-0.2716763, 0.6738117, -0.6338319, 0, 1, 0.4352941, 1,
-0.2698933, 1.270356, -1.06212, 0, 1, 0.4431373, 1,
-0.2682436, -1.071337, -5.287016, 0, 1, 0.4470588, 1,
-0.2656318, 1.578375, -2.12095, 0, 1, 0.454902, 1,
-0.259403, 1.982936, 0.6647418, 0, 1, 0.4588235, 1,
-0.2545878, -0.3130026, -5.525143, 0, 1, 0.4666667, 1,
-0.2536417, -1.281402, -2.630617, 0, 1, 0.4705882, 1,
-0.2513285, -0.6902082, -2.370474, 0, 1, 0.4784314, 1,
-0.2506134, -0.6366722, -3.411218, 0, 1, 0.4823529, 1,
-0.2500215, -0.8754632, -3.525683, 0, 1, 0.4901961, 1,
-0.24787, -0.495956, -3.414705, 0, 1, 0.4941176, 1,
-0.2476157, -0.1141075, -1.811362, 0, 1, 0.5019608, 1,
-0.2455097, 0.5272001, 2.255178, 0, 1, 0.509804, 1,
-0.244443, -1.823396, -2.5299, 0, 1, 0.5137255, 1,
-0.240848, -0.7603143, -2.967228, 0, 1, 0.5215687, 1,
-0.2399251, 0.6098378, -1.344096, 0, 1, 0.5254902, 1,
-0.2373478, 1.159125, 1.344483, 0, 1, 0.5333334, 1,
-0.2366406, -1.474937, -2.614485, 0, 1, 0.5372549, 1,
-0.2346082, -0.9474409, -2.810661, 0, 1, 0.5450981, 1,
-0.2343047, -0.6877515, -4.051764, 0, 1, 0.5490196, 1,
-0.2323711, 3.289572, 0.4143146, 0, 1, 0.5568628, 1,
-0.2313781, 0.0743835, -1.950096, 0, 1, 0.5607843, 1,
-0.2284405, -0.3907629, -0.5290017, 0, 1, 0.5686275, 1,
-0.2279138, 0.3810102, -1.261901, 0, 1, 0.572549, 1,
-0.227394, -1.039212, -4.019648, 0, 1, 0.5803922, 1,
-0.2266835, -0.7127199, -2.050172, 0, 1, 0.5843138, 1,
-0.2258421, -1.346226, -3.803576, 0, 1, 0.5921569, 1,
-0.2221327, 0.1519483, -1.836756, 0, 1, 0.5960785, 1,
-0.2195997, -0.5284194, -4.012046, 0, 1, 0.6039216, 1,
-0.2159466, 0.2913644, 1.058501, 0, 1, 0.6117647, 1,
-0.2097514, 0.7769659, -0.2476455, 0, 1, 0.6156863, 1,
-0.2074243, 0.2893866, -0.53799, 0, 1, 0.6235294, 1,
-0.2059531, -1.360202, -0.9945055, 0, 1, 0.627451, 1,
-0.2056023, -0.4382955, -2.144689, 0, 1, 0.6352941, 1,
-0.2041083, -1.777725, -2.556826, 0, 1, 0.6392157, 1,
-0.20073, -1.070475, -0.9807583, 0, 1, 0.6470588, 1,
-0.1922711, 1.301471, -0.6345403, 0, 1, 0.6509804, 1,
-0.1916299, 1.031417, -2.01017, 0, 1, 0.6588235, 1,
-0.189125, 0.8701594, -1.705878, 0, 1, 0.6627451, 1,
-0.1886081, -2.724612, -2.934724, 0, 1, 0.6705883, 1,
-0.1758959, -1.118256, -3.098722, 0, 1, 0.6745098, 1,
-0.1746403, -0.1361337, -1.832919, 0, 1, 0.682353, 1,
-0.1725525, 0.7172673, 0.9528335, 0, 1, 0.6862745, 1,
-0.1708793, 0.800383, -1.196657, 0, 1, 0.6941177, 1,
-0.1603622, -1.661379, -2.817756, 0, 1, 0.7019608, 1,
-0.1517734, -0.8354867, -3.620323, 0, 1, 0.7058824, 1,
-0.1512282, -1.120474, -2.858315, 0, 1, 0.7137255, 1,
-0.1503697, 0.160125, -1.655233, 0, 1, 0.7176471, 1,
-0.1454287, -1.095534, -2.535723, 0, 1, 0.7254902, 1,
-0.1414692, -0.3821089, -3.967749, 0, 1, 0.7294118, 1,
-0.1408862, -0.02457571, -2.883681, 0, 1, 0.7372549, 1,
-0.1362266, 0.1646758, 0.2349876, 0, 1, 0.7411765, 1,
-0.1341313, 0.2813082, -0.6660728, 0, 1, 0.7490196, 1,
-0.1312263, 2.024877, 1.718991, 0, 1, 0.7529412, 1,
-0.1293938, 0.6979869, 0.01819271, 0, 1, 0.7607843, 1,
-0.12859, -0.202424, -3.656002, 0, 1, 0.7647059, 1,
-0.118163, -0.7166465, -0.7402625, 0, 1, 0.772549, 1,
-0.1163184, -0.3675682, -4.640804, 0, 1, 0.7764706, 1,
-0.1136446, -1.737006, -3.919045, 0, 1, 0.7843137, 1,
-0.1017431, 0.4923923, -0.08288301, 0, 1, 0.7882353, 1,
-0.09746368, 1.013989, 1.064626, 0, 1, 0.7960784, 1,
-0.09570014, 0.3692479, 2.31054, 0, 1, 0.8039216, 1,
-0.0933207, 1.833523, 1.50181, 0, 1, 0.8078431, 1,
-0.09229867, 0.4187309, -0.6600845, 0, 1, 0.8156863, 1,
-0.09091512, -0.406015, -3.335965, 0, 1, 0.8196079, 1,
-0.08939186, -0.5018612, -2.197474, 0, 1, 0.827451, 1,
-0.08601733, -0.6364808, -3.425248, 0, 1, 0.8313726, 1,
-0.08274783, 0.6644666, 0.04949735, 0, 1, 0.8392157, 1,
-0.07524256, 0.4306804, 0.6313117, 0, 1, 0.8431373, 1,
-0.06859763, 1.650543, -0.0870316, 0, 1, 0.8509804, 1,
-0.068448, 1.32837, -1.312481, 0, 1, 0.854902, 1,
-0.06614453, 0.000481982, -2.099777, 0, 1, 0.8627451, 1,
-0.06539439, -0.2173375, -1.889473, 0, 1, 0.8666667, 1,
-0.0653477, 0.6001968, -0.1588269, 0, 1, 0.8745098, 1,
-0.06415115, 0.7478383, -1.140794, 0, 1, 0.8784314, 1,
-0.05834842, 1.294017, 0.1331985, 0, 1, 0.8862745, 1,
-0.05541781, -0.6946878, -4.840157, 0, 1, 0.8901961, 1,
-0.05357946, 1.381042, 0.5601516, 0, 1, 0.8980392, 1,
-0.05328115, 0.9113454, -1.017618, 0, 1, 0.9058824, 1,
-0.05291729, 0.2282404, -0.507171, 0, 1, 0.9098039, 1,
-0.04693627, -1.336179, -3.327464, 0, 1, 0.9176471, 1,
-0.04673732, -0.560636, -5.205119, 0, 1, 0.9215686, 1,
-0.04517496, -0.6720225, -1.664739, 0, 1, 0.9294118, 1,
-0.04481313, -1.051673, -4.013696, 0, 1, 0.9333333, 1,
-0.04232288, -0.3804721, -2.080407, 0, 1, 0.9411765, 1,
-0.04142088, -2.057016, -3.382392, 0, 1, 0.945098, 1,
-0.03939284, 0.2037362, -0.04564942, 0, 1, 0.9529412, 1,
-0.03904283, 0.8430845, -0.3891878, 0, 1, 0.9568627, 1,
-0.03653505, -0.4567582, -2.631599, 0, 1, 0.9647059, 1,
-0.03502268, -1.413137, -2.281809, 0, 1, 0.9686275, 1,
-0.03371417, 0.208922, -1.000839, 0, 1, 0.9764706, 1,
-0.03348764, -0.09550364, -3.51532, 0, 1, 0.9803922, 1,
-0.02861704, -0.2169385, -5.275688, 0, 1, 0.9882353, 1,
-0.02428546, 0.9401982, -0.1169663, 0, 1, 0.9921569, 1,
-0.02403171, -1.651686, -2.366877, 0, 1, 1, 1,
-0.02202535, 1.643632, 0.4014683, 0, 0.9921569, 1, 1,
-0.01771726, -0.99873, -3.829392, 0, 0.9882353, 1, 1,
-0.01705264, -0.1595549, -4.17256, 0, 0.9803922, 1, 1,
-0.01650215, 0.1928558, 1.203269, 0, 0.9764706, 1, 1,
-0.01092897, 0.1469784, -0.3429522, 0, 0.9686275, 1, 1,
-0.01034443, 0.7695867, 0.5585849, 0, 0.9647059, 1, 1,
-0.009041001, -1.432847, -3.700733, 0, 0.9568627, 1, 1,
-0.004746021, 2.135541, 0.5698147, 0, 0.9529412, 1, 1,
-0.004532633, 0.9671991, -1.126098, 0, 0.945098, 1, 1,
-0.00190245, -2.35152, -2.828314, 0, 0.9411765, 1, 1,
-0.001044454, 0.1189775, -1.09494, 0, 0.9333333, 1, 1,
0.0009910284, -0.1230144, 3.934329, 0, 0.9294118, 1, 1,
0.008201065, 0.9040083, -0.9643915, 0, 0.9215686, 1, 1,
0.01228965, -0.1759361, 4.620195, 0, 0.9176471, 1, 1,
0.01891285, 0.9414215, -2.876895, 0, 0.9098039, 1, 1,
0.0191781, -0.7493214, 3.791261, 0, 0.9058824, 1, 1,
0.02516229, 0.6230921, 0.1350794, 0, 0.8980392, 1, 1,
0.02863272, 0.03756019, 0.9953662, 0, 0.8901961, 1, 1,
0.03785701, -0.2201725, 1.541135, 0, 0.8862745, 1, 1,
0.0384281, -1.276847, 4.131523, 0, 0.8784314, 1, 1,
0.04118843, 0.1784275, -0.4476748, 0, 0.8745098, 1, 1,
0.04568097, -0.7398108, 2.370412, 0, 0.8666667, 1, 1,
0.04780773, -1.698542, 2.205047, 0, 0.8627451, 1, 1,
0.04975176, 0.3783581, -1.159304, 0, 0.854902, 1, 1,
0.05002645, -0.2757812, 3.189532, 0, 0.8509804, 1, 1,
0.0534291, -1.874628, 2.463747, 0, 0.8431373, 1, 1,
0.05384928, -1.112628, 3.298745, 0, 0.8392157, 1, 1,
0.05460558, 2.196311, -0.767533, 0, 0.8313726, 1, 1,
0.05556546, 1.260416, -1.523078, 0, 0.827451, 1, 1,
0.05578958, 1.726507, -1.322718, 0, 0.8196079, 1, 1,
0.05839914, 0.6883455, -0.7416733, 0, 0.8156863, 1, 1,
0.05930416, -2.392392, 2.367142, 0, 0.8078431, 1, 1,
0.06225732, 1.183992, -1.13425, 0, 0.8039216, 1, 1,
0.06853111, -0.6132849, 2.910958, 0, 0.7960784, 1, 1,
0.07106685, 1.455748, 1.641147, 0, 0.7882353, 1, 1,
0.07223702, 1.969047, -1.766045, 0, 0.7843137, 1, 1,
0.07425059, 0.3380971, -0.08208198, 0, 0.7764706, 1, 1,
0.07816331, 0.7967938, 0.4434779, 0, 0.772549, 1, 1,
0.08109602, -1.699013, 3.101547, 0, 0.7647059, 1, 1,
0.08183794, 1.1278, 0.6516544, 0, 0.7607843, 1, 1,
0.08476803, 1.180549, 1.189666, 0, 0.7529412, 1, 1,
0.08529112, -0.1062953, 2.478844, 0, 0.7490196, 1, 1,
0.08586439, 1.797502, -0.7690002, 0, 0.7411765, 1, 1,
0.08962135, -0.2273113, 3.126004, 0, 0.7372549, 1, 1,
0.09013508, 0.04784317, 1.386358, 0, 0.7294118, 1, 1,
0.09257223, 0.5527324, 0.3080181, 0, 0.7254902, 1, 1,
0.1027169, -0.3585961, 1.718, 0, 0.7176471, 1, 1,
0.1130971, -1.465664, 2.576934, 0, 0.7137255, 1, 1,
0.1157728, -1.858767, 3.310463, 0, 0.7058824, 1, 1,
0.119364, -0.07296202, 3.098049, 0, 0.6980392, 1, 1,
0.1213741, 0.2283251, 0.985503, 0, 0.6941177, 1, 1,
0.1232968, 0.6755157, 2.100111, 0, 0.6862745, 1, 1,
0.1241389, -0.4485008, 4.068356, 0, 0.682353, 1, 1,
0.1286284, -0.712698, 4.739484, 0, 0.6745098, 1, 1,
0.1327958, -0.1271671, 2.442632, 0, 0.6705883, 1, 1,
0.1393169, 0.3737796, -0.5570269, 0, 0.6627451, 1, 1,
0.13989, -0.2667176, 3.525588, 0, 0.6588235, 1, 1,
0.1414069, 0.5565864, 0.8743782, 0, 0.6509804, 1, 1,
0.1426205, -1.281964, 3.319127, 0, 0.6470588, 1, 1,
0.1437906, 0.7564608, -0.5039262, 0, 0.6392157, 1, 1,
0.1497912, 0.2015033, 1.097911, 0, 0.6352941, 1, 1,
0.1576765, -0.8232037, 1.976832, 0, 0.627451, 1, 1,
0.1601061, 0.2652006, 0.2788114, 0, 0.6235294, 1, 1,
0.1611199, 0.279149, 1.747869, 0, 0.6156863, 1, 1,
0.164799, -0.3312641, 1.664443, 0, 0.6117647, 1, 1,
0.1648646, -0.5304262, 0.756915, 0, 0.6039216, 1, 1,
0.16604, -0.1742057, 2.228775, 0, 0.5960785, 1, 1,
0.16788, -0.02407833, 1.571709, 0, 0.5921569, 1, 1,
0.1681406, -0.464441, 3.42577, 0, 0.5843138, 1, 1,
0.1682378, 1.531048, -0.6177713, 0, 0.5803922, 1, 1,
0.1704551, -1.268543, 1.879149, 0, 0.572549, 1, 1,
0.1728058, 1.003879, 0.3297521, 0, 0.5686275, 1, 1,
0.1746841, -0.1359462, 2.295436, 0, 0.5607843, 1, 1,
0.184153, -1.119148, 3.21287, 0, 0.5568628, 1, 1,
0.1877377, -0.299952, 3.429332, 0, 0.5490196, 1, 1,
0.1900938, -0.5592037, 3.223443, 0, 0.5450981, 1, 1,
0.1909, 1.021817, 0.8523843, 0, 0.5372549, 1, 1,
0.1910666, 0.4560107, -0.4580053, 0, 0.5333334, 1, 1,
0.1921492, -1.39407, 3.12497, 0, 0.5254902, 1, 1,
0.193671, -1.313849, 2.649372, 0, 0.5215687, 1, 1,
0.1982555, 1.766531, 0.9948108, 0, 0.5137255, 1, 1,
0.2019499, -0.285575, 3.820833, 0, 0.509804, 1, 1,
0.2099858, 0.1573396, -0.05293654, 0, 0.5019608, 1, 1,
0.2108403, 0.894975, 2.30963, 0, 0.4941176, 1, 1,
0.2134967, -0.04328459, 1.819291, 0, 0.4901961, 1, 1,
0.215071, 1.437882, -0.03669197, 0, 0.4823529, 1, 1,
0.2170863, -1.607785, 4.727056, 0, 0.4784314, 1, 1,
0.2268544, 0.3805967, 1.195508, 0, 0.4705882, 1, 1,
0.2281709, -0.4621527, 2.703963, 0, 0.4666667, 1, 1,
0.2328225, 0.3297045, 0.280011, 0, 0.4588235, 1, 1,
0.2333528, 0.574854, 0.8117974, 0, 0.454902, 1, 1,
0.2352917, -1.636932, 3.306011, 0, 0.4470588, 1, 1,
0.2365372, 1.117887, -0.8722184, 0, 0.4431373, 1, 1,
0.2369923, -0.3800301, 2.371999, 0, 0.4352941, 1, 1,
0.2387381, -0.8865426, 3.008405, 0, 0.4313726, 1, 1,
0.2401656, -0.4321865, 1.844744, 0, 0.4235294, 1, 1,
0.2405491, 0.6301289, 1.01289, 0, 0.4196078, 1, 1,
0.2414293, 0.7032877, 2.207973, 0, 0.4117647, 1, 1,
0.2430658, -1.768483, 4.52797, 0, 0.4078431, 1, 1,
0.2431284, 1.786873, 0.8045637, 0, 0.4, 1, 1,
0.251673, 0.6220981, 0.4170747, 0, 0.3921569, 1, 1,
0.252576, -1.062032, 3.900752, 0, 0.3882353, 1, 1,
0.2544748, -0.9712112, 3.260328, 0, 0.3803922, 1, 1,
0.2550459, 0.9327953, -1.138822, 0, 0.3764706, 1, 1,
0.2579107, -0.3203851, 2.930641, 0, 0.3686275, 1, 1,
0.2616234, 1.048122, 1.004915, 0, 0.3647059, 1, 1,
0.2632724, -1.063198, 3.505372, 0, 0.3568628, 1, 1,
0.2641865, -0.2142527, 1.57187, 0, 0.3529412, 1, 1,
0.265273, -1.231341, 2.937275, 0, 0.345098, 1, 1,
0.2657657, 0.2550483, 2.661365, 0, 0.3411765, 1, 1,
0.2677857, -1.076123, 2.835162, 0, 0.3333333, 1, 1,
0.2759605, -0.1373758, 0.8930352, 0, 0.3294118, 1, 1,
0.2767604, 0.6662695, 1.766618, 0, 0.3215686, 1, 1,
0.2772425, -0.001740945, 1.16544, 0, 0.3176471, 1, 1,
0.2817173, -1.145279, 3.926161, 0, 0.3098039, 1, 1,
0.2828287, 2.061526, 1.919427, 0, 0.3058824, 1, 1,
0.2846478, 0.490546, 0.4349632, 0, 0.2980392, 1, 1,
0.2928803, 1.052854, 0.5282181, 0, 0.2901961, 1, 1,
0.2934113, -1.867292, 2.518544, 0, 0.2862745, 1, 1,
0.2959994, -1.32698, 2.149282, 0, 0.2784314, 1, 1,
0.2987482, -0.2665972, 2.849934, 0, 0.2745098, 1, 1,
0.3043005, -0.4659334, 3.762099, 0, 0.2666667, 1, 1,
0.3081917, -0.4954305, 3.52116, 0, 0.2627451, 1, 1,
0.3082259, -0.6089833, 3.41156, 0, 0.254902, 1, 1,
0.3172621, 0.2350091, 2.770718, 0, 0.2509804, 1, 1,
0.3177849, -0.2932425, 3.486994, 0, 0.2431373, 1, 1,
0.3178496, 0.4359377, 1.928317, 0, 0.2392157, 1, 1,
0.318027, 0.1142454, -0.1932666, 0, 0.2313726, 1, 1,
0.3217944, 2.301147, 0.2669462, 0, 0.227451, 1, 1,
0.3235407, 0.5975596, -0.06890783, 0, 0.2196078, 1, 1,
0.3246202, -1.349491, 3.73277, 0, 0.2156863, 1, 1,
0.3256085, -1.87169, 3.385377, 0, 0.2078431, 1, 1,
0.3265314, -3.528731, 1.932177, 0, 0.2039216, 1, 1,
0.3293098, 1.127081, 0.9304671, 0, 0.1960784, 1, 1,
0.3328889, 1.647643, -1.730975, 0, 0.1882353, 1, 1,
0.338934, -0.4878165, 2.954243, 0, 0.1843137, 1, 1,
0.3451173, -1.140643, 6.132619, 0, 0.1764706, 1, 1,
0.3489457, 0.1858533, 0.9569384, 0, 0.172549, 1, 1,
0.3535606, -0.9419758, 0.9906856, 0, 0.1647059, 1, 1,
0.3591544, 0.4967344, 1.415238, 0, 0.1607843, 1, 1,
0.3744215, -0.1970895, 3.534878, 0, 0.1529412, 1, 1,
0.37641, 0.0784684, -0.3026718, 0, 0.1490196, 1, 1,
0.3771884, 0.6522564, 1.935801, 0, 0.1411765, 1, 1,
0.3786319, -1.023449, 3.612543, 0, 0.1372549, 1, 1,
0.3809263, -1.440325, 3.162494, 0, 0.1294118, 1, 1,
0.3867127, -0.01073146, 1.079756, 0, 0.1254902, 1, 1,
0.3927585, 0.1619367, 3.631735, 0, 0.1176471, 1, 1,
0.3938265, 0.9554347, 1.034894, 0, 0.1137255, 1, 1,
0.3945808, -1.283579, 2.780019, 0, 0.1058824, 1, 1,
0.3972149, -0.02567301, 2.43703, 0, 0.09803922, 1, 1,
0.3972307, 1.191375, 0.1589729, 0, 0.09411765, 1, 1,
0.4047046, 1.298963, 2.133349, 0, 0.08627451, 1, 1,
0.4091917, 0.5157803, 0.2057917, 0, 0.08235294, 1, 1,
0.4092273, 1.679728, -0.1144576, 0, 0.07450981, 1, 1,
0.4123127, -0.3813093, 1.772757, 0, 0.07058824, 1, 1,
0.423886, -0.2403562, 0.6259292, 0, 0.0627451, 1, 1,
0.4260342, -0.7509799, 2.547101, 0, 0.05882353, 1, 1,
0.431466, 0.3097748, 0.1827771, 0, 0.05098039, 1, 1,
0.4332559, 1.099617, 1.091863, 0, 0.04705882, 1, 1,
0.4366936, -0.6335576, 2.553157, 0, 0.03921569, 1, 1,
0.4440659, 0.3408202, 2.491746, 0, 0.03529412, 1, 1,
0.4447083, 1.101208, -0.2049099, 0, 0.02745098, 1, 1,
0.4459288, 0.1907723, 1.239263, 0, 0.02352941, 1, 1,
0.4481036, 1.823016, 0.06929701, 0, 0.01568628, 1, 1,
0.4540212, 1.353654, -1.641312, 0, 0.01176471, 1, 1,
0.4557335, -0.1459099, 1.115503, 0, 0.003921569, 1, 1,
0.4584014, -0.4848879, 2.184995, 0.003921569, 0, 1, 1,
0.4598356, 0.4637492, -0.3101254, 0.007843138, 0, 1, 1,
0.4625094, -0.7049541, 2.726156, 0.01568628, 0, 1, 1,
0.4642564, -1.135364, 2.185404, 0.01960784, 0, 1, 1,
0.4664755, 0.3253567, 1.969749, 0.02745098, 0, 1, 1,
0.4700188, 0.9788429, -1.013334, 0.03137255, 0, 1, 1,
0.4725232, 0.3730649, -0.5052282, 0.03921569, 0, 1, 1,
0.4790784, 0.1900246, -0.5247844, 0.04313726, 0, 1, 1,
0.47931, -0.7829891, 3.919165, 0.05098039, 0, 1, 1,
0.4823741, -0.4583761, 3.713156, 0.05490196, 0, 1, 1,
0.4827179, 0.2067356, 0.341992, 0.0627451, 0, 1, 1,
0.4829073, 0.4732995, 1.243773, 0.06666667, 0, 1, 1,
0.4830577, 0.271839, 2.501309, 0.07450981, 0, 1, 1,
0.4833241, -1.796553, 1.863347, 0.07843138, 0, 1, 1,
0.4867005, 0.3340884, 0.4346215, 0.08627451, 0, 1, 1,
0.4877568, -2.210343, 2.250227, 0.09019608, 0, 1, 1,
0.4880839, 0.7516816, 0.09947068, 0.09803922, 0, 1, 1,
0.4882697, 1.537963, -0.4945402, 0.1058824, 0, 1, 1,
0.48833, -1.036876, 0.6490518, 0.1098039, 0, 1, 1,
0.4912349, 0.5336236, 1.211276, 0.1176471, 0, 1, 1,
0.4934313, -0.1821923, 1.754298, 0.1215686, 0, 1, 1,
0.4966516, -1.362125, 2.820405, 0.1294118, 0, 1, 1,
0.4983775, -0.6262729, 2.535853, 0.1333333, 0, 1, 1,
0.4993924, 0.06364024, 1.763699, 0.1411765, 0, 1, 1,
0.4995414, -0.5720565, 1.752402, 0.145098, 0, 1, 1,
0.5033256, 1.841217, -0.2670923, 0.1529412, 0, 1, 1,
0.5077759, -0.01388196, 0.8319997, 0.1568628, 0, 1, 1,
0.5119004, -0.8399343, 2.067235, 0.1647059, 0, 1, 1,
0.513558, -0.3468228, 1.501716, 0.1686275, 0, 1, 1,
0.5145872, 0.8531295, 1.964135, 0.1764706, 0, 1, 1,
0.5161716, -0.5183869, 2.539505, 0.1803922, 0, 1, 1,
0.5162907, 0.5574608, 0.1157403, 0.1882353, 0, 1, 1,
0.5172332, 0.7438269, 0.8608671, 0.1921569, 0, 1, 1,
0.5189125, -0.7022741, 2.973869, 0.2, 0, 1, 1,
0.519908, 2.320109, 0.8425624, 0.2078431, 0, 1, 1,
0.5219852, 0.9997123, 0.505559, 0.2117647, 0, 1, 1,
0.5245913, -0.3103719, 3.226746, 0.2196078, 0, 1, 1,
0.5259338, -0.3013285, 3.594833, 0.2235294, 0, 1, 1,
0.5303441, 0.9099018, 1.545208, 0.2313726, 0, 1, 1,
0.5313683, 0.6623228, 0.1986189, 0.2352941, 0, 1, 1,
0.5321567, 0.9597183, 0.588296, 0.2431373, 0, 1, 1,
0.5325878, 0.8188922, -0.04161181, 0.2470588, 0, 1, 1,
0.5331845, 1.796388, -0.2364032, 0.254902, 0, 1, 1,
0.5340466, 1.308011, -1.087701, 0.2588235, 0, 1, 1,
0.5342472, -0.4087729, 1.926956, 0.2666667, 0, 1, 1,
0.5461724, 0.6257626, 1.224639, 0.2705882, 0, 1, 1,
0.5464256, 0.8705413, 0.6917393, 0.2784314, 0, 1, 1,
0.5472916, -0.3154184, 1.833397, 0.282353, 0, 1, 1,
0.5502921, -1.043182, 0.8864304, 0.2901961, 0, 1, 1,
0.5535412, 0.02258852, -0.1074737, 0.2941177, 0, 1, 1,
0.5539058, -1.441324, 2.104682, 0.3019608, 0, 1, 1,
0.5547588, 0.8269023, 0.1538766, 0.3098039, 0, 1, 1,
0.5624003, -0.6031311, 2.171658, 0.3137255, 0, 1, 1,
0.5649563, 1.158396, -0.07652155, 0.3215686, 0, 1, 1,
0.5680328, -0.6820849, 1.098573, 0.3254902, 0, 1, 1,
0.5748101, -2.102312, 4.090504, 0.3333333, 0, 1, 1,
0.5801339, 0.2401397, -0.1702321, 0.3372549, 0, 1, 1,
0.5824666, -0.1990133, 2.644195, 0.345098, 0, 1, 1,
0.5856656, 0.258487, 2.283283, 0.3490196, 0, 1, 1,
0.5879588, 0.4833468, 0.5163151, 0.3568628, 0, 1, 1,
0.5992135, 0.1299581, 2.660277, 0.3607843, 0, 1, 1,
0.5998605, 0.501978, 0.9797255, 0.3686275, 0, 1, 1,
0.5998755, -0.9682869, 3.383323, 0.372549, 0, 1, 1,
0.6094924, -0.9207726, 2.659014, 0.3803922, 0, 1, 1,
0.6175378, -0.6741508, 1.9335, 0.3843137, 0, 1, 1,
0.6222844, 1.628095, 0.9734164, 0.3921569, 0, 1, 1,
0.628723, -0.03085447, 1.815173, 0.3960784, 0, 1, 1,
0.6305276, 0.5301622, 0.9060129, 0.4039216, 0, 1, 1,
0.6320483, 0.9569923, 0.3281808, 0.4117647, 0, 1, 1,
0.6327743, 0.1951462, 0.8826094, 0.4156863, 0, 1, 1,
0.6365375, -0.5189285, 3.275977, 0.4235294, 0, 1, 1,
0.6371462, -0.7415489, 2.114632, 0.427451, 0, 1, 1,
0.6396174, 0.2254498, 1.943627, 0.4352941, 0, 1, 1,
0.6475736, 0.5862843, 0.8735423, 0.4392157, 0, 1, 1,
0.6520818, 0.3097255, 0.05205736, 0.4470588, 0, 1, 1,
0.6527729, -1.531952, 2.897134, 0.4509804, 0, 1, 1,
0.6548917, 0.2255212, 1.339986, 0.4588235, 0, 1, 1,
0.6559408, 2.188797, 0.286759, 0.4627451, 0, 1, 1,
0.6569443, -0.914376, 2.367628, 0.4705882, 0, 1, 1,
0.6584644, 1.064979, -0.3048189, 0.4745098, 0, 1, 1,
0.6640997, 1.486937, -0.2101011, 0.4823529, 0, 1, 1,
0.6701438, -1.419373, 4.575808, 0.4862745, 0, 1, 1,
0.6763366, -0.4140337, 2.889796, 0.4941176, 0, 1, 1,
0.682402, -1.412152, 3.027115, 0.5019608, 0, 1, 1,
0.6825228, 0.559716, -0.06817252, 0.5058824, 0, 1, 1,
0.6826705, -0.2850528, 2.034409, 0.5137255, 0, 1, 1,
0.6868148, 0.8939971, 0.2862319, 0.5176471, 0, 1, 1,
0.6878093, -0.9603978, 1.779987, 0.5254902, 0, 1, 1,
0.6914647, -2.119648, 3.423521, 0.5294118, 0, 1, 1,
0.6916604, -0.3691311, 3.914355, 0.5372549, 0, 1, 1,
0.6920812, -0.5734224, 2.20453, 0.5411765, 0, 1, 1,
0.6929572, -0.3446528, 1.532314, 0.5490196, 0, 1, 1,
0.6971658, -0.8878807, 2.579646, 0.5529412, 0, 1, 1,
0.6992887, -1.926954, 2.44221, 0.5607843, 0, 1, 1,
0.6994503, -0.1751097, 0.5525022, 0.5647059, 0, 1, 1,
0.7003968, 0.563063, 0.05785555, 0.572549, 0, 1, 1,
0.7009286, -0.981764, 1.915691, 0.5764706, 0, 1, 1,
0.7020949, 2.551198, 1.41413, 0.5843138, 0, 1, 1,
0.7040228, 0.3209642, 2.575225, 0.5882353, 0, 1, 1,
0.7044493, -0.7331634, 1.280535, 0.5960785, 0, 1, 1,
0.7166379, 0.06541255, 3.536296, 0.6039216, 0, 1, 1,
0.7187677, -1.669129, 3.046518, 0.6078432, 0, 1, 1,
0.7215684, 0.8697014, 1.14494, 0.6156863, 0, 1, 1,
0.7251959, -0.3270134, 3.228832, 0.6196079, 0, 1, 1,
0.7303337, 1.545208, -1.340929, 0.627451, 0, 1, 1,
0.7306713, 1.00593, 1.358543, 0.6313726, 0, 1, 1,
0.733609, -0.2301995, 1.220868, 0.6392157, 0, 1, 1,
0.7363108, 1.487678, 0.7209423, 0.6431373, 0, 1, 1,
0.740536, -1.029278, 2.514888, 0.6509804, 0, 1, 1,
0.7454121, 0.539367, 1.379536, 0.654902, 0, 1, 1,
0.7466201, -0.1467803, 1.380264, 0.6627451, 0, 1, 1,
0.74915, 2.091439, -1.158237, 0.6666667, 0, 1, 1,
0.7542721, -2.073252, 2.757963, 0.6745098, 0, 1, 1,
0.7616645, -1.363689, 5.198994, 0.6784314, 0, 1, 1,
0.7646619, -1.482455, 3.183022, 0.6862745, 0, 1, 1,
0.7658508, 1.723201, 1.33458, 0.6901961, 0, 1, 1,
0.7701363, -1.424499, 2.992553, 0.6980392, 0, 1, 1,
0.7741321, -0.3112006, 0.9320543, 0.7058824, 0, 1, 1,
0.7762603, 1.010291, 0.3191528, 0.7098039, 0, 1, 1,
0.7764004, -1.155061, 3.018949, 0.7176471, 0, 1, 1,
0.7904107, 0.7353643, -0.1308136, 0.7215686, 0, 1, 1,
0.7907447, 0.2930589, 1.892906, 0.7294118, 0, 1, 1,
0.7911885, 1.741821, 1.627939, 0.7333333, 0, 1, 1,
0.7971404, -0.5450567, 2.516705, 0.7411765, 0, 1, 1,
0.8027402, 1.138297, 1.301928, 0.7450981, 0, 1, 1,
0.8047514, 0.7183157, 0.9947734, 0.7529412, 0, 1, 1,
0.8071751, 0.06662424, 2.5969, 0.7568628, 0, 1, 1,
0.807416, -1.089827, 1.282669, 0.7647059, 0, 1, 1,
0.81093, 0.6772572, 1.441593, 0.7686275, 0, 1, 1,
0.8148506, 0.379692, 0.3675751, 0.7764706, 0, 1, 1,
0.8171132, -0.134712, 2.647642, 0.7803922, 0, 1, 1,
0.8178697, 1.571458, 1.154694, 0.7882353, 0, 1, 1,
0.8190597, 0.5158973, 2.182457, 0.7921569, 0, 1, 1,
0.8196899, 0.6179975, 0.9929497, 0.8, 0, 1, 1,
0.8204629, -2.369698, 3.2779, 0.8078431, 0, 1, 1,
0.8211726, -1.098385, 2.799745, 0.8117647, 0, 1, 1,
0.825171, 1.822824, -0.3572706, 0.8196079, 0, 1, 1,
0.8275073, 0.3954218, 2.194771, 0.8235294, 0, 1, 1,
0.8290215, 0.3681722, 1.911294, 0.8313726, 0, 1, 1,
0.8306964, -0.04536806, 2.424943, 0.8352941, 0, 1, 1,
0.8375462, 1.401898, 2.008907, 0.8431373, 0, 1, 1,
0.8416293, 1.639997, 0.8229522, 0.8470588, 0, 1, 1,
0.8432118, 0.8119833, -0.5993745, 0.854902, 0, 1, 1,
0.8451074, -0.2802678, 1.840216, 0.8588235, 0, 1, 1,
0.8580833, 0.90273, -1.190113, 0.8666667, 0, 1, 1,
0.8590313, 0.1899358, 0.2231134, 0.8705882, 0, 1, 1,
0.8752464, 0.2475818, 1.551866, 0.8784314, 0, 1, 1,
0.8786985, -0.9657603, 2.535181, 0.8823529, 0, 1, 1,
0.8793573, 0.493174, -0.3069298, 0.8901961, 0, 1, 1,
0.8863925, -0.4753461, 2.372434, 0.8941177, 0, 1, 1,
0.8865128, -0.006930123, 1.443855, 0.9019608, 0, 1, 1,
0.8865809, 0.9146307, -0.01413251, 0.9098039, 0, 1, 1,
0.8909731, 1.043591, 0.2044165, 0.9137255, 0, 1, 1,
0.8923996, -0.6748567, 3.331423, 0.9215686, 0, 1, 1,
0.9006727, 0.7456078, 1.841814, 0.9254902, 0, 1, 1,
0.9086998, 0.4401927, 1.652324, 0.9333333, 0, 1, 1,
0.9141749, 0.4704255, 1.589136, 0.9372549, 0, 1, 1,
0.9145759, -0.5331442, 2.05085, 0.945098, 0, 1, 1,
0.9167426, 2.730567, 0.04176305, 0.9490196, 0, 1, 1,
0.9188346, 1.876477, 2.102577, 0.9568627, 0, 1, 1,
0.9216689, 0.2152591, 1.502126, 0.9607843, 0, 1, 1,
0.922677, 0.06358375, 1.106233, 0.9686275, 0, 1, 1,
0.925987, -0.5282584, 1.459809, 0.972549, 0, 1, 1,
0.9297579, -0.09895818, 2.801666, 0.9803922, 0, 1, 1,
0.9310336, 1.701822, 1.760994, 0.9843137, 0, 1, 1,
0.9326854, 0.1407581, 1.689647, 0.9921569, 0, 1, 1,
0.9340262, -0.4493073, 3.3898, 0.9960784, 0, 1, 1,
0.9362903, -0.3091123, 0.8156013, 1, 0, 0.9960784, 1,
0.9427648, 0.1841503, 1.587807, 1, 0, 0.9882353, 1,
0.9428194, -0.0425004, 3.421661, 1, 0, 0.9843137, 1,
0.9437717, -0.5977085, 2.16029, 1, 0, 0.9764706, 1,
0.9447021, -1.382285, 2.41977, 1, 0, 0.972549, 1,
0.9510365, 0.1158688, 1.442376, 1, 0, 0.9647059, 1,
0.9538361, -1.318376, 3.133246, 1, 0, 0.9607843, 1,
0.9605021, 1.870318, 0.3359096, 1, 0, 0.9529412, 1,
0.9609162, 0.9013377, -0.8322824, 1, 0, 0.9490196, 1,
0.9613826, -0.9623065, 0.9725062, 1, 0, 0.9411765, 1,
0.9643431, -0.459435, 2.544462, 1, 0, 0.9372549, 1,
0.9645327, 1.321323, 1.104733, 1, 0, 0.9294118, 1,
0.9667751, 0.4437678, -0.5700715, 1, 0, 0.9254902, 1,
0.9832821, -0.6894944, 4.228457, 1, 0, 0.9176471, 1,
0.9875539, -0.2565796, 0.6648907, 1, 0, 0.9137255, 1,
0.9886433, -1.804382, 3.076165, 1, 0, 0.9058824, 1,
0.9893789, -1.385504, 2.100414, 1, 0, 0.9019608, 1,
0.9925836, -1.403628, 1.647163, 1, 0, 0.8941177, 1,
0.9930111, -0.8088557, 3.747078, 1, 0, 0.8862745, 1,
0.99716, -0.5334305, 1.538689, 1, 0, 0.8823529, 1,
1.000414, -0.8363452, 3.190304, 1, 0, 0.8745098, 1,
1.011103, 0.2461588, -0.5886476, 1, 0, 0.8705882, 1,
1.016042, 0.4786579, 1.750308, 1, 0, 0.8627451, 1,
1.016788, 0.4801986, 0.8807784, 1, 0, 0.8588235, 1,
1.017806, 0.4713784, 1.250273, 1, 0, 0.8509804, 1,
1.022276, -1.361931, 2.372027, 1, 0, 0.8470588, 1,
1.022944, -1.97025, 3.427524, 1, 0, 0.8392157, 1,
1.024446, 1.23319, -0.4962029, 1, 0, 0.8352941, 1,
1.027984, 0.1157782, 0.7368092, 1, 0, 0.827451, 1,
1.029724, 0.5641952, -0.5212339, 1, 0, 0.8235294, 1,
1.031463, -0.1894485, 1.15741, 1, 0, 0.8156863, 1,
1.03162, 0.8320343, -0.0808912, 1, 0, 0.8117647, 1,
1.035657, -0.06942511, 0.8302926, 1, 0, 0.8039216, 1,
1.038117, 0.7149472, 1.788515, 1, 0, 0.7960784, 1,
1.041206, -1.158677, 1.604436, 1, 0, 0.7921569, 1,
1.04517, 1.631533, 2.11312, 1, 0, 0.7843137, 1,
1.052524, -1.267914, 1.888537, 1, 0, 0.7803922, 1,
1.058085, -0.1000946, 1.258243, 1, 0, 0.772549, 1,
1.060397, 1.047735, 0.3004142, 1, 0, 0.7686275, 1,
1.067685, -0.9069951, 2.952214, 1, 0, 0.7607843, 1,
1.076384, 0.1773751, 0.3090741, 1, 0, 0.7568628, 1,
1.077918, 0.9843252, 2.161081, 1, 0, 0.7490196, 1,
1.083967, -0.9296689, 2.087123, 1, 0, 0.7450981, 1,
1.08599, -0.4222691, 1.894331, 1, 0, 0.7372549, 1,
1.096671, 1.158013, 0.1593331, 1, 0, 0.7333333, 1,
1.100422, -0.05872447, 1.64784, 1, 0, 0.7254902, 1,
1.103424, -0.1272432, 2.167721, 1, 0, 0.7215686, 1,
1.108019, -1.892574, 2.109509, 1, 0, 0.7137255, 1,
1.109232, 1.289591, -0.1057651, 1, 0, 0.7098039, 1,
1.115573, 0.1985034, 2.848281, 1, 0, 0.7019608, 1,
1.115586, -0.8610459, 1.93479, 1, 0, 0.6941177, 1,
1.119797, -0.6406336, 2.840029, 1, 0, 0.6901961, 1,
1.124777, 0.6009625, -0.6238976, 1, 0, 0.682353, 1,
1.126802, -0.7644782, 3.207145, 1, 0, 0.6784314, 1,
1.132773, 0.3590657, -1.846344, 1, 0, 0.6705883, 1,
1.135185, 1.006037, 1.88104, 1, 0, 0.6666667, 1,
1.137668, -0.1459148, 3.872813, 1, 0, 0.6588235, 1,
1.144277, 0.6031815, 0.3871431, 1, 0, 0.654902, 1,
1.156833, 0.04785729, 2.519207, 1, 0, 0.6470588, 1,
1.175224, 0.09563122, 0.612438, 1, 0, 0.6431373, 1,
1.181787, -0.456537, 0.3507257, 1, 0, 0.6352941, 1,
1.18618, -0.9078368, 1.673836, 1, 0, 0.6313726, 1,
1.190095, 1.192061, 1.907381, 1, 0, 0.6235294, 1,
1.190656, 0.2234126, 0.9407342, 1, 0, 0.6196079, 1,
1.202934, 0.008987608, 0.8304151, 1, 0, 0.6117647, 1,
1.204093, -0.3848929, 1.907786, 1, 0, 0.6078432, 1,
1.205002, -0.5570235, 3.341806, 1, 0, 0.6, 1,
1.205386, -0.01113776, 1.694724, 1, 0, 0.5921569, 1,
1.211259, -0.6926765, 2.91713, 1, 0, 0.5882353, 1,
1.213768, -1.038501, 2.569739, 1, 0, 0.5803922, 1,
1.215356, 0.2623061, -0.783451, 1, 0, 0.5764706, 1,
1.218233, -0.007423847, 1.847722, 1, 0, 0.5686275, 1,
1.226044, 0.3024245, 1.966117, 1, 0, 0.5647059, 1,
1.22967, -0.9188933, 2.593588, 1, 0, 0.5568628, 1,
1.231513, 1.756876, -0.6886975, 1, 0, 0.5529412, 1,
1.232585, -0.2743465, 1.479124, 1, 0, 0.5450981, 1,
1.233176, -0.463323, 3.426135, 1, 0, 0.5411765, 1,
1.234371, -0.5413924, 3.577786, 1, 0, 0.5333334, 1,
1.239316, 0.02238266, 1.787168, 1, 0, 0.5294118, 1,
1.246136, 0.7814418, 1.242228, 1, 0, 0.5215687, 1,
1.246509, -0.4040998, 2.72225, 1, 0, 0.5176471, 1,
1.258062, 0.8368198, 1.069438, 1, 0, 0.509804, 1,
1.259629, 0.8348233, -0.4788799, 1, 0, 0.5058824, 1,
1.264269, -0.1933021, 2.555579, 1, 0, 0.4980392, 1,
1.267625, -0.6679288, -0.2646615, 1, 0, 0.4901961, 1,
1.27532, 0.3339099, 0.9928387, 1, 0, 0.4862745, 1,
1.28545, -0.6448051, 1.902647, 1, 0, 0.4784314, 1,
1.287434, 0.3117954, 1.387958, 1, 0, 0.4745098, 1,
1.2999, -0.9546482, 2.220908, 1, 0, 0.4666667, 1,
1.301871, 1.220297, -0.9026455, 1, 0, 0.4627451, 1,
1.302091, 0.3862698, 3.538776, 1, 0, 0.454902, 1,
1.30958, -0.8480127, 3.073563, 1, 0, 0.4509804, 1,
1.312979, -1.775034, 2.306113, 1, 0, 0.4431373, 1,
1.321536, 0.3649026, 1.746938, 1, 0, 0.4392157, 1,
1.332495, -1.017352, 2.105451, 1, 0, 0.4313726, 1,
1.34158, -0.07690673, 2.783093, 1, 0, 0.427451, 1,
1.348905, -0.1541303, 2.32037, 1, 0, 0.4196078, 1,
1.35295, -0.1688305, 1.636198, 1, 0, 0.4156863, 1,
1.362737, 0.2391609, 0.4245804, 1, 0, 0.4078431, 1,
1.3713, -0.2073527, 1.903055, 1, 0, 0.4039216, 1,
1.372779, -0.7169433, 2.488937, 1, 0, 0.3960784, 1,
1.383354, -0.4781879, 1.44437, 1, 0, 0.3882353, 1,
1.391696, 1.69004, 2.264683, 1, 0, 0.3843137, 1,
1.41264, -1.035043, 1.626488, 1, 0, 0.3764706, 1,
1.413445, 0.6569459, -0.9691235, 1, 0, 0.372549, 1,
1.418837, -0.05471108, 1.671395, 1, 0, 0.3647059, 1,
1.42058, 0.4916561, -0.2554791, 1, 0, 0.3607843, 1,
1.428771, 0.772493, 1.307554, 1, 0, 0.3529412, 1,
1.435679, 0.9787445, -0.03300342, 1, 0, 0.3490196, 1,
1.440158, -0.1593895, 2.326298, 1, 0, 0.3411765, 1,
1.441661, -0.2781217, 3.39594, 1, 0, 0.3372549, 1,
1.445117, -1.737192, 3.891177, 1, 0, 0.3294118, 1,
1.451687, -1.567815, 4.050074, 1, 0, 0.3254902, 1,
1.453259, -0.5181797, 2.666156, 1, 0, 0.3176471, 1,
1.455798, -0.9923235, 3.04819, 1, 0, 0.3137255, 1,
1.463297, 0.9797408, 0.7417719, 1, 0, 0.3058824, 1,
1.49355, -0.1241545, 0.9627784, 1, 0, 0.2980392, 1,
1.503396, 0.2086866, 0.1140964, 1, 0, 0.2941177, 1,
1.526492, -0.3137464, -0.806823, 1, 0, 0.2862745, 1,
1.530699, -0.3683684, 1.362271, 1, 0, 0.282353, 1,
1.5329, 0.03745286, 1.254494, 1, 0, 0.2745098, 1,
1.549801, 0.2643546, 1.428565, 1, 0, 0.2705882, 1,
1.558471, -1.116373, 2.635228, 1, 0, 0.2627451, 1,
1.575989, -0.6782671, 3.247981, 1, 0, 0.2588235, 1,
1.610661, 0.5125053, 2.585751, 1, 0, 0.2509804, 1,
1.614786, -1.487739, 1.088716, 1, 0, 0.2470588, 1,
1.62866, 0.9737934, 2.584781, 1, 0, 0.2392157, 1,
1.634776, -1.495594, 0.7160845, 1, 0, 0.2352941, 1,
1.638271, 1.143917, 0.802951, 1, 0, 0.227451, 1,
1.681641, 0.05651769, 1.940539, 1, 0, 0.2235294, 1,
1.707173, 0.3834535, 0.8773125, 1, 0, 0.2156863, 1,
1.718969, -0.4271246, 2.659385, 1, 0, 0.2117647, 1,
1.744405, -0.1590608, 2.866874, 1, 0, 0.2039216, 1,
1.759243, 0.4206518, 0.3148149, 1, 0, 0.1960784, 1,
1.763228, -0.3742086, 2.504875, 1, 0, 0.1921569, 1,
1.776605, -1.495129, 4.196115, 1, 0, 0.1843137, 1,
1.782961, -1.809345, 0.846619, 1, 0, 0.1803922, 1,
1.788767, -0.5170524, 1.559602, 1, 0, 0.172549, 1,
1.796077, -0.6256045, 1.966567, 1, 0, 0.1686275, 1,
1.845121, -1.004913, 2.952673, 1, 0, 0.1607843, 1,
1.867449, -0.3475178, 1.614895, 1, 0, 0.1568628, 1,
1.873932, 0.9242161, 0.7184487, 1, 0, 0.1490196, 1,
1.875093, 0.9453207, 2.580186, 1, 0, 0.145098, 1,
1.87524, 0.5348142, 2.203182, 1, 0, 0.1372549, 1,
1.898534, -0.578528, 2.433823, 1, 0, 0.1333333, 1,
1.913683, -1.624982, 2.206974, 1, 0, 0.1254902, 1,
1.934782, -0.5290698, 0.9543623, 1, 0, 0.1215686, 1,
1.98844, 2.467973, 1.005267, 1, 0, 0.1137255, 1,
2.002914, -0.3177524, 2.879286, 1, 0, 0.1098039, 1,
2.004663, -1.806244, 2.38686, 1, 0, 0.1019608, 1,
2.006073, 0.4575104, 0.6667199, 1, 0, 0.09411765, 1,
2.027165, -0.3953857, 3.731606, 1, 0, 0.09019608, 1,
2.074796, -0.1054348, 1.597934, 1, 0, 0.08235294, 1,
2.119345, 1.553818, 0.5005367, 1, 0, 0.07843138, 1,
2.226906, 0.7207594, 3.188002, 1, 0, 0.07058824, 1,
2.241868, -1.006648, 1.655892, 1, 0, 0.06666667, 1,
2.258029, -0.191655, 3.412314, 1, 0, 0.05882353, 1,
2.319001, -0.2917319, 0.8700113, 1, 0, 0.05490196, 1,
2.320799, 0.4314665, 2.206675, 1, 0, 0.04705882, 1,
2.36295, 0.5022407, 0.1192146, 1, 0, 0.04313726, 1,
2.365711, -0.5264375, 2.248878, 1, 0, 0.03529412, 1,
2.426289, -0.5190057, 2.0902, 1, 0, 0.03137255, 1,
2.664151, -0.6070275, 3.713763, 1, 0, 0.02352941, 1,
2.724684, 0.515734, 1.877308, 1, 0, 0.01960784, 1,
2.793298, 1.094517, 1.945837, 1, 0, 0.01176471, 1,
2.819425, 0.147929, 1.852365, 1, 0, 0.007843138, 1
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
-0.3780181, -4.684433, -7.501133, 0, -0.5, 0.5, 0.5,
-0.3780181, -4.684433, -7.501133, 1, -0.5, 0.5, 0.5,
-0.3780181, -4.684433, -7.501133, 1, 1.5, 0.5, 0.5,
-0.3780181, -4.684433, -7.501133, 0, 1.5, 0.5, 0.5
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
-4.659394, -0.1195793, -7.501133, 0, -0.5, 0.5, 0.5,
-4.659394, -0.1195793, -7.501133, 1, -0.5, 0.5, 0.5,
-4.659394, -0.1195793, -7.501133, 1, 1.5, 0.5, 0.5,
-4.659394, -0.1195793, -7.501133, 0, 1.5, 0.5, 0.5
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
-4.659394, -4.684433, 0.3037384, 0, -0.5, 0.5, 0.5,
-4.659394, -4.684433, 0.3037384, 1, -0.5, 0.5, 0.5,
-4.659394, -4.684433, 0.3037384, 1, 1.5, 0.5, 0.5,
-4.659394, -4.684433, 0.3037384, 0, 1.5, 0.5, 0.5
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
-3, -3.631006, -5.700009,
2, -3.631006, -5.700009,
-3, -3.631006, -5.700009,
-3, -3.806577, -6.000196,
-2, -3.631006, -5.700009,
-2, -3.806577, -6.000196,
-1, -3.631006, -5.700009,
-1, -3.806577, -6.000196,
0, -3.631006, -5.700009,
0, -3.806577, -6.000196,
1, -3.631006, -5.700009,
1, -3.806577, -6.000196,
2, -3.631006, -5.700009,
2, -3.806577, -6.000196
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
-3, -4.157719, -6.600571, 0, -0.5, 0.5, 0.5,
-3, -4.157719, -6.600571, 1, -0.5, 0.5, 0.5,
-3, -4.157719, -6.600571, 1, 1.5, 0.5, 0.5,
-3, -4.157719, -6.600571, 0, 1.5, 0.5, 0.5,
-2, -4.157719, -6.600571, 0, -0.5, 0.5, 0.5,
-2, -4.157719, -6.600571, 1, -0.5, 0.5, 0.5,
-2, -4.157719, -6.600571, 1, 1.5, 0.5, 0.5,
-2, -4.157719, -6.600571, 0, 1.5, 0.5, 0.5,
-1, -4.157719, -6.600571, 0, -0.5, 0.5, 0.5,
-1, -4.157719, -6.600571, 1, -0.5, 0.5, 0.5,
-1, -4.157719, -6.600571, 1, 1.5, 0.5, 0.5,
-1, -4.157719, -6.600571, 0, 1.5, 0.5, 0.5,
0, -4.157719, -6.600571, 0, -0.5, 0.5, 0.5,
0, -4.157719, -6.600571, 1, -0.5, 0.5, 0.5,
0, -4.157719, -6.600571, 1, 1.5, 0.5, 0.5,
0, -4.157719, -6.600571, 0, 1.5, 0.5, 0.5,
1, -4.157719, -6.600571, 0, -0.5, 0.5, 0.5,
1, -4.157719, -6.600571, 1, -0.5, 0.5, 0.5,
1, -4.157719, -6.600571, 1, 1.5, 0.5, 0.5,
1, -4.157719, -6.600571, 0, 1.5, 0.5, 0.5,
2, -4.157719, -6.600571, 0, -0.5, 0.5, 0.5,
2, -4.157719, -6.600571, 1, -0.5, 0.5, 0.5,
2, -4.157719, -6.600571, 1, 1.5, 0.5, 0.5,
2, -4.157719, -6.600571, 0, 1.5, 0.5, 0.5
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
-3.671384, -3, -5.700009,
-3.671384, 3, -5.700009,
-3.671384, -3, -5.700009,
-3.836053, -3, -6.000196,
-3.671384, -2, -5.700009,
-3.836053, -2, -6.000196,
-3.671384, -1, -5.700009,
-3.836053, -1, -6.000196,
-3.671384, 0, -5.700009,
-3.836053, 0, -6.000196,
-3.671384, 1, -5.700009,
-3.836053, 1, -6.000196,
-3.671384, 2, -5.700009,
-3.836053, 2, -6.000196,
-3.671384, 3, -5.700009,
-3.836053, 3, -6.000196
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
-4.16539, -3, -6.600571, 0, -0.5, 0.5, 0.5,
-4.16539, -3, -6.600571, 1, -0.5, 0.5, 0.5,
-4.16539, -3, -6.600571, 1, 1.5, 0.5, 0.5,
-4.16539, -3, -6.600571, 0, 1.5, 0.5, 0.5,
-4.16539, -2, -6.600571, 0, -0.5, 0.5, 0.5,
-4.16539, -2, -6.600571, 1, -0.5, 0.5, 0.5,
-4.16539, -2, -6.600571, 1, 1.5, 0.5, 0.5,
-4.16539, -2, -6.600571, 0, 1.5, 0.5, 0.5,
-4.16539, -1, -6.600571, 0, -0.5, 0.5, 0.5,
-4.16539, -1, -6.600571, 1, -0.5, 0.5, 0.5,
-4.16539, -1, -6.600571, 1, 1.5, 0.5, 0.5,
-4.16539, -1, -6.600571, 0, 1.5, 0.5, 0.5,
-4.16539, 0, -6.600571, 0, -0.5, 0.5, 0.5,
-4.16539, 0, -6.600571, 1, -0.5, 0.5, 0.5,
-4.16539, 0, -6.600571, 1, 1.5, 0.5, 0.5,
-4.16539, 0, -6.600571, 0, 1.5, 0.5, 0.5,
-4.16539, 1, -6.600571, 0, -0.5, 0.5, 0.5,
-4.16539, 1, -6.600571, 1, -0.5, 0.5, 0.5,
-4.16539, 1, -6.600571, 1, 1.5, 0.5, 0.5,
-4.16539, 1, -6.600571, 0, 1.5, 0.5, 0.5,
-4.16539, 2, -6.600571, 0, -0.5, 0.5, 0.5,
-4.16539, 2, -6.600571, 1, -0.5, 0.5, 0.5,
-4.16539, 2, -6.600571, 1, 1.5, 0.5, 0.5,
-4.16539, 2, -6.600571, 0, 1.5, 0.5, 0.5,
-4.16539, 3, -6.600571, 0, -0.5, 0.5, 0.5,
-4.16539, 3, -6.600571, 1, -0.5, 0.5, 0.5,
-4.16539, 3, -6.600571, 1, 1.5, 0.5, 0.5,
-4.16539, 3, -6.600571, 0, 1.5, 0.5, 0.5
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
-3.671384, -3.631006, -4,
-3.671384, -3.631006, 6,
-3.671384, -3.631006, -4,
-3.836053, -3.806577, -4,
-3.671384, -3.631006, -2,
-3.836053, -3.806577, -2,
-3.671384, -3.631006, 0,
-3.836053, -3.806577, 0,
-3.671384, -3.631006, 2,
-3.836053, -3.806577, 2,
-3.671384, -3.631006, 4,
-3.836053, -3.806577, 4,
-3.671384, -3.631006, 6,
-3.836053, -3.806577, 6
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
-4.16539, -4.157719, -4, 0, -0.5, 0.5, 0.5,
-4.16539, -4.157719, -4, 1, -0.5, 0.5, 0.5,
-4.16539, -4.157719, -4, 1, 1.5, 0.5, 0.5,
-4.16539, -4.157719, -4, 0, 1.5, 0.5, 0.5,
-4.16539, -4.157719, -2, 0, -0.5, 0.5, 0.5,
-4.16539, -4.157719, -2, 1, -0.5, 0.5, 0.5,
-4.16539, -4.157719, -2, 1, 1.5, 0.5, 0.5,
-4.16539, -4.157719, -2, 0, 1.5, 0.5, 0.5,
-4.16539, -4.157719, 0, 0, -0.5, 0.5, 0.5,
-4.16539, -4.157719, 0, 1, -0.5, 0.5, 0.5,
-4.16539, -4.157719, 0, 1, 1.5, 0.5, 0.5,
-4.16539, -4.157719, 0, 0, 1.5, 0.5, 0.5,
-4.16539, -4.157719, 2, 0, -0.5, 0.5, 0.5,
-4.16539, -4.157719, 2, 1, -0.5, 0.5, 0.5,
-4.16539, -4.157719, 2, 1, 1.5, 0.5, 0.5,
-4.16539, -4.157719, 2, 0, 1.5, 0.5, 0.5,
-4.16539, -4.157719, 4, 0, -0.5, 0.5, 0.5,
-4.16539, -4.157719, 4, 1, -0.5, 0.5, 0.5,
-4.16539, -4.157719, 4, 1, 1.5, 0.5, 0.5,
-4.16539, -4.157719, 4, 0, 1.5, 0.5, 0.5,
-4.16539, -4.157719, 6, 0, -0.5, 0.5, 0.5,
-4.16539, -4.157719, 6, 1, -0.5, 0.5, 0.5,
-4.16539, -4.157719, 6, 1, 1.5, 0.5, 0.5,
-4.16539, -4.157719, 6, 0, 1.5, 0.5, 0.5
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
-3.671384, -3.631006, -5.700009,
-3.671384, 3.391847, -5.700009,
-3.671384, -3.631006, 6.307486,
-3.671384, 3.391847, 6.307486,
-3.671384, -3.631006, -5.700009,
-3.671384, -3.631006, 6.307486,
-3.671384, 3.391847, -5.700009,
-3.671384, 3.391847, 6.307486,
-3.671384, -3.631006, -5.700009,
2.915348, -3.631006, -5.700009,
-3.671384, -3.631006, 6.307486,
2.915348, -3.631006, 6.307486,
-3.671384, 3.391847, -5.700009,
2.915348, 3.391847, -5.700009,
-3.671384, 3.391847, 6.307486,
2.915348, 3.391847, 6.307486,
2.915348, -3.631006, -5.700009,
2.915348, 3.391847, -5.700009,
2.915348, -3.631006, 6.307486,
2.915348, 3.391847, 6.307486,
2.915348, -3.631006, -5.700009,
2.915348, -3.631006, 6.307486,
2.915348, 3.391847, -5.700009,
2.915348, 3.391847, 6.307486
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
var radius = 8.218539;
var distance = 36.56521;
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
mvMatrix.translate( 0.3780181, 0.1195793, -0.3037384 );
mvMatrix.scale( 1.349082, 1.265304, 0.7400416 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.56521);
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
flucythrinate<-read.table("flucythrinate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flucythrinate$V2
```

```
## Error in eval(expr, envir, enclos): object 'flucythrinate' not found
```

```r
y<-flucythrinate$V3
```

```
## Error in eval(expr, envir, enclos): object 'flucythrinate' not found
```

```r
z<-flucythrinate$V4
```

```
## Error in eval(expr, envir, enclos): object 'flucythrinate' not found
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
-3.575461, -0.3340883, -0.926026, 0, 0, 1, 1, 1,
-2.90135, -0.1161435, -2.367378, 1, 0, 0, 1, 1,
-2.817442, 0.6539616, -1.836031, 1, 0, 0, 1, 1,
-2.775427, -1.391369, -3.053024, 1, 0, 0, 1, 1,
-2.735513, 1.244237, -2.92134, 1, 0, 0, 1, 1,
-2.656594, 0.1065223, -2.703169, 1, 0, 0, 1, 1,
-2.594311, 0.1760194, -2.614504, 0, 0, 0, 1, 1,
-2.550671, 0.8408812, -0.7309351, 0, 0, 0, 1, 1,
-2.42418, 0.6278331, 0.04259631, 0, 0, 0, 1, 1,
-2.364556, -0.03181183, 0.01036861, 0, 0, 0, 1, 1,
-2.355869, -1.488228, -1.036508, 0, 0, 0, 1, 1,
-2.32408, 0.6113834, -0.8087554, 0, 0, 0, 1, 1,
-2.319159, 1.213666, 0.2854982, 0, 0, 0, 1, 1,
-2.283504, -1.79685, -4.586464, 1, 1, 1, 1, 1,
-2.27909, -0.07052556, -1.147611, 1, 1, 1, 1, 1,
-2.2219, 0.4071266, 0.2516389, 1, 1, 1, 1, 1,
-2.172626, -0.6032902, -2.50809, 1, 1, 1, 1, 1,
-2.153322, -0.1612521, -3.814396, 1, 1, 1, 1, 1,
-2.131543, 0.9989426, 0.2681466, 1, 1, 1, 1, 1,
-2.124994, 0.6023971, 0.5273275, 1, 1, 1, 1, 1,
-2.085949, 0.625703, -0.2985237, 1, 1, 1, 1, 1,
-2.078966, -0.2574462, -3.272567, 1, 1, 1, 1, 1,
-2.072147, 0.3837083, -1.456632, 1, 1, 1, 1, 1,
-2.070601, 2.109859, -0.6007718, 1, 1, 1, 1, 1,
-2.048893, 0.3209183, -1.482348, 1, 1, 1, 1, 1,
-2.03842, 0.3223804, -1.500482, 1, 1, 1, 1, 1,
-2.015371, -2.227711, -2.450707, 1, 1, 1, 1, 1,
-2.013655, 0.1898263, -1.736346, 1, 1, 1, 1, 1,
-1.99504, -0.9098512, -3.315618, 0, 0, 1, 1, 1,
-1.990099, -0.08699919, -4.000425, 1, 0, 0, 1, 1,
-1.981911, 0.2566617, -0.9230157, 1, 0, 0, 1, 1,
-1.95447, 0.2395424, -2.166137, 1, 0, 0, 1, 1,
-1.953738, 0.1801986, -2.383683, 1, 0, 0, 1, 1,
-1.953174, 0.3620643, -2.657398, 1, 0, 0, 1, 1,
-1.946591, -0.6896108, -2.491605, 0, 0, 0, 1, 1,
-1.944867, -0.4699447, -1.335433, 0, 0, 0, 1, 1,
-1.94069, -0.7808238, -1.974198, 0, 0, 0, 1, 1,
-1.930277, 1.08548, -0.7066909, 0, 0, 0, 1, 1,
-1.908342, -0.6633242, -0.682327, 0, 0, 0, 1, 1,
-1.90769, 0.1316455, -3.26494, 0, 0, 0, 1, 1,
-1.876295, 0.2213217, -1.148, 0, 0, 0, 1, 1,
-1.874712, -0.3060226, -1.556393, 1, 1, 1, 1, 1,
-1.798056, -0.0620314, -2.827955, 1, 1, 1, 1, 1,
-1.79719, -0.5540785, -0.5292697, 1, 1, 1, 1, 1,
-1.792761, 0.6921256, -1.440447, 1, 1, 1, 1, 1,
-1.767261, 0.8191262, -0.6226284, 1, 1, 1, 1, 1,
-1.746219, -0.7430184, -2.279386, 1, 1, 1, 1, 1,
-1.736417, 0.5635489, -0.001633441, 1, 1, 1, 1, 1,
-1.726261, -1.424387, 1.037682, 1, 1, 1, 1, 1,
-1.726069, -0.1259986, -1.265935, 1, 1, 1, 1, 1,
-1.689163, 0.8640168, -1.869672, 1, 1, 1, 1, 1,
-1.685919, 0.8535503, -0.1691996, 1, 1, 1, 1, 1,
-1.674577, -0.5978597, -2.282525, 1, 1, 1, 1, 1,
-1.671837, -0.2434158, -1.917435, 1, 1, 1, 1, 1,
-1.666459, 1.323191, -1.155321, 1, 1, 1, 1, 1,
-1.618221, 0.7785754, -0.4251095, 1, 1, 1, 1, 1,
-1.614834, 1.003816, -0.9256, 0, 0, 1, 1, 1,
-1.614387, 0.6621545, -1.92737, 1, 0, 0, 1, 1,
-1.598699, -2.286375, -2.492131, 1, 0, 0, 1, 1,
-1.594995, 0.2611407, -0.1045105, 1, 0, 0, 1, 1,
-1.578405, 1.32654, 1.606588, 1, 0, 0, 1, 1,
-1.576054, 0.2028224, -0.2677352, 1, 0, 0, 1, 1,
-1.575244, 0.3455473, -1.130426, 0, 0, 0, 1, 1,
-1.565662, 1.198265, -1.505915, 0, 0, 0, 1, 1,
-1.561176, -2.651888, -3.720938, 0, 0, 0, 1, 1,
-1.55627, -0.3790391, -1.385261, 0, 0, 0, 1, 1,
-1.548672, 1.521793, 0.4459567, 0, 0, 0, 1, 1,
-1.537233, 1.121263, -1.161176, 0, 0, 0, 1, 1,
-1.53401, -0.9244694, 0.1145604, 0, 0, 0, 1, 1,
-1.529498, 0.6812776, -2.456704, 1, 1, 1, 1, 1,
-1.527474, 0.1851098, -0.904723, 1, 1, 1, 1, 1,
-1.521965, -1.841377, -3.543539, 1, 1, 1, 1, 1,
-1.515533, -0.4124522, -1.380176, 1, 1, 1, 1, 1,
-1.513577, 0.3660506, 0.1048863, 1, 1, 1, 1, 1,
-1.494084, -1.43499, -2.645059, 1, 1, 1, 1, 1,
-1.49087, 1.539324, -0.4402758, 1, 1, 1, 1, 1,
-1.477547, 1.142166, -0.8488501, 1, 1, 1, 1, 1,
-1.467932, -0.4403815, -1.661199, 1, 1, 1, 1, 1,
-1.466321, -1.950507, -2.760485, 1, 1, 1, 1, 1,
-1.46466, 0.1370003, -1.548729, 1, 1, 1, 1, 1,
-1.463896, -1.356499, -3.236757, 1, 1, 1, 1, 1,
-1.462505, -0.4575529, -1.4109, 1, 1, 1, 1, 1,
-1.46028, 0.9562814, 0.7501541, 1, 1, 1, 1, 1,
-1.446881, 0.8532487, -2.33878, 1, 1, 1, 1, 1,
-1.444741, -0.4002644, -3.012531, 0, 0, 1, 1, 1,
-1.419801, 0.8954875, -0.5250221, 1, 0, 0, 1, 1,
-1.417207, 1.26443, -1.16411, 1, 0, 0, 1, 1,
-1.414655, 1.376514, -0.06093441, 1, 0, 0, 1, 1,
-1.41185, -0.4084341, -2.004996, 1, 0, 0, 1, 1,
-1.391002, 0.462172, -0.6995984, 1, 0, 0, 1, 1,
-1.379665, -0.2495293, -1.670697, 0, 0, 0, 1, 1,
-1.355665, -1.146049, -1.974884, 0, 0, 0, 1, 1,
-1.352852, 0.9344776, -1.585104, 0, 0, 0, 1, 1,
-1.342234, -0.07879075, -2.479663, 0, 0, 0, 1, 1,
-1.334152, 0.3747786, -1.254631, 0, 0, 0, 1, 1,
-1.328686, -0.1895342, -1.120408, 0, 0, 0, 1, 1,
-1.32346, 1.835704, -0.4764805, 0, 0, 0, 1, 1,
-1.319266, 1.31916, -0.6086139, 1, 1, 1, 1, 1,
-1.318098, 0.4335816, 0.1728893, 1, 1, 1, 1, 1,
-1.316499, -1.412624, -1.21133, 1, 1, 1, 1, 1,
-1.315394, -0.8294315, -1.490645, 1, 1, 1, 1, 1,
-1.315041, -0.7738605, -4.77517, 1, 1, 1, 1, 1,
-1.305436, 2.106209, -1.096446, 1, 1, 1, 1, 1,
-1.296056, 0.7211304, -0.8488234, 1, 1, 1, 1, 1,
-1.279377, 0.1935772, -1.424392, 1, 1, 1, 1, 1,
-1.279242, 1.547617, -1.248219, 1, 1, 1, 1, 1,
-1.277458, -2.067951, -3.478029, 1, 1, 1, 1, 1,
-1.241932, 0.3761153, -2.004897, 1, 1, 1, 1, 1,
-1.241716, 1.500539, -0.7821867, 1, 1, 1, 1, 1,
-1.235911, -0.5077057, -3.050942, 1, 1, 1, 1, 1,
-1.233481, 0.3523812, -1.56991, 1, 1, 1, 1, 1,
-1.233284, 0.2396291, -1.501898, 1, 1, 1, 1, 1,
-1.227408, 2.48069, 0.3540526, 0, 0, 1, 1, 1,
-1.226806, -0.8017919, -1.937189, 1, 0, 0, 1, 1,
-1.224221, -0.7985253, -1.094643, 1, 0, 0, 1, 1,
-1.199566, 0.4146267, -3.288053, 1, 0, 0, 1, 1,
-1.196917, 0.2340927, -2.374073, 1, 0, 0, 1, 1,
-1.194462, -0.3244031, -1.455746, 1, 0, 0, 1, 1,
-1.184234, 0.6743501, -0.5761389, 0, 0, 0, 1, 1,
-1.170159, -0.7054669, -1.066384, 0, 0, 0, 1, 1,
-1.168976, 1.521559, 0.005370979, 0, 0, 0, 1, 1,
-1.166658, -0.546331, -1.835265, 0, 0, 0, 1, 1,
-1.162726, -1.407068, -2.747481, 0, 0, 0, 1, 1,
-1.154202, 1.817234, 0.7437329, 0, 0, 0, 1, 1,
-1.148467, 0.5849469, -0.2423839, 0, 0, 0, 1, 1,
-1.148409, 1.615564, 0.2165223, 1, 1, 1, 1, 1,
-1.14716, -0.2584139, -2.276471, 1, 1, 1, 1, 1,
-1.144485, 0.3933127, -0.716848, 1, 1, 1, 1, 1,
-1.142444, 0.7758894, -1.99855, 1, 1, 1, 1, 1,
-1.140449, -0.9553829, -3.060238, 1, 1, 1, 1, 1,
-1.127682, 1.895563, 1.007376, 1, 1, 1, 1, 1,
-1.125852, 0.1230766, -2.837981, 1, 1, 1, 1, 1,
-1.11111, -0.522484, -1.432015, 1, 1, 1, 1, 1,
-1.102232, -0.4834823, -2.055901, 1, 1, 1, 1, 1,
-1.098262, 0.3678633, -2.524258, 1, 1, 1, 1, 1,
-1.095608, -1.037746, -2.129681, 1, 1, 1, 1, 1,
-1.094585, 0.9605414, 0.3627035, 1, 1, 1, 1, 1,
-1.093588, 0.4168282, -1.158707, 1, 1, 1, 1, 1,
-1.09056, -0.03374385, -1.957654, 1, 1, 1, 1, 1,
-1.088252, 0.8047046, -0.3505332, 1, 1, 1, 1, 1,
-1.078446, -0.08319496, -1.453077, 0, 0, 1, 1, 1,
-1.075848, -0.9061298, -3.310673, 1, 0, 0, 1, 1,
-1.074002, 0.2789516, -1.209768, 1, 0, 0, 1, 1,
-1.073409, 0.4526651, -0.6749359, 1, 0, 0, 1, 1,
-1.069881, -0.6998404, -2.485256, 1, 0, 0, 1, 1,
-1.067811, 0.7172244, -2.833152, 1, 0, 0, 1, 1,
-1.051351, 0.4549627, -3.261063, 0, 0, 0, 1, 1,
-1.051312, 0.8250361, -1.751465, 0, 0, 0, 1, 1,
-1.018326, 2.898626, 0.4264138, 0, 0, 0, 1, 1,
-1.015981, -0.5290868, -0.965363, 0, 0, 0, 1, 1,
-1.015216, -0.9383852, -2.891278, 0, 0, 0, 1, 1,
-1.012064, 0.5252258, 0.05830408, 0, 0, 0, 1, 1,
-1.008722, -0.7134905, -1.802154, 0, 0, 0, 1, 1,
-1.006977, -1.18591, -4.260184, 1, 1, 1, 1, 1,
-1.003786, 1.134314, -1.504748, 1, 1, 1, 1, 1,
-0.9870617, -1.017518, -1.192086, 1, 1, 1, 1, 1,
-0.9856633, -0.08167777, -3.321598, 1, 1, 1, 1, 1,
-0.9816637, -0.946119, -3.025964, 1, 1, 1, 1, 1,
-0.9773746, -2.495472, -3.128037, 1, 1, 1, 1, 1,
-0.9767737, -0.4252012, -0.9603599, 1, 1, 1, 1, 1,
-0.975726, -0.4519101, -3.992988, 1, 1, 1, 1, 1,
-0.9756995, 0.6960106, -1.891142, 1, 1, 1, 1, 1,
-0.9709981, -0.1204079, -0.9211046, 1, 1, 1, 1, 1,
-0.9660871, -1.012064, -1.98676, 1, 1, 1, 1, 1,
-0.9638066, -1.752399, -0.6621351, 1, 1, 1, 1, 1,
-0.9548518, -0.3460087, -3.484149, 1, 1, 1, 1, 1,
-0.9521403, 0.5708765, -0.1021069, 1, 1, 1, 1, 1,
-0.9508588, 1.556391, -0.1299386, 1, 1, 1, 1, 1,
-0.9495402, -1.100665, -3.712569, 0, 0, 1, 1, 1,
-0.9490917, -1.014364, -1.734434, 1, 0, 0, 1, 1,
-0.9489217, -0.9000157, -2.256563, 1, 0, 0, 1, 1,
-0.9467558, -0.7732076, -1.941876, 1, 0, 0, 1, 1,
-0.9441094, -2.551178, -3.535098, 1, 0, 0, 1, 1,
-0.9430836, -2.14848, -2.006675, 1, 0, 0, 1, 1,
-0.9427552, -0.9738829, -2.651392, 0, 0, 0, 1, 1,
-0.9408343, 0.04349557, -2.068185, 0, 0, 0, 1, 1,
-0.9376726, -1.537192, -1.893153, 0, 0, 0, 1, 1,
-0.9319155, 0.720989, -0.7604, 0, 0, 0, 1, 1,
-0.915948, -2.146094, -2.526353, 0, 0, 0, 1, 1,
-0.9042004, 0.09907191, -0.2050333, 0, 0, 0, 1, 1,
-0.9029576, -1.600992, -2.300426, 0, 0, 0, 1, 1,
-0.8986875, -0.166067, -0.1473646, 1, 1, 1, 1, 1,
-0.8945248, -0.9127528, -2.049587, 1, 1, 1, 1, 1,
-0.8904684, -0.4452428, -2.980327, 1, 1, 1, 1, 1,
-0.8799617, -1.194505, -1.958878, 1, 1, 1, 1, 1,
-0.8705165, 0.1159954, -2.08876, 1, 1, 1, 1, 1,
-0.8691841, 0.2181178, -2.000978, 1, 1, 1, 1, 1,
-0.8635197, -0.7768494, -2.233732, 1, 1, 1, 1, 1,
-0.8617907, 1.573759, -0.7662492, 1, 1, 1, 1, 1,
-0.8600615, -0.6482846, -1.998526, 1, 1, 1, 1, 1,
-0.8516678, -0.2730912, -2.196308, 1, 1, 1, 1, 1,
-0.8516505, 0.01540265, -0.0541277, 1, 1, 1, 1, 1,
-0.8506937, -0.9689763, -2.176781, 1, 1, 1, 1, 1,
-0.8482904, 1.510834, -1.907155, 1, 1, 1, 1, 1,
-0.8437864, -0.6478146, -2.333162, 1, 1, 1, 1, 1,
-0.8351265, 0.5992777, 0.01753897, 1, 1, 1, 1, 1,
-0.8324302, 1.020816, -2.271955, 0, 0, 1, 1, 1,
-0.8317917, -0.04675767, -2.390319, 1, 0, 0, 1, 1,
-0.8311847, -0.5441206, -3.187855, 1, 0, 0, 1, 1,
-0.8260858, -0.7591115, -1.463002, 1, 0, 0, 1, 1,
-0.8200866, -0.1168861, -1.422599, 1, 0, 0, 1, 1,
-0.8187285, 0.6361232, -1.684534, 1, 0, 0, 1, 1,
-0.8185971, -1.130459, -3.471271, 0, 0, 0, 1, 1,
-0.8183873, -1.193281, -1.989647, 0, 0, 0, 1, 1,
-0.8134055, 0.514326, -2.07311, 0, 0, 0, 1, 1,
-0.8053389, -0.6727802, -1.886805, 0, 0, 0, 1, 1,
-0.8041738, -2.144094, -3.664348, 0, 0, 0, 1, 1,
-0.8040057, 0.6024228, -1.004514, 0, 0, 0, 1, 1,
-0.8038462, 0.4382824, -0.7318799, 0, 0, 0, 1, 1,
-0.7978765, 0.9940082, 0.6256861, 1, 1, 1, 1, 1,
-0.7974284, -0.3202515, -1.957673, 1, 1, 1, 1, 1,
-0.7957144, -0.1912421, -1.341635, 1, 1, 1, 1, 1,
-0.7926069, 0.1896624, 0.2018959, 1, 1, 1, 1, 1,
-0.79224, 0.3018942, -2.765023, 1, 1, 1, 1, 1,
-0.7815135, 0.5097655, -1.880542, 1, 1, 1, 1, 1,
-0.7793332, -2.681442, -4.623647, 1, 1, 1, 1, 1,
-0.7791083, 0.4164361, -1.698254, 1, 1, 1, 1, 1,
-0.7790799, 0.6027754, -1.612635, 1, 1, 1, 1, 1,
-0.7776114, -0.1999192, -2.548857, 1, 1, 1, 1, 1,
-0.7767774, -0.9581981, -3.285446, 1, 1, 1, 1, 1,
-0.7758539, 0.1564647, 0.3115444, 1, 1, 1, 1, 1,
-0.7754571, 0.1757249, -1.693952, 1, 1, 1, 1, 1,
-0.7685457, 1.319054, -1.483428, 1, 1, 1, 1, 1,
-0.7667619, 0.4353046, -2.451074, 1, 1, 1, 1, 1,
-0.7657298, -0.3731486, -1.895319, 0, 0, 1, 1, 1,
-0.7636577, -0.5203696, -3.564617, 1, 0, 0, 1, 1,
-0.7548724, 3.002729, -0.6799478, 1, 0, 0, 1, 1,
-0.7526692, 0.8398212, -0.8861881, 1, 0, 0, 1, 1,
-0.7525288, -0.8059819, -1.571482, 1, 0, 0, 1, 1,
-0.7495707, 0.5404763, -0.356004, 1, 0, 0, 1, 1,
-0.7453003, -0.1934419, -1.77335, 0, 0, 0, 1, 1,
-0.7452702, 0.781549, 0.7408045, 0, 0, 0, 1, 1,
-0.7415809, 0.9209393, -1.490638, 0, 0, 0, 1, 1,
-0.740545, -0.2717376, -2.120462, 0, 0, 0, 1, 1,
-0.7393605, -0.3329263, -2.147932, 0, 0, 0, 1, 1,
-0.7370746, 0.5306454, -2.402468, 0, 0, 0, 1, 1,
-0.7361379, -1.020021, -3.891039, 0, 0, 0, 1, 1,
-0.7348258, 0.5352282, -2.047258, 1, 1, 1, 1, 1,
-0.7312822, 0.4750101, -1.20462, 1, 1, 1, 1, 1,
-0.7298239, -0.2336454, -0.6741993, 1, 1, 1, 1, 1,
-0.729064, -0.56204, -2.050471, 1, 1, 1, 1, 1,
-0.7286852, -0.8328406, -1.645453, 1, 1, 1, 1, 1,
-0.7285773, -0.2654757, -1.840242, 1, 1, 1, 1, 1,
-0.7125462, 0.3447416, -1.554013, 1, 1, 1, 1, 1,
-0.7125106, 0.8637384, -0.3421865, 1, 1, 1, 1, 1,
-0.7107899, -0.9027795, -2.770092, 1, 1, 1, 1, 1,
-0.7100149, 0.6750374, -3.233847, 1, 1, 1, 1, 1,
-0.7094265, 1.377857, -0.3151188, 1, 1, 1, 1, 1,
-0.7090799, 0.6852915, 1.672155, 1, 1, 1, 1, 1,
-0.7077507, 1.598936, -0.1515946, 1, 1, 1, 1, 1,
-0.7071888, -1.540553, -3.894688, 1, 1, 1, 1, 1,
-0.7065004, 1.279567, 0.5371752, 1, 1, 1, 1, 1,
-0.7064296, 0.2490804, -2.211499, 0, 0, 1, 1, 1,
-0.7058027, -1.887525, -3.737412, 1, 0, 0, 1, 1,
-0.701369, -0.5790571, -3.790625, 1, 0, 0, 1, 1,
-0.6997882, -0.1168816, -0.7258176, 1, 0, 0, 1, 1,
-0.6956365, -0.2034884, -1.545891, 1, 0, 0, 1, 1,
-0.6932987, -0.4055983, -2.337539, 1, 0, 0, 1, 1,
-0.6922647, 0.1944354, -2.906511, 0, 0, 0, 1, 1,
-0.6900424, -0.3535648, -1.533446, 0, 0, 0, 1, 1,
-0.6854349, -0.6004452, -2.001111, 0, 0, 0, 1, 1,
-0.6733607, -0.2820491, -2.486013, 0, 0, 0, 1, 1,
-0.6714221, 1.419274, 1.65053, 0, 0, 0, 1, 1,
-0.670193, 0.9081534, 0.9335508, 0, 0, 0, 1, 1,
-0.6669151, 0.3372633, -0.8317938, 0, 0, 0, 1, 1,
-0.6632115, 0.8817257, -0.7074669, 1, 1, 1, 1, 1,
-0.6619989, -0.5398282, -2.995041, 1, 1, 1, 1, 1,
-0.6571046, 3.132524, -0.04492323, 1, 1, 1, 1, 1,
-0.6465743, -0.1165724, -2.341098, 1, 1, 1, 1, 1,
-0.6424165, 0.8989066, -0.5950545, 1, 1, 1, 1, 1,
-0.6418715, -0.7233348, -3.180822, 1, 1, 1, 1, 1,
-0.6405382, 0.9208801, -0.2824548, 1, 1, 1, 1, 1,
-0.638342, -0.3970113, -1.089239, 1, 1, 1, 1, 1,
-0.6284388, -0.9921582, -2.084845, 1, 1, 1, 1, 1,
-0.6273797, -1.623206, -5.017272, 1, 1, 1, 1, 1,
-0.6227466, -1.897262, -4.159245, 1, 1, 1, 1, 1,
-0.612769, 1.543131, 0.1618827, 1, 1, 1, 1, 1,
-0.6100289, 1.024232, -1.830796, 1, 1, 1, 1, 1,
-0.6056906, -1.487965, -1.258148, 1, 1, 1, 1, 1,
-0.6025831, -0.2752562, -1.428372, 1, 1, 1, 1, 1,
-0.5994232, 0.2828171, -1.870556, 0, 0, 1, 1, 1,
-0.5988953, 1.216038, 0.6774426, 1, 0, 0, 1, 1,
-0.5959163, -0.5963848, -2.465048, 1, 0, 0, 1, 1,
-0.5949486, -1.840031, -4.969228, 1, 0, 0, 1, 1,
-0.5897067, 0.5171602, -1.992497, 1, 0, 0, 1, 1,
-0.5863715, -0.1257896, -1.695439, 1, 0, 0, 1, 1,
-0.5783235, 0.7532808, -1.296927, 0, 0, 0, 1, 1,
-0.5755649, -1.435163, -2.497885, 0, 0, 0, 1, 1,
-0.5720941, -1.314976, -3.724184, 0, 0, 0, 1, 1,
-0.5702709, -1.08377, -1.222959, 0, 0, 0, 1, 1,
-0.5693672, 0.6226032, 1.381005, 0, 0, 0, 1, 1,
-0.5653419, -0.1936447, -1.998718, 0, 0, 0, 1, 1,
-0.5617826, 0.7993038, -0.3522215, 0, 0, 0, 1, 1,
-0.5533812, -0.5005135, -2.503773, 1, 1, 1, 1, 1,
-0.5459032, 0.8897268, -2.663841, 1, 1, 1, 1, 1,
-0.5445881, -0.6201164, -3.188845, 1, 1, 1, 1, 1,
-0.5434447, 1.130955, -0.5561371, 1, 1, 1, 1, 1,
-0.5426264, 1.356567, -0.7309579, 1, 1, 1, 1, 1,
-0.5357272, 0.6520886, -0.02066696, 1, 1, 1, 1, 1,
-0.5312847, 0.3225505, 0.4556426, 1, 1, 1, 1, 1,
-0.5288784, 0.2965983, -0.7457748, 1, 1, 1, 1, 1,
-0.5270894, 1.689211, -0.3608148, 1, 1, 1, 1, 1,
-0.5257891, 0.06827159, -0.5942395, 1, 1, 1, 1, 1,
-0.5242714, 0.7147037, -1.056061, 1, 1, 1, 1, 1,
-0.514329, -1.28889, -3.304893, 1, 1, 1, 1, 1,
-0.5095646, -0.8548293, -2.192978, 1, 1, 1, 1, 1,
-0.5081224, 0.01224236, -3.436227, 1, 1, 1, 1, 1,
-0.5077668, 1.461163, 2.969701, 1, 1, 1, 1, 1,
-0.5049583, 0.9362497, -1.026955, 0, 0, 1, 1, 1,
-0.5030581, 0.1390998, -0.5624993, 1, 0, 0, 1, 1,
-0.4998321, -0.239845, -1.936068, 1, 0, 0, 1, 1,
-0.4991271, -0.2893766, -1.934276, 1, 0, 0, 1, 1,
-0.4979347, 0.7994267, 1.378987, 1, 0, 0, 1, 1,
-0.4968659, 0.9080815, -0.8020823, 1, 0, 0, 1, 1,
-0.4908372, 0.08597855, -3.261811, 0, 0, 0, 1, 1,
-0.4880909, -1.636175, -3.969376, 0, 0, 0, 1, 1,
-0.4845275, 1.232274, -1.281937, 0, 0, 0, 1, 1,
-0.484456, 0.9708048, 0.8290069, 0, 0, 0, 1, 1,
-0.4775655, 0.1414582, -2.404191, 0, 0, 0, 1, 1,
-0.4739985, -0.1035115, -1.969874, 0, 0, 0, 1, 1,
-0.4715727, 1.36199, -1.736061, 0, 0, 0, 1, 1,
-0.4699163, -0.1174237, -2.075384, 1, 1, 1, 1, 1,
-0.4695365, -0.1026973, -1.811086, 1, 1, 1, 1, 1,
-0.4694395, -1.03966, -3.99536, 1, 1, 1, 1, 1,
-0.4659532, -1.273393, -3.121191, 1, 1, 1, 1, 1,
-0.4654669, 1.15421, 0.1396224, 1, 1, 1, 1, 1,
-0.4631936, 0.5619261, 0.4154128, 1, 1, 1, 1, 1,
-0.4559423, 0.814811, -0.3353518, 1, 1, 1, 1, 1,
-0.4556138, 1.75012, 1.65976, 1, 1, 1, 1, 1,
-0.4497792, 0.5023091, -1.219674, 1, 1, 1, 1, 1,
-0.4395359, -0.7332276, -3.653775, 1, 1, 1, 1, 1,
-0.4386194, -0.8226316, -2.412376, 1, 1, 1, 1, 1,
-0.4343813, 0.8314145, -0.9327685, 1, 1, 1, 1, 1,
-0.4313012, 0.5825337, -1.664588, 1, 1, 1, 1, 1,
-0.4311195, -0.5228116, -1.919548, 1, 1, 1, 1, 1,
-0.4281611, 0.04399383, -1.986553, 1, 1, 1, 1, 1,
-0.4261157, 0.1785997, -2.827191, 0, 0, 1, 1, 1,
-0.4211824, -0.6857935, -1.761328, 1, 0, 0, 1, 1,
-0.4201624, 1.128958, 0.9967349, 1, 0, 0, 1, 1,
-0.4162611, 1.496909, 1.098951, 1, 0, 0, 1, 1,
-0.4142668, 0.01161603, -0.6235884, 1, 0, 0, 1, 1,
-0.408331, 0.7289072, -0.2504582, 1, 0, 0, 1, 1,
-0.4076421, 0.5940309, 1.27462, 0, 0, 0, 1, 1,
-0.4064929, 0.4876877, -0.7361196, 0, 0, 0, 1, 1,
-0.4017048, 0.9814214, -1.881371, 0, 0, 0, 1, 1,
-0.400955, 0.07597869, -3.49435, 0, 0, 0, 1, 1,
-0.3997534, -0.7822523, -0.297287, 0, 0, 0, 1, 1,
-0.3956317, 0.296152, -0.4164207, 0, 0, 0, 1, 1,
-0.392878, 0.2588277, 1.420029, 0, 0, 0, 1, 1,
-0.391546, 1.394786, -1.797031, 1, 1, 1, 1, 1,
-0.3848179, 0.06771724, 0.117262, 1, 1, 1, 1, 1,
-0.3842174, -0.5753173, -3.147579, 1, 1, 1, 1, 1,
-0.375211, -0.6921958, -2.311748, 1, 1, 1, 1, 1,
-0.3718527, -1.598542, -2.347055, 1, 1, 1, 1, 1,
-0.3712139, 1.022429, 0.977024, 1, 1, 1, 1, 1,
-0.3711973, 0.9444209, -1.600781, 1, 1, 1, 1, 1,
-0.3670434, -1.61711, -3.051845, 1, 1, 1, 1, 1,
-0.3662416, -1.152857, -3.958839, 1, 1, 1, 1, 1,
-0.3631883, -0.2302653, -2.661631, 1, 1, 1, 1, 1,
-0.3622243, -0.4228533, -1.977536, 1, 1, 1, 1, 1,
-0.3618517, -0.1014871, -3.143697, 1, 1, 1, 1, 1,
-0.3616289, 2.069547, 1.91381, 1, 1, 1, 1, 1,
-0.3552632, 2.013902, -0.08330829, 1, 1, 1, 1, 1,
-0.3523495, 0.2668035, -2.765728, 1, 1, 1, 1, 1,
-0.3503745, -0.02139445, -2.451402, 0, 0, 1, 1, 1,
-0.3498518, 0.5486451, -3.063136, 1, 0, 0, 1, 1,
-0.3494464, -0.256851, 0.1594058, 1, 0, 0, 1, 1,
-0.3477418, 0.9654102, -1.088868, 1, 0, 0, 1, 1,
-0.346733, 0.08274345, -1.652081, 1, 0, 0, 1, 1,
-0.3460655, -0.2299554, -0.930519, 1, 0, 0, 1, 1,
-0.3452877, 3.060391, 0.08352102, 0, 0, 0, 1, 1,
-0.3422485, -0.6258325, -2.541301, 0, 0, 0, 1, 1,
-0.3422335, 0.2761475, -2.394992, 0, 0, 0, 1, 1,
-0.340125, 0.7786529, 0.8941908, 0, 0, 0, 1, 1,
-0.3389456, -1.219086, -1.355638, 0, 0, 0, 1, 1,
-0.3388485, 0.5145743, -0.2688541, 0, 0, 0, 1, 1,
-0.3372731, 2.039022, -1.69963, 0, 0, 0, 1, 1,
-0.3365475, -1.645866, -4.063728, 1, 1, 1, 1, 1,
-0.3323903, 0.3930397, 0.7246063, 1, 1, 1, 1, 1,
-0.3318531, -0.7591994, -2.719684, 1, 1, 1, 1, 1,
-0.3291822, -0.6370758, -1.532644, 1, 1, 1, 1, 1,
-0.3270623, -0.4948932, -2.671937, 1, 1, 1, 1, 1,
-0.3269483, 0.1686861, 0.5843688, 1, 1, 1, 1, 1,
-0.324258, 0.3219587, -1.141787, 1, 1, 1, 1, 1,
-0.3231336, 0.47936, -0.6488108, 1, 1, 1, 1, 1,
-0.3214222, -0.6944681, -1.758973, 1, 1, 1, 1, 1,
-0.3209354, -0.7906865, -3.4539, 1, 1, 1, 1, 1,
-0.3157775, 0.3522704, 0.17918, 1, 1, 1, 1, 1,
-0.3117042, -1.737223, -2.693542, 1, 1, 1, 1, 1,
-0.3113245, -1.088427, -2.112486, 1, 1, 1, 1, 1,
-0.3077153, 0.5474908, -1.067744, 1, 1, 1, 1, 1,
-0.3075644, 1.433974, 0.6979718, 1, 1, 1, 1, 1,
-0.3073337, 0.780261, 0.1029058, 0, 0, 1, 1, 1,
-0.3069198, -0.8811083, -2.964959, 1, 0, 0, 1, 1,
-0.3008719, -0.904881, -3.082933, 1, 0, 0, 1, 1,
-0.2989116, 0.2660708, -1.358067, 1, 0, 0, 1, 1,
-0.2965936, -0.1852933, -2.819546, 1, 0, 0, 1, 1,
-0.2964187, -1.204739, -2.499062, 1, 0, 0, 1, 1,
-0.2865633, 0.4134854, -1.24068, 0, 0, 0, 1, 1,
-0.2842267, -1.024976, -3.226614, 0, 0, 0, 1, 1,
-0.2835978, 1.725025, -1.9376, 0, 0, 0, 1, 1,
-0.2820541, -0.06855838, -2.952623, 0, 0, 0, 1, 1,
-0.2785471, -1.722233, -2.889448, 0, 0, 0, 1, 1,
-0.2777232, -0.8964242, -4.635609, 0, 0, 0, 1, 1,
-0.2765676, 0.9736487, -2.298151, 0, 0, 0, 1, 1,
-0.2731683, -0.2852179, -2.001601, 1, 1, 1, 1, 1,
-0.2716763, 0.6738117, -0.6338319, 1, 1, 1, 1, 1,
-0.2698933, 1.270356, -1.06212, 1, 1, 1, 1, 1,
-0.2682436, -1.071337, -5.287016, 1, 1, 1, 1, 1,
-0.2656318, 1.578375, -2.12095, 1, 1, 1, 1, 1,
-0.259403, 1.982936, 0.6647418, 1, 1, 1, 1, 1,
-0.2545878, -0.3130026, -5.525143, 1, 1, 1, 1, 1,
-0.2536417, -1.281402, -2.630617, 1, 1, 1, 1, 1,
-0.2513285, -0.6902082, -2.370474, 1, 1, 1, 1, 1,
-0.2506134, -0.6366722, -3.411218, 1, 1, 1, 1, 1,
-0.2500215, -0.8754632, -3.525683, 1, 1, 1, 1, 1,
-0.24787, -0.495956, -3.414705, 1, 1, 1, 1, 1,
-0.2476157, -0.1141075, -1.811362, 1, 1, 1, 1, 1,
-0.2455097, 0.5272001, 2.255178, 1, 1, 1, 1, 1,
-0.244443, -1.823396, -2.5299, 1, 1, 1, 1, 1,
-0.240848, -0.7603143, -2.967228, 0, 0, 1, 1, 1,
-0.2399251, 0.6098378, -1.344096, 1, 0, 0, 1, 1,
-0.2373478, 1.159125, 1.344483, 1, 0, 0, 1, 1,
-0.2366406, -1.474937, -2.614485, 1, 0, 0, 1, 1,
-0.2346082, -0.9474409, -2.810661, 1, 0, 0, 1, 1,
-0.2343047, -0.6877515, -4.051764, 1, 0, 0, 1, 1,
-0.2323711, 3.289572, 0.4143146, 0, 0, 0, 1, 1,
-0.2313781, 0.0743835, -1.950096, 0, 0, 0, 1, 1,
-0.2284405, -0.3907629, -0.5290017, 0, 0, 0, 1, 1,
-0.2279138, 0.3810102, -1.261901, 0, 0, 0, 1, 1,
-0.227394, -1.039212, -4.019648, 0, 0, 0, 1, 1,
-0.2266835, -0.7127199, -2.050172, 0, 0, 0, 1, 1,
-0.2258421, -1.346226, -3.803576, 0, 0, 0, 1, 1,
-0.2221327, 0.1519483, -1.836756, 1, 1, 1, 1, 1,
-0.2195997, -0.5284194, -4.012046, 1, 1, 1, 1, 1,
-0.2159466, 0.2913644, 1.058501, 1, 1, 1, 1, 1,
-0.2097514, 0.7769659, -0.2476455, 1, 1, 1, 1, 1,
-0.2074243, 0.2893866, -0.53799, 1, 1, 1, 1, 1,
-0.2059531, -1.360202, -0.9945055, 1, 1, 1, 1, 1,
-0.2056023, -0.4382955, -2.144689, 1, 1, 1, 1, 1,
-0.2041083, -1.777725, -2.556826, 1, 1, 1, 1, 1,
-0.20073, -1.070475, -0.9807583, 1, 1, 1, 1, 1,
-0.1922711, 1.301471, -0.6345403, 1, 1, 1, 1, 1,
-0.1916299, 1.031417, -2.01017, 1, 1, 1, 1, 1,
-0.189125, 0.8701594, -1.705878, 1, 1, 1, 1, 1,
-0.1886081, -2.724612, -2.934724, 1, 1, 1, 1, 1,
-0.1758959, -1.118256, -3.098722, 1, 1, 1, 1, 1,
-0.1746403, -0.1361337, -1.832919, 1, 1, 1, 1, 1,
-0.1725525, 0.7172673, 0.9528335, 0, 0, 1, 1, 1,
-0.1708793, 0.800383, -1.196657, 1, 0, 0, 1, 1,
-0.1603622, -1.661379, -2.817756, 1, 0, 0, 1, 1,
-0.1517734, -0.8354867, -3.620323, 1, 0, 0, 1, 1,
-0.1512282, -1.120474, -2.858315, 1, 0, 0, 1, 1,
-0.1503697, 0.160125, -1.655233, 1, 0, 0, 1, 1,
-0.1454287, -1.095534, -2.535723, 0, 0, 0, 1, 1,
-0.1414692, -0.3821089, -3.967749, 0, 0, 0, 1, 1,
-0.1408862, -0.02457571, -2.883681, 0, 0, 0, 1, 1,
-0.1362266, 0.1646758, 0.2349876, 0, 0, 0, 1, 1,
-0.1341313, 0.2813082, -0.6660728, 0, 0, 0, 1, 1,
-0.1312263, 2.024877, 1.718991, 0, 0, 0, 1, 1,
-0.1293938, 0.6979869, 0.01819271, 0, 0, 0, 1, 1,
-0.12859, -0.202424, -3.656002, 1, 1, 1, 1, 1,
-0.118163, -0.7166465, -0.7402625, 1, 1, 1, 1, 1,
-0.1163184, -0.3675682, -4.640804, 1, 1, 1, 1, 1,
-0.1136446, -1.737006, -3.919045, 1, 1, 1, 1, 1,
-0.1017431, 0.4923923, -0.08288301, 1, 1, 1, 1, 1,
-0.09746368, 1.013989, 1.064626, 1, 1, 1, 1, 1,
-0.09570014, 0.3692479, 2.31054, 1, 1, 1, 1, 1,
-0.0933207, 1.833523, 1.50181, 1, 1, 1, 1, 1,
-0.09229867, 0.4187309, -0.6600845, 1, 1, 1, 1, 1,
-0.09091512, -0.406015, -3.335965, 1, 1, 1, 1, 1,
-0.08939186, -0.5018612, -2.197474, 1, 1, 1, 1, 1,
-0.08601733, -0.6364808, -3.425248, 1, 1, 1, 1, 1,
-0.08274783, 0.6644666, 0.04949735, 1, 1, 1, 1, 1,
-0.07524256, 0.4306804, 0.6313117, 1, 1, 1, 1, 1,
-0.06859763, 1.650543, -0.0870316, 1, 1, 1, 1, 1,
-0.068448, 1.32837, -1.312481, 0, 0, 1, 1, 1,
-0.06614453, 0.000481982, -2.099777, 1, 0, 0, 1, 1,
-0.06539439, -0.2173375, -1.889473, 1, 0, 0, 1, 1,
-0.0653477, 0.6001968, -0.1588269, 1, 0, 0, 1, 1,
-0.06415115, 0.7478383, -1.140794, 1, 0, 0, 1, 1,
-0.05834842, 1.294017, 0.1331985, 1, 0, 0, 1, 1,
-0.05541781, -0.6946878, -4.840157, 0, 0, 0, 1, 1,
-0.05357946, 1.381042, 0.5601516, 0, 0, 0, 1, 1,
-0.05328115, 0.9113454, -1.017618, 0, 0, 0, 1, 1,
-0.05291729, 0.2282404, -0.507171, 0, 0, 0, 1, 1,
-0.04693627, -1.336179, -3.327464, 0, 0, 0, 1, 1,
-0.04673732, -0.560636, -5.205119, 0, 0, 0, 1, 1,
-0.04517496, -0.6720225, -1.664739, 0, 0, 0, 1, 1,
-0.04481313, -1.051673, -4.013696, 1, 1, 1, 1, 1,
-0.04232288, -0.3804721, -2.080407, 1, 1, 1, 1, 1,
-0.04142088, -2.057016, -3.382392, 1, 1, 1, 1, 1,
-0.03939284, 0.2037362, -0.04564942, 1, 1, 1, 1, 1,
-0.03904283, 0.8430845, -0.3891878, 1, 1, 1, 1, 1,
-0.03653505, -0.4567582, -2.631599, 1, 1, 1, 1, 1,
-0.03502268, -1.413137, -2.281809, 1, 1, 1, 1, 1,
-0.03371417, 0.208922, -1.000839, 1, 1, 1, 1, 1,
-0.03348764, -0.09550364, -3.51532, 1, 1, 1, 1, 1,
-0.02861704, -0.2169385, -5.275688, 1, 1, 1, 1, 1,
-0.02428546, 0.9401982, -0.1169663, 1, 1, 1, 1, 1,
-0.02403171, -1.651686, -2.366877, 1, 1, 1, 1, 1,
-0.02202535, 1.643632, 0.4014683, 1, 1, 1, 1, 1,
-0.01771726, -0.99873, -3.829392, 1, 1, 1, 1, 1,
-0.01705264, -0.1595549, -4.17256, 1, 1, 1, 1, 1,
-0.01650215, 0.1928558, 1.203269, 0, 0, 1, 1, 1,
-0.01092897, 0.1469784, -0.3429522, 1, 0, 0, 1, 1,
-0.01034443, 0.7695867, 0.5585849, 1, 0, 0, 1, 1,
-0.009041001, -1.432847, -3.700733, 1, 0, 0, 1, 1,
-0.004746021, 2.135541, 0.5698147, 1, 0, 0, 1, 1,
-0.004532633, 0.9671991, -1.126098, 1, 0, 0, 1, 1,
-0.00190245, -2.35152, -2.828314, 0, 0, 0, 1, 1,
-0.001044454, 0.1189775, -1.09494, 0, 0, 0, 1, 1,
0.0009910284, -0.1230144, 3.934329, 0, 0, 0, 1, 1,
0.008201065, 0.9040083, -0.9643915, 0, 0, 0, 1, 1,
0.01228965, -0.1759361, 4.620195, 0, 0, 0, 1, 1,
0.01891285, 0.9414215, -2.876895, 0, 0, 0, 1, 1,
0.0191781, -0.7493214, 3.791261, 0, 0, 0, 1, 1,
0.02516229, 0.6230921, 0.1350794, 1, 1, 1, 1, 1,
0.02863272, 0.03756019, 0.9953662, 1, 1, 1, 1, 1,
0.03785701, -0.2201725, 1.541135, 1, 1, 1, 1, 1,
0.0384281, -1.276847, 4.131523, 1, 1, 1, 1, 1,
0.04118843, 0.1784275, -0.4476748, 1, 1, 1, 1, 1,
0.04568097, -0.7398108, 2.370412, 1, 1, 1, 1, 1,
0.04780773, -1.698542, 2.205047, 1, 1, 1, 1, 1,
0.04975176, 0.3783581, -1.159304, 1, 1, 1, 1, 1,
0.05002645, -0.2757812, 3.189532, 1, 1, 1, 1, 1,
0.0534291, -1.874628, 2.463747, 1, 1, 1, 1, 1,
0.05384928, -1.112628, 3.298745, 1, 1, 1, 1, 1,
0.05460558, 2.196311, -0.767533, 1, 1, 1, 1, 1,
0.05556546, 1.260416, -1.523078, 1, 1, 1, 1, 1,
0.05578958, 1.726507, -1.322718, 1, 1, 1, 1, 1,
0.05839914, 0.6883455, -0.7416733, 1, 1, 1, 1, 1,
0.05930416, -2.392392, 2.367142, 0, 0, 1, 1, 1,
0.06225732, 1.183992, -1.13425, 1, 0, 0, 1, 1,
0.06853111, -0.6132849, 2.910958, 1, 0, 0, 1, 1,
0.07106685, 1.455748, 1.641147, 1, 0, 0, 1, 1,
0.07223702, 1.969047, -1.766045, 1, 0, 0, 1, 1,
0.07425059, 0.3380971, -0.08208198, 1, 0, 0, 1, 1,
0.07816331, 0.7967938, 0.4434779, 0, 0, 0, 1, 1,
0.08109602, -1.699013, 3.101547, 0, 0, 0, 1, 1,
0.08183794, 1.1278, 0.6516544, 0, 0, 0, 1, 1,
0.08476803, 1.180549, 1.189666, 0, 0, 0, 1, 1,
0.08529112, -0.1062953, 2.478844, 0, 0, 0, 1, 1,
0.08586439, 1.797502, -0.7690002, 0, 0, 0, 1, 1,
0.08962135, -0.2273113, 3.126004, 0, 0, 0, 1, 1,
0.09013508, 0.04784317, 1.386358, 1, 1, 1, 1, 1,
0.09257223, 0.5527324, 0.3080181, 1, 1, 1, 1, 1,
0.1027169, -0.3585961, 1.718, 1, 1, 1, 1, 1,
0.1130971, -1.465664, 2.576934, 1, 1, 1, 1, 1,
0.1157728, -1.858767, 3.310463, 1, 1, 1, 1, 1,
0.119364, -0.07296202, 3.098049, 1, 1, 1, 1, 1,
0.1213741, 0.2283251, 0.985503, 1, 1, 1, 1, 1,
0.1232968, 0.6755157, 2.100111, 1, 1, 1, 1, 1,
0.1241389, -0.4485008, 4.068356, 1, 1, 1, 1, 1,
0.1286284, -0.712698, 4.739484, 1, 1, 1, 1, 1,
0.1327958, -0.1271671, 2.442632, 1, 1, 1, 1, 1,
0.1393169, 0.3737796, -0.5570269, 1, 1, 1, 1, 1,
0.13989, -0.2667176, 3.525588, 1, 1, 1, 1, 1,
0.1414069, 0.5565864, 0.8743782, 1, 1, 1, 1, 1,
0.1426205, -1.281964, 3.319127, 1, 1, 1, 1, 1,
0.1437906, 0.7564608, -0.5039262, 0, 0, 1, 1, 1,
0.1497912, 0.2015033, 1.097911, 1, 0, 0, 1, 1,
0.1576765, -0.8232037, 1.976832, 1, 0, 0, 1, 1,
0.1601061, 0.2652006, 0.2788114, 1, 0, 0, 1, 1,
0.1611199, 0.279149, 1.747869, 1, 0, 0, 1, 1,
0.164799, -0.3312641, 1.664443, 1, 0, 0, 1, 1,
0.1648646, -0.5304262, 0.756915, 0, 0, 0, 1, 1,
0.16604, -0.1742057, 2.228775, 0, 0, 0, 1, 1,
0.16788, -0.02407833, 1.571709, 0, 0, 0, 1, 1,
0.1681406, -0.464441, 3.42577, 0, 0, 0, 1, 1,
0.1682378, 1.531048, -0.6177713, 0, 0, 0, 1, 1,
0.1704551, -1.268543, 1.879149, 0, 0, 0, 1, 1,
0.1728058, 1.003879, 0.3297521, 0, 0, 0, 1, 1,
0.1746841, -0.1359462, 2.295436, 1, 1, 1, 1, 1,
0.184153, -1.119148, 3.21287, 1, 1, 1, 1, 1,
0.1877377, -0.299952, 3.429332, 1, 1, 1, 1, 1,
0.1900938, -0.5592037, 3.223443, 1, 1, 1, 1, 1,
0.1909, 1.021817, 0.8523843, 1, 1, 1, 1, 1,
0.1910666, 0.4560107, -0.4580053, 1, 1, 1, 1, 1,
0.1921492, -1.39407, 3.12497, 1, 1, 1, 1, 1,
0.193671, -1.313849, 2.649372, 1, 1, 1, 1, 1,
0.1982555, 1.766531, 0.9948108, 1, 1, 1, 1, 1,
0.2019499, -0.285575, 3.820833, 1, 1, 1, 1, 1,
0.2099858, 0.1573396, -0.05293654, 1, 1, 1, 1, 1,
0.2108403, 0.894975, 2.30963, 1, 1, 1, 1, 1,
0.2134967, -0.04328459, 1.819291, 1, 1, 1, 1, 1,
0.215071, 1.437882, -0.03669197, 1, 1, 1, 1, 1,
0.2170863, -1.607785, 4.727056, 1, 1, 1, 1, 1,
0.2268544, 0.3805967, 1.195508, 0, 0, 1, 1, 1,
0.2281709, -0.4621527, 2.703963, 1, 0, 0, 1, 1,
0.2328225, 0.3297045, 0.280011, 1, 0, 0, 1, 1,
0.2333528, 0.574854, 0.8117974, 1, 0, 0, 1, 1,
0.2352917, -1.636932, 3.306011, 1, 0, 0, 1, 1,
0.2365372, 1.117887, -0.8722184, 1, 0, 0, 1, 1,
0.2369923, -0.3800301, 2.371999, 0, 0, 0, 1, 1,
0.2387381, -0.8865426, 3.008405, 0, 0, 0, 1, 1,
0.2401656, -0.4321865, 1.844744, 0, 0, 0, 1, 1,
0.2405491, 0.6301289, 1.01289, 0, 0, 0, 1, 1,
0.2414293, 0.7032877, 2.207973, 0, 0, 0, 1, 1,
0.2430658, -1.768483, 4.52797, 0, 0, 0, 1, 1,
0.2431284, 1.786873, 0.8045637, 0, 0, 0, 1, 1,
0.251673, 0.6220981, 0.4170747, 1, 1, 1, 1, 1,
0.252576, -1.062032, 3.900752, 1, 1, 1, 1, 1,
0.2544748, -0.9712112, 3.260328, 1, 1, 1, 1, 1,
0.2550459, 0.9327953, -1.138822, 1, 1, 1, 1, 1,
0.2579107, -0.3203851, 2.930641, 1, 1, 1, 1, 1,
0.2616234, 1.048122, 1.004915, 1, 1, 1, 1, 1,
0.2632724, -1.063198, 3.505372, 1, 1, 1, 1, 1,
0.2641865, -0.2142527, 1.57187, 1, 1, 1, 1, 1,
0.265273, -1.231341, 2.937275, 1, 1, 1, 1, 1,
0.2657657, 0.2550483, 2.661365, 1, 1, 1, 1, 1,
0.2677857, -1.076123, 2.835162, 1, 1, 1, 1, 1,
0.2759605, -0.1373758, 0.8930352, 1, 1, 1, 1, 1,
0.2767604, 0.6662695, 1.766618, 1, 1, 1, 1, 1,
0.2772425, -0.001740945, 1.16544, 1, 1, 1, 1, 1,
0.2817173, -1.145279, 3.926161, 1, 1, 1, 1, 1,
0.2828287, 2.061526, 1.919427, 0, 0, 1, 1, 1,
0.2846478, 0.490546, 0.4349632, 1, 0, 0, 1, 1,
0.2928803, 1.052854, 0.5282181, 1, 0, 0, 1, 1,
0.2934113, -1.867292, 2.518544, 1, 0, 0, 1, 1,
0.2959994, -1.32698, 2.149282, 1, 0, 0, 1, 1,
0.2987482, -0.2665972, 2.849934, 1, 0, 0, 1, 1,
0.3043005, -0.4659334, 3.762099, 0, 0, 0, 1, 1,
0.3081917, -0.4954305, 3.52116, 0, 0, 0, 1, 1,
0.3082259, -0.6089833, 3.41156, 0, 0, 0, 1, 1,
0.3172621, 0.2350091, 2.770718, 0, 0, 0, 1, 1,
0.3177849, -0.2932425, 3.486994, 0, 0, 0, 1, 1,
0.3178496, 0.4359377, 1.928317, 0, 0, 0, 1, 1,
0.318027, 0.1142454, -0.1932666, 0, 0, 0, 1, 1,
0.3217944, 2.301147, 0.2669462, 1, 1, 1, 1, 1,
0.3235407, 0.5975596, -0.06890783, 1, 1, 1, 1, 1,
0.3246202, -1.349491, 3.73277, 1, 1, 1, 1, 1,
0.3256085, -1.87169, 3.385377, 1, 1, 1, 1, 1,
0.3265314, -3.528731, 1.932177, 1, 1, 1, 1, 1,
0.3293098, 1.127081, 0.9304671, 1, 1, 1, 1, 1,
0.3328889, 1.647643, -1.730975, 1, 1, 1, 1, 1,
0.338934, -0.4878165, 2.954243, 1, 1, 1, 1, 1,
0.3451173, -1.140643, 6.132619, 1, 1, 1, 1, 1,
0.3489457, 0.1858533, 0.9569384, 1, 1, 1, 1, 1,
0.3535606, -0.9419758, 0.9906856, 1, 1, 1, 1, 1,
0.3591544, 0.4967344, 1.415238, 1, 1, 1, 1, 1,
0.3744215, -0.1970895, 3.534878, 1, 1, 1, 1, 1,
0.37641, 0.0784684, -0.3026718, 1, 1, 1, 1, 1,
0.3771884, 0.6522564, 1.935801, 1, 1, 1, 1, 1,
0.3786319, -1.023449, 3.612543, 0, 0, 1, 1, 1,
0.3809263, -1.440325, 3.162494, 1, 0, 0, 1, 1,
0.3867127, -0.01073146, 1.079756, 1, 0, 0, 1, 1,
0.3927585, 0.1619367, 3.631735, 1, 0, 0, 1, 1,
0.3938265, 0.9554347, 1.034894, 1, 0, 0, 1, 1,
0.3945808, -1.283579, 2.780019, 1, 0, 0, 1, 1,
0.3972149, -0.02567301, 2.43703, 0, 0, 0, 1, 1,
0.3972307, 1.191375, 0.1589729, 0, 0, 0, 1, 1,
0.4047046, 1.298963, 2.133349, 0, 0, 0, 1, 1,
0.4091917, 0.5157803, 0.2057917, 0, 0, 0, 1, 1,
0.4092273, 1.679728, -0.1144576, 0, 0, 0, 1, 1,
0.4123127, -0.3813093, 1.772757, 0, 0, 0, 1, 1,
0.423886, -0.2403562, 0.6259292, 0, 0, 0, 1, 1,
0.4260342, -0.7509799, 2.547101, 1, 1, 1, 1, 1,
0.431466, 0.3097748, 0.1827771, 1, 1, 1, 1, 1,
0.4332559, 1.099617, 1.091863, 1, 1, 1, 1, 1,
0.4366936, -0.6335576, 2.553157, 1, 1, 1, 1, 1,
0.4440659, 0.3408202, 2.491746, 1, 1, 1, 1, 1,
0.4447083, 1.101208, -0.2049099, 1, 1, 1, 1, 1,
0.4459288, 0.1907723, 1.239263, 1, 1, 1, 1, 1,
0.4481036, 1.823016, 0.06929701, 1, 1, 1, 1, 1,
0.4540212, 1.353654, -1.641312, 1, 1, 1, 1, 1,
0.4557335, -0.1459099, 1.115503, 1, 1, 1, 1, 1,
0.4584014, -0.4848879, 2.184995, 1, 1, 1, 1, 1,
0.4598356, 0.4637492, -0.3101254, 1, 1, 1, 1, 1,
0.4625094, -0.7049541, 2.726156, 1, 1, 1, 1, 1,
0.4642564, -1.135364, 2.185404, 1, 1, 1, 1, 1,
0.4664755, 0.3253567, 1.969749, 1, 1, 1, 1, 1,
0.4700188, 0.9788429, -1.013334, 0, 0, 1, 1, 1,
0.4725232, 0.3730649, -0.5052282, 1, 0, 0, 1, 1,
0.4790784, 0.1900246, -0.5247844, 1, 0, 0, 1, 1,
0.47931, -0.7829891, 3.919165, 1, 0, 0, 1, 1,
0.4823741, -0.4583761, 3.713156, 1, 0, 0, 1, 1,
0.4827179, 0.2067356, 0.341992, 1, 0, 0, 1, 1,
0.4829073, 0.4732995, 1.243773, 0, 0, 0, 1, 1,
0.4830577, 0.271839, 2.501309, 0, 0, 0, 1, 1,
0.4833241, -1.796553, 1.863347, 0, 0, 0, 1, 1,
0.4867005, 0.3340884, 0.4346215, 0, 0, 0, 1, 1,
0.4877568, -2.210343, 2.250227, 0, 0, 0, 1, 1,
0.4880839, 0.7516816, 0.09947068, 0, 0, 0, 1, 1,
0.4882697, 1.537963, -0.4945402, 0, 0, 0, 1, 1,
0.48833, -1.036876, 0.6490518, 1, 1, 1, 1, 1,
0.4912349, 0.5336236, 1.211276, 1, 1, 1, 1, 1,
0.4934313, -0.1821923, 1.754298, 1, 1, 1, 1, 1,
0.4966516, -1.362125, 2.820405, 1, 1, 1, 1, 1,
0.4983775, -0.6262729, 2.535853, 1, 1, 1, 1, 1,
0.4993924, 0.06364024, 1.763699, 1, 1, 1, 1, 1,
0.4995414, -0.5720565, 1.752402, 1, 1, 1, 1, 1,
0.5033256, 1.841217, -0.2670923, 1, 1, 1, 1, 1,
0.5077759, -0.01388196, 0.8319997, 1, 1, 1, 1, 1,
0.5119004, -0.8399343, 2.067235, 1, 1, 1, 1, 1,
0.513558, -0.3468228, 1.501716, 1, 1, 1, 1, 1,
0.5145872, 0.8531295, 1.964135, 1, 1, 1, 1, 1,
0.5161716, -0.5183869, 2.539505, 1, 1, 1, 1, 1,
0.5162907, 0.5574608, 0.1157403, 1, 1, 1, 1, 1,
0.5172332, 0.7438269, 0.8608671, 1, 1, 1, 1, 1,
0.5189125, -0.7022741, 2.973869, 0, 0, 1, 1, 1,
0.519908, 2.320109, 0.8425624, 1, 0, 0, 1, 1,
0.5219852, 0.9997123, 0.505559, 1, 0, 0, 1, 1,
0.5245913, -0.3103719, 3.226746, 1, 0, 0, 1, 1,
0.5259338, -0.3013285, 3.594833, 1, 0, 0, 1, 1,
0.5303441, 0.9099018, 1.545208, 1, 0, 0, 1, 1,
0.5313683, 0.6623228, 0.1986189, 0, 0, 0, 1, 1,
0.5321567, 0.9597183, 0.588296, 0, 0, 0, 1, 1,
0.5325878, 0.8188922, -0.04161181, 0, 0, 0, 1, 1,
0.5331845, 1.796388, -0.2364032, 0, 0, 0, 1, 1,
0.5340466, 1.308011, -1.087701, 0, 0, 0, 1, 1,
0.5342472, -0.4087729, 1.926956, 0, 0, 0, 1, 1,
0.5461724, 0.6257626, 1.224639, 0, 0, 0, 1, 1,
0.5464256, 0.8705413, 0.6917393, 1, 1, 1, 1, 1,
0.5472916, -0.3154184, 1.833397, 1, 1, 1, 1, 1,
0.5502921, -1.043182, 0.8864304, 1, 1, 1, 1, 1,
0.5535412, 0.02258852, -0.1074737, 1, 1, 1, 1, 1,
0.5539058, -1.441324, 2.104682, 1, 1, 1, 1, 1,
0.5547588, 0.8269023, 0.1538766, 1, 1, 1, 1, 1,
0.5624003, -0.6031311, 2.171658, 1, 1, 1, 1, 1,
0.5649563, 1.158396, -0.07652155, 1, 1, 1, 1, 1,
0.5680328, -0.6820849, 1.098573, 1, 1, 1, 1, 1,
0.5748101, -2.102312, 4.090504, 1, 1, 1, 1, 1,
0.5801339, 0.2401397, -0.1702321, 1, 1, 1, 1, 1,
0.5824666, -0.1990133, 2.644195, 1, 1, 1, 1, 1,
0.5856656, 0.258487, 2.283283, 1, 1, 1, 1, 1,
0.5879588, 0.4833468, 0.5163151, 1, 1, 1, 1, 1,
0.5992135, 0.1299581, 2.660277, 1, 1, 1, 1, 1,
0.5998605, 0.501978, 0.9797255, 0, 0, 1, 1, 1,
0.5998755, -0.9682869, 3.383323, 1, 0, 0, 1, 1,
0.6094924, -0.9207726, 2.659014, 1, 0, 0, 1, 1,
0.6175378, -0.6741508, 1.9335, 1, 0, 0, 1, 1,
0.6222844, 1.628095, 0.9734164, 1, 0, 0, 1, 1,
0.628723, -0.03085447, 1.815173, 1, 0, 0, 1, 1,
0.6305276, 0.5301622, 0.9060129, 0, 0, 0, 1, 1,
0.6320483, 0.9569923, 0.3281808, 0, 0, 0, 1, 1,
0.6327743, 0.1951462, 0.8826094, 0, 0, 0, 1, 1,
0.6365375, -0.5189285, 3.275977, 0, 0, 0, 1, 1,
0.6371462, -0.7415489, 2.114632, 0, 0, 0, 1, 1,
0.6396174, 0.2254498, 1.943627, 0, 0, 0, 1, 1,
0.6475736, 0.5862843, 0.8735423, 0, 0, 0, 1, 1,
0.6520818, 0.3097255, 0.05205736, 1, 1, 1, 1, 1,
0.6527729, -1.531952, 2.897134, 1, 1, 1, 1, 1,
0.6548917, 0.2255212, 1.339986, 1, 1, 1, 1, 1,
0.6559408, 2.188797, 0.286759, 1, 1, 1, 1, 1,
0.6569443, -0.914376, 2.367628, 1, 1, 1, 1, 1,
0.6584644, 1.064979, -0.3048189, 1, 1, 1, 1, 1,
0.6640997, 1.486937, -0.2101011, 1, 1, 1, 1, 1,
0.6701438, -1.419373, 4.575808, 1, 1, 1, 1, 1,
0.6763366, -0.4140337, 2.889796, 1, 1, 1, 1, 1,
0.682402, -1.412152, 3.027115, 1, 1, 1, 1, 1,
0.6825228, 0.559716, -0.06817252, 1, 1, 1, 1, 1,
0.6826705, -0.2850528, 2.034409, 1, 1, 1, 1, 1,
0.6868148, 0.8939971, 0.2862319, 1, 1, 1, 1, 1,
0.6878093, -0.9603978, 1.779987, 1, 1, 1, 1, 1,
0.6914647, -2.119648, 3.423521, 1, 1, 1, 1, 1,
0.6916604, -0.3691311, 3.914355, 0, 0, 1, 1, 1,
0.6920812, -0.5734224, 2.20453, 1, 0, 0, 1, 1,
0.6929572, -0.3446528, 1.532314, 1, 0, 0, 1, 1,
0.6971658, -0.8878807, 2.579646, 1, 0, 0, 1, 1,
0.6992887, -1.926954, 2.44221, 1, 0, 0, 1, 1,
0.6994503, -0.1751097, 0.5525022, 1, 0, 0, 1, 1,
0.7003968, 0.563063, 0.05785555, 0, 0, 0, 1, 1,
0.7009286, -0.981764, 1.915691, 0, 0, 0, 1, 1,
0.7020949, 2.551198, 1.41413, 0, 0, 0, 1, 1,
0.7040228, 0.3209642, 2.575225, 0, 0, 0, 1, 1,
0.7044493, -0.7331634, 1.280535, 0, 0, 0, 1, 1,
0.7166379, 0.06541255, 3.536296, 0, 0, 0, 1, 1,
0.7187677, -1.669129, 3.046518, 0, 0, 0, 1, 1,
0.7215684, 0.8697014, 1.14494, 1, 1, 1, 1, 1,
0.7251959, -0.3270134, 3.228832, 1, 1, 1, 1, 1,
0.7303337, 1.545208, -1.340929, 1, 1, 1, 1, 1,
0.7306713, 1.00593, 1.358543, 1, 1, 1, 1, 1,
0.733609, -0.2301995, 1.220868, 1, 1, 1, 1, 1,
0.7363108, 1.487678, 0.7209423, 1, 1, 1, 1, 1,
0.740536, -1.029278, 2.514888, 1, 1, 1, 1, 1,
0.7454121, 0.539367, 1.379536, 1, 1, 1, 1, 1,
0.7466201, -0.1467803, 1.380264, 1, 1, 1, 1, 1,
0.74915, 2.091439, -1.158237, 1, 1, 1, 1, 1,
0.7542721, -2.073252, 2.757963, 1, 1, 1, 1, 1,
0.7616645, -1.363689, 5.198994, 1, 1, 1, 1, 1,
0.7646619, -1.482455, 3.183022, 1, 1, 1, 1, 1,
0.7658508, 1.723201, 1.33458, 1, 1, 1, 1, 1,
0.7701363, -1.424499, 2.992553, 1, 1, 1, 1, 1,
0.7741321, -0.3112006, 0.9320543, 0, 0, 1, 1, 1,
0.7762603, 1.010291, 0.3191528, 1, 0, 0, 1, 1,
0.7764004, -1.155061, 3.018949, 1, 0, 0, 1, 1,
0.7904107, 0.7353643, -0.1308136, 1, 0, 0, 1, 1,
0.7907447, 0.2930589, 1.892906, 1, 0, 0, 1, 1,
0.7911885, 1.741821, 1.627939, 1, 0, 0, 1, 1,
0.7971404, -0.5450567, 2.516705, 0, 0, 0, 1, 1,
0.8027402, 1.138297, 1.301928, 0, 0, 0, 1, 1,
0.8047514, 0.7183157, 0.9947734, 0, 0, 0, 1, 1,
0.8071751, 0.06662424, 2.5969, 0, 0, 0, 1, 1,
0.807416, -1.089827, 1.282669, 0, 0, 0, 1, 1,
0.81093, 0.6772572, 1.441593, 0, 0, 0, 1, 1,
0.8148506, 0.379692, 0.3675751, 0, 0, 0, 1, 1,
0.8171132, -0.134712, 2.647642, 1, 1, 1, 1, 1,
0.8178697, 1.571458, 1.154694, 1, 1, 1, 1, 1,
0.8190597, 0.5158973, 2.182457, 1, 1, 1, 1, 1,
0.8196899, 0.6179975, 0.9929497, 1, 1, 1, 1, 1,
0.8204629, -2.369698, 3.2779, 1, 1, 1, 1, 1,
0.8211726, -1.098385, 2.799745, 1, 1, 1, 1, 1,
0.825171, 1.822824, -0.3572706, 1, 1, 1, 1, 1,
0.8275073, 0.3954218, 2.194771, 1, 1, 1, 1, 1,
0.8290215, 0.3681722, 1.911294, 1, 1, 1, 1, 1,
0.8306964, -0.04536806, 2.424943, 1, 1, 1, 1, 1,
0.8375462, 1.401898, 2.008907, 1, 1, 1, 1, 1,
0.8416293, 1.639997, 0.8229522, 1, 1, 1, 1, 1,
0.8432118, 0.8119833, -0.5993745, 1, 1, 1, 1, 1,
0.8451074, -0.2802678, 1.840216, 1, 1, 1, 1, 1,
0.8580833, 0.90273, -1.190113, 1, 1, 1, 1, 1,
0.8590313, 0.1899358, 0.2231134, 0, 0, 1, 1, 1,
0.8752464, 0.2475818, 1.551866, 1, 0, 0, 1, 1,
0.8786985, -0.9657603, 2.535181, 1, 0, 0, 1, 1,
0.8793573, 0.493174, -0.3069298, 1, 0, 0, 1, 1,
0.8863925, -0.4753461, 2.372434, 1, 0, 0, 1, 1,
0.8865128, -0.006930123, 1.443855, 1, 0, 0, 1, 1,
0.8865809, 0.9146307, -0.01413251, 0, 0, 0, 1, 1,
0.8909731, 1.043591, 0.2044165, 0, 0, 0, 1, 1,
0.8923996, -0.6748567, 3.331423, 0, 0, 0, 1, 1,
0.9006727, 0.7456078, 1.841814, 0, 0, 0, 1, 1,
0.9086998, 0.4401927, 1.652324, 0, 0, 0, 1, 1,
0.9141749, 0.4704255, 1.589136, 0, 0, 0, 1, 1,
0.9145759, -0.5331442, 2.05085, 0, 0, 0, 1, 1,
0.9167426, 2.730567, 0.04176305, 1, 1, 1, 1, 1,
0.9188346, 1.876477, 2.102577, 1, 1, 1, 1, 1,
0.9216689, 0.2152591, 1.502126, 1, 1, 1, 1, 1,
0.922677, 0.06358375, 1.106233, 1, 1, 1, 1, 1,
0.925987, -0.5282584, 1.459809, 1, 1, 1, 1, 1,
0.9297579, -0.09895818, 2.801666, 1, 1, 1, 1, 1,
0.9310336, 1.701822, 1.760994, 1, 1, 1, 1, 1,
0.9326854, 0.1407581, 1.689647, 1, 1, 1, 1, 1,
0.9340262, -0.4493073, 3.3898, 1, 1, 1, 1, 1,
0.9362903, -0.3091123, 0.8156013, 1, 1, 1, 1, 1,
0.9427648, 0.1841503, 1.587807, 1, 1, 1, 1, 1,
0.9428194, -0.0425004, 3.421661, 1, 1, 1, 1, 1,
0.9437717, -0.5977085, 2.16029, 1, 1, 1, 1, 1,
0.9447021, -1.382285, 2.41977, 1, 1, 1, 1, 1,
0.9510365, 0.1158688, 1.442376, 1, 1, 1, 1, 1,
0.9538361, -1.318376, 3.133246, 0, 0, 1, 1, 1,
0.9605021, 1.870318, 0.3359096, 1, 0, 0, 1, 1,
0.9609162, 0.9013377, -0.8322824, 1, 0, 0, 1, 1,
0.9613826, -0.9623065, 0.9725062, 1, 0, 0, 1, 1,
0.9643431, -0.459435, 2.544462, 1, 0, 0, 1, 1,
0.9645327, 1.321323, 1.104733, 1, 0, 0, 1, 1,
0.9667751, 0.4437678, -0.5700715, 0, 0, 0, 1, 1,
0.9832821, -0.6894944, 4.228457, 0, 0, 0, 1, 1,
0.9875539, -0.2565796, 0.6648907, 0, 0, 0, 1, 1,
0.9886433, -1.804382, 3.076165, 0, 0, 0, 1, 1,
0.9893789, -1.385504, 2.100414, 0, 0, 0, 1, 1,
0.9925836, -1.403628, 1.647163, 0, 0, 0, 1, 1,
0.9930111, -0.8088557, 3.747078, 0, 0, 0, 1, 1,
0.99716, -0.5334305, 1.538689, 1, 1, 1, 1, 1,
1.000414, -0.8363452, 3.190304, 1, 1, 1, 1, 1,
1.011103, 0.2461588, -0.5886476, 1, 1, 1, 1, 1,
1.016042, 0.4786579, 1.750308, 1, 1, 1, 1, 1,
1.016788, 0.4801986, 0.8807784, 1, 1, 1, 1, 1,
1.017806, 0.4713784, 1.250273, 1, 1, 1, 1, 1,
1.022276, -1.361931, 2.372027, 1, 1, 1, 1, 1,
1.022944, -1.97025, 3.427524, 1, 1, 1, 1, 1,
1.024446, 1.23319, -0.4962029, 1, 1, 1, 1, 1,
1.027984, 0.1157782, 0.7368092, 1, 1, 1, 1, 1,
1.029724, 0.5641952, -0.5212339, 1, 1, 1, 1, 1,
1.031463, -0.1894485, 1.15741, 1, 1, 1, 1, 1,
1.03162, 0.8320343, -0.0808912, 1, 1, 1, 1, 1,
1.035657, -0.06942511, 0.8302926, 1, 1, 1, 1, 1,
1.038117, 0.7149472, 1.788515, 1, 1, 1, 1, 1,
1.041206, -1.158677, 1.604436, 0, 0, 1, 1, 1,
1.04517, 1.631533, 2.11312, 1, 0, 0, 1, 1,
1.052524, -1.267914, 1.888537, 1, 0, 0, 1, 1,
1.058085, -0.1000946, 1.258243, 1, 0, 0, 1, 1,
1.060397, 1.047735, 0.3004142, 1, 0, 0, 1, 1,
1.067685, -0.9069951, 2.952214, 1, 0, 0, 1, 1,
1.076384, 0.1773751, 0.3090741, 0, 0, 0, 1, 1,
1.077918, 0.9843252, 2.161081, 0, 0, 0, 1, 1,
1.083967, -0.9296689, 2.087123, 0, 0, 0, 1, 1,
1.08599, -0.4222691, 1.894331, 0, 0, 0, 1, 1,
1.096671, 1.158013, 0.1593331, 0, 0, 0, 1, 1,
1.100422, -0.05872447, 1.64784, 0, 0, 0, 1, 1,
1.103424, -0.1272432, 2.167721, 0, 0, 0, 1, 1,
1.108019, -1.892574, 2.109509, 1, 1, 1, 1, 1,
1.109232, 1.289591, -0.1057651, 1, 1, 1, 1, 1,
1.115573, 0.1985034, 2.848281, 1, 1, 1, 1, 1,
1.115586, -0.8610459, 1.93479, 1, 1, 1, 1, 1,
1.119797, -0.6406336, 2.840029, 1, 1, 1, 1, 1,
1.124777, 0.6009625, -0.6238976, 1, 1, 1, 1, 1,
1.126802, -0.7644782, 3.207145, 1, 1, 1, 1, 1,
1.132773, 0.3590657, -1.846344, 1, 1, 1, 1, 1,
1.135185, 1.006037, 1.88104, 1, 1, 1, 1, 1,
1.137668, -0.1459148, 3.872813, 1, 1, 1, 1, 1,
1.144277, 0.6031815, 0.3871431, 1, 1, 1, 1, 1,
1.156833, 0.04785729, 2.519207, 1, 1, 1, 1, 1,
1.175224, 0.09563122, 0.612438, 1, 1, 1, 1, 1,
1.181787, -0.456537, 0.3507257, 1, 1, 1, 1, 1,
1.18618, -0.9078368, 1.673836, 1, 1, 1, 1, 1,
1.190095, 1.192061, 1.907381, 0, 0, 1, 1, 1,
1.190656, 0.2234126, 0.9407342, 1, 0, 0, 1, 1,
1.202934, 0.008987608, 0.8304151, 1, 0, 0, 1, 1,
1.204093, -0.3848929, 1.907786, 1, 0, 0, 1, 1,
1.205002, -0.5570235, 3.341806, 1, 0, 0, 1, 1,
1.205386, -0.01113776, 1.694724, 1, 0, 0, 1, 1,
1.211259, -0.6926765, 2.91713, 0, 0, 0, 1, 1,
1.213768, -1.038501, 2.569739, 0, 0, 0, 1, 1,
1.215356, 0.2623061, -0.783451, 0, 0, 0, 1, 1,
1.218233, -0.007423847, 1.847722, 0, 0, 0, 1, 1,
1.226044, 0.3024245, 1.966117, 0, 0, 0, 1, 1,
1.22967, -0.9188933, 2.593588, 0, 0, 0, 1, 1,
1.231513, 1.756876, -0.6886975, 0, 0, 0, 1, 1,
1.232585, -0.2743465, 1.479124, 1, 1, 1, 1, 1,
1.233176, -0.463323, 3.426135, 1, 1, 1, 1, 1,
1.234371, -0.5413924, 3.577786, 1, 1, 1, 1, 1,
1.239316, 0.02238266, 1.787168, 1, 1, 1, 1, 1,
1.246136, 0.7814418, 1.242228, 1, 1, 1, 1, 1,
1.246509, -0.4040998, 2.72225, 1, 1, 1, 1, 1,
1.258062, 0.8368198, 1.069438, 1, 1, 1, 1, 1,
1.259629, 0.8348233, -0.4788799, 1, 1, 1, 1, 1,
1.264269, -0.1933021, 2.555579, 1, 1, 1, 1, 1,
1.267625, -0.6679288, -0.2646615, 1, 1, 1, 1, 1,
1.27532, 0.3339099, 0.9928387, 1, 1, 1, 1, 1,
1.28545, -0.6448051, 1.902647, 1, 1, 1, 1, 1,
1.287434, 0.3117954, 1.387958, 1, 1, 1, 1, 1,
1.2999, -0.9546482, 2.220908, 1, 1, 1, 1, 1,
1.301871, 1.220297, -0.9026455, 1, 1, 1, 1, 1,
1.302091, 0.3862698, 3.538776, 0, 0, 1, 1, 1,
1.30958, -0.8480127, 3.073563, 1, 0, 0, 1, 1,
1.312979, -1.775034, 2.306113, 1, 0, 0, 1, 1,
1.321536, 0.3649026, 1.746938, 1, 0, 0, 1, 1,
1.332495, -1.017352, 2.105451, 1, 0, 0, 1, 1,
1.34158, -0.07690673, 2.783093, 1, 0, 0, 1, 1,
1.348905, -0.1541303, 2.32037, 0, 0, 0, 1, 1,
1.35295, -0.1688305, 1.636198, 0, 0, 0, 1, 1,
1.362737, 0.2391609, 0.4245804, 0, 0, 0, 1, 1,
1.3713, -0.2073527, 1.903055, 0, 0, 0, 1, 1,
1.372779, -0.7169433, 2.488937, 0, 0, 0, 1, 1,
1.383354, -0.4781879, 1.44437, 0, 0, 0, 1, 1,
1.391696, 1.69004, 2.264683, 0, 0, 0, 1, 1,
1.41264, -1.035043, 1.626488, 1, 1, 1, 1, 1,
1.413445, 0.6569459, -0.9691235, 1, 1, 1, 1, 1,
1.418837, -0.05471108, 1.671395, 1, 1, 1, 1, 1,
1.42058, 0.4916561, -0.2554791, 1, 1, 1, 1, 1,
1.428771, 0.772493, 1.307554, 1, 1, 1, 1, 1,
1.435679, 0.9787445, -0.03300342, 1, 1, 1, 1, 1,
1.440158, -0.1593895, 2.326298, 1, 1, 1, 1, 1,
1.441661, -0.2781217, 3.39594, 1, 1, 1, 1, 1,
1.445117, -1.737192, 3.891177, 1, 1, 1, 1, 1,
1.451687, -1.567815, 4.050074, 1, 1, 1, 1, 1,
1.453259, -0.5181797, 2.666156, 1, 1, 1, 1, 1,
1.455798, -0.9923235, 3.04819, 1, 1, 1, 1, 1,
1.463297, 0.9797408, 0.7417719, 1, 1, 1, 1, 1,
1.49355, -0.1241545, 0.9627784, 1, 1, 1, 1, 1,
1.503396, 0.2086866, 0.1140964, 1, 1, 1, 1, 1,
1.526492, -0.3137464, -0.806823, 0, 0, 1, 1, 1,
1.530699, -0.3683684, 1.362271, 1, 0, 0, 1, 1,
1.5329, 0.03745286, 1.254494, 1, 0, 0, 1, 1,
1.549801, 0.2643546, 1.428565, 1, 0, 0, 1, 1,
1.558471, -1.116373, 2.635228, 1, 0, 0, 1, 1,
1.575989, -0.6782671, 3.247981, 1, 0, 0, 1, 1,
1.610661, 0.5125053, 2.585751, 0, 0, 0, 1, 1,
1.614786, -1.487739, 1.088716, 0, 0, 0, 1, 1,
1.62866, 0.9737934, 2.584781, 0, 0, 0, 1, 1,
1.634776, -1.495594, 0.7160845, 0, 0, 0, 1, 1,
1.638271, 1.143917, 0.802951, 0, 0, 0, 1, 1,
1.681641, 0.05651769, 1.940539, 0, 0, 0, 1, 1,
1.707173, 0.3834535, 0.8773125, 0, 0, 0, 1, 1,
1.718969, -0.4271246, 2.659385, 1, 1, 1, 1, 1,
1.744405, -0.1590608, 2.866874, 1, 1, 1, 1, 1,
1.759243, 0.4206518, 0.3148149, 1, 1, 1, 1, 1,
1.763228, -0.3742086, 2.504875, 1, 1, 1, 1, 1,
1.776605, -1.495129, 4.196115, 1, 1, 1, 1, 1,
1.782961, -1.809345, 0.846619, 1, 1, 1, 1, 1,
1.788767, -0.5170524, 1.559602, 1, 1, 1, 1, 1,
1.796077, -0.6256045, 1.966567, 1, 1, 1, 1, 1,
1.845121, -1.004913, 2.952673, 1, 1, 1, 1, 1,
1.867449, -0.3475178, 1.614895, 1, 1, 1, 1, 1,
1.873932, 0.9242161, 0.7184487, 1, 1, 1, 1, 1,
1.875093, 0.9453207, 2.580186, 1, 1, 1, 1, 1,
1.87524, 0.5348142, 2.203182, 1, 1, 1, 1, 1,
1.898534, -0.578528, 2.433823, 1, 1, 1, 1, 1,
1.913683, -1.624982, 2.206974, 1, 1, 1, 1, 1,
1.934782, -0.5290698, 0.9543623, 0, 0, 1, 1, 1,
1.98844, 2.467973, 1.005267, 1, 0, 0, 1, 1,
2.002914, -0.3177524, 2.879286, 1, 0, 0, 1, 1,
2.004663, -1.806244, 2.38686, 1, 0, 0, 1, 1,
2.006073, 0.4575104, 0.6667199, 1, 0, 0, 1, 1,
2.027165, -0.3953857, 3.731606, 1, 0, 0, 1, 1,
2.074796, -0.1054348, 1.597934, 0, 0, 0, 1, 1,
2.119345, 1.553818, 0.5005367, 0, 0, 0, 1, 1,
2.226906, 0.7207594, 3.188002, 0, 0, 0, 1, 1,
2.241868, -1.006648, 1.655892, 0, 0, 0, 1, 1,
2.258029, -0.191655, 3.412314, 0, 0, 0, 1, 1,
2.319001, -0.2917319, 0.8700113, 0, 0, 0, 1, 1,
2.320799, 0.4314665, 2.206675, 0, 0, 0, 1, 1,
2.36295, 0.5022407, 0.1192146, 1, 1, 1, 1, 1,
2.365711, -0.5264375, 2.248878, 1, 1, 1, 1, 1,
2.426289, -0.5190057, 2.0902, 1, 1, 1, 1, 1,
2.664151, -0.6070275, 3.713763, 1, 1, 1, 1, 1,
2.724684, 0.515734, 1.877308, 1, 1, 1, 1, 1,
2.793298, 1.094517, 1.945837, 1, 1, 1, 1, 1,
2.819425, 0.147929, 1.852365, 1, 1, 1, 1, 1
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
var radius = 10.06321;
var distance = 35.3466;
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
mvMatrix.translate( 0.3780183, 0.1195793, -0.3037384 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.3466);
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
