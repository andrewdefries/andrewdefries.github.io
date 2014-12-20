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
-3.373552, 1.019568, -2.867159, 1, 0, 0, 1,
-3.357029, -2.015798, -3.080486, 1, 0.007843138, 0, 1,
-2.967537, 0.1247507, -1.892543, 1, 0.01176471, 0, 1,
-2.762367, -0.3766281, -1.237496, 1, 0.01960784, 0, 1,
-2.528191, 1.03806, -1.678218, 1, 0.02352941, 0, 1,
-2.408889, 0.2071246, -0.4202732, 1, 0.03137255, 0, 1,
-2.407117, -0.4588276, -2.676201, 1, 0.03529412, 0, 1,
-2.403007, 2.103733, -2.259038, 1, 0.04313726, 0, 1,
-2.374403, 0.05560961, -1.714573, 1, 0.04705882, 0, 1,
-2.371573, -0.1031276, -1.59194, 1, 0.05490196, 0, 1,
-2.368876, -0.1072033, -2.47445, 1, 0.05882353, 0, 1,
-2.358898, 0.008639048, -1.258368, 1, 0.06666667, 0, 1,
-2.344862, -0.9308488, -3.597526, 1, 0.07058824, 0, 1,
-2.303789, -0.457704, -0.7850143, 1, 0.07843138, 0, 1,
-2.294179, 1.572146, -2.388737, 1, 0.08235294, 0, 1,
-2.29075, -0.1670844, -1.994826, 1, 0.09019608, 0, 1,
-2.281375, -0.336464, -1.643201, 1, 0.09411765, 0, 1,
-2.274762, 1.758193, 0.8929605, 1, 0.1019608, 0, 1,
-2.27029, 0.2162267, -1.621351, 1, 0.1098039, 0, 1,
-2.263236, -1.395153, -0.9576781, 1, 0.1137255, 0, 1,
-2.259564, -1.737117, -2.516284, 1, 0.1215686, 0, 1,
-2.214273, 0.2632122, -2.015003, 1, 0.1254902, 0, 1,
-2.160895, -0.6910508, -1.102085, 1, 0.1333333, 0, 1,
-2.127438, -0.5520107, -2.793856, 1, 0.1372549, 0, 1,
-2.122841, 1.93555, -1.090814, 1, 0.145098, 0, 1,
-2.054808, 0.1073469, 0.2860751, 1, 0.1490196, 0, 1,
-2.053255, -0.18238, -1.664207, 1, 0.1568628, 0, 1,
-2.028919, 1.130461, -1.439399, 1, 0.1607843, 0, 1,
-2.017844, 0.4875986, -1.475781, 1, 0.1686275, 0, 1,
-1.979091, -0.7006874, -1.800298, 1, 0.172549, 0, 1,
-1.977937, -1.124244, -1.623382, 1, 0.1803922, 0, 1,
-1.948072, -0.5229061, -2.581117, 1, 0.1843137, 0, 1,
-1.923248, -0.704203, -2.290953, 1, 0.1921569, 0, 1,
-1.916097, -0.8215763, -2.203336, 1, 0.1960784, 0, 1,
-1.900117, -0.707405, -0.1070671, 1, 0.2039216, 0, 1,
-1.898155, 1.989912, 0.04021116, 1, 0.2117647, 0, 1,
-1.879332, 0.2081757, -2.376496, 1, 0.2156863, 0, 1,
-1.876749, -0.6649009, -3.774211, 1, 0.2235294, 0, 1,
-1.858358, 0.2513972, -1.143997, 1, 0.227451, 0, 1,
-1.825084, -1.781433, -2.757539, 1, 0.2352941, 0, 1,
-1.789378, 0.369659, -1.194421, 1, 0.2392157, 0, 1,
-1.782988, 0.009016057, -0.9431529, 1, 0.2470588, 0, 1,
-1.782243, -2.162647, -1.190061, 1, 0.2509804, 0, 1,
-1.778012, -0.4287924, -1.671208, 1, 0.2588235, 0, 1,
-1.737071, -2.783765, -3.048534, 1, 0.2627451, 0, 1,
-1.690991, -2.18072, -0.1795075, 1, 0.2705882, 0, 1,
-1.688225, -0.2528664, -2.349751, 1, 0.2745098, 0, 1,
-1.679696, 0.59547, -1.674725, 1, 0.282353, 0, 1,
-1.673481, 0.09892002, -2.439494, 1, 0.2862745, 0, 1,
-1.670705, -1.31798, -1.513685, 1, 0.2941177, 0, 1,
-1.655093, -0.1338769, -0.7674122, 1, 0.3019608, 0, 1,
-1.648714, 0.7284703, 0.05437212, 1, 0.3058824, 0, 1,
-1.608936, -1.803679, -3.07807, 1, 0.3137255, 0, 1,
-1.608427, 0.2072856, -1.333981, 1, 0.3176471, 0, 1,
-1.598032, 0.6094149, -0.2126308, 1, 0.3254902, 0, 1,
-1.593596, -0.3384818, -0.1816444, 1, 0.3294118, 0, 1,
-1.592613, -0.3605856, -1.53429, 1, 0.3372549, 0, 1,
-1.586499, -1.196066, -1.024155, 1, 0.3411765, 0, 1,
-1.565776, -1.189274, -1.485315, 1, 0.3490196, 0, 1,
-1.556155, 0.8575947, -0.9184546, 1, 0.3529412, 0, 1,
-1.550714, -0.256654, -0.7859311, 1, 0.3607843, 0, 1,
-1.543995, 0.2014744, -1.323541, 1, 0.3647059, 0, 1,
-1.542343, 0.781246, -1.30156, 1, 0.372549, 0, 1,
-1.528407, -0.5271088, -2.517581, 1, 0.3764706, 0, 1,
-1.527162, -0.01102081, 0.200937, 1, 0.3843137, 0, 1,
-1.520757, -1.119968, -0.4586089, 1, 0.3882353, 0, 1,
-1.515624, -1.047348, -1.700979, 1, 0.3960784, 0, 1,
-1.513711, 0.7297057, -1.979584, 1, 0.4039216, 0, 1,
-1.507837, 1.332536, 1.392786, 1, 0.4078431, 0, 1,
-1.504314, 1.56121, -1.719023, 1, 0.4156863, 0, 1,
-1.500136, 0.6799711, -0.80892, 1, 0.4196078, 0, 1,
-1.498085, 0.7672326, -2.014835, 1, 0.427451, 0, 1,
-1.489188, -0.4527965, -2.370862, 1, 0.4313726, 0, 1,
-1.489122, 1.614883, -0.7743806, 1, 0.4392157, 0, 1,
-1.474059, -0.793192, -1.990486, 1, 0.4431373, 0, 1,
-1.470976, -0.9442015, -0.968865, 1, 0.4509804, 0, 1,
-1.465988, -1.2244, -4.604103, 1, 0.454902, 0, 1,
-1.449944, 0.05881042, -0.8943265, 1, 0.4627451, 0, 1,
-1.449915, -0.5167788, -1.182558, 1, 0.4666667, 0, 1,
-1.44921, -0.5214243, -0.1911347, 1, 0.4745098, 0, 1,
-1.446606, -0.01495397, -1.034117, 1, 0.4784314, 0, 1,
-1.443909, 0.6903496, 0.3948084, 1, 0.4862745, 0, 1,
-1.437053, -1.429372, -2.727002, 1, 0.4901961, 0, 1,
-1.432448, 0.06149245, -1.291635, 1, 0.4980392, 0, 1,
-1.405494, -0.5560731, -1.988352, 1, 0.5058824, 0, 1,
-1.383581, 1.338331, -1.109133, 1, 0.509804, 0, 1,
-1.368761, 1.327902, -1.926292, 1, 0.5176471, 0, 1,
-1.36359, 0.535651, -0.8867311, 1, 0.5215687, 0, 1,
-1.343856, 0.1473199, -3.029083, 1, 0.5294118, 0, 1,
-1.342279, -0.09932797, 0.6289168, 1, 0.5333334, 0, 1,
-1.337711, 1.031105, -0.8891484, 1, 0.5411765, 0, 1,
-1.333594, 0.05100626, -1.475472, 1, 0.5450981, 0, 1,
-1.328478, -0.2658827, -2.735666, 1, 0.5529412, 0, 1,
-1.327065, -1.625868, -1.159443, 1, 0.5568628, 0, 1,
-1.32432, 2.385817, -1.410484, 1, 0.5647059, 0, 1,
-1.324101, 0.6339549, -2.468256, 1, 0.5686275, 0, 1,
-1.322568, 1.946678, 0.7314724, 1, 0.5764706, 0, 1,
-1.319875, -0.6112078, -1.920828, 1, 0.5803922, 0, 1,
-1.310196, 0.2223517, -1.902501, 1, 0.5882353, 0, 1,
-1.308242, -0.251251, -1.536091, 1, 0.5921569, 0, 1,
-1.304135, -0.7902743, -2.473783, 1, 0.6, 0, 1,
-1.302472, 2.776385, 0.4468477, 1, 0.6078432, 0, 1,
-1.301816, -0.4053059, -2.867191, 1, 0.6117647, 0, 1,
-1.298363, 1.236012, -2.133335, 1, 0.6196079, 0, 1,
-1.291881, -1.162092, -1.935586, 1, 0.6235294, 0, 1,
-1.286161, 0.8327706, -0.3038647, 1, 0.6313726, 0, 1,
-1.282477, 0.08855702, 0.1649512, 1, 0.6352941, 0, 1,
-1.275934, -1.096396, -1.889371, 1, 0.6431373, 0, 1,
-1.265616, -0.4291591, -2.494242, 1, 0.6470588, 0, 1,
-1.264778, 1.758953, 0.09946176, 1, 0.654902, 0, 1,
-1.257858, -2.313518, -3.35025, 1, 0.6588235, 0, 1,
-1.255683, 1.194362, -0.1925814, 1, 0.6666667, 0, 1,
-1.254416, -0.5809091, -2.213661, 1, 0.6705883, 0, 1,
-1.253405, -0.04873575, 0.05921188, 1, 0.6784314, 0, 1,
-1.243126, -0.6220987, -2.477875, 1, 0.682353, 0, 1,
-1.240381, 1.839184, -0.4511306, 1, 0.6901961, 0, 1,
-1.238745, 1.542734, 0.8091303, 1, 0.6941177, 0, 1,
-1.238401, 0.4890254, -1.5834, 1, 0.7019608, 0, 1,
-1.232354, -0.1193041, -0.7594804, 1, 0.7098039, 0, 1,
-1.229864, -0.08737229, -1.978101, 1, 0.7137255, 0, 1,
-1.189581, -0.07287921, -1.259643, 1, 0.7215686, 0, 1,
-1.184348, 0.6308618, -1.434534, 1, 0.7254902, 0, 1,
-1.183048, 0.1518328, -1.482474, 1, 0.7333333, 0, 1,
-1.182336, -0.7341431, -1.419944, 1, 0.7372549, 0, 1,
-1.174411, -1.699836, -3.276706, 1, 0.7450981, 0, 1,
-1.169099, -0.7665639, -1.467702, 1, 0.7490196, 0, 1,
-1.169057, 1.190054, 0.1202489, 1, 0.7568628, 0, 1,
-1.168425, 1.000863, -1.376856, 1, 0.7607843, 0, 1,
-1.166726, -0.4200381, -2.418828, 1, 0.7686275, 0, 1,
-1.159382, -0.1380611, -1.961664, 1, 0.772549, 0, 1,
-1.149066, -0.2954107, -3.940727, 1, 0.7803922, 0, 1,
-1.147868, 0.3693548, -1.052062, 1, 0.7843137, 0, 1,
-1.141025, -0.8856842, -1.974751, 1, 0.7921569, 0, 1,
-1.140753, -1.663219, -2.860587, 1, 0.7960784, 0, 1,
-1.139533, 0.3511027, -1.719212, 1, 0.8039216, 0, 1,
-1.137051, 0.2311714, -0.5961993, 1, 0.8117647, 0, 1,
-1.134602, -1.794183, -1.924343, 1, 0.8156863, 0, 1,
-1.132427, 0.8888147, -0.4672778, 1, 0.8235294, 0, 1,
-1.132365, 1.086307, -0.331354, 1, 0.827451, 0, 1,
-1.11734, 1.101411, -1.662031, 1, 0.8352941, 0, 1,
-1.106648, 0.2181139, -1.424775, 1, 0.8392157, 0, 1,
-1.105512, -0.5738986, -1.930518, 1, 0.8470588, 0, 1,
-1.097027, -0.5503592, -2.060828, 1, 0.8509804, 0, 1,
-1.096728, -0.6827372, -3.238258, 1, 0.8588235, 0, 1,
-1.086565, -2.088426, -2.388125, 1, 0.8627451, 0, 1,
-1.08608, 1.692181, 1.472838, 1, 0.8705882, 0, 1,
-1.084881, 1.214925, 0.4724114, 1, 0.8745098, 0, 1,
-1.08287, -1.322004, -1.107517, 1, 0.8823529, 0, 1,
-1.078113, -0.1180703, -1.230695, 1, 0.8862745, 0, 1,
-1.077141, 0.1533407, 0.006696061, 1, 0.8941177, 0, 1,
-1.074157, -0.5059661, -2.92571, 1, 0.8980392, 0, 1,
-1.074146, -0.5274197, -2.796203, 1, 0.9058824, 0, 1,
-1.072433, -0.7222534, -2.616239, 1, 0.9137255, 0, 1,
-1.067456, -0.6249205, -2.609478, 1, 0.9176471, 0, 1,
-1.062534, 0.2475323, -0.279218, 1, 0.9254902, 0, 1,
-1.054536, 1.880066, -1.462052, 1, 0.9294118, 0, 1,
-1.054228, -0.520078, -2.6458, 1, 0.9372549, 0, 1,
-1.053021, -1.152923, -1.46655, 1, 0.9411765, 0, 1,
-1.040283, -1.358352, -1.904359, 1, 0.9490196, 0, 1,
-1.038812, -0.4317127, -0.8365877, 1, 0.9529412, 0, 1,
-1.027614, 0.4968143, -0.452054, 1, 0.9607843, 0, 1,
-1.026647, -0.3540508, -3.094917, 1, 0.9647059, 0, 1,
-1.025346, -0.6039569, -1.038257, 1, 0.972549, 0, 1,
-1.020776, -0.6991323, -2.691088, 1, 0.9764706, 0, 1,
-1.018893, -0.1561131, -1.430693, 1, 0.9843137, 0, 1,
-1.000533, 1.073432, -1.415684, 1, 0.9882353, 0, 1,
-0.9984845, 0.3722472, -1.316149, 1, 0.9960784, 0, 1,
-0.9982861, -0.5895282, -1.173245, 0.9960784, 1, 0, 1,
-0.9928156, 0.9405537, -0.4256194, 0.9921569, 1, 0, 1,
-0.9911166, -0.6909357, -1.84645, 0.9843137, 1, 0, 1,
-0.9876285, -0.1451514, -1.556952, 0.9803922, 1, 0, 1,
-0.9843958, -0.8256143, -4.310268, 0.972549, 1, 0, 1,
-0.9834817, -1.249446, -1.341381, 0.9686275, 1, 0, 1,
-0.9829272, -0.1614718, -1.715588, 0.9607843, 1, 0, 1,
-0.977823, -0.01631674, -1.711918, 0.9568627, 1, 0, 1,
-0.9773912, -0.2323181, -2.196561, 0.9490196, 1, 0, 1,
-0.9743467, 0.5430772, -2.772925, 0.945098, 1, 0, 1,
-0.9714982, 1.708702, -1.735124, 0.9372549, 1, 0, 1,
-0.9563705, 0.706311, -0.6761839, 0.9333333, 1, 0, 1,
-0.9518136, 0.5393162, -0.601847, 0.9254902, 1, 0, 1,
-0.9429042, 0.7644971, -0.9751405, 0.9215686, 1, 0, 1,
-0.9311616, -0.7090147, -0.5752301, 0.9137255, 1, 0, 1,
-0.9247858, 0.6947003, -1.108889, 0.9098039, 1, 0, 1,
-0.9211832, -0.2179449, -2.838293, 0.9019608, 1, 0, 1,
-0.9181384, -0.2259862, -1.606978, 0.8941177, 1, 0, 1,
-0.9159092, 0.2080672, -1.053593, 0.8901961, 1, 0, 1,
-0.9135563, -1.019811, -1.300864, 0.8823529, 1, 0, 1,
-0.9126858, -0.8399162, -0.8675835, 0.8784314, 1, 0, 1,
-0.9122919, 0.5373265, -0.5611629, 0.8705882, 1, 0, 1,
-0.9082707, 1.722754, 0.3390965, 0.8666667, 1, 0, 1,
-0.9076754, 0.5659764, -1.472817, 0.8588235, 1, 0, 1,
-0.9052879, 0.1914817, -1.020714, 0.854902, 1, 0, 1,
-0.9048513, 0.08217923, 0.05120317, 0.8470588, 1, 0, 1,
-0.9039866, 0.7078971, -0.4289885, 0.8431373, 1, 0, 1,
-0.9037488, -0.735393, -1.411482, 0.8352941, 1, 0, 1,
-0.9008857, 0.03211152, -1.504523, 0.8313726, 1, 0, 1,
-0.8996025, 1.329389, -1.031962, 0.8235294, 1, 0, 1,
-0.8985204, -0.03291971, -1.204144, 0.8196079, 1, 0, 1,
-0.8968824, -0.3825017, -1.369697, 0.8117647, 1, 0, 1,
-0.8968338, 1.325486, 0.3143226, 0.8078431, 1, 0, 1,
-0.8952271, -0.1971783, -1.180024, 0.8, 1, 0, 1,
-0.8905945, -0.09286749, -1.93643, 0.7921569, 1, 0, 1,
-0.8833857, 1.215126, -0.2428103, 0.7882353, 1, 0, 1,
-0.8828048, 0.9559488, -1.970562, 0.7803922, 1, 0, 1,
-0.8823308, -0.8995182, -2.061985, 0.7764706, 1, 0, 1,
-0.8707786, 0.7452759, -0.2490986, 0.7686275, 1, 0, 1,
-0.8698217, 0.5166356, -3.174982, 0.7647059, 1, 0, 1,
-0.8581232, -0.1037328, -1.299169, 0.7568628, 1, 0, 1,
-0.8555448, -1.5005, -1.149903, 0.7529412, 1, 0, 1,
-0.8545521, -0.7126651, -1.387628, 0.7450981, 1, 0, 1,
-0.8520115, 1.124107, 0.2270437, 0.7411765, 1, 0, 1,
-0.8476898, -1.167088, -2.163975, 0.7333333, 1, 0, 1,
-0.8449247, 0.7661621, 0.579028, 0.7294118, 1, 0, 1,
-0.8409913, 0.5105988, -1.76096, 0.7215686, 1, 0, 1,
-0.8388306, -1.322517, -0.2171555, 0.7176471, 1, 0, 1,
-0.8374628, -0.6304929, -1.533212, 0.7098039, 1, 0, 1,
-0.8349242, 0.7335598, -0.6383911, 0.7058824, 1, 0, 1,
-0.8200506, 0.0551805, -1.373986, 0.6980392, 1, 0, 1,
-0.81984, -0.1314476, -0.4799027, 0.6901961, 1, 0, 1,
-0.8113459, 1.993603, -0.1164197, 0.6862745, 1, 0, 1,
-0.8045764, 0.4849031, -2.148304, 0.6784314, 1, 0, 1,
-0.8008299, 0.4930178, -0.604291, 0.6745098, 1, 0, 1,
-0.7981071, 0.124972, -1.884772, 0.6666667, 1, 0, 1,
-0.7949031, -1.116614, -0.6242214, 0.6627451, 1, 0, 1,
-0.7946762, 0.0908104, -1.948538, 0.654902, 1, 0, 1,
-0.794095, -0.4775392, -2.05376, 0.6509804, 1, 0, 1,
-0.7934048, -1.247224, -3.393994, 0.6431373, 1, 0, 1,
-0.7922879, -0.06740364, 0.3114109, 0.6392157, 1, 0, 1,
-0.7860734, -1.596462, -2.553192, 0.6313726, 1, 0, 1,
-0.7813832, -1.657756, -3.165056, 0.627451, 1, 0, 1,
-0.779061, -0.02716614, -2.091051, 0.6196079, 1, 0, 1,
-0.7719309, -1.266996, -3.023595, 0.6156863, 1, 0, 1,
-0.7659947, -1.095065, -2.114075, 0.6078432, 1, 0, 1,
-0.7583965, 0.02718648, -0.560879, 0.6039216, 1, 0, 1,
-0.755748, 2.074974, 0.9592493, 0.5960785, 1, 0, 1,
-0.7537814, 0.1401328, -0.2911576, 0.5882353, 1, 0, 1,
-0.7533665, -0.4713723, -1.542806, 0.5843138, 1, 0, 1,
-0.7532588, -1.499372, -0.3483805, 0.5764706, 1, 0, 1,
-0.7516278, -0.633698, -2.841133, 0.572549, 1, 0, 1,
-0.7505311, -0.633222, -3.131082, 0.5647059, 1, 0, 1,
-0.7467026, 1.235911, -0.1067875, 0.5607843, 1, 0, 1,
-0.7449103, -1.23767, -1.612702, 0.5529412, 1, 0, 1,
-0.738609, -1.10035, -1.800221, 0.5490196, 1, 0, 1,
-0.7378462, 0.5978493, -0.3423004, 0.5411765, 1, 0, 1,
-0.7372901, -0.7061504, -2.563147, 0.5372549, 1, 0, 1,
-0.7360625, 0.6867275, -0.8706335, 0.5294118, 1, 0, 1,
-0.7319608, -0.6210775, -2.282848, 0.5254902, 1, 0, 1,
-0.7255065, -0.4790145, -1.874568, 0.5176471, 1, 0, 1,
-0.725484, 0.4055734, -0.5571133, 0.5137255, 1, 0, 1,
-0.7253499, 2.28905, 0.3553242, 0.5058824, 1, 0, 1,
-0.7247995, 0.5926641, -2.255467, 0.5019608, 1, 0, 1,
-0.720566, 0.980489, -0.7574197, 0.4941176, 1, 0, 1,
-0.7158801, -0.909326, -2.669848, 0.4862745, 1, 0, 1,
-0.7088734, -2.61399, -2.6156, 0.4823529, 1, 0, 1,
-0.7077237, -0.5625331, -1.98717, 0.4745098, 1, 0, 1,
-0.7067152, 0.6475806, -0.118649, 0.4705882, 1, 0, 1,
-0.706212, 0.5130218, -0.9919548, 0.4627451, 1, 0, 1,
-0.7027584, 1.621349, 0.7981253, 0.4588235, 1, 0, 1,
-0.701162, 0.4115209, -1.030823, 0.4509804, 1, 0, 1,
-0.700917, 0.09706649, -0.881824, 0.4470588, 1, 0, 1,
-0.7003492, -0.5521354, -1.421687, 0.4392157, 1, 0, 1,
-0.6982321, 0.2963128, -0.7145347, 0.4352941, 1, 0, 1,
-0.6962537, -0.5692276, -3.282151, 0.427451, 1, 0, 1,
-0.6888771, 0.08356785, -1.069661, 0.4235294, 1, 0, 1,
-0.6754996, 0.6397289, -2.302649, 0.4156863, 1, 0, 1,
-0.6724644, -1.277569, -2.735624, 0.4117647, 1, 0, 1,
-0.6674829, 1.325157, 0.8484532, 0.4039216, 1, 0, 1,
-0.6672138, 0.47236, -0.7714231, 0.3960784, 1, 0, 1,
-0.6613539, -1.851189, -4.16964, 0.3921569, 1, 0, 1,
-0.6597489, -0.6398917, -2.799852, 0.3843137, 1, 0, 1,
-0.6571823, -1.078347, -2.512824, 0.3803922, 1, 0, 1,
-0.6505583, -0.6309373, -2.20125, 0.372549, 1, 0, 1,
-0.6487364, 0.09691342, -2.804581, 0.3686275, 1, 0, 1,
-0.6430922, -1.114078, -1.219291, 0.3607843, 1, 0, 1,
-0.6424946, 0.07231618, -1.739972, 0.3568628, 1, 0, 1,
-0.6414868, -0.3176788, -0.6643866, 0.3490196, 1, 0, 1,
-0.6379027, 1.954496, -0.8356184, 0.345098, 1, 0, 1,
-0.6339691, 1.067138, 0.7571082, 0.3372549, 1, 0, 1,
-0.6263385, 0.3580911, -2.766679, 0.3333333, 1, 0, 1,
-0.6220497, -1.096007, -2.245542, 0.3254902, 1, 0, 1,
-0.6220167, -0.1754911, -3.011133, 0.3215686, 1, 0, 1,
-0.6149249, 0.7272122, -0.7486357, 0.3137255, 1, 0, 1,
-0.6138985, -0.3810361, -2.509777, 0.3098039, 1, 0, 1,
-0.6127185, 0.4517826, 0.4281039, 0.3019608, 1, 0, 1,
-0.6085345, 0.3107477, -0.7797561, 0.2941177, 1, 0, 1,
-0.593168, -0.4914649, -2.875094, 0.2901961, 1, 0, 1,
-0.5924622, 0.2821669, -0.3230703, 0.282353, 1, 0, 1,
-0.5857092, -0.6875269, -3.283926, 0.2784314, 1, 0, 1,
-0.5851634, -0.8636368, -2.618243, 0.2705882, 1, 0, 1,
-0.5843676, -0.273232, -1.851913, 0.2666667, 1, 0, 1,
-0.5793601, -0.186309, -3.278412, 0.2588235, 1, 0, 1,
-0.573904, 0.6928226, -2.557476, 0.254902, 1, 0, 1,
-0.5639592, 0.08162443, -1.875391, 0.2470588, 1, 0, 1,
-0.5638806, -1.038191, -1.579728, 0.2431373, 1, 0, 1,
-0.5597273, -0.2295066, -1.654096, 0.2352941, 1, 0, 1,
-0.5570377, 0.1381706, -1.733327, 0.2313726, 1, 0, 1,
-0.5567595, 1.589308, -0.5367385, 0.2235294, 1, 0, 1,
-0.5515109, -0.3553536, -2.581051, 0.2196078, 1, 0, 1,
-0.5500262, -1.738394, -4.997739, 0.2117647, 1, 0, 1,
-0.540308, -0.2160242, -2.49491, 0.2078431, 1, 0, 1,
-0.5398582, 1.633658, 0.5307512, 0.2, 1, 0, 1,
-0.5385706, 0.1048751, -1.192527, 0.1921569, 1, 0, 1,
-0.537981, -0.2063932, -4.027863, 0.1882353, 1, 0, 1,
-0.5349578, 0.6531176, -1.804077, 0.1803922, 1, 0, 1,
-0.5333826, 1.367528, 1.05941, 0.1764706, 1, 0, 1,
-0.5328215, 0.3470329, -0.2987592, 0.1686275, 1, 0, 1,
-0.5327366, -0.2679936, -2.264198, 0.1647059, 1, 0, 1,
-0.5266443, -1.206239, -2.452982, 0.1568628, 1, 0, 1,
-0.5180099, 0.1957581, -3.123584, 0.1529412, 1, 0, 1,
-0.5168273, -0.3297917, -2.700516, 0.145098, 1, 0, 1,
-0.5148242, -0.7728202, -3.387357, 0.1411765, 1, 0, 1,
-0.5126997, 0.329198, -1.917221, 0.1333333, 1, 0, 1,
-0.5115189, 0.298974, -2.823175, 0.1294118, 1, 0, 1,
-0.5062404, -0.05189004, -2.332788, 0.1215686, 1, 0, 1,
-0.5050325, -1.258882, -2.778146, 0.1176471, 1, 0, 1,
-0.5041022, -1.151312, -3.286327, 0.1098039, 1, 0, 1,
-0.5035167, -0.5700294, -2.929952, 0.1058824, 1, 0, 1,
-0.503267, -0.9107956, -2.391696, 0.09803922, 1, 0, 1,
-0.5000705, 1.119183, 0.2318697, 0.09019608, 1, 0, 1,
-0.4969255, 0.3880908, -1.452889, 0.08627451, 1, 0, 1,
-0.4966713, 0.3857267, -0.1888497, 0.07843138, 1, 0, 1,
-0.4944376, -2.189533, -4.69277, 0.07450981, 1, 0, 1,
-0.4940733, 0.577141, 1.012871, 0.06666667, 1, 0, 1,
-0.4868045, -0.4510586, -0.9142962, 0.0627451, 1, 0, 1,
-0.4852371, -1.397806, -2.088466, 0.05490196, 1, 0, 1,
-0.4831305, 1.288031, -1.377829, 0.05098039, 1, 0, 1,
-0.4830292, 0.1532072, -2.115474, 0.04313726, 1, 0, 1,
-0.4812958, -0.8182331, -2.298279, 0.03921569, 1, 0, 1,
-0.4800949, -0.3447073, -1.193337, 0.03137255, 1, 0, 1,
-0.4799291, 0.2191833, -1.926677, 0.02745098, 1, 0, 1,
-0.4795064, 2.360347, -1.325923, 0.01960784, 1, 0, 1,
-0.479054, -0.3673941, -2.477725, 0.01568628, 1, 0, 1,
-0.4764133, 0.6126891, -0.1965033, 0.007843138, 1, 0, 1,
-0.4755018, -1.767187, -4.870107, 0.003921569, 1, 0, 1,
-0.475346, -0.9564115, -2.207554, 0, 1, 0.003921569, 1,
-0.4751266, 1.089199, -0.7275247, 0, 1, 0.01176471, 1,
-0.4751012, 2.097187, -0.5163036, 0, 1, 0.01568628, 1,
-0.4720359, 0.5640438, -0.1490099, 0, 1, 0.02352941, 1,
-0.4711555, 1.025014, 1.179549, 0, 1, 0.02745098, 1,
-0.4698953, -1.35325, -2.145368, 0, 1, 0.03529412, 1,
-0.4650605, -1.762818, -2.327283, 0, 1, 0.03921569, 1,
-0.463179, 0.8266116, -1.340252, 0, 1, 0.04705882, 1,
-0.4595889, -0.3913888, -2.9562, 0, 1, 0.05098039, 1,
-0.4482327, -1.346178, -3.404562, 0, 1, 0.05882353, 1,
-0.4478374, 0.2172959, -1.238254, 0, 1, 0.0627451, 1,
-0.4461435, 0.8888708, -1.250422, 0, 1, 0.07058824, 1,
-0.4458918, 0.2387244, -1.667958, 0, 1, 0.07450981, 1,
-0.4440911, -1.518916, -4.440169, 0, 1, 0.08235294, 1,
-0.4388112, 0.2086587, -0.6801425, 0, 1, 0.08627451, 1,
-0.4362286, 0.173062, -0.3114924, 0, 1, 0.09411765, 1,
-0.4280566, 2.076436, -0.142506, 0, 1, 0.1019608, 1,
-0.4187315, 0.6439629, -0.989876, 0, 1, 0.1058824, 1,
-0.4119973, -0.4082707, -3.070272, 0, 1, 0.1137255, 1,
-0.4111746, -1.324448, -2.853276, 0, 1, 0.1176471, 1,
-0.4099442, -0.4861214, -3.29847, 0, 1, 0.1254902, 1,
-0.4048789, 0.9804537, 0.0182447, 0, 1, 0.1294118, 1,
-0.4048319, -0.8549236, -4.861116, 0, 1, 0.1372549, 1,
-0.4039199, 0.369298, 0.5073792, 0, 1, 0.1411765, 1,
-0.4037994, 1.221956, -0.0007619857, 0, 1, 0.1490196, 1,
-0.4031088, 0.1320175, -2.096595, 0, 1, 0.1529412, 1,
-0.4023179, 1.009374, -1.467341, 0, 1, 0.1607843, 1,
-0.401743, -0.1226695, -1.445611, 0, 1, 0.1647059, 1,
-0.4000093, -0.4969796, -1.589042, 0, 1, 0.172549, 1,
-0.3963346, -0.7496006, -1.920971, 0, 1, 0.1764706, 1,
-0.3961409, 0.7660435, 1.119534, 0, 1, 0.1843137, 1,
-0.3947909, 0.3976977, -1.431664, 0, 1, 0.1882353, 1,
-0.391997, -0.9005494, -2.496533, 0, 1, 0.1960784, 1,
-0.3906148, -0.9604657, -2.22333, 0, 1, 0.2039216, 1,
-0.3867649, 0.9575382, -0.4537352, 0, 1, 0.2078431, 1,
-0.3790226, 1.321271, 0.3241937, 0, 1, 0.2156863, 1,
-0.3677948, 0.7052341, -1.278214, 0, 1, 0.2196078, 1,
-0.3610251, -0.05093844, -0.6200922, 0, 1, 0.227451, 1,
-0.3601897, 0.5497258, -0.2038402, 0, 1, 0.2313726, 1,
-0.3584135, -0.1417381, -1.62207, 0, 1, 0.2392157, 1,
-0.3562112, -0.2760912, -1.15014, 0, 1, 0.2431373, 1,
-0.3515744, -1.078814, -1.39536, 0, 1, 0.2509804, 1,
-0.3502398, 0.006149142, -1.822561, 0, 1, 0.254902, 1,
-0.3449343, -1.286336, -2.302753, 0, 1, 0.2627451, 1,
-0.3444886, 0.9660311, -0.8290746, 0, 1, 0.2666667, 1,
-0.3425784, -0.379052, -2.902122, 0, 1, 0.2745098, 1,
-0.340345, -0.4991791, -1.989018, 0, 1, 0.2784314, 1,
-0.3372656, 0.3916399, -0.3769065, 0, 1, 0.2862745, 1,
-0.3359955, 1.604229, -1.291151, 0, 1, 0.2901961, 1,
-0.3349473, -0.07880866, -1.58075, 0, 1, 0.2980392, 1,
-0.3301221, 0.9131523, -0.9038579, 0, 1, 0.3058824, 1,
-0.3294397, 0.8130123, 0.6106697, 0, 1, 0.3098039, 1,
-0.32612, 0.5966892, 2.510875, 0, 1, 0.3176471, 1,
-0.3242903, 0.4205225, -1.785022, 0, 1, 0.3215686, 1,
-0.3220799, 0.8018541, -1.330957, 0, 1, 0.3294118, 1,
-0.32088, 1.456107, 0.8926864, 0, 1, 0.3333333, 1,
-0.3197899, -1.099267, -1.799276, 0, 1, 0.3411765, 1,
-0.3184346, 0.08195883, -2.912059, 0, 1, 0.345098, 1,
-0.3103195, -1.858497, -1.581825, 0, 1, 0.3529412, 1,
-0.3095736, -0.8599616, -2.034489, 0, 1, 0.3568628, 1,
-0.3071658, -0.7427987, -2.588871, 0, 1, 0.3647059, 1,
-0.3066968, -0.7538, -2.932595, 0, 1, 0.3686275, 1,
-0.306553, -1.364517, -0.1678975, 0, 1, 0.3764706, 1,
-0.3048298, -0.3437696, -2.724908, 0, 1, 0.3803922, 1,
-0.3045247, -0.7550315, -3.232442, 0, 1, 0.3882353, 1,
-0.3007378, -0.6683646, -3.899528, 0, 1, 0.3921569, 1,
-0.2983766, -0.01602026, -1.789707, 0, 1, 0.4, 1,
-0.2952472, 0.9693502, 0.797221, 0, 1, 0.4078431, 1,
-0.2832816, -1.064778, -2.471827, 0, 1, 0.4117647, 1,
-0.2819616, 0.3013866, -2.506833, 0, 1, 0.4196078, 1,
-0.2763011, -1.224426, -3.780535, 0, 1, 0.4235294, 1,
-0.2753031, -0.072289, -1.473765, 0, 1, 0.4313726, 1,
-0.27399, -1.064508, -1.579885, 0, 1, 0.4352941, 1,
-0.2739359, -0.4009148, -2.681804, 0, 1, 0.4431373, 1,
-0.2714175, 0.6129659, -0.3652439, 0, 1, 0.4470588, 1,
-0.2664452, -0.1628735, -2.014584, 0, 1, 0.454902, 1,
-0.2640284, -2.153501, -2.810167, 0, 1, 0.4588235, 1,
-0.2632745, 1.343918, -0.982594, 0, 1, 0.4666667, 1,
-0.25996, -0.7589602, -2.797356, 0, 1, 0.4705882, 1,
-0.2565064, -0.9316321, -3.100781, 0, 1, 0.4784314, 1,
-0.2539768, 0.353335, -0.1338933, 0, 1, 0.4823529, 1,
-0.247816, 0.12081, -1.113452, 0, 1, 0.4901961, 1,
-0.2416692, 1.496683, -0.2681627, 0, 1, 0.4941176, 1,
-0.2412985, 0.8374621, -2.170589, 0, 1, 0.5019608, 1,
-0.24059, -0.8640178, -6.119253, 0, 1, 0.509804, 1,
-0.2344132, 0.2777409, 1.424965, 0, 1, 0.5137255, 1,
-0.2329186, -0.2710047, -3.588192, 0, 1, 0.5215687, 1,
-0.2325534, 0.323173, -1.596754, 0, 1, 0.5254902, 1,
-0.226798, -0.1702494, -1.057404, 0, 1, 0.5333334, 1,
-0.2240247, 1.310705, -2.400419, 0, 1, 0.5372549, 1,
-0.2214238, 0.4930989, 0.01275777, 0, 1, 0.5450981, 1,
-0.2207329, 1.0423, 0.09195241, 0, 1, 0.5490196, 1,
-0.2182219, 0.09149224, -0.811972, 0, 1, 0.5568628, 1,
-0.216902, 0.5165448, -1.61122, 0, 1, 0.5607843, 1,
-0.2165698, 0.5840491, -1.729509, 0, 1, 0.5686275, 1,
-0.2162409, -1.113441, -0.9226009, 0, 1, 0.572549, 1,
-0.2140001, -1.704208, -2.758712, 0, 1, 0.5803922, 1,
-0.2139257, 1.501709, 0.4914453, 0, 1, 0.5843138, 1,
-0.2106721, 0.3016692, -0.6341759, 0, 1, 0.5921569, 1,
-0.2073325, -0.1221725, -3.687184, 0, 1, 0.5960785, 1,
-0.2067607, 1.755342, -1.47644, 0, 1, 0.6039216, 1,
-0.2066868, 0.146833, -1.382198, 0, 1, 0.6117647, 1,
-0.203874, -0.227839, -1.110674, 0, 1, 0.6156863, 1,
-0.2021212, -0.9607762, -3.253437, 0, 1, 0.6235294, 1,
-0.2002436, 0.9526731, 0.6721795, 0, 1, 0.627451, 1,
-0.1974365, -0.6104884, -2.57003, 0, 1, 0.6352941, 1,
-0.1971466, -0.6800441, -3.006866, 0, 1, 0.6392157, 1,
-0.1967077, -0.2471102, -1.816659, 0, 1, 0.6470588, 1,
-0.1962614, 0.9744224, -0.3372011, 0, 1, 0.6509804, 1,
-0.1909744, 0.7611609, -0.1944952, 0, 1, 0.6588235, 1,
-0.188464, -0.01096424, -4.721232, 0, 1, 0.6627451, 1,
-0.1806221, 0.6039432, 0.1033733, 0, 1, 0.6705883, 1,
-0.1796438, 0.8459656, -1.815137, 0, 1, 0.6745098, 1,
-0.179497, -0.1975127, -0.8924667, 0, 1, 0.682353, 1,
-0.1755326, -0.02730051, -1.090309, 0, 1, 0.6862745, 1,
-0.1725483, -1.055752, -2.451912, 0, 1, 0.6941177, 1,
-0.1676204, -0.1983273, -2.260978, 0, 1, 0.7019608, 1,
-0.1651153, -1.213706, -4.555734, 0, 1, 0.7058824, 1,
-0.1641494, -1.734046, -2.744822, 0, 1, 0.7137255, 1,
-0.1641165, -1.895842, -3.552644, 0, 1, 0.7176471, 1,
-0.1616777, -1.710102, -2.385138, 0, 1, 0.7254902, 1,
-0.1568184, -1.10912, -3.288613, 0, 1, 0.7294118, 1,
-0.156002, 1.828591, 0.11763, 0, 1, 0.7372549, 1,
-0.1536482, -0.7945916, -3.122322, 0, 1, 0.7411765, 1,
-0.153135, -0.06817929, -2.559329, 0, 1, 0.7490196, 1,
-0.1521164, 0.08941673, -1.869677, 0, 1, 0.7529412, 1,
-0.1481388, 0.4083701, 1.664622, 0, 1, 0.7607843, 1,
-0.1447258, -0.3977245, -3.074929, 0, 1, 0.7647059, 1,
-0.1393974, 0.7020612, -0.8762585, 0, 1, 0.772549, 1,
-0.1357014, -0.3795918, -2.535962, 0, 1, 0.7764706, 1,
-0.1353471, -0.9151409, -2.076668, 0, 1, 0.7843137, 1,
-0.1349439, 0.4079178, -0.418931, 0, 1, 0.7882353, 1,
-0.1334373, 0.4037853, 0.5988779, 0, 1, 0.7960784, 1,
-0.1308537, -0.06959661, -1.63743, 0, 1, 0.8039216, 1,
-0.1275183, -1.328018, -3.478135, 0, 1, 0.8078431, 1,
-0.1266599, 1.50825, -0.1890441, 0, 1, 0.8156863, 1,
-0.1265319, -0.5043322, -3.856933, 0, 1, 0.8196079, 1,
-0.1239771, -1.30177, -3.475326, 0, 1, 0.827451, 1,
-0.1180666, 1.400981, 1.347909, 0, 1, 0.8313726, 1,
-0.1149784, 0.9696288, -1.194741, 0, 1, 0.8392157, 1,
-0.1121305, 0.1377294, -0.7413479, 0, 1, 0.8431373, 1,
-0.1097729, 0.3907175, 0.1607341, 0, 1, 0.8509804, 1,
-0.1051478, -1.722655, -3.582845, 0, 1, 0.854902, 1,
-0.1048612, -0.8334998, -2.599614, 0, 1, 0.8627451, 1,
-0.1022333, 1.092327, 0.5023578, 0, 1, 0.8666667, 1,
-0.1015448, 0.7852514, 0.4113666, 0, 1, 0.8745098, 1,
-0.1012426, -0.2384845, -2.815531, 0, 1, 0.8784314, 1,
-0.09945898, 0.3943608, -2.42844, 0, 1, 0.8862745, 1,
-0.08845145, 2.131591, -0.07634407, 0, 1, 0.8901961, 1,
-0.08638554, -1.329541, -3.808022, 0, 1, 0.8980392, 1,
-0.0851944, -0.7963318, -2.2688, 0, 1, 0.9058824, 1,
-0.08028989, 0.9835675, -0.2977228, 0, 1, 0.9098039, 1,
-0.07961726, 0.5284963, -1.05135, 0, 1, 0.9176471, 1,
-0.07909235, -0.1899625, -1.709964, 0, 1, 0.9215686, 1,
-0.07355945, -0.8599836, -3.28764, 0, 1, 0.9294118, 1,
-0.0733336, -0.654648, -2.796087, 0, 1, 0.9333333, 1,
-0.07138125, 1.24218, 1.365633, 0, 1, 0.9411765, 1,
-0.0713194, -1.104868, -2.156357, 0, 1, 0.945098, 1,
-0.06782073, -1.081057, -3.072526, 0, 1, 0.9529412, 1,
-0.0665425, -0.3924859, -4.514578, 0, 1, 0.9568627, 1,
-0.05928877, 1.009146, -0.2521048, 0, 1, 0.9647059, 1,
-0.05562662, 0.2696382, 0.2277088, 0, 1, 0.9686275, 1,
-0.05410879, 0.6058241, -0.4270476, 0, 1, 0.9764706, 1,
-0.05342512, -0.3989808, -2.022177, 0, 1, 0.9803922, 1,
-0.05318897, -0.458043, -3.209294, 0, 1, 0.9882353, 1,
-0.05124307, 0.159257, 0.5523601, 0, 1, 0.9921569, 1,
-0.04895535, -0.7434164, -2.978665, 0, 1, 1, 1,
-0.040403, 0.04110635, -2.818557, 0, 0.9921569, 1, 1,
-0.0402763, 1.18713, 0.7567574, 0, 0.9882353, 1, 1,
-0.0355304, 0.7196686, -0.5426474, 0, 0.9803922, 1, 1,
-0.0307725, 0.4746454, 0.00816919, 0, 0.9764706, 1, 1,
-0.0233385, -1.255768, -2.28634, 0, 0.9686275, 1, 1,
-0.02226136, -0.1291396, -4.312833, 0, 0.9647059, 1, 1,
-0.02197049, 0.1281551, 0.7180479, 0, 0.9568627, 1, 1,
-0.01927345, -1.442607, -2.407955, 0, 0.9529412, 1, 1,
-0.0177533, 1.874836, 1.952502, 0, 0.945098, 1, 1,
-0.01727628, -0.137284, -4.701809, 0, 0.9411765, 1, 1,
-0.01496997, 0.2952488, -1.802765, 0, 0.9333333, 1, 1,
-0.01431585, 0.2471046, -0.8620777, 0, 0.9294118, 1, 1,
-0.009421152, -0.3930388, -1.088172, 0, 0.9215686, 1, 1,
-0.006415391, 0.545432, 0.0339121, 0, 0.9176471, 1, 1,
-0.005387937, 1.191267, 0.5962519, 0, 0.9098039, 1, 1,
-0.00360043, 1.461909, 0.8220509, 0, 0.9058824, 1, 1,
-0.001678483, 1.064965, 0.139039, 0, 0.8980392, 1, 1,
0.002112853, -1.202817, 5.276243, 0, 0.8901961, 1, 1,
0.0048255, -0.4223782, 3.668731, 0, 0.8862745, 1, 1,
0.006220726, -0.271966, 4.470817, 0, 0.8784314, 1, 1,
0.007764387, -0.660804, 3.748971, 0, 0.8745098, 1, 1,
0.008003964, 1.02318, 0.5004875, 0, 0.8666667, 1, 1,
0.01021962, -2.142719, 2.290477, 0, 0.8627451, 1, 1,
0.01080543, -1.454379, 2.087349, 0, 0.854902, 1, 1,
0.01110542, 0.04538056, 0.4549983, 0, 0.8509804, 1, 1,
0.01116477, -1.120646, 4.832513, 0, 0.8431373, 1, 1,
0.01162313, 1.22036, -1.493017, 0, 0.8392157, 1, 1,
0.0133582, 0.4376094, -0.7619563, 0, 0.8313726, 1, 1,
0.01451244, 0.2491522, 1.637759, 0, 0.827451, 1, 1,
0.01724655, 0.9228014, -0.1235796, 0, 0.8196079, 1, 1,
0.01840547, -0.2197177, 1.575413, 0, 0.8156863, 1, 1,
0.02262978, 0.8261517, -0.467197, 0, 0.8078431, 1, 1,
0.02766362, -0.6797358, 3.241294, 0, 0.8039216, 1, 1,
0.02794278, 0.243093, 0.4418136, 0, 0.7960784, 1, 1,
0.02903169, -0.05328126, 2.626019, 0, 0.7882353, 1, 1,
0.02951841, -0.8031645, 3.264545, 0, 0.7843137, 1, 1,
0.03122119, -0.06571101, 4.907382, 0, 0.7764706, 1, 1,
0.03182497, 0.1868986, 0.7663097, 0, 0.772549, 1, 1,
0.03383933, 0.163553, 0.2425686, 0, 0.7647059, 1, 1,
0.03487795, 1.318589, -2.26195, 0, 0.7607843, 1, 1,
0.03557189, -1.372409, 3.249011, 0, 0.7529412, 1, 1,
0.03800422, -0.1851172, 4.271795, 0, 0.7490196, 1, 1,
0.04078611, -0.9173393, 1.588626, 0, 0.7411765, 1, 1,
0.04743122, 0.461953, -1.113419, 0, 0.7372549, 1, 1,
0.04792329, 0.001944785, 3.327791, 0, 0.7294118, 1, 1,
0.05151139, -1.79277, 1.775274, 0, 0.7254902, 1, 1,
0.05256102, -0.7946534, 2.853425, 0, 0.7176471, 1, 1,
0.05600471, -0.5735538, 2.093742, 0, 0.7137255, 1, 1,
0.05713491, -0.8107721, 2.667693, 0, 0.7058824, 1, 1,
0.06293286, -2.010474, 2.266584, 0, 0.6980392, 1, 1,
0.0671173, 0.6954191, -0.2888151, 0, 0.6941177, 1, 1,
0.06868772, 1.221473, -1.969579, 0, 0.6862745, 1, 1,
0.0706865, 0.9720717, 1.923084, 0, 0.682353, 1, 1,
0.0712214, 0.4940235, 1.783716, 0, 0.6745098, 1, 1,
0.07199933, -1.266256, 3.087437, 0, 0.6705883, 1, 1,
0.07244222, -0.1884653, 3.411445, 0, 0.6627451, 1, 1,
0.07736152, -0.2884003, 0.3661453, 0, 0.6588235, 1, 1,
0.07806307, -0.4794445, 2.97586, 0, 0.6509804, 1, 1,
0.0787109, 0.8438601, -0.7539151, 0, 0.6470588, 1, 1,
0.07984006, -0.2201386, 2.448397, 0, 0.6392157, 1, 1,
0.08109356, -0.1864532, 0.6617837, 0, 0.6352941, 1, 1,
0.08704752, -0.4544526, 4.046454, 0, 0.627451, 1, 1,
0.08710915, 2.034871, 1.643101, 0, 0.6235294, 1, 1,
0.08949795, 1.029845, -0.1795291, 0, 0.6156863, 1, 1,
0.08998965, -1.655635, 3.801584, 0, 0.6117647, 1, 1,
0.09186068, 1.050551, -0.522929, 0, 0.6039216, 1, 1,
0.09232277, 1.19539, 0.1352142, 0, 0.5960785, 1, 1,
0.09288458, 0.5430523, -0.1629044, 0, 0.5921569, 1, 1,
0.09824791, -0.6429275, 2.455024, 0, 0.5843138, 1, 1,
0.1014069, 0.6071832, -1.096028, 0, 0.5803922, 1, 1,
0.1093998, -0.9287011, 3.852881, 0, 0.572549, 1, 1,
0.1113037, -0.7326851, 4.199707, 0, 0.5686275, 1, 1,
0.1121393, -0.8851643, 2.905694, 0, 0.5607843, 1, 1,
0.114012, 0.6489874, 1.113883, 0, 0.5568628, 1, 1,
0.1178965, -0.8681858, 2.282413, 0, 0.5490196, 1, 1,
0.1245198, 0.9309883, 0.8602564, 0, 0.5450981, 1, 1,
0.1305967, 0.1429783, 1.087703, 0, 0.5372549, 1, 1,
0.1324299, 1.568401, -1.63727, 0, 0.5333334, 1, 1,
0.1398312, -1.138785, 3.29759, 0, 0.5254902, 1, 1,
0.1417717, 0.1833428, -0.1585873, 0, 0.5215687, 1, 1,
0.150707, -0.5831276, 3.776191, 0, 0.5137255, 1, 1,
0.1510768, 0.0770813, 2.269889, 0, 0.509804, 1, 1,
0.1534991, -2.40378, 3.803457, 0, 0.5019608, 1, 1,
0.1665144, -0.8597808, 3.131106, 0, 0.4941176, 1, 1,
0.1693044, 1.239391, 0.4056875, 0, 0.4901961, 1, 1,
0.171524, 0.3219959, 0.2882586, 0, 0.4823529, 1, 1,
0.1733329, -0.9713543, 3.47444, 0, 0.4784314, 1, 1,
0.1745571, 0.6362916, 1.188874, 0, 0.4705882, 1, 1,
0.179238, 0.1117022, -0.00138975, 0, 0.4666667, 1, 1,
0.1801679, 0.7636327, 1.095422, 0, 0.4588235, 1, 1,
0.1808753, -0.2310418, 3.150197, 0, 0.454902, 1, 1,
0.1812288, -0.9226164, 1.365559, 0, 0.4470588, 1, 1,
0.182695, -0.1371641, -0.1508872, 0, 0.4431373, 1, 1,
0.1983413, 0.487462, 0.6837846, 0, 0.4352941, 1, 1,
0.1989573, -0.5219457, 4.798153, 0, 0.4313726, 1, 1,
0.2008078, 1.466991, 1.010383, 0, 0.4235294, 1, 1,
0.2059442, -0.2651525, 2.226043, 0, 0.4196078, 1, 1,
0.2082256, -0.2264079, 4.416063, 0, 0.4117647, 1, 1,
0.2095354, -0.624006, 2.636952, 0, 0.4078431, 1, 1,
0.2118721, 1.634365, 0.2872193, 0, 0.4, 1, 1,
0.2127506, -0.3550165, 3.310566, 0, 0.3921569, 1, 1,
0.2157332, 0.1695521, 1.09952, 0, 0.3882353, 1, 1,
0.2169238, -0.6151506, 2.679403, 0, 0.3803922, 1, 1,
0.2186602, -0.3900153, 2.288625, 0, 0.3764706, 1, 1,
0.222605, 0.2868474, 0.8080767, 0, 0.3686275, 1, 1,
0.2250093, -0.7035881, 3.461645, 0, 0.3647059, 1, 1,
0.2260016, -0.7152075, 1.96387, 0, 0.3568628, 1, 1,
0.2268314, 0.154611, 2.593954, 0, 0.3529412, 1, 1,
0.227325, -0.599818, 2.092466, 0, 0.345098, 1, 1,
0.2287405, 0.1139081, 0.9829422, 0, 0.3411765, 1, 1,
0.229171, -0.7895924, 1.42873, 0, 0.3333333, 1, 1,
0.2307817, -0.3631584, 1.2557, 0, 0.3294118, 1, 1,
0.2343385, 0.5785832, 0.3904667, 0, 0.3215686, 1, 1,
0.2360037, -0.3844391, 3.231747, 0, 0.3176471, 1, 1,
0.2374045, -1.170515, 3.100414, 0, 0.3098039, 1, 1,
0.2408294, 1.132426, -0.330384, 0, 0.3058824, 1, 1,
0.2419636, -0.4990807, 2.315528, 0, 0.2980392, 1, 1,
0.2517099, -0.3658512, 2.739616, 0, 0.2901961, 1, 1,
0.251921, -0.1347643, 1.802355, 0, 0.2862745, 1, 1,
0.2544437, -1.095131, 5.461246, 0, 0.2784314, 1, 1,
0.2575707, -2.003593, 3.247076, 0, 0.2745098, 1, 1,
0.2596453, -0.2415576, 0.3640251, 0, 0.2666667, 1, 1,
0.2631083, -0.01433445, 2.208227, 0, 0.2627451, 1, 1,
0.2637857, -1.571769, 3.321445, 0, 0.254902, 1, 1,
0.2676518, 0.4549059, 0.6822059, 0, 0.2509804, 1, 1,
0.2720816, -0.756057, 2.544171, 0, 0.2431373, 1, 1,
0.2739315, -0.3996503, 2.471695, 0, 0.2392157, 1, 1,
0.2748185, 1.064658, -1.630957, 0, 0.2313726, 1, 1,
0.2784968, 0.0722074, 2.031374, 0, 0.227451, 1, 1,
0.2812494, 0.3807967, 0.4933023, 0, 0.2196078, 1, 1,
0.2856199, 0.1918968, 0.9555072, 0, 0.2156863, 1, 1,
0.2878109, 0.7032728, 0.6635389, 0, 0.2078431, 1, 1,
0.2884874, -0.1625863, 2.300977, 0, 0.2039216, 1, 1,
0.2916302, -0.9994686, 3.33076, 0, 0.1960784, 1, 1,
0.2961661, 0.7586081, -0.5354987, 0, 0.1882353, 1, 1,
0.30197, 1.049474, 2.646742, 0, 0.1843137, 1, 1,
0.3047251, 0.2751561, 1.744842, 0, 0.1764706, 1, 1,
0.305625, 0.7271111, 1.599668, 0, 0.172549, 1, 1,
0.3062795, -0.2785104, 1.973939, 0, 0.1647059, 1, 1,
0.3098743, 0.5061696, 1.405597, 0, 0.1607843, 1, 1,
0.3132068, -0.8575256, 4.314433, 0, 0.1529412, 1, 1,
0.3142234, -1.211306, 3.110753, 0, 0.1490196, 1, 1,
0.3150156, 0.7238941, 0.1658202, 0, 0.1411765, 1, 1,
0.3161595, -0.9829432, 3.062838, 0, 0.1372549, 1, 1,
0.3226325, -0.3552166, 2.974887, 0, 0.1294118, 1, 1,
0.3239338, 1.659743, 0.4491423, 0, 0.1254902, 1, 1,
0.3251072, 0.6233005, -0.8417162, 0, 0.1176471, 1, 1,
0.327229, -0.6310082, 1.225665, 0, 0.1137255, 1, 1,
0.3327173, -0.6582156, 2.180512, 0, 0.1058824, 1, 1,
0.334025, -0.2760711, 1.744604, 0, 0.09803922, 1, 1,
0.3355991, -2.30091, 2.90257, 0, 0.09411765, 1, 1,
0.3378495, -1.183264, 3.106423, 0, 0.08627451, 1, 1,
0.3384505, 0.4335087, 0.2218202, 0, 0.08235294, 1, 1,
0.3389197, -0.2727822, 2.068834, 0, 0.07450981, 1, 1,
0.3421699, 0.2810848, -0.1236115, 0, 0.07058824, 1, 1,
0.3466397, 0.1209266, -0.04894007, 0, 0.0627451, 1, 1,
0.3479086, -0.3386013, 2.4602, 0, 0.05882353, 1, 1,
0.3497438, 1.107373, -0.4594301, 0, 0.05098039, 1, 1,
0.3581372, -0.7125843, 2.17195, 0, 0.04705882, 1, 1,
0.358166, -0.4364152, 2.888106, 0, 0.03921569, 1, 1,
0.3589279, 0.277976, 0.0393261, 0, 0.03529412, 1, 1,
0.362208, 0.5608073, 0.4614597, 0, 0.02745098, 1, 1,
0.366976, 0.1074403, 1.334212, 0, 0.02352941, 1, 1,
0.3739032, -0.8849671, 4.982902, 0, 0.01568628, 1, 1,
0.3757406, 1.642748, 2.189038, 0, 0.01176471, 1, 1,
0.3770343, -0.7768138, 3.412348, 0, 0.003921569, 1, 1,
0.3842126, 0.4424267, -0.6066689, 0.003921569, 0, 1, 1,
0.385372, -1.410486, 1.989421, 0.007843138, 0, 1, 1,
0.3879305, 0.633642, -0.5386303, 0.01568628, 0, 1, 1,
0.3927438, -2.431515, 2.013739, 0.01960784, 0, 1, 1,
0.4025521, -0.02911004, 1.991136, 0.02745098, 0, 1, 1,
0.4028939, 0.4688006, 0.5647569, 0.03137255, 0, 1, 1,
0.4105814, -0.6771371, 3.430234, 0.03921569, 0, 1, 1,
0.4159172, 0.3511463, 0.1792741, 0.04313726, 0, 1, 1,
0.4167915, 0.08184181, -0.627697, 0.05098039, 0, 1, 1,
0.4219694, -0.6875091, 3.01754, 0.05490196, 0, 1, 1,
0.4242216, 0.5665808, -1.704291, 0.0627451, 0, 1, 1,
0.4249145, 0.7998552, -0.6329377, 0.06666667, 0, 1, 1,
0.4306136, 0.03459691, 1.683371, 0.07450981, 0, 1, 1,
0.4324473, 0.03919816, 1.820898, 0.07843138, 0, 1, 1,
0.4356327, -1.998575, 4.077929, 0.08627451, 0, 1, 1,
0.4365881, -0.1928086, 2.631576, 0.09019608, 0, 1, 1,
0.438803, 0.2010532, 0.04549215, 0.09803922, 0, 1, 1,
0.4411515, -1.238722, 2.502579, 0.1058824, 0, 1, 1,
0.445287, 1.043632, -1.473818, 0.1098039, 0, 1, 1,
0.4491308, 1.969137, -1.574816, 0.1176471, 0, 1, 1,
0.4495481, 1.035612, 2.022598, 0.1215686, 0, 1, 1,
0.4531268, -1.365825, 4.443839, 0.1294118, 0, 1, 1,
0.4572169, 0.4149719, 0.619009, 0.1333333, 0, 1, 1,
0.4589083, 1.136557, -1.168894, 0.1411765, 0, 1, 1,
0.4599384, 0.1400564, 1.311045, 0.145098, 0, 1, 1,
0.4641905, -0.08817851, 0.6482403, 0.1529412, 0, 1, 1,
0.4675976, 0.09464001, 0.8401579, 0.1568628, 0, 1, 1,
0.4763718, 1.153978, -0.4253023, 0.1647059, 0, 1, 1,
0.4792297, -1.689759, 0.5476015, 0.1686275, 0, 1, 1,
0.4805542, 0.6484266, -0.0891551, 0.1764706, 0, 1, 1,
0.4811476, -0.06357037, 1.751315, 0.1803922, 0, 1, 1,
0.4835483, -0.154967, 1.741965, 0.1882353, 0, 1, 1,
0.4862761, 1.158572, 0.002047466, 0.1921569, 0, 1, 1,
0.4882486, 0.3387073, 0.4972236, 0.2, 0, 1, 1,
0.4898658, -0.6561965, 3.115738, 0.2078431, 0, 1, 1,
0.490418, -0.3419661, 2.177018, 0.2117647, 0, 1, 1,
0.4936375, 0.1562484, 2.024454, 0.2196078, 0, 1, 1,
0.4962195, -0.8149885, 1.778816, 0.2235294, 0, 1, 1,
0.4971797, 0.4301839, 1.155701, 0.2313726, 0, 1, 1,
0.4971802, -0.5771687, 0.8384647, 0.2352941, 0, 1, 1,
0.4972182, 1.600907, -0.6383257, 0.2431373, 0, 1, 1,
0.5008547, -1.18135, 1.268842, 0.2470588, 0, 1, 1,
0.5053797, 0.003678462, 1.390576, 0.254902, 0, 1, 1,
0.5089392, -0.2478354, 1.630826, 0.2588235, 0, 1, 1,
0.5119322, 0.3066787, -1.328598, 0.2666667, 0, 1, 1,
0.5159308, 1.551598, -1.270602, 0.2705882, 0, 1, 1,
0.5332385, 0.8461977, -0.9075431, 0.2784314, 0, 1, 1,
0.5343345, -0.1419544, 1.925221, 0.282353, 0, 1, 1,
0.5464, -0.049991, 0.03096004, 0.2901961, 0, 1, 1,
0.5506845, 0.582449, 0.3935423, 0.2941177, 0, 1, 1,
0.5516053, 0.3589831, 1.140529, 0.3019608, 0, 1, 1,
0.5551995, -0.1713976, 1.607822, 0.3098039, 0, 1, 1,
0.5602272, 0.5599861, 0.1037612, 0.3137255, 0, 1, 1,
0.5622844, 0.49268, 1.966774, 0.3215686, 0, 1, 1,
0.5629459, -0.3953783, 3.913504, 0.3254902, 0, 1, 1,
0.5639909, -0.9390851, 3.14275, 0.3333333, 0, 1, 1,
0.5655943, 0.6047882, 1.848162, 0.3372549, 0, 1, 1,
0.5668087, -0.2903101, 2.195187, 0.345098, 0, 1, 1,
0.5676631, -0.5576541, 1.323081, 0.3490196, 0, 1, 1,
0.5694091, -0.6079063, 3.581256, 0.3568628, 0, 1, 1,
0.5694262, -0.5120261, 3.395304, 0.3607843, 0, 1, 1,
0.5756583, -1.051819, 3.001099, 0.3686275, 0, 1, 1,
0.5822006, 1.68275, 1.7417, 0.372549, 0, 1, 1,
0.5842332, 0.9044477, -0.1365155, 0.3803922, 0, 1, 1,
0.5863252, -1.112335, 1.575963, 0.3843137, 0, 1, 1,
0.587151, -1.074775, 0.9286583, 0.3921569, 0, 1, 1,
0.5955507, 1.141578, -0.8665461, 0.3960784, 0, 1, 1,
0.5979431, -0.1544118, 1.518483, 0.4039216, 0, 1, 1,
0.608102, 0.9578103, 0.2061866, 0.4117647, 0, 1, 1,
0.6110391, 0.8571933, 0.1110109, 0.4156863, 0, 1, 1,
0.611607, -1.416654, 1.786109, 0.4235294, 0, 1, 1,
0.6128991, -1.088895, 3.186891, 0.427451, 0, 1, 1,
0.6166143, -1.862518, 3.18023, 0.4352941, 0, 1, 1,
0.6225243, 0.6659209, 0.2571136, 0.4392157, 0, 1, 1,
0.6259871, -0.5048978, 0.5824093, 0.4470588, 0, 1, 1,
0.6264739, -1.597846, 4.688737, 0.4509804, 0, 1, 1,
0.6278098, 0.8340716, 0.4096264, 0.4588235, 0, 1, 1,
0.6294725, -0.7524408, 2.383511, 0.4627451, 0, 1, 1,
0.6301209, 1.192704, 0.2692984, 0.4705882, 0, 1, 1,
0.6347811, -0.5042052, 1.78058, 0.4745098, 0, 1, 1,
0.6348352, 0.3071228, 0.09062108, 0.4823529, 0, 1, 1,
0.6348703, 0.6335242, 0.5010441, 0.4862745, 0, 1, 1,
0.6361544, 0.4947968, 1.035116, 0.4941176, 0, 1, 1,
0.639809, 2.008026, -0.1927143, 0.5019608, 0, 1, 1,
0.640861, 0.6858867, 0.9274825, 0.5058824, 0, 1, 1,
0.6417913, -0.7646989, 3.170756, 0.5137255, 0, 1, 1,
0.6443639, -1.993716, 4.45968, 0.5176471, 0, 1, 1,
0.6453174, 0.8033753, 1.639336, 0.5254902, 0, 1, 1,
0.650269, -0.1702491, 1.83681, 0.5294118, 0, 1, 1,
0.6519024, -0.03905934, 0.373127, 0.5372549, 0, 1, 1,
0.6531801, 0.1239783, 1.982068, 0.5411765, 0, 1, 1,
0.6589931, -1.535645, 3.86955, 0.5490196, 0, 1, 1,
0.6627436, -0.109574, 1.91269, 0.5529412, 0, 1, 1,
0.6671727, -1.928756, 3.211798, 0.5607843, 0, 1, 1,
0.6688056, 0.1628596, 0.9520525, 0.5647059, 0, 1, 1,
0.6747627, 0.1327925, 1.425918, 0.572549, 0, 1, 1,
0.6767157, 0.01484906, 1.693246, 0.5764706, 0, 1, 1,
0.6768572, 0.4161197, 1.392539, 0.5843138, 0, 1, 1,
0.6815493, 0.7207646, 1.839488, 0.5882353, 0, 1, 1,
0.6829532, 0.2994281, -0.9061259, 0.5960785, 0, 1, 1,
0.6862479, -2.132302, 4.578042, 0.6039216, 0, 1, 1,
0.6971204, -0.774362, 4.005114, 0.6078432, 0, 1, 1,
0.6976191, -0.7836109, 3.768581, 0.6156863, 0, 1, 1,
0.7012644, -0.3581177, 1.426175, 0.6196079, 0, 1, 1,
0.7058403, -0.5623707, 2.908166, 0.627451, 0, 1, 1,
0.7094272, -0.3517812, 2.330623, 0.6313726, 0, 1, 1,
0.7131526, 0.7202055, 1.162856, 0.6392157, 0, 1, 1,
0.7136844, 0.7911643, 1.010266, 0.6431373, 0, 1, 1,
0.7148511, -0.9290902, 3.86182, 0.6509804, 0, 1, 1,
0.7162576, 0.4551446, -0.3055989, 0.654902, 0, 1, 1,
0.7202231, -1.121261, 1.540774, 0.6627451, 0, 1, 1,
0.7221265, -0.3044752, 1.163408, 0.6666667, 0, 1, 1,
0.7241222, -1.087102, 2.023574, 0.6745098, 0, 1, 1,
0.7251598, 0.3014036, 2.330566, 0.6784314, 0, 1, 1,
0.7256927, 2.589242, -0.2201179, 0.6862745, 0, 1, 1,
0.7264846, -1.389209, 2.614186, 0.6901961, 0, 1, 1,
0.7302568, -0.02030788, 4.345539, 0.6980392, 0, 1, 1,
0.7357066, 1.026554, 0.7808893, 0.7058824, 0, 1, 1,
0.7385432, -0.8243164, 1.723333, 0.7098039, 0, 1, 1,
0.7437927, 1.031108, 1.917088, 0.7176471, 0, 1, 1,
0.7439795, 1.069065, 1.941637, 0.7215686, 0, 1, 1,
0.7593634, -0.4607977, 0.8641451, 0.7294118, 0, 1, 1,
0.7597778, 0.3544973, 0.5310909, 0.7333333, 0, 1, 1,
0.7614446, 0.3637675, 0.903137, 0.7411765, 0, 1, 1,
0.7614848, -0.3680163, 1.798218, 0.7450981, 0, 1, 1,
0.7707404, -1.225462, 2.421576, 0.7529412, 0, 1, 1,
0.7750559, 1.076747, 1.0427, 0.7568628, 0, 1, 1,
0.7790919, 0.8240792, 0.9977693, 0.7647059, 0, 1, 1,
0.7826595, -0.9016567, 2.333275, 0.7686275, 0, 1, 1,
0.7861142, -0.8043455, 3.050561, 0.7764706, 0, 1, 1,
0.7896413, 1.248533, 0.3155386, 0.7803922, 0, 1, 1,
0.79576, 0.5065576, 2.638502, 0.7882353, 0, 1, 1,
0.8007519, -0.999484, 3.036158, 0.7921569, 0, 1, 1,
0.8010802, 1.464324, 0.09488471, 0.8, 0, 1, 1,
0.8104929, 2.832576, -1.198262, 0.8078431, 0, 1, 1,
0.8141466, 1.243153, 2.372726, 0.8117647, 0, 1, 1,
0.8220485, -1.453713, 2.352053, 0.8196079, 0, 1, 1,
0.8252185, -0.484524, 1.50601, 0.8235294, 0, 1, 1,
0.8311517, -0.1408845, 2.721275, 0.8313726, 0, 1, 1,
0.8336365, 0.1198623, 0.8173239, 0.8352941, 0, 1, 1,
0.8365273, -0.3142106, 2.494467, 0.8431373, 0, 1, 1,
0.8421203, -0.2836021, 2.422085, 0.8470588, 0, 1, 1,
0.8465645, 0.14456, 0.8871732, 0.854902, 0, 1, 1,
0.8484486, -0.3710852, 2.38271, 0.8588235, 0, 1, 1,
0.8494369, 0.2103499, 0.9389868, 0.8666667, 0, 1, 1,
0.850014, -0.566332, 2.046094, 0.8705882, 0, 1, 1,
0.8698261, -0.2636473, -0.09438999, 0.8784314, 0, 1, 1,
0.872996, -0.4148254, -0.3395453, 0.8823529, 0, 1, 1,
0.8736412, 1.254702, 0.02271912, 0.8901961, 0, 1, 1,
0.8811506, -0.1280448, 0.5100232, 0.8941177, 0, 1, 1,
0.8847516, -0.2948338, 1.118932, 0.9019608, 0, 1, 1,
0.8850075, 1.387252, -0.267618, 0.9098039, 0, 1, 1,
0.8917928, 1.050112, -0.348107, 0.9137255, 0, 1, 1,
0.8948166, 0.8241518, 0.8143411, 0.9215686, 0, 1, 1,
0.8971758, -1.161177, 2.749639, 0.9254902, 0, 1, 1,
0.9029902, 0.8581002, 0.3351442, 0.9333333, 0, 1, 1,
0.9109744, -0.09032726, 1.443882, 0.9372549, 0, 1, 1,
0.9221249, -1.147613, 1.886329, 0.945098, 0, 1, 1,
0.9241948, 1.69456, -0.7082673, 0.9490196, 0, 1, 1,
0.9248436, 0.6141233, -0.02968678, 0.9568627, 0, 1, 1,
0.9259366, 0.4081672, 0.9302797, 0.9607843, 0, 1, 1,
0.9345134, 0.2025934, 1.03256, 0.9686275, 0, 1, 1,
0.9378198, -1.72364, 3.705317, 0.972549, 0, 1, 1,
0.9421599, -0.715868, 3.289172, 0.9803922, 0, 1, 1,
0.9529769, -1.244517, 1.744634, 0.9843137, 0, 1, 1,
0.9654558, -0.3842545, 1.391509, 0.9921569, 0, 1, 1,
0.966414, -0.7468491, 3.543716, 0.9960784, 0, 1, 1,
0.9768711, -0.7314627, 2.902522, 1, 0, 0.9960784, 1,
0.9846839, 0.4380507, 1.048346, 1, 0, 0.9882353, 1,
0.9917361, 1.192226, -0.1998153, 1, 0, 0.9843137, 1,
0.9965832, 0.2286063, 1.318551, 1, 0, 0.9764706, 1,
0.9981483, 0.3436004, 0.8681807, 1, 0, 0.972549, 1,
1.003257, -1.707569, 2.775459, 1, 0, 0.9647059, 1,
1.007903, 1.808561, 0.8735135, 1, 0, 0.9607843, 1,
1.010102, -1.026065, 2.726668, 1, 0, 0.9529412, 1,
1.013043, 0.7643626, 1.763084, 1, 0, 0.9490196, 1,
1.01405, 0.6484337, 1.505026, 1, 0, 0.9411765, 1,
1.019921, -1.783702, 2.179712, 1, 0, 0.9372549, 1,
1.020432, -2.070943, 4.314332, 1, 0, 0.9294118, 1,
1.028834, -0.803434, 3.782402, 1, 0, 0.9254902, 1,
1.032429, -0.2433785, 0.8474745, 1, 0, 0.9176471, 1,
1.032922, -0.5780005, 0.8256494, 1, 0, 0.9137255, 1,
1.033011, -0.6868209, 1.826769, 1, 0, 0.9058824, 1,
1.035828, -0.7860141, 2.495442, 1, 0, 0.9019608, 1,
1.04663, -0.5397313, 1.508948, 1, 0, 0.8941177, 1,
1.047335, -1.537311, 2.371882, 1, 0, 0.8862745, 1,
1.063795, 1.214858, 1.715816, 1, 0, 0.8823529, 1,
1.067459, -1.094634, 2.382291, 1, 0, 0.8745098, 1,
1.070264, -0.8898498, 2.600532, 1, 0, 0.8705882, 1,
1.071772, -0.803719, 2.674358, 1, 0, 0.8627451, 1,
1.080206, -0.8201162, 2.313238, 1, 0, 0.8588235, 1,
1.082658, 0.2267595, 1.328819, 1, 0, 0.8509804, 1,
1.082911, -1.530563, 3.47941, 1, 0, 0.8470588, 1,
1.084671, -1.812172, 4.483902, 1, 0, 0.8392157, 1,
1.09387, -0.8331035, 2.610957, 1, 0, 0.8352941, 1,
1.098335, -0.8808766, 1.241492, 1, 0, 0.827451, 1,
1.10112, -0.9463792, 0.1374529, 1, 0, 0.8235294, 1,
1.103607, -1.134578, 1.940953, 1, 0, 0.8156863, 1,
1.107585, -0.3051838, 1.007909, 1, 0, 0.8117647, 1,
1.108925, -0.3571743, 1.480983, 1, 0, 0.8039216, 1,
1.109239, -0.6722702, 3.847067, 1, 0, 0.7960784, 1,
1.120378, -1.840655, 4.097333, 1, 0, 0.7921569, 1,
1.122172, 1.176111, 2.660081, 1, 0, 0.7843137, 1,
1.124915, -1.980743, 2.127571, 1, 0, 0.7803922, 1,
1.136281, -0.2964746, 0.03504307, 1, 0, 0.772549, 1,
1.142711, -1.862396, 3.686855, 1, 0, 0.7686275, 1,
1.152729, -1.362733, 0.5694168, 1, 0, 0.7607843, 1,
1.153663, 0.4588838, 1.032541, 1, 0, 0.7568628, 1,
1.154884, -0.02571473, 2.890783, 1, 0, 0.7490196, 1,
1.15824, 0.4591789, 1.299745, 1, 0, 0.7450981, 1,
1.161857, -0.5407757, 0.8096042, 1, 0, 0.7372549, 1,
1.162187, -0.4812961, 1.13131, 1, 0, 0.7333333, 1,
1.169817, 1.82454, 1.199491, 1, 0, 0.7254902, 1,
1.173305, -0.08691242, 0.896021, 1, 0, 0.7215686, 1,
1.178617, 0.6509514, 0.7213578, 1, 0, 0.7137255, 1,
1.186834, -0.05021749, 1.861897, 1, 0, 0.7098039, 1,
1.187368, 3.495251, -0.1502933, 1, 0, 0.7019608, 1,
1.188539, 0.1725738, 1.805841, 1, 0, 0.6941177, 1,
1.193035, -2.378875, 1.895076, 1, 0, 0.6901961, 1,
1.201601, -0.3250975, 1.833561, 1, 0, 0.682353, 1,
1.210506, -1.175784, 1.927882, 1, 0, 0.6784314, 1,
1.211112, -0.5431041, 2.38377, 1, 0, 0.6705883, 1,
1.212211, -0.3692623, 1.158696, 1, 0, 0.6666667, 1,
1.221252, -0.8975572, 1.332333, 1, 0, 0.6588235, 1,
1.225414, 1.307235, 1.335715, 1, 0, 0.654902, 1,
1.23756, -0.2444893, 2.382011, 1, 0, 0.6470588, 1,
1.238341, 1.518096, 3.043104, 1, 0, 0.6431373, 1,
1.240833, -0.5770733, 2.089921, 1, 0, 0.6352941, 1,
1.241693, -0.1110468, 1.554018, 1, 0, 0.6313726, 1,
1.242395, -0.3620492, 1.601968, 1, 0, 0.6235294, 1,
1.246449, 2.409818, 0.5316311, 1, 0, 0.6196079, 1,
1.24823, 0.8167527, 1.806298, 1, 0, 0.6117647, 1,
1.248994, -1.085732, 2.813838, 1, 0, 0.6078432, 1,
1.252059, 1.269127, 0.591669, 1, 0, 0.6, 1,
1.255003, 0.05753091, 2.356614, 1, 0, 0.5921569, 1,
1.266389, 0.9082378, 0.8764185, 1, 0, 0.5882353, 1,
1.272619, -0.8207888, 2.070538, 1, 0, 0.5803922, 1,
1.278202, 1.194398, 0.5922903, 1, 0, 0.5764706, 1,
1.281358, -2.588314, 3.760556, 1, 0, 0.5686275, 1,
1.281668, -1.846665, 2.844442, 1, 0, 0.5647059, 1,
1.287439, -0.8910908, 2.487861, 1, 0, 0.5568628, 1,
1.300233, -0.5941924, 1.057938, 1, 0, 0.5529412, 1,
1.322916, -0.3810541, 2.619493, 1, 0, 0.5450981, 1,
1.331804, 1.814529, 0.3750624, 1, 0, 0.5411765, 1,
1.334013, -1.573929, 2.970954, 1, 0, 0.5333334, 1,
1.339253, -0.3267955, 2.141637, 1, 0, 0.5294118, 1,
1.346412, 0.2704968, 0.357005, 1, 0, 0.5215687, 1,
1.349352, 0.5065379, -0.04644079, 1, 0, 0.5176471, 1,
1.353808, -0.5280445, 3.48691, 1, 0, 0.509804, 1,
1.356594, -0.645672, 0.6924399, 1, 0, 0.5058824, 1,
1.356727, 0.1485692, 2.552585, 1, 0, 0.4980392, 1,
1.366194, 1.193054, 1.041716, 1, 0, 0.4901961, 1,
1.367962, 0.3327318, 1.037744, 1, 0, 0.4862745, 1,
1.408988, -0.4063442, 2.169936, 1, 0, 0.4784314, 1,
1.420809, -0.4484124, 1.221586, 1, 0, 0.4745098, 1,
1.422784, 0.3575429, 1.925782, 1, 0, 0.4666667, 1,
1.428424, 0.2541455, 0.07672793, 1, 0, 0.4627451, 1,
1.45717, 1.250039, 2.079054, 1, 0, 0.454902, 1,
1.459652, -0.3549664, 1.206177, 1, 0, 0.4509804, 1,
1.465965, 0.6441906, 2.341145, 1, 0, 0.4431373, 1,
1.468656, -0.342025, 1.619812, 1, 0, 0.4392157, 1,
1.469609, -1.341081, 4.373016, 1, 0, 0.4313726, 1,
1.470578, -1.203438, 2.112375, 1, 0, 0.427451, 1,
1.477492, 0.4344389, 0.4582869, 1, 0, 0.4196078, 1,
1.490004, -0.9414864, 1.218373, 1, 0, 0.4156863, 1,
1.492367, -0.6739683, 2.18709, 1, 0, 0.4078431, 1,
1.511289, 1.274005, 2.10898, 1, 0, 0.4039216, 1,
1.513401, -0.09391824, 1.704736, 1, 0, 0.3960784, 1,
1.522348, -1.541949, -0.3901378, 1, 0, 0.3882353, 1,
1.526014, 0.8700304, 0.06302191, 1, 0, 0.3843137, 1,
1.536434, -1.361135, 2.859946, 1, 0, 0.3764706, 1,
1.537374, 0.4826172, 0.6606409, 1, 0, 0.372549, 1,
1.538792, -1.078736, 1.681242, 1, 0, 0.3647059, 1,
1.543383, 0.07011331, 2.661045, 1, 0, 0.3607843, 1,
1.551166, -1.898023, 2.468957, 1, 0, 0.3529412, 1,
1.583322, 0.6006187, 0.2364786, 1, 0, 0.3490196, 1,
1.587887, 1.490044, -0.4379837, 1, 0, 0.3411765, 1,
1.589036, 0.7585807, 0.9348068, 1, 0, 0.3372549, 1,
1.591203, -0.5202596, 2.24534, 1, 0, 0.3294118, 1,
1.603352, 1.772585, 0.06905226, 1, 0, 0.3254902, 1,
1.609134, -0.9996223, 3.457643, 1, 0, 0.3176471, 1,
1.622564, 1.386736, 2.337465, 1, 0, 0.3137255, 1,
1.624825, -1.233958, 2.281038, 1, 0, 0.3058824, 1,
1.631172, -0.3205947, 0.7067361, 1, 0, 0.2980392, 1,
1.632893, -0.8831773, 3.061055, 1, 0, 0.2941177, 1,
1.632912, 0.6858357, 0.8606079, 1, 0, 0.2862745, 1,
1.636409, 1.64976, -0.1727065, 1, 0, 0.282353, 1,
1.646241, -0.1279278, 0.2970232, 1, 0, 0.2745098, 1,
1.651136, 0.7825052, 1.330297, 1, 0, 0.2705882, 1,
1.658302, 0.3605093, -0.02607862, 1, 0, 0.2627451, 1,
1.677429, 1.163737, -0.8093975, 1, 0, 0.2588235, 1,
1.71896, 1.949614, 1.30604, 1, 0, 0.2509804, 1,
1.724175, -0.2295908, 1.973396, 1, 0, 0.2470588, 1,
1.729227, -0.1320768, 0.932221, 1, 0, 0.2392157, 1,
1.729383, 0.3642972, 1.338157, 1, 0, 0.2352941, 1,
1.736828, -1.49647, 2.440953, 1, 0, 0.227451, 1,
1.739552, -0.3635508, 2.859655, 1, 0, 0.2235294, 1,
1.759509, -0.118848, 2.317713, 1, 0, 0.2156863, 1,
1.790155, -0.7897894, 1.026951, 1, 0, 0.2117647, 1,
1.814731, 0.2803439, 1.270816, 1, 0, 0.2039216, 1,
1.815004, 0.2957308, 2.058555, 1, 0, 0.1960784, 1,
1.822077, -1.219479, 1.111055, 1, 0, 0.1921569, 1,
1.844473, -0.03338798, 1.114311, 1, 0, 0.1843137, 1,
1.853776, 0.3275551, 1.771404, 1, 0, 0.1803922, 1,
1.876688, -0.2026679, 1.449012, 1, 0, 0.172549, 1,
1.880602, 0.197531, 0.5930707, 1, 0, 0.1686275, 1,
1.906572, -0.57283, 4.6456, 1, 0, 0.1607843, 1,
1.907641, -0.1736431, 2.606784, 1, 0, 0.1568628, 1,
1.912268, 0.8671429, 1.366226, 1, 0, 0.1490196, 1,
1.917881, -0.677918, 1.384051, 1, 0, 0.145098, 1,
1.923775, -1.127905, 2.309497, 1, 0, 0.1372549, 1,
1.98515, -0.6778998, 2.411966, 1, 0, 0.1333333, 1,
1.992607, 0.3082387, 0.6082408, 1, 0, 0.1254902, 1,
2.026266, 0.9182732, 0.8385219, 1, 0, 0.1215686, 1,
2.037393, -0.6725103, 2.569416, 1, 0, 0.1137255, 1,
2.059407, -0.08674853, 3.15034, 1, 0, 0.1098039, 1,
2.068865, -1.351488, 0.4838061, 1, 0, 0.1019608, 1,
2.110768, -1.522051, 2.711705, 1, 0, 0.09411765, 1,
2.112021, 0.2409115, 1.84551, 1, 0, 0.09019608, 1,
2.178316, 1.45871, -0.8464441, 1, 0, 0.08235294, 1,
2.215655, 0.1901045, 1.639327, 1, 0, 0.07843138, 1,
2.21758, -0.9461682, 2.386342, 1, 0, 0.07058824, 1,
2.24471, 2.032877, 0.2285763, 1, 0, 0.06666667, 1,
2.328006, -0.5880906, 1.953399, 1, 0, 0.05882353, 1,
2.349805, -1.500694, 2.657154, 1, 0, 0.05490196, 1,
2.360987, 0.77794, 1.670664, 1, 0, 0.04705882, 1,
2.425849, 0.7868956, 0.6372371, 1, 0, 0.04313726, 1,
2.47206, -1.757187, 3.873764, 1, 0, 0.03529412, 1,
2.507886, -0.6886948, 1.833623, 1, 0, 0.03137255, 1,
2.543512, 0.206423, 3.11416, 1, 0, 0.02352941, 1,
2.543917, -0.08961562, 1.60419, 1, 0, 0.01960784, 1,
2.59784, -1.656317, 2.322818, 1, 0, 0.01176471, 1,
2.616777, 0.4416763, -0.1932828, 1, 0, 0.007843138, 1
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
-0.3783873, -3.848058, -8.082148, 0, -0.5, 0.5, 0.5,
-0.3783873, -3.848058, -8.082148, 1, -0.5, 0.5, 0.5,
-0.3783873, -3.848058, -8.082148, 1, 1.5, 0.5, 0.5,
-0.3783873, -3.848058, -8.082148, 0, 1.5, 0.5, 0.5
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
-4.388913, 0.3557429, -8.082148, 0, -0.5, 0.5, 0.5,
-4.388913, 0.3557429, -8.082148, 1, -0.5, 0.5, 0.5,
-4.388913, 0.3557429, -8.082148, 1, 1.5, 0.5, 0.5,
-4.388913, 0.3557429, -8.082148, 0, 1.5, 0.5, 0.5
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
-4.388913, -3.848058, -0.3290033, 0, -0.5, 0.5, 0.5,
-4.388913, -3.848058, -0.3290033, 1, -0.5, 0.5, 0.5,
-4.388913, -3.848058, -0.3290033, 1, 1.5, 0.5, 0.5,
-4.388913, -3.848058, -0.3290033, 0, 1.5, 0.5, 0.5
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
-3, -2.87795, -6.29296,
2, -2.87795, -6.29296,
-3, -2.87795, -6.29296,
-3, -3.039635, -6.591158,
-2, -2.87795, -6.29296,
-2, -3.039635, -6.591158,
-1, -2.87795, -6.29296,
-1, -3.039635, -6.591158,
0, -2.87795, -6.29296,
0, -3.039635, -6.591158,
1, -2.87795, -6.29296,
1, -3.039635, -6.591158,
2, -2.87795, -6.29296,
2, -3.039635, -6.591158
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
-3, -3.363004, -7.187554, 0, -0.5, 0.5, 0.5,
-3, -3.363004, -7.187554, 1, -0.5, 0.5, 0.5,
-3, -3.363004, -7.187554, 1, 1.5, 0.5, 0.5,
-3, -3.363004, -7.187554, 0, 1.5, 0.5, 0.5,
-2, -3.363004, -7.187554, 0, -0.5, 0.5, 0.5,
-2, -3.363004, -7.187554, 1, -0.5, 0.5, 0.5,
-2, -3.363004, -7.187554, 1, 1.5, 0.5, 0.5,
-2, -3.363004, -7.187554, 0, 1.5, 0.5, 0.5,
-1, -3.363004, -7.187554, 0, -0.5, 0.5, 0.5,
-1, -3.363004, -7.187554, 1, -0.5, 0.5, 0.5,
-1, -3.363004, -7.187554, 1, 1.5, 0.5, 0.5,
-1, -3.363004, -7.187554, 0, 1.5, 0.5, 0.5,
0, -3.363004, -7.187554, 0, -0.5, 0.5, 0.5,
0, -3.363004, -7.187554, 1, -0.5, 0.5, 0.5,
0, -3.363004, -7.187554, 1, 1.5, 0.5, 0.5,
0, -3.363004, -7.187554, 0, 1.5, 0.5, 0.5,
1, -3.363004, -7.187554, 0, -0.5, 0.5, 0.5,
1, -3.363004, -7.187554, 1, -0.5, 0.5, 0.5,
1, -3.363004, -7.187554, 1, 1.5, 0.5, 0.5,
1, -3.363004, -7.187554, 0, 1.5, 0.5, 0.5,
2, -3.363004, -7.187554, 0, -0.5, 0.5, 0.5,
2, -3.363004, -7.187554, 1, -0.5, 0.5, 0.5,
2, -3.363004, -7.187554, 1, 1.5, 0.5, 0.5,
2, -3.363004, -7.187554, 0, 1.5, 0.5, 0.5
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
-3.463407, -2, -6.29296,
-3.463407, 3, -6.29296,
-3.463407, -2, -6.29296,
-3.617658, -2, -6.591158,
-3.463407, -1, -6.29296,
-3.617658, -1, -6.591158,
-3.463407, 0, -6.29296,
-3.617658, 0, -6.591158,
-3.463407, 1, -6.29296,
-3.617658, 1, -6.591158,
-3.463407, 2, -6.29296,
-3.617658, 2, -6.591158,
-3.463407, 3, -6.29296,
-3.617658, 3, -6.591158
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
-3.92616, -2, -7.187554, 0, -0.5, 0.5, 0.5,
-3.92616, -2, -7.187554, 1, -0.5, 0.5, 0.5,
-3.92616, -2, -7.187554, 1, 1.5, 0.5, 0.5,
-3.92616, -2, -7.187554, 0, 1.5, 0.5, 0.5,
-3.92616, -1, -7.187554, 0, -0.5, 0.5, 0.5,
-3.92616, -1, -7.187554, 1, -0.5, 0.5, 0.5,
-3.92616, -1, -7.187554, 1, 1.5, 0.5, 0.5,
-3.92616, -1, -7.187554, 0, 1.5, 0.5, 0.5,
-3.92616, 0, -7.187554, 0, -0.5, 0.5, 0.5,
-3.92616, 0, -7.187554, 1, -0.5, 0.5, 0.5,
-3.92616, 0, -7.187554, 1, 1.5, 0.5, 0.5,
-3.92616, 0, -7.187554, 0, 1.5, 0.5, 0.5,
-3.92616, 1, -7.187554, 0, -0.5, 0.5, 0.5,
-3.92616, 1, -7.187554, 1, -0.5, 0.5, 0.5,
-3.92616, 1, -7.187554, 1, 1.5, 0.5, 0.5,
-3.92616, 1, -7.187554, 0, 1.5, 0.5, 0.5,
-3.92616, 2, -7.187554, 0, -0.5, 0.5, 0.5,
-3.92616, 2, -7.187554, 1, -0.5, 0.5, 0.5,
-3.92616, 2, -7.187554, 1, 1.5, 0.5, 0.5,
-3.92616, 2, -7.187554, 0, 1.5, 0.5, 0.5,
-3.92616, 3, -7.187554, 0, -0.5, 0.5, 0.5,
-3.92616, 3, -7.187554, 1, -0.5, 0.5, 0.5,
-3.92616, 3, -7.187554, 1, 1.5, 0.5, 0.5,
-3.92616, 3, -7.187554, 0, 1.5, 0.5, 0.5
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
-3.463407, -2.87795, -6,
-3.463407, -2.87795, 4,
-3.463407, -2.87795, -6,
-3.617658, -3.039635, -6,
-3.463407, -2.87795, -4,
-3.617658, -3.039635, -4,
-3.463407, -2.87795, -2,
-3.617658, -3.039635, -2,
-3.463407, -2.87795, 0,
-3.617658, -3.039635, 0,
-3.463407, -2.87795, 2,
-3.617658, -3.039635, 2,
-3.463407, -2.87795, 4,
-3.617658, -3.039635, 4
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
"-6",
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
-3.92616, -3.363004, -6, 0, -0.5, 0.5, 0.5,
-3.92616, -3.363004, -6, 1, -0.5, 0.5, 0.5,
-3.92616, -3.363004, -6, 1, 1.5, 0.5, 0.5,
-3.92616, -3.363004, -6, 0, 1.5, 0.5, 0.5,
-3.92616, -3.363004, -4, 0, -0.5, 0.5, 0.5,
-3.92616, -3.363004, -4, 1, -0.5, 0.5, 0.5,
-3.92616, -3.363004, -4, 1, 1.5, 0.5, 0.5,
-3.92616, -3.363004, -4, 0, 1.5, 0.5, 0.5,
-3.92616, -3.363004, -2, 0, -0.5, 0.5, 0.5,
-3.92616, -3.363004, -2, 1, -0.5, 0.5, 0.5,
-3.92616, -3.363004, -2, 1, 1.5, 0.5, 0.5,
-3.92616, -3.363004, -2, 0, 1.5, 0.5, 0.5,
-3.92616, -3.363004, 0, 0, -0.5, 0.5, 0.5,
-3.92616, -3.363004, 0, 1, -0.5, 0.5, 0.5,
-3.92616, -3.363004, 0, 1, 1.5, 0.5, 0.5,
-3.92616, -3.363004, 0, 0, 1.5, 0.5, 0.5,
-3.92616, -3.363004, 2, 0, -0.5, 0.5, 0.5,
-3.92616, -3.363004, 2, 1, -0.5, 0.5, 0.5,
-3.92616, -3.363004, 2, 1, 1.5, 0.5, 0.5,
-3.92616, -3.363004, 2, 0, 1.5, 0.5, 0.5,
-3.92616, -3.363004, 4, 0, -0.5, 0.5, 0.5,
-3.92616, -3.363004, 4, 1, -0.5, 0.5, 0.5,
-3.92616, -3.363004, 4, 1, 1.5, 0.5, 0.5,
-3.92616, -3.363004, 4, 0, 1.5, 0.5, 0.5
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
-3.463407, -2.87795, -6.29296,
-3.463407, 3.589436, -6.29296,
-3.463407, -2.87795, 5.634953,
-3.463407, 3.589436, 5.634953,
-3.463407, -2.87795, -6.29296,
-3.463407, -2.87795, 5.634953,
-3.463407, 3.589436, -6.29296,
-3.463407, 3.589436, 5.634953,
-3.463407, -2.87795, -6.29296,
2.706632, -2.87795, -6.29296,
-3.463407, -2.87795, 5.634953,
2.706632, -2.87795, 5.634953,
-3.463407, 3.589436, -6.29296,
2.706632, 3.589436, -6.29296,
-3.463407, 3.589436, 5.634953,
2.706632, 3.589436, 5.634953,
2.706632, -2.87795, -6.29296,
2.706632, 3.589436, -6.29296,
2.706632, -2.87795, 5.634953,
2.706632, 3.589436, 5.634953,
2.706632, -2.87795, -6.29296,
2.706632, -2.87795, 5.634953,
2.706632, 3.589436, -6.29296,
2.706632, 3.589436, 5.634953
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
var radius = 7.959206;
var distance = 35.4114;
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
mvMatrix.translate( 0.3783873, -0.3557429, 0.3290033 );
mvMatrix.scale( 1.394748, 1.330622, 0.7214714 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.4114);
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
gamma-Nonalactone<-read.table("gamma-Nonalactone.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-gamma-Nonalactone$V2
```

```
## Error in eval(expr, envir, enclos): object 'Nonalactone' not found
```

```r
y<-gamma-Nonalactone$V3
```

```
## Error in eval(expr, envir, enclos): object 'Nonalactone' not found
```

```r
z<-gamma-Nonalactone$V4
```

```
## Error in eval(expr, envir, enclos): object 'Nonalactone' not found
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
-3.373552, 1.019568, -2.867159, 0, 0, 1, 1, 1,
-3.357029, -2.015798, -3.080486, 1, 0, 0, 1, 1,
-2.967537, 0.1247507, -1.892543, 1, 0, 0, 1, 1,
-2.762367, -0.3766281, -1.237496, 1, 0, 0, 1, 1,
-2.528191, 1.03806, -1.678218, 1, 0, 0, 1, 1,
-2.408889, 0.2071246, -0.4202732, 1, 0, 0, 1, 1,
-2.407117, -0.4588276, -2.676201, 0, 0, 0, 1, 1,
-2.403007, 2.103733, -2.259038, 0, 0, 0, 1, 1,
-2.374403, 0.05560961, -1.714573, 0, 0, 0, 1, 1,
-2.371573, -0.1031276, -1.59194, 0, 0, 0, 1, 1,
-2.368876, -0.1072033, -2.47445, 0, 0, 0, 1, 1,
-2.358898, 0.008639048, -1.258368, 0, 0, 0, 1, 1,
-2.344862, -0.9308488, -3.597526, 0, 0, 0, 1, 1,
-2.303789, -0.457704, -0.7850143, 1, 1, 1, 1, 1,
-2.294179, 1.572146, -2.388737, 1, 1, 1, 1, 1,
-2.29075, -0.1670844, -1.994826, 1, 1, 1, 1, 1,
-2.281375, -0.336464, -1.643201, 1, 1, 1, 1, 1,
-2.274762, 1.758193, 0.8929605, 1, 1, 1, 1, 1,
-2.27029, 0.2162267, -1.621351, 1, 1, 1, 1, 1,
-2.263236, -1.395153, -0.9576781, 1, 1, 1, 1, 1,
-2.259564, -1.737117, -2.516284, 1, 1, 1, 1, 1,
-2.214273, 0.2632122, -2.015003, 1, 1, 1, 1, 1,
-2.160895, -0.6910508, -1.102085, 1, 1, 1, 1, 1,
-2.127438, -0.5520107, -2.793856, 1, 1, 1, 1, 1,
-2.122841, 1.93555, -1.090814, 1, 1, 1, 1, 1,
-2.054808, 0.1073469, 0.2860751, 1, 1, 1, 1, 1,
-2.053255, -0.18238, -1.664207, 1, 1, 1, 1, 1,
-2.028919, 1.130461, -1.439399, 1, 1, 1, 1, 1,
-2.017844, 0.4875986, -1.475781, 0, 0, 1, 1, 1,
-1.979091, -0.7006874, -1.800298, 1, 0, 0, 1, 1,
-1.977937, -1.124244, -1.623382, 1, 0, 0, 1, 1,
-1.948072, -0.5229061, -2.581117, 1, 0, 0, 1, 1,
-1.923248, -0.704203, -2.290953, 1, 0, 0, 1, 1,
-1.916097, -0.8215763, -2.203336, 1, 0, 0, 1, 1,
-1.900117, -0.707405, -0.1070671, 0, 0, 0, 1, 1,
-1.898155, 1.989912, 0.04021116, 0, 0, 0, 1, 1,
-1.879332, 0.2081757, -2.376496, 0, 0, 0, 1, 1,
-1.876749, -0.6649009, -3.774211, 0, 0, 0, 1, 1,
-1.858358, 0.2513972, -1.143997, 0, 0, 0, 1, 1,
-1.825084, -1.781433, -2.757539, 0, 0, 0, 1, 1,
-1.789378, 0.369659, -1.194421, 0, 0, 0, 1, 1,
-1.782988, 0.009016057, -0.9431529, 1, 1, 1, 1, 1,
-1.782243, -2.162647, -1.190061, 1, 1, 1, 1, 1,
-1.778012, -0.4287924, -1.671208, 1, 1, 1, 1, 1,
-1.737071, -2.783765, -3.048534, 1, 1, 1, 1, 1,
-1.690991, -2.18072, -0.1795075, 1, 1, 1, 1, 1,
-1.688225, -0.2528664, -2.349751, 1, 1, 1, 1, 1,
-1.679696, 0.59547, -1.674725, 1, 1, 1, 1, 1,
-1.673481, 0.09892002, -2.439494, 1, 1, 1, 1, 1,
-1.670705, -1.31798, -1.513685, 1, 1, 1, 1, 1,
-1.655093, -0.1338769, -0.7674122, 1, 1, 1, 1, 1,
-1.648714, 0.7284703, 0.05437212, 1, 1, 1, 1, 1,
-1.608936, -1.803679, -3.07807, 1, 1, 1, 1, 1,
-1.608427, 0.2072856, -1.333981, 1, 1, 1, 1, 1,
-1.598032, 0.6094149, -0.2126308, 1, 1, 1, 1, 1,
-1.593596, -0.3384818, -0.1816444, 1, 1, 1, 1, 1,
-1.592613, -0.3605856, -1.53429, 0, 0, 1, 1, 1,
-1.586499, -1.196066, -1.024155, 1, 0, 0, 1, 1,
-1.565776, -1.189274, -1.485315, 1, 0, 0, 1, 1,
-1.556155, 0.8575947, -0.9184546, 1, 0, 0, 1, 1,
-1.550714, -0.256654, -0.7859311, 1, 0, 0, 1, 1,
-1.543995, 0.2014744, -1.323541, 1, 0, 0, 1, 1,
-1.542343, 0.781246, -1.30156, 0, 0, 0, 1, 1,
-1.528407, -0.5271088, -2.517581, 0, 0, 0, 1, 1,
-1.527162, -0.01102081, 0.200937, 0, 0, 0, 1, 1,
-1.520757, -1.119968, -0.4586089, 0, 0, 0, 1, 1,
-1.515624, -1.047348, -1.700979, 0, 0, 0, 1, 1,
-1.513711, 0.7297057, -1.979584, 0, 0, 0, 1, 1,
-1.507837, 1.332536, 1.392786, 0, 0, 0, 1, 1,
-1.504314, 1.56121, -1.719023, 1, 1, 1, 1, 1,
-1.500136, 0.6799711, -0.80892, 1, 1, 1, 1, 1,
-1.498085, 0.7672326, -2.014835, 1, 1, 1, 1, 1,
-1.489188, -0.4527965, -2.370862, 1, 1, 1, 1, 1,
-1.489122, 1.614883, -0.7743806, 1, 1, 1, 1, 1,
-1.474059, -0.793192, -1.990486, 1, 1, 1, 1, 1,
-1.470976, -0.9442015, -0.968865, 1, 1, 1, 1, 1,
-1.465988, -1.2244, -4.604103, 1, 1, 1, 1, 1,
-1.449944, 0.05881042, -0.8943265, 1, 1, 1, 1, 1,
-1.449915, -0.5167788, -1.182558, 1, 1, 1, 1, 1,
-1.44921, -0.5214243, -0.1911347, 1, 1, 1, 1, 1,
-1.446606, -0.01495397, -1.034117, 1, 1, 1, 1, 1,
-1.443909, 0.6903496, 0.3948084, 1, 1, 1, 1, 1,
-1.437053, -1.429372, -2.727002, 1, 1, 1, 1, 1,
-1.432448, 0.06149245, -1.291635, 1, 1, 1, 1, 1,
-1.405494, -0.5560731, -1.988352, 0, 0, 1, 1, 1,
-1.383581, 1.338331, -1.109133, 1, 0, 0, 1, 1,
-1.368761, 1.327902, -1.926292, 1, 0, 0, 1, 1,
-1.36359, 0.535651, -0.8867311, 1, 0, 0, 1, 1,
-1.343856, 0.1473199, -3.029083, 1, 0, 0, 1, 1,
-1.342279, -0.09932797, 0.6289168, 1, 0, 0, 1, 1,
-1.337711, 1.031105, -0.8891484, 0, 0, 0, 1, 1,
-1.333594, 0.05100626, -1.475472, 0, 0, 0, 1, 1,
-1.328478, -0.2658827, -2.735666, 0, 0, 0, 1, 1,
-1.327065, -1.625868, -1.159443, 0, 0, 0, 1, 1,
-1.32432, 2.385817, -1.410484, 0, 0, 0, 1, 1,
-1.324101, 0.6339549, -2.468256, 0, 0, 0, 1, 1,
-1.322568, 1.946678, 0.7314724, 0, 0, 0, 1, 1,
-1.319875, -0.6112078, -1.920828, 1, 1, 1, 1, 1,
-1.310196, 0.2223517, -1.902501, 1, 1, 1, 1, 1,
-1.308242, -0.251251, -1.536091, 1, 1, 1, 1, 1,
-1.304135, -0.7902743, -2.473783, 1, 1, 1, 1, 1,
-1.302472, 2.776385, 0.4468477, 1, 1, 1, 1, 1,
-1.301816, -0.4053059, -2.867191, 1, 1, 1, 1, 1,
-1.298363, 1.236012, -2.133335, 1, 1, 1, 1, 1,
-1.291881, -1.162092, -1.935586, 1, 1, 1, 1, 1,
-1.286161, 0.8327706, -0.3038647, 1, 1, 1, 1, 1,
-1.282477, 0.08855702, 0.1649512, 1, 1, 1, 1, 1,
-1.275934, -1.096396, -1.889371, 1, 1, 1, 1, 1,
-1.265616, -0.4291591, -2.494242, 1, 1, 1, 1, 1,
-1.264778, 1.758953, 0.09946176, 1, 1, 1, 1, 1,
-1.257858, -2.313518, -3.35025, 1, 1, 1, 1, 1,
-1.255683, 1.194362, -0.1925814, 1, 1, 1, 1, 1,
-1.254416, -0.5809091, -2.213661, 0, 0, 1, 1, 1,
-1.253405, -0.04873575, 0.05921188, 1, 0, 0, 1, 1,
-1.243126, -0.6220987, -2.477875, 1, 0, 0, 1, 1,
-1.240381, 1.839184, -0.4511306, 1, 0, 0, 1, 1,
-1.238745, 1.542734, 0.8091303, 1, 0, 0, 1, 1,
-1.238401, 0.4890254, -1.5834, 1, 0, 0, 1, 1,
-1.232354, -0.1193041, -0.7594804, 0, 0, 0, 1, 1,
-1.229864, -0.08737229, -1.978101, 0, 0, 0, 1, 1,
-1.189581, -0.07287921, -1.259643, 0, 0, 0, 1, 1,
-1.184348, 0.6308618, -1.434534, 0, 0, 0, 1, 1,
-1.183048, 0.1518328, -1.482474, 0, 0, 0, 1, 1,
-1.182336, -0.7341431, -1.419944, 0, 0, 0, 1, 1,
-1.174411, -1.699836, -3.276706, 0, 0, 0, 1, 1,
-1.169099, -0.7665639, -1.467702, 1, 1, 1, 1, 1,
-1.169057, 1.190054, 0.1202489, 1, 1, 1, 1, 1,
-1.168425, 1.000863, -1.376856, 1, 1, 1, 1, 1,
-1.166726, -0.4200381, -2.418828, 1, 1, 1, 1, 1,
-1.159382, -0.1380611, -1.961664, 1, 1, 1, 1, 1,
-1.149066, -0.2954107, -3.940727, 1, 1, 1, 1, 1,
-1.147868, 0.3693548, -1.052062, 1, 1, 1, 1, 1,
-1.141025, -0.8856842, -1.974751, 1, 1, 1, 1, 1,
-1.140753, -1.663219, -2.860587, 1, 1, 1, 1, 1,
-1.139533, 0.3511027, -1.719212, 1, 1, 1, 1, 1,
-1.137051, 0.2311714, -0.5961993, 1, 1, 1, 1, 1,
-1.134602, -1.794183, -1.924343, 1, 1, 1, 1, 1,
-1.132427, 0.8888147, -0.4672778, 1, 1, 1, 1, 1,
-1.132365, 1.086307, -0.331354, 1, 1, 1, 1, 1,
-1.11734, 1.101411, -1.662031, 1, 1, 1, 1, 1,
-1.106648, 0.2181139, -1.424775, 0, 0, 1, 1, 1,
-1.105512, -0.5738986, -1.930518, 1, 0, 0, 1, 1,
-1.097027, -0.5503592, -2.060828, 1, 0, 0, 1, 1,
-1.096728, -0.6827372, -3.238258, 1, 0, 0, 1, 1,
-1.086565, -2.088426, -2.388125, 1, 0, 0, 1, 1,
-1.08608, 1.692181, 1.472838, 1, 0, 0, 1, 1,
-1.084881, 1.214925, 0.4724114, 0, 0, 0, 1, 1,
-1.08287, -1.322004, -1.107517, 0, 0, 0, 1, 1,
-1.078113, -0.1180703, -1.230695, 0, 0, 0, 1, 1,
-1.077141, 0.1533407, 0.006696061, 0, 0, 0, 1, 1,
-1.074157, -0.5059661, -2.92571, 0, 0, 0, 1, 1,
-1.074146, -0.5274197, -2.796203, 0, 0, 0, 1, 1,
-1.072433, -0.7222534, -2.616239, 0, 0, 0, 1, 1,
-1.067456, -0.6249205, -2.609478, 1, 1, 1, 1, 1,
-1.062534, 0.2475323, -0.279218, 1, 1, 1, 1, 1,
-1.054536, 1.880066, -1.462052, 1, 1, 1, 1, 1,
-1.054228, -0.520078, -2.6458, 1, 1, 1, 1, 1,
-1.053021, -1.152923, -1.46655, 1, 1, 1, 1, 1,
-1.040283, -1.358352, -1.904359, 1, 1, 1, 1, 1,
-1.038812, -0.4317127, -0.8365877, 1, 1, 1, 1, 1,
-1.027614, 0.4968143, -0.452054, 1, 1, 1, 1, 1,
-1.026647, -0.3540508, -3.094917, 1, 1, 1, 1, 1,
-1.025346, -0.6039569, -1.038257, 1, 1, 1, 1, 1,
-1.020776, -0.6991323, -2.691088, 1, 1, 1, 1, 1,
-1.018893, -0.1561131, -1.430693, 1, 1, 1, 1, 1,
-1.000533, 1.073432, -1.415684, 1, 1, 1, 1, 1,
-0.9984845, 0.3722472, -1.316149, 1, 1, 1, 1, 1,
-0.9982861, -0.5895282, -1.173245, 1, 1, 1, 1, 1,
-0.9928156, 0.9405537, -0.4256194, 0, 0, 1, 1, 1,
-0.9911166, -0.6909357, -1.84645, 1, 0, 0, 1, 1,
-0.9876285, -0.1451514, -1.556952, 1, 0, 0, 1, 1,
-0.9843958, -0.8256143, -4.310268, 1, 0, 0, 1, 1,
-0.9834817, -1.249446, -1.341381, 1, 0, 0, 1, 1,
-0.9829272, -0.1614718, -1.715588, 1, 0, 0, 1, 1,
-0.977823, -0.01631674, -1.711918, 0, 0, 0, 1, 1,
-0.9773912, -0.2323181, -2.196561, 0, 0, 0, 1, 1,
-0.9743467, 0.5430772, -2.772925, 0, 0, 0, 1, 1,
-0.9714982, 1.708702, -1.735124, 0, 0, 0, 1, 1,
-0.9563705, 0.706311, -0.6761839, 0, 0, 0, 1, 1,
-0.9518136, 0.5393162, -0.601847, 0, 0, 0, 1, 1,
-0.9429042, 0.7644971, -0.9751405, 0, 0, 0, 1, 1,
-0.9311616, -0.7090147, -0.5752301, 1, 1, 1, 1, 1,
-0.9247858, 0.6947003, -1.108889, 1, 1, 1, 1, 1,
-0.9211832, -0.2179449, -2.838293, 1, 1, 1, 1, 1,
-0.9181384, -0.2259862, -1.606978, 1, 1, 1, 1, 1,
-0.9159092, 0.2080672, -1.053593, 1, 1, 1, 1, 1,
-0.9135563, -1.019811, -1.300864, 1, 1, 1, 1, 1,
-0.9126858, -0.8399162, -0.8675835, 1, 1, 1, 1, 1,
-0.9122919, 0.5373265, -0.5611629, 1, 1, 1, 1, 1,
-0.9082707, 1.722754, 0.3390965, 1, 1, 1, 1, 1,
-0.9076754, 0.5659764, -1.472817, 1, 1, 1, 1, 1,
-0.9052879, 0.1914817, -1.020714, 1, 1, 1, 1, 1,
-0.9048513, 0.08217923, 0.05120317, 1, 1, 1, 1, 1,
-0.9039866, 0.7078971, -0.4289885, 1, 1, 1, 1, 1,
-0.9037488, -0.735393, -1.411482, 1, 1, 1, 1, 1,
-0.9008857, 0.03211152, -1.504523, 1, 1, 1, 1, 1,
-0.8996025, 1.329389, -1.031962, 0, 0, 1, 1, 1,
-0.8985204, -0.03291971, -1.204144, 1, 0, 0, 1, 1,
-0.8968824, -0.3825017, -1.369697, 1, 0, 0, 1, 1,
-0.8968338, 1.325486, 0.3143226, 1, 0, 0, 1, 1,
-0.8952271, -0.1971783, -1.180024, 1, 0, 0, 1, 1,
-0.8905945, -0.09286749, -1.93643, 1, 0, 0, 1, 1,
-0.8833857, 1.215126, -0.2428103, 0, 0, 0, 1, 1,
-0.8828048, 0.9559488, -1.970562, 0, 0, 0, 1, 1,
-0.8823308, -0.8995182, -2.061985, 0, 0, 0, 1, 1,
-0.8707786, 0.7452759, -0.2490986, 0, 0, 0, 1, 1,
-0.8698217, 0.5166356, -3.174982, 0, 0, 0, 1, 1,
-0.8581232, -0.1037328, -1.299169, 0, 0, 0, 1, 1,
-0.8555448, -1.5005, -1.149903, 0, 0, 0, 1, 1,
-0.8545521, -0.7126651, -1.387628, 1, 1, 1, 1, 1,
-0.8520115, 1.124107, 0.2270437, 1, 1, 1, 1, 1,
-0.8476898, -1.167088, -2.163975, 1, 1, 1, 1, 1,
-0.8449247, 0.7661621, 0.579028, 1, 1, 1, 1, 1,
-0.8409913, 0.5105988, -1.76096, 1, 1, 1, 1, 1,
-0.8388306, -1.322517, -0.2171555, 1, 1, 1, 1, 1,
-0.8374628, -0.6304929, -1.533212, 1, 1, 1, 1, 1,
-0.8349242, 0.7335598, -0.6383911, 1, 1, 1, 1, 1,
-0.8200506, 0.0551805, -1.373986, 1, 1, 1, 1, 1,
-0.81984, -0.1314476, -0.4799027, 1, 1, 1, 1, 1,
-0.8113459, 1.993603, -0.1164197, 1, 1, 1, 1, 1,
-0.8045764, 0.4849031, -2.148304, 1, 1, 1, 1, 1,
-0.8008299, 0.4930178, -0.604291, 1, 1, 1, 1, 1,
-0.7981071, 0.124972, -1.884772, 1, 1, 1, 1, 1,
-0.7949031, -1.116614, -0.6242214, 1, 1, 1, 1, 1,
-0.7946762, 0.0908104, -1.948538, 0, 0, 1, 1, 1,
-0.794095, -0.4775392, -2.05376, 1, 0, 0, 1, 1,
-0.7934048, -1.247224, -3.393994, 1, 0, 0, 1, 1,
-0.7922879, -0.06740364, 0.3114109, 1, 0, 0, 1, 1,
-0.7860734, -1.596462, -2.553192, 1, 0, 0, 1, 1,
-0.7813832, -1.657756, -3.165056, 1, 0, 0, 1, 1,
-0.779061, -0.02716614, -2.091051, 0, 0, 0, 1, 1,
-0.7719309, -1.266996, -3.023595, 0, 0, 0, 1, 1,
-0.7659947, -1.095065, -2.114075, 0, 0, 0, 1, 1,
-0.7583965, 0.02718648, -0.560879, 0, 0, 0, 1, 1,
-0.755748, 2.074974, 0.9592493, 0, 0, 0, 1, 1,
-0.7537814, 0.1401328, -0.2911576, 0, 0, 0, 1, 1,
-0.7533665, -0.4713723, -1.542806, 0, 0, 0, 1, 1,
-0.7532588, -1.499372, -0.3483805, 1, 1, 1, 1, 1,
-0.7516278, -0.633698, -2.841133, 1, 1, 1, 1, 1,
-0.7505311, -0.633222, -3.131082, 1, 1, 1, 1, 1,
-0.7467026, 1.235911, -0.1067875, 1, 1, 1, 1, 1,
-0.7449103, -1.23767, -1.612702, 1, 1, 1, 1, 1,
-0.738609, -1.10035, -1.800221, 1, 1, 1, 1, 1,
-0.7378462, 0.5978493, -0.3423004, 1, 1, 1, 1, 1,
-0.7372901, -0.7061504, -2.563147, 1, 1, 1, 1, 1,
-0.7360625, 0.6867275, -0.8706335, 1, 1, 1, 1, 1,
-0.7319608, -0.6210775, -2.282848, 1, 1, 1, 1, 1,
-0.7255065, -0.4790145, -1.874568, 1, 1, 1, 1, 1,
-0.725484, 0.4055734, -0.5571133, 1, 1, 1, 1, 1,
-0.7253499, 2.28905, 0.3553242, 1, 1, 1, 1, 1,
-0.7247995, 0.5926641, -2.255467, 1, 1, 1, 1, 1,
-0.720566, 0.980489, -0.7574197, 1, 1, 1, 1, 1,
-0.7158801, -0.909326, -2.669848, 0, 0, 1, 1, 1,
-0.7088734, -2.61399, -2.6156, 1, 0, 0, 1, 1,
-0.7077237, -0.5625331, -1.98717, 1, 0, 0, 1, 1,
-0.7067152, 0.6475806, -0.118649, 1, 0, 0, 1, 1,
-0.706212, 0.5130218, -0.9919548, 1, 0, 0, 1, 1,
-0.7027584, 1.621349, 0.7981253, 1, 0, 0, 1, 1,
-0.701162, 0.4115209, -1.030823, 0, 0, 0, 1, 1,
-0.700917, 0.09706649, -0.881824, 0, 0, 0, 1, 1,
-0.7003492, -0.5521354, -1.421687, 0, 0, 0, 1, 1,
-0.6982321, 0.2963128, -0.7145347, 0, 0, 0, 1, 1,
-0.6962537, -0.5692276, -3.282151, 0, 0, 0, 1, 1,
-0.6888771, 0.08356785, -1.069661, 0, 0, 0, 1, 1,
-0.6754996, 0.6397289, -2.302649, 0, 0, 0, 1, 1,
-0.6724644, -1.277569, -2.735624, 1, 1, 1, 1, 1,
-0.6674829, 1.325157, 0.8484532, 1, 1, 1, 1, 1,
-0.6672138, 0.47236, -0.7714231, 1, 1, 1, 1, 1,
-0.6613539, -1.851189, -4.16964, 1, 1, 1, 1, 1,
-0.6597489, -0.6398917, -2.799852, 1, 1, 1, 1, 1,
-0.6571823, -1.078347, -2.512824, 1, 1, 1, 1, 1,
-0.6505583, -0.6309373, -2.20125, 1, 1, 1, 1, 1,
-0.6487364, 0.09691342, -2.804581, 1, 1, 1, 1, 1,
-0.6430922, -1.114078, -1.219291, 1, 1, 1, 1, 1,
-0.6424946, 0.07231618, -1.739972, 1, 1, 1, 1, 1,
-0.6414868, -0.3176788, -0.6643866, 1, 1, 1, 1, 1,
-0.6379027, 1.954496, -0.8356184, 1, 1, 1, 1, 1,
-0.6339691, 1.067138, 0.7571082, 1, 1, 1, 1, 1,
-0.6263385, 0.3580911, -2.766679, 1, 1, 1, 1, 1,
-0.6220497, -1.096007, -2.245542, 1, 1, 1, 1, 1,
-0.6220167, -0.1754911, -3.011133, 0, 0, 1, 1, 1,
-0.6149249, 0.7272122, -0.7486357, 1, 0, 0, 1, 1,
-0.6138985, -0.3810361, -2.509777, 1, 0, 0, 1, 1,
-0.6127185, 0.4517826, 0.4281039, 1, 0, 0, 1, 1,
-0.6085345, 0.3107477, -0.7797561, 1, 0, 0, 1, 1,
-0.593168, -0.4914649, -2.875094, 1, 0, 0, 1, 1,
-0.5924622, 0.2821669, -0.3230703, 0, 0, 0, 1, 1,
-0.5857092, -0.6875269, -3.283926, 0, 0, 0, 1, 1,
-0.5851634, -0.8636368, -2.618243, 0, 0, 0, 1, 1,
-0.5843676, -0.273232, -1.851913, 0, 0, 0, 1, 1,
-0.5793601, -0.186309, -3.278412, 0, 0, 0, 1, 1,
-0.573904, 0.6928226, -2.557476, 0, 0, 0, 1, 1,
-0.5639592, 0.08162443, -1.875391, 0, 0, 0, 1, 1,
-0.5638806, -1.038191, -1.579728, 1, 1, 1, 1, 1,
-0.5597273, -0.2295066, -1.654096, 1, 1, 1, 1, 1,
-0.5570377, 0.1381706, -1.733327, 1, 1, 1, 1, 1,
-0.5567595, 1.589308, -0.5367385, 1, 1, 1, 1, 1,
-0.5515109, -0.3553536, -2.581051, 1, 1, 1, 1, 1,
-0.5500262, -1.738394, -4.997739, 1, 1, 1, 1, 1,
-0.540308, -0.2160242, -2.49491, 1, 1, 1, 1, 1,
-0.5398582, 1.633658, 0.5307512, 1, 1, 1, 1, 1,
-0.5385706, 0.1048751, -1.192527, 1, 1, 1, 1, 1,
-0.537981, -0.2063932, -4.027863, 1, 1, 1, 1, 1,
-0.5349578, 0.6531176, -1.804077, 1, 1, 1, 1, 1,
-0.5333826, 1.367528, 1.05941, 1, 1, 1, 1, 1,
-0.5328215, 0.3470329, -0.2987592, 1, 1, 1, 1, 1,
-0.5327366, -0.2679936, -2.264198, 1, 1, 1, 1, 1,
-0.5266443, -1.206239, -2.452982, 1, 1, 1, 1, 1,
-0.5180099, 0.1957581, -3.123584, 0, 0, 1, 1, 1,
-0.5168273, -0.3297917, -2.700516, 1, 0, 0, 1, 1,
-0.5148242, -0.7728202, -3.387357, 1, 0, 0, 1, 1,
-0.5126997, 0.329198, -1.917221, 1, 0, 0, 1, 1,
-0.5115189, 0.298974, -2.823175, 1, 0, 0, 1, 1,
-0.5062404, -0.05189004, -2.332788, 1, 0, 0, 1, 1,
-0.5050325, -1.258882, -2.778146, 0, 0, 0, 1, 1,
-0.5041022, -1.151312, -3.286327, 0, 0, 0, 1, 1,
-0.5035167, -0.5700294, -2.929952, 0, 0, 0, 1, 1,
-0.503267, -0.9107956, -2.391696, 0, 0, 0, 1, 1,
-0.5000705, 1.119183, 0.2318697, 0, 0, 0, 1, 1,
-0.4969255, 0.3880908, -1.452889, 0, 0, 0, 1, 1,
-0.4966713, 0.3857267, -0.1888497, 0, 0, 0, 1, 1,
-0.4944376, -2.189533, -4.69277, 1, 1, 1, 1, 1,
-0.4940733, 0.577141, 1.012871, 1, 1, 1, 1, 1,
-0.4868045, -0.4510586, -0.9142962, 1, 1, 1, 1, 1,
-0.4852371, -1.397806, -2.088466, 1, 1, 1, 1, 1,
-0.4831305, 1.288031, -1.377829, 1, 1, 1, 1, 1,
-0.4830292, 0.1532072, -2.115474, 1, 1, 1, 1, 1,
-0.4812958, -0.8182331, -2.298279, 1, 1, 1, 1, 1,
-0.4800949, -0.3447073, -1.193337, 1, 1, 1, 1, 1,
-0.4799291, 0.2191833, -1.926677, 1, 1, 1, 1, 1,
-0.4795064, 2.360347, -1.325923, 1, 1, 1, 1, 1,
-0.479054, -0.3673941, -2.477725, 1, 1, 1, 1, 1,
-0.4764133, 0.6126891, -0.1965033, 1, 1, 1, 1, 1,
-0.4755018, -1.767187, -4.870107, 1, 1, 1, 1, 1,
-0.475346, -0.9564115, -2.207554, 1, 1, 1, 1, 1,
-0.4751266, 1.089199, -0.7275247, 1, 1, 1, 1, 1,
-0.4751012, 2.097187, -0.5163036, 0, 0, 1, 1, 1,
-0.4720359, 0.5640438, -0.1490099, 1, 0, 0, 1, 1,
-0.4711555, 1.025014, 1.179549, 1, 0, 0, 1, 1,
-0.4698953, -1.35325, -2.145368, 1, 0, 0, 1, 1,
-0.4650605, -1.762818, -2.327283, 1, 0, 0, 1, 1,
-0.463179, 0.8266116, -1.340252, 1, 0, 0, 1, 1,
-0.4595889, -0.3913888, -2.9562, 0, 0, 0, 1, 1,
-0.4482327, -1.346178, -3.404562, 0, 0, 0, 1, 1,
-0.4478374, 0.2172959, -1.238254, 0, 0, 0, 1, 1,
-0.4461435, 0.8888708, -1.250422, 0, 0, 0, 1, 1,
-0.4458918, 0.2387244, -1.667958, 0, 0, 0, 1, 1,
-0.4440911, -1.518916, -4.440169, 0, 0, 0, 1, 1,
-0.4388112, 0.2086587, -0.6801425, 0, 0, 0, 1, 1,
-0.4362286, 0.173062, -0.3114924, 1, 1, 1, 1, 1,
-0.4280566, 2.076436, -0.142506, 1, 1, 1, 1, 1,
-0.4187315, 0.6439629, -0.989876, 1, 1, 1, 1, 1,
-0.4119973, -0.4082707, -3.070272, 1, 1, 1, 1, 1,
-0.4111746, -1.324448, -2.853276, 1, 1, 1, 1, 1,
-0.4099442, -0.4861214, -3.29847, 1, 1, 1, 1, 1,
-0.4048789, 0.9804537, 0.0182447, 1, 1, 1, 1, 1,
-0.4048319, -0.8549236, -4.861116, 1, 1, 1, 1, 1,
-0.4039199, 0.369298, 0.5073792, 1, 1, 1, 1, 1,
-0.4037994, 1.221956, -0.0007619857, 1, 1, 1, 1, 1,
-0.4031088, 0.1320175, -2.096595, 1, 1, 1, 1, 1,
-0.4023179, 1.009374, -1.467341, 1, 1, 1, 1, 1,
-0.401743, -0.1226695, -1.445611, 1, 1, 1, 1, 1,
-0.4000093, -0.4969796, -1.589042, 1, 1, 1, 1, 1,
-0.3963346, -0.7496006, -1.920971, 1, 1, 1, 1, 1,
-0.3961409, 0.7660435, 1.119534, 0, 0, 1, 1, 1,
-0.3947909, 0.3976977, -1.431664, 1, 0, 0, 1, 1,
-0.391997, -0.9005494, -2.496533, 1, 0, 0, 1, 1,
-0.3906148, -0.9604657, -2.22333, 1, 0, 0, 1, 1,
-0.3867649, 0.9575382, -0.4537352, 1, 0, 0, 1, 1,
-0.3790226, 1.321271, 0.3241937, 1, 0, 0, 1, 1,
-0.3677948, 0.7052341, -1.278214, 0, 0, 0, 1, 1,
-0.3610251, -0.05093844, -0.6200922, 0, 0, 0, 1, 1,
-0.3601897, 0.5497258, -0.2038402, 0, 0, 0, 1, 1,
-0.3584135, -0.1417381, -1.62207, 0, 0, 0, 1, 1,
-0.3562112, -0.2760912, -1.15014, 0, 0, 0, 1, 1,
-0.3515744, -1.078814, -1.39536, 0, 0, 0, 1, 1,
-0.3502398, 0.006149142, -1.822561, 0, 0, 0, 1, 1,
-0.3449343, -1.286336, -2.302753, 1, 1, 1, 1, 1,
-0.3444886, 0.9660311, -0.8290746, 1, 1, 1, 1, 1,
-0.3425784, -0.379052, -2.902122, 1, 1, 1, 1, 1,
-0.340345, -0.4991791, -1.989018, 1, 1, 1, 1, 1,
-0.3372656, 0.3916399, -0.3769065, 1, 1, 1, 1, 1,
-0.3359955, 1.604229, -1.291151, 1, 1, 1, 1, 1,
-0.3349473, -0.07880866, -1.58075, 1, 1, 1, 1, 1,
-0.3301221, 0.9131523, -0.9038579, 1, 1, 1, 1, 1,
-0.3294397, 0.8130123, 0.6106697, 1, 1, 1, 1, 1,
-0.32612, 0.5966892, 2.510875, 1, 1, 1, 1, 1,
-0.3242903, 0.4205225, -1.785022, 1, 1, 1, 1, 1,
-0.3220799, 0.8018541, -1.330957, 1, 1, 1, 1, 1,
-0.32088, 1.456107, 0.8926864, 1, 1, 1, 1, 1,
-0.3197899, -1.099267, -1.799276, 1, 1, 1, 1, 1,
-0.3184346, 0.08195883, -2.912059, 1, 1, 1, 1, 1,
-0.3103195, -1.858497, -1.581825, 0, 0, 1, 1, 1,
-0.3095736, -0.8599616, -2.034489, 1, 0, 0, 1, 1,
-0.3071658, -0.7427987, -2.588871, 1, 0, 0, 1, 1,
-0.3066968, -0.7538, -2.932595, 1, 0, 0, 1, 1,
-0.306553, -1.364517, -0.1678975, 1, 0, 0, 1, 1,
-0.3048298, -0.3437696, -2.724908, 1, 0, 0, 1, 1,
-0.3045247, -0.7550315, -3.232442, 0, 0, 0, 1, 1,
-0.3007378, -0.6683646, -3.899528, 0, 0, 0, 1, 1,
-0.2983766, -0.01602026, -1.789707, 0, 0, 0, 1, 1,
-0.2952472, 0.9693502, 0.797221, 0, 0, 0, 1, 1,
-0.2832816, -1.064778, -2.471827, 0, 0, 0, 1, 1,
-0.2819616, 0.3013866, -2.506833, 0, 0, 0, 1, 1,
-0.2763011, -1.224426, -3.780535, 0, 0, 0, 1, 1,
-0.2753031, -0.072289, -1.473765, 1, 1, 1, 1, 1,
-0.27399, -1.064508, -1.579885, 1, 1, 1, 1, 1,
-0.2739359, -0.4009148, -2.681804, 1, 1, 1, 1, 1,
-0.2714175, 0.6129659, -0.3652439, 1, 1, 1, 1, 1,
-0.2664452, -0.1628735, -2.014584, 1, 1, 1, 1, 1,
-0.2640284, -2.153501, -2.810167, 1, 1, 1, 1, 1,
-0.2632745, 1.343918, -0.982594, 1, 1, 1, 1, 1,
-0.25996, -0.7589602, -2.797356, 1, 1, 1, 1, 1,
-0.2565064, -0.9316321, -3.100781, 1, 1, 1, 1, 1,
-0.2539768, 0.353335, -0.1338933, 1, 1, 1, 1, 1,
-0.247816, 0.12081, -1.113452, 1, 1, 1, 1, 1,
-0.2416692, 1.496683, -0.2681627, 1, 1, 1, 1, 1,
-0.2412985, 0.8374621, -2.170589, 1, 1, 1, 1, 1,
-0.24059, -0.8640178, -6.119253, 1, 1, 1, 1, 1,
-0.2344132, 0.2777409, 1.424965, 1, 1, 1, 1, 1,
-0.2329186, -0.2710047, -3.588192, 0, 0, 1, 1, 1,
-0.2325534, 0.323173, -1.596754, 1, 0, 0, 1, 1,
-0.226798, -0.1702494, -1.057404, 1, 0, 0, 1, 1,
-0.2240247, 1.310705, -2.400419, 1, 0, 0, 1, 1,
-0.2214238, 0.4930989, 0.01275777, 1, 0, 0, 1, 1,
-0.2207329, 1.0423, 0.09195241, 1, 0, 0, 1, 1,
-0.2182219, 0.09149224, -0.811972, 0, 0, 0, 1, 1,
-0.216902, 0.5165448, -1.61122, 0, 0, 0, 1, 1,
-0.2165698, 0.5840491, -1.729509, 0, 0, 0, 1, 1,
-0.2162409, -1.113441, -0.9226009, 0, 0, 0, 1, 1,
-0.2140001, -1.704208, -2.758712, 0, 0, 0, 1, 1,
-0.2139257, 1.501709, 0.4914453, 0, 0, 0, 1, 1,
-0.2106721, 0.3016692, -0.6341759, 0, 0, 0, 1, 1,
-0.2073325, -0.1221725, -3.687184, 1, 1, 1, 1, 1,
-0.2067607, 1.755342, -1.47644, 1, 1, 1, 1, 1,
-0.2066868, 0.146833, -1.382198, 1, 1, 1, 1, 1,
-0.203874, -0.227839, -1.110674, 1, 1, 1, 1, 1,
-0.2021212, -0.9607762, -3.253437, 1, 1, 1, 1, 1,
-0.2002436, 0.9526731, 0.6721795, 1, 1, 1, 1, 1,
-0.1974365, -0.6104884, -2.57003, 1, 1, 1, 1, 1,
-0.1971466, -0.6800441, -3.006866, 1, 1, 1, 1, 1,
-0.1967077, -0.2471102, -1.816659, 1, 1, 1, 1, 1,
-0.1962614, 0.9744224, -0.3372011, 1, 1, 1, 1, 1,
-0.1909744, 0.7611609, -0.1944952, 1, 1, 1, 1, 1,
-0.188464, -0.01096424, -4.721232, 1, 1, 1, 1, 1,
-0.1806221, 0.6039432, 0.1033733, 1, 1, 1, 1, 1,
-0.1796438, 0.8459656, -1.815137, 1, 1, 1, 1, 1,
-0.179497, -0.1975127, -0.8924667, 1, 1, 1, 1, 1,
-0.1755326, -0.02730051, -1.090309, 0, 0, 1, 1, 1,
-0.1725483, -1.055752, -2.451912, 1, 0, 0, 1, 1,
-0.1676204, -0.1983273, -2.260978, 1, 0, 0, 1, 1,
-0.1651153, -1.213706, -4.555734, 1, 0, 0, 1, 1,
-0.1641494, -1.734046, -2.744822, 1, 0, 0, 1, 1,
-0.1641165, -1.895842, -3.552644, 1, 0, 0, 1, 1,
-0.1616777, -1.710102, -2.385138, 0, 0, 0, 1, 1,
-0.1568184, -1.10912, -3.288613, 0, 0, 0, 1, 1,
-0.156002, 1.828591, 0.11763, 0, 0, 0, 1, 1,
-0.1536482, -0.7945916, -3.122322, 0, 0, 0, 1, 1,
-0.153135, -0.06817929, -2.559329, 0, 0, 0, 1, 1,
-0.1521164, 0.08941673, -1.869677, 0, 0, 0, 1, 1,
-0.1481388, 0.4083701, 1.664622, 0, 0, 0, 1, 1,
-0.1447258, -0.3977245, -3.074929, 1, 1, 1, 1, 1,
-0.1393974, 0.7020612, -0.8762585, 1, 1, 1, 1, 1,
-0.1357014, -0.3795918, -2.535962, 1, 1, 1, 1, 1,
-0.1353471, -0.9151409, -2.076668, 1, 1, 1, 1, 1,
-0.1349439, 0.4079178, -0.418931, 1, 1, 1, 1, 1,
-0.1334373, 0.4037853, 0.5988779, 1, 1, 1, 1, 1,
-0.1308537, -0.06959661, -1.63743, 1, 1, 1, 1, 1,
-0.1275183, -1.328018, -3.478135, 1, 1, 1, 1, 1,
-0.1266599, 1.50825, -0.1890441, 1, 1, 1, 1, 1,
-0.1265319, -0.5043322, -3.856933, 1, 1, 1, 1, 1,
-0.1239771, -1.30177, -3.475326, 1, 1, 1, 1, 1,
-0.1180666, 1.400981, 1.347909, 1, 1, 1, 1, 1,
-0.1149784, 0.9696288, -1.194741, 1, 1, 1, 1, 1,
-0.1121305, 0.1377294, -0.7413479, 1, 1, 1, 1, 1,
-0.1097729, 0.3907175, 0.1607341, 1, 1, 1, 1, 1,
-0.1051478, -1.722655, -3.582845, 0, 0, 1, 1, 1,
-0.1048612, -0.8334998, -2.599614, 1, 0, 0, 1, 1,
-0.1022333, 1.092327, 0.5023578, 1, 0, 0, 1, 1,
-0.1015448, 0.7852514, 0.4113666, 1, 0, 0, 1, 1,
-0.1012426, -0.2384845, -2.815531, 1, 0, 0, 1, 1,
-0.09945898, 0.3943608, -2.42844, 1, 0, 0, 1, 1,
-0.08845145, 2.131591, -0.07634407, 0, 0, 0, 1, 1,
-0.08638554, -1.329541, -3.808022, 0, 0, 0, 1, 1,
-0.0851944, -0.7963318, -2.2688, 0, 0, 0, 1, 1,
-0.08028989, 0.9835675, -0.2977228, 0, 0, 0, 1, 1,
-0.07961726, 0.5284963, -1.05135, 0, 0, 0, 1, 1,
-0.07909235, -0.1899625, -1.709964, 0, 0, 0, 1, 1,
-0.07355945, -0.8599836, -3.28764, 0, 0, 0, 1, 1,
-0.0733336, -0.654648, -2.796087, 1, 1, 1, 1, 1,
-0.07138125, 1.24218, 1.365633, 1, 1, 1, 1, 1,
-0.0713194, -1.104868, -2.156357, 1, 1, 1, 1, 1,
-0.06782073, -1.081057, -3.072526, 1, 1, 1, 1, 1,
-0.0665425, -0.3924859, -4.514578, 1, 1, 1, 1, 1,
-0.05928877, 1.009146, -0.2521048, 1, 1, 1, 1, 1,
-0.05562662, 0.2696382, 0.2277088, 1, 1, 1, 1, 1,
-0.05410879, 0.6058241, -0.4270476, 1, 1, 1, 1, 1,
-0.05342512, -0.3989808, -2.022177, 1, 1, 1, 1, 1,
-0.05318897, -0.458043, -3.209294, 1, 1, 1, 1, 1,
-0.05124307, 0.159257, 0.5523601, 1, 1, 1, 1, 1,
-0.04895535, -0.7434164, -2.978665, 1, 1, 1, 1, 1,
-0.040403, 0.04110635, -2.818557, 1, 1, 1, 1, 1,
-0.0402763, 1.18713, 0.7567574, 1, 1, 1, 1, 1,
-0.0355304, 0.7196686, -0.5426474, 1, 1, 1, 1, 1,
-0.0307725, 0.4746454, 0.00816919, 0, 0, 1, 1, 1,
-0.0233385, -1.255768, -2.28634, 1, 0, 0, 1, 1,
-0.02226136, -0.1291396, -4.312833, 1, 0, 0, 1, 1,
-0.02197049, 0.1281551, 0.7180479, 1, 0, 0, 1, 1,
-0.01927345, -1.442607, -2.407955, 1, 0, 0, 1, 1,
-0.0177533, 1.874836, 1.952502, 1, 0, 0, 1, 1,
-0.01727628, -0.137284, -4.701809, 0, 0, 0, 1, 1,
-0.01496997, 0.2952488, -1.802765, 0, 0, 0, 1, 1,
-0.01431585, 0.2471046, -0.8620777, 0, 0, 0, 1, 1,
-0.009421152, -0.3930388, -1.088172, 0, 0, 0, 1, 1,
-0.006415391, 0.545432, 0.0339121, 0, 0, 0, 1, 1,
-0.005387937, 1.191267, 0.5962519, 0, 0, 0, 1, 1,
-0.00360043, 1.461909, 0.8220509, 0, 0, 0, 1, 1,
-0.001678483, 1.064965, 0.139039, 1, 1, 1, 1, 1,
0.002112853, -1.202817, 5.276243, 1, 1, 1, 1, 1,
0.0048255, -0.4223782, 3.668731, 1, 1, 1, 1, 1,
0.006220726, -0.271966, 4.470817, 1, 1, 1, 1, 1,
0.007764387, -0.660804, 3.748971, 1, 1, 1, 1, 1,
0.008003964, 1.02318, 0.5004875, 1, 1, 1, 1, 1,
0.01021962, -2.142719, 2.290477, 1, 1, 1, 1, 1,
0.01080543, -1.454379, 2.087349, 1, 1, 1, 1, 1,
0.01110542, 0.04538056, 0.4549983, 1, 1, 1, 1, 1,
0.01116477, -1.120646, 4.832513, 1, 1, 1, 1, 1,
0.01162313, 1.22036, -1.493017, 1, 1, 1, 1, 1,
0.0133582, 0.4376094, -0.7619563, 1, 1, 1, 1, 1,
0.01451244, 0.2491522, 1.637759, 1, 1, 1, 1, 1,
0.01724655, 0.9228014, -0.1235796, 1, 1, 1, 1, 1,
0.01840547, -0.2197177, 1.575413, 1, 1, 1, 1, 1,
0.02262978, 0.8261517, -0.467197, 0, 0, 1, 1, 1,
0.02766362, -0.6797358, 3.241294, 1, 0, 0, 1, 1,
0.02794278, 0.243093, 0.4418136, 1, 0, 0, 1, 1,
0.02903169, -0.05328126, 2.626019, 1, 0, 0, 1, 1,
0.02951841, -0.8031645, 3.264545, 1, 0, 0, 1, 1,
0.03122119, -0.06571101, 4.907382, 1, 0, 0, 1, 1,
0.03182497, 0.1868986, 0.7663097, 0, 0, 0, 1, 1,
0.03383933, 0.163553, 0.2425686, 0, 0, 0, 1, 1,
0.03487795, 1.318589, -2.26195, 0, 0, 0, 1, 1,
0.03557189, -1.372409, 3.249011, 0, 0, 0, 1, 1,
0.03800422, -0.1851172, 4.271795, 0, 0, 0, 1, 1,
0.04078611, -0.9173393, 1.588626, 0, 0, 0, 1, 1,
0.04743122, 0.461953, -1.113419, 0, 0, 0, 1, 1,
0.04792329, 0.001944785, 3.327791, 1, 1, 1, 1, 1,
0.05151139, -1.79277, 1.775274, 1, 1, 1, 1, 1,
0.05256102, -0.7946534, 2.853425, 1, 1, 1, 1, 1,
0.05600471, -0.5735538, 2.093742, 1, 1, 1, 1, 1,
0.05713491, -0.8107721, 2.667693, 1, 1, 1, 1, 1,
0.06293286, -2.010474, 2.266584, 1, 1, 1, 1, 1,
0.0671173, 0.6954191, -0.2888151, 1, 1, 1, 1, 1,
0.06868772, 1.221473, -1.969579, 1, 1, 1, 1, 1,
0.0706865, 0.9720717, 1.923084, 1, 1, 1, 1, 1,
0.0712214, 0.4940235, 1.783716, 1, 1, 1, 1, 1,
0.07199933, -1.266256, 3.087437, 1, 1, 1, 1, 1,
0.07244222, -0.1884653, 3.411445, 1, 1, 1, 1, 1,
0.07736152, -0.2884003, 0.3661453, 1, 1, 1, 1, 1,
0.07806307, -0.4794445, 2.97586, 1, 1, 1, 1, 1,
0.0787109, 0.8438601, -0.7539151, 1, 1, 1, 1, 1,
0.07984006, -0.2201386, 2.448397, 0, 0, 1, 1, 1,
0.08109356, -0.1864532, 0.6617837, 1, 0, 0, 1, 1,
0.08704752, -0.4544526, 4.046454, 1, 0, 0, 1, 1,
0.08710915, 2.034871, 1.643101, 1, 0, 0, 1, 1,
0.08949795, 1.029845, -0.1795291, 1, 0, 0, 1, 1,
0.08998965, -1.655635, 3.801584, 1, 0, 0, 1, 1,
0.09186068, 1.050551, -0.522929, 0, 0, 0, 1, 1,
0.09232277, 1.19539, 0.1352142, 0, 0, 0, 1, 1,
0.09288458, 0.5430523, -0.1629044, 0, 0, 0, 1, 1,
0.09824791, -0.6429275, 2.455024, 0, 0, 0, 1, 1,
0.1014069, 0.6071832, -1.096028, 0, 0, 0, 1, 1,
0.1093998, -0.9287011, 3.852881, 0, 0, 0, 1, 1,
0.1113037, -0.7326851, 4.199707, 0, 0, 0, 1, 1,
0.1121393, -0.8851643, 2.905694, 1, 1, 1, 1, 1,
0.114012, 0.6489874, 1.113883, 1, 1, 1, 1, 1,
0.1178965, -0.8681858, 2.282413, 1, 1, 1, 1, 1,
0.1245198, 0.9309883, 0.8602564, 1, 1, 1, 1, 1,
0.1305967, 0.1429783, 1.087703, 1, 1, 1, 1, 1,
0.1324299, 1.568401, -1.63727, 1, 1, 1, 1, 1,
0.1398312, -1.138785, 3.29759, 1, 1, 1, 1, 1,
0.1417717, 0.1833428, -0.1585873, 1, 1, 1, 1, 1,
0.150707, -0.5831276, 3.776191, 1, 1, 1, 1, 1,
0.1510768, 0.0770813, 2.269889, 1, 1, 1, 1, 1,
0.1534991, -2.40378, 3.803457, 1, 1, 1, 1, 1,
0.1665144, -0.8597808, 3.131106, 1, 1, 1, 1, 1,
0.1693044, 1.239391, 0.4056875, 1, 1, 1, 1, 1,
0.171524, 0.3219959, 0.2882586, 1, 1, 1, 1, 1,
0.1733329, -0.9713543, 3.47444, 1, 1, 1, 1, 1,
0.1745571, 0.6362916, 1.188874, 0, 0, 1, 1, 1,
0.179238, 0.1117022, -0.00138975, 1, 0, 0, 1, 1,
0.1801679, 0.7636327, 1.095422, 1, 0, 0, 1, 1,
0.1808753, -0.2310418, 3.150197, 1, 0, 0, 1, 1,
0.1812288, -0.9226164, 1.365559, 1, 0, 0, 1, 1,
0.182695, -0.1371641, -0.1508872, 1, 0, 0, 1, 1,
0.1983413, 0.487462, 0.6837846, 0, 0, 0, 1, 1,
0.1989573, -0.5219457, 4.798153, 0, 0, 0, 1, 1,
0.2008078, 1.466991, 1.010383, 0, 0, 0, 1, 1,
0.2059442, -0.2651525, 2.226043, 0, 0, 0, 1, 1,
0.2082256, -0.2264079, 4.416063, 0, 0, 0, 1, 1,
0.2095354, -0.624006, 2.636952, 0, 0, 0, 1, 1,
0.2118721, 1.634365, 0.2872193, 0, 0, 0, 1, 1,
0.2127506, -0.3550165, 3.310566, 1, 1, 1, 1, 1,
0.2157332, 0.1695521, 1.09952, 1, 1, 1, 1, 1,
0.2169238, -0.6151506, 2.679403, 1, 1, 1, 1, 1,
0.2186602, -0.3900153, 2.288625, 1, 1, 1, 1, 1,
0.222605, 0.2868474, 0.8080767, 1, 1, 1, 1, 1,
0.2250093, -0.7035881, 3.461645, 1, 1, 1, 1, 1,
0.2260016, -0.7152075, 1.96387, 1, 1, 1, 1, 1,
0.2268314, 0.154611, 2.593954, 1, 1, 1, 1, 1,
0.227325, -0.599818, 2.092466, 1, 1, 1, 1, 1,
0.2287405, 0.1139081, 0.9829422, 1, 1, 1, 1, 1,
0.229171, -0.7895924, 1.42873, 1, 1, 1, 1, 1,
0.2307817, -0.3631584, 1.2557, 1, 1, 1, 1, 1,
0.2343385, 0.5785832, 0.3904667, 1, 1, 1, 1, 1,
0.2360037, -0.3844391, 3.231747, 1, 1, 1, 1, 1,
0.2374045, -1.170515, 3.100414, 1, 1, 1, 1, 1,
0.2408294, 1.132426, -0.330384, 0, 0, 1, 1, 1,
0.2419636, -0.4990807, 2.315528, 1, 0, 0, 1, 1,
0.2517099, -0.3658512, 2.739616, 1, 0, 0, 1, 1,
0.251921, -0.1347643, 1.802355, 1, 0, 0, 1, 1,
0.2544437, -1.095131, 5.461246, 1, 0, 0, 1, 1,
0.2575707, -2.003593, 3.247076, 1, 0, 0, 1, 1,
0.2596453, -0.2415576, 0.3640251, 0, 0, 0, 1, 1,
0.2631083, -0.01433445, 2.208227, 0, 0, 0, 1, 1,
0.2637857, -1.571769, 3.321445, 0, 0, 0, 1, 1,
0.2676518, 0.4549059, 0.6822059, 0, 0, 0, 1, 1,
0.2720816, -0.756057, 2.544171, 0, 0, 0, 1, 1,
0.2739315, -0.3996503, 2.471695, 0, 0, 0, 1, 1,
0.2748185, 1.064658, -1.630957, 0, 0, 0, 1, 1,
0.2784968, 0.0722074, 2.031374, 1, 1, 1, 1, 1,
0.2812494, 0.3807967, 0.4933023, 1, 1, 1, 1, 1,
0.2856199, 0.1918968, 0.9555072, 1, 1, 1, 1, 1,
0.2878109, 0.7032728, 0.6635389, 1, 1, 1, 1, 1,
0.2884874, -0.1625863, 2.300977, 1, 1, 1, 1, 1,
0.2916302, -0.9994686, 3.33076, 1, 1, 1, 1, 1,
0.2961661, 0.7586081, -0.5354987, 1, 1, 1, 1, 1,
0.30197, 1.049474, 2.646742, 1, 1, 1, 1, 1,
0.3047251, 0.2751561, 1.744842, 1, 1, 1, 1, 1,
0.305625, 0.7271111, 1.599668, 1, 1, 1, 1, 1,
0.3062795, -0.2785104, 1.973939, 1, 1, 1, 1, 1,
0.3098743, 0.5061696, 1.405597, 1, 1, 1, 1, 1,
0.3132068, -0.8575256, 4.314433, 1, 1, 1, 1, 1,
0.3142234, -1.211306, 3.110753, 1, 1, 1, 1, 1,
0.3150156, 0.7238941, 0.1658202, 1, 1, 1, 1, 1,
0.3161595, -0.9829432, 3.062838, 0, 0, 1, 1, 1,
0.3226325, -0.3552166, 2.974887, 1, 0, 0, 1, 1,
0.3239338, 1.659743, 0.4491423, 1, 0, 0, 1, 1,
0.3251072, 0.6233005, -0.8417162, 1, 0, 0, 1, 1,
0.327229, -0.6310082, 1.225665, 1, 0, 0, 1, 1,
0.3327173, -0.6582156, 2.180512, 1, 0, 0, 1, 1,
0.334025, -0.2760711, 1.744604, 0, 0, 0, 1, 1,
0.3355991, -2.30091, 2.90257, 0, 0, 0, 1, 1,
0.3378495, -1.183264, 3.106423, 0, 0, 0, 1, 1,
0.3384505, 0.4335087, 0.2218202, 0, 0, 0, 1, 1,
0.3389197, -0.2727822, 2.068834, 0, 0, 0, 1, 1,
0.3421699, 0.2810848, -0.1236115, 0, 0, 0, 1, 1,
0.3466397, 0.1209266, -0.04894007, 0, 0, 0, 1, 1,
0.3479086, -0.3386013, 2.4602, 1, 1, 1, 1, 1,
0.3497438, 1.107373, -0.4594301, 1, 1, 1, 1, 1,
0.3581372, -0.7125843, 2.17195, 1, 1, 1, 1, 1,
0.358166, -0.4364152, 2.888106, 1, 1, 1, 1, 1,
0.3589279, 0.277976, 0.0393261, 1, 1, 1, 1, 1,
0.362208, 0.5608073, 0.4614597, 1, 1, 1, 1, 1,
0.366976, 0.1074403, 1.334212, 1, 1, 1, 1, 1,
0.3739032, -0.8849671, 4.982902, 1, 1, 1, 1, 1,
0.3757406, 1.642748, 2.189038, 1, 1, 1, 1, 1,
0.3770343, -0.7768138, 3.412348, 1, 1, 1, 1, 1,
0.3842126, 0.4424267, -0.6066689, 1, 1, 1, 1, 1,
0.385372, -1.410486, 1.989421, 1, 1, 1, 1, 1,
0.3879305, 0.633642, -0.5386303, 1, 1, 1, 1, 1,
0.3927438, -2.431515, 2.013739, 1, 1, 1, 1, 1,
0.4025521, -0.02911004, 1.991136, 1, 1, 1, 1, 1,
0.4028939, 0.4688006, 0.5647569, 0, 0, 1, 1, 1,
0.4105814, -0.6771371, 3.430234, 1, 0, 0, 1, 1,
0.4159172, 0.3511463, 0.1792741, 1, 0, 0, 1, 1,
0.4167915, 0.08184181, -0.627697, 1, 0, 0, 1, 1,
0.4219694, -0.6875091, 3.01754, 1, 0, 0, 1, 1,
0.4242216, 0.5665808, -1.704291, 1, 0, 0, 1, 1,
0.4249145, 0.7998552, -0.6329377, 0, 0, 0, 1, 1,
0.4306136, 0.03459691, 1.683371, 0, 0, 0, 1, 1,
0.4324473, 0.03919816, 1.820898, 0, 0, 0, 1, 1,
0.4356327, -1.998575, 4.077929, 0, 0, 0, 1, 1,
0.4365881, -0.1928086, 2.631576, 0, 0, 0, 1, 1,
0.438803, 0.2010532, 0.04549215, 0, 0, 0, 1, 1,
0.4411515, -1.238722, 2.502579, 0, 0, 0, 1, 1,
0.445287, 1.043632, -1.473818, 1, 1, 1, 1, 1,
0.4491308, 1.969137, -1.574816, 1, 1, 1, 1, 1,
0.4495481, 1.035612, 2.022598, 1, 1, 1, 1, 1,
0.4531268, -1.365825, 4.443839, 1, 1, 1, 1, 1,
0.4572169, 0.4149719, 0.619009, 1, 1, 1, 1, 1,
0.4589083, 1.136557, -1.168894, 1, 1, 1, 1, 1,
0.4599384, 0.1400564, 1.311045, 1, 1, 1, 1, 1,
0.4641905, -0.08817851, 0.6482403, 1, 1, 1, 1, 1,
0.4675976, 0.09464001, 0.8401579, 1, 1, 1, 1, 1,
0.4763718, 1.153978, -0.4253023, 1, 1, 1, 1, 1,
0.4792297, -1.689759, 0.5476015, 1, 1, 1, 1, 1,
0.4805542, 0.6484266, -0.0891551, 1, 1, 1, 1, 1,
0.4811476, -0.06357037, 1.751315, 1, 1, 1, 1, 1,
0.4835483, -0.154967, 1.741965, 1, 1, 1, 1, 1,
0.4862761, 1.158572, 0.002047466, 1, 1, 1, 1, 1,
0.4882486, 0.3387073, 0.4972236, 0, 0, 1, 1, 1,
0.4898658, -0.6561965, 3.115738, 1, 0, 0, 1, 1,
0.490418, -0.3419661, 2.177018, 1, 0, 0, 1, 1,
0.4936375, 0.1562484, 2.024454, 1, 0, 0, 1, 1,
0.4962195, -0.8149885, 1.778816, 1, 0, 0, 1, 1,
0.4971797, 0.4301839, 1.155701, 1, 0, 0, 1, 1,
0.4971802, -0.5771687, 0.8384647, 0, 0, 0, 1, 1,
0.4972182, 1.600907, -0.6383257, 0, 0, 0, 1, 1,
0.5008547, -1.18135, 1.268842, 0, 0, 0, 1, 1,
0.5053797, 0.003678462, 1.390576, 0, 0, 0, 1, 1,
0.5089392, -0.2478354, 1.630826, 0, 0, 0, 1, 1,
0.5119322, 0.3066787, -1.328598, 0, 0, 0, 1, 1,
0.5159308, 1.551598, -1.270602, 0, 0, 0, 1, 1,
0.5332385, 0.8461977, -0.9075431, 1, 1, 1, 1, 1,
0.5343345, -0.1419544, 1.925221, 1, 1, 1, 1, 1,
0.5464, -0.049991, 0.03096004, 1, 1, 1, 1, 1,
0.5506845, 0.582449, 0.3935423, 1, 1, 1, 1, 1,
0.5516053, 0.3589831, 1.140529, 1, 1, 1, 1, 1,
0.5551995, -0.1713976, 1.607822, 1, 1, 1, 1, 1,
0.5602272, 0.5599861, 0.1037612, 1, 1, 1, 1, 1,
0.5622844, 0.49268, 1.966774, 1, 1, 1, 1, 1,
0.5629459, -0.3953783, 3.913504, 1, 1, 1, 1, 1,
0.5639909, -0.9390851, 3.14275, 1, 1, 1, 1, 1,
0.5655943, 0.6047882, 1.848162, 1, 1, 1, 1, 1,
0.5668087, -0.2903101, 2.195187, 1, 1, 1, 1, 1,
0.5676631, -0.5576541, 1.323081, 1, 1, 1, 1, 1,
0.5694091, -0.6079063, 3.581256, 1, 1, 1, 1, 1,
0.5694262, -0.5120261, 3.395304, 1, 1, 1, 1, 1,
0.5756583, -1.051819, 3.001099, 0, 0, 1, 1, 1,
0.5822006, 1.68275, 1.7417, 1, 0, 0, 1, 1,
0.5842332, 0.9044477, -0.1365155, 1, 0, 0, 1, 1,
0.5863252, -1.112335, 1.575963, 1, 0, 0, 1, 1,
0.587151, -1.074775, 0.9286583, 1, 0, 0, 1, 1,
0.5955507, 1.141578, -0.8665461, 1, 0, 0, 1, 1,
0.5979431, -0.1544118, 1.518483, 0, 0, 0, 1, 1,
0.608102, 0.9578103, 0.2061866, 0, 0, 0, 1, 1,
0.6110391, 0.8571933, 0.1110109, 0, 0, 0, 1, 1,
0.611607, -1.416654, 1.786109, 0, 0, 0, 1, 1,
0.6128991, -1.088895, 3.186891, 0, 0, 0, 1, 1,
0.6166143, -1.862518, 3.18023, 0, 0, 0, 1, 1,
0.6225243, 0.6659209, 0.2571136, 0, 0, 0, 1, 1,
0.6259871, -0.5048978, 0.5824093, 1, 1, 1, 1, 1,
0.6264739, -1.597846, 4.688737, 1, 1, 1, 1, 1,
0.6278098, 0.8340716, 0.4096264, 1, 1, 1, 1, 1,
0.6294725, -0.7524408, 2.383511, 1, 1, 1, 1, 1,
0.6301209, 1.192704, 0.2692984, 1, 1, 1, 1, 1,
0.6347811, -0.5042052, 1.78058, 1, 1, 1, 1, 1,
0.6348352, 0.3071228, 0.09062108, 1, 1, 1, 1, 1,
0.6348703, 0.6335242, 0.5010441, 1, 1, 1, 1, 1,
0.6361544, 0.4947968, 1.035116, 1, 1, 1, 1, 1,
0.639809, 2.008026, -0.1927143, 1, 1, 1, 1, 1,
0.640861, 0.6858867, 0.9274825, 1, 1, 1, 1, 1,
0.6417913, -0.7646989, 3.170756, 1, 1, 1, 1, 1,
0.6443639, -1.993716, 4.45968, 1, 1, 1, 1, 1,
0.6453174, 0.8033753, 1.639336, 1, 1, 1, 1, 1,
0.650269, -0.1702491, 1.83681, 1, 1, 1, 1, 1,
0.6519024, -0.03905934, 0.373127, 0, 0, 1, 1, 1,
0.6531801, 0.1239783, 1.982068, 1, 0, 0, 1, 1,
0.6589931, -1.535645, 3.86955, 1, 0, 0, 1, 1,
0.6627436, -0.109574, 1.91269, 1, 0, 0, 1, 1,
0.6671727, -1.928756, 3.211798, 1, 0, 0, 1, 1,
0.6688056, 0.1628596, 0.9520525, 1, 0, 0, 1, 1,
0.6747627, 0.1327925, 1.425918, 0, 0, 0, 1, 1,
0.6767157, 0.01484906, 1.693246, 0, 0, 0, 1, 1,
0.6768572, 0.4161197, 1.392539, 0, 0, 0, 1, 1,
0.6815493, 0.7207646, 1.839488, 0, 0, 0, 1, 1,
0.6829532, 0.2994281, -0.9061259, 0, 0, 0, 1, 1,
0.6862479, -2.132302, 4.578042, 0, 0, 0, 1, 1,
0.6971204, -0.774362, 4.005114, 0, 0, 0, 1, 1,
0.6976191, -0.7836109, 3.768581, 1, 1, 1, 1, 1,
0.7012644, -0.3581177, 1.426175, 1, 1, 1, 1, 1,
0.7058403, -0.5623707, 2.908166, 1, 1, 1, 1, 1,
0.7094272, -0.3517812, 2.330623, 1, 1, 1, 1, 1,
0.7131526, 0.7202055, 1.162856, 1, 1, 1, 1, 1,
0.7136844, 0.7911643, 1.010266, 1, 1, 1, 1, 1,
0.7148511, -0.9290902, 3.86182, 1, 1, 1, 1, 1,
0.7162576, 0.4551446, -0.3055989, 1, 1, 1, 1, 1,
0.7202231, -1.121261, 1.540774, 1, 1, 1, 1, 1,
0.7221265, -0.3044752, 1.163408, 1, 1, 1, 1, 1,
0.7241222, -1.087102, 2.023574, 1, 1, 1, 1, 1,
0.7251598, 0.3014036, 2.330566, 1, 1, 1, 1, 1,
0.7256927, 2.589242, -0.2201179, 1, 1, 1, 1, 1,
0.7264846, -1.389209, 2.614186, 1, 1, 1, 1, 1,
0.7302568, -0.02030788, 4.345539, 1, 1, 1, 1, 1,
0.7357066, 1.026554, 0.7808893, 0, 0, 1, 1, 1,
0.7385432, -0.8243164, 1.723333, 1, 0, 0, 1, 1,
0.7437927, 1.031108, 1.917088, 1, 0, 0, 1, 1,
0.7439795, 1.069065, 1.941637, 1, 0, 0, 1, 1,
0.7593634, -0.4607977, 0.8641451, 1, 0, 0, 1, 1,
0.7597778, 0.3544973, 0.5310909, 1, 0, 0, 1, 1,
0.7614446, 0.3637675, 0.903137, 0, 0, 0, 1, 1,
0.7614848, -0.3680163, 1.798218, 0, 0, 0, 1, 1,
0.7707404, -1.225462, 2.421576, 0, 0, 0, 1, 1,
0.7750559, 1.076747, 1.0427, 0, 0, 0, 1, 1,
0.7790919, 0.8240792, 0.9977693, 0, 0, 0, 1, 1,
0.7826595, -0.9016567, 2.333275, 0, 0, 0, 1, 1,
0.7861142, -0.8043455, 3.050561, 0, 0, 0, 1, 1,
0.7896413, 1.248533, 0.3155386, 1, 1, 1, 1, 1,
0.79576, 0.5065576, 2.638502, 1, 1, 1, 1, 1,
0.8007519, -0.999484, 3.036158, 1, 1, 1, 1, 1,
0.8010802, 1.464324, 0.09488471, 1, 1, 1, 1, 1,
0.8104929, 2.832576, -1.198262, 1, 1, 1, 1, 1,
0.8141466, 1.243153, 2.372726, 1, 1, 1, 1, 1,
0.8220485, -1.453713, 2.352053, 1, 1, 1, 1, 1,
0.8252185, -0.484524, 1.50601, 1, 1, 1, 1, 1,
0.8311517, -0.1408845, 2.721275, 1, 1, 1, 1, 1,
0.8336365, 0.1198623, 0.8173239, 1, 1, 1, 1, 1,
0.8365273, -0.3142106, 2.494467, 1, 1, 1, 1, 1,
0.8421203, -0.2836021, 2.422085, 1, 1, 1, 1, 1,
0.8465645, 0.14456, 0.8871732, 1, 1, 1, 1, 1,
0.8484486, -0.3710852, 2.38271, 1, 1, 1, 1, 1,
0.8494369, 0.2103499, 0.9389868, 1, 1, 1, 1, 1,
0.850014, -0.566332, 2.046094, 0, 0, 1, 1, 1,
0.8698261, -0.2636473, -0.09438999, 1, 0, 0, 1, 1,
0.872996, -0.4148254, -0.3395453, 1, 0, 0, 1, 1,
0.8736412, 1.254702, 0.02271912, 1, 0, 0, 1, 1,
0.8811506, -0.1280448, 0.5100232, 1, 0, 0, 1, 1,
0.8847516, -0.2948338, 1.118932, 1, 0, 0, 1, 1,
0.8850075, 1.387252, -0.267618, 0, 0, 0, 1, 1,
0.8917928, 1.050112, -0.348107, 0, 0, 0, 1, 1,
0.8948166, 0.8241518, 0.8143411, 0, 0, 0, 1, 1,
0.8971758, -1.161177, 2.749639, 0, 0, 0, 1, 1,
0.9029902, 0.8581002, 0.3351442, 0, 0, 0, 1, 1,
0.9109744, -0.09032726, 1.443882, 0, 0, 0, 1, 1,
0.9221249, -1.147613, 1.886329, 0, 0, 0, 1, 1,
0.9241948, 1.69456, -0.7082673, 1, 1, 1, 1, 1,
0.9248436, 0.6141233, -0.02968678, 1, 1, 1, 1, 1,
0.9259366, 0.4081672, 0.9302797, 1, 1, 1, 1, 1,
0.9345134, 0.2025934, 1.03256, 1, 1, 1, 1, 1,
0.9378198, -1.72364, 3.705317, 1, 1, 1, 1, 1,
0.9421599, -0.715868, 3.289172, 1, 1, 1, 1, 1,
0.9529769, -1.244517, 1.744634, 1, 1, 1, 1, 1,
0.9654558, -0.3842545, 1.391509, 1, 1, 1, 1, 1,
0.966414, -0.7468491, 3.543716, 1, 1, 1, 1, 1,
0.9768711, -0.7314627, 2.902522, 1, 1, 1, 1, 1,
0.9846839, 0.4380507, 1.048346, 1, 1, 1, 1, 1,
0.9917361, 1.192226, -0.1998153, 1, 1, 1, 1, 1,
0.9965832, 0.2286063, 1.318551, 1, 1, 1, 1, 1,
0.9981483, 0.3436004, 0.8681807, 1, 1, 1, 1, 1,
1.003257, -1.707569, 2.775459, 1, 1, 1, 1, 1,
1.007903, 1.808561, 0.8735135, 0, 0, 1, 1, 1,
1.010102, -1.026065, 2.726668, 1, 0, 0, 1, 1,
1.013043, 0.7643626, 1.763084, 1, 0, 0, 1, 1,
1.01405, 0.6484337, 1.505026, 1, 0, 0, 1, 1,
1.019921, -1.783702, 2.179712, 1, 0, 0, 1, 1,
1.020432, -2.070943, 4.314332, 1, 0, 0, 1, 1,
1.028834, -0.803434, 3.782402, 0, 0, 0, 1, 1,
1.032429, -0.2433785, 0.8474745, 0, 0, 0, 1, 1,
1.032922, -0.5780005, 0.8256494, 0, 0, 0, 1, 1,
1.033011, -0.6868209, 1.826769, 0, 0, 0, 1, 1,
1.035828, -0.7860141, 2.495442, 0, 0, 0, 1, 1,
1.04663, -0.5397313, 1.508948, 0, 0, 0, 1, 1,
1.047335, -1.537311, 2.371882, 0, 0, 0, 1, 1,
1.063795, 1.214858, 1.715816, 1, 1, 1, 1, 1,
1.067459, -1.094634, 2.382291, 1, 1, 1, 1, 1,
1.070264, -0.8898498, 2.600532, 1, 1, 1, 1, 1,
1.071772, -0.803719, 2.674358, 1, 1, 1, 1, 1,
1.080206, -0.8201162, 2.313238, 1, 1, 1, 1, 1,
1.082658, 0.2267595, 1.328819, 1, 1, 1, 1, 1,
1.082911, -1.530563, 3.47941, 1, 1, 1, 1, 1,
1.084671, -1.812172, 4.483902, 1, 1, 1, 1, 1,
1.09387, -0.8331035, 2.610957, 1, 1, 1, 1, 1,
1.098335, -0.8808766, 1.241492, 1, 1, 1, 1, 1,
1.10112, -0.9463792, 0.1374529, 1, 1, 1, 1, 1,
1.103607, -1.134578, 1.940953, 1, 1, 1, 1, 1,
1.107585, -0.3051838, 1.007909, 1, 1, 1, 1, 1,
1.108925, -0.3571743, 1.480983, 1, 1, 1, 1, 1,
1.109239, -0.6722702, 3.847067, 1, 1, 1, 1, 1,
1.120378, -1.840655, 4.097333, 0, 0, 1, 1, 1,
1.122172, 1.176111, 2.660081, 1, 0, 0, 1, 1,
1.124915, -1.980743, 2.127571, 1, 0, 0, 1, 1,
1.136281, -0.2964746, 0.03504307, 1, 0, 0, 1, 1,
1.142711, -1.862396, 3.686855, 1, 0, 0, 1, 1,
1.152729, -1.362733, 0.5694168, 1, 0, 0, 1, 1,
1.153663, 0.4588838, 1.032541, 0, 0, 0, 1, 1,
1.154884, -0.02571473, 2.890783, 0, 0, 0, 1, 1,
1.15824, 0.4591789, 1.299745, 0, 0, 0, 1, 1,
1.161857, -0.5407757, 0.8096042, 0, 0, 0, 1, 1,
1.162187, -0.4812961, 1.13131, 0, 0, 0, 1, 1,
1.169817, 1.82454, 1.199491, 0, 0, 0, 1, 1,
1.173305, -0.08691242, 0.896021, 0, 0, 0, 1, 1,
1.178617, 0.6509514, 0.7213578, 1, 1, 1, 1, 1,
1.186834, -0.05021749, 1.861897, 1, 1, 1, 1, 1,
1.187368, 3.495251, -0.1502933, 1, 1, 1, 1, 1,
1.188539, 0.1725738, 1.805841, 1, 1, 1, 1, 1,
1.193035, -2.378875, 1.895076, 1, 1, 1, 1, 1,
1.201601, -0.3250975, 1.833561, 1, 1, 1, 1, 1,
1.210506, -1.175784, 1.927882, 1, 1, 1, 1, 1,
1.211112, -0.5431041, 2.38377, 1, 1, 1, 1, 1,
1.212211, -0.3692623, 1.158696, 1, 1, 1, 1, 1,
1.221252, -0.8975572, 1.332333, 1, 1, 1, 1, 1,
1.225414, 1.307235, 1.335715, 1, 1, 1, 1, 1,
1.23756, -0.2444893, 2.382011, 1, 1, 1, 1, 1,
1.238341, 1.518096, 3.043104, 1, 1, 1, 1, 1,
1.240833, -0.5770733, 2.089921, 1, 1, 1, 1, 1,
1.241693, -0.1110468, 1.554018, 1, 1, 1, 1, 1,
1.242395, -0.3620492, 1.601968, 0, 0, 1, 1, 1,
1.246449, 2.409818, 0.5316311, 1, 0, 0, 1, 1,
1.24823, 0.8167527, 1.806298, 1, 0, 0, 1, 1,
1.248994, -1.085732, 2.813838, 1, 0, 0, 1, 1,
1.252059, 1.269127, 0.591669, 1, 0, 0, 1, 1,
1.255003, 0.05753091, 2.356614, 1, 0, 0, 1, 1,
1.266389, 0.9082378, 0.8764185, 0, 0, 0, 1, 1,
1.272619, -0.8207888, 2.070538, 0, 0, 0, 1, 1,
1.278202, 1.194398, 0.5922903, 0, 0, 0, 1, 1,
1.281358, -2.588314, 3.760556, 0, 0, 0, 1, 1,
1.281668, -1.846665, 2.844442, 0, 0, 0, 1, 1,
1.287439, -0.8910908, 2.487861, 0, 0, 0, 1, 1,
1.300233, -0.5941924, 1.057938, 0, 0, 0, 1, 1,
1.322916, -0.3810541, 2.619493, 1, 1, 1, 1, 1,
1.331804, 1.814529, 0.3750624, 1, 1, 1, 1, 1,
1.334013, -1.573929, 2.970954, 1, 1, 1, 1, 1,
1.339253, -0.3267955, 2.141637, 1, 1, 1, 1, 1,
1.346412, 0.2704968, 0.357005, 1, 1, 1, 1, 1,
1.349352, 0.5065379, -0.04644079, 1, 1, 1, 1, 1,
1.353808, -0.5280445, 3.48691, 1, 1, 1, 1, 1,
1.356594, -0.645672, 0.6924399, 1, 1, 1, 1, 1,
1.356727, 0.1485692, 2.552585, 1, 1, 1, 1, 1,
1.366194, 1.193054, 1.041716, 1, 1, 1, 1, 1,
1.367962, 0.3327318, 1.037744, 1, 1, 1, 1, 1,
1.408988, -0.4063442, 2.169936, 1, 1, 1, 1, 1,
1.420809, -0.4484124, 1.221586, 1, 1, 1, 1, 1,
1.422784, 0.3575429, 1.925782, 1, 1, 1, 1, 1,
1.428424, 0.2541455, 0.07672793, 1, 1, 1, 1, 1,
1.45717, 1.250039, 2.079054, 0, 0, 1, 1, 1,
1.459652, -0.3549664, 1.206177, 1, 0, 0, 1, 1,
1.465965, 0.6441906, 2.341145, 1, 0, 0, 1, 1,
1.468656, -0.342025, 1.619812, 1, 0, 0, 1, 1,
1.469609, -1.341081, 4.373016, 1, 0, 0, 1, 1,
1.470578, -1.203438, 2.112375, 1, 0, 0, 1, 1,
1.477492, 0.4344389, 0.4582869, 0, 0, 0, 1, 1,
1.490004, -0.9414864, 1.218373, 0, 0, 0, 1, 1,
1.492367, -0.6739683, 2.18709, 0, 0, 0, 1, 1,
1.511289, 1.274005, 2.10898, 0, 0, 0, 1, 1,
1.513401, -0.09391824, 1.704736, 0, 0, 0, 1, 1,
1.522348, -1.541949, -0.3901378, 0, 0, 0, 1, 1,
1.526014, 0.8700304, 0.06302191, 0, 0, 0, 1, 1,
1.536434, -1.361135, 2.859946, 1, 1, 1, 1, 1,
1.537374, 0.4826172, 0.6606409, 1, 1, 1, 1, 1,
1.538792, -1.078736, 1.681242, 1, 1, 1, 1, 1,
1.543383, 0.07011331, 2.661045, 1, 1, 1, 1, 1,
1.551166, -1.898023, 2.468957, 1, 1, 1, 1, 1,
1.583322, 0.6006187, 0.2364786, 1, 1, 1, 1, 1,
1.587887, 1.490044, -0.4379837, 1, 1, 1, 1, 1,
1.589036, 0.7585807, 0.9348068, 1, 1, 1, 1, 1,
1.591203, -0.5202596, 2.24534, 1, 1, 1, 1, 1,
1.603352, 1.772585, 0.06905226, 1, 1, 1, 1, 1,
1.609134, -0.9996223, 3.457643, 1, 1, 1, 1, 1,
1.622564, 1.386736, 2.337465, 1, 1, 1, 1, 1,
1.624825, -1.233958, 2.281038, 1, 1, 1, 1, 1,
1.631172, -0.3205947, 0.7067361, 1, 1, 1, 1, 1,
1.632893, -0.8831773, 3.061055, 1, 1, 1, 1, 1,
1.632912, 0.6858357, 0.8606079, 0, 0, 1, 1, 1,
1.636409, 1.64976, -0.1727065, 1, 0, 0, 1, 1,
1.646241, -0.1279278, 0.2970232, 1, 0, 0, 1, 1,
1.651136, 0.7825052, 1.330297, 1, 0, 0, 1, 1,
1.658302, 0.3605093, -0.02607862, 1, 0, 0, 1, 1,
1.677429, 1.163737, -0.8093975, 1, 0, 0, 1, 1,
1.71896, 1.949614, 1.30604, 0, 0, 0, 1, 1,
1.724175, -0.2295908, 1.973396, 0, 0, 0, 1, 1,
1.729227, -0.1320768, 0.932221, 0, 0, 0, 1, 1,
1.729383, 0.3642972, 1.338157, 0, 0, 0, 1, 1,
1.736828, -1.49647, 2.440953, 0, 0, 0, 1, 1,
1.739552, -0.3635508, 2.859655, 0, 0, 0, 1, 1,
1.759509, -0.118848, 2.317713, 0, 0, 0, 1, 1,
1.790155, -0.7897894, 1.026951, 1, 1, 1, 1, 1,
1.814731, 0.2803439, 1.270816, 1, 1, 1, 1, 1,
1.815004, 0.2957308, 2.058555, 1, 1, 1, 1, 1,
1.822077, -1.219479, 1.111055, 1, 1, 1, 1, 1,
1.844473, -0.03338798, 1.114311, 1, 1, 1, 1, 1,
1.853776, 0.3275551, 1.771404, 1, 1, 1, 1, 1,
1.876688, -0.2026679, 1.449012, 1, 1, 1, 1, 1,
1.880602, 0.197531, 0.5930707, 1, 1, 1, 1, 1,
1.906572, -0.57283, 4.6456, 1, 1, 1, 1, 1,
1.907641, -0.1736431, 2.606784, 1, 1, 1, 1, 1,
1.912268, 0.8671429, 1.366226, 1, 1, 1, 1, 1,
1.917881, -0.677918, 1.384051, 1, 1, 1, 1, 1,
1.923775, -1.127905, 2.309497, 1, 1, 1, 1, 1,
1.98515, -0.6778998, 2.411966, 1, 1, 1, 1, 1,
1.992607, 0.3082387, 0.6082408, 1, 1, 1, 1, 1,
2.026266, 0.9182732, 0.8385219, 0, 0, 1, 1, 1,
2.037393, -0.6725103, 2.569416, 1, 0, 0, 1, 1,
2.059407, -0.08674853, 3.15034, 1, 0, 0, 1, 1,
2.068865, -1.351488, 0.4838061, 1, 0, 0, 1, 1,
2.110768, -1.522051, 2.711705, 1, 0, 0, 1, 1,
2.112021, 0.2409115, 1.84551, 1, 0, 0, 1, 1,
2.178316, 1.45871, -0.8464441, 0, 0, 0, 1, 1,
2.215655, 0.1901045, 1.639327, 0, 0, 0, 1, 1,
2.21758, -0.9461682, 2.386342, 0, 0, 0, 1, 1,
2.24471, 2.032877, 0.2285763, 0, 0, 0, 1, 1,
2.328006, -0.5880906, 1.953399, 0, 0, 0, 1, 1,
2.349805, -1.500694, 2.657154, 0, 0, 0, 1, 1,
2.360987, 0.77794, 1.670664, 0, 0, 0, 1, 1,
2.425849, 0.7868956, 0.6372371, 1, 1, 1, 1, 1,
2.47206, -1.757187, 3.873764, 1, 1, 1, 1, 1,
2.507886, -0.6886948, 1.833623, 1, 1, 1, 1, 1,
2.543512, 0.206423, 3.11416, 1, 1, 1, 1, 1,
2.543917, -0.08961562, 1.60419, 1, 1, 1, 1, 1,
2.59784, -1.656317, 2.322818, 1, 1, 1, 1, 1,
2.616777, 0.4416763, -0.1932828, 1, 1, 1, 1, 1
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
var radius = 9.789651;
var distance = 34.38573;
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
mvMatrix.translate( 0.3783873, -0.3557429, 0.3290033 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.38573);
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
