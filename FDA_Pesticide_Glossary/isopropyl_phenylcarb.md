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
-2.858375, 1.092682, -1.005506, 1, 0, 0, 1,
-2.802703, -0.07606005, -0.03980495, 1, 0.007843138, 0, 1,
-2.788727, 0.07950219, -1.139807, 1, 0.01176471, 0, 1,
-2.509282, -0.6980464, -2.93326, 1, 0.01960784, 0, 1,
-2.370912, 1.371266, -1.200844, 1, 0.02352941, 0, 1,
-2.363348, 0.05946947, 0.4459523, 1, 0.03137255, 0, 1,
-2.345198, -0.05560222, -0.01055482, 1, 0.03529412, 0, 1,
-2.300029, 0.03925841, -1.792409, 1, 0.04313726, 0, 1,
-2.244067, 1.219964, 0.377971, 1, 0.04705882, 0, 1,
-2.229724, -0.058832, -2.332612, 1, 0.05490196, 0, 1,
-2.225221, -1.866863, -2.030913, 1, 0.05882353, 0, 1,
-2.181609, -0.3327869, -2.759833, 1, 0.06666667, 0, 1,
-2.162671, 1.547659, 0.07157809, 1, 0.07058824, 0, 1,
-2.154811, 0.7860401, -0.03321813, 1, 0.07843138, 0, 1,
-2.145436, -0.6047358, -2.484552, 1, 0.08235294, 0, 1,
-2.123754, 0.7707206, -0.4411899, 1, 0.09019608, 0, 1,
-2.103559, 0.507273, -1.691329, 1, 0.09411765, 0, 1,
-2.099129, -0.7458689, -0.7231227, 1, 0.1019608, 0, 1,
-2.066145, -0.9088849, -1.877675, 1, 0.1098039, 0, 1,
-2.058904, -0.5524994, -0.2440635, 1, 0.1137255, 0, 1,
-2.031754, -0.6465904, -2.203748, 1, 0.1215686, 0, 1,
-2.029119, 0.52556, -3.099809, 1, 0.1254902, 0, 1,
-2.017803, -1.613289, -1.890932, 1, 0.1333333, 0, 1,
-1.994866, -0.8990987, -2.376149, 1, 0.1372549, 0, 1,
-1.993916, -0.2133634, -2.180584, 1, 0.145098, 0, 1,
-1.993855, 0.3755529, 0.290154, 1, 0.1490196, 0, 1,
-1.951007, 0.01148935, -0.5794496, 1, 0.1568628, 0, 1,
-1.923865, 0.1588504, -1.964358, 1, 0.1607843, 0, 1,
-1.895649, 0.05076686, -3.087394, 1, 0.1686275, 0, 1,
-1.893583, 0.6481047, -1.812077, 1, 0.172549, 0, 1,
-1.892622, -1.081329, -3.890171, 1, 0.1803922, 0, 1,
-1.891117, 0.9811883, -0.578001, 1, 0.1843137, 0, 1,
-1.87209, -2.518421, -3.177827, 1, 0.1921569, 0, 1,
-1.863021, -0.3814522, -0.9138635, 1, 0.1960784, 0, 1,
-1.859465, 0.7235263, 0.3004134, 1, 0.2039216, 0, 1,
-1.856204, 0.05653725, -1.785357, 1, 0.2117647, 0, 1,
-1.841858, -0.179071, -3.099634, 1, 0.2156863, 0, 1,
-1.838163, -0.8227556, -2.562021, 1, 0.2235294, 0, 1,
-1.82536, 0.9918248, -2.159554, 1, 0.227451, 0, 1,
-1.813854, 0.394927, -0.4121476, 1, 0.2352941, 0, 1,
-1.810907, 1.054212, -0.09377009, 1, 0.2392157, 0, 1,
-1.807003, 1.654176, -2.452437, 1, 0.2470588, 0, 1,
-1.802129, 0.8683552, -1.297687, 1, 0.2509804, 0, 1,
-1.780004, -1.262237, -2.349864, 1, 0.2588235, 0, 1,
-1.76587, 1.882295, -0.6511372, 1, 0.2627451, 0, 1,
-1.750822, 0.5936975, -1.502707, 1, 0.2705882, 0, 1,
-1.748097, -2.426769, -2.512274, 1, 0.2745098, 0, 1,
-1.728948, 1.00904, 1.223673, 1, 0.282353, 0, 1,
-1.721085, -1.453872, -1.313547, 1, 0.2862745, 0, 1,
-1.71184, 0.04796934, -1.336762, 1, 0.2941177, 0, 1,
-1.709621, 1.10081, -2.923528, 1, 0.3019608, 0, 1,
-1.704748, -0.4269608, -1.525848, 1, 0.3058824, 0, 1,
-1.699618, -0.8011888, -2.912398, 1, 0.3137255, 0, 1,
-1.68319, -1.806108, -2.624911, 1, 0.3176471, 0, 1,
-1.677915, 0.5091106, -1.40169, 1, 0.3254902, 0, 1,
-1.668457, -0.7541118, -2.056487, 1, 0.3294118, 0, 1,
-1.658071, -0.3192935, -2.818046, 1, 0.3372549, 0, 1,
-1.64873, 0.2271522, -2.971531, 1, 0.3411765, 0, 1,
-1.631862, 0.5126038, -0.7284606, 1, 0.3490196, 0, 1,
-1.622419, 0.1058387, -1.9826, 1, 0.3529412, 0, 1,
-1.616361, 0.7786578, -2.993693, 1, 0.3607843, 0, 1,
-1.609006, -0.3799455, -1.573351, 1, 0.3647059, 0, 1,
-1.605104, 0.4992667, -0.1689247, 1, 0.372549, 0, 1,
-1.591961, 1.209585, -0.2481583, 1, 0.3764706, 0, 1,
-1.581747, -0.7518659, -1.606225, 1, 0.3843137, 0, 1,
-1.566047, 0.6221212, -1.724956, 1, 0.3882353, 0, 1,
-1.562182, 1.210366, -0.2006984, 1, 0.3960784, 0, 1,
-1.55617, -1.036212, -1.848116, 1, 0.4039216, 0, 1,
-1.531625, 0.9008176, -2.505705, 1, 0.4078431, 0, 1,
-1.523485, 0.1792225, -2.137393, 1, 0.4156863, 0, 1,
-1.500875, 0.751789, 0.1356156, 1, 0.4196078, 0, 1,
-1.494435, -0.8327178, -2.018727, 1, 0.427451, 0, 1,
-1.486941, 0.02667468, -1.356973, 1, 0.4313726, 0, 1,
-1.485455, -0.2067125, -1.352708, 1, 0.4392157, 0, 1,
-1.482582, 1.135591, 0.3223133, 1, 0.4431373, 0, 1,
-1.466058, -0.2738284, -2.131311, 1, 0.4509804, 0, 1,
-1.46394, 1.310261, 0.5108852, 1, 0.454902, 0, 1,
-1.461452, -0.1847619, -1.160123, 1, 0.4627451, 0, 1,
-1.456768, -0.167505, -1.068459, 1, 0.4666667, 0, 1,
-1.450242, 1.999127, -0.4053296, 1, 0.4745098, 0, 1,
-1.446362, -0.7881424, -2.812795, 1, 0.4784314, 0, 1,
-1.442144, -1.400246, -2.462261, 1, 0.4862745, 0, 1,
-1.44027, -0.6302053, -3.941669, 1, 0.4901961, 0, 1,
-1.432302, 0.926533, -0.1665108, 1, 0.4980392, 0, 1,
-1.428086, 0.4639969, -1.559612, 1, 0.5058824, 0, 1,
-1.424111, -0.280629, -1.267829, 1, 0.509804, 0, 1,
-1.421525, 0.07040577, -1.939332, 1, 0.5176471, 0, 1,
-1.419716, -0.8755423, -2.14114, 1, 0.5215687, 0, 1,
-1.417287, -0.6861386, -1.964582, 1, 0.5294118, 0, 1,
-1.417235, 0.2162363, -1.590124, 1, 0.5333334, 0, 1,
-1.407142, -0.6358302, -2.226934, 1, 0.5411765, 0, 1,
-1.394764, 1.215951, 0.1589297, 1, 0.5450981, 0, 1,
-1.388212, 1.593298, -0.740689, 1, 0.5529412, 0, 1,
-1.380897, 0.2504911, -0.8559352, 1, 0.5568628, 0, 1,
-1.368448, -0.646143, -2.497877, 1, 0.5647059, 0, 1,
-1.368425, -2.239581, -0.6421269, 1, 0.5686275, 0, 1,
-1.363416, 0.4565918, -1.860408, 1, 0.5764706, 0, 1,
-1.362576, -0.45107, -2.745699, 1, 0.5803922, 0, 1,
-1.355279, 0.9409201, -0.803351, 1, 0.5882353, 0, 1,
-1.354112, -0.4025011, -0.513438, 1, 0.5921569, 0, 1,
-1.342341, 0.3984397, 0.02202912, 1, 0.6, 0, 1,
-1.341896, 0.2279207, -2.456951, 1, 0.6078432, 0, 1,
-1.339061, -2.072569, -3.779914, 1, 0.6117647, 0, 1,
-1.333811, -0.1455761, -2.122528, 1, 0.6196079, 0, 1,
-1.332681, 0.5988031, -2.496632, 1, 0.6235294, 0, 1,
-1.332377, -0.6177457, -0.9618915, 1, 0.6313726, 0, 1,
-1.329785, -1.725231, -2.058547, 1, 0.6352941, 0, 1,
-1.329434, -0.4816724, -0.9440312, 1, 0.6431373, 0, 1,
-1.316224, 0.3187774, 0.1774022, 1, 0.6470588, 0, 1,
-1.305013, -0.3439348, -2.636127, 1, 0.654902, 0, 1,
-1.303663, -0.6646042, -1.778703, 1, 0.6588235, 0, 1,
-1.301554, 0.3776057, -1.923171, 1, 0.6666667, 0, 1,
-1.292785, -0.6486695, -2.506931, 1, 0.6705883, 0, 1,
-1.292, -2.273461, -3.559612, 1, 0.6784314, 0, 1,
-1.286937, -0.2456473, -3.259664, 1, 0.682353, 0, 1,
-1.278134, -1.131847, -2.676145, 1, 0.6901961, 0, 1,
-1.277364, -1.544881, -2.931845, 1, 0.6941177, 0, 1,
-1.276634, -0.1238265, -1.534012, 1, 0.7019608, 0, 1,
-1.264082, 0.09590604, -0.7666647, 1, 0.7098039, 0, 1,
-1.259899, 0.5152168, -1.383399, 1, 0.7137255, 0, 1,
-1.257726, 0.5304316, 0.1176544, 1, 0.7215686, 0, 1,
-1.247058, 1.557444, 0.4415815, 1, 0.7254902, 0, 1,
-1.244713, -0.565063, -2.695933, 1, 0.7333333, 0, 1,
-1.244561, -0.388707, -3.002521, 1, 0.7372549, 0, 1,
-1.234477, 0.7729587, -0.1373173, 1, 0.7450981, 0, 1,
-1.233792, 0.747898, -1.437767, 1, 0.7490196, 0, 1,
-1.229465, -1.355498, -1.571582, 1, 0.7568628, 0, 1,
-1.216937, -0.4342963, -1.657628, 1, 0.7607843, 0, 1,
-1.215111, 1.334661, -0.7575836, 1, 0.7686275, 0, 1,
-1.205494, 0.482683, -1.627556, 1, 0.772549, 0, 1,
-1.199148, -1.978148, -1.538883, 1, 0.7803922, 0, 1,
-1.191042, -0.1061989, -1.461383, 1, 0.7843137, 0, 1,
-1.186208, -0.07275455, -2.909733, 1, 0.7921569, 0, 1,
-1.181551, 0.3077287, 0.1478234, 1, 0.7960784, 0, 1,
-1.17944, 0.70263, -1.937044, 1, 0.8039216, 0, 1,
-1.17571, 1.972851, 1.383242, 1, 0.8117647, 0, 1,
-1.174219, -0.6950468, -0.9805577, 1, 0.8156863, 0, 1,
-1.153893, 1.886921, -0.5487206, 1, 0.8235294, 0, 1,
-1.135593, 0.7203467, -0.749034, 1, 0.827451, 0, 1,
-1.134944, 1.183679, 0.03292232, 1, 0.8352941, 0, 1,
-1.128509, 0.8651145, -1.960197, 1, 0.8392157, 0, 1,
-1.126762, -0.9175072, -2.78013, 1, 0.8470588, 0, 1,
-1.118298, -0.2103333, -2.058489, 1, 0.8509804, 0, 1,
-1.102822, 1.04108, -1.257912, 1, 0.8588235, 0, 1,
-1.102034, 0.1206461, -1.016273, 1, 0.8627451, 0, 1,
-1.098374, 0.9111002, 0.5711218, 1, 0.8705882, 0, 1,
-1.085296, -1.224525, -2.85047, 1, 0.8745098, 0, 1,
-1.083859, 0.06819601, -1.510512, 1, 0.8823529, 0, 1,
-1.078363, 0.7072678, -0.4524627, 1, 0.8862745, 0, 1,
-1.076928, -0.3036896, -2.061265, 1, 0.8941177, 0, 1,
-1.076581, -0.5683615, 0.2129482, 1, 0.8980392, 0, 1,
-1.071957, -1.387074, -2.201256, 1, 0.9058824, 0, 1,
-1.063736, 0.501042, -0.5973681, 1, 0.9137255, 0, 1,
-1.056023, -0.01068126, -1.52936, 1, 0.9176471, 0, 1,
-1.05248, -0.2908473, -2.329875, 1, 0.9254902, 0, 1,
-1.052188, -0.7008719, -2.993551, 1, 0.9294118, 0, 1,
-1.050871, 1.281245, -0.4577249, 1, 0.9372549, 0, 1,
-1.049556, -2.920017, -2.028407, 1, 0.9411765, 0, 1,
-1.048833, -0.7288437, -1.219915, 1, 0.9490196, 0, 1,
-1.041898, 0.2191474, -3.03236, 1, 0.9529412, 0, 1,
-1.035227, 0.427332, -1.327752, 1, 0.9607843, 0, 1,
-1.033716, -1.323055, -2.559746, 1, 0.9647059, 0, 1,
-1.014495, -0.8565579, -1.803022, 1, 0.972549, 0, 1,
-1.013733, -0.1363338, -3.710214, 1, 0.9764706, 0, 1,
-1.013364, 0.3809739, 1.720521, 1, 0.9843137, 0, 1,
-1.009223, 0.9038555, -2.140981, 1, 0.9882353, 0, 1,
-1.002507, -0.2125102, -1.270216, 1, 0.9960784, 0, 1,
-0.9992436, 0.02655607, -1.864401, 0.9960784, 1, 0, 1,
-0.9955562, 1.394938, -0.7567453, 0.9921569, 1, 0, 1,
-0.9945627, -0.7814261, -3.152164, 0.9843137, 1, 0, 1,
-0.985505, 0.4584232, -1.841649, 0.9803922, 1, 0, 1,
-0.9844404, -0.4727499, -1.827655, 0.972549, 1, 0, 1,
-0.9785419, 1.800586, -1.624721, 0.9686275, 1, 0, 1,
-0.9694582, 0.1834405, -1.894804, 0.9607843, 1, 0, 1,
-0.9665978, 0.4234095, -2.893399, 0.9568627, 1, 0, 1,
-0.9605763, -0.9347214, -3.046311, 0.9490196, 1, 0, 1,
-0.9600886, -0.7880805, -2.602315, 0.945098, 1, 0, 1,
-0.9592355, -1.01798, -2.240724, 0.9372549, 1, 0, 1,
-0.958361, -0.5909552, -2.102587, 0.9333333, 1, 0, 1,
-0.9554116, 1.425362, -0.3055075, 0.9254902, 1, 0, 1,
-0.9531947, 2.122222, -0.7629947, 0.9215686, 1, 0, 1,
-0.9427591, 0.4489845, -0.2854189, 0.9137255, 1, 0, 1,
-0.9333912, 0.4574868, -3.810032, 0.9098039, 1, 0, 1,
-0.9313055, -0.499163, -2.836096, 0.9019608, 1, 0, 1,
-0.9311427, -0.1789476, -1.163842, 0.8941177, 1, 0, 1,
-0.9302413, 0.5230075, -2.022619, 0.8901961, 1, 0, 1,
-0.9262047, 0.4564433, -2.3019, 0.8823529, 1, 0, 1,
-0.9246876, 0.8943067, 0.1776827, 0.8784314, 1, 0, 1,
-0.9233858, 1.17544, 0.4042226, 0.8705882, 1, 0, 1,
-0.9232346, 0.2520512, -0.5777634, 0.8666667, 1, 0, 1,
-0.9196411, 0.4183922, -2.48472, 0.8588235, 1, 0, 1,
-0.9152856, 1.094591, -0.5130985, 0.854902, 1, 0, 1,
-0.9122019, 0.2767661, -1.077461, 0.8470588, 1, 0, 1,
-0.9025893, 0.5916782, -1.552564, 0.8431373, 1, 0, 1,
-0.9001366, 0.9380446, -0.7368497, 0.8352941, 1, 0, 1,
-0.8762565, 0.5231905, 0.1375344, 0.8313726, 1, 0, 1,
-0.8757966, 0.1793986, -2.92974, 0.8235294, 1, 0, 1,
-0.8732346, -0.04719444, -1.520547, 0.8196079, 1, 0, 1,
-0.872878, 0.2195362, -1.42192, 0.8117647, 1, 0, 1,
-0.8715412, 0.4465022, 0.2019125, 0.8078431, 1, 0, 1,
-0.8567084, -0.672694, -1.2824, 0.8, 1, 0, 1,
-0.8558331, 0.3501291, 0.2065671, 0.7921569, 1, 0, 1,
-0.8544136, -0.1418926, -1.388729, 0.7882353, 1, 0, 1,
-0.8534461, 1.381709, -1.466335, 0.7803922, 1, 0, 1,
-0.8512425, 0.6663725, -1.53285, 0.7764706, 1, 0, 1,
-0.8466308, -0.5375582, -1.769486, 0.7686275, 1, 0, 1,
-0.842617, -0.7391339, -3.733769, 0.7647059, 1, 0, 1,
-0.8420551, 1.278357, -0.007589383, 0.7568628, 1, 0, 1,
-0.8418213, -0.5683632, -2.049142, 0.7529412, 1, 0, 1,
-0.8416167, 1.183246, 0.02318369, 0.7450981, 1, 0, 1,
-0.8414701, -0.2423991, -2.421747, 0.7411765, 1, 0, 1,
-0.8370065, 0.1501601, -0.9299226, 0.7333333, 1, 0, 1,
-0.8337025, -1.005708, -4.259225, 0.7294118, 1, 0, 1,
-0.8334858, -0.4803689, -2.743667, 0.7215686, 1, 0, 1,
-0.8319159, -1.839884, -4.032655, 0.7176471, 1, 0, 1,
-0.8300477, -0.5428608, -3.056781, 0.7098039, 1, 0, 1,
-0.8297632, -1.045335, -2.362025, 0.7058824, 1, 0, 1,
-0.829213, 0.762998, -0.4333889, 0.6980392, 1, 0, 1,
-0.8229972, -0.5286111, -1.166398, 0.6901961, 1, 0, 1,
-0.8151274, -1.130776, -1.976494, 0.6862745, 1, 0, 1,
-0.809709, 0.3715488, 0.7531366, 0.6784314, 1, 0, 1,
-0.8042346, -1.535858, -2.6975, 0.6745098, 1, 0, 1,
-0.801384, -0.2317983, -0.8060123, 0.6666667, 1, 0, 1,
-0.8007831, 0.5207672, -2.286329, 0.6627451, 1, 0, 1,
-0.7990323, 0.2252924, -1.315633, 0.654902, 1, 0, 1,
-0.7965554, -0.2371933, -0.5265055, 0.6509804, 1, 0, 1,
-0.7945114, -0.6065931, -3.041783, 0.6431373, 1, 0, 1,
-0.793282, 0.8875493, -2.93395, 0.6392157, 1, 0, 1,
-0.7917981, -2.453754, -4.054092, 0.6313726, 1, 0, 1,
-0.7908683, -0.2137145, -1.240435, 0.627451, 1, 0, 1,
-0.7906658, -2.176674, -2.803367, 0.6196079, 1, 0, 1,
-0.7892073, 0.7150965, -0.817041, 0.6156863, 1, 0, 1,
-0.7830622, 2.049294, -1.106821, 0.6078432, 1, 0, 1,
-0.7809103, 0.348374, -1.450034, 0.6039216, 1, 0, 1,
-0.7722639, -1.075692, -2.988892, 0.5960785, 1, 0, 1,
-0.7719517, -1.272998, -2.997595, 0.5882353, 1, 0, 1,
-0.7640814, -0.5839849, -1.546845, 0.5843138, 1, 0, 1,
-0.763014, 0.4913712, 0.1850126, 0.5764706, 1, 0, 1,
-0.7621505, 0.2526435, -0.572682, 0.572549, 1, 0, 1,
-0.7616886, 0.5295807, -1.699599, 0.5647059, 1, 0, 1,
-0.7610619, 1.751574, -0.9273583, 0.5607843, 1, 0, 1,
-0.7600006, 0.4955886, -1.185917, 0.5529412, 1, 0, 1,
-0.7556532, -0.8817728, -4.537022, 0.5490196, 1, 0, 1,
-0.7526692, 0.2877785, -1.148698, 0.5411765, 1, 0, 1,
-0.7517251, -0.7166665, -3.615439, 0.5372549, 1, 0, 1,
-0.7511905, -0.0646207, -1.99022, 0.5294118, 1, 0, 1,
-0.7493105, -1.065791, -3.362278, 0.5254902, 1, 0, 1,
-0.74783, 0.3718772, -0.9989187, 0.5176471, 1, 0, 1,
-0.7462807, 0.5816457, -1.305242, 0.5137255, 1, 0, 1,
-0.7428046, 0.6562818, -1.691673, 0.5058824, 1, 0, 1,
-0.7424194, 0.8399046, 0.3777337, 0.5019608, 1, 0, 1,
-0.7361736, -3.072515, -4.536356, 0.4941176, 1, 0, 1,
-0.7312869, -0.4402524, -1.265485, 0.4862745, 1, 0, 1,
-0.7263499, 0.8659672, -2.328674, 0.4823529, 1, 0, 1,
-0.7147184, 0.5751981, -2.346961, 0.4745098, 1, 0, 1,
-0.7144786, -1.389407, -2.620721, 0.4705882, 1, 0, 1,
-0.7123368, -0.4748292, -0.5591397, 0.4627451, 1, 0, 1,
-0.7110913, -1.14194, -2.947695, 0.4588235, 1, 0, 1,
-0.7109264, 0.2484179, -2.337791, 0.4509804, 1, 0, 1,
-0.7086413, 0.754453, -1.027033, 0.4470588, 1, 0, 1,
-0.6992255, -0.6776181, -3.262749, 0.4392157, 1, 0, 1,
-0.6953285, -0.3174377, -2.321519, 0.4352941, 1, 0, 1,
-0.6950564, 0.1515328, -2.774333, 0.427451, 1, 0, 1,
-0.6933806, -0.7623508, -1.420838, 0.4235294, 1, 0, 1,
-0.6852784, -0.1915921, -0.4207392, 0.4156863, 1, 0, 1,
-0.6851022, 0.5474914, -0.746401, 0.4117647, 1, 0, 1,
-0.683543, 0.09533297, -1.738622, 0.4039216, 1, 0, 1,
-0.6790781, 0.2602936, -0.5414396, 0.3960784, 1, 0, 1,
-0.6789343, 1.138342, 0.7267538, 0.3921569, 1, 0, 1,
-0.6780736, 1.332696, 1.44878, 0.3843137, 1, 0, 1,
-0.6774813, 0.004116801, -1.147218, 0.3803922, 1, 0, 1,
-0.674954, -0.9277456, -2.279569, 0.372549, 1, 0, 1,
-0.6733537, 0.5314514, -0.371759, 0.3686275, 1, 0, 1,
-0.6682264, 2.535069, 0.9493445, 0.3607843, 1, 0, 1,
-0.6575599, 1.158154, -0.1276692, 0.3568628, 1, 0, 1,
-0.6567304, -0.001206367, -1.022666, 0.3490196, 1, 0, 1,
-0.6516511, 0.4171733, 0.07557146, 0.345098, 1, 0, 1,
-0.6469719, -0.6540309, -2.183007, 0.3372549, 1, 0, 1,
-0.6416717, 0.08802555, -3.051106, 0.3333333, 1, 0, 1,
-0.6370121, 0.5243528, -0.4505067, 0.3254902, 1, 0, 1,
-0.6362663, -0.3321244, -0.1249152, 0.3215686, 1, 0, 1,
-0.6362349, 1.501624, 0.2837806, 0.3137255, 1, 0, 1,
-0.6353936, -1.626639, -2.798769, 0.3098039, 1, 0, 1,
-0.6313392, -0.3542896, -1.770494, 0.3019608, 1, 0, 1,
-0.6310171, 0.1060997, -0.4321164, 0.2941177, 1, 0, 1,
-0.6259019, 0.9214987, -1.576085, 0.2901961, 1, 0, 1,
-0.6244338, -0.8232082, -2.830305, 0.282353, 1, 0, 1,
-0.6220301, -0.02897077, 1.07761, 0.2784314, 1, 0, 1,
-0.6219331, -0.507449, -1.526224, 0.2705882, 1, 0, 1,
-0.6212987, 1.024217, -0.4170062, 0.2666667, 1, 0, 1,
-0.6191119, -0.06600881, -1.949883, 0.2588235, 1, 0, 1,
-0.6183841, -0.3074521, -2.696965, 0.254902, 1, 0, 1,
-0.6164703, 0.4466565, -2.114797, 0.2470588, 1, 0, 1,
-0.6161228, -0.6864485, -2.926335, 0.2431373, 1, 0, 1,
-0.6128917, 0.5268849, -0.1257253, 0.2352941, 1, 0, 1,
-0.6116638, -0.8470259, -0.5264087, 0.2313726, 1, 0, 1,
-0.6110656, -1.474828, -3.148582, 0.2235294, 1, 0, 1,
-0.6099952, -0.2748632, -1.126816, 0.2196078, 1, 0, 1,
-0.6098068, -0.04319124, -3.080543, 0.2117647, 1, 0, 1,
-0.6091542, -0.02990207, -1.806215, 0.2078431, 1, 0, 1,
-0.606563, -0.8792807, -0.8208748, 0.2, 1, 0, 1,
-0.6040382, -0.7369853, -3.694874, 0.1921569, 1, 0, 1,
-0.5993925, 1.054469, -0.4934036, 0.1882353, 1, 0, 1,
-0.5987645, 0.1292064, -1.390825, 0.1803922, 1, 0, 1,
-0.5910636, 1.742215, 0.4233077, 0.1764706, 1, 0, 1,
-0.5886943, 1.226737, -0.2688021, 0.1686275, 1, 0, 1,
-0.5874815, 0.5933238, -0.9609115, 0.1647059, 1, 0, 1,
-0.5824206, 0.7632551, -0.2580546, 0.1568628, 1, 0, 1,
-0.5747378, 1.259132, 1.21751, 0.1529412, 1, 0, 1,
-0.573567, -0.3477868, -1.806248, 0.145098, 1, 0, 1,
-0.5719365, -2.098223, -3.337736, 0.1411765, 1, 0, 1,
-0.5699402, 0.5703527, -0.1769807, 0.1333333, 1, 0, 1,
-0.5689272, 0.1635136, 0.3861142, 0.1294118, 1, 0, 1,
-0.5664387, -0.2376402, -2.284259, 0.1215686, 1, 0, 1,
-0.5591451, -0.2560569, -3.142782, 0.1176471, 1, 0, 1,
-0.5587539, -0.6178367, -2.887882, 0.1098039, 1, 0, 1,
-0.5581802, 1.753983, -0.4571417, 0.1058824, 1, 0, 1,
-0.556201, -0.9939179, -2.923147, 0.09803922, 1, 0, 1,
-0.5560716, 0.3092379, -1.513014, 0.09019608, 1, 0, 1,
-0.5560543, 1.014531, -0.07395669, 0.08627451, 1, 0, 1,
-0.55599, 0.1520708, -0.4046788, 0.07843138, 1, 0, 1,
-0.5537122, 0.5506544, -2.440543, 0.07450981, 1, 0, 1,
-0.5512044, 1.04433, -1.985158, 0.06666667, 1, 0, 1,
-0.5499321, 0.6363117, -0.1529192, 0.0627451, 1, 0, 1,
-0.5480416, 1.024508, -1.210692, 0.05490196, 1, 0, 1,
-0.5462868, 0.3752999, -0.1056409, 0.05098039, 1, 0, 1,
-0.5460818, 1.126879, 1.524193, 0.04313726, 1, 0, 1,
-0.5410016, 1.547679, 0.9619828, 0.03921569, 1, 0, 1,
-0.5409946, 2.362973, 1.131106, 0.03137255, 1, 0, 1,
-0.5361984, 1.796446, -0.2498661, 0.02745098, 1, 0, 1,
-0.5291994, -0.1605619, -1.785345, 0.01960784, 1, 0, 1,
-0.5274249, -1.717341, -1.986171, 0.01568628, 1, 0, 1,
-0.527176, -0.2051859, -2.124307, 0.007843138, 1, 0, 1,
-0.5152317, 0.1948245, -0.4205478, 0.003921569, 1, 0, 1,
-0.5083758, 1.102737, -0.5728556, 0, 1, 0.003921569, 1,
-0.5044554, -0.05321674, -1.355517, 0, 1, 0.01176471, 1,
-0.50392, 0.5446903, -0.8144877, 0, 1, 0.01568628, 1,
-0.5038291, 0.9690782, -1.267469, 0, 1, 0.02352941, 1,
-0.5020952, 1.563913, -0.131478, 0, 1, 0.02745098, 1,
-0.5003625, 1.247301, -0.702266, 0, 1, 0.03529412, 1,
-0.4922386, 0.1337566, -0.7242262, 0, 1, 0.03921569, 1,
-0.4893934, -0.6810233, -2.389771, 0, 1, 0.04705882, 1,
-0.4865844, 0.04893135, -0.3199555, 0, 1, 0.05098039, 1,
-0.4829359, 1.004129, -1.266134, 0, 1, 0.05882353, 1,
-0.4815194, 2.278648, -1.819309, 0, 1, 0.0627451, 1,
-0.4771843, -0.6488431, -2.08103, 0, 1, 0.07058824, 1,
-0.4768892, -1.414878, -2.858337, 0, 1, 0.07450981, 1,
-0.4712836, 0.1401632, -1.19839, 0, 1, 0.08235294, 1,
-0.4658283, -0.2435178, -1.245555, 0, 1, 0.08627451, 1,
-0.4638137, 1.295831, -0.5583929, 0, 1, 0.09411765, 1,
-0.457538, 0.1923607, -1.498414, 0, 1, 0.1019608, 1,
-0.4568556, -0.8164561, -3.459718, 0, 1, 0.1058824, 1,
-0.4542347, -0.3043068, -0.6879439, 0, 1, 0.1137255, 1,
-0.4533795, 0.3812438, -0.1882177, 0, 1, 0.1176471, 1,
-0.4520571, 0.4233519, -1.646066, 0, 1, 0.1254902, 1,
-0.4497981, -0.1679614, -0.7646666, 0, 1, 0.1294118, 1,
-0.4481886, 2.319609, 0.3811025, 0, 1, 0.1372549, 1,
-0.4446943, 1.112575, -0.1386127, 0, 1, 0.1411765, 1,
-0.4430526, -0.03328287, -0.006834251, 0, 1, 0.1490196, 1,
-0.4406202, 0.4170859, -1.553576, 0, 1, 0.1529412, 1,
-0.4397441, 0.4887022, -2.11656, 0, 1, 0.1607843, 1,
-0.4373334, -1.719848, -3.396056, 0, 1, 0.1647059, 1,
-0.4369062, 0.08362705, -1.419092, 0, 1, 0.172549, 1,
-0.4358749, 0.5245312, -1.110518, 0, 1, 0.1764706, 1,
-0.435797, 0.5628062, 0.6236608, 0, 1, 0.1843137, 1,
-0.4352988, 0.2871924, -0.2554638, 0, 1, 0.1882353, 1,
-0.4330948, -1.108755, -2.812364, 0, 1, 0.1960784, 1,
-0.4327505, -0.04039457, -0.0382685, 0, 1, 0.2039216, 1,
-0.4316878, 0.2089329, -0.8233425, 0, 1, 0.2078431, 1,
-0.4295426, -0.9297639, -3.054999, 0, 1, 0.2156863, 1,
-0.4270312, -0.6169811, -2.684139, 0, 1, 0.2196078, 1,
-0.4246572, -0.8292391, -3.232703, 0, 1, 0.227451, 1,
-0.4210776, -1.995194, -2.84443, 0, 1, 0.2313726, 1,
-0.4201632, -0.07481728, -1.528861, 0, 1, 0.2392157, 1,
-0.4132481, 0.9560758, -1.291799, 0, 1, 0.2431373, 1,
-0.412581, 0.7346155, -1.695965, 0, 1, 0.2509804, 1,
-0.411781, -1.315968, -2.684779, 0, 1, 0.254902, 1,
-0.4067302, -0.2833354, 0.387842, 0, 1, 0.2627451, 1,
-0.4065039, 0.5895729, -0.2725521, 0, 1, 0.2666667, 1,
-0.4057777, 0.05579145, -1.162457, 0, 1, 0.2745098, 1,
-0.4023973, -0.6426561, -1.532987, 0, 1, 0.2784314, 1,
-0.4021927, -0.9296622, -3.288747, 0, 1, 0.2862745, 1,
-0.400033, 0.6743073, 0.5842006, 0, 1, 0.2901961, 1,
-0.3961744, 0.5914465, 0.02557874, 0, 1, 0.2980392, 1,
-0.3960526, 0.2941845, -2.544262, 0, 1, 0.3058824, 1,
-0.3930732, -0.2898767, -0.3972121, 0, 1, 0.3098039, 1,
-0.3915983, 0.579468, -1.450859, 0, 1, 0.3176471, 1,
-0.3888693, 0.06574653, 0.4556143, 0, 1, 0.3215686, 1,
-0.381341, 0.2697076, -0.02415464, 0, 1, 0.3294118, 1,
-0.3808383, -0.4845866, -1.648422, 0, 1, 0.3333333, 1,
-0.3804168, -0.7376507, -2.681217, 0, 1, 0.3411765, 1,
-0.378256, -1.497725, -1.285306, 0, 1, 0.345098, 1,
-0.3756683, 1.474047, -0.4064375, 0, 1, 0.3529412, 1,
-0.3700474, 0.6510614, -1.738914, 0, 1, 0.3568628, 1,
-0.3665144, -0.7530416, -2.272565, 0, 1, 0.3647059, 1,
-0.3600326, -0.4677515, -2.483237, 0, 1, 0.3686275, 1,
-0.3545285, 0.1349735, 0.8703644, 0, 1, 0.3764706, 1,
-0.3528136, -0.08484157, 0.7350774, 0, 1, 0.3803922, 1,
-0.3514337, -1.796334, -2.242077, 0, 1, 0.3882353, 1,
-0.3476849, 0.749592, 0.2949293, 0, 1, 0.3921569, 1,
-0.3474696, 1.785156, -0.6291599, 0, 1, 0.4, 1,
-0.3467516, -1.620623, -1.386212, 0, 1, 0.4078431, 1,
-0.3423721, 1.0243, 1.158525, 0, 1, 0.4117647, 1,
-0.3376765, 0.6215585, -0.6867984, 0, 1, 0.4196078, 1,
-0.3311321, 0.1897905, -1.58445, 0, 1, 0.4235294, 1,
-0.3221447, -0.4415029, -2.576579, 0, 1, 0.4313726, 1,
-0.3136011, -0.2634606, -1.205213, 0, 1, 0.4352941, 1,
-0.313286, 1.617633, -1.215543, 0, 1, 0.4431373, 1,
-0.3125469, -0.2116189, -0.2814582, 0, 1, 0.4470588, 1,
-0.3106515, 3.063846, -0.4507219, 0, 1, 0.454902, 1,
-0.3083405, -0.6915098, -3.750793, 0, 1, 0.4588235, 1,
-0.3081896, -0.4018566, -1.815692, 0, 1, 0.4666667, 1,
-0.3072871, -0.2424529, -0.3267332, 0, 1, 0.4705882, 1,
-0.3056915, -0.5193528, -0.5329617, 0, 1, 0.4784314, 1,
-0.3045425, -0.9045346, -2.427605, 0, 1, 0.4823529, 1,
-0.3027609, -0.1903947, -1.905731, 0, 1, 0.4901961, 1,
-0.3000576, 0.4362308, -1.917825, 0, 1, 0.4941176, 1,
-0.2996918, 1.215167, -1.629923, 0, 1, 0.5019608, 1,
-0.2826246, 1.073659, -0.9054688, 0, 1, 0.509804, 1,
-0.2770306, 1.07063, 0.4301566, 0, 1, 0.5137255, 1,
-0.2763303, -0.5110975, -2.303497, 0, 1, 0.5215687, 1,
-0.2746382, -0.5307941, -1.847034, 0, 1, 0.5254902, 1,
-0.2710589, -1.608774, -1.422368, 0, 1, 0.5333334, 1,
-0.2708731, -0.352214, -1.968594, 0, 1, 0.5372549, 1,
-0.2687249, -1.728708, -2.453921, 0, 1, 0.5450981, 1,
-0.2613159, -0.1108238, -3.277623, 0, 1, 0.5490196, 1,
-0.2612917, 0.540089, 0.8234084, 0, 1, 0.5568628, 1,
-0.2610653, 0.9518967, -1.111102, 0, 1, 0.5607843, 1,
-0.2502937, -0.07041132, -2.089982, 0, 1, 0.5686275, 1,
-0.2450863, -2.227452, -5.06967, 0, 1, 0.572549, 1,
-0.2442243, -0.4825787, -3.169391, 0, 1, 0.5803922, 1,
-0.2415291, 0.4080272, 0.2451844, 0, 1, 0.5843138, 1,
-0.2414917, -0.1552114, -2.472422, 0, 1, 0.5921569, 1,
-0.2396519, -0.08363198, -3.197184, 0, 1, 0.5960785, 1,
-0.2379769, 0.9707471, -1.495528, 0, 1, 0.6039216, 1,
-0.2378188, 0.2125146, 0.635848, 0, 1, 0.6117647, 1,
-0.2353225, -0.9743013, -4.190857, 0, 1, 0.6156863, 1,
-0.2316375, 0.9067699, 0.34648, 0, 1, 0.6235294, 1,
-0.2290812, -0.7971943, -2.959916, 0, 1, 0.627451, 1,
-0.2260622, -0.7700173, -4.090805, 0, 1, 0.6352941, 1,
-0.2230596, 0.7665046, 1.280737, 0, 1, 0.6392157, 1,
-0.2215011, -1.610309, -2.12442, 0, 1, 0.6470588, 1,
-0.2207731, -1.428275, -4.339315, 0, 1, 0.6509804, 1,
-0.2153854, -1.343173, -2.531534, 0, 1, 0.6588235, 1,
-0.2130868, 1.862116, -1.615978, 0, 1, 0.6627451, 1,
-0.2075826, -0.2492931, -2.379205, 0, 1, 0.6705883, 1,
-0.2048214, 0.5843266, 0.8210593, 0, 1, 0.6745098, 1,
-0.2038058, -2.250918, -0.9866744, 0, 1, 0.682353, 1,
-0.1986845, 0.2272124, -0.6952564, 0, 1, 0.6862745, 1,
-0.1958232, -0.1107597, -3.715424, 0, 1, 0.6941177, 1,
-0.1846565, 0.03007773, -4.409348, 0, 1, 0.7019608, 1,
-0.1836413, -0.547415, -2.420156, 0, 1, 0.7058824, 1,
-0.1793176, 0.6698088, 0.04116539, 0, 1, 0.7137255, 1,
-0.1778953, -0.8217562, -3.124097, 0, 1, 0.7176471, 1,
-0.1745689, 0.805093, 0.4144229, 0, 1, 0.7254902, 1,
-0.1727001, 0.276015, -0.8610157, 0, 1, 0.7294118, 1,
-0.1684196, 0.94682, -0.08814822, 0, 1, 0.7372549, 1,
-0.1639034, 0.6106417, -0.5644065, 0, 1, 0.7411765, 1,
-0.1634914, 1.519867, -1.270432, 0, 1, 0.7490196, 1,
-0.1604645, -1.033466, -3.648113, 0, 1, 0.7529412, 1,
-0.1552815, 0.1106309, -1.779945, 0, 1, 0.7607843, 1,
-0.1535627, 0.583426, 0.2361052, 0, 1, 0.7647059, 1,
-0.1470178, 0.6286739, 0.3701025, 0, 1, 0.772549, 1,
-0.1446145, 0.8047851, -0.2654231, 0, 1, 0.7764706, 1,
-0.1445976, -0.8735085, -1.253935, 0, 1, 0.7843137, 1,
-0.1401985, 1.080303, -0.2308438, 0, 1, 0.7882353, 1,
-0.1329093, 0.002699761, -1.754194, 0, 1, 0.7960784, 1,
-0.13284, -1.233028, -2.492183, 0, 1, 0.8039216, 1,
-0.1309869, 0.08757151, -1.734852, 0, 1, 0.8078431, 1,
-0.1299703, -0.8259642, -2.877985, 0, 1, 0.8156863, 1,
-0.1281847, 0.2552208, -1.891293, 0, 1, 0.8196079, 1,
-0.1226486, -0.4866067, -3.374116, 0, 1, 0.827451, 1,
-0.1218707, 0.3278348, 0.7962499, 0, 1, 0.8313726, 1,
-0.1205554, -0.1247868, -3.790391, 0, 1, 0.8392157, 1,
-0.1189256, 1.914978, -0.5492874, 0, 1, 0.8431373, 1,
-0.1105657, -0.8212769, -3.081387, 0, 1, 0.8509804, 1,
-0.109529, -0.4061614, -2.827947, 0, 1, 0.854902, 1,
-0.1048138, -0.1707423, -2.322963, 0, 1, 0.8627451, 1,
-0.1038157, 0.06612013, -2.074691, 0, 1, 0.8666667, 1,
-0.1025515, 0.5501213, -0.3286638, 0, 1, 0.8745098, 1,
-0.09571479, -1.789074, -3.351757, 0, 1, 0.8784314, 1,
-0.07773265, 1.313311, -0.465536, 0, 1, 0.8862745, 1,
-0.07730888, -1.613262, -3.962199, 0, 1, 0.8901961, 1,
-0.07285687, -0.3178332, -3.298105, 0, 1, 0.8980392, 1,
-0.07235056, -0.7154455, -3.154546, 0, 1, 0.9058824, 1,
-0.06890486, -0.1904545, -2.592269, 0, 1, 0.9098039, 1,
-0.06488825, -0.6398376, -2.371902, 0, 1, 0.9176471, 1,
-0.06223608, 0.05482788, -1.545223, 0, 1, 0.9215686, 1,
-0.06141112, 1.147195, 0.7418835, 0, 1, 0.9294118, 1,
-0.06100319, 0.3033409, -0.1433089, 0, 1, 0.9333333, 1,
-0.05817305, -0.6099178, -1.159191, 0, 1, 0.9411765, 1,
-0.05135199, 1.054219, 0.463, 0, 1, 0.945098, 1,
-0.04985206, 0.9596342, -0.2651988, 0, 1, 0.9529412, 1,
-0.04889982, 1.137574, 0.7002689, 0, 1, 0.9568627, 1,
-0.04363702, 0.7376278, 0.4105473, 0, 1, 0.9647059, 1,
-0.04227592, -1.556031, -5.402312, 0, 1, 0.9686275, 1,
-0.038669, 0.3974619, 1.334753, 0, 1, 0.9764706, 1,
-0.03833704, 0.3763427, 0.2483439, 0, 1, 0.9803922, 1,
-0.03673858, 0.4785959, -0.8826335, 0, 1, 0.9882353, 1,
-0.03090255, -0.07433602, -3.094116, 0, 1, 0.9921569, 1,
-0.02684475, 0.9039642, 0.3716279, 0, 1, 1, 1,
-0.02317412, -2.050141, -3.543845, 0, 0.9921569, 1, 1,
-0.02298265, 1.3973, -0.8036343, 0, 0.9882353, 1, 1,
-0.0194215, 1.266907, 0.7404423, 0, 0.9803922, 1, 1,
-0.01595549, -0.3774781, -1.95359, 0, 0.9764706, 1, 1,
-0.01487264, -0.5860273, -2.954275, 0, 0.9686275, 1, 1,
-0.01410111, -0.9452278, -2.215858, 0, 0.9647059, 1, 1,
-0.01335437, -0.2052596, -2.050964, 0, 0.9568627, 1, 1,
-0.01063115, -0.3402539, -1.545584, 0, 0.9529412, 1, 1,
-0.01045653, 0.3832487, -0.111922, 0, 0.945098, 1, 1,
-0.009944855, 1.405458, -1.061608, 0, 0.9411765, 1, 1,
-0.006743787, -0.2352523, -3.251905, 0, 0.9333333, 1, 1,
-0.004506901, -1.363416, -2.809452, 0, 0.9294118, 1, 1,
-0.003165331, -0.6083906, -3.309355, 0, 0.9215686, 1, 1,
-0.002615001, 1.357715, -0.01906891, 0, 0.9176471, 1, 1,
-0.001250433, -0.2919805, -5.375773, 0, 0.9098039, 1, 1,
-0.001171597, -1.186903, -4.442124, 0, 0.9058824, 1, 1,
0.0004753951, 0.2413283, 0.4634652, 0, 0.8980392, 1, 1,
0.00147592, -0.66216, 3.645717, 0, 0.8901961, 1, 1,
0.003391155, -0.627347, 3.474117, 0, 0.8862745, 1, 1,
0.01874632, 0.2610212, -0.8652706, 0, 0.8784314, 1, 1,
0.02127301, 1.505613, -1.513486, 0, 0.8745098, 1, 1,
0.02268815, -0.3008787, 3.313885, 0, 0.8666667, 1, 1,
0.02270992, -0.2280812, 3.882753, 0, 0.8627451, 1, 1,
0.02538461, -0.8995987, 3.641123, 0, 0.854902, 1, 1,
0.03376458, -2.009698, 4.314716, 0, 0.8509804, 1, 1,
0.03619608, 0.4442839, 0.6673704, 0, 0.8431373, 1, 1,
0.05774801, 0.2431574, 0.1686414, 0, 0.8392157, 1, 1,
0.05842415, -1.266226, 3.890319, 0, 0.8313726, 1, 1,
0.05924133, -0.06472519, 1.92114, 0, 0.827451, 1, 1,
0.0672025, -0.9656868, 1.89931, 0, 0.8196079, 1, 1,
0.07109386, -0.4430955, 2.502032, 0, 0.8156863, 1, 1,
0.07332654, 1.318843, 0.3804435, 0, 0.8078431, 1, 1,
0.07399659, -0.8630005, 2.064063, 0, 0.8039216, 1, 1,
0.07731497, 0.300928, 1.362857, 0, 0.7960784, 1, 1,
0.08149559, -0.8782064, 3.547397, 0, 0.7882353, 1, 1,
0.08364545, 0.680486, 0.6295782, 0, 0.7843137, 1, 1,
0.08404077, 0.6072683, 0.2292105, 0, 0.7764706, 1, 1,
0.08839571, 0.04567981, 0.7161185, 0, 0.772549, 1, 1,
0.09027576, -0.0922285, 3.28472, 0, 0.7647059, 1, 1,
0.09074943, -0.684365, 4.36024, 0, 0.7607843, 1, 1,
0.09086759, 0.5171622, -2.048619, 0, 0.7529412, 1, 1,
0.09128258, 0.07835693, 2.468911, 0, 0.7490196, 1, 1,
0.09177413, 2.251863, -0.8560228, 0, 0.7411765, 1, 1,
0.1000263, -1.594039, 4.715445, 0, 0.7372549, 1, 1,
0.1022743, -0.2000427, 1.618846, 0, 0.7294118, 1, 1,
0.1034041, -0.8680379, 2.689573, 0, 0.7254902, 1, 1,
0.1060115, 2.52046, 0.1986278, 0, 0.7176471, 1, 1,
0.1071544, -0.7389164, 1.278014, 0, 0.7137255, 1, 1,
0.1072507, -1.019603, 3.638639, 0, 0.7058824, 1, 1,
0.1073342, 1.585325, 0.1722444, 0, 0.6980392, 1, 1,
0.1077655, 0.0007558757, 1.472244, 0, 0.6941177, 1, 1,
0.1098495, 1.099607, -1.515223, 0, 0.6862745, 1, 1,
0.1106297, 2.142012, 0.0532658, 0, 0.682353, 1, 1,
0.1157601, 2.20267, 0.7865301, 0, 0.6745098, 1, 1,
0.1198097, 0.260827, -0.1510021, 0, 0.6705883, 1, 1,
0.1217854, 0.4551605, 1.23151, 0, 0.6627451, 1, 1,
0.1300052, -0.09710421, 2.704543, 0, 0.6588235, 1, 1,
0.1320156, -0.07747, 2.093285, 0, 0.6509804, 1, 1,
0.1344875, 1.20476, 1.023193, 0, 0.6470588, 1, 1,
0.1366781, 1.005454, -1.469089, 0, 0.6392157, 1, 1,
0.1381451, 1.115173, 1.365689, 0, 0.6352941, 1, 1,
0.1382452, 0.6105345, 0.3108573, 0, 0.627451, 1, 1,
0.1393674, -0.5142017, 3.556103, 0, 0.6235294, 1, 1,
0.1395249, -0.2896002, 1.750614, 0, 0.6156863, 1, 1,
0.1407177, -0.04363742, 4.465833, 0, 0.6117647, 1, 1,
0.1441536, 0.0363011, 1.69706, 0, 0.6039216, 1, 1,
0.148899, 1.871681, -1.659546, 0, 0.5960785, 1, 1,
0.1506715, -0.3830226, 2.132139, 0, 0.5921569, 1, 1,
0.1508281, -1.077421, 3.047233, 0, 0.5843138, 1, 1,
0.1533234, -0.8605898, 2.652243, 0, 0.5803922, 1, 1,
0.153435, -1.300768, 2.223109, 0, 0.572549, 1, 1,
0.1587146, 1.974232, 0.09134185, 0, 0.5686275, 1, 1,
0.1590096, 0.6223384, -0.09493762, 0, 0.5607843, 1, 1,
0.1644433, -0.6156703, 2.542345, 0, 0.5568628, 1, 1,
0.1644471, -0.7408309, 2.265301, 0, 0.5490196, 1, 1,
0.1668179, 0.4383341, 0.3590173, 0, 0.5450981, 1, 1,
0.171064, 1.521191, 2.004951, 0, 0.5372549, 1, 1,
0.1719949, 0.7710483, -0.9442754, 0, 0.5333334, 1, 1,
0.175273, -2.688233, 4.235719, 0, 0.5254902, 1, 1,
0.1763731, -0.3488204, 3.681276, 0, 0.5215687, 1, 1,
0.1804941, 0.5841477, 0.3955842, 0, 0.5137255, 1, 1,
0.1810244, 0.5409074, -0.1311356, 0, 0.509804, 1, 1,
0.1812078, -1.571022, 1.627521, 0, 0.5019608, 1, 1,
0.1830784, 1.223674, 0.2894383, 0, 0.4941176, 1, 1,
0.1842276, -0.002847262, 1.296534, 0, 0.4901961, 1, 1,
0.1856043, -0.3705711, 2.371141, 0, 0.4823529, 1, 1,
0.1884239, -0.5884872, 1.540973, 0, 0.4784314, 1, 1,
0.1886186, -0.6384153, 1.793554, 0, 0.4705882, 1, 1,
0.1889953, 0.02851152, 1.722895, 0, 0.4666667, 1, 1,
0.1911179, 0.5525734, 2.017926, 0, 0.4588235, 1, 1,
0.1922535, 1.050868, -0.4716127, 0, 0.454902, 1, 1,
0.1928205, 0.9864044, -1.036943, 0, 0.4470588, 1, 1,
0.1938757, 0.4082045, 1.230365, 0, 0.4431373, 1, 1,
0.194851, -1.415778, 2.170415, 0, 0.4352941, 1, 1,
0.2014623, -0.1959222, 2.793678, 0, 0.4313726, 1, 1,
0.2037328, -1.715264, 4.304291, 0, 0.4235294, 1, 1,
0.2064925, 0.06125808, 0.9105088, 0, 0.4196078, 1, 1,
0.2092672, -0.811249, 3.426266, 0, 0.4117647, 1, 1,
0.2125287, 0.736793, 0.1642922, 0, 0.4078431, 1, 1,
0.2165049, -0.230309, 1.359371, 0, 0.4, 1, 1,
0.2193389, -0.08439243, 2.110036, 0, 0.3921569, 1, 1,
0.2203166, -0.6977288, 2.487348, 0, 0.3882353, 1, 1,
0.2246087, 0.101689, 0.4325114, 0, 0.3803922, 1, 1,
0.2252108, -1.383591, 3.844853, 0, 0.3764706, 1, 1,
0.2292788, 0.03887915, -0.2599658, 0, 0.3686275, 1, 1,
0.2334738, 0.01646571, 2.278024, 0, 0.3647059, 1, 1,
0.2351246, -0.7617208, 4.495719, 0, 0.3568628, 1, 1,
0.2378329, 0.7212191, -1.356536, 0, 0.3529412, 1, 1,
0.2446517, 0.8949239, 0.7038314, 0, 0.345098, 1, 1,
0.2474412, 0.7235532, -0.2724923, 0, 0.3411765, 1, 1,
0.2507417, 0.1288424, 0.4846357, 0, 0.3333333, 1, 1,
0.2545259, -1.664448, 3.180425, 0, 0.3294118, 1, 1,
0.2574728, 0.4499901, -0.2507846, 0, 0.3215686, 1, 1,
0.2597563, 0.3867708, 1.288872, 0, 0.3176471, 1, 1,
0.2750379, -0.0388632, 1.786309, 0, 0.3098039, 1, 1,
0.2764475, 0.5901449, 1.121891, 0, 0.3058824, 1, 1,
0.2774767, 0.5395455, -1.051888, 0, 0.2980392, 1, 1,
0.277794, -0.696743, 2.658109, 0, 0.2901961, 1, 1,
0.28042, -0.06598984, 0.4933276, 0, 0.2862745, 1, 1,
0.2842003, -0.8381117, 2.48555, 0, 0.2784314, 1, 1,
0.28941, -1.487332, 2.678868, 0, 0.2745098, 1, 1,
0.2937036, -1.133231, 4.235718, 0, 0.2666667, 1, 1,
0.2955118, -1.671228, 2.130329, 0, 0.2627451, 1, 1,
0.2979365, -1.469752, 2.132804, 0, 0.254902, 1, 1,
0.3054236, -2.208316, 4.659708, 0, 0.2509804, 1, 1,
0.3058916, 0.8685884, 0.1749508, 0, 0.2431373, 1, 1,
0.3087663, 1.745828, 1.246499, 0, 0.2392157, 1, 1,
0.3090685, -1.332582, 2.433534, 0, 0.2313726, 1, 1,
0.3182844, 2.469417, 1.582668, 0, 0.227451, 1, 1,
0.3256384, 0.239154, 0.326487, 0, 0.2196078, 1, 1,
0.3257282, 0.6402974, 0.5864235, 0, 0.2156863, 1, 1,
0.3303719, 1.145026, 0.4790238, 0, 0.2078431, 1, 1,
0.3316754, -0.3093394, 2.003035, 0, 0.2039216, 1, 1,
0.3322823, 0.2491733, 0.8107406, 0, 0.1960784, 1, 1,
0.3338373, -0.6283995, 3.870024, 0, 0.1882353, 1, 1,
0.3342541, 0.7671332, 0.7502564, 0, 0.1843137, 1, 1,
0.3345278, 2.649584, 0.2352974, 0, 0.1764706, 1, 1,
0.3357112, -1.366894, 3.761408, 0, 0.172549, 1, 1,
0.3408889, -0.3357065, 3.85361, 0, 0.1647059, 1, 1,
0.342557, -0.1967554, 3.030146, 0, 0.1607843, 1, 1,
0.3428543, 0.8949433, 0.9691989, 0, 0.1529412, 1, 1,
0.3442454, 0.2008321, 0.8843452, 0, 0.1490196, 1, 1,
0.3447697, 0.07464181, 1.231462, 0, 0.1411765, 1, 1,
0.3458368, 0.5219666, 1.21834, 0, 0.1372549, 1, 1,
0.3527288, 1.565097, -1.036294, 0, 0.1294118, 1, 1,
0.352829, 1.581692, -0.2180583, 0, 0.1254902, 1, 1,
0.3534751, -0.6132115, 2.117205, 0, 0.1176471, 1, 1,
0.3562632, 1.088814, -1.07847, 0, 0.1137255, 1, 1,
0.3603951, 0.4224935, 1.118033, 0, 0.1058824, 1, 1,
0.3712438, 0.7611033, 0.5361826, 0, 0.09803922, 1, 1,
0.3713172, -0.1876286, 2.467266, 0, 0.09411765, 1, 1,
0.3715646, -0.05392717, 2.504955, 0, 0.08627451, 1, 1,
0.3737539, -2.848711, 2.778804, 0, 0.08235294, 1, 1,
0.3837532, 3.379714, -1.609921, 0, 0.07450981, 1, 1,
0.3839558, -0.04655124, 1.770544, 0, 0.07058824, 1, 1,
0.3873833, 2.300616, -1.042299, 0, 0.0627451, 1, 1,
0.38967, -1.445526, 3.459224, 0, 0.05882353, 1, 1,
0.397662, 0.04965318, -1.00246, 0, 0.05098039, 1, 1,
0.3987154, 1.341322, -0.460355, 0, 0.04705882, 1, 1,
0.4015421, -0.4285419, 1.101043, 0, 0.03921569, 1, 1,
0.4029127, -0.9355496, 1.885701, 0, 0.03529412, 1, 1,
0.4046803, 0.3348744, -0.2672391, 0, 0.02745098, 1, 1,
0.4069116, 0.2052159, 0.7990395, 0, 0.02352941, 1, 1,
0.4071651, 1.185237, -0.8717976, 0, 0.01568628, 1, 1,
0.4107247, -1.339786, 3.79528, 0, 0.01176471, 1, 1,
0.4111342, -0.08765952, 0.598096, 0, 0.003921569, 1, 1,
0.4111737, 1.165624, -0.6232975, 0.003921569, 0, 1, 1,
0.4163143, -0.4824014, 3.310924, 0.007843138, 0, 1, 1,
0.416336, -0.153732, 2.309032, 0.01568628, 0, 1, 1,
0.4212625, -0.9733101, 4.576063, 0.01960784, 0, 1, 1,
0.4214195, 0.2219781, 1.014422, 0.02745098, 0, 1, 1,
0.4233134, -0.6665811, 3.642876, 0.03137255, 0, 1, 1,
0.4233144, 0.6677722, 0.1322418, 0.03921569, 0, 1, 1,
0.4241271, 1.783957, 2.939204, 0.04313726, 0, 1, 1,
0.4318344, 1.878119, -0.04311641, 0.05098039, 0, 1, 1,
0.4320491, -0.4819111, 2.26423, 0.05490196, 0, 1, 1,
0.4368496, 1.230478, 1.190727, 0.0627451, 0, 1, 1,
0.4370966, -1.633774, 2.797412, 0.06666667, 0, 1, 1,
0.4390374, 0.1577325, 2.668173, 0.07450981, 0, 1, 1,
0.440812, 0.1113529, 2.362411, 0.07843138, 0, 1, 1,
0.4473237, -0.5976934, 2.738589, 0.08627451, 0, 1, 1,
0.4514849, 0.07286338, 0.3343342, 0.09019608, 0, 1, 1,
0.4583645, -0.6871604, 1.242657, 0.09803922, 0, 1, 1,
0.4625346, 0.09417702, 1.056191, 0.1058824, 0, 1, 1,
0.4638697, 0.6796444, 2.24781, 0.1098039, 0, 1, 1,
0.4671032, -0.4137746, 4.331519, 0.1176471, 0, 1, 1,
0.4675385, 0.2809027, 0.02867048, 0.1215686, 0, 1, 1,
0.4687191, 0.6878186, 0.9380883, 0.1294118, 0, 1, 1,
0.470393, -0.6060415, 2.097035, 0.1333333, 0, 1, 1,
0.4754681, -0.130534, 1.50962, 0.1411765, 0, 1, 1,
0.4799772, -0.5746953, 2.335875, 0.145098, 0, 1, 1,
0.4821295, -0.2514797, 1.9233, 0.1529412, 0, 1, 1,
0.4863405, 0.2051503, 3.330611, 0.1568628, 0, 1, 1,
0.4883211, 0.089778, 2.559634, 0.1647059, 0, 1, 1,
0.4932103, -1.428615, 1.178471, 0.1686275, 0, 1, 1,
0.4953884, 0.5222988, 0.8881263, 0.1764706, 0, 1, 1,
0.5024019, 1.424993, 0.3574615, 0.1803922, 0, 1, 1,
0.5092605, 1.090331, 1.697569, 0.1882353, 0, 1, 1,
0.5094393, 1.224649, 0.1298528, 0.1921569, 0, 1, 1,
0.5135465, -0.3492013, 1.160706, 0.2, 0, 1, 1,
0.5242965, -0.5059047, 0.3222693, 0.2078431, 0, 1, 1,
0.5322402, -0.1958511, 1.405142, 0.2117647, 0, 1, 1,
0.5326012, 0.09463208, 1.514293, 0.2196078, 0, 1, 1,
0.5340456, -2.015693, 1.652188, 0.2235294, 0, 1, 1,
0.534502, -0.9423673, 0.4266545, 0.2313726, 0, 1, 1,
0.5382584, -0.9828534, 2.775477, 0.2352941, 0, 1, 1,
0.5382686, -1.172671, 2.803328, 0.2431373, 0, 1, 1,
0.5408056, 0.8825532, -0.5492344, 0.2470588, 0, 1, 1,
0.5452621, -0.3439248, 2.986454, 0.254902, 0, 1, 1,
0.5478352, 0.1076096, 1.21034, 0.2588235, 0, 1, 1,
0.552705, 0.9538317, -1.419059, 0.2666667, 0, 1, 1,
0.5571495, -0.4497457, 2.842394, 0.2705882, 0, 1, 1,
0.5596009, -0.5390404, 1.418947, 0.2784314, 0, 1, 1,
0.56029, 0.9842542, 0.3260196, 0.282353, 0, 1, 1,
0.5683863, 1.294484, 0.6860856, 0.2901961, 0, 1, 1,
0.5688156, 0.2475083, 1.035831, 0.2941177, 0, 1, 1,
0.5699232, -0.514632, 3.176599, 0.3019608, 0, 1, 1,
0.5702742, 0.4767458, 1.398086, 0.3098039, 0, 1, 1,
0.5736761, -0.0001699423, 2.069006, 0.3137255, 0, 1, 1,
0.582905, 1.340756, -0.1950891, 0.3215686, 0, 1, 1,
0.5935102, -1.543622, 2.897699, 0.3254902, 0, 1, 1,
0.595385, -0.1357506, 0.7830973, 0.3333333, 0, 1, 1,
0.5984119, -0.8380267, 2.69526, 0.3372549, 0, 1, 1,
0.6005423, 0.7827283, 0.6401328, 0.345098, 0, 1, 1,
0.6013945, -0.2123869, 1.267972, 0.3490196, 0, 1, 1,
0.6022544, -0.1759327, 3.134926, 0.3568628, 0, 1, 1,
0.6068491, 0.9257032, 1.045066, 0.3607843, 0, 1, 1,
0.6120107, -1.22054, 4.819411, 0.3686275, 0, 1, 1,
0.6125873, -0.161045, 2.635791, 0.372549, 0, 1, 1,
0.6137948, 1.891322, -1.123085, 0.3803922, 0, 1, 1,
0.6140742, 0.4710178, 2.371792, 0.3843137, 0, 1, 1,
0.6202864, 0.2696345, 1.098915, 0.3921569, 0, 1, 1,
0.6261848, -1.143022, 4.70613, 0.3960784, 0, 1, 1,
0.6262323, 0.1113279, 0.9308515, 0.4039216, 0, 1, 1,
0.6285926, 1.21641, 0.5440117, 0.4117647, 0, 1, 1,
0.631368, -0.1315779, 3.323661, 0.4156863, 0, 1, 1,
0.6317902, 0.4949761, 0.9183453, 0.4235294, 0, 1, 1,
0.6356989, -0.6487899, 1.775339, 0.427451, 0, 1, 1,
0.6376795, 0.6700654, -0.01029641, 0.4352941, 0, 1, 1,
0.6428527, 1.137524, 0.656099, 0.4392157, 0, 1, 1,
0.6444198, 0.3639104, 2.113728, 0.4470588, 0, 1, 1,
0.6462994, -1.160815, 3.348746, 0.4509804, 0, 1, 1,
0.6487669, 0.222997, 1.104277, 0.4588235, 0, 1, 1,
0.6508679, 1.174811, -0.3723597, 0.4627451, 0, 1, 1,
0.6530015, -0.7537027, 1.097994, 0.4705882, 0, 1, 1,
0.6537718, 0.06881678, 0.5932919, 0.4745098, 0, 1, 1,
0.6567424, -0.148357, 1.475222, 0.4823529, 0, 1, 1,
0.6573687, 0.09178717, 1.356354, 0.4862745, 0, 1, 1,
0.6587302, -0.280545, 3.285023, 0.4941176, 0, 1, 1,
0.6598572, 2.008387, -0.5869229, 0.5019608, 0, 1, 1,
0.6629506, 1.535245, -0.2002105, 0.5058824, 0, 1, 1,
0.6646382, -1.201933, 2.621196, 0.5137255, 0, 1, 1,
0.6660005, -0.1905316, 0.5531332, 0.5176471, 0, 1, 1,
0.6671369, -1.743415, 2.749196, 0.5254902, 0, 1, 1,
0.6757835, -0.8253127, 2.813815, 0.5294118, 0, 1, 1,
0.6763033, -1.504211, 2.516848, 0.5372549, 0, 1, 1,
0.6784512, -0.5561017, 3.40608, 0.5411765, 0, 1, 1,
0.6825097, 1.17136, 0.3220609, 0.5490196, 0, 1, 1,
0.6845083, 0.6918602, 0.5458217, 0.5529412, 0, 1, 1,
0.6865348, -0.5939204, 1.118355, 0.5607843, 0, 1, 1,
0.6919283, 0.1256262, 1.449371, 0.5647059, 0, 1, 1,
0.6925335, -1.896963, 3.223771, 0.572549, 0, 1, 1,
0.6948309, 0.4941565, 0.9965924, 0.5764706, 0, 1, 1,
0.697211, 0.2134492, 2.697574, 0.5843138, 0, 1, 1,
0.6982777, -0.57886, 3.317573, 0.5882353, 0, 1, 1,
0.6988502, -0.03753947, 0.8635738, 0.5960785, 0, 1, 1,
0.7005965, 1.020065, 0.8912538, 0.6039216, 0, 1, 1,
0.7052075, -0.009847822, 1.09274, 0.6078432, 0, 1, 1,
0.7113268, -1.062341, 4.200659, 0.6156863, 0, 1, 1,
0.7163436, 0.8379769, 0.7802148, 0.6196079, 0, 1, 1,
0.7174819, 1.387564, 0.7610512, 0.627451, 0, 1, 1,
0.7225761, 0.09222078, 0.6768091, 0.6313726, 0, 1, 1,
0.7271867, -0.6805474, 2.80136, 0.6392157, 0, 1, 1,
0.7401305, -0.5450265, 3.389527, 0.6431373, 0, 1, 1,
0.7405971, -0.6868187, 1.870609, 0.6509804, 0, 1, 1,
0.7420518, 0.5616719, 0.7281957, 0.654902, 0, 1, 1,
0.7421611, 0.1095638, 2.453689, 0.6627451, 0, 1, 1,
0.744263, 2.264164, -1.949969, 0.6666667, 0, 1, 1,
0.7480349, 0.1032501, 0.5722681, 0.6745098, 0, 1, 1,
0.7611907, 0.9621703, -0.3227163, 0.6784314, 0, 1, 1,
0.7612936, 0.338749, 3.099268, 0.6862745, 0, 1, 1,
0.7627674, 0.5889998, -0.3962151, 0.6901961, 0, 1, 1,
0.765142, 0.7265286, -0.002518131, 0.6980392, 0, 1, 1,
0.7697864, -0.6234367, 1.526177, 0.7058824, 0, 1, 1,
0.7706851, 1.411846, -1.092996, 0.7098039, 0, 1, 1,
0.7766016, 1.203343, -0.3127326, 0.7176471, 0, 1, 1,
0.7788839, -0.8953304, 1.593924, 0.7215686, 0, 1, 1,
0.7801884, -1.598354, 3.938319, 0.7294118, 0, 1, 1,
0.7810047, -0.9626807, 2.312045, 0.7333333, 0, 1, 1,
0.7864034, -2.857194, 3.078852, 0.7411765, 0, 1, 1,
0.7968898, -0.905602, 2.35977, 0.7450981, 0, 1, 1,
0.7979215, -0.3278503, 0.9537985, 0.7529412, 0, 1, 1,
0.8006437, -0.563319, 3.08047, 0.7568628, 0, 1, 1,
0.8098605, -2.266293, 1.465563, 0.7647059, 0, 1, 1,
0.81298, 0.5299079, -2.138944, 0.7686275, 0, 1, 1,
0.8133589, -0.2595014, 1.761616, 0.7764706, 0, 1, 1,
0.8167315, -0.4544725, 3.335435, 0.7803922, 0, 1, 1,
0.8169535, 0.01655279, 1.620149, 0.7882353, 0, 1, 1,
0.8186866, -0.1349659, 0.7322178, 0.7921569, 0, 1, 1,
0.8314116, -0.672756, 3.610336, 0.8, 0, 1, 1,
0.836702, 1.192121, 1.021795, 0.8078431, 0, 1, 1,
0.8382125, 0.6402907, 0.8050343, 0.8117647, 0, 1, 1,
0.8392138, -0.4613747, 2.672182, 0.8196079, 0, 1, 1,
0.8404301, 0.2265216, 1.014369, 0.8235294, 0, 1, 1,
0.8422089, -1.427733, 0.6713845, 0.8313726, 0, 1, 1,
0.8477986, 0.681418, 1.428976, 0.8352941, 0, 1, 1,
0.8478562, -0.4142468, 2.819253, 0.8431373, 0, 1, 1,
0.8478653, 0.3333477, 0.8250204, 0.8470588, 0, 1, 1,
0.8561862, -0.4754341, 2.384203, 0.854902, 0, 1, 1,
0.8565126, 1.639181, 1.223582, 0.8588235, 0, 1, 1,
0.8582315, 1.588821, -0.4541106, 0.8666667, 0, 1, 1,
0.8631378, 0.9685036, -0.2015634, 0.8705882, 0, 1, 1,
0.8674148, 0.852771, 1.488382, 0.8784314, 0, 1, 1,
0.8676072, -0.5516204, 2.390672, 0.8823529, 0, 1, 1,
0.8698396, -0.6578871, 3.100127, 0.8901961, 0, 1, 1,
0.8723066, -0.3492266, 1.006721, 0.8941177, 0, 1, 1,
0.8785199, 1.148859, 1.10515, 0.9019608, 0, 1, 1,
0.8854892, 1.153969, 0.1410851, 0.9098039, 0, 1, 1,
0.8899904, 1.02409, 0.5080597, 0.9137255, 0, 1, 1,
0.890478, 1.579419, -0.380753, 0.9215686, 0, 1, 1,
0.8970761, -0.4895188, 1.247247, 0.9254902, 0, 1, 1,
0.8981135, 1.069103, 0.621869, 0.9333333, 0, 1, 1,
0.898519, -2.207776, 3.414458, 0.9372549, 0, 1, 1,
0.9173769, 0.235922, 2.357303, 0.945098, 0, 1, 1,
0.9214716, 0.1894625, 1.46439, 0.9490196, 0, 1, 1,
0.922374, -0.363076, 3.114172, 0.9568627, 0, 1, 1,
0.9249627, 0.2171156, 3.091475, 0.9607843, 0, 1, 1,
0.9276293, -0.2835325, 1.7897, 0.9686275, 0, 1, 1,
0.930142, 1.743201, 0.5644038, 0.972549, 0, 1, 1,
0.9410469, -2.304985, 2.242748, 0.9803922, 0, 1, 1,
0.9507001, -0.02821401, 2.659303, 0.9843137, 0, 1, 1,
0.9525529, 1.69791, 0.1306631, 0.9921569, 0, 1, 1,
0.9568049, -0.2986651, -0.40799, 0.9960784, 0, 1, 1,
0.9835863, -0.7150118, 1.818678, 1, 0, 0.9960784, 1,
0.9873483, 0.7996875, 3.414241, 1, 0, 0.9882353, 1,
0.9874079, 1.359899, 0.6894096, 1, 0, 0.9843137, 1,
0.9889714, -0.4084183, 2.122404, 1, 0, 0.9764706, 1,
0.9894538, 0.479008, 0.8667977, 1, 0, 0.972549, 1,
0.9948214, 1.906033, 0.5508146, 1, 0, 0.9647059, 1,
0.9967463, -1.243591, 3.043567, 1, 0, 0.9607843, 1,
1.001945, -0.7120259, 1.76362, 1, 0, 0.9529412, 1,
1.003597, 0.6142114, 1.214581, 1, 0, 0.9490196, 1,
1.005091, 0.2104915, 1.105534, 1, 0, 0.9411765, 1,
1.00982, 1.88283, 0.6332758, 1, 0, 0.9372549, 1,
1.01004, 0.788105, -0.2693995, 1, 0, 0.9294118, 1,
1.011779, 0.2251167, 1.85384, 1, 0, 0.9254902, 1,
1.012488, -0.2688912, 1.112497, 1, 0, 0.9176471, 1,
1.017266, 0.2291739, 0.1165284, 1, 0, 0.9137255, 1,
1.020705, 1.081862, 0.2201308, 1, 0, 0.9058824, 1,
1.029921, 0.6997064, 0.4451425, 1, 0, 0.9019608, 1,
1.032445, 1.219842, 2.06373, 1, 0, 0.8941177, 1,
1.033932, -0.2324551, 2.474748, 1, 0, 0.8862745, 1,
1.038933, 2.265744, 1.303529, 1, 0, 0.8823529, 1,
1.038958, 2.259501, -1.439413, 1, 0, 0.8745098, 1,
1.040098, -0.1953855, 0.2782116, 1, 0, 0.8705882, 1,
1.042745, -1.222077, 1.755318, 1, 0, 0.8627451, 1,
1.046367, -0.8305634, 0.9485125, 1, 0, 0.8588235, 1,
1.047742, -0.6719911, 2.949586, 1, 0, 0.8509804, 1,
1.051893, 0.04917134, 0.4106428, 1, 0, 0.8470588, 1,
1.066915, 0.7918749, 0.1084838, 1, 0, 0.8392157, 1,
1.070487, 1.007378, 0.6326168, 1, 0, 0.8352941, 1,
1.073659, 0.8770541, 0.663465, 1, 0, 0.827451, 1,
1.073711, -1.89142, 2.047334, 1, 0, 0.8235294, 1,
1.096436, -1.771746, 2.476322, 1, 0, 0.8156863, 1,
1.099981, -0.5127029, 2.214911, 1, 0, 0.8117647, 1,
1.10802, -1.07087, 0.5203744, 1, 0, 0.8039216, 1,
1.11746, 1.170362, 0.6154005, 1, 0, 0.7960784, 1,
1.119641, -0.3870426, 1.758019, 1, 0, 0.7921569, 1,
1.119755, -1.920401, 4.406309, 1, 0, 0.7843137, 1,
1.120325, -0.3484308, 1.737613, 1, 0, 0.7803922, 1,
1.126181, -0.8405484, 2.573992, 1, 0, 0.772549, 1,
1.12646, 1.249492, 0.3275047, 1, 0, 0.7686275, 1,
1.126889, -1.031103, 2.25329, 1, 0, 0.7607843, 1,
1.136301, -0.0450633, 2.981559, 1, 0, 0.7568628, 1,
1.140693, -0.03615202, 1.284106, 1, 0, 0.7490196, 1,
1.14101, -0.9736449, 3.29987, 1, 0, 0.7450981, 1,
1.14385, 1.128246, -0.04235646, 1, 0, 0.7372549, 1,
1.144091, 0.7518594, -0.337097, 1, 0, 0.7333333, 1,
1.145937, 0.7773157, 1.648714, 1, 0, 0.7254902, 1,
1.148185, -0.40797, 2.185481, 1, 0, 0.7215686, 1,
1.150416, -0.788777, 2.626451, 1, 0, 0.7137255, 1,
1.150594, 1.038713, 2.495765, 1, 0, 0.7098039, 1,
1.152109, 0.380351, 1.352066, 1, 0, 0.7019608, 1,
1.162858, 1.147545, 2.155666, 1, 0, 0.6941177, 1,
1.167702, 0.8943697, -0.1185731, 1, 0, 0.6901961, 1,
1.167791, 0.601541, 1.261328, 1, 0, 0.682353, 1,
1.16806, 0.4200139, 1.166106, 1, 0, 0.6784314, 1,
1.170685, 0.5094079, 1.05407, 1, 0, 0.6705883, 1,
1.171642, 0.2450892, 1.523634, 1, 0, 0.6666667, 1,
1.188902, 1.089829, -0.0449045, 1, 0, 0.6588235, 1,
1.197709, -0.3814509, 0.4113021, 1, 0, 0.654902, 1,
1.200184, 0.9062732, 1.822065, 1, 0, 0.6470588, 1,
1.202064, 0.1686134, 2.119072, 1, 0, 0.6431373, 1,
1.202424, 0.1718588, 0.9500894, 1, 0, 0.6352941, 1,
1.205825, 0.4099964, 1.195354, 1, 0, 0.6313726, 1,
1.207551, 0.7632894, -0.2610244, 1, 0, 0.6235294, 1,
1.216771, 0.02130771, 2.709714, 1, 0, 0.6196079, 1,
1.217551, -1.388077, 2.790516, 1, 0, 0.6117647, 1,
1.219158, -2.210815, 1.868629, 1, 0, 0.6078432, 1,
1.220225, -1.21983, 2.139783, 1, 0, 0.6, 1,
1.221914, 0.3627168, -0.1559151, 1, 0, 0.5921569, 1,
1.225657, 0.4974104, 0.3860637, 1, 0, 0.5882353, 1,
1.236051, -0.4939056, 2.124799, 1, 0, 0.5803922, 1,
1.237317, 0.2304729, 0.9983944, 1, 0, 0.5764706, 1,
1.239092, 0.2446549, 1.70339, 1, 0, 0.5686275, 1,
1.240701, 0.5906106, 3.718327, 1, 0, 0.5647059, 1,
1.244808, -0.1912517, 1.599122, 1, 0, 0.5568628, 1,
1.244852, -1.304957, 1.95577, 1, 0, 0.5529412, 1,
1.250295, 1.208341, 0.5642038, 1, 0, 0.5450981, 1,
1.263374, -1.07796, 2.666924, 1, 0, 0.5411765, 1,
1.283895, -1.873744, 2.930613, 1, 0, 0.5333334, 1,
1.287452, -0.3734509, 1.513521, 1, 0, 0.5294118, 1,
1.294843, 0.01180787, 0.5753855, 1, 0, 0.5215687, 1,
1.313541, 0.7195471, 1.352881, 1, 0, 0.5176471, 1,
1.314322, -2.543761, 4.31305, 1, 0, 0.509804, 1,
1.320325, 0.4069423, 2.842235, 1, 0, 0.5058824, 1,
1.323273, 1.836156, -0.7187963, 1, 0, 0.4980392, 1,
1.325933, -0.7639883, -0.409485, 1, 0, 0.4901961, 1,
1.326183, -0.4791917, 2.966376, 1, 0, 0.4862745, 1,
1.362391, -0.8938423, 2.855128, 1, 0, 0.4784314, 1,
1.364651, -1.163423, 1.532996, 1, 0, 0.4745098, 1,
1.372606, 0.08169256, 2.572654, 1, 0, 0.4666667, 1,
1.373307, 0.1251782, 1.980056, 1, 0, 0.4627451, 1,
1.389504, 0.7407632, -0.1790999, 1, 0, 0.454902, 1,
1.413088, 1.116852, 1.266843, 1, 0, 0.4509804, 1,
1.419471, -0.9195565, 2.528885, 1, 0, 0.4431373, 1,
1.424445, -0.3239521, 0.7298042, 1, 0, 0.4392157, 1,
1.429343, 0.3925483, 0.4384444, 1, 0, 0.4313726, 1,
1.434859, 0.7508953, 0.7610171, 1, 0, 0.427451, 1,
1.459625, 0.006079755, 1.267344, 1, 0, 0.4196078, 1,
1.491564, -0.2582856, 2.059696, 1, 0, 0.4156863, 1,
1.497945, 0.0522618, 0.3063826, 1, 0, 0.4078431, 1,
1.49952, 0.5315592, -1.121956, 1, 0, 0.4039216, 1,
1.49968, -0.08603066, 1.776517, 1, 0, 0.3960784, 1,
1.506565, -0.6689814, 4.609279, 1, 0, 0.3882353, 1,
1.50927, -1.042924, 1.874753, 1, 0, 0.3843137, 1,
1.510569, 0.04006437, 0.521374, 1, 0, 0.3764706, 1,
1.511634, -0.9445581, 1.059123, 1, 0, 0.372549, 1,
1.514192, 0.07116041, 1.314921, 1, 0, 0.3647059, 1,
1.514585, 0.1748015, 1.305639, 1, 0, 0.3607843, 1,
1.51916, -0.0738536, 1.310077, 1, 0, 0.3529412, 1,
1.524312, 0.01700038, 0.4988579, 1, 0, 0.3490196, 1,
1.529013, -0.3363903, 1.880735, 1, 0, 0.3411765, 1,
1.557303, 0.8793557, 1.946761, 1, 0, 0.3372549, 1,
1.559246, -0.3601256, 1.879434, 1, 0, 0.3294118, 1,
1.562482, -0.1580971, 2.409742, 1, 0, 0.3254902, 1,
1.598491, 0.08678181, 1.978199, 1, 0, 0.3176471, 1,
1.605449, -0.6645094, 1.532739, 1, 0, 0.3137255, 1,
1.606427, -0.2494093, 0.3574809, 1, 0, 0.3058824, 1,
1.614717, -1.249358, 1.236084, 1, 0, 0.2980392, 1,
1.616117, -0.7921067, 3.632569, 1, 0, 0.2941177, 1,
1.62634, 0.1843823, 1.130183, 1, 0, 0.2862745, 1,
1.628276, 0.626305, -0.8500019, 1, 0, 0.282353, 1,
1.628694, -0.9369747, 0.1818924, 1, 0, 0.2745098, 1,
1.64748, -1.095657, 4.706405, 1, 0, 0.2705882, 1,
1.660989, -0.08818449, 1.519915, 1, 0, 0.2627451, 1,
1.661914, 0.247449, 1.013723, 1, 0, 0.2588235, 1,
1.678801, 1.100891, 1.689024, 1, 0, 0.2509804, 1,
1.680805, -0.2793903, 2.119164, 1, 0, 0.2470588, 1,
1.701201, -0.8984818, 2.531399, 1, 0, 0.2392157, 1,
1.722273, -1.441797, 3.340475, 1, 0, 0.2352941, 1,
1.722283, -0.01628458, -0.6930613, 1, 0, 0.227451, 1,
1.728245, 1.336025, 0.1121402, 1, 0, 0.2235294, 1,
1.766727, -1.549861, 1.877847, 1, 0, 0.2156863, 1,
1.772368, 0.6976268, 1.756232, 1, 0, 0.2117647, 1,
1.78634, 1.892322, -1.145802, 1, 0, 0.2039216, 1,
1.798942, 0.9793557, 1.02095, 1, 0, 0.1960784, 1,
1.804741, -0.2638427, 2.601779, 1, 0, 0.1921569, 1,
1.83692, -0.2186134, 1.297614, 1, 0, 0.1843137, 1,
1.838465, -1.052125, 1.541994, 1, 0, 0.1803922, 1,
1.862183, -0.2909469, 1.531374, 1, 0, 0.172549, 1,
1.863003, 0.1669768, 2.588499, 1, 0, 0.1686275, 1,
1.864788, -0.9476853, 3.834512, 1, 0, 0.1607843, 1,
1.911471, 0.08372445, 1.33318, 1, 0, 0.1568628, 1,
1.950395, 0.0145171, 1.292577, 1, 0, 0.1490196, 1,
1.956062, 1.023915, 1.896977, 1, 0, 0.145098, 1,
1.957964, -1.066325, 2.039138, 1, 0, 0.1372549, 1,
1.981763, 0.9656681, 0.4047241, 1, 0, 0.1333333, 1,
1.991474, 1.214093, 2.167303, 1, 0, 0.1254902, 1,
1.994338, -0.07790963, 1.956986, 1, 0, 0.1215686, 1,
2.037117, -0.3461876, 1.912975, 1, 0, 0.1137255, 1,
2.055117, 0.5108865, 1.629065, 1, 0, 0.1098039, 1,
2.087757, 1.798175, 1.5219, 1, 0, 0.1019608, 1,
2.100924, 0.1756062, 0.1391884, 1, 0, 0.09411765, 1,
2.103691, -0.6217629, 1.522385, 1, 0, 0.09019608, 1,
2.113581, -0.3323266, 1.509681, 1, 0, 0.08235294, 1,
2.123057, 0.4610978, 1.431291, 1, 0, 0.07843138, 1,
2.148088, 0.6819276, 3.034694, 1, 0, 0.07058824, 1,
2.165052, 0.8294623, -0.7228418, 1, 0, 0.06666667, 1,
2.193362, -0.4585511, 0.657936, 1, 0, 0.05882353, 1,
2.252769, -1.10106, 1.81569, 1, 0, 0.05490196, 1,
2.269148, -0.2274893, 2.718753, 1, 0, 0.04705882, 1,
2.28042, 1.56102, 1.788584, 1, 0, 0.04313726, 1,
2.289279, -2.037744, 4.61688, 1, 0, 0.03529412, 1,
2.338732, -0.6827111, 0.221692, 1, 0, 0.03137255, 1,
2.41975, -1.131476, 2.443325, 1, 0, 0.02352941, 1,
2.494575, -0.7501209, 1.145839, 1, 0, 0.01960784, 1,
2.512206, 0.9803649, 2.555302, 1, 0, 0.01176471, 1,
2.569951, 1.456985, -0.3193079, 1, 0, 0.007843138, 1
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
-0.1442118, -4.166168, -7.134894, 0, -0.5, 0.5, 0.5,
-0.1442118, -4.166168, -7.134894, 1, -0.5, 0.5, 0.5,
-0.1442118, -4.166168, -7.134894, 1, 1.5, 0.5, 0.5,
-0.1442118, -4.166168, -7.134894, 0, 1.5, 0.5, 0.5
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
-3.778476, 0.1535994, -7.134894, 0, -0.5, 0.5, 0.5,
-3.778476, 0.1535994, -7.134894, 1, -0.5, 0.5, 0.5,
-3.778476, 0.1535994, -7.134894, 1, 1.5, 0.5, 0.5,
-3.778476, 0.1535994, -7.134894, 0, 1.5, 0.5, 0.5
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
-3.778476, -4.166168, -0.2914503, 0, -0.5, 0.5, 0.5,
-3.778476, -4.166168, -0.2914503, 1, -0.5, 0.5, 0.5,
-3.778476, -4.166168, -0.2914503, 1, 1.5, 0.5, 0.5,
-3.778476, -4.166168, -0.2914503, 0, 1.5, 0.5, 0.5
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
-2, -3.169299, -5.555638,
2, -3.169299, -5.555638,
-2, -3.169299, -5.555638,
-2, -3.335444, -5.818847,
-1, -3.169299, -5.555638,
-1, -3.335444, -5.818847,
0, -3.169299, -5.555638,
0, -3.335444, -5.818847,
1, -3.169299, -5.555638,
1, -3.335444, -5.818847,
2, -3.169299, -5.555638,
2, -3.335444, -5.818847
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
-2, -3.667734, -6.345266, 0, -0.5, 0.5, 0.5,
-2, -3.667734, -6.345266, 1, -0.5, 0.5, 0.5,
-2, -3.667734, -6.345266, 1, 1.5, 0.5, 0.5,
-2, -3.667734, -6.345266, 0, 1.5, 0.5, 0.5,
-1, -3.667734, -6.345266, 0, -0.5, 0.5, 0.5,
-1, -3.667734, -6.345266, 1, -0.5, 0.5, 0.5,
-1, -3.667734, -6.345266, 1, 1.5, 0.5, 0.5,
-1, -3.667734, -6.345266, 0, 1.5, 0.5, 0.5,
0, -3.667734, -6.345266, 0, -0.5, 0.5, 0.5,
0, -3.667734, -6.345266, 1, -0.5, 0.5, 0.5,
0, -3.667734, -6.345266, 1, 1.5, 0.5, 0.5,
0, -3.667734, -6.345266, 0, 1.5, 0.5, 0.5,
1, -3.667734, -6.345266, 0, -0.5, 0.5, 0.5,
1, -3.667734, -6.345266, 1, -0.5, 0.5, 0.5,
1, -3.667734, -6.345266, 1, 1.5, 0.5, 0.5,
1, -3.667734, -6.345266, 0, 1.5, 0.5, 0.5,
2, -3.667734, -6.345266, 0, -0.5, 0.5, 0.5,
2, -3.667734, -6.345266, 1, -0.5, 0.5, 0.5,
2, -3.667734, -6.345266, 1, 1.5, 0.5, 0.5,
2, -3.667734, -6.345266, 0, 1.5, 0.5, 0.5
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
-2.9398, -3, -5.555638,
-2.9398, 3, -5.555638,
-2.9398, -3, -5.555638,
-3.079579, -3, -5.818847,
-2.9398, -2, -5.555638,
-3.079579, -2, -5.818847,
-2.9398, -1, -5.555638,
-3.079579, -1, -5.818847,
-2.9398, 0, -5.555638,
-3.079579, 0, -5.818847,
-2.9398, 1, -5.555638,
-3.079579, 1, -5.818847,
-2.9398, 2, -5.555638,
-3.079579, 2, -5.818847,
-2.9398, 3, -5.555638,
-3.079579, 3, -5.818847
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
-3.359138, -3, -6.345266, 0, -0.5, 0.5, 0.5,
-3.359138, -3, -6.345266, 1, -0.5, 0.5, 0.5,
-3.359138, -3, -6.345266, 1, 1.5, 0.5, 0.5,
-3.359138, -3, -6.345266, 0, 1.5, 0.5, 0.5,
-3.359138, -2, -6.345266, 0, -0.5, 0.5, 0.5,
-3.359138, -2, -6.345266, 1, -0.5, 0.5, 0.5,
-3.359138, -2, -6.345266, 1, 1.5, 0.5, 0.5,
-3.359138, -2, -6.345266, 0, 1.5, 0.5, 0.5,
-3.359138, -1, -6.345266, 0, -0.5, 0.5, 0.5,
-3.359138, -1, -6.345266, 1, -0.5, 0.5, 0.5,
-3.359138, -1, -6.345266, 1, 1.5, 0.5, 0.5,
-3.359138, -1, -6.345266, 0, 1.5, 0.5, 0.5,
-3.359138, 0, -6.345266, 0, -0.5, 0.5, 0.5,
-3.359138, 0, -6.345266, 1, -0.5, 0.5, 0.5,
-3.359138, 0, -6.345266, 1, 1.5, 0.5, 0.5,
-3.359138, 0, -6.345266, 0, 1.5, 0.5, 0.5,
-3.359138, 1, -6.345266, 0, -0.5, 0.5, 0.5,
-3.359138, 1, -6.345266, 1, -0.5, 0.5, 0.5,
-3.359138, 1, -6.345266, 1, 1.5, 0.5, 0.5,
-3.359138, 1, -6.345266, 0, 1.5, 0.5, 0.5,
-3.359138, 2, -6.345266, 0, -0.5, 0.5, 0.5,
-3.359138, 2, -6.345266, 1, -0.5, 0.5, 0.5,
-3.359138, 2, -6.345266, 1, 1.5, 0.5, 0.5,
-3.359138, 2, -6.345266, 0, 1.5, 0.5, 0.5,
-3.359138, 3, -6.345266, 0, -0.5, 0.5, 0.5,
-3.359138, 3, -6.345266, 1, -0.5, 0.5, 0.5,
-3.359138, 3, -6.345266, 1, 1.5, 0.5, 0.5,
-3.359138, 3, -6.345266, 0, 1.5, 0.5, 0.5
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
-2.9398, -3.169299, -4,
-2.9398, -3.169299, 4,
-2.9398, -3.169299, -4,
-3.079579, -3.335444, -4,
-2.9398, -3.169299, -2,
-3.079579, -3.335444, -2,
-2.9398, -3.169299, 0,
-3.079579, -3.335444, 0,
-2.9398, -3.169299, 2,
-3.079579, -3.335444, 2,
-2.9398, -3.169299, 4,
-3.079579, -3.335444, 4
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
-3.359138, -3.667734, -4, 0, -0.5, 0.5, 0.5,
-3.359138, -3.667734, -4, 1, -0.5, 0.5, 0.5,
-3.359138, -3.667734, -4, 1, 1.5, 0.5, 0.5,
-3.359138, -3.667734, -4, 0, 1.5, 0.5, 0.5,
-3.359138, -3.667734, -2, 0, -0.5, 0.5, 0.5,
-3.359138, -3.667734, -2, 1, -0.5, 0.5, 0.5,
-3.359138, -3.667734, -2, 1, 1.5, 0.5, 0.5,
-3.359138, -3.667734, -2, 0, 1.5, 0.5, 0.5,
-3.359138, -3.667734, 0, 0, -0.5, 0.5, 0.5,
-3.359138, -3.667734, 0, 1, -0.5, 0.5, 0.5,
-3.359138, -3.667734, 0, 1, 1.5, 0.5, 0.5,
-3.359138, -3.667734, 0, 0, 1.5, 0.5, 0.5,
-3.359138, -3.667734, 2, 0, -0.5, 0.5, 0.5,
-3.359138, -3.667734, 2, 1, -0.5, 0.5, 0.5,
-3.359138, -3.667734, 2, 1, 1.5, 0.5, 0.5,
-3.359138, -3.667734, 2, 0, 1.5, 0.5, 0.5,
-3.359138, -3.667734, 4, 0, -0.5, 0.5, 0.5,
-3.359138, -3.667734, 4, 1, -0.5, 0.5, 0.5,
-3.359138, -3.667734, 4, 1, 1.5, 0.5, 0.5,
-3.359138, -3.667734, 4, 0, 1.5, 0.5, 0.5
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
-2.9398, -3.169299, -5.555638,
-2.9398, 3.476498, -5.555638,
-2.9398, -3.169299, 4.972737,
-2.9398, 3.476498, 4.972737,
-2.9398, -3.169299, -5.555638,
-2.9398, -3.169299, 4.972737,
-2.9398, 3.476498, -5.555638,
-2.9398, 3.476498, 4.972737,
-2.9398, -3.169299, -5.555638,
2.651376, -3.169299, -5.555638,
-2.9398, -3.169299, 4.972737,
2.651376, -3.169299, 4.972737,
-2.9398, 3.476498, -5.555638,
2.651376, 3.476498, -5.555638,
-2.9398, 3.476498, 4.972737,
2.651376, 3.476498, 4.972737,
2.651376, -3.169299, -5.555638,
2.651376, 3.476498, -5.555638,
2.651376, -3.169299, 4.972737,
2.651376, 3.476498, 4.972737,
2.651376, -3.169299, -5.555638,
2.651376, -3.169299, 4.972737,
2.651376, 3.476498, -5.555638,
2.651376, 3.476498, 4.972737
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
var radius = 7.287897;
var distance = 32.42468;
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
mvMatrix.translate( 0.1442118, -0.1535994, 0.2914503 );
mvMatrix.scale( 1.409331, 1.185684, 0.7484362 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.42468);
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
isopropyl_phenylcarb<-read.table("isopropyl_phenylcarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isopropyl_phenylcarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl_phenylcarb' not found
```

```r
y<-isopropyl_phenylcarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl_phenylcarb' not found
```

```r
z<-isopropyl_phenylcarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl_phenylcarb' not found
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
-2.858375, 1.092682, -1.005506, 0, 0, 1, 1, 1,
-2.802703, -0.07606005, -0.03980495, 1, 0, 0, 1, 1,
-2.788727, 0.07950219, -1.139807, 1, 0, 0, 1, 1,
-2.509282, -0.6980464, -2.93326, 1, 0, 0, 1, 1,
-2.370912, 1.371266, -1.200844, 1, 0, 0, 1, 1,
-2.363348, 0.05946947, 0.4459523, 1, 0, 0, 1, 1,
-2.345198, -0.05560222, -0.01055482, 0, 0, 0, 1, 1,
-2.300029, 0.03925841, -1.792409, 0, 0, 0, 1, 1,
-2.244067, 1.219964, 0.377971, 0, 0, 0, 1, 1,
-2.229724, -0.058832, -2.332612, 0, 0, 0, 1, 1,
-2.225221, -1.866863, -2.030913, 0, 0, 0, 1, 1,
-2.181609, -0.3327869, -2.759833, 0, 0, 0, 1, 1,
-2.162671, 1.547659, 0.07157809, 0, 0, 0, 1, 1,
-2.154811, 0.7860401, -0.03321813, 1, 1, 1, 1, 1,
-2.145436, -0.6047358, -2.484552, 1, 1, 1, 1, 1,
-2.123754, 0.7707206, -0.4411899, 1, 1, 1, 1, 1,
-2.103559, 0.507273, -1.691329, 1, 1, 1, 1, 1,
-2.099129, -0.7458689, -0.7231227, 1, 1, 1, 1, 1,
-2.066145, -0.9088849, -1.877675, 1, 1, 1, 1, 1,
-2.058904, -0.5524994, -0.2440635, 1, 1, 1, 1, 1,
-2.031754, -0.6465904, -2.203748, 1, 1, 1, 1, 1,
-2.029119, 0.52556, -3.099809, 1, 1, 1, 1, 1,
-2.017803, -1.613289, -1.890932, 1, 1, 1, 1, 1,
-1.994866, -0.8990987, -2.376149, 1, 1, 1, 1, 1,
-1.993916, -0.2133634, -2.180584, 1, 1, 1, 1, 1,
-1.993855, 0.3755529, 0.290154, 1, 1, 1, 1, 1,
-1.951007, 0.01148935, -0.5794496, 1, 1, 1, 1, 1,
-1.923865, 0.1588504, -1.964358, 1, 1, 1, 1, 1,
-1.895649, 0.05076686, -3.087394, 0, 0, 1, 1, 1,
-1.893583, 0.6481047, -1.812077, 1, 0, 0, 1, 1,
-1.892622, -1.081329, -3.890171, 1, 0, 0, 1, 1,
-1.891117, 0.9811883, -0.578001, 1, 0, 0, 1, 1,
-1.87209, -2.518421, -3.177827, 1, 0, 0, 1, 1,
-1.863021, -0.3814522, -0.9138635, 1, 0, 0, 1, 1,
-1.859465, 0.7235263, 0.3004134, 0, 0, 0, 1, 1,
-1.856204, 0.05653725, -1.785357, 0, 0, 0, 1, 1,
-1.841858, -0.179071, -3.099634, 0, 0, 0, 1, 1,
-1.838163, -0.8227556, -2.562021, 0, 0, 0, 1, 1,
-1.82536, 0.9918248, -2.159554, 0, 0, 0, 1, 1,
-1.813854, 0.394927, -0.4121476, 0, 0, 0, 1, 1,
-1.810907, 1.054212, -0.09377009, 0, 0, 0, 1, 1,
-1.807003, 1.654176, -2.452437, 1, 1, 1, 1, 1,
-1.802129, 0.8683552, -1.297687, 1, 1, 1, 1, 1,
-1.780004, -1.262237, -2.349864, 1, 1, 1, 1, 1,
-1.76587, 1.882295, -0.6511372, 1, 1, 1, 1, 1,
-1.750822, 0.5936975, -1.502707, 1, 1, 1, 1, 1,
-1.748097, -2.426769, -2.512274, 1, 1, 1, 1, 1,
-1.728948, 1.00904, 1.223673, 1, 1, 1, 1, 1,
-1.721085, -1.453872, -1.313547, 1, 1, 1, 1, 1,
-1.71184, 0.04796934, -1.336762, 1, 1, 1, 1, 1,
-1.709621, 1.10081, -2.923528, 1, 1, 1, 1, 1,
-1.704748, -0.4269608, -1.525848, 1, 1, 1, 1, 1,
-1.699618, -0.8011888, -2.912398, 1, 1, 1, 1, 1,
-1.68319, -1.806108, -2.624911, 1, 1, 1, 1, 1,
-1.677915, 0.5091106, -1.40169, 1, 1, 1, 1, 1,
-1.668457, -0.7541118, -2.056487, 1, 1, 1, 1, 1,
-1.658071, -0.3192935, -2.818046, 0, 0, 1, 1, 1,
-1.64873, 0.2271522, -2.971531, 1, 0, 0, 1, 1,
-1.631862, 0.5126038, -0.7284606, 1, 0, 0, 1, 1,
-1.622419, 0.1058387, -1.9826, 1, 0, 0, 1, 1,
-1.616361, 0.7786578, -2.993693, 1, 0, 0, 1, 1,
-1.609006, -0.3799455, -1.573351, 1, 0, 0, 1, 1,
-1.605104, 0.4992667, -0.1689247, 0, 0, 0, 1, 1,
-1.591961, 1.209585, -0.2481583, 0, 0, 0, 1, 1,
-1.581747, -0.7518659, -1.606225, 0, 0, 0, 1, 1,
-1.566047, 0.6221212, -1.724956, 0, 0, 0, 1, 1,
-1.562182, 1.210366, -0.2006984, 0, 0, 0, 1, 1,
-1.55617, -1.036212, -1.848116, 0, 0, 0, 1, 1,
-1.531625, 0.9008176, -2.505705, 0, 0, 0, 1, 1,
-1.523485, 0.1792225, -2.137393, 1, 1, 1, 1, 1,
-1.500875, 0.751789, 0.1356156, 1, 1, 1, 1, 1,
-1.494435, -0.8327178, -2.018727, 1, 1, 1, 1, 1,
-1.486941, 0.02667468, -1.356973, 1, 1, 1, 1, 1,
-1.485455, -0.2067125, -1.352708, 1, 1, 1, 1, 1,
-1.482582, 1.135591, 0.3223133, 1, 1, 1, 1, 1,
-1.466058, -0.2738284, -2.131311, 1, 1, 1, 1, 1,
-1.46394, 1.310261, 0.5108852, 1, 1, 1, 1, 1,
-1.461452, -0.1847619, -1.160123, 1, 1, 1, 1, 1,
-1.456768, -0.167505, -1.068459, 1, 1, 1, 1, 1,
-1.450242, 1.999127, -0.4053296, 1, 1, 1, 1, 1,
-1.446362, -0.7881424, -2.812795, 1, 1, 1, 1, 1,
-1.442144, -1.400246, -2.462261, 1, 1, 1, 1, 1,
-1.44027, -0.6302053, -3.941669, 1, 1, 1, 1, 1,
-1.432302, 0.926533, -0.1665108, 1, 1, 1, 1, 1,
-1.428086, 0.4639969, -1.559612, 0, 0, 1, 1, 1,
-1.424111, -0.280629, -1.267829, 1, 0, 0, 1, 1,
-1.421525, 0.07040577, -1.939332, 1, 0, 0, 1, 1,
-1.419716, -0.8755423, -2.14114, 1, 0, 0, 1, 1,
-1.417287, -0.6861386, -1.964582, 1, 0, 0, 1, 1,
-1.417235, 0.2162363, -1.590124, 1, 0, 0, 1, 1,
-1.407142, -0.6358302, -2.226934, 0, 0, 0, 1, 1,
-1.394764, 1.215951, 0.1589297, 0, 0, 0, 1, 1,
-1.388212, 1.593298, -0.740689, 0, 0, 0, 1, 1,
-1.380897, 0.2504911, -0.8559352, 0, 0, 0, 1, 1,
-1.368448, -0.646143, -2.497877, 0, 0, 0, 1, 1,
-1.368425, -2.239581, -0.6421269, 0, 0, 0, 1, 1,
-1.363416, 0.4565918, -1.860408, 0, 0, 0, 1, 1,
-1.362576, -0.45107, -2.745699, 1, 1, 1, 1, 1,
-1.355279, 0.9409201, -0.803351, 1, 1, 1, 1, 1,
-1.354112, -0.4025011, -0.513438, 1, 1, 1, 1, 1,
-1.342341, 0.3984397, 0.02202912, 1, 1, 1, 1, 1,
-1.341896, 0.2279207, -2.456951, 1, 1, 1, 1, 1,
-1.339061, -2.072569, -3.779914, 1, 1, 1, 1, 1,
-1.333811, -0.1455761, -2.122528, 1, 1, 1, 1, 1,
-1.332681, 0.5988031, -2.496632, 1, 1, 1, 1, 1,
-1.332377, -0.6177457, -0.9618915, 1, 1, 1, 1, 1,
-1.329785, -1.725231, -2.058547, 1, 1, 1, 1, 1,
-1.329434, -0.4816724, -0.9440312, 1, 1, 1, 1, 1,
-1.316224, 0.3187774, 0.1774022, 1, 1, 1, 1, 1,
-1.305013, -0.3439348, -2.636127, 1, 1, 1, 1, 1,
-1.303663, -0.6646042, -1.778703, 1, 1, 1, 1, 1,
-1.301554, 0.3776057, -1.923171, 1, 1, 1, 1, 1,
-1.292785, -0.6486695, -2.506931, 0, 0, 1, 1, 1,
-1.292, -2.273461, -3.559612, 1, 0, 0, 1, 1,
-1.286937, -0.2456473, -3.259664, 1, 0, 0, 1, 1,
-1.278134, -1.131847, -2.676145, 1, 0, 0, 1, 1,
-1.277364, -1.544881, -2.931845, 1, 0, 0, 1, 1,
-1.276634, -0.1238265, -1.534012, 1, 0, 0, 1, 1,
-1.264082, 0.09590604, -0.7666647, 0, 0, 0, 1, 1,
-1.259899, 0.5152168, -1.383399, 0, 0, 0, 1, 1,
-1.257726, 0.5304316, 0.1176544, 0, 0, 0, 1, 1,
-1.247058, 1.557444, 0.4415815, 0, 0, 0, 1, 1,
-1.244713, -0.565063, -2.695933, 0, 0, 0, 1, 1,
-1.244561, -0.388707, -3.002521, 0, 0, 0, 1, 1,
-1.234477, 0.7729587, -0.1373173, 0, 0, 0, 1, 1,
-1.233792, 0.747898, -1.437767, 1, 1, 1, 1, 1,
-1.229465, -1.355498, -1.571582, 1, 1, 1, 1, 1,
-1.216937, -0.4342963, -1.657628, 1, 1, 1, 1, 1,
-1.215111, 1.334661, -0.7575836, 1, 1, 1, 1, 1,
-1.205494, 0.482683, -1.627556, 1, 1, 1, 1, 1,
-1.199148, -1.978148, -1.538883, 1, 1, 1, 1, 1,
-1.191042, -0.1061989, -1.461383, 1, 1, 1, 1, 1,
-1.186208, -0.07275455, -2.909733, 1, 1, 1, 1, 1,
-1.181551, 0.3077287, 0.1478234, 1, 1, 1, 1, 1,
-1.17944, 0.70263, -1.937044, 1, 1, 1, 1, 1,
-1.17571, 1.972851, 1.383242, 1, 1, 1, 1, 1,
-1.174219, -0.6950468, -0.9805577, 1, 1, 1, 1, 1,
-1.153893, 1.886921, -0.5487206, 1, 1, 1, 1, 1,
-1.135593, 0.7203467, -0.749034, 1, 1, 1, 1, 1,
-1.134944, 1.183679, 0.03292232, 1, 1, 1, 1, 1,
-1.128509, 0.8651145, -1.960197, 0, 0, 1, 1, 1,
-1.126762, -0.9175072, -2.78013, 1, 0, 0, 1, 1,
-1.118298, -0.2103333, -2.058489, 1, 0, 0, 1, 1,
-1.102822, 1.04108, -1.257912, 1, 0, 0, 1, 1,
-1.102034, 0.1206461, -1.016273, 1, 0, 0, 1, 1,
-1.098374, 0.9111002, 0.5711218, 1, 0, 0, 1, 1,
-1.085296, -1.224525, -2.85047, 0, 0, 0, 1, 1,
-1.083859, 0.06819601, -1.510512, 0, 0, 0, 1, 1,
-1.078363, 0.7072678, -0.4524627, 0, 0, 0, 1, 1,
-1.076928, -0.3036896, -2.061265, 0, 0, 0, 1, 1,
-1.076581, -0.5683615, 0.2129482, 0, 0, 0, 1, 1,
-1.071957, -1.387074, -2.201256, 0, 0, 0, 1, 1,
-1.063736, 0.501042, -0.5973681, 0, 0, 0, 1, 1,
-1.056023, -0.01068126, -1.52936, 1, 1, 1, 1, 1,
-1.05248, -0.2908473, -2.329875, 1, 1, 1, 1, 1,
-1.052188, -0.7008719, -2.993551, 1, 1, 1, 1, 1,
-1.050871, 1.281245, -0.4577249, 1, 1, 1, 1, 1,
-1.049556, -2.920017, -2.028407, 1, 1, 1, 1, 1,
-1.048833, -0.7288437, -1.219915, 1, 1, 1, 1, 1,
-1.041898, 0.2191474, -3.03236, 1, 1, 1, 1, 1,
-1.035227, 0.427332, -1.327752, 1, 1, 1, 1, 1,
-1.033716, -1.323055, -2.559746, 1, 1, 1, 1, 1,
-1.014495, -0.8565579, -1.803022, 1, 1, 1, 1, 1,
-1.013733, -0.1363338, -3.710214, 1, 1, 1, 1, 1,
-1.013364, 0.3809739, 1.720521, 1, 1, 1, 1, 1,
-1.009223, 0.9038555, -2.140981, 1, 1, 1, 1, 1,
-1.002507, -0.2125102, -1.270216, 1, 1, 1, 1, 1,
-0.9992436, 0.02655607, -1.864401, 1, 1, 1, 1, 1,
-0.9955562, 1.394938, -0.7567453, 0, 0, 1, 1, 1,
-0.9945627, -0.7814261, -3.152164, 1, 0, 0, 1, 1,
-0.985505, 0.4584232, -1.841649, 1, 0, 0, 1, 1,
-0.9844404, -0.4727499, -1.827655, 1, 0, 0, 1, 1,
-0.9785419, 1.800586, -1.624721, 1, 0, 0, 1, 1,
-0.9694582, 0.1834405, -1.894804, 1, 0, 0, 1, 1,
-0.9665978, 0.4234095, -2.893399, 0, 0, 0, 1, 1,
-0.9605763, -0.9347214, -3.046311, 0, 0, 0, 1, 1,
-0.9600886, -0.7880805, -2.602315, 0, 0, 0, 1, 1,
-0.9592355, -1.01798, -2.240724, 0, 0, 0, 1, 1,
-0.958361, -0.5909552, -2.102587, 0, 0, 0, 1, 1,
-0.9554116, 1.425362, -0.3055075, 0, 0, 0, 1, 1,
-0.9531947, 2.122222, -0.7629947, 0, 0, 0, 1, 1,
-0.9427591, 0.4489845, -0.2854189, 1, 1, 1, 1, 1,
-0.9333912, 0.4574868, -3.810032, 1, 1, 1, 1, 1,
-0.9313055, -0.499163, -2.836096, 1, 1, 1, 1, 1,
-0.9311427, -0.1789476, -1.163842, 1, 1, 1, 1, 1,
-0.9302413, 0.5230075, -2.022619, 1, 1, 1, 1, 1,
-0.9262047, 0.4564433, -2.3019, 1, 1, 1, 1, 1,
-0.9246876, 0.8943067, 0.1776827, 1, 1, 1, 1, 1,
-0.9233858, 1.17544, 0.4042226, 1, 1, 1, 1, 1,
-0.9232346, 0.2520512, -0.5777634, 1, 1, 1, 1, 1,
-0.9196411, 0.4183922, -2.48472, 1, 1, 1, 1, 1,
-0.9152856, 1.094591, -0.5130985, 1, 1, 1, 1, 1,
-0.9122019, 0.2767661, -1.077461, 1, 1, 1, 1, 1,
-0.9025893, 0.5916782, -1.552564, 1, 1, 1, 1, 1,
-0.9001366, 0.9380446, -0.7368497, 1, 1, 1, 1, 1,
-0.8762565, 0.5231905, 0.1375344, 1, 1, 1, 1, 1,
-0.8757966, 0.1793986, -2.92974, 0, 0, 1, 1, 1,
-0.8732346, -0.04719444, -1.520547, 1, 0, 0, 1, 1,
-0.872878, 0.2195362, -1.42192, 1, 0, 0, 1, 1,
-0.8715412, 0.4465022, 0.2019125, 1, 0, 0, 1, 1,
-0.8567084, -0.672694, -1.2824, 1, 0, 0, 1, 1,
-0.8558331, 0.3501291, 0.2065671, 1, 0, 0, 1, 1,
-0.8544136, -0.1418926, -1.388729, 0, 0, 0, 1, 1,
-0.8534461, 1.381709, -1.466335, 0, 0, 0, 1, 1,
-0.8512425, 0.6663725, -1.53285, 0, 0, 0, 1, 1,
-0.8466308, -0.5375582, -1.769486, 0, 0, 0, 1, 1,
-0.842617, -0.7391339, -3.733769, 0, 0, 0, 1, 1,
-0.8420551, 1.278357, -0.007589383, 0, 0, 0, 1, 1,
-0.8418213, -0.5683632, -2.049142, 0, 0, 0, 1, 1,
-0.8416167, 1.183246, 0.02318369, 1, 1, 1, 1, 1,
-0.8414701, -0.2423991, -2.421747, 1, 1, 1, 1, 1,
-0.8370065, 0.1501601, -0.9299226, 1, 1, 1, 1, 1,
-0.8337025, -1.005708, -4.259225, 1, 1, 1, 1, 1,
-0.8334858, -0.4803689, -2.743667, 1, 1, 1, 1, 1,
-0.8319159, -1.839884, -4.032655, 1, 1, 1, 1, 1,
-0.8300477, -0.5428608, -3.056781, 1, 1, 1, 1, 1,
-0.8297632, -1.045335, -2.362025, 1, 1, 1, 1, 1,
-0.829213, 0.762998, -0.4333889, 1, 1, 1, 1, 1,
-0.8229972, -0.5286111, -1.166398, 1, 1, 1, 1, 1,
-0.8151274, -1.130776, -1.976494, 1, 1, 1, 1, 1,
-0.809709, 0.3715488, 0.7531366, 1, 1, 1, 1, 1,
-0.8042346, -1.535858, -2.6975, 1, 1, 1, 1, 1,
-0.801384, -0.2317983, -0.8060123, 1, 1, 1, 1, 1,
-0.8007831, 0.5207672, -2.286329, 1, 1, 1, 1, 1,
-0.7990323, 0.2252924, -1.315633, 0, 0, 1, 1, 1,
-0.7965554, -0.2371933, -0.5265055, 1, 0, 0, 1, 1,
-0.7945114, -0.6065931, -3.041783, 1, 0, 0, 1, 1,
-0.793282, 0.8875493, -2.93395, 1, 0, 0, 1, 1,
-0.7917981, -2.453754, -4.054092, 1, 0, 0, 1, 1,
-0.7908683, -0.2137145, -1.240435, 1, 0, 0, 1, 1,
-0.7906658, -2.176674, -2.803367, 0, 0, 0, 1, 1,
-0.7892073, 0.7150965, -0.817041, 0, 0, 0, 1, 1,
-0.7830622, 2.049294, -1.106821, 0, 0, 0, 1, 1,
-0.7809103, 0.348374, -1.450034, 0, 0, 0, 1, 1,
-0.7722639, -1.075692, -2.988892, 0, 0, 0, 1, 1,
-0.7719517, -1.272998, -2.997595, 0, 0, 0, 1, 1,
-0.7640814, -0.5839849, -1.546845, 0, 0, 0, 1, 1,
-0.763014, 0.4913712, 0.1850126, 1, 1, 1, 1, 1,
-0.7621505, 0.2526435, -0.572682, 1, 1, 1, 1, 1,
-0.7616886, 0.5295807, -1.699599, 1, 1, 1, 1, 1,
-0.7610619, 1.751574, -0.9273583, 1, 1, 1, 1, 1,
-0.7600006, 0.4955886, -1.185917, 1, 1, 1, 1, 1,
-0.7556532, -0.8817728, -4.537022, 1, 1, 1, 1, 1,
-0.7526692, 0.2877785, -1.148698, 1, 1, 1, 1, 1,
-0.7517251, -0.7166665, -3.615439, 1, 1, 1, 1, 1,
-0.7511905, -0.0646207, -1.99022, 1, 1, 1, 1, 1,
-0.7493105, -1.065791, -3.362278, 1, 1, 1, 1, 1,
-0.74783, 0.3718772, -0.9989187, 1, 1, 1, 1, 1,
-0.7462807, 0.5816457, -1.305242, 1, 1, 1, 1, 1,
-0.7428046, 0.6562818, -1.691673, 1, 1, 1, 1, 1,
-0.7424194, 0.8399046, 0.3777337, 1, 1, 1, 1, 1,
-0.7361736, -3.072515, -4.536356, 1, 1, 1, 1, 1,
-0.7312869, -0.4402524, -1.265485, 0, 0, 1, 1, 1,
-0.7263499, 0.8659672, -2.328674, 1, 0, 0, 1, 1,
-0.7147184, 0.5751981, -2.346961, 1, 0, 0, 1, 1,
-0.7144786, -1.389407, -2.620721, 1, 0, 0, 1, 1,
-0.7123368, -0.4748292, -0.5591397, 1, 0, 0, 1, 1,
-0.7110913, -1.14194, -2.947695, 1, 0, 0, 1, 1,
-0.7109264, 0.2484179, -2.337791, 0, 0, 0, 1, 1,
-0.7086413, 0.754453, -1.027033, 0, 0, 0, 1, 1,
-0.6992255, -0.6776181, -3.262749, 0, 0, 0, 1, 1,
-0.6953285, -0.3174377, -2.321519, 0, 0, 0, 1, 1,
-0.6950564, 0.1515328, -2.774333, 0, 0, 0, 1, 1,
-0.6933806, -0.7623508, -1.420838, 0, 0, 0, 1, 1,
-0.6852784, -0.1915921, -0.4207392, 0, 0, 0, 1, 1,
-0.6851022, 0.5474914, -0.746401, 1, 1, 1, 1, 1,
-0.683543, 0.09533297, -1.738622, 1, 1, 1, 1, 1,
-0.6790781, 0.2602936, -0.5414396, 1, 1, 1, 1, 1,
-0.6789343, 1.138342, 0.7267538, 1, 1, 1, 1, 1,
-0.6780736, 1.332696, 1.44878, 1, 1, 1, 1, 1,
-0.6774813, 0.004116801, -1.147218, 1, 1, 1, 1, 1,
-0.674954, -0.9277456, -2.279569, 1, 1, 1, 1, 1,
-0.6733537, 0.5314514, -0.371759, 1, 1, 1, 1, 1,
-0.6682264, 2.535069, 0.9493445, 1, 1, 1, 1, 1,
-0.6575599, 1.158154, -0.1276692, 1, 1, 1, 1, 1,
-0.6567304, -0.001206367, -1.022666, 1, 1, 1, 1, 1,
-0.6516511, 0.4171733, 0.07557146, 1, 1, 1, 1, 1,
-0.6469719, -0.6540309, -2.183007, 1, 1, 1, 1, 1,
-0.6416717, 0.08802555, -3.051106, 1, 1, 1, 1, 1,
-0.6370121, 0.5243528, -0.4505067, 1, 1, 1, 1, 1,
-0.6362663, -0.3321244, -0.1249152, 0, 0, 1, 1, 1,
-0.6362349, 1.501624, 0.2837806, 1, 0, 0, 1, 1,
-0.6353936, -1.626639, -2.798769, 1, 0, 0, 1, 1,
-0.6313392, -0.3542896, -1.770494, 1, 0, 0, 1, 1,
-0.6310171, 0.1060997, -0.4321164, 1, 0, 0, 1, 1,
-0.6259019, 0.9214987, -1.576085, 1, 0, 0, 1, 1,
-0.6244338, -0.8232082, -2.830305, 0, 0, 0, 1, 1,
-0.6220301, -0.02897077, 1.07761, 0, 0, 0, 1, 1,
-0.6219331, -0.507449, -1.526224, 0, 0, 0, 1, 1,
-0.6212987, 1.024217, -0.4170062, 0, 0, 0, 1, 1,
-0.6191119, -0.06600881, -1.949883, 0, 0, 0, 1, 1,
-0.6183841, -0.3074521, -2.696965, 0, 0, 0, 1, 1,
-0.6164703, 0.4466565, -2.114797, 0, 0, 0, 1, 1,
-0.6161228, -0.6864485, -2.926335, 1, 1, 1, 1, 1,
-0.6128917, 0.5268849, -0.1257253, 1, 1, 1, 1, 1,
-0.6116638, -0.8470259, -0.5264087, 1, 1, 1, 1, 1,
-0.6110656, -1.474828, -3.148582, 1, 1, 1, 1, 1,
-0.6099952, -0.2748632, -1.126816, 1, 1, 1, 1, 1,
-0.6098068, -0.04319124, -3.080543, 1, 1, 1, 1, 1,
-0.6091542, -0.02990207, -1.806215, 1, 1, 1, 1, 1,
-0.606563, -0.8792807, -0.8208748, 1, 1, 1, 1, 1,
-0.6040382, -0.7369853, -3.694874, 1, 1, 1, 1, 1,
-0.5993925, 1.054469, -0.4934036, 1, 1, 1, 1, 1,
-0.5987645, 0.1292064, -1.390825, 1, 1, 1, 1, 1,
-0.5910636, 1.742215, 0.4233077, 1, 1, 1, 1, 1,
-0.5886943, 1.226737, -0.2688021, 1, 1, 1, 1, 1,
-0.5874815, 0.5933238, -0.9609115, 1, 1, 1, 1, 1,
-0.5824206, 0.7632551, -0.2580546, 1, 1, 1, 1, 1,
-0.5747378, 1.259132, 1.21751, 0, 0, 1, 1, 1,
-0.573567, -0.3477868, -1.806248, 1, 0, 0, 1, 1,
-0.5719365, -2.098223, -3.337736, 1, 0, 0, 1, 1,
-0.5699402, 0.5703527, -0.1769807, 1, 0, 0, 1, 1,
-0.5689272, 0.1635136, 0.3861142, 1, 0, 0, 1, 1,
-0.5664387, -0.2376402, -2.284259, 1, 0, 0, 1, 1,
-0.5591451, -0.2560569, -3.142782, 0, 0, 0, 1, 1,
-0.5587539, -0.6178367, -2.887882, 0, 0, 0, 1, 1,
-0.5581802, 1.753983, -0.4571417, 0, 0, 0, 1, 1,
-0.556201, -0.9939179, -2.923147, 0, 0, 0, 1, 1,
-0.5560716, 0.3092379, -1.513014, 0, 0, 0, 1, 1,
-0.5560543, 1.014531, -0.07395669, 0, 0, 0, 1, 1,
-0.55599, 0.1520708, -0.4046788, 0, 0, 0, 1, 1,
-0.5537122, 0.5506544, -2.440543, 1, 1, 1, 1, 1,
-0.5512044, 1.04433, -1.985158, 1, 1, 1, 1, 1,
-0.5499321, 0.6363117, -0.1529192, 1, 1, 1, 1, 1,
-0.5480416, 1.024508, -1.210692, 1, 1, 1, 1, 1,
-0.5462868, 0.3752999, -0.1056409, 1, 1, 1, 1, 1,
-0.5460818, 1.126879, 1.524193, 1, 1, 1, 1, 1,
-0.5410016, 1.547679, 0.9619828, 1, 1, 1, 1, 1,
-0.5409946, 2.362973, 1.131106, 1, 1, 1, 1, 1,
-0.5361984, 1.796446, -0.2498661, 1, 1, 1, 1, 1,
-0.5291994, -0.1605619, -1.785345, 1, 1, 1, 1, 1,
-0.5274249, -1.717341, -1.986171, 1, 1, 1, 1, 1,
-0.527176, -0.2051859, -2.124307, 1, 1, 1, 1, 1,
-0.5152317, 0.1948245, -0.4205478, 1, 1, 1, 1, 1,
-0.5083758, 1.102737, -0.5728556, 1, 1, 1, 1, 1,
-0.5044554, -0.05321674, -1.355517, 1, 1, 1, 1, 1,
-0.50392, 0.5446903, -0.8144877, 0, 0, 1, 1, 1,
-0.5038291, 0.9690782, -1.267469, 1, 0, 0, 1, 1,
-0.5020952, 1.563913, -0.131478, 1, 0, 0, 1, 1,
-0.5003625, 1.247301, -0.702266, 1, 0, 0, 1, 1,
-0.4922386, 0.1337566, -0.7242262, 1, 0, 0, 1, 1,
-0.4893934, -0.6810233, -2.389771, 1, 0, 0, 1, 1,
-0.4865844, 0.04893135, -0.3199555, 0, 0, 0, 1, 1,
-0.4829359, 1.004129, -1.266134, 0, 0, 0, 1, 1,
-0.4815194, 2.278648, -1.819309, 0, 0, 0, 1, 1,
-0.4771843, -0.6488431, -2.08103, 0, 0, 0, 1, 1,
-0.4768892, -1.414878, -2.858337, 0, 0, 0, 1, 1,
-0.4712836, 0.1401632, -1.19839, 0, 0, 0, 1, 1,
-0.4658283, -0.2435178, -1.245555, 0, 0, 0, 1, 1,
-0.4638137, 1.295831, -0.5583929, 1, 1, 1, 1, 1,
-0.457538, 0.1923607, -1.498414, 1, 1, 1, 1, 1,
-0.4568556, -0.8164561, -3.459718, 1, 1, 1, 1, 1,
-0.4542347, -0.3043068, -0.6879439, 1, 1, 1, 1, 1,
-0.4533795, 0.3812438, -0.1882177, 1, 1, 1, 1, 1,
-0.4520571, 0.4233519, -1.646066, 1, 1, 1, 1, 1,
-0.4497981, -0.1679614, -0.7646666, 1, 1, 1, 1, 1,
-0.4481886, 2.319609, 0.3811025, 1, 1, 1, 1, 1,
-0.4446943, 1.112575, -0.1386127, 1, 1, 1, 1, 1,
-0.4430526, -0.03328287, -0.006834251, 1, 1, 1, 1, 1,
-0.4406202, 0.4170859, -1.553576, 1, 1, 1, 1, 1,
-0.4397441, 0.4887022, -2.11656, 1, 1, 1, 1, 1,
-0.4373334, -1.719848, -3.396056, 1, 1, 1, 1, 1,
-0.4369062, 0.08362705, -1.419092, 1, 1, 1, 1, 1,
-0.4358749, 0.5245312, -1.110518, 1, 1, 1, 1, 1,
-0.435797, 0.5628062, 0.6236608, 0, 0, 1, 1, 1,
-0.4352988, 0.2871924, -0.2554638, 1, 0, 0, 1, 1,
-0.4330948, -1.108755, -2.812364, 1, 0, 0, 1, 1,
-0.4327505, -0.04039457, -0.0382685, 1, 0, 0, 1, 1,
-0.4316878, 0.2089329, -0.8233425, 1, 0, 0, 1, 1,
-0.4295426, -0.9297639, -3.054999, 1, 0, 0, 1, 1,
-0.4270312, -0.6169811, -2.684139, 0, 0, 0, 1, 1,
-0.4246572, -0.8292391, -3.232703, 0, 0, 0, 1, 1,
-0.4210776, -1.995194, -2.84443, 0, 0, 0, 1, 1,
-0.4201632, -0.07481728, -1.528861, 0, 0, 0, 1, 1,
-0.4132481, 0.9560758, -1.291799, 0, 0, 0, 1, 1,
-0.412581, 0.7346155, -1.695965, 0, 0, 0, 1, 1,
-0.411781, -1.315968, -2.684779, 0, 0, 0, 1, 1,
-0.4067302, -0.2833354, 0.387842, 1, 1, 1, 1, 1,
-0.4065039, 0.5895729, -0.2725521, 1, 1, 1, 1, 1,
-0.4057777, 0.05579145, -1.162457, 1, 1, 1, 1, 1,
-0.4023973, -0.6426561, -1.532987, 1, 1, 1, 1, 1,
-0.4021927, -0.9296622, -3.288747, 1, 1, 1, 1, 1,
-0.400033, 0.6743073, 0.5842006, 1, 1, 1, 1, 1,
-0.3961744, 0.5914465, 0.02557874, 1, 1, 1, 1, 1,
-0.3960526, 0.2941845, -2.544262, 1, 1, 1, 1, 1,
-0.3930732, -0.2898767, -0.3972121, 1, 1, 1, 1, 1,
-0.3915983, 0.579468, -1.450859, 1, 1, 1, 1, 1,
-0.3888693, 0.06574653, 0.4556143, 1, 1, 1, 1, 1,
-0.381341, 0.2697076, -0.02415464, 1, 1, 1, 1, 1,
-0.3808383, -0.4845866, -1.648422, 1, 1, 1, 1, 1,
-0.3804168, -0.7376507, -2.681217, 1, 1, 1, 1, 1,
-0.378256, -1.497725, -1.285306, 1, 1, 1, 1, 1,
-0.3756683, 1.474047, -0.4064375, 0, 0, 1, 1, 1,
-0.3700474, 0.6510614, -1.738914, 1, 0, 0, 1, 1,
-0.3665144, -0.7530416, -2.272565, 1, 0, 0, 1, 1,
-0.3600326, -0.4677515, -2.483237, 1, 0, 0, 1, 1,
-0.3545285, 0.1349735, 0.8703644, 1, 0, 0, 1, 1,
-0.3528136, -0.08484157, 0.7350774, 1, 0, 0, 1, 1,
-0.3514337, -1.796334, -2.242077, 0, 0, 0, 1, 1,
-0.3476849, 0.749592, 0.2949293, 0, 0, 0, 1, 1,
-0.3474696, 1.785156, -0.6291599, 0, 0, 0, 1, 1,
-0.3467516, -1.620623, -1.386212, 0, 0, 0, 1, 1,
-0.3423721, 1.0243, 1.158525, 0, 0, 0, 1, 1,
-0.3376765, 0.6215585, -0.6867984, 0, 0, 0, 1, 1,
-0.3311321, 0.1897905, -1.58445, 0, 0, 0, 1, 1,
-0.3221447, -0.4415029, -2.576579, 1, 1, 1, 1, 1,
-0.3136011, -0.2634606, -1.205213, 1, 1, 1, 1, 1,
-0.313286, 1.617633, -1.215543, 1, 1, 1, 1, 1,
-0.3125469, -0.2116189, -0.2814582, 1, 1, 1, 1, 1,
-0.3106515, 3.063846, -0.4507219, 1, 1, 1, 1, 1,
-0.3083405, -0.6915098, -3.750793, 1, 1, 1, 1, 1,
-0.3081896, -0.4018566, -1.815692, 1, 1, 1, 1, 1,
-0.3072871, -0.2424529, -0.3267332, 1, 1, 1, 1, 1,
-0.3056915, -0.5193528, -0.5329617, 1, 1, 1, 1, 1,
-0.3045425, -0.9045346, -2.427605, 1, 1, 1, 1, 1,
-0.3027609, -0.1903947, -1.905731, 1, 1, 1, 1, 1,
-0.3000576, 0.4362308, -1.917825, 1, 1, 1, 1, 1,
-0.2996918, 1.215167, -1.629923, 1, 1, 1, 1, 1,
-0.2826246, 1.073659, -0.9054688, 1, 1, 1, 1, 1,
-0.2770306, 1.07063, 0.4301566, 1, 1, 1, 1, 1,
-0.2763303, -0.5110975, -2.303497, 0, 0, 1, 1, 1,
-0.2746382, -0.5307941, -1.847034, 1, 0, 0, 1, 1,
-0.2710589, -1.608774, -1.422368, 1, 0, 0, 1, 1,
-0.2708731, -0.352214, -1.968594, 1, 0, 0, 1, 1,
-0.2687249, -1.728708, -2.453921, 1, 0, 0, 1, 1,
-0.2613159, -0.1108238, -3.277623, 1, 0, 0, 1, 1,
-0.2612917, 0.540089, 0.8234084, 0, 0, 0, 1, 1,
-0.2610653, 0.9518967, -1.111102, 0, 0, 0, 1, 1,
-0.2502937, -0.07041132, -2.089982, 0, 0, 0, 1, 1,
-0.2450863, -2.227452, -5.06967, 0, 0, 0, 1, 1,
-0.2442243, -0.4825787, -3.169391, 0, 0, 0, 1, 1,
-0.2415291, 0.4080272, 0.2451844, 0, 0, 0, 1, 1,
-0.2414917, -0.1552114, -2.472422, 0, 0, 0, 1, 1,
-0.2396519, -0.08363198, -3.197184, 1, 1, 1, 1, 1,
-0.2379769, 0.9707471, -1.495528, 1, 1, 1, 1, 1,
-0.2378188, 0.2125146, 0.635848, 1, 1, 1, 1, 1,
-0.2353225, -0.9743013, -4.190857, 1, 1, 1, 1, 1,
-0.2316375, 0.9067699, 0.34648, 1, 1, 1, 1, 1,
-0.2290812, -0.7971943, -2.959916, 1, 1, 1, 1, 1,
-0.2260622, -0.7700173, -4.090805, 1, 1, 1, 1, 1,
-0.2230596, 0.7665046, 1.280737, 1, 1, 1, 1, 1,
-0.2215011, -1.610309, -2.12442, 1, 1, 1, 1, 1,
-0.2207731, -1.428275, -4.339315, 1, 1, 1, 1, 1,
-0.2153854, -1.343173, -2.531534, 1, 1, 1, 1, 1,
-0.2130868, 1.862116, -1.615978, 1, 1, 1, 1, 1,
-0.2075826, -0.2492931, -2.379205, 1, 1, 1, 1, 1,
-0.2048214, 0.5843266, 0.8210593, 1, 1, 1, 1, 1,
-0.2038058, -2.250918, -0.9866744, 1, 1, 1, 1, 1,
-0.1986845, 0.2272124, -0.6952564, 0, 0, 1, 1, 1,
-0.1958232, -0.1107597, -3.715424, 1, 0, 0, 1, 1,
-0.1846565, 0.03007773, -4.409348, 1, 0, 0, 1, 1,
-0.1836413, -0.547415, -2.420156, 1, 0, 0, 1, 1,
-0.1793176, 0.6698088, 0.04116539, 1, 0, 0, 1, 1,
-0.1778953, -0.8217562, -3.124097, 1, 0, 0, 1, 1,
-0.1745689, 0.805093, 0.4144229, 0, 0, 0, 1, 1,
-0.1727001, 0.276015, -0.8610157, 0, 0, 0, 1, 1,
-0.1684196, 0.94682, -0.08814822, 0, 0, 0, 1, 1,
-0.1639034, 0.6106417, -0.5644065, 0, 0, 0, 1, 1,
-0.1634914, 1.519867, -1.270432, 0, 0, 0, 1, 1,
-0.1604645, -1.033466, -3.648113, 0, 0, 0, 1, 1,
-0.1552815, 0.1106309, -1.779945, 0, 0, 0, 1, 1,
-0.1535627, 0.583426, 0.2361052, 1, 1, 1, 1, 1,
-0.1470178, 0.6286739, 0.3701025, 1, 1, 1, 1, 1,
-0.1446145, 0.8047851, -0.2654231, 1, 1, 1, 1, 1,
-0.1445976, -0.8735085, -1.253935, 1, 1, 1, 1, 1,
-0.1401985, 1.080303, -0.2308438, 1, 1, 1, 1, 1,
-0.1329093, 0.002699761, -1.754194, 1, 1, 1, 1, 1,
-0.13284, -1.233028, -2.492183, 1, 1, 1, 1, 1,
-0.1309869, 0.08757151, -1.734852, 1, 1, 1, 1, 1,
-0.1299703, -0.8259642, -2.877985, 1, 1, 1, 1, 1,
-0.1281847, 0.2552208, -1.891293, 1, 1, 1, 1, 1,
-0.1226486, -0.4866067, -3.374116, 1, 1, 1, 1, 1,
-0.1218707, 0.3278348, 0.7962499, 1, 1, 1, 1, 1,
-0.1205554, -0.1247868, -3.790391, 1, 1, 1, 1, 1,
-0.1189256, 1.914978, -0.5492874, 1, 1, 1, 1, 1,
-0.1105657, -0.8212769, -3.081387, 1, 1, 1, 1, 1,
-0.109529, -0.4061614, -2.827947, 0, 0, 1, 1, 1,
-0.1048138, -0.1707423, -2.322963, 1, 0, 0, 1, 1,
-0.1038157, 0.06612013, -2.074691, 1, 0, 0, 1, 1,
-0.1025515, 0.5501213, -0.3286638, 1, 0, 0, 1, 1,
-0.09571479, -1.789074, -3.351757, 1, 0, 0, 1, 1,
-0.07773265, 1.313311, -0.465536, 1, 0, 0, 1, 1,
-0.07730888, -1.613262, -3.962199, 0, 0, 0, 1, 1,
-0.07285687, -0.3178332, -3.298105, 0, 0, 0, 1, 1,
-0.07235056, -0.7154455, -3.154546, 0, 0, 0, 1, 1,
-0.06890486, -0.1904545, -2.592269, 0, 0, 0, 1, 1,
-0.06488825, -0.6398376, -2.371902, 0, 0, 0, 1, 1,
-0.06223608, 0.05482788, -1.545223, 0, 0, 0, 1, 1,
-0.06141112, 1.147195, 0.7418835, 0, 0, 0, 1, 1,
-0.06100319, 0.3033409, -0.1433089, 1, 1, 1, 1, 1,
-0.05817305, -0.6099178, -1.159191, 1, 1, 1, 1, 1,
-0.05135199, 1.054219, 0.463, 1, 1, 1, 1, 1,
-0.04985206, 0.9596342, -0.2651988, 1, 1, 1, 1, 1,
-0.04889982, 1.137574, 0.7002689, 1, 1, 1, 1, 1,
-0.04363702, 0.7376278, 0.4105473, 1, 1, 1, 1, 1,
-0.04227592, -1.556031, -5.402312, 1, 1, 1, 1, 1,
-0.038669, 0.3974619, 1.334753, 1, 1, 1, 1, 1,
-0.03833704, 0.3763427, 0.2483439, 1, 1, 1, 1, 1,
-0.03673858, 0.4785959, -0.8826335, 1, 1, 1, 1, 1,
-0.03090255, -0.07433602, -3.094116, 1, 1, 1, 1, 1,
-0.02684475, 0.9039642, 0.3716279, 1, 1, 1, 1, 1,
-0.02317412, -2.050141, -3.543845, 1, 1, 1, 1, 1,
-0.02298265, 1.3973, -0.8036343, 1, 1, 1, 1, 1,
-0.0194215, 1.266907, 0.7404423, 1, 1, 1, 1, 1,
-0.01595549, -0.3774781, -1.95359, 0, 0, 1, 1, 1,
-0.01487264, -0.5860273, -2.954275, 1, 0, 0, 1, 1,
-0.01410111, -0.9452278, -2.215858, 1, 0, 0, 1, 1,
-0.01335437, -0.2052596, -2.050964, 1, 0, 0, 1, 1,
-0.01063115, -0.3402539, -1.545584, 1, 0, 0, 1, 1,
-0.01045653, 0.3832487, -0.111922, 1, 0, 0, 1, 1,
-0.009944855, 1.405458, -1.061608, 0, 0, 0, 1, 1,
-0.006743787, -0.2352523, -3.251905, 0, 0, 0, 1, 1,
-0.004506901, -1.363416, -2.809452, 0, 0, 0, 1, 1,
-0.003165331, -0.6083906, -3.309355, 0, 0, 0, 1, 1,
-0.002615001, 1.357715, -0.01906891, 0, 0, 0, 1, 1,
-0.001250433, -0.2919805, -5.375773, 0, 0, 0, 1, 1,
-0.001171597, -1.186903, -4.442124, 0, 0, 0, 1, 1,
0.0004753951, 0.2413283, 0.4634652, 1, 1, 1, 1, 1,
0.00147592, -0.66216, 3.645717, 1, 1, 1, 1, 1,
0.003391155, -0.627347, 3.474117, 1, 1, 1, 1, 1,
0.01874632, 0.2610212, -0.8652706, 1, 1, 1, 1, 1,
0.02127301, 1.505613, -1.513486, 1, 1, 1, 1, 1,
0.02268815, -0.3008787, 3.313885, 1, 1, 1, 1, 1,
0.02270992, -0.2280812, 3.882753, 1, 1, 1, 1, 1,
0.02538461, -0.8995987, 3.641123, 1, 1, 1, 1, 1,
0.03376458, -2.009698, 4.314716, 1, 1, 1, 1, 1,
0.03619608, 0.4442839, 0.6673704, 1, 1, 1, 1, 1,
0.05774801, 0.2431574, 0.1686414, 1, 1, 1, 1, 1,
0.05842415, -1.266226, 3.890319, 1, 1, 1, 1, 1,
0.05924133, -0.06472519, 1.92114, 1, 1, 1, 1, 1,
0.0672025, -0.9656868, 1.89931, 1, 1, 1, 1, 1,
0.07109386, -0.4430955, 2.502032, 1, 1, 1, 1, 1,
0.07332654, 1.318843, 0.3804435, 0, 0, 1, 1, 1,
0.07399659, -0.8630005, 2.064063, 1, 0, 0, 1, 1,
0.07731497, 0.300928, 1.362857, 1, 0, 0, 1, 1,
0.08149559, -0.8782064, 3.547397, 1, 0, 0, 1, 1,
0.08364545, 0.680486, 0.6295782, 1, 0, 0, 1, 1,
0.08404077, 0.6072683, 0.2292105, 1, 0, 0, 1, 1,
0.08839571, 0.04567981, 0.7161185, 0, 0, 0, 1, 1,
0.09027576, -0.0922285, 3.28472, 0, 0, 0, 1, 1,
0.09074943, -0.684365, 4.36024, 0, 0, 0, 1, 1,
0.09086759, 0.5171622, -2.048619, 0, 0, 0, 1, 1,
0.09128258, 0.07835693, 2.468911, 0, 0, 0, 1, 1,
0.09177413, 2.251863, -0.8560228, 0, 0, 0, 1, 1,
0.1000263, -1.594039, 4.715445, 0, 0, 0, 1, 1,
0.1022743, -0.2000427, 1.618846, 1, 1, 1, 1, 1,
0.1034041, -0.8680379, 2.689573, 1, 1, 1, 1, 1,
0.1060115, 2.52046, 0.1986278, 1, 1, 1, 1, 1,
0.1071544, -0.7389164, 1.278014, 1, 1, 1, 1, 1,
0.1072507, -1.019603, 3.638639, 1, 1, 1, 1, 1,
0.1073342, 1.585325, 0.1722444, 1, 1, 1, 1, 1,
0.1077655, 0.0007558757, 1.472244, 1, 1, 1, 1, 1,
0.1098495, 1.099607, -1.515223, 1, 1, 1, 1, 1,
0.1106297, 2.142012, 0.0532658, 1, 1, 1, 1, 1,
0.1157601, 2.20267, 0.7865301, 1, 1, 1, 1, 1,
0.1198097, 0.260827, -0.1510021, 1, 1, 1, 1, 1,
0.1217854, 0.4551605, 1.23151, 1, 1, 1, 1, 1,
0.1300052, -0.09710421, 2.704543, 1, 1, 1, 1, 1,
0.1320156, -0.07747, 2.093285, 1, 1, 1, 1, 1,
0.1344875, 1.20476, 1.023193, 1, 1, 1, 1, 1,
0.1366781, 1.005454, -1.469089, 0, 0, 1, 1, 1,
0.1381451, 1.115173, 1.365689, 1, 0, 0, 1, 1,
0.1382452, 0.6105345, 0.3108573, 1, 0, 0, 1, 1,
0.1393674, -0.5142017, 3.556103, 1, 0, 0, 1, 1,
0.1395249, -0.2896002, 1.750614, 1, 0, 0, 1, 1,
0.1407177, -0.04363742, 4.465833, 1, 0, 0, 1, 1,
0.1441536, 0.0363011, 1.69706, 0, 0, 0, 1, 1,
0.148899, 1.871681, -1.659546, 0, 0, 0, 1, 1,
0.1506715, -0.3830226, 2.132139, 0, 0, 0, 1, 1,
0.1508281, -1.077421, 3.047233, 0, 0, 0, 1, 1,
0.1533234, -0.8605898, 2.652243, 0, 0, 0, 1, 1,
0.153435, -1.300768, 2.223109, 0, 0, 0, 1, 1,
0.1587146, 1.974232, 0.09134185, 0, 0, 0, 1, 1,
0.1590096, 0.6223384, -0.09493762, 1, 1, 1, 1, 1,
0.1644433, -0.6156703, 2.542345, 1, 1, 1, 1, 1,
0.1644471, -0.7408309, 2.265301, 1, 1, 1, 1, 1,
0.1668179, 0.4383341, 0.3590173, 1, 1, 1, 1, 1,
0.171064, 1.521191, 2.004951, 1, 1, 1, 1, 1,
0.1719949, 0.7710483, -0.9442754, 1, 1, 1, 1, 1,
0.175273, -2.688233, 4.235719, 1, 1, 1, 1, 1,
0.1763731, -0.3488204, 3.681276, 1, 1, 1, 1, 1,
0.1804941, 0.5841477, 0.3955842, 1, 1, 1, 1, 1,
0.1810244, 0.5409074, -0.1311356, 1, 1, 1, 1, 1,
0.1812078, -1.571022, 1.627521, 1, 1, 1, 1, 1,
0.1830784, 1.223674, 0.2894383, 1, 1, 1, 1, 1,
0.1842276, -0.002847262, 1.296534, 1, 1, 1, 1, 1,
0.1856043, -0.3705711, 2.371141, 1, 1, 1, 1, 1,
0.1884239, -0.5884872, 1.540973, 1, 1, 1, 1, 1,
0.1886186, -0.6384153, 1.793554, 0, 0, 1, 1, 1,
0.1889953, 0.02851152, 1.722895, 1, 0, 0, 1, 1,
0.1911179, 0.5525734, 2.017926, 1, 0, 0, 1, 1,
0.1922535, 1.050868, -0.4716127, 1, 0, 0, 1, 1,
0.1928205, 0.9864044, -1.036943, 1, 0, 0, 1, 1,
0.1938757, 0.4082045, 1.230365, 1, 0, 0, 1, 1,
0.194851, -1.415778, 2.170415, 0, 0, 0, 1, 1,
0.2014623, -0.1959222, 2.793678, 0, 0, 0, 1, 1,
0.2037328, -1.715264, 4.304291, 0, 0, 0, 1, 1,
0.2064925, 0.06125808, 0.9105088, 0, 0, 0, 1, 1,
0.2092672, -0.811249, 3.426266, 0, 0, 0, 1, 1,
0.2125287, 0.736793, 0.1642922, 0, 0, 0, 1, 1,
0.2165049, -0.230309, 1.359371, 0, 0, 0, 1, 1,
0.2193389, -0.08439243, 2.110036, 1, 1, 1, 1, 1,
0.2203166, -0.6977288, 2.487348, 1, 1, 1, 1, 1,
0.2246087, 0.101689, 0.4325114, 1, 1, 1, 1, 1,
0.2252108, -1.383591, 3.844853, 1, 1, 1, 1, 1,
0.2292788, 0.03887915, -0.2599658, 1, 1, 1, 1, 1,
0.2334738, 0.01646571, 2.278024, 1, 1, 1, 1, 1,
0.2351246, -0.7617208, 4.495719, 1, 1, 1, 1, 1,
0.2378329, 0.7212191, -1.356536, 1, 1, 1, 1, 1,
0.2446517, 0.8949239, 0.7038314, 1, 1, 1, 1, 1,
0.2474412, 0.7235532, -0.2724923, 1, 1, 1, 1, 1,
0.2507417, 0.1288424, 0.4846357, 1, 1, 1, 1, 1,
0.2545259, -1.664448, 3.180425, 1, 1, 1, 1, 1,
0.2574728, 0.4499901, -0.2507846, 1, 1, 1, 1, 1,
0.2597563, 0.3867708, 1.288872, 1, 1, 1, 1, 1,
0.2750379, -0.0388632, 1.786309, 1, 1, 1, 1, 1,
0.2764475, 0.5901449, 1.121891, 0, 0, 1, 1, 1,
0.2774767, 0.5395455, -1.051888, 1, 0, 0, 1, 1,
0.277794, -0.696743, 2.658109, 1, 0, 0, 1, 1,
0.28042, -0.06598984, 0.4933276, 1, 0, 0, 1, 1,
0.2842003, -0.8381117, 2.48555, 1, 0, 0, 1, 1,
0.28941, -1.487332, 2.678868, 1, 0, 0, 1, 1,
0.2937036, -1.133231, 4.235718, 0, 0, 0, 1, 1,
0.2955118, -1.671228, 2.130329, 0, 0, 0, 1, 1,
0.2979365, -1.469752, 2.132804, 0, 0, 0, 1, 1,
0.3054236, -2.208316, 4.659708, 0, 0, 0, 1, 1,
0.3058916, 0.8685884, 0.1749508, 0, 0, 0, 1, 1,
0.3087663, 1.745828, 1.246499, 0, 0, 0, 1, 1,
0.3090685, -1.332582, 2.433534, 0, 0, 0, 1, 1,
0.3182844, 2.469417, 1.582668, 1, 1, 1, 1, 1,
0.3256384, 0.239154, 0.326487, 1, 1, 1, 1, 1,
0.3257282, 0.6402974, 0.5864235, 1, 1, 1, 1, 1,
0.3303719, 1.145026, 0.4790238, 1, 1, 1, 1, 1,
0.3316754, -0.3093394, 2.003035, 1, 1, 1, 1, 1,
0.3322823, 0.2491733, 0.8107406, 1, 1, 1, 1, 1,
0.3338373, -0.6283995, 3.870024, 1, 1, 1, 1, 1,
0.3342541, 0.7671332, 0.7502564, 1, 1, 1, 1, 1,
0.3345278, 2.649584, 0.2352974, 1, 1, 1, 1, 1,
0.3357112, -1.366894, 3.761408, 1, 1, 1, 1, 1,
0.3408889, -0.3357065, 3.85361, 1, 1, 1, 1, 1,
0.342557, -0.1967554, 3.030146, 1, 1, 1, 1, 1,
0.3428543, 0.8949433, 0.9691989, 1, 1, 1, 1, 1,
0.3442454, 0.2008321, 0.8843452, 1, 1, 1, 1, 1,
0.3447697, 0.07464181, 1.231462, 1, 1, 1, 1, 1,
0.3458368, 0.5219666, 1.21834, 0, 0, 1, 1, 1,
0.3527288, 1.565097, -1.036294, 1, 0, 0, 1, 1,
0.352829, 1.581692, -0.2180583, 1, 0, 0, 1, 1,
0.3534751, -0.6132115, 2.117205, 1, 0, 0, 1, 1,
0.3562632, 1.088814, -1.07847, 1, 0, 0, 1, 1,
0.3603951, 0.4224935, 1.118033, 1, 0, 0, 1, 1,
0.3712438, 0.7611033, 0.5361826, 0, 0, 0, 1, 1,
0.3713172, -0.1876286, 2.467266, 0, 0, 0, 1, 1,
0.3715646, -0.05392717, 2.504955, 0, 0, 0, 1, 1,
0.3737539, -2.848711, 2.778804, 0, 0, 0, 1, 1,
0.3837532, 3.379714, -1.609921, 0, 0, 0, 1, 1,
0.3839558, -0.04655124, 1.770544, 0, 0, 0, 1, 1,
0.3873833, 2.300616, -1.042299, 0, 0, 0, 1, 1,
0.38967, -1.445526, 3.459224, 1, 1, 1, 1, 1,
0.397662, 0.04965318, -1.00246, 1, 1, 1, 1, 1,
0.3987154, 1.341322, -0.460355, 1, 1, 1, 1, 1,
0.4015421, -0.4285419, 1.101043, 1, 1, 1, 1, 1,
0.4029127, -0.9355496, 1.885701, 1, 1, 1, 1, 1,
0.4046803, 0.3348744, -0.2672391, 1, 1, 1, 1, 1,
0.4069116, 0.2052159, 0.7990395, 1, 1, 1, 1, 1,
0.4071651, 1.185237, -0.8717976, 1, 1, 1, 1, 1,
0.4107247, -1.339786, 3.79528, 1, 1, 1, 1, 1,
0.4111342, -0.08765952, 0.598096, 1, 1, 1, 1, 1,
0.4111737, 1.165624, -0.6232975, 1, 1, 1, 1, 1,
0.4163143, -0.4824014, 3.310924, 1, 1, 1, 1, 1,
0.416336, -0.153732, 2.309032, 1, 1, 1, 1, 1,
0.4212625, -0.9733101, 4.576063, 1, 1, 1, 1, 1,
0.4214195, 0.2219781, 1.014422, 1, 1, 1, 1, 1,
0.4233134, -0.6665811, 3.642876, 0, 0, 1, 1, 1,
0.4233144, 0.6677722, 0.1322418, 1, 0, 0, 1, 1,
0.4241271, 1.783957, 2.939204, 1, 0, 0, 1, 1,
0.4318344, 1.878119, -0.04311641, 1, 0, 0, 1, 1,
0.4320491, -0.4819111, 2.26423, 1, 0, 0, 1, 1,
0.4368496, 1.230478, 1.190727, 1, 0, 0, 1, 1,
0.4370966, -1.633774, 2.797412, 0, 0, 0, 1, 1,
0.4390374, 0.1577325, 2.668173, 0, 0, 0, 1, 1,
0.440812, 0.1113529, 2.362411, 0, 0, 0, 1, 1,
0.4473237, -0.5976934, 2.738589, 0, 0, 0, 1, 1,
0.4514849, 0.07286338, 0.3343342, 0, 0, 0, 1, 1,
0.4583645, -0.6871604, 1.242657, 0, 0, 0, 1, 1,
0.4625346, 0.09417702, 1.056191, 0, 0, 0, 1, 1,
0.4638697, 0.6796444, 2.24781, 1, 1, 1, 1, 1,
0.4671032, -0.4137746, 4.331519, 1, 1, 1, 1, 1,
0.4675385, 0.2809027, 0.02867048, 1, 1, 1, 1, 1,
0.4687191, 0.6878186, 0.9380883, 1, 1, 1, 1, 1,
0.470393, -0.6060415, 2.097035, 1, 1, 1, 1, 1,
0.4754681, -0.130534, 1.50962, 1, 1, 1, 1, 1,
0.4799772, -0.5746953, 2.335875, 1, 1, 1, 1, 1,
0.4821295, -0.2514797, 1.9233, 1, 1, 1, 1, 1,
0.4863405, 0.2051503, 3.330611, 1, 1, 1, 1, 1,
0.4883211, 0.089778, 2.559634, 1, 1, 1, 1, 1,
0.4932103, -1.428615, 1.178471, 1, 1, 1, 1, 1,
0.4953884, 0.5222988, 0.8881263, 1, 1, 1, 1, 1,
0.5024019, 1.424993, 0.3574615, 1, 1, 1, 1, 1,
0.5092605, 1.090331, 1.697569, 1, 1, 1, 1, 1,
0.5094393, 1.224649, 0.1298528, 1, 1, 1, 1, 1,
0.5135465, -0.3492013, 1.160706, 0, 0, 1, 1, 1,
0.5242965, -0.5059047, 0.3222693, 1, 0, 0, 1, 1,
0.5322402, -0.1958511, 1.405142, 1, 0, 0, 1, 1,
0.5326012, 0.09463208, 1.514293, 1, 0, 0, 1, 1,
0.5340456, -2.015693, 1.652188, 1, 0, 0, 1, 1,
0.534502, -0.9423673, 0.4266545, 1, 0, 0, 1, 1,
0.5382584, -0.9828534, 2.775477, 0, 0, 0, 1, 1,
0.5382686, -1.172671, 2.803328, 0, 0, 0, 1, 1,
0.5408056, 0.8825532, -0.5492344, 0, 0, 0, 1, 1,
0.5452621, -0.3439248, 2.986454, 0, 0, 0, 1, 1,
0.5478352, 0.1076096, 1.21034, 0, 0, 0, 1, 1,
0.552705, 0.9538317, -1.419059, 0, 0, 0, 1, 1,
0.5571495, -0.4497457, 2.842394, 0, 0, 0, 1, 1,
0.5596009, -0.5390404, 1.418947, 1, 1, 1, 1, 1,
0.56029, 0.9842542, 0.3260196, 1, 1, 1, 1, 1,
0.5683863, 1.294484, 0.6860856, 1, 1, 1, 1, 1,
0.5688156, 0.2475083, 1.035831, 1, 1, 1, 1, 1,
0.5699232, -0.514632, 3.176599, 1, 1, 1, 1, 1,
0.5702742, 0.4767458, 1.398086, 1, 1, 1, 1, 1,
0.5736761, -0.0001699423, 2.069006, 1, 1, 1, 1, 1,
0.582905, 1.340756, -0.1950891, 1, 1, 1, 1, 1,
0.5935102, -1.543622, 2.897699, 1, 1, 1, 1, 1,
0.595385, -0.1357506, 0.7830973, 1, 1, 1, 1, 1,
0.5984119, -0.8380267, 2.69526, 1, 1, 1, 1, 1,
0.6005423, 0.7827283, 0.6401328, 1, 1, 1, 1, 1,
0.6013945, -0.2123869, 1.267972, 1, 1, 1, 1, 1,
0.6022544, -0.1759327, 3.134926, 1, 1, 1, 1, 1,
0.6068491, 0.9257032, 1.045066, 1, 1, 1, 1, 1,
0.6120107, -1.22054, 4.819411, 0, 0, 1, 1, 1,
0.6125873, -0.161045, 2.635791, 1, 0, 0, 1, 1,
0.6137948, 1.891322, -1.123085, 1, 0, 0, 1, 1,
0.6140742, 0.4710178, 2.371792, 1, 0, 0, 1, 1,
0.6202864, 0.2696345, 1.098915, 1, 0, 0, 1, 1,
0.6261848, -1.143022, 4.70613, 1, 0, 0, 1, 1,
0.6262323, 0.1113279, 0.9308515, 0, 0, 0, 1, 1,
0.6285926, 1.21641, 0.5440117, 0, 0, 0, 1, 1,
0.631368, -0.1315779, 3.323661, 0, 0, 0, 1, 1,
0.6317902, 0.4949761, 0.9183453, 0, 0, 0, 1, 1,
0.6356989, -0.6487899, 1.775339, 0, 0, 0, 1, 1,
0.6376795, 0.6700654, -0.01029641, 0, 0, 0, 1, 1,
0.6428527, 1.137524, 0.656099, 0, 0, 0, 1, 1,
0.6444198, 0.3639104, 2.113728, 1, 1, 1, 1, 1,
0.6462994, -1.160815, 3.348746, 1, 1, 1, 1, 1,
0.6487669, 0.222997, 1.104277, 1, 1, 1, 1, 1,
0.6508679, 1.174811, -0.3723597, 1, 1, 1, 1, 1,
0.6530015, -0.7537027, 1.097994, 1, 1, 1, 1, 1,
0.6537718, 0.06881678, 0.5932919, 1, 1, 1, 1, 1,
0.6567424, -0.148357, 1.475222, 1, 1, 1, 1, 1,
0.6573687, 0.09178717, 1.356354, 1, 1, 1, 1, 1,
0.6587302, -0.280545, 3.285023, 1, 1, 1, 1, 1,
0.6598572, 2.008387, -0.5869229, 1, 1, 1, 1, 1,
0.6629506, 1.535245, -0.2002105, 1, 1, 1, 1, 1,
0.6646382, -1.201933, 2.621196, 1, 1, 1, 1, 1,
0.6660005, -0.1905316, 0.5531332, 1, 1, 1, 1, 1,
0.6671369, -1.743415, 2.749196, 1, 1, 1, 1, 1,
0.6757835, -0.8253127, 2.813815, 1, 1, 1, 1, 1,
0.6763033, -1.504211, 2.516848, 0, 0, 1, 1, 1,
0.6784512, -0.5561017, 3.40608, 1, 0, 0, 1, 1,
0.6825097, 1.17136, 0.3220609, 1, 0, 0, 1, 1,
0.6845083, 0.6918602, 0.5458217, 1, 0, 0, 1, 1,
0.6865348, -0.5939204, 1.118355, 1, 0, 0, 1, 1,
0.6919283, 0.1256262, 1.449371, 1, 0, 0, 1, 1,
0.6925335, -1.896963, 3.223771, 0, 0, 0, 1, 1,
0.6948309, 0.4941565, 0.9965924, 0, 0, 0, 1, 1,
0.697211, 0.2134492, 2.697574, 0, 0, 0, 1, 1,
0.6982777, -0.57886, 3.317573, 0, 0, 0, 1, 1,
0.6988502, -0.03753947, 0.8635738, 0, 0, 0, 1, 1,
0.7005965, 1.020065, 0.8912538, 0, 0, 0, 1, 1,
0.7052075, -0.009847822, 1.09274, 0, 0, 0, 1, 1,
0.7113268, -1.062341, 4.200659, 1, 1, 1, 1, 1,
0.7163436, 0.8379769, 0.7802148, 1, 1, 1, 1, 1,
0.7174819, 1.387564, 0.7610512, 1, 1, 1, 1, 1,
0.7225761, 0.09222078, 0.6768091, 1, 1, 1, 1, 1,
0.7271867, -0.6805474, 2.80136, 1, 1, 1, 1, 1,
0.7401305, -0.5450265, 3.389527, 1, 1, 1, 1, 1,
0.7405971, -0.6868187, 1.870609, 1, 1, 1, 1, 1,
0.7420518, 0.5616719, 0.7281957, 1, 1, 1, 1, 1,
0.7421611, 0.1095638, 2.453689, 1, 1, 1, 1, 1,
0.744263, 2.264164, -1.949969, 1, 1, 1, 1, 1,
0.7480349, 0.1032501, 0.5722681, 1, 1, 1, 1, 1,
0.7611907, 0.9621703, -0.3227163, 1, 1, 1, 1, 1,
0.7612936, 0.338749, 3.099268, 1, 1, 1, 1, 1,
0.7627674, 0.5889998, -0.3962151, 1, 1, 1, 1, 1,
0.765142, 0.7265286, -0.002518131, 1, 1, 1, 1, 1,
0.7697864, -0.6234367, 1.526177, 0, 0, 1, 1, 1,
0.7706851, 1.411846, -1.092996, 1, 0, 0, 1, 1,
0.7766016, 1.203343, -0.3127326, 1, 0, 0, 1, 1,
0.7788839, -0.8953304, 1.593924, 1, 0, 0, 1, 1,
0.7801884, -1.598354, 3.938319, 1, 0, 0, 1, 1,
0.7810047, -0.9626807, 2.312045, 1, 0, 0, 1, 1,
0.7864034, -2.857194, 3.078852, 0, 0, 0, 1, 1,
0.7968898, -0.905602, 2.35977, 0, 0, 0, 1, 1,
0.7979215, -0.3278503, 0.9537985, 0, 0, 0, 1, 1,
0.8006437, -0.563319, 3.08047, 0, 0, 0, 1, 1,
0.8098605, -2.266293, 1.465563, 0, 0, 0, 1, 1,
0.81298, 0.5299079, -2.138944, 0, 0, 0, 1, 1,
0.8133589, -0.2595014, 1.761616, 0, 0, 0, 1, 1,
0.8167315, -0.4544725, 3.335435, 1, 1, 1, 1, 1,
0.8169535, 0.01655279, 1.620149, 1, 1, 1, 1, 1,
0.8186866, -0.1349659, 0.7322178, 1, 1, 1, 1, 1,
0.8314116, -0.672756, 3.610336, 1, 1, 1, 1, 1,
0.836702, 1.192121, 1.021795, 1, 1, 1, 1, 1,
0.8382125, 0.6402907, 0.8050343, 1, 1, 1, 1, 1,
0.8392138, -0.4613747, 2.672182, 1, 1, 1, 1, 1,
0.8404301, 0.2265216, 1.014369, 1, 1, 1, 1, 1,
0.8422089, -1.427733, 0.6713845, 1, 1, 1, 1, 1,
0.8477986, 0.681418, 1.428976, 1, 1, 1, 1, 1,
0.8478562, -0.4142468, 2.819253, 1, 1, 1, 1, 1,
0.8478653, 0.3333477, 0.8250204, 1, 1, 1, 1, 1,
0.8561862, -0.4754341, 2.384203, 1, 1, 1, 1, 1,
0.8565126, 1.639181, 1.223582, 1, 1, 1, 1, 1,
0.8582315, 1.588821, -0.4541106, 1, 1, 1, 1, 1,
0.8631378, 0.9685036, -0.2015634, 0, 0, 1, 1, 1,
0.8674148, 0.852771, 1.488382, 1, 0, 0, 1, 1,
0.8676072, -0.5516204, 2.390672, 1, 0, 0, 1, 1,
0.8698396, -0.6578871, 3.100127, 1, 0, 0, 1, 1,
0.8723066, -0.3492266, 1.006721, 1, 0, 0, 1, 1,
0.8785199, 1.148859, 1.10515, 1, 0, 0, 1, 1,
0.8854892, 1.153969, 0.1410851, 0, 0, 0, 1, 1,
0.8899904, 1.02409, 0.5080597, 0, 0, 0, 1, 1,
0.890478, 1.579419, -0.380753, 0, 0, 0, 1, 1,
0.8970761, -0.4895188, 1.247247, 0, 0, 0, 1, 1,
0.8981135, 1.069103, 0.621869, 0, 0, 0, 1, 1,
0.898519, -2.207776, 3.414458, 0, 0, 0, 1, 1,
0.9173769, 0.235922, 2.357303, 0, 0, 0, 1, 1,
0.9214716, 0.1894625, 1.46439, 1, 1, 1, 1, 1,
0.922374, -0.363076, 3.114172, 1, 1, 1, 1, 1,
0.9249627, 0.2171156, 3.091475, 1, 1, 1, 1, 1,
0.9276293, -0.2835325, 1.7897, 1, 1, 1, 1, 1,
0.930142, 1.743201, 0.5644038, 1, 1, 1, 1, 1,
0.9410469, -2.304985, 2.242748, 1, 1, 1, 1, 1,
0.9507001, -0.02821401, 2.659303, 1, 1, 1, 1, 1,
0.9525529, 1.69791, 0.1306631, 1, 1, 1, 1, 1,
0.9568049, -0.2986651, -0.40799, 1, 1, 1, 1, 1,
0.9835863, -0.7150118, 1.818678, 1, 1, 1, 1, 1,
0.9873483, 0.7996875, 3.414241, 1, 1, 1, 1, 1,
0.9874079, 1.359899, 0.6894096, 1, 1, 1, 1, 1,
0.9889714, -0.4084183, 2.122404, 1, 1, 1, 1, 1,
0.9894538, 0.479008, 0.8667977, 1, 1, 1, 1, 1,
0.9948214, 1.906033, 0.5508146, 1, 1, 1, 1, 1,
0.9967463, -1.243591, 3.043567, 0, 0, 1, 1, 1,
1.001945, -0.7120259, 1.76362, 1, 0, 0, 1, 1,
1.003597, 0.6142114, 1.214581, 1, 0, 0, 1, 1,
1.005091, 0.2104915, 1.105534, 1, 0, 0, 1, 1,
1.00982, 1.88283, 0.6332758, 1, 0, 0, 1, 1,
1.01004, 0.788105, -0.2693995, 1, 0, 0, 1, 1,
1.011779, 0.2251167, 1.85384, 0, 0, 0, 1, 1,
1.012488, -0.2688912, 1.112497, 0, 0, 0, 1, 1,
1.017266, 0.2291739, 0.1165284, 0, 0, 0, 1, 1,
1.020705, 1.081862, 0.2201308, 0, 0, 0, 1, 1,
1.029921, 0.6997064, 0.4451425, 0, 0, 0, 1, 1,
1.032445, 1.219842, 2.06373, 0, 0, 0, 1, 1,
1.033932, -0.2324551, 2.474748, 0, 0, 0, 1, 1,
1.038933, 2.265744, 1.303529, 1, 1, 1, 1, 1,
1.038958, 2.259501, -1.439413, 1, 1, 1, 1, 1,
1.040098, -0.1953855, 0.2782116, 1, 1, 1, 1, 1,
1.042745, -1.222077, 1.755318, 1, 1, 1, 1, 1,
1.046367, -0.8305634, 0.9485125, 1, 1, 1, 1, 1,
1.047742, -0.6719911, 2.949586, 1, 1, 1, 1, 1,
1.051893, 0.04917134, 0.4106428, 1, 1, 1, 1, 1,
1.066915, 0.7918749, 0.1084838, 1, 1, 1, 1, 1,
1.070487, 1.007378, 0.6326168, 1, 1, 1, 1, 1,
1.073659, 0.8770541, 0.663465, 1, 1, 1, 1, 1,
1.073711, -1.89142, 2.047334, 1, 1, 1, 1, 1,
1.096436, -1.771746, 2.476322, 1, 1, 1, 1, 1,
1.099981, -0.5127029, 2.214911, 1, 1, 1, 1, 1,
1.10802, -1.07087, 0.5203744, 1, 1, 1, 1, 1,
1.11746, 1.170362, 0.6154005, 1, 1, 1, 1, 1,
1.119641, -0.3870426, 1.758019, 0, 0, 1, 1, 1,
1.119755, -1.920401, 4.406309, 1, 0, 0, 1, 1,
1.120325, -0.3484308, 1.737613, 1, 0, 0, 1, 1,
1.126181, -0.8405484, 2.573992, 1, 0, 0, 1, 1,
1.12646, 1.249492, 0.3275047, 1, 0, 0, 1, 1,
1.126889, -1.031103, 2.25329, 1, 0, 0, 1, 1,
1.136301, -0.0450633, 2.981559, 0, 0, 0, 1, 1,
1.140693, -0.03615202, 1.284106, 0, 0, 0, 1, 1,
1.14101, -0.9736449, 3.29987, 0, 0, 0, 1, 1,
1.14385, 1.128246, -0.04235646, 0, 0, 0, 1, 1,
1.144091, 0.7518594, -0.337097, 0, 0, 0, 1, 1,
1.145937, 0.7773157, 1.648714, 0, 0, 0, 1, 1,
1.148185, -0.40797, 2.185481, 0, 0, 0, 1, 1,
1.150416, -0.788777, 2.626451, 1, 1, 1, 1, 1,
1.150594, 1.038713, 2.495765, 1, 1, 1, 1, 1,
1.152109, 0.380351, 1.352066, 1, 1, 1, 1, 1,
1.162858, 1.147545, 2.155666, 1, 1, 1, 1, 1,
1.167702, 0.8943697, -0.1185731, 1, 1, 1, 1, 1,
1.167791, 0.601541, 1.261328, 1, 1, 1, 1, 1,
1.16806, 0.4200139, 1.166106, 1, 1, 1, 1, 1,
1.170685, 0.5094079, 1.05407, 1, 1, 1, 1, 1,
1.171642, 0.2450892, 1.523634, 1, 1, 1, 1, 1,
1.188902, 1.089829, -0.0449045, 1, 1, 1, 1, 1,
1.197709, -0.3814509, 0.4113021, 1, 1, 1, 1, 1,
1.200184, 0.9062732, 1.822065, 1, 1, 1, 1, 1,
1.202064, 0.1686134, 2.119072, 1, 1, 1, 1, 1,
1.202424, 0.1718588, 0.9500894, 1, 1, 1, 1, 1,
1.205825, 0.4099964, 1.195354, 1, 1, 1, 1, 1,
1.207551, 0.7632894, -0.2610244, 0, 0, 1, 1, 1,
1.216771, 0.02130771, 2.709714, 1, 0, 0, 1, 1,
1.217551, -1.388077, 2.790516, 1, 0, 0, 1, 1,
1.219158, -2.210815, 1.868629, 1, 0, 0, 1, 1,
1.220225, -1.21983, 2.139783, 1, 0, 0, 1, 1,
1.221914, 0.3627168, -0.1559151, 1, 0, 0, 1, 1,
1.225657, 0.4974104, 0.3860637, 0, 0, 0, 1, 1,
1.236051, -0.4939056, 2.124799, 0, 0, 0, 1, 1,
1.237317, 0.2304729, 0.9983944, 0, 0, 0, 1, 1,
1.239092, 0.2446549, 1.70339, 0, 0, 0, 1, 1,
1.240701, 0.5906106, 3.718327, 0, 0, 0, 1, 1,
1.244808, -0.1912517, 1.599122, 0, 0, 0, 1, 1,
1.244852, -1.304957, 1.95577, 0, 0, 0, 1, 1,
1.250295, 1.208341, 0.5642038, 1, 1, 1, 1, 1,
1.263374, -1.07796, 2.666924, 1, 1, 1, 1, 1,
1.283895, -1.873744, 2.930613, 1, 1, 1, 1, 1,
1.287452, -0.3734509, 1.513521, 1, 1, 1, 1, 1,
1.294843, 0.01180787, 0.5753855, 1, 1, 1, 1, 1,
1.313541, 0.7195471, 1.352881, 1, 1, 1, 1, 1,
1.314322, -2.543761, 4.31305, 1, 1, 1, 1, 1,
1.320325, 0.4069423, 2.842235, 1, 1, 1, 1, 1,
1.323273, 1.836156, -0.7187963, 1, 1, 1, 1, 1,
1.325933, -0.7639883, -0.409485, 1, 1, 1, 1, 1,
1.326183, -0.4791917, 2.966376, 1, 1, 1, 1, 1,
1.362391, -0.8938423, 2.855128, 1, 1, 1, 1, 1,
1.364651, -1.163423, 1.532996, 1, 1, 1, 1, 1,
1.372606, 0.08169256, 2.572654, 1, 1, 1, 1, 1,
1.373307, 0.1251782, 1.980056, 1, 1, 1, 1, 1,
1.389504, 0.7407632, -0.1790999, 0, 0, 1, 1, 1,
1.413088, 1.116852, 1.266843, 1, 0, 0, 1, 1,
1.419471, -0.9195565, 2.528885, 1, 0, 0, 1, 1,
1.424445, -0.3239521, 0.7298042, 1, 0, 0, 1, 1,
1.429343, 0.3925483, 0.4384444, 1, 0, 0, 1, 1,
1.434859, 0.7508953, 0.7610171, 1, 0, 0, 1, 1,
1.459625, 0.006079755, 1.267344, 0, 0, 0, 1, 1,
1.491564, -0.2582856, 2.059696, 0, 0, 0, 1, 1,
1.497945, 0.0522618, 0.3063826, 0, 0, 0, 1, 1,
1.49952, 0.5315592, -1.121956, 0, 0, 0, 1, 1,
1.49968, -0.08603066, 1.776517, 0, 0, 0, 1, 1,
1.506565, -0.6689814, 4.609279, 0, 0, 0, 1, 1,
1.50927, -1.042924, 1.874753, 0, 0, 0, 1, 1,
1.510569, 0.04006437, 0.521374, 1, 1, 1, 1, 1,
1.511634, -0.9445581, 1.059123, 1, 1, 1, 1, 1,
1.514192, 0.07116041, 1.314921, 1, 1, 1, 1, 1,
1.514585, 0.1748015, 1.305639, 1, 1, 1, 1, 1,
1.51916, -0.0738536, 1.310077, 1, 1, 1, 1, 1,
1.524312, 0.01700038, 0.4988579, 1, 1, 1, 1, 1,
1.529013, -0.3363903, 1.880735, 1, 1, 1, 1, 1,
1.557303, 0.8793557, 1.946761, 1, 1, 1, 1, 1,
1.559246, -0.3601256, 1.879434, 1, 1, 1, 1, 1,
1.562482, -0.1580971, 2.409742, 1, 1, 1, 1, 1,
1.598491, 0.08678181, 1.978199, 1, 1, 1, 1, 1,
1.605449, -0.6645094, 1.532739, 1, 1, 1, 1, 1,
1.606427, -0.2494093, 0.3574809, 1, 1, 1, 1, 1,
1.614717, -1.249358, 1.236084, 1, 1, 1, 1, 1,
1.616117, -0.7921067, 3.632569, 1, 1, 1, 1, 1,
1.62634, 0.1843823, 1.130183, 0, 0, 1, 1, 1,
1.628276, 0.626305, -0.8500019, 1, 0, 0, 1, 1,
1.628694, -0.9369747, 0.1818924, 1, 0, 0, 1, 1,
1.64748, -1.095657, 4.706405, 1, 0, 0, 1, 1,
1.660989, -0.08818449, 1.519915, 1, 0, 0, 1, 1,
1.661914, 0.247449, 1.013723, 1, 0, 0, 1, 1,
1.678801, 1.100891, 1.689024, 0, 0, 0, 1, 1,
1.680805, -0.2793903, 2.119164, 0, 0, 0, 1, 1,
1.701201, -0.8984818, 2.531399, 0, 0, 0, 1, 1,
1.722273, -1.441797, 3.340475, 0, 0, 0, 1, 1,
1.722283, -0.01628458, -0.6930613, 0, 0, 0, 1, 1,
1.728245, 1.336025, 0.1121402, 0, 0, 0, 1, 1,
1.766727, -1.549861, 1.877847, 0, 0, 0, 1, 1,
1.772368, 0.6976268, 1.756232, 1, 1, 1, 1, 1,
1.78634, 1.892322, -1.145802, 1, 1, 1, 1, 1,
1.798942, 0.9793557, 1.02095, 1, 1, 1, 1, 1,
1.804741, -0.2638427, 2.601779, 1, 1, 1, 1, 1,
1.83692, -0.2186134, 1.297614, 1, 1, 1, 1, 1,
1.838465, -1.052125, 1.541994, 1, 1, 1, 1, 1,
1.862183, -0.2909469, 1.531374, 1, 1, 1, 1, 1,
1.863003, 0.1669768, 2.588499, 1, 1, 1, 1, 1,
1.864788, -0.9476853, 3.834512, 1, 1, 1, 1, 1,
1.911471, 0.08372445, 1.33318, 1, 1, 1, 1, 1,
1.950395, 0.0145171, 1.292577, 1, 1, 1, 1, 1,
1.956062, 1.023915, 1.896977, 1, 1, 1, 1, 1,
1.957964, -1.066325, 2.039138, 1, 1, 1, 1, 1,
1.981763, 0.9656681, 0.4047241, 1, 1, 1, 1, 1,
1.991474, 1.214093, 2.167303, 1, 1, 1, 1, 1,
1.994338, -0.07790963, 1.956986, 0, 0, 1, 1, 1,
2.037117, -0.3461876, 1.912975, 1, 0, 0, 1, 1,
2.055117, 0.5108865, 1.629065, 1, 0, 0, 1, 1,
2.087757, 1.798175, 1.5219, 1, 0, 0, 1, 1,
2.100924, 0.1756062, 0.1391884, 1, 0, 0, 1, 1,
2.103691, -0.6217629, 1.522385, 1, 0, 0, 1, 1,
2.113581, -0.3323266, 1.509681, 0, 0, 0, 1, 1,
2.123057, 0.4610978, 1.431291, 0, 0, 0, 1, 1,
2.148088, 0.6819276, 3.034694, 0, 0, 0, 1, 1,
2.165052, 0.8294623, -0.7228418, 0, 0, 0, 1, 1,
2.193362, -0.4585511, 0.657936, 0, 0, 0, 1, 1,
2.252769, -1.10106, 1.81569, 0, 0, 0, 1, 1,
2.269148, -0.2274893, 2.718753, 0, 0, 0, 1, 1,
2.28042, 1.56102, 1.788584, 1, 1, 1, 1, 1,
2.289279, -2.037744, 4.61688, 1, 1, 1, 1, 1,
2.338732, -0.6827111, 0.221692, 1, 1, 1, 1, 1,
2.41975, -1.131476, 2.443325, 1, 1, 1, 1, 1,
2.494575, -0.7501209, 1.145839, 1, 1, 1, 1, 1,
2.512206, 0.9803649, 2.555302, 1, 1, 1, 1, 1,
2.569951, 1.456985, -0.3193079, 1, 1, 1, 1, 1
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
var radius = 9.137133;
var distance = 32.0938;
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
mvMatrix.translate( 0.1442118, -0.1535993, 0.2914503 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.0938);
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
