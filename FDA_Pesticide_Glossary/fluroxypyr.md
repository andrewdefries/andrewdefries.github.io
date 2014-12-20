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
-3.897246, -1.534946, -1.734389, 1, 0, 0, 1,
-3.219023, 0.9990471, -1.53413, 1, 0.007843138, 0, 1,
-3.024554, 0.5869244, -0.7771666, 1, 0.01176471, 0, 1,
-2.973011, 0.2434434, -1.43997, 1, 0.01960784, 0, 1,
-2.69986, -1.328908, -0.8850625, 1, 0.02352941, 0, 1,
-2.599452, 1.046396, -1.177379, 1, 0.03137255, 0, 1,
-2.430492, 0.699192, -1.030761, 1, 0.03529412, 0, 1,
-2.372014, -0.01917657, -1.738014, 1, 0.04313726, 0, 1,
-2.353121, 0.8757959, 0.8726448, 1, 0.04705882, 0, 1,
-2.219155, -0.8057649, -1.756945, 1, 0.05490196, 0, 1,
-2.21063, 0.446061, -1.553304, 1, 0.05882353, 0, 1,
-2.210591, -0.002314975, -1.108897, 1, 0.06666667, 0, 1,
-2.149397, -0.9206305, -2.869151, 1, 0.07058824, 0, 1,
-2.124171, -0.1134278, -2.2579, 1, 0.07843138, 0, 1,
-2.071021, -1.547393, -2.963012, 1, 0.08235294, 0, 1,
-2.024891, -0.449382, -2.368644, 1, 0.09019608, 0, 1,
-2.008205, 0.3977746, -3.277533, 1, 0.09411765, 0, 1,
-2.006157, 1.718169, 1.695972, 1, 0.1019608, 0, 1,
-2.005077, -1.035049, -4.270613, 1, 0.1098039, 0, 1,
-2.00429, 0.2252553, 1.236048, 1, 0.1137255, 0, 1,
-1.985869, -1.349559, -2.43888, 1, 0.1215686, 0, 1,
-1.983263, 2.129231, -0.5622954, 1, 0.1254902, 0, 1,
-1.93509, 0.7577944, -2.024193, 1, 0.1333333, 0, 1,
-1.907618, -0.6406972, -1.697562, 1, 0.1372549, 0, 1,
-1.888461, 1.298354, -1.452862, 1, 0.145098, 0, 1,
-1.887446, -0.1052846, -1.304076, 1, 0.1490196, 0, 1,
-1.882546, -1.358547, -2.718535, 1, 0.1568628, 0, 1,
-1.877473, -1.42984, -3.663377, 1, 0.1607843, 0, 1,
-1.86899, 0.4764238, -0.03643562, 1, 0.1686275, 0, 1,
-1.847744, 0.5065196, -2.54059, 1, 0.172549, 0, 1,
-1.841815, -0.8260552, -3.825155, 1, 0.1803922, 0, 1,
-1.809785, 1.675821, -1.70937, 1, 0.1843137, 0, 1,
-1.752936, 1.607986, -2.182888, 1, 0.1921569, 0, 1,
-1.750249, 0.684832, -0.6117654, 1, 0.1960784, 0, 1,
-1.746653, 1.834511, -0.8222578, 1, 0.2039216, 0, 1,
-1.716848, -0.1459451, -1.61459, 1, 0.2117647, 0, 1,
-1.709875, -1.554391, -2.56297, 1, 0.2156863, 0, 1,
-1.688441, 0.9479803, -2.693429, 1, 0.2235294, 0, 1,
-1.678684, 0.4788038, -1.981527, 1, 0.227451, 0, 1,
-1.676101, 0.7737069, -0.4445303, 1, 0.2352941, 0, 1,
-1.675514, 0.9842279, -1.029619, 1, 0.2392157, 0, 1,
-1.667857, 0.4794491, -2.018036, 1, 0.2470588, 0, 1,
-1.658529, -2.551397, -4.249779, 1, 0.2509804, 0, 1,
-1.65492, -0.4330418, -2.180996, 1, 0.2588235, 0, 1,
-1.653017, -0.2248969, -2.935485, 1, 0.2627451, 0, 1,
-1.649399, 0.07360251, -2.24788, 1, 0.2705882, 0, 1,
-1.648275, -1.505632, -3.002537, 1, 0.2745098, 0, 1,
-1.639941, 0.08822813, -1.793624, 1, 0.282353, 0, 1,
-1.634339, -1.930866, -0.3790635, 1, 0.2862745, 0, 1,
-1.634311, -0.2096109, -1.502931, 1, 0.2941177, 0, 1,
-1.631804, 2.461242, -1.662573, 1, 0.3019608, 0, 1,
-1.62851, 0.1014665, -1.552686, 1, 0.3058824, 0, 1,
-1.618338, 1.596349, -0.9996315, 1, 0.3137255, 0, 1,
-1.61742, -1.095865, -0.7964134, 1, 0.3176471, 0, 1,
-1.617049, 0.6866236, -1.498247, 1, 0.3254902, 0, 1,
-1.613258, -1.045181e-05, -1.362182, 1, 0.3294118, 0, 1,
-1.589652, -0.7681757, -3.326247, 1, 0.3372549, 0, 1,
-1.575649, 0.02205639, 0.6561099, 1, 0.3411765, 0, 1,
-1.567683, 0.1321531, -2.555207, 1, 0.3490196, 0, 1,
-1.565953, 1.258185, -0.04860771, 1, 0.3529412, 0, 1,
-1.562062, 0.4363212, -0.9776309, 1, 0.3607843, 0, 1,
-1.5477, 0.4182403, -2.628295, 1, 0.3647059, 0, 1,
-1.541528, -0.198605, -3.187741, 1, 0.372549, 0, 1,
-1.539745, -0.9528429, -1.910319, 1, 0.3764706, 0, 1,
-1.531637, 0.01943273, -0.816426, 1, 0.3843137, 0, 1,
-1.529916, -0.04494657, -0.6673477, 1, 0.3882353, 0, 1,
-1.529005, 1.837591, -2.227969, 1, 0.3960784, 0, 1,
-1.522195, 1.481316, 0.2136579, 1, 0.4039216, 0, 1,
-1.509269, 0.0964828, -2.339815, 1, 0.4078431, 0, 1,
-1.496988, -0.6654122, -3.378598, 1, 0.4156863, 0, 1,
-1.48912, -1.118427, -1.598481, 1, 0.4196078, 0, 1,
-1.481513, 0.02773483, -0.1644467, 1, 0.427451, 0, 1,
-1.474438, -0.09592266, -1.205133, 1, 0.4313726, 0, 1,
-1.469576, 0.5451089, -0.01650974, 1, 0.4392157, 0, 1,
-1.464057, 0.2253136, -1.316874, 1, 0.4431373, 0, 1,
-1.450902, 1.459913, -0.3277305, 1, 0.4509804, 0, 1,
-1.433216, 0.06799834, -0.7722851, 1, 0.454902, 0, 1,
-1.42851, -0.3352575, -0.8415536, 1, 0.4627451, 0, 1,
-1.425219, 1.456379, -0.5283641, 1, 0.4666667, 0, 1,
-1.408058, 1.274953, -1.422512, 1, 0.4745098, 0, 1,
-1.40462, -0.310308, -2.149047, 1, 0.4784314, 0, 1,
-1.403169, 0.9063908, -1.26564, 1, 0.4862745, 0, 1,
-1.401335, 0.7249725, -1.463521, 1, 0.4901961, 0, 1,
-1.396059, 0.296735, -0.2811585, 1, 0.4980392, 0, 1,
-1.396055, 0.5096642, -1.04587, 1, 0.5058824, 0, 1,
-1.393802, 0.3120602, -1.945938, 1, 0.509804, 0, 1,
-1.387883, 0.02537297, -1.986403, 1, 0.5176471, 0, 1,
-1.378167, -2.151967, -4.834573, 1, 0.5215687, 0, 1,
-1.377293, 0.4106334, -2.059304, 1, 0.5294118, 0, 1,
-1.365785, -0.6129629, -3.017725, 1, 0.5333334, 0, 1,
-1.353614, -1.361894, -3.674083, 1, 0.5411765, 0, 1,
-1.344381, -1.349035, -2.24806, 1, 0.5450981, 0, 1,
-1.341521, 0.426819, 0.06690962, 1, 0.5529412, 0, 1,
-1.340263, 0.6423123, -3.370675, 1, 0.5568628, 0, 1,
-1.334182, 2.029828, 0.7268794, 1, 0.5647059, 0, 1,
-1.31977, -0.7120196, -1.995619, 1, 0.5686275, 0, 1,
-1.299025, 1.558956, -0.07783003, 1, 0.5764706, 0, 1,
-1.286074, 0.8726009, 0.9644549, 1, 0.5803922, 0, 1,
-1.277771, -1.724252, -3.9537, 1, 0.5882353, 0, 1,
-1.272909, 0.9631047, -0.9019991, 1, 0.5921569, 0, 1,
-1.268327, 2.558638, -0.4210173, 1, 0.6, 0, 1,
-1.267825, -1.041762, -1.802604, 1, 0.6078432, 0, 1,
-1.264243, -1.023216, -2.573229, 1, 0.6117647, 0, 1,
-1.258353, -0.1372621, -1.499188, 1, 0.6196079, 0, 1,
-1.249271, -1.107562, -1.413356, 1, 0.6235294, 0, 1,
-1.244082, 0.01069367, -1.614544, 1, 0.6313726, 0, 1,
-1.234416, 0.2085615, -4.326031, 1, 0.6352941, 0, 1,
-1.216694, -0.0435236, -0.2704017, 1, 0.6431373, 0, 1,
-1.215664, 1.40227, -0.5492185, 1, 0.6470588, 0, 1,
-1.215335, 0.9899261, -3.138111, 1, 0.654902, 0, 1,
-1.213273, -1.563873, -0.8467108, 1, 0.6588235, 0, 1,
-1.208992, 1.668431, 0.7930726, 1, 0.6666667, 0, 1,
-1.2057, -1.529241, -0.01746973, 1, 0.6705883, 0, 1,
-1.205604, 0.5574892, -0.5759665, 1, 0.6784314, 0, 1,
-1.204669, -0.2834346, -1.239754, 1, 0.682353, 0, 1,
-1.198689, -1.042791, -1.963293, 1, 0.6901961, 0, 1,
-1.191944, 1.962718, -0.8772262, 1, 0.6941177, 0, 1,
-1.188703, 0.2639284, -2.928979, 1, 0.7019608, 0, 1,
-1.188339, 2.525594, 0.3601272, 1, 0.7098039, 0, 1,
-1.187493, -1.019686, -2.120991, 1, 0.7137255, 0, 1,
-1.176381, 0.982564, 0.03056143, 1, 0.7215686, 0, 1,
-1.165201, 1.218793, 0.6537498, 1, 0.7254902, 0, 1,
-1.158988, -0.2247396, -0.2328214, 1, 0.7333333, 0, 1,
-1.155932, -0.8631833, -1.581961, 1, 0.7372549, 0, 1,
-1.155094, -1.917328, -4.249626, 1, 0.7450981, 0, 1,
-1.152063, -0.4412524, -2.018039, 1, 0.7490196, 0, 1,
-1.151346, 1.042312, -0.2159476, 1, 0.7568628, 0, 1,
-1.145166, 1.51054, 0.3530007, 1, 0.7607843, 0, 1,
-1.134617, 0.2266139, -2.249342, 1, 0.7686275, 0, 1,
-1.131377, 1.29066, 0.2038272, 1, 0.772549, 0, 1,
-1.124547, 0.2653835, -1.380587, 1, 0.7803922, 0, 1,
-1.122907, -1.608443, -2.920358, 1, 0.7843137, 0, 1,
-1.120049, 0.740944, -2.43049, 1, 0.7921569, 0, 1,
-1.117459, 1.342848, -1.816232, 1, 0.7960784, 0, 1,
-1.113253, 0.3114503, -2.500641, 1, 0.8039216, 0, 1,
-1.11171, -0.3748394, -1.385433, 1, 0.8117647, 0, 1,
-1.110354, 0.484557, -0.2385833, 1, 0.8156863, 0, 1,
-1.106885, -0.6018361, -1.707093, 1, 0.8235294, 0, 1,
-1.102264, 0.3240837, -1.373276, 1, 0.827451, 0, 1,
-1.093976, 2.127277, 0.2064855, 1, 0.8352941, 0, 1,
-1.085795, -0.8664351, -3.341934, 1, 0.8392157, 0, 1,
-1.073856, 1.165995, -1.307141, 1, 0.8470588, 0, 1,
-1.073082, 0.2662438, -0.7316367, 1, 0.8509804, 0, 1,
-1.065602, -0.4680536, -1.368598, 1, 0.8588235, 0, 1,
-1.064241, -0.6850727, -0.8780459, 1, 0.8627451, 0, 1,
-1.062039, 0.7338366, -1.547487, 1, 0.8705882, 0, 1,
-1.055346, 0.7021019, -1.36825, 1, 0.8745098, 0, 1,
-1.050618, -0.3441372, -0.2990194, 1, 0.8823529, 0, 1,
-1.047034, 0.006000239, -1.595131, 1, 0.8862745, 0, 1,
-1.040825, 1.253803, 0.1881193, 1, 0.8941177, 0, 1,
-1.037398, 2.638716, -1.140625, 1, 0.8980392, 0, 1,
-1.035514, -0.1737825, -1.654842, 1, 0.9058824, 0, 1,
-1.025681, -1.233496, -1.686631, 1, 0.9137255, 0, 1,
-1.021674, 0.3706536, -2.489085, 1, 0.9176471, 0, 1,
-1.012085, 0.2518492, -2.128838, 1, 0.9254902, 0, 1,
-1.006065, -0.2689076, -1.331244, 1, 0.9294118, 0, 1,
-0.998351, 1.160066, -0.7742146, 1, 0.9372549, 0, 1,
-0.9944879, -0.07397931, -3.008442, 1, 0.9411765, 0, 1,
-0.9936232, -1.769749, -3.420791, 1, 0.9490196, 0, 1,
-0.9907059, -0.2446761, -1.611781, 1, 0.9529412, 0, 1,
-0.9898777, -1.105289, -2.831135, 1, 0.9607843, 0, 1,
-0.9882364, 0.4799574, -0.2721111, 1, 0.9647059, 0, 1,
-0.9772717, 0.7016872, -0.5090656, 1, 0.972549, 0, 1,
-0.9747319, 1.249756, 1.029076, 1, 0.9764706, 0, 1,
-0.9688518, -0.8387946, -2.085657, 1, 0.9843137, 0, 1,
-0.9598384, 1.082158, 0.1338738, 1, 0.9882353, 0, 1,
-0.9497579, -0.2279615, -2.611865, 1, 0.9960784, 0, 1,
-0.9478561, 0.4233535, 0.9558539, 0.9960784, 1, 0, 1,
-0.9401469, 0.3596199, 1.328956, 0.9921569, 1, 0, 1,
-0.9376516, 0.005823276, -1.174664, 0.9843137, 1, 0, 1,
-0.928393, -0.3752443, -2.365354, 0.9803922, 1, 0, 1,
-0.9275392, -1.374508, 0.1747697, 0.972549, 1, 0, 1,
-0.9274369, -0.5664723, -3.634508, 0.9686275, 1, 0, 1,
-0.9257107, -0.7520068, -0.8751389, 0.9607843, 1, 0, 1,
-0.9235685, 0.3621742, -1.109787, 0.9568627, 1, 0, 1,
-0.9203547, 1.739189, -0.4852671, 0.9490196, 1, 0, 1,
-0.9141689, -0.9564673, -2.091521, 0.945098, 1, 0, 1,
-0.9136794, 0.2399482, -3.048175, 0.9372549, 1, 0, 1,
-0.9065527, -1.32371, -2.036796, 0.9333333, 1, 0, 1,
-0.9033055, -1.842166, -2.52292, 0.9254902, 1, 0, 1,
-0.9016686, 1.110246, -1.143763, 0.9215686, 1, 0, 1,
-0.8959973, -0.6703246, -1.984863, 0.9137255, 1, 0, 1,
-0.8955277, -0.629685, -2.273955, 0.9098039, 1, 0, 1,
-0.8945599, -1.00167, -2.514294, 0.9019608, 1, 0, 1,
-0.8811833, 0.7438501, -1.152655, 0.8941177, 1, 0, 1,
-0.8793824, 0.09499824, -0.3221485, 0.8901961, 1, 0, 1,
-0.8759143, 1.322844, 1.613593, 0.8823529, 1, 0, 1,
-0.8753771, 0.1369499, -1.696722, 0.8784314, 1, 0, 1,
-0.8730842, -0.7448335, -2.086673, 0.8705882, 1, 0, 1,
-0.865272, -0.3818198, -3.453836, 0.8666667, 1, 0, 1,
-0.8644639, 0.09597377, -1.037134, 0.8588235, 1, 0, 1,
-0.8627617, -0.6724197, -3.232906, 0.854902, 1, 0, 1,
-0.8597239, -0.2520364, -0.6811288, 0.8470588, 1, 0, 1,
-0.8565185, 0.6047157, -1.536724, 0.8431373, 1, 0, 1,
-0.8503381, -0.8806009, -1.606872, 0.8352941, 1, 0, 1,
-0.8487604, -1.454038, -2.766942, 0.8313726, 1, 0, 1,
-0.8455284, -0.5117618, -2.464615, 0.8235294, 1, 0, 1,
-0.8373728, -1.112879, -3.138188, 0.8196079, 1, 0, 1,
-0.8368936, 1.043077, -0.7870435, 0.8117647, 1, 0, 1,
-0.8321369, -0.7247716, -1.785753, 0.8078431, 1, 0, 1,
-0.826188, -1.894857, -0.6862043, 0.8, 1, 0, 1,
-0.8261209, 0.8298627, -2.245818, 0.7921569, 1, 0, 1,
-0.815017, -1.905308, -2.325374, 0.7882353, 1, 0, 1,
-0.8145236, 0.8658231, 0.1457522, 0.7803922, 1, 0, 1,
-0.8099014, -0.0863122, -2.394727, 0.7764706, 1, 0, 1,
-0.8024498, -0.2303507, -1.338765, 0.7686275, 1, 0, 1,
-0.8008451, 0.7177129, -1.760583, 0.7647059, 1, 0, 1,
-0.7954607, -1.831815, -2.687472, 0.7568628, 1, 0, 1,
-0.7901836, -0.6052529, -2.530055, 0.7529412, 1, 0, 1,
-0.7897314, 0.6225294, -0.04880587, 0.7450981, 1, 0, 1,
-0.7866277, 1.166745, -1.872119, 0.7411765, 1, 0, 1,
-0.7865818, -0.1209491, -1.127334, 0.7333333, 1, 0, 1,
-0.7812549, -0.1040818, -1.458015, 0.7294118, 1, 0, 1,
-0.780327, -1.267917, -1.327959, 0.7215686, 1, 0, 1,
-0.7793908, -0.03917842, -2.876386, 0.7176471, 1, 0, 1,
-0.777926, -0.118953, -0.9801568, 0.7098039, 1, 0, 1,
-0.7747164, -0.04233951, -3.229392, 0.7058824, 1, 0, 1,
-0.767912, -0.6421059, -2.142318, 0.6980392, 1, 0, 1,
-0.7598045, 1.067775, -0.8638234, 0.6901961, 1, 0, 1,
-0.7576552, -0.9224947, -1.736651, 0.6862745, 1, 0, 1,
-0.7565548, 0.2264711, -0.7959368, 0.6784314, 1, 0, 1,
-0.7560229, 2.333075, 0.2917516, 0.6745098, 1, 0, 1,
-0.7544016, 0.3948008, 0.3905325, 0.6666667, 1, 0, 1,
-0.7532857, -2.337655, -3.136647, 0.6627451, 1, 0, 1,
-0.7523615, 0.6980147, 0.4858846, 0.654902, 1, 0, 1,
-0.7489194, -1.07369, -1.323524, 0.6509804, 1, 0, 1,
-0.7485711, -0.2548819, -2.337732, 0.6431373, 1, 0, 1,
-0.7478044, -1.092233, -3.141348, 0.6392157, 1, 0, 1,
-0.742887, -1.362408, -3.851716, 0.6313726, 1, 0, 1,
-0.742662, 1.134912, 0.3991152, 0.627451, 1, 0, 1,
-0.7363339, -0.280523, -2.684299, 0.6196079, 1, 0, 1,
-0.7363076, -0.2840916, -2.190993, 0.6156863, 1, 0, 1,
-0.7342255, 0.9392341, -1.183549, 0.6078432, 1, 0, 1,
-0.7318769, -0.5041559, -1.627555, 0.6039216, 1, 0, 1,
-0.7278659, -1.032981, -1.732812, 0.5960785, 1, 0, 1,
-0.7274827, 0.8281692, -1.320283, 0.5882353, 1, 0, 1,
-0.7199326, -0.8849481, -1.74759, 0.5843138, 1, 0, 1,
-0.7196833, 0.8422493, 0.008273407, 0.5764706, 1, 0, 1,
-0.7140631, -0.2291224, -1.385235, 0.572549, 1, 0, 1,
-0.7127001, -1.408794, -2.391234, 0.5647059, 1, 0, 1,
-0.7092338, 2.420752, -1.135155, 0.5607843, 1, 0, 1,
-0.7086093, 1.264472, -0.002495748, 0.5529412, 1, 0, 1,
-0.7046783, 1.206404, 0.4856428, 0.5490196, 1, 0, 1,
-0.7027794, -0.1468041, -3.078403, 0.5411765, 1, 0, 1,
-0.694486, 1.082016, 0.294286, 0.5372549, 1, 0, 1,
-0.6944721, -1.419073, -3.251269, 0.5294118, 1, 0, 1,
-0.693424, 0.6827837, -2.419844, 0.5254902, 1, 0, 1,
-0.6915348, 0.6565561, -0.3424053, 0.5176471, 1, 0, 1,
-0.6900809, 1.877057, -0.8210127, 0.5137255, 1, 0, 1,
-0.6883813, -0.928919, -3.241952, 0.5058824, 1, 0, 1,
-0.6871516, 0.44095, 1.064641, 0.5019608, 1, 0, 1,
-0.6840509, 0.317541, -0.2358202, 0.4941176, 1, 0, 1,
-0.6838688, 1.05965, -0.0367632, 0.4862745, 1, 0, 1,
-0.6836096, 0.2056607, 1.024298, 0.4823529, 1, 0, 1,
-0.6818702, 0.4756092, -1.478586, 0.4745098, 1, 0, 1,
-0.6810577, -0.3830675, -2.848028, 0.4705882, 1, 0, 1,
-0.6767702, -0.5963339, -1.299824, 0.4627451, 1, 0, 1,
-0.6760696, 0.1600126, -1.964779, 0.4588235, 1, 0, 1,
-0.672381, -0.1919409, -0.4543906, 0.4509804, 1, 0, 1,
-0.6699175, -0.8754727, -3.460272, 0.4470588, 1, 0, 1,
-0.6687711, 0.9471232, -1.420423, 0.4392157, 1, 0, 1,
-0.6686468, 0.6581737, -0.4074749, 0.4352941, 1, 0, 1,
-0.6617133, -0.442763, -3.39615, 0.427451, 1, 0, 1,
-0.660108, 0.05481811, -2.578798, 0.4235294, 1, 0, 1,
-0.6543638, 0.950094, -2.47155, 0.4156863, 1, 0, 1,
-0.6508481, 0.03106672, -1.726211, 0.4117647, 1, 0, 1,
-0.6498689, -1.058689, -2.276986, 0.4039216, 1, 0, 1,
-0.6448009, 1.08858, -0.7780562, 0.3960784, 1, 0, 1,
-0.6386148, 0.6414443, -1.189085, 0.3921569, 1, 0, 1,
-0.6372371, -0.8342068, -2.131019, 0.3843137, 1, 0, 1,
-0.6328645, 0.6558046, -0.2447024, 0.3803922, 1, 0, 1,
-0.6304582, -0.711889, -1.626781, 0.372549, 1, 0, 1,
-0.6272102, -0.1033497, -2.722465, 0.3686275, 1, 0, 1,
-0.6270648, 0.7440328, -1.220076, 0.3607843, 1, 0, 1,
-0.6158974, -0.3731844, -2.517983, 0.3568628, 1, 0, 1,
-0.6131281, 0.7519348, 0.04943549, 0.3490196, 1, 0, 1,
-0.612254, 0.1263561, -1.388687, 0.345098, 1, 0, 1,
-0.6095077, -1.158363, -2.263081, 0.3372549, 1, 0, 1,
-0.6093649, -2.205043, -2.536616, 0.3333333, 1, 0, 1,
-0.6030947, -0.8004005, -0.8861986, 0.3254902, 1, 0, 1,
-0.6019325, -0.518406, -1.545296, 0.3215686, 1, 0, 1,
-0.6000841, -0.1942707, -1.060798, 0.3137255, 1, 0, 1,
-0.5958824, 1.880916, -1.956937, 0.3098039, 1, 0, 1,
-0.594766, -0.7095718, -2.106302, 0.3019608, 1, 0, 1,
-0.5940346, -0.8360696, -3.716221, 0.2941177, 1, 0, 1,
-0.5938932, 0.7393274, -1.829265, 0.2901961, 1, 0, 1,
-0.5896625, -1.011685, -3.106512, 0.282353, 1, 0, 1,
-0.5895116, -0.3880324, -1.139201, 0.2784314, 1, 0, 1,
-0.5867102, -0.9879628, -2.045828, 0.2705882, 1, 0, 1,
-0.5850713, -0.7687979, -2.502952, 0.2666667, 1, 0, 1,
-0.5845787, -0.8921644, -1.663551, 0.2588235, 1, 0, 1,
-0.5794381, 1.703737, -0.3383582, 0.254902, 1, 0, 1,
-0.5751522, -0.003976859, -2.541398, 0.2470588, 1, 0, 1,
-0.5724881, -0.4258111, -1.532578, 0.2431373, 1, 0, 1,
-0.5723696, -1.295676, -2.516156, 0.2352941, 1, 0, 1,
-0.5683176, 0.4638617, -1.698224, 0.2313726, 1, 0, 1,
-0.5656456, 0.1823962, -2.471725, 0.2235294, 1, 0, 1,
-0.5644881, -1.54252, -2.215111, 0.2196078, 1, 0, 1,
-0.5594577, -2.92617, -2.471333, 0.2117647, 1, 0, 1,
-0.5582088, 0.4840497, 0.8353166, 0.2078431, 1, 0, 1,
-0.5570785, -1.516156, -4.298692, 0.2, 1, 0, 1,
-0.5569261, -0.4289053, -1.819032, 0.1921569, 1, 0, 1,
-0.553623, -0.6922795, -3.097627, 0.1882353, 1, 0, 1,
-0.5508938, -1.074066, -3.372435, 0.1803922, 1, 0, 1,
-0.5508516, 0.2408288, -1.491295, 0.1764706, 1, 0, 1,
-0.5419339, -0.02822012, -2.380255, 0.1686275, 1, 0, 1,
-0.5392142, -0.4050757, -2.716664, 0.1647059, 1, 0, 1,
-0.5348957, -0.6240485, -1.206147, 0.1568628, 1, 0, 1,
-0.52725, 0.08179396, -1.791328, 0.1529412, 1, 0, 1,
-0.5265567, -0.5271427, -0.7558697, 0.145098, 1, 0, 1,
-0.5253412, 1.158007, 1.314728, 0.1411765, 1, 0, 1,
-0.5210702, -1.607038, -3.020443, 0.1333333, 1, 0, 1,
-0.5166455, -1.432151, -1.394268, 0.1294118, 1, 0, 1,
-0.5101932, 0.02864429, -2.211031, 0.1215686, 1, 0, 1,
-0.5100917, 0.0527088, -1.450886, 0.1176471, 1, 0, 1,
-0.5031876, -0.1127291, -1.613556, 0.1098039, 1, 0, 1,
-0.5018374, -0.508846, -2.820671, 0.1058824, 1, 0, 1,
-0.499587, -1.687997, -2.913075, 0.09803922, 1, 0, 1,
-0.498807, 1.753196, -0.1774115, 0.09019608, 1, 0, 1,
-0.4973388, -1.829778, -2.783663, 0.08627451, 1, 0, 1,
-0.4946108, -0.9500512, -2.696311, 0.07843138, 1, 0, 1,
-0.4938477, -0.1346954, -1.229702, 0.07450981, 1, 0, 1,
-0.4930833, 0.6267462, -2.417362, 0.06666667, 1, 0, 1,
-0.4905173, -0.6240214, -4.359071, 0.0627451, 1, 0, 1,
-0.4893357, 0.5687891, -0.01305907, 0.05490196, 1, 0, 1,
-0.488023, 0.3674205, -1.155843, 0.05098039, 1, 0, 1,
-0.4844585, -0.08215381, -0.3481039, 0.04313726, 1, 0, 1,
-0.4829195, 0.08095677, -1.270118, 0.03921569, 1, 0, 1,
-0.4809285, -0.6463922, -2.593146, 0.03137255, 1, 0, 1,
-0.4771682, 1.314013, -0.5320485, 0.02745098, 1, 0, 1,
-0.4746363, -0.7821085, -2.22804, 0.01960784, 1, 0, 1,
-0.4739155, 0.1939189, -2.159843, 0.01568628, 1, 0, 1,
-0.4738967, 1.131879, 0.6734263, 0.007843138, 1, 0, 1,
-0.4715987, 0.3639576, 0.875998, 0.003921569, 1, 0, 1,
-0.4702232, -0.1499642, -1.705889, 0, 1, 0.003921569, 1,
-0.4690025, 0.6338958, -1.415209, 0, 1, 0.01176471, 1,
-0.4566119, 0.6178522, -1.574703, 0, 1, 0.01568628, 1,
-0.4566045, -0.5792208, -1.128363, 0, 1, 0.02352941, 1,
-0.4550959, 0.6606903, -1.453879, 0, 1, 0.02745098, 1,
-0.4497113, 1.456477, -0.7487485, 0, 1, 0.03529412, 1,
-0.4486749, -1.820324, -2.704346, 0, 1, 0.03921569, 1,
-0.4461851, 0.6373749, 0.5603615, 0, 1, 0.04705882, 1,
-0.4416288, -0.5502527, -3.253624, 0, 1, 0.05098039, 1,
-0.4400642, -2.150678, -3.823131, 0, 1, 0.05882353, 1,
-0.4367346, 0.9049053, -0.3287542, 0, 1, 0.0627451, 1,
-0.4353875, -1.505261, -1.891913, 0, 1, 0.07058824, 1,
-0.4327248, -0.9212492, -2.019052, 0, 1, 0.07450981, 1,
-0.432059, 0.6660157, -0.7647554, 0, 1, 0.08235294, 1,
-0.4313759, -0.5245504, -4.37098, 0, 1, 0.08627451, 1,
-0.4296093, -0.9168955, -1.578588, 0, 1, 0.09411765, 1,
-0.4292318, -0.8004616, -3.121871, 0, 1, 0.1019608, 1,
-0.4271576, 0.2119012, -1.737355, 0, 1, 0.1058824, 1,
-0.4249484, -2.296719, -2.050105, 0, 1, 0.1137255, 1,
-0.4196072, 1.070143, -1.928121, 0, 1, 0.1176471, 1,
-0.4160546, 0.4381168, -0.5165895, 0, 1, 0.1254902, 1,
-0.4150056, 0.8011466, -0.5243445, 0, 1, 0.1294118, 1,
-0.4137453, -0.7535203, -3.850619, 0, 1, 0.1372549, 1,
-0.4126846, 1.745475, -2.301315, 0, 1, 0.1411765, 1,
-0.4106122, 0.2249657, -0.1959259, 0, 1, 0.1490196, 1,
-0.4009018, -0.08189476, -1.445836, 0, 1, 0.1529412, 1,
-0.4005699, -0.7090751, -2.271218, 0, 1, 0.1607843, 1,
-0.4004445, -1.176787, -0.2312234, 0, 1, 0.1647059, 1,
-0.3940824, -2.01207, -2.695942, 0, 1, 0.172549, 1,
-0.3939002, 0.4773629, -0.38195, 0, 1, 0.1764706, 1,
-0.3918779, 0.5380425, 0.1568131, 0, 1, 0.1843137, 1,
-0.3779076, 0.1816461, -1.255214, 0, 1, 0.1882353, 1,
-0.3769764, -1.094276, -3.36097, 0, 1, 0.1960784, 1,
-0.371626, -0.9080328, -4.076873, 0, 1, 0.2039216, 1,
-0.3714012, -0.3451454, -2.156868, 0, 1, 0.2078431, 1,
-0.366044, -0.7048649, -2.890309, 0, 1, 0.2156863, 1,
-0.3597665, 1.227069, -2.052859, 0, 1, 0.2196078, 1,
-0.3588021, 0.1764472, -0.3740618, 0, 1, 0.227451, 1,
-0.3568474, -0.4063759, -2.264403, 0, 1, 0.2313726, 1,
-0.3531729, -1.046243, -0.4665207, 0, 1, 0.2392157, 1,
-0.352817, -0.09245779, -1.573705, 0, 1, 0.2431373, 1,
-0.3400614, -0.445287, -2.207821, 0, 1, 0.2509804, 1,
-0.3387945, -1.176579, -1.669806, 0, 1, 0.254902, 1,
-0.3366062, -0.5558908, -2.202925, 0, 1, 0.2627451, 1,
-0.3337064, 0.3601418, -0.8425815, 0, 1, 0.2666667, 1,
-0.3318756, 1.059333, 0.446449, 0, 1, 0.2745098, 1,
-0.328353, 0.01975844, -1.024575, 0, 1, 0.2784314, 1,
-0.3271641, -1.432808, -2.069734, 0, 1, 0.2862745, 1,
-0.3239074, -0.8751741, -3.061197, 0, 1, 0.2901961, 1,
-0.3210884, -0.6468428, -3.337275, 0, 1, 0.2980392, 1,
-0.3210579, 1.779966, -0.2179572, 0, 1, 0.3058824, 1,
-0.3152435, -0.76437, -1.830936, 0, 1, 0.3098039, 1,
-0.3138147, -0.9592943, -3.218614, 0, 1, 0.3176471, 1,
-0.313342, 0.3896815, -1.213521, 0, 1, 0.3215686, 1,
-0.3125503, -1.076332, -3.35016, 0, 1, 0.3294118, 1,
-0.3082226, 1.617834, -1.481412, 0, 1, 0.3333333, 1,
-0.2994096, 0.9124464, -1.374786, 0, 1, 0.3411765, 1,
-0.2983843, -0.9732311, -4.327527, 0, 1, 0.345098, 1,
-0.2825416, 0.9021552, -0.9166663, 0, 1, 0.3529412, 1,
-0.2794257, -0.5608879, -3.65202, 0, 1, 0.3568628, 1,
-0.2725913, -1.532916, -2.399469, 0, 1, 0.3647059, 1,
-0.2683889, 0.7225085, 0.8755049, 0, 1, 0.3686275, 1,
-0.2671677, -1.115399, -4.164528, 0, 1, 0.3764706, 1,
-0.2628579, -0.8760103, -3.693447, 0, 1, 0.3803922, 1,
-0.2604387, 0.6166801, 1.155976, 0, 1, 0.3882353, 1,
-0.2558146, 0.2871626, 0.1363437, 0, 1, 0.3921569, 1,
-0.2528005, -0.2072798, -2.967227, 0, 1, 0.4, 1,
-0.2511341, 0.5511142, 0.3517602, 0, 1, 0.4078431, 1,
-0.2464539, -0.4060141, -3.100743, 0, 1, 0.4117647, 1,
-0.2364053, -1.738366, -2.040062, 0, 1, 0.4196078, 1,
-0.2355929, 2.540989, -1.379863, 0, 1, 0.4235294, 1,
-0.2330174, 0.5899462, 0.009401952, 0, 1, 0.4313726, 1,
-0.2288667, 1.334593, -0.6697757, 0, 1, 0.4352941, 1,
-0.2250794, 0.5741245, -2.013597, 0, 1, 0.4431373, 1,
-0.2231872, 1.759513, 0.7514942, 0, 1, 0.4470588, 1,
-0.2220326, 0.3938, 0.652143, 0, 1, 0.454902, 1,
-0.2209123, 0.4301679, 0.6988727, 0, 1, 0.4588235, 1,
-0.2181733, 0.1826405, -0.7854013, 0, 1, 0.4666667, 1,
-0.2133841, 1.495262, -0.556307, 0, 1, 0.4705882, 1,
-0.2122997, -1.252388, -1.061201, 0, 1, 0.4784314, 1,
-0.208728, 1.489726, 0.4465055, 0, 1, 0.4823529, 1,
-0.2086903, 0.4597825, -1.478197, 0, 1, 0.4901961, 1,
-0.2083315, 0.07387213, -0.3948119, 0, 1, 0.4941176, 1,
-0.2070602, 0.2927292, -1.368882, 0, 1, 0.5019608, 1,
-0.2033809, 0.246391, -1.598189, 0, 1, 0.509804, 1,
-0.2031888, 0.3266055, -1.866092, 0, 1, 0.5137255, 1,
-0.202689, -0.2809243, -2.683625, 0, 1, 0.5215687, 1,
-0.196874, -0.49816, -3.594259, 0, 1, 0.5254902, 1,
-0.1955633, -1.019934, -2.227212, 0, 1, 0.5333334, 1,
-0.193912, 0.8536884, 2.173108, 0, 1, 0.5372549, 1,
-0.1805414, 0.4045711, -0.9403983, 0, 1, 0.5450981, 1,
-0.1749798, 0.8550404, 0.3679903, 0, 1, 0.5490196, 1,
-0.1741846, -0.9839212, -3.547457, 0, 1, 0.5568628, 1,
-0.1710823, 2.209359, -0.5996351, 0, 1, 0.5607843, 1,
-0.1682292, 0.4673991, -0.3100254, 0, 1, 0.5686275, 1,
-0.1680456, 0.006856352, -0.1147839, 0, 1, 0.572549, 1,
-0.1676776, -2.082661, -4.990629, 0, 1, 0.5803922, 1,
-0.1610062, 1.421126, 2.449857, 0, 1, 0.5843138, 1,
-0.1602064, -2.018277, -3.45662, 0, 1, 0.5921569, 1,
-0.154641, -0.09325976, -1.708677, 0, 1, 0.5960785, 1,
-0.1540325, -0.3599119, -3.4437, 0, 1, 0.6039216, 1,
-0.151819, -0.8000025, -4.597277, 0, 1, 0.6117647, 1,
-0.1499542, -0.3775802, -2.356698, 0, 1, 0.6156863, 1,
-0.1497488, 0.04367128, -2.560182, 0, 1, 0.6235294, 1,
-0.1466383, 0.242216, -1.171048, 0, 1, 0.627451, 1,
-0.1439615, 0.1825059, 1.447922, 0, 1, 0.6352941, 1,
-0.1399311, -1.255208, -1.593252, 0, 1, 0.6392157, 1,
-0.1376713, -0.9013174, -4.157994, 0, 1, 0.6470588, 1,
-0.1371993, 0.6552214, 1.290179, 0, 1, 0.6509804, 1,
-0.1350109, -0.143782, -2.608551, 0, 1, 0.6588235, 1,
-0.1321568, -1.032917, -2.5974, 0, 1, 0.6627451, 1,
-0.1312026, -0.189568, -2.015403, 0, 1, 0.6705883, 1,
-0.1243096, 2.594588, 0.4744368, 0, 1, 0.6745098, 1,
-0.1234239, -1.057088, -2.753523, 0, 1, 0.682353, 1,
-0.1228186, 0.004170135, -3.599221, 0, 1, 0.6862745, 1,
-0.1201958, -0.9159076, -3.785275, 0, 1, 0.6941177, 1,
-0.1200902, 1.224411, -0.3594744, 0, 1, 0.7019608, 1,
-0.1186196, -0.3073632, -3.126351, 0, 1, 0.7058824, 1,
-0.1184808, -0.5636196, -3.728399, 0, 1, 0.7137255, 1,
-0.1182611, 0.5416784, 0.5219978, 0, 1, 0.7176471, 1,
-0.1142356, -1.41883, -0.4683927, 0, 1, 0.7254902, 1,
-0.1139491, -0.7066682, -4.520174, 0, 1, 0.7294118, 1,
-0.1136072, -0.1119953, -2.425812, 0, 1, 0.7372549, 1,
-0.1116789, 1.728838, -0.4766628, 0, 1, 0.7411765, 1,
-0.110637, 2.33492, 0.9662025, 0, 1, 0.7490196, 1,
-0.1082741, 0.3377362, 0.3832031, 0, 1, 0.7529412, 1,
-0.1073857, 1.227531, -1.146013, 0, 1, 0.7607843, 1,
-0.1055584, -0.8043032, -4.506361, 0, 1, 0.7647059, 1,
-0.09738859, -0.06182451, -3.208965, 0, 1, 0.772549, 1,
-0.09128509, -0.8645993, -3.205072, 0, 1, 0.7764706, 1,
-0.08863968, -0.3050068, -4.712899, 0, 1, 0.7843137, 1,
-0.08832999, -0.4702388, -3.976576, 0, 1, 0.7882353, 1,
-0.08223705, 0.5385243, 1.303187, 0, 1, 0.7960784, 1,
-0.07910649, 0.03805536, -0.76037, 0, 1, 0.8039216, 1,
-0.07867784, -0.949863, -2.891203, 0, 1, 0.8078431, 1,
-0.07560467, 2.079366, 0.6378559, 0, 1, 0.8156863, 1,
-0.0744153, -1.891717, -5.700894, 0, 1, 0.8196079, 1,
-0.07366691, 0.4102449, 0.6918666, 0, 1, 0.827451, 1,
-0.0671045, 0.2938116, 0.04603854, 0, 1, 0.8313726, 1,
-0.06663593, 0.7979526, 0.2427279, 0, 1, 0.8392157, 1,
-0.0608059, 0.7501016, -0.4918788, 0, 1, 0.8431373, 1,
-0.05972189, 1.206733, -0.8075918, 0, 1, 0.8509804, 1,
-0.0595555, 0.02376349, -2.37546, 0, 1, 0.854902, 1,
-0.05836617, -0.7846383, -3.308771, 0, 1, 0.8627451, 1,
-0.04822425, -1.53543, -2.881056, 0, 1, 0.8666667, 1,
-0.04747109, -0.7738643, -3.603296, 0, 1, 0.8745098, 1,
-0.04550687, 0.1211895, -0.3602905, 0, 1, 0.8784314, 1,
-0.04273493, -1.288451, -1.282859, 0, 1, 0.8862745, 1,
-0.04205235, -0.4686674, -3.93935, 0, 1, 0.8901961, 1,
-0.04084221, 0.4174528, 0.5668136, 0, 1, 0.8980392, 1,
-0.03996933, 0.1882223, 0.5330473, 0, 1, 0.9058824, 1,
-0.03989051, 1.193329, -0.0829116, 0, 1, 0.9098039, 1,
-0.03804835, 0.8083469, -0.5455443, 0, 1, 0.9176471, 1,
-0.0379897, 0.8791617, -0.07089236, 0, 1, 0.9215686, 1,
-0.0335369, 0.185846, -0.7639704, 0, 1, 0.9294118, 1,
-0.03130463, -0.9575384, -3.110541, 0, 1, 0.9333333, 1,
-0.03025324, 0.7245157, -0.8177727, 0, 1, 0.9411765, 1,
-0.02984381, 0.4663734, -0.8764714, 0, 1, 0.945098, 1,
-0.02385413, 1.727223, -0.01350099, 0, 1, 0.9529412, 1,
-0.02335666, 0.6174353, -0.3407239, 0, 1, 0.9568627, 1,
-0.02324828, -1.53041, -4.157038, 0, 1, 0.9647059, 1,
-0.02318287, -0.3536733, -2.976177, 0, 1, 0.9686275, 1,
-0.02279, -0.3368381, -4.640119, 0, 1, 0.9764706, 1,
-0.02083674, -0.2167733, -2.526609, 0, 1, 0.9803922, 1,
-0.01664763, 0.3231082, 0.1793352, 0, 1, 0.9882353, 1,
-0.0130405, 0.8538023, 0.5080439, 0, 1, 0.9921569, 1,
-0.01137729, -0.10342, -3.76438, 0, 1, 1, 1,
-0.01129751, -0.6065665, -5.281059, 0, 0.9921569, 1, 1,
-0.01089946, -0.4461257, -4.573232, 0, 0.9882353, 1, 1,
-0.005840795, -0.796285, -2.750658, 0, 0.9803922, 1, 1,
-0.001284589, -0.8142996, -2.24627, 0, 0.9764706, 1, 1,
-1.774362e-05, 0.2582746, 0.9751679, 0, 0.9686275, 1, 1,
4.81956e-05, 2.208172, 0.8328165, 0, 0.9647059, 1, 1,
0.003756768, -1.011102, 4.555905, 0, 0.9568627, 1, 1,
0.008969642, -1.696216, 2.053547, 0, 0.9529412, 1, 1,
0.01059152, 0.6062019, 0.00524454, 0, 0.945098, 1, 1,
0.0148521, -0.6495508, 2.162192, 0, 0.9411765, 1, 1,
0.01513487, 0.7163765, 0.4589221, 0, 0.9333333, 1, 1,
0.02048432, 0.7431145, 0.9552958, 0, 0.9294118, 1, 1,
0.02052844, -0.3097272, 1.537294, 0, 0.9215686, 1, 1,
0.02162562, -1.357207, 2.849956, 0, 0.9176471, 1, 1,
0.02167399, -0.2968117, 2.771982, 0, 0.9098039, 1, 1,
0.02209562, -0.1659536, 2.841767, 0, 0.9058824, 1, 1,
0.02302091, 0.06235129, 1.234155, 0, 0.8980392, 1, 1,
0.03213086, 0.8838845, 1.610899, 0, 0.8901961, 1, 1,
0.03465353, -0.5950761, 2.738984, 0, 0.8862745, 1, 1,
0.03521939, -1.393053, 2.300454, 0, 0.8784314, 1, 1,
0.03563098, -1.35579, 3.967513, 0, 0.8745098, 1, 1,
0.03741484, -0.5604014, 2.445226, 0, 0.8666667, 1, 1,
0.04047367, -1.343543, 2.396757, 0, 0.8627451, 1, 1,
0.06236756, 0.2538365, -1.017235, 0, 0.854902, 1, 1,
0.06331963, 0.497333, 1.746034, 0, 0.8509804, 1, 1,
0.06417619, 0.3649856, 0.291859, 0, 0.8431373, 1, 1,
0.06732886, -0.5036578, 3.838279, 0, 0.8392157, 1, 1,
0.07021166, -0.4856462, 1.641182, 0, 0.8313726, 1, 1,
0.07032502, 0.9648944, -0.9551858, 0, 0.827451, 1, 1,
0.0711135, -0.3945829, 2.022603, 0, 0.8196079, 1, 1,
0.07365775, 0.3645452, 1.8123, 0, 0.8156863, 1, 1,
0.07404112, -1.251879, 1.284273, 0, 0.8078431, 1, 1,
0.07531419, 0.1844234, -0.6483429, 0, 0.8039216, 1, 1,
0.07593461, 0.8278461, 0.4838829, 0, 0.7960784, 1, 1,
0.07596911, -0.5205186, 3.321783, 0, 0.7882353, 1, 1,
0.08085219, -1.211076, 4.070648, 0, 0.7843137, 1, 1,
0.08139996, -1.238462, 2.214608, 0, 0.7764706, 1, 1,
0.08197339, -1.571733, 1.912537, 0, 0.772549, 1, 1,
0.08934451, 1.111353, -0.8303057, 0, 0.7647059, 1, 1,
0.09084162, -0.8682354, 3.528775, 0, 0.7607843, 1, 1,
0.09738311, 1.228704, -1.006947, 0, 0.7529412, 1, 1,
0.09799098, -0.7109081, 2.953964, 0, 0.7490196, 1, 1,
0.09922254, -0.5523879, 1.727464, 0, 0.7411765, 1, 1,
0.1005389, -1.199201, 1.154199, 0, 0.7372549, 1, 1,
0.1098994, -0.3305157, 3.043789, 0, 0.7294118, 1, 1,
0.1105116, 0.6230386, 1.660417, 0, 0.7254902, 1, 1,
0.1150573, -0.4605084, 1.612576, 0, 0.7176471, 1, 1,
0.1181745, -0.1761729, 1.964053, 0, 0.7137255, 1, 1,
0.1214544, 1.348805, -0.2500247, 0, 0.7058824, 1, 1,
0.1240556, 0.02709799, 0.7731159, 0, 0.6980392, 1, 1,
0.1276469, -0.1956476, 3.866494, 0, 0.6941177, 1, 1,
0.1349397, -0.5850065, 4.354406, 0, 0.6862745, 1, 1,
0.1393203, 1.259846, 0.5376624, 0, 0.682353, 1, 1,
0.1479604, 0.3988566, -0.01435124, 0, 0.6745098, 1, 1,
0.1541692, -0.4794599, 3.104628, 0, 0.6705883, 1, 1,
0.1568414, -1.435976, 1.564248, 0, 0.6627451, 1, 1,
0.159538, 0.2307784, -0.2871223, 0, 0.6588235, 1, 1,
0.1678338, 0.6738418, 0.8645496, 0, 0.6509804, 1, 1,
0.1710471, 0.7734861, -0.5150545, 0, 0.6470588, 1, 1,
0.1720902, 2.116695, -0.2517889, 0, 0.6392157, 1, 1,
0.1735112, -1.086889, 1.985689, 0, 0.6352941, 1, 1,
0.1866026, -1.048948, 1.786212, 0, 0.627451, 1, 1,
0.1974928, 0.9168527, -0.6264989, 0, 0.6235294, 1, 1,
0.2001352, 0.5648544, 1.157138, 0, 0.6156863, 1, 1,
0.200988, 1.333539, -1.25079, 0, 0.6117647, 1, 1,
0.2036341, 0.3797737, -0.6671454, 0, 0.6039216, 1, 1,
0.2039257, -0.1608405, 2.104141, 0, 0.5960785, 1, 1,
0.2045417, 0.1073117, 1.933015, 0, 0.5921569, 1, 1,
0.2073391, -0.576428, 2.600073, 0, 0.5843138, 1, 1,
0.2077589, -0.02869627, 1.951362, 0, 0.5803922, 1, 1,
0.2108517, 1.657585, 0.2836521, 0, 0.572549, 1, 1,
0.2112844, -0.1883642, 0.9589872, 0, 0.5686275, 1, 1,
0.2129448, -0.3041254, 1.216162, 0, 0.5607843, 1, 1,
0.2213323, -0.7164926, 3.16441, 0, 0.5568628, 1, 1,
0.2232045, -0.2542631, 1.326737, 0, 0.5490196, 1, 1,
0.2232691, -0.09287943, 2.233073, 0, 0.5450981, 1, 1,
0.2261277, -0.2962559, 2.356868, 0, 0.5372549, 1, 1,
0.2265641, 0.5365736, 1.729961, 0, 0.5333334, 1, 1,
0.229001, 1.387981, 1.18802, 0, 0.5254902, 1, 1,
0.2329753, 0.5921068, -1.224743, 0, 0.5215687, 1, 1,
0.2351656, 0.659309, -0.1781789, 0, 0.5137255, 1, 1,
0.2378353, -0.2740646, 1.462855, 0, 0.509804, 1, 1,
0.2399579, -0.4041422, 2.684666, 0, 0.5019608, 1, 1,
0.2405791, 0.2482207, 1.924577, 0, 0.4941176, 1, 1,
0.2413084, -1.049249, 2.036366, 0, 0.4901961, 1, 1,
0.2439039, -0.04045648, 0.8809558, 0, 0.4823529, 1, 1,
0.2461727, 0.7816864, -0.8028159, 0, 0.4784314, 1, 1,
0.2462573, 0.1230734, 1.562723, 0, 0.4705882, 1, 1,
0.247279, -0.7049979, 2.951797, 0, 0.4666667, 1, 1,
0.2533288, -1.52161, 2.561592, 0, 0.4588235, 1, 1,
0.2566941, 0.3470231, 0.6769491, 0, 0.454902, 1, 1,
0.2570926, 0.1063176, 0.6903585, 0, 0.4470588, 1, 1,
0.2583981, -1.252378, 2.942051, 0, 0.4431373, 1, 1,
0.262089, -1.145163, 2.536497, 0, 0.4352941, 1, 1,
0.2625431, -1.169163, 1.145724, 0, 0.4313726, 1, 1,
0.2702713, -0.8071692, 1.824011, 0, 0.4235294, 1, 1,
0.2720075, -0.5555308, 0.5067897, 0, 0.4196078, 1, 1,
0.2728852, 0.9153757, 1.021173, 0, 0.4117647, 1, 1,
0.2730517, -1.134838, 4.180047, 0, 0.4078431, 1, 1,
0.2784057, -0.9703103, 1.599707, 0, 0.4, 1, 1,
0.2832091, -1.67974, 1.767197, 0, 0.3921569, 1, 1,
0.2879749, 1.661566, -0.2267673, 0, 0.3882353, 1, 1,
0.2925077, -1.274809, 1.421509, 0, 0.3803922, 1, 1,
0.2947761, -1.151605, 4.059659, 0, 0.3764706, 1, 1,
0.2959841, 0.6236381, -0.8710439, 0, 0.3686275, 1, 1,
0.2968397, 0.9111134, -0.8257033, 0, 0.3647059, 1, 1,
0.298846, -1.129237, 3.283725, 0, 0.3568628, 1, 1,
0.3003693, 0.177627, 2.040801, 0, 0.3529412, 1, 1,
0.304789, 0.4464362, 1.136422, 0, 0.345098, 1, 1,
0.3084973, -0.5008197, 1.55661, 0, 0.3411765, 1, 1,
0.3112215, -0.2764233, 1.079684, 0, 0.3333333, 1, 1,
0.3113312, 0.1710614, 2.657246, 0, 0.3294118, 1, 1,
0.3171289, 0.08303832, 2.516074, 0, 0.3215686, 1, 1,
0.3174525, 0.391835, -0.3244833, 0, 0.3176471, 1, 1,
0.3233004, -0.2205332, 1.154408, 0, 0.3098039, 1, 1,
0.3249721, -0.3949984, 1.620071, 0, 0.3058824, 1, 1,
0.3257459, 0.8021866, 0.8190408, 0, 0.2980392, 1, 1,
0.3260925, 0.01466, 0.4430368, 0, 0.2901961, 1, 1,
0.3269287, -0.5804624, 2.523957, 0, 0.2862745, 1, 1,
0.3329425, 1.268893, -0.4700966, 0, 0.2784314, 1, 1,
0.334305, 1.678771, 1.436346, 0, 0.2745098, 1, 1,
0.3357843, -0.265154, 1.855824, 0, 0.2666667, 1, 1,
0.340903, 1.232489, 0.5909777, 0, 0.2627451, 1, 1,
0.3456556, 0.1209017, -0.006199696, 0, 0.254902, 1, 1,
0.3509214, 1.302452, 0.315692, 0, 0.2509804, 1, 1,
0.3549231, 1.389255, 1.842306, 0, 0.2431373, 1, 1,
0.355343, -0.2404107, 3.317866, 0, 0.2392157, 1, 1,
0.3564007, 0.688894, 1.779073, 0, 0.2313726, 1, 1,
0.3609212, -1.126851, 1.357671, 0, 0.227451, 1, 1,
0.3612321, 2.218318, 0.6245486, 0, 0.2196078, 1, 1,
0.3612947, 0.6557249, -0.7408305, 0, 0.2156863, 1, 1,
0.3614023, -0.8198235, 2.124435, 0, 0.2078431, 1, 1,
0.364306, -2.305194, 3.289764, 0, 0.2039216, 1, 1,
0.3702135, 0.1677633, -0.03969159, 0, 0.1960784, 1, 1,
0.3754095, -0.8666548, 4.264109, 0, 0.1882353, 1, 1,
0.3798979, -1.752279, 4.231827, 0, 0.1843137, 1, 1,
0.3817782, 0.6068255, 0.3566883, 0, 0.1764706, 1, 1,
0.3820151, 1.434516, -1.051898, 0, 0.172549, 1, 1,
0.3832808, -0.6351021, 1.258974, 0, 0.1647059, 1, 1,
0.4093002, -0.8667986, 3.91667, 0, 0.1607843, 1, 1,
0.4097935, 0.09538209, 2.086624, 0, 0.1529412, 1, 1,
0.4130668, 0.3656524, 1.360566, 0, 0.1490196, 1, 1,
0.4133188, -0.1016062, 1.584967, 0, 0.1411765, 1, 1,
0.4136489, -0.6261072, 1.950733, 0, 0.1372549, 1, 1,
0.4169123, -0.7532637, 0.8697768, 0, 0.1294118, 1, 1,
0.4247373, 0.988555, 0.7430253, 0, 0.1254902, 1, 1,
0.425145, -0.524468, 0.1389111, 0, 0.1176471, 1, 1,
0.4263896, -1.232482, 1.835608, 0, 0.1137255, 1, 1,
0.4268493, 0.1103139, 0.7360275, 0, 0.1058824, 1, 1,
0.4287991, 0.8571851, 1.354298, 0, 0.09803922, 1, 1,
0.4396122, -2.273564, 2.79283, 0, 0.09411765, 1, 1,
0.4460803, 0.4702496, 0.979414, 0, 0.08627451, 1, 1,
0.4462558, -0.2129041, 0.7790217, 0, 0.08235294, 1, 1,
0.4466438, -0.01882924, 0.865128, 0, 0.07450981, 1, 1,
0.4538163, -0.14685, 3.361149, 0, 0.07058824, 1, 1,
0.4539793, 2.207758, 1.368607, 0, 0.0627451, 1, 1,
0.4594651, -1.113571, 2.568974, 0, 0.05882353, 1, 1,
0.4601341, -1.537601, 4.019713, 0, 0.05098039, 1, 1,
0.4626857, 1.530632, 1.781166, 0, 0.04705882, 1, 1,
0.4713555, 0.6831517, 0.8447205, 0, 0.03921569, 1, 1,
0.4732776, -0.9097783, 1.48194, 0, 0.03529412, 1, 1,
0.4875679, -0.04999718, 0.0387001, 0, 0.02745098, 1, 1,
0.4920073, -0.8059568, 2.152236, 0, 0.02352941, 1, 1,
0.4956362, 1.46611, 1.652884, 0, 0.01568628, 1, 1,
0.4964745, -1.513642, 2.079844, 0, 0.01176471, 1, 1,
0.4995475, -1.611753, 1.559291, 0, 0.003921569, 1, 1,
0.505456, -0.1725802, 0.7821524, 0.003921569, 0, 1, 1,
0.5076297, 0.8238384, 1.483679, 0.007843138, 0, 1, 1,
0.5131281, 0.8451392, 2.183727, 0.01568628, 0, 1, 1,
0.5198999, 0.7593172, -1.608015, 0.01960784, 0, 1, 1,
0.5231075, 0.07068843, 2.387244, 0.02745098, 0, 1, 1,
0.5235239, 0.9038147, 1.355124, 0.03137255, 0, 1, 1,
0.5285745, 1.179503, -0.3739347, 0.03921569, 0, 1, 1,
0.5313703, 0.3843266, 1.891469, 0.04313726, 0, 1, 1,
0.5374506, -1.694104, 0.9479684, 0.05098039, 0, 1, 1,
0.5398159, 0.4301332, 1.860242, 0.05490196, 0, 1, 1,
0.5446384, -0.09932278, 1.667854, 0.0627451, 0, 1, 1,
0.5451315, 0.4599681, 0.7235896, 0.06666667, 0, 1, 1,
0.5475612, -0.9976677, 3.46074, 0.07450981, 0, 1, 1,
0.5498557, -0.1331009, 3.506761, 0.07843138, 0, 1, 1,
0.5500423, 1.054043, 0.986628, 0.08627451, 0, 1, 1,
0.5535641, -0.05911369, 0.3273276, 0.09019608, 0, 1, 1,
0.5648415, -1.426312, 2.869841, 0.09803922, 0, 1, 1,
0.5660713, 0.15292, -0.01057767, 0.1058824, 0, 1, 1,
0.5702276, 0.4105999, 0.9749151, 0.1098039, 0, 1, 1,
0.5716501, 0.972427, 0.2058696, 0.1176471, 0, 1, 1,
0.5742794, 1.157844, 1.259186, 0.1215686, 0, 1, 1,
0.5759299, 0.8392991, -0.666762, 0.1294118, 0, 1, 1,
0.5768604, -0.1966982, 1.779635, 0.1333333, 0, 1, 1,
0.5768762, -1.458811, 3.695308, 0.1411765, 0, 1, 1,
0.5770163, -0.981658, 2.239507, 0.145098, 0, 1, 1,
0.581005, -0.2781814, 2.929498, 0.1529412, 0, 1, 1,
0.5819832, 1.121778, 2.90764, 0.1568628, 0, 1, 1,
0.5826434, 0.3192117, 1.950087, 0.1647059, 0, 1, 1,
0.5829461, 0.4570103, -0.1738732, 0.1686275, 0, 1, 1,
0.5884331, 1.183074, 1.456977, 0.1764706, 0, 1, 1,
0.5922771, 1.052142, -0.2924126, 0.1803922, 0, 1, 1,
0.5957108, -0.4906832, 4.343363, 0.1882353, 0, 1, 1,
0.5961156, -0.3850793, 2.956084, 0.1921569, 0, 1, 1,
0.5978945, 0.1663399, 0.08101387, 0.2, 0, 1, 1,
0.6021053, -0.3933948, 3.334939, 0.2078431, 0, 1, 1,
0.60376, 0.944791, 0.8774957, 0.2117647, 0, 1, 1,
0.6053841, -0.3862788, 1.60463, 0.2196078, 0, 1, 1,
0.6075136, 0.165188, 0.8036565, 0.2235294, 0, 1, 1,
0.6109352, -0.4512507, 2.169068, 0.2313726, 0, 1, 1,
0.6134034, 0.5083749, 0.449548, 0.2352941, 0, 1, 1,
0.6137891, -0.3705085, 3.802689, 0.2431373, 0, 1, 1,
0.6181123, -1.102658, 2.399426, 0.2470588, 0, 1, 1,
0.621547, 0.3429891, -0.4669708, 0.254902, 0, 1, 1,
0.6217486, -1.438644, 4.890528, 0.2588235, 0, 1, 1,
0.6233739, 1.410496, 1.961079, 0.2666667, 0, 1, 1,
0.6302987, 1.659328, -0.07031588, 0.2705882, 0, 1, 1,
0.6319855, -0.4265525, 3.218145, 0.2784314, 0, 1, 1,
0.6321897, -1.192453, 4.339034, 0.282353, 0, 1, 1,
0.6376431, 0.9987127, 0.5858355, 0.2901961, 0, 1, 1,
0.6382164, -0.210202, 1.521801, 0.2941177, 0, 1, 1,
0.6390405, -1.668934, 1.986913, 0.3019608, 0, 1, 1,
0.6392836, -0.8430989, 2.315171, 0.3098039, 0, 1, 1,
0.639541, -1.683117, 3.100622, 0.3137255, 0, 1, 1,
0.6405277, 2.130442, 0.4860932, 0.3215686, 0, 1, 1,
0.6443458, 0.208092, 2.264194, 0.3254902, 0, 1, 1,
0.6461779, 1.346522, -0.4084596, 0.3333333, 0, 1, 1,
0.6488845, -2.912087, 3.524869, 0.3372549, 0, 1, 1,
0.6542089, 2.061833, -0.7846863, 0.345098, 0, 1, 1,
0.6558319, 0.758338, 2.092087, 0.3490196, 0, 1, 1,
0.6593907, -0.1455798, 1.463392, 0.3568628, 0, 1, 1,
0.662671, 2.234956, 0.4511434, 0.3607843, 0, 1, 1,
0.6652659, 1.158457, -1.679876, 0.3686275, 0, 1, 1,
0.6745554, -0.3681482, 2.543281, 0.372549, 0, 1, 1,
0.6756271, -0.1668515, 1.069991, 0.3803922, 0, 1, 1,
0.6763108, -0.9504192, 0.5851057, 0.3843137, 0, 1, 1,
0.678507, 1.76915, 0.8481984, 0.3921569, 0, 1, 1,
0.6797178, -0.4928349, 2.103131, 0.3960784, 0, 1, 1,
0.6856589, -0.1229588, 1.068402, 0.4039216, 0, 1, 1,
0.6896834, 0.1932081, 0.6613252, 0.4117647, 0, 1, 1,
0.689773, 0.008093975, 1.41588, 0.4156863, 0, 1, 1,
0.6906934, -0.308432, 0.4974429, 0.4235294, 0, 1, 1,
0.6934854, -1.279476, 1.459447, 0.427451, 0, 1, 1,
0.6939688, 0.5876161, 2.504684, 0.4352941, 0, 1, 1,
0.7001155, 0.2512359, -0.7333581, 0.4392157, 0, 1, 1,
0.7022927, -0.612076, 2.829493, 0.4470588, 0, 1, 1,
0.7033561, 0.4911188, 0.600974, 0.4509804, 0, 1, 1,
0.7096465, 0.8696007, 0.849328, 0.4588235, 0, 1, 1,
0.7142813, -0.04066271, 2.274535, 0.4627451, 0, 1, 1,
0.7207391, -0.7140915, 2.435961, 0.4705882, 0, 1, 1,
0.7305672, -1.946735, 2.649023, 0.4745098, 0, 1, 1,
0.7390171, -0.2983204, 4.399849, 0.4823529, 0, 1, 1,
0.7452137, -0.3409382, 3.588016, 0.4862745, 0, 1, 1,
0.7547156, -0.7955256, 1.879802, 0.4941176, 0, 1, 1,
0.7572482, 0.3232935, 0.9379042, 0.5019608, 0, 1, 1,
0.7608522, -1.382135, 1.976755, 0.5058824, 0, 1, 1,
0.7611592, 0.6973529, -0.5493607, 0.5137255, 0, 1, 1,
0.765824, -1.106968, 3.662182, 0.5176471, 0, 1, 1,
0.7726308, 0.2041344, 2.038017, 0.5254902, 0, 1, 1,
0.7739504, -0.2597579, 0.5317565, 0.5294118, 0, 1, 1,
0.7742423, -0.5470928, 1.736272, 0.5372549, 0, 1, 1,
0.7751356, 0.1752893, 3.849434, 0.5411765, 0, 1, 1,
0.778751, 0.627157, -0.02836298, 0.5490196, 0, 1, 1,
0.7822803, -0.5245143, 1.350176, 0.5529412, 0, 1, 1,
0.7844357, -0.6208066, 2.666713, 0.5607843, 0, 1, 1,
0.7854037, -0.9665229, 2.34288, 0.5647059, 0, 1, 1,
0.7871753, 1.34097, 1.067077, 0.572549, 0, 1, 1,
0.7898622, 0.3156018, 1.713421, 0.5764706, 0, 1, 1,
0.7946432, -0.05473363, 3.249839, 0.5843138, 0, 1, 1,
0.8035235, 0.1836896, 1.699196, 0.5882353, 0, 1, 1,
0.806041, 0.4295474, 0.1123049, 0.5960785, 0, 1, 1,
0.8166977, 1.079674, 1.557023, 0.6039216, 0, 1, 1,
0.8182758, -1.361115, 2.323156, 0.6078432, 0, 1, 1,
0.8299919, -0.6854038, 4.097703, 0.6156863, 0, 1, 1,
0.8316073, -0.100104, 1.050587, 0.6196079, 0, 1, 1,
0.8410166, 1.126944, 0.4826517, 0.627451, 0, 1, 1,
0.8450858, -0.3650581, 1.808189, 0.6313726, 0, 1, 1,
0.8498832, -0.6442859, 2.61907, 0.6392157, 0, 1, 1,
0.850229, -1.380928, 2.107022, 0.6431373, 0, 1, 1,
0.8540942, 1.383832, 0.2164065, 0.6509804, 0, 1, 1,
0.8546516, 0.09522827, 1.460184, 0.654902, 0, 1, 1,
0.8558146, 0.4513451, 1.251565, 0.6627451, 0, 1, 1,
0.8569409, -0.2391338, 0.8667733, 0.6666667, 0, 1, 1,
0.8605863, 1.275709, 0.3874703, 0.6745098, 0, 1, 1,
0.8687919, 0.1581869, -0.8296906, 0.6784314, 0, 1, 1,
0.8695253, 0.07634691, 2.009124, 0.6862745, 0, 1, 1,
0.872646, 0.972945, 1.396755, 0.6901961, 0, 1, 1,
0.8765522, 0.2482814, 3.871389, 0.6980392, 0, 1, 1,
0.8765743, 0.002549737, 1.856307, 0.7058824, 0, 1, 1,
0.8850082, 1.542809, 0.2469434, 0.7098039, 0, 1, 1,
0.8870577, 0.8572935, 0.7391183, 0.7176471, 0, 1, 1,
0.8956665, -0.9633983, 1.69613, 0.7215686, 0, 1, 1,
0.8973274, -0.5618421, 2.559387, 0.7294118, 0, 1, 1,
0.9014443, -0.6399367, 2.354876, 0.7333333, 0, 1, 1,
0.9032648, 0.440073, 0.4341294, 0.7411765, 0, 1, 1,
0.9055649, -1.711161, 3.946302, 0.7450981, 0, 1, 1,
0.9063672, -1.940116, 3.641697, 0.7529412, 0, 1, 1,
0.9115818, -0.2831064, 4.535187, 0.7568628, 0, 1, 1,
0.9118606, -0.7018691, 1.460594, 0.7647059, 0, 1, 1,
0.9141644, 0.9171467, 1.424185, 0.7686275, 0, 1, 1,
0.9204754, -0.5939566, 2.868121, 0.7764706, 0, 1, 1,
0.9261187, 0.9541666, 1.770389, 0.7803922, 0, 1, 1,
0.9324422, -0.7114929, 2.030053, 0.7882353, 0, 1, 1,
0.9358063, 0.5676684, 1.231155, 0.7921569, 0, 1, 1,
0.9375002, 0.2736489, 1.828277, 0.8, 0, 1, 1,
0.937644, 0.8137302, 0.5633166, 0.8078431, 0, 1, 1,
0.9385047, 1.049505, 1.667559, 0.8117647, 0, 1, 1,
0.9413835, -0.8631153, 1.490364, 0.8196079, 0, 1, 1,
0.9496144, 1.897069, -0.04107286, 0.8235294, 0, 1, 1,
0.9527525, 0.4179341, 2.036565, 0.8313726, 0, 1, 1,
0.9547687, -0.470063, 0.3904649, 0.8352941, 0, 1, 1,
0.9612446, -0.160267, 1.244215, 0.8431373, 0, 1, 1,
0.9614245, -0.5161757, 1.070941, 0.8470588, 0, 1, 1,
0.9616402, 0.4010008, 0.6363985, 0.854902, 0, 1, 1,
0.9637855, -1.194128, 2.453678, 0.8588235, 0, 1, 1,
0.9647606, 2.525786, 0.9320604, 0.8666667, 0, 1, 1,
0.96604, -0.5155587, 2.314454, 0.8705882, 0, 1, 1,
0.9704165, 0.4433612, 1.091034, 0.8784314, 0, 1, 1,
0.9769395, -0.6143722, 2.346497, 0.8823529, 0, 1, 1,
0.9809325, -0.8142194, 2.104231, 0.8901961, 0, 1, 1,
0.9899827, 1.215488, 2.631389, 0.8941177, 0, 1, 1,
0.990254, -0.3939603, 2.512878, 0.9019608, 0, 1, 1,
0.9925357, -0.09347178, -0.09283066, 0.9098039, 0, 1, 1,
0.9930933, -0.199794, 2.603017, 0.9137255, 0, 1, 1,
0.9996959, -0.7773979, 4.127971, 0.9215686, 0, 1, 1,
1.002034, 0.4299018, 0.6468647, 0.9254902, 0, 1, 1,
1.003553, 0.4449246, 1.46887, 0.9333333, 0, 1, 1,
1.003622, -2.043843, 3.463858, 0.9372549, 0, 1, 1,
1.003932, 0.3299795, 1.369078, 0.945098, 0, 1, 1,
1.005166, -0.351481, 2.523556, 0.9490196, 0, 1, 1,
1.008508, 1.299441, 0.8026481, 0.9568627, 0, 1, 1,
1.011664, -0.3088494, 0.6805329, 0.9607843, 0, 1, 1,
1.018353, -1.400609, 1.600465, 0.9686275, 0, 1, 1,
1.020593, 0.6093742, 0.7570386, 0.972549, 0, 1, 1,
1.03003, -1.916919, 3.628619, 0.9803922, 0, 1, 1,
1.031804, 0.8158321, 1.63301, 0.9843137, 0, 1, 1,
1.031811, -0.5818523, 2.587749, 0.9921569, 0, 1, 1,
1.036579, -0.8625419, 3.794937, 0.9960784, 0, 1, 1,
1.041421, -1.158891, 2.882738, 1, 0, 0.9960784, 1,
1.042369, -1.770722, 2.960692, 1, 0, 0.9882353, 1,
1.044828, 0.14708, 0.5977972, 1, 0, 0.9843137, 1,
1.053982, 0.5297149, 2.554272, 1, 0, 0.9764706, 1,
1.054549, 0.3201735, 0.1422549, 1, 0, 0.972549, 1,
1.055232, 1.425251, -0.8345694, 1, 0, 0.9647059, 1,
1.055825, 0.459403, 0.9321656, 1, 0, 0.9607843, 1,
1.063663, 1.56727, 0.7269924, 1, 0, 0.9529412, 1,
1.065867, -0.03951935, 2.265568, 1, 0, 0.9490196, 1,
1.071064, 0.447919, 1.852808, 1, 0, 0.9411765, 1,
1.073624, 0.4058957, 0.9633937, 1, 0, 0.9372549, 1,
1.099406, 0.08649392, 0.04097904, 1, 0, 0.9294118, 1,
1.099962, -0.9004976, 1.752395, 1, 0, 0.9254902, 1,
1.102295, 1.557722, -0.5028955, 1, 0, 0.9176471, 1,
1.104553, -0.08177505, 2.668667, 1, 0, 0.9137255, 1,
1.118528, -0.1199146, 1.277201, 1, 0, 0.9058824, 1,
1.125772, 0.1755465, 1.91726, 1, 0, 0.9019608, 1,
1.130258, -1.235381, 2.350358, 1, 0, 0.8941177, 1,
1.133983, -1.522395, 1.105832, 1, 0, 0.8862745, 1,
1.139782, 0.5253195, 1.791582, 1, 0, 0.8823529, 1,
1.140013, 0.08724961, -0.692343, 1, 0, 0.8745098, 1,
1.147187, 0.3824531, 1.699304, 1, 0, 0.8705882, 1,
1.149519, -0.7310999, 2.211124, 1, 0, 0.8627451, 1,
1.164895, -1.678844, 3.215008, 1, 0, 0.8588235, 1,
1.168551, -0.4434339, 2.000624, 1, 0, 0.8509804, 1,
1.175396, 1.294701, 1.763391, 1, 0, 0.8470588, 1,
1.177116, 0.69576, 0.09289274, 1, 0, 0.8392157, 1,
1.177211, -0.02878588, 2.221393, 1, 0, 0.8352941, 1,
1.192534, 0.7490188, -0.4088105, 1, 0, 0.827451, 1,
1.196941, -0.71016, 2.84661, 1, 0, 0.8235294, 1,
1.204064, -0.5081671, 1.505689, 1, 0, 0.8156863, 1,
1.206655, 0.2257977, 0.965924, 1, 0, 0.8117647, 1,
1.218366, -0.3643893, 1.22752, 1, 0, 0.8039216, 1,
1.220414, -0.4462769, 4.029275, 1, 0, 0.7960784, 1,
1.222931, -1.551864, 3.175188, 1, 0, 0.7921569, 1,
1.227533, -0.005496138, 2.239831, 1, 0, 0.7843137, 1,
1.228303, 0.6492615, 0.2680981, 1, 0, 0.7803922, 1,
1.231287, 1.927074, 1.159639, 1, 0, 0.772549, 1,
1.234445, -0.575165, 1.655603, 1, 0, 0.7686275, 1,
1.241828, 0.7351714, 1.130765, 1, 0, 0.7607843, 1,
1.243692, 0.8862133, 0.8384448, 1, 0, 0.7568628, 1,
1.245172, -1.451647, -0.341087, 1, 0, 0.7490196, 1,
1.246369, 0.3856882, 1.480194, 1, 0, 0.7450981, 1,
1.252143, 2.353951, 0.9049366, 1, 0, 0.7372549, 1,
1.254744, 0.1993836, -0.1774433, 1, 0, 0.7333333, 1,
1.26585, 1.09046, 0.7625306, 1, 0, 0.7254902, 1,
1.275643, -0.7903975, 3.932309, 1, 0, 0.7215686, 1,
1.291701, 0.9714161, 0.4864158, 1, 0, 0.7137255, 1,
1.295602, 0.2766701, 1.6261, 1, 0, 0.7098039, 1,
1.298624, -0.549832, 3.486116, 1, 0, 0.7019608, 1,
1.305571, -0.2545131, 3.579303, 1, 0, 0.6941177, 1,
1.3238, -0.04885239, 3.697589, 1, 0, 0.6901961, 1,
1.33299, 1.069705, 1.670232, 1, 0, 0.682353, 1,
1.337308, -0.0958851, -0.3801323, 1, 0, 0.6784314, 1,
1.33935, -0.5849084, 1.472134, 1, 0, 0.6705883, 1,
1.340339, 0.9564195, 0.1276111, 1, 0, 0.6666667, 1,
1.347179, -0.9880695, 1.052681, 1, 0, 0.6588235, 1,
1.347784, -0.2829998, 1.66599, 1, 0, 0.654902, 1,
1.348356, -0.7647883, 3.468206, 1, 0, 0.6470588, 1,
1.360883, 1.252373, 0.5428206, 1, 0, 0.6431373, 1,
1.366284, 0.2921843, 0.4842085, 1, 0, 0.6352941, 1,
1.366358, -1.85631, 2.570954, 1, 0, 0.6313726, 1,
1.371235, 0.6954243, 3.362, 1, 0, 0.6235294, 1,
1.374705, -0.6767992, 1.527572, 1, 0, 0.6196079, 1,
1.378681, -1.877497, 3.355695, 1, 0, 0.6117647, 1,
1.389014, 0.8988382, 1.454147, 1, 0, 0.6078432, 1,
1.391655, -1.112351, 2.563849, 1, 0, 0.6, 1,
1.392075, -1.887967, 2.842804, 1, 0, 0.5921569, 1,
1.394448, -0.4884268, 4.240973, 1, 0, 0.5882353, 1,
1.396175, 1.200284, 1.273408, 1, 0, 0.5803922, 1,
1.406521, 1.172591, 1.17793, 1, 0, 0.5764706, 1,
1.406553, 0.4507708, 2.566839, 1, 0, 0.5686275, 1,
1.408182, -0.9380082, 2.474901, 1, 0, 0.5647059, 1,
1.408356, 0.3734536, 2.969707, 1, 0, 0.5568628, 1,
1.40881, -2.289765, 2.093705, 1, 0, 0.5529412, 1,
1.415634, 0.2069323, 2.241693, 1, 0, 0.5450981, 1,
1.416452, 1.034404, 0.9537706, 1, 0, 0.5411765, 1,
1.421718, -0.4815584, 0.8779677, 1, 0, 0.5333334, 1,
1.426532, 1.246121, 0.3828667, 1, 0, 0.5294118, 1,
1.428164, 0.9367946, 1.287755, 1, 0, 0.5215687, 1,
1.429422, -0.3924984, 2.200482, 1, 0, 0.5176471, 1,
1.433142, -0.6450177, 2.681347, 1, 0, 0.509804, 1,
1.438486, 0.5672705, -0.7407857, 1, 0, 0.5058824, 1,
1.438875, -0.1420167, 1.979771, 1, 0, 0.4980392, 1,
1.452417, -0.9902871, 2.445786, 1, 0, 0.4901961, 1,
1.464523, 0.6891885, -0.01738328, 1, 0, 0.4862745, 1,
1.465728, -1.081421, 2.698572, 1, 0, 0.4784314, 1,
1.468068, -2.274366, 2.555584, 1, 0, 0.4745098, 1,
1.472565, -0.6687747, 2.720752, 1, 0, 0.4666667, 1,
1.484482, -0.3595695, 4.050301, 1, 0, 0.4627451, 1,
1.489759, -1.917378, 3.634322, 1, 0, 0.454902, 1,
1.490039, -2.527306, 4.871449, 1, 0, 0.4509804, 1,
1.510568, 0.7744052, 0.4289471, 1, 0, 0.4431373, 1,
1.514482, -1.085643, 4.10173, 1, 0, 0.4392157, 1,
1.516415, 0.9383615, 2.625557, 1, 0, 0.4313726, 1,
1.541131, -1.766856, 2.322505, 1, 0, 0.427451, 1,
1.545461, -1.795231, 2.779103, 1, 0, 0.4196078, 1,
1.556113, -0.4407769, 4.941361, 1, 0, 0.4156863, 1,
1.565094, 0.01020372, 1.052812, 1, 0, 0.4078431, 1,
1.595889, -0.5159792, 2.834374, 1, 0, 0.4039216, 1,
1.598996, -0.7035772, 3.17817, 1, 0, 0.3960784, 1,
1.611074, -1.16434, 1.58532, 1, 0, 0.3882353, 1,
1.614732, 0.07295714, 1.182681, 1, 0, 0.3843137, 1,
1.618081, -0.1514104, 0.6140376, 1, 0, 0.3764706, 1,
1.624543, -0.8825914, 2.818092, 1, 0, 0.372549, 1,
1.636035, -0.2549103, 2.101051, 1, 0, 0.3647059, 1,
1.650116, -0.2415452, 0.1031895, 1, 0, 0.3607843, 1,
1.683349, 1.886193, 2.199326, 1, 0, 0.3529412, 1,
1.685961, 0.809606, -0.1371166, 1, 0, 0.3490196, 1,
1.690382, 0.04962113, 1.502641, 1, 0, 0.3411765, 1,
1.713188, -1.089738, 2.737316, 1, 0, 0.3372549, 1,
1.715724, -1.076955, 0.7928521, 1, 0, 0.3294118, 1,
1.722135, 1.175309, 0.9168354, 1, 0, 0.3254902, 1,
1.730696, -3.576724, 2.843365, 1, 0, 0.3176471, 1,
1.730914, 0.7924124, 1.918916, 1, 0, 0.3137255, 1,
1.731087, 1.324828, 1.811943, 1, 0, 0.3058824, 1,
1.74423, -0.5687879, 3.516636, 1, 0, 0.2980392, 1,
1.74962, -0.61098, 0.6033493, 1, 0, 0.2941177, 1,
1.762261, -0.5097048, 1.823807, 1, 0, 0.2862745, 1,
1.773438, -0.3508861, 2.65106, 1, 0, 0.282353, 1,
1.775456, -0.3974654, 3.053307, 1, 0, 0.2745098, 1,
1.788527, 0.3459057, -0.4646783, 1, 0, 0.2705882, 1,
1.799803, 1.045668, 2.910756, 1, 0, 0.2627451, 1,
1.808389, 1.486455, 0.8882787, 1, 0, 0.2588235, 1,
1.812737, -1.969417, 2.952836, 1, 0, 0.2509804, 1,
1.813846, 0.8189784, 1.765351, 1, 0, 0.2470588, 1,
1.830179, 0.2832707, 1.271721, 1, 0, 0.2392157, 1,
1.835519, -0.6952298, 2.313555, 1, 0, 0.2352941, 1,
1.858943, 0.7894891, 1.208405, 1, 0, 0.227451, 1,
1.893741, -1.26899, 3.448565, 1, 0, 0.2235294, 1,
1.894719, 2.039127, 1.331607, 1, 0, 0.2156863, 1,
1.906733, 0.1822456, 1.529513, 1, 0, 0.2117647, 1,
1.923807, -0.05146943, 0.3346146, 1, 0, 0.2039216, 1,
1.9265, -0.4688104, 1.409782, 1, 0, 0.1960784, 1,
1.930131, -1.067894, 2.567579, 1, 0, 0.1921569, 1,
1.941182, -0.3681076, 2.593255, 1, 0, 0.1843137, 1,
1.945956, 1.718621, -0.1201166, 1, 0, 0.1803922, 1,
1.949532, -0.3640833, 2.694899, 1, 0, 0.172549, 1,
1.999019, -2.242128, 0.9624441, 1, 0, 0.1686275, 1,
2.018035, -1.287066, -0.9153126, 1, 0, 0.1607843, 1,
2.02354, 0.6656014, 1.089959, 1, 0, 0.1568628, 1,
2.02842, 0.7394814, 2.665335, 1, 0, 0.1490196, 1,
2.072021, 0.1804079, 1.263, 1, 0, 0.145098, 1,
2.139858, 0.9377522, 1.277019, 1, 0, 0.1372549, 1,
2.144452, 0.1315763, 1.497672, 1, 0, 0.1333333, 1,
2.148818, 0.5109912, 2.146866, 1, 0, 0.1254902, 1,
2.174665, -0.105277, 2.714163, 1, 0, 0.1215686, 1,
2.187971, 0.7478673, 1.19744, 1, 0, 0.1137255, 1,
2.314183, 1.980546, -0.08685135, 1, 0, 0.1098039, 1,
2.320238, 1.539632, 1.949983, 1, 0, 0.1019608, 1,
2.359304, -1.974833, 1.769205, 1, 0, 0.09411765, 1,
2.382738, -0.5845698, 3.387003, 1, 0, 0.09019608, 1,
2.406307, 0.2072705, 2.211771, 1, 0, 0.08235294, 1,
2.448438, -1.60758, 2.267483, 1, 0, 0.07843138, 1,
2.49691, -1.490595, 2.082429, 1, 0, 0.07058824, 1,
2.525437, -0.9052028, 1.839942, 1, 0, 0.06666667, 1,
2.592956, -0.02935246, 0.4694368, 1, 0, 0.05882353, 1,
2.671997, 0.5145999, 2.357276, 1, 0, 0.05490196, 1,
2.685099, 0.1655962, 2.140731, 1, 0, 0.04705882, 1,
2.706228, 1.868012, 1.029106, 1, 0, 0.04313726, 1,
2.828123, -1.122095, 2.302601, 1, 0, 0.03529412, 1,
2.838549, 0.442733, 1.383813, 1, 0, 0.03137255, 1,
2.891313, 0.6987822, 0.8050563, 1, 0, 0.02352941, 1,
2.945861, 1.124695, 0.9806919, 1, 0, 0.01960784, 1,
3.366181, -1.17732, 0.5624816, 1, 0, 0.01176471, 1,
3.607425, -1.377174, 1.666954, 1, 0, 0.007843138, 1
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
-0.1449103, -4.63024, -7.504756, 0, -0.5, 0.5, 0.5,
-0.1449103, -4.63024, -7.504756, 1, -0.5, 0.5, 0.5,
-0.1449103, -4.63024, -7.504756, 1, 1.5, 0.5, 0.5,
-0.1449103, -4.63024, -7.504756, 0, 1.5, 0.5, 0.5
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
-5.169288, -0.4690037, -7.504756, 0, -0.5, 0.5, 0.5,
-5.169288, -0.4690037, -7.504756, 1, -0.5, 0.5, 0.5,
-5.169288, -0.4690037, -7.504756, 1, 1.5, 0.5, 0.5,
-5.169288, -0.4690037, -7.504756, 0, 1.5, 0.5, 0.5
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
-5.169288, -4.63024, -0.3797667, 0, -0.5, 0.5, 0.5,
-5.169288, -4.63024, -0.3797667, 1, -0.5, 0.5, 0.5,
-5.169288, -4.63024, -0.3797667, 1, 1.5, 0.5, 0.5,
-5.169288, -4.63024, -0.3797667, 0, 1.5, 0.5, 0.5
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
-2, -3.669955, -5.860528,
2, -3.669955, -5.860528,
-2, -3.669955, -5.860528,
-2, -3.830003, -6.134566,
0, -3.669955, -5.860528,
0, -3.830003, -6.134566,
2, -3.669955, -5.860528,
2, -3.830003, -6.134566
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
-2, -4.150098, -6.682642, 0, -0.5, 0.5, 0.5,
-2, -4.150098, -6.682642, 1, -0.5, 0.5, 0.5,
-2, -4.150098, -6.682642, 1, 1.5, 0.5, 0.5,
-2, -4.150098, -6.682642, 0, 1.5, 0.5, 0.5,
0, -4.150098, -6.682642, 0, -0.5, 0.5, 0.5,
0, -4.150098, -6.682642, 1, -0.5, 0.5, 0.5,
0, -4.150098, -6.682642, 1, 1.5, 0.5, 0.5,
0, -4.150098, -6.682642, 0, 1.5, 0.5, 0.5,
2, -4.150098, -6.682642, 0, -0.5, 0.5, 0.5,
2, -4.150098, -6.682642, 1, -0.5, 0.5, 0.5,
2, -4.150098, -6.682642, 1, 1.5, 0.5, 0.5,
2, -4.150098, -6.682642, 0, 1.5, 0.5, 0.5
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
-4.009816, -3, -5.860528,
-4.009816, 2, -5.860528,
-4.009816, -3, -5.860528,
-4.203061, -3, -6.134566,
-4.009816, -2, -5.860528,
-4.203061, -2, -6.134566,
-4.009816, -1, -5.860528,
-4.203061, -1, -6.134566,
-4.009816, 0, -5.860528,
-4.203061, 0, -6.134566,
-4.009816, 1, -5.860528,
-4.203061, 1, -6.134566,
-4.009816, 2, -5.860528,
-4.203061, 2, -6.134566
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
-4.589552, -3, -6.682642, 0, -0.5, 0.5, 0.5,
-4.589552, -3, -6.682642, 1, -0.5, 0.5, 0.5,
-4.589552, -3, -6.682642, 1, 1.5, 0.5, 0.5,
-4.589552, -3, -6.682642, 0, 1.5, 0.5, 0.5,
-4.589552, -2, -6.682642, 0, -0.5, 0.5, 0.5,
-4.589552, -2, -6.682642, 1, -0.5, 0.5, 0.5,
-4.589552, -2, -6.682642, 1, 1.5, 0.5, 0.5,
-4.589552, -2, -6.682642, 0, 1.5, 0.5, 0.5,
-4.589552, -1, -6.682642, 0, -0.5, 0.5, 0.5,
-4.589552, -1, -6.682642, 1, -0.5, 0.5, 0.5,
-4.589552, -1, -6.682642, 1, 1.5, 0.5, 0.5,
-4.589552, -1, -6.682642, 0, 1.5, 0.5, 0.5,
-4.589552, 0, -6.682642, 0, -0.5, 0.5, 0.5,
-4.589552, 0, -6.682642, 1, -0.5, 0.5, 0.5,
-4.589552, 0, -6.682642, 1, 1.5, 0.5, 0.5,
-4.589552, 0, -6.682642, 0, 1.5, 0.5, 0.5,
-4.589552, 1, -6.682642, 0, -0.5, 0.5, 0.5,
-4.589552, 1, -6.682642, 1, -0.5, 0.5, 0.5,
-4.589552, 1, -6.682642, 1, 1.5, 0.5, 0.5,
-4.589552, 1, -6.682642, 0, 1.5, 0.5, 0.5,
-4.589552, 2, -6.682642, 0, -0.5, 0.5, 0.5,
-4.589552, 2, -6.682642, 1, -0.5, 0.5, 0.5,
-4.589552, 2, -6.682642, 1, 1.5, 0.5, 0.5,
-4.589552, 2, -6.682642, 0, 1.5, 0.5, 0.5
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
-4.009816, -3.669955, -4,
-4.009816, -3.669955, 4,
-4.009816, -3.669955, -4,
-4.203061, -3.830003, -4,
-4.009816, -3.669955, -2,
-4.203061, -3.830003, -2,
-4.009816, -3.669955, 0,
-4.203061, -3.830003, 0,
-4.009816, -3.669955, 2,
-4.203061, -3.830003, 2,
-4.009816, -3.669955, 4,
-4.203061, -3.830003, 4
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
-4.589552, -4.150098, -4, 0, -0.5, 0.5, 0.5,
-4.589552, -4.150098, -4, 1, -0.5, 0.5, 0.5,
-4.589552, -4.150098, -4, 1, 1.5, 0.5, 0.5,
-4.589552, -4.150098, -4, 0, 1.5, 0.5, 0.5,
-4.589552, -4.150098, -2, 0, -0.5, 0.5, 0.5,
-4.589552, -4.150098, -2, 1, -0.5, 0.5, 0.5,
-4.589552, -4.150098, -2, 1, 1.5, 0.5, 0.5,
-4.589552, -4.150098, -2, 0, 1.5, 0.5, 0.5,
-4.589552, -4.150098, 0, 0, -0.5, 0.5, 0.5,
-4.589552, -4.150098, 0, 1, -0.5, 0.5, 0.5,
-4.589552, -4.150098, 0, 1, 1.5, 0.5, 0.5,
-4.589552, -4.150098, 0, 0, 1.5, 0.5, 0.5,
-4.589552, -4.150098, 2, 0, -0.5, 0.5, 0.5,
-4.589552, -4.150098, 2, 1, -0.5, 0.5, 0.5,
-4.589552, -4.150098, 2, 1, 1.5, 0.5, 0.5,
-4.589552, -4.150098, 2, 0, 1.5, 0.5, 0.5,
-4.589552, -4.150098, 4, 0, -0.5, 0.5, 0.5,
-4.589552, -4.150098, 4, 1, -0.5, 0.5, 0.5,
-4.589552, -4.150098, 4, 1, 1.5, 0.5, 0.5,
-4.589552, -4.150098, 4, 0, 1.5, 0.5, 0.5
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
-4.009816, -3.669955, -5.860528,
-4.009816, 2.731948, -5.860528,
-4.009816, -3.669955, 5.100995,
-4.009816, 2.731948, 5.100995,
-4.009816, -3.669955, -5.860528,
-4.009816, -3.669955, 5.100995,
-4.009816, 2.731948, -5.860528,
-4.009816, 2.731948, 5.100995,
-4.009816, -3.669955, -5.860528,
3.719995, -3.669955, -5.860528,
-4.009816, -3.669955, 5.100995,
3.719995, -3.669955, 5.100995,
-4.009816, 2.731948, -5.860528,
3.719995, 2.731948, -5.860528,
-4.009816, 2.731948, 5.100995,
3.719995, 2.731948, 5.100995,
3.719995, -3.669955, -5.860528,
3.719995, 2.731948, -5.860528,
3.719995, -3.669955, 5.100995,
3.719995, 2.731948, 5.100995,
3.719995, -3.669955, -5.860528,
3.719995, -3.669955, 5.100995,
3.719995, 2.731948, -5.860528,
3.719995, 2.731948, 5.100995
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
var radius = 7.936204;
var distance = 35.30907;
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
mvMatrix.translate( 0.1449103, 0.4690037, 0.3797667 );
mvMatrix.scale( 1.110089, 1.340348, 0.7828091 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.30907);
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
fluroxypyr<-read.table("fluroxypyr.xyz")
```

```
## Error in read.table("fluroxypyr.xyz"): no lines available in input
```

```r
x<-fluroxypyr$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
```

```r
y<-fluroxypyr$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
```

```r
z<-fluroxypyr$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
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
-3.897246, -1.534946, -1.734389, 0, 0, 1, 1, 1,
-3.219023, 0.9990471, -1.53413, 1, 0, 0, 1, 1,
-3.024554, 0.5869244, -0.7771666, 1, 0, 0, 1, 1,
-2.973011, 0.2434434, -1.43997, 1, 0, 0, 1, 1,
-2.69986, -1.328908, -0.8850625, 1, 0, 0, 1, 1,
-2.599452, 1.046396, -1.177379, 1, 0, 0, 1, 1,
-2.430492, 0.699192, -1.030761, 0, 0, 0, 1, 1,
-2.372014, -0.01917657, -1.738014, 0, 0, 0, 1, 1,
-2.353121, 0.8757959, 0.8726448, 0, 0, 0, 1, 1,
-2.219155, -0.8057649, -1.756945, 0, 0, 0, 1, 1,
-2.21063, 0.446061, -1.553304, 0, 0, 0, 1, 1,
-2.210591, -0.002314975, -1.108897, 0, 0, 0, 1, 1,
-2.149397, -0.9206305, -2.869151, 0, 0, 0, 1, 1,
-2.124171, -0.1134278, -2.2579, 1, 1, 1, 1, 1,
-2.071021, -1.547393, -2.963012, 1, 1, 1, 1, 1,
-2.024891, -0.449382, -2.368644, 1, 1, 1, 1, 1,
-2.008205, 0.3977746, -3.277533, 1, 1, 1, 1, 1,
-2.006157, 1.718169, 1.695972, 1, 1, 1, 1, 1,
-2.005077, -1.035049, -4.270613, 1, 1, 1, 1, 1,
-2.00429, 0.2252553, 1.236048, 1, 1, 1, 1, 1,
-1.985869, -1.349559, -2.43888, 1, 1, 1, 1, 1,
-1.983263, 2.129231, -0.5622954, 1, 1, 1, 1, 1,
-1.93509, 0.7577944, -2.024193, 1, 1, 1, 1, 1,
-1.907618, -0.6406972, -1.697562, 1, 1, 1, 1, 1,
-1.888461, 1.298354, -1.452862, 1, 1, 1, 1, 1,
-1.887446, -0.1052846, -1.304076, 1, 1, 1, 1, 1,
-1.882546, -1.358547, -2.718535, 1, 1, 1, 1, 1,
-1.877473, -1.42984, -3.663377, 1, 1, 1, 1, 1,
-1.86899, 0.4764238, -0.03643562, 0, 0, 1, 1, 1,
-1.847744, 0.5065196, -2.54059, 1, 0, 0, 1, 1,
-1.841815, -0.8260552, -3.825155, 1, 0, 0, 1, 1,
-1.809785, 1.675821, -1.70937, 1, 0, 0, 1, 1,
-1.752936, 1.607986, -2.182888, 1, 0, 0, 1, 1,
-1.750249, 0.684832, -0.6117654, 1, 0, 0, 1, 1,
-1.746653, 1.834511, -0.8222578, 0, 0, 0, 1, 1,
-1.716848, -0.1459451, -1.61459, 0, 0, 0, 1, 1,
-1.709875, -1.554391, -2.56297, 0, 0, 0, 1, 1,
-1.688441, 0.9479803, -2.693429, 0, 0, 0, 1, 1,
-1.678684, 0.4788038, -1.981527, 0, 0, 0, 1, 1,
-1.676101, 0.7737069, -0.4445303, 0, 0, 0, 1, 1,
-1.675514, 0.9842279, -1.029619, 0, 0, 0, 1, 1,
-1.667857, 0.4794491, -2.018036, 1, 1, 1, 1, 1,
-1.658529, -2.551397, -4.249779, 1, 1, 1, 1, 1,
-1.65492, -0.4330418, -2.180996, 1, 1, 1, 1, 1,
-1.653017, -0.2248969, -2.935485, 1, 1, 1, 1, 1,
-1.649399, 0.07360251, -2.24788, 1, 1, 1, 1, 1,
-1.648275, -1.505632, -3.002537, 1, 1, 1, 1, 1,
-1.639941, 0.08822813, -1.793624, 1, 1, 1, 1, 1,
-1.634339, -1.930866, -0.3790635, 1, 1, 1, 1, 1,
-1.634311, -0.2096109, -1.502931, 1, 1, 1, 1, 1,
-1.631804, 2.461242, -1.662573, 1, 1, 1, 1, 1,
-1.62851, 0.1014665, -1.552686, 1, 1, 1, 1, 1,
-1.618338, 1.596349, -0.9996315, 1, 1, 1, 1, 1,
-1.61742, -1.095865, -0.7964134, 1, 1, 1, 1, 1,
-1.617049, 0.6866236, -1.498247, 1, 1, 1, 1, 1,
-1.613258, -1.045181e-05, -1.362182, 1, 1, 1, 1, 1,
-1.589652, -0.7681757, -3.326247, 0, 0, 1, 1, 1,
-1.575649, 0.02205639, 0.6561099, 1, 0, 0, 1, 1,
-1.567683, 0.1321531, -2.555207, 1, 0, 0, 1, 1,
-1.565953, 1.258185, -0.04860771, 1, 0, 0, 1, 1,
-1.562062, 0.4363212, -0.9776309, 1, 0, 0, 1, 1,
-1.5477, 0.4182403, -2.628295, 1, 0, 0, 1, 1,
-1.541528, -0.198605, -3.187741, 0, 0, 0, 1, 1,
-1.539745, -0.9528429, -1.910319, 0, 0, 0, 1, 1,
-1.531637, 0.01943273, -0.816426, 0, 0, 0, 1, 1,
-1.529916, -0.04494657, -0.6673477, 0, 0, 0, 1, 1,
-1.529005, 1.837591, -2.227969, 0, 0, 0, 1, 1,
-1.522195, 1.481316, 0.2136579, 0, 0, 0, 1, 1,
-1.509269, 0.0964828, -2.339815, 0, 0, 0, 1, 1,
-1.496988, -0.6654122, -3.378598, 1, 1, 1, 1, 1,
-1.48912, -1.118427, -1.598481, 1, 1, 1, 1, 1,
-1.481513, 0.02773483, -0.1644467, 1, 1, 1, 1, 1,
-1.474438, -0.09592266, -1.205133, 1, 1, 1, 1, 1,
-1.469576, 0.5451089, -0.01650974, 1, 1, 1, 1, 1,
-1.464057, 0.2253136, -1.316874, 1, 1, 1, 1, 1,
-1.450902, 1.459913, -0.3277305, 1, 1, 1, 1, 1,
-1.433216, 0.06799834, -0.7722851, 1, 1, 1, 1, 1,
-1.42851, -0.3352575, -0.8415536, 1, 1, 1, 1, 1,
-1.425219, 1.456379, -0.5283641, 1, 1, 1, 1, 1,
-1.408058, 1.274953, -1.422512, 1, 1, 1, 1, 1,
-1.40462, -0.310308, -2.149047, 1, 1, 1, 1, 1,
-1.403169, 0.9063908, -1.26564, 1, 1, 1, 1, 1,
-1.401335, 0.7249725, -1.463521, 1, 1, 1, 1, 1,
-1.396059, 0.296735, -0.2811585, 1, 1, 1, 1, 1,
-1.396055, 0.5096642, -1.04587, 0, 0, 1, 1, 1,
-1.393802, 0.3120602, -1.945938, 1, 0, 0, 1, 1,
-1.387883, 0.02537297, -1.986403, 1, 0, 0, 1, 1,
-1.378167, -2.151967, -4.834573, 1, 0, 0, 1, 1,
-1.377293, 0.4106334, -2.059304, 1, 0, 0, 1, 1,
-1.365785, -0.6129629, -3.017725, 1, 0, 0, 1, 1,
-1.353614, -1.361894, -3.674083, 0, 0, 0, 1, 1,
-1.344381, -1.349035, -2.24806, 0, 0, 0, 1, 1,
-1.341521, 0.426819, 0.06690962, 0, 0, 0, 1, 1,
-1.340263, 0.6423123, -3.370675, 0, 0, 0, 1, 1,
-1.334182, 2.029828, 0.7268794, 0, 0, 0, 1, 1,
-1.31977, -0.7120196, -1.995619, 0, 0, 0, 1, 1,
-1.299025, 1.558956, -0.07783003, 0, 0, 0, 1, 1,
-1.286074, 0.8726009, 0.9644549, 1, 1, 1, 1, 1,
-1.277771, -1.724252, -3.9537, 1, 1, 1, 1, 1,
-1.272909, 0.9631047, -0.9019991, 1, 1, 1, 1, 1,
-1.268327, 2.558638, -0.4210173, 1, 1, 1, 1, 1,
-1.267825, -1.041762, -1.802604, 1, 1, 1, 1, 1,
-1.264243, -1.023216, -2.573229, 1, 1, 1, 1, 1,
-1.258353, -0.1372621, -1.499188, 1, 1, 1, 1, 1,
-1.249271, -1.107562, -1.413356, 1, 1, 1, 1, 1,
-1.244082, 0.01069367, -1.614544, 1, 1, 1, 1, 1,
-1.234416, 0.2085615, -4.326031, 1, 1, 1, 1, 1,
-1.216694, -0.0435236, -0.2704017, 1, 1, 1, 1, 1,
-1.215664, 1.40227, -0.5492185, 1, 1, 1, 1, 1,
-1.215335, 0.9899261, -3.138111, 1, 1, 1, 1, 1,
-1.213273, -1.563873, -0.8467108, 1, 1, 1, 1, 1,
-1.208992, 1.668431, 0.7930726, 1, 1, 1, 1, 1,
-1.2057, -1.529241, -0.01746973, 0, 0, 1, 1, 1,
-1.205604, 0.5574892, -0.5759665, 1, 0, 0, 1, 1,
-1.204669, -0.2834346, -1.239754, 1, 0, 0, 1, 1,
-1.198689, -1.042791, -1.963293, 1, 0, 0, 1, 1,
-1.191944, 1.962718, -0.8772262, 1, 0, 0, 1, 1,
-1.188703, 0.2639284, -2.928979, 1, 0, 0, 1, 1,
-1.188339, 2.525594, 0.3601272, 0, 0, 0, 1, 1,
-1.187493, -1.019686, -2.120991, 0, 0, 0, 1, 1,
-1.176381, 0.982564, 0.03056143, 0, 0, 0, 1, 1,
-1.165201, 1.218793, 0.6537498, 0, 0, 0, 1, 1,
-1.158988, -0.2247396, -0.2328214, 0, 0, 0, 1, 1,
-1.155932, -0.8631833, -1.581961, 0, 0, 0, 1, 1,
-1.155094, -1.917328, -4.249626, 0, 0, 0, 1, 1,
-1.152063, -0.4412524, -2.018039, 1, 1, 1, 1, 1,
-1.151346, 1.042312, -0.2159476, 1, 1, 1, 1, 1,
-1.145166, 1.51054, 0.3530007, 1, 1, 1, 1, 1,
-1.134617, 0.2266139, -2.249342, 1, 1, 1, 1, 1,
-1.131377, 1.29066, 0.2038272, 1, 1, 1, 1, 1,
-1.124547, 0.2653835, -1.380587, 1, 1, 1, 1, 1,
-1.122907, -1.608443, -2.920358, 1, 1, 1, 1, 1,
-1.120049, 0.740944, -2.43049, 1, 1, 1, 1, 1,
-1.117459, 1.342848, -1.816232, 1, 1, 1, 1, 1,
-1.113253, 0.3114503, -2.500641, 1, 1, 1, 1, 1,
-1.11171, -0.3748394, -1.385433, 1, 1, 1, 1, 1,
-1.110354, 0.484557, -0.2385833, 1, 1, 1, 1, 1,
-1.106885, -0.6018361, -1.707093, 1, 1, 1, 1, 1,
-1.102264, 0.3240837, -1.373276, 1, 1, 1, 1, 1,
-1.093976, 2.127277, 0.2064855, 1, 1, 1, 1, 1,
-1.085795, -0.8664351, -3.341934, 0, 0, 1, 1, 1,
-1.073856, 1.165995, -1.307141, 1, 0, 0, 1, 1,
-1.073082, 0.2662438, -0.7316367, 1, 0, 0, 1, 1,
-1.065602, -0.4680536, -1.368598, 1, 0, 0, 1, 1,
-1.064241, -0.6850727, -0.8780459, 1, 0, 0, 1, 1,
-1.062039, 0.7338366, -1.547487, 1, 0, 0, 1, 1,
-1.055346, 0.7021019, -1.36825, 0, 0, 0, 1, 1,
-1.050618, -0.3441372, -0.2990194, 0, 0, 0, 1, 1,
-1.047034, 0.006000239, -1.595131, 0, 0, 0, 1, 1,
-1.040825, 1.253803, 0.1881193, 0, 0, 0, 1, 1,
-1.037398, 2.638716, -1.140625, 0, 0, 0, 1, 1,
-1.035514, -0.1737825, -1.654842, 0, 0, 0, 1, 1,
-1.025681, -1.233496, -1.686631, 0, 0, 0, 1, 1,
-1.021674, 0.3706536, -2.489085, 1, 1, 1, 1, 1,
-1.012085, 0.2518492, -2.128838, 1, 1, 1, 1, 1,
-1.006065, -0.2689076, -1.331244, 1, 1, 1, 1, 1,
-0.998351, 1.160066, -0.7742146, 1, 1, 1, 1, 1,
-0.9944879, -0.07397931, -3.008442, 1, 1, 1, 1, 1,
-0.9936232, -1.769749, -3.420791, 1, 1, 1, 1, 1,
-0.9907059, -0.2446761, -1.611781, 1, 1, 1, 1, 1,
-0.9898777, -1.105289, -2.831135, 1, 1, 1, 1, 1,
-0.9882364, 0.4799574, -0.2721111, 1, 1, 1, 1, 1,
-0.9772717, 0.7016872, -0.5090656, 1, 1, 1, 1, 1,
-0.9747319, 1.249756, 1.029076, 1, 1, 1, 1, 1,
-0.9688518, -0.8387946, -2.085657, 1, 1, 1, 1, 1,
-0.9598384, 1.082158, 0.1338738, 1, 1, 1, 1, 1,
-0.9497579, -0.2279615, -2.611865, 1, 1, 1, 1, 1,
-0.9478561, 0.4233535, 0.9558539, 1, 1, 1, 1, 1,
-0.9401469, 0.3596199, 1.328956, 0, 0, 1, 1, 1,
-0.9376516, 0.005823276, -1.174664, 1, 0, 0, 1, 1,
-0.928393, -0.3752443, -2.365354, 1, 0, 0, 1, 1,
-0.9275392, -1.374508, 0.1747697, 1, 0, 0, 1, 1,
-0.9274369, -0.5664723, -3.634508, 1, 0, 0, 1, 1,
-0.9257107, -0.7520068, -0.8751389, 1, 0, 0, 1, 1,
-0.9235685, 0.3621742, -1.109787, 0, 0, 0, 1, 1,
-0.9203547, 1.739189, -0.4852671, 0, 0, 0, 1, 1,
-0.9141689, -0.9564673, -2.091521, 0, 0, 0, 1, 1,
-0.9136794, 0.2399482, -3.048175, 0, 0, 0, 1, 1,
-0.9065527, -1.32371, -2.036796, 0, 0, 0, 1, 1,
-0.9033055, -1.842166, -2.52292, 0, 0, 0, 1, 1,
-0.9016686, 1.110246, -1.143763, 0, 0, 0, 1, 1,
-0.8959973, -0.6703246, -1.984863, 1, 1, 1, 1, 1,
-0.8955277, -0.629685, -2.273955, 1, 1, 1, 1, 1,
-0.8945599, -1.00167, -2.514294, 1, 1, 1, 1, 1,
-0.8811833, 0.7438501, -1.152655, 1, 1, 1, 1, 1,
-0.8793824, 0.09499824, -0.3221485, 1, 1, 1, 1, 1,
-0.8759143, 1.322844, 1.613593, 1, 1, 1, 1, 1,
-0.8753771, 0.1369499, -1.696722, 1, 1, 1, 1, 1,
-0.8730842, -0.7448335, -2.086673, 1, 1, 1, 1, 1,
-0.865272, -0.3818198, -3.453836, 1, 1, 1, 1, 1,
-0.8644639, 0.09597377, -1.037134, 1, 1, 1, 1, 1,
-0.8627617, -0.6724197, -3.232906, 1, 1, 1, 1, 1,
-0.8597239, -0.2520364, -0.6811288, 1, 1, 1, 1, 1,
-0.8565185, 0.6047157, -1.536724, 1, 1, 1, 1, 1,
-0.8503381, -0.8806009, -1.606872, 1, 1, 1, 1, 1,
-0.8487604, -1.454038, -2.766942, 1, 1, 1, 1, 1,
-0.8455284, -0.5117618, -2.464615, 0, 0, 1, 1, 1,
-0.8373728, -1.112879, -3.138188, 1, 0, 0, 1, 1,
-0.8368936, 1.043077, -0.7870435, 1, 0, 0, 1, 1,
-0.8321369, -0.7247716, -1.785753, 1, 0, 0, 1, 1,
-0.826188, -1.894857, -0.6862043, 1, 0, 0, 1, 1,
-0.8261209, 0.8298627, -2.245818, 1, 0, 0, 1, 1,
-0.815017, -1.905308, -2.325374, 0, 0, 0, 1, 1,
-0.8145236, 0.8658231, 0.1457522, 0, 0, 0, 1, 1,
-0.8099014, -0.0863122, -2.394727, 0, 0, 0, 1, 1,
-0.8024498, -0.2303507, -1.338765, 0, 0, 0, 1, 1,
-0.8008451, 0.7177129, -1.760583, 0, 0, 0, 1, 1,
-0.7954607, -1.831815, -2.687472, 0, 0, 0, 1, 1,
-0.7901836, -0.6052529, -2.530055, 0, 0, 0, 1, 1,
-0.7897314, 0.6225294, -0.04880587, 1, 1, 1, 1, 1,
-0.7866277, 1.166745, -1.872119, 1, 1, 1, 1, 1,
-0.7865818, -0.1209491, -1.127334, 1, 1, 1, 1, 1,
-0.7812549, -0.1040818, -1.458015, 1, 1, 1, 1, 1,
-0.780327, -1.267917, -1.327959, 1, 1, 1, 1, 1,
-0.7793908, -0.03917842, -2.876386, 1, 1, 1, 1, 1,
-0.777926, -0.118953, -0.9801568, 1, 1, 1, 1, 1,
-0.7747164, -0.04233951, -3.229392, 1, 1, 1, 1, 1,
-0.767912, -0.6421059, -2.142318, 1, 1, 1, 1, 1,
-0.7598045, 1.067775, -0.8638234, 1, 1, 1, 1, 1,
-0.7576552, -0.9224947, -1.736651, 1, 1, 1, 1, 1,
-0.7565548, 0.2264711, -0.7959368, 1, 1, 1, 1, 1,
-0.7560229, 2.333075, 0.2917516, 1, 1, 1, 1, 1,
-0.7544016, 0.3948008, 0.3905325, 1, 1, 1, 1, 1,
-0.7532857, -2.337655, -3.136647, 1, 1, 1, 1, 1,
-0.7523615, 0.6980147, 0.4858846, 0, 0, 1, 1, 1,
-0.7489194, -1.07369, -1.323524, 1, 0, 0, 1, 1,
-0.7485711, -0.2548819, -2.337732, 1, 0, 0, 1, 1,
-0.7478044, -1.092233, -3.141348, 1, 0, 0, 1, 1,
-0.742887, -1.362408, -3.851716, 1, 0, 0, 1, 1,
-0.742662, 1.134912, 0.3991152, 1, 0, 0, 1, 1,
-0.7363339, -0.280523, -2.684299, 0, 0, 0, 1, 1,
-0.7363076, -0.2840916, -2.190993, 0, 0, 0, 1, 1,
-0.7342255, 0.9392341, -1.183549, 0, 0, 0, 1, 1,
-0.7318769, -0.5041559, -1.627555, 0, 0, 0, 1, 1,
-0.7278659, -1.032981, -1.732812, 0, 0, 0, 1, 1,
-0.7274827, 0.8281692, -1.320283, 0, 0, 0, 1, 1,
-0.7199326, -0.8849481, -1.74759, 0, 0, 0, 1, 1,
-0.7196833, 0.8422493, 0.008273407, 1, 1, 1, 1, 1,
-0.7140631, -0.2291224, -1.385235, 1, 1, 1, 1, 1,
-0.7127001, -1.408794, -2.391234, 1, 1, 1, 1, 1,
-0.7092338, 2.420752, -1.135155, 1, 1, 1, 1, 1,
-0.7086093, 1.264472, -0.002495748, 1, 1, 1, 1, 1,
-0.7046783, 1.206404, 0.4856428, 1, 1, 1, 1, 1,
-0.7027794, -0.1468041, -3.078403, 1, 1, 1, 1, 1,
-0.694486, 1.082016, 0.294286, 1, 1, 1, 1, 1,
-0.6944721, -1.419073, -3.251269, 1, 1, 1, 1, 1,
-0.693424, 0.6827837, -2.419844, 1, 1, 1, 1, 1,
-0.6915348, 0.6565561, -0.3424053, 1, 1, 1, 1, 1,
-0.6900809, 1.877057, -0.8210127, 1, 1, 1, 1, 1,
-0.6883813, -0.928919, -3.241952, 1, 1, 1, 1, 1,
-0.6871516, 0.44095, 1.064641, 1, 1, 1, 1, 1,
-0.6840509, 0.317541, -0.2358202, 1, 1, 1, 1, 1,
-0.6838688, 1.05965, -0.0367632, 0, 0, 1, 1, 1,
-0.6836096, 0.2056607, 1.024298, 1, 0, 0, 1, 1,
-0.6818702, 0.4756092, -1.478586, 1, 0, 0, 1, 1,
-0.6810577, -0.3830675, -2.848028, 1, 0, 0, 1, 1,
-0.6767702, -0.5963339, -1.299824, 1, 0, 0, 1, 1,
-0.6760696, 0.1600126, -1.964779, 1, 0, 0, 1, 1,
-0.672381, -0.1919409, -0.4543906, 0, 0, 0, 1, 1,
-0.6699175, -0.8754727, -3.460272, 0, 0, 0, 1, 1,
-0.6687711, 0.9471232, -1.420423, 0, 0, 0, 1, 1,
-0.6686468, 0.6581737, -0.4074749, 0, 0, 0, 1, 1,
-0.6617133, -0.442763, -3.39615, 0, 0, 0, 1, 1,
-0.660108, 0.05481811, -2.578798, 0, 0, 0, 1, 1,
-0.6543638, 0.950094, -2.47155, 0, 0, 0, 1, 1,
-0.6508481, 0.03106672, -1.726211, 1, 1, 1, 1, 1,
-0.6498689, -1.058689, -2.276986, 1, 1, 1, 1, 1,
-0.6448009, 1.08858, -0.7780562, 1, 1, 1, 1, 1,
-0.6386148, 0.6414443, -1.189085, 1, 1, 1, 1, 1,
-0.6372371, -0.8342068, -2.131019, 1, 1, 1, 1, 1,
-0.6328645, 0.6558046, -0.2447024, 1, 1, 1, 1, 1,
-0.6304582, -0.711889, -1.626781, 1, 1, 1, 1, 1,
-0.6272102, -0.1033497, -2.722465, 1, 1, 1, 1, 1,
-0.6270648, 0.7440328, -1.220076, 1, 1, 1, 1, 1,
-0.6158974, -0.3731844, -2.517983, 1, 1, 1, 1, 1,
-0.6131281, 0.7519348, 0.04943549, 1, 1, 1, 1, 1,
-0.612254, 0.1263561, -1.388687, 1, 1, 1, 1, 1,
-0.6095077, -1.158363, -2.263081, 1, 1, 1, 1, 1,
-0.6093649, -2.205043, -2.536616, 1, 1, 1, 1, 1,
-0.6030947, -0.8004005, -0.8861986, 1, 1, 1, 1, 1,
-0.6019325, -0.518406, -1.545296, 0, 0, 1, 1, 1,
-0.6000841, -0.1942707, -1.060798, 1, 0, 0, 1, 1,
-0.5958824, 1.880916, -1.956937, 1, 0, 0, 1, 1,
-0.594766, -0.7095718, -2.106302, 1, 0, 0, 1, 1,
-0.5940346, -0.8360696, -3.716221, 1, 0, 0, 1, 1,
-0.5938932, 0.7393274, -1.829265, 1, 0, 0, 1, 1,
-0.5896625, -1.011685, -3.106512, 0, 0, 0, 1, 1,
-0.5895116, -0.3880324, -1.139201, 0, 0, 0, 1, 1,
-0.5867102, -0.9879628, -2.045828, 0, 0, 0, 1, 1,
-0.5850713, -0.7687979, -2.502952, 0, 0, 0, 1, 1,
-0.5845787, -0.8921644, -1.663551, 0, 0, 0, 1, 1,
-0.5794381, 1.703737, -0.3383582, 0, 0, 0, 1, 1,
-0.5751522, -0.003976859, -2.541398, 0, 0, 0, 1, 1,
-0.5724881, -0.4258111, -1.532578, 1, 1, 1, 1, 1,
-0.5723696, -1.295676, -2.516156, 1, 1, 1, 1, 1,
-0.5683176, 0.4638617, -1.698224, 1, 1, 1, 1, 1,
-0.5656456, 0.1823962, -2.471725, 1, 1, 1, 1, 1,
-0.5644881, -1.54252, -2.215111, 1, 1, 1, 1, 1,
-0.5594577, -2.92617, -2.471333, 1, 1, 1, 1, 1,
-0.5582088, 0.4840497, 0.8353166, 1, 1, 1, 1, 1,
-0.5570785, -1.516156, -4.298692, 1, 1, 1, 1, 1,
-0.5569261, -0.4289053, -1.819032, 1, 1, 1, 1, 1,
-0.553623, -0.6922795, -3.097627, 1, 1, 1, 1, 1,
-0.5508938, -1.074066, -3.372435, 1, 1, 1, 1, 1,
-0.5508516, 0.2408288, -1.491295, 1, 1, 1, 1, 1,
-0.5419339, -0.02822012, -2.380255, 1, 1, 1, 1, 1,
-0.5392142, -0.4050757, -2.716664, 1, 1, 1, 1, 1,
-0.5348957, -0.6240485, -1.206147, 1, 1, 1, 1, 1,
-0.52725, 0.08179396, -1.791328, 0, 0, 1, 1, 1,
-0.5265567, -0.5271427, -0.7558697, 1, 0, 0, 1, 1,
-0.5253412, 1.158007, 1.314728, 1, 0, 0, 1, 1,
-0.5210702, -1.607038, -3.020443, 1, 0, 0, 1, 1,
-0.5166455, -1.432151, -1.394268, 1, 0, 0, 1, 1,
-0.5101932, 0.02864429, -2.211031, 1, 0, 0, 1, 1,
-0.5100917, 0.0527088, -1.450886, 0, 0, 0, 1, 1,
-0.5031876, -0.1127291, -1.613556, 0, 0, 0, 1, 1,
-0.5018374, -0.508846, -2.820671, 0, 0, 0, 1, 1,
-0.499587, -1.687997, -2.913075, 0, 0, 0, 1, 1,
-0.498807, 1.753196, -0.1774115, 0, 0, 0, 1, 1,
-0.4973388, -1.829778, -2.783663, 0, 0, 0, 1, 1,
-0.4946108, -0.9500512, -2.696311, 0, 0, 0, 1, 1,
-0.4938477, -0.1346954, -1.229702, 1, 1, 1, 1, 1,
-0.4930833, 0.6267462, -2.417362, 1, 1, 1, 1, 1,
-0.4905173, -0.6240214, -4.359071, 1, 1, 1, 1, 1,
-0.4893357, 0.5687891, -0.01305907, 1, 1, 1, 1, 1,
-0.488023, 0.3674205, -1.155843, 1, 1, 1, 1, 1,
-0.4844585, -0.08215381, -0.3481039, 1, 1, 1, 1, 1,
-0.4829195, 0.08095677, -1.270118, 1, 1, 1, 1, 1,
-0.4809285, -0.6463922, -2.593146, 1, 1, 1, 1, 1,
-0.4771682, 1.314013, -0.5320485, 1, 1, 1, 1, 1,
-0.4746363, -0.7821085, -2.22804, 1, 1, 1, 1, 1,
-0.4739155, 0.1939189, -2.159843, 1, 1, 1, 1, 1,
-0.4738967, 1.131879, 0.6734263, 1, 1, 1, 1, 1,
-0.4715987, 0.3639576, 0.875998, 1, 1, 1, 1, 1,
-0.4702232, -0.1499642, -1.705889, 1, 1, 1, 1, 1,
-0.4690025, 0.6338958, -1.415209, 1, 1, 1, 1, 1,
-0.4566119, 0.6178522, -1.574703, 0, 0, 1, 1, 1,
-0.4566045, -0.5792208, -1.128363, 1, 0, 0, 1, 1,
-0.4550959, 0.6606903, -1.453879, 1, 0, 0, 1, 1,
-0.4497113, 1.456477, -0.7487485, 1, 0, 0, 1, 1,
-0.4486749, -1.820324, -2.704346, 1, 0, 0, 1, 1,
-0.4461851, 0.6373749, 0.5603615, 1, 0, 0, 1, 1,
-0.4416288, -0.5502527, -3.253624, 0, 0, 0, 1, 1,
-0.4400642, -2.150678, -3.823131, 0, 0, 0, 1, 1,
-0.4367346, 0.9049053, -0.3287542, 0, 0, 0, 1, 1,
-0.4353875, -1.505261, -1.891913, 0, 0, 0, 1, 1,
-0.4327248, -0.9212492, -2.019052, 0, 0, 0, 1, 1,
-0.432059, 0.6660157, -0.7647554, 0, 0, 0, 1, 1,
-0.4313759, -0.5245504, -4.37098, 0, 0, 0, 1, 1,
-0.4296093, -0.9168955, -1.578588, 1, 1, 1, 1, 1,
-0.4292318, -0.8004616, -3.121871, 1, 1, 1, 1, 1,
-0.4271576, 0.2119012, -1.737355, 1, 1, 1, 1, 1,
-0.4249484, -2.296719, -2.050105, 1, 1, 1, 1, 1,
-0.4196072, 1.070143, -1.928121, 1, 1, 1, 1, 1,
-0.4160546, 0.4381168, -0.5165895, 1, 1, 1, 1, 1,
-0.4150056, 0.8011466, -0.5243445, 1, 1, 1, 1, 1,
-0.4137453, -0.7535203, -3.850619, 1, 1, 1, 1, 1,
-0.4126846, 1.745475, -2.301315, 1, 1, 1, 1, 1,
-0.4106122, 0.2249657, -0.1959259, 1, 1, 1, 1, 1,
-0.4009018, -0.08189476, -1.445836, 1, 1, 1, 1, 1,
-0.4005699, -0.7090751, -2.271218, 1, 1, 1, 1, 1,
-0.4004445, -1.176787, -0.2312234, 1, 1, 1, 1, 1,
-0.3940824, -2.01207, -2.695942, 1, 1, 1, 1, 1,
-0.3939002, 0.4773629, -0.38195, 1, 1, 1, 1, 1,
-0.3918779, 0.5380425, 0.1568131, 0, 0, 1, 1, 1,
-0.3779076, 0.1816461, -1.255214, 1, 0, 0, 1, 1,
-0.3769764, -1.094276, -3.36097, 1, 0, 0, 1, 1,
-0.371626, -0.9080328, -4.076873, 1, 0, 0, 1, 1,
-0.3714012, -0.3451454, -2.156868, 1, 0, 0, 1, 1,
-0.366044, -0.7048649, -2.890309, 1, 0, 0, 1, 1,
-0.3597665, 1.227069, -2.052859, 0, 0, 0, 1, 1,
-0.3588021, 0.1764472, -0.3740618, 0, 0, 0, 1, 1,
-0.3568474, -0.4063759, -2.264403, 0, 0, 0, 1, 1,
-0.3531729, -1.046243, -0.4665207, 0, 0, 0, 1, 1,
-0.352817, -0.09245779, -1.573705, 0, 0, 0, 1, 1,
-0.3400614, -0.445287, -2.207821, 0, 0, 0, 1, 1,
-0.3387945, -1.176579, -1.669806, 0, 0, 0, 1, 1,
-0.3366062, -0.5558908, -2.202925, 1, 1, 1, 1, 1,
-0.3337064, 0.3601418, -0.8425815, 1, 1, 1, 1, 1,
-0.3318756, 1.059333, 0.446449, 1, 1, 1, 1, 1,
-0.328353, 0.01975844, -1.024575, 1, 1, 1, 1, 1,
-0.3271641, -1.432808, -2.069734, 1, 1, 1, 1, 1,
-0.3239074, -0.8751741, -3.061197, 1, 1, 1, 1, 1,
-0.3210884, -0.6468428, -3.337275, 1, 1, 1, 1, 1,
-0.3210579, 1.779966, -0.2179572, 1, 1, 1, 1, 1,
-0.3152435, -0.76437, -1.830936, 1, 1, 1, 1, 1,
-0.3138147, -0.9592943, -3.218614, 1, 1, 1, 1, 1,
-0.313342, 0.3896815, -1.213521, 1, 1, 1, 1, 1,
-0.3125503, -1.076332, -3.35016, 1, 1, 1, 1, 1,
-0.3082226, 1.617834, -1.481412, 1, 1, 1, 1, 1,
-0.2994096, 0.9124464, -1.374786, 1, 1, 1, 1, 1,
-0.2983843, -0.9732311, -4.327527, 1, 1, 1, 1, 1,
-0.2825416, 0.9021552, -0.9166663, 0, 0, 1, 1, 1,
-0.2794257, -0.5608879, -3.65202, 1, 0, 0, 1, 1,
-0.2725913, -1.532916, -2.399469, 1, 0, 0, 1, 1,
-0.2683889, 0.7225085, 0.8755049, 1, 0, 0, 1, 1,
-0.2671677, -1.115399, -4.164528, 1, 0, 0, 1, 1,
-0.2628579, -0.8760103, -3.693447, 1, 0, 0, 1, 1,
-0.2604387, 0.6166801, 1.155976, 0, 0, 0, 1, 1,
-0.2558146, 0.2871626, 0.1363437, 0, 0, 0, 1, 1,
-0.2528005, -0.2072798, -2.967227, 0, 0, 0, 1, 1,
-0.2511341, 0.5511142, 0.3517602, 0, 0, 0, 1, 1,
-0.2464539, -0.4060141, -3.100743, 0, 0, 0, 1, 1,
-0.2364053, -1.738366, -2.040062, 0, 0, 0, 1, 1,
-0.2355929, 2.540989, -1.379863, 0, 0, 0, 1, 1,
-0.2330174, 0.5899462, 0.009401952, 1, 1, 1, 1, 1,
-0.2288667, 1.334593, -0.6697757, 1, 1, 1, 1, 1,
-0.2250794, 0.5741245, -2.013597, 1, 1, 1, 1, 1,
-0.2231872, 1.759513, 0.7514942, 1, 1, 1, 1, 1,
-0.2220326, 0.3938, 0.652143, 1, 1, 1, 1, 1,
-0.2209123, 0.4301679, 0.6988727, 1, 1, 1, 1, 1,
-0.2181733, 0.1826405, -0.7854013, 1, 1, 1, 1, 1,
-0.2133841, 1.495262, -0.556307, 1, 1, 1, 1, 1,
-0.2122997, -1.252388, -1.061201, 1, 1, 1, 1, 1,
-0.208728, 1.489726, 0.4465055, 1, 1, 1, 1, 1,
-0.2086903, 0.4597825, -1.478197, 1, 1, 1, 1, 1,
-0.2083315, 0.07387213, -0.3948119, 1, 1, 1, 1, 1,
-0.2070602, 0.2927292, -1.368882, 1, 1, 1, 1, 1,
-0.2033809, 0.246391, -1.598189, 1, 1, 1, 1, 1,
-0.2031888, 0.3266055, -1.866092, 1, 1, 1, 1, 1,
-0.202689, -0.2809243, -2.683625, 0, 0, 1, 1, 1,
-0.196874, -0.49816, -3.594259, 1, 0, 0, 1, 1,
-0.1955633, -1.019934, -2.227212, 1, 0, 0, 1, 1,
-0.193912, 0.8536884, 2.173108, 1, 0, 0, 1, 1,
-0.1805414, 0.4045711, -0.9403983, 1, 0, 0, 1, 1,
-0.1749798, 0.8550404, 0.3679903, 1, 0, 0, 1, 1,
-0.1741846, -0.9839212, -3.547457, 0, 0, 0, 1, 1,
-0.1710823, 2.209359, -0.5996351, 0, 0, 0, 1, 1,
-0.1682292, 0.4673991, -0.3100254, 0, 0, 0, 1, 1,
-0.1680456, 0.006856352, -0.1147839, 0, 0, 0, 1, 1,
-0.1676776, -2.082661, -4.990629, 0, 0, 0, 1, 1,
-0.1610062, 1.421126, 2.449857, 0, 0, 0, 1, 1,
-0.1602064, -2.018277, -3.45662, 0, 0, 0, 1, 1,
-0.154641, -0.09325976, -1.708677, 1, 1, 1, 1, 1,
-0.1540325, -0.3599119, -3.4437, 1, 1, 1, 1, 1,
-0.151819, -0.8000025, -4.597277, 1, 1, 1, 1, 1,
-0.1499542, -0.3775802, -2.356698, 1, 1, 1, 1, 1,
-0.1497488, 0.04367128, -2.560182, 1, 1, 1, 1, 1,
-0.1466383, 0.242216, -1.171048, 1, 1, 1, 1, 1,
-0.1439615, 0.1825059, 1.447922, 1, 1, 1, 1, 1,
-0.1399311, -1.255208, -1.593252, 1, 1, 1, 1, 1,
-0.1376713, -0.9013174, -4.157994, 1, 1, 1, 1, 1,
-0.1371993, 0.6552214, 1.290179, 1, 1, 1, 1, 1,
-0.1350109, -0.143782, -2.608551, 1, 1, 1, 1, 1,
-0.1321568, -1.032917, -2.5974, 1, 1, 1, 1, 1,
-0.1312026, -0.189568, -2.015403, 1, 1, 1, 1, 1,
-0.1243096, 2.594588, 0.4744368, 1, 1, 1, 1, 1,
-0.1234239, -1.057088, -2.753523, 1, 1, 1, 1, 1,
-0.1228186, 0.004170135, -3.599221, 0, 0, 1, 1, 1,
-0.1201958, -0.9159076, -3.785275, 1, 0, 0, 1, 1,
-0.1200902, 1.224411, -0.3594744, 1, 0, 0, 1, 1,
-0.1186196, -0.3073632, -3.126351, 1, 0, 0, 1, 1,
-0.1184808, -0.5636196, -3.728399, 1, 0, 0, 1, 1,
-0.1182611, 0.5416784, 0.5219978, 1, 0, 0, 1, 1,
-0.1142356, -1.41883, -0.4683927, 0, 0, 0, 1, 1,
-0.1139491, -0.7066682, -4.520174, 0, 0, 0, 1, 1,
-0.1136072, -0.1119953, -2.425812, 0, 0, 0, 1, 1,
-0.1116789, 1.728838, -0.4766628, 0, 0, 0, 1, 1,
-0.110637, 2.33492, 0.9662025, 0, 0, 0, 1, 1,
-0.1082741, 0.3377362, 0.3832031, 0, 0, 0, 1, 1,
-0.1073857, 1.227531, -1.146013, 0, 0, 0, 1, 1,
-0.1055584, -0.8043032, -4.506361, 1, 1, 1, 1, 1,
-0.09738859, -0.06182451, -3.208965, 1, 1, 1, 1, 1,
-0.09128509, -0.8645993, -3.205072, 1, 1, 1, 1, 1,
-0.08863968, -0.3050068, -4.712899, 1, 1, 1, 1, 1,
-0.08832999, -0.4702388, -3.976576, 1, 1, 1, 1, 1,
-0.08223705, 0.5385243, 1.303187, 1, 1, 1, 1, 1,
-0.07910649, 0.03805536, -0.76037, 1, 1, 1, 1, 1,
-0.07867784, -0.949863, -2.891203, 1, 1, 1, 1, 1,
-0.07560467, 2.079366, 0.6378559, 1, 1, 1, 1, 1,
-0.0744153, -1.891717, -5.700894, 1, 1, 1, 1, 1,
-0.07366691, 0.4102449, 0.6918666, 1, 1, 1, 1, 1,
-0.0671045, 0.2938116, 0.04603854, 1, 1, 1, 1, 1,
-0.06663593, 0.7979526, 0.2427279, 1, 1, 1, 1, 1,
-0.0608059, 0.7501016, -0.4918788, 1, 1, 1, 1, 1,
-0.05972189, 1.206733, -0.8075918, 1, 1, 1, 1, 1,
-0.0595555, 0.02376349, -2.37546, 0, 0, 1, 1, 1,
-0.05836617, -0.7846383, -3.308771, 1, 0, 0, 1, 1,
-0.04822425, -1.53543, -2.881056, 1, 0, 0, 1, 1,
-0.04747109, -0.7738643, -3.603296, 1, 0, 0, 1, 1,
-0.04550687, 0.1211895, -0.3602905, 1, 0, 0, 1, 1,
-0.04273493, -1.288451, -1.282859, 1, 0, 0, 1, 1,
-0.04205235, -0.4686674, -3.93935, 0, 0, 0, 1, 1,
-0.04084221, 0.4174528, 0.5668136, 0, 0, 0, 1, 1,
-0.03996933, 0.1882223, 0.5330473, 0, 0, 0, 1, 1,
-0.03989051, 1.193329, -0.0829116, 0, 0, 0, 1, 1,
-0.03804835, 0.8083469, -0.5455443, 0, 0, 0, 1, 1,
-0.0379897, 0.8791617, -0.07089236, 0, 0, 0, 1, 1,
-0.0335369, 0.185846, -0.7639704, 0, 0, 0, 1, 1,
-0.03130463, -0.9575384, -3.110541, 1, 1, 1, 1, 1,
-0.03025324, 0.7245157, -0.8177727, 1, 1, 1, 1, 1,
-0.02984381, 0.4663734, -0.8764714, 1, 1, 1, 1, 1,
-0.02385413, 1.727223, -0.01350099, 1, 1, 1, 1, 1,
-0.02335666, 0.6174353, -0.3407239, 1, 1, 1, 1, 1,
-0.02324828, -1.53041, -4.157038, 1, 1, 1, 1, 1,
-0.02318287, -0.3536733, -2.976177, 1, 1, 1, 1, 1,
-0.02279, -0.3368381, -4.640119, 1, 1, 1, 1, 1,
-0.02083674, -0.2167733, -2.526609, 1, 1, 1, 1, 1,
-0.01664763, 0.3231082, 0.1793352, 1, 1, 1, 1, 1,
-0.0130405, 0.8538023, 0.5080439, 1, 1, 1, 1, 1,
-0.01137729, -0.10342, -3.76438, 1, 1, 1, 1, 1,
-0.01129751, -0.6065665, -5.281059, 1, 1, 1, 1, 1,
-0.01089946, -0.4461257, -4.573232, 1, 1, 1, 1, 1,
-0.005840795, -0.796285, -2.750658, 1, 1, 1, 1, 1,
-0.001284589, -0.8142996, -2.24627, 0, 0, 1, 1, 1,
-1.774362e-05, 0.2582746, 0.9751679, 1, 0, 0, 1, 1,
4.81956e-05, 2.208172, 0.8328165, 1, 0, 0, 1, 1,
0.003756768, -1.011102, 4.555905, 1, 0, 0, 1, 1,
0.008969642, -1.696216, 2.053547, 1, 0, 0, 1, 1,
0.01059152, 0.6062019, 0.00524454, 1, 0, 0, 1, 1,
0.0148521, -0.6495508, 2.162192, 0, 0, 0, 1, 1,
0.01513487, 0.7163765, 0.4589221, 0, 0, 0, 1, 1,
0.02048432, 0.7431145, 0.9552958, 0, 0, 0, 1, 1,
0.02052844, -0.3097272, 1.537294, 0, 0, 0, 1, 1,
0.02162562, -1.357207, 2.849956, 0, 0, 0, 1, 1,
0.02167399, -0.2968117, 2.771982, 0, 0, 0, 1, 1,
0.02209562, -0.1659536, 2.841767, 0, 0, 0, 1, 1,
0.02302091, 0.06235129, 1.234155, 1, 1, 1, 1, 1,
0.03213086, 0.8838845, 1.610899, 1, 1, 1, 1, 1,
0.03465353, -0.5950761, 2.738984, 1, 1, 1, 1, 1,
0.03521939, -1.393053, 2.300454, 1, 1, 1, 1, 1,
0.03563098, -1.35579, 3.967513, 1, 1, 1, 1, 1,
0.03741484, -0.5604014, 2.445226, 1, 1, 1, 1, 1,
0.04047367, -1.343543, 2.396757, 1, 1, 1, 1, 1,
0.06236756, 0.2538365, -1.017235, 1, 1, 1, 1, 1,
0.06331963, 0.497333, 1.746034, 1, 1, 1, 1, 1,
0.06417619, 0.3649856, 0.291859, 1, 1, 1, 1, 1,
0.06732886, -0.5036578, 3.838279, 1, 1, 1, 1, 1,
0.07021166, -0.4856462, 1.641182, 1, 1, 1, 1, 1,
0.07032502, 0.9648944, -0.9551858, 1, 1, 1, 1, 1,
0.0711135, -0.3945829, 2.022603, 1, 1, 1, 1, 1,
0.07365775, 0.3645452, 1.8123, 1, 1, 1, 1, 1,
0.07404112, -1.251879, 1.284273, 0, 0, 1, 1, 1,
0.07531419, 0.1844234, -0.6483429, 1, 0, 0, 1, 1,
0.07593461, 0.8278461, 0.4838829, 1, 0, 0, 1, 1,
0.07596911, -0.5205186, 3.321783, 1, 0, 0, 1, 1,
0.08085219, -1.211076, 4.070648, 1, 0, 0, 1, 1,
0.08139996, -1.238462, 2.214608, 1, 0, 0, 1, 1,
0.08197339, -1.571733, 1.912537, 0, 0, 0, 1, 1,
0.08934451, 1.111353, -0.8303057, 0, 0, 0, 1, 1,
0.09084162, -0.8682354, 3.528775, 0, 0, 0, 1, 1,
0.09738311, 1.228704, -1.006947, 0, 0, 0, 1, 1,
0.09799098, -0.7109081, 2.953964, 0, 0, 0, 1, 1,
0.09922254, -0.5523879, 1.727464, 0, 0, 0, 1, 1,
0.1005389, -1.199201, 1.154199, 0, 0, 0, 1, 1,
0.1098994, -0.3305157, 3.043789, 1, 1, 1, 1, 1,
0.1105116, 0.6230386, 1.660417, 1, 1, 1, 1, 1,
0.1150573, -0.4605084, 1.612576, 1, 1, 1, 1, 1,
0.1181745, -0.1761729, 1.964053, 1, 1, 1, 1, 1,
0.1214544, 1.348805, -0.2500247, 1, 1, 1, 1, 1,
0.1240556, 0.02709799, 0.7731159, 1, 1, 1, 1, 1,
0.1276469, -0.1956476, 3.866494, 1, 1, 1, 1, 1,
0.1349397, -0.5850065, 4.354406, 1, 1, 1, 1, 1,
0.1393203, 1.259846, 0.5376624, 1, 1, 1, 1, 1,
0.1479604, 0.3988566, -0.01435124, 1, 1, 1, 1, 1,
0.1541692, -0.4794599, 3.104628, 1, 1, 1, 1, 1,
0.1568414, -1.435976, 1.564248, 1, 1, 1, 1, 1,
0.159538, 0.2307784, -0.2871223, 1, 1, 1, 1, 1,
0.1678338, 0.6738418, 0.8645496, 1, 1, 1, 1, 1,
0.1710471, 0.7734861, -0.5150545, 1, 1, 1, 1, 1,
0.1720902, 2.116695, -0.2517889, 0, 0, 1, 1, 1,
0.1735112, -1.086889, 1.985689, 1, 0, 0, 1, 1,
0.1866026, -1.048948, 1.786212, 1, 0, 0, 1, 1,
0.1974928, 0.9168527, -0.6264989, 1, 0, 0, 1, 1,
0.2001352, 0.5648544, 1.157138, 1, 0, 0, 1, 1,
0.200988, 1.333539, -1.25079, 1, 0, 0, 1, 1,
0.2036341, 0.3797737, -0.6671454, 0, 0, 0, 1, 1,
0.2039257, -0.1608405, 2.104141, 0, 0, 0, 1, 1,
0.2045417, 0.1073117, 1.933015, 0, 0, 0, 1, 1,
0.2073391, -0.576428, 2.600073, 0, 0, 0, 1, 1,
0.2077589, -0.02869627, 1.951362, 0, 0, 0, 1, 1,
0.2108517, 1.657585, 0.2836521, 0, 0, 0, 1, 1,
0.2112844, -0.1883642, 0.9589872, 0, 0, 0, 1, 1,
0.2129448, -0.3041254, 1.216162, 1, 1, 1, 1, 1,
0.2213323, -0.7164926, 3.16441, 1, 1, 1, 1, 1,
0.2232045, -0.2542631, 1.326737, 1, 1, 1, 1, 1,
0.2232691, -0.09287943, 2.233073, 1, 1, 1, 1, 1,
0.2261277, -0.2962559, 2.356868, 1, 1, 1, 1, 1,
0.2265641, 0.5365736, 1.729961, 1, 1, 1, 1, 1,
0.229001, 1.387981, 1.18802, 1, 1, 1, 1, 1,
0.2329753, 0.5921068, -1.224743, 1, 1, 1, 1, 1,
0.2351656, 0.659309, -0.1781789, 1, 1, 1, 1, 1,
0.2378353, -0.2740646, 1.462855, 1, 1, 1, 1, 1,
0.2399579, -0.4041422, 2.684666, 1, 1, 1, 1, 1,
0.2405791, 0.2482207, 1.924577, 1, 1, 1, 1, 1,
0.2413084, -1.049249, 2.036366, 1, 1, 1, 1, 1,
0.2439039, -0.04045648, 0.8809558, 1, 1, 1, 1, 1,
0.2461727, 0.7816864, -0.8028159, 1, 1, 1, 1, 1,
0.2462573, 0.1230734, 1.562723, 0, 0, 1, 1, 1,
0.247279, -0.7049979, 2.951797, 1, 0, 0, 1, 1,
0.2533288, -1.52161, 2.561592, 1, 0, 0, 1, 1,
0.2566941, 0.3470231, 0.6769491, 1, 0, 0, 1, 1,
0.2570926, 0.1063176, 0.6903585, 1, 0, 0, 1, 1,
0.2583981, -1.252378, 2.942051, 1, 0, 0, 1, 1,
0.262089, -1.145163, 2.536497, 0, 0, 0, 1, 1,
0.2625431, -1.169163, 1.145724, 0, 0, 0, 1, 1,
0.2702713, -0.8071692, 1.824011, 0, 0, 0, 1, 1,
0.2720075, -0.5555308, 0.5067897, 0, 0, 0, 1, 1,
0.2728852, 0.9153757, 1.021173, 0, 0, 0, 1, 1,
0.2730517, -1.134838, 4.180047, 0, 0, 0, 1, 1,
0.2784057, -0.9703103, 1.599707, 0, 0, 0, 1, 1,
0.2832091, -1.67974, 1.767197, 1, 1, 1, 1, 1,
0.2879749, 1.661566, -0.2267673, 1, 1, 1, 1, 1,
0.2925077, -1.274809, 1.421509, 1, 1, 1, 1, 1,
0.2947761, -1.151605, 4.059659, 1, 1, 1, 1, 1,
0.2959841, 0.6236381, -0.8710439, 1, 1, 1, 1, 1,
0.2968397, 0.9111134, -0.8257033, 1, 1, 1, 1, 1,
0.298846, -1.129237, 3.283725, 1, 1, 1, 1, 1,
0.3003693, 0.177627, 2.040801, 1, 1, 1, 1, 1,
0.304789, 0.4464362, 1.136422, 1, 1, 1, 1, 1,
0.3084973, -0.5008197, 1.55661, 1, 1, 1, 1, 1,
0.3112215, -0.2764233, 1.079684, 1, 1, 1, 1, 1,
0.3113312, 0.1710614, 2.657246, 1, 1, 1, 1, 1,
0.3171289, 0.08303832, 2.516074, 1, 1, 1, 1, 1,
0.3174525, 0.391835, -0.3244833, 1, 1, 1, 1, 1,
0.3233004, -0.2205332, 1.154408, 1, 1, 1, 1, 1,
0.3249721, -0.3949984, 1.620071, 0, 0, 1, 1, 1,
0.3257459, 0.8021866, 0.8190408, 1, 0, 0, 1, 1,
0.3260925, 0.01466, 0.4430368, 1, 0, 0, 1, 1,
0.3269287, -0.5804624, 2.523957, 1, 0, 0, 1, 1,
0.3329425, 1.268893, -0.4700966, 1, 0, 0, 1, 1,
0.334305, 1.678771, 1.436346, 1, 0, 0, 1, 1,
0.3357843, -0.265154, 1.855824, 0, 0, 0, 1, 1,
0.340903, 1.232489, 0.5909777, 0, 0, 0, 1, 1,
0.3456556, 0.1209017, -0.006199696, 0, 0, 0, 1, 1,
0.3509214, 1.302452, 0.315692, 0, 0, 0, 1, 1,
0.3549231, 1.389255, 1.842306, 0, 0, 0, 1, 1,
0.355343, -0.2404107, 3.317866, 0, 0, 0, 1, 1,
0.3564007, 0.688894, 1.779073, 0, 0, 0, 1, 1,
0.3609212, -1.126851, 1.357671, 1, 1, 1, 1, 1,
0.3612321, 2.218318, 0.6245486, 1, 1, 1, 1, 1,
0.3612947, 0.6557249, -0.7408305, 1, 1, 1, 1, 1,
0.3614023, -0.8198235, 2.124435, 1, 1, 1, 1, 1,
0.364306, -2.305194, 3.289764, 1, 1, 1, 1, 1,
0.3702135, 0.1677633, -0.03969159, 1, 1, 1, 1, 1,
0.3754095, -0.8666548, 4.264109, 1, 1, 1, 1, 1,
0.3798979, -1.752279, 4.231827, 1, 1, 1, 1, 1,
0.3817782, 0.6068255, 0.3566883, 1, 1, 1, 1, 1,
0.3820151, 1.434516, -1.051898, 1, 1, 1, 1, 1,
0.3832808, -0.6351021, 1.258974, 1, 1, 1, 1, 1,
0.4093002, -0.8667986, 3.91667, 1, 1, 1, 1, 1,
0.4097935, 0.09538209, 2.086624, 1, 1, 1, 1, 1,
0.4130668, 0.3656524, 1.360566, 1, 1, 1, 1, 1,
0.4133188, -0.1016062, 1.584967, 1, 1, 1, 1, 1,
0.4136489, -0.6261072, 1.950733, 0, 0, 1, 1, 1,
0.4169123, -0.7532637, 0.8697768, 1, 0, 0, 1, 1,
0.4247373, 0.988555, 0.7430253, 1, 0, 0, 1, 1,
0.425145, -0.524468, 0.1389111, 1, 0, 0, 1, 1,
0.4263896, -1.232482, 1.835608, 1, 0, 0, 1, 1,
0.4268493, 0.1103139, 0.7360275, 1, 0, 0, 1, 1,
0.4287991, 0.8571851, 1.354298, 0, 0, 0, 1, 1,
0.4396122, -2.273564, 2.79283, 0, 0, 0, 1, 1,
0.4460803, 0.4702496, 0.979414, 0, 0, 0, 1, 1,
0.4462558, -0.2129041, 0.7790217, 0, 0, 0, 1, 1,
0.4466438, -0.01882924, 0.865128, 0, 0, 0, 1, 1,
0.4538163, -0.14685, 3.361149, 0, 0, 0, 1, 1,
0.4539793, 2.207758, 1.368607, 0, 0, 0, 1, 1,
0.4594651, -1.113571, 2.568974, 1, 1, 1, 1, 1,
0.4601341, -1.537601, 4.019713, 1, 1, 1, 1, 1,
0.4626857, 1.530632, 1.781166, 1, 1, 1, 1, 1,
0.4713555, 0.6831517, 0.8447205, 1, 1, 1, 1, 1,
0.4732776, -0.9097783, 1.48194, 1, 1, 1, 1, 1,
0.4875679, -0.04999718, 0.0387001, 1, 1, 1, 1, 1,
0.4920073, -0.8059568, 2.152236, 1, 1, 1, 1, 1,
0.4956362, 1.46611, 1.652884, 1, 1, 1, 1, 1,
0.4964745, -1.513642, 2.079844, 1, 1, 1, 1, 1,
0.4995475, -1.611753, 1.559291, 1, 1, 1, 1, 1,
0.505456, -0.1725802, 0.7821524, 1, 1, 1, 1, 1,
0.5076297, 0.8238384, 1.483679, 1, 1, 1, 1, 1,
0.5131281, 0.8451392, 2.183727, 1, 1, 1, 1, 1,
0.5198999, 0.7593172, -1.608015, 1, 1, 1, 1, 1,
0.5231075, 0.07068843, 2.387244, 1, 1, 1, 1, 1,
0.5235239, 0.9038147, 1.355124, 0, 0, 1, 1, 1,
0.5285745, 1.179503, -0.3739347, 1, 0, 0, 1, 1,
0.5313703, 0.3843266, 1.891469, 1, 0, 0, 1, 1,
0.5374506, -1.694104, 0.9479684, 1, 0, 0, 1, 1,
0.5398159, 0.4301332, 1.860242, 1, 0, 0, 1, 1,
0.5446384, -0.09932278, 1.667854, 1, 0, 0, 1, 1,
0.5451315, 0.4599681, 0.7235896, 0, 0, 0, 1, 1,
0.5475612, -0.9976677, 3.46074, 0, 0, 0, 1, 1,
0.5498557, -0.1331009, 3.506761, 0, 0, 0, 1, 1,
0.5500423, 1.054043, 0.986628, 0, 0, 0, 1, 1,
0.5535641, -0.05911369, 0.3273276, 0, 0, 0, 1, 1,
0.5648415, -1.426312, 2.869841, 0, 0, 0, 1, 1,
0.5660713, 0.15292, -0.01057767, 0, 0, 0, 1, 1,
0.5702276, 0.4105999, 0.9749151, 1, 1, 1, 1, 1,
0.5716501, 0.972427, 0.2058696, 1, 1, 1, 1, 1,
0.5742794, 1.157844, 1.259186, 1, 1, 1, 1, 1,
0.5759299, 0.8392991, -0.666762, 1, 1, 1, 1, 1,
0.5768604, -0.1966982, 1.779635, 1, 1, 1, 1, 1,
0.5768762, -1.458811, 3.695308, 1, 1, 1, 1, 1,
0.5770163, -0.981658, 2.239507, 1, 1, 1, 1, 1,
0.581005, -0.2781814, 2.929498, 1, 1, 1, 1, 1,
0.5819832, 1.121778, 2.90764, 1, 1, 1, 1, 1,
0.5826434, 0.3192117, 1.950087, 1, 1, 1, 1, 1,
0.5829461, 0.4570103, -0.1738732, 1, 1, 1, 1, 1,
0.5884331, 1.183074, 1.456977, 1, 1, 1, 1, 1,
0.5922771, 1.052142, -0.2924126, 1, 1, 1, 1, 1,
0.5957108, -0.4906832, 4.343363, 1, 1, 1, 1, 1,
0.5961156, -0.3850793, 2.956084, 1, 1, 1, 1, 1,
0.5978945, 0.1663399, 0.08101387, 0, 0, 1, 1, 1,
0.6021053, -0.3933948, 3.334939, 1, 0, 0, 1, 1,
0.60376, 0.944791, 0.8774957, 1, 0, 0, 1, 1,
0.6053841, -0.3862788, 1.60463, 1, 0, 0, 1, 1,
0.6075136, 0.165188, 0.8036565, 1, 0, 0, 1, 1,
0.6109352, -0.4512507, 2.169068, 1, 0, 0, 1, 1,
0.6134034, 0.5083749, 0.449548, 0, 0, 0, 1, 1,
0.6137891, -0.3705085, 3.802689, 0, 0, 0, 1, 1,
0.6181123, -1.102658, 2.399426, 0, 0, 0, 1, 1,
0.621547, 0.3429891, -0.4669708, 0, 0, 0, 1, 1,
0.6217486, -1.438644, 4.890528, 0, 0, 0, 1, 1,
0.6233739, 1.410496, 1.961079, 0, 0, 0, 1, 1,
0.6302987, 1.659328, -0.07031588, 0, 0, 0, 1, 1,
0.6319855, -0.4265525, 3.218145, 1, 1, 1, 1, 1,
0.6321897, -1.192453, 4.339034, 1, 1, 1, 1, 1,
0.6376431, 0.9987127, 0.5858355, 1, 1, 1, 1, 1,
0.6382164, -0.210202, 1.521801, 1, 1, 1, 1, 1,
0.6390405, -1.668934, 1.986913, 1, 1, 1, 1, 1,
0.6392836, -0.8430989, 2.315171, 1, 1, 1, 1, 1,
0.639541, -1.683117, 3.100622, 1, 1, 1, 1, 1,
0.6405277, 2.130442, 0.4860932, 1, 1, 1, 1, 1,
0.6443458, 0.208092, 2.264194, 1, 1, 1, 1, 1,
0.6461779, 1.346522, -0.4084596, 1, 1, 1, 1, 1,
0.6488845, -2.912087, 3.524869, 1, 1, 1, 1, 1,
0.6542089, 2.061833, -0.7846863, 1, 1, 1, 1, 1,
0.6558319, 0.758338, 2.092087, 1, 1, 1, 1, 1,
0.6593907, -0.1455798, 1.463392, 1, 1, 1, 1, 1,
0.662671, 2.234956, 0.4511434, 1, 1, 1, 1, 1,
0.6652659, 1.158457, -1.679876, 0, 0, 1, 1, 1,
0.6745554, -0.3681482, 2.543281, 1, 0, 0, 1, 1,
0.6756271, -0.1668515, 1.069991, 1, 0, 0, 1, 1,
0.6763108, -0.9504192, 0.5851057, 1, 0, 0, 1, 1,
0.678507, 1.76915, 0.8481984, 1, 0, 0, 1, 1,
0.6797178, -0.4928349, 2.103131, 1, 0, 0, 1, 1,
0.6856589, -0.1229588, 1.068402, 0, 0, 0, 1, 1,
0.6896834, 0.1932081, 0.6613252, 0, 0, 0, 1, 1,
0.689773, 0.008093975, 1.41588, 0, 0, 0, 1, 1,
0.6906934, -0.308432, 0.4974429, 0, 0, 0, 1, 1,
0.6934854, -1.279476, 1.459447, 0, 0, 0, 1, 1,
0.6939688, 0.5876161, 2.504684, 0, 0, 0, 1, 1,
0.7001155, 0.2512359, -0.7333581, 0, 0, 0, 1, 1,
0.7022927, -0.612076, 2.829493, 1, 1, 1, 1, 1,
0.7033561, 0.4911188, 0.600974, 1, 1, 1, 1, 1,
0.7096465, 0.8696007, 0.849328, 1, 1, 1, 1, 1,
0.7142813, -0.04066271, 2.274535, 1, 1, 1, 1, 1,
0.7207391, -0.7140915, 2.435961, 1, 1, 1, 1, 1,
0.7305672, -1.946735, 2.649023, 1, 1, 1, 1, 1,
0.7390171, -0.2983204, 4.399849, 1, 1, 1, 1, 1,
0.7452137, -0.3409382, 3.588016, 1, 1, 1, 1, 1,
0.7547156, -0.7955256, 1.879802, 1, 1, 1, 1, 1,
0.7572482, 0.3232935, 0.9379042, 1, 1, 1, 1, 1,
0.7608522, -1.382135, 1.976755, 1, 1, 1, 1, 1,
0.7611592, 0.6973529, -0.5493607, 1, 1, 1, 1, 1,
0.765824, -1.106968, 3.662182, 1, 1, 1, 1, 1,
0.7726308, 0.2041344, 2.038017, 1, 1, 1, 1, 1,
0.7739504, -0.2597579, 0.5317565, 1, 1, 1, 1, 1,
0.7742423, -0.5470928, 1.736272, 0, 0, 1, 1, 1,
0.7751356, 0.1752893, 3.849434, 1, 0, 0, 1, 1,
0.778751, 0.627157, -0.02836298, 1, 0, 0, 1, 1,
0.7822803, -0.5245143, 1.350176, 1, 0, 0, 1, 1,
0.7844357, -0.6208066, 2.666713, 1, 0, 0, 1, 1,
0.7854037, -0.9665229, 2.34288, 1, 0, 0, 1, 1,
0.7871753, 1.34097, 1.067077, 0, 0, 0, 1, 1,
0.7898622, 0.3156018, 1.713421, 0, 0, 0, 1, 1,
0.7946432, -0.05473363, 3.249839, 0, 0, 0, 1, 1,
0.8035235, 0.1836896, 1.699196, 0, 0, 0, 1, 1,
0.806041, 0.4295474, 0.1123049, 0, 0, 0, 1, 1,
0.8166977, 1.079674, 1.557023, 0, 0, 0, 1, 1,
0.8182758, -1.361115, 2.323156, 0, 0, 0, 1, 1,
0.8299919, -0.6854038, 4.097703, 1, 1, 1, 1, 1,
0.8316073, -0.100104, 1.050587, 1, 1, 1, 1, 1,
0.8410166, 1.126944, 0.4826517, 1, 1, 1, 1, 1,
0.8450858, -0.3650581, 1.808189, 1, 1, 1, 1, 1,
0.8498832, -0.6442859, 2.61907, 1, 1, 1, 1, 1,
0.850229, -1.380928, 2.107022, 1, 1, 1, 1, 1,
0.8540942, 1.383832, 0.2164065, 1, 1, 1, 1, 1,
0.8546516, 0.09522827, 1.460184, 1, 1, 1, 1, 1,
0.8558146, 0.4513451, 1.251565, 1, 1, 1, 1, 1,
0.8569409, -0.2391338, 0.8667733, 1, 1, 1, 1, 1,
0.8605863, 1.275709, 0.3874703, 1, 1, 1, 1, 1,
0.8687919, 0.1581869, -0.8296906, 1, 1, 1, 1, 1,
0.8695253, 0.07634691, 2.009124, 1, 1, 1, 1, 1,
0.872646, 0.972945, 1.396755, 1, 1, 1, 1, 1,
0.8765522, 0.2482814, 3.871389, 1, 1, 1, 1, 1,
0.8765743, 0.002549737, 1.856307, 0, 0, 1, 1, 1,
0.8850082, 1.542809, 0.2469434, 1, 0, 0, 1, 1,
0.8870577, 0.8572935, 0.7391183, 1, 0, 0, 1, 1,
0.8956665, -0.9633983, 1.69613, 1, 0, 0, 1, 1,
0.8973274, -0.5618421, 2.559387, 1, 0, 0, 1, 1,
0.9014443, -0.6399367, 2.354876, 1, 0, 0, 1, 1,
0.9032648, 0.440073, 0.4341294, 0, 0, 0, 1, 1,
0.9055649, -1.711161, 3.946302, 0, 0, 0, 1, 1,
0.9063672, -1.940116, 3.641697, 0, 0, 0, 1, 1,
0.9115818, -0.2831064, 4.535187, 0, 0, 0, 1, 1,
0.9118606, -0.7018691, 1.460594, 0, 0, 0, 1, 1,
0.9141644, 0.9171467, 1.424185, 0, 0, 0, 1, 1,
0.9204754, -0.5939566, 2.868121, 0, 0, 0, 1, 1,
0.9261187, 0.9541666, 1.770389, 1, 1, 1, 1, 1,
0.9324422, -0.7114929, 2.030053, 1, 1, 1, 1, 1,
0.9358063, 0.5676684, 1.231155, 1, 1, 1, 1, 1,
0.9375002, 0.2736489, 1.828277, 1, 1, 1, 1, 1,
0.937644, 0.8137302, 0.5633166, 1, 1, 1, 1, 1,
0.9385047, 1.049505, 1.667559, 1, 1, 1, 1, 1,
0.9413835, -0.8631153, 1.490364, 1, 1, 1, 1, 1,
0.9496144, 1.897069, -0.04107286, 1, 1, 1, 1, 1,
0.9527525, 0.4179341, 2.036565, 1, 1, 1, 1, 1,
0.9547687, -0.470063, 0.3904649, 1, 1, 1, 1, 1,
0.9612446, -0.160267, 1.244215, 1, 1, 1, 1, 1,
0.9614245, -0.5161757, 1.070941, 1, 1, 1, 1, 1,
0.9616402, 0.4010008, 0.6363985, 1, 1, 1, 1, 1,
0.9637855, -1.194128, 2.453678, 1, 1, 1, 1, 1,
0.9647606, 2.525786, 0.9320604, 1, 1, 1, 1, 1,
0.96604, -0.5155587, 2.314454, 0, 0, 1, 1, 1,
0.9704165, 0.4433612, 1.091034, 1, 0, 0, 1, 1,
0.9769395, -0.6143722, 2.346497, 1, 0, 0, 1, 1,
0.9809325, -0.8142194, 2.104231, 1, 0, 0, 1, 1,
0.9899827, 1.215488, 2.631389, 1, 0, 0, 1, 1,
0.990254, -0.3939603, 2.512878, 1, 0, 0, 1, 1,
0.9925357, -0.09347178, -0.09283066, 0, 0, 0, 1, 1,
0.9930933, -0.199794, 2.603017, 0, 0, 0, 1, 1,
0.9996959, -0.7773979, 4.127971, 0, 0, 0, 1, 1,
1.002034, 0.4299018, 0.6468647, 0, 0, 0, 1, 1,
1.003553, 0.4449246, 1.46887, 0, 0, 0, 1, 1,
1.003622, -2.043843, 3.463858, 0, 0, 0, 1, 1,
1.003932, 0.3299795, 1.369078, 0, 0, 0, 1, 1,
1.005166, -0.351481, 2.523556, 1, 1, 1, 1, 1,
1.008508, 1.299441, 0.8026481, 1, 1, 1, 1, 1,
1.011664, -0.3088494, 0.6805329, 1, 1, 1, 1, 1,
1.018353, -1.400609, 1.600465, 1, 1, 1, 1, 1,
1.020593, 0.6093742, 0.7570386, 1, 1, 1, 1, 1,
1.03003, -1.916919, 3.628619, 1, 1, 1, 1, 1,
1.031804, 0.8158321, 1.63301, 1, 1, 1, 1, 1,
1.031811, -0.5818523, 2.587749, 1, 1, 1, 1, 1,
1.036579, -0.8625419, 3.794937, 1, 1, 1, 1, 1,
1.041421, -1.158891, 2.882738, 1, 1, 1, 1, 1,
1.042369, -1.770722, 2.960692, 1, 1, 1, 1, 1,
1.044828, 0.14708, 0.5977972, 1, 1, 1, 1, 1,
1.053982, 0.5297149, 2.554272, 1, 1, 1, 1, 1,
1.054549, 0.3201735, 0.1422549, 1, 1, 1, 1, 1,
1.055232, 1.425251, -0.8345694, 1, 1, 1, 1, 1,
1.055825, 0.459403, 0.9321656, 0, 0, 1, 1, 1,
1.063663, 1.56727, 0.7269924, 1, 0, 0, 1, 1,
1.065867, -0.03951935, 2.265568, 1, 0, 0, 1, 1,
1.071064, 0.447919, 1.852808, 1, 0, 0, 1, 1,
1.073624, 0.4058957, 0.9633937, 1, 0, 0, 1, 1,
1.099406, 0.08649392, 0.04097904, 1, 0, 0, 1, 1,
1.099962, -0.9004976, 1.752395, 0, 0, 0, 1, 1,
1.102295, 1.557722, -0.5028955, 0, 0, 0, 1, 1,
1.104553, -0.08177505, 2.668667, 0, 0, 0, 1, 1,
1.118528, -0.1199146, 1.277201, 0, 0, 0, 1, 1,
1.125772, 0.1755465, 1.91726, 0, 0, 0, 1, 1,
1.130258, -1.235381, 2.350358, 0, 0, 0, 1, 1,
1.133983, -1.522395, 1.105832, 0, 0, 0, 1, 1,
1.139782, 0.5253195, 1.791582, 1, 1, 1, 1, 1,
1.140013, 0.08724961, -0.692343, 1, 1, 1, 1, 1,
1.147187, 0.3824531, 1.699304, 1, 1, 1, 1, 1,
1.149519, -0.7310999, 2.211124, 1, 1, 1, 1, 1,
1.164895, -1.678844, 3.215008, 1, 1, 1, 1, 1,
1.168551, -0.4434339, 2.000624, 1, 1, 1, 1, 1,
1.175396, 1.294701, 1.763391, 1, 1, 1, 1, 1,
1.177116, 0.69576, 0.09289274, 1, 1, 1, 1, 1,
1.177211, -0.02878588, 2.221393, 1, 1, 1, 1, 1,
1.192534, 0.7490188, -0.4088105, 1, 1, 1, 1, 1,
1.196941, -0.71016, 2.84661, 1, 1, 1, 1, 1,
1.204064, -0.5081671, 1.505689, 1, 1, 1, 1, 1,
1.206655, 0.2257977, 0.965924, 1, 1, 1, 1, 1,
1.218366, -0.3643893, 1.22752, 1, 1, 1, 1, 1,
1.220414, -0.4462769, 4.029275, 1, 1, 1, 1, 1,
1.222931, -1.551864, 3.175188, 0, 0, 1, 1, 1,
1.227533, -0.005496138, 2.239831, 1, 0, 0, 1, 1,
1.228303, 0.6492615, 0.2680981, 1, 0, 0, 1, 1,
1.231287, 1.927074, 1.159639, 1, 0, 0, 1, 1,
1.234445, -0.575165, 1.655603, 1, 0, 0, 1, 1,
1.241828, 0.7351714, 1.130765, 1, 0, 0, 1, 1,
1.243692, 0.8862133, 0.8384448, 0, 0, 0, 1, 1,
1.245172, -1.451647, -0.341087, 0, 0, 0, 1, 1,
1.246369, 0.3856882, 1.480194, 0, 0, 0, 1, 1,
1.252143, 2.353951, 0.9049366, 0, 0, 0, 1, 1,
1.254744, 0.1993836, -0.1774433, 0, 0, 0, 1, 1,
1.26585, 1.09046, 0.7625306, 0, 0, 0, 1, 1,
1.275643, -0.7903975, 3.932309, 0, 0, 0, 1, 1,
1.291701, 0.9714161, 0.4864158, 1, 1, 1, 1, 1,
1.295602, 0.2766701, 1.6261, 1, 1, 1, 1, 1,
1.298624, -0.549832, 3.486116, 1, 1, 1, 1, 1,
1.305571, -0.2545131, 3.579303, 1, 1, 1, 1, 1,
1.3238, -0.04885239, 3.697589, 1, 1, 1, 1, 1,
1.33299, 1.069705, 1.670232, 1, 1, 1, 1, 1,
1.337308, -0.0958851, -0.3801323, 1, 1, 1, 1, 1,
1.33935, -0.5849084, 1.472134, 1, 1, 1, 1, 1,
1.340339, 0.9564195, 0.1276111, 1, 1, 1, 1, 1,
1.347179, -0.9880695, 1.052681, 1, 1, 1, 1, 1,
1.347784, -0.2829998, 1.66599, 1, 1, 1, 1, 1,
1.348356, -0.7647883, 3.468206, 1, 1, 1, 1, 1,
1.360883, 1.252373, 0.5428206, 1, 1, 1, 1, 1,
1.366284, 0.2921843, 0.4842085, 1, 1, 1, 1, 1,
1.366358, -1.85631, 2.570954, 1, 1, 1, 1, 1,
1.371235, 0.6954243, 3.362, 0, 0, 1, 1, 1,
1.374705, -0.6767992, 1.527572, 1, 0, 0, 1, 1,
1.378681, -1.877497, 3.355695, 1, 0, 0, 1, 1,
1.389014, 0.8988382, 1.454147, 1, 0, 0, 1, 1,
1.391655, -1.112351, 2.563849, 1, 0, 0, 1, 1,
1.392075, -1.887967, 2.842804, 1, 0, 0, 1, 1,
1.394448, -0.4884268, 4.240973, 0, 0, 0, 1, 1,
1.396175, 1.200284, 1.273408, 0, 0, 0, 1, 1,
1.406521, 1.172591, 1.17793, 0, 0, 0, 1, 1,
1.406553, 0.4507708, 2.566839, 0, 0, 0, 1, 1,
1.408182, -0.9380082, 2.474901, 0, 0, 0, 1, 1,
1.408356, 0.3734536, 2.969707, 0, 0, 0, 1, 1,
1.40881, -2.289765, 2.093705, 0, 0, 0, 1, 1,
1.415634, 0.2069323, 2.241693, 1, 1, 1, 1, 1,
1.416452, 1.034404, 0.9537706, 1, 1, 1, 1, 1,
1.421718, -0.4815584, 0.8779677, 1, 1, 1, 1, 1,
1.426532, 1.246121, 0.3828667, 1, 1, 1, 1, 1,
1.428164, 0.9367946, 1.287755, 1, 1, 1, 1, 1,
1.429422, -0.3924984, 2.200482, 1, 1, 1, 1, 1,
1.433142, -0.6450177, 2.681347, 1, 1, 1, 1, 1,
1.438486, 0.5672705, -0.7407857, 1, 1, 1, 1, 1,
1.438875, -0.1420167, 1.979771, 1, 1, 1, 1, 1,
1.452417, -0.9902871, 2.445786, 1, 1, 1, 1, 1,
1.464523, 0.6891885, -0.01738328, 1, 1, 1, 1, 1,
1.465728, -1.081421, 2.698572, 1, 1, 1, 1, 1,
1.468068, -2.274366, 2.555584, 1, 1, 1, 1, 1,
1.472565, -0.6687747, 2.720752, 1, 1, 1, 1, 1,
1.484482, -0.3595695, 4.050301, 1, 1, 1, 1, 1,
1.489759, -1.917378, 3.634322, 0, 0, 1, 1, 1,
1.490039, -2.527306, 4.871449, 1, 0, 0, 1, 1,
1.510568, 0.7744052, 0.4289471, 1, 0, 0, 1, 1,
1.514482, -1.085643, 4.10173, 1, 0, 0, 1, 1,
1.516415, 0.9383615, 2.625557, 1, 0, 0, 1, 1,
1.541131, -1.766856, 2.322505, 1, 0, 0, 1, 1,
1.545461, -1.795231, 2.779103, 0, 0, 0, 1, 1,
1.556113, -0.4407769, 4.941361, 0, 0, 0, 1, 1,
1.565094, 0.01020372, 1.052812, 0, 0, 0, 1, 1,
1.595889, -0.5159792, 2.834374, 0, 0, 0, 1, 1,
1.598996, -0.7035772, 3.17817, 0, 0, 0, 1, 1,
1.611074, -1.16434, 1.58532, 0, 0, 0, 1, 1,
1.614732, 0.07295714, 1.182681, 0, 0, 0, 1, 1,
1.618081, -0.1514104, 0.6140376, 1, 1, 1, 1, 1,
1.624543, -0.8825914, 2.818092, 1, 1, 1, 1, 1,
1.636035, -0.2549103, 2.101051, 1, 1, 1, 1, 1,
1.650116, -0.2415452, 0.1031895, 1, 1, 1, 1, 1,
1.683349, 1.886193, 2.199326, 1, 1, 1, 1, 1,
1.685961, 0.809606, -0.1371166, 1, 1, 1, 1, 1,
1.690382, 0.04962113, 1.502641, 1, 1, 1, 1, 1,
1.713188, -1.089738, 2.737316, 1, 1, 1, 1, 1,
1.715724, -1.076955, 0.7928521, 1, 1, 1, 1, 1,
1.722135, 1.175309, 0.9168354, 1, 1, 1, 1, 1,
1.730696, -3.576724, 2.843365, 1, 1, 1, 1, 1,
1.730914, 0.7924124, 1.918916, 1, 1, 1, 1, 1,
1.731087, 1.324828, 1.811943, 1, 1, 1, 1, 1,
1.74423, -0.5687879, 3.516636, 1, 1, 1, 1, 1,
1.74962, -0.61098, 0.6033493, 1, 1, 1, 1, 1,
1.762261, -0.5097048, 1.823807, 0, 0, 1, 1, 1,
1.773438, -0.3508861, 2.65106, 1, 0, 0, 1, 1,
1.775456, -0.3974654, 3.053307, 1, 0, 0, 1, 1,
1.788527, 0.3459057, -0.4646783, 1, 0, 0, 1, 1,
1.799803, 1.045668, 2.910756, 1, 0, 0, 1, 1,
1.808389, 1.486455, 0.8882787, 1, 0, 0, 1, 1,
1.812737, -1.969417, 2.952836, 0, 0, 0, 1, 1,
1.813846, 0.8189784, 1.765351, 0, 0, 0, 1, 1,
1.830179, 0.2832707, 1.271721, 0, 0, 0, 1, 1,
1.835519, -0.6952298, 2.313555, 0, 0, 0, 1, 1,
1.858943, 0.7894891, 1.208405, 0, 0, 0, 1, 1,
1.893741, -1.26899, 3.448565, 0, 0, 0, 1, 1,
1.894719, 2.039127, 1.331607, 0, 0, 0, 1, 1,
1.906733, 0.1822456, 1.529513, 1, 1, 1, 1, 1,
1.923807, -0.05146943, 0.3346146, 1, 1, 1, 1, 1,
1.9265, -0.4688104, 1.409782, 1, 1, 1, 1, 1,
1.930131, -1.067894, 2.567579, 1, 1, 1, 1, 1,
1.941182, -0.3681076, 2.593255, 1, 1, 1, 1, 1,
1.945956, 1.718621, -0.1201166, 1, 1, 1, 1, 1,
1.949532, -0.3640833, 2.694899, 1, 1, 1, 1, 1,
1.999019, -2.242128, 0.9624441, 1, 1, 1, 1, 1,
2.018035, -1.287066, -0.9153126, 1, 1, 1, 1, 1,
2.02354, 0.6656014, 1.089959, 1, 1, 1, 1, 1,
2.02842, 0.7394814, 2.665335, 1, 1, 1, 1, 1,
2.072021, 0.1804079, 1.263, 1, 1, 1, 1, 1,
2.139858, 0.9377522, 1.277019, 1, 1, 1, 1, 1,
2.144452, 0.1315763, 1.497672, 1, 1, 1, 1, 1,
2.148818, 0.5109912, 2.146866, 1, 1, 1, 1, 1,
2.174665, -0.105277, 2.714163, 0, 0, 1, 1, 1,
2.187971, 0.7478673, 1.19744, 1, 0, 0, 1, 1,
2.314183, 1.980546, -0.08685135, 1, 0, 0, 1, 1,
2.320238, 1.539632, 1.949983, 1, 0, 0, 1, 1,
2.359304, -1.974833, 1.769205, 1, 0, 0, 1, 1,
2.382738, -0.5845698, 3.387003, 1, 0, 0, 1, 1,
2.406307, 0.2072705, 2.211771, 0, 0, 0, 1, 1,
2.448438, -1.60758, 2.267483, 0, 0, 0, 1, 1,
2.49691, -1.490595, 2.082429, 0, 0, 0, 1, 1,
2.525437, -0.9052028, 1.839942, 0, 0, 0, 1, 1,
2.592956, -0.02935246, 0.4694368, 0, 0, 0, 1, 1,
2.671997, 0.5145999, 2.357276, 0, 0, 0, 1, 1,
2.685099, 0.1655962, 2.140731, 0, 0, 0, 1, 1,
2.706228, 1.868012, 1.029106, 1, 1, 1, 1, 1,
2.828123, -1.122095, 2.302601, 1, 1, 1, 1, 1,
2.838549, 0.442733, 1.383813, 1, 1, 1, 1, 1,
2.891313, 0.6987822, 0.8050563, 1, 1, 1, 1, 1,
2.945861, 1.124695, 0.9806919, 1, 1, 1, 1, 1,
3.366181, -1.17732, 0.5624816, 1, 1, 1, 1, 1,
3.607425, -1.377174, 1.666954, 1, 1, 1, 1, 1
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
var radius = 9.802643;
var distance = 34.43137;
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
mvMatrix.translate( 0.1449103, 0.4690037, 0.3797667 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.43137);
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
