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
-3.373967, -0.1857188, -3.418756, 1, 0, 0, 1,
-2.881888, -0.2267034, -1.656353, 1, 0.007843138, 0, 1,
-2.741585, 1.274764, -0.1120184, 1, 0.01176471, 0, 1,
-2.444286, 0.7062505, -0.5613331, 1, 0.01960784, 0, 1,
-2.423181, 0.5382085, -1.162951, 1, 0.02352941, 0, 1,
-2.386582, -0.2637656, -1.68863, 1, 0.03137255, 0, 1,
-2.364304, 0.4733309, 0.3636998, 1, 0.03529412, 0, 1,
-2.335758, -0.8299214, 0.1931209, 1, 0.04313726, 0, 1,
-2.264449, 1.530075, -0.8710979, 1, 0.04705882, 0, 1,
-2.245239, -1.31929, -2.066913, 1, 0.05490196, 0, 1,
-2.237213, 0.1741882, -0.5884239, 1, 0.05882353, 0, 1,
-2.224461, -0.0988123, -1.734986, 1, 0.06666667, 0, 1,
-2.208158, 0.4473774, -1.183141, 1, 0.07058824, 0, 1,
-2.205246, 0.6314632, -0.8023376, 1, 0.07843138, 0, 1,
-2.20167, 0.6518365, -2.384692, 1, 0.08235294, 0, 1,
-2.162167, -0.7829415, -1.486765, 1, 0.09019608, 0, 1,
-2.146542, -0.7139519, -1.167706, 1, 0.09411765, 0, 1,
-2.138558, -0.6468717, -2.131887, 1, 0.1019608, 0, 1,
-2.122271, -0.4777069, -1.666701, 1, 0.1098039, 0, 1,
-2.113115, -0.781701, -2.994802, 1, 0.1137255, 0, 1,
-2.104922, -1.327785, -1.10828, 1, 0.1215686, 0, 1,
-2.104307, 0.09021018, -0.4081545, 1, 0.1254902, 0, 1,
-2.098053, 0.9526671, -3.134423, 1, 0.1333333, 0, 1,
-2.085979, 2.006285, -2.253595, 1, 0.1372549, 0, 1,
-2.07882, 1.733117, -0.627101, 1, 0.145098, 0, 1,
-2.064212, -0.8919297, -1.948366, 1, 0.1490196, 0, 1,
-2.062368, -1.515918, -4.097471, 1, 0.1568628, 0, 1,
-2.059202, -0.861569, -1.954787, 1, 0.1607843, 0, 1,
-2.008575, -0.8788395, -3.560929, 1, 0.1686275, 0, 1,
-2.005428, -1.631258, -4.166593, 1, 0.172549, 0, 1,
-2.004856, -0.5308052, -2.288144, 1, 0.1803922, 0, 1,
-1.972387, -1.042733, -2.996486, 1, 0.1843137, 0, 1,
-1.960954, 0.436778, 0.01704233, 1, 0.1921569, 0, 1,
-1.930912, -0.1335434, -0.1901615, 1, 0.1960784, 0, 1,
-1.920597, -1.580535, -1.19404, 1, 0.2039216, 0, 1,
-1.920525, -2.370148, -2.69212, 1, 0.2117647, 0, 1,
-1.918227, -1.407096, -1.149801, 1, 0.2156863, 0, 1,
-1.912719, 0.9872253, -2.211682, 1, 0.2235294, 0, 1,
-1.88951, 1.677055, 0.1457998, 1, 0.227451, 0, 1,
-1.871617, -1.206492, -1.137592, 1, 0.2352941, 0, 1,
-1.866872, 1.217513, -2.839337, 1, 0.2392157, 0, 1,
-1.861866, -0.3466975, 0.6485289, 1, 0.2470588, 0, 1,
-1.855537, 0.8377759, -1.545666, 1, 0.2509804, 0, 1,
-1.839699, -0.9382964, -1.206038, 1, 0.2588235, 0, 1,
-1.816166, -1.616184, -2.489636, 1, 0.2627451, 0, 1,
-1.814987, -0.414889, -2.65378, 1, 0.2705882, 0, 1,
-1.813395, 0.5919228, -0.9248187, 1, 0.2745098, 0, 1,
-1.808631, -1.372444, -1.471884, 1, 0.282353, 0, 1,
-1.785783, 1.037987, -2.513886, 1, 0.2862745, 0, 1,
-1.781768, 1.401739, -0.4173883, 1, 0.2941177, 0, 1,
-1.770842, 0.02999114, -0.5217846, 1, 0.3019608, 0, 1,
-1.764897, 1.013756, -0.1638342, 1, 0.3058824, 0, 1,
-1.738423, 1.471649, -1.253676, 1, 0.3137255, 0, 1,
-1.730741, 0.02888372, -3.547078, 1, 0.3176471, 0, 1,
-1.718547, 0.3791618, 0.1121811, 1, 0.3254902, 0, 1,
-1.713137, -0.3838175, -1.149943, 1, 0.3294118, 0, 1,
-1.71057, 0.5545934, 0.6877854, 1, 0.3372549, 0, 1,
-1.702547, 1.902917, -1.429875, 1, 0.3411765, 0, 1,
-1.701999, -0.4824677, -1.615129, 1, 0.3490196, 0, 1,
-1.697192, -1.466397, -0.7950947, 1, 0.3529412, 0, 1,
-1.694613, 0.2628491, -3.511835, 1, 0.3607843, 0, 1,
-1.687358, 0.662118, -0.3028979, 1, 0.3647059, 0, 1,
-1.687215, 0.7690312, -2.055367, 1, 0.372549, 0, 1,
-1.680023, 0.1663997, -2.301938, 1, 0.3764706, 0, 1,
-1.673177, -0.4268842, -1.321895, 1, 0.3843137, 0, 1,
-1.671978, -0.5894477, 0.6480221, 1, 0.3882353, 0, 1,
-1.670623, 0.1729721, -1.374995, 1, 0.3960784, 0, 1,
-1.664185, -1.173023, -1.420103, 1, 0.4039216, 0, 1,
-1.656046, -1.266789, -1.680559, 1, 0.4078431, 0, 1,
-1.653761, 1.164799, -2.04491, 1, 0.4156863, 0, 1,
-1.644105, -0.4071116, -2.606418, 1, 0.4196078, 0, 1,
-1.639901, -1.177881, -1.89587, 1, 0.427451, 0, 1,
-1.62622, -0.9904506, -2.756642, 1, 0.4313726, 0, 1,
-1.612315, -0.1429259, -0.1391043, 1, 0.4392157, 0, 1,
-1.601331, -1.799619, -2.235, 1, 0.4431373, 0, 1,
-1.601292, 0.2716222, -1.79901, 1, 0.4509804, 0, 1,
-1.596833, 0.9687541, -2.345211, 1, 0.454902, 0, 1,
-1.591483, 1.445139, -0.8540128, 1, 0.4627451, 0, 1,
-1.586757, 0.7309737, -1.194338, 1, 0.4666667, 0, 1,
-1.585779, 0.01911569, -2.369129, 1, 0.4745098, 0, 1,
-1.582316, 0.4082194, -2.02236, 1, 0.4784314, 0, 1,
-1.577388, 1.243575, -0.9170027, 1, 0.4862745, 0, 1,
-1.570807, 0.1854063, -1.656116, 1, 0.4901961, 0, 1,
-1.558037, 1.071367, -0.9831215, 1, 0.4980392, 0, 1,
-1.557976, -1.342684, -2.500563, 1, 0.5058824, 0, 1,
-1.550271, -0.5618217, -1.630324, 1, 0.509804, 0, 1,
-1.54283, -0.2049757, -0.6194124, 1, 0.5176471, 0, 1,
-1.531305, 1.028603, -1.47007, 1, 0.5215687, 0, 1,
-1.525495, -1.087716, 0.2058516, 1, 0.5294118, 0, 1,
-1.524494, -0.7209716, -2.223904, 1, 0.5333334, 0, 1,
-1.523519, 0.4961307, -0.9139368, 1, 0.5411765, 0, 1,
-1.509639, -1.245991, -3.445676, 1, 0.5450981, 0, 1,
-1.502767, -0.4756952, -1.159335, 1, 0.5529412, 0, 1,
-1.5017, 0.03756416, 0.09947557, 1, 0.5568628, 0, 1,
-1.494986, 1.294118, -0.1053339, 1, 0.5647059, 0, 1,
-1.490615, 0.1254478, -2.065127, 1, 0.5686275, 0, 1,
-1.476953, -0.9187821, -2.378064, 1, 0.5764706, 0, 1,
-1.474613, 0.9031778, 1.236277, 1, 0.5803922, 0, 1,
-1.474401, 0.4337412, -4.220908, 1, 0.5882353, 0, 1,
-1.47228, 0.3554107, 0.609949, 1, 0.5921569, 0, 1,
-1.462909, -0.9347711, -2.185806, 1, 0.6, 0, 1,
-1.461554, 1.938598, -0.513659, 1, 0.6078432, 0, 1,
-1.448503, 0.2177896, -0.9970978, 1, 0.6117647, 0, 1,
-1.438611, 0.791366, -1.917226, 1, 0.6196079, 0, 1,
-1.419333, -2.007909, -2.3957, 1, 0.6235294, 0, 1,
-1.417457, -0.4437231, -0.8840442, 1, 0.6313726, 0, 1,
-1.397058, 0.04310855, -2.954339, 1, 0.6352941, 0, 1,
-1.385797, -0.1690349, -2.984285, 1, 0.6431373, 0, 1,
-1.375447, -0.2624974, -2.183553, 1, 0.6470588, 0, 1,
-1.369449, -1.064638, -3.597698, 1, 0.654902, 0, 1,
-1.3679, -0.8109505, -3.181107, 1, 0.6588235, 0, 1,
-1.367385, -0.1018058, -0.6948795, 1, 0.6666667, 0, 1,
-1.364834, -0.3836524, -1.510899, 1, 0.6705883, 0, 1,
-1.352927, -0.8729934, -3.533857, 1, 0.6784314, 0, 1,
-1.344225, -0.9379966, -2.768755, 1, 0.682353, 0, 1,
-1.341854, 0.404207, -1.948031, 1, 0.6901961, 0, 1,
-1.331959, -0.7633079, -0.5708876, 1, 0.6941177, 0, 1,
-1.300983, -2.437075, -2.594728, 1, 0.7019608, 0, 1,
-1.296955, -0.01380122, -2.206711, 1, 0.7098039, 0, 1,
-1.290829, -1.190823, -1.337416, 1, 0.7137255, 0, 1,
-1.287759, -0.001931238, -2.519165, 1, 0.7215686, 0, 1,
-1.286807, -2.750916, -1.865269, 1, 0.7254902, 0, 1,
-1.28599, -0.04395072, -1.11677, 1, 0.7333333, 0, 1,
-1.280401, -2.592706, -1.528535, 1, 0.7372549, 0, 1,
-1.279811, -0.2045139, -2.210505, 1, 0.7450981, 0, 1,
-1.278986, -3.422156, -3.500473, 1, 0.7490196, 0, 1,
-1.277371, -0.07307737, -0.9537517, 1, 0.7568628, 0, 1,
-1.276792, 1.570117, -1.721855, 1, 0.7607843, 0, 1,
-1.27348, 0.4972624, -0.1239977, 1, 0.7686275, 0, 1,
-1.263703, 2.025058, -1.389224, 1, 0.772549, 0, 1,
-1.260636, 0.4714605, -1.060697, 1, 0.7803922, 0, 1,
-1.256089, -0.6026939, -2.296697, 1, 0.7843137, 0, 1,
-1.253551, -0.4016048, -1.940842, 1, 0.7921569, 0, 1,
-1.249506, 1.112131, -1.336375, 1, 0.7960784, 0, 1,
-1.242084, -1.081649, -2.372367, 1, 0.8039216, 0, 1,
-1.237273, -0.05083908, -3.376504, 1, 0.8117647, 0, 1,
-1.218939, 0.1489061, -0.5263216, 1, 0.8156863, 0, 1,
-1.214564, 1.340206, -1.433646, 1, 0.8235294, 0, 1,
-1.199188, -0.988457, -2.495273, 1, 0.827451, 0, 1,
-1.177876, -0.2315533, -1.702424, 1, 0.8352941, 0, 1,
-1.166369, 0.08824379, -0.1673262, 1, 0.8392157, 0, 1,
-1.159803, 1.894315, 0.4441164, 1, 0.8470588, 0, 1,
-1.144259, 0.7941768, -1.925797, 1, 0.8509804, 0, 1,
-1.139862, 0.3759937, -0.6841571, 1, 0.8588235, 0, 1,
-1.137246, -0.5462325, -3.803114, 1, 0.8627451, 0, 1,
-1.132686, -0.9617314, -3.389639, 1, 0.8705882, 0, 1,
-1.128022, -0.003125385, -2.469653, 1, 0.8745098, 0, 1,
-1.123477, 1.094105, -0.3457592, 1, 0.8823529, 0, 1,
-1.121224, 1.0904, -1.461991, 1, 0.8862745, 0, 1,
-1.114476, 0.7485696, -2.275476, 1, 0.8941177, 0, 1,
-1.112216, 0.8404211, -0.7601827, 1, 0.8980392, 0, 1,
-1.11009, 0.2265543, -1.593889, 1, 0.9058824, 0, 1,
-1.092617, 0.6890409, -0.8482015, 1, 0.9137255, 0, 1,
-1.088424, -1.051593, -2.658429, 1, 0.9176471, 0, 1,
-1.086691, 0.9301211, -2.437807, 1, 0.9254902, 0, 1,
-1.070454, -0.8914379, -0.5827134, 1, 0.9294118, 0, 1,
-1.054209, 0.5073298, -0.2504568, 1, 0.9372549, 0, 1,
-1.054062, -1.679163, -2.301382, 1, 0.9411765, 0, 1,
-1.053651, 0.6339008, -0.4902885, 1, 0.9490196, 0, 1,
-1.045943, -0.3474783, -2.373577, 1, 0.9529412, 0, 1,
-1.045516, -0.3498514, -1.881337, 1, 0.9607843, 0, 1,
-1.043009, -0.2918207, -1.717378, 1, 0.9647059, 0, 1,
-1.041395, -1.371308, -1.88797, 1, 0.972549, 0, 1,
-1.036294, 0.05900098, -1.054709, 1, 0.9764706, 0, 1,
-1.030025, 0.138854, -0.5438902, 1, 0.9843137, 0, 1,
-1.024682, -0.6380463, -1.083469, 1, 0.9882353, 0, 1,
-1.011006, -0.3821197, -3.116391, 1, 0.9960784, 0, 1,
-1.007935, -0.9313956, -1.417466, 0.9960784, 1, 0, 1,
-1.00425, 0.7527021, -0.3342634, 0.9921569, 1, 0, 1,
-1.003449, -0.02980234, -2.826924, 0.9843137, 1, 0, 1,
-1.001194, 0.4968864, -1.125312, 0.9803922, 1, 0, 1,
-0.9991927, 1.144127, 1.753366, 0.972549, 1, 0, 1,
-0.9947658, 0.3605865, -1.441749, 0.9686275, 1, 0, 1,
-0.9911748, 1.226698, -1.180164, 0.9607843, 1, 0, 1,
-0.9909161, -0.3535397, -2.39883, 0.9568627, 1, 0, 1,
-0.988805, -0.3634801, -2.61498, 0.9490196, 1, 0, 1,
-0.986186, -0.3957539, -3.011758, 0.945098, 1, 0, 1,
-0.9689048, 0.8338922, 0.1276775, 0.9372549, 1, 0, 1,
-0.96678, -0.7984039, -2.016198, 0.9333333, 1, 0, 1,
-0.9608276, -0.1470972, -1.995008, 0.9254902, 1, 0, 1,
-0.9573579, -1.112912, -2.5597, 0.9215686, 1, 0, 1,
-0.9501113, -0.8596357, -1.177904, 0.9137255, 1, 0, 1,
-0.9481229, -0.1486588, -0.8762981, 0.9098039, 1, 0, 1,
-0.9424165, 1.545041, -0.6602523, 0.9019608, 1, 0, 1,
-0.9418508, 1.253076, 0.3191025, 0.8941177, 1, 0, 1,
-0.9395748, -0.1585665, -0.04045648, 0.8901961, 1, 0, 1,
-0.9309835, -1.088723, -3.077167, 0.8823529, 1, 0, 1,
-0.9307249, 0.7240131, -3.2249, 0.8784314, 1, 0, 1,
-0.9270202, -0.1465492, 0.1741795, 0.8705882, 1, 0, 1,
-0.9129351, 1.63529, -0.7339256, 0.8666667, 1, 0, 1,
-0.9124555, 0.477803, -0.01988498, 0.8588235, 1, 0, 1,
-0.9040328, 0.4443798, -0.3192083, 0.854902, 1, 0, 1,
-0.9034225, -0.2378018, -1.406514, 0.8470588, 1, 0, 1,
-0.9027131, -2.266354, -3.085505, 0.8431373, 1, 0, 1,
-0.8839068, 0.4458402, -0.6821359, 0.8352941, 1, 0, 1,
-0.8758137, -0.7030991, -2.655697, 0.8313726, 1, 0, 1,
-0.8661485, -0.2681197, -0.1485303, 0.8235294, 1, 0, 1,
-0.8630124, -1.191071, -2.013336, 0.8196079, 1, 0, 1,
-0.8594698, 1.725583, 0.1109809, 0.8117647, 1, 0, 1,
-0.8502494, 0.4520451, -1.314607, 0.8078431, 1, 0, 1,
-0.844336, -0.2105931, -2.076144, 0.8, 1, 0, 1,
-0.8418761, -0.1403487, -2.031816, 0.7921569, 1, 0, 1,
-0.8415642, 0.3214817, -0.7916189, 0.7882353, 1, 0, 1,
-0.8364536, -0.6259674, -3.452802, 0.7803922, 1, 0, 1,
-0.8294994, -1.227387, -3.553545, 0.7764706, 1, 0, 1,
-0.8287542, 0.1901504, -1.202807, 0.7686275, 1, 0, 1,
-0.8170874, -0.9430503, -1.428818, 0.7647059, 1, 0, 1,
-0.8162414, -0.9354088, -3.592958, 0.7568628, 1, 0, 1,
-0.812319, -1.394265, -2.851183, 0.7529412, 1, 0, 1,
-0.8089674, 0.06595395, -2.965801, 0.7450981, 1, 0, 1,
-0.8023239, 0.9681253, -0.8177553, 0.7411765, 1, 0, 1,
-0.8022458, 0.3163723, -0.8384169, 0.7333333, 1, 0, 1,
-0.8012966, -1.849894, -2.991256, 0.7294118, 1, 0, 1,
-0.7977362, 0.5460048, -2.079147, 0.7215686, 1, 0, 1,
-0.7874513, 1.490246, -0.4715167, 0.7176471, 1, 0, 1,
-0.7862866, 0.4385116, -1.06502, 0.7098039, 1, 0, 1,
-0.7861005, -0.5461397, -0.471303, 0.7058824, 1, 0, 1,
-0.7824808, -1.070584, -1.554786, 0.6980392, 1, 0, 1,
-0.7792524, -0.9497057, -3.221037, 0.6901961, 1, 0, 1,
-0.7739319, -0.03731329, -2.318803, 0.6862745, 1, 0, 1,
-0.7711366, 1.336176, 1.308985, 0.6784314, 1, 0, 1,
-0.7658771, 3.415211, -0.08889209, 0.6745098, 1, 0, 1,
-0.7610608, 0.315787, -0.5990798, 0.6666667, 1, 0, 1,
-0.7584488, -0.7840173, -2.846089, 0.6627451, 1, 0, 1,
-0.7581847, -2.483513, -0.549736, 0.654902, 1, 0, 1,
-0.7552203, 0.2685501, -1.173822, 0.6509804, 1, 0, 1,
-0.7534186, -0.9533271, -1.950426, 0.6431373, 1, 0, 1,
-0.7530125, -2.137338, -1.577016, 0.6392157, 1, 0, 1,
-0.7463233, 0.2964141, 0.1123917, 0.6313726, 1, 0, 1,
-0.7453805, -1.348238, -2.613108, 0.627451, 1, 0, 1,
-0.7449896, -1.657702, -2.217017, 0.6196079, 1, 0, 1,
-0.7373003, -0.4537874, -2.878211, 0.6156863, 1, 0, 1,
-0.7369128, 0.8302742, 0.2795911, 0.6078432, 1, 0, 1,
-0.7351657, -1.839927, -2.296824, 0.6039216, 1, 0, 1,
-0.7339397, 1.38256, -3.095202, 0.5960785, 1, 0, 1,
-0.7338618, 0.2741901, -2.014023, 0.5882353, 1, 0, 1,
-0.7282813, -0.254371, -2.180722, 0.5843138, 1, 0, 1,
-0.7265502, 0.3983846, -1.132564, 0.5764706, 1, 0, 1,
-0.72644, -0.7417048, -2.67, 0.572549, 1, 0, 1,
-0.7244163, 0.2732399, -0.04280052, 0.5647059, 1, 0, 1,
-0.7224657, 0.2628372, -1.346543, 0.5607843, 1, 0, 1,
-0.7214423, 1.563921, 0.3291101, 0.5529412, 1, 0, 1,
-0.7161996, 1.552085, -0.117815, 0.5490196, 1, 0, 1,
-0.7159789, -0.6931681, -2.302176, 0.5411765, 1, 0, 1,
-0.713315, -2.127614, -2.438408, 0.5372549, 1, 0, 1,
-0.7119058, 0.2495698, -0.7287349, 0.5294118, 1, 0, 1,
-0.7089635, 0.1881072, -1.324252, 0.5254902, 1, 0, 1,
-0.7067068, -0.604904, 0.0406533, 0.5176471, 1, 0, 1,
-0.7050759, -0.9415118, -1.247087, 0.5137255, 1, 0, 1,
-0.698046, -0.12979, -3.336938, 0.5058824, 1, 0, 1,
-0.6975199, 0.8171534, -1.250864, 0.5019608, 1, 0, 1,
-0.6961993, -0.0790284, -1.446613, 0.4941176, 1, 0, 1,
-0.6816525, -0.4233636, -2.049939, 0.4862745, 1, 0, 1,
-0.6794413, -1.211272, -2.213168, 0.4823529, 1, 0, 1,
-0.6785899, -2.143261, -0.08558382, 0.4745098, 1, 0, 1,
-0.6769809, 0.6780075, -1.602491, 0.4705882, 1, 0, 1,
-0.6732153, 0.4603002, 0.059629, 0.4627451, 1, 0, 1,
-0.6711751, -0.9096587, -2.313031, 0.4588235, 1, 0, 1,
-0.6679591, 0.2301885, -0.6875874, 0.4509804, 1, 0, 1,
-0.6678014, -0.3564596, -2.363194, 0.4470588, 1, 0, 1,
-0.6659582, 1.29328, -0.8225446, 0.4392157, 1, 0, 1,
-0.6657483, -1.093475, -2.027891, 0.4352941, 1, 0, 1,
-0.6586625, 0.2983977, -1.283591, 0.427451, 1, 0, 1,
-0.6510362, -0.05948732, -0.1959209, 0.4235294, 1, 0, 1,
-0.6464129, -0.8275964, -3.216677, 0.4156863, 1, 0, 1,
-0.6449909, -0.2081027, -0.4455669, 0.4117647, 1, 0, 1,
-0.639183, -1.193187, -1.448775, 0.4039216, 1, 0, 1,
-0.6379517, -1.269819, -2.967763, 0.3960784, 1, 0, 1,
-0.6356196, 1.256554, -1.10816, 0.3921569, 1, 0, 1,
-0.6332632, -0.8494092, -2.506786, 0.3843137, 1, 0, 1,
-0.6306389, -2.046818, -3.013567, 0.3803922, 1, 0, 1,
-0.630482, 0.8250827, -0.8822296, 0.372549, 1, 0, 1,
-0.6300485, -0.5188335, -1.649775, 0.3686275, 1, 0, 1,
-0.6290779, 0.5434278, -0.573054, 0.3607843, 1, 0, 1,
-0.6283568, -0.8400688, -3.07246, 0.3568628, 1, 0, 1,
-0.6272653, 1.537746, 0.2474165, 0.3490196, 1, 0, 1,
-0.6247673, -0.4014727, -0.8453113, 0.345098, 1, 0, 1,
-0.6232504, -0.5764425, -2.247094, 0.3372549, 1, 0, 1,
-0.6229355, 0.2832516, 0.04888553, 0.3333333, 1, 0, 1,
-0.6227791, 0.7107453, -3.251665, 0.3254902, 1, 0, 1,
-0.6180422, -1.2185, -1.777051, 0.3215686, 1, 0, 1,
-0.6098779, 0.8719574, 0.1578933, 0.3137255, 1, 0, 1,
-0.6085268, 0.7335919, -1.44672, 0.3098039, 1, 0, 1,
-0.6069202, 0.1986189, -2.692615, 0.3019608, 1, 0, 1,
-0.6025889, 0.5082814, -0.6678001, 0.2941177, 1, 0, 1,
-0.6009206, -0.2532054, -1.669821, 0.2901961, 1, 0, 1,
-0.5975326, -0.8501284, -2.360714, 0.282353, 1, 0, 1,
-0.5919198, -0.5546593, -3.638584, 0.2784314, 1, 0, 1,
-0.5841388, 0.4561359, -0.7604178, 0.2705882, 1, 0, 1,
-0.5808198, 0.536351, -0.8215275, 0.2666667, 1, 0, 1,
-0.5804288, -0.9686056, -2.877874, 0.2588235, 1, 0, 1,
-0.5795535, -0.6471801, -3.292735, 0.254902, 1, 0, 1,
-0.5716254, 0.4841274, -0.4392696, 0.2470588, 1, 0, 1,
-0.5698224, -0.2119997, -1.234141, 0.2431373, 1, 0, 1,
-0.5675879, 0.2872639, -0.3438091, 0.2352941, 1, 0, 1,
-0.5674375, -1.394514, -2.124747, 0.2313726, 1, 0, 1,
-0.5670794, -0.1795092, -1.82299, 0.2235294, 1, 0, 1,
-0.5665234, -0.1339, -2.282147, 0.2196078, 1, 0, 1,
-0.5598646, -1.55756, -4.831102, 0.2117647, 1, 0, 1,
-0.5590183, -0.1990277, -1.92692, 0.2078431, 1, 0, 1,
-0.5583491, 0.9369968, -0.2667148, 0.2, 1, 0, 1,
-0.5527526, 0.1884592, -1.845735, 0.1921569, 1, 0, 1,
-0.5526193, 0.2267297, -2.591661, 0.1882353, 1, 0, 1,
-0.5523368, -0.9790971, -3.071068, 0.1803922, 1, 0, 1,
-0.5519857, -0.3521208, -1.801061, 0.1764706, 1, 0, 1,
-0.5519367, 0.1927852, -0.3184942, 0.1686275, 1, 0, 1,
-0.5515285, 0.9633142, -1.180099, 0.1647059, 1, 0, 1,
-0.5450425, -1.578646, -2.658612, 0.1568628, 1, 0, 1,
-0.5430977, 0.917973, -1.708298, 0.1529412, 1, 0, 1,
-0.5415918, -1.187129, -4.073786, 0.145098, 1, 0, 1,
-0.5326099, -1.131563, -2.369234, 0.1411765, 1, 0, 1,
-0.5311803, 0.4514172, 0.5089794, 0.1333333, 1, 0, 1,
-0.530771, -1.922493, -2.869153, 0.1294118, 1, 0, 1,
-0.5295672, -0.11538, -2.357326, 0.1215686, 1, 0, 1,
-0.5265562, -1.46002, -4.011052, 0.1176471, 1, 0, 1,
-0.5160847, 0.888059, -1.339877, 0.1098039, 1, 0, 1,
-0.515645, -0.6135576, -0.6987064, 0.1058824, 1, 0, 1,
-0.5128129, -0.7220352, -1.63944, 0.09803922, 1, 0, 1,
-0.5121661, 0.7615578, 0.1303381, 0.09019608, 1, 0, 1,
-0.5116141, -0.07678057, -0.348818, 0.08627451, 1, 0, 1,
-0.5050501, 1.128474, 0.7549588, 0.07843138, 1, 0, 1,
-0.5005567, 0.8615163, 1.026934, 0.07450981, 1, 0, 1,
-0.4985671, 1.050645, -1.899382, 0.06666667, 1, 0, 1,
-0.4978938, -2.075433, -2.352749, 0.0627451, 1, 0, 1,
-0.4926101, -1.512452, -1.845928, 0.05490196, 1, 0, 1,
-0.492234, -0.9053609, -1.687941, 0.05098039, 1, 0, 1,
-0.4891896, -1.333104, -3.361553, 0.04313726, 1, 0, 1,
-0.4891896, 0.3185919, -2.558466, 0.03921569, 1, 0, 1,
-0.4889975, -0.832071, -2.731234, 0.03137255, 1, 0, 1,
-0.4885243, 1.295582, -0.3672273, 0.02745098, 1, 0, 1,
-0.4854689, 0.7339098, -1.123165, 0.01960784, 1, 0, 1,
-0.483866, 0.2757997, -0.401289, 0.01568628, 1, 0, 1,
-0.4796305, 0.246277, -1.05042, 0.007843138, 1, 0, 1,
-0.4777247, -0.9945423, -3.688285, 0.003921569, 1, 0, 1,
-0.4732949, 0.2848411, -0.5282454, 0, 1, 0.003921569, 1,
-0.4720564, -0.702655, -1.380996, 0, 1, 0.01176471, 1,
-0.4635148, -0.03935066, -0.8064871, 0, 1, 0.01568628, 1,
-0.4581974, -0.6021979, -2.117691, 0, 1, 0.02352941, 1,
-0.44987, -0.6926013, -2.903862, 0, 1, 0.02745098, 1,
-0.44844, 0.9413769, 0.02575322, 0, 1, 0.03529412, 1,
-0.4456118, 0.5538853, -0.7324907, 0, 1, 0.03921569, 1,
-0.4439449, -1.440161, -2.494291, 0, 1, 0.04705882, 1,
-0.4392097, 0.14934, -2.347848, 0, 1, 0.05098039, 1,
-0.4357447, -0.4771916, -2.443543, 0, 1, 0.05882353, 1,
-0.4350415, 0.1402152, -1.369315, 0, 1, 0.0627451, 1,
-0.4310954, 0.501115, -1.228673, 0, 1, 0.07058824, 1,
-0.4292008, 1.216204, -0.04253439, 0, 1, 0.07450981, 1,
-0.4290589, 1.210425, -1.154813, 0, 1, 0.08235294, 1,
-0.428324, 0.5485738, -2.257005, 0, 1, 0.08627451, 1,
-0.4257502, -1.256813, -3.710442, 0, 1, 0.09411765, 1,
-0.420179, 1.52456, 0.5855582, 0, 1, 0.1019608, 1,
-0.4198786, -0.6144595, -3.281132, 0, 1, 0.1058824, 1,
-0.412731, -0.9385628, -3.52513, 0, 1, 0.1137255, 1,
-0.4122513, 0.1627781, -3.410992, 0, 1, 0.1176471, 1,
-0.4098366, 0.8678434, -0.9363242, 0, 1, 0.1254902, 1,
-0.405131, 0.1383646, -0.3593749, 0, 1, 0.1294118, 1,
-0.4046042, 0.4230981, -0.2958849, 0, 1, 0.1372549, 1,
-0.4027979, 0.6876145, -0.4675698, 0, 1, 0.1411765, 1,
-0.4018668, 0.693664, 0.2696116, 0, 1, 0.1490196, 1,
-0.4000483, -1.618705, -0.3392368, 0, 1, 0.1529412, 1,
-0.3978513, -0.7227192, -4.139346, 0, 1, 0.1607843, 1,
-0.39521, -0.1322788, -2.327298, 0, 1, 0.1647059, 1,
-0.3935429, -0.1851608, -3.683361, 0, 1, 0.172549, 1,
-0.3910601, 2.100518, 2.031926, 0, 1, 0.1764706, 1,
-0.3889275, -1.023802, -3.116541, 0, 1, 0.1843137, 1,
-0.3881831, 0.6489062, -1.221956, 0, 1, 0.1882353, 1,
-0.3863212, 1.172087, -1.535814, 0, 1, 0.1960784, 1,
-0.3848729, -0.7464845, -2.787975, 0, 1, 0.2039216, 1,
-0.381478, 0.3034156, -1.27626, 0, 1, 0.2078431, 1,
-0.3811342, -0.2810043, -3.717961, 0, 1, 0.2156863, 1,
-0.3809326, -0.2766818, -1.976331, 0, 1, 0.2196078, 1,
-0.3801681, -2.190637, -4.170141, 0, 1, 0.227451, 1,
-0.3770814, -1.090985, -2.766926, 0, 1, 0.2313726, 1,
-0.3763458, -0.7791992, -5.148159, 0, 1, 0.2392157, 1,
-0.3747131, -1.304267, -1.824041, 0, 1, 0.2431373, 1,
-0.3718333, -2.987907, -2.019281, 0, 1, 0.2509804, 1,
-0.3704081, -0.3855644, -2.412878, 0, 1, 0.254902, 1,
-0.3675913, 0.9660782, 0.282639, 0, 1, 0.2627451, 1,
-0.3614596, -0.05874003, -1.909354, 0, 1, 0.2666667, 1,
-0.3612842, -1.327673, -3.684184, 0, 1, 0.2745098, 1,
-0.3590174, 0.6373093, 0.1791697, 0, 1, 0.2784314, 1,
-0.3498089, 0.2468927, -0.303648, 0, 1, 0.2862745, 1,
-0.3485051, -3.048599, -3.911445, 0, 1, 0.2901961, 1,
-0.3471232, -0.4404697, -1.619777, 0, 1, 0.2980392, 1,
-0.3466564, 0.08962831, -1.175468, 0, 1, 0.3058824, 1,
-0.3453988, -0.226051, -2.426103, 0, 1, 0.3098039, 1,
-0.3404448, 0.6066583, -0.8864162, 0, 1, 0.3176471, 1,
-0.338524, -0.2551104, -2.683499, 0, 1, 0.3215686, 1,
-0.3368748, 0.4696399, 0.8282207, 0, 1, 0.3294118, 1,
-0.3352408, -0.3588239, -1.712689, 0, 1, 0.3333333, 1,
-0.332555, -1.346203, -3.489657, 0, 1, 0.3411765, 1,
-0.3310387, 0.306262, -0.4263535, 0, 1, 0.345098, 1,
-0.3222873, -1.485737, -3.172858, 0, 1, 0.3529412, 1,
-0.3220241, -0.04032927, -2.902987, 0, 1, 0.3568628, 1,
-0.3206733, 0.002709789, -2.13341, 0, 1, 0.3647059, 1,
-0.3204331, -0.294718, -3.607592, 0, 1, 0.3686275, 1,
-0.3150959, 0.7587723, -0.5672517, 0, 1, 0.3764706, 1,
-0.3148841, -0.7145082, -4.563338, 0, 1, 0.3803922, 1,
-0.3145322, -0.05067569, -1.156376, 0, 1, 0.3882353, 1,
-0.3135666, -0.6398193, -2.987207, 0, 1, 0.3921569, 1,
-0.3090471, 1.170299, -0.3985466, 0, 1, 0.4, 1,
-0.3048188, -0.7146302, -4.024482, 0, 1, 0.4078431, 1,
-0.3042226, -0.09030424, -1.767272, 0, 1, 0.4117647, 1,
-0.2988579, -2.51563, -2.320253, 0, 1, 0.4196078, 1,
-0.2973885, -0.3796487, -2.509069, 0, 1, 0.4235294, 1,
-0.2951383, 1.650099, 0.610293, 0, 1, 0.4313726, 1,
-0.2930347, -0.564066, -4.562792, 0, 1, 0.4352941, 1,
-0.2924908, 0.3448935, -0.06167591, 0, 1, 0.4431373, 1,
-0.291526, -1.105405, -3.031408, 0, 1, 0.4470588, 1,
-0.2833403, -0.1553448, -1.824658, 0, 1, 0.454902, 1,
-0.2815168, 0.1331919, -1.566115, 0, 1, 0.4588235, 1,
-0.275907, 0.2362471, -2.602457, 0, 1, 0.4666667, 1,
-0.275456, -1.430344, -2.092208, 0, 1, 0.4705882, 1,
-0.2671222, 0.6017728, -1.521984, 0, 1, 0.4784314, 1,
-0.2618552, 0.7509762, 0.2540579, 0, 1, 0.4823529, 1,
-0.2594911, -0.4090027, -1.668427, 0, 1, 0.4901961, 1,
-0.2538627, -0.2689478, -2.91567, 0, 1, 0.4941176, 1,
-0.2508618, -0.1730816, -2.732726, 0, 1, 0.5019608, 1,
-0.2506766, 0.9800611, 0.2872925, 0, 1, 0.509804, 1,
-0.2489515, -0.8704753, -1.788128, 0, 1, 0.5137255, 1,
-0.2479607, -0.2287129, -5.167568, 0, 1, 0.5215687, 1,
-0.2405089, 0.5989192, -1.542287, 0, 1, 0.5254902, 1,
-0.238782, 0.1455496, -1.102824, 0, 1, 0.5333334, 1,
-0.2375887, 0.4367596, 0.5862295, 0, 1, 0.5372549, 1,
-0.2354334, 1.390153, 0.3793939, 0, 1, 0.5450981, 1,
-0.2350152, 0.06504586, -2.955726, 0, 1, 0.5490196, 1,
-0.2331168, 0.796908, 0.2340846, 0, 1, 0.5568628, 1,
-0.2325232, 0.3685134, -1.789768, 0, 1, 0.5607843, 1,
-0.2323495, 1.913997, -0.7912262, 0, 1, 0.5686275, 1,
-0.228593, -0.2861647, -2.428099, 0, 1, 0.572549, 1,
-0.2257618, -0.6236804, -2.051248, 0, 1, 0.5803922, 1,
-0.2212818, 0.05502857, 0.7964309, 0, 1, 0.5843138, 1,
-0.2200096, -0.8503706, -2.133104, 0, 1, 0.5921569, 1,
-0.219617, 0.3472716, -0.1854218, 0, 1, 0.5960785, 1,
-0.2180834, -1.294932, -2.708314, 0, 1, 0.6039216, 1,
-0.2176975, 0.1170837, 0.5636379, 0, 1, 0.6117647, 1,
-0.2169579, 0.5577602, -0.9908299, 0, 1, 0.6156863, 1,
-0.2167962, -0.06739683, -1.042491, 0, 1, 0.6235294, 1,
-0.2141896, -0.1106365, -4.269799, 0, 1, 0.627451, 1,
-0.2140283, 2.640879, -0.6443307, 0, 1, 0.6352941, 1,
-0.213605, -0.972493, -1.585783, 0, 1, 0.6392157, 1,
-0.2120318, -0.7898105, -3.1742, 0, 1, 0.6470588, 1,
-0.2105062, 0.1167005, -1.169833, 0, 1, 0.6509804, 1,
-0.208206, 0.2900241, -1.323444, 0, 1, 0.6588235, 1,
-0.2080127, -0.2176085, -1.179321, 0, 1, 0.6627451, 1,
-0.2029175, 0.08720856, -2.274354, 0, 1, 0.6705883, 1,
-0.2025371, -1.142742, -1.552515, 0, 1, 0.6745098, 1,
-0.201088, 0.4348845, -1.309308, 0, 1, 0.682353, 1,
-0.199491, 0.177656, -0.2007718, 0, 1, 0.6862745, 1,
-0.1989957, 0.6354006, -0.5848354, 0, 1, 0.6941177, 1,
-0.1971974, 1.142893, 1.071011, 0, 1, 0.7019608, 1,
-0.1961164, -0.7832507, -3.173413, 0, 1, 0.7058824, 1,
-0.1956016, -0.5690717, -3.03544, 0, 1, 0.7137255, 1,
-0.1933751, -0.533833, -0.228999, 0, 1, 0.7176471, 1,
-0.1927014, 0.06412009, -1.752023, 0, 1, 0.7254902, 1,
-0.1891883, 0.7262846, -0.8976848, 0, 1, 0.7294118, 1,
-0.1881474, -0.6561595, -5.174828, 0, 1, 0.7372549, 1,
-0.1850926, 1.178058, -0.1295503, 0, 1, 0.7411765, 1,
-0.1740245, -0.7334808, -2.841723, 0, 1, 0.7490196, 1,
-0.1718645, 1.161255, 0.8049625, 0, 1, 0.7529412, 1,
-0.1716641, -0.8478109, -1.596545, 0, 1, 0.7607843, 1,
-0.1640263, 1.056228, 0.6420408, 0, 1, 0.7647059, 1,
-0.1610884, 0.6102003, -2.389279, 0, 1, 0.772549, 1,
-0.1608422, 0.1816008, -2.488256, 0, 1, 0.7764706, 1,
-0.1605383, 0.1967667, -0.3619602, 0, 1, 0.7843137, 1,
-0.1600932, -0.9936908, -3.911918, 0, 1, 0.7882353, 1,
-0.1574148, 1.540266, -2.086522, 0, 1, 0.7960784, 1,
-0.1552083, -1.2257, -3.294595, 0, 1, 0.8039216, 1,
-0.151423, -0.4347443, -3.893935, 0, 1, 0.8078431, 1,
-0.1489099, 1.547301, 1.129825, 0, 1, 0.8156863, 1,
-0.1481105, -0.7832263, -2.611698, 0, 1, 0.8196079, 1,
-0.1470077, -0.3193881, -2.211288, 0, 1, 0.827451, 1,
-0.141295, 0.8619642, 0.688703, 0, 1, 0.8313726, 1,
-0.1407237, -0.5221549, -4.312329, 0, 1, 0.8392157, 1,
-0.1397979, -0.658468, -1.615313, 0, 1, 0.8431373, 1,
-0.1369413, -0.6175078, -3.838067, 0, 1, 0.8509804, 1,
-0.1341892, 0.5102572, -2.298369, 0, 1, 0.854902, 1,
-0.1311866, -0.492292, -4.092559, 0, 1, 0.8627451, 1,
-0.1282973, -0.6142117, -3.069233, 0, 1, 0.8666667, 1,
-0.1243382, 1.226812, 0.8774365, 0, 1, 0.8745098, 1,
-0.1223056, -0.4465986, -2.888624, 0, 1, 0.8784314, 1,
-0.1222135, -0.6406363, -2.067329, 0, 1, 0.8862745, 1,
-0.1188812, -0.7691008, -5.818925, 0, 1, 0.8901961, 1,
-0.1181957, 1.219379, -0.6354614, 0, 1, 0.8980392, 1,
-0.1150119, -1.128985, -4.976024, 0, 1, 0.9058824, 1,
-0.1141413, 0.8503543, -0.3238308, 0, 1, 0.9098039, 1,
-0.1118755, 0.07152009, -1.018143, 0, 1, 0.9176471, 1,
-0.1097881, 1.066553, 0.8713309, 0, 1, 0.9215686, 1,
-0.1091148, -0.826054, -3.845236, 0, 1, 0.9294118, 1,
-0.09949935, -1.775663, -3.395938, 0, 1, 0.9333333, 1,
-0.09776416, -1.650483, -2.205104, 0, 1, 0.9411765, 1,
-0.09640484, -0.9647555, -3.098047, 0, 1, 0.945098, 1,
-0.09217334, 0.5167078, -1.19433, 0, 1, 0.9529412, 1,
-0.08779561, -2.515602, -6.009214, 0, 1, 0.9568627, 1,
-0.08403395, -0.819841, -2.369554, 0, 1, 0.9647059, 1,
-0.08392043, -1.353674, -5.125146, 0, 1, 0.9686275, 1,
-0.08021449, -2.579712, -1.340654, 0, 1, 0.9764706, 1,
-0.07907951, 1.602312, 0.0201866, 0, 1, 0.9803922, 1,
-0.07771837, 0.1757019, 0.1148431, 0, 1, 0.9882353, 1,
-0.07711906, -0.2681192, -2.044563, 0, 1, 0.9921569, 1,
-0.07606523, -1.975843, -3.483515, 0, 1, 1, 1,
-0.07427358, -0.2437669, -1.746194, 0, 0.9921569, 1, 1,
-0.0722866, 0.1863849, -0.03462035, 0, 0.9882353, 1, 1,
-0.07026399, -2.045376, -2.620391, 0, 0.9803922, 1, 1,
-0.0668577, 1.826401, 0.7547109, 0, 0.9764706, 1, 1,
-0.06642285, -0.7046899, -2.510993, 0, 0.9686275, 1, 1,
-0.06487499, 0.7223192, -0.3344582, 0, 0.9647059, 1, 1,
-0.06355396, -0.08034446, -1.906546, 0, 0.9568627, 1, 1,
-0.0575612, -0.2105709, -4.012362, 0, 0.9529412, 1, 1,
-0.05441142, -0.3410522, -1.781909, 0, 0.945098, 1, 1,
-0.04988055, -0.3590558, -3.082565, 0, 0.9411765, 1, 1,
-0.04947991, 0.5566664, -1.28164, 0, 0.9333333, 1, 1,
-0.04632732, 0.1757597, -0.6416216, 0, 0.9294118, 1, 1,
-0.04036887, 0.6299628, 0.1530417, 0, 0.9215686, 1, 1,
-0.03969958, -0.2508263, -4.181852, 0, 0.9176471, 1, 1,
-0.03449387, -1.512698, -3.131867, 0, 0.9098039, 1, 1,
-0.03269647, -1.284241, -4.103122, 0, 0.9058824, 1, 1,
-0.0311525, 1.495893, 0.2965917, 0, 0.8980392, 1, 1,
-0.03067851, -0.8535904, -1.668411, 0, 0.8901961, 1, 1,
-0.02511774, 0.6608903, -0.8683262, 0, 0.8862745, 1, 1,
-0.02469441, -1.244174, -2.054757, 0, 0.8784314, 1, 1,
-0.02453878, 0.2716816, 0.6429667, 0, 0.8745098, 1, 1,
-0.02242698, 0.5394315, -0.6021848, 0, 0.8666667, 1, 1,
-0.01893124, 0.9142858, 1.063094, 0, 0.8627451, 1, 1,
-0.01454059, -0.4331642, -3.823009, 0, 0.854902, 1, 1,
-0.001407479, -0.7746975, -4.735805, 0, 0.8509804, 1, 1,
0.002294566, -0.04948547, 2.792533, 0, 0.8431373, 1, 1,
0.003396034, -0.2611583, 5.263722, 0, 0.8392157, 1, 1,
0.004316957, -2.202231, 3.280955, 0, 0.8313726, 1, 1,
0.007013083, -0.2016981, 3.78015, 0, 0.827451, 1, 1,
0.01012595, -0.6511711, 2.745696, 0, 0.8196079, 1, 1,
0.01243269, -0.03004464, 3.027378, 0, 0.8156863, 1, 1,
0.01337855, -2.158174, 3.593541, 0, 0.8078431, 1, 1,
0.0140665, -1.820495, 2.417104, 0, 0.8039216, 1, 1,
0.01458988, -0.1507216, 3.68545, 0, 0.7960784, 1, 1,
0.01553342, -0.8660504, 2.020318, 0, 0.7882353, 1, 1,
0.01817827, 0.509317, 0.6559149, 0, 0.7843137, 1, 1,
0.01843614, -1.487435, 3.032948, 0, 0.7764706, 1, 1,
0.02335653, -0.3582137, 4.275578, 0, 0.772549, 1, 1,
0.02416662, -0.03226558, 2.338176, 0, 0.7647059, 1, 1,
0.02547552, 0.1612876, -1.030927, 0, 0.7607843, 1, 1,
0.03076642, -0.743455, 2.473681, 0, 0.7529412, 1, 1,
0.03223226, 0.3455443, 0.1839479, 0, 0.7490196, 1, 1,
0.03271181, -0.6285359, 2.560292, 0, 0.7411765, 1, 1,
0.03336021, 1.918706, 0.6854536, 0, 0.7372549, 1, 1,
0.03398654, 0.2429731, -0.7123254, 0, 0.7294118, 1, 1,
0.04084472, 0.5945363, -0.6702221, 0, 0.7254902, 1, 1,
0.05505836, 1.109886, 0.1341547, 0, 0.7176471, 1, 1,
0.05594318, -0.9210194, 5.166435, 0, 0.7137255, 1, 1,
0.05670239, -2.126872, 4.055562, 0, 0.7058824, 1, 1,
0.05748893, -1.426086, 3.057193, 0, 0.6980392, 1, 1,
0.05916279, 0.5233233, 0.7708563, 0, 0.6941177, 1, 1,
0.05921865, -1.543448, 2.361552, 0, 0.6862745, 1, 1,
0.06065381, 0.364457, 0.199802, 0, 0.682353, 1, 1,
0.06137339, -0.02937094, 0.6020656, 0, 0.6745098, 1, 1,
0.06192028, -0.8944601, 3.747837, 0, 0.6705883, 1, 1,
0.0635215, -0.4567735, 3.182529, 0, 0.6627451, 1, 1,
0.06478427, -1.081528, 1.380314, 0, 0.6588235, 1, 1,
0.06566088, -1.591366, 3.941643, 0, 0.6509804, 1, 1,
0.0669502, -0.4724809, 3.258439, 0, 0.6470588, 1, 1,
0.07270181, 0.5859678, 0.4240475, 0, 0.6392157, 1, 1,
0.07291465, 1.209923, 1.294659, 0, 0.6352941, 1, 1,
0.0740204, 1.375335, 0.4956737, 0, 0.627451, 1, 1,
0.07439411, -0.1667775, 4.286665, 0, 0.6235294, 1, 1,
0.0776175, -1.200052, 1.326312, 0, 0.6156863, 1, 1,
0.07866243, 2.071959, -0.6906025, 0, 0.6117647, 1, 1,
0.08165424, -0.1757564, 3.059205, 0, 0.6039216, 1, 1,
0.08288559, -1.691047, 3.94847, 0, 0.5960785, 1, 1,
0.08524015, -0.150793, 1.842138, 0, 0.5921569, 1, 1,
0.08533338, -1.090774, 2.145505, 0, 0.5843138, 1, 1,
0.0866506, 0.07764498, -0.04141504, 0, 0.5803922, 1, 1,
0.09148373, 0.5753744, 0.6775703, 0, 0.572549, 1, 1,
0.09359446, 0.0440383, 2.260848, 0, 0.5686275, 1, 1,
0.09559318, 0.9727646, 1.612652, 0, 0.5607843, 1, 1,
0.09718649, -0.6194122, 3.726649, 0, 0.5568628, 1, 1,
0.09809562, -1.065134, 2.922239, 0, 0.5490196, 1, 1,
0.1025757, -0.5002019, 2.016019, 0, 0.5450981, 1, 1,
0.1123799, 0.002707765, 0.5025176, 0, 0.5372549, 1, 1,
0.1133788, -1.262739, 2.437984, 0, 0.5333334, 1, 1,
0.1165765, -0.119768, 1.616212, 0, 0.5254902, 1, 1,
0.117609, 1.140473, -0.6661068, 0, 0.5215687, 1, 1,
0.1180455, -1.388849, 4.860056, 0, 0.5137255, 1, 1,
0.1218404, -1.317471, 4.165237, 0, 0.509804, 1, 1,
0.1234568, -0.8096073, 4.989608, 0, 0.5019608, 1, 1,
0.127542, 0.1429554, 1.263746, 0, 0.4941176, 1, 1,
0.1283345, -1.141088, 2.325815, 0, 0.4901961, 1, 1,
0.1302087, 0.2729565, 0.1389593, 0, 0.4823529, 1, 1,
0.132053, 0.5214118, -1.083095, 0, 0.4784314, 1, 1,
0.1327763, 0.9580045, 0.8359488, 0, 0.4705882, 1, 1,
0.1362991, -0.774925, 3.217796, 0, 0.4666667, 1, 1,
0.1371364, 0.06101488, 0.5620278, 0, 0.4588235, 1, 1,
0.1432031, -1.154039, 3.498921, 0, 0.454902, 1, 1,
0.1473755, 0.9043425, 0.2434964, 0, 0.4470588, 1, 1,
0.147761, 0.598945, 0.08092066, 0, 0.4431373, 1, 1,
0.1492843, 2.12997, -0.2125354, 0, 0.4352941, 1, 1,
0.1500811, 0.6507032, 0.1424063, 0, 0.4313726, 1, 1,
0.1503769, 0.1888473, 0.4555239, 0, 0.4235294, 1, 1,
0.1522345, 0.4712641, 1.243788, 0, 0.4196078, 1, 1,
0.152677, -0.1636454, 2.448393, 0, 0.4117647, 1, 1,
0.1560404, -0.3005871, 3.749668, 0, 0.4078431, 1, 1,
0.1572441, -0.06401221, 0.5806108, 0, 0.4, 1, 1,
0.1630337, 1.0947, 0.6509413, 0, 0.3921569, 1, 1,
0.1641037, -0.3188686, 2.263741, 0, 0.3882353, 1, 1,
0.1659942, -1.915502, 2.078417, 0, 0.3803922, 1, 1,
0.1685928, -0.4079395, 1.189771, 0, 0.3764706, 1, 1,
0.1765199, -0.3241842, 2.756057, 0, 0.3686275, 1, 1,
0.183733, -0.418632, 2.475406, 0, 0.3647059, 1, 1,
0.1919478, 1.256459, -0.8459932, 0, 0.3568628, 1, 1,
0.192258, 0.4381835, 2.300366, 0, 0.3529412, 1, 1,
0.1976457, -0.8012133, 3.075138, 0, 0.345098, 1, 1,
0.1998153, 0.0794802, 0.02958014, 0, 0.3411765, 1, 1,
0.200114, 0.1398288, 1.402361, 0, 0.3333333, 1, 1,
0.2022737, 1.270906, 0.6197056, 0, 0.3294118, 1, 1,
0.2055717, -0.4424014, 2.992481, 0, 0.3215686, 1, 1,
0.2133266, 0.9495572, 0.636856, 0, 0.3176471, 1, 1,
0.2163841, -0.0478444, -0.9641454, 0, 0.3098039, 1, 1,
0.2172751, 1.566844, 1.891243, 0, 0.3058824, 1, 1,
0.2174264, -0.8326043, 1.712874, 0, 0.2980392, 1, 1,
0.218102, -0.704414, 3.66396, 0, 0.2901961, 1, 1,
0.2190662, -1.499183, 2.980881, 0, 0.2862745, 1, 1,
0.2191941, -1.681046, 1.426185, 0, 0.2784314, 1, 1,
0.2259058, 2.233367, 2.620039, 0, 0.2745098, 1, 1,
0.2267644, -0.5303717, 4.463901, 0, 0.2666667, 1, 1,
0.2290561, -0.7430173, 2.269005, 0, 0.2627451, 1, 1,
0.2295628, 0.02611069, 1.652947, 0, 0.254902, 1, 1,
0.230119, -0.5159799, 3.625056, 0, 0.2509804, 1, 1,
0.2328432, 0.7003827, -0.02549821, 0, 0.2431373, 1, 1,
0.2350209, -2.110505, 3.745238, 0, 0.2392157, 1, 1,
0.2365407, 0.9079999, 1.536159, 0, 0.2313726, 1, 1,
0.2379494, 0.3059216, 0.9296448, 0, 0.227451, 1, 1,
0.2409305, -2.398997, 3.108339, 0, 0.2196078, 1, 1,
0.2456769, 0.1711823, -0.5704006, 0, 0.2156863, 1, 1,
0.2504604, -0.1355718, 2.678087, 0, 0.2078431, 1, 1,
0.2507102, 0.4895199, 1.639785, 0, 0.2039216, 1, 1,
0.2510374, 1.221115, -0.7875559, 0, 0.1960784, 1, 1,
0.2528727, 0.5689177, -0.679239, 0, 0.1882353, 1, 1,
0.2539952, -0.1054141, 2.540588, 0, 0.1843137, 1, 1,
0.2544257, -1.171522, 1.43272, 0, 0.1764706, 1, 1,
0.2633527, -0.1454717, 1.72972, 0, 0.172549, 1, 1,
0.2664301, 0.8155977, 1.284971, 0, 0.1647059, 1, 1,
0.2694416, 1.416857, 1.20779, 0, 0.1607843, 1, 1,
0.2706159, -0.1061708, 3.200665, 0, 0.1529412, 1, 1,
0.2746473, -0.5494545, 3.247822, 0, 0.1490196, 1, 1,
0.274879, 0.9459354, -0.1455278, 0, 0.1411765, 1, 1,
0.2773977, -1.242462, 2.174615, 0, 0.1372549, 1, 1,
0.2801098, 1.105306, 0.6903919, 0, 0.1294118, 1, 1,
0.2806837, -0.320814, 1.82099, 0, 0.1254902, 1, 1,
0.2836525, -1.372484, 1.99394, 0, 0.1176471, 1, 1,
0.2844089, -0.9635768, 3.276362, 0, 0.1137255, 1, 1,
0.2877562, 0.4273837, 0.2707443, 0, 0.1058824, 1, 1,
0.287972, -1.536233, 1.918976, 0, 0.09803922, 1, 1,
0.2988962, 0.05993912, 2.0702, 0, 0.09411765, 1, 1,
0.3017704, -0.6679419, 2.434059, 0, 0.08627451, 1, 1,
0.3028076, -1.088558, 2.101075, 0, 0.08235294, 1, 1,
0.303923, -1.675679, 2.625177, 0, 0.07450981, 1, 1,
0.3049524, 0.6873714, 0.8829251, 0, 0.07058824, 1, 1,
0.3079767, 1.218973, -0.6468689, 0, 0.0627451, 1, 1,
0.308175, 0.9307618, 2.366924, 0, 0.05882353, 1, 1,
0.3095249, 0.802261, 0.6544335, 0, 0.05098039, 1, 1,
0.3104155, 2.099218, 0.792311, 0, 0.04705882, 1, 1,
0.3111825, -1.606915, 3.131876, 0, 0.03921569, 1, 1,
0.3116981, 0.7737561, -0.6626549, 0, 0.03529412, 1, 1,
0.3167709, 0.2367739, 3.24853, 0, 0.02745098, 1, 1,
0.3197749, -2.007469, 2.623448, 0, 0.02352941, 1, 1,
0.3225382, 0.5592716, 0.7198403, 0, 0.01568628, 1, 1,
0.3276556, 1.077629, -1.178687, 0, 0.01176471, 1, 1,
0.3308689, -1.386131, 2.244223, 0, 0.003921569, 1, 1,
0.3346252, -1.416821, 2.49167, 0.003921569, 0, 1, 1,
0.3404396, -1.175966, 2.959956, 0.007843138, 0, 1, 1,
0.3416128, -1.065902, 2.103929, 0.01568628, 0, 1, 1,
0.3486037, -0.157646, 2.189666, 0.01960784, 0, 1, 1,
0.3493502, -1.025466, 2.181813, 0.02745098, 0, 1, 1,
0.353641, 0.5623904, 1.646959, 0.03137255, 0, 1, 1,
0.3618356, 1.029739, 0.2252901, 0.03921569, 0, 1, 1,
0.3670727, 0.5500481, 3.876363, 0.04313726, 0, 1, 1,
0.3733436, -0.6867595, 2.786018, 0.05098039, 0, 1, 1,
0.3745332, -0.5616963, 2.652523, 0.05490196, 0, 1, 1,
0.3868672, -1.492801, 3.515361, 0.0627451, 0, 1, 1,
0.388056, -0.09195055, 2.617619, 0.06666667, 0, 1, 1,
0.3889636, 0.7868237, 1.460447, 0.07450981, 0, 1, 1,
0.3925115, -0.4054628, 2.483788, 0.07843138, 0, 1, 1,
0.3939888, 1.034756, 2.32805, 0.08627451, 0, 1, 1,
0.3947516, -0.8688264, 4.349476, 0.09019608, 0, 1, 1,
0.3953688, 1.741781, 0.346769, 0.09803922, 0, 1, 1,
0.3974275, -0.3275494, 3.074907, 0.1058824, 0, 1, 1,
0.3982249, 1.548648, 0.5212939, 0.1098039, 0, 1, 1,
0.4027279, 0.7784955, -0.6194757, 0.1176471, 0, 1, 1,
0.407582, -0.2890552, 3.014031, 0.1215686, 0, 1, 1,
0.4091758, 0.165575, 1.779025, 0.1294118, 0, 1, 1,
0.4122007, -1.424988, 2.862364, 0.1333333, 0, 1, 1,
0.4137373, -0.5455053, 3.411792, 0.1411765, 0, 1, 1,
0.4179043, -0.3871146, 3.41057, 0.145098, 0, 1, 1,
0.4233814, -1.349745, 4.353119, 0.1529412, 0, 1, 1,
0.4278708, -0.8552786, 4.848173, 0.1568628, 0, 1, 1,
0.4326482, 0.7471655, -1.15142, 0.1647059, 0, 1, 1,
0.4345324, 1.909899, 1.519488, 0.1686275, 0, 1, 1,
0.4347549, -0.1441882, 2.282063, 0.1764706, 0, 1, 1,
0.4353305, -0.4157725, 0.8766203, 0.1803922, 0, 1, 1,
0.4416308, 1.294161, 0.4179629, 0.1882353, 0, 1, 1,
0.4428877, -0.1949562, 1.018544, 0.1921569, 0, 1, 1,
0.4429926, 0.1591048, 1.74898, 0.2, 0, 1, 1,
0.4460301, -0.1774679, 1.850496, 0.2078431, 0, 1, 1,
0.4469844, -0.8191411, 2.093523, 0.2117647, 0, 1, 1,
0.4549309, -0.308389, 0.869791, 0.2196078, 0, 1, 1,
0.4560777, 0.8612983, 1.840381, 0.2235294, 0, 1, 1,
0.4567888, 1.051612, -0.02755371, 0.2313726, 0, 1, 1,
0.457148, -1.211544, 3.265984, 0.2352941, 0, 1, 1,
0.4602422, -0.2778647, 1.849146, 0.2431373, 0, 1, 1,
0.4616157, -1.068776, 3.87556, 0.2470588, 0, 1, 1,
0.4626681, -0.1482697, 2.012481, 0.254902, 0, 1, 1,
0.4638327, 0.1314261, 2.264532, 0.2588235, 0, 1, 1,
0.4685657, -0.5388553, 1.779743, 0.2666667, 0, 1, 1,
0.4697887, -0.6283793, 3.523158, 0.2705882, 0, 1, 1,
0.4700628, 1.113469, 0.06684263, 0.2784314, 0, 1, 1,
0.4721387, 0.2886099, -0.4098801, 0.282353, 0, 1, 1,
0.4795548, 1.358371, 0.6255581, 0.2901961, 0, 1, 1,
0.4840874, 0.3386624, 1.12845, 0.2941177, 0, 1, 1,
0.4860915, 0.4827569, 2.374561, 0.3019608, 0, 1, 1,
0.4927049, -0.1962041, 0.940568, 0.3098039, 0, 1, 1,
0.4959939, -1.050182, 3.119933, 0.3137255, 0, 1, 1,
0.4976187, -0.9303768, 2.871533, 0.3215686, 0, 1, 1,
0.5044181, -1.379111, 2.498689, 0.3254902, 0, 1, 1,
0.5070374, -0.7273647, 1.952644, 0.3333333, 0, 1, 1,
0.5097777, 0.08948068, 1.561708, 0.3372549, 0, 1, 1,
0.5108721, 0.6218767, -0.2378369, 0.345098, 0, 1, 1,
0.5140871, 0.1585186, 3.028331, 0.3490196, 0, 1, 1,
0.5167009, 0.3819554, 1.448571, 0.3568628, 0, 1, 1,
0.5189387, 1.89615, 0.4167507, 0.3607843, 0, 1, 1,
0.5204166, -1.357105, 3.095567, 0.3686275, 0, 1, 1,
0.5237942, 0.671243, 2.05198, 0.372549, 0, 1, 1,
0.5260435, 0.1961842, 1.282701, 0.3803922, 0, 1, 1,
0.5286283, -1.254941, 2.450466, 0.3843137, 0, 1, 1,
0.5298867, 0.3742815, 1.198052, 0.3921569, 0, 1, 1,
0.5353879, 0.768335, 2.060217, 0.3960784, 0, 1, 1,
0.5372177, 1.37003, 0.7202781, 0.4039216, 0, 1, 1,
0.5372561, -1.166126, 0.6625496, 0.4117647, 0, 1, 1,
0.5400576, 0.2892567, 0.271972, 0.4156863, 0, 1, 1,
0.5402542, -0.6381454, 2.85918, 0.4235294, 0, 1, 1,
0.5470479, 0.3088261, 0.2035272, 0.427451, 0, 1, 1,
0.5506224, -0.05780025, 0.1827981, 0.4352941, 0, 1, 1,
0.5532069, -1.334343, 2.670404, 0.4392157, 0, 1, 1,
0.5533297, 0.06214797, 2.439202, 0.4470588, 0, 1, 1,
0.558621, -0.5762869, 2.531545, 0.4509804, 0, 1, 1,
0.5681508, -1.680264, 1.281822, 0.4588235, 0, 1, 1,
0.5682613, -0.2031646, 3.112811, 0.4627451, 0, 1, 1,
0.5720527, 0.4677783, 1.1266, 0.4705882, 0, 1, 1,
0.5776188, 1.069617, -1.169209, 0.4745098, 0, 1, 1,
0.5806159, -2.06417, 2.091255, 0.4823529, 0, 1, 1,
0.5858495, 0.6641846, -0.6511591, 0.4862745, 0, 1, 1,
0.5909832, 0.7511439, -0.2531941, 0.4941176, 0, 1, 1,
0.5978311, -1.128527, 0.9115672, 0.5019608, 0, 1, 1,
0.6008887, 1.282234, -0.6049832, 0.5058824, 0, 1, 1,
0.6034799, -0.1759466, 2.405162, 0.5137255, 0, 1, 1,
0.6062029, -0.1454603, 3.504689, 0.5176471, 0, 1, 1,
0.6062309, -0.04549385, 1.469407, 0.5254902, 0, 1, 1,
0.6063963, -1.105595, 2.04058, 0.5294118, 0, 1, 1,
0.6138933, 1.596598, -0.828344, 0.5372549, 0, 1, 1,
0.6197284, -0.03380694, 0.05965405, 0.5411765, 0, 1, 1,
0.6273663, 2.201549, -0.6551502, 0.5490196, 0, 1, 1,
0.6288794, -0.3127456, 2.977175, 0.5529412, 0, 1, 1,
0.6334751, 0.5151927, 1.905053, 0.5607843, 0, 1, 1,
0.6339468, -2.207186, 1.151278, 0.5647059, 0, 1, 1,
0.6345287, -0.8506895, 2.332932, 0.572549, 0, 1, 1,
0.6354854, -0.9995635, 3.860064, 0.5764706, 0, 1, 1,
0.6372236, -0.7336842, 3.06588, 0.5843138, 0, 1, 1,
0.6382699, 0.05328978, 2.837145, 0.5882353, 0, 1, 1,
0.6389084, -0.6702853, 3.178165, 0.5960785, 0, 1, 1,
0.6402603, 0.4719549, 0.1104742, 0.6039216, 0, 1, 1,
0.6506776, 1.281452, 0.05216909, 0.6078432, 0, 1, 1,
0.6523098, 1.251008, 0.02500643, 0.6156863, 0, 1, 1,
0.6538312, -1.160353, 3.028796, 0.6196079, 0, 1, 1,
0.6608235, 0.6632974, 0.2123519, 0.627451, 0, 1, 1,
0.666703, 0.1003079, 3.534452, 0.6313726, 0, 1, 1,
0.6717402, -0.8058643, 3.161684, 0.6392157, 0, 1, 1,
0.6779858, 0.006393681, 1.915253, 0.6431373, 0, 1, 1,
0.6821312, -1.375047, 2.864013, 0.6509804, 0, 1, 1,
0.6873446, -0.05860043, 0.8982069, 0.654902, 0, 1, 1,
0.6992811, -1.319396, 1.903328, 0.6627451, 0, 1, 1,
0.69939, 0.1362155, 0.5240129, 0.6666667, 0, 1, 1,
0.7001762, -0.1878026, 2.819931, 0.6745098, 0, 1, 1,
0.7008957, -0.4870927, 2.530205, 0.6784314, 0, 1, 1,
0.7043656, -2.609757, 2.854217, 0.6862745, 0, 1, 1,
0.7054942, -0.1136012, 3.474978, 0.6901961, 0, 1, 1,
0.7113039, -0.854263, 2.359929, 0.6980392, 0, 1, 1,
0.7144032, -0.09095593, 1.123994, 0.7058824, 0, 1, 1,
0.7160798, 1.370549, 0.08927715, 0.7098039, 0, 1, 1,
0.7166722, 0.8136924, 0.6602979, 0.7176471, 0, 1, 1,
0.71864, 1.592482, 0.4976335, 0.7215686, 0, 1, 1,
0.7205584, -0.126338, 2.457382, 0.7294118, 0, 1, 1,
0.7212757, 2.460672, -0.1516106, 0.7333333, 0, 1, 1,
0.7222044, -0.5478508, 3.218765, 0.7411765, 0, 1, 1,
0.7228604, 0.4854362, 2.465489, 0.7450981, 0, 1, 1,
0.7234682, -0.2691162, 1.018608, 0.7529412, 0, 1, 1,
0.7237227, 0.03603495, 3.689105, 0.7568628, 0, 1, 1,
0.7305505, -0.3703412, 2.008706, 0.7647059, 0, 1, 1,
0.7330781, -0.4965822, 1.639765, 0.7686275, 0, 1, 1,
0.7351999, 0.06058516, 3.208746, 0.7764706, 0, 1, 1,
0.7392342, -1.170107, 3.154459, 0.7803922, 0, 1, 1,
0.7415624, 0.496137, 0.527704, 0.7882353, 0, 1, 1,
0.7483891, -0.3455934, 2.546726, 0.7921569, 0, 1, 1,
0.7546018, -1.298981, 3.656628, 0.8, 0, 1, 1,
0.7548811, -0.2657541, 0.6081562, 0.8078431, 0, 1, 1,
0.7634267, 0.7312245, -0.2323125, 0.8117647, 0, 1, 1,
0.7664464, -0.7562711, 2.521885, 0.8196079, 0, 1, 1,
0.7766527, -0.8693888, 5.324207, 0.8235294, 0, 1, 1,
0.788901, 1.144427, 0.7735659, 0.8313726, 0, 1, 1,
0.7898736, 1.288686, -0.2387999, 0.8352941, 0, 1, 1,
0.7927721, 0.113416, 2.153794, 0.8431373, 0, 1, 1,
0.7930931, -0.07527177, 1.88925, 0.8470588, 0, 1, 1,
0.793603, -0.5240312, 0.9907477, 0.854902, 0, 1, 1,
0.796872, -1.455414, 3.432705, 0.8588235, 0, 1, 1,
0.798236, -1.151509, 1.393728, 0.8666667, 0, 1, 1,
0.7988767, -1.194958, 1.062026, 0.8705882, 0, 1, 1,
0.8029995, -0.4882548, -0.06881474, 0.8784314, 0, 1, 1,
0.8040538, 1.319225, 1.593388, 0.8823529, 0, 1, 1,
0.8155941, 0.3827457, 0.5849919, 0.8901961, 0, 1, 1,
0.8168179, -1.461229, 3.671827, 0.8941177, 0, 1, 1,
0.8174055, -0.6767129, 0.09522873, 0.9019608, 0, 1, 1,
0.8179893, -1.20675, 2.642014, 0.9098039, 0, 1, 1,
0.8241192, -1.492721, 2.136431, 0.9137255, 0, 1, 1,
0.8306306, 0.6633614, 1.604157, 0.9215686, 0, 1, 1,
0.8343877, 2.092863, -0.1635113, 0.9254902, 0, 1, 1,
0.8373498, 1.387818, 1.023583, 0.9333333, 0, 1, 1,
0.842775, 0.969399, 0.2266525, 0.9372549, 0, 1, 1,
0.8454884, -1.044841, 1.739527, 0.945098, 0, 1, 1,
0.8510155, -0.6835796, 3.343954, 0.9490196, 0, 1, 1,
0.8544479, 0.2062206, 2.427288, 0.9568627, 0, 1, 1,
0.8561084, 1.378204, 0.9218064, 0.9607843, 0, 1, 1,
0.8565148, -1.205293, 3.378155, 0.9686275, 0, 1, 1,
0.8578259, 0.3112536, 1.500789, 0.972549, 0, 1, 1,
0.8644746, -0.03845193, 2.302084, 0.9803922, 0, 1, 1,
0.8672277, 0.4174435, 1.486143, 0.9843137, 0, 1, 1,
0.8765281, 0.00549614, 4.127094, 0.9921569, 0, 1, 1,
0.8901605, -0.4671455, 2.585169, 0.9960784, 0, 1, 1,
0.8962906, -0.1566932, 0.3664584, 1, 0, 0.9960784, 1,
0.9072517, -0.1764891, 2.334056, 1, 0, 0.9882353, 1,
0.9132642, 0.857241, 1.645109, 1, 0, 0.9843137, 1,
0.9245137, -0.616073, 2.066972, 1, 0, 0.9764706, 1,
0.9250991, -0.491475, 2.78865, 1, 0, 0.972549, 1,
0.9263773, -0.01020568, 2.774201, 1, 0, 0.9647059, 1,
0.9277456, 0.4207139, -0.7033368, 1, 0, 0.9607843, 1,
0.9345582, 0.155115, 0.9559513, 1, 0, 0.9529412, 1,
0.9368325, -0.971536, 3.089095, 1, 0, 0.9490196, 1,
0.9374813, 0.0290189, 2.054217, 1, 0, 0.9411765, 1,
0.9382188, -0.4747808, 1.123356, 1, 0, 0.9372549, 1,
0.9401131, 1.174791, 0.2182419, 1, 0, 0.9294118, 1,
0.946708, 0.7640944, 2.596902, 1, 0, 0.9254902, 1,
0.9560671, 0.6843275, 0.9349685, 1, 0, 0.9176471, 1,
0.9616208, -0.9866, 0.9452653, 1, 0, 0.9137255, 1,
0.9680409, -0.06992699, 2.050157, 1, 0, 0.9058824, 1,
0.9776172, -1.294169, 3.239882, 1, 0, 0.9019608, 1,
0.9822655, -0.672819, 1.436672, 1, 0, 0.8941177, 1,
0.9845443, -1.253624, 3.26249, 1, 0, 0.8862745, 1,
0.9989227, 2.587518, 1.438437, 1, 0, 0.8823529, 1,
1.000185, 0.2961679, 2.139406, 1, 0, 0.8745098, 1,
1.012469, 2.174697, 0.5892889, 1, 0, 0.8705882, 1,
1.019945, -0.8468243, -0.7192705, 1, 0, 0.8627451, 1,
1.021551, -1.941316, 2.395719, 1, 0, 0.8588235, 1,
1.026477, 0.5140813, 3.30155, 1, 0, 0.8509804, 1,
1.029891, 1.340729, 0.07926323, 1, 0, 0.8470588, 1,
1.031769, 0.2900278, 2.721286, 1, 0, 0.8392157, 1,
1.03629, -0.800655, 1.868988, 1, 0, 0.8352941, 1,
1.038197, -1.548191, 3.705991, 1, 0, 0.827451, 1,
1.047941, -0.1578765, 1.943149, 1, 0, 0.8235294, 1,
1.049114, 0.9418246, 1.383047, 1, 0, 0.8156863, 1,
1.054604, 0.2852519, 0.09827267, 1, 0, 0.8117647, 1,
1.065157, -0.4586305, 2.991636, 1, 0, 0.8039216, 1,
1.06701, 0.9191458, 0.9086758, 1, 0, 0.7960784, 1,
1.070714, -0.3269234, -0.0006761505, 1, 0, 0.7921569, 1,
1.072205, -2.682212, 3.853443, 1, 0, 0.7843137, 1,
1.074538, 0.06095543, -0.02688102, 1, 0, 0.7803922, 1,
1.075903, -1.831199, 2.331, 1, 0, 0.772549, 1,
1.079226, -0.5333357, 0.02631477, 1, 0, 0.7686275, 1,
1.085369, 1.923489, 1.178496, 1, 0, 0.7607843, 1,
1.092094, -0.3711593, 0.8805699, 1, 0, 0.7568628, 1,
1.103791, 2.016018, 0.1298346, 1, 0, 0.7490196, 1,
1.107743, 0.2763889, 0.9768733, 1, 0, 0.7450981, 1,
1.109249, -0.4174551, 2.857463, 1, 0, 0.7372549, 1,
1.116211, -0.7401752, 2.970928, 1, 0, 0.7333333, 1,
1.12239, 1.807124, 1.010676, 1, 0, 0.7254902, 1,
1.129482, 0.4115007, 0.4974978, 1, 0, 0.7215686, 1,
1.139837, -0.5473809, 3.453601, 1, 0, 0.7137255, 1,
1.14038, -0.2864957, 3.549044, 1, 0, 0.7098039, 1,
1.140414, -1.273781, 2.77927, 1, 0, 0.7019608, 1,
1.144393, -0.7412484, 2.054085, 1, 0, 0.6941177, 1,
1.159912, -0.6043753, 1.255641, 1, 0, 0.6901961, 1,
1.165147, -0.139513, 1.773889, 1, 0, 0.682353, 1,
1.170702, -0.189198, 2.061424, 1, 0, 0.6784314, 1,
1.179487, -0.2040133, 1.541146, 1, 0, 0.6705883, 1,
1.184857, 0.4911491, 2.788806, 1, 0, 0.6666667, 1,
1.193983, 0.2490667, 3.030423, 1, 0, 0.6588235, 1,
1.194251, 1.363894, 1.662032, 1, 0, 0.654902, 1,
1.195649, -1.653628, 2.457731, 1, 0, 0.6470588, 1,
1.197541, 0.7534314, 1.800843, 1, 0, 0.6431373, 1,
1.205258, 1.167598, -0.8116521, 1, 0, 0.6352941, 1,
1.209781, 0.01044001, 2.682742, 1, 0, 0.6313726, 1,
1.2175, -0.3245693, 1.445112, 1, 0, 0.6235294, 1,
1.219777, -0.4997792, 3.279003, 1, 0, 0.6196079, 1,
1.222448, -1.354178, 1.583617, 1, 0, 0.6117647, 1,
1.239579, -0.5423267, -0.05177226, 1, 0, 0.6078432, 1,
1.242948, -1.678177, 3.206683, 1, 0, 0.6, 1,
1.2441, 0.3072249, 2.196097, 1, 0, 0.5921569, 1,
1.244723, -0.6670069, 3.010034, 1, 0, 0.5882353, 1,
1.24768, 1.330752, -0.07691817, 1, 0, 0.5803922, 1,
1.250436, -0.5955071, 3.062614, 1, 0, 0.5764706, 1,
1.253012, -0.2342182, 1.151724, 1, 0, 0.5686275, 1,
1.255767, 1.955817, 0.9814746, 1, 0, 0.5647059, 1,
1.259413, 0.8862804, 0.3639418, 1, 0, 0.5568628, 1,
1.261571, 0.8551629, 0.256112, 1, 0, 0.5529412, 1,
1.268162, -0.7867274, 2.276591, 1, 0, 0.5450981, 1,
1.283141, 1.031672, 1.594718, 1, 0, 0.5411765, 1,
1.283857, 0.8754556, -1.309988, 1, 0, 0.5333334, 1,
1.28968, -0.2979884, 4.20831, 1, 0, 0.5294118, 1,
1.302187, 0.02333416, 2.130428, 1, 0, 0.5215687, 1,
1.305721, -0.9722735, 1.466242, 1, 0, 0.5176471, 1,
1.305799, -0.9858484, 0.6881459, 1, 0, 0.509804, 1,
1.306354, -0.4608596, 1.947301, 1, 0, 0.5058824, 1,
1.310915, 0.8465768, 0.07462832, 1, 0, 0.4980392, 1,
1.319185, 1.482191, -0.2187857, 1, 0, 0.4901961, 1,
1.319402, 0.001939791, 2.119733, 1, 0, 0.4862745, 1,
1.321888, -0.789589, 3.540892, 1, 0, 0.4784314, 1,
1.325682, -2.106069, 3.461425, 1, 0, 0.4745098, 1,
1.330314, 0.5897639, 0.6179129, 1, 0, 0.4666667, 1,
1.338512, -0.2910297, 0.4183441, 1, 0, 0.4627451, 1,
1.350276, 0.2131798, 2.683906, 1, 0, 0.454902, 1,
1.358761, 0.8133972, 1.058333, 1, 0, 0.4509804, 1,
1.360822, -1.363866, 2.981233, 1, 0, 0.4431373, 1,
1.36681, -1.943108, 4.377946, 1, 0, 0.4392157, 1,
1.39032, 0.5377557, 1.840671, 1, 0, 0.4313726, 1,
1.40091, -0.3729138, 1.979771, 1, 0, 0.427451, 1,
1.401862, -1.327858, 2.058652, 1, 0, 0.4196078, 1,
1.402163, 0.8280571, 0.7134407, 1, 0, 0.4156863, 1,
1.406839, -0.1406991, 0.941952, 1, 0, 0.4078431, 1,
1.452614, -0.1651555, 2.335478, 1, 0, 0.4039216, 1,
1.466268, -0.04549887, 1.311009, 1, 0, 0.3960784, 1,
1.467116, -1.088246, 1.984669, 1, 0, 0.3882353, 1,
1.472274, 0.1377837, 1.797301, 1, 0, 0.3843137, 1,
1.482498, -0.5275056, 2.036777, 1, 0, 0.3764706, 1,
1.485852, -1.504712, 2.325735, 1, 0, 0.372549, 1,
1.486728, 1.996134, -1.069884, 1, 0, 0.3647059, 1,
1.500613, -0.2661006, 3.151929, 1, 0, 0.3607843, 1,
1.514293, 0.8162671, 0.9794824, 1, 0, 0.3529412, 1,
1.530952, -0.8438633, 0.4970932, 1, 0, 0.3490196, 1,
1.537556, 0.9284056, 1.92753, 1, 0, 0.3411765, 1,
1.537987, 1.202421, 1.980631, 1, 0, 0.3372549, 1,
1.541001, 0.00766118, -0.4314945, 1, 0, 0.3294118, 1,
1.548069, -0.4169422, 0.590435, 1, 0, 0.3254902, 1,
1.551286, -1.180315, 3.085908, 1, 0, 0.3176471, 1,
1.554953, 1.126697, 1.637704, 1, 0, 0.3137255, 1,
1.568496, 0.5146121, 1.428836, 1, 0, 0.3058824, 1,
1.592806, 1.223461, 1.159761, 1, 0, 0.2980392, 1,
1.625415, 0.4732201, 2.13851, 1, 0, 0.2941177, 1,
1.628027, -0.3880965, 2.582988, 1, 0, 0.2862745, 1,
1.65502, -0.4619317, 1.338737, 1, 0, 0.282353, 1,
1.656437, 0.3601589, 0.8758668, 1, 0, 0.2745098, 1,
1.665259, -0.6205068, 2.383314, 1, 0, 0.2705882, 1,
1.668561, 0.1778799, 1.467103, 1, 0, 0.2627451, 1,
1.676498, 0.05687312, 1.815166, 1, 0, 0.2588235, 1,
1.679374, 0.9934613, 3.114965, 1, 0, 0.2509804, 1,
1.679943, -0.5604728, 1.835029, 1, 0, 0.2470588, 1,
1.682401, 0.1508872, 1.843992, 1, 0, 0.2392157, 1,
1.705346, -1.124522, 2.328195, 1, 0, 0.2352941, 1,
1.724073, 0.424154, 1.578868, 1, 0, 0.227451, 1,
1.734084, -1.497458, 3.825544, 1, 0, 0.2235294, 1,
1.739834, 0.1730383, 1.067178, 1, 0, 0.2156863, 1,
1.743696, -0.9505616, 1.097889, 1, 0, 0.2117647, 1,
1.749076, 0.3653986, 1.263495, 1, 0, 0.2039216, 1,
1.766945, 0.1103344, 1.744776, 1, 0, 0.1960784, 1,
1.769755, 0.03095928, 1.546659, 1, 0, 0.1921569, 1,
1.771413, -1.938987, 2.405939, 1, 0, 0.1843137, 1,
1.774504, -0.2942397, 1.455765, 1, 0, 0.1803922, 1,
1.778438, -0.3814323, 2.162695, 1, 0, 0.172549, 1,
1.793155, -0.5128814, 2.287282, 1, 0, 0.1686275, 1,
1.797881, -1.353859, 2.063332, 1, 0, 0.1607843, 1,
1.809261, -0.7127482, 1.828628, 1, 0, 0.1568628, 1,
1.812164, -0.2644223, 0.108171, 1, 0, 0.1490196, 1,
1.828625, -0.0538701, 2.577203, 1, 0, 0.145098, 1,
1.85638, 1.259849, 0.01846983, 1, 0, 0.1372549, 1,
1.87525, -0.1061742, 2.734163, 1, 0, 0.1333333, 1,
1.887726, -0.009195689, 2.150056, 1, 0, 0.1254902, 1,
1.898827, 0.4978791, 2.77535, 1, 0, 0.1215686, 1,
2.002335, 0.3865285, 0.7541842, 1, 0, 0.1137255, 1,
2.080588, 0.5993826, 0.8613653, 1, 0, 0.1098039, 1,
2.099967, 0.9398694, 0.6858084, 1, 0, 0.1019608, 1,
2.109501, 2.079721, 0.3709452, 1, 0, 0.09411765, 1,
2.143066, 0.4214848, -0.2934469, 1, 0, 0.09019608, 1,
2.147626, 1.063749, 1.870764, 1, 0, 0.08235294, 1,
2.151752, 0.2042148, 2.234501, 1, 0, 0.07843138, 1,
2.166241, -0.01481513, 0.9711892, 1, 0, 0.07058824, 1,
2.224484, -0.2829286, 0.8355219, 1, 0, 0.06666667, 1,
2.275799, -0.3103751, 1.904182, 1, 0, 0.05882353, 1,
2.276917, -0.4965985, 2.206269, 1, 0, 0.05490196, 1,
2.299708, -1.410694, 1.765548, 1, 0, 0.04705882, 1,
2.303745, -2.16025, 1.775806, 1, 0, 0.04313726, 1,
2.436205, 0.3896293, -0.7483241, 1, 0, 0.03529412, 1,
2.441122, 0.9737108, 0.1967671, 1, 0, 0.03137255, 1,
2.448146, -0.5586696, 1.854227, 1, 0, 0.02352941, 1,
2.465754, 0.8299149, 2.024557, 1, 0, 0.01960784, 1,
2.524864, 0.3056116, 0.8038235, 1, 0, 0.01176471, 1,
2.953984, 0.4436742, -0.3169909, 1, 0, 0.007843138, 1
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
-0.2099912, -4.58109, -7.930229, 0, -0.5, 0.5, 0.5,
-0.2099912, -4.58109, -7.930229, 1, -0.5, 0.5, 0.5,
-0.2099912, -4.58109, -7.930229, 1, 1.5, 0.5, 0.5,
-0.2099912, -4.58109, -7.930229, 0, 1.5, 0.5, 0.5
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
-4.446554, -0.003472328, -7.930229, 0, -0.5, 0.5, 0.5,
-4.446554, -0.003472328, -7.930229, 1, -0.5, 0.5, 0.5,
-4.446554, -0.003472328, -7.930229, 1, 1.5, 0.5, 0.5,
-4.446554, -0.003472328, -7.930229, 0, 1.5, 0.5, 0.5
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
-4.446554, -4.58109, -0.3425038, 0, -0.5, 0.5, 0.5,
-4.446554, -4.58109, -0.3425038, 1, -0.5, 0.5, 0.5,
-4.446554, -4.58109, -0.3425038, 1, 1.5, 0.5, 0.5,
-4.446554, -4.58109, -0.3425038, 0, 1.5, 0.5, 0.5
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
-3, -3.524717, -6.179216,
2, -3.524717, -6.179216,
-3, -3.524717, -6.179216,
-3, -3.700779, -6.471051,
-2, -3.524717, -6.179216,
-2, -3.700779, -6.471051,
-1, -3.524717, -6.179216,
-1, -3.700779, -6.471051,
0, -3.524717, -6.179216,
0, -3.700779, -6.471051,
1, -3.524717, -6.179216,
1, -3.700779, -6.471051,
2, -3.524717, -6.179216,
2, -3.700779, -6.471051
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
-3, -4.052903, -7.054722, 0, -0.5, 0.5, 0.5,
-3, -4.052903, -7.054722, 1, -0.5, 0.5, 0.5,
-3, -4.052903, -7.054722, 1, 1.5, 0.5, 0.5,
-3, -4.052903, -7.054722, 0, 1.5, 0.5, 0.5,
-2, -4.052903, -7.054722, 0, -0.5, 0.5, 0.5,
-2, -4.052903, -7.054722, 1, -0.5, 0.5, 0.5,
-2, -4.052903, -7.054722, 1, 1.5, 0.5, 0.5,
-2, -4.052903, -7.054722, 0, 1.5, 0.5, 0.5,
-1, -4.052903, -7.054722, 0, -0.5, 0.5, 0.5,
-1, -4.052903, -7.054722, 1, -0.5, 0.5, 0.5,
-1, -4.052903, -7.054722, 1, 1.5, 0.5, 0.5,
-1, -4.052903, -7.054722, 0, 1.5, 0.5, 0.5,
0, -4.052903, -7.054722, 0, -0.5, 0.5, 0.5,
0, -4.052903, -7.054722, 1, -0.5, 0.5, 0.5,
0, -4.052903, -7.054722, 1, 1.5, 0.5, 0.5,
0, -4.052903, -7.054722, 0, 1.5, 0.5, 0.5,
1, -4.052903, -7.054722, 0, -0.5, 0.5, 0.5,
1, -4.052903, -7.054722, 1, -0.5, 0.5, 0.5,
1, -4.052903, -7.054722, 1, 1.5, 0.5, 0.5,
1, -4.052903, -7.054722, 0, 1.5, 0.5, 0.5,
2, -4.052903, -7.054722, 0, -0.5, 0.5, 0.5,
2, -4.052903, -7.054722, 1, -0.5, 0.5, 0.5,
2, -4.052903, -7.054722, 1, 1.5, 0.5, 0.5,
2, -4.052903, -7.054722, 0, 1.5, 0.5, 0.5
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
-3.468886, -3, -6.179216,
-3.468886, 3, -6.179216,
-3.468886, -3, -6.179216,
-3.631831, -3, -6.471051,
-3.468886, -2, -6.179216,
-3.631831, -2, -6.471051,
-3.468886, -1, -6.179216,
-3.631831, -1, -6.471051,
-3.468886, 0, -6.179216,
-3.631831, 0, -6.471051,
-3.468886, 1, -6.179216,
-3.631831, 1, -6.471051,
-3.468886, 2, -6.179216,
-3.631831, 2, -6.471051,
-3.468886, 3, -6.179216,
-3.631831, 3, -6.471051
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
-3.95772, -3, -7.054722, 0, -0.5, 0.5, 0.5,
-3.95772, -3, -7.054722, 1, -0.5, 0.5, 0.5,
-3.95772, -3, -7.054722, 1, 1.5, 0.5, 0.5,
-3.95772, -3, -7.054722, 0, 1.5, 0.5, 0.5,
-3.95772, -2, -7.054722, 0, -0.5, 0.5, 0.5,
-3.95772, -2, -7.054722, 1, -0.5, 0.5, 0.5,
-3.95772, -2, -7.054722, 1, 1.5, 0.5, 0.5,
-3.95772, -2, -7.054722, 0, 1.5, 0.5, 0.5,
-3.95772, -1, -7.054722, 0, -0.5, 0.5, 0.5,
-3.95772, -1, -7.054722, 1, -0.5, 0.5, 0.5,
-3.95772, -1, -7.054722, 1, 1.5, 0.5, 0.5,
-3.95772, -1, -7.054722, 0, 1.5, 0.5, 0.5,
-3.95772, 0, -7.054722, 0, -0.5, 0.5, 0.5,
-3.95772, 0, -7.054722, 1, -0.5, 0.5, 0.5,
-3.95772, 0, -7.054722, 1, 1.5, 0.5, 0.5,
-3.95772, 0, -7.054722, 0, 1.5, 0.5, 0.5,
-3.95772, 1, -7.054722, 0, -0.5, 0.5, 0.5,
-3.95772, 1, -7.054722, 1, -0.5, 0.5, 0.5,
-3.95772, 1, -7.054722, 1, 1.5, 0.5, 0.5,
-3.95772, 1, -7.054722, 0, 1.5, 0.5, 0.5,
-3.95772, 2, -7.054722, 0, -0.5, 0.5, 0.5,
-3.95772, 2, -7.054722, 1, -0.5, 0.5, 0.5,
-3.95772, 2, -7.054722, 1, 1.5, 0.5, 0.5,
-3.95772, 2, -7.054722, 0, 1.5, 0.5, 0.5,
-3.95772, 3, -7.054722, 0, -0.5, 0.5, 0.5,
-3.95772, 3, -7.054722, 1, -0.5, 0.5, 0.5,
-3.95772, 3, -7.054722, 1, 1.5, 0.5, 0.5,
-3.95772, 3, -7.054722, 0, 1.5, 0.5, 0.5
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
-3.468886, -3.524717, -6,
-3.468886, -3.524717, 4,
-3.468886, -3.524717, -6,
-3.631831, -3.700779, -6,
-3.468886, -3.524717, -4,
-3.631831, -3.700779, -4,
-3.468886, -3.524717, -2,
-3.631831, -3.700779, -2,
-3.468886, -3.524717, 0,
-3.631831, -3.700779, 0,
-3.468886, -3.524717, 2,
-3.631831, -3.700779, 2,
-3.468886, -3.524717, 4,
-3.631831, -3.700779, 4
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
-3.95772, -4.052903, -6, 0, -0.5, 0.5, 0.5,
-3.95772, -4.052903, -6, 1, -0.5, 0.5, 0.5,
-3.95772, -4.052903, -6, 1, 1.5, 0.5, 0.5,
-3.95772, -4.052903, -6, 0, 1.5, 0.5, 0.5,
-3.95772, -4.052903, -4, 0, -0.5, 0.5, 0.5,
-3.95772, -4.052903, -4, 1, -0.5, 0.5, 0.5,
-3.95772, -4.052903, -4, 1, 1.5, 0.5, 0.5,
-3.95772, -4.052903, -4, 0, 1.5, 0.5, 0.5,
-3.95772, -4.052903, -2, 0, -0.5, 0.5, 0.5,
-3.95772, -4.052903, -2, 1, -0.5, 0.5, 0.5,
-3.95772, -4.052903, -2, 1, 1.5, 0.5, 0.5,
-3.95772, -4.052903, -2, 0, 1.5, 0.5, 0.5,
-3.95772, -4.052903, 0, 0, -0.5, 0.5, 0.5,
-3.95772, -4.052903, 0, 1, -0.5, 0.5, 0.5,
-3.95772, -4.052903, 0, 1, 1.5, 0.5, 0.5,
-3.95772, -4.052903, 0, 0, 1.5, 0.5, 0.5,
-3.95772, -4.052903, 2, 0, -0.5, 0.5, 0.5,
-3.95772, -4.052903, 2, 1, -0.5, 0.5, 0.5,
-3.95772, -4.052903, 2, 1, 1.5, 0.5, 0.5,
-3.95772, -4.052903, 2, 0, 1.5, 0.5, 0.5,
-3.95772, -4.052903, 4, 0, -0.5, 0.5, 0.5,
-3.95772, -4.052903, 4, 1, -0.5, 0.5, 0.5,
-3.95772, -4.052903, 4, 1, 1.5, 0.5, 0.5,
-3.95772, -4.052903, 4, 0, 1.5, 0.5, 0.5
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
-3.468886, -3.524717, -6.179216,
-3.468886, 3.517772, -6.179216,
-3.468886, -3.524717, 5.494208,
-3.468886, 3.517772, 5.494208,
-3.468886, -3.524717, -6.179216,
-3.468886, -3.524717, 5.494208,
-3.468886, 3.517772, -6.179216,
-3.468886, 3.517772, 5.494208,
-3.468886, -3.524717, -6.179216,
3.048903, -3.524717, -6.179216,
-3.468886, -3.524717, 5.494208,
3.048903, -3.524717, 5.494208,
-3.468886, 3.517772, -6.179216,
3.048903, 3.517772, -6.179216,
-3.468886, 3.517772, 5.494208,
3.048903, 3.517772, 5.494208,
3.048903, -3.524717, -6.179216,
3.048903, 3.517772, -6.179216,
3.048903, -3.524717, 5.494208,
3.048903, 3.517772, 5.494208,
3.048903, -3.524717, -6.179216,
3.048903, -3.524717, 5.494208,
3.048903, 3.517772, -6.179216,
3.048903, 3.517772, 5.494208
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
var radius = 8.069064;
var distance = 35.90018;
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
mvMatrix.translate( 0.2099912, 0.003472328, 0.3425038 );
mvMatrix.scale( 1.338557, 1.238828, 0.7473754 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.90018);
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
merphos<-read.table("merphos.xyz")
```

```
## Error in read.table("merphos.xyz"): no lines available in input
```

```r
x<-merphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'merphos' not found
```

```r
y<-merphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'merphos' not found
```

```r
z<-merphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'merphos' not found
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
-3.373967, -0.1857188, -3.418756, 0, 0, 1, 1, 1,
-2.881888, -0.2267034, -1.656353, 1, 0, 0, 1, 1,
-2.741585, 1.274764, -0.1120184, 1, 0, 0, 1, 1,
-2.444286, 0.7062505, -0.5613331, 1, 0, 0, 1, 1,
-2.423181, 0.5382085, -1.162951, 1, 0, 0, 1, 1,
-2.386582, -0.2637656, -1.68863, 1, 0, 0, 1, 1,
-2.364304, 0.4733309, 0.3636998, 0, 0, 0, 1, 1,
-2.335758, -0.8299214, 0.1931209, 0, 0, 0, 1, 1,
-2.264449, 1.530075, -0.8710979, 0, 0, 0, 1, 1,
-2.245239, -1.31929, -2.066913, 0, 0, 0, 1, 1,
-2.237213, 0.1741882, -0.5884239, 0, 0, 0, 1, 1,
-2.224461, -0.0988123, -1.734986, 0, 0, 0, 1, 1,
-2.208158, 0.4473774, -1.183141, 0, 0, 0, 1, 1,
-2.205246, 0.6314632, -0.8023376, 1, 1, 1, 1, 1,
-2.20167, 0.6518365, -2.384692, 1, 1, 1, 1, 1,
-2.162167, -0.7829415, -1.486765, 1, 1, 1, 1, 1,
-2.146542, -0.7139519, -1.167706, 1, 1, 1, 1, 1,
-2.138558, -0.6468717, -2.131887, 1, 1, 1, 1, 1,
-2.122271, -0.4777069, -1.666701, 1, 1, 1, 1, 1,
-2.113115, -0.781701, -2.994802, 1, 1, 1, 1, 1,
-2.104922, -1.327785, -1.10828, 1, 1, 1, 1, 1,
-2.104307, 0.09021018, -0.4081545, 1, 1, 1, 1, 1,
-2.098053, 0.9526671, -3.134423, 1, 1, 1, 1, 1,
-2.085979, 2.006285, -2.253595, 1, 1, 1, 1, 1,
-2.07882, 1.733117, -0.627101, 1, 1, 1, 1, 1,
-2.064212, -0.8919297, -1.948366, 1, 1, 1, 1, 1,
-2.062368, -1.515918, -4.097471, 1, 1, 1, 1, 1,
-2.059202, -0.861569, -1.954787, 1, 1, 1, 1, 1,
-2.008575, -0.8788395, -3.560929, 0, 0, 1, 1, 1,
-2.005428, -1.631258, -4.166593, 1, 0, 0, 1, 1,
-2.004856, -0.5308052, -2.288144, 1, 0, 0, 1, 1,
-1.972387, -1.042733, -2.996486, 1, 0, 0, 1, 1,
-1.960954, 0.436778, 0.01704233, 1, 0, 0, 1, 1,
-1.930912, -0.1335434, -0.1901615, 1, 0, 0, 1, 1,
-1.920597, -1.580535, -1.19404, 0, 0, 0, 1, 1,
-1.920525, -2.370148, -2.69212, 0, 0, 0, 1, 1,
-1.918227, -1.407096, -1.149801, 0, 0, 0, 1, 1,
-1.912719, 0.9872253, -2.211682, 0, 0, 0, 1, 1,
-1.88951, 1.677055, 0.1457998, 0, 0, 0, 1, 1,
-1.871617, -1.206492, -1.137592, 0, 0, 0, 1, 1,
-1.866872, 1.217513, -2.839337, 0, 0, 0, 1, 1,
-1.861866, -0.3466975, 0.6485289, 1, 1, 1, 1, 1,
-1.855537, 0.8377759, -1.545666, 1, 1, 1, 1, 1,
-1.839699, -0.9382964, -1.206038, 1, 1, 1, 1, 1,
-1.816166, -1.616184, -2.489636, 1, 1, 1, 1, 1,
-1.814987, -0.414889, -2.65378, 1, 1, 1, 1, 1,
-1.813395, 0.5919228, -0.9248187, 1, 1, 1, 1, 1,
-1.808631, -1.372444, -1.471884, 1, 1, 1, 1, 1,
-1.785783, 1.037987, -2.513886, 1, 1, 1, 1, 1,
-1.781768, 1.401739, -0.4173883, 1, 1, 1, 1, 1,
-1.770842, 0.02999114, -0.5217846, 1, 1, 1, 1, 1,
-1.764897, 1.013756, -0.1638342, 1, 1, 1, 1, 1,
-1.738423, 1.471649, -1.253676, 1, 1, 1, 1, 1,
-1.730741, 0.02888372, -3.547078, 1, 1, 1, 1, 1,
-1.718547, 0.3791618, 0.1121811, 1, 1, 1, 1, 1,
-1.713137, -0.3838175, -1.149943, 1, 1, 1, 1, 1,
-1.71057, 0.5545934, 0.6877854, 0, 0, 1, 1, 1,
-1.702547, 1.902917, -1.429875, 1, 0, 0, 1, 1,
-1.701999, -0.4824677, -1.615129, 1, 0, 0, 1, 1,
-1.697192, -1.466397, -0.7950947, 1, 0, 0, 1, 1,
-1.694613, 0.2628491, -3.511835, 1, 0, 0, 1, 1,
-1.687358, 0.662118, -0.3028979, 1, 0, 0, 1, 1,
-1.687215, 0.7690312, -2.055367, 0, 0, 0, 1, 1,
-1.680023, 0.1663997, -2.301938, 0, 0, 0, 1, 1,
-1.673177, -0.4268842, -1.321895, 0, 0, 0, 1, 1,
-1.671978, -0.5894477, 0.6480221, 0, 0, 0, 1, 1,
-1.670623, 0.1729721, -1.374995, 0, 0, 0, 1, 1,
-1.664185, -1.173023, -1.420103, 0, 0, 0, 1, 1,
-1.656046, -1.266789, -1.680559, 0, 0, 0, 1, 1,
-1.653761, 1.164799, -2.04491, 1, 1, 1, 1, 1,
-1.644105, -0.4071116, -2.606418, 1, 1, 1, 1, 1,
-1.639901, -1.177881, -1.89587, 1, 1, 1, 1, 1,
-1.62622, -0.9904506, -2.756642, 1, 1, 1, 1, 1,
-1.612315, -0.1429259, -0.1391043, 1, 1, 1, 1, 1,
-1.601331, -1.799619, -2.235, 1, 1, 1, 1, 1,
-1.601292, 0.2716222, -1.79901, 1, 1, 1, 1, 1,
-1.596833, 0.9687541, -2.345211, 1, 1, 1, 1, 1,
-1.591483, 1.445139, -0.8540128, 1, 1, 1, 1, 1,
-1.586757, 0.7309737, -1.194338, 1, 1, 1, 1, 1,
-1.585779, 0.01911569, -2.369129, 1, 1, 1, 1, 1,
-1.582316, 0.4082194, -2.02236, 1, 1, 1, 1, 1,
-1.577388, 1.243575, -0.9170027, 1, 1, 1, 1, 1,
-1.570807, 0.1854063, -1.656116, 1, 1, 1, 1, 1,
-1.558037, 1.071367, -0.9831215, 1, 1, 1, 1, 1,
-1.557976, -1.342684, -2.500563, 0, 0, 1, 1, 1,
-1.550271, -0.5618217, -1.630324, 1, 0, 0, 1, 1,
-1.54283, -0.2049757, -0.6194124, 1, 0, 0, 1, 1,
-1.531305, 1.028603, -1.47007, 1, 0, 0, 1, 1,
-1.525495, -1.087716, 0.2058516, 1, 0, 0, 1, 1,
-1.524494, -0.7209716, -2.223904, 1, 0, 0, 1, 1,
-1.523519, 0.4961307, -0.9139368, 0, 0, 0, 1, 1,
-1.509639, -1.245991, -3.445676, 0, 0, 0, 1, 1,
-1.502767, -0.4756952, -1.159335, 0, 0, 0, 1, 1,
-1.5017, 0.03756416, 0.09947557, 0, 0, 0, 1, 1,
-1.494986, 1.294118, -0.1053339, 0, 0, 0, 1, 1,
-1.490615, 0.1254478, -2.065127, 0, 0, 0, 1, 1,
-1.476953, -0.9187821, -2.378064, 0, 0, 0, 1, 1,
-1.474613, 0.9031778, 1.236277, 1, 1, 1, 1, 1,
-1.474401, 0.4337412, -4.220908, 1, 1, 1, 1, 1,
-1.47228, 0.3554107, 0.609949, 1, 1, 1, 1, 1,
-1.462909, -0.9347711, -2.185806, 1, 1, 1, 1, 1,
-1.461554, 1.938598, -0.513659, 1, 1, 1, 1, 1,
-1.448503, 0.2177896, -0.9970978, 1, 1, 1, 1, 1,
-1.438611, 0.791366, -1.917226, 1, 1, 1, 1, 1,
-1.419333, -2.007909, -2.3957, 1, 1, 1, 1, 1,
-1.417457, -0.4437231, -0.8840442, 1, 1, 1, 1, 1,
-1.397058, 0.04310855, -2.954339, 1, 1, 1, 1, 1,
-1.385797, -0.1690349, -2.984285, 1, 1, 1, 1, 1,
-1.375447, -0.2624974, -2.183553, 1, 1, 1, 1, 1,
-1.369449, -1.064638, -3.597698, 1, 1, 1, 1, 1,
-1.3679, -0.8109505, -3.181107, 1, 1, 1, 1, 1,
-1.367385, -0.1018058, -0.6948795, 1, 1, 1, 1, 1,
-1.364834, -0.3836524, -1.510899, 0, 0, 1, 1, 1,
-1.352927, -0.8729934, -3.533857, 1, 0, 0, 1, 1,
-1.344225, -0.9379966, -2.768755, 1, 0, 0, 1, 1,
-1.341854, 0.404207, -1.948031, 1, 0, 0, 1, 1,
-1.331959, -0.7633079, -0.5708876, 1, 0, 0, 1, 1,
-1.300983, -2.437075, -2.594728, 1, 0, 0, 1, 1,
-1.296955, -0.01380122, -2.206711, 0, 0, 0, 1, 1,
-1.290829, -1.190823, -1.337416, 0, 0, 0, 1, 1,
-1.287759, -0.001931238, -2.519165, 0, 0, 0, 1, 1,
-1.286807, -2.750916, -1.865269, 0, 0, 0, 1, 1,
-1.28599, -0.04395072, -1.11677, 0, 0, 0, 1, 1,
-1.280401, -2.592706, -1.528535, 0, 0, 0, 1, 1,
-1.279811, -0.2045139, -2.210505, 0, 0, 0, 1, 1,
-1.278986, -3.422156, -3.500473, 1, 1, 1, 1, 1,
-1.277371, -0.07307737, -0.9537517, 1, 1, 1, 1, 1,
-1.276792, 1.570117, -1.721855, 1, 1, 1, 1, 1,
-1.27348, 0.4972624, -0.1239977, 1, 1, 1, 1, 1,
-1.263703, 2.025058, -1.389224, 1, 1, 1, 1, 1,
-1.260636, 0.4714605, -1.060697, 1, 1, 1, 1, 1,
-1.256089, -0.6026939, -2.296697, 1, 1, 1, 1, 1,
-1.253551, -0.4016048, -1.940842, 1, 1, 1, 1, 1,
-1.249506, 1.112131, -1.336375, 1, 1, 1, 1, 1,
-1.242084, -1.081649, -2.372367, 1, 1, 1, 1, 1,
-1.237273, -0.05083908, -3.376504, 1, 1, 1, 1, 1,
-1.218939, 0.1489061, -0.5263216, 1, 1, 1, 1, 1,
-1.214564, 1.340206, -1.433646, 1, 1, 1, 1, 1,
-1.199188, -0.988457, -2.495273, 1, 1, 1, 1, 1,
-1.177876, -0.2315533, -1.702424, 1, 1, 1, 1, 1,
-1.166369, 0.08824379, -0.1673262, 0, 0, 1, 1, 1,
-1.159803, 1.894315, 0.4441164, 1, 0, 0, 1, 1,
-1.144259, 0.7941768, -1.925797, 1, 0, 0, 1, 1,
-1.139862, 0.3759937, -0.6841571, 1, 0, 0, 1, 1,
-1.137246, -0.5462325, -3.803114, 1, 0, 0, 1, 1,
-1.132686, -0.9617314, -3.389639, 1, 0, 0, 1, 1,
-1.128022, -0.003125385, -2.469653, 0, 0, 0, 1, 1,
-1.123477, 1.094105, -0.3457592, 0, 0, 0, 1, 1,
-1.121224, 1.0904, -1.461991, 0, 0, 0, 1, 1,
-1.114476, 0.7485696, -2.275476, 0, 0, 0, 1, 1,
-1.112216, 0.8404211, -0.7601827, 0, 0, 0, 1, 1,
-1.11009, 0.2265543, -1.593889, 0, 0, 0, 1, 1,
-1.092617, 0.6890409, -0.8482015, 0, 0, 0, 1, 1,
-1.088424, -1.051593, -2.658429, 1, 1, 1, 1, 1,
-1.086691, 0.9301211, -2.437807, 1, 1, 1, 1, 1,
-1.070454, -0.8914379, -0.5827134, 1, 1, 1, 1, 1,
-1.054209, 0.5073298, -0.2504568, 1, 1, 1, 1, 1,
-1.054062, -1.679163, -2.301382, 1, 1, 1, 1, 1,
-1.053651, 0.6339008, -0.4902885, 1, 1, 1, 1, 1,
-1.045943, -0.3474783, -2.373577, 1, 1, 1, 1, 1,
-1.045516, -0.3498514, -1.881337, 1, 1, 1, 1, 1,
-1.043009, -0.2918207, -1.717378, 1, 1, 1, 1, 1,
-1.041395, -1.371308, -1.88797, 1, 1, 1, 1, 1,
-1.036294, 0.05900098, -1.054709, 1, 1, 1, 1, 1,
-1.030025, 0.138854, -0.5438902, 1, 1, 1, 1, 1,
-1.024682, -0.6380463, -1.083469, 1, 1, 1, 1, 1,
-1.011006, -0.3821197, -3.116391, 1, 1, 1, 1, 1,
-1.007935, -0.9313956, -1.417466, 1, 1, 1, 1, 1,
-1.00425, 0.7527021, -0.3342634, 0, 0, 1, 1, 1,
-1.003449, -0.02980234, -2.826924, 1, 0, 0, 1, 1,
-1.001194, 0.4968864, -1.125312, 1, 0, 0, 1, 1,
-0.9991927, 1.144127, 1.753366, 1, 0, 0, 1, 1,
-0.9947658, 0.3605865, -1.441749, 1, 0, 0, 1, 1,
-0.9911748, 1.226698, -1.180164, 1, 0, 0, 1, 1,
-0.9909161, -0.3535397, -2.39883, 0, 0, 0, 1, 1,
-0.988805, -0.3634801, -2.61498, 0, 0, 0, 1, 1,
-0.986186, -0.3957539, -3.011758, 0, 0, 0, 1, 1,
-0.9689048, 0.8338922, 0.1276775, 0, 0, 0, 1, 1,
-0.96678, -0.7984039, -2.016198, 0, 0, 0, 1, 1,
-0.9608276, -0.1470972, -1.995008, 0, 0, 0, 1, 1,
-0.9573579, -1.112912, -2.5597, 0, 0, 0, 1, 1,
-0.9501113, -0.8596357, -1.177904, 1, 1, 1, 1, 1,
-0.9481229, -0.1486588, -0.8762981, 1, 1, 1, 1, 1,
-0.9424165, 1.545041, -0.6602523, 1, 1, 1, 1, 1,
-0.9418508, 1.253076, 0.3191025, 1, 1, 1, 1, 1,
-0.9395748, -0.1585665, -0.04045648, 1, 1, 1, 1, 1,
-0.9309835, -1.088723, -3.077167, 1, 1, 1, 1, 1,
-0.9307249, 0.7240131, -3.2249, 1, 1, 1, 1, 1,
-0.9270202, -0.1465492, 0.1741795, 1, 1, 1, 1, 1,
-0.9129351, 1.63529, -0.7339256, 1, 1, 1, 1, 1,
-0.9124555, 0.477803, -0.01988498, 1, 1, 1, 1, 1,
-0.9040328, 0.4443798, -0.3192083, 1, 1, 1, 1, 1,
-0.9034225, -0.2378018, -1.406514, 1, 1, 1, 1, 1,
-0.9027131, -2.266354, -3.085505, 1, 1, 1, 1, 1,
-0.8839068, 0.4458402, -0.6821359, 1, 1, 1, 1, 1,
-0.8758137, -0.7030991, -2.655697, 1, 1, 1, 1, 1,
-0.8661485, -0.2681197, -0.1485303, 0, 0, 1, 1, 1,
-0.8630124, -1.191071, -2.013336, 1, 0, 0, 1, 1,
-0.8594698, 1.725583, 0.1109809, 1, 0, 0, 1, 1,
-0.8502494, 0.4520451, -1.314607, 1, 0, 0, 1, 1,
-0.844336, -0.2105931, -2.076144, 1, 0, 0, 1, 1,
-0.8418761, -0.1403487, -2.031816, 1, 0, 0, 1, 1,
-0.8415642, 0.3214817, -0.7916189, 0, 0, 0, 1, 1,
-0.8364536, -0.6259674, -3.452802, 0, 0, 0, 1, 1,
-0.8294994, -1.227387, -3.553545, 0, 0, 0, 1, 1,
-0.8287542, 0.1901504, -1.202807, 0, 0, 0, 1, 1,
-0.8170874, -0.9430503, -1.428818, 0, 0, 0, 1, 1,
-0.8162414, -0.9354088, -3.592958, 0, 0, 0, 1, 1,
-0.812319, -1.394265, -2.851183, 0, 0, 0, 1, 1,
-0.8089674, 0.06595395, -2.965801, 1, 1, 1, 1, 1,
-0.8023239, 0.9681253, -0.8177553, 1, 1, 1, 1, 1,
-0.8022458, 0.3163723, -0.8384169, 1, 1, 1, 1, 1,
-0.8012966, -1.849894, -2.991256, 1, 1, 1, 1, 1,
-0.7977362, 0.5460048, -2.079147, 1, 1, 1, 1, 1,
-0.7874513, 1.490246, -0.4715167, 1, 1, 1, 1, 1,
-0.7862866, 0.4385116, -1.06502, 1, 1, 1, 1, 1,
-0.7861005, -0.5461397, -0.471303, 1, 1, 1, 1, 1,
-0.7824808, -1.070584, -1.554786, 1, 1, 1, 1, 1,
-0.7792524, -0.9497057, -3.221037, 1, 1, 1, 1, 1,
-0.7739319, -0.03731329, -2.318803, 1, 1, 1, 1, 1,
-0.7711366, 1.336176, 1.308985, 1, 1, 1, 1, 1,
-0.7658771, 3.415211, -0.08889209, 1, 1, 1, 1, 1,
-0.7610608, 0.315787, -0.5990798, 1, 1, 1, 1, 1,
-0.7584488, -0.7840173, -2.846089, 1, 1, 1, 1, 1,
-0.7581847, -2.483513, -0.549736, 0, 0, 1, 1, 1,
-0.7552203, 0.2685501, -1.173822, 1, 0, 0, 1, 1,
-0.7534186, -0.9533271, -1.950426, 1, 0, 0, 1, 1,
-0.7530125, -2.137338, -1.577016, 1, 0, 0, 1, 1,
-0.7463233, 0.2964141, 0.1123917, 1, 0, 0, 1, 1,
-0.7453805, -1.348238, -2.613108, 1, 0, 0, 1, 1,
-0.7449896, -1.657702, -2.217017, 0, 0, 0, 1, 1,
-0.7373003, -0.4537874, -2.878211, 0, 0, 0, 1, 1,
-0.7369128, 0.8302742, 0.2795911, 0, 0, 0, 1, 1,
-0.7351657, -1.839927, -2.296824, 0, 0, 0, 1, 1,
-0.7339397, 1.38256, -3.095202, 0, 0, 0, 1, 1,
-0.7338618, 0.2741901, -2.014023, 0, 0, 0, 1, 1,
-0.7282813, -0.254371, -2.180722, 0, 0, 0, 1, 1,
-0.7265502, 0.3983846, -1.132564, 1, 1, 1, 1, 1,
-0.72644, -0.7417048, -2.67, 1, 1, 1, 1, 1,
-0.7244163, 0.2732399, -0.04280052, 1, 1, 1, 1, 1,
-0.7224657, 0.2628372, -1.346543, 1, 1, 1, 1, 1,
-0.7214423, 1.563921, 0.3291101, 1, 1, 1, 1, 1,
-0.7161996, 1.552085, -0.117815, 1, 1, 1, 1, 1,
-0.7159789, -0.6931681, -2.302176, 1, 1, 1, 1, 1,
-0.713315, -2.127614, -2.438408, 1, 1, 1, 1, 1,
-0.7119058, 0.2495698, -0.7287349, 1, 1, 1, 1, 1,
-0.7089635, 0.1881072, -1.324252, 1, 1, 1, 1, 1,
-0.7067068, -0.604904, 0.0406533, 1, 1, 1, 1, 1,
-0.7050759, -0.9415118, -1.247087, 1, 1, 1, 1, 1,
-0.698046, -0.12979, -3.336938, 1, 1, 1, 1, 1,
-0.6975199, 0.8171534, -1.250864, 1, 1, 1, 1, 1,
-0.6961993, -0.0790284, -1.446613, 1, 1, 1, 1, 1,
-0.6816525, -0.4233636, -2.049939, 0, 0, 1, 1, 1,
-0.6794413, -1.211272, -2.213168, 1, 0, 0, 1, 1,
-0.6785899, -2.143261, -0.08558382, 1, 0, 0, 1, 1,
-0.6769809, 0.6780075, -1.602491, 1, 0, 0, 1, 1,
-0.6732153, 0.4603002, 0.059629, 1, 0, 0, 1, 1,
-0.6711751, -0.9096587, -2.313031, 1, 0, 0, 1, 1,
-0.6679591, 0.2301885, -0.6875874, 0, 0, 0, 1, 1,
-0.6678014, -0.3564596, -2.363194, 0, 0, 0, 1, 1,
-0.6659582, 1.29328, -0.8225446, 0, 0, 0, 1, 1,
-0.6657483, -1.093475, -2.027891, 0, 0, 0, 1, 1,
-0.6586625, 0.2983977, -1.283591, 0, 0, 0, 1, 1,
-0.6510362, -0.05948732, -0.1959209, 0, 0, 0, 1, 1,
-0.6464129, -0.8275964, -3.216677, 0, 0, 0, 1, 1,
-0.6449909, -0.2081027, -0.4455669, 1, 1, 1, 1, 1,
-0.639183, -1.193187, -1.448775, 1, 1, 1, 1, 1,
-0.6379517, -1.269819, -2.967763, 1, 1, 1, 1, 1,
-0.6356196, 1.256554, -1.10816, 1, 1, 1, 1, 1,
-0.6332632, -0.8494092, -2.506786, 1, 1, 1, 1, 1,
-0.6306389, -2.046818, -3.013567, 1, 1, 1, 1, 1,
-0.630482, 0.8250827, -0.8822296, 1, 1, 1, 1, 1,
-0.6300485, -0.5188335, -1.649775, 1, 1, 1, 1, 1,
-0.6290779, 0.5434278, -0.573054, 1, 1, 1, 1, 1,
-0.6283568, -0.8400688, -3.07246, 1, 1, 1, 1, 1,
-0.6272653, 1.537746, 0.2474165, 1, 1, 1, 1, 1,
-0.6247673, -0.4014727, -0.8453113, 1, 1, 1, 1, 1,
-0.6232504, -0.5764425, -2.247094, 1, 1, 1, 1, 1,
-0.6229355, 0.2832516, 0.04888553, 1, 1, 1, 1, 1,
-0.6227791, 0.7107453, -3.251665, 1, 1, 1, 1, 1,
-0.6180422, -1.2185, -1.777051, 0, 0, 1, 1, 1,
-0.6098779, 0.8719574, 0.1578933, 1, 0, 0, 1, 1,
-0.6085268, 0.7335919, -1.44672, 1, 0, 0, 1, 1,
-0.6069202, 0.1986189, -2.692615, 1, 0, 0, 1, 1,
-0.6025889, 0.5082814, -0.6678001, 1, 0, 0, 1, 1,
-0.6009206, -0.2532054, -1.669821, 1, 0, 0, 1, 1,
-0.5975326, -0.8501284, -2.360714, 0, 0, 0, 1, 1,
-0.5919198, -0.5546593, -3.638584, 0, 0, 0, 1, 1,
-0.5841388, 0.4561359, -0.7604178, 0, 0, 0, 1, 1,
-0.5808198, 0.536351, -0.8215275, 0, 0, 0, 1, 1,
-0.5804288, -0.9686056, -2.877874, 0, 0, 0, 1, 1,
-0.5795535, -0.6471801, -3.292735, 0, 0, 0, 1, 1,
-0.5716254, 0.4841274, -0.4392696, 0, 0, 0, 1, 1,
-0.5698224, -0.2119997, -1.234141, 1, 1, 1, 1, 1,
-0.5675879, 0.2872639, -0.3438091, 1, 1, 1, 1, 1,
-0.5674375, -1.394514, -2.124747, 1, 1, 1, 1, 1,
-0.5670794, -0.1795092, -1.82299, 1, 1, 1, 1, 1,
-0.5665234, -0.1339, -2.282147, 1, 1, 1, 1, 1,
-0.5598646, -1.55756, -4.831102, 1, 1, 1, 1, 1,
-0.5590183, -0.1990277, -1.92692, 1, 1, 1, 1, 1,
-0.5583491, 0.9369968, -0.2667148, 1, 1, 1, 1, 1,
-0.5527526, 0.1884592, -1.845735, 1, 1, 1, 1, 1,
-0.5526193, 0.2267297, -2.591661, 1, 1, 1, 1, 1,
-0.5523368, -0.9790971, -3.071068, 1, 1, 1, 1, 1,
-0.5519857, -0.3521208, -1.801061, 1, 1, 1, 1, 1,
-0.5519367, 0.1927852, -0.3184942, 1, 1, 1, 1, 1,
-0.5515285, 0.9633142, -1.180099, 1, 1, 1, 1, 1,
-0.5450425, -1.578646, -2.658612, 1, 1, 1, 1, 1,
-0.5430977, 0.917973, -1.708298, 0, 0, 1, 1, 1,
-0.5415918, -1.187129, -4.073786, 1, 0, 0, 1, 1,
-0.5326099, -1.131563, -2.369234, 1, 0, 0, 1, 1,
-0.5311803, 0.4514172, 0.5089794, 1, 0, 0, 1, 1,
-0.530771, -1.922493, -2.869153, 1, 0, 0, 1, 1,
-0.5295672, -0.11538, -2.357326, 1, 0, 0, 1, 1,
-0.5265562, -1.46002, -4.011052, 0, 0, 0, 1, 1,
-0.5160847, 0.888059, -1.339877, 0, 0, 0, 1, 1,
-0.515645, -0.6135576, -0.6987064, 0, 0, 0, 1, 1,
-0.5128129, -0.7220352, -1.63944, 0, 0, 0, 1, 1,
-0.5121661, 0.7615578, 0.1303381, 0, 0, 0, 1, 1,
-0.5116141, -0.07678057, -0.348818, 0, 0, 0, 1, 1,
-0.5050501, 1.128474, 0.7549588, 0, 0, 0, 1, 1,
-0.5005567, 0.8615163, 1.026934, 1, 1, 1, 1, 1,
-0.4985671, 1.050645, -1.899382, 1, 1, 1, 1, 1,
-0.4978938, -2.075433, -2.352749, 1, 1, 1, 1, 1,
-0.4926101, -1.512452, -1.845928, 1, 1, 1, 1, 1,
-0.492234, -0.9053609, -1.687941, 1, 1, 1, 1, 1,
-0.4891896, -1.333104, -3.361553, 1, 1, 1, 1, 1,
-0.4891896, 0.3185919, -2.558466, 1, 1, 1, 1, 1,
-0.4889975, -0.832071, -2.731234, 1, 1, 1, 1, 1,
-0.4885243, 1.295582, -0.3672273, 1, 1, 1, 1, 1,
-0.4854689, 0.7339098, -1.123165, 1, 1, 1, 1, 1,
-0.483866, 0.2757997, -0.401289, 1, 1, 1, 1, 1,
-0.4796305, 0.246277, -1.05042, 1, 1, 1, 1, 1,
-0.4777247, -0.9945423, -3.688285, 1, 1, 1, 1, 1,
-0.4732949, 0.2848411, -0.5282454, 1, 1, 1, 1, 1,
-0.4720564, -0.702655, -1.380996, 1, 1, 1, 1, 1,
-0.4635148, -0.03935066, -0.8064871, 0, 0, 1, 1, 1,
-0.4581974, -0.6021979, -2.117691, 1, 0, 0, 1, 1,
-0.44987, -0.6926013, -2.903862, 1, 0, 0, 1, 1,
-0.44844, 0.9413769, 0.02575322, 1, 0, 0, 1, 1,
-0.4456118, 0.5538853, -0.7324907, 1, 0, 0, 1, 1,
-0.4439449, -1.440161, -2.494291, 1, 0, 0, 1, 1,
-0.4392097, 0.14934, -2.347848, 0, 0, 0, 1, 1,
-0.4357447, -0.4771916, -2.443543, 0, 0, 0, 1, 1,
-0.4350415, 0.1402152, -1.369315, 0, 0, 0, 1, 1,
-0.4310954, 0.501115, -1.228673, 0, 0, 0, 1, 1,
-0.4292008, 1.216204, -0.04253439, 0, 0, 0, 1, 1,
-0.4290589, 1.210425, -1.154813, 0, 0, 0, 1, 1,
-0.428324, 0.5485738, -2.257005, 0, 0, 0, 1, 1,
-0.4257502, -1.256813, -3.710442, 1, 1, 1, 1, 1,
-0.420179, 1.52456, 0.5855582, 1, 1, 1, 1, 1,
-0.4198786, -0.6144595, -3.281132, 1, 1, 1, 1, 1,
-0.412731, -0.9385628, -3.52513, 1, 1, 1, 1, 1,
-0.4122513, 0.1627781, -3.410992, 1, 1, 1, 1, 1,
-0.4098366, 0.8678434, -0.9363242, 1, 1, 1, 1, 1,
-0.405131, 0.1383646, -0.3593749, 1, 1, 1, 1, 1,
-0.4046042, 0.4230981, -0.2958849, 1, 1, 1, 1, 1,
-0.4027979, 0.6876145, -0.4675698, 1, 1, 1, 1, 1,
-0.4018668, 0.693664, 0.2696116, 1, 1, 1, 1, 1,
-0.4000483, -1.618705, -0.3392368, 1, 1, 1, 1, 1,
-0.3978513, -0.7227192, -4.139346, 1, 1, 1, 1, 1,
-0.39521, -0.1322788, -2.327298, 1, 1, 1, 1, 1,
-0.3935429, -0.1851608, -3.683361, 1, 1, 1, 1, 1,
-0.3910601, 2.100518, 2.031926, 1, 1, 1, 1, 1,
-0.3889275, -1.023802, -3.116541, 0, 0, 1, 1, 1,
-0.3881831, 0.6489062, -1.221956, 1, 0, 0, 1, 1,
-0.3863212, 1.172087, -1.535814, 1, 0, 0, 1, 1,
-0.3848729, -0.7464845, -2.787975, 1, 0, 0, 1, 1,
-0.381478, 0.3034156, -1.27626, 1, 0, 0, 1, 1,
-0.3811342, -0.2810043, -3.717961, 1, 0, 0, 1, 1,
-0.3809326, -0.2766818, -1.976331, 0, 0, 0, 1, 1,
-0.3801681, -2.190637, -4.170141, 0, 0, 0, 1, 1,
-0.3770814, -1.090985, -2.766926, 0, 0, 0, 1, 1,
-0.3763458, -0.7791992, -5.148159, 0, 0, 0, 1, 1,
-0.3747131, -1.304267, -1.824041, 0, 0, 0, 1, 1,
-0.3718333, -2.987907, -2.019281, 0, 0, 0, 1, 1,
-0.3704081, -0.3855644, -2.412878, 0, 0, 0, 1, 1,
-0.3675913, 0.9660782, 0.282639, 1, 1, 1, 1, 1,
-0.3614596, -0.05874003, -1.909354, 1, 1, 1, 1, 1,
-0.3612842, -1.327673, -3.684184, 1, 1, 1, 1, 1,
-0.3590174, 0.6373093, 0.1791697, 1, 1, 1, 1, 1,
-0.3498089, 0.2468927, -0.303648, 1, 1, 1, 1, 1,
-0.3485051, -3.048599, -3.911445, 1, 1, 1, 1, 1,
-0.3471232, -0.4404697, -1.619777, 1, 1, 1, 1, 1,
-0.3466564, 0.08962831, -1.175468, 1, 1, 1, 1, 1,
-0.3453988, -0.226051, -2.426103, 1, 1, 1, 1, 1,
-0.3404448, 0.6066583, -0.8864162, 1, 1, 1, 1, 1,
-0.338524, -0.2551104, -2.683499, 1, 1, 1, 1, 1,
-0.3368748, 0.4696399, 0.8282207, 1, 1, 1, 1, 1,
-0.3352408, -0.3588239, -1.712689, 1, 1, 1, 1, 1,
-0.332555, -1.346203, -3.489657, 1, 1, 1, 1, 1,
-0.3310387, 0.306262, -0.4263535, 1, 1, 1, 1, 1,
-0.3222873, -1.485737, -3.172858, 0, 0, 1, 1, 1,
-0.3220241, -0.04032927, -2.902987, 1, 0, 0, 1, 1,
-0.3206733, 0.002709789, -2.13341, 1, 0, 0, 1, 1,
-0.3204331, -0.294718, -3.607592, 1, 0, 0, 1, 1,
-0.3150959, 0.7587723, -0.5672517, 1, 0, 0, 1, 1,
-0.3148841, -0.7145082, -4.563338, 1, 0, 0, 1, 1,
-0.3145322, -0.05067569, -1.156376, 0, 0, 0, 1, 1,
-0.3135666, -0.6398193, -2.987207, 0, 0, 0, 1, 1,
-0.3090471, 1.170299, -0.3985466, 0, 0, 0, 1, 1,
-0.3048188, -0.7146302, -4.024482, 0, 0, 0, 1, 1,
-0.3042226, -0.09030424, -1.767272, 0, 0, 0, 1, 1,
-0.2988579, -2.51563, -2.320253, 0, 0, 0, 1, 1,
-0.2973885, -0.3796487, -2.509069, 0, 0, 0, 1, 1,
-0.2951383, 1.650099, 0.610293, 1, 1, 1, 1, 1,
-0.2930347, -0.564066, -4.562792, 1, 1, 1, 1, 1,
-0.2924908, 0.3448935, -0.06167591, 1, 1, 1, 1, 1,
-0.291526, -1.105405, -3.031408, 1, 1, 1, 1, 1,
-0.2833403, -0.1553448, -1.824658, 1, 1, 1, 1, 1,
-0.2815168, 0.1331919, -1.566115, 1, 1, 1, 1, 1,
-0.275907, 0.2362471, -2.602457, 1, 1, 1, 1, 1,
-0.275456, -1.430344, -2.092208, 1, 1, 1, 1, 1,
-0.2671222, 0.6017728, -1.521984, 1, 1, 1, 1, 1,
-0.2618552, 0.7509762, 0.2540579, 1, 1, 1, 1, 1,
-0.2594911, -0.4090027, -1.668427, 1, 1, 1, 1, 1,
-0.2538627, -0.2689478, -2.91567, 1, 1, 1, 1, 1,
-0.2508618, -0.1730816, -2.732726, 1, 1, 1, 1, 1,
-0.2506766, 0.9800611, 0.2872925, 1, 1, 1, 1, 1,
-0.2489515, -0.8704753, -1.788128, 1, 1, 1, 1, 1,
-0.2479607, -0.2287129, -5.167568, 0, 0, 1, 1, 1,
-0.2405089, 0.5989192, -1.542287, 1, 0, 0, 1, 1,
-0.238782, 0.1455496, -1.102824, 1, 0, 0, 1, 1,
-0.2375887, 0.4367596, 0.5862295, 1, 0, 0, 1, 1,
-0.2354334, 1.390153, 0.3793939, 1, 0, 0, 1, 1,
-0.2350152, 0.06504586, -2.955726, 1, 0, 0, 1, 1,
-0.2331168, 0.796908, 0.2340846, 0, 0, 0, 1, 1,
-0.2325232, 0.3685134, -1.789768, 0, 0, 0, 1, 1,
-0.2323495, 1.913997, -0.7912262, 0, 0, 0, 1, 1,
-0.228593, -0.2861647, -2.428099, 0, 0, 0, 1, 1,
-0.2257618, -0.6236804, -2.051248, 0, 0, 0, 1, 1,
-0.2212818, 0.05502857, 0.7964309, 0, 0, 0, 1, 1,
-0.2200096, -0.8503706, -2.133104, 0, 0, 0, 1, 1,
-0.219617, 0.3472716, -0.1854218, 1, 1, 1, 1, 1,
-0.2180834, -1.294932, -2.708314, 1, 1, 1, 1, 1,
-0.2176975, 0.1170837, 0.5636379, 1, 1, 1, 1, 1,
-0.2169579, 0.5577602, -0.9908299, 1, 1, 1, 1, 1,
-0.2167962, -0.06739683, -1.042491, 1, 1, 1, 1, 1,
-0.2141896, -0.1106365, -4.269799, 1, 1, 1, 1, 1,
-0.2140283, 2.640879, -0.6443307, 1, 1, 1, 1, 1,
-0.213605, -0.972493, -1.585783, 1, 1, 1, 1, 1,
-0.2120318, -0.7898105, -3.1742, 1, 1, 1, 1, 1,
-0.2105062, 0.1167005, -1.169833, 1, 1, 1, 1, 1,
-0.208206, 0.2900241, -1.323444, 1, 1, 1, 1, 1,
-0.2080127, -0.2176085, -1.179321, 1, 1, 1, 1, 1,
-0.2029175, 0.08720856, -2.274354, 1, 1, 1, 1, 1,
-0.2025371, -1.142742, -1.552515, 1, 1, 1, 1, 1,
-0.201088, 0.4348845, -1.309308, 1, 1, 1, 1, 1,
-0.199491, 0.177656, -0.2007718, 0, 0, 1, 1, 1,
-0.1989957, 0.6354006, -0.5848354, 1, 0, 0, 1, 1,
-0.1971974, 1.142893, 1.071011, 1, 0, 0, 1, 1,
-0.1961164, -0.7832507, -3.173413, 1, 0, 0, 1, 1,
-0.1956016, -0.5690717, -3.03544, 1, 0, 0, 1, 1,
-0.1933751, -0.533833, -0.228999, 1, 0, 0, 1, 1,
-0.1927014, 0.06412009, -1.752023, 0, 0, 0, 1, 1,
-0.1891883, 0.7262846, -0.8976848, 0, 0, 0, 1, 1,
-0.1881474, -0.6561595, -5.174828, 0, 0, 0, 1, 1,
-0.1850926, 1.178058, -0.1295503, 0, 0, 0, 1, 1,
-0.1740245, -0.7334808, -2.841723, 0, 0, 0, 1, 1,
-0.1718645, 1.161255, 0.8049625, 0, 0, 0, 1, 1,
-0.1716641, -0.8478109, -1.596545, 0, 0, 0, 1, 1,
-0.1640263, 1.056228, 0.6420408, 1, 1, 1, 1, 1,
-0.1610884, 0.6102003, -2.389279, 1, 1, 1, 1, 1,
-0.1608422, 0.1816008, -2.488256, 1, 1, 1, 1, 1,
-0.1605383, 0.1967667, -0.3619602, 1, 1, 1, 1, 1,
-0.1600932, -0.9936908, -3.911918, 1, 1, 1, 1, 1,
-0.1574148, 1.540266, -2.086522, 1, 1, 1, 1, 1,
-0.1552083, -1.2257, -3.294595, 1, 1, 1, 1, 1,
-0.151423, -0.4347443, -3.893935, 1, 1, 1, 1, 1,
-0.1489099, 1.547301, 1.129825, 1, 1, 1, 1, 1,
-0.1481105, -0.7832263, -2.611698, 1, 1, 1, 1, 1,
-0.1470077, -0.3193881, -2.211288, 1, 1, 1, 1, 1,
-0.141295, 0.8619642, 0.688703, 1, 1, 1, 1, 1,
-0.1407237, -0.5221549, -4.312329, 1, 1, 1, 1, 1,
-0.1397979, -0.658468, -1.615313, 1, 1, 1, 1, 1,
-0.1369413, -0.6175078, -3.838067, 1, 1, 1, 1, 1,
-0.1341892, 0.5102572, -2.298369, 0, 0, 1, 1, 1,
-0.1311866, -0.492292, -4.092559, 1, 0, 0, 1, 1,
-0.1282973, -0.6142117, -3.069233, 1, 0, 0, 1, 1,
-0.1243382, 1.226812, 0.8774365, 1, 0, 0, 1, 1,
-0.1223056, -0.4465986, -2.888624, 1, 0, 0, 1, 1,
-0.1222135, -0.6406363, -2.067329, 1, 0, 0, 1, 1,
-0.1188812, -0.7691008, -5.818925, 0, 0, 0, 1, 1,
-0.1181957, 1.219379, -0.6354614, 0, 0, 0, 1, 1,
-0.1150119, -1.128985, -4.976024, 0, 0, 0, 1, 1,
-0.1141413, 0.8503543, -0.3238308, 0, 0, 0, 1, 1,
-0.1118755, 0.07152009, -1.018143, 0, 0, 0, 1, 1,
-0.1097881, 1.066553, 0.8713309, 0, 0, 0, 1, 1,
-0.1091148, -0.826054, -3.845236, 0, 0, 0, 1, 1,
-0.09949935, -1.775663, -3.395938, 1, 1, 1, 1, 1,
-0.09776416, -1.650483, -2.205104, 1, 1, 1, 1, 1,
-0.09640484, -0.9647555, -3.098047, 1, 1, 1, 1, 1,
-0.09217334, 0.5167078, -1.19433, 1, 1, 1, 1, 1,
-0.08779561, -2.515602, -6.009214, 1, 1, 1, 1, 1,
-0.08403395, -0.819841, -2.369554, 1, 1, 1, 1, 1,
-0.08392043, -1.353674, -5.125146, 1, 1, 1, 1, 1,
-0.08021449, -2.579712, -1.340654, 1, 1, 1, 1, 1,
-0.07907951, 1.602312, 0.0201866, 1, 1, 1, 1, 1,
-0.07771837, 0.1757019, 0.1148431, 1, 1, 1, 1, 1,
-0.07711906, -0.2681192, -2.044563, 1, 1, 1, 1, 1,
-0.07606523, -1.975843, -3.483515, 1, 1, 1, 1, 1,
-0.07427358, -0.2437669, -1.746194, 1, 1, 1, 1, 1,
-0.0722866, 0.1863849, -0.03462035, 1, 1, 1, 1, 1,
-0.07026399, -2.045376, -2.620391, 1, 1, 1, 1, 1,
-0.0668577, 1.826401, 0.7547109, 0, 0, 1, 1, 1,
-0.06642285, -0.7046899, -2.510993, 1, 0, 0, 1, 1,
-0.06487499, 0.7223192, -0.3344582, 1, 0, 0, 1, 1,
-0.06355396, -0.08034446, -1.906546, 1, 0, 0, 1, 1,
-0.0575612, -0.2105709, -4.012362, 1, 0, 0, 1, 1,
-0.05441142, -0.3410522, -1.781909, 1, 0, 0, 1, 1,
-0.04988055, -0.3590558, -3.082565, 0, 0, 0, 1, 1,
-0.04947991, 0.5566664, -1.28164, 0, 0, 0, 1, 1,
-0.04632732, 0.1757597, -0.6416216, 0, 0, 0, 1, 1,
-0.04036887, 0.6299628, 0.1530417, 0, 0, 0, 1, 1,
-0.03969958, -0.2508263, -4.181852, 0, 0, 0, 1, 1,
-0.03449387, -1.512698, -3.131867, 0, 0, 0, 1, 1,
-0.03269647, -1.284241, -4.103122, 0, 0, 0, 1, 1,
-0.0311525, 1.495893, 0.2965917, 1, 1, 1, 1, 1,
-0.03067851, -0.8535904, -1.668411, 1, 1, 1, 1, 1,
-0.02511774, 0.6608903, -0.8683262, 1, 1, 1, 1, 1,
-0.02469441, -1.244174, -2.054757, 1, 1, 1, 1, 1,
-0.02453878, 0.2716816, 0.6429667, 1, 1, 1, 1, 1,
-0.02242698, 0.5394315, -0.6021848, 1, 1, 1, 1, 1,
-0.01893124, 0.9142858, 1.063094, 1, 1, 1, 1, 1,
-0.01454059, -0.4331642, -3.823009, 1, 1, 1, 1, 1,
-0.001407479, -0.7746975, -4.735805, 1, 1, 1, 1, 1,
0.002294566, -0.04948547, 2.792533, 1, 1, 1, 1, 1,
0.003396034, -0.2611583, 5.263722, 1, 1, 1, 1, 1,
0.004316957, -2.202231, 3.280955, 1, 1, 1, 1, 1,
0.007013083, -0.2016981, 3.78015, 1, 1, 1, 1, 1,
0.01012595, -0.6511711, 2.745696, 1, 1, 1, 1, 1,
0.01243269, -0.03004464, 3.027378, 1, 1, 1, 1, 1,
0.01337855, -2.158174, 3.593541, 0, 0, 1, 1, 1,
0.0140665, -1.820495, 2.417104, 1, 0, 0, 1, 1,
0.01458988, -0.1507216, 3.68545, 1, 0, 0, 1, 1,
0.01553342, -0.8660504, 2.020318, 1, 0, 0, 1, 1,
0.01817827, 0.509317, 0.6559149, 1, 0, 0, 1, 1,
0.01843614, -1.487435, 3.032948, 1, 0, 0, 1, 1,
0.02335653, -0.3582137, 4.275578, 0, 0, 0, 1, 1,
0.02416662, -0.03226558, 2.338176, 0, 0, 0, 1, 1,
0.02547552, 0.1612876, -1.030927, 0, 0, 0, 1, 1,
0.03076642, -0.743455, 2.473681, 0, 0, 0, 1, 1,
0.03223226, 0.3455443, 0.1839479, 0, 0, 0, 1, 1,
0.03271181, -0.6285359, 2.560292, 0, 0, 0, 1, 1,
0.03336021, 1.918706, 0.6854536, 0, 0, 0, 1, 1,
0.03398654, 0.2429731, -0.7123254, 1, 1, 1, 1, 1,
0.04084472, 0.5945363, -0.6702221, 1, 1, 1, 1, 1,
0.05505836, 1.109886, 0.1341547, 1, 1, 1, 1, 1,
0.05594318, -0.9210194, 5.166435, 1, 1, 1, 1, 1,
0.05670239, -2.126872, 4.055562, 1, 1, 1, 1, 1,
0.05748893, -1.426086, 3.057193, 1, 1, 1, 1, 1,
0.05916279, 0.5233233, 0.7708563, 1, 1, 1, 1, 1,
0.05921865, -1.543448, 2.361552, 1, 1, 1, 1, 1,
0.06065381, 0.364457, 0.199802, 1, 1, 1, 1, 1,
0.06137339, -0.02937094, 0.6020656, 1, 1, 1, 1, 1,
0.06192028, -0.8944601, 3.747837, 1, 1, 1, 1, 1,
0.0635215, -0.4567735, 3.182529, 1, 1, 1, 1, 1,
0.06478427, -1.081528, 1.380314, 1, 1, 1, 1, 1,
0.06566088, -1.591366, 3.941643, 1, 1, 1, 1, 1,
0.0669502, -0.4724809, 3.258439, 1, 1, 1, 1, 1,
0.07270181, 0.5859678, 0.4240475, 0, 0, 1, 1, 1,
0.07291465, 1.209923, 1.294659, 1, 0, 0, 1, 1,
0.0740204, 1.375335, 0.4956737, 1, 0, 0, 1, 1,
0.07439411, -0.1667775, 4.286665, 1, 0, 0, 1, 1,
0.0776175, -1.200052, 1.326312, 1, 0, 0, 1, 1,
0.07866243, 2.071959, -0.6906025, 1, 0, 0, 1, 1,
0.08165424, -0.1757564, 3.059205, 0, 0, 0, 1, 1,
0.08288559, -1.691047, 3.94847, 0, 0, 0, 1, 1,
0.08524015, -0.150793, 1.842138, 0, 0, 0, 1, 1,
0.08533338, -1.090774, 2.145505, 0, 0, 0, 1, 1,
0.0866506, 0.07764498, -0.04141504, 0, 0, 0, 1, 1,
0.09148373, 0.5753744, 0.6775703, 0, 0, 0, 1, 1,
0.09359446, 0.0440383, 2.260848, 0, 0, 0, 1, 1,
0.09559318, 0.9727646, 1.612652, 1, 1, 1, 1, 1,
0.09718649, -0.6194122, 3.726649, 1, 1, 1, 1, 1,
0.09809562, -1.065134, 2.922239, 1, 1, 1, 1, 1,
0.1025757, -0.5002019, 2.016019, 1, 1, 1, 1, 1,
0.1123799, 0.002707765, 0.5025176, 1, 1, 1, 1, 1,
0.1133788, -1.262739, 2.437984, 1, 1, 1, 1, 1,
0.1165765, -0.119768, 1.616212, 1, 1, 1, 1, 1,
0.117609, 1.140473, -0.6661068, 1, 1, 1, 1, 1,
0.1180455, -1.388849, 4.860056, 1, 1, 1, 1, 1,
0.1218404, -1.317471, 4.165237, 1, 1, 1, 1, 1,
0.1234568, -0.8096073, 4.989608, 1, 1, 1, 1, 1,
0.127542, 0.1429554, 1.263746, 1, 1, 1, 1, 1,
0.1283345, -1.141088, 2.325815, 1, 1, 1, 1, 1,
0.1302087, 0.2729565, 0.1389593, 1, 1, 1, 1, 1,
0.132053, 0.5214118, -1.083095, 1, 1, 1, 1, 1,
0.1327763, 0.9580045, 0.8359488, 0, 0, 1, 1, 1,
0.1362991, -0.774925, 3.217796, 1, 0, 0, 1, 1,
0.1371364, 0.06101488, 0.5620278, 1, 0, 0, 1, 1,
0.1432031, -1.154039, 3.498921, 1, 0, 0, 1, 1,
0.1473755, 0.9043425, 0.2434964, 1, 0, 0, 1, 1,
0.147761, 0.598945, 0.08092066, 1, 0, 0, 1, 1,
0.1492843, 2.12997, -0.2125354, 0, 0, 0, 1, 1,
0.1500811, 0.6507032, 0.1424063, 0, 0, 0, 1, 1,
0.1503769, 0.1888473, 0.4555239, 0, 0, 0, 1, 1,
0.1522345, 0.4712641, 1.243788, 0, 0, 0, 1, 1,
0.152677, -0.1636454, 2.448393, 0, 0, 0, 1, 1,
0.1560404, -0.3005871, 3.749668, 0, 0, 0, 1, 1,
0.1572441, -0.06401221, 0.5806108, 0, 0, 0, 1, 1,
0.1630337, 1.0947, 0.6509413, 1, 1, 1, 1, 1,
0.1641037, -0.3188686, 2.263741, 1, 1, 1, 1, 1,
0.1659942, -1.915502, 2.078417, 1, 1, 1, 1, 1,
0.1685928, -0.4079395, 1.189771, 1, 1, 1, 1, 1,
0.1765199, -0.3241842, 2.756057, 1, 1, 1, 1, 1,
0.183733, -0.418632, 2.475406, 1, 1, 1, 1, 1,
0.1919478, 1.256459, -0.8459932, 1, 1, 1, 1, 1,
0.192258, 0.4381835, 2.300366, 1, 1, 1, 1, 1,
0.1976457, -0.8012133, 3.075138, 1, 1, 1, 1, 1,
0.1998153, 0.0794802, 0.02958014, 1, 1, 1, 1, 1,
0.200114, 0.1398288, 1.402361, 1, 1, 1, 1, 1,
0.2022737, 1.270906, 0.6197056, 1, 1, 1, 1, 1,
0.2055717, -0.4424014, 2.992481, 1, 1, 1, 1, 1,
0.2133266, 0.9495572, 0.636856, 1, 1, 1, 1, 1,
0.2163841, -0.0478444, -0.9641454, 1, 1, 1, 1, 1,
0.2172751, 1.566844, 1.891243, 0, 0, 1, 1, 1,
0.2174264, -0.8326043, 1.712874, 1, 0, 0, 1, 1,
0.218102, -0.704414, 3.66396, 1, 0, 0, 1, 1,
0.2190662, -1.499183, 2.980881, 1, 0, 0, 1, 1,
0.2191941, -1.681046, 1.426185, 1, 0, 0, 1, 1,
0.2259058, 2.233367, 2.620039, 1, 0, 0, 1, 1,
0.2267644, -0.5303717, 4.463901, 0, 0, 0, 1, 1,
0.2290561, -0.7430173, 2.269005, 0, 0, 0, 1, 1,
0.2295628, 0.02611069, 1.652947, 0, 0, 0, 1, 1,
0.230119, -0.5159799, 3.625056, 0, 0, 0, 1, 1,
0.2328432, 0.7003827, -0.02549821, 0, 0, 0, 1, 1,
0.2350209, -2.110505, 3.745238, 0, 0, 0, 1, 1,
0.2365407, 0.9079999, 1.536159, 0, 0, 0, 1, 1,
0.2379494, 0.3059216, 0.9296448, 1, 1, 1, 1, 1,
0.2409305, -2.398997, 3.108339, 1, 1, 1, 1, 1,
0.2456769, 0.1711823, -0.5704006, 1, 1, 1, 1, 1,
0.2504604, -0.1355718, 2.678087, 1, 1, 1, 1, 1,
0.2507102, 0.4895199, 1.639785, 1, 1, 1, 1, 1,
0.2510374, 1.221115, -0.7875559, 1, 1, 1, 1, 1,
0.2528727, 0.5689177, -0.679239, 1, 1, 1, 1, 1,
0.2539952, -0.1054141, 2.540588, 1, 1, 1, 1, 1,
0.2544257, -1.171522, 1.43272, 1, 1, 1, 1, 1,
0.2633527, -0.1454717, 1.72972, 1, 1, 1, 1, 1,
0.2664301, 0.8155977, 1.284971, 1, 1, 1, 1, 1,
0.2694416, 1.416857, 1.20779, 1, 1, 1, 1, 1,
0.2706159, -0.1061708, 3.200665, 1, 1, 1, 1, 1,
0.2746473, -0.5494545, 3.247822, 1, 1, 1, 1, 1,
0.274879, 0.9459354, -0.1455278, 1, 1, 1, 1, 1,
0.2773977, -1.242462, 2.174615, 0, 0, 1, 1, 1,
0.2801098, 1.105306, 0.6903919, 1, 0, 0, 1, 1,
0.2806837, -0.320814, 1.82099, 1, 0, 0, 1, 1,
0.2836525, -1.372484, 1.99394, 1, 0, 0, 1, 1,
0.2844089, -0.9635768, 3.276362, 1, 0, 0, 1, 1,
0.2877562, 0.4273837, 0.2707443, 1, 0, 0, 1, 1,
0.287972, -1.536233, 1.918976, 0, 0, 0, 1, 1,
0.2988962, 0.05993912, 2.0702, 0, 0, 0, 1, 1,
0.3017704, -0.6679419, 2.434059, 0, 0, 0, 1, 1,
0.3028076, -1.088558, 2.101075, 0, 0, 0, 1, 1,
0.303923, -1.675679, 2.625177, 0, 0, 0, 1, 1,
0.3049524, 0.6873714, 0.8829251, 0, 0, 0, 1, 1,
0.3079767, 1.218973, -0.6468689, 0, 0, 0, 1, 1,
0.308175, 0.9307618, 2.366924, 1, 1, 1, 1, 1,
0.3095249, 0.802261, 0.6544335, 1, 1, 1, 1, 1,
0.3104155, 2.099218, 0.792311, 1, 1, 1, 1, 1,
0.3111825, -1.606915, 3.131876, 1, 1, 1, 1, 1,
0.3116981, 0.7737561, -0.6626549, 1, 1, 1, 1, 1,
0.3167709, 0.2367739, 3.24853, 1, 1, 1, 1, 1,
0.3197749, -2.007469, 2.623448, 1, 1, 1, 1, 1,
0.3225382, 0.5592716, 0.7198403, 1, 1, 1, 1, 1,
0.3276556, 1.077629, -1.178687, 1, 1, 1, 1, 1,
0.3308689, -1.386131, 2.244223, 1, 1, 1, 1, 1,
0.3346252, -1.416821, 2.49167, 1, 1, 1, 1, 1,
0.3404396, -1.175966, 2.959956, 1, 1, 1, 1, 1,
0.3416128, -1.065902, 2.103929, 1, 1, 1, 1, 1,
0.3486037, -0.157646, 2.189666, 1, 1, 1, 1, 1,
0.3493502, -1.025466, 2.181813, 1, 1, 1, 1, 1,
0.353641, 0.5623904, 1.646959, 0, 0, 1, 1, 1,
0.3618356, 1.029739, 0.2252901, 1, 0, 0, 1, 1,
0.3670727, 0.5500481, 3.876363, 1, 0, 0, 1, 1,
0.3733436, -0.6867595, 2.786018, 1, 0, 0, 1, 1,
0.3745332, -0.5616963, 2.652523, 1, 0, 0, 1, 1,
0.3868672, -1.492801, 3.515361, 1, 0, 0, 1, 1,
0.388056, -0.09195055, 2.617619, 0, 0, 0, 1, 1,
0.3889636, 0.7868237, 1.460447, 0, 0, 0, 1, 1,
0.3925115, -0.4054628, 2.483788, 0, 0, 0, 1, 1,
0.3939888, 1.034756, 2.32805, 0, 0, 0, 1, 1,
0.3947516, -0.8688264, 4.349476, 0, 0, 0, 1, 1,
0.3953688, 1.741781, 0.346769, 0, 0, 0, 1, 1,
0.3974275, -0.3275494, 3.074907, 0, 0, 0, 1, 1,
0.3982249, 1.548648, 0.5212939, 1, 1, 1, 1, 1,
0.4027279, 0.7784955, -0.6194757, 1, 1, 1, 1, 1,
0.407582, -0.2890552, 3.014031, 1, 1, 1, 1, 1,
0.4091758, 0.165575, 1.779025, 1, 1, 1, 1, 1,
0.4122007, -1.424988, 2.862364, 1, 1, 1, 1, 1,
0.4137373, -0.5455053, 3.411792, 1, 1, 1, 1, 1,
0.4179043, -0.3871146, 3.41057, 1, 1, 1, 1, 1,
0.4233814, -1.349745, 4.353119, 1, 1, 1, 1, 1,
0.4278708, -0.8552786, 4.848173, 1, 1, 1, 1, 1,
0.4326482, 0.7471655, -1.15142, 1, 1, 1, 1, 1,
0.4345324, 1.909899, 1.519488, 1, 1, 1, 1, 1,
0.4347549, -0.1441882, 2.282063, 1, 1, 1, 1, 1,
0.4353305, -0.4157725, 0.8766203, 1, 1, 1, 1, 1,
0.4416308, 1.294161, 0.4179629, 1, 1, 1, 1, 1,
0.4428877, -0.1949562, 1.018544, 1, 1, 1, 1, 1,
0.4429926, 0.1591048, 1.74898, 0, 0, 1, 1, 1,
0.4460301, -0.1774679, 1.850496, 1, 0, 0, 1, 1,
0.4469844, -0.8191411, 2.093523, 1, 0, 0, 1, 1,
0.4549309, -0.308389, 0.869791, 1, 0, 0, 1, 1,
0.4560777, 0.8612983, 1.840381, 1, 0, 0, 1, 1,
0.4567888, 1.051612, -0.02755371, 1, 0, 0, 1, 1,
0.457148, -1.211544, 3.265984, 0, 0, 0, 1, 1,
0.4602422, -0.2778647, 1.849146, 0, 0, 0, 1, 1,
0.4616157, -1.068776, 3.87556, 0, 0, 0, 1, 1,
0.4626681, -0.1482697, 2.012481, 0, 0, 0, 1, 1,
0.4638327, 0.1314261, 2.264532, 0, 0, 0, 1, 1,
0.4685657, -0.5388553, 1.779743, 0, 0, 0, 1, 1,
0.4697887, -0.6283793, 3.523158, 0, 0, 0, 1, 1,
0.4700628, 1.113469, 0.06684263, 1, 1, 1, 1, 1,
0.4721387, 0.2886099, -0.4098801, 1, 1, 1, 1, 1,
0.4795548, 1.358371, 0.6255581, 1, 1, 1, 1, 1,
0.4840874, 0.3386624, 1.12845, 1, 1, 1, 1, 1,
0.4860915, 0.4827569, 2.374561, 1, 1, 1, 1, 1,
0.4927049, -0.1962041, 0.940568, 1, 1, 1, 1, 1,
0.4959939, -1.050182, 3.119933, 1, 1, 1, 1, 1,
0.4976187, -0.9303768, 2.871533, 1, 1, 1, 1, 1,
0.5044181, -1.379111, 2.498689, 1, 1, 1, 1, 1,
0.5070374, -0.7273647, 1.952644, 1, 1, 1, 1, 1,
0.5097777, 0.08948068, 1.561708, 1, 1, 1, 1, 1,
0.5108721, 0.6218767, -0.2378369, 1, 1, 1, 1, 1,
0.5140871, 0.1585186, 3.028331, 1, 1, 1, 1, 1,
0.5167009, 0.3819554, 1.448571, 1, 1, 1, 1, 1,
0.5189387, 1.89615, 0.4167507, 1, 1, 1, 1, 1,
0.5204166, -1.357105, 3.095567, 0, 0, 1, 1, 1,
0.5237942, 0.671243, 2.05198, 1, 0, 0, 1, 1,
0.5260435, 0.1961842, 1.282701, 1, 0, 0, 1, 1,
0.5286283, -1.254941, 2.450466, 1, 0, 0, 1, 1,
0.5298867, 0.3742815, 1.198052, 1, 0, 0, 1, 1,
0.5353879, 0.768335, 2.060217, 1, 0, 0, 1, 1,
0.5372177, 1.37003, 0.7202781, 0, 0, 0, 1, 1,
0.5372561, -1.166126, 0.6625496, 0, 0, 0, 1, 1,
0.5400576, 0.2892567, 0.271972, 0, 0, 0, 1, 1,
0.5402542, -0.6381454, 2.85918, 0, 0, 0, 1, 1,
0.5470479, 0.3088261, 0.2035272, 0, 0, 0, 1, 1,
0.5506224, -0.05780025, 0.1827981, 0, 0, 0, 1, 1,
0.5532069, -1.334343, 2.670404, 0, 0, 0, 1, 1,
0.5533297, 0.06214797, 2.439202, 1, 1, 1, 1, 1,
0.558621, -0.5762869, 2.531545, 1, 1, 1, 1, 1,
0.5681508, -1.680264, 1.281822, 1, 1, 1, 1, 1,
0.5682613, -0.2031646, 3.112811, 1, 1, 1, 1, 1,
0.5720527, 0.4677783, 1.1266, 1, 1, 1, 1, 1,
0.5776188, 1.069617, -1.169209, 1, 1, 1, 1, 1,
0.5806159, -2.06417, 2.091255, 1, 1, 1, 1, 1,
0.5858495, 0.6641846, -0.6511591, 1, 1, 1, 1, 1,
0.5909832, 0.7511439, -0.2531941, 1, 1, 1, 1, 1,
0.5978311, -1.128527, 0.9115672, 1, 1, 1, 1, 1,
0.6008887, 1.282234, -0.6049832, 1, 1, 1, 1, 1,
0.6034799, -0.1759466, 2.405162, 1, 1, 1, 1, 1,
0.6062029, -0.1454603, 3.504689, 1, 1, 1, 1, 1,
0.6062309, -0.04549385, 1.469407, 1, 1, 1, 1, 1,
0.6063963, -1.105595, 2.04058, 1, 1, 1, 1, 1,
0.6138933, 1.596598, -0.828344, 0, 0, 1, 1, 1,
0.6197284, -0.03380694, 0.05965405, 1, 0, 0, 1, 1,
0.6273663, 2.201549, -0.6551502, 1, 0, 0, 1, 1,
0.6288794, -0.3127456, 2.977175, 1, 0, 0, 1, 1,
0.6334751, 0.5151927, 1.905053, 1, 0, 0, 1, 1,
0.6339468, -2.207186, 1.151278, 1, 0, 0, 1, 1,
0.6345287, -0.8506895, 2.332932, 0, 0, 0, 1, 1,
0.6354854, -0.9995635, 3.860064, 0, 0, 0, 1, 1,
0.6372236, -0.7336842, 3.06588, 0, 0, 0, 1, 1,
0.6382699, 0.05328978, 2.837145, 0, 0, 0, 1, 1,
0.6389084, -0.6702853, 3.178165, 0, 0, 0, 1, 1,
0.6402603, 0.4719549, 0.1104742, 0, 0, 0, 1, 1,
0.6506776, 1.281452, 0.05216909, 0, 0, 0, 1, 1,
0.6523098, 1.251008, 0.02500643, 1, 1, 1, 1, 1,
0.6538312, -1.160353, 3.028796, 1, 1, 1, 1, 1,
0.6608235, 0.6632974, 0.2123519, 1, 1, 1, 1, 1,
0.666703, 0.1003079, 3.534452, 1, 1, 1, 1, 1,
0.6717402, -0.8058643, 3.161684, 1, 1, 1, 1, 1,
0.6779858, 0.006393681, 1.915253, 1, 1, 1, 1, 1,
0.6821312, -1.375047, 2.864013, 1, 1, 1, 1, 1,
0.6873446, -0.05860043, 0.8982069, 1, 1, 1, 1, 1,
0.6992811, -1.319396, 1.903328, 1, 1, 1, 1, 1,
0.69939, 0.1362155, 0.5240129, 1, 1, 1, 1, 1,
0.7001762, -0.1878026, 2.819931, 1, 1, 1, 1, 1,
0.7008957, -0.4870927, 2.530205, 1, 1, 1, 1, 1,
0.7043656, -2.609757, 2.854217, 1, 1, 1, 1, 1,
0.7054942, -0.1136012, 3.474978, 1, 1, 1, 1, 1,
0.7113039, -0.854263, 2.359929, 1, 1, 1, 1, 1,
0.7144032, -0.09095593, 1.123994, 0, 0, 1, 1, 1,
0.7160798, 1.370549, 0.08927715, 1, 0, 0, 1, 1,
0.7166722, 0.8136924, 0.6602979, 1, 0, 0, 1, 1,
0.71864, 1.592482, 0.4976335, 1, 0, 0, 1, 1,
0.7205584, -0.126338, 2.457382, 1, 0, 0, 1, 1,
0.7212757, 2.460672, -0.1516106, 1, 0, 0, 1, 1,
0.7222044, -0.5478508, 3.218765, 0, 0, 0, 1, 1,
0.7228604, 0.4854362, 2.465489, 0, 0, 0, 1, 1,
0.7234682, -0.2691162, 1.018608, 0, 0, 0, 1, 1,
0.7237227, 0.03603495, 3.689105, 0, 0, 0, 1, 1,
0.7305505, -0.3703412, 2.008706, 0, 0, 0, 1, 1,
0.7330781, -0.4965822, 1.639765, 0, 0, 0, 1, 1,
0.7351999, 0.06058516, 3.208746, 0, 0, 0, 1, 1,
0.7392342, -1.170107, 3.154459, 1, 1, 1, 1, 1,
0.7415624, 0.496137, 0.527704, 1, 1, 1, 1, 1,
0.7483891, -0.3455934, 2.546726, 1, 1, 1, 1, 1,
0.7546018, -1.298981, 3.656628, 1, 1, 1, 1, 1,
0.7548811, -0.2657541, 0.6081562, 1, 1, 1, 1, 1,
0.7634267, 0.7312245, -0.2323125, 1, 1, 1, 1, 1,
0.7664464, -0.7562711, 2.521885, 1, 1, 1, 1, 1,
0.7766527, -0.8693888, 5.324207, 1, 1, 1, 1, 1,
0.788901, 1.144427, 0.7735659, 1, 1, 1, 1, 1,
0.7898736, 1.288686, -0.2387999, 1, 1, 1, 1, 1,
0.7927721, 0.113416, 2.153794, 1, 1, 1, 1, 1,
0.7930931, -0.07527177, 1.88925, 1, 1, 1, 1, 1,
0.793603, -0.5240312, 0.9907477, 1, 1, 1, 1, 1,
0.796872, -1.455414, 3.432705, 1, 1, 1, 1, 1,
0.798236, -1.151509, 1.393728, 1, 1, 1, 1, 1,
0.7988767, -1.194958, 1.062026, 0, 0, 1, 1, 1,
0.8029995, -0.4882548, -0.06881474, 1, 0, 0, 1, 1,
0.8040538, 1.319225, 1.593388, 1, 0, 0, 1, 1,
0.8155941, 0.3827457, 0.5849919, 1, 0, 0, 1, 1,
0.8168179, -1.461229, 3.671827, 1, 0, 0, 1, 1,
0.8174055, -0.6767129, 0.09522873, 1, 0, 0, 1, 1,
0.8179893, -1.20675, 2.642014, 0, 0, 0, 1, 1,
0.8241192, -1.492721, 2.136431, 0, 0, 0, 1, 1,
0.8306306, 0.6633614, 1.604157, 0, 0, 0, 1, 1,
0.8343877, 2.092863, -0.1635113, 0, 0, 0, 1, 1,
0.8373498, 1.387818, 1.023583, 0, 0, 0, 1, 1,
0.842775, 0.969399, 0.2266525, 0, 0, 0, 1, 1,
0.8454884, -1.044841, 1.739527, 0, 0, 0, 1, 1,
0.8510155, -0.6835796, 3.343954, 1, 1, 1, 1, 1,
0.8544479, 0.2062206, 2.427288, 1, 1, 1, 1, 1,
0.8561084, 1.378204, 0.9218064, 1, 1, 1, 1, 1,
0.8565148, -1.205293, 3.378155, 1, 1, 1, 1, 1,
0.8578259, 0.3112536, 1.500789, 1, 1, 1, 1, 1,
0.8644746, -0.03845193, 2.302084, 1, 1, 1, 1, 1,
0.8672277, 0.4174435, 1.486143, 1, 1, 1, 1, 1,
0.8765281, 0.00549614, 4.127094, 1, 1, 1, 1, 1,
0.8901605, -0.4671455, 2.585169, 1, 1, 1, 1, 1,
0.8962906, -0.1566932, 0.3664584, 1, 1, 1, 1, 1,
0.9072517, -0.1764891, 2.334056, 1, 1, 1, 1, 1,
0.9132642, 0.857241, 1.645109, 1, 1, 1, 1, 1,
0.9245137, -0.616073, 2.066972, 1, 1, 1, 1, 1,
0.9250991, -0.491475, 2.78865, 1, 1, 1, 1, 1,
0.9263773, -0.01020568, 2.774201, 1, 1, 1, 1, 1,
0.9277456, 0.4207139, -0.7033368, 0, 0, 1, 1, 1,
0.9345582, 0.155115, 0.9559513, 1, 0, 0, 1, 1,
0.9368325, -0.971536, 3.089095, 1, 0, 0, 1, 1,
0.9374813, 0.0290189, 2.054217, 1, 0, 0, 1, 1,
0.9382188, -0.4747808, 1.123356, 1, 0, 0, 1, 1,
0.9401131, 1.174791, 0.2182419, 1, 0, 0, 1, 1,
0.946708, 0.7640944, 2.596902, 0, 0, 0, 1, 1,
0.9560671, 0.6843275, 0.9349685, 0, 0, 0, 1, 1,
0.9616208, -0.9866, 0.9452653, 0, 0, 0, 1, 1,
0.9680409, -0.06992699, 2.050157, 0, 0, 0, 1, 1,
0.9776172, -1.294169, 3.239882, 0, 0, 0, 1, 1,
0.9822655, -0.672819, 1.436672, 0, 0, 0, 1, 1,
0.9845443, -1.253624, 3.26249, 0, 0, 0, 1, 1,
0.9989227, 2.587518, 1.438437, 1, 1, 1, 1, 1,
1.000185, 0.2961679, 2.139406, 1, 1, 1, 1, 1,
1.012469, 2.174697, 0.5892889, 1, 1, 1, 1, 1,
1.019945, -0.8468243, -0.7192705, 1, 1, 1, 1, 1,
1.021551, -1.941316, 2.395719, 1, 1, 1, 1, 1,
1.026477, 0.5140813, 3.30155, 1, 1, 1, 1, 1,
1.029891, 1.340729, 0.07926323, 1, 1, 1, 1, 1,
1.031769, 0.2900278, 2.721286, 1, 1, 1, 1, 1,
1.03629, -0.800655, 1.868988, 1, 1, 1, 1, 1,
1.038197, -1.548191, 3.705991, 1, 1, 1, 1, 1,
1.047941, -0.1578765, 1.943149, 1, 1, 1, 1, 1,
1.049114, 0.9418246, 1.383047, 1, 1, 1, 1, 1,
1.054604, 0.2852519, 0.09827267, 1, 1, 1, 1, 1,
1.065157, -0.4586305, 2.991636, 1, 1, 1, 1, 1,
1.06701, 0.9191458, 0.9086758, 1, 1, 1, 1, 1,
1.070714, -0.3269234, -0.0006761505, 0, 0, 1, 1, 1,
1.072205, -2.682212, 3.853443, 1, 0, 0, 1, 1,
1.074538, 0.06095543, -0.02688102, 1, 0, 0, 1, 1,
1.075903, -1.831199, 2.331, 1, 0, 0, 1, 1,
1.079226, -0.5333357, 0.02631477, 1, 0, 0, 1, 1,
1.085369, 1.923489, 1.178496, 1, 0, 0, 1, 1,
1.092094, -0.3711593, 0.8805699, 0, 0, 0, 1, 1,
1.103791, 2.016018, 0.1298346, 0, 0, 0, 1, 1,
1.107743, 0.2763889, 0.9768733, 0, 0, 0, 1, 1,
1.109249, -0.4174551, 2.857463, 0, 0, 0, 1, 1,
1.116211, -0.7401752, 2.970928, 0, 0, 0, 1, 1,
1.12239, 1.807124, 1.010676, 0, 0, 0, 1, 1,
1.129482, 0.4115007, 0.4974978, 0, 0, 0, 1, 1,
1.139837, -0.5473809, 3.453601, 1, 1, 1, 1, 1,
1.14038, -0.2864957, 3.549044, 1, 1, 1, 1, 1,
1.140414, -1.273781, 2.77927, 1, 1, 1, 1, 1,
1.144393, -0.7412484, 2.054085, 1, 1, 1, 1, 1,
1.159912, -0.6043753, 1.255641, 1, 1, 1, 1, 1,
1.165147, -0.139513, 1.773889, 1, 1, 1, 1, 1,
1.170702, -0.189198, 2.061424, 1, 1, 1, 1, 1,
1.179487, -0.2040133, 1.541146, 1, 1, 1, 1, 1,
1.184857, 0.4911491, 2.788806, 1, 1, 1, 1, 1,
1.193983, 0.2490667, 3.030423, 1, 1, 1, 1, 1,
1.194251, 1.363894, 1.662032, 1, 1, 1, 1, 1,
1.195649, -1.653628, 2.457731, 1, 1, 1, 1, 1,
1.197541, 0.7534314, 1.800843, 1, 1, 1, 1, 1,
1.205258, 1.167598, -0.8116521, 1, 1, 1, 1, 1,
1.209781, 0.01044001, 2.682742, 1, 1, 1, 1, 1,
1.2175, -0.3245693, 1.445112, 0, 0, 1, 1, 1,
1.219777, -0.4997792, 3.279003, 1, 0, 0, 1, 1,
1.222448, -1.354178, 1.583617, 1, 0, 0, 1, 1,
1.239579, -0.5423267, -0.05177226, 1, 0, 0, 1, 1,
1.242948, -1.678177, 3.206683, 1, 0, 0, 1, 1,
1.2441, 0.3072249, 2.196097, 1, 0, 0, 1, 1,
1.244723, -0.6670069, 3.010034, 0, 0, 0, 1, 1,
1.24768, 1.330752, -0.07691817, 0, 0, 0, 1, 1,
1.250436, -0.5955071, 3.062614, 0, 0, 0, 1, 1,
1.253012, -0.2342182, 1.151724, 0, 0, 0, 1, 1,
1.255767, 1.955817, 0.9814746, 0, 0, 0, 1, 1,
1.259413, 0.8862804, 0.3639418, 0, 0, 0, 1, 1,
1.261571, 0.8551629, 0.256112, 0, 0, 0, 1, 1,
1.268162, -0.7867274, 2.276591, 1, 1, 1, 1, 1,
1.283141, 1.031672, 1.594718, 1, 1, 1, 1, 1,
1.283857, 0.8754556, -1.309988, 1, 1, 1, 1, 1,
1.28968, -0.2979884, 4.20831, 1, 1, 1, 1, 1,
1.302187, 0.02333416, 2.130428, 1, 1, 1, 1, 1,
1.305721, -0.9722735, 1.466242, 1, 1, 1, 1, 1,
1.305799, -0.9858484, 0.6881459, 1, 1, 1, 1, 1,
1.306354, -0.4608596, 1.947301, 1, 1, 1, 1, 1,
1.310915, 0.8465768, 0.07462832, 1, 1, 1, 1, 1,
1.319185, 1.482191, -0.2187857, 1, 1, 1, 1, 1,
1.319402, 0.001939791, 2.119733, 1, 1, 1, 1, 1,
1.321888, -0.789589, 3.540892, 1, 1, 1, 1, 1,
1.325682, -2.106069, 3.461425, 1, 1, 1, 1, 1,
1.330314, 0.5897639, 0.6179129, 1, 1, 1, 1, 1,
1.338512, -0.2910297, 0.4183441, 1, 1, 1, 1, 1,
1.350276, 0.2131798, 2.683906, 0, 0, 1, 1, 1,
1.358761, 0.8133972, 1.058333, 1, 0, 0, 1, 1,
1.360822, -1.363866, 2.981233, 1, 0, 0, 1, 1,
1.36681, -1.943108, 4.377946, 1, 0, 0, 1, 1,
1.39032, 0.5377557, 1.840671, 1, 0, 0, 1, 1,
1.40091, -0.3729138, 1.979771, 1, 0, 0, 1, 1,
1.401862, -1.327858, 2.058652, 0, 0, 0, 1, 1,
1.402163, 0.8280571, 0.7134407, 0, 0, 0, 1, 1,
1.406839, -0.1406991, 0.941952, 0, 0, 0, 1, 1,
1.452614, -0.1651555, 2.335478, 0, 0, 0, 1, 1,
1.466268, -0.04549887, 1.311009, 0, 0, 0, 1, 1,
1.467116, -1.088246, 1.984669, 0, 0, 0, 1, 1,
1.472274, 0.1377837, 1.797301, 0, 0, 0, 1, 1,
1.482498, -0.5275056, 2.036777, 1, 1, 1, 1, 1,
1.485852, -1.504712, 2.325735, 1, 1, 1, 1, 1,
1.486728, 1.996134, -1.069884, 1, 1, 1, 1, 1,
1.500613, -0.2661006, 3.151929, 1, 1, 1, 1, 1,
1.514293, 0.8162671, 0.9794824, 1, 1, 1, 1, 1,
1.530952, -0.8438633, 0.4970932, 1, 1, 1, 1, 1,
1.537556, 0.9284056, 1.92753, 1, 1, 1, 1, 1,
1.537987, 1.202421, 1.980631, 1, 1, 1, 1, 1,
1.541001, 0.00766118, -0.4314945, 1, 1, 1, 1, 1,
1.548069, -0.4169422, 0.590435, 1, 1, 1, 1, 1,
1.551286, -1.180315, 3.085908, 1, 1, 1, 1, 1,
1.554953, 1.126697, 1.637704, 1, 1, 1, 1, 1,
1.568496, 0.5146121, 1.428836, 1, 1, 1, 1, 1,
1.592806, 1.223461, 1.159761, 1, 1, 1, 1, 1,
1.625415, 0.4732201, 2.13851, 1, 1, 1, 1, 1,
1.628027, -0.3880965, 2.582988, 0, 0, 1, 1, 1,
1.65502, -0.4619317, 1.338737, 1, 0, 0, 1, 1,
1.656437, 0.3601589, 0.8758668, 1, 0, 0, 1, 1,
1.665259, -0.6205068, 2.383314, 1, 0, 0, 1, 1,
1.668561, 0.1778799, 1.467103, 1, 0, 0, 1, 1,
1.676498, 0.05687312, 1.815166, 1, 0, 0, 1, 1,
1.679374, 0.9934613, 3.114965, 0, 0, 0, 1, 1,
1.679943, -0.5604728, 1.835029, 0, 0, 0, 1, 1,
1.682401, 0.1508872, 1.843992, 0, 0, 0, 1, 1,
1.705346, -1.124522, 2.328195, 0, 0, 0, 1, 1,
1.724073, 0.424154, 1.578868, 0, 0, 0, 1, 1,
1.734084, -1.497458, 3.825544, 0, 0, 0, 1, 1,
1.739834, 0.1730383, 1.067178, 0, 0, 0, 1, 1,
1.743696, -0.9505616, 1.097889, 1, 1, 1, 1, 1,
1.749076, 0.3653986, 1.263495, 1, 1, 1, 1, 1,
1.766945, 0.1103344, 1.744776, 1, 1, 1, 1, 1,
1.769755, 0.03095928, 1.546659, 1, 1, 1, 1, 1,
1.771413, -1.938987, 2.405939, 1, 1, 1, 1, 1,
1.774504, -0.2942397, 1.455765, 1, 1, 1, 1, 1,
1.778438, -0.3814323, 2.162695, 1, 1, 1, 1, 1,
1.793155, -0.5128814, 2.287282, 1, 1, 1, 1, 1,
1.797881, -1.353859, 2.063332, 1, 1, 1, 1, 1,
1.809261, -0.7127482, 1.828628, 1, 1, 1, 1, 1,
1.812164, -0.2644223, 0.108171, 1, 1, 1, 1, 1,
1.828625, -0.0538701, 2.577203, 1, 1, 1, 1, 1,
1.85638, 1.259849, 0.01846983, 1, 1, 1, 1, 1,
1.87525, -0.1061742, 2.734163, 1, 1, 1, 1, 1,
1.887726, -0.009195689, 2.150056, 1, 1, 1, 1, 1,
1.898827, 0.4978791, 2.77535, 0, 0, 1, 1, 1,
2.002335, 0.3865285, 0.7541842, 1, 0, 0, 1, 1,
2.080588, 0.5993826, 0.8613653, 1, 0, 0, 1, 1,
2.099967, 0.9398694, 0.6858084, 1, 0, 0, 1, 1,
2.109501, 2.079721, 0.3709452, 1, 0, 0, 1, 1,
2.143066, 0.4214848, -0.2934469, 1, 0, 0, 1, 1,
2.147626, 1.063749, 1.870764, 0, 0, 0, 1, 1,
2.151752, 0.2042148, 2.234501, 0, 0, 0, 1, 1,
2.166241, -0.01481513, 0.9711892, 0, 0, 0, 1, 1,
2.224484, -0.2829286, 0.8355219, 0, 0, 0, 1, 1,
2.275799, -0.3103751, 1.904182, 0, 0, 0, 1, 1,
2.276917, -0.4965985, 2.206269, 0, 0, 0, 1, 1,
2.299708, -1.410694, 1.765548, 0, 0, 0, 1, 1,
2.303745, -2.16025, 1.775806, 1, 1, 1, 1, 1,
2.436205, 0.3896293, -0.7483241, 1, 1, 1, 1, 1,
2.441122, 0.9737108, 0.1967671, 1, 1, 1, 1, 1,
2.448146, -0.5586696, 1.854227, 1, 1, 1, 1, 1,
2.465754, 0.8299149, 2.024557, 1, 1, 1, 1, 1,
2.524864, 0.3056116, 0.8038235, 1, 1, 1, 1, 1,
2.953984, 0.4436742, -0.3169909, 1, 1, 1, 1, 1
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
var radius = 9.918834;
var distance = 34.83949;
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
mvMatrix.translate( 0.2099912, 0.003472328, 0.3425038 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.83949);
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
