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
-2.89888, -0.1356405, -2.438886, 1, 0, 0, 1,
-2.846123, 0.3429385, -1.40872, 1, 0.007843138, 0, 1,
-2.831013, -0.08300013, -2.797619, 1, 0.01176471, 0, 1,
-2.783893, 1.948057, -1.475943, 1, 0.01960784, 0, 1,
-2.774064, -0.7433712, -2.426467, 1, 0.02352941, 0, 1,
-2.699111, 0.6962968, -0.7134133, 1, 0.03137255, 0, 1,
-2.656499, -0.1418041, -0.2912474, 1, 0.03529412, 0, 1,
-2.574657, -0.1004351, -3.762846, 1, 0.04313726, 0, 1,
-2.560801, -1.241605, -2.811887, 1, 0.04705882, 0, 1,
-2.417536, 0.7725094, -2.477755, 1, 0.05490196, 0, 1,
-2.388087, 0.3012438, -0.8795086, 1, 0.05882353, 0, 1,
-2.325564, 0.7759759, -1.734979, 1, 0.06666667, 0, 1,
-2.302449, -0.3170595, -1.167825, 1, 0.07058824, 0, 1,
-2.274276, -1.13471, -2.628175, 1, 0.07843138, 0, 1,
-2.27283, 1.362187, -2.285061, 1, 0.08235294, 0, 1,
-2.242923, 0.03376984, -2.351499, 1, 0.09019608, 0, 1,
-2.183512, -1.492884, -0.9871725, 1, 0.09411765, 0, 1,
-2.151683, 0.1473169, -2.367968, 1, 0.1019608, 0, 1,
-2.141294, 0.2234852, -1.046929, 1, 0.1098039, 0, 1,
-2.139957, 0.2175813, -1.89604, 1, 0.1137255, 0, 1,
-2.125843, 0.3295119, 0.3041714, 1, 0.1215686, 0, 1,
-2.125197, -0.4221525, -1.1643, 1, 0.1254902, 0, 1,
-2.081408, 1.062764, -1.958304, 1, 0.1333333, 0, 1,
-2.067926, -0.6228784, -3.927714, 1, 0.1372549, 0, 1,
-2.036872, -0.03881002, -3.232954, 1, 0.145098, 0, 1,
-2.033057, 2.177601, -1.200758, 1, 0.1490196, 0, 1,
-1.996352, 2.092446, -1.207423, 1, 0.1568628, 0, 1,
-1.991257, -1.39179, -2.471035, 1, 0.1607843, 0, 1,
-1.955375, -0.1296782, -2.439289, 1, 0.1686275, 0, 1,
-1.91807, -0.5221758, -2.409202, 1, 0.172549, 0, 1,
-1.897605, 0.7447375, -1.850907, 1, 0.1803922, 0, 1,
-1.893354, -0.2485087, -0.5473632, 1, 0.1843137, 0, 1,
-1.882984, 0.0005075322, -0.2440759, 1, 0.1921569, 0, 1,
-1.87842, 1.316824, -1.968509, 1, 0.1960784, 0, 1,
-1.866088, -0.9015015, -2.414916, 1, 0.2039216, 0, 1,
-1.864882, -0.7276133, -1.63336, 1, 0.2117647, 0, 1,
-1.859539, 0.692786, -0.8743342, 1, 0.2156863, 0, 1,
-1.845723, -1.255914, -2.349021, 1, 0.2235294, 0, 1,
-1.828254, -0.7518799, -1.500917, 1, 0.227451, 0, 1,
-1.827442, -0.496596, -2.169073, 1, 0.2352941, 0, 1,
-1.826606, -0.7990117, -2.208971, 1, 0.2392157, 0, 1,
-1.823926, 1.013362, -1.069586, 1, 0.2470588, 0, 1,
-1.817083, 0.05298755, -1.858173, 1, 0.2509804, 0, 1,
-1.801365, 0.6511844, 0.1906527, 1, 0.2588235, 0, 1,
-1.789468, 1.626783, -1.856863, 1, 0.2627451, 0, 1,
-1.783044, -0.06863658, -4.126345, 1, 0.2705882, 0, 1,
-1.755208, -0.659562, -0.4929991, 1, 0.2745098, 0, 1,
-1.746773, 0.8641502, -0.2071924, 1, 0.282353, 0, 1,
-1.728987, 0.5179818, -0.8806379, 1, 0.2862745, 0, 1,
-1.728382, -0.7487495, -3.985291, 1, 0.2941177, 0, 1,
-1.725962, 0.08128359, -2.766927, 1, 0.3019608, 0, 1,
-1.694717, -0.4044415, -2.417134, 1, 0.3058824, 0, 1,
-1.693056, 1.398567, -2.314135, 1, 0.3137255, 0, 1,
-1.681737, -0.5255242, -2.148729, 1, 0.3176471, 0, 1,
-1.675124, -0.6743582, -2.447264, 1, 0.3254902, 0, 1,
-1.668232, 0.5248171, -1.190701, 1, 0.3294118, 0, 1,
-1.658262, -1.413893, -3.349542, 1, 0.3372549, 0, 1,
-1.649246, -0.7257029, -1.421632, 1, 0.3411765, 0, 1,
-1.642751, 0.7336467, 0.1366461, 1, 0.3490196, 0, 1,
-1.642137, -0.2439993, -1.842598, 1, 0.3529412, 0, 1,
-1.641175, 1.982776, -0.7990499, 1, 0.3607843, 0, 1,
-1.635756, 0.7068512, -0.98387, 1, 0.3647059, 0, 1,
-1.635312, 0.6110922, -0.2723994, 1, 0.372549, 0, 1,
-1.631298, -0.1572198, -3.31558, 1, 0.3764706, 0, 1,
-1.622724, -3.440721, -3.590049, 1, 0.3843137, 0, 1,
-1.620992, 0.5127106, -0.4068429, 1, 0.3882353, 0, 1,
-1.62087, -0.512215, -1.28505, 1, 0.3960784, 0, 1,
-1.617374, -0.874386, -2.543212, 1, 0.4039216, 0, 1,
-1.615637, 1.76397, -0.857348, 1, 0.4078431, 0, 1,
-1.6142, -1.047695, -1.098429, 1, 0.4156863, 0, 1,
-1.61387, -1.86314, -2.566058, 1, 0.4196078, 0, 1,
-1.596324, -0.4685352, -3.606952, 1, 0.427451, 0, 1,
-1.584629, 0.01870088, -4.221675, 1, 0.4313726, 0, 1,
-1.583978, 0.3736641, -1.75524, 1, 0.4392157, 0, 1,
-1.581804, 0.7252206, 1.4491, 1, 0.4431373, 0, 1,
-1.568712, 1.09838, 0.716262, 1, 0.4509804, 0, 1,
-1.561744, -0.2403033, -3.08535, 1, 0.454902, 0, 1,
-1.538999, -0.9032738, -2.777977, 1, 0.4627451, 0, 1,
-1.521984, 0.4666481, 1.049177, 1, 0.4666667, 0, 1,
-1.519939, 2.885205, -0.4203073, 1, 0.4745098, 0, 1,
-1.518045, 1.722777, 0.1961396, 1, 0.4784314, 0, 1,
-1.508319, 0.5810537, -1.124052, 1, 0.4862745, 0, 1,
-1.50608, -1.264274, -0.5491419, 1, 0.4901961, 0, 1,
-1.489858, -1.094009, -1.682622, 1, 0.4980392, 0, 1,
-1.484355, -0.6427493, -2.983322, 1, 0.5058824, 0, 1,
-1.482089, -0.06581262, -2.576687, 1, 0.509804, 0, 1,
-1.476525, 2.06759, 0.4351023, 1, 0.5176471, 0, 1,
-1.470023, 1.54122, 0.1477776, 1, 0.5215687, 0, 1,
-1.467858, -0.6976779, -3.356424, 1, 0.5294118, 0, 1,
-1.442896, 0.2557447, -1.364806, 1, 0.5333334, 0, 1,
-1.408138, 0.5764263, -1.100187, 1, 0.5411765, 0, 1,
-1.391731, 1.540634, -0.07547105, 1, 0.5450981, 0, 1,
-1.37549, 1.165645, -1.066268, 1, 0.5529412, 0, 1,
-1.359064, -0.5648804, -2.735234, 1, 0.5568628, 0, 1,
-1.353651, 0.6559948, 0.5822574, 1, 0.5647059, 0, 1,
-1.34689, 0.1833359, -1.186379, 1, 0.5686275, 0, 1,
-1.339377, -0.8045133, -2.128647, 1, 0.5764706, 0, 1,
-1.330059, 1.118134, -0.8508214, 1, 0.5803922, 0, 1,
-1.315542, 1.008794, -0.7328633, 1, 0.5882353, 0, 1,
-1.31175, -0.3030449, -0.1438055, 1, 0.5921569, 0, 1,
-1.309985, 0.3695059, -1.578691, 1, 0.6, 0, 1,
-1.3097, -0.1985303, -2.743937, 1, 0.6078432, 0, 1,
-1.304956, 1.286395, -0.4372801, 1, 0.6117647, 0, 1,
-1.304128, -0.6135758, -2.753489, 1, 0.6196079, 0, 1,
-1.303217, -0.005237462, -1.418996, 1, 0.6235294, 0, 1,
-1.296715, 0.0362631, -4.367642, 1, 0.6313726, 0, 1,
-1.276901, 0.7998819, -1.92688, 1, 0.6352941, 0, 1,
-1.268966, -1.465058, -2.32202, 1, 0.6431373, 0, 1,
-1.264404, -0.9767963, -2.761354, 1, 0.6470588, 0, 1,
-1.261627, -0.4361178, -1.138665, 1, 0.654902, 0, 1,
-1.259705, 0.5571213, -1.131477, 1, 0.6588235, 0, 1,
-1.255664, -1.214314, -1.3272, 1, 0.6666667, 0, 1,
-1.253473, -1.14885, -1.757238, 1, 0.6705883, 0, 1,
-1.24937, -0.7427513, -2.188723, 1, 0.6784314, 0, 1,
-1.247818, 1.367278, 0.02917128, 1, 0.682353, 0, 1,
-1.241915, -0.5114578, -2.39052, 1, 0.6901961, 0, 1,
-1.238126, -0.2359553, -0.6899452, 1, 0.6941177, 0, 1,
-1.234239, 0.3976708, 0.3037605, 1, 0.7019608, 0, 1,
-1.231133, -1.392749, -2.443242, 1, 0.7098039, 0, 1,
-1.215542, -1.049832, -3.101596, 1, 0.7137255, 0, 1,
-1.215017, 0.5584649, 0.5552928, 1, 0.7215686, 0, 1,
-1.20828, 0.473147, 0.5073666, 1, 0.7254902, 0, 1,
-1.205534, 0.6558474, 0.6866046, 1, 0.7333333, 0, 1,
-1.204662, 0.4374713, -2.090979, 1, 0.7372549, 0, 1,
-1.202847, 0.8061053, -1.616391, 1, 0.7450981, 0, 1,
-1.195774, 1.258147, -0.2664433, 1, 0.7490196, 0, 1,
-1.191563, 2.201861, 0.06121835, 1, 0.7568628, 0, 1,
-1.18924, -0.979746, -4.072676, 1, 0.7607843, 0, 1,
-1.186233, -0.7414086, -4.085666, 1, 0.7686275, 0, 1,
-1.185322, 0.4175309, -1.07282, 1, 0.772549, 0, 1,
-1.18471, -0.9003392, -1.709121, 1, 0.7803922, 0, 1,
-1.184608, 2.807867, 0.006082678, 1, 0.7843137, 0, 1,
-1.1829, 1.250579, -0.3868387, 1, 0.7921569, 0, 1,
-1.174589, -1.187858, -2.300604, 1, 0.7960784, 0, 1,
-1.17369, 0.4428175, -2.329694, 1, 0.8039216, 0, 1,
-1.172293, 1.389621, -0.5829837, 1, 0.8117647, 0, 1,
-1.15859, 0.4643198, -0.9161199, 1, 0.8156863, 0, 1,
-1.157193, 0.0772239, -0.6089342, 1, 0.8235294, 0, 1,
-1.156885, -1.052876, -2.26528, 1, 0.827451, 0, 1,
-1.152952, 0.6905634, -0.1079446, 1, 0.8352941, 0, 1,
-1.152788, 1.020525, -2.924776, 1, 0.8392157, 0, 1,
-1.146538, -1.37773, -2.189199, 1, 0.8470588, 0, 1,
-1.131017, -0.1875042, -3.769499, 1, 0.8509804, 0, 1,
-1.121859, -0.7567235, -1.817428, 1, 0.8588235, 0, 1,
-1.121796, 0.2637308, -1.015161, 1, 0.8627451, 0, 1,
-1.116426, 0.8493994, -1.223692, 1, 0.8705882, 0, 1,
-1.111611, 0.9375394, -1.38942, 1, 0.8745098, 0, 1,
-1.110302, 0.2742589, -1.653917, 1, 0.8823529, 0, 1,
-1.107853, -1.810678, -3.350492, 1, 0.8862745, 0, 1,
-1.107262, -1.077806, -3.13243, 1, 0.8941177, 0, 1,
-1.10499, 0.4396493, -0.5350477, 1, 0.8980392, 0, 1,
-1.102846, -0.9775873, -2.246801, 1, 0.9058824, 0, 1,
-1.095111, 1.599083, -0.2562214, 1, 0.9137255, 0, 1,
-1.094883, -0.1098204, -1.923039, 1, 0.9176471, 0, 1,
-1.0941, -0.6146198, -1.890644, 1, 0.9254902, 0, 1,
-1.091261, 1.237381, -1.862723, 1, 0.9294118, 0, 1,
-1.089665, 1.08333, -1.88051, 1, 0.9372549, 0, 1,
-1.081001, 0.3857855, -1.826316, 1, 0.9411765, 0, 1,
-1.076274, 1.248278, -1.097972, 1, 0.9490196, 0, 1,
-1.072748, 0.8592441, -1.526617, 1, 0.9529412, 0, 1,
-1.071422, 0.9636855, -2.370009, 1, 0.9607843, 0, 1,
-1.065574, 0.6305993, 1.203178, 1, 0.9647059, 0, 1,
-1.062753, 1.093253, -1.120151, 1, 0.972549, 0, 1,
-1.061961, -3.17385, -1.732609, 1, 0.9764706, 0, 1,
-1.059758, -0.3273435, -1.713248, 1, 0.9843137, 0, 1,
-1.059025, -1.314479, -1.847896, 1, 0.9882353, 0, 1,
-1.058048, 1.453534, -1.498572, 1, 0.9960784, 0, 1,
-1.044984, -0.1582496, -1.144644, 0.9960784, 1, 0, 1,
-1.042977, 0.6938375, 1.170956, 0.9921569, 1, 0, 1,
-1.038538, -0.2900666, -1.664824, 0.9843137, 1, 0, 1,
-1.035178, 0.3607165, -0.3024778, 0.9803922, 1, 0, 1,
-1.030891, -1.553135, -1.870515, 0.972549, 1, 0, 1,
-1.029015, 1.61565, -2.178335, 0.9686275, 1, 0, 1,
-1.026309, -0.1342407, -1.097398, 0.9607843, 1, 0, 1,
-1.022234, 1.502783, -0.3932305, 0.9568627, 1, 0, 1,
-1.019165, -0.3063151, -3.306536, 0.9490196, 1, 0, 1,
-1.01883, 1.267443, 0.1240514, 0.945098, 1, 0, 1,
-1.010177, 1.072712, 0.008362466, 0.9372549, 1, 0, 1,
-1.005408, -0.66688, -2.419816, 0.9333333, 1, 0, 1,
-1.001877, 1.979204, -0.3373696, 0.9254902, 1, 0, 1,
-1.001096, 1.721502, 0.6102322, 0.9215686, 1, 0, 1,
-0.9991671, -0.6955754, -2.236378, 0.9137255, 1, 0, 1,
-0.9955412, 1.034795, -0.990289, 0.9098039, 1, 0, 1,
-0.9927483, 2.84532, -0.7206877, 0.9019608, 1, 0, 1,
-0.9885975, 0.1762454, -0.8753449, 0.8941177, 1, 0, 1,
-0.9863737, -0.705557, -1.8064, 0.8901961, 1, 0, 1,
-0.9844843, 1.335781, 0.3951564, 0.8823529, 1, 0, 1,
-0.9818373, -1.204623, -2.901489, 0.8784314, 1, 0, 1,
-0.9797795, 0.9926786, -1.030717, 0.8705882, 1, 0, 1,
-0.9691378, 2.857993, 1.334797, 0.8666667, 1, 0, 1,
-0.9635049, -0.7798244, -2.977417, 0.8588235, 1, 0, 1,
-0.9613667, -0.406873, -1.066326, 0.854902, 1, 0, 1,
-0.9605472, 0.2782471, -1.026904, 0.8470588, 1, 0, 1,
-0.9509476, -0.7647978, -1.297791, 0.8431373, 1, 0, 1,
-0.9471508, 0.6673979, 0.2927783, 0.8352941, 1, 0, 1,
-0.9399796, 1.604069, -0.05817876, 0.8313726, 1, 0, 1,
-0.9398514, -1.204811, -1.379981, 0.8235294, 1, 0, 1,
-0.9398065, 1.562708, -0.2706785, 0.8196079, 1, 0, 1,
-0.9364915, 0.5659261, -0.9062514, 0.8117647, 1, 0, 1,
-0.934808, 1.012333, -0.2237463, 0.8078431, 1, 0, 1,
-0.9348074, -0.8109078, -2.599933, 0.8, 1, 0, 1,
-0.9215966, -0.1730038, -2.878275, 0.7921569, 1, 0, 1,
-0.9194853, -0.1375019, -4.493959, 0.7882353, 1, 0, 1,
-0.9089508, -1.296173, -1.619478, 0.7803922, 1, 0, 1,
-0.9030433, -0.2632574, -1.671587, 0.7764706, 1, 0, 1,
-0.9019033, -0.8874438, -3.076054, 0.7686275, 1, 0, 1,
-0.8988642, 0.9362593, -1.792849, 0.7647059, 1, 0, 1,
-0.8987298, 1.498785, 0.4948375, 0.7568628, 1, 0, 1,
-0.8920015, 0.1932108, -1.486882, 0.7529412, 1, 0, 1,
-0.8878965, 1.21407, -1.099521, 0.7450981, 1, 0, 1,
-0.8868473, -0.3048614, -2.037295, 0.7411765, 1, 0, 1,
-0.8833674, 0.02292879, -0.839222, 0.7333333, 1, 0, 1,
-0.8791978, 0.1914668, -1.566892, 0.7294118, 1, 0, 1,
-0.872053, -0.1013016, -1.016517, 0.7215686, 1, 0, 1,
-0.8685592, 0.5036266, -0.6337524, 0.7176471, 1, 0, 1,
-0.8647847, -2.542814, -3.435726, 0.7098039, 1, 0, 1,
-0.8616268, 1.58133, 0.1914264, 0.7058824, 1, 0, 1,
-0.8595852, -0.004953815, -1.633231, 0.6980392, 1, 0, 1,
-0.8565264, 1.34748, 1.217767, 0.6901961, 1, 0, 1,
-0.8508846, -1.556761, -2.618307, 0.6862745, 1, 0, 1,
-0.8482651, -1.137736, -3.063253, 0.6784314, 1, 0, 1,
-0.8475114, -0.6161368, -2.497171, 0.6745098, 1, 0, 1,
-0.844737, -1.640749, -2.453119, 0.6666667, 1, 0, 1,
-0.8440127, -1.038309, -3.490114, 0.6627451, 1, 0, 1,
-0.8371114, -0.4175294, -0.5108618, 0.654902, 1, 0, 1,
-0.8337808, 0.8077915, -0.9246893, 0.6509804, 1, 0, 1,
-0.8318679, 0.3150311, -2.183586, 0.6431373, 1, 0, 1,
-0.8286963, -1.47885, -3.086217, 0.6392157, 1, 0, 1,
-0.8260517, -1.435026, -2.908609, 0.6313726, 1, 0, 1,
-0.8257614, -2.127913, -2.58442, 0.627451, 1, 0, 1,
-0.822086, 0.0207886, -2.262905, 0.6196079, 1, 0, 1,
-0.8207116, -0.7259598, 0.1399729, 0.6156863, 1, 0, 1,
-0.8181693, -1.809159, -2.660109, 0.6078432, 1, 0, 1,
-0.8172328, -1.174959, -1.551429, 0.6039216, 1, 0, 1,
-0.8164907, 0.663732, -1.155695, 0.5960785, 1, 0, 1,
-0.8074237, -0.228861, -1.882778, 0.5882353, 1, 0, 1,
-0.8059216, -0.6776618, -3.259241, 0.5843138, 1, 0, 1,
-0.8055631, -0.05259838, -1.091249, 0.5764706, 1, 0, 1,
-0.8003342, 0.1120084, -0.7803954, 0.572549, 1, 0, 1,
-0.7931719, 0.3910521, -0.3917083, 0.5647059, 1, 0, 1,
-0.7903309, -0.7885464, -2.12139, 0.5607843, 1, 0, 1,
-0.7890675, 1.581835, -0.02916681, 0.5529412, 1, 0, 1,
-0.7866002, 0.7086843, -2.974637, 0.5490196, 1, 0, 1,
-0.7812445, 1.787572, -1.476242, 0.5411765, 1, 0, 1,
-0.7803003, -0.1456126, -2.15888, 0.5372549, 1, 0, 1,
-0.7771851, 0.3032007, -0.9068211, 0.5294118, 1, 0, 1,
-0.7765972, 0.3638669, -0.4177029, 0.5254902, 1, 0, 1,
-0.7722386, -2.930885, -3.980973, 0.5176471, 1, 0, 1,
-0.7496198, 0.08944119, -2.322266, 0.5137255, 1, 0, 1,
-0.7463977, -2.005614, -2.542249, 0.5058824, 1, 0, 1,
-0.740283, -0.5649229, -1.599093, 0.5019608, 1, 0, 1,
-0.7296885, 0.7179011, -0.6918381, 0.4941176, 1, 0, 1,
-0.7291475, 0.3585328, -1.657125, 0.4862745, 1, 0, 1,
-0.7240818, 0.8426546, -1.347166, 0.4823529, 1, 0, 1,
-0.7238116, -0.826893, -1.349463, 0.4745098, 1, 0, 1,
-0.7212188, 2.103948, -0.2139959, 0.4705882, 1, 0, 1,
-0.7201028, 1.212068, -0.7473826, 0.4627451, 1, 0, 1,
-0.7188802, 0.5661123, -1.087238, 0.4588235, 1, 0, 1,
-0.7174239, 1.933576, -1.615236, 0.4509804, 1, 0, 1,
-0.7169185, 0.04347325, -2.05212, 0.4470588, 1, 0, 1,
-0.7156022, -0.2164108, -1.687834, 0.4392157, 1, 0, 1,
-0.7152328, -1.342469, -3.388987, 0.4352941, 1, 0, 1,
-0.7124487, 1.918021, 1.745999, 0.427451, 1, 0, 1,
-0.710342, 0.9355136, -0.812216, 0.4235294, 1, 0, 1,
-0.707537, -0.1482135, 0.7418364, 0.4156863, 1, 0, 1,
-0.7064624, 0.3143387, -1.62233, 0.4117647, 1, 0, 1,
-0.7041511, -0.4494539, -3.499506, 0.4039216, 1, 0, 1,
-0.6995322, 2.123769, -1.875205, 0.3960784, 1, 0, 1,
-0.6974417, -0.3784816, -0.9945843, 0.3921569, 1, 0, 1,
-0.6954034, 0.06630055, -2.164569, 0.3843137, 1, 0, 1,
-0.6921532, 0.5155149, 0.1694868, 0.3803922, 1, 0, 1,
-0.6769176, -1.405271, -2.162747, 0.372549, 1, 0, 1,
-0.674345, -2.115992, -2.647151, 0.3686275, 1, 0, 1,
-0.6722133, -2.230052, -1.671666, 0.3607843, 1, 0, 1,
-0.6666113, 0.3948487, -0.9857876, 0.3568628, 1, 0, 1,
-0.6663587, -0.8549586, -2.990943, 0.3490196, 1, 0, 1,
-0.6642442, 1.278567, 1.02931, 0.345098, 1, 0, 1,
-0.6619679, 0.4617022, 0.1093902, 0.3372549, 1, 0, 1,
-0.6616218, 0.4806331, -0.9313188, 0.3333333, 1, 0, 1,
-0.6593383, 3.052846, 0.03557401, 0.3254902, 1, 0, 1,
-0.6568931, 0.000712709, -3.979416, 0.3215686, 1, 0, 1,
-0.6490687, -2.168123, -2.82882, 0.3137255, 1, 0, 1,
-0.6488854, 1.243662, -0.148422, 0.3098039, 1, 0, 1,
-0.6476246, -0.9417669, -2.226335, 0.3019608, 1, 0, 1,
-0.6468274, 2.009946, -1.92902, 0.2941177, 1, 0, 1,
-0.6440946, 1.121829, -2.426419, 0.2901961, 1, 0, 1,
-0.6430589, -0.08328132, -1.145728, 0.282353, 1, 0, 1,
-0.6389469, 0.4972674, 0.8774645, 0.2784314, 1, 0, 1,
-0.6386645, -0.8019604, -2.185814, 0.2705882, 1, 0, 1,
-0.6385742, 0.5876275, 1.27211, 0.2666667, 1, 0, 1,
-0.6368782, -1.862036, -2.645204, 0.2588235, 1, 0, 1,
-0.6299196, -0.4401856, -2.702185, 0.254902, 1, 0, 1,
-0.6219483, 0.2564918, -1.775265, 0.2470588, 1, 0, 1,
-0.6168348, 0.2413419, -2.215426, 0.2431373, 1, 0, 1,
-0.616518, 0.07803334, -2.169137, 0.2352941, 1, 0, 1,
-0.6049457, -2.357135, -2.82151, 0.2313726, 1, 0, 1,
-0.6028062, -0.3586716, -1.91812, 0.2235294, 1, 0, 1,
-0.596548, 0.6285883, -1.486169, 0.2196078, 1, 0, 1,
-0.5951343, -0.06996219, -3.642614, 0.2117647, 1, 0, 1,
-0.5908521, 0.2467128, -0.3454331, 0.2078431, 1, 0, 1,
-0.589943, -0.3628133, -2.336678, 0.2, 1, 0, 1,
-0.5887948, 0.6805743, -0.666484, 0.1921569, 1, 0, 1,
-0.5861754, -1.241263, -1.491343, 0.1882353, 1, 0, 1,
-0.582401, 1.132288, -0.0432942, 0.1803922, 1, 0, 1,
-0.5822773, -0.3954769, 0.338733, 0.1764706, 1, 0, 1,
-0.5789137, -0.1816006, -0.5046499, 0.1686275, 1, 0, 1,
-0.5783259, 1.451653, 0.07381759, 0.1647059, 1, 0, 1,
-0.5739775, 0.47218, -2.374007, 0.1568628, 1, 0, 1,
-0.5695356, -0.8831601, -3.405887, 0.1529412, 1, 0, 1,
-0.5652859, -0.2176391, -1.813704, 0.145098, 1, 0, 1,
-0.5631699, 1.679535, 1.230942, 0.1411765, 1, 0, 1,
-0.5605165, 0.8134478, -1.366036, 0.1333333, 1, 0, 1,
-0.5590501, -0.5663093, -1.863591, 0.1294118, 1, 0, 1,
-0.5565047, -0.8636923, -4.308639, 0.1215686, 1, 0, 1,
-0.5552754, -1.191315, -3.332897, 0.1176471, 1, 0, 1,
-0.5514021, -0.8845046, -2.699129, 0.1098039, 1, 0, 1,
-0.5505955, 0.2001785, -1.538982, 0.1058824, 1, 0, 1,
-0.5471375, 0.1318988, -1.95421, 0.09803922, 1, 0, 1,
-0.5440829, 1.045848, 0.1874327, 0.09019608, 1, 0, 1,
-0.5365914, -0.2578804, -1.841138, 0.08627451, 1, 0, 1,
-0.5197068, -1.109495, -2.500691, 0.07843138, 1, 0, 1,
-0.5175621, -1.375514, -3.213147, 0.07450981, 1, 0, 1,
-0.5110039, -2.901986, -2.461066, 0.06666667, 1, 0, 1,
-0.5071921, -0.9332229, -2.757643, 0.0627451, 1, 0, 1,
-0.505249, 0.9907625, 0.5256684, 0.05490196, 1, 0, 1,
-0.5017821, 1.203187, 0.06998075, 0.05098039, 1, 0, 1,
-0.4993082, -1.726367, -2.49446, 0.04313726, 1, 0, 1,
-0.4955518, 0.08267491, 0.4792626, 0.03921569, 1, 0, 1,
-0.4919194, 0.1226562, -3.242931, 0.03137255, 1, 0, 1,
-0.4906127, -1.839623, -3.658044, 0.02745098, 1, 0, 1,
-0.4899919, 1.544172, -0.3747074, 0.01960784, 1, 0, 1,
-0.4885201, -0.586866, -3.205175, 0.01568628, 1, 0, 1,
-0.4870871, 0.6191267, 0.2820681, 0.007843138, 1, 0, 1,
-0.4755093, -1.563038, -2.242479, 0.003921569, 1, 0, 1,
-0.4707925, 1.453597, 0.467667, 0, 1, 0.003921569, 1,
-0.4632482, 0.08655406, -0.9277356, 0, 1, 0.01176471, 1,
-0.4591234, 0.1227736, -1.001469, 0, 1, 0.01568628, 1,
-0.4540926, 0.3614466, 1.999213, 0, 1, 0.02352941, 1,
-0.4534563, 1.285751, 1.209193, 0, 1, 0.02745098, 1,
-0.4523284, 0.2290142, 0.6727431, 0, 1, 0.03529412, 1,
-0.4510666, 0.066411, -2.255387, 0, 1, 0.03921569, 1,
-0.4473863, 0.4252067, -0.03030825, 0, 1, 0.04705882, 1,
-0.4448609, 1.413474, 0.5304849, 0, 1, 0.05098039, 1,
-0.4417946, 1.006226, -0.2887729, 0, 1, 0.05882353, 1,
-0.4417021, 1.079599, 1.072195, 0, 1, 0.0627451, 1,
-0.4390635, -0.587027, -3.547797, 0, 1, 0.07058824, 1,
-0.4328892, 0.02071661, -0.4229255, 0, 1, 0.07450981, 1,
-0.4319382, 0.6031016, -1.173074, 0, 1, 0.08235294, 1,
-0.4279665, 0.4648345, -0.9189113, 0, 1, 0.08627451, 1,
-0.4266541, 0.4808435, -2.167258, 0, 1, 0.09411765, 1,
-0.4251624, -0.01915579, 0.1684705, 0, 1, 0.1019608, 1,
-0.4245319, -0.2494357, -0.8655828, 0, 1, 0.1058824, 1,
-0.4244727, -1.593064, -2.139023, 0, 1, 0.1137255, 1,
-0.4241913, 0.177867, -0.7777653, 0, 1, 0.1176471, 1,
-0.4196005, -2.664983, -4.703068, 0, 1, 0.1254902, 1,
-0.4188667, -2.049277, -2.824002, 0, 1, 0.1294118, 1,
-0.4165092, 0.02432371, -0.3533897, 0, 1, 0.1372549, 1,
-0.4136144, -0.9723729, -2.807044, 0, 1, 0.1411765, 1,
-0.4079555, -0.4803356, -1.772437, 0, 1, 0.1490196, 1,
-0.4061682, 0.1790062, -0.6477979, 0, 1, 0.1529412, 1,
-0.405305, -0.8920094, -1.2292, 0, 1, 0.1607843, 1,
-0.3991041, -0.3677142, -1.251602, 0, 1, 0.1647059, 1,
-0.3936523, -1.941114, -3.967297, 0, 1, 0.172549, 1,
-0.392814, 0.3398345, -0.6442182, 0, 1, 0.1764706, 1,
-0.3906384, -1.018248, -2.751092, 0, 1, 0.1843137, 1,
-0.3872991, -0.6862116, -2.197437, 0, 1, 0.1882353, 1,
-0.3852684, 0.7719294, 0.2352746, 0, 1, 0.1960784, 1,
-0.384277, 0.05120338, -1.395712, 0, 1, 0.2039216, 1,
-0.3839906, -2.053017, -3.755333, 0, 1, 0.2078431, 1,
-0.3783233, -1.024354, -3.90149, 0, 1, 0.2156863, 1,
-0.3774379, 0.7966636, -0.4594645, 0, 1, 0.2196078, 1,
-0.3772536, -1.032363, -5.234303, 0, 1, 0.227451, 1,
-0.3768008, -0.3579638, -2.423676, 0, 1, 0.2313726, 1,
-0.3766399, 0.1217937, -1.358294, 0, 1, 0.2392157, 1,
-0.3715745, -0.3130806, -3.183186, 0, 1, 0.2431373, 1,
-0.3686543, -1.250365, -2.902786, 0, 1, 0.2509804, 1,
-0.3681771, -0.8128254, -2.870203, 0, 1, 0.254902, 1,
-0.3666213, 1.275802, 0.3869035, 0, 1, 0.2627451, 1,
-0.3629829, -1.336197, -1.480011, 0, 1, 0.2666667, 1,
-0.3528225, -0.6908216, -2.740038, 0, 1, 0.2745098, 1,
-0.3525212, 0.5842713, -0.6719664, 0, 1, 0.2784314, 1,
-0.3493299, -0.3596739, -2.449067, 0, 1, 0.2862745, 1,
-0.339094, 0.6140953, -0.2641396, 0, 1, 0.2901961, 1,
-0.3362478, -0.04465061, -2.41556, 0, 1, 0.2980392, 1,
-0.334092, 1.560319, 0.5061797, 0, 1, 0.3058824, 1,
-0.3331012, -0.8512506, -1.921985, 0, 1, 0.3098039, 1,
-0.3320564, 1.174883, -0.5693369, 0, 1, 0.3176471, 1,
-0.3320173, -0.5606301, -2.660736, 0, 1, 0.3215686, 1,
-0.3319848, 0.6718578, -2.41009, 0, 1, 0.3294118, 1,
-0.3271428, -0.581364, -0.7074814, 0, 1, 0.3333333, 1,
-0.3264991, 0.5789886, -2.023934, 0, 1, 0.3411765, 1,
-0.3215121, -1.403417, -4.392429, 0, 1, 0.345098, 1,
-0.3205697, 1.812095, 0.4866508, 0, 1, 0.3529412, 1,
-0.319739, 0.5287349, -0.4298023, 0, 1, 0.3568628, 1,
-0.3174941, -0.4027357, -1.119085, 0, 1, 0.3647059, 1,
-0.3146347, 0.3635484, 0.04159031, 0, 1, 0.3686275, 1,
-0.3142802, 0.9684917, -1.043625, 0, 1, 0.3764706, 1,
-0.3123818, 1.143987, 0.9266089, 0, 1, 0.3803922, 1,
-0.3092295, 0.4738703, 0.2010286, 0, 1, 0.3882353, 1,
-0.309197, -2.632123, -2.075113, 0, 1, 0.3921569, 1,
-0.3076186, -2.184687, -4.545052, 0, 1, 0.4, 1,
-0.3054869, 1.119057, -0.1230263, 0, 1, 0.4078431, 1,
-0.2979408, -0.09604301, -1.498058, 0, 1, 0.4117647, 1,
-0.2911377, -0.6039069, -3.274884, 0, 1, 0.4196078, 1,
-0.2906886, -0.04070914, -3.035523, 0, 1, 0.4235294, 1,
-0.2900402, -0.2529246, -1.663451, 0, 1, 0.4313726, 1,
-0.2876468, -0.4592755, -3.275889, 0, 1, 0.4352941, 1,
-0.2859524, 1.647274, -0.1992719, 0, 1, 0.4431373, 1,
-0.2828096, 0.7387623, -0.3954354, 0, 1, 0.4470588, 1,
-0.2822796, -0.5385813, -1.760358, 0, 1, 0.454902, 1,
-0.2816488, 0.09789762, -1.785025, 0, 1, 0.4588235, 1,
-0.2791753, -1.612541, -4.065929, 0, 1, 0.4666667, 1,
-0.2780944, -1.073317, -4.2412, 0, 1, 0.4705882, 1,
-0.2758085, -1.270239, -1.994527, 0, 1, 0.4784314, 1,
-0.2714711, 0.3600485, 0.1853562, 0, 1, 0.4823529, 1,
-0.2654736, 2.93956, -1.411839, 0, 1, 0.4901961, 1,
-0.2654341, -1.246322, -2.412099, 0, 1, 0.4941176, 1,
-0.2606498, 1.305428, 1.077142, 0, 1, 0.5019608, 1,
-0.2604374, -0.3040708, -2.709925, 0, 1, 0.509804, 1,
-0.2577365, 0.4367178, 0.8945636, 0, 1, 0.5137255, 1,
-0.2536241, 0.2219649, -1.461457, 0, 1, 0.5215687, 1,
-0.2531105, 1.151716, -0.7212461, 0, 1, 0.5254902, 1,
-0.2493938, -0.6155922, -3.834892, 0, 1, 0.5333334, 1,
-0.2391022, -1.644334, -3.164268, 0, 1, 0.5372549, 1,
-0.2381635, 2.143251e-06, -1.423576, 0, 1, 0.5450981, 1,
-0.2373579, 0.7083085, -0.1783895, 0, 1, 0.5490196, 1,
-0.2330644, -0.3228258, -1.533838, 0, 1, 0.5568628, 1,
-0.2313604, -1.20265, -2.173908, 0, 1, 0.5607843, 1,
-0.229476, 0.7415452, -0.3844929, 0, 1, 0.5686275, 1,
-0.2294308, 0.1943542, -1.981705, 0, 1, 0.572549, 1,
-0.2283752, -0.5935064, -2.664459, 0, 1, 0.5803922, 1,
-0.226844, -0.9893293, -1.368487, 0, 1, 0.5843138, 1,
-0.225528, 0.8458902, -1.100199, 0, 1, 0.5921569, 1,
-0.2244065, 0.5295748, -0.9635328, 0, 1, 0.5960785, 1,
-0.2152009, 0.1942629, -0.06510065, 0, 1, 0.6039216, 1,
-0.2148527, -1.088903, -1.554155, 0, 1, 0.6117647, 1,
-0.2132557, 0.6539182, -0.339936, 0, 1, 0.6156863, 1,
-0.2130712, -0.06301386, -3.554595, 0, 1, 0.6235294, 1,
-0.2116826, 0.8226143, -0.3147855, 0, 1, 0.627451, 1,
-0.2108314, 0.3385382, -0.3234678, 0, 1, 0.6352941, 1,
-0.2107632, 0.6143505, 0.05618265, 0, 1, 0.6392157, 1,
-0.2098838, -1.008903, -2.776135, 0, 1, 0.6470588, 1,
-0.2021804, -2.394685, -3.304401, 0, 1, 0.6509804, 1,
-0.2000722, -0.3503291, -0.6828616, 0, 1, 0.6588235, 1,
-0.1974073, 0.05419366, -1.260258, 0, 1, 0.6627451, 1,
-0.1920068, 1.048955, -0.5014264, 0, 1, 0.6705883, 1,
-0.1903349, -2.52754, -4.050974, 0, 1, 0.6745098, 1,
-0.1875191, 0.4867396, -1.45208, 0, 1, 0.682353, 1,
-0.1875024, 0.8932471, 2.151598, 0, 1, 0.6862745, 1,
-0.1869867, -0.4408529, -3.321016, 0, 1, 0.6941177, 1,
-0.1836203, 1.350875, 0.1490832, 0, 1, 0.7019608, 1,
-0.1819863, 1.539559, 0.8405303, 0, 1, 0.7058824, 1,
-0.1807292, 1.232939, 0.04816678, 0, 1, 0.7137255, 1,
-0.1753392, -0.5669361, -2.290372, 0, 1, 0.7176471, 1,
-0.1747611, 1.774626, -0.7552522, 0, 1, 0.7254902, 1,
-0.1741969, -0.2489392, -2.013288, 0, 1, 0.7294118, 1,
-0.1713374, -0.758803, -3.797051, 0, 1, 0.7372549, 1,
-0.1670975, -1.298541, -4.868116, 0, 1, 0.7411765, 1,
-0.1655814, 0.6618294, -2.119963, 0, 1, 0.7490196, 1,
-0.1642043, -0.7624089, -3.043925, 0, 1, 0.7529412, 1,
-0.1612837, 2.725626, -1.015888, 0, 1, 0.7607843, 1,
-0.1588811, -0.2683405, -2.009302, 0, 1, 0.7647059, 1,
-0.1564464, -1.417917, -2.760964, 0, 1, 0.772549, 1,
-0.1481496, -1.782525, -1.484452, 0, 1, 0.7764706, 1,
-0.1470656, 0.01614288, -2.161385, 0, 1, 0.7843137, 1,
-0.1433123, 1.392769, -0.3843408, 0, 1, 0.7882353, 1,
-0.1395164, -1.413087, -5.082778, 0, 1, 0.7960784, 1,
-0.1341535, -1.034717, -3.608077, 0, 1, 0.8039216, 1,
-0.1318678, 0.1551721, 0.04787801, 0, 1, 0.8078431, 1,
-0.1312265, 1.971316, 0.1147548, 0, 1, 0.8156863, 1,
-0.1298538, -0.4908753, -2.485216, 0, 1, 0.8196079, 1,
-0.1150479, 2.082045, 0.4917857, 0, 1, 0.827451, 1,
-0.1116154, -0.3929104, -1.975257, 0, 1, 0.8313726, 1,
-0.1113709, 0.09607551, -2.599811, 0, 1, 0.8392157, 1,
-0.1110031, -0.04403186, -3.924192, 0, 1, 0.8431373, 1,
-0.1091077, -1.12157, -2.972369, 0, 1, 0.8509804, 1,
-0.1047807, -0.7607087, -2.617654, 0, 1, 0.854902, 1,
-0.09647611, -0.2614602, -3.806528, 0, 1, 0.8627451, 1,
-0.09535372, 0.658771, -0.9152213, 0, 1, 0.8666667, 1,
-0.09219809, -0.7193925, -3.007423, 0, 1, 0.8745098, 1,
-0.09188688, -0.8086431, -2.331698, 0, 1, 0.8784314, 1,
-0.09129031, 1.227185, -0.4406549, 0, 1, 0.8862745, 1,
-0.09036013, 2.048043, 0.7415251, 0, 1, 0.8901961, 1,
-0.08604683, 1.320197, -0.03365722, 0, 1, 0.8980392, 1,
-0.08390744, 0.006243366, -0.5097866, 0, 1, 0.9058824, 1,
-0.08322828, -0.7342262, -3.355132, 0, 1, 0.9098039, 1,
-0.07719927, -0.245914, -0.7550297, 0, 1, 0.9176471, 1,
-0.07637711, 0.08067451, -2.041512, 0, 1, 0.9215686, 1,
-0.07249491, 0.8365476, -0.5221226, 0, 1, 0.9294118, 1,
-0.06746786, -0.6319518, -3.53949, 0, 1, 0.9333333, 1,
-0.06554414, 0.9570591, 1.340071, 0, 1, 0.9411765, 1,
-0.06340558, -0.8274854, -4.278617, 0, 1, 0.945098, 1,
-0.05496481, -0.7170854, -1.286859, 0, 1, 0.9529412, 1,
-0.05401225, 0.7187201, 0.4829776, 0, 1, 0.9568627, 1,
-0.05100587, -1.442237, -3.757751, 0, 1, 0.9647059, 1,
-0.04999088, -0.6988913, -1.972242, 0, 1, 0.9686275, 1,
-0.04726904, -0.2558331, -4.21157, 0, 1, 0.9764706, 1,
-0.04690683, 0.4058872, 0.4312516, 0, 1, 0.9803922, 1,
-0.04602151, 0.3302883, 2.654657, 0, 1, 0.9882353, 1,
-0.0425387, -0.65458, -1.224695, 0, 1, 0.9921569, 1,
-0.03863524, -1.292366, -3.718183, 0, 1, 1, 1,
-0.03386403, -0.9503067, -1.117778, 0, 0.9921569, 1, 1,
-0.02532948, -0.6409496, -4.349921, 0, 0.9882353, 1, 1,
-0.02454527, 0.4047763, -0.3687812, 0, 0.9803922, 1, 1,
-0.02138984, -1.527026, -3.452699, 0, 0.9764706, 1, 1,
-0.01728621, -1.266501, -2.721179, 0, 0.9686275, 1, 1,
-0.01716772, 0.3672247, 0.5176327, 0, 0.9647059, 1, 1,
-0.01471841, 0.7167342, 0.8492919, 0, 0.9568627, 1, 1,
-0.01047882, -1.870162, -2.859652, 0, 0.9529412, 1, 1,
-0.007365471, -0.3235703, -1.237362, 0, 0.945098, 1, 1,
-0.006036068, 0.1060879, -1.381943, 0, 0.9411765, 1, 1,
-0.004048869, -0.07476231, -4.726852, 0, 0.9333333, 1, 1,
-0.003961544, 0.5061738, -0.3656301, 0, 0.9294118, 1, 1,
-0.0004140385, 1.324021, 1.026155, 0, 0.9215686, 1, 1,
0.0005519553, -2.033505, 3.815093, 0, 0.9176471, 1, 1,
0.002112188, 0.7425346, 0.1146966, 0, 0.9098039, 1, 1,
0.002850735, -0.7697157, 3.566414, 0, 0.9058824, 1, 1,
0.007566785, -0.4542143, 3.183753, 0, 0.8980392, 1, 1,
0.007837195, 1.548044, -0.5647626, 0, 0.8901961, 1, 1,
0.01369579, -1.725572, 2.944977, 0, 0.8862745, 1, 1,
0.01573589, -0.5341018, 2.680897, 0, 0.8784314, 1, 1,
0.0162558, -1.110995, 3.922586, 0, 0.8745098, 1, 1,
0.02955901, -1.217495, 3.256518, 0, 0.8666667, 1, 1,
0.03324658, 1.230776, -2.019549, 0, 0.8627451, 1, 1,
0.03768181, 2.12044, 0.5748999, 0, 0.854902, 1, 1,
0.04093213, 1.030567, -1.400909, 0, 0.8509804, 1, 1,
0.04094036, 0.5227505, -0.8422168, 0, 0.8431373, 1, 1,
0.04152235, 0.7630517, 0.3218199, 0, 0.8392157, 1, 1,
0.04660783, 0.4011202, -0.748481, 0, 0.8313726, 1, 1,
0.04937441, 0.594652, -1.836665, 0, 0.827451, 1, 1,
0.05180658, 0.912378, 1.263907, 0, 0.8196079, 1, 1,
0.05365235, 0.3255399, 0.885335, 0, 0.8156863, 1, 1,
0.05468661, 1.513279, 1.25035, 0, 0.8078431, 1, 1,
0.05528739, 0.04012674, -0.4055019, 0, 0.8039216, 1, 1,
0.0570075, 0.5985984, 0.2269437, 0, 0.7960784, 1, 1,
0.05800982, 1.658214, -0.1462156, 0, 0.7882353, 1, 1,
0.06126118, -0.5275, 1.882114, 0, 0.7843137, 1, 1,
0.06253503, 0.1705322, 1.014367, 0, 0.7764706, 1, 1,
0.06583534, 1.112487, 0.2273011, 0, 0.772549, 1, 1,
0.06598936, 0.3114978, 0.3209257, 0, 0.7647059, 1, 1,
0.06861395, 1.448044, 1.153729, 0, 0.7607843, 1, 1,
0.06936461, 0.4189056, 0.7154278, 0, 0.7529412, 1, 1,
0.07014948, -1.794294, 3.746646, 0, 0.7490196, 1, 1,
0.0823999, 1.92188, -0.8522236, 0, 0.7411765, 1, 1,
0.08254842, 0.6174328, 1.663981, 0, 0.7372549, 1, 1,
0.08598025, 0.1191908, -0.4252638, 0, 0.7294118, 1, 1,
0.08874743, -1.396923, 5.994686, 0, 0.7254902, 1, 1,
0.09246891, -2.099957, 2.672227, 0, 0.7176471, 1, 1,
0.09503724, -0.3394521, 1.734714, 0, 0.7137255, 1, 1,
0.09686141, 0.583427, -0.1842716, 0, 0.7058824, 1, 1,
0.0987822, 0.9084792, 0.8122537, 0, 0.6980392, 1, 1,
0.1061911, 1.491064, 0.03696388, 0, 0.6941177, 1, 1,
0.1119915, 0.03566156, 3.176277, 0, 0.6862745, 1, 1,
0.1126578, 0.1052403, 2.087179, 0, 0.682353, 1, 1,
0.1149071, 0.6329356, -0.1087111, 0, 0.6745098, 1, 1,
0.1160508, -0.2977491, 2.170651, 0, 0.6705883, 1, 1,
0.1201899, -0.7577676, 4.56461, 0, 0.6627451, 1, 1,
0.1262271, -1.507552, 2.164585, 0, 0.6588235, 1, 1,
0.1275599, -0.5854613, 3.167195, 0, 0.6509804, 1, 1,
0.1286994, -0.1316757, 2.970247, 0, 0.6470588, 1, 1,
0.1308673, 0.6590133, -0.4970357, 0, 0.6392157, 1, 1,
0.1347141, -0.5700656, 3.779063, 0, 0.6352941, 1, 1,
0.1351, -1.336744, 2.7731, 0, 0.627451, 1, 1,
0.1355646, 1.223727, 0.227753, 0, 0.6235294, 1, 1,
0.1427278, -0.2623883, 1.613565, 0, 0.6156863, 1, 1,
0.1438716, -0.022318, 0.8580272, 0, 0.6117647, 1, 1,
0.1485102, 0.188921, 1.586564, 0, 0.6039216, 1, 1,
0.1500173, 0.1003866, 1.246656, 0, 0.5960785, 1, 1,
0.1505265, 0.5673752, 0.501522, 0, 0.5921569, 1, 1,
0.1514712, -0.7170116, 1.354773, 0, 0.5843138, 1, 1,
0.1532331, -0.9908463, 4.238074, 0, 0.5803922, 1, 1,
0.1572094, -0.2528496, 4.036263, 0, 0.572549, 1, 1,
0.1603518, -0.4354855, 2.107786, 0, 0.5686275, 1, 1,
0.1706881, 1.339348, 0.4247264, 0, 0.5607843, 1, 1,
0.1782653, 0.4653049, 2.646437, 0, 0.5568628, 1, 1,
0.1811889, 1.056633, 1.346356, 0, 0.5490196, 1, 1,
0.181559, -0.1077467, 2.534488, 0, 0.5450981, 1, 1,
0.1820286, 0.3957699, 0.2033023, 0, 0.5372549, 1, 1,
0.1820327, 0.5097063, 1.094322, 0, 0.5333334, 1, 1,
0.1828842, 1.157628, 0.03331916, 0, 0.5254902, 1, 1,
0.1878931, -2.206905, 4.437711, 0, 0.5215687, 1, 1,
0.1896963, 0.1495947, 1.847409, 0, 0.5137255, 1, 1,
0.190512, 0.7533858, -0.7782971, 0, 0.509804, 1, 1,
0.1913927, -0.04408977, 2.031996, 0, 0.5019608, 1, 1,
0.1924273, 1.246738, 0.4595392, 0, 0.4941176, 1, 1,
0.193122, -0.9028556, 3.974562, 0, 0.4901961, 1, 1,
0.1944083, -1.04746, 2.628349, 0, 0.4823529, 1, 1,
0.1968225, 0.8947633, 0.706852, 0, 0.4784314, 1, 1,
0.200757, 0.07919119, 2.649786, 0, 0.4705882, 1, 1,
0.2012916, -1.394701, 2.360934, 0, 0.4666667, 1, 1,
0.2014436, -0.03064761, 1.772137, 0, 0.4588235, 1, 1,
0.2107299, 1.260549, -0.3858378, 0, 0.454902, 1, 1,
0.2147799, 0.05063632, 1.647583, 0, 0.4470588, 1, 1,
0.2213315, -1.255433, 1.79178, 0, 0.4431373, 1, 1,
0.2244067, -0.2952097, 1.58753, 0, 0.4352941, 1, 1,
0.2252105, 0.002141479, 0.4051546, 0, 0.4313726, 1, 1,
0.2257055, 1.814104, -0.8050705, 0, 0.4235294, 1, 1,
0.2261749, 0.211978, -0.06698812, 0, 0.4196078, 1, 1,
0.2266321, -0.267985, 1.822589, 0, 0.4117647, 1, 1,
0.2306484, -1.073132, 4.300679, 0, 0.4078431, 1, 1,
0.2378647, 1.161686, 1.412367, 0, 0.4, 1, 1,
0.2405148, 0.5219457, -1.134872, 0, 0.3921569, 1, 1,
0.2415274, 1.522967, -0.9706514, 0, 0.3882353, 1, 1,
0.2427831, -1.009306, 2.243687, 0, 0.3803922, 1, 1,
0.2431439, 0.1070865, 1.736529, 0, 0.3764706, 1, 1,
0.2504405, -1.105231, 1.696506, 0, 0.3686275, 1, 1,
0.2511427, -0.1534336, 0.5738109, 0, 0.3647059, 1, 1,
0.2597996, -0.2330844, 3.188197, 0, 0.3568628, 1, 1,
0.2663659, -0.2457001, 2.798476, 0, 0.3529412, 1, 1,
0.2673218, -1.233283, 2.629748, 0, 0.345098, 1, 1,
0.268507, 1.24917, 0.4971325, 0, 0.3411765, 1, 1,
0.2691308, -1.192761, 2.879437, 0, 0.3333333, 1, 1,
0.2709619, -1.421664, 3.239374, 0, 0.3294118, 1, 1,
0.2715494, -2.57321, 3.113305, 0, 0.3215686, 1, 1,
0.2722935, 1.32296, 0.3869437, 0, 0.3176471, 1, 1,
0.276254, 0.4589714, 0.5744742, 0, 0.3098039, 1, 1,
0.2769032, -0.4382357, 1.759135, 0, 0.3058824, 1, 1,
0.2846398, 0.2162207, 3.249226, 0, 0.2980392, 1, 1,
0.2864366, -0.7818304, 0.679617, 0, 0.2901961, 1, 1,
0.2867879, 0.2180278, 0.7137982, 0, 0.2862745, 1, 1,
0.2868543, -0.7601613, 1.815864, 0, 0.2784314, 1, 1,
0.2877819, -0.1461688, 1.647798, 0, 0.2745098, 1, 1,
0.2878105, 0.6870911, 0.531556, 0, 0.2666667, 1, 1,
0.2885337, -2.182326, 3.88695, 0, 0.2627451, 1, 1,
0.2889437, 0.3904839, -0.4589469, 0, 0.254902, 1, 1,
0.2937877, -0.02710049, 2.329144, 0, 0.2509804, 1, 1,
0.3005604, -1.410361, 2.787134, 0, 0.2431373, 1, 1,
0.3026345, 0.9358868, -0.1309377, 0, 0.2392157, 1, 1,
0.3041494, 0.682714, -0.5237693, 0, 0.2313726, 1, 1,
0.3070714, -0.08910256, 1.874567, 0, 0.227451, 1, 1,
0.3086098, -0.7158343, 2.822935, 0, 0.2196078, 1, 1,
0.3120251, -1.677139, 2.472906, 0, 0.2156863, 1, 1,
0.3160567, 0.4711583, 2.708608, 0, 0.2078431, 1, 1,
0.3163561, -2.154895, 2.123507, 0, 0.2039216, 1, 1,
0.3187709, 0.6934718, 0.4507076, 0, 0.1960784, 1, 1,
0.3225163, -0.9341097, 1.894601, 0, 0.1882353, 1, 1,
0.3288886, 0.6169681, -0.3556919, 0, 0.1843137, 1, 1,
0.3294108, 1.026825, -0.4682358, 0, 0.1764706, 1, 1,
0.3301356, -1.515631, 2.94729, 0, 0.172549, 1, 1,
0.3371041, 0.2448179, 0.1959768, 0, 0.1647059, 1, 1,
0.3377445, -1.606736, 2.873901, 0, 0.1607843, 1, 1,
0.3448517, -0.9482645, 1.983901, 0, 0.1529412, 1, 1,
0.3485559, 0.1458497, 1.774024, 0, 0.1490196, 1, 1,
0.3488254, 1.688926, -0.4419508, 0, 0.1411765, 1, 1,
0.3491736, 1.131722, -0.08625355, 0, 0.1372549, 1, 1,
0.3534675, -0.5564908, 3.320071, 0, 0.1294118, 1, 1,
0.3579823, 0.4599047, 2.182829, 0, 0.1254902, 1, 1,
0.3607273, -0.5282612, 2.188584, 0, 0.1176471, 1, 1,
0.3619412, -0.05528581, 1.4149, 0, 0.1137255, 1, 1,
0.3663806, -1.221661, 3.070855, 0, 0.1058824, 1, 1,
0.3665411, -1.849219, 0.4057165, 0, 0.09803922, 1, 1,
0.3666996, 0.8480184, 0.1694526, 0, 0.09411765, 1, 1,
0.3673545, 0.4172397, 0.8768719, 0, 0.08627451, 1, 1,
0.3680911, -1.952178, 2.142492, 0, 0.08235294, 1, 1,
0.3694606, 2.237174, 0.5822595, 0, 0.07450981, 1, 1,
0.3701901, 0.98882, -0.1141968, 0, 0.07058824, 1, 1,
0.378387, -1.543261, 2.047004, 0, 0.0627451, 1, 1,
0.3811244, -1.54943, 2.891323, 0, 0.05882353, 1, 1,
0.3822452, 0.9020646, -0.435771, 0, 0.05098039, 1, 1,
0.3859278, 0.3762792, 3.598648, 0, 0.04705882, 1, 1,
0.3914088, 0.2273543, 1.65659, 0, 0.03921569, 1, 1,
0.3935146, -0.8529972, 1.551729, 0, 0.03529412, 1, 1,
0.3967201, -0.5081783, 3.770158, 0, 0.02745098, 1, 1,
0.3969236, -1.010777, 1.894266, 0, 0.02352941, 1, 1,
0.3971875, -0.4205381, 2.743114, 0, 0.01568628, 1, 1,
0.3985267, 0.1277781, 0.8094168, 0, 0.01176471, 1, 1,
0.3990936, -0.5922939, 1.567776, 0, 0.003921569, 1, 1,
0.4144674, -0.9488258, 2.239702, 0.003921569, 0, 1, 1,
0.4173962, -0.2781512, 3.592257, 0.007843138, 0, 1, 1,
0.417934, 1.910899, 0.5301509, 0.01568628, 0, 1, 1,
0.4199551, -1.525242, 3.275149, 0.01960784, 0, 1, 1,
0.4216801, -0.3595932, 2.868876, 0.02745098, 0, 1, 1,
0.4245829, 1.289149, -1.847994, 0.03137255, 0, 1, 1,
0.4264746, 1.141936, 0.5116753, 0.03921569, 0, 1, 1,
0.4264959, 1.271063, 1.581928, 0.04313726, 0, 1, 1,
0.429737, -0.2003286, 2.446995, 0.05098039, 0, 1, 1,
0.4337738, -0.2853265, 1.605322, 0.05490196, 0, 1, 1,
0.4364685, 0.6958734, 0.08755884, 0.0627451, 0, 1, 1,
0.4380283, 0.5515714, 2.544044, 0.06666667, 0, 1, 1,
0.4397645, -0.004003263, 2.576802, 0.07450981, 0, 1, 1,
0.4405074, -0.8075761, 3.889109, 0.07843138, 0, 1, 1,
0.4410717, 0.7639133, 1.619776, 0.08627451, 0, 1, 1,
0.44429, -0.3866821, 2.615255, 0.09019608, 0, 1, 1,
0.4517875, 0.641645, 0.2155074, 0.09803922, 0, 1, 1,
0.4541385, -0.4986408, 3.510177, 0.1058824, 0, 1, 1,
0.4550249, 0.8571879, 0.9035479, 0.1098039, 0, 1, 1,
0.4552416, -0.0786639, 0.3299522, 0.1176471, 0, 1, 1,
0.4566709, -0.1006653, 2.184307, 0.1215686, 0, 1, 1,
0.4574317, 0.3048925, -0.7055894, 0.1294118, 0, 1, 1,
0.4600517, 1.185562, -0.08993897, 0.1333333, 0, 1, 1,
0.4601957, -0.5226682, 1.257402, 0.1411765, 0, 1, 1,
0.4643801, -1.296454, 3.10241, 0.145098, 0, 1, 1,
0.4678966, -0.6889371, 3.279071, 0.1529412, 0, 1, 1,
0.4686823, -0.7343479, 2.064223, 0.1568628, 0, 1, 1,
0.4780676, 1.02598, -0.02536415, 0.1647059, 0, 1, 1,
0.4802829, 1.221566, 0.0969681, 0.1686275, 0, 1, 1,
0.4810703, -1.427761, 2.299832, 0.1764706, 0, 1, 1,
0.4832357, -0.2973916, 2.751168, 0.1803922, 0, 1, 1,
0.4840331, 0.9705699, 0.77947, 0.1882353, 0, 1, 1,
0.4845032, 0.1558924, -0.4930455, 0.1921569, 0, 1, 1,
0.4930701, -0.7106938, 3.26418, 0.2, 0, 1, 1,
0.4942373, 0.5679809, 3.244695, 0.2078431, 0, 1, 1,
0.4964226, 1.009442, 0.225215, 0.2117647, 0, 1, 1,
0.4978657, 0.4852768, -0.2209127, 0.2196078, 0, 1, 1,
0.5012992, -1.762001, 4.189356, 0.2235294, 0, 1, 1,
0.5022932, -1.625424, 4.156636, 0.2313726, 0, 1, 1,
0.5031109, -0.7309136, 0.6682895, 0.2352941, 0, 1, 1,
0.504075, -0.5784893, 4.324647, 0.2431373, 0, 1, 1,
0.5054187, -0.786107, 2.039048, 0.2470588, 0, 1, 1,
0.5076363, -0.5915663, 1.392124, 0.254902, 0, 1, 1,
0.5113914, -0.2935675, 1.865354, 0.2588235, 0, 1, 1,
0.5147026, -1.009822, 3.159365, 0.2666667, 0, 1, 1,
0.5152249, 0.525358, 2.222688, 0.2705882, 0, 1, 1,
0.5194399, -0.3233091, 2.947642, 0.2784314, 0, 1, 1,
0.5195354, -1.549361, 2.21621, 0.282353, 0, 1, 1,
0.5197648, 0.1358782, 1.673938, 0.2901961, 0, 1, 1,
0.5198537, -0.7043966, 1.902921, 0.2941177, 0, 1, 1,
0.5257297, -0.0995161, 2.671349, 0.3019608, 0, 1, 1,
0.536583, 0.639909, 1.574296, 0.3098039, 0, 1, 1,
0.5380727, -0.2068694, 2.43408, 0.3137255, 0, 1, 1,
0.542943, -0.833848, 2.298377, 0.3215686, 0, 1, 1,
0.5468557, 1.618088, -0.3973207, 0.3254902, 0, 1, 1,
0.5481229, -0.4088515, 3.94576, 0.3333333, 0, 1, 1,
0.5496242, -0.2114949, 2.504596, 0.3372549, 0, 1, 1,
0.5586736, 0.05244278, 3.733337, 0.345098, 0, 1, 1,
0.5618187, 0.395459, 0.7404558, 0.3490196, 0, 1, 1,
0.5628828, -0.0432925, 2.003519, 0.3568628, 0, 1, 1,
0.5656268, -0.73059, 2.388621, 0.3607843, 0, 1, 1,
0.5673224, 0.4535125, 1.352894, 0.3686275, 0, 1, 1,
0.570278, 0.03085211, 1.981878, 0.372549, 0, 1, 1,
0.5746015, 0.3406529, -0.5497186, 0.3803922, 0, 1, 1,
0.5799223, -0.6707197, 1.568819, 0.3843137, 0, 1, 1,
0.5958197, 1.158699, 2.64569, 0.3921569, 0, 1, 1,
0.5970458, 0.9936439, -0.500493, 0.3960784, 0, 1, 1,
0.5976711, 1.020227, 1.340205, 0.4039216, 0, 1, 1,
0.599223, 2.246058, 2.85981, 0.4117647, 0, 1, 1,
0.6018161, -0.0283687, 1.597328, 0.4156863, 0, 1, 1,
0.606387, 1.039555, 1.493506, 0.4235294, 0, 1, 1,
0.607303, -0.5339696, 2.278106, 0.427451, 0, 1, 1,
0.6152509, -0.1568203, 4.230874, 0.4352941, 0, 1, 1,
0.6167088, -1.521028, 2.599605, 0.4392157, 0, 1, 1,
0.6208164, -0.8773161, 3.230742, 0.4470588, 0, 1, 1,
0.6269061, 0.1582994, 0.2615963, 0.4509804, 0, 1, 1,
0.6270848, -0.00782676, 3.310704, 0.4588235, 0, 1, 1,
0.627156, 1.075341, 0.3451895, 0.4627451, 0, 1, 1,
0.630845, 1.613759, -0.03184556, 0.4705882, 0, 1, 1,
0.6401658, -0.6257668, 2.066975, 0.4745098, 0, 1, 1,
0.6407127, -0.6076377, 1.464801, 0.4823529, 0, 1, 1,
0.643915, 0.2770689, 1.346524, 0.4862745, 0, 1, 1,
0.644927, -0.2779015, 2.449946, 0.4941176, 0, 1, 1,
0.6464617, -0.7159265, 0.5799995, 0.5019608, 0, 1, 1,
0.647539, 1.413705, 2.060984, 0.5058824, 0, 1, 1,
0.6516099, 0.4685078, -0.7388925, 0.5137255, 0, 1, 1,
0.6535606, -0.7915683, 4.351519, 0.5176471, 0, 1, 1,
0.6535645, 0.8989542, -0.4920768, 0.5254902, 0, 1, 1,
0.6620998, 2.179825, -0.8879381, 0.5294118, 0, 1, 1,
0.6675508, 0.7962019, 0.08385631, 0.5372549, 0, 1, 1,
0.667631, -0.1324696, 3.274829, 0.5411765, 0, 1, 1,
0.6683188, 0.1415957, 0.8281479, 0.5490196, 0, 1, 1,
0.6716083, -0.5518363, 3.836571, 0.5529412, 0, 1, 1,
0.6772869, 1.51112, 1.022767, 0.5607843, 0, 1, 1,
0.6802447, 0.3380547, -0.40727, 0.5647059, 0, 1, 1,
0.6846005, 0.3252028, 1.908252, 0.572549, 0, 1, 1,
0.6922467, 0.4913054, 1.537689, 0.5764706, 0, 1, 1,
0.693293, -1.753294, 4.584676, 0.5843138, 0, 1, 1,
0.6952538, 1.892736, -1.111258, 0.5882353, 0, 1, 1,
0.6957093, -0.01633927, 1.742581, 0.5960785, 0, 1, 1,
0.6961213, -2.430449, 3.066973, 0.6039216, 0, 1, 1,
0.6963516, 0.08577579, 1.643285, 0.6078432, 0, 1, 1,
0.7017719, 0.7775288, 0.06090985, 0.6156863, 0, 1, 1,
0.7037054, 0.2196064, -0.3566314, 0.6196079, 0, 1, 1,
0.7044466, -0.0770277, 2.317575, 0.627451, 0, 1, 1,
0.7109601, -0.5310002, 3.166896, 0.6313726, 0, 1, 1,
0.7118174, -1.110975, 2.064364, 0.6392157, 0, 1, 1,
0.7126896, -0.4649098, 1.167364, 0.6431373, 0, 1, 1,
0.7178882, 1.348048, 0.6187578, 0.6509804, 0, 1, 1,
0.7187484, -1.209143, 2.842443, 0.654902, 0, 1, 1,
0.7197453, -1.428096, 3.935907, 0.6627451, 0, 1, 1,
0.7379172, -0.1707714, -0.5942891, 0.6666667, 0, 1, 1,
0.7381356, 2.54318, -0.1647525, 0.6745098, 0, 1, 1,
0.7388021, 0.3963715, 2.637874, 0.6784314, 0, 1, 1,
0.7388303, 0.1232827, 2.036086, 0.6862745, 0, 1, 1,
0.7468645, -1.91142, 2.297141, 0.6901961, 0, 1, 1,
0.7471353, -1.051889, 3.770806, 0.6980392, 0, 1, 1,
0.75126, 1.293035, -0.03263335, 0.7058824, 0, 1, 1,
0.7586735, -0.1417767, 1.248861, 0.7098039, 0, 1, 1,
0.7606415, 0.3223296, 0.767533, 0.7176471, 0, 1, 1,
0.7616853, -1.658727, 1.79993, 0.7215686, 0, 1, 1,
0.7633227, -1.263765, 3.433324, 0.7294118, 0, 1, 1,
0.7702476, -0.3367496, 2.053301, 0.7333333, 0, 1, 1,
0.7704002, 2.17325, 0.7553654, 0.7411765, 0, 1, 1,
0.7715474, -0.03718812, 1.293113, 0.7450981, 0, 1, 1,
0.7746056, -0.7511244, 2.403795, 0.7529412, 0, 1, 1,
0.7750301, 0.7301571, -0.4771368, 0.7568628, 0, 1, 1,
0.7761132, 0.3203639, 1.857959, 0.7647059, 0, 1, 1,
0.7829198, 0.9494448, -0.3421155, 0.7686275, 0, 1, 1,
0.784386, 0.7730144, -0.879241, 0.7764706, 0, 1, 1,
0.7847643, -0.9077012, 2.648986, 0.7803922, 0, 1, 1,
0.7861173, -1.301616, 1.906764, 0.7882353, 0, 1, 1,
0.7895206, -0.2278937, 1.164214, 0.7921569, 0, 1, 1,
0.7983339, 1.570611, 0.502494, 0.8, 0, 1, 1,
0.7990364, 0.9919043, 0.9547614, 0.8078431, 0, 1, 1,
0.80141, -0.6824648, 2.322197, 0.8117647, 0, 1, 1,
0.8019353, 0.6026685, 1.353091, 0.8196079, 0, 1, 1,
0.8031363, 0.1969166, 1.423097, 0.8235294, 0, 1, 1,
0.809354, 0.1560317, 0.6315849, 0.8313726, 0, 1, 1,
0.8118485, 0.6939446, 0.003523298, 0.8352941, 0, 1, 1,
0.8136855, 1.4259, 0.2818451, 0.8431373, 0, 1, 1,
0.8155688, 0.6584072, 1.000664, 0.8470588, 0, 1, 1,
0.8186488, 0.3684927, 0.739239, 0.854902, 0, 1, 1,
0.8193527, -0.8709213, 2.399084, 0.8588235, 0, 1, 1,
0.8206066, 0.2786009, 2.750257, 0.8666667, 0, 1, 1,
0.8215247, -1.416407, 1.813143, 0.8705882, 0, 1, 1,
0.8251975, 0.2421702, 1.120341, 0.8784314, 0, 1, 1,
0.8295771, 1.412862, 0.04228294, 0.8823529, 0, 1, 1,
0.8339859, 0.226221, 1.430738, 0.8901961, 0, 1, 1,
0.8437159, 0.4469097, 1.768046, 0.8941177, 0, 1, 1,
0.8480799, -0.08853653, 1.074758, 0.9019608, 0, 1, 1,
0.8505119, -0.09633444, 0.6191589, 0.9098039, 0, 1, 1,
0.8516052, -0.2890405, 3.325838, 0.9137255, 0, 1, 1,
0.8535236, -0.8040824, 1.890926, 0.9215686, 0, 1, 1,
0.8595317, 0.3284074, 1.641222, 0.9254902, 0, 1, 1,
0.8646604, -0.765969, 2.772804, 0.9333333, 0, 1, 1,
0.8646891, -0.2444342, 1.886797, 0.9372549, 0, 1, 1,
0.8648055, 1.273064, 1.918395, 0.945098, 0, 1, 1,
0.8695188, 1.579912, 0.08283419, 0.9490196, 0, 1, 1,
0.8697862, 0.5031443, -1.38264, 0.9568627, 0, 1, 1,
0.8726711, -0.4177305, 1.409282, 0.9607843, 0, 1, 1,
0.8779852, 0.1772479, 0.3502819, 0.9686275, 0, 1, 1,
0.8782668, 0.2440151, 1.548105, 0.972549, 0, 1, 1,
0.8823081, -0.04573543, 1.603759, 0.9803922, 0, 1, 1,
0.8868796, 0.8940645, 3.325821, 0.9843137, 0, 1, 1,
0.8938942, -2.101101, 3.399673, 0.9921569, 0, 1, 1,
0.9022546, 1.422264, 0.2463029, 0.9960784, 0, 1, 1,
0.9044859, -1.736518, 1.50647, 1, 0, 0.9960784, 1,
0.906575, -0.4639609, 1.997678, 1, 0, 0.9882353, 1,
0.9067707, 0.4497917, 0.1474469, 1, 0, 0.9843137, 1,
0.9109225, -0.575594, 3.95732, 1, 0, 0.9764706, 1,
0.911033, 0.8793974, 1.60625, 1, 0, 0.972549, 1,
0.9149846, 0.03219596, 3.189225, 1, 0, 0.9647059, 1,
0.9207617, 0.1641709, 1.898643, 1, 0, 0.9607843, 1,
0.9310827, -0.6735955, 1.851387, 1, 0, 0.9529412, 1,
0.93125, 0.3198661, -2.100841, 1, 0, 0.9490196, 1,
0.9317892, -0.18953, 0.01079061, 1, 0, 0.9411765, 1,
0.9321327, 0.488539, 1.447689, 1, 0, 0.9372549, 1,
0.939024, -0.8640315, 3.156364, 1, 0, 0.9294118, 1,
0.9440773, -0.4760863, 1.936661, 1, 0, 0.9254902, 1,
0.9455475, 0.5425332, 2.972452, 1, 0, 0.9176471, 1,
0.9474102, 0.01042329, 0.5211826, 1, 0, 0.9137255, 1,
0.9481692, -0.7862084, 3.471759, 1, 0, 0.9058824, 1,
0.9523988, 2.025891, 2.309494, 1, 0, 0.9019608, 1,
0.9754159, -1.762547, 3.606384, 1, 0, 0.8941177, 1,
0.9759305, -1.015533, 0.5182276, 1, 0, 0.8862745, 1,
0.9807436, -0.1534283, 0.3038964, 1, 0, 0.8823529, 1,
0.9821411, -0.5442088, 1.122598, 1, 0, 0.8745098, 1,
0.9862822, -2.949289, 1.382896, 1, 0, 0.8705882, 1,
0.9884064, -1.264803, 2.885777, 1, 0, 0.8627451, 1,
0.9936026, 0.01381624, 2.789789, 1, 0, 0.8588235, 1,
1.003892, 0.4969561, 0.6180255, 1, 0, 0.8509804, 1,
1.009362, 0.02006, 1.641829, 1, 0, 0.8470588, 1,
1.01291, -0.06780307, 3.063785, 1, 0, 0.8392157, 1,
1.016997, 0.7842444, 1.521141, 1, 0, 0.8352941, 1,
1.017883, -0.478094, 3.799703, 1, 0, 0.827451, 1,
1.021318, 0.4090013, 1.626347, 1, 0, 0.8235294, 1,
1.025671, 0.9924659, 1.628135, 1, 0, 0.8156863, 1,
1.027635, -1.360356, 3.524423, 1, 0, 0.8117647, 1,
1.044047, 0.8146284, 2.138834, 1, 0, 0.8039216, 1,
1.047689, -0.1919616, 2.689883, 1, 0, 0.7960784, 1,
1.050052, -0.8973787, 3.989711, 1, 0, 0.7921569, 1,
1.051282, 0.2343276, -0.6944534, 1, 0, 0.7843137, 1,
1.053389, 1.302629, 1.58777, 1, 0, 0.7803922, 1,
1.055615, -0.9600393, 2.111797, 1, 0, 0.772549, 1,
1.056599, 0.7027796, 0.09614602, 1, 0, 0.7686275, 1,
1.057326, 0.6377573, 1.511385, 1, 0, 0.7607843, 1,
1.058911, 1.240394, -0.3944485, 1, 0, 0.7568628, 1,
1.059545, 0.641464, 1.353858, 1, 0, 0.7490196, 1,
1.060622, -0.5812308, 1.68844, 1, 0, 0.7450981, 1,
1.061317, 0.08231201, 1.65695, 1, 0, 0.7372549, 1,
1.067307, -1.063674, 3.394302, 1, 0, 0.7333333, 1,
1.070745, -0.2299225, 2.917755, 1, 0, 0.7254902, 1,
1.070756, 0.4278513, -0.8868322, 1, 0, 0.7215686, 1,
1.07364, 0.3267849, 1.096111, 1, 0, 0.7137255, 1,
1.08272, 0.6689661, 1.037656, 1, 0, 0.7098039, 1,
1.093112, 3.106876, -0.339427, 1, 0, 0.7019608, 1,
1.104046, 1.636048, 0.3633257, 1, 0, 0.6941177, 1,
1.107365, -1.11854, 1.504113, 1, 0, 0.6901961, 1,
1.114133, 1.361611, -0.4278861, 1, 0, 0.682353, 1,
1.118895, -0.917765, 1.595349, 1, 0, 0.6784314, 1,
1.119263, 1.387507, 3.749566, 1, 0, 0.6705883, 1,
1.126118, 0.2220445, 2.279061, 1, 0, 0.6666667, 1,
1.136296, -0.2967971, 1.814623, 1, 0, 0.6588235, 1,
1.141379, 0.0208928, 1.185046, 1, 0, 0.654902, 1,
1.146876, -1.65605, 2.620207, 1, 0, 0.6470588, 1,
1.166361, 1.482741, -0.7695721, 1, 0, 0.6431373, 1,
1.176349, 1.190229, 0.6672779, 1, 0, 0.6352941, 1,
1.182108, -0.5598601, 2.546737, 1, 0, 0.6313726, 1,
1.183885, -0.9944597, 4.050082, 1, 0, 0.6235294, 1,
1.185276, 0.2145315, 0.008686355, 1, 0, 0.6196079, 1,
1.185385, 1.706993, 1.765256, 1, 0, 0.6117647, 1,
1.195, -0.8812981, 2.62331, 1, 0, 0.6078432, 1,
1.207048, -1.420079, 1.603321, 1, 0, 0.6, 1,
1.212549, 0.2439059, 1.421095, 1, 0, 0.5921569, 1,
1.220146, -0.8691024, 1.88901, 1, 0, 0.5882353, 1,
1.227716, -1.381092, -0.009859989, 1, 0, 0.5803922, 1,
1.228202, -0.9888419, 3.575558, 1, 0, 0.5764706, 1,
1.236765, -0.318293, 1.6125, 1, 0, 0.5686275, 1,
1.237604, 1.592064, 1.271309, 1, 0, 0.5647059, 1,
1.243494, -0.03989386, 1.898212, 1, 0, 0.5568628, 1,
1.250782, 0.08800124, 2.396254, 1, 0, 0.5529412, 1,
1.25434, -0.4466764, 2.540958, 1, 0, 0.5450981, 1,
1.254366, 0.378847, 1.202195, 1, 0, 0.5411765, 1,
1.255974, -0.3928508, 0.6076124, 1, 0, 0.5333334, 1,
1.256779, -2.063077, 4.300882, 1, 0, 0.5294118, 1,
1.267124, -1.082509, 3.830235, 1, 0, 0.5215687, 1,
1.314302, 1.232074, 1.249617, 1, 0, 0.5176471, 1,
1.314515, -0.5715802, 1.933994, 1, 0, 0.509804, 1,
1.319871, 0.5053068, 0.2951489, 1, 0, 0.5058824, 1,
1.347389, -1.307484, 2.025625, 1, 0, 0.4980392, 1,
1.366452, -0.1488215, 1.05438, 1, 0, 0.4901961, 1,
1.373779, 1.362085, 2.040605, 1, 0, 0.4862745, 1,
1.379842, 0.8055442, 1.037333, 1, 0, 0.4784314, 1,
1.384166, 1.716351, 0.3006765, 1, 0, 0.4745098, 1,
1.390741, -1.21063, 2.129855, 1, 0, 0.4666667, 1,
1.390934, -0.02374217, 2.094232, 1, 0, 0.4627451, 1,
1.402793, -0.5907585, 1.758149, 1, 0, 0.454902, 1,
1.437256, -0.4844739, 2.385534, 1, 0, 0.4509804, 1,
1.437498, -1.002721, 2.361432, 1, 0, 0.4431373, 1,
1.43853, -0.03941899, 1.518949, 1, 0, 0.4392157, 1,
1.451075, 0.02547307, 2.686661, 1, 0, 0.4313726, 1,
1.455779, -1.032345, 1.603298, 1, 0, 0.427451, 1,
1.47228, 0.007493211, 2.899625, 1, 0, 0.4196078, 1,
1.473189, 0.8889341, 2.541815, 1, 0, 0.4156863, 1,
1.498511, 0.3506318, 0.6479408, 1, 0, 0.4078431, 1,
1.502338, 0.3837339, 0.3713437, 1, 0, 0.4039216, 1,
1.51845, -0.4268163, 1.408226, 1, 0, 0.3960784, 1,
1.52407, 0.002504747, 2.261448, 1, 0, 0.3882353, 1,
1.539107, 0.1916796, 0.3163496, 1, 0, 0.3843137, 1,
1.541072, 0.8293256, 0.2412181, 1, 0, 0.3764706, 1,
1.550062, -0.0372814, 2.153382, 1, 0, 0.372549, 1,
1.553197, 0.6165755, 1.467106, 1, 0, 0.3647059, 1,
1.568711, -1.369868, 1.88286, 1, 0, 0.3607843, 1,
1.572187, -0.7759105, 0.7373136, 1, 0, 0.3529412, 1,
1.572626, -0.04621206, 0.7455661, 1, 0, 0.3490196, 1,
1.577342, 0.189384, 2.052446, 1, 0, 0.3411765, 1,
1.584443, 0.2306559, 1.377991, 1, 0, 0.3372549, 1,
1.604202, -0.2203972, 1.763842, 1, 0, 0.3294118, 1,
1.606227, 1.241342, 2.413807, 1, 0, 0.3254902, 1,
1.617447, -0.8655817, 3.257252, 1, 0, 0.3176471, 1,
1.623006, 2.51557, 0.3913912, 1, 0, 0.3137255, 1,
1.62901, 0.431539, 2.161513, 1, 0, 0.3058824, 1,
1.645631, -0.8713139, 2.676468, 1, 0, 0.2980392, 1,
1.654858, 1.31663, 0.7732831, 1, 0, 0.2941177, 1,
1.663668, 1.282638, 0.3846851, 1, 0, 0.2862745, 1,
1.665299, -0.7783154, 1.098737, 1, 0, 0.282353, 1,
1.675148, 1.022954, -0.7046719, 1, 0, 0.2745098, 1,
1.679163, -0.4703187, 1.509785, 1, 0, 0.2705882, 1,
1.694478, -0.3685831, 0.3492824, 1, 0, 0.2627451, 1,
1.723336, -1.908885, 2.627145, 1, 0, 0.2588235, 1,
1.725681, -0.01374951, 2.595754, 1, 0, 0.2509804, 1,
1.745399, 0.7516717, -0.3442959, 1, 0, 0.2470588, 1,
1.761068, -0.6947369, 2.437049, 1, 0, 0.2392157, 1,
1.777369, 1.947578, -0.5837287, 1, 0, 0.2352941, 1,
1.781345, 0.5085783, 2.86797, 1, 0, 0.227451, 1,
1.781972, -0.3645843, -0.8328047, 1, 0, 0.2235294, 1,
1.819765, -0.7842418, 1.889202, 1, 0, 0.2156863, 1,
1.85244, -0.498221, 2.809856, 1, 0, 0.2117647, 1,
1.870146, -0.6243739, 3.565145, 1, 0, 0.2039216, 1,
1.872966, 0.1040201, 2.234335, 1, 0, 0.1960784, 1,
1.873443, -1.251636, 3.438878, 1, 0, 0.1921569, 1,
1.875381, 1.154695, 0.08684009, 1, 0, 0.1843137, 1,
1.908308, -0.3791886, 2.546981, 1, 0, 0.1803922, 1,
1.932729, 0.3683222, 0.7011544, 1, 0, 0.172549, 1,
1.933083, 0.5438986, 0.6136144, 1, 0, 0.1686275, 1,
1.968775, -0.520316, 2.077398, 1, 0, 0.1607843, 1,
1.989341, 0.6069211, 1.386323, 1, 0, 0.1568628, 1,
1.99757, -0.2382457, 0.7337475, 1, 0, 0.1490196, 1,
2.030477, 0.4169317, 2.087657, 1, 0, 0.145098, 1,
2.049242, -0.6086909, 3.056073, 1, 0, 0.1372549, 1,
2.060261, -0.5100198, 0.8519444, 1, 0, 0.1333333, 1,
2.096393, 0.5952424, 3.259136, 1, 0, 0.1254902, 1,
2.129932, -1.140187, 1.346727, 1, 0, 0.1215686, 1,
2.143059, 2.092314, -0.1193045, 1, 0, 0.1137255, 1,
2.152652, -0.236961, 2.101569, 1, 0, 0.1098039, 1,
2.154797, 0.1305663, -0.6971677, 1, 0, 0.1019608, 1,
2.158768, 0.02007235, 2.213368, 1, 0, 0.09411765, 1,
2.18305, -0.9086542, 2.405441, 1, 0, 0.09019608, 1,
2.201629, -0.8862804, 3.149984, 1, 0, 0.08235294, 1,
2.253746, -1.593256, 1.814674, 1, 0, 0.07843138, 1,
2.270004, 0.6059877, 0.7543842, 1, 0, 0.07058824, 1,
2.297444, -0.1138928, 2.345581, 1, 0, 0.06666667, 1,
2.303246, 2.770648, 0.9539044, 1, 0, 0.05882353, 1,
2.542637, -0.215727, 2.347544, 1, 0, 0.05490196, 1,
2.571443, -0.1176085, 1.780115, 1, 0, 0.04705882, 1,
2.594664, 0.1627209, 1.232705, 1, 0, 0.04313726, 1,
2.636446, 0.8662629, 1.94726, 1, 0, 0.03529412, 1,
2.761377, 2.803881, 0.279687, 1, 0, 0.03137255, 1,
2.995086, -0.2860879, 1.584405, 1, 0, 0.02352941, 1,
3.367502, 1.584864, 0.9365963, 1, 0, 0.01960784, 1,
3.567975, -0.3586875, 2.294557, 1, 0, 0.01176471, 1,
3.708194, -0.9082139, 0.4998155, 1, 0, 0.007843138, 1
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
0.4046575, -4.550539, -7.137617, 0, -0.5, 0.5, 0.5,
0.4046575, -4.550539, -7.137617, 1, -0.5, 0.5, 0.5,
0.4046575, -4.550539, -7.137617, 1, 1.5, 0.5, 0.5,
0.4046575, -4.550539, -7.137617, 0, 1.5, 0.5, 0.5
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
-4.018779, -0.1669228, -7.137617, 0, -0.5, 0.5, 0.5,
-4.018779, -0.1669228, -7.137617, 1, -0.5, 0.5, 0.5,
-4.018779, -0.1669228, -7.137617, 1, 1.5, 0.5, 0.5,
-4.018779, -0.1669228, -7.137617, 0, 1.5, 0.5, 0.5
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
-4.018779, -4.550539, 0.3801916, 0, -0.5, 0.5, 0.5,
-4.018779, -4.550539, 0.3801916, 1, -0.5, 0.5, 0.5,
-4.018779, -4.550539, 0.3801916, 1, 1.5, 0.5, 0.5,
-4.018779, -4.550539, 0.3801916, 0, 1.5, 0.5, 0.5
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
-2, -3.538935, -5.402738,
3, -3.538935, -5.402738,
-2, -3.538935, -5.402738,
-2, -3.707536, -5.691885,
-1, -3.538935, -5.402738,
-1, -3.707536, -5.691885,
0, -3.538935, -5.402738,
0, -3.707536, -5.691885,
1, -3.538935, -5.402738,
1, -3.707536, -5.691885,
2, -3.538935, -5.402738,
2, -3.707536, -5.691885,
3, -3.538935, -5.402738,
3, -3.707536, -5.691885
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
-2, -4.044737, -6.270177, 0, -0.5, 0.5, 0.5,
-2, -4.044737, -6.270177, 1, -0.5, 0.5, 0.5,
-2, -4.044737, -6.270177, 1, 1.5, 0.5, 0.5,
-2, -4.044737, -6.270177, 0, 1.5, 0.5, 0.5,
-1, -4.044737, -6.270177, 0, -0.5, 0.5, 0.5,
-1, -4.044737, -6.270177, 1, -0.5, 0.5, 0.5,
-1, -4.044737, -6.270177, 1, 1.5, 0.5, 0.5,
-1, -4.044737, -6.270177, 0, 1.5, 0.5, 0.5,
0, -4.044737, -6.270177, 0, -0.5, 0.5, 0.5,
0, -4.044737, -6.270177, 1, -0.5, 0.5, 0.5,
0, -4.044737, -6.270177, 1, 1.5, 0.5, 0.5,
0, -4.044737, -6.270177, 0, 1.5, 0.5, 0.5,
1, -4.044737, -6.270177, 0, -0.5, 0.5, 0.5,
1, -4.044737, -6.270177, 1, -0.5, 0.5, 0.5,
1, -4.044737, -6.270177, 1, 1.5, 0.5, 0.5,
1, -4.044737, -6.270177, 0, 1.5, 0.5, 0.5,
2, -4.044737, -6.270177, 0, -0.5, 0.5, 0.5,
2, -4.044737, -6.270177, 1, -0.5, 0.5, 0.5,
2, -4.044737, -6.270177, 1, 1.5, 0.5, 0.5,
2, -4.044737, -6.270177, 0, 1.5, 0.5, 0.5,
3, -4.044737, -6.270177, 0, -0.5, 0.5, 0.5,
3, -4.044737, -6.270177, 1, -0.5, 0.5, 0.5,
3, -4.044737, -6.270177, 1, 1.5, 0.5, 0.5,
3, -4.044737, -6.270177, 0, 1.5, 0.5, 0.5
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
-2.997986, -3, -5.402738,
-2.997986, 3, -5.402738,
-2.997986, -3, -5.402738,
-3.168118, -3, -5.691885,
-2.997986, -2, -5.402738,
-3.168118, -2, -5.691885,
-2.997986, -1, -5.402738,
-3.168118, -1, -5.691885,
-2.997986, 0, -5.402738,
-3.168118, 0, -5.691885,
-2.997986, 1, -5.402738,
-3.168118, 1, -5.691885,
-2.997986, 2, -5.402738,
-3.168118, 2, -5.691885,
-2.997986, 3, -5.402738,
-3.168118, 3, -5.691885
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
-3.508382, -3, -6.270177, 0, -0.5, 0.5, 0.5,
-3.508382, -3, -6.270177, 1, -0.5, 0.5, 0.5,
-3.508382, -3, -6.270177, 1, 1.5, 0.5, 0.5,
-3.508382, -3, -6.270177, 0, 1.5, 0.5, 0.5,
-3.508382, -2, -6.270177, 0, -0.5, 0.5, 0.5,
-3.508382, -2, -6.270177, 1, -0.5, 0.5, 0.5,
-3.508382, -2, -6.270177, 1, 1.5, 0.5, 0.5,
-3.508382, -2, -6.270177, 0, 1.5, 0.5, 0.5,
-3.508382, -1, -6.270177, 0, -0.5, 0.5, 0.5,
-3.508382, -1, -6.270177, 1, -0.5, 0.5, 0.5,
-3.508382, -1, -6.270177, 1, 1.5, 0.5, 0.5,
-3.508382, -1, -6.270177, 0, 1.5, 0.5, 0.5,
-3.508382, 0, -6.270177, 0, -0.5, 0.5, 0.5,
-3.508382, 0, -6.270177, 1, -0.5, 0.5, 0.5,
-3.508382, 0, -6.270177, 1, 1.5, 0.5, 0.5,
-3.508382, 0, -6.270177, 0, 1.5, 0.5, 0.5,
-3.508382, 1, -6.270177, 0, -0.5, 0.5, 0.5,
-3.508382, 1, -6.270177, 1, -0.5, 0.5, 0.5,
-3.508382, 1, -6.270177, 1, 1.5, 0.5, 0.5,
-3.508382, 1, -6.270177, 0, 1.5, 0.5, 0.5,
-3.508382, 2, -6.270177, 0, -0.5, 0.5, 0.5,
-3.508382, 2, -6.270177, 1, -0.5, 0.5, 0.5,
-3.508382, 2, -6.270177, 1, 1.5, 0.5, 0.5,
-3.508382, 2, -6.270177, 0, 1.5, 0.5, 0.5,
-3.508382, 3, -6.270177, 0, -0.5, 0.5, 0.5,
-3.508382, 3, -6.270177, 1, -0.5, 0.5, 0.5,
-3.508382, 3, -6.270177, 1, 1.5, 0.5, 0.5,
-3.508382, 3, -6.270177, 0, 1.5, 0.5, 0.5
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
-2.997986, -3.538935, -4,
-2.997986, -3.538935, 4,
-2.997986, -3.538935, -4,
-3.168118, -3.707536, -4,
-2.997986, -3.538935, -2,
-3.168118, -3.707536, -2,
-2.997986, -3.538935, 0,
-3.168118, -3.707536, 0,
-2.997986, -3.538935, 2,
-3.168118, -3.707536, 2,
-2.997986, -3.538935, 4,
-3.168118, -3.707536, 4
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
-3.508382, -4.044737, -4, 0, -0.5, 0.5, 0.5,
-3.508382, -4.044737, -4, 1, -0.5, 0.5, 0.5,
-3.508382, -4.044737, -4, 1, 1.5, 0.5, 0.5,
-3.508382, -4.044737, -4, 0, 1.5, 0.5, 0.5,
-3.508382, -4.044737, -2, 0, -0.5, 0.5, 0.5,
-3.508382, -4.044737, -2, 1, -0.5, 0.5, 0.5,
-3.508382, -4.044737, -2, 1, 1.5, 0.5, 0.5,
-3.508382, -4.044737, -2, 0, 1.5, 0.5, 0.5,
-3.508382, -4.044737, 0, 0, -0.5, 0.5, 0.5,
-3.508382, -4.044737, 0, 1, -0.5, 0.5, 0.5,
-3.508382, -4.044737, 0, 1, 1.5, 0.5, 0.5,
-3.508382, -4.044737, 0, 0, 1.5, 0.5, 0.5,
-3.508382, -4.044737, 2, 0, -0.5, 0.5, 0.5,
-3.508382, -4.044737, 2, 1, -0.5, 0.5, 0.5,
-3.508382, -4.044737, 2, 1, 1.5, 0.5, 0.5,
-3.508382, -4.044737, 2, 0, 1.5, 0.5, 0.5,
-3.508382, -4.044737, 4, 0, -0.5, 0.5, 0.5,
-3.508382, -4.044737, 4, 1, -0.5, 0.5, 0.5,
-3.508382, -4.044737, 4, 1, 1.5, 0.5, 0.5,
-3.508382, -4.044737, 4, 0, 1.5, 0.5, 0.5
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
-2.997986, -3.538935, -5.402738,
-2.997986, 3.20509, -5.402738,
-2.997986, -3.538935, 6.163121,
-2.997986, 3.20509, 6.163121,
-2.997986, -3.538935, -5.402738,
-2.997986, -3.538935, 6.163121,
-2.997986, 3.20509, -5.402738,
-2.997986, 3.20509, 6.163121,
-2.997986, -3.538935, -5.402738,
3.807301, -3.538935, -5.402738,
-2.997986, -3.538935, 6.163121,
3.807301, -3.538935, 6.163121,
-2.997986, 3.20509, -5.402738,
3.807301, 3.20509, -5.402738,
-2.997986, 3.20509, 6.163121,
3.807301, 3.20509, 6.163121,
3.807301, -3.538935, -5.402738,
3.807301, 3.20509, -5.402738,
3.807301, -3.538935, 6.163121,
3.807301, 3.20509, 6.163121,
3.807301, -3.538935, -5.402738,
3.807301, -3.538935, 6.163121,
3.807301, 3.20509, -5.402738,
3.807301, 3.20509, 6.163121
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
var radius = 8.019722;
var distance = 35.68064;
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
mvMatrix.translate( -0.4046575, 0.1669228, -0.3801916 );
mvMatrix.scale( 1.274168, 1.285743, 0.7497135 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.68064);
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


