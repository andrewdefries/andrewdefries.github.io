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
-3.241903, 1.331875, -0.95562, 1, 0, 0, 1,
-3.025175, 1.172327, -0.3598344, 1, 0.007843138, 0, 1,
-2.999955, 0.2077601, -3.536907, 1, 0.01176471, 0, 1,
-2.826811, 2.470919, -1.008677, 1, 0.01960784, 0, 1,
-2.777129, -0.2031808, -1.158322, 1, 0.02352941, 0, 1,
-2.64061, 0.292416, 0.2145412, 1, 0.03137255, 0, 1,
-2.557657, 0.03341277, -2.922847, 1, 0.03529412, 0, 1,
-2.513955, 0.3137105, -3.53914, 1, 0.04313726, 0, 1,
-2.449191, -2.308026, -1.642209, 1, 0.04705882, 0, 1,
-2.354537, -1.060335, -2.308892, 1, 0.05490196, 0, 1,
-2.345556, -0.2419755, -1.296268, 1, 0.05882353, 0, 1,
-2.334494, 0.7720205, -1.020735, 1, 0.06666667, 0, 1,
-2.31529, 0.8141961, -2.141972, 1, 0.07058824, 0, 1,
-2.296692, -1.951002, -1.186869, 1, 0.07843138, 0, 1,
-2.232675, -0.3491455, -0.6646729, 1, 0.08235294, 0, 1,
-2.194313, -0.3881287, -2.841976, 1, 0.09019608, 0, 1,
-2.177675, 0.7231246, -1.557588, 1, 0.09411765, 0, 1,
-2.172122, 0.04029442, -1.398388, 1, 0.1019608, 0, 1,
-2.158983, -1.876804, -2.047716, 1, 0.1098039, 0, 1,
-2.154737, 0.5930488, -0.1947127, 1, 0.1137255, 0, 1,
-2.145584, 0.5791201, -1.077641, 1, 0.1215686, 0, 1,
-2.144928, 1.502798, -0.1362056, 1, 0.1254902, 0, 1,
-2.137848, -0.7488561, -2.278749, 1, 0.1333333, 0, 1,
-2.128902, -1.434605, -1.056427, 1, 0.1372549, 0, 1,
-2.102388, -0.6293655, -3.964952, 1, 0.145098, 0, 1,
-2.095192, -0.7360997, -0.7201758, 1, 0.1490196, 0, 1,
-2.089813, 1.673862, -0.7409183, 1, 0.1568628, 0, 1,
-2.014532, 0.8906569, -1.986903, 1, 0.1607843, 0, 1,
-1.959559, 1.438754, 0.685131, 1, 0.1686275, 0, 1,
-1.958943, 1.20027, -0.8822566, 1, 0.172549, 0, 1,
-1.949669, 0.5954414, -1.366159, 1, 0.1803922, 0, 1,
-1.937524, 0.5967761, -2.309166, 1, 0.1843137, 0, 1,
-1.906778, 0.2947873, -2.334006, 1, 0.1921569, 0, 1,
-1.866994, 1.742657, -0.397409, 1, 0.1960784, 0, 1,
-1.840625, 1.877063, 0.6095353, 1, 0.2039216, 0, 1,
-1.828725, -0.6424966, -0.3887111, 1, 0.2117647, 0, 1,
-1.822711, 0.6931394, -0.6491343, 1, 0.2156863, 0, 1,
-1.816871, -0.02167946, -0.9065905, 1, 0.2235294, 0, 1,
-1.816217, 0.2503512, -0.4561525, 1, 0.227451, 0, 1,
-1.808043, -0.01740759, -3.040272, 1, 0.2352941, 0, 1,
-1.790041, 0.8333663, -1.302139, 1, 0.2392157, 0, 1,
-1.788668, 1.253332, 0.1167583, 1, 0.2470588, 0, 1,
-1.787825, 0.8571287, 0.03622642, 1, 0.2509804, 0, 1,
-1.784089, 0.377712, -1.775344, 1, 0.2588235, 0, 1,
-1.776464, -1.163581, -1.396945, 1, 0.2627451, 0, 1,
-1.771074, 1.158443, -0.6797878, 1, 0.2705882, 0, 1,
-1.767677, -0.3229516, -2.161675, 1, 0.2745098, 0, 1,
-1.757747, -0.02347368, -1.058085, 1, 0.282353, 0, 1,
-1.740537, 0.8774375, -2.220362, 1, 0.2862745, 0, 1,
-1.737248, 0.4644957, -1.498268, 1, 0.2941177, 0, 1,
-1.730803, 1.459463, -0.404899, 1, 0.3019608, 0, 1,
-1.716257, -1.498004, -2.787433, 1, 0.3058824, 0, 1,
-1.715307, -0.8963244, -2.561397, 1, 0.3137255, 0, 1,
-1.712182, -0.4910502, -2.290001, 1, 0.3176471, 0, 1,
-1.676067, 0.2101976, -0.1118856, 1, 0.3254902, 0, 1,
-1.672749, -1.383257, -3.267154, 1, 0.3294118, 0, 1,
-1.671433, 0.4203816, -0.2419982, 1, 0.3372549, 0, 1,
-1.669012, 0.02012927, -1.979395, 1, 0.3411765, 0, 1,
-1.652719, -0.8257306, -1.105243, 1, 0.3490196, 0, 1,
-1.637375, -1.108315, -1.806993, 1, 0.3529412, 0, 1,
-1.593076, 0.7317904, -1.380969, 1, 0.3607843, 0, 1,
-1.591151, -0.9625424, -2.429608, 1, 0.3647059, 0, 1,
-1.580316, 0.1418656, -1.033777, 1, 0.372549, 0, 1,
-1.551727, -0.8708742, -3.276472, 1, 0.3764706, 0, 1,
-1.550168, 1.909372, -1.400818, 1, 0.3843137, 0, 1,
-1.546681, -1.591728, -3.475074, 1, 0.3882353, 0, 1,
-1.540201, 0.9503546, -1.061557, 1, 0.3960784, 0, 1,
-1.532836, 1.590742, -1.344831, 1, 0.4039216, 0, 1,
-1.52809, -0.006497082, -1.285764, 1, 0.4078431, 0, 1,
-1.522426, -0.5761096, -0.2808581, 1, 0.4156863, 0, 1,
-1.511223, 0.3246257, -0.6425495, 1, 0.4196078, 0, 1,
-1.499848, -0.8692284, -1.977975, 1, 0.427451, 0, 1,
-1.482045, 1.884293, -2.215172, 1, 0.4313726, 0, 1,
-1.480036, 1.05393, -1.309749, 1, 0.4392157, 0, 1,
-1.470689, 0.3770548, -1.435954, 1, 0.4431373, 0, 1,
-1.462202, 0.5828171, -1.218476, 1, 0.4509804, 0, 1,
-1.44996, 1.21997, -0.2971377, 1, 0.454902, 0, 1,
-1.443915, 0.4308915, -1.889313, 1, 0.4627451, 0, 1,
-1.439189, 0.5062429, -3.080552, 1, 0.4666667, 0, 1,
-1.434097, -0.7445233, -2.883113, 1, 0.4745098, 0, 1,
-1.434092, 0.7783781, -1.18845, 1, 0.4784314, 0, 1,
-1.432986, -0.62397, -3.160141, 1, 0.4862745, 0, 1,
-1.413637, -0.1328036, -2.472608, 1, 0.4901961, 0, 1,
-1.412289, 0.09267271, -1.421829, 1, 0.4980392, 0, 1,
-1.408253, -0.4746457, -0.1227169, 1, 0.5058824, 0, 1,
-1.405623, 0.7765861, -1.890132, 1, 0.509804, 0, 1,
-1.394255, 1.096669, 0.04838639, 1, 0.5176471, 0, 1,
-1.38977, -1.342607, -2.99688, 1, 0.5215687, 0, 1,
-1.386698, -0.1700479, -1.126464, 1, 0.5294118, 0, 1,
-1.386322, 0.4834597, -1.528564, 1, 0.5333334, 0, 1,
-1.369829, -1.231483, -1.6017, 1, 0.5411765, 0, 1,
-1.360787, -0.05681845, -4.218602, 1, 0.5450981, 0, 1,
-1.353078, -0.25104, -3.565916, 1, 0.5529412, 0, 1,
-1.337195, 1.25611, 0.3069142, 1, 0.5568628, 0, 1,
-1.331436, -1.077172, -3.727525, 1, 0.5647059, 0, 1,
-1.326472, 0.7698435, -0.6077046, 1, 0.5686275, 0, 1,
-1.321873, -1.025643, -1.100752, 1, 0.5764706, 0, 1,
-1.320505, 1.834893, -2.736166, 1, 0.5803922, 0, 1,
-1.320276, -0.516437, -1.759178, 1, 0.5882353, 0, 1,
-1.315117, 0.8231356, -1.544802, 1, 0.5921569, 0, 1,
-1.313185, -0.08725531, -2.446398, 1, 0.6, 0, 1,
-1.311053, 0.5343435, -1.908726, 1, 0.6078432, 0, 1,
-1.30723, 0.796456, -0.6153854, 1, 0.6117647, 0, 1,
-1.303616, 0.5719714, -1.22061, 1, 0.6196079, 0, 1,
-1.302787, -0.1564502, 0.01166278, 1, 0.6235294, 0, 1,
-1.29329, -1.595512, -3.121796, 1, 0.6313726, 0, 1,
-1.290046, 0.9827137, -0.4238875, 1, 0.6352941, 0, 1,
-1.276487, 0.3100148, -3.672726, 1, 0.6431373, 0, 1,
-1.267922, -1.935669, -2.990205, 1, 0.6470588, 0, 1,
-1.265395, -0.9733344, -2.706801, 1, 0.654902, 0, 1,
-1.263211, -1.079222, -2.162033, 1, 0.6588235, 0, 1,
-1.260995, -1.423156, -2.416881, 1, 0.6666667, 0, 1,
-1.25515, 0.1582642, -1.018478, 1, 0.6705883, 0, 1,
-1.255065, 0.6163177, -0.7267547, 1, 0.6784314, 0, 1,
-1.248386, 2.095674, -1.449155, 1, 0.682353, 0, 1,
-1.238382, 0.8165653, -2.262787, 1, 0.6901961, 0, 1,
-1.236075, 1.13442, -2.531497, 1, 0.6941177, 0, 1,
-1.230169, -0.9652821, -2.149909, 1, 0.7019608, 0, 1,
-1.227963, -1.15374, -1.481911, 1, 0.7098039, 0, 1,
-1.227075, -0.5463114, -1.876361, 1, 0.7137255, 0, 1,
-1.222746, 0.7810894, -0.2216131, 1, 0.7215686, 0, 1,
-1.222268, 1.214889, -0.9566026, 1, 0.7254902, 0, 1,
-1.212617, -1.306263, 0.3178611, 1, 0.7333333, 0, 1,
-1.210085, 0.5797687, -0.2932813, 1, 0.7372549, 0, 1,
-1.209822, -0.1006362, -1.961522, 1, 0.7450981, 0, 1,
-1.2082, 1.33713, -0.7645182, 1, 0.7490196, 0, 1,
-1.203056, 0.2996286, 0.3446325, 1, 0.7568628, 0, 1,
-1.202745, -0.4181399, -1.872232, 1, 0.7607843, 0, 1,
-1.20216, 0.9121771, -0.9897928, 1, 0.7686275, 0, 1,
-1.194475, -0.01875748, -1.564824, 1, 0.772549, 0, 1,
-1.192929, -0.3485738, -2.633172, 1, 0.7803922, 0, 1,
-1.184892, 0.04906007, -1.024541, 1, 0.7843137, 0, 1,
-1.183559, -2.033043, -1.678721, 1, 0.7921569, 0, 1,
-1.181936, 0.5102049, -0.1934199, 1, 0.7960784, 0, 1,
-1.181419, 0.7192754, -1.42355, 1, 0.8039216, 0, 1,
-1.178294, 0.6736078, -1.888771, 1, 0.8117647, 0, 1,
-1.171366, -0.5006818, -3.517211, 1, 0.8156863, 0, 1,
-1.157789, -2.431471, -1.236617, 1, 0.8235294, 0, 1,
-1.155929, 0.6027814, -0.8627093, 1, 0.827451, 0, 1,
-1.150886, -1.054453, -0.4917994, 1, 0.8352941, 0, 1,
-1.141346, 0.9522422, -0.6645312, 1, 0.8392157, 0, 1,
-1.135936, 0.6272432, -1.914263, 1, 0.8470588, 0, 1,
-1.128279, -0.4855438, -3.734387, 1, 0.8509804, 0, 1,
-1.126192, -1.389342, -2.406255, 1, 0.8588235, 0, 1,
-1.120169, 1.688579, -0.2965946, 1, 0.8627451, 0, 1,
-1.113577, 0.00160753, -2.360933, 1, 0.8705882, 0, 1,
-1.110851, 0.4846993, -1.790544, 1, 0.8745098, 0, 1,
-1.110484, -1.039837, -2.258348, 1, 0.8823529, 0, 1,
-1.078568, 0.3764736, -1.791607, 1, 0.8862745, 0, 1,
-1.075776, 0.1265824, -1.837001, 1, 0.8941177, 0, 1,
-1.071213, 0.3532771, -0.8997151, 1, 0.8980392, 0, 1,
-1.069876, -1.176603, -0.5079742, 1, 0.9058824, 0, 1,
-1.063236, -1.760138, -1.487319, 1, 0.9137255, 0, 1,
-1.058832, 1.407261, -0.1053662, 1, 0.9176471, 0, 1,
-1.053516, -0.3924548, -2.118581, 1, 0.9254902, 0, 1,
-1.048789, -0.420229, -2.263127, 1, 0.9294118, 0, 1,
-1.048574, -1.084044, -2.541072, 1, 0.9372549, 0, 1,
-1.044597, 0.429888, -3.059209, 1, 0.9411765, 0, 1,
-1.043635, 0.8943115, -0.07832818, 1, 0.9490196, 0, 1,
-1.039017, 0.7304804, -0.7804599, 1, 0.9529412, 0, 1,
-1.037936, -1.135607, -0.2770403, 1, 0.9607843, 0, 1,
-1.037424, -1.295633, -3.94119, 1, 0.9647059, 0, 1,
-1.028888, 2.127081, 0.4545613, 1, 0.972549, 0, 1,
-1.02756, 0.05894919, -2.464677, 1, 0.9764706, 0, 1,
-1.025883, -1.242196, -4.128583, 1, 0.9843137, 0, 1,
-1.023545, 0.129274, -2.294705, 1, 0.9882353, 0, 1,
-1.018349, -1.776417, -3.501534, 1, 0.9960784, 0, 1,
-1.017372, -0.4666597, -0.4619687, 0.9960784, 1, 0, 1,
-1.010325, -1.189427, -2.173458, 0.9921569, 1, 0, 1,
-1.009031, 0.7213531, -1.142338, 0.9843137, 1, 0, 1,
-1.0038, 0.2428308, 0.125116, 0.9803922, 1, 0, 1,
-1.000059, 0.01446912, -0.5920104, 0.972549, 1, 0, 1,
-0.9980263, -0.630899, -1.765785, 0.9686275, 1, 0, 1,
-0.9971858, 2.586207, -0.6704333, 0.9607843, 1, 0, 1,
-0.9939058, 0.8388527, -0.2959757, 0.9568627, 1, 0, 1,
-0.9863245, -0.3938347, -0.9011121, 0.9490196, 1, 0, 1,
-0.9829808, 0.4205145, 1.465973, 0.945098, 1, 0, 1,
-0.9827835, 1.175834, 0.8982057, 0.9372549, 1, 0, 1,
-0.9796291, 0.5181279, -1.353245, 0.9333333, 1, 0, 1,
-0.977102, -0.3681431, -1.839932, 0.9254902, 1, 0, 1,
-0.9767329, 0.6492484, -0.3352282, 0.9215686, 1, 0, 1,
-0.9675548, 0.03842895, 0.5776557, 0.9137255, 1, 0, 1,
-0.9605801, 0.3903463, -2.402109, 0.9098039, 1, 0, 1,
-0.9566404, -0.4454136, -0.7650211, 0.9019608, 1, 0, 1,
-0.9554972, 0.6250967, -2.211208, 0.8941177, 1, 0, 1,
-0.9538265, -0.951277, -2.056444, 0.8901961, 1, 0, 1,
-0.9526524, -1.17257, -3.546484, 0.8823529, 1, 0, 1,
-0.9474263, -0.5251527, -2.304614, 0.8784314, 1, 0, 1,
-0.9464332, 0.5755693, -1.528847, 0.8705882, 1, 0, 1,
-0.9416922, -2.399221, -1.393455, 0.8666667, 1, 0, 1,
-0.9416257, -1.894298, -4.85693, 0.8588235, 1, 0, 1,
-0.9408642, 0.9359567, -1.619293, 0.854902, 1, 0, 1,
-0.9390609, -0.3659865, -0.8918389, 0.8470588, 1, 0, 1,
-0.9378463, 0.9254244, -0.2062812, 0.8431373, 1, 0, 1,
-0.9352714, -0.4241667, -2.219287, 0.8352941, 1, 0, 1,
-0.9251393, -0.05937451, -1.048607, 0.8313726, 1, 0, 1,
-0.9243692, 1.017036, -0.9285553, 0.8235294, 1, 0, 1,
-0.9239954, -1.379737, -4.720204, 0.8196079, 1, 0, 1,
-0.9219494, -1.729057, -2.719659, 0.8117647, 1, 0, 1,
-0.9206063, 0.4408769, -0.1779793, 0.8078431, 1, 0, 1,
-0.9168898, 1.24014, 0.6367019, 0.8, 1, 0, 1,
-0.9158323, 1.968826, -0.661815, 0.7921569, 1, 0, 1,
-0.9116262, 1.719839, -0.3188318, 0.7882353, 1, 0, 1,
-0.9085343, -0.1389068, -2.498793, 0.7803922, 1, 0, 1,
-0.8993409, -0.6460323, -1.818303, 0.7764706, 1, 0, 1,
-0.8968098, -0.6433163, -5.25258, 0.7686275, 1, 0, 1,
-0.8961451, 1.559236, -1.820879, 0.7647059, 1, 0, 1,
-0.8954738, -1.448512, -3.045755, 0.7568628, 1, 0, 1,
-0.8948164, -1.600394, -4.622623, 0.7529412, 1, 0, 1,
-0.8773558, 1.153849, 1.469414, 0.7450981, 1, 0, 1,
-0.8702715, 0.9794894, 0.6349499, 0.7411765, 1, 0, 1,
-0.8615876, 1.005454, -0.5687954, 0.7333333, 1, 0, 1,
-0.8598735, 0.7757503, 0.03538086, 0.7294118, 1, 0, 1,
-0.8590561, -0.5590146, -3.32866, 0.7215686, 1, 0, 1,
-0.8569427, 1.287828, -1.325133, 0.7176471, 1, 0, 1,
-0.8564959, 0.4566559, -2.717026, 0.7098039, 1, 0, 1,
-0.8509829, -0.695679, -4.093745, 0.7058824, 1, 0, 1,
-0.8423259, 1.697142, -0.3434023, 0.6980392, 1, 0, 1,
-0.8371246, -0.9568285, -1.499319, 0.6901961, 1, 0, 1,
-0.8343053, 0.4343488, -0.03659768, 0.6862745, 1, 0, 1,
-0.8306408, -0.09219266, -1.04029, 0.6784314, 1, 0, 1,
-0.8273851, 0.0008714902, -0.4230843, 0.6745098, 1, 0, 1,
-0.8208981, 0.8639457, -0.5395746, 0.6666667, 1, 0, 1,
-0.8163345, 1.291315, -0.6563047, 0.6627451, 1, 0, 1,
-0.8132026, 0.004887607, -1.62861, 0.654902, 1, 0, 1,
-0.8067166, 0.4835241, -0.4315062, 0.6509804, 1, 0, 1,
-0.8047955, -0.5870718, -1.409274, 0.6431373, 1, 0, 1,
-0.8016539, 0.2988072, -2.444286, 0.6392157, 1, 0, 1,
-0.7970561, 0.1383878, -0.08811352, 0.6313726, 1, 0, 1,
-0.7923543, 0.1535615, -0.8800576, 0.627451, 1, 0, 1,
-0.7919311, 0.2323438, -1.350117, 0.6196079, 1, 0, 1,
-0.7917185, 0.7549478, -1.152955, 0.6156863, 1, 0, 1,
-0.785469, 1.796533, 0.3869083, 0.6078432, 1, 0, 1,
-0.7835804, 1.059141, -0.3007041, 0.6039216, 1, 0, 1,
-0.7802618, 0.521427, 0.02976634, 0.5960785, 1, 0, 1,
-0.7640743, -0.008708534, -2.451964, 0.5882353, 1, 0, 1,
-0.7573659, 0.8556498, 0.2287252, 0.5843138, 1, 0, 1,
-0.7568549, 1.034584, -0.743821, 0.5764706, 1, 0, 1,
-0.7493969, 1.250598, -0.844585, 0.572549, 1, 0, 1,
-0.7484841, 0.5641678, -1.697446, 0.5647059, 1, 0, 1,
-0.7407122, -0.7626095, -3.252809, 0.5607843, 1, 0, 1,
-0.7385995, 0.5223513, -1.169509, 0.5529412, 1, 0, 1,
-0.7359959, -0.3179241, -1.687439, 0.5490196, 1, 0, 1,
-0.7347599, 0.2678435, -1.219291, 0.5411765, 1, 0, 1,
-0.7330603, -1.191652, -1.731292, 0.5372549, 1, 0, 1,
-0.7304529, -0.7984754, -2.887787, 0.5294118, 1, 0, 1,
-0.7153065, -0.1135916, -2.0032, 0.5254902, 1, 0, 1,
-0.7151689, -1.424997, -3.891942, 0.5176471, 1, 0, 1,
-0.7128576, 0.03509607, -2.114796, 0.5137255, 1, 0, 1,
-0.7118453, 0.3241875, -1.811665, 0.5058824, 1, 0, 1,
-0.706776, 0.7535498, -1.575861, 0.5019608, 1, 0, 1,
-0.7039817, -0.6445016, -1.582857, 0.4941176, 1, 0, 1,
-0.7004049, -0.05191219, -1.302594, 0.4862745, 1, 0, 1,
-0.7000144, -0.5761676, -3.137774, 0.4823529, 1, 0, 1,
-0.688795, 1.198863, 0.5669426, 0.4745098, 1, 0, 1,
-0.6860179, 0.08300615, -1.625549, 0.4705882, 1, 0, 1,
-0.6859233, 0.2615381, -0.9487376, 0.4627451, 1, 0, 1,
-0.684184, -0.878887, -3.1674, 0.4588235, 1, 0, 1,
-0.682151, -0.6254871, -1.245455, 0.4509804, 1, 0, 1,
-0.6813598, 2.056244, -1.262605, 0.4470588, 1, 0, 1,
-0.6787428, -0.8364466, -0.9633643, 0.4392157, 1, 0, 1,
-0.6778135, -0.2038315, -2.522623, 0.4352941, 1, 0, 1,
-0.6772991, 0.4210069, 0.1741776, 0.427451, 1, 0, 1,
-0.6664181, -1.009082, -2.870581, 0.4235294, 1, 0, 1,
-0.6654154, -0.3924527, -1.425601, 0.4156863, 1, 0, 1,
-0.665346, 0.5509002, -0.9266313, 0.4117647, 1, 0, 1,
-0.6651552, -0.6758319, -2.70025, 0.4039216, 1, 0, 1,
-0.6636794, -1.545637, -3.048959, 0.3960784, 1, 0, 1,
-0.6626922, 1.036054, 1.805392, 0.3921569, 1, 0, 1,
-0.6579046, 1.036272, -1.429629, 0.3843137, 1, 0, 1,
-0.6576629, 0.7649745, -0.6694511, 0.3803922, 1, 0, 1,
-0.6569024, -0.2969956, -2.75677, 0.372549, 1, 0, 1,
-0.6370113, -0.02088702, -2.030826, 0.3686275, 1, 0, 1,
-0.6368588, -0.3001159, -1.626463, 0.3607843, 1, 0, 1,
-0.6347749, 0.1060409, -2.91976, 0.3568628, 1, 0, 1,
-0.6332092, 0.02258136, -1.575764, 0.3490196, 1, 0, 1,
-0.6211338, -0.5272397, -2.76769, 0.345098, 1, 0, 1,
-0.6129295, 1.795013, -0.1652901, 0.3372549, 1, 0, 1,
-0.6125571, 1.465696, -0.8221308, 0.3333333, 1, 0, 1,
-0.611159, 0.3466783, -0.6375315, 0.3254902, 1, 0, 1,
-0.6085483, 0.1333585, -1.802358, 0.3215686, 1, 0, 1,
-0.602954, 0.351129, -2.472142, 0.3137255, 1, 0, 1,
-0.6025243, 0.4386846, 1.408832, 0.3098039, 1, 0, 1,
-0.6013166, -1.198827, -3.400586, 0.3019608, 1, 0, 1,
-0.600963, 2.442206, 2.147995, 0.2941177, 1, 0, 1,
-0.5993058, 0.5588537, 0.09017311, 0.2901961, 1, 0, 1,
-0.5954918, -0.3145807, -2.849191, 0.282353, 1, 0, 1,
-0.5904414, -0.5704414, -3.624413, 0.2784314, 1, 0, 1,
-0.5875852, -1.054156, -1.064852, 0.2705882, 1, 0, 1,
-0.5860363, 0.9491056, -0.872898, 0.2666667, 1, 0, 1,
-0.585507, 2.394089, 0.168132, 0.2588235, 1, 0, 1,
-0.5807261, 1.480328, -1.549899, 0.254902, 1, 0, 1,
-0.5773104, 0.5340093, 0.7282029, 0.2470588, 1, 0, 1,
-0.5768878, -1.817691, -3.083476, 0.2431373, 1, 0, 1,
-0.5713346, 0.909013, -0.05645336, 0.2352941, 1, 0, 1,
-0.5702504, 0.2281893, -1.887663, 0.2313726, 1, 0, 1,
-0.5666245, 0.4619374, -0.9447497, 0.2235294, 1, 0, 1,
-0.5665668, -1.574956, -3.875635, 0.2196078, 1, 0, 1,
-0.5607984, -0.7405363, -2.51107, 0.2117647, 1, 0, 1,
-0.5569794, 0.2659953, -0.6861056, 0.2078431, 1, 0, 1,
-0.5566782, -0.1840626, -2.110025, 0.2, 1, 0, 1,
-0.5508736, -0.1398386, -3.39208, 0.1921569, 1, 0, 1,
-0.5440266, 0.9687801, -0.6999879, 0.1882353, 1, 0, 1,
-0.5428371, 0.7115213, 0.2137109, 0.1803922, 1, 0, 1,
-0.5383675, 1.567439, 0.8362613, 0.1764706, 1, 0, 1,
-0.5375728, -0.636102, -4.521404, 0.1686275, 1, 0, 1,
-0.5329332, -0.04231022, -0.4878597, 0.1647059, 1, 0, 1,
-0.5327556, 0.8152883, -0.1220247, 0.1568628, 1, 0, 1,
-0.5286368, 1.722214, 1.6723, 0.1529412, 1, 0, 1,
-0.5282343, 0.7883074, 0.7921879, 0.145098, 1, 0, 1,
-0.5256251, -0.1297042, -3.234327, 0.1411765, 1, 0, 1,
-0.5253703, -1.995973, -2.376983, 0.1333333, 1, 0, 1,
-0.5188326, -0.8607383, -0.797726, 0.1294118, 1, 0, 1,
-0.5176781, -0.2890366, -1.281567, 0.1215686, 1, 0, 1,
-0.5175588, 1.220073, -0.07462965, 0.1176471, 1, 0, 1,
-0.5152125, 0.9185347, 0.6188373, 0.1098039, 1, 0, 1,
-0.5124514, 0.5835211, -1.015767, 0.1058824, 1, 0, 1,
-0.5079229, 0.8318951, 0.581541, 0.09803922, 1, 0, 1,
-0.5061141, -0.9171774, -3.693789, 0.09019608, 1, 0, 1,
-0.4952175, 0.4986654, 0.1730471, 0.08627451, 1, 0, 1,
-0.492438, -0.4064572, -2.231883, 0.07843138, 1, 0, 1,
-0.4907812, -0.09154436, -3.371711, 0.07450981, 1, 0, 1,
-0.4904371, -0.9651589, -2.760564, 0.06666667, 1, 0, 1,
-0.4799311, -0.5088057, -3.855376, 0.0627451, 1, 0, 1,
-0.4787986, -1.239303, -3.066478, 0.05490196, 1, 0, 1,
-0.4785677, 1.896572, 2.395423, 0.05098039, 1, 0, 1,
-0.4766077, -2.015649, -2.439443, 0.04313726, 1, 0, 1,
-0.4691957, -0.4189838, -0.5596992, 0.03921569, 1, 0, 1,
-0.4654958, -0.7397443, -1.406394, 0.03137255, 1, 0, 1,
-0.4567606, -0.7768404, -1.369064, 0.02745098, 1, 0, 1,
-0.451855, 0.9220847, -0.452929, 0.01960784, 1, 0, 1,
-0.4469008, -0.03371057, -0.7318476, 0.01568628, 1, 0, 1,
-0.4434123, -0.3681396, -0.8703038, 0.007843138, 1, 0, 1,
-0.4383171, -0.7849372, -2.509835, 0.003921569, 1, 0, 1,
-0.4275876, 1.899869, 0.4370915, 0, 1, 0.003921569, 1,
-0.4254889, 1.185789, -0.9827185, 0, 1, 0.01176471, 1,
-0.4251369, 0.05577604, -0.6971115, 0, 1, 0.01568628, 1,
-0.4230739, -1.769208, -2.391546, 0, 1, 0.02352941, 1,
-0.4163026, 0.3529562, -1.227086, 0, 1, 0.02745098, 1,
-0.4118587, 1.189791, -2.020113, 0, 1, 0.03529412, 1,
-0.4086063, -1.559583, -1.841645, 0, 1, 0.03921569, 1,
-0.4084674, 1.791066, 1.481583, 0, 1, 0.04705882, 1,
-0.4075142, -0.4155314, -2.506674, 0, 1, 0.05098039, 1,
-0.4052227, 0.52014, -0.2079002, 0, 1, 0.05882353, 1,
-0.4034805, -0.01970884, -0.6714889, 0, 1, 0.0627451, 1,
-0.3999483, -0.5379814, -2.036941, 0, 1, 0.07058824, 1,
-0.3937378, -0.1625308, -3.102731, 0, 1, 0.07450981, 1,
-0.3903447, -0.554482, -3.145808, 0, 1, 0.08235294, 1,
-0.3896622, 0.1376591, -0.3155628, 0, 1, 0.08627451, 1,
-0.3894289, 0.6316646, -0.9246348, 0, 1, 0.09411765, 1,
-0.3890312, 1.217037, 0.9258038, 0, 1, 0.1019608, 1,
-0.384128, 0.3461925, -1.907272, 0, 1, 0.1058824, 1,
-0.379079, -1.686502, -4.694781, 0, 1, 0.1137255, 1,
-0.3780071, 2.713842, -0.6101179, 0, 1, 0.1176471, 1,
-0.3767718, -0.8864748, -3.681745, 0, 1, 0.1254902, 1,
-0.3734253, 0.2443177, -1.86267, 0, 1, 0.1294118, 1,
-0.3608728, -0.6761974, -1.254857, 0, 1, 0.1372549, 1,
-0.3527538, -0.4488688, -1.416286, 0, 1, 0.1411765, 1,
-0.3517943, -0.6395344, -3.706724, 0, 1, 0.1490196, 1,
-0.3507214, 1.094774, -0.2076055, 0, 1, 0.1529412, 1,
-0.3450808, -0.7936997, -3.156743, 0, 1, 0.1607843, 1,
-0.3442684, -0.06363872, -2.635802, 0, 1, 0.1647059, 1,
-0.3433904, 1.843901, -0.7694436, 0, 1, 0.172549, 1,
-0.3386625, 0.2291753, -1.244856, 0, 1, 0.1764706, 1,
-0.3224953, 1.219122, 0.2703256, 0, 1, 0.1843137, 1,
-0.3210879, -0.946765, -2.99295, 0, 1, 0.1882353, 1,
-0.3132568, 0.09385326, -2.611799, 0, 1, 0.1960784, 1,
-0.3128095, -0.262718, -1.872375, 0, 1, 0.2039216, 1,
-0.3101458, -1.239318, -3.054349, 0, 1, 0.2078431, 1,
-0.3070498, -1.597568, -3.617754, 0, 1, 0.2156863, 1,
-0.3052562, 1.177333, -0.9852266, 0, 1, 0.2196078, 1,
-0.3022318, 1.995562, 0.4426907, 0, 1, 0.227451, 1,
-0.2910657, -0.5078514, -3.511636, 0, 1, 0.2313726, 1,
-0.2896936, 1.59043, -0.5428408, 0, 1, 0.2392157, 1,
-0.2866379, 1.595459, 0.7943779, 0, 1, 0.2431373, 1,
-0.2852152, 0.5190599, -1.35456, 0, 1, 0.2509804, 1,
-0.2776332, -0.09000717, -1.340258, 0, 1, 0.254902, 1,
-0.2760479, 1.295228, 0.7139866, 0, 1, 0.2627451, 1,
-0.2741745, 0.496775, 0.7158331, 0, 1, 0.2666667, 1,
-0.2715315, -1.096435, -2.348353, 0, 1, 0.2745098, 1,
-0.2619753, 1.126426, -2.049607, 0, 1, 0.2784314, 1,
-0.2605334, -1.118301, -3.162974, 0, 1, 0.2862745, 1,
-0.2591076, 0.3091035, -1.25867, 0, 1, 0.2901961, 1,
-0.2533168, 1.035969, 0.8319513, 0, 1, 0.2980392, 1,
-0.2521422, 0.4458717, 0.671872, 0, 1, 0.3058824, 1,
-0.247765, 0.216736, -0.1278189, 0, 1, 0.3098039, 1,
-0.247585, -0.2606306, -2.684906, 0, 1, 0.3176471, 1,
-0.2470326, -0.7219313, -0.3641438, 0, 1, 0.3215686, 1,
-0.2454828, 0.4470621, -0.3524196, 0, 1, 0.3294118, 1,
-0.2442926, -0.8493166, -4.169442, 0, 1, 0.3333333, 1,
-0.2431332, 0.1425109, -0.287218, 0, 1, 0.3411765, 1,
-0.2362279, 0.3561945, -1.796611, 0, 1, 0.345098, 1,
-0.2350426, -0.04889271, -0.252608, 0, 1, 0.3529412, 1,
-0.2307949, -0.3079249, -3.966318, 0, 1, 0.3568628, 1,
-0.2304279, 0.8981853, -0.09539019, 0, 1, 0.3647059, 1,
-0.2275652, 1.262778, 0.88951, 0, 1, 0.3686275, 1,
-0.2244451, 1.449811, -1.166898, 0, 1, 0.3764706, 1,
-0.2233376, -0.3349597, -0.8823998, 0, 1, 0.3803922, 1,
-0.2213231, 1.692485, -0.6541237, 0, 1, 0.3882353, 1,
-0.2195658, 0.4033751, 1.082771, 0, 1, 0.3921569, 1,
-0.21647, -0.4946268, -2.794266, 0, 1, 0.4, 1,
-0.2159339, -2.384394, -3.304847, 0, 1, 0.4078431, 1,
-0.2123845, -1.107625, -3.641432, 0, 1, 0.4117647, 1,
-0.2096322, -0.1554893, -3.63696, 0, 1, 0.4196078, 1,
-0.2079835, -0.499794, -3.466014, 0, 1, 0.4235294, 1,
-0.2037131, 0.5593331, 0.1490717, 0, 1, 0.4313726, 1,
-0.2032875, 0.7893103, -0.08634515, 0, 1, 0.4352941, 1,
-0.2016892, -1.151514, -4.160621, 0, 1, 0.4431373, 1,
-0.1974823, 1.098985, -0.2611184, 0, 1, 0.4470588, 1,
-0.1973986, -0.9401257, -2.291018, 0, 1, 0.454902, 1,
-0.1962978, 1.56626, -1.731105, 0, 1, 0.4588235, 1,
-0.1933176, 0.1759328, -0.5477161, 0, 1, 0.4666667, 1,
-0.1908488, 1.897598, 0.211935, 0, 1, 0.4705882, 1,
-0.188602, -1.841856, -2.491703, 0, 1, 0.4784314, 1,
-0.1871694, -0.6943436, -4.132596, 0, 1, 0.4823529, 1,
-0.1770153, 1.079926, 0.8067142, 0, 1, 0.4901961, 1,
-0.1751927, -0.1491162, -2.464654, 0, 1, 0.4941176, 1,
-0.1743944, 1.85945, -3.20184, 0, 1, 0.5019608, 1,
-0.1736589, -0.5707202, -3.193813, 0, 1, 0.509804, 1,
-0.1729766, 0.622317, -1.340534, 0, 1, 0.5137255, 1,
-0.1678954, 2.053847, -0.8269315, 0, 1, 0.5215687, 1,
-0.1658655, -0.458468, -4.594578, 0, 1, 0.5254902, 1,
-0.1615704, 0.9315239, 0.2053316, 0, 1, 0.5333334, 1,
-0.1604504, -1.134209, -1.290109, 0, 1, 0.5372549, 1,
-0.1602525, 1.292571, -0.8705368, 0, 1, 0.5450981, 1,
-0.1596423, -0.4949121, -2.041978, 0, 1, 0.5490196, 1,
-0.1589125, -0.423143, -3.019913, 0, 1, 0.5568628, 1,
-0.154511, -0.3746805, -3.79178, 0, 1, 0.5607843, 1,
-0.1536264, -1.222214, -3.927329, 0, 1, 0.5686275, 1,
-0.1512584, 0.127159, -0.6641007, 0, 1, 0.572549, 1,
-0.1511953, -0.4087548, -2.921225, 0, 1, 0.5803922, 1,
-0.1478477, 0.4446983, -0.5633315, 0, 1, 0.5843138, 1,
-0.1474988, -1.186545, -3.792167, 0, 1, 0.5921569, 1,
-0.1441384, -0.4090811, -3.807746, 0, 1, 0.5960785, 1,
-0.1439398, 1.532964, -0.5404086, 0, 1, 0.6039216, 1,
-0.1399896, -0.4832999, -4.252647, 0, 1, 0.6117647, 1,
-0.1387701, -0.1115087, -0.6208929, 0, 1, 0.6156863, 1,
-0.1367061, -0.7153534, -2.44754, 0, 1, 0.6235294, 1,
-0.1328597, -0.004487976, -1.245941, 0, 1, 0.627451, 1,
-0.1282318, 1.822118, -1.161335, 0, 1, 0.6352941, 1,
-0.1257508, 0.4277706, -1.895402, 0, 1, 0.6392157, 1,
-0.1243938, 0.7251095, 0.6745492, 0, 1, 0.6470588, 1,
-0.1204929, -1.335767, -5.207758, 0, 1, 0.6509804, 1,
-0.1168513, -0.5752499, -2.943298, 0, 1, 0.6588235, 1,
-0.1160869, -1.113671, -4.462887, 0, 1, 0.6627451, 1,
-0.1102131, -1.307094, -3.046725, 0, 1, 0.6705883, 1,
-0.1028143, -0.3007774, -3.678506, 0, 1, 0.6745098, 1,
-0.1017017, -0.4725022, -1.475455, 0, 1, 0.682353, 1,
-0.1015525, -2.444754, -2.761382, 0, 1, 0.6862745, 1,
-0.09823316, -0.4860894, -1.485616, 0, 1, 0.6941177, 1,
-0.09574313, 0.5995225, -0.5217895, 0, 1, 0.7019608, 1,
-0.09512367, 0.2640452, -0.4114329, 0, 1, 0.7058824, 1,
-0.09393975, 0.9992721, -2.464354, 0, 1, 0.7137255, 1,
-0.09333713, 0.4235999, 1.099177, 0, 1, 0.7176471, 1,
-0.09136897, 0.4907258, -0.6800805, 0, 1, 0.7254902, 1,
-0.08652771, 1.169924, -1.343198, 0, 1, 0.7294118, 1,
-0.08631779, 0.09867574, -1.378517, 0, 1, 0.7372549, 1,
-0.08531763, 1.246896, 1.267648, 0, 1, 0.7411765, 1,
-0.08477006, -0.6648573, -1.804526, 0, 1, 0.7490196, 1,
-0.08408322, -1.236816, -2.293928, 0, 1, 0.7529412, 1,
-0.08248999, 0.3475681, 0.8837967, 0, 1, 0.7607843, 1,
-0.07969514, -0.6144264, -3.566077, 0, 1, 0.7647059, 1,
-0.07522079, -0.9767649, -2.557387, 0, 1, 0.772549, 1,
-0.07519609, -0.7874862, -5.686347, 0, 1, 0.7764706, 1,
-0.0744393, -1.201354, -3.449324, 0, 1, 0.7843137, 1,
-0.07421503, 0.6033954, -0.9968382, 0, 1, 0.7882353, 1,
-0.07374591, 0.09630801, -0.556501, 0, 1, 0.7960784, 1,
-0.07226681, -1.17052, -2.095167, 0, 1, 0.8039216, 1,
-0.0714339, -0.474689, -3.426298, 0, 1, 0.8078431, 1,
-0.06475208, -0.2880354, -2.627395, 0, 1, 0.8156863, 1,
-0.0639082, -1.785719, -3.322858, 0, 1, 0.8196079, 1,
-0.06329986, -0.1174392, -2.031911, 0, 1, 0.827451, 1,
-0.06065122, -0.9142421, -1.962571, 0, 1, 0.8313726, 1,
-0.05963952, -0.6606176, -2.865931, 0, 1, 0.8392157, 1,
-0.0582072, 0.8485871, 1.437004, 0, 1, 0.8431373, 1,
-0.05761573, -0.2386912, -2.324131, 0, 1, 0.8509804, 1,
-0.05744395, -0.06550057, -2.387996, 0, 1, 0.854902, 1,
-0.04898846, 1.809914, -0.241296, 0, 1, 0.8627451, 1,
-0.04755927, 1.601803, -0.6213444, 0, 1, 0.8666667, 1,
-0.04715604, 1.74697, 0.3159121, 0, 1, 0.8745098, 1,
-0.04135272, 0.5457543, -0.6150296, 0, 1, 0.8784314, 1,
-0.03968365, 0.1204334, 0.8168433, 0, 1, 0.8862745, 1,
-0.03815272, -1.260077, -3.947165, 0, 1, 0.8901961, 1,
-0.03659786, -0.9485491, -2.51234, 0, 1, 0.8980392, 1,
-0.03419552, -1.067008, -5.510165, 0, 1, 0.9058824, 1,
-0.02842834, 0.3710434, -0.9719374, 0, 1, 0.9098039, 1,
-0.02719061, -1.106889, -4.419965, 0, 1, 0.9176471, 1,
-0.02711285, -0.05779595, -3.245138, 0, 1, 0.9215686, 1,
-0.02431048, 0.1417569, -0.2623103, 0, 1, 0.9294118, 1,
-0.02246399, 0.3105215, -0.7224368, 0, 1, 0.9333333, 1,
-0.02054873, 2.284851, 2.000675, 0, 1, 0.9411765, 1,
-0.0169381, -1.41065, -2.480388, 0, 1, 0.945098, 1,
-0.01675684, -0.5104779, -3.770646, 0, 1, 0.9529412, 1,
-0.01463517, 1.238361, 0.987231, 0, 1, 0.9568627, 1,
-0.01399987, -0.2482601, -2.508631, 0, 1, 0.9647059, 1,
-0.01344486, -0.3203692, -4.519002, 0, 1, 0.9686275, 1,
-0.009997086, -1.713755, -3.590525, 0, 1, 0.9764706, 1,
-0.009980937, -2.136513, -1.912235, 0, 1, 0.9803922, 1,
-0.007565731, -0.1152071, -3.593203, 0, 1, 0.9882353, 1,
-0.006162951, 1.422053, 0.0637446, 0, 1, 0.9921569, 1,
0.001990202, -0.9491841, 2.242913, 0, 1, 1, 1,
0.00274495, -0.7082834, 1.706708, 0, 0.9921569, 1, 1,
0.003033178, 1.793386, -0.6123702, 0, 0.9882353, 1, 1,
0.006399936, -0.9280897, 3.187354, 0, 0.9803922, 1, 1,
0.008227197, 1.807847, -0.8685853, 0, 0.9764706, 1, 1,
0.0150252, 1.336077, 0.6739839, 0, 0.9686275, 1, 1,
0.01723909, 0.9171817, 0.9562796, 0, 0.9647059, 1, 1,
0.02009734, 0.7900282, 0.00169021, 0, 0.9568627, 1, 1,
0.02220535, 1.448778, 1.134274, 0, 0.9529412, 1, 1,
0.02466989, -1.39245, 2.685977, 0, 0.945098, 1, 1,
0.02578622, 0.4581201, -1.589181, 0, 0.9411765, 1, 1,
0.03962047, 1.142757, -2.136099, 0, 0.9333333, 1, 1,
0.04478659, 0.1358919, 1.869243, 0, 0.9294118, 1, 1,
0.04822478, 0.2699392, -0.4741641, 0, 0.9215686, 1, 1,
0.04840323, 0.2157719, -0.5864779, 0, 0.9176471, 1, 1,
0.0485489, 0.1590155, 0.09827304, 0, 0.9098039, 1, 1,
0.05066998, 1.261185, -0.7273344, 0, 0.9058824, 1, 1,
0.05129441, 1.18163, -1.961815, 0, 0.8980392, 1, 1,
0.05278802, -0.9876093, 2.492295, 0, 0.8901961, 1, 1,
0.05857298, 0.1216247, 0.1886424, 0, 0.8862745, 1, 1,
0.06168298, -1.371194, 2.893787, 0, 0.8784314, 1, 1,
0.06443799, -0.2122354, 1.683447, 0, 0.8745098, 1, 1,
0.06903203, 0.4148143, -1.172985, 0, 0.8666667, 1, 1,
0.06969301, -1.858119, 2.690516, 0, 0.8627451, 1, 1,
0.07037584, -0.2589914, 3.860946, 0, 0.854902, 1, 1,
0.07174651, -0.4684439, 3.519516, 0, 0.8509804, 1, 1,
0.07324038, -0.5299523, 3.002161, 0, 0.8431373, 1, 1,
0.07366796, -1.688045, 2.925016, 0, 0.8392157, 1, 1,
0.07560707, 0.8644612, 0.05665607, 0, 0.8313726, 1, 1,
0.07646091, -0.004113209, 3.366147, 0, 0.827451, 1, 1,
0.07879435, -0.4846735, 0.7951592, 0, 0.8196079, 1, 1,
0.08426511, 0.07157577, 2.045386, 0, 0.8156863, 1, 1,
0.08485568, 0.6010056, 1.664864, 0, 0.8078431, 1, 1,
0.08503013, -1.703321, 5.717476, 0, 0.8039216, 1, 1,
0.08632414, 0.4472419, -0.7574532, 0, 0.7960784, 1, 1,
0.08929099, -0.6774006, 2.173727, 0, 0.7882353, 1, 1,
0.08997599, -0.9280217, 3.219861, 0, 0.7843137, 1, 1,
0.0921325, -0.1688557, 4.31253, 0, 0.7764706, 1, 1,
0.09237752, 0.8873878, 0.3381031, 0, 0.772549, 1, 1,
0.09732544, 2.216141, 0.4172419, 0, 0.7647059, 1, 1,
0.09734616, 0.5007653, 0.27321, 0, 0.7607843, 1, 1,
0.1006362, -0.4719666, 1.950509, 0, 0.7529412, 1, 1,
0.1117131, 0.7807481, 2.071447, 0, 0.7490196, 1, 1,
0.1124868, -0.308753, 3.628829, 0, 0.7411765, 1, 1,
0.1128708, -0.07898247, 3.890049, 0, 0.7372549, 1, 1,
0.1142418, 0.4876986, -0.8810158, 0, 0.7294118, 1, 1,
0.1217251, 1.37019, 1.479314, 0, 0.7254902, 1, 1,
0.1248903, 0.4867848, -0.3564507, 0, 0.7176471, 1, 1,
0.1306818, 0.4654224, -0.5617126, 0, 0.7137255, 1, 1,
0.1327409, 0.07719045, 1.527404, 0, 0.7058824, 1, 1,
0.1329302, -0.1817544, 2.659104, 0, 0.6980392, 1, 1,
0.1410201, 1.280748, 1.035204, 0, 0.6941177, 1, 1,
0.1417638, -0.5617168, 3.190792, 0, 0.6862745, 1, 1,
0.1424761, -0.2672928, 3.121591, 0, 0.682353, 1, 1,
0.1534284, -1.109879, 3.037458, 0, 0.6745098, 1, 1,
0.1566465, 1.510618, -0.432816, 0, 0.6705883, 1, 1,
0.1576382, -1.447343, 2.827244, 0, 0.6627451, 1, 1,
0.1623325, 0.616967, 1.34126, 0, 0.6588235, 1, 1,
0.1655141, 1.53589, 0.231341, 0, 0.6509804, 1, 1,
0.1655347, -0.8091192, 3.808733, 0, 0.6470588, 1, 1,
0.1657712, 0.5382186, -0.8288835, 0, 0.6392157, 1, 1,
0.1697937, 0.6572568, -1.205325, 0, 0.6352941, 1, 1,
0.1706032, 1.403549, -0.9308819, 0, 0.627451, 1, 1,
0.1743179, -0.8734039, 2.965743, 0, 0.6235294, 1, 1,
0.1783035, 1.253776, -0.09169593, 0, 0.6156863, 1, 1,
0.1820309, 0.9530095, -0.172311, 0, 0.6117647, 1, 1,
0.1851455, -1.151741, 3.990083, 0, 0.6039216, 1, 1,
0.1887427, -0.5614585, 3.602247, 0, 0.5960785, 1, 1,
0.1892468, 1.641766, 0.5613949, 0, 0.5921569, 1, 1,
0.1907991, -0.4477144, 5.259276, 0, 0.5843138, 1, 1,
0.1913186, -0.02103567, 1.196527, 0, 0.5803922, 1, 1,
0.1927757, -0.3293024, 3.231324, 0, 0.572549, 1, 1,
0.1948574, 1.185381, 0.4173647, 0, 0.5686275, 1, 1,
0.1991524, 0.7963064, 0.6215072, 0, 0.5607843, 1, 1,
0.2007408, -2.018821, 1.913192, 0, 0.5568628, 1, 1,
0.2028831, 1.029273, 0.2884423, 0, 0.5490196, 1, 1,
0.2039958, -1.129638, 1.726037, 0, 0.5450981, 1, 1,
0.2055518, -0.077096, 1.702129, 0, 0.5372549, 1, 1,
0.2059618, -0.5004805, 1.399352, 0, 0.5333334, 1, 1,
0.2106637, 1.514233, 0.19897, 0, 0.5254902, 1, 1,
0.2123547, -0.688776, 3.365356, 0, 0.5215687, 1, 1,
0.2160852, -0.3482976, 4.147947, 0, 0.5137255, 1, 1,
0.2188156, 1.392706, 0.2308495, 0, 0.509804, 1, 1,
0.2205104, -0.6925442, 1.9148, 0, 0.5019608, 1, 1,
0.2208805, 1.060058, 0.7069467, 0, 0.4941176, 1, 1,
0.2223781, 1.387433, 0.02798149, 0, 0.4901961, 1, 1,
0.2262967, -0.5152531, 1.884904, 0, 0.4823529, 1, 1,
0.2277985, 0.5076199, 0.5678667, 0, 0.4784314, 1, 1,
0.2367007, 0.2601544, 1.414231, 0, 0.4705882, 1, 1,
0.2371598, 0.2681992, 1.400563, 0, 0.4666667, 1, 1,
0.2380746, -0.4556018, 1.812407, 0, 0.4588235, 1, 1,
0.245648, -0.209214, 3.579192, 0, 0.454902, 1, 1,
0.25045, 1.749054, 0.4116077, 0, 0.4470588, 1, 1,
0.2538461, -0.4517728, 1.480482, 0, 0.4431373, 1, 1,
0.2549162, 0.3543766, -0.02452405, 0, 0.4352941, 1, 1,
0.2559287, -1.445314, 2.696722, 0, 0.4313726, 1, 1,
0.2559415, -0.04004899, 0.7830771, 0, 0.4235294, 1, 1,
0.2566085, 0.470961, -0.3985072, 0, 0.4196078, 1, 1,
0.259384, -2.228334, 4.049182, 0, 0.4117647, 1, 1,
0.2600819, -0.91918, 3.830553, 0, 0.4078431, 1, 1,
0.2609746, -0.3255487, 2.823948, 0, 0.4, 1, 1,
0.263477, 0.4505575, 0.8688448, 0, 0.3921569, 1, 1,
0.267562, -0.8097968, 4.412752, 0, 0.3882353, 1, 1,
0.2683561, -0.0240031, 0.8452052, 0, 0.3803922, 1, 1,
0.2691182, 0.664205, -0.9386687, 0, 0.3764706, 1, 1,
0.2706729, 0.9476036, 1.707716, 0, 0.3686275, 1, 1,
0.2724337, -2.048251, 3.349978, 0, 0.3647059, 1, 1,
0.2732515, -1.953326, 3.32946, 0, 0.3568628, 1, 1,
0.2745507, -0.3210668, 2.665292, 0, 0.3529412, 1, 1,
0.275216, 1.312125, 0.828391, 0, 0.345098, 1, 1,
0.2772854, 0.4119265, 2.356138, 0, 0.3411765, 1, 1,
0.2787598, -1.227299, 4.495419, 0, 0.3333333, 1, 1,
0.2814007, 0.5383379, 0.8277819, 0, 0.3294118, 1, 1,
0.283711, 0.4395139, -0.3736466, 0, 0.3215686, 1, 1,
0.288861, -1.337952, 3.027717, 0, 0.3176471, 1, 1,
0.2898088, 0.8870345, 2.166187, 0, 0.3098039, 1, 1,
0.2945267, 1.395905, -0.9603907, 0, 0.3058824, 1, 1,
0.2949595, 1.886844, 0.140681, 0, 0.2980392, 1, 1,
0.295764, -0.6189378, 3.952607, 0, 0.2901961, 1, 1,
0.2978139, 1.384429, -0.06121484, 0, 0.2862745, 1, 1,
0.2980284, -1.66809, 2.54592, 0, 0.2784314, 1, 1,
0.3047804, 0.2693524, 1.227976, 0, 0.2745098, 1, 1,
0.3070386, -0.2479606, 3.032579, 0, 0.2666667, 1, 1,
0.3072691, 1.672874, 0.2527208, 0, 0.2627451, 1, 1,
0.3141071, 0.5696244, 0.932265, 0, 0.254902, 1, 1,
0.3152104, -0.4915424, 4.363765, 0, 0.2509804, 1, 1,
0.3243312, 1.069017, 0.7186016, 0, 0.2431373, 1, 1,
0.3249804, -1.328201, 2.731254, 0, 0.2392157, 1, 1,
0.3296179, -0.01784522, 0.8818996, 0, 0.2313726, 1, 1,
0.3304046, -0.8863525, 2.832169, 0, 0.227451, 1, 1,
0.3320866, -0.0939987, 0.09182449, 0, 0.2196078, 1, 1,
0.3341433, 2.418921, 1.360361, 0, 0.2156863, 1, 1,
0.3406728, 2.593246, -0.3549075, 0, 0.2078431, 1, 1,
0.3435709, -1.988293, 1.834875, 0, 0.2039216, 1, 1,
0.3469718, 0.05026466, -0.6221445, 0, 0.1960784, 1, 1,
0.3489549, 0.8560177, 1.563495, 0, 0.1882353, 1, 1,
0.3529688, -0.8102411, 3.070194, 0, 0.1843137, 1, 1,
0.3540472, 0.1607024, 1.333602, 0, 0.1764706, 1, 1,
0.3546866, 0.1777097, 1.625668, 0, 0.172549, 1, 1,
0.3590239, 0.727784, 0.9857995, 0, 0.1647059, 1, 1,
0.3599058, 0.1105724, 0.3931979, 0, 0.1607843, 1, 1,
0.3601961, -2.382853, 1.752812, 0, 0.1529412, 1, 1,
0.3648408, 0.1740126, 0.8142669, 0, 0.1490196, 1, 1,
0.3739262, 0.08575862, 0.7859306, 0, 0.1411765, 1, 1,
0.3771911, 0.4270019, 0.4420215, 0, 0.1372549, 1, 1,
0.3796068, -1.996734, 3.300931, 0, 0.1294118, 1, 1,
0.379859, -0.7017538, 1.811098, 0, 0.1254902, 1, 1,
0.3806504, -0.1881665, 1.851331, 0, 0.1176471, 1, 1,
0.3822332, -0.07103506, 1.295788, 0, 0.1137255, 1, 1,
0.3851724, 0.9156082, 0.4295673, 0, 0.1058824, 1, 1,
0.3891369, 0.4105602, 0.1818718, 0, 0.09803922, 1, 1,
0.391267, 0.3692057, 1.263692, 0, 0.09411765, 1, 1,
0.3916112, -0.9558259, 4.477837, 0, 0.08627451, 1, 1,
0.3988545, 0.04471072, 1.802675, 0, 0.08235294, 1, 1,
0.3999953, 0.9576649, 1.162383, 0, 0.07450981, 1, 1,
0.4002474, 1.757578, -0.8253942, 0, 0.07058824, 1, 1,
0.40045, -1.161526, 1.414215, 0, 0.0627451, 1, 1,
0.4033343, -1.010591, 2.536623, 0, 0.05882353, 1, 1,
0.403362, 0.8672706, 2.003427, 0, 0.05098039, 1, 1,
0.4105249, -0.9106533, 3.696858, 0, 0.04705882, 1, 1,
0.421622, -1.202053, 2.405091, 0, 0.03921569, 1, 1,
0.4242974, -2.059469, 3.99508, 0, 0.03529412, 1, 1,
0.4249915, -0.6064624, 2.875673, 0, 0.02745098, 1, 1,
0.4440055, 0.1535718, 3.850583, 0, 0.02352941, 1, 1,
0.444646, 1.197962, -0.8044728, 0, 0.01568628, 1, 1,
0.4454108, -0.4090508, 3.746902, 0, 0.01176471, 1, 1,
0.4495723, 0.4515312, -0.3512169, 0, 0.003921569, 1, 1,
0.4544893, -0.3160969, 1.597252, 0.003921569, 0, 1, 1,
0.456809, -1.071899, 2.260387, 0.007843138, 0, 1, 1,
0.4606888, -1.453024, 4.156675, 0.01568628, 0, 1, 1,
0.466449, 0.5116766, 0.8331777, 0.01960784, 0, 1, 1,
0.4695773, 0.1351042, 0.2754747, 0.02745098, 0, 1, 1,
0.4703971, -1.655561, 1.686853, 0.03137255, 0, 1, 1,
0.4782162, -0.5917006, 2.335614, 0.03921569, 0, 1, 1,
0.4782924, -1.523713, 1.580145, 0.04313726, 0, 1, 1,
0.4801334, 0.5653312, 0.4615167, 0.05098039, 0, 1, 1,
0.4833402, 2.171748, 2.644579, 0.05490196, 0, 1, 1,
0.4836952, 0.7302846, -0.9254001, 0.0627451, 0, 1, 1,
0.4899002, 0.7304636, -0.1500887, 0.06666667, 0, 1, 1,
0.4963279, 0.6065086, 1.7055, 0.07450981, 0, 1, 1,
0.5047608, 0.4879167, 2.043628, 0.07843138, 0, 1, 1,
0.5050397, 0.215663, 1.560351, 0.08627451, 0, 1, 1,
0.5068725, 1.690234, 1.587526, 0.09019608, 0, 1, 1,
0.5095882, -1.052269, 2.743469, 0.09803922, 0, 1, 1,
0.5118701, 0.2857128, 0.7705672, 0.1058824, 0, 1, 1,
0.5123481, 0.7874876, 0.3678323, 0.1098039, 0, 1, 1,
0.512454, -0.1653269, 3.900044, 0.1176471, 0, 1, 1,
0.5124949, -1.345863, 2.663476, 0.1215686, 0, 1, 1,
0.5207609, -0.8278689, 3.68285, 0.1294118, 0, 1, 1,
0.5208238, -2.083921, 3.13076, 0.1333333, 0, 1, 1,
0.5223073, -1.102818, 4.231994, 0.1411765, 0, 1, 1,
0.525734, 1.572037, 0.9988713, 0.145098, 0, 1, 1,
0.5264325, 1.707813, 1.334256, 0.1529412, 0, 1, 1,
0.5316373, -0.04499043, 1.015047, 0.1568628, 0, 1, 1,
0.5374281, 0.6098756, 1.54912, 0.1647059, 0, 1, 1,
0.5382707, -0.9736103, 1.393191, 0.1686275, 0, 1, 1,
0.5415824, 0.03646715, 1.555736, 0.1764706, 0, 1, 1,
0.5425658, 0.3507561, -0.1932941, 0.1803922, 0, 1, 1,
0.5441211, -0.4483925, 3.949888, 0.1882353, 0, 1, 1,
0.55038, 1.881789, -0.1040142, 0.1921569, 0, 1, 1,
0.5534392, 0.155409, 2.516212, 0.2, 0, 1, 1,
0.558706, -1.086018, 2.144029, 0.2078431, 0, 1, 1,
0.5590917, -0.2235018, -0.2642595, 0.2117647, 0, 1, 1,
0.5619726, -0.4300992, 1.43397, 0.2196078, 0, 1, 1,
0.5661252, -1.551118, 3.990057, 0.2235294, 0, 1, 1,
0.5692617, 2.418504, 0.2722318, 0.2313726, 0, 1, 1,
0.5751029, 0.4392466, 1.739422, 0.2352941, 0, 1, 1,
0.5808259, -0.735396, 2.275277, 0.2431373, 0, 1, 1,
0.5812335, -0.06102316, 1.227125, 0.2470588, 0, 1, 1,
0.5825222, 2.310079, -1.426644, 0.254902, 0, 1, 1,
0.586544, 0.9012874, 0.1617566, 0.2588235, 0, 1, 1,
0.5866128, -0.2559989, 1.71782, 0.2666667, 0, 1, 1,
0.5873799, 0.3467425, 0.9398196, 0.2705882, 0, 1, 1,
0.5883467, 2.637387, 0.3351778, 0.2784314, 0, 1, 1,
0.5897534, -0.2515252, 2.074131, 0.282353, 0, 1, 1,
0.5911856, 0.655582, 1.149678, 0.2901961, 0, 1, 1,
0.5941423, 1.311134, -0.5700489, 0.2941177, 0, 1, 1,
0.5947317, -0.6139706, 0.8838539, 0.3019608, 0, 1, 1,
0.6010064, -0.8909823, 2.827836, 0.3098039, 0, 1, 1,
0.6061593, -0.166584, 2.979253, 0.3137255, 0, 1, 1,
0.6063128, 0.2897705, 2.057747, 0.3215686, 0, 1, 1,
0.6063895, -0.4720707, 2.674127, 0.3254902, 0, 1, 1,
0.610539, -0.8934537, 2.814099, 0.3333333, 0, 1, 1,
0.6132887, -0.2844762, 3.624508, 0.3372549, 0, 1, 1,
0.6155845, 0.3756827, 0.5771999, 0.345098, 0, 1, 1,
0.6196877, 1.081504, -0.7820588, 0.3490196, 0, 1, 1,
0.6252375, 0.6513102, -0.6868044, 0.3568628, 0, 1, 1,
0.6322007, 0.6460508, 1.508376, 0.3607843, 0, 1, 1,
0.6375933, 0.7386721, 2.139222, 0.3686275, 0, 1, 1,
0.638066, 0.8182604, -0.3408976, 0.372549, 0, 1, 1,
0.6394294, 0.04069795, 0.260459, 0.3803922, 0, 1, 1,
0.6406924, 0.6367036, 0.5770266, 0.3843137, 0, 1, 1,
0.6461754, -1.28761, 4.088732, 0.3921569, 0, 1, 1,
0.6479111, -0.01927685, 1.05696, 0.3960784, 0, 1, 1,
0.6484389, -0.6772267, 3.086406, 0.4039216, 0, 1, 1,
0.650204, -0.1758067, 1.624133, 0.4117647, 0, 1, 1,
0.6504107, 0.733259, 0.2747149, 0.4156863, 0, 1, 1,
0.6548361, -0.39694, 3.232364, 0.4235294, 0, 1, 1,
0.6573041, -0.8335458, 3.816156, 0.427451, 0, 1, 1,
0.6630027, -0.810952, 3.827163, 0.4352941, 0, 1, 1,
0.6646298, 0.5104068, 1.07754, 0.4392157, 0, 1, 1,
0.6685405, -1.660547, 5.077872, 0.4470588, 0, 1, 1,
0.6695564, 1.179609, -0.05103587, 0.4509804, 0, 1, 1,
0.67645, 0.3352549, -0.1530482, 0.4588235, 0, 1, 1,
0.6781807, 0.2518661, 1.559657, 0.4627451, 0, 1, 1,
0.6796567, -0.5315493, 2.0177, 0.4705882, 0, 1, 1,
0.68132, -1.110023, 2.533908, 0.4745098, 0, 1, 1,
0.6834338, 0.7049719, -0.9821921, 0.4823529, 0, 1, 1,
0.6936988, -0.4532878, 1.290614, 0.4862745, 0, 1, 1,
0.6992896, 0.6814682, 0.7274104, 0.4941176, 0, 1, 1,
0.7038957, -1.263124, 1.806565, 0.5019608, 0, 1, 1,
0.7061666, -1.641137, 0.5654336, 0.5058824, 0, 1, 1,
0.7092196, 0.5692703, 0.1318456, 0.5137255, 0, 1, 1,
0.7201941, 0.6863831, 1.141521, 0.5176471, 0, 1, 1,
0.7268271, 0.3384488, 1.181822, 0.5254902, 0, 1, 1,
0.7278368, 0.6862003, 2.018821, 0.5294118, 0, 1, 1,
0.7313268, -1.979021, 2.240821, 0.5372549, 0, 1, 1,
0.7322399, -1.132279, 2.653817, 0.5411765, 0, 1, 1,
0.7331527, -0.8100536, 2.956617, 0.5490196, 0, 1, 1,
0.7399074, -0.6852242, 2.541706, 0.5529412, 0, 1, 1,
0.7412408, 0.9076951, 0.5858791, 0.5607843, 0, 1, 1,
0.7413846, -3.10436, 3.127692, 0.5647059, 0, 1, 1,
0.7422603, -1.090644, 0.9750131, 0.572549, 0, 1, 1,
0.7426431, 0.2532748, 3.162005, 0.5764706, 0, 1, 1,
0.7499988, -0.2054304, 2.477274, 0.5843138, 0, 1, 1,
0.7513408, 0.4871417, 1.591171, 0.5882353, 0, 1, 1,
0.7578661, -1.708403, 2.312742, 0.5960785, 0, 1, 1,
0.7602677, 0.6361402, 3.404194, 0.6039216, 0, 1, 1,
0.7650911, 0.6540256, 0.5909626, 0.6078432, 0, 1, 1,
0.7723104, 1.612147, 1.461497, 0.6156863, 0, 1, 1,
0.7807566, 0.887724, 1.147162, 0.6196079, 0, 1, 1,
0.7840706, -1.667635, 1.989514, 0.627451, 0, 1, 1,
0.7854398, 0.5387363, 0.9936861, 0.6313726, 0, 1, 1,
0.7863671, 0.1458631, 1.015992, 0.6392157, 0, 1, 1,
0.7891188, -1.15128, 2.2447, 0.6431373, 0, 1, 1,
0.7953368, 1.059258, -0.1519029, 0.6509804, 0, 1, 1,
0.7991013, 1.922983, 1.801485, 0.654902, 0, 1, 1,
0.8006052, 1.422156, 2.318536, 0.6627451, 0, 1, 1,
0.8050143, -1.425966, 1.968978, 0.6666667, 0, 1, 1,
0.8085067, 0.04656176, 3.256251, 0.6745098, 0, 1, 1,
0.8124219, 1.088976, 0.1886722, 0.6784314, 0, 1, 1,
0.8152595, 0.835174, -2.468584, 0.6862745, 0, 1, 1,
0.8174171, 0.7213866, 1.884585, 0.6901961, 0, 1, 1,
0.8268039, 0.009444582, 1.795223, 0.6980392, 0, 1, 1,
0.8268628, 0.6707222, -0.07361089, 0.7058824, 0, 1, 1,
0.8299537, 0.4401277, 0.234836, 0.7098039, 0, 1, 1,
0.8302537, -1.236308, 2.17612, 0.7176471, 0, 1, 1,
0.8318194, 0.278808, 1.428948, 0.7215686, 0, 1, 1,
0.838301, -0.3473548, 2.597845, 0.7294118, 0, 1, 1,
0.8431619, 1.24614, 2.57912, 0.7333333, 0, 1, 1,
0.8452576, -0.1140817, -0.8872551, 0.7411765, 0, 1, 1,
0.8520354, -0.4070486, 2.264115, 0.7450981, 0, 1, 1,
0.8543286, 2.189922, 0.3548035, 0.7529412, 0, 1, 1,
0.8555164, -0.4016342, 1.921779, 0.7568628, 0, 1, 1,
0.8583853, -0.02021984, 1.882626, 0.7647059, 0, 1, 1,
0.8609647, 0.3600336, 1.769133, 0.7686275, 0, 1, 1,
0.8661568, 0.5235327, -0.1702304, 0.7764706, 0, 1, 1,
0.8721027, -2.091078, 4.34431, 0.7803922, 0, 1, 1,
0.8736621, 0.3013241, 1.55512, 0.7882353, 0, 1, 1,
0.8783234, -1.046075, 3.73969, 0.7921569, 0, 1, 1,
0.8809091, -0.377104, 1.547669, 0.8, 0, 1, 1,
0.8809829, -0.07654981, -0.1048237, 0.8078431, 0, 1, 1,
0.8849955, 0.6925586, 0.4847395, 0.8117647, 0, 1, 1,
0.8854301, -1.24628, 2.832027, 0.8196079, 0, 1, 1,
0.8884903, 1.297631, 1.42971, 0.8235294, 0, 1, 1,
0.8924243, 0.3639094, 1.69861, 0.8313726, 0, 1, 1,
0.8925222, -0.4746144, 1.900599, 0.8352941, 0, 1, 1,
0.8943769, -0.332384, 1.781998, 0.8431373, 0, 1, 1,
0.9014028, -1.563882, 2.123687, 0.8470588, 0, 1, 1,
0.9023867, 0.64273, 2.433857, 0.854902, 0, 1, 1,
0.9035528, -0.7756487, 2.289443, 0.8588235, 0, 1, 1,
0.9077776, 1.104296, 0.6754666, 0.8666667, 0, 1, 1,
0.9198064, 0.8350253, 0.6871777, 0.8705882, 0, 1, 1,
0.9287289, 0.6807297, 1.861426, 0.8784314, 0, 1, 1,
0.9340491, -1.699645, 3.292397, 0.8823529, 0, 1, 1,
0.9354545, 0.5075474, 1.34944, 0.8901961, 0, 1, 1,
0.939037, 1.202221, -0.3761229, 0.8941177, 0, 1, 1,
0.9396527, -0.3539963, 0.4117459, 0.9019608, 0, 1, 1,
0.9405115, 1.413784, 1.948861, 0.9098039, 0, 1, 1,
0.9427535, 0.161963, 1.234328, 0.9137255, 0, 1, 1,
0.9439241, -1.051485, 3.671867, 0.9215686, 0, 1, 1,
0.9457501, 1.244973, 1.638644, 0.9254902, 0, 1, 1,
0.9561887, -0.3721454, 2.468565, 0.9333333, 0, 1, 1,
0.9613137, 0.1506764, 2.259369, 0.9372549, 0, 1, 1,
0.9668741, 1.100906, 1.037607, 0.945098, 0, 1, 1,
0.9673868, -0.588513, 1.997608, 0.9490196, 0, 1, 1,
0.9682793, -0.3365832, 1.526884, 0.9568627, 0, 1, 1,
0.9696264, -0.3180097, 1.772192, 0.9607843, 0, 1, 1,
0.9706281, -0.0745018, 0.6842471, 0.9686275, 0, 1, 1,
0.9733737, 0.8861116, 0.702183, 0.972549, 0, 1, 1,
0.9752049, -0.1655381, 1.990757, 0.9803922, 0, 1, 1,
0.9759466, 0.03136254, 2.134643, 0.9843137, 0, 1, 1,
0.9770868, 0.1375308, 2.490702, 0.9921569, 0, 1, 1,
0.9778644, 1.012143, 1.09146, 0.9960784, 0, 1, 1,
0.9816557, 0.2331224, 1.004718, 1, 0, 0.9960784, 1,
0.9893088, 0.2332803, 0.5790036, 1, 0, 0.9882353, 1,
0.9952668, 0.4223477, 1.276592, 1, 0, 0.9843137, 1,
1.001776, -0.6885566, 1.389169, 1, 0, 0.9764706, 1,
1.002007, -0.4647627, 0.4880168, 1, 0, 0.972549, 1,
1.006424, -0.8037908, 1.006485, 1, 0, 0.9647059, 1,
1.008124, 0.08511306, 0.6493881, 1, 0, 0.9607843, 1,
1.008802, -0.6237639, 2.300512, 1, 0, 0.9529412, 1,
1.017012, 0.4591481, 2.926135, 1, 0, 0.9490196, 1,
1.020014, -1.502272, 2.807124, 1, 0, 0.9411765, 1,
1.02202, -0.2641917, 0.5571668, 1, 0, 0.9372549, 1,
1.031225, -0.732416, 3.885255, 1, 0, 0.9294118, 1,
1.031372, -0.2056534, 3.379113, 1, 0, 0.9254902, 1,
1.032389, -0.589177, 2.775347, 1, 0, 0.9176471, 1,
1.034365, -0.2150569, 2.725223, 1, 0, 0.9137255, 1,
1.035383, 0.2544277, 1.231021, 1, 0, 0.9058824, 1,
1.039947, 0.6484482, -0.8971694, 1, 0, 0.9019608, 1,
1.058805, 0.8348967, 0.2526931, 1, 0, 0.8941177, 1,
1.059132, 1.347089, 0.1103177, 1, 0, 0.8862745, 1,
1.070313, -1.445706, 2.220372, 1, 0, 0.8823529, 1,
1.071141, 1.137073, 2.544857, 1, 0, 0.8745098, 1,
1.074468, 1.921056, 0.6680682, 1, 0, 0.8705882, 1,
1.077864, 0.5306406, 1.188503, 1, 0, 0.8627451, 1,
1.078134, 1.7255, -0.1878075, 1, 0, 0.8588235, 1,
1.08206, 0.860059, -0.267233, 1, 0, 0.8509804, 1,
1.084574, -0.04965138, -0.2644124, 1, 0, 0.8470588, 1,
1.092206, 0.4372443, 2.054532, 1, 0, 0.8392157, 1,
1.100234, 0.4184095, 1.001875, 1, 0, 0.8352941, 1,
1.107066, 0.2922558, 2.644717, 1, 0, 0.827451, 1,
1.108189, -0.5581957, 2.442786, 1, 0, 0.8235294, 1,
1.109627, 0.6136203, 1.468443, 1, 0, 0.8156863, 1,
1.113484, 0.9976024, 1.080038, 1, 0, 0.8117647, 1,
1.12237, 1.129133, 2.155199, 1, 0, 0.8039216, 1,
1.124221, 0.09000005, 2.010794, 1, 0, 0.7960784, 1,
1.126059, -1.090617, 0.3713484, 1, 0, 0.7921569, 1,
1.127783, 0.4941755, 1.770381, 1, 0, 0.7843137, 1,
1.129654, -0.6724111, 3.617082, 1, 0, 0.7803922, 1,
1.133546, -1.92851, 2.49437, 1, 0, 0.772549, 1,
1.138236, -0.654103, 1.563919, 1, 0, 0.7686275, 1,
1.139935, 0.8519046, -0.1924911, 1, 0, 0.7607843, 1,
1.14291, -0.6491644, 1.482034, 1, 0, 0.7568628, 1,
1.149318, -0.7722874, 3.935988, 1, 0, 0.7490196, 1,
1.151778, 1.50945, 0.8855866, 1, 0, 0.7450981, 1,
1.153393, 0.3290895, 1.538492, 1, 0, 0.7372549, 1,
1.158084, 0.8137636, -0.5324582, 1, 0, 0.7333333, 1,
1.161161, -1.255587, 1.105253, 1, 0, 0.7254902, 1,
1.161296, -0.4664007, 1.558907, 1, 0, 0.7215686, 1,
1.171559, -0.002375951, 0.3957715, 1, 0, 0.7137255, 1,
1.19665, -0.4991543, 3.511165, 1, 0, 0.7098039, 1,
1.19882, -0.7012912, 2.92711, 1, 0, 0.7019608, 1,
1.211969, 0.9062999, 1.182963, 1, 0, 0.6941177, 1,
1.220069, -0.7434247, 2.82153, 1, 0, 0.6901961, 1,
1.220693, -0.5198265, 2.405218, 1, 0, 0.682353, 1,
1.223942, -0.4747333, 2.571642, 1, 0, 0.6784314, 1,
1.227098, -0.1191073, 0.7916399, 1, 0, 0.6705883, 1,
1.231558, 0.5774435, 0.7596328, 1, 0, 0.6666667, 1,
1.240488, -1.676932, 2.601933, 1, 0, 0.6588235, 1,
1.241191, 0.06114627, 2.136827, 1, 0, 0.654902, 1,
1.252929, -0.02534572, 1.360287, 1, 0, 0.6470588, 1,
1.259869, 1.037952, -0.1329108, 1, 0, 0.6431373, 1,
1.267821, -0.1962084, 1.534572, 1, 0, 0.6352941, 1,
1.26933, -0.05181815, 2.73235, 1, 0, 0.6313726, 1,
1.276675, 0.09401384, 3.159812, 1, 0, 0.6235294, 1,
1.280282, 0.4065993, 1.176819, 1, 0, 0.6196079, 1,
1.280652, 0.2882838, 0.1354225, 1, 0, 0.6117647, 1,
1.283904, 1.475225, -0.3390628, 1, 0, 0.6078432, 1,
1.291388, 0.8480965, 1.1408, 1, 0, 0.6, 1,
1.29726, -1.223003, 2.326884, 1, 0, 0.5921569, 1,
1.306181, -0.2256441, 1.404629, 1, 0, 0.5882353, 1,
1.32776, 1.549603, -1.450831, 1, 0, 0.5803922, 1,
1.339541, 0.444528, 0.8309439, 1, 0, 0.5764706, 1,
1.345029, -1.064401, 1.855366, 1, 0, 0.5686275, 1,
1.346734, 1.912938, -0.05960318, 1, 0, 0.5647059, 1,
1.357961, -0.8814884, 1.466036, 1, 0, 0.5568628, 1,
1.36105, 0.2584435, 1.88722, 1, 0, 0.5529412, 1,
1.362325, 0.7394816, -0.03598358, 1, 0, 0.5450981, 1,
1.362983, 0.8656343, 2.309552, 1, 0, 0.5411765, 1,
1.365251, -0.05672583, 4.168656, 1, 0, 0.5333334, 1,
1.407421, 1.953173, 1.001556, 1, 0, 0.5294118, 1,
1.413234, 0.4792204, 1.612126, 1, 0, 0.5215687, 1,
1.420029, 0.8184201, 1.091575, 1, 0, 0.5176471, 1,
1.420634, 0.3922029, 3.673924, 1, 0, 0.509804, 1,
1.453131, -0.05767713, 2.361098, 1, 0, 0.5058824, 1,
1.468756, -1.709481, 3.372837, 1, 0, 0.4980392, 1,
1.472033, -0.21006, 1.960251, 1, 0, 0.4901961, 1,
1.477961, 0.06465393, 2.02191, 1, 0, 0.4862745, 1,
1.481954, -0.3768827, 1.020729, 1, 0, 0.4784314, 1,
1.488403, 0.6229253, 0.9911914, 1, 0, 0.4745098, 1,
1.49841, -0.3205765, 3.305535, 1, 0, 0.4666667, 1,
1.501389, -0.5639002, 0.545431, 1, 0, 0.4627451, 1,
1.507569, -0.9686614, 0.4334594, 1, 0, 0.454902, 1,
1.511331, 0.8659495, 1.882253, 1, 0, 0.4509804, 1,
1.514588, 0.4652813, 1.131283, 1, 0, 0.4431373, 1,
1.521345, -0.5101528, 2.777462, 1, 0, 0.4392157, 1,
1.521825, 0.8299291, 0.7215797, 1, 0, 0.4313726, 1,
1.522044, -0.4964929, 2.619892, 1, 0, 0.427451, 1,
1.537809, -1.293053, 1.425971, 1, 0, 0.4196078, 1,
1.550441, -0.3429607, 1.145038, 1, 0, 0.4156863, 1,
1.55149, 0.2612067, 0.03930144, 1, 0, 0.4078431, 1,
1.55987, 0.781736, 0.8575186, 1, 0, 0.4039216, 1,
1.572902, -0.4547985, 1.92471, 1, 0, 0.3960784, 1,
1.576743, 0.150582, 0.1987573, 1, 0, 0.3882353, 1,
1.584016, -0.3364239, 1.339804, 1, 0, 0.3843137, 1,
1.584488, 0.4638255, 0.26166, 1, 0, 0.3764706, 1,
1.586457, -0.4775716, 1.999039, 1, 0, 0.372549, 1,
1.58964, -0.580515, 0.6619295, 1, 0, 0.3647059, 1,
1.600262, 0.5488545, 1.016322, 1, 0, 0.3607843, 1,
1.610282, -0.9229289, 1.316658, 1, 0, 0.3529412, 1,
1.626746, 0.1523605, 1.97668, 1, 0, 0.3490196, 1,
1.640092, 0.3493576, 3.152104, 1, 0, 0.3411765, 1,
1.656193, 0.8156422, 1.010014, 1, 0, 0.3372549, 1,
1.656565, -0.3557052, 2.138028, 1, 0, 0.3294118, 1,
1.661064, 1.403031, 2.11363, 1, 0, 0.3254902, 1,
1.672917, 1.761422, -1.003046, 1, 0, 0.3176471, 1,
1.679528, -0.6624056, 0.6074467, 1, 0, 0.3137255, 1,
1.684724, 0.06385882, 1.625819, 1, 0, 0.3058824, 1,
1.688465, 0.7760819, 1.972202, 1, 0, 0.2980392, 1,
1.690307, 0.8987482, 2.581398, 1, 0, 0.2941177, 1,
1.690835, -0.1303096, 4.438033, 1, 0, 0.2862745, 1,
1.717064, 1.284928, 2.044993, 1, 0, 0.282353, 1,
1.751791, 0.03586425, 2.850302, 1, 0, 0.2745098, 1,
1.7757, 1.76588, 1.433934, 1, 0, 0.2705882, 1,
1.781232, 1.250792, -0.5373672, 1, 0, 0.2627451, 1,
1.799383, -1.753969, 0.4289476, 1, 0, 0.2588235, 1,
1.810159, -0.5222754, 1.85609, 1, 0, 0.2509804, 1,
1.830441, 2.48617, 0.2159469, 1, 0, 0.2470588, 1,
1.864999, 0.2701967, 1.985849, 1, 0, 0.2392157, 1,
1.870703, -1.522269, 2.296623, 1, 0, 0.2352941, 1,
1.896636, -1.326053, 1.803089, 1, 0, 0.227451, 1,
1.903816, 0.5567704, 0.7273858, 1, 0, 0.2235294, 1,
1.904377, 0.3342369, 0.9474343, 1, 0, 0.2156863, 1,
1.956926, -1.876364, 1.251527, 1, 0, 0.2117647, 1,
1.959921, 0.482464, 1.17523, 1, 0, 0.2039216, 1,
1.981932, 1.920097, 0.2591853, 1, 0, 0.1960784, 1,
2.033335, 0.1132505, 0.7676855, 1, 0, 0.1921569, 1,
2.070805, 0.04837577, 0.0669241, 1, 0, 0.1843137, 1,
2.072477, -0.3613846, 2.162058, 1, 0, 0.1803922, 1,
2.08403, -1.589098, 0.7066714, 1, 0, 0.172549, 1,
2.08856, -0.7944528, 3.678303, 1, 0, 0.1686275, 1,
2.094388, -2.271283, 1.561307, 1, 0, 0.1607843, 1,
2.116958, -0.9317011, 1.471724, 1, 0, 0.1568628, 1,
2.130895, -0.5937331, 2.114366, 1, 0, 0.1490196, 1,
2.13868, 0.5778527, 2.245526, 1, 0, 0.145098, 1,
2.178521, 1.208715, 1.769219, 1, 0, 0.1372549, 1,
2.187573, 0.04003645, 2.518809, 1, 0, 0.1333333, 1,
2.228685, 0.9482222, 1.641656, 1, 0, 0.1254902, 1,
2.230136, 2.12057, 1.070142, 1, 0, 0.1215686, 1,
2.297331, -0.9341314, 2.344095, 1, 0, 0.1137255, 1,
2.336479, 1.250907, 1.344343, 1, 0, 0.1098039, 1,
2.372592, 0.7699483, -0.2934555, 1, 0, 0.1019608, 1,
2.37769, -0.9704269, 1.410379, 1, 0, 0.09411765, 1,
2.38387, 0.3384817, -0.06544153, 1, 0, 0.09019608, 1,
2.394045, -0.2552405, 1.97647, 1, 0, 0.08235294, 1,
2.515992, 2.053888, 1.237846, 1, 0, 0.07843138, 1,
2.630007, -0.2785367, 0.5659476, 1, 0, 0.07058824, 1,
2.633209, -0.1950122, 2.234339, 1, 0, 0.06666667, 1,
2.644507, -0.3976825, 0.6747307, 1, 0, 0.05882353, 1,
2.689523, -0.1840536, 2.914352, 1, 0, 0.05490196, 1,
2.69364, -0.5409461, 3.42502, 1, 0, 0.04705882, 1,
2.766419, -0.4188332, 2.511557, 1, 0, 0.04313726, 1,
2.879479, 0.8021364, 0.8957894, 1, 0, 0.03529412, 1,
3.09532, -0.04467963, -0.2414597, 1, 0, 0.03137255, 1,
3.235304, 0.09299711, 1.165214, 1, 0, 0.02352941, 1,
3.402318, -0.4686725, 1.812612, 1, 0, 0.01960784, 1,
3.497887, 0.6128631, 2.380398, 1, 0, 0.01176471, 1,
4.121448, -0.5946664, 0.1848523, 1, 0, 0.007843138, 1
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
0.4397725, -4.090545, -7.619295, 0, -0.5, 0.5, 0.5,
0.4397725, -4.090545, -7.619295, 1, -0.5, 0.5, 0.5,
0.4397725, -4.090545, -7.619295, 1, 1.5, 0.5, 0.5,
0.4397725, -4.090545, -7.619295, 0, 1.5, 0.5, 0.5
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
-4.48999, -0.1952587, -7.619295, 0, -0.5, 0.5, 0.5,
-4.48999, -0.1952587, -7.619295, 1, -0.5, 0.5, 0.5,
-4.48999, -0.1952587, -7.619295, 1, 1.5, 0.5, 0.5,
-4.48999, -0.1952587, -7.619295, 0, 1.5, 0.5, 0.5
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
-4.48999, -4.090545, 0.01556492, 0, -0.5, 0.5, 0.5,
-4.48999, -4.090545, 0.01556492, 1, -0.5, 0.5, 0.5,
-4.48999, -4.090545, 0.01556492, 1, 1.5, 0.5, 0.5,
-4.48999, -4.090545, 0.01556492, 0, 1.5, 0.5, 0.5
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
-2, -3.191633, -5.857404,
4, -3.191633, -5.857404,
-2, -3.191633, -5.857404,
-2, -3.341452, -6.151052,
0, -3.191633, -5.857404,
0, -3.341452, -6.151052,
2, -3.191633, -5.857404,
2, -3.341452, -6.151052,
4, -3.191633, -5.857404,
4, -3.341452, -6.151052
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
"0",
"2",
"4"
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
-2, -3.641089, -6.738349, 0, -0.5, 0.5, 0.5,
-2, -3.641089, -6.738349, 1, -0.5, 0.5, 0.5,
-2, -3.641089, -6.738349, 1, 1.5, 0.5, 0.5,
-2, -3.641089, -6.738349, 0, 1.5, 0.5, 0.5,
0, -3.641089, -6.738349, 0, -0.5, 0.5, 0.5,
0, -3.641089, -6.738349, 1, -0.5, 0.5, 0.5,
0, -3.641089, -6.738349, 1, 1.5, 0.5, 0.5,
0, -3.641089, -6.738349, 0, 1.5, 0.5, 0.5,
2, -3.641089, -6.738349, 0, -0.5, 0.5, 0.5,
2, -3.641089, -6.738349, 1, -0.5, 0.5, 0.5,
2, -3.641089, -6.738349, 1, 1.5, 0.5, 0.5,
2, -3.641089, -6.738349, 0, 1.5, 0.5, 0.5,
4, -3.641089, -6.738349, 0, -0.5, 0.5, 0.5,
4, -3.641089, -6.738349, 1, -0.5, 0.5, 0.5,
4, -3.641089, -6.738349, 1, 1.5, 0.5, 0.5,
4, -3.641089, -6.738349, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.352353, -3, -5.857404,
-3.352353, 2, -5.857404,
-3.352353, -3, -5.857404,
-3.541959, -3, -6.151052,
-3.352353, -2, -5.857404,
-3.541959, -2, -6.151052,
-3.352353, -1, -5.857404,
-3.541959, -1, -6.151052,
-3.352353, 0, -5.857404,
-3.541959, 0, -6.151052,
-3.352353, 1, -5.857404,
-3.541959, 1, -6.151052,
-3.352353, 2, -5.857404,
-3.541959, 2, -6.151052
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
-3.921172, -3, -6.738349, 0, -0.5, 0.5, 0.5,
-3.921172, -3, -6.738349, 1, -0.5, 0.5, 0.5,
-3.921172, -3, -6.738349, 1, 1.5, 0.5, 0.5,
-3.921172, -3, -6.738349, 0, 1.5, 0.5, 0.5,
-3.921172, -2, -6.738349, 0, -0.5, 0.5, 0.5,
-3.921172, -2, -6.738349, 1, -0.5, 0.5, 0.5,
-3.921172, -2, -6.738349, 1, 1.5, 0.5, 0.5,
-3.921172, -2, -6.738349, 0, 1.5, 0.5, 0.5,
-3.921172, -1, -6.738349, 0, -0.5, 0.5, 0.5,
-3.921172, -1, -6.738349, 1, -0.5, 0.5, 0.5,
-3.921172, -1, -6.738349, 1, 1.5, 0.5, 0.5,
-3.921172, -1, -6.738349, 0, 1.5, 0.5, 0.5,
-3.921172, 0, -6.738349, 0, -0.5, 0.5, 0.5,
-3.921172, 0, -6.738349, 1, -0.5, 0.5, 0.5,
-3.921172, 0, -6.738349, 1, 1.5, 0.5, 0.5,
-3.921172, 0, -6.738349, 0, 1.5, 0.5, 0.5,
-3.921172, 1, -6.738349, 0, -0.5, 0.5, 0.5,
-3.921172, 1, -6.738349, 1, -0.5, 0.5, 0.5,
-3.921172, 1, -6.738349, 1, 1.5, 0.5, 0.5,
-3.921172, 1, -6.738349, 0, 1.5, 0.5, 0.5,
-3.921172, 2, -6.738349, 0, -0.5, 0.5, 0.5,
-3.921172, 2, -6.738349, 1, -0.5, 0.5, 0.5,
-3.921172, 2, -6.738349, 1, 1.5, 0.5, 0.5,
-3.921172, 2, -6.738349, 0, 1.5, 0.5, 0.5
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
-3.352353, -3.191633, -4,
-3.352353, -3.191633, 4,
-3.352353, -3.191633, -4,
-3.541959, -3.341452, -4,
-3.352353, -3.191633, -2,
-3.541959, -3.341452, -2,
-3.352353, -3.191633, 0,
-3.541959, -3.341452, 0,
-3.352353, -3.191633, 2,
-3.541959, -3.341452, 2,
-3.352353, -3.191633, 4,
-3.541959, -3.341452, 4
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
-3.921172, -3.641089, -4, 0, -0.5, 0.5, 0.5,
-3.921172, -3.641089, -4, 1, -0.5, 0.5, 0.5,
-3.921172, -3.641089, -4, 1, 1.5, 0.5, 0.5,
-3.921172, -3.641089, -4, 0, 1.5, 0.5, 0.5,
-3.921172, -3.641089, -2, 0, -0.5, 0.5, 0.5,
-3.921172, -3.641089, -2, 1, -0.5, 0.5, 0.5,
-3.921172, -3.641089, -2, 1, 1.5, 0.5, 0.5,
-3.921172, -3.641089, -2, 0, 1.5, 0.5, 0.5,
-3.921172, -3.641089, 0, 0, -0.5, 0.5, 0.5,
-3.921172, -3.641089, 0, 1, -0.5, 0.5, 0.5,
-3.921172, -3.641089, 0, 1, 1.5, 0.5, 0.5,
-3.921172, -3.641089, 0, 0, 1.5, 0.5, 0.5,
-3.921172, -3.641089, 2, 0, -0.5, 0.5, 0.5,
-3.921172, -3.641089, 2, 1, -0.5, 0.5, 0.5,
-3.921172, -3.641089, 2, 1, 1.5, 0.5, 0.5,
-3.921172, -3.641089, 2, 0, 1.5, 0.5, 0.5,
-3.921172, -3.641089, 4, 0, -0.5, 0.5, 0.5,
-3.921172, -3.641089, 4, 1, -0.5, 0.5, 0.5,
-3.921172, -3.641089, 4, 1, 1.5, 0.5, 0.5,
-3.921172, -3.641089, 4, 0, 1.5, 0.5, 0.5
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
-3.352353, -3.191633, -5.857404,
-3.352353, 2.801116, -5.857404,
-3.352353, -3.191633, 5.888534,
-3.352353, 2.801116, 5.888534,
-3.352353, -3.191633, -5.857404,
-3.352353, -3.191633, 5.888534,
-3.352353, 2.801116, -5.857404,
-3.352353, 2.801116, 5.888534,
-3.352353, -3.191633, -5.857404,
4.231898, -3.191633, -5.857404,
-3.352353, -3.191633, 5.888534,
4.231898, -3.191633, 5.888534,
-3.352353, 2.801116, -5.857404,
4.231898, 2.801116, -5.857404,
-3.352353, 2.801116, 5.888534,
4.231898, 2.801116, 5.888534,
4.231898, -3.191633, -5.857404,
4.231898, 2.801116, -5.857404,
4.231898, -3.191633, 5.888534,
4.231898, 2.801116, 5.888534,
4.231898, -3.191633, -5.857404,
4.231898, -3.191633, 5.888534,
4.231898, 2.801116, -5.857404,
4.231898, 2.801116, 5.888534
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
var radius = 8.122843;
var distance = 36.13945;
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
mvMatrix.translate( -0.4397725, 0.1952587, -0.01556492 );
mvMatrix.scale( 1.158002, 1.465534, 0.7477118 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.13945);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
phosphorin-2-sulfide<-read.table("phosphorin-2-sulfide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosphorin-2-sulfide$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphorin' not found
```

```r
y<-phosphorin-2-sulfide$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphorin' not found
```

```r
z<-phosphorin-2-sulfide$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphorin' not found
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
-3.241903, 1.331875, -0.95562, 0, 0, 1, 1, 1,
-3.025175, 1.172327, -0.3598344, 1, 0, 0, 1, 1,
-2.999955, 0.2077601, -3.536907, 1, 0, 0, 1, 1,
-2.826811, 2.470919, -1.008677, 1, 0, 0, 1, 1,
-2.777129, -0.2031808, -1.158322, 1, 0, 0, 1, 1,
-2.64061, 0.292416, 0.2145412, 1, 0, 0, 1, 1,
-2.557657, 0.03341277, -2.922847, 0, 0, 0, 1, 1,
-2.513955, 0.3137105, -3.53914, 0, 0, 0, 1, 1,
-2.449191, -2.308026, -1.642209, 0, 0, 0, 1, 1,
-2.354537, -1.060335, -2.308892, 0, 0, 0, 1, 1,
-2.345556, -0.2419755, -1.296268, 0, 0, 0, 1, 1,
-2.334494, 0.7720205, -1.020735, 0, 0, 0, 1, 1,
-2.31529, 0.8141961, -2.141972, 0, 0, 0, 1, 1,
-2.296692, -1.951002, -1.186869, 1, 1, 1, 1, 1,
-2.232675, -0.3491455, -0.6646729, 1, 1, 1, 1, 1,
-2.194313, -0.3881287, -2.841976, 1, 1, 1, 1, 1,
-2.177675, 0.7231246, -1.557588, 1, 1, 1, 1, 1,
-2.172122, 0.04029442, -1.398388, 1, 1, 1, 1, 1,
-2.158983, -1.876804, -2.047716, 1, 1, 1, 1, 1,
-2.154737, 0.5930488, -0.1947127, 1, 1, 1, 1, 1,
-2.145584, 0.5791201, -1.077641, 1, 1, 1, 1, 1,
-2.144928, 1.502798, -0.1362056, 1, 1, 1, 1, 1,
-2.137848, -0.7488561, -2.278749, 1, 1, 1, 1, 1,
-2.128902, -1.434605, -1.056427, 1, 1, 1, 1, 1,
-2.102388, -0.6293655, -3.964952, 1, 1, 1, 1, 1,
-2.095192, -0.7360997, -0.7201758, 1, 1, 1, 1, 1,
-2.089813, 1.673862, -0.7409183, 1, 1, 1, 1, 1,
-2.014532, 0.8906569, -1.986903, 1, 1, 1, 1, 1,
-1.959559, 1.438754, 0.685131, 0, 0, 1, 1, 1,
-1.958943, 1.20027, -0.8822566, 1, 0, 0, 1, 1,
-1.949669, 0.5954414, -1.366159, 1, 0, 0, 1, 1,
-1.937524, 0.5967761, -2.309166, 1, 0, 0, 1, 1,
-1.906778, 0.2947873, -2.334006, 1, 0, 0, 1, 1,
-1.866994, 1.742657, -0.397409, 1, 0, 0, 1, 1,
-1.840625, 1.877063, 0.6095353, 0, 0, 0, 1, 1,
-1.828725, -0.6424966, -0.3887111, 0, 0, 0, 1, 1,
-1.822711, 0.6931394, -0.6491343, 0, 0, 0, 1, 1,
-1.816871, -0.02167946, -0.9065905, 0, 0, 0, 1, 1,
-1.816217, 0.2503512, -0.4561525, 0, 0, 0, 1, 1,
-1.808043, -0.01740759, -3.040272, 0, 0, 0, 1, 1,
-1.790041, 0.8333663, -1.302139, 0, 0, 0, 1, 1,
-1.788668, 1.253332, 0.1167583, 1, 1, 1, 1, 1,
-1.787825, 0.8571287, 0.03622642, 1, 1, 1, 1, 1,
-1.784089, 0.377712, -1.775344, 1, 1, 1, 1, 1,
-1.776464, -1.163581, -1.396945, 1, 1, 1, 1, 1,
-1.771074, 1.158443, -0.6797878, 1, 1, 1, 1, 1,
-1.767677, -0.3229516, -2.161675, 1, 1, 1, 1, 1,
-1.757747, -0.02347368, -1.058085, 1, 1, 1, 1, 1,
-1.740537, 0.8774375, -2.220362, 1, 1, 1, 1, 1,
-1.737248, 0.4644957, -1.498268, 1, 1, 1, 1, 1,
-1.730803, 1.459463, -0.404899, 1, 1, 1, 1, 1,
-1.716257, -1.498004, -2.787433, 1, 1, 1, 1, 1,
-1.715307, -0.8963244, -2.561397, 1, 1, 1, 1, 1,
-1.712182, -0.4910502, -2.290001, 1, 1, 1, 1, 1,
-1.676067, 0.2101976, -0.1118856, 1, 1, 1, 1, 1,
-1.672749, -1.383257, -3.267154, 1, 1, 1, 1, 1,
-1.671433, 0.4203816, -0.2419982, 0, 0, 1, 1, 1,
-1.669012, 0.02012927, -1.979395, 1, 0, 0, 1, 1,
-1.652719, -0.8257306, -1.105243, 1, 0, 0, 1, 1,
-1.637375, -1.108315, -1.806993, 1, 0, 0, 1, 1,
-1.593076, 0.7317904, -1.380969, 1, 0, 0, 1, 1,
-1.591151, -0.9625424, -2.429608, 1, 0, 0, 1, 1,
-1.580316, 0.1418656, -1.033777, 0, 0, 0, 1, 1,
-1.551727, -0.8708742, -3.276472, 0, 0, 0, 1, 1,
-1.550168, 1.909372, -1.400818, 0, 0, 0, 1, 1,
-1.546681, -1.591728, -3.475074, 0, 0, 0, 1, 1,
-1.540201, 0.9503546, -1.061557, 0, 0, 0, 1, 1,
-1.532836, 1.590742, -1.344831, 0, 0, 0, 1, 1,
-1.52809, -0.006497082, -1.285764, 0, 0, 0, 1, 1,
-1.522426, -0.5761096, -0.2808581, 1, 1, 1, 1, 1,
-1.511223, 0.3246257, -0.6425495, 1, 1, 1, 1, 1,
-1.499848, -0.8692284, -1.977975, 1, 1, 1, 1, 1,
-1.482045, 1.884293, -2.215172, 1, 1, 1, 1, 1,
-1.480036, 1.05393, -1.309749, 1, 1, 1, 1, 1,
-1.470689, 0.3770548, -1.435954, 1, 1, 1, 1, 1,
-1.462202, 0.5828171, -1.218476, 1, 1, 1, 1, 1,
-1.44996, 1.21997, -0.2971377, 1, 1, 1, 1, 1,
-1.443915, 0.4308915, -1.889313, 1, 1, 1, 1, 1,
-1.439189, 0.5062429, -3.080552, 1, 1, 1, 1, 1,
-1.434097, -0.7445233, -2.883113, 1, 1, 1, 1, 1,
-1.434092, 0.7783781, -1.18845, 1, 1, 1, 1, 1,
-1.432986, -0.62397, -3.160141, 1, 1, 1, 1, 1,
-1.413637, -0.1328036, -2.472608, 1, 1, 1, 1, 1,
-1.412289, 0.09267271, -1.421829, 1, 1, 1, 1, 1,
-1.408253, -0.4746457, -0.1227169, 0, 0, 1, 1, 1,
-1.405623, 0.7765861, -1.890132, 1, 0, 0, 1, 1,
-1.394255, 1.096669, 0.04838639, 1, 0, 0, 1, 1,
-1.38977, -1.342607, -2.99688, 1, 0, 0, 1, 1,
-1.386698, -0.1700479, -1.126464, 1, 0, 0, 1, 1,
-1.386322, 0.4834597, -1.528564, 1, 0, 0, 1, 1,
-1.369829, -1.231483, -1.6017, 0, 0, 0, 1, 1,
-1.360787, -0.05681845, -4.218602, 0, 0, 0, 1, 1,
-1.353078, -0.25104, -3.565916, 0, 0, 0, 1, 1,
-1.337195, 1.25611, 0.3069142, 0, 0, 0, 1, 1,
-1.331436, -1.077172, -3.727525, 0, 0, 0, 1, 1,
-1.326472, 0.7698435, -0.6077046, 0, 0, 0, 1, 1,
-1.321873, -1.025643, -1.100752, 0, 0, 0, 1, 1,
-1.320505, 1.834893, -2.736166, 1, 1, 1, 1, 1,
-1.320276, -0.516437, -1.759178, 1, 1, 1, 1, 1,
-1.315117, 0.8231356, -1.544802, 1, 1, 1, 1, 1,
-1.313185, -0.08725531, -2.446398, 1, 1, 1, 1, 1,
-1.311053, 0.5343435, -1.908726, 1, 1, 1, 1, 1,
-1.30723, 0.796456, -0.6153854, 1, 1, 1, 1, 1,
-1.303616, 0.5719714, -1.22061, 1, 1, 1, 1, 1,
-1.302787, -0.1564502, 0.01166278, 1, 1, 1, 1, 1,
-1.29329, -1.595512, -3.121796, 1, 1, 1, 1, 1,
-1.290046, 0.9827137, -0.4238875, 1, 1, 1, 1, 1,
-1.276487, 0.3100148, -3.672726, 1, 1, 1, 1, 1,
-1.267922, -1.935669, -2.990205, 1, 1, 1, 1, 1,
-1.265395, -0.9733344, -2.706801, 1, 1, 1, 1, 1,
-1.263211, -1.079222, -2.162033, 1, 1, 1, 1, 1,
-1.260995, -1.423156, -2.416881, 1, 1, 1, 1, 1,
-1.25515, 0.1582642, -1.018478, 0, 0, 1, 1, 1,
-1.255065, 0.6163177, -0.7267547, 1, 0, 0, 1, 1,
-1.248386, 2.095674, -1.449155, 1, 0, 0, 1, 1,
-1.238382, 0.8165653, -2.262787, 1, 0, 0, 1, 1,
-1.236075, 1.13442, -2.531497, 1, 0, 0, 1, 1,
-1.230169, -0.9652821, -2.149909, 1, 0, 0, 1, 1,
-1.227963, -1.15374, -1.481911, 0, 0, 0, 1, 1,
-1.227075, -0.5463114, -1.876361, 0, 0, 0, 1, 1,
-1.222746, 0.7810894, -0.2216131, 0, 0, 0, 1, 1,
-1.222268, 1.214889, -0.9566026, 0, 0, 0, 1, 1,
-1.212617, -1.306263, 0.3178611, 0, 0, 0, 1, 1,
-1.210085, 0.5797687, -0.2932813, 0, 0, 0, 1, 1,
-1.209822, -0.1006362, -1.961522, 0, 0, 0, 1, 1,
-1.2082, 1.33713, -0.7645182, 1, 1, 1, 1, 1,
-1.203056, 0.2996286, 0.3446325, 1, 1, 1, 1, 1,
-1.202745, -0.4181399, -1.872232, 1, 1, 1, 1, 1,
-1.20216, 0.9121771, -0.9897928, 1, 1, 1, 1, 1,
-1.194475, -0.01875748, -1.564824, 1, 1, 1, 1, 1,
-1.192929, -0.3485738, -2.633172, 1, 1, 1, 1, 1,
-1.184892, 0.04906007, -1.024541, 1, 1, 1, 1, 1,
-1.183559, -2.033043, -1.678721, 1, 1, 1, 1, 1,
-1.181936, 0.5102049, -0.1934199, 1, 1, 1, 1, 1,
-1.181419, 0.7192754, -1.42355, 1, 1, 1, 1, 1,
-1.178294, 0.6736078, -1.888771, 1, 1, 1, 1, 1,
-1.171366, -0.5006818, -3.517211, 1, 1, 1, 1, 1,
-1.157789, -2.431471, -1.236617, 1, 1, 1, 1, 1,
-1.155929, 0.6027814, -0.8627093, 1, 1, 1, 1, 1,
-1.150886, -1.054453, -0.4917994, 1, 1, 1, 1, 1,
-1.141346, 0.9522422, -0.6645312, 0, 0, 1, 1, 1,
-1.135936, 0.6272432, -1.914263, 1, 0, 0, 1, 1,
-1.128279, -0.4855438, -3.734387, 1, 0, 0, 1, 1,
-1.126192, -1.389342, -2.406255, 1, 0, 0, 1, 1,
-1.120169, 1.688579, -0.2965946, 1, 0, 0, 1, 1,
-1.113577, 0.00160753, -2.360933, 1, 0, 0, 1, 1,
-1.110851, 0.4846993, -1.790544, 0, 0, 0, 1, 1,
-1.110484, -1.039837, -2.258348, 0, 0, 0, 1, 1,
-1.078568, 0.3764736, -1.791607, 0, 0, 0, 1, 1,
-1.075776, 0.1265824, -1.837001, 0, 0, 0, 1, 1,
-1.071213, 0.3532771, -0.8997151, 0, 0, 0, 1, 1,
-1.069876, -1.176603, -0.5079742, 0, 0, 0, 1, 1,
-1.063236, -1.760138, -1.487319, 0, 0, 0, 1, 1,
-1.058832, 1.407261, -0.1053662, 1, 1, 1, 1, 1,
-1.053516, -0.3924548, -2.118581, 1, 1, 1, 1, 1,
-1.048789, -0.420229, -2.263127, 1, 1, 1, 1, 1,
-1.048574, -1.084044, -2.541072, 1, 1, 1, 1, 1,
-1.044597, 0.429888, -3.059209, 1, 1, 1, 1, 1,
-1.043635, 0.8943115, -0.07832818, 1, 1, 1, 1, 1,
-1.039017, 0.7304804, -0.7804599, 1, 1, 1, 1, 1,
-1.037936, -1.135607, -0.2770403, 1, 1, 1, 1, 1,
-1.037424, -1.295633, -3.94119, 1, 1, 1, 1, 1,
-1.028888, 2.127081, 0.4545613, 1, 1, 1, 1, 1,
-1.02756, 0.05894919, -2.464677, 1, 1, 1, 1, 1,
-1.025883, -1.242196, -4.128583, 1, 1, 1, 1, 1,
-1.023545, 0.129274, -2.294705, 1, 1, 1, 1, 1,
-1.018349, -1.776417, -3.501534, 1, 1, 1, 1, 1,
-1.017372, -0.4666597, -0.4619687, 1, 1, 1, 1, 1,
-1.010325, -1.189427, -2.173458, 0, 0, 1, 1, 1,
-1.009031, 0.7213531, -1.142338, 1, 0, 0, 1, 1,
-1.0038, 0.2428308, 0.125116, 1, 0, 0, 1, 1,
-1.000059, 0.01446912, -0.5920104, 1, 0, 0, 1, 1,
-0.9980263, -0.630899, -1.765785, 1, 0, 0, 1, 1,
-0.9971858, 2.586207, -0.6704333, 1, 0, 0, 1, 1,
-0.9939058, 0.8388527, -0.2959757, 0, 0, 0, 1, 1,
-0.9863245, -0.3938347, -0.9011121, 0, 0, 0, 1, 1,
-0.9829808, 0.4205145, 1.465973, 0, 0, 0, 1, 1,
-0.9827835, 1.175834, 0.8982057, 0, 0, 0, 1, 1,
-0.9796291, 0.5181279, -1.353245, 0, 0, 0, 1, 1,
-0.977102, -0.3681431, -1.839932, 0, 0, 0, 1, 1,
-0.9767329, 0.6492484, -0.3352282, 0, 0, 0, 1, 1,
-0.9675548, 0.03842895, 0.5776557, 1, 1, 1, 1, 1,
-0.9605801, 0.3903463, -2.402109, 1, 1, 1, 1, 1,
-0.9566404, -0.4454136, -0.7650211, 1, 1, 1, 1, 1,
-0.9554972, 0.6250967, -2.211208, 1, 1, 1, 1, 1,
-0.9538265, -0.951277, -2.056444, 1, 1, 1, 1, 1,
-0.9526524, -1.17257, -3.546484, 1, 1, 1, 1, 1,
-0.9474263, -0.5251527, -2.304614, 1, 1, 1, 1, 1,
-0.9464332, 0.5755693, -1.528847, 1, 1, 1, 1, 1,
-0.9416922, -2.399221, -1.393455, 1, 1, 1, 1, 1,
-0.9416257, -1.894298, -4.85693, 1, 1, 1, 1, 1,
-0.9408642, 0.9359567, -1.619293, 1, 1, 1, 1, 1,
-0.9390609, -0.3659865, -0.8918389, 1, 1, 1, 1, 1,
-0.9378463, 0.9254244, -0.2062812, 1, 1, 1, 1, 1,
-0.9352714, -0.4241667, -2.219287, 1, 1, 1, 1, 1,
-0.9251393, -0.05937451, -1.048607, 1, 1, 1, 1, 1,
-0.9243692, 1.017036, -0.9285553, 0, 0, 1, 1, 1,
-0.9239954, -1.379737, -4.720204, 1, 0, 0, 1, 1,
-0.9219494, -1.729057, -2.719659, 1, 0, 0, 1, 1,
-0.9206063, 0.4408769, -0.1779793, 1, 0, 0, 1, 1,
-0.9168898, 1.24014, 0.6367019, 1, 0, 0, 1, 1,
-0.9158323, 1.968826, -0.661815, 1, 0, 0, 1, 1,
-0.9116262, 1.719839, -0.3188318, 0, 0, 0, 1, 1,
-0.9085343, -0.1389068, -2.498793, 0, 0, 0, 1, 1,
-0.8993409, -0.6460323, -1.818303, 0, 0, 0, 1, 1,
-0.8968098, -0.6433163, -5.25258, 0, 0, 0, 1, 1,
-0.8961451, 1.559236, -1.820879, 0, 0, 0, 1, 1,
-0.8954738, -1.448512, -3.045755, 0, 0, 0, 1, 1,
-0.8948164, -1.600394, -4.622623, 0, 0, 0, 1, 1,
-0.8773558, 1.153849, 1.469414, 1, 1, 1, 1, 1,
-0.8702715, 0.9794894, 0.6349499, 1, 1, 1, 1, 1,
-0.8615876, 1.005454, -0.5687954, 1, 1, 1, 1, 1,
-0.8598735, 0.7757503, 0.03538086, 1, 1, 1, 1, 1,
-0.8590561, -0.5590146, -3.32866, 1, 1, 1, 1, 1,
-0.8569427, 1.287828, -1.325133, 1, 1, 1, 1, 1,
-0.8564959, 0.4566559, -2.717026, 1, 1, 1, 1, 1,
-0.8509829, -0.695679, -4.093745, 1, 1, 1, 1, 1,
-0.8423259, 1.697142, -0.3434023, 1, 1, 1, 1, 1,
-0.8371246, -0.9568285, -1.499319, 1, 1, 1, 1, 1,
-0.8343053, 0.4343488, -0.03659768, 1, 1, 1, 1, 1,
-0.8306408, -0.09219266, -1.04029, 1, 1, 1, 1, 1,
-0.8273851, 0.0008714902, -0.4230843, 1, 1, 1, 1, 1,
-0.8208981, 0.8639457, -0.5395746, 1, 1, 1, 1, 1,
-0.8163345, 1.291315, -0.6563047, 1, 1, 1, 1, 1,
-0.8132026, 0.004887607, -1.62861, 0, 0, 1, 1, 1,
-0.8067166, 0.4835241, -0.4315062, 1, 0, 0, 1, 1,
-0.8047955, -0.5870718, -1.409274, 1, 0, 0, 1, 1,
-0.8016539, 0.2988072, -2.444286, 1, 0, 0, 1, 1,
-0.7970561, 0.1383878, -0.08811352, 1, 0, 0, 1, 1,
-0.7923543, 0.1535615, -0.8800576, 1, 0, 0, 1, 1,
-0.7919311, 0.2323438, -1.350117, 0, 0, 0, 1, 1,
-0.7917185, 0.7549478, -1.152955, 0, 0, 0, 1, 1,
-0.785469, 1.796533, 0.3869083, 0, 0, 0, 1, 1,
-0.7835804, 1.059141, -0.3007041, 0, 0, 0, 1, 1,
-0.7802618, 0.521427, 0.02976634, 0, 0, 0, 1, 1,
-0.7640743, -0.008708534, -2.451964, 0, 0, 0, 1, 1,
-0.7573659, 0.8556498, 0.2287252, 0, 0, 0, 1, 1,
-0.7568549, 1.034584, -0.743821, 1, 1, 1, 1, 1,
-0.7493969, 1.250598, -0.844585, 1, 1, 1, 1, 1,
-0.7484841, 0.5641678, -1.697446, 1, 1, 1, 1, 1,
-0.7407122, -0.7626095, -3.252809, 1, 1, 1, 1, 1,
-0.7385995, 0.5223513, -1.169509, 1, 1, 1, 1, 1,
-0.7359959, -0.3179241, -1.687439, 1, 1, 1, 1, 1,
-0.7347599, 0.2678435, -1.219291, 1, 1, 1, 1, 1,
-0.7330603, -1.191652, -1.731292, 1, 1, 1, 1, 1,
-0.7304529, -0.7984754, -2.887787, 1, 1, 1, 1, 1,
-0.7153065, -0.1135916, -2.0032, 1, 1, 1, 1, 1,
-0.7151689, -1.424997, -3.891942, 1, 1, 1, 1, 1,
-0.7128576, 0.03509607, -2.114796, 1, 1, 1, 1, 1,
-0.7118453, 0.3241875, -1.811665, 1, 1, 1, 1, 1,
-0.706776, 0.7535498, -1.575861, 1, 1, 1, 1, 1,
-0.7039817, -0.6445016, -1.582857, 1, 1, 1, 1, 1,
-0.7004049, -0.05191219, -1.302594, 0, 0, 1, 1, 1,
-0.7000144, -0.5761676, -3.137774, 1, 0, 0, 1, 1,
-0.688795, 1.198863, 0.5669426, 1, 0, 0, 1, 1,
-0.6860179, 0.08300615, -1.625549, 1, 0, 0, 1, 1,
-0.6859233, 0.2615381, -0.9487376, 1, 0, 0, 1, 1,
-0.684184, -0.878887, -3.1674, 1, 0, 0, 1, 1,
-0.682151, -0.6254871, -1.245455, 0, 0, 0, 1, 1,
-0.6813598, 2.056244, -1.262605, 0, 0, 0, 1, 1,
-0.6787428, -0.8364466, -0.9633643, 0, 0, 0, 1, 1,
-0.6778135, -0.2038315, -2.522623, 0, 0, 0, 1, 1,
-0.6772991, 0.4210069, 0.1741776, 0, 0, 0, 1, 1,
-0.6664181, -1.009082, -2.870581, 0, 0, 0, 1, 1,
-0.6654154, -0.3924527, -1.425601, 0, 0, 0, 1, 1,
-0.665346, 0.5509002, -0.9266313, 1, 1, 1, 1, 1,
-0.6651552, -0.6758319, -2.70025, 1, 1, 1, 1, 1,
-0.6636794, -1.545637, -3.048959, 1, 1, 1, 1, 1,
-0.6626922, 1.036054, 1.805392, 1, 1, 1, 1, 1,
-0.6579046, 1.036272, -1.429629, 1, 1, 1, 1, 1,
-0.6576629, 0.7649745, -0.6694511, 1, 1, 1, 1, 1,
-0.6569024, -0.2969956, -2.75677, 1, 1, 1, 1, 1,
-0.6370113, -0.02088702, -2.030826, 1, 1, 1, 1, 1,
-0.6368588, -0.3001159, -1.626463, 1, 1, 1, 1, 1,
-0.6347749, 0.1060409, -2.91976, 1, 1, 1, 1, 1,
-0.6332092, 0.02258136, -1.575764, 1, 1, 1, 1, 1,
-0.6211338, -0.5272397, -2.76769, 1, 1, 1, 1, 1,
-0.6129295, 1.795013, -0.1652901, 1, 1, 1, 1, 1,
-0.6125571, 1.465696, -0.8221308, 1, 1, 1, 1, 1,
-0.611159, 0.3466783, -0.6375315, 1, 1, 1, 1, 1,
-0.6085483, 0.1333585, -1.802358, 0, 0, 1, 1, 1,
-0.602954, 0.351129, -2.472142, 1, 0, 0, 1, 1,
-0.6025243, 0.4386846, 1.408832, 1, 0, 0, 1, 1,
-0.6013166, -1.198827, -3.400586, 1, 0, 0, 1, 1,
-0.600963, 2.442206, 2.147995, 1, 0, 0, 1, 1,
-0.5993058, 0.5588537, 0.09017311, 1, 0, 0, 1, 1,
-0.5954918, -0.3145807, -2.849191, 0, 0, 0, 1, 1,
-0.5904414, -0.5704414, -3.624413, 0, 0, 0, 1, 1,
-0.5875852, -1.054156, -1.064852, 0, 0, 0, 1, 1,
-0.5860363, 0.9491056, -0.872898, 0, 0, 0, 1, 1,
-0.585507, 2.394089, 0.168132, 0, 0, 0, 1, 1,
-0.5807261, 1.480328, -1.549899, 0, 0, 0, 1, 1,
-0.5773104, 0.5340093, 0.7282029, 0, 0, 0, 1, 1,
-0.5768878, -1.817691, -3.083476, 1, 1, 1, 1, 1,
-0.5713346, 0.909013, -0.05645336, 1, 1, 1, 1, 1,
-0.5702504, 0.2281893, -1.887663, 1, 1, 1, 1, 1,
-0.5666245, 0.4619374, -0.9447497, 1, 1, 1, 1, 1,
-0.5665668, -1.574956, -3.875635, 1, 1, 1, 1, 1,
-0.5607984, -0.7405363, -2.51107, 1, 1, 1, 1, 1,
-0.5569794, 0.2659953, -0.6861056, 1, 1, 1, 1, 1,
-0.5566782, -0.1840626, -2.110025, 1, 1, 1, 1, 1,
-0.5508736, -0.1398386, -3.39208, 1, 1, 1, 1, 1,
-0.5440266, 0.9687801, -0.6999879, 1, 1, 1, 1, 1,
-0.5428371, 0.7115213, 0.2137109, 1, 1, 1, 1, 1,
-0.5383675, 1.567439, 0.8362613, 1, 1, 1, 1, 1,
-0.5375728, -0.636102, -4.521404, 1, 1, 1, 1, 1,
-0.5329332, -0.04231022, -0.4878597, 1, 1, 1, 1, 1,
-0.5327556, 0.8152883, -0.1220247, 1, 1, 1, 1, 1,
-0.5286368, 1.722214, 1.6723, 0, 0, 1, 1, 1,
-0.5282343, 0.7883074, 0.7921879, 1, 0, 0, 1, 1,
-0.5256251, -0.1297042, -3.234327, 1, 0, 0, 1, 1,
-0.5253703, -1.995973, -2.376983, 1, 0, 0, 1, 1,
-0.5188326, -0.8607383, -0.797726, 1, 0, 0, 1, 1,
-0.5176781, -0.2890366, -1.281567, 1, 0, 0, 1, 1,
-0.5175588, 1.220073, -0.07462965, 0, 0, 0, 1, 1,
-0.5152125, 0.9185347, 0.6188373, 0, 0, 0, 1, 1,
-0.5124514, 0.5835211, -1.015767, 0, 0, 0, 1, 1,
-0.5079229, 0.8318951, 0.581541, 0, 0, 0, 1, 1,
-0.5061141, -0.9171774, -3.693789, 0, 0, 0, 1, 1,
-0.4952175, 0.4986654, 0.1730471, 0, 0, 0, 1, 1,
-0.492438, -0.4064572, -2.231883, 0, 0, 0, 1, 1,
-0.4907812, -0.09154436, -3.371711, 1, 1, 1, 1, 1,
-0.4904371, -0.9651589, -2.760564, 1, 1, 1, 1, 1,
-0.4799311, -0.5088057, -3.855376, 1, 1, 1, 1, 1,
-0.4787986, -1.239303, -3.066478, 1, 1, 1, 1, 1,
-0.4785677, 1.896572, 2.395423, 1, 1, 1, 1, 1,
-0.4766077, -2.015649, -2.439443, 1, 1, 1, 1, 1,
-0.4691957, -0.4189838, -0.5596992, 1, 1, 1, 1, 1,
-0.4654958, -0.7397443, -1.406394, 1, 1, 1, 1, 1,
-0.4567606, -0.7768404, -1.369064, 1, 1, 1, 1, 1,
-0.451855, 0.9220847, -0.452929, 1, 1, 1, 1, 1,
-0.4469008, -0.03371057, -0.7318476, 1, 1, 1, 1, 1,
-0.4434123, -0.3681396, -0.8703038, 1, 1, 1, 1, 1,
-0.4383171, -0.7849372, -2.509835, 1, 1, 1, 1, 1,
-0.4275876, 1.899869, 0.4370915, 1, 1, 1, 1, 1,
-0.4254889, 1.185789, -0.9827185, 1, 1, 1, 1, 1,
-0.4251369, 0.05577604, -0.6971115, 0, 0, 1, 1, 1,
-0.4230739, -1.769208, -2.391546, 1, 0, 0, 1, 1,
-0.4163026, 0.3529562, -1.227086, 1, 0, 0, 1, 1,
-0.4118587, 1.189791, -2.020113, 1, 0, 0, 1, 1,
-0.4086063, -1.559583, -1.841645, 1, 0, 0, 1, 1,
-0.4084674, 1.791066, 1.481583, 1, 0, 0, 1, 1,
-0.4075142, -0.4155314, -2.506674, 0, 0, 0, 1, 1,
-0.4052227, 0.52014, -0.2079002, 0, 0, 0, 1, 1,
-0.4034805, -0.01970884, -0.6714889, 0, 0, 0, 1, 1,
-0.3999483, -0.5379814, -2.036941, 0, 0, 0, 1, 1,
-0.3937378, -0.1625308, -3.102731, 0, 0, 0, 1, 1,
-0.3903447, -0.554482, -3.145808, 0, 0, 0, 1, 1,
-0.3896622, 0.1376591, -0.3155628, 0, 0, 0, 1, 1,
-0.3894289, 0.6316646, -0.9246348, 1, 1, 1, 1, 1,
-0.3890312, 1.217037, 0.9258038, 1, 1, 1, 1, 1,
-0.384128, 0.3461925, -1.907272, 1, 1, 1, 1, 1,
-0.379079, -1.686502, -4.694781, 1, 1, 1, 1, 1,
-0.3780071, 2.713842, -0.6101179, 1, 1, 1, 1, 1,
-0.3767718, -0.8864748, -3.681745, 1, 1, 1, 1, 1,
-0.3734253, 0.2443177, -1.86267, 1, 1, 1, 1, 1,
-0.3608728, -0.6761974, -1.254857, 1, 1, 1, 1, 1,
-0.3527538, -0.4488688, -1.416286, 1, 1, 1, 1, 1,
-0.3517943, -0.6395344, -3.706724, 1, 1, 1, 1, 1,
-0.3507214, 1.094774, -0.2076055, 1, 1, 1, 1, 1,
-0.3450808, -0.7936997, -3.156743, 1, 1, 1, 1, 1,
-0.3442684, -0.06363872, -2.635802, 1, 1, 1, 1, 1,
-0.3433904, 1.843901, -0.7694436, 1, 1, 1, 1, 1,
-0.3386625, 0.2291753, -1.244856, 1, 1, 1, 1, 1,
-0.3224953, 1.219122, 0.2703256, 0, 0, 1, 1, 1,
-0.3210879, -0.946765, -2.99295, 1, 0, 0, 1, 1,
-0.3132568, 0.09385326, -2.611799, 1, 0, 0, 1, 1,
-0.3128095, -0.262718, -1.872375, 1, 0, 0, 1, 1,
-0.3101458, -1.239318, -3.054349, 1, 0, 0, 1, 1,
-0.3070498, -1.597568, -3.617754, 1, 0, 0, 1, 1,
-0.3052562, 1.177333, -0.9852266, 0, 0, 0, 1, 1,
-0.3022318, 1.995562, 0.4426907, 0, 0, 0, 1, 1,
-0.2910657, -0.5078514, -3.511636, 0, 0, 0, 1, 1,
-0.2896936, 1.59043, -0.5428408, 0, 0, 0, 1, 1,
-0.2866379, 1.595459, 0.7943779, 0, 0, 0, 1, 1,
-0.2852152, 0.5190599, -1.35456, 0, 0, 0, 1, 1,
-0.2776332, -0.09000717, -1.340258, 0, 0, 0, 1, 1,
-0.2760479, 1.295228, 0.7139866, 1, 1, 1, 1, 1,
-0.2741745, 0.496775, 0.7158331, 1, 1, 1, 1, 1,
-0.2715315, -1.096435, -2.348353, 1, 1, 1, 1, 1,
-0.2619753, 1.126426, -2.049607, 1, 1, 1, 1, 1,
-0.2605334, -1.118301, -3.162974, 1, 1, 1, 1, 1,
-0.2591076, 0.3091035, -1.25867, 1, 1, 1, 1, 1,
-0.2533168, 1.035969, 0.8319513, 1, 1, 1, 1, 1,
-0.2521422, 0.4458717, 0.671872, 1, 1, 1, 1, 1,
-0.247765, 0.216736, -0.1278189, 1, 1, 1, 1, 1,
-0.247585, -0.2606306, -2.684906, 1, 1, 1, 1, 1,
-0.2470326, -0.7219313, -0.3641438, 1, 1, 1, 1, 1,
-0.2454828, 0.4470621, -0.3524196, 1, 1, 1, 1, 1,
-0.2442926, -0.8493166, -4.169442, 1, 1, 1, 1, 1,
-0.2431332, 0.1425109, -0.287218, 1, 1, 1, 1, 1,
-0.2362279, 0.3561945, -1.796611, 1, 1, 1, 1, 1,
-0.2350426, -0.04889271, -0.252608, 0, 0, 1, 1, 1,
-0.2307949, -0.3079249, -3.966318, 1, 0, 0, 1, 1,
-0.2304279, 0.8981853, -0.09539019, 1, 0, 0, 1, 1,
-0.2275652, 1.262778, 0.88951, 1, 0, 0, 1, 1,
-0.2244451, 1.449811, -1.166898, 1, 0, 0, 1, 1,
-0.2233376, -0.3349597, -0.8823998, 1, 0, 0, 1, 1,
-0.2213231, 1.692485, -0.6541237, 0, 0, 0, 1, 1,
-0.2195658, 0.4033751, 1.082771, 0, 0, 0, 1, 1,
-0.21647, -0.4946268, -2.794266, 0, 0, 0, 1, 1,
-0.2159339, -2.384394, -3.304847, 0, 0, 0, 1, 1,
-0.2123845, -1.107625, -3.641432, 0, 0, 0, 1, 1,
-0.2096322, -0.1554893, -3.63696, 0, 0, 0, 1, 1,
-0.2079835, -0.499794, -3.466014, 0, 0, 0, 1, 1,
-0.2037131, 0.5593331, 0.1490717, 1, 1, 1, 1, 1,
-0.2032875, 0.7893103, -0.08634515, 1, 1, 1, 1, 1,
-0.2016892, -1.151514, -4.160621, 1, 1, 1, 1, 1,
-0.1974823, 1.098985, -0.2611184, 1, 1, 1, 1, 1,
-0.1973986, -0.9401257, -2.291018, 1, 1, 1, 1, 1,
-0.1962978, 1.56626, -1.731105, 1, 1, 1, 1, 1,
-0.1933176, 0.1759328, -0.5477161, 1, 1, 1, 1, 1,
-0.1908488, 1.897598, 0.211935, 1, 1, 1, 1, 1,
-0.188602, -1.841856, -2.491703, 1, 1, 1, 1, 1,
-0.1871694, -0.6943436, -4.132596, 1, 1, 1, 1, 1,
-0.1770153, 1.079926, 0.8067142, 1, 1, 1, 1, 1,
-0.1751927, -0.1491162, -2.464654, 1, 1, 1, 1, 1,
-0.1743944, 1.85945, -3.20184, 1, 1, 1, 1, 1,
-0.1736589, -0.5707202, -3.193813, 1, 1, 1, 1, 1,
-0.1729766, 0.622317, -1.340534, 1, 1, 1, 1, 1,
-0.1678954, 2.053847, -0.8269315, 0, 0, 1, 1, 1,
-0.1658655, -0.458468, -4.594578, 1, 0, 0, 1, 1,
-0.1615704, 0.9315239, 0.2053316, 1, 0, 0, 1, 1,
-0.1604504, -1.134209, -1.290109, 1, 0, 0, 1, 1,
-0.1602525, 1.292571, -0.8705368, 1, 0, 0, 1, 1,
-0.1596423, -0.4949121, -2.041978, 1, 0, 0, 1, 1,
-0.1589125, -0.423143, -3.019913, 0, 0, 0, 1, 1,
-0.154511, -0.3746805, -3.79178, 0, 0, 0, 1, 1,
-0.1536264, -1.222214, -3.927329, 0, 0, 0, 1, 1,
-0.1512584, 0.127159, -0.6641007, 0, 0, 0, 1, 1,
-0.1511953, -0.4087548, -2.921225, 0, 0, 0, 1, 1,
-0.1478477, 0.4446983, -0.5633315, 0, 0, 0, 1, 1,
-0.1474988, -1.186545, -3.792167, 0, 0, 0, 1, 1,
-0.1441384, -0.4090811, -3.807746, 1, 1, 1, 1, 1,
-0.1439398, 1.532964, -0.5404086, 1, 1, 1, 1, 1,
-0.1399896, -0.4832999, -4.252647, 1, 1, 1, 1, 1,
-0.1387701, -0.1115087, -0.6208929, 1, 1, 1, 1, 1,
-0.1367061, -0.7153534, -2.44754, 1, 1, 1, 1, 1,
-0.1328597, -0.004487976, -1.245941, 1, 1, 1, 1, 1,
-0.1282318, 1.822118, -1.161335, 1, 1, 1, 1, 1,
-0.1257508, 0.4277706, -1.895402, 1, 1, 1, 1, 1,
-0.1243938, 0.7251095, 0.6745492, 1, 1, 1, 1, 1,
-0.1204929, -1.335767, -5.207758, 1, 1, 1, 1, 1,
-0.1168513, -0.5752499, -2.943298, 1, 1, 1, 1, 1,
-0.1160869, -1.113671, -4.462887, 1, 1, 1, 1, 1,
-0.1102131, -1.307094, -3.046725, 1, 1, 1, 1, 1,
-0.1028143, -0.3007774, -3.678506, 1, 1, 1, 1, 1,
-0.1017017, -0.4725022, -1.475455, 1, 1, 1, 1, 1,
-0.1015525, -2.444754, -2.761382, 0, 0, 1, 1, 1,
-0.09823316, -0.4860894, -1.485616, 1, 0, 0, 1, 1,
-0.09574313, 0.5995225, -0.5217895, 1, 0, 0, 1, 1,
-0.09512367, 0.2640452, -0.4114329, 1, 0, 0, 1, 1,
-0.09393975, 0.9992721, -2.464354, 1, 0, 0, 1, 1,
-0.09333713, 0.4235999, 1.099177, 1, 0, 0, 1, 1,
-0.09136897, 0.4907258, -0.6800805, 0, 0, 0, 1, 1,
-0.08652771, 1.169924, -1.343198, 0, 0, 0, 1, 1,
-0.08631779, 0.09867574, -1.378517, 0, 0, 0, 1, 1,
-0.08531763, 1.246896, 1.267648, 0, 0, 0, 1, 1,
-0.08477006, -0.6648573, -1.804526, 0, 0, 0, 1, 1,
-0.08408322, -1.236816, -2.293928, 0, 0, 0, 1, 1,
-0.08248999, 0.3475681, 0.8837967, 0, 0, 0, 1, 1,
-0.07969514, -0.6144264, -3.566077, 1, 1, 1, 1, 1,
-0.07522079, -0.9767649, -2.557387, 1, 1, 1, 1, 1,
-0.07519609, -0.7874862, -5.686347, 1, 1, 1, 1, 1,
-0.0744393, -1.201354, -3.449324, 1, 1, 1, 1, 1,
-0.07421503, 0.6033954, -0.9968382, 1, 1, 1, 1, 1,
-0.07374591, 0.09630801, -0.556501, 1, 1, 1, 1, 1,
-0.07226681, -1.17052, -2.095167, 1, 1, 1, 1, 1,
-0.0714339, -0.474689, -3.426298, 1, 1, 1, 1, 1,
-0.06475208, -0.2880354, -2.627395, 1, 1, 1, 1, 1,
-0.0639082, -1.785719, -3.322858, 1, 1, 1, 1, 1,
-0.06329986, -0.1174392, -2.031911, 1, 1, 1, 1, 1,
-0.06065122, -0.9142421, -1.962571, 1, 1, 1, 1, 1,
-0.05963952, -0.6606176, -2.865931, 1, 1, 1, 1, 1,
-0.0582072, 0.8485871, 1.437004, 1, 1, 1, 1, 1,
-0.05761573, -0.2386912, -2.324131, 1, 1, 1, 1, 1,
-0.05744395, -0.06550057, -2.387996, 0, 0, 1, 1, 1,
-0.04898846, 1.809914, -0.241296, 1, 0, 0, 1, 1,
-0.04755927, 1.601803, -0.6213444, 1, 0, 0, 1, 1,
-0.04715604, 1.74697, 0.3159121, 1, 0, 0, 1, 1,
-0.04135272, 0.5457543, -0.6150296, 1, 0, 0, 1, 1,
-0.03968365, 0.1204334, 0.8168433, 1, 0, 0, 1, 1,
-0.03815272, -1.260077, -3.947165, 0, 0, 0, 1, 1,
-0.03659786, -0.9485491, -2.51234, 0, 0, 0, 1, 1,
-0.03419552, -1.067008, -5.510165, 0, 0, 0, 1, 1,
-0.02842834, 0.3710434, -0.9719374, 0, 0, 0, 1, 1,
-0.02719061, -1.106889, -4.419965, 0, 0, 0, 1, 1,
-0.02711285, -0.05779595, -3.245138, 0, 0, 0, 1, 1,
-0.02431048, 0.1417569, -0.2623103, 0, 0, 0, 1, 1,
-0.02246399, 0.3105215, -0.7224368, 1, 1, 1, 1, 1,
-0.02054873, 2.284851, 2.000675, 1, 1, 1, 1, 1,
-0.0169381, -1.41065, -2.480388, 1, 1, 1, 1, 1,
-0.01675684, -0.5104779, -3.770646, 1, 1, 1, 1, 1,
-0.01463517, 1.238361, 0.987231, 1, 1, 1, 1, 1,
-0.01399987, -0.2482601, -2.508631, 1, 1, 1, 1, 1,
-0.01344486, -0.3203692, -4.519002, 1, 1, 1, 1, 1,
-0.009997086, -1.713755, -3.590525, 1, 1, 1, 1, 1,
-0.009980937, -2.136513, -1.912235, 1, 1, 1, 1, 1,
-0.007565731, -0.1152071, -3.593203, 1, 1, 1, 1, 1,
-0.006162951, 1.422053, 0.0637446, 1, 1, 1, 1, 1,
0.001990202, -0.9491841, 2.242913, 1, 1, 1, 1, 1,
0.00274495, -0.7082834, 1.706708, 1, 1, 1, 1, 1,
0.003033178, 1.793386, -0.6123702, 1, 1, 1, 1, 1,
0.006399936, -0.9280897, 3.187354, 1, 1, 1, 1, 1,
0.008227197, 1.807847, -0.8685853, 0, 0, 1, 1, 1,
0.0150252, 1.336077, 0.6739839, 1, 0, 0, 1, 1,
0.01723909, 0.9171817, 0.9562796, 1, 0, 0, 1, 1,
0.02009734, 0.7900282, 0.00169021, 1, 0, 0, 1, 1,
0.02220535, 1.448778, 1.134274, 1, 0, 0, 1, 1,
0.02466989, -1.39245, 2.685977, 1, 0, 0, 1, 1,
0.02578622, 0.4581201, -1.589181, 0, 0, 0, 1, 1,
0.03962047, 1.142757, -2.136099, 0, 0, 0, 1, 1,
0.04478659, 0.1358919, 1.869243, 0, 0, 0, 1, 1,
0.04822478, 0.2699392, -0.4741641, 0, 0, 0, 1, 1,
0.04840323, 0.2157719, -0.5864779, 0, 0, 0, 1, 1,
0.0485489, 0.1590155, 0.09827304, 0, 0, 0, 1, 1,
0.05066998, 1.261185, -0.7273344, 0, 0, 0, 1, 1,
0.05129441, 1.18163, -1.961815, 1, 1, 1, 1, 1,
0.05278802, -0.9876093, 2.492295, 1, 1, 1, 1, 1,
0.05857298, 0.1216247, 0.1886424, 1, 1, 1, 1, 1,
0.06168298, -1.371194, 2.893787, 1, 1, 1, 1, 1,
0.06443799, -0.2122354, 1.683447, 1, 1, 1, 1, 1,
0.06903203, 0.4148143, -1.172985, 1, 1, 1, 1, 1,
0.06969301, -1.858119, 2.690516, 1, 1, 1, 1, 1,
0.07037584, -0.2589914, 3.860946, 1, 1, 1, 1, 1,
0.07174651, -0.4684439, 3.519516, 1, 1, 1, 1, 1,
0.07324038, -0.5299523, 3.002161, 1, 1, 1, 1, 1,
0.07366796, -1.688045, 2.925016, 1, 1, 1, 1, 1,
0.07560707, 0.8644612, 0.05665607, 1, 1, 1, 1, 1,
0.07646091, -0.004113209, 3.366147, 1, 1, 1, 1, 1,
0.07879435, -0.4846735, 0.7951592, 1, 1, 1, 1, 1,
0.08426511, 0.07157577, 2.045386, 1, 1, 1, 1, 1,
0.08485568, 0.6010056, 1.664864, 0, 0, 1, 1, 1,
0.08503013, -1.703321, 5.717476, 1, 0, 0, 1, 1,
0.08632414, 0.4472419, -0.7574532, 1, 0, 0, 1, 1,
0.08929099, -0.6774006, 2.173727, 1, 0, 0, 1, 1,
0.08997599, -0.9280217, 3.219861, 1, 0, 0, 1, 1,
0.0921325, -0.1688557, 4.31253, 1, 0, 0, 1, 1,
0.09237752, 0.8873878, 0.3381031, 0, 0, 0, 1, 1,
0.09732544, 2.216141, 0.4172419, 0, 0, 0, 1, 1,
0.09734616, 0.5007653, 0.27321, 0, 0, 0, 1, 1,
0.1006362, -0.4719666, 1.950509, 0, 0, 0, 1, 1,
0.1117131, 0.7807481, 2.071447, 0, 0, 0, 1, 1,
0.1124868, -0.308753, 3.628829, 0, 0, 0, 1, 1,
0.1128708, -0.07898247, 3.890049, 0, 0, 0, 1, 1,
0.1142418, 0.4876986, -0.8810158, 1, 1, 1, 1, 1,
0.1217251, 1.37019, 1.479314, 1, 1, 1, 1, 1,
0.1248903, 0.4867848, -0.3564507, 1, 1, 1, 1, 1,
0.1306818, 0.4654224, -0.5617126, 1, 1, 1, 1, 1,
0.1327409, 0.07719045, 1.527404, 1, 1, 1, 1, 1,
0.1329302, -0.1817544, 2.659104, 1, 1, 1, 1, 1,
0.1410201, 1.280748, 1.035204, 1, 1, 1, 1, 1,
0.1417638, -0.5617168, 3.190792, 1, 1, 1, 1, 1,
0.1424761, -0.2672928, 3.121591, 1, 1, 1, 1, 1,
0.1534284, -1.109879, 3.037458, 1, 1, 1, 1, 1,
0.1566465, 1.510618, -0.432816, 1, 1, 1, 1, 1,
0.1576382, -1.447343, 2.827244, 1, 1, 1, 1, 1,
0.1623325, 0.616967, 1.34126, 1, 1, 1, 1, 1,
0.1655141, 1.53589, 0.231341, 1, 1, 1, 1, 1,
0.1655347, -0.8091192, 3.808733, 1, 1, 1, 1, 1,
0.1657712, 0.5382186, -0.8288835, 0, 0, 1, 1, 1,
0.1697937, 0.6572568, -1.205325, 1, 0, 0, 1, 1,
0.1706032, 1.403549, -0.9308819, 1, 0, 0, 1, 1,
0.1743179, -0.8734039, 2.965743, 1, 0, 0, 1, 1,
0.1783035, 1.253776, -0.09169593, 1, 0, 0, 1, 1,
0.1820309, 0.9530095, -0.172311, 1, 0, 0, 1, 1,
0.1851455, -1.151741, 3.990083, 0, 0, 0, 1, 1,
0.1887427, -0.5614585, 3.602247, 0, 0, 0, 1, 1,
0.1892468, 1.641766, 0.5613949, 0, 0, 0, 1, 1,
0.1907991, -0.4477144, 5.259276, 0, 0, 0, 1, 1,
0.1913186, -0.02103567, 1.196527, 0, 0, 0, 1, 1,
0.1927757, -0.3293024, 3.231324, 0, 0, 0, 1, 1,
0.1948574, 1.185381, 0.4173647, 0, 0, 0, 1, 1,
0.1991524, 0.7963064, 0.6215072, 1, 1, 1, 1, 1,
0.2007408, -2.018821, 1.913192, 1, 1, 1, 1, 1,
0.2028831, 1.029273, 0.2884423, 1, 1, 1, 1, 1,
0.2039958, -1.129638, 1.726037, 1, 1, 1, 1, 1,
0.2055518, -0.077096, 1.702129, 1, 1, 1, 1, 1,
0.2059618, -0.5004805, 1.399352, 1, 1, 1, 1, 1,
0.2106637, 1.514233, 0.19897, 1, 1, 1, 1, 1,
0.2123547, -0.688776, 3.365356, 1, 1, 1, 1, 1,
0.2160852, -0.3482976, 4.147947, 1, 1, 1, 1, 1,
0.2188156, 1.392706, 0.2308495, 1, 1, 1, 1, 1,
0.2205104, -0.6925442, 1.9148, 1, 1, 1, 1, 1,
0.2208805, 1.060058, 0.7069467, 1, 1, 1, 1, 1,
0.2223781, 1.387433, 0.02798149, 1, 1, 1, 1, 1,
0.2262967, -0.5152531, 1.884904, 1, 1, 1, 1, 1,
0.2277985, 0.5076199, 0.5678667, 1, 1, 1, 1, 1,
0.2367007, 0.2601544, 1.414231, 0, 0, 1, 1, 1,
0.2371598, 0.2681992, 1.400563, 1, 0, 0, 1, 1,
0.2380746, -0.4556018, 1.812407, 1, 0, 0, 1, 1,
0.245648, -0.209214, 3.579192, 1, 0, 0, 1, 1,
0.25045, 1.749054, 0.4116077, 1, 0, 0, 1, 1,
0.2538461, -0.4517728, 1.480482, 1, 0, 0, 1, 1,
0.2549162, 0.3543766, -0.02452405, 0, 0, 0, 1, 1,
0.2559287, -1.445314, 2.696722, 0, 0, 0, 1, 1,
0.2559415, -0.04004899, 0.7830771, 0, 0, 0, 1, 1,
0.2566085, 0.470961, -0.3985072, 0, 0, 0, 1, 1,
0.259384, -2.228334, 4.049182, 0, 0, 0, 1, 1,
0.2600819, -0.91918, 3.830553, 0, 0, 0, 1, 1,
0.2609746, -0.3255487, 2.823948, 0, 0, 0, 1, 1,
0.263477, 0.4505575, 0.8688448, 1, 1, 1, 1, 1,
0.267562, -0.8097968, 4.412752, 1, 1, 1, 1, 1,
0.2683561, -0.0240031, 0.8452052, 1, 1, 1, 1, 1,
0.2691182, 0.664205, -0.9386687, 1, 1, 1, 1, 1,
0.2706729, 0.9476036, 1.707716, 1, 1, 1, 1, 1,
0.2724337, -2.048251, 3.349978, 1, 1, 1, 1, 1,
0.2732515, -1.953326, 3.32946, 1, 1, 1, 1, 1,
0.2745507, -0.3210668, 2.665292, 1, 1, 1, 1, 1,
0.275216, 1.312125, 0.828391, 1, 1, 1, 1, 1,
0.2772854, 0.4119265, 2.356138, 1, 1, 1, 1, 1,
0.2787598, -1.227299, 4.495419, 1, 1, 1, 1, 1,
0.2814007, 0.5383379, 0.8277819, 1, 1, 1, 1, 1,
0.283711, 0.4395139, -0.3736466, 1, 1, 1, 1, 1,
0.288861, -1.337952, 3.027717, 1, 1, 1, 1, 1,
0.2898088, 0.8870345, 2.166187, 1, 1, 1, 1, 1,
0.2945267, 1.395905, -0.9603907, 0, 0, 1, 1, 1,
0.2949595, 1.886844, 0.140681, 1, 0, 0, 1, 1,
0.295764, -0.6189378, 3.952607, 1, 0, 0, 1, 1,
0.2978139, 1.384429, -0.06121484, 1, 0, 0, 1, 1,
0.2980284, -1.66809, 2.54592, 1, 0, 0, 1, 1,
0.3047804, 0.2693524, 1.227976, 1, 0, 0, 1, 1,
0.3070386, -0.2479606, 3.032579, 0, 0, 0, 1, 1,
0.3072691, 1.672874, 0.2527208, 0, 0, 0, 1, 1,
0.3141071, 0.5696244, 0.932265, 0, 0, 0, 1, 1,
0.3152104, -0.4915424, 4.363765, 0, 0, 0, 1, 1,
0.3243312, 1.069017, 0.7186016, 0, 0, 0, 1, 1,
0.3249804, -1.328201, 2.731254, 0, 0, 0, 1, 1,
0.3296179, -0.01784522, 0.8818996, 0, 0, 0, 1, 1,
0.3304046, -0.8863525, 2.832169, 1, 1, 1, 1, 1,
0.3320866, -0.0939987, 0.09182449, 1, 1, 1, 1, 1,
0.3341433, 2.418921, 1.360361, 1, 1, 1, 1, 1,
0.3406728, 2.593246, -0.3549075, 1, 1, 1, 1, 1,
0.3435709, -1.988293, 1.834875, 1, 1, 1, 1, 1,
0.3469718, 0.05026466, -0.6221445, 1, 1, 1, 1, 1,
0.3489549, 0.8560177, 1.563495, 1, 1, 1, 1, 1,
0.3529688, -0.8102411, 3.070194, 1, 1, 1, 1, 1,
0.3540472, 0.1607024, 1.333602, 1, 1, 1, 1, 1,
0.3546866, 0.1777097, 1.625668, 1, 1, 1, 1, 1,
0.3590239, 0.727784, 0.9857995, 1, 1, 1, 1, 1,
0.3599058, 0.1105724, 0.3931979, 1, 1, 1, 1, 1,
0.3601961, -2.382853, 1.752812, 1, 1, 1, 1, 1,
0.3648408, 0.1740126, 0.8142669, 1, 1, 1, 1, 1,
0.3739262, 0.08575862, 0.7859306, 1, 1, 1, 1, 1,
0.3771911, 0.4270019, 0.4420215, 0, 0, 1, 1, 1,
0.3796068, -1.996734, 3.300931, 1, 0, 0, 1, 1,
0.379859, -0.7017538, 1.811098, 1, 0, 0, 1, 1,
0.3806504, -0.1881665, 1.851331, 1, 0, 0, 1, 1,
0.3822332, -0.07103506, 1.295788, 1, 0, 0, 1, 1,
0.3851724, 0.9156082, 0.4295673, 1, 0, 0, 1, 1,
0.3891369, 0.4105602, 0.1818718, 0, 0, 0, 1, 1,
0.391267, 0.3692057, 1.263692, 0, 0, 0, 1, 1,
0.3916112, -0.9558259, 4.477837, 0, 0, 0, 1, 1,
0.3988545, 0.04471072, 1.802675, 0, 0, 0, 1, 1,
0.3999953, 0.9576649, 1.162383, 0, 0, 0, 1, 1,
0.4002474, 1.757578, -0.8253942, 0, 0, 0, 1, 1,
0.40045, -1.161526, 1.414215, 0, 0, 0, 1, 1,
0.4033343, -1.010591, 2.536623, 1, 1, 1, 1, 1,
0.403362, 0.8672706, 2.003427, 1, 1, 1, 1, 1,
0.4105249, -0.9106533, 3.696858, 1, 1, 1, 1, 1,
0.421622, -1.202053, 2.405091, 1, 1, 1, 1, 1,
0.4242974, -2.059469, 3.99508, 1, 1, 1, 1, 1,
0.4249915, -0.6064624, 2.875673, 1, 1, 1, 1, 1,
0.4440055, 0.1535718, 3.850583, 1, 1, 1, 1, 1,
0.444646, 1.197962, -0.8044728, 1, 1, 1, 1, 1,
0.4454108, -0.4090508, 3.746902, 1, 1, 1, 1, 1,
0.4495723, 0.4515312, -0.3512169, 1, 1, 1, 1, 1,
0.4544893, -0.3160969, 1.597252, 1, 1, 1, 1, 1,
0.456809, -1.071899, 2.260387, 1, 1, 1, 1, 1,
0.4606888, -1.453024, 4.156675, 1, 1, 1, 1, 1,
0.466449, 0.5116766, 0.8331777, 1, 1, 1, 1, 1,
0.4695773, 0.1351042, 0.2754747, 1, 1, 1, 1, 1,
0.4703971, -1.655561, 1.686853, 0, 0, 1, 1, 1,
0.4782162, -0.5917006, 2.335614, 1, 0, 0, 1, 1,
0.4782924, -1.523713, 1.580145, 1, 0, 0, 1, 1,
0.4801334, 0.5653312, 0.4615167, 1, 0, 0, 1, 1,
0.4833402, 2.171748, 2.644579, 1, 0, 0, 1, 1,
0.4836952, 0.7302846, -0.9254001, 1, 0, 0, 1, 1,
0.4899002, 0.7304636, -0.1500887, 0, 0, 0, 1, 1,
0.4963279, 0.6065086, 1.7055, 0, 0, 0, 1, 1,
0.5047608, 0.4879167, 2.043628, 0, 0, 0, 1, 1,
0.5050397, 0.215663, 1.560351, 0, 0, 0, 1, 1,
0.5068725, 1.690234, 1.587526, 0, 0, 0, 1, 1,
0.5095882, -1.052269, 2.743469, 0, 0, 0, 1, 1,
0.5118701, 0.2857128, 0.7705672, 0, 0, 0, 1, 1,
0.5123481, 0.7874876, 0.3678323, 1, 1, 1, 1, 1,
0.512454, -0.1653269, 3.900044, 1, 1, 1, 1, 1,
0.5124949, -1.345863, 2.663476, 1, 1, 1, 1, 1,
0.5207609, -0.8278689, 3.68285, 1, 1, 1, 1, 1,
0.5208238, -2.083921, 3.13076, 1, 1, 1, 1, 1,
0.5223073, -1.102818, 4.231994, 1, 1, 1, 1, 1,
0.525734, 1.572037, 0.9988713, 1, 1, 1, 1, 1,
0.5264325, 1.707813, 1.334256, 1, 1, 1, 1, 1,
0.5316373, -0.04499043, 1.015047, 1, 1, 1, 1, 1,
0.5374281, 0.6098756, 1.54912, 1, 1, 1, 1, 1,
0.5382707, -0.9736103, 1.393191, 1, 1, 1, 1, 1,
0.5415824, 0.03646715, 1.555736, 1, 1, 1, 1, 1,
0.5425658, 0.3507561, -0.1932941, 1, 1, 1, 1, 1,
0.5441211, -0.4483925, 3.949888, 1, 1, 1, 1, 1,
0.55038, 1.881789, -0.1040142, 1, 1, 1, 1, 1,
0.5534392, 0.155409, 2.516212, 0, 0, 1, 1, 1,
0.558706, -1.086018, 2.144029, 1, 0, 0, 1, 1,
0.5590917, -0.2235018, -0.2642595, 1, 0, 0, 1, 1,
0.5619726, -0.4300992, 1.43397, 1, 0, 0, 1, 1,
0.5661252, -1.551118, 3.990057, 1, 0, 0, 1, 1,
0.5692617, 2.418504, 0.2722318, 1, 0, 0, 1, 1,
0.5751029, 0.4392466, 1.739422, 0, 0, 0, 1, 1,
0.5808259, -0.735396, 2.275277, 0, 0, 0, 1, 1,
0.5812335, -0.06102316, 1.227125, 0, 0, 0, 1, 1,
0.5825222, 2.310079, -1.426644, 0, 0, 0, 1, 1,
0.586544, 0.9012874, 0.1617566, 0, 0, 0, 1, 1,
0.5866128, -0.2559989, 1.71782, 0, 0, 0, 1, 1,
0.5873799, 0.3467425, 0.9398196, 0, 0, 0, 1, 1,
0.5883467, 2.637387, 0.3351778, 1, 1, 1, 1, 1,
0.5897534, -0.2515252, 2.074131, 1, 1, 1, 1, 1,
0.5911856, 0.655582, 1.149678, 1, 1, 1, 1, 1,
0.5941423, 1.311134, -0.5700489, 1, 1, 1, 1, 1,
0.5947317, -0.6139706, 0.8838539, 1, 1, 1, 1, 1,
0.6010064, -0.8909823, 2.827836, 1, 1, 1, 1, 1,
0.6061593, -0.166584, 2.979253, 1, 1, 1, 1, 1,
0.6063128, 0.2897705, 2.057747, 1, 1, 1, 1, 1,
0.6063895, -0.4720707, 2.674127, 1, 1, 1, 1, 1,
0.610539, -0.8934537, 2.814099, 1, 1, 1, 1, 1,
0.6132887, -0.2844762, 3.624508, 1, 1, 1, 1, 1,
0.6155845, 0.3756827, 0.5771999, 1, 1, 1, 1, 1,
0.6196877, 1.081504, -0.7820588, 1, 1, 1, 1, 1,
0.6252375, 0.6513102, -0.6868044, 1, 1, 1, 1, 1,
0.6322007, 0.6460508, 1.508376, 1, 1, 1, 1, 1,
0.6375933, 0.7386721, 2.139222, 0, 0, 1, 1, 1,
0.638066, 0.8182604, -0.3408976, 1, 0, 0, 1, 1,
0.6394294, 0.04069795, 0.260459, 1, 0, 0, 1, 1,
0.6406924, 0.6367036, 0.5770266, 1, 0, 0, 1, 1,
0.6461754, -1.28761, 4.088732, 1, 0, 0, 1, 1,
0.6479111, -0.01927685, 1.05696, 1, 0, 0, 1, 1,
0.6484389, -0.6772267, 3.086406, 0, 0, 0, 1, 1,
0.650204, -0.1758067, 1.624133, 0, 0, 0, 1, 1,
0.6504107, 0.733259, 0.2747149, 0, 0, 0, 1, 1,
0.6548361, -0.39694, 3.232364, 0, 0, 0, 1, 1,
0.6573041, -0.8335458, 3.816156, 0, 0, 0, 1, 1,
0.6630027, -0.810952, 3.827163, 0, 0, 0, 1, 1,
0.6646298, 0.5104068, 1.07754, 0, 0, 0, 1, 1,
0.6685405, -1.660547, 5.077872, 1, 1, 1, 1, 1,
0.6695564, 1.179609, -0.05103587, 1, 1, 1, 1, 1,
0.67645, 0.3352549, -0.1530482, 1, 1, 1, 1, 1,
0.6781807, 0.2518661, 1.559657, 1, 1, 1, 1, 1,
0.6796567, -0.5315493, 2.0177, 1, 1, 1, 1, 1,
0.68132, -1.110023, 2.533908, 1, 1, 1, 1, 1,
0.6834338, 0.7049719, -0.9821921, 1, 1, 1, 1, 1,
0.6936988, -0.4532878, 1.290614, 1, 1, 1, 1, 1,
0.6992896, 0.6814682, 0.7274104, 1, 1, 1, 1, 1,
0.7038957, -1.263124, 1.806565, 1, 1, 1, 1, 1,
0.7061666, -1.641137, 0.5654336, 1, 1, 1, 1, 1,
0.7092196, 0.5692703, 0.1318456, 1, 1, 1, 1, 1,
0.7201941, 0.6863831, 1.141521, 1, 1, 1, 1, 1,
0.7268271, 0.3384488, 1.181822, 1, 1, 1, 1, 1,
0.7278368, 0.6862003, 2.018821, 1, 1, 1, 1, 1,
0.7313268, -1.979021, 2.240821, 0, 0, 1, 1, 1,
0.7322399, -1.132279, 2.653817, 1, 0, 0, 1, 1,
0.7331527, -0.8100536, 2.956617, 1, 0, 0, 1, 1,
0.7399074, -0.6852242, 2.541706, 1, 0, 0, 1, 1,
0.7412408, 0.9076951, 0.5858791, 1, 0, 0, 1, 1,
0.7413846, -3.10436, 3.127692, 1, 0, 0, 1, 1,
0.7422603, -1.090644, 0.9750131, 0, 0, 0, 1, 1,
0.7426431, 0.2532748, 3.162005, 0, 0, 0, 1, 1,
0.7499988, -0.2054304, 2.477274, 0, 0, 0, 1, 1,
0.7513408, 0.4871417, 1.591171, 0, 0, 0, 1, 1,
0.7578661, -1.708403, 2.312742, 0, 0, 0, 1, 1,
0.7602677, 0.6361402, 3.404194, 0, 0, 0, 1, 1,
0.7650911, 0.6540256, 0.5909626, 0, 0, 0, 1, 1,
0.7723104, 1.612147, 1.461497, 1, 1, 1, 1, 1,
0.7807566, 0.887724, 1.147162, 1, 1, 1, 1, 1,
0.7840706, -1.667635, 1.989514, 1, 1, 1, 1, 1,
0.7854398, 0.5387363, 0.9936861, 1, 1, 1, 1, 1,
0.7863671, 0.1458631, 1.015992, 1, 1, 1, 1, 1,
0.7891188, -1.15128, 2.2447, 1, 1, 1, 1, 1,
0.7953368, 1.059258, -0.1519029, 1, 1, 1, 1, 1,
0.7991013, 1.922983, 1.801485, 1, 1, 1, 1, 1,
0.8006052, 1.422156, 2.318536, 1, 1, 1, 1, 1,
0.8050143, -1.425966, 1.968978, 1, 1, 1, 1, 1,
0.8085067, 0.04656176, 3.256251, 1, 1, 1, 1, 1,
0.8124219, 1.088976, 0.1886722, 1, 1, 1, 1, 1,
0.8152595, 0.835174, -2.468584, 1, 1, 1, 1, 1,
0.8174171, 0.7213866, 1.884585, 1, 1, 1, 1, 1,
0.8268039, 0.009444582, 1.795223, 1, 1, 1, 1, 1,
0.8268628, 0.6707222, -0.07361089, 0, 0, 1, 1, 1,
0.8299537, 0.4401277, 0.234836, 1, 0, 0, 1, 1,
0.8302537, -1.236308, 2.17612, 1, 0, 0, 1, 1,
0.8318194, 0.278808, 1.428948, 1, 0, 0, 1, 1,
0.838301, -0.3473548, 2.597845, 1, 0, 0, 1, 1,
0.8431619, 1.24614, 2.57912, 1, 0, 0, 1, 1,
0.8452576, -0.1140817, -0.8872551, 0, 0, 0, 1, 1,
0.8520354, -0.4070486, 2.264115, 0, 0, 0, 1, 1,
0.8543286, 2.189922, 0.3548035, 0, 0, 0, 1, 1,
0.8555164, -0.4016342, 1.921779, 0, 0, 0, 1, 1,
0.8583853, -0.02021984, 1.882626, 0, 0, 0, 1, 1,
0.8609647, 0.3600336, 1.769133, 0, 0, 0, 1, 1,
0.8661568, 0.5235327, -0.1702304, 0, 0, 0, 1, 1,
0.8721027, -2.091078, 4.34431, 1, 1, 1, 1, 1,
0.8736621, 0.3013241, 1.55512, 1, 1, 1, 1, 1,
0.8783234, -1.046075, 3.73969, 1, 1, 1, 1, 1,
0.8809091, -0.377104, 1.547669, 1, 1, 1, 1, 1,
0.8809829, -0.07654981, -0.1048237, 1, 1, 1, 1, 1,
0.8849955, 0.6925586, 0.4847395, 1, 1, 1, 1, 1,
0.8854301, -1.24628, 2.832027, 1, 1, 1, 1, 1,
0.8884903, 1.297631, 1.42971, 1, 1, 1, 1, 1,
0.8924243, 0.3639094, 1.69861, 1, 1, 1, 1, 1,
0.8925222, -0.4746144, 1.900599, 1, 1, 1, 1, 1,
0.8943769, -0.332384, 1.781998, 1, 1, 1, 1, 1,
0.9014028, -1.563882, 2.123687, 1, 1, 1, 1, 1,
0.9023867, 0.64273, 2.433857, 1, 1, 1, 1, 1,
0.9035528, -0.7756487, 2.289443, 1, 1, 1, 1, 1,
0.9077776, 1.104296, 0.6754666, 1, 1, 1, 1, 1,
0.9198064, 0.8350253, 0.6871777, 0, 0, 1, 1, 1,
0.9287289, 0.6807297, 1.861426, 1, 0, 0, 1, 1,
0.9340491, -1.699645, 3.292397, 1, 0, 0, 1, 1,
0.9354545, 0.5075474, 1.34944, 1, 0, 0, 1, 1,
0.939037, 1.202221, -0.3761229, 1, 0, 0, 1, 1,
0.9396527, -0.3539963, 0.4117459, 1, 0, 0, 1, 1,
0.9405115, 1.413784, 1.948861, 0, 0, 0, 1, 1,
0.9427535, 0.161963, 1.234328, 0, 0, 0, 1, 1,
0.9439241, -1.051485, 3.671867, 0, 0, 0, 1, 1,
0.9457501, 1.244973, 1.638644, 0, 0, 0, 1, 1,
0.9561887, -0.3721454, 2.468565, 0, 0, 0, 1, 1,
0.9613137, 0.1506764, 2.259369, 0, 0, 0, 1, 1,
0.9668741, 1.100906, 1.037607, 0, 0, 0, 1, 1,
0.9673868, -0.588513, 1.997608, 1, 1, 1, 1, 1,
0.9682793, -0.3365832, 1.526884, 1, 1, 1, 1, 1,
0.9696264, -0.3180097, 1.772192, 1, 1, 1, 1, 1,
0.9706281, -0.0745018, 0.6842471, 1, 1, 1, 1, 1,
0.9733737, 0.8861116, 0.702183, 1, 1, 1, 1, 1,
0.9752049, -0.1655381, 1.990757, 1, 1, 1, 1, 1,
0.9759466, 0.03136254, 2.134643, 1, 1, 1, 1, 1,
0.9770868, 0.1375308, 2.490702, 1, 1, 1, 1, 1,
0.9778644, 1.012143, 1.09146, 1, 1, 1, 1, 1,
0.9816557, 0.2331224, 1.004718, 1, 1, 1, 1, 1,
0.9893088, 0.2332803, 0.5790036, 1, 1, 1, 1, 1,
0.9952668, 0.4223477, 1.276592, 1, 1, 1, 1, 1,
1.001776, -0.6885566, 1.389169, 1, 1, 1, 1, 1,
1.002007, -0.4647627, 0.4880168, 1, 1, 1, 1, 1,
1.006424, -0.8037908, 1.006485, 1, 1, 1, 1, 1,
1.008124, 0.08511306, 0.6493881, 0, 0, 1, 1, 1,
1.008802, -0.6237639, 2.300512, 1, 0, 0, 1, 1,
1.017012, 0.4591481, 2.926135, 1, 0, 0, 1, 1,
1.020014, -1.502272, 2.807124, 1, 0, 0, 1, 1,
1.02202, -0.2641917, 0.5571668, 1, 0, 0, 1, 1,
1.031225, -0.732416, 3.885255, 1, 0, 0, 1, 1,
1.031372, -0.2056534, 3.379113, 0, 0, 0, 1, 1,
1.032389, -0.589177, 2.775347, 0, 0, 0, 1, 1,
1.034365, -0.2150569, 2.725223, 0, 0, 0, 1, 1,
1.035383, 0.2544277, 1.231021, 0, 0, 0, 1, 1,
1.039947, 0.6484482, -0.8971694, 0, 0, 0, 1, 1,
1.058805, 0.8348967, 0.2526931, 0, 0, 0, 1, 1,
1.059132, 1.347089, 0.1103177, 0, 0, 0, 1, 1,
1.070313, -1.445706, 2.220372, 1, 1, 1, 1, 1,
1.071141, 1.137073, 2.544857, 1, 1, 1, 1, 1,
1.074468, 1.921056, 0.6680682, 1, 1, 1, 1, 1,
1.077864, 0.5306406, 1.188503, 1, 1, 1, 1, 1,
1.078134, 1.7255, -0.1878075, 1, 1, 1, 1, 1,
1.08206, 0.860059, -0.267233, 1, 1, 1, 1, 1,
1.084574, -0.04965138, -0.2644124, 1, 1, 1, 1, 1,
1.092206, 0.4372443, 2.054532, 1, 1, 1, 1, 1,
1.100234, 0.4184095, 1.001875, 1, 1, 1, 1, 1,
1.107066, 0.2922558, 2.644717, 1, 1, 1, 1, 1,
1.108189, -0.5581957, 2.442786, 1, 1, 1, 1, 1,
1.109627, 0.6136203, 1.468443, 1, 1, 1, 1, 1,
1.113484, 0.9976024, 1.080038, 1, 1, 1, 1, 1,
1.12237, 1.129133, 2.155199, 1, 1, 1, 1, 1,
1.124221, 0.09000005, 2.010794, 1, 1, 1, 1, 1,
1.126059, -1.090617, 0.3713484, 0, 0, 1, 1, 1,
1.127783, 0.4941755, 1.770381, 1, 0, 0, 1, 1,
1.129654, -0.6724111, 3.617082, 1, 0, 0, 1, 1,
1.133546, -1.92851, 2.49437, 1, 0, 0, 1, 1,
1.138236, -0.654103, 1.563919, 1, 0, 0, 1, 1,
1.139935, 0.8519046, -0.1924911, 1, 0, 0, 1, 1,
1.14291, -0.6491644, 1.482034, 0, 0, 0, 1, 1,
1.149318, -0.7722874, 3.935988, 0, 0, 0, 1, 1,
1.151778, 1.50945, 0.8855866, 0, 0, 0, 1, 1,
1.153393, 0.3290895, 1.538492, 0, 0, 0, 1, 1,
1.158084, 0.8137636, -0.5324582, 0, 0, 0, 1, 1,
1.161161, -1.255587, 1.105253, 0, 0, 0, 1, 1,
1.161296, -0.4664007, 1.558907, 0, 0, 0, 1, 1,
1.171559, -0.002375951, 0.3957715, 1, 1, 1, 1, 1,
1.19665, -0.4991543, 3.511165, 1, 1, 1, 1, 1,
1.19882, -0.7012912, 2.92711, 1, 1, 1, 1, 1,
1.211969, 0.9062999, 1.182963, 1, 1, 1, 1, 1,
1.220069, -0.7434247, 2.82153, 1, 1, 1, 1, 1,
1.220693, -0.5198265, 2.405218, 1, 1, 1, 1, 1,
1.223942, -0.4747333, 2.571642, 1, 1, 1, 1, 1,
1.227098, -0.1191073, 0.7916399, 1, 1, 1, 1, 1,
1.231558, 0.5774435, 0.7596328, 1, 1, 1, 1, 1,
1.240488, -1.676932, 2.601933, 1, 1, 1, 1, 1,
1.241191, 0.06114627, 2.136827, 1, 1, 1, 1, 1,
1.252929, -0.02534572, 1.360287, 1, 1, 1, 1, 1,
1.259869, 1.037952, -0.1329108, 1, 1, 1, 1, 1,
1.267821, -0.1962084, 1.534572, 1, 1, 1, 1, 1,
1.26933, -0.05181815, 2.73235, 1, 1, 1, 1, 1,
1.276675, 0.09401384, 3.159812, 0, 0, 1, 1, 1,
1.280282, 0.4065993, 1.176819, 1, 0, 0, 1, 1,
1.280652, 0.2882838, 0.1354225, 1, 0, 0, 1, 1,
1.283904, 1.475225, -0.3390628, 1, 0, 0, 1, 1,
1.291388, 0.8480965, 1.1408, 1, 0, 0, 1, 1,
1.29726, -1.223003, 2.326884, 1, 0, 0, 1, 1,
1.306181, -0.2256441, 1.404629, 0, 0, 0, 1, 1,
1.32776, 1.549603, -1.450831, 0, 0, 0, 1, 1,
1.339541, 0.444528, 0.8309439, 0, 0, 0, 1, 1,
1.345029, -1.064401, 1.855366, 0, 0, 0, 1, 1,
1.346734, 1.912938, -0.05960318, 0, 0, 0, 1, 1,
1.357961, -0.8814884, 1.466036, 0, 0, 0, 1, 1,
1.36105, 0.2584435, 1.88722, 0, 0, 0, 1, 1,
1.362325, 0.7394816, -0.03598358, 1, 1, 1, 1, 1,
1.362983, 0.8656343, 2.309552, 1, 1, 1, 1, 1,
1.365251, -0.05672583, 4.168656, 1, 1, 1, 1, 1,
1.407421, 1.953173, 1.001556, 1, 1, 1, 1, 1,
1.413234, 0.4792204, 1.612126, 1, 1, 1, 1, 1,
1.420029, 0.8184201, 1.091575, 1, 1, 1, 1, 1,
1.420634, 0.3922029, 3.673924, 1, 1, 1, 1, 1,
1.453131, -0.05767713, 2.361098, 1, 1, 1, 1, 1,
1.468756, -1.709481, 3.372837, 1, 1, 1, 1, 1,
1.472033, -0.21006, 1.960251, 1, 1, 1, 1, 1,
1.477961, 0.06465393, 2.02191, 1, 1, 1, 1, 1,
1.481954, -0.3768827, 1.020729, 1, 1, 1, 1, 1,
1.488403, 0.6229253, 0.9911914, 1, 1, 1, 1, 1,
1.49841, -0.3205765, 3.305535, 1, 1, 1, 1, 1,
1.501389, -0.5639002, 0.545431, 1, 1, 1, 1, 1,
1.507569, -0.9686614, 0.4334594, 0, 0, 1, 1, 1,
1.511331, 0.8659495, 1.882253, 1, 0, 0, 1, 1,
1.514588, 0.4652813, 1.131283, 1, 0, 0, 1, 1,
1.521345, -0.5101528, 2.777462, 1, 0, 0, 1, 1,
1.521825, 0.8299291, 0.7215797, 1, 0, 0, 1, 1,
1.522044, -0.4964929, 2.619892, 1, 0, 0, 1, 1,
1.537809, -1.293053, 1.425971, 0, 0, 0, 1, 1,
1.550441, -0.3429607, 1.145038, 0, 0, 0, 1, 1,
1.55149, 0.2612067, 0.03930144, 0, 0, 0, 1, 1,
1.55987, 0.781736, 0.8575186, 0, 0, 0, 1, 1,
1.572902, -0.4547985, 1.92471, 0, 0, 0, 1, 1,
1.576743, 0.150582, 0.1987573, 0, 0, 0, 1, 1,
1.584016, -0.3364239, 1.339804, 0, 0, 0, 1, 1,
1.584488, 0.4638255, 0.26166, 1, 1, 1, 1, 1,
1.586457, -0.4775716, 1.999039, 1, 1, 1, 1, 1,
1.58964, -0.580515, 0.6619295, 1, 1, 1, 1, 1,
1.600262, 0.5488545, 1.016322, 1, 1, 1, 1, 1,
1.610282, -0.9229289, 1.316658, 1, 1, 1, 1, 1,
1.626746, 0.1523605, 1.97668, 1, 1, 1, 1, 1,
1.640092, 0.3493576, 3.152104, 1, 1, 1, 1, 1,
1.656193, 0.8156422, 1.010014, 1, 1, 1, 1, 1,
1.656565, -0.3557052, 2.138028, 1, 1, 1, 1, 1,
1.661064, 1.403031, 2.11363, 1, 1, 1, 1, 1,
1.672917, 1.761422, -1.003046, 1, 1, 1, 1, 1,
1.679528, -0.6624056, 0.6074467, 1, 1, 1, 1, 1,
1.684724, 0.06385882, 1.625819, 1, 1, 1, 1, 1,
1.688465, 0.7760819, 1.972202, 1, 1, 1, 1, 1,
1.690307, 0.8987482, 2.581398, 1, 1, 1, 1, 1,
1.690835, -0.1303096, 4.438033, 0, 0, 1, 1, 1,
1.717064, 1.284928, 2.044993, 1, 0, 0, 1, 1,
1.751791, 0.03586425, 2.850302, 1, 0, 0, 1, 1,
1.7757, 1.76588, 1.433934, 1, 0, 0, 1, 1,
1.781232, 1.250792, -0.5373672, 1, 0, 0, 1, 1,
1.799383, -1.753969, 0.4289476, 1, 0, 0, 1, 1,
1.810159, -0.5222754, 1.85609, 0, 0, 0, 1, 1,
1.830441, 2.48617, 0.2159469, 0, 0, 0, 1, 1,
1.864999, 0.2701967, 1.985849, 0, 0, 0, 1, 1,
1.870703, -1.522269, 2.296623, 0, 0, 0, 1, 1,
1.896636, -1.326053, 1.803089, 0, 0, 0, 1, 1,
1.903816, 0.5567704, 0.7273858, 0, 0, 0, 1, 1,
1.904377, 0.3342369, 0.9474343, 0, 0, 0, 1, 1,
1.956926, -1.876364, 1.251527, 1, 1, 1, 1, 1,
1.959921, 0.482464, 1.17523, 1, 1, 1, 1, 1,
1.981932, 1.920097, 0.2591853, 1, 1, 1, 1, 1,
2.033335, 0.1132505, 0.7676855, 1, 1, 1, 1, 1,
2.070805, 0.04837577, 0.0669241, 1, 1, 1, 1, 1,
2.072477, -0.3613846, 2.162058, 1, 1, 1, 1, 1,
2.08403, -1.589098, 0.7066714, 1, 1, 1, 1, 1,
2.08856, -0.7944528, 3.678303, 1, 1, 1, 1, 1,
2.094388, -2.271283, 1.561307, 1, 1, 1, 1, 1,
2.116958, -0.9317011, 1.471724, 1, 1, 1, 1, 1,
2.130895, -0.5937331, 2.114366, 1, 1, 1, 1, 1,
2.13868, 0.5778527, 2.245526, 1, 1, 1, 1, 1,
2.178521, 1.208715, 1.769219, 1, 1, 1, 1, 1,
2.187573, 0.04003645, 2.518809, 1, 1, 1, 1, 1,
2.228685, 0.9482222, 1.641656, 1, 1, 1, 1, 1,
2.230136, 2.12057, 1.070142, 0, 0, 1, 1, 1,
2.297331, -0.9341314, 2.344095, 1, 0, 0, 1, 1,
2.336479, 1.250907, 1.344343, 1, 0, 0, 1, 1,
2.372592, 0.7699483, -0.2934555, 1, 0, 0, 1, 1,
2.37769, -0.9704269, 1.410379, 1, 0, 0, 1, 1,
2.38387, 0.3384817, -0.06544153, 1, 0, 0, 1, 1,
2.394045, -0.2552405, 1.97647, 0, 0, 0, 1, 1,
2.515992, 2.053888, 1.237846, 0, 0, 0, 1, 1,
2.630007, -0.2785367, 0.5659476, 0, 0, 0, 1, 1,
2.633209, -0.1950122, 2.234339, 0, 0, 0, 1, 1,
2.644507, -0.3976825, 0.6747307, 0, 0, 0, 1, 1,
2.689523, -0.1840536, 2.914352, 0, 0, 0, 1, 1,
2.69364, -0.5409461, 3.42502, 0, 0, 0, 1, 1,
2.766419, -0.4188332, 2.511557, 1, 1, 1, 1, 1,
2.879479, 0.8021364, 0.8957894, 1, 1, 1, 1, 1,
3.09532, -0.04467963, -0.2414597, 1, 1, 1, 1, 1,
3.235304, 0.09299711, 1.165214, 1, 1, 1, 1, 1,
3.402318, -0.4686725, 1.812612, 1, 1, 1, 1, 1,
3.497887, 0.6128631, 2.380398, 1, 1, 1, 1, 1,
4.121448, -0.5946664, 0.1848523, 1, 1, 1, 1, 1
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
var radius = 9.967892;
var distance = 35.0118;
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
mvMatrix.translate( -0.4397726, 0.1952586, -0.01556492 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.0118);
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