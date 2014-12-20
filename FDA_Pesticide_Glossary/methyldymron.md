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
-3.611007, 1.49475, -1.356983, 1, 0, 0, 1,
-3.231447, 1.049853, -1.556066, 1, 0.007843138, 0, 1,
-2.90266, -0.2577065, -2.415801, 1, 0.01176471, 0, 1,
-2.882829, 0.1251565, -0.0360547, 1, 0.01960784, 0, 1,
-2.670974, -1.820052, -1.715372, 1, 0.02352941, 0, 1,
-2.567604, -0.04862285, -0.7704477, 1, 0.03137255, 0, 1,
-2.559891, -1.514652, -2.685907, 1, 0.03529412, 0, 1,
-2.543296, 0.5843986, -3.169698, 1, 0.04313726, 0, 1,
-2.418732, -0.6057844, -0.9741817, 1, 0.04705882, 0, 1,
-2.339752, -2.219921, -2.741164, 1, 0.05490196, 0, 1,
-2.332032, 1.158484, -1.150788, 1, 0.05882353, 0, 1,
-2.28172, 1.571239, -1.829169, 1, 0.06666667, 0, 1,
-2.280123, 1.063692, -0.1760986, 1, 0.07058824, 0, 1,
-2.271306, 0.03324943, -0.529503, 1, 0.07843138, 0, 1,
-2.224955, 1.508796, -2.518116, 1, 0.08235294, 0, 1,
-2.173327, -1.036674, -1.189716, 1, 0.09019608, 0, 1,
-2.156554, -0.5326862, -4.003542, 1, 0.09411765, 0, 1,
-2.12819, 1.57905, -2.544174, 1, 0.1019608, 0, 1,
-2.124245, -0.6740208, -1.660331, 1, 0.1098039, 0, 1,
-2.116095, -0.6866272, -2.787263, 1, 0.1137255, 0, 1,
-2.029296, 0.4330561, -1.737336, 1, 0.1215686, 0, 1,
-1.954641, -0.4610189, -1.124542, 1, 0.1254902, 0, 1,
-1.946593, -0.1290002, -0.02904788, 1, 0.1333333, 0, 1,
-1.932884, 1.031349, 0.04037796, 1, 0.1372549, 0, 1,
-1.927731, -1.351602, -3.014098, 1, 0.145098, 0, 1,
-1.922479, -1.205672, -3.237343, 1, 0.1490196, 0, 1,
-1.906816, 1.140954, -0.09753032, 1, 0.1568628, 0, 1,
-1.905274, -0.7664005, -1.92603, 1, 0.1607843, 0, 1,
-1.889795, 1.451364, 0.338322, 1, 0.1686275, 0, 1,
-1.880722, 0.5365915, -0.8488034, 1, 0.172549, 0, 1,
-1.879138, 0.3739054, -3.951735, 1, 0.1803922, 0, 1,
-1.844257, -1.580416, -0.3800804, 1, 0.1843137, 0, 1,
-1.834425, -1.096075, -0.547509, 1, 0.1921569, 0, 1,
-1.833205, 0.09435371, -2.413938, 1, 0.1960784, 0, 1,
-1.772462, 0.3014633, -2.232198, 1, 0.2039216, 0, 1,
-1.765092, 1.235119, -1.173458, 1, 0.2117647, 0, 1,
-1.760787, -0.378449, -3.374318, 1, 0.2156863, 0, 1,
-1.750656, -1.281761, -2.833019, 1, 0.2235294, 0, 1,
-1.748007, 0.240078, -2.901837, 1, 0.227451, 0, 1,
-1.731627, 0.968421, -1.633315, 1, 0.2352941, 0, 1,
-1.728249, 1.102597, -2.727462, 1, 0.2392157, 0, 1,
-1.715805, 1.065961, -1.077958, 1, 0.2470588, 0, 1,
-1.705296, -0.7013403, 1.165305, 1, 0.2509804, 0, 1,
-1.699713, -0.362475, -2.08572, 1, 0.2588235, 0, 1,
-1.696342, 0.7490636, -0.8724052, 1, 0.2627451, 0, 1,
-1.687002, -0.7797419, -3.134477, 1, 0.2705882, 0, 1,
-1.658502, -0.4435375, -2.053865, 1, 0.2745098, 0, 1,
-1.656189, 0.354329, -0.6955345, 1, 0.282353, 0, 1,
-1.652304, -1.700829, -4.380074, 1, 0.2862745, 0, 1,
-1.638038, -0.9535081, -2.529077, 1, 0.2941177, 0, 1,
-1.636857, -0.3146819, -2.283814, 1, 0.3019608, 0, 1,
-1.601346, 2.225323, -0.3180833, 1, 0.3058824, 0, 1,
-1.596144, -0.006812762, 0.2258457, 1, 0.3137255, 0, 1,
-1.559563, -0.1843765, -0.5064054, 1, 0.3176471, 0, 1,
-1.558339, 1.35087, 0.09949683, 1, 0.3254902, 0, 1,
-1.535525, 0.871258, 0.1277278, 1, 0.3294118, 0, 1,
-1.524718, -0.7535608, -2.600628, 1, 0.3372549, 0, 1,
-1.516179, 0.4269704, -1.171613, 1, 0.3411765, 0, 1,
-1.512434, 1.164603, -1.277263, 1, 0.3490196, 0, 1,
-1.512176, 0.9966304, -1.519328, 1, 0.3529412, 0, 1,
-1.510519, 0.06529664, 0.05553851, 1, 0.3607843, 0, 1,
-1.498069, -0.3658787, -1.520352, 1, 0.3647059, 0, 1,
-1.494292, -0.3985664, -0.7907276, 1, 0.372549, 0, 1,
-1.49301, 0.8802274, -0.571301, 1, 0.3764706, 0, 1,
-1.487877, -0.3789829, -2.448575, 1, 0.3843137, 0, 1,
-1.487827, 0.6538784, -1.421891, 1, 0.3882353, 0, 1,
-1.483754, 0.2081353, -1.791543, 1, 0.3960784, 0, 1,
-1.482254, -0.9252186, -2.435431, 1, 0.4039216, 0, 1,
-1.466018, 1.346071, -0.7989548, 1, 0.4078431, 0, 1,
-1.447392, 0.5152432, 0.1096896, 1, 0.4156863, 0, 1,
-1.446209, 0.6563041, 0.2567061, 1, 0.4196078, 0, 1,
-1.433536, 1.602408, 0.1819051, 1, 0.427451, 0, 1,
-1.433292, 1.264504, -0.841554, 1, 0.4313726, 0, 1,
-1.41201, -0.2219678, -2.557741, 1, 0.4392157, 0, 1,
-1.402552, -0.7142965, -2.107484, 1, 0.4431373, 0, 1,
-1.381824, 1.508995, -2.034728, 1, 0.4509804, 0, 1,
-1.379296, 0.4511449, -1.350452, 1, 0.454902, 0, 1,
-1.377727, 0.2973059, -1.236709, 1, 0.4627451, 0, 1,
-1.376543, -2.869202, -1.090924, 1, 0.4666667, 0, 1,
-1.372115, -0.9547255, -1.367178, 1, 0.4745098, 0, 1,
-1.367944, 1.629861, -1.788406, 1, 0.4784314, 0, 1,
-1.360373, -1.161882, -3.192617, 1, 0.4862745, 0, 1,
-1.359915, 0.379297, 0.1973749, 1, 0.4901961, 0, 1,
-1.357489, -0.7267061, -1.793651, 1, 0.4980392, 0, 1,
-1.350387, 1.164997, -0.7680014, 1, 0.5058824, 0, 1,
-1.341106, -0.3623122, -2.010401, 1, 0.509804, 0, 1,
-1.331401, -1.359506, -2.444922, 1, 0.5176471, 0, 1,
-1.32778, -1.620961, -1.24555, 1, 0.5215687, 0, 1,
-1.318421, -0.336681, -2.343949, 1, 0.5294118, 0, 1,
-1.313313, -2.047134, -1.323339, 1, 0.5333334, 0, 1,
-1.313281, 1.34128, -2.545628, 1, 0.5411765, 0, 1,
-1.308426, 1.034791, -1.339337, 1, 0.5450981, 0, 1,
-1.299259, -2.000994, -1.468243, 1, 0.5529412, 0, 1,
-1.27172, 0.9005104, -2.718772, 1, 0.5568628, 0, 1,
-1.270665, -1.508352, -4.114398, 1, 0.5647059, 0, 1,
-1.268354, -0.5784423, -2.765296, 1, 0.5686275, 0, 1,
-1.267386, 1.396865, -1.061913, 1, 0.5764706, 0, 1,
-1.266138, -1.182654, -3.135318, 1, 0.5803922, 0, 1,
-1.264908, -0.8523706, -1.623663, 1, 0.5882353, 0, 1,
-1.262338, -0.499345, -2.311163, 1, 0.5921569, 0, 1,
-1.257606, 1.450917, -1.233091, 1, 0.6, 0, 1,
-1.251379, -1.254762, -2.516009, 1, 0.6078432, 0, 1,
-1.234964, -0.8119317, 0.5720198, 1, 0.6117647, 0, 1,
-1.229522, 2.163161, -1.949235, 1, 0.6196079, 0, 1,
-1.228974, 1.601644, -0.2208916, 1, 0.6235294, 0, 1,
-1.22704, -0.1862184, -3.119169, 1, 0.6313726, 0, 1,
-1.225813, -0.6560746, -3.508793, 1, 0.6352941, 0, 1,
-1.221774, -0.5949862, -0.9887516, 1, 0.6431373, 0, 1,
-1.220308, 0.2368034, -2.158352, 1, 0.6470588, 0, 1,
-1.210021, -1.483915, -1.354243, 1, 0.654902, 0, 1,
-1.205045, 0.001461594, -0.2850672, 1, 0.6588235, 0, 1,
-1.199182, -1.328407, -3.070672, 1, 0.6666667, 0, 1,
-1.193329, 0.01661815, -1.434259, 1, 0.6705883, 0, 1,
-1.171065, -1.435798, -2.180715, 1, 0.6784314, 0, 1,
-1.170348, 1.351939, -0.05260311, 1, 0.682353, 0, 1,
-1.164392, 0.5358009, -1.985627, 1, 0.6901961, 0, 1,
-1.164147, 0.6570591, -1.398162, 1, 0.6941177, 0, 1,
-1.162775, -0.5137454, -0.1732206, 1, 0.7019608, 0, 1,
-1.162435, -0.4733576, -1.452046, 1, 0.7098039, 0, 1,
-1.162198, -1.419791, -3.859058, 1, 0.7137255, 0, 1,
-1.152211, -1.078792, -3.981635, 1, 0.7215686, 0, 1,
-1.151912, 0.03550711, -2.764478, 1, 0.7254902, 0, 1,
-1.149406, -2.146767, -1.584772, 1, 0.7333333, 0, 1,
-1.142743, -1.455609, -1.934362, 1, 0.7372549, 0, 1,
-1.142127, 1.456794, -0.3204962, 1, 0.7450981, 0, 1,
-1.138947, 0.875416, -2.774208, 1, 0.7490196, 0, 1,
-1.128755, -1.236983, -1.615646, 1, 0.7568628, 0, 1,
-1.126659, -0.2406621, -2.480278, 1, 0.7607843, 0, 1,
-1.122399, -0.4440518, -2.511326, 1, 0.7686275, 0, 1,
-1.120509, 1.411752, -2.080966, 1, 0.772549, 0, 1,
-1.119509, 0.4419135, -0.7789261, 1, 0.7803922, 0, 1,
-1.11732, 1.45203, -1.405806, 1, 0.7843137, 0, 1,
-1.117166, 0.2861519, -0.2224759, 1, 0.7921569, 0, 1,
-1.114532, 0.5050111, -1.852696, 1, 0.7960784, 0, 1,
-1.101724, -1.497733, -0.9681782, 1, 0.8039216, 0, 1,
-1.100453, -0.05378408, -1.111642, 1, 0.8117647, 0, 1,
-1.100247, -0.5360366, -1.26441, 1, 0.8156863, 0, 1,
-1.095448, 0.9415047, 0.9102739, 1, 0.8235294, 0, 1,
-1.095136, 1.015485, 0.4110405, 1, 0.827451, 0, 1,
-1.089633, -0.9118884, -3.970962, 1, 0.8352941, 0, 1,
-1.084991, 0.4691192, -1.28066, 1, 0.8392157, 0, 1,
-1.078994, -0.1859295, -1.984934, 1, 0.8470588, 0, 1,
-1.077397, -0.8831853, -1.827716, 1, 0.8509804, 0, 1,
-1.073935, 0.2395382, 0.9310972, 1, 0.8588235, 0, 1,
-1.072253, -0.9376862, -2.18749, 1, 0.8627451, 0, 1,
-1.058635, 0.4488928, -0.7830755, 1, 0.8705882, 0, 1,
-1.054607, -2.15602, -2.411263, 1, 0.8745098, 0, 1,
-1.051759, -1.222423, -1.087701, 1, 0.8823529, 0, 1,
-1.044163, -1.114538, -1.826193, 1, 0.8862745, 0, 1,
-1.041552, -0.03813666, -0.3963213, 1, 0.8941177, 0, 1,
-1.040276, -1.394922, -1.898388, 1, 0.8980392, 0, 1,
-1.039643, -0.2106638, -1.836576, 1, 0.9058824, 0, 1,
-1.032887, 0.8697231, -0.04177861, 1, 0.9137255, 0, 1,
-1.028561, -1.802287, -3.149325, 1, 0.9176471, 0, 1,
-1.024075, -0.3689844, -2.282897, 1, 0.9254902, 0, 1,
-1.021449, -0.7908592, -3.816095, 1, 0.9294118, 0, 1,
-1.007375, -0.5731312, -1.544395, 1, 0.9372549, 0, 1,
-1.004563, 0.2668267, -0.3857026, 1, 0.9411765, 0, 1,
-1.003057, -0.6297047, -0.8719063, 1, 0.9490196, 0, 1,
-0.9989994, 0.9629763, -0.6682397, 1, 0.9529412, 0, 1,
-0.9961642, 0.2036092, -0.07847434, 1, 0.9607843, 0, 1,
-0.9914477, 0.0412876, -2.342113, 1, 0.9647059, 0, 1,
-0.9868439, -1.463293, -3.158475, 1, 0.972549, 0, 1,
-0.986732, 0.03241386, -2.593269, 1, 0.9764706, 0, 1,
-0.9717381, -0.1931863, -1.073027, 1, 0.9843137, 0, 1,
-0.9663815, -0.8693963, -2.078766, 1, 0.9882353, 0, 1,
-0.9611771, -0.1629022, -2.644478, 1, 0.9960784, 0, 1,
-0.9607005, 0.8288907, -0.6478806, 0.9960784, 1, 0, 1,
-0.959575, -1.117493, -2.821054, 0.9921569, 1, 0, 1,
-0.9504845, -0.6697816, -1.904524, 0.9843137, 1, 0, 1,
-0.9424132, 0.2207965, -0.5093725, 0.9803922, 1, 0, 1,
-0.9135433, 0.8253661, -3.016649, 0.972549, 1, 0, 1,
-0.9134532, 0.2914653, -1.826895, 0.9686275, 1, 0, 1,
-0.9073955, 1.572471, -2.56336, 0.9607843, 1, 0, 1,
-0.8967941, -0.5430431, -2.559653, 0.9568627, 1, 0, 1,
-0.8922244, 1.178211, -0.4391025, 0.9490196, 1, 0, 1,
-0.8915474, 0.1047271, -2.147789, 0.945098, 1, 0, 1,
-0.8856889, -0.2879242, -2.996067, 0.9372549, 1, 0, 1,
-0.8752319, -1.437856, -2.858672, 0.9333333, 1, 0, 1,
-0.8705714, -0.4286033, -2.301513, 0.9254902, 1, 0, 1,
-0.8704116, 0.6117242, -0.3651918, 0.9215686, 1, 0, 1,
-0.8673813, 0.2907596, -1.417283, 0.9137255, 1, 0, 1,
-0.862874, 1.864859, 0.3043411, 0.9098039, 1, 0, 1,
-0.8584728, -0.8749743, -2.459528, 0.9019608, 1, 0, 1,
-0.8556351, -0.1536988, -1.240249, 0.8941177, 1, 0, 1,
-0.8532841, 0.2812996, -1.003996, 0.8901961, 1, 0, 1,
-0.852398, -0.9752852, -0.4053898, 0.8823529, 1, 0, 1,
-0.8473738, -3.299812, -3.363875, 0.8784314, 1, 0, 1,
-0.8459223, 0.7742178, -0.04676628, 0.8705882, 1, 0, 1,
-0.842681, -0.6039898, -4.062408, 0.8666667, 1, 0, 1,
-0.8387663, -0.2387367, -0.8510299, 0.8588235, 1, 0, 1,
-0.8385272, 0.7381625, -1.625288, 0.854902, 1, 0, 1,
-0.8349962, 1.444708, -1.171572, 0.8470588, 1, 0, 1,
-0.8286554, -0.6845067, -2.93427, 0.8431373, 1, 0, 1,
-0.8274946, 0.5350009, -1.442582, 0.8352941, 1, 0, 1,
-0.8180297, 0.371292, -2.24726, 0.8313726, 1, 0, 1,
-0.8156145, 0.1419777, 0.2138939, 0.8235294, 1, 0, 1,
-0.8105951, 0.8150897, -1.303659, 0.8196079, 1, 0, 1,
-0.8086298, 1.398159, -1.59647, 0.8117647, 1, 0, 1,
-0.8078421, 0.3038605, 0.1678699, 0.8078431, 1, 0, 1,
-0.8031799, -0.5535272, -1.801429, 0.8, 1, 0, 1,
-0.8024483, -0.7660854, 0.8033666, 0.7921569, 1, 0, 1,
-0.7857173, 0.7868629, -1.129855, 0.7882353, 1, 0, 1,
-0.7828552, -1.397905, -1.292179, 0.7803922, 1, 0, 1,
-0.7822789, -0.262404, -2.780057, 0.7764706, 1, 0, 1,
-0.7791424, 0.3582421, -0.4451787, 0.7686275, 1, 0, 1,
-0.7766196, 0.9144394, -0.1891112, 0.7647059, 1, 0, 1,
-0.7763626, 1.490653, -1.218741, 0.7568628, 1, 0, 1,
-0.7744524, -0.508041, -1.262709, 0.7529412, 1, 0, 1,
-0.7735997, -1.45034, -2.699213, 0.7450981, 1, 0, 1,
-0.7735093, -1.064258, -3.247753, 0.7411765, 1, 0, 1,
-0.7733155, 1.225983, -0.1565545, 0.7333333, 1, 0, 1,
-0.7663692, -0.7943103, -0.4396583, 0.7294118, 1, 0, 1,
-0.7545323, -0.2308528, -2.388522, 0.7215686, 1, 0, 1,
-0.7527913, 1.043748, -1.230709, 0.7176471, 1, 0, 1,
-0.7527779, 1.199975, 1.140814, 0.7098039, 1, 0, 1,
-0.7504449, -2.390347, -1.93884, 0.7058824, 1, 0, 1,
-0.7465848, 0.4105944, -0.5051349, 0.6980392, 1, 0, 1,
-0.743229, -1.455823, -1.929608, 0.6901961, 1, 0, 1,
-0.7420511, 0.1231617, -2.449358, 0.6862745, 1, 0, 1,
-0.7380139, 0.6908052, 0.4840333, 0.6784314, 1, 0, 1,
-0.7376468, 1.736004, -1.51957, 0.6745098, 1, 0, 1,
-0.7361322, 2.689285, -1.313328, 0.6666667, 1, 0, 1,
-0.7284853, 0.3685108, -1.006561, 0.6627451, 1, 0, 1,
-0.7277078, -0.1076828, -1.515707, 0.654902, 1, 0, 1,
-0.7272897, -1.039579, -3.341477, 0.6509804, 1, 0, 1,
-0.7232251, -0.4454849, -0.5084977, 0.6431373, 1, 0, 1,
-0.7207289, 1.691911, -0.4652156, 0.6392157, 1, 0, 1,
-0.7203888, 0.1334257, -1.226361, 0.6313726, 1, 0, 1,
-0.7169369, -0.9222854, -2.865658, 0.627451, 1, 0, 1,
-0.7154212, 0.6573504, -0.1907742, 0.6196079, 1, 0, 1,
-0.7153052, 2.306968, -0.06249583, 0.6156863, 1, 0, 1,
-0.7148079, 1.582597, -0.464457, 0.6078432, 1, 0, 1,
-0.7128955, 0.01034982, -0.9426362, 0.6039216, 1, 0, 1,
-0.7111921, 0.9079655, -2.535378, 0.5960785, 1, 0, 1,
-0.7111082, 0.3152848, -1.300077, 0.5882353, 1, 0, 1,
-0.7091057, 1.196134, -0.7447443, 0.5843138, 1, 0, 1,
-0.7089238, -1.023566, -2.117824, 0.5764706, 1, 0, 1,
-0.7073654, -0.09345323, -2.184049, 0.572549, 1, 0, 1,
-0.7040699, -1.819725, -3.273636, 0.5647059, 1, 0, 1,
-0.7031662, 0.662971, -0.3214471, 0.5607843, 1, 0, 1,
-0.6840152, -1.412006, -4.03788, 0.5529412, 1, 0, 1,
-0.6837751, 2.347968, 0.2392927, 0.5490196, 1, 0, 1,
-0.6819462, 1.200014, 0.3464257, 0.5411765, 1, 0, 1,
-0.6791207, 0.667512, -1.018828, 0.5372549, 1, 0, 1,
-0.6769641, 0.6655058, 0.2581259, 0.5294118, 1, 0, 1,
-0.6748353, 0.007317916, -0.9308098, 0.5254902, 1, 0, 1,
-0.6744377, -1.800011, -3.838189, 0.5176471, 1, 0, 1,
-0.6719322, -1.337441, -1.884601, 0.5137255, 1, 0, 1,
-0.6639478, 0.02524456, -1.709435, 0.5058824, 1, 0, 1,
-0.662469, 0.6796212, -0.04147058, 0.5019608, 1, 0, 1,
-0.661739, 1.141096, -0.540915, 0.4941176, 1, 0, 1,
-0.6595597, 2.424523, 1.344744, 0.4862745, 1, 0, 1,
-0.657565, 0.0222121, -2.175968, 0.4823529, 1, 0, 1,
-0.6521686, 1.319046, 0.7877315, 0.4745098, 1, 0, 1,
-0.6507776, 0.07553268, -3.300519, 0.4705882, 1, 0, 1,
-0.6485609, 0.6507678, -1.156244, 0.4627451, 1, 0, 1,
-0.6464298, 1.230353, -0.624123, 0.4588235, 1, 0, 1,
-0.6435364, -0.2097097, -1.188695, 0.4509804, 1, 0, 1,
-0.6408558, -1.517001, -0.5628948, 0.4470588, 1, 0, 1,
-0.6368678, -1.865964, -2.225973, 0.4392157, 1, 0, 1,
-0.630744, -0.2107461, -2.003362, 0.4352941, 1, 0, 1,
-0.6277536, 0.4858951, -0.4246755, 0.427451, 1, 0, 1,
-0.6262116, 0.37794, 0.05516181, 0.4235294, 1, 0, 1,
-0.6243458, -1.017999, -2.358358, 0.4156863, 1, 0, 1,
-0.6196756, 0.9452733, 0.1712507, 0.4117647, 1, 0, 1,
-0.6128704, -0.7501982, -0.6435071, 0.4039216, 1, 0, 1,
-0.6124418, -0.2061908, -2.061301, 0.3960784, 1, 0, 1,
-0.5997708, 0.8406727, -0.2589819, 0.3921569, 1, 0, 1,
-0.5978677, -0.6542076, -1.966092, 0.3843137, 1, 0, 1,
-0.5965727, 0.4156684, -2.801476, 0.3803922, 1, 0, 1,
-0.5930223, -0.251086, -1.653861, 0.372549, 1, 0, 1,
-0.5925783, 0.5858723, -0.1317898, 0.3686275, 1, 0, 1,
-0.5923355, 0.2034153, -1.516844, 0.3607843, 1, 0, 1,
-0.5890808, 0.3925182, -0.7164289, 0.3568628, 1, 0, 1,
-0.588627, -1.841177, -4.126717, 0.3490196, 1, 0, 1,
-0.5861751, 0.7852466, -1.113494, 0.345098, 1, 0, 1,
-0.5836085, 1.570013, -0.002347767, 0.3372549, 1, 0, 1,
-0.5755539, -0.2290795, -1.677734, 0.3333333, 1, 0, 1,
-0.575542, -0.2669826, -2.077628, 0.3254902, 1, 0, 1,
-0.5753232, 0.7140227, -1.610367, 0.3215686, 1, 0, 1,
-0.5745807, -0.4971491, -2.078063, 0.3137255, 1, 0, 1,
-0.5743253, 0.05770129, -2.846776, 0.3098039, 1, 0, 1,
-0.5738601, 0.733982, -1.172598, 0.3019608, 1, 0, 1,
-0.5732138, -0.4331771, -1.172152, 0.2941177, 1, 0, 1,
-0.5718892, 0.3197945, -2.167047, 0.2901961, 1, 0, 1,
-0.5686083, 0.9704528, -0.5120953, 0.282353, 1, 0, 1,
-0.5683692, -1.825659, -2.806727, 0.2784314, 1, 0, 1,
-0.5670261, -0.4768078, -2.082162, 0.2705882, 1, 0, 1,
-0.5620206, 0.9689204, -1.060447, 0.2666667, 1, 0, 1,
-0.559175, 0.1209051, -1.297031, 0.2588235, 1, 0, 1,
-0.5570744, -0.1912829, -2.62285, 0.254902, 1, 0, 1,
-0.5508782, -0.1849275, -2.043843, 0.2470588, 1, 0, 1,
-0.5497627, 1.141258, 0.2205217, 0.2431373, 1, 0, 1,
-0.5484839, -1.28278, -0.3689716, 0.2352941, 1, 0, 1,
-0.5461822, -0.2479905, -2.39539, 0.2313726, 1, 0, 1,
-0.5346243, 1.043103, -0.1967537, 0.2235294, 1, 0, 1,
-0.5302206, 0.9093806, -1.903194, 0.2196078, 1, 0, 1,
-0.529431, 1.562506, -1.005119, 0.2117647, 1, 0, 1,
-0.5261961, -1.288873, -1.717843, 0.2078431, 1, 0, 1,
-0.5246872, 1.492077, -0.3256932, 0.2, 1, 0, 1,
-0.5222237, 0.7384033, -2.589959, 0.1921569, 1, 0, 1,
-0.5175576, -0.07180995, 0.08506064, 0.1882353, 1, 0, 1,
-0.5147995, -0.1333145, -1.570423, 0.1803922, 1, 0, 1,
-0.5144951, 0.412934, 0.1207352, 0.1764706, 1, 0, 1,
-0.5135245, 0.8693188, -1.280752, 0.1686275, 1, 0, 1,
-0.5115028, 0.7124448, 0.9647186, 0.1647059, 1, 0, 1,
-0.5092829, -0.7740788, -0.436809, 0.1568628, 1, 0, 1,
-0.5078549, 0.7292472, -1.649742, 0.1529412, 1, 0, 1,
-0.5032669, -1.56877, -2.14565, 0.145098, 1, 0, 1,
-0.4966258, -1.196745, -3.575933, 0.1411765, 1, 0, 1,
-0.4956423, -1.221243, -2.732992, 0.1333333, 1, 0, 1,
-0.4933003, 0.412418, 0.5409003, 0.1294118, 1, 0, 1,
-0.4892716, 0.06677912, -1.878408, 0.1215686, 1, 0, 1,
-0.4849004, -1.185576, -2.351475, 0.1176471, 1, 0, 1,
-0.4812058, -0.5022838, -0.5067744, 0.1098039, 1, 0, 1,
-0.4714698, -0.5588449, -2.608591, 0.1058824, 1, 0, 1,
-0.4705477, 0.3423976, -1.580717, 0.09803922, 1, 0, 1,
-0.4651328, 0.489915, 0.08108439, 0.09019608, 1, 0, 1,
-0.4609669, -0.8670529, -3.127459, 0.08627451, 1, 0, 1,
-0.4596307, -0.6993271, -3.399108, 0.07843138, 1, 0, 1,
-0.4578453, -1.179338, -2.829967, 0.07450981, 1, 0, 1,
-0.4502646, 0.4518768, -1.781658, 0.06666667, 1, 0, 1,
-0.4488125, 0.4882555, -0.4417126, 0.0627451, 1, 0, 1,
-0.4480944, 1.465499, 0.1397078, 0.05490196, 1, 0, 1,
-0.4439417, -3.043432, -1.03683, 0.05098039, 1, 0, 1,
-0.439118, -0.1793392, -1.422979, 0.04313726, 1, 0, 1,
-0.4325503, 1.839641, -0.3776442, 0.03921569, 1, 0, 1,
-0.4317983, 0.8692417, -0.5969038, 0.03137255, 1, 0, 1,
-0.4285055, 1.039078, 1.376627, 0.02745098, 1, 0, 1,
-0.4248047, 1.464037, 0.1084303, 0.01960784, 1, 0, 1,
-0.4243018, 0.1875547, -2.471687, 0.01568628, 1, 0, 1,
-0.422125, -0.06490261, -2.685639, 0.007843138, 1, 0, 1,
-0.4196064, 0.4955604, 0.06228926, 0.003921569, 1, 0, 1,
-0.416809, 0.9526387, -0.8404886, 0, 1, 0.003921569, 1,
-0.4137098, -1.288857, -3.671339, 0, 1, 0.01176471, 1,
-0.4080112, 0.6631199, -1.641541, 0, 1, 0.01568628, 1,
-0.4048985, -1.077248, -2.620195, 0, 1, 0.02352941, 1,
-0.4015062, -0.2573785, -1.923166, 0, 1, 0.02745098, 1,
-0.3965614, 0.4290507, -1.130342, 0, 1, 0.03529412, 1,
-0.3955642, -0.1408214, -2.337984, 0, 1, 0.03921569, 1,
-0.3933727, 0.2527678, -2.338226, 0, 1, 0.04705882, 1,
-0.3892702, 0.5928598, -1.219071, 0, 1, 0.05098039, 1,
-0.3880081, -0.6839126, -1.987754, 0, 1, 0.05882353, 1,
-0.3867014, -1.909414, -3.04759, 0, 1, 0.0627451, 1,
-0.3862708, -0.7932031, -3.493209, 0, 1, 0.07058824, 1,
-0.3787998, 0.03553286, -1.08679, 0, 1, 0.07450981, 1,
-0.3747516, -0.9867613, -0.3744093, 0, 1, 0.08235294, 1,
-0.3727803, -0.08439225, -2.270494, 0, 1, 0.08627451, 1,
-0.370397, -1.332641, -3.799557, 0, 1, 0.09411765, 1,
-0.3675845, -0.297005, -2.148456, 0, 1, 0.1019608, 1,
-0.3673913, 0.5104041, 1.685169, 0, 1, 0.1058824, 1,
-0.3611689, -2.188666, -4.516688, 0, 1, 0.1137255, 1,
-0.3579111, -2.293297, -3.528399, 0, 1, 0.1176471, 1,
-0.3570137, -1.727815, -2.930014, 0, 1, 0.1254902, 1,
-0.3554544, -0.5237192, -2.570296, 0, 1, 0.1294118, 1,
-0.3533463, 0.4133626, -0.1577954, 0, 1, 0.1372549, 1,
-0.3499731, -0.8412592, -4.856027, 0, 1, 0.1411765, 1,
-0.3499625, 2.562574, -1.934355, 0, 1, 0.1490196, 1,
-0.3488216, -0.1674548, -2.160689, 0, 1, 0.1529412, 1,
-0.3412609, -0.3212147, -2.876805, 0, 1, 0.1607843, 1,
-0.3411374, 1.145429, -1.057372, 0, 1, 0.1647059, 1,
-0.3403914, -2.097063, -3.662499, 0, 1, 0.172549, 1,
-0.3389501, -0.1140128, -3.066216, 0, 1, 0.1764706, 1,
-0.3340083, 0.3060816, -0.6941035, 0, 1, 0.1843137, 1,
-0.3292867, 0.8562405, -0.304002, 0, 1, 0.1882353, 1,
-0.3221398, -0.03786174, -0.6684204, 0, 1, 0.1960784, 1,
-0.3188897, -0.01198543, -1.653742, 0, 1, 0.2039216, 1,
-0.3183155, -0.4265185, -0.5415246, 0, 1, 0.2078431, 1,
-0.3145144, -0.629857, -3.657626, 0, 1, 0.2156863, 1,
-0.3140695, -0.1793476, -1.052398, 0, 1, 0.2196078, 1,
-0.3116459, -0.07125558, -2.237616, 0, 1, 0.227451, 1,
-0.3111541, 0.350121, -0.4898088, 0, 1, 0.2313726, 1,
-0.3105998, -0.760687, -1.070261, 0, 1, 0.2392157, 1,
-0.3099575, 0.04853915, -2.046752, 0, 1, 0.2431373, 1,
-0.3060791, 0.996253, -0.1578594, 0, 1, 0.2509804, 1,
-0.3058933, -0.08359953, -2.684145, 0, 1, 0.254902, 1,
-0.3036622, -1.842495, -2.075906, 0, 1, 0.2627451, 1,
-0.303519, 0.7596591, -0.6022287, 0, 1, 0.2666667, 1,
-0.3031819, -1.049418, -2.39481, 0, 1, 0.2745098, 1,
-0.3011605, -0.3729009, -1.22488, 0, 1, 0.2784314, 1,
-0.2997737, -0.6977488, -3.761306, 0, 1, 0.2862745, 1,
-0.2970982, 0.3173956, 0.3674046, 0, 1, 0.2901961, 1,
-0.2921964, -2.278302, -3.555662, 0, 1, 0.2980392, 1,
-0.2915266, -1.387575, -4.101556, 0, 1, 0.3058824, 1,
-0.2912645, -0.3879576, -2.635597, 0, 1, 0.3098039, 1,
-0.2906841, -0.1665795, -0.4161509, 0, 1, 0.3176471, 1,
-0.2884551, 1.0017, 0.08734627, 0, 1, 0.3215686, 1,
-0.2856002, -0.7161735, -4.037094, 0, 1, 0.3294118, 1,
-0.2778389, 0.4987735, -1.501499, 0, 1, 0.3333333, 1,
-0.2771467, 0.6675965, -0.6724172, 0, 1, 0.3411765, 1,
-0.2769507, -0.4062447, -1.147331, 0, 1, 0.345098, 1,
-0.276605, 1.219929, -0.1714168, 0, 1, 0.3529412, 1,
-0.2756902, -0.7243766, -2.633967, 0, 1, 0.3568628, 1,
-0.2710431, 0.4098801, 0.6501683, 0, 1, 0.3647059, 1,
-0.2707462, -1.550415, -2.402814, 0, 1, 0.3686275, 1,
-0.2699656, -2.100075, -3.081096, 0, 1, 0.3764706, 1,
-0.2697945, 0.5475323, -1.302674, 0, 1, 0.3803922, 1,
-0.2668541, -0.8774776, -2.346507, 0, 1, 0.3882353, 1,
-0.2629942, -1.817314, -2.523379, 0, 1, 0.3921569, 1,
-0.2550517, 0.5227047, -0.9157357, 0, 1, 0.4, 1,
-0.2494055, 0.871391, -0.4070314, 0, 1, 0.4078431, 1,
-0.2470123, -0.2780346, -4.44581, 0, 1, 0.4117647, 1,
-0.2417464, -0.380987, -2.154994, 0, 1, 0.4196078, 1,
-0.24105, 1.311453, -1.073672, 0, 1, 0.4235294, 1,
-0.2403955, 1.471007, -2.026561, 0, 1, 0.4313726, 1,
-0.2401741, 0.3224382, -0.1190706, 0, 1, 0.4352941, 1,
-0.2395573, -2.408333, -4.531791, 0, 1, 0.4431373, 1,
-0.2358129, 2.683463, -1.64682, 0, 1, 0.4470588, 1,
-0.2238614, 0.3967074, -0.8621676, 0, 1, 0.454902, 1,
-0.2207887, -0.8325812, -3.806233, 0, 1, 0.4588235, 1,
-0.2181615, -0.4345925, -1.800169, 0, 1, 0.4666667, 1,
-0.213956, -0.9573612, -3.260396, 0, 1, 0.4705882, 1,
-0.2071476, -0.02642338, -1.976088, 0, 1, 0.4784314, 1,
-0.2021524, -1.368846, -3.562927, 0, 1, 0.4823529, 1,
-0.1949444, 0.2275068, -1.930565, 0, 1, 0.4901961, 1,
-0.1937879, 2.175199, -1.663575, 0, 1, 0.4941176, 1,
-0.1933783, -0.2335138, -2.077993, 0, 1, 0.5019608, 1,
-0.1896337, 0.496423, -0.6574205, 0, 1, 0.509804, 1,
-0.1878739, 1.441981, 0.2016184, 0, 1, 0.5137255, 1,
-0.1845487, -1.602588, -3.930786, 0, 1, 0.5215687, 1,
-0.183712, -0.3647543, -2.36346, 0, 1, 0.5254902, 1,
-0.1821116, -0.6465114, -3.012905, 0, 1, 0.5333334, 1,
-0.1784116, -0.01720121, -1.381703, 0, 1, 0.5372549, 1,
-0.178201, -0.6826936, -2.224202, 0, 1, 0.5450981, 1,
-0.174854, 1.212288, 0.3013876, 0, 1, 0.5490196, 1,
-0.1683707, 0.1928613, 0.06744564, 0, 1, 0.5568628, 1,
-0.1649615, -0.7511753, -3.110168, 0, 1, 0.5607843, 1,
-0.1649131, -0.2717059, -0.8423907, 0, 1, 0.5686275, 1,
-0.1630504, -0.2729419, -3.960479, 0, 1, 0.572549, 1,
-0.1629287, 0.4279411, -0.06389068, 0, 1, 0.5803922, 1,
-0.1563134, -0.1123708, -2.769161, 0, 1, 0.5843138, 1,
-0.1547852, 0.8005032, 1.28433, 0, 1, 0.5921569, 1,
-0.1530667, 0.02967828, -1.644482, 0, 1, 0.5960785, 1,
-0.1525026, -1.361245, -2.190341, 0, 1, 0.6039216, 1,
-0.1522834, -0.0341349, -3.458242, 0, 1, 0.6117647, 1,
-0.1499338, -1.099974, -3.631052, 0, 1, 0.6156863, 1,
-0.1446912, 0.3475112, -0.1675124, 0, 1, 0.6235294, 1,
-0.1446082, 0.2158154, 0.8183085, 0, 1, 0.627451, 1,
-0.1426429, 0.3828764, -2.573565, 0, 1, 0.6352941, 1,
-0.1292567, -0.08313165, -2.690085, 0, 1, 0.6392157, 1,
-0.1275567, -1.11727, -3.344795, 0, 1, 0.6470588, 1,
-0.1224834, -1.440314, -3.276176, 0, 1, 0.6509804, 1,
-0.1219196, 1.050943, -0.02574584, 0, 1, 0.6588235, 1,
-0.1195555, -1.989009, -3.187891, 0, 1, 0.6627451, 1,
-0.1147586, 0.1120354, -2.16275, 0, 1, 0.6705883, 1,
-0.1103325, -0.4878301, -3.862501, 0, 1, 0.6745098, 1,
-0.1088353, -0.6588897, -3.745145, 0, 1, 0.682353, 1,
-0.108441, -0.286005, -2.056943, 0, 1, 0.6862745, 1,
-0.1080247, 1.759444, -0.8013505, 0, 1, 0.6941177, 1,
-0.1052584, -0.2446678, -2.480741, 0, 1, 0.7019608, 1,
-0.09948891, -0.1791131, -4.922315, 0, 1, 0.7058824, 1,
-0.09939671, 0.828584, -0.7881173, 0, 1, 0.7137255, 1,
-0.09725041, -0.9518564, -1.447274, 0, 1, 0.7176471, 1,
-0.09554175, 0.9493363, -1.219349, 0, 1, 0.7254902, 1,
-0.09487496, 1.034875, 0.5436782, 0, 1, 0.7294118, 1,
-0.09331582, 0.04109119, -2.193117, 0, 1, 0.7372549, 1,
-0.09096078, 1.263708, 0.4233199, 0, 1, 0.7411765, 1,
-0.08798999, -0.2597212, -3.653205, 0, 1, 0.7490196, 1,
-0.08739022, 0.02461214, -0.1825304, 0, 1, 0.7529412, 1,
-0.08662033, 0.608776, -0.4982726, 0, 1, 0.7607843, 1,
-0.08518075, -0.8869331, -1.462582, 0, 1, 0.7647059, 1,
-0.08429784, 0.705745, -1.000336, 0, 1, 0.772549, 1,
-0.0827998, -0.1660778, -4.278848, 0, 1, 0.7764706, 1,
-0.07831293, -0.8091297, -4.933386, 0, 1, 0.7843137, 1,
-0.07750651, 1.407495, 2.201625, 0, 1, 0.7882353, 1,
-0.07626181, -0.7048685, -3.86108, 0, 1, 0.7960784, 1,
-0.07274918, 1.489016, 0.552701, 0, 1, 0.8039216, 1,
-0.07075515, -1.392723, -3.626488, 0, 1, 0.8078431, 1,
-0.07057412, 0.8754615, -2.015626, 0, 1, 0.8156863, 1,
-0.0682362, -0.7242389, -2.529656, 0, 1, 0.8196079, 1,
-0.06637397, -0.1322354, -2.468554, 0, 1, 0.827451, 1,
-0.06407699, 0.4921074, -1.005602, 0, 1, 0.8313726, 1,
-0.06302277, -2.420407, -2.132525, 0, 1, 0.8392157, 1,
-0.06092285, -0.2456999, -3.741274, 0, 1, 0.8431373, 1,
-0.05984399, -0.9570119, -3.936831, 0, 1, 0.8509804, 1,
-0.05339163, 0.3993187, 0.276366, 0, 1, 0.854902, 1,
-0.04962128, -0.6130128, -2.535671, 0, 1, 0.8627451, 1,
-0.0471367, -1.022185, -1.267231, 0, 1, 0.8666667, 1,
-0.04376043, 1.260296, 0.4474744, 0, 1, 0.8745098, 1,
-0.04271637, 0.3591711, 1.127358, 0, 1, 0.8784314, 1,
-0.04269921, 1.541099, -1.016481, 0, 1, 0.8862745, 1,
-0.04178166, 1.310285, -0.146987, 0, 1, 0.8901961, 1,
-0.03987024, -1.019127, -2.988999, 0, 1, 0.8980392, 1,
-0.03380384, 0.0506771, -1.839709, 0, 1, 0.9058824, 1,
-0.03327762, 0.1064114, -0.02661758, 0, 1, 0.9098039, 1,
-0.03236355, 0.7981773, -0.309795, 0, 1, 0.9176471, 1,
-0.03217255, 1.805209, 0.0373945, 0, 1, 0.9215686, 1,
-0.03209136, -0.351773, -2.741252, 0, 1, 0.9294118, 1,
-0.03198666, -1.426535, -3.421239, 0, 1, 0.9333333, 1,
-0.03133952, -0.107666, -3.426343, 0, 1, 0.9411765, 1,
-0.03007368, 0.9222814, 0.308181, 0, 1, 0.945098, 1,
-0.02270538, -0.9710918, -3.618833, 0, 1, 0.9529412, 1,
-0.02072459, -0.446539, -3.432628, 0, 1, 0.9568627, 1,
-0.02008835, 1.165319, -1.610205, 0, 1, 0.9647059, 1,
-0.01608321, 0.2576869, 1.101314, 0, 1, 0.9686275, 1,
-0.013651, -0.509836, -4.045139, 0, 1, 0.9764706, 1,
-0.01004446, -0.2487342, -1.962321, 0, 1, 0.9803922, 1,
-0.008485811, 0.1850204, 0.2133255, 0, 1, 0.9882353, 1,
-0.006429108, 0.3505773, 0.03423936, 0, 1, 0.9921569, 1,
-0.003451567, 0.50602, 0.1820317, 0, 1, 1, 1,
0.0003901212, -0.2600928, 2.139071, 0, 0.9921569, 1, 1,
0.003270408, 0.5945792, -0.07129614, 0, 0.9882353, 1, 1,
0.003777973, -1.221511, 4.690944, 0, 0.9803922, 1, 1,
0.008137887, -0.5568936, 2.461555, 0, 0.9764706, 1, 1,
0.01115091, -0.6297997, 3.306735, 0, 0.9686275, 1, 1,
0.01248386, -1.313892, 5.713897, 0, 0.9647059, 1, 1,
0.01891895, 1.629877, -0.1676241, 0, 0.9568627, 1, 1,
0.02044025, 0.7892766, 1.480113, 0, 0.9529412, 1, 1,
0.02090928, -0.5898774, 2.699565, 0, 0.945098, 1, 1,
0.0231853, 2.335201, 1.93119, 0, 0.9411765, 1, 1,
0.0235165, -2.33022, 4.07422, 0, 0.9333333, 1, 1,
0.02944444, -0.7593375, 1.812679, 0, 0.9294118, 1, 1,
0.03037638, 0.09248541, 0.8737659, 0, 0.9215686, 1, 1,
0.03154951, -0.6018203, 3.598267, 0, 0.9176471, 1, 1,
0.03306251, 0.7625769, -0.617699, 0, 0.9098039, 1, 1,
0.03481574, -0.501412, 2.566581, 0, 0.9058824, 1, 1,
0.03934248, -1.014014, 3.084233, 0, 0.8980392, 1, 1,
0.04348359, -0.5134022, 3.165748, 0, 0.8901961, 1, 1,
0.04611358, 0.7417161, 1.212768, 0, 0.8862745, 1, 1,
0.04849715, 0.1887251, -0.6570122, 0, 0.8784314, 1, 1,
0.05015216, -0.333047, 4.935544, 0, 0.8745098, 1, 1,
0.05052919, 1.008005, 1.354318, 0, 0.8666667, 1, 1,
0.05234563, -1.27345, 2.310696, 0, 0.8627451, 1, 1,
0.05673749, 0.8485236, 0.4533491, 0, 0.854902, 1, 1,
0.05875237, -1.619732, 3.105122, 0, 0.8509804, 1, 1,
0.06176862, -0.05955548, 3.433752, 0, 0.8431373, 1, 1,
0.0619871, 0.7505817, -1.178529, 0, 0.8392157, 1, 1,
0.06226934, -0.1250025, 0.9794481, 0, 0.8313726, 1, 1,
0.06370207, 0.6417916, -0.6475881, 0, 0.827451, 1, 1,
0.06449172, -0.9349812, 1.919023, 0, 0.8196079, 1, 1,
0.06554131, 1.929326, -0.106158, 0, 0.8156863, 1, 1,
0.06911953, 1.751534, -1.261448, 0, 0.8078431, 1, 1,
0.0706296, -1.129163, 4.478014, 0, 0.8039216, 1, 1,
0.07287062, -0.3637358, 3.226203, 0, 0.7960784, 1, 1,
0.07313498, -0.907558, 1.613561, 0, 0.7882353, 1, 1,
0.07434663, -0.5740153, 2.510901, 0, 0.7843137, 1, 1,
0.07742608, -0.2964188, 2.232185, 0, 0.7764706, 1, 1,
0.07837519, -0.2364022, 2.696077, 0, 0.772549, 1, 1,
0.08060478, 1.216991, -1.067491, 0, 0.7647059, 1, 1,
0.08075042, -0.5233794, 3.143553, 0, 0.7607843, 1, 1,
0.08254366, 1.127495, 0.7514372, 0, 0.7529412, 1, 1,
0.08275908, 0.2598186, 0.5201833, 0, 0.7490196, 1, 1,
0.08573041, 0.897206, 0.9669047, 0, 0.7411765, 1, 1,
0.09403021, -0.2276028, 2.965121, 0, 0.7372549, 1, 1,
0.09482425, -0.543485, 2.049358, 0, 0.7294118, 1, 1,
0.0952277, 0.2276309, 2.321659, 0, 0.7254902, 1, 1,
0.09613843, 0.2888833, 2.430896, 0, 0.7176471, 1, 1,
0.09697324, 0.3254197, 0.678112, 0, 0.7137255, 1, 1,
0.09947153, -0.7721149, 2.389838, 0, 0.7058824, 1, 1,
0.1003598, 0.4531691, 1.038613, 0, 0.6980392, 1, 1,
0.1023358, 0.5844027, -1.190467, 0, 0.6941177, 1, 1,
0.1041278, 0.1679341, 0.7897488, 0, 0.6862745, 1, 1,
0.1094037, -0.0531157, 3.356349, 0, 0.682353, 1, 1,
0.1111775, 0.3644876, -0.7140076, 0, 0.6745098, 1, 1,
0.1112304, 0.9032651, -2.400901, 0, 0.6705883, 1, 1,
0.1125812, 0.01936324, 1.641649, 0, 0.6627451, 1, 1,
0.1125972, -0.2216368, 2.394031, 0, 0.6588235, 1, 1,
0.114144, -0.2277423, 3.882845, 0, 0.6509804, 1, 1,
0.1153448, 1.559155, -0.740827, 0, 0.6470588, 1, 1,
0.1209054, 0.6563994, -0.473421, 0, 0.6392157, 1, 1,
0.1288198, 1.234273, 1.698706, 0, 0.6352941, 1, 1,
0.1290566, -0.2732506, 1.525647, 0, 0.627451, 1, 1,
0.129478, 2.975105, -0.2741777, 0, 0.6235294, 1, 1,
0.1320094, -0.4211665, 2.325663, 0, 0.6156863, 1, 1,
0.1376285, -0.1731452, 2.696405, 0, 0.6117647, 1, 1,
0.1394796, 0.03474449, 0.79419, 0, 0.6039216, 1, 1,
0.1409384, -0.9582599, 2.814976, 0, 0.5960785, 1, 1,
0.1417755, -1.922131, 3.066861, 0, 0.5921569, 1, 1,
0.1435892, 1.237416, 0.332543, 0, 0.5843138, 1, 1,
0.1470445, 0.702711, 0.892518, 0, 0.5803922, 1, 1,
0.1475909, 1.031126, 1.6696, 0, 0.572549, 1, 1,
0.153993, 0.8149312, 1.081802, 0, 0.5686275, 1, 1,
0.1573764, 0.1259473, 1.011681, 0, 0.5607843, 1, 1,
0.1594819, 0.8556178, -0.8119211, 0, 0.5568628, 1, 1,
0.1612418, 0.3814443, 0.5471141, 0, 0.5490196, 1, 1,
0.1674142, 0.7644153, 1.188439, 0, 0.5450981, 1, 1,
0.1704562, 0.4458214, 0.003079864, 0, 0.5372549, 1, 1,
0.1763748, -0.09820805, 2.476426, 0, 0.5333334, 1, 1,
0.1763839, 1.747305, 0.4833457, 0, 0.5254902, 1, 1,
0.1776524, -0.06320754, 1.938853, 0, 0.5215687, 1, 1,
0.177713, 0.1198043, -0.1136259, 0, 0.5137255, 1, 1,
0.1780162, -0.2030039, 1.446054, 0, 0.509804, 1, 1,
0.185653, 0.5903419, -0.2167965, 0, 0.5019608, 1, 1,
0.1871606, 0.2752577, 1.945859, 0, 0.4941176, 1, 1,
0.1896406, 1.452674, 0.1033439, 0, 0.4901961, 1, 1,
0.1918083, 1.103551, -0.5116377, 0, 0.4823529, 1, 1,
0.1937949, -1.773312, 2.602556, 0, 0.4784314, 1, 1,
0.1957332, 0.327415, -1.326958, 0, 0.4705882, 1, 1,
0.1978953, -2.215393, 2.128721, 0, 0.4666667, 1, 1,
0.200874, -0.6816084, 5.087135, 0, 0.4588235, 1, 1,
0.2060917, -0.2994069, 2.394384, 0, 0.454902, 1, 1,
0.2089669, -1.37816, 2.858351, 0, 0.4470588, 1, 1,
0.2111187, -1.445045, 2.344365, 0, 0.4431373, 1, 1,
0.2119811, 1.560528, 0.9790927, 0, 0.4352941, 1, 1,
0.2141267, 0.2949443, 0.05120071, 0, 0.4313726, 1, 1,
0.2214228, -0.1383269, 2.468643, 0, 0.4235294, 1, 1,
0.2233148, 0.2014462, 0.5480555, 0, 0.4196078, 1, 1,
0.2246154, -1.182446, 2.161238, 0, 0.4117647, 1, 1,
0.2264878, -1.379841, 4.560976, 0, 0.4078431, 1, 1,
0.2293971, -1.705299, 1.887157, 0, 0.4, 1, 1,
0.2396002, 0.129018, -0.4135808, 0, 0.3921569, 1, 1,
0.2400426, 0.8473026, -2.095347, 0, 0.3882353, 1, 1,
0.2426191, -0.7082381, 3.139975, 0, 0.3803922, 1, 1,
0.2444669, 0.8565974, -0.9749859, 0, 0.3764706, 1, 1,
0.2473254, -0.07997693, -1.063067, 0, 0.3686275, 1, 1,
0.250874, -0.6352868, 3.91905, 0, 0.3647059, 1, 1,
0.2510508, -0.7192943, 2.455086, 0, 0.3568628, 1, 1,
0.2533444, -0.05167776, 4.573655, 0, 0.3529412, 1, 1,
0.2557423, -1.516782, 2.77373, 0, 0.345098, 1, 1,
0.2569247, 0.4552009, 0.7648963, 0, 0.3411765, 1, 1,
0.2577374, -0.2597397, 2.908737, 0, 0.3333333, 1, 1,
0.2593563, -1.077558, 4.003497, 0, 0.3294118, 1, 1,
0.2619595, 0.8253449, 1.414014, 0, 0.3215686, 1, 1,
0.2621458, -0.8050891, 2.69956, 0, 0.3176471, 1, 1,
0.2640734, 2.745024, 1.292912, 0, 0.3098039, 1, 1,
0.2646576, -0.5053779, 2.20482, 0, 0.3058824, 1, 1,
0.2683704, -0.8613335, 1.48086, 0, 0.2980392, 1, 1,
0.2747582, 0.04061572, 1.484669, 0, 0.2901961, 1, 1,
0.2765651, -0.01901715, 0.7479753, 0, 0.2862745, 1, 1,
0.2802026, -1.731276, 3.379809, 0, 0.2784314, 1, 1,
0.2816592, 0.8432791, 0.420395, 0, 0.2745098, 1, 1,
0.2819185, -0.08659312, 1.149226, 0, 0.2666667, 1, 1,
0.289315, 0.1494274, 1.160254, 0, 0.2627451, 1, 1,
0.2998125, 1.77194, 0.160039, 0, 0.254902, 1, 1,
0.3008948, 0.3391855, -0.03358758, 0, 0.2509804, 1, 1,
0.3041213, -0.5980454, 2.077417, 0, 0.2431373, 1, 1,
0.3069921, -0.2850211, 2.742352, 0, 0.2392157, 1, 1,
0.3112839, 0.4680185, 1.764486, 0, 0.2313726, 1, 1,
0.3144183, -0.8450238, 2.199692, 0, 0.227451, 1, 1,
0.3191291, 0.9745617, -0.2350334, 0, 0.2196078, 1, 1,
0.3192888, -0.4656014, 2.951258, 0, 0.2156863, 1, 1,
0.3219093, -1.154195, 2.425523, 0, 0.2078431, 1, 1,
0.3222501, 0.3436722, -0.02268769, 0, 0.2039216, 1, 1,
0.328712, -0.855078, 3.910084, 0, 0.1960784, 1, 1,
0.3313065, 0.1505137, 1.083951, 0, 0.1882353, 1, 1,
0.3381431, -1.106481, 4.154611, 0, 0.1843137, 1, 1,
0.345085, 0.6485101, 1.170968, 0, 0.1764706, 1, 1,
0.3454029, 1.125942, 0.2678079, 0, 0.172549, 1, 1,
0.353823, 0.690009, -0.0271486, 0, 0.1647059, 1, 1,
0.3548364, -0.5213757, 1.724307, 0, 0.1607843, 1, 1,
0.3550264, 1.196734, -1.229782, 0, 0.1529412, 1, 1,
0.3590319, -2.018802, 2.763748, 0, 0.1490196, 1, 1,
0.3636088, -0.1968171, 2.984589, 0, 0.1411765, 1, 1,
0.3675644, 1.47324, -0.1667481, 0, 0.1372549, 1, 1,
0.3711014, 0.02746466, 0.9400465, 0, 0.1294118, 1, 1,
0.3713197, -0.7340599, 3.375134, 0, 0.1254902, 1, 1,
0.3752494, 0.187641, 1.559409, 0, 0.1176471, 1, 1,
0.3761052, 0.5036888, 1.325249, 0, 0.1137255, 1, 1,
0.3763047, 0.5031335, -0.1300075, 0, 0.1058824, 1, 1,
0.3773411, -0.3691248, 1.11776, 0, 0.09803922, 1, 1,
0.3785779, -0.6594788, 3.666289, 0, 0.09411765, 1, 1,
0.3814816, 0.7852185, -0.279694, 0, 0.08627451, 1, 1,
0.3819061, 0.1188451, -0.04243425, 0, 0.08235294, 1, 1,
0.382758, 0.01555903, 2.53196, 0, 0.07450981, 1, 1,
0.3884029, 1.355711, 0.05162934, 0, 0.07058824, 1, 1,
0.3888298, 0.3401706, 0.8978751, 0, 0.0627451, 1, 1,
0.3913596, -0.3739762, 3.136001, 0, 0.05882353, 1, 1,
0.3922606, 1.455982, 1.094095, 0, 0.05098039, 1, 1,
0.3950355, -1.078531, 3.782771, 0, 0.04705882, 1, 1,
0.3968517, 0.4338737, 0.850461, 0, 0.03921569, 1, 1,
0.3999629, -0.8939139, 4.286416, 0, 0.03529412, 1, 1,
0.4054146, -0.8503948, 3.05096, 0, 0.02745098, 1, 1,
0.407517, 0.5996573, 1.118453, 0, 0.02352941, 1, 1,
0.4079759, -0.957277, 4.222476, 0, 0.01568628, 1, 1,
0.4113732, 0.3763461, -0.3957862, 0, 0.01176471, 1, 1,
0.4147959, -2.094221, 2.622789, 0, 0.003921569, 1, 1,
0.4154581, -0.01256434, 2.226658, 0.003921569, 0, 1, 1,
0.4216786, 0.4575163, -0.2623957, 0.007843138, 0, 1, 1,
0.4224288, -0.6260366, 2.873381, 0.01568628, 0, 1, 1,
0.4270889, -0.7594009, 3.861913, 0.01960784, 0, 1, 1,
0.4371796, -0.6489031, 0.9462886, 0.02745098, 0, 1, 1,
0.4454113, 0.4314665, 1.015944, 0.03137255, 0, 1, 1,
0.446048, 1.24139, 0.6361258, 0.03921569, 0, 1, 1,
0.4488327, 0.5656434, 1.266951, 0.04313726, 0, 1, 1,
0.4506484, -0.01295188, 1.510522, 0.05098039, 0, 1, 1,
0.4508699, -2.281741, 1.938438, 0.05490196, 0, 1, 1,
0.4536049, -0.10553, 0.265904, 0.0627451, 0, 1, 1,
0.4581567, -0.03906958, 1.553347, 0.06666667, 0, 1, 1,
0.4595408, 0.929474, -1.211551, 0.07450981, 0, 1, 1,
0.461014, -0.3553006, 3.170745, 0.07843138, 0, 1, 1,
0.4618929, 1.206579, -0.3531486, 0.08627451, 0, 1, 1,
0.4623062, 0.3741941, 1.386778, 0.09019608, 0, 1, 1,
0.4624365, 0.5274403, -0.8822317, 0.09803922, 0, 1, 1,
0.4679339, 0.4589418, 1.305761, 0.1058824, 0, 1, 1,
0.4717039, -0.1211958, 0.8522992, 0.1098039, 0, 1, 1,
0.4734977, 0.3695748, 0.07289659, 0.1176471, 0, 1, 1,
0.4809045, -0.3085552, 1.959704, 0.1215686, 0, 1, 1,
0.4915963, 0.1303159, 1.869852, 0.1294118, 0, 1, 1,
0.4920879, 0.07514238, 0.8769792, 0.1333333, 0, 1, 1,
0.4923944, 1.331099, -1.556814, 0.1411765, 0, 1, 1,
0.5034196, 1.199004, -0.5254763, 0.145098, 0, 1, 1,
0.5049054, 0.2881384, 1.400961, 0.1529412, 0, 1, 1,
0.508326, -0.2656986, 3.036779, 0.1568628, 0, 1, 1,
0.5093052, 1.471849, 0.1660191, 0.1647059, 0, 1, 1,
0.5103593, -0.3563918, 1.85198, 0.1686275, 0, 1, 1,
0.5106128, -0.1020656, 0.9041582, 0.1764706, 0, 1, 1,
0.5121297, -2.138557, 3.713293, 0.1803922, 0, 1, 1,
0.5167569, 1.333101, 1.021765, 0.1882353, 0, 1, 1,
0.5193185, -0.5089799, 0.1237402, 0.1921569, 0, 1, 1,
0.5205088, 1.612824, 1.505723, 0.2, 0, 1, 1,
0.5252591, -2.128385, 3.052742, 0.2078431, 0, 1, 1,
0.5263474, 2.087637, 0.2356766, 0.2117647, 0, 1, 1,
0.5300422, 0.2559478, 0.9059166, 0.2196078, 0, 1, 1,
0.5349758, -0.5130624, 1.817463, 0.2235294, 0, 1, 1,
0.5378833, 1.307896, -0.4696644, 0.2313726, 0, 1, 1,
0.5403777, -0.8699015, 1.456343, 0.2352941, 0, 1, 1,
0.5469565, -0.01202479, 2.361733, 0.2431373, 0, 1, 1,
0.5546224, 1.061189, 1.239697, 0.2470588, 0, 1, 1,
0.5594013, -0.6257973, 1.662021, 0.254902, 0, 1, 1,
0.5596898, -1.200849, 2.029596, 0.2588235, 0, 1, 1,
0.5618615, 0.06423439, -0.2101386, 0.2666667, 0, 1, 1,
0.5697498, 0.7806817, 1.051251, 0.2705882, 0, 1, 1,
0.5734802, -2.386859, 3.859566, 0.2784314, 0, 1, 1,
0.5743956, -0.831852, 2.10195, 0.282353, 0, 1, 1,
0.5752826, 0.03750899, 2.430327, 0.2901961, 0, 1, 1,
0.5824279, 0.2146336, 2.280561, 0.2941177, 0, 1, 1,
0.5826291, 0.2274746, 0.8868204, 0.3019608, 0, 1, 1,
0.5835358, 0.4044814, 1.444401, 0.3098039, 0, 1, 1,
0.5850676, -0.1801209, 1.13249, 0.3137255, 0, 1, 1,
0.5873406, 0.6942965, -0.08248306, 0.3215686, 0, 1, 1,
0.5921288, 1.010997, 1.891316, 0.3254902, 0, 1, 1,
0.5962027, 0.8136041, -0.1725318, 0.3333333, 0, 1, 1,
0.5974225, -0.4632558, -0.2897217, 0.3372549, 0, 1, 1,
0.6034271, -1.093386, 2.556951, 0.345098, 0, 1, 1,
0.6100503, -0.3883776, 0.2883327, 0.3490196, 0, 1, 1,
0.6123391, 0.2800458, 0.2580179, 0.3568628, 0, 1, 1,
0.6127065, -0.5952828, 1.974343, 0.3607843, 0, 1, 1,
0.6129108, 0.5311264, 1.95216, 0.3686275, 0, 1, 1,
0.6176379, -0.3996077, 1.810019, 0.372549, 0, 1, 1,
0.618311, 1.206646, 0.8007314, 0.3803922, 0, 1, 1,
0.6222579, 1.53181, 1.263218, 0.3843137, 0, 1, 1,
0.6291524, -0.3531392, 0.6990997, 0.3921569, 0, 1, 1,
0.6320922, -1.570437, 3.782066, 0.3960784, 0, 1, 1,
0.6336995, -1.745929, 3.018806, 0.4039216, 0, 1, 1,
0.6381415, -0.2696184, 2.246704, 0.4117647, 0, 1, 1,
0.6385639, -1.024863, 2.338296, 0.4156863, 0, 1, 1,
0.6460863, -1.213089, 2.031934, 0.4235294, 0, 1, 1,
0.647253, -0.9949157, 3.222367, 0.427451, 0, 1, 1,
0.6478699, -0.3738477, 2.770324, 0.4352941, 0, 1, 1,
0.6575462, 0.1499692, 1.002355, 0.4392157, 0, 1, 1,
0.6577614, 0.4777552, 0.2809578, 0.4470588, 0, 1, 1,
0.6683209, -0.472468, 2.10832, 0.4509804, 0, 1, 1,
0.6683892, 1.113749, -0.9007698, 0.4588235, 0, 1, 1,
0.6789102, -1.123854, 4.495642, 0.4627451, 0, 1, 1,
0.6790652, 0.2018105, 0.4941346, 0.4705882, 0, 1, 1,
0.6944953, -0.8856816, 1.547568, 0.4745098, 0, 1, 1,
0.6961874, 0.4923346, 1.445568, 0.4823529, 0, 1, 1,
0.6979259, -0.7791245, 3.280001, 0.4862745, 0, 1, 1,
0.7042123, -1.131389, 3.469912, 0.4941176, 0, 1, 1,
0.7050527, 0.8822809, 1.498751, 0.5019608, 0, 1, 1,
0.7066002, -0.19457, 1.412418, 0.5058824, 0, 1, 1,
0.7095532, 0.01944615, 1.362358, 0.5137255, 0, 1, 1,
0.7100396, 0.1308506, 1.765945, 0.5176471, 0, 1, 1,
0.7106059, 0.9272346, 0.8390201, 0.5254902, 0, 1, 1,
0.7164932, 1.065839, 2.115042, 0.5294118, 0, 1, 1,
0.716715, -0.458345, 0.7956706, 0.5372549, 0, 1, 1,
0.7203327, 0.8002561, 0.8408922, 0.5411765, 0, 1, 1,
0.7248565, 1.536012, 1.394258, 0.5490196, 0, 1, 1,
0.72978, 0.5308779, 1.238132, 0.5529412, 0, 1, 1,
0.7388755, -0.7422078, 2.664926, 0.5607843, 0, 1, 1,
0.7407677, 0.01807765, 1.219302, 0.5647059, 0, 1, 1,
0.742368, -1.06538, 2.299141, 0.572549, 0, 1, 1,
0.7446014, 0.1618863, 0.9311439, 0.5764706, 0, 1, 1,
0.7468379, 0.5573654, 0.1910125, 0.5843138, 0, 1, 1,
0.7512975, 0.6684773, 0.8821006, 0.5882353, 0, 1, 1,
0.7543926, -0.3668321, 3.754719, 0.5960785, 0, 1, 1,
0.7560605, -2.23185, 2.956403, 0.6039216, 0, 1, 1,
0.7571064, -1.757524, 4.021452, 0.6078432, 0, 1, 1,
0.7577943, 0.03443115, -0.4309838, 0.6156863, 0, 1, 1,
0.7593302, -0.1778894, 0.279437, 0.6196079, 0, 1, 1,
0.7673308, 0.4331098, -0.3734981, 0.627451, 0, 1, 1,
0.7721072, -2.007411, 1.417886, 0.6313726, 0, 1, 1,
0.7723736, -1.076813, 0.473953, 0.6392157, 0, 1, 1,
0.7737545, -1.151984, 2.32168, 0.6431373, 0, 1, 1,
0.7738416, 1.212049, 0.01374563, 0.6509804, 0, 1, 1,
0.7795115, -0.5228559, 3.851475, 0.654902, 0, 1, 1,
0.7829916, -0.9847758, 3.683977, 0.6627451, 0, 1, 1,
0.7872085, 0.5373976, 0.7293622, 0.6666667, 0, 1, 1,
0.7897357, 0.5359676, 0.8329448, 0.6745098, 0, 1, 1,
0.7968231, -1.375141, 2.931382, 0.6784314, 0, 1, 1,
0.8148741, -0.6680098, 4.002277, 0.6862745, 0, 1, 1,
0.8167625, -1.431553, 2.288176, 0.6901961, 0, 1, 1,
0.8259206, 1.173375, 0.2709347, 0.6980392, 0, 1, 1,
0.8323984, 1.497312, 0.7892298, 0.7058824, 0, 1, 1,
0.8337042, 0.7412372, 0.5644544, 0.7098039, 0, 1, 1,
0.8358466, -1.200249, 2.890213, 0.7176471, 0, 1, 1,
0.8360108, -0.9644405, 4.662069, 0.7215686, 0, 1, 1,
0.8374966, -0.633045, 0.3106718, 0.7294118, 0, 1, 1,
0.8388774, -1.089261, 3.263705, 0.7333333, 0, 1, 1,
0.8399612, 1.48463, 0.7104033, 0.7411765, 0, 1, 1,
0.8402387, -1.535894, 3.839622, 0.7450981, 0, 1, 1,
0.8460667, -2.834273, 4.519056, 0.7529412, 0, 1, 1,
0.8476878, -0.5535907, 2.186229, 0.7568628, 0, 1, 1,
0.8485737, -0.2727354, 1.563859, 0.7647059, 0, 1, 1,
0.8491282, 0.410632, 0.9375641, 0.7686275, 0, 1, 1,
0.8493354, 0.2110748, 3.652072, 0.7764706, 0, 1, 1,
0.8495089, -0.1675234, 1.548986, 0.7803922, 0, 1, 1,
0.8495592, 0.2163777, -0.5204288, 0.7882353, 0, 1, 1,
0.8536752, 1.320843, 1.625658, 0.7921569, 0, 1, 1,
0.8542846, -0.8679386, 0.05595493, 0.8, 0, 1, 1,
0.8639491, 0.8343367, 1.168916, 0.8078431, 0, 1, 1,
0.8640195, 0.3132145, -0.04923687, 0.8117647, 0, 1, 1,
0.8669873, -0.5364815, 2.002142, 0.8196079, 0, 1, 1,
0.8681625, 0.5137772, -0.09965865, 0.8235294, 0, 1, 1,
0.8688182, 0.6828883, 0.4269326, 0.8313726, 0, 1, 1,
0.8693733, 0.7625644, 2.395612, 0.8352941, 0, 1, 1,
0.8718413, 0.1098734, 2.818271, 0.8431373, 0, 1, 1,
0.8782837, -0.8109412, 2.968004, 0.8470588, 0, 1, 1,
0.8997053, -0.3461775, 2.166521, 0.854902, 0, 1, 1,
0.9140258, 0.1837253, 1.120737, 0.8588235, 0, 1, 1,
0.9183387, -0.5543782, 2.356215, 0.8666667, 0, 1, 1,
0.9196683, 0.6056212, 0.9825523, 0.8705882, 0, 1, 1,
0.9197753, 0.204102, 1.517034, 0.8784314, 0, 1, 1,
0.9288274, -0.07220087, 1.85789, 0.8823529, 0, 1, 1,
0.9337469, -1.13583, 2.190614, 0.8901961, 0, 1, 1,
0.9393583, -1.176699, 1.921823, 0.8941177, 0, 1, 1,
0.9417427, -0.3371733, 3.798445, 0.9019608, 0, 1, 1,
0.9455619, -0.2396104, 1.616941, 0.9098039, 0, 1, 1,
0.9462787, 0.9547787, 0.1549027, 0.9137255, 0, 1, 1,
0.9463837, 1.312221, -0.5520119, 0.9215686, 0, 1, 1,
0.9475274, -0.8682629, 0.191693, 0.9254902, 0, 1, 1,
0.9506078, -0.8129424, 0.5284226, 0.9333333, 0, 1, 1,
0.9520493, 0.8579619, 1.113867, 0.9372549, 0, 1, 1,
0.960133, -0.08099704, 2.475853, 0.945098, 0, 1, 1,
0.964964, 0.8580719, 0.3371427, 0.9490196, 0, 1, 1,
0.9651762, -0.4865956, 3.700094, 0.9568627, 0, 1, 1,
0.9661241, 1.653136, 0.2628696, 0.9607843, 0, 1, 1,
0.9695145, -1.992115, 2.444303, 0.9686275, 0, 1, 1,
0.9738961, 1.006096, 0.419651, 0.972549, 0, 1, 1,
0.9775899, -0.8150178, 1.032849, 0.9803922, 0, 1, 1,
0.9813149, -2.389925, 3.164124, 0.9843137, 0, 1, 1,
0.9816152, -1.089046, 1.426504, 0.9921569, 0, 1, 1,
0.9818359, -0.5112222, 1.108386, 0.9960784, 0, 1, 1,
0.9820943, -1.90563, 3.972713, 1, 0, 0.9960784, 1,
0.9845611, 2.318782, -0.348159, 1, 0, 0.9882353, 1,
0.986219, -1.316788, 1.030999, 1, 0, 0.9843137, 1,
0.9907234, 0.6060558, 0.5106239, 1, 0, 0.9764706, 1,
0.992398, 0.1327704, 3.668087, 1, 0, 0.972549, 1,
0.994156, 0.4119698, 0.7093067, 1, 0, 0.9647059, 1,
1.00069, 1.175304, 1.283121, 1, 0, 0.9607843, 1,
1.000959, 0.785019, 2.276916, 1, 0, 0.9529412, 1,
1.002639, 0.1556406, 1.123406, 1, 0, 0.9490196, 1,
1.011588, -1.288216, 2.70646, 1, 0, 0.9411765, 1,
1.022565, 0.5612936, -0.7345384, 1, 0, 0.9372549, 1,
1.029835, -0.8765268, 2.817939, 1, 0, 0.9294118, 1,
1.036959, 0.1912285, -1.56873, 1, 0, 0.9254902, 1,
1.039122, -1.200065, 1.748559, 1, 0, 0.9176471, 1,
1.049589, 1.338522, -0.8845142, 1, 0, 0.9137255, 1,
1.05206, -0.07405366, 0.3971659, 1, 0, 0.9058824, 1,
1.052773, 0.8674816, 0.5126711, 1, 0, 0.9019608, 1,
1.054025, 1.61806, 0.08704352, 1, 0, 0.8941177, 1,
1.063588, 0.6728401, 0.8886386, 1, 0, 0.8862745, 1,
1.064903, 0.7966048, 1.36489, 1, 0, 0.8823529, 1,
1.068022, 0.7498169, 0.6070867, 1, 0, 0.8745098, 1,
1.071668, -1.376289, 3.139414, 1, 0, 0.8705882, 1,
1.07501, -0.7463593, 2.953277, 1, 0, 0.8627451, 1,
1.077789, 0.9281283, 0.459367, 1, 0, 0.8588235, 1,
1.079549, 0.7526844, 1.454132, 1, 0, 0.8509804, 1,
1.083063, 0.6962106, 0.1120039, 1, 0, 0.8470588, 1,
1.083434, -0.4620326, 1.01127, 1, 0, 0.8392157, 1,
1.088151, 1.186709, 1.413045, 1, 0, 0.8352941, 1,
1.088468, 0.8946514, 2.349019, 1, 0, 0.827451, 1,
1.092668, -0.745733, 1.856149, 1, 0, 0.8235294, 1,
1.095967, -0.08698075, 1.36053, 1, 0, 0.8156863, 1,
1.100856, -2.497144, 4.948424, 1, 0, 0.8117647, 1,
1.105862, -1.872954, 1.918925, 1, 0, 0.8039216, 1,
1.110068, -0.03155013, 1.475115, 1, 0, 0.7960784, 1,
1.11015, -1.016773, 4.135139, 1, 0, 0.7921569, 1,
1.110604, -1.291919, 3.751481, 1, 0, 0.7843137, 1,
1.114533, 0.04726172, 1.674544, 1, 0, 0.7803922, 1,
1.114789, -0.1459782, 0.7522744, 1, 0, 0.772549, 1,
1.115451, -0.03581101, 2.508651, 1, 0, 0.7686275, 1,
1.116032, -1.363935, 1.472139, 1, 0, 0.7607843, 1,
1.118997, 0.9395729, 0.5684001, 1, 0, 0.7568628, 1,
1.119295, 0.2250838, 1.522503, 1, 0, 0.7490196, 1,
1.122991, 1.044726, -0.572053, 1, 0, 0.7450981, 1,
1.140951, 0.3947386, 1.751084, 1, 0, 0.7372549, 1,
1.146266, -1.467874, 2.114966, 1, 0, 0.7333333, 1,
1.153628, 0.8703418, -0.5755228, 1, 0, 0.7254902, 1,
1.1541, -0.9029738, 1.327109, 1, 0, 0.7215686, 1,
1.155738, 1.126538, -0.2951058, 1, 0, 0.7137255, 1,
1.156455, -1.688132, 2.730383, 1, 0, 0.7098039, 1,
1.173543, -1.688636, 4.306238, 1, 0, 0.7019608, 1,
1.176541, -0.04677761, 2.791698, 1, 0, 0.6941177, 1,
1.186701, 0.9316238, 2.484769, 1, 0, 0.6901961, 1,
1.190961, -0.4626492, 2.120258, 1, 0, 0.682353, 1,
1.196113, -0.0291483, 2.041611, 1, 0, 0.6784314, 1,
1.212518, -2.076142, 1.560436, 1, 0, 0.6705883, 1,
1.219053, 0.7136897, 1.409013, 1, 0, 0.6666667, 1,
1.220912, 0.3749261, 1.553961, 1, 0, 0.6588235, 1,
1.22287, 2.391646, 1.954918, 1, 0, 0.654902, 1,
1.232746, 0.7374864, 3.067727, 1, 0, 0.6470588, 1,
1.237987, 0.02196058, 2.42118, 1, 0, 0.6431373, 1,
1.239264, 0.5938556, 1.645325, 1, 0, 0.6352941, 1,
1.244639, 1.596883, 0.2966503, 1, 0, 0.6313726, 1,
1.248832, 0.5057125, 2.816456, 1, 0, 0.6235294, 1,
1.25411, -0.08312839, 1.38227, 1, 0, 0.6196079, 1,
1.254801, -2.036942, 4.111368, 1, 0, 0.6117647, 1,
1.266924, 0.2950353, 1.139678, 1, 0, 0.6078432, 1,
1.267449, 0.2303461, 1.455621, 1, 0, 0.6, 1,
1.280329, -1.296285, 1.592436, 1, 0, 0.5921569, 1,
1.290351, 0.6256918, 1.368145, 1, 0, 0.5882353, 1,
1.29774, 0.5057356, 0.9619625, 1, 0, 0.5803922, 1,
1.299051, -0.7694166, 2.553176, 1, 0, 0.5764706, 1,
1.303856, 1.766495, -0.06350575, 1, 0, 0.5686275, 1,
1.30741, -0.9539607, 1.309332, 1, 0, 0.5647059, 1,
1.307731, 2.29812, -0.1635976, 1, 0, 0.5568628, 1,
1.309661, 3.063357, 0.6506302, 1, 0, 0.5529412, 1,
1.311219, 0.8918221, 0.7789523, 1, 0, 0.5450981, 1,
1.311907, -0.3559493, 2.22477, 1, 0, 0.5411765, 1,
1.311912, 0.5744248, 1.453959, 1, 0, 0.5333334, 1,
1.320624, 0.5606968, -0.4859021, 1, 0, 0.5294118, 1,
1.320922, -1.249121, 3.623344, 1, 0, 0.5215687, 1,
1.331335, 0.3382494, 1.077466, 1, 0, 0.5176471, 1,
1.333812, 0.9867126, 1.833594, 1, 0, 0.509804, 1,
1.33775, 0.3759468, 0.9819949, 1, 0, 0.5058824, 1,
1.340122, 0.604503, -0.1001913, 1, 0, 0.4980392, 1,
1.340715, 0.05762641, 1.504567, 1, 0, 0.4901961, 1,
1.344078, 0.0387833, 2.870393, 1, 0, 0.4862745, 1,
1.344614, -0.8935037, 1.748808, 1, 0, 0.4784314, 1,
1.358751, -0.7952689, 3.809178, 1, 0, 0.4745098, 1,
1.361028, -0.8077043, 1.612316, 1, 0, 0.4666667, 1,
1.375447, -1.417212, 3.535487, 1, 0, 0.4627451, 1,
1.377541, 1.362979, 2.109966, 1, 0, 0.454902, 1,
1.381435, -0.4721596, 3.092348, 1, 0, 0.4509804, 1,
1.38972, 1.458074, 0.7821202, 1, 0, 0.4431373, 1,
1.393611, 1.47704, 0.7671158, 1, 0, 0.4392157, 1,
1.396614, -0.7379904, 0.3346201, 1, 0, 0.4313726, 1,
1.403544, 0.2668139, 1.889361, 1, 0, 0.427451, 1,
1.414173, 0.9064737, 1.603242, 1, 0, 0.4196078, 1,
1.417488, 0.1728405, -1.095312, 1, 0, 0.4156863, 1,
1.423271, -1.127474, 1.410463, 1, 0, 0.4078431, 1,
1.434579, -0.9652518, 1.118092, 1, 0, 0.4039216, 1,
1.442447, 0.936602, 1.250679, 1, 0, 0.3960784, 1,
1.444861, -1.746606, 2.678055, 1, 0, 0.3882353, 1,
1.446967, -1.323796, 0.5230486, 1, 0, 0.3843137, 1,
1.458803, -0.1450312, 1.137342, 1, 0, 0.3764706, 1,
1.463344, -0.4691036, 0.8715971, 1, 0, 0.372549, 1,
1.468534, 0.2064318, 1.47585, 1, 0, 0.3647059, 1,
1.494354, -0.7286721, 3.042854, 1, 0, 0.3607843, 1,
1.495484, -1.536899, 2.96495, 1, 0, 0.3529412, 1,
1.49644, 0.2558528, 2.421567, 1, 0, 0.3490196, 1,
1.511386, 0.7599351, 1.146998, 1, 0, 0.3411765, 1,
1.516375, -0.3732981, 0.8133063, 1, 0, 0.3372549, 1,
1.52147, 0.4215183, 1.139426, 1, 0, 0.3294118, 1,
1.549667, -1.348958, 2.473927, 1, 0, 0.3254902, 1,
1.551107, 1.983572, 1.143395, 1, 0, 0.3176471, 1,
1.5558, 0.09460114, 1.769696, 1, 0, 0.3137255, 1,
1.55633, -1.51281, 2.51052, 1, 0, 0.3058824, 1,
1.563112, 1.185078, 0.2420518, 1, 0, 0.2980392, 1,
1.571272, 0.5426061, 1.671919, 1, 0, 0.2941177, 1,
1.578266, -0.09075949, 3.57478, 1, 0, 0.2862745, 1,
1.591983, -0.1541542, 1.801804, 1, 0, 0.282353, 1,
1.593327, 0.7745063, 1.471843, 1, 0, 0.2745098, 1,
1.606682, 0.04600688, 1.224135, 1, 0, 0.2705882, 1,
1.606949, 0.1043978, 1.384073, 1, 0, 0.2627451, 1,
1.610667, -0.02788327, 3.055937, 1, 0, 0.2588235, 1,
1.644949, 0.4647224, 1.196906, 1, 0, 0.2509804, 1,
1.646268, 0.3369179, 0.09000348, 1, 0, 0.2470588, 1,
1.693955, -0.1324283, 1.082825, 1, 0, 0.2392157, 1,
1.740186, -1.990197, 2.298889, 1, 0, 0.2352941, 1,
1.748989, -0.8329312, 1.158923, 1, 0, 0.227451, 1,
1.765982, 1.555974, 2.394471, 1, 0, 0.2235294, 1,
1.819821, 0.2252684, 1.767416, 1, 0, 0.2156863, 1,
1.82394, -0.4585797, 1.927286, 1, 0, 0.2117647, 1,
1.833115, -1.923807, 3.688678, 1, 0, 0.2039216, 1,
1.839708, -0.7255412, 1.295147, 1, 0, 0.1960784, 1,
1.859406, -2.01606, 1.802492, 1, 0, 0.1921569, 1,
1.864071, -1.221556, 2.269894, 1, 0, 0.1843137, 1,
1.888628, -0.26702, 2.456481, 1, 0, 0.1803922, 1,
1.895352, 0.6847568, -0.1936444, 1, 0, 0.172549, 1,
1.90615, 0.76438, 1.290053, 1, 0, 0.1686275, 1,
1.918994, -0.9803333, 2.223812, 1, 0, 0.1607843, 1,
1.953698, -0.05400319, 0.8871141, 1, 0, 0.1568628, 1,
1.967255, -0.4763904, 2.68936, 1, 0, 0.1490196, 1,
1.973313, 1.077509, 1.609113, 1, 0, 0.145098, 1,
1.973444, 0.0227186, 2.446926, 1, 0, 0.1372549, 1,
1.981311, 1.322141, 1.529477, 1, 0, 0.1333333, 1,
1.986692, 1.212386, 0.537725, 1, 0, 0.1254902, 1,
2.010935, 0.7055433, 1.479133, 1, 0, 0.1215686, 1,
2.025745, -0.2916693, 2.801653, 1, 0, 0.1137255, 1,
2.101472, 0.6028397, 1.435811, 1, 0, 0.1098039, 1,
2.135204, -0.966914, 1.315305, 1, 0, 0.1019608, 1,
2.272238, 0.1745551, 3.092363, 1, 0, 0.09411765, 1,
2.364659, -0.3842925, 4.019433, 1, 0, 0.09019608, 1,
2.382456, 0.3415085, 1.642229, 1, 0, 0.08235294, 1,
2.416002, -0.04073052, 0.02889673, 1, 0, 0.07843138, 1,
2.43181, 0.2971048, 2.53399, 1, 0, 0.07058824, 1,
2.448275, 0.771649, 0.6823524, 1, 0, 0.06666667, 1,
2.490528, -1.27556, 2.313713, 1, 0, 0.05882353, 1,
2.513131, 0.6660262, 0.8211342, 1, 0, 0.05490196, 1,
2.541841, 1.244888, 1.691393, 1, 0, 0.04705882, 1,
2.594269, -1.127973, 1.58948, 1, 0, 0.04313726, 1,
2.604193, -1.193589, 2.759891, 1, 0, 0.03529412, 1,
2.756838, 1.039341, 1.321877, 1, 0, 0.03137255, 1,
2.802634, 0.04144801, 1.682306, 1, 0, 0.02352941, 1,
2.81527, 1.748726, 0.3740553, 1, 0, 0.01960784, 1,
2.964703, 2.707883, -0.1559381, 1, 0, 0.01176471, 1,
3.025197, -0.3838792, 1.246109, 1, 0, 0.007843138, 1
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
-0.2929049, -4.378369, -6.738101, 0, -0.5, 0.5, 0.5,
-0.2929049, -4.378369, -6.738101, 1, -0.5, 0.5, 0.5,
-0.2929049, -4.378369, -6.738101, 1, 1.5, 0.5, 0.5,
-0.2929049, -4.378369, -6.738101, 0, 1.5, 0.5, 0.5
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
-4.735844, -0.1182276, -6.738101, 0, -0.5, 0.5, 0.5,
-4.735844, -0.1182276, -6.738101, 1, -0.5, 0.5, 0.5,
-4.735844, -0.1182276, -6.738101, 1, 1.5, 0.5, 0.5,
-4.735844, -0.1182276, -6.738101, 0, 1.5, 0.5, 0.5
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
-4.735844, -4.378369, 0.3902552, 0, -0.5, 0.5, 0.5,
-4.735844, -4.378369, 0.3902552, 1, -0.5, 0.5, 0.5,
-4.735844, -4.378369, 0.3902552, 1, 1.5, 0.5, 0.5,
-4.735844, -4.378369, 0.3902552, 0, 1.5, 0.5, 0.5
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
-3, -3.395259, -5.093096,
3, -3.395259, -5.093096,
-3, -3.395259, -5.093096,
-3, -3.559111, -5.367263,
-2, -3.395259, -5.093096,
-2, -3.559111, -5.367263,
-1, -3.395259, -5.093096,
-1, -3.559111, -5.367263,
0, -3.395259, -5.093096,
0, -3.559111, -5.367263,
1, -3.395259, -5.093096,
1, -3.559111, -5.367263,
2, -3.395259, -5.093096,
2, -3.559111, -5.367263,
3, -3.395259, -5.093096,
3, -3.559111, -5.367263
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
-3, -3.886814, -5.915598, 0, -0.5, 0.5, 0.5,
-3, -3.886814, -5.915598, 1, -0.5, 0.5, 0.5,
-3, -3.886814, -5.915598, 1, 1.5, 0.5, 0.5,
-3, -3.886814, -5.915598, 0, 1.5, 0.5, 0.5,
-2, -3.886814, -5.915598, 0, -0.5, 0.5, 0.5,
-2, -3.886814, -5.915598, 1, -0.5, 0.5, 0.5,
-2, -3.886814, -5.915598, 1, 1.5, 0.5, 0.5,
-2, -3.886814, -5.915598, 0, 1.5, 0.5, 0.5,
-1, -3.886814, -5.915598, 0, -0.5, 0.5, 0.5,
-1, -3.886814, -5.915598, 1, -0.5, 0.5, 0.5,
-1, -3.886814, -5.915598, 1, 1.5, 0.5, 0.5,
-1, -3.886814, -5.915598, 0, 1.5, 0.5, 0.5,
0, -3.886814, -5.915598, 0, -0.5, 0.5, 0.5,
0, -3.886814, -5.915598, 1, -0.5, 0.5, 0.5,
0, -3.886814, -5.915598, 1, 1.5, 0.5, 0.5,
0, -3.886814, -5.915598, 0, 1.5, 0.5, 0.5,
1, -3.886814, -5.915598, 0, -0.5, 0.5, 0.5,
1, -3.886814, -5.915598, 1, -0.5, 0.5, 0.5,
1, -3.886814, -5.915598, 1, 1.5, 0.5, 0.5,
1, -3.886814, -5.915598, 0, 1.5, 0.5, 0.5,
2, -3.886814, -5.915598, 0, -0.5, 0.5, 0.5,
2, -3.886814, -5.915598, 1, -0.5, 0.5, 0.5,
2, -3.886814, -5.915598, 1, 1.5, 0.5, 0.5,
2, -3.886814, -5.915598, 0, 1.5, 0.5, 0.5,
3, -3.886814, -5.915598, 0, -0.5, 0.5, 0.5,
3, -3.886814, -5.915598, 1, -0.5, 0.5, 0.5,
3, -3.886814, -5.915598, 1, 1.5, 0.5, 0.5,
3, -3.886814, -5.915598, 0, 1.5, 0.5, 0.5
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
-3.71055, -3, -5.093096,
-3.71055, 3, -5.093096,
-3.71055, -3, -5.093096,
-3.881432, -3, -5.367263,
-3.71055, -2, -5.093096,
-3.881432, -2, -5.367263,
-3.71055, -1, -5.093096,
-3.881432, -1, -5.367263,
-3.71055, 0, -5.093096,
-3.881432, 0, -5.367263,
-3.71055, 1, -5.093096,
-3.881432, 1, -5.367263,
-3.71055, 2, -5.093096,
-3.881432, 2, -5.367263,
-3.71055, 3, -5.093096,
-3.881432, 3, -5.367263
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
-4.223197, -3, -5.915598, 0, -0.5, 0.5, 0.5,
-4.223197, -3, -5.915598, 1, -0.5, 0.5, 0.5,
-4.223197, -3, -5.915598, 1, 1.5, 0.5, 0.5,
-4.223197, -3, -5.915598, 0, 1.5, 0.5, 0.5,
-4.223197, -2, -5.915598, 0, -0.5, 0.5, 0.5,
-4.223197, -2, -5.915598, 1, -0.5, 0.5, 0.5,
-4.223197, -2, -5.915598, 1, 1.5, 0.5, 0.5,
-4.223197, -2, -5.915598, 0, 1.5, 0.5, 0.5,
-4.223197, -1, -5.915598, 0, -0.5, 0.5, 0.5,
-4.223197, -1, -5.915598, 1, -0.5, 0.5, 0.5,
-4.223197, -1, -5.915598, 1, 1.5, 0.5, 0.5,
-4.223197, -1, -5.915598, 0, 1.5, 0.5, 0.5,
-4.223197, 0, -5.915598, 0, -0.5, 0.5, 0.5,
-4.223197, 0, -5.915598, 1, -0.5, 0.5, 0.5,
-4.223197, 0, -5.915598, 1, 1.5, 0.5, 0.5,
-4.223197, 0, -5.915598, 0, 1.5, 0.5, 0.5,
-4.223197, 1, -5.915598, 0, -0.5, 0.5, 0.5,
-4.223197, 1, -5.915598, 1, -0.5, 0.5, 0.5,
-4.223197, 1, -5.915598, 1, 1.5, 0.5, 0.5,
-4.223197, 1, -5.915598, 0, 1.5, 0.5, 0.5,
-4.223197, 2, -5.915598, 0, -0.5, 0.5, 0.5,
-4.223197, 2, -5.915598, 1, -0.5, 0.5, 0.5,
-4.223197, 2, -5.915598, 1, 1.5, 0.5, 0.5,
-4.223197, 2, -5.915598, 0, 1.5, 0.5, 0.5,
-4.223197, 3, -5.915598, 0, -0.5, 0.5, 0.5,
-4.223197, 3, -5.915598, 1, -0.5, 0.5, 0.5,
-4.223197, 3, -5.915598, 1, 1.5, 0.5, 0.5,
-4.223197, 3, -5.915598, 0, 1.5, 0.5, 0.5
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
-3.71055, -3.395259, -4,
-3.71055, -3.395259, 4,
-3.71055, -3.395259, -4,
-3.881432, -3.559111, -4,
-3.71055, -3.395259, -2,
-3.881432, -3.559111, -2,
-3.71055, -3.395259, 0,
-3.881432, -3.559111, 0,
-3.71055, -3.395259, 2,
-3.881432, -3.559111, 2,
-3.71055, -3.395259, 4,
-3.881432, -3.559111, 4
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
-4.223197, -3.886814, -4, 0, -0.5, 0.5, 0.5,
-4.223197, -3.886814, -4, 1, -0.5, 0.5, 0.5,
-4.223197, -3.886814, -4, 1, 1.5, 0.5, 0.5,
-4.223197, -3.886814, -4, 0, 1.5, 0.5, 0.5,
-4.223197, -3.886814, -2, 0, -0.5, 0.5, 0.5,
-4.223197, -3.886814, -2, 1, -0.5, 0.5, 0.5,
-4.223197, -3.886814, -2, 1, 1.5, 0.5, 0.5,
-4.223197, -3.886814, -2, 0, 1.5, 0.5, 0.5,
-4.223197, -3.886814, 0, 0, -0.5, 0.5, 0.5,
-4.223197, -3.886814, 0, 1, -0.5, 0.5, 0.5,
-4.223197, -3.886814, 0, 1, 1.5, 0.5, 0.5,
-4.223197, -3.886814, 0, 0, 1.5, 0.5, 0.5,
-4.223197, -3.886814, 2, 0, -0.5, 0.5, 0.5,
-4.223197, -3.886814, 2, 1, -0.5, 0.5, 0.5,
-4.223197, -3.886814, 2, 1, 1.5, 0.5, 0.5,
-4.223197, -3.886814, 2, 0, 1.5, 0.5, 0.5,
-4.223197, -3.886814, 4, 0, -0.5, 0.5, 0.5,
-4.223197, -3.886814, 4, 1, -0.5, 0.5, 0.5,
-4.223197, -3.886814, 4, 1, 1.5, 0.5, 0.5,
-4.223197, -3.886814, 4, 0, 1.5, 0.5, 0.5
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
-3.71055, -3.395259, -5.093096,
-3.71055, 3.158804, -5.093096,
-3.71055, -3.395259, 5.873606,
-3.71055, 3.158804, 5.873606,
-3.71055, -3.395259, -5.093096,
-3.71055, -3.395259, 5.873606,
-3.71055, 3.158804, -5.093096,
-3.71055, 3.158804, 5.873606,
-3.71055, -3.395259, -5.093096,
3.12474, -3.395259, -5.093096,
-3.71055, -3.395259, 5.873606,
3.12474, -3.395259, 5.873606,
-3.71055, 3.158804, -5.093096,
3.12474, 3.158804, -5.093096,
-3.71055, 3.158804, 5.873606,
3.12474, 3.158804, 5.873606,
3.12474, -3.395259, -5.093096,
3.12474, 3.158804, -5.093096,
3.12474, -3.395259, 5.873606,
3.12474, 3.158804, 5.873606,
3.12474, -3.395259, -5.093096,
3.12474, -3.395259, 5.873606,
3.12474, 3.158804, -5.093096,
3.12474, 3.158804, 5.873606
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
var radius = 7.737109;
var distance = 34.42327;
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
mvMatrix.translate( 0.2929049, 0.1182276, -0.3902552 );
mvMatrix.scale( 1.223871, 1.276386, 0.7628104 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.42327);
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
methyldymron<-read.table("methyldymron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methyldymron$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyldymron' not found
```

```r
y<-methyldymron$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyldymron' not found
```

```r
z<-methyldymron$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyldymron' not found
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
-3.611007, 1.49475, -1.356983, 0, 0, 1, 1, 1,
-3.231447, 1.049853, -1.556066, 1, 0, 0, 1, 1,
-2.90266, -0.2577065, -2.415801, 1, 0, 0, 1, 1,
-2.882829, 0.1251565, -0.0360547, 1, 0, 0, 1, 1,
-2.670974, -1.820052, -1.715372, 1, 0, 0, 1, 1,
-2.567604, -0.04862285, -0.7704477, 1, 0, 0, 1, 1,
-2.559891, -1.514652, -2.685907, 0, 0, 0, 1, 1,
-2.543296, 0.5843986, -3.169698, 0, 0, 0, 1, 1,
-2.418732, -0.6057844, -0.9741817, 0, 0, 0, 1, 1,
-2.339752, -2.219921, -2.741164, 0, 0, 0, 1, 1,
-2.332032, 1.158484, -1.150788, 0, 0, 0, 1, 1,
-2.28172, 1.571239, -1.829169, 0, 0, 0, 1, 1,
-2.280123, 1.063692, -0.1760986, 0, 0, 0, 1, 1,
-2.271306, 0.03324943, -0.529503, 1, 1, 1, 1, 1,
-2.224955, 1.508796, -2.518116, 1, 1, 1, 1, 1,
-2.173327, -1.036674, -1.189716, 1, 1, 1, 1, 1,
-2.156554, -0.5326862, -4.003542, 1, 1, 1, 1, 1,
-2.12819, 1.57905, -2.544174, 1, 1, 1, 1, 1,
-2.124245, -0.6740208, -1.660331, 1, 1, 1, 1, 1,
-2.116095, -0.6866272, -2.787263, 1, 1, 1, 1, 1,
-2.029296, 0.4330561, -1.737336, 1, 1, 1, 1, 1,
-1.954641, -0.4610189, -1.124542, 1, 1, 1, 1, 1,
-1.946593, -0.1290002, -0.02904788, 1, 1, 1, 1, 1,
-1.932884, 1.031349, 0.04037796, 1, 1, 1, 1, 1,
-1.927731, -1.351602, -3.014098, 1, 1, 1, 1, 1,
-1.922479, -1.205672, -3.237343, 1, 1, 1, 1, 1,
-1.906816, 1.140954, -0.09753032, 1, 1, 1, 1, 1,
-1.905274, -0.7664005, -1.92603, 1, 1, 1, 1, 1,
-1.889795, 1.451364, 0.338322, 0, 0, 1, 1, 1,
-1.880722, 0.5365915, -0.8488034, 1, 0, 0, 1, 1,
-1.879138, 0.3739054, -3.951735, 1, 0, 0, 1, 1,
-1.844257, -1.580416, -0.3800804, 1, 0, 0, 1, 1,
-1.834425, -1.096075, -0.547509, 1, 0, 0, 1, 1,
-1.833205, 0.09435371, -2.413938, 1, 0, 0, 1, 1,
-1.772462, 0.3014633, -2.232198, 0, 0, 0, 1, 1,
-1.765092, 1.235119, -1.173458, 0, 0, 0, 1, 1,
-1.760787, -0.378449, -3.374318, 0, 0, 0, 1, 1,
-1.750656, -1.281761, -2.833019, 0, 0, 0, 1, 1,
-1.748007, 0.240078, -2.901837, 0, 0, 0, 1, 1,
-1.731627, 0.968421, -1.633315, 0, 0, 0, 1, 1,
-1.728249, 1.102597, -2.727462, 0, 0, 0, 1, 1,
-1.715805, 1.065961, -1.077958, 1, 1, 1, 1, 1,
-1.705296, -0.7013403, 1.165305, 1, 1, 1, 1, 1,
-1.699713, -0.362475, -2.08572, 1, 1, 1, 1, 1,
-1.696342, 0.7490636, -0.8724052, 1, 1, 1, 1, 1,
-1.687002, -0.7797419, -3.134477, 1, 1, 1, 1, 1,
-1.658502, -0.4435375, -2.053865, 1, 1, 1, 1, 1,
-1.656189, 0.354329, -0.6955345, 1, 1, 1, 1, 1,
-1.652304, -1.700829, -4.380074, 1, 1, 1, 1, 1,
-1.638038, -0.9535081, -2.529077, 1, 1, 1, 1, 1,
-1.636857, -0.3146819, -2.283814, 1, 1, 1, 1, 1,
-1.601346, 2.225323, -0.3180833, 1, 1, 1, 1, 1,
-1.596144, -0.006812762, 0.2258457, 1, 1, 1, 1, 1,
-1.559563, -0.1843765, -0.5064054, 1, 1, 1, 1, 1,
-1.558339, 1.35087, 0.09949683, 1, 1, 1, 1, 1,
-1.535525, 0.871258, 0.1277278, 1, 1, 1, 1, 1,
-1.524718, -0.7535608, -2.600628, 0, 0, 1, 1, 1,
-1.516179, 0.4269704, -1.171613, 1, 0, 0, 1, 1,
-1.512434, 1.164603, -1.277263, 1, 0, 0, 1, 1,
-1.512176, 0.9966304, -1.519328, 1, 0, 0, 1, 1,
-1.510519, 0.06529664, 0.05553851, 1, 0, 0, 1, 1,
-1.498069, -0.3658787, -1.520352, 1, 0, 0, 1, 1,
-1.494292, -0.3985664, -0.7907276, 0, 0, 0, 1, 1,
-1.49301, 0.8802274, -0.571301, 0, 0, 0, 1, 1,
-1.487877, -0.3789829, -2.448575, 0, 0, 0, 1, 1,
-1.487827, 0.6538784, -1.421891, 0, 0, 0, 1, 1,
-1.483754, 0.2081353, -1.791543, 0, 0, 0, 1, 1,
-1.482254, -0.9252186, -2.435431, 0, 0, 0, 1, 1,
-1.466018, 1.346071, -0.7989548, 0, 0, 0, 1, 1,
-1.447392, 0.5152432, 0.1096896, 1, 1, 1, 1, 1,
-1.446209, 0.6563041, 0.2567061, 1, 1, 1, 1, 1,
-1.433536, 1.602408, 0.1819051, 1, 1, 1, 1, 1,
-1.433292, 1.264504, -0.841554, 1, 1, 1, 1, 1,
-1.41201, -0.2219678, -2.557741, 1, 1, 1, 1, 1,
-1.402552, -0.7142965, -2.107484, 1, 1, 1, 1, 1,
-1.381824, 1.508995, -2.034728, 1, 1, 1, 1, 1,
-1.379296, 0.4511449, -1.350452, 1, 1, 1, 1, 1,
-1.377727, 0.2973059, -1.236709, 1, 1, 1, 1, 1,
-1.376543, -2.869202, -1.090924, 1, 1, 1, 1, 1,
-1.372115, -0.9547255, -1.367178, 1, 1, 1, 1, 1,
-1.367944, 1.629861, -1.788406, 1, 1, 1, 1, 1,
-1.360373, -1.161882, -3.192617, 1, 1, 1, 1, 1,
-1.359915, 0.379297, 0.1973749, 1, 1, 1, 1, 1,
-1.357489, -0.7267061, -1.793651, 1, 1, 1, 1, 1,
-1.350387, 1.164997, -0.7680014, 0, 0, 1, 1, 1,
-1.341106, -0.3623122, -2.010401, 1, 0, 0, 1, 1,
-1.331401, -1.359506, -2.444922, 1, 0, 0, 1, 1,
-1.32778, -1.620961, -1.24555, 1, 0, 0, 1, 1,
-1.318421, -0.336681, -2.343949, 1, 0, 0, 1, 1,
-1.313313, -2.047134, -1.323339, 1, 0, 0, 1, 1,
-1.313281, 1.34128, -2.545628, 0, 0, 0, 1, 1,
-1.308426, 1.034791, -1.339337, 0, 0, 0, 1, 1,
-1.299259, -2.000994, -1.468243, 0, 0, 0, 1, 1,
-1.27172, 0.9005104, -2.718772, 0, 0, 0, 1, 1,
-1.270665, -1.508352, -4.114398, 0, 0, 0, 1, 1,
-1.268354, -0.5784423, -2.765296, 0, 0, 0, 1, 1,
-1.267386, 1.396865, -1.061913, 0, 0, 0, 1, 1,
-1.266138, -1.182654, -3.135318, 1, 1, 1, 1, 1,
-1.264908, -0.8523706, -1.623663, 1, 1, 1, 1, 1,
-1.262338, -0.499345, -2.311163, 1, 1, 1, 1, 1,
-1.257606, 1.450917, -1.233091, 1, 1, 1, 1, 1,
-1.251379, -1.254762, -2.516009, 1, 1, 1, 1, 1,
-1.234964, -0.8119317, 0.5720198, 1, 1, 1, 1, 1,
-1.229522, 2.163161, -1.949235, 1, 1, 1, 1, 1,
-1.228974, 1.601644, -0.2208916, 1, 1, 1, 1, 1,
-1.22704, -0.1862184, -3.119169, 1, 1, 1, 1, 1,
-1.225813, -0.6560746, -3.508793, 1, 1, 1, 1, 1,
-1.221774, -0.5949862, -0.9887516, 1, 1, 1, 1, 1,
-1.220308, 0.2368034, -2.158352, 1, 1, 1, 1, 1,
-1.210021, -1.483915, -1.354243, 1, 1, 1, 1, 1,
-1.205045, 0.001461594, -0.2850672, 1, 1, 1, 1, 1,
-1.199182, -1.328407, -3.070672, 1, 1, 1, 1, 1,
-1.193329, 0.01661815, -1.434259, 0, 0, 1, 1, 1,
-1.171065, -1.435798, -2.180715, 1, 0, 0, 1, 1,
-1.170348, 1.351939, -0.05260311, 1, 0, 0, 1, 1,
-1.164392, 0.5358009, -1.985627, 1, 0, 0, 1, 1,
-1.164147, 0.6570591, -1.398162, 1, 0, 0, 1, 1,
-1.162775, -0.5137454, -0.1732206, 1, 0, 0, 1, 1,
-1.162435, -0.4733576, -1.452046, 0, 0, 0, 1, 1,
-1.162198, -1.419791, -3.859058, 0, 0, 0, 1, 1,
-1.152211, -1.078792, -3.981635, 0, 0, 0, 1, 1,
-1.151912, 0.03550711, -2.764478, 0, 0, 0, 1, 1,
-1.149406, -2.146767, -1.584772, 0, 0, 0, 1, 1,
-1.142743, -1.455609, -1.934362, 0, 0, 0, 1, 1,
-1.142127, 1.456794, -0.3204962, 0, 0, 0, 1, 1,
-1.138947, 0.875416, -2.774208, 1, 1, 1, 1, 1,
-1.128755, -1.236983, -1.615646, 1, 1, 1, 1, 1,
-1.126659, -0.2406621, -2.480278, 1, 1, 1, 1, 1,
-1.122399, -0.4440518, -2.511326, 1, 1, 1, 1, 1,
-1.120509, 1.411752, -2.080966, 1, 1, 1, 1, 1,
-1.119509, 0.4419135, -0.7789261, 1, 1, 1, 1, 1,
-1.11732, 1.45203, -1.405806, 1, 1, 1, 1, 1,
-1.117166, 0.2861519, -0.2224759, 1, 1, 1, 1, 1,
-1.114532, 0.5050111, -1.852696, 1, 1, 1, 1, 1,
-1.101724, -1.497733, -0.9681782, 1, 1, 1, 1, 1,
-1.100453, -0.05378408, -1.111642, 1, 1, 1, 1, 1,
-1.100247, -0.5360366, -1.26441, 1, 1, 1, 1, 1,
-1.095448, 0.9415047, 0.9102739, 1, 1, 1, 1, 1,
-1.095136, 1.015485, 0.4110405, 1, 1, 1, 1, 1,
-1.089633, -0.9118884, -3.970962, 1, 1, 1, 1, 1,
-1.084991, 0.4691192, -1.28066, 0, 0, 1, 1, 1,
-1.078994, -0.1859295, -1.984934, 1, 0, 0, 1, 1,
-1.077397, -0.8831853, -1.827716, 1, 0, 0, 1, 1,
-1.073935, 0.2395382, 0.9310972, 1, 0, 0, 1, 1,
-1.072253, -0.9376862, -2.18749, 1, 0, 0, 1, 1,
-1.058635, 0.4488928, -0.7830755, 1, 0, 0, 1, 1,
-1.054607, -2.15602, -2.411263, 0, 0, 0, 1, 1,
-1.051759, -1.222423, -1.087701, 0, 0, 0, 1, 1,
-1.044163, -1.114538, -1.826193, 0, 0, 0, 1, 1,
-1.041552, -0.03813666, -0.3963213, 0, 0, 0, 1, 1,
-1.040276, -1.394922, -1.898388, 0, 0, 0, 1, 1,
-1.039643, -0.2106638, -1.836576, 0, 0, 0, 1, 1,
-1.032887, 0.8697231, -0.04177861, 0, 0, 0, 1, 1,
-1.028561, -1.802287, -3.149325, 1, 1, 1, 1, 1,
-1.024075, -0.3689844, -2.282897, 1, 1, 1, 1, 1,
-1.021449, -0.7908592, -3.816095, 1, 1, 1, 1, 1,
-1.007375, -0.5731312, -1.544395, 1, 1, 1, 1, 1,
-1.004563, 0.2668267, -0.3857026, 1, 1, 1, 1, 1,
-1.003057, -0.6297047, -0.8719063, 1, 1, 1, 1, 1,
-0.9989994, 0.9629763, -0.6682397, 1, 1, 1, 1, 1,
-0.9961642, 0.2036092, -0.07847434, 1, 1, 1, 1, 1,
-0.9914477, 0.0412876, -2.342113, 1, 1, 1, 1, 1,
-0.9868439, -1.463293, -3.158475, 1, 1, 1, 1, 1,
-0.986732, 0.03241386, -2.593269, 1, 1, 1, 1, 1,
-0.9717381, -0.1931863, -1.073027, 1, 1, 1, 1, 1,
-0.9663815, -0.8693963, -2.078766, 1, 1, 1, 1, 1,
-0.9611771, -0.1629022, -2.644478, 1, 1, 1, 1, 1,
-0.9607005, 0.8288907, -0.6478806, 1, 1, 1, 1, 1,
-0.959575, -1.117493, -2.821054, 0, 0, 1, 1, 1,
-0.9504845, -0.6697816, -1.904524, 1, 0, 0, 1, 1,
-0.9424132, 0.2207965, -0.5093725, 1, 0, 0, 1, 1,
-0.9135433, 0.8253661, -3.016649, 1, 0, 0, 1, 1,
-0.9134532, 0.2914653, -1.826895, 1, 0, 0, 1, 1,
-0.9073955, 1.572471, -2.56336, 1, 0, 0, 1, 1,
-0.8967941, -0.5430431, -2.559653, 0, 0, 0, 1, 1,
-0.8922244, 1.178211, -0.4391025, 0, 0, 0, 1, 1,
-0.8915474, 0.1047271, -2.147789, 0, 0, 0, 1, 1,
-0.8856889, -0.2879242, -2.996067, 0, 0, 0, 1, 1,
-0.8752319, -1.437856, -2.858672, 0, 0, 0, 1, 1,
-0.8705714, -0.4286033, -2.301513, 0, 0, 0, 1, 1,
-0.8704116, 0.6117242, -0.3651918, 0, 0, 0, 1, 1,
-0.8673813, 0.2907596, -1.417283, 1, 1, 1, 1, 1,
-0.862874, 1.864859, 0.3043411, 1, 1, 1, 1, 1,
-0.8584728, -0.8749743, -2.459528, 1, 1, 1, 1, 1,
-0.8556351, -0.1536988, -1.240249, 1, 1, 1, 1, 1,
-0.8532841, 0.2812996, -1.003996, 1, 1, 1, 1, 1,
-0.852398, -0.9752852, -0.4053898, 1, 1, 1, 1, 1,
-0.8473738, -3.299812, -3.363875, 1, 1, 1, 1, 1,
-0.8459223, 0.7742178, -0.04676628, 1, 1, 1, 1, 1,
-0.842681, -0.6039898, -4.062408, 1, 1, 1, 1, 1,
-0.8387663, -0.2387367, -0.8510299, 1, 1, 1, 1, 1,
-0.8385272, 0.7381625, -1.625288, 1, 1, 1, 1, 1,
-0.8349962, 1.444708, -1.171572, 1, 1, 1, 1, 1,
-0.8286554, -0.6845067, -2.93427, 1, 1, 1, 1, 1,
-0.8274946, 0.5350009, -1.442582, 1, 1, 1, 1, 1,
-0.8180297, 0.371292, -2.24726, 1, 1, 1, 1, 1,
-0.8156145, 0.1419777, 0.2138939, 0, 0, 1, 1, 1,
-0.8105951, 0.8150897, -1.303659, 1, 0, 0, 1, 1,
-0.8086298, 1.398159, -1.59647, 1, 0, 0, 1, 1,
-0.8078421, 0.3038605, 0.1678699, 1, 0, 0, 1, 1,
-0.8031799, -0.5535272, -1.801429, 1, 0, 0, 1, 1,
-0.8024483, -0.7660854, 0.8033666, 1, 0, 0, 1, 1,
-0.7857173, 0.7868629, -1.129855, 0, 0, 0, 1, 1,
-0.7828552, -1.397905, -1.292179, 0, 0, 0, 1, 1,
-0.7822789, -0.262404, -2.780057, 0, 0, 0, 1, 1,
-0.7791424, 0.3582421, -0.4451787, 0, 0, 0, 1, 1,
-0.7766196, 0.9144394, -0.1891112, 0, 0, 0, 1, 1,
-0.7763626, 1.490653, -1.218741, 0, 0, 0, 1, 1,
-0.7744524, -0.508041, -1.262709, 0, 0, 0, 1, 1,
-0.7735997, -1.45034, -2.699213, 1, 1, 1, 1, 1,
-0.7735093, -1.064258, -3.247753, 1, 1, 1, 1, 1,
-0.7733155, 1.225983, -0.1565545, 1, 1, 1, 1, 1,
-0.7663692, -0.7943103, -0.4396583, 1, 1, 1, 1, 1,
-0.7545323, -0.2308528, -2.388522, 1, 1, 1, 1, 1,
-0.7527913, 1.043748, -1.230709, 1, 1, 1, 1, 1,
-0.7527779, 1.199975, 1.140814, 1, 1, 1, 1, 1,
-0.7504449, -2.390347, -1.93884, 1, 1, 1, 1, 1,
-0.7465848, 0.4105944, -0.5051349, 1, 1, 1, 1, 1,
-0.743229, -1.455823, -1.929608, 1, 1, 1, 1, 1,
-0.7420511, 0.1231617, -2.449358, 1, 1, 1, 1, 1,
-0.7380139, 0.6908052, 0.4840333, 1, 1, 1, 1, 1,
-0.7376468, 1.736004, -1.51957, 1, 1, 1, 1, 1,
-0.7361322, 2.689285, -1.313328, 1, 1, 1, 1, 1,
-0.7284853, 0.3685108, -1.006561, 1, 1, 1, 1, 1,
-0.7277078, -0.1076828, -1.515707, 0, 0, 1, 1, 1,
-0.7272897, -1.039579, -3.341477, 1, 0, 0, 1, 1,
-0.7232251, -0.4454849, -0.5084977, 1, 0, 0, 1, 1,
-0.7207289, 1.691911, -0.4652156, 1, 0, 0, 1, 1,
-0.7203888, 0.1334257, -1.226361, 1, 0, 0, 1, 1,
-0.7169369, -0.9222854, -2.865658, 1, 0, 0, 1, 1,
-0.7154212, 0.6573504, -0.1907742, 0, 0, 0, 1, 1,
-0.7153052, 2.306968, -0.06249583, 0, 0, 0, 1, 1,
-0.7148079, 1.582597, -0.464457, 0, 0, 0, 1, 1,
-0.7128955, 0.01034982, -0.9426362, 0, 0, 0, 1, 1,
-0.7111921, 0.9079655, -2.535378, 0, 0, 0, 1, 1,
-0.7111082, 0.3152848, -1.300077, 0, 0, 0, 1, 1,
-0.7091057, 1.196134, -0.7447443, 0, 0, 0, 1, 1,
-0.7089238, -1.023566, -2.117824, 1, 1, 1, 1, 1,
-0.7073654, -0.09345323, -2.184049, 1, 1, 1, 1, 1,
-0.7040699, -1.819725, -3.273636, 1, 1, 1, 1, 1,
-0.7031662, 0.662971, -0.3214471, 1, 1, 1, 1, 1,
-0.6840152, -1.412006, -4.03788, 1, 1, 1, 1, 1,
-0.6837751, 2.347968, 0.2392927, 1, 1, 1, 1, 1,
-0.6819462, 1.200014, 0.3464257, 1, 1, 1, 1, 1,
-0.6791207, 0.667512, -1.018828, 1, 1, 1, 1, 1,
-0.6769641, 0.6655058, 0.2581259, 1, 1, 1, 1, 1,
-0.6748353, 0.007317916, -0.9308098, 1, 1, 1, 1, 1,
-0.6744377, -1.800011, -3.838189, 1, 1, 1, 1, 1,
-0.6719322, -1.337441, -1.884601, 1, 1, 1, 1, 1,
-0.6639478, 0.02524456, -1.709435, 1, 1, 1, 1, 1,
-0.662469, 0.6796212, -0.04147058, 1, 1, 1, 1, 1,
-0.661739, 1.141096, -0.540915, 1, 1, 1, 1, 1,
-0.6595597, 2.424523, 1.344744, 0, 0, 1, 1, 1,
-0.657565, 0.0222121, -2.175968, 1, 0, 0, 1, 1,
-0.6521686, 1.319046, 0.7877315, 1, 0, 0, 1, 1,
-0.6507776, 0.07553268, -3.300519, 1, 0, 0, 1, 1,
-0.6485609, 0.6507678, -1.156244, 1, 0, 0, 1, 1,
-0.6464298, 1.230353, -0.624123, 1, 0, 0, 1, 1,
-0.6435364, -0.2097097, -1.188695, 0, 0, 0, 1, 1,
-0.6408558, -1.517001, -0.5628948, 0, 0, 0, 1, 1,
-0.6368678, -1.865964, -2.225973, 0, 0, 0, 1, 1,
-0.630744, -0.2107461, -2.003362, 0, 0, 0, 1, 1,
-0.6277536, 0.4858951, -0.4246755, 0, 0, 0, 1, 1,
-0.6262116, 0.37794, 0.05516181, 0, 0, 0, 1, 1,
-0.6243458, -1.017999, -2.358358, 0, 0, 0, 1, 1,
-0.6196756, 0.9452733, 0.1712507, 1, 1, 1, 1, 1,
-0.6128704, -0.7501982, -0.6435071, 1, 1, 1, 1, 1,
-0.6124418, -0.2061908, -2.061301, 1, 1, 1, 1, 1,
-0.5997708, 0.8406727, -0.2589819, 1, 1, 1, 1, 1,
-0.5978677, -0.6542076, -1.966092, 1, 1, 1, 1, 1,
-0.5965727, 0.4156684, -2.801476, 1, 1, 1, 1, 1,
-0.5930223, -0.251086, -1.653861, 1, 1, 1, 1, 1,
-0.5925783, 0.5858723, -0.1317898, 1, 1, 1, 1, 1,
-0.5923355, 0.2034153, -1.516844, 1, 1, 1, 1, 1,
-0.5890808, 0.3925182, -0.7164289, 1, 1, 1, 1, 1,
-0.588627, -1.841177, -4.126717, 1, 1, 1, 1, 1,
-0.5861751, 0.7852466, -1.113494, 1, 1, 1, 1, 1,
-0.5836085, 1.570013, -0.002347767, 1, 1, 1, 1, 1,
-0.5755539, -0.2290795, -1.677734, 1, 1, 1, 1, 1,
-0.575542, -0.2669826, -2.077628, 1, 1, 1, 1, 1,
-0.5753232, 0.7140227, -1.610367, 0, 0, 1, 1, 1,
-0.5745807, -0.4971491, -2.078063, 1, 0, 0, 1, 1,
-0.5743253, 0.05770129, -2.846776, 1, 0, 0, 1, 1,
-0.5738601, 0.733982, -1.172598, 1, 0, 0, 1, 1,
-0.5732138, -0.4331771, -1.172152, 1, 0, 0, 1, 1,
-0.5718892, 0.3197945, -2.167047, 1, 0, 0, 1, 1,
-0.5686083, 0.9704528, -0.5120953, 0, 0, 0, 1, 1,
-0.5683692, -1.825659, -2.806727, 0, 0, 0, 1, 1,
-0.5670261, -0.4768078, -2.082162, 0, 0, 0, 1, 1,
-0.5620206, 0.9689204, -1.060447, 0, 0, 0, 1, 1,
-0.559175, 0.1209051, -1.297031, 0, 0, 0, 1, 1,
-0.5570744, -0.1912829, -2.62285, 0, 0, 0, 1, 1,
-0.5508782, -0.1849275, -2.043843, 0, 0, 0, 1, 1,
-0.5497627, 1.141258, 0.2205217, 1, 1, 1, 1, 1,
-0.5484839, -1.28278, -0.3689716, 1, 1, 1, 1, 1,
-0.5461822, -0.2479905, -2.39539, 1, 1, 1, 1, 1,
-0.5346243, 1.043103, -0.1967537, 1, 1, 1, 1, 1,
-0.5302206, 0.9093806, -1.903194, 1, 1, 1, 1, 1,
-0.529431, 1.562506, -1.005119, 1, 1, 1, 1, 1,
-0.5261961, -1.288873, -1.717843, 1, 1, 1, 1, 1,
-0.5246872, 1.492077, -0.3256932, 1, 1, 1, 1, 1,
-0.5222237, 0.7384033, -2.589959, 1, 1, 1, 1, 1,
-0.5175576, -0.07180995, 0.08506064, 1, 1, 1, 1, 1,
-0.5147995, -0.1333145, -1.570423, 1, 1, 1, 1, 1,
-0.5144951, 0.412934, 0.1207352, 1, 1, 1, 1, 1,
-0.5135245, 0.8693188, -1.280752, 1, 1, 1, 1, 1,
-0.5115028, 0.7124448, 0.9647186, 1, 1, 1, 1, 1,
-0.5092829, -0.7740788, -0.436809, 1, 1, 1, 1, 1,
-0.5078549, 0.7292472, -1.649742, 0, 0, 1, 1, 1,
-0.5032669, -1.56877, -2.14565, 1, 0, 0, 1, 1,
-0.4966258, -1.196745, -3.575933, 1, 0, 0, 1, 1,
-0.4956423, -1.221243, -2.732992, 1, 0, 0, 1, 1,
-0.4933003, 0.412418, 0.5409003, 1, 0, 0, 1, 1,
-0.4892716, 0.06677912, -1.878408, 1, 0, 0, 1, 1,
-0.4849004, -1.185576, -2.351475, 0, 0, 0, 1, 1,
-0.4812058, -0.5022838, -0.5067744, 0, 0, 0, 1, 1,
-0.4714698, -0.5588449, -2.608591, 0, 0, 0, 1, 1,
-0.4705477, 0.3423976, -1.580717, 0, 0, 0, 1, 1,
-0.4651328, 0.489915, 0.08108439, 0, 0, 0, 1, 1,
-0.4609669, -0.8670529, -3.127459, 0, 0, 0, 1, 1,
-0.4596307, -0.6993271, -3.399108, 0, 0, 0, 1, 1,
-0.4578453, -1.179338, -2.829967, 1, 1, 1, 1, 1,
-0.4502646, 0.4518768, -1.781658, 1, 1, 1, 1, 1,
-0.4488125, 0.4882555, -0.4417126, 1, 1, 1, 1, 1,
-0.4480944, 1.465499, 0.1397078, 1, 1, 1, 1, 1,
-0.4439417, -3.043432, -1.03683, 1, 1, 1, 1, 1,
-0.439118, -0.1793392, -1.422979, 1, 1, 1, 1, 1,
-0.4325503, 1.839641, -0.3776442, 1, 1, 1, 1, 1,
-0.4317983, 0.8692417, -0.5969038, 1, 1, 1, 1, 1,
-0.4285055, 1.039078, 1.376627, 1, 1, 1, 1, 1,
-0.4248047, 1.464037, 0.1084303, 1, 1, 1, 1, 1,
-0.4243018, 0.1875547, -2.471687, 1, 1, 1, 1, 1,
-0.422125, -0.06490261, -2.685639, 1, 1, 1, 1, 1,
-0.4196064, 0.4955604, 0.06228926, 1, 1, 1, 1, 1,
-0.416809, 0.9526387, -0.8404886, 1, 1, 1, 1, 1,
-0.4137098, -1.288857, -3.671339, 1, 1, 1, 1, 1,
-0.4080112, 0.6631199, -1.641541, 0, 0, 1, 1, 1,
-0.4048985, -1.077248, -2.620195, 1, 0, 0, 1, 1,
-0.4015062, -0.2573785, -1.923166, 1, 0, 0, 1, 1,
-0.3965614, 0.4290507, -1.130342, 1, 0, 0, 1, 1,
-0.3955642, -0.1408214, -2.337984, 1, 0, 0, 1, 1,
-0.3933727, 0.2527678, -2.338226, 1, 0, 0, 1, 1,
-0.3892702, 0.5928598, -1.219071, 0, 0, 0, 1, 1,
-0.3880081, -0.6839126, -1.987754, 0, 0, 0, 1, 1,
-0.3867014, -1.909414, -3.04759, 0, 0, 0, 1, 1,
-0.3862708, -0.7932031, -3.493209, 0, 0, 0, 1, 1,
-0.3787998, 0.03553286, -1.08679, 0, 0, 0, 1, 1,
-0.3747516, -0.9867613, -0.3744093, 0, 0, 0, 1, 1,
-0.3727803, -0.08439225, -2.270494, 0, 0, 0, 1, 1,
-0.370397, -1.332641, -3.799557, 1, 1, 1, 1, 1,
-0.3675845, -0.297005, -2.148456, 1, 1, 1, 1, 1,
-0.3673913, 0.5104041, 1.685169, 1, 1, 1, 1, 1,
-0.3611689, -2.188666, -4.516688, 1, 1, 1, 1, 1,
-0.3579111, -2.293297, -3.528399, 1, 1, 1, 1, 1,
-0.3570137, -1.727815, -2.930014, 1, 1, 1, 1, 1,
-0.3554544, -0.5237192, -2.570296, 1, 1, 1, 1, 1,
-0.3533463, 0.4133626, -0.1577954, 1, 1, 1, 1, 1,
-0.3499731, -0.8412592, -4.856027, 1, 1, 1, 1, 1,
-0.3499625, 2.562574, -1.934355, 1, 1, 1, 1, 1,
-0.3488216, -0.1674548, -2.160689, 1, 1, 1, 1, 1,
-0.3412609, -0.3212147, -2.876805, 1, 1, 1, 1, 1,
-0.3411374, 1.145429, -1.057372, 1, 1, 1, 1, 1,
-0.3403914, -2.097063, -3.662499, 1, 1, 1, 1, 1,
-0.3389501, -0.1140128, -3.066216, 1, 1, 1, 1, 1,
-0.3340083, 0.3060816, -0.6941035, 0, 0, 1, 1, 1,
-0.3292867, 0.8562405, -0.304002, 1, 0, 0, 1, 1,
-0.3221398, -0.03786174, -0.6684204, 1, 0, 0, 1, 1,
-0.3188897, -0.01198543, -1.653742, 1, 0, 0, 1, 1,
-0.3183155, -0.4265185, -0.5415246, 1, 0, 0, 1, 1,
-0.3145144, -0.629857, -3.657626, 1, 0, 0, 1, 1,
-0.3140695, -0.1793476, -1.052398, 0, 0, 0, 1, 1,
-0.3116459, -0.07125558, -2.237616, 0, 0, 0, 1, 1,
-0.3111541, 0.350121, -0.4898088, 0, 0, 0, 1, 1,
-0.3105998, -0.760687, -1.070261, 0, 0, 0, 1, 1,
-0.3099575, 0.04853915, -2.046752, 0, 0, 0, 1, 1,
-0.3060791, 0.996253, -0.1578594, 0, 0, 0, 1, 1,
-0.3058933, -0.08359953, -2.684145, 0, 0, 0, 1, 1,
-0.3036622, -1.842495, -2.075906, 1, 1, 1, 1, 1,
-0.303519, 0.7596591, -0.6022287, 1, 1, 1, 1, 1,
-0.3031819, -1.049418, -2.39481, 1, 1, 1, 1, 1,
-0.3011605, -0.3729009, -1.22488, 1, 1, 1, 1, 1,
-0.2997737, -0.6977488, -3.761306, 1, 1, 1, 1, 1,
-0.2970982, 0.3173956, 0.3674046, 1, 1, 1, 1, 1,
-0.2921964, -2.278302, -3.555662, 1, 1, 1, 1, 1,
-0.2915266, -1.387575, -4.101556, 1, 1, 1, 1, 1,
-0.2912645, -0.3879576, -2.635597, 1, 1, 1, 1, 1,
-0.2906841, -0.1665795, -0.4161509, 1, 1, 1, 1, 1,
-0.2884551, 1.0017, 0.08734627, 1, 1, 1, 1, 1,
-0.2856002, -0.7161735, -4.037094, 1, 1, 1, 1, 1,
-0.2778389, 0.4987735, -1.501499, 1, 1, 1, 1, 1,
-0.2771467, 0.6675965, -0.6724172, 1, 1, 1, 1, 1,
-0.2769507, -0.4062447, -1.147331, 1, 1, 1, 1, 1,
-0.276605, 1.219929, -0.1714168, 0, 0, 1, 1, 1,
-0.2756902, -0.7243766, -2.633967, 1, 0, 0, 1, 1,
-0.2710431, 0.4098801, 0.6501683, 1, 0, 0, 1, 1,
-0.2707462, -1.550415, -2.402814, 1, 0, 0, 1, 1,
-0.2699656, -2.100075, -3.081096, 1, 0, 0, 1, 1,
-0.2697945, 0.5475323, -1.302674, 1, 0, 0, 1, 1,
-0.2668541, -0.8774776, -2.346507, 0, 0, 0, 1, 1,
-0.2629942, -1.817314, -2.523379, 0, 0, 0, 1, 1,
-0.2550517, 0.5227047, -0.9157357, 0, 0, 0, 1, 1,
-0.2494055, 0.871391, -0.4070314, 0, 0, 0, 1, 1,
-0.2470123, -0.2780346, -4.44581, 0, 0, 0, 1, 1,
-0.2417464, -0.380987, -2.154994, 0, 0, 0, 1, 1,
-0.24105, 1.311453, -1.073672, 0, 0, 0, 1, 1,
-0.2403955, 1.471007, -2.026561, 1, 1, 1, 1, 1,
-0.2401741, 0.3224382, -0.1190706, 1, 1, 1, 1, 1,
-0.2395573, -2.408333, -4.531791, 1, 1, 1, 1, 1,
-0.2358129, 2.683463, -1.64682, 1, 1, 1, 1, 1,
-0.2238614, 0.3967074, -0.8621676, 1, 1, 1, 1, 1,
-0.2207887, -0.8325812, -3.806233, 1, 1, 1, 1, 1,
-0.2181615, -0.4345925, -1.800169, 1, 1, 1, 1, 1,
-0.213956, -0.9573612, -3.260396, 1, 1, 1, 1, 1,
-0.2071476, -0.02642338, -1.976088, 1, 1, 1, 1, 1,
-0.2021524, -1.368846, -3.562927, 1, 1, 1, 1, 1,
-0.1949444, 0.2275068, -1.930565, 1, 1, 1, 1, 1,
-0.1937879, 2.175199, -1.663575, 1, 1, 1, 1, 1,
-0.1933783, -0.2335138, -2.077993, 1, 1, 1, 1, 1,
-0.1896337, 0.496423, -0.6574205, 1, 1, 1, 1, 1,
-0.1878739, 1.441981, 0.2016184, 1, 1, 1, 1, 1,
-0.1845487, -1.602588, -3.930786, 0, 0, 1, 1, 1,
-0.183712, -0.3647543, -2.36346, 1, 0, 0, 1, 1,
-0.1821116, -0.6465114, -3.012905, 1, 0, 0, 1, 1,
-0.1784116, -0.01720121, -1.381703, 1, 0, 0, 1, 1,
-0.178201, -0.6826936, -2.224202, 1, 0, 0, 1, 1,
-0.174854, 1.212288, 0.3013876, 1, 0, 0, 1, 1,
-0.1683707, 0.1928613, 0.06744564, 0, 0, 0, 1, 1,
-0.1649615, -0.7511753, -3.110168, 0, 0, 0, 1, 1,
-0.1649131, -0.2717059, -0.8423907, 0, 0, 0, 1, 1,
-0.1630504, -0.2729419, -3.960479, 0, 0, 0, 1, 1,
-0.1629287, 0.4279411, -0.06389068, 0, 0, 0, 1, 1,
-0.1563134, -0.1123708, -2.769161, 0, 0, 0, 1, 1,
-0.1547852, 0.8005032, 1.28433, 0, 0, 0, 1, 1,
-0.1530667, 0.02967828, -1.644482, 1, 1, 1, 1, 1,
-0.1525026, -1.361245, -2.190341, 1, 1, 1, 1, 1,
-0.1522834, -0.0341349, -3.458242, 1, 1, 1, 1, 1,
-0.1499338, -1.099974, -3.631052, 1, 1, 1, 1, 1,
-0.1446912, 0.3475112, -0.1675124, 1, 1, 1, 1, 1,
-0.1446082, 0.2158154, 0.8183085, 1, 1, 1, 1, 1,
-0.1426429, 0.3828764, -2.573565, 1, 1, 1, 1, 1,
-0.1292567, -0.08313165, -2.690085, 1, 1, 1, 1, 1,
-0.1275567, -1.11727, -3.344795, 1, 1, 1, 1, 1,
-0.1224834, -1.440314, -3.276176, 1, 1, 1, 1, 1,
-0.1219196, 1.050943, -0.02574584, 1, 1, 1, 1, 1,
-0.1195555, -1.989009, -3.187891, 1, 1, 1, 1, 1,
-0.1147586, 0.1120354, -2.16275, 1, 1, 1, 1, 1,
-0.1103325, -0.4878301, -3.862501, 1, 1, 1, 1, 1,
-0.1088353, -0.6588897, -3.745145, 1, 1, 1, 1, 1,
-0.108441, -0.286005, -2.056943, 0, 0, 1, 1, 1,
-0.1080247, 1.759444, -0.8013505, 1, 0, 0, 1, 1,
-0.1052584, -0.2446678, -2.480741, 1, 0, 0, 1, 1,
-0.09948891, -0.1791131, -4.922315, 1, 0, 0, 1, 1,
-0.09939671, 0.828584, -0.7881173, 1, 0, 0, 1, 1,
-0.09725041, -0.9518564, -1.447274, 1, 0, 0, 1, 1,
-0.09554175, 0.9493363, -1.219349, 0, 0, 0, 1, 1,
-0.09487496, 1.034875, 0.5436782, 0, 0, 0, 1, 1,
-0.09331582, 0.04109119, -2.193117, 0, 0, 0, 1, 1,
-0.09096078, 1.263708, 0.4233199, 0, 0, 0, 1, 1,
-0.08798999, -0.2597212, -3.653205, 0, 0, 0, 1, 1,
-0.08739022, 0.02461214, -0.1825304, 0, 0, 0, 1, 1,
-0.08662033, 0.608776, -0.4982726, 0, 0, 0, 1, 1,
-0.08518075, -0.8869331, -1.462582, 1, 1, 1, 1, 1,
-0.08429784, 0.705745, -1.000336, 1, 1, 1, 1, 1,
-0.0827998, -0.1660778, -4.278848, 1, 1, 1, 1, 1,
-0.07831293, -0.8091297, -4.933386, 1, 1, 1, 1, 1,
-0.07750651, 1.407495, 2.201625, 1, 1, 1, 1, 1,
-0.07626181, -0.7048685, -3.86108, 1, 1, 1, 1, 1,
-0.07274918, 1.489016, 0.552701, 1, 1, 1, 1, 1,
-0.07075515, -1.392723, -3.626488, 1, 1, 1, 1, 1,
-0.07057412, 0.8754615, -2.015626, 1, 1, 1, 1, 1,
-0.0682362, -0.7242389, -2.529656, 1, 1, 1, 1, 1,
-0.06637397, -0.1322354, -2.468554, 1, 1, 1, 1, 1,
-0.06407699, 0.4921074, -1.005602, 1, 1, 1, 1, 1,
-0.06302277, -2.420407, -2.132525, 1, 1, 1, 1, 1,
-0.06092285, -0.2456999, -3.741274, 1, 1, 1, 1, 1,
-0.05984399, -0.9570119, -3.936831, 1, 1, 1, 1, 1,
-0.05339163, 0.3993187, 0.276366, 0, 0, 1, 1, 1,
-0.04962128, -0.6130128, -2.535671, 1, 0, 0, 1, 1,
-0.0471367, -1.022185, -1.267231, 1, 0, 0, 1, 1,
-0.04376043, 1.260296, 0.4474744, 1, 0, 0, 1, 1,
-0.04271637, 0.3591711, 1.127358, 1, 0, 0, 1, 1,
-0.04269921, 1.541099, -1.016481, 1, 0, 0, 1, 1,
-0.04178166, 1.310285, -0.146987, 0, 0, 0, 1, 1,
-0.03987024, -1.019127, -2.988999, 0, 0, 0, 1, 1,
-0.03380384, 0.0506771, -1.839709, 0, 0, 0, 1, 1,
-0.03327762, 0.1064114, -0.02661758, 0, 0, 0, 1, 1,
-0.03236355, 0.7981773, -0.309795, 0, 0, 0, 1, 1,
-0.03217255, 1.805209, 0.0373945, 0, 0, 0, 1, 1,
-0.03209136, -0.351773, -2.741252, 0, 0, 0, 1, 1,
-0.03198666, -1.426535, -3.421239, 1, 1, 1, 1, 1,
-0.03133952, -0.107666, -3.426343, 1, 1, 1, 1, 1,
-0.03007368, 0.9222814, 0.308181, 1, 1, 1, 1, 1,
-0.02270538, -0.9710918, -3.618833, 1, 1, 1, 1, 1,
-0.02072459, -0.446539, -3.432628, 1, 1, 1, 1, 1,
-0.02008835, 1.165319, -1.610205, 1, 1, 1, 1, 1,
-0.01608321, 0.2576869, 1.101314, 1, 1, 1, 1, 1,
-0.013651, -0.509836, -4.045139, 1, 1, 1, 1, 1,
-0.01004446, -0.2487342, -1.962321, 1, 1, 1, 1, 1,
-0.008485811, 0.1850204, 0.2133255, 1, 1, 1, 1, 1,
-0.006429108, 0.3505773, 0.03423936, 1, 1, 1, 1, 1,
-0.003451567, 0.50602, 0.1820317, 1, 1, 1, 1, 1,
0.0003901212, -0.2600928, 2.139071, 1, 1, 1, 1, 1,
0.003270408, 0.5945792, -0.07129614, 1, 1, 1, 1, 1,
0.003777973, -1.221511, 4.690944, 1, 1, 1, 1, 1,
0.008137887, -0.5568936, 2.461555, 0, 0, 1, 1, 1,
0.01115091, -0.6297997, 3.306735, 1, 0, 0, 1, 1,
0.01248386, -1.313892, 5.713897, 1, 0, 0, 1, 1,
0.01891895, 1.629877, -0.1676241, 1, 0, 0, 1, 1,
0.02044025, 0.7892766, 1.480113, 1, 0, 0, 1, 1,
0.02090928, -0.5898774, 2.699565, 1, 0, 0, 1, 1,
0.0231853, 2.335201, 1.93119, 0, 0, 0, 1, 1,
0.0235165, -2.33022, 4.07422, 0, 0, 0, 1, 1,
0.02944444, -0.7593375, 1.812679, 0, 0, 0, 1, 1,
0.03037638, 0.09248541, 0.8737659, 0, 0, 0, 1, 1,
0.03154951, -0.6018203, 3.598267, 0, 0, 0, 1, 1,
0.03306251, 0.7625769, -0.617699, 0, 0, 0, 1, 1,
0.03481574, -0.501412, 2.566581, 0, 0, 0, 1, 1,
0.03934248, -1.014014, 3.084233, 1, 1, 1, 1, 1,
0.04348359, -0.5134022, 3.165748, 1, 1, 1, 1, 1,
0.04611358, 0.7417161, 1.212768, 1, 1, 1, 1, 1,
0.04849715, 0.1887251, -0.6570122, 1, 1, 1, 1, 1,
0.05015216, -0.333047, 4.935544, 1, 1, 1, 1, 1,
0.05052919, 1.008005, 1.354318, 1, 1, 1, 1, 1,
0.05234563, -1.27345, 2.310696, 1, 1, 1, 1, 1,
0.05673749, 0.8485236, 0.4533491, 1, 1, 1, 1, 1,
0.05875237, -1.619732, 3.105122, 1, 1, 1, 1, 1,
0.06176862, -0.05955548, 3.433752, 1, 1, 1, 1, 1,
0.0619871, 0.7505817, -1.178529, 1, 1, 1, 1, 1,
0.06226934, -0.1250025, 0.9794481, 1, 1, 1, 1, 1,
0.06370207, 0.6417916, -0.6475881, 1, 1, 1, 1, 1,
0.06449172, -0.9349812, 1.919023, 1, 1, 1, 1, 1,
0.06554131, 1.929326, -0.106158, 1, 1, 1, 1, 1,
0.06911953, 1.751534, -1.261448, 0, 0, 1, 1, 1,
0.0706296, -1.129163, 4.478014, 1, 0, 0, 1, 1,
0.07287062, -0.3637358, 3.226203, 1, 0, 0, 1, 1,
0.07313498, -0.907558, 1.613561, 1, 0, 0, 1, 1,
0.07434663, -0.5740153, 2.510901, 1, 0, 0, 1, 1,
0.07742608, -0.2964188, 2.232185, 1, 0, 0, 1, 1,
0.07837519, -0.2364022, 2.696077, 0, 0, 0, 1, 1,
0.08060478, 1.216991, -1.067491, 0, 0, 0, 1, 1,
0.08075042, -0.5233794, 3.143553, 0, 0, 0, 1, 1,
0.08254366, 1.127495, 0.7514372, 0, 0, 0, 1, 1,
0.08275908, 0.2598186, 0.5201833, 0, 0, 0, 1, 1,
0.08573041, 0.897206, 0.9669047, 0, 0, 0, 1, 1,
0.09403021, -0.2276028, 2.965121, 0, 0, 0, 1, 1,
0.09482425, -0.543485, 2.049358, 1, 1, 1, 1, 1,
0.0952277, 0.2276309, 2.321659, 1, 1, 1, 1, 1,
0.09613843, 0.2888833, 2.430896, 1, 1, 1, 1, 1,
0.09697324, 0.3254197, 0.678112, 1, 1, 1, 1, 1,
0.09947153, -0.7721149, 2.389838, 1, 1, 1, 1, 1,
0.1003598, 0.4531691, 1.038613, 1, 1, 1, 1, 1,
0.1023358, 0.5844027, -1.190467, 1, 1, 1, 1, 1,
0.1041278, 0.1679341, 0.7897488, 1, 1, 1, 1, 1,
0.1094037, -0.0531157, 3.356349, 1, 1, 1, 1, 1,
0.1111775, 0.3644876, -0.7140076, 1, 1, 1, 1, 1,
0.1112304, 0.9032651, -2.400901, 1, 1, 1, 1, 1,
0.1125812, 0.01936324, 1.641649, 1, 1, 1, 1, 1,
0.1125972, -0.2216368, 2.394031, 1, 1, 1, 1, 1,
0.114144, -0.2277423, 3.882845, 1, 1, 1, 1, 1,
0.1153448, 1.559155, -0.740827, 1, 1, 1, 1, 1,
0.1209054, 0.6563994, -0.473421, 0, 0, 1, 1, 1,
0.1288198, 1.234273, 1.698706, 1, 0, 0, 1, 1,
0.1290566, -0.2732506, 1.525647, 1, 0, 0, 1, 1,
0.129478, 2.975105, -0.2741777, 1, 0, 0, 1, 1,
0.1320094, -0.4211665, 2.325663, 1, 0, 0, 1, 1,
0.1376285, -0.1731452, 2.696405, 1, 0, 0, 1, 1,
0.1394796, 0.03474449, 0.79419, 0, 0, 0, 1, 1,
0.1409384, -0.9582599, 2.814976, 0, 0, 0, 1, 1,
0.1417755, -1.922131, 3.066861, 0, 0, 0, 1, 1,
0.1435892, 1.237416, 0.332543, 0, 0, 0, 1, 1,
0.1470445, 0.702711, 0.892518, 0, 0, 0, 1, 1,
0.1475909, 1.031126, 1.6696, 0, 0, 0, 1, 1,
0.153993, 0.8149312, 1.081802, 0, 0, 0, 1, 1,
0.1573764, 0.1259473, 1.011681, 1, 1, 1, 1, 1,
0.1594819, 0.8556178, -0.8119211, 1, 1, 1, 1, 1,
0.1612418, 0.3814443, 0.5471141, 1, 1, 1, 1, 1,
0.1674142, 0.7644153, 1.188439, 1, 1, 1, 1, 1,
0.1704562, 0.4458214, 0.003079864, 1, 1, 1, 1, 1,
0.1763748, -0.09820805, 2.476426, 1, 1, 1, 1, 1,
0.1763839, 1.747305, 0.4833457, 1, 1, 1, 1, 1,
0.1776524, -0.06320754, 1.938853, 1, 1, 1, 1, 1,
0.177713, 0.1198043, -0.1136259, 1, 1, 1, 1, 1,
0.1780162, -0.2030039, 1.446054, 1, 1, 1, 1, 1,
0.185653, 0.5903419, -0.2167965, 1, 1, 1, 1, 1,
0.1871606, 0.2752577, 1.945859, 1, 1, 1, 1, 1,
0.1896406, 1.452674, 0.1033439, 1, 1, 1, 1, 1,
0.1918083, 1.103551, -0.5116377, 1, 1, 1, 1, 1,
0.1937949, -1.773312, 2.602556, 1, 1, 1, 1, 1,
0.1957332, 0.327415, -1.326958, 0, 0, 1, 1, 1,
0.1978953, -2.215393, 2.128721, 1, 0, 0, 1, 1,
0.200874, -0.6816084, 5.087135, 1, 0, 0, 1, 1,
0.2060917, -0.2994069, 2.394384, 1, 0, 0, 1, 1,
0.2089669, -1.37816, 2.858351, 1, 0, 0, 1, 1,
0.2111187, -1.445045, 2.344365, 1, 0, 0, 1, 1,
0.2119811, 1.560528, 0.9790927, 0, 0, 0, 1, 1,
0.2141267, 0.2949443, 0.05120071, 0, 0, 0, 1, 1,
0.2214228, -0.1383269, 2.468643, 0, 0, 0, 1, 1,
0.2233148, 0.2014462, 0.5480555, 0, 0, 0, 1, 1,
0.2246154, -1.182446, 2.161238, 0, 0, 0, 1, 1,
0.2264878, -1.379841, 4.560976, 0, 0, 0, 1, 1,
0.2293971, -1.705299, 1.887157, 0, 0, 0, 1, 1,
0.2396002, 0.129018, -0.4135808, 1, 1, 1, 1, 1,
0.2400426, 0.8473026, -2.095347, 1, 1, 1, 1, 1,
0.2426191, -0.7082381, 3.139975, 1, 1, 1, 1, 1,
0.2444669, 0.8565974, -0.9749859, 1, 1, 1, 1, 1,
0.2473254, -0.07997693, -1.063067, 1, 1, 1, 1, 1,
0.250874, -0.6352868, 3.91905, 1, 1, 1, 1, 1,
0.2510508, -0.7192943, 2.455086, 1, 1, 1, 1, 1,
0.2533444, -0.05167776, 4.573655, 1, 1, 1, 1, 1,
0.2557423, -1.516782, 2.77373, 1, 1, 1, 1, 1,
0.2569247, 0.4552009, 0.7648963, 1, 1, 1, 1, 1,
0.2577374, -0.2597397, 2.908737, 1, 1, 1, 1, 1,
0.2593563, -1.077558, 4.003497, 1, 1, 1, 1, 1,
0.2619595, 0.8253449, 1.414014, 1, 1, 1, 1, 1,
0.2621458, -0.8050891, 2.69956, 1, 1, 1, 1, 1,
0.2640734, 2.745024, 1.292912, 1, 1, 1, 1, 1,
0.2646576, -0.5053779, 2.20482, 0, 0, 1, 1, 1,
0.2683704, -0.8613335, 1.48086, 1, 0, 0, 1, 1,
0.2747582, 0.04061572, 1.484669, 1, 0, 0, 1, 1,
0.2765651, -0.01901715, 0.7479753, 1, 0, 0, 1, 1,
0.2802026, -1.731276, 3.379809, 1, 0, 0, 1, 1,
0.2816592, 0.8432791, 0.420395, 1, 0, 0, 1, 1,
0.2819185, -0.08659312, 1.149226, 0, 0, 0, 1, 1,
0.289315, 0.1494274, 1.160254, 0, 0, 0, 1, 1,
0.2998125, 1.77194, 0.160039, 0, 0, 0, 1, 1,
0.3008948, 0.3391855, -0.03358758, 0, 0, 0, 1, 1,
0.3041213, -0.5980454, 2.077417, 0, 0, 0, 1, 1,
0.3069921, -0.2850211, 2.742352, 0, 0, 0, 1, 1,
0.3112839, 0.4680185, 1.764486, 0, 0, 0, 1, 1,
0.3144183, -0.8450238, 2.199692, 1, 1, 1, 1, 1,
0.3191291, 0.9745617, -0.2350334, 1, 1, 1, 1, 1,
0.3192888, -0.4656014, 2.951258, 1, 1, 1, 1, 1,
0.3219093, -1.154195, 2.425523, 1, 1, 1, 1, 1,
0.3222501, 0.3436722, -0.02268769, 1, 1, 1, 1, 1,
0.328712, -0.855078, 3.910084, 1, 1, 1, 1, 1,
0.3313065, 0.1505137, 1.083951, 1, 1, 1, 1, 1,
0.3381431, -1.106481, 4.154611, 1, 1, 1, 1, 1,
0.345085, 0.6485101, 1.170968, 1, 1, 1, 1, 1,
0.3454029, 1.125942, 0.2678079, 1, 1, 1, 1, 1,
0.353823, 0.690009, -0.0271486, 1, 1, 1, 1, 1,
0.3548364, -0.5213757, 1.724307, 1, 1, 1, 1, 1,
0.3550264, 1.196734, -1.229782, 1, 1, 1, 1, 1,
0.3590319, -2.018802, 2.763748, 1, 1, 1, 1, 1,
0.3636088, -0.1968171, 2.984589, 1, 1, 1, 1, 1,
0.3675644, 1.47324, -0.1667481, 0, 0, 1, 1, 1,
0.3711014, 0.02746466, 0.9400465, 1, 0, 0, 1, 1,
0.3713197, -0.7340599, 3.375134, 1, 0, 0, 1, 1,
0.3752494, 0.187641, 1.559409, 1, 0, 0, 1, 1,
0.3761052, 0.5036888, 1.325249, 1, 0, 0, 1, 1,
0.3763047, 0.5031335, -0.1300075, 1, 0, 0, 1, 1,
0.3773411, -0.3691248, 1.11776, 0, 0, 0, 1, 1,
0.3785779, -0.6594788, 3.666289, 0, 0, 0, 1, 1,
0.3814816, 0.7852185, -0.279694, 0, 0, 0, 1, 1,
0.3819061, 0.1188451, -0.04243425, 0, 0, 0, 1, 1,
0.382758, 0.01555903, 2.53196, 0, 0, 0, 1, 1,
0.3884029, 1.355711, 0.05162934, 0, 0, 0, 1, 1,
0.3888298, 0.3401706, 0.8978751, 0, 0, 0, 1, 1,
0.3913596, -0.3739762, 3.136001, 1, 1, 1, 1, 1,
0.3922606, 1.455982, 1.094095, 1, 1, 1, 1, 1,
0.3950355, -1.078531, 3.782771, 1, 1, 1, 1, 1,
0.3968517, 0.4338737, 0.850461, 1, 1, 1, 1, 1,
0.3999629, -0.8939139, 4.286416, 1, 1, 1, 1, 1,
0.4054146, -0.8503948, 3.05096, 1, 1, 1, 1, 1,
0.407517, 0.5996573, 1.118453, 1, 1, 1, 1, 1,
0.4079759, -0.957277, 4.222476, 1, 1, 1, 1, 1,
0.4113732, 0.3763461, -0.3957862, 1, 1, 1, 1, 1,
0.4147959, -2.094221, 2.622789, 1, 1, 1, 1, 1,
0.4154581, -0.01256434, 2.226658, 1, 1, 1, 1, 1,
0.4216786, 0.4575163, -0.2623957, 1, 1, 1, 1, 1,
0.4224288, -0.6260366, 2.873381, 1, 1, 1, 1, 1,
0.4270889, -0.7594009, 3.861913, 1, 1, 1, 1, 1,
0.4371796, -0.6489031, 0.9462886, 1, 1, 1, 1, 1,
0.4454113, 0.4314665, 1.015944, 0, 0, 1, 1, 1,
0.446048, 1.24139, 0.6361258, 1, 0, 0, 1, 1,
0.4488327, 0.5656434, 1.266951, 1, 0, 0, 1, 1,
0.4506484, -0.01295188, 1.510522, 1, 0, 0, 1, 1,
0.4508699, -2.281741, 1.938438, 1, 0, 0, 1, 1,
0.4536049, -0.10553, 0.265904, 1, 0, 0, 1, 1,
0.4581567, -0.03906958, 1.553347, 0, 0, 0, 1, 1,
0.4595408, 0.929474, -1.211551, 0, 0, 0, 1, 1,
0.461014, -0.3553006, 3.170745, 0, 0, 0, 1, 1,
0.4618929, 1.206579, -0.3531486, 0, 0, 0, 1, 1,
0.4623062, 0.3741941, 1.386778, 0, 0, 0, 1, 1,
0.4624365, 0.5274403, -0.8822317, 0, 0, 0, 1, 1,
0.4679339, 0.4589418, 1.305761, 0, 0, 0, 1, 1,
0.4717039, -0.1211958, 0.8522992, 1, 1, 1, 1, 1,
0.4734977, 0.3695748, 0.07289659, 1, 1, 1, 1, 1,
0.4809045, -0.3085552, 1.959704, 1, 1, 1, 1, 1,
0.4915963, 0.1303159, 1.869852, 1, 1, 1, 1, 1,
0.4920879, 0.07514238, 0.8769792, 1, 1, 1, 1, 1,
0.4923944, 1.331099, -1.556814, 1, 1, 1, 1, 1,
0.5034196, 1.199004, -0.5254763, 1, 1, 1, 1, 1,
0.5049054, 0.2881384, 1.400961, 1, 1, 1, 1, 1,
0.508326, -0.2656986, 3.036779, 1, 1, 1, 1, 1,
0.5093052, 1.471849, 0.1660191, 1, 1, 1, 1, 1,
0.5103593, -0.3563918, 1.85198, 1, 1, 1, 1, 1,
0.5106128, -0.1020656, 0.9041582, 1, 1, 1, 1, 1,
0.5121297, -2.138557, 3.713293, 1, 1, 1, 1, 1,
0.5167569, 1.333101, 1.021765, 1, 1, 1, 1, 1,
0.5193185, -0.5089799, 0.1237402, 1, 1, 1, 1, 1,
0.5205088, 1.612824, 1.505723, 0, 0, 1, 1, 1,
0.5252591, -2.128385, 3.052742, 1, 0, 0, 1, 1,
0.5263474, 2.087637, 0.2356766, 1, 0, 0, 1, 1,
0.5300422, 0.2559478, 0.9059166, 1, 0, 0, 1, 1,
0.5349758, -0.5130624, 1.817463, 1, 0, 0, 1, 1,
0.5378833, 1.307896, -0.4696644, 1, 0, 0, 1, 1,
0.5403777, -0.8699015, 1.456343, 0, 0, 0, 1, 1,
0.5469565, -0.01202479, 2.361733, 0, 0, 0, 1, 1,
0.5546224, 1.061189, 1.239697, 0, 0, 0, 1, 1,
0.5594013, -0.6257973, 1.662021, 0, 0, 0, 1, 1,
0.5596898, -1.200849, 2.029596, 0, 0, 0, 1, 1,
0.5618615, 0.06423439, -0.2101386, 0, 0, 0, 1, 1,
0.5697498, 0.7806817, 1.051251, 0, 0, 0, 1, 1,
0.5734802, -2.386859, 3.859566, 1, 1, 1, 1, 1,
0.5743956, -0.831852, 2.10195, 1, 1, 1, 1, 1,
0.5752826, 0.03750899, 2.430327, 1, 1, 1, 1, 1,
0.5824279, 0.2146336, 2.280561, 1, 1, 1, 1, 1,
0.5826291, 0.2274746, 0.8868204, 1, 1, 1, 1, 1,
0.5835358, 0.4044814, 1.444401, 1, 1, 1, 1, 1,
0.5850676, -0.1801209, 1.13249, 1, 1, 1, 1, 1,
0.5873406, 0.6942965, -0.08248306, 1, 1, 1, 1, 1,
0.5921288, 1.010997, 1.891316, 1, 1, 1, 1, 1,
0.5962027, 0.8136041, -0.1725318, 1, 1, 1, 1, 1,
0.5974225, -0.4632558, -0.2897217, 1, 1, 1, 1, 1,
0.6034271, -1.093386, 2.556951, 1, 1, 1, 1, 1,
0.6100503, -0.3883776, 0.2883327, 1, 1, 1, 1, 1,
0.6123391, 0.2800458, 0.2580179, 1, 1, 1, 1, 1,
0.6127065, -0.5952828, 1.974343, 1, 1, 1, 1, 1,
0.6129108, 0.5311264, 1.95216, 0, 0, 1, 1, 1,
0.6176379, -0.3996077, 1.810019, 1, 0, 0, 1, 1,
0.618311, 1.206646, 0.8007314, 1, 0, 0, 1, 1,
0.6222579, 1.53181, 1.263218, 1, 0, 0, 1, 1,
0.6291524, -0.3531392, 0.6990997, 1, 0, 0, 1, 1,
0.6320922, -1.570437, 3.782066, 1, 0, 0, 1, 1,
0.6336995, -1.745929, 3.018806, 0, 0, 0, 1, 1,
0.6381415, -0.2696184, 2.246704, 0, 0, 0, 1, 1,
0.6385639, -1.024863, 2.338296, 0, 0, 0, 1, 1,
0.6460863, -1.213089, 2.031934, 0, 0, 0, 1, 1,
0.647253, -0.9949157, 3.222367, 0, 0, 0, 1, 1,
0.6478699, -0.3738477, 2.770324, 0, 0, 0, 1, 1,
0.6575462, 0.1499692, 1.002355, 0, 0, 0, 1, 1,
0.6577614, 0.4777552, 0.2809578, 1, 1, 1, 1, 1,
0.6683209, -0.472468, 2.10832, 1, 1, 1, 1, 1,
0.6683892, 1.113749, -0.9007698, 1, 1, 1, 1, 1,
0.6789102, -1.123854, 4.495642, 1, 1, 1, 1, 1,
0.6790652, 0.2018105, 0.4941346, 1, 1, 1, 1, 1,
0.6944953, -0.8856816, 1.547568, 1, 1, 1, 1, 1,
0.6961874, 0.4923346, 1.445568, 1, 1, 1, 1, 1,
0.6979259, -0.7791245, 3.280001, 1, 1, 1, 1, 1,
0.7042123, -1.131389, 3.469912, 1, 1, 1, 1, 1,
0.7050527, 0.8822809, 1.498751, 1, 1, 1, 1, 1,
0.7066002, -0.19457, 1.412418, 1, 1, 1, 1, 1,
0.7095532, 0.01944615, 1.362358, 1, 1, 1, 1, 1,
0.7100396, 0.1308506, 1.765945, 1, 1, 1, 1, 1,
0.7106059, 0.9272346, 0.8390201, 1, 1, 1, 1, 1,
0.7164932, 1.065839, 2.115042, 1, 1, 1, 1, 1,
0.716715, -0.458345, 0.7956706, 0, 0, 1, 1, 1,
0.7203327, 0.8002561, 0.8408922, 1, 0, 0, 1, 1,
0.7248565, 1.536012, 1.394258, 1, 0, 0, 1, 1,
0.72978, 0.5308779, 1.238132, 1, 0, 0, 1, 1,
0.7388755, -0.7422078, 2.664926, 1, 0, 0, 1, 1,
0.7407677, 0.01807765, 1.219302, 1, 0, 0, 1, 1,
0.742368, -1.06538, 2.299141, 0, 0, 0, 1, 1,
0.7446014, 0.1618863, 0.9311439, 0, 0, 0, 1, 1,
0.7468379, 0.5573654, 0.1910125, 0, 0, 0, 1, 1,
0.7512975, 0.6684773, 0.8821006, 0, 0, 0, 1, 1,
0.7543926, -0.3668321, 3.754719, 0, 0, 0, 1, 1,
0.7560605, -2.23185, 2.956403, 0, 0, 0, 1, 1,
0.7571064, -1.757524, 4.021452, 0, 0, 0, 1, 1,
0.7577943, 0.03443115, -0.4309838, 1, 1, 1, 1, 1,
0.7593302, -0.1778894, 0.279437, 1, 1, 1, 1, 1,
0.7673308, 0.4331098, -0.3734981, 1, 1, 1, 1, 1,
0.7721072, -2.007411, 1.417886, 1, 1, 1, 1, 1,
0.7723736, -1.076813, 0.473953, 1, 1, 1, 1, 1,
0.7737545, -1.151984, 2.32168, 1, 1, 1, 1, 1,
0.7738416, 1.212049, 0.01374563, 1, 1, 1, 1, 1,
0.7795115, -0.5228559, 3.851475, 1, 1, 1, 1, 1,
0.7829916, -0.9847758, 3.683977, 1, 1, 1, 1, 1,
0.7872085, 0.5373976, 0.7293622, 1, 1, 1, 1, 1,
0.7897357, 0.5359676, 0.8329448, 1, 1, 1, 1, 1,
0.7968231, -1.375141, 2.931382, 1, 1, 1, 1, 1,
0.8148741, -0.6680098, 4.002277, 1, 1, 1, 1, 1,
0.8167625, -1.431553, 2.288176, 1, 1, 1, 1, 1,
0.8259206, 1.173375, 0.2709347, 1, 1, 1, 1, 1,
0.8323984, 1.497312, 0.7892298, 0, 0, 1, 1, 1,
0.8337042, 0.7412372, 0.5644544, 1, 0, 0, 1, 1,
0.8358466, -1.200249, 2.890213, 1, 0, 0, 1, 1,
0.8360108, -0.9644405, 4.662069, 1, 0, 0, 1, 1,
0.8374966, -0.633045, 0.3106718, 1, 0, 0, 1, 1,
0.8388774, -1.089261, 3.263705, 1, 0, 0, 1, 1,
0.8399612, 1.48463, 0.7104033, 0, 0, 0, 1, 1,
0.8402387, -1.535894, 3.839622, 0, 0, 0, 1, 1,
0.8460667, -2.834273, 4.519056, 0, 0, 0, 1, 1,
0.8476878, -0.5535907, 2.186229, 0, 0, 0, 1, 1,
0.8485737, -0.2727354, 1.563859, 0, 0, 0, 1, 1,
0.8491282, 0.410632, 0.9375641, 0, 0, 0, 1, 1,
0.8493354, 0.2110748, 3.652072, 0, 0, 0, 1, 1,
0.8495089, -0.1675234, 1.548986, 1, 1, 1, 1, 1,
0.8495592, 0.2163777, -0.5204288, 1, 1, 1, 1, 1,
0.8536752, 1.320843, 1.625658, 1, 1, 1, 1, 1,
0.8542846, -0.8679386, 0.05595493, 1, 1, 1, 1, 1,
0.8639491, 0.8343367, 1.168916, 1, 1, 1, 1, 1,
0.8640195, 0.3132145, -0.04923687, 1, 1, 1, 1, 1,
0.8669873, -0.5364815, 2.002142, 1, 1, 1, 1, 1,
0.8681625, 0.5137772, -0.09965865, 1, 1, 1, 1, 1,
0.8688182, 0.6828883, 0.4269326, 1, 1, 1, 1, 1,
0.8693733, 0.7625644, 2.395612, 1, 1, 1, 1, 1,
0.8718413, 0.1098734, 2.818271, 1, 1, 1, 1, 1,
0.8782837, -0.8109412, 2.968004, 1, 1, 1, 1, 1,
0.8997053, -0.3461775, 2.166521, 1, 1, 1, 1, 1,
0.9140258, 0.1837253, 1.120737, 1, 1, 1, 1, 1,
0.9183387, -0.5543782, 2.356215, 1, 1, 1, 1, 1,
0.9196683, 0.6056212, 0.9825523, 0, 0, 1, 1, 1,
0.9197753, 0.204102, 1.517034, 1, 0, 0, 1, 1,
0.9288274, -0.07220087, 1.85789, 1, 0, 0, 1, 1,
0.9337469, -1.13583, 2.190614, 1, 0, 0, 1, 1,
0.9393583, -1.176699, 1.921823, 1, 0, 0, 1, 1,
0.9417427, -0.3371733, 3.798445, 1, 0, 0, 1, 1,
0.9455619, -0.2396104, 1.616941, 0, 0, 0, 1, 1,
0.9462787, 0.9547787, 0.1549027, 0, 0, 0, 1, 1,
0.9463837, 1.312221, -0.5520119, 0, 0, 0, 1, 1,
0.9475274, -0.8682629, 0.191693, 0, 0, 0, 1, 1,
0.9506078, -0.8129424, 0.5284226, 0, 0, 0, 1, 1,
0.9520493, 0.8579619, 1.113867, 0, 0, 0, 1, 1,
0.960133, -0.08099704, 2.475853, 0, 0, 0, 1, 1,
0.964964, 0.8580719, 0.3371427, 1, 1, 1, 1, 1,
0.9651762, -0.4865956, 3.700094, 1, 1, 1, 1, 1,
0.9661241, 1.653136, 0.2628696, 1, 1, 1, 1, 1,
0.9695145, -1.992115, 2.444303, 1, 1, 1, 1, 1,
0.9738961, 1.006096, 0.419651, 1, 1, 1, 1, 1,
0.9775899, -0.8150178, 1.032849, 1, 1, 1, 1, 1,
0.9813149, -2.389925, 3.164124, 1, 1, 1, 1, 1,
0.9816152, -1.089046, 1.426504, 1, 1, 1, 1, 1,
0.9818359, -0.5112222, 1.108386, 1, 1, 1, 1, 1,
0.9820943, -1.90563, 3.972713, 1, 1, 1, 1, 1,
0.9845611, 2.318782, -0.348159, 1, 1, 1, 1, 1,
0.986219, -1.316788, 1.030999, 1, 1, 1, 1, 1,
0.9907234, 0.6060558, 0.5106239, 1, 1, 1, 1, 1,
0.992398, 0.1327704, 3.668087, 1, 1, 1, 1, 1,
0.994156, 0.4119698, 0.7093067, 1, 1, 1, 1, 1,
1.00069, 1.175304, 1.283121, 0, 0, 1, 1, 1,
1.000959, 0.785019, 2.276916, 1, 0, 0, 1, 1,
1.002639, 0.1556406, 1.123406, 1, 0, 0, 1, 1,
1.011588, -1.288216, 2.70646, 1, 0, 0, 1, 1,
1.022565, 0.5612936, -0.7345384, 1, 0, 0, 1, 1,
1.029835, -0.8765268, 2.817939, 1, 0, 0, 1, 1,
1.036959, 0.1912285, -1.56873, 0, 0, 0, 1, 1,
1.039122, -1.200065, 1.748559, 0, 0, 0, 1, 1,
1.049589, 1.338522, -0.8845142, 0, 0, 0, 1, 1,
1.05206, -0.07405366, 0.3971659, 0, 0, 0, 1, 1,
1.052773, 0.8674816, 0.5126711, 0, 0, 0, 1, 1,
1.054025, 1.61806, 0.08704352, 0, 0, 0, 1, 1,
1.063588, 0.6728401, 0.8886386, 0, 0, 0, 1, 1,
1.064903, 0.7966048, 1.36489, 1, 1, 1, 1, 1,
1.068022, 0.7498169, 0.6070867, 1, 1, 1, 1, 1,
1.071668, -1.376289, 3.139414, 1, 1, 1, 1, 1,
1.07501, -0.7463593, 2.953277, 1, 1, 1, 1, 1,
1.077789, 0.9281283, 0.459367, 1, 1, 1, 1, 1,
1.079549, 0.7526844, 1.454132, 1, 1, 1, 1, 1,
1.083063, 0.6962106, 0.1120039, 1, 1, 1, 1, 1,
1.083434, -0.4620326, 1.01127, 1, 1, 1, 1, 1,
1.088151, 1.186709, 1.413045, 1, 1, 1, 1, 1,
1.088468, 0.8946514, 2.349019, 1, 1, 1, 1, 1,
1.092668, -0.745733, 1.856149, 1, 1, 1, 1, 1,
1.095967, -0.08698075, 1.36053, 1, 1, 1, 1, 1,
1.100856, -2.497144, 4.948424, 1, 1, 1, 1, 1,
1.105862, -1.872954, 1.918925, 1, 1, 1, 1, 1,
1.110068, -0.03155013, 1.475115, 1, 1, 1, 1, 1,
1.11015, -1.016773, 4.135139, 0, 0, 1, 1, 1,
1.110604, -1.291919, 3.751481, 1, 0, 0, 1, 1,
1.114533, 0.04726172, 1.674544, 1, 0, 0, 1, 1,
1.114789, -0.1459782, 0.7522744, 1, 0, 0, 1, 1,
1.115451, -0.03581101, 2.508651, 1, 0, 0, 1, 1,
1.116032, -1.363935, 1.472139, 1, 0, 0, 1, 1,
1.118997, 0.9395729, 0.5684001, 0, 0, 0, 1, 1,
1.119295, 0.2250838, 1.522503, 0, 0, 0, 1, 1,
1.122991, 1.044726, -0.572053, 0, 0, 0, 1, 1,
1.140951, 0.3947386, 1.751084, 0, 0, 0, 1, 1,
1.146266, -1.467874, 2.114966, 0, 0, 0, 1, 1,
1.153628, 0.8703418, -0.5755228, 0, 0, 0, 1, 1,
1.1541, -0.9029738, 1.327109, 0, 0, 0, 1, 1,
1.155738, 1.126538, -0.2951058, 1, 1, 1, 1, 1,
1.156455, -1.688132, 2.730383, 1, 1, 1, 1, 1,
1.173543, -1.688636, 4.306238, 1, 1, 1, 1, 1,
1.176541, -0.04677761, 2.791698, 1, 1, 1, 1, 1,
1.186701, 0.9316238, 2.484769, 1, 1, 1, 1, 1,
1.190961, -0.4626492, 2.120258, 1, 1, 1, 1, 1,
1.196113, -0.0291483, 2.041611, 1, 1, 1, 1, 1,
1.212518, -2.076142, 1.560436, 1, 1, 1, 1, 1,
1.219053, 0.7136897, 1.409013, 1, 1, 1, 1, 1,
1.220912, 0.3749261, 1.553961, 1, 1, 1, 1, 1,
1.22287, 2.391646, 1.954918, 1, 1, 1, 1, 1,
1.232746, 0.7374864, 3.067727, 1, 1, 1, 1, 1,
1.237987, 0.02196058, 2.42118, 1, 1, 1, 1, 1,
1.239264, 0.5938556, 1.645325, 1, 1, 1, 1, 1,
1.244639, 1.596883, 0.2966503, 1, 1, 1, 1, 1,
1.248832, 0.5057125, 2.816456, 0, 0, 1, 1, 1,
1.25411, -0.08312839, 1.38227, 1, 0, 0, 1, 1,
1.254801, -2.036942, 4.111368, 1, 0, 0, 1, 1,
1.266924, 0.2950353, 1.139678, 1, 0, 0, 1, 1,
1.267449, 0.2303461, 1.455621, 1, 0, 0, 1, 1,
1.280329, -1.296285, 1.592436, 1, 0, 0, 1, 1,
1.290351, 0.6256918, 1.368145, 0, 0, 0, 1, 1,
1.29774, 0.5057356, 0.9619625, 0, 0, 0, 1, 1,
1.299051, -0.7694166, 2.553176, 0, 0, 0, 1, 1,
1.303856, 1.766495, -0.06350575, 0, 0, 0, 1, 1,
1.30741, -0.9539607, 1.309332, 0, 0, 0, 1, 1,
1.307731, 2.29812, -0.1635976, 0, 0, 0, 1, 1,
1.309661, 3.063357, 0.6506302, 0, 0, 0, 1, 1,
1.311219, 0.8918221, 0.7789523, 1, 1, 1, 1, 1,
1.311907, -0.3559493, 2.22477, 1, 1, 1, 1, 1,
1.311912, 0.5744248, 1.453959, 1, 1, 1, 1, 1,
1.320624, 0.5606968, -0.4859021, 1, 1, 1, 1, 1,
1.320922, -1.249121, 3.623344, 1, 1, 1, 1, 1,
1.331335, 0.3382494, 1.077466, 1, 1, 1, 1, 1,
1.333812, 0.9867126, 1.833594, 1, 1, 1, 1, 1,
1.33775, 0.3759468, 0.9819949, 1, 1, 1, 1, 1,
1.340122, 0.604503, -0.1001913, 1, 1, 1, 1, 1,
1.340715, 0.05762641, 1.504567, 1, 1, 1, 1, 1,
1.344078, 0.0387833, 2.870393, 1, 1, 1, 1, 1,
1.344614, -0.8935037, 1.748808, 1, 1, 1, 1, 1,
1.358751, -0.7952689, 3.809178, 1, 1, 1, 1, 1,
1.361028, -0.8077043, 1.612316, 1, 1, 1, 1, 1,
1.375447, -1.417212, 3.535487, 1, 1, 1, 1, 1,
1.377541, 1.362979, 2.109966, 0, 0, 1, 1, 1,
1.381435, -0.4721596, 3.092348, 1, 0, 0, 1, 1,
1.38972, 1.458074, 0.7821202, 1, 0, 0, 1, 1,
1.393611, 1.47704, 0.7671158, 1, 0, 0, 1, 1,
1.396614, -0.7379904, 0.3346201, 1, 0, 0, 1, 1,
1.403544, 0.2668139, 1.889361, 1, 0, 0, 1, 1,
1.414173, 0.9064737, 1.603242, 0, 0, 0, 1, 1,
1.417488, 0.1728405, -1.095312, 0, 0, 0, 1, 1,
1.423271, -1.127474, 1.410463, 0, 0, 0, 1, 1,
1.434579, -0.9652518, 1.118092, 0, 0, 0, 1, 1,
1.442447, 0.936602, 1.250679, 0, 0, 0, 1, 1,
1.444861, -1.746606, 2.678055, 0, 0, 0, 1, 1,
1.446967, -1.323796, 0.5230486, 0, 0, 0, 1, 1,
1.458803, -0.1450312, 1.137342, 1, 1, 1, 1, 1,
1.463344, -0.4691036, 0.8715971, 1, 1, 1, 1, 1,
1.468534, 0.2064318, 1.47585, 1, 1, 1, 1, 1,
1.494354, -0.7286721, 3.042854, 1, 1, 1, 1, 1,
1.495484, -1.536899, 2.96495, 1, 1, 1, 1, 1,
1.49644, 0.2558528, 2.421567, 1, 1, 1, 1, 1,
1.511386, 0.7599351, 1.146998, 1, 1, 1, 1, 1,
1.516375, -0.3732981, 0.8133063, 1, 1, 1, 1, 1,
1.52147, 0.4215183, 1.139426, 1, 1, 1, 1, 1,
1.549667, -1.348958, 2.473927, 1, 1, 1, 1, 1,
1.551107, 1.983572, 1.143395, 1, 1, 1, 1, 1,
1.5558, 0.09460114, 1.769696, 1, 1, 1, 1, 1,
1.55633, -1.51281, 2.51052, 1, 1, 1, 1, 1,
1.563112, 1.185078, 0.2420518, 1, 1, 1, 1, 1,
1.571272, 0.5426061, 1.671919, 1, 1, 1, 1, 1,
1.578266, -0.09075949, 3.57478, 0, 0, 1, 1, 1,
1.591983, -0.1541542, 1.801804, 1, 0, 0, 1, 1,
1.593327, 0.7745063, 1.471843, 1, 0, 0, 1, 1,
1.606682, 0.04600688, 1.224135, 1, 0, 0, 1, 1,
1.606949, 0.1043978, 1.384073, 1, 0, 0, 1, 1,
1.610667, -0.02788327, 3.055937, 1, 0, 0, 1, 1,
1.644949, 0.4647224, 1.196906, 0, 0, 0, 1, 1,
1.646268, 0.3369179, 0.09000348, 0, 0, 0, 1, 1,
1.693955, -0.1324283, 1.082825, 0, 0, 0, 1, 1,
1.740186, -1.990197, 2.298889, 0, 0, 0, 1, 1,
1.748989, -0.8329312, 1.158923, 0, 0, 0, 1, 1,
1.765982, 1.555974, 2.394471, 0, 0, 0, 1, 1,
1.819821, 0.2252684, 1.767416, 0, 0, 0, 1, 1,
1.82394, -0.4585797, 1.927286, 1, 1, 1, 1, 1,
1.833115, -1.923807, 3.688678, 1, 1, 1, 1, 1,
1.839708, -0.7255412, 1.295147, 1, 1, 1, 1, 1,
1.859406, -2.01606, 1.802492, 1, 1, 1, 1, 1,
1.864071, -1.221556, 2.269894, 1, 1, 1, 1, 1,
1.888628, -0.26702, 2.456481, 1, 1, 1, 1, 1,
1.895352, 0.6847568, -0.1936444, 1, 1, 1, 1, 1,
1.90615, 0.76438, 1.290053, 1, 1, 1, 1, 1,
1.918994, -0.9803333, 2.223812, 1, 1, 1, 1, 1,
1.953698, -0.05400319, 0.8871141, 1, 1, 1, 1, 1,
1.967255, -0.4763904, 2.68936, 1, 1, 1, 1, 1,
1.973313, 1.077509, 1.609113, 1, 1, 1, 1, 1,
1.973444, 0.0227186, 2.446926, 1, 1, 1, 1, 1,
1.981311, 1.322141, 1.529477, 1, 1, 1, 1, 1,
1.986692, 1.212386, 0.537725, 1, 1, 1, 1, 1,
2.010935, 0.7055433, 1.479133, 0, 0, 1, 1, 1,
2.025745, -0.2916693, 2.801653, 1, 0, 0, 1, 1,
2.101472, 0.6028397, 1.435811, 1, 0, 0, 1, 1,
2.135204, -0.966914, 1.315305, 1, 0, 0, 1, 1,
2.272238, 0.1745551, 3.092363, 1, 0, 0, 1, 1,
2.364659, -0.3842925, 4.019433, 1, 0, 0, 1, 1,
2.382456, 0.3415085, 1.642229, 0, 0, 0, 1, 1,
2.416002, -0.04073052, 0.02889673, 0, 0, 0, 1, 1,
2.43181, 0.2971048, 2.53399, 0, 0, 0, 1, 1,
2.448275, 0.771649, 0.6823524, 0, 0, 0, 1, 1,
2.490528, -1.27556, 2.313713, 0, 0, 0, 1, 1,
2.513131, 0.6660262, 0.8211342, 0, 0, 0, 1, 1,
2.541841, 1.244888, 1.691393, 0, 0, 0, 1, 1,
2.594269, -1.127973, 1.58948, 1, 1, 1, 1, 1,
2.604193, -1.193589, 2.759891, 1, 1, 1, 1, 1,
2.756838, 1.039341, 1.321877, 1, 1, 1, 1, 1,
2.802634, 0.04144801, 1.682306, 1, 1, 1, 1, 1,
2.81527, 1.748726, 0.3740553, 1, 1, 1, 1, 1,
2.964703, 2.707883, -0.1559381, 1, 1, 1, 1, 1,
3.025197, -0.3838792, 1.246109, 1, 1, 1, 1, 1
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
var radius = 9.597151;
var distance = 33.70959;
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
mvMatrix.translate( 0.2929049, 0.1182277, -0.3902552 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.70959);
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
