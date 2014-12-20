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
-2.991773, 0.3916603, 0.4658056, 1, 0, 0, 1,
-2.852213, 0.7819606, -0.9760417, 1, 0.007843138, 0, 1,
-2.644755, -0.3264574, -3.362843, 1, 0.01176471, 0, 1,
-2.637254, -0.1907605, -0.2158304, 1, 0.01960784, 0, 1,
-2.508321, -0.6008728, -0.6686642, 1, 0.02352941, 0, 1,
-2.49229, -0.05003522, -1.265252, 1, 0.03137255, 0, 1,
-2.451492, -0.8186892, -1.315367, 1, 0.03529412, 0, 1,
-2.43827, -1.81578, -2.933061, 1, 0.04313726, 0, 1,
-2.353279, 0.4670695, -0.3382952, 1, 0.04705882, 0, 1,
-2.345136, -1.857352, -1.349489, 1, 0.05490196, 0, 1,
-2.342824, -1.015016, -3.035923, 1, 0.05882353, 0, 1,
-2.266859, -0.406197, -2.594208, 1, 0.06666667, 0, 1,
-2.254232, 0.3135914, -0.6600296, 1, 0.07058824, 0, 1,
-2.210742, -1.019994, -1.814556, 1, 0.07843138, 0, 1,
-2.206427, -1.069962, -3.069873, 1, 0.08235294, 0, 1,
-2.194799, -0.1623603, -2.033923, 1, 0.09019608, 0, 1,
-2.175848, -1.041085, -0.2643268, 1, 0.09411765, 0, 1,
-2.16802, -1.038535, -1.114275, 1, 0.1019608, 0, 1,
-2.166147, 0.8139349, -2.566255, 1, 0.1098039, 0, 1,
-2.128888, -0.3837199, -0.4550849, 1, 0.1137255, 0, 1,
-2.112572, -1.487932, -0.9467721, 1, 0.1215686, 0, 1,
-2.100394, -1.255458, -1.842661, 1, 0.1254902, 0, 1,
-2.04864, 0.1337038, -2.653332, 1, 0.1333333, 0, 1,
-2.043768, -2.337698, -1.796652, 1, 0.1372549, 0, 1,
-2.017003, 0.3484493, -1.544643, 1, 0.145098, 0, 1,
-1.975187, -0.5859587, -1.412697, 1, 0.1490196, 0, 1,
-1.943894, -1.223793, -2.850718, 1, 0.1568628, 0, 1,
-1.932837, 0.7295731, -2.247376, 1, 0.1607843, 0, 1,
-1.930071, 0.7664914, -2.538538, 1, 0.1686275, 0, 1,
-1.903201, -0.04042313, -1.605802, 1, 0.172549, 0, 1,
-1.880463, -0.3505991, -2.875426, 1, 0.1803922, 0, 1,
-1.879785, 0.1208226, -2.881274, 1, 0.1843137, 0, 1,
-1.872861, 0.6165714, -1.004003, 1, 0.1921569, 0, 1,
-1.835003, 0.3247238, -1.918509, 1, 0.1960784, 0, 1,
-1.811674, 0.7521471, -0.5926411, 1, 0.2039216, 0, 1,
-1.807673, 1.140348, -3.100271, 1, 0.2117647, 0, 1,
-1.800141, -1.378008, -3.213869, 1, 0.2156863, 0, 1,
-1.794841, 0.5909725, -2.251014, 1, 0.2235294, 0, 1,
-1.775696, 0.8056555, -0.8693814, 1, 0.227451, 0, 1,
-1.768967, -0.7064345, -3.207289, 1, 0.2352941, 0, 1,
-1.76497, 0.4031889, -1.481296, 1, 0.2392157, 0, 1,
-1.755263, -0.08161358, -2.911472, 1, 0.2470588, 0, 1,
-1.750583, -0.1434765, -2.173995, 1, 0.2509804, 0, 1,
-1.718013, 0.5715559, -2.127472, 1, 0.2588235, 0, 1,
-1.705334, 0.1411213, -4.247892, 1, 0.2627451, 0, 1,
-1.676278, -0.3287822, -1.007343, 1, 0.2705882, 0, 1,
-1.664502, -0.009461083, -1.020095, 1, 0.2745098, 0, 1,
-1.656596, 0.2962878, -2.211148, 1, 0.282353, 0, 1,
-1.644199, 0.416859, -0.9640788, 1, 0.2862745, 0, 1,
-1.620303, -1.022059, -1.167449, 1, 0.2941177, 0, 1,
-1.615919, 0.9469975, -0.9514159, 1, 0.3019608, 0, 1,
-1.612486, 0.387946, 0.02169816, 1, 0.3058824, 0, 1,
-1.599603, -1.114396, -2.639436, 1, 0.3137255, 0, 1,
-1.598668, 0.2262237, -0.3048252, 1, 0.3176471, 0, 1,
-1.596828, 0.04319295, -2.055528, 1, 0.3254902, 0, 1,
-1.594099, -1.231104, -2.888766, 1, 0.3294118, 0, 1,
-1.575155, 0.8960776, 0.6714497, 1, 0.3372549, 0, 1,
-1.573526, -0.2277924, -0.08314119, 1, 0.3411765, 0, 1,
-1.545777, -0.46069, -2.219027, 1, 0.3490196, 0, 1,
-1.536823, -0.3615236, -2.835236, 1, 0.3529412, 0, 1,
-1.527121, -1.120864, -2.344465, 1, 0.3607843, 0, 1,
-1.523109, 0.3687004, -0.6350239, 1, 0.3647059, 0, 1,
-1.505946, 0.4309574, -2.588741, 1, 0.372549, 0, 1,
-1.491261, 0.7977954, -1.928019, 1, 0.3764706, 0, 1,
-1.489884, 0.6889408, -1.253537, 1, 0.3843137, 0, 1,
-1.480152, -0.5450904, -3.8212, 1, 0.3882353, 0, 1,
-1.472049, -0.3355633, -0.1318199, 1, 0.3960784, 0, 1,
-1.467539, -0.6073834, -0.9699312, 1, 0.4039216, 0, 1,
-1.460992, 1.274883, -2.708184, 1, 0.4078431, 0, 1,
-1.460263, 0.3913045, -1.518583, 1, 0.4156863, 0, 1,
-1.459053, 2.257423, -0.333585, 1, 0.4196078, 0, 1,
-1.452312, 0.4991713, -1.696219, 1, 0.427451, 0, 1,
-1.452024, 0.5840036, -2.726993, 1, 0.4313726, 0, 1,
-1.444656, 1.525408, -2.512388, 1, 0.4392157, 0, 1,
-1.436989, -2.389244, -2.800148, 1, 0.4431373, 0, 1,
-1.436571, -1.432914, -2.681823, 1, 0.4509804, 0, 1,
-1.433726, -0.2826953, -2.996541, 1, 0.454902, 0, 1,
-1.424584, -0.734296, -2.00469, 1, 0.4627451, 0, 1,
-1.421105, 0.1556345, -1.403852, 1, 0.4666667, 0, 1,
-1.409285, 0.3978794, -0.9566169, 1, 0.4745098, 0, 1,
-1.39111, -0.09599309, -2.338151, 1, 0.4784314, 0, 1,
-1.390096, -1.538545, -1.29649, 1, 0.4862745, 0, 1,
-1.38301, 0.6527519, -0.4962313, 1, 0.4901961, 0, 1,
-1.379208, 1.599211, -0.2527734, 1, 0.4980392, 0, 1,
-1.371724, -0.5287336, -1.039036, 1, 0.5058824, 0, 1,
-1.371142, -0.4203382, -3.963473, 1, 0.509804, 0, 1,
-1.351489, -1.995199, -2.250703, 1, 0.5176471, 0, 1,
-1.348696, -1.019857, -3.518107, 1, 0.5215687, 0, 1,
-1.345217, 1.95789, -1.226126, 1, 0.5294118, 0, 1,
-1.344609, 0.6669132, 0.3199618, 1, 0.5333334, 0, 1,
-1.33278, 0.5451248, 0.7233533, 1, 0.5411765, 0, 1,
-1.331786, 0.6268585, -1.985334, 1, 0.5450981, 0, 1,
-1.309148, -0.05105333, -2.35954, 1, 0.5529412, 0, 1,
-1.304181, 0.925554, 0.5343392, 1, 0.5568628, 0, 1,
-1.302244, -1.090814, -0.7767923, 1, 0.5647059, 0, 1,
-1.292853, -0.5303922, -0.05670065, 1, 0.5686275, 0, 1,
-1.290179, -0.9772325, -2.624877, 1, 0.5764706, 0, 1,
-1.283046, -0.510447, -1.719577, 1, 0.5803922, 0, 1,
-1.282617, -0.06471713, 0.05056245, 1, 0.5882353, 0, 1,
-1.282609, 2.718247, 0.1002098, 1, 0.5921569, 0, 1,
-1.273196, -0.2907779, -1.137008, 1, 0.6, 0, 1,
-1.268206, 0.1843088, -4.123908, 1, 0.6078432, 0, 1,
-1.266461, 0.5206069, -0.6247354, 1, 0.6117647, 0, 1,
-1.263753, -0.4007774, -1.850167, 1, 0.6196079, 0, 1,
-1.259591, -0.1179089, -3.18486, 1, 0.6235294, 0, 1,
-1.254314, 0.6937862, 0.6167204, 1, 0.6313726, 0, 1,
-1.24865, 0.4352843, -0.7578538, 1, 0.6352941, 0, 1,
-1.243432, -0.8054481, -3.70776, 1, 0.6431373, 0, 1,
-1.236602, 1.302031, -0.8693542, 1, 0.6470588, 0, 1,
-1.230665, 0.07977764, -1.78644, 1, 0.654902, 0, 1,
-1.220088, -1.697646, -2.362113, 1, 0.6588235, 0, 1,
-1.214646, 0.01217556, -2.55556, 1, 0.6666667, 0, 1,
-1.207498, -0.3497618, -1.37867, 1, 0.6705883, 0, 1,
-1.202049, 0.4260583, -0.5514494, 1, 0.6784314, 0, 1,
-1.195024, 0.857532, 1.267381, 1, 0.682353, 0, 1,
-1.194109, -0.3801447, -1.864468, 1, 0.6901961, 0, 1,
-1.192719, -0.007319633, -1.674173, 1, 0.6941177, 0, 1,
-1.185483, -0.6946028, -1.252778, 1, 0.7019608, 0, 1,
-1.174378, -1.143581, -1.998416, 1, 0.7098039, 0, 1,
-1.171203, 0.1629676, -0.6181625, 1, 0.7137255, 0, 1,
-1.169948, -1.634543, -2.518401, 1, 0.7215686, 0, 1,
-1.16028, -1.689466, -2.368508, 1, 0.7254902, 0, 1,
-1.149512, -1.513828, -2.487774, 1, 0.7333333, 0, 1,
-1.14894, 0.2908359, -0.8915404, 1, 0.7372549, 0, 1,
-1.148855, -1.984782, -1.641195, 1, 0.7450981, 0, 1,
-1.147842, -0.2198067, -1.227205, 1, 0.7490196, 0, 1,
-1.142719, 1.000811, -1.789726, 1, 0.7568628, 0, 1,
-1.138096, -0.8607842, -1.399688, 1, 0.7607843, 0, 1,
-1.133957, -1.956481, -3.687616, 1, 0.7686275, 0, 1,
-1.132126, 0.5812908, -0.5562385, 1, 0.772549, 0, 1,
-1.120855, 2.292232, -1.298329, 1, 0.7803922, 0, 1,
-1.119224, -2.347766, -3.88861, 1, 0.7843137, 0, 1,
-1.118886, -0.8187415, -2.326218, 1, 0.7921569, 0, 1,
-1.113061, -0.546143, -3.372558, 1, 0.7960784, 0, 1,
-1.106421, -1.068299, -1.843874, 1, 0.8039216, 0, 1,
-1.105462, 0.3384641, -1.568892, 1, 0.8117647, 0, 1,
-1.104066, -0.284296, -3.069829, 1, 0.8156863, 0, 1,
-1.098099, -0.2705602, -1.974911, 1, 0.8235294, 0, 1,
-1.094457, -0.7187795, -3.514236, 1, 0.827451, 0, 1,
-1.083593, 1.215668, 1.985879, 1, 0.8352941, 0, 1,
-1.081943, -0.1794692, -1.41906, 1, 0.8392157, 0, 1,
-1.073628, -0.2350871, -0.4632841, 1, 0.8470588, 0, 1,
-1.073505, -2.523118, -1.453077, 1, 0.8509804, 0, 1,
-1.068108, 1.057462, -1.599658, 1, 0.8588235, 0, 1,
-1.067598, 0.02238015, -2.300549, 1, 0.8627451, 0, 1,
-1.067118, 1.843954, 0.4026138, 1, 0.8705882, 0, 1,
-1.066495, -0.7640371, -2.485032, 1, 0.8745098, 0, 1,
-1.065216, -0.6249844, -2.799986, 1, 0.8823529, 0, 1,
-1.064431, 0.8559014, -1.648235, 1, 0.8862745, 0, 1,
-1.055443, 0.3190438, -2.865325, 1, 0.8941177, 0, 1,
-1.054188, 0.3449824, 0.1391662, 1, 0.8980392, 0, 1,
-1.036933, -0.5850232, -2.766016, 1, 0.9058824, 0, 1,
-1.036124, 0.6497589, 0.1379691, 1, 0.9137255, 0, 1,
-1.033334, -0.501665, -1.367465, 1, 0.9176471, 0, 1,
-1.031918, 0.295341, -2.263586, 1, 0.9254902, 0, 1,
-1.031334, 0.1431035, 0.2929317, 1, 0.9294118, 0, 1,
-1.028107, -1.078651, -3.865152, 1, 0.9372549, 0, 1,
-1.0262, 1.287243, 1.52814, 1, 0.9411765, 0, 1,
-1.020919, -0.29133, -3.233714, 1, 0.9490196, 0, 1,
-1.014978, -1.133052, -0.6000983, 1, 0.9529412, 0, 1,
-1.007811, -0.1103271, -2.768742, 1, 0.9607843, 0, 1,
-0.9995649, 0.4999615, -1.35058, 1, 0.9647059, 0, 1,
-0.9967807, -0.7754205, -4.628667, 1, 0.972549, 0, 1,
-0.9929971, 0.8934218, -1.346668, 1, 0.9764706, 0, 1,
-0.9919748, -1.250533, -1.832874, 1, 0.9843137, 0, 1,
-0.9881977, 1.257704, -0.4066174, 1, 0.9882353, 0, 1,
-0.9875897, -1.564016, -1.228085, 1, 0.9960784, 0, 1,
-0.983749, -0.5210326, -3.205771, 0.9960784, 1, 0, 1,
-0.9837475, -0.07370725, -1.435269, 0.9921569, 1, 0, 1,
-0.9833356, -1.953042, -1.432717, 0.9843137, 1, 0, 1,
-0.9824874, -0.7891046, -1.63255, 0.9803922, 1, 0, 1,
-0.979579, 0.2244022, -0.1935647, 0.972549, 1, 0, 1,
-0.9790344, -0.2388863, -2.553137, 0.9686275, 1, 0, 1,
-0.9743758, 0.384607, -3.21102, 0.9607843, 1, 0, 1,
-0.9605018, 1.687346, -0.2285197, 0.9568627, 1, 0, 1,
-0.955726, -0.2076864, -1.807218, 0.9490196, 1, 0, 1,
-0.950314, -0.4386927, -0.6918685, 0.945098, 1, 0, 1,
-0.9482206, -0.8339501, -1.741433, 0.9372549, 1, 0, 1,
-0.9420162, 2.124428, -0.3109457, 0.9333333, 1, 0, 1,
-0.9392307, -0.4431393, -0.3070166, 0.9254902, 1, 0, 1,
-0.9388964, 0.03991941, -2.256711, 0.9215686, 1, 0, 1,
-0.9345151, 0.7852176, -0.2596994, 0.9137255, 1, 0, 1,
-0.9295772, 1.11879, -0.8165268, 0.9098039, 1, 0, 1,
-0.9238834, 0.233879, -0.444154, 0.9019608, 1, 0, 1,
-0.918152, -0.2538681, -2.048166, 0.8941177, 1, 0, 1,
-0.9164745, -0.2185758, -2.085264, 0.8901961, 1, 0, 1,
-0.9118991, -0.999563, -3.783957, 0.8823529, 1, 0, 1,
-0.9072018, -0.9559205, -3.848428, 0.8784314, 1, 0, 1,
-0.9026254, 0.01114218, -1.040622, 0.8705882, 1, 0, 1,
-0.8894946, 2.430587, -0.01897125, 0.8666667, 1, 0, 1,
-0.8867433, 0.3408464, -0.04421448, 0.8588235, 1, 0, 1,
-0.8860025, -1.296181, -2.977006, 0.854902, 1, 0, 1,
-0.8747303, -1.643484, -2.16262, 0.8470588, 1, 0, 1,
-0.8745756, 1.488266, -0.762944, 0.8431373, 1, 0, 1,
-0.873845, -0.8980865, -3.545439, 0.8352941, 1, 0, 1,
-0.8734517, 0.714491, -2.395022, 0.8313726, 1, 0, 1,
-0.859803, 0.6858692, -0.05505506, 0.8235294, 1, 0, 1,
-0.8594502, -1.02893, -1.906213, 0.8196079, 1, 0, 1,
-0.8572272, -1.580166, -2.879291, 0.8117647, 1, 0, 1,
-0.85321, -1.449562, -2.85183, 0.8078431, 1, 0, 1,
-0.8529773, -0.6797805, -3.72336, 0.8, 1, 0, 1,
-0.8410199, -0.1936546, 0.2565057, 0.7921569, 1, 0, 1,
-0.839305, 1.317601, 0.4447008, 0.7882353, 1, 0, 1,
-0.8315691, -0.547984, -3.7835, 0.7803922, 1, 0, 1,
-0.8314226, 0.5289426, -2.076773, 0.7764706, 1, 0, 1,
-0.8291873, 1.997087, -1.756128, 0.7686275, 1, 0, 1,
-0.8286205, 0.5944437, 1.26241, 0.7647059, 1, 0, 1,
-0.8209006, 0.1241192, -0.9437898, 0.7568628, 1, 0, 1,
-0.8203266, -0.5241917, -3.071029, 0.7529412, 1, 0, 1,
-0.8130863, -1.12646, -2.727217, 0.7450981, 1, 0, 1,
-0.8048965, -0.5893995, -1.635918, 0.7411765, 1, 0, 1,
-0.7942253, -0.4534272, -1.849834, 0.7333333, 1, 0, 1,
-0.7872912, -1.529723, -1.386271, 0.7294118, 1, 0, 1,
-0.7852885, 0.7774739, 0.4343749, 0.7215686, 1, 0, 1,
-0.7719333, -0.04820479, -0.5506415, 0.7176471, 1, 0, 1,
-0.7662281, 1.868515, -0.7820104, 0.7098039, 1, 0, 1,
-0.7622137, -0.2805279, -3.081542, 0.7058824, 1, 0, 1,
-0.7423003, 1.201176, 0.4124863, 0.6980392, 1, 0, 1,
-0.7393354, -0.5453235, -2.582305, 0.6901961, 1, 0, 1,
-0.7328983, -0.4495598, -2.450532, 0.6862745, 1, 0, 1,
-0.732857, -1.177159, -1.463868, 0.6784314, 1, 0, 1,
-0.7318081, -0.8904547, -1.675073, 0.6745098, 1, 0, 1,
-0.7261101, -0.5495728, -1.708547, 0.6666667, 1, 0, 1,
-0.7254549, -0.2223247, -0.9542651, 0.6627451, 1, 0, 1,
-0.7241298, -0.5728591, -2.931486, 0.654902, 1, 0, 1,
-0.7223918, 1.09924, -1.607758, 0.6509804, 1, 0, 1,
-0.7202991, 0.2021599, 0.1129294, 0.6431373, 1, 0, 1,
-0.7146512, -2.37845, -0.3546537, 0.6392157, 1, 0, 1,
-0.7118921, 0.6283709, -2.372485, 0.6313726, 1, 0, 1,
-0.7115108, -1.212667, -2.127896, 0.627451, 1, 0, 1,
-0.7062044, 0.7358998, 0.2740903, 0.6196079, 1, 0, 1,
-0.705042, -0.5132158, -3.363759, 0.6156863, 1, 0, 1,
-0.6879765, -1.610318, -3.002795, 0.6078432, 1, 0, 1,
-0.686735, 0.5426062, 0.07385346, 0.6039216, 1, 0, 1,
-0.6845753, -0.531369, -2.590665, 0.5960785, 1, 0, 1,
-0.6786312, 0.6725713, -0.4442566, 0.5882353, 1, 0, 1,
-0.6779922, -1.253392, -3.621856, 0.5843138, 1, 0, 1,
-0.6778585, 0.3739639, -1.94079, 0.5764706, 1, 0, 1,
-0.6771608, -0.5683442, -0.7815515, 0.572549, 1, 0, 1,
-0.6738008, 0.5149875, -2.373202, 0.5647059, 1, 0, 1,
-0.6649339, 0.91073, -2.734932, 0.5607843, 1, 0, 1,
-0.6628778, -0.7067148, -0.5105941, 0.5529412, 1, 0, 1,
-0.6575229, -0.9874848, -3.681241, 0.5490196, 1, 0, 1,
-0.6535861, -1.407163, -4.760283, 0.5411765, 1, 0, 1,
-0.6535441, -0.8403071, -3.368734, 0.5372549, 1, 0, 1,
-0.6525781, 1.075915, -1.096937, 0.5294118, 1, 0, 1,
-0.6441887, -0.9832672, -3.957014, 0.5254902, 1, 0, 1,
-0.6434787, 0.05820125, -1.637726, 0.5176471, 1, 0, 1,
-0.6384549, -1.18265, -2.999684, 0.5137255, 1, 0, 1,
-0.6277955, 0.2326025, -0.9565434, 0.5058824, 1, 0, 1,
-0.6236455, -0.3943506, -0.9915263, 0.5019608, 1, 0, 1,
-0.6233403, -1.847776, -4.480874, 0.4941176, 1, 0, 1,
-0.6179214, -0.5793319, -2.63824, 0.4862745, 1, 0, 1,
-0.6112225, -1.004515, -2.846738, 0.4823529, 1, 0, 1,
-0.6086487, -0.8143064, -4.068641, 0.4745098, 1, 0, 1,
-0.6080313, -1.111068, -3.781072, 0.4705882, 1, 0, 1,
-0.6068692, -0.8670663, -2.149127, 0.4627451, 1, 0, 1,
-0.5936779, -0.6612341, -2.797048, 0.4588235, 1, 0, 1,
-0.5920244, -0.3475003, -2.405389, 0.4509804, 1, 0, 1,
-0.5861191, -1.312437, -2.401055, 0.4470588, 1, 0, 1,
-0.5846498, -1.018309, -3.532101, 0.4392157, 1, 0, 1,
-0.5821471, -0.2351853, -2.995352, 0.4352941, 1, 0, 1,
-0.5820179, 0.5615617, -1.579093, 0.427451, 1, 0, 1,
-0.5772456, 1.21349, -0.2591767, 0.4235294, 1, 0, 1,
-0.5766513, -0.2701879, -3.471638, 0.4156863, 1, 0, 1,
-0.5741414, -0.27175, -1.441038, 0.4117647, 1, 0, 1,
-0.5717217, -0.604943, -2.087495, 0.4039216, 1, 0, 1,
-0.5587899, -0.3890944, -4.353373, 0.3960784, 1, 0, 1,
-0.5582954, 1.619685, 0.2092395, 0.3921569, 1, 0, 1,
-0.557757, -1.521631, -1.381443, 0.3843137, 1, 0, 1,
-0.5574694, 1.030797, -0.3527623, 0.3803922, 1, 0, 1,
-0.5566017, -0.3547609, -3.370188, 0.372549, 1, 0, 1,
-0.5557577, 2.114077, 2.035565, 0.3686275, 1, 0, 1,
-0.5480696, 0.1907281, -2.863034, 0.3607843, 1, 0, 1,
-0.5469201, -0.6105835, -2.148496, 0.3568628, 1, 0, 1,
-0.5447894, 0.7769369, 1.037954, 0.3490196, 1, 0, 1,
-0.5442653, -0.01988925, -3.384089, 0.345098, 1, 0, 1,
-0.5412853, 0.2149462, -1.756949, 0.3372549, 1, 0, 1,
-0.5370488, 0.2632239, -2.266428, 0.3333333, 1, 0, 1,
-0.5363224, 1.455433, 0.5067981, 0.3254902, 1, 0, 1,
-0.5362777, 0.1317172, -4.370209, 0.3215686, 1, 0, 1,
-0.5329362, -0.3558438, -4.363421, 0.3137255, 1, 0, 1,
-0.5327191, -1.204939, -2.017478, 0.3098039, 1, 0, 1,
-0.5293924, 2.072632, -0.2933708, 0.3019608, 1, 0, 1,
-0.5271568, 0.6011482, -1.580424, 0.2941177, 1, 0, 1,
-0.5175136, -1.764753, -3.866225, 0.2901961, 1, 0, 1,
-0.5102103, -0.8613761, -0.4570827, 0.282353, 1, 0, 1,
-0.5075625, -2.20488, -3.430952, 0.2784314, 1, 0, 1,
-0.4991484, -0.9636425, -3.487926, 0.2705882, 1, 0, 1,
-0.495333, -0.1969877, -1.33238, 0.2666667, 1, 0, 1,
-0.4939529, 0.9411686, -1.367044, 0.2588235, 1, 0, 1,
-0.4926678, -1.989382, -3.555249, 0.254902, 1, 0, 1,
-0.4864056, 1.612642, -0.6435778, 0.2470588, 1, 0, 1,
-0.484745, 0.8255034, -0.7987972, 0.2431373, 1, 0, 1,
-0.4823729, -0.281365, -2.587908, 0.2352941, 1, 0, 1,
-0.4818652, -0.3605293, -2.767141, 0.2313726, 1, 0, 1,
-0.4815647, 0.3835205, -4.016069, 0.2235294, 1, 0, 1,
-0.4809881, 0.03461333, -1.417465, 0.2196078, 1, 0, 1,
-0.4778789, 1.459242, -0.8354025, 0.2117647, 1, 0, 1,
-0.4740191, -0.6587418, -2.910255, 0.2078431, 1, 0, 1,
-0.4722502, 1.27266, -1.063463, 0.2, 1, 0, 1,
-0.4711741, -0.08046948, -2.824018, 0.1921569, 1, 0, 1,
-0.4685806, 1.345033, 0.04989395, 0.1882353, 1, 0, 1,
-0.4634369, -1.664494, -2.458843, 0.1803922, 1, 0, 1,
-0.4621887, -1.253848, -1.334997, 0.1764706, 1, 0, 1,
-0.4601974, 0.4977623, 0.5839596, 0.1686275, 1, 0, 1,
-0.4588079, 0.464124, 1.079562, 0.1647059, 1, 0, 1,
-0.4548887, 0.2295295, -3.049212, 0.1568628, 1, 0, 1,
-0.4515634, -0.656133, -2.443368, 0.1529412, 1, 0, 1,
-0.4413809, -0.2505901, -2.102905, 0.145098, 1, 0, 1,
-0.435339, -0.7029471, -1.988289, 0.1411765, 1, 0, 1,
-0.4339473, -0.2192845, -1.838327, 0.1333333, 1, 0, 1,
-0.433276, 1.313801, -1.515237, 0.1294118, 1, 0, 1,
-0.4291612, 2.177598, -0.09824762, 0.1215686, 1, 0, 1,
-0.4290907, 1.957483, -1.185176, 0.1176471, 1, 0, 1,
-0.4275484, -0.002164184, -0.9629258, 0.1098039, 1, 0, 1,
-0.4254581, -0.8052008, -2.495298, 0.1058824, 1, 0, 1,
-0.4235113, 0.1790407, -2.694132, 0.09803922, 1, 0, 1,
-0.422765, -1.286354, -4.082817, 0.09019608, 1, 0, 1,
-0.4202997, -1.916512, -2.363545, 0.08627451, 1, 0, 1,
-0.4122409, -3.010326, -1.219645, 0.07843138, 1, 0, 1,
-0.4069288, 0.842279, 1.115224, 0.07450981, 1, 0, 1,
-0.4036029, 0.6963469, -0.7449141, 0.06666667, 1, 0, 1,
-0.4035135, -1.780048, -2.755085, 0.0627451, 1, 0, 1,
-0.403362, 0.2451044, -0.7813068, 0.05490196, 1, 0, 1,
-0.4007982, -0.0963646, -0.4922336, 0.05098039, 1, 0, 1,
-0.3993543, -0.8121564, -4.535552, 0.04313726, 1, 0, 1,
-0.398648, 0.1367034, -3.453536, 0.03921569, 1, 0, 1,
-0.3848189, 1.458712, 0.01134541, 0.03137255, 1, 0, 1,
-0.3819586, 0.3072126, 0.2835336, 0.02745098, 1, 0, 1,
-0.3803307, 0.4744551, -1.156618, 0.01960784, 1, 0, 1,
-0.3801141, 0.2960671, -2.408849, 0.01568628, 1, 0, 1,
-0.3774671, 0.3131934, -3.527997, 0.007843138, 1, 0, 1,
-0.3757211, -0.3717083, -3.105412, 0.003921569, 1, 0, 1,
-0.373692, 0.6768229, -0.3782148, 0, 1, 0.003921569, 1,
-0.3713957, -0.4257734, -2.692366, 0, 1, 0.01176471, 1,
-0.3690184, -0.304474, -2.748101, 0, 1, 0.01568628, 1,
-0.3685603, -0.3941818, -3.017543, 0, 1, 0.02352941, 1,
-0.3633308, -0.6162302, -2.236262, 0, 1, 0.02745098, 1,
-0.3609659, 0.4292091, -1.180437, 0, 1, 0.03529412, 1,
-0.3569556, 0.5883468, -2.18278, 0, 1, 0.03921569, 1,
-0.3470578, 0.6560718, -0.615683, 0, 1, 0.04705882, 1,
-0.3468276, 0.7491657, -0.845587, 0, 1, 0.05098039, 1,
-0.3426122, 0.265907, -1.469919, 0, 1, 0.05882353, 1,
-0.3424175, 1.221889, 0.2139263, 0, 1, 0.0627451, 1,
-0.3421448, -0.7941592, -2.67309, 0, 1, 0.07058824, 1,
-0.3405061, -2.316867, -3.077619, 0, 1, 0.07450981, 1,
-0.3305715, 0.3777619, -0.4658063, 0, 1, 0.08235294, 1,
-0.3286652, -0.8378569, -2.892868, 0, 1, 0.08627451, 1,
-0.3278584, -0.2464603, -3.527339, 0, 1, 0.09411765, 1,
-0.3269891, 1.707782, -0.8669194, 0, 1, 0.1019608, 1,
-0.3266471, 0.2430368, 0.9569707, 0, 1, 0.1058824, 1,
-0.3237564, 0.4724222, -2.999126, 0, 1, 0.1137255, 1,
-0.3219332, 0.5493771, -1.390089, 0, 1, 0.1176471, 1,
-0.3214557, 0.1728415, -0.4884463, 0, 1, 0.1254902, 1,
-0.3170478, 1.492537, 0.1614821, 0, 1, 0.1294118, 1,
-0.3146042, 1.678256, 0.3338606, 0, 1, 0.1372549, 1,
-0.3143014, 1.055577, -0.6685171, 0, 1, 0.1411765, 1,
-0.3121009, 0.03246014, -0.5837116, 0, 1, 0.1490196, 1,
-0.3090735, -0.8537289, -3.730459, 0, 1, 0.1529412, 1,
-0.3060501, 0.3104749, -0.3677993, 0, 1, 0.1607843, 1,
-0.3050894, 0.9668307, -1.32326, 0, 1, 0.1647059, 1,
-0.302701, -0.7296878, -2.19318, 0, 1, 0.172549, 1,
-0.3021708, -1.202277, -3.511024, 0, 1, 0.1764706, 1,
-0.3016779, -1.814713, -3.040321, 0, 1, 0.1843137, 1,
-0.2999716, 0.2921181, -2.265591, 0, 1, 0.1882353, 1,
-0.2997486, -0.9319589, -4.872599, 0, 1, 0.1960784, 1,
-0.2954784, 1.081317, -0.4734376, 0, 1, 0.2039216, 1,
-0.2909514, -0.6952122, -2.137226, 0, 1, 0.2078431, 1,
-0.289522, 0.6133472, 0.901299, 0, 1, 0.2156863, 1,
-0.2888967, 1.229479, -0.3785448, 0, 1, 0.2196078, 1,
-0.2877145, 0.655836, -1.216012, 0, 1, 0.227451, 1,
-0.2875869, -0.1474791, -0.9203543, 0, 1, 0.2313726, 1,
-0.2823511, -0.08142438, -1.075813, 0, 1, 0.2392157, 1,
-0.2773509, 0.2627007, -0.8655915, 0, 1, 0.2431373, 1,
-0.2754262, 1.2829, -0.3174004, 0, 1, 0.2509804, 1,
-0.2718326, -1.655558, -4.823162, 0, 1, 0.254902, 1,
-0.2718296, -0.855235, -1.627678, 0, 1, 0.2627451, 1,
-0.2717246, -0.1747772, -1.408617, 0, 1, 0.2666667, 1,
-0.2671429, 0.5984241, 0.413864, 0, 1, 0.2745098, 1,
-0.2625547, 0.4947841, -1.576302, 0, 1, 0.2784314, 1,
-0.2624482, 0.2580682, 0.6873066, 0, 1, 0.2862745, 1,
-0.2603227, -0.8448409, -1.925897, 0, 1, 0.2901961, 1,
-0.2563115, -1.529882, -3.624968, 0, 1, 0.2980392, 1,
-0.2553172, 0.5526136, -0.7900332, 0, 1, 0.3058824, 1,
-0.2519979, 1.892129, 1.038422, 0, 1, 0.3098039, 1,
-0.2518605, -1.113809, -2.674251, 0, 1, 0.3176471, 1,
-0.2494321, -0.7363689, -3.55215, 0, 1, 0.3215686, 1,
-0.2481297, -0.826659, -2.653835, 0, 1, 0.3294118, 1,
-0.2478524, -0.5451893, -3.285912, 0, 1, 0.3333333, 1,
-0.2474318, 1.117018, 0.1375919, 0, 1, 0.3411765, 1,
-0.2467248, -2.604995, -3.066317, 0, 1, 0.345098, 1,
-0.2416601, -0.2140498, -1.714582, 0, 1, 0.3529412, 1,
-0.23644, -0.6254722, -2.954115, 0, 1, 0.3568628, 1,
-0.2325073, 0.04475057, -1.169836, 0, 1, 0.3647059, 1,
-0.2320241, 0.1457956, -1.282589, 0, 1, 0.3686275, 1,
-0.2292095, 0.2225012, -0.51951, 0, 1, 0.3764706, 1,
-0.2261653, 0.8931093, -0.2440621, 0, 1, 0.3803922, 1,
-0.2257579, -0.3833798, -2.709299, 0, 1, 0.3882353, 1,
-0.2237389, -0.993437, -3.418241, 0, 1, 0.3921569, 1,
-0.2227521, 0.2674209, -1.218555, 0, 1, 0.4, 1,
-0.2215758, -1.711316, -2.810024, 0, 1, 0.4078431, 1,
-0.2208119, -1.71893, -3.197733, 0, 1, 0.4117647, 1,
-0.2204709, 0.7686857, -1.244619, 0, 1, 0.4196078, 1,
-0.2193792, -0.04040496, -0.8901206, 0, 1, 0.4235294, 1,
-0.2164271, 0.5424702, -0.8944449, 0, 1, 0.4313726, 1,
-0.2153295, -0.1666097, -1.64368, 0, 1, 0.4352941, 1,
-0.2151308, 1.342799, 0.7072809, 0, 1, 0.4431373, 1,
-0.2142957, -0.3865313, -4.378852, 0, 1, 0.4470588, 1,
-0.2133567, 1.894736, -0.3323185, 0, 1, 0.454902, 1,
-0.2117875, 0.4982731, 0.8379375, 0, 1, 0.4588235, 1,
-0.2093965, 0.1885622, -1.565202, 0, 1, 0.4666667, 1,
-0.2090495, -0.3812188, -3.12402, 0, 1, 0.4705882, 1,
-0.2088014, -0.1420483, -1.733968, 0, 1, 0.4784314, 1,
-0.2010927, 0.8252746, -0.830996, 0, 1, 0.4823529, 1,
-0.1916683, -0.6622642, -3.853007, 0, 1, 0.4901961, 1,
-0.1900063, 0.4804995, -1.751952, 0, 1, 0.4941176, 1,
-0.1890509, -0.4374876, -4.042946, 0, 1, 0.5019608, 1,
-0.1867216, 0.8938758, 1.791172, 0, 1, 0.509804, 1,
-0.1861351, -0.1804947, -3.231713, 0, 1, 0.5137255, 1,
-0.1860413, 0.02745166, -2.0463, 0, 1, 0.5215687, 1,
-0.1857343, 0.6739315, -0.3575337, 0, 1, 0.5254902, 1,
-0.1854588, -2.002883, -2.911477, 0, 1, 0.5333334, 1,
-0.1831752, -0.6096921, -1.507684, 0, 1, 0.5372549, 1,
-0.1775822, 0.6945175, -0.03004027, 0, 1, 0.5450981, 1,
-0.1750978, -0.7474989, -3.507072, 0, 1, 0.5490196, 1,
-0.1711296, 0.2194268, 0.3973915, 0, 1, 0.5568628, 1,
-0.1707579, 0.4209256, -1.4136, 0, 1, 0.5607843, 1,
-0.1619968, -1.241129, -2.991083, 0, 1, 0.5686275, 1,
-0.1595336, 0.1044488, -1.526544, 0, 1, 0.572549, 1,
-0.1584728, -0.2743715, -2.450927, 0, 1, 0.5803922, 1,
-0.157136, 1.324124, -0.6547713, 0, 1, 0.5843138, 1,
-0.1555573, 0.5930043, -0.02912867, 0, 1, 0.5921569, 1,
-0.1504166, -2.165263, -1.784773, 0, 1, 0.5960785, 1,
-0.1465489, -0.06774095, -3.063174, 0, 1, 0.6039216, 1,
-0.1462611, 1.982367, 0.1770243, 0, 1, 0.6117647, 1,
-0.1449612, -1.173549, -0.7624145, 0, 1, 0.6156863, 1,
-0.1446518, 0.8746041, 1.064324, 0, 1, 0.6235294, 1,
-0.1427639, 0.5889592, 1.56722, 0, 1, 0.627451, 1,
-0.1329293, 1.591934, -0.2507435, 0, 1, 0.6352941, 1,
-0.1325232, -0.2388564, -2.851565, 0, 1, 0.6392157, 1,
-0.1318067, -2.108844, -4.105463, 0, 1, 0.6470588, 1,
-0.1283594, 0.7650462, -1.317666, 0, 1, 0.6509804, 1,
-0.1242776, 0.4477645, -1.727217, 0, 1, 0.6588235, 1,
-0.1185256, 1.110988, -1.055107, 0, 1, 0.6627451, 1,
-0.1184901, -0.9005579, -2.227938, 0, 1, 0.6705883, 1,
-0.116914, -1.376117, -1.717429, 0, 1, 0.6745098, 1,
-0.1121965, 0.03002408, -0.5264056, 0, 1, 0.682353, 1,
-0.1087672, 0.1315733, -3.149408, 0, 1, 0.6862745, 1,
-0.1080827, 1.020243, -2.11409, 0, 1, 0.6941177, 1,
-0.1054981, 0.6186197, 1.565595, 0, 1, 0.7019608, 1,
-0.1030637, 0.9213314, 0.3874998, 0, 1, 0.7058824, 1,
-0.1025535, -0.5130836, -3.095237, 0, 1, 0.7137255, 1,
-0.1008907, 0.8370108, 0.8994117, 0, 1, 0.7176471, 1,
-0.09629387, -0.925166, -3.007845, 0, 1, 0.7254902, 1,
-0.09608414, -0.2239876, -2.527228, 0, 1, 0.7294118, 1,
-0.09316407, -1.357463, -3.603114, 0, 1, 0.7372549, 1,
-0.09021687, 0.1242913, 1.827523, 0, 1, 0.7411765, 1,
-0.08968591, 1.064606, -0.4509849, 0, 1, 0.7490196, 1,
-0.08859654, -0.1900534, -2.848155, 0, 1, 0.7529412, 1,
-0.0885084, 0.6058807, -1.612741, 0, 1, 0.7607843, 1,
-0.08622687, -0.001459989, -0.8498771, 0, 1, 0.7647059, 1,
-0.08506368, 0.6748201, -0.5100371, 0, 1, 0.772549, 1,
-0.08330744, -1.889436, -3.256178, 0, 1, 0.7764706, 1,
-0.08308459, 1.523766, 0.5066006, 0, 1, 0.7843137, 1,
-0.08073961, 1.992265, -0.579915, 0, 1, 0.7882353, 1,
-0.08003704, -1.037964, -3.645325, 0, 1, 0.7960784, 1,
-0.07852861, -0.4943667, -3.7204, 0, 1, 0.8039216, 1,
-0.0759198, -0.153937, -2.899777, 0, 1, 0.8078431, 1,
-0.075634, 1.465693, 1.292679, 0, 1, 0.8156863, 1,
-0.0744143, -0.2275976, -2.793547, 0, 1, 0.8196079, 1,
-0.07402142, -2.663394, -2.09853, 0, 1, 0.827451, 1,
-0.07315169, 1.100335, -0.1413323, 0, 1, 0.8313726, 1,
-0.07040064, -0.4102394, -1.701731, 0, 1, 0.8392157, 1,
-0.06586054, -0.3534348, -1.149403, 0, 1, 0.8431373, 1,
-0.06574935, 0.5976034, 0.2986848, 0, 1, 0.8509804, 1,
-0.05988467, -0.04252328, -1.96767, 0, 1, 0.854902, 1,
-0.05730327, 0.2368728, 0.935642, 0, 1, 0.8627451, 1,
-0.05683082, 1.360046, 1.426911, 0, 1, 0.8666667, 1,
-0.05629582, 0.4146093, 1.150584, 0, 1, 0.8745098, 1,
-0.05548763, 0.7661023, -1.3964, 0, 1, 0.8784314, 1,
-0.05087506, -0.7761982, -3.462782, 0, 1, 0.8862745, 1,
-0.04883908, -0.6033528, -4.142245, 0, 1, 0.8901961, 1,
-0.04696294, 0.8014836, -0.7957259, 0, 1, 0.8980392, 1,
-0.04639381, -1.161336, -0.4788377, 0, 1, 0.9058824, 1,
-0.04558713, -1.398765, -3.793854, 0, 1, 0.9098039, 1,
-0.04327938, 0.08480485, -0.6729051, 0, 1, 0.9176471, 1,
-0.0420933, -0.6400291, -3.606567, 0, 1, 0.9215686, 1,
-0.04109273, 0.9531773, -0.152146, 0, 1, 0.9294118, 1,
-0.03999452, -1.016917, -3.969197, 0, 1, 0.9333333, 1,
-0.03193413, 0.1270143, -1.19063, 0, 1, 0.9411765, 1,
-0.03166291, -0.4983879, -2.695345, 0, 1, 0.945098, 1,
-0.03115068, 0.1384174, 1.311529, 0, 1, 0.9529412, 1,
-0.02431247, 0.5855286, -1.016054, 0, 1, 0.9568627, 1,
-0.02413192, -0.2292578, -4.890789, 0, 1, 0.9647059, 1,
-0.02283917, -1.79055, -2.273785, 0, 1, 0.9686275, 1,
-0.01969816, -0.2935344, -3.926028, 0, 1, 0.9764706, 1,
-0.01858542, -0.1952413, -4.031332, 0, 1, 0.9803922, 1,
-0.01708917, -0.7167919, -1.406697, 0, 1, 0.9882353, 1,
-0.01592935, 1.867792, -0.3457508, 0, 1, 0.9921569, 1,
-0.01395925, -0.1494749, -3.053334, 0, 1, 1, 1,
-0.01048913, 0.6407297, -1.412169, 0, 0.9921569, 1, 1,
-0.009263445, -0.09256803, -4.364934, 0, 0.9882353, 1, 1,
-0.00413978, 2.071537, 1.078891, 0, 0.9803922, 1, 1,
-0.00148525, -1.99505, -4.486554, 0, 0.9764706, 1, 1,
2.830426e-05, -0.08835048, 1.454843, 0, 0.9686275, 1, 1,
0.003733607, 0.2060558, 2.065639, 0, 0.9647059, 1, 1,
0.004135536, 0.1994566, 0.3772359, 0, 0.9568627, 1, 1,
0.006563196, 0.8301895, -1.283624, 0, 0.9529412, 1, 1,
0.007263724, -0.09944919, 3.072999, 0, 0.945098, 1, 1,
0.009211574, -0.706421, 3.145874, 0, 0.9411765, 1, 1,
0.01214057, -1.399781, 1.990715, 0, 0.9333333, 1, 1,
0.01427044, 0.4392221, 0.2565692, 0, 0.9294118, 1, 1,
0.01528882, 0.9500243, -1.22148, 0, 0.9215686, 1, 1,
0.01730926, 0.7567136, 0.087758, 0, 0.9176471, 1, 1,
0.01971666, 2.71305, -0.5372291, 0, 0.9098039, 1, 1,
0.02199363, 0.7578859, 0.8483419, 0, 0.9058824, 1, 1,
0.02708548, 1.694343, 0.3185307, 0, 0.8980392, 1, 1,
0.0275748, -0.06195382, 2.929381, 0, 0.8901961, 1, 1,
0.0386913, 0.7122219, 0.5436854, 0, 0.8862745, 1, 1,
0.0410699, 0.04741927, 0.572426, 0, 0.8784314, 1, 1,
0.04404689, 1.433295, -1.736117, 0, 0.8745098, 1, 1,
0.04659262, -0.7455727, 3.056168, 0, 0.8666667, 1, 1,
0.04707989, -1.446817, 3.204783, 0, 0.8627451, 1, 1,
0.04711355, 0.6798963, 0.259111, 0, 0.854902, 1, 1,
0.04763405, -0.1720056, 2.16151, 0, 0.8509804, 1, 1,
0.04862214, 0.1877732, 0.6803094, 0, 0.8431373, 1, 1,
0.04875675, 0.9940982, -0.8080609, 0, 0.8392157, 1, 1,
0.04976519, 0.1892526, 1.007316, 0, 0.8313726, 1, 1,
0.05084849, -0.06397491, 1.791736, 0, 0.827451, 1, 1,
0.05510343, -0.2813231, 3.778537, 0, 0.8196079, 1, 1,
0.05913042, 1.976699, -0.6202515, 0, 0.8156863, 1, 1,
0.07031948, 1.426855, 1.248197, 0, 0.8078431, 1, 1,
0.07042447, -0.8136652, 3.319915, 0, 0.8039216, 1, 1,
0.07154839, 0.9723217, -0.5903029, 0, 0.7960784, 1, 1,
0.07456283, -0.1169716, 1.568501, 0, 0.7882353, 1, 1,
0.07696851, 1.484618, -0.8643026, 0, 0.7843137, 1, 1,
0.07790682, 0.3167114, -0.112947, 0, 0.7764706, 1, 1,
0.07857853, 0.5897991, -1.136722, 0, 0.772549, 1, 1,
0.07935485, -0.2809597, 2.804165, 0, 0.7647059, 1, 1,
0.07982625, 0.3791419, 2.558721, 0, 0.7607843, 1, 1,
0.08652865, -0.1961437, 2.741548, 0, 0.7529412, 1, 1,
0.08725967, -1.001957, 3.684705, 0, 0.7490196, 1, 1,
0.08834759, -0.7947559, 3.346014, 0, 0.7411765, 1, 1,
0.09623262, 0.9872156, -0.1214272, 0, 0.7372549, 1, 1,
0.09834024, 1.859468, -1.765818, 0, 0.7294118, 1, 1,
0.1024103, -1.15474, 2.588797, 0, 0.7254902, 1, 1,
0.1044679, -0.5057843, 1.890486, 0, 0.7176471, 1, 1,
0.1074555, -1.109066, 3.671572, 0, 0.7137255, 1, 1,
0.1078748, -1.973243, 3.275687, 0, 0.7058824, 1, 1,
0.1099548, 0.2282352, 2.116363, 0, 0.6980392, 1, 1,
0.1129519, 1.97366, 1.073343, 0, 0.6941177, 1, 1,
0.1137659, 0.5417472, 0.01005409, 0, 0.6862745, 1, 1,
0.1183647, 0.851759, 0.6086419, 0, 0.682353, 1, 1,
0.1214309, 0.004910728, 1.974284, 0, 0.6745098, 1, 1,
0.1248237, -0.6284218, 4.466167, 0, 0.6705883, 1, 1,
0.1284921, 0.1339819, 0.6880747, 0, 0.6627451, 1, 1,
0.1306088, -0.7012668, 2.849757, 0, 0.6588235, 1, 1,
0.1322864, -1.011388, 3.027829, 0, 0.6509804, 1, 1,
0.1357424, 1.18521, 0.2390082, 0, 0.6470588, 1, 1,
0.1368607, -0.5186861, 2.505655, 0, 0.6392157, 1, 1,
0.1375793, -0.05541117, 2.20415, 0, 0.6352941, 1, 1,
0.138385, -1.155637, 4.674284, 0, 0.627451, 1, 1,
0.1424991, 0.8697788, -0.6141077, 0, 0.6235294, 1, 1,
0.1451991, 0.2545648, 1.268904, 0, 0.6156863, 1, 1,
0.1486278, -0.6267647, 3.100856, 0, 0.6117647, 1, 1,
0.1518701, 1.257255, 1.147089, 0, 0.6039216, 1, 1,
0.1540671, 0.1023131, 1.908185, 0, 0.5960785, 1, 1,
0.1619622, 0.08793271, 1.922206, 0, 0.5921569, 1, 1,
0.1625996, -1.038189, 3.082957, 0, 0.5843138, 1, 1,
0.1686781, -1.743028, 2.979759, 0, 0.5803922, 1, 1,
0.1692059, 1.199324, 0.4902959, 0, 0.572549, 1, 1,
0.1696173, 1.201425, -0.7058412, 0, 0.5686275, 1, 1,
0.1706642, -0.1228779, 0.6346965, 0, 0.5607843, 1, 1,
0.1708453, 0.1641973, 0.378545, 0, 0.5568628, 1, 1,
0.1715187, -0.4158172, 3.710127, 0, 0.5490196, 1, 1,
0.1731506, 1.036828, -1.62746, 0, 0.5450981, 1, 1,
0.1736533, 2.330768, 1.067999, 0, 0.5372549, 1, 1,
0.1811406, -0.622989, 1.493969, 0, 0.5333334, 1, 1,
0.1818618, -0.4828344, 3.82986, 0, 0.5254902, 1, 1,
0.1860873, -1.03735, 2.561396, 0, 0.5215687, 1, 1,
0.1928, -0.2030158, 5.301752, 0, 0.5137255, 1, 1,
0.1954326, -1.700163, 1.659041, 0, 0.509804, 1, 1,
0.1991678, -1.434915, 4.400023, 0, 0.5019608, 1, 1,
0.2013955, -1.091441, 2.910845, 0, 0.4941176, 1, 1,
0.2020723, 0.9881303, -0.4478831, 0, 0.4901961, 1, 1,
0.2021707, 1.075187, 0.1525468, 0, 0.4823529, 1, 1,
0.2040696, 0.5246311, 0.7442856, 0, 0.4784314, 1, 1,
0.208511, -0.06597257, 2.905518, 0, 0.4705882, 1, 1,
0.2250458, 0.495656, -0.7990763, 0, 0.4666667, 1, 1,
0.2259359, 2.110189, 0.3950163, 0, 0.4588235, 1, 1,
0.2285276, -0.123729, 2.253985, 0, 0.454902, 1, 1,
0.2296329, -0.3615589, 2.057322, 0, 0.4470588, 1, 1,
0.233625, 2.029298, 0.2222388, 0, 0.4431373, 1, 1,
0.2345534, 0.6408206, -0.1005825, 0, 0.4352941, 1, 1,
0.2359171, 0.9162163, -1.610743, 0, 0.4313726, 1, 1,
0.2376261, 0.780849, 0.9761578, 0, 0.4235294, 1, 1,
0.2419909, -1.6399, 3.781318, 0, 0.4196078, 1, 1,
0.2461832, -1.083472, 2.065537, 0, 0.4117647, 1, 1,
0.2465387, 1.067759, 0.796008, 0, 0.4078431, 1, 1,
0.246882, -1.132021, 3.048992, 0, 0.4, 1, 1,
0.248356, 0.04780665, 2.359476, 0, 0.3921569, 1, 1,
0.2569422, 0.1301238, 2.735333, 0, 0.3882353, 1, 1,
0.2578562, -0.6679046, 2.176843, 0, 0.3803922, 1, 1,
0.259515, 0.08329798, 0.9685642, 0, 0.3764706, 1, 1,
0.2599259, 0.4216447, -1.497175, 0, 0.3686275, 1, 1,
0.2658694, 2.194159, -0.744001, 0, 0.3647059, 1, 1,
0.2757576, -2.997763, 3.124282, 0, 0.3568628, 1, 1,
0.2786122, -0.6390108, 0.9967346, 0, 0.3529412, 1, 1,
0.2798041, -1.837483, 5.07518, 0, 0.345098, 1, 1,
0.2838031, -1.984757, 1.995221, 0, 0.3411765, 1, 1,
0.284409, 0.1219611, 1.074669, 0, 0.3333333, 1, 1,
0.28519, -0.08427705, 2.048654, 0, 0.3294118, 1, 1,
0.286447, 0.007620083, 1.746585, 0, 0.3215686, 1, 1,
0.2874556, -1.112231, 3.58177, 0, 0.3176471, 1, 1,
0.2908221, 0.2976614, -0.6851221, 0, 0.3098039, 1, 1,
0.292767, 0.4507063, 0.9333192, 0, 0.3058824, 1, 1,
0.2948665, -1.927882, 2.230103, 0, 0.2980392, 1, 1,
0.2952778, 0.3003212, 0.06155534, 0, 0.2901961, 1, 1,
0.2972454, -0.1830103, 1.86516, 0, 0.2862745, 1, 1,
0.2993407, -0.0593364, 0.7084634, 0, 0.2784314, 1, 1,
0.3003819, -0.618025, 3.211978, 0, 0.2745098, 1, 1,
0.3015107, 0.1950093, 0.4896056, 0, 0.2666667, 1, 1,
0.3056366, 0.9909969, -1.741939, 0, 0.2627451, 1, 1,
0.306965, -0.688484, 4.831393, 0, 0.254902, 1, 1,
0.312481, 0.2831373, 2.707138, 0, 0.2509804, 1, 1,
0.3155943, 0.8968737, 0.646073, 0, 0.2431373, 1, 1,
0.3157199, 0.5494319, 0.9098345, 0, 0.2392157, 1, 1,
0.3180521, 0.411075, 2.662137, 0, 0.2313726, 1, 1,
0.3188506, -0.2321236, 1.211017, 0, 0.227451, 1, 1,
0.321158, -1.13114, 1.492514, 0, 0.2196078, 1, 1,
0.3237806, 0.8592988, -0.3927518, 0, 0.2156863, 1, 1,
0.326578, 1.180392, -1.985715, 0, 0.2078431, 1, 1,
0.3268017, -0.0571338, 1.190163, 0, 0.2039216, 1, 1,
0.3282737, -0.4837747, 3.31423, 0, 0.1960784, 1, 1,
0.3311496, -0.9980288, 0.7356907, 0, 0.1882353, 1, 1,
0.3324572, 0.5739027, 1.257884, 0, 0.1843137, 1, 1,
0.3348601, 0.3948953, 1.573811, 0, 0.1764706, 1, 1,
0.3369184, 0.09472186, 1.119757, 0, 0.172549, 1, 1,
0.3443489, -0.1680297, 2.971089, 0, 0.1647059, 1, 1,
0.3483696, -0.2316345, 3.372481, 0, 0.1607843, 1, 1,
0.350468, 0.8179096, 0.5862834, 0, 0.1529412, 1, 1,
0.354437, 0.2755871, 2.863225, 0, 0.1490196, 1, 1,
0.3560831, 0.4099324, 0.04505219, 0, 0.1411765, 1, 1,
0.357205, 1.283663, 1.375948, 0, 0.1372549, 1, 1,
0.3631391, 0.3210594, 0.6855438, 0, 0.1294118, 1, 1,
0.3635589, -0.897653, 3.490318, 0, 0.1254902, 1, 1,
0.3658013, 0.4559753, 1.130421, 0, 0.1176471, 1, 1,
0.370888, 0.2888213, -0.5968841, 0, 0.1137255, 1, 1,
0.3720128, -0.562187, 4.91056, 0, 0.1058824, 1, 1,
0.3744567, 0.4206451, 1.474728, 0, 0.09803922, 1, 1,
0.3748922, 0.9232885, -1.52249, 0, 0.09411765, 1, 1,
0.3752248, 0.1427798, -0.1714715, 0, 0.08627451, 1, 1,
0.3795587, 0.991756, -0.9199017, 0, 0.08235294, 1, 1,
0.381878, 2.195095, 0.1692956, 0, 0.07450981, 1, 1,
0.3853736, 0.1527423, 0.9206994, 0, 0.07058824, 1, 1,
0.3888292, -0.2162797, 0.7036788, 0, 0.0627451, 1, 1,
0.392852, 0.6595932, 0.9522222, 0, 0.05882353, 1, 1,
0.3966654, 0.6626436, 1.253588, 0, 0.05098039, 1, 1,
0.4003068, -2.483209, 4.972176, 0, 0.04705882, 1, 1,
0.4005694, -1.63986, 1.830866, 0, 0.03921569, 1, 1,
0.4057126, 1.137517, 1.204211, 0, 0.03529412, 1, 1,
0.4074873, -2.278705, 2.294779, 0, 0.02745098, 1, 1,
0.4198428, 1.559633, -0.5183123, 0, 0.02352941, 1, 1,
0.4271775, -0.2785732, 3.904685, 0, 0.01568628, 1, 1,
0.4274136, -1.021031, 2.34529, 0, 0.01176471, 1, 1,
0.435493, -0.1324541, 1.443738, 0, 0.003921569, 1, 1,
0.4388797, -1.297821, 4.511031, 0.003921569, 0, 1, 1,
0.4404648, 0.1681004, 0.4814342, 0.007843138, 0, 1, 1,
0.449806, -1.014196, 2.519996, 0.01568628, 0, 1, 1,
0.4571238, -0.9241387, 2.021596, 0.01960784, 0, 1, 1,
0.4614532, 0.450105, 0.5985444, 0.02745098, 0, 1, 1,
0.4617067, -1.72756, 1.06336, 0.03137255, 0, 1, 1,
0.4634162, 1.240031, 0.6774147, 0.03921569, 0, 1, 1,
0.4650273, -0.6963193, 1.320426, 0.04313726, 0, 1, 1,
0.465311, 0.08162111, 3.515018, 0.05098039, 0, 1, 1,
0.465739, 1.269084, 0.3079408, 0.05490196, 0, 1, 1,
0.4683388, 0.6890437, 0.5674286, 0.0627451, 0, 1, 1,
0.469474, 1.082857, 2.070356, 0.06666667, 0, 1, 1,
0.4716364, 0.8326825, -0.3488075, 0.07450981, 0, 1, 1,
0.4772266, 0.285641, 2.871379, 0.07843138, 0, 1, 1,
0.4781071, 0.38709, -0.5527264, 0.08627451, 0, 1, 1,
0.4806627, -0.694735, 0.7233182, 0.09019608, 0, 1, 1,
0.481943, 0.5522962, 1.458104, 0.09803922, 0, 1, 1,
0.4835258, 0.3229942, -1.503619, 0.1058824, 0, 1, 1,
0.4847417, 0.9129687, -0.6753526, 0.1098039, 0, 1, 1,
0.4877705, -1.225377, 5.418649, 0.1176471, 0, 1, 1,
0.4892877, 1.157041, 1.120365, 0.1215686, 0, 1, 1,
0.4896154, 0.2810718, 0.4521627, 0.1294118, 0, 1, 1,
0.4913695, -0.4624505, 2.133394, 0.1333333, 0, 1, 1,
0.4934532, 1.048799, 1.161537, 0.1411765, 0, 1, 1,
0.4960878, -1.697584, 1.985232, 0.145098, 0, 1, 1,
0.4985015, 0.6071907, 2.677258, 0.1529412, 0, 1, 1,
0.498531, -1.649198, 2.056603, 0.1568628, 0, 1, 1,
0.4989289, 2.400319, -1.944542, 0.1647059, 0, 1, 1,
0.5000306, -0.2021993, 2.892522, 0.1686275, 0, 1, 1,
0.5007985, -0.1978389, 1.783445, 0.1764706, 0, 1, 1,
0.5014544, -1.284545, 4.105488, 0.1803922, 0, 1, 1,
0.5042313, -0.7068613, 4.035684, 0.1882353, 0, 1, 1,
0.50757, -0.4654439, 3.450491, 0.1921569, 0, 1, 1,
0.5102457, 0.02375355, 1.212832, 0.2, 0, 1, 1,
0.5109411, -1.72758, 1.603226, 0.2078431, 0, 1, 1,
0.5111801, 0.4240161, 2.500837, 0.2117647, 0, 1, 1,
0.5123942, -0.3579323, 2.045543, 0.2196078, 0, 1, 1,
0.5144144, -2.068195, 1.612776, 0.2235294, 0, 1, 1,
0.5158189, -0.8618925, 1.235427, 0.2313726, 0, 1, 1,
0.5192376, -0.8350115, 2.350549, 0.2352941, 0, 1, 1,
0.5220796, -1.299883, 3.037981, 0.2431373, 0, 1, 1,
0.5277655, 2.008956, -0.8029116, 0.2470588, 0, 1, 1,
0.5309218, -1.381461, 2.220957, 0.254902, 0, 1, 1,
0.5361565, -1.120563, 1.69585, 0.2588235, 0, 1, 1,
0.5390509, 1.174857, -0.5695484, 0.2666667, 0, 1, 1,
0.5515007, 0.9475469, 1.559668, 0.2705882, 0, 1, 1,
0.5525428, 0.8132423, 2.899887, 0.2784314, 0, 1, 1,
0.561302, -0.3541523, 1.791932, 0.282353, 0, 1, 1,
0.5641448, -0.6957979, 2.379424, 0.2901961, 0, 1, 1,
0.567771, -0.4316725, 2.189335, 0.2941177, 0, 1, 1,
0.5706834, 1.223089, 1.123551, 0.3019608, 0, 1, 1,
0.5714768, -0.1254236, 1.823047, 0.3098039, 0, 1, 1,
0.5754206, 0.7631008, 0.7161987, 0.3137255, 0, 1, 1,
0.5771046, -1.065367, 1.971044, 0.3215686, 0, 1, 1,
0.5819345, 1.48738, -1.021488, 0.3254902, 0, 1, 1,
0.5831261, -0.7809059, 2.60018, 0.3333333, 0, 1, 1,
0.5895091, 0.7297658, 0.5766054, 0.3372549, 0, 1, 1,
0.5910138, 0.3208314, 0.6542224, 0.345098, 0, 1, 1,
0.5984048, 0.2058384, 0.6478018, 0.3490196, 0, 1, 1,
0.6005898, -1.534993, 3.109382, 0.3568628, 0, 1, 1,
0.6032657, 1.060187, 0.9151345, 0.3607843, 0, 1, 1,
0.6083669, -0.7119473, 2.164648, 0.3686275, 0, 1, 1,
0.6116701, 0.7903086, -0.610393, 0.372549, 0, 1, 1,
0.6127069, 0.4187741, 0.6407635, 0.3803922, 0, 1, 1,
0.6170301, 0.6043445, 1.580001, 0.3843137, 0, 1, 1,
0.6176751, -0.1443067, 2.092038, 0.3921569, 0, 1, 1,
0.6180782, 0.1307838, 1.482817, 0.3960784, 0, 1, 1,
0.6187312, 0.3339547, 1.128334, 0.4039216, 0, 1, 1,
0.6194075, 1.101675, -0.8660304, 0.4117647, 0, 1, 1,
0.6297835, -1.502516, 2.714248, 0.4156863, 0, 1, 1,
0.6307988, -0.4170469, 2.795101, 0.4235294, 0, 1, 1,
0.6309883, 0.07161007, 0.07297923, 0.427451, 0, 1, 1,
0.6351463, 0.6970066, 1.697507, 0.4352941, 0, 1, 1,
0.6403459, 1.310546, 0.1804986, 0.4392157, 0, 1, 1,
0.6549475, 1.175131, 0.7085896, 0.4470588, 0, 1, 1,
0.6563999, 1.489284, 0.3468765, 0.4509804, 0, 1, 1,
0.6585516, -0.2491445, 2.196378, 0.4588235, 0, 1, 1,
0.6717483, 0.7546746, 1.379237, 0.4627451, 0, 1, 1,
0.6724776, 0.15526, -0.5091366, 0.4705882, 0, 1, 1,
0.6734369, 0.03606619, 0.2745096, 0.4745098, 0, 1, 1,
0.6747028, -0.1656671, 0.3895681, 0.4823529, 0, 1, 1,
0.6785768, 0.6752691, 1.437837, 0.4862745, 0, 1, 1,
0.6794849, -0.1786649, 2.56738, 0.4941176, 0, 1, 1,
0.6814619, -0.2241532, 3.415915, 0.5019608, 0, 1, 1,
0.6836991, 1.518885, -0.02943586, 0.5058824, 0, 1, 1,
0.6842934, -1.387946, 3.098879, 0.5137255, 0, 1, 1,
0.6848888, 0.141052, 1.12904, 0.5176471, 0, 1, 1,
0.6867672, 1.525968, 1.384718, 0.5254902, 0, 1, 1,
0.6907437, 0.06059092, 1.212205, 0.5294118, 0, 1, 1,
0.6936843, 0.3380743, 1.347057, 0.5372549, 0, 1, 1,
0.6964478, -0.8293732, 1.975827, 0.5411765, 0, 1, 1,
0.6999061, -1.439223, 3.307587, 0.5490196, 0, 1, 1,
0.7047699, 1.803413, 0.7349761, 0.5529412, 0, 1, 1,
0.7111971, -0.03071419, 1.655487, 0.5607843, 0, 1, 1,
0.7231882, 0.5897885, -0.6938673, 0.5647059, 0, 1, 1,
0.7251505, 0.5491908, 2.195914, 0.572549, 0, 1, 1,
0.7259443, -0.3090684, 3.01323, 0.5764706, 0, 1, 1,
0.7278094, -0.6577836, 3.586232, 0.5843138, 0, 1, 1,
0.7297217, 1.71691, -0.7663951, 0.5882353, 0, 1, 1,
0.7340683, -0.2622186, 1.779438, 0.5960785, 0, 1, 1,
0.7344524, -0.909057, 2.471657, 0.6039216, 0, 1, 1,
0.7373413, -1.819422, 0.1225655, 0.6078432, 0, 1, 1,
0.7440799, -0.02644104, 2.030021, 0.6156863, 0, 1, 1,
0.7562572, -0.564301, 1.963401, 0.6196079, 0, 1, 1,
0.758569, 0.5893781, 0.9296088, 0.627451, 0, 1, 1,
0.7660003, 0.1320092, 1.743869, 0.6313726, 0, 1, 1,
0.7669467, -0.5552619, 2.846033, 0.6392157, 0, 1, 1,
0.7735542, -0.8613804, 3.282328, 0.6431373, 0, 1, 1,
0.7758862, -0.4285875, 0.1102699, 0.6509804, 0, 1, 1,
0.7816017, 0.1416829, 0.09451487, 0.654902, 0, 1, 1,
0.7882057, -0.1257808, 2.87016, 0.6627451, 0, 1, 1,
0.7920579, -0.1232949, 1.205267, 0.6666667, 0, 1, 1,
0.7926026, -0.4406741, 2.171696, 0.6745098, 0, 1, 1,
0.7946386, 0.09405432, 1.707094, 0.6784314, 0, 1, 1,
0.7983288, 0.4968557, 1.589784, 0.6862745, 0, 1, 1,
0.8007001, -0.1266473, 2.453035, 0.6901961, 0, 1, 1,
0.8032434, 0.2864095, 0.9883621, 0.6980392, 0, 1, 1,
0.8048331, -1.030619, 2.264106, 0.7058824, 0, 1, 1,
0.8062057, -0.0851171, 1.041612, 0.7098039, 0, 1, 1,
0.8081183, -0.8754286, 1.527478, 0.7176471, 0, 1, 1,
0.8151749, 0.9797691, 0.3617683, 0.7215686, 0, 1, 1,
0.8152396, 0.3818053, -1.006417, 0.7294118, 0, 1, 1,
0.8210582, 2.547263, -1.582032, 0.7333333, 0, 1, 1,
0.8210765, -1.999619, 3.070756, 0.7411765, 0, 1, 1,
0.8219042, -1.357939, 3.68949, 0.7450981, 0, 1, 1,
0.822152, -0.5205934, 3.023117, 0.7529412, 0, 1, 1,
0.8257743, -1.24756, 2.493165, 0.7568628, 0, 1, 1,
0.8296668, -2.111077, 1.953981, 0.7647059, 0, 1, 1,
0.8311486, -0.09449929, 3.110002, 0.7686275, 0, 1, 1,
0.8322459, 0.3939995, -1.023274, 0.7764706, 0, 1, 1,
0.8322572, -1.390167, 3.931246, 0.7803922, 0, 1, 1,
0.8355172, -0.9233469, 4.056549, 0.7882353, 0, 1, 1,
0.8369137, 2.555241, 0.3665079, 0.7921569, 0, 1, 1,
0.8376893, -0.0308273, 2.26446, 0.8, 0, 1, 1,
0.8414949, 2.809316, 0.1470682, 0.8078431, 0, 1, 1,
0.8447749, 0.5840581, 1.921164, 0.8117647, 0, 1, 1,
0.8475407, -0.6683394, 4.022003, 0.8196079, 0, 1, 1,
0.8641393, 0.2432813, 1.910059, 0.8235294, 0, 1, 1,
0.8709806, -1.555083, 3.08873, 0.8313726, 0, 1, 1,
0.8769684, 0.03684107, 3.07585, 0.8352941, 0, 1, 1,
0.8806276, -1.081788, 2.656943, 0.8431373, 0, 1, 1,
0.8834197, -0.6572031, 3.715453, 0.8470588, 0, 1, 1,
0.8840489, -1.272739, 0.9662955, 0.854902, 0, 1, 1,
0.8859048, 0.5185016, 1.038833, 0.8588235, 0, 1, 1,
0.8894961, 0.4399292, 1.286156, 0.8666667, 0, 1, 1,
0.8938276, -1.190684, 2.830257, 0.8705882, 0, 1, 1,
0.8978459, 1.043956, 1.020474, 0.8784314, 0, 1, 1,
0.8992835, -0.954206, 1.351605, 0.8823529, 0, 1, 1,
0.8996592, 0.06314456, 0.858108, 0.8901961, 0, 1, 1,
0.9031358, -0.06904536, 1.562299, 0.8941177, 0, 1, 1,
0.9048575, -0.2860155, 2.695809, 0.9019608, 0, 1, 1,
0.9092829, -0.7235626, 4.527461, 0.9098039, 0, 1, 1,
0.910181, -1.015919, -0.8330348, 0.9137255, 0, 1, 1,
0.9121476, 1.879746, 2.273926, 0.9215686, 0, 1, 1,
0.9192613, -0.1271542, 1.262719, 0.9254902, 0, 1, 1,
0.9245875, -0.5599591, 0.9156933, 0.9333333, 0, 1, 1,
0.9279255, 2.156777, -0.922495, 0.9372549, 0, 1, 1,
0.9340469, -1.147839, 3.824841, 0.945098, 0, 1, 1,
0.9401888, -1.060896, 4.554273, 0.9490196, 0, 1, 1,
0.9410266, -0.1062012, 1.035243, 0.9568627, 0, 1, 1,
0.9498779, 1.451422, 1.091289, 0.9607843, 0, 1, 1,
0.9533589, 0.6503172, -0.3343402, 0.9686275, 0, 1, 1,
0.9636039, 0.8796783, -1.233198, 0.972549, 0, 1, 1,
0.96967, -0.3485325, 1.469369, 0.9803922, 0, 1, 1,
0.9864259, 0.1173805, 2.609404, 0.9843137, 0, 1, 1,
0.9957289, -0.9138053, 3.051633, 0.9921569, 0, 1, 1,
1.001372, -0.7593447, 1.157982, 0.9960784, 0, 1, 1,
1.00156, -2.016705, 2.66532, 1, 0, 0.9960784, 1,
1.004434, -0.8093892, 1.690647, 1, 0, 0.9882353, 1,
1.005551, -0.1911754, 1.066846, 1, 0, 0.9843137, 1,
1.012085, -1.036989, 1.774999, 1, 0, 0.9764706, 1,
1.027739, 0.3905055, 1.624928, 1, 0, 0.972549, 1,
1.036005, -2.057974, 3.118284, 1, 0, 0.9647059, 1,
1.037166, -0.4039019, 2.578136, 1, 0, 0.9607843, 1,
1.049995, 0.310434, 1.71463, 1, 0, 0.9529412, 1,
1.056732, -0.6543926, 1.909066, 1, 0, 0.9490196, 1,
1.056935, 0.5762103, 0.9669337, 1, 0, 0.9411765, 1,
1.060258, 0.1783723, 1.36172, 1, 0, 0.9372549, 1,
1.06202, 0.582908, 2.293255, 1, 0, 0.9294118, 1,
1.081019, 1.576961, 1.794719, 1, 0, 0.9254902, 1,
1.083217, -0.2446562, 2.849425, 1, 0, 0.9176471, 1,
1.086532, 1.768676, 1.106303, 1, 0, 0.9137255, 1,
1.088131, -0.149388, 0.851905, 1, 0, 0.9058824, 1,
1.089165, -2.077901, 3.854292, 1, 0, 0.9019608, 1,
1.098617, -0.3087144, 1.730352, 1, 0, 0.8941177, 1,
1.103108, 1.283077, 0.7072001, 1, 0, 0.8862745, 1,
1.109725, -0.01858029, 2.158184, 1, 0, 0.8823529, 1,
1.11329, 0.7108094, -0.7317657, 1, 0, 0.8745098, 1,
1.113411, -0.8074356, 2.964107, 1, 0, 0.8705882, 1,
1.124187, -0.2647472, 1.97006, 1, 0, 0.8627451, 1,
1.125517, -0.03701013, 0.9387412, 1, 0, 0.8588235, 1,
1.131953, -0.07903166, 2.299416, 1, 0, 0.8509804, 1,
1.135511, 0.08535165, 1.194035, 1, 0, 0.8470588, 1,
1.145436, -0.5561652, 1.521761, 1, 0, 0.8392157, 1,
1.154247, 0.06094916, 0.9903913, 1, 0, 0.8352941, 1,
1.155553, -1.422158, 1.491843, 1, 0, 0.827451, 1,
1.161432, -1.420655, 2.201698, 1, 0, 0.8235294, 1,
1.161651, -1.389916, 2.383129, 1, 0, 0.8156863, 1,
1.162294, 0.8248157, 0.09193595, 1, 0, 0.8117647, 1,
1.163467, -1.11802, 1.568279, 1, 0, 0.8039216, 1,
1.166816, 1.33471, 0.1275662, 1, 0, 0.7960784, 1,
1.168475, -0.588773, 2.009002, 1, 0, 0.7921569, 1,
1.17012, -0.2494776, 4.237413, 1, 0, 0.7843137, 1,
1.181639, -1.011731, 3.416552, 1, 0, 0.7803922, 1,
1.19553, 1.564917, 1.9305, 1, 0, 0.772549, 1,
1.19831, 0.5572433, 2.047147, 1, 0, 0.7686275, 1,
1.203038, -0.6307984, 1.020647, 1, 0, 0.7607843, 1,
1.206704, -0.778156, 3.336388, 1, 0, 0.7568628, 1,
1.208858, -1.959337, 3.14143, 1, 0, 0.7490196, 1,
1.21476, -1.90881, 2.397917, 1, 0, 0.7450981, 1,
1.215853, 0.1032618, 0.6424747, 1, 0, 0.7372549, 1,
1.217488, -0.5241122, 0.3002178, 1, 0, 0.7333333, 1,
1.219864, 0.372074, 0.9723253, 1, 0, 0.7254902, 1,
1.220268, -0.2789844, 2.140043, 1, 0, 0.7215686, 1,
1.225663, -0.6261703, 1.714594, 1, 0, 0.7137255, 1,
1.233398, -0.5033171, 2.131725, 1, 0, 0.7098039, 1,
1.233942, 0.5472479, 2.069707, 1, 0, 0.7019608, 1,
1.238729, -1.356895, 2.63584, 1, 0, 0.6941177, 1,
1.24278, -0.2914072, 0.9581962, 1, 0, 0.6901961, 1,
1.247632, 1.264127, 0.2525272, 1, 0, 0.682353, 1,
1.2481, 0.2122401, 3.324332, 1, 0, 0.6784314, 1,
1.24847, 0.5314459, -0.2668386, 1, 0, 0.6705883, 1,
1.249405, 0.7618623, 0.2069423, 1, 0, 0.6666667, 1,
1.255507, 0.403451, 1.306889, 1, 0, 0.6588235, 1,
1.268783, -1.111406, 1.728506, 1, 0, 0.654902, 1,
1.29911, -0.5626436, 2.491346, 1, 0, 0.6470588, 1,
1.312402, 1.302122, 1.447607, 1, 0, 0.6431373, 1,
1.321783, -1.277371, 2.918475, 1, 0, 0.6352941, 1,
1.32918, 0.937357, 1.137336, 1, 0, 0.6313726, 1,
1.340195, -0.864489, 2.858167, 1, 0, 0.6235294, 1,
1.348255, -0.3295137, 0.4969839, 1, 0, 0.6196079, 1,
1.357513, -0.8851966, 3.918367, 1, 0, 0.6117647, 1,
1.364455, 0.1061096, 1.360988, 1, 0, 0.6078432, 1,
1.36778, 0.9239876, -1.79214, 1, 0, 0.6, 1,
1.367792, -1.184605, 2.389204, 1, 0, 0.5921569, 1,
1.368962, 0.9467003, -0.117869, 1, 0, 0.5882353, 1,
1.371487, 0.3991798, 2.532735, 1, 0, 0.5803922, 1,
1.378295, 0.07730152, 1.115041, 1, 0, 0.5764706, 1,
1.399054, 2.068156, 1.511891, 1, 0, 0.5686275, 1,
1.400758, -1.224775, 2.673023, 1, 0, 0.5647059, 1,
1.404972, 0.824581, 2.16911, 1, 0, 0.5568628, 1,
1.405322, -0.4808372, 3.102307, 1, 0, 0.5529412, 1,
1.419598, -0.3875203, 1.513845, 1, 0, 0.5450981, 1,
1.461687, 0.2123141, -0.1546931, 1, 0, 0.5411765, 1,
1.462424, 0.346972, 1.920455, 1, 0, 0.5333334, 1,
1.46755, 0.3793363, -0.3376828, 1, 0, 0.5294118, 1,
1.468906, 0.9779027, 1.575797, 1, 0, 0.5215687, 1,
1.469173, -1.604098, 2.355885, 1, 0, 0.5176471, 1,
1.470918, 0.142956, 0.8349469, 1, 0, 0.509804, 1,
1.471899, -0.1344349, 0.9833476, 1, 0, 0.5058824, 1,
1.486784, 0.8957788, 1.289352, 1, 0, 0.4980392, 1,
1.499017, 0.02003956, 4.348556, 1, 0, 0.4901961, 1,
1.509693, -0.9130003, 1.910228, 1, 0, 0.4862745, 1,
1.516243, 0.6277919, 2.689023, 1, 0, 0.4784314, 1,
1.521665, 0.6514037, 0.8153069, 1, 0, 0.4745098, 1,
1.52917, 1.491169, 1.500658, 1, 0, 0.4666667, 1,
1.531235, -1.1193, 1.655026, 1, 0, 0.4627451, 1,
1.532103, 1.488678, -0.2368893, 1, 0, 0.454902, 1,
1.534647, -0.5663521, 1.54749, 1, 0, 0.4509804, 1,
1.534769, -1.319613, 2.849355, 1, 0, 0.4431373, 1,
1.543283, 0.01860135, -0.8325291, 1, 0, 0.4392157, 1,
1.55231, -0.02105413, 1.063306, 1, 0, 0.4313726, 1,
1.55258, 0.791053, 0.8071749, 1, 0, 0.427451, 1,
1.553753, -0.3515966, 0.4020298, 1, 0, 0.4196078, 1,
1.555383, 0.2069115, -0.4351495, 1, 0, 0.4156863, 1,
1.558816, -0.2193717, 3.444722, 1, 0, 0.4078431, 1,
1.564066, 0.1143869, 0.0123645, 1, 0, 0.4039216, 1,
1.5698, -0.7316602, 0.6824747, 1, 0, 0.3960784, 1,
1.57773, -0.771636, 1.158702, 1, 0, 0.3882353, 1,
1.583831, -0.5374455, 1.120521, 1, 0, 0.3843137, 1,
1.596464, 1.05507, 1.416509, 1, 0, 0.3764706, 1,
1.604709, -1.464326, 3.477686, 1, 0, 0.372549, 1,
1.607105, 0.5177423, -0.128221, 1, 0, 0.3647059, 1,
1.608858, -0.4786153, 0.7156687, 1, 0, 0.3607843, 1,
1.613114, -0.2772629, 2.248586, 1, 0, 0.3529412, 1,
1.614131, 0.1166179, 2.370857, 1, 0, 0.3490196, 1,
1.623366, -0.4158506, 3.222018, 1, 0, 0.3411765, 1,
1.623506, 1.433142, -0.03599464, 1, 0, 0.3372549, 1,
1.65025, 2.10674, 1.232388, 1, 0, 0.3294118, 1,
1.654051, -0.03299361, -0.02113143, 1, 0, 0.3254902, 1,
1.655796, 0.744627, 0.9535099, 1, 0, 0.3176471, 1,
1.671753, -0.5795518, 3.306036, 1, 0, 0.3137255, 1,
1.682541, 0.9737594, 0.7118706, 1, 0, 0.3058824, 1,
1.682705, 0.3003915, 0.1944281, 1, 0, 0.2980392, 1,
1.684862, 0.409682, -0.2398424, 1, 0, 0.2941177, 1,
1.688609, -0.02284051, 2.394326, 1, 0, 0.2862745, 1,
1.704421, 1.855185, 1.461805, 1, 0, 0.282353, 1,
1.706713, -0.01336836, 1.684661, 1, 0, 0.2745098, 1,
1.714185, 1.140829, 1.487768, 1, 0, 0.2705882, 1,
1.7439, -0.09454963, 1.816211, 1, 0, 0.2627451, 1,
1.747034, 0.3625746, 1.590932, 1, 0, 0.2588235, 1,
1.749464, -0.7146648, 1.29012, 1, 0, 0.2509804, 1,
1.761941, 0.2783427, -0.4629649, 1, 0, 0.2470588, 1,
1.765662, 0.865519, 1.541883, 1, 0, 0.2392157, 1,
1.788696, 0.8448417, 0.9082342, 1, 0, 0.2352941, 1,
1.797901, -1.705508, 4.629075, 1, 0, 0.227451, 1,
1.801824, 0.1955805, 3.348983, 1, 0, 0.2235294, 1,
1.855657, 1.466109, 2.904393, 1, 0, 0.2156863, 1,
1.898122, -1.934822, 0.2932699, 1, 0, 0.2117647, 1,
1.915465, 0.9387006, -0.2054744, 1, 0, 0.2039216, 1,
1.921569, -0.9874592, 2.595988, 1, 0, 0.1960784, 1,
1.933399, -1.91493, 3.275717, 1, 0, 0.1921569, 1,
1.934526, 1.814055, -1.0703, 1, 0, 0.1843137, 1,
1.940786, 0.06646158, 0.6634995, 1, 0, 0.1803922, 1,
1.947123, -0.9317732, -0.03522978, 1, 0, 0.172549, 1,
1.990123, 1.187611, 0.7675316, 1, 0, 0.1686275, 1,
1.990331, 0.4711577, 2.614483, 1, 0, 0.1607843, 1,
1.99522, -0.9814607, 2.177343, 1, 0, 0.1568628, 1,
2.036706, -1.9275, 2.055392, 1, 0, 0.1490196, 1,
2.051273, 1.073529, 1.342381, 1, 0, 0.145098, 1,
2.05162, -0.9499698, 0.2637419, 1, 0, 0.1372549, 1,
2.05257, -2.093041, 3.294608, 1, 0, 0.1333333, 1,
2.052853, -0.7999293, 1.468554, 1, 0, 0.1254902, 1,
2.076478, -0.576568, 1.03503, 1, 0, 0.1215686, 1,
2.094719, 1.204351, -0.5967757, 1, 0, 0.1137255, 1,
2.102507, 1.691083, 1.368766, 1, 0, 0.1098039, 1,
2.104308, 1.696708, 1.048635, 1, 0, 0.1019608, 1,
2.189029, 1.409108, 0.9571295, 1, 0, 0.09411765, 1,
2.194502, 0.5349647, -1.257144, 1, 0, 0.09019608, 1,
2.209988, -0.1093442, 1.875473, 1, 0, 0.08235294, 1,
2.21367, 0.3002873, 1.948469, 1, 0, 0.07843138, 1,
2.257791, 0.9758536, 2.039006, 1, 0, 0.07058824, 1,
2.267538, 1.07853, 1.667754, 1, 0, 0.06666667, 1,
2.3367, 1.479174, 1.114143, 1, 0, 0.05882353, 1,
2.381961, -1.083562, 3.036129, 1, 0, 0.05490196, 1,
2.387958, 0.919222, 1.334856, 1, 0, 0.04705882, 1,
2.390442, -0.7698039, 2.869547, 1, 0, 0.04313726, 1,
2.413771, 0.2837243, 1.14086, 1, 0, 0.03529412, 1,
2.491729, -0.7056281, -0.09124756, 1, 0, 0.03137255, 1,
2.606895, 1.008926, 1.41065, 1, 0, 0.02352941, 1,
2.667196, 0.2716332, 1.229479, 1, 0, 0.01960784, 1,
2.737216, -0.06158818, -0.7745243, 1, 0, 0.01176471, 1,
3.208908, 1.494621, 1.141563, 1, 0, 0.007843138, 1
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
0.1085674, -3.996756, -6.638238, 0, -0.5, 0.5, 0.5,
0.1085674, -3.996756, -6.638238, 1, -0.5, 0.5, 0.5,
0.1085674, -3.996756, -6.638238, 1, 1.5, 0.5, 0.5,
0.1085674, -3.996756, -6.638238, 0, 1.5, 0.5, 0.5
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
-4.042789, -0.100505, -6.638238, 0, -0.5, 0.5, 0.5,
-4.042789, -0.100505, -6.638238, 1, -0.5, 0.5, 0.5,
-4.042789, -0.100505, -6.638238, 1, 1.5, 0.5, 0.5,
-4.042789, -0.100505, -6.638238, 0, 1.5, 0.5, 0.5
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
-4.042789, -3.996756, 0.2639301, 0, -0.5, 0.5, 0.5,
-4.042789, -3.996756, 0.2639301, 1, -0.5, 0.5, 0.5,
-4.042789, -3.996756, 0.2639301, 1, 1.5, 0.5, 0.5,
-4.042789, -3.996756, 0.2639301, 0, 1.5, 0.5, 0.5
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
-2, -3.097621, -5.04543,
3, -3.097621, -5.04543,
-2, -3.097621, -5.04543,
-2, -3.247477, -5.310898,
-1, -3.097621, -5.04543,
-1, -3.247477, -5.310898,
0, -3.097621, -5.04543,
0, -3.247477, -5.310898,
1, -3.097621, -5.04543,
1, -3.247477, -5.310898,
2, -3.097621, -5.04543,
2, -3.247477, -5.310898,
3, -3.097621, -5.04543,
3, -3.247477, -5.310898
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
-2, -3.547189, -5.841834, 0, -0.5, 0.5, 0.5,
-2, -3.547189, -5.841834, 1, -0.5, 0.5, 0.5,
-2, -3.547189, -5.841834, 1, 1.5, 0.5, 0.5,
-2, -3.547189, -5.841834, 0, 1.5, 0.5, 0.5,
-1, -3.547189, -5.841834, 0, -0.5, 0.5, 0.5,
-1, -3.547189, -5.841834, 1, -0.5, 0.5, 0.5,
-1, -3.547189, -5.841834, 1, 1.5, 0.5, 0.5,
-1, -3.547189, -5.841834, 0, 1.5, 0.5, 0.5,
0, -3.547189, -5.841834, 0, -0.5, 0.5, 0.5,
0, -3.547189, -5.841834, 1, -0.5, 0.5, 0.5,
0, -3.547189, -5.841834, 1, 1.5, 0.5, 0.5,
0, -3.547189, -5.841834, 0, 1.5, 0.5, 0.5,
1, -3.547189, -5.841834, 0, -0.5, 0.5, 0.5,
1, -3.547189, -5.841834, 1, -0.5, 0.5, 0.5,
1, -3.547189, -5.841834, 1, 1.5, 0.5, 0.5,
1, -3.547189, -5.841834, 0, 1.5, 0.5, 0.5,
2, -3.547189, -5.841834, 0, -0.5, 0.5, 0.5,
2, -3.547189, -5.841834, 1, -0.5, 0.5, 0.5,
2, -3.547189, -5.841834, 1, 1.5, 0.5, 0.5,
2, -3.547189, -5.841834, 0, 1.5, 0.5, 0.5,
3, -3.547189, -5.841834, 0, -0.5, 0.5, 0.5,
3, -3.547189, -5.841834, 1, -0.5, 0.5, 0.5,
3, -3.547189, -5.841834, 1, 1.5, 0.5, 0.5,
3, -3.547189, -5.841834, 0, 1.5, 0.5, 0.5
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
-3.084784, -3, -5.04543,
-3.084784, 2, -5.04543,
-3.084784, -3, -5.04543,
-3.244451, -3, -5.310898,
-3.084784, -2, -5.04543,
-3.244451, -2, -5.310898,
-3.084784, -1, -5.04543,
-3.244451, -1, -5.310898,
-3.084784, 0, -5.04543,
-3.244451, 0, -5.310898,
-3.084784, 1, -5.04543,
-3.244451, 1, -5.310898,
-3.084784, 2, -5.04543,
-3.244451, 2, -5.310898
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
-3.563786, -3, -5.841834, 0, -0.5, 0.5, 0.5,
-3.563786, -3, -5.841834, 1, -0.5, 0.5, 0.5,
-3.563786, -3, -5.841834, 1, 1.5, 0.5, 0.5,
-3.563786, -3, -5.841834, 0, 1.5, 0.5, 0.5,
-3.563786, -2, -5.841834, 0, -0.5, 0.5, 0.5,
-3.563786, -2, -5.841834, 1, -0.5, 0.5, 0.5,
-3.563786, -2, -5.841834, 1, 1.5, 0.5, 0.5,
-3.563786, -2, -5.841834, 0, 1.5, 0.5, 0.5,
-3.563786, -1, -5.841834, 0, -0.5, 0.5, 0.5,
-3.563786, -1, -5.841834, 1, -0.5, 0.5, 0.5,
-3.563786, -1, -5.841834, 1, 1.5, 0.5, 0.5,
-3.563786, -1, -5.841834, 0, 1.5, 0.5, 0.5,
-3.563786, 0, -5.841834, 0, -0.5, 0.5, 0.5,
-3.563786, 0, -5.841834, 1, -0.5, 0.5, 0.5,
-3.563786, 0, -5.841834, 1, 1.5, 0.5, 0.5,
-3.563786, 0, -5.841834, 0, 1.5, 0.5, 0.5,
-3.563786, 1, -5.841834, 0, -0.5, 0.5, 0.5,
-3.563786, 1, -5.841834, 1, -0.5, 0.5, 0.5,
-3.563786, 1, -5.841834, 1, 1.5, 0.5, 0.5,
-3.563786, 1, -5.841834, 0, 1.5, 0.5, 0.5,
-3.563786, 2, -5.841834, 0, -0.5, 0.5, 0.5,
-3.563786, 2, -5.841834, 1, -0.5, 0.5, 0.5,
-3.563786, 2, -5.841834, 1, 1.5, 0.5, 0.5,
-3.563786, 2, -5.841834, 0, 1.5, 0.5, 0.5
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
-3.084784, -3.097621, -4,
-3.084784, -3.097621, 4,
-3.084784, -3.097621, -4,
-3.244451, -3.247477, -4,
-3.084784, -3.097621, -2,
-3.244451, -3.247477, -2,
-3.084784, -3.097621, 0,
-3.244451, -3.247477, 0,
-3.084784, -3.097621, 2,
-3.244451, -3.247477, 2,
-3.084784, -3.097621, 4,
-3.244451, -3.247477, 4
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
-3.563786, -3.547189, -4, 0, -0.5, 0.5, 0.5,
-3.563786, -3.547189, -4, 1, -0.5, 0.5, 0.5,
-3.563786, -3.547189, -4, 1, 1.5, 0.5, 0.5,
-3.563786, -3.547189, -4, 0, 1.5, 0.5, 0.5,
-3.563786, -3.547189, -2, 0, -0.5, 0.5, 0.5,
-3.563786, -3.547189, -2, 1, -0.5, 0.5, 0.5,
-3.563786, -3.547189, -2, 1, 1.5, 0.5, 0.5,
-3.563786, -3.547189, -2, 0, 1.5, 0.5, 0.5,
-3.563786, -3.547189, 0, 0, -0.5, 0.5, 0.5,
-3.563786, -3.547189, 0, 1, -0.5, 0.5, 0.5,
-3.563786, -3.547189, 0, 1, 1.5, 0.5, 0.5,
-3.563786, -3.547189, 0, 0, 1.5, 0.5, 0.5,
-3.563786, -3.547189, 2, 0, -0.5, 0.5, 0.5,
-3.563786, -3.547189, 2, 1, -0.5, 0.5, 0.5,
-3.563786, -3.547189, 2, 1, 1.5, 0.5, 0.5,
-3.563786, -3.547189, 2, 0, 1.5, 0.5, 0.5,
-3.563786, -3.547189, 4, 0, -0.5, 0.5, 0.5,
-3.563786, -3.547189, 4, 1, -0.5, 0.5, 0.5,
-3.563786, -3.547189, 4, 1, 1.5, 0.5, 0.5,
-3.563786, -3.547189, 4, 0, 1.5, 0.5, 0.5
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
-3.084784, -3.097621, -5.04543,
-3.084784, 2.896611, -5.04543,
-3.084784, -3.097621, 5.57329,
-3.084784, 2.896611, 5.57329,
-3.084784, -3.097621, -5.04543,
-3.084784, -3.097621, 5.57329,
-3.084784, 2.896611, -5.04543,
-3.084784, 2.896611, 5.57329,
-3.084784, -3.097621, -5.04543,
3.301918, -3.097621, -5.04543,
-3.084784, -3.097621, 5.57329,
3.301918, -3.097621, 5.57329,
-3.084784, 2.896611, -5.04543,
3.301918, 2.896611, -5.04543,
-3.084784, 2.896611, 5.57329,
3.301918, 2.896611, 5.57329,
3.301918, -3.097621, -5.04543,
3.301918, 2.896611, -5.04543,
3.301918, -3.097621, 5.57329,
3.301918, 2.896611, 5.57329,
3.301918, -3.097621, -5.04543,
3.301918, -3.097621, 5.57329,
3.301918, 2.896611, -5.04543,
3.301918, 2.896611, 5.57329
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
var radius = 7.350297;
var distance = 32.7023;
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
mvMatrix.translate( -0.1085674, 0.100505, -0.2639301 );
mvMatrix.scale( 1.244349, 1.325822, 0.7484221 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.7023);
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
nonachlor<-read.table("nonachlor.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nonachlor$V2
```

```
## Error in eval(expr, envir, enclos): object 'nonachlor' not found
```

```r
y<-nonachlor$V3
```

```
## Error in eval(expr, envir, enclos): object 'nonachlor' not found
```

```r
z<-nonachlor$V4
```

```
## Error in eval(expr, envir, enclos): object 'nonachlor' not found
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
-2.991773, 0.3916603, 0.4658056, 0, 0, 1, 1, 1,
-2.852213, 0.7819606, -0.9760417, 1, 0, 0, 1, 1,
-2.644755, -0.3264574, -3.362843, 1, 0, 0, 1, 1,
-2.637254, -0.1907605, -0.2158304, 1, 0, 0, 1, 1,
-2.508321, -0.6008728, -0.6686642, 1, 0, 0, 1, 1,
-2.49229, -0.05003522, -1.265252, 1, 0, 0, 1, 1,
-2.451492, -0.8186892, -1.315367, 0, 0, 0, 1, 1,
-2.43827, -1.81578, -2.933061, 0, 0, 0, 1, 1,
-2.353279, 0.4670695, -0.3382952, 0, 0, 0, 1, 1,
-2.345136, -1.857352, -1.349489, 0, 0, 0, 1, 1,
-2.342824, -1.015016, -3.035923, 0, 0, 0, 1, 1,
-2.266859, -0.406197, -2.594208, 0, 0, 0, 1, 1,
-2.254232, 0.3135914, -0.6600296, 0, 0, 0, 1, 1,
-2.210742, -1.019994, -1.814556, 1, 1, 1, 1, 1,
-2.206427, -1.069962, -3.069873, 1, 1, 1, 1, 1,
-2.194799, -0.1623603, -2.033923, 1, 1, 1, 1, 1,
-2.175848, -1.041085, -0.2643268, 1, 1, 1, 1, 1,
-2.16802, -1.038535, -1.114275, 1, 1, 1, 1, 1,
-2.166147, 0.8139349, -2.566255, 1, 1, 1, 1, 1,
-2.128888, -0.3837199, -0.4550849, 1, 1, 1, 1, 1,
-2.112572, -1.487932, -0.9467721, 1, 1, 1, 1, 1,
-2.100394, -1.255458, -1.842661, 1, 1, 1, 1, 1,
-2.04864, 0.1337038, -2.653332, 1, 1, 1, 1, 1,
-2.043768, -2.337698, -1.796652, 1, 1, 1, 1, 1,
-2.017003, 0.3484493, -1.544643, 1, 1, 1, 1, 1,
-1.975187, -0.5859587, -1.412697, 1, 1, 1, 1, 1,
-1.943894, -1.223793, -2.850718, 1, 1, 1, 1, 1,
-1.932837, 0.7295731, -2.247376, 1, 1, 1, 1, 1,
-1.930071, 0.7664914, -2.538538, 0, 0, 1, 1, 1,
-1.903201, -0.04042313, -1.605802, 1, 0, 0, 1, 1,
-1.880463, -0.3505991, -2.875426, 1, 0, 0, 1, 1,
-1.879785, 0.1208226, -2.881274, 1, 0, 0, 1, 1,
-1.872861, 0.6165714, -1.004003, 1, 0, 0, 1, 1,
-1.835003, 0.3247238, -1.918509, 1, 0, 0, 1, 1,
-1.811674, 0.7521471, -0.5926411, 0, 0, 0, 1, 1,
-1.807673, 1.140348, -3.100271, 0, 0, 0, 1, 1,
-1.800141, -1.378008, -3.213869, 0, 0, 0, 1, 1,
-1.794841, 0.5909725, -2.251014, 0, 0, 0, 1, 1,
-1.775696, 0.8056555, -0.8693814, 0, 0, 0, 1, 1,
-1.768967, -0.7064345, -3.207289, 0, 0, 0, 1, 1,
-1.76497, 0.4031889, -1.481296, 0, 0, 0, 1, 1,
-1.755263, -0.08161358, -2.911472, 1, 1, 1, 1, 1,
-1.750583, -0.1434765, -2.173995, 1, 1, 1, 1, 1,
-1.718013, 0.5715559, -2.127472, 1, 1, 1, 1, 1,
-1.705334, 0.1411213, -4.247892, 1, 1, 1, 1, 1,
-1.676278, -0.3287822, -1.007343, 1, 1, 1, 1, 1,
-1.664502, -0.009461083, -1.020095, 1, 1, 1, 1, 1,
-1.656596, 0.2962878, -2.211148, 1, 1, 1, 1, 1,
-1.644199, 0.416859, -0.9640788, 1, 1, 1, 1, 1,
-1.620303, -1.022059, -1.167449, 1, 1, 1, 1, 1,
-1.615919, 0.9469975, -0.9514159, 1, 1, 1, 1, 1,
-1.612486, 0.387946, 0.02169816, 1, 1, 1, 1, 1,
-1.599603, -1.114396, -2.639436, 1, 1, 1, 1, 1,
-1.598668, 0.2262237, -0.3048252, 1, 1, 1, 1, 1,
-1.596828, 0.04319295, -2.055528, 1, 1, 1, 1, 1,
-1.594099, -1.231104, -2.888766, 1, 1, 1, 1, 1,
-1.575155, 0.8960776, 0.6714497, 0, 0, 1, 1, 1,
-1.573526, -0.2277924, -0.08314119, 1, 0, 0, 1, 1,
-1.545777, -0.46069, -2.219027, 1, 0, 0, 1, 1,
-1.536823, -0.3615236, -2.835236, 1, 0, 0, 1, 1,
-1.527121, -1.120864, -2.344465, 1, 0, 0, 1, 1,
-1.523109, 0.3687004, -0.6350239, 1, 0, 0, 1, 1,
-1.505946, 0.4309574, -2.588741, 0, 0, 0, 1, 1,
-1.491261, 0.7977954, -1.928019, 0, 0, 0, 1, 1,
-1.489884, 0.6889408, -1.253537, 0, 0, 0, 1, 1,
-1.480152, -0.5450904, -3.8212, 0, 0, 0, 1, 1,
-1.472049, -0.3355633, -0.1318199, 0, 0, 0, 1, 1,
-1.467539, -0.6073834, -0.9699312, 0, 0, 0, 1, 1,
-1.460992, 1.274883, -2.708184, 0, 0, 0, 1, 1,
-1.460263, 0.3913045, -1.518583, 1, 1, 1, 1, 1,
-1.459053, 2.257423, -0.333585, 1, 1, 1, 1, 1,
-1.452312, 0.4991713, -1.696219, 1, 1, 1, 1, 1,
-1.452024, 0.5840036, -2.726993, 1, 1, 1, 1, 1,
-1.444656, 1.525408, -2.512388, 1, 1, 1, 1, 1,
-1.436989, -2.389244, -2.800148, 1, 1, 1, 1, 1,
-1.436571, -1.432914, -2.681823, 1, 1, 1, 1, 1,
-1.433726, -0.2826953, -2.996541, 1, 1, 1, 1, 1,
-1.424584, -0.734296, -2.00469, 1, 1, 1, 1, 1,
-1.421105, 0.1556345, -1.403852, 1, 1, 1, 1, 1,
-1.409285, 0.3978794, -0.9566169, 1, 1, 1, 1, 1,
-1.39111, -0.09599309, -2.338151, 1, 1, 1, 1, 1,
-1.390096, -1.538545, -1.29649, 1, 1, 1, 1, 1,
-1.38301, 0.6527519, -0.4962313, 1, 1, 1, 1, 1,
-1.379208, 1.599211, -0.2527734, 1, 1, 1, 1, 1,
-1.371724, -0.5287336, -1.039036, 0, 0, 1, 1, 1,
-1.371142, -0.4203382, -3.963473, 1, 0, 0, 1, 1,
-1.351489, -1.995199, -2.250703, 1, 0, 0, 1, 1,
-1.348696, -1.019857, -3.518107, 1, 0, 0, 1, 1,
-1.345217, 1.95789, -1.226126, 1, 0, 0, 1, 1,
-1.344609, 0.6669132, 0.3199618, 1, 0, 0, 1, 1,
-1.33278, 0.5451248, 0.7233533, 0, 0, 0, 1, 1,
-1.331786, 0.6268585, -1.985334, 0, 0, 0, 1, 1,
-1.309148, -0.05105333, -2.35954, 0, 0, 0, 1, 1,
-1.304181, 0.925554, 0.5343392, 0, 0, 0, 1, 1,
-1.302244, -1.090814, -0.7767923, 0, 0, 0, 1, 1,
-1.292853, -0.5303922, -0.05670065, 0, 0, 0, 1, 1,
-1.290179, -0.9772325, -2.624877, 0, 0, 0, 1, 1,
-1.283046, -0.510447, -1.719577, 1, 1, 1, 1, 1,
-1.282617, -0.06471713, 0.05056245, 1, 1, 1, 1, 1,
-1.282609, 2.718247, 0.1002098, 1, 1, 1, 1, 1,
-1.273196, -0.2907779, -1.137008, 1, 1, 1, 1, 1,
-1.268206, 0.1843088, -4.123908, 1, 1, 1, 1, 1,
-1.266461, 0.5206069, -0.6247354, 1, 1, 1, 1, 1,
-1.263753, -0.4007774, -1.850167, 1, 1, 1, 1, 1,
-1.259591, -0.1179089, -3.18486, 1, 1, 1, 1, 1,
-1.254314, 0.6937862, 0.6167204, 1, 1, 1, 1, 1,
-1.24865, 0.4352843, -0.7578538, 1, 1, 1, 1, 1,
-1.243432, -0.8054481, -3.70776, 1, 1, 1, 1, 1,
-1.236602, 1.302031, -0.8693542, 1, 1, 1, 1, 1,
-1.230665, 0.07977764, -1.78644, 1, 1, 1, 1, 1,
-1.220088, -1.697646, -2.362113, 1, 1, 1, 1, 1,
-1.214646, 0.01217556, -2.55556, 1, 1, 1, 1, 1,
-1.207498, -0.3497618, -1.37867, 0, 0, 1, 1, 1,
-1.202049, 0.4260583, -0.5514494, 1, 0, 0, 1, 1,
-1.195024, 0.857532, 1.267381, 1, 0, 0, 1, 1,
-1.194109, -0.3801447, -1.864468, 1, 0, 0, 1, 1,
-1.192719, -0.007319633, -1.674173, 1, 0, 0, 1, 1,
-1.185483, -0.6946028, -1.252778, 1, 0, 0, 1, 1,
-1.174378, -1.143581, -1.998416, 0, 0, 0, 1, 1,
-1.171203, 0.1629676, -0.6181625, 0, 0, 0, 1, 1,
-1.169948, -1.634543, -2.518401, 0, 0, 0, 1, 1,
-1.16028, -1.689466, -2.368508, 0, 0, 0, 1, 1,
-1.149512, -1.513828, -2.487774, 0, 0, 0, 1, 1,
-1.14894, 0.2908359, -0.8915404, 0, 0, 0, 1, 1,
-1.148855, -1.984782, -1.641195, 0, 0, 0, 1, 1,
-1.147842, -0.2198067, -1.227205, 1, 1, 1, 1, 1,
-1.142719, 1.000811, -1.789726, 1, 1, 1, 1, 1,
-1.138096, -0.8607842, -1.399688, 1, 1, 1, 1, 1,
-1.133957, -1.956481, -3.687616, 1, 1, 1, 1, 1,
-1.132126, 0.5812908, -0.5562385, 1, 1, 1, 1, 1,
-1.120855, 2.292232, -1.298329, 1, 1, 1, 1, 1,
-1.119224, -2.347766, -3.88861, 1, 1, 1, 1, 1,
-1.118886, -0.8187415, -2.326218, 1, 1, 1, 1, 1,
-1.113061, -0.546143, -3.372558, 1, 1, 1, 1, 1,
-1.106421, -1.068299, -1.843874, 1, 1, 1, 1, 1,
-1.105462, 0.3384641, -1.568892, 1, 1, 1, 1, 1,
-1.104066, -0.284296, -3.069829, 1, 1, 1, 1, 1,
-1.098099, -0.2705602, -1.974911, 1, 1, 1, 1, 1,
-1.094457, -0.7187795, -3.514236, 1, 1, 1, 1, 1,
-1.083593, 1.215668, 1.985879, 1, 1, 1, 1, 1,
-1.081943, -0.1794692, -1.41906, 0, 0, 1, 1, 1,
-1.073628, -0.2350871, -0.4632841, 1, 0, 0, 1, 1,
-1.073505, -2.523118, -1.453077, 1, 0, 0, 1, 1,
-1.068108, 1.057462, -1.599658, 1, 0, 0, 1, 1,
-1.067598, 0.02238015, -2.300549, 1, 0, 0, 1, 1,
-1.067118, 1.843954, 0.4026138, 1, 0, 0, 1, 1,
-1.066495, -0.7640371, -2.485032, 0, 0, 0, 1, 1,
-1.065216, -0.6249844, -2.799986, 0, 0, 0, 1, 1,
-1.064431, 0.8559014, -1.648235, 0, 0, 0, 1, 1,
-1.055443, 0.3190438, -2.865325, 0, 0, 0, 1, 1,
-1.054188, 0.3449824, 0.1391662, 0, 0, 0, 1, 1,
-1.036933, -0.5850232, -2.766016, 0, 0, 0, 1, 1,
-1.036124, 0.6497589, 0.1379691, 0, 0, 0, 1, 1,
-1.033334, -0.501665, -1.367465, 1, 1, 1, 1, 1,
-1.031918, 0.295341, -2.263586, 1, 1, 1, 1, 1,
-1.031334, 0.1431035, 0.2929317, 1, 1, 1, 1, 1,
-1.028107, -1.078651, -3.865152, 1, 1, 1, 1, 1,
-1.0262, 1.287243, 1.52814, 1, 1, 1, 1, 1,
-1.020919, -0.29133, -3.233714, 1, 1, 1, 1, 1,
-1.014978, -1.133052, -0.6000983, 1, 1, 1, 1, 1,
-1.007811, -0.1103271, -2.768742, 1, 1, 1, 1, 1,
-0.9995649, 0.4999615, -1.35058, 1, 1, 1, 1, 1,
-0.9967807, -0.7754205, -4.628667, 1, 1, 1, 1, 1,
-0.9929971, 0.8934218, -1.346668, 1, 1, 1, 1, 1,
-0.9919748, -1.250533, -1.832874, 1, 1, 1, 1, 1,
-0.9881977, 1.257704, -0.4066174, 1, 1, 1, 1, 1,
-0.9875897, -1.564016, -1.228085, 1, 1, 1, 1, 1,
-0.983749, -0.5210326, -3.205771, 1, 1, 1, 1, 1,
-0.9837475, -0.07370725, -1.435269, 0, 0, 1, 1, 1,
-0.9833356, -1.953042, -1.432717, 1, 0, 0, 1, 1,
-0.9824874, -0.7891046, -1.63255, 1, 0, 0, 1, 1,
-0.979579, 0.2244022, -0.1935647, 1, 0, 0, 1, 1,
-0.9790344, -0.2388863, -2.553137, 1, 0, 0, 1, 1,
-0.9743758, 0.384607, -3.21102, 1, 0, 0, 1, 1,
-0.9605018, 1.687346, -0.2285197, 0, 0, 0, 1, 1,
-0.955726, -0.2076864, -1.807218, 0, 0, 0, 1, 1,
-0.950314, -0.4386927, -0.6918685, 0, 0, 0, 1, 1,
-0.9482206, -0.8339501, -1.741433, 0, 0, 0, 1, 1,
-0.9420162, 2.124428, -0.3109457, 0, 0, 0, 1, 1,
-0.9392307, -0.4431393, -0.3070166, 0, 0, 0, 1, 1,
-0.9388964, 0.03991941, -2.256711, 0, 0, 0, 1, 1,
-0.9345151, 0.7852176, -0.2596994, 1, 1, 1, 1, 1,
-0.9295772, 1.11879, -0.8165268, 1, 1, 1, 1, 1,
-0.9238834, 0.233879, -0.444154, 1, 1, 1, 1, 1,
-0.918152, -0.2538681, -2.048166, 1, 1, 1, 1, 1,
-0.9164745, -0.2185758, -2.085264, 1, 1, 1, 1, 1,
-0.9118991, -0.999563, -3.783957, 1, 1, 1, 1, 1,
-0.9072018, -0.9559205, -3.848428, 1, 1, 1, 1, 1,
-0.9026254, 0.01114218, -1.040622, 1, 1, 1, 1, 1,
-0.8894946, 2.430587, -0.01897125, 1, 1, 1, 1, 1,
-0.8867433, 0.3408464, -0.04421448, 1, 1, 1, 1, 1,
-0.8860025, -1.296181, -2.977006, 1, 1, 1, 1, 1,
-0.8747303, -1.643484, -2.16262, 1, 1, 1, 1, 1,
-0.8745756, 1.488266, -0.762944, 1, 1, 1, 1, 1,
-0.873845, -0.8980865, -3.545439, 1, 1, 1, 1, 1,
-0.8734517, 0.714491, -2.395022, 1, 1, 1, 1, 1,
-0.859803, 0.6858692, -0.05505506, 0, 0, 1, 1, 1,
-0.8594502, -1.02893, -1.906213, 1, 0, 0, 1, 1,
-0.8572272, -1.580166, -2.879291, 1, 0, 0, 1, 1,
-0.85321, -1.449562, -2.85183, 1, 0, 0, 1, 1,
-0.8529773, -0.6797805, -3.72336, 1, 0, 0, 1, 1,
-0.8410199, -0.1936546, 0.2565057, 1, 0, 0, 1, 1,
-0.839305, 1.317601, 0.4447008, 0, 0, 0, 1, 1,
-0.8315691, -0.547984, -3.7835, 0, 0, 0, 1, 1,
-0.8314226, 0.5289426, -2.076773, 0, 0, 0, 1, 1,
-0.8291873, 1.997087, -1.756128, 0, 0, 0, 1, 1,
-0.8286205, 0.5944437, 1.26241, 0, 0, 0, 1, 1,
-0.8209006, 0.1241192, -0.9437898, 0, 0, 0, 1, 1,
-0.8203266, -0.5241917, -3.071029, 0, 0, 0, 1, 1,
-0.8130863, -1.12646, -2.727217, 1, 1, 1, 1, 1,
-0.8048965, -0.5893995, -1.635918, 1, 1, 1, 1, 1,
-0.7942253, -0.4534272, -1.849834, 1, 1, 1, 1, 1,
-0.7872912, -1.529723, -1.386271, 1, 1, 1, 1, 1,
-0.7852885, 0.7774739, 0.4343749, 1, 1, 1, 1, 1,
-0.7719333, -0.04820479, -0.5506415, 1, 1, 1, 1, 1,
-0.7662281, 1.868515, -0.7820104, 1, 1, 1, 1, 1,
-0.7622137, -0.2805279, -3.081542, 1, 1, 1, 1, 1,
-0.7423003, 1.201176, 0.4124863, 1, 1, 1, 1, 1,
-0.7393354, -0.5453235, -2.582305, 1, 1, 1, 1, 1,
-0.7328983, -0.4495598, -2.450532, 1, 1, 1, 1, 1,
-0.732857, -1.177159, -1.463868, 1, 1, 1, 1, 1,
-0.7318081, -0.8904547, -1.675073, 1, 1, 1, 1, 1,
-0.7261101, -0.5495728, -1.708547, 1, 1, 1, 1, 1,
-0.7254549, -0.2223247, -0.9542651, 1, 1, 1, 1, 1,
-0.7241298, -0.5728591, -2.931486, 0, 0, 1, 1, 1,
-0.7223918, 1.09924, -1.607758, 1, 0, 0, 1, 1,
-0.7202991, 0.2021599, 0.1129294, 1, 0, 0, 1, 1,
-0.7146512, -2.37845, -0.3546537, 1, 0, 0, 1, 1,
-0.7118921, 0.6283709, -2.372485, 1, 0, 0, 1, 1,
-0.7115108, -1.212667, -2.127896, 1, 0, 0, 1, 1,
-0.7062044, 0.7358998, 0.2740903, 0, 0, 0, 1, 1,
-0.705042, -0.5132158, -3.363759, 0, 0, 0, 1, 1,
-0.6879765, -1.610318, -3.002795, 0, 0, 0, 1, 1,
-0.686735, 0.5426062, 0.07385346, 0, 0, 0, 1, 1,
-0.6845753, -0.531369, -2.590665, 0, 0, 0, 1, 1,
-0.6786312, 0.6725713, -0.4442566, 0, 0, 0, 1, 1,
-0.6779922, -1.253392, -3.621856, 0, 0, 0, 1, 1,
-0.6778585, 0.3739639, -1.94079, 1, 1, 1, 1, 1,
-0.6771608, -0.5683442, -0.7815515, 1, 1, 1, 1, 1,
-0.6738008, 0.5149875, -2.373202, 1, 1, 1, 1, 1,
-0.6649339, 0.91073, -2.734932, 1, 1, 1, 1, 1,
-0.6628778, -0.7067148, -0.5105941, 1, 1, 1, 1, 1,
-0.6575229, -0.9874848, -3.681241, 1, 1, 1, 1, 1,
-0.6535861, -1.407163, -4.760283, 1, 1, 1, 1, 1,
-0.6535441, -0.8403071, -3.368734, 1, 1, 1, 1, 1,
-0.6525781, 1.075915, -1.096937, 1, 1, 1, 1, 1,
-0.6441887, -0.9832672, -3.957014, 1, 1, 1, 1, 1,
-0.6434787, 0.05820125, -1.637726, 1, 1, 1, 1, 1,
-0.6384549, -1.18265, -2.999684, 1, 1, 1, 1, 1,
-0.6277955, 0.2326025, -0.9565434, 1, 1, 1, 1, 1,
-0.6236455, -0.3943506, -0.9915263, 1, 1, 1, 1, 1,
-0.6233403, -1.847776, -4.480874, 1, 1, 1, 1, 1,
-0.6179214, -0.5793319, -2.63824, 0, 0, 1, 1, 1,
-0.6112225, -1.004515, -2.846738, 1, 0, 0, 1, 1,
-0.6086487, -0.8143064, -4.068641, 1, 0, 0, 1, 1,
-0.6080313, -1.111068, -3.781072, 1, 0, 0, 1, 1,
-0.6068692, -0.8670663, -2.149127, 1, 0, 0, 1, 1,
-0.5936779, -0.6612341, -2.797048, 1, 0, 0, 1, 1,
-0.5920244, -0.3475003, -2.405389, 0, 0, 0, 1, 1,
-0.5861191, -1.312437, -2.401055, 0, 0, 0, 1, 1,
-0.5846498, -1.018309, -3.532101, 0, 0, 0, 1, 1,
-0.5821471, -0.2351853, -2.995352, 0, 0, 0, 1, 1,
-0.5820179, 0.5615617, -1.579093, 0, 0, 0, 1, 1,
-0.5772456, 1.21349, -0.2591767, 0, 0, 0, 1, 1,
-0.5766513, -0.2701879, -3.471638, 0, 0, 0, 1, 1,
-0.5741414, -0.27175, -1.441038, 1, 1, 1, 1, 1,
-0.5717217, -0.604943, -2.087495, 1, 1, 1, 1, 1,
-0.5587899, -0.3890944, -4.353373, 1, 1, 1, 1, 1,
-0.5582954, 1.619685, 0.2092395, 1, 1, 1, 1, 1,
-0.557757, -1.521631, -1.381443, 1, 1, 1, 1, 1,
-0.5574694, 1.030797, -0.3527623, 1, 1, 1, 1, 1,
-0.5566017, -0.3547609, -3.370188, 1, 1, 1, 1, 1,
-0.5557577, 2.114077, 2.035565, 1, 1, 1, 1, 1,
-0.5480696, 0.1907281, -2.863034, 1, 1, 1, 1, 1,
-0.5469201, -0.6105835, -2.148496, 1, 1, 1, 1, 1,
-0.5447894, 0.7769369, 1.037954, 1, 1, 1, 1, 1,
-0.5442653, -0.01988925, -3.384089, 1, 1, 1, 1, 1,
-0.5412853, 0.2149462, -1.756949, 1, 1, 1, 1, 1,
-0.5370488, 0.2632239, -2.266428, 1, 1, 1, 1, 1,
-0.5363224, 1.455433, 0.5067981, 1, 1, 1, 1, 1,
-0.5362777, 0.1317172, -4.370209, 0, 0, 1, 1, 1,
-0.5329362, -0.3558438, -4.363421, 1, 0, 0, 1, 1,
-0.5327191, -1.204939, -2.017478, 1, 0, 0, 1, 1,
-0.5293924, 2.072632, -0.2933708, 1, 0, 0, 1, 1,
-0.5271568, 0.6011482, -1.580424, 1, 0, 0, 1, 1,
-0.5175136, -1.764753, -3.866225, 1, 0, 0, 1, 1,
-0.5102103, -0.8613761, -0.4570827, 0, 0, 0, 1, 1,
-0.5075625, -2.20488, -3.430952, 0, 0, 0, 1, 1,
-0.4991484, -0.9636425, -3.487926, 0, 0, 0, 1, 1,
-0.495333, -0.1969877, -1.33238, 0, 0, 0, 1, 1,
-0.4939529, 0.9411686, -1.367044, 0, 0, 0, 1, 1,
-0.4926678, -1.989382, -3.555249, 0, 0, 0, 1, 1,
-0.4864056, 1.612642, -0.6435778, 0, 0, 0, 1, 1,
-0.484745, 0.8255034, -0.7987972, 1, 1, 1, 1, 1,
-0.4823729, -0.281365, -2.587908, 1, 1, 1, 1, 1,
-0.4818652, -0.3605293, -2.767141, 1, 1, 1, 1, 1,
-0.4815647, 0.3835205, -4.016069, 1, 1, 1, 1, 1,
-0.4809881, 0.03461333, -1.417465, 1, 1, 1, 1, 1,
-0.4778789, 1.459242, -0.8354025, 1, 1, 1, 1, 1,
-0.4740191, -0.6587418, -2.910255, 1, 1, 1, 1, 1,
-0.4722502, 1.27266, -1.063463, 1, 1, 1, 1, 1,
-0.4711741, -0.08046948, -2.824018, 1, 1, 1, 1, 1,
-0.4685806, 1.345033, 0.04989395, 1, 1, 1, 1, 1,
-0.4634369, -1.664494, -2.458843, 1, 1, 1, 1, 1,
-0.4621887, -1.253848, -1.334997, 1, 1, 1, 1, 1,
-0.4601974, 0.4977623, 0.5839596, 1, 1, 1, 1, 1,
-0.4588079, 0.464124, 1.079562, 1, 1, 1, 1, 1,
-0.4548887, 0.2295295, -3.049212, 1, 1, 1, 1, 1,
-0.4515634, -0.656133, -2.443368, 0, 0, 1, 1, 1,
-0.4413809, -0.2505901, -2.102905, 1, 0, 0, 1, 1,
-0.435339, -0.7029471, -1.988289, 1, 0, 0, 1, 1,
-0.4339473, -0.2192845, -1.838327, 1, 0, 0, 1, 1,
-0.433276, 1.313801, -1.515237, 1, 0, 0, 1, 1,
-0.4291612, 2.177598, -0.09824762, 1, 0, 0, 1, 1,
-0.4290907, 1.957483, -1.185176, 0, 0, 0, 1, 1,
-0.4275484, -0.002164184, -0.9629258, 0, 0, 0, 1, 1,
-0.4254581, -0.8052008, -2.495298, 0, 0, 0, 1, 1,
-0.4235113, 0.1790407, -2.694132, 0, 0, 0, 1, 1,
-0.422765, -1.286354, -4.082817, 0, 0, 0, 1, 1,
-0.4202997, -1.916512, -2.363545, 0, 0, 0, 1, 1,
-0.4122409, -3.010326, -1.219645, 0, 0, 0, 1, 1,
-0.4069288, 0.842279, 1.115224, 1, 1, 1, 1, 1,
-0.4036029, 0.6963469, -0.7449141, 1, 1, 1, 1, 1,
-0.4035135, -1.780048, -2.755085, 1, 1, 1, 1, 1,
-0.403362, 0.2451044, -0.7813068, 1, 1, 1, 1, 1,
-0.4007982, -0.0963646, -0.4922336, 1, 1, 1, 1, 1,
-0.3993543, -0.8121564, -4.535552, 1, 1, 1, 1, 1,
-0.398648, 0.1367034, -3.453536, 1, 1, 1, 1, 1,
-0.3848189, 1.458712, 0.01134541, 1, 1, 1, 1, 1,
-0.3819586, 0.3072126, 0.2835336, 1, 1, 1, 1, 1,
-0.3803307, 0.4744551, -1.156618, 1, 1, 1, 1, 1,
-0.3801141, 0.2960671, -2.408849, 1, 1, 1, 1, 1,
-0.3774671, 0.3131934, -3.527997, 1, 1, 1, 1, 1,
-0.3757211, -0.3717083, -3.105412, 1, 1, 1, 1, 1,
-0.373692, 0.6768229, -0.3782148, 1, 1, 1, 1, 1,
-0.3713957, -0.4257734, -2.692366, 1, 1, 1, 1, 1,
-0.3690184, -0.304474, -2.748101, 0, 0, 1, 1, 1,
-0.3685603, -0.3941818, -3.017543, 1, 0, 0, 1, 1,
-0.3633308, -0.6162302, -2.236262, 1, 0, 0, 1, 1,
-0.3609659, 0.4292091, -1.180437, 1, 0, 0, 1, 1,
-0.3569556, 0.5883468, -2.18278, 1, 0, 0, 1, 1,
-0.3470578, 0.6560718, -0.615683, 1, 0, 0, 1, 1,
-0.3468276, 0.7491657, -0.845587, 0, 0, 0, 1, 1,
-0.3426122, 0.265907, -1.469919, 0, 0, 0, 1, 1,
-0.3424175, 1.221889, 0.2139263, 0, 0, 0, 1, 1,
-0.3421448, -0.7941592, -2.67309, 0, 0, 0, 1, 1,
-0.3405061, -2.316867, -3.077619, 0, 0, 0, 1, 1,
-0.3305715, 0.3777619, -0.4658063, 0, 0, 0, 1, 1,
-0.3286652, -0.8378569, -2.892868, 0, 0, 0, 1, 1,
-0.3278584, -0.2464603, -3.527339, 1, 1, 1, 1, 1,
-0.3269891, 1.707782, -0.8669194, 1, 1, 1, 1, 1,
-0.3266471, 0.2430368, 0.9569707, 1, 1, 1, 1, 1,
-0.3237564, 0.4724222, -2.999126, 1, 1, 1, 1, 1,
-0.3219332, 0.5493771, -1.390089, 1, 1, 1, 1, 1,
-0.3214557, 0.1728415, -0.4884463, 1, 1, 1, 1, 1,
-0.3170478, 1.492537, 0.1614821, 1, 1, 1, 1, 1,
-0.3146042, 1.678256, 0.3338606, 1, 1, 1, 1, 1,
-0.3143014, 1.055577, -0.6685171, 1, 1, 1, 1, 1,
-0.3121009, 0.03246014, -0.5837116, 1, 1, 1, 1, 1,
-0.3090735, -0.8537289, -3.730459, 1, 1, 1, 1, 1,
-0.3060501, 0.3104749, -0.3677993, 1, 1, 1, 1, 1,
-0.3050894, 0.9668307, -1.32326, 1, 1, 1, 1, 1,
-0.302701, -0.7296878, -2.19318, 1, 1, 1, 1, 1,
-0.3021708, -1.202277, -3.511024, 1, 1, 1, 1, 1,
-0.3016779, -1.814713, -3.040321, 0, 0, 1, 1, 1,
-0.2999716, 0.2921181, -2.265591, 1, 0, 0, 1, 1,
-0.2997486, -0.9319589, -4.872599, 1, 0, 0, 1, 1,
-0.2954784, 1.081317, -0.4734376, 1, 0, 0, 1, 1,
-0.2909514, -0.6952122, -2.137226, 1, 0, 0, 1, 1,
-0.289522, 0.6133472, 0.901299, 1, 0, 0, 1, 1,
-0.2888967, 1.229479, -0.3785448, 0, 0, 0, 1, 1,
-0.2877145, 0.655836, -1.216012, 0, 0, 0, 1, 1,
-0.2875869, -0.1474791, -0.9203543, 0, 0, 0, 1, 1,
-0.2823511, -0.08142438, -1.075813, 0, 0, 0, 1, 1,
-0.2773509, 0.2627007, -0.8655915, 0, 0, 0, 1, 1,
-0.2754262, 1.2829, -0.3174004, 0, 0, 0, 1, 1,
-0.2718326, -1.655558, -4.823162, 0, 0, 0, 1, 1,
-0.2718296, -0.855235, -1.627678, 1, 1, 1, 1, 1,
-0.2717246, -0.1747772, -1.408617, 1, 1, 1, 1, 1,
-0.2671429, 0.5984241, 0.413864, 1, 1, 1, 1, 1,
-0.2625547, 0.4947841, -1.576302, 1, 1, 1, 1, 1,
-0.2624482, 0.2580682, 0.6873066, 1, 1, 1, 1, 1,
-0.2603227, -0.8448409, -1.925897, 1, 1, 1, 1, 1,
-0.2563115, -1.529882, -3.624968, 1, 1, 1, 1, 1,
-0.2553172, 0.5526136, -0.7900332, 1, 1, 1, 1, 1,
-0.2519979, 1.892129, 1.038422, 1, 1, 1, 1, 1,
-0.2518605, -1.113809, -2.674251, 1, 1, 1, 1, 1,
-0.2494321, -0.7363689, -3.55215, 1, 1, 1, 1, 1,
-0.2481297, -0.826659, -2.653835, 1, 1, 1, 1, 1,
-0.2478524, -0.5451893, -3.285912, 1, 1, 1, 1, 1,
-0.2474318, 1.117018, 0.1375919, 1, 1, 1, 1, 1,
-0.2467248, -2.604995, -3.066317, 1, 1, 1, 1, 1,
-0.2416601, -0.2140498, -1.714582, 0, 0, 1, 1, 1,
-0.23644, -0.6254722, -2.954115, 1, 0, 0, 1, 1,
-0.2325073, 0.04475057, -1.169836, 1, 0, 0, 1, 1,
-0.2320241, 0.1457956, -1.282589, 1, 0, 0, 1, 1,
-0.2292095, 0.2225012, -0.51951, 1, 0, 0, 1, 1,
-0.2261653, 0.8931093, -0.2440621, 1, 0, 0, 1, 1,
-0.2257579, -0.3833798, -2.709299, 0, 0, 0, 1, 1,
-0.2237389, -0.993437, -3.418241, 0, 0, 0, 1, 1,
-0.2227521, 0.2674209, -1.218555, 0, 0, 0, 1, 1,
-0.2215758, -1.711316, -2.810024, 0, 0, 0, 1, 1,
-0.2208119, -1.71893, -3.197733, 0, 0, 0, 1, 1,
-0.2204709, 0.7686857, -1.244619, 0, 0, 0, 1, 1,
-0.2193792, -0.04040496, -0.8901206, 0, 0, 0, 1, 1,
-0.2164271, 0.5424702, -0.8944449, 1, 1, 1, 1, 1,
-0.2153295, -0.1666097, -1.64368, 1, 1, 1, 1, 1,
-0.2151308, 1.342799, 0.7072809, 1, 1, 1, 1, 1,
-0.2142957, -0.3865313, -4.378852, 1, 1, 1, 1, 1,
-0.2133567, 1.894736, -0.3323185, 1, 1, 1, 1, 1,
-0.2117875, 0.4982731, 0.8379375, 1, 1, 1, 1, 1,
-0.2093965, 0.1885622, -1.565202, 1, 1, 1, 1, 1,
-0.2090495, -0.3812188, -3.12402, 1, 1, 1, 1, 1,
-0.2088014, -0.1420483, -1.733968, 1, 1, 1, 1, 1,
-0.2010927, 0.8252746, -0.830996, 1, 1, 1, 1, 1,
-0.1916683, -0.6622642, -3.853007, 1, 1, 1, 1, 1,
-0.1900063, 0.4804995, -1.751952, 1, 1, 1, 1, 1,
-0.1890509, -0.4374876, -4.042946, 1, 1, 1, 1, 1,
-0.1867216, 0.8938758, 1.791172, 1, 1, 1, 1, 1,
-0.1861351, -0.1804947, -3.231713, 1, 1, 1, 1, 1,
-0.1860413, 0.02745166, -2.0463, 0, 0, 1, 1, 1,
-0.1857343, 0.6739315, -0.3575337, 1, 0, 0, 1, 1,
-0.1854588, -2.002883, -2.911477, 1, 0, 0, 1, 1,
-0.1831752, -0.6096921, -1.507684, 1, 0, 0, 1, 1,
-0.1775822, 0.6945175, -0.03004027, 1, 0, 0, 1, 1,
-0.1750978, -0.7474989, -3.507072, 1, 0, 0, 1, 1,
-0.1711296, 0.2194268, 0.3973915, 0, 0, 0, 1, 1,
-0.1707579, 0.4209256, -1.4136, 0, 0, 0, 1, 1,
-0.1619968, -1.241129, -2.991083, 0, 0, 0, 1, 1,
-0.1595336, 0.1044488, -1.526544, 0, 0, 0, 1, 1,
-0.1584728, -0.2743715, -2.450927, 0, 0, 0, 1, 1,
-0.157136, 1.324124, -0.6547713, 0, 0, 0, 1, 1,
-0.1555573, 0.5930043, -0.02912867, 0, 0, 0, 1, 1,
-0.1504166, -2.165263, -1.784773, 1, 1, 1, 1, 1,
-0.1465489, -0.06774095, -3.063174, 1, 1, 1, 1, 1,
-0.1462611, 1.982367, 0.1770243, 1, 1, 1, 1, 1,
-0.1449612, -1.173549, -0.7624145, 1, 1, 1, 1, 1,
-0.1446518, 0.8746041, 1.064324, 1, 1, 1, 1, 1,
-0.1427639, 0.5889592, 1.56722, 1, 1, 1, 1, 1,
-0.1329293, 1.591934, -0.2507435, 1, 1, 1, 1, 1,
-0.1325232, -0.2388564, -2.851565, 1, 1, 1, 1, 1,
-0.1318067, -2.108844, -4.105463, 1, 1, 1, 1, 1,
-0.1283594, 0.7650462, -1.317666, 1, 1, 1, 1, 1,
-0.1242776, 0.4477645, -1.727217, 1, 1, 1, 1, 1,
-0.1185256, 1.110988, -1.055107, 1, 1, 1, 1, 1,
-0.1184901, -0.9005579, -2.227938, 1, 1, 1, 1, 1,
-0.116914, -1.376117, -1.717429, 1, 1, 1, 1, 1,
-0.1121965, 0.03002408, -0.5264056, 1, 1, 1, 1, 1,
-0.1087672, 0.1315733, -3.149408, 0, 0, 1, 1, 1,
-0.1080827, 1.020243, -2.11409, 1, 0, 0, 1, 1,
-0.1054981, 0.6186197, 1.565595, 1, 0, 0, 1, 1,
-0.1030637, 0.9213314, 0.3874998, 1, 0, 0, 1, 1,
-0.1025535, -0.5130836, -3.095237, 1, 0, 0, 1, 1,
-0.1008907, 0.8370108, 0.8994117, 1, 0, 0, 1, 1,
-0.09629387, -0.925166, -3.007845, 0, 0, 0, 1, 1,
-0.09608414, -0.2239876, -2.527228, 0, 0, 0, 1, 1,
-0.09316407, -1.357463, -3.603114, 0, 0, 0, 1, 1,
-0.09021687, 0.1242913, 1.827523, 0, 0, 0, 1, 1,
-0.08968591, 1.064606, -0.4509849, 0, 0, 0, 1, 1,
-0.08859654, -0.1900534, -2.848155, 0, 0, 0, 1, 1,
-0.0885084, 0.6058807, -1.612741, 0, 0, 0, 1, 1,
-0.08622687, -0.001459989, -0.8498771, 1, 1, 1, 1, 1,
-0.08506368, 0.6748201, -0.5100371, 1, 1, 1, 1, 1,
-0.08330744, -1.889436, -3.256178, 1, 1, 1, 1, 1,
-0.08308459, 1.523766, 0.5066006, 1, 1, 1, 1, 1,
-0.08073961, 1.992265, -0.579915, 1, 1, 1, 1, 1,
-0.08003704, -1.037964, -3.645325, 1, 1, 1, 1, 1,
-0.07852861, -0.4943667, -3.7204, 1, 1, 1, 1, 1,
-0.0759198, -0.153937, -2.899777, 1, 1, 1, 1, 1,
-0.075634, 1.465693, 1.292679, 1, 1, 1, 1, 1,
-0.0744143, -0.2275976, -2.793547, 1, 1, 1, 1, 1,
-0.07402142, -2.663394, -2.09853, 1, 1, 1, 1, 1,
-0.07315169, 1.100335, -0.1413323, 1, 1, 1, 1, 1,
-0.07040064, -0.4102394, -1.701731, 1, 1, 1, 1, 1,
-0.06586054, -0.3534348, -1.149403, 1, 1, 1, 1, 1,
-0.06574935, 0.5976034, 0.2986848, 1, 1, 1, 1, 1,
-0.05988467, -0.04252328, -1.96767, 0, 0, 1, 1, 1,
-0.05730327, 0.2368728, 0.935642, 1, 0, 0, 1, 1,
-0.05683082, 1.360046, 1.426911, 1, 0, 0, 1, 1,
-0.05629582, 0.4146093, 1.150584, 1, 0, 0, 1, 1,
-0.05548763, 0.7661023, -1.3964, 1, 0, 0, 1, 1,
-0.05087506, -0.7761982, -3.462782, 1, 0, 0, 1, 1,
-0.04883908, -0.6033528, -4.142245, 0, 0, 0, 1, 1,
-0.04696294, 0.8014836, -0.7957259, 0, 0, 0, 1, 1,
-0.04639381, -1.161336, -0.4788377, 0, 0, 0, 1, 1,
-0.04558713, -1.398765, -3.793854, 0, 0, 0, 1, 1,
-0.04327938, 0.08480485, -0.6729051, 0, 0, 0, 1, 1,
-0.0420933, -0.6400291, -3.606567, 0, 0, 0, 1, 1,
-0.04109273, 0.9531773, -0.152146, 0, 0, 0, 1, 1,
-0.03999452, -1.016917, -3.969197, 1, 1, 1, 1, 1,
-0.03193413, 0.1270143, -1.19063, 1, 1, 1, 1, 1,
-0.03166291, -0.4983879, -2.695345, 1, 1, 1, 1, 1,
-0.03115068, 0.1384174, 1.311529, 1, 1, 1, 1, 1,
-0.02431247, 0.5855286, -1.016054, 1, 1, 1, 1, 1,
-0.02413192, -0.2292578, -4.890789, 1, 1, 1, 1, 1,
-0.02283917, -1.79055, -2.273785, 1, 1, 1, 1, 1,
-0.01969816, -0.2935344, -3.926028, 1, 1, 1, 1, 1,
-0.01858542, -0.1952413, -4.031332, 1, 1, 1, 1, 1,
-0.01708917, -0.7167919, -1.406697, 1, 1, 1, 1, 1,
-0.01592935, 1.867792, -0.3457508, 1, 1, 1, 1, 1,
-0.01395925, -0.1494749, -3.053334, 1, 1, 1, 1, 1,
-0.01048913, 0.6407297, -1.412169, 1, 1, 1, 1, 1,
-0.009263445, -0.09256803, -4.364934, 1, 1, 1, 1, 1,
-0.00413978, 2.071537, 1.078891, 1, 1, 1, 1, 1,
-0.00148525, -1.99505, -4.486554, 0, 0, 1, 1, 1,
2.830426e-05, -0.08835048, 1.454843, 1, 0, 0, 1, 1,
0.003733607, 0.2060558, 2.065639, 1, 0, 0, 1, 1,
0.004135536, 0.1994566, 0.3772359, 1, 0, 0, 1, 1,
0.006563196, 0.8301895, -1.283624, 1, 0, 0, 1, 1,
0.007263724, -0.09944919, 3.072999, 1, 0, 0, 1, 1,
0.009211574, -0.706421, 3.145874, 0, 0, 0, 1, 1,
0.01214057, -1.399781, 1.990715, 0, 0, 0, 1, 1,
0.01427044, 0.4392221, 0.2565692, 0, 0, 0, 1, 1,
0.01528882, 0.9500243, -1.22148, 0, 0, 0, 1, 1,
0.01730926, 0.7567136, 0.087758, 0, 0, 0, 1, 1,
0.01971666, 2.71305, -0.5372291, 0, 0, 0, 1, 1,
0.02199363, 0.7578859, 0.8483419, 0, 0, 0, 1, 1,
0.02708548, 1.694343, 0.3185307, 1, 1, 1, 1, 1,
0.0275748, -0.06195382, 2.929381, 1, 1, 1, 1, 1,
0.0386913, 0.7122219, 0.5436854, 1, 1, 1, 1, 1,
0.0410699, 0.04741927, 0.572426, 1, 1, 1, 1, 1,
0.04404689, 1.433295, -1.736117, 1, 1, 1, 1, 1,
0.04659262, -0.7455727, 3.056168, 1, 1, 1, 1, 1,
0.04707989, -1.446817, 3.204783, 1, 1, 1, 1, 1,
0.04711355, 0.6798963, 0.259111, 1, 1, 1, 1, 1,
0.04763405, -0.1720056, 2.16151, 1, 1, 1, 1, 1,
0.04862214, 0.1877732, 0.6803094, 1, 1, 1, 1, 1,
0.04875675, 0.9940982, -0.8080609, 1, 1, 1, 1, 1,
0.04976519, 0.1892526, 1.007316, 1, 1, 1, 1, 1,
0.05084849, -0.06397491, 1.791736, 1, 1, 1, 1, 1,
0.05510343, -0.2813231, 3.778537, 1, 1, 1, 1, 1,
0.05913042, 1.976699, -0.6202515, 1, 1, 1, 1, 1,
0.07031948, 1.426855, 1.248197, 0, 0, 1, 1, 1,
0.07042447, -0.8136652, 3.319915, 1, 0, 0, 1, 1,
0.07154839, 0.9723217, -0.5903029, 1, 0, 0, 1, 1,
0.07456283, -0.1169716, 1.568501, 1, 0, 0, 1, 1,
0.07696851, 1.484618, -0.8643026, 1, 0, 0, 1, 1,
0.07790682, 0.3167114, -0.112947, 1, 0, 0, 1, 1,
0.07857853, 0.5897991, -1.136722, 0, 0, 0, 1, 1,
0.07935485, -0.2809597, 2.804165, 0, 0, 0, 1, 1,
0.07982625, 0.3791419, 2.558721, 0, 0, 0, 1, 1,
0.08652865, -0.1961437, 2.741548, 0, 0, 0, 1, 1,
0.08725967, -1.001957, 3.684705, 0, 0, 0, 1, 1,
0.08834759, -0.7947559, 3.346014, 0, 0, 0, 1, 1,
0.09623262, 0.9872156, -0.1214272, 0, 0, 0, 1, 1,
0.09834024, 1.859468, -1.765818, 1, 1, 1, 1, 1,
0.1024103, -1.15474, 2.588797, 1, 1, 1, 1, 1,
0.1044679, -0.5057843, 1.890486, 1, 1, 1, 1, 1,
0.1074555, -1.109066, 3.671572, 1, 1, 1, 1, 1,
0.1078748, -1.973243, 3.275687, 1, 1, 1, 1, 1,
0.1099548, 0.2282352, 2.116363, 1, 1, 1, 1, 1,
0.1129519, 1.97366, 1.073343, 1, 1, 1, 1, 1,
0.1137659, 0.5417472, 0.01005409, 1, 1, 1, 1, 1,
0.1183647, 0.851759, 0.6086419, 1, 1, 1, 1, 1,
0.1214309, 0.004910728, 1.974284, 1, 1, 1, 1, 1,
0.1248237, -0.6284218, 4.466167, 1, 1, 1, 1, 1,
0.1284921, 0.1339819, 0.6880747, 1, 1, 1, 1, 1,
0.1306088, -0.7012668, 2.849757, 1, 1, 1, 1, 1,
0.1322864, -1.011388, 3.027829, 1, 1, 1, 1, 1,
0.1357424, 1.18521, 0.2390082, 1, 1, 1, 1, 1,
0.1368607, -0.5186861, 2.505655, 0, 0, 1, 1, 1,
0.1375793, -0.05541117, 2.20415, 1, 0, 0, 1, 1,
0.138385, -1.155637, 4.674284, 1, 0, 0, 1, 1,
0.1424991, 0.8697788, -0.6141077, 1, 0, 0, 1, 1,
0.1451991, 0.2545648, 1.268904, 1, 0, 0, 1, 1,
0.1486278, -0.6267647, 3.100856, 1, 0, 0, 1, 1,
0.1518701, 1.257255, 1.147089, 0, 0, 0, 1, 1,
0.1540671, 0.1023131, 1.908185, 0, 0, 0, 1, 1,
0.1619622, 0.08793271, 1.922206, 0, 0, 0, 1, 1,
0.1625996, -1.038189, 3.082957, 0, 0, 0, 1, 1,
0.1686781, -1.743028, 2.979759, 0, 0, 0, 1, 1,
0.1692059, 1.199324, 0.4902959, 0, 0, 0, 1, 1,
0.1696173, 1.201425, -0.7058412, 0, 0, 0, 1, 1,
0.1706642, -0.1228779, 0.6346965, 1, 1, 1, 1, 1,
0.1708453, 0.1641973, 0.378545, 1, 1, 1, 1, 1,
0.1715187, -0.4158172, 3.710127, 1, 1, 1, 1, 1,
0.1731506, 1.036828, -1.62746, 1, 1, 1, 1, 1,
0.1736533, 2.330768, 1.067999, 1, 1, 1, 1, 1,
0.1811406, -0.622989, 1.493969, 1, 1, 1, 1, 1,
0.1818618, -0.4828344, 3.82986, 1, 1, 1, 1, 1,
0.1860873, -1.03735, 2.561396, 1, 1, 1, 1, 1,
0.1928, -0.2030158, 5.301752, 1, 1, 1, 1, 1,
0.1954326, -1.700163, 1.659041, 1, 1, 1, 1, 1,
0.1991678, -1.434915, 4.400023, 1, 1, 1, 1, 1,
0.2013955, -1.091441, 2.910845, 1, 1, 1, 1, 1,
0.2020723, 0.9881303, -0.4478831, 1, 1, 1, 1, 1,
0.2021707, 1.075187, 0.1525468, 1, 1, 1, 1, 1,
0.2040696, 0.5246311, 0.7442856, 1, 1, 1, 1, 1,
0.208511, -0.06597257, 2.905518, 0, 0, 1, 1, 1,
0.2250458, 0.495656, -0.7990763, 1, 0, 0, 1, 1,
0.2259359, 2.110189, 0.3950163, 1, 0, 0, 1, 1,
0.2285276, -0.123729, 2.253985, 1, 0, 0, 1, 1,
0.2296329, -0.3615589, 2.057322, 1, 0, 0, 1, 1,
0.233625, 2.029298, 0.2222388, 1, 0, 0, 1, 1,
0.2345534, 0.6408206, -0.1005825, 0, 0, 0, 1, 1,
0.2359171, 0.9162163, -1.610743, 0, 0, 0, 1, 1,
0.2376261, 0.780849, 0.9761578, 0, 0, 0, 1, 1,
0.2419909, -1.6399, 3.781318, 0, 0, 0, 1, 1,
0.2461832, -1.083472, 2.065537, 0, 0, 0, 1, 1,
0.2465387, 1.067759, 0.796008, 0, 0, 0, 1, 1,
0.246882, -1.132021, 3.048992, 0, 0, 0, 1, 1,
0.248356, 0.04780665, 2.359476, 1, 1, 1, 1, 1,
0.2569422, 0.1301238, 2.735333, 1, 1, 1, 1, 1,
0.2578562, -0.6679046, 2.176843, 1, 1, 1, 1, 1,
0.259515, 0.08329798, 0.9685642, 1, 1, 1, 1, 1,
0.2599259, 0.4216447, -1.497175, 1, 1, 1, 1, 1,
0.2658694, 2.194159, -0.744001, 1, 1, 1, 1, 1,
0.2757576, -2.997763, 3.124282, 1, 1, 1, 1, 1,
0.2786122, -0.6390108, 0.9967346, 1, 1, 1, 1, 1,
0.2798041, -1.837483, 5.07518, 1, 1, 1, 1, 1,
0.2838031, -1.984757, 1.995221, 1, 1, 1, 1, 1,
0.284409, 0.1219611, 1.074669, 1, 1, 1, 1, 1,
0.28519, -0.08427705, 2.048654, 1, 1, 1, 1, 1,
0.286447, 0.007620083, 1.746585, 1, 1, 1, 1, 1,
0.2874556, -1.112231, 3.58177, 1, 1, 1, 1, 1,
0.2908221, 0.2976614, -0.6851221, 1, 1, 1, 1, 1,
0.292767, 0.4507063, 0.9333192, 0, 0, 1, 1, 1,
0.2948665, -1.927882, 2.230103, 1, 0, 0, 1, 1,
0.2952778, 0.3003212, 0.06155534, 1, 0, 0, 1, 1,
0.2972454, -0.1830103, 1.86516, 1, 0, 0, 1, 1,
0.2993407, -0.0593364, 0.7084634, 1, 0, 0, 1, 1,
0.3003819, -0.618025, 3.211978, 1, 0, 0, 1, 1,
0.3015107, 0.1950093, 0.4896056, 0, 0, 0, 1, 1,
0.3056366, 0.9909969, -1.741939, 0, 0, 0, 1, 1,
0.306965, -0.688484, 4.831393, 0, 0, 0, 1, 1,
0.312481, 0.2831373, 2.707138, 0, 0, 0, 1, 1,
0.3155943, 0.8968737, 0.646073, 0, 0, 0, 1, 1,
0.3157199, 0.5494319, 0.9098345, 0, 0, 0, 1, 1,
0.3180521, 0.411075, 2.662137, 0, 0, 0, 1, 1,
0.3188506, -0.2321236, 1.211017, 1, 1, 1, 1, 1,
0.321158, -1.13114, 1.492514, 1, 1, 1, 1, 1,
0.3237806, 0.8592988, -0.3927518, 1, 1, 1, 1, 1,
0.326578, 1.180392, -1.985715, 1, 1, 1, 1, 1,
0.3268017, -0.0571338, 1.190163, 1, 1, 1, 1, 1,
0.3282737, -0.4837747, 3.31423, 1, 1, 1, 1, 1,
0.3311496, -0.9980288, 0.7356907, 1, 1, 1, 1, 1,
0.3324572, 0.5739027, 1.257884, 1, 1, 1, 1, 1,
0.3348601, 0.3948953, 1.573811, 1, 1, 1, 1, 1,
0.3369184, 0.09472186, 1.119757, 1, 1, 1, 1, 1,
0.3443489, -0.1680297, 2.971089, 1, 1, 1, 1, 1,
0.3483696, -0.2316345, 3.372481, 1, 1, 1, 1, 1,
0.350468, 0.8179096, 0.5862834, 1, 1, 1, 1, 1,
0.354437, 0.2755871, 2.863225, 1, 1, 1, 1, 1,
0.3560831, 0.4099324, 0.04505219, 1, 1, 1, 1, 1,
0.357205, 1.283663, 1.375948, 0, 0, 1, 1, 1,
0.3631391, 0.3210594, 0.6855438, 1, 0, 0, 1, 1,
0.3635589, -0.897653, 3.490318, 1, 0, 0, 1, 1,
0.3658013, 0.4559753, 1.130421, 1, 0, 0, 1, 1,
0.370888, 0.2888213, -0.5968841, 1, 0, 0, 1, 1,
0.3720128, -0.562187, 4.91056, 1, 0, 0, 1, 1,
0.3744567, 0.4206451, 1.474728, 0, 0, 0, 1, 1,
0.3748922, 0.9232885, -1.52249, 0, 0, 0, 1, 1,
0.3752248, 0.1427798, -0.1714715, 0, 0, 0, 1, 1,
0.3795587, 0.991756, -0.9199017, 0, 0, 0, 1, 1,
0.381878, 2.195095, 0.1692956, 0, 0, 0, 1, 1,
0.3853736, 0.1527423, 0.9206994, 0, 0, 0, 1, 1,
0.3888292, -0.2162797, 0.7036788, 0, 0, 0, 1, 1,
0.392852, 0.6595932, 0.9522222, 1, 1, 1, 1, 1,
0.3966654, 0.6626436, 1.253588, 1, 1, 1, 1, 1,
0.4003068, -2.483209, 4.972176, 1, 1, 1, 1, 1,
0.4005694, -1.63986, 1.830866, 1, 1, 1, 1, 1,
0.4057126, 1.137517, 1.204211, 1, 1, 1, 1, 1,
0.4074873, -2.278705, 2.294779, 1, 1, 1, 1, 1,
0.4198428, 1.559633, -0.5183123, 1, 1, 1, 1, 1,
0.4271775, -0.2785732, 3.904685, 1, 1, 1, 1, 1,
0.4274136, -1.021031, 2.34529, 1, 1, 1, 1, 1,
0.435493, -0.1324541, 1.443738, 1, 1, 1, 1, 1,
0.4388797, -1.297821, 4.511031, 1, 1, 1, 1, 1,
0.4404648, 0.1681004, 0.4814342, 1, 1, 1, 1, 1,
0.449806, -1.014196, 2.519996, 1, 1, 1, 1, 1,
0.4571238, -0.9241387, 2.021596, 1, 1, 1, 1, 1,
0.4614532, 0.450105, 0.5985444, 1, 1, 1, 1, 1,
0.4617067, -1.72756, 1.06336, 0, 0, 1, 1, 1,
0.4634162, 1.240031, 0.6774147, 1, 0, 0, 1, 1,
0.4650273, -0.6963193, 1.320426, 1, 0, 0, 1, 1,
0.465311, 0.08162111, 3.515018, 1, 0, 0, 1, 1,
0.465739, 1.269084, 0.3079408, 1, 0, 0, 1, 1,
0.4683388, 0.6890437, 0.5674286, 1, 0, 0, 1, 1,
0.469474, 1.082857, 2.070356, 0, 0, 0, 1, 1,
0.4716364, 0.8326825, -0.3488075, 0, 0, 0, 1, 1,
0.4772266, 0.285641, 2.871379, 0, 0, 0, 1, 1,
0.4781071, 0.38709, -0.5527264, 0, 0, 0, 1, 1,
0.4806627, -0.694735, 0.7233182, 0, 0, 0, 1, 1,
0.481943, 0.5522962, 1.458104, 0, 0, 0, 1, 1,
0.4835258, 0.3229942, -1.503619, 0, 0, 0, 1, 1,
0.4847417, 0.9129687, -0.6753526, 1, 1, 1, 1, 1,
0.4877705, -1.225377, 5.418649, 1, 1, 1, 1, 1,
0.4892877, 1.157041, 1.120365, 1, 1, 1, 1, 1,
0.4896154, 0.2810718, 0.4521627, 1, 1, 1, 1, 1,
0.4913695, -0.4624505, 2.133394, 1, 1, 1, 1, 1,
0.4934532, 1.048799, 1.161537, 1, 1, 1, 1, 1,
0.4960878, -1.697584, 1.985232, 1, 1, 1, 1, 1,
0.4985015, 0.6071907, 2.677258, 1, 1, 1, 1, 1,
0.498531, -1.649198, 2.056603, 1, 1, 1, 1, 1,
0.4989289, 2.400319, -1.944542, 1, 1, 1, 1, 1,
0.5000306, -0.2021993, 2.892522, 1, 1, 1, 1, 1,
0.5007985, -0.1978389, 1.783445, 1, 1, 1, 1, 1,
0.5014544, -1.284545, 4.105488, 1, 1, 1, 1, 1,
0.5042313, -0.7068613, 4.035684, 1, 1, 1, 1, 1,
0.50757, -0.4654439, 3.450491, 1, 1, 1, 1, 1,
0.5102457, 0.02375355, 1.212832, 0, 0, 1, 1, 1,
0.5109411, -1.72758, 1.603226, 1, 0, 0, 1, 1,
0.5111801, 0.4240161, 2.500837, 1, 0, 0, 1, 1,
0.5123942, -0.3579323, 2.045543, 1, 0, 0, 1, 1,
0.5144144, -2.068195, 1.612776, 1, 0, 0, 1, 1,
0.5158189, -0.8618925, 1.235427, 1, 0, 0, 1, 1,
0.5192376, -0.8350115, 2.350549, 0, 0, 0, 1, 1,
0.5220796, -1.299883, 3.037981, 0, 0, 0, 1, 1,
0.5277655, 2.008956, -0.8029116, 0, 0, 0, 1, 1,
0.5309218, -1.381461, 2.220957, 0, 0, 0, 1, 1,
0.5361565, -1.120563, 1.69585, 0, 0, 0, 1, 1,
0.5390509, 1.174857, -0.5695484, 0, 0, 0, 1, 1,
0.5515007, 0.9475469, 1.559668, 0, 0, 0, 1, 1,
0.5525428, 0.8132423, 2.899887, 1, 1, 1, 1, 1,
0.561302, -0.3541523, 1.791932, 1, 1, 1, 1, 1,
0.5641448, -0.6957979, 2.379424, 1, 1, 1, 1, 1,
0.567771, -0.4316725, 2.189335, 1, 1, 1, 1, 1,
0.5706834, 1.223089, 1.123551, 1, 1, 1, 1, 1,
0.5714768, -0.1254236, 1.823047, 1, 1, 1, 1, 1,
0.5754206, 0.7631008, 0.7161987, 1, 1, 1, 1, 1,
0.5771046, -1.065367, 1.971044, 1, 1, 1, 1, 1,
0.5819345, 1.48738, -1.021488, 1, 1, 1, 1, 1,
0.5831261, -0.7809059, 2.60018, 1, 1, 1, 1, 1,
0.5895091, 0.7297658, 0.5766054, 1, 1, 1, 1, 1,
0.5910138, 0.3208314, 0.6542224, 1, 1, 1, 1, 1,
0.5984048, 0.2058384, 0.6478018, 1, 1, 1, 1, 1,
0.6005898, -1.534993, 3.109382, 1, 1, 1, 1, 1,
0.6032657, 1.060187, 0.9151345, 1, 1, 1, 1, 1,
0.6083669, -0.7119473, 2.164648, 0, 0, 1, 1, 1,
0.6116701, 0.7903086, -0.610393, 1, 0, 0, 1, 1,
0.6127069, 0.4187741, 0.6407635, 1, 0, 0, 1, 1,
0.6170301, 0.6043445, 1.580001, 1, 0, 0, 1, 1,
0.6176751, -0.1443067, 2.092038, 1, 0, 0, 1, 1,
0.6180782, 0.1307838, 1.482817, 1, 0, 0, 1, 1,
0.6187312, 0.3339547, 1.128334, 0, 0, 0, 1, 1,
0.6194075, 1.101675, -0.8660304, 0, 0, 0, 1, 1,
0.6297835, -1.502516, 2.714248, 0, 0, 0, 1, 1,
0.6307988, -0.4170469, 2.795101, 0, 0, 0, 1, 1,
0.6309883, 0.07161007, 0.07297923, 0, 0, 0, 1, 1,
0.6351463, 0.6970066, 1.697507, 0, 0, 0, 1, 1,
0.6403459, 1.310546, 0.1804986, 0, 0, 0, 1, 1,
0.6549475, 1.175131, 0.7085896, 1, 1, 1, 1, 1,
0.6563999, 1.489284, 0.3468765, 1, 1, 1, 1, 1,
0.6585516, -0.2491445, 2.196378, 1, 1, 1, 1, 1,
0.6717483, 0.7546746, 1.379237, 1, 1, 1, 1, 1,
0.6724776, 0.15526, -0.5091366, 1, 1, 1, 1, 1,
0.6734369, 0.03606619, 0.2745096, 1, 1, 1, 1, 1,
0.6747028, -0.1656671, 0.3895681, 1, 1, 1, 1, 1,
0.6785768, 0.6752691, 1.437837, 1, 1, 1, 1, 1,
0.6794849, -0.1786649, 2.56738, 1, 1, 1, 1, 1,
0.6814619, -0.2241532, 3.415915, 1, 1, 1, 1, 1,
0.6836991, 1.518885, -0.02943586, 1, 1, 1, 1, 1,
0.6842934, -1.387946, 3.098879, 1, 1, 1, 1, 1,
0.6848888, 0.141052, 1.12904, 1, 1, 1, 1, 1,
0.6867672, 1.525968, 1.384718, 1, 1, 1, 1, 1,
0.6907437, 0.06059092, 1.212205, 1, 1, 1, 1, 1,
0.6936843, 0.3380743, 1.347057, 0, 0, 1, 1, 1,
0.6964478, -0.8293732, 1.975827, 1, 0, 0, 1, 1,
0.6999061, -1.439223, 3.307587, 1, 0, 0, 1, 1,
0.7047699, 1.803413, 0.7349761, 1, 0, 0, 1, 1,
0.7111971, -0.03071419, 1.655487, 1, 0, 0, 1, 1,
0.7231882, 0.5897885, -0.6938673, 1, 0, 0, 1, 1,
0.7251505, 0.5491908, 2.195914, 0, 0, 0, 1, 1,
0.7259443, -0.3090684, 3.01323, 0, 0, 0, 1, 1,
0.7278094, -0.6577836, 3.586232, 0, 0, 0, 1, 1,
0.7297217, 1.71691, -0.7663951, 0, 0, 0, 1, 1,
0.7340683, -0.2622186, 1.779438, 0, 0, 0, 1, 1,
0.7344524, -0.909057, 2.471657, 0, 0, 0, 1, 1,
0.7373413, -1.819422, 0.1225655, 0, 0, 0, 1, 1,
0.7440799, -0.02644104, 2.030021, 1, 1, 1, 1, 1,
0.7562572, -0.564301, 1.963401, 1, 1, 1, 1, 1,
0.758569, 0.5893781, 0.9296088, 1, 1, 1, 1, 1,
0.7660003, 0.1320092, 1.743869, 1, 1, 1, 1, 1,
0.7669467, -0.5552619, 2.846033, 1, 1, 1, 1, 1,
0.7735542, -0.8613804, 3.282328, 1, 1, 1, 1, 1,
0.7758862, -0.4285875, 0.1102699, 1, 1, 1, 1, 1,
0.7816017, 0.1416829, 0.09451487, 1, 1, 1, 1, 1,
0.7882057, -0.1257808, 2.87016, 1, 1, 1, 1, 1,
0.7920579, -0.1232949, 1.205267, 1, 1, 1, 1, 1,
0.7926026, -0.4406741, 2.171696, 1, 1, 1, 1, 1,
0.7946386, 0.09405432, 1.707094, 1, 1, 1, 1, 1,
0.7983288, 0.4968557, 1.589784, 1, 1, 1, 1, 1,
0.8007001, -0.1266473, 2.453035, 1, 1, 1, 1, 1,
0.8032434, 0.2864095, 0.9883621, 1, 1, 1, 1, 1,
0.8048331, -1.030619, 2.264106, 0, 0, 1, 1, 1,
0.8062057, -0.0851171, 1.041612, 1, 0, 0, 1, 1,
0.8081183, -0.8754286, 1.527478, 1, 0, 0, 1, 1,
0.8151749, 0.9797691, 0.3617683, 1, 0, 0, 1, 1,
0.8152396, 0.3818053, -1.006417, 1, 0, 0, 1, 1,
0.8210582, 2.547263, -1.582032, 1, 0, 0, 1, 1,
0.8210765, -1.999619, 3.070756, 0, 0, 0, 1, 1,
0.8219042, -1.357939, 3.68949, 0, 0, 0, 1, 1,
0.822152, -0.5205934, 3.023117, 0, 0, 0, 1, 1,
0.8257743, -1.24756, 2.493165, 0, 0, 0, 1, 1,
0.8296668, -2.111077, 1.953981, 0, 0, 0, 1, 1,
0.8311486, -0.09449929, 3.110002, 0, 0, 0, 1, 1,
0.8322459, 0.3939995, -1.023274, 0, 0, 0, 1, 1,
0.8322572, -1.390167, 3.931246, 1, 1, 1, 1, 1,
0.8355172, -0.9233469, 4.056549, 1, 1, 1, 1, 1,
0.8369137, 2.555241, 0.3665079, 1, 1, 1, 1, 1,
0.8376893, -0.0308273, 2.26446, 1, 1, 1, 1, 1,
0.8414949, 2.809316, 0.1470682, 1, 1, 1, 1, 1,
0.8447749, 0.5840581, 1.921164, 1, 1, 1, 1, 1,
0.8475407, -0.6683394, 4.022003, 1, 1, 1, 1, 1,
0.8641393, 0.2432813, 1.910059, 1, 1, 1, 1, 1,
0.8709806, -1.555083, 3.08873, 1, 1, 1, 1, 1,
0.8769684, 0.03684107, 3.07585, 1, 1, 1, 1, 1,
0.8806276, -1.081788, 2.656943, 1, 1, 1, 1, 1,
0.8834197, -0.6572031, 3.715453, 1, 1, 1, 1, 1,
0.8840489, -1.272739, 0.9662955, 1, 1, 1, 1, 1,
0.8859048, 0.5185016, 1.038833, 1, 1, 1, 1, 1,
0.8894961, 0.4399292, 1.286156, 1, 1, 1, 1, 1,
0.8938276, -1.190684, 2.830257, 0, 0, 1, 1, 1,
0.8978459, 1.043956, 1.020474, 1, 0, 0, 1, 1,
0.8992835, -0.954206, 1.351605, 1, 0, 0, 1, 1,
0.8996592, 0.06314456, 0.858108, 1, 0, 0, 1, 1,
0.9031358, -0.06904536, 1.562299, 1, 0, 0, 1, 1,
0.9048575, -0.2860155, 2.695809, 1, 0, 0, 1, 1,
0.9092829, -0.7235626, 4.527461, 0, 0, 0, 1, 1,
0.910181, -1.015919, -0.8330348, 0, 0, 0, 1, 1,
0.9121476, 1.879746, 2.273926, 0, 0, 0, 1, 1,
0.9192613, -0.1271542, 1.262719, 0, 0, 0, 1, 1,
0.9245875, -0.5599591, 0.9156933, 0, 0, 0, 1, 1,
0.9279255, 2.156777, -0.922495, 0, 0, 0, 1, 1,
0.9340469, -1.147839, 3.824841, 0, 0, 0, 1, 1,
0.9401888, -1.060896, 4.554273, 1, 1, 1, 1, 1,
0.9410266, -0.1062012, 1.035243, 1, 1, 1, 1, 1,
0.9498779, 1.451422, 1.091289, 1, 1, 1, 1, 1,
0.9533589, 0.6503172, -0.3343402, 1, 1, 1, 1, 1,
0.9636039, 0.8796783, -1.233198, 1, 1, 1, 1, 1,
0.96967, -0.3485325, 1.469369, 1, 1, 1, 1, 1,
0.9864259, 0.1173805, 2.609404, 1, 1, 1, 1, 1,
0.9957289, -0.9138053, 3.051633, 1, 1, 1, 1, 1,
1.001372, -0.7593447, 1.157982, 1, 1, 1, 1, 1,
1.00156, -2.016705, 2.66532, 1, 1, 1, 1, 1,
1.004434, -0.8093892, 1.690647, 1, 1, 1, 1, 1,
1.005551, -0.1911754, 1.066846, 1, 1, 1, 1, 1,
1.012085, -1.036989, 1.774999, 1, 1, 1, 1, 1,
1.027739, 0.3905055, 1.624928, 1, 1, 1, 1, 1,
1.036005, -2.057974, 3.118284, 1, 1, 1, 1, 1,
1.037166, -0.4039019, 2.578136, 0, 0, 1, 1, 1,
1.049995, 0.310434, 1.71463, 1, 0, 0, 1, 1,
1.056732, -0.6543926, 1.909066, 1, 0, 0, 1, 1,
1.056935, 0.5762103, 0.9669337, 1, 0, 0, 1, 1,
1.060258, 0.1783723, 1.36172, 1, 0, 0, 1, 1,
1.06202, 0.582908, 2.293255, 1, 0, 0, 1, 1,
1.081019, 1.576961, 1.794719, 0, 0, 0, 1, 1,
1.083217, -0.2446562, 2.849425, 0, 0, 0, 1, 1,
1.086532, 1.768676, 1.106303, 0, 0, 0, 1, 1,
1.088131, -0.149388, 0.851905, 0, 0, 0, 1, 1,
1.089165, -2.077901, 3.854292, 0, 0, 0, 1, 1,
1.098617, -0.3087144, 1.730352, 0, 0, 0, 1, 1,
1.103108, 1.283077, 0.7072001, 0, 0, 0, 1, 1,
1.109725, -0.01858029, 2.158184, 1, 1, 1, 1, 1,
1.11329, 0.7108094, -0.7317657, 1, 1, 1, 1, 1,
1.113411, -0.8074356, 2.964107, 1, 1, 1, 1, 1,
1.124187, -0.2647472, 1.97006, 1, 1, 1, 1, 1,
1.125517, -0.03701013, 0.9387412, 1, 1, 1, 1, 1,
1.131953, -0.07903166, 2.299416, 1, 1, 1, 1, 1,
1.135511, 0.08535165, 1.194035, 1, 1, 1, 1, 1,
1.145436, -0.5561652, 1.521761, 1, 1, 1, 1, 1,
1.154247, 0.06094916, 0.9903913, 1, 1, 1, 1, 1,
1.155553, -1.422158, 1.491843, 1, 1, 1, 1, 1,
1.161432, -1.420655, 2.201698, 1, 1, 1, 1, 1,
1.161651, -1.389916, 2.383129, 1, 1, 1, 1, 1,
1.162294, 0.8248157, 0.09193595, 1, 1, 1, 1, 1,
1.163467, -1.11802, 1.568279, 1, 1, 1, 1, 1,
1.166816, 1.33471, 0.1275662, 1, 1, 1, 1, 1,
1.168475, -0.588773, 2.009002, 0, 0, 1, 1, 1,
1.17012, -0.2494776, 4.237413, 1, 0, 0, 1, 1,
1.181639, -1.011731, 3.416552, 1, 0, 0, 1, 1,
1.19553, 1.564917, 1.9305, 1, 0, 0, 1, 1,
1.19831, 0.5572433, 2.047147, 1, 0, 0, 1, 1,
1.203038, -0.6307984, 1.020647, 1, 0, 0, 1, 1,
1.206704, -0.778156, 3.336388, 0, 0, 0, 1, 1,
1.208858, -1.959337, 3.14143, 0, 0, 0, 1, 1,
1.21476, -1.90881, 2.397917, 0, 0, 0, 1, 1,
1.215853, 0.1032618, 0.6424747, 0, 0, 0, 1, 1,
1.217488, -0.5241122, 0.3002178, 0, 0, 0, 1, 1,
1.219864, 0.372074, 0.9723253, 0, 0, 0, 1, 1,
1.220268, -0.2789844, 2.140043, 0, 0, 0, 1, 1,
1.225663, -0.6261703, 1.714594, 1, 1, 1, 1, 1,
1.233398, -0.5033171, 2.131725, 1, 1, 1, 1, 1,
1.233942, 0.5472479, 2.069707, 1, 1, 1, 1, 1,
1.238729, -1.356895, 2.63584, 1, 1, 1, 1, 1,
1.24278, -0.2914072, 0.9581962, 1, 1, 1, 1, 1,
1.247632, 1.264127, 0.2525272, 1, 1, 1, 1, 1,
1.2481, 0.2122401, 3.324332, 1, 1, 1, 1, 1,
1.24847, 0.5314459, -0.2668386, 1, 1, 1, 1, 1,
1.249405, 0.7618623, 0.2069423, 1, 1, 1, 1, 1,
1.255507, 0.403451, 1.306889, 1, 1, 1, 1, 1,
1.268783, -1.111406, 1.728506, 1, 1, 1, 1, 1,
1.29911, -0.5626436, 2.491346, 1, 1, 1, 1, 1,
1.312402, 1.302122, 1.447607, 1, 1, 1, 1, 1,
1.321783, -1.277371, 2.918475, 1, 1, 1, 1, 1,
1.32918, 0.937357, 1.137336, 1, 1, 1, 1, 1,
1.340195, -0.864489, 2.858167, 0, 0, 1, 1, 1,
1.348255, -0.3295137, 0.4969839, 1, 0, 0, 1, 1,
1.357513, -0.8851966, 3.918367, 1, 0, 0, 1, 1,
1.364455, 0.1061096, 1.360988, 1, 0, 0, 1, 1,
1.36778, 0.9239876, -1.79214, 1, 0, 0, 1, 1,
1.367792, -1.184605, 2.389204, 1, 0, 0, 1, 1,
1.368962, 0.9467003, -0.117869, 0, 0, 0, 1, 1,
1.371487, 0.3991798, 2.532735, 0, 0, 0, 1, 1,
1.378295, 0.07730152, 1.115041, 0, 0, 0, 1, 1,
1.399054, 2.068156, 1.511891, 0, 0, 0, 1, 1,
1.400758, -1.224775, 2.673023, 0, 0, 0, 1, 1,
1.404972, 0.824581, 2.16911, 0, 0, 0, 1, 1,
1.405322, -0.4808372, 3.102307, 0, 0, 0, 1, 1,
1.419598, -0.3875203, 1.513845, 1, 1, 1, 1, 1,
1.461687, 0.2123141, -0.1546931, 1, 1, 1, 1, 1,
1.462424, 0.346972, 1.920455, 1, 1, 1, 1, 1,
1.46755, 0.3793363, -0.3376828, 1, 1, 1, 1, 1,
1.468906, 0.9779027, 1.575797, 1, 1, 1, 1, 1,
1.469173, -1.604098, 2.355885, 1, 1, 1, 1, 1,
1.470918, 0.142956, 0.8349469, 1, 1, 1, 1, 1,
1.471899, -0.1344349, 0.9833476, 1, 1, 1, 1, 1,
1.486784, 0.8957788, 1.289352, 1, 1, 1, 1, 1,
1.499017, 0.02003956, 4.348556, 1, 1, 1, 1, 1,
1.509693, -0.9130003, 1.910228, 1, 1, 1, 1, 1,
1.516243, 0.6277919, 2.689023, 1, 1, 1, 1, 1,
1.521665, 0.6514037, 0.8153069, 1, 1, 1, 1, 1,
1.52917, 1.491169, 1.500658, 1, 1, 1, 1, 1,
1.531235, -1.1193, 1.655026, 1, 1, 1, 1, 1,
1.532103, 1.488678, -0.2368893, 0, 0, 1, 1, 1,
1.534647, -0.5663521, 1.54749, 1, 0, 0, 1, 1,
1.534769, -1.319613, 2.849355, 1, 0, 0, 1, 1,
1.543283, 0.01860135, -0.8325291, 1, 0, 0, 1, 1,
1.55231, -0.02105413, 1.063306, 1, 0, 0, 1, 1,
1.55258, 0.791053, 0.8071749, 1, 0, 0, 1, 1,
1.553753, -0.3515966, 0.4020298, 0, 0, 0, 1, 1,
1.555383, 0.2069115, -0.4351495, 0, 0, 0, 1, 1,
1.558816, -0.2193717, 3.444722, 0, 0, 0, 1, 1,
1.564066, 0.1143869, 0.0123645, 0, 0, 0, 1, 1,
1.5698, -0.7316602, 0.6824747, 0, 0, 0, 1, 1,
1.57773, -0.771636, 1.158702, 0, 0, 0, 1, 1,
1.583831, -0.5374455, 1.120521, 0, 0, 0, 1, 1,
1.596464, 1.05507, 1.416509, 1, 1, 1, 1, 1,
1.604709, -1.464326, 3.477686, 1, 1, 1, 1, 1,
1.607105, 0.5177423, -0.128221, 1, 1, 1, 1, 1,
1.608858, -0.4786153, 0.7156687, 1, 1, 1, 1, 1,
1.613114, -0.2772629, 2.248586, 1, 1, 1, 1, 1,
1.614131, 0.1166179, 2.370857, 1, 1, 1, 1, 1,
1.623366, -0.4158506, 3.222018, 1, 1, 1, 1, 1,
1.623506, 1.433142, -0.03599464, 1, 1, 1, 1, 1,
1.65025, 2.10674, 1.232388, 1, 1, 1, 1, 1,
1.654051, -0.03299361, -0.02113143, 1, 1, 1, 1, 1,
1.655796, 0.744627, 0.9535099, 1, 1, 1, 1, 1,
1.671753, -0.5795518, 3.306036, 1, 1, 1, 1, 1,
1.682541, 0.9737594, 0.7118706, 1, 1, 1, 1, 1,
1.682705, 0.3003915, 0.1944281, 1, 1, 1, 1, 1,
1.684862, 0.409682, -0.2398424, 1, 1, 1, 1, 1,
1.688609, -0.02284051, 2.394326, 0, 0, 1, 1, 1,
1.704421, 1.855185, 1.461805, 1, 0, 0, 1, 1,
1.706713, -0.01336836, 1.684661, 1, 0, 0, 1, 1,
1.714185, 1.140829, 1.487768, 1, 0, 0, 1, 1,
1.7439, -0.09454963, 1.816211, 1, 0, 0, 1, 1,
1.747034, 0.3625746, 1.590932, 1, 0, 0, 1, 1,
1.749464, -0.7146648, 1.29012, 0, 0, 0, 1, 1,
1.761941, 0.2783427, -0.4629649, 0, 0, 0, 1, 1,
1.765662, 0.865519, 1.541883, 0, 0, 0, 1, 1,
1.788696, 0.8448417, 0.9082342, 0, 0, 0, 1, 1,
1.797901, -1.705508, 4.629075, 0, 0, 0, 1, 1,
1.801824, 0.1955805, 3.348983, 0, 0, 0, 1, 1,
1.855657, 1.466109, 2.904393, 0, 0, 0, 1, 1,
1.898122, -1.934822, 0.2932699, 1, 1, 1, 1, 1,
1.915465, 0.9387006, -0.2054744, 1, 1, 1, 1, 1,
1.921569, -0.9874592, 2.595988, 1, 1, 1, 1, 1,
1.933399, -1.91493, 3.275717, 1, 1, 1, 1, 1,
1.934526, 1.814055, -1.0703, 1, 1, 1, 1, 1,
1.940786, 0.06646158, 0.6634995, 1, 1, 1, 1, 1,
1.947123, -0.9317732, -0.03522978, 1, 1, 1, 1, 1,
1.990123, 1.187611, 0.7675316, 1, 1, 1, 1, 1,
1.990331, 0.4711577, 2.614483, 1, 1, 1, 1, 1,
1.99522, -0.9814607, 2.177343, 1, 1, 1, 1, 1,
2.036706, -1.9275, 2.055392, 1, 1, 1, 1, 1,
2.051273, 1.073529, 1.342381, 1, 1, 1, 1, 1,
2.05162, -0.9499698, 0.2637419, 1, 1, 1, 1, 1,
2.05257, -2.093041, 3.294608, 1, 1, 1, 1, 1,
2.052853, -0.7999293, 1.468554, 1, 1, 1, 1, 1,
2.076478, -0.576568, 1.03503, 0, 0, 1, 1, 1,
2.094719, 1.204351, -0.5967757, 1, 0, 0, 1, 1,
2.102507, 1.691083, 1.368766, 1, 0, 0, 1, 1,
2.104308, 1.696708, 1.048635, 1, 0, 0, 1, 1,
2.189029, 1.409108, 0.9571295, 1, 0, 0, 1, 1,
2.194502, 0.5349647, -1.257144, 1, 0, 0, 1, 1,
2.209988, -0.1093442, 1.875473, 0, 0, 0, 1, 1,
2.21367, 0.3002873, 1.948469, 0, 0, 0, 1, 1,
2.257791, 0.9758536, 2.039006, 0, 0, 0, 1, 1,
2.267538, 1.07853, 1.667754, 0, 0, 0, 1, 1,
2.3367, 1.479174, 1.114143, 0, 0, 0, 1, 1,
2.381961, -1.083562, 3.036129, 0, 0, 0, 1, 1,
2.387958, 0.919222, 1.334856, 0, 0, 0, 1, 1,
2.390442, -0.7698039, 2.869547, 1, 1, 1, 1, 1,
2.413771, 0.2837243, 1.14086, 1, 1, 1, 1, 1,
2.491729, -0.7056281, -0.09124756, 1, 1, 1, 1, 1,
2.606895, 1.008926, 1.41065, 1, 1, 1, 1, 1,
2.667196, 0.2716332, 1.229479, 1, 1, 1, 1, 1,
2.737216, -0.06158818, -0.7745243, 1, 1, 1, 1, 1,
3.208908, 1.494621, 1.141563, 1, 1, 1, 1, 1
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
var radius = 9.201949;
var distance = 32.32145;
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
mvMatrix.translate( -0.1085674, 0.100505, -0.2639301 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.32145);
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
