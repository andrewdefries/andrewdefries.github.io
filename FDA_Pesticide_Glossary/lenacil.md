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
-2.578652, -0.7282667, -1.863671, 1, 0, 0, 1,
-2.521891, 0.9002801, 0.5024931, 1, 0.007843138, 0, 1,
-2.50119, 0.4726813, -1.933806, 1, 0.01176471, 0, 1,
-2.492895, -0.458922, -2.160763, 1, 0.01960784, 0, 1,
-2.40682, 0.1237414, -0.2871198, 1, 0.02352941, 0, 1,
-2.377277, -0.2086628, -1.453622, 1, 0.03137255, 0, 1,
-2.311419, 0.02818121, -0.7374805, 1, 0.03529412, 0, 1,
-2.294016, 0.3220261, -1.592874, 1, 0.04313726, 0, 1,
-2.283525, -1.071219, -2.50804, 1, 0.04705882, 0, 1,
-2.222904, 0.3361523, -1.13678, 1, 0.05490196, 0, 1,
-2.100402, -0.9162545, -2.08874, 1, 0.05882353, 0, 1,
-2.081842, -0.1884685, -2.827034, 1, 0.06666667, 0, 1,
-2.07917, -0.8730063, -2.598555, 1, 0.07058824, 0, 1,
-2.019374, 0.2310666, -1.395522, 1, 0.07843138, 0, 1,
-2.009372, -0.3610916, -1.498392, 1, 0.08235294, 0, 1,
-1.994749, -0.03820166, 0.2799586, 1, 0.09019608, 0, 1,
-1.986948, -0.04327599, -1.802749, 1, 0.09411765, 0, 1,
-1.9676, 2.38222, -0.826682, 1, 0.1019608, 0, 1,
-1.954447, -0.3844263, 0.02440307, 1, 0.1098039, 0, 1,
-1.919729, 0.3775068, -1.66282, 1, 0.1137255, 0, 1,
-1.889218, 0.306457, 1.680815, 1, 0.1215686, 0, 1,
-1.883609, -0.1016062, -2.457169, 1, 0.1254902, 0, 1,
-1.881836, 1.065724, -0.9685409, 1, 0.1333333, 0, 1,
-1.87887, -0.5811784, -2.993017, 1, 0.1372549, 0, 1,
-1.872283, -1.350241, -2.203328, 1, 0.145098, 0, 1,
-1.836343, 0.709411, -2.207553, 1, 0.1490196, 0, 1,
-1.820962, -0.2603777, -1.040319, 1, 0.1568628, 0, 1,
-1.81106, 0.3037142, -1.566029, 1, 0.1607843, 0, 1,
-1.799216, 1.076634, -1.322609, 1, 0.1686275, 0, 1,
-1.7992, 0.7413546, 0.09553387, 1, 0.172549, 0, 1,
-1.798179, 1.087417, -1.902191, 1, 0.1803922, 0, 1,
-1.796277, -1.293308, -1.241345, 1, 0.1843137, 0, 1,
-1.787487, -0.5265138, -1.436916, 1, 0.1921569, 0, 1,
-1.77449, 0.5788183, -1.422423, 1, 0.1960784, 0, 1,
-1.7709, 0.2633621, -2.595701, 1, 0.2039216, 0, 1,
-1.765398, 0.8505015, -0.7825451, 1, 0.2117647, 0, 1,
-1.748572, 1.061594, -1.910421, 1, 0.2156863, 0, 1,
-1.738627, -0.1302551, -2.560336, 1, 0.2235294, 0, 1,
-1.737528, 0.1364659, -2.226016, 1, 0.227451, 0, 1,
-1.737017, -0.6044796, -1.529778, 1, 0.2352941, 0, 1,
-1.734195, 0.1443952, 0.1918664, 1, 0.2392157, 0, 1,
-1.733856, 0.6297454, -0.5316485, 1, 0.2470588, 0, 1,
-1.720466, -0.725019, -2.718769, 1, 0.2509804, 0, 1,
-1.713768, -0.0215124, -2.974027, 1, 0.2588235, 0, 1,
-1.710683, -1.033435, -0.5795727, 1, 0.2627451, 0, 1,
-1.708259, -0.510264, 0.1331345, 1, 0.2705882, 0, 1,
-1.706461, -0.1109651, -1.976998, 1, 0.2745098, 0, 1,
-1.706054, -0.9414519, -0.9726406, 1, 0.282353, 0, 1,
-1.688375, -1.014106, -2.12028, 1, 0.2862745, 0, 1,
-1.6848, -0.08543924, -1.641525, 1, 0.2941177, 0, 1,
-1.677702, -0.3029229, -2.656601, 1, 0.3019608, 0, 1,
-1.660367, 0.6899752, -2.564687, 1, 0.3058824, 0, 1,
-1.65891, 0.8340772, -1.320315, 1, 0.3137255, 0, 1,
-1.655663, 0.6953378, -2.472971, 1, 0.3176471, 0, 1,
-1.634692, -0.4314518, -0.8267944, 1, 0.3254902, 0, 1,
-1.632711, -0.5658389, -1.368221, 1, 0.3294118, 0, 1,
-1.62377, 0.03336921, -2.970209, 1, 0.3372549, 0, 1,
-1.621775, 0.913226, -0.02659082, 1, 0.3411765, 0, 1,
-1.588199, -0.4344805, -1.957003, 1, 0.3490196, 0, 1,
-1.587578, -1.683082, -1.361894, 1, 0.3529412, 0, 1,
-1.58027, -0.04474801, -1.388644, 1, 0.3607843, 0, 1,
-1.576372, 0.08263981, -2.930937, 1, 0.3647059, 0, 1,
-1.574763, 1.253693, -0.6643837, 1, 0.372549, 0, 1,
-1.566547, 0.4165614, 0.496335, 1, 0.3764706, 0, 1,
-1.564823, -0.4924123, -0.02087652, 1, 0.3843137, 0, 1,
-1.552433, -0.8543173, -2.349972, 1, 0.3882353, 0, 1,
-1.551313, -0.2676792, -2.645682, 1, 0.3960784, 0, 1,
-1.540675, 0.08063358, -1.050129, 1, 0.4039216, 0, 1,
-1.530725, 1.941469, -2.683061, 1, 0.4078431, 0, 1,
-1.523204, 2.577801, -0.06335939, 1, 0.4156863, 0, 1,
-1.508951, -1.296872, -1.198743, 1, 0.4196078, 0, 1,
-1.507185, -1.235118, -1.501408, 1, 0.427451, 0, 1,
-1.502726, 1.745117, -2.937264, 1, 0.4313726, 0, 1,
-1.489266, 1.10843, -1.049209, 1, 0.4392157, 0, 1,
-1.455761, -0.8435943, -2.748277, 1, 0.4431373, 0, 1,
-1.455053, 2.080478, -1.093795, 1, 0.4509804, 0, 1,
-1.451677, 1.890367, -2.26546, 1, 0.454902, 0, 1,
-1.443837, -0.05378184, 0.1972459, 1, 0.4627451, 0, 1,
-1.436291, 0.1003162, -1.768703, 1, 0.4666667, 0, 1,
-1.42747, 1.165048, -1.478476, 1, 0.4745098, 0, 1,
-1.426545, -1.763877, -2.314012, 1, 0.4784314, 0, 1,
-1.426022, -1.235323, -2.287401, 1, 0.4862745, 0, 1,
-1.425665, 0.1422637, -2.674618, 1, 0.4901961, 0, 1,
-1.402919, -0.3152706, 0.08758165, 1, 0.4980392, 0, 1,
-1.397968, -0.4772512, -0.5633247, 1, 0.5058824, 0, 1,
-1.396816, 1.372568, -1.933242, 1, 0.509804, 0, 1,
-1.395343, 0.8373896, 0.2624331, 1, 0.5176471, 0, 1,
-1.379631, 0.9261745, 0.2814969, 1, 0.5215687, 0, 1,
-1.368472, -0.6405594, -0.1530116, 1, 0.5294118, 0, 1,
-1.36631, -0.5387179, -1.685211, 1, 0.5333334, 0, 1,
-1.365261, 1.630407, -0.6517529, 1, 0.5411765, 0, 1,
-1.360819, -0.7032222, -3.491271, 1, 0.5450981, 0, 1,
-1.35723, 0.6672165, -2.038115, 1, 0.5529412, 0, 1,
-1.356197, 1.013503, -0.9941197, 1, 0.5568628, 0, 1,
-1.354905, 0.8976301, -1.211414, 1, 0.5647059, 0, 1,
-1.343006, -0.3564456, -2.229529, 1, 0.5686275, 0, 1,
-1.341662, 0.2254363, -1.08189, 1, 0.5764706, 0, 1,
-1.338167, -0.5124741, -2.357904, 1, 0.5803922, 0, 1,
-1.336626, -0.4748392, -1.899092, 1, 0.5882353, 0, 1,
-1.331582, 1.105333, -2.434212, 1, 0.5921569, 0, 1,
-1.326086, -1.41108, -2.925718, 1, 0.6, 0, 1,
-1.321814, -0.9257165, -0.8327095, 1, 0.6078432, 0, 1,
-1.302371, -0.9936056, -2.946662, 1, 0.6117647, 0, 1,
-1.295302, 0.4850084, -1.760699, 1, 0.6196079, 0, 1,
-1.279543, -0.2607366, -1.713078, 1, 0.6235294, 0, 1,
-1.277328, -0.1684019, -2.355299, 1, 0.6313726, 0, 1,
-1.272114, 1.509258, 1.47064, 1, 0.6352941, 0, 1,
-1.269925, -1.369384, -0.7522012, 1, 0.6431373, 0, 1,
-1.263239, -1.652096, -1.469977, 1, 0.6470588, 0, 1,
-1.262042, -1.471241, -3.987496, 1, 0.654902, 0, 1,
-1.260028, 1.297631, -0.3682758, 1, 0.6588235, 0, 1,
-1.257449, 1.421576, -1.40207, 1, 0.6666667, 0, 1,
-1.255195, 0.1616556, -1.379084, 1, 0.6705883, 0, 1,
-1.254679, 0.1581528, -0.2477721, 1, 0.6784314, 0, 1,
-1.253645, -0.06145407, -1.387133, 1, 0.682353, 0, 1,
-1.251605, -1.513519, -3.433593, 1, 0.6901961, 0, 1,
-1.249395, 0.6936441, 0.09833568, 1, 0.6941177, 0, 1,
-1.225096, 0.3032064, -0.6554186, 1, 0.7019608, 0, 1,
-1.210168, -0.04081922, 0.9189461, 1, 0.7098039, 0, 1,
-1.201687, 1.023237, -1.677961, 1, 0.7137255, 0, 1,
-1.199891, 0.01222352, -0.1323673, 1, 0.7215686, 0, 1,
-1.199093, -1.274403, -2.191795, 1, 0.7254902, 0, 1,
-1.193837, -0.3564806, -1.026923, 1, 0.7333333, 0, 1,
-1.19265, 2.369947, -0.9589618, 1, 0.7372549, 0, 1,
-1.186127, 1.712545, -0.6966038, 1, 0.7450981, 0, 1,
-1.183986, 0.9411777, 0.7952884, 1, 0.7490196, 0, 1,
-1.180762, 0.2629023, -2.13166, 1, 0.7568628, 0, 1,
-1.178758, -1.547144, -3.627666, 1, 0.7607843, 0, 1,
-1.175556, 0.2138381, -1.00986, 1, 0.7686275, 0, 1,
-1.172796, -1.825117, -2.504193, 1, 0.772549, 0, 1,
-1.169233, 0.6170983, -0.865202, 1, 0.7803922, 0, 1,
-1.167987, 1.572191, -0.4190916, 1, 0.7843137, 0, 1,
-1.157126, 0.6970464, -2.299791, 1, 0.7921569, 0, 1,
-1.146626, 0.415585, -1.299477, 1, 0.7960784, 0, 1,
-1.143178, 0.1371302, -1.72077, 1, 0.8039216, 0, 1,
-1.134635, 0.711345, -1.683908, 1, 0.8117647, 0, 1,
-1.128528, -0.2190053, -3.231973, 1, 0.8156863, 0, 1,
-1.124496, 1.013814, -0.2913248, 1, 0.8235294, 0, 1,
-1.120135, 2.602916, -0.0081691, 1, 0.827451, 0, 1,
-1.117118, -1.451281, -2.956554, 1, 0.8352941, 0, 1,
-1.10571, 2.030403, 0.1489052, 1, 0.8392157, 0, 1,
-1.103155, 0.6306735, -1.518258, 1, 0.8470588, 0, 1,
-1.098467, -0.09007391, -1.304597, 1, 0.8509804, 0, 1,
-1.090934, 0.0290951, -1.738317, 1, 0.8588235, 0, 1,
-1.088714, 1.581713, 0.4763545, 1, 0.8627451, 0, 1,
-1.088052, 2.431127, -0.6042714, 1, 0.8705882, 0, 1,
-1.077846, -0.1293014, -1.146129, 1, 0.8745098, 0, 1,
-1.077575, -0.4741941, -2.157921, 1, 0.8823529, 0, 1,
-1.073892, -1.161783, -1.871842, 1, 0.8862745, 0, 1,
-1.072449, -0.2769868, -1.438836, 1, 0.8941177, 0, 1,
-1.0628, 0.6524511, 1.289488, 1, 0.8980392, 0, 1,
-1.057115, -0.5274546, -1.391806, 1, 0.9058824, 0, 1,
-1.052012, -0.8704653, -2.06131, 1, 0.9137255, 0, 1,
-1.051268, -1.536017, -0.7283286, 1, 0.9176471, 0, 1,
-1.051207, 0.235788, -0.6951409, 1, 0.9254902, 0, 1,
-1.044955, 0.02566825, -1.097717, 1, 0.9294118, 0, 1,
-1.034781, 0.2918693, -0.4471779, 1, 0.9372549, 0, 1,
-1.032521, 1.025936, -0.453501, 1, 0.9411765, 0, 1,
-1.031632, 1.58318, 0.07374009, 1, 0.9490196, 0, 1,
-1.030968, 0.3451625, -1.27368, 1, 0.9529412, 0, 1,
-1.024877, -0.1277348, -1.912911, 1, 0.9607843, 0, 1,
-1.022186, 0.5067962, -1.547633, 1, 0.9647059, 0, 1,
-1.021055, -1.137406, -2.435544, 1, 0.972549, 0, 1,
-1.011646, 0.751348, 0.1307381, 1, 0.9764706, 0, 1,
-1.009438, 0.1859378, 2.795875, 1, 0.9843137, 0, 1,
-1.004308, 1.766768, 2.122029, 1, 0.9882353, 0, 1,
-1.00035, -0.2818653, -2.588847, 1, 0.9960784, 0, 1,
-0.9999875, -0.611043, -1.526493, 0.9960784, 1, 0, 1,
-0.9978696, 1.064645, -0.8518636, 0.9921569, 1, 0, 1,
-0.9749491, 1.440705, -0.1587873, 0.9843137, 1, 0, 1,
-0.974786, 1.068862, -1.165702, 0.9803922, 1, 0, 1,
-0.9693685, -0.4430878, -1.351181, 0.972549, 1, 0, 1,
-0.9660305, 0.339001, -0.670286, 0.9686275, 1, 0, 1,
-0.9598776, 0.6882384, -0.8653939, 0.9607843, 1, 0, 1,
-0.9518357, 0.0006939765, -1.264013, 0.9568627, 1, 0, 1,
-0.950774, -0.6398666, -4.189752, 0.9490196, 1, 0, 1,
-0.9450144, -1.086924, -3.107161, 0.945098, 1, 0, 1,
-0.9379287, -0.3296107, -1.572848, 0.9372549, 1, 0, 1,
-0.9335609, 0.7838066, -1.155881, 0.9333333, 1, 0, 1,
-0.9312146, 0.733767, -2.759922, 0.9254902, 1, 0, 1,
-0.9287305, -0.04773534, -2.878407, 0.9215686, 1, 0, 1,
-0.9276603, 0.6186367, -1.217641, 0.9137255, 1, 0, 1,
-0.9275347, 1.448323, 2.586157, 0.9098039, 1, 0, 1,
-0.9172847, 1.371142, -0.4426078, 0.9019608, 1, 0, 1,
-0.9153607, -1.090172, -2.987193, 0.8941177, 1, 0, 1,
-0.9149006, -1.550897, -4.758312, 0.8901961, 1, 0, 1,
-0.9018645, 0.6076816, 1.312817, 0.8823529, 1, 0, 1,
-0.9008855, -0.557113, -2.594537, 0.8784314, 1, 0, 1,
-0.9001032, 0.1688814, -2.045308, 0.8705882, 1, 0, 1,
-0.8964738, -2.52363, -4.351547, 0.8666667, 1, 0, 1,
-0.8921335, 0.4834185, -1.332946, 0.8588235, 1, 0, 1,
-0.8919457, -0.4045158, -1.462531, 0.854902, 1, 0, 1,
-0.8913576, -1.104113, -2.608921, 0.8470588, 1, 0, 1,
-0.8897402, -0.7740648, -0.6288706, 0.8431373, 1, 0, 1,
-0.8872558, 0.08312006, -0.4163963, 0.8352941, 1, 0, 1,
-0.8795715, -0.8969625, -2.203614, 0.8313726, 1, 0, 1,
-0.8789794, 1.4319, -1.794366, 0.8235294, 1, 0, 1,
-0.8766529, -0.6669459, -1.233637, 0.8196079, 1, 0, 1,
-0.8697672, 1.341341, -1.518269, 0.8117647, 1, 0, 1,
-0.8694289, -1.53837, -3.304386, 0.8078431, 1, 0, 1,
-0.8692887, -1.591309, -1.519594, 0.8, 1, 0, 1,
-0.8688716, 0.005717396, -1.94986, 0.7921569, 1, 0, 1,
-0.8686175, 0.3302848, -0.3206688, 0.7882353, 1, 0, 1,
-0.8650486, 1.421019, -1.92999, 0.7803922, 1, 0, 1,
-0.864601, -0.5900202, -2.581549, 0.7764706, 1, 0, 1,
-0.8500916, 0.6063678, -0.05568495, 0.7686275, 1, 0, 1,
-0.8453307, -0.08108271, -1.610332, 0.7647059, 1, 0, 1,
-0.8444398, -1.506982, -2.125223, 0.7568628, 1, 0, 1,
-0.8407291, 0.0752236, -2.148528, 0.7529412, 1, 0, 1,
-0.8388883, -0.5462956, -3.856517, 0.7450981, 1, 0, 1,
-0.8385856, -2.008976, -3.180972, 0.7411765, 1, 0, 1,
-0.8359742, -0.5327673, -2.15341, 0.7333333, 1, 0, 1,
-0.8357193, 0.3561569, -2.703119, 0.7294118, 1, 0, 1,
-0.8342983, -0.9052892, -3.147598, 0.7215686, 1, 0, 1,
-0.826543, -1.018534, -2.161858, 0.7176471, 1, 0, 1,
-0.8139029, 0.9952216, -0.3715312, 0.7098039, 1, 0, 1,
-0.8125343, -0.517709, -2.709428, 0.7058824, 1, 0, 1,
-0.8077768, 0.7580242, -0.3814411, 0.6980392, 1, 0, 1,
-0.8073004, 0.184092, -1.05988, 0.6901961, 1, 0, 1,
-0.8066693, 0.1135248, -1.948939, 0.6862745, 1, 0, 1,
-0.8048117, -2.042783, -3.683383, 0.6784314, 1, 0, 1,
-0.8015869, 1.923099, -0.797665, 0.6745098, 1, 0, 1,
-0.7981611, 1.400073, -0.5145167, 0.6666667, 1, 0, 1,
-0.7940252, -0.3347365, -1.104279, 0.6627451, 1, 0, 1,
-0.7925706, 1.42675, 0.4156829, 0.654902, 1, 0, 1,
-0.79184, 0.1791474, -1.00747, 0.6509804, 1, 0, 1,
-0.7881721, -0.5182091, -2.532941, 0.6431373, 1, 0, 1,
-0.7846903, 0.8469329, -2.298258, 0.6392157, 1, 0, 1,
-0.7760199, -0.434614, -1.190168, 0.6313726, 1, 0, 1,
-0.7710103, 0.7009305, -1.084154, 0.627451, 1, 0, 1,
-0.7645753, -0.9663376, -3.674368, 0.6196079, 1, 0, 1,
-0.7641637, -0.01855721, -2.191117, 0.6156863, 1, 0, 1,
-0.7640601, 0.05022749, -2.016701, 0.6078432, 1, 0, 1,
-0.7455252, 0.5253326, -1.855193, 0.6039216, 1, 0, 1,
-0.7414573, 1.143253, -2.585659, 0.5960785, 1, 0, 1,
-0.7340742, 0.6040962, 0.2400395, 0.5882353, 1, 0, 1,
-0.7337716, 0.5184229, -2.538468, 0.5843138, 1, 0, 1,
-0.7310392, 3.450899, -0.9941574, 0.5764706, 1, 0, 1,
-0.7271361, 0.3926495, 0.07187957, 0.572549, 1, 0, 1,
-0.7271148, 1.241714, 0.5918641, 0.5647059, 1, 0, 1,
-0.7104131, -1.309052, -3.108892, 0.5607843, 1, 0, 1,
-0.7094141, -0.4881731, -2.321458, 0.5529412, 1, 0, 1,
-0.7055179, 0.3325949, -1.411244, 0.5490196, 1, 0, 1,
-0.7019084, 0.7536198, -0.2835002, 0.5411765, 1, 0, 1,
-0.6965055, -0.6035543, -2.169705, 0.5372549, 1, 0, 1,
-0.6964521, 0.6201275, -0.1028542, 0.5294118, 1, 0, 1,
-0.6910928, 0.4874261, -1.657699, 0.5254902, 1, 0, 1,
-0.6902161, -0.8382148, -2.148853, 0.5176471, 1, 0, 1,
-0.6854783, -0.09508801, -1.710621, 0.5137255, 1, 0, 1,
-0.6820123, 3.146782, -0.7272033, 0.5058824, 1, 0, 1,
-0.678595, 0.03547409, -2.906271, 0.5019608, 1, 0, 1,
-0.6769413, -0.4453338, -1.706876, 0.4941176, 1, 0, 1,
-0.6761573, 0.5869091, -1.266637, 0.4862745, 1, 0, 1,
-0.6751453, 0.3988096, -0.350917, 0.4823529, 1, 0, 1,
-0.6726117, 1.5007, -0.8809525, 0.4745098, 1, 0, 1,
-0.672134, -0.4365165, -2.082716, 0.4705882, 1, 0, 1,
-0.6616833, 1.143736, -0.5293821, 0.4627451, 1, 0, 1,
-0.659251, 1.20226, -0.3903338, 0.4588235, 1, 0, 1,
-0.6591804, -0.6198838, -2.546282, 0.4509804, 1, 0, 1,
-0.6567569, -0.8330446, -2.040823, 0.4470588, 1, 0, 1,
-0.6553798, -0.2006257, -1.449504, 0.4392157, 1, 0, 1,
-0.651688, 1.274883, -0.2797799, 0.4352941, 1, 0, 1,
-0.6486759, 0.6477487, -0.3268834, 0.427451, 1, 0, 1,
-0.6465517, -0.4613275, -4.021405, 0.4235294, 1, 0, 1,
-0.6444201, -2.103893, -2.940883, 0.4156863, 1, 0, 1,
-0.6376854, 0.3445412, -1.164579, 0.4117647, 1, 0, 1,
-0.6373689, -1.288283, -2.597534, 0.4039216, 1, 0, 1,
-0.6317205, 0.5150104, -0.3394727, 0.3960784, 1, 0, 1,
-0.629103, 0.6762857, -1.462121, 0.3921569, 1, 0, 1,
-0.6283434, 1.138175, -0.4168564, 0.3843137, 1, 0, 1,
-0.6222892, 0.2080405, -0.3019336, 0.3803922, 1, 0, 1,
-0.6160775, -0.3349482, -2.534506, 0.372549, 1, 0, 1,
-0.6150368, 0.4508551, -1.946315, 0.3686275, 1, 0, 1,
-0.607602, 0.6108688, -0.3913036, 0.3607843, 1, 0, 1,
-0.6062879, 0.7972448, -0.426595, 0.3568628, 1, 0, 1,
-0.6048124, 0.1104784, -2.089274, 0.3490196, 1, 0, 1,
-0.5968688, -1.056347, -2.794539, 0.345098, 1, 0, 1,
-0.5802074, 2.214242, 0.9853231, 0.3372549, 1, 0, 1,
-0.5752333, -1.149966, -1.34936, 0.3333333, 1, 0, 1,
-0.5740982, -0.5507902, -3.895276, 0.3254902, 1, 0, 1,
-0.5711797, -0.4037597, -2.272537, 0.3215686, 1, 0, 1,
-0.5708484, -0.09226922, -1.857974, 0.3137255, 1, 0, 1,
-0.570767, 0.6582515, -0.4974101, 0.3098039, 1, 0, 1,
-0.5697547, 1.401875, 1.54313, 0.3019608, 1, 0, 1,
-0.5697488, -1.149792, -3.921976, 0.2941177, 1, 0, 1,
-0.5628099, 0.5545934, -0.8953438, 0.2901961, 1, 0, 1,
-0.5586066, 2.174059, -0.9991425, 0.282353, 1, 0, 1,
-0.5576258, 1.088191, -1.742034, 0.2784314, 1, 0, 1,
-0.5569878, 1.030509, -1.540715, 0.2705882, 1, 0, 1,
-0.5562071, -0.04708724, -0.398109, 0.2666667, 1, 0, 1,
-0.5518037, -1.487723, -2.860755, 0.2588235, 1, 0, 1,
-0.5445006, 2.416065, 0.4248843, 0.254902, 1, 0, 1,
-0.5444136, 1.242588, -2.340125, 0.2470588, 1, 0, 1,
-0.5430228, 0.08743115, -1.346592, 0.2431373, 1, 0, 1,
-0.5409514, 1.355506, -1.748701, 0.2352941, 1, 0, 1,
-0.5407939, 1.463566, -0.6061187, 0.2313726, 1, 0, 1,
-0.5386349, -0.5945051, -3.041885, 0.2235294, 1, 0, 1,
-0.5272031, -0.9667387, -4.443107, 0.2196078, 1, 0, 1,
-0.5226666, -0.1303687, -2.612608, 0.2117647, 1, 0, 1,
-0.520279, 1.43076, -0.5528059, 0.2078431, 1, 0, 1,
-0.5191498, 0.332808, 0.8717745, 0.2, 1, 0, 1,
-0.5158279, -0.02957229, -2.196893, 0.1921569, 1, 0, 1,
-0.515639, 0.2367489, -1.273649, 0.1882353, 1, 0, 1,
-0.5081472, -0.09395096, -0.5345629, 0.1803922, 1, 0, 1,
-0.507102, -0.4637889, -2.78146, 0.1764706, 1, 0, 1,
-0.5051349, -1.548459, -1.823166, 0.1686275, 1, 0, 1,
-0.5033187, 0.04446572, -0.5395494, 0.1647059, 1, 0, 1,
-0.5027922, -0.2302274, -1.416281, 0.1568628, 1, 0, 1,
-0.4978877, -1.180162, -2.668198, 0.1529412, 1, 0, 1,
-0.4975166, -1.549487, -3.237032, 0.145098, 1, 0, 1,
-0.496192, -0.1848202, -0.2963547, 0.1411765, 1, 0, 1,
-0.4945647, 0.05015858, -0.7458073, 0.1333333, 1, 0, 1,
-0.4902245, 1.115067, 0.6348035, 0.1294118, 1, 0, 1,
-0.4834827, -0.2101768, -2.191841, 0.1215686, 1, 0, 1,
-0.4700988, -0.01336978, -0.7083166, 0.1176471, 1, 0, 1,
-0.4693555, 1.025996, -0.630993, 0.1098039, 1, 0, 1,
-0.4641355, -0.6101388, -1.029395, 0.1058824, 1, 0, 1,
-0.4623406, -1.722109, -3.683007, 0.09803922, 1, 0, 1,
-0.4607631, -0.3940985, 0.02828096, 0.09019608, 1, 0, 1,
-0.4606376, -0.4833818, -1.886182, 0.08627451, 1, 0, 1,
-0.4584736, -0.394405, -3.58547, 0.07843138, 1, 0, 1,
-0.4549738, 0.0880966, -1.436691, 0.07450981, 1, 0, 1,
-0.4500349, -0.7405904, -2.660972, 0.06666667, 1, 0, 1,
-0.448568, -1.008082, -2.580505, 0.0627451, 1, 0, 1,
-0.4471561, 0.394888, 0.2112992, 0.05490196, 1, 0, 1,
-0.4468232, -0.2905295, -2.07074, 0.05098039, 1, 0, 1,
-0.4447084, 0.6351722, -0.1725201, 0.04313726, 1, 0, 1,
-0.4418914, -1.130905, -2.994818, 0.03921569, 1, 0, 1,
-0.4414155, -0.894919, -3.193341, 0.03137255, 1, 0, 1,
-0.4413829, -1.139327, -3.495995, 0.02745098, 1, 0, 1,
-0.438852, 0.1815287, -0.7341975, 0.01960784, 1, 0, 1,
-0.4373168, -1.266941, -3.460058, 0.01568628, 1, 0, 1,
-0.4352136, 0.936166, 0.1669394, 0.007843138, 1, 0, 1,
-0.43115, -1.154509, -3.266885, 0.003921569, 1, 0, 1,
-0.4301842, 0.3858531, 0.1354081, 0, 1, 0.003921569, 1,
-0.4193183, -0.7729521, -2.104028, 0, 1, 0.01176471, 1,
-0.4144806, 0.2386583, -1.451493, 0, 1, 0.01568628, 1,
-0.4132905, -0.4991686, -2.620035, 0, 1, 0.02352941, 1,
-0.411182, -0.5195632, -3.430976, 0, 1, 0.02745098, 1,
-0.4104568, 1.651347, -0.2455234, 0, 1, 0.03529412, 1,
-0.4074029, -0.7551111, -2.062262, 0, 1, 0.03921569, 1,
-0.40667, -1.146337, -3.157007, 0, 1, 0.04705882, 1,
-0.3998328, -0.05658928, 0.2636332, 0, 1, 0.05098039, 1,
-0.3958885, 0.5734535, -1.479826, 0, 1, 0.05882353, 1,
-0.3953984, 0.1371595, -1.93086, 0, 1, 0.0627451, 1,
-0.3940064, -1.056933, -2.514566, 0, 1, 0.07058824, 1,
-0.3925585, 0.05552919, -2.319772, 0, 1, 0.07450981, 1,
-0.3916472, 0.04412885, -1.008076, 0, 1, 0.08235294, 1,
-0.3889972, -1.837647, -1.06446, 0, 1, 0.08627451, 1,
-0.3888797, 0.7286248, -1.328726, 0, 1, 0.09411765, 1,
-0.383996, 1.101429, 1.001893, 0, 1, 0.1019608, 1,
-0.3812889, -0.5065626, -0.5405542, 0, 1, 0.1058824, 1,
-0.3785687, -0.5055758, -2.879605, 0, 1, 0.1137255, 1,
-0.3783256, 0.6956087, -0.1885087, 0, 1, 0.1176471, 1,
-0.3777443, -0.03608524, -1.754745, 0, 1, 0.1254902, 1,
-0.3765329, -0.2655579, -2.476087, 0, 1, 0.1294118, 1,
-0.3738932, -0.4787595, -2.66889, 0, 1, 0.1372549, 1,
-0.3725474, -0.6376555, -2.434419, 0, 1, 0.1411765, 1,
-0.3714594, 0.117326, -2.435055, 0, 1, 0.1490196, 1,
-0.3707529, -0.05684898, -0.4395181, 0, 1, 0.1529412, 1,
-0.3653775, -0.1299213, -1.13832, 0, 1, 0.1607843, 1,
-0.362435, -1.047998, -2.542243, 0, 1, 0.1647059, 1,
-0.3595074, 1.583905, 0.5864133, 0, 1, 0.172549, 1,
-0.3571732, 1.541577, 1.636392, 0, 1, 0.1764706, 1,
-0.3530476, -0.04253148, -2.633219, 0, 1, 0.1843137, 1,
-0.3528494, -0.4378763, -3.19789, 0, 1, 0.1882353, 1,
-0.3482576, 1.261972, -1.082792, 0, 1, 0.1960784, 1,
-0.3454412, -0.249027, -0.9621745, 0, 1, 0.2039216, 1,
-0.336684, 0.9263886, -0.7844169, 0, 1, 0.2078431, 1,
-0.3347138, -0.2324173, -1.829822, 0, 1, 0.2156863, 1,
-0.334585, 1.03387, -1.25453, 0, 1, 0.2196078, 1,
-0.3329632, -0.4716454, -2.640915, 0, 1, 0.227451, 1,
-0.3322234, 0.4981147, 1.01192, 0, 1, 0.2313726, 1,
-0.3317305, 2.404418, 0.3792517, 0, 1, 0.2392157, 1,
-0.3268892, 1.158172, 0.4044935, 0, 1, 0.2431373, 1,
-0.3201473, 0.4892901, 0.007812028, 0, 1, 0.2509804, 1,
-0.320136, 0.02483397, -2.512885, 0, 1, 0.254902, 1,
-0.3168478, -0.6086851, -3.230185, 0, 1, 0.2627451, 1,
-0.3162092, 1.492233, 1.021739, 0, 1, 0.2666667, 1,
-0.3136314, -0.336527, -2.846746, 0, 1, 0.2745098, 1,
-0.3093716, -1.503006, -1.489551, 0, 1, 0.2784314, 1,
-0.3092551, -0.2450632, -1.198782, 0, 1, 0.2862745, 1,
-0.3030401, 0.7326971, -1.03574, 0, 1, 0.2901961, 1,
-0.3012586, 0.2507732, -1.770379, 0, 1, 0.2980392, 1,
-0.2994676, 0.644474, -1.984221, 0, 1, 0.3058824, 1,
-0.2986623, 0.929821, -0.8312137, 0, 1, 0.3098039, 1,
-0.2969294, 2.93911, 1.371502, 0, 1, 0.3176471, 1,
-0.2958713, 0.7149968, 0.1864981, 0, 1, 0.3215686, 1,
-0.2935903, 1.599481, -0.4902341, 0, 1, 0.3294118, 1,
-0.283967, 0.5214435, -1.635561, 0, 1, 0.3333333, 1,
-0.2832419, -0.5343488, -2.425772, 0, 1, 0.3411765, 1,
-0.2819724, 0.3864798, -0.1816415, 0, 1, 0.345098, 1,
-0.2810178, 1.447711, -2.734769, 0, 1, 0.3529412, 1,
-0.2798862, -0.3653268, -1.59516, 0, 1, 0.3568628, 1,
-0.2783545, -1.728572, -3.402953, 0, 1, 0.3647059, 1,
-0.2757405, -0.6501597, -3.183599, 0, 1, 0.3686275, 1,
-0.2747468, -0.143777, -1.918139, 0, 1, 0.3764706, 1,
-0.2711113, -0.7593007, -3.207292, 0, 1, 0.3803922, 1,
-0.271068, 0.106894, -1.343715, 0, 1, 0.3882353, 1,
-0.2694021, -1.832594, -3.335746, 0, 1, 0.3921569, 1,
-0.2679172, 0.2989011, -0.5669097, 0, 1, 0.4, 1,
-0.2671849, -0.9607801, -3.367451, 0, 1, 0.4078431, 1,
-0.2665181, -0.2390927, -2.385756, 0, 1, 0.4117647, 1,
-0.2657648, 0.1751092, -0.642164, 0, 1, 0.4196078, 1,
-0.2614177, 1.594178, 1.468637, 0, 1, 0.4235294, 1,
-0.2609724, -1.041751, -1.51999, 0, 1, 0.4313726, 1,
-0.2605972, 0.7424366, 1.07705, 0, 1, 0.4352941, 1,
-0.2579446, -0.2632287, -1.990676, 0, 1, 0.4431373, 1,
-0.2504696, 1.244781, -2.058956, 0, 1, 0.4470588, 1,
-0.250352, -1.401977, -2.07954, 0, 1, 0.454902, 1,
-0.2425893, 0.644334, -3.155333, 0, 1, 0.4588235, 1,
-0.2413957, -0.641028, -2.918006, 0, 1, 0.4666667, 1,
-0.2405387, 0.06460207, -1.135918, 0, 1, 0.4705882, 1,
-0.233493, 1.020264, 0.2023389, 0, 1, 0.4784314, 1,
-0.2293941, -0.01981223, -2.141709, 0, 1, 0.4823529, 1,
-0.2223499, 1.252078, -0.4875523, 0, 1, 0.4901961, 1,
-0.2201238, 1.337861, -1.039489, 0, 1, 0.4941176, 1,
-0.2174451, 0.9246383, 1.561873, 0, 1, 0.5019608, 1,
-0.2047729, 0.06268797, -2.849821, 0, 1, 0.509804, 1,
-0.2032995, -1.096785, -4.559399, 0, 1, 0.5137255, 1,
-0.1984544, 0.0918277, -0.9284171, 0, 1, 0.5215687, 1,
-0.1974021, -1.486264, -4.449215, 0, 1, 0.5254902, 1,
-0.197031, 0.3889283, -0.1462519, 0, 1, 0.5333334, 1,
-0.1970056, 1.334992, -2.372566, 0, 1, 0.5372549, 1,
-0.1965227, 0.7141681, 1.760635, 0, 1, 0.5450981, 1,
-0.193212, -0.6235726, -3.178123, 0, 1, 0.5490196, 1,
-0.1931623, 0.03396064, -1.465031, 0, 1, 0.5568628, 1,
-0.1891691, 1.244287, -3.895637, 0, 1, 0.5607843, 1,
-0.1890097, 0.0600884, -2.161028, 0, 1, 0.5686275, 1,
-0.1835427, 0.7164462, 0.1305458, 0, 1, 0.572549, 1,
-0.1806739, 0.652215, -0.4955023, 0, 1, 0.5803922, 1,
-0.1752204, 1.026667, -0.08722428, 0, 1, 0.5843138, 1,
-0.171644, -0.9305896, -2.864388, 0, 1, 0.5921569, 1,
-0.1675404, -0.7200589, -3.232353, 0, 1, 0.5960785, 1,
-0.1658695, -0.6698208, -3.211554, 0, 1, 0.6039216, 1,
-0.1587059, 1.303615, 0.2104106, 0, 1, 0.6117647, 1,
-0.153937, -0.5009012, -3.868489, 0, 1, 0.6156863, 1,
-0.1533777, -0.03608895, -0.1701898, 0, 1, 0.6235294, 1,
-0.151611, -1.271148, -3.515499, 0, 1, 0.627451, 1,
-0.1452471, 0.3803364, -1.836671, 0, 1, 0.6352941, 1,
-0.1451614, -1.242179, -3.040488, 0, 1, 0.6392157, 1,
-0.143842, 0.627704, 1.205143, 0, 1, 0.6470588, 1,
-0.143361, -0.06932979, -1.966417, 0, 1, 0.6509804, 1,
-0.1418978, -0.6394088, -2.03861, 0, 1, 0.6588235, 1,
-0.1364203, -0.975287, -2.291637, 0, 1, 0.6627451, 1,
-0.1333614, -0.05813964, -4.754979, 0, 1, 0.6705883, 1,
-0.1206173, -1.18192, -3.221821, 0, 1, 0.6745098, 1,
-0.1198479, 0.08563998, -0.2129689, 0, 1, 0.682353, 1,
-0.1190429, 1.607692, 0.4982823, 0, 1, 0.6862745, 1,
-0.114897, 0.3662229, 1.045005, 0, 1, 0.6941177, 1,
-0.1128881, 1.209684, -0.1886422, 0, 1, 0.7019608, 1,
-0.1123625, -1.190577, -2.386685, 0, 1, 0.7058824, 1,
-0.1074976, 0.01625481, -2.396725, 0, 1, 0.7137255, 1,
-0.10738, -0.5980816, -3.697691, 0, 1, 0.7176471, 1,
-0.104704, 0.09014095, -1.266147, 0, 1, 0.7254902, 1,
-0.1019661, 0.02172745, -0.4629699, 0, 1, 0.7294118, 1,
-0.1014538, 0.1926987, 1.061316, 0, 1, 0.7372549, 1,
-0.09935252, -0.1314928, -1.760933, 0, 1, 0.7411765, 1,
-0.09791935, -0.03274015, -1.686064, 0, 1, 0.7490196, 1,
-0.09790404, -0.3256335, -3.854243, 0, 1, 0.7529412, 1,
-0.09537813, -0.3761906, -2.134764, 0, 1, 0.7607843, 1,
-0.09313279, -1.510074, -1.990645, 0, 1, 0.7647059, 1,
-0.0915644, 0.6075977, -1.477696, 0, 1, 0.772549, 1,
-0.08527441, -0.1348593, -1.833551, 0, 1, 0.7764706, 1,
-0.0831184, 0.6627031, -0.9032, 0, 1, 0.7843137, 1,
-0.07992291, 2.180169, -0.4843394, 0, 1, 0.7882353, 1,
-0.07137139, 0.619355, 0.7141165, 0, 1, 0.7960784, 1,
-0.06988093, 1.438402, -0.3284794, 0, 1, 0.8039216, 1,
-0.06982446, 1.384597, 0.1320616, 0, 1, 0.8078431, 1,
-0.06531946, 0.1672416, 0.4544718, 0, 1, 0.8156863, 1,
-0.06330236, 0.6897171, -0.4538168, 0, 1, 0.8196079, 1,
-0.06295571, -0.9683679, -2.710097, 0, 1, 0.827451, 1,
-0.06123596, 0.06552994, -1.802727, 0, 1, 0.8313726, 1,
-0.05976704, -0.06784026, -1.719713, 0, 1, 0.8392157, 1,
-0.05882793, 0.1541315, -0.08342281, 0, 1, 0.8431373, 1,
-0.05588862, -0.6843976, -3.027833, 0, 1, 0.8509804, 1,
-0.05362842, -0.2946282, -1.931471, 0, 1, 0.854902, 1,
-0.04262404, 0.5334495, 0.1972605, 0, 1, 0.8627451, 1,
-0.04018923, -0.01228078, -2.739477, 0, 1, 0.8666667, 1,
-0.03971679, -0.7314026, -3.159564, 0, 1, 0.8745098, 1,
-0.0395924, 0.3671571, 0.1472901, 0, 1, 0.8784314, 1,
-0.03907449, 0.8014975, -0.4041701, 0, 1, 0.8862745, 1,
-0.03820371, -0.6927911, -2.895421, 0, 1, 0.8901961, 1,
-0.03726726, 1.124102, -0.3419881, 0, 1, 0.8980392, 1,
-0.03107761, 1.636041, -0.2873576, 0, 1, 0.9058824, 1,
-0.0173871, 0.5740381, -0.02352981, 0, 1, 0.9098039, 1,
-0.01501789, 1.376021, 0.2329518, 0, 1, 0.9176471, 1,
-0.014387, -1.716358, -2.065943, 0, 1, 0.9215686, 1,
-0.01160293, -1.202364, -2.665801, 0, 1, 0.9294118, 1,
-0.007920505, 2.586999, -0.04147611, 0, 1, 0.9333333, 1,
-0.004657963, -1.237555, -3.790249, 0, 1, 0.9411765, 1,
-0.004316274, 1.258346, 2.005933, 0, 1, 0.945098, 1,
-0.004036717, 0.9930243, -0.1568299, 0, 1, 0.9529412, 1,
-0.001995763, 0.8395824, 1.361679, 0, 1, 0.9568627, 1,
-0.001291248, 0.3071036, -0.3429401, 0, 1, 0.9647059, 1,
0.002165733, -1.321788, 5.426422, 0, 1, 0.9686275, 1,
0.00279911, 2.068647, -1.944127, 0, 1, 0.9764706, 1,
0.006337768, -0.6339163, 3.485593, 0, 1, 0.9803922, 1,
0.007338066, -1.831308, 3.360435, 0, 1, 0.9882353, 1,
0.01222034, 0.4500424, 0.05371392, 0, 1, 0.9921569, 1,
0.01244409, 0.990022, 0.1538907, 0, 1, 1, 1,
0.01544791, 0.796779, 1.338031, 0, 0.9921569, 1, 1,
0.01641149, 0.3247309, 0.6238547, 0, 0.9882353, 1, 1,
0.01914775, 0.3540196, 1.564825, 0, 0.9803922, 1, 1,
0.02085501, 0.5190672, 0.9675602, 0, 0.9764706, 1, 1,
0.02294143, -1.270715, 2.961771, 0, 0.9686275, 1, 1,
0.02380038, 0.425184, 0.711848, 0, 0.9647059, 1, 1,
0.02386979, 0.4622416, -0.5400766, 0, 0.9568627, 1, 1,
0.0243456, 1.74626, 0.3142391, 0, 0.9529412, 1, 1,
0.02437816, 0.1098979, -0.02639175, 0, 0.945098, 1, 1,
0.02541058, -0.1146258, 4.472167, 0, 0.9411765, 1, 1,
0.0338029, 1.343888, 0.8030705, 0, 0.9333333, 1, 1,
0.0351112, -1.405021, 2.001665, 0, 0.9294118, 1, 1,
0.03593169, 0.1089397, 0.2513933, 0, 0.9215686, 1, 1,
0.03779419, 0.6859241, -1.276269, 0, 0.9176471, 1, 1,
0.03877993, 0.9385283, 1.23831, 0, 0.9098039, 1, 1,
0.0393541, 0.8604888, 0.5497546, 0, 0.9058824, 1, 1,
0.03976833, -0.5075901, 0.4979779, 0, 0.8980392, 1, 1,
0.04178157, -1.100132, 4.28395, 0, 0.8901961, 1, 1,
0.04231071, -1.132553, 3.231829, 0, 0.8862745, 1, 1,
0.04316302, -1.852174, 2.919094, 0, 0.8784314, 1, 1,
0.04325862, -1.055823, 3.482601, 0, 0.8745098, 1, 1,
0.0441694, 0.5876789, -0.2133102, 0, 0.8666667, 1, 1,
0.04940188, -0.1873434, 1.646022, 0, 0.8627451, 1, 1,
0.05476011, -1.27531, 2.20985, 0, 0.854902, 1, 1,
0.05618676, 0.205413, -1.378904, 0, 0.8509804, 1, 1,
0.05799848, -0.1517444, 1.201208, 0, 0.8431373, 1, 1,
0.05962152, 0.416152, -1.629072, 0, 0.8392157, 1, 1,
0.06396051, -0.6173673, 2.601537, 0, 0.8313726, 1, 1,
0.06649086, 0.02515088, 2.089147, 0, 0.827451, 1, 1,
0.07520665, 0.1221552, -0.413474, 0, 0.8196079, 1, 1,
0.07671607, 0.7852904, 0.9370414, 0, 0.8156863, 1, 1,
0.07781519, 0.5046164, 2.098756, 0, 0.8078431, 1, 1,
0.07824738, -1.556709, 4.665162, 0, 0.8039216, 1, 1,
0.07988399, 1.67194, -0.4355817, 0, 0.7960784, 1, 1,
0.08137307, -0.5609483, 1.847709, 0, 0.7882353, 1, 1,
0.08177707, 0.7728124, -1.918865, 0, 0.7843137, 1, 1,
0.08244471, 1.385047, 1.131132, 0, 0.7764706, 1, 1,
0.0856414, 0.6720293, -0.6803359, 0, 0.772549, 1, 1,
0.09148873, -0.1917817, 2.808363, 0, 0.7647059, 1, 1,
0.09155991, -0.2143224, 2.462703, 0, 0.7607843, 1, 1,
0.09495203, 1.240125, -0.3801048, 0, 0.7529412, 1, 1,
0.1046588, 0.03756014, 2.468855, 0, 0.7490196, 1, 1,
0.1053339, 1.336347, 0.7993926, 0, 0.7411765, 1, 1,
0.1097643, 0.5726956, -0.7697434, 0, 0.7372549, 1, 1,
0.1106405, -0.3242256, 2.507162, 0, 0.7294118, 1, 1,
0.1108103, 1.140921, -0.3331706, 0, 0.7254902, 1, 1,
0.1117636, 0.8189021, 1.288897, 0, 0.7176471, 1, 1,
0.1198314, 1.259522, 0.4187139, 0, 0.7137255, 1, 1,
0.1199247, 1.482322, 0.5474387, 0, 0.7058824, 1, 1,
0.1223246, -0.768514, 4.60942, 0, 0.6980392, 1, 1,
0.1223709, 0.6152399, 1.519572, 0, 0.6941177, 1, 1,
0.1233663, -0.2520108, 2.19626, 0, 0.6862745, 1, 1,
0.126149, -1.916621, 3.929624, 0, 0.682353, 1, 1,
0.1270206, -1.418428, 3.322681, 0, 0.6745098, 1, 1,
0.1400224, -0.1531216, 2.372986, 0, 0.6705883, 1, 1,
0.1402423, -0.471018, 4.40843, 0, 0.6627451, 1, 1,
0.1472375, 0.1193612, 0.3099492, 0, 0.6588235, 1, 1,
0.1482414, -0.93386, 3.582165, 0, 0.6509804, 1, 1,
0.1497143, 0.5337366, -0.8060926, 0, 0.6470588, 1, 1,
0.1553908, -0.4154469, 5.459064, 0, 0.6392157, 1, 1,
0.1612049, -1.294074, 2.901143, 0, 0.6352941, 1, 1,
0.1656731, -1.873091, 1.774237, 0, 0.627451, 1, 1,
0.1713657, -0.3047571, 3.036675, 0, 0.6235294, 1, 1,
0.1720455, -0.1892287, 0.8573757, 0, 0.6156863, 1, 1,
0.1744904, -0.8075117, 5.06075, 0, 0.6117647, 1, 1,
0.1749969, 0.4470039, -0.6354076, 0, 0.6039216, 1, 1,
0.1856326, -1.268952, 4.610594, 0, 0.5960785, 1, 1,
0.1864179, -0.2402622, 1.11309, 0, 0.5921569, 1, 1,
0.186772, -1.75651, 1.324395, 0, 0.5843138, 1, 1,
0.1872969, -0.3520764, -1.244292, 0, 0.5803922, 1, 1,
0.1885191, -0.941512, 3.250087, 0, 0.572549, 1, 1,
0.1951556, -1.819644, 3.060607, 0, 0.5686275, 1, 1,
0.1980338, 1.484431, 0.2003267, 0, 0.5607843, 1, 1,
0.2005509, 0.6811511, 1.79119, 0, 0.5568628, 1, 1,
0.2049368, 0.4407647, 2.273493, 0, 0.5490196, 1, 1,
0.2063432, 0.03980151, 2.618296, 0, 0.5450981, 1, 1,
0.2077488, 1.008501, -0.4401645, 0, 0.5372549, 1, 1,
0.2106035, 0.3712969, 2.781121, 0, 0.5333334, 1, 1,
0.2136586, -1.198427, 3.718427, 0, 0.5254902, 1, 1,
0.2148237, 1.477259, 1.03501, 0, 0.5215687, 1, 1,
0.2251551, -1.361281, 2.065215, 0, 0.5137255, 1, 1,
0.2252139, 0.4700961, 0.4895377, 0, 0.509804, 1, 1,
0.2261258, 0.8765705, -1.724769, 0, 0.5019608, 1, 1,
0.2270045, -0.8686807, 5.018217, 0, 0.4941176, 1, 1,
0.2317589, -0.175522, 2.550192, 0, 0.4901961, 1, 1,
0.2321518, -1.315165, 4.957198, 0, 0.4823529, 1, 1,
0.2334481, 0.2777127, -0.5989273, 0, 0.4784314, 1, 1,
0.2357789, -0.7859861, 4.005744, 0, 0.4705882, 1, 1,
0.2394001, 0.6847558, 0.2437144, 0, 0.4666667, 1, 1,
0.2478652, 0.0978699, 0.9483467, 0, 0.4588235, 1, 1,
0.2496157, -0.3523555, 2.164887, 0, 0.454902, 1, 1,
0.2499618, -0.5459893, 1.063841, 0, 0.4470588, 1, 1,
0.2505094, -0.36766, 2.327072, 0, 0.4431373, 1, 1,
0.2554526, -0.3821082, 4.313225, 0, 0.4352941, 1, 1,
0.2571112, -1.400502, 2.6252, 0, 0.4313726, 1, 1,
0.2586473, -0.739027, 2.751856, 0, 0.4235294, 1, 1,
0.2596023, -0.9023831, 1.705207, 0, 0.4196078, 1, 1,
0.2602455, -0.286149, 3.173297, 0, 0.4117647, 1, 1,
0.2608477, 0.6943699, 2.73232, 0, 0.4078431, 1, 1,
0.2656921, 0.5115288, -0.1041971, 0, 0.4, 1, 1,
0.2671208, 0.9520488, -0.2983275, 0, 0.3921569, 1, 1,
0.2701645, 1.068758, 4.020072, 0, 0.3882353, 1, 1,
0.27132, 0.1696589, 0.6146635, 0, 0.3803922, 1, 1,
0.2736188, 0.6791651, 1.161465, 0, 0.3764706, 1, 1,
0.2759779, 0.04810042, -0.3701421, 0, 0.3686275, 1, 1,
0.277132, 0.0002617254, 3.088953, 0, 0.3647059, 1, 1,
0.2772723, 0.3364825, 1.858571, 0, 0.3568628, 1, 1,
0.2773229, 1.530141, -1.195417, 0, 0.3529412, 1, 1,
0.2870584, 0.763994, -0.1887558, 0, 0.345098, 1, 1,
0.2897629, 0.1203146, 1.741747, 0, 0.3411765, 1, 1,
0.2917721, -0.482211, 1.850032, 0, 0.3333333, 1, 1,
0.291905, 0.6796871, -0.1691127, 0, 0.3294118, 1, 1,
0.2929568, -0.03093966, 1.43465, 0, 0.3215686, 1, 1,
0.2967087, -1.086291, 2.014861, 0, 0.3176471, 1, 1,
0.2980915, -1.115384, 2.666471, 0, 0.3098039, 1, 1,
0.3019101, 0.2487827, 0.733557, 0, 0.3058824, 1, 1,
0.3047416, -0.03316466, 2.79233, 0, 0.2980392, 1, 1,
0.3066097, -0.4687811, 3.830252, 0, 0.2901961, 1, 1,
0.3066332, -1.01576, 2.084271, 0, 0.2862745, 1, 1,
0.3083749, 0.7376267, -1.053815, 0, 0.2784314, 1, 1,
0.3122799, 0.62194, 1.236593, 0, 0.2745098, 1, 1,
0.3143384, -1.31956, 3.529216, 0, 0.2666667, 1, 1,
0.3158582, -0.5920419, 3.5037, 0, 0.2627451, 1, 1,
0.3260749, -1.459729, 2.672993, 0, 0.254902, 1, 1,
0.3295923, -1.38462, 2.079922, 0, 0.2509804, 1, 1,
0.3298224, -1.258933, 2.384813, 0, 0.2431373, 1, 1,
0.3323459, 0.1187045, 1.550034, 0, 0.2392157, 1, 1,
0.3337964, -2.303699, 3.343719, 0, 0.2313726, 1, 1,
0.3359951, 0.0554456, 1.566577, 0, 0.227451, 1, 1,
0.3369516, 0.5718513, 2.006057, 0, 0.2196078, 1, 1,
0.34153, 0.8499851, -0.9917614, 0, 0.2156863, 1, 1,
0.3438011, 2.43003, -0.5174253, 0, 0.2078431, 1, 1,
0.3441865, -1.163688, 3.018829, 0, 0.2039216, 1, 1,
0.3447522, 1.489387, -0.3467828, 0, 0.1960784, 1, 1,
0.3456607, 0.6034715, -0.5775732, 0, 0.1882353, 1, 1,
0.3485524, 0.5936703, -0.7744458, 0, 0.1843137, 1, 1,
0.3496868, 0.9956657, -0.3447964, 0, 0.1764706, 1, 1,
0.3516973, -1.120193, 3.551305, 0, 0.172549, 1, 1,
0.3562718, -0.4634355, 1.809242, 0, 0.1647059, 1, 1,
0.3602963, -1.857478, 2.05229, 0, 0.1607843, 1, 1,
0.3620308, -1.520457, 1.115326, 0, 0.1529412, 1, 1,
0.3623483, -0.292329, 1.18413, 0, 0.1490196, 1, 1,
0.3626229, -0.9077072, 2.044738, 0, 0.1411765, 1, 1,
0.3665807, 0.1907176, 0.05406236, 0, 0.1372549, 1, 1,
0.3671599, 0.8633258, 1.55318, 0, 0.1294118, 1, 1,
0.3692979, 0.4001254, 2.414328, 0, 0.1254902, 1, 1,
0.3748177, -0.2545992, 0.6494423, 0, 0.1176471, 1, 1,
0.3781629, 0.4561169, 1.791584, 0, 0.1137255, 1, 1,
0.3831056, 0.04168759, 0.09235107, 0, 0.1058824, 1, 1,
0.3864623, 1.024327, 0.7747241, 0, 0.09803922, 1, 1,
0.3878601, 1.232564, 1.700109, 0, 0.09411765, 1, 1,
0.3896581, -0.2549053, 1.506995, 0, 0.08627451, 1, 1,
0.3897127, -1.436241, 2.313279, 0, 0.08235294, 1, 1,
0.3927474, 1.334882, 0.436986, 0, 0.07450981, 1, 1,
0.394076, 1.078808, 0.3032636, 0, 0.07058824, 1, 1,
0.3947906, 0.4395334, 0.1891728, 0, 0.0627451, 1, 1,
0.4032055, 1.236699, 1.417482, 0, 0.05882353, 1, 1,
0.4032149, 0.3439961, 0.36515, 0, 0.05098039, 1, 1,
0.4042245, -0.6244391, 1.505545, 0, 0.04705882, 1, 1,
0.405869, 1.343086, 2.494874, 0, 0.03921569, 1, 1,
0.4130216, 0.3745921, 1.455275, 0, 0.03529412, 1, 1,
0.4132662, 1.671233, 1.95267, 0, 0.02745098, 1, 1,
0.4143348, 1.009797, 1.492713, 0, 0.02352941, 1, 1,
0.4215399, 0.3323562, 2.355858, 0, 0.01568628, 1, 1,
0.4222548, 2.727456, -0.832495, 0, 0.01176471, 1, 1,
0.4236316, 0.00561907, 0.3190435, 0, 0.003921569, 1, 1,
0.4249605, 0.9411987, -1.366623, 0.003921569, 0, 1, 1,
0.4290705, 0.3236633, 0.9878795, 0.007843138, 0, 1, 1,
0.4306495, 0.9841361, 1.606166, 0.01568628, 0, 1, 1,
0.4316283, 0.367937, -0.4219825, 0.01960784, 0, 1, 1,
0.4318626, 1.160403, 2.153575, 0.02745098, 0, 1, 1,
0.4423191, -1.1119, 2.918713, 0.03137255, 0, 1, 1,
0.4425142, -1.288067, 1.11335, 0.03921569, 0, 1, 1,
0.4434603, -2.038973, 2.95209, 0.04313726, 0, 1, 1,
0.4472659, -1.848416, 4.267612, 0.05098039, 0, 1, 1,
0.4506166, -1.216482, 2.771399, 0.05490196, 0, 1, 1,
0.453962, 0.06505968, 1.177602, 0.0627451, 0, 1, 1,
0.4575651, 0.04623862, 1.823874, 0.06666667, 0, 1, 1,
0.458729, 0.50589, -0.4339763, 0.07450981, 0, 1, 1,
0.4596744, 0.4510076, 0.7672033, 0.07843138, 0, 1, 1,
0.4619532, 1.475586, 0.734327, 0.08627451, 0, 1, 1,
0.4652998, 0.1696393, 0.696569, 0.09019608, 0, 1, 1,
0.4680231, -0.5969716, 1.005725, 0.09803922, 0, 1, 1,
0.4680836, -1.415017, 1.912002, 0.1058824, 0, 1, 1,
0.4762664, -1.042538, 3.624535, 0.1098039, 0, 1, 1,
0.4769015, 0.4214129, -0.510508, 0.1176471, 0, 1, 1,
0.4842593, 0.2196456, 0.08630638, 0.1215686, 0, 1, 1,
0.4895064, 0.0621826, -0.006606726, 0.1294118, 0, 1, 1,
0.4933969, -0.05090598, 0.7170337, 0.1333333, 0, 1, 1,
0.4936428, -0.6574831, 3.042206, 0.1411765, 0, 1, 1,
0.4994524, 2.334124, 1.115491, 0.145098, 0, 1, 1,
0.5010096, -0.3606471, 3.577494, 0.1529412, 0, 1, 1,
0.5030668, -0.5105442, 3.327472, 0.1568628, 0, 1, 1,
0.5047449, 1.561477, -0.2123598, 0.1647059, 0, 1, 1,
0.5053463, 0.4389661, 1.296159, 0.1686275, 0, 1, 1,
0.5073939, 1.661672, -0.1460637, 0.1764706, 0, 1, 1,
0.5089943, -0.339348, 0.9011029, 0.1803922, 0, 1, 1,
0.5118856, 1.035684, -0.5744904, 0.1882353, 0, 1, 1,
0.5127842, 1.509054, -0.5074376, 0.1921569, 0, 1, 1,
0.5142179, -0.8186982, 1.928856, 0.2, 0, 1, 1,
0.5160046, -2.085781, 1.559235, 0.2078431, 0, 1, 1,
0.5259082, 0.02517463, 1.336956, 0.2117647, 0, 1, 1,
0.5263196, -1.54578, 2.306419, 0.2196078, 0, 1, 1,
0.5301784, 0.9724957, -0.6861598, 0.2235294, 0, 1, 1,
0.5322633, 0.5480029, -0.04913339, 0.2313726, 0, 1, 1,
0.5346456, 0.878117, -0.995451, 0.2352941, 0, 1, 1,
0.5351449, 1.836696, 2.658681, 0.2431373, 0, 1, 1,
0.5370238, 0.2633116, 1.193216, 0.2470588, 0, 1, 1,
0.5466782, -0.7191845, 3.298395, 0.254902, 0, 1, 1,
0.5468667, -0.9959543, 4.062649, 0.2588235, 0, 1, 1,
0.5544133, -0.4359558, 1.367797, 0.2666667, 0, 1, 1,
0.5551363, -0.7928144, 1.108556, 0.2705882, 0, 1, 1,
0.5584052, -1.424097, 3.73386, 0.2784314, 0, 1, 1,
0.560332, 1.555891, 1.074594, 0.282353, 0, 1, 1,
0.5630662, -2.39934, 2.2283, 0.2901961, 0, 1, 1,
0.5638279, -0.3689902, 1.280308, 0.2941177, 0, 1, 1,
0.5638984, -0.5049953, 3.195003, 0.3019608, 0, 1, 1,
0.5640569, 0.09453905, 0.1269374, 0.3098039, 0, 1, 1,
0.5691462, 0.4318635, 3.21268, 0.3137255, 0, 1, 1,
0.5692744, 0.6986001, 1.175103, 0.3215686, 0, 1, 1,
0.5714358, 0.5361474, 0.8549131, 0.3254902, 0, 1, 1,
0.5733506, 1.049535, 0.8822827, 0.3333333, 0, 1, 1,
0.5760927, 0.9146329, -0.3884045, 0.3372549, 0, 1, 1,
0.5772004, -0.5803791, 2.224544, 0.345098, 0, 1, 1,
0.5809543, 0.09622222, -0.4813259, 0.3490196, 0, 1, 1,
0.5899475, 1.247231, -1.495356, 0.3568628, 0, 1, 1,
0.594653, -0.2387876, 1.067244, 0.3607843, 0, 1, 1,
0.5968148, -1.701848, 2.798797, 0.3686275, 0, 1, 1,
0.6082622, -1.313585, 1.96432, 0.372549, 0, 1, 1,
0.6122958, -0.1573047, 2.142635, 0.3803922, 0, 1, 1,
0.6144737, 1.06284, 0.3632796, 0.3843137, 0, 1, 1,
0.6151666, 0.2748991, 2.772722, 0.3921569, 0, 1, 1,
0.6158288, -0.2547611, 1.595551, 0.3960784, 0, 1, 1,
0.6212675, 0.07985676, 1.907547, 0.4039216, 0, 1, 1,
0.6392931, 0.02718411, 1.887691, 0.4117647, 0, 1, 1,
0.6415545, -0.2012224, 0.1041338, 0.4156863, 0, 1, 1,
0.6439335, 1.304615, 2.322203, 0.4235294, 0, 1, 1,
0.648641, 0.08200638, 1.828385, 0.427451, 0, 1, 1,
0.6524322, -1.020726, 2.375046, 0.4352941, 0, 1, 1,
0.6529139, -0.1598445, 0.9052895, 0.4392157, 0, 1, 1,
0.6575502, -0.6263738, 2.173855, 0.4470588, 0, 1, 1,
0.6663694, 2.046286, -0.4380969, 0.4509804, 0, 1, 1,
0.6674858, 0.05346829, 1.253248, 0.4588235, 0, 1, 1,
0.6677339, -0.9992492, 3.329375, 0.4627451, 0, 1, 1,
0.6678706, -0.9519148, 3.052253, 0.4705882, 0, 1, 1,
0.6749594, -1.427652, 0.8334458, 0.4745098, 0, 1, 1,
0.6815823, -0.224012, 2.225514, 0.4823529, 0, 1, 1,
0.6828769, -2.481795, 3.701265, 0.4862745, 0, 1, 1,
0.6863237, 0.3721524, 0.9650205, 0.4941176, 0, 1, 1,
0.688119, -0.6024157, 2.670843, 0.5019608, 0, 1, 1,
0.6896634, -1.434833, 1.46566, 0.5058824, 0, 1, 1,
0.7035984, 0.942028, 2.310822, 0.5137255, 0, 1, 1,
0.7050881, -1.037702, 2.684611, 0.5176471, 0, 1, 1,
0.7051116, 1.301459, 0.2659253, 0.5254902, 0, 1, 1,
0.7065687, 0.5358086, -0.2873154, 0.5294118, 0, 1, 1,
0.7139074, 0.3764805, 0.6840267, 0.5372549, 0, 1, 1,
0.7142711, -1.693099, 2.706368, 0.5411765, 0, 1, 1,
0.7168363, -0.2216076, 2.369855, 0.5490196, 0, 1, 1,
0.7218025, 0.1593891, 1.813665, 0.5529412, 0, 1, 1,
0.7276257, 0.8188404, 1.222774, 0.5607843, 0, 1, 1,
0.7327462, -0.4442506, 2.77632, 0.5647059, 0, 1, 1,
0.7352, 1.7943, -0.1648967, 0.572549, 0, 1, 1,
0.7362809, -1.400289, 2.433717, 0.5764706, 0, 1, 1,
0.7422725, -0.6059759, 2.402021, 0.5843138, 0, 1, 1,
0.743807, 0.9453554, 1.89694, 0.5882353, 0, 1, 1,
0.7474236, -1.548514, 2.241955, 0.5960785, 0, 1, 1,
0.7586599, -0.1225148, 0.5096401, 0.6039216, 0, 1, 1,
0.7591017, 0.7361138, -0.2742262, 0.6078432, 0, 1, 1,
0.7608031, 0.5018431, -0.08455352, 0.6156863, 0, 1, 1,
0.7635072, 0.4820212, 0.5491474, 0.6196079, 0, 1, 1,
0.7639934, -1.180569, 3.681037, 0.627451, 0, 1, 1,
0.7708467, -0.3480357, 2.350687, 0.6313726, 0, 1, 1,
0.7741249, -0.1309503, 1.306239, 0.6392157, 0, 1, 1,
0.7766117, -0.6929786, 2.334461, 0.6431373, 0, 1, 1,
0.7778694, 1.073707, 0.1752757, 0.6509804, 0, 1, 1,
0.7781819, 0.1116526, 2.000959, 0.654902, 0, 1, 1,
0.7786761, -0.7152851, 2.909259, 0.6627451, 0, 1, 1,
0.782153, -0.6903147, 0.9144184, 0.6666667, 0, 1, 1,
0.78359, -1.304833, 2.720294, 0.6745098, 0, 1, 1,
0.7837302, 0.003593483, 2.717703, 0.6784314, 0, 1, 1,
0.7843586, 0.3656332, -0.2156894, 0.6862745, 0, 1, 1,
0.7890857, -0.1318897, 1.62741, 0.6901961, 0, 1, 1,
0.7899516, -0.3131191, 2.166025, 0.6980392, 0, 1, 1,
0.7914345, -1.338395, 2.160666, 0.7058824, 0, 1, 1,
0.7944781, -0.9729789, 2.740936, 0.7098039, 0, 1, 1,
0.7991172, -0.4530578, 3.163394, 0.7176471, 0, 1, 1,
0.8030388, 1.051488, 1.286959, 0.7215686, 0, 1, 1,
0.803964, 0.8304631, 2.114621, 0.7294118, 0, 1, 1,
0.8062396, -0.6425423, 2.193777, 0.7333333, 0, 1, 1,
0.8093224, -0.9971951, 2.813261, 0.7411765, 0, 1, 1,
0.8108866, -2.141808, 1.933039, 0.7450981, 0, 1, 1,
0.8134162, 0.8054549, 1.308835, 0.7529412, 0, 1, 1,
0.8227043, -0.8953701, 3.377002, 0.7568628, 0, 1, 1,
0.8291833, 0.4211389, 1.357813, 0.7647059, 0, 1, 1,
0.8320056, -2.204317, 2.393177, 0.7686275, 0, 1, 1,
0.8341423, 1.180309, 0.2074045, 0.7764706, 0, 1, 1,
0.8374085, 0.410276, 0.4063339, 0.7803922, 0, 1, 1,
0.8447441, -1.194444, 4.117775, 0.7882353, 0, 1, 1,
0.8470204, -0.5633906, 2.002444, 0.7921569, 0, 1, 1,
0.8501214, -0.1440017, 1.982657, 0.8, 0, 1, 1,
0.8539799, -0.7638498, 1.972767, 0.8078431, 0, 1, 1,
0.8564759, -1.440023, 2.208759, 0.8117647, 0, 1, 1,
0.8564944, 0.2160437, 0.7501727, 0.8196079, 0, 1, 1,
0.863571, 0.2933879, 2.429096, 0.8235294, 0, 1, 1,
0.872264, -0.05149352, 1.093805, 0.8313726, 0, 1, 1,
0.8939312, 0.1005317, 1.335817, 0.8352941, 0, 1, 1,
0.8979744, 0.1115, 1.787598, 0.8431373, 0, 1, 1,
0.9004923, 1.244876, 1.667739, 0.8470588, 0, 1, 1,
0.9067458, -0.5553486, 1.842929, 0.854902, 0, 1, 1,
0.9069502, 0.9420767, 1.235838, 0.8588235, 0, 1, 1,
0.9102535, 0.5605233, 1.839447, 0.8666667, 0, 1, 1,
0.9137337, 1.318985, 0.2003437, 0.8705882, 0, 1, 1,
0.9226797, 0.364942, 0.7477714, 0.8784314, 0, 1, 1,
0.9263083, 0.126588, 1.088082, 0.8823529, 0, 1, 1,
0.935047, 0.6016868, 1.341811, 0.8901961, 0, 1, 1,
0.9378988, 0.1889528, 0.8585436, 0.8941177, 0, 1, 1,
0.9390087, 0.8893052, 0.7291062, 0.9019608, 0, 1, 1,
0.9503695, -1.289321, 1.574722, 0.9098039, 0, 1, 1,
0.9509272, -2.927935, 4.254709, 0.9137255, 0, 1, 1,
0.9511774, -0.9128202, 3.346986, 0.9215686, 0, 1, 1,
0.9521753, -0.9668816, 1.098348, 0.9254902, 0, 1, 1,
0.9555384, 0.7944134, 0.174201, 0.9333333, 0, 1, 1,
0.9557859, 1.465489, 2.112058, 0.9372549, 0, 1, 1,
0.9574976, -1.427545, 3.74023, 0.945098, 0, 1, 1,
0.9598726, 0.479386, 1.245552, 0.9490196, 0, 1, 1,
0.9606683, -0.3883143, 2.149714, 0.9568627, 0, 1, 1,
0.9653322, -0.4501911, 2.202004, 0.9607843, 0, 1, 1,
0.9666845, 1.246149, 0.5340133, 0.9686275, 0, 1, 1,
0.969748, -1.364394, 2.161706, 0.972549, 0, 1, 1,
0.9699932, -1.765485, 1.423169, 0.9803922, 0, 1, 1,
0.9739643, 1.126206, -0.6605542, 0.9843137, 0, 1, 1,
0.9771749, 1.558447, -0.4632861, 0.9921569, 0, 1, 1,
0.9805934, -0.3593161, 0.1080786, 0.9960784, 0, 1, 1,
0.9831071, -0.1289575, 4.273799, 1, 0, 0.9960784, 1,
0.9854038, -1.765971, 4.091329, 1, 0, 0.9882353, 1,
0.9874162, 0.2057075, 1.292425, 1, 0, 0.9843137, 1,
0.98816, -1.75625, 1.847513, 1, 0, 0.9764706, 1,
0.9882553, -0.07807273, 0.7879598, 1, 0, 0.972549, 1,
0.9926496, 1.657417, 1.33175, 1, 0, 0.9647059, 1,
0.9958519, -0.1136937, 1.504381, 1, 0, 0.9607843, 1,
0.9987561, -2.511025, 2.764821, 1, 0, 0.9529412, 1,
1.003926, 0.3005013, 2.83137, 1, 0, 0.9490196, 1,
1.004789, -0.3083578, 2.852966, 1, 0, 0.9411765, 1,
1.006785, -0.1658907, 2.292164, 1, 0, 0.9372549, 1,
1.013418, 0.3316978, 0.7570779, 1, 0, 0.9294118, 1,
1.014634, -1.47167, 5.100767, 1, 0, 0.9254902, 1,
1.018099, 0.5732833, -2.041405, 1, 0, 0.9176471, 1,
1.023112, 1.317274, -0.2439609, 1, 0, 0.9137255, 1,
1.032102, 0.632855, 0.8532047, 1, 0, 0.9058824, 1,
1.034852, -0.3891534, 2.112316, 1, 0, 0.9019608, 1,
1.037382, -3.119395, 2.919158, 1, 0, 0.8941177, 1,
1.044166, -0.2849744, 1.540071, 1, 0, 0.8862745, 1,
1.06266, -0.6540248, 2.556026, 1, 0, 0.8823529, 1,
1.068103, 1.848378, 0.3221985, 1, 0, 0.8745098, 1,
1.070392, 0.07561691, 1.851305, 1, 0, 0.8705882, 1,
1.075025, -2.047609, 1.836534, 1, 0, 0.8627451, 1,
1.081837, -0.149111, 2.54885, 1, 0, 0.8588235, 1,
1.090277, 0.3026457, -1.021423, 1, 0, 0.8509804, 1,
1.097506, 0.8608727, 1.405142, 1, 0, 0.8470588, 1,
1.099664, -0.2605955, 1.4699, 1, 0, 0.8392157, 1,
1.104792, -1.925898, 2.258359, 1, 0, 0.8352941, 1,
1.106645, -0.5053244, 1.563068, 1, 0, 0.827451, 1,
1.108718, -0.6266518, 0.1633128, 1, 0, 0.8235294, 1,
1.120131, 0.293467, 0.8734586, 1, 0, 0.8156863, 1,
1.120165, -1.394724, 2.577807, 1, 0, 0.8117647, 1,
1.125519, -0.8684611, 2.001722, 1, 0, 0.8039216, 1,
1.128191, -0.6079766, 1.70678, 1, 0, 0.7960784, 1,
1.134284, 0.3875656, 1.92585, 1, 0, 0.7921569, 1,
1.136422, 1.58049, 0.4300162, 1, 0, 0.7843137, 1,
1.144736, -0.5079165, 2.783121, 1, 0, 0.7803922, 1,
1.153193, 0.8864315, 0.7917414, 1, 0, 0.772549, 1,
1.157309, -1.255085, 3.480239, 1, 0, 0.7686275, 1,
1.158271, 0.787764, 2.267833, 1, 0, 0.7607843, 1,
1.159306, 0.3398404, 1.175205, 1, 0, 0.7568628, 1,
1.163188, -1.950482, 3.657513, 1, 0, 0.7490196, 1,
1.163989, -1.141572, 2.149886, 1, 0, 0.7450981, 1,
1.164269, 0.9876171, 0.8267736, 1, 0, 0.7372549, 1,
1.177144, -0.8472932, 1.380593, 1, 0, 0.7333333, 1,
1.180572, 1.794522, 0.8644727, 1, 0, 0.7254902, 1,
1.183422, -0.9609981, 1.937005, 1, 0, 0.7215686, 1,
1.189083, -0.2873288, 0.6611556, 1, 0, 0.7137255, 1,
1.196654, 1.379887, 2.778298, 1, 0, 0.7098039, 1,
1.199258, -1.221382, 2.228435, 1, 0, 0.7019608, 1,
1.211251, 0.1726466, 0.4242659, 1, 0, 0.6941177, 1,
1.224265, 1.174558, 1.38431, 1, 0, 0.6901961, 1,
1.244193, 0.5310084, 0.9361996, 1, 0, 0.682353, 1,
1.261519, 0.2778357, 1.005895, 1, 0, 0.6784314, 1,
1.26877, 0.8998178, 2.979714, 1, 0, 0.6705883, 1,
1.272603, 0.1874025, 1.553606, 1, 0, 0.6666667, 1,
1.275412, 0.4761046, -1.617547, 1, 0, 0.6588235, 1,
1.279619, 0.3048287, 0.4108184, 1, 0, 0.654902, 1,
1.285958, -0.4307811, 1.42589, 1, 0, 0.6470588, 1,
1.288175, -1.168831, 0.8597606, 1, 0, 0.6431373, 1,
1.302414, -2.243837, 2.460543, 1, 0, 0.6352941, 1,
1.303579, -0.3189673, 1.514215, 1, 0, 0.6313726, 1,
1.305251, 0.280676, 1.74559, 1, 0, 0.6235294, 1,
1.31171, -0.4724198, 0.7139533, 1, 0, 0.6196079, 1,
1.318258, 1.358942, 0.4230369, 1, 0, 0.6117647, 1,
1.319485, 0.5582407, 1.465309, 1, 0, 0.6078432, 1,
1.326288, 0.8593998, 1.426161, 1, 0, 0.6, 1,
1.334664, -1.674771, 1.575042, 1, 0, 0.5921569, 1,
1.340254, 0.5006709, 1.081547, 1, 0, 0.5882353, 1,
1.35208, -1.096023, 2.091627, 1, 0, 0.5803922, 1,
1.353326, -1.511957, 2.727779, 1, 0, 0.5764706, 1,
1.357343, 0.3896686, 2.07913, 1, 0, 0.5686275, 1,
1.358792, -0.1641634, 1.460418, 1, 0, 0.5647059, 1,
1.362439, 0.9268199, 0.8154364, 1, 0, 0.5568628, 1,
1.370555, 0.06799057, 1.20223, 1, 0, 0.5529412, 1,
1.376778, -0.6712387, 2.666414, 1, 0, 0.5450981, 1,
1.377724, 1.443052, 1.946286, 1, 0, 0.5411765, 1,
1.380918, -0.498075, 1.680386, 1, 0, 0.5333334, 1,
1.389716, 0.3608782, 0.3291722, 1, 0, 0.5294118, 1,
1.396085, 1.705047, 0.4074431, 1, 0, 0.5215687, 1,
1.396872, 0.2641196, 1.537512, 1, 0, 0.5176471, 1,
1.401029, 0.9259655, 1.172703, 1, 0, 0.509804, 1,
1.408517, 1.412202, 2.107291, 1, 0, 0.5058824, 1,
1.426105, -0.1744829, 2.309864, 1, 0, 0.4980392, 1,
1.434675, 0.3405834, 3.527524, 1, 0, 0.4901961, 1,
1.452296, -1.842991, 1.539232, 1, 0, 0.4862745, 1,
1.482167, 1.451558, 1.116954, 1, 0, 0.4784314, 1,
1.495484, -0.02204721, 2.529546, 1, 0, 0.4745098, 1,
1.500604, -0.9131585, 2.362536, 1, 0, 0.4666667, 1,
1.529956, -0.03522665, 0.8304318, 1, 0, 0.4627451, 1,
1.532767, -1.338792, 1.257784, 1, 0, 0.454902, 1,
1.54024, -0.9289674, 0.3460092, 1, 0, 0.4509804, 1,
1.545286, -1.398627, 1.435317, 1, 0, 0.4431373, 1,
1.561933, -0.5216569, 2.396942, 1, 0, 0.4392157, 1,
1.571647, -0.2528427, 1.337953, 1, 0, 0.4313726, 1,
1.576592, -1.425417, 1.786093, 1, 0, 0.427451, 1,
1.583903, -0.8894539, 2.422894, 1, 0, 0.4196078, 1,
1.588323, -0.4230347, 0.8470443, 1, 0, 0.4156863, 1,
1.590697, 0.3371172, 0.8537666, 1, 0, 0.4078431, 1,
1.594809, 0.5157921, 1.043591, 1, 0, 0.4039216, 1,
1.599009, 0.1323335, -0.6342592, 1, 0, 0.3960784, 1,
1.609856, 0.4593972, 0.9905433, 1, 0, 0.3882353, 1,
1.611975, 0.3016478, 1.60924, 1, 0, 0.3843137, 1,
1.619493, 1.330868, 0.1959056, 1, 0, 0.3764706, 1,
1.621094, -0.06686234, 0.6433889, 1, 0, 0.372549, 1,
1.621802, -0.5832958, 1.113206, 1, 0, 0.3647059, 1,
1.629131, -0.5963337, 4.339048, 1, 0, 0.3607843, 1,
1.651909, 0.6868552, 0.5675457, 1, 0, 0.3529412, 1,
1.654097, 0.6128591, 0.5594242, 1, 0, 0.3490196, 1,
1.662825, -0.2905458, 1.570698, 1, 0, 0.3411765, 1,
1.66578, -0.0256609, 3.681319, 1, 0, 0.3372549, 1,
1.666509, 0.2456671, 1.039112, 1, 0, 0.3294118, 1,
1.666868, 0.3552473, 2.510894, 1, 0, 0.3254902, 1,
1.674454, -1.723083, 1.964087, 1, 0, 0.3176471, 1,
1.686465, 0.6745202, 1.756415, 1, 0, 0.3137255, 1,
1.688306, 1.606424, 1.511495, 1, 0, 0.3058824, 1,
1.688764, 0.7008558, 1.783965, 1, 0, 0.2980392, 1,
1.702729, 0.231917, 1.208499, 1, 0, 0.2941177, 1,
1.703673, -2.042726, 1.714529, 1, 0, 0.2862745, 1,
1.708985, 0.8380767, 1.581329, 1, 0, 0.282353, 1,
1.709715, -0.5558176, 3.013182, 1, 0, 0.2745098, 1,
1.710788, -1.121987, 2.288683, 1, 0, 0.2705882, 1,
1.718895, -0.4680012, 0.7756047, 1, 0, 0.2627451, 1,
1.7293, -0.8174382, 1.722206, 1, 0, 0.2588235, 1,
1.734098, 0.9747785, 1.201042, 1, 0, 0.2509804, 1,
1.753434, 0.09904669, 3.742041, 1, 0, 0.2470588, 1,
1.765647, -0.2125391, 1.543444, 1, 0, 0.2392157, 1,
1.782824, 1.477869, 1.659533, 1, 0, 0.2352941, 1,
1.821923, 2.551032, -0.08964432, 1, 0, 0.227451, 1,
1.822296, 0.798341, 1.751242, 1, 0, 0.2235294, 1,
1.827929, 1.988976, -0.06516321, 1, 0, 0.2156863, 1,
1.83911, -0.0742019, 1.023993, 1, 0, 0.2117647, 1,
1.869798, 1.002265, -1.440115, 1, 0, 0.2039216, 1,
1.880273, 0.1422558, 1.072415, 1, 0, 0.1960784, 1,
1.8858, 0.4257402, 1.781761, 1, 0, 0.1921569, 1,
1.899607, 0.07794725, 3.036221, 1, 0, 0.1843137, 1,
1.940695, -0.8505402, 1.745849, 1, 0, 0.1803922, 1,
1.949405, -1.056726, 0.7267948, 1, 0, 0.172549, 1,
1.969988, 1.063204, 0.5654066, 1, 0, 0.1686275, 1,
1.970582, -1.038736, 1.857708, 1, 0, 0.1607843, 1,
1.973973, -1.349081, 1.795877, 1, 0, 0.1568628, 1,
1.988907, 1.910457, 2.078272, 1, 0, 0.1490196, 1,
2.029451, 1.307519, 1.678128, 1, 0, 0.145098, 1,
2.056874, 2.593288, -0.3411489, 1, 0, 0.1372549, 1,
2.112245, 1.304989, 2.808326, 1, 0, 0.1333333, 1,
2.126371, -0.6473581, 2.254154, 1, 0, 0.1254902, 1,
2.133618, -1.228557, -1.113487, 1, 0, 0.1215686, 1,
2.13695, -1.686584, 1.705687, 1, 0, 0.1137255, 1,
2.143388, -1.819279, 4.362681, 1, 0, 0.1098039, 1,
2.14828, -0.1404027, 1.07504, 1, 0, 0.1019608, 1,
2.171579, 0.7592795, 0.8193204, 1, 0, 0.09411765, 1,
2.192052, -1.232801, 1.722046, 1, 0, 0.09019608, 1,
2.238302, -1.313613, 1.194105, 1, 0, 0.08235294, 1,
2.31891, 0.3041267, 0.2838095, 1, 0, 0.07843138, 1,
2.368158, -0.8551964, 2.254813, 1, 0, 0.07058824, 1,
2.398297, -0.624773, 0.1295467, 1, 0, 0.06666667, 1,
2.424119, -0.1133467, 2.016763, 1, 0, 0.05882353, 1,
2.442061, -0.2106514, 1.918196, 1, 0, 0.05490196, 1,
2.471872, 0.6059546, 1.949392, 1, 0, 0.04705882, 1,
2.48938, 0.9638891, 2.276818, 1, 0, 0.04313726, 1,
2.680747, -2.148512, 2.590983, 1, 0, 0.03529412, 1,
2.85221, 0.9658349, -0.1008377, 1, 0, 0.03137255, 1,
2.89426, 0.4035932, 0.5942104, 1, 0, 0.02352941, 1,
2.902071, -0.0005207887, 1.295117, 1, 0, 0.01960784, 1,
3.052118, 1.03806, -0.8081429, 1, 0, 0.01176471, 1,
3.446404, -1.257923, 0.8966109, 1, 0, 0.007843138, 1
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
0.4338757, -4.233059, -6.490158, 0, -0.5, 0.5, 0.5,
0.4338757, -4.233059, -6.490158, 1, -0.5, 0.5, 0.5,
0.4338757, -4.233059, -6.490158, 1, 1.5, 0.5, 0.5,
0.4338757, -4.233059, -6.490158, 0, 1.5, 0.5, 0.5
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
-3.599899, 0.1657521, -6.490158, 0, -0.5, 0.5, 0.5,
-3.599899, 0.1657521, -6.490158, 1, -0.5, 0.5, 0.5,
-3.599899, 0.1657521, -6.490158, 1, 1.5, 0.5, 0.5,
-3.599899, 0.1657521, -6.490158, 0, 1.5, 0.5, 0.5
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
-3.599899, -4.233059, 0.3503761, 0, -0.5, 0.5, 0.5,
-3.599899, -4.233059, 0.3503761, 1, -0.5, 0.5, 0.5,
-3.599899, -4.233059, 0.3503761, 1, 1.5, 0.5, 0.5,
-3.599899, -4.233059, 0.3503761, 0, 1.5, 0.5, 0.5
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
-2, -3.217949, -4.911573,
3, -3.217949, -4.911573,
-2, -3.217949, -4.911573,
-2, -3.387134, -5.17467,
-1, -3.217949, -4.911573,
-1, -3.387134, -5.17467,
0, -3.217949, -4.911573,
0, -3.387134, -5.17467,
1, -3.217949, -4.911573,
1, -3.387134, -5.17467,
2, -3.217949, -4.911573,
2, -3.387134, -5.17467,
3, -3.217949, -4.911573,
3, -3.387134, -5.17467
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
-2, -3.725504, -5.700865, 0, -0.5, 0.5, 0.5,
-2, -3.725504, -5.700865, 1, -0.5, 0.5, 0.5,
-2, -3.725504, -5.700865, 1, 1.5, 0.5, 0.5,
-2, -3.725504, -5.700865, 0, 1.5, 0.5, 0.5,
-1, -3.725504, -5.700865, 0, -0.5, 0.5, 0.5,
-1, -3.725504, -5.700865, 1, -0.5, 0.5, 0.5,
-1, -3.725504, -5.700865, 1, 1.5, 0.5, 0.5,
-1, -3.725504, -5.700865, 0, 1.5, 0.5, 0.5,
0, -3.725504, -5.700865, 0, -0.5, 0.5, 0.5,
0, -3.725504, -5.700865, 1, -0.5, 0.5, 0.5,
0, -3.725504, -5.700865, 1, 1.5, 0.5, 0.5,
0, -3.725504, -5.700865, 0, 1.5, 0.5, 0.5,
1, -3.725504, -5.700865, 0, -0.5, 0.5, 0.5,
1, -3.725504, -5.700865, 1, -0.5, 0.5, 0.5,
1, -3.725504, -5.700865, 1, 1.5, 0.5, 0.5,
1, -3.725504, -5.700865, 0, 1.5, 0.5, 0.5,
2, -3.725504, -5.700865, 0, -0.5, 0.5, 0.5,
2, -3.725504, -5.700865, 1, -0.5, 0.5, 0.5,
2, -3.725504, -5.700865, 1, 1.5, 0.5, 0.5,
2, -3.725504, -5.700865, 0, 1.5, 0.5, 0.5,
3, -3.725504, -5.700865, 0, -0.5, 0.5, 0.5,
3, -3.725504, -5.700865, 1, -0.5, 0.5, 0.5,
3, -3.725504, -5.700865, 1, 1.5, 0.5, 0.5,
3, -3.725504, -5.700865, 0, 1.5, 0.5, 0.5
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
-2.669028, -3, -4.911573,
-2.669028, 3, -4.911573,
-2.669028, -3, -4.911573,
-2.824173, -3, -5.17467,
-2.669028, -2, -4.911573,
-2.824173, -2, -5.17467,
-2.669028, -1, -4.911573,
-2.824173, -1, -5.17467,
-2.669028, 0, -4.911573,
-2.824173, 0, -5.17467,
-2.669028, 1, -4.911573,
-2.824173, 1, -5.17467,
-2.669028, 2, -4.911573,
-2.824173, 2, -5.17467,
-2.669028, 3, -4.911573,
-2.824173, 3, -5.17467
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
-3.134464, -3, -5.700865, 0, -0.5, 0.5, 0.5,
-3.134464, -3, -5.700865, 1, -0.5, 0.5, 0.5,
-3.134464, -3, -5.700865, 1, 1.5, 0.5, 0.5,
-3.134464, -3, -5.700865, 0, 1.5, 0.5, 0.5,
-3.134464, -2, -5.700865, 0, -0.5, 0.5, 0.5,
-3.134464, -2, -5.700865, 1, -0.5, 0.5, 0.5,
-3.134464, -2, -5.700865, 1, 1.5, 0.5, 0.5,
-3.134464, -2, -5.700865, 0, 1.5, 0.5, 0.5,
-3.134464, -1, -5.700865, 0, -0.5, 0.5, 0.5,
-3.134464, -1, -5.700865, 1, -0.5, 0.5, 0.5,
-3.134464, -1, -5.700865, 1, 1.5, 0.5, 0.5,
-3.134464, -1, -5.700865, 0, 1.5, 0.5, 0.5,
-3.134464, 0, -5.700865, 0, -0.5, 0.5, 0.5,
-3.134464, 0, -5.700865, 1, -0.5, 0.5, 0.5,
-3.134464, 0, -5.700865, 1, 1.5, 0.5, 0.5,
-3.134464, 0, -5.700865, 0, 1.5, 0.5, 0.5,
-3.134464, 1, -5.700865, 0, -0.5, 0.5, 0.5,
-3.134464, 1, -5.700865, 1, -0.5, 0.5, 0.5,
-3.134464, 1, -5.700865, 1, 1.5, 0.5, 0.5,
-3.134464, 1, -5.700865, 0, 1.5, 0.5, 0.5,
-3.134464, 2, -5.700865, 0, -0.5, 0.5, 0.5,
-3.134464, 2, -5.700865, 1, -0.5, 0.5, 0.5,
-3.134464, 2, -5.700865, 1, 1.5, 0.5, 0.5,
-3.134464, 2, -5.700865, 0, 1.5, 0.5, 0.5,
-3.134464, 3, -5.700865, 0, -0.5, 0.5, 0.5,
-3.134464, 3, -5.700865, 1, -0.5, 0.5, 0.5,
-3.134464, 3, -5.700865, 1, 1.5, 0.5, 0.5,
-3.134464, 3, -5.700865, 0, 1.5, 0.5, 0.5
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
-2.669028, -3.217949, -4,
-2.669028, -3.217949, 4,
-2.669028, -3.217949, -4,
-2.824173, -3.387134, -4,
-2.669028, -3.217949, -2,
-2.824173, -3.387134, -2,
-2.669028, -3.217949, 0,
-2.824173, -3.387134, 0,
-2.669028, -3.217949, 2,
-2.824173, -3.387134, 2,
-2.669028, -3.217949, 4,
-2.824173, -3.387134, 4
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
-3.134464, -3.725504, -4, 0, -0.5, 0.5, 0.5,
-3.134464, -3.725504, -4, 1, -0.5, 0.5, 0.5,
-3.134464, -3.725504, -4, 1, 1.5, 0.5, 0.5,
-3.134464, -3.725504, -4, 0, 1.5, 0.5, 0.5,
-3.134464, -3.725504, -2, 0, -0.5, 0.5, 0.5,
-3.134464, -3.725504, -2, 1, -0.5, 0.5, 0.5,
-3.134464, -3.725504, -2, 1, 1.5, 0.5, 0.5,
-3.134464, -3.725504, -2, 0, 1.5, 0.5, 0.5,
-3.134464, -3.725504, 0, 0, -0.5, 0.5, 0.5,
-3.134464, -3.725504, 0, 1, -0.5, 0.5, 0.5,
-3.134464, -3.725504, 0, 1, 1.5, 0.5, 0.5,
-3.134464, -3.725504, 0, 0, 1.5, 0.5, 0.5,
-3.134464, -3.725504, 2, 0, -0.5, 0.5, 0.5,
-3.134464, -3.725504, 2, 1, -0.5, 0.5, 0.5,
-3.134464, -3.725504, 2, 1, 1.5, 0.5, 0.5,
-3.134464, -3.725504, 2, 0, 1.5, 0.5, 0.5,
-3.134464, -3.725504, 4, 0, -0.5, 0.5, 0.5,
-3.134464, -3.725504, 4, 1, -0.5, 0.5, 0.5,
-3.134464, -3.725504, 4, 1, 1.5, 0.5, 0.5,
-3.134464, -3.725504, 4, 0, 1.5, 0.5, 0.5
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
-2.669028, -3.217949, -4.911573,
-2.669028, 3.549453, -4.911573,
-2.669028, -3.217949, 5.612325,
-2.669028, 3.549453, 5.612325,
-2.669028, -3.217949, -4.911573,
-2.669028, -3.217949, 5.612325,
-2.669028, 3.549453, -4.911573,
-2.669028, 3.549453, 5.612325,
-2.669028, -3.217949, -4.911573,
3.536779, -3.217949, -4.911573,
-2.669028, -3.217949, 5.612325,
3.536779, -3.217949, 5.612325,
-2.669028, 3.549453, -4.911573,
3.536779, 3.549453, -4.911573,
-2.669028, 3.549453, 5.612325,
3.536779, 3.549453, 5.612325,
3.536779, -3.217949, -4.911573,
3.536779, 3.549453, -4.911573,
3.536779, -3.217949, 5.612325,
3.536779, 3.549453, 5.612325,
3.536779, -3.217949, -4.911573,
3.536779, -3.217949, 5.612325,
3.536779, 3.549453, -4.911573,
3.536779, 3.549453, 5.612325
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
var radius = 7.457822;
var distance = 33.1807;
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
mvMatrix.translate( -0.4338757, -0.1657521, -0.3503761 );
mvMatrix.scale( 1.299354, 1.191527, 0.7662126 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.1807);
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
lenacil<-read.table("lenacil.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-lenacil$V2
```

```
## Error in eval(expr, envir, enclos): object 'lenacil' not found
```

```r
y<-lenacil$V3
```

```
## Error in eval(expr, envir, enclos): object 'lenacil' not found
```

```r
z<-lenacil$V4
```

```
## Error in eval(expr, envir, enclos): object 'lenacil' not found
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
-2.578652, -0.7282667, -1.863671, 0, 0, 1, 1, 1,
-2.521891, 0.9002801, 0.5024931, 1, 0, 0, 1, 1,
-2.50119, 0.4726813, -1.933806, 1, 0, 0, 1, 1,
-2.492895, -0.458922, -2.160763, 1, 0, 0, 1, 1,
-2.40682, 0.1237414, -0.2871198, 1, 0, 0, 1, 1,
-2.377277, -0.2086628, -1.453622, 1, 0, 0, 1, 1,
-2.311419, 0.02818121, -0.7374805, 0, 0, 0, 1, 1,
-2.294016, 0.3220261, -1.592874, 0, 0, 0, 1, 1,
-2.283525, -1.071219, -2.50804, 0, 0, 0, 1, 1,
-2.222904, 0.3361523, -1.13678, 0, 0, 0, 1, 1,
-2.100402, -0.9162545, -2.08874, 0, 0, 0, 1, 1,
-2.081842, -0.1884685, -2.827034, 0, 0, 0, 1, 1,
-2.07917, -0.8730063, -2.598555, 0, 0, 0, 1, 1,
-2.019374, 0.2310666, -1.395522, 1, 1, 1, 1, 1,
-2.009372, -0.3610916, -1.498392, 1, 1, 1, 1, 1,
-1.994749, -0.03820166, 0.2799586, 1, 1, 1, 1, 1,
-1.986948, -0.04327599, -1.802749, 1, 1, 1, 1, 1,
-1.9676, 2.38222, -0.826682, 1, 1, 1, 1, 1,
-1.954447, -0.3844263, 0.02440307, 1, 1, 1, 1, 1,
-1.919729, 0.3775068, -1.66282, 1, 1, 1, 1, 1,
-1.889218, 0.306457, 1.680815, 1, 1, 1, 1, 1,
-1.883609, -0.1016062, -2.457169, 1, 1, 1, 1, 1,
-1.881836, 1.065724, -0.9685409, 1, 1, 1, 1, 1,
-1.87887, -0.5811784, -2.993017, 1, 1, 1, 1, 1,
-1.872283, -1.350241, -2.203328, 1, 1, 1, 1, 1,
-1.836343, 0.709411, -2.207553, 1, 1, 1, 1, 1,
-1.820962, -0.2603777, -1.040319, 1, 1, 1, 1, 1,
-1.81106, 0.3037142, -1.566029, 1, 1, 1, 1, 1,
-1.799216, 1.076634, -1.322609, 0, 0, 1, 1, 1,
-1.7992, 0.7413546, 0.09553387, 1, 0, 0, 1, 1,
-1.798179, 1.087417, -1.902191, 1, 0, 0, 1, 1,
-1.796277, -1.293308, -1.241345, 1, 0, 0, 1, 1,
-1.787487, -0.5265138, -1.436916, 1, 0, 0, 1, 1,
-1.77449, 0.5788183, -1.422423, 1, 0, 0, 1, 1,
-1.7709, 0.2633621, -2.595701, 0, 0, 0, 1, 1,
-1.765398, 0.8505015, -0.7825451, 0, 0, 0, 1, 1,
-1.748572, 1.061594, -1.910421, 0, 0, 0, 1, 1,
-1.738627, -0.1302551, -2.560336, 0, 0, 0, 1, 1,
-1.737528, 0.1364659, -2.226016, 0, 0, 0, 1, 1,
-1.737017, -0.6044796, -1.529778, 0, 0, 0, 1, 1,
-1.734195, 0.1443952, 0.1918664, 0, 0, 0, 1, 1,
-1.733856, 0.6297454, -0.5316485, 1, 1, 1, 1, 1,
-1.720466, -0.725019, -2.718769, 1, 1, 1, 1, 1,
-1.713768, -0.0215124, -2.974027, 1, 1, 1, 1, 1,
-1.710683, -1.033435, -0.5795727, 1, 1, 1, 1, 1,
-1.708259, -0.510264, 0.1331345, 1, 1, 1, 1, 1,
-1.706461, -0.1109651, -1.976998, 1, 1, 1, 1, 1,
-1.706054, -0.9414519, -0.9726406, 1, 1, 1, 1, 1,
-1.688375, -1.014106, -2.12028, 1, 1, 1, 1, 1,
-1.6848, -0.08543924, -1.641525, 1, 1, 1, 1, 1,
-1.677702, -0.3029229, -2.656601, 1, 1, 1, 1, 1,
-1.660367, 0.6899752, -2.564687, 1, 1, 1, 1, 1,
-1.65891, 0.8340772, -1.320315, 1, 1, 1, 1, 1,
-1.655663, 0.6953378, -2.472971, 1, 1, 1, 1, 1,
-1.634692, -0.4314518, -0.8267944, 1, 1, 1, 1, 1,
-1.632711, -0.5658389, -1.368221, 1, 1, 1, 1, 1,
-1.62377, 0.03336921, -2.970209, 0, 0, 1, 1, 1,
-1.621775, 0.913226, -0.02659082, 1, 0, 0, 1, 1,
-1.588199, -0.4344805, -1.957003, 1, 0, 0, 1, 1,
-1.587578, -1.683082, -1.361894, 1, 0, 0, 1, 1,
-1.58027, -0.04474801, -1.388644, 1, 0, 0, 1, 1,
-1.576372, 0.08263981, -2.930937, 1, 0, 0, 1, 1,
-1.574763, 1.253693, -0.6643837, 0, 0, 0, 1, 1,
-1.566547, 0.4165614, 0.496335, 0, 0, 0, 1, 1,
-1.564823, -0.4924123, -0.02087652, 0, 0, 0, 1, 1,
-1.552433, -0.8543173, -2.349972, 0, 0, 0, 1, 1,
-1.551313, -0.2676792, -2.645682, 0, 0, 0, 1, 1,
-1.540675, 0.08063358, -1.050129, 0, 0, 0, 1, 1,
-1.530725, 1.941469, -2.683061, 0, 0, 0, 1, 1,
-1.523204, 2.577801, -0.06335939, 1, 1, 1, 1, 1,
-1.508951, -1.296872, -1.198743, 1, 1, 1, 1, 1,
-1.507185, -1.235118, -1.501408, 1, 1, 1, 1, 1,
-1.502726, 1.745117, -2.937264, 1, 1, 1, 1, 1,
-1.489266, 1.10843, -1.049209, 1, 1, 1, 1, 1,
-1.455761, -0.8435943, -2.748277, 1, 1, 1, 1, 1,
-1.455053, 2.080478, -1.093795, 1, 1, 1, 1, 1,
-1.451677, 1.890367, -2.26546, 1, 1, 1, 1, 1,
-1.443837, -0.05378184, 0.1972459, 1, 1, 1, 1, 1,
-1.436291, 0.1003162, -1.768703, 1, 1, 1, 1, 1,
-1.42747, 1.165048, -1.478476, 1, 1, 1, 1, 1,
-1.426545, -1.763877, -2.314012, 1, 1, 1, 1, 1,
-1.426022, -1.235323, -2.287401, 1, 1, 1, 1, 1,
-1.425665, 0.1422637, -2.674618, 1, 1, 1, 1, 1,
-1.402919, -0.3152706, 0.08758165, 1, 1, 1, 1, 1,
-1.397968, -0.4772512, -0.5633247, 0, 0, 1, 1, 1,
-1.396816, 1.372568, -1.933242, 1, 0, 0, 1, 1,
-1.395343, 0.8373896, 0.2624331, 1, 0, 0, 1, 1,
-1.379631, 0.9261745, 0.2814969, 1, 0, 0, 1, 1,
-1.368472, -0.6405594, -0.1530116, 1, 0, 0, 1, 1,
-1.36631, -0.5387179, -1.685211, 1, 0, 0, 1, 1,
-1.365261, 1.630407, -0.6517529, 0, 0, 0, 1, 1,
-1.360819, -0.7032222, -3.491271, 0, 0, 0, 1, 1,
-1.35723, 0.6672165, -2.038115, 0, 0, 0, 1, 1,
-1.356197, 1.013503, -0.9941197, 0, 0, 0, 1, 1,
-1.354905, 0.8976301, -1.211414, 0, 0, 0, 1, 1,
-1.343006, -0.3564456, -2.229529, 0, 0, 0, 1, 1,
-1.341662, 0.2254363, -1.08189, 0, 0, 0, 1, 1,
-1.338167, -0.5124741, -2.357904, 1, 1, 1, 1, 1,
-1.336626, -0.4748392, -1.899092, 1, 1, 1, 1, 1,
-1.331582, 1.105333, -2.434212, 1, 1, 1, 1, 1,
-1.326086, -1.41108, -2.925718, 1, 1, 1, 1, 1,
-1.321814, -0.9257165, -0.8327095, 1, 1, 1, 1, 1,
-1.302371, -0.9936056, -2.946662, 1, 1, 1, 1, 1,
-1.295302, 0.4850084, -1.760699, 1, 1, 1, 1, 1,
-1.279543, -0.2607366, -1.713078, 1, 1, 1, 1, 1,
-1.277328, -0.1684019, -2.355299, 1, 1, 1, 1, 1,
-1.272114, 1.509258, 1.47064, 1, 1, 1, 1, 1,
-1.269925, -1.369384, -0.7522012, 1, 1, 1, 1, 1,
-1.263239, -1.652096, -1.469977, 1, 1, 1, 1, 1,
-1.262042, -1.471241, -3.987496, 1, 1, 1, 1, 1,
-1.260028, 1.297631, -0.3682758, 1, 1, 1, 1, 1,
-1.257449, 1.421576, -1.40207, 1, 1, 1, 1, 1,
-1.255195, 0.1616556, -1.379084, 0, 0, 1, 1, 1,
-1.254679, 0.1581528, -0.2477721, 1, 0, 0, 1, 1,
-1.253645, -0.06145407, -1.387133, 1, 0, 0, 1, 1,
-1.251605, -1.513519, -3.433593, 1, 0, 0, 1, 1,
-1.249395, 0.6936441, 0.09833568, 1, 0, 0, 1, 1,
-1.225096, 0.3032064, -0.6554186, 1, 0, 0, 1, 1,
-1.210168, -0.04081922, 0.9189461, 0, 0, 0, 1, 1,
-1.201687, 1.023237, -1.677961, 0, 0, 0, 1, 1,
-1.199891, 0.01222352, -0.1323673, 0, 0, 0, 1, 1,
-1.199093, -1.274403, -2.191795, 0, 0, 0, 1, 1,
-1.193837, -0.3564806, -1.026923, 0, 0, 0, 1, 1,
-1.19265, 2.369947, -0.9589618, 0, 0, 0, 1, 1,
-1.186127, 1.712545, -0.6966038, 0, 0, 0, 1, 1,
-1.183986, 0.9411777, 0.7952884, 1, 1, 1, 1, 1,
-1.180762, 0.2629023, -2.13166, 1, 1, 1, 1, 1,
-1.178758, -1.547144, -3.627666, 1, 1, 1, 1, 1,
-1.175556, 0.2138381, -1.00986, 1, 1, 1, 1, 1,
-1.172796, -1.825117, -2.504193, 1, 1, 1, 1, 1,
-1.169233, 0.6170983, -0.865202, 1, 1, 1, 1, 1,
-1.167987, 1.572191, -0.4190916, 1, 1, 1, 1, 1,
-1.157126, 0.6970464, -2.299791, 1, 1, 1, 1, 1,
-1.146626, 0.415585, -1.299477, 1, 1, 1, 1, 1,
-1.143178, 0.1371302, -1.72077, 1, 1, 1, 1, 1,
-1.134635, 0.711345, -1.683908, 1, 1, 1, 1, 1,
-1.128528, -0.2190053, -3.231973, 1, 1, 1, 1, 1,
-1.124496, 1.013814, -0.2913248, 1, 1, 1, 1, 1,
-1.120135, 2.602916, -0.0081691, 1, 1, 1, 1, 1,
-1.117118, -1.451281, -2.956554, 1, 1, 1, 1, 1,
-1.10571, 2.030403, 0.1489052, 0, 0, 1, 1, 1,
-1.103155, 0.6306735, -1.518258, 1, 0, 0, 1, 1,
-1.098467, -0.09007391, -1.304597, 1, 0, 0, 1, 1,
-1.090934, 0.0290951, -1.738317, 1, 0, 0, 1, 1,
-1.088714, 1.581713, 0.4763545, 1, 0, 0, 1, 1,
-1.088052, 2.431127, -0.6042714, 1, 0, 0, 1, 1,
-1.077846, -0.1293014, -1.146129, 0, 0, 0, 1, 1,
-1.077575, -0.4741941, -2.157921, 0, 0, 0, 1, 1,
-1.073892, -1.161783, -1.871842, 0, 0, 0, 1, 1,
-1.072449, -0.2769868, -1.438836, 0, 0, 0, 1, 1,
-1.0628, 0.6524511, 1.289488, 0, 0, 0, 1, 1,
-1.057115, -0.5274546, -1.391806, 0, 0, 0, 1, 1,
-1.052012, -0.8704653, -2.06131, 0, 0, 0, 1, 1,
-1.051268, -1.536017, -0.7283286, 1, 1, 1, 1, 1,
-1.051207, 0.235788, -0.6951409, 1, 1, 1, 1, 1,
-1.044955, 0.02566825, -1.097717, 1, 1, 1, 1, 1,
-1.034781, 0.2918693, -0.4471779, 1, 1, 1, 1, 1,
-1.032521, 1.025936, -0.453501, 1, 1, 1, 1, 1,
-1.031632, 1.58318, 0.07374009, 1, 1, 1, 1, 1,
-1.030968, 0.3451625, -1.27368, 1, 1, 1, 1, 1,
-1.024877, -0.1277348, -1.912911, 1, 1, 1, 1, 1,
-1.022186, 0.5067962, -1.547633, 1, 1, 1, 1, 1,
-1.021055, -1.137406, -2.435544, 1, 1, 1, 1, 1,
-1.011646, 0.751348, 0.1307381, 1, 1, 1, 1, 1,
-1.009438, 0.1859378, 2.795875, 1, 1, 1, 1, 1,
-1.004308, 1.766768, 2.122029, 1, 1, 1, 1, 1,
-1.00035, -0.2818653, -2.588847, 1, 1, 1, 1, 1,
-0.9999875, -0.611043, -1.526493, 1, 1, 1, 1, 1,
-0.9978696, 1.064645, -0.8518636, 0, 0, 1, 1, 1,
-0.9749491, 1.440705, -0.1587873, 1, 0, 0, 1, 1,
-0.974786, 1.068862, -1.165702, 1, 0, 0, 1, 1,
-0.9693685, -0.4430878, -1.351181, 1, 0, 0, 1, 1,
-0.9660305, 0.339001, -0.670286, 1, 0, 0, 1, 1,
-0.9598776, 0.6882384, -0.8653939, 1, 0, 0, 1, 1,
-0.9518357, 0.0006939765, -1.264013, 0, 0, 0, 1, 1,
-0.950774, -0.6398666, -4.189752, 0, 0, 0, 1, 1,
-0.9450144, -1.086924, -3.107161, 0, 0, 0, 1, 1,
-0.9379287, -0.3296107, -1.572848, 0, 0, 0, 1, 1,
-0.9335609, 0.7838066, -1.155881, 0, 0, 0, 1, 1,
-0.9312146, 0.733767, -2.759922, 0, 0, 0, 1, 1,
-0.9287305, -0.04773534, -2.878407, 0, 0, 0, 1, 1,
-0.9276603, 0.6186367, -1.217641, 1, 1, 1, 1, 1,
-0.9275347, 1.448323, 2.586157, 1, 1, 1, 1, 1,
-0.9172847, 1.371142, -0.4426078, 1, 1, 1, 1, 1,
-0.9153607, -1.090172, -2.987193, 1, 1, 1, 1, 1,
-0.9149006, -1.550897, -4.758312, 1, 1, 1, 1, 1,
-0.9018645, 0.6076816, 1.312817, 1, 1, 1, 1, 1,
-0.9008855, -0.557113, -2.594537, 1, 1, 1, 1, 1,
-0.9001032, 0.1688814, -2.045308, 1, 1, 1, 1, 1,
-0.8964738, -2.52363, -4.351547, 1, 1, 1, 1, 1,
-0.8921335, 0.4834185, -1.332946, 1, 1, 1, 1, 1,
-0.8919457, -0.4045158, -1.462531, 1, 1, 1, 1, 1,
-0.8913576, -1.104113, -2.608921, 1, 1, 1, 1, 1,
-0.8897402, -0.7740648, -0.6288706, 1, 1, 1, 1, 1,
-0.8872558, 0.08312006, -0.4163963, 1, 1, 1, 1, 1,
-0.8795715, -0.8969625, -2.203614, 1, 1, 1, 1, 1,
-0.8789794, 1.4319, -1.794366, 0, 0, 1, 1, 1,
-0.8766529, -0.6669459, -1.233637, 1, 0, 0, 1, 1,
-0.8697672, 1.341341, -1.518269, 1, 0, 0, 1, 1,
-0.8694289, -1.53837, -3.304386, 1, 0, 0, 1, 1,
-0.8692887, -1.591309, -1.519594, 1, 0, 0, 1, 1,
-0.8688716, 0.005717396, -1.94986, 1, 0, 0, 1, 1,
-0.8686175, 0.3302848, -0.3206688, 0, 0, 0, 1, 1,
-0.8650486, 1.421019, -1.92999, 0, 0, 0, 1, 1,
-0.864601, -0.5900202, -2.581549, 0, 0, 0, 1, 1,
-0.8500916, 0.6063678, -0.05568495, 0, 0, 0, 1, 1,
-0.8453307, -0.08108271, -1.610332, 0, 0, 0, 1, 1,
-0.8444398, -1.506982, -2.125223, 0, 0, 0, 1, 1,
-0.8407291, 0.0752236, -2.148528, 0, 0, 0, 1, 1,
-0.8388883, -0.5462956, -3.856517, 1, 1, 1, 1, 1,
-0.8385856, -2.008976, -3.180972, 1, 1, 1, 1, 1,
-0.8359742, -0.5327673, -2.15341, 1, 1, 1, 1, 1,
-0.8357193, 0.3561569, -2.703119, 1, 1, 1, 1, 1,
-0.8342983, -0.9052892, -3.147598, 1, 1, 1, 1, 1,
-0.826543, -1.018534, -2.161858, 1, 1, 1, 1, 1,
-0.8139029, 0.9952216, -0.3715312, 1, 1, 1, 1, 1,
-0.8125343, -0.517709, -2.709428, 1, 1, 1, 1, 1,
-0.8077768, 0.7580242, -0.3814411, 1, 1, 1, 1, 1,
-0.8073004, 0.184092, -1.05988, 1, 1, 1, 1, 1,
-0.8066693, 0.1135248, -1.948939, 1, 1, 1, 1, 1,
-0.8048117, -2.042783, -3.683383, 1, 1, 1, 1, 1,
-0.8015869, 1.923099, -0.797665, 1, 1, 1, 1, 1,
-0.7981611, 1.400073, -0.5145167, 1, 1, 1, 1, 1,
-0.7940252, -0.3347365, -1.104279, 1, 1, 1, 1, 1,
-0.7925706, 1.42675, 0.4156829, 0, 0, 1, 1, 1,
-0.79184, 0.1791474, -1.00747, 1, 0, 0, 1, 1,
-0.7881721, -0.5182091, -2.532941, 1, 0, 0, 1, 1,
-0.7846903, 0.8469329, -2.298258, 1, 0, 0, 1, 1,
-0.7760199, -0.434614, -1.190168, 1, 0, 0, 1, 1,
-0.7710103, 0.7009305, -1.084154, 1, 0, 0, 1, 1,
-0.7645753, -0.9663376, -3.674368, 0, 0, 0, 1, 1,
-0.7641637, -0.01855721, -2.191117, 0, 0, 0, 1, 1,
-0.7640601, 0.05022749, -2.016701, 0, 0, 0, 1, 1,
-0.7455252, 0.5253326, -1.855193, 0, 0, 0, 1, 1,
-0.7414573, 1.143253, -2.585659, 0, 0, 0, 1, 1,
-0.7340742, 0.6040962, 0.2400395, 0, 0, 0, 1, 1,
-0.7337716, 0.5184229, -2.538468, 0, 0, 0, 1, 1,
-0.7310392, 3.450899, -0.9941574, 1, 1, 1, 1, 1,
-0.7271361, 0.3926495, 0.07187957, 1, 1, 1, 1, 1,
-0.7271148, 1.241714, 0.5918641, 1, 1, 1, 1, 1,
-0.7104131, -1.309052, -3.108892, 1, 1, 1, 1, 1,
-0.7094141, -0.4881731, -2.321458, 1, 1, 1, 1, 1,
-0.7055179, 0.3325949, -1.411244, 1, 1, 1, 1, 1,
-0.7019084, 0.7536198, -0.2835002, 1, 1, 1, 1, 1,
-0.6965055, -0.6035543, -2.169705, 1, 1, 1, 1, 1,
-0.6964521, 0.6201275, -0.1028542, 1, 1, 1, 1, 1,
-0.6910928, 0.4874261, -1.657699, 1, 1, 1, 1, 1,
-0.6902161, -0.8382148, -2.148853, 1, 1, 1, 1, 1,
-0.6854783, -0.09508801, -1.710621, 1, 1, 1, 1, 1,
-0.6820123, 3.146782, -0.7272033, 1, 1, 1, 1, 1,
-0.678595, 0.03547409, -2.906271, 1, 1, 1, 1, 1,
-0.6769413, -0.4453338, -1.706876, 1, 1, 1, 1, 1,
-0.6761573, 0.5869091, -1.266637, 0, 0, 1, 1, 1,
-0.6751453, 0.3988096, -0.350917, 1, 0, 0, 1, 1,
-0.6726117, 1.5007, -0.8809525, 1, 0, 0, 1, 1,
-0.672134, -0.4365165, -2.082716, 1, 0, 0, 1, 1,
-0.6616833, 1.143736, -0.5293821, 1, 0, 0, 1, 1,
-0.659251, 1.20226, -0.3903338, 1, 0, 0, 1, 1,
-0.6591804, -0.6198838, -2.546282, 0, 0, 0, 1, 1,
-0.6567569, -0.8330446, -2.040823, 0, 0, 0, 1, 1,
-0.6553798, -0.2006257, -1.449504, 0, 0, 0, 1, 1,
-0.651688, 1.274883, -0.2797799, 0, 0, 0, 1, 1,
-0.6486759, 0.6477487, -0.3268834, 0, 0, 0, 1, 1,
-0.6465517, -0.4613275, -4.021405, 0, 0, 0, 1, 1,
-0.6444201, -2.103893, -2.940883, 0, 0, 0, 1, 1,
-0.6376854, 0.3445412, -1.164579, 1, 1, 1, 1, 1,
-0.6373689, -1.288283, -2.597534, 1, 1, 1, 1, 1,
-0.6317205, 0.5150104, -0.3394727, 1, 1, 1, 1, 1,
-0.629103, 0.6762857, -1.462121, 1, 1, 1, 1, 1,
-0.6283434, 1.138175, -0.4168564, 1, 1, 1, 1, 1,
-0.6222892, 0.2080405, -0.3019336, 1, 1, 1, 1, 1,
-0.6160775, -0.3349482, -2.534506, 1, 1, 1, 1, 1,
-0.6150368, 0.4508551, -1.946315, 1, 1, 1, 1, 1,
-0.607602, 0.6108688, -0.3913036, 1, 1, 1, 1, 1,
-0.6062879, 0.7972448, -0.426595, 1, 1, 1, 1, 1,
-0.6048124, 0.1104784, -2.089274, 1, 1, 1, 1, 1,
-0.5968688, -1.056347, -2.794539, 1, 1, 1, 1, 1,
-0.5802074, 2.214242, 0.9853231, 1, 1, 1, 1, 1,
-0.5752333, -1.149966, -1.34936, 1, 1, 1, 1, 1,
-0.5740982, -0.5507902, -3.895276, 1, 1, 1, 1, 1,
-0.5711797, -0.4037597, -2.272537, 0, 0, 1, 1, 1,
-0.5708484, -0.09226922, -1.857974, 1, 0, 0, 1, 1,
-0.570767, 0.6582515, -0.4974101, 1, 0, 0, 1, 1,
-0.5697547, 1.401875, 1.54313, 1, 0, 0, 1, 1,
-0.5697488, -1.149792, -3.921976, 1, 0, 0, 1, 1,
-0.5628099, 0.5545934, -0.8953438, 1, 0, 0, 1, 1,
-0.5586066, 2.174059, -0.9991425, 0, 0, 0, 1, 1,
-0.5576258, 1.088191, -1.742034, 0, 0, 0, 1, 1,
-0.5569878, 1.030509, -1.540715, 0, 0, 0, 1, 1,
-0.5562071, -0.04708724, -0.398109, 0, 0, 0, 1, 1,
-0.5518037, -1.487723, -2.860755, 0, 0, 0, 1, 1,
-0.5445006, 2.416065, 0.4248843, 0, 0, 0, 1, 1,
-0.5444136, 1.242588, -2.340125, 0, 0, 0, 1, 1,
-0.5430228, 0.08743115, -1.346592, 1, 1, 1, 1, 1,
-0.5409514, 1.355506, -1.748701, 1, 1, 1, 1, 1,
-0.5407939, 1.463566, -0.6061187, 1, 1, 1, 1, 1,
-0.5386349, -0.5945051, -3.041885, 1, 1, 1, 1, 1,
-0.5272031, -0.9667387, -4.443107, 1, 1, 1, 1, 1,
-0.5226666, -0.1303687, -2.612608, 1, 1, 1, 1, 1,
-0.520279, 1.43076, -0.5528059, 1, 1, 1, 1, 1,
-0.5191498, 0.332808, 0.8717745, 1, 1, 1, 1, 1,
-0.5158279, -0.02957229, -2.196893, 1, 1, 1, 1, 1,
-0.515639, 0.2367489, -1.273649, 1, 1, 1, 1, 1,
-0.5081472, -0.09395096, -0.5345629, 1, 1, 1, 1, 1,
-0.507102, -0.4637889, -2.78146, 1, 1, 1, 1, 1,
-0.5051349, -1.548459, -1.823166, 1, 1, 1, 1, 1,
-0.5033187, 0.04446572, -0.5395494, 1, 1, 1, 1, 1,
-0.5027922, -0.2302274, -1.416281, 1, 1, 1, 1, 1,
-0.4978877, -1.180162, -2.668198, 0, 0, 1, 1, 1,
-0.4975166, -1.549487, -3.237032, 1, 0, 0, 1, 1,
-0.496192, -0.1848202, -0.2963547, 1, 0, 0, 1, 1,
-0.4945647, 0.05015858, -0.7458073, 1, 0, 0, 1, 1,
-0.4902245, 1.115067, 0.6348035, 1, 0, 0, 1, 1,
-0.4834827, -0.2101768, -2.191841, 1, 0, 0, 1, 1,
-0.4700988, -0.01336978, -0.7083166, 0, 0, 0, 1, 1,
-0.4693555, 1.025996, -0.630993, 0, 0, 0, 1, 1,
-0.4641355, -0.6101388, -1.029395, 0, 0, 0, 1, 1,
-0.4623406, -1.722109, -3.683007, 0, 0, 0, 1, 1,
-0.4607631, -0.3940985, 0.02828096, 0, 0, 0, 1, 1,
-0.4606376, -0.4833818, -1.886182, 0, 0, 0, 1, 1,
-0.4584736, -0.394405, -3.58547, 0, 0, 0, 1, 1,
-0.4549738, 0.0880966, -1.436691, 1, 1, 1, 1, 1,
-0.4500349, -0.7405904, -2.660972, 1, 1, 1, 1, 1,
-0.448568, -1.008082, -2.580505, 1, 1, 1, 1, 1,
-0.4471561, 0.394888, 0.2112992, 1, 1, 1, 1, 1,
-0.4468232, -0.2905295, -2.07074, 1, 1, 1, 1, 1,
-0.4447084, 0.6351722, -0.1725201, 1, 1, 1, 1, 1,
-0.4418914, -1.130905, -2.994818, 1, 1, 1, 1, 1,
-0.4414155, -0.894919, -3.193341, 1, 1, 1, 1, 1,
-0.4413829, -1.139327, -3.495995, 1, 1, 1, 1, 1,
-0.438852, 0.1815287, -0.7341975, 1, 1, 1, 1, 1,
-0.4373168, -1.266941, -3.460058, 1, 1, 1, 1, 1,
-0.4352136, 0.936166, 0.1669394, 1, 1, 1, 1, 1,
-0.43115, -1.154509, -3.266885, 1, 1, 1, 1, 1,
-0.4301842, 0.3858531, 0.1354081, 1, 1, 1, 1, 1,
-0.4193183, -0.7729521, -2.104028, 1, 1, 1, 1, 1,
-0.4144806, 0.2386583, -1.451493, 0, 0, 1, 1, 1,
-0.4132905, -0.4991686, -2.620035, 1, 0, 0, 1, 1,
-0.411182, -0.5195632, -3.430976, 1, 0, 0, 1, 1,
-0.4104568, 1.651347, -0.2455234, 1, 0, 0, 1, 1,
-0.4074029, -0.7551111, -2.062262, 1, 0, 0, 1, 1,
-0.40667, -1.146337, -3.157007, 1, 0, 0, 1, 1,
-0.3998328, -0.05658928, 0.2636332, 0, 0, 0, 1, 1,
-0.3958885, 0.5734535, -1.479826, 0, 0, 0, 1, 1,
-0.3953984, 0.1371595, -1.93086, 0, 0, 0, 1, 1,
-0.3940064, -1.056933, -2.514566, 0, 0, 0, 1, 1,
-0.3925585, 0.05552919, -2.319772, 0, 0, 0, 1, 1,
-0.3916472, 0.04412885, -1.008076, 0, 0, 0, 1, 1,
-0.3889972, -1.837647, -1.06446, 0, 0, 0, 1, 1,
-0.3888797, 0.7286248, -1.328726, 1, 1, 1, 1, 1,
-0.383996, 1.101429, 1.001893, 1, 1, 1, 1, 1,
-0.3812889, -0.5065626, -0.5405542, 1, 1, 1, 1, 1,
-0.3785687, -0.5055758, -2.879605, 1, 1, 1, 1, 1,
-0.3783256, 0.6956087, -0.1885087, 1, 1, 1, 1, 1,
-0.3777443, -0.03608524, -1.754745, 1, 1, 1, 1, 1,
-0.3765329, -0.2655579, -2.476087, 1, 1, 1, 1, 1,
-0.3738932, -0.4787595, -2.66889, 1, 1, 1, 1, 1,
-0.3725474, -0.6376555, -2.434419, 1, 1, 1, 1, 1,
-0.3714594, 0.117326, -2.435055, 1, 1, 1, 1, 1,
-0.3707529, -0.05684898, -0.4395181, 1, 1, 1, 1, 1,
-0.3653775, -0.1299213, -1.13832, 1, 1, 1, 1, 1,
-0.362435, -1.047998, -2.542243, 1, 1, 1, 1, 1,
-0.3595074, 1.583905, 0.5864133, 1, 1, 1, 1, 1,
-0.3571732, 1.541577, 1.636392, 1, 1, 1, 1, 1,
-0.3530476, -0.04253148, -2.633219, 0, 0, 1, 1, 1,
-0.3528494, -0.4378763, -3.19789, 1, 0, 0, 1, 1,
-0.3482576, 1.261972, -1.082792, 1, 0, 0, 1, 1,
-0.3454412, -0.249027, -0.9621745, 1, 0, 0, 1, 1,
-0.336684, 0.9263886, -0.7844169, 1, 0, 0, 1, 1,
-0.3347138, -0.2324173, -1.829822, 1, 0, 0, 1, 1,
-0.334585, 1.03387, -1.25453, 0, 0, 0, 1, 1,
-0.3329632, -0.4716454, -2.640915, 0, 0, 0, 1, 1,
-0.3322234, 0.4981147, 1.01192, 0, 0, 0, 1, 1,
-0.3317305, 2.404418, 0.3792517, 0, 0, 0, 1, 1,
-0.3268892, 1.158172, 0.4044935, 0, 0, 0, 1, 1,
-0.3201473, 0.4892901, 0.007812028, 0, 0, 0, 1, 1,
-0.320136, 0.02483397, -2.512885, 0, 0, 0, 1, 1,
-0.3168478, -0.6086851, -3.230185, 1, 1, 1, 1, 1,
-0.3162092, 1.492233, 1.021739, 1, 1, 1, 1, 1,
-0.3136314, -0.336527, -2.846746, 1, 1, 1, 1, 1,
-0.3093716, -1.503006, -1.489551, 1, 1, 1, 1, 1,
-0.3092551, -0.2450632, -1.198782, 1, 1, 1, 1, 1,
-0.3030401, 0.7326971, -1.03574, 1, 1, 1, 1, 1,
-0.3012586, 0.2507732, -1.770379, 1, 1, 1, 1, 1,
-0.2994676, 0.644474, -1.984221, 1, 1, 1, 1, 1,
-0.2986623, 0.929821, -0.8312137, 1, 1, 1, 1, 1,
-0.2969294, 2.93911, 1.371502, 1, 1, 1, 1, 1,
-0.2958713, 0.7149968, 0.1864981, 1, 1, 1, 1, 1,
-0.2935903, 1.599481, -0.4902341, 1, 1, 1, 1, 1,
-0.283967, 0.5214435, -1.635561, 1, 1, 1, 1, 1,
-0.2832419, -0.5343488, -2.425772, 1, 1, 1, 1, 1,
-0.2819724, 0.3864798, -0.1816415, 1, 1, 1, 1, 1,
-0.2810178, 1.447711, -2.734769, 0, 0, 1, 1, 1,
-0.2798862, -0.3653268, -1.59516, 1, 0, 0, 1, 1,
-0.2783545, -1.728572, -3.402953, 1, 0, 0, 1, 1,
-0.2757405, -0.6501597, -3.183599, 1, 0, 0, 1, 1,
-0.2747468, -0.143777, -1.918139, 1, 0, 0, 1, 1,
-0.2711113, -0.7593007, -3.207292, 1, 0, 0, 1, 1,
-0.271068, 0.106894, -1.343715, 0, 0, 0, 1, 1,
-0.2694021, -1.832594, -3.335746, 0, 0, 0, 1, 1,
-0.2679172, 0.2989011, -0.5669097, 0, 0, 0, 1, 1,
-0.2671849, -0.9607801, -3.367451, 0, 0, 0, 1, 1,
-0.2665181, -0.2390927, -2.385756, 0, 0, 0, 1, 1,
-0.2657648, 0.1751092, -0.642164, 0, 0, 0, 1, 1,
-0.2614177, 1.594178, 1.468637, 0, 0, 0, 1, 1,
-0.2609724, -1.041751, -1.51999, 1, 1, 1, 1, 1,
-0.2605972, 0.7424366, 1.07705, 1, 1, 1, 1, 1,
-0.2579446, -0.2632287, -1.990676, 1, 1, 1, 1, 1,
-0.2504696, 1.244781, -2.058956, 1, 1, 1, 1, 1,
-0.250352, -1.401977, -2.07954, 1, 1, 1, 1, 1,
-0.2425893, 0.644334, -3.155333, 1, 1, 1, 1, 1,
-0.2413957, -0.641028, -2.918006, 1, 1, 1, 1, 1,
-0.2405387, 0.06460207, -1.135918, 1, 1, 1, 1, 1,
-0.233493, 1.020264, 0.2023389, 1, 1, 1, 1, 1,
-0.2293941, -0.01981223, -2.141709, 1, 1, 1, 1, 1,
-0.2223499, 1.252078, -0.4875523, 1, 1, 1, 1, 1,
-0.2201238, 1.337861, -1.039489, 1, 1, 1, 1, 1,
-0.2174451, 0.9246383, 1.561873, 1, 1, 1, 1, 1,
-0.2047729, 0.06268797, -2.849821, 1, 1, 1, 1, 1,
-0.2032995, -1.096785, -4.559399, 1, 1, 1, 1, 1,
-0.1984544, 0.0918277, -0.9284171, 0, 0, 1, 1, 1,
-0.1974021, -1.486264, -4.449215, 1, 0, 0, 1, 1,
-0.197031, 0.3889283, -0.1462519, 1, 0, 0, 1, 1,
-0.1970056, 1.334992, -2.372566, 1, 0, 0, 1, 1,
-0.1965227, 0.7141681, 1.760635, 1, 0, 0, 1, 1,
-0.193212, -0.6235726, -3.178123, 1, 0, 0, 1, 1,
-0.1931623, 0.03396064, -1.465031, 0, 0, 0, 1, 1,
-0.1891691, 1.244287, -3.895637, 0, 0, 0, 1, 1,
-0.1890097, 0.0600884, -2.161028, 0, 0, 0, 1, 1,
-0.1835427, 0.7164462, 0.1305458, 0, 0, 0, 1, 1,
-0.1806739, 0.652215, -0.4955023, 0, 0, 0, 1, 1,
-0.1752204, 1.026667, -0.08722428, 0, 0, 0, 1, 1,
-0.171644, -0.9305896, -2.864388, 0, 0, 0, 1, 1,
-0.1675404, -0.7200589, -3.232353, 1, 1, 1, 1, 1,
-0.1658695, -0.6698208, -3.211554, 1, 1, 1, 1, 1,
-0.1587059, 1.303615, 0.2104106, 1, 1, 1, 1, 1,
-0.153937, -0.5009012, -3.868489, 1, 1, 1, 1, 1,
-0.1533777, -0.03608895, -0.1701898, 1, 1, 1, 1, 1,
-0.151611, -1.271148, -3.515499, 1, 1, 1, 1, 1,
-0.1452471, 0.3803364, -1.836671, 1, 1, 1, 1, 1,
-0.1451614, -1.242179, -3.040488, 1, 1, 1, 1, 1,
-0.143842, 0.627704, 1.205143, 1, 1, 1, 1, 1,
-0.143361, -0.06932979, -1.966417, 1, 1, 1, 1, 1,
-0.1418978, -0.6394088, -2.03861, 1, 1, 1, 1, 1,
-0.1364203, -0.975287, -2.291637, 1, 1, 1, 1, 1,
-0.1333614, -0.05813964, -4.754979, 1, 1, 1, 1, 1,
-0.1206173, -1.18192, -3.221821, 1, 1, 1, 1, 1,
-0.1198479, 0.08563998, -0.2129689, 1, 1, 1, 1, 1,
-0.1190429, 1.607692, 0.4982823, 0, 0, 1, 1, 1,
-0.114897, 0.3662229, 1.045005, 1, 0, 0, 1, 1,
-0.1128881, 1.209684, -0.1886422, 1, 0, 0, 1, 1,
-0.1123625, -1.190577, -2.386685, 1, 0, 0, 1, 1,
-0.1074976, 0.01625481, -2.396725, 1, 0, 0, 1, 1,
-0.10738, -0.5980816, -3.697691, 1, 0, 0, 1, 1,
-0.104704, 0.09014095, -1.266147, 0, 0, 0, 1, 1,
-0.1019661, 0.02172745, -0.4629699, 0, 0, 0, 1, 1,
-0.1014538, 0.1926987, 1.061316, 0, 0, 0, 1, 1,
-0.09935252, -0.1314928, -1.760933, 0, 0, 0, 1, 1,
-0.09791935, -0.03274015, -1.686064, 0, 0, 0, 1, 1,
-0.09790404, -0.3256335, -3.854243, 0, 0, 0, 1, 1,
-0.09537813, -0.3761906, -2.134764, 0, 0, 0, 1, 1,
-0.09313279, -1.510074, -1.990645, 1, 1, 1, 1, 1,
-0.0915644, 0.6075977, -1.477696, 1, 1, 1, 1, 1,
-0.08527441, -0.1348593, -1.833551, 1, 1, 1, 1, 1,
-0.0831184, 0.6627031, -0.9032, 1, 1, 1, 1, 1,
-0.07992291, 2.180169, -0.4843394, 1, 1, 1, 1, 1,
-0.07137139, 0.619355, 0.7141165, 1, 1, 1, 1, 1,
-0.06988093, 1.438402, -0.3284794, 1, 1, 1, 1, 1,
-0.06982446, 1.384597, 0.1320616, 1, 1, 1, 1, 1,
-0.06531946, 0.1672416, 0.4544718, 1, 1, 1, 1, 1,
-0.06330236, 0.6897171, -0.4538168, 1, 1, 1, 1, 1,
-0.06295571, -0.9683679, -2.710097, 1, 1, 1, 1, 1,
-0.06123596, 0.06552994, -1.802727, 1, 1, 1, 1, 1,
-0.05976704, -0.06784026, -1.719713, 1, 1, 1, 1, 1,
-0.05882793, 0.1541315, -0.08342281, 1, 1, 1, 1, 1,
-0.05588862, -0.6843976, -3.027833, 1, 1, 1, 1, 1,
-0.05362842, -0.2946282, -1.931471, 0, 0, 1, 1, 1,
-0.04262404, 0.5334495, 0.1972605, 1, 0, 0, 1, 1,
-0.04018923, -0.01228078, -2.739477, 1, 0, 0, 1, 1,
-0.03971679, -0.7314026, -3.159564, 1, 0, 0, 1, 1,
-0.0395924, 0.3671571, 0.1472901, 1, 0, 0, 1, 1,
-0.03907449, 0.8014975, -0.4041701, 1, 0, 0, 1, 1,
-0.03820371, -0.6927911, -2.895421, 0, 0, 0, 1, 1,
-0.03726726, 1.124102, -0.3419881, 0, 0, 0, 1, 1,
-0.03107761, 1.636041, -0.2873576, 0, 0, 0, 1, 1,
-0.0173871, 0.5740381, -0.02352981, 0, 0, 0, 1, 1,
-0.01501789, 1.376021, 0.2329518, 0, 0, 0, 1, 1,
-0.014387, -1.716358, -2.065943, 0, 0, 0, 1, 1,
-0.01160293, -1.202364, -2.665801, 0, 0, 0, 1, 1,
-0.007920505, 2.586999, -0.04147611, 1, 1, 1, 1, 1,
-0.004657963, -1.237555, -3.790249, 1, 1, 1, 1, 1,
-0.004316274, 1.258346, 2.005933, 1, 1, 1, 1, 1,
-0.004036717, 0.9930243, -0.1568299, 1, 1, 1, 1, 1,
-0.001995763, 0.8395824, 1.361679, 1, 1, 1, 1, 1,
-0.001291248, 0.3071036, -0.3429401, 1, 1, 1, 1, 1,
0.002165733, -1.321788, 5.426422, 1, 1, 1, 1, 1,
0.00279911, 2.068647, -1.944127, 1, 1, 1, 1, 1,
0.006337768, -0.6339163, 3.485593, 1, 1, 1, 1, 1,
0.007338066, -1.831308, 3.360435, 1, 1, 1, 1, 1,
0.01222034, 0.4500424, 0.05371392, 1, 1, 1, 1, 1,
0.01244409, 0.990022, 0.1538907, 1, 1, 1, 1, 1,
0.01544791, 0.796779, 1.338031, 1, 1, 1, 1, 1,
0.01641149, 0.3247309, 0.6238547, 1, 1, 1, 1, 1,
0.01914775, 0.3540196, 1.564825, 1, 1, 1, 1, 1,
0.02085501, 0.5190672, 0.9675602, 0, 0, 1, 1, 1,
0.02294143, -1.270715, 2.961771, 1, 0, 0, 1, 1,
0.02380038, 0.425184, 0.711848, 1, 0, 0, 1, 1,
0.02386979, 0.4622416, -0.5400766, 1, 0, 0, 1, 1,
0.0243456, 1.74626, 0.3142391, 1, 0, 0, 1, 1,
0.02437816, 0.1098979, -0.02639175, 1, 0, 0, 1, 1,
0.02541058, -0.1146258, 4.472167, 0, 0, 0, 1, 1,
0.0338029, 1.343888, 0.8030705, 0, 0, 0, 1, 1,
0.0351112, -1.405021, 2.001665, 0, 0, 0, 1, 1,
0.03593169, 0.1089397, 0.2513933, 0, 0, 0, 1, 1,
0.03779419, 0.6859241, -1.276269, 0, 0, 0, 1, 1,
0.03877993, 0.9385283, 1.23831, 0, 0, 0, 1, 1,
0.0393541, 0.8604888, 0.5497546, 0, 0, 0, 1, 1,
0.03976833, -0.5075901, 0.4979779, 1, 1, 1, 1, 1,
0.04178157, -1.100132, 4.28395, 1, 1, 1, 1, 1,
0.04231071, -1.132553, 3.231829, 1, 1, 1, 1, 1,
0.04316302, -1.852174, 2.919094, 1, 1, 1, 1, 1,
0.04325862, -1.055823, 3.482601, 1, 1, 1, 1, 1,
0.0441694, 0.5876789, -0.2133102, 1, 1, 1, 1, 1,
0.04940188, -0.1873434, 1.646022, 1, 1, 1, 1, 1,
0.05476011, -1.27531, 2.20985, 1, 1, 1, 1, 1,
0.05618676, 0.205413, -1.378904, 1, 1, 1, 1, 1,
0.05799848, -0.1517444, 1.201208, 1, 1, 1, 1, 1,
0.05962152, 0.416152, -1.629072, 1, 1, 1, 1, 1,
0.06396051, -0.6173673, 2.601537, 1, 1, 1, 1, 1,
0.06649086, 0.02515088, 2.089147, 1, 1, 1, 1, 1,
0.07520665, 0.1221552, -0.413474, 1, 1, 1, 1, 1,
0.07671607, 0.7852904, 0.9370414, 1, 1, 1, 1, 1,
0.07781519, 0.5046164, 2.098756, 0, 0, 1, 1, 1,
0.07824738, -1.556709, 4.665162, 1, 0, 0, 1, 1,
0.07988399, 1.67194, -0.4355817, 1, 0, 0, 1, 1,
0.08137307, -0.5609483, 1.847709, 1, 0, 0, 1, 1,
0.08177707, 0.7728124, -1.918865, 1, 0, 0, 1, 1,
0.08244471, 1.385047, 1.131132, 1, 0, 0, 1, 1,
0.0856414, 0.6720293, -0.6803359, 0, 0, 0, 1, 1,
0.09148873, -0.1917817, 2.808363, 0, 0, 0, 1, 1,
0.09155991, -0.2143224, 2.462703, 0, 0, 0, 1, 1,
0.09495203, 1.240125, -0.3801048, 0, 0, 0, 1, 1,
0.1046588, 0.03756014, 2.468855, 0, 0, 0, 1, 1,
0.1053339, 1.336347, 0.7993926, 0, 0, 0, 1, 1,
0.1097643, 0.5726956, -0.7697434, 0, 0, 0, 1, 1,
0.1106405, -0.3242256, 2.507162, 1, 1, 1, 1, 1,
0.1108103, 1.140921, -0.3331706, 1, 1, 1, 1, 1,
0.1117636, 0.8189021, 1.288897, 1, 1, 1, 1, 1,
0.1198314, 1.259522, 0.4187139, 1, 1, 1, 1, 1,
0.1199247, 1.482322, 0.5474387, 1, 1, 1, 1, 1,
0.1223246, -0.768514, 4.60942, 1, 1, 1, 1, 1,
0.1223709, 0.6152399, 1.519572, 1, 1, 1, 1, 1,
0.1233663, -0.2520108, 2.19626, 1, 1, 1, 1, 1,
0.126149, -1.916621, 3.929624, 1, 1, 1, 1, 1,
0.1270206, -1.418428, 3.322681, 1, 1, 1, 1, 1,
0.1400224, -0.1531216, 2.372986, 1, 1, 1, 1, 1,
0.1402423, -0.471018, 4.40843, 1, 1, 1, 1, 1,
0.1472375, 0.1193612, 0.3099492, 1, 1, 1, 1, 1,
0.1482414, -0.93386, 3.582165, 1, 1, 1, 1, 1,
0.1497143, 0.5337366, -0.8060926, 1, 1, 1, 1, 1,
0.1553908, -0.4154469, 5.459064, 0, 0, 1, 1, 1,
0.1612049, -1.294074, 2.901143, 1, 0, 0, 1, 1,
0.1656731, -1.873091, 1.774237, 1, 0, 0, 1, 1,
0.1713657, -0.3047571, 3.036675, 1, 0, 0, 1, 1,
0.1720455, -0.1892287, 0.8573757, 1, 0, 0, 1, 1,
0.1744904, -0.8075117, 5.06075, 1, 0, 0, 1, 1,
0.1749969, 0.4470039, -0.6354076, 0, 0, 0, 1, 1,
0.1856326, -1.268952, 4.610594, 0, 0, 0, 1, 1,
0.1864179, -0.2402622, 1.11309, 0, 0, 0, 1, 1,
0.186772, -1.75651, 1.324395, 0, 0, 0, 1, 1,
0.1872969, -0.3520764, -1.244292, 0, 0, 0, 1, 1,
0.1885191, -0.941512, 3.250087, 0, 0, 0, 1, 1,
0.1951556, -1.819644, 3.060607, 0, 0, 0, 1, 1,
0.1980338, 1.484431, 0.2003267, 1, 1, 1, 1, 1,
0.2005509, 0.6811511, 1.79119, 1, 1, 1, 1, 1,
0.2049368, 0.4407647, 2.273493, 1, 1, 1, 1, 1,
0.2063432, 0.03980151, 2.618296, 1, 1, 1, 1, 1,
0.2077488, 1.008501, -0.4401645, 1, 1, 1, 1, 1,
0.2106035, 0.3712969, 2.781121, 1, 1, 1, 1, 1,
0.2136586, -1.198427, 3.718427, 1, 1, 1, 1, 1,
0.2148237, 1.477259, 1.03501, 1, 1, 1, 1, 1,
0.2251551, -1.361281, 2.065215, 1, 1, 1, 1, 1,
0.2252139, 0.4700961, 0.4895377, 1, 1, 1, 1, 1,
0.2261258, 0.8765705, -1.724769, 1, 1, 1, 1, 1,
0.2270045, -0.8686807, 5.018217, 1, 1, 1, 1, 1,
0.2317589, -0.175522, 2.550192, 1, 1, 1, 1, 1,
0.2321518, -1.315165, 4.957198, 1, 1, 1, 1, 1,
0.2334481, 0.2777127, -0.5989273, 1, 1, 1, 1, 1,
0.2357789, -0.7859861, 4.005744, 0, 0, 1, 1, 1,
0.2394001, 0.6847558, 0.2437144, 1, 0, 0, 1, 1,
0.2478652, 0.0978699, 0.9483467, 1, 0, 0, 1, 1,
0.2496157, -0.3523555, 2.164887, 1, 0, 0, 1, 1,
0.2499618, -0.5459893, 1.063841, 1, 0, 0, 1, 1,
0.2505094, -0.36766, 2.327072, 1, 0, 0, 1, 1,
0.2554526, -0.3821082, 4.313225, 0, 0, 0, 1, 1,
0.2571112, -1.400502, 2.6252, 0, 0, 0, 1, 1,
0.2586473, -0.739027, 2.751856, 0, 0, 0, 1, 1,
0.2596023, -0.9023831, 1.705207, 0, 0, 0, 1, 1,
0.2602455, -0.286149, 3.173297, 0, 0, 0, 1, 1,
0.2608477, 0.6943699, 2.73232, 0, 0, 0, 1, 1,
0.2656921, 0.5115288, -0.1041971, 0, 0, 0, 1, 1,
0.2671208, 0.9520488, -0.2983275, 1, 1, 1, 1, 1,
0.2701645, 1.068758, 4.020072, 1, 1, 1, 1, 1,
0.27132, 0.1696589, 0.6146635, 1, 1, 1, 1, 1,
0.2736188, 0.6791651, 1.161465, 1, 1, 1, 1, 1,
0.2759779, 0.04810042, -0.3701421, 1, 1, 1, 1, 1,
0.277132, 0.0002617254, 3.088953, 1, 1, 1, 1, 1,
0.2772723, 0.3364825, 1.858571, 1, 1, 1, 1, 1,
0.2773229, 1.530141, -1.195417, 1, 1, 1, 1, 1,
0.2870584, 0.763994, -0.1887558, 1, 1, 1, 1, 1,
0.2897629, 0.1203146, 1.741747, 1, 1, 1, 1, 1,
0.2917721, -0.482211, 1.850032, 1, 1, 1, 1, 1,
0.291905, 0.6796871, -0.1691127, 1, 1, 1, 1, 1,
0.2929568, -0.03093966, 1.43465, 1, 1, 1, 1, 1,
0.2967087, -1.086291, 2.014861, 1, 1, 1, 1, 1,
0.2980915, -1.115384, 2.666471, 1, 1, 1, 1, 1,
0.3019101, 0.2487827, 0.733557, 0, 0, 1, 1, 1,
0.3047416, -0.03316466, 2.79233, 1, 0, 0, 1, 1,
0.3066097, -0.4687811, 3.830252, 1, 0, 0, 1, 1,
0.3066332, -1.01576, 2.084271, 1, 0, 0, 1, 1,
0.3083749, 0.7376267, -1.053815, 1, 0, 0, 1, 1,
0.3122799, 0.62194, 1.236593, 1, 0, 0, 1, 1,
0.3143384, -1.31956, 3.529216, 0, 0, 0, 1, 1,
0.3158582, -0.5920419, 3.5037, 0, 0, 0, 1, 1,
0.3260749, -1.459729, 2.672993, 0, 0, 0, 1, 1,
0.3295923, -1.38462, 2.079922, 0, 0, 0, 1, 1,
0.3298224, -1.258933, 2.384813, 0, 0, 0, 1, 1,
0.3323459, 0.1187045, 1.550034, 0, 0, 0, 1, 1,
0.3337964, -2.303699, 3.343719, 0, 0, 0, 1, 1,
0.3359951, 0.0554456, 1.566577, 1, 1, 1, 1, 1,
0.3369516, 0.5718513, 2.006057, 1, 1, 1, 1, 1,
0.34153, 0.8499851, -0.9917614, 1, 1, 1, 1, 1,
0.3438011, 2.43003, -0.5174253, 1, 1, 1, 1, 1,
0.3441865, -1.163688, 3.018829, 1, 1, 1, 1, 1,
0.3447522, 1.489387, -0.3467828, 1, 1, 1, 1, 1,
0.3456607, 0.6034715, -0.5775732, 1, 1, 1, 1, 1,
0.3485524, 0.5936703, -0.7744458, 1, 1, 1, 1, 1,
0.3496868, 0.9956657, -0.3447964, 1, 1, 1, 1, 1,
0.3516973, -1.120193, 3.551305, 1, 1, 1, 1, 1,
0.3562718, -0.4634355, 1.809242, 1, 1, 1, 1, 1,
0.3602963, -1.857478, 2.05229, 1, 1, 1, 1, 1,
0.3620308, -1.520457, 1.115326, 1, 1, 1, 1, 1,
0.3623483, -0.292329, 1.18413, 1, 1, 1, 1, 1,
0.3626229, -0.9077072, 2.044738, 1, 1, 1, 1, 1,
0.3665807, 0.1907176, 0.05406236, 0, 0, 1, 1, 1,
0.3671599, 0.8633258, 1.55318, 1, 0, 0, 1, 1,
0.3692979, 0.4001254, 2.414328, 1, 0, 0, 1, 1,
0.3748177, -0.2545992, 0.6494423, 1, 0, 0, 1, 1,
0.3781629, 0.4561169, 1.791584, 1, 0, 0, 1, 1,
0.3831056, 0.04168759, 0.09235107, 1, 0, 0, 1, 1,
0.3864623, 1.024327, 0.7747241, 0, 0, 0, 1, 1,
0.3878601, 1.232564, 1.700109, 0, 0, 0, 1, 1,
0.3896581, -0.2549053, 1.506995, 0, 0, 0, 1, 1,
0.3897127, -1.436241, 2.313279, 0, 0, 0, 1, 1,
0.3927474, 1.334882, 0.436986, 0, 0, 0, 1, 1,
0.394076, 1.078808, 0.3032636, 0, 0, 0, 1, 1,
0.3947906, 0.4395334, 0.1891728, 0, 0, 0, 1, 1,
0.4032055, 1.236699, 1.417482, 1, 1, 1, 1, 1,
0.4032149, 0.3439961, 0.36515, 1, 1, 1, 1, 1,
0.4042245, -0.6244391, 1.505545, 1, 1, 1, 1, 1,
0.405869, 1.343086, 2.494874, 1, 1, 1, 1, 1,
0.4130216, 0.3745921, 1.455275, 1, 1, 1, 1, 1,
0.4132662, 1.671233, 1.95267, 1, 1, 1, 1, 1,
0.4143348, 1.009797, 1.492713, 1, 1, 1, 1, 1,
0.4215399, 0.3323562, 2.355858, 1, 1, 1, 1, 1,
0.4222548, 2.727456, -0.832495, 1, 1, 1, 1, 1,
0.4236316, 0.00561907, 0.3190435, 1, 1, 1, 1, 1,
0.4249605, 0.9411987, -1.366623, 1, 1, 1, 1, 1,
0.4290705, 0.3236633, 0.9878795, 1, 1, 1, 1, 1,
0.4306495, 0.9841361, 1.606166, 1, 1, 1, 1, 1,
0.4316283, 0.367937, -0.4219825, 1, 1, 1, 1, 1,
0.4318626, 1.160403, 2.153575, 1, 1, 1, 1, 1,
0.4423191, -1.1119, 2.918713, 0, 0, 1, 1, 1,
0.4425142, -1.288067, 1.11335, 1, 0, 0, 1, 1,
0.4434603, -2.038973, 2.95209, 1, 0, 0, 1, 1,
0.4472659, -1.848416, 4.267612, 1, 0, 0, 1, 1,
0.4506166, -1.216482, 2.771399, 1, 0, 0, 1, 1,
0.453962, 0.06505968, 1.177602, 1, 0, 0, 1, 1,
0.4575651, 0.04623862, 1.823874, 0, 0, 0, 1, 1,
0.458729, 0.50589, -0.4339763, 0, 0, 0, 1, 1,
0.4596744, 0.4510076, 0.7672033, 0, 0, 0, 1, 1,
0.4619532, 1.475586, 0.734327, 0, 0, 0, 1, 1,
0.4652998, 0.1696393, 0.696569, 0, 0, 0, 1, 1,
0.4680231, -0.5969716, 1.005725, 0, 0, 0, 1, 1,
0.4680836, -1.415017, 1.912002, 0, 0, 0, 1, 1,
0.4762664, -1.042538, 3.624535, 1, 1, 1, 1, 1,
0.4769015, 0.4214129, -0.510508, 1, 1, 1, 1, 1,
0.4842593, 0.2196456, 0.08630638, 1, 1, 1, 1, 1,
0.4895064, 0.0621826, -0.006606726, 1, 1, 1, 1, 1,
0.4933969, -0.05090598, 0.7170337, 1, 1, 1, 1, 1,
0.4936428, -0.6574831, 3.042206, 1, 1, 1, 1, 1,
0.4994524, 2.334124, 1.115491, 1, 1, 1, 1, 1,
0.5010096, -0.3606471, 3.577494, 1, 1, 1, 1, 1,
0.5030668, -0.5105442, 3.327472, 1, 1, 1, 1, 1,
0.5047449, 1.561477, -0.2123598, 1, 1, 1, 1, 1,
0.5053463, 0.4389661, 1.296159, 1, 1, 1, 1, 1,
0.5073939, 1.661672, -0.1460637, 1, 1, 1, 1, 1,
0.5089943, -0.339348, 0.9011029, 1, 1, 1, 1, 1,
0.5118856, 1.035684, -0.5744904, 1, 1, 1, 1, 1,
0.5127842, 1.509054, -0.5074376, 1, 1, 1, 1, 1,
0.5142179, -0.8186982, 1.928856, 0, 0, 1, 1, 1,
0.5160046, -2.085781, 1.559235, 1, 0, 0, 1, 1,
0.5259082, 0.02517463, 1.336956, 1, 0, 0, 1, 1,
0.5263196, -1.54578, 2.306419, 1, 0, 0, 1, 1,
0.5301784, 0.9724957, -0.6861598, 1, 0, 0, 1, 1,
0.5322633, 0.5480029, -0.04913339, 1, 0, 0, 1, 1,
0.5346456, 0.878117, -0.995451, 0, 0, 0, 1, 1,
0.5351449, 1.836696, 2.658681, 0, 0, 0, 1, 1,
0.5370238, 0.2633116, 1.193216, 0, 0, 0, 1, 1,
0.5466782, -0.7191845, 3.298395, 0, 0, 0, 1, 1,
0.5468667, -0.9959543, 4.062649, 0, 0, 0, 1, 1,
0.5544133, -0.4359558, 1.367797, 0, 0, 0, 1, 1,
0.5551363, -0.7928144, 1.108556, 0, 0, 0, 1, 1,
0.5584052, -1.424097, 3.73386, 1, 1, 1, 1, 1,
0.560332, 1.555891, 1.074594, 1, 1, 1, 1, 1,
0.5630662, -2.39934, 2.2283, 1, 1, 1, 1, 1,
0.5638279, -0.3689902, 1.280308, 1, 1, 1, 1, 1,
0.5638984, -0.5049953, 3.195003, 1, 1, 1, 1, 1,
0.5640569, 0.09453905, 0.1269374, 1, 1, 1, 1, 1,
0.5691462, 0.4318635, 3.21268, 1, 1, 1, 1, 1,
0.5692744, 0.6986001, 1.175103, 1, 1, 1, 1, 1,
0.5714358, 0.5361474, 0.8549131, 1, 1, 1, 1, 1,
0.5733506, 1.049535, 0.8822827, 1, 1, 1, 1, 1,
0.5760927, 0.9146329, -0.3884045, 1, 1, 1, 1, 1,
0.5772004, -0.5803791, 2.224544, 1, 1, 1, 1, 1,
0.5809543, 0.09622222, -0.4813259, 1, 1, 1, 1, 1,
0.5899475, 1.247231, -1.495356, 1, 1, 1, 1, 1,
0.594653, -0.2387876, 1.067244, 1, 1, 1, 1, 1,
0.5968148, -1.701848, 2.798797, 0, 0, 1, 1, 1,
0.6082622, -1.313585, 1.96432, 1, 0, 0, 1, 1,
0.6122958, -0.1573047, 2.142635, 1, 0, 0, 1, 1,
0.6144737, 1.06284, 0.3632796, 1, 0, 0, 1, 1,
0.6151666, 0.2748991, 2.772722, 1, 0, 0, 1, 1,
0.6158288, -0.2547611, 1.595551, 1, 0, 0, 1, 1,
0.6212675, 0.07985676, 1.907547, 0, 0, 0, 1, 1,
0.6392931, 0.02718411, 1.887691, 0, 0, 0, 1, 1,
0.6415545, -0.2012224, 0.1041338, 0, 0, 0, 1, 1,
0.6439335, 1.304615, 2.322203, 0, 0, 0, 1, 1,
0.648641, 0.08200638, 1.828385, 0, 0, 0, 1, 1,
0.6524322, -1.020726, 2.375046, 0, 0, 0, 1, 1,
0.6529139, -0.1598445, 0.9052895, 0, 0, 0, 1, 1,
0.6575502, -0.6263738, 2.173855, 1, 1, 1, 1, 1,
0.6663694, 2.046286, -0.4380969, 1, 1, 1, 1, 1,
0.6674858, 0.05346829, 1.253248, 1, 1, 1, 1, 1,
0.6677339, -0.9992492, 3.329375, 1, 1, 1, 1, 1,
0.6678706, -0.9519148, 3.052253, 1, 1, 1, 1, 1,
0.6749594, -1.427652, 0.8334458, 1, 1, 1, 1, 1,
0.6815823, -0.224012, 2.225514, 1, 1, 1, 1, 1,
0.6828769, -2.481795, 3.701265, 1, 1, 1, 1, 1,
0.6863237, 0.3721524, 0.9650205, 1, 1, 1, 1, 1,
0.688119, -0.6024157, 2.670843, 1, 1, 1, 1, 1,
0.6896634, -1.434833, 1.46566, 1, 1, 1, 1, 1,
0.7035984, 0.942028, 2.310822, 1, 1, 1, 1, 1,
0.7050881, -1.037702, 2.684611, 1, 1, 1, 1, 1,
0.7051116, 1.301459, 0.2659253, 1, 1, 1, 1, 1,
0.7065687, 0.5358086, -0.2873154, 1, 1, 1, 1, 1,
0.7139074, 0.3764805, 0.6840267, 0, 0, 1, 1, 1,
0.7142711, -1.693099, 2.706368, 1, 0, 0, 1, 1,
0.7168363, -0.2216076, 2.369855, 1, 0, 0, 1, 1,
0.7218025, 0.1593891, 1.813665, 1, 0, 0, 1, 1,
0.7276257, 0.8188404, 1.222774, 1, 0, 0, 1, 1,
0.7327462, -0.4442506, 2.77632, 1, 0, 0, 1, 1,
0.7352, 1.7943, -0.1648967, 0, 0, 0, 1, 1,
0.7362809, -1.400289, 2.433717, 0, 0, 0, 1, 1,
0.7422725, -0.6059759, 2.402021, 0, 0, 0, 1, 1,
0.743807, 0.9453554, 1.89694, 0, 0, 0, 1, 1,
0.7474236, -1.548514, 2.241955, 0, 0, 0, 1, 1,
0.7586599, -0.1225148, 0.5096401, 0, 0, 0, 1, 1,
0.7591017, 0.7361138, -0.2742262, 0, 0, 0, 1, 1,
0.7608031, 0.5018431, -0.08455352, 1, 1, 1, 1, 1,
0.7635072, 0.4820212, 0.5491474, 1, 1, 1, 1, 1,
0.7639934, -1.180569, 3.681037, 1, 1, 1, 1, 1,
0.7708467, -0.3480357, 2.350687, 1, 1, 1, 1, 1,
0.7741249, -0.1309503, 1.306239, 1, 1, 1, 1, 1,
0.7766117, -0.6929786, 2.334461, 1, 1, 1, 1, 1,
0.7778694, 1.073707, 0.1752757, 1, 1, 1, 1, 1,
0.7781819, 0.1116526, 2.000959, 1, 1, 1, 1, 1,
0.7786761, -0.7152851, 2.909259, 1, 1, 1, 1, 1,
0.782153, -0.6903147, 0.9144184, 1, 1, 1, 1, 1,
0.78359, -1.304833, 2.720294, 1, 1, 1, 1, 1,
0.7837302, 0.003593483, 2.717703, 1, 1, 1, 1, 1,
0.7843586, 0.3656332, -0.2156894, 1, 1, 1, 1, 1,
0.7890857, -0.1318897, 1.62741, 1, 1, 1, 1, 1,
0.7899516, -0.3131191, 2.166025, 1, 1, 1, 1, 1,
0.7914345, -1.338395, 2.160666, 0, 0, 1, 1, 1,
0.7944781, -0.9729789, 2.740936, 1, 0, 0, 1, 1,
0.7991172, -0.4530578, 3.163394, 1, 0, 0, 1, 1,
0.8030388, 1.051488, 1.286959, 1, 0, 0, 1, 1,
0.803964, 0.8304631, 2.114621, 1, 0, 0, 1, 1,
0.8062396, -0.6425423, 2.193777, 1, 0, 0, 1, 1,
0.8093224, -0.9971951, 2.813261, 0, 0, 0, 1, 1,
0.8108866, -2.141808, 1.933039, 0, 0, 0, 1, 1,
0.8134162, 0.8054549, 1.308835, 0, 0, 0, 1, 1,
0.8227043, -0.8953701, 3.377002, 0, 0, 0, 1, 1,
0.8291833, 0.4211389, 1.357813, 0, 0, 0, 1, 1,
0.8320056, -2.204317, 2.393177, 0, 0, 0, 1, 1,
0.8341423, 1.180309, 0.2074045, 0, 0, 0, 1, 1,
0.8374085, 0.410276, 0.4063339, 1, 1, 1, 1, 1,
0.8447441, -1.194444, 4.117775, 1, 1, 1, 1, 1,
0.8470204, -0.5633906, 2.002444, 1, 1, 1, 1, 1,
0.8501214, -0.1440017, 1.982657, 1, 1, 1, 1, 1,
0.8539799, -0.7638498, 1.972767, 1, 1, 1, 1, 1,
0.8564759, -1.440023, 2.208759, 1, 1, 1, 1, 1,
0.8564944, 0.2160437, 0.7501727, 1, 1, 1, 1, 1,
0.863571, 0.2933879, 2.429096, 1, 1, 1, 1, 1,
0.872264, -0.05149352, 1.093805, 1, 1, 1, 1, 1,
0.8939312, 0.1005317, 1.335817, 1, 1, 1, 1, 1,
0.8979744, 0.1115, 1.787598, 1, 1, 1, 1, 1,
0.9004923, 1.244876, 1.667739, 1, 1, 1, 1, 1,
0.9067458, -0.5553486, 1.842929, 1, 1, 1, 1, 1,
0.9069502, 0.9420767, 1.235838, 1, 1, 1, 1, 1,
0.9102535, 0.5605233, 1.839447, 1, 1, 1, 1, 1,
0.9137337, 1.318985, 0.2003437, 0, 0, 1, 1, 1,
0.9226797, 0.364942, 0.7477714, 1, 0, 0, 1, 1,
0.9263083, 0.126588, 1.088082, 1, 0, 0, 1, 1,
0.935047, 0.6016868, 1.341811, 1, 0, 0, 1, 1,
0.9378988, 0.1889528, 0.8585436, 1, 0, 0, 1, 1,
0.9390087, 0.8893052, 0.7291062, 1, 0, 0, 1, 1,
0.9503695, -1.289321, 1.574722, 0, 0, 0, 1, 1,
0.9509272, -2.927935, 4.254709, 0, 0, 0, 1, 1,
0.9511774, -0.9128202, 3.346986, 0, 0, 0, 1, 1,
0.9521753, -0.9668816, 1.098348, 0, 0, 0, 1, 1,
0.9555384, 0.7944134, 0.174201, 0, 0, 0, 1, 1,
0.9557859, 1.465489, 2.112058, 0, 0, 0, 1, 1,
0.9574976, -1.427545, 3.74023, 0, 0, 0, 1, 1,
0.9598726, 0.479386, 1.245552, 1, 1, 1, 1, 1,
0.9606683, -0.3883143, 2.149714, 1, 1, 1, 1, 1,
0.9653322, -0.4501911, 2.202004, 1, 1, 1, 1, 1,
0.9666845, 1.246149, 0.5340133, 1, 1, 1, 1, 1,
0.969748, -1.364394, 2.161706, 1, 1, 1, 1, 1,
0.9699932, -1.765485, 1.423169, 1, 1, 1, 1, 1,
0.9739643, 1.126206, -0.6605542, 1, 1, 1, 1, 1,
0.9771749, 1.558447, -0.4632861, 1, 1, 1, 1, 1,
0.9805934, -0.3593161, 0.1080786, 1, 1, 1, 1, 1,
0.9831071, -0.1289575, 4.273799, 1, 1, 1, 1, 1,
0.9854038, -1.765971, 4.091329, 1, 1, 1, 1, 1,
0.9874162, 0.2057075, 1.292425, 1, 1, 1, 1, 1,
0.98816, -1.75625, 1.847513, 1, 1, 1, 1, 1,
0.9882553, -0.07807273, 0.7879598, 1, 1, 1, 1, 1,
0.9926496, 1.657417, 1.33175, 1, 1, 1, 1, 1,
0.9958519, -0.1136937, 1.504381, 0, 0, 1, 1, 1,
0.9987561, -2.511025, 2.764821, 1, 0, 0, 1, 1,
1.003926, 0.3005013, 2.83137, 1, 0, 0, 1, 1,
1.004789, -0.3083578, 2.852966, 1, 0, 0, 1, 1,
1.006785, -0.1658907, 2.292164, 1, 0, 0, 1, 1,
1.013418, 0.3316978, 0.7570779, 1, 0, 0, 1, 1,
1.014634, -1.47167, 5.100767, 0, 0, 0, 1, 1,
1.018099, 0.5732833, -2.041405, 0, 0, 0, 1, 1,
1.023112, 1.317274, -0.2439609, 0, 0, 0, 1, 1,
1.032102, 0.632855, 0.8532047, 0, 0, 0, 1, 1,
1.034852, -0.3891534, 2.112316, 0, 0, 0, 1, 1,
1.037382, -3.119395, 2.919158, 0, 0, 0, 1, 1,
1.044166, -0.2849744, 1.540071, 0, 0, 0, 1, 1,
1.06266, -0.6540248, 2.556026, 1, 1, 1, 1, 1,
1.068103, 1.848378, 0.3221985, 1, 1, 1, 1, 1,
1.070392, 0.07561691, 1.851305, 1, 1, 1, 1, 1,
1.075025, -2.047609, 1.836534, 1, 1, 1, 1, 1,
1.081837, -0.149111, 2.54885, 1, 1, 1, 1, 1,
1.090277, 0.3026457, -1.021423, 1, 1, 1, 1, 1,
1.097506, 0.8608727, 1.405142, 1, 1, 1, 1, 1,
1.099664, -0.2605955, 1.4699, 1, 1, 1, 1, 1,
1.104792, -1.925898, 2.258359, 1, 1, 1, 1, 1,
1.106645, -0.5053244, 1.563068, 1, 1, 1, 1, 1,
1.108718, -0.6266518, 0.1633128, 1, 1, 1, 1, 1,
1.120131, 0.293467, 0.8734586, 1, 1, 1, 1, 1,
1.120165, -1.394724, 2.577807, 1, 1, 1, 1, 1,
1.125519, -0.8684611, 2.001722, 1, 1, 1, 1, 1,
1.128191, -0.6079766, 1.70678, 1, 1, 1, 1, 1,
1.134284, 0.3875656, 1.92585, 0, 0, 1, 1, 1,
1.136422, 1.58049, 0.4300162, 1, 0, 0, 1, 1,
1.144736, -0.5079165, 2.783121, 1, 0, 0, 1, 1,
1.153193, 0.8864315, 0.7917414, 1, 0, 0, 1, 1,
1.157309, -1.255085, 3.480239, 1, 0, 0, 1, 1,
1.158271, 0.787764, 2.267833, 1, 0, 0, 1, 1,
1.159306, 0.3398404, 1.175205, 0, 0, 0, 1, 1,
1.163188, -1.950482, 3.657513, 0, 0, 0, 1, 1,
1.163989, -1.141572, 2.149886, 0, 0, 0, 1, 1,
1.164269, 0.9876171, 0.8267736, 0, 0, 0, 1, 1,
1.177144, -0.8472932, 1.380593, 0, 0, 0, 1, 1,
1.180572, 1.794522, 0.8644727, 0, 0, 0, 1, 1,
1.183422, -0.9609981, 1.937005, 0, 0, 0, 1, 1,
1.189083, -0.2873288, 0.6611556, 1, 1, 1, 1, 1,
1.196654, 1.379887, 2.778298, 1, 1, 1, 1, 1,
1.199258, -1.221382, 2.228435, 1, 1, 1, 1, 1,
1.211251, 0.1726466, 0.4242659, 1, 1, 1, 1, 1,
1.224265, 1.174558, 1.38431, 1, 1, 1, 1, 1,
1.244193, 0.5310084, 0.9361996, 1, 1, 1, 1, 1,
1.261519, 0.2778357, 1.005895, 1, 1, 1, 1, 1,
1.26877, 0.8998178, 2.979714, 1, 1, 1, 1, 1,
1.272603, 0.1874025, 1.553606, 1, 1, 1, 1, 1,
1.275412, 0.4761046, -1.617547, 1, 1, 1, 1, 1,
1.279619, 0.3048287, 0.4108184, 1, 1, 1, 1, 1,
1.285958, -0.4307811, 1.42589, 1, 1, 1, 1, 1,
1.288175, -1.168831, 0.8597606, 1, 1, 1, 1, 1,
1.302414, -2.243837, 2.460543, 1, 1, 1, 1, 1,
1.303579, -0.3189673, 1.514215, 1, 1, 1, 1, 1,
1.305251, 0.280676, 1.74559, 0, 0, 1, 1, 1,
1.31171, -0.4724198, 0.7139533, 1, 0, 0, 1, 1,
1.318258, 1.358942, 0.4230369, 1, 0, 0, 1, 1,
1.319485, 0.5582407, 1.465309, 1, 0, 0, 1, 1,
1.326288, 0.8593998, 1.426161, 1, 0, 0, 1, 1,
1.334664, -1.674771, 1.575042, 1, 0, 0, 1, 1,
1.340254, 0.5006709, 1.081547, 0, 0, 0, 1, 1,
1.35208, -1.096023, 2.091627, 0, 0, 0, 1, 1,
1.353326, -1.511957, 2.727779, 0, 0, 0, 1, 1,
1.357343, 0.3896686, 2.07913, 0, 0, 0, 1, 1,
1.358792, -0.1641634, 1.460418, 0, 0, 0, 1, 1,
1.362439, 0.9268199, 0.8154364, 0, 0, 0, 1, 1,
1.370555, 0.06799057, 1.20223, 0, 0, 0, 1, 1,
1.376778, -0.6712387, 2.666414, 1, 1, 1, 1, 1,
1.377724, 1.443052, 1.946286, 1, 1, 1, 1, 1,
1.380918, -0.498075, 1.680386, 1, 1, 1, 1, 1,
1.389716, 0.3608782, 0.3291722, 1, 1, 1, 1, 1,
1.396085, 1.705047, 0.4074431, 1, 1, 1, 1, 1,
1.396872, 0.2641196, 1.537512, 1, 1, 1, 1, 1,
1.401029, 0.9259655, 1.172703, 1, 1, 1, 1, 1,
1.408517, 1.412202, 2.107291, 1, 1, 1, 1, 1,
1.426105, -0.1744829, 2.309864, 1, 1, 1, 1, 1,
1.434675, 0.3405834, 3.527524, 1, 1, 1, 1, 1,
1.452296, -1.842991, 1.539232, 1, 1, 1, 1, 1,
1.482167, 1.451558, 1.116954, 1, 1, 1, 1, 1,
1.495484, -0.02204721, 2.529546, 1, 1, 1, 1, 1,
1.500604, -0.9131585, 2.362536, 1, 1, 1, 1, 1,
1.529956, -0.03522665, 0.8304318, 1, 1, 1, 1, 1,
1.532767, -1.338792, 1.257784, 0, 0, 1, 1, 1,
1.54024, -0.9289674, 0.3460092, 1, 0, 0, 1, 1,
1.545286, -1.398627, 1.435317, 1, 0, 0, 1, 1,
1.561933, -0.5216569, 2.396942, 1, 0, 0, 1, 1,
1.571647, -0.2528427, 1.337953, 1, 0, 0, 1, 1,
1.576592, -1.425417, 1.786093, 1, 0, 0, 1, 1,
1.583903, -0.8894539, 2.422894, 0, 0, 0, 1, 1,
1.588323, -0.4230347, 0.8470443, 0, 0, 0, 1, 1,
1.590697, 0.3371172, 0.8537666, 0, 0, 0, 1, 1,
1.594809, 0.5157921, 1.043591, 0, 0, 0, 1, 1,
1.599009, 0.1323335, -0.6342592, 0, 0, 0, 1, 1,
1.609856, 0.4593972, 0.9905433, 0, 0, 0, 1, 1,
1.611975, 0.3016478, 1.60924, 0, 0, 0, 1, 1,
1.619493, 1.330868, 0.1959056, 1, 1, 1, 1, 1,
1.621094, -0.06686234, 0.6433889, 1, 1, 1, 1, 1,
1.621802, -0.5832958, 1.113206, 1, 1, 1, 1, 1,
1.629131, -0.5963337, 4.339048, 1, 1, 1, 1, 1,
1.651909, 0.6868552, 0.5675457, 1, 1, 1, 1, 1,
1.654097, 0.6128591, 0.5594242, 1, 1, 1, 1, 1,
1.662825, -0.2905458, 1.570698, 1, 1, 1, 1, 1,
1.66578, -0.0256609, 3.681319, 1, 1, 1, 1, 1,
1.666509, 0.2456671, 1.039112, 1, 1, 1, 1, 1,
1.666868, 0.3552473, 2.510894, 1, 1, 1, 1, 1,
1.674454, -1.723083, 1.964087, 1, 1, 1, 1, 1,
1.686465, 0.6745202, 1.756415, 1, 1, 1, 1, 1,
1.688306, 1.606424, 1.511495, 1, 1, 1, 1, 1,
1.688764, 0.7008558, 1.783965, 1, 1, 1, 1, 1,
1.702729, 0.231917, 1.208499, 1, 1, 1, 1, 1,
1.703673, -2.042726, 1.714529, 0, 0, 1, 1, 1,
1.708985, 0.8380767, 1.581329, 1, 0, 0, 1, 1,
1.709715, -0.5558176, 3.013182, 1, 0, 0, 1, 1,
1.710788, -1.121987, 2.288683, 1, 0, 0, 1, 1,
1.718895, -0.4680012, 0.7756047, 1, 0, 0, 1, 1,
1.7293, -0.8174382, 1.722206, 1, 0, 0, 1, 1,
1.734098, 0.9747785, 1.201042, 0, 0, 0, 1, 1,
1.753434, 0.09904669, 3.742041, 0, 0, 0, 1, 1,
1.765647, -0.2125391, 1.543444, 0, 0, 0, 1, 1,
1.782824, 1.477869, 1.659533, 0, 0, 0, 1, 1,
1.821923, 2.551032, -0.08964432, 0, 0, 0, 1, 1,
1.822296, 0.798341, 1.751242, 0, 0, 0, 1, 1,
1.827929, 1.988976, -0.06516321, 0, 0, 0, 1, 1,
1.83911, -0.0742019, 1.023993, 1, 1, 1, 1, 1,
1.869798, 1.002265, -1.440115, 1, 1, 1, 1, 1,
1.880273, 0.1422558, 1.072415, 1, 1, 1, 1, 1,
1.8858, 0.4257402, 1.781761, 1, 1, 1, 1, 1,
1.899607, 0.07794725, 3.036221, 1, 1, 1, 1, 1,
1.940695, -0.8505402, 1.745849, 1, 1, 1, 1, 1,
1.949405, -1.056726, 0.7267948, 1, 1, 1, 1, 1,
1.969988, 1.063204, 0.5654066, 1, 1, 1, 1, 1,
1.970582, -1.038736, 1.857708, 1, 1, 1, 1, 1,
1.973973, -1.349081, 1.795877, 1, 1, 1, 1, 1,
1.988907, 1.910457, 2.078272, 1, 1, 1, 1, 1,
2.029451, 1.307519, 1.678128, 1, 1, 1, 1, 1,
2.056874, 2.593288, -0.3411489, 1, 1, 1, 1, 1,
2.112245, 1.304989, 2.808326, 1, 1, 1, 1, 1,
2.126371, -0.6473581, 2.254154, 1, 1, 1, 1, 1,
2.133618, -1.228557, -1.113487, 0, 0, 1, 1, 1,
2.13695, -1.686584, 1.705687, 1, 0, 0, 1, 1,
2.143388, -1.819279, 4.362681, 1, 0, 0, 1, 1,
2.14828, -0.1404027, 1.07504, 1, 0, 0, 1, 1,
2.171579, 0.7592795, 0.8193204, 1, 0, 0, 1, 1,
2.192052, -1.232801, 1.722046, 1, 0, 0, 1, 1,
2.238302, -1.313613, 1.194105, 0, 0, 0, 1, 1,
2.31891, 0.3041267, 0.2838095, 0, 0, 0, 1, 1,
2.368158, -0.8551964, 2.254813, 0, 0, 0, 1, 1,
2.398297, -0.624773, 0.1295467, 0, 0, 0, 1, 1,
2.424119, -0.1133467, 2.016763, 0, 0, 0, 1, 1,
2.442061, -0.2106514, 1.918196, 0, 0, 0, 1, 1,
2.471872, 0.6059546, 1.949392, 0, 0, 0, 1, 1,
2.48938, 0.9638891, 2.276818, 1, 1, 1, 1, 1,
2.680747, -2.148512, 2.590983, 1, 1, 1, 1, 1,
2.85221, 0.9658349, -0.1008377, 1, 1, 1, 1, 1,
2.89426, 0.4035932, 0.5942104, 1, 1, 1, 1, 1,
2.902071, -0.0005207887, 1.295117, 1, 1, 1, 1, 1,
3.052118, 1.03806, -0.8081429, 1, 1, 1, 1, 1,
3.446404, -1.257923, 0.8966109, 1, 1, 1, 1, 1
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
var radius = 9.319469;
var distance = 32.73424;
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
mvMatrix.translate( -0.4338757, -0.1657522, -0.3503761 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.73424);
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
