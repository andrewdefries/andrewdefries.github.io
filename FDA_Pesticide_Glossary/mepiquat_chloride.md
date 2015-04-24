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
-3.264637, 0.8190694, -0.6360005, 1, 0, 0, 1,
-3.191226, -0.8068755, -2.02216, 1, 0.007843138, 0, 1,
-3.182201, 0.8598668, -1.665114, 1, 0.01176471, 0, 1,
-2.703211, -1.232713, -1.966209, 1, 0.01960784, 0, 1,
-2.662512, -1.06229, -3.405165, 1, 0.02352941, 0, 1,
-2.610699, -0.7033336, -1.905116, 1, 0.03137255, 0, 1,
-2.486536, -0.4221482, -1.922155, 1, 0.03529412, 0, 1,
-2.435539, -1.122619, -1.098541, 1, 0.04313726, 0, 1,
-2.331419, 0.3928621, 0.2141443, 1, 0.04705882, 0, 1,
-2.280444, 1.598164, -1.727783, 1, 0.05490196, 0, 1,
-2.184655, 0.9458581, -1.81481, 1, 0.05882353, 0, 1,
-2.133209, 0.05556185, -1.304152, 1, 0.06666667, 0, 1,
-2.114377, 0.2527947, -1.441624, 1, 0.07058824, 0, 1,
-2.058845, -0.5566376, -3.342231, 1, 0.07843138, 0, 1,
-1.979076, 0.2420614, -1.185956, 1, 0.08235294, 0, 1,
-1.972541, 0.6888255, -2.633899, 1, 0.09019608, 0, 1,
-1.957344, -0.815966, -2.144309, 1, 0.09411765, 0, 1,
-1.943953, 0.3234476, -1.218607, 1, 0.1019608, 0, 1,
-1.942357, -0.6541514, -2.579592, 1, 0.1098039, 0, 1,
-1.923772, 0.7129044, -2.846652, 1, 0.1137255, 0, 1,
-1.898266, 1.747806, -0.8683273, 1, 0.1215686, 0, 1,
-1.892668, 0.147573, -2.124614, 1, 0.1254902, 0, 1,
-1.843605, 2.009782, 0.6620464, 1, 0.1333333, 0, 1,
-1.838915, 0.311137, -0.1338924, 1, 0.1372549, 0, 1,
-1.828872, -1.009148, -3.171122, 1, 0.145098, 0, 1,
-1.823398, 0.7137694, -0.2265896, 1, 0.1490196, 0, 1,
-1.815045, -0.5061821, -3.29029, 1, 0.1568628, 0, 1,
-1.81379, -1.077665, -2.556552, 1, 0.1607843, 0, 1,
-1.812442, -0.572325, -0.1735577, 1, 0.1686275, 0, 1,
-1.798317, 0.1832742, -0.9384359, 1, 0.172549, 0, 1,
-1.778736, 0.2010268, -0.7404525, 1, 0.1803922, 0, 1,
-1.75698, 1.254661, -1.266276, 1, 0.1843137, 0, 1,
-1.747841, 0.5073542, -1.416156, 1, 0.1921569, 0, 1,
-1.745002, -0.2347475, -1.26999, 1, 0.1960784, 0, 1,
-1.742447, 0.613573, -1.578268, 1, 0.2039216, 0, 1,
-1.737142, 0.9940942, -2.417861, 1, 0.2117647, 0, 1,
-1.725442, 0.5112248, -1.934122, 1, 0.2156863, 0, 1,
-1.711382, -1.84056, -1.322648, 1, 0.2235294, 0, 1,
-1.676582, 0.1201082, -2.866856, 1, 0.227451, 0, 1,
-1.653713, -1.428178, -2.24766, 1, 0.2352941, 0, 1,
-1.647152, 1.568411, 0.5965809, 1, 0.2392157, 0, 1,
-1.642827, -0.763613, -2.571562, 1, 0.2470588, 0, 1,
-1.622425, 0.8643602, 0.2631593, 1, 0.2509804, 0, 1,
-1.603025, -0.3320439, -3.240038, 1, 0.2588235, 0, 1,
-1.595098, -0.4701844, -1.610656, 1, 0.2627451, 0, 1,
-1.587716, -0.243946, -1.251614, 1, 0.2705882, 0, 1,
-1.579694, -0.4450457, -1.727051, 1, 0.2745098, 0, 1,
-1.571458, 0.9963548, -1.335454, 1, 0.282353, 0, 1,
-1.561194, 0.7420526, -3.0831, 1, 0.2862745, 0, 1,
-1.557609, -1.072917, -2.68679, 1, 0.2941177, 0, 1,
-1.557138, 0.4252418, -0.9916467, 1, 0.3019608, 0, 1,
-1.543146, 1.333001, 1.054232, 1, 0.3058824, 0, 1,
-1.535419, 0.007008479, -1.527757, 1, 0.3137255, 0, 1,
-1.526978, 1.345853, -0.6783294, 1, 0.3176471, 0, 1,
-1.507598, 0.6207465, -1.47604, 1, 0.3254902, 0, 1,
-1.506534, -1.058556, -2.011247, 1, 0.3294118, 0, 1,
-1.50266, 0.1404827, -2.20803, 1, 0.3372549, 0, 1,
-1.493885, -0.9665674, -3.871669, 1, 0.3411765, 0, 1,
-1.489791, -0.8452706, -2.494959, 1, 0.3490196, 0, 1,
-1.471586, 2.379182, -1.637811, 1, 0.3529412, 0, 1,
-1.465122, -0.9591849, -2.685864, 1, 0.3607843, 0, 1,
-1.456686, 0.260889, -0.6348378, 1, 0.3647059, 0, 1,
-1.456067, -0.4991702, -1.761277, 1, 0.372549, 0, 1,
-1.456039, -0.7568635, -0.8704574, 1, 0.3764706, 0, 1,
-1.453847, -0.4647184, -2.146321, 1, 0.3843137, 0, 1,
-1.441005, 0.1857083, -2.731269, 1, 0.3882353, 0, 1,
-1.437149, -0.354426, -1.887984, 1, 0.3960784, 0, 1,
-1.414127, 0.2775517, -1.410163, 1, 0.4039216, 0, 1,
-1.413211, 1.442834, 0.9151914, 1, 0.4078431, 0, 1,
-1.410072, -1.783707, -1.999966, 1, 0.4156863, 0, 1,
-1.389442, -0.09476664, -1.938002, 1, 0.4196078, 0, 1,
-1.381058, -0.2804546, -1.022686, 1, 0.427451, 0, 1,
-1.376739, 0.2258622, -2.310728, 1, 0.4313726, 0, 1,
-1.356979, 1.976944, -1.438214, 1, 0.4392157, 0, 1,
-1.353621, 0.4533201, -0.5024614, 1, 0.4431373, 0, 1,
-1.353547, -2.211059, -3.508379, 1, 0.4509804, 0, 1,
-1.351518, 1.940862, -1.167659, 1, 0.454902, 0, 1,
-1.340724, -0.3300195, -2.245735, 1, 0.4627451, 0, 1,
-1.329763, -0.7732458, -1.760744, 1, 0.4666667, 0, 1,
-1.329702, 0.371625, -2.060265, 1, 0.4745098, 0, 1,
-1.322061, -1.138441, -3.474224, 1, 0.4784314, 0, 1,
-1.317385, 0.3213002, -1.287233, 1, 0.4862745, 0, 1,
-1.315491, -0.06512641, -0.2164794, 1, 0.4901961, 0, 1,
-1.313835, -0.7326132, -2.788224, 1, 0.4980392, 0, 1,
-1.313006, 1.286281, -2.303382, 1, 0.5058824, 0, 1,
-1.308585, 0.6720223, 0.2722335, 1, 0.509804, 0, 1,
-1.301748, 0.6601772, -1.634956, 1, 0.5176471, 0, 1,
-1.280583, -0.01806352, -1.356869, 1, 0.5215687, 0, 1,
-1.271946, -0.07323028, -1.579516, 1, 0.5294118, 0, 1,
-1.270344, -0.8928997, -2.847061, 1, 0.5333334, 0, 1,
-1.269268, 0.8535904, 0.3636154, 1, 0.5411765, 0, 1,
-1.246959, -0.9588327, -0.6994214, 1, 0.5450981, 0, 1,
-1.242459, 0.2162687, -0.8210841, 1, 0.5529412, 0, 1,
-1.241275, 0.06623669, -0.4206463, 1, 0.5568628, 0, 1,
-1.23678, 0.9979216, 0.8277571, 1, 0.5647059, 0, 1,
-1.234067, 0.6640792, -1.568786, 1, 0.5686275, 0, 1,
-1.233766, -1.193094, -1.842556, 1, 0.5764706, 0, 1,
-1.230047, 0.8214504, -1.046487, 1, 0.5803922, 0, 1,
-1.215621, 0.2439379, -2.119992, 1, 0.5882353, 0, 1,
-1.189163, -0.1509759, -1.193654, 1, 0.5921569, 0, 1,
-1.188811, 0.6677995, -1.976391, 1, 0.6, 0, 1,
-1.182219, -1.818669, -1.028638, 1, 0.6078432, 0, 1,
-1.179548, -0.08748246, -0.1318641, 1, 0.6117647, 0, 1,
-1.178365, -0.3530547, -2.343287, 1, 0.6196079, 0, 1,
-1.158706, -1.419656, -2.056592, 1, 0.6235294, 0, 1,
-1.153339, 0.8029346, -1.658937, 1, 0.6313726, 0, 1,
-1.150013, -0.03012733, -0.5389966, 1, 0.6352941, 0, 1,
-1.143615, -2.725722, -1.223173, 1, 0.6431373, 0, 1,
-1.138614, 1.086968, -1.407358, 1, 0.6470588, 0, 1,
-1.137166, -0.9325111, -2.532277, 1, 0.654902, 0, 1,
-1.135948, 1.215373, -0.3639215, 1, 0.6588235, 0, 1,
-1.134736, 0.2013121, -0.9046265, 1, 0.6666667, 0, 1,
-1.131754, -0.07769372, -2.729948, 1, 0.6705883, 0, 1,
-1.11403, -1.305647, -2.785151, 1, 0.6784314, 0, 1,
-1.11198, -0.3869822, -2.171995, 1, 0.682353, 0, 1,
-1.105688, -1.341026, -3.761454, 1, 0.6901961, 0, 1,
-1.104794, 0.3232708, -3.180841, 1, 0.6941177, 0, 1,
-1.100721, 0.3292665, -0.1660216, 1, 0.7019608, 0, 1,
-1.095714, -0.4378546, -3.491124, 1, 0.7098039, 0, 1,
-1.093206, 0.7836257, -0.5261084, 1, 0.7137255, 0, 1,
-1.090177, -0.3431908, -1.722242, 1, 0.7215686, 0, 1,
-1.085203, -0.2306695, -0.9754532, 1, 0.7254902, 0, 1,
-1.079699, 0.04886805, -2.128567, 1, 0.7333333, 0, 1,
-1.071212, -1.705579, -3.362077, 1, 0.7372549, 0, 1,
-1.065205, 0.9313374, -2.634143, 1, 0.7450981, 0, 1,
-1.064903, -1.138331, -3.63519, 1, 0.7490196, 0, 1,
-1.060354, 1.0931, -1.659271, 1, 0.7568628, 0, 1,
-1.058816, 1.493525, -0.1265066, 1, 0.7607843, 0, 1,
-1.057947, 0.1091887, -0.6549605, 1, 0.7686275, 0, 1,
-1.051539, 0.1759087, -0.121889, 1, 0.772549, 0, 1,
-1.047147, 0.9767495, 0.1749156, 1, 0.7803922, 0, 1,
-1.045689, 1.448332, -0.7870578, 1, 0.7843137, 0, 1,
-1.041327, -0.6726068, -2.859969, 1, 0.7921569, 0, 1,
-1.038092, -1.363414, -1.720356, 1, 0.7960784, 0, 1,
-1.035359, 1.063922, -0.5871165, 1, 0.8039216, 0, 1,
-1.029066, 0.7114259, -0.7839198, 1, 0.8117647, 0, 1,
-1.028258, 1.990631, 0.5242396, 1, 0.8156863, 0, 1,
-1.026078, 0.4879897, -0.4560944, 1, 0.8235294, 0, 1,
-1.008685, 0.3317901, -2.237877, 1, 0.827451, 0, 1,
-1.00771, -0.6764657, -0.6868942, 1, 0.8352941, 0, 1,
-1.002025, -1.118169, -0.3506979, 1, 0.8392157, 0, 1,
-0.9980091, 0.676, -1.830812, 1, 0.8470588, 0, 1,
-0.9916106, -0.1661775, -1.012025, 1, 0.8509804, 0, 1,
-0.9864243, 1.61543, -1.152118, 1, 0.8588235, 0, 1,
-0.9828486, -0.07206127, -0.1883174, 1, 0.8627451, 0, 1,
-0.9769118, -0.0978737, -2.549474, 1, 0.8705882, 0, 1,
-0.9726828, -0.4659615, -0.8376601, 1, 0.8745098, 0, 1,
-0.9686625, -0.179958, 0.09586473, 1, 0.8823529, 0, 1,
-0.965924, -1.732115, -4.145134, 1, 0.8862745, 0, 1,
-0.965404, 0.3780163, -2.232395, 1, 0.8941177, 0, 1,
-0.9628533, -0.4724551, -3.006201, 1, 0.8980392, 0, 1,
-0.9577783, -0.07792462, -0.2482942, 1, 0.9058824, 0, 1,
-0.9576246, -0.008607519, -1.423785, 1, 0.9137255, 0, 1,
-0.9532332, -0.1610624, -2.150532, 1, 0.9176471, 0, 1,
-0.9517083, -0.08165593, -2.489733, 1, 0.9254902, 0, 1,
-0.9469811, 0.1515516, -0.3844593, 1, 0.9294118, 0, 1,
-0.9336029, 0.513049, -0.3162119, 1, 0.9372549, 0, 1,
-0.9331095, -0.900725, -3.350725, 1, 0.9411765, 0, 1,
-0.9328226, -0.2080017, -3.383615, 1, 0.9490196, 0, 1,
-0.9301269, 0.7099811, -0.002143487, 1, 0.9529412, 0, 1,
-0.9292289, -1.645527, -1.451897, 1, 0.9607843, 0, 1,
-0.9261678, -0.3216799, -2.564306, 1, 0.9647059, 0, 1,
-0.920115, 0.02323243, 0.2392132, 1, 0.972549, 0, 1,
-0.917667, -0.5080442, -1.074134, 1, 0.9764706, 0, 1,
-0.9142755, 0.6441329, 0.07706879, 1, 0.9843137, 0, 1,
-0.9098479, 1.314664, 0.518577, 1, 0.9882353, 0, 1,
-0.9069772, -0.4975151, -2.541538, 1, 0.9960784, 0, 1,
-0.9034761, 0.4126707, -0.583937, 0.9960784, 1, 0, 1,
-0.897736, 0.8419046, -0.7040555, 0.9921569, 1, 0, 1,
-0.8895288, 1.241138, 0.66578, 0.9843137, 1, 0, 1,
-0.8874921, -0.0229105, -3.28525, 0.9803922, 1, 0, 1,
-0.8871225, 0.7951573, -1.140738, 0.972549, 1, 0, 1,
-0.8856111, 0.6539781, -0.6027128, 0.9686275, 1, 0, 1,
-0.8820494, -1.59504, -3.652109, 0.9607843, 1, 0, 1,
-0.8803687, 1.578215, 1.146739, 0.9568627, 1, 0, 1,
-0.8778663, -0.02310051, -1.016441, 0.9490196, 1, 0, 1,
-0.8683941, -0.8929392, -2.7007, 0.945098, 1, 0, 1,
-0.8626314, -0.7144836, -2.167882, 0.9372549, 1, 0, 1,
-0.8570803, 0.2867614, -0.608473, 0.9333333, 1, 0, 1,
-0.8539941, -1.893429, -2.184253, 0.9254902, 1, 0, 1,
-0.8527123, 0.7425449, -2.368076, 0.9215686, 1, 0, 1,
-0.8424527, 0.7581285, -0.4372008, 0.9137255, 1, 0, 1,
-0.8410978, -0.2131967, -1.31921, 0.9098039, 1, 0, 1,
-0.8408588, 0.3338821, -0.1049251, 0.9019608, 1, 0, 1,
-0.8390123, -0.08240793, -3.48044, 0.8941177, 1, 0, 1,
-0.8378002, -1.448543, -2.441674, 0.8901961, 1, 0, 1,
-0.8361787, -0.3530082, -0.7808904, 0.8823529, 1, 0, 1,
-0.8355798, -0.5819783, -1.967955, 0.8784314, 1, 0, 1,
-0.8339106, 0.4333782, -0.2272563, 0.8705882, 1, 0, 1,
-0.8217219, -0.7195897, -1.375474, 0.8666667, 1, 0, 1,
-0.8195643, 1.391353, 0.21617, 0.8588235, 1, 0, 1,
-0.8131289, 1.09132, 0.3613154, 0.854902, 1, 0, 1,
-0.8101087, 0.7716686, -0.780518, 0.8470588, 1, 0, 1,
-0.7974971, 1.951297, -0.8926874, 0.8431373, 1, 0, 1,
-0.7949156, -0.3197188, -1.811824, 0.8352941, 1, 0, 1,
-0.7944033, 1.324633, -2.853461, 0.8313726, 1, 0, 1,
-0.7934811, 0.1234949, -1.985201, 0.8235294, 1, 0, 1,
-0.7929268, -1.401361, -1.293905, 0.8196079, 1, 0, 1,
-0.7919807, 0.6485834, -0.6902762, 0.8117647, 1, 0, 1,
-0.7915484, 0.008489274, -2.223452, 0.8078431, 1, 0, 1,
-0.7914412, -0.02388267, -1.952693, 0.8, 1, 0, 1,
-0.7688476, 1.124391, -1.004917, 0.7921569, 1, 0, 1,
-0.7643501, -0.5162272, -2.624171, 0.7882353, 1, 0, 1,
-0.7641246, -0.211395, -1.420772, 0.7803922, 1, 0, 1,
-0.7567233, -3.10169, -2.223009, 0.7764706, 1, 0, 1,
-0.7537177, 1.447281, 0.657752, 0.7686275, 1, 0, 1,
-0.7534503, -1.020717, -3.854162, 0.7647059, 1, 0, 1,
-0.7527083, 0.7249186, -1.573304, 0.7568628, 1, 0, 1,
-0.7498707, -0.0480557, -2.724489, 0.7529412, 1, 0, 1,
-0.7453804, -0.5621106, -0.9206203, 0.7450981, 1, 0, 1,
-0.7409035, -0.0495468, -2.228514, 0.7411765, 1, 0, 1,
-0.7373751, -0.2648077, -0.9279088, 0.7333333, 1, 0, 1,
-0.7323501, -1.396648, -3.738389, 0.7294118, 1, 0, 1,
-0.7239947, 0.3552431, -0.1786168, 0.7215686, 1, 0, 1,
-0.7222732, -1.207091, -3.494256, 0.7176471, 1, 0, 1,
-0.7199096, -0.5876501, -2.41835, 0.7098039, 1, 0, 1,
-0.7146969, -0.7282663, -2.184747, 0.7058824, 1, 0, 1,
-0.7146938, -0.1666279, -2.073715, 0.6980392, 1, 0, 1,
-0.7117512, 0.2303642, -2.489558, 0.6901961, 1, 0, 1,
-0.7081141, 0.2012608, -0.6011086, 0.6862745, 1, 0, 1,
-0.7072311, 1.113994, 0.5526006, 0.6784314, 1, 0, 1,
-0.7058123, -0.150057, -1.196806, 0.6745098, 1, 0, 1,
-0.7037598, -1.246114, -1.888996, 0.6666667, 1, 0, 1,
-0.7026621, 0.04357295, -1.431281, 0.6627451, 1, 0, 1,
-0.7003717, -0.6687279, -3.681942, 0.654902, 1, 0, 1,
-0.6917999, -0.4209875, -3.575938, 0.6509804, 1, 0, 1,
-0.6888555, 1.509035, -2.004443, 0.6431373, 1, 0, 1,
-0.6876601, -1.249007, -3.730784, 0.6392157, 1, 0, 1,
-0.6796816, -0.5519112, -1.306519, 0.6313726, 1, 0, 1,
-0.6792817, -0.747661, -2.443803, 0.627451, 1, 0, 1,
-0.6776661, -1.132667, -1.722473, 0.6196079, 1, 0, 1,
-0.6775692, 1.454261, 0.3825913, 0.6156863, 1, 0, 1,
-0.6774771, -1.970784, -4.350499, 0.6078432, 1, 0, 1,
-0.6684195, 1.358872, -1.686833, 0.6039216, 1, 0, 1,
-0.6677971, 0.7292055, -0.09658692, 0.5960785, 1, 0, 1,
-0.665394, 0.9589037, -2.385328, 0.5882353, 1, 0, 1,
-0.6611128, 0.05648078, -2.222804, 0.5843138, 1, 0, 1,
-0.6596172, -0.7326825, -2.322102, 0.5764706, 1, 0, 1,
-0.6577662, 1.865619, 0.1194614, 0.572549, 1, 0, 1,
-0.6551625, 0.1841249, 0.4166019, 0.5647059, 1, 0, 1,
-0.6446432, 0.01518287, -0.4977957, 0.5607843, 1, 0, 1,
-0.6430663, 0.3291865, -1.16538, 0.5529412, 1, 0, 1,
-0.6408672, 1.235802, 0.165563, 0.5490196, 1, 0, 1,
-0.638523, 0.948447, 1.611812, 0.5411765, 1, 0, 1,
-0.635406, -1.046438, -2.714519, 0.5372549, 1, 0, 1,
-0.6345819, -1.001399, -3.134887, 0.5294118, 1, 0, 1,
-0.6324219, -2.428566, -2.726239, 0.5254902, 1, 0, 1,
-0.6280554, 2.792128, -1.737555, 0.5176471, 1, 0, 1,
-0.6230242, -0.991408, -3.261167, 0.5137255, 1, 0, 1,
-0.6181846, 0.7833918, -1.976444, 0.5058824, 1, 0, 1,
-0.6117262, -0.5306895, -1.710659, 0.5019608, 1, 0, 1,
-0.607956, 0.6276745, 0.2180386, 0.4941176, 1, 0, 1,
-0.6071908, 1.390016, 0.4527805, 0.4862745, 1, 0, 1,
-0.6047054, -1.047636, -1.524273, 0.4823529, 1, 0, 1,
-0.6026636, 1.308513, -1.160216, 0.4745098, 1, 0, 1,
-0.5973622, 2.204369, -0.5754137, 0.4705882, 1, 0, 1,
-0.5927728, -1.078623, -2.733156, 0.4627451, 1, 0, 1,
-0.5888107, 1.030488, -0.9827929, 0.4588235, 1, 0, 1,
-0.5839561, 0.8417747, 0.2557121, 0.4509804, 1, 0, 1,
-0.5811235, 0.2028094, -1.577002, 0.4470588, 1, 0, 1,
-0.5809456, -1.361341, -1.428997, 0.4392157, 1, 0, 1,
-0.580898, -2.166525, -2.501323, 0.4352941, 1, 0, 1,
-0.5780758, -0.8494511, -2.855674, 0.427451, 1, 0, 1,
-0.5767812, -0.601346, -1.657723, 0.4235294, 1, 0, 1,
-0.5705457, 0.07719036, -0.2676801, 0.4156863, 1, 0, 1,
-0.5705304, 0.3303508, 0.5809905, 0.4117647, 1, 0, 1,
-0.5662724, 1.110321, 0.1376875, 0.4039216, 1, 0, 1,
-0.5661973, -1.602254, -2.863129, 0.3960784, 1, 0, 1,
-0.5657808, -1.509327, -3.225128, 0.3921569, 1, 0, 1,
-0.5631739, -1.168579, -1.717348, 0.3843137, 1, 0, 1,
-0.5549508, 0.9443425, 1.223801, 0.3803922, 1, 0, 1,
-0.5541162, 0.4525537, -0.76193, 0.372549, 1, 0, 1,
-0.5515841, 2.146417, -1.52137, 0.3686275, 1, 0, 1,
-0.5473735, -0.2206596, -1.013944, 0.3607843, 1, 0, 1,
-0.5463976, 0.3757792, -0.873131, 0.3568628, 1, 0, 1,
-0.5430376, -1.151463, -2.462881, 0.3490196, 1, 0, 1,
-0.5398547, 0.6563484, -0.3042519, 0.345098, 1, 0, 1,
-0.5259448, -1.769413, -1.970867, 0.3372549, 1, 0, 1,
-0.5232852, -0.08648247, -2.371002, 0.3333333, 1, 0, 1,
-0.5220871, 0.06012544, -3.013155, 0.3254902, 1, 0, 1,
-0.5165174, -1.010437, -2.226566, 0.3215686, 1, 0, 1,
-0.5134434, -1.12967, -2.518773, 0.3137255, 1, 0, 1,
-0.5120876, 0.4608775, -0.1563605, 0.3098039, 1, 0, 1,
-0.5008076, 0.7664144, 0.1613264, 0.3019608, 1, 0, 1,
-0.4981859, 0.6826156, -2.917329, 0.2941177, 1, 0, 1,
-0.4962226, -0.4919635, -2.550009, 0.2901961, 1, 0, 1,
-0.494468, -0.03221452, -0.2197803, 0.282353, 1, 0, 1,
-0.4944178, -0.5649049, -2.947999, 0.2784314, 1, 0, 1,
-0.4931364, -1.188807, -1.598654, 0.2705882, 1, 0, 1,
-0.4915299, 0.1912987, -0.3807982, 0.2666667, 1, 0, 1,
-0.4892129, 0.6160598, -1.731051, 0.2588235, 1, 0, 1,
-0.4815151, -0.07205667, -3.498341, 0.254902, 1, 0, 1,
-0.479291, 0.6477336, 0.369828, 0.2470588, 1, 0, 1,
-0.478918, 0.1992507, -3.096956, 0.2431373, 1, 0, 1,
-0.4788571, 0.5618035, 0.768285, 0.2352941, 1, 0, 1,
-0.4777848, -1.114854, -3.146474, 0.2313726, 1, 0, 1,
-0.4726617, 0.6158034, -0.3357919, 0.2235294, 1, 0, 1,
-0.4656042, -0.3971775, -2.963803, 0.2196078, 1, 0, 1,
-0.4652926, -0.2751815, -0.9669268, 0.2117647, 1, 0, 1,
-0.4593225, 2.509243, 0.5153161, 0.2078431, 1, 0, 1,
-0.4568906, 0.8656537, 0.5958191, 0.2, 1, 0, 1,
-0.4526905, 0.1977901, -0.8843689, 0.1921569, 1, 0, 1,
-0.4488469, 0.4594514, -1.018327, 0.1882353, 1, 0, 1,
-0.4415022, -1.10642, -3.162607, 0.1803922, 1, 0, 1,
-0.439588, -0.1248985, -1.860825, 0.1764706, 1, 0, 1,
-0.4271032, -0.634039, -2.857366, 0.1686275, 1, 0, 1,
-0.4251656, 0.5704408, -0.2027101, 0.1647059, 1, 0, 1,
-0.4246328, -1.03343, -3.01142, 0.1568628, 1, 0, 1,
-0.4208899, -1.321992, -4.942391, 0.1529412, 1, 0, 1,
-0.4196718, -1.590757, -4.542114, 0.145098, 1, 0, 1,
-0.4166583, 1.69129, -3.600586, 0.1411765, 1, 0, 1,
-0.4143618, 0.9930155, 1.548495, 0.1333333, 1, 0, 1,
-0.413657, 0.9145955, 1.425385, 0.1294118, 1, 0, 1,
-0.4130509, 0.573833, -1.242693, 0.1215686, 1, 0, 1,
-0.4124934, 0.1141652, 0.8977757, 0.1176471, 1, 0, 1,
-0.4119945, -0.5288234, -4.339358, 0.1098039, 1, 0, 1,
-0.4107098, -0.9728699, -3.408673, 0.1058824, 1, 0, 1,
-0.4106469, -1.612135, -2.637883, 0.09803922, 1, 0, 1,
-0.4045382, 0.330156, 0.7188785, 0.09019608, 1, 0, 1,
-0.3992316, -1.150738, -3.54288, 0.08627451, 1, 0, 1,
-0.3992296, -0.4034901, -1.863238, 0.07843138, 1, 0, 1,
-0.3992148, 1.766788, -0.3816686, 0.07450981, 1, 0, 1,
-0.3982587, -0.3125098, -2.001307, 0.06666667, 1, 0, 1,
-0.3947468, -1.089254, -2.728708, 0.0627451, 1, 0, 1,
-0.3934436, 0.6433915, -0.1032442, 0.05490196, 1, 0, 1,
-0.3885849, 0.3940114, -0.1494879, 0.05098039, 1, 0, 1,
-0.3855521, -0.2989224, -3.330173, 0.04313726, 1, 0, 1,
-0.3843822, 1.181431, -0.3453628, 0.03921569, 1, 0, 1,
-0.3831779, -0.6848751, -2.037045, 0.03137255, 1, 0, 1,
-0.3791536, 2.013497, -1.392874, 0.02745098, 1, 0, 1,
-0.3775771, 0.2116447, -0.2658681, 0.01960784, 1, 0, 1,
-0.3761945, -0.007638972, -3.591888, 0.01568628, 1, 0, 1,
-0.374723, 0.5613884, 0.3598065, 0.007843138, 1, 0, 1,
-0.3635784, -0.07616291, -1.638873, 0.003921569, 1, 0, 1,
-0.3631352, -0.2428473, -0.6806101, 0, 1, 0.003921569, 1,
-0.3608437, 0.4482844, 0.43199, 0, 1, 0.01176471, 1,
-0.3580286, -0.7378712, -1.273267, 0, 1, 0.01568628, 1,
-0.3578627, 0.3823506, -0.4093958, 0, 1, 0.02352941, 1,
-0.3524774, -0.9872717, -1.958358, 0, 1, 0.02745098, 1,
-0.3509144, 0.01772291, -1.840235, 0, 1, 0.03529412, 1,
-0.3463185, 1.018031, -0.02452558, 0, 1, 0.03921569, 1,
-0.3451791, 0.6737589, -0.3390432, 0, 1, 0.04705882, 1,
-0.3412881, 0.6874622, -0.3871758, 0, 1, 0.05098039, 1,
-0.3403116, 2.2579, -1.13893, 0, 1, 0.05882353, 1,
-0.3390719, 0.2483853, -2.587725, 0, 1, 0.0627451, 1,
-0.3372735, 0.5692683, -1.238288, 0, 1, 0.07058824, 1,
-0.3356038, 1.28291, 1.710539, 0, 1, 0.07450981, 1,
-0.335456, 0.1551033, -1.650598, 0, 1, 0.08235294, 1,
-0.3281308, -0.4344417, -2.174548, 0, 1, 0.08627451, 1,
-0.3257141, 0.1938925, -0.6140928, 0, 1, 0.09411765, 1,
-0.3241011, 1.085278, -0.07330894, 0, 1, 0.1019608, 1,
-0.3220631, -0.4002727, -1.648382, 0, 1, 0.1058824, 1,
-0.3210855, -1.070733, -4.601857, 0, 1, 0.1137255, 1,
-0.3171029, 0.625529, 1.22855, 0, 1, 0.1176471, 1,
-0.3151633, -1.305179, -3.597773, 0, 1, 0.1254902, 1,
-0.3148804, -0.846261, -2.569113, 0, 1, 0.1294118, 1,
-0.3130272, -0.6165835, -0.4282992, 0, 1, 0.1372549, 1,
-0.3115368, 0.5392213, 0.1309291, 0, 1, 0.1411765, 1,
-0.3093367, -0.4235025, -3.07336, 0, 1, 0.1490196, 1,
-0.3029165, -0.2686789, -1.634468, 0, 1, 0.1529412, 1,
-0.2976822, -0.3197618, -1.73611, 0, 1, 0.1607843, 1,
-0.2925326, -0.7102565, -2.920156, 0, 1, 0.1647059, 1,
-0.2900914, 0.2294911, -2.015451, 0, 1, 0.172549, 1,
-0.2899298, -0.3669791, -2.757776, 0, 1, 0.1764706, 1,
-0.2883065, 0.9474926, -0.3487455, 0, 1, 0.1843137, 1,
-0.2861318, 0.6458861, -0.5121431, 0, 1, 0.1882353, 1,
-0.2856137, 0.731299, -0.8703838, 0, 1, 0.1960784, 1,
-0.2837887, -0.5419226, -1.97033, 0, 1, 0.2039216, 1,
-0.2774606, 0.9248489, -1.567798, 0, 1, 0.2078431, 1,
-0.2770764, -0.725844, -0.8549466, 0, 1, 0.2156863, 1,
-0.2754987, 0.8010545, -0.001855382, 0, 1, 0.2196078, 1,
-0.2749111, -0.4405234, -1.949318, 0, 1, 0.227451, 1,
-0.2659031, 0.6719876, 0.6802669, 0, 1, 0.2313726, 1,
-0.2655973, -0.686358, -3.55579, 0, 1, 0.2392157, 1,
-0.2643329, -0.6202168, -1.900986, 0, 1, 0.2431373, 1,
-0.2629273, 1.057775, -0.7614542, 0, 1, 0.2509804, 1,
-0.2628966, -0.5551414, -1.622494, 0, 1, 0.254902, 1,
-0.2595124, 0.9634282, -1.730183, 0, 1, 0.2627451, 1,
-0.2548732, -1.484685, -0.4765509, 0, 1, 0.2666667, 1,
-0.2503626, -1.285127, -3.964015, 0, 1, 0.2745098, 1,
-0.2488367, 1.124024, -1.239523, 0, 1, 0.2784314, 1,
-0.2448761, -1.81371, -3.479297, 0, 1, 0.2862745, 1,
-0.2447253, -0.01769729, -2.920225, 0, 1, 0.2901961, 1,
-0.2426709, 0.1994448, -1.129548, 0, 1, 0.2980392, 1,
-0.2391673, -0.6493968, -2.362565, 0, 1, 0.3058824, 1,
-0.2361398, -0.4139106, -2.843652, 0, 1, 0.3098039, 1,
-0.2342376, 0.08477078, -1.143003, 0, 1, 0.3176471, 1,
-0.2338909, -0.9413592, -2.470363, 0, 1, 0.3215686, 1,
-0.2282158, -2.604326, -1.848425, 0, 1, 0.3294118, 1,
-0.2245117, -1.107965, -4.056528, 0, 1, 0.3333333, 1,
-0.2193242, -0.7576917, -4.460237, 0, 1, 0.3411765, 1,
-0.2184264, -0.2767329, -1.090266, 0, 1, 0.345098, 1,
-0.2172143, 1.567285, 0.4435806, 0, 1, 0.3529412, 1,
-0.2157971, -0.8076522, -1.179634, 0, 1, 0.3568628, 1,
-0.211602, -0.3814834, -2.695223, 0, 1, 0.3647059, 1,
-0.2114937, 0.3989946, -0.4490321, 0, 1, 0.3686275, 1,
-0.2082388, -0.8702669, -2.712487, 0, 1, 0.3764706, 1,
-0.2079293, 0.1593868, -0.2671732, 0, 1, 0.3803922, 1,
-0.2078694, 0.4266585, 0.2847899, 0, 1, 0.3882353, 1,
-0.207792, 0.5009594, -0.06964172, 0, 1, 0.3921569, 1,
-0.2074872, 1.457382, -0.9262942, 0, 1, 0.4, 1,
-0.2055328, 2.155871, 1.011155, 0, 1, 0.4078431, 1,
-0.2021073, -1.067219, -0.6320236, 0, 1, 0.4117647, 1,
-0.1964094, 1.517523, -0.8477975, 0, 1, 0.4196078, 1,
-0.1934424, -0.1171199, -1.841207, 0, 1, 0.4235294, 1,
-0.1917438, 0.4515749, 0.4569005, 0, 1, 0.4313726, 1,
-0.1895211, -1.124481, -1.45554, 0, 1, 0.4352941, 1,
-0.1884233, -0.6727778, -2.858951, 0, 1, 0.4431373, 1,
-0.1868819, 0.5283718, 0.4058925, 0, 1, 0.4470588, 1,
-0.1835772, -0.5481308, -4.835792, 0, 1, 0.454902, 1,
-0.180585, -1.137822, -3.085557, 0, 1, 0.4588235, 1,
-0.1777258, -0.03579355, -3.353338, 0, 1, 0.4666667, 1,
-0.1746718, -0.1810343, -2.177087, 0, 1, 0.4705882, 1,
-0.1732848, 0.8289533, 0.1866083, 0, 1, 0.4784314, 1,
-0.1727652, 0.3133759, -1.290412, 0, 1, 0.4823529, 1,
-0.1723213, -0.2525744, -3.91878, 0, 1, 0.4901961, 1,
-0.1711747, -0.3666825, -1.797745, 0, 1, 0.4941176, 1,
-0.1700858, -1.459668, -0.8043351, 0, 1, 0.5019608, 1,
-0.1700549, 1.103149, -1.300903, 0, 1, 0.509804, 1,
-0.1694508, 0.6638526, 0.3773016, 0, 1, 0.5137255, 1,
-0.1677402, -0.8260205, -2.736989, 0, 1, 0.5215687, 1,
-0.1655142, -0.8397592, -4.476386, 0, 1, 0.5254902, 1,
-0.1629573, -2.922573, -3.204504, 0, 1, 0.5333334, 1,
-0.1614638, -1.261835, -3.935503, 0, 1, 0.5372549, 1,
-0.1608116, -1.364255, -3.038433, 0, 1, 0.5450981, 1,
-0.1547463, -1.246216, -3.931611, 0, 1, 0.5490196, 1,
-0.1451513, 0.5564592, -2.801982, 0, 1, 0.5568628, 1,
-0.1360563, 0.906534, 0.227353, 0, 1, 0.5607843, 1,
-0.130102, -0.19341, -2.066963, 0, 1, 0.5686275, 1,
-0.1267273, 0.4434098, -0.3392503, 0, 1, 0.572549, 1,
-0.123121, -0.2851241, -2.526462, 0, 1, 0.5803922, 1,
-0.122509, 0.9915312, 0.5223318, 0, 1, 0.5843138, 1,
-0.1211092, 0.9132545, 0.8903339, 0, 1, 0.5921569, 1,
-0.1169303, -0.2195579, -0.9926797, 0, 1, 0.5960785, 1,
-0.1127338, -1.567607, -4.126207, 0, 1, 0.6039216, 1,
-0.1112893, -0.05617954, -1.892504, 0, 1, 0.6117647, 1,
-0.1071904, 0.7578489, 0.1924509, 0, 1, 0.6156863, 1,
-0.09824602, -0.452301, -2.303821, 0, 1, 0.6235294, 1,
-0.09702915, -1.921382, -2.591127, 0, 1, 0.627451, 1,
-0.09439531, 0.5822207, -0.03743697, 0, 1, 0.6352941, 1,
-0.09266035, -0.06878366, -3.99314, 0, 1, 0.6392157, 1,
-0.09265728, 1.040963, -3.081254, 0, 1, 0.6470588, 1,
-0.0907924, 1.315485, 1.077715, 0, 1, 0.6509804, 1,
-0.08484219, -0.2431368, -0.8542479, 0, 1, 0.6588235, 1,
-0.08438351, -0.1732022, -3.035227, 0, 1, 0.6627451, 1,
-0.08313733, -0.5950201, -3.381596, 0, 1, 0.6705883, 1,
-0.08306316, 0.1748606, 1.121522, 0, 1, 0.6745098, 1,
-0.08262615, -1.303192, -3.897189, 0, 1, 0.682353, 1,
-0.08138849, -1.459058, -1.417022, 0, 1, 0.6862745, 1,
-0.0800121, 1.436062, -0.8880538, 0, 1, 0.6941177, 1,
-0.07666188, 0.1571871, 0.9581105, 0, 1, 0.7019608, 1,
-0.07188707, -0.6638608, -2.958957, 0, 1, 0.7058824, 1,
-0.07155971, -1.433644, -2.573337, 0, 1, 0.7137255, 1,
-0.07132874, -1.107173, -3.652407, 0, 1, 0.7176471, 1,
-0.06893414, 0.3925582, -1.535219, 0, 1, 0.7254902, 1,
-0.06370625, -0.672042, -3.495072, 0, 1, 0.7294118, 1,
-0.06141817, -1.274508, -3.500122, 0, 1, 0.7372549, 1,
-0.06136629, -0.5815759, -2.895041, 0, 1, 0.7411765, 1,
-0.0600533, -1.720691, -3.741039, 0, 1, 0.7490196, 1,
-0.05869897, 1.016061, -0.6120143, 0, 1, 0.7529412, 1,
-0.05866197, 1.069494, -0.634274, 0, 1, 0.7607843, 1,
-0.05813238, 0.9726367, 0.7502589, 0, 1, 0.7647059, 1,
-0.05248379, 0.9965295, -1.276806, 0, 1, 0.772549, 1,
-0.05213583, -0.02246427, -1.661618, 0, 1, 0.7764706, 1,
-0.04654521, -1.565497, -5.014483, 0, 1, 0.7843137, 1,
-0.04561498, -1.491971, -5.240767, 0, 1, 0.7882353, 1,
-0.0430011, -1.164229, -2.499815, 0, 1, 0.7960784, 1,
-0.04084221, -0.1903536, -1.768097, 0, 1, 0.8039216, 1,
-0.03082807, 1.089256, 0.2713679, 0, 1, 0.8078431, 1,
-0.02778704, 0.03003456, -0.8735733, 0, 1, 0.8156863, 1,
-0.02705565, 0.5554473, 0.9170936, 0, 1, 0.8196079, 1,
-0.02665785, -0.2544611, -3.743247, 0, 1, 0.827451, 1,
-0.02466184, 0.5331492, -0.1275403, 0, 1, 0.8313726, 1,
-0.02414412, 0.8703098, -0.8717594, 0, 1, 0.8392157, 1,
-0.0211892, -1.013068, -3.016135, 0, 1, 0.8431373, 1,
-0.02116367, 0.9143232, -0.5757194, 0, 1, 0.8509804, 1,
-0.02009617, 0.06053475, 0.7322413, 0, 1, 0.854902, 1,
-0.01977024, 2.950527, 2.763322, 0, 1, 0.8627451, 1,
-0.01886146, 0.06538894, 0.8413473, 0, 1, 0.8666667, 1,
-0.01383263, 0.8040253, -0.4792593, 0, 1, 0.8745098, 1,
-0.01287629, -1.642538, -2.55532, 0, 1, 0.8784314, 1,
-0.01208099, -0.2049808, -3.191839, 0, 1, 0.8862745, 1,
-0.008521099, 0.8484611, 0.3285314, 0, 1, 0.8901961, 1,
-0.006875488, -0.1768787, -2.74823, 0, 1, 0.8980392, 1,
-0.005425232, 0.7026649, 0.9528626, 0, 1, 0.9058824, 1,
8.112525e-05, 0.6093674, 0.1537133, 0, 1, 0.9098039, 1,
0.005879944, -0.2097811, 1.250542, 0, 1, 0.9176471, 1,
0.006595575, -1.052259, 1.555002, 0, 1, 0.9215686, 1,
0.00799974, 0.6401724, 0.4143142, 0, 1, 0.9294118, 1,
0.01142349, 0.9198651, -1.329959, 0, 1, 0.9333333, 1,
0.01431838, 2.876859, -0.9892138, 0, 1, 0.9411765, 1,
0.0156038, 0.04373145, 0.8824299, 0, 1, 0.945098, 1,
0.01570325, 0.3627189, 0.5917132, 0, 1, 0.9529412, 1,
0.01570535, 0.1042321, -0.8116034, 0, 1, 0.9568627, 1,
0.01769041, -0.9109204, 3.413393, 0, 1, 0.9647059, 1,
0.0221274, 0.6012994, 2.468319, 0, 1, 0.9686275, 1,
0.02379202, -0.6183513, 2.058882, 0, 1, 0.9764706, 1,
0.02891915, 0.6201909, -0.3345403, 0, 1, 0.9803922, 1,
0.02993683, 0.4179143, 0.0425224, 0, 1, 0.9882353, 1,
0.03184317, 1.381494, 1.82977, 0, 1, 0.9921569, 1,
0.03204105, -0.8094762, 2.092806, 0, 1, 1, 1,
0.03609748, -0.7294374, 3.212297, 0, 0.9921569, 1, 1,
0.0379856, -0.2091666, 4.192133, 0, 0.9882353, 1, 1,
0.04645848, -0.4943784, 3.824323, 0, 0.9803922, 1, 1,
0.05201677, 1.580807, 0.4835029, 0, 0.9764706, 1, 1,
0.05334593, 0.6595209, 1.2817, 0, 0.9686275, 1, 1,
0.05506036, -0.201873, 2.196686, 0, 0.9647059, 1, 1,
0.05824013, 0.1383891, 0.7378815, 0, 0.9568627, 1, 1,
0.06225811, -0.07009441, 1.211608, 0, 0.9529412, 1, 1,
0.06295712, 1.53148, 0.8852171, 0, 0.945098, 1, 1,
0.06444586, 0.7716237, -0.5357734, 0, 0.9411765, 1, 1,
0.06833909, 0.6971248, 1.183184, 0, 0.9333333, 1, 1,
0.06851773, -1.080381, 4.453873, 0, 0.9294118, 1, 1,
0.0707399, -1.266947, 1.835483, 0, 0.9215686, 1, 1,
0.07169734, 0.6958115, -0.6780157, 0, 0.9176471, 1, 1,
0.07537264, 1.843019, 1.074892, 0, 0.9098039, 1, 1,
0.07879744, 0.8389285, -0.128353, 0, 0.9058824, 1, 1,
0.07908222, -2.123286, 3.596996, 0, 0.8980392, 1, 1,
0.08081984, 0.3543887, 2.56099, 0, 0.8901961, 1, 1,
0.08392733, -0.7604062, 2.599266, 0, 0.8862745, 1, 1,
0.08862095, 0.3452913, 0.6086156, 0, 0.8784314, 1, 1,
0.09407273, -0.380937, 4.731111, 0, 0.8745098, 1, 1,
0.1020772, -0.5092941, 1.491067, 0, 0.8666667, 1, 1,
0.1021076, -0.5590525, 2.519344, 0, 0.8627451, 1, 1,
0.1054649, 0.983595, 1.613635, 0, 0.854902, 1, 1,
0.1087858, 0.117861, 0.1995134, 0, 0.8509804, 1, 1,
0.1099063, -0.9939249, 3.908578, 0, 0.8431373, 1, 1,
0.1111443, 0.6373371, -0.6314761, 0, 0.8392157, 1, 1,
0.1118715, 1.120511, 0.4730198, 0, 0.8313726, 1, 1,
0.1190023, 0.3195525, -1.211936, 0, 0.827451, 1, 1,
0.1216679, -0.1473396, 3.304121, 0, 0.8196079, 1, 1,
0.123861, -1.056508, 1.888071, 0, 0.8156863, 1, 1,
0.1252424, -1.036165, 4.04301, 0, 0.8078431, 1, 1,
0.1268384, 2.292959, 1.193655, 0, 0.8039216, 1, 1,
0.1272575, -0.8454201, 3.657867, 0, 0.7960784, 1, 1,
0.1337635, 0.5369359, -0.05942158, 0, 0.7882353, 1, 1,
0.1343279, -0.7017559, 3.923301, 0, 0.7843137, 1, 1,
0.1360425, 0.3494923, -0.7283275, 0, 0.7764706, 1, 1,
0.1419881, 0.3097239, 0.04636668, 0, 0.772549, 1, 1,
0.1490213, 0.711518, 1.582949, 0, 0.7647059, 1, 1,
0.1532896, 1.244783, 1.146685, 0, 0.7607843, 1, 1,
0.1544652, -1.311684, 2.78534, 0, 0.7529412, 1, 1,
0.1571662, -0.2497165, 3.059085, 0, 0.7490196, 1, 1,
0.1581929, -1.276074, 2.170403, 0, 0.7411765, 1, 1,
0.158319, 0.5445681, -0.9695179, 0, 0.7372549, 1, 1,
0.1606636, 0.7177284, -0.3261136, 0, 0.7294118, 1, 1,
0.1618761, 0.5466052, 0.9549468, 0, 0.7254902, 1, 1,
0.1680614, 0.8538585, 0.7560323, 0, 0.7176471, 1, 1,
0.1681803, -0.6226062, 3.596096, 0, 0.7137255, 1, 1,
0.1689437, -0.6896721, 2.336011, 0, 0.7058824, 1, 1,
0.1706628, 0.8153999, -0.2748327, 0, 0.6980392, 1, 1,
0.1715851, 1.608485, 1.690913, 0, 0.6941177, 1, 1,
0.1739787, -1.110798, 2.8916, 0, 0.6862745, 1, 1,
0.1744197, 1.159735, 1.671573, 0, 0.682353, 1, 1,
0.1750474, 1.823287, -0.1003718, 0, 0.6745098, 1, 1,
0.1782018, 0.8008357, 0.8954065, 0, 0.6705883, 1, 1,
0.1813328, -0.5258717, 4.43726, 0, 0.6627451, 1, 1,
0.181474, -1.346251, 3.456002, 0, 0.6588235, 1, 1,
0.1840705, -1.477662, 1.917839, 0, 0.6509804, 1, 1,
0.1849205, 0.1567294, -0.7294073, 0, 0.6470588, 1, 1,
0.1860881, -1.019823, 5.151128, 0, 0.6392157, 1, 1,
0.1893751, -0.1364811, 2.074238, 0, 0.6352941, 1, 1,
0.1947682, -0.6659568, 4.016929, 0, 0.627451, 1, 1,
0.2029633, -0.2183145, 1.756349, 0, 0.6235294, 1, 1,
0.2039249, -0.07416226, -0.2354167, 0, 0.6156863, 1, 1,
0.2069877, -0.58237, 2.426923, 0, 0.6117647, 1, 1,
0.2073724, 0.7350293, -0.2023064, 0, 0.6039216, 1, 1,
0.2103772, -1.892575, 2.238925, 0, 0.5960785, 1, 1,
0.2104214, 1.023623, -1.855024, 0, 0.5921569, 1, 1,
0.2134141, 0.1748483, 2.009587, 0, 0.5843138, 1, 1,
0.2147582, -2.587959, 3.202738, 0, 0.5803922, 1, 1,
0.217948, 0.3925235, 2.032699, 0, 0.572549, 1, 1,
0.2205518, -1.534089, 2.893917, 0, 0.5686275, 1, 1,
0.2209785, 1.037688, 1.841226, 0, 0.5607843, 1, 1,
0.2211208, -0.1642176, 2.579089, 0, 0.5568628, 1, 1,
0.2216974, 0.3990873, 1.917846, 0, 0.5490196, 1, 1,
0.2219729, -1.139119, 3.105585, 0, 0.5450981, 1, 1,
0.2230964, 0.6624915, 2.021344, 0, 0.5372549, 1, 1,
0.2232364, -0.4232195, 3.552554, 0, 0.5333334, 1, 1,
0.2323932, -0.2855911, 2.901485, 0, 0.5254902, 1, 1,
0.2329679, 0.3643743, 0.6771731, 0, 0.5215687, 1, 1,
0.2330412, 1.384124, -1.254207, 0, 0.5137255, 1, 1,
0.2354483, -0.5222203, 2.848044, 0, 0.509804, 1, 1,
0.2366729, 0.04178872, 0.3659599, 0, 0.5019608, 1, 1,
0.2411277, -0.6461806, 2.50324, 0, 0.4941176, 1, 1,
0.247395, 0.6585693, 0.06277575, 0, 0.4901961, 1, 1,
0.2495559, 0.2441208, 1.60377, 0, 0.4823529, 1, 1,
0.2547441, -0.6411114, 2.411154, 0, 0.4784314, 1, 1,
0.2561966, -0.3819335, 3.728188, 0, 0.4705882, 1, 1,
0.2584146, 0.7055956, 1.328369, 0, 0.4666667, 1, 1,
0.2588337, -1.122891, 3.977132, 0, 0.4588235, 1, 1,
0.259374, -0.4969832, 1.779671, 0, 0.454902, 1, 1,
0.2642054, 0.6432485, 0.7328286, 0, 0.4470588, 1, 1,
0.2654902, 1.146697, 1.173062, 0, 0.4431373, 1, 1,
0.2659906, 0.9093959, -0.5755835, 0, 0.4352941, 1, 1,
0.2686852, 0.9652548, 0.02471841, 0, 0.4313726, 1, 1,
0.2692016, 0.9449168, 1.734867, 0, 0.4235294, 1, 1,
0.2700687, -0.2918266, 1.007504, 0, 0.4196078, 1, 1,
0.2733608, 0.8646036, 0.2317142, 0, 0.4117647, 1, 1,
0.2736701, -1.708612, 1.812629, 0, 0.4078431, 1, 1,
0.2748266, -1.032746, 4.105819, 0, 0.4, 1, 1,
0.2749386, 0.1534817, 0.4574137, 0, 0.3921569, 1, 1,
0.2764198, 0.3780666, 0.5363018, 0, 0.3882353, 1, 1,
0.2861026, 0.2921419, 0.3145698, 0, 0.3803922, 1, 1,
0.2912701, -1.767464, 3.183717, 0, 0.3764706, 1, 1,
0.2914425, -0.07042819, 1.326689, 0, 0.3686275, 1, 1,
0.2933556, 1.845756, 1.09785, 0, 0.3647059, 1, 1,
0.2979516, -0.05621359, 2.213376, 0, 0.3568628, 1, 1,
0.3051613, 0.4027321, 0.3715861, 0, 0.3529412, 1, 1,
0.3091097, 0.6884797, 0.1196865, 0, 0.345098, 1, 1,
0.3171306, 0.3133612, 0.4575538, 0, 0.3411765, 1, 1,
0.3191843, -1.867584, 2.808636, 0, 0.3333333, 1, 1,
0.319654, 0.02434463, -0.04199212, 0, 0.3294118, 1, 1,
0.3247707, -1.129155, 3.203711, 0, 0.3215686, 1, 1,
0.3253401, 0.9640501, 1.267019, 0, 0.3176471, 1, 1,
0.3278444, -1.705747, 3.120719, 0, 0.3098039, 1, 1,
0.3331466, 0.2519726, -0.7164955, 0, 0.3058824, 1, 1,
0.3426193, 1.76379, -0.5738824, 0, 0.2980392, 1, 1,
0.3454938, -0.5258736, 3.340125, 0, 0.2901961, 1, 1,
0.3459431, 0.6254877, -0.5564179, 0, 0.2862745, 1, 1,
0.34633, -0.3679253, 1.353883, 0, 0.2784314, 1, 1,
0.3509956, 0.6816334, 0.9493169, 0, 0.2745098, 1, 1,
0.3556711, 0.1939355, 2.347647, 0, 0.2666667, 1, 1,
0.3564436, -1.212252, 1.81174, 0, 0.2627451, 1, 1,
0.3586216, 2.507647, 1.511597, 0, 0.254902, 1, 1,
0.3603775, 1.259003, 0.2130991, 0, 0.2509804, 1, 1,
0.3609411, 1.168447, 0.4651075, 0, 0.2431373, 1, 1,
0.3642171, -1.274992, 4.039078, 0, 0.2392157, 1, 1,
0.3647374, -0.3904514, 2.353846, 0, 0.2313726, 1, 1,
0.3678614, 0.8104071, -0.4269533, 0, 0.227451, 1, 1,
0.3717693, -1.045836, 3.833108, 0, 0.2196078, 1, 1,
0.371907, 0.3156674, 0.4130509, 0, 0.2156863, 1, 1,
0.3723616, 0.1929443, 1.080579, 0, 0.2078431, 1, 1,
0.3751716, -1.189474, 1.555877, 0, 0.2039216, 1, 1,
0.3766077, -0.1709756, 3.57474, 0, 0.1960784, 1, 1,
0.3777692, 1.316411, -0.967288, 0, 0.1882353, 1, 1,
0.3777792, -0.08698865, 1.641707, 0, 0.1843137, 1, 1,
0.3823467, 0.1602392, 1.624442, 0, 0.1764706, 1, 1,
0.3836322, 2.334026, 0.9419851, 0, 0.172549, 1, 1,
0.384042, 0.3286193, 1.046727, 0, 0.1647059, 1, 1,
0.3892576, 0.5422258, 0.6796307, 0, 0.1607843, 1, 1,
0.3910359, -0.2953179, 1.820154, 0, 0.1529412, 1, 1,
0.3910427, 0.9196013, 1.979462, 0, 0.1490196, 1, 1,
0.3924532, -0.7955291, 3.016151, 0, 0.1411765, 1, 1,
0.3942142, -1.079908, 2.908416, 0, 0.1372549, 1, 1,
0.3965633, -0.03009099, 2.391667, 0, 0.1294118, 1, 1,
0.397138, -1.060795, 2.162923, 0, 0.1254902, 1, 1,
0.3971965, -0.7806941, 3.813573, 0, 0.1176471, 1, 1,
0.4012031, -0.05386107, 1.810434, 0, 0.1137255, 1, 1,
0.4013548, -0.983178, 5.334579, 0, 0.1058824, 1, 1,
0.4016407, -0.2931072, 1.826287, 0, 0.09803922, 1, 1,
0.4082898, 0.5516556, 1.330902, 0, 0.09411765, 1, 1,
0.4146144, 1.723133, 0.964938, 0, 0.08627451, 1, 1,
0.4229633, -1.440583, 3.072235, 0, 0.08235294, 1, 1,
0.425238, 0.7267246, -0.034619, 0, 0.07450981, 1, 1,
0.425703, -0.5331574, 2.774545, 0, 0.07058824, 1, 1,
0.430215, 1.594641, 2.679404, 0, 0.0627451, 1, 1,
0.4443067, -0.759339, 3.444293, 0, 0.05882353, 1, 1,
0.4468917, -0.0886419, 3.134811, 0, 0.05098039, 1, 1,
0.4478428, -1.415533, 2.511285, 0, 0.04705882, 1, 1,
0.459213, 0.1978933, 2.127223, 0, 0.03921569, 1, 1,
0.4601919, -1.201962, 2.433122, 0, 0.03529412, 1, 1,
0.4622879, -1.328279, 2.039655, 0, 0.02745098, 1, 1,
0.4742149, -0.003920326, 2.610021, 0, 0.02352941, 1, 1,
0.4745808, -1.756231, 3.355153, 0, 0.01568628, 1, 1,
0.476318, -0.4655538, 1.249341, 0, 0.01176471, 1, 1,
0.4798943, -0.266461, 1.944716, 0, 0.003921569, 1, 1,
0.4828313, -0.4474272, 3.569064, 0.003921569, 0, 1, 1,
0.4831332, 2.043765, 0.9523119, 0.007843138, 0, 1, 1,
0.4833872, 1.236066, -0.5985913, 0.01568628, 0, 1, 1,
0.4854664, -0.2311626, 0.1198448, 0.01960784, 0, 1, 1,
0.4875766, 0.6552652, 2.193294, 0.02745098, 0, 1, 1,
0.4881042, 1.964233, -1.789806, 0.03137255, 0, 1, 1,
0.488656, 1.704825, 0.7507137, 0.03921569, 0, 1, 1,
0.4894074, -0.1313282, 0.8782524, 0.04313726, 0, 1, 1,
0.5013654, -1.072787, 2.864981, 0.05098039, 0, 1, 1,
0.5032053, -0.467707, 1.721442, 0.05490196, 0, 1, 1,
0.5098931, -1.339648, 2.823618, 0.0627451, 0, 1, 1,
0.5146308, 0.954631, 0.5884982, 0.06666667, 0, 1, 1,
0.5179241, -0.7236712, 1.825878, 0.07450981, 0, 1, 1,
0.51819, -0.8874066, 0.7547418, 0.07843138, 0, 1, 1,
0.5188814, 0.2873635, 0.02713696, 0.08627451, 0, 1, 1,
0.520743, 0.4586147, -0.1772483, 0.09019608, 0, 1, 1,
0.5291535, -1.585269, 2.541194, 0.09803922, 0, 1, 1,
0.5302791, 0.9262034, -0.6737258, 0.1058824, 0, 1, 1,
0.5308426, 0.564346, -2.215746, 0.1098039, 0, 1, 1,
0.5373732, 0.2229373, -0.5978863, 0.1176471, 0, 1, 1,
0.5394365, 0.5516713, 0.1824635, 0.1215686, 0, 1, 1,
0.5447374, -0.1863835, 2.628158, 0.1294118, 0, 1, 1,
0.5448148, 0.8982852, -1.254577, 0.1333333, 0, 1, 1,
0.5468514, -0.8078225, 3.071467, 0.1411765, 0, 1, 1,
0.5538549, 0.8547342, -0.2172164, 0.145098, 0, 1, 1,
0.557018, -1.932281, 2.347107, 0.1529412, 0, 1, 1,
0.5630118, 0.9189737, -1.310764, 0.1568628, 0, 1, 1,
0.565736, 1.460915, -0.7289385, 0.1647059, 0, 1, 1,
0.5682087, 0.043577, 1.1754, 0.1686275, 0, 1, 1,
0.5687805, -0.6112352, 3.969831, 0.1764706, 0, 1, 1,
0.5690566, 0.5948209, 1.268658, 0.1803922, 0, 1, 1,
0.5718682, -1.083703, 2.393179, 0.1882353, 0, 1, 1,
0.5722448, -1.538449, 1.529553, 0.1921569, 0, 1, 1,
0.5758658, 1.410381, 0.6014591, 0.2, 0, 1, 1,
0.5769515, -1.47719, 2.609314, 0.2078431, 0, 1, 1,
0.5803745, -0.3619922, 2.377983, 0.2117647, 0, 1, 1,
0.5816537, -1.385673, 1.310854, 0.2196078, 0, 1, 1,
0.5905861, 0.1244289, 0.9336435, 0.2235294, 0, 1, 1,
0.5913316, -0.1438169, 1.339612, 0.2313726, 0, 1, 1,
0.5930267, -0.6307645, 4.384175, 0.2352941, 0, 1, 1,
0.5961786, -2.498159, 0.0006024084, 0.2431373, 0, 1, 1,
0.5976584, 0.8292626, -0.2717492, 0.2470588, 0, 1, 1,
0.599526, 1.544082, -0.330735, 0.254902, 0, 1, 1,
0.5999501, -0.5382739, 1.449994, 0.2588235, 0, 1, 1,
0.6008464, -2.343191, 3.322083, 0.2666667, 0, 1, 1,
0.604073, 0.2930241, 2.134829, 0.2705882, 0, 1, 1,
0.6077103, 0.7058118, -0.351335, 0.2784314, 0, 1, 1,
0.6095347, 1.265043, 2.08949, 0.282353, 0, 1, 1,
0.616035, -0.5090813, 1.771215, 0.2901961, 0, 1, 1,
0.6171342, -0.8591559, 2.425236, 0.2941177, 0, 1, 1,
0.6174924, -0.6842687, 2.536755, 0.3019608, 0, 1, 1,
0.6241787, 0.05670378, 2.39146, 0.3098039, 0, 1, 1,
0.626617, -0.3481559, 3.424339, 0.3137255, 0, 1, 1,
0.63111, 0.09851705, 2.243767, 0.3215686, 0, 1, 1,
0.6325548, -0.3766754, 3.581554, 0.3254902, 0, 1, 1,
0.6336488, 1.000563, 0.6314057, 0.3333333, 0, 1, 1,
0.638191, 0.416967, 1.965546, 0.3372549, 0, 1, 1,
0.6452668, 0.7850052, 3.404601, 0.345098, 0, 1, 1,
0.649555, 1.022597, 0.8611631, 0.3490196, 0, 1, 1,
0.6526588, 0.09541776, 0.4078581, 0.3568628, 0, 1, 1,
0.6536373, 1.647658, 1.120326, 0.3607843, 0, 1, 1,
0.6550903, -0.05315451, 1.711695, 0.3686275, 0, 1, 1,
0.6593482, 0.07247126, 1.691462, 0.372549, 0, 1, 1,
0.6595612, -1.693288, 3.730578, 0.3803922, 0, 1, 1,
0.6596352, 0.2393999, 1.324983, 0.3843137, 0, 1, 1,
0.6621541, 0.2509852, 1.736699, 0.3921569, 0, 1, 1,
0.6643117, -1.072939, 2.1679, 0.3960784, 0, 1, 1,
0.669631, -0.393609, 4.081902, 0.4039216, 0, 1, 1,
0.6706465, -1.852567, 2.716825, 0.4117647, 0, 1, 1,
0.671594, -0.5023817, 1.872058, 0.4156863, 0, 1, 1,
0.6800175, 0.0901601, 0.3983401, 0.4235294, 0, 1, 1,
0.6826036, -0.7194784, 3.802833, 0.427451, 0, 1, 1,
0.6889777, -0.651453, 3.723661, 0.4352941, 0, 1, 1,
0.691455, 1.5473, 1.383993, 0.4392157, 0, 1, 1,
0.6918548, 0.4492024, 2.028738, 0.4470588, 0, 1, 1,
0.6949483, 1.576259, 1.951613, 0.4509804, 0, 1, 1,
0.6956655, -1.271072, 2.31344, 0.4588235, 0, 1, 1,
0.6991612, -1.185251, 1.239137, 0.4627451, 0, 1, 1,
0.7075013, -0.6924072, 0.2254497, 0.4705882, 0, 1, 1,
0.7105821, -0.2520547, 1.03163, 0.4745098, 0, 1, 1,
0.7148111, -0.7449036, 1.479224, 0.4823529, 0, 1, 1,
0.7173813, -0.7309034, 3.813943, 0.4862745, 0, 1, 1,
0.7210733, -0.1057192, 2.418896, 0.4941176, 0, 1, 1,
0.7249136, -0.2910627, 2.959005, 0.5019608, 0, 1, 1,
0.7304452, -0.7269924, 3.847682, 0.5058824, 0, 1, 1,
0.7340495, -0.5587263, 3.145926, 0.5137255, 0, 1, 1,
0.7387013, -0.07913832, 2.289034, 0.5176471, 0, 1, 1,
0.7459463, -0.5233223, 3.660535, 0.5254902, 0, 1, 1,
0.7491826, -0.2502348, 0.6610739, 0.5294118, 0, 1, 1,
0.750507, 0.4548656, 2.138616, 0.5372549, 0, 1, 1,
0.7541099, 1.00013, -0.2857887, 0.5411765, 0, 1, 1,
0.7557434, -1.317357, 2.222602, 0.5490196, 0, 1, 1,
0.7583891, -0.06468427, 1.204475, 0.5529412, 0, 1, 1,
0.7622046, 1.03745, 1.024727, 0.5607843, 0, 1, 1,
0.7658943, 0.3824202, -0.4603168, 0.5647059, 0, 1, 1,
0.7672732, 1.604338, 1.989791, 0.572549, 0, 1, 1,
0.7743245, 0.01970153, 0.3666515, 0.5764706, 0, 1, 1,
0.7758133, 0.1191285, 2.310277, 0.5843138, 0, 1, 1,
0.7799902, -0.3735648, 0.7702546, 0.5882353, 0, 1, 1,
0.7809799, 1.200167, -1.250987, 0.5960785, 0, 1, 1,
0.7891749, 1.823991, -0.7463707, 0.6039216, 0, 1, 1,
0.7899345, 0.3226586, 1.422193, 0.6078432, 0, 1, 1,
0.8009031, -0.1026636, 1.855216, 0.6156863, 0, 1, 1,
0.8044443, 0.3402904, 1.968861, 0.6196079, 0, 1, 1,
0.804915, 1.595325, 0.7922539, 0.627451, 0, 1, 1,
0.8074835, -0.8725911, 3.101585, 0.6313726, 0, 1, 1,
0.8137257, -0.05924864, 1.292426, 0.6392157, 0, 1, 1,
0.8191044, -0.1613221, 2.496193, 0.6431373, 0, 1, 1,
0.8193815, 0.257986, 3.029391, 0.6509804, 0, 1, 1,
0.8221646, 0.5168198, 0.3385597, 0.654902, 0, 1, 1,
0.8240165, -1.124637, 2.368521, 0.6627451, 0, 1, 1,
0.8262267, 2.131614, 0.8835494, 0.6666667, 0, 1, 1,
0.8272285, 0.1205634, 2.106539, 0.6745098, 0, 1, 1,
0.8299794, -0.7844654, 2.384128, 0.6784314, 0, 1, 1,
0.8308685, 1.097464, 0.5780647, 0.6862745, 0, 1, 1,
0.8324778, -1.965948, 3.445455, 0.6901961, 0, 1, 1,
0.8351992, 0.4344996, 1.592897, 0.6980392, 0, 1, 1,
0.8395837, 0.4676678, 3.061257, 0.7058824, 0, 1, 1,
0.8472213, -0.1059493, 0.1921751, 0.7098039, 0, 1, 1,
0.8501204, -1.246587, 2.534342, 0.7176471, 0, 1, 1,
0.8596088, 0.1781626, 3.415783, 0.7215686, 0, 1, 1,
0.8681283, -1.38166, 2.749416, 0.7294118, 0, 1, 1,
0.868573, -0.6142768, 3.730482, 0.7333333, 0, 1, 1,
0.8788556, 1.433187, -0.3144263, 0.7411765, 0, 1, 1,
0.8792149, -0.9331778, 1.282983, 0.7450981, 0, 1, 1,
0.8879565, 0.09410686, 1.195262, 0.7529412, 0, 1, 1,
0.8909545, -0.6680547, 3.55549, 0.7568628, 0, 1, 1,
0.8940945, -1.492665, 1.542751, 0.7647059, 0, 1, 1,
0.8967286, 0.5412862, 0.2487449, 0.7686275, 0, 1, 1,
0.8971717, -0.1771826, 1.803789, 0.7764706, 0, 1, 1,
0.9078184, 0.008711843, 0.3714269, 0.7803922, 0, 1, 1,
0.9131877, 0.4976758, 0.2976021, 0.7882353, 0, 1, 1,
0.9171882, -1.241796, 2.889755, 0.7921569, 0, 1, 1,
0.9178777, 0.451739, 2.222573, 0.8, 0, 1, 1,
0.9206647, 0.2437548, 0.3380237, 0.8078431, 0, 1, 1,
0.921438, 0.6053979, -0.2689181, 0.8117647, 0, 1, 1,
0.9249935, -1.478191, 1.580625, 0.8196079, 0, 1, 1,
0.9298777, -0.7817685, 0.1910891, 0.8235294, 0, 1, 1,
0.9305917, 0.8174238, 1.802594, 0.8313726, 0, 1, 1,
0.9317386, 1.173175, -0.1186211, 0.8352941, 0, 1, 1,
0.9520183, -1.136493, 4.104581, 0.8431373, 0, 1, 1,
0.9733367, -0.6481972, 3.578635, 0.8470588, 0, 1, 1,
0.9862828, 0.8182246, 0.1267825, 0.854902, 0, 1, 1,
0.9881887, 0.7717142, -1.373454, 0.8588235, 0, 1, 1,
0.9894342, 0.05555386, 2.019241, 0.8666667, 0, 1, 1,
0.9923395, 0.7984142, -0.1701771, 0.8705882, 0, 1, 1,
0.9972395, 0.115121, 0.6485897, 0.8784314, 0, 1, 1,
0.9989341, 1.618449, 1.428233, 0.8823529, 0, 1, 1,
1.001238, 1.801021, -0.5369546, 0.8901961, 0, 1, 1,
1.001763, -1.283562, 3.59292, 0.8941177, 0, 1, 1,
1.005685, 0.4715061, 2.919704, 0.9019608, 0, 1, 1,
1.005802, 1.123886, 0.6571855, 0.9098039, 0, 1, 1,
1.009561, 0.6772845, 0.6632441, 0.9137255, 0, 1, 1,
1.025745, -0.8363051, 2.310663, 0.9215686, 0, 1, 1,
1.031525, 0.320821, 0.8271657, 0.9254902, 0, 1, 1,
1.031539, 1.386636, 0.863405, 0.9333333, 0, 1, 1,
1.035381, -1.67379, 2.457137, 0.9372549, 0, 1, 1,
1.0377, 0.2934516, 3.334238, 0.945098, 0, 1, 1,
1.040421, -1.014295, 2.020166, 0.9490196, 0, 1, 1,
1.041189, -1.2262, 1.458473, 0.9568627, 0, 1, 1,
1.043867, -0.1412674, 0.6462989, 0.9607843, 0, 1, 1,
1.048542, 0.437396, 1.559247, 0.9686275, 0, 1, 1,
1.052117, -0.6240014, 2.784033, 0.972549, 0, 1, 1,
1.056841, -1.75367, 3.575693, 0.9803922, 0, 1, 1,
1.059283, 0.6329138, -0.4400608, 0.9843137, 0, 1, 1,
1.063013, 0.6777846, 1.297854, 0.9921569, 0, 1, 1,
1.066461, 1.192773, 0.5565823, 0.9960784, 0, 1, 1,
1.075184, -1.172677, 1.933751, 1, 0, 0.9960784, 1,
1.081835, -0.7022961, 3.411536, 1, 0, 0.9882353, 1,
1.084085, 0.6592107, 0.1705067, 1, 0, 0.9843137, 1,
1.093164, -0.5322171, 1.420359, 1, 0, 0.9764706, 1,
1.094579, 1.265283, 0.5514961, 1, 0, 0.972549, 1,
1.095297, -0.416539, 4.127869, 1, 0, 0.9647059, 1,
1.099431, -0.07809439, 0.7809796, 1, 0, 0.9607843, 1,
1.104758, 0.1758338, 0.142849, 1, 0, 0.9529412, 1,
1.106833, 2.910415, 1.764048, 1, 0, 0.9490196, 1,
1.113982, 0.168571, 1.790866, 1, 0, 0.9411765, 1,
1.12214, -0.01300191, 1.446303, 1, 0, 0.9372549, 1,
1.122683, -0.7999992, 1.366261, 1, 0, 0.9294118, 1,
1.128677, -0.4168162, 2.773707, 1, 0, 0.9254902, 1,
1.137356, -0.1830641, 1.325769, 1, 0, 0.9176471, 1,
1.142041, -2.155182, 2.622878, 1, 0, 0.9137255, 1,
1.144875, 2.302317, 0.6450285, 1, 0, 0.9058824, 1,
1.146713, -0.2173908, 1.531003, 1, 0, 0.9019608, 1,
1.147179, 0.2610962, 1.339851, 1, 0, 0.8941177, 1,
1.151081, 0.06530213, 2.50599, 1, 0, 0.8862745, 1,
1.152309, 1.426227, 0.5342291, 1, 0, 0.8823529, 1,
1.158223, 0.2084379, 1.697508, 1, 0, 0.8745098, 1,
1.168269, -0.1074672, 0.4457508, 1, 0, 0.8705882, 1,
1.171515, 1.37408, 0.4642377, 1, 0, 0.8627451, 1,
1.174395, 0.06680589, 1.890266, 1, 0, 0.8588235, 1,
1.178503, 1.427062, 0.9446566, 1, 0, 0.8509804, 1,
1.180577, -0.3418694, 2.192275, 1, 0, 0.8470588, 1,
1.182996, -0.1466586, 1.535825, 1, 0, 0.8392157, 1,
1.20995, 0.9580199, 0.9390481, 1, 0, 0.8352941, 1,
1.213831, -0.1333076, 1.328116, 1, 0, 0.827451, 1,
1.214388, 1.300862, -0.2861324, 1, 0, 0.8235294, 1,
1.21773, 0.6290885, 2.315649, 1, 0, 0.8156863, 1,
1.227543, -1.325086, 0.9232144, 1, 0, 0.8117647, 1,
1.236368, -0.1782572, 1.640552, 1, 0, 0.8039216, 1,
1.243408, -0.8606006, 1.638572, 1, 0, 0.7960784, 1,
1.247653, 0.4451545, 1.975542, 1, 0, 0.7921569, 1,
1.27153, 0.762466, 2.039682, 1, 0, 0.7843137, 1,
1.272988, 0.8194655, 1.229954, 1, 0, 0.7803922, 1,
1.273112, 0.3433004, 1.119821, 1, 0, 0.772549, 1,
1.286042, -0.3470213, 1.996377, 1, 0, 0.7686275, 1,
1.2875, -0.9716753, 1.76417, 1, 0, 0.7607843, 1,
1.292326, -0.7273557, 2.878172, 1, 0, 0.7568628, 1,
1.297817, -1.465156, 1.391243, 1, 0, 0.7490196, 1,
1.303012, -0.1752859, 0.1376339, 1, 0, 0.7450981, 1,
1.30404, 1.359826, 1.836256, 1, 0, 0.7372549, 1,
1.309954, 0.9306026, -0.7966097, 1, 0, 0.7333333, 1,
1.310816, -0.585526, 0.1230937, 1, 0, 0.7254902, 1,
1.314467, 0.4999822, -0.5057144, 1, 0, 0.7215686, 1,
1.317868, 0.2335487, 0.6360239, 1, 0, 0.7137255, 1,
1.322888, -0.01320855, 2.047065, 1, 0, 0.7098039, 1,
1.326165, -1.834502, 2.616544, 1, 0, 0.7019608, 1,
1.330862, -0.3122706, 1.421938, 1, 0, 0.6941177, 1,
1.334729, -0.6813645, -0.5496296, 1, 0, 0.6901961, 1,
1.335621, 0.3925893, 1.451297, 1, 0, 0.682353, 1,
1.351551, -0.6582909, 2.82533, 1, 0, 0.6784314, 1,
1.360002, 0.468829, 0.5253776, 1, 0, 0.6705883, 1,
1.361592, -1.753325, 0.6187146, 1, 0, 0.6666667, 1,
1.374533, -0.4381824, 2.711437, 1, 0, 0.6588235, 1,
1.379716, 0.8683693, 2.047414, 1, 0, 0.654902, 1,
1.381929, 0.8664077, -0.4149055, 1, 0, 0.6470588, 1,
1.386524, 0.1317342, 0.9928601, 1, 0, 0.6431373, 1,
1.393596, -0.1044912, 2.784357, 1, 0, 0.6352941, 1,
1.393842, -0.4694803, 2.79205, 1, 0, 0.6313726, 1,
1.405903, 0.8275026, 1.236645, 1, 0, 0.6235294, 1,
1.406024, 0.6640245, 1.947746, 1, 0, 0.6196079, 1,
1.410612, -0.3076501, 2.225621, 1, 0, 0.6117647, 1,
1.412074, -0.8704788, 2.661648, 1, 0, 0.6078432, 1,
1.41329, 1.360584, -1.081223, 1, 0, 0.6, 1,
1.426476, 0.4090742, 0.8563843, 1, 0, 0.5921569, 1,
1.427109, 0.3334617, 2.259566, 1, 0, 0.5882353, 1,
1.431167, 1.208984, -0.06880746, 1, 0, 0.5803922, 1,
1.432323, -0.3214043, 1.592804, 1, 0, 0.5764706, 1,
1.433959, 2.156336, 0.8263422, 1, 0, 0.5686275, 1,
1.439188, 0.08942714, 1.013378, 1, 0, 0.5647059, 1,
1.440513, 0.5407062, 0.6807626, 1, 0, 0.5568628, 1,
1.459852, 0.792608, 2.24885, 1, 0, 0.5529412, 1,
1.464204, -0.8397704, 1.323514, 1, 0, 0.5450981, 1,
1.467562, -2.104335, 2.483891, 1, 0, 0.5411765, 1,
1.469911, 0.668288, 1.152095, 1, 0, 0.5333334, 1,
1.469935, 0.8435081, 1.347661, 1, 0, 0.5294118, 1,
1.474789, -1.824395, 3.798696, 1, 0, 0.5215687, 1,
1.479104, -0.09417162, 2.566827, 1, 0, 0.5176471, 1,
1.479934, -0.8535067, 4.108882, 1, 0, 0.509804, 1,
1.480246, 1.487986, 3.267773, 1, 0, 0.5058824, 1,
1.502539, -0.2604507, 2.421972, 1, 0, 0.4980392, 1,
1.50404, 0.2910404, 0.7900955, 1, 0, 0.4901961, 1,
1.504637, 0.130033, 0.2477484, 1, 0, 0.4862745, 1,
1.519222, -0.3461646, 0.02501836, 1, 0, 0.4784314, 1,
1.524862, -0.9874877, -1.230031, 1, 0, 0.4745098, 1,
1.526134, 0.3644505, -0.747883, 1, 0, 0.4666667, 1,
1.527914, 0.05771356, 0.7846565, 1, 0, 0.4627451, 1,
1.53128, -1.210167, 0.8596125, 1, 0, 0.454902, 1,
1.53484, -1.084619, 1.707243, 1, 0, 0.4509804, 1,
1.541755, 0.07570421, 2.796154, 1, 0, 0.4431373, 1,
1.54397, 0.4590384, 2.233971, 1, 0, 0.4392157, 1,
1.549035, 0.5288402, 0.1162328, 1, 0, 0.4313726, 1,
1.549803, 0.4850986, 2.845623, 1, 0, 0.427451, 1,
1.556494, -0.8215983, 1.27467, 1, 0, 0.4196078, 1,
1.560699, -0.4725726, 0.804378, 1, 0, 0.4156863, 1,
1.561083, 0.2693188, 0.2236924, 1, 0, 0.4078431, 1,
1.565571, 1.315853, 2.160814, 1, 0, 0.4039216, 1,
1.574311, 0.6384734, 2.657671, 1, 0, 0.3960784, 1,
1.577213, 0.2650914, 3.080765, 1, 0, 0.3882353, 1,
1.584435, 2.088812, -1.218065, 1, 0, 0.3843137, 1,
1.590804, -0.6648923, 3.77684, 1, 0, 0.3764706, 1,
1.596506, -2.026142, 2.635498, 1, 0, 0.372549, 1,
1.602501, 0.9381832, 1.132976, 1, 0, 0.3647059, 1,
1.607362, -0.5124364, 1.995653, 1, 0, 0.3607843, 1,
1.610143, -1.435083, 2.892098, 1, 0, 0.3529412, 1,
1.610715, 0.6551229, 0.4181333, 1, 0, 0.3490196, 1,
1.613091, 0.4322913, 0.8127963, 1, 0, 0.3411765, 1,
1.61712, -1.778147, 4.028307, 1, 0, 0.3372549, 1,
1.638354, 0.02298797, 2.080793, 1, 0, 0.3294118, 1,
1.640081, -0.2011265, 1.642496, 1, 0, 0.3254902, 1,
1.65467, -0.3398677, 1.253618, 1, 0, 0.3176471, 1,
1.682199, 1.217538, 1.144078, 1, 0, 0.3137255, 1,
1.682852, -0.2818967, 1.671275, 1, 0, 0.3058824, 1,
1.686597, -0.7169752, 3.101755, 1, 0, 0.2980392, 1,
1.687709, -2.038599, 3.110739, 1, 0, 0.2941177, 1,
1.702078, 0.7120231, 1.100552, 1, 0, 0.2862745, 1,
1.706862, -3.250008, 2.733253, 1, 0, 0.282353, 1,
1.708751, 0.53712, 1.473698, 1, 0, 0.2745098, 1,
1.719471, -0.1291096, 0.497197, 1, 0, 0.2705882, 1,
1.719714, -0.05114821, 3.122343, 1, 0, 0.2627451, 1,
1.726323, 0.3888134, -0.5664432, 1, 0, 0.2588235, 1,
1.730236, 0.7035524, 1.894112, 1, 0, 0.2509804, 1,
1.731338, -0.4148459, 0.9082443, 1, 0, 0.2470588, 1,
1.748443, -1.618756, 1.603454, 1, 0, 0.2392157, 1,
1.754042, -0.1301903, 0.4582405, 1, 0, 0.2352941, 1,
1.767401, 0.559743, 0.1113397, 1, 0, 0.227451, 1,
1.775807, 1.196191, -0.9736778, 1, 0, 0.2235294, 1,
1.789324, -1.02281, 1.047881, 1, 0, 0.2156863, 1,
1.794248, -0.08846461, 0.07671244, 1, 0, 0.2117647, 1,
1.80449, -1.878152, 2.218855, 1, 0, 0.2039216, 1,
1.815972, -0.6695078, 0.1865444, 1, 0, 0.1960784, 1,
1.848198, 1.249567, 0.400515, 1, 0, 0.1921569, 1,
1.86996, 1.689979, -1.059755, 1, 0, 0.1843137, 1,
1.875466, -0.7327386, 2.15138, 1, 0, 0.1803922, 1,
1.876015, 1.013539, 0.5416514, 1, 0, 0.172549, 1,
1.891754, 0.8049572, -0.5957041, 1, 0, 0.1686275, 1,
1.897713, 0.1572636, 0.9660241, 1, 0, 0.1607843, 1,
1.916813, 0.7851279, 2.307446, 1, 0, 0.1568628, 1,
1.920303, 0.3623255, 1.629745, 1, 0, 0.1490196, 1,
1.932629, 0.1774832, 3.931489, 1, 0, 0.145098, 1,
1.964838, -0.580982, 3.558887, 1, 0, 0.1372549, 1,
1.967653, -1.325672, 0.9561073, 1, 0, 0.1333333, 1,
1.989739, -0.1017962, -1.10564, 1, 0, 0.1254902, 1,
2.009391, -0.005527489, 2.540105, 1, 0, 0.1215686, 1,
2.039797, 0.2118385, 2.693769, 1, 0, 0.1137255, 1,
2.042159, 2.395016, -0.8652604, 1, 0, 0.1098039, 1,
2.058488, 0.7403377, 0.03240018, 1, 0, 0.1019608, 1,
2.059278, -0.05110797, 2.515534, 1, 0, 0.09411765, 1,
2.070895, 1.316774, 1.160479, 1, 0, 0.09019608, 1,
2.081494, 1.071699, 0.07473404, 1, 0, 0.08235294, 1,
2.120979, 0.5629604, 0.6289561, 1, 0, 0.07843138, 1,
2.122386, -1.829691, 3.637519, 1, 0, 0.07058824, 1,
2.210013, -0.6191028, 2.903579, 1, 0, 0.06666667, 1,
2.210279, 0.04677547, 2.15723, 1, 0, 0.05882353, 1,
2.233486, -0.2564535, 2.808108, 1, 0, 0.05490196, 1,
2.265598, 0.6235185, 0.1804396, 1, 0, 0.04705882, 1,
2.305793, -0.140878, 1.57744, 1, 0, 0.04313726, 1,
2.337697, -1.295339, 0.6150228, 1, 0, 0.03529412, 1,
2.3978, -0.5569357, 0.9600144, 1, 0, 0.03137255, 1,
2.546628, 1.680881, 2.193284, 1, 0, 0.02352941, 1,
2.622991, -0.06693686, 0.5652593, 1, 0, 0.01960784, 1,
2.948591, -1.108753, 2.222615, 1, 0, 0.01176471, 1,
2.977753, -1.928066, 2.609934, 1, 0, 0.007843138, 1
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
-0.143442, -4.300999, -7.033288, 0, -0.5, 0.5, 0.5,
-0.143442, -4.300999, -7.033288, 1, -0.5, 0.5, 0.5,
-0.143442, -4.300999, -7.033288, 1, 1.5, 0.5, 0.5,
-0.143442, -4.300999, -7.033288, 0, 1.5, 0.5, 0.5
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
-4.322722, -0.1497407, -7.033288, 0, -0.5, 0.5, 0.5,
-4.322722, -0.1497407, -7.033288, 1, -0.5, 0.5, 0.5,
-4.322722, -0.1497407, -7.033288, 1, 1.5, 0.5, 0.5,
-4.322722, -0.1497407, -7.033288, 0, 1.5, 0.5, 0.5
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
-4.322722, -4.300999, 0.04690552, 0, -0.5, 0.5, 0.5,
-4.322722, -4.300999, 0.04690552, 1, -0.5, 0.5, 0.5,
-4.322722, -4.300999, 0.04690552, 1, 1.5, 0.5, 0.5,
-4.322722, -4.300999, 0.04690552, 0, 1.5, 0.5, 0.5
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
-3, -3.343016, -5.399398,
2, -3.343016, -5.399398,
-3, -3.343016, -5.399398,
-3, -3.50268, -5.671713,
-2, -3.343016, -5.399398,
-2, -3.50268, -5.671713,
-1, -3.343016, -5.399398,
-1, -3.50268, -5.671713,
0, -3.343016, -5.399398,
0, -3.50268, -5.671713,
1, -3.343016, -5.399398,
1, -3.50268, -5.671713,
2, -3.343016, -5.399398,
2, -3.50268, -5.671713
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
-3, -3.822007, -6.216343, 0, -0.5, 0.5, 0.5,
-3, -3.822007, -6.216343, 1, -0.5, 0.5, 0.5,
-3, -3.822007, -6.216343, 1, 1.5, 0.5, 0.5,
-3, -3.822007, -6.216343, 0, 1.5, 0.5, 0.5,
-2, -3.822007, -6.216343, 0, -0.5, 0.5, 0.5,
-2, -3.822007, -6.216343, 1, -0.5, 0.5, 0.5,
-2, -3.822007, -6.216343, 1, 1.5, 0.5, 0.5,
-2, -3.822007, -6.216343, 0, 1.5, 0.5, 0.5,
-1, -3.822007, -6.216343, 0, -0.5, 0.5, 0.5,
-1, -3.822007, -6.216343, 1, -0.5, 0.5, 0.5,
-1, -3.822007, -6.216343, 1, 1.5, 0.5, 0.5,
-1, -3.822007, -6.216343, 0, 1.5, 0.5, 0.5,
0, -3.822007, -6.216343, 0, -0.5, 0.5, 0.5,
0, -3.822007, -6.216343, 1, -0.5, 0.5, 0.5,
0, -3.822007, -6.216343, 1, 1.5, 0.5, 0.5,
0, -3.822007, -6.216343, 0, 1.5, 0.5, 0.5,
1, -3.822007, -6.216343, 0, -0.5, 0.5, 0.5,
1, -3.822007, -6.216343, 1, -0.5, 0.5, 0.5,
1, -3.822007, -6.216343, 1, 1.5, 0.5, 0.5,
1, -3.822007, -6.216343, 0, 1.5, 0.5, 0.5,
2, -3.822007, -6.216343, 0, -0.5, 0.5, 0.5,
2, -3.822007, -6.216343, 1, -0.5, 0.5, 0.5,
2, -3.822007, -6.216343, 1, 1.5, 0.5, 0.5,
2, -3.822007, -6.216343, 0, 1.5, 0.5, 0.5
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
-3.358273, -3, -5.399398,
-3.358273, 2, -5.399398,
-3.358273, -3, -5.399398,
-3.519014, -3, -5.671713,
-3.358273, -2, -5.399398,
-3.519014, -2, -5.671713,
-3.358273, -1, -5.399398,
-3.519014, -1, -5.671713,
-3.358273, 0, -5.399398,
-3.519014, 0, -5.671713,
-3.358273, 1, -5.399398,
-3.519014, 1, -5.671713,
-3.358273, 2, -5.399398,
-3.519014, 2, -5.671713
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
-3.840497, -3, -6.216343, 0, -0.5, 0.5, 0.5,
-3.840497, -3, -6.216343, 1, -0.5, 0.5, 0.5,
-3.840497, -3, -6.216343, 1, 1.5, 0.5, 0.5,
-3.840497, -3, -6.216343, 0, 1.5, 0.5, 0.5,
-3.840497, -2, -6.216343, 0, -0.5, 0.5, 0.5,
-3.840497, -2, -6.216343, 1, -0.5, 0.5, 0.5,
-3.840497, -2, -6.216343, 1, 1.5, 0.5, 0.5,
-3.840497, -2, -6.216343, 0, 1.5, 0.5, 0.5,
-3.840497, -1, -6.216343, 0, -0.5, 0.5, 0.5,
-3.840497, -1, -6.216343, 1, -0.5, 0.5, 0.5,
-3.840497, -1, -6.216343, 1, 1.5, 0.5, 0.5,
-3.840497, -1, -6.216343, 0, 1.5, 0.5, 0.5,
-3.840497, 0, -6.216343, 0, -0.5, 0.5, 0.5,
-3.840497, 0, -6.216343, 1, -0.5, 0.5, 0.5,
-3.840497, 0, -6.216343, 1, 1.5, 0.5, 0.5,
-3.840497, 0, -6.216343, 0, 1.5, 0.5, 0.5,
-3.840497, 1, -6.216343, 0, -0.5, 0.5, 0.5,
-3.840497, 1, -6.216343, 1, -0.5, 0.5, 0.5,
-3.840497, 1, -6.216343, 1, 1.5, 0.5, 0.5,
-3.840497, 1, -6.216343, 0, 1.5, 0.5, 0.5,
-3.840497, 2, -6.216343, 0, -0.5, 0.5, 0.5,
-3.840497, 2, -6.216343, 1, -0.5, 0.5, 0.5,
-3.840497, 2, -6.216343, 1, 1.5, 0.5, 0.5,
-3.840497, 2, -6.216343, 0, 1.5, 0.5, 0.5
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
-3.358273, -3.343016, -4,
-3.358273, -3.343016, 4,
-3.358273, -3.343016, -4,
-3.519014, -3.50268, -4,
-3.358273, -3.343016, -2,
-3.519014, -3.50268, -2,
-3.358273, -3.343016, 0,
-3.519014, -3.50268, 0,
-3.358273, -3.343016, 2,
-3.519014, -3.50268, 2,
-3.358273, -3.343016, 4,
-3.519014, -3.50268, 4
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
-3.840497, -3.822007, -4, 0, -0.5, 0.5, 0.5,
-3.840497, -3.822007, -4, 1, -0.5, 0.5, 0.5,
-3.840497, -3.822007, -4, 1, 1.5, 0.5, 0.5,
-3.840497, -3.822007, -4, 0, 1.5, 0.5, 0.5,
-3.840497, -3.822007, -2, 0, -0.5, 0.5, 0.5,
-3.840497, -3.822007, -2, 1, -0.5, 0.5, 0.5,
-3.840497, -3.822007, -2, 1, 1.5, 0.5, 0.5,
-3.840497, -3.822007, -2, 0, 1.5, 0.5, 0.5,
-3.840497, -3.822007, 0, 0, -0.5, 0.5, 0.5,
-3.840497, -3.822007, 0, 1, -0.5, 0.5, 0.5,
-3.840497, -3.822007, 0, 1, 1.5, 0.5, 0.5,
-3.840497, -3.822007, 0, 0, 1.5, 0.5, 0.5,
-3.840497, -3.822007, 2, 0, -0.5, 0.5, 0.5,
-3.840497, -3.822007, 2, 1, -0.5, 0.5, 0.5,
-3.840497, -3.822007, 2, 1, 1.5, 0.5, 0.5,
-3.840497, -3.822007, 2, 0, 1.5, 0.5, 0.5,
-3.840497, -3.822007, 4, 0, -0.5, 0.5, 0.5,
-3.840497, -3.822007, 4, 1, -0.5, 0.5, 0.5,
-3.840497, -3.822007, 4, 1, 1.5, 0.5, 0.5,
-3.840497, -3.822007, 4, 0, 1.5, 0.5, 0.5
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
-3.358273, -3.343016, -5.399398,
-3.358273, 3.043535, -5.399398,
-3.358273, -3.343016, 5.493209,
-3.358273, 3.043535, 5.493209,
-3.358273, -3.343016, -5.399398,
-3.358273, -3.343016, 5.493209,
-3.358273, 3.043535, -5.399398,
-3.358273, 3.043535, 5.493209,
-3.358273, -3.343016, -5.399398,
3.071389, -3.343016, -5.399398,
-3.358273, -3.343016, 5.493209,
3.071389, -3.343016, 5.493209,
-3.358273, 3.043535, -5.399398,
3.071389, 3.043535, -5.399398,
-3.358273, 3.043535, 5.493209,
3.071389, 3.043535, 5.493209,
3.071389, -3.343016, -5.399398,
3.071389, 3.043535, -5.399398,
3.071389, -3.343016, 5.493209,
3.071389, 3.043535, 5.493209,
3.071389, -3.343016, -5.399398,
3.071389, -3.343016, 5.493209,
3.071389, 3.043535, -5.399398,
3.071389, 3.043535, 5.493209
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
var radius = 7.566289;
var distance = 33.66327;
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
mvMatrix.translate( 0.143442, 0.1497407, -0.04690552 );
mvMatrix.scale( 1.272356, 1.280945, 0.7510434 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.66327);
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
mepiquat_chloride<-read.table("mepiquat_chloride.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-mepiquat_chloride$V2
```

```
## Error in eval(expr, envir, enclos): object 'mepiquat_chloride' not found
```

```r
y<-mepiquat_chloride$V3
```

```
## Error in eval(expr, envir, enclos): object 'mepiquat_chloride' not found
```

```r
z<-mepiquat_chloride$V4
```

```
## Error in eval(expr, envir, enclos): object 'mepiquat_chloride' not found
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
-3.264637, 0.8190694, -0.6360005, 0, 0, 1, 1, 1,
-3.191226, -0.8068755, -2.02216, 1, 0, 0, 1, 1,
-3.182201, 0.8598668, -1.665114, 1, 0, 0, 1, 1,
-2.703211, -1.232713, -1.966209, 1, 0, 0, 1, 1,
-2.662512, -1.06229, -3.405165, 1, 0, 0, 1, 1,
-2.610699, -0.7033336, -1.905116, 1, 0, 0, 1, 1,
-2.486536, -0.4221482, -1.922155, 0, 0, 0, 1, 1,
-2.435539, -1.122619, -1.098541, 0, 0, 0, 1, 1,
-2.331419, 0.3928621, 0.2141443, 0, 0, 0, 1, 1,
-2.280444, 1.598164, -1.727783, 0, 0, 0, 1, 1,
-2.184655, 0.9458581, -1.81481, 0, 0, 0, 1, 1,
-2.133209, 0.05556185, -1.304152, 0, 0, 0, 1, 1,
-2.114377, 0.2527947, -1.441624, 0, 0, 0, 1, 1,
-2.058845, -0.5566376, -3.342231, 1, 1, 1, 1, 1,
-1.979076, 0.2420614, -1.185956, 1, 1, 1, 1, 1,
-1.972541, 0.6888255, -2.633899, 1, 1, 1, 1, 1,
-1.957344, -0.815966, -2.144309, 1, 1, 1, 1, 1,
-1.943953, 0.3234476, -1.218607, 1, 1, 1, 1, 1,
-1.942357, -0.6541514, -2.579592, 1, 1, 1, 1, 1,
-1.923772, 0.7129044, -2.846652, 1, 1, 1, 1, 1,
-1.898266, 1.747806, -0.8683273, 1, 1, 1, 1, 1,
-1.892668, 0.147573, -2.124614, 1, 1, 1, 1, 1,
-1.843605, 2.009782, 0.6620464, 1, 1, 1, 1, 1,
-1.838915, 0.311137, -0.1338924, 1, 1, 1, 1, 1,
-1.828872, -1.009148, -3.171122, 1, 1, 1, 1, 1,
-1.823398, 0.7137694, -0.2265896, 1, 1, 1, 1, 1,
-1.815045, -0.5061821, -3.29029, 1, 1, 1, 1, 1,
-1.81379, -1.077665, -2.556552, 1, 1, 1, 1, 1,
-1.812442, -0.572325, -0.1735577, 0, 0, 1, 1, 1,
-1.798317, 0.1832742, -0.9384359, 1, 0, 0, 1, 1,
-1.778736, 0.2010268, -0.7404525, 1, 0, 0, 1, 1,
-1.75698, 1.254661, -1.266276, 1, 0, 0, 1, 1,
-1.747841, 0.5073542, -1.416156, 1, 0, 0, 1, 1,
-1.745002, -0.2347475, -1.26999, 1, 0, 0, 1, 1,
-1.742447, 0.613573, -1.578268, 0, 0, 0, 1, 1,
-1.737142, 0.9940942, -2.417861, 0, 0, 0, 1, 1,
-1.725442, 0.5112248, -1.934122, 0, 0, 0, 1, 1,
-1.711382, -1.84056, -1.322648, 0, 0, 0, 1, 1,
-1.676582, 0.1201082, -2.866856, 0, 0, 0, 1, 1,
-1.653713, -1.428178, -2.24766, 0, 0, 0, 1, 1,
-1.647152, 1.568411, 0.5965809, 0, 0, 0, 1, 1,
-1.642827, -0.763613, -2.571562, 1, 1, 1, 1, 1,
-1.622425, 0.8643602, 0.2631593, 1, 1, 1, 1, 1,
-1.603025, -0.3320439, -3.240038, 1, 1, 1, 1, 1,
-1.595098, -0.4701844, -1.610656, 1, 1, 1, 1, 1,
-1.587716, -0.243946, -1.251614, 1, 1, 1, 1, 1,
-1.579694, -0.4450457, -1.727051, 1, 1, 1, 1, 1,
-1.571458, 0.9963548, -1.335454, 1, 1, 1, 1, 1,
-1.561194, 0.7420526, -3.0831, 1, 1, 1, 1, 1,
-1.557609, -1.072917, -2.68679, 1, 1, 1, 1, 1,
-1.557138, 0.4252418, -0.9916467, 1, 1, 1, 1, 1,
-1.543146, 1.333001, 1.054232, 1, 1, 1, 1, 1,
-1.535419, 0.007008479, -1.527757, 1, 1, 1, 1, 1,
-1.526978, 1.345853, -0.6783294, 1, 1, 1, 1, 1,
-1.507598, 0.6207465, -1.47604, 1, 1, 1, 1, 1,
-1.506534, -1.058556, -2.011247, 1, 1, 1, 1, 1,
-1.50266, 0.1404827, -2.20803, 0, 0, 1, 1, 1,
-1.493885, -0.9665674, -3.871669, 1, 0, 0, 1, 1,
-1.489791, -0.8452706, -2.494959, 1, 0, 0, 1, 1,
-1.471586, 2.379182, -1.637811, 1, 0, 0, 1, 1,
-1.465122, -0.9591849, -2.685864, 1, 0, 0, 1, 1,
-1.456686, 0.260889, -0.6348378, 1, 0, 0, 1, 1,
-1.456067, -0.4991702, -1.761277, 0, 0, 0, 1, 1,
-1.456039, -0.7568635, -0.8704574, 0, 0, 0, 1, 1,
-1.453847, -0.4647184, -2.146321, 0, 0, 0, 1, 1,
-1.441005, 0.1857083, -2.731269, 0, 0, 0, 1, 1,
-1.437149, -0.354426, -1.887984, 0, 0, 0, 1, 1,
-1.414127, 0.2775517, -1.410163, 0, 0, 0, 1, 1,
-1.413211, 1.442834, 0.9151914, 0, 0, 0, 1, 1,
-1.410072, -1.783707, -1.999966, 1, 1, 1, 1, 1,
-1.389442, -0.09476664, -1.938002, 1, 1, 1, 1, 1,
-1.381058, -0.2804546, -1.022686, 1, 1, 1, 1, 1,
-1.376739, 0.2258622, -2.310728, 1, 1, 1, 1, 1,
-1.356979, 1.976944, -1.438214, 1, 1, 1, 1, 1,
-1.353621, 0.4533201, -0.5024614, 1, 1, 1, 1, 1,
-1.353547, -2.211059, -3.508379, 1, 1, 1, 1, 1,
-1.351518, 1.940862, -1.167659, 1, 1, 1, 1, 1,
-1.340724, -0.3300195, -2.245735, 1, 1, 1, 1, 1,
-1.329763, -0.7732458, -1.760744, 1, 1, 1, 1, 1,
-1.329702, 0.371625, -2.060265, 1, 1, 1, 1, 1,
-1.322061, -1.138441, -3.474224, 1, 1, 1, 1, 1,
-1.317385, 0.3213002, -1.287233, 1, 1, 1, 1, 1,
-1.315491, -0.06512641, -0.2164794, 1, 1, 1, 1, 1,
-1.313835, -0.7326132, -2.788224, 1, 1, 1, 1, 1,
-1.313006, 1.286281, -2.303382, 0, 0, 1, 1, 1,
-1.308585, 0.6720223, 0.2722335, 1, 0, 0, 1, 1,
-1.301748, 0.6601772, -1.634956, 1, 0, 0, 1, 1,
-1.280583, -0.01806352, -1.356869, 1, 0, 0, 1, 1,
-1.271946, -0.07323028, -1.579516, 1, 0, 0, 1, 1,
-1.270344, -0.8928997, -2.847061, 1, 0, 0, 1, 1,
-1.269268, 0.8535904, 0.3636154, 0, 0, 0, 1, 1,
-1.246959, -0.9588327, -0.6994214, 0, 0, 0, 1, 1,
-1.242459, 0.2162687, -0.8210841, 0, 0, 0, 1, 1,
-1.241275, 0.06623669, -0.4206463, 0, 0, 0, 1, 1,
-1.23678, 0.9979216, 0.8277571, 0, 0, 0, 1, 1,
-1.234067, 0.6640792, -1.568786, 0, 0, 0, 1, 1,
-1.233766, -1.193094, -1.842556, 0, 0, 0, 1, 1,
-1.230047, 0.8214504, -1.046487, 1, 1, 1, 1, 1,
-1.215621, 0.2439379, -2.119992, 1, 1, 1, 1, 1,
-1.189163, -0.1509759, -1.193654, 1, 1, 1, 1, 1,
-1.188811, 0.6677995, -1.976391, 1, 1, 1, 1, 1,
-1.182219, -1.818669, -1.028638, 1, 1, 1, 1, 1,
-1.179548, -0.08748246, -0.1318641, 1, 1, 1, 1, 1,
-1.178365, -0.3530547, -2.343287, 1, 1, 1, 1, 1,
-1.158706, -1.419656, -2.056592, 1, 1, 1, 1, 1,
-1.153339, 0.8029346, -1.658937, 1, 1, 1, 1, 1,
-1.150013, -0.03012733, -0.5389966, 1, 1, 1, 1, 1,
-1.143615, -2.725722, -1.223173, 1, 1, 1, 1, 1,
-1.138614, 1.086968, -1.407358, 1, 1, 1, 1, 1,
-1.137166, -0.9325111, -2.532277, 1, 1, 1, 1, 1,
-1.135948, 1.215373, -0.3639215, 1, 1, 1, 1, 1,
-1.134736, 0.2013121, -0.9046265, 1, 1, 1, 1, 1,
-1.131754, -0.07769372, -2.729948, 0, 0, 1, 1, 1,
-1.11403, -1.305647, -2.785151, 1, 0, 0, 1, 1,
-1.11198, -0.3869822, -2.171995, 1, 0, 0, 1, 1,
-1.105688, -1.341026, -3.761454, 1, 0, 0, 1, 1,
-1.104794, 0.3232708, -3.180841, 1, 0, 0, 1, 1,
-1.100721, 0.3292665, -0.1660216, 1, 0, 0, 1, 1,
-1.095714, -0.4378546, -3.491124, 0, 0, 0, 1, 1,
-1.093206, 0.7836257, -0.5261084, 0, 0, 0, 1, 1,
-1.090177, -0.3431908, -1.722242, 0, 0, 0, 1, 1,
-1.085203, -0.2306695, -0.9754532, 0, 0, 0, 1, 1,
-1.079699, 0.04886805, -2.128567, 0, 0, 0, 1, 1,
-1.071212, -1.705579, -3.362077, 0, 0, 0, 1, 1,
-1.065205, 0.9313374, -2.634143, 0, 0, 0, 1, 1,
-1.064903, -1.138331, -3.63519, 1, 1, 1, 1, 1,
-1.060354, 1.0931, -1.659271, 1, 1, 1, 1, 1,
-1.058816, 1.493525, -0.1265066, 1, 1, 1, 1, 1,
-1.057947, 0.1091887, -0.6549605, 1, 1, 1, 1, 1,
-1.051539, 0.1759087, -0.121889, 1, 1, 1, 1, 1,
-1.047147, 0.9767495, 0.1749156, 1, 1, 1, 1, 1,
-1.045689, 1.448332, -0.7870578, 1, 1, 1, 1, 1,
-1.041327, -0.6726068, -2.859969, 1, 1, 1, 1, 1,
-1.038092, -1.363414, -1.720356, 1, 1, 1, 1, 1,
-1.035359, 1.063922, -0.5871165, 1, 1, 1, 1, 1,
-1.029066, 0.7114259, -0.7839198, 1, 1, 1, 1, 1,
-1.028258, 1.990631, 0.5242396, 1, 1, 1, 1, 1,
-1.026078, 0.4879897, -0.4560944, 1, 1, 1, 1, 1,
-1.008685, 0.3317901, -2.237877, 1, 1, 1, 1, 1,
-1.00771, -0.6764657, -0.6868942, 1, 1, 1, 1, 1,
-1.002025, -1.118169, -0.3506979, 0, 0, 1, 1, 1,
-0.9980091, 0.676, -1.830812, 1, 0, 0, 1, 1,
-0.9916106, -0.1661775, -1.012025, 1, 0, 0, 1, 1,
-0.9864243, 1.61543, -1.152118, 1, 0, 0, 1, 1,
-0.9828486, -0.07206127, -0.1883174, 1, 0, 0, 1, 1,
-0.9769118, -0.0978737, -2.549474, 1, 0, 0, 1, 1,
-0.9726828, -0.4659615, -0.8376601, 0, 0, 0, 1, 1,
-0.9686625, -0.179958, 0.09586473, 0, 0, 0, 1, 1,
-0.965924, -1.732115, -4.145134, 0, 0, 0, 1, 1,
-0.965404, 0.3780163, -2.232395, 0, 0, 0, 1, 1,
-0.9628533, -0.4724551, -3.006201, 0, 0, 0, 1, 1,
-0.9577783, -0.07792462, -0.2482942, 0, 0, 0, 1, 1,
-0.9576246, -0.008607519, -1.423785, 0, 0, 0, 1, 1,
-0.9532332, -0.1610624, -2.150532, 1, 1, 1, 1, 1,
-0.9517083, -0.08165593, -2.489733, 1, 1, 1, 1, 1,
-0.9469811, 0.1515516, -0.3844593, 1, 1, 1, 1, 1,
-0.9336029, 0.513049, -0.3162119, 1, 1, 1, 1, 1,
-0.9331095, -0.900725, -3.350725, 1, 1, 1, 1, 1,
-0.9328226, -0.2080017, -3.383615, 1, 1, 1, 1, 1,
-0.9301269, 0.7099811, -0.002143487, 1, 1, 1, 1, 1,
-0.9292289, -1.645527, -1.451897, 1, 1, 1, 1, 1,
-0.9261678, -0.3216799, -2.564306, 1, 1, 1, 1, 1,
-0.920115, 0.02323243, 0.2392132, 1, 1, 1, 1, 1,
-0.917667, -0.5080442, -1.074134, 1, 1, 1, 1, 1,
-0.9142755, 0.6441329, 0.07706879, 1, 1, 1, 1, 1,
-0.9098479, 1.314664, 0.518577, 1, 1, 1, 1, 1,
-0.9069772, -0.4975151, -2.541538, 1, 1, 1, 1, 1,
-0.9034761, 0.4126707, -0.583937, 1, 1, 1, 1, 1,
-0.897736, 0.8419046, -0.7040555, 0, 0, 1, 1, 1,
-0.8895288, 1.241138, 0.66578, 1, 0, 0, 1, 1,
-0.8874921, -0.0229105, -3.28525, 1, 0, 0, 1, 1,
-0.8871225, 0.7951573, -1.140738, 1, 0, 0, 1, 1,
-0.8856111, 0.6539781, -0.6027128, 1, 0, 0, 1, 1,
-0.8820494, -1.59504, -3.652109, 1, 0, 0, 1, 1,
-0.8803687, 1.578215, 1.146739, 0, 0, 0, 1, 1,
-0.8778663, -0.02310051, -1.016441, 0, 0, 0, 1, 1,
-0.8683941, -0.8929392, -2.7007, 0, 0, 0, 1, 1,
-0.8626314, -0.7144836, -2.167882, 0, 0, 0, 1, 1,
-0.8570803, 0.2867614, -0.608473, 0, 0, 0, 1, 1,
-0.8539941, -1.893429, -2.184253, 0, 0, 0, 1, 1,
-0.8527123, 0.7425449, -2.368076, 0, 0, 0, 1, 1,
-0.8424527, 0.7581285, -0.4372008, 1, 1, 1, 1, 1,
-0.8410978, -0.2131967, -1.31921, 1, 1, 1, 1, 1,
-0.8408588, 0.3338821, -0.1049251, 1, 1, 1, 1, 1,
-0.8390123, -0.08240793, -3.48044, 1, 1, 1, 1, 1,
-0.8378002, -1.448543, -2.441674, 1, 1, 1, 1, 1,
-0.8361787, -0.3530082, -0.7808904, 1, 1, 1, 1, 1,
-0.8355798, -0.5819783, -1.967955, 1, 1, 1, 1, 1,
-0.8339106, 0.4333782, -0.2272563, 1, 1, 1, 1, 1,
-0.8217219, -0.7195897, -1.375474, 1, 1, 1, 1, 1,
-0.8195643, 1.391353, 0.21617, 1, 1, 1, 1, 1,
-0.8131289, 1.09132, 0.3613154, 1, 1, 1, 1, 1,
-0.8101087, 0.7716686, -0.780518, 1, 1, 1, 1, 1,
-0.7974971, 1.951297, -0.8926874, 1, 1, 1, 1, 1,
-0.7949156, -0.3197188, -1.811824, 1, 1, 1, 1, 1,
-0.7944033, 1.324633, -2.853461, 1, 1, 1, 1, 1,
-0.7934811, 0.1234949, -1.985201, 0, 0, 1, 1, 1,
-0.7929268, -1.401361, -1.293905, 1, 0, 0, 1, 1,
-0.7919807, 0.6485834, -0.6902762, 1, 0, 0, 1, 1,
-0.7915484, 0.008489274, -2.223452, 1, 0, 0, 1, 1,
-0.7914412, -0.02388267, -1.952693, 1, 0, 0, 1, 1,
-0.7688476, 1.124391, -1.004917, 1, 0, 0, 1, 1,
-0.7643501, -0.5162272, -2.624171, 0, 0, 0, 1, 1,
-0.7641246, -0.211395, -1.420772, 0, 0, 0, 1, 1,
-0.7567233, -3.10169, -2.223009, 0, 0, 0, 1, 1,
-0.7537177, 1.447281, 0.657752, 0, 0, 0, 1, 1,
-0.7534503, -1.020717, -3.854162, 0, 0, 0, 1, 1,
-0.7527083, 0.7249186, -1.573304, 0, 0, 0, 1, 1,
-0.7498707, -0.0480557, -2.724489, 0, 0, 0, 1, 1,
-0.7453804, -0.5621106, -0.9206203, 1, 1, 1, 1, 1,
-0.7409035, -0.0495468, -2.228514, 1, 1, 1, 1, 1,
-0.7373751, -0.2648077, -0.9279088, 1, 1, 1, 1, 1,
-0.7323501, -1.396648, -3.738389, 1, 1, 1, 1, 1,
-0.7239947, 0.3552431, -0.1786168, 1, 1, 1, 1, 1,
-0.7222732, -1.207091, -3.494256, 1, 1, 1, 1, 1,
-0.7199096, -0.5876501, -2.41835, 1, 1, 1, 1, 1,
-0.7146969, -0.7282663, -2.184747, 1, 1, 1, 1, 1,
-0.7146938, -0.1666279, -2.073715, 1, 1, 1, 1, 1,
-0.7117512, 0.2303642, -2.489558, 1, 1, 1, 1, 1,
-0.7081141, 0.2012608, -0.6011086, 1, 1, 1, 1, 1,
-0.7072311, 1.113994, 0.5526006, 1, 1, 1, 1, 1,
-0.7058123, -0.150057, -1.196806, 1, 1, 1, 1, 1,
-0.7037598, -1.246114, -1.888996, 1, 1, 1, 1, 1,
-0.7026621, 0.04357295, -1.431281, 1, 1, 1, 1, 1,
-0.7003717, -0.6687279, -3.681942, 0, 0, 1, 1, 1,
-0.6917999, -0.4209875, -3.575938, 1, 0, 0, 1, 1,
-0.6888555, 1.509035, -2.004443, 1, 0, 0, 1, 1,
-0.6876601, -1.249007, -3.730784, 1, 0, 0, 1, 1,
-0.6796816, -0.5519112, -1.306519, 1, 0, 0, 1, 1,
-0.6792817, -0.747661, -2.443803, 1, 0, 0, 1, 1,
-0.6776661, -1.132667, -1.722473, 0, 0, 0, 1, 1,
-0.6775692, 1.454261, 0.3825913, 0, 0, 0, 1, 1,
-0.6774771, -1.970784, -4.350499, 0, 0, 0, 1, 1,
-0.6684195, 1.358872, -1.686833, 0, 0, 0, 1, 1,
-0.6677971, 0.7292055, -0.09658692, 0, 0, 0, 1, 1,
-0.665394, 0.9589037, -2.385328, 0, 0, 0, 1, 1,
-0.6611128, 0.05648078, -2.222804, 0, 0, 0, 1, 1,
-0.6596172, -0.7326825, -2.322102, 1, 1, 1, 1, 1,
-0.6577662, 1.865619, 0.1194614, 1, 1, 1, 1, 1,
-0.6551625, 0.1841249, 0.4166019, 1, 1, 1, 1, 1,
-0.6446432, 0.01518287, -0.4977957, 1, 1, 1, 1, 1,
-0.6430663, 0.3291865, -1.16538, 1, 1, 1, 1, 1,
-0.6408672, 1.235802, 0.165563, 1, 1, 1, 1, 1,
-0.638523, 0.948447, 1.611812, 1, 1, 1, 1, 1,
-0.635406, -1.046438, -2.714519, 1, 1, 1, 1, 1,
-0.6345819, -1.001399, -3.134887, 1, 1, 1, 1, 1,
-0.6324219, -2.428566, -2.726239, 1, 1, 1, 1, 1,
-0.6280554, 2.792128, -1.737555, 1, 1, 1, 1, 1,
-0.6230242, -0.991408, -3.261167, 1, 1, 1, 1, 1,
-0.6181846, 0.7833918, -1.976444, 1, 1, 1, 1, 1,
-0.6117262, -0.5306895, -1.710659, 1, 1, 1, 1, 1,
-0.607956, 0.6276745, 0.2180386, 1, 1, 1, 1, 1,
-0.6071908, 1.390016, 0.4527805, 0, 0, 1, 1, 1,
-0.6047054, -1.047636, -1.524273, 1, 0, 0, 1, 1,
-0.6026636, 1.308513, -1.160216, 1, 0, 0, 1, 1,
-0.5973622, 2.204369, -0.5754137, 1, 0, 0, 1, 1,
-0.5927728, -1.078623, -2.733156, 1, 0, 0, 1, 1,
-0.5888107, 1.030488, -0.9827929, 1, 0, 0, 1, 1,
-0.5839561, 0.8417747, 0.2557121, 0, 0, 0, 1, 1,
-0.5811235, 0.2028094, -1.577002, 0, 0, 0, 1, 1,
-0.5809456, -1.361341, -1.428997, 0, 0, 0, 1, 1,
-0.580898, -2.166525, -2.501323, 0, 0, 0, 1, 1,
-0.5780758, -0.8494511, -2.855674, 0, 0, 0, 1, 1,
-0.5767812, -0.601346, -1.657723, 0, 0, 0, 1, 1,
-0.5705457, 0.07719036, -0.2676801, 0, 0, 0, 1, 1,
-0.5705304, 0.3303508, 0.5809905, 1, 1, 1, 1, 1,
-0.5662724, 1.110321, 0.1376875, 1, 1, 1, 1, 1,
-0.5661973, -1.602254, -2.863129, 1, 1, 1, 1, 1,
-0.5657808, -1.509327, -3.225128, 1, 1, 1, 1, 1,
-0.5631739, -1.168579, -1.717348, 1, 1, 1, 1, 1,
-0.5549508, 0.9443425, 1.223801, 1, 1, 1, 1, 1,
-0.5541162, 0.4525537, -0.76193, 1, 1, 1, 1, 1,
-0.5515841, 2.146417, -1.52137, 1, 1, 1, 1, 1,
-0.5473735, -0.2206596, -1.013944, 1, 1, 1, 1, 1,
-0.5463976, 0.3757792, -0.873131, 1, 1, 1, 1, 1,
-0.5430376, -1.151463, -2.462881, 1, 1, 1, 1, 1,
-0.5398547, 0.6563484, -0.3042519, 1, 1, 1, 1, 1,
-0.5259448, -1.769413, -1.970867, 1, 1, 1, 1, 1,
-0.5232852, -0.08648247, -2.371002, 1, 1, 1, 1, 1,
-0.5220871, 0.06012544, -3.013155, 1, 1, 1, 1, 1,
-0.5165174, -1.010437, -2.226566, 0, 0, 1, 1, 1,
-0.5134434, -1.12967, -2.518773, 1, 0, 0, 1, 1,
-0.5120876, 0.4608775, -0.1563605, 1, 0, 0, 1, 1,
-0.5008076, 0.7664144, 0.1613264, 1, 0, 0, 1, 1,
-0.4981859, 0.6826156, -2.917329, 1, 0, 0, 1, 1,
-0.4962226, -0.4919635, -2.550009, 1, 0, 0, 1, 1,
-0.494468, -0.03221452, -0.2197803, 0, 0, 0, 1, 1,
-0.4944178, -0.5649049, -2.947999, 0, 0, 0, 1, 1,
-0.4931364, -1.188807, -1.598654, 0, 0, 0, 1, 1,
-0.4915299, 0.1912987, -0.3807982, 0, 0, 0, 1, 1,
-0.4892129, 0.6160598, -1.731051, 0, 0, 0, 1, 1,
-0.4815151, -0.07205667, -3.498341, 0, 0, 0, 1, 1,
-0.479291, 0.6477336, 0.369828, 0, 0, 0, 1, 1,
-0.478918, 0.1992507, -3.096956, 1, 1, 1, 1, 1,
-0.4788571, 0.5618035, 0.768285, 1, 1, 1, 1, 1,
-0.4777848, -1.114854, -3.146474, 1, 1, 1, 1, 1,
-0.4726617, 0.6158034, -0.3357919, 1, 1, 1, 1, 1,
-0.4656042, -0.3971775, -2.963803, 1, 1, 1, 1, 1,
-0.4652926, -0.2751815, -0.9669268, 1, 1, 1, 1, 1,
-0.4593225, 2.509243, 0.5153161, 1, 1, 1, 1, 1,
-0.4568906, 0.8656537, 0.5958191, 1, 1, 1, 1, 1,
-0.4526905, 0.1977901, -0.8843689, 1, 1, 1, 1, 1,
-0.4488469, 0.4594514, -1.018327, 1, 1, 1, 1, 1,
-0.4415022, -1.10642, -3.162607, 1, 1, 1, 1, 1,
-0.439588, -0.1248985, -1.860825, 1, 1, 1, 1, 1,
-0.4271032, -0.634039, -2.857366, 1, 1, 1, 1, 1,
-0.4251656, 0.5704408, -0.2027101, 1, 1, 1, 1, 1,
-0.4246328, -1.03343, -3.01142, 1, 1, 1, 1, 1,
-0.4208899, -1.321992, -4.942391, 0, 0, 1, 1, 1,
-0.4196718, -1.590757, -4.542114, 1, 0, 0, 1, 1,
-0.4166583, 1.69129, -3.600586, 1, 0, 0, 1, 1,
-0.4143618, 0.9930155, 1.548495, 1, 0, 0, 1, 1,
-0.413657, 0.9145955, 1.425385, 1, 0, 0, 1, 1,
-0.4130509, 0.573833, -1.242693, 1, 0, 0, 1, 1,
-0.4124934, 0.1141652, 0.8977757, 0, 0, 0, 1, 1,
-0.4119945, -0.5288234, -4.339358, 0, 0, 0, 1, 1,
-0.4107098, -0.9728699, -3.408673, 0, 0, 0, 1, 1,
-0.4106469, -1.612135, -2.637883, 0, 0, 0, 1, 1,
-0.4045382, 0.330156, 0.7188785, 0, 0, 0, 1, 1,
-0.3992316, -1.150738, -3.54288, 0, 0, 0, 1, 1,
-0.3992296, -0.4034901, -1.863238, 0, 0, 0, 1, 1,
-0.3992148, 1.766788, -0.3816686, 1, 1, 1, 1, 1,
-0.3982587, -0.3125098, -2.001307, 1, 1, 1, 1, 1,
-0.3947468, -1.089254, -2.728708, 1, 1, 1, 1, 1,
-0.3934436, 0.6433915, -0.1032442, 1, 1, 1, 1, 1,
-0.3885849, 0.3940114, -0.1494879, 1, 1, 1, 1, 1,
-0.3855521, -0.2989224, -3.330173, 1, 1, 1, 1, 1,
-0.3843822, 1.181431, -0.3453628, 1, 1, 1, 1, 1,
-0.3831779, -0.6848751, -2.037045, 1, 1, 1, 1, 1,
-0.3791536, 2.013497, -1.392874, 1, 1, 1, 1, 1,
-0.3775771, 0.2116447, -0.2658681, 1, 1, 1, 1, 1,
-0.3761945, -0.007638972, -3.591888, 1, 1, 1, 1, 1,
-0.374723, 0.5613884, 0.3598065, 1, 1, 1, 1, 1,
-0.3635784, -0.07616291, -1.638873, 1, 1, 1, 1, 1,
-0.3631352, -0.2428473, -0.6806101, 1, 1, 1, 1, 1,
-0.3608437, 0.4482844, 0.43199, 1, 1, 1, 1, 1,
-0.3580286, -0.7378712, -1.273267, 0, 0, 1, 1, 1,
-0.3578627, 0.3823506, -0.4093958, 1, 0, 0, 1, 1,
-0.3524774, -0.9872717, -1.958358, 1, 0, 0, 1, 1,
-0.3509144, 0.01772291, -1.840235, 1, 0, 0, 1, 1,
-0.3463185, 1.018031, -0.02452558, 1, 0, 0, 1, 1,
-0.3451791, 0.6737589, -0.3390432, 1, 0, 0, 1, 1,
-0.3412881, 0.6874622, -0.3871758, 0, 0, 0, 1, 1,
-0.3403116, 2.2579, -1.13893, 0, 0, 0, 1, 1,
-0.3390719, 0.2483853, -2.587725, 0, 0, 0, 1, 1,
-0.3372735, 0.5692683, -1.238288, 0, 0, 0, 1, 1,
-0.3356038, 1.28291, 1.710539, 0, 0, 0, 1, 1,
-0.335456, 0.1551033, -1.650598, 0, 0, 0, 1, 1,
-0.3281308, -0.4344417, -2.174548, 0, 0, 0, 1, 1,
-0.3257141, 0.1938925, -0.6140928, 1, 1, 1, 1, 1,
-0.3241011, 1.085278, -0.07330894, 1, 1, 1, 1, 1,
-0.3220631, -0.4002727, -1.648382, 1, 1, 1, 1, 1,
-0.3210855, -1.070733, -4.601857, 1, 1, 1, 1, 1,
-0.3171029, 0.625529, 1.22855, 1, 1, 1, 1, 1,
-0.3151633, -1.305179, -3.597773, 1, 1, 1, 1, 1,
-0.3148804, -0.846261, -2.569113, 1, 1, 1, 1, 1,
-0.3130272, -0.6165835, -0.4282992, 1, 1, 1, 1, 1,
-0.3115368, 0.5392213, 0.1309291, 1, 1, 1, 1, 1,
-0.3093367, -0.4235025, -3.07336, 1, 1, 1, 1, 1,
-0.3029165, -0.2686789, -1.634468, 1, 1, 1, 1, 1,
-0.2976822, -0.3197618, -1.73611, 1, 1, 1, 1, 1,
-0.2925326, -0.7102565, -2.920156, 1, 1, 1, 1, 1,
-0.2900914, 0.2294911, -2.015451, 1, 1, 1, 1, 1,
-0.2899298, -0.3669791, -2.757776, 1, 1, 1, 1, 1,
-0.2883065, 0.9474926, -0.3487455, 0, 0, 1, 1, 1,
-0.2861318, 0.6458861, -0.5121431, 1, 0, 0, 1, 1,
-0.2856137, 0.731299, -0.8703838, 1, 0, 0, 1, 1,
-0.2837887, -0.5419226, -1.97033, 1, 0, 0, 1, 1,
-0.2774606, 0.9248489, -1.567798, 1, 0, 0, 1, 1,
-0.2770764, -0.725844, -0.8549466, 1, 0, 0, 1, 1,
-0.2754987, 0.8010545, -0.001855382, 0, 0, 0, 1, 1,
-0.2749111, -0.4405234, -1.949318, 0, 0, 0, 1, 1,
-0.2659031, 0.6719876, 0.6802669, 0, 0, 0, 1, 1,
-0.2655973, -0.686358, -3.55579, 0, 0, 0, 1, 1,
-0.2643329, -0.6202168, -1.900986, 0, 0, 0, 1, 1,
-0.2629273, 1.057775, -0.7614542, 0, 0, 0, 1, 1,
-0.2628966, -0.5551414, -1.622494, 0, 0, 0, 1, 1,
-0.2595124, 0.9634282, -1.730183, 1, 1, 1, 1, 1,
-0.2548732, -1.484685, -0.4765509, 1, 1, 1, 1, 1,
-0.2503626, -1.285127, -3.964015, 1, 1, 1, 1, 1,
-0.2488367, 1.124024, -1.239523, 1, 1, 1, 1, 1,
-0.2448761, -1.81371, -3.479297, 1, 1, 1, 1, 1,
-0.2447253, -0.01769729, -2.920225, 1, 1, 1, 1, 1,
-0.2426709, 0.1994448, -1.129548, 1, 1, 1, 1, 1,
-0.2391673, -0.6493968, -2.362565, 1, 1, 1, 1, 1,
-0.2361398, -0.4139106, -2.843652, 1, 1, 1, 1, 1,
-0.2342376, 0.08477078, -1.143003, 1, 1, 1, 1, 1,
-0.2338909, -0.9413592, -2.470363, 1, 1, 1, 1, 1,
-0.2282158, -2.604326, -1.848425, 1, 1, 1, 1, 1,
-0.2245117, -1.107965, -4.056528, 1, 1, 1, 1, 1,
-0.2193242, -0.7576917, -4.460237, 1, 1, 1, 1, 1,
-0.2184264, -0.2767329, -1.090266, 1, 1, 1, 1, 1,
-0.2172143, 1.567285, 0.4435806, 0, 0, 1, 1, 1,
-0.2157971, -0.8076522, -1.179634, 1, 0, 0, 1, 1,
-0.211602, -0.3814834, -2.695223, 1, 0, 0, 1, 1,
-0.2114937, 0.3989946, -0.4490321, 1, 0, 0, 1, 1,
-0.2082388, -0.8702669, -2.712487, 1, 0, 0, 1, 1,
-0.2079293, 0.1593868, -0.2671732, 1, 0, 0, 1, 1,
-0.2078694, 0.4266585, 0.2847899, 0, 0, 0, 1, 1,
-0.207792, 0.5009594, -0.06964172, 0, 0, 0, 1, 1,
-0.2074872, 1.457382, -0.9262942, 0, 0, 0, 1, 1,
-0.2055328, 2.155871, 1.011155, 0, 0, 0, 1, 1,
-0.2021073, -1.067219, -0.6320236, 0, 0, 0, 1, 1,
-0.1964094, 1.517523, -0.8477975, 0, 0, 0, 1, 1,
-0.1934424, -0.1171199, -1.841207, 0, 0, 0, 1, 1,
-0.1917438, 0.4515749, 0.4569005, 1, 1, 1, 1, 1,
-0.1895211, -1.124481, -1.45554, 1, 1, 1, 1, 1,
-0.1884233, -0.6727778, -2.858951, 1, 1, 1, 1, 1,
-0.1868819, 0.5283718, 0.4058925, 1, 1, 1, 1, 1,
-0.1835772, -0.5481308, -4.835792, 1, 1, 1, 1, 1,
-0.180585, -1.137822, -3.085557, 1, 1, 1, 1, 1,
-0.1777258, -0.03579355, -3.353338, 1, 1, 1, 1, 1,
-0.1746718, -0.1810343, -2.177087, 1, 1, 1, 1, 1,
-0.1732848, 0.8289533, 0.1866083, 1, 1, 1, 1, 1,
-0.1727652, 0.3133759, -1.290412, 1, 1, 1, 1, 1,
-0.1723213, -0.2525744, -3.91878, 1, 1, 1, 1, 1,
-0.1711747, -0.3666825, -1.797745, 1, 1, 1, 1, 1,
-0.1700858, -1.459668, -0.8043351, 1, 1, 1, 1, 1,
-0.1700549, 1.103149, -1.300903, 1, 1, 1, 1, 1,
-0.1694508, 0.6638526, 0.3773016, 1, 1, 1, 1, 1,
-0.1677402, -0.8260205, -2.736989, 0, 0, 1, 1, 1,
-0.1655142, -0.8397592, -4.476386, 1, 0, 0, 1, 1,
-0.1629573, -2.922573, -3.204504, 1, 0, 0, 1, 1,
-0.1614638, -1.261835, -3.935503, 1, 0, 0, 1, 1,
-0.1608116, -1.364255, -3.038433, 1, 0, 0, 1, 1,
-0.1547463, -1.246216, -3.931611, 1, 0, 0, 1, 1,
-0.1451513, 0.5564592, -2.801982, 0, 0, 0, 1, 1,
-0.1360563, 0.906534, 0.227353, 0, 0, 0, 1, 1,
-0.130102, -0.19341, -2.066963, 0, 0, 0, 1, 1,
-0.1267273, 0.4434098, -0.3392503, 0, 0, 0, 1, 1,
-0.123121, -0.2851241, -2.526462, 0, 0, 0, 1, 1,
-0.122509, 0.9915312, 0.5223318, 0, 0, 0, 1, 1,
-0.1211092, 0.9132545, 0.8903339, 0, 0, 0, 1, 1,
-0.1169303, -0.2195579, -0.9926797, 1, 1, 1, 1, 1,
-0.1127338, -1.567607, -4.126207, 1, 1, 1, 1, 1,
-0.1112893, -0.05617954, -1.892504, 1, 1, 1, 1, 1,
-0.1071904, 0.7578489, 0.1924509, 1, 1, 1, 1, 1,
-0.09824602, -0.452301, -2.303821, 1, 1, 1, 1, 1,
-0.09702915, -1.921382, -2.591127, 1, 1, 1, 1, 1,
-0.09439531, 0.5822207, -0.03743697, 1, 1, 1, 1, 1,
-0.09266035, -0.06878366, -3.99314, 1, 1, 1, 1, 1,
-0.09265728, 1.040963, -3.081254, 1, 1, 1, 1, 1,
-0.0907924, 1.315485, 1.077715, 1, 1, 1, 1, 1,
-0.08484219, -0.2431368, -0.8542479, 1, 1, 1, 1, 1,
-0.08438351, -0.1732022, -3.035227, 1, 1, 1, 1, 1,
-0.08313733, -0.5950201, -3.381596, 1, 1, 1, 1, 1,
-0.08306316, 0.1748606, 1.121522, 1, 1, 1, 1, 1,
-0.08262615, -1.303192, -3.897189, 1, 1, 1, 1, 1,
-0.08138849, -1.459058, -1.417022, 0, 0, 1, 1, 1,
-0.0800121, 1.436062, -0.8880538, 1, 0, 0, 1, 1,
-0.07666188, 0.1571871, 0.9581105, 1, 0, 0, 1, 1,
-0.07188707, -0.6638608, -2.958957, 1, 0, 0, 1, 1,
-0.07155971, -1.433644, -2.573337, 1, 0, 0, 1, 1,
-0.07132874, -1.107173, -3.652407, 1, 0, 0, 1, 1,
-0.06893414, 0.3925582, -1.535219, 0, 0, 0, 1, 1,
-0.06370625, -0.672042, -3.495072, 0, 0, 0, 1, 1,
-0.06141817, -1.274508, -3.500122, 0, 0, 0, 1, 1,
-0.06136629, -0.5815759, -2.895041, 0, 0, 0, 1, 1,
-0.0600533, -1.720691, -3.741039, 0, 0, 0, 1, 1,
-0.05869897, 1.016061, -0.6120143, 0, 0, 0, 1, 1,
-0.05866197, 1.069494, -0.634274, 0, 0, 0, 1, 1,
-0.05813238, 0.9726367, 0.7502589, 1, 1, 1, 1, 1,
-0.05248379, 0.9965295, -1.276806, 1, 1, 1, 1, 1,
-0.05213583, -0.02246427, -1.661618, 1, 1, 1, 1, 1,
-0.04654521, -1.565497, -5.014483, 1, 1, 1, 1, 1,
-0.04561498, -1.491971, -5.240767, 1, 1, 1, 1, 1,
-0.0430011, -1.164229, -2.499815, 1, 1, 1, 1, 1,
-0.04084221, -0.1903536, -1.768097, 1, 1, 1, 1, 1,
-0.03082807, 1.089256, 0.2713679, 1, 1, 1, 1, 1,
-0.02778704, 0.03003456, -0.8735733, 1, 1, 1, 1, 1,
-0.02705565, 0.5554473, 0.9170936, 1, 1, 1, 1, 1,
-0.02665785, -0.2544611, -3.743247, 1, 1, 1, 1, 1,
-0.02466184, 0.5331492, -0.1275403, 1, 1, 1, 1, 1,
-0.02414412, 0.8703098, -0.8717594, 1, 1, 1, 1, 1,
-0.0211892, -1.013068, -3.016135, 1, 1, 1, 1, 1,
-0.02116367, 0.9143232, -0.5757194, 1, 1, 1, 1, 1,
-0.02009617, 0.06053475, 0.7322413, 0, 0, 1, 1, 1,
-0.01977024, 2.950527, 2.763322, 1, 0, 0, 1, 1,
-0.01886146, 0.06538894, 0.8413473, 1, 0, 0, 1, 1,
-0.01383263, 0.8040253, -0.4792593, 1, 0, 0, 1, 1,
-0.01287629, -1.642538, -2.55532, 1, 0, 0, 1, 1,
-0.01208099, -0.2049808, -3.191839, 1, 0, 0, 1, 1,
-0.008521099, 0.8484611, 0.3285314, 0, 0, 0, 1, 1,
-0.006875488, -0.1768787, -2.74823, 0, 0, 0, 1, 1,
-0.005425232, 0.7026649, 0.9528626, 0, 0, 0, 1, 1,
8.112525e-05, 0.6093674, 0.1537133, 0, 0, 0, 1, 1,
0.005879944, -0.2097811, 1.250542, 0, 0, 0, 1, 1,
0.006595575, -1.052259, 1.555002, 0, 0, 0, 1, 1,
0.00799974, 0.6401724, 0.4143142, 0, 0, 0, 1, 1,
0.01142349, 0.9198651, -1.329959, 1, 1, 1, 1, 1,
0.01431838, 2.876859, -0.9892138, 1, 1, 1, 1, 1,
0.0156038, 0.04373145, 0.8824299, 1, 1, 1, 1, 1,
0.01570325, 0.3627189, 0.5917132, 1, 1, 1, 1, 1,
0.01570535, 0.1042321, -0.8116034, 1, 1, 1, 1, 1,
0.01769041, -0.9109204, 3.413393, 1, 1, 1, 1, 1,
0.0221274, 0.6012994, 2.468319, 1, 1, 1, 1, 1,
0.02379202, -0.6183513, 2.058882, 1, 1, 1, 1, 1,
0.02891915, 0.6201909, -0.3345403, 1, 1, 1, 1, 1,
0.02993683, 0.4179143, 0.0425224, 1, 1, 1, 1, 1,
0.03184317, 1.381494, 1.82977, 1, 1, 1, 1, 1,
0.03204105, -0.8094762, 2.092806, 1, 1, 1, 1, 1,
0.03609748, -0.7294374, 3.212297, 1, 1, 1, 1, 1,
0.0379856, -0.2091666, 4.192133, 1, 1, 1, 1, 1,
0.04645848, -0.4943784, 3.824323, 1, 1, 1, 1, 1,
0.05201677, 1.580807, 0.4835029, 0, 0, 1, 1, 1,
0.05334593, 0.6595209, 1.2817, 1, 0, 0, 1, 1,
0.05506036, -0.201873, 2.196686, 1, 0, 0, 1, 1,
0.05824013, 0.1383891, 0.7378815, 1, 0, 0, 1, 1,
0.06225811, -0.07009441, 1.211608, 1, 0, 0, 1, 1,
0.06295712, 1.53148, 0.8852171, 1, 0, 0, 1, 1,
0.06444586, 0.7716237, -0.5357734, 0, 0, 0, 1, 1,
0.06833909, 0.6971248, 1.183184, 0, 0, 0, 1, 1,
0.06851773, -1.080381, 4.453873, 0, 0, 0, 1, 1,
0.0707399, -1.266947, 1.835483, 0, 0, 0, 1, 1,
0.07169734, 0.6958115, -0.6780157, 0, 0, 0, 1, 1,
0.07537264, 1.843019, 1.074892, 0, 0, 0, 1, 1,
0.07879744, 0.8389285, -0.128353, 0, 0, 0, 1, 1,
0.07908222, -2.123286, 3.596996, 1, 1, 1, 1, 1,
0.08081984, 0.3543887, 2.56099, 1, 1, 1, 1, 1,
0.08392733, -0.7604062, 2.599266, 1, 1, 1, 1, 1,
0.08862095, 0.3452913, 0.6086156, 1, 1, 1, 1, 1,
0.09407273, -0.380937, 4.731111, 1, 1, 1, 1, 1,
0.1020772, -0.5092941, 1.491067, 1, 1, 1, 1, 1,
0.1021076, -0.5590525, 2.519344, 1, 1, 1, 1, 1,
0.1054649, 0.983595, 1.613635, 1, 1, 1, 1, 1,
0.1087858, 0.117861, 0.1995134, 1, 1, 1, 1, 1,
0.1099063, -0.9939249, 3.908578, 1, 1, 1, 1, 1,
0.1111443, 0.6373371, -0.6314761, 1, 1, 1, 1, 1,
0.1118715, 1.120511, 0.4730198, 1, 1, 1, 1, 1,
0.1190023, 0.3195525, -1.211936, 1, 1, 1, 1, 1,
0.1216679, -0.1473396, 3.304121, 1, 1, 1, 1, 1,
0.123861, -1.056508, 1.888071, 1, 1, 1, 1, 1,
0.1252424, -1.036165, 4.04301, 0, 0, 1, 1, 1,
0.1268384, 2.292959, 1.193655, 1, 0, 0, 1, 1,
0.1272575, -0.8454201, 3.657867, 1, 0, 0, 1, 1,
0.1337635, 0.5369359, -0.05942158, 1, 0, 0, 1, 1,
0.1343279, -0.7017559, 3.923301, 1, 0, 0, 1, 1,
0.1360425, 0.3494923, -0.7283275, 1, 0, 0, 1, 1,
0.1419881, 0.3097239, 0.04636668, 0, 0, 0, 1, 1,
0.1490213, 0.711518, 1.582949, 0, 0, 0, 1, 1,
0.1532896, 1.244783, 1.146685, 0, 0, 0, 1, 1,
0.1544652, -1.311684, 2.78534, 0, 0, 0, 1, 1,
0.1571662, -0.2497165, 3.059085, 0, 0, 0, 1, 1,
0.1581929, -1.276074, 2.170403, 0, 0, 0, 1, 1,
0.158319, 0.5445681, -0.9695179, 0, 0, 0, 1, 1,
0.1606636, 0.7177284, -0.3261136, 1, 1, 1, 1, 1,
0.1618761, 0.5466052, 0.9549468, 1, 1, 1, 1, 1,
0.1680614, 0.8538585, 0.7560323, 1, 1, 1, 1, 1,
0.1681803, -0.6226062, 3.596096, 1, 1, 1, 1, 1,
0.1689437, -0.6896721, 2.336011, 1, 1, 1, 1, 1,
0.1706628, 0.8153999, -0.2748327, 1, 1, 1, 1, 1,
0.1715851, 1.608485, 1.690913, 1, 1, 1, 1, 1,
0.1739787, -1.110798, 2.8916, 1, 1, 1, 1, 1,
0.1744197, 1.159735, 1.671573, 1, 1, 1, 1, 1,
0.1750474, 1.823287, -0.1003718, 1, 1, 1, 1, 1,
0.1782018, 0.8008357, 0.8954065, 1, 1, 1, 1, 1,
0.1813328, -0.5258717, 4.43726, 1, 1, 1, 1, 1,
0.181474, -1.346251, 3.456002, 1, 1, 1, 1, 1,
0.1840705, -1.477662, 1.917839, 1, 1, 1, 1, 1,
0.1849205, 0.1567294, -0.7294073, 1, 1, 1, 1, 1,
0.1860881, -1.019823, 5.151128, 0, 0, 1, 1, 1,
0.1893751, -0.1364811, 2.074238, 1, 0, 0, 1, 1,
0.1947682, -0.6659568, 4.016929, 1, 0, 0, 1, 1,
0.2029633, -0.2183145, 1.756349, 1, 0, 0, 1, 1,
0.2039249, -0.07416226, -0.2354167, 1, 0, 0, 1, 1,
0.2069877, -0.58237, 2.426923, 1, 0, 0, 1, 1,
0.2073724, 0.7350293, -0.2023064, 0, 0, 0, 1, 1,
0.2103772, -1.892575, 2.238925, 0, 0, 0, 1, 1,
0.2104214, 1.023623, -1.855024, 0, 0, 0, 1, 1,
0.2134141, 0.1748483, 2.009587, 0, 0, 0, 1, 1,
0.2147582, -2.587959, 3.202738, 0, 0, 0, 1, 1,
0.217948, 0.3925235, 2.032699, 0, 0, 0, 1, 1,
0.2205518, -1.534089, 2.893917, 0, 0, 0, 1, 1,
0.2209785, 1.037688, 1.841226, 1, 1, 1, 1, 1,
0.2211208, -0.1642176, 2.579089, 1, 1, 1, 1, 1,
0.2216974, 0.3990873, 1.917846, 1, 1, 1, 1, 1,
0.2219729, -1.139119, 3.105585, 1, 1, 1, 1, 1,
0.2230964, 0.6624915, 2.021344, 1, 1, 1, 1, 1,
0.2232364, -0.4232195, 3.552554, 1, 1, 1, 1, 1,
0.2323932, -0.2855911, 2.901485, 1, 1, 1, 1, 1,
0.2329679, 0.3643743, 0.6771731, 1, 1, 1, 1, 1,
0.2330412, 1.384124, -1.254207, 1, 1, 1, 1, 1,
0.2354483, -0.5222203, 2.848044, 1, 1, 1, 1, 1,
0.2366729, 0.04178872, 0.3659599, 1, 1, 1, 1, 1,
0.2411277, -0.6461806, 2.50324, 1, 1, 1, 1, 1,
0.247395, 0.6585693, 0.06277575, 1, 1, 1, 1, 1,
0.2495559, 0.2441208, 1.60377, 1, 1, 1, 1, 1,
0.2547441, -0.6411114, 2.411154, 1, 1, 1, 1, 1,
0.2561966, -0.3819335, 3.728188, 0, 0, 1, 1, 1,
0.2584146, 0.7055956, 1.328369, 1, 0, 0, 1, 1,
0.2588337, -1.122891, 3.977132, 1, 0, 0, 1, 1,
0.259374, -0.4969832, 1.779671, 1, 0, 0, 1, 1,
0.2642054, 0.6432485, 0.7328286, 1, 0, 0, 1, 1,
0.2654902, 1.146697, 1.173062, 1, 0, 0, 1, 1,
0.2659906, 0.9093959, -0.5755835, 0, 0, 0, 1, 1,
0.2686852, 0.9652548, 0.02471841, 0, 0, 0, 1, 1,
0.2692016, 0.9449168, 1.734867, 0, 0, 0, 1, 1,
0.2700687, -0.2918266, 1.007504, 0, 0, 0, 1, 1,
0.2733608, 0.8646036, 0.2317142, 0, 0, 0, 1, 1,
0.2736701, -1.708612, 1.812629, 0, 0, 0, 1, 1,
0.2748266, -1.032746, 4.105819, 0, 0, 0, 1, 1,
0.2749386, 0.1534817, 0.4574137, 1, 1, 1, 1, 1,
0.2764198, 0.3780666, 0.5363018, 1, 1, 1, 1, 1,
0.2861026, 0.2921419, 0.3145698, 1, 1, 1, 1, 1,
0.2912701, -1.767464, 3.183717, 1, 1, 1, 1, 1,
0.2914425, -0.07042819, 1.326689, 1, 1, 1, 1, 1,
0.2933556, 1.845756, 1.09785, 1, 1, 1, 1, 1,
0.2979516, -0.05621359, 2.213376, 1, 1, 1, 1, 1,
0.3051613, 0.4027321, 0.3715861, 1, 1, 1, 1, 1,
0.3091097, 0.6884797, 0.1196865, 1, 1, 1, 1, 1,
0.3171306, 0.3133612, 0.4575538, 1, 1, 1, 1, 1,
0.3191843, -1.867584, 2.808636, 1, 1, 1, 1, 1,
0.319654, 0.02434463, -0.04199212, 1, 1, 1, 1, 1,
0.3247707, -1.129155, 3.203711, 1, 1, 1, 1, 1,
0.3253401, 0.9640501, 1.267019, 1, 1, 1, 1, 1,
0.3278444, -1.705747, 3.120719, 1, 1, 1, 1, 1,
0.3331466, 0.2519726, -0.7164955, 0, 0, 1, 1, 1,
0.3426193, 1.76379, -0.5738824, 1, 0, 0, 1, 1,
0.3454938, -0.5258736, 3.340125, 1, 0, 0, 1, 1,
0.3459431, 0.6254877, -0.5564179, 1, 0, 0, 1, 1,
0.34633, -0.3679253, 1.353883, 1, 0, 0, 1, 1,
0.3509956, 0.6816334, 0.9493169, 1, 0, 0, 1, 1,
0.3556711, 0.1939355, 2.347647, 0, 0, 0, 1, 1,
0.3564436, -1.212252, 1.81174, 0, 0, 0, 1, 1,
0.3586216, 2.507647, 1.511597, 0, 0, 0, 1, 1,
0.3603775, 1.259003, 0.2130991, 0, 0, 0, 1, 1,
0.3609411, 1.168447, 0.4651075, 0, 0, 0, 1, 1,
0.3642171, -1.274992, 4.039078, 0, 0, 0, 1, 1,
0.3647374, -0.3904514, 2.353846, 0, 0, 0, 1, 1,
0.3678614, 0.8104071, -0.4269533, 1, 1, 1, 1, 1,
0.3717693, -1.045836, 3.833108, 1, 1, 1, 1, 1,
0.371907, 0.3156674, 0.4130509, 1, 1, 1, 1, 1,
0.3723616, 0.1929443, 1.080579, 1, 1, 1, 1, 1,
0.3751716, -1.189474, 1.555877, 1, 1, 1, 1, 1,
0.3766077, -0.1709756, 3.57474, 1, 1, 1, 1, 1,
0.3777692, 1.316411, -0.967288, 1, 1, 1, 1, 1,
0.3777792, -0.08698865, 1.641707, 1, 1, 1, 1, 1,
0.3823467, 0.1602392, 1.624442, 1, 1, 1, 1, 1,
0.3836322, 2.334026, 0.9419851, 1, 1, 1, 1, 1,
0.384042, 0.3286193, 1.046727, 1, 1, 1, 1, 1,
0.3892576, 0.5422258, 0.6796307, 1, 1, 1, 1, 1,
0.3910359, -0.2953179, 1.820154, 1, 1, 1, 1, 1,
0.3910427, 0.9196013, 1.979462, 1, 1, 1, 1, 1,
0.3924532, -0.7955291, 3.016151, 1, 1, 1, 1, 1,
0.3942142, -1.079908, 2.908416, 0, 0, 1, 1, 1,
0.3965633, -0.03009099, 2.391667, 1, 0, 0, 1, 1,
0.397138, -1.060795, 2.162923, 1, 0, 0, 1, 1,
0.3971965, -0.7806941, 3.813573, 1, 0, 0, 1, 1,
0.4012031, -0.05386107, 1.810434, 1, 0, 0, 1, 1,
0.4013548, -0.983178, 5.334579, 1, 0, 0, 1, 1,
0.4016407, -0.2931072, 1.826287, 0, 0, 0, 1, 1,
0.4082898, 0.5516556, 1.330902, 0, 0, 0, 1, 1,
0.4146144, 1.723133, 0.964938, 0, 0, 0, 1, 1,
0.4229633, -1.440583, 3.072235, 0, 0, 0, 1, 1,
0.425238, 0.7267246, -0.034619, 0, 0, 0, 1, 1,
0.425703, -0.5331574, 2.774545, 0, 0, 0, 1, 1,
0.430215, 1.594641, 2.679404, 0, 0, 0, 1, 1,
0.4443067, -0.759339, 3.444293, 1, 1, 1, 1, 1,
0.4468917, -0.0886419, 3.134811, 1, 1, 1, 1, 1,
0.4478428, -1.415533, 2.511285, 1, 1, 1, 1, 1,
0.459213, 0.1978933, 2.127223, 1, 1, 1, 1, 1,
0.4601919, -1.201962, 2.433122, 1, 1, 1, 1, 1,
0.4622879, -1.328279, 2.039655, 1, 1, 1, 1, 1,
0.4742149, -0.003920326, 2.610021, 1, 1, 1, 1, 1,
0.4745808, -1.756231, 3.355153, 1, 1, 1, 1, 1,
0.476318, -0.4655538, 1.249341, 1, 1, 1, 1, 1,
0.4798943, -0.266461, 1.944716, 1, 1, 1, 1, 1,
0.4828313, -0.4474272, 3.569064, 1, 1, 1, 1, 1,
0.4831332, 2.043765, 0.9523119, 1, 1, 1, 1, 1,
0.4833872, 1.236066, -0.5985913, 1, 1, 1, 1, 1,
0.4854664, -0.2311626, 0.1198448, 1, 1, 1, 1, 1,
0.4875766, 0.6552652, 2.193294, 1, 1, 1, 1, 1,
0.4881042, 1.964233, -1.789806, 0, 0, 1, 1, 1,
0.488656, 1.704825, 0.7507137, 1, 0, 0, 1, 1,
0.4894074, -0.1313282, 0.8782524, 1, 0, 0, 1, 1,
0.5013654, -1.072787, 2.864981, 1, 0, 0, 1, 1,
0.5032053, -0.467707, 1.721442, 1, 0, 0, 1, 1,
0.5098931, -1.339648, 2.823618, 1, 0, 0, 1, 1,
0.5146308, 0.954631, 0.5884982, 0, 0, 0, 1, 1,
0.5179241, -0.7236712, 1.825878, 0, 0, 0, 1, 1,
0.51819, -0.8874066, 0.7547418, 0, 0, 0, 1, 1,
0.5188814, 0.2873635, 0.02713696, 0, 0, 0, 1, 1,
0.520743, 0.4586147, -0.1772483, 0, 0, 0, 1, 1,
0.5291535, -1.585269, 2.541194, 0, 0, 0, 1, 1,
0.5302791, 0.9262034, -0.6737258, 0, 0, 0, 1, 1,
0.5308426, 0.564346, -2.215746, 1, 1, 1, 1, 1,
0.5373732, 0.2229373, -0.5978863, 1, 1, 1, 1, 1,
0.5394365, 0.5516713, 0.1824635, 1, 1, 1, 1, 1,
0.5447374, -0.1863835, 2.628158, 1, 1, 1, 1, 1,
0.5448148, 0.8982852, -1.254577, 1, 1, 1, 1, 1,
0.5468514, -0.8078225, 3.071467, 1, 1, 1, 1, 1,
0.5538549, 0.8547342, -0.2172164, 1, 1, 1, 1, 1,
0.557018, -1.932281, 2.347107, 1, 1, 1, 1, 1,
0.5630118, 0.9189737, -1.310764, 1, 1, 1, 1, 1,
0.565736, 1.460915, -0.7289385, 1, 1, 1, 1, 1,
0.5682087, 0.043577, 1.1754, 1, 1, 1, 1, 1,
0.5687805, -0.6112352, 3.969831, 1, 1, 1, 1, 1,
0.5690566, 0.5948209, 1.268658, 1, 1, 1, 1, 1,
0.5718682, -1.083703, 2.393179, 1, 1, 1, 1, 1,
0.5722448, -1.538449, 1.529553, 1, 1, 1, 1, 1,
0.5758658, 1.410381, 0.6014591, 0, 0, 1, 1, 1,
0.5769515, -1.47719, 2.609314, 1, 0, 0, 1, 1,
0.5803745, -0.3619922, 2.377983, 1, 0, 0, 1, 1,
0.5816537, -1.385673, 1.310854, 1, 0, 0, 1, 1,
0.5905861, 0.1244289, 0.9336435, 1, 0, 0, 1, 1,
0.5913316, -0.1438169, 1.339612, 1, 0, 0, 1, 1,
0.5930267, -0.6307645, 4.384175, 0, 0, 0, 1, 1,
0.5961786, -2.498159, 0.0006024084, 0, 0, 0, 1, 1,
0.5976584, 0.8292626, -0.2717492, 0, 0, 0, 1, 1,
0.599526, 1.544082, -0.330735, 0, 0, 0, 1, 1,
0.5999501, -0.5382739, 1.449994, 0, 0, 0, 1, 1,
0.6008464, -2.343191, 3.322083, 0, 0, 0, 1, 1,
0.604073, 0.2930241, 2.134829, 0, 0, 0, 1, 1,
0.6077103, 0.7058118, -0.351335, 1, 1, 1, 1, 1,
0.6095347, 1.265043, 2.08949, 1, 1, 1, 1, 1,
0.616035, -0.5090813, 1.771215, 1, 1, 1, 1, 1,
0.6171342, -0.8591559, 2.425236, 1, 1, 1, 1, 1,
0.6174924, -0.6842687, 2.536755, 1, 1, 1, 1, 1,
0.6241787, 0.05670378, 2.39146, 1, 1, 1, 1, 1,
0.626617, -0.3481559, 3.424339, 1, 1, 1, 1, 1,
0.63111, 0.09851705, 2.243767, 1, 1, 1, 1, 1,
0.6325548, -0.3766754, 3.581554, 1, 1, 1, 1, 1,
0.6336488, 1.000563, 0.6314057, 1, 1, 1, 1, 1,
0.638191, 0.416967, 1.965546, 1, 1, 1, 1, 1,
0.6452668, 0.7850052, 3.404601, 1, 1, 1, 1, 1,
0.649555, 1.022597, 0.8611631, 1, 1, 1, 1, 1,
0.6526588, 0.09541776, 0.4078581, 1, 1, 1, 1, 1,
0.6536373, 1.647658, 1.120326, 1, 1, 1, 1, 1,
0.6550903, -0.05315451, 1.711695, 0, 0, 1, 1, 1,
0.6593482, 0.07247126, 1.691462, 1, 0, 0, 1, 1,
0.6595612, -1.693288, 3.730578, 1, 0, 0, 1, 1,
0.6596352, 0.2393999, 1.324983, 1, 0, 0, 1, 1,
0.6621541, 0.2509852, 1.736699, 1, 0, 0, 1, 1,
0.6643117, -1.072939, 2.1679, 1, 0, 0, 1, 1,
0.669631, -0.393609, 4.081902, 0, 0, 0, 1, 1,
0.6706465, -1.852567, 2.716825, 0, 0, 0, 1, 1,
0.671594, -0.5023817, 1.872058, 0, 0, 0, 1, 1,
0.6800175, 0.0901601, 0.3983401, 0, 0, 0, 1, 1,
0.6826036, -0.7194784, 3.802833, 0, 0, 0, 1, 1,
0.6889777, -0.651453, 3.723661, 0, 0, 0, 1, 1,
0.691455, 1.5473, 1.383993, 0, 0, 0, 1, 1,
0.6918548, 0.4492024, 2.028738, 1, 1, 1, 1, 1,
0.6949483, 1.576259, 1.951613, 1, 1, 1, 1, 1,
0.6956655, -1.271072, 2.31344, 1, 1, 1, 1, 1,
0.6991612, -1.185251, 1.239137, 1, 1, 1, 1, 1,
0.7075013, -0.6924072, 0.2254497, 1, 1, 1, 1, 1,
0.7105821, -0.2520547, 1.03163, 1, 1, 1, 1, 1,
0.7148111, -0.7449036, 1.479224, 1, 1, 1, 1, 1,
0.7173813, -0.7309034, 3.813943, 1, 1, 1, 1, 1,
0.7210733, -0.1057192, 2.418896, 1, 1, 1, 1, 1,
0.7249136, -0.2910627, 2.959005, 1, 1, 1, 1, 1,
0.7304452, -0.7269924, 3.847682, 1, 1, 1, 1, 1,
0.7340495, -0.5587263, 3.145926, 1, 1, 1, 1, 1,
0.7387013, -0.07913832, 2.289034, 1, 1, 1, 1, 1,
0.7459463, -0.5233223, 3.660535, 1, 1, 1, 1, 1,
0.7491826, -0.2502348, 0.6610739, 1, 1, 1, 1, 1,
0.750507, 0.4548656, 2.138616, 0, 0, 1, 1, 1,
0.7541099, 1.00013, -0.2857887, 1, 0, 0, 1, 1,
0.7557434, -1.317357, 2.222602, 1, 0, 0, 1, 1,
0.7583891, -0.06468427, 1.204475, 1, 0, 0, 1, 1,
0.7622046, 1.03745, 1.024727, 1, 0, 0, 1, 1,
0.7658943, 0.3824202, -0.4603168, 1, 0, 0, 1, 1,
0.7672732, 1.604338, 1.989791, 0, 0, 0, 1, 1,
0.7743245, 0.01970153, 0.3666515, 0, 0, 0, 1, 1,
0.7758133, 0.1191285, 2.310277, 0, 0, 0, 1, 1,
0.7799902, -0.3735648, 0.7702546, 0, 0, 0, 1, 1,
0.7809799, 1.200167, -1.250987, 0, 0, 0, 1, 1,
0.7891749, 1.823991, -0.7463707, 0, 0, 0, 1, 1,
0.7899345, 0.3226586, 1.422193, 0, 0, 0, 1, 1,
0.8009031, -0.1026636, 1.855216, 1, 1, 1, 1, 1,
0.8044443, 0.3402904, 1.968861, 1, 1, 1, 1, 1,
0.804915, 1.595325, 0.7922539, 1, 1, 1, 1, 1,
0.8074835, -0.8725911, 3.101585, 1, 1, 1, 1, 1,
0.8137257, -0.05924864, 1.292426, 1, 1, 1, 1, 1,
0.8191044, -0.1613221, 2.496193, 1, 1, 1, 1, 1,
0.8193815, 0.257986, 3.029391, 1, 1, 1, 1, 1,
0.8221646, 0.5168198, 0.3385597, 1, 1, 1, 1, 1,
0.8240165, -1.124637, 2.368521, 1, 1, 1, 1, 1,
0.8262267, 2.131614, 0.8835494, 1, 1, 1, 1, 1,
0.8272285, 0.1205634, 2.106539, 1, 1, 1, 1, 1,
0.8299794, -0.7844654, 2.384128, 1, 1, 1, 1, 1,
0.8308685, 1.097464, 0.5780647, 1, 1, 1, 1, 1,
0.8324778, -1.965948, 3.445455, 1, 1, 1, 1, 1,
0.8351992, 0.4344996, 1.592897, 1, 1, 1, 1, 1,
0.8395837, 0.4676678, 3.061257, 0, 0, 1, 1, 1,
0.8472213, -0.1059493, 0.1921751, 1, 0, 0, 1, 1,
0.8501204, -1.246587, 2.534342, 1, 0, 0, 1, 1,
0.8596088, 0.1781626, 3.415783, 1, 0, 0, 1, 1,
0.8681283, -1.38166, 2.749416, 1, 0, 0, 1, 1,
0.868573, -0.6142768, 3.730482, 1, 0, 0, 1, 1,
0.8788556, 1.433187, -0.3144263, 0, 0, 0, 1, 1,
0.8792149, -0.9331778, 1.282983, 0, 0, 0, 1, 1,
0.8879565, 0.09410686, 1.195262, 0, 0, 0, 1, 1,
0.8909545, -0.6680547, 3.55549, 0, 0, 0, 1, 1,
0.8940945, -1.492665, 1.542751, 0, 0, 0, 1, 1,
0.8967286, 0.5412862, 0.2487449, 0, 0, 0, 1, 1,
0.8971717, -0.1771826, 1.803789, 0, 0, 0, 1, 1,
0.9078184, 0.008711843, 0.3714269, 1, 1, 1, 1, 1,
0.9131877, 0.4976758, 0.2976021, 1, 1, 1, 1, 1,
0.9171882, -1.241796, 2.889755, 1, 1, 1, 1, 1,
0.9178777, 0.451739, 2.222573, 1, 1, 1, 1, 1,
0.9206647, 0.2437548, 0.3380237, 1, 1, 1, 1, 1,
0.921438, 0.6053979, -0.2689181, 1, 1, 1, 1, 1,
0.9249935, -1.478191, 1.580625, 1, 1, 1, 1, 1,
0.9298777, -0.7817685, 0.1910891, 1, 1, 1, 1, 1,
0.9305917, 0.8174238, 1.802594, 1, 1, 1, 1, 1,
0.9317386, 1.173175, -0.1186211, 1, 1, 1, 1, 1,
0.9520183, -1.136493, 4.104581, 1, 1, 1, 1, 1,
0.9733367, -0.6481972, 3.578635, 1, 1, 1, 1, 1,
0.9862828, 0.8182246, 0.1267825, 1, 1, 1, 1, 1,
0.9881887, 0.7717142, -1.373454, 1, 1, 1, 1, 1,
0.9894342, 0.05555386, 2.019241, 1, 1, 1, 1, 1,
0.9923395, 0.7984142, -0.1701771, 0, 0, 1, 1, 1,
0.9972395, 0.115121, 0.6485897, 1, 0, 0, 1, 1,
0.9989341, 1.618449, 1.428233, 1, 0, 0, 1, 1,
1.001238, 1.801021, -0.5369546, 1, 0, 0, 1, 1,
1.001763, -1.283562, 3.59292, 1, 0, 0, 1, 1,
1.005685, 0.4715061, 2.919704, 1, 0, 0, 1, 1,
1.005802, 1.123886, 0.6571855, 0, 0, 0, 1, 1,
1.009561, 0.6772845, 0.6632441, 0, 0, 0, 1, 1,
1.025745, -0.8363051, 2.310663, 0, 0, 0, 1, 1,
1.031525, 0.320821, 0.8271657, 0, 0, 0, 1, 1,
1.031539, 1.386636, 0.863405, 0, 0, 0, 1, 1,
1.035381, -1.67379, 2.457137, 0, 0, 0, 1, 1,
1.0377, 0.2934516, 3.334238, 0, 0, 0, 1, 1,
1.040421, -1.014295, 2.020166, 1, 1, 1, 1, 1,
1.041189, -1.2262, 1.458473, 1, 1, 1, 1, 1,
1.043867, -0.1412674, 0.6462989, 1, 1, 1, 1, 1,
1.048542, 0.437396, 1.559247, 1, 1, 1, 1, 1,
1.052117, -0.6240014, 2.784033, 1, 1, 1, 1, 1,
1.056841, -1.75367, 3.575693, 1, 1, 1, 1, 1,
1.059283, 0.6329138, -0.4400608, 1, 1, 1, 1, 1,
1.063013, 0.6777846, 1.297854, 1, 1, 1, 1, 1,
1.066461, 1.192773, 0.5565823, 1, 1, 1, 1, 1,
1.075184, -1.172677, 1.933751, 1, 1, 1, 1, 1,
1.081835, -0.7022961, 3.411536, 1, 1, 1, 1, 1,
1.084085, 0.6592107, 0.1705067, 1, 1, 1, 1, 1,
1.093164, -0.5322171, 1.420359, 1, 1, 1, 1, 1,
1.094579, 1.265283, 0.5514961, 1, 1, 1, 1, 1,
1.095297, -0.416539, 4.127869, 1, 1, 1, 1, 1,
1.099431, -0.07809439, 0.7809796, 0, 0, 1, 1, 1,
1.104758, 0.1758338, 0.142849, 1, 0, 0, 1, 1,
1.106833, 2.910415, 1.764048, 1, 0, 0, 1, 1,
1.113982, 0.168571, 1.790866, 1, 0, 0, 1, 1,
1.12214, -0.01300191, 1.446303, 1, 0, 0, 1, 1,
1.122683, -0.7999992, 1.366261, 1, 0, 0, 1, 1,
1.128677, -0.4168162, 2.773707, 0, 0, 0, 1, 1,
1.137356, -0.1830641, 1.325769, 0, 0, 0, 1, 1,
1.142041, -2.155182, 2.622878, 0, 0, 0, 1, 1,
1.144875, 2.302317, 0.6450285, 0, 0, 0, 1, 1,
1.146713, -0.2173908, 1.531003, 0, 0, 0, 1, 1,
1.147179, 0.2610962, 1.339851, 0, 0, 0, 1, 1,
1.151081, 0.06530213, 2.50599, 0, 0, 0, 1, 1,
1.152309, 1.426227, 0.5342291, 1, 1, 1, 1, 1,
1.158223, 0.2084379, 1.697508, 1, 1, 1, 1, 1,
1.168269, -0.1074672, 0.4457508, 1, 1, 1, 1, 1,
1.171515, 1.37408, 0.4642377, 1, 1, 1, 1, 1,
1.174395, 0.06680589, 1.890266, 1, 1, 1, 1, 1,
1.178503, 1.427062, 0.9446566, 1, 1, 1, 1, 1,
1.180577, -0.3418694, 2.192275, 1, 1, 1, 1, 1,
1.182996, -0.1466586, 1.535825, 1, 1, 1, 1, 1,
1.20995, 0.9580199, 0.9390481, 1, 1, 1, 1, 1,
1.213831, -0.1333076, 1.328116, 1, 1, 1, 1, 1,
1.214388, 1.300862, -0.2861324, 1, 1, 1, 1, 1,
1.21773, 0.6290885, 2.315649, 1, 1, 1, 1, 1,
1.227543, -1.325086, 0.9232144, 1, 1, 1, 1, 1,
1.236368, -0.1782572, 1.640552, 1, 1, 1, 1, 1,
1.243408, -0.8606006, 1.638572, 1, 1, 1, 1, 1,
1.247653, 0.4451545, 1.975542, 0, 0, 1, 1, 1,
1.27153, 0.762466, 2.039682, 1, 0, 0, 1, 1,
1.272988, 0.8194655, 1.229954, 1, 0, 0, 1, 1,
1.273112, 0.3433004, 1.119821, 1, 0, 0, 1, 1,
1.286042, -0.3470213, 1.996377, 1, 0, 0, 1, 1,
1.2875, -0.9716753, 1.76417, 1, 0, 0, 1, 1,
1.292326, -0.7273557, 2.878172, 0, 0, 0, 1, 1,
1.297817, -1.465156, 1.391243, 0, 0, 0, 1, 1,
1.303012, -0.1752859, 0.1376339, 0, 0, 0, 1, 1,
1.30404, 1.359826, 1.836256, 0, 0, 0, 1, 1,
1.309954, 0.9306026, -0.7966097, 0, 0, 0, 1, 1,
1.310816, -0.585526, 0.1230937, 0, 0, 0, 1, 1,
1.314467, 0.4999822, -0.5057144, 0, 0, 0, 1, 1,
1.317868, 0.2335487, 0.6360239, 1, 1, 1, 1, 1,
1.322888, -0.01320855, 2.047065, 1, 1, 1, 1, 1,
1.326165, -1.834502, 2.616544, 1, 1, 1, 1, 1,
1.330862, -0.3122706, 1.421938, 1, 1, 1, 1, 1,
1.334729, -0.6813645, -0.5496296, 1, 1, 1, 1, 1,
1.335621, 0.3925893, 1.451297, 1, 1, 1, 1, 1,
1.351551, -0.6582909, 2.82533, 1, 1, 1, 1, 1,
1.360002, 0.468829, 0.5253776, 1, 1, 1, 1, 1,
1.361592, -1.753325, 0.6187146, 1, 1, 1, 1, 1,
1.374533, -0.4381824, 2.711437, 1, 1, 1, 1, 1,
1.379716, 0.8683693, 2.047414, 1, 1, 1, 1, 1,
1.381929, 0.8664077, -0.4149055, 1, 1, 1, 1, 1,
1.386524, 0.1317342, 0.9928601, 1, 1, 1, 1, 1,
1.393596, -0.1044912, 2.784357, 1, 1, 1, 1, 1,
1.393842, -0.4694803, 2.79205, 1, 1, 1, 1, 1,
1.405903, 0.8275026, 1.236645, 0, 0, 1, 1, 1,
1.406024, 0.6640245, 1.947746, 1, 0, 0, 1, 1,
1.410612, -0.3076501, 2.225621, 1, 0, 0, 1, 1,
1.412074, -0.8704788, 2.661648, 1, 0, 0, 1, 1,
1.41329, 1.360584, -1.081223, 1, 0, 0, 1, 1,
1.426476, 0.4090742, 0.8563843, 1, 0, 0, 1, 1,
1.427109, 0.3334617, 2.259566, 0, 0, 0, 1, 1,
1.431167, 1.208984, -0.06880746, 0, 0, 0, 1, 1,
1.432323, -0.3214043, 1.592804, 0, 0, 0, 1, 1,
1.433959, 2.156336, 0.8263422, 0, 0, 0, 1, 1,
1.439188, 0.08942714, 1.013378, 0, 0, 0, 1, 1,
1.440513, 0.5407062, 0.6807626, 0, 0, 0, 1, 1,
1.459852, 0.792608, 2.24885, 0, 0, 0, 1, 1,
1.464204, -0.8397704, 1.323514, 1, 1, 1, 1, 1,
1.467562, -2.104335, 2.483891, 1, 1, 1, 1, 1,
1.469911, 0.668288, 1.152095, 1, 1, 1, 1, 1,
1.469935, 0.8435081, 1.347661, 1, 1, 1, 1, 1,
1.474789, -1.824395, 3.798696, 1, 1, 1, 1, 1,
1.479104, -0.09417162, 2.566827, 1, 1, 1, 1, 1,
1.479934, -0.8535067, 4.108882, 1, 1, 1, 1, 1,
1.480246, 1.487986, 3.267773, 1, 1, 1, 1, 1,
1.502539, -0.2604507, 2.421972, 1, 1, 1, 1, 1,
1.50404, 0.2910404, 0.7900955, 1, 1, 1, 1, 1,
1.504637, 0.130033, 0.2477484, 1, 1, 1, 1, 1,
1.519222, -0.3461646, 0.02501836, 1, 1, 1, 1, 1,
1.524862, -0.9874877, -1.230031, 1, 1, 1, 1, 1,
1.526134, 0.3644505, -0.747883, 1, 1, 1, 1, 1,
1.527914, 0.05771356, 0.7846565, 1, 1, 1, 1, 1,
1.53128, -1.210167, 0.8596125, 0, 0, 1, 1, 1,
1.53484, -1.084619, 1.707243, 1, 0, 0, 1, 1,
1.541755, 0.07570421, 2.796154, 1, 0, 0, 1, 1,
1.54397, 0.4590384, 2.233971, 1, 0, 0, 1, 1,
1.549035, 0.5288402, 0.1162328, 1, 0, 0, 1, 1,
1.549803, 0.4850986, 2.845623, 1, 0, 0, 1, 1,
1.556494, -0.8215983, 1.27467, 0, 0, 0, 1, 1,
1.560699, -0.4725726, 0.804378, 0, 0, 0, 1, 1,
1.561083, 0.2693188, 0.2236924, 0, 0, 0, 1, 1,
1.565571, 1.315853, 2.160814, 0, 0, 0, 1, 1,
1.574311, 0.6384734, 2.657671, 0, 0, 0, 1, 1,
1.577213, 0.2650914, 3.080765, 0, 0, 0, 1, 1,
1.584435, 2.088812, -1.218065, 0, 0, 0, 1, 1,
1.590804, -0.6648923, 3.77684, 1, 1, 1, 1, 1,
1.596506, -2.026142, 2.635498, 1, 1, 1, 1, 1,
1.602501, 0.9381832, 1.132976, 1, 1, 1, 1, 1,
1.607362, -0.5124364, 1.995653, 1, 1, 1, 1, 1,
1.610143, -1.435083, 2.892098, 1, 1, 1, 1, 1,
1.610715, 0.6551229, 0.4181333, 1, 1, 1, 1, 1,
1.613091, 0.4322913, 0.8127963, 1, 1, 1, 1, 1,
1.61712, -1.778147, 4.028307, 1, 1, 1, 1, 1,
1.638354, 0.02298797, 2.080793, 1, 1, 1, 1, 1,
1.640081, -0.2011265, 1.642496, 1, 1, 1, 1, 1,
1.65467, -0.3398677, 1.253618, 1, 1, 1, 1, 1,
1.682199, 1.217538, 1.144078, 1, 1, 1, 1, 1,
1.682852, -0.2818967, 1.671275, 1, 1, 1, 1, 1,
1.686597, -0.7169752, 3.101755, 1, 1, 1, 1, 1,
1.687709, -2.038599, 3.110739, 1, 1, 1, 1, 1,
1.702078, 0.7120231, 1.100552, 0, 0, 1, 1, 1,
1.706862, -3.250008, 2.733253, 1, 0, 0, 1, 1,
1.708751, 0.53712, 1.473698, 1, 0, 0, 1, 1,
1.719471, -0.1291096, 0.497197, 1, 0, 0, 1, 1,
1.719714, -0.05114821, 3.122343, 1, 0, 0, 1, 1,
1.726323, 0.3888134, -0.5664432, 1, 0, 0, 1, 1,
1.730236, 0.7035524, 1.894112, 0, 0, 0, 1, 1,
1.731338, -0.4148459, 0.9082443, 0, 0, 0, 1, 1,
1.748443, -1.618756, 1.603454, 0, 0, 0, 1, 1,
1.754042, -0.1301903, 0.4582405, 0, 0, 0, 1, 1,
1.767401, 0.559743, 0.1113397, 0, 0, 0, 1, 1,
1.775807, 1.196191, -0.9736778, 0, 0, 0, 1, 1,
1.789324, -1.02281, 1.047881, 0, 0, 0, 1, 1,
1.794248, -0.08846461, 0.07671244, 1, 1, 1, 1, 1,
1.80449, -1.878152, 2.218855, 1, 1, 1, 1, 1,
1.815972, -0.6695078, 0.1865444, 1, 1, 1, 1, 1,
1.848198, 1.249567, 0.400515, 1, 1, 1, 1, 1,
1.86996, 1.689979, -1.059755, 1, 1, 1, 1, 1,
1.875466, -0.7327386, 2.15138, 1, 1, 1, 1, 1,
1.876015, 1.013539, 0.5416514, 1, 1, 1, 1, 1,
1.891754, 0.8049572, -0.5957041, 1, 1, 1, 1, 1,
1.897713, 0.1572636, 0.9660241, 1, 1, 1, 1, 1,
1.916813, 0.7851279, 2.307446, 1, 1, 1, 1, 1,
1.920303, 0.3623255, 1.629745, 1, 1, 1, 1, 1,
1.932629, 0.1774832, 3.931489, 1, 1, 1, 1, 1,
1.964838, -0.580982, 3.558887, 1, 1, 1, 1, 1,
1.967653, -1.325672, 0.9561073, 1, 1, 1, 1, 1,
1.989739, -0.1017962, -1.10564, 1, 1, 1, 1, 1,
2.009391, -0.005527489, 2.540105, 0, 0, 1, 1, 1,
2.039797, 0.2118385, 2.693769, 1, 0, 0, 1, 1,
2.042159, 2.395016, -0.8652604, 1, 0, 0, 1, 1,
2.058488, 0.7403377, 0.03240018, 1, 0, 0, 1, 1,
2.059278, -0.05110797, 2.515534, 1, 0, 0, 1, 1,
2.070895, 1.316774, 1.160479, 1, 0, 0, 1, 1,
2.081494, 1.071699, 0.07473404, 0, 0, 0, 1, 1,
2.120979, 0.5629604, 0.6289561, 0, 0, 0, 1, 1,
2.122386, -1.829691, 3.637519, 0, 0, 0, 1, 1,
2.210013, -0.6191028, 2.903579, 0, 0, 0, 1, 1,
2.210279, 0.04677547, 2.15723, 0, 0, 0, 1, 1,
2.233486, -0.2564535, 2.808108, 0, 0, 0, 1, 1,
2.265598, 0.6235185, 0.1804396, 0, 0, 0, 1, 1,
2.305793, -0.140878, 1.57744, 1, 1, 1, 1, 1,
2.337697, -1.295339, 0.6150228, 1, 1, 1, 1, 1,
2.3978, -0.5569357, 0.9600144, 1, 1, 1, 1, 1,
2.546628, 1.680881, 2.193284, 1, 1, 1, 1, 1,
2.622991, -0.06693686, 0.5652593, 1, 1, 1, 1, 1,
2.948591, -1.108753, 2.222615, 1, 1, 1, 1, 1,
2.977753, -1.928066, 2.609934, 1, 1, 1, 1, 1
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
var radius = 9.419705;
var distance = 33.08631;
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
mvMatrix.translate( 0.143442, 0.1497407, -0.04690552 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.08631);
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