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
-3.442321, 0.2294754, -1.23136, 1, 0, 0, 1,
-3.209337, -0.2939504, -2.026459, 1, 0.007843138, 0, 1,
-3.14361, -2.010616, 0.193464, 1, 0.01176471, 0, 1,
-2.967749, 0.1307427, -1.879581, 1, 0.01960784, 0, 1,
-2.880183, -1.101221, -2.547631, 1, 0.02352941, 0, 1,
-2.743262, -1.163973, -4.263871, 1, 0.03137255, 0, 1,
-2.729281, -0.3246939, 1.072757, 1, 0.03529412, 0, 1,
-2.672282, 0.2213162, -2.07947, 1, 0.04313726, 0, 1,
-2.609717, 0.7902618, -2.020725, 1, 0.04705882, 0, 1,
-2.605208, 0.01646702, -2.30701, 1, 0.05490196, 0, 1,
-2.583632, 0.4441209, 0.144685, 1, 0.05882353, 0, 1,
-2.565939, 1.870084, 1.717224, 1, 0.06666667, 0, 1,
-2.519769, 1.452779, -1.641956, 1, 0.07058824, 0, 1,
-2.504705, 0.06329944, -3.142403, 1, 0.07843138, 0, 1,
-2.471271, -0.7609205, -3.58743, 1, 0.08235294, 0, 1,
-2.451049, -1.172709, -2.665842, 1, 0.09019608, 0, 1,
-2.414129, -0.4036944, -1.762331, 1, 0.09411765, 0, 1,
-2.397359, -0.9275367, -1.596012, 1, 0.1019608, 0, 1,
-2.38871, -0.04274068, -0.3781986, 1, 0.1098039, 0, 1,
-2.380291, 1.35896, -1.354018, 1, 0.1137255, 0, 1,
-2.36194, -1.768934, -2.662305, 1, 0.1215686, 0, 1,
-2.320333, 1.144908, -1.943813, 1, 0.1254902, 0, 1,
-2.295477, -0.9152011, -1.294742, 1, 0.1333333, 0, 1,
-2.251305, 0.3432829, -0.1274146, 1, 0.1372549, 0, 1,
-2.193981, -0.4176006, -1.84764, 1, 0.145098, 0, 1,
-2.156382, -0.2357123, -0.3714995, 1, 0.1490196, 0, 1,
-2.153207, -0.8734433, -1.410834, 1, 0.1568628, 0, 1,
-2.145797, 0.3476656, -2.029778, 1, 0.1607843, 0, 1,
-2.140754, -0.0322172, -2.550076, 1, 0.1686275, 0, 1,
-2.118679, -0.5257176, -1.067347, 1, 0.172549, 0, 1,
-2.072994, 0.3621004, -3.022074, 1, 0.1803922, 0, 1,
-2.06851, -0.7572546, -1.656938, 1, 0.1843137, 0, 1,
-2.051172, -0.04689473, -0.2184184, 1, 0.1921569, 0, 1,
-2.044761, -0.05552643, -3.224204, 1, 0.1960784, 0, 1,
-2.039125, 1.254268, -1.347068, 1, 0.2039216, 0, 1,
-2.038934, 2.042781, -0.7071549, 1, 0.2117647, 0, 1,
-2.028837, 0.2306813, -0.02108054, 1, 0.2156863, 0, 1,
-2.017886, -1.195877, -2.653106, 1, 0.2235294, 0, 1,
-2.013849, 0.00111883, -0.2368335, 1, 0.227451, 0, 1,
-1.99387, 0.9403703, -1.054673, 1, 0.2352941, 0, 1,
-1.948085, -0.4649695, -1.448577, 1, 0.2392157, 0, 1,
-1.946487, 0.5529903, -1.557582, 1, 0.2470588, 0, 1,
-1.945966, -0.008494408, -0.6424438, 1, 0.2509804, 0, 1,
-1.924999, 0.3647763, -2.528249, 1, 0.2588235, 0, 1,
-1.919648, 0.6528934, -2.074238, 1, 0.2627451, 0, 1,
-1.905741, 0.06976777, -1.713402, 1, 0.2705882, 0, 1,
-1.904262, -1.094072, -1.715047, 1, 0.2745098, 0, 1,
-1.874755, 0.4981779, -0.279552, 1, 0.282353, 0, 1,
-1.864194, 1.070187, -1.000727, 1, 0.2862745, 0, 1,
-1.842247, -0.6603419, -2.777258, 1, 0.2941177, 0, 1,
-1.806247, -0.6272529, -2.704483, 1, 0.3019608, 0, 1,
-1.80581, -1.84624, -1.907433, 1, 0.3058824, 0, 1,
-1.799713, -1.87216, -3.011907, 1, 0.3137255, 0, 1,
-1.7905, -0.1413366, -2.6978, 1, 0.3176471, 0, 1,
-1.770055, 0.2359056, -1.679692, 1, 0.3254902, 0, 1,
-1.765515, 1.583, 0.0342738, 1, 0.3294118, 0, 1,
-1.761703, 0.09480777, -0.09705184, 1, 0.3372549, 0, 1,
-1.75983, 0.3991196, -1.357209, 1, 0.3411765, 0, 1,
-1.747301, -0.4703747, -3.521755, 1, 0.3490196, 0, 1,
-1.727433, -0.6095027, -2.84413, 1, 0.3529412, 0, 1,
-1.719535, -1.328529, -2.808363, 1, 0.3607843, 0, 1,
-1.699202, 0.02642243, -0.8631933, 1, 0.3647059, 0, 1,
-1.697855, 0.1114683, -1.855146, 1, 0.372549, 0, 1,
-1.692531, -0.6455626, -1.683233, 1, 0.3764706, 0, 1,
-1.675043, 0.02321068, -3.854384, 1, 0.3843137, 0, 1,
-1.668626, 1.072276, -0.4598082, 1, 0.3882353, 0, 1,
-1.648375, -0.2147906, -1.801014, 1, 0.3960784, 0, 1,
-1.634237, 3.042308, -0.912152, 1, 0.4039216, 0, 1,
-1.627052, -0.1277984, -2.575792, 1, 0.4078431, 0, 1,
-1.609679, 1.382338, 0.6012368, 1, 0.4156863, 0, 1,
-1.605478, -0.439858, -1.884964, 1, 0.4196078, 0, 1,
-1.602284, -0.403401, -1.605747, 1, 0.427451, 0, 1,
-1.57863, 1.602013, -0.4785186, 1, 0.4313726, 0, 1,
-1.578287, 0.01438615, -0.8880609, 1, 0.4392157, 0, 1,
-1.560443, -0.1875312, -0.9714919, 1, 0.4431373, 0, 1,
-1.534626, 0.9014451, -2.156401, 1, 0.4509804, 0, 1,
-1.51899, -1.689291, -3.61216, 1, 0.454902, 0, 1,
-1.484336, 0.7797759, -0.1159263, 1, 0.4627451, 0, 1,
-1.478496, 1.204368, -0.2923231, 1, 0.4666667, 0, 1,
-1.473629, -0.4160234, -1.142481, 1, 0.4745098, 0, 1,
-1.471144, 0.2781915, -1.801589, 1, 0.4784314, 0, 1,
-1.461201, -1.379181, -2.653398, 1, 0.4862745, 0, 1,
-1.449185, -0.5678158, -2.890514, 1, 0.4901961, 0, 1,
-1.447727, -1.872994, -1.072992, 1, 0.4980392, 0, 1,
-1.445129, -1.070735, -1.174414, 1, 0.5058824, 0, 1,
-1.440589, -0.9536233, -1.797815, 1, 0.509804, 0, 1,
-1.437736, -0.8662758, -1.697946, 1, 0.5176471, 0, 1,
-1.434017, 0.9537665, -0.6972154, 1, 0.5215687, 0, 1,
-1.429222, 0.3247203, -1.457905, 1, 0.5294118, 0, 1,
-1.428137, -1.529474, -1.922776, 1, 0.5333334, 0, 1,
-1.427286, 1.234985, -1.550386, 1, 0.5411765, 0, 1,
-1.427164, -0.3028547, -0.1644177, 1, 0.5450981, 0, 1,
-1.421748, -0.4544806, -1.253111, 1, 0.5529412, 0, 1,
-1.414679, -0.3140141, -2.308779, 1, 0.5568628, 0, 1,
-1.405341, -0.7549855, -0.3310026, 1, 0.5647059, 0, 1,
-1.398868, -0.730835, -2.844508, 1, 0.5686275, 0, 1,
-1.376038, 0.9353798, -1.084482, 1, 0.5764706, 0, 1,
-1.370627, -2.737144, -2.976559, 1, 0.5803922, 0, 1,
-1.354454, 0.4348841, 0.5834541, 1, 0.5882353, 0, 1,
-1.35442, 1.781727, -1.071826, 1, 0.5921569, 0, 1,
-1.320133, 0.1570765, -1.603268, 1, 0.6, 0, 1,
-1.313158, 0.4817306, -3.649312, 1, 0.6078432, 0, 1,
-1.311447, -1.631279, -0.8855453, 1, 0.6117647, 0, 1,
-1.303648, 0.3020767, -1.579612, 1, 0.6196079, 0, 1,
-1.303399, 1.621069, -1.72861, 1, 0.6235294, 0, 1,
-1.30087, 1.217889, 0.5616798, 1, 0.6313726, 0, 1,
-1.296786, -2.678345, -3.514642, 1, 0.6352941, 0, 1,
-1.295576, 0.56145, 0.2928583, 1, 0.6431373, 0, 1,
-1.29168, -2.109137, -2.621533, 1, 0.6470588, 0, 1,
-1.290321, -0.1709633, -2.234818, 1, 0.654902, 0, 1,
-1.289357, 0.3484088, -1.566428, 1, 0.6588235, 0, 1,
-1.285243, 1.73522, -0.7386501, 1, 0.6666667, 0, 1,
-1.2814, 1.344214, -1.006113, 1, 0.6705883, 0, 1,
-1.274461, -0.2418092, -2.567641, 1, 0.6784314, 0, 1,
-1.268144, -1.476151, -1.646599, 1, 0.682353, 0, 1,
-1.267573, 0.766892, -0.4855709, 1, 0.6901961, 0, 1,
-1.258454, 0.1526871, -2.339592, 1, 0.6941177, 0, 1,
-1.257865, 1.793924, -2.900046, 1, 0.7019608, 0, 1,
-1.253682, 1.111542, -1.816923, 1, 0.7098039, 0, 1,
-1.253038, 1.29943, -1.597078, 1, 0.7137255, 0, 1,
-1.239639, -1.09241, -2.43492, 1, 0.7215686, 0, 1,
-1.235211, 1.037619, 0.2478454, 1, 0.7254902, 0, 1,
-1.229365, 2.046275, -0.494062, 1, 0.7333333, 0, 1,
-1.221333, 0.1559857, -0.6970987, 1, 0.7372549, 0, 1,
-1.200595, -0.4020405, -0.4400639, 1, 0.7450981, 0, 1,
-1.191082, 1.793062, -0.1439444, 1, 0.7490196, 0, 1,
-1.189906, 2.108218, -2.12666, 1, 0.7568628, 0, 1,
-1.187993, 0.9016995, -1.436867, 1, 0.7607843, 0, 1,
-1.185208, -1.219419, -1.692876, 1, 0.7686275, 0, 1,
-1.178325, -1.205433, -2.228448, 1, 0.772549, 0, 1,
-1.174433, 0.7417459, 0.2595737, 1, 0.7803922, 0, 1,
-1.173609, -0.672929, 0.2504279, 1, 0.7843137, 0, 1,
-1.171579, 1.070507, -0.1906984, 1, 0.7921569, 0, 1,
-1.166475, -0.9745894, -1.670063, 1, 0.7960784, 0, 1,
-1.160815, -0.2182664, -2.577204, 1, 0.8039216, 0, 1,
-1.160157, -0.4428847, -0.878754, 1, 0.8117647, 0, 1,
-1.156764, -1.210877, -1.80174, 1, 0.8156863, 0, 1,
-1.14849, 1.19739, -0.2426107, 1, 0.8235294, 0, 1,
-1.139047, 0.4449789, -2.830854, 1, 0.827451, 0, 1,
-1.138349, -1.288633, -3.143906, 1, 0.8352941, 0, 1,
-1.13031, 1.252792, 0.2760663, 1, 0.8392157, 0, 1,
-1.128752, -0.9181677, -3.40283, 1, 0.8470588, 0, 1,
-1.127026, -2.216608, -1.316188, 1, 0.8509804, 0, 1,
-1.126413, -1.496682, -3.036892, 1, 0.8588235, 0, 1,
-1.124372, -1.963993, -2.610038, 1, 0.8627451, 0, 1,
-1.102751, -0.2613116, -2.921879, 1, 0.8705882, 0, 1,
-1.09051, -0.3457809, -2.394304, 1, 0.8745098, 0, 1,
-1.089911, 0.5362704, -2.196702, 1, 0.8823529, 0, 1,
-1.089701, 0.4072311, -0.8509332, 1, 0.8862745, 0, 1,
-1.085185, 0.1345558, 0.4878451, 1, 0.8941177, 0, 1,
-1.078577, 0.3605433, -1.693025, 1, 0.8980392, 0, 1,
-1.066872, 0.9051968, -0.8598781, 1, 0.9058824, 0, 1,
-1.065385, 0.3300929, -1.524857, 1, 0.9137255, 0, 1,
-1.056067, -2.033751, -2.20257, 1, 0.9176471, 0, 1,
-1.053844, -1.177139, -3.404994, 1, 0.9254902, 0, 1,
-1.048943, 0.07904934, -2.849462, 1, 0.9294118, 0, 1,
-1.043198, 0.4107375, -2.490418, 1, 0.9372549, 0, 1,
-1.043049, 1.373951, 0.6035413, 1, 0.9411765, 0, 1,
-1.042029, 0.09233401, -1.291389, 1, 0.9490196, 0, 1,
-1.027787, -1.631292, -3.972924, 1, 0.9529412, 0, 1,
-1.022835, 0.476495, -2.425034, 1, 0.9607843, 0, 1,
-1.011631, -0.1387492, -1.504842, 1, 0.9647059, 0, 1,
-1.009638, -0.425683, 0.2853546, 1, 0.972549, 0, 1,
-1.008523, 2.822184, -0.3638858, 1, 0.9764706, 0, 1,
-1.007483, -0.8586715, 0.2968555, 1, 0.9843137, 0, 1,
-1.005625, 0.1536882, -0.5049816, 1, 0.9882353, 0, 1,
-1.000417, -0.8414223, -2.728191, 1, 0.9960784, 0, 1,
-0.9975382, 1.579503, 0.1532919, 0.9960784, 1, 0, 1,
-0.9973845, -1.655487, -2.086638, 0.9921569, 1, 0, 1,
-0.9927987, -1.882449, -1.778629, 0.9843137, 1, 0, 1,
-0.9862503, -1.154837, -2.995685, 0.9803922, 1, 0, 1,
-0.9848641, -1.187755, -0.9273397, 0.972549, 1, 0, 1,
-0.9793975, -0.2748138, -2.085822, 0.9686275, 1, 0, 1,
-0.9759322, -1.442859, -1.174392, 0.9607843, 1, 0, 1,
-0.972939, 1.594034, -2.178927, 0.9568627, 1, 0, 1,
-0.9727224, -0.2675938, -2.044753, 0.9490196, 1, 0, 1,
-0.9702173, 1.764353, -1.680829, 0.945098, 1, 0, 1,
-0.9687851, -0.73192, -3.229431, 0.9372549, 1, 0, 1,
-0.9622684, 0.3563176, -0.7271587, 0.9333333, 1, 0, 1,
-0.9603635, -0.04931783, -2.321136, 0.9254902, 1, 0, 1,
-0.9554266, 0.0338216, -0.5677005, 0.9215686, 1, 0, 1,
-0.9545779, 0.1229529, -1.158453, 0.9137255, 1, 0, 1,
-0.9477023, 3.301461, -0.2634476, 0.9098039, 1, 0, 1,
-0.9457238, 0.8046201, -1.738818, 0.9019608, 1, 0, 1,
-0.9455569, -0.4494007, -1.467639, 0.8941177, 1, 0, 1,
-0.9385903, -0.2184105, -1.689793, 0.8901961, 1, 0, 1,
-0.9371352, -1.552692, -1.491719, 0.8823529, 1, 0, 1,
-0.9362144, 0.003706482, -1.281595, 0.8784314, 1, 0, 1,
-0.9353985, -0.395828, -2.139383, 0.8705882, 1, 0, 1,
-0.9274692, -0.4106438, -2.894766, 0.8666667, 1, 0, 1,
-0.9269201, -1.852126, -2.19187, 0.8588235, 1, 0, 1,
-0.9160497, -1.424435, -2.340255, 0.854902, 1, 0, 1,
-0.9080635, 0.4614479, -0.851481, 0.8470588, 1, 0, 1,
-0.9059511, -1.645988, -1.956391, 0.8431373, 1, 0, 1,
-0.903406, 0.7967149, 0.2201846, 0.8352941, 1, 0, 1,
-0.9008344, 0.6350147, -1.605158, 0.8313726, 1, 0, 1,
-0.9004802, 0.2483433, 1.462669, 0.8235294, 1, 0, 1,
-0.8970345, -0.770916, -3.362804, 0.8196079, 1, 0, 1,
-0.8922061, 0.01304457, -1.885753, 0.8117647, 1, 0, 1,
-0.8902519, 0.1345805, -2.094355, 0.8078431, 1, 0, 1,
-0.8872437, -0.3768793, -1.160344, 0.8, 1, 0, 1,
-0.8859631, -0.5708591, -2.375636, 0.7921569, 1, 0, 1,
-0.8811029, 0.5556909, -1.934517, 0.7882353, 1, 0, 1,
-0.8725944, -2.841787, -3.192431, 0.7803922, 1, 0, 1,
-0.8694893, 0.1457414, -1.690213, 0.7764706, 1, 0, 1,
-0.8665119, 1.043972, -0.2503381, 0.7686275, 1, 0, 1,
-0.8589095, 1.016116, -0.112657, 0.7647059, 1, 0, 1,
-0.8563637, 1.67304, 0.8172553, 0.7568628, 1, 0, 1,
-0.8532305, -0.7733137, -3.147919, 0.7529412, 1, 0, 1,
-0.8496335, 0.6681403, -0.3090423, 0.7450981, 1, 0, 1,
-0.8470688, 0.008503826, -2.69312, 0.7411765, 1, 0, 1,
-0.8408442, -0.578811, -2.161798, 0.7333333, 1, 0, 1,
-0.838466, 0.7926036, -1.946322, 0.7294118, 1, 0, 1,
-0.8366777, -1.211989, -4.201006, 0.7215686, 1, 0, 1,
-0.8355976, -0.2472343, 0.4575571, 0.7176471, 1, 0, 1,
-0.824899, -1.705394, -2.934554, 0.7098039, 1, 0, 1,
-0.8240585, 0.667368, -1.137661, 0.7058824, 1, 0, 1,
-0.8232175, -0.2903415, -0.5999559, 0.6980392, 1, 0, 1,
-0.8221861, -0.1564068, -2.436651, 0.6901961, 1, 0, 1,
-0.8206406, -0.296969, -0.6153331, 0.6862745, 1, 0, 1,
-0.8183047, -0.3592015, -1.698621, 0.6784314, 1, 0, 1,
-0.8128307, 0.3617795, -0.02853039, 0.6745098, 1, 0, 1,
-0.8060892, -0.1751186, -1.396714, 0.6666667, 1, 0, 1,
-0.7988246, 0.8591418, -1.815971, 0.6627451, 1, 0, 1,
-0.7956128, 0.852166, -1.634808, 0.654902, 1, 0, 1,
-0.7943744, -0.01830233, 0.2917466, 0.6509804, 1, 0, 1,
-0.7911316, 1.927019, -0.3307969, 0.6431373, 1, 0, 1,
-0.7838959, -0.6393884, -1.404426, 0.6392157, 1, 0, 1,
-0.7758211, -1.144356, -2.205572, 0.6313726, 1, 0, 1,
-0.7732089, -0.7154506, -1.502104, 0.627451, 1, 0, 1,
-0.7726097, -0.777723, -1.692424, 0.6196079, 1, 0, 1,
-0.7724796, -0.2873331, -0.5953544, 0.6156863, 1, 0, 1,
-0.7722201, -0.07292322, -0.3566588, 0.6078432, 1, 0, 1,
-0.7714413, -0.3299038, -1.850788, 0.6039216, 1, 0, 1,
-0.7653356, 0.0419553, 0.8024077, 0.5960785, 1, 0, 1,
-0.7618439, -1.040158, -3.073211, 0.5882353, 1, 0, 1,
-0.7616699, 1.57431, -0.4861992, 0.5843138, 1, 0, 1,
-0.761261, -0.01601768, -0.4413339, 0.5764706, 1, 0, 1,
-0.75353, 1.433276, 1.437485, 0.572549, 1, 0, 1,
-0.7510207, -0.5984234, -2.070048, 0.5647059, 1, 0, 1,
-0.748139, 0.5768384, -1.701443, 0.5607843, 1, 0, 1,
-0.7476121, 0.2380525, -0.4639414, 0.5529412, 1, 0, 1,
-0.7468554, -0.8582832, -3.361574, 0.5490196, 1, 0, 1,
-0.7468321, -0.4961302, -1.784853, 0.5411765, 1, 0, 1,
-0.7465615, 0.5634641, -0.8616217, 0.5372549, 1, 0, 1,
-0.7456496, -0.243923, -1.65748, 0.5294118, 1, 0, 1,
-0.741857, 0.3152094, -1.715709, 0.5254902, 1, 0, 1,
-0.7310554, -0.4409269, -1.966763, 0.5176471, 1, 0, 1,
-0.7309547, 0.1755985, -2.269157, 0.5137255, 1, 0, 1,
-0.729954, 0.9140092, -0.6334435, 0.5058824, 1, 0, 1,
-0.7265079, -1.516718, -3.831298, 0.5019608, 1, 0, 1,
-0.7264959, -1.264036, -1.801875, 0.4941176, 1, 0, 1,
-0.721984, -1.173603, -2.333081, 0.4862745, 1, 0, 1,
-0.7208924, 1.050876, -1.31958, 0.4823529, 1, 0, 1,
-0.714456, 1.757998, -0.9024714, 0.4745098, 1, 0, 1,
-0.7104128, -0.1092993, -1.598005, 0.4705882, 1, 0, 1,
-0.698469, 0.99981, -0.6840414, 0.4627451, 1, 0, 1,
-0.6982026, -0.8567144, -3.949623, 0.4588235, 1, 0, 1,
-0.6960498, -0.3988288, -2.117828, 0.4509804, 1, 0, 1,
-0.6956847, 0.1080257, -1.321732, 0.4470588, 1, 0, 1,
-0.6928065, 0.4380521, -0.8973992, 0.4392157, 1, 0, 1,
-0.6909255, 0.3739086, -2.984097, 0.4352941, 1, 0, 1,
-0.6901192, -0.5763148, -0.891549, 0.427451, 1, 0, 1,
-0.6886648, 0.9519378, 0.781876, 0.4235294, 1, 0, 1,
-0.6884031, 0.9111635, 0.5802214, 0.4156863, 1, 0, 1,
-0.6839073, 1.510954, -0.6879048, 0.4117647, 1, 0, 1,
-0.6778407, -1.240841, -1.620164, 0.4039216, 1, 0, 1,
-0.6697388, 0.1422779, -1.528269, 0.3960784, 1, 0, 1,
-0.6653529, -0.2126587, -3.016767, 0.3921569, 1, 0, 1,
-0.6629727, -0.4112567, -1.710106, 0.3843137, 1, 0, 1,
-0.6607873, -0.03626683, -1.988103, 0.3803922, 1, 0, 1,
-0.6582147, -0.6151589, -0.9626424, 0.372549, 1, 0, 1,
-0.6543977, -0.6276916, -2.727283, 0.3686275, 1, 0, 1,
-0.6524893, 0.2215252, -1.68319, 0.3607843, 1, 0, 1,
-0.6496931, 0.6660857, -1.251868, 0.3568628, 1, 0, 1,
-0.6465111, 0.4638123, -0.7256967, 0.3490196, 1, 0, 1,
-0.6456995, -0.2367683, -2.46037, 0.345098, 1, 0, 1,
-0.6444549, 0.1358464, -1.133029, 0.3372549, 1, 0, 1,
-0.6354188, 0.9045519, -0.5161515, 0.3333333, 1, 0, 1,
-0.6346862, 0.4639187, 0.5367725, 0.3254902, 1, 0, 1,
-0.6308155, 0.01006924, -2.214061, 0.3215686, 1, 0, 1,
-0.6305484, 1.186869, -0.384919, 0.3137255, 1, 0, 1,
-0.6297171, 1.486128, 0.0006023535, 0.3098039, 1, 0, 1,
-0.6286439, -0.7493035, -0.6308605, 0.3019608, 1, 0, 1,
-0.6273493, -0.05829301, -2.225466, 0.2941177, 1, 0, 1,
-0.6271788, -0.2077158, -1.725431, 0.2901961, 1, 0, 1,
-0.6221122, 0.006084365, -2.578817, 0.282353, 1, 0, 1,
-0.6217077, -0.5954712, -1.005723, 0.2784314, 1, 0, 1,
-0.6211077, 0.1158458, -2.170938, 0.2705882, 1, 0, 1,
-0.6183888, 0.6167203, -0.7561316, 0.2666667, 1, 0, 1,
-0.6140439, 0.660911, -1.723864, 0.2588235, 1, 0, 1,
-0.6042585, 1.097283, -3.012946, 0.254902, 1, 0, 1,
-0.6022032, 0.5888836, -1.998534, 0.2470588, 1, 0, 1,
-0.5973788, 0.8313447, -0.2910943, 0.2431373, 1, 0, 1,
-0.5867678, -0.7599772, -2.29698, 0.2352941, 1, 0, 1,
-0.5773675, 0.8202559, -1.368641, 0.2313726, 1, 0, 1,
-0.5743785, -0.6893317, -2.911876, 0.2235294, 1, 0, 1,
-0.5701453, -0.7519578, -4.670132, 0.2196078, 1, 0, 1,
-0.5693235, -0.4436335, -1.726127, 0.2117647, 1, 0, 1,
-0.5659868, -1.692955, -2.551727, 0.2078431, 1, 0, 1,
-0.565119, 0.3735658, -1.8726, 0.2, 1, 0, 1,
-0.5640574, 0.5724446, -0.4108366, 0.1921569, 1, 0, 1,
-0.5631455, -0.9849253, -2.984749, 0.1882353, 1, 0, 1,
-0.5623893, 1.833218, 0.9772912, 0.1803922, 1, 0, 1,
-0.5622649, -1.116682, -3.638858, 0.1764706, 1, 0, 1,
-0.561985, -0.9698495, -2.176799, 0.1686275, 1, 0, 1,
-0.5616536, -0.9163907, -3.102585, 0.1647059, 1, 0, 1,
-0.5604319, 0.9410509, -2.18083, 0.1568628, 1, 0, 1,
-0.5580963, -0.1903403, -3.135341, 0.1529412, 1, 0, 1,
-0.5567756, -1.301944, -4.280852, 0.145098, 1, 0, 1,
-0.5534141, -0.06744637, -2.329257, 0.1411765, 1, 0, 1,
-0.552848, -0.01024803, -2.307206, 0.1333333, 1, 0, 1,
-0.54596, -0.8321168, -1.269399, 0.1294118, 1, 0, 1,
-0.5404731, -0.3149061, -3.461607, 0.1215686, 1, 0, 1,
-0.5383415, 0.4996748, 0.1398534, 0.1176471, 1, 0, 1,
-0.5365328, 0.7945655, -1.100107, 0.1098039, 1, 0, 1,
-0.535789, -2.027356, -4.199226, 0.1058824, 1, 0, 1,
-0.5353907, -1.82497, -2.856452, 0.09803922, 1, 0, 1,
-0.5337313, -0.5564668, -4.439259, 0.09019608, 1, 0, 1,
-0.5309854, 0.6840903, 0.5085223, 0.08627451, 1, 0, 1,
-0.530064, 0.6605136, -1.461587, 0.07843138, 1, 0, 1,
-0.5243071, -1.505193, -2.173647, 0.07450981, 1, 0, 1,
-0.5230432, -0.2793165, 0.4105416, 0.06666667, 1, 0, 1,
-0.5216327, 0.02002144, -0.9929353, 0.0627451, 1, 0, 1,
-0.5213783, -1.443816, -1.37085, 0.05490196, 1, 0, 1,
-0.5166064, -2.193064, -2.714537, 0.05098039, 1, 0, 1,
-0.5118226, 0.3736771, -2.425198, 0.04313726, 1, 0, 1,
-0.5083322, 1.027302, 1.210272, 0.03921569, 1, 0, 1,
-0.5078087, 0.3310668, 0.04232394, 0.03137255, 1, 0, 1,
-0.5059077, -0.0622303, -1.354436, 0.02745098, 1, 0, 1,
-0.5056567, 0.5145272, -0.3553337, 0.01960784, 1, 0, 1,
-0.5050188, 0.7478791, 0.3404967, 0.01568628, 1, 0, 1,
-0.5029134, 1.263209, -2.313276, 0.007843138, 1, 0, 1,
-0.4997607, -1.526795, -3.86772, 0.003921569, 1, 0, 1,
-0.4990188, -1.589294, -2.706873, 0, 1, 0.003921569, 1,
-0.4949265, -0.6350839, -4.159184, 0, 1, 0.01176471, 1,
-0.4899255, -0.812335, -4.204017, 0, 1, 0.01568628, 1,
-0.4897989, -0.3284743, -3.373536, 0, 1, 0.02352941, 1,
-0.4891061, 2.119761, -0.7338946, 0, 1, 0.02745098, 1,
-0.4888638, 0.9925165, -1.419884, 0, 1, 0.03529412, 1,
-0.4888406, -0.1624455, -2.308753, 0, 1, 0.03921569, 1,
-0.4787155, -0.8116263, -2.648371, 0, 1, 0.04705882, 1,
-0.4773318, -0.9068777, -1.339704, 0, 1, 0.05098039, 1,
-0.4758188, 1.546625, 0.1322571, 0, 1, 0.05882353, 1,
-0.469405, -1.652244, -2.079855, 0, 1, 0.0627451, 1,
-0.4627003, 1.564684, -0.5292859, 0, 1, 0.07058824, 1,
-0.4621857, 1.240737, 1.015518, 0, 1, 0.07450981, 1,
-0.4613784, 0.4698564, -1.620398, 0, 1, 0.08235294, 1,
-0.4613364, -0.3675762, -1.993154, 0, 1, 0.08627451, 1,
-0.4542001, -0.2142705, -1.48945, 0, 1, 0.09411765, 1,
-0.4529149, 1.003722, 0.8540223, 0, 1, 0.1019608, 1,
-0.4511149, -2.156682, -4.30819, 0, 1, 0.1058824, 1,
-0.4500278, -0.2420163, -2.222349, 0, 1, 0.1137255, 1,
-0.4437492, -0.4044698, -2.324158, 0, 1, 0.1176471, 1,
-0.4435977, 0.1381249, -0.7753794, 0, 1, 0.1254902, 1,
-0.4374337, 1.474275, -0.3796794, 0, 1, 0.1294118, 1,
-0.436038, -2.257997, -4.055981, 0, 1, 0.1372549, 1,
-0.4359334, 1.929925, -2.000499, 0, 1, 0.1411765, 1,
-0.4303073, 1.019225, -1.454407, 0, 1, 0.1490196, 1,
-0.4292409, -0.9650852, -4.12977, 0, 1, 0.1529412, 1,
-0.4280618, -0.3752187, -2.476063, 0, 1, 0.1607843, 1,
-0.4277826, -1.464442, -1.545764, 0, 1, 0.1647059, 1,
-0.4228165, 0.117053, 0.6228573, 0, 1, 0.172549, 1,
-0.419034, -0.7047011, -1.776362, 0, 1, 0.1764706, 1,
-0.4138985, 0.8030294, -2.120261, 0, 1, 0.1843137, 1,
-0.4127906, -0.1401454, -1.345368, 0, 1, 0.1882353, 1,
-0.4116191, -0.6495132, -1.890699, 0, 1, 0.1960784, 1,
-0.4074076, -0.9322299, -2.486058, 0, 1, 0.2039216, 1,
-0.4038959, -1.583002, -2.86417, 0, 1, 0.2078431, 1,
-0.4005215, -1.344894, -1.463748, 0, 1, 0.2156863, 1,
-0.4002535, 0.3816927, 0.1628395, 0, 1, 0.2196078, 1,
-0.3992485, 0.4830165, -1.752656, 0, 1, 0.227451, 1,
-0.3989151, 0.6632327, -0.80846, 0, 1, 0.2313726, 1,
-0.3980853, 0.9097282, -1.258519, 0, 1, 0.2392157, 1,
-0.3942851, 0.3863217, 0.6716248, 0, 1, 0.2431373, 1,
-0.393922, -0.02896864, -1.926223, 0, 1, 0.2509804, 1,
-0.3934956, -1.22608, -3.520001, 0, 1, 0.254902, 1,
-0.3924243, 0.1279927, -0.7759427, 0, 1, 0.2627451, 1,
-0.3912247, -0.8630803, -1.412948, 0, 1, 0.2666667, 1,
-0.3910306, 1.284604, -1.920679, 0, 1, 0.2745098, 1,
-0.388293, 0.04536844, -1.8994, 0, 1, 0.2784314, 1,
-0.3868068, 1.307058, 0.3381275, 0, 1, 0.2862745, 1,
-0.3766768, -0.1197695, -1.431704, 0, 1, 0.2901961, 1,
-0.3746329, -0.5780839, -2.776431, 0, 1, 0.2980392, 1,
-0.3720297, 0.5599393, -0.7160379, 0, 1, 0.3058824, 1,
-0.3703306, 0.1971378, -2.188009, 0, 1, 0.3098039, 1,
-0.3670304, -0.2626295, -0.9733166, 0, 1, 0.3176471, 1,
-0.3636394, 1.402361, -0.6726529, 0, 1, 0.3215686, 1,
-0.3626787, -0.05679253, -1.472846, 0, 1, 0.3294118, 1,
-0.350214, 0.2192595, -1.782067, 0, 1, 0.3333333, 1,
-0.3481211, -0.77895, -3.580916, 0, 1, 0.3411765, 1,
-0.3447077, -0.1975262, -4.448873, 0, 1, 0.345098, 1,
-0.3426271, 0.9126452, -1.030749, 0, 1, 0.3529412, 1,
-0.3324608, 0.3515846, 0.964347, 0, 1, 0.3568628, 1,
-0.3314277, -0.556398, -3.357079, 0, 1, 0.3647059, 1,
-0.328723, -0.8123999, -2.168229, 0, 1, 0.3686275, 1,
-0.3268899, 1.605334, 0.7090648, 0, 1, 0.3764706, 1,
-0.3245601, -0.9185199, -1.172427, 0, 1, 0.3803922, 1,
-0.3244003, 0.2156878, 0.02404423, 0, 1, 0.3882353, 1,
-0.3229485, -0.5659116, -1.239697, 0, 1, 0.3921569, 1,
-0.3214527, 2.008514, -0.6183594, 0, 1, 0.4, 1,
-0.3183938, -1.609304, -2.281772, 0, 1, 0.4078431, 1,
-0.3109128, -0.7784981, -4.642687, 0, 1, 0.4117647, 1,
-0.3090757, 0.1758626, 1.148377, 0, 1, 0.4196078, 1,
-0.3087026, -1.575577, -4.176185, 0, 1, 0.4235294, 1,
-0.3069259, -0.4687405, -3.125396, 0, 1, 0.4313726, 1,
-0.3030444, -1.643612, -1.903325, 0, 1, 0.4352941, 1,
-0.3017253, 0.1223203, -0.2836929, 0, 1, 0.4431373, 1,
-0.298514, 1.512257, -0.4989087, 0, 1, 0.4470588, 1,
-0.2976544, -1.501771, -3.950494, 0, 1, 0.454902, 1,
-0.2976104, -0.6427318, -2.67108, 0, 1, 0.4588235, 1,
-0.2974877, 0.6049827, -0.1233336, 0, 1, 0.4666667, 1,
-0.2973613, -0.9279927, -0.6684417, 0, 1, 0.4705882, 1,
-0.2894782, -0.5853202, -3.000776, 0, 1, 0.4784314, 1,
-0.2827806, -0.5331817, -2.317932, 0, 1, 0.4823529, 1,
-0.2823537, 0.4235055, -2.674625, 0, 1, 0.4901961, 1,
-0.2720582, -0.9991223, -1.731187, 0, 1, 0.4941176, 1,
-0.2710412, -2.342865, -2.586385, 0, 1, 0.5019608, 1,
-0.2677083, 0.01883509, -0.9623036, 0, 1, 0.509804, 1,
-0.2650658, 0.5992931, -1.213064, 0, 1, 0.5137255, 1,
-0.2622959, 0.5313243, -0.4804635, 0, 1, 0.5215687, 1,
-0.2557753, -0.2429663, -2.839255, 0, 1, 0.5254902, 1,
-0.2543971, -1.567866, -2.7872, 0, 1, 0.5333334, 1,
-0.2538711, 0.4057968, 0.2261817, 0, 1, 0.5372549, 1,
-0.2535155, -0.5099686, -4.288048, 0, 1, 0.5450981, 1,
-0.2531339, -1.630624, -3.152262, 0, 1, 0.5490196, 1,
-0.2497927, 0.01293793, -1.037074, 0, 1, 0.5568628, 1,
-0.2466331, 0.2650056, -1.489851, 0, 1, 0.5607843, 1,
-0.2463835, 0.1283493, -2.10581, 0, 1, 0.5686275, 1,
-0.2437789, -2.473026, -2.000064, 0, 1, 0.572549, 1,
-0.2362815, 0.5345861, -1.268227, 0, 1, 0.5803922, 1,
-0.2356448, 0.8579736, -0.8808869, 0, 1, 0.5843138, 1,
-0.2279371, -0.5754115, -2.813756, 0, 1, 0.5921569, 1,
-0.2271525, -0.3086141, -5.3276, 0, 1, 0.5960785, 1,
-0.2259963, 1.668441, 0.4582014, 0, 1, 0.6039216, 1,
-0.2226715, 1.713067, -1.746315, 0, 1, 0.6117647, 1,
-0.2224486, -0.3661986, -4.571474, 0, 1, 0.6156863, 1,
-0.2215198, 0.9488384, 0.1844617, 0, 1, 0.6235294, 1,
-0.2181583, 2.426421, -0.1766342, 0, 1, 0.627451, 1,
-0.2171157, 0.0825706, -1.160921, 0, 1, 0.6352941, 1,
-0.2161663, -1.633632, -2.717495, 0, 1, 0.6392157, 1,
-0.2149884, 1.611383, 0.7090506, 0, 1, 0.6470588, 1,
-0.214588, 0.5945898, -1.91749, 0, 1, 0.6509804, 1,
-0.2138025, 0.9164225, -0.1778207, 0, 1, 0.6588235, 1,
-0.2114763, -0.1054651, -1.614517, 0, 1, 0.6627451, 1,
-0.2091152, -1.154953, -0.7562942, 0, 1, 0.6705883, 1,
-0.2027083, 1.295807, 0.6272783, 0, 1, 0.6745098, 1,
-0.2002218, 0.2230059, 0.1502165, 0, 1, 0.682353, 1,
-0.1957688, 1.854341, 0.6556145, 0, 1, 0.6862745, 1,
-0.1937835, 0.1162793, 0.6098732, 0, 1, 0.6941177, 1,
-0.1890281, 0.1208332, -1.419694, 0, 1, 0.7019608, 1,
-0.1826576, 0.8931674, -1.465501, 0, 1, 0.7058824, 1,
-0.1826426, -1.082913, -5.731192, 0, 1, 0.7137255, 1,
-0.1809195, 0.04417673, -1.789315, 0, 1, 0.7176471, 1,
-0.1790941, 0.1369125, -1.317961, 0, 1, 0.7254902, 1,
-0.1691057, -1.259421, -4.683583, 0, 1, 0.7294118, 1,
-0.1644631, 0.3628723, -1.978391, 0, 1, 0.7372549, 1,
-0.1642244, -1.201396, -2.819239, 0, 1, 0.7411765, 1,
-0.1632686, 0.681575, 0.05287706, 0, 1, 0.7490196, 1,
-0.1616049, -0.1034451, -1.136797, 0, 1, 0.7529412, 1,
-0.1540363, -0.007050215, -2.215231, 0, 1, 0.7607843, 1,
-0.1539768, 1.979327, 0.8133737, 0, 1, 0.7647059, 1,
-0.1526701, 1.877553, 1.102734, 0, 1, 0.772549, 1,
-0.1480568, 0.2780445, -0.7260712, 0, 1, 0.7764706, 1,
-0.1464506, -1.101668, -3.35156, 0, 1, 0.7843137, 1,
-0.1453725, -0.01502533, -1.551564, 0, 1, 0.7882353, 1,
-0.1441593, 0.1753187, -1.433345, 0, 1, 0.7960784, 1,
-0.1430219, -2.099259, -3.780548, 0, 1, 0.8039216, 1,
-0.1410674, 0.7324961, 0.5262586, 0, 1, 0.8078431, 1,
-0.138177, -0.1741131, -1.851112, 0, 1, 0.8156863, 1,
-0.1350369, -0.5807654, -4.000113, 0, 1, 0.8196079, 1,
-0.133364, 0.1893976, 0.4246278, 0, 1, 0.827451, 1,
-0.1293114, 1.281577, 0.312591, 0, 1, 0.8313726, 1,
-0.1234948, -0.3506181, -2.020536, 0, 1, 0.8392157, 1,
-0.1169916, -0.7078527, -5.63699, 0, 1, 0.8431373, 1,
-0.1166373, -0.2362882, -2.383767, 0, 1, 0.8509804, 1,
-0.1154603, -0.07134228, -3.418289, 0, 1, 0.854902, 1,
-0.1106032, -0.2038579, -1.892013, 0, 1, 0.8627451, 1,
-0.1050921, -0.2747481, -3.655886, 0, 1, 0.8666667, 1,
-0.102379, -0.3213318, -2.903469, 0, 1, 0.8745098, 1,
-0.1013553, -0.9990904, -4.726461, 0, 1, 0.8784314, 1,
-0.09620256, 1.041451, 0.7384759, 0, 1, 0.8862745, 1,
-0.09549683, -0.1589626, -2.295248, 0, 1, 0.8901961, 1,
-0.08740957, -0.5155812, -1.802171, 0, 1, 0.8980392, 1,
-0.08731071, -0.7499747, -3.594492, 0, 1, 0.9058824, 1,
-0.08703119, 0.1811463, -3.045512, 0, 1, 0.9098039, 1,
-0.08690545, -0.2014987, -3.764103, 0, 1, 0.9176471, 1,
-0.08433456, 0.5673977, 0.5319316, 0, 1, 0.9215686, 1,
-0.08044257, 0.9758198, -1.54197, 0, 1, 0.9294118, 1,
-0.07689398, -1.070732, -2.399201, 0, 1, 0.9333333, 1,
-0.07124116, 0.3130852, 0.1218592, 0, 1, 0.9411765, 1,
-0.07027199, 0.1214687, -0.03792737, 0, 1, 0.945098, 1,
-0.06581479, -1.030867, -3.343131, 0, 1, 0.9529412, 1,
-0.06456036, 0.9966362, 1.251357, 0, 1, 0.9568627, 1,
-0.06425352, -1.321055, -4.335371, 0, 1, 0.9647059, 1,
-0.06228362, 1.907493, 0.05491627, 0, 1, 0.9686275, 1,
-0.06221991, -0.4673072, -4.20813, 0, 1, 0.9764706, 1,
-0.04646463, -0.6743071, -4.741211, 0, 1, 0.9803922, 1,
-0.04393343, -0.04094427, -1.434167, 0, 1, 0.9882353, 1,
-0.04150623, 0.228588, -1.175902, 0, 1, 0.9921569, 1,
-0.0400303, -0.3915667, -4.879363, 0, 1, 1, 1,
-0.03735245, -1.126599, -3.294097, 0, 0.9921569, 1, 1,
-0.03359386, -1.037747, -2.233114, 0, 0.9882353, 1, 1,
-0.03280543, 2.160562, 0.2650882, 0, 0.9803922, 1, 1,
-0.03263555, 0.1385999, -0.5471677, 0, 0.9764706, 1, 1,
-0.03007579, 0.1273124, -0.8009011, 0, 0.9686275, 1, 1,
-0.02931702, -1.129572, -1.881051, 0, 0.9647059, 1, 1,
-0.02724681, 0.1043872, -0.08803956, 0, 0.9568627, 1, 1,
-0.02657163, -0.06376875, -3.12676, 0, 0.9529412, 1, 1,
-0.01878763, 1.618532, -0.5383996, 0, 0.945098, 1, 1,
-0.0145611, -1.07357, -4.870543, 0, 0.9411765, 1, 1,
-0.009590374, -0.2734254, -3.304463, 0, 0.9333333, 1, 1,
-0.009090099, -2.102514, -2.453879, 0, 0.9294118, 1, 1,
-0.0007776599, 2.068825, -0.508692, 0, 0.9215686, 1, 1,
0.00167439, 0.4276904, 1.851001, 0, 0.9176471, 1, 1,
0.00274315, -0.5149239, 3.199775, 0, 0.9098039, 1, 1,
0.005691223, -1.069419, 3.534642, 0, 0.9058824, 1, 1,
0.01244633, 1.705509, -0.6653094, 0, 0.8980392, 1, 1,
0.01376505, -0.3877937, 3.524578, 0, 0.8901961, 1, 1,
0.01824205, -0.9580795, 3.028409, 0, 0.8862745, 1, 1,
0.02038996, -0.1139164, 3.50123, 0, 0.8784314, 1, 1,
0.02355421, 0.3398984, -0.1689304, 0, 0.8745098, 1, 1,
0.02809815, 0.1828634, 0.3295748, 0, 0.8666667, 1, 1,
0.03343773, -0.728655, 3.466289, 0, 0.8627451, 1, 1,
0.04095333, -1.337907, 3.727534, 0, 0.854902, 1, 1,
0.04658655, 0.06494031, -0.1081612, 0, 0.8509804, 1, 1,
0.0514277, -0.1441337, 2.310431, 0, 0.8431373, 1, 1,
0.05191386, -2.391643, 3.769281, 0, 0.8392157, 1, 1,
0.05369154, 0.0816693, -0.2052238, 0, 0.8313726, 1, 1,
0.0579859, 0.7528042, 0.07650197, 0, 0.827451, 1, 1,
0.06343555, 0.2269711, -1.359684, 0, 0.8196079, 1, 1,
0.06375533, 1.890631, 0.2459947, 0, 0.8156863, 1, 1,
0.06449052, -1.026044, 3.143538, 0, 0.8078431, 1, 1,
0.0760183, 0.9760869, 0.1174763, 0, 0.8039216, 1, 1,
0.07675737, -1.065492, 4.131029, 0, 0.7960784, 1, 1,
0.07710323, 2.437696, 1.374208, 0, 0.7882353, 1, 1,
0.07897888, -1.717725, 4.189659, 0, 0.7843137, 1, 1,
0.08215172, 1.388669, -0.4581286, 0, 0.7764706, 1, 1,
0.08716585, -0.7118936, 3.867245, 0, 0.772549, 1, 1,
0.08942681, 0.1891254, 0.2282881, 0, 0.7647059, 1, 1,
0.09681667, -1.134971, 3.138916, 0, 0.7607843, 1, 1,
0.1056073, 0.5795951, 0.8229225, 0, 0.7529412, 1, 1,
0.1065458, -0.9601112, 3.849501, 0, 0.7490196, 1, 1,
0.10687, 0.2871101, 0.967528, 0, 0.7411765, 1, 1,
0.1076933, 1.085892, -1.039598, 0, 0.7372549, 1, 1,
0.1077985, -1.421628, 3.584511, 0, 0.7294118, 1, 1,
0.1085572, -0.2838969, 1.919239, 0, 0.7254902, 1, 1,
0.109516, 1.065301, 0.6418107, 0, 0.7176471, 1, 1,
0.1110266, -0.6905896, 2.309475, 0, 0.7137255, 1, 1,
0.1115321, 0.7121396, 3.213312, 0, 0.7058824, 1, 1,
0.1145138, 0.3155614, 0.3379146, 0, 0.6980392, 1, 1,
0.1149622, 0.5792183, 0.04337379, 0, 0.6941177, 1, 1,
0.1179258, -0.06644443, 1.751656, 0, 0.6862745, 1, 1,
0.1191528, -0.8290107, 3.323626, 0, 0.682353, 1, 1,
0.1316556, -0.9284644, 3.447016, 0, 0.6745098, 1, 1,
0.1321274, 0.2487666, 2.053952, 0, 0.6705883, 1, 1,
0.1338282, 0.8239583, -1.418556, 0, 0.6627451, 1, 1,
0.1360901, -1.152874, 3.517196, 0, 0.6588235, 1, 1,
0.1377706, -0.03914241, 1.521914, 0, 0.6509804, 1, 1,
0.1381103, -0.3973662, 4.5673, 0, 0.6470588, 1, 1,
0.1382604, -0.5889478, 3.729882, 0, 0.6392157, 1, 1,
0.139785, 0.630698, 1.484844, 0, 0.6352941, 1, 1,
0.1399003, -0.8009074, 3.089363, 0, 0.627451, 1, 1,
0.1438454, -0.7716865, 3.193862, 0, 0.6235294, 1, 1,
0.1456314, 0.1945613, 0.1658724, 0, 0.6156863, 1, 1,
0.1483807, 0.166036, 0.6148272, 0, 0.6117647, 1, 1,
0.1494192, -0.4743297, 4.78614, 0, 0.6039216, 1, 1,
0.153368, 1.681533, 0.505993, 0, 0.5960785, 1, 1,
0.1534859, -0.6219959, 3.231896, 0, 0.5921569, 1, 1,
0.1585785, 0.2323233, 1.886475, 0, 0.5843138, 1, 1,
0.1603197, -1.235204, 1.844509, 0, 0.5803922, 1, 1,
0.1611898, 0.5715197, 2.099376, 0, 0.572549, 1, 1,
0.1626383, -0.6327928, 2.722377, 0, 0.5686275, 1, 1,
0.1638111, 0.1117237, 0.3651232, 0, 0.5607843, 1, 1,
0.1653075, 0.06575536, 0.4779873, 0, 0.5568628, 1, 1,
0.1672564, -0.8947916, 3.338335, 0, 0.5490196, 1, 1,
0.1738318, 0.5753636, -1.982715, 0, 0.5450981, 1, 1,
0.1834556, -0.5187816, 0.9144592, 0, 0.5372549, 1, 1,
0.188848, 1.004911, -0.344427, 0, 0.5333334, 1, 1,
0.1892082, 0.2291004, 0.9739097, 0, 0.5254902, 1, 1,
0.1944254, 0.9464284, -0.6808048, 0, 0.5215687, 1, 1,
0.2021833, 0.7490913, -0.1243161, 0, 0.5137255, 1, 1,
0.2037182, -1.259978, 3.841383, 0, 0.509804, 1, 1,
0.2043808, -0.5025565, 2.596614, 0, 0.5019608, 1, 1,
0.2100885, 0.2912783, -0.2834282, 0, 0.4941176, 1, 1,
0.2164225, 0.8301942, -0.4266833, 0, 0.4901961, 1, 1,
0.2165099, 0.1024631, 2.004916, 0, 0.4823529, 1, 1,
0.2168524, -1.12136, 4.538828, 0, 0.4784314, 1, 1,
0.2178221, 2.098531, -1.801853, 0, 0.4705882, 1, 1,
0.2217281, 0.108015, 0.8268987, 0, 0.4666667, 1, 1,
0.2233715, 0.1908649, 1.717768, 0, 0.4588235, 1, 1,
0.2256256, -0.2284391, 0.4379889, 0, 0.454902, 1, 1,
0.2288198, 1.435265, 0.9757565, 0, 0.4470588, 1, 1,
0.2311878, 1.281435, -1.659049, 0, 0.4431373, 1, 1,
0.2357877, 1.100739, -0.0205736, 0, 0.4352941, 1, 1,
0.239454, -0.333708, 2.861182, 0, 0.4313726, 1, 1,
0.2413561, 2.248248, -1.646643, 0, 0.4235294, 1, 1,
0.2430862, -0.9824973, 2.457929, 0, 0.4196078, 1, 1,
0.2507793, -2.22348, 2.051818, 0, 0.4117647, 1, 1,
0.2550985, 0.6556978, -0.4280258, 0, 0.4078431, 1, 1,
0.2560426, -0.6128111, 3.080603, 0, 0.4, 1, 1,
0.2579812, -0.6634736, 3.078456, 0, 0.3921569, 1, 1,
0.2604072, -0.2817901, 2.110432, 0, 0.3882353, 1, 1,
0.2664383, 0.1368587, -0.56612, 0, 0.3803922, 1, 1,
0.2750829, 1.329688, -0.5421963, 0, 0.3764706, 1, 1,
0.2855028, -1.058598, 2.109266, 0, 0.3686275, 1, 1,
0.286935, 1.886306, -0.4447587, 0, 0.3647059, 1, 1,
0.287154, -0.07561437, 1.618112, 0, 0.3568628, 1, 1,
0.2924684, 0.4258616, 0.810203, 0, 0.3529412, 1, 1,
0.2936882, 0.3646953, 0.3918098, 0, 0.345098, 1, 1,
0.2946229, -1.350077, 3.232939, 0, 0.3411765, 1, 1,
0.3045853, -1.625295, 3.112841, 0, 0.3333333, 1, 1,
0.3064368, -1.47928, 3.687795, 0, 0.3294118, 1, 1,
0.3064817, 0.7216064, 0.4952728, 0, 0.3215686, 1, 1,
0.3068106, -1.016265, 2.190445, 0, 0.3176471, 1, 1,
0.3071592, -1.109877, 2.62486, 0, 0.3098039, 1, 1,
0.3081062, -0.3159544, 3.106947, 0, 0.3058824, 1, 1,
0.3084971, 0.1932757, 0.36467, 0, 0.2980392, 1, 1,
0.3113515, -0.9005201, 1.669034, 0, 0.2901961, 1, 1,
0.3148984, -1.075567, 2.173326, 0, 0.2862745, 1, 1,
0.3153149, 0.8351213, -0.9084302, 0, 0.2784314, 1, 1,
0.3207519, 1.856443, -1.679817, 0, 0.2745098, 1, 1,
0.3268337, -1.07454, 2.593104, 0, 0.2666667, 1, 1,
0.3298202, 2.83504, -0.6428473, 0, 0.2627451, 1, 1,
0.3299559, -0.8325792, 5.22619, 0, 0.254902, 1, 1,
0.3310925, 0.1670445, 0.2499269, 0, 0.2509804, 1, 1,
0.3336693, 0.1277887, 1.415693, 0, 0.2431373, 1, 1,
0.3346128, -1.926781, 3.002761, 0, 0.2392157, 1, 1,
0.3351371, -0.1733399, 2.780466, 0, 0.2313726, 1, 1,
0.3372796, -0.70974, 1.761039, 0, 0.227451, 1, 1,
0.3386179, -1.15199, 3.273911, 0, 0.2196078, 1, 1,
0.34392, 0.5975798, -0.5389535, 0, 0.2156863, 1, 1,
0.3442462, 2.132598, 1.729689, 0, 0.2078431, 1, 1,
0.3478829, 0.2943339, 1.679535, 0, 0.2039216, 1, 1,
0.3498388, 1.180938, 2.072905, 0, 0.1960784, 1, 1,
0.3582409, -0.8477242, 3.164828, 0, 0.1882353, 1, 1,
0.3590596, -0.401311, 0.1965446, 0, 0.1843137, 1, 1,
0.3601168, 0.118644, -0.5271204, 0, 0.1764706, 1, 1,
0.3649097, 1.353309, 0.532779, 0, 0.172549, 1, 1,
0.3649144, -1.857225, 3.657493, 0, 0.1647059, 1, 1,
0.3650554, 1.423363, -0.1758224, 0, 0.1607843, 1, 1,
0.3651433, 0.06532625, 1.660267, 0, 0.1529412, 1, 1,
0.3672597, -0.5827145, 2.774447, 0, 0.1490196, 1, 1,
0.3689589, -0.04895472, 1.097431, 0, 0.1411765, 1, 1,
0.3692039, 1.744598, -0.8682179, 0, 0.1372549, 1, 1,
0.373106, -0.237484, 2.564389, 0, 0.1294118, 1, 1,
0.3732443, 0.1931891, 0.6742615, 0, 0.1254902, 1, 1,
0.3758029, 2.04669, -1.676036, 0, 0.1176471, 1, 1,
0.3765668, 0.6608235, 0.3022336, 0, 0.1137255, 1, 1,
0.377831, 1.972113, -1.338588, 0, 0.1058824, 1, 1,
0.3803891, -1.726003, 2.63763, 0, 0.09803922, 1, 1,
0.3870907, 1.645698, 1.284044, 0, 0.09411765, 1, 1,
0.3903784, 0.2896698, 2.612233, 0, 0.08627451, 1, 1,
0.390922, -0.6761144, 1.665177, 0, 0.08235294, 1, 1,
0.3925754, -1.876148, 1.36603, 0, 0.07450981, 1, 1,
0.3989498, -0.6458942, 1.692404, 0, 0.07058824, 1, 1,
0.4017012, 0.1497893, 1.013144, 0, 0.0627451, 1, 1,
0.4060791, 0.9689677, 0.5321068, 0, 0.05882353, 1, 1,
0.4073805, -1.252546, 3.179343, 0, 0.05098039, 1, 1,
0.4102306, -0.6499107, 2.833881, 0, 0.04705882, 1, 1,
0.4129997, -2.505692, 2.324818, 0, 0.03921569, 1, 1,
0.4152513, 1.534779, 0.9904559, 0, 0.03529412, 1, 1,
0.418204, 1.081878, -0.1473254, 0, 0.02745098, 1, 1,
0.4217422, -2.015464, 3.608303, 0, 0.02352941, 1, 1,
0.4277436, -0.9175546, 2.086586, 0, 0.01568628, 1, 1,
0.4309964, -0.4042897, 1.662537, 0, 0.01176471, 1, 1,
0.4381189, -0.539357, 3.465406, 0, 0.003921569, 1, 1,
0.4410613, 0.3404795, 1.28374, 0.003921569, 0, 1, 1,
0.4460959, -1.371264, 2.220545, 0.007843138, 0, 1, 1,
0.4479006, -0.1933185, 2.170073, 0.01568628, 0, 1, 1,
0.4573159, 0.4245914, 0.6305984, 0.01960784, 0, 1, 1,
0.4671305, -1.654003, 4.078028, 0.02745098, 0, 1, 1,
0.4690069, -1.198711, 0.468985, 0.03137255, 0, 1, 1,
0.4709794, -1.958254, 3.450037, 0.03921569, 0, 1, 1,
0.4721952, 0.8992474, -0.4260655, 0.04313726, 0, 1, 1,
0.4723727, -0.5444046, 3.836999, 0.05098039, 0, 1, 1,
0.4725192, 0.3717559, -0.694414, 0.05490196, 0, 1, 1,
0.4736764, -1.788872, 3.418888, 0.0627451, 0, 1, 1,
0.4777297, -0.4279288, 3.546628, 0.06666667, 0, 1, 1,
0.4777965, 0.5376229, 0.3870193, 0.07450981, 0, 1, 1,
0.4785976, 0.7254426, -1.374188, 0.07843138, 0, 1, 1,
0.4809801, 0.09998734, 1.897937, 0.08627451, 0, 1, 1,
0.4853352, -0.3342946, 2.862798, 0.09019608, 0, 1, 1,
0.4860887, 1.11005, 0.9597465, 0.09803922, 0, 1, 1,
0.4863661, 0.1929266, -0.5943658, 0.1058824, 0, 1, 1,
0.488576, 1.626525, -1.130095, 0.1098039, 0, 1, 1,
0.4921157, -0.9575136, 2.367292, 0.1176471, 0, 1, 1,
0.4960627, 1.846076, 2.039734, 0.1215686, 0, 1, 1,
0.4971578, 1.828555, -0.3020145, 0.1294118, 0, 1, 1,
0.5053353, -0.9449392, 3.577011, 0.1333333, 0, 1, 1,
0.5102921, -0.1494319, 0.8326305, 0.1411765, 0, 1, 1,
0.5107678, -0.2958432, -0.5765911, 0.145098, 0, 1, 1,
0.5128481, -0.5261075, 1.187571, 0.1529412, 0, 1, 1,
0.5131072, -0.363657, 1.357039, 0.1568628, 0, 1, 1,
0.5153137, 1.989503, 0.5237914, 0.1647059, 0, 1, 1,
0.5204172, 0.7580819, 1.024447, 0.1686275, 0, 1, 1,
0.525066, 0.4280825, 0.6701114, 0.1764706, 0, 1, 1,
0.5286392, 1.319558, 0.4187974, 0.1803922, 0, 1, 1,
0.5293587, -2.776521, 3.052951, 0.1882353, 0, 1, 1,
0.5303233, 0.3383885, 2.691697, 0.1921569, 0, 1, 1,
0.5332977, 1.503565, -0.4013216, 0.2, 0, 1, 1,
0.5335889, 0.1264458, 1.451108, 0.2078431, 0, 1, 1,
0.5339155, -0.9190577, 3.05729, 0.2117647, 0, 1, 1,
0.5400234, -0.7454774, 3.101475, 0.2196078, 0, 1, 1,
0.5478684, 1.58561, -1.180307, 0.2235294, 0, 1, 1,
0.5481873, -0.2927077, 1.235041, 0.2313726, 0, 1, 1,
0.5491925, -2.011263, 2.382362, 0.2352941, 0, 1, 1,
0.549211, -0.1112578, 0.8395135, 0.2431373, 0, 1, 1,
0.5516711, 1.551572, 1.441178, 0.2470588, 0, 1, 1,
0.5525956, -1.073955, 2.606837, 0.254902, 0, 1, 1,
0.5526288, 1.204633, 0.5135663, 0.2588235, 0, 1, 1,
0.554355, -0.9527712, 3.137211, 0.2666667, 0, 1, 1,
0.5564077, 0.3393787, -0.8201631, 0.2705882, 0, 1, 1,
0.5566447, 2.315054, -1.378342, 0.2784314, 0, 1, 1,
0.5571921, -1.301497, 3.567767, 0.282353, 0, 1, 1,
0.5626614, 1.590229, 0.3879524, 0.2901961, 0, 1, 1,
0.563845, 2.055778, 1.006897, 0.2941177, 0, 1, 1,
0.5641311, 1.596354, -0.4492677, 0.3019608, 0, 1, 1,
0.5697628, -0.1471867, 3.111448, 0.3098039, 0, 1, 1,
0.5725301, 0.4701077, 0.3551556, 0.3137255, 0, 1, 1,
0.5736862, 1.28463, 0.9140975, 0.3215686, 0, 1, 1,
0.574389, 0.813205, 0.8734077, 0.3254902, 0, 1, 1,
0.5747712, -0.9430189, 0.7242588, 0.3333333, 0, 1, 1,
0.5774709, 0.04621697, 1.141214, 0.3372549, 0, 1, 1,
0.5783735, 0.5612887, 0.763485, 0.345098, 0, 1, 1,
0.5843506, -0.6977962, 0.9132166, 0.3490196, 0, 1, 1,
0.5952883, -0.8160331, 3.112956, 0.3568628, 0, 1, 1,
0.599253, 0.2468362, 2.297565, 0.3607843, 0, 1, 1,
0.599454, 1.738921, 0.008974593, 0.3686275, 0, 1, 1,
0.602512, -0.5007161, 1.508119, 0.372549, 0, 1, 1,
0.6084085, 0.2726602, 0.8097652, 0.3803922, 0, 1, 1,
0.6084825, 0.7506106, -0.4955194, 0.3843137, 0, 1, 1,
0.6137551, -1.258849, 1.404672, 0.3921569, 0, 1, 1,
0.622705, -1.601252, 1.662924, 0.3960784, 0, 1, 1,
0.6229927, 0.8792387, 1.005002, 0.4039216, 0, 1, 1,
0.6231259, 1.314623, -0.4624377, 0.4117647, 0, 1, 1,
0.6235529, 1.671418, 1.515938, 0.4156863, 0, 1, 1,
0.6294748, -0.3915601, 0.2943004, 0.4235294, 0, 1, 1,
0.6324838, 0.1263933, 1.029981, 0.427451, 0, 1, 1,
0.6364989, 0.6996757, 0.01334451, 0.4352941, 0, 1, 1,
0.6377037, -1.08512, 1.681714, 0.4392157, 0, 1, 1,
0.6407884, 2.038042, 0.3279585, 0.4470588, 0, 1, 1,
0.6424587, 0.7424123, 2.409774, 0.4509804, 0, 1, 1,
0.6435563, 0.4624352, -0.6088801, 0.4588235, 0, 1, 1,
0.6453893, -0.3270624, 0.931756, 0.4627451, 0, 1, 1,
0.6517575, 0.1990354, -1.167762, 0.4705882, 0, 1, 1,
0.6522009, 0.04039359, 1.702762, 0.4745098, 0, 1, 1,
0.653914, 1.065995, -0.2299642, 0.4823529, 0, 1, 1,
0.6578737, -0.6205101, 3.574155, 0.4862745, 0, 1, 1,
0.6642424, 0.4663178, 0.3085715, 0.4941176, 0, 1, 1,
0.6652452, 1.299389, 2.942871, 0.5019608, 0, 1, 1,
0.6666145, 0.3826698, 2.31003, 0.5058824, 0, 1, 1,
0.669234, -0.4244499, 1.328795, 0.5137255, 0, 1, 1,
0.6699116, 0.9505683, 1.404181, 0.5176471, 0, 1, 1,
0.6725519, -0.08329955, 1.177651, 0.5254902, 0, 1, 1,
0.6767864, -0.3523513, 1.536384, 0.5294118, 0, 1, 1,
0.6835583, -2.46021, 2.63473, 0.5372549, 0, 1, 1,
0.6865634, -0.01877258, 0.8937017, 0.5411765, 0, 1, 1,
0.6883891, -0.6870596, 2.908668, 0.5490196, 0, 1, 1,
0.6915133, 0.1236261, 1.33352, 0.5529412, 0, 1, 1,
0.6973203, -1.138832, 3.18947, 0.5607843, 0, 1, 1,
0.6978778, -0.865203, 2.866399, 0.5647059, 0, 1, 1,
0.7006236, -1.223232, 2.755103, 0.572549, 0, 1, 1,
0.7008416, -1.037177, 3.716093, 0.5764706, 0, 1, 1,
0.7018501, 0.01384549, 1.649351, 0.5843138, 0, 1, 1,
0.7023669, -1.155313, 3.725418, 0.5882353, 0, 1, 1,
0.7043285, -0.03245423, 1.993131, 0.5960785, 0, 1, 1,
0.7047498, -0.8603924, 3.621274, 0.6039216, 0, 1, 1,
0.7051835, -0.2555474, 2.310636, 0.6078432, 0, 1, 1,
0.7071868, 0.1526932, 0.5912365, 0.6156863, 0, 1, 1,
0.7114642, 0.4150599, 1.59135, 0.6196079, 0, 1, 1,
0.7121316, -1.014564, 3.370813, 0.627451, 0, 1, 1,
0.7229478, 0.04717869, 3.156504, 0.6313726, 0, 1, 1,
0.7236136, -1.832731, 1.273118, 0.6392157, 0, 1, 1,
0.7277936, -1.508026, 2.106216, 0.6431373, 0, 1, 1,
0.7300468, 0.6940774, 0.4536057, 0.6509804, 0, 1, 1,
0.7321077, 0.7622224, -0.1699423, 0.654902, 0, 1, 1,
0.7340838, -0.2860448, 1.766961, 0.6627451, 0, 1, 1,
0.73438, 0.9594949, 0.1809569, 0.6666667, 0, 1, 1,
0.7368368, -0.02809683, 1.129718, 0.6745098, 0, 1, 1,
0.7410862, -0.5705538, 2.176313, 0.6784314, 0, 1, 1,
0.744576, -1.200217, 1.827429, 0.6862745, 0, 1, 1,
0.75084, -1.305534, 2.440123, 0.6901961, 0, 1, 1,
0.7529342, 0.007746344, 0.2282751, 0.6980392, 0, 1, 1,
0.756643, 1.282706, 1.424298, 0.7058824, 0, 1, 1,
0.7576531, 0.4627828, 1.263511, 0.7098039, 0, 1, 1,
0.7608579, 0.7177379, 0.9745585, 0.7176471, 0, 1, 1,
0.7626649, -0.2460638, 2.762069, 0.7215686, 0, 1, 1,
0.7646527, 1.587298, 0.0576844, 0.7294118, 0, 1, 1,
0.7670559, -0.02536808, 1.012909, 0.7333333, 0, 1, 1,
0.7698099, 0.3327754, 2.283976, 0.7411765, 0, 1, 1,
0.7731447, 0.1733077, 0.1705921, 0.7450981, 0, 1, 1,
0.7731954, -1.676691, 3.379606, 0.7529412, 0, 1, 1,
0.7756483, 0.4536897, -0.02044244, 0.7568628, 0, 1, 1,
0.7812601, -0.7411719, 0.836271, 0.7647059, 0, 1, 1,
0.7864757, -0.5751091, 2.968873, 0.7686275, 0, 1, 1,
0.7865238, -0.6647325, 4.562076, 0.7764706, 0, 1, 1,
0.7875236, 0.2883151, 2.280028, 0.7803922, 0, 1, 1,
0.7891719, 1.116921, 1.976448, 0.7882353, 0, 1, 1,
0.7911497, -0.4931418, 1.159554, 0.7921569, 0, 1, 1,
0.8042838, 0.2964316, 0.934099, 0.8, 0, 1, 1,
0.8046302, 0.9821535, 0.1109773, 0.8078431, 0, 1, 1,
0.8048166, 1.570599, 0.9014852, 0.8117647, 0, 1, 1,
0.8065224, -0.5224183, 3.304108, 0.8196079, 0, 1, 1,
0.8109838, -1.184119, 2.282364, 0.8235294, 0, 1, 1,
0.8159415, -1.486512, 2.964648, 0.8313726, 0, 1, 1,
0.8165319, 0.6250413, 0.1661533, 0.8352941, 0, 1, 1,
0.8175799, 0.4106757, 0.3070694, 0.8431373, 0, 1, 1,
0.818401, -0.381021, 2.291355, 0.8470588, 0, 1, 1,
0.8194852, -0.1073801, 2.12461, 0.854902, 0, 1, 1,
0.8202858, 0.510956, -0.1829904, 0.8588235, 0, 1, 1,
0.8215364, 1.873834, -0.1505339, 0.8666667, 0, 1, 1,
0.8219732, -0.9808246, 2.878297, 0.8705882, 0, 1, 1,
0.8272349, 0.5223722, 1.423291, 0.8784314, 0, 1, 1,
0.831693, 2.349556, 0.2262182, 0.8823529, 0, 1, 1,
0.8325908, -0.1846451, 1.691343, 0.8901961, 0, 1, 1,
0.8348994, 0.4851746, 0.3876335, 0.8941177, 0, 1, 1,
0.8408656, -0.6937514, 1.171296, 0.9019608, 0, 1, 1,
0.8440483, -0.8842325, 1.849367, 0.9098039, 0, 1, 1,
0.8466662, 0.6880295, -0.8906131, 0.9137255, 0, 1, 1,
0.8489833, 0.7764558, 0.5189915, 0.9215686, 0, 1, 1,
0.8585269, 0.6060764, -0.203722, 0.9254902, 0, 1, 1,
0.8608069, -1.357079, 2.839513, 0.9333333, 0, 1, 1,
0.861234, 2.6967, 0.07233158, 0.9372549, 0, 1, 1,
0.869992, -0.3476782, 1.534396, 0.945098, 0, 1, 1,
0.8716503, -0.5320896, 2.745749, 0.9490196, 0, 1, 1,
0.8738534, -0.08273646, 2.703731, 0.9568627, 0, 1, 1,
0.8781584, 0.5288304, 1.387952, 0.9607843, 0, 1, 1,
0.8817137, -2.604656, 0.6099759, 0.9686275, 0, 1, 1,
0.8833582, -0.6190755, 3.479697, 0.972549, 0, 1, 1,
0.8840387, 0.5623227, -0.257037, 0.9803922, 0, 1, 1,
0.8879384, 0.2872169, 1.165079, 0.9843137, 0, 1, 1,
0.8959625, 0.06909066, 1.102207, 0.9921569, 0, 1, 1,
0.899577, 0.1391246, 4.072749, 0.9960784, 0, 1, 1,
0.912785, 0.3245026, 0.6046544, 1, 0, 0.9960784, 1,
0.9155117, -1.021415, 1.605282, 1, 0, 0.9882353, 1,
0.9220645, -1.371399, 3.447964, 1, 0, 0.9843137, 1,
0.9291103, -1.62183, 1.305144, 1, 0, 0.9764706, 1,
0.934058, 1.172169, -0.05695582, 1, 0, 0.972549, 1,
0.9383891, -0.9101033, 1.371372, 1, 0, 0.9647059, 1,
0.9510969, -0.1060648, 2.472794, 1, 0, 0.9607843, 1,
0.962499, 0.8456524, 1.811102, 1, 0, 0.9529412, 1,
0.9658223, 1.617013, -0.001917939, 1, 0, 0.9490196, 1,
0.9663928, 0.3869746, 0.109248, 1, 0, 0.9411765, 1,
0.9677634, 0.3498102, 1.258736, 1, 0, 0.9372549, 1,
0.9818432, 0.2665235, 2.546638, 1, 0, 0.9294118, 1,
0.9886392, 0.1817192, 2.37911, 1, 0, 0.9254902, 1,
0.998476, -0.1447334, 2.361479, 1, 0, 0.9176471, 1,
0.9998989, -1.604528, 3.063979, 1, 0, 0.9137255, 1,
1.018112, -0.3714145, 0.9829119, 1, 0, 0.9058824, 1,
1.019154, -0.3634256, 2.186975, 1, 0, 0.9019608, 1,
1.021007, -0.3054722, 2.980149, 1, 0, 0.8941177, 1,
1.029309, -0.5734686, 2.062269, 1, 0, 0.8862745, 1,
1.041822, -0.8612172, 2.363234, 1, 0, 0.8823529, 1,
1.043558, 0.323632, 0.202727, 1, 0, 0.8745098, 1,
1.045052, -1.454199, 1.773946, 1, 0, 0.8705882, 1,
1.046051, 0.8822233, 0.5361131, 1, 0, 0.8627451, 1,
1.049985, -0.1792576, 2.574451, 1, 0, 0.8588235, 1,
1.052486, -0.6132773, 1.157858, 1, 0, 0.8509804, 1,
1.052637, 1.663382, 1.146037, 1, 0, 0.8470588, 1,
1.058645, 0.203488, 0.6111909, 1, 0, 0.8392157, 1,
1.06303, -0.4517206, 0.9384774, 1, 0, 0.8352941, 1,
1.065623, -0.3213905, 1.159438, 1, 0, 0.827451, 1,
1.068859, 0.2580202, 0.3328366, 1, 0, 0.8235294, 1,
1.072394, 1.359414, 1.180899, 1, 0, 0.8156863, 1,
1.078947, 0.01074163, 0.9364927, 1, 0, 0.8117647, 1,
1.081452, 0.06744476, -1.224719, 1, 0, 0.8039216, 1,
1.099303, 0.126811, 2.435108, 1, 0, 0.7960784, 1,
1.10078, -2.317701, 2.084805, 1, 0, 0.7921569, 1,
1.100862, -1.608832, 0.5216171, 1, 0, 0.7843137, 1,
1.112515, -1.261623, 1.695411, 1, 0, 0.7803922, 1,
1.117143, -1.373438, 3.41452, 1, 0, 0.772549, 1,
1.128451, -0.5657712, 2.304971, 1, 0, 0.7686275, 1,
1.132084, 0.2156471, 0.01897916, 1, 0, 0.7607843, 1,
1.138422, -0.05377045, 1.801486, 1, 0, 0.7568628, 1,
1.140899, -2.620275, 1.427394, 1, 0, 0.7490196, 1,
1.150588, 0.8782355, 0.7490272, 1, 0, 0.7450981, 1,
1.151366, -0.8566133, 1.825865, 1, 0, 0.7372549, 1,
1.155529, -1.147715, 2.457674, 1, 0, 0.7333333, 1,
1.157325, 1.721178, 0.08759898, 1, 0, 0.7254902, 1,
1.16457, -0.2922043, 1.46618, 1, 0, 0.7215686, 1,
1.165341, 0.843603, 0.9376316, 1, 0, 0.7137255, 1,
1.1676, -0.9836907, 1.205622, 1, 0, 0.7098039, 1,
1.170509, 0.6026356, 1.338099, 1, 0, 0.7019608, 1,
1.174882, -0.9144691, 1.321238, 1, 0, 0.6941177, 1,
1.176124, 2.398667, 0.3160595, 1, 0, 0.6901961, 1,
1.177023, 0.1578173, 1.84308, 1, 0, 0.682353, 1,
1.187155, -0.8430275, 2.836522, 1, 0, 0.6784314, 1,
1.18803, 0.6486344, -0.3813893, 1, 0, 0.6705883, 1,
1.188038, 0.4247364, 0.4237305, 1, 0, 0.6666667, 1,
1.191808, -1.901832, 2.816552, 1, 0, 0.6588235, 1,
1.195793, -0.822844, 2.18965, 1, 0, 0.654902, 1,
1.197054, -0.7011997, 2.673583, 1, 0, 0.6470588, 1,
1.200374, -1.617128, 3.010185, 1, 0, 0.6431373, 1,
1.202774, -0.1633113, 2.498557, 1, 0, 0.6352941, 1,
1.206745, -0.7585503, 3.032289, 1, 0, 0.6313726, 1,
1.224993, 1.043518, 2.076504, 1, 0, 0.6235294, 1,
1.229103, -0.4335763, 1.856257, 1, 0, 0.6196079, 1,
1.233799, -1.94375, -0.05545211, 1, 0, 0.6117647, 1,
1.234124, 0.5633239, 1.310876, 1, 0, 0.6078432, 1,
1.235101, 2.022005, -0.3208523, 1, 0, 0.6, 1,
1.252987, -1.622694, 2.49044, 1, 0, 0.5921569, 1,
1.261073, -1.941393, 1.422156, 1, 0, 0.5882353, 1,
1.267496, -0.3950866, 3.452668, 1, 0, 0.5803922, 1,
1.268979, 1.170636, 1.745213, 1, 0, 0.5764706, 1,
1.269622, -0.7737551, 2.206204, 1, 0, 0.5686275, 1,
1.277214, 1.950822, 1.388539, 1, 0, 0.5647059, 1,
1.277441, 1.138003, 0.7224823, 1, 0, 0.5568628, 1,
1.278121, 0.654758, 1.068925, 1, 0, 0.5529412, 1,
1.278606, -0.03733131, 1.494218, 1, 0, 0.5450981, 1,
1.288778, 1.701721, -0.3108378, 1, 0, 0.5411765, 1,
1.293763, -1.305254, 1.020713, 1, 0, 0.5333334, 1,
1.295319, 0.4262077, 2.205461, 1, 0, 0.5294118, 1,
1.298226, -0.1383711, 0.9727846, 1, 0, 0.5215687, 1,
1.301102, 0.5486137, 1.561447, 1, 0, 0.5176471, 1,
1.301161, -1.128817, 2.824144, 1, 0, 0.509804, 1,
1.302011, 1.472335, 0.7143121, 1, 0, 0.5058824, 1,
1.302492, 0.9142715, 0.8261005, 1, 0, 0.4980392, 1,
1.305524, 0.5034264, 0.05245615, 1, 0, 0.4901961, 1,
1.307632, 0.5127891, 0.1192563, 1, 0, 0.4862745, 1,
1.308825, 1.099416, -0.3278506, 1, 0, 0.4784314, 1,
1.310794, -0.4186809, -0.7317719, 1, 0, 0.4745098, 1,
1.317432, 1.007734, 2.013136, 1, 0, 0.4666667, 1,
1.318033, 0.03112964, 1.018937, 1, 0, 0.4627451, 1,
1.337755, 1.327882, 0.4061919, 1, 0, 0.454902, 1,
1.352009, 2.73037, 1.810733, 1, 0, 0.4509804, 1,
1.359634, 1.612404, 2.388044, 1, 0, 0.4431373, 1,
1.366235, 0.3104863, 0.8098126, 1, 0, 0.4392157, 1,
1.366349, -0.05667941, 1.627437, 1, 0, 0.4313726, 1,
1.375882, -1.370018, 0.8027625, 1, 0, 0.427451, 1,
1.376307, 0.2433867, 1.145938, 1, 0, 0.4196078, 1,
1.379151, 0.6491485, 1.456597, 1, 0, 0.4156863, 1,
1.38536, -0.4381492, 1.127251, 1, 0, 0.4078431, 1,
1.387273, -0.2028557, 2.21982, 1, 0, 0.4039216, 1,
1.395283, 1.409363, -0.4903866, 1, 0, 0.3960784, 1,
1.415897, -0.7180568, 1.290003, 1, 0, 0.3882353, 1,
1.425099, -0.2061434, 1.762151, 1, 0, 0.3843137, 1,
1.45603, -0.844733, 0.8515556, 1, 0, 0.3764706, 1,
1.467333, -1.580739, 3.03131, 1, 0, 0.372549, 1,
1.472125, -2.948205, 3.585778, 1, 0, 0.3647059, 1,
1.476484, -0.9338334, 2.436164, 1, 0, 0.3607843, 1,
1.477481, 1.27014, 1.143766, 1, 0, 0.3529412, 1,
1.478501, -0.2461465, 2.045724, 1, 0, 0.3490196, 1,
1.479405, 1.251207, 0.07523438, 1, 0, 0.3411765, 1,
1.480178, 0.4384267, 1.716342, 1, 0, 0.3372549, 1,
1.489259, 1.668626, 0.04505491, 1, 0, 0.3294118, 1,
1.500207, 0.4602872, 1.415911, 1, 0, 0.3254902, 1,
1.505759, 0.4315523, 0.2854865, 1, 0, 0.3176471, 1,
1.50753, 1.281165, -0.3384855, 1, 0, 0.3137255, 1,
1.512321, 0.0681456, 1.27302, 1, 0, 0.3058824, 1,
1.516128, 2.597872, 1.174523, 1, 0, 0.2980392, 1,
1.539388, 0.4123331, 0.01894685, 1, 0, 0.2941177, 1,
1.556472, 0.392445, 1.05421, 1, 0, 0.2862745, 1,
1.567428, -0.255425, 1.981521, 1, 0, 0.282353, 1,
1.573589, -0.5109823, 2.689062, 1, 0, 0.2745098, 1,
1.589717, 1.078799, 0.2750891, 1, 0, 0.2705882, 1,
1.589789, 1.492142, -0.9570762, 1, 0, 0.2627451, 1,
1.599576, -0.2667845, 1.537711, 1, 0, 0.2588235, 1,
1.634201, 1.143025, -0.07244078, 1, 0, 0.2509804, 1,
1.635651, -0.2533584, 1.875932, 1, 0, 0.2470588, 1,
1.662383, -0.6779494, 1.897921, 1, 0, 0.2392157, 1,
1.666119, 0.7054031, -0.9412377, 1, 0, 0.2352941, 1,
1.668678, 0.3729275, 1.376958, 1, 0, 0.227451, 1,
1.691388, 1.123116, 2.541649, 1, 0, 0.2235294, 1,
1.698359, -1.130432, 1.505547, 1, 0, 0.2156863, 1,
1.716407, 0.4822146, 0.6866077, 1, 0, 0.2117647, 1,
1.734774, -0.5559903, 2.242179, 1, 0, 0.2039216, 1,
1.736261, 1.269384, 1.883202, 1, 0, 0.1960784, 1,
1.778527, -0.2822994, 1.032732, 1, 0, 0.1921569, 1,
1.783201, 0.476622, 2.443706, 1, 0, 0.1843137, 1,
1.808474, -0.5357428, 1.547046, 1, 0, 0.1803922, 1,
1.844722, -1.807478, 1.532898, 1, 0, 0.172549, 1,
1.850313, -0.8422427, 1.452928, 1, 0, 0.1686275, 1,
1.853902, -0.6268097, 2.280457, 1, 0, 0.1607843, 1,
1.854897, 0.04063473, 0.7958568, 1, 0, 0.1568628, 1,
1.872787, 1.896817, 2.476495, 1, 0, 0.1490196, 1,
1.873336, 0.1811055, 1.67679, 1, 0, 0.145098, 1,
1.905733, -0.1216751, 0.9128071, 1, 0, 0.1372549, 1,
1.916117, 0.7786648, 0.6024484, 1, 0, 0.1333333, 1,
1.930713, 0.4340499, 0.968219, 1, 0, 0.1254902, 1,
1.944938, 0.7299939, 0.4246765, 1, 0, 0.1215686, 1,
1.94688, -2.659844, 2.861123, 1, 0, 0.1137255, 1,
1.951445, -1.13214, 0.9093508, 1, 0, 0.1098039, 1,
1.964852, 0.5000651, -0.4546636, 1, 0, 0.1019608, 1,
1.986593, 0.2532844, 1.393885, 1, 0, 0.09411765, 1,
2.016315, -0.6214135, 2.601809, 1, 0, 0.09019608, 1,
2.027086, -0.950205, 2.726007, 1, 0, 0.08235294, 1,
2.05713, -0.8121204, 2.290997, 1, 0, 0.07843138, 1,
2.065654, -0.2397828, 2.138375, 1, 0, 0.07058824, 1,
2.115113, 0.9865089, 2.290051, 1, 0, 0.06666667, 1,
2.137838, 0.8196452, 2.311706, 1, 0, 0.05882353, 1,
2.158517, 1.583694, -0.1642993, 1, 0, 0.05490196, 1,
2.368592, 0.7438508, 1.467903, 1, 0, 0.04705882, 1,
2.437794, 2.125241, 2.421092, 1, 0, 0.04313726, 1,
2.479335, -0.6123106, 1.076559, 1, 0, 0.03529412, 1,
2.486905, 0.1367115, 0.5056104, 1, 0, 0.03137255, 1,
2.52804, 0.3023314, 2.411405, 1, 0, 0.02352941, 1,
3.033933, -1.425349, 0.4039661, 1, 0, 0.01960784, 1,
3.064397, 0.3238572, 0.3770658, 1, 0, 0.01176471, 1,
3.436757, -1.272448, 0.947314, 1, 0, 0.007843138, 1
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
-0.002782106, -4.007524, -7.588468, 0, -0.5, 0.5, 0.5,
-0.002782106, -4.007524, -7.588468, 1, -0.5, 0.5, 0.5,
-0.002782106, -4.007524, -7.588468, 1, 1.5, 0.5, 0.5,
-0.002782106, -4.007524, -7.588468, 0, 1.5, 0.5, 0.5
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
-4.608325, 0.1766276, -7.588468, 0, -0.5, 0.5, 0.5,
-4.608325, 0.1766276, -7.588468, 1, -0.5, 0.5, 0.5,
-4.608325, 0.1766276, -7.588468, 1, 1.5, 0.5, 0.5,
-4.608325, 0.1766276, -7.588468, 0, 1.5, 0.5, 0.5
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
-4.608325, -4.007524, -0.252501, 0, -0.5, 0.5, 0.5,
-4.608325, -4.007524, -0.252501, 1, -0.5, 0.5, 0.5,
-4.608325, -4.007524, -0.252501, 1, 1.5, 0.5, 0.5,
-4.608325, -4.007524, -0.252501, 0, 1.5, 0.5, 0.5
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
-3, -3.04195, -5.895552,
3, -3.04195, -5.895552,
-3, -3.04195, -5.895552,
-3, -3.202879, -6.177705,
-2, -3.04195, -5.895552,
-2, -3.202879, -6.177705,
-1, -3.04195, -5.895552,
-1, -3.202879, -6.177705,
0, -3.04195, -5.895552,
0, -3.202879, -6.177705,
1, -3.04195, -5.895552,
1, -3.202879, -6.177705,
2, -3.04195, -5.895552,
2, -3.202879, -6.177705,
3, -3.04195, -5.895552,
3, -3.202879, -6.177705
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
-3, -3.524737, -6.74201, 0, -0.5, 0.5, 0.5,
-3, -3.524737, -6.74201, 1, -0.5, 0.5, 0.5,
-3, -3.524737, -6.74201, 1, 1.5, 0.5, 0.5,
-3, -3.524737, -6.74201, 0, 1.5, 0.5, 0.5,
-2, -3.524737, -6.74201, 0, -0.5, 0.5, 0.5,
-2, -3.524737, -6.74201, 1, -0.5, 0.5, 0.5,
-2, -3.524737, -6.74201, 1, 1.5, 0.5, 0.5,
-2, -3.524737, -6.74201, 0, 1.5, 0.5, 0.5,
-1, -3.524737, -6.74201, 0, -0.5, 0.5, 0.5,
-1, -3.524737, -6.74201, 1, -0.5, 0.5, 0.5,
-1, -3.524737, -6.74201, 1, 1.5, 0.5, 0.5,
-1, -3.524737, -6.74201, 0, 1.5, 0.5, 0.5,
0, -3.524737, -6.74201, 0, -0.5, 0.5, 0.5,
0, -3.524737, -6.74201, 1, -0.5, 0.5, 0.5,
0, -3.524737, -6.74201, 1, 1.5, 0.5, 0.5,
0, -3.524737, -6.74201, 0, 1.5, 0.5, 0.5,
1, -3.524737, -6.74201, 0, -0.5, 0.5, 0.5,
1, -3.524737, -6.74201, 1, -0.5, 0.5, 0.5,
1, -3.524737, -6.74201, 1, 1.5, 0.5, 0.5,
1, -3.524737, -6.74201, 0, 1.5, 0.5, 0.5,
2, -3.524737, -6.74201, 0, -0.5, 0.5, 0.5,
2, -3.524737, -6.74201, 1, -0.5, 0.5, 0.5,
2, -3.524737, -6.74201, 1, 1.5, 0.5, 0.5,
2, -3.524737, -6.74201, 0, 1.5, 0.5, 0.5,
3, -3.524737, -6.74201, 0, -0.5, 0.5, 0.5,
3, -3.524737, -6.74201, 1, -0.5, 0.5, 0.5,
3, -3.524737, -6.74201, 1, 1.5, 0.5, 0.5,
3, -3.524737, -6.74201, 0, 1.5, 0.5, 0.5
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
-3.545507, -2, -5.895552,
-3.545507, 3, -5.895552,
-3.545507, -2, -5.895552,
-3.722643, -2, -6.177705,
-3.545507, -1, -5.895552,
-3.722643, -1, -6.177705,
-3.545507, 0, -5.895552,
-3.722643, 0, -6.177705,
-3.545507, 1, -5.895552,
-3.722643, 1, -6.177705,
-3.545507, 2, -5.895552,
-3.722643, 2, -6.177705,
-3.545507, 3, -5.895552,
-3.722643, 3, -6.177705
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
-4.076916, -2, -6.74201, 0, -0.5, 0.5, 0.5,
-4.076916, -2, -6.74201, 1, -0.5, 0.5, 0.5,
-4.076916, -2, -6.74201, 1, 1.5, 0.5, 0.5,
-4.076916, -2, -6.74201, 0, 1.5, 0.5, 0.5,
-4.076916, -1, -6.74201, 0, -0.5, 0.5, 0.5,
-4.076916, -1, -6.74201, 1, -0.5, 0.5, 0.5,
-4.076916, -1, -6.74201, 1, 1.5, 0.5, 0.5,
-4.076916, -1, -6.74201, 0, 1.5, 0.5, 0.5,
-4.076916, 0, -6.74201, 0, -0.5, 0.5, 0.5,
-4.076916, 0, -6.74201, 1, -0.5, 0.5, 0.5,
-4.076916, 0, -6.74201, 1, 1.5, 0.5, 0.5,
-4.076916, 0, -6.74201, 0, 1.5, 0.5, 0.5,
-4.076916, 1, -6.74201, 0, -0.5, 0.5, 0.5,
-4.076916, 1, -6.74201, 1, -0.5, 0.5, 0.5,
-4.076916, 1, -6.74201, 1, 1.5, 0.5, 0.5,
-4.076916, 1, -6.74201, 0, 1.5, 0.5, 0.5,
-4.076916, 2, -6.74201, 0, -0.5, 0.5, 0.5,
-4.076916, 2, -6.74201, 1, -0.5, 0.5, 0.5,
-4.076916, 2, -6.74201, 1, 1.5, 0.5, 0.5,
-4.076916, 2, -6.74201, 0, 1.5, 0.5, 0.5,
-4.076916, 3, -6.74201, 0, -0.5, 0.5, 0.5,
-4.076916, 3, -6.74201, 1, -0.5, 0.5, 0.5,
-4.076916, 3, -6.74201, 1, 1.5, 0.5, 0.5,
-4.076916, 3, -6.74201, 0, 1.5, 0.5, 0.5
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
-3.545507, -3.04195, -4,
-3.545507, -3.04195, 4,
-3.545507, -3.04195, -4,
-3.722643, -3.202879, -4,
-3.545507, -3.04195, -2,
-3.722643, -3.202879, -2,
-3.545507, -3.04195, 0,
-3.722643, -3.202879, 0,
-3.545507, -3.04195, 2,
-3.722643, -3.202879, 2,
-3.545507, -3.04195, 4,
-3.722643, -3.202879, 4
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
-4.076916, -3.524737, -4, 0, -0.5, 0.5, 0.5,
-4.076916, -3.524737, -4, 1, -0.5, 0.5, 0.5,
-4.076916, -3.524737, -4, 1, 1.5, 0.5, 0.5,
-4.076916, -3.524737, -4, 0, 1.5, 0.5, 0.5,
-4.076916, -3.524737, -2, 0, -0.5, 0.5, 0.5,
-4.076916, -3.524737, -2, 1, -0.5, 0.5, 0.5,
-4.076916, -3.524737, -2, 1, 1.5, 0.5, 0.5,
-4.076916, -3.524737, -2, 0, 1.5, 0.5, 0.5,
-4.076916, -3.524737, 0, 0, -0.5, 0.5, 0.5,
-4.076916, -3.524737, 0, 1, -0.5, 0.5, 0.5,
-4.076916, -3.524737, 0, 1, 1.5, 0.5, 0.5,
-4.076916, -3.524737, 0, 0, 1.5, 0.5, 0.5,
-4.076916, -3.524737, 2, 0, -0.5, 0.5, 0.5,
-4.076916, -3.524737, 2, 1, -0.5, 0.5, 0.5,
-4.076916, -3.524737, 2, 1, 1.5, 0.5, 0.5,
-4.076916, -3.524737, 2, 0, 1.5, 0.5, 0.5,
-4.076916, -3.524737, 4, 0, -0.5, 0.5, 0.5,
-4.076916, -3.524737, 4, 1, -0.5, 0.5, 0.5,
-4.076916, -3.524737, 4, 1, 1.5, 0.5, 0.5,
-4.076916, -3.524737, 4, 0, 1.5, 0.5, 0.5
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
-3.545507, -3.04195, -5.895552,
-3.545507, 3.395206, -5.895552,
-3.545507, -3.04195, 5.39055,
-3.545507, 3.395206, 5.39055,
-3.545507, -3.04195, -5.895552,
-3.545507, -3.04195, 5.39055,
-3.545507, 3.395206, -5.895552,
-3.545507, 3.395206, 5.39055,
-3.545507, -3.04195, -5.895552,
3.539943, -3.04195, -5.895552,
-3.545507, -3.04195, 5.39055,
3.539943, -3.04195, 5.39055,
-3.545507, 3.395206, -5.895552,
3.539943, 3.395206, -5.895552,
-3.545507, 3.395206, 5.39055,
3.539943, 3.395206, 5.39055,
3.539943, -3.04195, -5.895552,
3.539943, 3.395206, -5.895552,
3.539943, -3.04195, 5.39055,
3.539943, 3.395206, 5.39055,
3.539943, -3.04195, -5.895552,
3.539943, -3.04195, 5.39055,
3.539943, 3.395206, -5.895552,
3.539943, 3.395206, 5.39055
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
var radius = 7.902492;
var distance = 35.15908;
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
mvMatrix.translate( 0.002782106, -0.1766276, 0.252501 );
mvMatrix.scale( 1.205898, 1.327345, 0.7570664 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.15908);
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
fludioxonil<-read.table("fludioxonil.xyz")
```

```
## Error in read.table("fludioxonil.xyz"): no lines available in input
```

```r
x<-fludioxonil$V2
```

```
## Error in eval(expr, envir, enclos): object 'fludioxonil' not found
```

```r
y<-fludioxonil$V3
```

```
## Error in eval(expr, envir, enclos): object 'fludioxonil' not found
```

```r
z<-fludioxonil$V4
```

```
## Error in eval(expr, envir, enclos): object 'fludioxonil' not found
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
-3.442321, 0.2294754, -1.23136, 0, 0, 1, 1, 1,
-3.209337, -0.2939504, -2.026459, 1, 0, 0, 1, 1,
-3.14361, -2.010616, 0.193464, 1, 0, 0, 1, 1,
-2.967749, 0.1307427, -1.879581, 1, 0, 0, 1, 1,
-2.880183, -1.101221, -2.547631, 1, 0, 0, 1, 1,
-2.743262, -1.163973, -4.263871, 1, 0, 0, 1, 1,
-2.729281, -0.3246939, 1.072757, 0, 0, 0, 1, 1,
-2.672282, 0.2213162, -2.07947, 0, 0, 0, 1, 1,
-2.609717, 0.7902618, -2.020725, 0, 0, 0, 1, 1,
-2.605208, 0.01646702, -2.30701, 0, 0, 0, 1, 1,
-2.583632, 0.4441209, 0.144685, 0, 0, 0, 1, 1,
-2.565939, 1.870084, 1.717224, 0, 0, 0, 1, 1,
-2.519769, 1.452779, -1.641956, 0, 0, 0, 1, 1,
-2.504705, 0.06329944, -3.142403, 1, 1, 1, 1, 1,
-2.471271, -0.7609205, -3.58743, 1, 1, 1, 1, 1,
-2.451049, -1.172709, -2.665842, 1, 1, 1, 1, 1,
-2.414129, -0.4036944, -1.762331, 1, 1, 1, 1, 1,
-2.397359, -0.9275367, -1.596012, 1, 1, 1, 1, 1,
-2.38871, -0.04274068, -0.3781986, 1, 1, 1, 1, 1,
-2.380291, 1.35896, -1.354018, 1, 1, 1, 1, 1,
-2.36194, -1.768934, -2.662305, 1, 1, 1, 1, 1,
-2.320333, 1.144908, -1.943813, 1, 1, 1, 1, 1,
-2.295477, -0.9152011, -1.294742, 1, 1, 1, 1, 1,
-2.251305, 0.3432829, -0.1274146, 1, 1, 1, 1, 1,
-2.193981, -0.4176006, -1.84764, 1, 1, 1, 1, 1,
-2.156382, -0.2357123, -0.3714995, 1, 1, 1, 1, 1,
-2.153207, -0.8734433, -1.410834, 1, 1, 1, 1, 1,
-2.145797, 0.3476656, -2.029778, 1, 1, 1, 1, 1,
-2.140754, -0.0322172, -2.550076, 0, 0, 1, 1, 1,
-2.118679, -0.5257176, -1.067347, 1, 0, 0, 1, 1,
-2.072994, 0.3621004, -3.022074, 1, 0, 0, 1, 1,
-2.06851, -0.7572546, -1.656938, 1, 0, 0, 1, 1,
-2.051172, -0.04689473, -0.2184184, 1, 0, 0, 1, 1,
-2.044761, -0.05552643, -3.224204, 1, 0, 0, 1, 1,
-2.039125, 1.254268, -1.347068, 0, 0, 0, 1, 1,
-2.038934, 2.042781, -0.7071549, 0, 0, 0, 1, 1,
-2.028837, 0.2306813, -0.02108054, 0, 0, 0, 1, 1,
-2.017886, -1.195877, -2.653106, 0, 0, 0, 1, 1,
-2.013849, 0.00111883, -0.2368335, 0, 0, 0, 1, 1,
-1.99387, 0.9403703, -1.054673, 0, 0, 0, 1, 1,
-1.948085, -0.4649695, -1.448577, 0, 0, 0, 1, 1,
-1.946487, 0.5529903, -1.557582, 1, 1, 1, 1, 1,
-1.945966, -0.008494408, -0.6424438, 1, 1, 1, 1, 1,
-1.924999, 0.3647763, -2.528249, 1, 1, 1, 1, 1,
-1.919648, 0.6528934, -2.074238, 1, 1, 1, 1, 1,
-1.905741, 0.06976777, -1.713402, 1, 1, 1, 1, 1,
-1.904262, -1.094072, -1.715047, 1, 1, 1, 1, 1,
-1.874755, 0.4981779, -0.279552, 1, 1, 1, 1, 1,
-1.864194, 1.070187, -1.000727, 1, 1, 1, 1, 1,
-1.842247, -0.6603419, -2.777258, 1, 1, 1, 1, 1,
-1.806247, -0.6272529, -2.704483, 1, 1, 1, 1, 1,
-1.80581, -1.84624, -1.907433, 1, 1, 1, 1, 1,
-1.799713, -1.87216, -3.011907, 1, 1, 1, 1, 1,
-1.7905, -0.1413366, -2.6978, 1, 1, 1, 1, 1,
-1.770055, 0.2359056, -1.679692, 1, 1, 1, 1, 1,
-1.765515, 1.583, 0.0342738, 1, 1, 1, 1, 1,
-1.761703, 0.09480777, -0.09705184, 0, 0, 1, 1, 1,
-1.75983, 0.3991196, -1.357209, 1, 0, 0, 1, 1,
-1.747301, -0.4703747, -3.521755, 1, 0, 0, 1, 1,
-1.727433, -0.6095027, -2.84413, 1, 0, 0, 1, 1,
-1.719535, -1.328529, -2.808363, 1, 0, 0, 1, 1,
-1.699202, 0.02642243, -0.8631933, 1, 0, 0, 1, 1,
-1.697855, 0.1114683, -1.855146, 0, 0, 0, 1, 1,
-1.692531, -0.6455626, -1.683233, 0, 0, 0, 1, 1,
-1.675043, 0.02321068, -3.854384, 0, 0, 0, 1, 1,
-1.668626, 1.072276, -0.4598082, 0, 0, 0, 1, 1,
-1.648375, -0.2147906, -1.801014, 0, 0, 0, 1, 1,
-1.634237, 3.042308, -0.912152, 0, 0, 0, 1, 1,
-1.627052, -0.1277984, -2.575792, 0, 0, 0, 1, 1,
-1.609679, 1.382338, 0.6012368, 1, 1, 1, 1, 1,
-1.605478, -0.439858, -1.884964, 1, 1, 1, 1, 1,
-1.602284, -0.403401, -1.605747, 1, 1, 1, 1, 1,
-1.57863, 1.602013, -0.4785186, 1, 1, 1, 1, 1,
-1.578287, 0.01438615, -0.8880609, 1, 1, 1, 1, 1,
-1.560443, -0.1875312, -0.9714919, 1, 1, 1, 1, 1,
-1.534626, 0.9014451, -2.156401, 1, 1, 1, 1, 1,
-1.51899, -1.689291, -3.61216, 1, 1, 1, 1, 1,
-1.484336, 0.7797759, -0.1159263, 1, 1, 1, 1, 1,
-1.478496, 1.204368, -0.2923231, 1, 1, 1, 1, 1,
-1.473629, -0.4160234, -1.142481, 1, 1, 1, 1, 1,
-1.471144, 0.2781915, -1.801589, 1, 1, 1, 1, 1,
-1.461201, -1.379181, -2.653398, 1, 1, 1, 1, 1,
-1.449185, -0.5678158, -2.890514, 1, 1, 1, 1, 1,
-1.447727, -1.872994, -1.072992, 1, 1, 1, 1, 1,
-1.445129, -1.070735, -1.174414, 0, 0, 1, 1, 1,
-1.440589, -0.9536233, -1.797815, 1, 0, 0, 1, 1,
-1.437736, -0.8662758, -1.697946, 1, 0, 0, 1, 1,
-1.434017, 0.9537665, -0.6972154, 1, 0, 0, 1, 1,
-1.429222, 0.3247203, -1.457905, 1, 0, 0, 1, 1,
-1.428137, -1.529474, -1.922776, 1, 0, 0, 1, 1,
-1.427286, 1.234985, -1.550386, 0, 0, 0, 1, 1,
-1.427164, -0.3028547, -0.1644177, 0, 0, 0, 1, 1,
-1.421748, -0.4544806, -1.253111, 0, 0, 0, 1, 1,
-1.414679, -0.3140141, -2.308779, 0, 0, 0, 1, 1,
-1.405341, -0.7549855, -0.3310026, 0, 0, 0, 1, 1,
-1.398868, -0.730835, -2.844508, 0, 0, 0, 1, 1,
-1.376038, 0.9353798, -1.084482, 0, 0, 0, 1, 1,
-1.370627, -2.737144, -2.976559, 1, 1, 1, 1, 1,
-1.354454, 0.4348841, 0.5834541, 1, 1, 1, 1, 1,
-1.35442, 1.781727, -1.071826, 1, 1, 1, 1, 1,
-1.320133, 0.1570765, -1.603268, 1, 1, 1, 1, 1,
-1.313158, 0.4817306, -3.649312, 1, 1, 1, 1, 1,
-1.311447, -1.631279, -0.8855453, 1, 1, 1, 1, 1,
-1.303648, 0.3020767, -1.579612, 1, 1, 1, 1, 1,
-1.303399, 1.621069, -1.72861, 1, 1, 1, 1, 1,
-1.30087, 1.217889, 0.5616798, 1, 1, 1, 1, 1,
-1.296786, -2.678345, -3.514642, 1, 1, 1, 1, 1,
-1.295576, 0.56145, 0.2928583, 1, 1, 1, 1, 1,
-1.29168, -2.109137, -2.621533, 1, 1, 1, 1, 1,
-1.290321, -0.1709633, -2.234818, 1, 1, 1, 1, 1,
-1.289357, 0.3484088, -1.566428, 1, 1, 1, 1, 1,
-1.285243, 1.73522, -0.7386501, 1, 1, 1, 1, 1,
-1.2814, 1.344214, -1.006113, 0, 0, 1, 1, 1,
-1.274461, -0.2418092, -2.567641, 1, 0, 0, 1, 1,
-1.268144, -1.476151, -1.646599, 1, 0, 0, 1, 1,
-1.267573, 0.766892, -0.4855709, 1, 0, 0, 1, 1,
-1.258454, 0.1526871, -2.339592, 1, 0, 0, 1, 1,
-1.257865, 1.793924, -2.900046, 1, 0, 0, 1, 1,
-1.253682, 1.111542, -1.816923, 0, 0, 0, 1, 1,
-1.253038, 1.29943, -1.597078, 0, 0, 0, 1, 1,
-1.239639, -1.09241, -2.43492, 0, 0, 0, 1, 1,
-1.235211, 1.037619, 0.2478454, 0, 0, 0, 1, 1,
-1.229365, 2.046275, -0.494062, 0, 0, 0, 1, 1,
-1.221333, 0.1559857, -0.6970987, 0, 0, 0, 1, 1,
-1.200595, -0.4020405, -0.4400639, 0, 0, 0, 1, 1,
-1.191082, 1.793062, -0.1439444, 1, 1, 1, 1, 1,
-1.189906, 2.108218, -2.12666, 1, 1, 1, 1, 1,
-1.187993, 0.9016995, -1.436867, 1, 1, 1, 1, 1,
-1.185208, -1.219419, -1.692876, 1, 1, 1, 1, 1,
-1.178325, -1.205433, -2.228448, 1, 1, 1, 1, 1,
-1.174433, 0.7417459, 0.2595737, 1, 1, 1, 1, 1,
-1.173609, -0.672929, 0.2504279, 1, 1, 1, 1, 1,
-1.171579, 1.070507, -0.1906984, 1, 1, 1, 1, 1,
-1.166475, -0.9745894, -1.670063, 1, 1, 1, 1, 1,
-1.160815, -0.2182664, -2.577204, 1, 1, 1, 1, 1,
-1.160157, -0.4428847, -0.878754, 1, 1, 1, 1, 1,
-1.156764, -1.210877, -1.80174, 1, 1, 1, 1, 1,
-1.14849, 1.19739, -0.2426107, 1, 1, 1, 1, 1,
-1.139047, 0.4449789, -2.830854, 1, 1, 1, 1, 1,
-1.138349, -1.288633, -3.143906, 1, 1, 1, 1, 1,
-1.13031, 1.252792, 0.2760663, 0, 0, 1, 1, 1,
-1.128752, -0.9181677, -3.40283, 1, 0, 0, 1, 1,
-1.127026, -2.216608, -1.316188, 1, 0, 0, 1, 1,
-1.126413, -1.496682, -3.036892, 1, 0, 0, 1, 1,
-1.124372, -1.963993, -2.610038, 1, 0, 0, 1, 1,
-1.102751, -0.2613116, -2.921879, 1, 0, 0, 1, 1,
-1.09051, -0.3457809, -2.394304, 0, 0, 0, 1, 1,
-1.089911, 0.5362704, -2.196702, 0, 0, 0, 1, 1,
-1.089701, 0.4072311, -0.8509332, 0, 0, 0, 1, 1,
-1.085185, 0.1345558, 0.4878451, 0, 0, 0, 1, 1,
-1.078577, 0.3605433, -1.693025, 0, 0, 0, 1, 1,
-1.066872, 0.9051968, -0.8598781, 0, 0, 0, 1, 1,
-1.065385, 0.3300929, -1.524857, 0, 0, 0, 1, 1,
-1.056067, -2.033751, -2.20257, 1, 1, 1, 1, 1,
-1.053844, -1.177139, -3.404994, 1, 1, 1, 1, 1,
-1.048943, 0.07904934, -2.849462, 1, 1, 1, 1, 1,
-1.043198, 0.4107375, -2.490418, 1, 1, 1, 1, 1,
-1.043049, 1.373951, 0.6035413, 1, 1, 1, 1, 1,
-1.042029, 0.09233401, -1.291389, 1, 1, 1, 1, 1,
-1.027787, -1.631292, -3.972924, 1, 1, 1, 1, 1,
-1.022835, 0.476495, -2.425034, 1, 1, 1, 1, 1,
-1.011631, -0.1387492, -1.504842, 1, 1, 1, 1, 1,
-1.009638, -0.425683, 0.2853546, 1, 1, 1, 1, 1,
-1.008523, 2.822184, -0.3638858, 1, 1, 1, 1, 1,
-1.007483, -0.8586715, 0.2968555, 1, 1, 1, 1, 1,
-1.005625, 0.1536882, -0.5049816, 1, 1, 1, 1, 1,
-1.000417, -0.8414223, -2.728191, 1, 1, 1, 1, 1,
-0.9975382, 1.579503, 0.1532919, 1, 1, 1, 1, 1,
-0.9973845, -1.655487, -2.086638, 0, 0, 1, 1, 1,
-0.9927987, -1.882449, -1.778629, 1, 0, 0, 1, 1,
-0.9862503, -1.154837, -2.995685, 1, 0, 0, 1, 1,
-0.9848641, -1.187755, -0.9273397, 1, 0, 0, 1, 1,
-0.9793975, -0.2748138, -2.085822, 1, 0, 0, 1, 1,
-0.9759322, -1.442859, -1.174392, 1, 0, 0, 1, 1,
-0.972939, 1.594034, -2.178927, 0, 0, 0, 1, 1,
-0.9727224, -0.2675938, -2.044753, 0, 0, 0, 1, 1,
-0.9702173, 1.764353, -1.680829, 0, 0, 0, 1, 1,
-0.9687851, -0.73192, -3.229431, 0, 0, 0, 1, 1,
-0.9622684, 0.3563176, -0.7271587, 0, 0, 0, 1, 1,
-0.9603635, -0.04931783, -2.321136, 0, 0, 0, 1, 1,
-0.9554266, 0.0338216, -0.5677005, 0, 0, 0, 1, 1,
-0.9545779, 0.1229529, -1.158453, 1, 1, 1, 1, 1,
-0.9477023, 3.301461, -0.2634476, 1, 1, 1, 1, 1,
-0.9457238, 0.8046201, -1.738818, 1, 1, 1, 1, 1,
-0.9455569, -0.4494007, -1.467639, 1, 1, 1, 1, 1,
-0.9385903, -0.2184105, -1.689793, 1, 1, 1, 1, 1,
-0.9371352, -1.552692, -1.491719, 1, 1, 1, 1, 1,
-0.9362144, 0.003706482, -1.281595, 1, 1, 1, 1, 1,
-0.9353985, -0.395828, -2.139383, 1, 1, 1, 1, 1,
-0.9274692, -0.4106438, -2.894766, 1, 1, 1, 1, 1,
-0.9269201, -1.852126, -2.19187, 1, 1, 1, 1, 1,
-0.9160497, -1.424435, -2.340255, 1, 1, 1, 1, 1,
-0.9080635, 0.4614479, -0.851481, 1, 1, 1, 1, 1,
-0.9059511, -1.645988, -1.956391, 1, 1, 1, 1, 1,
-0.903406, 0.7967149, 0.2201846, 1, 1, 1, 1, 1,
-0.9008344, 0.6350147, -1.605158, 1, 1, 1, 1, 1,
-0.9004802, 0.2483433, 1.462669, 0, 0, 1, 1, 1,
-0.8970345, -0.770916, -3.362804, 1, 0, 0, 1, 1,
-0.8922061, 0.01304457, -1.885753, 1, 0, 0, 1, 1,
-0.8902519, 0.1345805, -2.094355, 1, 0, 0, 1, 1,
-0.8872437, -0.3768793, -1.160344, 1, 0, 0, 1, 1,
-0.8859631, -0.5708591, -2.375636, 1, 0, 0, 1, 1,
-0.8811029, 0.5556909, -1.934517, 0, 0, 0, 1, 1,
-0.8725944, -2.841787, -3.192431, 0, 0, 0, 1, 1,
-0.8694893, 0.1457414, -1.690213, 0, 0, 0, 1, 1,
-0.8665119, 1.043972, -0.2503381, 0, 0, 0, 1, 1,
-0.8589095, 1.016116, -0.112657, 0, 0, 0, 1, 1,
-0.8563637, 1.67304, 0.8172553, 0, 0, 0, 1, 1,
-0.8532305, -0.7733137, -3.147919, 0, 0, 0, 1, 1,
-0.8496335, 0.6681403, -0.3090423, 1, 1, 1, 1, 1,
-0.8470688, 0.008503826, -2.69312, 1, 1, 1, 1, 1,
-0.8408442, -0.578811, -2.161798, 1, 1, 1, 1, 1,
-0.838466, 0.7926036, -1.946322, 1, 1, 1, 1, 1,
-0.8366777, -1.211989, -4.201006, 1, 1, 1, 1, 1,
-0.8355976, -0.2472343, 0.4575571, 1, 1, 1, 1, 1,
-0.824899, -1.705394, -2.934554, 1, 1, 1, 1, 1,
-0.8240585, 0.667368, -1.137661, 1, 1, 1, 1, 1,
-0.8232175, -0.2903415, -0.5999559, 1, 1, 1, 1, 1,
-0.8221861, -0.1564068, -2.436651, 1, 1, 1, 1, 1,
-0.8206406, -0.296969, -0.6153331, 1, 1, 1, 1, 1,
-0.8183047, -0.3592015, -1.698621, 1, 1, 1, 1, 1,
-0.8128307, 0.3617795, -0.02853039, 1, 1, 1, 1, 1,
-0.8060892, -0.1751186, -1.396714, 1, 1, 1, 1, 1,
-0.7988246, 0.8591418, -1.815971, 1, 1, 1, 1, 1,
-0.7956128, 0.852166, -1.634808, 0, 0, 1, 1, 1,
-0.7943744, -0.01830233, 0.2917466, 1, 0, 0, 1, 1,
-0.7911316, 1.927019, -0.3307969, 1, 0, 0, 1, 1,
-0.7838959, -0.6393884, -1.404426, 1, 0, 0, 1, 1,
-0.7758211, -1.144356, -2.205572, 1, 0, 0, 1, 1,
-0.7732089, -0.7154506, -1.502104, 1, 0, 0, 1, 1,
-0.7726097, -0.777723, -1.692424, 0, 0, 0, 1, 1,
-0.7724796, -0.2873331, -0.5953544, 0, 0, 0, 1, 1,
-0.7722201, -0.07292322, -0.3566588, 0, 0, 0, 1, 1,
-0.7714413, -0.3299038, -1.850788, 0, 0, 0, 1, 1,
-0.7653356, 0.0419553, 0.8024077, 0, 0, 0, 1, 1,
-0.7618439, -1.040158, -3.073211, 0, 0, 0, 1, 1,
-0.7616699, 1.57431, -0.4861992, 0, 0, 0, 1, 1,
-0.761261, -0.01601768, -0.4413339, 1, 1, 1, 1, 1,
-0.75353, 1.433276, 1.437485, 1, 1, 1, 1, 1,
-0.7510207, -0.5984234, -2.070048, 1, 1, 1, 1, 1,
-0.748139, 0.5768384, -1.701443, 1, 1, 1, 1, 1,
-0.7476121, 0.2380525, -0.4639414, 1, 1, 1, 1, 1,
-0.7468554, -0.8582832, -3.361574, 1, 1, 1, 1, 1,
-0.7468321, -0.4961302, -1.784853, 1, 1, 1, 1, 1,
-0.7465615, 0.5634641, -0.8616217, 1, 1, 1, 1, 1,
-0.7456496, -0.243923, -1.65748, 1, 1, 1, 1, 1,
-0.741857, 0.3152094, -1.715709, 1, 1, 1, 1, 1,
-0.7310554, -0.4409269, -1.966763, 1, 1, 1, 1, 1,
-0.7309547, 0.1755985, -2.269157, 1, 1, 1, 1, 1,
-0.729954, 0.9140092, -0.6334435, 1, 1, 1, 1, 1,
-0.7265079, -1.516718, -3.831298, 1, 1, 1, 1, 1,
-0.7264959, -1.264036, -1.801875, 1, 1, 1, 1, 1,
-0.721984, -1.173603, -2.333081, 0, 0, 1, 1, 1,
-0.7208924, 1.050876, -1.31958, 1, 0, 0, 1, 1,
-0.714456, 1.757998, -0.9024714, 1, 0, 0, 1, 1,
-0.7104128, -0.1092993, -1.598005, 1, 0, 0, 1, 1,
-0.698469, 0.99981, -0.6840414, 1, 0, 0, 1, 1,
-0.6982026, -0.8567144, -3.949623, 1, 0, 0, 1, 1,
-0.6960498, -0.3988288, -2.117828, 0, 0, 0, 1, 1,
-0.6956847, 0.1080257, -1.321732, 0, 0, 0, 1, 1,
-0.6928065, 0.4380521, -0.8973992, 0, 0, 0, 1, 1,
-0.6909255, 0.3739086, -2.984097, 0, 0, 0, 1, 1,
-0.6901192, -0.5763148, -0.891549, 0, 0, 0, 1, 1,
-0.6886648, 0.9519378, 0.781876, 0, 0, 0, 1, 1,
-0.6884031, 0.9111635, 0.5802214, 0, 0, 0, 1, 1,
-0.6839073, 1.510954, -0.6879048, 1, 1, 1, 1, 1,
-0.6778407, -1.240841, -1.620164, 1, 1, 1, 1, 1,
-0.6697388, 0.1422779, -1.528269, 1, 1, 1, 1, 1,
-0.6653529, -0.2126587, -3.016767, 1, 1, 1, 1, 1,
-0.6629727, -0.4112567, -1.710106, 1, 1, 1, 1, 1,
-0.6607873, -0.03626683, -1.988103, 1, 1, 1, 1, 1,
-0.6582147, -0.6151589, -0.9626424, 1, 1, 1, 1, 1,
-0.6543977, -0.6276916, -2.727283, 1, 1, 1, 1, 1,
-0.6524893, 0.2215252, -1.68319, 1, 1, 1, 1, 1,
-0.6496931, 0.6660857, -1.251868, 1, 1, 1, 1, 1,
-0.6465111, 0.4638123, -0.7256967, 1, 1, 1, 1, 1,
-0.6456995, -0.2367683, -2.46037, 1, 1, 1, 1, 1,
-0.6444549, 0.1358464, -1.133029, 1, 1, 1, 1, 1,
-0.6354188, 0.9045519, -0.5161515, 1, 1, 1, 1, 1,
-0.6346862, 0.4639187, 0.5367725, 1, 1, 1, 1, 1,
-0.6308155, 0.01006924, -2.214061, 0, 0, 1, 1, 1,
-0.6305484, 1.186869, -0.384919, 1, 0, 0, 1, 1,
-0.6297171, 1.486128, 0.0006023535, 1, 0, 0, 1, 1,
-0.6286439, -0.7493035, -0.6308605, 1, 0, 0, 1, 1,
-0.6273493, -0.05829301, -2.225466, 1, 0, 0, 1, 1,
-0.6271788, -0.2077158, -1.725431, 1, 0, 0, 1, 1,
-0.6221122, 0.006084365, -2.578817, 0, 0, 0, 1, 1,
-0.6217077, -0.5954712, -1.005723, 0, 0, 0, 1, 1,
-0.6211077, 0.1158458, -2.170938, 0, 0, 0, 1, 1,
-0.6183888, 0.6167203, -0.7561316, 0, 0, 0, 1, 1,
-0.6140439, 0.660911, -1.723864, 0, 0, 0, 1, 1,
-0.6042585, 1.097283, -3.012946, 0, 0, 0, 1, 1,
-0.6022032, 0.5888836, -1.998534, 0, 0, 0, 1, 1,
-0.5973788, 0.8313447, -0.2910943, 1, 1, 1, 1, 1,
-0.5867678, -0.7599772, -2.29698, 1, 1, 1, 1, 1,
-0.5773675, 0.8202559, -1.368641, 1, 1, 1, 1, 1,
-0.5743785, -0.6893317, -2.911876, 1, 1, 1, 1, 1,
-0.5701453, -0.7519578, -4.670132, 1, 1, 1, 1, 1,
-0.5693235, -0.4436335, -1.726127, 1, 1, 1, 1, 1,
-0.5659868, -1.692955, -2.551727, 1, 1, 1, 1, 1,
-0.565119, 0.3735658, -1.8726, 1, 1, 1, 1, 1,
-0.5640574, 0.5724446, -0.4108366, 1, 1, 1, 1, 1,
-0.5631455, -0.9849253, -2.984749, 1, 1, 1, 1, 1,
-0.5623893, 1.833218, 0.9772912, 1, 1, 1, 1, 1,
-0.5622649, -1.116682, -3.638858, 1, 1, 1, 1, 1,
-0.561985, -0.9698495, -2.176799, 1, 1, 1, 1, 1,
-0.5616536, -0.9163907, -3.102585, 1, 1, 1, 1, 1,
-0.5604319, 0.9410509, -2.18083, 1, 1, 1, 1, 1,
-0.5580963, -0.1903403, -3.135341, 0, 0, 1, 1, 1,
-0.5567756, -1.301944, -4.280852, 1, 0, 0, 1, 1,
-0.5534141, -0.06744637, -2.329257, 1, 0, 0, 1, 1,
-0.552848, -0.01024803, -2.307206, 1, 0, 0, 1, 1,
-0.54596, -0.8321168, -1.269399, 1, 0, 0, 1, 1,
-0.5404731, -0.3149061, -3.461607, 1, 0, 0, 1, 1,
-0.5383415, 0.4996748, 0.1398534, 0, 0, 0, 1, 1,
-0.5365328, 0.7945655, -1.100107, 0, 0, 0, 1, 1,
-0.535789, -2.027356, -4.199226, 0, 0, 0, 1, 1,
-0.5353907, -1.82497, -2.856452, 0, 0, 0, 1, 1,
-0.5337313, -0.5564668, -4.439259, 0, 0, 0, 1, 1,
-0.5309854, 0.6840903, 0.5085223, 0, 0, 0, 1, 1,
-0.530064, 0.6605136, -1.461587, 0, 0, 0, 1, 1,
-0.5243071, -1.505193, -2.173647, 1, 1, 1, 1, 1,
-0.5230432, -0.2793165, 0.4105416, 1, 1, 1, 1, 1,
-0.5216327, 0.02002144, -0.9929353, 1, 1, 1, 1, 1,
-0.5213783, -1.443816, -1.37085, 1, 1, 1, 1, 1,
-0.5166064, -2.193064, -2.714537, 1, 1, 1, 1, 1,
-0.5118226, 0.3736771, -2.425198, 1, 1, 1, 1, 1,
-0.5083322, 1.027302, 1.210272, 1, 1, 1, 1, 1,
-0.5078087, 0.3310668, 0.04232394, 1, 1, 1, 1, 1,
-0.5059077, -0.0622303, -1.354436, 1, 1, 1, 1, 1,
-0.5056567, 0.5145272, -0.3553337, 1, 1, 1, 1, 1,
-0.5050188, 0.7478791, 0.3404967, 1, 1, 1, 1, 1,
-0.5029134, 1.263209, -2.313276, 1, 1, 1, 1, 1,
-0.4997607, -1.526795, -3.86772, 1, 1, 1, 1, 1,
-0.4990188, -1.589294, -2.706873, 1, 1, 1, 1, 1,
-0.4949265, -0.6350839, -4.159184, 1, 1, 1, 1, 1,
-0.4899255, -0.812335, -4.204017, 0, 0, 1, 1, 1,
-0.4897989, -0.3284743, -3.373536, 1, 0, 0, 1, 1,
-0.4891061, 2.119761, -0.7338946, 1, 0, 0, 1, 1,
-0.4888638, 0.9925165, -1.419884, 1, 0, 0, 1, 1,
-0.4888406, -0.1624455, -2.308753, 1, 0, 0, 1, 1,
-0.4787155, -0.8116263, -2.648371, 1, 0, 0, 1, 1,
-0.4773318, -0.9068777, -1.339704, 0, 0, 0, 1, 1,
-0.4758188, 1.546625, 0.1322571, 0, 0, 0, 1, 1,
-0.469405, -1.652244, -2.079855, 0, 0, 0, 1, 1,
-0.4627003, 1.564684, -0.5292859, 0, 0, 0, 1, 1,
-0.4621857, 1.240737, 1.015518, 0, 0, 0, 1, 1,
-0.4613784, 0.4698564, -1.620398, 0, 0, 0, 1, 1,
-0.4613364, -0.3675762, -1.993154, 0, 0, 0, 1, 1,
-0.4542001, -0.2142705, -1.48945, 1, 1, 1, 1, 1,
-0.4529149, 1.003722, 0.8540223, 1, 1, 1, 1, 1,
-0.4511149, -2.156682, -4.30819, 1, 1, 1, 1, 1,
-0.4500278, -0.2420163, -2.222349, 1, 1, 1, 1, 1,
-0.4437492, -0.4044698, -2.324158, 1, 1, 1, 1, 1,
-0.4435977, 0.1381249, -0.7753794, 1, 1, 1, 1, 1,
-0.4374337, 1.474275, -0.3796794, 1, 1, 1, 1, 1,
-0.436038, -2.257997, -4.055981, 1, 1, 1, 1, 1,
-0.4359334, 1.929925, -2.000499, 1, 1, 1, 1, 1,
-0.4303073, 1.019225, -1.454407, 1, 1, 1, 1, 1,
-0.4292409, -0.9650852, -4.12977, 1, 1, 1, 1, 1,
-0.4280618, -0.3752187, -2.476063, 1, 1, 1, 1, 1,
-0.4277826, -1.464442, -1.545764, 1, 1, 1, 1, 1,
-0.4228165, 0.117053, 0.6228573, 1, 1, 1, 1, 1,
-0.419034, -0.7047011, -1.776362, 1, 1, 1, 1, 1,
-0.4138985, 0.8030294, -2.120261, 0, 0, 1, 1, 1,
-0.4127906, -0.1401454, -1.345368, 1, 0, 0, 1, 1,
-0.4116191, -0.6495132, -1.890699, 1, 0, 0, 1, 1,
-0.4074076, -0.9322299, -2.486058, 1, 0, 0, 1, 1,
-0.4038959, -1.583002, -2.86417, 1, 0, 0, 1, 1,
-0.4005215, -1.344894, -1.463748, 1, 0, 0, 1, 1,
-0.4002535, 0.3816927, 0.1628395, 0, 0, 0, 1, 1,
-0.3992485, 0.4830165, -1.752656, 0, 0, 0, 1, 1,
-0.3989151, 0.6632327, -0.80846, 0, 0, 0, 1, 1,
-0.3980853, 0.9097282, -1.258519, 0, 0, 0, 1, 1,
-0.3942851, 0.3863217, 0.6716248, 0, 0, 0, 1, 1,
-0.393922, -0.02896864, -1.926223, 0, 0, 0, 1, 1,
-0.3934956, -1.22608, -3.520001, 0, 0, 0, 1, 1,
-0.3924243, 0.1279927, -0.7759427, 1, 1, 1, 1, 1,
-0.3912247, -0.8630803, -1.412948, 1, 1, 1, 1, 1,
-0.3910306, 1.284604, -1.920679, 1, 1, 1, 1, 1,
-0.388293, 0.04536844, -1.8994, 1, 1, 1, 1, 1,
-0.3868068, 1.307058, 0.3381275, 1, 1, 1, 1, 1,
-0.3766768, -0.1197695, -1.431704, 1, 1, 1, 1, 1,
-0.3746329, -0.5780839, -2.776431, 1, 1, 1, 1, 1,
-0.3720297, 0.5599393, -0.7160379, 1, 1, 1, 1, 1,
-0.3703306, 0.1971378, -2.188009, 1, 1, 1, 1, 1,
-0.3670304, -0.2626295, -0.9733166, 1, 1, 1, 1, 1,
-0.3636394, 1.402361, -0.6726529, 1, 1, 1, 1, 1,
-0.3626787, -0.05679253, -1.472846, 1, 1, 1, 1, 1,
-0.350214, 0.2192595, -1.782067, 1, 1, 1, 1, 1,
-0.3481211, -0.77895, -3.580916, 1, 1, 1, 1, 1,
-0.3447077, -0.1975262, -4.448873, 1, 1, 1, 1, 1,
-0.3426271, 0.9126452, -1.030749, 0, 0, 1, 1, 1,
-0.3324608, 0.3515846, 0.964347, 1, 0, 0, 1, 1,
-0.3314277, -0.556398, -3.357079, 1, 0, 0, 1, 1,
-0.328723, -0.8123999, -2.168229, 1, 0, 0, 1, 1,
-0.3268899, 1.605334, 0.7090648, 1, 0, 0, 1, 1,
-0.3245601, -0.9185199, -1.172427, 1, 0, 0, 1, 1,
-0.3244003, 0.2156878, 0.02404423, 0, 0, 0, 1, 1,
-0.3229485, -0.5659116, -1.239697, 0, 0, 0, 1, 1,
-0.3214527, 2.008514, -0.6183594, 0, 0, 0, 1, 1,
-0.3183938, -1.609304, -2.281772, 0, 0, 0, 1, 1,
-0.3109128, -0.7784981, -4.642687, 0, 0, 0, 1, 1,
-0.3090757, 0.1758626, 1.148377, 0, 0, 0, 1, 1,
-0.3087026, -1.575577, -4.176185, 0, 0, 0, 1, 1,
-0.3069259, -0.4687405, -3.125396, 1, 1, 1, 1, 1,
-0.3030444, -1.643612, -1.903325, 1, 1, 1, 1, 1,
-0.3017253, 0.1223203, -0.2836929, 1, 1, 1, 1, 1,
-0.298514, 1.512257, -0.4989087, 1, 1, 1, 1, 1,
-0.2976544, -1.501771, -3.950494, 1, 1, 1, 1, 1,
-0.2976104, -0.6427318, -2.67108, 1, 1, 1, 1, 1,
-0.2974877, 0.6049827, -0.1233336, 1, 1, 1, 1, 1,
-0.2973613, -0.9279927, -0.6684417, 1, 1, 1, 1, 1,
-0.2894782, -0.5853202, -3.000776, 1, 1, 1, 1, 1,
-0.2827806, -0.5331817, -2.317932, 1, 1, 1, 1, 1,
-0.2823537, 0.4235055, -2.674625, 1, 1, 1, 1, 1,
-0.2720582, -0.9991223, -1.731187, 1, 1, 1, 1, 1,
-0.2710412, -2.342865, -2.586385, 1, 1, 1, 1, 1,
-0.2677083, 0.01883509, -0.9623036, 1, 1, 1, 1, 1,
-0.2650658, 0.5992931, -1.213064, 1, 1, 1, 1, 1,
-0.2622959, 0.5313243, -0.4804635, 0, 0, 1, 1, 1,
-0.2557753, -0.2429663, -2.839255, 1, 0, 0, 1, 1,
-0.2543971, -1.567866, -2.7872, 1, 0, 0, 1, 1,
-0.2538711, 0.4057968, 0.2261817, 1, 0, 0, 1, 1,
-0.2535155, -0.5099686, -4.288048, 1, 0, 0, 1, 1,
-0.2531339, -1.630624, -3.152262, 1, 0, 0, 1, 1,
-0.2497927, 0.01293793, -1.037074, 0, 0, 0, 1, 1,
-0.2466331, 0.2650056, -1.489851, 0, 0, 0, 1, 1,
-0.2463835, 0.1283493, -2.10581, 0, 0, 0, 1, 1,
-0.2437789, -2.473026, -2.000064, 0, 0, 0, 1, 1,
-0.2362815, 0.5345861, -1.268227, 0, 0, 0, 1, 1,
-0.2356448, 0.8579736, -0.8808869, 0, 0, 0, 1, 1,
-0.2279371, -0.5754115, -2.813756, 0, 0, 0, 1, 1,
-0.2271525, -0.3086141, -5.3276, 1, 1, 1, 1, 1,
-0.2259963, 1.668441, 0.4582014, 1, 1, 1, 1, 1,
-0.2226715, 1.713067, -1.746315, 1, 1, 1, 1, 1,
-0.2224486, -0.3661986, -4.571474, 1, 1, 1, 1, 1,
-0.2215198, 0.9488384, 0.1844617, 1, 1, 1, 1, 1,
-0.2181583, 2.426421, -0.1766342, 1, 1, 1, 1, 1,
-0.2171157, 0.0825706, -1.160921, 1, 1, 1, 1, 1,
-0.2161663, -1.633632, -2.717495, 1, 1, 1, 1, 1,
-0.2149884, 1.611383, 0.7090506, 1, 1, 1, 1, 1,
-0.214588, 0.5945898, -1.91749, 1, 1, 1, 1, 1,
-0.2138025, 0.9164225, -0.1778207, 1, 1, 1, 1, 1,
-0.2114763, -0.1054651, -1.614517, 1, 1, 1, 1, 1,
-0.2091152, -1.154953, -0.7562942, 1, 1, 1, 1, 1,
-0.2027083, 1.295807, 0.6272783, 1, 1, 1, 1, 1,
-0.2002218, 0.2230059, 0.1502165, 1, 1, 1, 1, 1,
-0.1957688, 1.854341, 0.6556145, 0, 0, 1, 1, 1,
-0.1937835, 0.1162793, 0.6098732, 1, 0, 0, 1, 1,
-0.1890281, 0.1208332, -1.419694, 1, 0, 0, 1, 1,
-0.1826576, 0.8931674, -1.465501, 1, 0, 0, 1, 1,
-0.1826426, -1.082913, -5.731192, 1, 0, 0, 1, 1,
-0.1809195, 0.04417673, -1.789315, 1, 0, 0, 1, 1,
-0.1790941, 0.1369125, -1.317961, 0, 0, 0, 1, 1,
-0.1691057, -1.259421, -4.683583, 0, 0, 0, 1, 1,
-0.1644631, 0.3628723, -1.978391, 0, 0, 0, 1, 1,
-0.1642244, -1.201396, -2.819239, 0, 0, 0, 1, 1,
-0.1632686, 0.681575, 0.05287706, 0, 0, 0, 1, 1,
-0.1616049, -0.1034451, -1.136797, 0, 0, 0, 1, 1,
-0.1540363, -0.007050215, -2.215231, 0, 0, 0, 1, 1,
-0.1539768, 1.979327, 0.8133737, 1, 1, 1, 1, 1,
-0.1526701, 1.877553, 1.102734, 1, 1, 1, 1, 1,
-0.1480568, 0.2780445, -0.7260712, 1, 1, 1, 1, 1,
-0.1464506, -1.101668, -3.35156, 1, 1, 1, 1, 1,
-0.1453725, -0.01502533, -1.551564, 1, 1, 1, 1, 1,
-0.1441593, 0.1753187, -1.433345, 1, 1, 1, 1, 1,
-0.1430219, -2.099259, -3.780548, 1, 1, 1, 1, 1,
-0.1410674, 0.7324961, 0.5262586, 1, 1, 1, 1, 1,
-0.138177, -0.1741131, -1.851112, 1, 1, 1, 1, 1,
-0.1350369, -0.5807654, -4.000113, 1, 1, 1, 1, 1,
-0.133364, 0.1893976, 0.4246278, 1, 1, 1, 1, 1,
-0.1293114, 1.281577, 0.312591, 1, 1, 1, 1, 1,
-0.1234948, -0.3506181, -2.020536, 1, 1, 1, 1, 1,
-0.1169916, -0.7078527, -5.63699, 1, 1, 1, 1, 1,
-0.1166373, -0.2362882, -2.383767, 1, 1, 1, 1, 1,
-0.1154603, -0.07134228, -3.418289, 0, 0, 1, 1, 1,
-0.1106032, -0.2038579, -1.892013, 1, 0, 0, 1, 1,
-0.1050921, -0.2747481, -3.655886, 1, 0, 0, 1, 1,
-0.102379, -0.3213318, -2.903469, 1, 0, 0, 1, 1,
-0.1013553, -0.9990904, -4.726461, 1, 0, 0, 1, 1,
-0.09620256, 1.041451, 0.7384759, 1, 0, 0, 1, 1,
-0.09549683, -0.1589626, -2.295248, 0, 0, 0, 1, 1,
-0.08740957, -0.5155812, -1.802171, 0, 0, 0, 1, 1,
-0.08731071, -0.7499747, -3.594492, 0, 0, 0, 1, 1,
-0.08703119, 0.1811463, -3.045512, 0, 0, 0, 1, 1,
-0.08690545, -0.2014987, -3.764103, 0, 0, 0, 1, 1,
-0.08433456, 0.5673977, 0.5319316, 0, 0, 0, 1, 1,
-0.08044257, 0.9758198, -1.54197, 0, 0, 0, 1, 1,
-0.07689398, -1.070732, -2.399201, 1, 1, 1, 1, 1,
-0.07124116, 0.3130852, 0.1218592, 1, 1, 1, 1, 1,
-0.07027199, 0.1214687, -0.03792737, 1, 1, 1, 1, 1,
-0.06581479, -1.030867, -3.343131, 1, 1, 1, 1, 1,
-0.06456036, 0.9966362, 1.251357, 1, 1, 1, 1, 1,
-0.06425352, -1.321055, -4.335371, 1, 1, 1, 1, 1,
-0.06228362, 1.907493, 0.05491627, 1, 1, 1, 1, 1,
-0.06221991, -0.4673072, -4.20813, 1, 1, 1, 1, 1,
-0.04646463, -0.6743071, -4.741211, 1, 1, 1, 1, 1,
-0.04393343, -0.04094427, -1.434167, 1, 1, 1, 1, 1,
-0.04150623, 0.228588, -1.175902, 1, 1, 1, 1, 1,
-0.0400303, -0.3915667, -4.879363, 1, 1, 1, 1, 1,
-0.03735245, -1.126599, -3.294097, 1, 1, 1, 1, 1,
-0.03359386, -1.037747, -2.233114, 1, 1, 1, 1, 1,
-0.03280543, 2.160562, 0.2650882, 1, 1, 1, 1, 1,
-0.03263555, 0.1385999, -0.5471677, 0, 0, 1, 1, 1,
-0.03007579, 0.1273124, -0.8009011, 1, 0, 0, 1, 1,
-0.02931702, -1.129572, -1.881051, 1, 0, 0, 1, 1,
-0.02724681, 0.1043872, -0.08803956, 1, 0, 0, 1, 1,
-0.02657163, -0.06376875, -3.12676, 1, 0, 0, 1, 1,
-0.01878763, 1.618532, -0.5383996, 1, 0, 0, 1, 1,
-0.0145611, -1.07357, -4.870543, 0, 0, 0, 1, 1,
-0.009590374, -0.2734254, -3.304463, 0, 0, 0, 1, 1,
-0.009090099, -2.102514, -2.453879, 0, 0, 0, 1, 1,
-0.0007776599, 2.068825, -0.508692, 0, 0, 0, 1, 1,
0.00167439, 0.4276904, 1.851001, 0, 0, 0, 1, 1,
0.00274315, -0.5149239, 3.199775, 0, 0, 0, 1, 1,
0.005691223, -1.069419, 3.534642, 0, 0, 0, 1, 1,
0.01244633, 1.705509, -0.6653094, 1, 1, 1, 1, 1,
0.01376505, -0.3877937, 3.524578, 1, 1, 1, 1, 1,
0.01824205, -0.9580795, 3.028409, 1, 1, 1, 1, 1,
0.02038996, -0.1139164, 3.50123, 1, 1, 1, 1, 1,
0.02355421, 0.3398984, -0.1689304, 1, 1, 1, 1, 1,
0.02809815, 0.1828634, 0.3295748, 1, 1, 1, 1, 1,
0.03343773, -0.728655, 3.466289, 1, 1, 1, 1, 1,
0.04095333, -1.337907, 3.727534, 1, 1, 1, 1, 1,
0.04658655, 0.06494031, -0.1081612, 1, 1, 1, 1, 1,
0.0514277, -0.1441337, 2.310431, 1, 1, 1, 1, 1,
0.05191386, -2.391643, 3.769281, 1, 1, 1, 1, 1,
0.05369154, 0.0816693, -0.2052238, 1, 1, 1, 1, 1,
0.0579859, 0.7528042, 0.07650197, 1, 1, 1, 1, 1,
0.06343555, 0.2269711, -1.359684, 1, 1, 1, 1, 1,
0.06375533, 1.890631, 0.2459947, 1, 1, 1, 1, 1,
0.06449052, -1.026044, 3.143538, 0, 0, 1, 1, 1,
0.0760183, 0.9760869, 0.1174763, 1, 0, 0, 1, 1,
0.07675737, -1.065492, 4.131029, 1, 0, 0, 1, 1,
0.07710323, 2.437696, 1.374208, 1, 0, 0, 1, 1,
0.07897888, -1.717725, 4.189659, 1, 0, 0, 1, 1,
0.08215172, 1.388669, -0.4581286, 1, 0, 0, 1, 1,
0.08716585, -0.7118936, 3.867245, 0, 0, 0, 1, 1,
0.08942681, 0.1891254, 0.2282881, 0, 0, 0, 1, 1,
0.09681667, -1.134971, 3.138916, 0, 0, 0, 1, 1,
0.1056073, 0.5795951, 0.8229225, 0, 0, 0, 1, 1,
0.1065458, -0.9601112, 3.849501, 0, 0, 0, 1, 1,
0.10687, 0.2871101, 0.967528, 0, 0, 0, 1, 1,
0.1076933, 1.085892, -1.039598, 0, 0, 0, 1, 1,
0.1077985, -1.421628, 3.584511, 1, 1, 1, 1, 1,
0.1085572, -0.2838969, 1.919239, 1, 1, 1, 1, 1,
0.109516, 1.065301, 0.6418107, 1, 1, 1, 1, 1,
0.1110266, -0.6905896, 2.309475, 1, 1, 1, 1, 1,
0.1115321, 0.7121396, 3.213312, 1, 1, 1, 1, 1,
0.1145138, 0.3155614, 0.3379146, 1, 1, 1, 1, 1,
0.1149622, 0.5792183, 0.04337379, 1, 1, 1, 1, 1,
0.1179258, -0.06644443, 1.751656, 1, 1, 1, 1, 1,
0.1191528, -0.8290107, 3.323626, 1, 1, 1, 1, 1,
0.1316556, -0.9284644, 3.447016, 1, 1, 1, 1, 1,
0.1321274, 0.2487666, 2.053952, 1, 1, 1, 1, 1,
0.1338282, 0.8239583, -1.418556, 1, 1, 1, 1, 1,
0.1360901, -1.152874, 3.517196, 1, 1, 1, 1, 1,
0.1377706, -0.03914241, 1.521914, 1, 1, 1, 1, 1,
0.1381103, -0.3973662, 4.5673, 1, 1, 1, 1, 1,
0.1382604, -0.5889478, 3.729882, 0, 0, 1, 1, 1,
0.139785, 0.630698, 1.484844, 1, 0, 0, 1, 1,
0.1399003, -0.8009074, 3.089363, 1, 0, 0, 1, 1,
0.1438454, -0.7716865, 3.193862, 1, 0, 0, 1, 1,
0.1456314, 0.1945613, 0.1658724, 1, 0, 0, 1, 1,
0.1483807, 0.166036, 0.6148272, 1, 0, 0, 1, 1,
0.1494192, -0.4743297, 4.78614, 0, 0, 0, 1, 1,
0.153368, 1.681533, 0.505993, 0, 0, 0, 1, 1,
0.1534859, -0.6219959, 3.231896, 0, 0, 0, 1, 1,
0.1585785, 0.2323233, 1.886475, 0, 0, 0, 1, 1,
0.1603197, -1.235204, 1.844509, 0, 0, 0, 1, 1,
0.1611898, 0.5715197, 2.099376, 0, 0, 0, 1, 1,
0.1626383, -0.6327928, 2.722377, 0, 0, 0, 1, 1,
0.1638111, 0.1117237, 0.3651232, 1, 1, 1, 1, 1,
0.1653075, 0.06575536, 0.4779873, 1, 1, 1, 1, 1,
0.1672564, -0.8947916, 3.338335, 1, 1, 1, 1, 1,
0.1738318, 0.5753636, -1.982715, 1, 1, 1, 1, 1,
0.1834556, -0.5187816, 0.9144592, 1, 1, 1, 1, 1,
0.188848, 1.004911, -0.344427, 1, 1, 1, 1, 1,
0.1892082, 0.2291004, 0.9739097, 1, 1, 1, 1, 1,
0.1944254, 0.9464284, -0.6808048, 1, 1, 1, 1, 1,
0.2021833, 0.7490913, -0.1243161, 1, 1, 1, 1, 1,
0.2037182, -1.259978, 3.841383, 1, 1, 1, 1, 1,
0.2043808, -0.5025565, 2.596614, 1, 1, 1, 1, 1,
0.2100885, 0.2912783, -0.2834282, 1, 1, 1, 1, 1,
0.2164225, 0.8301942, -0.4266833, 1, 1, 1, 1, 1,
0.2165099, 0.1024631, 2.004916, 1, 1, 1, 1, 1,
0.2168524, -1.12136, 4.538828, 1, 1, 1, 1, 1,
0.2178221, 2.098531, -1.801853, 0, 0, 1, 1, 1,
0.2217281, 0.108015, 0.8268987, 1, 0, 0, 1, 1,
0.2233715, 0.1908649, 1.717768, 1, 0, 0, 1, 1,
0.2256256, -0.2284391, 0.4379889, 1, 0, 0, 1, 1,
0.2288198, 1.435265, 0.9757565, 1, 0, 0, 1, 1,
0.2311878, 1.281435, -1.659049, 1, 0, 0, 1, 1,
0.2357877, 1.100739, -0.0205736, 0, 0, 0, 1, 1,
0.239454, -0.333708, 2.861182, 0, 0, 0, 1, 1,
0.2413561, 2.248248, -1.646643, 0, 0, 0, 1, 1,
0.2430862, -0.9824973, 2.457929, 0, 0, 0, 1, 1,
0.2507793, -2.22348, 2.051818, 0, 0, 0, 1, 1,
0.2550985, 0.6556978, -0.4280258, 0, 0, 0, 1, 1,
0.2560426, -0.6128111, 3.080603, 0, 0, 0, 1, 1,
0.2579812, -0.6634736, 3.078456, 1, 1, 1, 1, 1,
0.2604072, -0.2817901, 2.110432, 1, 1, 1, 1, 1,
0.2664383, 0.1368587, -0.56612, 1, 1, 1, 1, 1,
0.2750829, 1.329688, -0.5421963, 1, 1, 1, 1, 1,
0.2855028, -1.058598, 2.109266, 1, 1, 1, 1, 1,
0.286935, 1.886306, -0.4447587, 1, 1, 1, 1, 1,
0.287154, -0.07561437, 1.618112, 1, 1, 1, 1, 1,
0.2924684, 0.4258616, 0.810203, 1, 1, 1, 1, 1,
0.2936882, 0.3646953, 0.3918098, 1, 1, 1, 1, 1,
0.2946229, -1.350077, 3.232939, 1, 1, 1, 1, 1,
0.3045853, -1.625295, 3.112841, 1, 1, 1, 1, 1,
0.3064368, -1.47928, 3.687795, 1, 1, 1, 1, 1,
0.3064817, 0.7216064, 0.4952728, 1, 1, 1, 1, 1,
0.3068106, -1.016265, 2.190445, 1, 1, 1, 1, 1,
0.3071592, -1.109877, 2.62486, 1, 1, 1, 1, 1,
0.3081062, -0.3159544, 3.106947, 0, 0, 1, 1, 1,
0.3084971, 0.1932757, 0.36467, 1, 0, 0, 1, 1,
0.3113515, -0.9005201, 1.669034, 1, 0, 0, 1, 1,
0.3148984, -1.075567, 2.173326, 1, 0, 0, 1, 1,
0.3153149, 0.8351213, -0.9084302, 1, 0, 0, 1, 1,
0.3207519, 1.856443, -1.679817, 1, 0, 0, 1, 1,
0.3268337, -1.07454, 2.593104, 0, 0, 0, 1, 1,
0.3298202, 2.83504, -0.6428473, 0, 0, 0, 1, 1,
0.3299559, -0.8325792, 5.22619, 0, 0, 0, 1, 1,
0.3310925, 0.1670445, 0.2499269, 0, 0, 0, 1, 1,
0.3336693, 0.1277887, 1.415693, 0, 0, 0, 1, 1,
0.3346128, -1.926781, 3.002761, 0, 0, 0, 1, 1,
0.3351371, -0.1733399, 2.780466, 0, 0, 0, 1, 1,
0.3372796, -0.70974, 1.761039, 1, 1, 1, 1, 1,
0.3386179, -1.15199, 3.273911, 1, 1, 1, 1, 1,
0.34392, 0.5975798, -0.5389535, 1, 1, 1, 1, 1,
0.3442462, 2.132598, 1.729689, 1, 1, 1, 1, 1,
0.3478829, 0.2943339, 1.679535, 1, 1, 1, 1, 1,
0.3498388, 1.180938, 2.072905, 1, 1, 1, 1, 1,
0.3582409, -0.8477242, 3.164828, 1, 1, 1, 1, 1,
0.3590596, -0.401311, 0.1965446, 1, 1, 1, 1, 1,
0.3601168, 0.118644, -0.5271204, 1, 1, 1, 1, 1,
0.3649097, 1.353309, 0.532779, 1, 1, 1, 1, 1,
0.3649144, -1.857225, 3.657493, 1, 1, 1, 1, 1,
0.3650554, 1.423363, -0.1758224, 1, 1, 1, 1, 1,
0.3651433, 0.06532625, 1.660267, 1, 1, 1, 1, 1,
0.3672597, -0.5827145, 2.774447, 1, 1, 1, 1, 1,
0.3689589, -0.04895472, 1.097431, 1, 1, 1, 1, 1,
0.3692039, 1.744598, -0.8682179, 0, 0, 1, 1, 1,
0.373106, -0.237484, 2.564389, 1, 0, 0, 1, 1,
0.3732443, 0.1931891, 0.6742615, 1, 0, 0, 1, 1,
0.3758029, 2.04669, -1.676036, 1, 0, 0, 1, 1,
0.3765668, 0.6608235, 0.3022336, 1, 0, 0, 1, 1,
0.377831, 1.972113, -1.338588, 1, 0, 0, 1, 1,
0.3803891, -1.726003, 2.63763, 0, 0, 0, 1, 1,
0.3870907, 1.645698, 1.284044, 0, 0, 0, 1, 1,
0.3903784, 0.2896698, 2.612233, 0, 0, 0, 1, 1,
0.390922, -0.6761144, 1.665177, 0, 0, 0, 1, 1,
0.3925754, -1.876148, 1.36603, 0, 0, 0, 1, 1,
0.3989498, -0.6458942, 1.692404, 0, 0, 0, 1, 1,
0.4017012, 0.1497893, 1.013144, 0, 0, 0, 1, 1,
0.4060791, 0.9689677, 0.5321068, 1, 1, 1, 1, 1,
0.4073805, -1.252546, 3.179343, 1, 1, 1, 1, 1,
0.4102306, -0.6499107, 2.833881, 1, 1, 1, 1, 1,
0.4129997, -2.505692, 2.324818, 1, 1, 1, 1, 1,
0.4152513, 1.534779, 0.9904559, 1, 1, 1, 1, 1,
0.418204, 1.081878, -0.1473254, 1, 1, 1, 1, 1,
0.4217422, -2.015464, 3.608303, 1, 1, 1, 1, 1,
0.4277436, -0.9175546, 2.086586, 1, 1, 1, 1, 1,
0.4309964, -0.4042897, 1.662537, 1, 1, 1, 1, 1,
0.4381189, -0.539357, 3.465406, 1, 1, 1, 1, 1,
0.4410613, 0.3404795, 1.28374, 1, 1, 1, 1, 1,
0.4460959, -1.371264, 2.220545, 1, 1, 1, 1, 1,
0.4479006, -0.1933185, 2.170073, 1, 1, 1, 1, 1,
0.4573159, 0.4245914, 0.6305984, 1, 1, 1, 1, 1,
0.4671305, -1.654003, 4.078028, 1, 1, 1, 1, 1,
0.4690069, -1.198711, 0.468985, 0, 0, 1, 1, 1,
0.4709794, -1.958254, 3.450037, 1, 0, 0, 1, 1,
0.4721952, 0.8992474, -0.4260655, 1, 0, 0, 1, 1,
0.4723727, -0.5444046, 3.836999, 1, 0, 0, 1, 1,
0.4725192, 0.3717559, -0.694414, 1, 0, 0, 1, 1,
0.4736764, -1.788872, 3.418888, 1, 0, 0, 1, 1,
0.4777297, -0.4279288, 3.546628, 0, 0, 0, 1, 1,
0.4777965, 0.5376229, 0.3870193, 0, 0, 0, 1, 1,
0.4785976, 0.7254426, -1.374188, 0, 0, 0, 1, 1,
0.4809801, 0.09998734, 1.897937, 0, 0, 0, 1, 1,
0.4853352, -0.3342946, 2.862798, 0, 0, 0, 1, 1,
0.4860887, 1.11005, 0.9597465, 0, 0, 0, 1, 1,
0.4863661, 0.1929266, -0.5943658, 0, 0, 0, 1, 1,
0.488576, 1.626525, -1.130095, 1, 1, 1, 1, 1,
0.4921157, -0.9575136, 2.367292, 1, 1, 1, 1, 1,
0.4960627, 1.846076, 2.039734, 1, 1, 1, 1, 1,
0.4971578, 1.828555, -0.3020145, 1, 1, 1, 1, 1,
0.5053353, -0.9449392, 3.577011, 1, 1, 1, 1, 1,
0.5102921, -0.1494319, 0.8326305, 1, 1, 1, 1, 1,
0.5107678, -0.2958432, -0.5765911, 1, 1, 1, 1, 1,
0.5128481, -0.5261075, 1.187571, 1, 1, 1, 1, 1,
0.5131072, -0.363657, 1.357039, 1, 1, 1, 1, 1,
0.5153137, 1.989503, 0.5237914, 1, 1, 1, 1, 1,
0.5204172, 0.7580819, 1.024447, 1, 1, 1, 1, 1,
0.525066, 0.4280825, 0.6701114, 1, 1, 1, 1, 1,
0.5286392, 1.319558, 0.4187974, 1, 1, 1, 1, 1,
0.5293587, -2.776521, 3.052951, 1, 1, 1, 1, 1,
0.5303233, 0.3383885, 2.691697, 1, 1, 1, 1, 1,
0.5332977, 1.503565, -0.4013216, 0, 0, 1, 1, 1,
0.5335889, 0.1264458, 1.451108, 1, 0, 0, 1, 1,
0.5339155, -0.9190577, 3.05729, 1, 0, 0, 1, 1,
0.5400234, -0.7454774, 3.101475, 1, 0, 0, 1, 1,
0.5478684, 1.58561, -1.180307, 1, 0, 0, 1, 1,
0.5481873, -0.2927077, 1.235041, 1, 0, 0, 1, 1,
0.5491925, -2.011263, 2.382362, 0, 0, 0, 1, 1,
0.549211, -0.1112578, 0.8395135, 0, 0, 0, 1, 1,
0.5516711, 1.551572, 1.441178, 0, 0, 0, 1, 1,
0.5525956, -1.073955, 2.606837, 0, 0, 0, 1, 1,
0.5526288, 1.204633, 0.5135663, 0, 0, 0, 1, 1,
0.554355, -0.9527712, 3.137211, 0, 0, 0, 1, 1,
0.5564077, 0.3393787, -0.8201631, 0, 0, 0, 1, 1,
0.5566447, 2.315054, -1.378342, 1, 1, 1, 1, 1,
0.5571921, -1.301497, 3.567767, 1, 1, 1, 1, 1,
0.5626614, 1.590229, 0.3879524, 1, 1, 1, 1, 1,
0.563845, 2.055778, 1.006897, 1, 1, 1, 1, 1,
0.5641311, 1.596354, -0.4492677, 1, 1, 1, 1, 1,
0.5697628, -0.1471867, 3.111448, 1, 1, 1, 1, 1,
0.5725301, 0.4701077, 0.3551556, 1, 1, 1, 1, 1,
0.5736862, 1.28463, 0.9140975, 1, 1, 1, 1, 1,
0.574389, 0.813205, 0.8734077, 1, 1, 1, 1, 1,
0.5747712, -0.9430189, 0.7242588, 1, 1, 1, 1, 1,
0.5774709, 0.04621697, 1.141214, 1, 1, 1, 1, 1,
0.5783735, 0.5612887, 0.763485, 1, 1, 1, 1, 1,
0.5843506, -0.6977962, 0.9132166, 1, 1, 1, 1, 1,
0.5952883, -0.8160331, 3.112956, 1, 1, 1, 1, 1,
0.599253, 0.2468362, 2.297565, 1, 1, 1, 1, 1,
0.599454, 1.738921, 0.008974593, 0, 0, 1, 1, 1,
0.602512, -0.5007161, 1.508119, 1, 0, 0, 1, 1,
0.6084085, 0.2726602, 0.8097652, 1, 0, 0, 1, 1,
0.6084825, 0.7506106, -0.4955194, 1, 0, 0, 1, 1,
0.6137551, -1.258849, 1.404672, 1, 0, 0, 1, 1,
0.622705, -1.601252, 1.662924, 1, 0, 0, 1, 1,
0.6229927, 0.8792387, 1.005002, 0, 0, 0, 1, 1,
0.6231259, 1.314623, -0.4624377, 0, 0, 0, 1, 1,
0.6235529, 1.671418, 1.515938, 0, 0, 0, 1, 1,
0.6294748, -0.3915601, 0.2943004, 0, 0, 0, 1, 1,
0.6324838, 0.1263933, 1.029981, 0, 0, 0, 1, 1,
0.6364989, 0.6996757, 0.01334451, 0, 0, 0, 1, 1,
0.6377037, -1.08512, 1.681714, 0, 0, 0, 1, 1,
0.6407884, 2.038042, 0.3279585, 1, 1, 1, 1, 1,
0.6424587, 0.7424123, 2.409774, 1, 1, 1, 1, 1,
0.6435563, 0.4624352, -0.6088801, 1, 1, 1, 1, 1,
0.6453893, -0.3270624, 0.931756, 1, 1, 1, 1, 1,
0.6517575, 0.1990354, -1.167762, 1, 1, 1, 1, 1,
0.6522009, 0.04039359, 1.702762, 1, 1, 1, 1, 1,
0.653914, 1.065995, -0.2299642, 1, 1, 1, 1, 1,
0.6578737, -0.6205101, 3.574155, 1, 1, 1, 1, 1,
0.6642424, 0.4663178, 0.3085715, 1, 1, 1, 1, 1,
0.6652452, 1.299389, 2.942871, 1, 1, 1, 1, 1,
0.6666145, 0.3826698, 2.31003, 1, 1, 1, 1, 1,
0.669234, -0.4244499, 1.328795, 1, 1, 1, 1, 1,
0.6699116, 0.9505683, 1.404181, 1, 1, 1, 1, 1,
0.6725519, -0.08329955, 1.177651, 1, 1, 1, 1, 1,
0.6767864, -0.3523513, 1.536384, 1, 1, 1, 1, 1,
0.6835583, -2.46021, 2.63473, 0, 0, 1, 1, 1,
0.6865634, -0.01877258, 0.8937017, 1, 0, 0, 1, 1,
0.6883891, -0.6870596, 2.908668, 1, 0, 0, 1, 1,
0.6915133, 0.1236261, 1.33352, 1, 0, 0, 1, 1,
0.6973203, -1.138832, 3.18947, 1, 0, 0, 1, 1,
0.6978778, -0.865203, 2.866399, 1, 0, 0, 1, 1,
0.7006236, -1.223232, 2.755103, 0, 0, 0, 1, 1,
0.7008416, -1.037177, 3.716093, 0, 0, 0, 1, 1,
0.7018501, 0.01384549, 1.649351, 0, 0, 0, 1, 1,
0.7023669, -1.155313, 3.725418, 0, 0, 0, 1, 1,
0.7043285, -0.03245423, 1.993131, 0, 0, 0, 1, 1,
0.7047498, -0.8603924, 3.621274, 0, 0, 0, 1, 1,
0.7051835, -0.2555474, 2.310636, 0, 0, 0, 1, 1,
0.7071868, 0.1526932, 0.5912365, 1, 1, 1, 1, 1,
0.7114642, 0.4150599, 1.59135, 1, 1, 1, 1, 1,
0.7121316, -1.014564, 3.370813, 1, 1, 1, 1, 1,
0.7229478, 0.04717869, 3.156504, 1, 1, 1, 1, 1,
0.7236136, -1.832731, 1.273118, 1, 1, 1, 1, 1,
0.7277936, -1.508026, 2.106216, 1, 1, 1, 1, 1,
0.7300468, 0.6940774, 0.4536057, 1, 1, 1, 1, 1,
0.7321077, 0.7622224, -0.1699423, 1, 1, 1, 1, 1,
0.7340838, -0.2860448, 1.766961, 1, 1, 1, 1, 1,
0.73438, 0.9594949, 0.1809569, 1, 1, 1, 1, 1,
0.7368368, -0.02809683, 1.129718, 1, 1, 1, 1, 1,
0.7410862, -0.5705538, 2.176313, 1, 1, 1, 1, 1,
0.744576, -1.200217, 1.827429, 1, 1, 1, 1, 1,
0.75084, -1.305534, 2.440123, 1, 1, 1, 1, 1,
0.7529342, 0.007746344, 0.2282751, 1, 1, 1, 1, 1,
0.756643, 1.282706, 1.424298, 0, 0, 1, 1, 1,
0.7576531, 0.4627828, 1.263511, 1, 0, 0, 1, 1,
0.7608579, 0.7177379, 0.9745585, 1, 0, 0, 1, 1,
0.7626649, -0.2460638, 2.762069, 1, 0, 0, 1, 1,
0.7646527, 1.587298, 0.0576844, 1, 0, 0, 1, 1,
0.7670559, -0.02536808, 1.012909, 1, 0, 0, 1, 1,
0.7698099, 0.3327754, 2.283976, 0, 0, 0, 1, 1,
0.7731447, 0.1733077, 0.1705921, 0, 0, 0, 1, 1,
0.7731954, -1.676691, 3.379606, 0, 0, 0, 1, 1,
0.7756483, 0.4536897, -0.02044244, 0, 0, 0, 1, 1,
0.7812601, -0.7411719, 0.836271, 0, 0, 0, 1, 1,
0.7864757, -0.5751091, 2.968873, 0, 0, 0, 1, 1,
0.7865238, -0.6647325, 4.562076, 0, 0, 0, 1, 1,
0.7875236, 0.2883151, 2.280028, 1, 1, 1, 1, 1,
0.7891719, 1.116921, 1.976448, 1, 1, 1, 1, 1,
0.7911497, -0.4931418, 1.159554, 1, 1, 1, 1, 1,
0.8042838, 0.2964316, 0.934099, 1, 1, 1, 1, 1,
0.8046302, 0.9821535, 0.1109773, 1, 1, 1, 1, 1,
0.8048166, 1.570599, 0.9014852, 1, 1, 1, 1, 1,
0.8065224, -0.5224183, 3.304108, 1, 1, 1, 1, 1,
0.8109838, -1.184119, 2.282364, 1, 1, 1, 1, 1,
0.8159415, -1.486512, 2.964648, 1, 1, 1, 1, 1,
0.8165319, 0.6250413, 0.1661533, 1, 1, 1, 1, 1,
0.8175799, 0.4106757, 0.3070694, 1, 1, 1, 1, 1,
0.818401, -0.381021, 2.291355, 1, 1, 1, 1, 1,
0.8194852, -0.1073801, 2.12461, 1, 1, 1, 1, 1,
0.8202858, 0.510956, -0.1829904, 1, 1, 1, 1, 1,
0.8215364, 1.873834, -0.1505339, 1, 1, 1, 1, 1,
0.8219732, -0.9808246, 2.878297, 0, 0, 1, 1, 1,
0.8272349, 0.5223722, 1.423291, 1, 0, 0, 1, 1,
0.831693, 2.349556, 0.2262182, 1, 0, 0, 1, 1,
0.8325908, -0.1846451, 1.691343, 1, 0, 0, 1, 1,
0.8348994, 0.4851746, 0.3876335, 1, 0, 0, 1, 1,
0.8408656, -0.6937514, 1.171296, 1, 0, 0, 1, 1,
0.8440483, -0.8842325, 1.849367, 0, 0, 0, 1, 1,
0.8466662, 0.6880295, -0.8906131, 0, 0, 0, 1, 1,
0.8489833, 0.7764558, 0.5189915, 0, 0, 0, 1, 1,
0.8585269, 0.6060764, -0.203722, 0, 0, 0, 1, 1,
0.8608069, -1.357079, 2.839513, 0, 0, 0, 1, 1,
0.861234, 2.6967, 0.07233158, 0, 0, 0, 1, 1,
0.869992, -0.3476782, 1.534396, 0, 0, 0, 1, 1,
0.8716503, -0.5320896, 2.745749, 1, 1, 1, 1, 1,
0.8738534, -0.08273646, 2.703731, 1, 1, 1, 1, 1,
0.8781584, 0.5288304, 1.387952, 1, 1, 1, 1, 1,
0.8817137, -2.604656, 0.6099759, 1, 1, 1, 1, 1,
0.8833582, -0.6190755, 3.479697, 1, 1, 1, 1, 1,
0.8840387, 0.5623227, -0.257037, 1, 1, 1, 1, 1,
0.8879384, 0.2872169, 1.165079, 1, 1, 1, 1, 1,
0.8959625, 0.06909066, 1.102207, 1, 1, 1, 1, 1,
0.899577, 0.1391246, 4.072749, 1, 1, 1, 1, 1,
0.912785, 0.3245026, 0.6046544, 1, 1, 1, 1, 1,
0.9155117, -1.021415, 1.605282, 1, 1, 1, 1, 1,
0.9220645, -1.371399, 3.447964, 1, 1, 1, 1, 1,
0.9291103, -1.62183, 1.305144, 1, 1, 1, 1, 1,
0.934058, 1.172169, -0.05695582, 1, 1, 1, 1, 1,
0.9383891, -0.9101033, 1.371372, 1, 1, 1, 1, 1,
0.9510969, -0.1060648, 2.472794, 0, 0, 1, 1, 1,
0.962499, 0.8456524, 1.811102, 1, 0, 0, 1, 1,
0.9658223, 1.617013, -0.001917939, 1, 0, 0, 1, 1,
0.9663928, 0.3869746, 0.109248, 1, 0, 0, 1, 1,
0.9677634, 0.3498102, 1.258736, 1, 0, 0, 1, 1,
0.9818432, 0.2665235, 2.546638, 1, 0, 0, 1, 1,
0.9886392, 0.1817192, 2.37911, 0, 0, 0, 1, 1,
0.998476, -0.1447334, 2.361479, 0, 0, 0, 1, 1,
0.9998989, -1.604528, 3.063979, 0, 0, 0, 1, 1,
1.018112, -0.3714145, 0.9829119, 0, 0, 0, 1, 1,
1.019154, -0.3634256, 2.186975, 0, 0, 0, 1, 1,
1.021007, -0.3054722, 2.980149, 0, 0, 0, 1, 1,
1.029309, -0.5734686, 2.062269, 0, 0, 0, 1, 1,
1.041822, -0.8612172, 2.363234, 1, 1, 1, 1, 1,
1.043558, 0.323632, 0.202727, 1, 1, 1, 1, 1,
1.045052, -1.454199, 1.773946, 1, 1, 1, 1, 1,
1.046051, 0.8822233, 0.5361131, 1, 1, 1, 1, 1,
1.049985, -0.1792576, 2.574451, 1, 1, 1, 1, 1,
1.052486, -0.6132773, 1.157858, 1, 1, 1, 1, 1,
1.052637, 1.663382, 1.146037, 1, 1, 1, 1, 1,
1.058645, 0.203488, 0.6111909, 1, 1, 1, 1, 1,
1.06303, -0.4517206, 0.9384774, 1, 1, 1, 1, 1,
1.065623, -0.3213905, 1.159438, 1, 1, 1, 1, 1,
1.068859, 0.2580202, 0.3328366, 1, 1, 1, 1, 1,
1.072394, 1.359414, 1.180899, 1, 1, 1, 1, 1,
1.078947, 0.01074163, 0.9364927, 1, 1, 1, 1, 1,
1.081452, 0.06744476, -1.224719, 1, 1, 1, 1, 1,
1.099303, 0.126811, 2.435108, 1, 1, 1, 1, 1,
1.10078, -2.317701, 2.084805, 0, 0, 1, 1, 1,
1.100862, -1.608832, 0.5216171, 1, 0, 0, 1, 1,
1.112515, -1.261623, 1.695411, 1, 0, 0, 1, 1,
1.117143, -1.373438, 3.41452, 1, 0, 0, 1, 1,
1.128451, -0.5657712, 2.304971, 1, 0, 0, 1, 1,
1.132084, 0.2156471, 0.01897916, 1, 0, 0, 1, 1,
1.138422, -0.05377045, 1.801486, 0, 0, 0, 1, 1,
1.140899, -2.620275, 1.427394, 0, 0, 0, 1, 1,
1.150588, 0.8782355, 0.7490272, 0, 0, 0, 1, 1,
1.151366, -0.8566133, 1.825865, 0, 0, 0, 1, 1,
1.155529, -1.147715, 2.457674, 0, 0, 0, 1, 1,
1.157325, 1.721178, 0.08759898, 0, 0, 0, 1, 1,
1.16457, -0.2922043, 1.46618, 0, 0, 0, 1, 1,
1.165341, 0.843603, 0.9376316, 1, 1, 1, 1, 1,
1.1676, -0.9836907, 1.205622, 1, 1, 1, 1, 1,
1.170509, 0.6026356, 1.338099, 1, 1, 1, 1, 1,
1.174882, -0.9144691, 1.321238, 1, 1, 1, 1, 1,
1.176124, 2.398667, 0.3160595, 1, 1, 1, 1, 1,
1.177023, 0.1578173, 1.84308, 1, 1, 1, 1, 1,
1.187155, -0.8430275, 2.836522, 1, 1, 1, 1, 1,
1.18803, 0.6486344, -0.3813893, 1, 1, 1, 1, 1,
1.188038, 0.4247364, 0.4237305, 1, 1, 1, 1, 1,
1.191808, -1.901832, 2.816552, 1, 1, 1, 1, 1,
1.195793, -0.822844, 2.18965, 1, 1, 1, 1, 1,
1.197054, -0.7011997, 2.673583, 1, 1, 1, 1, 1,
1.200374, -1.617128, 3.010185, 1, 1, 1, 1, 1,
1.202774, -0.1633113, 2.498557, 1, 1, 1, 1, 1,
1.206745, -0.7585503, 3.032289, 1, 1, 1, 1, 1,
1.224993, 1.043518, 2.076504, 0, 0, 1, 1, 1,
1.229103, -0.4335763, 1.856257, 1, 0, 0, 1, 1,
1.233799, -1.94375, -0.05545211, 1, 0, 0, 1, 1,
1.234124, 0.5633239, 1.310876, 1, 0, 0, 1, 1,
1.235101, 2.022005, -0.3208523, 1, 0, 0, 1, 1,
1.252987, -1.622694, 2.49044, 1, 0, 0, 1, 1,
1.261073, -1.941393, 1.422156, 0, 0, 0, 1, 1,
1.267496, -0.3950866, 3.452668, 0, 0, 0, 1, 1,
1.268979, 1.170636, 1.745213, 0, 0, 0, 1, 1,
1.269622, -0.7737551, 2.206204, 0, 0, 0, 1, 1,
1.277214, 1.950822, 1.388539, 0, 0, 0, 1, 1,
1.277441, 1.138003, 0.7224823, 0, 0, 0, 1, 1,
1.278121, 0.654758, 1.068925, 0, 0, 0, 1, 1,
1.278606, -0.03733131, 1.494218, 1, 1, 1, 1, 1,
1.288778, 1.701721, -0.3108378, 1, 1, 1, 1, 1,
1.293763, -1.305254, 1.020713, 1, 1, 1, 1, 1,
1.295319, 0.4262077, 2.205461, 1, 1, 1, 1, 1,
1.298226, -0.1383711, 0.9727846, 1, 1, 1, 1, 1,
1.301102, 0.5486137, 1.561447, 1, 1, 1, 1, 1,
1.301161, -1.128817, 2.824144, 1, 1, 1, 1, 1,
1.302011, 1.472335, 0.7143121, 1, 1, 1, 1, 1,
1.302492, 0.9142715, 0.8261005, 1, 1, 1, 1, 1,
1.305524, 0.5034264, 0.05245615, 1, 1, 1, 1, 1,
1.307632, 0.5127891, 0.1192563, 1, 1, 1, 1, 1,
1.308825, 1.099416, -0.3278506, 1, 1, 1, 1, 1,
1.310794, -0.4186809, -0.7317719, 1, 1, 1, 1, 1,
1.317432, 1.007734, 2.013136, 1, 1, 1, 1, 1,
1.318033, 0.03112964, 1.018937, 1, 1, 1, 1, 1,
1.337755, 1.327882, 0.4061919, 0, 0, 1, 1, 1,
1.352009, 2.73037, 1.810733, 1, 0, 0, 1, 1,
1.359634, 1.612404, 2.388044, 1, 0, 0, 1, 1,
1.366235, 0.3104863, 0.8098126, 1, 0, 0, 1, 1,
1.366349, -0.05667941, 1.627437, 1, 0, 0, 1, 1,
1.375882, -1.370018, 0.8027625, 1, 0, 0, 1, 1,
1.376307, 0.2433867, 1.145938, 0, 0, 0, 1, 1,
1.379151, 0.6491485, 1.456597, 0, 0, 0, 1, 1,
1.38536, -0.4381492, 1.127251, 0, 0, 0, 1, 1,
1.387273, -0.2028557, 2.21982, 0, 0, 0, 1, 1,
1.395283, 1.409363, -0.4903866, 0, 0, 0, 1, 1,
1.415897, -0.7180568, 1.290003, 0, 0, 0, 1, 1,
1.425099, -0.2061434, 1.762151, 0, 0, 0, 1, 1,
1.45603, -0.844733, 0.8515556, 1, 1, 1, 1, 1,
1.467333, -1.580739, 3.03131, 1, 1, 1, 1, 1,
1.472125, -2.948205, 3.585778, 1, 1, 1, 1, 1,
1.476484, -0.9338334, 2.436164, 1, 1, 1, 1, 1,
1.477481, 1.27014, 1.143766, 1, 1, 1, 1, 1,
1.478501, -0.2461465, 2.045724, 1, 1, 1, 1, 1,
1.479405, 1.251207, 0.07523438, 1, 1, 1, 1, 1,
1.480178, 0.4384267, 1.716342, 1, 1, 1, 1, 1,
1.489259, 1.668626, 0.04505491, 1, 1, 1, 1, 1,
1.500207, 0.4602872, 1.415911, 1, 1, 1, 1, 1,
1.505759, 0.4315523, 0.2854865, 1, 1, 1, 1, 1,
1.50753, 1.281165, -0.3384855, 1, 1, 1, 1, 1,
1.512321, 0.0681456, 1.27302, 1, 1, 1, 1, 1,
1.516128, 2.597872, 1.174523, 1, 1, 1, 1, 1,
1.539388, 0.4123331, 0.01894685, 1, 1, 1, 1, 1,
1.556472, 0.392445, 1.05421, 0, 0, 1, 1, 1,
1.567428, -0.255425, 1.981521, 1, 0, 0, 1, 1,
1.573589, -0.5109823, 2.689062, 1, 0, 0, 1, 1,
1.589717, 1.078799, 0.2750891, 1, 0, 0, 1, 1,
1.589789, 1.492142, -0.9570762, 1, 0, 0, 1, 1,
1.599576, -0.2667845, 1.537711, 1, 0, 0, 1, 1,
1.634201, 1.143025, -0.07244078, 0, 0, 0, 1, 1,
1.635651, -0.2533584, 1.875932, 0, 0, 0, 1, 1,
1.662383, -0.6779494, 1.897921, 0, 0, 0, 1, 1,
1.666119, 0.7054031, -0.9412377, 0, 0, 0, 1, 1,
1.668678, 0.3729275, 1.376958, 0, 0, 0, 1, 1,
1.691388, 1.123116, 2.541649, 0, 0, 0, 1, 1,
1.698359, -1.130432, 1.505547, 0, 0, 0, 1, 1,
1.716407, 0.4822146, 0.6866077, 1, 1, 1, 1, 1,
1.734774, -0.5559903, 2.242179, 1, 1, 1, 1, 1,
1.736261, 1.269384, 1.883202, 1, 1, 1, 1, 1,
1.778527, -0.2822994, 1.032732, 1, 1, 1, 1, 1,
1.783201, 0.476622, 2.443706, 1, 1, 1, 1, 1,
1.808474, -0.5357428, 1.547046, 1, 1, 1, 1, 1,
1.844722, -1.807478, 1.532898, 1, 1, 1, 1, 1,
1.850313, -0.8422427, 1.452928, 1, 1, 1, 1, 1,
1.853902, -0.6268097, 2.280457, 1, 1, 1, 1, 1,
1.854897, 0.04063473, 0.7958568, 1, 1, 1, 1, 1,
1.872787, 1.896817, 2.476495, 1, 1, 1, 1, 1,
1.873336, 0.1811055, 1.67679, 1, 1, 1, 1, 1,
1.905733, -0.1216751, 0.9128071, 1, 1, 1, 1, 1,
1.916117, 0.7786648, 0.6024484, 1, 1, 1, 1, 1,
1.930713, 0.4340499, 0.968219, 1, 1, 1, 1, 1,
1.944938, 0.7299939, 0.4246765, 0, 0, 1, 1, 1,
1.94688, -2.659844, 2.861123, 1, 0, 0, 1, 1,
1.951445, -1.13214, 0.9093508, 1, 0, 0, 1, 1,
1.964852, 0.5000651, -0.4546636, 1, 0, 0, 1, 1,
1.986593, 0.2532844, 1.393885, 1, 0, 0, 1, 1,
2.016315, -0.6214135, 2.601809, 1, 0, 0, 1, 1,
2.027086, -0.950205, 2.726007, 0, 0, 0, 1, 1,
2.05713, -0.8121204, 2.290997, 0, 0, 0, 1, 1,
2.065654, -0.2397828, 2.138375, 0, 0, 0, 1, 1,
2.115113, 0.9865089, 2.290051, 0, 0, 0, 1, 1,
2.137838, 0.8196452, 2.311706, 0, 0, 0, 1, 1,
2.158517, 1.583694, -0.1642993, 0, 0, 0, 1, 1,
2.368592, 0.7438508, 1.467903, 0, 0, 0, 1, 1,
2.437794, 2.125241, 2.421092, 1, 1, 1, 1, 1,
2.479335, -0.6123106, 1.076559, 1, 1, 1, 1, 1,
2.486905, 0.1367115, 0.5056104, 1, 1, 1, 1, 1,
2.52804, 0.3023314, 2.411405, 1, 1, 1, 1, 1,
3.033933, -1.425349, 0.4039661, 1, 1, 1, 1, 1,
3.064397, 0.3238572, 0.3770658, 1, 1, 1, 1, 1,
3.436757, -1.272448, 0.947314, 1, 1, 1, 1, 1
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
var radius = 9.758258;
var distance = 34.27547;
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
mvMatrix.translate( 0.002782106, -0.1766276, 0.252501 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.27547);
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
