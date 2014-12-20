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
-3.207563, 1.341333, -1.605559, 1, 0, 0, 1,
-3.085173, 1.604553, -2.620258, 1, 0.007843138, 0, 1,
-3.019132, -1.32338, -2.069426, 1, 0.01176471, 0, 1,
-2.894567, -0.917782, -1.391955, 1, 0.01960784, 0, 1,
-2.824602, -0.4603593, -0.3561681, 1, 0.02352941, 0, 1,
-2.81979, 0.4062254, -1.713325, 1, 0.03137255, 0, 1,
-2.690368, -1.093876, -1.653301, 1, 0.03529412, 0, 1,
-2.527754, 1.784452, -1.560042, 1, 0.04313726, 0, 1,
-2.467517, -1.368583, -3.424461, 1, 0.04705882, 0, 1,
-2.395, 0.4603704, -0.9061964, 1, 0.05490196, 0, 1,
-2.377728, -0.7795981, -1.318054, 1, 0.05882353, 0, 1,
-2.327863, 0.8755363, -1.3617, 1, 0.06666667, 0, 1,
-2.242257, 1.601487, -1.513711, 1, 0.07058824, 0, 1,
-2.215988, 1.849382, -1.669134, 1, 0.07843138, 0, 1,
-2.16782, -0.6069177, -2.362096, 1, 0.08235294, 0, 1,
-2.1622, -0.8079301, -2.896404, 1, 0.09019608, 0, 1,
-2.140611, 0.02365463, -1.755306, 1, 0.09411765, 0, 1,
-2.129823, -0.4070955, -3.847789, 1, 0.1019608, 0, 1,
-2.079365, 0.4225291, -1.9604, 1, 0.1098039, 0, 1,
-2.07618, 0.5497775, -1.428249, 1, 0.1137255, 0, 1,
-2.075057, 1.454356, -1.645298, 1, 0.1215686, 0, 1,
-2.052014, -1.050905, -1.84504, 1, 0.1254902, 0, 1,
-2.013875, -0.1002595, -1.508292, 1, 0.1333333, 0, 1,
-1.988814, -0.5013084, -1.321751, 1, 0.1372549, 0, 1,
-1.951239, -0.6736034, -1.992132, 1, 0.145098, 0, 1,
-1.946039, 0.5006105, -0.604221, 1, 0.1490196, 0, 1,
-1.90146, -0.3784436, -1.648362, 1, 0.1568628, 0, 1,
-1.896092, 0.1874166, -3.618118, 1, 0.1607843, 0, 1,
-1.895061, 0.05681989, -0.5891892, 1, 0.1686275, 0, 1,
-1.877485, 0.5119008, -2.714221, 1, 0.172549, 0, 1,
-1.85726, -1.227946, -1.576939, 1, 0.1803922, 0, 1,
-1.834528, 0.4669943, -1.948409, 1, 0.1843137, 0, 1,
-1.827666, 2.064522, -1.544871, 1, 0.1921569, 0, 1,
-1.795894, 0.6823677, -1.093347, 1, 0.1960784, 0, 1,
-1.782579, -1.155071, -2.419994, 1, 0.2039216, 0, 1,
-1.781943, 0.8254852, -2.250704, 1, 0.2117647, 0, 1,
-1.776345, 1.743636, -1.787985, 1, 0.2156863, 0, 1,
-1.773991, -1.757118, -2.730217, 1, 0.2235294, 0, 1,
-1.772568, 0.04833932, 0.6669607, 1, 0.227451, 0, 1,
-1.756547, -0.3965903, -1.200175, 1, 0.2352941, 0, 1,
-1.687255, -0.275978, -1.632648, 1, 0.2392157, 0, 1,
-1.683289, 0.1565092, -1.940847, 1, 0.2470588, 0, 1,
-1.681301, 1.571463, -2.324075, 1, 0.2509804, 0, 1,
-1.673994, -0.2412713, -0.9369431, 1, 0.2588235, 0, 1,
-1.660484, 1.229525, 0.2314458, 1, 0.2627451, 0, 1,
-1.637243, 1.217176, -1.597532, 1, 0.2705882, 0, 1,
-1.630435, 0.3667871, -0.2655422, 1, 0.2745098, 0, 1,
-1.620697, -0.2163157, -1.962957, 1, 0.282353, 0, 1,
-1.607262, 0.5984652, -1.722438, 1, 0.2862745, 0, 1,
-1.605498, 0.6329964, -1.610208, 1, 0.2941177, 0, 1,
-1.595918, 0.2071985, -2.545267, 1, 0.3019608, 0, 1,
-1.584569, -0.7566872, -3.703461, 1, 0.3058824, 0, 1,
-1.578816, 1.567736, -0.9942091, 1, 0.3137255, 0, 1,
-1.578307, -0.9677933, -2.583718, 1, 0.3176471, 0, 1,
-1.578241, -2.353918, -1.583475, 1, 0.3254902, 0, 1,
-1.572588, -0.7186331, -1.686963, 1, 0.3294118, 0, 1,
-1.570335, 0.4073065, -1.689079, 1, 0.3372549, 0, 1,
-1.56895, -0.09914994, -2.254733, 1, 0.3411765, 0, 1,
-1.553515, 0.01894401, -2.742737, 1, 0.3490196, 0, 1,
-1.551314, 0.1330961, -0.2074999, 1, 0.3529412, 0, 1,
-1.546231, 0.2459451, -1.971088, 1, 0.3607843, 0, 1,
-1.52462, 0.3997055, -1.348419, 1, 0.3647059, 0, 1,
-1.522198, -0.3496099, -0.8113926, 1, 0.372549, 0, 1,
-1.520397, -0.07910586, -1.702984, 1, 0.3764706, 0, 1,
-1.513071, -0.1147577, -1.703422, 1, 0.3843137, 0, 1,
-1.510018, -0.2443598, -1.209742, 1, 0.3882353, 0, 1,
-1.5013, 1.690363, 0.2004523, 1, 0.3960784, 0, 1,
-1.499523, -0.9328275, -2.092156, 1, 0.4039216, 0, 1,
-1.488607, -0.09882168, -1.198089, 1, 0.4078431, 0, 1,
-1.485355, -0.4087461, -1.09624, 1, 0.4156863, 0, 1,
-1.472436, 0.9846456, -0.3903109, 1, 0.4196078, 0, 1,
-1.464858, -0.3273078, -1.639804, 1, 0.427451, 0, 1,
-1.454966, -0.6734527, -1.776346, 1, 0.4313726, 0, 1,
-1.439908, 0.9655838, -0.8616121, 1, 0.4392157, 0, 1,
-1.437816, -0.6643686, -2.410608, 1, 0.4431373, 0, 1,
-1.436561, 0.2766833, -1.445403, 1, 0.4509804, 0, 1,
-1.434683, -1.572065, -2.385096, 1, 0.454902, 0, 1,
-1.43342, -0.5797035, -2.94324, 1, 0.4627451, 0, 1,
-1.431422, -1.052712, -3.475105, 1, 0.4666667, 0, 1,
-1.426439, -1.10947, -3.200722, 1, 0.4745098, 0, 1,
-1.41419, -0.006912712, -0.7707489, 1, 0.4784314, 0, 1,
-1.405446, -0.8750038, -2.857577, 1, 0.4862745, 0, 1,
-1.40428, 0.1033739, -2.495879, 1, 0.4901961, 0, 1,
-1.397845, 0.8215724, 0.2592916, 1, 0.4980392, 0, 1,
-1.396632, -0.231972, -1.045746, 1, 0.5058824, 0, 1,
-1.376286, 0.5269229, -1.960035, 1, 0.509804, 0, 1,
-1.375889, 0.3849155, -0.6761655, 1, 0.5176471, 0, 1,
-1.374644, 0.1581369, -3.029755, 1, 0.5215687, 0, 1,
-1.359141, 0.2818312, 1.303984, 1, 0.5294118, 0, 1,
-1.35726, -0.4790164, 0.9303887, 1, 0.5333334, 0, 1,
-1.351867, 0.4479212, -0.06538301, 1, 0.5411765, 0, 1,
-1.344663, -0.8935053, -1.627175, 1, 0.5450981, 0, 1,
-1.330693, 2.009978, -1.412208, 1, 0.5529412, 0, 1,
-1.320385, 0.570887, -0.1372028, 1, 0.5568628, 0, 1,
-1.319609, 0.1063936, -1.288574, 1, 0.5647059, 0, 1,
-1.31103, 1.314704, 0.1093897, 1, 0.5686275, 0, 1,
-1.307441, 0.01538249, -2.191685, 1, 0.5764706, 0, 1,
-1.305545, -0.6071454, -1.190405, 1, 0.5803922, 0, 1,
-1.29834, 1.829786, -0.239361, 1, 0.5882353, 0, 1,
-1.298281, -0.2469263, -1.01594, 1, 0.5921569, 0, 1,
-1.294223, -2.591574, -2.326952, 1, 0.6, 0, 1,
-1.294142, 0.4908758, -2.21664, 1, 0.6078432, 0, 1,
-1.28078, 1.006477, -0.7800453, 1, 0.6117647, 0, 1,
-1.26799, -0.2016252, -1.715669, 1, 0.6196079, 0, 1,
-1.253075, -0.2308263, -0.5473913, 1, 0.6235294, 0, 1,
-1.249214, -1.426995, -2.798922, 1, 0.6313726, 0, 1,
-1.246682, 0.7357489, -1.011298, 1, 0.6352941, 0, 1,
-1.244713, -1.063689, -2.601442, 1, 0.6431373, 0, 1,
-1.237399, 1.743734, 0.07121401, 1, 0.6470588, 0, 1,
-1.234755, 0.07227699, -2.244909, 1, 0.654902, 0, 1,
-1.224562, -1.196857, -1.078471, 1, 0.6588235, 0, 1,
-1.221439, -0.1495526, -2.237988, 1, 0.6666667, 0, 1,
-1.221423, -1.759515, -3.252225, 1, 0.6705883, 0, 1,
-1.211759, 0.9726597, 0.5554677, 1, 0.6784314, 0, 1,
-1.211006, -0.5449637, -1.610338, 1, 0.682353, 0, 1,
-1.209683, -0.02063058, -2.428771, 1, 0.6901961, 0, 1,
-1.205512, -0.3728937, -0.9709593, 1, 0.6941177, 0, 1,
-1.19287, 0.6623333, 0.7050016, 1, 0.7019608, 0, 1,
-1.191617, 0.8135231, 0.9830857, 1, 0.7098039, 0, 1,
-1.18576, -0.9188084, -2.939745, 1, 0.7137255, 0, 1,
-1.177477, -0.4636654, -3.248086, 1, 0.7215686, 0, 1,
-1.174066, 1.208072, 0.104221, 1, 0.7254902, 0, 1,
-1.162415, 1.46301, 0.007489771, 1, 0.7333333, 0, 1,
-1.157915, -0.4765357, -2.262661, 1, 0.7372549, 0, 1,
-1.155931, 1.381169, 0.03423234, 1, 0.7450981, 0, 1,
-1.155688, 0.4822477, -1.070947, 1, 0.7490196, 0, 1,
-1.154393, 0.02098317, -0.4314805, 1, 0.7568628, 0, 1,
-1.151451, -0.1339792, -1.797758, 1, 0.7607843, 0, 1,
-1.134229, 1.230339, -0.8195158, 1, 0.7686275, 0, 1,
-1.120264, 1.138325, -1.259766, 1, 0.772549, 0, 1,
-1.115781, 1.084985, -0.2217271, 1, 0.7803922, 0, 1,
-1.115428, -0.4462601, -1.967504, 1, 0.7843137, 0, 1,
-1.112044, -1.01248, -2.859465, 1, 0.7921569, 0, 1,
-1.104295, -2.423887, -3.992076, 1, 0.7960784, 0, 1,
-1.103478, 0.5298598, -2.432534, 1, 0.8039216, 0, 1,
-1.102817, -0.5804965, 0.04039101, 1, 0.8117647, 0, 1,
-1.096005, 0.5900868, -2.096242, 1, 0.8156863, 0, 1,
-1.09511, 0.3912583, -3.316234, 1, 0.8235294, 0, 1,
-1.093934, 0.9542878, -3.553293, 1, 0.827451, 0, 1,
-1.09046, 1.767024, 0.1727832, 1, 0.8352941, 0, 1,
-1.080837, -0.8900083, -1.151431, 1, 0.8392157, 0, 1,
-1.079559, 1.102519, -2.224814, 1, 0.8470588, 0, 1,
-1.074624, -0.01346589, -3.170584, 1, 0.8509804, 0, 1,
-1.071071, 0.2506487, -2.656499, 1, 0.8588235, 0, 1,
-1.060524, 1.079883, 0.7500532, 1, 0.8627451, 0, 1,
-1.056368, 0.2058288, -1.699861, 1, 0.8705882, 0, 1,
-1.054014, 1.170656, -1.562216, 1, 0.8745098, 0, 1,
-1.051091, 0.2335931, -1.180115, 1, 0.8823529, 0, 1,
-1.03676, -0.9598812, -2.321972, 1, 0.8862745, 0, 1,
-1.032323, -0.1848815, -0.760518, 1, 0.8941177, 0, 1,
-1.027405, -0.4112019, -1.177005, 1, 0.8980392, 0, 1,
-1.020733, 0.1603275, -0.8261253, 1, 0.9058824, 0, 1,
-1.020711, 0.16245, -1.245638, 1, 0.9137255, 0, 1,
-1.019596, 1.228133, -1.026972, 1, 0.9176471, 0, 1,
-1.01052, -0.2121117, -2.215395, 1, 0.9254902, 0, 1,
-1.00605, -1.201347, -1.349678, 1, 0.9294118, 0, 1,
-1.000165, -0.8015924, -0.8731013, 1, 0.9372549, 0, 1,
-0.9950037, 0.687257, -1.106058, 1, 0.9411765, 0, 1,
-0.9946901, 0.4853959, 0.1221043, 1, 0.9490196, 0, 1,
-0.9938341, 1.455756, -0.3831179, 1, 0.9529412, 0, 1,
-0.9916975, -0.7181793, -2.42517, 1, 0.9607843, 0, 1,
-0.9846938, -0.6458582, -1.305979, 1, 0.9647059, 0, 1,
-0.9841043, -0.7313396, -1.591089, 1, 0.972549, 0, 1,
-0.9782353, -0.4169321, -2.846939, 1, 0.9764706, 0, 1,
-0.9779336, 0.2514328, -1.810828, 1, 0.9843137, 0, 1,
-0.9680628, -0.6239437, -3.94398, 1, 0.9882353, 0, 1,
-0.96573, 2.073089, -0.9326961, 1, 0.9960784, 0, 1,
-0.9623536, 1.901972, 0.2845182, 0.9960784, 1, 0, 1,
-0.9595425, -1.292462, -2.133119, 0.9921569, 1, 0, 1,
-0.9493254, -3.433107, -0.7578768, 0.9843137, 1, 0, 1,
-0.9372355, 0.5352644, -2.024611, 0.9803922, 1, 0, 1,
-0.9290998, -0.07500112, -2.240946, 0.972549, 1, 0, 1,
-0.9239509, -0.9506505, -2.02791, 0.9686275, 1, 0, 1,
-0.9162019, -1.066202, -0.4971364, 0.9607843, 1, 0, 1,
-0.9145691, 0.4737571, -0.7274482, 0.9568627, 1, 0, 1,
-0.9078049, 1.504721, 1.337808, 0.9490196, 1, 0, 1,
-0.9049387, -0.5093646, -3.768261, 0.945098, 1, 0, 1,
-0.9043146, -0.5180689, -2.917447, 0.9372549, 1, 0, 1,
-0.9015133, -0.6241471, -2.273093, 0.9333333, 1, 0, 1,
-0.8998864, -0.4064015, -1.444412, 0.9254902, 1, 0, 1,
-0.8882405, 0.4643018, -2.094669, 0.9215686, 1, 0, 1,
-0.874868, 0.2559126, -1.747951, 0.9137255, 1, 0, 1,
-0.8747813, 0.5730419, -0.0775629, 0.9098039, 1, 0, 1,
-0.8716943, -1.098607, -1.510103, 0.9019608, 1, 0, 1,
-0.8660367, -0.8004234, -0.990415, 0.8941177, 1, 0, 1,
-0.8604592, 0.9789508, -2.083404, 0.8901961, 1, 0, 1,
-0.8578687, 0.7851999, -1.277776, 0.8823529, 1, 0, 1,
-0.8451674, 0.6578524, -1.77325, 0.8784314, 1, 0, 1,
-0.8433958, -1.340289, -4.249982, 0.8705882, 1, 0, 1,
-0.8374842, 0.7064803, -1.037858, 0.8666667, 1, 0, 1,
-0.8365659, -0.8289475, -3.406111, 0.8588235, 1, 0, 1,
-0.8272697, -0.1022628, -3.91121, 0.854902, 1, 0, 1,
-0.8231205, 0.7316208, -1.067644, 0.8470588, 1, 0, 1,
-0.8183867, 0.4630039, -1.554976, 0.8431373, 1, 0, 1,
-0.8176463, 0.7891595, -0.4857511, 0.8352941, 1, 0, 1,
-0.8158668, 0.6160362, -1.788956, 0.8313726, 1, 0, 1,
-0.8034368, -0.0783497, -2.054476, 0.8235294, 1, 0, 1,
-0.8021791, -1.142936, -3.109714, 0.8196079, 1, 0, 1,
-0.7983648, -0.02319202, -1.713665, 0.8117647, 1, 0, 1,
-0.795859, 0.8284119, 0.2589622, 0.8078431, 1, 0, 1,
-0.7952264, -0.8220791, -2.291362, 0.8, 1, 0, 1,
-0.7944236, -0.6362862, -3.044238, 0.7921569, 1, 0, 1,
-0.7920784, -1.035971, -2.281512, 0.7882353, 1, 0, 1,
-0.7913513, 0.8577033, -0.1245475, 0.7803922, 1, 0, 1,
-0.7866056, 1.386066, -0.1963808, 0.7764706, 1, 0, 1,
-0.7837612, -1.750431, -3.232747, 0.7686275, 1, 0, 1,
-0.7834868, 0.3713489, -1.787341, 0.7647059, 1, 0, 1,
-0.7827953, -0.3960975, -2.385498, 0.7568628, 1, 0, 1,
-0.7762697, -0.6354744, -2.681791, 0.7529412, 1, 0, 1,
-0.7752671, -0.07351051, -1.333359, 0.7450981, 1, 0, 1,
-0.774232, 0.1695418, -0.7330214, 0.7411765, 1, 0, 1,
-0.7737305, 1.704718, -0.6165477, 0.7333333, 1, 0, 1,
-0.7731035, 0.5160421, -2.195075, 0.7294118, 1, 0, 1,
-0.7682048, 0.9186144, 0.266499, 0.7215686, 1, 0, 1,
-0.7681578, -0.4987772, -1.713277, 0.7176471, 1, 0, 1,
-0.7661224, 1.607995, -0.723487, 0.7098039, 1, 0, 1,
-0.765002, 1.369841, -1.389936, 0.7058824, 1, 0, 1,
-0.7639142, -1.485358, -2.447916, 0.6980392, 1, 0, 1,
-0.748403, -0.3408386, -2.406913, 0.6901961, 1, 0, 1,
-0.7472816, 1.467848, -2.077886, 0.6862745, 1, 0, 1,
-0.7462335, 0.8557764, -0.8404301, 0.6784314, 1, 0, 1,
-0.7455257, -0.8772618, -3.688587, 0.6745098, 1, 0, 1,
-0.7444351, 1.52761, 1.873211, 0.6666667, 1, 0, 1,
-0.7399378, -0.5146292, -3.908388, 0.6627451, 1, 0, 1,
-0.7382619, -1.065602, -4.429736, 0.654902, 1, 0, 1,
-0.7359904, 0.1834591, -1.281075, 0.6509804, 1, 0, 1,
-0.7350799, -0.9615643, -3.26436, 0.6431373, 1, 0, 1,
-0.7322255, -0.1422769, -2.569049, 0.6392157, 1, 0, 1,
-0.7218859, -0.3376499, -2.137844, 0.6313726, 1, 0, 1,
-0.7217554, -0.1405424, -1.689528, 0.627451, 1, 0, 1,
-0.7155917, -0.1153413, -0.6785171, 0.6196079, 1, 0, 1,
-0.7107138, -0.7917038, -2.66125, 0.6156863, 1, 0, 1,
-0.7103302, -0.7649364, -0.9387802, 0.6078432, 1, 0, 1,
-0.7066334, 1.690072, 0.7681038, 0.6039216, 1, 0, 1,
-0.7046221, -1.504135, -3.541374, 0.5960785, 1, 0, 1,
-0.7040229, 0.8083391, 0.03839922, 0.5882353, 1, 0, 1,
-0.7005942, -1.159187, -2.105235, 0.5843138, 1, 0, 1,
-0.7004005, -1.554017, -1.034725, 0.5764706, 1, 0, 1,
-0.6940002, 0.6391624, -0.8177272, 0.572549, 1, 0, 1,
-0.6861749, -0.5225893, -1.411676, 0.5647059, 1, 0, 1,
-0.6852117, -0.8160633, -3.071339, 0.5607843, 1, 0, 1,
-0.680506, -0.390182, -1.247403, 0.5529412, 1, 0, 1,
-0.6785396, 0.09217168, -0.7921818, 0.5490196, 1, 0, 1,
-0.6754004, -1.246542, -4.242658, 0.5411765, 1, 0, 1,
-0.6740767, -0.4553852, -2.938859, 0.5372549, 1, 0, 1,
-0.6736637, -0.2007761, -3.239344, 0.5294118, 1, 0, 1,
-0.6732802, 1.254258, -1.476663, 0.5254902, 1, 0, 1,
-0.667631, 2.208052, -0.5250152, 0.5176471, 1, 0, 1,
-0.6618631, 1.322125, -1.731165, 0.5137255, 1, 0, 1,
-0.6595484, -0.4655142, -3.800492, 0.5058824, 1, 0, 1,
-0.6592658, -0.3766492, -1.236137, 0.5019608, 1, 0, 1,
-0.6580069, 0.5010766, 0.7361693, 0.4941176, 1, 0, 1,
-0.6577898, -1.067666, -2.644839, 0.4862745, 1, 0, 1,
-0.6557748, -1.67934, -0.9731159, 0.4823529, 1, 0, 1,
-0.6543686, 0.6688236, -0.9648101, 0.4745098, 1, 0, 1,
-0.6538814, -0.7254933, -0.1773853, 0.4705882, 1, 0, 1,
-0.6524804, 1.456201, -0.1458226, 0.4627451, 1, 0, 1,
-0.6519195, 1.199707, -0.2622881, 0.4588235, 1, 0, 1,
-0.6499105, -1.026522, -3.035783, 0.4509804, 1, 0, 1,
-0.6470515, -1.931763, -4.087007, 0.4470588, 1, 0, 1,
-0.6453528, -0.3047155, -0.4327438, 0.4392157, 1, 0, 1,
-0.6423694, 0.1257023, -3.085892, 0.4352941, 1, 0, 1,
-0.6346101, -1.247561, -3.119594, 0.427451, 1, 0, 1,
-0.6339417, 0.7216935, -0.9422193, 0.4235294, 1, 0, 1,
-0.6334936, 0.7714541, -2.060557, 0.4156863, 1, 0, 1,
-0.6301129, -0.1462204, -2.084154, 0.4117647, 1, 0, 1,
-0.6243116, -0.6351874, -1.738884, 0.4039216, 1, 0, 1,
-0.6225198, 0.04865992, -0.3560567, 0.3960784, 1, 0, 1,
-0.619894, -0.5820882, -3.666506, 0.3921569, 1, 0, 1,
-0.614938, -1.304134, -2.922337, 0.3843137, 1, 0, 1,
-0.6132774, -0.8650752, -2.975376, 0.3803922, 1, 0, 1,
-0.6040037, -1.114202, -3.240604, 0.372549, 1, 0, 1,
-0.5995542, 2.119499, 0.3610317, 0.3686275, 1, 0, 1,
-0.5988168, -0.05120797, -1.990179, 0.3607843, 1, 0, 1,
-0.5947433, 1.140756, -1.063446, 0.3568628, 1, 0, 1,
-0.5932633, 1.391233, -1.189012, 0.3490196, 1, 0, 1,
-0.5923309, -0.6989774, -2.88203, 0.345098, 1, 0, 1,
-0.5912129, -0.1587663, -3.531917, 0.3372549, 1, 0, 1,
-0.5901786, 0.7565363, -1.871014, 0.3333333, 1, 0, 1,
-0.5900916, -0.5492265, -2.876908, 0.3254902, 1, 0, 1,
-0.5883179, -0.5019445, -2.256405, 0.3215686, 1, 0, 1,
-0.5827679, -0.7053888, -2.498577, 0.3137255, 1, 0, 1,
-0.5767404, 0.9342774, -1.347136, 0.3098039, 1, 0, 1,
-0.5749808, 1.689836, 0.3877277, 0.3019608, 1, 0, 1,
-0.5744989, -0.6657265, -1.204593, 0.2941177, 1, 0, 1,
-0.560873, -1.143716, -1.668901, 0.2901961, 1, 0, 1,
-0.5595406, -1.370279, -1.003108, 0.282353, 1, 0, 1,
-0.5469604, -0.1652984, -1.059254, 0.2784314, 1, 0, 1,
-0.5466324, -0.8893648, -3.026875, 0.2705882, 1, 0, 1,
-0.5452001, -0.3358875, -1.915078, 0.2666667, 1, 0, 1,
-0.5433725, -0.06911316, -0.1595034, 0.2588235, 1, 0, 1,
-0.5426924, -1.360603, -2.351014, 0.254902, 1, 0, 1,
-0.5418215, 1.734445, -0.6451259, 0.2470588, 1, 0, 1,
-0.5378523, 0.5600393, -0.07713551, 0.2431373, 1, 0, 1,
-0.5365398, -0.4819373, -1.593113, 0.2352941, 1, 0, 1,
-0.5359515, -1.082017, -1.635932, 0.2313726, 1, 0, 1,
-0.5354357, 3.005671, 0.3629001, 0.2235294, 1, 0, 1,
-0.5335878, -0.8066639, -2.14922, 0.2196078, 1, 0, 1,
-0.5239601, 0.9620689, -1.051825, 0.2117647, 1, 0, 1,
-0.5226033, 0.5568013, -1.263993, 0.2078431, 1, 0, 1,
-0.5188233, 0.4236057, -1.403385, 0.2, 1, 0, 1,
-0.5151676, 1.95513, 0.5258291, 0.1921569, 1, 0, 1,
-0.5138773, -0.1649404, -2.395575, 0.1882353, 1, 0, 1,
-0.5136421, -1.379563, -2.705121, 0.1803922, 1, 0, 1,
-0.5136383, -0.3547872, -0.9039323, 0.1764706, 1, 0, 1,
-0.5091232, 2.085441, 0.9988124, 0.1686275, 1, 0, 1,
-0.5009739, 1.083673, -0.5683244, 0.1647059, 1, 0, 1,
-0.5007265, -1.101967, -2.099452, 0.1568628, 1, 0, 1,
-0.500559, -2.756178, -3.315553, 0.1529412, 1, 0, 1,
-0.5002355, 0.1123972, 0.9390399, 0.145098, 1, 0, 1,
-0.4999504, 1.239509, -2.079187, 0.1411765, 1, 0, 1,
-0.4960529, 1.526449, 0.367461, 0.1333333, 1, 0, 1,
-0.4949365, 1.208217, -2.163814, 0.1294118, 1, 0, 1,
-0.4945752, -1.961255, -2.771425, 0.1215686, 1, 0, 1,
-0.4909, -1.135547, -5.36172, 0.1176471, 1, 0, 1,
-0.4889193, -0.07926956, -4.866771, 0.1098039, 1, 0, 1,
-0.4862667, 0.8370611, -0.1174946, 0.1058824, 1, 0, 1,
-0.4860124, -0.7209954, -0.8305013, 0.09803922, 1, 0, 1,
-0.4828763, 0.9534714, 1.115954, 0.09019608, 1, 0, 1,
-0.4828556, 0.04331721, -1.268831, 0.08627451, 1, 0, 1,
-0.4827194, 0.4852295, -0.4271154, 0.07843138, 1, 0, 1,
-0.4774762, -0.1126544, -1.16075, 0.07450981, 1, 0, 1,
-0.4773415, 0.5031532, -1.266262, 0.06666667, 1, 0, 1,
-0.4771094, 0.3521497, -1.516975, 0.0627451, 1, 0, 1,
-0.4749578, 0.009364368, -1.212574, 0.05490196, 1, 0, 1,
-0.4742459, -0.4991666, -2.811756, 0.05098039, 1, 0, 1,
-0.4689117, 1.265058, 0.1851058, 0.04313726, 1, 0, 1,
-0.4682261, -1.34096, -2.473148, 0.03921569, 1, 0, 1,
-0.4657316, -0.5235511, -3.783999, 0.03137255, 1, 0, 1,
-0.4569955, -0.07461055, -0.01806135, 0.02745098, 1, 0, 1,
-0.4506438, -0.2274276, -2.758626, 0.01960784, 1, 0, 1,
-0.4493461, -0.4755592, -2.297224, 0.01568628, 1, 0, 1,
-0.4416645, -1.258436, -2.650616, 0.007843138, 1, 0, 1,
-0.4379162, 1.039908, -1.082037, 0.003921569, 1, 0, 1,
-0.4366819, -0.9702805, -0.5811389, 0, 1, 0.003921569, 1,
-0.4344681, -0.1135532, -2.383337, 0, 1, 0.01176471, 1,
-0.4315267, -1.671223, -2.011823, 0, 1, 0.01568628, 1,
-0.4235544, -1.310288, -3.414244, 0, 1, 0.02352941, 1,
-0.4227692, 0.3596125, -1.599288, 0, 1, 0.02745098, 1,
-0.4140708, 0.2991422, 1.107726, 0, 1, 0.03529412, 1,
-0.4130275, -0.7565073, -2.284438, 0, 1, 0.03921569, 1,
-0.4128645, 0.470176, 0.963203, 0, 1, 0.04705882, 1,
-0.4119588, -1.175123, -4.56924, 0, 1, 0.05098039, 1,
-0.4083693, 0.2155147, -2.119381, 0, 1, 0.05882353, 1,
-0.4019441, 0.1942563, -1.585785, 0, 1, 0.0627451, 1,
-0.3997926, -1.470697, -0.167973, 0, 1, 0.07058824, 1,
-0.39893, 1.073865, 0.01258515, 0, 1, 0.07450981, 1,
-0.3916477, -2.457775, -2.227771, 0, 1, 0.08235294, 1,
-0.39145, -1.03345, -2.588773, 0, 1, 0.08627451, 1,
-0.3914047, 0.1410383, -2.024103, 0, 1, 0.09411765, 1,
-0.3897172, -1.677544, -5.058172, 0, 1, 0.1019608, 1,
-0.3860012, -0.1351449, -2.206024, 0, 1, 0.1058824, 1,
-0.384887, -1.405014, -1.434495, 0, 1, 0.1137255, 1,
-0.3826385, -0.09506872, -0.8364861, 0, 1, 0.1176471, 1,
-0.3820536, 0.7338524, -1.840941, 0, 1, 0.1254902, 1,
-0.3789842, -1.24161, -2.347667, 0, 1, 0.1294118, 1,
-0.3787331, -0.01940448, -1.303411, 0, 1, 0.1372549, 1,
-0.3724428, 0.3348276, 0.5705106, 0, 1, 0.1411765, 1,
-0.3716561, 1.828084, 0.1136174, 0, 1, 0.1490196, 1,
-0.3702937, 0.630258, -1.007396, 0, 1, 0.1529412, 1,
-0.3675815, 0.4113286, 0.08860131, 0, 1, 0.1607843, 1,
-0.3673093, 1.367611, -0.3313917, 0, 1, 0.1647059, 1,
-0.3632702, 1.033163, -0.2394461, 0, 1, 0.172549, 1,
-0.3587494, 0.09300441, -1.814453, 0, 1, 0.1764706, 1,
-0.3586694, 1.566049, -0.3306803, 0, 1, 0.1843137, 1,
-0.3566438, -0.4561477, -3.479918, 0, 1, 0.1882353, 1,
-0.356326, 1.147627, 1.048959, 0, 1, 0.1960784, 1,
-0.3434224, -0.0623279, -1.701234, 0, 1, 0.2039216, 1,
-0.3406444, 0.2318541, -1.072935, 0, 1, 0.2078431, 1,
-0.3402988, 0.9518701, -0.7500222, 0, 1, 0.2156863, 1,
-0.3400141, 0.04096857, -1.414904, 0, 1, 0.2196078, 1,
-0.3393115, 1.093657, 0.8094201, 0, 1, 0.227451, 1,
-0.3377913, -0.8927925, -1.226222, 0, 1, 0.2313726, 1,
-0.3367274, 0.2697481, -0.8859976, 0, 1, 0.2392157, 1,
-0.3356596, 1.798394, 0.7098659, 0, 1, 0.2431373, 1,
-0.3317988, 1.777901, -0.4980055, 0, 1, 0.2509804, 1,
-0.3276993, 0.974565, 0.4883476, 0, 1, 0.254902, 1,
-0.3254427, 0.7960006, -1.039082, 0, 1, 0.2627451, 1,
-0.3196652, -0.3714909, -2.691766, 0, 1, 0.2666667, 1,
-0.3147959, -0.7505587, -2.814332, 0, 1, 0.2745098, 1,
-0.3114619, 0.720049, -1.620103, 0, 1, 0.2784314, 1,
-0.3088757, 0.5169668, 0.3541242, 0, 1, 0.2862745, 1,
-0.3081598, -0.0353151, -2.589916, 0, 1, 0.2901961, 1,
-0.306018, -1.161957, -2.625801, 0, 1, 0.2980392, 1,
-0.3057005, 0.1039166, -2.058991, 0, 1, 0.3058824, 1,
-0.3036445, 0.3936048, -2.066804, 0, 1, 0.3098039, 1,
-0.3020101, 0.1001654, -2.484674, 0, 1, 0.3176471, 1,
-0.29989, -0.9724605, -4.483833, 0, 1, 0.3215686, 1,
-0.2974718, 1.589278, 0.0133947, 0, 1, 0.3294118, 1,
-0.2882709, -0.5583256, -2.486225, 0, 1, 0.3333333, 1,
-0.2839958, -0.3230736, -1.578527, 0, 1, 0.3411765, 1,
-0.2831685, 0.4933359, -2.137199, 0, 1, 0.345098, 1,
-0.2795284, -0.2917086, -3.532573, 0, 1, 0.3529412, 1,
-0.2764083, 0.793441, 0.005088486, 0, 1, 0.3568628, 1,
-0.2761036, 0.03099602, -1.14451, 0, 1, 0.3647059, 1,
-0.2751451, 0.05090625, -0.3650869, 0, 1, 0.3686275, 1,
-0.2727322, 2.330666, -1.449241, 0, 1, 0.3764706, 1,
-0.2714555, 0.4883746, -2.079721, 0, 1, 0.3803922, 1,
-0.2701422, -0.9564326, -1.944411, 0, 1, 0.3882353, 1,
-0.2668354, 0.497571, -1.945949, 0, 1, 0.3921569, 1,
-0.2645773, 0.5398744, 0.1214411, 0, 1, 0.4, 1,
-0.2598962, 1.056104, -1.755073, 0, 1, 0.4078431, 1,
-0.2565684, -1.14681, -2.316741, 0, 1, 0.4117647, 1,
-0.2564805, 0.1707678, -1.592904, 0, 1, 0.4196078, 1,
-0.2545801, -1.185989, -0.9367983, 0, 1, 0.4235294, 1,
-0.2527462, -0.683142, -1.741957, 0, 1, 0.4313726, 1,
-0.250487, 0.3756398, -1.528171, 0, 1, 0.4352941, 1,
-0.2474631, -0.229413, -1.987556, 0, 1, 0.4431373, 1,
-0.2463902, -0.3375992, -1.914847, 0, 1, 0.4470588, 1,
-0.2405141, 0.477272, -0.8060965, 0, 1, 0.454902, 1,
-0.2357196, -1.075112, -4.080993, 0, 1, 0.4588235, 1,
-0.231702, 0.1698906, -0.8606896, 0, 1, 0.4666667, 1,
-0.2274865, 0.2281564, -0.1525603, 0, 1, 0.4705882, 1,
-0.2261047, 0.9494079, 0.7786042, 0, 1, 0.4784314, 1,
-0.2239097, 1.278542, 0.3946416, 0, 1, 0.4823529, 1,
-0.2231331, 0.5846581, -1.747983, 0, 1, 0.4901961, 1,
-0.2211616, 1.860504, 0.3579149, 0, 1, 0.4941176, 1,
-0.2210875, 0.0892537, -1.087903, 0, 1, 0.5019608, 1,
-0.2191087, -1.236568, -3.148814, 0, 1, 0.509804, 1,
-0.2187274, -0.8333317, -1.019915, 0, 1, 0.5137255, 1,
-0.2182064, -1.302444, -2.667287, 0, 1, 0.5215687, 1,
-0.2174388, 0.581403, 0.3299469, 0, 1, 0.5254902, 1,
-0.2169313, -0.7116153, -2.837735, 0, 1, 0.5333334, 1,
-0.2167767, 0.4503907, -0.3811659, 0, 1, 0.5372549, 1,
-0.2165122, 0.4548858, 0.5494016, 0, 1, 0.5450981, 1,
-0.2158647, -0.1427809, -2.867368, 0, 1, 0.5490196, 1,
-0.2151974, -0.01219407, -0.656047, 0, 1, 0.5568628, 1,
-0.2143999, -0.2193192, -1.158214, 0, 1, 0.5607843, 1,
-0.214282, -2.336825, -3.38811, 0, 1, 0.5686275, 1,
-0.2120262, -1.881396, -4.194246, 0, 1, 0.572549, 1,
-0.2029898, -1.153016, -2.539513, 0, 1, 0.5803922, 1,
-0.2022315, 0.9720715, 0.7579861, 0, 1, 0.5843138, 1,
-0.199385, 0.3811309, -1.140667, 0, 1, 0.5921569, 1,
-0.1979235, -0.1710459, -3.616948, 0, 1, 0.5960785, 1,
-0.1977842, 0.6867843, -0.8655742, 0, 1, 0.6039216, 1,
-0.1929375, 0.5230048, -0.07014867, 0, 1, 0.6117647, 1,
-0.1834655, 0.1663673, -1.638358, 0, 1, 0.6156863, 1,
-0.1807466, -0.5433998, -2.581435, 0, 1, 0.6235294, 1,
-0.1794503, -0.6602891, -2.258134, 0, 1, 0.627451, 1,
-0.1790234, 0.2844139, -0.3878766, 0, 1, 0.6352941, 1,
-0.1787764, -0.8455593, -3.318656, 0, 1, 0.6392157, 1,
-0.1777579, -0.6800318, -2.533915, 0, 1, 0.6470588, 1,
-0.1767723, -0.003297174, -1.72379, 0, 1, 0.6509804, 1,
-0.1752006, 0.1066109, -0.2261663, 0, 1, 0.6588235, 1,
-0.1739379, -0.6848804, -2.894792, 0, 1, 0.6627451, 1,
-0.1713261, 1.092505, -0.5121392, 0, 1, 0.6705883, 1,
-0.1710186, 0.6728537, -0.06086049, 0, 1, 0.6745098, 1,
-0.1706852, -0.2643166, -2.631637, 0, 1, 0.682353, 1,
-0.1690687, 0.5398716, -1.856284, 0, 1, 0.6862745, 1,
-0.1610624, 1.484311, -1.655274, 0, 1, 0.6941177, 1,
-0.1596841, -1.663239, -1.966213, 0, 1, 0.7019608, 1,
-0.1559702, 1.15308, 1.005338, 0, 1, 0.7058824, 1,
-0.1535822, -0.944823, -2.295333, 0, 1, 0.7137255, 1,
-0.1531571, 0.02461957, -0.3331403, 0, 1, 0.7176471, 1,
-0.152668, 1.041684, -1.869702, 0, 1, 0.7254902, 1,
-0.1510194, 0.4578462, -2.313884, 0, 1, 0.7294118, 1,
-0.1504374, -0.1821415, -1.008754, 0, 1, 0.7372549, 1,
-0.1468893, -0.02551849, -0.5170972, 0, 1, 0.7411765, 1,
-0.1450802, 0.2124768, -1.818141, 0, 1, 0.7490196, 1,
-0.1418718, -0.2297086, -3.380725, 0, 1, 0.7529412, 1,
-0.140576, -1.18531, -2.779385, 0, 1, 0.7607843, 1,
-0.1300253, 0.3266532, -0.6561018, 0, 1, 0.7647059, 1,
-0.1265064, 0.191382, -1.521737, 0, 1, 0.772549, 1,
-0.1257763, 1.448156, -0.4881216, 0, 1, 0.7764706, 1,
-0.1242262, 1.196132, -0.1609287, 0, 1, 0.7843137, 1,
-0.1216788, 1.324272, 0.6219951, 0, 1, 0.7882353, 1,
-0.1169325, 0.6439836, -0.166372, 0, 1, 0.7960784, 1,
-0.1166728, -0.9907903, -2.306875, 0, 1, 0.8039216, 1,
-0.1080005, -0.01831465, -4.213506, 0, 1, 0.8078431, 1,
-0.1021662, -1.714381, -3.422004, 0, 1, 0.8156863, 1,
-0.1021658, 1.740413, 0.5898142, 0, 1, 0.8196079, 1,
-0.09907356, 1.678934, -0.915029, 0, 1, 0.827451, 1,
-0.09413505, -1.586623, -3.582036, 0, 1, 0.8313726, 1,
-0.09144746, 1.18205, -0.806976, 0, 1, 0.8392157, 1,
-0.08958343, -0.6505442, -2.153755, 0, 1, 0.8431373, 1,
-0.08610826, 0.3128062, -0.8080273, 0, 1, 0.8509804, 1,
-0.08206894, -1.835023, -3.929092, 0, 1, 0.854902, 1,
-0.07858963, -0.3479501, -2.307579, 0, 1, 0.8627451, 1,
-0.07466534, -0.6637207, -2.476915, 0, 1, 0.8666667, 1,
-0.07282483, 0.1923391, 0.09467583, 0, 1, 0.8745098, 1,
-0.06937133, 1.370186, -0.5887978, 0, 1, 0.8784314, 1,
-0.06712998, 1.048822, 0.2017716, 0, 1, 0.8862745, 1,
-0.06434982, 0.2816111, -0.8852285, 0, 1, 0.8901961, 1,
-0.06161476, 0.1876511, -0.0538698, 0, 1, 0.8980392, 1,
-0.06103547, 1.488686, 1.426242, 0, 1, 0.9058824, 1,
-0.05797624, -0.616354, -3.450666, 0, 1, 0.9098039, 1,
-0.05450051, 0.1558139, -1.121691, 0, 1, 0.9176471, 1,
-0.0527008, 0.2615503, -0.5598003, 0, 1, 0.9215686, 1,
-0.05264377, 0.8063003, 2.110609, 0, 1, 0.9294118, 1,
-0.05158454, -0.04709621, -2.862999, 0, 1, 0.9333333, 1,
-0.05089405, 0.1190274, 1.105349, 0, 1, 0.9411765, 1,
-0.04812967, -0.2112454, -2.012458, 0, 1, 0.945098, 1,
-0.04719216, 0.7873133, -0.8621246, 0, 1, 0.9529412, 1,
-0.0439357, -0.6411713, -3.131799, 0, 1, 0.9568627, 1,
-0.03978409, -0.9042743, -5.262208, 0, 1, 0.9647059, 1,
-0.03718336, -0.8508962, -4.190492, 0, 1, 0.9686275, 1,
-0.03576588, -1.547526, -2.867825, 0, 1, 0.9764706, 1,
-0.03573604, 0.2763807, -0.6686217, 0, 1, 0.9803922, 1,
-0.035679, 1.535536, 1.454728, 0, 1, 0.9882353, 1,
-0.0354106, -1.535015, -2.781552, 0, 1, 0.9921569, 1,
-0.03419404, -1.097697, -2.870187, 0, 1, 1, 1,
-0.0289759, -0.7683405, -2.810364, 0, 0.9921569, 1, 1,
-0.02678272, 0.2837803, -0.1774992, 0, 0.9882353, 1, 1,
-0.02658221, 0.566943, 0.3956513, 0, 0.9803922, 1, 1,
-0.02640231, -0.2348996, -3.773835, 0, 0.9764706, 1, 1,
-0.0252946, 0.08974084, -1.496428, 0, 0.9686275, 1, 1,
-0.02527092, 1.435718, 0.7427231, 0, 0.9647059, 1, 1,
-0.02347334, 0.8241183, -1.012456, 0, 0.9568627, 1, 1,
-0.02262529, -0.8514443, -2.726106, 0, 0.9529412, 1, 1,
-0.0207031, -1.268922, -4.372754, 0, 0.945098, 1, 1,
-0.01948491, -0.5679374, -3.734555, 0, 0.9411765, 1, 1,
-0.01648619, -0.1418778, -3.261245, 0, 0.9333333, 1, 1,
-0.01020255, 1.362479, -0.03383702, 0, 0.9294118, 1, 1,
-0.005774339, -0.9108312, -3.163428, 0, 0.9215686, 1, 1,
-0.0002132547, 1.267779, -0.2331219, 0, 0.9176471, 1, 1,
0.002965638, 0.3661323, -0.2878321, 0, 0.9098039, 1, 1,
0.004137549, -1.072555, 3.48513, 0, 0.9058824, 1, 1,
0.006707051, 0.211662, 1.183097, 0, 0.8980392, 1, 1,
0.007191563, -0.3939173, 2.00983, 0, 0.8901961, 1, 1,
0.009790067, -0.313923, 3.820506, 0, 0.8862745, 1, 1,
0.01192667, 0.0609546, 0.9571012, 0, 0.8784314, 1, 1,
0.01491818, 0.2224743, 0.6905056, 0, 0.8745098, 1, 1,
0.0246504, 0.6370139, -0.7408649, 0, 0.8666667, 1, 1,
0.02699664, 0.6206414, 0.7073964, 0, 0.8627451, 1, 1,
0.02853923, -1.668813, 2.393751, 0, 0.854902, 1, 1,
0.0291128, 0.01265498, 1.708479, 0, 0.8509804, 1, 1,
0.03219522, -0.009612022, 3.204085, 0, 0.8431373, 1, 1,
0.03355938, 0.7581509, -2.145043, 0, 0.8392157, 1, 1,
0.03573496, -0.026965, 4.692041, 0, 0.8313726, 1, 1,
0.03680996, -0.4297372, 3.132843, 0, 0.827451, 1, 1,
0.03849407, -2.015945, 5.272085, 0, 0.8196079, 1, 1,
0.04061422, 1.005338, 0.268241, 0, 0.8156863, 1, 1,
0.04659417, -0.8337181, 1.698833, 0, 0.8078431, 1, 1,
0.0505052, -0.127266, 3.685559, 0, 0.8039216, 1, 1,
0.05228526, -1.130829, 2.617387, 0, 0.7960784, 1, 1,
0.0549137, 0.004456458, 0.3077398, 0, 0.7882353, 1, 1,
0.05664358, 1.087438, 1.990283, 0, 0.7843137, 1, 1,
0.06066287, 0.3835696, -0.207646, 0, 0.7764706, 1, 1,
0.06086405, -0.791137, 1.440603, 0, 0.772549, 1, 1,
0.06181, -0.9777856, 3.523079, 0, 0.7647059, 1, 1,
0.06338368, 0.561208, -1.086447, 0, 0.7607843, 1, 1,
0.06630383, 0.5673167, 2.851177, 0, 0.7529412, 1, 1,
0.07275703, 0.3389942, 1.703929, 0, 0.7490196, 1, 1,
0.07339159, -1.876361, 3.337628, 0, 0.7411765, 1, 1,
0.07377517, 0.3646794, 0.1435809, 0, 0.7372549, 1, 1,
0.07642751, -1.449232, 3.514957, 0, 0.7294118, 1, 1,
0.0829538, -0.2959192, 3.955903, 0, 0.7254902, 1, 1,
0.08329614, 0.9592082, 0.8809143, 0, 0.7176471, 1, 1,
0.08673327, -0.7801705, 2.451687, 0, 0.7137255, 1, 1,
0.08878578, 0.2662755, 1.503364, 0, 0.7058824, 1, 1,
0.08900154, -0.2079279, 0.9419378, 0, 0.6980392, 1, 1,
0.08922233, 0.3485375, 1.452893, 0, 0.6941177, 1, 1,
0.08932582, -0.933526, 1.310524, 0, 0.6862745, 1, 1,
0.09021111, 1.331005, -1.652755, 0, 0.682353, 1, 1,
0.1002674, -1.791911, 1.614034, 0, 0.6745098, 1, 1,
0.1019529, -0.02561362, 1.056278, 0, 0.6705883, 1, 1,
0.1026708, -0.2646617, 2.938781, 0, 0.6627451, 1, 1,
0.1033242, -0.2053819, 3.053679, 0, 0.6588235, 1, 1,
0.1040398, 1.344463, -0.8656465, 0, 0.6509804, 1, 1,
0.1091282, 0.2550792, 0.2892297, 0, 0.6470588, 1, 1,
0.1092582, 0.01812137, 0.3086507, 0, 0.6392157, 1, 1,
0.1149979, 0.4607559, 1.553668, 0, 0.6352941, 1, 1,
0.1169703, 0.9684476, -1.045032, 0, 0.627451, 1, 1,
0.1189786, -1.359766, 3.079583, 0, 0.6235294, 1, 1,
0.1206803, 1.083916, 1.426421, 0, 0.6156863, 1, 1,
0.1314385, 0.8800326, 0.2719486, 0, 0.6117647, 1, 1,
0.1322303, 0.4716656, -1.195379, 0, 0.6039216, 1, 1,
0.1337644, -1.000864, 1.308267, 0, 0.5960785, 1, 1,
0.139724, -0.06918065, 1.943552, 0, 0.5921569, 1, 1,
0.1402466, -1.100831, 2.282041, 0, 0.5843138, 1, 1,
0.1438578, -1.526835, 4.16694, 0, 0.5803922, 1, 1,
0.1485622, 2.146605, 0.2643019, 0, 0.572549, 1, 1,
0.1490237, -1.362596, 3.357333, 0, 0.5686275, 1, 1,
0.1517241, 0.9104021, 0.1353688, 0, 0.5607843, 1, 1,
0.1550079, -0.6454799, 2.461408, 0, 0.5568628, 1, 1,
0.1585357, -0.2704231, 2.755549, 0, 0.5490196, 1, 1,
0.1602032, -0.5711415, 2.498619, 0, 0.5450981, 1, 1,
0.1685782, 0.02478214, 0.8529596, 0, 0.5372549, 1, 1,
0.1791959, -1.612572, 2.747673, 0, 0.5333334, 1, 1,
0.179729, -0.6759743, 5.441731, 0, 0.5254902, 1, 1,
0.1805929, 1.343926, -1.048826, 0, 0.5215687, 1, 1,
0.1826204, -0.9755264, 3.766045, 0, 0.5137255, 1, 1,
0.1838324, 0.3522775, 2.435684, 0, 0.509804, 1, 1,
0.1852309, -0.2810908, 3.039303, 0, 0.5019608, 1, 1,
0.1864017, 0.7956762, 1.334784, 0, 0.4941176, 1, 1,
0.1873185, -0.05078921, 2.848508, 0, 0.4901961, 1, 1,
0.1887109, 0.9031622, 0.1504002, 0, 0.4823529, 1, 1,
0.1892953, -0.3812065, 3.584736, 0, 0.4784314, 1, 1,
0.2010346, 0.1887242, 0.6967802, 0, 0.4705882, 1, 1,
0.2023289, 0.6226209, 0.5938423, 0, 0.4666667, 1, 1,
0.2063879, -0.1580853, 3.211056, 0, 0.4588235, 1, 1,
0.2064439, 1.885372, 0.01190945, 0, 0.454902, 1, 1,
0.2088944, 0.9111019, 1.103296, 0, 0.4470588, 1, 1,
0.2106126, 1.397074, 0.1352503, 0, 0.4431373, 1, 1,
0.2122696, -0.5853379, 0.7275144, 0, 0.4352941, 1, 1,
0.2151514, -1.022702, 2.47133, 0, 0.4313726, 1, 1,
0.2163002, 1.571037, 0.7276375, 0, 0.4235294, 1, 1,
0.2220427, 0.9336717, 0.1194809, 0, 0.4196078, 1, 1,
0.2221067, 0.5057144, 0.8039706, 0, 0.4117647, 1, 1,
0.2317079, 0.2115971, 2.209991, 0, 0.4078431, 1, 1,
0.2322952, 0.6842709, 0.5063168, 0, 0.4, 1, 1,
0.2374304, 0.2747521, 0.3323445, 0, 0.3921569, 1, 1,
0.2375805, 0.2783449, -0.07628004, 0, 0.3882353, 1, 1,
0.2384457, -0.4941255, 2.676366, 0, 0.3803922, 1, 1,
0.2415151, -1.02612, 4.040051, 0, 0.3764706, 1, 1,
0.2420616, -0.438058, 1.876133, 0, 0.3686275, 1, 1,
0.2451041, -0.4233674, 3.688636, 0, 0.3647059, 1, 1,
0.248182, -0.8200577, 3.750973, 0, 0.3568628, 1, 1,
0.2521594, 0.9968069, 1.850793, 0, 0.3529412, 1, 1,
0.2530682, 1.329184, -1.300785, 0, 0.345098, 1, 1,
0.2551157, 0.1596448, 1.710539, 0, 0.3411765, 1, 1,
0.2564777, 0.2166745, 0.9138293, 0, 0.3333333, 1, 1,
0.2593199, -0.01097452, 2.166831, 0, 0.3294118, 1, 1,
0.2611499, -0.2545352, 3.330452, 0, 0.3215686, 1, 1,
0.2622285, -0.6309906, 4.299603, 0, 0.3176471, 1, 1,
0.2623918, 0.3179646, 0.09437263, 0, 0.3098039, 1, 1,
0.2625065, 0.8233896, 1.173947, 0, 0.3058824, 1, 1,
0.2632092, 0.8142883, -0.7157384, 0, 0.2980392, 1, 1,
0.2632464, 0.02304352, 0.5735999, 0, 0.2901961, 1, 1,
0.2737219, -1.034705, 2.837435, 0, 0.2862745, 1, 1,
0.2746212, 0.3254305, 2.728082, 0, 0.2784314, 1, 1,
0.2800399, 0.3213876, 1.939488, 0, 0.2745098, 1, 1,
0.2850538, -0.8177453, 2.750976, 0, 0.2666667, 1, 1,
0.285575, 0.2842884, 0.5585902, 0, 0.2627451, 1, 1,
0.2855791, 0.7966587, 1.484104, 0, 0.254902, 1, 1,
0.2856876, -0.5779424, 1.567527, 0, 0.2509804, 1, 1,
0.2857341, -1.58351, 1.607124, 0, 0.2431373, 1, 1,
0.2883251, 0.3650001, 1.953002, 0, 0.2392157, 1, 1,
0.2969142, 0.4799054, 1.674523, 0, 0.2313726, 1, 1,
0.2993151, -0.9678819, 3.756703, 0, 0.227451, 1, 1,
0.2999643, -0.02718028, 1.064818, 0, 0.2196078, 1, 1,
0.3122686, 0.9031335, 0.3896213, 0, 0.2156863, 1, 1,
0.3132772, -1.081808, 1.629586, 0, 0.2078431, 1, 1,
0.3165598, 1.278636, 0.3802619, 0, 0.2039216, 1, 1,
0.326083, -0.1501326, 0.6355245, 0, 0.1960784, 1, 1,
0.3284069, -0.6153278, 2.827441, 0, 0.1882353, 1, 1,
0.3316784, 0.8997152, -1.422465, 0, 0.1843137, 1, 1,
0.3334016, 0.02227841, 0.7549567, 0, 0.1764706, 1, 1,
0.3363095, -0.06734361, 2.648457, 0, 0.172549, 1, 1,
0.3384674, -0.3063421, 0.7864041, 0, 0.1647059, 1, 1,
0.3415864, 1.671458, 0.5077121, 0, 0.1607843, 1, 1,
0.341755, -0.7481679, 2.055893, 0, 0.1529412, 1, 1,
0.3460908, 0.8306872, -0.3874959, 0, 0.1490196, 1, 1,
0.347706, -0.1214322, 2.169735, 0, 0.1411765, 1, 1,
0.3488526, -0.8697631, 1.769617, 0, 0.1372549, 1, 1,
0.3491492, -0.6525089, 4.202054, 0, 0.1294118, 1, 1,
0.3507684, 0.4485708, 0.7200174, 0, 0.1254902, 1, 1,
0.353887, -0.711689, 2.622708, 0, 0.1176471, 1, 1,
0.35431, 0.3927124, 1.143167, 0, 0.1137255, 1, 1,
0.3603894, 0.192841, 1.153708, 0, 0.1058824, 1, 1,
0.3615489, 2.46475, 0.08185789, 0, 0.09803922, 1, 1,
0.3637909, 1.080745, -0.2723041, 0, 0.09411765, 1, 1,
0.3703831, -0.6780838, 2.371897, 0, 0.08627451, 1, 1,
0.371405, 0.772846, 1.567336, 0, 0.08235294, 1, 1,
0.3805492, 1.068037, 0.7226201, 0, 0.07450981, 1, 1,
0.3837066, -0.7125885, 1.726834, 0, 0.07058824, 1, 1,
0.3885954, -0.02956762, -0.1916988, 0, 0.0627451, 1, 1,
0.3913816, 1.112955, -0.2239033, 0, 0.05882353, 1, 1,
0.3924879, -2.295429, 2.869095, 0, 0.05098039, 1, 1,
0.3945961, 0.3679481, 2.260043, 0, 0.04705882, 1, 1,
0.3950804, 0.2632734, 0.05168836, 0, 0.03921569, 1, 1,
0.3956842, 0.498362, 1.230636, 0, 0.03529412, 1, 1,
0.3970442, 0.1511681, 0.9894229, 0, 0.02745098, 1, 1,
0.4051475, -0.1583132, 1.546197, 0, 0.02352941, 1, 1,
0.4109839, 1.898536, -0.7587448, 0, 0.01568628, 1, 1,
0.413545, 0.3624098, 0.1069402, 0, 0.01176471, 1, 1,
0.4189041, 0.9887546, 1.058197, 0, 0.003921569, 1, 1,
0.4213448, 1.113395, 1.311688, 0.003921569, 0, 1, 1,
0.4215891, 0.2299552, 1.348108, 0.007843138, 0, 1, 1,
0.421849, 2.13983, -2.479395, 0.01568628, 0, 1, 1,
0.4275671, 0.5602517, 0.2172306, 0.01960784, 0, 1, 1,
0.4316453, 0.2924853, 1.587261, 0.02745098, 0, 1, 1,
0.4352194, 0.1252434, 0.8821338, 0.03137255, 0, 1, 1,
0.4362607, -0.8265898, 2.727548, 0.03921569, 0, 1, 1,
0.4436857, -1.350002, 0.3962882, 0.04313726, 0, 1, 1,
0.4479946, -0.886297, 1.279968, 0.05098039, 0, 1, 1,
0.449899, 1.247384, 0.0583633, 0.05490196, 0, 1, 1,
0.4532342, 1.750846, 1.365842, 0.0627451, 0, 1, 1,
0.45406, -1.084146, 2.680794, 0.06666667, 0, 1, 1,
0.4548641, 0.4099614, 1.13827, 0.07450981, 0, 1, 1,
0.456325, 0.1183746, 0.2562725, 0.07843138, 0, 1, 1,
0.4591083, -0.8766146, 3.124127, 0.08627451, 0, 1, 1,
0.4593691, -0.3955289, 2.388686, 0.09019608, 0, 1, 1,
0.4643804, -0.03770859, 0.8264279, 0.09803922, 0, 1, 1,
0.470735, -0.09051304, 1.21888, 0.1058824, 0, 1, 1,
0.4766047, -0.5769278, 2.294907, 0.1098039, 0, 1, 1,
0.4770955, 0.5487167, -0.2367125, 0.1176471, 0, 1, 1,
0.4828075, 1.641834, -1.153081, 0.1215686, 0, 1, 1,
0.4870189, -2.362029, 1.183817, 0.1294118, 0, 1, 1,
0.4898763, 1.705417, -1.249672, 0.1333333, 0, 1, 1,
0.4924589, -0.6070972, 4.190316, 0.1411765, 0, 1, 1,
0.494171, 0.8635121, 1.070579, 0.145098, 0, 1, 1,
0.4956347, 0.1512364, 1.039554, 0.1529412, 0, 1, 1,
0.495838, -0.849488, 4.225379, 0.1568628, 0, 1, 1,
0.4960035, 1.528476, 0.009948941, 0.1647059, 0, 1, 1,
0.4969212, -0.8259968, 2.928893, 0.1686275, 0, 1, 1,
0.4969516, 1.23073, 0.4949952, 0.1764706, 0, 1, 1,
0.498533, -0.8933322, 2.244559, 0.1803922, 0, 1, 1,
0.4992259, -0.6321375, 3.187765, 0.1882353, 0, 1, 1,
0.5004137, 0.7085466, 1.159026, 0.1921569, 0, 1, 1,
0.5019197, 0.5799886, 0.9487031, 0.2, 0, 1, 1,
0.5052118, -0.8025892, 2.315351, 0.2078431, 0, 1, 1,
0.5104249, -0.6526152, 1.677876, 0.2117647, 0, 1, 1,
0.5152884, -0.8176229, 4.000098, 0.2196078, 0, 1, 1,
0.5179001, -0.8280965, 1.201907, 0.2235294, 0, 1, 1,
0.5180826, -0.1287364, 0.03490585, 0.2313726, 0, 1, 1,
0.5194783, 1.298224, -0.1985928, 0.2352941, 0, 1, 1,
0.521496, -1.275677, 2.599272, 0.2431373, 0, 1, 1,
0.5276131, -0.4469801, 3.336539, 0.2470588, 0, 1, 1,
0.5312731, -0.435642, 3.515989, 0.254902, 0, 1, 1,
0.5358985, -0.5634553, 1.433594, 0.2588235, 0, 1, 1,
0.5376862, 2.523271, -0.4335162, 0.2666667, 0, 1, 1,
0.552626, -0.673486, 3.923277, 0.2705882, 0, 1, 1,
0.5654338, 1.319189, -1.314, 0.2784314, 0, 1, 1,
0.5657473, 0.2722037, 1.055756, 0.282353, 0, 1, 1,
0.5716948, -0.7445724, 2.425991, 0.2901961, 0, 1, 1,
0.5728027, 0.4411702, 0.2569622, 0.2941177, 0, 1, 1,
0.5731501, -1.938815, 2.876302, 0.3019608, 0, 1, 1,
0.573563, -0.4466538, 0.7540851, 0.3098039, 0, 1, 1,
0.5753174, 0.5393408, 1.009227, 0.3137255, 0, 1, 1,
0.5763667, 0.4509441, -1.031558, 0.3215686, 0, 1, 1,
0.5767046, 0.761286, 1.479657, 0.3254902, 0, 1, 1,
0.5767127, -0.4027088, 0.9837108, 0.3333333, 0, 1, 1,
0.5852648, -0.2836738, 1.861564, 0.3372549, 0, 1, 1,
0.585526, -0.1806751, 1.823216, 0.345098, 0, 1, 1,
0.5865788, -0.4035367, 1.924376, 0.3490196, 0, 1, 1,
0.5878415, 1.411918, 0.06118929, 0.3568628, 0, 1, 1,
0.5914202, -0.03836469, 2.61224, 0.3607843, 0, 1, 1,
0.5924162, -0.1482272, 2.025168, 0.3686275, 0, 1, 1,
0.5946893, 0.9361775, 2.337485, 0.372549, 0, 1, 1,
0.5969997, -1.824729, 2.65445, 0.3803922, 0, 1, 1,
0.597711, 1.299827, -0.2745819, 0.3843137, 0, 1, 1,
0.6025353, 0.8466969, 0.09772474, 0.3921569, 0, 1, 1,
0.6089116, -0.8122128, 1.949528, 0.3960784, 0, 1, 1,
0.6101001, 0.2137729, 0.5243724, 0.4039216, 0, 1, 1,
0.6106312, -0.63988, 2.520601, 0.4117647, 0, 1, 1,
0.6184072, 1.450098, 0.07882321, 0.4156863, 0, 1, 1,
0.6186084, -0.3006558, 1.07507, 0.4235294, 0, 1, 1,
0.6214457, -1.333279, 2.985589, 0.427451, 0, 1, 1,
0.6267074, 0.7587271, 0.1502778, 0.4352941, 0, 1, 1,
0.6272441, 0.9241557, 1.512426, 0.4392157, 0, 1, 1,
0.6319769, -0.4708504, 2.707214, 0.4470588, 0, 1, 1,
0.6338087, -0.6631638, 5.578869, 0.4509804, 0, 1, 1,
0.636308, 2.093181, 0.6887223, 0.4588235, 0, 1, 1,
0.6382528, 0.8947637, 2.053298, 0.4627451, 0, 1, 1,
0.6465074, -0.6304688, 2.607482, 0.4705882, 0, 1, 1,
0.6470723, 0.07660387, 1.483951, 0.4745098, 0, 1, 1,
0.6538181, -0.5737314, 2.638697, 0.4823529, 0, 1, 1,
0.6539394, -0.0424855, 0.8919449, 0.4862745, 0, 1, 1,
0.6593678, 1.471657, -0.7393981, 0.4941176, 0, 1, 1,
0.6595483, 0.8047823, -0.5928318, 0.5019608, 0, 1, 1,
0.6659641, -1.423344, 3.185706, 0.5058824, 0, 1, 1,
0.6677428, -0.9432817, 1.710581, 0.5137255, 0, 1, 1,
0.6683867, -0.7763386, 2.919098, 0.5176471, 0, 1, 1,
0.6732044, -1.097524, 3.451646, 0.5254902, 0, 1, 1,
0.6785429, 0.04761805, 2.282657, 0.5294118, 0, 1, 1,
0.6797612, 0.1615141, 1.249926, 0.5372549, 0, 1, 1,
0.6909457, -0.01133402, 2.476443, 0.5411765, 0, 1, 1,
0.6913148, -0.5909051, 2.101592, 0.5490196, 0, 1, 1,
0.6952786, -0.7290851, 2.517707, 0.5529412, 0, 1, 1,
0.6957607, -0.834605, 1.769491, 0.5607843, 0, 1, 1,
0.6992939, 0.6018565, -0.3507878, 0.5647059, 0, 1, 1,
0.7002373, 0.1486203, 0.964245, 0.572549, 0, 1, 1,
0.7084956, 0.5744168, 1.211795, 0.5764706, 0, 1, 1,
0.7138387, 0.4578584, -0.4225925, 0.5843138, 0, 1, 1,
0.7152429, -1.759522, 3.621008, 0.5882353, 0, 1, 1,
0.7182504, -0.9889317, 0.4610203, 0.5960785, 0, 1, 1,
0.7305734, -0.260116, 0.6746119, 0.6039216, 0, 1, 1,
0.7343889, 0.02275965, 1.098891, 0.6078432, 0, 1, 1,
0.7377677, 0.1530057, 1.075091, 0.6156863, 0, 1, 1,
0.7432644, 0.1419674, -0.3647562, 0.6196079, 0, 1, 1,
0.744403, 1.755437, -0.7092317, 0.627451, 0, 1, 1,
0.7474284, 0.4585348, 0.2366021, 0.6313726, 0, 1, 1,
0.7477151, 0.4106984, 0.7155573, 0.6392157, 0, 1, 1,
0.749738, 0.3069062, 0.9244285, 0.6431373, 0, 1, 1,
0.7520737, -1.89158, 3.066536, 0.6509804, 0, 1, 1,
0.7534553, 0.5463578, 0.841125, 0.654902, 0, 1, 1,
0.7568445, 0.3580085, 1.295876, 0.6627451, 0, 1, 1,
0.7584041, 0.8703957, 1.019833, 0.6666667, 0, 1, 1,
0.7600366, 0.09002474, -0.6919702, 0.6745098, 0, 1, 1,
0.7627285, -0.0242968, 3.331282, 0.6784314, 0, 1, 1,
0.7716957, -1.548767, 0.9890394, 0.6862745, 0, 1, 1,
0.7736312, 1.304069, -0.3722597, 0.6901961, 0, 1, 1,
0.774639, 0.05974257, 0.01928976, 0.6980392, 0, 1, 1,
0.7861784, -0.8358992, 3.434948, 0.7058824, 0, 1, 1,
0.7863471, -0.2578276, 1.184462, 0.7098039, 0, 1, 1,
0.7962675, 2.363774, 2.923383, 0.7176471, 0, 1, 1,
0.7982126, -1.392874, 0.6211721, 0.7215686, 0, 1, 1,
0.8017249, -1.637893, 0.936609, 0.7294118, 0, 1, 1,
0.8034623, -0.4007958, 2.769551, 0.7333333, 0, 1, 1,
0.8061506, -0.4895125, 3.280135, 0.7411765, 0, 1, 1,
0.8097339, -0.1332179, 1.655157, 0.7450981, 0, 1, 1,
0.8222802, -2.02801, 0.9285203, 0.7529412, 0, 1, 1,
0.8248652, -1.442716, 4.030459, 0.7568628, 0, 1, 1,
0.8250138, -1.036164, 2.249708, 0.7647059, 0, 1, 1,
0.825083, 0.00475955, 1.161253, 0.7686275, 0, 1, 1,
0.826945, 0.4600731, -0.06957195, 0.7764706, 0, 1, 1,
0.8338813, -0.345909, 2.533887, 0.7803922, 0, 1, 1,
0.8361746, 0.1074586, -1.007257, 0.7882353, 0, 1, 1,
0.8464466, 1.304227, 0.3025159, 0.7921569, 0, 1, 1,
0.8494377, 1.098353, 0.2578688, 0.8, 0, 1, 1,
0.8520069, 0.4444257, 0.01638501, 0.8078431, 0, 1, 1,
0.8551807, 0.6770978, 0.4614102, 0.8117647, 0, 1, 1,
0.8558756, 0.4373949, 3.18755, 0.8196079, 0, 1, 1,
0.8575041, -0.297969, 1.002333, 0.8235294, 0, 1, 1,
0.8578175, 0.02613322, 0.8554488, 0.8313726, 0, 1, 1,
0.8602734, 0.7422609, 1.898266, 0.8352941, 0, 1, 1,
0.8671014, 0.258865, 0.9167274, 0.8431373, 0, 1, 1,
0.8675057, -0.0387021, 2.19319, 0.8470588, 0, 1, 1,
0.8735024, -0.02270236, 1.678259, 0.854902, 0, 1, 1,
0.8783808, 0.5207021, 2.554497, 0.8588235, 0, 1, 1,
0.8786983, 1.517408, 1.330185, 0.8666667, 0, 1, 1,
0.8793115, 0.1261307, 1.206951, 0.8705882, 0, 1, 1,
0.879474, 0.05056614, 0.8084823, 0.8784314, 0, 1, 1,
0.8797259, -1.790378, 4.05379, 0.8823529, 0, 1, 1,
0.8819025, -0.1575103, 2.410261, 0.8901961, 0, 1, 1,
0.8846425, -0.4278649, 1.261078, 0.8941177, 0, 1, 1,
0.8899958, -0.4292254, -0.1202656, 0.9019608, 0, 1, 1,
0.8906221, 0.03217038, 0.2419347, 0.9098039, 0, 1, 1,
0.8913918, 1.250259, 1.69454, 0.9137255, 0, 1, 1,
0.8935027, -0.01921172, 2.533088, 0.9215686, 0, 1, 1,
0.8969572, 0.5127466, 1.58513, 0.9254902, 0, 1, 1,
0.8980329, 0.7146672, 1.194486, 0.9333333, 0, 1, 1,
0.9016608, 1.996678, -0.2187014, 0.9372549, 0, 1, 1,
0.9045473, -1.498429, 3.354574, 0.945098, 0, 1, 1,
0.9059216, 0.3678172, 2.023208, 0.9490196, 0, 1, 1,
0.9067597, -1.272644, 3.234386, 0.9568627, 0, 1, 1,
0.9068334, 0.9562866, 0.8215327, 0.9607843, 0, 1, 1,
0.9074337, -0.8458079, 2.026943, 0.9686275, 0, 1, 1,
0.9152487, 1.223848, 1.34661, 0.972549, 0, 1, 1,
0.916673, -0.01052213, 2.24176, 0.9803922, 0, 1, 1,
0.9197137, 0.244387, 1.740027, 0.9843137, 0, 1, 1,
0.9198922, -0.3898186, 0.6435585, 0.9921569, 0, 1, 1,
0.9355072, -0.2694805, 2.683142, 0.9960784, 0, 1, 1,
0.9370849, -0.3084067, 1.561783, 1, 0, 0.9960784, 1,
0.9376182, -1.344747, 1.718106, 1, 0, 0.9882353, 1,
0.9403704, -0.3975778, 2.320297, 1, 0, 0.9843137, 1,
0.9429462, 0.5158919, 0.7095616, 1, 0, 0.9764706, 1,
0.9438648, -0.1773514, 3.392036, 1, 0, 0.972549, 1,
0.9448109, 1.944687, -1.654948, 1, 0, 0.9647059, 1,
0.9454859, 0.4653691, 3.397857, 1, 0, 0.9607843, 1,
0.9621283, -0.01583328, 1.676397, 1, 0, 0.9529412, 1,
0.9634047, 0.2076884, 0.2716721, 1, 0, 0.9490196, 1,
0.9702587, -1.611854, 2.624147, 1, 0, 0.9411765, 1,
0.9862452, -2.501155, 2.659583, 1, 0, 0.9372549, 1,
0.9871963, 0.590203, 1.280541, 1, 0, 0.9294118, 1,
0.9878779, 0.7445118, 0.581351, 1, 0, 0.9254902, 1,
0.9956897, 0.3139486, 1.802824, 1, 0, 0.9176471, 1,
0.9980695, 0.9338329, 0.7512499, 1, 0, 0.9137255, 1,
1.012729, 0.8646618, 0.3889485, 1, 0, 0.9058824, 1,
1.015048, -2.084274, 2.68332, 1, 0, 0.9019608, 1,
1.016737, 0.09367403, 0.309453, 1, 0, 0.8941177, 1,
1.017903, -0.02632944, 1.582635, 1, 0, 0.8862745, 1,
1.018068, 0.2684492, 1.164495, 1, 0, 0.8823529, 1,
1.021003, -0.3525043, 2.25282, 1, 0, 0.8745098, 1,
1.023281, 0.1667943, -0.1117768, 1, 0, 0.8705882, 1,
1.026493, -2.023925, 3.285152, 1, 0, 0.8627451, 1,
1.029433, 0.428416, 2.072207, 1, 0, 0.8588235, 1,
1.031356, 0.3767886, 0.9687675, 1, 0, 0.8509804, 1,
1.043956, 0.771827, 1.767214, 1, 0, 0.8470588, 1,
1.046996, -0.8722835, 2.972556, 1, 0, 0.8392157, 1,
1.053102, 0.2644548, 3.57989, 1, 0, 0.8352941, 1,
1.063548, 0.4921576, -0.5349519, 1, 0, 0.827451, 1,
1.067242, -0.3838084, 1.619391, 1, 0, 0.8235294, 1,
1.069301, -0.4435699, 2.809854, 1, 0, 0.8156863, 1,
1.071004, -0.5358037, 2.253519, 1, 0, 0.8117647, 1,
1.072756, -0.528765, 1.303146, 1, 0, 0.8039216, 1,
1.076992, -1.791875, 2.320546, 1, 0, 0.7960784, 1,
1.086134, 1.105339, -0.3117109, 1, 0, 0.7921569, 1,
1.087118, 1.112712, 0.5259321, 1, 0, 0.7843137, 1,
1.093487, 1.255082, 0.2064324, 1, 0, 0.7803922, 1,
1.096946, 0.5847892, 0.994447, 1, 0, 0.772549, 1,
1.098235, -0.7605246, 3.59677, 1, 0, 0.7686275, 1,
1.099826, 0.0004761945, 2.269675, 1, 0, 0.7607843, 1,
1.101818, -0.2521431, 2.535067, 1, 0, 0.7568628, 1,
1.115219, -1.374755, 3.136588, 1, 0, 0.7490196, 1,
1.124042, 1.577689, 0.144593, 1, 0, 0.7450981, 1,
1.125072, 0.1071959, 1.606168, 1, 0, 0.7372549, 1,
1.126294, 1.298986, 2.004478, 1, 0, 0.7333333, 1,
1.126572, 1.621803, -0.5406821, 1, 0, 0.7254902, 1,
1.133194, -1.126902, 1.071751, 1, 0, 0.7215686, 1,
1.139355, 0.08719688, 1.993432, 1, 0, 0.7137255, 1,
1.140588, 0.2786396, -0.7820301, 1, 0, 0.7098039, 1,
1.150272, 0.9653583, -0.06059872, 1, 0, 0.7019608, 1,
1.158869, 0.4814411, 0.1426692, 1, 0, 0.6941177, 1,
1.161634, 1.064282, 0.2306803, 1, 0, 0.6901961, 1,
1.167032, -0.1706677, 1.339841, 1, 0, 0.682353, 1,
1.170401, -0.5223483, 3.502047, 1, 0, 0.6784314, 1,
1.172301, -0.2274687, 1.799882, 1, 0, 0.6705883, 1,
1.175428, -0.5685035, -0.2812447, 1, 0, 0.6666667, 1,
1.181536, -2.915436, 4.088414, 1, 0, 0.6588235, 1,
1.187247, 0.1201776, -0.08838125, 1, 0, 0.654902, 1,
1.199867, -1.071247, 1.968326, 1, 0, 0.6470588, 1,
1.200565, -0.8938194, 2.699516, 1, 0, 0.6431373, 1,
1.207368, 0.664722, 1.739137, 1, 0, 0.6352941, 1,
1.20911, 1.761019, 0.5003358, 1, 0, 0.6313726, 1,
1.209439, 2.282967, -0.9624166, 1, 0, 0.6235294, 1,
1.212878, 0.6503616, 0.6693484, 1, 0, 0.6196079, 1,
1.223776, 0.839772, 1.191891, 1, 0, 0.6117647, 1,
1.224414, 0.6331283, 1.837688, 1, 0, 0.6078432, 1,
1.233075, 0.4654754, 1.127075, 1, 0, 0.6, 1,
1.266589, -0.4610365, 1.260119, 1, 0, 0.5921569, 1,
1.285467, 1.240738, 0.3918633, 1, 0, 0.5882353, 1,
1.300424, 0.3263591, 0.5287368, 1, 0, 0.5803922, 1,
1.303319, -0.9559355, 1.662048, 1, 0, 0.5764706, 1,
1.304765, -1.531503, 2.521003, 1, 0, 0.5686275, 1,
1.307877, 2.399294, -0.6328312, 1, 0, 0.5647059, 1,
1.314512, 1.586604, 1.857779, 1, 0, 0.5568628, 1,
1.317729, -1.568352, 1.691995, 1, 0, 0.5529412, 1,
1.319682, -0.5334072, 2.571766, 1, 0, 0.5450981, 1,
1.321, -1.48027, 1.455052, 1, 0, 0.5411765, 1,
1.32147, -0.03161067, 0.8692206, 1, 0, 0.5333334, 1,
1.325874, 0.244518, 1.165147, 1, 0, 0.5294118, 1,
1.330867, 0.1209628, 2.687778, 1, 0, 0.5215687, 1,
1.348483, -0.04009545, 1.080552, 1, 0, 0.5176471, 1,
1.361241, -0.1899219, 1.57768, 1, 0, 0.509804, 1,
1.36231, 0.2862763, 2.773247, 1, 0, 0.5058824, 1,
1.376195, -1.272613, 1.929018, 1, 0, 0.4980392, 1,
1.376614, 1.474875, 0.1874077, 1, 0, 0.4901961, 1,
1.379226, 0.2060686, 4.142613, 1, 0, 0.4862745, 1,
1.388861, -0.5613698, 1.255813, 1, 0, 0.4784314, 1,
1.393592, 1.450584, 2.414585, 1, 0, 0.4745098, 1,
1.394804, -2.011396, 1.863562, 1, 0, 0.4666667, 1,
1.397328, -0.3833414, 1.422183, 1, 0, 0.4627451, 1,
1.407225, 2.077631, 1.358843, 1, 0, 0.454902, 1,
1.408732, 1.063543, -0.5466456, 1, 0, 0.4509804, 1,
1.413202, -0.1719538, 1.662626, 1, 0, 0.4431373, 1,
1.414632, 0.4476795, 0.9400118, 1, 0, 0.4392157, 1,
1.415164, 1.050338, 0.8144508, 1, 0, 0.4313726, 1,
1.417205, -1.407157, 3.343049, 1, 0, 0.427451, 1,
1.421596, 0.9774278, 1.43263, 1, 0, 0.4196078, 1,
1.423245, -0.2941303, 1.877057, 1, 0, 0.4156863, 1,
1.432642, 0.3539554, 3.212936, 1, 0, 0.4078431, 1,
1.434931, -0.8169371, 2.115032, 1, 0, 0.4039216, 1,
1.434989, 1.342625, 0.6085185, 1, 0, 0.3960784, 1,
1.435463, 0.09274655, -0.2142489, 1, 0, 0.3882353, 1,
1.481952, 0.6843774, -0.4481445, 1, 0, 0.3843137, 1,
1.483318, 1.071946, 1.575579, 1, 0, 0.3764706, 1,
1.528447, 0.6651914, 0.7908216, 1, 0, 0.372549, 1,
1.534795, 0.4798074, 1.818955, 1, 0, 0.3647059, 1,
1.552939, 1.074671, -0.1389591, 1, 0, 0.3607843, 1,
1.580217, -0.7392653, 0.8199223, 1, 0, 0.3529412, 1,
1.580715, -1.065528, 0.8089487, 1, 0, 0.3490196, 1,
1.582268, -1.404188, 3.245011, 1, 0, 0.3411765, 1,
1.598727, -0.56973, 2.085102, 1, 0, 0.3372549, 1,
1.617516, -0.7188453, 1.199159, 1, 0, 0.3294118, 1,
1.646899, -1.091449, 3.180991, 1, 0, 0.3254902, 1,
1.651119, -1.191082, 1.933817, 1, 0, 0.3176471, 1,
1.663202, 1.032765, 2.273454, 1, 0, 0.3137255, 1,
1.665954, 0.06669287, 1.173375, 1, 0, 0.3058824, 1,
1.67645, 0.05158004, 2.664192, 1, 0, 0.2980392, 1,
1.684439, -1.252469, 2.025416, 1, 0, 0.2941177, 1,
1.688447, -0.588115, 1.662783, 1, 0, 0.2862745, 1,
1.70736, 1.057811, 1.193006, 1, 0, 0.282353, 1,
1.707745, 1.101026, 1.739448, 1, 0, 0.2745098, 1,
1.709487, 0.7946651, 1.490488, 1, 0, 0.2705882, 1,
1.727291, 0.6951462, 0.1086537, 1, 0, 0.2627451, 1,
1.76054, 0.3221451, 2.891269, 1, 0, 0.2588235, 1,
1.761955, -1.135832, 3.493858, 1, 0, 0.2509804, 1,
1.776847, 2.075399, 1.631084, 1, 0, 0.2470588, 1,
1.797481, -0.5049951, 2.576552, 1, 0, 0.2392157, 1,
1.80492, -0.4255762, 1.563887, 1, 0, 0.2352941, 1,
1.808664, 0.3692312, 2.948551, 1, 0, 0.227451, 1,
1.821088, 0.08196429, 2.069011, 1, 0, 0.2235294, 1,
1.824993, -1.286157, 2.364843, 1, 0, 0.2156863, 1,
1.833649, 0.7838461, 1.293107, 1, 0, 0.2117647, 1,
1.848437, 0.4804951, 2.126383, 1, 0, 0.2039216, 1,
1.85806, -0.5829284, 0.4885818, 1, 0, 0.1960784, 1,
1.860767, -0.4514694, -0.3369932, 1, 0, 0.1921569, 1,
1.881362, -1.190208, 2.935262, 1, 0, 0.1843137, 1,
1.884673, -0.833443, 3.306971, 1, 0, 0.1803922, 1,
1.903474, -1.078262, 3.603099, 1, 0, 0.172549, 1,
1.917063, -0.6255926, 1.750383, 1, 0, 0.1686275, 1,
1.949068, 0.1414215, 0.007441979, 1, 0, 0.1607843, 1,
2.00353, 1.120758, 0.1070474, 1, 0, 0.1568628, 1,
2.015131, -0.8924286, 1.172774, 1, 0, 0.1490196, 1,
2.043132, 0.2336587, 0.002177866, 1, 0, 0.145098, 1,
2.077585, -1.882196, 2.833569, 1, 0, 0.1372549, 1,
2.090675, 1.607544, 1.393351, 1, 0, 0.1333333, 1,
2.099024, -0.2157088, 1.178877, 1, 0, 0.1254902, 1,
2.11525, 3.253981, -0.4189134, 1, 0, 0.1215686, 1,
2.134336, 0.3382148, 0.8362327, 1, 0, 0.1137255, 1,
2.232584, -2.246257, 4.020382, 1, 0, 0.1098039, 1,
2.251303, 1.41219, -0.2870207, 1, 0, 0.1019608, 1,
2.351193, 0.3889672, 0.614914, 1, 0, 0.09411765, 1,
2.378776, 0.7256876, 2.643614, 1, 0, 0.09019608, 1,
2.388343, 0.7111694, 0.07581893, 1, 0, 0.08235294, 1,
2.517123, 0.4033338, 0.07022595, 1, 0, 0.07843138, 1,
2.599511, -0.7043663, 0.0171309, 1, 0, 0.07058824, 1,
2.601334, 0.0815162, 0.01611072, 1, 0, 0.06666667, 1,
2.653803, -1.568599, 3.357048, 1, 0, 0.05882353, 1,
2.660753, -0.1316915, -0.1175204, 1, 0, 0.05490196, 1,
2.680883, -1.020439, 2.579449, 1, 0, 0.04705882, 1,
2.703367, 0.9070003, 1.419377, 1, 0, 0.04313726, 1,
2.769985, -0.3490622, 0.956933, 1, 0, 0.03529412, 1,
2.808008, -0.4208323, 3.228167, 1, 0, 0.03137255, 1,
3.013346, 1.381451, 1.53403, 1, 0, 0.02352941, 1,
3.16109, 0.1116149, 2.027705, 1, 0, 0.01960784, 1,
3.263761, 0.2149815, 0.1808245, 1, 0, 0.01176471, 1,
3.687696, 1.935566, -0.2931238, 1, 0, 0.007843138, 1
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
0.2400665, -4.566569, -7.216149, 0, -0.5, 0.5, 0.5,
0.2400665, -4.566569, -7.216149, 1, -0.5, 0.5, 0.5,
0.2400665, -4.566569, -7.216149, 1, 1.5, 0.5, 0.5,
0.2400665, -4.566569, -7.216149, 0, 1.5, 0.5, 0.5
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
-4.37631, -0.08956325, -7.216149, 0, -0.5, 0.5, 0.5,
-4.37631, -0.08956325, -7.216149, 1, -0.5, 0.5, 0.5,
-4.37631, -0.08956325, -7.216149, 1, 1.5, 0.5, 0.5,
-4.37631, -0.08956325, -7.216149, 0, 1.5, 0.5, 0.5
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
-4.37631, -4.566569, 0.1085749, 0, -0.5, 0.5, 0.5,
-4.37631, -4.566569, 0.1085749, 1, -0.5, 0.5, 0.5,
-4.37631, -4.566569, 0.1085749, 1, 1.5, 0.5, 0.5,
-4.37631, -4.566569, 0.1085749, 0, 1.5, 0.5, 0.5
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
-3, -3.533414, -5.525828,
3, -3.533414, -5.525828,
-3, -3.533414, -5.525828,
-3, -3.705606, -5.807549,
-2, -3.533414, -5.525828,
-2, -3.705606, -5.807549,
-1, -3.533414, -5.525828,
-1, -3.705606, -5.807549,
0, -3.533414, -5.525828,
0, -3.705606, -5.807549,
1, -3.533414, -5.525828,
1, -3.705606, -5.807549,
2, -3.533414, -5.525828,
2, -3.705606, -5.807549,
3, -3.533414, -5.525828,
3, -3.705606, -5.807549
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
-3, -4.049991, -6.370989, 0, -0.5, 0.5, 0.5,
-3, -4.049991, -6.370989, 1, -0.5, 0.5, 0.5,
-3, -4.049991, -6.370989, 1, 1.5, 0.5, 0.5,
-3, -4.049991, -6.370989, 0, 1.5, 0.5, 0.5,
-2, -4.049991, -6.370989, 0, -0.5, 0.5, 0.5,
-2, -4.049991, -6.370989, 1, -0.5, 0.5, 0.5,
-2, -4.049991, -6.370989, 1, 1.5, 0.5, 0.5,
-2, -4.049991, -6.370989, 0, 1.5, 0.5, 0.5,
-1, -4.049991, -6.370989, 0, -0.5, 0.5, 0.5,
-1, -4.049991, -6.370989, 1, -0.5, 0.5, 0.5,
-1, -4.049991, -6.370989, 1, 1.5, 0.5, 0.5,
-1, -4.049991, -6.370989, 0, 1.5, 0.5, 0.5,
0, -4.049991, -6.370989, 0, -0.5, 0.5, 0.5,
0, -4.049991, -6.370989, 1, -0.5, 0.5, 0.5,
0, -4.049991, -6.370989, 1, 1.5, 0.5, 0.5,
0, -4.049991, -6.370989, 0, 1.5, 0.5, 0.5,
1, -4.049991, -6.370989, 0, -0.5, 0.5, 0.5,
1, -4.049991, -6.370989, 1, -0.5, 0.5, 0.5,
1, -4.049991, -6.370989, 1, 1.5, 0.5, 0.5,
1, -4.049991, -6.370989, 0, 1.5, 0.5, 0.5,
2, -4.049991, -6.370989, 0, -0.5, 0.5, 0.5,
2, -4.049991, -6.370989, 1, -0.5, 0.5, 0.5,
2, -4.049991, -6.370989, 1, 1.5, 0.5, 0.5,
2, -4.049991, -6.370989, 0, 1.5, 0.5, 0.5,
3, -4.049991, -6.370989, 0, -0.5, 0.5, 0.5,
3, -4.049991, -6.370989, 1, -0.5, 0.5, 0.5,
3, -4.049991, -6.370989, 1, 1.5, 0.5, 0.5,
3, -4.049991, -6.370989, 0, 1.5, 0.5, 0.5
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
-3.310992, -3, -5.525828,
-3.310992, 3, -5.525828,
-3.310992, -3, -5.525828,
-3.488545, -3, -5.807549,
-3.310992, -2, -5.525828,
-3.488545, -2, -5.807549,
-3.310992, -1, -5.525828,
-3.488545, -1, -5.807549,
-3.310992, 0, -5.525828,
-3.488545, 0, -5.807549,
-3.310992, 1, -5.525828,
-3.488545, 1, -5.807549,
-3.310992, 2, -5.525828,
-3.488545, 2, -5.807549,
-3.310992, 3, -5.525828,
-3.488545, 3, -5.807549
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
-3.843651, -3, -6.370989, 0, -0.5, 0.5, 0.5,
-3.843651, -3, -6.370989, 1, -0.5, 0.5, 0.5,
-3.843651, -3, -6.370989, 1, 1.5, 0.5, 0.5,
-3.843651, -3, -6.370989, 0, 1.5, 0.5, 0.5,
-3.843651, -2, -6.370989, 0, -0.5, 0.5, 0.5,
-3.843651, -2, -6.370989, 1, -0.5, 0.5, 0.5,
-3.843651, -2, -6.370989, 1, 1.5, 0.5, 0.5,
-3.843651, -2, -6.370989, 0, 1.5, 0.5, 0.5,
-3.843651, -1, -6.370989, 0, -0.5, 0.5, 0.5,
-3.843651, -1, -6.370989, 1, -0.5, 0.5, 0.5,
-3.843651, -1, -6.370989, 1, 1.5, 0.5, 0.5,
-3.843651, -1, -6.370989, 0, 1.5, 0.5, 0.5,
-3.843651, 0, -6.370989, 0, -0.5, 0.5, 0.5,
-3.843651, 0, -6.370989, 1, -0.5, 0.5, 0.5,
-3.843651, 0, -6.370989, 1, 1.5, 0.5, 0.5,
-3.843651, 0, -6.370989, 0, 1.5, 0.5, 0.5,
-3.843651, 1, -6.370989, 0, -0.5, 0.5, 0.5,
-3.843651, 1, -6.370989, 1, -0.5, 0.5, 0.5,
-3.843651, 1, -6.370989, 1, 1.5, 0.5, 0.5,
-3.843651, 1, -6.370989, 0, 1.5, 0.5, 0.5,
-3.843651, 2, -6.370989, 0, -0.5, 0.5, 0.5,
-3.843651, 2, -6.370989, 1, -0.5, 0.5, 0.5,
-3.843651, 2, -6.370989, 1, 1.5, 0.5, 0.5,
-3.843651, 2, -6.370989, 0, 1.5, 0.5, 0.5,
-3.843651, 3, -6.370989, 0, -0.5, 0.5, 0.5,
-3.843651, 3, -6.370989, 1, -0.5, 0.5, 0.5,
-3.843651, 3, -6.370989, 1, 1.5, 0.5, 0.5,
-3.843651, 3, -6.370989, 0, 1.5, 0.5, 0.5
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
-3.310992, -3.533414, -4,
-3.310992, -3.533414, 4,
-3.310992, -3.533414, -4,
-3.488545, -3.705606, -4,
-3.310992, -3.533414, -2,
-3.488545, -3.705606, -2,
-3.310992, -3.533414, 0,
-3.488545, -3.705606, 0,
-3.310992, -3.533414, 2,
-3.488545, -3.705606, 2,
-3.310992, -3.533414, 4,
-3.488545, -3.705606, 4
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
-3.843651, -4.049991, -4, 0, -0.5, 0.5, 0.5,
-3.843651, -4.049991, -4, 1, -0.5, 0.5, 0.5,
-3.843651, -4.049991, -4, 1, 1.5, 0.5, 0.5,
-3.843651, -4.049991, -4, 0, 1.5, 0.5, 0.5,
-3.843651, -4.049991, -2, 0, -0.5, 0.5, 0.5,
-3.843651, -4.049991, -2, 1, -0.5, 0.5, 0.5,
-3.843651, -4.049991, -2, 1, 1.5, 0.5, 0.5,
-3.843651, -4.049991, -2, 0, 1.5, 0.5, 0.5,
-3.843651, -4.049991, 0, 0, -0.5, 0.5, 0.5,
-3.843651, -4.049991, 0, 1, -0.5, 0.5, 0.5,
-3.843651, -4.049991, 0, 1, 1.5, 0.5, 0.5,
-3.843651, -4.049991, 0, 0, 1.5, 0.5, 0.5,
-3.843651, -4.049991, 2, 0, -0.5, 0.5, 0.5,
-3.843651, -4.049991, 2, 1, -0.5, 0.5, 0.5,
-3.843651, -4.049991, 2, 1, 1.5, 0.5, 0.5,
-3.843651, -4.049991, 2, 0, 1.5, 0.5, 0.5,
-3.843651, -4.049991, 4, 0, -0.5, 0.5, 0.5,
-3.843651, -4.049991, 4, 1, -0.5, 0.5, 0.5,
-3.843651, -4.049991, 4, 1, 1.5, 0.5, 0.5,
-3.843651, -4.049991, 4, 0, 1.5, 0.5, 0.5
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
-3.310992, -3.533414, -5.525828,
-3.310992, 3.354287, -5.525828,
-3.310992, -3.533414, 5.742978,
-3.310992, 3.354287, 5.742978,
-3.310992, -3.533414, -5.525828,
-3.310992, -3.533414, 5.742978,
-3.310992, 3.354287, -5.525828,
-3.310992, 3.354287, 5.742978,
-3.310992, -3.533414, -5.525828,
3.791125, -3.533414, -5.525828,
-3.310992, -3.533414, 5.742978,
3.791125, -3.533414, 5.742978,
-3.310992, 3.354287, -5.525828,
3.791125, 3.354287, -5.525828,
-3.310992, 3.354287, 5.742978,
3.791125, 3.354287, 5.742978,
3.791125, -3.533414, -5.525828,
3.791125, 3.354287, -5.525828,
3.791125, -3.533414, 5.742978,
3.791125, 3.354287, 5.742978,
3.791125, -3.533414, -5.525828,
3.791125, -3.533414, 5.742978,
3.791125, 3.354287, -5.525828,
3.791125, 3.354287, 5.742978
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
var radius = 8.007332;
var distance = 35.62552;
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
mvMatrix.translate( -0.2400665, 0.08956325, -0.1085749 );
mvMatrix.scale( 1.219029, 1.256977, 0.7682876 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.62552);
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
pentachlorobenzonitr<-read.table("pentachlorobenzonitr.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pentachlorobenzonitr$V2
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorobenzonitr' not found
```

```r
y<-pentachlorobenzonitr$V3
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorobenzonitr' not found
```

```r
z<-pentachlorobenzonitr$V4
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorobenzonitr' not found
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
-3.207563, 1.341333, -1.605559, 0, 0, 1, 1, 1,
-3.085173, 1.604553, -2.620258, 1, 0, 0, 1, 1,
-3.019132, -1.32338, -2.069426, 1, 0, 0, 1, 1,
-2.894567, -0.917782, -1.391955, 1, 0, 0, 1, 1,
-2.824602, -0.4603593, -0.3561681, 1, 0, 0, 1, 1,
-2.81979, 0.4062254, -1.713325, 1, 0, 0, 1, 1,
-2.690368, -1.093876, -1.653301, 0, 0, 0, 1, 1,
-2.527754, 1.784452, -1.560042, 0, 0, 0, 1, 1,
-2.467517, -1.368583, -3.424461, 0, 0, 0, 1, 1,
-2.395, 0.4603704, -0.9061964, 0, 0, 0, 1, 1,
-2.377728, -0.7795981, -1.318054, 0, 0, 0, 1, 1,
-2.327863, 0.8755363, -1.3617, 0, 0, 0, 1, 1,
-2.242257, 1.601487, -1.513711, 0, 0, 0, 1, 1,
-2.215988, 1.849382, -1.669134, 1, 1, 1, 1, 1,
-2.16782, -0.6069177, -2.362096, 1, 1, 1, 1, 1,
-2.1622, -0.8079301, -2.896404, 1, 1, 1, 1, 1,
-2.140611, 0.02365463, -1.755306, 1, 1, 1, 1, 1,
-2.129823, -0.4070955, -3.847789, 1, 1, 1, 1, 1,
-2.079365, 0.4225291, -1.9604, 1, 1, 1, 1, 1,
-2.07618, 0.5497775, -1.428249, 1, 1, 1, 1, 1,
-2.075057, 1.454356, -1.645298, 1, 1, 1, 1, 1,
-2.052014, -1.050905, -1.84504, 1, 1, 1, 1, 1,
-2.013875, -0.1002595, -1.508292, 1, 1, 1, 1, 1,
-1.988814, -0.5013084, -1.321751, 1, 1, 1, 1, 1,
-1.951239, -0.6736034, -1.992132, 1, 1, 1, 1, 1,
-1.946039, 0.5006105, -0.604221, 1, 1, 1, 1, 1,
-1.90146, -0.3784436, -1.648362, 1, 1, 1, 1, 1,
-1.896092, 0.1874166, -3.618118, 1, 1, 1, 1, 1,
-1.895061, 0.05681989, -0.5891892, 0, 0, 1, 1, 1,
-1.877485, 0.5119008, -2.714221, 1, 0, 0, 1, 1,
-1.85726, -1.227946, -1.576939, 1, 0, 0, 1, 1,
-1.834528, 0.4669943, -1.948409, 1, 0, 0, 1, 1,
-1.827666, 2.064522, -1.544871, 1, 0, 0, 1, 1,
-1.795894, 0.6823677, -1.093347, 1, 0, 0, 1, 1,
-1.782579, -1.155071, -2.419994, 0, 0, 0, 1, 1,
-1.781943, 0.8254852, -2.250704, 0, 0, 0, 1, 1,
-1.776345, 1.743636, -1.787985, 0, 0, 0, 1, 1,
-1.773991, -1.757118, -2.730217, 0, 0, 0, 1, 1,
-1.772568, 0.04833932, 0.6669607, 0, 0, 0, 1, 1,
-1.756547, -0.3965903, -1.200175, 0, 0, 0, 1, 1,
-1.687255, -0.275978, -1.632648, 0, 0, 0, 1, 1,
-1.683289, 0.1565092, -1.940847, 1, 1, 1, 1, 1,
-1.681301, 1.571463, -2.324075, 1, 1, 1, 1, 1,
-1.673994, -0.2412713, -0.9369431, 1, 1, 1, 1, 1,
-1.660484, 1.229525, 0.2314458, 1, 1, 1, 1, 1,
-1.637243, 1.217176, -1.597532, 1, 1, 1, 1, 1,
-1.630435, 0.3667871, -0.2655422, 1, 1, 1, 1, 1,
-1.620697, -0.2163157, -1.962957, 1, 1, 1, 1, 1,
-1.607262, 0.5984652, -1.722438, 1, 1, 1, 1, 1,
-1.605498, 0.6329964, -1.610208, 1, 1, 1, 1, 1,
-1.595918, 0.2071985, -2.545267, 1, 1, 1, 1, 1,
-1.584569, -0.7566872, -3.703461, 1, 1, 1, 1, 1,
-1.578816, 1.567736, -0.9942091, 1, 1, 1, 1, 1,
-1.578307, -0.9677933, -2.583718, 1, 1, 1, 1, 1,
-1.578241, -2.353918, -1.583475, 1, 1, 1, 1, 1,
-1.572588, -0.7186331, -1.686963, 1, 1, 1, 1, 1,
-1.570335, 0.4073065, -1.689079, 0, 0, 1, 1, 1,
-1.56895, -0.09914994, -2.254733, 1, 0, 0, 1, 1,
-1.553515, 0.01894401, -2.742737, 1, 0, 0, 1, 1,
-1.551314, 0.1330961, -0.2074999, 1, 0, 0, 1, 1,
-1.546231, 0.2459451, -1.971088, 1, 0, 0, 1, 1,
-1.52462, 0.3997055, -1.348419, 1, 0, 0, 1, 1,
-1.522198, -0.3496099, -0.8113926, 0, 0, 0, 1, 1,
-1.520397, -0.07910586, -1.702984, 0, 0, 0, 1, 1,
-1.513071, -0.1147577, -1.703422, 0, 0, 0, 1, 1,
-1.510018, -0.2443598, -1.209742, 0, 0, 0, 1, 1,
-1.5013, 1.690363, 0.2004523, 0, 0, 0, 1, 1,
-1.499523, -0.9328275, -2.092156, 0, 0, 0, 1, 1,
-1.488607, -0.09882168, -1.198089, 0, 0, 0, 1, 1,
-1.485355, -0.4087461, -1.09624, 1, 1, 1, 1, 1,
-1.472436, 0.9846456, -0.3903109, 1, 1, 1, 1, 1,
-1.464858, -0.3273078, -1.639804, 1, 1, 1, 1, 1,
-1.454966, -0.6734527, -1.776346, 1, 1, 1, 1, 1,
-1.439908, 0.9655838, -0.8616121, 1, 1, 1, 1, 1,
-1.437816, -0.6643686, -2.410608, 1, 1, 1, 1, 1,
-1.436561, 0.2766833, -1.445403, 1, 1, 1, 1, 1,
-1.434683, -1.572065, -2.385096, 1, 1, 1, 1, 1,
-1.43342, -0.5797035, -2.94324, 1, 1, 1, 1, 1,
-1.431422, -1.052712, -3.475105, 1, 1, 1, 1, 1,
-1.426439, -1.10947, -3.200722, 1, 1, 1, 1, 1,
-1.41419, -0.006912712, -0.7707489, 1, 1, 1, 1, 1,
-1.405446, -0.8750038, -2.857577, 1, 1, 1, 1, 1,
-1.40428, 0.1033739, -2.495879, 1, 1, 1, 1, 1,
-1.397845, 0.8215724, 0.2592916, 1, 1, 1, 1, 1,
-1.396632, -0.231972, -1.045746, 0, 0, 1, 1, 1,
-1.376286, 0.5269229, -1.960035, 1, 0, 0, 1, 1,
-1.375889, 0.3849155, -0.6761655, 1, 0, 0, 1, 1,
-1.374644, 0.1581369, -3.029755, 1, 0, 0, 1, 1,
-1.359141, 0.2818312, 1.303984, 1, 0, 0, 1, 1,
-1.35726, -0.4790164, 0.9303887, 1, 0, 0, 1, 1,
-1.351867, 0.4479212, -0.06538301, 0, 0, 0, 1, 1,
-1.344663, -0.8935053, -1.627175, 0, 0, 0, 1, 1,
-1.330693, 2.009978, -1.412208, 0, 0, 0, 1, 1,
-1.320385, 0.570887, -0.1372028, 0, 0, 0, 1, 1,
-1.319609, 0.1063936, -1.288574, 0, 0, 0, 1, 1,
-1.31103, 1.314704, 0.1093897, 0, 0, 0, 1, 1,
-1.307441, 0.01538249, -2.191685, 0, 0, 0, 1, 1,
-1.305545, -0.6071454, -1.190405, 1, 1, 1, 1, 1,
-1.29834, 1.829786, -0.239361, 1, 1, 1, 1, 1,
-1.298281, -0.2469263, -1.01594, 1, 1, 1, 1, 1,
-1.294223, -2.591574, -2.326952, 1, 1, 1, 1, 1,
-1.294142, 0.4908758, -2.21664, 1, 1, 1, 1, 1,
-1.28078, 1.006477, -0.7800453, 1, 1, 1, 1, 1,
-1.26799, -0.2016252, -1.715669, 1, 1, 1, 1, 1,
-1.253075, -0.2308263, -0.5473913, 1, 1, 1, 1, 1,
-1.249214, -1.426995, -2.798922, 1, 1, 1, 1, 1,
-1.246682, 0.7357489, -1.011298, 1, 1, 1, 1, 1,
-1.244713, -1.063689, -2.601442, 1, 1, 1, 1, 1,
-1.237399, 1.743734, 0.07121401, 1, 1, 1, 1, 1,
-1.234755, 0.07227699, -2.244909, 1, 1, 1, 1, 1,
-1.224562, -1.196857, -1.078471, 1, 1, 1, 1, 1,
-1.221439, -0.1495526, -2.237988, 1, 1, 1, 1, 1,
-1.221423, -1.759515, -3.252225, 0, 0, 1, 1, 1,
-1.211759, 0.9726597, 0.5554677, 1, 0, 0, 1, 1,
-1.211006, -0.5449637, -1.610338, 1, 0, 0, 1, 1,
-1.209683, -0.02063058, -2.428771, 1, 0, 0, 1, 1,
-1.205512, -0.3728937, -0.9709593, 1, 0, 0, 1, 1,
-1.19287, 0.6623333, 0.7050016, 1, 0, 0, 1, 1,
-1.191617, 0.8135231, 0.9830857, 0, 0, 0, 1, 1,
-1.18576, -0.9188084, -2.939745, 0, 0, 0, 1, 1,
-1.177477, -0.4636654, -3.248086, 0, 0, 0, 1, 1,
-1.174066, 1.208072, 0.104221, 0, 0, 0, 1, 1,
-1.162415, 1.46301, 0.007489771, 0, 0, 0, 1, 1,
-1.157915, -0.4765357, -2.262661, 0, 0, 0, 1, 1,
-1.155931, 1.381169, 0.03423234, 0, 0, 0, 1, 1,
-1.155688, 0.4822477, -1.070947, 1, 1, 1, 1, 1,
-1.154393, 0.02098317, -0.4314805, 1, 1, 1, 1, 1,
-1.151451, -0.1339792, -1.797758, 1, 1, 1, 1, 1,
-1.134229, 1.230339, -0.8195158, 1, 1, 1, 1, 1,
-1.120264, 1.138325, -1.259766, 1, 1, 1, 1, 1,
-1.115781, 1.084985, -0.2217271, 1, 1, 1, 1, 1,
-1.115428, -0.4462601, -1.967504, 1, 1, 1, 1, 1,
-1.112044, -1.01248, -2.859465, 1, 1, 1, 1, 1,
-1.104295, -2.423887, -3.992076, 1, 1, 1, 1, 1,
-1.103478, 0.5298598, -2.432534, 1, 1, 1, 1, 1,
-1.102817, -0.5804965, 0.04039101, 1, 1, 1, 1, 1,
-1.096005, 0.5900868, -2.096242, 1, 1, 1, 1, 1,
-1.09511, 0.3912583, -3.316234, 1, 1, 1, 1, 1,
-1.093934, 0.9542878, -3.553293, 1, 1, 1, 1, 1,
-1.09046, 1.767024, 0.1727832, 1, 1, 1, 1, 1,
-1.080837, -0.8900083, -1.151431, 0, 0, 1, 1, 1,
-1.079559, 1.102519, -2.224814, 1, 0, 0, 1, 1,
-1.074624, -0.01346589, -3.170584, 1, 0, 0, 1, 1,
-1.071071, 0.2506487, -2.656499, 1, 0, 0, 1, 1,
-1.060524, 1.079883, 0.7500532, 1, 0, 0, 1, 1,
-1.056368, 0.2058288, -1.699861, 1, 0, 0, 1, 1,
-1.054014, 1.170656, -1.562216, 0, 0, 0, 1, 1,
-1.051091, 0.2335931, -1.180115, 0, 0, 0, 1, 1,
-1.03676, -0.9598812, -2.321972, 0, 0, 0, 1, 1,
-1.032323, -0.1848815, -0.760518, 0, 0, 0, 1, 1,
-1.027405, -0.4112019, -1.177005, 0, 0, 0, 1, 1,
-1.020733, 0.1603275, -0.8261253, 0, 0, 0, 1, 1,
-1.020711, 0.16245, -1.245638, 0, 0, 0, 1, 1,
-1.019596, 1.228133, -1.026972, 1, 1, 1, 1, 1,
-1.01052, -0.2121117, -2.215395, 1, 1, 1, 1, 1,
-1.00605, -1.201347, -1.349678, 1, 1, 1, 1, 1,
-1.000165, -0.8015924, -0.8731013, 1, 1, 1, 1, 1,
-0.9950037, 0.687257, -1.106058, 1, 1, 1, 1, 1,
-0.9946901, 0.4853959, 0.1221043, 1, 1, 1, 1, 1,
-0.9938341, 1.455756, -0.3831179, 1, 1, 1, 1, 1,
-0.9916975, -0.7181793, -2.42517, 1, 1, 1, 1, 1,
-0.9846938, -0.6458582, -1.305979, 1, 1, 1, 1, 1,
-0.9841043, -0.7313396, -1.591089, 1, 1, 1, 1, 1,
-0.9782353, -0.4169321, -2.846939, 1, 1, 1, 1, 1,
-0.9779336, 0.2514328, -1.810828, 1, 1, 1, 1, 1,
-0.9680628, -0.6239437, -3.94398, 1, 1, 1, 1, 1,
-0.96573, 2.073089, -0.9326961, 1, 1, 1, 1, 1,
-0.9623536, 1.901972, 0.2845182, 1, 1, 1, 1, 1,
-0.9595425, -1.292462, -2.133119, 0, 0, 1, 1, 1,
-0.9493254, -3.433107, -0.7578768, 1, 0, 0, 1, 1,
-0.9372355, 0.5352644, -2.024611, 1, 0, 0, 1, 1,
-0.9290998, -0.07500112, -2.240946, 1, 0, 0, 1, 1,
-0.9239509, -0.9506505, -2.02791, 1, 0, 0, 1, 1,
-0.9162019, -1.066202, -0.4971364, 1, 0, 0, 1, 1,
-0.9145691, 0.4737571, -0.7274482, 0, 0, 0, 1, 1,
-0.9078049, 1.504721, 1.337808, 0, 0, 0, 1, 1,
-0.9049387, -0.5093646, -3.768261, 0, 0, 0, 1, 1,
-0.9043146, -0.5180689, -2.917447, 0, 0, 0, 1, 1,
-0.9015133, -0.6241471, -2.273093, 0, 0, 0, 1, 1,
-0.8998864, -0.4064015, -1.444412, 0, 0, 0, 1, 1,
-0.8882405, 0.4643018, -2.094669, 0, 0, 0, 1, 1,
-0.874868, 0.2559126, -1.747951, 1, 1, 1, 1, 1,
-0.8747813, 0.5730419, -0.0775629, 1, 1, 1, 1, 1,
-0.8716943, -1.098607, -1.510103, 1, 1, 1, 1, 1,
-0.8660367, -0.8004234, -0.990415, 1, 1, 1, 1, 1,
-0.8604592, 0.9789508, -2.083404, 1, 1, 1, 1, 1,
-0.8578687, 0.7851999, -1.277776, 1, 1, 1, 1, 1,
-0.8451674, 0.6578524, -1.77325, 1, 1, 1, 1, 1,
-0.8433958, -1.340289, -4.249982, 1, 1, 1, 1, 1,
-0.8374842, 0.7064803, -1.037858, 1, 1, 1, 1, 1,
-0.8365659, -0.8289475, -3.406111, 1, 1, 1, 1, 1,
-0.8272697, -0.1022628, -3.91121, 1, 1, 1, 1, 1,
-0.8231205, 0.7316208, -1.067644, 1, 1, 1, 1, 1,
-0.8183867, 0.4630039, -1.554976, 1, 1, 1, 1, 1,
-0.8176463, 0.7891595, -0.4857511, 1, 1, 1, 1, 1,
-0.8158668, 0.6160362, -1.788956, 1, 1, 1, 1, 1,
-0.8034368, -0.0783497, -2.054476, 0, 0, 1, 1, 1,
-0.8021791, -1.142936, -3.109714, 1, 0, 0, 1, 1,
-0.7983648, -0.02319202, -1.713665, 1, 0, 0, 1, 1,
-0.795859, 0.8284119, 0.2589622, 1, 0, 0, 1, 1,
-0.7952264, -0.8220791, -2.291362, 1, 0, 0, 1, 1,
-0.7944236, -0.6362862, -3.044238, 1, 0, 0, 1, 1,
-0.7920784, -1.035971, -2.281512, 0, 0, 0, 1, 1,
-0.7913513, 0.8577033, -0.1245475, 0, 0, 0, 1, 1,
-0.7866056, 1.386066, -0.1963808, 0, 0, 0, 1, 1,
-0.7837612, -1.750431, -3.232747, 0, 0, 0, 1, 1,
-0.7834868, 0.3713489, -1.787341, 0, 0, 0, 1, 1,
-0.7827953, -0.3960975, -2.385498, 0, 0, 0, 1, 1,
-0.7762697, -0.6354744, -2.681791, 0, 0, 0, 1, 1,
-0.7752671, -0.07351051, -1.333359, 1, 1, 1, 1, 1,
-0.774232, 0.1695418, -0.7330214, 1, 1, 1, 1, 1,
-0.7737305, 1.704718, -0.6165477, 1, 1, 1, 1, 1,
-0.7731035, 0.5160421, -2.195075, 1, 1, 1, 1, 1,
-0.7682048, 0.9186144, 0.266499, 1, 1, 1, 1, 1,
-0.7681578, -0.4987772, -1.713277, 1, 1, 1, 1, 1,
-0.7661224, 1.607995, -0.723487, 1, 1, 1, 1, 1,
-0.765002, 1.369841, -1.389936, 1, 1, 1, 1, 1,
-0.7639142, -1.485358, -2.447916, 1, 1, 1, 1, 1,
-0.748403, -0.3408386, -2.406913, 1, 1, 1, 1, 1,
-0.7472816, 1.467848, -2.077886, 1, 1, 1, 1, 1,
-0.7462335, 0.8557764, -0.8404301, 1, 1, 1, 1, 1,
-0.7455257, -0.8772618, -3.688587, 1, 1, 1, 1, 1,
-0.7444351, 1.52761, 1.873211, 1, 1, 1, 1, 1,
-0.7399378, -0.5146292, -3.908388, 1, 1, 1, 1, 1,
-0.7382619, -1.065602, -4.429736, 0, 0, 1, 1, 1,
-0.7359904, 0.1834591, -1.281075, 1, 0, 0, 1, 1,
-0.7350799, -0.9615643, -3.26436, 1, 0, 0, 1, 1,
-0.7322255, -0.1422769, -2.569049, 1, 0, 0, 1, 1,
-0.7218859, -0.3376499, -2.137844, 1, 0, 0, 1, 1,
-0.7217554, -0.1405424, -1.689528, 1, 0, 0, 1, 1,
-0.7155917, -0.1153413, -0.6785171, 0, 0, 0, 1, 1,
-0.7107138, -0.7917038, -2.66125, 0, 0, 0, 1, 1,
-0.7103302, -0.7649364, -0.9387802, 0, 0, 0, 1, 1,
-0.7066334, 1.690072, 0.7681038, 0, 0, 0, 1, 1,
-0.7046221, -1.504135, -3.541374, 0, 0, 0, 1, 1,
-0.7040229, 0.8083391, 0.03839922, 0, 0, 0, 1, 1,
-0.7005942, -1.159187, -2.105235, 0, 0, 0, 1, 1,
-0.7004005, -1.554017, -1.034725, 1, 1, 1, 1, 1,
-0.6940002, 0.6391624, -0.8177272, 1, 1, 1, 1, 1,
-0.6861749, -0.5225893, -1.411676, 1, 1, 1, 1, 1,
-0.6852117, -0.8160633, -3.071339, 1, 1, 1, 1, 1,
-0.680506, -0.390182, -1.247403, 1, 1, 1, 1, 1,
-0.6785396, 0.09217168, -0.7921818, 1, 1, 1, 1, 1,
-0.6754004, -1.246542, -4.242658, 1, 1, 1, 1, 1,
-0.6740767, -0.4553852, -2.938859, 1, 1, 1, 1, 1,
-0.6736637, -0.2007761, -3.239344, 1, 1, 1, 1, 1,
-0.6732802, 1.254258, -1.476663, 1, 1, 1, 1, 1,
-0.667631, 2.208052, -0.5250152, 1, 1, 1, 1, 1,
-0.6618631, 1.322125, -1.731165, 1, 1, 1, 1, 1,
-0.6595484, -0.4655142, -3.800492, 1, 1, 1, 1, 1,
-0.6592658, -0.3766492, -1.236137, 1, 1, 1, 1, 1,
-0.6580069, 0.5010766, 0.7361693, 1, 1, 1, 1, 1,
-0.6577898, -1.067666, -2.644839, 0, 0, 1, 1, 1,
-0.6557748, -1.67934, -0.9731159, 1, 0, 0, 1, 1,
-0.6543686, 0.6688236, -0.9648101, 1, 0, 0, 1, 1,
-0.6538814, -0.7254933, -0.1773853, 1, 0, 0, 1, 1,
-0.6524804, 1.456201, -0.1458226, 1, 0, 0, 1, 1,
-0.6519195, 1.199707, -0.2622881, 1, 0, 0, 1, 1,
-0.6499105, -1.026522, -3.035783, 0, 0, 0, 1, 1,
-0.6470515, -1.931763, -4.087007, 0, 0, 0, 1, 1,
-0.6453528, -0.3047155, -0.4327438, 0, 0, 0, 1, 1,
-0.6423694, 0.1257023, -3.085892, 0, 0, 0, 1, 1,
-0.6346101, -1.247561, -3.119594, 0, 0, 0, 1, 1,
-0.6339417, 0.7216935, -0.9422193, 0, 0, 0, 1, 1,
-0.6334936, 0.7714541, -2.060557, 0, 0, 0, 1, 1,
-0.6301129, -0.1462204, -2.084154, 1, 1, 1, 1, 1,
-0.6243116, -0.6351874, -1.738884, 1, 1, 1, 1, 1,
-0.6225198, 0.04865992, -0.3560567, 1, 1, 1, 1, 1,
-0.619894, -0.5820882, -3.666506, 1, 1, 1, 1, 1,
-0.614938, -1.304134, -2.922337, 1, 1, 1, 1, 1,
-0.6132774, -0.8650752, -2.975376, 1, 1, 1, 1, 1,
-0.6040037, -1.114202, -3.240604, 1, 1, 1, 1, 1,
-0.5995542, 2.119499, 0.3610317, 1, 1, 1, 1, 1,
-0.5988168, -0.05120797, -1.990179, 1, 1, 1, 1, 1,
-0.5947433, 1.140756, -1.063446, 1, 1, 1, 1, 1,
-0.5932633, 1.391233, -1.189012, 1, 1, 1, 1, 1,
-0.5923309, -0.6989774, -2.88203, 1, 1, 1, 1, 1,
-0.5912129, -0.1587663, -3.531917, 1, 1, 1, 1, 1,
-0.5901786, 0.7565363, -1.871014, 1, 1, 1, 1, 1,
-0.5900916, -0.5492265, -2.876908, 1, 1, 1, 1, 1,
-0.5883179, -0.5019445, -2.256405, 0, 0, 1, 1, 1,
-0.5827679, -0.7053888, -2.498577, 1, 0, 0, 1, 1,
-0.5767404, 0.9342774, -1.347136, 1, 0, 0, 1, 1,
-0.5749808, 1.689836, 0.3877277, 1, 0, 0, 1, 1,
-0.5744989, -0.6657265, -1.204593, 1, 0, 0, 1, 1,
-0.560873, -1.143716, -1.668901, 1, 0, 0, 1, 1,
-0.5595406, -1.370279, -1.003108, 0, 0, 0, 1, 1,
-0.5469604, -0.1652984, -1.059254, 0, 0, 0, 1, 1,
-0.5466324, -0.8893648, -3.026875, 0, 0, 0, 1, 1,
-0.5452001, -0.3358875, -1.915078, 0, 0, 0, 1, 1,
-0.5433725, -0.06911316, -0.1595034, 0, 0, 0, 1, 1,
-0.5426924, -1.360603, -2.351014, 0, 0, 0, 1, 1,
-0.5418215, 1.734445, -0.6451259, 0, 0, 0, 1, 1,
-0.5378523, 0.5600393, -0.07713551, 1, 1, 1, 1, 1,
-0.5365398, -0.4819373, -1.593113, 1, 1, 1, 1, 1,
-0.5359515, -1.082017, -1.635932, 1, 1, 1, 1, 1,
-0.5354357, 3.005671, 0.3629001, 1, 1, 1, 1, 1,
-0.5335878, -0.8066639, -2.14922, 1, 1, 1, 1, 1,
-0.5239601, 0.9620689, -1.051825, 1, 1, 1, 1, 1,
-0.5226033, 0.5568013, -1.263993, 1, 1, 1, 1, 1,
-0.5188233, 0.4236057, -1.403385, 1, 1, 1, 1, 1,
-0.5151676, 1.95513, 0.5258291, 1, 1, 1, 1, 1,
-0.5138773, -0.1649404, -2.395575, 1, 1, 1, 1, 1,
-0.5136421, -1.379563, -2.705121, 1, 1, 1, 1, 1,
-0.5136383, -0.3547872, -0.9039323, 1, 1, 1, 1, 1,
-0.5091232, 2.085441, 0.9988124, 1, 1, 1, 1, 1,
-0.5009739, 1.083673, -0.5683244, 1, 1, 1, 1, 1,
-0.5007265, -1.101967, -2.099452, 1, 1, 1, 1, 1,
-0.500559, -2.756178, -3.315553, 0, 0, 1, 1, 1,
-0.5002355, 0.1123972, 0.9390399, 1, 0, 0, 1, 1,
-0.4999504, 1.239509, -2.079187, 1, 0, 0, 1, 1,
-0.4960529, 1.526449, 0.367461, 1, 0, 0, 1, 1,
-0.4949365, 1.208217, -2.163814, 1, 0, 0, 1, 1,
-0.4945752, -1.961255, -2.771425, 1, 0, 0, 1, 1,
-0.4909, -1.135547, -5.36172, 0, 0, 0, 1, 1,
-0.4889193, -0.07926956, -4.866771, 0, 0, 0, 1, 1,
-0.4862667, 0.8370611, -0.1174946, 0, 0, 0, 1, 1,
-0.4860124, -0.7209954, -0.8305013, 0, 0, 0, 1, 1,
-0.4828763, 0.9534714, 1.115954, 0, 0, 0, 1, 1,
-0.4828556, 0.04331721, -1.268831, 0, 0, 0, 1, 1,
-0.4827194, 0.4852295, -0.4271154, 0, 0, 0, 1, 1,
-0.4774762, -0.1126544, -1.16075, 1, 1, 1, 1, 1,
-0.4773415, 0.5031532, -1.266262, 1, 1, 1, 1, 1,
-0.4771094, 0.3521497, -1.516975, 1, 1, 1, 1, 1,
-0.4749578, 0.009364368, -1.212574, 1, 1, 1, 1, 1,
-0.4742459, -0.4991666, -2.811756, 1, 1, 1, 1, 1,
-0.4689117, 1.265058, 0.1851058, 1, 1, 1, 1, 1,
-0.4682261, -1.34096, -2.473148, 1, 1, 1, 1, 1,
-0.4657316, -0.5235511, -3.783999, 1, 1, 1, 1, 1,
-0.4569955, -0.07461055, -0.01806135, 1, 1, 1, 1, 1,
-0.4506438, -0.2274276, -2.758626, 1, 1, 1, 1, 1,
-0.4493461, -0.4755592, -2.297224, 1, 1, 1, 1, 1,
-0.4416645, -1.258436, -2.650616, 1, 1, 1, 1, 1,
-0.4379162, 1.039908, -1.082037, 1, 1, 1, 1, 1,
-0.4366819, -0.9702805, -0.5811389, 1, 1, 1, 1, 1,
-0.4344681, -0.1135532, -2.383337, 1, 1, 1, 1, 1,
-0.4315267, -1.671223, -2.011823, 0, 0, 1, 1, 1,
-0.4235544, -1.310288, -3.414244, 1, 0, 0, 1, 1,
-0.4227692, 0.3596125, -1.599288, 1, 0, 0, 1, 1,
-0.4140708, 0.2991422, 1.107726, 1, 0, 0, 1, 1,
-0.4130275, -0.7565073, -2.284438, 1, 0, 0, 1, 1,
-0.4128645, 0.470176, 0.963203, 1, 0, 0, 1, 1,
-0.4119588, -1.175123, -4.56924, 0, 0, 0, 1, 1,
-0.4083693, 0.2155147, -2.119381, 0, 0, 0, 1, 1,
-0.4019441, 0.1942563, -1.585785, 0, 0, 0, 1, 1,
-0.3997926, -1.470697, -0.167973, 0, 0, 0, 1, 1,
-0.39893, 1.073865, 0.01258515, 0, 0, 0, 1, 1,
-0.3916477, -2.457775, -2.227771, 0, 0, 0, 1, 1,
-0.39145, -1.03345, -2.588773, 0, 0, 0, 1, 1,
-0.3914047, 0.1410383, -2.024103, 1, 1, 1, 1, 1,
-0.3897172, -1.677544, -5.058172, 1, 1, 1, 1, 1,
-0.3860012, -0.1351449, -2.206024, 1, 1, 1, 1, 1,
-0.384887, -1.405014, -1.434495, 1, 1, 1, 1, 1,
-0.3826385, -0.09506872, -0.8364861, 1, 1, 1, 1, 1,
-0.3820536, 0.7338524, -1.840941, 1, 1, 1, 1, 1,
-0.3789842, -1.24161, -2.347667, 1, 1, 1, 1, 1,
-0.3787331, -0.01940448, -1.303411, 1, 1, 1, 1, 1,
-0.3724428, 0.3348276, 0.5705106, 1, 1, 1, 1, 1,
-0.3716561, 1.828084, 0.1136174, 1, 1, 1, 1, 1,
-0.3702937, 0.630258, -1.007396, 1, 1, 1, 1, 1,
-0.3675815, 0.4113286, 0.08860131, 1, 1, 1, 1, 1,
-0.3673093, 1.367611, -0.3313917, 1, 1, 1, 1, 1,
-0.3632702, 1.033163, -0.2394461, 1, 1, 1, 1, 1,
-0.3587494, 0.09300441, -1.814453, 1, 1, 1, 1, 1,
-0.3586694, 1.566049, -0.3306803, 0, 0, 1, 1, 1,
-0.3566438, -0.4561477, -3.479918, 1, 0, 0, 1, 1,
-0.356326, 1.147627, 1.048959, 1, 0, 0, 1, 1,
-0.3434224, -0.0623279, -1.701234, 1, 0, 0, 1, 1,
-0.3406444, 0.2318541, -1.072935, 1, 0, 0, 1, 1,
-0.3402988, 0.9518701, -0.7500222, 1, 0, 0, 1, 1,
-0.3400141, 0.04096857, -1.414904, 0, 0, 0, 1, 1,
-0.3393115, 1.093657, 0.8094201, 0, 0, 0, 1, 1,
-0.3377913, -0.8927925, -1.226222, 0, 0, 0, 1, 1,
-0.3367274, 0.2697481, -0.8859976, 0, 0, 0, 1, 1,
-0.3356596, 1.798394, 0.7098659, 0, 0, 0, 1, 1,
-0.3317988, 1.777901, -0.4980055, 0, 0, 0, 1, 1,
-0.3276993, 0.974565, 0.4883476, 0, 0, 0, 1, 1,
-0.3254427, 0.7960006, -1.039082, 1, 1, 1, 1, 1,
-0.3196652, -0.3714909, -2.691766, 1, 1, 1, 1, 1,
-0.3147959, -0.7505587, -2.814332, 1, 1, 1, 1, 1,
-0.3114619, 0.720049, -1.620103, 1, 1, 1, 1, 1,
-0.3088757, 0.5169668, 0.3541242, 1, 1, 1, 1, 1,
-0.3081598, -0.0353151, -2.589916, 1, 1, 1, 1, 1,
-0.306018, -1.161957, -2.625801, 1, 1, 1, 1, 1,
-0.3057005, 0.1039166, -2.058991, 1, 1, 1, 1, 1,
-0.3036445, 0.3936048, -2.066804, 1, 1, 1, 1, 1,
-0.3020101, 0.1001654, -2.484674, 1, 1, 1, 1, 1,
-0.29989, -0.9724605, -4.483833, 1, 1, 1, 1, 1,
-0.2974718, 1.589278, 0.0133947, 1, 1, 1, 1, 1,
-0.2882709, -0.5583256, -2.486225, 1, 1, 1, 1, 1,
-0.2839958, -0.3230736, -1.578527, 1, 1, 1, 1, 1,
-0.2831685, 0.4933359, -2.137199, 1, 1, 1, 1, 1,
-0.2795284, -0.2917086, -3.532573, 0, 0, 1, 1, 1,
-0.2764083, 0.793441, 0.005088486, 1, 0, 0, 1, 1,
-0.2761036, 0.03099602, -1.14451, 1, 0, 0, 1, 1,
-0.2751451, 0.05090625, -0.3650869, 1, 0, 0, 1, 1,
-0.2727322, 2.330666, -1.449241, 1, 0, 0, 1, 1,
-0.2714555, 0.4883746, -2.079721, 1, 0, 0, 1, 1,
-0.2701422, -0.9564326, -1.944411, 0, 0, 0, 1, 1,
-0.2668354, 0.497571, -1.945949, 0, 0, 0, 1, 1,
-0.2645773, 0.5398744, 0.1214411, 0, 0, 0, 1, 1,
-0.2598962, 1.056104, -1.755073, 0, 0, 0, 1, 1,
-0.2565684, -1.14681, -2.316741, 0, 0, 0, 1, 1,
-0.2564805, 0.1707678, -1.592904, 0, 0, 0, 1, 1,
-0.2545801, -1.185989, -0.9367983, 0, 0, 0, 1, 1,
-0.2527462, -0.683142, -1.741957, 1, 1, 1, 1, 1,
-0.250487, 0.3756398, -1.528171, 1, 1, 1, 1, 1,
-0.2474631, -0.229413, -1.987556, 1, 1, 1, 1, 1,
-0.2463902, -0.3375992, -1.914847, 1, 1, 1, 1, 1,
-0.2405141, 0.477272, -0.8060965, 1, 1, 1, 1, 1,
-0.2357196, -1.075112, -4.080993, 1, 1, 1, 1, 1,
-0.231702, 0.1698906, -0.8606896, 1, 1, 1, 1, 1,
-0.2274865, 0.2281564, -0.1525603, 1, 1, 1, 1, 1,
-0.2261047, 0.9494079, 0.7786042, 1, 1, 1, 1, 1,
-0.2239097, 1.278542, 0.3946416, 1, 1, 1, 1, 1,
-0.2231331, 0.5846581, -1.747983, 1, 1, 1, 1, 1,
-0.2211616, 1.860504, 0.3579149, 1, 1, 1, 1, 1,
-0.2210875, 0.0892537, -1.087903, 1, 1, 1, 1, 1,
-0.2191087, -1.236568, -3.148814, 1, 1, 1, 1, 1,
-0.2187274, -0.8333317, -1.019915, 1, 1, 1, 1, 1,
-0.2182064, -1.302444, -2.667287, 0, 0, 1, 1, 1,
-0.2174388, 0.581403, 0.3299469, 1, 0, 0, 1, 1,
-0.2169313, -0.7116153, -2.837735, 1, 0, 0, 1, 1,
-0.2167767, 0.4503907, -0.3811659, 1, 0, 0, 1, 1,
-0.2165122, 0.4548858, 0.5494016, 1, 0, 0, 1, 1,
-0.2158647, -0.1427809, -2.867368, 1, 0, 0, 1, 1,
-0.2151974, -0.01219407, -0.656047, 0, 0, 0, 1, 1,
-0.2143999, -0.2193192, -1.158214, 0, 0, 0, 1, 1,
-0.214282, -2.336825, -3.38811, 0, 0, 0, 1, 1,
-0.2120262, -1.881396, -4.194246, 0, 0, 0, 1, 1,
-0.2029898, -1.153016, -2.539513, 0, 0, 0, 1, 1,
-0.2022315, 0.9720715, 0.7579861, 0, 0, 0, 1, 1,
-0.199385, 0.3811309, -1.140667, 0, 0, 0, 1, 1,
-0.1979235, -0.1710459, -3.616948, 1, 1, 1, 1, 1,
-0.1977842, 0.6867843, -0.8655742, 1, 1, 1, 1, 1,
-0.1929375, 0.5230048, -0.07014867, 1, 1, 1, 1, 1,
-0.1834655, 0.1663673, -1.638358, 1, 1, 1, 1, 1,
-0.1807466, -0.5433998, -2.581435, 1, 1, 1, 1, 1,
-0.1794503, -0.6602891, -2.258134, 1, 1, 1, 1, 1,
-0.1790234, 0.2844139, -0.3878766, 1, 1, 1, 1, 1,
-0.1787764, -0.8455593, -3.318656, 1, 1, 1, 1, 1,
-0.1777579, -0.6800318, -2.533915, 1, 1, 1, 1, 1,
-0.1767723, -0.003297174, -1.72379, 1, 1, 1, 1, 1,
-0.1752006, 0.1066109, -0.2261663, 1, 1, 1, 1, 1,
-0.1739379, -0.6848804, -2.894792, 1, 1, 1, 1, 1,
-0.1713261, 1.092505, -0.5121392, 1, 1, 1, 1, 1,
-0.1710186, 0.6728537, -0.06086049, 1, 1, 1, 1, 1,
-0.1706852, -0.2643166, -2.631637, 1, 1, 1, 1, 1,
-0.1690687, 0.5398716, -1.856284, 0, 0, 1, 1, 1,
-0.1610624, 1.484311, -1.655274, 1, 0, 0, 1, 1,
-0.1596841, -1.663239, -1.966213, 1, 0, 0, 1, 1,
-0.1559702, 1.15308, 1.005338, 1, 0, 0, 1, 1,
-0.1535822, -0.944823, -2.295333, 1, 0, 0, 1, 1,
-0.1531571, 0.02461957, -0.3331403, 1, 0, 0, 1, 1,
-0.152668, 1.041684, -1.869702, 0, 0, 0, 1, 1,
-0.1510194, 0.4578462, -2.313884, 0, 0, 0, 1, 1,
-0.1504374, -0.1821415, -1.008754, 0, 0, 0, 1, 1,
-0.1468893, -0.02551849, -0.5170972, 0, 0, 0, 1, 1,
-0.1450802, 0.2124768, -1.818141, 0, 0, 0, 1, 1,
-0.1418718, -0.2297086, -3.380725, 0, 0, 0, 1, 1,
-0.140576, -1.18531, -2.779385, 0, 0, 0, 1, 1,
-0.1300253, 0.3266532, -0.6561018, 1, 1, 1, 1, 1,
-0.1265064, 0.191382, -1.521737, 1, 1, 1, 1, 1,
-0.1257763, 1.448156, -0.4881216, 1, 1, 1, 1, 1,
-0.1242262, 1.196132, -0.1609287, 1, 1, 1, 1, 1,
-0.1216788, 1.324272, 0.6219951, 1, 1, 1, 1, 1,
-0.1169325, 0.6439836, -0.166372, 1, 1, 1, 1, 1,
-0.1166728, -0.9907903, -2.306875, 1, 1, 1, 1, 1,
-0.1080005, -0.01831465, -4.213506, 1, 1, 1, 1, 1,
-0.1021662, -1.714381, -3.422004, 1, 1, 1, 1, 1,
-0.1021658, 1.740413, 0.5898142, 1, 1, 1, 1, 1,
-0.09907356, 1.678934, -0.915029, 1, 1, 1, 1, 1,
-0.09413505, -1.586623, -3.582036, 1, 1, 1, 1, 1,
-0.09144746, 1.18205, -0.806976, 1, 1, 1, 1, 1,
-0.08958343, -0.6505442, -2.153755, 1, 1, 1, 1, 1,
-0.08610826, 0.3128062, -0.8080273, 1, 1, 1, 1, 1,
-0.08206894, -1.835023, -3.929092, 0, 0, 1, 1, 1,
-0.07858963, -0.3479501, -2.307579, 1, 0, 0, 1, 1,
-0.07466534, -0.6637207, -2.476915, 1, 0, 0, 1, 1,
-0.07282483, 0.1923391, 0.09467583, 1, 0, 0, 1, 1,
-0.06937133, 1.370186, -0.5887978, 1, 0, 0, 1, 1,
-0.06712998, 1.048822, 0.2017716, 1, 0, 0, 1, 1,
-0.06434982, 0.2816111, -0.8852285, 0, 0, 0, 1, 1,
-0.06161476, 0.1876511, -0.0538698, 0, 0, 0, 1, 1,
-0.06103547, 1.488686, 1.426242, 0, 0, 0, 1, 1,
-0.05797624, -0.616354, -3.450666, 0, 0, 0, 1, 1,
-0.05450051, 0.1558139, -1.121691, 0, 0, 0, 1, 1,
-0.0527008, 0.2615503, -0.5598003, 0, 0, 0, 1, 1,
-0.05264377, 0.8063003, 2.110609, 0, 0, 0, 1, 1,
-0.05158454, -0.04709621, -2.862999, 1, 1, 1, 1, 1,
-0.05089405, 0.1190274, 1.105349, 1, 1, 1, 1, 1,
-0.04812967, -0.2112454, -2.012458, 1, 1, 1, 1, 1,
-0.04719216, 0.7873133, -0.8621246, 1, 1, 1, 1, 1,
-0.0439357, -0.6411713, -3.131799, 1, 1, 1, 1, 1,
-0.03978409, -0.9042743, -5.262208, 1, 1, 1, 1, 1,
-0.03718336, -0.8508962, -4.190492, 1, 1, 1, 1, 1,
-0.03576588, -1.547526, -2.867825, 1, 1, 1, 1, 1,
-0.03573604, 0.2763807, -0.6686217, 1, 1, 1, 1, 1,
-0.035679, 1.535536, 1.454728, 1, 1, 1, 1, 1,
-0.0354106, -1.535015, -2.781552, 1, 1, 1, 1, 1,
-0.03419404, -1.097697, -2.870187, 1, 1, 1, 1, 1,
-0.0289759, -0.7683405, -2.810364, 1, 1, 1, 1, 1,
-0.02678272, 0.2837803, -0.1774992, 1, 1, 1, 1, 1,
-0.02658221, 0.566943, 0.3956513, 1, 1, 1, 1, 1,
-0.02640231, -0.2348996, -3.773835, 0, 0, 1, 1, 1,
-0.0252946, 0.08974084, -1.496428, 1, 0, 0, 1, 1,
-0.02527092, 1.435718, 0.7427231, 1, 0, 0, 1, 1,
-0.02347334, 0.8241183, -1.012456, 1, 0, 0, 1, 1,
-0.02262529, -0.8514443, -2.726106, 1, 0, 0, 1, 1,
-0.0207031, -1.268922, -4.372754, 1, 0, 0, 1, 1,
-0.01948491, -0.5679374, -3.734555, 0, 0, 0, 1, 1,
-0.01648619, -0.1418778, -3.261245, 0, 0, 0, 1, 1,
-0.01020255, 1.362479, -0.03383702, 0, 0, 0, 1, 1,
-0.005774339, -0.9108312, -3.163428, 0, 0, 0, 1, 1,
-0.0002132547, 1.267779, -0.2331219, 0, 0, 0, 1, 1,
0.002965638, 0.3661323, -0.2878321, 0, 0, 0, 1, 1,
0.004137549, -1.072555, 3.48513, 0, 0, 0, 1, 1,
0.006707051, 0.211662, 1.183097, 1, 1, 1, 1, 1,
0.007191563, -0.3939173, 2.00983, 1, 1, 1, 1, 1,
0.009790067, -0.313923, 3.820506, 1, 1, 1, 1, 1,
0.01192667, 0.0609546, 0.9571012, 1, 1, 1, 1, 1,
0.01491818, 0.2224743, 0.6905056, 1, 1, 1, 1, 1,
0.0246504, 0.6370139, -0.7408649, 1, 1, 1, 1, 1,
0.02699664, 0.6206414, 0.7073964, 1, 1, 1, 1, 1,
0.02853923, -1.668813, 2.393751, 1, 1, 1, 1, 1,
0.0291128, 0.01265498, 1.708479, 1, 1, 1, 1, 1,
0.03219522, -0.009612022, 3.204085, 1, 1, 1, 1, 1,
0.03355938, 0.7581509, -2.145043, 1, 1, 1, 1, 1,
0.03573496, -0.026965, 4.692041, 1, 1, 1, 1, 1,
0.03680996, -0.4297372, 3.132843, 1, 1, 1, 1, 1,
0.03849407, -2.015945, 5.272085, 1, 1, 1, 1, 1,
0.04061422, 1.005338, 0.268241, 1, 1, 1, 1, 1,
0.04659417, -0.8337181, 1.698833, 0, 0, 1, 1, 1,
0.0505052, -0.127266, 3.685559, 1, 0, 0, 1, 1,
0.05228526, -1.130829, 2.617387, 1, 0, 0, 1, 1,
0.0549137, 0.004456458, 0.3077398, 1, 0, 0, 1, 1,
0.05664358, 1.087438, 1.990283, 1, 0, 0, 1, 1,
0.06066287, 0.3835696, -0.207646, 1, 0, 0, 1, 1,
0.06086405, -0.791137, 1.440603, 0, 0, 0, 1, 1,
0.06181, -0.9777856, 3.523079, 0, 0, 0, 1, 1,
0.06338368, 0.561208, -1.086447, 0, 0, 0, 1, 1,
0.06630383, 0.5673167, 2.851177, 0, 0, 0, 1, 1,
0.07275703, 0.3389942, 1.703929, 0, 0, 0, 1, 1,
0.07339159, -1.876361, 3.337628, 0, 0, 0, 1, 1,
0.07377517, 0.3646794, 0.1435809, 0, 0, 0, 1, 1,
0.07642751, -1.449232, 3.514957, 1, 1, 1, 1, 1,
0.0829538, -0.2959192, 3.955903, 1, 1, 1, 1, 1,
0.08329614, 0.9592082, 0.8809143, 1, 1, 1, 1, 1,
0.08673327, -0.7801705, 2.451687, 1, 1, 1, 1, 1,
0.08878578, 0.2662755, 1.503364, 1, 1, 1, 1, 1,
0.08900154, -0.2079279, 0.9419378, 1, 1, 1, 1, 1,
0.08922233, 0.3485375, 1.452893, 1, 1, 1, 1, 1,
0.08932582, -0.933526, 1.310524, 1, 1, 1, 1, 1,
0.09021111, 1.331005, -1.652755, 1, 1, 1, 1, 1,
0.1002674, -1.791911, 1.614034, 1, 1, 1, 1, 1,
0.1019529, -0.02561362, 1.056278, 1, 1, 1, 1, 1,
0.1026708, -0.2646617, 2.938781, 1, 1, 1, 1, 1,
0.1033242, -0.2053819, 3.053679, 1, 1, 1, 1, 1,
0.1040398, 1.344463, -0.8656465, 1, 1, 1, 1, 1,
0.1091282, 0.2550792, 0.2892297, 1, 1, 1, 1, 1,
0.1092582, 0.01812137, 0.3086507, 0, 0, 1, 1, 1,
0.1149979, 0.4607559, 1.553668, 1, 0, 0, 1, 1,
0.1169703, 0.9684476, -1.045032, 1, 0, 0, 1, 1,
0.1189786, -1.359766, 3.079583, 1, 0, 0, 1, 1,
0.1206803, 1.083916, 1.426421, 1, 0, 0, 1, 1,
0.1314385, 0.8800326, 0.2719486, 1, 0, 0, 1, 1,
0.1322303, 0.4716656, -1.195379, 0, 0, 0, 1, 1,
0.1337644, -1.000864, 1.308267, 0, 0, 0, 1, 1,
0.139724, -0.06918065, 1.943552, 0, 0, 0, 1, 1,
0.1402466, -1.100831, 2.282041, 0, 0, 0, 1, 1,
0.1438578, -1.526835, 4.16694, 0, 0, 0, 1, 1,
0.1485622, 2.146605, 0.2643019, 0, 0, 0, 1, 1,
0.1490237, -1.362596, 3.357333, 0, 0, 0, 1, 1,
0.1517241, 0.9104021, 0.1353688, 1, 1, 1, 1, 1,
0.1550079, -0.6454799, 2.461408, 1, 1, 1, 1, 1,
0.1585357, -0.2704231, 2.755549, 1, 1, 1, 1, 1,
0.1602032, -0.5711415, 2.498619, 1, 1, 1, 1, 1,
0.1685782, 0.02478214, 0.8529596, 1, 1, 1, 1, 1,
0.1791959, -1.612572, 2.747673, 1, 1, 1, 1, 1,
0.179729, -0.6759743, 5.441731, 1, 1, 1, 1, 1,
0.1805929, 1.343926, -1.048826, 1, 1, 1, 1, 1,
0.1826204, -0.9755264, 3.766045, 1, 1, 1, 1, 1,
0.1838324, 0.3522775, 2.435684, 1, 1, 1, 1, 1,
0.1852309, -0.2810908, 3.039303, 1, 1, 1, 1, 1,
0.1864017, 0.7956762, 1.334784, 1, 1, 1, 1, 1,
0.1873185, -0.05078921, 2.848508, 1, 1, 1, 1, 1,
0.1887109, 0.9031622, 0.1504002, 1, 1, 1, 1, 1,
0.1892953, -0.3812065, 3.584736, 1, 1, 1, 1, 1,
0.2010346, 0.1887242, 0.6967802, 0, 0, 1, 1, 1,
0.2023289, 0.6226209, 0.5938423, 1, 0, 0, 1, 1,
0.2063879, -0.1580853, 3.211056, 1, 0, 0, 1, 1,
0.2064439, 1.885372, 0.01190945, 1, 0, 0, 1, 1,
0.2088944, 0.9111019, 1.103296, 1, 0, 0, 1, 1,
0.2106126, 1.397074, 0.1352503, 1, 0, 0, 1, 1,
0.2122696, -0.5853379, 0.7275144, 0, 0, 0, 1, 1,
0.2151514, -1.022702, 2.47133, 0, 0, 0, 1, 1,
0.2163002, 1.571037, 0.7276375, 0, 0, 0, 1, 1,
0.2220427, 0.9336717, 0.1194809, 0, 0, 0, 1, 1,
0.2221067, 0.5057144, 0.8039706, 0, 0, 0, 1, 1,
0.2317079, 0.2115971, 2.209991, 0, 0, 0, 1, 1,
0.2322952, 0.6842709, 0.5063168, 0, 0, 0, 1, 1,
0.2374304, 0.2747521, 0.3323445, 1, 1, 1, 1, 1,
0.2375805, 0.2783449, -0.07628004, 1, 1, 1, 1, 1,
0.2384457, -0.4941255, 2.676366, 1, 1, 1, 1, 1,
0.2415151, -1.02612, 4.040051, 1, 1, 1, 1, 1,
0.2420616, -0.438058, 1.876133, 1, 1, 1, 1, 1,
0.2451041, -0.4233674, 3.688636, 1, 1, 1, 1, 1,
0.248182, -0.8200577, 3.750973, 1, 1, 1, 1, 1,
0.2521594, 0.9968069, 1.850793, 1, 1, 1, 1, 1,
0.2530682, 1.329184, -1.300785, 1, 1, 1, 1, 1,
0.2551157, 0.1596448, 1.710539, 1, 1, 1, 1, 1,
0.2564777, 0.2166745, 0.9138293, 1, 1, 1, 1, 1,
0.2593199, -0.01097452, 2.166831, 1, 1, 1, 1, 1,
0.2611499, -0.2545352, 3.330452, 1, 1, 1, 1, 1,
0.2622285, -0.6309906, 4.299603, 1, 1, 1, 1, 1,
0.2623918, 0.3179646, 0.09437263, 1, 1, 1, 1, 1,
0.2625065, 0.8233896, 1.173947, 0, 0, 1, 1, 1,
0.2632092, 0.8142883, -0.7157384, 1, 0, 0, 1, 1,
0.2632464, 0.02304352, 0.5735999, 1, 0, 0, 1, 1,
0.2737219, -1.034705, 2.837435, 1, 0, 0, 1, 1,
0.2746212, 0.3254305, 2.728082, 1, 0, 0, 1, 1,
0.2800399, 0.3213876, 1.939488, 1, 0, 0, 1, 1,
0.2850538, -0.8177453, 2.750976, 0, 0, 0, 1, 1,
0.285575, 0.2842884, 0.5585902, 0, 0, 0, 1, 1,
0.2855791, 0.7966587, 1.484104, 0, 0, 0, 1, 1,
0.2856876, -0.5779424, 1.567527, 0, 0, 0, 1, 1,
0.2857341, -1.58351, 1.607124, 0, 0, 0, 1, 1,
0.2883251, 0.3650001, 1.953002, 0, 0, 0, 1, 1,
0.2969142, 0.4799054, 1.674523, 0, 0, 0, 1, 1,
0.2993151, -0.9678819, 3.756703, 1, 1, 1, 1, 1,
0.2999643, -0.02718028, 1.064818, 1, 1, 1, 1, 1,
0.3122686, 0.9031335, 0.3896213, 1, 1, 1, 1, 1,
0.3132772, -1.081808, 1.629586, 1, 1, 1, 1, 1,
0.3165598, 1.278636, 0.3802619, 1, 1, 1, 1, 1,
0.326083, -0.1501326, 0.6355245, 1, 1, 1, 1, 1,
0.3284069, -0.6153278, 2.827441, 1, 1, 1, 1, 1,
0.3316784, 0.8997152, -1.422465, 1, 1, 1, 1, 1,
0.3334016, 0.02227841, 0.7549567, 1, 1, 1, 1, 1,
0.3363095, -0.06734361, 2.648457, 1, 1, 1, 1, 1,
0.3384674, -0.3063421, 0.7864041, 1, 1, 1, 1, 1,
0.3415864, 1.671458, 0.5077121, 1, 1, 1, 1, 1,
0.341755, -0.7481679, 2.055893, 1, 1, 1, 1, 1,
0.3460908, 0.8306872, -0.3874959, 1, 1, 1, 1, 1,
0.347706, -0.1214322, 2.169735, 1, 1, 1, 1, 1,
0.3488526, -0.8697631, 1.769617, 0, 0, 1, 1, 1,
0.3491492, -0.6525089, 4.202054, 1, 0, 0, 1, 1,
0.3507684, 0.4485708, 0.7200174, 1, 0, 0, 1, 1,
0.353887, -0.711689, 2.622708, 1, 0, 0, 1, 1,
0.35431, 0.3927124, 1.143167, 1, 0, 0, 1, 1,
0.3603894, 0.192841, 1.153708, 1, 0, 0, 1, 1,
0.3615489, 2.46475, 0.08185789, 0, 0, 0, 1, 1,
0.3637909, 1.080745, -0.2723041, 0, 0, 0, 1, 1,
0.3703831, -0.6780838, 2.371897, 0, 0, 0, 1, 1,
0.371405, 0.772846, 1.567336, 0, 0, 0, 1, 1,
0.3805492, 1.068037, 0.7226201, 0, 0, 0, 1, 1,
0.3837066, -0.7125885, 1.726834, 0, 0, 0, 1, 1,
0.3885954, -0.02956762, -0.1916988, 0, 0, 0, 1, 1,
0.3913816, 1.112955, -0.2239033, 1, 1, 1, 1, 1,
0.3924879, -2.295429, 2.869095, 1, 1, 1, 1, 1,
0.3945961, 0.3679481, 2.260043, 1, 1, 1, 1, 1,
0.3950804, 0.2632734, 0.05168836, 1, 1, 1, 1, 1,
0.3956842, 0.498362, 1.230636, 1, 1, 1, 1, 1,
0.3970442, 0.1511681, 0.9894229, 1, 1, 1, 1, 1,
0.4051475, -0.1583132, 1.546197, 1, 1, 1, 1, 1,
0.4109839, 1.898536, -0.7587448, 1, 1, 1, 1, 1,
0.413545, 0.3624098, 0.1069402, 1, 1, 1, 1, 1,
0.4189041, 0.9887546, 1.058197, 1, 1, 1, 1, 1,
0.4213448, 1.113395, 1.311688, 1, 1, 1, 1, 1,
0.4215891, 0.2299552, 1.348108, 1, 1, 1, 1, 1,
0.421849, 2.13983, -2.479395, 1, 1, 1, 1, 1,
0.4275671, 0.5602517, 0.2172306, 1, 1, 1, 1, 1,
0.4316453, 0.2924853, 1.587261, 1, 1, 1, 1, 1,
0.4352194, 0.1252434, 0.8821338, 0, 0, 1, 1, 1,
0.4362607, -0.8265898, 2.727548, 1, 0, 0, 1, 1,
0.4436857, -1.350002, 0.3962882, 1, 0, 0, 1, 1,
0.4479946, -0.886297, 1.279968, 1, 0, 0, 1, 1,
0.449899, 1.247384, 0.0583633, 1, 0, 0, 1, 1,
0.4532342, 1.750846, 1.365842, 1, 0, 0, 1, 1,
0.45406, -1.084146, 2.680794, 0, 0, 0, 1, 1,
0.4548641, 0.4099614, 1.13827, 0, 0, 0, 1, 1,
0.456325, 0.1183746, 0.2562725, 0, 0, 0, 1, 1,
0.4591083, -0.8766146, 3.124127, 0, 0, 0, 1, 1,
0.4593691, -0.3955289, 2.388686, 0, 0, 0, 1, 1,
0.4643804, -0.03770859, 0.8264279, 0, 0, 0, 1, 1,
0.470735, -0.09051304, 1.21888, 0, 0, 0, 1, 1,
0.4766047, -0.5769278, 2.294907, 1, 1, 1, 1, 1,
0.4770955, 0.5487167, -0.2367125, 1, 1, 1, 1, 1,
0.4828075, 1.641834, -1.153081, 1, 1, 1, 1, 1,
0.4870189, -2.362029, 1.183817, 1, 1, 1, 1, 1,
0.4898763, 1.705417, -1.249672, 1, 1, 1, 1, 1,
0.4924589, -0.6070972, 4.190316, 1, 1, 1, 1, 1,
0.494171, 0.8635121, 1.070579, 1, 1, 1, 1, 1,
0.4956347, 0.1512364, 1.039554, 1, 1, 1, 1, 1,
0.495838, -0.849488, 4.225379, 1, 1, 1, 1, 1,
0.4960035, 1.528476, 0.009948941, 1, 1, 1, 1, 1,
0.4969212, -0.8259968, 2.928893, 1, 1, 1, 1, 1,
0.4969516, 1.23073, 0.4949952, 1, 1, 1, 1, 1,
0.498533, -0.8933322, 2.244559, 1, 1, 1, 1, 1,
0.4992259, -0.6321375, 3.187765, 1, 1, 1, 1, 1,
0.5004137, 0.7085466, 1.159026, 1, 1, 1, 1, 1,
0.5019197, 0.5799886, 0.9487031, 0, 0, 1, 1, 1,
0.5052118, -0.8025892, 2.315351, 1, 0, 0, 1, 1,
0.5104249, -0.6526152, 1.677876, 1, 0, 0, 1, 1,
0.5152884, -0.8176229, 4.000098, 1, 0, 0, 1, 1,
0.5179001, -0.8280965, 1.201907, 1, 0, 0, 1, 1,
0.5180826, -0.1287364, 0.03490585, 1, 0, 0, 1, 1,
0.5194783, 1.298224, -0.1985928, 0, 0, 0, 1, 1,
0.521496, -1.275677, 2.599272, 0, 0, 0, 1, 1,
0.5276131, -0.4469801, 3.336539, 0, 0, 0, 1, 1,
0.5312731, -0.435642, 3.515989, 0, 0, 0, 1, 1,
0.5358985, -0.5634553, 1.433594, 0, 0, 0, 1, 1,
0.5376862, 2.523271, -0.4335162, 0, 0, 0, 1, 1,
0.552626, -0.673486, 3.923277, 0, 0, 0, 1, 1,
0.5654338, 1.319189, -1.314, 1, 1, 1, 1, 1,
0.5657473, 0.2722037, 1.055756, 1, 1, 1, 1, 1,
0.5716948, -0.7445724, 2.425991, 1, 1, 1, 1, 1,
0.5728027, 0.4411702, 0.2569622, 1, 1, 1, 1, 1,
0.5731501, -1.938815, 2.876302, 1, 1, 1, 1, 1,
0.573563, -0.4466538, 0.7540851, 1, 1, 1, 1, 1,
0.5753174, 0.5393408, 1.009227, 1, 1, 1, 1, 1,
0.5763667, 0.4509441, -1.031558, 1, 1, 1, 1, 1,
0.5767046, 0.761286, 1.479657, 1, 1, 1, 1, 1,
0.5767127, -0.4027088, 0.9837108, 1, 1, 1, 1, 1,
0.5852648, -0.2836738, 1.861564, 1, 1, 1, 1, 1,
0.585526, -0.1806751, 1.823216, 1, 1, 1, 1, 1,
0.5865788, -0.4035367, 1.924376, 1, 1, 1, 1, 1,
0.5878415, 1.411918, 0.06118929, 1, 1, 1, 1, 1,
0.5914202, -0.03836469, 2.61224, 1, 1, 1, 1, 1,
0.5924162, -0.1482272, 2.025168, 0, 0, 1, 1, 1,
0.5946893, 0.9361775, 2.337485, 1, 0, 0, 1, 1,
0.5969997, -1.824729, 2.65445, 1, 0, 0, 1, 1,
0.597711, 1.299827, -0.2745819, 1, 0, 0, 1, 1,
0.6025353, 0.8466969, 0.09772474, 1, 0, 0, 1, 1,
0.6089116, -0.8122128, 1.949528, 1, 0, 0, 1, 1,
0.6101001, 0.2137729, 0.5243724, 0, 0, 0, 1, 1,
0.6106312, -0.63988, 2.520601, 0, 0, 0, 1, 1,
0.6184072, 1.450098, 0.07882321, 0, 0, 0, 1, 1,
0.6186084, -0.3006558, 1.07507, 0, 0, 0, 1, 1,
0.6214457, -1.333279, 2.985589, 0, 0, 0, 1, 1,
0.6267074, 0.7587271, 0.1502778, 0, 0, 0, 1, 1,
0.6272441, 0.9241557, 1.512426, 0, 0, 0, 1, 1,
0.6319769, -0.4708504, 2.707214, 1, 1, 1, 1, 1,
0.6338087, -0.6631638, 5.578869, 1, 1, 1, 1, 1,
0.636308, 2.093181, 0.6887223, 1, 1, 1, 1, 1,
0.6382528, 0.8947637, 2.053298, 1, 1, 1, 1, 1,
0.6465074, -0.6304688, 2.607482, 1, 1, 1, 1, 1,
0.6470723, 0.07660387, 1.483951, 1, 1, 1, 1, 1,
0.6538181, -0.5737314, 2.638697, 1, 1, 1, 1, 1,
0.6539394, -0.0424855, 0.8919449, 1, 1, 1, 1, 1,
0.6593678, 1.471657, -0.7393981, 1, 1, 1, 1, 1,
0.6595483, 0.8047823, -0.5928318, 1, 1, 1, 1, 1,
0.6659641, -1.423344, 3.185706, 1, 1, 1, 1, 1,
0.6677428, -0.9432817, 1.710581, 1, 1, 1, 1, 1,
0.6683867, -0.7763386, 2.919098, 1, 1, 1, 1, 1,
0.6732044, -1.097524, 3.451646, 1, 1, 1, 1, 1,
0.6785429, 0.04761805, 2.282657, 1, 1, 1, 1, 1,
0.6797612, 0.1615141, 1.249926, 0, 0, 1, 1, 1,
0.6909457, -0.01133402, 2.476443, 1, 0, 0, 1, 1,
0.6913148, -0.5909051, 2.101592, 1, 0, 0, 1, 1,
0.6952786, -0.7290851, 2.517707, 1, 0, 0, 1, 1,
0.6957607, -0.834605, 1.769491, 1, 0, 0, 1, 1,
0.6992939, 0.6018565, -0.3507878, 1, 0, 0, 1, 1,
0.7002373, 0.1486203, 0.964245, 0, 0, 0, 1, 1,
0.7084956, 0.5744168, 1.211795, 0, 0, 0, 1, 1,
0.7138387, 0.4578584, -0.4225925, 0, 0, 0, 1, 1,
0.7152429, -1.759522, 3.621008, 0, 0, 0, 1, 1,
0.7182504, -0.9889317, 0.4610203, 0, 0, 0, 1, 1,
0.7305734, -0.260116, 0.6746119, 0, 0, 0, 1, 1,
0.7343889, 0.02275965, 1.098891, 0, 0, 0, 1, 1,
0.7377677, 0.1530057, 1.075091, 1, 1, 1, 1, 1,
0.7432644, 0.1419674, -0.3647562, 1, 1, 1, 1, 1,
0.744403, 1.755437, -0.7092317, 1, 1, 1, 1, 1,
0.7474284, 0.4585348, 0.2366021, 1, 1, 1, 1, 1,
0.7477151, 0.4106984, 0.7155573, 1, 1, 1, 1, 1,
0.749738, 0.3069062, 0.9244285, 1, 1, 1, 1, 1,
0.7520737, -1.89158, 3.066536, 1, 1, 1, 1, 1,
0.7534553, 0.5463578, 0.841125, 1, 1, 1, 1, 1,
0.7568445, 0.3580085, 1.295876, 1, 1, 1, 1, 1,
0.7584041, 0.8703957, 1.019833, 1, 1, 1, 1, 1,
0.7600366, 0.09002474, -0.6919702, 1, 1, 1, 1, 1,
0.7627285, -0.0242968, 3.331282, 1, 1, 1, 1, 1,
0.7716957, -1.548767, 0.9890394, 1, 1, 1, 1, 1,
0.7736312, 1.304069, -0.3722597, 1, 1, 1, 1, 1,
0.774639, 0.05974257, 0.01928976, 1, 1, 1, 1, 1,
0.7861784, -0.8358992, 3.434948, 0, 0, 1, 1, 1,
0.7863471, -0.2578276, 1.184462, 1, 0, 0, 1, 1,
0.7962675, 2.363774, 2.923383, 1, 0, 0, 1, 1,
0.7982126, -1.392874, 0.6211721, 1, 0, 0, 1, 1,
0.8017249, -1.637893, 0.936609, 1, 0, 0, 1, 1,
0.8034623, -0.4007958, 2.769551, 1, 0, 0, 1, 1,
0.8061506, -0.4895125, 3.280135, 0, 0, 0, 1, 1,
0.8097339, -0.1332179, 1.655157, 0, 0, 0, 1, 1,
0.8222802, -2.02801, 0.9285203, 0, 0, 0, 1, 1,
0.8248652, -1.442716, 4.030459, 0, 0, 0, 1, 1,
0.8250138, -1.036164, 2.249708, 0, 0, 0, 1, 1,
0.825083, 0.00475955, 1.161253, 0, 0, 0, 1, 1,
0.826945, 0.4600731, -0.06957195, 0, 0, 0, 1, 1,
0.8338813, -0.345909, 2.533887, 1, 1, 1, 1, 1,
0.8361746, 0.1074586, -1.007257, 1, 1, 1, 1, 1,
0.8464466, 1.304227, 0.3025159, 1, 1, 1, 1, 1,
0.8494377, 1.098353, 0.2578688, 1, 1, 1, 1, 1,
0.8520069, 0.4444257, 0.01638501, 1, 1, 1, 1, 1,
0.8551807, 0.6770978, 0.4614102, 1, 1, 1, 1, 1,
0.8558756, 0.4373949, 3.18755, 1, 1, 1, 1, 1,
0.8575041, -0.297969, 1.002333, 1, 1, 1, 1, 1,
0.8578175, 0.02613322, 0.8554488, 1, 1, 1, 1, 1,
0.8602734, 0.7422609, 1.898266, 1, 1, 1, 1, 1,
0.8671014, 0.258865, 0.9167274, 1, 1, 1, 1, 1,
0.8675057, -0.0387021, 2.19319, 1, 1, 1, 1, 1,
0.8735024, -0.02270236, 1.678259, 1, 1, 1, 1, 1,
0.8783808, 0.5207021, 2.554497, 1, 1, 1, 1, 1,
0.8786983, 1.517408, 1.330185, 1, 1, 1, 1, 1,
0.8793115, 0.1261307, 1.206951, 0, 0, 1, 1, 1,
0.879474, 0.05056614, 0.8084823, 1, 0, 0, 1, 1,
0.8797259, -1.790378, 4.05379, 1, 0, 0, 1, 1,
0.8819025, -0.1575103, 2.410261, 1, 0, 0, 1, 1,
0.8846425, -0.4278649, 1.261078, 1, 0, 0, 1, 1,
0.8899958, -0.4292254, -0.1202656, 1, 0, 0, 1, 1,
0.8906221, 0.03217038, 0.2419347, 0, 0, 0, 1, 1,
0.8913918, 1.250259, 1.69454, 0, 0, 0, 1, 1,
0.8935027, -0.01921172, 2.533088, 0, 0, 0, 1, 1,
0.8969572, 0.5127466, 1.58513, 0, 0, 0, 1, 1,
0.8980329, 0.7146672, 1.194486, 0, 0, 0, 1, 1,
0.9016608, 1.996678, -0.2187014, 0, 0, 0, 1, 1,
0.9045473, -1.498429, 3.354574, 0, 0, 0, 1, 1,
0.9059216, 0.3678172, 2.023208, 1, 1, 1, 1, 1,
0.9067597, -1.272644, 3.234386, 1, 1, 1, 1, 1,
0.9068334, 0.9562866, 0.8215327, 1, 1, 1, 1, 1,
0.9074337, -0.8458079, 2.026943, 1, 1, 1, 1, 1,
0.9152487, 1.223848, 1.34661, 1, 1, 1, 1, 1,
0.916673, -0.01052213, 2.24176, 1, 1, 1, 1, 1,
0.9197137, 0.244387, 1.740027, 1, 1, 1, 1, 1,
0.9198922, -0.3898186, 0.6435585, 1, 1, 1, 1, 1,
0.9355072, -0.2694805, 2.683142, 1, 1, 1, 1, 1,
0.9370849, -0.3084067, 1.561783, 1, 1, 1, 1, 1,
0.9376182, -1.344747, 1.718106, 1, 1, 1, 1, 1,
0.9403704, -0.3975778, 2.320297, 1, 1, 1, 1, 1,
0.9429462, 0.5158919, 0.7095616, 1, 1, 1, 1, 1,
0.9438648, -0.1773514, 3.392036, 1, 1, 1, 1, 1,
0.9448109, 1.944687, -1.654948, 1, 1, 1, 1, 1,
0.9454859, 0.4653691, 3.397857, 0, 0, 1, 1, 1,
0.9621283, -0.01583328, 1.676397, 1, 0, 0, 1, 1,
0.9634047, 0.2076884, 0.2716721, 1, 0, 0, 1, 1,
0.9702587, -1.611854, 2.624147, 1, 0, 0, 1, 1,
0.9862452, -2.501155, 2.659583, 1, 0, 0, 1, 1,
0.9871963, 0.590203, 1.280541, 1, 0, 0, 1, 1,
0.9878779, 0.7445118, 0.581351, 0, 0, 0, 1, 1,
0.9956897, 0.3139486, 1.802824, 0, 0, 0, 1, 1,
0.9980695, 0.9338329, 0.7512499, 0, 0, 0, 1, 1,
1.012729, 0.8646618, 0.3889485, 0, 0, 0, 1, 1,
1.015048, -2.084274, 2.68332, 0, 0, 0, 1, 1,
1.016737, 0.09367403, 0.309453, 0, 0, 0, 1, 1,
1.017903, -0.02632944, 1.582635, 0, 0, 0, 1, 1,
1.018068, 0.2684492, 1.164495, 1, 1, 1, 1, 1,
1.021003, -0.3525043, 2.25282, 1, 1, 1, 1, 1,
1.023281, 0.1667943, -0.1117768, 1, 1, 1, 1, 1,
1.026493, -2.023925, 3.285152, 1, 1, 1, 1, 1,
1.029433, 0.428416, 2.072207, 1, 1, 1, 1, 1,
1.031356, 0.3767886, 0.9687675, 1, 1, 1, 1, 1,
1.043956, 0.771827, 1.767214, 1, 1, 1, 1, 1,
1.046996, -0.8722835, 2.972556, 1, 1, 1, 1, 1,
1.053102, 0.2644548, 3.57989, 1, 1, 1, 1, 1,
1.063548, 0.4921576, -0.5349519, 1, 1, 1, 1, 1,
1.067242, -0.3838084, 1.619391, 1, 1, 1, 1, 1,
1.069301, -0.4435699, 2.809854, 1, 1, 1, 1, 1,
1.071004, -0.5358037, 2.253519, 1, 1, 1, 1, 1,
1.072756, -0.528765, 1.303146, 1, 1, 1, 1, 1,
1.076992, -1.791875, 2.320546, 1, 1, 1, 1, 1,
1.086134, 1.105339, -0.3117109, 0, 0, 1, 1, 1,
1.087118, 1.112712, 0.5259321, 1, 0, 0, 1, 1,
1.093487, 1.255082, 0.2064324, 1, 0, 0, 1, 1,
1.096946, 0.5847892, 0.994447, 1, 0, 0, 1, 1,
1.098235, -0.7605246, 3.59677, 1, 0, 0, 1, 1,
1.099826, 0.0004761945, 2.269675, 1, 0, 0, 1, 1,
1.101818, -0.2521431, 2.535067, 0, 0, 0, 1, 1,
1.115219, -1.374755, 3.136588, 0, 0, 0, 1, 1,
1.124042, 1.577689, 0.144593, 0, 0, 0, 1, 1,
1.125072, 0.1071959, 1.606168, 0, 0, 0, 1, 1,
1.126294, 1.298986, 2.004478, 0, 0, 0, 1, 1,
1.126572, 1.621803, -0.5406821, 0, 0, 0, 1, 1,
1.133194, -1.126902, 1.071751, 0, 0, 0, 1, 1,
1.139355, 0.08719688, 1.993432, 1, 1, 1, 1, 1,
1.140588, 0.2786396, -0.7820301, 1, 1, 1, 1, 1,
1.150272, 0.9653583, -0.06059872, 1, 1, 1, 1, 1,
1.158869, 0.4814411, 0.1426692, 1, 1, 1, 1, 1,
1.161634, 1.064282, 0.2306803, 1, 1, 1, 1, 1,
1.167032, -0.1706677, 1.339841, 1, 1, 1, 1, 1,
1.170401, -0.5223483, 3.502047, 1, 1, 1, 1, 1,
1.172301, -0.2274687, 1.799882, 1, 1, 1, 1, 1,
1.175428, -0.5685035, -0.2812447, 1, 1, 1, 1, 1,
1.181536, -2.915436, 4.088414, 1, 1, 1, 1, 1,
1.187247, 0.1201776, -0.08838125, 1, 1, 1, 1, 1,
1.199867, -1.071247, 1.968326, 1, 1, 1, 1, 1,
1.200565, -0.8938194, 2.699516, 1, 1, 1, 1, 1,
1.207368, 0.664722, 1.739137, 1, 1, 1, 1, 1,
1.20911, 1.761019, 0.5003358, 1, 1, 1, 1, 1,
1.209439, 2.282967, -0.9624166, 0, 0, 1, 1, 1,
1.212878, 0.6503616, 0.6693484, 1, 0, 0, 1, 1,
1.223776, 0.839772, 1.191891, 1, 0, 0, 1, 1,
1.224414, 0.6331283, 1.837688, 1, 0, 0, 1, 1,
1.233075, 0.4654754, 1.127075, 1, 0, 0, 1, 1,
1.266589, -0.4610365, 1.260119, 1, 0, 0, 1, 1,
1.285467, 1.240738, 0.3918633, 0, 0, 0, 1, 1,
1.300424, 0.3263591, 0.5287368, 0, 0, 0, 1, 1,
1.303319, -0.9559355, 1.662048, 0, 0, 0, 1, 1,
1.304765, -1.531503, 2.521003, 0, 0, 0, 1, 1,
1.307877, 2.399294, -0.6328312, 0, 0, 0, 1, 1,
1.314512, 1.586604, 1.857779, 0, 0, 0, 1, 1,
1.317729, -1.568352, 1.691995, 0, 0, 0, 1, 1,
1.319682, -0.5334072, 2.571766, 1, 1, 1, 1, 1,
1.321, -1.48027, 1.455052, 1, 1, 1, 1, 1,
1.32147, -0.03161067, 0.8692206, 1, 1, 1, 1, 1,
1.325874, 0.244518, 1.165147, 1, 1, 1, 1, 1,
1.330867, 0.1209628, 2.687778, 1, 1, 1, 1, 1,
1.348483, -0.04009545, 1.080552, 1, 1, 1, 1, 1,
1.361241, -0.1899219, 1.57768, 1, 1, 1, 1, 1,
1.36231, 0.2862763, 2.773247, 1, 1, 1, 1, 1,
1.376195, -1.272613, 1.929018, 1, 1, 1, 1, 1,
1.376614, 1.474875, 0.1874077, 1, 1, 1, 1, 1,
1.379226, 0.2060686, 4.142613, 1, 1, 1, 1, 1,
1.388861, -0.5613698, 1.255813, 1, 1, 1, 1, 1,
1.393592, 1.450584, 2.414585, 1, 1, 1, 1, 1,
1.394804, -2.011396, 1.863562, 1, 1, 1, 1, 1,
1.397328, -0.3833414, 1.422183, 1, 1, 1, 1, 1,
1.407225, 2.077631, 1.358843, 0, 0, 1, 1, 1,
1.408732, 1.063543, -0.5466456, 1, 0, 0, 1, 1,
1.413202, -0.1719538, 1.662626, 1, 0, 0, 1, 1,
1.414632, 0.4476795, 0.9400118, 1, 0, 0, 1, 1,
1.415164, 1.050338, 0.8144508, 1, 0, 0, 1, 1,
1.417205, -1.407157, 3.343049, 1, 0, 0, 1, 1,
1.421596, 0.9774278, 1.43263, 0, 0, 0, 1, 1,
1.423245, -0.2941303, 1.877057, 0, 0, 0, 1, 1,
1.432642, 0.3539554, 3.212936, 0, 0, 0, 1, 1,
1.434931, -0.8169371, 2.115032, 0, 0, 0, 1, 1,
1.434989, 1.342625, 0.6085185, 0, 0, 0, 1, 1,
1.435463, 0.09274655, -0.2142489, 0, 0, 0, 1, 1,
1.481952, 0.6843774, -0.4481445, 0, 0, 0, 1, 1,
1.483318, 1.071946, 1.575579, 1, 1, 1, 1, 1,
1.528447, 0.6651914, 0.7908216, 1, 1, 1, 1, 1,
1.534795, 0.4798074, 1.818955, 1, 1, 1, 1, 1,
1.552939, 1.074671, -0.1389591, 1, 1, 1, 1, 1,
1.580217, -0.7392653, 0.8199223, 1, 1, 1, 1, 1,
1.580715, -1.065528, 0.8089487, 1, 1, 1, 1, 1,
1.582268, -1.404188, 3.245011, 1, 1, 1, 1, 1,
1.598727, -0.56973, 2.085102, 1, 1, 1, 1, 1,
1.617516, -0.7188453, 1.199159, 1, 1, 1, 1, 1,
1.646899, -1.091449, 3.180991, 1, 1, 1, 1, 1,
1.651119, -1.191082, 1.933817, 1, 1, 1, 1, 1,
1.663202, 1.032765, 2.273454, 1, 1, 1, 1, 1,
1.665954, 0.06669287, 1.173375, 1, 1, 1, 1, 1,
1.67645, 0.05158004, 2.664192, 1, 1, 1, 1, 1,
1.684439, -1.252469, 2.025416, 1, 1, 1, 1, 1,
1.688447, -0.588115, 1.662783, 0, 0, 1, 1, 1,
1.70736, 1.057811, 1.193006, 1, 0, 0, 1, 1,
1.707745, 1.101026, 1.739448, 1, 0, 0, 1, 1,
1.709487, 0.7946651, 1.490488, 1, 0, 0, 1, 1,
1.727291, 0.6951462, 0.1086537, 1, 0, 0, 1, 1,
1.76054, 0.3221451, 2.891269, 1, 0, 0, 1, 1,
1.761955, -1.135832, 3.493858, 0, 0, 0, 1, 1,
1.776847, 2.075399, 1.631084, 0, 0, 0, 1, 1,
1.797481, -0.5049951, 2.576552, 0, 0, 0, 1, 1,
1.80492, -0.4255762, 1.563887, 0, 0, 0, 1, 1,
1.808664, 0.3692312, 2.948551, 0, 0, 0, 1, 1,
1.821088, 0.08196429, 2.069011, 0, 0, 0, 1, 1,
1.824993, -1.286157, 2.364843, 0, 0, 0, 1, 1,
1.833649, 0.7838461, 1.293107, 1, 1, 1, 1, 1,
1.848437, 0.4804951, 2.126383, 1, 1, 1, 1, 1,
1.85806, -0.5829284, 0.4885818, 1, 1, 1, 1, 1,
1.860767, -0.4514694, -0.3369932, 1, 1, 1, 1, 1,
1.881362, -1.190208, 2.935262, 1, 1, 1, 1, 1,
1.884673, -0.833443, 3.306971, 1, 1, 1, 1, 1,
1.903474, -1.078262, 3.603099, 1, 1, 1, 1, 1,
1.917063, -0.6255926, 1.750383, 1, 1, 1, 1, 1,
1.949068, 0.1414215, 0.007441979, 1, 1, 1, 1, 1,
2.00353, 1.120758, 0.1070474, 1, 1, 1, 1, 1,
2.015131, -0.8924286, 1.172774, 1, 1, 1, 1, 1,
2.043132, 0.2336587, 0.002177866, 1, 1, 1, 1, 1,
2.077585, -1.882196, 2.833569, 1, 1, 1, 1, 1,
2.090675, 1.607544, 1.393351, 1, 1, 1, 1, 1,
2.099024, -0.2157088, 1.178877, 1, 1, 1, 1, 1,
2.11525, 3.253981, -0.4189134, 0, 0, 1, 1, 1,
2.134336, 0.3382148, 0.8362327, 1, 0, 0, 1, 1,
2.232584, -2.246257, 4.020382, 1, 0, 0, 1, 1,
2.251303, 1.41219, -0.2870207, 1, 0, 0, 1, 1,
2.351193, 0.3889672, 0.614914, 1, 0, 0, 1, 1,
2.378776, 0.7256876, 2.643614, 1, 0, 0, 1, 1,
2.388343, 0.7111694, 0.07581893, 0, 0, 0, 1, 1,
2.517123, 0.4033338, 0.07022595, 0, 0, 0, 1, 1,
2.599511, -0.7043663, 0.0171309, 0, 0, 0, 1, 1,
2.601334, 0.0815162, 0.01611072, 0, 0, 0, 1, 1,
2.653803, -1.568599, 3.357048, 0, 0, 0, 1, 1,
2.660753, -0.1316915, -0.1175204, 0, 0, 0, 1, 1,
2.680883, -1.020439, 2.579449, 0, 0, 0, 1, 1,
2.703367, 0.9070003, 1.419377, 1, 1, 1, 1, 1,
2.769985, -0.3490622, 0.956933, 1, 1, 1, 1, 1,
2.808008, -0.4208323, 3.228167, 1, 1, 1, 1, 1,
3.013346, 1.381451, 1.53403, 1, 1, 1, 1, 1,
3.16109, 0.1116149, 2.027705, 1, 1, 1, 1, 1,
3.263761, 0.2149815, 0.1808245, 1, 1, 1, 1, 1,
3.687696, 1.935566, -0.2931238, 1, 1, 1, 1, 1
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
var radius = 9.870163;
var distance = 34.66853;
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
mvMatrix.translate( -0.2400665, 0.08956337, -0.1085749 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.66853);
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
