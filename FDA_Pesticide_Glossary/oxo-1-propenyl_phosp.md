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
-3.732105, 0.0140769, -2.000925, 1, 0, 0, 1,
-3.272024, -0.116588, -1.635182, 1, 0.007843138, 0, 1,
-2.894027, -0.3652313, -2.061711, 1, 0.01176471, 0, 1,
-2.738255, -0.2059848, -0.7381329, 1, 0.01960784, 0, 1,
-2.629176, 1.517757, -1.083732, 1, 0.02352941, 0, 1,
-2.515783, 0.8716704, -3.040269, 1, 0.03137255, 0, 1,
-2.514555, 0.9210046, -1.492491, 1, 0.03529412, 0, 1,
-2.483352, -0.6879857, -2.806636, 1, 0.04313726, 0, 1,
-2.431358, 1.702668, -0.4018524, 1, 0.04705882, 0, 1,
-2.418147, -0.280873, 0.1193972, 1, 0.05490196, 0, 1,
-2.389354, -0.5905434, -2.383735, 1, 0.05882353, 0, 1,
-2.351898, -1.158986, -1.883954, 1, 0.06666667, 0, 1,
-2.291698, 0.6745386, -1.293368, 1, 0.07058824, 0, 1,
-2.193917, 0.1195602, -1.191204, 1, 0.07843138, 0, 1,
-2.190526, 1.235624, -0.9434169, 1, 0.08235294, 0, 1,
-2.165021, -0.2503253, -1.825016, 1, 0.09019608, 0, 1,
-2.155946, -0.6222821, -3.549211, 1, 0.09411765, 0, 1,
-2.048511, -0.01754653, -2.444897, 1, 0.1019608, 0, 1,
-2.038275, 1.568187, -0.3626309, 1, 0.1098039, 0, 1,
-2.021338, -0.4196442, -0.8848255, 1, 0.1137255, 0, 1,
-2.0183, 1.23788, -2.97505, 1, 0.1215686, 0, 1,
-2.018148, 1.645768, -1.045675, 1, 0.1254902, 0, 1,
-1.997428, -0.2730265, -2.585046, 1, 0.1333333, 0, 1,
-1.976452, 0.03723698, -1.194681, 1, 0.1372549, 0, 1,
-1.966263, -0.7257028, -2.041744, 1, 0.145098, 0, 1,
-1.942858, 1.002599, 0.2604304, 1, 0.1490196, 0, 1,
-1.935033, -2.234105, -3.514899, 1, 0.1568628, 0, 1,
-1.922477, 2.13801, -1.468578, 1, 0.1607843, 0, 1,
-1.9114, -1.041923, -1.817118, 1, 0.1686275, 0, 1,
-1.889264, -0.338511, -2.300624, 1, 0.172549, 0, 1,
-1.867065, 0.9135148, -1.360147, 1, 0.1803922, 0, 1,
-1.82612, -1.264579, -2.946824, 1, 0.1843137, 0, 1,
-1.817458, -0.2253802, -2.049279, 1, 0.1921569, 0, 1,
-1.815558, -0.1010427, -1.860038, 1, 0.1960784, 0, 1,
-1.813494, -0.5312721, -0.4094014, 1, 0.2039216, 0, 1,
-1.805329, -2.029448, -0.9519688, 1, 0.2117647, 0, 1,
-1.781734, -0.1651118, -1.691804, 1, 0.2156863, 0, 1,
-1.771002, 1.317292, -0.9168581, 1, 0.2235294, 0, 1,
-1.765809, -1.959601, -2.726911, 1, 0.227451, 0, 1,
-1.762923, 0.5177782, -1.1299, 1, 0.2352941, 0, 1,
-1.756059, 0.4553778, -1.521707, 1, 0.2392157, 0, 1,
-1.752437, 0.3678226, -2.074533, 1, 0.2470588, 0, 1,
-1.750148, 0.1787897, -2.359139, 1, 0.2509804, 0, 1,
-1.74295, -0.257818, -1.312841, 1, 0.2588235, 0, 1,
-1.713699, 0.2949223, -1.561251, 1, 0.2627451, 0, 1,
-1.695239, -0.5996992, -2.748641, 1, 0.2705882, 0, 1,
-1.690128, -0.1559314, -1.587621, 1, 0.2745098, 0, 1,
-1.620898, -0.8094729, -1.992802, 1, 0.282353, 0, 1,
-1.603396, -0.2148214, -1.172595, 1, 0.2862745, 0, 1,
-1.585584, 0.4140447, -0.10835, 1, 0.2941177, 0, 1,
-1.58038, -0.3647752, -1.435865, 1, 0.3019608, 0, 1,
-1.577316, 1.43499, -2.26688, 1, 0.3058824, 0, 1,
-1.576651, -1.31223, -2.120106, 1, 0.3137255, 0, 1,
-1.56792, 0.3902618, -3.537653, 1, 0.3176471, 0, 1,
-1.566303, -0.2234005, -1.981729, 1, 0.3254902, 0, 1,
-1.563254, -0.114126, -2.363156, 1, 0.3294118, 0, 1,
-1.553977, -0.5229647, -1.748937, 1, 0.3372549, 0, 1,
-1.537224, 0.2205456, -0.2679475, 1, 0.3411765, 0, 1,
-1.536813, 0.3901663, -2.356481, 1, 0.3490196, 0, 1,
-1.535844, 0.487204, -1.862514, 1, 0.3529412, 0, 1,
-1.534889, -0.4857472, -1.147237, 1, 0.3607843, 0, 1,
-1.524517, 0.1757932, -1.301949, 1, 0.3647059, 0, 1,
-1.479555, 1.463634, 0.1047477, 1, 0.372549, 0, 1,
-1.465943, 0.7931902, -1.171315, 1, 0.3764706, 0, 1,
-1.464298, 0.03165456, -1.217081, 1, 0.3843137, 0, 1,
-1.460148, -0.6068218, -1.299379, 1, 0.3882353, 0, 1,
-1.446032, 0.5994005, -0.3497437, 1, 0.3960784, 0, 1,
-1.423736, 0.9197733, -0.4884741, 1, 0.4039216, 0, 1,
-1.419599, 0.2792531, 0.07966965, 1, 0.4078431, 0, 1,
-1.419224, 1.751621, -0.5320881, 1, 0.4156863, 0, 1,
-1.401727, -1.386863, -1.091671, 1, 0.4196078, 0, 1,
-1.390666, 0.2906378, 0.04900898, 1, 0.427451, 0, 1,
-1.377232, -0.9471972, -0.6640276, 1, 0.4313726, 0, 1,
-1.376015, 0.112893, -0.7463129, 1, 0.4392157, 0, 1,
-1.371941, -0.3336049, -1.806806, 1, 0.4431373, 0, 1,
-1.370386, 1.65311, -0.7960356, 1, 0.4509804, 0, 1,
-1.346507, -1.045231, -2.451646, 1, 0.454902, 0, 1,
-1.339436, 1.513893, -1.046567, 1, 0.4627451, 0, 1,
-1.335293, 1.24217, 0.2018973, 1, 0.4666667, 0, 1,
-1.331795, 1.022809, -1.051674, 1, 0.4745098, 0, 1,
-1.331576, 1.343662, -0.5832844, 1, 0.4784314, 0, 1,
-1.319208, 2.642254, -0.7006175, 1, 0.4862745, 0, 1,
-1.315568, -0.8439701, -3.465289, 1, 0.4901961, 0, 1,
-1.290093, 1.228545, -1.100327, 1, 0.4980392, 0, 1,
-1.281892, -1.640331, -1.877306, 1, 0.5058824, 0, 1,
-1.273512, -1.462751, -1.813998, 1, 0.509804, 0, 1,
-1.273195, 1.784546, 1.646716, 1, 0.5176471, 0, 1,
-1.265463, 1.021829, 0.6275726, 1, 0.5215687, 0, 1,
-1.259776, -0.9169543, -1.90041, 1, 0.5294118, 0, 1,
-1.256428, -1.070289, -1.674206, 1, 0.5333334, 0, 1,
-1.24654, 0.4306641, 1.198311, 1, 0.5411765, 0, 1,
-1.242704, -1.504978, -4.595966, 1, 0.5450981, 0, 1,
-1.23276, 0.8147799, -0.06614568, 1, 0.5529412, 0, 1,
-1.232648, 0.7482469, -1.444932, 1, 0.5568628, 0, 1,
-1.222769, 0.784974, -1.526843, 1, 0.5647059, 0, 1,
-1.21536, 0.09543138, -1.736078, 1, 0.5686275, 0, 1,
-1.207201, -0.182604, -3.759023, 1, 0.5764706, 0, 1,
-1.206583, -1.79545, -0.204285, 1, 0.5803922, 0, 1,
-1.20458, -0.7292408, -1.138455, 1, 0.5882353, 0, 1,
-1.20236, -1.251819, -2.16957, 1, 0.5921569, 0, 1,
-1.193177, 0.7497335, -1.508084, 1, 0.6, 0, 1,
-1.192687, -1.947973, -0.7728602, 1, 0.6078432, 0, 1,
-1.188326, 0.7401371, 0.2472128, 1, 0.6117647, 0, 1,
-1.184868, 0.4091607, 0.2026964, 1, 0.6196079, 0, 1,
-1.162363, 1.454086, 1.458657, 1, 0.6235294, 0, 1,
-1.159606, 0.4894125, -1.682483, 1, 0.6313726, 0, 1,
-1.159531, -0.4011676, -1.92909, 1, 0.6352941, 0, 1,
-1.158388, 0.7881034, 0.6883303, 1, 0.6431373, 0, 1,
-1.151521, -1.86104, -1.419262, 1, 0.6470588, 0, 1,
-1.142437, -0.01408298, -3.118873, 1, 0.654902, 0, 1,
-1.133767, -0.05015187, -1.427481, 1, 0.6588235, 0, 1,
-1.127572, -0.1351169, -1.625215, 1, 0.6666667, 0, 1,
-1.119539, -0.1071284, -2.648262, 1, 0.6705883, 0, 1,
-1.119026, 0.5392392, -2.285352, 1, 0.6784314, 0, 1,
-1.114839, -0.5396165, -2.812613, 1, 0.682353, 0, 1,
-1.099566, 0.736173, -0.6958358, 1, 0.6901961, 0, 1,
-1.095309, 1.729974, -1.013941, 1, 0.6941177, 0, 1,
-1.094972, -0.4478265, -1.270884, 1, 0.7019608, 0, 1,
-1.078165, -0.4481477, -3.43988, 1, 0.7098039, 0, 1,
-1.07085, -1.602351, -1.48298, 1, 0.7137255, 0, 1,
-1.070634, 0.3755772, -0.09821361, 1, 0.7215686, 0, 1,
-1.067643, 0.1454891, -1.330468, 1, 0.7254902, 0, 1,
-1.058321, -1.094255, -1.560144, 1, 0.7333333, 0, 1,
-1.056716, -0.1483857, -0.550137, 1, 0.7372549, 0, 1,
-1.05314, 0.5270724, -3.014137, 1, 0.7450981, 0, 1,
-1.050901, -0.782669, -3.422518, 1, 0.7490196, 0, 1,
-1.048273, 0.3855231, -1.927888, 1, 0.7568628, 0, 1,
-1.04776, 0.01569973, -2.642881, 1, 0.7607843, 0, 1,
-1.046191, 1.683188, -0.8990084, 1, 0.7686275, 0, 1,
-1.041091, -0.1054589, -4.063718, 1, 0.772549, 0, 1,
-1.024147, 0.09491691, -2.478322, 1, 0.7803922, 0, 1,
-1.012441, -0.1110153, -1.399587, 1, 0.7843137, 0, 1,
-1.00197, 0.04700798, -1.789598, 1, 0.7921569, 0, 1,
-0.999544, -0.4515782, -2.732859, 1, 0.7960784, 0, 1,
-0.9980034, 1.592656, -1.196095, 1, 0.8039216, 0, 1,
-0.996034, 0.3045813, -1.993054, 1, 0.8117647, 0, 1,
-0.9913965, -1.82244, -5.153469, 1, 0.8156863, 0, 1,
-0.9867857, 2.649107, -0.7779863, 1, 0.8235294, 0, 1,
-0.9860013, 1.404596, -2.030293, 1, 0.827451, 0, 1,
-0.9859147, -0.9162063, -2.812978, 1, 0.8352941, 0, 1,
-0.9744612, 1.281298, 0.6865101, 1, 0.8392157, 0, 1,
-0.9736987, -1.269102, -0.8895873, 1, 0.8470588, 0, 1,
-0.9707531, -0.4689462, -2.823533, 1, 0.8509804, 0, 1,
-0.9631003, 1.202256, -0.4111128, 1, 0.8588235, 0, 1,
-0.9607175, -0.09305271, -1.535688, 1, 0.8627451, 0, 1,
-0.9603075, -1.630435, -2.502302, 1, 0.8705882, 0, 1,
-0.9542123, 0.1675279, -2.438402, 1, 0.8745098, 0, 1,
-0.9534544, 1.511306, -1.267289, 1, 0.8823529, 0, 1,
-0.9506885, 0.3475518, -2.681359, 1, 0.8862745, 0, 1,
-0.9479108, -1.480834, -4.18719, 1, 0.8941177, 0, 1,
-0.945074, -1.111984, -2.260009, 1, 0.8980392, 0, 1,
-0.9439058, -0.1272589, 0.3276709, 1, 0.9058824, 0, 1,
-0.9375182, -1.371443, -3.7282, 1, 0.9137255, 0, 1,
-0.9294717, -1.103896, -2.125605, 1, 0.9176471, 0, 1,
-0.9294238, 0.6062725, -2.430142, 1, 0.9254902, 0, 1,
-0.9293898, -1.314287, -2.123563, 1, 0.9294118, 0, 1,
-0.9208247, -2.859867, -1.993478, 1, 0.9372549, 0, 1,
-0.9176999, -0.5150676, -2.561573, 1, 0.9411765, 0, 1,
-0.9175729, -0.4194616, 0.476115, 1, 0.9490196, 0, 1,
-0.9132286, 0.4914766, 0.2368461, 1, 0.9529412, 0, 1,
-0.9099649, 0.1926378, -0.8048567, 1, 0.9607843, 0, 1,
-0.909542, -0.7415729, 0.1551177, 1, 0.9647059, 0, 1,
-0.9089357, 1.59141, -0.3679426, 1, 0.972549, 0, 1,
-0.9083194, 0.343018, -1.989343, 1, 0.9764706, 0, 1,
-0.9070699, -0.6084448, -2.999392, 1, 0.9843137, 0, 1,
-0.9013042, 0.07524332, -0.4676455, 1, 0.9882353, 0, 1,
-0.898312, 0.3781884, -1.531289, 1, 0.9960784, 0, 1,
-0.8962233, -0.9811879, -2.993336, 0.9960784, 1, 0, 1,
-0.8960792, -1.999369, -2.411623, 0.9921569, 1, 0, 1,
-0.8951946, -1.363316, -2.227149, 0.9843137, 1, 0, 1,
-0.89386, 0.7707989, 0.1318223, 0.9803922, 1, 0, 1,
-0.8851173, 0.5915871, -2.175448, 0.972549, 1, 0, 1,
-0.8850524, 0.5961151, -1.027951, 0.9686275, 1, 0, 1,
-0.8839524, -1.375296, -2.178885, 0.9607843, 1, 0, 1,
-0.8835874, 0.6573924, -1.50487, 0.9568627, 1, 0, 1,
-0.8825246, -0.1763471, -1.238064, 0.9490196, 1, 0, 1,
-0.8792592, 1.391186, 1.315799, 0.945098, 1, 0, 1,
-0.8769194, 1.764823, 0.002837559, 0.9372549, 1, 0, 1,
-0.8764579, -0.9020755, -1.366046, 0.9333333, 1, 0, 1,
-0.8719647, 1.411801, 0.04440467, 0.9254902, 1, 0, 1,
-0.8703427, 0.6227353, 0.681764, 0.9215686, 1, 0, 1,
-0.8696817, -0.0323573, -2.733601, 0.9137255, 1, 0, 1,
-0.8666349, -0.4634679, -3.222953, 0.9098039, 1, 0, 1,
-0.856129, -0.4559559, -2.363979, 0.9019608, 1, 0, 1,
-0.8560325, 1.587618, -0.263956, 0.8941177, 1, 0, 1,
-0.8516331, -1.227304, -2.558085, 0.8901961, 1, 0, 1,
-0.850934, 0.2646576, -1.698122, 0.8823529, 1, 0, 1,
-0.8486979, -0.3215905, -0.9586319, 0.8784314, 1, 0, 1,
-0.8474493, 0.6812606, -1.046062, 0.8705882, 1, 0, 1,
-0.8452657, 2.105983, 0.7124467, 0.8666667, 1, 0, 1,
-0.842408, -0.2584544, -0.5724608, 0.8588235, 1, 0, 1,
-0.8395864, 1.370507, 0.5965537, 0.854902, 1, 0, 1,
-0.839366, 1.15298, 1.137721, 0.8470588, 1, 0, 1,
-0.8317806, -1.381428, -3.865462, 0.8431373, 1, 0, 1,
-0.8292109, 0.9922006, -0.9748857, 0.8352941, 1, 0, 1,
-0.829121, 0.4427249, -1.462373, 0.8313726, 1, 0, 1,
-0.8230213, 1.703357, 1.686688, 0.8235294, 1, 0, 1,
-0.8225958, 0.3103018, -0.8919921, 0.8196079, 1, 0, 1,
-0.8154386, -1.475156, -4.853189, 0.8117647, 1, 0, 1,
-0.8123994, -0.2943104, -2.51777, 0.8078431, 1, 0, 1,
-0.8118261, -0.5217068, -2.523857, 0.8, 1, 0, 1,
-0.8113878, -0.08504837, -2.576428, 0.7921569, 1, 0, 1,
-0.8075056, -1.511406, -4.413306, 0.7882353, 1, 0, 1,
-0.806242, -1.959756, -2.824871, 0.7803922, 1, 0, 1,
-0.8019109, -0.07437937, -1.033473, 0.7764706, 1, 0, 1,
-0.7994341, 0.03809447, -1.511163, 0.7686275, 1, 0, 1,
-0.797581, -1.064142, -3.301003, 0.7647059, 1, 0, 1,
-0.7975123, 0.5854505, -0.5413902, 0.7568628, 1, 0, 1,
-0.7953606, 0.6161192, -2.535141, 0.7529412, 1, 0, 1,
-0.784297, 1.481556, -1.339933, 0.7450981, 1, 0, 1,
-0.7838601, 0.8100188, -1.100547, 0.7411765, 1, 0, 1,
-0.7817409, 0.5123598, -0.6902388, 0.7333333, 1, 0, 1,
-0.7745144, 0.5740763, -2.663946, 0.7294118, 1, 0, 1,
-0.7722964, 0.9539419, -0.5079853, 0.7215686, 1, 0, 1,
-0.7720843, -1.081526, -2.955574, 0.7176471, 1, 0, 1,
-0.7681053, -0.01977954, -1.490589, 0.7098039, 1, 0, 1,
-0.7643024, 0.6194361, -0.5226292, 0.7058824, 1, 0, 1,
-0.7567868, -1.947561, -2.40842, 0.6980392, 1, 0, 1,
-0.7461172, 1.267295, -0.08996394, 0.6901961, 1, 0, 1,
-0.7437627, 0.5104024, -0.5180603, 0.6862745, 1, 0, 1,
-0.7385585, -0.8625184, -3.611509, 0.6784314, 1, 0, 1,
-0.7361508, 0.6590063, -1.316761, 0.6745098, 1, 0, 1,
-0.7351817, -1.195969, -2.613111, 0.6666667, 1, 0, 1,
-0.7349599, -0.529904, -3.501536, 0.6627451, 1, 0, 1,
-0.7311115, -1.888719, -2.421858, 0.654902, 1, 0, 1,
-0.7287797, -0.455191, -2.116531, 0.6509804, 1, 0, 1,
-0.7286144, -0.6998049, -1.570105, 0.6431373, 1, 0, 1,
-0.7275351, -2.203768, -3.755294, 0.6392157, 1, 0, 1,
-0.7263017, 0.8984896, -2.35112, 0.6313726, 1, 0, 1,
-0.7260486, -1.30405, -3.437758, 0.627451, 1, 0, 1,
-0.7231624, 0.03891212, -1.521659, 0.6196079, 1, 0, 1,
-0.7142026, -1.747985, -1.038278, 0.6156863, 1, 0, 1,
-0.7054421, 0.9057832, -0.08955053, 0.6078432, 1, 0, 1,
-0.699187, -0.2115662, -1.182534, 0.6039216, 1, 0, 1,
-0.6938279, -0.37841, -3.11078, 0.5960785, 1, 0, 1,
-0.6934088, -1.794949, -3.250513, 0.5882353, 1, 0, 1,
-0.6827201, 1.141709, -2.063025, 0.5843138, 1, 0, 1,
-0.6799801, -0.7360078, -2.414367, 0.5764706, 1, 0, 1,
-0.679841, 0.9996634, -0.6985561, 0.572549, 1, 0, 1,
-0.6788948, 1.018599, -0.6653193, 0.5647059, 1, 0, 1,
-0.6786421, -1.307393, -1.470829, 0.5607843, 1, 0, 1,
-0.6695302, 0.3707862, -0.2735045, 0.5529412, 1, 0, 1,
-0.6694162, -1.049325, -2.439114, 0.5490196, 1, 0, 1,
-0.6621673, 0.1204516, -0.9046668, 0.5411765, 1, 0, 1,
-0.6601231, 0.3453836, -1.082812, 0.5372549, 1, 0, 1,
-0.6581516, -0.8609619, -2.641473, 0.5294118, 1, 0, 1,
-0.6540043, -0.1167316, -1.324722, 0.5254902, 1, 0, 1,
-0.6524398, -1.506596, -2.610163, 0.5176471, 1, 0, 1,
-0.6435357, -0.6972104, -2.505161, 0.5137255, 1, 0, 1,
-0.6412831, 0.4177916, 0.502063, 0.5058824, 1, 0, 1,
-0.6379672, 0.9902514, -0.2242935, 0.5019608, 1, 0, 1,
-0.6379608, 0.09828271, 0.1962159, 0.4941176, 1, 0, 1,
-0.6375841, -1.269894, -2.83642, 0.4862745, 1, 0, 1,
-0.6358591, 2.033334, 2.422176, 0.4823529, 1, 0, 1,
-0.6354808, -0.7880158, -2.450624, 0.4745098, 1, 0, 1,
-0.6334144, 0.4710166, 0.6521419, 0.4705882, 1, 0, 1,
-0.6324664, -0.02828617, -2.242796, 0.4627451, 1, 0, 1,
-0.6303169, 0.7403316, 0.1931064, 0.4588235, 1, 0, 1,
-0.627401, -0.2373566, -2.198338, 0.4509804, 1, 0, 1,
-0.6241506, -0.3443009, 0.3847269, 0.4470588, 1, 0, 1,
-0.6234636, 0.005325015, -1.465321, 0.4392157, 1, 0, 1,
-0.6189286, -1.545768, -0.6037301, 0.4352941, 1, 0, 1,
-0.6186458, -0.2546195, -2.966648, 0.427451, 1, 0, 1,
-0.6181756, 0.4068437, 0.4499977, 0.4235294, 1, 0, 1,
-0.6111796, -0.4201195, -2.150727, 0.4156863, 1, 0, 1,
-0.6068208, 0.6964588, -1.917308, 0.4117647, 1, 0, 1,
-0.604435, 0.859175, -2.136159, 0.4039216, 1, 0, 1,
-0.6030998, -0.3964816, -1.099993, 0.3960784, 1, 0, 1,
-0.5978363, 0.3221444, -0.1082554, 0.3921569, 1, 0, 1,
-0.5962708, 0.199032, -0.7265769, 0.3843137, 1, 0, 1,
-0.5951006, -0.5827891, -0.9108009, 0.3803922, 1, 0, 1,
-0.5904714, 1.359858, 1.742827, 0.372549, 1, 0, 1,
-0.5861507, 0.3781281, -1.119764, 0.3686275, 1, 0, 1,
-0.5856958, -0.6259225, -0.5333406, 0.3607843, 1, 0, 1,
-0.5853893, 0.8599516, -0.9164788, 0.3568628, 1, 0, 1,
-0.5835882, -0.3451639, -1.855093, 0.3490196, 1, 0, 1,
-0.5821933, 0.7758621, 0.08133145, 0.345098, 1, 0, 1,
-0.5795655, 1.04332, -2.049583, 0.3372549, 1, 0, 1,
-0.5764923, -0.1779183, -2.55305, 0.3333333, 1, 0, 1,
-0.572271, -0.3425794, -1.110597, 0.3254902, 1, 0, 1,
-0.5698375, -0.8890839, -2.356852, 0.3215686, 1, 0, 1,
-0.5691244, -0.7807122, -2.227897, 0.3137255, 1, 0, 1,
-0.5682232, -0.7886966, -1.278516, 0.3098039, 1, 0, 1,
-0.5680337, 1.228584, -0.591774, 0.3019608, 1, 0, 1,
-0.5665945, -0.7669004, -2.519878, 0.2941177, 1, 0, 1,
-0.5633379, 2.467223, 1.33231, 0.2901961, 1, 0, 1,
-0.5596749, -0.2501494, -2.034782, 0.282353, 1, 0, 1,
-0.5596501, -0.8993864, -2.850719, 0.2784314, 1, 0, 1,
-0.5581678, 0.4697607, -0.3709727, 0.2705882, 1, 0, 1,
-0.5566307, 1.87596, -0.3973785, 0.2666667, 1, 0, 1,
-0.5556694, -1.105831, -2.923755, 0.2588235, 1, 0, 1,
-0.5555606, 0.03050133, -3.199212, 0.254902, 1, 0, 1,
-0.5553845, -0.2321658, -1.524746, 0.2470588, 1, 0, 1,
-0.5533701, -0.4243805, -1.993141, 0.2431373, 1, 0, 1,
-0.5528744, -1.772771, -1.617894, 0.2352941, 1, 0, 1,
-0.5486112, -0.6874335, -0.7518799, 0.2313726, 1, 0, 1,
-0.5480403, 0.4696338, -0.3662904, 0.2235294, 1, 0, 1,
-0.5451611, 1.896489, 0.802399, 0.2196078, 1, 0, 1,
-0.5427178, -0.2223512, -0.3778212, 0.2117647, 1, 0, 1,
-0.5387061, -7.584933e-05, -0.9146868, 0.2078431, 1, 0, 1,
-0.5350224, -0.2487534, -1.633084, 0.2, 1, 0, 1,
-0.5251224, -0.2546676, -1.773662, 0.1921569, 1, 0, 1,
-0.5240905, 0.05527472, -1.383941, 0.1882353, 1, 0, 1,
-0.5238768, -0.4284138, -0.5955249, 0.1803922, 1, 0, 1,
-0.5189304, 0.07243749, -1.831044, 0.1764706, 1, 0, 1,
-0.5161095, -0.03545234, 0.0235412, 0.1686275, 1, 0, 1,
-0.5157906, 0.8147165, 0.610019, 0.1647059, 1, 0, 1,
-0.5022752, 1.761561, -0.701492, 0.1568628, 1, 0, 1,
-0.5017177, -0.5318395, -2.709401, 0.1529412, 1, 0, 1,
-0.4963684, 0.2853784, 0.9921615, 0.145098, 1, 0, 1,
-0.4956382, -1.972012, -2.266634, 0.1411765, 1, 0, 1,
-0.4950382, 1.070511, 0.1188441, 0.1333333, 1, 0, 1,
-0.4901294, -1.610613, -2.765973, 0.1294118, 1, 0, 1,
-0.4886723, -0.9418864, -3.033474, 0.1215686, 1, 0, 1,
-0.4616367, -0.064688, -2.712858, 0.1176471, 1, 0, 1,
-0.4600693, -1.462046, -1.442038, 0.1098039, 1, 0, 1,
-0.4585224, -0.5388265, -1.698823, 0.1058824, 1, 0, 1,
-0.4574125, 1.493735, 0.1985617, 0.09803922, 1, 0, 1,
-0.455646, -0.9399358, -3.087781, 0.09019608, 1, 0, 1,
-0.4551224, -0.3829026, -1.691033, 0.08627451, 1, 0, 1,
-0.4530489, 1.392416, -2.502668, 0.07843138, 1, 0, 1,
-0.451673, -0.6508872, -3.443114, 0.07450981, 1, 0, 1,
-0.4476208, -0.08829638, -0.1618018, 0.06666667, 1, 0, 1,
-0.441743, -0.6005512, -2.0674, 0.0627451, 1, 0, 1,
-0.4360504, -1.86058, -4.944989, 0.05490196, 1, 0, 1,
-0.4339673, 0.7833779, -1.461122, 0.05098039, 1, 0, 1,
-0.4315135, -0.4650904, -1.817722, 0.04313726, 1, 0, 1,
-0.427251, 0.2876338, 0.2680703, 0.03921569, 1, 0, 1,
-0.4252639, 1.360378, 0.314373, 0.03137255, 1, 0, 1,
-0.424219, 1.347293, -0.7444035, 0.02745098, 1, 0, 1,
-0.4228331, -0.1724745, -0.7789094, 0.01960784, 1, 0, 1,
-0.4223877, 0.6357983, 0.06493326, 0.01568628, 1, 0, 1,
-0.4216175, -0.3274354, -3.583038, 0.007843138, 1, 0, 1,
-0.4167349, -0.6417152, -1.571361, 0.003921569, 1, 0, 1,
-0.411079, -1.512249, -3.483517, 0, 1, 0.003921569, 1,
-0.4099421, 0.3393541, -2.25442, 0, 1, 0.01176471, 1,
-0.4097548, -0.2809948, -0.8592284, 0, 1, 0.01568628, 1,
-0.40137, -0.778254, -3.481778, 0, 1, 0.02352941, 1,
-0.39855, -0.6435985, -2.505242, 0, 1, 0.02745098, 1,
-0.3949259, -0.1933264, -1.502577, 0, 1, 0.03529412, 1,
-0.3887371, 0.4564234, -0.02153931, 0, 1, 0.03921569, 1,
-0.3787206, -1.338303, -2.874789, 0, 1, 0.04705882, 1,
-0.3767241, -0.9739794, -1.499765, 0, 1, 0.05098039, 1,
-0.3753028, -0.5326733, -2.624895, 0, 1, 0.05882353, 1,
-0.3750191, 1.644724, -0.1139807, 0, 1, 0.0627451, 1,
-0.374292, -1.453714, -4.119322, 0, 1, 0.07058824, 1,
-0.3672037, -0.2748145, -1.298905, 0, 1, 0.07450981, 1,
-0.3662099, -1.995915, -2.939904, 0, 1, 0.08235294, 1,
-0.3658645, -0.5629541, -1.786013, 0, 1, 0.08627451, 1,
-0.3648382, 1.116561, 0.689435, 0, 1, 0.09411765, 1,
-0.3614601, 0.1643389, 0.4899977, 0, 1, 0.1019608, 1,
-0.3506808, -0.034337, -1.793391, 0, 1, 0.1058824, 1,
-0.3490706, -1.571368, -4.075335, 0, 1, 0.1137255, 1,
-0.3408483, 0.6676238, -1.719996, 0, 1, 0.1176471, 1,
-0.3375446, 1.404337, -1.279516, 0, 1, 0.1254902, 1,
-0.3331019, -0.3352476, -1.300138, 0, 1, 0.1294118, 1,
-0.3293907, 0.9697732, -0.3967443, 0, 1, 0.1372549, 1,
-0.3274282, 0.5407243, -0.8616614, 0, 1, 0.1411765, 1,
-0.323143, 0.915407, 1.50458, 0, 1, 0.1490196, 1,
-0.3221666, 1.99568, -2.006848, 0, 1, 0.1529412, 1,
-0.3220113, 0.6194304, 0.8258097, 0, 1, 0.1607843, 1,
-0.31691, 0.1972236, -0.7952163, 0, 1, 0.1647059, 1,
-0.3140895, 0.1931856, -1.909117, 0, 1, 0.172549, 1,
-0.313732, 0.2867249, -1.673835, 0, 1, 0.1764706, 1,
-0.3108644, 0.941732, -0.4512684, 0, 1, 0.1843137, 1,
-0.3100255, -1.292917, -1.174992, 0, 1, 0.1882353, 1,
-0.3057869, 1.30038, -1.513072, 0, 1, 0.1960784, 1,
-0.3044342, 3.021806, 0.4064607, 0, 1, 0.2039216, 1,
-0.3028072, 0.6170782, -0.8799886, 0, 1, 0.2078431, 1,
-0.300786, 0.7309679, -0.09052587, 0, 1, 0.2156863, 1,
-0.3004452, 0.4737034, 0.5277659, 0, 1, 0.2196078, 1,
-0.2965893, -1.094222, -2.049151, 0, 1, 0.227451, 1,
-0.2887651, 0.5469431, -0.2104622, 0, 1, 0.2313726, 1,
-0.2887593, 0.3379249, -1.510283, 0, 1, 0.2392157, 1,
-0.2881373, 1.883596, 0.4769183, 0, 1, 0.2431373, 1,
-0.2881133, -0.09578096, -2.471759, 0, 1, 0.2509804, 1,
-0.280419, -0.4553809, -3.56761, 0, 1, 0.254902, 1,
-0.2802016, -0.006408136, -3.427465, 0, 1, 0.2627451, 1,
-0.2769868, -1.265236, -2.611283, 0, 1, 0.2666667, 1,
-0.2763148, 0.8889102, -1.731899, 0, 1, 0.2745098, 1,
-0.2727326, -1.170547, -4.619772, 0, 1, 0.2784314, 1,
-0.2712695, 1.7453, 2.313675, 0, 1, 0.2862745, 1,
-0.2711599, 1.661351, -0.3826092, 0, 1, 0.2901961, 1,
-0.2687547, 1.749971, -0.8084245, 0, 1, 0.2980392, 1,
-0.2660438, 0.8000365, -1.116726, 0, 1, 0.3058824, 1,
-0.2611477, 0.4668425, -1.936417, 0, 1, 0.3098039, 1,
-0.2548494, -0.1527387, -2.245369, 0, 1, 0.3176471, 1,
-0.2541912, -0.5013199, -2.408732, 0, 1, 0.3215686, 1,
-0.2529276, -1.550132, -4.43238, 0, 1, 0.3294118, 1,
-0.2520353, 0.2084851, -0.4804228, 0, 1, 0.3333333, 1,
-0.251218, -0.02536092, -2.478277, 0, 1, 0.3411765, 1,
-0.2504951, 1.277849, -0.6417452, 0, 1, 0.345098, 1,
-0.2478765, 0.9636882, 1.308154, 0, 1, 0.3529412, 1,
-0.2465918, 1.174024, 0.03878983, 0, 1, 0.3568628, 1,
-0.242757, -0.4293577, -0.575063, 0, 1, 0.3647059, 1,
-0.2416454, -0.6563541, -4.265346, 0, 1, 0.3686275, 1,
-0.2386107, 0.5926653, -0.9771674, 0, 1, 0.3764706, 1,
-0.2363777, -0.8280685, -1.485656, 0, 1, 0.3803922, 1,
-0.2360971, 0.2374651, -0.4169273, 0, 1, 0.3882353, 1,
-0.2346314, 0.5999213, -0.8457188, 0, 1, 0.3921569, 1,
-0.2302785, -0.454457, -2.719042, 0, 1, 0.4, 1,
-0.2275668, -0.2827364, -3.842134, 0, 1, 0.4078431, 1,
-0.226949, -0.09917308, -1.274611, 0, 1, 0.4117647, 1,
-0.2264442, -1.020079, -2.133384, 0, 1, 0.4196078, 1,
-0.2195627, -0.1127976, -2.761808, 0, 1, 0.4235294, 1,
-0.2175769, 0.1471047, -2.037168, 0, 1, 0.4313726, 1,
-0.2168421, -0.8514456, -1.767182, 0, 1, 0.4352941, 1,
-0.211134, -1.73561, -3.320518, 0, 1, 0.4431373, 1,
-0.2096345, 0.3623864, -0.9013949, 0, 1, 0.4470588, 1,
-0.2086065, -0.1823039, -0.4931147, 0, 1, 0.454902, 1,
-0.2053806, -0.02057943, -0.2963302, 0, 1, 0.4588235, 1,
-0.2021179, 1.357502, 1.439152, 0, 1, 0.4666667, 1,
-0.2016008, -1.248447, -2.422068, 0, 1, 0.4705882, 1,
-0.2013376, 0.9092898, -1.266947, 0, 1, 0.4784314, 1,
-0.1998341, 1.081156, -0.7187242, 0, 1, 0.4823529, 1,
-0.199482, -0.3670656, -2.581002, 0, 1, 0.4901961, 1,
-0.1991888, 0.7127122, 0.6761875, 0, 1, 0.4941176, 1,
-0.1940585, 0.8908913, -0.6612378, 0, 1, 0.5019608, 1,
-0.1916179, -2.246877, -3.720088, 0, 1, 0.509804, 1,
-0.1913981, -0.4198522, -0.66354, 0, 1, 0.5137255, 1,
-0.1878289, 0.3806563, -0.1426249, 0, 1, 0.5215687, 1,
-0.1856895, 1.032046, -1.484561, 0, 1, 0.5254902, 1,
-0.1830852, -0.5050935, -3.699593, 0, 1, 0.5333334, 1,
-0.1827407, -2.145369, -2.362201, 0, 1, 0.5372549, 1,
-0.1796961, -1.416005, -1.622299, 0, 1, 0.5450981, 1,
-0.178196, -0.5867274, -3.380548, 0, 1, 0.5490196, 1,
-0.1705893, 1.405873, -0.9242561, 0, 1, 0.5568628, 1,
-0.1681269, -0.3897939, -2.805096, 0, 1, 0.5607843, 1,
-0.1608675, 0.326648, 0.1407932, 0, 1, 0.5686275, 1,
-0.1586423, -0.5630227, -3.098029, 0, 1, 0.572549, 1,
-0.1546546, 0.2853763, 0.9086096, 0, 1, 0.5803922, 1,
-0.153317, -1.006172, -2.260971, 0, 1, 0.5843138, 1,
-0.150197, 0.8506592, -0.3881664, 0, 1, 0.5921569, 1,
-0.1501249, -0.7732558, -3.339053, 0, 1, 0.5960785, 1,
-0.1497618, 0.8393239, 1.431858, 0, 1, 0.6039216, 1,
-0.1483719, -0.8968557, -0.7785147, 0, 1, 0.6117647, 1,
-0.1472998, 0.7886214, -1.216968, 0, 1, 0.6156863, 1,
-0.1463861, 0.1485168, -0.2936352, 0, 1, 0.6235294, 1,
-0.1462779, 1.544022, 0.7099542, 0, 1, 0.627451, 1,
-0.1432152, -0.5195361, -1.026488, 0, 1, 0.6352941, 1,
-0.1371911, -0.400267, -1.606721, 0, 1, 0.6392157, 1,
-0.1369839, 0.5972818, -1.677626, 0, 1, 0.6470588, 1,
-0.1356917, -1.940473, -3.313561, 0, 1, 0.6509804, 1,
-0.13499, 0.4905304, 1.139672, 0, 1, 0.6588235, 1,
-0.1318905, 0.9700993, -2.354655, 0, 1, 0.6627451, 1,
-0.1285466, -1.595024, -2.824693, 0, 1, 0.6705883, 1,
-0.123277, -0.00853482, -0.3888677, 0, 1, 0.6745098, 1,
-0.1221718, -0.5456336, -4.257132, 0, 1, 0.682353, 1,
-0.1195681, 0.2508915, -0.09927585, 0, 1, 0.6862745, 1,
-0.1187909, -0.7278001, -1.253122, 0, 1, 0.6941177, 1,
-0.1184141, 0.1309387, -0.2772979, 0, 1, 0.7019608, 1,
-0.1179243, 0.833326, 2.010744, 0, 1, 0.7058824, 1,
-0.1156987, 2.094155, -0.1230619, 0, 1, 0.7137255, 1,
-0.1133437, 1.267769, -1.24328, 0, 1, 0.7176471, 1,
-0.1129112, 0.2534117, -0.9862843, 0, 1, 0.7254902, 1,
-0.1095582, -0.1591849, -3.468483, 0, 1, 0.7294118, 1,
-0.1069557, 0.4650601, -1.823296, 0, 1, 0.7372549, 1,
-0.1054493, 0.03407421, 0.2359555, 0, 1, 0.7411765, 1,
-0.09803341, -0.6340532, -1.865253, 0, 1, 0.7490196, 1,
-0.08337097, -1.031734, -2.348286, 0, 1, 0.7529412, 1,
-0.0775523, -0.6690214, -2.455389, 0, 1, 0.7607843, 1,
-0.07355231, 0.5306185, -1.209319, 0, 1, 0.7647059, 1,
-0.07344184, 1.16405, 0.4675124, 0, 1, 0.772549, 1,
-0.06840961, 0.8759891, -0.1014181, 0, 1, 0.7764706, 1,
-0.06720761, -0.1060387, -2.403498, 0, 1, 0.7843137, 1,
-0.06347314, -1.072861, -1.262259, 0, 1, 0.7882353, 1,
-0.06322975, -0.1143768, -2.496041, 0, 1, 0.7960784, 1,
-0.06270026, 1.123476, 0.005642547, 0, 1, 0.8039216, 1,
-0.0581684, 0.8756927, 0.3409165, 0, 1, 0.8078431, 1,
-0.05428749, 2.131263, -0.4238504, 0, 1, 0.8156863, 1,
-0.05224837, -0.9723979, -3.956141, 0, 1, 0.8196079, 1,
-0.05201109, -0.4364794, -2.099281, 0, 1, 0.827451, 1,
-0.04506121, 1.662062, -0.01245413, 0, 1, 0.8313726, 1,
-0.0411086, 0.8542069, 0.5984066, 0, 1, 0.8392157, 1,
-0.0396005, -0.3341026, -3.721283, 0, 1, 0.8431373, 1,
-0.03922012, -0.6038789, -3.282858, 0, 1, 0.8509804, 1,
-0.03650465, -0.8759421, -3.537975, 0, 1, 0.854902, 1,
-0.03378085, -1.979858, -4.171447, 0, 1, 0.8627451, 1,
-0.03217982, -1.322277, -1.33578, 0, 1, 0.8666667, 1,
-0.03143767, -0.6872009, -1.526595, 0, 1, 0.8745098, 1,
-0.02116297, 0.6750908, 0.6511188, 0, 1, 0.8784314, 1,
-0.01258188, 0.6899039, 2.198585, 0, 1, 0.8862745, 1,
-0.00979265, 0.6603377, 0.3475561, 0, 1, 0.8901961, 1,
-0.001345855, 1.177184, 1.412907, 0, 1, 0.8980392, 1,
-0.001241245, 0.4193984, 0.1706557, 0, 1, 0.9058824, 1,
-0.0006370794, 0.1880378, 0.6701134, 0, 1, 0.9098039, 1,
0.004666172, -0.8040668, 5.438954, 0, 1, 0.9176471, 1,
0.005996599, 0.8558685, 0.1333824, 0, 1, 0.9215686, 1,
0.008045573, -1.717822, 3.198234, 0, 1, 0.9294118, 1,
0.0114643, -0.8085831, 1.030623, 0, 1, 0.9333333, 1,
0.01227886, 0.5705175, -0.8841804, 0, 1, 0.9411765, 1,
0.01363035, 0.5203612, -0.08458072, 0, 1, 0.945098, 1,
0.0230502, -0.7864833, 5.276891, 0, 1, 0.9529412, 1,
0.03639065, -0.4068588, 3.740362, 0, 1, 0.9568627, 1,
0.03641472, 0.6251791, -0.6000949, 0, 1, 0.9647059, 1,
0.0370151, 0.4667031, 0.1462885, 0, 1, 0.9686275, 1,
0.03753311, -0.1452663, 4.520052, 0, 1, 0.9764706, 1,
0.04347248, -0.1980448, 3.166866, 0, 1, 0.9803922, 1,
0.04452277, 0.1096787, -0.1659323, 0, 1, 0.9882353, 1,
0.04743516, 0.05296945, -1.162672, 0, 1, 0.9921569, 1,
0.05247975, 0.7591017, -0.130705, 0, 1, 1, 1,
0.05275963, -0.3299353, 2.771879, 0, 0.9921569, 1, 1,
0.05393047, -0.3749683, 1.01036, 0, 0.9882353, 1, 1,
0.06064535, 2.00962, -1.005995, 0, 0.9803922, 1, 1,
0.06246629, 0.2740721, 2.342453, 0, 0.9764706, 1, 1,
0.06373827, -0.3189543, 3.254553, 0, 0.9686275, 1, 1,
0.06406895, -0.592205, 3.229722, 0, 0.9647059, 1, 1,
0.06935684, 0.7332836, 1.365744, 0, 0.9568627, 1, 1,
0.06950084, -0.1901168, 3.261061, 0, 0.9529412, 1, 1,
0.07165689, 1.052755, 1.349176, 0, 0.945098, 1, 1,
0.07581851, 1.681331, 0.7551941, 0, 0.9411765, 1, 1,
0.07688259, -0.04357881, 1.541532, 0, 0.9333333, 1, 1,
0.07781362, -0.9915664, 1.709994, 0, 0.9294118, 1, 1,
0.08094431, 0.5717587, -0.9503822, 0, 0.9215686, 1, 1,
0.08138497, 1.034888, -1.128941, 0, 0.9176471, 1, 1,
0.08247617, -0.9495913, 2.421655, 0, 0.9098039, 1, 1,
0.08563531, 1.30626, 1.457138, 0, 0.9058824, 1, 1,
0.08658896, -1.813723, 4.132264, 0, 0.8980392, 1, 1,
0.08820412, -0.1273481, 2.832335, 0, 0.8901961, 1, 1,
0.0883002, 1.27501, -0.1488686, 0, 0.8862745, 1, 1,
0.09537499, 0.4894952, -0.8827145, 0, 0.8784314, 1, 1,
0.09992492, 1.657415, 0.3077805, 0, 0.8745098, 1, 1,
0.1040548, -0.9748888, 3.561403, 0, 0.8666667, 1, 1,
0.1040574, 0.4292209, 0.4710238, 0, 0.8627451, 1, 1,
0.1062571, 0.07858612, 2.520019, 0, 0.854902, 1, 1,
0.1096192, 1.088194, -0.04078096, 0, 0.8509804, 1, 1,
0.1111777, 0.6752701, 1.066718, 0, 0.8431373, 1, 1,
0.1119355, 1.559895, -0.2182738, 0, 0.8392157, 1, 1,
0.1122198, 0.3361587, 3.23578, 0, 0.8313726, 1, 1,
0.1130174, 0.07007807, -0.3404729, 0, 0.827451, 1, 1,
0.116217, -3.224263, 3.101698, 0, 0.8196079, 1, 1,
0.1167679, 1.218142, -1.30435, 0, 0.8156863, 1, 1,
0.1209175, -1.682989, 2.574179, 0, 0.8078431, 1, 1,
0.122053, -0.5611026, 2.766833, 0, 0.8039216, 1, 1,
0.1225626, 0.3492627, -1.482145, 0, 0.7960784, 1, 1,
0.1312186, 1.256426, 0.209992, 0, 0.7882353, 1, 1,
0.1347014, -1.002318, 1.457563, 0, 0.7843137, 1, 1,
0.1385836, 0.919012, 1.200154, 0, 0.7764706, 1, 1,
0.1414223, -1.454175, 3.937799, 0, 0.772549, 1, 1,
0.142661, -0.975557, 2.922212, 0, 0.7647059, 1, 1,
0.1439285, 0.7876095, 3.134045, 0, 0.7607843, 1, 1,
0.1455873, -1.197403, 2.14765, 0, 0.7529412, 1, 1,
0.1462436, -0.9103958, 2.370296, 0, 0.7490196, 1, 1,
0.1487862, -0.6513485, 1.63023, 0, 0.7411765, 1, 1,
0.1496629, 0.770878, 0.4145054, 0, 0.7372549, 1, 1,
0.1525575, 0.2111603, 0.5242738, 0, 0.7294118, 1, 1,
0.152832, 1.083426, 0.8342937, 0, 0.7254902, 1, 1,
0.1706686, -0.8356221, 3.574128, 0, 0.7176471, 1, 1,
0.1717241, 2.022434, -0.8341792, 0, 0.7137255, 1, 1,
0.1719512, -0.9422332, 4.059089, 0, 0.7058824, 1, 1,
0.1758644, 2.065775, -0.9464285, 0, 0.6980392, 1, 1,
0.175953, 1.575345, 0.5255936, 0, 0.6941177, 1, 1,
0.1764438, 0.5518804, -1.93871, 0, 0.6862745, 1, 1,
0.1777333, -0.05376019, 2.046851, 0, 0.682353, 1, 1,
0.1791747, 1.541505, -0.8645893, 0, 0.6745098, 1, 1,
0.1791995, 1.066255, -0.3838059, 0, 0.6705883, 1, 1,
0.1822897, -1.824106, 3.756564, 0, 0.6627451, 1, 1,
0.1823283, 0.5588365, -1.139925, 0, 0.6588235, 1, 1,
0.1831408, -0.1083513, 2.026109, 0, 0.6509804, 1, 1,
0.1835347, 0.2494341, 2.935467, 0, 0.6470588, 1, 1,
0.1841024, -0.9710839, 1.975575, 0, 0.6392157, 1, 1,
0.1842212, 0.9446803, -0.07424441, 0, 0.6352941, 1, 1,
0.1859145, -0.6904663, 2.887976, 0, 0.627451, 1, 1,
0.1896671, 0.06835315, 0.9791405, 0, 0.6235294, 1, 1,
0.1901584, -0.6380288, 2.280697, 0, 0.6156863, 1, 1,
0.1992296, -1.293387, 2.664671, 0, 0.6117647, 1, 1,
0.1992533, 0.9315907, 1.908098, 0, 0.6039216, 1, 1,
0.199904, -0.5731466, 2.569296, 0, 0.5960785, 1, 1,
0.2004892, 0.3465714, 0.7932693, 0, 0.5921569, 1, 1,
0.2021026, 1.422371, 0.8667806, 0, 0.5843138, 1, 1,
0.202788, -1.594425, 1.536646, 0, 0.5803922, 1, 1,
0.2032737, -0.6276399, 2.271131, 0, 0.572549, 1, 1,
0.2036779, -1.480846, 2.389468, 0, 0.5686275, 1, 1,
0.217291, 0.392116, 0.9665812, 0, 0.5607843, 1, 1,
0.2210066, 0.3092834, 0.4461071, 0, 0.5568628, 1, 1,
0.225558, 1.957745, -0.9515499, 0, 0.5490196, 1, 1,
0.2270916, 1.706338, 0.1735018, 0, 0.5450981, 1, 1,
0.2304485, -0.7911635, 1.856337, 0, 0.5372549, 1, 1,
0.2334564, -0.5998024, 2.657144, 0, 0.5333334, 1, 1,
0.2343031, -0.2859437, -0.08708657, 0, 0.5254902, 1, 1,
0.2401634, 0.6929672, 0.4849508, 0, 0.5215687, 1, 1,
0.2446872, 0.3916991, -1.046946, 0, 0.5137255, 1, 1,
0.2470587, -0.0113766, 2.507857, 0, 0.509804, 1, 1,
0.248571, 1.453609, 1.098792, 0, 0.5019608, 1, 1,
0.2498794, 0.674809, 0.03102914, 0, 0.4941176, 1, 1,
0.2626912, 0.3082673, 0.4104928, 0, 0.4901961, 1, 1,
0.2646852, 0.9143502, 0.06890811, 0, 0.4823529, 1, 1,
0.2652133, -0.7850434, 2.455608, 0, 0.4784314, 1, 1,
0.2667573, 1.707964, 0.1991325, 0, 0.4705882, 1, 1,
0.2672355, -0.6943073, 2.376682, 0, 0.4666667, 1, 1,
0.2672938, 0.2244934, 1.026119, 0, 0.4588235, 1, 1,
0.2675808, 1.32558, -0.4871906, 0, 0.454902, 1, 1,
0.2704924, -0.1867425, 3.293323, 0, 0.4470588, 1, 1,
0.2723461, -1.860676, 0.9034921, 0, 0.4431373, 1, 1,
0.2836197, -1.077899, 2.666053, 0, 0.4352941, 1, 1,
0.2856137, 2.353435, -1.243696, 0, 0.4313726, 1, 1,
0.2869027, -1.668281, 3.772784, 0, 0.4235294, 1, 1,
0.2908597, 1.479268, 1.610335, 0, 0.4196078, 1, 1,
0.2909848, -0.4830985, 2.2116, 0, 0.4117647, 1, 1,
0.2913278, -2.088748, 2.523782, 0, 0.4078431, 1, 1,
0.2960412, -0.2676665, 2.088648, 0, 0.4, 1, 1,
0.2970687, 2.007375, 0.4993117, 0, 0.3921569, 1, 1,
0.3005259, -0.1501408, 1.706774, 0, 0.3882353, 1, 1,
0.3043239, 0.5161292, 2.27562, 0, 0.3803922, 1, 1,
0.3045875, 1.264984, -1.168808, 0, 0.3764706, 1, 1,
0.308139, -0.9256157, 1.620763, 0, 0.3686275, 1, 1,
0.3084829, 0.6921242, 1.340916, 0, 0.3647059, 1, 1,
0.311473, 2.121972, 0.8281826, 0, 0.3568628, 1, 1,
0.3144829, 0.14315, 2.298329, 0, 0.3529412, 1, 1,
0.316829, 2.010722, -0.5584881, 0, 0.345098, 1, 1,
0.3168744, -0.4000579, 1.475275, 0, 0.3411765, 1, 1,
0.3178307, -0.230466, 0.9415979, 0, 0.3333333, 1, 1,
0.3181722, -0.4378597, 3.091816, 0, 0.3294118, 1, 1,
0.321516, -0.8166039, 3.412267, 0, 0.3215686, 1, 1,
0.3230541, 0.8564894, -0.873053, 0, 0.3176471, 1, 1,
0.3294393, -1.827032, 4.080492, 0, 0.3098039, 1, 1,
0.3304705, -0.5797302, 2.346828, 0, 0.3058824, 1, 1,
0.3336935, 0.9446166, -0.1227255, 0, 0.2980392, 1, 1,
0.3343908, 0.6265125, 1.2554, 0, 0.2901961, 1, 1,
0.3371964, 0.3190146, 0.6056259, 0, 0.2862745, 1, 1,
0.34128, 0.6584636, -1.289557, 0, 0.2784314, 1, 1,
0.3442421, -0.8256232, 2.622111, 0, 0.2745098, 1, 1,
0.3449296, 0.335009, 1.858082, 0, 0.2666667, 1, 1,
0.3505146, 0.9505063, -0.4246796, 0, 0.2627451, 1, 1,
0.3509421, -1.980003, 3.673129, 0, 0.254902, 1, 1,
0.355899, 1.067364, 1.004498, 0, 0.2509804, 1, 1,
0.356207, -0.9821808, 3.793055, 0, 0.2431373, 1, 1,
0.3607845, -1.608597, 2.588846, 0, 0.2392157, 1, 1,
0.3649813, -0.03106281, 2.597437, 0, 0.2313726, 1, 1,
0.3662538, -0.3014826, 0.2209717, 0, 0.227451, 1, 1,
0.3703837, 1.134268, 0.06740849, 0, 0.2196078, 1, 1,
0.3722793, -0.3325999, 1.507709, 0, 0.2156863, 1, 1,
0.3741626, 0.1081093, 1.899306, 0, 0.2078431, 1, 1,
0.3744993, -2.777864, 3.940731, 0, 0.2039216, 1, 1,
0.3764991, 0.9451838, 0.3021366, 0, 0.1960784, 1, 1,
0.3775832, -1.736775, 3.029967, 0, 0.1882353, 1, 1,
0.3782533, -0.5292966, 0.986272, 0, 0.1843137, 1, 1,
0.3805033, -0.7135257, 2.70566, 0, 0.1764706, 1, 1,
0.380555, -0.5886264, 0.5377735, 0, 0.172549, 1, 1,
0.3808857, -0.7310697, 2.694701, 0, 0.1647059, 1, 1,
0.3834465, -1.029157, 4.118018, 0, 0.1607843, 1, 1,
0.384155, 0.3206416, 0.882851, 0, 0.1529412, 1, 1,
0.3873554, 1.535607, -0.9762009, 0, 0.1490196, 1, 1,
0.3884463, 0.7364935, -0.6944071, 0, 0.1411765, 1, 1,
0.3907227, -0.1703923, 1.381441, 0, 0.1372549, 1, 1,
0.3939964, -1.401609, 4.150056, 0, 0.1294118, 1, 1,
0.3964141, -1.398767, 2.06853, 0, 0.1254902, 1, 1,
0.396821, 0.4150502, 3.608271, 0, 0.1176471, 1, 1,
0.3997214, 1.798612, -0.001816913, 0, 0.1137255, 1, 1,
0.4013162, 0.7070323, -0.9374571, 0, 0.1058824, 1, 1,
0.4020213, -0.5354995, 4.03243, 0, 0.09803922, 1, 1,
0.4022969, -0.9720176, 2.790714, 0, 0.09411765, 1, 1,
0.4046105, -0.6457104, 1.969345, 0, 0.08627451, 1, 1,
0.4052331, 1.118381, -2.203094, 0, 0.08235294, 1, 1,
0.4068227, -0.6593736, 2.275862, 0, 0.07450981, 1, 1,
0.4082192, -0.5808854, 1.48916, 0, 0.07058824, 1, 1,
0.4082474, 1.866872, 0.8242868, 0, 0.0627451, 1, 1,
0.4089188, -0.2944782, 2.425951, 0, 0.05882353, 1, 1,
0.4131404, -0.9491249, 4.421118, 0, 0.05098039, 1, 1,
0.413219, 1.28357, 0.9585606, 0, 0.04705882, 1, 1,
0.4178152, 1.310905, 0.9827787, 0, 0.03921569, 1, 1,
0.4214074, 0.4198113, 2.251149, 0, 0.03529412, 1, 1,
0.4238115, -0.05009092, 2.534665, 0, 0.02745098, 1, 1,
0.4255344, 1.593027, 1.356522, 0, 0.02352941, 1, 1,
0.4291199, -0.3638667, 2.017925, 0, 0.01568628, 1, 1,
0.4298894, -0.1468655, 1.006046, 0, 0.01176471, 1, 1,
0.4300106, -0.7516311, 3.443351, 0, 0.003921569, 1, 1,
0.4320713, -1.024712, 3.159994, 0.003921569, 0, 1, 1,
0.43322, 1.104277, -0.03472934, 0.007843138, 0, 1, 1,
0.4400433, 0.3077518, 0.8576506, 0.01568628, 0, 1, 1,
0.4405444, -0.09345309, 1.519812, 0.01960784, 0, 1, 1,
0.4437831, 1.55801, 0.7473807, 0.02745098, 0, 1, 1,
0.4450042, -0.5312126, 2.538677, 0.03137255, 0, 1, 1,
0.4456666, 1.178597, -0.2695103, 0.03921569, 0, 1, 1,
0.4462312, -0.2929577, 3.35816, 0.04313726, 0, 1, 1,
0.4475031, -0.09066832, 3.492215, 0.05098039, 0, 1, 1,
0.4481425, 0.4824703, 0.1074087, 0.05490196, 0, 1, 1,
0.4497676, 0.3207996, 1.327249, 0.0627451, 0, 1, 1,
0.4528109, 0.3573319, 2.730999, 0.06666667, 0, 1, 1,
0.4566249, 0.995912, 0.5034602, 0.07450981, 0, 1, 1,
0.4587314, -1.353606, 2.017524, 0.07843138, 0, 1, 1,
0.4645682, -1.802873, 3.352948, 0.08627451, 0, 1, 1,
0.464829, -1.287541, 3.002601, 0.09019608, 0, 1, 1,
0.4721103, -1.243465, 3.637009, 0.09803922, 0, 1, 1,
0.4817983, 1.17633, 1.211814, 0.1058824, 0, 1, 1,
0.4915206, -0.1947882, 1.4741, 0.1098039, 0, 1, 1,
0.4939912, -0.9188657, 2.287655, 0.1176471, 0, 1, 1,
0.5051814, 1.240046, 0.04917043, 0.1215686, 0, 1, 1,
0.5053167, -1.619618, 2.712104, 0.1294118, 0, 1, 1,
0.5057483, -0.2683484, 1.424501, 0.1333333, 0, 1, 1,
0.505976, 0.8772772, 0.6019725, 0.1411765, 0, 1, 1,
0.5072468, -0.8503562, 2.701706, 0.145098, 0, 1, 1,
0.5162776, -0.05250055, 2.8554, 0.1529412, 0, 1, 1,
0.5180146, 1.146081, -1.648918, 0.1568628, 0, 1, 1,
0.5295604, -0.4148403, 2.799514, 0.1647059, 0, 1, 1,
0.5307143, 1.34596, 2.776367, 0.1686275, 0, 1, 1,
0.5343056, -1.009474, 2.287676, 0.1764706, 0, 1, 1,
0.5362367, 1.898068, 0.8393528, 0.1803922, 0, 1, 1,
0.5403483, -0.5442988, -0.1574441, 0.1882353, 0, 1, 1,
0.5406998, -0.5589631, 1.725839, 0.1921569, 0, 1, 1,
0.543349, -0.341608, 2.07636, 0.2, 0, 1, 1,
0.5446034, 1.94449, 0.6379626, 0.2078431, 0, 1, 1,
0.5537312, 0.9565122, 0.4336367, 0.2117647, 0, 1, 1,
0.5550944, -1.200927, 2.459127, 0.2196078, 0, 1, 1,
0.5587223, -0.08298013, 0.7986687, 0.2235294, 0, 1, 1,
0.5590453, 0.4787228, 0.5470699, 0.2313726, 0, 1, 1,
0.5647953, 1.463005, 0.87566, 0.2352941, 0, 1, 1,
0.579707, -0.870757, 3.865558, 0.2431373, 0, 1, 1,
0.5809434, -0.7624903, 2.053357, 0.2470588, 0, 1, 1,
0.5905864, 2.25384, 0.8528137, 0.254902, 0, 1, 1,
0.5951056, -0.1443735, 3.139879, 0.2588235, 0, 1, 1,
0.5978721, 1.980866, 2.23431, 0.2666667, 0, 1, 1,
0.5991805, -0.4653723, 2.671614, 0.2705882, 0, 1, 1,
0.5995771, -0.4385069, 1.831566, 0.2784314, 0, 1, 1,
0.6008195, 0.2834956, 0.6369568, 0.282353, 0, 1, 1,
0.6044659, -0.7062927, 4.679917, 0.2901961, 0, 1, 1,
0.6085803, -1.037058, 1.4561, 0.2941177, 0, 1, 1,
0.6161082, 1.430183, 0.7935627, 0.3019608, 0, 1, 1,
0.6195094, -1.348025, 3.907836, 0.3098039, 0, 1, 1,
0.6220242, -1.672759, 0.5402131, 0.3137255, 0, 1, 1,
0.6277998, 1.071374, 1.589718, 0.3215686, 0, 1, 1,
0.6295941, -0.1100781, 0.9861696, 0.3254902, 0, 1, 1,
0.6353103, 0.6761227, -0.06470383, 0.3333333, 0, 1, 1,
0.6496051, 0.2641454, 1.200157, 0.3372549, 0, 1, 1,
0.6500226, -0.2828065, 1.292319, 0.345098, 0, 1, 1,
0.6509262, -1.66955, 1.206941, 0.3490196, 0, 1, 1,
0.6517197, -0.06968629, 1.035351, 0.3568628, 0, 1, 1,
0.6554772, 0.2566839, 1.268166, 0.3607843, 0, 1, 1,
0.6581284, 1.153232, 2.29917, 0.3686275, 0, 1, 1,
0.6637894, 0.9227312, 0.5391058, 0.372549, 0, 1, 1,
0.6664469, -0.4425209, 3.566387, 0.3803922, 0, 1, 1,
0.6679808, -2.769633, 2.915326, 0.3843137, 0, 1, 1,
0.669504, -1.146077, 2.636938, 0.3921569, 0, 1, 1,
0.6719759, 2.339154, 0.05324916, 0.3960784, 0, 1, 1,
0.6755357, -1.595026, 3.089344, 0.4039216, 0, 1, 1,
0.6838915, 1.173508, 1.311895, 0.4117647, 0, 1, 1,
0.6845914, -0.212822, 2.723475, 0.4156863, 0, 1, 1,
0.6857183, -0.06003513, 1.879589, 0.4235294, 0, 1, 1,
0.6861184, -0.5612015, 2.840909, 0.427451, 0, 1, 1,
0.6956452, 2.215961, -0.5274147, 0.4352941, 0, 1, 1,
0.6972775, -0.2356074, 0.9251076, 0.4392157, 0, 1, 1,
0.6990156, 0.6381382, 0.977991, 0.4470588, 0, 1, 1,
0.6996889, 0.02980375, 2.213916, 0.4509804, 0, 1, 1,
0.6996953, 0.9468624, 1.975174, 0.4588235, 0, 1, 1,
0.707508, -0.9732424, 4.488873, 0.4627451, 0, 1, 1,
0.7138504, -0.05959046, 2.22932, 0.4705882, 0, 1, 1,
0.7159827, -0.2288863, -0.3694064, 0.4745098, 0, 1, 1,
0.7178485, -1.29928, 1.879326, 0.4823529, 0, 1, 1,
0.7192532, -1.240293, 4.39496, 0.4862745, 0, 1, 1,
0.7240545, -0.5077402, 2.820284, 0.4941176, 0, 1, 1,
0.7242964, -1.208536, 2.934658, 0.5019608, 0, 1, 1,
0.7247587, -0.6618704, 4.730578, 0.5058824, 0, 1, 1,
0.7249485, -0.5332638, 3.220286, 0.5137255, 0, 1, 1,
0.727591, -1.260849, 1.689655, 0.5176471, 0, 1, 1,
0.7360327, 1.04821, 0.7871528, 0.5254902, 0, 1, 1,
0.7373213, 0.4614283, 1.637419, 0.5294118, 0, 1, 1,
0.7424176, 0.6741326, -0.1894419, 0.5372549, 0, 1, 1,
0.7440559, -0.2333864, 1.651133, 0.5411765, 0, 1, 1,
0.7493414, 1.634777, 1.00542, 0.5490196, 0, 1, 1,
0.7506974, -1.162388, 1.385904, 0.5529412, 0, 1, 1,
0.7508308, -1.947104, 2.046583, 0.5607843, 0, 1, 1,
0.7516778, -1.094376, 3.033686, 0.5647059, 0, 1, 1,
0.7532954, -0.6913783, 1.723681, 0.572549, 0, 1, 1,
0.7589092, -0.1203508, 2.102483, 0.5764706, 0, 1, 1,
0.762781, -0.2696808, 1.371215, 0.5843138, 0, 1, 1,
0.7681268, 0.3512167, 2.226854, 0.5882353, 0, 1, 1,
0.7727044, -0.1386076, 2.658751, 0.5960785, 0, 1, 1,
0.77337, 2.991802, 0.6053124, 0.6039216, 0, 1, 1,
0.7856798, 0.9397987, 0.7241065, 0.6078432, 0, 1, 1,
0.7905289, 0.09456208, 1.968011, 0.6156863, 0, 1, 1,
0.7947923, 0.07182361, 0.547657, 0.6196079, 0, 1, 1,
0.796203, -0.320204, 1.947867, 0.627451, 0, 1, 1,
0.8064264, -0.2990148, 3.528275, 0.6313726, 0, 1, 1,
0.8081794, 0.2654069, 1.558442, 0.6392157, 0, 1, 1,
0.8107258, 1.721383, -0.2395484, 0.6431373, 0, 1, 1,
0.8129629, 0.5378528, -0.5319362, 0.6509804, 0, 1, 1,
0.8176607, 1.133059, 0.4688787, 0.654902, 0, 1, 1,
0.8186986, 1.063721, -1.400519, 0.6627451, 0, 1, 1,
0.8204736, -0.504605, 2.753746, 0.6666667, 0, 1, 1,
0.8220795, -1.905239, 1.946844, 0.6745098, 0, 1, 1,
0.8254167, 0.7849718, 1.327717, 0.6784314, 0, 1, 1,
0.8256295, -0.07886242, 3.062175, 0.6862745, 0, 1, 1,
0.8287064, -0.8237709, 1.217939, 0.6901961, 0, 1, 1,
0.8288648, 2.329795, -0.3486344, 0.6980392, 0, 1, 1,
0.8339581, 0.04324929, -0.07125787, 0.7058824, 0, 1, 1,
0.8375691, 0.0955505, 1.451551, 0.7098039, 0, 1, 1,
0.8460612, 0.6202644, 0.1064919, 0.7176471, 0, 1, 1,
0.8462199, -0.7206798, 1.325714, 0.7215686, 0, 1, 1,
0.8480163, 0.2077584, -0.6856956, 0.7294118, 0, 1, 1,
0.849878, -0.6800178, 1.900338, 0.7333333, 0, 1, 1,
0.8533491, 0.9748195, 2.270062, 0.7411765, 0, 1, 1,
0.8566656, 0.5405331, 1.916493, 0.7450981, 0, 1, 1,
0.8607362, -0.8792285, 3.322875, 0.7529412, 0, 1, 1,
0.8619907, -0.4599266, 1.960634, 0.7568628, 0, 1, 1,
0.8641618, 1.340861, 0.7941241, 0.7647059, 0, 1, 1,
0.8659165, 1.444559, 2.050097, 0.7686275, 0, 1, 1,
0.8690497, -0.2503791, 2.00917, 0.7764706, 0, 1, 1,
0.873318, 0.2388757, 1.594806, 0.7803922, 0, 1, 1,
0.8763344, 0.9988161, 1.932679, 0.7882353, 0, 1, 1,
0.8771455, -0.7444824, 3.179399, 0.7921569, 0, 1, 1,
0.8777303, -1.043848, 1.784807, 0.8, 0, 1, 1,
0.882063, 0.4895516, 0.03305572, 0.8078431, 0, 1, 1,
0.8828083, 0.8394048, 0.7803947, 0.8117647, 0, 1, 1,
0.8882239, 1.328295, -2.052417, 0.8196079, 0, 1, 1,
0.8907713, 0.7884861, 2.247368, 0.8235294, 0, 1, 1,
0.8999169, -1.940377, 3.114123, 0.8313726, 0, 1, 1,
0.9010894, 0.763081, -0.1864917, 0.8352941, 0, 1, 1,
0.9079239, -0.0679471, 2.181364, 0.8431373, 0, 1, 1,
0.9101136, -0.8601913, 3.708795, 0.8470588, 0, 1, 1,
0.910793, -1.090527, 3.50303, 0.854902, 0, 1, 1,
0.9145256, 0.002304291, 2.065092, 0.8588235, 0, 1, 1,
0.914812, -0.1921701, 2.618704, 0.8666667, 0, 1, 1,
0.9297736, 0.04132001, 1.74893, 0.8705882, 0, 1, 1,
0.9299853, 0.7706347, 0.3051641, 0.8784314, 0, 1, 1,
0.9332862, 0.9533881, 0.9707459, 0.8823529, 0, 1, 1,
0.9334689, -1.548373, 0.7833046, 0.8901961, 0, 1, 1,
0.9340054, -1.640213, 2.90367, 0.8941177, 0, 1, 1,
0.9349104, -0.5458509, 1.696282, 0.9019608, 0, 1, 1,
0.9355061, 2.087332, 0.9544895, 0.9098039, 0, 1, 1,
0.9361348, -0.06159042, 0.7469946, 0.9137255, 0, 1, 1,
0.9393448, 1.213792, -0.3715757, 0.9215686, 0, 1, 1,
0.9419261, 1.989225, -1.004048, 0.9254902, 0, 1, 1,
0.9438934, 1.043837, 0.6381643, 0.9333333, 0, 1, 1,
0.9456767, 0.6829327, 1.755996, 0.9372549, 0, 1, 1,
0.9522781, -0.7769842, 1.04107, 0.945098, 0, 1, 1,
0.9553766, 0.5294828, 0.9047129, 0.9490196, 0, 1, 1,
0.95564, -1.585925, 2.016033, 0.9568627, 0, 1, 1,
0.9639103, -0.6313481, 3.186345, 0.9607843, 0, 1, 1,
0.9646935, -0.6989589, 1.186548, 0.9686275, 0, 1, 1,
0.9681201, -1.340512, 3.195415, 0.972549, 0, 1, 1,
0.9723614, 0.01514084, 1.781724, 0.9803922, 0, 1, 1,
0.9795465, 0.1527608, 3.636893, 0.9843137, 0, 1, 1,
0.9895886, -1.396925, 2.12118, 0.9921569, 0, 1, 1,
0.9908906, -1.490476, 2.197457, 0.9960784, 0, 1, 1,
0.9968284, -0.1172912, -0.1434016, 1, 0, 0.9960784, 1,
1.002022, -0.611967, 2.833529, 1, 0, 0.9882353, 1,
1.003596, 1.289843, 0.5965248, 1, 0, 0.9843137, 1,
1.00587, 0.3834842, 0.636983, 1, 0, 0.9764706, 1,
1.011421, -0.7057852, 3.777978, 1, 0, 0.972549, 1,
1.011765, -0.2007844, 2.959055, 1, 0, 0.9647059, 1,
1.015146, 1.399737, -0.6819768, 1, 0, 0.9607843, 1,
1.017719, -1.129914, 3.005085, 1, 0, 0.9529412, 1,
1.019152, -0.3067318, 2.247928, 1, 0, 0.9490196, 1,
1.026828, 0.4959327, 0.4793377, 1, 0, 0.9411765, 1,
1.027726, 0.07288505, 2.119631, 1, 0, 0.9372549, 1,
1.035512, 0.4360916, 2.425145, 1, 0, 0.9294118, 1,
1.035896, -1.905424, 4.087233, 1, 0, 0.9254902, 1,
1.038406, 0.98018, 0.3268093, 1, 0, 0.9176471, 1,
1.038644, 1.134024, 1.10366, 1, 0, 0.9137255, 1,
1.040542, -1.606319, 3.496446, 1, 0, 0.9058824, 1,
1.041135, 1.504319, 1.605093, 1, 0, 0.9019608, 1,
1.043397, -0.4416291, 0.8862455, 1, 0, 0.8941177, 1,
1.043816, -1.178339, 2.025384, 1, 0, 0.8862745, 1,
1.047354, -0.5139871, 1.426314, 1, 0, 0.8823529, 1,
1.050254, 2.323426, -1.053345, 1, 0, 0.8745098, 1,
1.055804, 0.5017267, -0.5935726, 1, 0, 0.8705882, 1,
1.061326, -0.6787713, 2.814114, 1, 0, 0.8627451, 1,
1.0649, -0.7381563, 1.432334, 1, 0, 0.8588235, 1,
1.067909, 0.8602862, 0.3912663, 1, 0, 0.8509804, 1,
1.07553, -1.300683, 2.280926, 1, 0, 0.8470588, 1,
1.077797, 0.1639564, 0.9981363, 1, 0, 0.8392157, 1,
1.086018, 0.184995, 3.978578, 1, 0, 0.8352941, 1,
1.087438, 1.195464, -2.093813, 1, 0, 0.827451, 1,
1.112654, 1.233603, 1.428449, 1, 0, 0.8235294, 1,
1.113547, 0.5079537, 1.549753, 1, 0, 0.8156863, 1,
1.113791, 2.671028, 0.7518093, 1, 0, 0.8117647, 1,
1.120916, -0.4336985, 0.8124821, 1, 0, 0.8039216, 1,
1.131893, -0.2088797, -0.2710502, 1, 0, 0.7960784, 1,
1.133106, -0.07619543, 2.022877, 1, 0, 0.7921569, 1,
1.133914, 0.4617687, -0.07645503, 1, 0, 0.7843137, 1,
1.135692, 0.3115846, -0.09015142, 1, 0, 0.7803922, 1,
1.13685, 0.7217156, 1.421234, 1, 0, 0.772549, 1,
1.147171, 1.606815, 0.9489898, 1, 0, 0.7686275, 1,
1.147981, 0.05483619, 2.651222, 1, 0, 0.7607843, 1,
1.151593, 0.2147415, 3.307747, 1, 0, 0.7568628, 1,
1.152672, -0.7043431, 1.690894, 1, 0, 0.7490196, 1,
1.155098, -1.394057, 0.8770964, 1, 0, 0.7450981, 1,
1.162478, -1.569271, 4.750077, 1, 0, 0.7372549, 1,
1.163889, 0.2767843, 1.788661, 1, 0, 0.7333333, 1,
1.172222, -0.3437852, 1.446147, 1, 0, 0.7254902, 1,
1.179209, 0.2832829, 0.8012103, 1, 0, 0.7215686, 1,
1.181268, -0.9172027, 2.158113, 1, 0, 0.7137255, 1,
1.186663, 1.594505, -0.1954749, 1, 0, 0.7098039, 1,
1.191319, -0.7392556, 3.189124, 1, 0, 0.7019608, 1,
1.196628, -0.9602168, 4.585077, 1, 0, 0.6941177, 1,
1.205766, 1.940621, -0.4745152, 1, 0, 0.6901961, 1,
1.205976, -1.434288, 1.594684, 1, 0, 0.682353, 1,
1.208402, 0.5010773, 0.9414464, 1, 0, 0.6784314, 1,
1.208907, 0.4304339, 0.03500769, 1, 0, 0.6705883, 1,
1.21419, -0.9616932, 2.027694, 1, 0, 0.6666667, 1,
1.218112, -0.4405361, 2.348743, 1, 0, 0.6588235, 1,
1.218854, -0.321472, 1.825611, 1, 0, 0.654902, 1,
1.224525, 0.8635924, -0.3340422, 1, 0, 0.6470588, 1,
1.226564, 0.6176603, 1.692445, 1, 0, 0.6431373, 1,
1.230332, 1.842605, -0.4074727, 1, 0, 0.6352941, 1,
1.235202, -0.5680664, 2.402612, 1, 0, 0.6313726, 1,
1.242785, -0.01895458, 1.911012, 1, 0, 0.6235294, 1,
1.243338, 1.22924, 1.405966, 1, 0, 0.6196079, 1,
1.250831, 0.1841242, 0.6718035, 1, 0, 0.6117647, 1,
1.26808, 0.2773702, 1.955354, 1, 0, 0.6078432, 1,
1.269744, 1.527084, 0.9714193, 1, 0, 0.6, 1,
1.288104, 0.982865, -0.2778292, 1, 0, 0.5921569, 1,
1.288272, -0.9743133, 0.4335461, 1, 0, 0.5882353, 1,
1.288842, -1.306858, 3.504122, 1, 0, 0.5803922, 1,
1.28899, -1.017291, 1.887499, 1, 0, 0.5764706, 1,
1.291443, 0.9188445, 0.263809, 1, 0, 0.5686275, 1,
1.300103, -1.711362, 2.005594, 1, 0, 0.5647059, 1,
1.300323, -0.6882217, 2.30493, 1, 0, 0.5568628, 1,
1.305803, -0.8866789, 0.07767544, 1, 0, 0.5529412, 1,
1.306686, 1.056085, 0.7567464, 1, 0, 0.5450981, 1,
1.30794, -0.6897712, 2.547561, 1, 0, 0.5411765, 1,
1.312269, -1.340354, 3.383282, 1, 0, 0.5333334, 1,
1.312487, 1.60032, 0.3656018, 1, 0, 0.5294118, 1,
1.322113, 0.1684572, 1.971821, 1, 0, 0.5215687, 1,
1.328107, 0.4924919, 1.317462, 1, 0, 0.5176471, 1,
1.330617, 0.9161518, -0.6412235, 1, 0, 0.509804, 1,
1.331114, -0.4154538, 0.8920891, 1, 0, 0.5058824, 1,
1.332542, 1.262402, 0.9461336, 1, 0, 0.4980392, 1,
1.351539, 0.5153877, 1.032393, 1, 0, 0.4901961, 1,
1.352832, 1.051092, 0.3562928, 1, 0, 0.4862745, 1,
1.35726, 1.05713, -1.075818, 1, 0, 0.4784314, 1,
1.361993, 0.9685807, -0.4407031, 1, 0, 0.4745098, 1,
1.364189, -0.549682, 2.683643, 1, 0, 0.4666667, 1,
1.365821, 0.9359721, 1.275073, 1, 0, 0.4627451, 1,
1.396527, -0.1965942, 2.737663, 1, 0, 0.454902, 1,
1.401867, -0.3784116, 2.455719, 1, 0, 0.4509804, 1,
1.411314, -0.4492843, 1.186099, 1, 0, 0.4431373, 1,
1.429863, -2.637889, 2.582199, 1, 0, 0.4392157, 1,
1.431169, -1.24441, 2.266683, 1, 0, 0.4313726, 1,
1.434456, 0.2852863, 0.1702029, 1, 0, 0.427451, 1,
1.442969, -0.2761122, 0.5417076, 1, 0, 0.4196078, 1,
1.465735, 0.1000802, -0.05850662, 1, 0, 0.4156863, 1,
1.48248, -0.526486, 0.5074305, 1, 0, 0.4078431, 1,
1.495694, 3.003745, -1.317226, 1, 0, 0.4039216, 1,
1.509416, -0.1297964, 2.335729, 1, 0, 0.3960784, 1,
1.510598, 1.36707, 2.019188, 1, 0, 0.3882353, 1,
1.510614, 0.06742407, 1.591594, 1, 0, 0.3843137, 1,
1.510761, 0.9593811, 1.323987, 1, 0, 0.3764706, 1,
1.513396, 1.003276, 0.7686944, 1, 0, 0.372549, 1,
1.518826, 0.3853316, -0.09135116, 1, 0, 0.3647059, 1,
1.537342, 1.013466, 0.9078555, 1, 0, 0.3607843, 1,
1.542517, -1.093969, 1.541306, 1, 0, 0.3529412, 1,
1.545368, -0.4324826, 0.7807581, 1, 0, 0.3490196, 1,
1.558751, -0.8524213, -0.005024013, 1, 0, 0.3411765, 1,
1.562194, -0.7236527, 2.369685, 1, 0, 0.3372549, 1,
1.564443, 0.6589107, 2.237663, 1, 0, 0.3294118, 1,
1.575519, 1.350294, -0.2489914, 1, 0, 0.3254902, 1,
1.59718, 0.1645933, 3.820253, 1, 0, 0.3176471, 1,
1.618061, 1.934264, 2.025629, 1, 0, 0.3137255, 1,
1.665105, -0.1825248, 0.9166461, 1, 0, 0.3058824, 1,
1.673222, 1.04739, -0.8637696, 1, 0, 0.2980392, 1,
1.674009, 0.7217571, 2.646256, 1, 0, 0.2941177, 1,
1.675113, -1.890683, 3.265779, 1, 0, 0.2862745, 1,
1.685787, -0.5994951, 3.279131, 1, 0, 0.282353, 1,
1.688404, 1.150581, 0.9380654, 1, 0, 0.2745098, 1,
1.70066, 0.3999149, 0.2784634, 1, 0, 0.2705882, 1,
1.710533, -1.0303, 1.27632, 1, 0, 0.2627451, 1,
1.716722, -0.3689874, 1.502037, 1, 0, 0.2588235, 1,
1.73558, -1.361826, 0.4422532, 1, 0, 0.2509804, 1,
1.749967, -0.4572838, 2.646344, 1, 0, 0.2470588, 1,
1.795468, 1.090147, 1.060495, 1, 0, 0.2392157, 1,
1.802113, -0.3038016, 4.464939, 1, 0, 0.2352941, 1,
1.815295, 0.08785953, 2.944398, 1, 0, 0.227451, 1,
1.816069, -1.172858, 2.283884, 1, 0, 0.2235294, 1,
1.826766, -1.050899, 0.9584293, 1, 0, 0.2156863, 1,
1.83625, -1.758698, 2.255665, 1, 0, 0.2117647, 1,
1.840037, -1.844711, 0.9352955, 1, 0, 0.2039216, 1,
1.84277, 0.8282304, 3.072576, 1, 0, 0.1960784, 1,
1.869759, -0.04876333, 1.126494, 1, 0, 0.1921569, 1,
1.871562, -0.537506, 2.015295, 1, 0, 0.1843137, 1,
1.877639, 0.1884136, 0.2547328, 1, 0, 0.1803922, 1,
1.879923, 1.198576, 0.1488317, 1, 0, 0.172549, 1,
1.93092, -0.4994726, 2.552299, 1, 0, 0.1686275, 1,
1.93443, 0.8506253, 1.614113, 1, 0, 0.1607843, 1,
1.971772, -0.158101, 0.2484177, 1, 0, 0.1568628, 1,
1.981802, -0.2897127, 1.090915, 1, 0, 0.1490196, 1,
1.985655, 0.7009974, 1.683243, 1, 0, 0.145098, 1,
2.013822, -0.1201635, 1.287693, 1, 0, 0.1372549, 1,
2.069442, -1.362906, 1.308654, 1, 0, 0.1333333, 1,
2.092701, 1.587827, 0.5125238, 1, 0, 0.1254902, 1,
2.115283, -0.03217126, 2.110482, 1, 0, 0.1215686, 1,
2.140152, 0.9660574, 1.840947, 1, 0, 0.1137255, 1,
2.17187, 0.4869874, 1.181514, 1, 0, 0.1098039, 1,
2.192565, 0.5441366, 0.5010127, 1, 0, 0.1019608, 1,
2.19485, 0.2984684, -0.4691009, 1, 0, 0.09411765, 1,
2.243056, 0.9025572, 0.9400671, 1, 0, 0.09019608, 1,
2.254183, 1.04485, 1.161068, 1, 0, 0.08235294, 1,
2.326489, -1.288611, 3.449024, 1, 0, 0.07843138, 1,
2.332637, 0.02459889, 0.5977373, 1, 0, 0.07058824, 1,
2.349482, -0.269982, 2.87139, 1, 0, 0.06666667, 1,
2.396542, 1.347123, 2.498674, 1, 0, 0.05882353, 1,
2.483072, 1.125231, 2.27371, 1, 0, 0.05490196, 1,
2.508722, 0.3907341, 2.927453, 1, 0, 0.04705882, 1,
2.518997, -0.5304919, 1.687596, 1, 0, 0.04313726, 1,
2.536065, 0.5576438, 1.05785, 1, 0, 0.03529412, 1,
2.559288, 0.3703044, 1.254238, 1, 0, 0.03137255, 1,
2.582493, 0.9285294, 1.105961, 1, 0, 0.02352941, 1,
2.585711, -0.5494623, 0.7398799, 1, 0, 0.01960784, 1,
2.922579, 2.288561, 2.109323, 1, 0, 0.01176471, 1,
2.9692, 1.387757, 1.868973, 1, 0, 0.007843138, 1
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
-0.3814527, -4.282972, -6.948884, 0, -0.5, 0.5, 0.5,
-0.3814527, -4.282972, -6.948884, 1, -0.5, 0.5, 0.5,
-0.3814527, -4.282972, -6.948884, 1, 1.5, 0.5, 0.5,
-0.3814527, -4.282972, -6.948884, 0, 1.5, 0.5, 0.5
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
-4.867976, -0.1012288, -6.948884, 0, -0.5, 0.5, 0.5,
-4.867976, -0.1012288, -6.948884, 1, -0.5, 0.5, 0.5,
-4.867976, -0.1012288, -6.948884, 1, 1.5, 0.5, 0.5,
-4.867976, -0.1012288, -6.948884, 0, 1.5, 0.5, 0.5
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
-4.867976, -4.282972, 0.1427429, 0, -0.5, 0.5, 0.5,
-4.867976, -4.282972, 0.1427429, 1, -0.5, 0.5, 0.5,
-4.867976, -4.282972, 0.1427429, 1, 1.5, 0.5, 0.5,
-4.867976, -4.282972, 0.1427429, 0, 1.5, 0.5, 0.5
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
-3, -3.317955, -5.312355,
2, -3.317955, -5.312355,
-3, -3.317955, -5.312355,
-3, -3.478791, -5.58511,
-2, -3.317955, -5.312355,
-2, -3.478791, -5.58511,
-1, -3.317955, -5.312355,
-1, -3.478791, -5.58511,
0, -3.317955, -5.312355,
0, -3.478791, -5.58511,
1, -3.317955, -5.312355,
1, -3.478791, -5.58511,
2, -3.317955, -5.312355,
2, -3.478791, -5.58511
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
-3, -3.800463, -6.13062, 0, -0.5, 0.5, 0.5,
-3, -3.800463, -6.13062, 1, -0.5, 0.5, 0.5,
-3, -3.800463, -6.13062, 1, 1.5, 0.5, 0.5,
-3, -3.800463, -6.13062, 0, 1.5, 0.5, 0.5,
-2, -3.800463, -6.13062, 0, -0.5, 0.5, 0.5,
-2, -3.800463, -6.13062, 1, -0.5, 0.5, 0.5,
-2, -3.800463, -6.13062, 1, 1.5, 0.5, 0.5,
-2, -3.800463, -6.13062, 0, 1.5, 0.5, 0.5,
-1, -3.800463, -6.13062, 0, -0.5, 0.5, 0.5,
-1, -3.800463, -6.13062, 1, -0.5, 0.5, 0.5,
-1, -3.800463, -6.13062, 1, 1.5, 0.5, 0.5,
-1, -3.800463, -6.13062, 0, 1.5, 0.5, 0.5,
0, -3.800463, -6.13062, 0, -0.5, 0.5, 0.5,
0, -3.800463, -6.13062, 1, -0.5, 0.5, 0.5,
0, -3.800463, -6.13062, 1, 1.5, 0.5, 0.5,
0, -3.800463, -6.13062, 0, 1.5, 0.5, 0.5,
1, -3.800463, -6.13062, 0, -0.5, 0.5, 0.5,
1, -3.800463, -6.13062, 1, -0.5, 0.5, 0.5,
1, -3.800463, -6.13062, 1, 1.5, 0.5, 0.5,
1, -3.800463, -6.13062, 0, 1.5, 0.5, 0.5,
2, -3.800463, -6.13062, 0, -0.5, 0.5, 0.5,
2, -3.800463, -6.13062, 1, -0.5, 0.5, 0.5,
2, -3.800463, -6.13062, 1, 1.5, 0.5, 0.5,
2, -3.800463, -6.13062, 0, 1.5, 0.5, 0.5
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
-3.832625, -3, -5.312355,
-3.832625, 3, -5.312355,
-3.832625, -3, -5.312355,
-4.005183, -3, -5.58511,
-3.832625, -2, -5.312355,
-4.005183, -2, -5.58511,
-3.832625, -1, -5.312355,
-4.005183, -1, -5.58511,
-3.832625, 0, -5.312355,
-4.005183, 0, -5.58511,
-3.832625, 1, -5.312355,
-4.005183, 1, -5.58511,
-3.832625, 2, -5.312355,
-4.005183, 2, -5.58511,
-3.832625, 3, -5.312355,
-4.005183, 3, -5.58511
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
-4.3503, -3, -6.13062, 0, -0.5, 0.5, 0.5,
-4.3503, -3, -6.13062, 1, -0.5, 0.5, 0.5,
-4.3503, -3, -6.13062, 1, 1.5, 0.5, 0.5,
-4.3503, -3, -6.13062, 0, 1.5, 0.5, 0.5,
-4.3503, -2, -6.13062, 0, -0.5, 0.5, 0.5,
-4.3503, -2, -6.13062, 1, -0.5, 0.5, 0.5,
-4.3503, -2, -6.13062, 1, 1.5, 0.5, 0.5,
-4.3503, -2, -6.13062, 0, 1.5, 0.5, 0.5,
-4.3503, -1, -6.13062, 0, -0.5, 0.5, 0.5,
-4.3503, -1, -6.13062, 1, -0.5, 0.5, 0.5,
-4.3503, -1, -6.13062, 1, 1.5, 0.5, 0.5,
-4.3503, -1, -6.13062, 0, 1.5, 0.5, 0.5,
-4.3503, 0, -6.13062, 0, -0.5, 0.5, 0.5,
-4.3503, 0, -6.13062, 1, -0.5, 0.5, 0.5,
-4.3503, 0, -6.13062, 1, 1.5, 0.5, 0.5,
-4.3503, 0, -6.13062, 0, 1.5, 0.5, 0.5,
-4.3503, 1, -6.13062, 0, -0.5, 0.5, 0.5,
-4.3503, 1, -6.13062, 1, -0.5, 0.5, 0.5,
-4.3503, 1, -6.13062, 1, 1.5, 0.5, 0.5,
-4.3503, 1, -6.13062, 0, 1.5, 0.5, 0.5,
-4.3503, 2, -6.13062, 0, -0.5, 0.5, 0.5,
-4.3503, 2, -6.13062, 1, -0.5, 0.5, 0.5,
-4.3503, 2, -6.13062, 1, 1.5, 0.5, 0.5,
-4.3503, 2, -6.13062, 0, 1.5, 0.5, 0.5,
-4.3503, 3, -6.13062, 0, -0.5, 0.5, 0.5,
-4.3503, 3, -6.13062, 1, -0.5, 0.5, 0.5,
-4.3503, 3, -6.13062, 1, 1.5, 0.5, 0.5,
-4.3503, 3, -6.13062, 0, 1.5, 0.5, 0.5
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
-3.832625, -3.317955, -4,
-3.832625, -3.317955, 4,
-3.832625, -3.317955, -4,
-4.005183, -3.478791, -4,
-3.832625, -3.317955, -2,
-4.005183, -3.478791, -2,
-3.832625, -3.317955, 0,
-4.005183, -3.478791, 0,
-3.832625, -3.317955, 2,
-4.005183, -3.478791, 2,
-3.832625, -3.317955, 4,
-4.005183, -3.478791, 4
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
-4.3503, -3.800463, -4, 0, -0.5, 0.5, 0.5,
-4.3503, -3.800463, -4, 1, -0.5, 0.5, 0.5,
-4.3503, -3.800463, -4, 1, 1.5, 0.5, 0.5,
-4.3503, -3.800463, -4, 0, 1.5, 0.5, 0.5,
-4.3503, -3.800463, -2, 0, -0.5, 0.5, 0.5,
-4.3503, -3.800463, -2, 1, -0.5, 0.5, 0.5,
-4.3503, -3.800463, -2, 1, 1.5, 0.5, 0.5,
-4.3503, -3.800463, -2, 0, 1.5, 0.5, 0.5,
-4.3503, -3.800463, 0, 0, -0.5, 0.5, 0.5,
-4.3503, -3.800463, 0, 1, -0.5, 0.5, 0.5,
-4.3503, -3.800463, 0, 1, 1.5, 0.5, 0.5,
-4.3503, -3.800463, 0, 0, 1.5, 0.5, 0.5,
-4.3503, -3.800463, 2, 0, -0.5, 0.5, 0.5,
-4.3503, -3.800463, 2, 1, -0.5, 0.5, 0.5,
-4.3503, -3.800463, 2, 1, 1.5, 0.5, 0.5,
-4.3503, -3.800463, 2, 0, 1.5, 0.5, 0.5,
-4.3503, -3.800463, 4, 0, -0.5, 0.5, 0.5,
-4.3503, -3.800463, 4, 1, -0.5, 0.5, 0.5,
-4.3503, -3.800463, 4, 1, 1.5, 0.5, 0.5,
-4.3503, -3.800463, 4, 0, 1.5, 0.5, 0.5
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
-3.832625, -3.317955, -5.312355,
-3.832625, 3.115497, -5.312355,
-3.832625, -3.317955, 5.597841,
-3.832625, 3.115497, 5.597841,
-3.832625, -3.317955, -5.312355,
-3.832625, -3.317955, 5.597841,
-3.832625, 3.115497, -5.312355,
-3.832625, 3.115497, 5.597841,
-3.832625, -3.317955, -5.312355,
3.069719, -3.317955, -5.312355,
-3.832625, -3.317955, 5.597841,
3.069719, -3.317955, 5.597841,
-3.832625, 3.115497, -5.312355,
3.069719, 3.115497, -5.312355,
-3.832625, 3.115497, 5.597841,
3.069719, 3.115497, 5.597841,
3.069719, -3.317955, -5.312355,
3.069719, 3.115497, -5.312355,
3.069719, -3.317955, 5.597841,
3.069719, 3.115497, 5.597841,
3.069719, -3.317955, -5.312355,
3.069719, -3.317955, 5.597841,
3.069719, 3.115497, -5.312355,
3.069719, 3.115497, 5.597841
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
var radius = 7.702363;
var distance = 34.26868;
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
mvMatrix.translate( 0.3814527, 0.1012288, -0.1427429 );
mvMatrix.scale( 1.206539, 1.294476, 0.7633177 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.26868);
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
oxo-1-propenyl_phosp<-read.table("oxo-1-propenyl_phosp.xyz", skip=1)
```

```
## Error in read.table("oxo-1-propenyl_phosp.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-oxo-1-propenyl_phosp$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
```

```r
y<-oxo-1-propenyl_phosp$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
```

```r
z<-oxo-1-propenyl_phosp$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
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
-3.732105, 0.0140769, -2.000925, 0, 0, 1, 1, 1,
-3.272024, -0.116588, -1.635182, 1, 0, 0, 1, 1,
-2.894027, -0.3652313, -2.061711, 1, 0, 0, 1, 1,
-2.738255, -0.2059848, -0.7381329, 1, 0, 0, 1, 1,
-2.629176, 1.517757, -1.083732, 1, 0, 0, 1, 1,
-2.515783, 0.8716704, -3.040269, 1, 0, 0, 1, 1,
-2.514555, 0.9210046, -1.492491, 0, 0, 0, 1, 1,
-2.483352, -0.6879857, -2.806636, 0, 0, 0, 1, 1,
-2.431358, 1.702668, -0.4018524, 0, 0, 0, 1, 1,
-2.418147, -0.280873, 0.1193972, 0, 0, 0, 1, 1,
-2.389354, -0.5905434, -2.383735, 0, 0, 0, 1, 1,
-2.351898, -1.158986, -1.883954, 0, 0, 0, 1, 1,
-2.291698, 0.6745386, -1.293368, 0, 0, 0, 1, 1,
-2.193917, 0.1195602, -1.191204, 1, 1, 1, 1, 1,
-2.190526, 1.235624, -0.9434169, 1, 1, 1, 1, 1,
-2.165021, -0.2503253, -1.825016, 1, 1, 1, 1, 1,
-2.155946, -0.6222821, -3.549211, 1, 1, 1, 1, 1,
-2.048511, -0.01754653, -2.444897, 1, 1, 1, 1, 1,
-2.038275, 1.568187, -0.3626309, 1, 1, 1, 1, 1,
-2.021338, -0.4196442, -0.8848255, 1, 1, 1, 1, 1,
-2.0183, 1.23788, -2.97505, 1, 1, 1, 1, 1,
-2.018148, 1.645768, -1.045675, 1, 1, 1, 1, 1,
-1.997428, -0.2730265, -2.585046, 1, 1, 1, 1, 1,
-1.976452, 0.03723698, -1.194681, 1, 1, 1, 1, 1,
-1.966263, -0.7257028, -2.041744, 1, 1, 1, 1, 1,
-1.942858, 1.002599, 0.2604304, 1, 1, 1, 1, 1,
-1.935033, -2.234105, -3.514899, 1, 1, 1, 1, 1,
-1.922477, 2.13801, -1.468578, 1, 1, 1, 1, 1,
-1.9114, -1.041923, -1.817118, 0, 0, 1, 1, 1,
-1.889264, -0.338511, -2.300624, 1, 0, 0, 1, 1,
-1.867065, 0.9135148, -1.360147, 1, 0, 0, 1, 1,
-1.82612, -1.264579, -2.946824, 1, 0, 0, 1, 1,
-1.817458, -0.2253802, -2.049279, 1, 0, 0, 1, 1,
-1.815558, -0.1010427, -1.860038, 1, 0, 0, 1, 1,
-1.813494, -0.5312721, -0.4094014, 0, 0, 0, 1, 1,
-1.805329, -2.029448, -0.9519688, 0, 0, 0, 1, 1,
-1.781734, -0.1651118, -1.691804, 0, 0, 0, 1, 1,
-1.771002, 1.317292, -0.9168581, 0, 0, 0, 1, 1,
-1.765809, -1.959601, -2.726911, 0, 0, 0, 1, 1,
-1.762923, 0.5177782, -1.1299, 0, 0, 0, 1, 1,
-1.756059, 0.4553778, -1.521707, 0, 0, 0, 1, 1,
-1.752437, 0.3678226, -2.074533, 1, 1, 1, 1, 1,
-1.750148, 0.1787897, -2.359139, 1, 1, 1, 1, 1,
-1.74295, -0.257818, -1.312841, 1, 1, 1, 1, 1,
-1.713699, 0.2949223, -1.561251, 1, 1, 1, 1, 1,
-1.695239, -0.5996992, -2.748641, 1, 1, 1, 1, 1,
-1.690128, -0.1559314, -1.587621, 1, 1, 1, 1, 1,
-1.620898, -0.8094729, -1.992802, 1, 1, 1, 1, 1,
-1.603396, -0.2148214, -1.172595, 1, 1, 1, 1, 1,
-1.585584, 0.4140447, -0.10835, 1, 1, 1, 1, 1,
-1.58038, -0.3647752, -1.435865, 1, 1, 1, 1, 1,
-1.577316, 1.43499, -2.26688, 1, 1, 1, 1, 1,
-1.576651, -1.31223, -2.120106, 1, 1, 1, 1, 1,
-1.56792, 0.3902618, -3.537653, 1, 1, 1, 1, 1,
-1.566303, -0.2234005, -1.981729, 1, 1, 1, 1, 1,
-1.563254, -0.114126, -2.363156, 1, 1, 1, 1, 1,
-1.553977, -0.5229647, -1.748937, 0, 0, 1, 1, 1,
-1.537224, 0.2205456, -0.2679475, 1, 0, 0, 1, 1,
-1.536813, 0.3901663, -2.356481, 1, 0, 0, 1, 1,
-1.535844, 0.487204, -1.862514, 1, 0, 0, 1, 1,
-1.534889, -0.4857472, -1.147237, 1, 0, 0, 1, 1,
-1.524517, 0.1757932, -1.301949, 1, 0, 0, 1, 1,
-1.479555, 1.463634, 0.1047477, 0, 0, 0, 1, 1,
-1.465943, 0.7931902, -1.171315, 0, 0, 0, 1, 1,
-1.464298, 0.03165456, -1.217081, 0, 0, 0, 1, 1,
-1.460148, -0.6068218, -1.299379, 0, 0, 0, 1, 1,
-1.446032, 0.5994005, -0.3497437, 0, 0, 0, 1, 1,
-1.423736, 0.9197733, -0.4884741, 0, 0, 0, 1, 1,
-1.419599, 0.2792531, 0.07966965, 0, 0, 0, 1, 1,
-1.419224, 1.751621, -0.5320881, 1, 1, 1, 1, 1,
-1.401727, -1.386863, -1.091671, 1, 1, 1, 1, 1,
-1.390666, 0.2906378, 0.04900898, 1, 1, 1, 1, 1,
-1.377232, -0.9471972, -0.6640276, 1, 1, 1, 1, 1,
-1.376015, 0.112893, -0.7463129, 1, 1, 1, 1, 1,
-1.371941, -0.3336049, -1.806806, 1, 1, 1, 1, 1,
-1.370386, 1.65311, -0.7960356, 1, 1, 1, 1, 1,
-1.346507, -1.045231, -2.451646, 1, 1, 1, 1, 1,
-1.339436, 1.513893, -1.046567, 1, 1, 1, 1, 1,
-1.335293, 1.24217, 0.2018973, 1, 1, 1, 1, 1,
-1.331795, 1.022809, -1.051674, 1, 1, 1, 1, 1,
-1.331576, 1.343662, -0.5832844, 1, 1, 1, 1, 1,
-1.319208, 2.642254, -0.7006175, 1, 1, 1, 1, 1,
-1.315568, -0.8439701, -3.465289, 1, 1, 1, 1, 1,
-1.290093, 1.228545, -1.100327, 1, 1, 1, 1, 1,
-1.281892, -1.640331, -1.877306, 0, 0, 1, 1, 1,
-1.273512, -1.462751, -1.813998, 1, 0, 0, 1, 1,
-1.273195, 1.784546, 1.646716, 1, 0, 0, 1, 1,
-1.265463, 1.021829, 0.6275726, 1, 0, 0, 1, 1,
-1.259776, -0.9169543, -1.90041, 1, 0, 0, 1, 1,
-1.256428, -1.070289, -1.674206, 1, 0, 0, 1, 1,
-1.24654, 0.4306641, 1.198311, 0, 0, 0, 1, 1,
-1.242704, -1.504978, -4.595966, 0, 0, 0, 1, 1,
-1.23276, 0.8147799, -0.06614568, 0, 0, 0, 1, 1,
-1.232648, 0.7482469, -1.444932, 0, 0, 0, 1, 1,
-1.222769, 0.784974, -1.526843, 0, 0, 0, 1, 1,
-1.21536, 0.09543138, -1.736078, 0, 0, 0, 1, 1,
-1.207201, -0.182604, -3.759023, 0, 0, 0, 1, 1,
-1.206583, -1.79545, -0.204285, 1, 1, 1, 1, 1,
-1.20458, -0.7292408, -1.138455, 1, 1, 1, 1, 1,
-1.20236, -1.251819, -2.16957, 1, 1, 1, 1, 1,
-1.193177, 0.7497335, -1.508084, 1, 1, 1, 1, 1,
-1.192687, -1.947973, -0.7728602, 1, 1, 1, 1, 1,
-1.188326, 0.7401371, 0.2472128, 1, 1, 1, 1, 1,
-1.184868, 0.4091607, 0.2026964, 1, 1, 1, 1, 1,
-1.162363, 1.454086, 1.458657, 1, 1, 1, 1, 1,
-1.159606, 0.4894125, -1.682483, 1, 1, 1, 1, 1,
-1.159531, -0.4011676, -1.92909, 1, 1, 1, 1, 1,
-1.158388, 0.7881034, 0.6883303, 1, 1, 1, 1, 1,
-1.151521, -1.86104, -1.419262, 1, 1, 1, 1, 1,
-1.142437, -0.01408298, -3.118873, 1, 1, 1, 1, 1,
-1.133767, -0.05015187, -1.427481, 1, 1, 1, 1, 1,
-1.127572, -0.1351169, -1.625215, 1, 1, 1, 1, 1,
-1.119539, -0.1071284, -2.648262, 0, 0, 1, 1, 1,
-1.119026, 0.5392392, -2.285352, 1, 0, 0, 1, 1,
-1.114839, -0.5396165, -2.812613, 1, 0, 0, 1, 1,
-1.099566, 0.736173, -0.6958358, 1, 0, 0, 1, 1,
-1.095309, 1.729974, -1.013941, 1, 0, 0, 1, 1,
-1.094972, -0.4478265, -1.270884, 1, 0, 0, 1, 1,
-1.078165, -0.4481477, -3.43988, 0, 0, 0, 1, 1,
-1.07085, -1.602351, -1.48298, 0, 0, 0, 1, 1,
-1.070634, 0.3755772, -0.09821361, 0, 0, 0, 1, 1,
-1.067643, 0.1454891, -1.330468, 0, 0, 0, 1, 1,
-1.058321, -1.094255, -1.560144, 0, 0, 0, 1, 1,
-1.056716, -0.1483857, -0.550137, 0, 0, 0, 1, 1,
-1.05314, 0.5270724, -3.014137, 0, 0, 0, 1, 1,
-1.050901, -0.782669, -3.422518, 1, 1, 1, 1, 1,
-1.048273, 0.3855231, -1.927888, 1, 1, 1, 1, 1,
-1.04776, 0.01569973, -2.642881, 1, 1, 1, 1, 1,
-1.046191, 1.683188, -0.8990084, 1, 1, 1, 1, 1,
-1.041091, -0.1054589, -4.063718, 1, 1, 1, 1, 1,
-1.024147, 0.09491691, -2.478322, 1, 1, 1, 1, 1,
-1.012441, -0.1110153, -1.399587, 1, 1, 1, 1, 1,
-1.00197, 0.04700798, -1.789598, 1, 1, 1, 1, 1,
-0.999544, -0.4515782, -2.732859, 1, 1, 1, 1, 1,
-0.9980034, 1.592656, -1.196095, 1, 1, 1, 1, 1,
-0.996034, 0.3045813, -1.993054, 1, 1, 1, 1, 1,
-0.9913965, -1.82244, -5.153469, 1, 1, 1, 1, 1,
-0.9867857, 2.649107, -0.7779863, 1, 1, 1, 1, 1,
-0.9860013, 1.404596, -2.030293, 1, 1, 1, 1, 1,
-0.9859147, -0.9162063, -2.812978, 1, 1, 1, 1, 1,
-0.9744612, 1.281298, 0.6865101, 0, 0, 1, 1, 1,
-0.9736987, -1.269102, -0.8895873, 1, 0, 0, 1, 1,
-0.9707531, -0.4689462, -2.823533, 1, 0, 0, 1, 1,
-0.9631003, 1.202256, -0.4111128, 1, 0, 0, 1, 1,
-0.9607175, -0.09305271, -1.535688, 1, 0, 0, 1, 1,
-0.9603075, -1.630435, -2.502302, 1, 0, 0, 1, 1,
-0.9542123, 0.1675279, -2.438402, 0, 0, 0, 1, 1,
-0.9534544, 1.511306, -1.267289, 0, 0, 0, 1, 1,
-0.9506885, 0.3475518, -2.681359, 0, 0, 0, 1, 1,
-0.9479108, -1.480834, -4.18719, 0, 0, 0, 1, 1,
-0.945074, -1.111984, -2.260009, 0, 0, 0, 1, 1,
-0.9439058, -0.1272589, 0.3276709, 0, 0, 0, 1, 1,
-0.9375182, -1.371443, -3.7282, 0, 0, 0, 1, 1,
-0.9294717, -1.103896, -2.125605, 1, 1, 1, 1, 1,
-0.9294238, 0.6062725, -2.430142, 1, 1, 1, 1, 1,
-0.9293898, -1.314287, -2.123563, 1, 1, 1, 1, 1,
-0.9208247, -2.859867, -1.993478, 1, 1, 1, 1, 1,
-0.9176999, -0.5150676, -2.561573, 1, 1, 1, 1, 1,
-0.9175729, -0.4194616, 0.476115, 1, 1, 1, 1, 1,
-0.9132286, 0.4914766, 0.2368461, 1, 1, 1, 1, 1,
-0.9099649, 0.1926378, -0.8048567, 1, 1, 1, 1, 1,
-0.909542, -0.7415729, 0.1551177, 1, 1, 1, 1, 1,
-0.9089357, 1.59141, -0.3679426, 1, 1, 1, 1, 1,
-0.9083194, 0.343018, -1.989343, 1, 1, 1, 1, 1,
-0.9070699, -0.6084448, -2.999392, 1, 1, 1, 1, 1,
-0.9013042, 0.07524332, -0.4676455, 1, 1, 1, 1, 1,
-0.898312, 0.3781884, -1.531289, 1, 1, 1, 1, 1,
-0.8962233, -0.9811879, -2.993336, 1, 1, 1, 1, 1,
-0.8960792, -1.999369, -2.411623, 0, 0, 1, 1, 1,
-0.8951946, -1.363316, -2.227149, 1, 0, 0, 1, 1,
-0.89386, 0.7707989, 0.1318223, 1, 0, 0, 1, 1,
-0.8851173, 0.5915871, -2.175448, 1, 0, 0, 1, 1,
-0.8850524, 0.5961151, -1.027951, 1, 0, 0, 1, 1,
-0.8839524, -1.375296, -2.178885, 1, 0, 0, 1, 1,
-0.8835874, 0.6573924, -1.50487, 0, 0, 0, 1, 1,
-0.8825246, -0.1763471, -1.238064, 0, 0, 0, 1, 1,
-0.8792592, 1.391186, 1.315799, 0, 0, 0, 1, 1,
-0.8769194, 1.764823, 0.002837559, 0, 0, 0, 1, 1,
-0.8764579, -0.9020755, -1.366046, 0, 0, 0, 1, 1,
-0.8719647, 1.411801, 0.04440467, 0, 0, 0, 1, 1,
-0.8703427, 0.6227353, 0.681764, 0, 0, 0, 1, 1,
-0.8696817, -0.0323573, -2.733601, 1, 1, 1, 1, 1,
-0.8666349, -0.4634679, -3.222953, 1, 1, 1, 1, 1,
-0.856129, -0.4559559, -2.363979, 1, 1, 1, 1, 1,
-0.8560325, 1.587618, -0.263956, 1, 1, 1, 1, 1,
-0.8516331, -1.227304, -2.558085, 1, 1, 1, 1, 1,
-0.850934, 0.2646576, -1.698122, 1, 1, 1, 1, 1,
-0.8486979, -0.3215905, -0.9586319, 1, 1, 1, 1, 1,
-0.8474493, 0.6812606, -1.046062, 1, 1, 1, 1, 1,
-0.8452657, 2.105983, 0.7124467, 1, 1, 1, 1, 1,
-0.842408, -0.2584544, -0.5724608, 1, 1, 1, 1, 1,
-0.8395864, 1.370507, 0.5965537, 1, 1, 1, 1, 1,
-0.839366, 1.15298, 1.137721, 1, 1, 1, 1, 1,
-0.8317806, -1.381428, -3.865462, 1, 1, 1, 1, 1,
-0.8292109, 0.9922006, -0.9748857, 1, 1, 1, 1, 1,
-0.829121, 0.4427249, -1.462373, 1, 1, 1, 1, 1,
-0.8230213, 1.703357, 1.686688, 0, 0, 1, 1, 1,
-0.8225958, 0.3103018, -0.8919921, 1, 0, 0, 1, 1,
-0.8154386, -1.475156, -4.853189, 1, 0, 0, 1, 1,
-0.8123994, -0.2943104, -2.51777, 1, 0, 0, 1, 1,
-0.8118261, -0.5217068, -2.523857, 1, 0, 0, 1, 1,
-0.8113878, -0.08504837, -2.576428, 1, 0, 0, 1, 1,
-0.8075056, -1.511406, -4.413306, 0, 0, 0, 1, 1,
-0.806242, -1.959756, -2.824871, 0, 0, 0, 1, 1,
-0.8019109, -0.07437937, -1.033473, 0, 0, 0, 1, 1,
-0.7994341, 0.03809447, -1.511163, 0, 0, 0, 1, 1,
-0.797581, -1.064142, -3.301003, 0, 0, 0, 1, 1,
-0.7975123, 0.5854505, -0.5413902, 0, 0, 0, 1, 1,
-0.7953606, 0.6161192, -2.535141, 0, 0, 0, 1, 1,
-0.784297, 1.481556, -1.339933, 1, 1, 1, 1, 1,
-0.7838601, 0.8100188, -1.100547, 1, 1, 1, 1, 1,
-0.7817409, 0.5123598, -0.6902388, 1, 1, 1, 1, 1,
-0.7745144, 0.5740763, -2.663946, 1, 1, 1, 1, 1,
-0.7722964, 0.9539419, -0.5079853, 1, 1, 1, 1, 1,
-0.7720843, -1.081526, -2.955574, 1, 1, 1, 1, 1,
-0.7681053, -0.01977954, -1.490589, 1, 1, 1, 1, 1,
-0.7643024, 0.6194361, -0.5226292, 1, 1, 1, 1, 1,
-0.7567868, -1.947561, -2.40842, 1, 1, 1, 1, 1,
-0.7461172, 1.267295, -0.08996394, 1, 1, 1, 1, 1,
-0.7437627, 0.5104024, -0.5180603, 1, 1, 1, 1, 1,
-0.7385585, -0.8625184, -3.611509, 1, 1, 1, 1, 1,
-0.7361508, 0.6590063, -1.316761, 1, 1, 1, 1, 1,
-0.7351817, -1.195969, -2.613111, 1, 1, 1, 1, 1,
-0.7349599, -0.529904, -3.501536, 1, 1, 1, 1, 1,
-0.7311115, -1.888719, -2.421858, 0, 0, 1, 1, 1,
-0.7287797, -0.455191, -2.116531, 1, 0, 0, 1, 1,
-0.7286144, -0.6998049, -1.570105, 1, 0, 0, 1, 1,
-0.7275351, -2.203768, -3.755294, 1, 0, 0, 1, 1,
-0.7263017, 0.8984896, -2.35112, 1, 0, 0, 1, 1,
-0.7260486, -1.30405, -3.437758, 1, 0, 0, 1, 1,
-0.7231624, 0.03891212, -1.521659, 0, 0, 0, 1, 1,
-0.7142026, -1.747985, -1.038278, 0, 0, 0, 1, 1,
-0.7054421, 0.9057832, -0.08955053, 0, 0, 0, 1, 1,
-0.699187, -0.2115662, -1.182534, 0, 0, 0, 1, 1,
-0.6938279, -0.37841, -3.11078, 0, 0, 0, 1, 1,
-0.6934088, -1.794949, -3.250513, 0, 0, 0, 1, 1,
-0.6827201, 1.141709, -2.063025, 0, 0, 0, 1, 1,
-0.6799801, -0.7360078, -2.414367, 1, 1, 1, 1, 1,
-0.679841, 0.9996634, -0.6985561, 1, 1, 1, 1, 1,
-0.6788948, 1.018599, -0.6653193, 1, 1, 1, 1, 1,
-0.6786421, -1.307393, -1.470829, 1, 1, 1, 1, 1,
-0.6695302, 0.3707862, -0.2735045, 1, 1, 1, 1, 1,
-0.6694162, -1.049325, -2.439114, 1, 1, 1, 1, 1,
-0.6621673, 0.1204516, -0.9046668, 1, 1, 1, 1, 1,
-0.6601231, 0.3453836, -1.082812, 1, 1, 1, 1, 1,
-0.6581516, -0.8609619, -2.641473, 1, 1, 1, 1, 1,
-0.6540043, -0.1167316, -1.324722, 1, 1, 1, 1, 1,
-0.6524398, -1.506596, -2.610163, 1, 1, 1, 1, 1,
-0.6435357, -0.6972104, -2.505161, 1, 1, 1, 1, 1,
-0.6412831, 0.4177916, 0.502063, 1, 1, 1, 1, 1,
-0.6379672, 0.9902514, -0.2242935, 1, 1, 1, 1, 1,
-0.6379608, 0.09828271, 0.1962159, 1, 1, 1, 1, 1,
-0.6375841, -1.269894, -2.83642, 0, 0, 1, 1, 1,
-0.6358591, 2.033334, 2.422176, 1, 0, 0, 1, 1,
-0.6354808, -0.7880158, -2.450624, 1, 0, 0, 1, 1,
-0.6334144, 0.4710166, 0.6521419, 1, 0, 0, 1, 1,
-0.6324664, -0.02828617, -2.242796, 1, 0, 0, 1, 1,
-0.6303169, 0.7403316, 0.1931064, 1, 0, 0, 1, 1,
-0.627401, -0.2373566, -2.198338, 0, 0, 0, 1, 1,
-0.6241506, -0.3443009, 0.3847269, 0, 0, 0, 1, 1,
-0.6234636, 0.005325015, -1.465321, 0, 0, 0, 1, 1,
-0.6189286, -1.545768, -0.6037301, 0, 0, 0, 1, 1,
-0.6186458, -0.2546195, -2.966648, 0, 0, 0, 1, 1,
-0.6181756, 0.4068437, 0.4499977, 0, 0, 0, 1, 1,
-0.6111796, -0.4201195, -2.150727, 0, 0, 0, 1, 1,
-0.6068208, 0.6964588, -1.917308, 1, 1, 1, 1, 1,
-0.604435, 0.859175, -2.136159, 1, 1, 1, 1, 1,
-0.6030998, -0.3964816, -1.099993, 1, 1, 1, 1, 1,
-0.5978363, 0.3221444, -0.1082554, 1, 1, 1, 1, 1,
-0.5962708, 0.199032, -0.7265769, 1, 1, 1, 1, 1,
-0.5951006, -0.5827891, -0.9108009, 1, 1, 1, 1, 1,
-0.5904714, 1.359858, 1.742827, 1, 1, 1, 1, 1,
-0.5861507, 0.3781281, -1.119764, 1, 1, 1, 1, 1,
-0.5856958, -0.6259225, -0.5333406, 1, 1, 1, 1, 1,
-0.5853893, 0.8599516, -0.9164788, 1, 1, 1, 1, 1,
-0.5835882, -0.3451639, -1.855093, 1, 1, 1, 1, 1,
-0.5821933, 0.7758621, 0.08133145, 1, 1, 1, 1, 1,
-0.5795655, 1.04332, -2.049583, 1, 1, 1, 1, 1,
-0.5764923, -0.1779183, -2.55305, 1, 1, 1, 1, 1,
-0.572271, -0.3425794, -1.110597, 1, 1, 1, 1, 1,
-0.5698375, -0.8890839, -2.356852, 0, 0, 1, 1, 1,
-0.5691244, -0.7807122, -2.227897, 1, 0, 0, 1, 1,
-0.5682232, -0.7886966, -1.278516, 1, 0, 0, 1, 1,
-0.5680337, 1.228584, -0.591774, 1, 0, 0, 1, 1,
-0.5665945, -0.7669004, -2.519878, 1, 0, 0, 1, 1,
-0.5633379, 2.467223, 1.33231, 1, 0, 0, 1, 1,
-0.5596749, -0.2501494, -2.034782, 0, 0, 0, 1, 1,
-0.5596501, -0.8993864, -2.850719, 0, 0, 0, 1, 1,
-0.5581678, 0.4697607, -0.3709727, 0, 0, 0, 1, 1,
-0.5566307, 1.87596, -0.3973785, 0, 0, 0, 1, 1,
-0.5556694, -1.105831, -2.923755, 0, 0, 0, 1, 1,
-0.5555606, 0.03050133, -3.199212, 0, 0, 0, 1, 1,
-0.5553845, -0.2321658, -1.524746, 0, 0, 0, 1, 1,
-0.5533701, -0.4243805, -1.993141, 1, 1, 1, 1, 1,
-0.5528744, -1.772771, -1.617894, 1, 1, 1, 1, 1,
-0.5486112, -0.6874335, -0.7518799, 1, 1, 1, 1, 1,
-0.5480403, 0.4696338, -0.3662904, 1, 1, 1, 1, 1,
-0.5451611, 1.896489, 0.802399, 1, 1, 1, 1, 1,
-0.5427178, -0.2223512, -0.3778212, 1, 1, 1, 1, 1,
-0.5387061, -7.584933e-05, -0.9146868, 1, 1, 1, 1, 1,
-0.5350224, -0.2487534, -1.633084, 1, 1, 1, 1, 1,
-0.5251224, -0.2546676, -1.773662, 1, 1, 1, 1, 1,
-0.5240905, 0.05527472, -1.383941, 1, 1, 1, 1, 1,
-0.5238768, -0.4284138, -0.5955249, 1, 1, 1, 1, 1,
-0.5189304, 0.07243749, -1.831044, 1, 1, 1, 1, 1,
-0.5161095, -0.03545234, 0.0235412, 1, 1, 1, 1, 1,
-0.5157906, 0.8147165, 0.610019, 1, 1, 1, 1, 1,
-0.5022752, 1.761561, -0.701492, 1, 1, 1, 1, 1,
-0.5017177, -0.5318395, -2.709401, 0, 0, 1, 1, 1,
-0.4963684, 0.2853784, 0.9921615, 1, 0, 0, 1, 1,
-0.4956382, -1.972012, -2.266634, 1, 0, 0, 1, 1,
-0.4950382, 1.070511, 0.1188441, 1, 0, 0, 1, 1,
-0.4901294, -1.610613, -2.765973, 1, 0, 0, 1, 1,
-0.4886723, -0.9418864, -3.033474, 1, 0, 0, 1, 1,
-0.4616367, -0.064688, -2.712858, 0, 0, 0, 1, 1,
-0.4600693, -1.462046, -1.442038, 0, 0, 0, 1, 1,
-0.4585224, -0.5388265, -1.698823, 0, 0, 0, 1, 1,
-0.4574125, 1.493735, 0.1985617, 0, 0, 0, 1, 1,
-0.455646, -0.9399358, -3.087781, 0, 0, 0, 1, 1,
-0.4551224, -0.3829026, -1.691033, 0, 0, 0, 1, 1,
-0.4530489, 1.392416, -2.502668, 0, 0, 0, 1, 1,
-0.451673, -0.6508872, -3.443114, 1, 1, 1, 1, 1,
-0.4476208, -0.08829638, -0.1618018, 1, 1, 1, 1, 1,
-0.441743, -0.6005512, -2.0674, 1, 1, 1, 1, 1,
-0.4360504, -1.86058, -4.944989, 1, 1, 1, 1, 1,
-0.4339673, 0.7833779, -1.461122, 1, 1, 1, 1, 1,
-0.4315135, -0.4650904, -1.817722, 1, 1, 1, 1, 1,
-0.427251, 0.2876338, 0.2680703, 1, 1, 1, 1, 1,
-0.4252639, 1.360378, 0.314373, 1, 1, 1, 1, 1,
-0.424219, 1.347293, -0.7444035, 1, 1, 1, 1, 1,
-0.4228331, -0.1724745, -0.7789094, 1, 1, 1, 1, 1,
-0.4223877, 0.6357983, 0.06493326, 1, 1, 1, 1, 1,
-0.4216175, -0.3274354, -3.583038, 1, 1, 1, 1, 1,
-0.4167349, -0.6417152, -1.571361, 1, 1, 1, 1, 1,
-0.411079, -1.512249, -3.483517, 1, 1, 1, 1, 1,
-0.4099421, 0.3393541, -2.25442, 1, 1, 1, 1, 1,
-0.4097548, -0.2809948, -0.8592284, 0, 0, 1, 1, 1,
-0.40137, -0.778254, -3.481778, 1, 0, 0, 1, 1,
-0.39855, -0.6435985, -2.505242, 1, 0, 0, 1, 1,
-0.3949259, -0.1933264, -1.502577, 1, 0, 0, 1, 1,
-0.3887371, 0.4564234, -0.02153931, 1, 0, 0, 1, 1,
-0.3787206, -1.338303, -2.874789, 1, 0, 0, 1, 1,
-0.3767241, -0.9739794, -1.499765, 0, 0, 0, 1, 1,
-0.3753028, -0.5326733, -2.624895, 0, 0, 0, 1, 1,
-0.3750191, 1.644724, -0.1139807, 0, 0, 0, 1, 1,
-0.374292, -1.453714, -4.119322, 0, 0, 0, 1, 1,
-0.3672037, -0.2748145, -1.298905, 0, 0, 0, 1, 1,
-0.3662099, -1.995915, -2.939904, 0, 0, 0, 1, 1,
-0.3658645, -0.5629541, -1.786013, 0, 0, 0, 1, 1,
-0.3648382, 1.116561, 0.689435, 1, 1, 1, 1, 1,
-0.3614601, 0.1643389, 0.4899977, 1, 1, 1, 1, 1,
-0.3506808, -0.034337, -1.793391, 1, 1, 1, 1, 1,
-0.3490706, -1.571368, -4.075335, 1, 1, 1, 1, 1,
-0.3408483, 0.6676238, -1.719996, 1, 1, 1, 1, 1,
-0.3375446, 1.404337, -1.279516, 1, 1, 1, 1, 1,
-0.3331019, -0.3352476, -1.300138, 1, 1, 1, 1, 1,
-0.3293907, 0.9697732, -0.3967443, 1, 1, 1, 1, 1,
-0.3274282, 0.5407243, -0.8616614, 1, 1, 1, 1, 1,
-0.323143, 0.915407, 1.50458, 1, 1, 1, 1, 1,
-0.3221666, 1.99568, -2.006848, 1, 1, 1, 1, 1,
-0.3220113, 0.6194304, 0.8258097, 1, 1, 1, 1, 1,
-0.31691, 0.1972236, -0.7952163, 1, 1, 1, 1, 1,
-0.3140895, 0.1931856, -1.909117, 1, 1, 1, 1, 1,
-0.313732, 0.2867249, -1.673835, 1, 1, 1, 1, 1,
-0.3108644, 0.941732, -0.4512684, 0, 0, 1, 1, 1,
-0.3100255, -1.292917, -1.174992, 1, 0, 0, 1, 1,
-0.3057869, 1.30038, -1.513072, 1, 0, 0, 1, 1,
-0.3044342, 3.021806, 0.4064607, 1, 0, 0, 1, 1,
-0.3028072, 0.6170782, -0.8799886, 1, 0, 0, 1, 1,
-0.300786, 0.7309679, -0.09052587, 1, 0, 0, 1, 1,
-0.3004452, 0.4737034, 0.5277659, 0, 0, 0, 1, 1,
-0.2965893, -1.094222, -2.049151, 0, 0, 0, 1, 1,
-0.2887651, 0.5469431, -0.2104622, 0, 0, 0, 1, 1,
-0.2887593, 0.3379249, -1.510283, 0, 0, 0, 1, 1,
-0.2881373, 1.883596, 0.4769183, 0, 0, 0, 1, 1,
-0.2881133, -0.09578096, -2.471759, 0, 0, 0, 1, 1,
-0.280419, -0.4553809, -3.56761, 0, 0, 0, 1, 1,
-0.2802016, -0.006408136, -3.427465, 1, 1, 1, 1, 1,
-0.2769868, -1.265236, -2.611283, 1, 1, 1, 1, 1,
-0.2763148, 0.8889102, -1.731899, 1, 1, 1, 1, 1,
-0.2727326, -1.170547, -4.619772, 1, 1, 1, 1, 1,
-0.2712695, 1.7453, 2.313675, 1, 1, 1, 1, 1,
-0.2711599, 1.661351, -0.3826092, 1, 1, 1, 1, 1,
-0.2687547, 1.749971, -0.8084245, 1, 1, 1, 1, 1,
-0.2660438, 0.8000365, -1.116726, 1, 1, 1, 1, 1,
-0.2611477, 0.4668425, -1.936417, 1, 1, 1, 1, 1,
-0.2548494, -0.1527387, -2.245369, 1, 1, 1, 1, 1,
-0.2541912, -0.5013199, -2.408732, 1, 1, 1, 1, 1,
-0.2529276, -1.550132, -4.43238, 1, 1, 1, 1, 1,
-0.2520353, 0.2084851, -0.4804228, 1, 1, 1, 1, 1,
-0.251218, -0.02536092, -2.478277, 1, 1, 1, 1, 1,
-0.2504951, 1.277849, -0.6417452, 1, 1, 1, 1, 1,
-0.2478765, 0.9636882, 1.308154, 0, 0, 1, 1, 1,
-0.2465918, 1.174024, 0.03878983, 1, 0, 0, 1, 1,
-0.242757, -0.4293577, -0.575063, 1, 0, 0, 1, 1,
-0.2416454, -0.6563541, -4.265346, 1, 0, 0, 1, 1,
-0.2386107, 0.5926653, -0.9771674, 1, 0, 0, 1, 1,
-0.2363777, -0.8280685, -1.485656, 1, 0, 0, 1, 1,
-0.2360971, 0.2374651, -0.4169273, 0, 0, 0, 1, 1,
-0.2346314, 0.5999213, -0.8457188, 0, 0, 0, 1, 1,
-0.2302785, -0.454457, -2.719042, 0, 0, 0, 1, 1,
-0.2275668, -0.2827364, -3.842134, 0, 0, 0, 1, 1,
-0.226949, -0.09917308, -1.274611, 0, 0, 0, 1, 1,
-0.2264442, -1.020079, -2.133384, 0, 0, 0, 1, 1,
-0.2195627, -0.1127976, -2.761808, 0, 0, 0, 1, 1,
-0.2175769, 0.1471047, -2.037168, 1, 1, 1, 1, 1,
-0.2168421, -0.8514456, -1.767182, 1, 1, 1, 1, 1,
-0.211134, -1.73561, -3.320518, 1, 1, 1, 1, 1,
-0.2096345, 0.3623864, -0.9013949, 1, 1, 1, 1, 1,
-0.2086065, -0.1823039, -0.4931147, 1, 1, 1, 1, 1,
-0.2053806, -0.02057943, -0.2963302, 1, 1, 1, 1, 1,
-0.2021179, 1.357502, 1.439152, 1, 1, 1, 1, 1,
-0.2016008, -1.248447, -2.422068, 1, 1, 1, 1, 1,
-0.2013376, 0.9092898, -1.266947, 1, 1, 1, 1, 1,
-0.1998341, 1.081156, -0.7187242, 1, 1, 1, 1, 1,
-0.199482, -0.3670656, -2.581002, 1, 1, 1, 1, 1,
-0.1991888, 0.7127122, 0.6761875, 1, 1, 1, 1, 1,
-0.1940585, 0.8908913, -0.6612378, 1, 1, 1, 1, 1,
-0.1916179, -2.246877, -3.720088, 1, 1, 1, 1, 1,
-0.1913981, -0.4198522, -0.66354, 1, 1, 1, 1, 1,
-0.1878289, 0.3806563, -0.1426249, 0, 0, 1, 1, 1,
-0.1856895, 1.032046, -1.484561, 1, 0, 0, 1, 1,
-0.1830852, -0.5050935, -3.699593, 1, 0, 0, 1, 1,
-0.1827407, -2.145369, -2.362201, 1, 0, 0, 1, 1,
-0.1796961, -1.416005, -1.622299, 1, 0, 0, 1, 1,
-0.178196, -0.5867274, -3.380548, 1, 0, 0, 1, 1,
-0.1705893, 1.405873, -0.9242561, 0, 0, 0, 1, 1,
-0.1681269, -0.3897939, -2.805096, 0, 0, 0, 1, 1,
-0.1608675, 0.326648, 0.1407932, 0, 0, 0, 1, 1,
-0.1586423, -0.5630227, -3.098029, 0, 0, 0, 1, 1,
-0.1546546, 0.2853763, 0.9086096, 0, 0, 0, 1, 1,
-0.153317, -1.006172, -2.260971, 0, 0, 0, 1, 1,
-0.150197, 0.8506592, -0.3881664, 0, 0, 0, 1, 1,
-0.1501249, -0.7732558, -3.339053, 1, 1, 1, 1, 1,
-0.1497618, 0.8393239, 1.431858, 1, 1, 1, 1, 1,
-0.1483719, -0.8968557, -0.7785147, 1, 1, 1, 1, 1,
-0.1472998, 0.7886214, -1.216968, 1, 1, 1, 1, 1,
-0.1463861, 0.1485168, -0.2936352, 1, 1, 1, 1, 1,
-0.1462779, 1.544022, 0.7099542, 1, 1, 1, 1, 1,
-0.1432152, -0.5195361, -1.026488, 1, 1, 1, 1, 1,
-0.1371911, -0.400267, -1.606721, 1, 1, 1, 1, 1,
-0.1369839, 0.5972818, -1.677626, 1, 1, 1, 1, 1,
-0.1356917, -1.940473, -3.313561, 1, 1, 1, 1, 1,
-0.13499, 0.4905304, 1.139672, 1, 1, 1, 1, 1,
-0.1318905, 0.9700993, -2.354655, 1, 1, 1, 1, 1,
-0.1285466, -1.595024, -2.824693, 1, 1, 1, 1, 1,
-0.123277, -0.00853482, -0.3888677, 1, 1, 1, 1, 1,
-0.1221718, -0.5456336, -4.257132, 1, 1, 1, 1, 1,
-0.1195681, 0.2508915, -0.09927585, 0, 0, 1, 1, 1,
-0.1187909, -0.7278001, -1.253122, 1, 0, 0, 1, 1,
-0.1184141, 0.1309387, -0.2772979, 1, 0, 0, 1, 1,
-0.1179243, 0.833326, 2.010744, 1, 0, 0, 1, 1,
-0.1156987, 2.094155, -0.1230619, 1, 0, 0, 1, 1,
-0.1133437, 1.267769, -1.24328, 1, 0, 0, 1, 1,
-0.1129112, 0.2534117, -0.9862843, 0, 0, 0, 1, 1,
-0.1095582, -0.1591849, -3.468483, 0, 0, 0, 1, 1,
-0.1069557, 0.4650601, -1.823296, 0, 0, 0, 1, 1,
-0.1054493, 0.03407421, 0.2359555, 0, 0, 0, 1, 1,
-0.09803341, -0.6340532, -1.865253, 0, 0, 0, 1, 1,
-0.08337097, -1.031734, -2.348286, 0, 0, 0, 1, 1,
-0.0775523, -0.6690214, -2.455389, 0, 0, 0, 1, 1,
-0.07355231, 0.5306185, -1.209319, 1, 1, 1, 1, 1,
-0.07344184, 1.16405, 0.4675124, 1, 1, 1, 1, 1,
-0.06840961, 0.8759891, -0.1014181, 1, 1, 1, 1, 1,
-0.06720761, -0.1060387, -2.403498, 1, 1, 1, 1, 1,
-0.06347314, -1.072861, -1.262259, 1, 1, 1, 1, 1,
-0.06322975, -0.1143768, -2.496041, 1, 1, 1, 1, 1,
-0.06270026, 1.123476, 0.005642547, 1, 1, 1, 1, 1,
-0.0581684, 0.8756927, 0.3409165, 1, 1, 1, 1, 1,
-0.05428749, 2.131263, -0.4238504, 1, 1, 1, 1, 1,
-0.05224837, -0.9723979, -3.956141, 1, 1, 1, 1, 1,
-0.05201109, -0.4364794, -2.099281, 1, 1, 1, 1, 1,
-0.04506121, 1.662062, -0.01245413, 1, 1, 1, 1, 1,
-0.0411086, 0.8542069, 0.5984066, 1, 1, 1, 1, 1,
-0.0396005, -0.3341026, -3.721283, 1, 1, 1, 1, 1,
-0.03922012, -0.6038789, -3.282858, 1, 1, 1, 1, 1,
-0.03650465, -0.8759421, -3.537975, 0, 0, 1, 1, 1,
-0.03378085, -1.979858, -4.171447, 1, 0, 0, 1, 1,
-0.03217982, -1.322277, -1.33578, 1, 0, 0, 1, 1,
-0.03143767, -0.6872009, -1.526595, 1, 0, 0, 1, 1,
-0.02116297, 0.6750908, 0.6511188, 1, 0, 0, 1, 1,
-0.01258188, 0.6899039, 2.198585, 1, 0, 0, 1, 1,
-0.00979265, 0.6603377, 0.3475561, 0, 0, 0, 1, 1,
-0.001345855, 1.177184, 1.412907, 0, 0, 0, 1, 1,
-0.001241245, 0.4193984, 0.1706557, 0, 0, 0, 1, 1,
-0.0006370794, 0.1880378, 0.6701134, 0, 0, 0, 1, 1,
0.004666172, -0.8040668, 5.438954, 0, 0, 0, 1, 1,
0.005996599, 0.8558685, 0.1333824, 0, 0, 0, 1, 1,
0.008045573, -1.717822, 3.198234, 0, 0, 0, 1, 1,
0.0114643, -0.8085831, 1.030623, 1, 1, 1, 1, 1,
0.01227886, 0.5705175, -0.8841804, 1, 1, 1, 1, 1,
0.01363035, 0.5203612, -0.08458072, 1, 1, 1, 1, 1,
0.0230502, -0.7864833, 5.276891, 1, 1, 1, 1, 1,
0.03639065, -0.4068588, 3.740362, 1, 1, 1, 1, 1,
0.03641472, 0.6251791, -0.6000949, 1, 1, 1, 1, 1,
0.0370151, 0.4667031, 0.1462885, 1, 1, 1, 1, 1,
0.03753311, -0.1452663, 4.520052, 1, 1, 1, 1, 1,
0.04347248, -0.1980448, 3.166866, 1, 1, 1, 1, 1,
0.04452277, 0.1096787, -0.1659323, 1, 1, 1, 1, 1,
0.04743516, 0.05296945, -1.162672, 1, 1, 1, 1, 1,
0.05247975, 0.7591017, -0.130705, 1, 1, 1, 1, 1,
0.05275963, -0.3299353, 2.771879, 1, 1, 1, 1, 1,
0.05393047, -0.3749683, 1.01036, 1, 1, 1, 1, 1,
0.06064535, 2.00962, -1.005995, 1, 1, 1, 1, 1,
0.06246629, 0.2740721, 2.342453, 0, 0, 1, 1, 1,
0.06373827, -0.3189543, 3.254553, 1, 0, 0, 1, 1,
0.06406895, -0.592205, 3.229722, 1, 0, 0, 1, 1,
0.06935684, 0.7332836, 1.365744, 1, 0, 0, 1, 1,
0.06950084, -0.1901168, 3.261061, 1, 0, 0, 1, 1,
0.07165689, 1.052755, 1.349176, 1, 0, 0, 1, 1,
0.07581851, 1.681331, 0.7551941, 0, 0, 0, 1, 1,
0.07688259, -0.04357881, 1.541532, 0, 0, 0, 1, 1,
0.07781362, -0.9915664, 1.709994, 0, 0, 0, 1, 1,
0.08094431, 0.5717587, -0.9503822, 0, 0, 0, 1, 1,
0.08138497, 1.034888, -1.128941, 0, 0, 0, 1, 1,
0.08247617, -0.9495913, 2.421655, 0, 0, 0, 1, 1,
0.08563531, 1.30626, 1.457138, 0, 0, 0, 1, 1,
0.08658896, -1.813723, 4.132264, 1, 1, 1, 1, 1,
0.08820412, -0.1273481, 2.832335, 1, 1, 1, 1, 1,
0.0883002, 1.27501, -0.1488686, 1, 1, 1, 1, 1,
0.09537499, 0.4894952, -0.8827145, 1, 1, 1, 1, 1,
0.09992492, 1.657415, 0.3077805, 1, 1, 1, 1, 1,
0.1040548, -0.9748888, 3.561403, 1, 1, 1, 1, 1,
0.1040574, 0.4292209, 0.4710238, 1, 1, 1, 1, 1,
0.1062571, 0.07858612, 2.520019, 1, 1, 1, 1, 1,
0.1096192, 1.088194, -0.04078096, 1, 1, 1, 1, 1,
0.1111777, 0.6752701, 1.066718, 1, 1, 1, 1, 1,
0.1119355, 1.559895, -0.2182738, 1, 1, 1, 1, 1,
0.1122198, 0.3361587, 3.23578, 1, 1, 1, 1, 1,
0.1130174, 0.07007807, -0.3404729, 1, 1, 1, 1, 1,
0.116217, -3.224263, 3.101698, 1, 1, 1, 1, 1,
0.1167679, 1.218142, -1.30435, 1, 1, 1, 1, 1,
0.1209175, -1.682989, 2.574179, 0, 0, 1, 1, 1,
0.122053, -0.5611026, 2.766833, 1, 0, 0, 1, 1,
0.1225626, 0.3492627, -1.482145, 1, 0, 0, 1, 1,
0.1312186, 1.256426, 0.209992, 1, 0, 0, 1, 1,
0.1347014, -1.002318, 1.457563, 1, 0, 0, 1, 1,
0.1385836, 0.919012, 1.200154, 1, 0, 0, 1, 1,
0.1414223, -1.454175, 3.937799, 0, 0, 0, 1, 1,
0.142661, -0.975557, 2.922212, 0, 0, 0, 1, 1,
0.1439285, 0.7876095, 3.134045, 0, 0, 0, 1, 1,
0.1455873, -1.197403, 2.14765, 0, 0, 0, 1, 1,
0.1462436, -0.9103958, 2.370296, 0, 0, 0, 1, 1,
0.1487862, -0.6513485, 1.63023, 0, 0, 0, 1, 1,
0.1496629, 0.770878, 0.4145054, 0, 0, 0, 1, 1,
0.1525575, 0.2111603, 0.5242738, 1, 1, 1, 1, 1,
0.152832, 1.083426, 0.8342937, 1, 1, 1, 1, 1,
0.1706686, -0.8356221, 3.574128, 1, 1, 1, 1, 1,
0.1717241, 2.022434, -0.8341792, 1, 1, 1, 1, 1,
0.1719512, -0.9422332, 4.059089, 1, 1, 1, 1, 1,
0.1758644, 2.065775, -0.9464285, 1, 1, 1, 1, 1,
0.175953, 1.575345, 0.5255936, 1, 1, 1, 1, 1,
0.1764438, 0.5518804, -1.93871, 1, 1, 1, 1, 1,
0.1777333, -0.05376019, 2.046851, 1, 1, 1, 1, 1,
0.1791747, 1.541505, -0.8645893, 1, 1, 1, 1, 1,
0.1791995, 1.066255, -0.3838059, 1, 1, 1, 1, 1,
0.1822897, -1.824106, 3.756564, 1, 1, 1, 1, 1,
0.1823283, 0.5588365, -1.139925, 1, 1, 1, 1, 1,
0.1831408, -0.1083513, 2.026109, 1, 1, 1, 1, 1,
0.1835347, 0.2494341, 2.935467, 1, 1, 1, 1, 1,
0.1841024, -0.9710839, 1.975575, 0, 0, 1, 1, 1,
0.1842212, 0.9446803, -0.07424441, 1, 0, 0, 1, 1,
0.1859145, -0.6904663, 2.887976, 1, 0, 0, 1, 1,
0.1896671, 0.06835315, 0.9791405, 1, 0, 0, 1, 1,
0.1901584, -0.6380288, 2.280697, 1, 0, 0, 1, 1,
0.1992296, -1.293387, 2.664671, 1, 0, 0, 1, 1,
0.1992533, 0.9315907, 1.908098, 0, 0, 0, 1, 1,
0.199904, -0.5731466, 2.569296, 0, 0, 0, 1, 1,
0.2004892, 0.3465714, 0.7932693, 0, 0, 0, 1, 1,
0.2021026, 1.422371, 0.8667806, 0, 0, 0, 1, 1,
0.202788, -1.594425, 1.536646, 0, 0, 0, 1, 1,
0.2032737, -0.6276399, 2.271131, 0, 0, 0, 1, 1,
0.2036779, -1.480846, 2.389468, 0, 0, 0, 1, 1,
0.217291, 0.392116, 0.9665812, 1, 1, 1, 1, 1,
0.2210066, 0.3092834, 0.4461071, 1, 1, 1, 1, 1,
0.225558, 1.957745, -0.9515499, 1, 1, 1, 1, 1,
0.2270916, 1.706338, 0.1735018, 1, 1, 1, 1, 1,
0.2304485, -0.7911635, 1.856337, 1, 1, 1, 1, 1,
0.2334564, -0.5998024, 2.657144, 1, 1, 1, 1, 1,
0.2343031, -0.2859437, -0.08708657, 1, 1, 1, 1, 1,
0.2401634, 0.6929672, 0.4849508, 1, 1, 1, 1, 1,
0.2446872, 0.3916991, -1.046946, 1, 1, 1, 1, 1,
0.2470587, -0.0113766, 2.507857, 1, 1, 1, 1, 1,
0.248571, 1.453609, 1.098792, 1, 1, 1, 1, 1,
0.2498794, 0.674809, 0.03102914, 1, 1, 1, 1, 1,
0.2626912, 0.3082673, 0.4104928, 1, 1, 1, 1, 1,
0.2646852, 0.9143502, 0.06890811, 1, 1, 1, 1, 1,
0.2652133, -0.7850434, 2.455608, 1, 1, 1, 1, 1,
0.2667573, 1.707964, 0.1991325, 0, 0, 1, 1, 1,
0.2672355, -0.6943073, 2.376682, 1, 0, 0, 1, 1,
0.2672938, 0.2244934, 1.026119, 1, 0, 0, 1, 1,
0.2675808, 1.32558, -0.4871906, 1, 0, 0, 1, 1,
0.2704924, -0.1867425, 3.293323, 1, 0, 0, 1, 1,
0.2723461, -1.860676, 0.9034921, 1, 0, 0, 1, 1,
0.2836197, -1.077899, 2.666053, 0, 0, 0, 1, 1,
0.2856137, 2.353435, -1.243696, 0, 0, 0, 1, 1,
0.2869027, -1.668281, 3.772784, 0, 0, 0, 1, 1,
0.2908597, 1.479268, 1.610335, 0, 0, 0, 1, 1,
0.2909848, -0.4830985, 2.2116, 0, 0, 0, 1, 1,
0.2913278, -2.088748, 2.523782, 0, 0, 0, 1, 1,
0.2960412, -0.2676665, 2.088648, 0, 0, 0, 1, 1,
0.2970687, 2.007375, 0.4993117, 1, 1, 1, 1, 1,
0.3005259, -0.1501408, 1.706774, 1, 1, 1, 1, 1,
0.3043239, 0.5161292, 2.27562, 1, 1, 1, 1, 1,
0.3045875, 1.264984, -1.168808, 1, 1, 1, 1, 1,
0.308139, -0.9256157, 1.620763, 1, 1, 1, 1, 1,
0.3084829, 0.6921242, 1.340916, 1, 1, 1, 1, 1,
0.311473, 2.121972, 0.8281826, 1, 1, 1, 1, 1,
0.3144829, 0.14315, 2.298329, 1, 1, 1, 1, 1,
0.316829, 2.010722, -0.5584881, 1, 1, 1, 1, 1,
0.3168744, -0.4000579, 1.475275, 1, 1, 1, 1, 1,
0.3178307, -0.230466, 0.9415979, 1, 1, 1, 1, 1,
0.3181722, -0.4378597, 3.091816, 1, 1, 1, 1, 1,
0.321516, -0.8166039, 3.412267, 1, 1, 1, 1, 1,
0.3230541, 0.8564894, -0.873053, 1, 1, 1, 1, 1,
0.3294393, -1.827032, 4.080492, 1, 1, 1, 1, 1,
0.3304705, -0.5797302, 2.346828, 0, 0, 1, 1, 1,
0.3336935, 0.9446166, -0.1227255, 1, 0, 0, 1, 1,
0.3343908, 0.6265125, 1.2554, 1, 0, 0, 1, 1,
0.3371964, 0.3190146, 0.6056259, 1, 0, 0, 1, 1,
0.34128, 0.6584636, -1.289557, 1, 0, 0, 1, 1,
0.3442421, -0.8256232, 2.622111, 1, 0, 0, 1, 1,
0.3449296, 0.335009, 1.858082, 0, 0, 0, 1, 1,
0.3505146, 0.9505063, -0.4246796, 0, 0, 0, 1, 1,
0.3509421, -1.980003, 3.673129, 0, 0, 0, 1, 1,
0.355899, 1.067364, 1.004498, 0, 0, 0, 1, 1,
0.356207, -0.9821808, 3.793055, 0, 0, 0, 1, 1,
0.3607845, -1.608597, 2.588846, 0, 0, 0, 1, 1,
0.3649813, -0.03106281, 2.597437, 0, 0, 0, 1, 1,
0.3662538, -0.3014826, 0.2209717, 1, 1, 1, 1, 1,
0.3703837, 1.134268, 0.06740849, 1, 1, 1, 1, 1,
0.3722793, -0.3325999, 1.507709, 1, 1, 1, 1, 1,
0.3741626, 0.1081093, 1.899306, 1, 1, 1, 1, 1,
0.3744993, -2.777864, 3.940731, 1, 1, 1, 1, 1,
0.3764991, 0.9451838, 0.3021366, 1, 1, 1, 1, 1,
0.3775832, -1.736775, 3.029967, 1, 1, 1, 1, 1,
0.3782533, -0.5292966, 0.986272, 1, 1, 1, 1, 1,
0.3805033, -0.7135257, 2.70566, 1, 1, 1, 1, 1,
0.380555, -0.5886264, 0.5377735, 1, 1, 1, 1, 1,
0.3808857, -0.7310697, 2.694701, 1, 1, 1, 1, 1,
0.3834465, -1.029157, 4.118018, 1, 1, 1, 1, 1,
0.384155, 0.3206416, 0.882851, 1, 1, 1, 1, 1,
0.3873554, 1.535607, -0.9762009, 1, 1, 1, 1, 1,
0.3884463, 0.7364935, -0.6944071, 1, 1, 1, 1, 1,
0.3907227, -0.1703923, 1.381441, 0, 0, 1, 1, 1,
0.3939964, -1.401609, 4.150056, 1, 0, 0, 1, 1,
0.3964141, -1.398767, 2.06853, 1, 0, 0, 1, 1,
0.396821, 0.4150502, 3.608271, 1, 0, 0, 1, 1,
0.3997214, 1.798612, -0.001816913, 1, 0, 0, 1, 1,
0.4013162, 0.7070323, -0.9374571, 1, 0, 0, 1, 1,
0.4020213, -0.5354995, 4.03243, 0, 0, 0, 1, 1,
0.4022969, -0.9720176, 2.790714, 0, 0, 0, 1, 1,
0.4046105, -0.6457104, 1.969345, 0, 0, 0, 1, 1,
0.4052331, 1.118381, -2.203094, 0, 0, 0, 1, 1,
0.4068227, -0.6593736, 2.275862, 0, 0, 0, 1, 1,
0.4082192, -0.5808854, 1.48916, 0, 0, 0, 1, 1,
0.4082474, 1.866872, 0.8242868, 0, 0, 0, 1, 1,
0.4089188, -0.2944782, 2.425951, 1, 1, 1, 1, 1,
0.4131404, -0.9491249, 4.421118, 1, 1, 1, 1, 1,
0.413219, 1.28357, 0.9585606, 1, 1, 1, 1, 1,
0.4178152, 1.310905, 0.9827787, 1, 1, 1, 1, 1,
0.4214074, 0.4198113, 2.251149, 1, 1, 1, 1, 1,
0.4238115, -0.05009092, 2.534665, 1, 1, 1, 1, 1,
0.4255344, 1.593027, 1.356522, 1, 1, 1, 1, 1,
0.4291199, -0.3638667, 2.017925, 1, 1, 1, 1, 1,
0.4298894, -0.1468655, 1.006046, 1, 1, 1, 1, 1,
0.4300106, -0.7516311, 3.443351, 1, 1, 1, 1, 1,
0.4320713, -1.024712, 3.159994, 1, 1, 1, 1, 1,
0.43322, 1.104277, -0.03472934, 1, 1, 1, 1, 1,
0.4400433, 0.3077518, 0.8576506, 1, 1, 1, 1, 1,
0.4405444, -0.09345309, 1.519812, 1, 1, 1, 1, 1,
0.4437831, 1.55801, 0.7473807, 1, 1, 1, 1, 1,
0.4450042, -0.5312126, 2.538677, 0, 0, 1, 1, 1,
0.4456666, 1.178597, -0.2695103, 1, 0, 0, 1, 1,
0.4462312, -0.2929577, 3.35816, 1, 0, 0, 1, 1,
0.4475031, -0.09066832, 3.492215, 1, 0, 0, 1, 1,
0.4481425, 0.4824703, 0.1074087, 1, 0, 0, 1, 1,
0.4497676, 0.3207996, 1.327249, 1, 0, 0, 1, 1,
0.4528109, 0.3573319, 2.730999, 0, 0, 0, 1, 1,
0.4566249, 0.995912, 0.5034602, 0, 0, 0, 1, 1,
0.4587314, -1.353606, 2.017524, 0, 0, 0, 1, 1,
0.4645682, -1.802873, 3.352948, 0, 0, 0, 1, 1,
0.464829, -1.287541, 3.002601, 0, 0, 0, 1, 1,
0.4721103, -1.243465, 3.637009, 0, 0, 0, 1, 1,
0.4817983, 1.17633, 1.211814, 0, 0, 0, 1, 1,
0.4915206, -0.1947882, 1.4741, 1, 1, 1, 1, 1,
0.4939912, -0.9188657, 2.287655, 1, 1, 1, 1, 1,
0.5051814, 1.240046, 0.04917043, 1, 1, 1, 1, 1,
0.5053167, -1.619618, 2.712104, 1, 1, 1, 1, 1,
0.5057483, -0.2683484, 1.424501, 1, 1, 1, 1, 1,
0.505976, 0.8772772, 0.6019725, 1, 1, 1, 1, 1,
0.5072468, -0.8503562, 2.701706, 1, 1, 1, 1, 1,
0.5162776, -0.05250055, 2.8554, 1, 1, 1, 1, 1,
0.5180146, 1.146081, -1.648918, 1, 1, 1, 1, 1,
0.5295604, -0.4148403, 2.799514, 1, 1, 1, 1, 1,
0.5307143, 1.34596, 2.776367, 1, 1, 1, 1, 1,
0.5343056, -1.009474, 2.287676, 1, 1, 1, 1, 1,
0.5362367, 1.898068, 0.8393528, 1, 1, 1, 1, 1,
0.5403483, -0.5442988, -0.1574441, 1, 1, 1, 1, 1,
0.5406998, -0.5589631, 1.725839, 1, 1, 1, 1, 1,
0.543349, -0.341608, 2.07636, 0, 0, 1, 1, 1,
0.5446034, 1.94449, 0.6379626, 1, 0, 0, 1, 1,
0.5537312, 0.9565122, 0.4336367, 1, 0, 0, 1, 1,
0.5550944, -1.200927, 2.459127, 1, 0, 0, 1, 1,
0.5587223, -0.08298013, 0.7986687, 1, 0, 0, 1, 1,
0.5590453, 0.4787228, 0.5470699, 1, 0, 0, 1, 1,
0.5647953, 1.463005, 0.87566, 0, 0, 0, 1, 1,
0.579707, -0.870757, 3.865558, 0, 0, 0, 1, 1,
0.5809434, -0.7624903, 2.053357, 0, 0, 0, 1, 1,
0.5905864, 2.25384, 0.8528137, 0, 0, 0, 1, 1,
0.5951056, -0.1443735, 3.139879, 0, 0, 0, 1, 1,
0.5978721, 1.980866, 2.23431, 0, 0, 0, 1, 1,
0.5991805, -0.4653723, 2.671614, 0, 0, 0, 1, 1,
0.5995771, -0.4385069, 1.831566, 1, 1, 1, 1, 1,
0.6008195, 0.2834956, 0.6369568, 1, 1, 1, 1, 1,
0.6044659, -0.7062927, 4.679917, 1, 1, 1, 1, 1,
0.6085803, -1.037058, 1.4561, 1, 1, 1, 1, 1,
0.6161082, 1.430183, 0.7935627, 1, 1, 1, 1, 1,
0.6195094, -1.348025, 3.907836, 1, 1, 1, 1, 1,
0.6220242, -1.672759, 0.5402131, 1, 1, 1, 1, 1,
0.6277998, 1.071374, 1.589718, 1, 1, 1, 1, 1,
0.6295941, -0.1100781, 0.9861696, 1, 1, 1, 1, 1,
0.6353103, 0.6761227, -0.06470383, 1, 1, 1, 1, 1,
0.6496051, 0.2641454, 1.200157, 1, 1, 1, 1, 1,
0.6500226, -0.2828065, 1.292319, 1, 1, 1, 1, 1,
0.6509262, -1.66955, 1.206941, 1, 1, 1, 1, 1,
0.6517197, -0.06968629, 1.035351, 1, 1, 1, 1, 1,
0.6554772, 0.2566839, 1.268166, 1, 1, 1, 1, 1,
0.6581284, 1.153232, 2.29917, 0, 0, 1, 1, 1,
0.6637894, 0.9227312, 0.5391058, 1, 0, 0, 1, 1,
0.6664469, -0.4425209, 3.566387, 1, 0, 0, 1, 1,
0.6679808, -2.769633, 2.915326, 1, 0, 0, 1, 1,
0.669504, -1.146077, 2.636938, 1, 0, 0, 1, 1,
0.6719759, 2.339154, 0.05324916, 1, 0, 0, 1, 1,
0.6755357, -1.595026, 3.089344, 0, 0, 0, 1, 1,
0.6838915, 1.173508, 1.311895, 0, 0, 0, 1, 1,
0.6845914, -0.212822, 2.723475, 0, 0, 0, 1, 1,
0.6857183, -0.06003513, 1.879589, 0, 0, 0, 1, 1,
0.6861184, -0.5612015, 2.840909, 0, 0, 0, 1, 1,
0.6956452, 2.215961, -0.5274147, 0, 0, 0, 1, 1,
0.6972775, -0.2356074, 0.9251076, 0, 0, 0, 1, 1,
0.6990156, 0.6381382, 0.977991, 1, 1, 1, 1, 1,
0.6996889, 0.02980375, 2.213916, 1, 1, 1, 1, 1,
0.6996953, 0.9468624, 1.975174, 1, 1, 1, 1, 1,
0.707508, -0.9732424, 4.488873, 1, 1, 1, 1, 1,
0.7138504, -0.05959046, 2.22932, 1, 1, 1, 1, 1,
0.7159827, -0.2288863, -0.3694064, 1, 1, 1, 1, 1,
0.7178485, -1.29928, 1.879326, 1, 1, 1, 1, 1,
0.7192532, -1.240293, 4.39496, 1, 1, 1, 1, 1,
0.7240545, -0.5077402, 2.820284, 1, 1, 1, 1, 1,
0.7242964, -1.208536, 2.934658, 1, 1, 1, 1, 1,
0.7247587, -0.6618704, 4.730578, 1, 1, 1, 1, 1,
0.7249485, -0.5332638, 3.220286, 1, 1, 1, 1, 1,
0.727591, -1.260849, 1.689655, 1, 1, 1, 1, 1,
0.7360327, 1.04821, 0.7871528, 1, 1, 1, 1, 1,
0.7373213, 0.4614283, 1.637419, 1, 1, 1, 1, 1,
0.7424176, 0.6741326, -0.1894419, 0, 0, 1, 1, 1,
0.7440559, -0.2333864, 1.651133, 1, 0, 0, 1, 1,
0.7493414, 1.634777, 1.00542, 1, 0, 0, 1, 1,
0.7506974, -1.162388, 1.385904, 1, 0, 0, 1, 1,
0.7508308, -1.947104, 2.046583, 1, 0, 0, 1, 1,
0.7516778, -1.094376, 3.033686, 1, 0, 0, 1, 1,
0.7532954, -0.6913783, 1.723681, 0, 0, 0, 1, 1,
0.7589092, -0.1203508, 2.102483, 0, 0, 0, 1, 1,
0.762781, -0.2696808, 1.371215, 0, 0, 0, 1, 1,
0.7681268, 0.3512167, 2.226854, 0, 0, 0, 1, 1,
0.7727044, -0.1386076, 2.658751, 0, 0, 0, 1, 1,
0.77337, 2.991802, 0.6053124, 0, 0, 0, 1, 1,
0.7856798, 0.9397987, 0.7241065, 0, 0, 0, 1, 1,
0.7905289, 0.09456208, 1.968011, 1, 1, 1, 1, 1,
0.7947923, 0.07182361, 0.547657, 1, 1, 1, 1, 1,
0.796203, -0.320204, 1.947867, 1, 1, 1, 1, 1,
0.8064264, -0.2990148, 3.528275, 1, 1, 1, 1, 1,
0.8081794, 0.2654069, 1.558442, 1, 1, 1, 1, 1,
0.8107258, 1.721383, -0.2395484, 1, 1, 1, 1, 1,
0.8129629, 0.5378528, -0.5319362, 1, 1, 1, 1, 1,
0.8176607, 1.133059, 0.4688787, 1, 1, 1, 1, 1,
0.8186986, 1.063721, -1.400519, 1, 1, 1, 1, 1,
0.8204736, -0.504605, 2.753746, 1, 1, 1, 1, 1,
0.8220795, -1.905239, 1.946844, 1, 1, 1, 1, 1,
0.8254167, 0.7849718, 1.327717, 1, 1, 1, 1, 1,
0.8256295, -0.07886242, 3.062175, 1, 1, 1, 1, 1,
0.8287064, -0.8237709, 1.217939, 1, 1, 1, 1, 1,
0.8288648, 2.329795, -0.3486344, 1, 1, 1, 1, 1,
0.8339581, 0.04324929, -0.07125787, 0, 0, 1, 1, 1,
0.8375691, 0.0955505, 1.451551, 1, 0, 0, 1, 1,
0.8460612, 0.6202644, 0.1064919, 1, 0, 0, 1, 1,
0.8462199, -0.7206798, 1.325714, 1, 0, 0, 1, 1,
0.8480163, 0.2077584, -0.6856956, 1, 0, 0, 1, 1,
0.849878, -0.6800178, 1.900338, 1, 0, 0, 1, 1,
0.8533491, 0.9748195, 2.270062, 0, 0, 0, 1, 1,
0.8566656, 0.5405331, 1.916493, 0, 0, 0, 1, 1,
0.8607362, -0.8792285, 3.322875, 0, 0, 0, 1, 1,
0.8619907, -0.4599266, 1.960634, 0, 0, 0, 1, 1,
0.8641618, 1.340861, 0.7941241, 0, 0, 0, 1, 1,
0.8659165, 1.444559, 2.050097, 0, 0, 0, 1, 1,
0.8690497, -0.2503791, 2.00917, 0, 0, 0, 1, 1,
0.873318, 0.2388757, 1.594806, 1, 1, 1, 1, 1,
0.8763344, 0.9988161, 1.932679, 1, 1, 1, 1, 1,
0.8771455, -0.7444824, 3.179399, 1, 1, 1, 1, 1,
0.8777303, -1.043848, 1.784807, 1, 1, 1, 1, 1,
0.882063, 0.4895516, 0.03305572, 1, 1, 1, 1, 1,
0.8828083, 0.8394048, 0.7803947, 1, 1, 1, 1, 1,
0.8882239, 1.328295, -2.052417, 1, 1, 1, 1, 1,
0.8907713, 0.7884861, 2.247368, 1, 1, 1, 1, 1,
0.8999169, -1.940377, 3.114123, 1, 1, 1, 1, 1,
0.9010894, 0.763081, -0.1864917, 1, 1, 1, 1, 1,
0.9079239, -0.0679471, 2.181364, 1, 1, 1, 1, 1,
0.9101136, -0.8601913, 3.708795, 1, 1, 1, 1, 1,
0.910793, -1.090527, 3.50303, 1, 1, 1, 1, 1,
0.9145256, 0.002304291, 2.065092, 1, 1, 1, 1, 1,
0.914812, -0.1921701, 2.618704, 1, 1, 1, 1, 1,
0.9297736, 0.04132001, 1.74893, 0, 0, 1, 1, 1,
0.9299853, 0.7706347, 0.3051641, 1, 0, 0, 1, 1,
0.9332862, 0.9533881, 0.9707459, 1, 0, 0, 1, 1,
0.9334689, -1.548373, 0.7833046, 1, 0, 0, 1, 1,
0.9340054, -1.640213, 2.90367, 1, 0, 0, 1, 1,
0.9349104, -0.5458509, 1.696282, 1, 0, 0, 1, 1,
0.9355061, 2.087332, 0.9544895, 0, 0, 0, 1, 1,
0.9361348, -0.06159042, 0.7469946, 0, 0, 0, 1, 1,
0.9393448, 1.213792, -0.3715757, 0, 0, 0, 1, 1,
0.9419261, 1.989225, -1.004048, 0, 0, 0, 1, 1,
0.9438934, 1.043837, 0.6381643, 0, 0, 0, 1, 1,
0.9456767, 0.6829327, 1.755996, 0, 0, 0, 1, 1,
0.9522781, -0.7769842, 1.04107, 0, 0, 0, 1, 1,
0.9553766, 0.5294828, 0.9047129, 1, 1, 1, 1, 1,
0.95564, -1.585925, 2.016033, 1, 1, 1, 1, 1,
0.9639103, -0.6313481, 3.186345, 1, 1, 1, 1, 1,
0.9646935, -0.6989589, 1.186548, 1, 1, 1, 1, 1,
0.9681201, -1.340512, 3.195415, 1, 1, 1, 1, 1,
0.9723614, 0.01514084, 1.781724, 1, 1, 1, 1, 1,
0.9795465, 0.1527608, 3.636893, 1, 1, 1, 1, 1,
0.9895886, -1.396925, 2.12118, 1, 1, 1, 1, 1,
0.9908906, -1.490476, 2.197457, 1, 1, 1, 1, 1,
0.9968284, -0.1172912, -0.1434016, 1, 1, 1, 1, 1,
1.002022, -0.611967, 2.833529, 1, 1, 1, 1, 1,
1.003596, 1.289843, 0.5965248, 1, 1, 1, 1, 1,
1.00587, 0.3834842, 0.636983, 1, 1, 1, 1, 1,
1.011421, -0.7057852, 3.777978, 1, 1, 1, 1, 1,
1.011765, -0.2007844, 2.959055, 1, 1, 1, 1, 1,
1.015146, 1.399737, -0.6819768, 0, 0, 1, 1, 1,
1.017719, -1.129914, 3.005085, 1, 0, 0, 1, 1,
1.019152, -0.3067318, 2.247928, 1, 0, 0, 1, 1,
1.026828, 0.4959327, 0.4793377, 1, 0, 0, 1, 1,
1.027726, 0.07288505, 2.119631, 1, 0, 0, 1, 1,
1.035512, 0.4360916, 2.425145, 1, 0, 0, 1, 1,
1.035896, -1.905424, 4.087233, 0, 0, 0, 1, 1,
1.038406, 0.98018, 0.3268093, 0, 0, 0, 1, 1,
1.038644, 1.134024, 1.10366, 0, 0, 0, 1, 1,
1.040542, -1.606319, 3.496446, 0, 0, 0, 1, 1,
1.041135, 1.504319, 1.605093, 0, 0, 0, 1, 1,
1.043397, -0.4416291, 0.8862455, 0, 0, 0, 1, 1,
1.043816, -1.178339, 2.025384, 0, 0, 0, 1, 1,
1.047354, -0.5139871, 1.426314, 1, 1, 1, 1, 1,
1.050254, 2.323426, -1.053345, 1, 1, 1, 1, 1,
1.055804, 0.5017267, -0.5935726, 1, 1, 1, 1, 1,
1.061326, -0.6787713, 2.814114, 1, 1, 1, 1, 1,
1.0649, -0.7381563, 1.432334, 1, 1, 1, 1, 1,
1.067909, 0.8602862, 0.3912663, 1, 1, 1, 1, 1,
1.07553, -1.300683, 2.280926, 1, 1, 1, 1, 1,
1.077797, 0.1639564, 0.9981363, 1, 1, 1, 1, 1,
1.086018, 0.184995, 3.978578, 1, 1, 1, 1, 1,
1.087438, 1.195464, -2.093813, 1, 1, 1, 1, 1,
1.112654, 1.233603, 1.428449, 1, 1, 1, 1, 1,
1.113547, 0.5079537, 1.549753, 1, 1, 1, 1, 1,
1.113791, 2.671028, 0.7518093, 1, 1, 1, 1, 1,
1.120916, -0.4336985, 0.8124821, 1, 1, 1, 1, 1,
1.131893, -0.2088797, -0.2710502, 1, 1, 1, 1, 1,
1.133106, -0.07619543, 2.022877, 0, 0, 1, 1, 1,
1.133914, 0.4617687, -0.07645503, 1, 0, 0, 1, 1,
1.135692, 0.3115846, -0.09015142, 1, 0, 0, 1, 1,
1.13685, 0.7217156, 1.421234, 1, 0, 0, 1, 1,
1.147171, 1.606815, 0.9489898, 1, 0, 0, 1, 1,
1.147981, 0.05483619, 2.651222, 1, 0, 0, 1, 1,
1.151593, 0.2147415, 3.307747, 0, 0, 0, 1, 1,
1.152672, -0.7043431, 1.690894, 0, 0, 0, 1, 1,
1.155098, -1.394057, 0.8770964, 0, 0, 0, 1, 1,
1.162478, -1.569271, 4.750077, 0, 0, 0, 1, 1,
1.163889, 0.2767843, 1.788661, 0, 0, 0, 1, 1,
1.172222, -0.3437852, 1.446147, 0, 0, 0, 1, 1,
1.179209, 0.2832829, 0.8012103, 0, 0, 0, 1, 1,
1.181268, -0.9172027, 2.158113, 1, 1, 1, 1, 1,
1.186663, 1.594505, -0.1954749, 1, 1, 1, 1, 1,
1.191319, -0.7392556, 3.189124, 1, 1, 1, 1, 1,
1.196628, -0.9602168, 4.585077, 1, 1, 1, 1, 1,
1.205766, 1.940621, -0.4745152, 1, 1, 1, 1, 1,
1.205976, -1.434288, 1.594684, 1, 1, 1, 1, 1,
1.208402, 0.5010773, 0.9414464, 1, 1, 1, 1, 1,
1.208907, 0.4304339, 0.03500769, 1, 1, 1, 1, 1,
1.21419, -0.9616932, 2.027694, 1, 1, 1, 1, 1,
1.218112, -0.4405361, 2.348743, 1, 1, 1, 1, 1,
1.218854, -0.321472, 1.825611, 1, 1, 1, 1, 1,
1.224525, 0.8635924, -0.3340422, 1, 1, 1, 1, 1,
1.226564, 0.6176603, 1.692445, 1, 1, 1, 1, 1,
1.230332, 1.842605, -0.4074727, 1, 1, 1, 1, 1,
1.235202, -0.5680664, 2.402612, 1, 1, 1, 1, 1,
1.242785, -0.01895458, 1.911012, 0, 0, 1, 1, 1,
1.243338, 1.22924, 1.405966, 1, 0, 0, 1, 1,
1.250831, 0.1841242, 0.6718035, 1, 0, 0, 1, 1,
1.26808, 0.2773702, 1.955354, 1, 0, 0, 1, 1,
1.269744, 1.527084, 0.9714193, 1, 0, 0, 1, 1,
1.288104, 0.982865, -0.2778292, 1, 0, 0, 1, 1,
1.288272, -0.9743133, 0.4335461, 0, 0, 0, 1, 1,
1.288842, -1.306858, 3.504122, 0, 0, 0, 1, 1,
1.28899, -1.017291, 1.887499, 0, 0, 0, 1, 1,
1.291443, 0.9188445, 0.263809, 0, 0, 0, 1, 1,
1.300103, -1.711362, 2.005594, 0, 0, 0, 1, 1,
1.300323, -0.6882217, 2.30493, 0, 0, 0, 1, 1,
1.305803, -0.8866789, 0.07767544, 0, 0, 0, 1, 1,
1.306686, 1.056085, 0.7567464, 1, 1, 1, 1, 1,
1.30794, -0.6897712, 2.547561, 1, 1, 1, 1, 1,
1.312269, -1.340354, 3.383282, 1, 1, 1, 1, 1,
1.312487, 1.60032, 0.3656018, 1, 1, 1, 1, 1,
1.322113, 0.1684572, 1.971821, 1, 1, 1, 1, 1,
1.328107, 0.4924919, 1.317462, 1, 1, 1, 1, 1,
1.330617, 0.9161518, -0.6412235, 1, 1, 1, 1, 1,
1.331114, -0.4154538, 0.8920891, 1, 1, 1, 1, 1,
1.332542, 1.262402, 0.9461336, 1, 1, 1, 1, 1,
1.351539, 0.5153877, 1.032393, 1, 1, 1, 1, 1,
1.352832, 1.051092, 0.3562928, 1, 1, 1, 1, 1,
1.35726, 1.05713, -1.075818, 1, 1, 1, 1, 1,
1.361993, 0.9685807, -0.4407031, 1, 1, 1, 1, 1,
1.364189, -0.549682, 2.683643, 1, 1, 1, 1, 1,
1.365821, 0.9359721, 1.275073, 1, 1, 1, 1, 1,
1.396527, -0.1965942, 2.737663, 0, 0, 1, 1, 1,
1.401867, -0.3784116, 2.455719, 1, 0, 0, 1, 1,
1.411314, -0.4492843, 1.186099, 1, 0, 0, 1, 1,
1.429863, -2.637889, 2.582199, 1, 0, 0, 1, 1,
1.431169, -1.24441, 2.266683, 1, 0, 0, 1, 1,
1.434456, 0.2852863, 0.1702029, 1, 0, 0, 1, 1,
1.442969, -0.2761122, 0.5417076, 0, 0, 0, 1, 1,
1.465735, 0.1000802, -0.05850662, 0, 0, 0, 1, 1,
1.48248, -0.526486, 0.5074305, 0, 0, 0, 1, 1,
1.495694, 3.003745, -1.317226, 0, 0, 0, 1, 1,
1.509416, -0.1297964, 2.335729, 0, 0, 0, 1, 1,
1.510598, 1.36707, 2.019188, 0, 0, 0, 1, 1,
1.510614, 0.06742407, 1.591594, 0, 0, 0, 1, 1,
1.510761, 0.9593811, 1.323987, 1, 1, 1, 1, 1,
1.513396, 1.003276, 0.7686944, 1, 1, 1, 1, 1,
1.518826, 0.3853316, -0.09135116, 1, 1, 1, 1, 1,
1.537342, 1.013466, 0.9078555, 1, 1, 1, 1, 1,
1.542517, -1.093969, 1.541306, 1, 1, 1, 1, 1,
1.545368, -0.4324826, 0.7807581, 1, 1, 1, 1, 1,
1.558751, -0.8524213, -0.005024013, 1, 1, 1, 1, 1,
1.562194, -0.7236527, 2.369685, 1, 1, 1, 1, 1,
1.564443, 0.6589107, 2.237663, 1, 1, 1, 1, 1,
1.575519, 1.350294, -0.2489914, 1, 1, 1, 1, 1,
1.59718, 0.1645933, 3.820253, 1, 1, 1, 1, 1,
1.618061, 1.934264, 2.025629, 1, 1, 1, 1, 1,
1.665105, -0.1825248, 0.9166461, 1, 1, 1, 1, 1,
1.673222, 1.04739, -0.8637696, 1, 1, 1, 1, 1,
1.674009, 0.7217571, 2.646256, 1, 1, 1, 1, 1,
1.675113, -1.890683, 3.265779, 0, 0, 1, 1, 1,
1.685787, -0.5994951, 3.279131, 1, 0, 0, 1, 1,
1.688404, 1.150581, 0.9380654, 1, 0, 0, 1, 1,
1.70066, 0.3999149, 0.2784634, 1, 0, 0, 1, 1,
1.710533, -1.0303, 1.27632, 1, 0, 0, 1, 1,
1.716722, -0.3689874, 1.502037, 1, 0, 0, 1, 1,
1.73558, -1.361826, 0.4422532, 0, 0, 0, 1, 1,
1.749967, -0.4572838, 2.646344, 0, 0, 0, 1, 1,
1.795468, 1.090147, 1.060495, 0, 0, 0, 1, 1,
1.802113, -0.3038016, 4.464939, 0, 0, 0, 1, 1,
1.815295, 0.08785953, 2.944398, 0, 0, 0, 1, 1,
1.816069, -1.172858, 2.283884, 0, 0, 0, 1, 1,
1.826766, -1.050899, 0.9584293, 0, 0, 0, 1, 1,
1.83625, -1.758698, 2.255665, 1, 1, 1, 1, 1,
1.840037, -1.844711, 0.9352955, 1, 1, 1, 1, 1,
1.84277, 0.8282304, 3.072576, 1, 1, 1, 1, 1,
1.869759, -0.04876333, 1.126494, 1, 1, 1, 1, 1,
1.871562, -0.537506, 2.015295, 1, 1, 1, 1, 1,
1.877639, 0.1884136, 0.2547328, 1, 1, 1, 1, 1,
1.879923, 1.198576, 0.1488317, 1, 1, 1, 1, 1,
1.93092, -0.4994726, 2.552299, 1, 1, 1, 1, 1,
1.93443, 0.8506253, 1.614113, 1, 1, 1, 1, 1,
1.971772, -0.158101, 0.2484177, 1, 1, 1, 1, 1,
1.981802, -0.2897127, 1.090915, 1, 1, 1, 1, 1,
1.985655, 0.7009974, 1.683243, 1, 1, 1, 1, 1,
2.013822, -0.1201635, 1.287693, 1, 1, 1, 1, 1,
2.069442, -1.362906, 1.308654, 1, 1, 1, 1, 1,
2.092701, 1.587827, 0.5125238, 1, 1, 1, 1, 1,
2.115283, -0.03217126, 2.110482, 0, 0, 1, 1, 1,
2.140152, 0.9660574, 1.840947, 1, 0, 0, 1, 1,
2.17187, 0.4869874, 1.181514, 1, 0, 0, 1, 1,
2.192565, 0.5441366, 0.5010127, 1, 0, 0, 1, 1,
2.19485, 0.2984684, -0.4691009, 1, 0, 0, 1, 1,
2.243056, 0.9025572, 0.9400671, 1, 0, 0, 1, 1,
2.254183, 1.04485, 1.161068, 0, 0, 0, 1, 1,
2.326489, -1.288611, 3.449024, 0, 0, 0, 1, 1,
2.332637, 0.02459889, 0.5977373, 0, 0, 0, 1, 1,
2.349482, -0.269982, 2.87139, 0, 0, 0, 1, 1,
2.396542, 1.347123, 2.498674, 0, 0, 0, 1, 1,
2.483072, 1.125231, 2.27371, 0, 0, 0, 1, 1,
2.508722, 0.3907341, 2.927453, 0, 0, 0, 1, 1,
2.518997, -0.5304919, 1.687596, 1, 1, 1, 1, 1,
2.536065, 0.5576438, 1.05785, 1, 1, 1, 1, 1,
2.559288, 0.3703044, 1.254238, 1, 1, 1, 1, 1,
2.582493, 0.9285294, 1.105961, 1, 1, 1, 1, 1,
2.585711, -0.5494623, 0.7398799, 1, 1, 1, 1, 1,
2.922579, 2.288561, 2.109323, 1, 1, 1, 1, 1,
2.9692, 1.387757, 1.868973, 1, 1, 1, 1, 1
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
var radius = 9.562403;
var distance = 33.58753;
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
mvMatrix.translate( 0.3814528, 0.1012287, -0.1427429 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.58753);
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
