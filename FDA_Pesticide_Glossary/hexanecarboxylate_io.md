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
-2.88117, -1.13438, -1.243305, 1, 0, 0, 1,
-2.735855, -0.5165333, -1.516742, 1, 0.007843138, 0, 1,
-2.711473, -0.1883483, -2.620103, 1, 0.01176471, 0, 1,
-2.656722, -0.1044624, -2.03939, 1, 0.01960784, 0, 1,
-2.588311, 0.8052094, -2.222039, 1, 0.02352941, 0, 1,
-2.513885, 0.481941, -2.662349, 1, 0.03137255, 0, 1,
-2.477381, -0.1119575, -1.777165, 1, 0.03529412, 0, 1,
-2.414434, -0.4638088, -1.114872, 1, 0.04313726, 0, 1,
-2.402456, 0.1476933, -1.140926, 1, 0.04705882, 0, 1,
-2.379132, -1.516169, -1.804933, 1, 0.05490196, 0, 1,
-2.369906, 0.1752006, -1.007733, 1, 0.05882353, 0, 1,
-2.167613, -0.1461055, -0.8080661, 1, 0.06666667, 0, 1,
-2.146785, -1.168591, -2.227749, 1, 0.07058824, 0, 1,
-2.12857, -1.393459, -3.211015, 1, 0.07843138, 0, 1,
-2.081902, 0.4011684, -1.465884, 1, 0.08235294, 0, 1,
-2.081309, 0.1517334, 0.4614427, 1, 0.09019608, 0, 1,
-2.067733, 0.5837356, -0.8280095, 1, 0.09411765, 0, 1,
-2.057518, 2.583795, -0.1922756, 1, 0.1019608, 0, 1,
-1.995196, 0.05561405, 1.372881, 1, 0.1098039, 0, 1,
-1.994851, -0.211797, -1.098284, 1, 0.1137255, 0, 1,
-1.970745, -1.108287, -1.00937, 1, 0.1215686, 0, 1,
-1.970612, 0.806577, -2.147023, 1, 0.1254902, 0, 1,
-1.966228, -1.066216, -2.437873, 1, 0.1333333, 0, 1,
-1.955734, 0.8490633, -1.786369, 1, 0.1372549, 0, 1,
-1.9174, 0.1069338, -1.143534, 1, 0.145098, 0, 1,
-1.916891, -0.546127, -2.665203, 1, 0.1490196, 0, 1,
-1.900711, 1.538857, -1.584359, 1, 0.1568628, 0, 1,
-1.88712, 0.245595, -2.531226, 1, 0.1607843, 0, 1,
-1.886592, -0.1634733, -3.14233, 1, 0.1686275, 0, 1,
-1.878042, 1.940173, 1.046548, 1, 0.172549, 0, 1,
-1.853829, 0.1025305, -2.351797, 1, 0.1803922, 0, 1,
-1.838231, -0.8969954, -2.367601, 1, 0.1843137, 0, 1,
-1.825329, -1.113482, 0.100954, 1, 0.1921569, 0, 1,
-1.805771, 2.186331, -0.6883566, 1, 0.1960784, 0, 1,
-1.770481, -1.109376, -4.375721, 1, 0.2039216, 0, 1,
-1.760824, 0.2744329, -1.362664, 1, 0.2117647, 0, 1,
-1.745586, 1.655214, -1.045696, 1, 0.2156863, 0, 1,
-1.739043, -0.2518122, -2.185645, 1, 0.2235294, 0, 1,
-1.738017, 0.2799457, -0.7200707, 1, 0.227451, 0, 1,
-1.733499, 0.2858611, -0.9334984, 1, 0.2352941, 0, 1,
-1.732775, -0.2255837, -2.652409, 1, 0.2392157, 0, 1,
-1.732749, 0.5351483, -1.052278, 1, 0.2470588, 0, 1,
-1.729059, 1.077645, -0.8217854, 1, 0.2509804, 0, 1,
-1.725559, 1.354685, -0.9757172, 1, 0.2588235, 0, 1,
-1.710561, -1.107744, -1.834266, 1, 0.2627451, 0, 1,
-1.685685, -0.8345308, -1.404313, 1, 0.2705882, 0, 1,
-1.665636, -1.45767, -2.640891, 1, 0.2745098, 0, 1,
-1.66506, 0.1155411, -2.178843, 1, 0.282353, 0, 1,
-1.642593, -0.4469477, -1.839881, 1, 0.2862745, 0, 1,
-1.640735, 0.7111349, 1.273878, 1, 0.2941177, 0, 1,
-1.638777, -1.42091, -0.5369452, 1, 0.3019608, 0, 1,
-1.635457, 0.2704138, -0.05925607, 1, 0.3058824, 0, 1,
-1.634454, -0.8947888, -1.846336, 1, 0.3137255, 0, 1,
-1.631383, -1.518667, -3.018094, 1, 0.3176471, 0, 1,
-1.598529, -0.1800044, -3.430431, 1, 0.3254902, 0, 1,
-1.593415, 1.312086, -0.3356006, 1, 0.3294118, 0, 1,
-1.561648, -2.413523, -2.74844, 1, 0.3372549, 0, 1,
-1.530363, 0.7685551, -2.612687, 1, 0.3411765, 0, 1,
-1.523553, 1.198267, -1.504697, 1, 0.3490196, 0, 1,
-1.523346, -0.8566605, -2.46177, 1, 0.3529412, 0, 1,
-1.512392, 1.036951, -2.778319, 1, 0.3607843, 0, 1,
-1.501428, -0.3778498, -3.970482, 1, 0.3647059, 0, 1,
-1.480142, -0.5166479, -1.925785, 1, 0.372549, 0, 1,
-1.468831, 0.1896463, -2.137593, 1, 0.3764706, 0, 1,
-1.465551, 0.3448606, -3.152515, 1, 0.3843137, 0, 1,
-1.458105, -0.01852355, -2.283476, 1, 0.3882353, 0, 1,
-1.44736, 0.7480591, -0.7577512, 1, 0.3960784, 0, 1,
-1.447273, 1.225344, 0.2151277, 1, 0.4039216, 0, 1,
-1.443478, 1.561255, -0.1741682, 1, 0.4078431, 0, 1,
-1.430991, 3.341596, -1.175067, 1, 0.4156863, 0, 1,
-1.427029, 0.321905, -1.917768, 1, 0.4196078, 0, 1,
-1.415143, 0.188257, -0.7183868, 1, 0.427451, 0, 1,
-1.41317, -0.9593722, -2.374479, 1, 0.4313726, 0, 1,
-1.40389, 0.09507683, -2.900383, 1, 0.4392157, 0, 1,
-1.402837, 0.8052362, -0.9547516, 1, 0.4431373, 0, 1,
-1.401336, -0.9043521, -3.029276, 1, 0.4509804, 0, 1,
-1.40094, 1.630431, 0.04684679, 1, 0.454902, 0, 1,
-1.397933, 1.114595, -0.6232798, 1, 0.4627451, 0, 1,
-1.39219, 1.417591, -0.3432124, 1, 0.4666667, 0, 1,
-1.369119, -1.627994, -1.905118, 1, 0.4745098, 0, 1,
-1.364691, -0.5243425, -2.294113, 1, 0.4784314, 0, 1,
-1.363104, -0.06035825, -1.074716, 1, 0.4862745, 0, 1,
-1.360415, -1.060512, -2.322452, 1, 0.4901961, 0, 1,
-1.359993, -0.3635401, -0.986626, 1, 0.4980392, 0, 1,
-1.355506, 1.263129, -1.351074, 1, 0.5058824, 0, 1,
-1.343715, -2.09849, -1.248271, 1, 0.509804, 0, 1,
-1.340585, -0.373271, -1.397522, 1, 0.5176471, 0, 1,
-1.306689, -2.384485, -3.458668, 1, 0.5215687, 0, 1,
-1.305503, -0.2722325, -1.976516, 1, 0.5294118, 0, 1,
-1.292116, -1.499798, -2.149935, 1, 0.5333334, 0, 1,
-1.286983, -0.9408391, -3.494021, 1, 0.5411765, 0, 1,
-1.275955, -2.266512, -2.875776, 1, 0.5450981, 0, 1,
-1.275033, 0.005068762, -1.180175, 1, 0.5529412, 0, 1,
-1.271866, -0.5998025, -2.79073, 1, 0.5568628, 0, 1,
-1.271097, -0.2604725, -1.287444, 1, 0.5647059, 0, 1,
-1.264628, -1.370019, -2.44337, 1, 0.5686275, 0, 1,
-1.260405, 0.08987772, -0.5371616, 1, 0.5764706, 0, 1,
-1.256109, 1.000754, -1.245521, 1, 0.5803922, 0, 1,
-1.25535, 0.2803442, -0.8414768, 1, 0.5882353, 0, 1,
-1.247881, -0.4681759, -1.878539, 1, 0.5921569, 0, 1,
-1.24099, 0.6903314, -0.8542561, 1, 0.6, 0, 1,
-1.22833, 2.161685, -0.566438, 1, 0.6078432, 0, 1,
-1.228076, -0.1244606, -1.399943, 1, 0.6117647, 0, 1,
-1.227879, 0.1700851, -1.665098, 1, 0.6196079, 0, 1,
-1.223834, -0.1193475, -3.184254, 1, 0.6235294, 0, 1,
-1.202903, -1.257043, -1.003306, 1, 0.6313726, 0, 1,
-1.19714, 0.9012608, -0.1868784, 1, 0.6352941, 0, 1,
-1.194976, -0.1323311, -1.983887, 1, 0.6431373, 0, 1,
-1.191418, -0.6907168, -2.271795, 1, 0.6470588, 0, 1,
-1.185665, -0.6891789, -3.52627, 1, 0.654902, 0, 1,
-1.185595, 0.5899724, -3.845748, 1, 0.6588235, 0, 1,
-1.182016, -0.1632718, -0.2485055, 1, 0.6666667, 0, 1,
-1.178287, 0.412412, -0.4727458, 1, 0.6705883, 0, 1,
-1.168989, -1.553357, -2.700244, 1, 0.6784314, 0, 1,
-1.16494, 0.9419953, -2.104584, 1, 0.682353, 0, 1,
-1.160717, -0.9519873, -1.383663, 1, 0.6901961, 0, 1,
-1.160306, 1.397414, -1.03237, 1, 0.6941177, 0, 1,
-1.157479, 0.1913385, -1.020265, 1, 0.7019608, 0, 1,
-1.155186, 0.4675025, -2.349556, 1, 0.7098039, 0, 1,
-1.149352, 1.518147, -0.2846497, 1, 0.7137255, 0, 1,
-1.146127, -1.122723, -2.301669, 1, 0.7215686, 0, 1,
-1.144811, 1.573504, -1.991282, 1, 0.7254902, 0, 1,
-1.143758, -0.6198343, -3.013194, 1, 0.7333333, 0, 1,
-1.14268, -0.5133205, -1.299773, 1, 0.7372549, 0, 1,
-1.14266, -1.024686, -5.169937, 1, 0.7450981, 0, 1,
-1.139559, 0.05902431, -2.692783, 1, 0.7490196, 0, 1,
-1.139518, 0.0733725, 0.329061, 1, 0.7568628, 0, 1,
-1.136764, -0.8226974, -1.517421, 1, 0.7607843, 0, 1,
-1.136752, -2.725466, -2.420923, 1, 0.7686275, 0, 1,
-1.132821, 0.6897557, 0.1254734, 1, 0.772549, 0, 1,
-1.132327, 0.9608848, -1.188871, 1, 0.7803922, 0, 1,
-1.129262, 0.5171627, -0.9469598, 1, 0.7843137, 0, 1,
-1.127275, -1.788023, -4.533654, 1, 0.7921569, 0, 1,
-1.126316, 0.5903857, -2.894013, 1, 0.7960784, 0, 1,
-1.122422, 0.3201095, -2.798824, 1, 0.8039216, 0, 1,
-1.112871, -0.4544311, -0.4288909, 1, 0.8117647, 0, 1,
-1.112178, 1.821283, -0.5473816, 1, 0.8156863, 0, 1,
-1.107864, -1.226276, -2.354661, 1, 0.8235294, 0, 1,
-1.10548, 1.956772, -0.3643346, 1, 0.827451, 0, 1,
-1.104627, 2.633497, 0.6621717, 1, 0.8352941, 0, 1,
-1.10202, 0.9218155, -2.059252, 1, 0.8392157, 0, 1,
-1.101385, 0.04439097, -0.9667488, 1, 0.8470588, 0, 1,
-1.084383, -0.2435375, -2.024729, 1, 0.8509804, 0, 1,
-1.082029, 1.391779, -0.4836133, 1, 0.8588235, 0, 1,
-1.079818, 0.277043, 0.2058478, 1, 0.8627451, 0, 1,
-1.078604, 0.843372, -1.091903, 1, 0.8705882, 0, 1,
-1.077141, 1.090872, -1.021052, 1, 0.8745098, 0, 1,
-1.071873, 0.1801646, -1.422209, 1, 0.8823529, 0, 1,
-1.070733, 1.218102, -0.9678378, 1, 0.8862745, 0, 1,
-1.070695, -1.472541, -1.452545, 1, 0.8941177, 0, 1,
-1.064, 0.1715872, -1.008563, 1, 0.8980392, 0, 1,
-1.06273, -1.380286, -2.019861, 1, 0.9058824, 0, 1,
-1.05776, -0.8320838, -3.097777, 1, 0.9137255, 0, 1,
-1.05703, -2.332387, -2.442694, 1, 0.9176471, 0, 1,
-1.053638, 0.3827577, -1.382562, 1, 0.9254902, 0, 1,
-1.044542, -0.4774782, -1.983428, 1, 0.9294118, 0, 1,
-1.036461, -1.226328, -4.186064, 1, 0.9372549, 0, 1,
-1.036301, -1.82446, -1.769364, 1, 0.9411765, 0, 1,
-1.028224, -0.1852443, -3.14173, 1, 0.9490196, 0, 1,
-1.021603, -0.822148, -2.401339, 1, 0.9529412, 0, 1,
-1.018535, 0.8093436, 0.1087655, 1, 0.9607843, 0, 1,
-1.018094, 1.420958, -1.11181, 1, 0.9647059, 0, 1,
-1.016174, -0.3373486, -2.71528, 1, 0.972549, 0, 1,
-1.015549, -1.765023, -2.451374, 1, 0.9764706, 0, 1,
-0.9955257, -1.895612, -2.902849, 1, 0.9843137, 0, 1,
-0.9946629, -1.705803, -3.259953, 1, 0.9882353, 0, 1,
-0.9862759, -0.7625645, -2.693272, 1, 0.9960784, 0, 1,
-0.979614, -0.9400293, -3.638991, 0.9960784, 1, 0, 1,
-0.9642856, 2.082879, -1.324215, 0.9921569, 1, 0, 1,
-0.9622745, 0.1612432, -0.9660605, 0.9843137, 1, 0, 1,
-0.9621044, -0.6427881, -2.130552, 0.9803922, 1, 0, 1,
-0.9620374, 0.7780285, -1.922493, 0.972549, 1, 0, 1,
-0.9603693, 0.4846624, -0.870239, 0.9686275, 1, 0, 1,
-0.9566426, -1.117299, -3.435932, 0.9607843, 1, 0, 1,
-0.9538468, -1.160378, -2.460833, 0.9568627, 1, 0, 1,
-0.9534412, -0.3044737, -0.5140725, 0.9490196, 1, 0, 1,
-0.9457923, 1.399041, -0.6634216, 0.945098, 1, 0, 1,
-0.9439197, 1.571573, -1.908919, 0.9372549, 1, 0, 1,
-0.9435558, -0.04783112, 0.1159623, 0.9333333, 1, 0, 1,
-0.9303489, 1.211846, -1.950732, 0.9254902, 1, 0, 1,
-0.9302183, -0.5966536, -4.062973, 0.9215686, 1, 0, 1,
-0.9255833, -0.2386792, -1.31915, 0.9137255, 1, 0, 1,
-0.9216916, 0.7263216, -0.8938259, 0.9098039, 1, 0, 1,
-0.91831, 0.4823197, -1.876672, 0.9019608, 1, 0, 1,
-0.9154677, -0.2645438, -2.508575, 0.8941177, 1, 0, 1,
-0.9115769, 0.7491111, -2.964286, 0.8901961, 1, 0, 1,
-0.905692, -0.9381102, -4.047299, 0.8823529, 1, 0, 1,
-0.8955694, -0.3527384, -1.415971, 0.8784314, 1, 0, 1,
-0.8922158, 1.013942, -1.155257, 0.8705882, 1, 0, 1,
-0.8859242, 0.9495273, 0.06321076, 0.8666667, 1, 0, 1,
-0.8756604, -0.6511186, 0.292691, 0.8588235, 1, 0, 1,
-0.873116, -0.9007872, -2.841513, 0.854902, 1, 0, 1,
-0.8657845, 2.389089, -1.245629, 0.8470588, 1, 0, 1,
-0.8648355, -0.1343756, -2.549102, 0.8431373, 1, 0, 1,
-0.864324, 0.4474639, 0.2210606, 0.8352941, 1, 0, 1,
-0.8626345, -0.5282969, -3.129529, 0.8313726, 1, 0, 1,
-0.861864, -0.396413, -2.434469, 0.8235294, 1, 0, 1,
-0.8611323, -0.04587223, -1.369727, 0.8196079, 1, 0, 1,
-0.8528402, -0.04433553, -1.146263, 0.8117647, 1, 0, 1,
-0.8509499, 1.330716, -2.257844, 0.8078431, 1, 0, 1,
-0.8439993, 1.086836, 0.6407415, 0.8, 1, 0, 1,
-0.8374789, 0.2043986, -2.241839, 0.7921569, 1, 0, 1,
-0.815643, -0.4202422, -1.999137, 0.7882353, 1, 0, 1,
-0.8136749, -1.335763, -0.7641356, 0.7803922, 1, 0, 1,
-0.8136424, -0.1273359, -2.068851, 0.7764706, 1, 0, 1,
-0.8135092, -0.2428116, -1.526014, 0.7686275, 1, 0, 1,
-0.8062959, 1.845052, 0.08180434, 0.7647059, 1, 0, 1,
-0.8058105, -0.9809889, -1.199978, 0.7568628, 1, 0, 1,
-0.8045802, 0.715134, -1.027366, 0.7529412, 1, 0, 1,
-0.7906443, -0.9928859, -2.958731, 0.7450981, 1, 0, 1,
-0.7900282, -0.7678848, -1.694068, 0.7411765, 1, 0, 1,
-0.7842678, -1.23472, -3.847805, 0.7333333, 1, 0, 1,
-0.7800968, -1.406135, -2.584234, 0.7294118, 1, 0, 1,
-0.7725475, 0.5309507, -1.690373, 0.7215686, 1, 0, 1,
-0.765926, 0.7528684, -0.973692, 0.7176471, 1, 0, 1,
-0.765614, -1.393258, -1.407563, 0.7098039, 1, 0, 1,
-0.7628495, 0.2896724, -0.7739023, 0.7058824, 1, 0, 1,
-0.7617285, -0.1155018, -1.136867, 0.6980392, 1, 0, 1,
-0.7607515, 1.74147, -0.7627183, 0.6901961, 1, 0, 1,
-0.7596483, 0.7674548, -1.120529, 0.6862745, 1, 0, 1,
-0.7574451, -0.7242012, -1.78419, 0.6784314, 1, 0, 1,
-0.7540358, -0.6785873, -1.961168, 0.6745098, 1, 0, 1,
-0.749059, -0.4301865, -1.940199, 0.6666667, 1, 0, 1,
-0.7456352, 0.6392441, -0.210757, 0.6627451, 1, 0, 1,
-0.7442578, 0.629823, -1.485059, 0.654902, 1, 0, 1,
-0.7438053, 1.307472, 0.2432899, 0.6509804, 1, 0, 1,
-0.7431629, 0.4286261, -0.9371831, 0.6431373, 1, 0, 1,
-0.7416146, -0.9436858, -2.028705, 0.6392157, 1, 0, 1,
-0.7393336, 0.1278648, -4.475237, 0.6313726, 1, 0, 1,
-0.7381282, -0.636671, -0.6021004, 0.627451, 1, 0, 1,
-0.7344801, 0.9596018, 0.6368592, 0.6196079, 1, 0, 1,
-0.7343704, 0.7582031, -1.9725, 0.6156863, 1, 0, 1,
-0.7310298, 1.592597, -2.168345, 0.6078432, 1, 0, 1,
-0.7278845, 0.7570871, -0.4764454, 0.6039216, 1, 0, 1,
-0.7188492, -0.1410622, -0.8587705, 0.5960785, 1, 0, 1,
-0.7181772, -0.07305742, -0.1119312, 0.5882353, 1, 0, 1,
-0.7119796, 0.1143524, -2.583965, 0.5843138, 1, 0, 1,
-0.7111464, 0.03199837, -1.153325, 0.5764706, 1, 0, 1,
-0.7081717, 0.3001394, -0.5931457, 0.572549, 1, 0, 1,
-0.7008834, -0.854364, -2.335726, 0.5647059, 1, 0, 1,
-0.693588, 1.119326, -1.902107, 0.5607843, 1, 0, 1,
-0.6905509, -1.801482, -1.15574, 0.5529412, 1, 0, 1,
-0.6885885, -0.1855736, -1.836228, 0.5490196, 1, 0, 1,
-0.6879542, -0.7379358, -4.001622, 0.5411765, 1, 0, 1,
-0.6865532, 1.615365, -0.9089844, 0.5372549, 1, 0, 1,
-0.6855493, -0.5310125, -0.6863832, 0.5294118, 1, 0, 1,
-0.684453, -0.5809567, -2.625109, 0.5254902, 1, 0, 1,
-0.6686329, -0.1414371, -0.392467, 0.5176471, 1, 0, 1,
-0.662598, 0.7063705, -1.168862, 0.5137255, 1, 0, 1,
-0.6595482, 1.99364, 0.635053, 0.5058824, 1, 0, 1,
-0.65727, -0.5639355, -3.569548, 0.5019608, 1, 0, 1,
-0.6515096, 0.3331593, -2.41611, 0.4941176, 1, 0, 1,
-0.6451759, -1.21864, -0.8862087, 0.4862745, 1, 0, 1,
-0.6451609, -0.7276641, -3.584098, 0.4823529, 1, 0, 1,
-0.6420941, 1.718255, -0.5865352, 0.4745098, 1, 0, 1,
-0.640583, -1.04407, -2.524889, 0.4705882, 1, 0, 1,
-0.6317044, 1.783844, -0.3311892, 0.4627451, 1, 0, 1,
-0.620672, -1.511711, -4.372879, 0.4588235, 1, 0, 1,
-0.6201466, 1.186271, 0.07983738, 0.4509804, 1, 0, 1,
-0.6196487, -0.6660356, -1.197883, 0.4470588, 1, 0, 1,
-0.6129115, 0.2879416, -0.5943974, 0.4392157, 1, 0, 1,
-0.6062269, 1.756385, -0.167389, 0.4352941, 1, 0, 1,
-0.6058894, -0.2340484, -1.847143, 0.427451, 1, 0, 1,
-0.601172, -0.6012335, -3.47498, 0.4235294, 1, 0, 1,
-0.5971303, -0.5215523, -2.532208, 0.4156863, 1, 0, 1,
-0.5958695, -0.1891559, -2.426259, 0.4117647, 1, 0, 1,
-0.5899873, -0.997997, -3.264144, 0.4039216, 1, 0, 1,
-0.5886498, 0.02537256, 0.2001903, 0.3960784, 1, 0, 1,
-0.5813659, -0.8560398, -4.731736, 0.3921569, 1, 0, 1,
-0.570155, 0.3336241, 0.1390619, 0.3843137, 1, 0, 1,
-0.5678883, 0.4164256, -0.2040216, 0.3803922, 1, 0, 1,
-0.5552301, 0.6973737, 0.6643112, 0.372549, 1, 0, 1,
-0.5535838, 0.1129118, -0.9356276, 0.3686275, 1, 0, 1,
-0.5506569, 0.5184444, -1.591819, 0.3607843, 1, 0, 1,
-0.550542, 1.932034, -0.3320427, 0.3568628, 1, 0, 1,
-0.5494499, -0.3485939, -2.741571, 0.3490196, 1, 0, 1,
-0.5486211, -0.5538093, -4.741969, 0.345098, 1, 0, 1,
-0.548586, -0.2186102, -2.052454, 0.3372549, 1, 0, 1,
-0.5444634, 0.7202086, 0.5369726, 0.3333333, 1, 0, 1,
-0.5406577, -0.1657592, -1.916541, 0.3254902, 1, 0, 1,
-0.5383435, -1.134867, -1.232963, 0.3215686, 1, 0, 1,
-0.5368287, 2.429278, -2.011772, 0.3137255, 1, 0, 1,
-0.5357985, 1.540106, 0.8475092, 0.3098039, 1, 0, 1,
-0.5321792, -1.750121, -4.451464, 0.3019608, 1, 0, 1,
-0.5269784, -0.8803782, -1.849222, 0.2941177, 1, 0, 1,
-0.5251983, 0.2776068, 0.05265786, 0.2901961, 1, 0, 1,
-0.524578, 1.224561, -1.273784, 0.282353, 1, 0, 1,
-0.5241876, 1.384707, -1.530264, 0.2784314, 1, 0, 1,
-0.5223845, -1.185437, -3.942427, 0.2705882, 1, 0, 1,
-0.5194784, -0.6216533, -5.126519, 0.2666667, 1, 0, 1,
-0.5184513, 0.5611121, -1.179403, 0.2588235, 1, 0, 1,
-0.5151053, -0.1943084, -0.6918935, 0.254902, 1, 0, 1,
-0.5128917, 1.52072, -0.2087975, 0.2470588, 1, 0, 1,
-0.5085288, -2.040517, -2.466822, 0.2431373, 1, 0, 1,
-0.5024937, 0.1155095, -1.672265, 0.2352941, 1, 0, 1,
-0.5011131, 0.8997015, 1.999565, 0.2313726, 1, 0, 1,
-0.5009066, -0.6847675, -3.844193, 0.2235294, 1, 0, 1,
-0.4985988, 0.2958895, -1.99781, 0.2196078, 1, 0, 1,
-0.4930439, -0.4168056, -0.9714465, 0.2117647, 1, 0, 1,
-0.4924002, 2.560812, -0.5940331, 0.2078431, 1, 0, 1,
-0.4917306, 0.8421692, -0.6232884, 0.2, 1, 0, 1,
-0.486248, 1.127832, -0.6929145, 0.1921569, 1, 0, 1,
-0.4837064, 0.4913648, -1.159221, 0.1882353, 1, 0, 1,
-0.4830136, 0.7308642, -1.378792, 0.1803922, 1, 0, 1,
-0.4818009, 0.8650162, -2.622016, 0.1764706, 1, 0, 1,
-0.4784204, -0.631336, -1.696657, 0.1686275, 1, 0, 1,
-0.4758986, -1.233706, -3.636752, 0.1647059, 1, 0, 1,
-0.472818, 0.6879629, -2.594129, 0.1568628, 1, 0, 1,
-0.4697999, -2.268754, -3.903096, 0.1529412, 1, 0, 1,
-0.4679282, -0.4918379, -3.507548, 0.145098, 1, 0, 1,
-0.4672554, 0.5196074, 0.1192629, 0.1411765, 1, 0, 1,
-0.4568284, 0.5227817, -1.07384, 0.1333333, 1, 0, 1,
-0.4561052, 2.920447, -2.953918, 0.1294118, 1, 0, 1,
-0.4539836, -0.05153832, -1.557273, 0.1215686, 1, 0, 1,
-0.4504431, 0.2504586, 7.846553e-05, 0.1176471, 1, 0, 1,
-0.447907, -0.6090158, -2.389448, 0.1098039, 1, 0, 1,
-0.4476655, -0.2422875, -2.483404, 0.1058824, 1, 0, 1,
-0.4473824, -0.0201915, 0.450367, 0.09803922, 1, 0, 1,
-0.4464094, 0.7132634, 0.3955345, 0.09019608, 1, 0, 1,
-0.4450326, -0.2943856, -2.460464, 0.08627451, 1, 0, 1,
-0.4438038, 1.288245, 0.2413014, 0.07843138, 1, 0, 1,
-0.4434193, 0.3999003, -0.9586873, 0.07450981, 1, 0, 1,
-0.4422497, -0.01953905, -1.660694, 0.06666667, 1, 0, 1,
-0.4402071, 0.09380476, -1.610138, 0.0627451, 1, 0, 1,
-0.4358946, -0.448216, -3.273291, 0.05490196, 1, 0, 1,
-0.4338292, -0.7099352, -2.666585, 0.05098039, 1, 0, 1,
-0.431408, -0.9103354, -3.58724, 0.04313726, 1, 0, 1,
-0.4306634, -0.00609434, -1.47703, 0.03921569, 1, 0, 1,
-0.4250935, -0.751053, -2.420775, 0.03137255, 1, 0, 1,
-0.4232168, -0.05802297, -0.1923265, 0.02745098, 1, 0, 1,
-0.4228354, 0.5742786, -0.01646863, 0.01960784, 1, 0, 1,
-0.4212211, 0.825232, -1.332084, 0.01568628, 1, 0, 1,
-0.4195347, 1.839643, -0.2950292, 0.007843138, 1, 0, 1,
-0.4171683, -0.1452125, -2.578808, 0.003921569, 1, 0, 1,
-0.413418, 0.4377544, -0.4827344, 0, 1, 0.003921569, 1,
-0.4091323, -0.7999774, -2.62015, 0, 1, 0.01176471, 1,
-0.4054595, 1.232561, -1.700116, 0, 1, 0.01568628, 1,
-0.4004177, -0.9706472, -1.57614, 0, 1, 0.02352941, 1,
-0.3999469, 0.06419277, -2.581706, 0, 1, 0.02745098, 1,
-0.3977818, -0.2670655, -2.738874, 0, 1, 0.03529412, 1,
-0.3931045, -2.18575, -2.457682, 0, 1, 0.03921569, 1,
-0.3926928, 1.923728, -0.3442414, 0, 1, 0.04705882, 1,
-0.39213, -0.5746892, -2.549272, 0, 1, 0.05098039, 1,
-0.3920523, -0.2578525, -1.553081, 0, 1, 0.05882353, 1,
-0.3894131, -0.5273616, -2.882189, 0, 1, 0.0627451, 1,
-0.3860242, 1.467093, 0.228307, 0, 1, 0.07058824, 1,
-0.3840392, 0.8458482, -0.1849705, 0, 1, 0.07450981, 1,
-0.382421, 0.8088577, 1.023558, 0, 1, 0.08235294, 1,
-0.3811727, -0.4263088, -0.8943445, 0, 1, 0.08627451, 1,
-0.3805064, -1.012501, -3.835493, 0, 1, 0.09411765, 1,
-0.376392, -2.199131, -1.618345, 0, 1, 0.1019608, 1,
-0.3745145, -0.5736119, -3.081123, 0, 1, 0.1058824, 1,
-0.3694317, -0.7650456, -1.872481, 0, 1, 0.1137255, 1,
-0.3658958, -0.4811335, -2.5791, 0, 1, 0.1176471, 1,
-0.3647072, 1.274668, -1.041318, 0, 1, 0.1254902, 1,
-0.3642296, -1.509497, -1.141829, 0, 1, 0.1294118, 1,
-0.3640073, 0.346141, -0.8715134, 0, 1, 0.1372549, 1,
-0.3617486, 0.0275234, -0.9860068, 0, 1, 0.1411765, 1,
-0.3614538, -0.2150974, -2.464655, 0, 1, 0.1490196, 1,
-0.3552024, -0.496544, -2.608164, 0, 1, 0.1529412, 1,
-0.3542677, -0.7366258, -3.573058, 0, 1, 0.1607843, 1,
-0.3526659, -0.5165465, -3.015095, 0, 1, 0.1647059, 1,
-0.3496332, -0.8576946, -0.5674496, 0, 1, 0.172549, 1,
-0.3494817, -0.0503552, -2.127228, 0, 1, 0.1764706, 1,
-0.3493587, 0.5685233, -0.7748839, 0, 1, 0.1843137, 1,
-0.3437537, -0.8783177, -4.228996, 0, 1, 0.1882353, 1,
-0.3394906, 0.4218059, -2.114037, 0, 1, 0.1960784, 1,
-0.3341355, -0.4999103, -3.512022, 0, 1, 0.2039216, 1,
-0.3331955, 0.5654851, -0.9168869, 0, 1, 0.2078431, 1,
-0.3309866, 0.4952504, -1.853033, 0, 1, 0.2156863, 1,
-0.3275802, 0.8241701, -1.0472, 0, 1, 0.2196078, 1,
-0.3226278, 0.02001055, -3.699281, 0, 1, 0.227451, 1,
-0.3221008, 2.077879, 0.6407568, 0, 1, 0.2313726, 1,
-0.3212227, -1.575719, -3.340541, 0, 1, 0.2392157, 1,
-0.3204561, 1.056553, 0.6265026, 0, 1, 0.2431373, 1,
-0.3189893, 0.5379624, -2.395766, 0, 1, 0.2509804, 1,
-0.3180087, -1.310078, -3.229039, 0, 1, 0.254902, 1,
-0.3142006, 1.518129, -2.423347, 0, 1, 0.2627451, 1,
-0.3065116, -0.9198897, -0.4788207, 0, 1, 0.2666667, 1,
-0.3064345, 0.3449296, -1.21245, 0, 1, 0.2745098, 1,
-0.3014256, -0.07335698, -2.257217, 0, 1, 0.2784314, 1,
-0.2982998, -1.01073, -2.13915, 0, 1, 0.2862745, 1,
-0.2971919, -0.1779811, 0.3791646, 0, 1, 0.2901961, 1,
-0.2971697, -0.3891334, -2.341414, 0, 1, 0.2980392, 1,
-0.2925755, -1.559674, -3.242872, 0, 1, 0.3058824, 1,
-0.2920621, 1.868469, -1.854592, 0, 1, 0.3098039, 1,
-0.2896976, 1.532938, 0.6365378, 0, 1, 0.3176471, 1,
-0.288775, -0.007430132, -2.456235, 0, 1, 0.3215686, 1,
-0.2868733, 1.05371, 0.1996851, 0, 1, 0.3294118, 1,
-0.2832296, -0.7526708, -1.427675, 0, 1, 0.3333333, 1,
-0.2804374, 1.121257, -2.455567, 0, 1, 0.3411765, 1,
-0.2796744, 0.2749297, -1.583727, 0, 1, 0.345098, 1,
-0.2794436, -1.998225, -3.800199, 0, 1, 0.3529412, 1,
-0.2730626, -0.5537342, -3.233295, 0, 1, 0.3568628, 1,
-0.2727736, -0.5022739, -2.001266, 0, 1, 0.3647059, 1,
-0.2664938, -1.137061, -4.231044, 0, 1, 0.3686275, 1,
-0.2660238, 0.4253043, -1.063044, 0, 1, 0.3764706, 1,
-0.2654397, 1.522725, 1.158332, 0, 1, 0.3803922, 1,
-0.2648363, 0.3207017, -1.575536, 0, 1, 0.3882353, 1,
-0.2596948, -0.9471923, -3.762983, 0, 1, 0.3921569, 1,
-0.2565982, 1.186995, 0.5307249, 0, 1, 0.4, 1,
-0.250881, 1.118185, 0.1717176, 0, 1, 0.4078431, 1,
-0.2503175, -0.9948099, -2.169677, 0, 1, 0.4117647, 1,
-0.2435763, 1.373888, -0.1590054, 0, 1, 0.4196078, 1,
-0.2425331, -0.7805708, -1.56918, 0, 1, 0.4235294, 1,
-0.242195, -0.2552392, -2.749072, 0, 1, 0.4313726, 1,
-0.2409438, -0.5933577, -3.714525, 0, 1, 0.4352941, 1,
-0.2408903, -0.7350271, -3.264645, 0, 1, 0.4431373, 1,
-0.2402654, -0.9754277, -3.677682, 0, 1, 0.4470588, 1,
-0.2227065, -0.401488, -2.568272, 0, 1, 0.454902, 1,
-0.2223095, -0.7725517, -3.195946, 0, 1, 0.4588235, 1,
-0.2154105, -0.6701141, -3.022745, 0, 1, 0.4666667, 1,
-0.2144852, -0.920443, -3.093926, 0, 1, 0.4705882, 1,
-0.208763, 0.9535162, -1.91823, 0, 1, 0.4784314, 1,
-0.2082064, -2.12379, -1.864524, 0, 1, 0.4823529, 1,
-0.2066977, 2.380541, -0.5225482, 0, 1, 0.4901961, 1,
-0.2039786, 0.1505082, -0.9329641, 0, 1, 0.4941176, 1,
-0.2021185, 0.4675613, 1.558435, 0, 1, 0.5019608, 1,
-0.2003951, 0.4278926, 1.334592, 0, 1, 0.509804, 1,
-0.1986818, 0.05402687, 0.23534, 0, 1, 0.5137255, 1,
-0.195217, -0.3788435, -2.539901, 0, 1, 0.5215687, 1,
-0.1948882, -1.094104, -5.805107, 0, 1, 0.5254902, 1,
-0.1944038, 0.5782112, -1.645987, 0, 1, 0.5333334, 1,
-0.1917487, -0.5470647, -3.495413, 0, 1, 0.5372549, 1,
-0.190425, 2.655817, 0.04027876, 0, 1, 0.5450981, 1,
-0.1876101, 2.011499, 0.02835415, 0, 1, 0.5490196, 1,
-0.1824929, 1.055713, -0.3057567, 0, 1, 0.5568628, 1,
-0.1805808, 0.2508378, -0.6661562, 0, 1, 0.5607843, 1,
-0.1805016, 0.1015103, -1.039347, 0, 1, 0.5686275, 1,
-0.1696541, -1.712768, -2.644796, 0, 1, 0.572549, 1,
-0.1633128, -0.2702875, -3.422333, 0, 1, 0.5803922, 1,
-0.1629105, -0.608755, -2.668099, 0, 1, 0.5843138, 1,
-0.1624288, 0.5319985, 0.1625233, 0, 1, 0.5921569, 1,
-0.1620425, -0.6407479, -2.13208, 0, 1, 0.5960785, 1,
-0.1589297, -1.370592, -3.379679, 0, 1, 0.6039216, 1,
-0.1562436, -0.542912, -4.840169, 0, 1, 0.6117647, 1,
-0.1513784, -1.168699, -3.278494, 0, 1, 0.6156863, 1,
-0.1510575, 0.2633654, -2.744364, 0, 1, 0.6235294, 1,
-0.1493776, 1.288291, 0.01589388, 0, 1, 0.627451, 1,
-0.1490308, 0.1623707, -1.332028, 0, 1, 0.6352941, 1,
-0.1490256, 0.1977626, 0.4903172, 0, 1, 0.6392157, 1,
-0.1451062, -0.9738162, -2.671278, 0, 1, 0.6470588, 1,
-0.1425693, -2.463875, -3.714621, 0, 1, 0.6509804, 1,
-0.1414324, -0.2336263, -1.889241, 0, 1, 0.6588235, 1,
-0.1409773, 0.3724549, -1.985881, 0, 1, 0.6627451, 1,
-0.1405716, -0.009951577, -1.5677, 0, 1, 0.6705883, 1,
-0.1373841, 1.046308, -0.9307886, 0, 1, 0.6745098, 1,
-0.1369403, -1.284642, -2.573248, 0, 1, 0.682353, 1,
-0.134628, -0.7406487, -2.964893, 0, 1, 0.6862745, 1,
-0.1334098, -0.04554864, -1.8116, 0, 1, 0.6941177, 1,
-0.1232969, -1.274606, -3.315746, 0, 1, 0.7019608, 1,
-0.1214489, 0.3463777, 0.5320355, 0, 1, 0.7058824, 1,
-0.1152383, -0.9892861, -1.16279, 0, 1, 0.7137255, 1,
-0.1136695, -0.008018633, -1.305543, 0, 1, 0.7176471, 1,
-0.1120464, -1.829177, -2.61506, 0, 1, 0.7254902, 1,
-0.1118262, -1.503963, 0.1181133, 0, 1, 0.7294118, 1,
-0.1081814, 1.668203, 2.285431, 0, 1, 0.7372549, 1,
-0.1074421, 0.5845944, 0.5209663, 0, 1, 0.7411765, 1,
-0.1070205, 1.370167, 1.237178, 0, 1, 0.7490196, 1,
-0.09957147, 0.2261176, -0.191569, 0, 1, 0.7529412, 1,
-0.09910332, -0.05369674, -1.700455, 0, 1, 0.7607843, 1,
-0.09801958, 1.348772, 0.08364895, 0, 1, 0.7647059, 1,
-0.09648512, 0.6241412, -0.04889001, 0, 1, 0.772549, 1,
-0.09575298, 1.351506, -0.396647, 0, 1, 0.7764706, 1,
-0.09466075, 0.9761887, 0.6054132, 0, 1, 0.7843137, 1,
-0.09396467, -0.4932315, -2.067914, 0, 1, 0.7882353, 1,
-0.09376454, -0.7363642, -2.296619, 0, 1, 0.7960784, 1,
-0.09168203, -0.1931685, -3.462169, 0, 1, 0.8039216, 1,
-0.0869336, 0.1777791, -1.142696, 0, 1, 0.8078431, 1,
-0.08653367, 0.7487794, -0.6635511, 0, 1, 0.8156863, 1,
-0.08311279, 0.6761788, 0.3531372, 0, 1, 0.8196079, 1,
-0.08264459, 0.4147726, -0.1346497, 0, 1, 0.827451, 1,
-0.08093807, 1.244904, 1.849883, 0, 1, 0.8313726, 1,
-0.07972392, 0.1445814, 1.140763, 0, 1, 0.8392157, 1,
-0.0794374, -0.6533139, -2.71186, 0, 1, 0.8431373, 1,
-0.0783571, 0.9937245, -1.848017, 0, 1, 0.8509804, 1,
-0.07375528, -0.6654198, -2.677183, 0, 1, 0.854902, 1,
-0.07300244, -0.5954142, -1.379057, 0, 1, 0.8627451, 1,
-0.07140483, -0.6128265, -5.237172, 0, 1, 0.8666667, 1,
-0.06677528, -0.2077879, -4.660716, 0, 1, 0.8745098, 1,
-0.06574532, -0.131243, -3.316102, 0, 1, 0.8784314, 1,
-0.06064101, 0.3193054, -0.07603875, 0, 1, 0.8862745, 1,
-0.06034118, -0.521462, -2.637295, 0, 1, 0.8901961, 1,
-0.05793785, 1.616354, -1.36005, 0, 1, 0.8980392, 1,
-0.05585769, -0.4784293, -1.0647, 0, 1, 0.9058824, 1,
-0.05499775, 0.6708696, 0.3132458, 0, 1, 0.9098039, 1,
-0.05474045, -1.489055, -1.036334, 0, 1, 0.9176471, 1,
-0.05457316, -0.1777857, -2.2969, 0, 1, 0.9215686, 1,
-0.05336494, 0.9221295, 1.13293, 0, 1, 0.9294118, 1,
-0.0517555, 1.53085, 1.80073, 0, 1, 0.9333333, 1,
-0.04958644, 1.004501, 1.40599, 0, 1, 0.9411765, 1,
-0.04667483, -0.5101659, -2.945343, 0, 1, 0.945098, 1,
-0.04515159, -1.584123, -3.07689, 0, 1, 0.9529412, 1,
-0.03684703, 0.03260757, -1.522234, 0, 1, 0.9568627, 1,
-0.03611035, -0.4088462, -0.8442438, 0, 1, 0.9647059, 1,
-0.03305374, 0.922616, -0.25826, 0, 1, 0.9686275, 1,
-0.02799996, -0.6167687, -4.062482, 0, 1, 0.9764706, 1,
-0.02534737, -1.192792, -3.802269, 0, 1, 0.9803922, 1,
-0.0247903, 0.1218987, -1.16105, 0, 1, 0.9882353, 1,
-0.02203462, -1.218848, -1.942101, 0, 1, 0.9921569, 1,
-0.01908755, 2.519967, 1.052475, 0, 1, 1, 1,
-0.01889414, 0.6035514, -0.1632159, 0, 0.9921569, 1, 1,
-0.01589848, 0.6077486, 1.575518, 0, 0.9882353, 1, 1,
-0.01277651, 1.395597, 1.002828, 0, 0.9803922, 1, 1,
-0.004531029, 0.003220388, -0.141871, 0, 0.9764706, 1, 1,
-0.003481662, 0.1935412, -1.117229, 0, 0.9686275, 1, 1,
-0.002380755, -0.3210274, -4.267335, 0, 0.9647059, 1, 1,
-0.0009516546, -0.1491772, -2.207613, 0, 0.9568627, 1, 1,
0.0007648261, 0.7248356, -0.6043543, 0, 0.9529412, 1, 1,
0.003145768, -0.2112646, 2.722052, 0, 0.945098, 1, 1,
0.005583628, 0.6090507, 1.909036, 0, 0.9411765, 1, 1,
0.009016467, 0.08888411, -0.7426865, 0, 0.9333333, 1, 1,
0.009537643, 0.6028223, 0.9954762, 0, 0.9294118, 1, 1,
0.01015387, 1.020702, -0.2329866, 0, 0.9215686, 1, 1,
0.01084929, 0.7327774, 0.9872342, 0, 0.9176471, 1, 1,
0.01352308, 1.419559, -0.9859061, 0, 0.9098039, 1, 1,
0.01455074, -0.1530108, 3.982692, 0, 0.9058824, 1, 1,
0.01637683, 0.3219201, -0.7320295, 0, 0.8980392, 1, 1,
0.01759255, 2.426479, 0.6492318, 0, 0.8901961, 1, 1,
0.02454048, -0.492927, 4.733357, 0, 0.8862745, 1, 1,
0.02474567, 0.002098134, 1.087527, 0, 0.8784314, 1, 1,
0.0258601, -1.361452, 3.83894, 0, 0.8745098, 1, 1,
0.02860479, 0.4805568, -0.4606339, 0, 0.8666667, 1, 1,
0.03376706, -0.5668117, 2.978649, 0, 0.8627451, 1, 1,
0.03588779, -1.455714, 3.43901, 0, 0.854902, 1, 1,
0.03698045, 0.5567368, -0.06532543, 0, 0.8509804, 1, 1,
0.03823029, 1.394513, 0.09749836, 0, 0.8431373, 1, 1,
0.04036783, 1.566079, 0.2686262, 0, 0.8392157, 1, 1,
0.0419333, -0.7916633, 4.345858, 0, 0.8313726, 1, 1,
0.04896777, 0.7611579, 1.475734, 0, 0.827451, 1, 1,
0.0520459, 0.1336095, 0.6400996, 0, 0.8196079, 1, 1,
0.0525467, -1.290508, 4.374238, 0, 0.8156863, 1, 1,
0.05886644, -0.3942275, 2.312852, 0, 0.8078431, 1, 1,
0.05906922, -0.9600862, 3.15604, 0, 0.8039216, 1, 1,
0.06122816, 0.8396014, 0.6052758, 0, 0.7960784, 1, 1,
0.06346747, 1.846215, 0.8683729, 0, 0.7882353, 1, 1,
0.06794472, 1.558742, 0.211913, 0, 0.7843137, 1, 1,
0.07297318, 0.187042, 2.668684, 0, 0.7764706, 1, 1,
0.07625721, 0.4426577, -0.1289002, 0, 0.772549, 1, 1,
0.07662811, -0.190092, 1.966546, 0, 0.7647059, 1, 1,
0.0776546, -0.01810404, 1.792706, 0, 0.7607843, 1, 1,
0.08006337, -0.01580578, 2.375023, 0, 0.7529412, 1, 1,
0.08238507, -0.1264552, 2.583392, 0, 0.7490196, 1, 1,
0.08316743, 0.9947365, -1.062528, 0, 0.7411765, 1, 1,
0.08398585, -1.555597, 4.129778, 0, 0.7372549, 1, 1,
0.08996723, -1.069055, 2.534089, 0, 0.7294118, 1, 1,
0.09773552, -0.7628502, 2.11488, 0, 0.7254902, 1, 1,
0.1016093, 0.3860054, -1.041537, 0, 0.7176471, 1, 1,
0.1070989, 0.8655167, -1.095972, 0, 0.7137255, 1, 1,
0.1074404, 1.130483, -0.03706757, 0, 0.7058824, 1, 1,
0.1095655, 0.8147554, 0.6142389, 0, 0.6980392, 1, 1,
0.1143627, -1.61147, 2.874398, 0, 0.6941177, 1, 1,
0.1165322, -0.9109834, 1.333259, 0, 0.6862745, 1, 1,
0.1178463, 0.3387297, -1.108235, 0, 0.682353, 1, 1,
0.1183592, -0.1225956, 1.887594, 0, 0.6745098, 1, 1,
0.1188624, 0.5994616, -0.9744184, 0, 0.6705883, 1, 1,
0.11997, -0.02756014, 2.525028, 0, 0.6627451, 1, 1,
0.1203996, -0.2003921, 3.061372, 0, 0.6588235, 1, 1,
0.1206058, 2.244104, 1.138772, 0, 0.6509804, 1, 1,
0.1222736, 0.8789248, -0.8946348, 0, 0.6470588, 1, 1,
0.1318252, 0.5171339, 0.4830489, 0, 0.6392157, 1, 1,
0.1321887, -0.6394741, 3.907707, 0, 0.6352941, 1, 1,
0.1382742, 0.3403819, 0.03745371, 0, 0.627451, 1, 1,
0.1477937, -0.8088546, 3.092584, 0, 0.6235294, 1, 1,
0.1489292, 0.7292761, 0.4546225, 0, 0.6156863, 1, 1,
0.1527364, 1.382056, 1.405427, 0, 0.6117647, 1, 1,
0.1534876, 0.4474439, -0.02914024, 0, 0.6039216, 1, 1,
0.1565088, -0.6943441, 1.58509, 0, 0.5960785, 1, 1,
0.1609425, -0.1106589, 2.214341, 0, 0.5921569, 1, 1,
0.1637483, 0.08975064, 2.640117, 0, 0.5843138, 1, 1,
0.1641779, -0.4684241, 3.591548, 0, 0.5803922, 1, 1,
0.1693901, -0.646167, 2.505165, 0, 0.572549, 1, 1,
0.1698994, 1.68972, 0.3416536, 0, 0.5686275, 1, 1,
0.1701023, -0.2046653, 0.773656, 0, 0.5607843, 1, 1,
0.1705071, 0.4838518, 0.2702166, 0, 0.5568628, 1, 1,
0.1750793, -0.07141402, 3.284204, 0, 0.5490196, 1, 1,
0.1757764, -0.9228767, 2.675906, 0, 0.5450981, 1, 1,
0.1771718, 0.8936459, 0.3339101, 0, 0.5372549, 1, 1,
0.1797168, 2.481671, 1.599061, 0, 0.5333334, 1, 1,
0.1856354, -0.7882, 1.673164, 0, 0.5254902, 1, 1,
0.1889532, -0.1414668, 2.151232, 0, 0.5215687, 1, 1,
0.1905746, 0.4141034, 1.091694, 0, 0.5137255, 1, 1,
0.1968839, 0.8192055, 0.3829504, 0, 0.509804, 1, 1,
0.1980924, 0.1058518, 0.2386178, 0, 0.5019608, 1, 1,
0.203062, -0.6525976, 1.770826, 0, 0.4941176, 1, 1,
0.2038211, 0.2526872, -0.9904523, 0, 0.4901961, 1, 1,
0.2075859, 0.226263, 1.092848, 0, 0.4823529, 1, 1,
0.2110611, 0.3487832, -0.6798532, 0, 0.4784314, 1, 1,
0.2134356, 0.2299181, 0.8777236, 0, 0.4705882, 1, 1,
0.2175253, -1.532538, 3.730268, 0, 0.4666667, 1, 1,
0.2193142, -0.2217769, 3.413719, 0, 0.4588235, 1, 1,
0.2197741, 1.110681, 0.1952199, 0, 0.454902, 1, 1,
0.2199506, 0.03445068, 0.5647476, 0, 0.4470588, 1, 1,
0.2205127, -0.8646227, 2.972962, 0, 0.4431373, 1, 1,
0.2297541, 1.127579, -0.3345955, 0, 0.4352941, 1, 1,
0.2312659, 1.669548, -0.3662976, 0, 0.4313726, 1, 1,
0.2332754, 1.132224, 0.3095601, 0, 0.4235294, 1, 1,
0.2332949, 1.657269, -0.1796951, 0, 0.4196078, 1, 1,
0.2349747, 1.258929, -0.7553021, 0, 0.4117647, 1, 1,
0.2380633, 0.8320256, 1.49965, 0, 0.4078431, 1, 1,
0.2450335, 0.3347287, 1.607778, 0, 0.4, 1, 1,
0.2458, 0.7895359, -0.7001066, 0, 0.3921569, 1, 1,
0.2483594, 0.9178116, 1.464904, 0, 0.3882353, 1, 1,
0.2529904, 0.01379433, 1.527764, 0, 0.3803922, 1, 1,
0.2561187, 0.4662446, 1.223614, 0, 0.3764706, 1, 1,
0.256281, -0.4683281, 2.876526, 0, 0.3686275, 1, 1,
0.2573927, 0.4179299, -0.2278219, 0, 0.3647059, 1, 1,
0.259839, -0.1276942, 1.584023, 0, 0.3568628, 1, 1,
0.2667072, 0.5218506, 0.2870292, 0, 0.3529412, 1, 1,
0.2731166, -1.603718, 1.311394, 0, 0.345098, 1, 1,
0.2754336, 0.4482245, 0.6494539, 0, 0.3411765, 1, 1,
0.2761933, -0.1711338, 2.18486, 0, 0.3333333, 1, 1,
0.2775546, -1.54435, 2.118536, 0, 0.3294118, 1, 1,
0.281337, 1.006908, -0.9754614, 0, 0.3215686, 1, 1,
0.2819504, -1.279176, 1.378668, 0, 0.3176471, 1, 1,
0.2826178, 0.9685744, -0.199691, 0, 0.3098039, 1, 1,
0.2826373, 0.6225751, -0.5835228, 0, 0.3058824, 1, 1,
0.2829516, -0.1370797, 0.1542179, 0, 0.2980392, 1, 1,
0.2840721, -1.234182, 2.729366, 0, 0.2901961, 1, 1,
0.2858189, -0.7597214, 2.653676, 0, 0.2862745, 1, 1,
0.2876317, 1.012176, 1.717311, 0, 0.2784314, 1, 1,
0.2880219, 0.09973167, 0.7954054, 0, 0.2745098, 1, 1,
0.2885847, 0.6208369, 0.1028633, 0, 0.2666667, 1, 1,
0.2906068, -0.9078163, 3.416327, 0, 0.2627451, 1, 1,
0.2915606, 1.700241, -0.5147368, 0, 0.254902, 1, 1,
0.2956138, -2.259221, 3.604229, 0, 0.2509804, 1, 1,
0.2988082, 1.221584, -0.3782796, 0, 0.2431373, 1, 1,
0.302003, 0.5336652, -0.2243519, 0, 0.2392157, 1, 1,
0.3028319, -1.443891, 1.649051, 0, 0.2313726, 1, 1,
0.3044657, -0.141288, 2.477103, 0, 0.227451, 1, 1,
0.304502, -1.125188, 1.474402, 0, 0.2196078, 1, 1,
0.3059292, 0.9129276, 1.74468, 0, 0.2156863, 1, 1,
0.3064158, -1.091414, 2.934434, 0, 0.2078431, 1, 1,
0.3101801, -0.1283967, 2.167467, 0, 0.2039216, 1, 1,
0.3115354, 0.6439597, -0.5781869, 0, 0.1960784, 1, 1,
0.3129382, -0.6668843, 2.671235, 0, 0.1882353, 1, 1,
0.3160942, 0.2708287, 1.648735, 0, 0.1843137, 1, 1,
0.3174157, -1.370955, 2.7098, 0, 0.1764706, 1, 1,
0.3190886, -0.5248093, 3.3788, 0, 0.172549, 1, 1,
0.3215094, -1.961982, 3.562775, 0, 0.1647059, 1, 1,
0.3221989, 2.393513, 1.63834, 0, 0.1607843, 1, 1,
0.326164, 1.361753, -0.1093035, 0, 0.1529412, 1, 1,
0.3278033, 1.404006, 0.4079254, 0, 0.1490196, 1, 1,
0.3285471, -1.685829, 2.082683, 0, 0.1411765, 1, 1,
0.3306164, 1.046384, -0.4402162, 0, 0.1372549, 1, 1,
0.3361129, 0.9113478, 0.6766636, 0, 0.1294118, 1, 1,
0.3363877, 1.476501, -0.7949565, 0, 0.1254902, 1, 1,
0.3394554, -0.5976866, 2.367678, 0, 0.1176471, 1, 1,
0.3404642, 0.1419231, -1.254771, 0, 0.1137255, 1, 1,
0.3498313, -0.1393544, 0.671302, 0, 0.1058824, 1, 1,
0.3579357, 0.5469241, -0.4046279, 0, 0.09803922, 1, 1,
0.3632833, 0.3870924, 0.4004092, 0, 0.09411765, 1, 1,
0.3672023, -0.4968855, 3.750199, 0, 0.08627451, 1, 1,
0.3735701, 1.483591, 0.525667, 0, 0.08235294, 1, 1,
0.3785101, 0.3967018, 1.578035, 0, 0.07450981, 1, 1,
0.3820089, 0.2281096, 2.122128, 0, 0.07058824, 1, 1,
0.3873156, -0.6833894, 1.728031, 0, 0.0627451, 1, 1,
0.387467, -0.9925258, 2.481004, 0, 0.05882353, 1, 1,
0.3913602, 0.3915501, 1.277495, 0, 0.05098039, 1, 1,
0.3919907, -1.918841, 3.430721, 0, 0.04705882, 1, 1,
0.3947189, -1.02852, 5.169222, 0, 0.03921569, 1, 1,
0.3949596, 0.3139379, 2.179139, 0, 0.03529412, 1, 1,
0.3990337, 0.4174742, 2.481823, 0, 0.02745098, 1, 1,
0.4054153, -1.187889, 2.935765, 0, 0.02352941, 1, 1,
0.406564, 0.8843815, 0.001589274, 0, 0.01568628, 1, 1,
0.4074685, -0.7317505, 2.733502, 0, 0.01176471, 1, 1,
0.4110821, -0.3297022, 2.640345, 0, 0.003921569, 1, 1,
0.4151928, 0.6482585, 0.4878769, 0.003921569, 0, 1, 1,
0.4153969, 0.5608662, 0.2992436, 0.007843138, 0, 1, 1,
0.4167656, -0.3607055, 1.676871, 0.01568628, 0, 1, 1,
0.4198192, 0.436489, 0.4551188, 0.01960784, 0, 1, 1,
0.4253123, -0.9418418, 1.483086, 0.02745098, 0, 1, 1,
0.4261378, 1.061646, 0.9104106, 0.03137255, 0, 1, 1,
0.4330669, -0.05337839, 1.787488, 0.03921569, 0, 1, 1,
0.4350263, -0.7413108, 3.341217, 0.04313726, 0, 1, 1,
0.4379022, -0.6629235, 3.042822, 0.05098039, 0, 1, 1,
0.4417413, 0.5404845, 0.3920985, 0.05490196, 0, 1, 1,
0.4476635, -0.6889886, 4.080962, 0.0627451, 0, 1, 1,
0.4506844, -1.665709, 5.460495, 0.06666667, 0, 1, 1,
0.4530132, 1.206218, 1.038582, 0.07450981, 0, 1, 1,
0.4552531, -0.3211608, 3.535239, 0.07843138, 0, 1, 1,
0.4566321, 1.42119, 0.8727388, 0.08627451, 0, 1, 1,
0.4571466, 0.1357668, 3.179726, 0.09019608, 0, 1, 1,
0.4583063, 3.571795, 0.549583, 0.09803922, 0, 1, 1,
0.4586261, -0.6727169, 3.445318, 0.1058824, 0, 1, 1,
0.4588689, -0.4848936, 2.683507, 0.1098039, 0, 1, 1,
0.4644162, 0.6242474, 0.7376664, 0.1176471, 0, 1, 1,
0.4666961, 1.297994, 1.019511, 0.1215686, 0, 1, 1,
0.4705149, 0.2484452, 1.801994, 0.1294118, 0, 1, 1,
0.470661, 0.8024958, -0.3324981, 0.1333333, 0, 1, 1,
0.4712549, -0.210967, 3.244737, 0.1411765, 0, 1, 1,
0.4774467, 0.1452807, 1.282905, 0.145098, 0, 1, 1,
0.4810824, 0.370505, 0.4286953, 0.1529412, 0, 1, 1,
0.4845515, 1.5274, 1.57447, 0.1568628, 0, 1, 1,
0.4886662, -1.803619, 1.935151, 0.1647059, 0, 1, 1,
0.5026794, -2.198476, 3.563421, 0.1686275, 0, 1, 1,
0.5046825, 0.6953167, 1.039454, 0.1764706, 0, 1, 1,
0.5090035, 0.3843426, 1.923498, 0.1803922, 0, 1, 1,
0.5163416, -0.1128354, 2.740671, 0.1882353, 0, 1, 1,
0.516392, 1.490152, -1.754724, 0.1921569, 0, 1, 1,
0.5176475, -1.281047, 2.629429, 0.2, 0, 1, 1,
0.5199319, -1.0259, 3.024124, 0.2078431, 0, 1, 1,
0.5204538, 0.31622, 0.5153405, 0.2117647, 0, 1, 1,
0.5212353, -1.578346, 1.786458, 0.2196078, 0, 1, 1,
0.5239555, 1.270059, 1.095576, 0.2235294, 0, 1, 1,
0.5251252, 0.1775623, 2.557207, 0.2313726, 0, 1, 1,
0.5257781, 0.1156557, 0.9875201, 0.2352941, 0, 1, 1,
0.5282398, 1.470655, 1.020923, 0.2431373, 0, 1, 1,
0.5357071, 0.4080262, 1.12451, 0.2470588, 0, 1, 1,
0.5362106, 1.405405, 0.09435803, 0.254902, 0, 1, 1,
0.5381495, 0.1715102, -0.3450999, 0.2588235, 0, 1, 1,
0.5394675, -0.2532668, 3.498575, 0.2666667, 0, 1, 1,
0.5408552, 0.317156, -0.4795737, 0.2705882, 0, 1, 1,
0.5449359, 0.00884023, -1.109211, 0.2784314, 0, 1, 1,
0.5509098, -0.9584197, 3.082908, 0.282353, 0, 1, 1,
0.5599512, 0.5357935, 0.6876119, 0.2901961, 0, 1, 1,
0.5608605, -0.1031556, 0.9086753, 0.2941177, 0, 1, 1,
0.5667354, 1.089209, 0.2682294, 0.3019608, 0, 1, 1,
0.574671, -0.3973012, 0.5843951, 0.3098039, 0, 1, 1,
0.5748503, 0.186005, -2.140335, 0.3137255, 0, 1, 1,
0.5750919, -2.499257, 3.397384, 0.3215686, 0, 1, 1,
0.5765585, -0.03329078, 0.1371156, 0.3254902, 0, 1, 1,
0.5775824, 0.1923654, -0.1353645, 0.3333333, 0, 1, 1,
0.5810525, -0.8488023, 2.775177, 0.3372549, 0, 1, 1,
0.586633, -0.3634172, 3.24001, 0.345098, 0, 1, 1,
0.5882081, -1.589186, 2.485409, 0.3490196, 0, 1, 1,
0.5893783, -0.618964, 1.049065, 0.3568628, 0, 1, 1,
0.5911453, -0.3508902, 2.741331, 0.3607843, 0, 1, 1,
0.6016237, 0.4154612, -0.9304845, 0.3686275, 0, 1, 1,
0.6063679, 0.06632452, 1.00216, 0.372549, 0, 1, 1,
0.6088937, -0.223483, 1.704729, 0.3803922, 0, 1, 1,
0.6150336, -0.7454349, 3.068042, 0.3843137, 0, 1, 1,
0.6152418, -1.878479, 3.540509, 0.3921569, 0, 1, 1,
0.617893, -0.3002297, 2.302803, 0.3960784, 0, 1, 1,
0.6198498, 0.2365574, 1.175418, 0.4039216, 0, 1, 1,
0.6204998, 0.2765027, 0.6016917, 0.4117647, 0, 1, 1,
0.6234859, -0.5979724, 3.120546, 0.4156863, 0, 1, 1,
0.6310755, -0.3327799, 1.813538, 0.4235294, 0, 1, 1,
0.6315413, -0.8307288, 1.996749, 0.427451, 0, 1, 1,
0.6432129, -1.290321, 5.709029, 0.4352941, 0, 1, 1,
0.6476261, -0.5985599, -0.4606869, 0.4392157, 0, 1, 1,
0.6490024, -0.1490782, 1.87858, 0.4470588, 0, 1, 1,
0.6494344, 0.2666353, 1.801257, 0.4509804, 0, 1, 1,
0.6523449, 0.4294024, 2.136487, 0.4588235, 0, 1, 1,
0.655028, 0.5447558, -0.9588538, 0.4627451, 0, 1, 1,
0.656737, 1.342049, 1.005151, 0.4705882, 0, 1, 1,
0.6567627, 1.021746, 0.6360526, 0.4745098, 0, 1, 1,
0.6590762, -1.13838, 1.677173, 0.4823529, 0, 1, 1,
0.6630608, 0.02636089, 2.223963, 0.4862745, 0, 1, 1,
0.6774231, 0.0898431, 0.1898632, 0.4941176, 0, 1, 1,
0.6808736, -1.229387, 2.922427, 0.5019608, 0, 1, 1,
0.6816676, -0.16953, 0.3845561, 0.5058824, 0, 1, 1,
0.6819917, 0.3658665, 1.189032, 0.5137255, 0, 1, 1,
0.684429, -0.2669742, 3.017189, 0.5176471, 0, 1, 1,
0.6863197, 0.6335114, 1.229043, 0.5254902, 0, 1, 1,
0.6866083, -0.4147588, 2.673573, 0.5294118, 0, 1, 1,
0.6900771, 1.144658, 0.1388487, 0.5372549, 0, 1, 1,
0.692441, 0.1046932, 2.091683, 0.5411765, 0, 1, 1,
0.6926544, 0.7928448, 1.853022, 0.5490196, 0, 1, 1,
0.6941659, -0.3747539, 2.442481, 0.5529412, 0, 1, 1,
0.6947059, 1.627119, 0.2326526, 0.5607843, 0, 1, 1,
0.6991401, 0.2519484, 0.3619803, 0.5647059, 0, 1, 1,
0.7026046, 0.7717997, -0.2963203, 0.572549, 0, 1, 1,
0.7044446, 0.3396111, 0.637635, 0.5764706, 0, 1, 1,
0.7072741, 0.2780803, 1.643071, 0.5843138, 0, 1, 1,
0.7076397, -1.304721, 3.336833, 0.5882353, 0, 1, 1,
0.7076753, -1.462835, 3.171845, 0.5960785, 0, 1, 1,
0.7078333, -0.6282835, 1.442312, 0.6039216, 0, 1, 1,
0.7129971, 0.1995584, 1.525774, 0.6078432, 0, 1, 1,
0.7172728, -0.167949, 2.651354, 0.6156863, 0, 1, 1,
0.7346123, 0.0004302463, 0.995186, 0.6196079, 0, 1, 1,
0.7378136, 1.139699, 0.4370067, 0.627451, 0, 1, 1,
0.7379828, -0.7286473, 0.6229834, 0.6313726, 0, 1, 1,
0.742793, 0.4643278, 3.709683, 0.6392157, 0, 1, 1,
0.7469166, -0.3271086, 1.475933, 0.6431373, 0, 1, 1,
0.758014, 1.050315, 1.659364, 0.6509804, 0, 1, 1,
0.7585402, -0.7298738, 2.11003, 0.654902, 0, 1, 1,
0.760064, -0.1330167, 1.860119, 0.6627451, 0, 1, 1,
0.7618244, -0.6223899, 0.7862203, 0.6666667, 0, 1, 1,
0.7624432, 2.049926, -0.8954417, 0.6745098, 0, 1, 1,
0.7625818, -1.223615, 2.780094, 0.6784314, 0, 1, 1,
0.7701944, -1.15243, 3.863292, 0.6862745, 0, 1, 1,
0.7732812, -0.410571, 2.124981, 0.6901961, 0, 1, 1,
0.7791984, -2.28612, 4.077653, 0.6980392, 0, 1, 1,
0.7798566, 0.1349071, 1.740712, 0.7058824, 0, 1, 1,
0.783348, 0.999984, -0.134842, 0.7098039, 0, 1, 1,
0.7875182, 0.8900084, 0.4976866, 0.7176471, 0, 1, 1,
0.7886516, 0.725181, 2.226163, 0.7215686, 0, 1, 1,
0.789023, 0.4584661, 1.146438, 0.7294118, 0, 1, 1,
0.790166, -2.094872, 2.708605, 0.7333333, 0, 1, 1,
0.7921158, -0.2405306, 2.55668, 0.7411765, 0, 1, 1,
0.7959861, -0.876257, 1.844237, 0.7450981, 0, 1, 1,
0.7964756, -0.5971499, 3.325833, 0.7529412, 0, 1, 1,
0.8070103, 0.0893266, 0.3784102, 0.7568628, 0, 1, 1,
0.814001, 1.932427, 2.238795, 0.7647059, 0, 1, 1,
0.8147918, -0.5766018, 3.84653, 0.7686275, 0, 1, 1,
0.8153515, 0.181392, 2.843049, 0.7764706, 0, 1, 1,
0.8154205, 1.732321, 0.6048613, 0.7803922, 0, 1, 1,
0.8195729, 1.085907, 0.8358042, 0.7882353, 0, 1, 1,
0.8288448, 0.9413736, 2.439685, 0.7921569, 0, 1, 1,
0.8492226, 1.493073, 0.4537192, 0.8, 0, 1, 1,
0.8638104, -0.8583595, 2.268866, 0.8078431, 0, 1, 1,
0.8641292, 1.459745, 0.4717956, 0.8117647, 0, 1, 1,
0.8665897, 0.4803288, -0.8482345, 0.8196079, 0, 1, 1,
0.8709304, 1.059884, 1.857165, 0.8235294, 0, 1, 1,
0.8742279, 0.07251026, 3.19899, 0.8313726, 0, 1, 1,
0.877172, -0.3710574, 1.920673, 0.8352941, 0, 1, 1,
0.8788624, 1.580647, -0.5217662, 0.8431373, 0, 1, 1,
0.881765, 1.00035, 1.746787, 0.8470588, 0, 1, 1,
0.8831162, -1.384535, 2.590313, 0.854902, 0, 1, 1,
0.8831171, 1.360065, 0.313997, 0.8588235, 0, 1, 1,
0.8863304, 1.316334, 2.370388, 0.8666667, 0, 1, 1,
0.8866662, -1.171607, 3.178618, 0.8705882, 0, 1, 1,
0.9034483, -1.048839, 1.862762, 0.8784314, 0, 1, 1,
0.9111745, -0.3088574, 0.9815552, 0.8823529, 0, 1, 1,
0.9167985, 0.3730258, 1.562068, 0.8901961, 0, 1, 1,
0.9198281, 0.1980055, 0.2849214, 0.8941177, 0, 1, 1,
0.9232783, 0.0526687, 1.780998, 0.9019608, 0, 1, 1,
0.9316624, 1.151191, -0.07564668, 0.9098039, 0, 1, 1,
0.9332597, 0.8233876, 0.5473609, 0.9137255, 0, 1, 1,
0.9378486, -0.1951176, 2.922117, 0.9215686, 0, 1, 1,
0.9390626, 0.8407754, 1.316434, 0.9254902, 0, 1, 1,
0.9457372, -0.06040069, 0.8561648, 0.9333333, 0, 1, 1,
0.9478233, -1.186031, 2.433291, 0.9372549, 0, 1, 1,
0.9507706, 0.1013148, 1.629987, 0.945098, 0, 1, 1,
0.9537519, 0.5741684, 2.060879, 0.9490196, 0, 1, 1,
0.9585283, -1.895534, 3.638194, 0.9568627, 0, 1, 1,
0.9596807, -0.05593771, 3.065411, 0.9607843, 0, 1, 1,
0.9646918, -0.2680826, 2.530077, 0.9686275, 0, 1, 1,
0.9656276, -0.9845262, 0.8138903, 0.972549, 0, 1, 1,
0.9678704, -0.1462, 2.024115, 0.9803922, 0, 1, 1,
0.9699786, -1.031715, 1.689169, 0.9843137, 0, 1, 1,
0.9703887, 0.8865407, 1.666336, 0.9921569, 0, 1, 1,
0.97278, 1.996681, 0.563262, 0.9960784, 0, 1, 1,
0.9776837, -1.515769, -0.7003326, 1, 0, 0.9960784, 1,
0.978206, -0.8189402, 3.370816, 1, 0, 0.9882353, 1,
0.9836331, -0.387779, 2.903775, 1, 0, 0.9843137, 1,
0.9840535, -0.2819587, 0.8894487, 1, 0, 0.9764706, 1,
0.985606, 2.10617, 1.246146, 1, 0, 0.972549, 1,
0.9885039, 0.4684246, 1.700773, 1, 0, 0.9647059, 1,
0.9941796, -0.2859052, 1.480157, 1, 0, 0.9607843, 1,
0.9957253, -0.2816294, 1.934982, 1, 0, 0.9529412, 1,
0.9993606, -0.9690273, 2.647932, 1, 0, 0.9490196, 1,
1.002573, -1.432543, 4.514146, 1, 0, 0.9411765, 1,
1.020422, 0.01455124, 2.742982, 1, 0, 0.9372549, 1,
1.022247, -0.74354, 1.226955, 1, 0, 0.9294118, 1,
1.022632, -1.572585, 4.575615, 1, 0, 0.9254902, 1,
1.022634, 1.352728, 0.7148625, 1, 0, 0.9176471, 1,
1.031142, 1.240795, 0.9628681, 1, 0, 0.9137255, 1,
1.036822, -0.1356737, 1.105744, 1, 0, 0.9058824, 1,
1.04161, -0.6161796, 3.466306, 1, 0, 0.9019608, 1,
1.04242, -0.2628527, 2.667783, 1, 0, 0.8941177, 1,
1.045027, -1.580393, 4.108876, 1, 0, 0.8862745, 1,
1.053081, -1.422439, 4.450054, 1, 0, 0.8823529, 1,
1.057198, -0.1725294, 2.554288, 1, 0, 0.8745098, 1,
1.063739, 0.7690485, 1.316464, 1, 0, 0.8705882, 1,
1.065009, -0.5727518, 1.991496, 1, 0, 0.8627451, 1,
1.075052, 0.01261958, 1.283298, 1, 0, 0.8588235, 1,
1.078558, -0.6974119, 2.201387, 1, 0, 0.8509804, 1,
1.078704, 0.2614105, 0.5386829, 1, 0, 0.8470588, 1,
1.081383, 0.3476953, -0.332638, 1, 0, 0.8392157, 1,
1.082215, -0.3694518, 1.516926, 1, 0, 0.8352941, 1,
1.085757, 0.3054685, 0.5514427, 1, 0, 0.827451, 1,
1.097729, -1.008706, 1.85425, 1, 0, 0.8235294, 1,
1.106176, -0.01155948, 1.713684, 1, 0, 0.8156863, 1,
1.106466, -0.8131735, 2.592673, 1, 0, 0.8117647, 1,
1.108618, 0.01116288, 0.4280763, 1, 0, 0.8039216, 1,
1.111319, 0.5787641, -0.2767132, 1, 0, 0.7960784, 1,
1.111518, 0.2138776, 2.531172, 1, 0, 0.7921569, 1,
1.118984, -0.6767503, 2.785593, 1, 0, 0.7843137, 1,
1.124988, 0.8407819, 1.361706, 1, 0, 0.7803922, 1,
1.125495, -0.6212668, 2.045801, 1, 0, 0.772549, 1,
1.13883, -0.4565628, 0.6578897, 1, 0, 0.7686275, 1,
1.143821, -1.775594, 2.192618, 1, 0, 0.7607843, 1,
1.144029, 1.125092, 0.3510566, 1, 0, 0.7568628, 1,
1.150902, -0.7975408, 3.26538, 1, 0, 0.7490196, 1,
1.151785, -0.03108486, 3.55765, 1, 0, 0.7450981, 1,
1.157401, 1.896468, 1.650944, 1, 0, 0.7372549, 1,
1.157444, 0.6527593, 2.238851, 1, 0, 0.7333333, 1,
1.158831, -0.1712203, 1.796229, 1, 0, 0.7254902, 1,
1.161651, 0.3881714, 1.66129, 1, 0, 0.7215686, 1,
1.165006, 0.03356699, -0.09369072, 1, 0, 0.7137255, 1,
1.16618, 0.2194733, 1.520033, 1, 0, 0.7098039, 1,
1.173616, -0.5487828, 2.371141, 1, 0, 0.7019608, 1,
1.174136, -0.710207, 3.088157, 1, 0, 0.6941177, 1,
1.177924, -0.1357546, 2.684966, 1, 0, 0.6901961, 1,
1.189897, -2.291872, 3.809382, 1, 0, 0.682353, 1,
1.193408, 0.936579, 0.6504483, 1, 0, 0.6784314, 1,
1.204638, -0.2924863, 2.865745, 1, 0, 0.6705883, 1,
1.209647, 0.01519075, 2.675434, 1, 0, 0.6666667, 1,
1.212219, 0.2441331, 1.197037, 1, 0, 0.6588235, 1,
1.222314, 0.334623, 0.7006627, 1, 0, 0.654902, 1,
1.224538, -1.858227, 4.648139, 1, 0, 0.6470588, 1,
1.23233, 1.322428, 0.08228746, 1, 0, 0.6431373, 1,
1.232343, -1.108135, 1.915594, 1, 0, 0.6352941, 1,
1.242645, -0.3000822, 1.323834, 1, 0, 0.6313726, 1,
1.248829, -0.7416533, 1.112475, 1, 0, 0.6235294, 1,
1.256729, 0.4750895, 0.576852, 1, 0, 0.6196079, 1,
1.26513, -2.614611, 1.614736, 1, 0, 0.6117647, 1,
1.26748, -0.9921026, 1.918515, 1, 0, 0.6078432, 1,
1.275738, 0.8148102, -1.13971, 1, 0, 0.6, 1,
1.278529, 0.3683035, 2.866809, 1, 0, 0.5921569, 1,
1.286685, 1.633724, -0.7836821, 1, 0, 0.5882353, 1,
1.299004, 1.565912, 1.573498, 1, 0, 0.5803922, 1,
1.30092, 0.1594293, 1.625443, 1, 0, 0.5764706, 1,
1.305063, -0.1163364, 1.446513, 1, 0, 0.5686275, 1,
1.305412, 0.582284, 2.081138, 1, 0, 0.5647059, 1,
1.335897, 1.571339, 2.822393, 1, 0, 0.5568628, 1,
1.341694, 0.07701679, 0.3576198, 1, 0, 0.5529412, 1,
1.357361, -1.956421, 2.331982, 1, 0, 0.5450981, 1,
1.364126, -0.862736, 1.473161, 1, 0, 0.5411765, 1,
1.3913, 0.6765009, 1.839901, 1, 0, 0.5333334, 1,
1.400844, -1.234985, 0.8472052, 1, 0, 0.5294118, 1,
1.404673, -0.9641611, 2.167381, 1, 0, 0.5215687, 1,
1.405654, 0.5026137, 0.8234788, 1, 0, 0.5176471, 1,
1.406018, -0.3653533, 2.942489, 1, 0, 0.509804, 1,
1.411964, 1.571594, 1.866633, 1, 0, 0.5058824, 1,
1.415077, -1.155855, 2.628696, 1, 0, 0.4980392, 1,
1.421939, 0.2345029, 0.2311653, 1, 0, 0.4901961, 1,
1.42338, -0.3345276, 3.042791, 1, 0, 0.4862745, 1,
1.4346, -0.316284, 2.271082, 1, 0, 0.4784314, 1,
1.443658, 0.3937594, 1.363021, 1, 0, 0.4745098, 1,
1.446615, -0.1480522, 2.1955, 1, 0, 0.4666667, 1,
1.457525, -0.7794943, 3.024752, 1, 0, 0.4627451, 1,
1.463003, -0.2408313, 2.281656, 1, 0, 0.454902, 1,
1.47373, -0.373101, 0.6287377, 1, 0, 0.4509804, 1,
1.476825, -0.004278732, -0.3157947, 1, 0, 0.4431373, 1,
1.477224, 0.4921376, 0.7955716, 1, 0, 0.4392157, 1,
1.509048, -0.7326776, 3.212251, 1, 0, 0.4313726, 1,
1.514628, -0.4587972, 2.401683, 1, 0, 0.427451, 1,
1.518602, 0.09581833, 1.967216, 1, 0, 0.4196078, 1,
1.528532, 0.9131188, 0.1215236, 1, 0, 0.4156863, 1,
1.533858, -0.05307917, 1.000737, 1, 0, 0.4078431, 1,
1.561262, 1.289688, 1.765521, 1, 0, 0.4039216, 1,
1.563863, 0.167546, 2.320636, 1, 0, 0.3960784, 1,
1.567799, 0.4894386, 2.274866, 1, 0, 0.3882353, 1,
1.571104, -0.619657, 3.306803, 1, 0, 0.3843137, 1,
1.5769, -0.07633373, 0.2114109, 1, 0, 0.3764706, 1,
1.577731, -1.190044, 2.570402, 1, 0, 0.372549, 1,
1.587782, 0.5414203, 1.584733, 1, 0, 0.3647059, 1,
1.599598, 0.06366768, -0.4538028, 1, 0, 0.3607843, 1,
1.607872, 2.165787, 0.01070903, 1, 0, 0.3529412, 1,
1.615412, 1.047343, 0.7478024, 1, 0, 0.3490196, 1,
1.616242, 2.230724, 0.5808936, 1, 0, 0.3411765, 1,
1.620292, 0.1571371, 2.417226, 1, 0, 0.3372549, 1,
1.630752, 0.7888806, 0.7201723, 1, 0, 0.3294118, 1,
1.635752, 0.3732343, 1.181247, 1, 0, 0.3254902, 1,
1.655307, -1.132282, 1.602753, 1, 0, 0.3176471, 1,
1.662838, -0.965449, 1.193352, 1, 0, 0.3137255, 1,
1.671386, 1.623033, 1.779307, 1, 0, 0.3058824, 1,
1.674197, -1.398374, 2.284124, 1, 0, 0.2980392, 1,
1.676894, -0.1185888, 0.6998269, 1, 0, 0.2941177, 1,
1.681685, -1.336239, 2.153964, 1, 0, 0.2862745, 1,
1.688233, -1.984596, 2.627249, 1, 0, 0.282353, 1,
1.696557, -2.167078, 1.610998, 1, 0, 0.2745098, 1,
1.700343, -1.833502, 1.239466, 1, 0, 0.2705882, 1,
1.703943, 0.03284902, 2.707553, 1, 0, 0.2627451, 1,
1.708244, -0.9402909, 3.139055, 1, 0, 0.2588235, 1,
1.719961, -0.7369378, 1.633734, 1, 0, 0.2509804, 1,
1.748011, 0.2631015, 1.905981, 1, 0, 0.2470588, 1,
1.764496, 0.9519361, 1.449009, 1, 0, 0.2392157, 1,
1.783779, 2.101525, 3.016063, 1, 0, 0.2352941, 1,
1.791341, -0.3895985, 2.355149, 1, 0, 0.227451, 1,
1.792258, -0.4222168, 0.1092827, 1, 0, 0.2235294, 1,
1.793552, -0.9629811, 0.2588853, 1, 0, 0.2156863, 1,
1.812391, 0.8434647, 0.5383296, 1, 0, 0.2117647, 1,
1.834871, 0.8084325, 1.619669, 1, 0, 0.2039216, 1,
1.83556, 0.05359688, 0.1651734, 1, 0, 0.1960784, 1,
1.846122, -0.6500099, 2.446895, 1, 0, 0.1921569, 1,
1.850398, -0.246403, 1.373666, 1, 0, 0.1843137, 1,
1.883364, 1.048199, 1.323092, 1, 0, 0.1803922, 1,
1.884358, -0.6708435, 0.8692073, 1, 0, 0.172549, 1,
1.924234, -1.763414, 1.809879, 1, 0, 0.1686275, 1,
1.92468, 0.5041659, 2.679502, 1, 0, 0.1607843, 1,
1.948899, -2.010625, 2.306575, 1, 0, 0.1568628, 1,
1.967408, -0.5782, 2.336312, 1, 0, 0.1490196, 1,
2.012753, 1.229076, 0.7626503, 1, 0, 0.145098, 1,
2.015986, 1.315759, 0.3992469, 1, 0, 0.1372549, 1,
2.035695, 0.1331894, 1.787454, 1, 0, 0.1333333, 1,
2.072985, 0.7244757, 0.8464915, 1, 0, 0.1254902, 1,
2.075478, 0.09777244, 1.062119, 1, 0, 0.1215686, 1,
2.09473, 1.496858, 2.086826, 1, 0, 0.1137255, 1,
2.097115, 0.8258551, 1.811633, 1, 0, 0.1098039, 1,
2.097158, -0.5355613, 0.4112504, 1, 0, 0.1019608, 1,
2.105379, 0.2304273, 1.365183, 1, 0, 0.09411765, 1,
2.129761, -0.2245832, 2.050624, 1, 0, 0.09019608, 1,
2.14448, 0.8942531, 1.012643, 1, 0, 0.08235294, 1,
2.154028, 0.8793617, 0.4039577, 1, 0, 0.07843138, 1,
2.208144, -0.2140916, 1.161453, 1, 0, 0.07058824, 1,
2.269933, 0.8881735, -0.2735264, 1, 0, 0.06666667, 1,
2.2782, -1.031752, 3.534981, 1, 0, 0.05882353, 1,
2.299764, -1.051157, 0.8693368, 1, 0, 0.05490196, 1,
2.379916, -1.398426, 2.156379, 1, 0, 0.04705882, 1,
2.38347, -0.5795612, 3.169622, 1, 0, 0.04313726, 1,
2.437988, -0.203299, 4.067268, 1, 0, 0.03529412, 1,
2.444262, -1.09704, 2.776488, 1, 0, 0.03137255, 1,
2.452495, 1.19369, 1.415329, 1, 0, 0.02352941, 1,
2.594547, -0.8248814, 0.5251908, 1, 0, 0.01960784, 1,
2.62049, 1.866298, 0.2276558, 1, 0, 0.01176471, 1,
2.876157, -0.8359708, 1.900987, 1, 0, 0.007843138, 1
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
-0.002506614, -3.792851, -7.756752, 0, -0.5, 0.5, 0.5,
-0.002506614, -3.792851, -7.756752, 1, -0.5, 0.5, 0.5,
-0.002506614, -3.792851, -7.756752, 1, 1.5, 0.5, 0.5,
-0.002506614, -3.792851, -7.756752, 0, 1.5, 0.5, 0.5
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
-3.857037, 0.4231647, -7.756752, 0, -0.5, 0.5, 0.5,
-3.857037, 0.4231647, -7.756752, 1, -0.5, 0.5, 0.5,
-3.857037, 0.4231647, -7.756752, 1, 1.5, 0.5, 0.5,
-3.857037, 0.4231647, -7.756752, 0, 1.5, 0.5, 0.5
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
-3.857037, -3.792851, -0.04803872, 0, -0.5, 0.5, 0.5,
-3.857037, -3.792851, -0.04803872, 1, -0.5, 0.5, 0.5,
-3.857037, -3.792851, -0.04803872, 1, 1.5, 0.5, 0.5,
-3.857037, -3.792851, -0.04803872, 0, 1.5, 0.5, 0.5
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
-2, -2.819925, -5.977818,
2, -2.819925, -5.977818,
-2, -2.819925, -5.977818,
-2, -2.982079, -6.274308,
-1, -2.819925, -5.977818,
-1, -2.982079, -6.274308,
0, -2.819925, -5.977818,
0, -2.982079, -6.274308,
1, -2.819925, -5.977818,
1, -2.982079, -6.274308,
2, -2.819925, -5.977818,
2, -2.982079, -6.274308
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
-2, -3.306388, -6.867286, 0, -0.5, 0.5, 0.5,
-2, -3.306388, -6.867286, 1, -0.5, 0.5, 0.5,
-2, -3.306388, -6.867286, 1, 1.5, 0.5, 0.5,
-2, -3.306388, -6.867286, 0, 1.5, 0.5, 0.5,
-1, -3.306388, -6.867286, 0, -0.5, 0.5, 0.5,
-1, -3.306388, -6.867286, 1, -0.5, 0.5, 0.5,
-1, -3.306388, -6.867286, 1, 1.5, 0.5, 0.5,
-1, -3.306388, -6.867286, 0, 1.5, 0.5, 0.5,
0, -3.306388, -6.867286, 0, -0.5, 0.5, 0.5,
0, -3.306388, -6.867286, 1, -0.5, 0.5, 0.5,
0, -3.306388, -6.867286, 1, 1.5, 0.5, 0.5,
0, -3.306388, -6.867286, 0, 1.5, 0.5, 0.5,
1, -3.306388, -6.867286, 0, -0.5, 0.5, 0.5,
1, -3.306388, -6.867286, 1, -0.5, 0.5, 0.5,
1, -3.306388, -6.867286, 1, 1.5, 0.5, 0.5,
1, -3.306388, -6.867286, 0, 1.5, 0.5, 0.5,
2, -3.306388, -6.867286, 0, -0.5, 0.5, 0.5,
2, -3.306388, -6.867286, 1, -0.5, 0.5, 0.5,
2, -3.306388, -6.867286, 1, 1.5, 0.5, 0.5,
2, -3.306388, -6.867286, 0, 1.5, 0.5, 0.5
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
-2.96753, -2, -5.977818,
-2.96753, 3, -5.977818,
-2.96753, -2, -5.977818,
-3.115781, -2, -6.274308,
-2.96753, -1, -5.977818,
-3.115781, -1, -6.274308,
-2.96753, 0, -5.977818,
-3.115781, 0, -6.274308,
-2.96753, 1, -5.977818,
-3.115781, 1, -6.274308,
-2.96753, 2, -5.977818,
-3.115781, 2, -6.274308,
-2.96753, 3, -5.977818,
-3.115781, 3, -6.274308
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
-3.412283, -2, -6.867286, 0, -0.5, 0.5, 0.5,
-3.412283, -2, -6.867286, 1, -0.5, 0.5, 0.5,
-3.412283, -2, -6.867286, 1, 1.5, 0.5, 0.5,
-3.412283, -2, -6.867286, 0, 1.5, 0.5, 0.5,
-3.412283, -1, -6.867286, 0, -0.5, 0.5, 0.5,
-3.412283, -1, -6.867286, 1, -0.5, 0.5, 0.5,
-3.412283, -1, -6.867286, 1, 1.5, 0.5, 0.5,
-3.412283, -1, -6.867286, 0, 1.5, 0.5, 0.5,
-3.412283, 0, -6.867286, 0, -0.5, 0.5, 0.5,
-3.412283, 0, -6.867286, 1, -0.5, 0.5, 0.5,
-3.412283, 0, -6.867286, 1, 1.5, 0.5, 0.5,
-3.412283, 0, -6.867286, 0, 1.5, 0.5, 0.5,
-3.412283, 1, -6.867286, 0, -0.5, 0.5, 0.5,
-3.412283, 1, -6.867286, 1, -0.5, 0.5, 0.5,
-3.412283, 1, -6.867286, 1, 1.5, 0.5, 0.5,
-3.412283, 1, -6.867286, 0, 1.5, 0.5, 0.5,
-3.412283, 2, -6.867286, 0, -0.5, 0.5, 0.5,
-3.412283, 2, -6.867286, 1, -0.5, 0.5, 0.5,
-3.412283, 2, -6.867286, 1, 1.5, 0.5, 0.5,
-3.412283, 2, -6.867286, 0, 1.5, 0.5, 0.5,
-3.412283, 3, -6.867286, 0, -0.5, 0.5, 0.5,
-3.412283, 3, -6.867286, 1, -0.5, 0.5, 0.5,
-3.412283, 3, -6.867286, 1, 1.5, 0.5, 0.5,
-3.412283, 3, -6.867286, 0, 1.5, 0.5, 0.5
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
-2.96753, -2.819925, -4,
-2.96753, -2.819925, 4,
-2.96753, -2.819925, -4,
-3.115781, -2.982079, -4,
-2.96753, -2.819925, -2,
-3.115781, -2.982079, -2,
-2.96753, -2.819925, 0,
-3.115781, -2.982079, 0,
-2.96753, -2.819925, 2,
-3.115781, -2.982079, 2,
-2.96753, -2.819925, 4,
-3.115781, -2.982079, 4
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
-3.412283, -3.306388, -4, 0, -0.5, 0.5, 0.5,
-3.412283, -3.306388, -4, 1, -0.5, 0.5, 0.5,
-3.412283, -3.306388, -4, 1, 1.5, 0.5, 0.5,
-3.412283, -3.306388, -4, 0, 1.5, 0.5, 0.5,
-3.412283, -3.306388, -2, 0, -0.5, 0.5, 0.5,
-3.412283, -3.306388, -2, 1, -0.5, 0.5, 0.5,
-3.412283, -3.306388, -2, 1, 1.5, 0.5, 0.5,
-3.412283, -3.306388, -2, 0, 1.5, 0.5, 0.5,
-3.412283, -3.306388, 0, 0, -0.5, 0.5, 0.5,
-3.412283, -3.306388, 0, 1, -0.5, 0.5, 0.5,
-3.412283, -3.306388, 0, 1, 1.5, 0.5, 0.5,
-3.412283, -3.306388, 0, 0, 1.5, 0.5, 0.5,
-3.412283, -3.306388, 2, 0, -0.5, 0.5, 0.5,
-3.412283, -3.306388, 2, 1, -0.5, 0.5, 0.5,
-3.412283, -3.306388, 2, 1, 1.5, 0.5, 0.5,
-3.412283, -3.306388, 2, 0, 1.5, 0.5, 0.5,
-3.412283, -3.306388, 4, 0, -0.5, 0.5, 0.5,
-3.412283, -3.306388, 4, 1, -0.5, 0.5, 0.5,
-3.412283, -3.306388, 4, 1, 1.5, 0.5, 0.5,
-3.412283, -3.306388, 4, 0, 1.5, 0.5, 0.5
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
-2.96753, -2.819925, -5.977818,
-2.96753, 3.666254, -5.977818,
-2.96753, -2.819925, 5.881741,
-2.96753, 3.666254, 5.881741,
-2.96753, -2.819925, -5.977818,
-2.96753, -2.819925, 5.881741,
-2.96753, 3.666254, -5.977818,
-2.96753, 3.666254, 5.881741,
-2.96753, -2.819925, -5.977818,
2.962517, -2.819925, -5.977818,
-2.96753, -2.819925, 5.881741,
2.962517, -2.819925, 5.881741,
-2.96753, 3.666254, -5.977818,
2.962517, 3.666254, -5.977818,
-2.96753, 3.666254, 5.881741,
2.962517, 3.666254, 5.881741,
2.962517, -2.819925, -5.977818,
2.962517, 3.666254, -5.977818,
2.962517, -2.819925, 5.881741,
2.962517, 3.666254, 5.881741,
2.962517, -2.819925, -5.977818,
2.962517, -2.819925, 5.881741,
2.962517, 3.666254, -5.977818,
2.962517, 3.666254, 5.881741
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
var radius = 7.882051;
var distance = 35.06814;
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
mvMatrix.translate( 0.002506614, -0.4231647, 0.04803872 );
mvMatrix.scale( 1.437127, 1.313906, 0.7185957 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.06814);
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
hexanecarboxylate_io<-read.table("hexanecarboxylate_io.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hexanecarboxylate_io$V2
```

```
## Error in eval(expr, envir, enclos): object 'hexanecarboxylate_io' not found
```

```r
y<-hexanecarboxylate_io$V3
```

```
## Error in eval(expr, envir, enclos): object 'hexanecarboxylate_io' not found
```

```r
z<-hexanecarboxylate_io$V4
```

```
## Error in eval(expr, envir, enclos): object 'hexanecarboxylate_io' not found
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
-2.88117, -1.13438, -1.243305, 0, 0, 1, 1, 1,
-2.735855, -0.5165333, -1.516742, 1, 0, 0, 1, 1,
-2.711473, -0.1883483, -2.620103, 1, 0, 0, 1, 1,
-2.656722, -0.1044624, -2.03939, 1, 0, 0, 1, 1,
-2.588311, 0.8052094, -2.222039, 1, 0, 0, 1, 1,
-2.513885, 0.481941, -2.662349, 1, 0, 0, 1, 1,
-2.477381, -0.1119575, -1.777165, 0, 0, 0, 1, 1,
-2.414434, -0.4638088, -1.114872, 0, 0, 0, 1, 1,
-2.402456, 0.1476933, -1.140926, 0, 0, 0, 1, 1,
-2.379132, -1.516169, -1.804933, 0, 0, 0, 1, 1,
-2.369906, 0.1752006, -1.007733, 0, 0, 0, 1, 1,
-2.167613, -0.1461055, -0.8080661, 0, 0, 0, 1, 1,
-2.146785, -1.168591, -2.227749, 0, 0, 0, 1, 1,
-2.12857, -1.393459, -3.211015, 1, 1, 1, 1, 1,
-2.081902, 0.4011684, -1.465884, 1, 1, 1, 1, 1,
-2.081309, 0.1517334, 0.4614427, 1, 1, 1, 1, 1,
-2.067733, 0.5837356, -0.8280095, 1, 1, 1, 1, 1,
-2.057518, 2.583795, -0.1922756, 1, 1, 1, 1, 1,
-1.995196, 0.05561405, 1.372881, 1, 1, 1, 1, 1,
-1.994851, -0.211797, -1.098284, 1, 1, 1, 1, 1,
-1.970745, -1.108287, -1.00937, 1, 1, 1, 1, 1,
-1.970612, 0.806577, -2.147023, 1, 1, 1, 1, 1,
-1.966228, -1.066216, -2.437873, 1, 1, 1, 1, 1,
-1.955734, 0.8490633, -1.786369, 1, 1, 1, 1, 1,
-1.9174, 0.1069338, -1.143534, 1, 1, 1, 1, 1,
-1.916891, -0.546127, -2.665203, 1, 1, 1, 1, 1,
-1.900711, 1.538857, -1.584359, 1, 1, 1, 1, 1,
-1.88712, 0.245595, -2.531226, 1, 1, 1, 1, 1,
-1.886592, -0.1634733, -3.14233, 0, 0, 1, 1, 1,
-1.878042, 1.940173, 1.046548, 1, 0, 0, 1, 1,
-1.853829, 0.1025305, -2.351797, 1, 0, 0, 1, 1,
-1.838231, -0.8969954, -2.367601, 1, 0, 0, 1, 1,
-1.825329, -1.113482, 0.100954, 1, 0, 0, 1, 1,
-1.805771, 2.186331, -0.6883566, 1, 0, 0, 1, 1,
-1.770481, -1.109376, -4.375721, 0, 0, 0, 1, 1,
-1.760824, 0.2744329, -1.362664, 0, 0, 0, 1, 1,
-1.745586, 1.655214, -1.045696, 0, 0, 0, 1, 1,
-1.739043, -0.2518122, -2.185645, 0, 0, 0, 1, 1,
-1.738017, 0.2799457, -0.7200707, 0, 0, 0, 1, 1,
-1.733499, 0.2858611, -0.9334984, 0, 0, 0, 1, 1,
-1.732775, -0.2255837, -2.652409, 0, 0, 0, 1, 1,
-1.732749, 0.5351483, -1.052278, 1, 1, 1, 1, 1,
-1.729059, 1.077645, -0.8217854, 1, 1, 1, 1, 1,
-1.725559, 1.354685, -0.9757172, 1, 1, 1, 1, 1,
-1.710561, -1.107744, -1.834266, 1, 1, 1, 1, 1,
-1.685685, -0.8345308, -1.404313, 1, 1, 1, 1, 1,
-1.665636, -1.45767, -2.640891, 1, 1, 1, 1, 1,
-1.66506, 0.1155411, -2.178843, 1, 1, 1, 1, 1,
-1.642593, -0.4469477, -1.839881, 1, 1, 1, 1, 1,
-1.640735, 0.7111349, 1.273878, 1, 1, 1, 1, 1,
-1.638777, -1.42091, -0.5369452, 1, 1, 1, 1, 1,
-1.635457, 0.2704138, -0.05925607, 1, 1, 1, 1, 1,
-1.634454, -0.8947888, -1.846336, 1, 1, 1, 1, 1,
-1.631383, -1.518667, -3.018094, 1, 1, 1, 1, 1,
-1.598529, -0.1800044, -3.430431, 1, 1, 1, 1, 1,
-1.593415, 1.312086, -0.3356006, 1, 1, 1, 1, 1,
-1.561648, -2.413523, -2.74844, 0, 0, 1, 1, 1,
-1.530363, 0.7685551, -2.612687, 1, 0, 0, 1, 1,
-1.523553, 1.198267, -1.504697, 1, 0, 0, 1, 1,
-1.523346, -0.8566605, -2.46177, 1, 0, 0, 1, 1,
-1.512392, 1.036951, -2.778319, 1, 0, 0, 1, 1,
-1.501428, -0.3778498, -3.970482, 1, 0, 0, 1, 1,
-1.480142, -0.5166479, -1.925785, 0, 0, 0, 1, 1,
-1.468831, 0.1896463, -2.137593, 0, 0, 0, 1, 1,
-1.465551, 0.3448606, -3.152515, 0, 0, 0, 1, 1,
-1.458105, -0.01852355, -2.283476, 0, 0, 0, 1, 1,
-1.44736, 0.7480591, -0.7577512, 0, 0, 0, 1, 1,
-1.447273, 1.225344, 0.2151277, 0, 0, 0, 1, 1,
-1.443478, 1.561255, -0.1741682, 0, 0, 0, 1, 1,
-1.430991, 3.341596, -1.175067, 1, 1, 1, 1, 1,
-1.427029, 0.321905, -1.917768, 1, 1, 1, 1, 1,
-1.415143, 0.188257, -0.7183868, 1, 1, 1, 1, 1,
-1.41317, -0.9593722, -2.374479, 1, 1, 1, 1, 1,
-1.40389, 0.09507683, -2.900383, 1, 1, 1, 1, 1,
-1.402837, 0.8052362, -0.9547516, 1, 1, 1, 1, 1,
-1.401336, -0.9043521, -3.029276, 1, 1, 1, 1, 1,
-1.40094, 1.630431, 0.04684679, 1, 1, 1, 1, 1,
-1.397933, 1.114595, -0.6232798, 1, 1, 1, 1, 1,
-1.39219, 1.417591, -0.3432124, 1, 1, 1, 1, 1,
-1.369119, -1.627994, -1.905118, 1, 1, 1, 1, 1,
-1.364691, -0.5243425, -2.294113, 1, 1, 1, 1, 1,
-1.363104, -0.06035825, -1.074716, 1, 1, 1, 1, 1,
-1.360415, -1.060512, -2.322452, 1, 1, 1, 1, 1,
-1.359993, -0.3635401, -0.986626, 1, 1, 1, 1, 1,
-1.355506, 1.263129, -1.351074, 0, 0, 1, 1, 1,
-1.343715, -2.09849, -1.248271, 1, 0, 0, 1, 1,
-1.340585, -0.373271, -1.397522, 1, 0, 0, 1, 1,
-1.306689, -2.384485, -3.458668, 1, 0, 0, 1, 1,
-1.305503, -0.2722325, -1.976516, 1, 0, 0, 1, 1,
-1.292116, -1.499798, -2.149935, 1, 0, 0, 1, 1,
-1.286983, -0.9408391, -3.494021, 0, 0, 0, 1, 1,
-1.275955, -2.266512, -2.875776, 0, 0, 0, 1, 1,
-1.275033, 0.005068762, -1.180175, 0, 0, 0, 1, 1,
-1.271866, -0.5998025, -2.79073, 0, 0, 0, 1, 1,
-1.271097, -0.2604725, -1.287444, 0, 0, 0, 1, 1,
-1.264628, -1.370019, -2.44337, 0, 0, 0, 1, 1,
-1.260405, 0.08987772, -0.5371616, 0, 0, 0, 1, 1,
-1.256109, 1.000754, -1.245521, 1, 1, 1, 1, 1,
-1.25535, 0.2803442, -0.8414768, 1, 1, 1, 1, 1,
-1.247881, -0.4681759, -1.878539, 1, 1, 1, 1, 1,
-1.24099, 0.6903314, -0.8542561, 1, 1, 1, 1, 1,
-1.22833, 2.161685, -0.566438, 1, 1, 1, 1, 1,
-1.228076, -0.1244606, -1.399943, 1, 1, 1, 1, 1,
-1.227879, 0.1700851, -1.665098, 1, 1, 1, 1, 1,
-1.223834, -0.1193475, -3.184254, 1, 1, 1, 1, 1,
-1.202903, -1.257043, -1.003306, 1, 1, 1, 1, 1,
-1.19714, 0.9012608, -0.1868784, 1, 1, 1, 1, 1,
-1.194976, -0.1323311, -1.983887, 1, 1, 1, 1, 1,
-1.191418, -0.6907168, -2.271795, 1, 1, 1, 1, 1,
-1.185665, -0.6891789, -3.52627, 1, 1, 1, 1, 1,
-1.185595, 0.5899724, -3.845748, 1, 1, 1, 1, 1,
-1.182016, -0.1632718, -0.2485055, 1, 1, 1, 1, 1,
-1.178287, 0.412412, -0.4727458, 0, 0, 1, 1, 1,
-1.168989, -1.553357, -2.700244, 1, 0, 0, 1, 1,
-1.16494, 0.9419953, -2.104584, 1, 0, 0, 1, 1,
-1.160717, -0.9519873, -1.383663, 1, 0, 0, 1, 1,
-1.160306, 1.397414, -1.03237, 1, 0, 0, 1, 1,
-1.157479, 0.1913385, -1.020265, 1, 0, 0, 1, 1,
-1.155186, 0.4675025, -2.349556, 0, 0, 0, 1, 1,
-1.149352, 1.518147, -0.2846497, 0, 0, 0, 1, 1,
-1.146127, -1.122723, -2.301669, 0, 0, 0, 1, 1,
-1.144811, 1.573504, -1.991282, 0, 0, 0, 1, 1,
-1.143758, -0.6198343, -3.013194, 0, 0, 0, 1, 1,
-1.14268, -0.5133205, -1.299773, 0, 0, 0, 1, 1,
-1.14266, -1.024686, -5.169937, 0, 0, 0, 1, 1,
-1.139559, 0.05902431, -2.692783, 1, 1, 1, 1, 1,
-1.139518, 0.0733725, 0.329061, 1, 1, 1, 1, 1,
-1.136764, -0.8226974, -1.517421, 1, 1, 1, 1, 1,
-1.136752, -2.725466, -2.420923, 1, 1, 1, 1, 1,
-1.132821, 0.6897557, 0.1254734, 1, 1, 1, 1, 1,
-1.132327, 0.9608848, -1.188871, 1, 1, 1, 1, 1,
-1.129262, 0.5171627, -0.9469598, 1, 1, 1, 1, 1,
-1.127275, -1.788023, -4.533654, 1, 1, 1, 1, 1,
-1.126316, 0.5903857, -2.894013, 1, 1, 1, 1, 1,
-1.122422, 0.3201095, -2.798824, 1, 1, 1, 1, 1,
-1.112871, -0.4544311, -0.4288909, 1, 1, 1, 1, 1,
-1.112178, 1.821283, -0.5473816, 1, 1, 1, 1, 1,
-1.107864, -1.226276, -2.354661, 1, 1, 1, 1, 1,
-1.10548, 1.956772, -0.3643346, 1, 1, 1, 1, 1,
-1.104627, 2.633497, 0.6621717, 1, 1, 1, 1, 1,
-1.10202, 0.9218155, -2.059252, 0, 0, 1, 1, 1,
-1.101385, 0.04439097, -0.9667488, 1, 0, 0, 1, 1,
-1.084383, -0.2435375, -2.024729, 1, 0, 0, 1, 1,
-1.082029, 1.391779, -0.4836133, 1, 0, 0, 1, 1,
-1.079818, 0.277043, 0.2058478, 1, 0, 0, 1, 1,
-1.078604, 0.843372, -1.091903, 1, 0, 0, 1, 1,
-1.077141, 1.090872, -1.021052, 0, 0, 0, 1, 1,
-1.071873, 0.1801646, -1.422209, 0, 0, 0, 1, 1,
-1.070733, 1.218102, -0.9678378, 0, 0, 0, 1, 1,
-1.070695, -1.472541, -1.452545, 0, 0, 0, 1, 1,
-1.064, 0.1715872, -1.008563, 0, 0, 0, 1, 1,
-1.06273, -1.380286, -2.019861, 0, 0, 0, 1, 1,
-1.05776, -0.8320838, -3.097777, 0, 0, 0, 1, 1,
-1.05703, -2.332387, -2.442694, 1, 1, 1, 1, 1,
-1.053638, 0.3827577, -1.382562, 1, 1, 1, 1, 1,
-1.044542, -0.4774782, -1.983428, 1, 1, 1, 1, 1,
-1.036461, -1.226328, -4.186064, 1, 1, 1, 1, 1,
-1.036301, -1.82446, -1.769364, 1, 1, 1, 1, 1,
-1.028224, -0.1852443, -3.14173, 1, 1, 1, 1, 1,
-1.021603, -0.822148, -2.401339, 1, 1, 1, 1, 1,
-1.018535, 0.8093436, 0.1087655, 1, 1, 1, 1, 1,
-1.018094, 1.420958, -1.11181, 1, 1, 1, 1, 1,
-1.016174, -0.3373486, -2.71528, 1, 1, 1, 1, 1,
-1.015549, -1.765023, -2.451374, 1, 1, 1, 1, 1,
-0.9955257, -1.895612, -2.902849, 1, 1, 1, 1, 1,
-0.9946629, -1.705803, -3.259953, 1, 1, 1, 1, 1,
-0.9862759, -0.7625645, -2.693272, 1, 1, 1, 1, 1,
-0.979614, -0.9400293, -3.638991, 1, 1, 1, 1, 1,
-0.9642856, 2.082879, -1.324215, 0, 0, 1, 1, 1,
-0.9622745, 0.1612432, -0.9660605, 1, 0, 0, 1, 1,
-0.9621044, -0.6427881, -2.130552, 1, 0, 0, 1, 1,
-0.9620374, 0.7780285, -1.922493, 1, 0, 0, 1, 1,
-0.9603693, 0.4846624, -0.870239, 1, 0, 0, 1, 1,
-0.9566426, -1.117299, -3.435932, 1, 0, 0, 1, 1,
-0.9538468, -1.160378, -2.460833, 0, 0, 0, 1, 1,
-0.9534412, -0.3044737, -0.5140725, 0, 0, 0, 1, 1,
-0.9457923, 1.399041, -0.6634216, 0, 0, 0, 1, 1,
-0.9439197, 1.571573, -1.908919, 0, 0, 0, 1, 1,
-0.9435558, -0.04783112, 0.1159623, 0, 0, 0, 1, 1,
-0.9303489, 1.211846, -1.950732, 0, 0, 0, 1, 1,
-0.9302183, -0.5966536, -4.062973, 0, 0, 0, 1, 1,
-0.9255833, -0.2386792, -1.31915, 1, 1, 1, 1, 1,
-0.9216916, 0.7263216, -0.8938259, 1, 1, 1, 1, 1,
-0.91831, 0.4823197, -1.876672, 1, 1, 1, 1, 1,
-0.9154677, -0.2645438, -2.508575, 1, 1, 1, 1, 1,
-0.9115769, 0.7491111, -2.964286, 1, 1, 1, 1, 1,
-0.905692, -0.9381102, -4.047299, 1, 1, 1, 1, 1,
-0.8955694, -0.3527384, -1.415971, 1, 1, 1, 1, 1,
-0.8922158, 1.013942, -1.155257, 1, 1, 1, 1, 1,
-0.8859242, 0.9495273, 0.06321076, 1, 1, 1, 1, 1,
-0.8756604, -0.6511186, 0.292691, 1, 1, 1, 1, 1,
-0.873116, -0.9007872, -2.841513, 1, 1, 1, 1, 1,
-0.8657845, 2.389089, -1.245629, 1, 1, 1, 1, 1,
-0.8648355, -0.1343756, -2.549102, 1, 1, 1, 1, 1,
-0.864324, 0.4474639, 0.2210606, 1, 1, 1, 1, 1,
-0.8626345, -0.5282969, -3.129529, 1, 1, 1, 1, 1,
-0.861864, -0.396413, -2.434469, 0, 0, 1, 1, 1,
-0.8611323, -0.04587223, -1.369727, 1, 0, 0, 1, 1,
-0.8528402, -0.04433553, -1.146263, 1, 0, 0, 1, 1,
-0.8509499, 1.330716, -2.257844, 1, 0, 0, 1, 1,
-0.8439993, 1.086836, 0.6407415, 1, 0, 0, 1, 1,
-0.8374789, 0.2043986, -2.241839, 1, 0, 0, 1, 1,
-0.815643, -0.4202422, -1.999137, 0, 0, 0, 1, 1,
-0.8136749, -1.335763, -0.7641356, 0, 0, 0, 1, 1,
-0.8136424, -0.1273359, -2.068851, 0, 0, 0, 1, 1,
-0.8135092, -0.2428116, -1.526014, 0, 0, 0, 1, 1,
-0.8062959, 1.845052, 0.08180434, 0, 0, 0, 1, 1,
-0.8058105, -0.9809889, -1.199978, 0, 0, 0, 1, 1,
-0.8045802, 0.715134, -1.027366, 0, 0, 0, 1, 1,
-0.7906443, -0.9928859, -2.958731, 1, 1, 1, 1, 1,
-0.7900282, -0.7678848, -1.694068, 1, 1, 1, 1, 1,
-0.7842678, -1.23472, -3.847805, 1, 1, 1, 1, 1,
-0.7800968, -1.406135, -2.584234, 1, 1, 1, 1, 1,
-0.7725475, 0.5309507, -1.690373, 1, 1, 1, 1, 1,
-0.765926, 0.7528684, -0.973692, 1, 1, 1, 1, 1,
-0.765614, -1.393258, -1.407563, 1, 1, 1, 1, 1,
-0.7628495, 0.2896724, -0.7739023, 1, 1, 1, 1, 1,
-0.7617285, -0.1155018, -1.136867, 1, 1, 1, 1, 1,
-0.7607515, 1.74147, -0.7627183, 1, 1, 1, 1, 1,
-0.7596483, 0.7674548, -1.120529, 1, 1, 1, 1, 1,
-0.7574451, -0.7242012, -1.78419, 1, 1, 1, 1, 1,
-0.7540358, -0.6785873, -1.961168, 1, 1, 1, 1, 1,
-0.749059, -0.4301865, -1.940199, 1, 1, 1, 1, 1,
-0.7456352, 0.6392441, -0.210757, 1, 1, 1, 1, 1,
-0.7442578, 0.629823, -1.485059, 0, 0, 1, 1, 1,
-0.7438053, 1.307472, 0.2432899, 1, 0, 0, 1, 1,
-0.7431629, 0.4286261, -0.9371831, 1, 0, 0, 1, 1,
-0.7416146, -0.9436858, -2.028705, 1, 0, 0, 1, 1,
-0.7393336, 0.1278648, -4.475237, 1, 0, 0, 1, 1,
-0.7381282, -0.636671, -0.6021004, 1, 0, 0, 1, 1,
-0.7344801, 0.9596018, 0.6368592, 0, 0, 0, 1, 1,
-0.7343704, 0.7582031, -1.9725, 0, 0, 0, 1, 1,
-0.7310298, 1.592597, -2.168345, 0, 0, 0, 1, 1,
-0.7278845, 0.7570871, -0.4764454, 0, 0, 0, 1, 1,
-0.7188492, -0.1410622, -0.8587705, 0, 0, 0, 1, 1,
-0.7181772, -0.07305742, -0.1119312, 0, 0, 0, 1, 1,
-0.7119796, 0.1143524, -2.583965, 0, 0, 0, 1, 1,
-0.7111464, 0.03199837, -1.153325, 1, 1, 1, 1, 1,
-0.7081717, 0.3001394, -0.5931457, 1, 1, 1, 1, 1,
-0.7008834, -0.854364, -2.335726, 1, 1, 1, 1, 1,
-0.693588, 1.119326, -1.902107, 1, 1, 1, 1, 1,
-0.6905509, -1.801482, -1.15574, 1, 1, 1, 1, 1,
-0.6885885, -0.1855736, -1.836228, 1, 1, 1, 1, 1,
-0.6879542, -0.7379358, -4.001622, 1, 1, 1, 1, 1,
-0.6865532, 1.615365, -0.9089844, 1, 1, 1, 1, 1,
-0.6855493, -0.5310125, -0.6863832, 1, 1, 1, 1, 1,
-0.684453, -0.5809567, -2.625109, 1, 1, 1, 1, 1,
-0.6686329, -0.1414371, -0.392467, 1, 1, 1, 1, 1,
-0.662598, 0.7063705, -1.168862, 1, 1, 1, 1, 1,
-0.6595482, 1.99364, 0.635053, 1, 1, 1, 1, 1,
-0.65727, -0.5639355, -3.569548, 1, 1, 1, 1, 1,
-0.6515096, 0.3331593, -2.41611, 1, 1, 1, 1, 1,
-0.6451759, -1.21864, -0.8862087, 0, 0, 1, 1, 1,
-0.6451609, -0.7276641, -3.584098, 1, 0, 0, 1, 1,
-0.6420941, 1.718255, -0.5865352, 1, 0, 0, 1, 1,
-0.640583, -1.04407, -2.524889, 1, 0, 0, 1, 1,
-0.6317044, 1.783844, -0.3311892, 1, 0, 0, 1, 1,
-0.620672, -1.511711, -4.372879, 1, 0, 0, 1, 1,
-0.6201466, 1.186271, 0.07983738, 0, 0, 0, 1, 1,
-0.6196487, -0.6660356, -1.197883, 0, 0, 0, 1, 1,
-0.6129115, 0.2879416, -0.5943974, 0, 0, 0, 1, 1,
-0.6062269, 1.756385, -0.167389, 0, 0, 0, 1, 1,
-0.6058894, -0.2340484, -1.847143, 0, 0, 0, 1, 1,
-0.601172, -0.6012335, -3.47498, 0, 0, 0, 1, 1,
-0.5971303, -0.5215523, -2.532208, 0, 0, 0, 1, 1,
-0.5958695, -0.1891559, -2.426259, 1, 1, 1, 1, 1,
-0.5899873, -0.997997, -3.264144, 1, 1, 1, 1, 1,
-0.5886498, 0.02537256, 0.2001903, 1, 1, 1, 1, 1,
-0.5813659, -0.8560398, -4.731736, 1, 1, 1, 1, 1,
-0.570155, 0.3336241, 0.1390619, 1, 1, 1, 1, 1,
-0.5678883, 0.4164256, -0.2040216, 1, 1, 1, 1, 1,
-0.5552301, 0.6973737, 0.6643112, 1, 1, 1, 1, 1,
-0.5535838, 0.1129118, -0.9356276, 1, 1, 1, 1, 1,
-0.5506569, 0.5184444, -1.591819, 1, 1, 1, 1, 1,
-0.550542, 1.932034, -0.3320427, 1, 1, 1, 1, 1,
-0.5494499, -0.3485939, -2.741571, 1, 1, 1, 1, 1,
-0.5486211, -0.5538093, -4.741969, 1, 1, 1, 1, 1,
-0.548586, -0.2186102, -2.052454, 1, 1, 1, 1, 1,
-0.5444634, 0.7202086, 0.5369726, 1, 1, 1, 1, 1,
-0.5406577, -0.1657592, -1.916541, 1, 1, 1, 1, 1,
-0.5383435, -1.134867, -1.232963, 0, 0, 1, 1, 1,
-0.5368287, 2.429278, -2.011772, 1, 0, 0, 1, 1,
-0.5357985, 1.540106, 0.8475092, 1, 0, 0, 1, 1,
-0.5321792, -1.750121, -4.451464, 1, 0, 0, 1, 1,
-0.5269784, -0.8803782, -1.849222, 1, 0, 0, 1, 1,
-0.5251983, 0.2776068, 0.05265786, 1, 0, 0, 1, 1,
-0.524578, 1.224561, -1.273784, 0, 0, 0, 1, 1,
-0.5241876, 1.384707, -1.530264, 0, 0, 0, 1, 1,
-0.5223845, -1.185437, -3.942427, 0, 0, 0, 1, 1,
-0.5194784, -0.6216533, -5.126519, 0, 0, 0, 1, 1,
-0.5184513, 0.5611121, -1.179403, 0, 0, 0, 1, 1,
-0.5151053, -0.1943084, -0.6918935, 0, 0, 0, 1, 1,
-0.5128917, 1.52072, -0.2087975, 0, 0, 0, 1, 1,
-0.5085288, -2.040517, -2.466822, 1, 1, 1, 1, 1,
-0.5024937, 0.1155095, -1.672265, 1, 1, 1, 1, 1,
-0.5011131, 0.8997015, 1.999565, 1, 1, 1, 1, 1,
-0.5009066, -0.6847675, -3.844193, 1, 1, 1, 1, 1,
-0.4985988, 0.2958895, -1.99781, 1, 1, 1, 1, 1,
-0.4930439, -0.4168056, -0.9714465, 1, 1, 1, 1, 1,
-0.4924002, 2.560812, -0.5940331, 1, 1, 1, 1, 1,
-0.4917306, 0.8421692, -0.6232884, 1, 1, 1, 1, 1,
-0.486248, 1.127832, -0.6929145, 1, 1, 1, 1, 1,
-0.4837064, 0.4913648, -1.159221, 1, 1, 1, 1, 1,
-0.4830136, 0.7308642, -1.378792, 1, 1, 1, 1, 1,
-0.4818009, 0.8650162, -2.622016, 1, 1, 1, 1, 1,
-0.4784204, -0.631336, -1.696657, 1, 1, 1, 1, 1,
-0.4758986, -1.233706, -3.636752, 1, 1, 1, 1, 1,
-0.472818, 0.6879629, -2.594129, 1, 1, 1, 1, 1,
-0.4697999, -2.268754, -3.903096, 0, 0, 1, 1, 1,
-0.4679282, -0.4918379, -3.507548, 1, 0, 0, 1, 1,
-0.4672554, 0.5196074, 0.1192629, 1, 0, 0, 1, 1,
-0.4568284, 0.5227817, -1.07384, 1, 0, 0, 1, 1,
-0.4561052, 2.920447, -2.953918, 1, 0, 0, 1, 1,
-0.4539836, -0.05153832, -1.557273, 1, 0, 0, 1, 1,
-0.4504431, 0.2504586, 7.846553e-05, 0, 0, 0, 1, 1,
-0.447907, -0.6090158, -2.389448, 0, 0, 0, 1, 1,
-0.4476655, -0.2422875, -2.483404, 0, 0, 0, 1, 1,
-0.4473824, -0.0201915, 0.450367, 0, 0, 0, 1, 1,
-0.4464094, 0.7132634, 0.3955345, 0, 0, 0, 1, 1,
-0.4450326, -0.2943856, -2.460464, 0, 0, 0, 1, 1,
-0.4438038, 1.288245, 0.2413014, 0, 0, 0, 1, 1,
-0.4434193, 0.3999003, -0.9586873, 1, 1, 1, 1, 1,
-0.4422497, -0.01953905, -1.660694, 1, 1, 1, 1, 1,
-0.4402071, 0.09380476, -1.610138, 1, 1, 1, 1, 1,
-0.4358946, -0.448216, -3.273291, 1, 1, 1, 1, 1,
-0.4338292, -0.7099352, -2.666585, 1, 1, 1, 1, 1,
-0.431408, -0.9103354, -3.58724, 1, 1, 1, 1, 1,
-0.4306634, -0.00609434, -1.47703, 1, 1, 1, 1, 1,
-0.4250935, -0.751053, -2.420775, 1, 1, 1, 1, 1,
-0.4232168, -0.05802297, -0.1923265, 1, 1, 1, 1, 1,
-0.4228354, 0.5742786, -0.01646863, 1, 1, 1, 1, 1,
-0.4212211, 0.825232, -1.332084, 1, 1, 1, 1, 1,
-0.4195347, 1.839643, -0.2950292, 1, 1, 1, 1, 1,
-0.4171683, -0.1452125, -2.578808, 1, 1, 1, 1, 1,
-0.413418, 0.4377544, -0.4827344, 1, 1, 1, 1, 1,
-0.4091323, -0.7999774, -2.62015, 1, 1, 1, 1, 1,
-0.4054595, 1.232561, -1.700116, 0, 0, 1, 1, 1,
-0.4004177, -0.9706472, -1.57614, 1, 0, 0, 1, 1,
-0.3999469, 0.06419277, -2.581706, 1, 0, 0, 1, 1,
-0.3977818, -0.2670655, -2.738874, 1, 0, 0, 1, 1,
-0.3931045, -2.18575, -2.457682, 1, 0, 0, 1, 1,
-0.3926928, 1.923728, -0.3442414, 1, 0, 0, 1, 1,
-0.39213, -0.5746892, -2.549272, 0, 0, 0, 1, 1,
-0.3920523, -0.2578525, -1.553081, 0, 0, 0, 1, 1,
-0.3894131, -0.5273616, -2.882189, 0, 0, 0, 1, 1,
-0.3860242, 1.467093, 0.228307, 0, 0, 0, 1, 1,
-0.3840392, 0.8458482, -0.1849705, 0, 0, 0, 1, 1,
-0.382421, 0.8088577, 1.023558, 0, 0, 0, 1, 1,
-0.3811727, -0.4263088, -0.8943445, 0, 0, 0, 1, 1,
-0.3805064, -1.012501, -3.835493, 1, 1, 1, 1, 1,
-0.376392, -2.199131, -1.618345, 1, 1, 1, 1, 1,
-0.3745145, -0.5736119, -3.081123, 1, 1, 1, 1, 1,
-0.3694317, -0.7650456, -1.872481, 1, 1, 1, 1, 1,
-0.3658958, -0.4811335, -2.5791, 1, 1, 1, 1, 1,
-0.3647072, 1.274668, -1.041318, 1, 1, 1, 1, 1,
-0.3642296, -1.509497, -1.141829, 1, 1, 1, 1, 1,
-0.3640073, 0.346141, -0.8715134, 1, 1, 1, 1, 1,
-0.3617486, 0.0275234, -0.9860068, 1, 1, 1, 1, 1,
-0.3614538, -0.2150974, -2.464655, 1, 1, 1, 1, 1,
-0.3552024, -0.496544, -2.608164, 1, 1, 1, 1, 1,
-0.3542677, -0.7366258, -3.573058, 1, 1, 1, 1, 1,
-0.3526659, -0.5165465, -3.015095, 1, 1, 1, 1, 1,
-0.3496332, -0.8576946, -0.5674496, 1, 1, 1, 1, 1,
-0.3494817, -0.0503552, -2.127228, 1, 1, 1, 1, 1,
-0.3493587, 0.5685233, -0.7748839, 0, 0, 1, 1, 1,
-0.3437537, -0.8783177, -4.228996, 1, 0, 0, 1, 1,
-0.3394906, 0.4218059, -2.114037, 1, 0, 0, 1, 1,
-0.3341355, -0.4999103, -3.512022, 1, 0, 0, 1, 1,
-0.3331955, 0.5654851, -0.9168869, 1, 0, 0, 1, 1,
-0.3309866, 0.4952504, -1.853033, 1, 0, 0, 1, 1,
-0.3275802, 0.8241701, -1.0472, 0, 0, 0, 1, 1,
-0.3226278, 0.02001055, -3.699281, 0, 0, 0, 1, 1,
-0.3221008, 2.077879, 0.6407568, 0, 0, 0, 1, 1,
-0.3212227, -1.575719, -3.340541, 0, 0, 0, 1, 1,
-0.3204561, 1.056553, 0.6265026, 0, 0, 0, 1, 1,
-0.3189893, 0.5379624, -2.395766, 0, 0, 0, 1, 1,
-0.3180087, -1.310078, -3.229039, 0, 0, 0, 1, 1,
-0.3142006, 1.518129, -2.423347, 1, 1, 1, 1, 1,
-0.3065116, -0.9198897, -0.4788207, 1, 1, 1, 1, 1,
-0.3064345, 0.3449296, -1.21245, 1, 1, 1, 1, 1,
-0.3014256, -0.07335698, -2.257217, 1, 1, 1, 1, 1,
-0.2982998, -1.01073, -2.13915, 1, 1, 1, 1, 1,
-0.2971919, -0.1779811, 0.3791646, 1, 1, 1, 1, 1,
-0.2971697, -0.3891334, -2.341414, 1, 1, 1, 1, 1,
-0.2925755, -1.559674, -3.242872, 1, 1, 1, 1, 1,
-0.2920621, 1.868469, -1.854592, 1, 1, 1, 1, 1,
-0.2896976, 1.532938, 0.6365378, 1, 1, 1, 1, 1,
-0.288775, -0.007430132, -2.456235, 1, 1, 1, 1, 1,
-0.2868733, 1.05371, 0.1996851, 1, 1, 1, 1, 1,
-0.2832296, -0.7526708, -1.427675, 1, 1, 1, 1, 1,
-0.2804374, 1.121257, -2.455567, 1, 1, 1, 1, 1,
-0.2796744, 0.2749297, -1.583727, 1, 1, 1, 1, 1,
-0.2794436, -1.998225, -3.800199, 0, 0, 1, 1, 1,
-0.2730626, -0.5537342, -3.233295, 1, 0, 0, 1, 1,
-0.2727736, -0.5022739, -2.001266, 1, 0, 0, 1, 1,
-0.2664938, -1.137061, -4.231044, 1, 0, 0, 1, 1,
-0.2660238, 0.4253043, -1.063044, 1, 0, 0, 1, 1,
-0.2654397, 1.522725, 1.158332, 1, 0, 0, 1, 1,
-0.2648363, 0.3207017, -1.575536, 0, 0, 0, 1, 1,
-0.2596948, -0.9471923, -3.762983, 0, 0, 0, 1, 1,
-0.2565982, 1.186995, 0.5307249, 0, 0, 0, 1, 1,
-0.250881, 1.118185, 0.1717176, 0, 0, 0, 1, 1,
-0.2503175, -0.9948099, -2.169677, 0, 0, 0, 1, 1,
-0.2435763, 1.373888, -0.1590054, 0, 0, 0, 1, 1,
-0.2425331, -0.7805708, -1.56918, 0, 0, 0, 1, 1,
-0.242195, -0.2552392, -2.749072, 1, 1, 1, 1, 1,
-0.2409438, -0.5933577, -3.714525, 1, 1, 1, 1, 1,
-0.2408903, -0.7350271, -3.264645, 1, 1, 1, 1, 1,
-0.2402654, -0.9754277, -3.677682, 1, 1, 1, 1, 1,
-0.2227065, -0.401488, -2.568272, 1, 1, 1, 1, 1,
-0.2223095, -0.7725517, -3.195946, 1, 1, 1, 1, 1,
-0.2154105, -0.6701141, -3.022745, 1, 1, 1, 1, 1,
-0.2144852, -0.920443, -3.093926, 1, 1, 1, 1, 1,
-0.208763, 0.9535162, -1.91823, 1, 1, 1, 1, 1,
-0.2082064, -2.12379, -1.864524, 1, 1, 1, 1, 1,
-0.2066977, 2.380541, -0.5225482, 1, 1, 1, 1, 1,
-0.2039786, 0.1505082, -0.9329641, 1, 1, 1, 1, 1,
-0.2021185, 0.4675613, 1.558435, 1, 1, 1, 1, 1,
-0.2003951, 0.4278926, 1.334592, 1, 1, 1, 1, 1,
-0.1986818, 0.05402687, 0.23534, 1, 1, 1, 1, 1,
-0.195217, -0.3788435, -2.539901, 0, 0, 1, 1, 1,
-0.1948882, -1.094104, -5.805107, 1, 0, 0, 1, 1,
-0.1944038, 0.5782112, -1.645987, 1, 0, 0, 1, 1,
-0.1917487, -0.5470647, -3.495413, 1, 0, 0, 1, 1,
-0.190425, 2.655817, 0.04027876, 1, 0, 0, 1, 1,
-0.1876101, 2.011499, 0.02835415, 1, 0, 0, 1, 1,
-0.1824929, 1.055713, -0.3057567, 0, 0, 0, 1, 1,
-0.1805808, 0.2508378, -0.6661562, 0, 0, 0, 1, 1,
-0.1805016, 0.1015103, -1.039347, 0, 0, 0, 1, 1,
-0.1696541, -1.712768, -2.644796, 0, 0, 0, 1, 1,
-0.1633128, -0.2702875, -3.422333, 0, 0, 0, 1, 1,
-0.1629105, -0.608755, -2.668099, 0, 0, 0, 1, 1,
-0.1624288, 0.5319985, 0.1625233, 0, 0, 0, 1, 1,
-0.1620425, -0.6407479, -2.13208, 1, 1, 1, 1, 1,
-0.1589297, -1.370592, -3.379679, 1, 1, 1, 1, 1,
-0.1562436, -0.542912, -4.840169, 1, 1, 1, 1, 1,
-0.1513784, -1.168699, -3.278494, 1, 1, 1, 1, 1,
-0.1510575, 0.2633654, -2.744364, 1, 1, 1, 1, 1,
-0.1493776, 1.288291, 0.01589388, 1, 1, 1, 1, 1,
-0.1490308, 0.1623707, -1.332028, 1, 1, 1, 1, 1,
-0.1490256, 0.1977626, 0.4903172, 1, 1, 1, 1, 1,
-0.1451062, -0.9738162, -2.671278, 1, 1, 1, 1, 1,
-0.1425693, -2.463875, -3.714621, 1, 1, 1, 1, 1,
-0.1414324, -0.2336263, -1.889241, 1, 1, 1, 1, 1,
-0.1409773, 0.3724549, -1.985881, 1, 1, 1, 1, 1,
-0.1405716, -0.009951577, -1.5677, 1, 1, 1, 1, 1,
-0.1373841, 1.046308, -0.9307886, 1, 1, 1, 1, 1,
-0.1369403, -1.284642, -2.573248, 1, 1, 1, 1, 1,
-0.134628, -0.7406487, -2.964893, 0, 0, 1, 1, 1,
-0.1334098, -0.04554864, -1.8116, 1, 0, 0, 1, 1,
-0.1232969, -1.274606, -3.315746, 1, 0, 0, 1, 1,
-0.1214489, 0.3463777, 0.5320355, 1, 0, 0, 1, 1,
-0.1152383, -0.9892861, -1.16279, 1, 0, 0, 1, 1,
-0.1136695, -0.008018633, -1.305543, 1, 0, 0, 1, 1,
-0.1120464, -1.829177, -2.61506, 0, 0, 0, 1, 1,
-0.1118262, -1.503963, 0.1181133, 0, 0, 0, 1, 1,
-0.1081814, 1.668203, 2.285431, 0, 0, 0, 1, 1,
-0.1074421, 0.5845944, 0.5209663, 0, 0, 0, 1, 1,
-0.1070205, 1.370167, 1.237178, 0, 0, 0, 1, 1,
-0.09957147, 0.2261176, -0.191569, 0, 0, 0, 1, 1,
-0.09910332, -0.05369674, -1.700455, 0, 0, 0, 1, 1,
-0.09801958, 1.348772, 0.08364895, 1, 1, 1, 1, 1,
-0.09648512, 0.6241412, -0.04889001, 1, 1, 1, 1, 1,
-0.09575298, 1.351506, -0.396647, 1, 1, 1, 1, 1,
-0.09466075, 0.9761887, 0.6054132, 1, 1, 1, 1, 1,
-0.09396467, -0.4932315, -2.067914, 1, 1, 1, 1, 1,
-0.09376454, -0.7363642, -2.296619, 1, 1, 1, 1, 1,
-0.09168203, -0.1931685, -3.462169, 1, 1, 1, 1, 1,
-0.0869336, 0.1777791, -1.142696, 1, 1, 1, 1, 1,
-0.08653367, 0.7487794, -0.6635511, 1, 1, 1, 1, 1,
-0.08311279, 0.6761788, 0.3531372, 1, 1, 1, 1, 1,
-0.08264459, 0.4147726, -0.1346497, 1, 1, 1, 1, 1,
-0.08093807, 1.244904, 1.849883, 1, 1, 1, 1, 1,
-0.07972392, 0.1445814, 1.140763, 1, 1, 1, 1, 1,
-0.0794374, -0.6533139, -2.71186, 1, 1, 1, 1, 1,
-0.0783571, 0.9937245, -1.848017, 1, 1, 1, 1, 1,
-0.07375528, -0.6654198, -2.677183, 0, 0, 1, 1, 1,
-0.07300244, -0.5954142, -1.379057, 1, 0, 0, 1, 1,
-0.07140483, -0.6128265, -5.237172, 1, 0, 0, 1, 1,
-0.06677528, -0.2077879, -4.660716, 1, 0, 0, 1, 1,
-0.06574532, -0.131243, -3.316102, 1, 0, 0, 1, 1,
-0.06064101, 0.3193054, -0.07603875, 1, 0, 0, 1, 1,
-0.06034118, -0.521462, -2.637295, 0, 0, 0, 1, 1,
-0.05793785, 1.616354, -1.36005, 0, 0, 0, 1, 1,
-0.05585769, -0.4784293, -1.0647, 0, 0, 0, 1, 1,
-0.05499775, 0.6708696, 0.3132458, 0, 0, 0, 1, 1,
-0.05474045, -1.489055, -1.036334, 0, 0, 0, 1, 1,
-0.05457316, -0.1777857, -2.2969, 0, 0, 0, 1, 1,
-0.05336494, 0.9221295, 1.13293, 0, 0, 0, 1, 1,
-0.0517555, 1.53085, 1.80073, 1, 1, 1, 1, 1,
-0.04958644, 1.004501, 1.40599, 1, 1, 1, 1, 1,
-0.04667483, -0.5101659, -2.945343, 1, 1, 1, 1, 1,
-0.04515159, -1.584123, -3.07689, 1, 1, 1, 1, 1,
-0.03684703, 0.03260757, -1.522234, 1, 1, 1, 1, 1,
-0.03611035, -0.4088462, -0.8442438, 1, 1, 1, 1, 1,
-0.03305374, 0.922616, -0.25826, 1, 1, 1, 1, 1,
-0.02799996, -0.6167687, -4.062482, 1, 1, 1, 1, 1,
-0.02534737, -1.192792, -3.802269, 1, 1, 1, 1, 1,
-0.0247903, 0.1218987, -1.16105, 1, 1, 1, 1, 1,
-0.02203462, -1.218848, -1.942101, 1, 1, 1, 1, 1,
-0.01908755, 2.519967, 1.052475, 1, 1, 1, 1, 1,
-0.01889414, 0.6035514, -0.1632159, 1, 1, 1, 1, 1,
-0.01589848, 0.6077486, 1.575518, 1, 1, 1, 1, 1,
-0.01277651, 1.395597, 1.002828, 1, 1, 1, 1, 1,
-0.004531029, 0.003220388, -0.141871, 0, 0, 1, 1, 1,
-0.003481662, 0.1935412, -1.117229, 1, 0, 0, 1, 1,
-0.002380755, -0.3210274, -4.267335, 1, 0, 0, 1, 1,
-0.0009516546, -0.1491772, -2.207613, 1, 0, 0, 1, 1,
0.0007648261, 0.7248356, -0.6043543, 1, 0, 0, 1, 1,
0.003145768, -0.2112646, 2.722052, 1, 0, 0, 1, 1,
0.005583628, 0.6090507, 1.909036, 0, 0, 0, 1, 1,
0.009016467, 0.08888411, -0.7426865, 0, 0, 0, 1, 1,
0.009537643, 0.6028223, 0.9954762, 0, 0, 0, 1, 1,
0.01015387, 1.020702, -0.2329866, 0, 0, 0, 1, 1,
0.01084929, 0.7327774, 0.9872342, 0, 0, 0, 1, 1,
0.01352308, 1.419559, -0.9859061, 0, 0, 0, 1, 1,
0.01455074, -0.1530108, 3.982692, 0, 0, 0, 1, 1,
0.01637683, 0.3219201, -0.7320295, 1, 1, 1, 1, 1,
0.01759255, 2.426479, 0.6492318, 1, 1, 1, 1, 1,
0.02454048, -0.492927, 4.733357, 1, 1, 1, 1, 1,
0.02474567, 0.002098134, 1.087527, 1, 1, 1, 1, 1,
0.0258601, -1.361452, 3.83894, 1, 1, 1, 1, 1,
0.02860479, 0.4805568, -0.4606339, 1, 1, 1, 1, 1,
0.03376706, -0.5668117, 2.978649, 1, 1, 1, 1, 1,
0.03588779, -1.455714, 3.43901, 1, 1, 1, 1, 1,
0.03698045, 0.5567368, -0.06532543, 1, 1, 1, 1, 1,
0.03823029, 1.394513, 0.09749836, 1, 1, 1, 1, 1,
0.04036783, 1.566079, 0.2686262, 1, 1, 1, 1, 1,
0.0419333, -0.7916633, 4.345858, 1, 1, 1, 1, 1,
0.04896777, 0.7611579, 1.475734, 1, 1, 1, 1, 1,
0.0520459, 0.1336095, 0.6400996, 1, 1, 1, 1, 1,
0.0525467, -1.290508, 4.374238, 1, 1, 1, 1, 1,
0.05886644, -0.3942275, 2.312852, 0, 0, 1, 1, 1,
0.05906922, -0.9600862, 3.15604, 1, 0, 0, 1, 1,
0.06122816, 0.8396014, 0.6052758, 1, 0, 0, 1, 1,
0.06346747, 1.846215, 0.8683729, 1, 0, 0, 1, 1,
0.06794472, 1.558742, 0.211913, 1, 0, 0, 1, 1,
0.07297318, 0.187042, 2.668684, 1, 0, 0, 1, 1,
0.07625721, 0.4426577, -0.1289002, 0, 0, 0, 1, 1,
0.07662811, -0.190092, 1.966546, 0, 0, 0, 1, 1,
0.0776546, -0.01810404, 1.792706, 0, 0, 0, 1, 1,
0.08006337, -0.01580578, 2.375023, 0, 0, 0, 1, 1,
0.08238507, -0.1264552, 2.583392, 0, 0, 0, 1, 1,
0.08316743, 0.9947365, -1.062528, 0, 0, 0, 1, 1,
0.08398585, -1.555597, 4.129778, 0, 0, 0, 1, 1,
0.08996723, -1.069055, 2.534089, 1, 1, 1, 1, 1,
0.09773552, -0.7628502, 2.11488, 1, 1, 1, 1, 1,
0.1016093, 0.3860054, -1.041537, 1, 1, 1, 1, 1,
0.1070989, 0.8655167, -1.095972, 1, 1, 1, 1, 1,
0.1074404, 1.130483, -0.03706757, 1, 1, 1, 1, 1,
0.1095655, 0.8147554, 0.6142389, 1, 1, 1, 1, 1,
0.1143627, -1.61147, 2.874398, 1, 1, 1, 1, 1,
0.1165322, -0.9109834, 1.333259, 1, 1, 1, 1, 1,
0.1178463, 0.3387297, -1.108235, 1, 1, 1, 1, 1,
0.1183592, -0.1225956, 1.887594, 1, 1, 1, 1, 1,
0.1188624, 0.5994616, -0.9744184, 1, 1, 1, 1, 1,
0.11997, -0.02756014, 2.525028, 1, 1, 1, 1, 1,
0.1203996, -0.2003921, 3.061372, 1, 1, 1, 1, 1,
0.1206058, 2.244104, 1.138772, 1, 1, 1, 1, 1,
0.1222736, 0.8789248, -0.8946348, 1, 1, 1, 1, 1,
0.1318252, 0.5171339, 0.4830489, 0, 0, 1, 1, 1,
0.1321887, -0.6394741, 3.907707, 1, 0, 0, 1, 1,
0.1382742, 0.3403819, 0.03745371, 1, 0, 0, 1, 1,
0.1477937, -0.8088546, 3.092584, 1, 0, 0, 1, 1,
0.1489292, 0.7292761, 0.4546225, 1, 0, 0, 1, 1,
0.1527364, 1.382056, 1.405427, 1, 0, 0, 1, 1,
0.1534876, 0.4474439, -0.02914024, 0, 0, 0, 1, 1,
0.1565088, -0.6943441, 1.58509, 0, 0, 0, 1, 1,
0.1609425, -0.1106589, 2.214341, 0, 0, 0, 1, 1,
0.1637483, 0.08975064, 2.640117, 0, 0, 0, 1, 1,
0.1641779, -0.4684241, 3.591548, 0, 0, 0, 1, 1,
0.1693901, -0.646167, 2.505165, 0, 0, 0, 1, 1,
0.1698994, 1.68972, 0.3416536, 0, 0, 0, 1, 1,
0.1701023, -0.2046653, 0.773656, 1, 1, 1, 1, 1,
0.1705071, 0.4838518, 0.2702166, 1, 1, 1, 1, 1,
0.1750793, -0.07141402, 3.284204, 1, 1, 1, 1, 1,
0.1757764, -0.9228767, 2.675906, 1, 1, 1, 1, 1,
0.1771718, 0.8936459, 0.3339101, 1, 1, 1, 1, 1,
0.1797168, 2.481671, 1.599061, 1, 1, 1, 1, 1,
0.1856354, -0.7882, 1.673164, 1, 1, 1, 1, 1,
0.1889532, -0.1414668, 2.151232, 1, 1, 1, 1, 1,
0.1905746, 0.4141034, 1.091694, 1, 1, 1, 1, 1,
0.1968839, 0.8192055, 0.3829504, 1, 1, 1, 1, 1,
0.1980924, 0.1058518, 0.2386178, 1, 1, 1, 1, 1,
0.203062, -0.6525976, 1.770826, 1, 1, 1, 1, 1,
0.2038211, 0.2526872, -0.9904523, 1, 1, 1, 1, 1,
0.2075859, 0.226263, 1.092848, 1, 1, 1, 1, 1,
0.2110611, 0.3487832, -0.6798532, 1, 1, 1, 1, 1,
0.2134356, 0.2299181, 0.8777236, 0, 0, 1, 1, 1,
0.2175253, -1.532538, 3.730268, 1, 0, 0, 1, 1,
0.2193142, -0.2217769, 3.413719, 1, 0, 0, 1, 1,
0.2197741, 1.110681, 0.1952199, 1, 0, 0, 1, 1,
0.2199506, 0.03445068, 0.5647476, 1, 0, 0, 1, 1,
0.2205127, -0.8646227, 2.972962, 1, 0, 0, 1, 1,
0.2297541, 1.127579, -0.3345955, 0, 0, 0, 1, 1,
0.2312659, 1.669548, -0.3662976, 0, 0, 0, 1, 1,
0.2332754, 1.132224, 0.3095601, 0, 0, 0, 1, 1,
0.2332949, 1.657269, -0.1796951, 0, 0, 0, 1, 1,
0.2349747, 1.258929, -0.7553021, 0, 0, 0, 1, 1,
0.2380633, 0.8320256, 1.49965, 0, 0, 0, 1, 1,
0.2450335, 0.3347287, 1.607778, 0, 0, 0, 1, 1,
0.2458, 0.7895359, -0.7001066, 1, 1, 1, 1, 1,
0.2483594, 0.9178116, 1.464904, 1, 1, 1, 1, 1,
0.2529904, 0.01379433, 1.527764, 1, 1, 1, 1, 1,
0.2561187, 0.4662446, 1.223614, 1, 1, 1, 1, 1,
0.256281, -0.4683281, 2.876526, 1, 1, 1, 1, 1,
0.2573927, 0.4179299, -0.2278219, 1, 1, 1, 1, 1,
0.259839, -0.1276942, 1.584023, 1, 1, 1, 1, 1,
0.2667072, 0.5218506, 0.2870292, 1, 1, 1, 1, 1,
0.2731166, -1.603718, 1.311394, 1, 1, 1, 1, 1,
0.2754336, 0.4482245, 0.6494539, 1, 1, 1, 1, 1,
0.2761933, -0.1711338, 2.18486, 1, 1, 1, 1, 1,
0.2775546, -1.54435, 2.118536, 1, 1, 1, 1, 1,
0.281337, 1.006908, -0.9754614, 1, 1, 1, 1, 1,
0.2819504, -1.279176, 1.378668, 1, 1, 1, 1, 1,
0.2826178, 0.9685744, -0.199691, 1, 1, 1, 1, 1,
0.2826373, 0.6225751, -0.5835228, 0, 0, 1, 1, 1,
0.2829516, -0.1370797, 0.1542179, 1, 0, 0, 1, 1,
0.2840721, -1.234182, 2.729366, 1, 0, 0, 1, 1,
0.2858189, -0.7597214, 2.653676, 1, 0, 0, 1, 1,
0.2876317, 1.012176, 1.717311, 1, 0, 0, 1, 1,
0.2880219, 0.09973167, 0.7954054, 1, 0, 0, 1, 1,
0.2885847, 0.6208369, 0.1028633, 0, 0, 0, 1, 1,
0.2906068, -0.9078163, 3.416327, 0, 0, 0, 1, 1,
0.2915606, 1.700241, -0.5147368, 0, 0, 0, 1, 1,
0.2956138, -2.259221, 3.604229, 0, 0, 0, 1, 1,
0.2988082, 1.221584, -0.3782796, 0, 0, 0, 1, 1,
0.302003, 0.5336652, -0.2243519, 0, 0, 0, 1, 1,
0.3028319, -1.443891, 1.649051, 0, 0, 0, 1, 1,
0.3044657, -0.141288, 2.477103, 1, 1, 1, 1, 1,
0.304502, -1.125188, 1.474402, 1, 1, 1, 1, 1,
0.3059292, 0.9129276, 1.74468, 1, 1, 1, 1, 1,
0.3064158, -1.091414, 2.934434, 1, 1, 1, 1, 1,
0.3101801, -0.1283967, 2.167467, 1, 1, 1, 1, 1,
0.3115354, 0.6439597, -0.5781869, 1, 1, 1, 1, 1,
0.3129382, -0.6668843, 2.671235, 1, 1, 1, 1, 1,
0.3160942, 0.2708287, 1.648735, 1, 1, 1, 1, 1,
0.3174157, -1.370955, 2.7098, 1, 1, 1, 1, 1,
0.3190886, -0.5248093, 3.3788, 1, 1, 1, 1, 1,
0.3215094, -1.961982, 3.562775, 1, 1, 1, 1, 1,
0.3221989, 2.393513, 1.63834, 1, 1, 1, 1, 1,
0.326164, 1.361753, -0.1093035, 1, 1, 1, 1, 1,
0.3278033, 1.404006, 0.4079254, 1, 1, 1, 1, 1,
0.3285471, -1.685829, 2.082683, 1, 1, 1, 1, 1,
0.3306164, 1.046384, -0.4402162, 0, 0, 1, 1, 1,
0.3361129, 0.9113478, 0.6766636, 1, 0, 0, 1, 1,
0.3363877, 1.476501, -0.7949565, 1, 0, 0, 1, 1,
0.3394554, -0.5976866, 2.367678, 1, 0, 0, 1, 1,
0.3404642, 0.1419231, -1.254771, 1, 0, 0, 1, 1,
0.3498313, -0.1393544, 0.671302, 1, 0, 0, 1, 1,
0.3579357, 0.5469241, -0.4046279, 0, 0, 0, 1, 1,
0.3632833, 0.3870924, 0.4004092, 0, 0, 0, 1, 1,
0.3672023, -0.4968855, 3.750199, 0, 0, 0, 1, 1,
0.3735701, 1.483591, 0.525667, 0, 0, 0, 1, 1,
0.3785101, 0.3967018, 1.578035, 0, 0, 0, 1, 1,
0.3820089, 0.2281096, 2.122128, 0, 0, 0, 1, 1,
0.3873156, -0.6833894, 1.728031, 0, 0, 0, 1, 1,
0.387467, -0.9925258, 2.481004, 1, 1, 1, 1, 1,
0.3913602, 0.3915501, 1.277495, 1, 1, 1, 1, 1,
0.3919907, -1.918841, 3.430721, 1, 1, 1, 1, 1,
0.3947189, -1.02852, 5.169222, 1, 1, 1, 1, 1,
0.3949596, 0.3139379, 2.179139, 1, 1, 1, 1, 1,
0.3990337, 0.4174742, 2.481823, 1, 1, 1, 1, 1,
0.4054153, -1.187889, 2.935765, 1, 1, 1, 1, 1,
0.406564, 0.8843815, 0.001589274, 1, 1, 1, 1, 1,
0.4074685, -0.7317505, 2.733502, 1, 1, 1, 1, 1,
0.4110821, -0.3297022, 2.640345, 1, 1, 1, 1, 1,
0.4151928, 0.6482585, 0.4878769, 1, 1, 1, 1, 1,
0.4153969, 0.5608662, 0.2992436, 1, 1, 1, 1, 1,
0.4167656, -0.3607055, 1.676871, 1, 1, 1, 1, 1,
0.4198192, 0.436489, 0.4551188, 1, 1, 1, 1, 1,
0.4253123, -0.9418418, 1.483086, 1, 1, 1, 1, 1,
0.4261378, 1.061646, 0.9104106, 0, 0, 1, 1, 1,
0.4330669, -0.05337839, 1.787488, 1, 0, 0, 1, 1,
0.4350263, -0.7413108, 3.341217, 1, 0, 0, 1, 1,
0.4379022, -0.6629235, 3.042822, 1, 0, 0, 1, 1,
0.4417413, 0.5404845, 0.3920985, 1, 0, 0, 1, 1,
0.4476635, -0.6889886, 4.080962, 1, 0, 0, 1, 1,
0.4506844, -1.665709, 5.460495, 0, 0, 0, 1, 1,
0.4530132, 1.206218, 1.038582, 0, 0, 0, 1, 1,
0.4552531, -0.3211608, 3.535239, 0, 0, 0, 1, 1,
0.4566321, 1.42119, 0.8727388, 0, 0, 0, 1, 1,
0.4571466, 0.1357668, 3.179726, 0, 0, 0, 1, 1,
0.4583063, 3.571795, 0.549583, 0, 0, 0, 1, 1,
0.4586261, -0.6727169, 3.445318, 0, 0, 0, 1, 1,
0.4588689, -0.4848936, 2.683507, 1, 1, 1, 1, 1,
0.4644162, 0.6242474, 0.7376664, 1, 1, 1, 1, 1,
0.4666961, 1.297994, 1.019511, 1, 1, 1, 1, 1,
0.4705149, 0.2484452, 1.801994, 1, 1, 1, 1, 1,
0.470661, 0.8024958, -0.3324981, 1, 1, 1, 1, 1,
0.4712549, -0.210967, 3.244737, 1, 1, 1, 1, 1,
0.4774467, 0.1452807, 1.282905, 1, 1, 1, 1, 1,
0.4810824, 0.370505, 0.4286953, 1, 1, 1, 1, 1,
0.4845515, 1.5274, 1.57447, 1, 1, 1, 1, 1,
0.4886662, -1.803619, 1.935151, 1, 1, 1, 1, 1,
0.5026794, -2.198476, 3.563421, 1, 1, 1, 1, 1,
0.5046825, 0.6953167, 1.039454, 1, 1, 1, 1, 1,
0.5090035, 0.3843426, 1.923498, 1, 1, 1, 1, 1,
0.5163416, -0.1128354, 2.740671, 1, 1, 1, 1, 1,
0.516392, 1.490152, -1.754724, 1, 1, 1, 1, 1,
0.5176475, -1.281047, 2.629429, 0, 0, 1, 1, 1,
0.5199319, -1.0259, 3.024124, 1, 0, 0, 1, 1,
0.5204538, 0.31622, 0.5153405, 1, 0, 0, 1, 1,
0.5212353, -1.578346, 1.786458, 1, 0, 0, 1, 1,
0.5239555, 1.270059, 1.095576, 1, 0, 0, 1, 1,
0.5251252, 0.1775623, 2.557207, 1, 0, 0, 1, 1,
0.5257781, 0.1156557, 0.9875201, 0, 0, 0, 1, 1,
0.5282398, 1.470655, 1.020923, 0, 0, 0, 1, 1,
0.5357071, 0.4080262, 1.12451, 0, 0, 0, 1, 1,
0.5362106, 1.405405, 0.09435803, 0, 0, 0, 1, 1,
0.5381495, 0.1715102, -0.3450999, 0, 0, 0, 1, 1,
0.5394675, -0.2532668, 3.498575, 0, 0, 0, 1, 1,
0.5408552, 0.317156, -0.4795737, 0, 0, 0, 1, 1,
0.5449359, 0.00884023, -1.109211, 1, 1, 1, 1, 1,
0.5509098, -0.9584197, 3.082908, 1, 1, 1, 1, 1,
0.5599512, 0.5357935, 0.6876119, 1, 1, 1, 1, 1,
0.5608605, -0.1031556, 0.9086753, 1, 1, 1, 1, 1,
0.5667354, 1.089209, 0.2682294, 1, 1, 1, 1, 1,
0.574671, -0.3973012, 0.5843951, 1, 1, 1, 1, 1,
0.5748503, 0.186005, -2.140335, 1, 1, 1, 1, 1,
0.5750919, -2.499257, 3.397384, 1, 1, 1, 1, 1,
0.5765585, -0.03329078, 0.1371156, 1, 1, 1, 1, 1,
0.5775824, 0.1923654, -0.1353645, 1, 1, 1, 1, 1,
0.5810525, -0.8488023, 2.775177, 1, 1, 1, 1, 1,
0.586633, -0.3634172, 3.24001, 1, 1, 1, 1, 1,
0.5882081, -1.589186, 2.485409, 1, 1, 1, 1, 1,
0.5893783, -0.618964, 1.049065, 1, 1, 1, 1, 1,
0.5911453, -0.3508902, 2.741331, 1, 1, 1, 1, 1,
0.6016237, 0.4154612, -0.9304845, 0, 0, 1, 1, 1,
0.6063679, 0.06632452, 1.00216, 1, 0, 0, 1, 1,
0.6088937, -0.223483, 1.704729, 1, 0, 0, 1, 1,
0.6150336, -0.7454349, 3.068042, 1, 0, 0, 1, 1,
0.6152418, -1.878479, 3.540509, 1, 0, 0, 1, 1,
0.617893, -0.3002297, 2.302803, 1, 0, 0, 1, 1,
0.6198498, 0.2365574, 1.175418, 0, 0, 0, 1, 1,
0.6204998, 0.2765027, 0.6016917, 0, 0, 0, 1, 1,
0.6234859, -0.5979724, 3.120546, 0, 0, 0, 1, 1,
0.6310755, -0.3327799, 1.813538, 0, 0, 0, 1, 1,
0.6315413, -0.8307288, 1.996749, 0, 0, 0, 1, 1,
0.6432129, -1.290321, 5.709029, 0, 0, 0, 1, 1,
0.6476261, -0.5985599, -0.4606869, 0, 0, 0, 1, 1,
0.6490024, -0.1490782, 1.87858, 1, 1, 1, 1, 1,
0.6494344, 0.2666353, 1.801257, 1, 1, 1, 1, 1,
0.6523449, 0.4294024, 2.136487, 1, 1, 1, 1, 1,
0.655028, 0.5447558, -0.9588538, 1, 1, 1, 1, 1,
0.656737, 1.342049, 1.005151, 1, 1, 1, 1, 1,
0.6567627, 1.021746, 0.6360526, 1, 1, 1, 1, 1,
0.6590762, -1.13838, 1.677173, 1, 1, 1, 1, 1,
0.6630608, 0.02636089, 2.223963, 1, 1, 1, 1, 1,
0.6774231, 0.0898431, 0.1898632, 1, 1, 1, 1, 1,
0.6808736, -1.229387, 2.922427, 1, 1, 1, 1, 1,
0.6816676, -0.16953, 0.3845561, 1, 1, 1, 1, 1,
0.6819917, 0.3658665, 1.189032, 1, 1, 1, 1, 1,
0.684429, -0.2669742, 3.017189, 1, 1, 1, 1, 1,
0.6863197, 0.6335114, 1.229043, 1, 1, 1, 1, 1,
0.6866083, -0.4147588, 2.673573, 1, 1, 1, 1, 1,
0.6900771, 1.144658, 0.1388487, 0, 0, 1, 1, 1,
0.692441, 0.1046932, 2.091683, 1, 0, 0, 1, 1,
0.6926544, 0.7928448, 1.853022, 1, 0, 0, 1, 1,
0.6941659, -0.3747539, 2.442481, 1, 0, 0, 1, 1,
0.6947059, 1.627119, 0.2326526, 1, 0, 0, 1, 1,
0.6991401, 0.2519484, 0.3619803, 1, 0, 0, 1, 1,
0.7026046, 0.7717997, -0.2963203, 0, 0, 0, 1, 1,
0.7044446, 0.3396111, 0.637635, 0, 0, 0, 1, 1,
0.7072741, 0.2780803, 1.643071, 0, 0, 0, 1, 1,
0.7076397, -1.304721, 3.336833, 0, 0, 0, 1, 1,
0.7076753, -1.462835, 3.171845, 0, 0, 0, 1, 1,
0.7078333, -0.6282835, 1.442312, 0, 0, 0, 1, 1,
0.7129971, 0.1995584, 1.525774, 0, 0, 0, 1, 1,
0.7172728, -0.167949, 2.651354, 1, 1, 1, 1, 1,
0.7346123, 0.0004302463, 0.995186, 1, 1, 1, 1, 1,
0.7378136, 1.139699, 0.4370067, 1, 1, 1, 1, 1,
0.7379828, -0.7286473, 0.6229834, 1, 1, 1, 1, 1,
0.742793, 0.4643278, 3.709683, 1, 1, 1, 1, 1,
0.7469166, -0.3271086, 1.475933, 1, 1, 1, 1, 1,
0.758014, 1.050315, 1.659364, 1, 1, 1, 1, 1,
0.7585402, -0.7298738, 2.11003, 1, 1, 1, 1, 1,
0.760064, -0.1330167, 1.860119, 1, 1, 1, 1, 1,
0.7618244, -0.6223899, 0.7862203, 1, 1, 1, 1, 1,
0.7624432, 2.049926, -0.8954417, 1, 1, 1, 1, 1,
0.7625818, -1.223615, 2.780094, 1, 1, 1, 1, 1,
0.7701944, -1.15243, 3.863292, 1, 1, 1, 1, 1,
0.7732812, -0.410571, 2.124981, 1, 1, 1, 1, 1,
0.7791984, -2.28612, 4.077653, 1, 1, 1, 1, 1,
0.7798566, 0.1349071, 1.740712, 0, 0, 1, 1, 1,
0.783348, 0.999984, -0.134842, 1, 0, 0, 1, 1,
0.7875182, 0.8900084, 0.4976866, 1, 0, 0, 1, 1,
0.7886516, 0.725181, 2.226163, 1, 0, 0, 1, 1,
0.789023, 0.4584661, 1.146438, 1, 0, 0, 1, 1,
0.790166, -2.094872, 2.708605, 1, 0, 0, 1, 1,
0.7921158, -0.2405306, 2.55668, 0, 0, 0, 1, 1,
0.7959861, -0.876257, 1.844237, 0, 0, 0, 1, 1,
0.7964756, -0.5971499, 3.325833, 0, 0, 0, 1, 1,
0.8070103, 0.0893266, 0.3784102, 0, 0, 0, 1, 1,
0.814001, 1.932427, 2.238795, 0, 0, 0, 1, 1,
0.8147918, -0.5766018, 3.84653, 0, 0, 0, 1, 1,
0.8153515, 0.181392, 2.843049, 0, 0, 0, 1, 1,
0.8154205, 1.732321, 0.6048613, 1, 1, 1, 1, 1,
0.8195729, 1.085907, 0.8358042, 1, 1, 1, 1, 1,
0.8288448, 0.9413736, 2.439685, 1, 1, 1, 1, 1,
0.8492226, 1.493073, 0.4537192, 1, 1, 1, 1, 1,
0.8638104, -0.8583595, 2.268866, 1, 1, 1, 1, 1,
0.8641292, 1.459745, 0.4717956, 1, 1, 1, 1, 1,
0.8665897, 0.4803288, -0.8482345, 1, 1, 1, 1, 1,
0.8709304, 1.059884, 1.857165, 1, 1, 1, 1, 1,
0.8742279, 0.07251026, 3.19899, 1, 1, 1, 1, 1,
0.877172, -0.3710574, 1.920673, 1, 1, 1, 1, 1,
0.8788624, 1.580647, -0.5217662, 1, 1, 1, 1, 1,
0.881765, 1.00035, 1.746787, 1, 1, 1, 1, 1,
0.8831162, -1.384535, 2.590313, 1, 1, 1, 1, 1,
0.8831171, 1.360065, 0.313997, 1, 1, 1, 1, 1,
0.8863304, 1.316334, 2.370388, 1, 1, 1, 1, 1,
0.8866662, -1.171607, 3.178618, 0, 0, 1, 1, 1,
0.9034483, -1.048839, 1.862762, 1, 0, 0, 1, 1,
0.9111745, -0.3088574, 0.9815552, 1, 0, 0, 1, 1,
0.9167985, 0.3730258, 1.562068, 1, 0, 0, 1, 1,
0.9198281, 0.1980055, 0.2849214, 1, 0, 0, 1, 1,
0.9232783, 0.0526687, 1.780998, 1, 0, 0, 1, 1,
0.9316624, 1.151191, -0.07564668, 0, 0, 0, 1, 1,
0.9332597, 0.8233876, 0.5473609, 0, 0, 0, 1, 1,
0.9378486, -0.1951176, 2.922117, 0, 0, 0, 1, 1,
0.9390626, 0.8407754, 1.316434, 0, 0, 0, 1, 1,
0.9457372, -0.06040069, 0.8561648, 0, 0, 0, 1, 1,
0.9478233, -1.186031, 2.433291, 0, 0, 0, 1, 1,
0.9507706, 0.1013148, 1.629987, 0, 0, 0, 1, 1,
0.9537519, 0.5741684, 2.060879, 1, 1, 1, 1, 1,
0.9585283, -1.895534, 3.638194, 1, 1, 1, 1, 1,
0.9596807, -0.05593771, 3.065411, 1, 1, 1, 1, 1,
0.9646918, -0.2680826, 2.530077, 1, 1, 1, 1, 1,
0.9656276, -0.9845262, 0.8138903, 1, 1, 1, 1, 1,
0.9678704, -0.1462, 2.024115, 1, 1, 1, 1, 1,
0.9699786, -1.031715, 1.689169, 1, 1, 1, 1, 1,
0.9703887, 0.8865407, 1.666336, 1, 1, 1, 1, 1,
0.97278, 1.996681, 0.563262, 1, 1, 1, 1, 1,
0.9776837, -1.515769, -0.7003326, 1, 1, 1, 1, 1,
0.978206, -0.8189402, 3.370816, 1, 1, 1, 1, 1,
0.9836331, -0.387779, 2.903775, 1, 1, 1, 1, 1,
0.9840535, -0.2819587, 0.8894487, 1, 1, 1, 1, 1,
0.985606, 2.10617, 1.246146, 1, 1, 1, 1, 1,
0.9885039, 0.4684246, 1.700773, 1, 1, 1, 1, 1,
0.9941796, -0.2859052, 1.480157, 0, 0, 1, 1, 1,
0.9957253, -0.2816294, 1.934982, 1, 0, 0, 1, 1,
0.9993606, -0.9690273, 2.647932, 1, 0, 0, 1, 1,
1.002573, -1.432543, 4.514146, 1, 0, 0, 1, 1,
1.020422, 0.01455124, 2.742982, 1, 0, 0, 1, 1,
1.022247, -0.74354, 1.226955, 1, 0, 0, 1, 1,
1.022632, -1.572585, 4.575615, 0, 0, 0, 1, 1,
1.022634, 1.352728, 0.7148625, 0, 0, 0, 1, 1,
1.031142, 1.240795, 0.9628681, 0, 0, 0, 1, 1,
1.036822, -0.1356737, 1.105744, 0, 0, 0, 1, 1,
1.04161, -0.6161796, 3.466306, 0, 0, 0, 1, 1,
1.04242, -0.2628527, 2.667783, 0, 0, 0, 1, 1,
1.045027, -1.580393, 4.108876, 0, 0, 0, 1, 1,
1.053081, -1.422439, 4.450054, 1, 1, 1, 1, 1,
1.057198, -0.1725294, 2.554288, 1, 1, 1, 1, 1,
1.063739, 0.7690485, 1.316464, 1, 1, 1, 1, 1,
1.065009, -0.5727518, 1.991496, 1, 1, 1, 1, 1,
1.075052, 0.01261958, 1.283298, 1, 1, 1, 1, 1,
1.078558, -0.6974119, 2.201387, 1, 1, 1, 1, 1,
1.078704, 0.2614105, 0.5386829, 1, 1, 1, 1, 1,
1.081383, 0.3476953, -0.332638, 1, 1, 1, 1, 1,
1.082215, -0.3694518, 1.516926, 1, 1, 1, 1, 1,
1.085757, 0.3054685, 0.5514427, 1, 1, 1, 1, 1,
1.097729, -1.008706, 1.85425, 1, 1, 1, 1, 1,
1.106176, -0.01155948, 1.713684, 1, 1, 1, 1, 1,
1.106466, -0.8131735, 2.592673, 1, 1, 1, 1, 1,
1.108618, 0.01116288, 0.4280763, 1, 1, 1, 1, 1,
1.111319, 0.5787641, -0.2767132, 1, 1, 1, 1, 1,
1.111518, 0.2138776, 2.531172, 0, 0, 1, 1, 1,
1.118984, -0.6767503, 2.785593, 1, 0, 0, 1, 1,
1.124988, 0.8407819, 1.361706, 1, 0, 0, 1, 1,
1.125495, -0.6212668, 2.045801, 1, 0, 0, 1, 1,
1.13883, -0.4565628, 0.6578897, 1, 0, 0, 1, 1,
1.143821, -1.775594, 2.192618, 1, 0, 0, 1, 1,
1.144029, 1.125092, 0.3510566, 0, 0, 0, 1, 1,
1.150902, -0.7975408, 3.26538, 0, 0, 0, 1, 1,
1.151785, -0.03108486, 3.55765, 0, 0, 0, 1, 1,
1.157401, 1.896468, 1.650944, 0, 0, 0, 1, 1,
1.157444, 0.6527593, 2.238851, 0, 0, 0, 1, 1,
1.158831, -0.1712203, 1.796229, 0, 0, 0, 1, 1,
1.161651, 0.3881714, 1.66129, 0, 0, 0, 1, 1,
1.165006, 0.03356699, -0.09369072, 1, 1, 1, 1, 1,
1.16618, 0.2194733, 1.520033, 1, 1, 1, 1, 1,
1.173616, -0.5487828, 2.371141, 1, 1, 1, 1, 1,
1.174136, -0.710207, 3.088157, 1, 1, 1, 1, 1,
1.177924, -0.1357546, 2.684966, 1, 1, 1, 1, 1,
1.189897, -2.291872, 3.809382, 1, 1, 1, 1, 1,
1.193408, 0.936579, 0.6504483, 1, 1, 1, 1, 1,
1.204638, -0.2924863, 2.865745, 1, 1, 1, 1, 1,
1.209647, 0.01519075, 2.675434, 1, 1, 1, 1, 1,
1.212219, 0.2441331, 1.197037, 1, 1, 1, 1, 1,
1.222314, 0.334623, 0.7006627, 1, 1, 1, 1, 1,
1.224538, -1.858227, 4.648139, 1, 1, 1, 1, 1,
1.23233, 1.322428, 0.08228746, 1, 1, 1, 1, 1,
1.232343, -1.108135, 1.915594, 1, 1, 1, 1, 1,
1.242645, -0.3000822, 1.323834, 1, 1, 1, 1, 1,
1.248829, -0.7416533, 1.112475, 0, 0, 1, 1, 1,
1.256729, 0.4750895, 0.576852, 1, 0, 0, 1, 1,
1.26513, -2.614611, 1.614736, 1, 0, 0, 1, 1,
1.26748, -0.9921026, 1.918515, 1, 0, 0, 1, 1,
1.275738, 0.8148102, -1.13971, 1, 0, 0, 1, 1,
1.278529, 0.3683035, 2.866809, 1, 0, 0, 1, 1,
1.286685, 1.633724, -0.7836821, 0, 0, 0, 1, 1,
1.299004, 1.565912, 1.573498, 0, 0, 0, 1, 1,
1.30092, 0.1594293, 1.625443, 0, 0, 0, 1, 1,
1.305063, -0.1163364, 1.446513, 0, 0, 0, 1, 1,
1.305412, 0.582284, 2.081138, 0, 0, 0, 1, 1,
1.335897, 1.571339, 2.822393, 0, 0, 0, 1, 1,
1.341694, 0.07701679, 0.3576198, 0, 0, 0, 1, 1,
1.357361, -1.956421, 2.331982, 1, 1, 1, 1, 1,
1.364126, -0.862736, 1.473161, 1, 1, 1, 1, 1,
1.3913, 0.6765009, 1.839901, 1, 1, 1, 1, 1,
1.400844, -1.234985, 0.8472052, 1, 1, 1, 1, 1,
1.404673, -0.9641611, 2.167381, 1, 1, 1, 1, 1,
1.405654, 0.5026137, 0.8234788, 1, 1, 1, 1, 1,
1.406018, -0.3653533, 2.942489, 1, 1, 1, 1, 1,
1.411964, 1.571594, 1.866633, 1, 1, 1, 1, 1,
1.415077, -1.155855, 2.628696, 1, 1, 1, 1, 1,
1.421939, 0.2345029, 0.2311653, 1, 1, 1, 1, 1,
1.42338, -0.3345276, 3.042791, 1, 1, 1, 1, 1,
1.4346, -0.316284, 2.271082, 1, 1, 1, 1, 1,
1.443658, 0.3937594, 1.363021, 1, 1, 1, 1, 1,
1.446615, -0.1480522, 2.1955, 1, 1, 1, 1, 1,
1.457525, -0.7794943, 3.024752, 1, 1, 1, 1, 1,
1.463003, -0.2408313, 2.281656, 0, 0, 1, 1, 1,
1.47373, -0.373101, 0.6287377, 1, 0, 0, 1, 1,
1.476825, -0.004278732, -0.3157947, 1, 0, 0, 1, 1,
1.477224, 0.4921376, 0.7955716, 1, 0, 0, 1, 1,
1.509048, -0.7326776, 3.212251, 1, 0, 0, 1, 1,
1.514628, -0.4587972, 2.401683, 1, 0, 0, 1, 1,
1.518602, 0.09581833, 1.967216, 0, 0, 0, 1, 1,
1.528532, 0.9131188, 0.1215236, 0, 0, 0, 1, 1,
1.533858, -0.05307917, 1.000737, 0, 0, 0, 1, 1,
1.561262, 1.289688, 1.765521, 0, 0, 0, 1, 1,
1.563863, 0.167546, 2.320636, 0, 0, 0, 1, 1,
1.567799, 0.4894386, 2.274866, 0, 0, 0, 1, 1,
1.571104, -0.619657, 3.306803, 0, 0, 0, 1, 1,
1.5769, -0.07633373, 0.2114109, 1, 1, 1, 1, 1,
1.577731, -1.190044, 2.570402, 1, 1, 1, 1, 1,
1.587782, 0.5414203, 1.584733, 1, 1, 1, 1, 1,
1.599598, 0.06366768, -0.4538028, 1, 1, 1, 1, 1,
1.607872, 2.165787, 0.01070903, 1, 1, 1, 1, 1,
1.615412, 1.047343, 0.7478024, 1, 1, 1, 1, 1,
1.616242, 2.230724, 0.5808936, 1, 1, 1, 1, 1,
1.620292, 0.1571371, 2.417226, 1, 1, 1, 1, 1,
1.630752, 0.7888806, 0.7201723, 1, 1, 1, 1, 1,
1.635752, 0.3732343, 1.181247, 1, 1, 1, 1, 1,
1.655307, -1.132282, 1.602753, 1, 1, 1, 1, 1,
1.662838, -0.965449, 1.193352, 1, 1, 1, 1, 1,
1.671386, 1.623033, 1.779307, 1, 1, 1, 1, 1,
1.674197, -1.398374, 2.284124, 1, 1, 1, 1, 1,
1.676894, -0.1185888, 0.6998269, 1, 1, 1, 1, 1,
1.681685, -1.336239, 2.153964, 0, 0, 1, 1, 1,
1.688233, -1.984596, 2.627249, 1, 0, 0, 1, 1,
1.696557, -2.167078, 1.610998, 1, 0, 0, 1, 1,
1.700343, -1.833502, 1.239466, 1, 0, 0, 1, 1,
1.703943, 0.03284902, 2.707553, 1, 0, 0, 1, 1,
1.708244, -0.9402909, 3.139055, 1, 0, 0, 1, 1,
1.719961, -0.7369378, 1.633734, 0, 0, 0, 1, 1,
1.748011, 0.2631015, 1.905981, 0, 0, 0, 1, 1,
1.764496, 0.9519361, 1.449009, 0, 0, 0, 1, 1,
1.783779, 2.101525, 3.016063, 0, 0, 0, 1, 1,
1.791341, -0.3895985, 2.355149, 0, 0, 0, 1, 1,
1.792258, -0.4222168, 0.1092827, 0, 0, 0, 1, 1,
1.793552, -0.9629811, 0.2588853, 0, 0, 0, 1, 1,
1.812391, 0.8434647, 0.5383296, 1, 1, 1, 1, 1,
1.834871, 0.8084325, 1.619669, 1, 1, 1, 1, 1,
1.83556, 0.05359688, 0.1651734, 1, 1, 1, 1, 1,
1.846122, -0.6500099, 2.446895, 1, 1, 1, 1, 1,
1.850398, -0.246403, 1.373666, 1, 1, 1, 1, 1,
1.883364, 1.048199, 1.323092, 1, 1, 1, 1, 1,
1.884358, -0.6708435, 0.8692073, 1, 1, 1, 1, 1,
1.924234, -1.763414, 1.809879, 1, 1, 1, 1, 1,
1.92468, 0.5041659, 2.679502, 1, 1, 1, 1, 1,
1.948899, -2.010625, 2.306575, 1, 1, 1, 1, 1,
1.967408, -0.5782, 2.336312, 1, 1, 1, 1, 1,
2.012753, 1.229076, 0.7626503, 1, 1, 1, 1, 1,
2.015986, 1.315759, 0.3992469, 1, 1, 1, 1, 1,
2.035695, 0.1331894, 1.787454, 1, 1, 1, 1, 1,
2.072985, 0.7244757, 0.8464915, 1, 1, 1, 1, 1,
2.075478, 0.09777244, 1.062119, 0, 0, 1, 1, 1,
2.09473, 1.496858, 2.086826, 1, 0, 0, 1, 1,
2.097115, 0.8258551, 1.811633, 1, 0, 0, 1, 1,
2.097158, -0.5355613, 0.4112504, 1, 0, 0, 1, 1,
2.105379, 0.2304273, 1.365183, 1, 0, 0, 1, 1,
2.129761, -0.2245832, 2.050624, 1, 0, 0, 1, 1,
2.14448, 0.8942531, 1.012643, 0, 0, 0, 1, 1,
2.154028, 0.8793617, 0.4039577, 0, 0, 0, 1, 1,
2.208144, -0.2140916, 1.161453, 0, 0, 0, 1, 1,
2.269933, 0.8881735, -0.2735264, 0, 0, 0, 1, 1,
2.2782, -1.031752, 3.534981, 0, 0, 0, 1, 1,
2.299764, -1.051157, 0.8693368, 0, 0, 0, 1, 1,
2.379916, -1.398426, 2.156379, 0, 0, 0, 1, 1,
2.38347, -0.5795612, 3.169622, 1, 1, 1, 1, 1,
2.437988, -0.203299, 4.067268, 1, 1, 1, 1, 1,
2.444262, -1.09704, 2.776488, 1, 1, 1, 1, 1,
2.452495, 1.19369, 1.415329, 1, 1, 1, 1, 1,
2.594547, -0.8248814, 0.5251908, 1, 1, 1, 1, 1,
2.62049, 1.866298, 0.2276558, 1, 1, 1, 1, 1,
2.876157, -0.8359708, 1.900987, 1, 1, 1, 1, 1
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
var radius = 9.709526;
var distance = 34.1043;
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
mvMatrix.translate( 0.002506614, -0.4231648, 0.04803872 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.1043);
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
