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
-2.989033, 0.07072458, -0.5136099, 1, 0, 0, 1,
-2.917749, -1.96376, -2.152248, 1, 0.007843138, 0, 1,
-2.85633, -1.599756, -2.452491, 1, 0.01176471, 0, 1,
-2.827183, 0.8660788, -1.562911, 1, 0.01960784, 0, 1,
-2.82042, -1.833422, -1.567622, 1, 0.02352941, 0, 1,
-2.659383, 0.3489042, -2.298021, 1, 0.03137255, 0, 1,
-2.652995, -1.315692, -2.440659, 1, 0.03529412, 0, 1,
-2.589046, -0.8365976, -3.078598, 1, 0.04313726, 0, 1,
-2.529451, -0.1806094, -0.2842121, 1, 0.04705882, 0, 1,
-2.466681, 1.297377, 0.5761212, 1, 0.05490196, 0, 1,
-2.456028, -1.268268, 0.2658871, 1, 0.05882353, 0, 1,
-2.294087, 1.272086, -1.676559, 1, 0.06666667, 0, 1,
-2.218787, -0.08725321, -2.454224, 1, 0.07058824, 0, 1,
-2.200799, 0.3110086, -0.9419467, 1, 0.07843138, 0, 1,
-2.194715, 0.4792984, -0.01307259, 1, 0.08235294, 0, 1,
-2.178335, 0.9211244, -1.895821, 1, 0.09019608, 0, 1,
-2.164641, -0.1843094, -0.5635699, 1, 0.09411765, 0, 1,
-2.16086, 0.4121754, -0.008698259, 1, 0.1019608, 0, 1,
-2.152583, -0.7789774, -1.387373, 1, 0.1098039, 0, 1,
-2.152282, -1.057754, -2.145331, 1, 0.1137255, 0, 1,
-2.118443, 0.1141691, -1.144363, 1, 0.1215686, 0, 1,
-2.059081, -0.6364895, -2.948289, 1, 0.1254902, 0, 1,
-2.0522, 0.1055555, -3.464684, 1, 0.1333333, 0, 1,
-2.051458, -0.01524362, -3.449435, 1, 0.1372549, 0, 1,
-2.044889, -1.220626, -2.818836, 1, 0.145098, 0, 1,
-2.038578, 0.9106354, -2.15335, 1, 0.1490196, 0, 1,
-2.010199, 0.3156567, -2.854421, 1, 0.1568628, 0, 1,
-1.996741, -1.47124, -2.324938, 1, 0.1607843, 0, 1,
-1.959494, 1.124583, -1.513757, 1, 0.1686275, 0, 1,
-1.956059, -0.3157113, -1.092098, 1, 0.172549, 0, 1,
-1.949959, 2.057826, -1.658428, 1, 0.1803922, 0, 1,
-1.9386, -0.2538502, -2.415862, 1, 0.1843137, 0, 1,
-1.935082, -0.2311334, -1.801442, 1, 0.1921569, 0, 1,
-1.921299, 0.3619902, -2.003059, 1, 0.1960784, 0, 1,
-1.906466, 0.7544662, -1.136221, 1, 0.2039216, 0, 1,
-1.9038, 1.149314, -0.8896206, 1, 0.2117647, 0, 1,
-1.90108, -0.02653051, -2.20306, 1, 0.2156863, 0, 1,
-1.894554, -3.056703, -2.758317, 1, 0.2235294, 0, 1,
-1.860803, -0.3721974, -1.779401, 1, 0.227451, 0, 1,
-1.860365, -1.355006, -2.091022, 1, 0.2352941, 0, 1,
-1.836489, -0.1293544, -2.06784, 1, 0.2392157, 0, 1,
-1.811936, -1.350467, -0.7639984, 1, 0.2470588, 0, 1,
-1.810352, 0.3778528, -1.533466, 1, 0.2509804, 0, 1,
-1.806126, -2.373609, -2.48648, 1, 0.2588235, 0, 1,
-1.797651, 2.37992, 0.4098885, 1, 0.2627451, 0, 1,
-1.794804, -1.555465, -2.808371, 1, 0.2705882, 0, 1,
-1.781957, -0.6636122, -1.749085, 1, 0.2745098, 0, 1,
-1.772903, 0.09414887, -3.706929, 1, 0.282353, 0, 1,
-1.762446, -1.120111, -1.914035, 1, 0.2862745, 0, 1,
-1.762386, -0.3549696, -2.031526, 1, 0.2941177, 0, 1,
-1.755046, -1.280668, -1.394478, 1, 0.3019608, 0, 1,
-1.742856, -1.364194, -1.592728, 1, 0.3058824, 0, 1,
-1.717742, -0.8448843, -2.407132, 1, 0.3137255, 0, 1,
-1.701983, 0.2809025, -2.007051, 1, 0.3176471, 0, 1,
-1.701544, 0.5674213, -0.9540151, 1, 0.3254902, 0, 1,
-1.669557, 2.140865, -2.277426, 1, 0.3294118, 0, 1,
-1.661515, -0.09294491, -1.260042, 1, 0.3372549, 0, 1,
-1.657338, 0.573412, -0.1687839, 1, 0.3411765, 0, 1,
-1.64923, 0.7084984, -3.04766, 1, 0.3490196, 0, 1,
-1.639847, 0.780533, -1.245615, 1, 0.3529412, 0, 1,
-1.63413, -0.6266849, -1.213736, 1, 0.3607843, 0, 1,
-1.602485, -1.364067, -3.097447, 1, 0.3647059, 0, 1,
-1.601362, 1.503335, -2.354074, 1, 0.372549, 0, 1,
-1.586525, -1.820246, -1.897793, 1, 0.3764706, 0, 1,
-1.576459, -0.1926578, -3.702771, 1, 0.3843137, 0, 1,
-1.574373, -0.8483229, -1.682684, 1, 0.3882353, 0, 1,
-1.57123, -0.4944741, -2.253639, 1, 0.3960784, 0, 1,
-1.571194, -1.445751, -2.175437, 1, 0.4039216, 0, 1,
-1.552145, -0.2615373, -3.77467, 1, 0.4078431, 0, 1,
-1.512478, -0.02784084, -1.709687, 1, 0.4156863, 0, 1,
-1.501326, -1.399719, -2.334392, 1, 0.4196078, 0, 1,
-1.498095, -0.5792474, -0.6745628, 1, 0.427451, 0, 1,
-1.496427, -0.8041941, -1.866059, 1, 0.4313726, 0, 1,
-1.485002, -0.5609536, 0.0178292, 1, 0.4392157, 0, 1,
-1.482711, -0.2653924, -1.668036, 1, 0.4431373, 0, 1,
-1.478656, 0.3772638, -2.053405, 1, 0.4509804, 0, 1,
-1.468468, -0.154546, -2.732075, 1, 0.454902, 0, 1,
-1.463945, -1.475383, -2.708117, 1, 0.4627451, 0, 1,
-1.450232, -1.785931, -3.089698, 1, 0.4666667, 0, 1,
-1.448465, -1.01554, -1.391943, 1, 0.4745098, 0, 1,
-1.434502, -0.1151386, -1.264974, 1, 0.4784314, 0, 1,
-1.433355, -0.1109036, -2.242723, 1, 0.4862745, 0, 1,
-1.428353, 0.4293132, -2.461633, 1, 0.4901961, 0, 1,
-1.427285, -0.8504243, -2.169229, 1, 0.4980392, 0, 1,
-1.424697, -0.429567, -1.951048, 1, 0.5058824, 0, 1,
-1.400927, 0.04129876, -0.7547722, 1, 0.509804, 0, 1,
-1.398609, -0.434288, -2.555348, 1, 0.5176471, 0, 1,
-1.393336, 0.2782803, -2.123401, 1, 0.5215687, 0, 1,
-1.390145, -0.8723052, -1.052894, 1, 0.5294118, 0, 1,
-1.3798, -0.3478743, -2.286478, 1, 0.5333334, 0, 1,
-1.377488, -0.8151587, -0.4447888, 1, 0.5411765, 0, 1,
-1.374804, 0.9059582, -0.8193131, 1, 0.5450981, 0, 1,
-1.363096, -1.248303, -2.157389, 1, 0.5529412, 0, 1,
-1.358463, -0.09645957, -2.705488, 1, 0.5568628, 0, 1,
-1.348778, 1.66599, -2.574928, 1, 0.5647059, 0, 1,
-1.344741, -0.4911464, -1.253694, 1, 0.5686275, 0, 1,
-1.339383, 0.7651522, 0.1936958, 1, 0.5764706, 0, 1,
-1.338405, 1.018645, -1.218075, 1, 0.5803922, 0, 1,
-1.338167, 0.05023019, -2.885609, 1, 0.5882353, 0, 1,
-1.328206, 0.245047, 0.3387672, 1, 0.5921569, 0, 1,
-1.327224, -0.2071327, -0.8540034, 1, 0.6, 0, 1,
-1.319686, 1.378351, 0.3571065, 1, 0.6078432, 0, 1,
-1.304908, 0.6931862, -1.770933, 1, 0.6117647, 0, 1,
-1.297972, -1.138327, -2.939404, 1, 0.6196079, 0, 1,
-1.294074, 0.3322454, -1.858868, 1, 0.6235294, 0, 1,
-1.292381, -0.734297, -2.095706, 1, 0.6313726, 0, 1,
-1.287518, -0.7111559, -2.394134, 1, 0.6352941, 0, 1,
-1.28221, 1.128942, 0.2552448, 1, 0.6431373, 0, 1,
-1.278399, -1.526075, -1.964163, 1, 0.6470588, 0, 1,
-1.278384, 0.06774365, -1.939349, 1, 0.654902, 0, 1,
-1.277626, -0.1221914, -2.50139, 1, 0.6588235, 0, 1,
-1.276577, 1.491416, -0.6234593, 1, 0.6666667, 0, 1,
-1.27252, 0.5142547, -1.751073, 1, 0.6705883, 0, 1,
-1.27178, -0.007397742, -4.036908, 1, 0.6784314, 0, 1,
-1.271482, 2.861776, -0.6192023, 1, 0.682353, 0, 1,
-1.25876, -0.5787073, -2.463758, 1, 0.6901961, 0, 1,
-1.254216, 1.328608, -1.833167, 1, 0.6941177, 0, 1,
-1.249661, -0.2598151, -2.073832, 1, 0.7019608, 0, 1,
-1.248965, 1.014352, -1.498491, 1, 0.7098039, 0, 1,
-1.248349, -0.5601251, -2.585174, 1, 0.7137255, 0, 1,
-1.236095, -0.07651589, -3.052591, 1, 0.7215686, 0, 1,
-1.231035, -0.7095739, -2.653971, 1, 0.7254902, 0, 1,
-1.224494, 0.886806, 0.1540232, 1, 0.7333333, 0, 1,
-1.223162, 0.05115952, -1.6195, 1, 0.7372549, 0, 1,
-1.219494, 0.2188438, -2.298109, 1, 0.7450981, 0, 1,
-1.198174, 0.04791059, -0.623437, 1, 0.7490196, 0, 1,
-1.19795, 1.626064, -1.380385, 1, 0.7568628, 0, 1,
-1.192566, -0.4168393, -3.104634, 1, 0.7607843, 0, 1,
-1.184079, 0.003096107, -3.150604, 1, 0.7686275, 0, 1,
-1.182311, 0.6738284, -0.194196, 1, 0.772549, 0, 1,
-1.181995, 0.1038458, -0.5173883, 1, 0.7803922, 0, 1,
-1.179407, -0.7534815, -1.167777, 1, 0.7843137, 0, 1,
-1.172772, 2.299896, 0.5912584, 1, 0.7921569, 0, 1,
-1.171753, 0.4568984, -0.9199345, 1, 0.7960784, 0, 1,
-1.167824, 0.6716794, -2.005843, 1, 0.8039216, 0, 1,
-1.164824, -1.794007, -3.183137, 1, 0.8117647, 0, 1,
-1.157806, 0.4500908, 0.2195628, 1, 0.8156863, 0, 1,
-1.142361, -0.6497472, -2.052753, 1, 0.8235294, 0, 1,
-1.136499, 1.362151, -1.072113, 1, 0.827451, 0, 1,
-1.133755, -1.068209, -1.014688, 1, 0.8352941, 0, 1,
-1.1315, 0.5201501, -0.4665824, 1, 0.8392157, 0, 1,
-1.12828, -0.0541842, -1.181919, 1, 0.8470588, 0, 1,
-1.125133, -0.3026715, -3.58954, 1, 0.8509804, 0, 1,
-1.120343, 0.5945259, -1.085495, 1, 0.8588235, 0, 1,
-1.111733, 0.4716219, -0.6079723, 1, 0.8627451, 0, 1,
-1.110585, 0.3523375, -1.645022, 1, 0.8705882, 0, 1,
-1.109887, 1.381335, -1.586462, 1, 0.8745098, 0, 1,
-1.099226, -0.04921678, -0.2563326, 1, 0.8823529, 0, 1,
-1.097199, 0.3866315, -1.41828, 1, 0.8862745, 0, 1,
-1.096837, 1.298237, -0.4320327, 1, 0.8941177, 0, 1,
-1.094544, 0.5552529, -0.410772, 1, 0.8980392, 0, 1,
-1.088407, -0.3008762, -1.343914, 1, 0.9058824, 0, 1,
-1.081364, 1.026616, -0.5600618, 1, 0.9137255, 0, 1,
-1.07726, 0.03542372, -1.380967, 1, 0.9176471, 0, 1,
-1.076397, -0.9668758, -2.94601, 1, 0.9254902, 0, 1,
-1.075745, 0.2367433, -2.060821, 1, 0.9294118, 0, 1,
-1.073226, 1.313938, -0.3231407, 1, 0.9372549, 0, 1,
-1.068349, -0.2466407, -1.163801, 1, 0.9411765, 0, 1,
-1.065862, -1.085448, -3.976141, 1, 0.9490196, 0, 1,
-1.063054, 1.82938, -1.386694, 1, 0.9529412, 0, 1,
-1.055358, 0.7104999, -2.111085, 1, 0.9607843, 0, 1,
-1.052495, 0.03794865, -2.138842, 1, 0.9647059, 0, 1,
-1.05117, 0.3720944, -1.134349, 1, 0.972549, 0, 1,
-1.04334, -0.7325629, -1.925455, 1, 0.9764706, 0, 1,
-1.037874, 2.399882, -0.8217133, 1, 0.9843137, 0, 1,
-1.029199, -2.017853, -2.602547, 1, 0.9882353, 0, 1,
-1.027199, -0.03572255, -1.71809, 1, 0.9960784, 0, 1,
-1.025255, -0.1936708, -1.352196, 0.9960784, 1, 0, 1,
-1.024171, -0.02198405, -1.362376, 0.9921569, 1, 0, 1,
-1.017586, -0.2634837, -2.411665, 0.9843137, 1, 0, 1,
-1.013374, -0.4381797, -2.64341, 0.9803922, 1, 0, 1,
-1.01194, 0.175197, -1.576756, 0.972549, 1, 0, 1,
-1.010845, -0.869936, -3.067073, 0.9686275, 1, 0, 1,
-1.000499, -2.548761, -2.436198, 0.9607843, 1, 0, 1,
-0.9975194, 0.6800138, -1.743391, 0.9568627, 1, 0, 1,
-0.9972023, 2.321445, -2.148614, 0.9490196, 1, 0, 1,
-0.9959344, 0.1418937, -0.226254, 0.945098, 1, 0, 1,
-0.9940823, 0.4328762, 0.2333488, 0.9372549, 1, 0, 1,
-0.9922488, -2.141181, -0.5972431, 0.9333333, 1, 0, 1,
-0.9861853, -1.011891, -3.461375, 0.9254902, 1, 0, 1,
-0.9763679, -0.02237261, -0.8903187, 0.9215686, 1, 0, 1,
-0.9730435, 0.01249161, -1.35134, 0.9137255, 1, 0, 1,
-0.9697717, 1.672264, -0.2101872, 0.9098039, 1, 0, 1,
-0.9680392, 0.9042617, -0.9022465, 0.9019608, 1, 0, 1,
-0.9591025, -0.1776423, -2.636511, 0.8941177, 1, 0, 1,
-0.957279, -0.4733946, -2.708673, 0.8901961, 1, 0, 1,
-0.9568496, 1.6092, -0.4309623, 0.8823529, 1, 0, 1,
-0.9515268, 1.397547, 0.04266526, 0.8784314, 1, 0, 1,
-0.9451732, -0.5858761, -1.290024, 0.8705882, 1, 0, 1,
-0.9431235, 1.783248, 0.239045, 0.8666667, 1, 0, 1,
-0.9395289, 0.1863292, -0.938293, 0.8588235, 1, 0, 1,
-0.9258842, 0.2728884, -0.4846487, 0.854902, 1, 0, 1,
-0.9232877, -1.095175, -3.239871, 0.8470588, 1, 0, 1,
-0.9173214, -1.271264, -2.523986, 0.8431373, 1, 0, 1,
-0.9127349, -0.5541781, -0.4442025, 0.8352941, 1, 0, 1,
-0.9064746, 1.897467, -1.047735, 0.8313726, 1, 0, 1,
-0.9010869, 1.46017, -0.5097942, 0.8235294, 1, 0, 1,
-0.893488, -0.2725014, -1.711629, 0.8196079, 1, 0, 1,
-0.890448, -2.121004, -3.31658, 0.8117647, 1, 0, 1,
-0.8856915, -0.2320576, -2.218436, 0.8078431, 1, 0, 1,
-0.8820471, -0.9601756, -1.730598, 0.8, 1, 0, 1,
-0.8815017, 0.07043106, -1.544558, 0.7921569, 1, 0, 1,
-0.8806311, -0.1182802, -1.134913, 0.7882353, 1, 0, 1,
-0.8801947, 1.7216, -1.347094, 0.7803922, 1, 0, 1,
-0.8748276, 0.2022835, -0.5427213, 0.7764706, 1, 0, 1,
-0.8734646, 0.370088, -1.185836, 0.7686275, 1, 0, 1,
-0.8719558, -2.002538, -1.774063, 0.7647059, 1, 0, 1,
-0.8717641, -1.216511, -3.329752, 0.7568628, 1, 0, 1,
-0.8708286, -0.2746318, -0.4001294, 0.7529412, 1, 0, 1,
-0.8646772, 1.075607, -0.5456822, 0.7450981, 1, 0, 1,
-0.8625906, 0.3035436, -0.02818756, 0.7411765, 1, 0, 1,
-0.8615357, -0.01256381, -2.001525, 0.7333333, 1, 0, 1,
-0.8581439, 0.6577911, -1.175993, 0.7294118, 1, 0, 1,
-0.8542979, -0.9580556, -1.081131, 0.7215686, 1, 0, 1,
-0.8540321, -1.08344, -2.279586, 0.7176471, 1, 0, 1,
-0.8499961, 2.054672, -1.416406, 0.7098039, 1, 0, 1,
-0.8491119, 0.1440859, -1.88881, 0.7058824, 1, 0, 1,
-0.8489933, 1.069542, 0.8883908, 0.6980392, 1, 0, 1,
-0.8485226, -0.2390865, -2.109856, 0.6901961, 1, 0, 1,
-0.8444619, 0.4857609, -1.487841, 0.6862745, 1, 0, 1,
-0.8394684, 1.767069, 0.1300669, 0.6784314, 1, 0, 1,
-0.8393999, 2.310897, 0.4816617, 0.6745098, 1, 0, 1,
-0.8345385, 2.611793, -0.3977191, 0.6666667, 1, 0, 1,
-0.8293394, -1.660674, -3.080444, 0.6627451, 1, 0, 1,
-0.8285724, -2.089253, -2.196493, 0.654902, 1, 0, 1,
-0.8274316, 1.364827, 1.062559, 0.6509804, 1, 0, 1,
-0.8181551, -0.07597141, -3.289196, 0.6431373, 1, 0, 1,
-0.8153703, -1.160348, -1.857275, 0.6392157, 1, 0, 1,
-0.8153509, -0.1432094, -0.535102, 0.6313726, 1, 0, 1,
-0.8085834, 1.181495, -0.382171, 0.627451, 1, 0, 1,
-0.8070118, 1.145731, -0.6916294, 0.6196079, 1, 0, 1,
-0.8009049, -0.9242476, -3.587568, 0.6156863, 1, 0, 1,
-0.7992731, -0.1529804, -3.620273, 0.6078432, 1, 0, 1,
-0.798234, 0.5653195, 0.7619231, 0.6039216, 1, 0, 1,
-0.7919269, 0.1275911, -0.2910451, 0.5960785, 1, 0, 1,
-0.7893472, -0.2787196, -1.653624, 0.5882353, 1, 0, 1,
-0.786607, 0.118508, -1.031835, 0.5843138, 1, 0, 1,
-0.7772788, -0.1283879, -3.466346, 0.5764706, 1, 0, 1,
-0.7755697, -0.5927989, -1.438999, 0.572549, 1, 0, 1,
-0.7736136, -0.2056341, -1.140326, 0.5647059, 1, 0, 1,
-0.7677815, 0.3393454, -0.8523154, 0.5607843, 1, 0, 1,
-0.7647741, -0.08453904, -2.734332, 0.5529412, 1, 0, 1,
-0.7625602, -0.9768811, -3.224211, 0.5490196, 1, 0, 1,
-0.7610453, -0.3715613, -2.636618, 0.5411765, 1, 0, 1,
-0.7573007, -1.684797, -1.237311, 0.5372549, 1, 0, 1,
-0.7549509, -0.923144, -1.359567, 0.5294118, 1, 0, 1,
-0.7535943, -1.722027, -2.86407, 0.5254902, 1, 0, 1,
-0.751334, 0.09979468, -1.210938, 0.5176471, 1, 0, 1,
-0.7481608, -0.3340465, -0.8007041, 0.5137255, 1, 0, 1,
-0.7461869, -1.17981, -2.764752, 0.5058824, 1, 0, 1,
-0.7419685, -0.476777, -2.290936, 0.5019608, 1, 0, 1,
-0.7358632, -1.291453, -3.469552, 0.4941176, 1, 0, 1,
-0.734575, 0.7985043, 0.002949263, 0.4862745, 1, 0, 1,
-0.7342189, -0.4715686, -1.485009, 0.4823529, 1, 0, 1,
-0.7337543, 0.3687465, -0.6894854, 0.4745098, 1, 0, 1,
-0.7248561, 1.788669, -1.277235, 0.4705882, 1, 0, 1,
-0.7244053, 0.4071358, -1.341684, 0.4627451, 1, 0, 1,
-0.7232358, 1.167612, -0.7315403, 0.4588235, 1, 0, 1,
-0.7192371, -0.2537991, -1.234132, 0.4509804, 1, 0, 1,
-0.7177416, -2.049297, -2.911719, 0.4470588, 1, 0, 1,
-0.7051892, -0.1101198, -2.164424, 0.4392157, 1, 0, 1,
-0.701884, -0.621991, -2.919116, 0.4352941, 1, 0, 1,
-0.6947874, 0.2035847, 0.09243361, 0.427451, 1, 0, 1,
-0.694208, 1.097406, 0.6145282, 0.4235294, 1, 0, 1,
-0.6921675, -0.05248999, -1.511003, 0.4156863, 1, 0, 1,
-0.6871618, -0.6145114, -2.969448, 0.4117647, 1, 0, 1,
-0.6858463, -1.231354, -0.421671, 0.4039216, 1, 0, 1,
-0.6849829, -0.3202194, -1.947315, 0.3960784, 1, 0, 1,
-0.684116, -1.38408, -2.217854, 0.3921569, 1, 0, 1,
-0.680326, 0.07153367, -0.6387621, 0.3843137, 1, 0, 1,
-0.6797521, 1.120234, -1.703809, 0.3803922, 1, 0, 1,
-0.676833, -0.6776831, -2.765995, 0.372549, 1, 0, 1,
-0.6723089, 0.3021283, 0.2500928, 0.3686275, 1, 0, 1,
-0.6703894, 2.582958, -0.7046013, 0.3607843, 1, 0, 1,
-0.6694055, -1.802832, -2.545412, 0.3568628, 1, 0, 1,
-0.6683474, 1.283426, -1.158602, 0.3490196, 1, 0, 1,
-0.6647515, 1.447147, 0.5555053, 0.345098, 1, 0, 1,
-0.6616565, 1.18006, 0.6945641, 0.3372549, 1, 0, 1,
-0.6581548, 1.543305, -1.32979, 0.3333333, 1, 0, 1,
-0.6575252, -1.163164, -2.405785, 0.3254902, 1, 0, 1,
-0.6570938, 0.1481092, -2.490679, 0.3215686, 1, 0, 1,
-0.6535614, 0.540623, -0.8702118, 0.3137255, 1, 0, 1,
-0.6487204, 1.610628, 0.399634, 0.3098039, 1, 0, 1,
-0.6480057, 0.557768, -0.4039367, 0.3019608, 1, 0, 1,
-0.6440285, -0.2733922, -2.346149, 0.2941177, 1, 0, 1,
-0.6439474, 0.8986133, -1.141471, 0.2901961, 1, 0, 1,
-0.6433138, -0.6520371, -4.25532, 0.282353, 1, 0, 1,
-0.643121, -0.090623, -1.707479, 0.2784314, 1, 0, 1,
-0.6390891, -0.6251842, -2.153662, 0.2705882, 1, 0, 1,
-0.6372241, -1.356297, -3.687989, 0.2666667, 1, 0, 1,
-0.6345701, 1.822747, 0.4327092, 0.2588235, 1, 0, 1,
-0.6344815, -0.1703625, -2.547621, 0.254902, 1, 0, 1,
-0.6326723, -0.02614292, -2.309974, 0.2470588, 1, 0, 1,
-0.6312598, 1.015938, 1.106964, 0.2431373, 1, 0, 1,
-0.6218917, 1.733663, -1.457053, 0.2352941, 1, 0, 1,
-0.618929, -1.208421, -1.844682, 0.2313726, 1, 0, 1,
-0.6168485, -1.7765, -3.94496, 0.2235294, 1, 0, 1,
-0.6151904, 0.04368744, -1.837913, 0.2196078, 1, 0, 1,
-0.6143899, 1.20751, -1.155581, 0.2117647, 1, 0, 1,
-0.6122652, 0.4315884, -1.508041, 0.2078431, 1, 0, 1,
-0.6094735, -0.7152898, -4.07583, 0.2, 1, 0, 1,
-0.6063022, 1.062867, -0.8500348, 0.1921569, 1, 0, 1,
-0.6048315, -0.608347, -2.327306, 0.1882353, 1, 0, 1,
-0.602732, 1.873351, -1.219075, 0.1803922, 1, 0, 1,
-0.5995686, -1.132506, -2.124176, 0.1764706, 1, 0, 1,
-0.5922196, 1.310129, -0.1503919, 0.1686275, 1, 0, 1,
-0.5917929, 0.2627122, -0.4275459, 0.1647059, 1, 0, 1,
-0.5885987, -1.840026, -2.931225, 0.1568628, 1, 0, 1,
-0.5861731, 2.056418, -1.903227, 0.1529412, 1, 0, 1,
-0.5835606, 0.1439194, 0.01678475, 0.145098, 1, 0, 1,
-0.5810956, 0.3604747, -1.821457, 0.1411765, 1, 0, 1,
-0.5803242, 0.3486785, -0.9278812, 0.1333333, 1, 0, 1,
-0.5774151, 0.8500482, -2.451319, 0.1294118, 1, 0, 1,
-0.5730311, 1.744188, 1.587983, 0.1215686, 1, 0, 1,
-0.5713839, 0.8647939, 0.4810824, 0.1176471, 1, 0, 1,
-0.5708781, 0.4713704, 0.466106, 0.1098039, 1, 0, 1,
-0.5707803, -1.356574, -3.343904, 0.1058824, 1, 0, 1,
-0.5690831, 0.5272536, -1.429583, 0.09803922, 1, 0, 1,
-0.5685548, 1.278923, 1.79047, 0.09019608, 1, 0, 1,
-0.5680268, 0.2515625, -0.4089539, 0.08627451, 1, 0, 1,
-0.5672364, -0.2473951, -1.674065, 0.07843138, 1, 0, 1,
-0.5649028, 0.5718863, -1.178216, 0.07450981, 1, 0, 1,
-0.5640785, 0.2576864, -0.9785036, 0.06666667, 1, 0, 1,
-0.5631863, -0.5896539, -1.969736, 0.0627451, 1, 0, 1,
-0.5623029, -0.5639998, -1.628839, 0.05490196, 1, 0, 1,
-0.5579404, -0.7147219, -4.075777, 0.05098039, 1, 0, 1,
-0.5540856, 0.1163225, -0.06210175, 0.04313726, 1, 0, 1,
-0.5435884, -1.559683, -1.762164, 0.03921569, 1, 0, 1,
-0.5389847, 0.4031187, -0.4449416, 0.03137255, 1, 0, 1,
-0.5365112, 0.9614617, -1.739648, 0.02745098, 1, 0, 1,
-0.5317255, -0.2674349, -1.985967, 0.01960784, 1, 0, 1,
-0.5300577, 1.777701, 0.4291727, 0.01568628, 1, 0, 1,
-0.528086, 1.666262, 0.651251, 0.007843138, 1, 0, 1,
-0.5280209, 0.4573081, -0.3300659, 0.003921569, 1, 0, 1,
-0.527954, -1.000842, 0.01781334, 0, 1, 0.003921569, 1,
-0.5278028, -0.2827841, -2.050056, 0, 1, 0.01176471, 1,
-0.5248692, 0.5221082, -3.192571, 0, 1, 0.01568628, 1,
-0.519313, -0.2587858, -3.482184, 0, 1, 0.02352941, 1,
-0.5171859, -0.642221, -3.413828, 0, 1, 0.02745098, 1,
-0.509668, 1.135239, -0.1789347, 0, 1, 0.03529412, 1,
-0.5080895, -1.256268, -1.327314, 0, 1, 0.03921569, 1,
-0.5015969, 0.8412325, -0.7353318, 0, 1, 0.04705882, 1,
-0.4983025, 0.3537904, -0.3232406, 0, 1, 0.05098039, 1,
-0.4938173, 1.944855, -0.9494058, 0, 1, 0.05882353, 1,
-0.4890862, -2.512544, -1.983524, 0, 1, 0.0627451, 1,
-0.4887375, 0.7707424, 1.464905, 0, 1, 0.07058824, 1,
-0.4883959, 2.853037, -0.1402778, 0, 1, 0.07450981, 1,
-0.4877791, -0.1120392, -0.9727603, 0, 1, 0.08235294, 1,
-0.484942, -0.04666967, -2.044822, 0, 1, 0.08627451, 1,
-0.4807703, -0.2664181, -2.297692, 0, 1, 0.09411765, 1,
-0.4805166, -0.4968911, -2.940536, 0, 1, 0.1019608, 1,
-0.4792314, -1.392174, -2.195538, 0, 1, 0.1058824, 1,
-0.473258, 0.5515212, -2.040097, 0, 1, 0.1137255, 1,
-0.469155, -2.596256, -2.909088, 0, 1, 0.1176471, 1,
-0.4655122, -0.6179483, -2.823105, 0, 1, 0.1254902, 1,
-0.4640426, -1.608352, -2.073136, 0, 1, 0.1294118, 1,
-0.4566824, 0.1208062, -1.372384, 0, 1, 0.1372549, 1,
-0.4551277, 0.9751405, -0.7643197, 0, 1, 0.1411765, 1,
-0.4513449, 1.107335, -0.9975759, 0, 1, 0.1490196, 1,
-0.4472572, 1.018025, -0.2437354, 0, 1, 0.1529412, 1,
-0.4462717, 1.632515, -1.40869, 0, 1, 0.1607843, 1,
-0.4405826, -0.8474833, -2.549319, 0, 1, 0.1647059, 1,
-0.4385232, -1.657611, -3.11924, 0, 1, 0.172549, 1,
-0.4373367, 0.8013992, 0.6851605, 0, 1, 0.1764706, 1,
-0.4364264, 0.7471552, -1.056597, 0, 1, 0.1843137, 1,
-0.4357484, -0.2892938, -1.102477, 0, 1, 0.1882353, 1,
-0.4329077, 0.4699623, -1.057843, 0, 1, 0.1960784, 1,
-0.4313552, -2.003849, -3.580673, 0, 1, 0.2039216, 1,
-0.4257176, -0.06349072, -1.416632, 0, 1, 0.2078431, 1,
-0.4252505, 0.5558015, 1.800425, 0, 1, 0.2156863, 1,
-0.4252333, 1.097168, -1.783396, 0, 1, 0.2196078, 1,
-0.4234252, 1.333497, -0.8923223, 0, 1, 0.227451, 1,
-0.4227061, 0.5038066, -0.7615714, 0, 1, 0.2313726, 1,
-0.4225956, -0.6077664, -1.316284, 0, 1, 0.2392157, 1,
-0.4197462, -1.018332, -3.773488, 0, 1, 0.2431373, 1,
-0.4146061, -1.758637, -2.097909, 0, 1, 0.2509804, 1,
-0.4137293, 0.07515971, -0.1188042, 0, 1, 0.254902, 1,
-0.4125902, 0.3833338, -1.743713, 0, 1, 0.2627451, 1,
-0.4085502, 0.7874571, -0.2011049, 0, 1, 0.2666667, 1,
-0.4068233, -1.216675, -2.348551, 0, 1, 0.2745098, 1,
-0.4022312, 2.130624, 1.629563, 0, 1, 0.2784314, 1,
-0.4007801, 0.0624621, -1.327931, 0, 1, 0.2862745, 1,
-0.399633, 0.2096137, -2.052041, 0, 1, 0.2901961, 1,
-0.3979004, 0.265677, -0.5842877, 0, 1, 0.2980392, 1,
-0.3974637, 0.2574224, -2.869292, 0, 1, 0.3058824, 1,
-0.3942924, 0.5564597, 1.021476, 0, 1, 0.3098039, 1,
-0.3930752, -0.133131, -2.731521, 0, 1, 0.3176471, 1,
-0.3873532, 0.5078662, 0.4492022, 0, 1, 0.3215686, 1,
-0.381977, -1.320867, -2.00483, 0, 1, 0.3294118, 1,
-0.3806435, -1.489497, -2.690459, 0, 1, 0.3333333, 1,
-0.3792555, 0.6569938, -0.8060873, 0, 1, 0.3411765, 1,
-0.3740323, -0.2572965, -2.814068, 0, 1, 0.345098, 1,
-0.37041, -0.01208842, -0.7085239, 0, 1, 0.3529412, 1,
-0.3668539, -0.4483957, -2.565876, 0, 1, 0.3568628, 1,
-0.365444, 0.1074075, -2.767502, 0, 1, 0.3647059, 1,
-0.361514, 0.275939, -0.1096344, 0, 1, 0.3686275, 1,
-0.3613042, 0.3183034, -0.4023837, 0, 1, 0.3764706, 1,
-0.358315, 0.3472212, -1.342147, 0, 1, 0.3803922, 1,
-0.3559039, -1.490366, -2.415607, 0, 1, 0.3882353, 1,
-0.3530256, -1.126351, -3.408789, 0, 1, 0.3921569, 1,
-0.3527648, 0.5273373, -2.306683, 0, 1, 0.4, 1,
-0.3527461, -1.535843, -2.675667, 0, 1, 0.4078431, 1,
-0.3506662, -0.4054255, -2.903388, 0, 1, 0.4117647, 1,
-0.3390915, 0.3682444, -0.8597356, 0, 1, 0.4196078, 1,
-0.3339767, 1.709467, 0.7776188, 0, 1, 0.4235294, 1,
-0.3313925, 0.7875606, -0.148775, 0, 1, 0.4313726, 1,
-0.3293684, -1.891057, -3.138291, 0, 1, 0.4352941, 1,
-0.3276802, -0.2597483, -1.97004, 0, 1, 0.4431373, 1,
-0.3161022, -0.464738, -2.360639, 0, 1, 0.4470588, 1,
-0.3101654, 0.9428281, 1.016539, 0, 1, 0.454902, 1,
-0.3064085, 0.1570629, 0.1661279, 0, 1, 0.4588235, 1,
-0.3063398, -0.2524368, -1.263192, 0, 1, 0.4666667, 1,
-0.3052974, -1.015106, -3.261779, 0, 1, 0.4705882, 1,
-0.3043801, -1.475577, -1.915501, 0, 1, 0.4784314, 1,
-0.3012911, -1.159428, -4.157454, 0, 1, 0.4823529, 1,
-0.2872506, -0.7013308, -2.341074, 0, 1, 0.4901961, 1,
-0.280363, -1.036013, -3.145316, 0, 1, 0.4941176, 1,
-0.2765781, -1.768874, -3.586753, 0, 1, 0.5019608, 1,
-0.2712403, -0.1525606, -2.532961, 0, 1, 0.509804, 1,
-0.2707599, 1.143035, -2.003602, 0, 1, 0.5137255, 1,
-0.2705488, 0.3091206, -0.2601601, 0, 1, 0.5215687, 1,
-0.2685404, 0.9341869, -0.3603608, 0, 1, 0.5254902, 1,
-0.2668276, 0.7849262, -0.4364229, 0, 1, 0.5333334, 1,
-0.2612522, -1.490319, -2.507759, 0, 1, 0.5372549, 1,
-0.2612276, 0.6874396, -1.511383, 0, 1, 0.5450981, 1,
-0.2568095, -0.8096661, -1.29328, 0, 1, 0.5490196, 1,
-0.2451264, 0.8894898, -0.01291664, 0, 1, 0.5568628, 1,
-0.2429962, -0.3498277, -1.566261, 0, 1, 0.5607843, 1,
-0.2424588, -0.05227223, -1.633378, 0, 1, 0.5686275, 1,
-0.240073, 1.91547, -1.90233, 0, 1, 0.572549, 1,
-0.2310139, -1.661034, -4.13748, 0, 1, 0.5803922, 1,
-0.2219504, -0.8618709, -3.064336, 0, 1, 0.5843138, 1,
-0.2186262, -0.6167427, -2.025244, 0, 1, 0.5921569, 1,
-0.2164287, -0.9887759, -2.546371, 0, 1, 0.5960785, 1,
-0.2152545, -0.1954446, -1.917777, 0, 1, 0.6039216, 1,
-0.215199, 1.772861, 1.471697, 0, 1, 0.6117647, 1,
-0.2127779, 1.077957, -1.060919, 0, 1, 0.6156863, 1,
-0.2055647, -0.1649436, -2.359491, 0, 1, 0.6235294, 1,
-0.1993008, 0.4562592, 0.143079, 0, 1, 0.627451, 1,
-0.1964585, 0.2156039, -1.291307, 0, 1, 0.6352941, 1,
-0.1951033, 0.4079167, 0.2904696, 0, 1, 0.6392157, 1,
-0.1944237, -0.0509527, -1.884414, 0, 1, 0.6470588, 1,
-0.1933602, 0.2380961, 0.3996335, 0, 1, 0.6509804, 1,
-0.1924686, -1.944124, -2.103058, 0, 1, 0.6588235, 1,
-0.1924217, 0.6132458, 0.7488906, 0, 1, 0.6627451, 1,
-0.1898212, 2.627531, 1.167904, 0, 1, 0.6705883, 1,
-0.1881295, 0.6725028, -1.618649, 0, 1, 0.6745098, 1,
-0.1858899, 1.444936, 0.8488301, 0, 1, 0.682353, 1,
-0.1858266, -0.03376723, -0.8157013, 0, 1, 0.6862745, 1,
-0.1842785, -0.4591075, -1.677817, 0, 1, 0.6941177, 1,
-0.1841512, 2.327679, 0.9523356, 0, 1, 0.7019608, 1,
-0.1827361, 0.8430543, 0.7603472, 0, 1, 0.7058824, 1,
-0.1764762, 0.5071741, -0.2184919, 0, 1, 0.7137255, 1,
-0.17117, -0.1510433, -1.390334, 0, 1, 0.7176471, 1,
-0.1673076, 1.178641, -1.406452, 0, 1, 0.7254902, 1,
-0.1663441, -0.2572953, -2.8015, 0, 1, 0.7294118, 1,
-0.1578186, 0.04240477, -1.247789, 0, 1, 0.7372549, 1,
-0.1485739, -0.8062343, -1.168244, 0, 1, 0.7411765, 1,
-0.1443637, 0.01846136, -0.1238206, 0, 1, 0.7490196, 1,
-0.1403675, 0.9514594, -1.503058, 0, 1, 0.7529412, 1,
-0.1382533, 0.6654341, 0.1716905, 0, 1, 0.7607843, 1,
-0.1371504, 0.09416225, -1.659202, 0, 1, 0.7647059, 1,
-0.1347156, -0.6316364, -3.092732, 0, 1, 0.772549, 1,
-0.133916, -1.589734, -1.841544, 0, 1, 0.7764706, 1,
-0.1280725, 0.7693518, -1.625498, 0, 1, 0.7843137, 1,
-0.127935, -1.182703, -2.536854, 0, 1, 0.7882353, 1,
-0.127786, 1.121868, -0.3584686, 0, 1, 0.7960784, 1,
-0.1241734, 0.4562471, -0.194517, 0, 1, 0.8039216, 1,
-0.1240681, -0.611479, -3.148173, 0, 1, 0.8078431, 1,
-0.1154487, -1.120153, -2.959376, 0, 1, 0.8156863, 1,
-0.11348, 1.272869, -0.179844, 0, 1, 0.8196079, 1,
-0.1120384, 0.2504241, -0.9714288, 0, 1, 0.827451, 1,
-0.107538, 0.1981784, -0.8030605, 0, 1, 0.8313726, 1,
-0.1068584, 1.134559, 1.833658, 0, 1, 0.8392157, 1,
-0.1005007, -1.68464, -4.263728, 0, 1, 0.8431373, 1,
-0.1004335, 1.077993, 0.611968, 0, 1, 0.8509804, 1,
-0.09853237, -0.4268365, -1.951301, 0, 1, 0.854902, 1,
-0.09352274, 1.120008, 2.150222, 0, 1, 0.8627451, 1,
-0.08519113, 0.4815025, -1.05617, 0, 1, 0.8666667, 1,
-0.08225016, -1.343665, -2.431023, 0, 1, 0.8745098, 1,
-0.07891776, -0.625605, -2.954834, 0, 1, 0.8784314, 1,
-0.07730851, 1.269932, -1.360583, 0, 1, 0.8862745, 1,
-0.07394031, -2.109529, -4.831537, 0, 1, 0.8901961, 1,
-0.07203863, 0.9916905, -0.06445417, 0, 1, 0.8980392, 1,
-0.07104275, 0.211291, -0.8199586, 0, 1, 0.9058824, 1,
-0.0697367, -1.41034, -2.742392, 0, 1, 0.9098039, 1,
-0.06784054, -0.03626518, -1.865285, 0, 1, 0.9176471, 1,
-0.06522321, -1.070188, -2.15326, 0, 1, 0.9215686, 1,
-0.06321099, 1.696699, 0.2768081, 0, 1, 0.9294118, 1,
-0.06093208, -0.1273482, -2.631232, 0, 1, 0.9333333, 1,
-0.06085426, -1.117711, -3.476846, 0, 1, 0.9411765, 1,
-0.06008978, -1.120347, -2.251927, 0, 1, 0.945098, 1,
-0.05991849, 0.003224108, -2.05599, 0, 1, 0.9529412, 1,
-0.05881641, -1.09038, -4.218386, 0, 1, 0.9568627, 1,
-0.05569341, -0.5699249, -2.086439, 0, 1, 0.9647059, 1,
-0.05463422, -0.07771842, -1.36836, 0, 1, 0.9686275, 1,
-0.0485556, -0.1481581, -3.736998, 0, 1, 0.9764706, 1,
-0.04040404, 1.361619, 0.5743456, 0, 1, 0.9803922, 1,
-0.04023247, -0.5867031, -3.824275, 0, 1, 0.9882353, 1,
-0.0382001, 0.7832009, -1.390935, 0, 1, 0.9921569, 1,
-0.03571388, 0.6158743, -0.5166755, 0, 1, 1, 1,
-0.03247624, -0.7191392, -3.158426, 0, 0.9921569, 1, 1,
-0.03124728, 0.667014, 0.2343221, 0, 0.9882353, 1, 1,
-0.03000328, 0.7457215, 1.084057, 0, 0.9803922, 1, 1,
-0.02692083, -0.1618836, -3.603694, 0, 0.9764706, 1, 1,
-0.02125443, -2.6193, -2.895496, 0, 0.9686275, 1, 1,
-0.02125317, 0.6377366, -0.4426656, 0, 0.9647059, 1, 1,
-0.01325516, 0.1638821, -0.6231519, 0, 0.9568627, 1, 1,
-0.01086874, 1.418885, -1.214698, 0, 0.9529412, 1, 1,
-0.01011692, -0.6348938, -4.172411, 0, 0.945098, 1, 1,
-0.009947918, 1.620177, -0.6781036, 0, 0.9411765, 1, 1,
-0.008571338, -0.6482501, -4.657239, 0, 0.9333333, 1, 1,
-0.002429633, 0.1823146, 0.07310482, 0, 0.9294118, 1, 1,
-0.002112572, -1.40303, -3.648654, 0, 0.9215686, 1, 1,
0.003362632, -0.2596599, 1.156778, 0, 0.9176471, 1, 1,
0.01081074, -0.2488081, 0.505501, 0, 0.9098039, 1, 1,
0.01136677, -1.178714, 2.432037, 0, 0.9058824, 1, 1,
0.01326328, -1.464111, 2.744681, 0, 0.8980392, 1, 1,
0.01394849, -0.7978486, 3.180413, 0, 0.8901961, 1, 1,
0.01458759, -1.36598, 4.070613, 0, 0.8862745, 1, 1,
0.01649057, 0.7163321, -2.19223, 0, 0.8784314, 1, 1,
0.01773286, -1.657616, 3.384943, 0, 0.8745098, 1, 1,
0.01935892, -1.583463, 4.345117, 0, 0.8666667, 1, 1,
0.02492682, -0.9310899, 2.635187, 0, 0.8627451, 1, 1,
0.02874646, -1.154666, 3.25664, 0, 0.854902, 1, 1,
0.02904436, -0.4719199, 2.621321, 0, 0.8509804, 1, 1,
0.03153279, -0.9861675, 2.913343, 0, 0.8431373, 1, 1,
0.03283888, 0.9930092, 2.203783, 0, 0.8392157, 1, 1,
0.03317734, -0.4296685, 4.428668, 0, 0.8313726, 1, 1,
0.035035, 1.797304, 0.03053811, 0, 0.827451, 1, 1,
0.04037157, 1.258163, 3.596539, 0, 0.8196079, 1, 1,
0.04056653, 0.1438246, -0.138694, 0, 0.8156863, 1, 1,
0.04219123, 0.6592377, 0.4653392, 0, 0.8078431, 1, 1,
0.04676275, 0.9145399, -0.6152601, 0, 0.8039216, 1, 1,
0.04852585, 0.3411255, 1.392946, 0, 0.7960784, 1, 1,
0.04945232, -0.4475645, 3.468412, 0, 0.7882353, 1, 1,
0.05005417, -1.361749, 3.51169, 0, 0.7843137, 1, 1,
0.05120299, 0.1172435, 1.258324, 0, 0.7764706, 1, 1,
0.05133471, -1.195612, 2.268414, 0, 0.772549, 1, 1,
0.05633029, -1.065597, 4.160509, 0, 0.7647059, 1, 1,
0.05665647, 0.4569758, 3.112884, 0, 0.7607843, 1, 1,
0.06179316, 0.07590877, 2.203278, 0, 0.7529412, 1, 1,
0.06247426, -0.4625673, 3.733171, 0, 0.7490196, 1, 1,
0.06493223, 0.07318553, -0.642695, 0, 0.7411765, 1, 1,
0.07393081, 0.05789465, 1.6031, 0, 0.7372549, 1, 1,
0.07942645, 0.3227928, 0.1906446, 0, 0.7294118, 1, 1,
0.07981335, -0.5260355, 3.119617, 0, 0.7254902, 1, 1,
0.08049072, -0.8286147, 3.463477, 0, 0.7176471, 1, 1,
0.08178154, 0.1922582, 1.429364, 0, 0.7137255, 1, 1,
0.08800808, -0.8926595, 3.199634, 0, 0.7058824, 1, 1,
0.0891091, -1.229911, 2.297977, 0, 0.6980392, 1, 1,
0.09378244, -1.015604, 1.749218, 0, 0.6941177, 1, 1,
0.09462645, -0.2274375, 2.817047, 0, 0.6862745, 1, 1,
0.09758049, 1.496294, 0.5257668, 0, 0.682353, 1, 1,
0.09911337, 1.504734, 0.1476276, 0, 0.6745098, 1, 1,
0.09973234, 1.708121, 0.6064468, 0, 0.6705883, 1, 1,
0.1007034, 1.822132, 0.4501686, 0, 0.6627451, 1, 1,
0.1072915, -0.3655002, 2.179469, 0, 0.6588235, 1, 1,
0.1161109, 0.6757035, -0.4424575, 0, 0.6509804, 1, 1,
0.1176329, -0.3251465, 1.96404, 0, 0.6470588, 1, 1,
0.1194886, 1.608792, -0.8147773, 0, 0.6392157, 1, 1,
0.1223556, -1.886299, 3.684859, 0, 0.6352941, 1, 1,
0.12381, 1.421921, 1.210376, 0, 0.627451, 1, 1,
0.126652, -1.202811, 5.209561, 0, 0.6235294, 1, 1,
0.1319994, -0.6486294, 3.055394, 0, 0.6156863, 1, 1,
0.1330418, -1.123181, 2.324786, 0, 0.6117647, 1, 1,
0.136642, -0.1662859, 3.483083, 0, 0.6039216, 1, 1,
0.1371508, 0.3349904, -0.2370518, 0, 0.5960785, 1, 1,
0.1375564, 0.3257373, 0.5360742, 0, 0.5921569, 1, 1,
0.1522627, -1.378571, 3.178991, 0, 0.5843138, 1, 1,
0.1528868, 0.04401231, -0.1380173, 0, 0.5803922, 1, 1,
0.1545455, -0.2318563, 3.432817, 0, 0.572549, 1, 1,
0.1585826, 0.1650831, 0.9358637, 0, 0.5686275, 1, 1,
0.1586263, 1.016891, 0.3777829, 0, 0.5607843, 1, 1,
0.1611051, -1.762003, 3.537051, 0, 0.5568628, 1, 1,
0.1615721, 0.4944429, -1.678096, 0, 0.5490196, 1, 1,
0.1653205, 0.2074976, 0.4738865, 0, 0.5450981, 1, 1,
0.1681781, 0.2005958, 1.716344, 0, 0.5372549, 1, 1,
0.1689388, -1.866584, 1.558339, 0, 0.5333334, 1, 1,
0.1737962, -0.1886729, 2.049664, 0, 0.5254902, 1, 1,
0.1813414, 0.1639872, 1.534057, 0, 0.5215687, 1, 1,
0.1861884, 0.3903458, 0.8709759, 0, 0.5137255, 1, 1,
0.1917457, 0.04134432, 2.348726, 0, 0.509804, 1, 1,
0.2094816, -0.05553808, 1.389365, 0, 0.5019608, 1, 1,
0.2132636, 0.1907081, 1.335415, 0, 0.4941176, 1, 1,
0.2138015, 0.04893254, 2.523582, 0, 0.4901961, 1, 1,
0.2146953, -1.218754, 4.463899, 0, 0.4823529, 1, 1,
0.21597, 1.170794, -0.210502, 0, 0.4784314, 1, 1,
0.2167817, -0.3607263, 2.79033, 0, 0.4705882, 1, 1,
0.2229432, -0.534753, 1.672391, 0, 0.4666667, 1, 1,
0.2280176, 0.1440085, 0.9226719, 0, 0.4588235, 1, 1,
0.2292322, -0.424674, 3.05001, 0, 0.454902, 1, 1,
0.2325956, 0.998384, -0.7177514, 0, 0.4470588, 1, 1,
0.2328725, 0.6683776, -0.27624, 0, 0.4431373, 1, 1,
0.235355, 1.358878, 0.1412255, 0, 0.4352941, 1, 1,
0.2364468, -0.4121271, 3.600789, 0, 0.4313726, 1, 1,
0.2370841, 0.4193754, 1.285523, 0, 0.4235294, 1, 1,
0.2372592, -0.7163944, 3.452397, 0, 0.4196078, 1, 1,
0.2387962, -3.447423, 2.410132, 0, 0.4117647, 1, 1,
0.2398809, 0.2008784, 1.543295, 0, 0.4078431, 1, 1,
0.2444102, 0.7911594, 1.11783, 0, 0.4, 1, 1,
0.2453605, -0.4480279, 1.877994, 0, 0.3921569, 1, 1,
0.2471488, 1.362777, -0.4134609, 0, 0.3882353, 1, 1,
0.2476861, -1.335529, 1.113188, 0, 0.3803922, 1, 1,
0.2484472, 0.1394524, 2.105564, 0, 0.3764706, 1, 1,
0.248793, -1.082152, 2.592343, 0, 0.3686275, 1, 1,
0.2498852, -0.7904139, 3.720119, 0, 0.3647059, 1, 1,
0.2529019, 0.8110433, 0.3781249, 0, 0.3568628, 1, 1,
0.2580744, 2.410297, -1.426137, 0, 0.3529412, 1, 1,
0.2600296, -0.006317565, 1.492391, 0, 0.345098, 1, 1,
0.2611318, 1.10842, 0.3390477, 0, 0.3411765, 1, 1,
0.2682585, -2.151052, 3.001992, 0, 0.3333333, 1, 1,
0.2690738, 0.215422, 2.295817, 0, 0.3294118, 1, 1,
0.2730077, 0.03312803, 1.551116, 0, 0.3215686, 1, 1,
0.2733917, 0.6733672, 0.3423865, 0, 0.3176471, 1, 1,
0.2740423, -1.209047, 1.335044, 0, 0.3098039, 1, 1,
0.2741897, -0.4226905, 0.6746811, 0, 0.3058824, 1, 1,
0.2756132, -0.7505386, 2.448769, 0, 0.2980392, 1, 1,
0.2770137, 0.3503082, 1.345632, 0, 0.2901961, 1, 1,
0.2781016, -1.330717, 4.681067, 0, 0.2862745, 1, 1,
0.2792527, 0.4783703, -1.028454, 0, 0.2784314, 1, 1,
0.2830075, 0.270305, 0.9076448, 0, 0.2745098, 1, 1,
0.2884108, -0.4080533, 3.804542, 0, 0.2666667, 1, 1,
0.2930636, -2.031353, 1.820971, 0, 0.2627451, 1, 1,
0.2933294, -1.8747, 3.138454, 0, 0.254902, 1, 1,
0.2949173, 1.18189, 0.2605437, 0, 0.2509804, 1, 1,
0.2962484, -0.4906167, 3.92571, 0, 0.2431373, 1, 1,
0.2981437, -0.4322194, 3.768337, 0, 0.2392157, 1, 1,
0.2984473, -0.1107161, 1.646229, 0, 0.2313726, 1, 1,
0.3032956, 1.727612, 0.2654095, 0, 0.227451, 1, 1,
0.3067922, -0.5144641, 2.024407, 0, 0.2196078, 1, 1,
0.3072391, -1.614829, 1.823929, 0, 0.2156863, 1, 1,
0.3100716, -0.8769819, 3.340355, 0, 0.2078431, 1, 1,
0.3124283, -1.207398, 4.033916, 0, 0.2039216, 1, 1,
0.313004, 0.4938454, -0.9517425, 0, 0.1960784, 1, 1,
0.3242475, 0.2597266, 0.01109434, 0, 0.1882353, 1, 1,
0.3283197, 0.8884513, 0.6344123, 0, 0.1843137, 1, 1,
0.3369558, -0.2554168, 2.168797, 0, 0.1764706, 1, 1,
0.3371773, -0.2577105, 2.97763, 0, 0.172549, 1, 1,
0.3387336, -0.7365695, 3.547853, 0, 0.1647059, 1, 1,
0.343859, -1.110937, 1.994035, 0, 0.1607843, 1, 1,
0.3439233, -0.4312958, 4.11821, 0, 0.1529412, 1, 1,
0.3446474, 0.6039923, 1.219777, 0, 0.1490196, 1, 1,
0.3541455, 0.8058399, 1.349488, 0, 0.1411765, 1, 1,
0.3559705, -0.4829105, 1.170653, 0, 0.1372549, 1, 1,
0.3572773, -0.08612397, 1.89718, 0, 0.1294118, 1, 1,
0.3602741, 0.2267294, 1.806314, 0, 0.1254902, 1, 1,
0.3642035, -1.106129, 2.945919, 0, 0.1176471, 1, 1,
0.3670832, -0.5339496, 4.170648, 0, 0.1137255, 1, 1,
0.3770992, 0.7804006, -0.6010067, 0, 0.1058824, 1, 1,
0.380774, 1.053347, -0.8859857, 0, 0.09803922, 1, 1,
0.3830623, -1.85122, 3.183821, 0, 0.09411765, 1, 1,
0.3886468, 0.8860762, -0.04776287, 0, 0.08627451, 1, 1,
0.3892384, -2.251933, 4.052939, 0, 0.08235294, 1, 1,
0.3936554, 1.141163, -0.1512607, 0, 0.07450981, 1, 1,
0.396432, 0.8847155, 2.24872, 0, 0.07058824, 1, 1,
0.3970536, -0.05760292, 0.9743903, 0, 0.0627451, 1, 1,
0.4005511, 0.2215201, 1.69671, 0, 0.05882353, 1, 1,
0.4010004, -1.160443, 2.758424, 0, 0.05098039, 1, 1,
0.4091155, -1.962889, 2.724262, 0, 0.04705882, 1, 1,
0.4096623, -1.837582, 2.619128, 0, 0.03921569, 1, 1,
0.4109146, 0.725865, 2.181968, 0, 0.03529412, 1, 1,
0.412861, -0.6294245, 1.612141, 0, 0.02745098, 1, 1,
0.415458, -0.3484101, 1.917744, 0, 0.02352941, 1, 1,
0.4286419, 1.279052, 1.514451, 0, 0.01568628, 1, 1,
0.4294208, 0.5157456, -1.545102, 0, 0.01176471, 1, 1,
0.4315893, -1.216729, 1.948307, 0, 0.003921569, 1, 1,
0.4377936, 1.602506, -0.1521802, 0.003921569, 0, 1, 1,
0.4438764, 1.357182, 0.536572, 0.007843138, 0, 1, 1,
0.4451542, -0.7601936, 1.713033, 0.01568628, 0, 1, 1,
0.4500311, 2.140088, 0.9792138, 0.01960784, 0, 1, 1,
0.4521604, 1.920716, -1.323981, 0.02745098, 0, 1, 1,
0.4577392, 0.3964617, 1.136686, 0.03137255, 0, 1, 1,
0.4589838, 0.6093616, 0.6870395, 0.03921569, 0, 1, 1,
0.4606041, 0.799511, -1.14773, 0.04313726, 0, 1, 1,
0.4627361, 2.063422, -0.8169777, 0.05098039, 0, 1, 1,
0.4633676, -1.840561, 2.908276, 0.05490196, 0, 1, 1,
0.4649752, 0.6475767, 1.294444, 0.0627451, 0, 1, 1,
0.4667349, 0.6050099, 0.5045583, 0.06666667, 0, 1, 1,
0.4708032, -0.5361565, 2.384404, 0.07450981, 0, 1, 1,
0.4716127, 0.5134443, 2.125517, 0.07843138, 0, 1, 1,
0.479381, -1.650458, 3.034138, 0.08627451, 0, 1, 1,
0.4816808, 0.5782316, -0.4793828, 0.09019608, 0, 1, 1,
0.4821536, -1.664497, 3.024889, 0.09803922, 0, 1, 1,
0.4821803, -0.06418902, 2.320099, 0.1058824, 0, 1, 1,
0.4834954, -0.5220051, 4.269488, 0.1098039, 0, 1, 1,
0.4845717, -1.135126, 4.401841, 0.1176471, 0, 1, 1,
0.4921907, -1.107628, 2.221229, 0.1215686, 0, 1, 1,
0.4937781, 1.03494, -1.36226, 0.1294118, 0, 1, 1,
0.494575, -0.5994226, 4.841327, 0.1333333, 0, 1, 1,
0.498411, 1.189618, -0.5653028, 0.1411765, 0, 1, 1,
0.4984135, 0.2321775, 2.563148, 0.145098, 0, 1, 1,
0.5020694, 2.468162, 1.607263, 0.1529412, 0, 1, 1,
0.502296, -1.074561, 1.819873, 0.1568628, 0, 1, 1,
0.5025104, 1.020245, 2.09798, 0.1647059, 0, 1, 1,
0.5044463, 1.33231, 0.1233707, 0.1686275, 0, 1, 1,
0.5080722, -1.178567, 1.117805, 0.1764706, 0, 1, 1,
0.5120673, -0.4374155, 0.8722209, 0.1803922, 0, 1, 1,
0.5182224, 0.9395908, 0.4691041, 0.1882353, 0, 1, 1,
0.5187689, -0.1923315, 2.308443, 0.1921569, 0, 1, 1,
0.5252473, -0.4387546, 1.192128, 0.2, 0, 1, 1,
0.5274718, -0.1877631, 1.982573, 0.2078431, 0, 1, 1,
0.5322809, 0.9037794, -1.209643, 0.2117647, 0, 1, 1,
0.5327548, -0.2160141, 2.178384, 0.2196078, 0, 1, 1,
0.5334184, 0.156229, 1.764657, 0.2235294, 0, 1, 1,
0.5364687, -0.5585535, 3.187572, 0.2313726, 0, 1, 1,
0.5383046, -0.4604368, 3.178064, 0.2352941, 0, 1, 1,
0.5397925, -0.4905592, 1.972095, 0.2431373, 0, 1, 1,
0.5424776, -0.5024034, 1.530993, 0.2470588, 0, 1, 1,
0.5466266, 1.078371, 1.290027, 0.254902, 0, 1, 1,
0.5605525, -1.385669, 2.154799, 0.2588235, 0, 1, 1,
0.5623111, -0.9992076, 1.672747, 0.2666667, 0, 1, 1,
0.5674819, 1.10993, 0.6299275, 0.2705882, 0, 1, 1,
0.5793865, -0.5479171, 1.679368, 0.2784314, 0, 1, 1,
0.5810558, -0.9702215, 0.9749231, 0.282353, 0, 1, 1,
0.5815144, -0.2878006, 4.533272, 0.2901961, 0, 1, 1,
0.5863072, 2.322078, -0.5119257, 0.2941177, 0, 1, 1,
0.594344, -0.4439501, 2.756285, 0.3019608, 0, 1, 1,
0.5945472, 0.8763558, 0.6640579, 0.3098039, 0, 1, 1,
0.5955508, 0.6133661, -1.527794, 0.3137255, 0, 1, 1,
0.5997527, -0.9866298, 2.760114, 0.3215686, 0, 1, 1,
0.6000652, 1.333399, 2.019179, 0.3254902, 0, 1, 1,
0.6018714, 0.500142, 0.6346609, 0.3333333, 0, 1, 1,
0.6036236, 0.2465962, 1.526046, 0.3372549, 0, 1, 1,
0.6057479, 0.4632076, 0.511591, 0.345098, 0, 1, 1,
0.6060959, 0.05345536, 3.294019, 0.3490196, 0, 1, 1,
0.6062114, 0.3269928, 1.953247, 0.3568628, 0, 1, 1,
0.6080537, 0.4178452, 0.7583222, 0.3607843, 0, 1, 1,
0.6097823, -0.3516259, 2.442728, 0.3686275, 0, 1, 1,
0.6118559, 1.409623, 0.2550325, 0.372549, 0, 1, 1,
0.6135721, -0.7042531, 1.0662, 0.3803922, 0, 1, 1,
0.6159282, 0.4237253, -0.3398624, 0.3843137, 0, 1, 1,
0.6179019, -0.6984043, 2.45421, 0.3921569, 0, 1, 1,
0.6193194, -0.9161744, 2.536881, 0.3960784, 0, 1, 1,
0.6202281, 0.8445115, 0.4536878, 0.4039216, 0, 1, 1,
0.6208832, 0.1344709, 0.207846, 0.4117647, 0, 1, 1,
0.6248938, -0.1331834, 3.767187, 0.4156863, 0, 1, 1,
0.6260261, 0.7213031, 0.4499937, 0.4235294, 0, 1, 1,
0.6269884, -0.2673281, 2.756552, 0.427451, 0, 1, 1,
0.629191, -0.2345518, 3.342848, 0.4352941, 0, 1, 1,
0.6314185, 0.300826, 0.01030363, 0.4392157, 0, 1, 1,
0.6329699, -0.8317185, 2.203959, 0.4470588, 0, 1, 1,
0.6336711, -0.6059231, 2.657587, 0.4509804, 0, 1, 1,
0.6339297, 1.993796, 1.57634, 0.4588235, 0, 1, 1,
0.63496, -0.205925, 1.411058, 0.4627451, 0, 1, 1,
0.6352937, 0.4858526, 1.27103, 0.4705882, 0, 1, 1,
0.6385083, -2.187593, 1.085052, 0.4745098, 0, 1, 1,
0.6403567, -1.183326, 2.600765, 0.4823529, 0, 1, 1,
0.6416705, -0.2471078, 1.319341, 0.4862745, 0, 1, 1,
0.6426507, -1.110647, 2.081703, 0.4941176, 0, 1, 1,
0.6494699, -0.4495033, 1.601847, 0.5019608, 0, 1, 1,
0.651539, 1.815965, 0.4801948, 0.5058824, 0, 1, 1,
0.6541417, -1.002966, 2.074162, 0.5137255, 0, 1, 1,
0.6590649, 0.5565571, 0.752169, 0.5176471, 0, 1, 1,
0.6616629, 2.217022, 1.763839, 0.5254902, 0, 1, 1,
0.6662159, 2.123669, 0.5344723, 0.5294118, 0, 1, 1,
0.6689337, 0.4168783, 1.237212, 0.5372549, 0, 1, 1,
0.6701778, 1.209366, 0.3368531, 0.5411765, 0, 1, 1,
0.6834205, 0.4505199, 0.6588544, 0.5490196, 0, 1, 1,
0.6834651, -1.055409, 4.245863, 0.5529412, 0, 1, 1,
0.684509, -0.008144193, 4.381786, 0.5607843, 0, 1, 1,
0.6910903, 0.04150632, 2.603453, 0.5647059, 0, 1, 1,
0.6957968, -1.305565, 3.693626, 0.572549, 0, 1, 1,
0.6960735, -1.586753, 3.783616, 0.5764706, 0, 1, 1,
0.696708, -1.180946, 1.801162, 0.5843138, 0, 1, 1,
0.7054919, 0.248228, 1.412292, 0.5882353, 0, 1, 1,
0.7070072, -1.294808, 1.93569, 0.5960785, 0, 1, 1,
0.7111817, -0.7065083, 1.454466, 0.6039216, 0, 1, 1,
0.7164367, 0.5748421, 1.522778, 0.6078432, 0, 1, 1,
0.7187406, 0.1792764, 2.007249, 0.6156863, 0, 1, 1,
0.7239904, 1.142921, 1.667084, 0.6196079, 0, 1, 1,
0.727042, 0.1728613, 2.729506, 0.627451, 0, 1, 1,
0.7294932, -1.654018, 0.578364, 0.6313726, 0, 1, 1,
0.7339819, 0.7812204, 2.391775, 0.6392157, 0, 1, 1,
0.736683, -1.066779, 1.680704, 0.6431373, 0, 1, 1,
0.7371759, 0.2569162, 1.732484, 0.6509804, 0, 1, 1,
0.7387629, -0.377447, 1.456563, 0.654902, 0, 1, 1,
0.7388244, 0.9614194, 0.9576001, 0.6627451, 0, 1, 1,
0.7452202, -2.850937, 3.528191, 0.6666667, 0, 1, 1,
0.7493911, -0.06234953, 0.376986, 0.6745098, 0, 1, 1,
0.7500892, -0.5620809, 2.096575, 0.6784314, 0, 1, 1,
0.7523507, 0.04711171, 1.860794, 0.6862745, 0, 1, 1,
0.7548984, -0.1754261, 2.362149, 0.6901961, 0, 1, 1,
0.7551083, 1.348018, -1.413723, 0.6980392, 0, 1, 1,
0.7553711, -0.1407985, 1.758018, 0.7058824, 0, 1, 1,
0.7602363, -1.004144, 1.656717, 0.7098039, 0, 1, 1,
0.7656558, 0.5531659, 0.5940857, 0.7176471, 0, 1, 1,
0.766244, 1.630296, -0.3010458, 0.7215686, 0, 1, 1,
0.7704323, -1.50871, 2.840841, 0.7294118, 0, 1, 1,
0.7736183, 1.232739, 1.106012, 0.7333333, 0, 1, 1,
0.7764992, -1.459175, 1.072124, 0.7411765, 0, 1, 1,
0.7779544, 0.7774982, -0.8319979, 0.7450981, 0, 1, 1,
0.785646, 0.4485998, 2.783647, 0.7529412, 0, 1, 1,
0.7857199, 0.06527263, 2.500034, 0.7568628, 0, 1, 1,
0.7866679, -1.470851, 1.726751, 0.7647059, 0, 1, 1,
0.7972149, 0.4639812, 1.276329, 0.7686275, 0, 1, 1,
0.7989355, 0.02207397, 1.75504, 0.7764706, 0, 1, 1,
0.8076414, -0.1413998, 0.8614362, 0.7803922, 0, 1, 1,
0.8106139, 1.144901, 0.1902179, 0.7882353, 0, 1, 1,
0.8137193, -1.476345, 2.454402, 0.7921569, 0, 1, 1,
0.8147563, 1.994598, 2.162991, 0.8, 0, 1, 1,
0.8155653, -1.628949, 1.700838, 0.8078431, 0, 1, 1,
0.8188462, -0.1657882, 1.051323, 0.8117647, 0, 1, 1,
0.8210121, 1.863552, 1.908971, 0.8196079, 0, 1, 1,
0.8232325, 0.1746763, 0.7439498, 0.8235294, 0, 1, 1,
0.8277307, -0.2541709, 2.220747, 0.8313726, 0, 1, 1,
0.8341697, -0.1481088, 0.2425339, 0.8352941, 0, 1, 1,
0.8381124, 0.6699588, 1.548779, 0.8431373, 0, 1, 1,
0.8384309, 0.1111006, 2.34765, 0.8470588, 0, 1, 1,
0.8402721, -0.6433858, 2.418121, 0.854902, 0, 1, 1,
0.8440398, -0.6928157, 1.19689, 0.8588235, 0, 1, 1,
0.8472877, 0.5951769, 0.5478258, 0.8666667, 0, 1, 1,
0.8499367, -1.457663, 0.6855363, 0.8705882, 0, 1, 1,
0.8502272, -1.308539, 2.171084, 0.8784314, 0, 1, 1,
0.8519971, -0.6117404, 0.8332916, 0.8823529, 0, 1, 1,
0.8534365, 0.4439883, 0.3379459, 0.8901961, 0, 1, 1,
0.8562871, -0.294749, 0.8528248, 0.8941177, 0, 1, 1,
0.859293, -0.884294, 2.080518, 0.9019608, 0, 1, 1,
0.8606935, 0.147828, 0.02294325, 0.9098039, 0, 1, 1,
0.8643392, 0.8920424, 0.2530918, 0.9137255, 0, 1, 1,
0.8694811, -0.07380079, 1.642083, 0.9215686, 0, 1, 1,
0.8703768, 0.0505083, 1.579946, 0.9254902, 0, 1, 1,
0.8713195, -0.1544959, 2.685637, 0.9333333, 0, 1, 1,
0.8795041, -1.007836, 4.091499, 0.9372549, 0, 1, 1,
0.8796332, -1.608532, 1.373757, 0.945098, 0, 1, 1,
0.88337, 0.6395381, 0.5210909, 0.9490196, 0, 1, 1,
0.8913415, -0.4587792, 2.387708, 0.9568627, 0, 1, 1,
0.8989648, -0.4085139, 2.085306, 0.9607843, 0, 1, 1,
0.8995402, -0.4341081, 1.845436, 0.9686275, 0, 1, 1,
0.9051192, 0.8304865, 1.265576, 0.972549, 0, 1, 1,
0.9065264, -0.4975002, 1.413326, 0.9803922, 0, 1, 1,
0.9102932, -0.7372342, 0.6670145, 0.9843137, 0, 1, 1,
0.9106606, -2.168151, 2.866662, 0.9921569, 0, 1, 1,
0.9210676, -0.1093528, 2.181276, 0.9960784, 0, 1, 1,
0.9232419, -0.6325171, 2.831004, 1, 0, 0.9960784, 1,
0.9297981, 1.084182, -0.9753849, 1, 0, 0.9882353, 1,
0.9345754, -0.9220458, 3.575719, 1, 0, 0.9843137, 1,
0.9361274, 0.9834244, -0.3075092, 1, 0, 0.9764706, 1,
0.9445853, -0.6234678, 1.009299, 1, 0, 0.972549, 1,
0.94888, -0.7435874, 1.342253, 1, 0, 0.9647059, 1,
0.9505114, -0.2990931, 0.277206, 1, 0, 0.9607843, 1,
0.9560022, 0.674627, 1.9688, 1, 0, 0.9529412, 1,
0.9599638, 1.616551, 0.05955365, 1, 0, 0.9490196, 1,
0.9608325, 0.3643346, 1.698698, 1, 0, 0.9411765, 1,
0.966794, 3.364739, 2.719082, 1, 0, 0.9372549, 1,
0.9686278, 0.3418971, 0.5310566, 1, 0, 0.9294118, 1,
0.9757171, -1.784883, 2.527364, 1, 0, 0.9254902, 1,
0.9864821, -0.5022461, 1.769154, 1, 0, 0.9176471, 1,
0.9943519, 0.5565357, 0.8523318, 1, 0, 0.9137255, 1,
1.002524, -0.8811192, 2.115692, 1, 0, 0.9058824, 1,
1.002992, -1.68199, 3.775779, 1, 0, 0.9019608, 1,
1.02069, 0.7465039, 2.595537, 1, 0, 0.8941177, 1,
1.026971, -0.09587039, 0.3409216, 1, 0, 0.8862745, 1,
1.035153, -1.621076, 1.681806, 1, 0, 0.8823529, 1,
1.037135, 0.6198953, -0.159995, 1, 0, 0.8745098, 1,
1.038504, -1.74723, 2.094309, 1, 0, 0.8705882, 1,
1.039118, 1.313363, 0.232054, 1, 0, 0.8627451, 1,
1.04062, 1.641143, -0.3642338, 1, 0, 0.8588235, 1,
1.048386, -0.5531237, 2.357003, 1, 0, 0.8509804, 1,
1.060367, 0.3455441, 0.9736198, 1, 0, 0.8470588, 1,
1.069818, 0.1059941, 0.3858066, 1, 0, 0.8392157, 1,
1.077501, 0.8788553, 1.412245, 1, 0, 0.8352941, 1,
1.090717, -0.8532397, 2.577772, 1, 0, 0.827451, 1,
1.091501, -0.2789619, 1.985703, 1, 0, 0.8235294, 1,
1.09436, 0.8023767, 0.5089108, 1, 0, 0.8156863, 1,
1.101543, 0.06127491, 0.523424, 1, 0, 0.8117647, 1,
1.102568, 0.8327062, 0.9620861, 1, 0, 0.8039216, 1,
1.104895, 0.4316241, -0.119259, 1, 0, 0.7960784, 1,
1.105963, 0.2842751, 2.059719, 1, 0, 0.7921569, 1,
1.106089, 0.954141, 1.067307, 1, 0, 0.7843137, 1,
1.123292, -1.013596, 2.602593, 1, 0, 0.7803922, 1,
1.127583, 0.8298474, 0.6577898, 1, 0, 0.772549, 1,
1.150746, 0.3587303, 3.182059, 1, 0, 0.7686275, 1,
1.152483, -0.4550914, 1.656481, 1, 0, 0.7607843, 1,
1.154261, 1.451147, 0.6964129, 1, 0, 0.7568628, 1,
1.155313, 0.7341671, 1.661305, 1, 0, 0.7490196, 1,
1.155654, -1.814873, 3.595237, 1, 0, 0.7450981, 1,
1.158781, -0.6566237, 0.9746835, 1, 0, 0.7372549, 1,
1.179538, 1.364605, 2.385249, 1, 0, 0.7333333, 1,
1.181425, 2.041501, 0.5731848, 1, 0, 0.7254902, 1,
1.192162, -2.952288, 2.082869, 1, 0, 0.7215686, 1,
1.213156, -0.8455493, 1.569304, 1, 0, 0.7137255, 1,
1.222084, -1.232644, 1.378439, 1, 0, 0.7098039, 1,
1.230464, -0.2528046, 1.138034, 1, 0, 0.7019608, 1,
1.231697, 0.5105152, 0.5481667, 1, 0, 0.6941177, 1,
1.233788, -0.9455935, 0.8227784, 1, 0, 0.6901961, 1,
1.24532, 0.2305063, 1.461357, 1, 0, 0.682353, 1,
1.256428, 0.8661481, 3.195645, 1, 0, 0.6784314, 1,
1.261153, -0.1220378, 2.398292, 1, 0, 0.6705883, 1,
1.269356, -1.291998, 2.867215, 1, 0, 0.6666667, 1,
1.279041, 0.4931585, 1.061363, 1, 0, 0.6588235, 1,
1.284282, -0.4435709, 2.647269, 1, 0, 0.654902, 1,
1.286006, 0.3080025, 2.474336, 1, 0, 0.6470588, 1,
1.287301, -1.009619, 1.568001, 1, 0, 0.6431373, 1,
1.288854, 0.5165396, 0.3304463, 1, 0, 0.6352941, 1,
1.295856, 0.123282, -0.5766968, 1, 0, 0.6313726, 1,
1.306687, 0.7038155, 1.46735, 1, 0, 0.6235294, 1,
1.306924, 0.2609178, 2.661495, 1, 0, 0.6196079, 1,
1.30898, -0.2411407, 2.073744, 1, 0, 0.6117647, 1,
1.312548, 0.604747, 0.9601055, 1, 0, 0.6078432, 1,
1.333508, -0.3008137, 1.722236, 1, 0, 0.6, 1,
1.334099, -0.010652, 1.495975, 1, 0, 0.5921569, 1,
1.33975, 0.1962183, 0.7299348, 1, 0, 0.5882353, 1,
1.341651, 2.42878, 0.0001809519, 1, 0, 0.5803922, 1,
1.342603, 0.02475606, 2.16958, 1, 0, 0.5764706, 1,
1.352268, 1.186497, 1.852202, 1, 0, 0.5686275, 1,
1.355404, -1.119851, 2.995724, 1, 0, 0.5647059, 1,
1.358028, 0.7203317, -0.6712705, 1, 0, 0.5568628, 1,
1.361565, -0.1991924, 1.431327, 1, 0, 0.5529412, 1,
1.365387, -0.09068848, 1.561618, 1, 0, 0.5450981, 1,
1.376995, -0.2189444, 0.9908722, 1, 0, 0.5411765, 1,
1.380593, 0.77327, -1.581782, 1, 0, 0.5333334, 1,
1.3812, 0.003629387, -0.6574615, 1, 0, 0.5294118, 1,
1.38832, 1.064783, 1.583364, 1, 0, 0.5215687, 1,
1.391949, 1.151567, 2.094132, 1, 0, 0.5176471, 1,
1.403133, -0.9075968, 1.731013, 1, 0, 0.509804, 1,
1.405341, -0.3549181, 2.189517, 1, 0, 0.5058824, 1,
1.408405, 2.252568, 2.225299, 1, 0, 0.4980392, 1,
1.410139, 0.3040359, 0.4980219, 1, 0, 0.4901961, 1,
1.412743, -0.938806, 2.214372, 1, 0, 0.4862745, 1,
1.417902, 0.05648633, 0.6174899, 1, 0, 0.4784314, 1,
1.420745, -0.8828672, 2.843763, 1, 0, 0.4745098, 1,
1.433088, -0.8607215, 1.797568, 1, 0, 0.4666667, 1,
1.464089, -0.700009, 1.009818, 1, 0, 0.4627451, 1,
1.471291, -0.9773568, 1.511441, 1, 0, 0.454902, 1,
1.476543, 0.9399936, 1.01948, 1, 0, 0.4509804, 1,
1.483891, 0.3652034, 1.547244, 1, 0, 0.4431373, 1,
1.490517, 0.1963142, 2.417189, 1, 0, 0.4392157, 1,
1.504501, -1.390276, 0.9437969, 1, 0, 0.4313726, 1,
1.509733, -0.2773409, 1.784939, 1, 0, 0.427451, 1,
1.515352, 1.416515, -0.885434, 1, 0, 0.4196078, 1,
1.523136, -0.9436423, 1.373448, 1, 0, 0.4156863, 1,
1.523579, 1.627067, -0.8643162, 1, 0, 0.4078431, 1,
1.533218, -0.6112651, 3.005417, 1, 0, 0.4039216, 1,
1.546921, -0.03260227, 1.513869, 1, 0, 0.3960784, 1,
1.547272, -1.446321, 1.957663, 1, 0, 0.3882353, 1,
1.563085, -0.2407806, 1.399438, 1, 0, 0.3843137, 1,
1.577553, 2.098471, -0.0002617144, 1, 0, 0.3764706, 1,
1.58651, 0.4486076, -0.162534, 1, 0, 0.372549, 1,
1.59785, -0.5235614, 0.7753406, 1, 0, 0.3647059, 1,
1.62837, 0.02756633, -0.9516255, 1, 0, 0.3607843, 1,
1.6386, -1.367721, 1.246475, 1, 0, 0.3529412, 1,
1.645244, 0.2505772, 0.5886618, 1, 0, 0.3490196, 1,
1.656525, -0.1648057, 3.878696, 1, 0, 0.3411765, 1,
1.671146, -1.589113, 2.743369, 1, 0, 0.3372549, 1,
1.682107, 1.23502, -0.2234586, 1, 0, 0.3294118, 1,
1.685162, -0.6577942, 3.745673, 1, 0, 0.3254902, 1,
1.692289, 0.3118531, 0.9224271, 1, 0, 0.3176471, 1,
1.694469, 0.5661985, 0.6396536, 1, 0, 0.3137255, 1,
1.699134, -0.3119136, 1.191793, 1, 0, 0.3058824, 1,
1.700038, 0.2702616, 3.268118, 1, 0, 0.2980392, 1,
1.714853, -0.3346118, 1.225712, 1, 0, 0.2941177, 1,
1.715028, -0.995754, 1.013451, 1, 0, 0.2862745, 1,
1.718916, -0.4509145, 3.025415, 1, 0, 0.282353, 1,
1.720045, 1.035788, 2.35601, 1, 0, 0.2745098, 1,
1.730986, -1.20368, 2.478491, 1, 0, 0.2705882, 1,
1.744445, -1.056114, 1.904723, 1, 0, 0.2627451, 1,
1.759829, -0.07334202, 1.409399, 1, 0, 0.2588235, 1,
1.772436, -0.7540049, 2.631044, 1, 0, 0.2509804, 1,
1.774816, -0.6193578, 1.092066, 1, 0, 0.2470588, 1,
1.820169, -1.235858, 3.376629, 1, 0, 0.2392157, 1,
1.850044, 0.9141307, 2.861625, 1, 0, 0.2352941, 1,
1.855388, 1.791919, -0.3726007, 1, 0, 0.227451, 1,
1.866544, -0.3050881, 1.035686, 1, 0, 0.2235294, 1,
1.951419, 0.7496907, 0.1850935, 1, 0, 0.2156863, 1,
1.954952, -0.1365465, 2.137444, 1, 0, 0.2117647, 1,
1.956427, 0.4286217, 0.9414018, 1, 0, 0.2039216, 1,
1.959424, 0.49938, 2.633097, 1, 0, 0.1960784, 1,
2.001746, 0.09538193, 1.655728, 1, 0, 0.1921569, 1,
2.019638, 0.83703, 3.372773, 1, 0, 0.1843137, 1,
2.024609, -1.001244, 1.529541, 1, 0, 0.1803922, 1,
2.02515, 0.5684009, 0.01222302, 1, 0, 0.172549, 1,
2.025167, 0.3797221, 1.913405, 1, 0, 0.1686275, 1,
2.106806, -0.9859358, 2.080648, 1, 0, 0.1607843, 1,
2.119856, 0.5556709, 0.176227, 1, 0, 0.1568628, 1,
2.133867, -0.05989314, 1.08803, 1, 0, 0.1490196, 1,
2.153138, 0.3231055, 1.709562, 1, 0, 0.145098, 1,
2.167017, -1.67435, 2.469954, 1, 0, 0.1372549, 1,
2.209313, 0.2045597, 0.3105549, 1, 0, 0.1333333, 1,
2.239186, 0.1466563, 2.584466, 1, 0, 0.1254902, 1,
2.255346, -0.2721256, 1.674567, 1, 0, 0.1215686, 1,
2.296997, 0.8348484, 2.396038, 1, 0, 0.1137255, 1,
2.371364, 0.6102941, -0.02612339, 1, 0, 0.1098039, 1,
2.432446, -0.552974, -0.2933364, 1, 0, 0.1019608, 1,
2.436, -1.299614, 2.290474, 1, 0, 0.09411765, 1,
2.441847, -1.127435, 2.108966, 1, 0, 0.09019608, 1,
2.450623, -1.254756, 3.256174, 1, 0, 0.08235294, 1,
2.458328, -0.953633, 4.014647, 1, 0, 0.07843138, 1,
2.505298, -0.6096416, 2.381846, 1, 0, 0.07058824, 1,
2.527198, -1.349299, 2.047701, 1, 0, 0.06666667, 1,
2.600471, -0.4672987, 3.005827, 1, 0, 0.05882353, 1,
2.604842, 0.05066286, 1.81455, 1, 0, 0.05490196, 1,
2.664452, -1.063246, 2.209407, 1, 0, 0.04705882, 1,
2.703745, 0.3558529, 0.8846861, 1, 0, 0.04313726, 1,
2.71532, -2.038481, 4.509681, 1, 0, 0.03529412, 1,
2.77729, -0.5497331, 3.762138, 1, 0, 0.03137255, 1,
3.002572, -2.236991, 3.079146, 1, 0, 0.02352941, 1,
3.088164, -0.8727616, 1.971253, 1, 0, 0.01960784, 1,
3.098503, 0.6656076, 2.73269, 1, 0, 0.01176471, 1,
3.107211, 0.8807275, 0.2490661, 1, 0, 0.007843138, 1
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
0.05908906, -4.602085, -6.533503, 0, -0.5, 0.5, 0.5,
0.05908906, -4.602085, -6.533503, 1, -0.5, 0.5, 0.5,
0.05908906, -4.602085, -6.533503, 1, 1.5, 0.5, 0.5,
0.05908906, -4.602085, -6.533503, 0, 1.5, 0.5, 0.5
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
-4.022346, -0.04134202, -6.533503, 0, -0.5, 0.5, 0.5,
-4.022346, -0.04134202, -6.533503, 1, -0.5, 0.5, 0.5,
-4.022346, -0.04134202, -6.533503, 1, 1.5, 0.5, 0.5,
-4.022346, -0.04134202, -6.533503, 0, 1.5, 0.5, 0.5
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
-4.022346, -4.602085, 0.1890123, 0, -0.5, 0.5, 0.5,
-4.022346, -4.602085, 0.1890123, 1, -0.5, 0.5, 0.5,
-4.022346, -4.602085, 0.1890123, 1, 1.5, 0.5, 0.5,
-4.022346, -4.602085, 0.1890123, 0, 1.5, 0.5, 0.5
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
-2, -3.549606, -4.982153,
3, -3.549606, -4.982153,
-2, -3.549606, -4.982153,
-2, -3.725019, -5.240712,
-1, -3.549606, -4.982153,
-1, -3.725019, -5.240712,
0, -3.549606, -4.982153,
0, -3.725019, -5.240712,
1, -3.549606, -4.982153,
1, -3.725019, -5.240712,
2, -3.549606, -4.982153,
2, -3.725019, -5.240712,
3, -3.549606, -4.982153,
3, -3.725019, -5.240712
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
-2, -4.075846, -5.757828, 0, -0.5, 0.5, 0.5,
-2, -4.075846, -5.757828, 1, -0.5, 0.5, 0.5,
-2, -4.075846, -5.757828, 1, 1.5, 0.5, 0.5,
-2, -4.075846, -5.757828, 0, 1.5, 0.5, 0.5,
-1, -4.075846, -5.757828, 0, -0.5, 0.5, 0.5,
-1, -4.075846, -5.757828, 1, -0.5, 0.5, 0.5,
-1, -4.075846, -5.757828, 1, 1.5, 0.5, 0.5,
-1, -4.075846, -5.757828, 0, 1.5, 0.5, 0.5,
0, -4.075846, -5.757828, 0, -0.5, 0.5, 0.5,
0, -4.075846, -5.757828, 1, -0.5, 0.5, 0.5,
0, -4.075846, -5.757828, 1, 1.5, 0.5, 0.5,
0, -4.075846, -5.757828, 0, 1.5, 0.5, 0.5,
1, -4.075846, -5.757828, 0, -0.5, 0.5, 0.5,
1, -4.075846, -5.757828, 1, -0.5, 0.5, 0.5,
1, -4.075846, -5.757828, 1, 1.5, 0.5, 0.5,
1, -4.075846, -5.757828, 0, 1.5, 0.5, 0.5,
2, -4.075846, -5.757828, 0, -0.5, 0.5, 0.5,
2, -4.075846, -5.757828, 1, -0.5, 0.5, 0.5,
2, -4.075846, -5.757828, 1, 1.5, 0.5, 0.5,
2, -4.075846, -5.757828, 0, 1.5, 0.5, 0.5,
3, -4.075846, -5.757828, 0, -0.5, 0.5, 0.5,
3, -4.075846, -5.757828, 1, -0.5, 0.5, 0.5,
3, -4.075846, -5.757828, 1, 1.5, 0.5, 0.5,
3, -4.075846, -5.757828, 0, 1.5, 0.5, 0.5
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
-3.080476, -3, -4.982153,
-3.080476, 3, -4.982153,
-3.080476, -3, -4.982153,
-3.237455, -3, -5.240712,
-3.080476, -2, -4.982153,
-3.237455, -2, -5.240712,
-3.080476, -1, -4.982153,
-3.237455, -1, -5.240712,
-3.080476, 0, -4.982153,
-3.237455, 0, -5.240712,
-3.080476, 1, -4.982153,
-3.237455, 1, -5.240712,
-3.080476, 2, -4.982153,
-3.237455, 2, -5.240712,
-3.080476, 3, -4.982153,
-3.237455, 3, -5.240712
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
-3.551411, -3, -5.757828, 0, -0.5, 0.5, 0.5,
-3.551411, -3, -5.757828, 1, -0.5, 0.5, 0.5,
-3.551411, -3, -5.757828, 1, 1.5, 0.5, 0.5,
-3.551411, -3, -5.757828, 0, 1.5, 0.5, 0.5,
-3.551411, -2, -5.757828, 0, -0.5, 0.5, 0.5,
-3.551411, -2, -5.757828, 1, -0.5, 0.5, 0.5,
-3.551411, -2, -5.757828, 1, 1.5, 0.5, 0.5,
-3.551411, -2, -5.757828, 0, 1.5, 0.5, 0.5,
-3.551411, -1, -5.757828, 0, -0.5, 0.5, 0.5,
-3.551411, -1, -5.757828, 1, -0.5, 0.5, 0.5,
-3.551411, -1, -5.757828, 1, 1.5, 0.5, 0.5,
-3.551411, -1, -5.757828, 0, 1.5, 0.5, 0.5,
-3.551411, 0, -5.757828, 0, -0.5, 0.5, 0.5,
-3.551411, 0, -5.757828, 1, -0.5, 0.5, 0.5,
-3.551411, 0, -5.757828, 1, 1.5, 0.5, 0.5,
-3.551411, 0, -5.757828, 0, 1.5, 0.5, 0.5,
-3.551411, 1, -5.757828, 0, -0.5, 0.5, 0.5,
-3.551411, 1, -5.757828, 1, -0.5, 0.5, 0.5,
-3.551411, 1, -5.757828, 1, 1.5, 0.5, 0.5,
-3.551411, 1, -5.757828, 0, 1.5, 0.5, 0.5,
-3.551411, 2, -5.757828, 0, -0.5, 0.5, 0.5,
-3.551411, 2, -5.757828, 1, -0.5, 0.5, 0.5,
-3.551411, 2, -5.757828, 1, 1.5, 0.5, 0.5,
-3.551411, 2, -5.757828, 0, 1.5, 0.5, 0.5,
-3.551411, 3, -5.757828, 0, -0.5, 0.5, 0.5,
-3.551411, 3, -5.757828, 1, -0.5, 0.5, 0.5,
-3.551411, 3, -5.757828, 1, 1.5, 0.5, 0.5,
-3.551411, 3, -5.757828, 0, 1.5, 0.5, 0.5
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
-3.080476, -3.549606, -4,
-3.080476, -3.549606, 4,
-3.080476, -3.549606, -4,
-3.237455, -3.725019, -4,
-3.080476, -3.549606, -2,
-3.237455, -3.725019, -2,
-3.080476, -3.549606, 0,
-3.237455, -3.725019, 0,
-3.080476, -3.549606, 2,
-3.237455, -3.725019, 2,
-3.080476, -3.549606, 4,
-3.237455, -3.725019, 4
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
-3.551411, -4.075846, -4, 0, -0.5, 0.5, 0.5,
-3.551411, -4.075846, -4, 1, -0.5, 0.5, 0.5,
-3.551411, -4.075846, -4, 1, 1.5, 0.5, 0.5,
-3.551411, -4.075846, -4, 0, 1.5, 0.5, 0.5,
-3.551411, -4.075846, -2, 0, -0.5, 0.5, 0.5,
-3.551411, -4.075846, -2, 1, -0.5, 0.5, 0.5,
-3.551411, -4.075846, -2, 1, 1.5, 0.5, 0.5,
-3.551411, -4.075846, -2, 0, 1.5, 0.5, 0.5,
-3.551411, -4.075846, 0, 0, -0.5, 0.5, 0.5,
-3.551411, -4.075846, 0, 1, -0.5, 0.5, 0.5,
-3.551411, -4.075846, 0, 1, 1.5, 0.5, 0.5,
-3.551411, -4.075846, 0, 0, 1.5, 0.5, 0.5,
-3.551411, -4.075846, 2, 0, -0.5, 0.5, 0.5,
-3.551411, -4.075846, 2, 1, -0.5, 0.5, 0.5,
-3.551411, -4.075846, 2, 1, 1.5, 0.5, 0.5,
-3.551411, -4.075846, 2, 0, 1.5, 0.5, 0.5,
-3.551411, -4.075846, 4, 0, -0.5, 0.5, 0.5,
-3.551411, -4.075846, 4, 1, -0.5, 0.5, 0.5,
-3.551411, -4.075846, 4, 1, 1.5, 0.5, 0.5,
-3.551411, -4.075846, 4, 0, 1.5, 0.5, 0.5
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
-3.080476, -3.549606, -4.982153,
-3.080476, 3.466922, -4.982153,
-3.080476, -3.549606, 5.360178,
-3.080476, 3.466922, 5.360178,
-3.080476, -3.549606, -4.982153,
-3.080476, -3.549606, 5.360178,
-3.080476, 3.466922, -4.982153,
-3.080476, 3.466922, 5.360178,
-3.080476, -3.549606, -4.982153,
3.198654, -3.549606, -4.982153,
-3.080476, -3.549606, 5.360178,
3.198654, -3.549606, 5.360178,
-3.080476, 3.466922, -4.982153,
3.198654, 3.466922, -4.982153,
-3.080476, 3.466922, 5.360178,
3.198654, 3.466922, 5.360178,
3.198654, -3.549606, -4.982153,
3.198654, 3.466922, -4.982153,
3.198654, -3.549606, 5.360178,
3.198654, 3.466922, 5.360178,
3.198654, -3.549606, -4.982153,
3.198654, -3.549606, 5.360178,
3.198654, 3.466922, -4.982153,
3.198654, 3.466922, 5.360178
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
var radius = 7.468534;
var distance = 33.22835;
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
mvMatrix.translate( -0.05908906, 0.04134202, -0.1890123 );
mvMatrix.scale( 1.286026, 1.150872, 0.7807839 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.22835);
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
phosphorine<-read.table("phosphorine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosphorine$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphorine' not found
```

```r
y<-phosphorine$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphorine' not found
```

```r
z<-phosphorine$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphorine' not found
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
-2.989033, 0.07072458, -0.5136099, 0, 0, 1, 1, 1,
-2.917749, -1.96376, -2.152248, 1, 0, 0, 1, 1,
-2.85633, -1.599756, -2.452491, 1, 0, 0, 1, 1,
-2.827183, 0.8660788, -1.562911, 1, 0, 0, 1, 1,
-2.82042, -1.833422, -1.567622, 1, 0, 0, 1, 1,
-2.659383, 0.3489042, -2.298021, 1, 0, 0, 1, 1,
-2.652995, -1.315692, -2.440659, 0, 0, 0, 1, 1,
-2.589046, -0.8365976, -3.078598, 0, 0, 0, 1, 1,
-2.529451, -0.1806094, -0.2842121, 0, 0, 0, 1, 1,
-2.466681, 1.297377, 0.5761212, 0, 0, 0, 1, 1,
-2.456028, -1.268268, 0.2658871, 0, 0, 0, 1, 1,
-2.294087, 1.272086, -1.676559, 0, 0, 0, 1, 1,
-2.218787, -0.08725321, -2.454224, 0, 0, 0, 1, 1,
-2.200799, 0.3110086, -0.9419467, 1, 1, 1, 1, 1,
-2.194715, 0.4792984, -0.01307259, 1, 1, 1, 1, 1,
-2.178335, 0.9211244, -1.895821, 1, 1, 1, 1, 1,
-2.164641, -0.1843094, -0.5635699, 1, 1, 1, 1, 1,
-2.16086, 0.4121754, -0.008698259, 1, 1, 1, 1, 1,
-2.152583, -0.7789774, -1.387373, 1, 1, 1, 1, 1,
-2.152282, -1.057754, -2.145331, 1, 1, 1, 1, 1,
-2.118443, 0.1141691, -1.144363, 1, 1, 1, 1, 1,
-2.059081, -0.6364895, -2.948289, 1, 1, 1, 1, 1,
-2.0522, 0.1055555, -3.464684, 1, 1, 1, 1, 1,
-2.051458, -0.01524362, -3.449435, 1, 1, 1, 1, 1,
-2.044889, -1.220626, -2.818836, 1, 1, 1, 1, 1,
-2.038578, 0.9106354, -2.15335, 1, 1, 1, 1, 1,
-2.010199, 0.3156567, -2.854421, 1, 1, 1, 1, 1,
-1.996741, -1.47124, -2.324938, 1, 1, 1, 1, 1,
-1.959494, 1.124583, -1.513757, 0, 0, 1, 1, 1,
-1.956059, -0.3157113, -1.092098, 1, 0, 0, 1, 1,
-1.949959, 2.057826, -1.658428, 1, 0, 0, 1, 1,
-1.9386, -0.2538502, -2.415862, 1, 0, 0, 1, 1,
-1.935082, -0.2311334, -1.801442, 1, 0, 0, 1, 1,
-1.921299, 0.3619902, -2.003059, 1, 0, 0, 1, 1,
-1.906466, 0.7544662, -1.136221, 0, 0, 0, 1, 1,
-1.9038, 1.149314, -0.8896206, 0, 0, 0, 1, 1,
-1.90108, -0.02653051, -2.20306, 0, 0, 0, 1, 1,
-1.894554, -3.056703, -2.758317, 0, 0, 0, 1, 1,
-1.860803, -0.3721974, -1.779401, 0, 0, 0, 1, 1,
-1.860365, -1.355006, -2.091022, 0, 0, 0, 1, 1,
-1.836489, -0.1293544, -2.06784, 0, 0, 0, 1, 1,
-1.811936, -1.350467, -0.7639984, 1, 1, 1, 1, 1,
-1.810352, 0.3778528, -1.533466, 1, 1, 1, 1, 1,
-1.806126, -2.373609, -2.48648, 1, 1, 1, 1, 1,
-1.797651, 2.37992, 0.4098885, 1, 1, 1, 1, 1,
-1.794804, -1.555465, -2.808371, 1, 1, 1, 1, 1,
-1.781957, -0.6636122, -1.749085, 1, 1, 1, 1, 1,
-1.772903, 0.09414887, -3.706929, 1, 1, 1, 1, 1,
-1.762446, -1.120111, -1.914035, 1, 1, 1, 1, 1,
-1.762386, -0.3549696, -2.031526, 1, 1, 1, 1, 1,
-1.755046, -1.280668, -1.394478, 1, 1, 1, 1, 1,
-1.742856, -1.364194, -1.592728, 1, 1, 1, 1, 1,
-1.717742, -0.8448843, -2.407132, 1, 1, 1, 1, 1,
-1.701983, 0.2809025, -2.007051, 1, 1, 1, 1, 1,
-1.701544, 0.5674213, -0.9540151, 1, 1, 1, 1, 1,
-1.669557, 2.140865, -2.277426, 1, 1, 1, 1, 1,
-1.661515, -0.09294491, -1.260042, 0, 0, 1, 1, 1,
-1.657338, 0.573412, -0.1687839, 1, 0, 0, 1, 1,
-1.64923, 0.7084984, -3.04766, 1, 0, 0, 1, 1,
-1.639847, 0.780533, -1.245615, 1, 0, 0, 1, 1,
-1.63413, -0.6266849, -1.213736, 1, 0, 0, 1, 1,
-1.602485, -1.364067, -3.097447, 1, 0, 0, 1, 1,
-1.601362, 1.503335, -2.354074, 0, 0, 0, 1, 1,
-1.586525, -1.820246, -1.897793, 0, 0, 0, 1, 1,
-1.576459, -0.1926578, -3.702771, 0, 0, 0, 1, 1,
-1.574373, -0.8483229, -1.682684, 0, 0, 0, 1, 1,
-1.57123, -0.4944741, -2.253639, 0, 0, 0, 1, 1,
-1.571194, -1.445751, -2.175437, 0, 0, 0, 1, 1,
-1.552145, -0.2615373, -3.77467, 0, 0, 0, 1, 1,
-1.512478, -0.02784084, -1.709687, 1, 1, 1, 1, 1,
-1.501326, -1.399719, -2.334392, 1, 1, 1, 1, 1,
-1.498095, -0.5792474, -0.6745628, 1, 1, 1, 1, 1,
-1.496427, -0.8041941, -1.866059, 1, 1, 1, 1, 1,
-1.485002, -0.5609536, 0.0178292, 1, 1, 1, 1, 1,
-1.482711, -0.2653924, -1.668036, 1, 1, 1, 1, 1,
-1.478656, 0.3772638, -2.053405, 1, 1, 1, 1, 1,
-1.468468, -0.154546, -2.732075, 1, 1, 1, 1, 1,
-1.463945, -1.475383, -2.708117, 1, 1, 1, 1, 1,
-1.450232, -1.785931, -3.089698, 1, 1, 1, 1, 1,
-1.448465, -1.01554, -1.391943, 1, 1, 1, 1, 1,
-1.434502, -0.1151386, -1.264974, 1, 1, 1, 1, 1,
-1.433355, -0.1109036, -2.242723, 1, 1, 1, 1, 1,
-1.428353, 0.4293132, -2.461633, 1, 1, 1, 1, 1,
-1.427285, -0.8504243, -2.169229, 1, 1, 1, 1, 1,
-1.424697, -0.429567, -1.951048, 0, 0, 1, 1, 1,
-1.400927, 0.04129876, -0.7547722, 1, 0, 0, 1, 1,
-1.398609, -0.434288, -2.555348, 1, 0, 0, 1, 1,
-1.393336, 0.2782803, -2.123401, 1, 0, 0, 1, 1,
-1.390145, -0.8723052, -1.052894, 1, 0, 0, 1, 1,
-1.3798, -0.3478743, -2.286478, 1, 0, 0, 1, 1,
-1.377488, -0.8151587, -0.4447888, 0, 0, 0, 1, 1,
-1.374804, 0.9059582, -0.8193131, 0, 0, 0, 1, 1,
-1.363096, -1.248303, -2.157389, 0, 0, 0, 1, 1,
-1.358463, -0.09645957, -2.705488, 0, 0, 0, 1, 1,
-1.348778, 1.66599, -2.574928, 0, 0, 0, 1, 1,
-1.344741, -0.4911464, -1.253694, 0, 0, 0, 1, 1,
-1.339383, 0.7651522, 0.1936958, 0, 0, 0, 1, 1,
-1.338405, 1.018645, -1.218075, 1, 1, 1, 1, 1,
-1.338167, 0.05023019, -2.885609, 1, 1, 1, 1, 1,
-1.328206, 0.245047, 0.3387672, 1, 1, 1, 1, 1,
-1.327224, -0.2071327, -0.8540034, 1, 1, 1, 1, 1,
-1.319686, 1.378351, 0.3571065, 1, 1, 1, 1, 1,
-1.304908, 0.6931862, -1.770933, 1, 1, 1, 1, 1,
-1.297972, -1.138327, -2.939404, 1, 1, 1, 1, 1,
-1.294074, 0.3322454, -1.858868, 1, 1, 1, 1, 1,
-1.292381, -0.734297, -2.095706, 1, 1, 1, 1, 1,
-1.287518, -0.7111559, -2.394134, 1, 1, 1, 1, 1,
-1.28221, 1.128942, 0.2552448, 1, 1, 1, 1, 1,
-1.278399, -1.526075, -1.964163, 1, 1, 1, 1, 1,
-1.278384, 0.06774365, -1.939349, 1, 1, 1, 1, 1,
-1.277626, -0.1221914, -2.50139, 1, 1, 1, 1, 1,
-1.276577, 1.491416, -0.6234593, 1, 1, 1, 1, 1,
-1.27252, 0.5142547, -1.751073, 0, 0, 1, 1, 1,
-1.27178, -0.007397742, -4.036908, 1, 0, 0, 1, 1,
-1.271482, 2.861776, -0.6192023, 1, 0, 0, 1, 1,
-1.25876, -0.5787073, -2.463758, 1, 0, 0, 1, 1,
-1.254216, 1.328608, -1.833167, 1, 0, 0, 1, 1,
-1.249661, -0.2598151, -2.073832, 1, 0, 0, 1, 1,
-1.248965, 1.014352, -1.498491, 0, 0, 0, 1, 1,
-1.248349, -0.5601251, -2.585174, 0, 0, 0, 1, 1,
-1.236095, -0.07651589, -3.052591, 0, 0, 0, 1, 1,
-1.231035, -0.7095739, -2.653971, 0, 0, 0, 1, 1,
-1.224494, 0.886806, 0.1540232, 0, 0, 0, 1, 1,
-1.223162, 0.05115952, -1.6195, 0, 0, 0, 1, 1,
-1.219494, 0.2188438, -2.298109, 0, 0, 0, 1, 1,
-1.198174, 0.04791059, -0.623437, 1, 1, 1, 1, 1,
-1.19795, 1.626064, -1.380385, 1, 1, 1, 1, 1,
-1.192566, -0.4168393, -3.104634, 1, 1, 1, 1, 1,
-1.184079, 0.003096107, -3.150604, 1, 1, 1, 1, 1,
-1.182311, 0.6738284, -0.194196, 1, 1, 1, 1, 1,
-1.181995, 0.1038458, -0.5173883, 1, 1, 1, 1, 1,
-1.179407, -0.7534815, -1.167777, 1, 1, 1, 1, 1,
-1.172772, 2.299896, 0.5912584, 1, 1, 1, 1, 1,
-1.171753, 0.4568984, -0.9199345, 1, 1, 1, 1, 1,
-1.167824, 0.6716794, -2.005843, 1, 1, 1, 1, 1,
-1.164824, -1.794007, -3.183137, 1, 1, 1, 1, 1,
-1.157806, 0.4500908, 0.2195628, 1, 1, 1, 1, 1,
-1.142361, -0.6497472, -2.052753, 1, 1, 1, 1, 1,
-1.136499, 1.362151, -1.072113, 1, 1, 1, 1, 1,
-1.133755, -1.068209, -1.014688, 1, 1, 1, 1, 1,
-1.1315, 0.5201501, -0.4665824, 0, 0, 1, 1, 1,
-1.12828, -0.0541842, -1.181919, 1, 0, 0, 1, 1,
-1.125133, -0.3026715, -3.58954, 1, 0, 0, 1, 1,
-1.120343, 0.5945259, -1.085495, 1, 0, 0, 1, 1,
-1.111733, 0.4716219, -0.6079723, 1, 0, 0, 1, 1,
-1.110585, 0.3523375, -1.645022, 1, 0, 0, 1, 1,
-1.109887, 1.381335, -1.586462, 0, 0, 0, 1, 1,
-1.099226, -0.04921678, -0.2563326, 0, 0, 0, 1, 1,
-1.097199, 0.3866315, -1.41828, 0, 0, 0, 1, 1,
-1.096837, 1.298237, -0.4320327, 0, 0, 0, 1, 1,
-1.094544, 0.5552529, -0.410772, 0, 0, 0, 1, 1,
-1.088407, -0.3008762, -1.343914, 0, 0, 0, 1, 1,
-1.081364, 1.026616, -0.5600618, 0, 0, 0, 1, 1,
-1.07726, 0.03542372, -1.380967, 1, 1, 1, 1, 1,
-1.076397, -0.9668758, -2.94601, 1, 1, 1, 1, 1,
-1.075745, 0.2367433, -2.060821, 1, 1, 1, 1, 1,
-1.073226, 1.313938, -0.3231407, 1, 1, 1, 1, 1,
-1.068349, -0.2466407, -1.163801, 1, 1, 1, 1, 1,
-1.065862, -1.085448, -3.976141, 1, 1, 1, 1, 1,
-1.063054, 1.82938, -1.386694, 1, 1, 1, 1, 1,
-1.055358, 0.7104999, -2.111085, 1, 1, 1, 1, 1,
-1.052495, 0.03794865, -2.138842, 1, 1, 1, 1, 1,
-1.05117, 0.3720944, -1.134349, 1, 1, 1, 1, 1,
-1.04334, -0.7325629, -1.925455, 1, 1, 1, 1, 1,
-1.037874, 2.399882, -0.8217133, 1, 1, 1, 1, 1,
-1.029199, -2.017853, -2.602547, 1, 1, 1, 1, 1,
-1.027199, -0.03572255, -1.71809, 1, 1, 1, 1, 1,
-1.025255, -0.1936708, -1.352196, 1, 1, 1, 1, 1,
-1.024171, -0.02198405, -1.362376, 0, 0, 1, 1, 1,
-1.017586, -0.2634837, -2.411665, 1, 0, 0, 1, 1,
-1.013374, -0.4381797, -2.64341, 1, 0, 0, 1, 1,
-1.01194, 0.175197, -1.576756, 1, 0, 0, 1, 1,
-1.010845, -0.869936, -3.067073, 1, 0, 0, 1, 1,
-1.000499, -2.548761, -2.436198, 1, 0, 0, 1, 1,
-0.9975194, 0.6800138, -1.743391, 0, 0, 0, 1, 1,
-0.9972023, 2.321445, -2.148614, 0, 0, 0, 1, 1,
-0.9959344, 0.1418937, -0.226254, 0, 0, 0, 1, 1,
-0.9940823, 0.4328762, 0.2333488, 0, 0, 0, 1, 1,
-0.9922488, -2.141181, -0.5972431, 0, 0, 0, 1, 1,
-0.9861853, -1.011891, -3.461375, 0, 0, 0, 1, 1,
-0.9763679, -0.02237261, -0.8903187, 0, 0, 0, 1, 1,
-0.9730435, 0.01249161, -1.35134, 1, 1, 1, 1, 1,
-0.9697717, 1.672264, -0.2101872, 1, 1, 1, 1, 1,
-0.9680392, 0.9042617, -0.9022465, 1, 1, 1, 1, 1,
-0.9591025, -0.1776423, -2.636511, 1, 1, 1, 1, 1,
-0.957279, -0.4733946, -2.708673, 1, 1, 1, 1, 1,
-0.9568496, 1.6092, -0.4309623, 1, 1, 1, 1, 1,
-0.9515268, 1.397547, 0.04266526, 1, 1, 1, 1, 1,
-0.9451732, -0.5858761, -1.290024, 1, 1, 1, 1, 1,
-0.9431235, 1.783248, 0.239045, 1, 1, 1, 1, 1,
-0.9395289, 0.1863292, -0.938293, 1, 1, 1, 1, 1,
-0.9258842, 0.2728884, -0.4846487, 1, 1, 1, 1, 1,
-0.9232877, -1.095175, -3.239871, 1, 1, 1, 1, 1,
-0.9173214, -1.271264, -2.523986, 1, 1, 1, 1, 1,
-0.9127349, -0.5541781, -0.4442025, 1, 1, 1, 1, 1,
-0.9064746, 1.897467, -1.047735, 1, 1, 1, 1, 1,
-0.9010869, 1.46017, -0.5097942, 0, 0, 1, 1, 1,
-0.893488, -0.2725014, -1.711629, 1, 0, 0, 1, 1,
-0.890448, -2.121004, -3.31658, 1, 0, 0, 1, 1,
-0.8856915, -0.2320576, -2.218436, 1, 0, 0, 1, 1,
-0.8820471, -0.9601756, -1.730598, 1, 0, 0, 1, 1,
-0.8815017, 0.07043106, -1.544558, 1, 0, 0, 1, 1,
-0.8806311, -0.1182802, -1.134913, 0, 0, 0, 1, 1,
-0.8801947, 1.7216, -1.347094, 0, 0, 0, 1, 1,
-0.8748276, 0.2022835, -0.5427213, 0, 0, 0, 1, 1,
-0.8734646, 0.370088, -1.185836, 0, 0, 0, 1, 1,
-0.8719558, -2.002538, -1.774063, 0, 0, 0, 1, 1,
-0.8717641, -1.216511, -3.329752, 0, 0, 0, 1, 1,
-0.8708286, -0.2746318, -0.4001294, 0, 0, 0, 1, 1,
-0.8646772, 1.075607, -0.5456822, 1, 1, 1, 1, 1,
-0.8625906, 0.3035436, -0.02818756, 1, 1, 1, 1, 1,
-0.8615357, -0.01256381, -2.001525, 1, 1, 1, 1, 1,
-0.8581439, 0.6577911, -1.175993, 1, 1, 1, 1, 1,
-0.8542979, -0.9580556, -1.081131, 1, 1, 1, 1, 1,
-0.8540321, -1.08344, -2.279586, 1, 1, 1, 1, 1,
-0.8499961, 2.054672, -1.416406, 1, 1, 1, 1, 1,
-0.8491119, 0.1440859, -1.88881, 1, 1, 1, 1, 1,
-0.8489933, 1.069542, 0.8883908, 1, 1, 1, 1, 1,
-0.8485226, -0.2390865, -2.109856, 1, 1, 1, 1, 1,
-0.8444619, 0.4857609, -1.487841, 1, 1, 1, 1, 1,
-0.8394684, 1.767069, 0.1300669, 1, 1, 1, 1, 1,
-0.8393999, 2.310897, 0.4816617, 1, 1, 1, 1, 1,
-0.8345385, 2.611793, -0.3977191, 1, 1, 1, 1, 1,
-0.8293394, -1.660674, -3.080444, 1, 1, 1, 1, 1,
-0.8285724, -2.089253, -2.196493, 0, 0, 1, 1, 1,
-0.8274316, 1.364827, 1.062559, 1, 0, 0, 1, 1,
-0.8181551, -0.07597141, -3.289196, 1, 0, 0, 1, 1,
-0.8153703, -1.160348, -1.857275, 1, 0, 0, 1, 1,
-0.8153509, -0.1432094, -0.535102, 1, 0, 0, 1, 1,
-0.8085834, 1.181495, -0.382171, 1, 0, 0, 1, 1,
-0.8070118, 1.145731, -0.6916294, 0, 0, 0, 1, 1,
-0.8009049, -0.9242476, -3.587568, 0, 0, 0, 1, 1,
-0.7992731, -0.1529804, -3.620273, 0, 0, 0, 1, 1,
-0.798234, 0.5653195, 0.7619231, 0, 0, 0, 1, 1,
-0.7919269, 0.1275911, -0.2910451, 0, 0, 0, 1, 1,
-0.7893472, -0.2787196, -1.653624, 0, 0, 0, 1, 1,
-0.786607, 0.118508, -1.031835, 0, 0, 0, 1, 1,
-0.7772788, -0.1283879, -3.466346, 1, 1, 1, 1, 1,
-0.7755697, -0.5927989, -1.438999, 1, 1, 1, 1, 1,
-0.7736136, -0.2056341, -1.140326, 1, 1, 1, 1, 1,
-0.7677815, 0.3393454, -0.8523154, 1, 1, 1, 1, 1,
-0.7647741, -0.08453904, -2.734332, 1, 1, 1, 1, 1,
-0.7625602, -0.9768811, -3.224211, 1, 1, 1, 1, 1,
-0.7610453, -0.3715613, -2.636618, 1, 1, 1, 1, 1,
-0.7573007, -1.684797, -1.237311, 1, 1, 1, 1, 1,
-0.7549509, -0.923144, -1.359567, 1, 1, 1, 1, 1,
-0.7535943, -1.722027, -2.86407, 1, 1, 1, 1, 1,
-0.751334, 0.09979468, -1.210938, 1, 1, 1, 1, 1,
-0.7481608, -0.3340465, -0.8007041, 1, 1, 1, 1, 1,
-0.7461869, -1.17981, -2.764752, 1, 1, 1, 1, 1,
-0.7419685, -0.476777, -2.290936, 1, 1, 1, 1, 1,
-0.7358632, -1.291453, -3.469552, 1, 1, 1, 1, 1,
-0.734575, 0.7985043, 0.002949263, 0, 0, 1, 1, 1,
-0.7342189, -0.4715686, -1.485009, 1, 0, 0, 1, 1,
-0.7337543, 0.3687465, -0.6894854, 1, 0, 0, 1, 1,
-0.7248561, 1.788669, -1.277235, 1, 0, 0, 1, 1,
-0.7244053, 0.4071358, -1.341684, 1, 0, 0, 1, 1,
-0.7232358, 1.167612, -0.7315403, 1, 0, 0, 1, 1,
-0.7192371, -0.2537991, -1.234132, 0, 0, 0, 1, 1,
-0.7177416, -2.049297, -2.911719, 0, 0, 0, 1, 1,
-0.7051892, -0.1101198, -2.164424, 0, 0, 0, 1, 1,
-0.701884, -0.621991, -2.919116, 0, 0, 0, 1, 1,
-0.6947874, 0.2035847, 0.09243361, 0, 0, 0, 1, 1,
-0.694208, 1.097406, 0.6145282, 0, 0, 0, 1, 1,
-0.6921675, -0.05248999, -1.511003, 0, 0, 0, 1, 1,
-0.6871618, -0.6145114, -2.969448, 1, 1, 1, 1, 1,
-0.6858463, -1.231354, -0.421671, 1, 1, 1, 1, 1,
-0.6849829, -0.3202194, -1.947315, 1, 1, 1, 1, 1,
-0.684116, -1.38408, -2.217854, 1, 1, 1, 1, 1,
-0.680326, 0.07153367, -0.6387621, 1, 1, 1, 1, 1,
-0.6797521, 1.120234, -1.703809, 1, 1, 1, 1, 1,
-0.676833, -0.6776831, -2.765995, 1, 1, 1, 1, 1,
-0.6723089, 0.3021283, 0.2500928, 1, 1, 1, 1, 1,
-0.6703894, 2.582958, -0.7046013, 1, 1, 1, 1, 1,
-0.6694055, -1.802832, -2.545412, 1, 1, 1, 1, 1,
-0.6683474, 1.283426, -1.158602, 1, 1, 1, 1, 1,
-0.6647515, 1.447147, 0.5555053, 1, 1, 1, 1, 1,
-0.6616565, 1.18006, 0.6945641, 1, 1, 1, 1, 1,
-0.6581548, 1.543305, -1.32979, 1, 1, 1, 1, 1,
-0.6575252, -1.163164, -2.405785, 1, 1, 1, 1, 1,
-0.6570938, 0.1481092, -2.490679, 0, 0, 1, 1, 1,
-0.6535614, 0.540623, -0.8702118, 1, 0, 0, 1, 1,
-0.6487204, 1.610628, 0.399634, 1, 0, 0, 1, 1,
-0.6480057, 0.557768, -0.4039367, 1, 0, 0, 1, 1,
-0.6440285, -0.2733922, -2.346149, 1, 0, 0, 1, 1,
-0.6439474, 0.8986133, -1.141471, 1, 0, 0, 1, 1,
-0.6433138, -0.6520371, -4.25532, 0, 0, 0, 1, 1,
-0.643121, -0.090623, -1.707479, 0, 0, 0, 1, 1,
-0.6390891, -0.6251842, -2.153662, 0, 0, 0, 1, 1,
-0.6372241, -1.356297, -3.687989, 0, 0, 0, 1, 1,
-0.6345701, 1.822747, 0.4327092, 0, 0, 0, 1, 1,
-0.6344815, -0.1703625, -2.547621, 0, 0, 0, 1, 1,
-0.6326723, -0.02614292, -2.309974, 0, 0, 0, 1, 1,
-0.6312598, 1.015938, 1.106964, 1, 1, 1, 1, 1,
-0.6218917, 1.733663, -1.457053, 1, 1, 1, 1, 1,
-0.618929, -1.208421, -1.844682, 1, 1, 1, 1, 1,
-0.6168485, -1.7765, -3.94496, 1, 1, 1, 1, 1,
-0.6151904, 0.04368744, -1.837913, 1, 1, 1, 1, 1,
-0.6143899, 1.20751, -1.155581, 1, 1, 1, 1, 1,
-0.6122652, 0.4315884, -1.508041, 1, 1, 1, 1, 1,
-0.6094735, -0.7152898, -4.07583, 1, 1, 1, 1, 1,
-0.6063022, 1.062867, -0.8500348, 1, 1, 1, 1, 1,
-0.6048315, -0.608347, -2.327306, 1, 1, 1, 1, 1,
-0.602732, 1.873351, -1.219075, 1, 1, 1, 1, 1,
-0.5995686, -1.132506, -2.124176, 1, 1, 1, 1, 1,
-0.5922196, 1.310129, -0.1503919, 1, 1, 1, 1, 1,
-0.5917929, 0.2627122, -0.4275459, 1, 1, 1, 1, 1,
-0.5885987, -1.840026, -2.931225, 1, 1, 1, 1, 1,
-0.5861731, 2.056418, -1.903227, 0, 0, 1, 1, 1,
-0.5835606, 0.1439194, 0.01678475, 1, 0, 0, 1, 1,
-0.5810956, 0.3604747, -1.821457, 1, 0, 0, 1, 1,
-0.5803242, 0.3486785, -0.9278812, 1, 0, 0, 1, 1,
-0.5774151, 0.8500482, -2.451319, 1, 0, 0, 1, 1,
-0.5730311, 1.744188, 1.587983, 1, 0, 0, 1, 1,
-0.5713839, 0.8647939, 0.4810824, 0, 0, 0, 1, 1,
-0.5708781, 0.4713704, 0.466106, 0, 0, 0, 1, 1,
-0.5707803, -1.356574, -3.343904, 0, 0, 0, 1, 1,
-0.5690831, 0.5272536, -1.429583, 0, 0, 0, 1, 1,
-0.5685548, 1.278923, 1.79047, 0, 0, 0, 1, 1,
-0.5680268, 0.2515625, -0.4089539, 0, 0, 0, 1, 1,
-0.5672364, -0.2473951, -1.674065, 0, 0, 0, 1, 1,
-0.5649028, 0.5718863, -1.178216, 1, 1, 1, 1, 1,
-0.5640785, 0.2576864, -0.9785036, 1, 1, 1, 1, 1,
-0.5631863, -0.5896539, -1.969736, 1, 1, 1, 1, 1,
-0.5623029, -0.5639998, -1.628839, 1, 1, 1, 1, 1,
-0.5579404, -0.7147219, -4.075777, 1, 1, 1, 1, 1,
-0.5540856, 0.1163225, -0.06210175, 1, 1, 1, 1, 1,
-0.5435884, -1.559683, -1.762164, 1, 1, 1, 1, 1,
-0.5389847, 0.4031187, -0.4449416, 1, 1, 1, 1, 1,
-0.5365112, 0.9614617, -1.739648, 1, 1, 1, 1, 1,
-0.5317255, -0.2674349, -1.985967, 1, 1, 1, 1, 1,
-0.5300577, 1.777701, 0.4291727, 1, 1, 1, 1, 1,
-0.528086, 1.666262, 0.651251, 1, 1, 1, 1, 1,
-0.5280209, 0.4573081, -0.3300659, 1, 1, 1, 1, 1,
-0.527954, -1.000842, 0.01781334, 1, 1, 1, 1, 1,
-0.5278028, -0.2827841, -2.050056, 1, 1, 1, 1, 1,
-0.5248692, 0.5221082, -3.192571, 0, 0, 1, 1, 1,
-0.519313, -0.2587858, -3.482184, 1, 0, 0, 1, 1,
-0.5171859, -0.642221, -3.413828, 1, 0, 0, 1, 1,
-0.509668, 1.135239, -0.1789347, 1, 0, 0, 1, 1,
-0.5080895, -1.256268, -1.327314, 1, 0, 0, 1, 1,
-0.5015969, 0.8412325, -0.7353318, 1, 0, 0, 1, 1,
-0.4983025, 0.3537904, -0.3232406, 0, 0, 0, 1, 1,
-0.4938173, 1.944855, -0.9494058, 0, 0, 0, 1, 1,
-0.4890862, -2.512544, -1.983524, 0, 0, 0, 1, 1,
-0.4887375, 0.7707424, 1.464905, 0, 0, 0, 1, 1,
-0.4883959, 2.853037, -0.1402778, 0, 0, 0, 1, 1,
-0.4877791, -0.1120392, -0.9727603, 0, 0, 0, 1, 1,
-0.484942, -0.04666967, -2.044822, 0, 0, 0, 1, 1,
-0.4807703, -0.2664181, -2.297692, 1, 1, 1, 1, 1,
-0.4805166, -0.4968911, -2.940536, 1, 1, 1, 1, 1,
-0.4792314, -1.392174, -2.195538, 1, 1, 1, 1, 1,
-0.473258, 0.5515212, -2.040097, 1, 1, 1, 1, 1,
-0.469155, -2.596256, -2.909088, 1, 1, 1, 1, 1,
-0.4655122, -0.6179483, -2.823105, 1, 1, 1, 1, 1,
-0.4640426, -1.608352, -2.073136, 1, 1, 1, 1, 1,
-0.4566824, 0.1208062, -1.372384, 1, 1, 1, 1, 1,
-0.4551277, 0.9751405, -0.7643197, 1, 1, 1, 1, 1,
-0.4513449, 1.107335, -0.9975759, 1, 1, 1, 1, 1,
-0.4472572, 1.018025, -0.2437354, 1, 1, 1, 1, 1,
-0.4462717, 1.632515, -1.40869, 1, 1, 1, 1, 1,
-0.4405826, -0.8474833, -2.549319, 1, 1, 1, 1, 1,
-0.4385232, -1.657611, -3.11924, 1, 1, 1, 1, 1,
-0.4373367, 0.8013992, 0.6851605, 1, 1, 1, 1, 1,
-0.4364264, 0.7471552, -1.056597, 0, 0, 1, 1, 1,
-0.4357484, -0.2892938, -1.102477, 1, 0, 0, 1, 1,
-0.4329077, 0.4699623, -1.057843, 1, 0, 0, 1, 1,
-0.4313552, -2.003849, -3.580673, 1, 0, 0, 1, 1,
-0.4257176, -0.06349072, -1.416632, 1, 0, 0, 1, 1,
-0.4252505, 0.5558015, 1.800425, 1, 0, 0, 1, 1,
-0.4252333, 1.097168, -1.783396, 0, 0, 0, 1, 1,
-0.4234252, 1.333497, -0.8923223, 0, 0, 0, 1, 1,
-0.4227061, 0.5038066, -0.7615714, 0, 0, 0, 1, 1,
-0.4225956, -0.6077664, -1.316284, 0, 0, 0, 1, 1,
-0.4197462, -1.018332, -3.773488, 0, 0, 0, 1, 1,
-0.4146061, -1.758637, -2.097909, 0, 0, 0, 1, 1,
-0.4137293, 0.07515971, -0.1188042, 0, 0, 0, 1, 1,
-0.4125902, 0.3833338, -1.743713, 1, 1, 1, 1, 1,
-0.4085502, 0.7874571, -0.2011049, 1, 1, 1, 1, 1,
-0.4068233, -1.216675, -2.348551, 1, 1, 1, 1, 1,
-0.4022312, 2.130624, 1.629563, 1, 1, 1, 1, 1,
-0.4007801, 0.0624621, -1.327931, 1, 1, 1, 1, 1,
-0.399633, 0.2096137, -2.052041, 1, 1, 1, 1, 1,
-0.3979004, 0.265677, -0.5842877, 1, 1, 1, 1, 1,
-0.3974637, 0.2574224, -2.869292, 1, 1, 1, 1, 1,
-0.3942924, 0.5564597, 1.021476, 1, 1, 1, 1, 1,
-0.3930752, -0.133131, -2.731521, 1, 1, 1, 1, 1,
-0.3873532, 0.5078662, 0.4492022, 1, 1, 1, 1, 1,
-0.381977, -1.320867, -2.00483, 1, 1, 1, 1, 1,
-0.3806435, -1.489497, -2.690459, 1, 1, 1, 1, 1,
-0.3792555, 0.6569938, -0.8060873, 1, 1, 1, 1, 1,
-0.3740323, -0.2572965, -2.814068, 1, 1, 1, 1, 1,
-0.37041, -0.01208842, -0.7085239, 0, 0, 1, 1, 1,
-0.3668539, -0.4483957, -2.565876, 1, 0, 0, 1, 1,
-0.365444, 0.1074075, -2.767502, 1, 0, 0, 1, 1,
-0.361514, 0.275939, -0.1096344, 1, 0, 0, 1, 1,
-0.3613042, 0.3183034, -0.4023837, 1, 0, 0, 1, 1,
-0.358315, 0.3472212, -1.342147, 1, 0, 0, 1, 1,
-0.3559039, -1.490366, -2.415607, 0, 0, 0, 1, 1,
-0.3530256, -1.126351, -3.408789, 0, 0, 0, 1, 1,
-0.3527648, 0.5273373, -2.306683, 0, 0, 0, 1, 1,
-0.3527461, -1.535843, -2.675667, 0, 0, 0, 1, 1,
-0.3506662, -0.4054255, -2.903388, 0, 0, 0, 1, 1,
-0.3390915, 0.3682444, -0.8597356, 0, 0, 0, 1, 1,
-0.3339767, 1.709467, 0.7776188, 0, 0, 0, 1, 1,
-0.3313925, 0.7875606, -0.148775, 1, 1, 1, 1, 1,
-0.3293684, -1.891057, -3.138291, 1, 1, 1, 1, 1,
-0.3276802, -0.2597483, -1.97004, 1, 1, 1, 1, 1,
-0.3161022, -0.464738, -2.360639, 1, 1, 1, 1, 1,
-0.3101654, 0.9428281, 1.016539, 1, 1, 1, 1, 1,
-0.3064085, 0.1570629, 0.1661279, 1, 1, 1, 1, 1,
-0.3063398, -0.2524368, -1.263192, 1, 1, 1, 1, 1,
-0.3052974, -1.015106, -3.261779, 1, 1, 1, 1, 1,
-0.3043801, -1.475577, -1.915501, 1, 1, 1, 1, 1,
-0.3012911, -1.159428, -4.157454, 1, 1, 1, 1, 1,
-0.2872506, -0.7013308, -2.341074, 1, 1, 1, 1, 1,
-0.280363, -1.036013, -3.145316, 1, 1, 1, 1, 1,
-0.2765781, -1.768874, -3.586753, 1, 1, 1, 1, 1,
-0.2712403, -0.1525606, -2.532961, 1, 1, 1, 1, 1,
-0.2707599, 1.143035, -2.003602, 1, 1, 1, 1, 1,
-0.2705488, 0.3091206, -0.2601601, 0, 0, 1, 1, 1,
-0.2685404, 0.9341869, -0.3603608, 1, 0, 0, 1, 1,
-0.2668276, 0.7849262, -0.4364229, 1, 0, 0, 1, 1,
-0.2612522, -1.490319, -2.507759, 1, 0, 0, 1, 1,
-0.2612276, 0.6874396, -1.511383, 1, 0, 0, 1, 1,
-0.2568095, -0.8096661, -1.29328, 1, 0, 0, 1, 1,
-0.2451264, 0.8894898, -0.01291664, 0, 0, 0, 1, 1,
-0.2429962, -0.3498277, -1.566261, 0, 0, 0, 1, 1,
-0.2424588, -0.05227223, -1.633378, 0, 0, 0, 1, 1,
-0.240073, 1.91547, -1.90233, 0, 0, 0, 1, 1,
-0.2310139, -1.661034, -4.13748, 0, 0, 0, 1, 1,
-0.2219504, -0.8618709, -3.064336, 0, 0, 0, 1, 1,
-0.2186262, -0.6167427, -2.025244, 0, 0, 0, 1, 1,
-0.2164287, -0.9887759, -2.546371, 1, 1, 1, 1, 1,
-0.2152545, -0.1954446, -1.917777, 1, 1, 1, 1, 1,
-0.215199, 1.772861, 1.471697, 1, 1, 1, 1, 1,
-0.2127779, 1.077957, -1.060919, 1, 1, 1, 1, 1,
-0.2055647, -0.1649436, -2.359491, 1, 1, 1, 1, 1,
-0.1993008, 0.4562592, 0.143079, 1, 1, 1, 1, 1,
-0.1964585, 0.2156039, -1.291307, 1, 1, 1, 1, 1,
-0.1951033, 0.4079167, 0.2904696, 1, 1, 1, 1, 1,
-0.1944237, -0.0509527, -1.884414, 1, 1, 1, 1, 1,
-0.1933602, 0.2380961, 0.3996335, 1, 1, 1, 1, 1,
-0.1924686, -1.944124, -2.103058, 1, 1, 1, 1, 1,
-0.1924217, 0.6132458, 0.7488906, 1, 1, 1, 1, 1,
-0.1898212, 2.627531, 1.167904, 1, 1, 1, 1, 1,
-0.1881295, 0.6725028, -1.618649, 1, 1, 1, 1, 1,
-0.1858899, 1.444936, 0.8488301, 1, 1, 1, 1, 1,
-0.1858266, -0.03376723, -0.8157013, 0, 0, 1, 1, 1,
-0.1842785, -0.4591075, -1.677817, 1, 0, 0, 1, 1,
-0.1841512, 2.327679, 0.9523356, 1, 0, 0, 1, 1,
-0.1827361, 0.8430543, 0.7603472, 1, 0, 0, 1, 1,
-0.1764762, 0.5071741, -0.2184919, 1, 0, 0, 1, 1,
-0.17117, -0.1510433, -1.390334, 1, 0, 0, 1, 1,
-0.1673076, 1.178641, -1.406452, 0, 0, 0, 1, 1,
-0.1663441, -0.2572953, -2.8015, 0, 0, 0, 1, 1,
-0.1578186, 0.04240477, -1.247789, 0, 0, 0, 1, 1,
-0.1485739, -0.8062343, -1.168244, 0, 0, 0, 1, 1,
-0.1443637, 0.01846136, -0.1238206, 0, 0, 0, 1, 1,
-0.1403675, 0.9514594, -1.503058, 0, 0, 0, 1, 1,
-0.1382533, 0.6654341, 0.1716905, 0, 0, 0, 1, 1,
-0.1371504, 0.09416225, -1.659202, 1, 1, 1, 1, 1,
-0.1347156, -0.6316364, -3.092732, 1, 1, 1, 1, 1,
-0.133916, -1.589734, -1.841544, 1, 1, 1, 1, 1,
-0.1280725, 0.7693518, -1.625498, 1, 1, 1, 1, 1,
-0.127935, -1.182703, -2.536854, 1, 1, 1, 1, 1,
-0.127786, 1.121868, -0.3584686, 1, 1, 1, 1, 1,
-0.1241734, 0.4562471, -0.194517, 1, 1, 1, 1, 1,
-0.1240681, -0.611479, -3.148173, 1, 1, 1, 1, 1,
-0.1154487, -1.120153, -2.959376, 1, 1, 1, 1, 1,
-0.11348, 1.272869, -0.179844, 1, 1, 1, 1, 1,
-0.1120384, 0.2504241, -0.9714288, 1, 1, 1, 1, 1,
-0.107538, 0.1981784, -0.8030605, 1, 1, 1, 1, 1,
-0.1068584, 1.134559, 1.833658, 1, 1, 1, 1, 1,
-0.1005007, -1.68464, -4.263728, 1, 1, 1, 1, 1,
-0.1004335, 1.077993, 0.611968, 1, 1, 1, 1, 1,
-0.09853237, -0.4268365, -1.951301, 0, 0, 1, 1, 1,
-0.09352274, 1.120008, 2.150222, 1, 0, 0, 1, 1,
-0.08519113, 0.4815025, -1.05617, 1, 0, 0, 1, 1,
-0.08225016, -1.343665, -2.431023, 1, 0, 0, 1, 1,
-0.07891776, -0.625605, -2.954834, 1, 0, 0, 1, 1,
-0.07730851, 1.269932, -1.360583, 1, 0, 0, 1, 1,
-0.07394031, -2.109529, -4.831537, 0, 0, 0, 1, 1,
-0.07203863, 0.9916905, -0.06445417, 0, 0, 0, 1, 1,
-0.07104275, 0.211291, -0.8199586, 0, 0, 0, 1, 1,
-0.0697367, -1.41034, -2.742392, 0, 0, 0, 1, 1,
-0.06784054, -0.03626518, -1.865285, 0, 0, 0, 1, 1,
-0.06522321, -1.070188, -2.15326, 0, 0, 0, 1, 1,
-0.06321099, 1.696699, 0.2768081, 0, 0, 0, 1, 1,
-0.06093208, -0.1273482, -2.631232, 1, 1, 1, 1, 1,
-0.06085426, -1.117711, -3.476846, 1, 1, 1, 1, 1,
-0.06008978, -1.120347, -2.251927, 1, 1, 1, 1, 1,
-0.05991849, 0.003224108, -2.05599, 1, 1, 1, 1, 1,
-0.05881641, -1.09038, -4.218386, 1, 1, 1, 1, 1,
-0.05569341, -0.5699249, -2.086439, 1, 1, 1, 1, 1,
-0.05463422, -0.07771842, -1.36836, 1, 1, 1, 1, 1,
-0.0485556, -0.1481581, -3.736998, 1, 1, 1, 1, 1,
-0.04040404, 1.361619, 0.5743456, 1, 1, 1, 1, 1,
-0.04023247, -0.5867031, -3.824275, 1, 1, 1, 1, 1,
-0.0382001, 0.7832009, -1.390935, 1, 1, 1, 1, 1,
-0.03571388, 0.6158743, -0.5166755, 1, 1, 1, 1, 1,
-0.03247624, -0.7191392, -3.158426, 1, 1, 1, 1, 1,
-0.03124728, 0.667014, 0.2343221, 1, 1, 1, 1, 1,
-0.03000328, 0.7457215, 1.084057, 1, 1, 1, 1, 1,
-0.02692083, -0.1618836, -3.603694, 0, 0, 1, 1, 1,
-0.02125443, -2.6193, -2.895496, 1, 0, 0, 1, 1,
-0.02125317, 0.6377366, -0.4426656, 1, 0, 0, 1, 1,
-0.01325516, 0.1638821, -0.6231519, 1, 0, 0, 1, 1,
-0.01086874, 1.418885, -1.214698, 1, 0, 0, 1, 1,
-0.01011692, -0.6348938, -4.172411, 1, 0, 0, 1, 1,
-0.009947918, 1.620177, -0.6781036, 0, 0, 0, 1, 1,
-0.008571338, -0.6482501, -4.657239, 0, 0, 0, 1, 1,
-0.002429633, 0.1823146, 0.07310482, 0, 0, 0, 1, 1,
-0.002112572, -1.40303, -3.648654, 0, 0, 0, 1, 1,
0.003362632, -0.2596599, 1.156778, 0, 0, 0, 1, 1,
0.01081074, -0.2488081, 0.505501, 0, 0, 0, 1, 1,
0.01136677, -1.178714, 2.432037, 0, 0, 0, 1, 1,
0.01326328, -1.464111, 2.744681, 1, 1, 1, 1, 1,
0.01394849, -0.7978486, 3.180413, 1, 1, 1, 1, 1,
0.01458759, -1.36598, 4.070613, 1, 1, 1, 1, 1,
0.01649057, 0.7163321, -2.19223, 1, 1, 1, 1, 1,
0.01773286, -1.657616, 3.384943, 1, 1, 1, 1, 1,
0.01935892, -1.583463, 4.345117, 1, 1, 1, 1, 1,
0.02492682, -0.9310899, 2.635187, 1, 1, 1, 1, 1,
0.02874646, -1.154666, 3.25664, 1, 1, 1, 1, 1,
0.02904436, -0.4719199, 2.621321, 1, 1, 1, 1, 1,
0.03153279, -0.9861675, 2.913343, 1, 1, 1, 1, 1,
0.03283888, 0.9930092, 2.203783, 1, 1, 1, 1, 1,
0.03317734, -0.4296685, 4.428668, 1, 1, 1, 1, 1,
0.035035, 1.797304, 0.03053811, 1, 1, 1, 1, 1,
0.04037157, 1.258163, 3.596539, 1, 1, 1, 1, 1,
0.04056653, 0.1438246, -0.138694, 1, 1, 1, 1, 1,
0.04219123, 0.6592377, 0.4653392, 0, 0, 1, 1, 1,
0.04676275, 0.9145399, -0.6152601, 1, 0, 0, 1, 1,
0.04852585, 0.3411255, 1.392946, 1, 0, 0, 1, 1,
0.04945232, -0.4475645, 3.468412, 1, 0, 0, 1, 1,
0.05005417, -1.361749, 3.51169, 1, 0, 0, 1, 1,
0.05120299, 0.1172435, 1.258324, 1, 0, 0, 1, 1,
0.05133471, -1.195612, 2.268414, 0, 0, 0, 1, 1,
0.05633029, -1.065597, 4.160509, 0, 0, 0, 1, 1,
0.05665647, 0.4569758, 3.112884, 0, 0, 0, 1, 1,
0.06179316, 0.07590877, 2.203278, 0, 0, 0, 1, 1,
0.06247426, -0.4625673, 3.733171, 0, 0, 0, 1, 1,
0.06493223, 0.07318553, -0.642695, 0, 0, 0, 1, 1,
0.07393081, 0.05789465, 1.6031, 0, 0, 0, 1, 1,
0.07942645, 0.3227928, 0.1906446, 1, 1, 1, 1, 1,
0.07981335, -0.5260355, 3.119617, 1, 1, 1, 1, 1,
0.08049072, -0.8286147, 3.463477, 1, 1, 1, 1, 1,
0.08178154, 0.1922582, 1.429364, 1, 1, 1, 1, 1,
0.08800808, -0.8926595, 3.199634, 1, 1, 1, 1, 1,
0.0891091, -1.229911, 2.297977, 1, 1, 1, 1, 1,
0.09378244, -1.015604, 1.749218, 1, 1, 1, 1, 1,
0.09462645, -0.2274375, 2.817047, 1, 1, 1, 1, 1,
0.09758049, 1.496294, 0.5257668, 1, 1, 1, 1, 1,
0.09911337, 1.504734, 0.1476276, 1, 1, 1, 1, 1,
0.09973234, 1.708121, 0.6064468, 1, 1, 1, 1, 1,
0.1007034, 1.822132, 0.4501686, 1, 1, 1, 1, 1,
0.1072915, -0.3655002, 2.179469, 1, 1, 1, 1, 1,
0.1161109, 0.6757035, -0.4424575, 1, 1, 1, 1, 1,
0.1176329, -0.3251465, 1.96404, 1, 1, 1, 1, 1,
0.1194886, 1.608792, -0.8147773, 0, 0, 1, 1, 1,
0.1223556, -1.886299, 3.684859, 1, 0, 0, 1, 1,
0.12381, 1.421921, 1.210376, 1, 0, 0, 1, 1,
0.126652, -1.202811, 5.209561, 1, 0, 0, 1, 1,
0.1319994, -0.6486294, 3.055394, 1, 0, 0, 1, 1,
0.1330418, -1.123181, 2.324786, 1, 0, 0, 1, 1,
0.136642, -0.1662859, 3.483083, 0, 0, 0, 1, 1,
0.1371508, 0.3349904, -0.2370518, 0, 0, 0, 1, 1,
0.1375564, 0.3257373, 0.5360742, 0, 0, 0, 1, 1,
0.1522627, -1.378571, 3.178991, 0, 0, 0, 1, 1,
0.1528868, 0.04401231, -0.1380173, 0, 0, 0, 1, 1,
0.1545455, -0.2318563, 3.432817, 0, 0, 0, 1, 1,
0.1585826, 0.1650831, 0.9358637, 0, 0, 0, 1, 1,
0.1586263, 1.016891, 0.3777829, 1, 1, 1, 1, 1,
0.1611051, -1.762003, 3.537051, 1, 1, 1, 1, 1,
0.1615721, 0.4944429, -1.678096, 1, 1, 1, 1, 1,
0.1653205, 0.2074976, 0.4738865, 1, 1, 1, 1, 1,
0.1681781, 0.2005958, 1.716344, 1, 1, 1, 1, 1,
0.1689388, -1.866584, 1.558339, 1, 1, 1, 1, 1,
0.1737962, -0.1886729, 2.049664, 1, 1, 1, 1, 1,
0.1813414, 0.1639872, 1.534057, 1, 1, 1, 1, 1,
0.1861884, 0.3903458, 0.8709759, 1, 1, 1, 1, 1,
0.1917457, 0.04134432, 2.348726, 1, 1, 1, 1, 1,
0.2094816, -0.05553808, 1.389365, 1, 1, 1, 1, 1,
0.2132636, 0.1907081, 1.335415, 1, 1, 1, 1, 1,
0.2138015, 0.04893254, 2.523582, 1, 1, 1, 1, 1,
0.2146953, -1.218754, 4.463899, 1, 1, 1, 1, 1,
0.21597, 1.170794, -0.210502, 1, 1, 1, 1, 1,
0.2167817, -0.3607263, 2.79033, 0, 0, 1, 1, 1,
0.2229432, -0.534753, 1.672391, 1, 0, 0, 1, 1,
0.2280176, 0.1440085, 0.9226719, 1, 0, 0, 1, 1,
0.2292322, -0.424674, 3.05001, 1, 0, 0, 1, 1,
0.2325956, 0.998384, -0.7177514, 1, 0, 0, 1, 1,
0.2328725, 0.6683776, -0.27624, 1, 0, 0, 1, 1,
0.235355, 1.358878, 0.1412255, 0, 0, 0, 1, 1,
0.2364468, -0.4121271, 3.600789, 0, 0, 0, 1, 1,
0.2370841, 0.4193754, 1.285523, 0, 0, 0, 1, 1,
0.2372592, -0.7163944, 3.452397, 0, 0, 0, 1, 1,
0.2387962, -3.447423, 2.410132, 0, 0, 0, 1, 1,
0.2398809, 0.2008784, 1.543295, 0, 0, 0, 1, 1,
0.2444102, 0.7911594, 1.11783, 0, 0, 0, 1, 1,
0.2453605, -0.4480279, 1.877994, 1, 1, 1, 1, 1,
0.2471488, 1.362777, -0.4134609, 1, 1, 1, 1, 1,
0.2476861, -1.335529, 1.113188, 1, 1, 1, 1, 1,
0.2484472, 0.1394524, 2.105564, 1, 1, 1, 1, 1,
0.248793, -1.082152, 2.592343, 1, 1, 1, 1, 1,
0.2498852, -0.7904139, 3.720119, 1, 1, 1, 1, 1,
0.2529019, 0.8110433, 0.3781249, 1, 1, 1, 1, 1,
0.2580744, 2.410297, -1.426137, 1, 1, 1, 1, 1,
0.2600296, -0.006317565, 1.492391, 1, 1, 1, 1, 1,
0.2611318, 1.10842, 0.3390477, 1, 1, 1, 1, 1,
0.2682585, -2.151052, 3.001992, 1, 1, 1, 1, 1,
0.2690738, 0.215422, 2.295817, 1, 1, 1, 1, 1,
0.2730077, 0.03312803, 1.551116, 1, 1, 1, 1, 1,
0.2733917, 0.6733672, 0.3423865, 1, 1, 1, 1, 1,
0.2740423, -1.209047, 1.335044, 1, 1, 1, 1, 1,
0.2741897, -0.4226905, 0.6746811, 0, 0, 1, 1, 1,
0.2756132, -0.7505386, 2.448769, 1, 0, 0, 1, 1,
0.2770137, 0.3503082, 1.345632, 1, 0, 0, 1, 1,
0.2781016, -1.330717, 4.681067, 1, 0, 0, 1, 1,
0.2792527, 0.4783703, -1.028454, 1, 0, 0, 1, 1,
0.2830075, 0.270305, 0.9076448, 1, 0, 0, 1, 1,
0.2884108, -0.4080533, 3.804542, 0, 0, 0, 1, 1,
0.2930636, -2.031353, 1.820971, 0, 0, 0, 1, 1,
0.2933294, -1.8747, 3.138454, 0, 0, 0, 1, 1,
0.2949173, 1.18189, 0.2605437, 0, 0, 0, 1, 1,
0.2962484, -0.4906167, 3.92571, 0, 0, 0, 1, 1,
0.2981437, -0.4322194, 3.768337, 0, 0, 0, 1, 1,
0.2984473, -0.1107161, 1.646229, 0, 0, 0, 1, 1,
0.3032956, 1.727612, 0.2654095, 1, 1, 1, 1, 1,
0.3067922, -0.5144641, 2.024407, 1, 1, 1, 1, 1,
0.3072391, -1.614829, 1.823929, 1, 1, 1, 1, 1,
0.3100716, -0.8769819, 3.340355, 1, 1, 1, 1, 1,
0.3124283, -1.207398, 4.033916, 1, 1, 1, 1, 1,
0.313004, 0.4938454, -0.9517425, 1, 1, 1, 1, 1,
0.3242475, 0.2597266, 0.01109434, 1, 1, 1, 1, 1,
0.3283197, 0.8884513, 0.6344123, 1, 1, 1, 1, 1,
0.3369558, -0.2554168, 2.168797, 1, 1, 1, 1, 1,
0.3371773, -0.2577105, 2.97763, 1, 1, 1, 1, 1,
0.3387336, -0.7365695, 3.547853, 1, 1, 1, 1, 1,
0.343859, -1.110937, 1.994035, 1, 1, 1, 1, 1,
0.3439233, -0.4312958, 4.11821, 1, 1, 1, 1, 1,
0.3446474, 0.6039923, 1.219777, 1, 1, 1, 1, 1,
0.3541455, 0.8058399, 1.349488, 1, 1, 1, 1, 1,
0.3559705, -0.4829105, 1.170653, 0, 0, 1, 1, 1,
0.3572773, -0.08612397, 1.89718, 1, 0, 0, 1, 1,
0.3602741, 0.2267294, 1.806314, 1, 0, 0, 1, 1,
0.3642035, -1.106129, 2.945919, 1, 0, 0, 1, 1,
0.3670832, -0.5339496, 4.170648, 1, 0, 0, 1, 1,
0.3770992, 0.7804006, -0.6010067, 1, 0, 0, 1, 1,
0.380774, 1.053347, -0.8859857, 0, 0, 0, 1, 1,
0.3830623, -1.85122, 3.183821, 0, 0, 0, 1, 1,
0.3886468, 0.8860762, -0.04776287, 0, 0, 0, 1, 1,
0.3892384, -2.251933, 4.052939, 0, 0, 0, 1, 1,
0.3936554, 1.141163, -0.1512607, 0, 0, 0, 1, 1,
0.396432, 0.8847155, 2.24872, 0, 0, 0, 1, 1,
0.3970536, -0.05760292, 0.9743903, 0, 0, 0, 1, 1,
0.4005511, 0.2215201, 1.69671, 1, 1, 1, 1, 1,
0.4010004, -1.160443, 2.758424, 1, 1, 1, 1, 1,
0.4091155, -1.962889, 2.724262, 1, 1, 1, 1, 1,
0.4096623, -1.837582, 2.619128, 1, 1, 1, 1, 1,
0.4109146, 0.725865, 2.181968, 1, 1, 1, 1, 1,
0.412861, -0.6294245, 1.612141, 1, 1, 1, 1, 1,
0.415458, -0.3484101, 1.917744, 1, 1, 1, 1, 1,
0.4286419, 1.279052, 1.514451, 1, 1, 1, 1, 1,
0.4294208, 0.5157456, -1.545102, 1, 1, 1, 1, 1,
0.4315893, -1.216729, 1.948307, 1, 1, 1, 1, 1,
0.4377936, 1.602506, -0.1521802, 1, 1, 1, 1, 1,
0.4438764, 1.357182, 0.536572, 1, 1, 1, 1, 1,
0.4451542, -0.7601936, 1.713033, 1, 1, 1, 1, 1,
0.4500311, 2.140088, 0.9792138, 1, 1, 1, 1, 1,
0.4521604, 1.920716, -1.323981, 1, 1, 1, 1, 1,
0.4577392, 0.3964617, 1.136686, 0, 0, 1, 1, 1,
0.4589838, 0.6093616, 0.6870395, 1, 0, 0, 1, 1,
0.4606041, 0.799511, -1.14773, 1, 0, 0, 1, 1,
0.4627361, 2.063422, -0.8169777, 1, 0, 0, 1, 1,
0.4633676, -1.840561, 2.908276, 1, 0, 0, 1, 1,
0.4649752, 0.6475767, 1.294444, 1, 0, 0, 1, 1,
0.4667349, 0.6050099, 0.5045583, 0, 0, 0, 1, 1,
0.4708032, -0.5361565, 2.384404, 0, 0, 0, 1, 1,
0.4716127, 0.5134443, 2.125517, 0, 0, 0, 1, 1,
0.479381, -1.650458, 3.034138, 0, 0, 0, 1, 1,
0.4816808, 0.5782316, -0.4793828, 0, 0, 0, 1, 1,
0.4821536, -1.664497, 3.024889, 0, 0, 0, 1, 1,
0.4821803, -0.06418902, 2.320099, 0, 0, 0, 1, 1,
0.4834954, -0.5220051, 4.269488, 1, 1, 1, 1, 1,
0.4845717, -1.135126, 4.401841, 1, 1, 1, 1, 1,
0.4921907, -1.107628, 2.221229, 1, 1, 1, 1, 1,
0.4937781, 1.03494, -1.36226, 1, 1, 1, 1, 1,
0.494575, -0.5994226, 4.841327, 1, 1, 1, 1, 1,
0.498411, 1.189618, -0.5653028, 1, 1, 1, 1, 1,
0.4984135, 0.2321775, 2.563148, 1, 1, 1, 1, 1,
0.5020694, 2.468162, 1.607263, 1, 1, 1, 1, 1,
0.502296, -1.074561, 1.819873, 1, 1, 1, 1, 1,
0.5025104, 1.020245, 2.09798, 1, 1, 1, 1, 1,
0.5044463, 1.33231, 0.1233707, 1, 1, 1, 1, 1,
0.5080722, -1.178567, 1.117805, 1, 1, 1, 1, 1,
0.5120673, -0.4374155, 0.8722209, 1, 1, 1, 1, 1,
0.5182224, 0.9395908, 0.4691041, 1, 1, 1, 1, 1,
0.5187689, -0.1923315, 2.308443, 1, 1, 1, 1, 1,
0.5252473, -0.4387546, 1.192128, 0, 0, 1, 1, 1,
0.5274718, -0.1877631, 1.982573, 1, 0, 0, 1, 1,
0.5322809, 0.9037794, -1.209643, 1, 0, 0, 1, 1,
0.5327548, -0.2160141, 2.178384, 1, 0, 0, 1, 1,
0.5334184, 0.156229, 1.764657, 1, 0, 0, 1, 1,
0.5364687, -0.5585535, 3.187572, 1, 0, 0, 1, 1,
0.5383046, -0.4604368, 3.178064, 0, 0, 0, 1, 1,
0.5397925, -0.4905592, 1.972095, 0, 0, 0, 1, 1,
0.5424776, -0.5024034, 1.530993, 0, 0, 0, 1, 1,
0.5466266, 1.078371, 1.290027, 0, 0, 0, 1, 1,
0.5605525, -1.385669, 2.154799, 0, 0, 0, 1, 1,
0.5623111, -0.9992076, 1.672747, 0, 0, 0, 1, 1,
0.5674819, 1.10993, 0.6299275, 0, 0, 0, 1, 1,
0.5793865, -0.5479171, 1.679368, 1, 1, 1, 1, 1,
0.5810558, -0.9702215, 0.9749231, 1, 1, 1, 1, 1,
0.5815144, -0.2878006, 4.533272, 1, 1, 1, 1, 1,
0.5863072, 2.322078, -0.5119257, 1, 1, 1, 1, 1,
0.594344, -0.4439501, 2.756285, 1, 1, 1, 1, 1,
0.5945472, 0.8763558, 0.6640579, 1, 1, 1, 1, 1,
0.5955508, 0.6133661, -1.527794, 1, 1, 1, 1, 1,
0.5997527, -0.9866298, 2.760114, 1, 1, 1, 1, 1,
0.6000652, 1.333399, 2.019179, 1, 1, 1, 1, 1,
0.6018714, 0.500142, 0.6346609, 1, 1, 1, 1, 1,
0.6036236, 0.2465962, 1.526046, 1, 1, 1, 1, 1,
0.6057479, 0.4632076, 0.511591, 1, 1, 1, 1, 1,
0.6060959, 0.05345536, 3.294019, 1, 1, 1, 1, 1,
0.6062114, 0.3269928, 1.953247, 1, 1, 1, 1, 1,
0.6080537, 0.4178452, 0.7583222, 1, 1, 1, 1, 1,
0.6097823, -0.3516259, 2.442728, 0, 0, 1, 1, 1,
0.6118559, 1.409623, 0.2550325, 1, 0, 0, 1, 1,
0.6135721, -0.7042531, 1.0662, 1, 0, 0, 1, 1,
0.6159282, 0.4237253, -0.3398624, 1, 0, 0, 1, 1,
0.6179019, -0.6984043, 2.45421, 1, 0, 0, 1, 1,
0.6193194, -0.9161744, 2.536881, 1, 0, 0, 1, 1,
0.6202281, 0.8445115, 0.4536878, 0, 0, 0, 1, 1,
0.6208832, 0.1344709, 0.207846, 0, 0, 0, 1, 1,
0.6248938, -0.1331834, 3.767187, 0, 0, 0, 1, 1,
0.6260261, 0.7213031, 0.4499937, 0, 0, 0, 1, 1,
0.6269884, -0.2673281, 2.756552, 0, 0, 0, 1, 1,
0.629191, -0.2345518, 3.342848, 0, 0, 0, 1, 1,
0.6314185, 0.300826, 0.01030363, 0, 0, 0, 1, 1,
0.6329699, -0.8317185, 2.203959, 1, 1, 1, 1, 1,
0.6336711, -0.6059231, 2.657587, 1, 1, 1, 1, 1,
0.6339297, 1.993796, 1.57634, 1, 1, 1, 1, 1,
0.63496, -0.205925, 1.411058, 1, 1, 1, 1, 1,
0.6352937, 0.4858526, 1.27103, 1, 1, 1, 1, 1,
0.6385083, -2.187593, 1.085052, 1, 1, 1, 1, 1,
0.6403567, -1.183326, 2.600765, 1, 1, 1, 1, 1,
0.6416705, -0.2471078, 1.319341, 1, 1, 1, 1, 1,
0.6426507, -1.110647, 2.081703, 1, 1, 1, 1, 1,
0.6494699, -0.4495033, 1.601847, 1, 1, 1, 1, 1,
0.651539, 1.815965, 0.4801948, 1, 1, 1, 1, 1,
0.6541417, -1.002966, 2.074162, 1, 1, 1, 1, 1,
0.6590649, 0.5565571, 0.752169, 1, 1, 1, 1, 1,
0.6616629, 2.217022, 1.763839, 1, 1, 1, 1, 1,
0.6662159, 2.123669, 0.5344723, 1, 1, 1, 1, 1,
0.6689337, 0.4168783, 1.237212, 0, 0, 1, 1, 1,
0.6701778, 1.209366, 0.3368531, 1, 0, 0, 1, 1,
0.6834205, 0.4505199, 0.6588544, 1, 0, 0, 1, 1,
0.6834651, -1.055409, 4.245863, 1, 0, 0, 1, 1,
0.684509, -0.008144193, 4.381786, 1, 0, 0, 1, 1,
0.6910903, 0.04150632, 2.603453, 1, 0, 0, 1, 1,
0.6957968, -1.305565, 3.693626, 0, 0, 0, 1, 1,
0.6960735, -1.586753, 3.783616, 0, 0, 0, 1, 1,
0.696708, -1.180946, 1.801162, 0, 0, 0, 1, 1,
0.7054919, 0.248228, 1.412292, 0, 0, 0, 1, 1,
0.7070072, -1.294808, 1.93569, 0, 0, 0, 1, 1,
0.7111817, -0.7065083, 1.454466, 0, 0, 0, 1, 1,
0.7164367, 0.5748421, 1.522778, 0, 0, 0, 1, 1,
0.7187406, 0.1792764, 2.007249, 1, 1, 1, 1, 1,
0.7239904, 1.142921, 1.667084, 1, 1, 1, 1, 1,
0.727042, 0.1728613, 2.729506, 1, 1, 1, 1, 1,
0.7294932, -1.654018, 0.578364, 1, 1, 1, 1, 1,
0.7339819, 0.7812204, 2.391775, 1, 1, 1, 1, 1,
0.736683, -1.066779, 1.680704, 1, 1, 1, 1, 1,
0.7371759, 0.2569162, 1.732484, 1, 1, 1, 1, 1,
0.7387629, -0.377447, 1.456563, 1, 1, 1, 1, 1,
0.7388244, 0.9614194, 0.9576001, 1, 1, 1, 1, 1,
0.7452202, -2.850937, 3.528191, 1, 1, 1, 1, 1,
0.7493911, -0.06234953, 0.376986, 1, 1, 1, 1, 1,
0.7500892, -0.5620809, 2.096575, 1, 1, 1, 1, 1,
0.7523507, 0.04711171, 1.860794, 1, 1, 1, 1, 1,
0.7548984, -0.1754261, 2.362149, 1, 1, 1, 1, 1,
0.7551083, 1.348018, -1.413723, 1, 1, 1, 1, 1,
0.7553711, -0.1407985, 1.758018, 0, 0, 1, 1, 1,
0.7602363, -1.004144, 1.656717, 1, 0, 0, 1, 1,
0.7656558, 0.5531659, 0.5940857, 1, 0, 0, 1, 1,
0.766244, 1.630296, -0.3010458, 1, 0, 0, 1, 1,
0.7704323, -1.50871, 2.840841, 1, 0, 0, 1, 1,
0.7736183, 1.232739, 1.106012, 1, 0, 0, 1, 1,
0.7764992, -1.459175, 1.072124, 0, 0, 0, 1, 1,
0.7779544, 0.7774982, -0.8319979, 0, 0, 0, 1, 1,
0.785646, 0.4485998, 2.783647, 0, 0, 0, 1, 1,
0.7857199, 0.06527263, 2.500034, 0, 0, 0, 1, 1,
0.7866679, -1.470851, 1.726751, 0, 0, 0, 1, 1,
0.7972149, 0.4639812, 1.276329, 0, 0, 0, 1, 1,
0.7989355, 0.02207397, 1.75504, 0, 0, 0, 1, 1,
0.8076414, -0.1413998, 0.8614362, 1, 1, 1, 1, 1,
0.8106139, 1.144901, 0.1902179, 1, 1, 1, 1, 1,
0.8137193, -1.476345, 2.454402, 1, 1, 1, 1, 1,
0.8147563, 1.994598, 2.162991, 1, 1, 1, 1, 1,
0.8155653, -1.628949, 1.700838, 1, 1, 1, 1, 1,
0.8188462, -0.1657882, 1.051323, 1, 1, 1, 1, 1,
0.8210121, 1.863552, 1.908971, 1, 1, 1, 1, 1,
0.8232325, 0.1746763, 0.7439498, 1, 1, 1, 1, 1,
0.8277307, -0.2541709, 2.220747, 1, 1, 1, 1, 1,
0.8341697, -0.1481088, 0.2425339, 1, 1, 1, 1, 1,
0.8381124, 0.6699588, 1.548779, 1, 1, 1, 1, 1,
0.8384309, 0.1111006, 2.34765, 1, 1, 1, 1, 1,
0.8402721, -0.6433858, 2.418121, 1, 1, 1, 1, 1,
0.8440398, -0.6928157, 1.19689, 1, 1, 1, 1, 1,
0.8472877, 0.5951769, 0.5478258, 1, 1, 1, 1, 1,
0.8499367, -1.457663, 0.6855363, 0, 0, 1, 1, 1,
0.8502272, -1.308539, 2.171084, 1, 0, 0, 1, 1,
0.8519971, -0.6117404, 0.8332916, 1, 0, 0, 1, 1,
0.8534365, 0.4439883, 0.3379459, 1, 0, 0, 1, 1,
0.8562871, -0.294749, 0.8528248, 1, 0, 0, 1, 1,
0.859293, -0.884294, 2.080518, 1, 0, 0, 1, 1,
0.8606935, 0.147828, 0.02294325, 0, 0, 0, 1, 1,
0.8643392, 0.8920424, 0.2530918, 0, 0, 0, 1, 1,
0.8694811, -0.07380079, 1.642083, 0, 0, 0, 1, 1,
0.8703768, 0.0505083, 1.579946, 0, 0, 0, 1, 1,
0.8713195, -0.1544959, 2.685637, 0, 0, 0, 1, 1,
0.8795041, -1.007836, 4.091499, 0, 0, 0, 1, 1,
0.8796332, -1.608532, 1.373757, 0, 0, 0, 1, 1,
0.88337, 0.6395381, 0.5210909, 1, 1, 1, 1, 1,
0.8913415, -0.4587792, 2.387708, 1, 1, 1, 1, 1,
0.8989648, -0.4085139, 2.085306, 1, 1, 1, 1, 1,
0.8995402, -0.4341081, 1.845436, 1, 1, 1, 1, 1,
0.9051192, 0.8304865, 1.265576, 1, 1, 1, 1, 1,
0.9065264, -0.4975002, 1.413326, 1, 1, 1, 1, 1,
0.9102932, -0.7372342, 0.6670145, 1, 1, 1, 1, 1,
0.9106606, -2.168151, 2.866662, 1, 1, 1, 1, 1,
0.9210676, -0.1093528, 2.181276, 1, 1, 1, 1, 1,
0.9232419, -0.6325171, 2.831004, 1, 1, 1, 1, 1,
0.9297981, 1.084182, -0.9753849, 1, 1, 1, 1, 1,
0.9345754, -0.9220458, 3.575719, 1, 1, 1, 1, 1,
0.9361274, 0.9834244, -0.3075092, 1, 1, 1, 1, 1,
0.9445853, -0.6234678, 1.009299, 1, 1, 1, 1, 1,
0.94888, -0.7435874, 1.342253, 1, 1, 1, 1, 1,
0.9505114, -0.2990931, 0.277206, 0, 0, 1, 1, 1,
0.9560022, 0.674627, 1.9688, 1, 0, 0, 1, 1,
0.9599638, 1.616551, 0.05955365, 1, 0, 0, 1, 1,
0.9608325, 0.3643346, 1.698698, 1, 0, 0, 1, 1,
0.966794, 3.364739, 2.719082, 1, 0, 0, 1, 1,
0.9686278, 0.3418971, 0.5310566, 1, 0, 0, 1, 1,
0.9757171, -1.784883, 2.527364, 0, 0, 0, 1, 1,
0.9864821, -0.5022461, 1.769154, 0, 0, 0, 1, 1,
0.9943519, 0.5565357, 0.8523318, 0, 0, 0, 1, 1,
1.002524, -0.8811192, 2.115692, 0, 0, 0, 1, 1,
1.002992, -1.68199, 3.775779, 0, 0, 0, 1, 1,
1.02069, 0.7465039, 2.595537, 0, 0, 0, 1, 1,
1.026971, -0.09587039, 0.3409216, 0, 0, 0, 1, 1,
1.035153, -1.621076, 1.681806, 1, 1, 1, 1, 1,
1.037135, 0.6198953, -0.159995, 1, 1, 1, 1, 1,
1.038504, -1.74723, 2.094309, 1, 1, 1, 1, 1,
1.039118, 1.313363, 0.232054, 1, 1, 1, 1, 1,
1.04062, 1.641143, -0.3642338, 1, 1, 1, 1, 1,
1.048386, -0.5531237, 2.357003, 1, 1, 1, 1, 1,
1.060367, 0.3455441, 0.9736198, 1, 1, 1, 1, 1,
1.069818, 0.1059941, 0.3858066, 1, 1, 1, 1, 1,
1.077501, 0.8788553, 1.412245, 1, 1, 1, 1, 1,
1.090717, -0.8532397, 2.577772, 1, 1, 1, 1, 1,
1.091501, -0.2789619, 1.985703, 1, 1, 1, 1, 1,
1.09436, 0.8023767, 0.5089108, 1, 1, 1, 1, 1,
1.101543, 0.06127491, 0.523424, 1, 1, 1, 1, 1,
1.102568, 0.8327062, 0.9620861, 1, 1, 1, 1, 1,
1.104895, 0.4316241, -0.119259, 1, 1, 1, 1, 1,
1.105963, 0.2842751, 2.059719, 0, 0, 1, 1, 1,
1.106089, 0.954141, 1.067307, 1, 0, 0, 1, 1,
1.123292, -1.013596, 2.602593, 1, 0, 0, 1, 1,
1.127583, 0.8298474, 0.6577898, 1, 0, 0, 1, 1,
1.150746, 0.3587303, 3.182059, 1, 0, 0, 1, 1,
1.152483, -0.4550914, 1.656481, 1, 0, 0, 1, 1,
1.154261, 1.451147, 0.6964129, 0, 0, 0, 1, 1,
1.155313, 0.7341671, 1.661305, 0, 0, 0, 1, 1,
1.155654, -1.814873, 3.595237, 0, 0, 0, 1, 1,
1.158781, -0.6566237, 0.9746835, 0, 0, 0, 1, 1,
1.179538, 1.364605, 2.385249, 0, 0, 0, 1, 1,
1.181425, 2.041501, 0.5731848, 0, 0, 0, 1, 1,
1.192162, -2.952288, 2.082869, 0, 0, 0, 1, 1,
1.213156, -0.8455493, 1.569304, 1, 1, 1, 1, 1,
1.222084, -1.232644, 1.378439, 1, 1, 1, 1, 1,
1.230464, -0.2528046, 1.138034, 1, 1, 1, 1, 1,
1.231697, 0.5105152, 0.5481667, 1, 1, 1, 1, 1,
1.233788, -0.9455935, 0.8227784, 1, 1, 1, 1, 1,
1.24532, 0.2305063, 1.461357, 1, 1, 1, 1, 1,
1.256428, 0.8661481, 3.195645, 1, 1, 1, 1, 1,
1.261153, -0.1220378, 2.398292, 1, 1, 1, 1, 1,
1.269356, -1.291998, 2.867215, 1, 1, 1, 1, 1,
1.279041, 0.4931585, 1.061363, 1, 1, 1, 1, 1,
1.284282, -0.4435709, 2.647269, 1, 1, 1, 1, 1,
1.286006, 0.3080025, 2.474336, 1, 1, 1, 1, 1,
1.287301, -1.009619, 1.568001, 1, 1, 1, 1, 1,
1.288854, 0.5165396, 0.3304463, 1, 1, 1, 1, 1,
1.295856, 0.123282, -0.5766968, 1, 1, 1, 1, 1,
1.306687, 0.7038155, 1.46735, 0, 0, 1, 1, 1,
1.306924, 0.2609178, 2.661495, 1, 0, 0, 1, 1,
1.30898, -0.2411407, 2.073744, 1, 0, 0, 1, 1,
1.312548, 0.604747, 0.9601055, 1, 0, 0, 1, 1,
1.333508, -0.3008137, 1.722236, 1, 0, 0, 1, 1,
1.334099, -0.010652, 1.495975, 1, 0, 0, 1, 1,
1.33975, 0.1962183, 0.7299348, 0, 0, 0, 1, 1,
1.341651, 2.42878, 0.0001809519, 0, 0, 0, 1, 1,
1.342603, 0.02475606, 2.16958, 0, 0, 0, 1, 1,
1.352268, 1.186497, 1.852202, 0, 0, 0, 1, 1,
1.355404, -1.119851, 2.995724, 0, 0, 0, 1, 1,
1.358028, 0.7203317, -0.6712705, 0, 0, 0, 1, 1,
1.361565, -0.1991924, 1.431327, 0, 0, 0, 1, 1,
1.365387, -0.09068848, 1.561618, 1, 1, 1, 1, 1,
1.376995, -0.2189444, 0.9908722, 1, 1, 1, 1, 1,
1.380593, 0.77327, -1.581782, 1, 1, 1, 1, 1,
1.3812, 0.003629387, -0.6574615, 1, 1, 1, 1, 1,
1.38832, 1.064783, 1.583364, 1, 1, 1, 1, 1,
1.391949, 1.151567, 2.094132, 1, 1, 1, 1, 1,
1.403133, -0.9075968, 1.731013, 1, 1, 1, 1, 1,
1.405341, -0.3549181, 2.189517, 1, 1, 1, 1, 1,
1.408405, 2.252568, 2.225299, 1, 1, 1, 1, 1,
1.410139, 0.3040359, 0.4980219, 1, 1, 1, 1, 1,
1.412743, -0.938806, 2.214372, 1, 1, 1, 1, 1,
1.417902, 0.05648633, 0.6174899, 1, 1, 1, 1, 1,
1.420745, -0.8828672, 2.843763, 1, 1, 1, 1, 1,
1.433088, -0.8607215, 1.797568, 1, 1, 1, 1, 1,
1.464089, -0.700009, 1.009818, 1, 1, 1, 1, 1,
1.471291, -0.9773568, 1.511441, 0, 0, 1, 1, 1,
1.476543, 0.9399936, 1.01948, 1, 0, 0, 1, 1,
1.483891, 0.3652034, 1.547244, 1, 0, 0, 1, 1,
1.490517, 0.1963142, 2.417189, 1, 0, 0, 1, 1,
1.504501, -1.390276, 0.9437969, 1, 0, 0, 1, 1,
1.509733, -0.2773409, 1.784939, 1, 0, 0, 1, 1,
1.515352, 1.416515, -0.885434, 0, 0, 0, 1, 1,
1.523136, -0.9436423, 1.373448, 0, 0, 0, 1, 1,
1.523579, 1.627067, -0.8643162, 0, 0, 0, 1, 1,
1.533218, -0.6112651, 3.005417, 0, 0, 0, 1, 1,
1.546921, -0.03260227, 1.513869, 0, 0, 0, 1, 1,
1.547272, -1.446321, 1.957663, 0, 0, 0, 1, 1,
1.563085, -0.2407806, 1.399438, 0, 0, 0, 1, 1,
1.577553, 2.098471, -0.0002617144, 1, 1, 1, 1, 1,
1.58651, 0.4486076, -0.162534, 1, 1, 1, 1, 1,
1.59785, -0.5235614, 0.7753406, 1, 1, 1, 1, 1,
1.62837, 0.02756633, -0.9516255, 1, 1, 1, 1, 1,
1.6386, -1.367721, 1.246475, 1, 1, 1, 1, 1,
1.645244, 0.2505772, 0.5886618, 1, 1, 1, 1, 1,
1.656525, -0.1648057, 3.878696, 1, 1, 1, 1, 1,
1.671146, -1.589113, 2.743369, 1, 1, 1, 1, 1,
1.682107, 1.23502, -0.2234586, 1, 1, 1, 1, 1,
1.685162, -0.6577942, 3.745673, 1, 1, 1, 1, 1,
1.692289, 0.3118531, 0.9224271, 1, 1, 1, 1, 1,
1.694469, 0.5661985, 0.6396536, 1, 1, 1, 1, 1,
1.699134, -0.3119136, 1.191793, 1, 1, 1, 1, 1,
1.700038, 0.2702616, 3.268118, 1, 1, 1, 1, 1,
1.714853, -0.3346118, 1.225712, 1, 1, 1, 1, 1,
1.715028, -0.995754, 1.013451, 0, 0, 1, 1, 1,
1.718916, -0.4509145, 3.025415, 1, 0, 0, 1, 1,
1.720045, 1.035788, 2.35601, 1, 0, 0, 1, 1,
1.730986, -1.20368, 2.478491, 1, 0, 0, 1, 1,
1.744445, -1.056114, 1.904723, 1, 0, 0, 1, 1,
1.759829, -0.07334202, 1.409399, 1, 0, 0, 1, 1,
1.772436, -0.7540049, 2.631044, 0, 0, 0, 1, 1,
1.774816, -0.6193578, 1.092066, 0, 0, 0, 1, 1,
1.820169, -1.235858, 3.376629, 0, 0, 0, 1, 1,
1.850044, 0.9141307, 2.861625, 0, 0, 0, 1, 1,
1.855388, 1.791919, -0.3726007, 0, 0, 0, 1, 1,
1.866544, -0.3050881, 1.035686, 0, 0, 0, 1, 1,
1.951419, 0.7496907, 0.1850935, 0, 0, 0, 1, 1,
1.954952, -0.1365465, 2.137444, 1, 1, 1, 1, 1,
1.956427, 0.4286217, 0.9414018, 1, 1, 1, 1, 1,
1.959424, 0.49938, 2.633097, 1, 1, 1, 1, 1,
2.001746, 0.09538193, 1.655728, 1, 1, 1, 1, 1,
2.019638, 0.83703, 3.372773, 1, 1, 1, 1, 1,
2.024609, -1.001244, 1.529541, 1, 1, 1, 1, 1,
2.02515, 0.5684009, 0.01222302, 1, 1, 1, 1, 1,
2.025167, 0.3797221, 1.913405, 1, 1, 1, 1, 1,
2.106806, -0.9859358, 2.080648, 1, 1, 1, 1, 1,
2.119856, 0.5556709, 0.176227, 1, 1, 1, 1, 1,
2.133867, -0.05989314, 1.08803, 1, 1, 1, 1, 1,
2.153138, 0.3231055, 1.709562, 1, 1, 1, 1, 1,
2.167017, -1.67435, 2.469954, 1, 1, 1, 1, 1,
2.209313, 0.2045597, 0.3105549, 1, 1, 1, 1, 1,
2.239186, 0.1466563, 2.584466, 1, 1, 1, 1, 1,
2.255346, -0.2721256, 1.674567, 0, 0, 1, 1, 1,
2.296997, 0.8348484, 2.396038, 1, 0, 0, 1, 1,
2.371364, 0.6102941, -0.02612339, 1, 0, 0, 1, 1,
2.432446, -0.552974, -0.2933364, 1, 0, 0, 1, 1,
2.436, -1.299614, 2.290474, 1, 0, 0, 1, 1,
2.441847, -1.127435, 2.108966, 1, 0, 0, 1, 1,
2.450623, -1.254756, 3.256174, 0, 0, 0, 1, 1,
2.458328, -0.953633, 4.014647, 0, 0, 0, 1, 1,
2.505298, -0.6096416, 2.381846, 0, 0, 0, 1, 1,
2.527198, -1.349299, 2.047701, 0, 0, 0, 1, 1,
2.600471, -0.4672987, 3.005827, 0, 0, 0, 1, 1,
2.604842, 0.05066286, 1.81455, 0, 0, 0, 1, 1,
2.664452, -1.063246, 2.209407, 0, 0, 0, 1, 1,
2.703745, 0.3558529, 0.8846861, 1, 1, 1, 1, 1,
2.71532, -2.038481, 4.509681, 1, 1, 1, 1, 1,
2.77729, -0.5497331, 3.762138, 1, 1, 1, 1, 1,
3.002572, -2.236991, 3.079146, 1, 1, 1, 1, 1,
3.088164, -0.8727616, 1.971253, 1, 1, 1, 1, 1,
3.098503, 0.6656076, 2.73269, 1, 1, 1, 1, 1,
3.107211, 0.8807275, 0.2490661, 1, 1, 1, 1, 1
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
var radius = 9.336911;
var distance = 32.79551;
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
mvMatrix.translate( -0.05908918, 0.04134202, -0.1890123 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.79551);
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
