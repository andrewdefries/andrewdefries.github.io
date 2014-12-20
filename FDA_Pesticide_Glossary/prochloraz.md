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
-3.430241, -0.6729126, -2.542939, 1, 0, 0, 1,
-3.356592, -0.1799332, -3.934478, 1, 0.007843138, 0, 1,
-3.188371, 1.115173, -2.25134, 1, 0.01176471, 0, 1,
-3.010467, -0.4196926, -1.704864, 1, 0.01960784, 0, 1,
-2.818032, -0.2517734, -0.7725826, 1, 0.02352941, 0, 1,
-2.667855, -0.3591262, -2.179373, 1, 0.03137255, 0, 1,
-2.622405, 0.1172664, -3.465243, 1, 0.03529412, 0, 1,
-2.486372, -0.5438238, -2.884603, 1, 0.04313726, 0, 1,
-2.481863, 0.4206134, -1.738169, 1, 0.04705882, 0, 1,
-2.401964, -1.068227, -2.134459, 1, 0.05490196, 0, 1,
-2.364274, -1.481307, -3.470427, 1, 0.05882353, 0, 1,
-2.357101, 0.6102899, -1.511946, 1, 0.06666667, 0, 1,
-2.244828, -1.048218, -2.36754, 1, 0.07058824, 0, 1,
-2.18925, 0.3310126, -0.7584043, 1, 0.07843138, 0, 1,
-2.152536, -0.9396546, -0.8408816, 1, 0.08235294, 0, 1,
-2.137515, -0.04902995, -1.199669, 1, 0.09019608, 0, 1,
-2.11497, -0.1741119, -1.264944, 1, 0.09411765, 0, 1,
-2.072342, -0.3785896, -2.011651, 1, 0.1019608, 0, 1,
-2.070776, -0.9465371, -1.769936, 1, 0.1098039, 0, 1,
-1.978897, 1.333762, -0.3615507, 1, 0.1137255, 0, 1,
-1.977036, 1.743702, 0.7920737, 1, 0.1215686, 0, 1,
-1.97137, -0.9962065, -1.731379, 1, 0.1254902, 0, 1,
-1.949663, 0.1576991, -0.6709226, 1, 0.1333333, 0, 1,
-1.946841, -1.366551, -1.780983, 1, 0.1372549, 0, 1,
-1.929176, 0.7695909, -0.5539433, 1, 0.145098, 0, 1,
-1.925178, -0.8033761, -3.503364, 1, 0.1490196, 0, 1,
-1.90251, 0.8657768, -2.619034, 1, 0.1568628, 0, 1,
-1.897065, 1.202552, -1.99683, 1, 0.1607843, 0, 1,
-1.880961, -0.4920629, -1.728148, 1, 0.1686275, 0, 1,
-1.864603, -0.4517239, -2.266342, 1, 0.172549, 0, 1,
-1.855829, -0.3391171, -1.807285, 1, 0.1803922, 0, 1,
-1.838086, -0.1425214, -0.8987616, 1, 0.1843137, 0, 1,
-1.836462, -0.2368946, -2.844262, 1, 0.1921569, 0, 1,
-1.825682, 0.4391683, -1.078413, 1, 0.1960784, 0, 1,
-1.816689, 1.957061, 1.788806, 1, 0.2039216, 0, 1,
-1.814064, 0.3212294, -4.279779, 1, 0.2117647, 0, 1,
-1.793258, 0.5658439, -1.292128, 1, 0.2156863, 0, 1,
-1.776111, -0.623621, -1.904319, 1, 0.2235294, 0, 1,
-1.77393, -1.03364, -1.109211, 1, 0.227451, 0, 1,
-1.758348, 2.294281, 0.4694394, 1, 0.2352941, 0, 1,
-1.736724, -0.5039845, -2.642022, 1, 0.2392157, 0, 1,
-1.725235, 0.9736666, -1.558545, 1, 0.2470588, 0, 1,
-1.709688, 0.06524318, -1.430497, 1, 0.2509804, 0, 1,
-1.700055, 0.7620808, -0.03954377, 1, 0.2588235, 0, 1,
-1.697397, 0.9380565, -2.097245, 1, 0.2627451, 0, 1,
-1.69698, 0.0003978343, -0.7539917, 1, 0.2705882, 0, 1,
-1.694481, -0.3744697, -2.512312, 1, 0.2745098, 0, 1,
-1.689159, 0.8336477, -0.8002343, 1, 0.282353, 0, 1,
-1.685281, 0.7002082, -0.7357363, 1, 0.2862745, 0, 1,
-1.681731, -0.6759391, -0.746133, 1, 0.2941177, 0, 1,
-1.680899, -0.5091096, -2.594422, 1, 0.3019608, 0, 1,
-1.676934, -1.099692, -3.401414, 1, 0.3058824, 0, 1,
-1.669732, 0.1054817, -1.697734, 1, 0.3137255, 0, 1,
-1.664232, 0.8120021, -0.303304, 1, 0.3176471, 0, 1,
-1.658146, 0.5342495, -0.171796, 1, 0.3254902, 0, 1,
-1.653875, 0.2742861, -1.464827, 1, 0.3294118, 0, 1,
-1.634977, 0.143446, -2.843427, 1, 0.3372549, 0, 1,
-1.623527, 0.1287048, -0.4494319, 1, 0.3411765, 0, 1,
-1.61869, 1.558612, -0.3789409, 1, 0.3490196, 0, 1,
-1.594986, 0.2458539, -0.1827047, 1, 0.3529412, 0, 1,
-1.576286, -1.366863, -1.52746, 1, 0.3607843, 0, 1,
-1.55598, 0.9219521, -1.12903, 1, 0.3647059, 0, 1,
-1.554959, -0.2597594, -1.836317, 1, 0.372549, 0, 1,
-1.554036, 0.4234205, -1.44755, 1, 0.3764706, 0, 1,
-1.549786, -1.345384, -3.657222, 1, 0.3843137, 0, 1,
-1.549498, 0.4209381, -0.2041138, 1, 0.3882353, 0, 1,
-1.526507, 0.9063979, -2.665808, 1, 0.3960784, 0, 1,
-1.522684, -0.3574854, -1.173436, 1, 0.4039216, 0, 1,
-1.507583, 2.61828, 0.2481306, 1, 0.4078431, 0, 1,
-1.502691, 0.7016569, 0.2610675, 1, 0.4156863, 0, 1,
-1.497568, -0.4778622, -2.274013, 1, 0.4196078, 0, 1,
-1.493831, 0.1029846, -1.520543, 1, 0.427451, 0, 1,
-1.483063, 0.6536184, -2.180745, 1, 0.4313726, 0, 1,
-1.460003, -1.576676, -3.270405, 1, 0.4392157, 0, 1,
-1.456129, 0.06901046, -2.261332, 1, 0.4431373, 0, 1,
-1.452404, 0.09488293, -2.915191, 1, 0.4509804, 0, 1,
-1.442748, 0.4120637, -1.689981, 1, 0.454902, 0, 1,
-1.434358, 1.386029, -1.328066, 1, 0.4627451, 0, 1,
-1.424736, 2.37234, -2.325557, 1, 0.4666667, 0, 1,
-1.414582, -0.724636, -0.8648216, 1, 0.4745098, 0, 1,
-1.413235, -1.146115, -2.945505, 1, 0.4784314, 0, 1,
-1.405871, -0.322978, -2.567143, 1, 0.4862745, 0, 1,
-1.400868, 0.1661163, -1.924976, 1, 0.4901961, 0, 1,
-1.389379, -0.661088, -1.979296, 1, 0.4980392, 0, 1,
-1.378235, 0.2741752, -1.678242, 1, 0.5058824, 0, 1,
-1.37602, -1.23354, -3.406352, 1, 0.509804, 0, 1,
-1.369272, -0.8580324, -3.114422, 1, 0.5176471, 0, 1,
-1.366441, -0.2877716, -1.24585, 1, 0.5215687, 0, 1,
-1.356585, -0.1629444, -2.031333, 1, 0.5294118, 0, 1,
-1.337439, -1.208962, -1.123327, 1, 0.5333334, 0, 1,
-1.306186, -0.9983141, -1.356412, 1, 0.5411765, 0, 1,
-1.304258, -0.4168877, -2.733312, 1, 0.5450981, 0, 1,
-1.303743, -1.324568, -1.762563, 1, 0.5529412, 0, 1,
-1.302381, -2.583463, -3.621, 1, 0.5568628, 0, 1,
-1.299842, 1.596182, -0.6336175, 1, 0.5647059, 0, 1,
-1.299184, -0.7115697, -2.814023, 1, 0.5686275, 0, 1,
-1.293898, -0.4401276, -0.729672, 1, 0.5764706, 0, 1,
-1.289815, 0.505954, -2.299384, 1, 0.5803922, 0, 1,
-1.283026, -0.575261, -2.107001, 1, 0.5882353, 0, 1,
-1.275696, 0.3965294, -0.8173203, 1, 0.5921569, 0, 1,
-1.265996, -1.354341, -2.368621, 1, 0.6, 0, 1,
-1.258476, 1.361816, -0.7432871, 1, 0.6078432, 0, 1,
-1.253497, 0.1757832, -0.7846335, 1, 0.6117647, 0, 1,
-1.250448, 0.6923247, -2.058685, 1, 0.6196079, 0, 1,
-1.249034, -0.8099987, -3.115321, 1, 0.6235294, 0, 1,
-1.24312, 0.8640572, -1.203373, 1, 0.6313726, 0, 1,
-1.229294, 1.088777, 0.04828145, 1, 0.6352941, 0, 1,
-1.224091, -2.314448, -1.904776, 1, 0.6431373, 0, 1,
-1.224062, -0.3133831, -2.039567, 1, 0.6470588, 0, 1,
-1.218922, -1.921566, -2.821299, 1, 0.654902, 0, 1,
-1.216809, 1.080292, -1.305813, 1, 0.6588235, 0, 1,
-1.215275, -0.8566773, -2.988556, 1, 0.6666667, 0, 1,
-1.215171, -1.970431, -2.622643, 1, 0.6705883, 0, 1,
-1.208182, -1.035367, -2.053376, 1, 0.6784314, 0, 1,
-1.205711, -0.9465758, -2.14458, 1, 0.682353, 0, 1,
-1.200435, 0.130263, -1.201316, 1, 0.6901961, 0, 1,
-1.194647, -1.610372, -1.33543, 1, 0.6941177, 0, 1,
-1.193371, -0.4108121, -1.296609, 1, 0.7019608, 0, 1,
-1.191481, 0.8923265, -0.4800507, 1, 0.7098039, 0, 1,
-1.190086, -0.08554541, -0.8030152, 1, 0.7137255, 0, 1,
-1.182415, 0.2522621, -0.5503119, 1, 0.7215686, 0, 1,
-1.181072, -1.130705, -3.123594, 1, 0.7254902, 0, 1,
-1.180675, 0.3269135, -1.969361, 1, 0.7333333, 0, 1,
-1.1698, 0.1950735, -0.7697082, 1, 0.7372549, 0, 1,
-1.164497, 0.2249192, -1.971337, 1, 0.7450981, 0, 1,
-1.162938, -1.399979, -1.132492, 1, 0.7490196, 0, 1,
-1.160418, 0.2489113, -1.442903, 1, 0.7568628, 0, 1,
-1.159576, -0.2596692, -0.7729499, 1, 0.7607843, 0, 1,
-1.154048, -1.467859, -3.05447, 1, 0.7686275, 0, 1,
-1.14266, -0.6739935, -4.048731, 1, 0.772549, 0, 1,
-1.139765, 0.8767709, -0.8612319, 1, 0.7803922, 0, 1,
-1.139584, -1.050844, -2.297777, 1, 0.7843137, 0, 1,
-1.138098, -0.2235035, -2.039331, 1, 0.7921569, 0, 1,
-1.138067, 0.04889936, 0.5789492, 1, 0.7960784, 0, 1,
-1.133956, -0.4582054, -2.429893, 1, 0.8039216, 0, 1,
-1.133917, -0.154834, -2.798696, 1, 0.8117647, 0, 1,
-1.123943, 2.004265, -1.371627, 1, 0.8156863, 0, 1,
-1.123599, 0.6292238, -1.574468, 1, 0.8235294, 0, 1,
-1.11997, 2.157613, -0.9210525, 1, 0.827451, 0, 1,
-1.115531, -0.2906074, -1.9858, 1, 0.8352941, 0, 1,
-1.115107, -0.8501065, -1.131025, 1, 0.8392157, 0, 1,
-1.113338, -0.1555001, -2.181394, 1, 0.8470588, 0, 1,
-1.107089, 0.6306842, -1.558586, 1, 0.8509804, 0, 1,
-1.105279, 0.5776797, 1.880796, 1, 0.8588235, 0, 1,
-1.10136, -1.259477, -2.519399, 1, 0.8627451, 0, 1,
-1.097404, -2.653723, -2.586478, 1, 0.8705882, 0, 1,
-1.08092, -0.2792105, -1.853407, 1, 0.8745098, 0, 1,
-1.080035, 0.9689413, 0.7517663, 1, 0.8823529, 0, 1,
-1.07528, -0.9758835, -1.658872, 1, 0.8862745, 0, 1,
-1.070715, 0.1482658, -1.311987, 1, 0.8941177, 0, 1,
-1.067516, 0.6104684, -2.24198, 1, 0.8980392, 0, 1,
-1.067457, -0.1178386, -2.135907, 1, 0.9058824, 0, 1,
-1.067385, 0.02187795, -2.59755, 1, 0.9137255, 0, 1,
-1.06191, 0.2631387, -1.716787, 1, 0.9176471, 0, 1,
-1.056089, 0.4765582, -2.255426, 1, 0.9254902, 0, 1,
-1.053492, -1.035517, -2.154695, 1, 0.9294118, 0, 1,
-1.04544, -0.7531301, -3.004864, 1, 0.9372549, 0, 1,
-1.042784, -0.2379369, -1.673188, 1, 0.9411765, 0, 1,
-1.0386, -0.2987196, -1.026622, 1, 0.9490196, 0, 1,
-1.033129, 0.8879476, -0.9016969, 1, 0.9529412, 0, 1,
-1.032852, 1.401149, -0.7877609, 1, 0.9607843, 0, 1,
-1.029902, 0.1542312, 0.195245, 1, 0.9647059, 0, 1,
-1.028681, -0.5487154, -1.146478, 1, 0.972549, 0, 1,
-1.018284, 0.2936374, -4.148931, 1, 0.9764706, 0, 1,
-1.018258, 0.5858884, 0.3317963, 1, 0.9843137, 0, 1,
-1.016862, -0.3549635, -3.174619, 1, 0.9882353, 0, 1,
-1.012791, 0.2995362, -1.470662, 1, 0.9960784, 0, 1,
-1.011386, -0.3470813, -2.364681, 0.9960784, 1, 0, 1,
-1.011098, 1.577188, -0.02419431, 0.9921569, 1, 0, 1,
-1.008581, -1.227366, -1.076869, 0.9843137, 1, 0, 1,
-1.006328, 2.424865, 0.2344207, 0.9803922, 1, 0, 1,
-1.005697, -0.4198809, -3.114591, 0.972549, 1, 0, 1,
-0.9963071, -1.961659, -2.974607, 0.9686275, 1, 0, 1,
-0.9961398, -0.4825984, -2.288074, 0.9607843, 1, 0, 1,
-0.9950403, 1.022928, -2.933696, 0.9568627, 1, 0, 1,
-0.9950068, -1.17667, -2.863987, 0.9490196, 1, 0, 1,
-0.9945589, -0.8147197, -1.555661, 0.945098, 1, 0, 1,
-0.9935696, 0.6799164, -1.234934, 0.9372549, 1, 0, 1,
-0.9844353, 0.7665948, -1.328752, 0.9333333, 1, 0, 1,
-0.9654416, -0.06519569, -2.887293, 0.9254902, 1, 0, 1,
-0.9653989, -0.3450366, -1.129389, 0.9215686, 1, 0, 1,
-0.9605056, 0.03777269, -1.043891, 0.9137255, 1, 0, 1,
-0.9598731, 0.6941078, -2.287276, 0.9098039, 1, 0, 1,
-0.9558942, -0.3170062, -2.74934, 0.9019608, 1, 0, 1,
-0.9555843, -1.541987, -2.291862, 0.8941177, 1, 0, 1,
-0.9549873, -0.1326984, -1.301447, 0.8901961, 1, 0, 1,
-0.953606, 1.475427, -2.376432, 0.8823529, 1, 0, 1,
-0.9519917, 0.5465413, -0.4783198, 0.8784314, 1, 0, 1,
-0.946113, -0.4819151, -2.044334, 0.8705882, 1, 0, 1,
-0.9436473, 1.777297, -0.5208233, 0.8666667, 1, 0, 1,
-0.9377332, 1.149027, 0.4953395, 0.8588235, 1, 0, 1,
-0.933527, -1.256683, -2.740791, 0.854902, 1, 0, 1,
-0.9329792, -0.8975182, -1.217328, 0.8470588, 1, 0, 1,
-0.915804, 0.4209763, -0.2214953, 0.8431373, 1, 0, 1,
-0.9010274, 0.161428, -1.763592, 0.8352941, 1, 0, 1,
-0.9002886, -0.5458634, -1.486044, 0.8313726, 1, 0, 1,
-0.8933132, -0.2802983, -2.330466, 0.8235294, 1, 0, 1,
-0.8882022, 0.9877497, -1.072817, 0.8196079, 1, 0, 1,
-0.8838962, 1.022755, -0.5330316, 0.8117647, 1, 0, 1,
-0.8733971, 0.6824395, -1.193085, 0.8078431, 1, 0, 1,
-0.8697458, 0.5960068, -0.1004192, 0.8, 1, 0, 1,
-0.8635974, 0.5639397, -1.315039, 0.7921569, 1, 0, 1,
-0.8612899, 0.04362256, -0.617396, 0.7882353, 1, 0, 1,
-0.8548635, -0.3551966, -1.689113, 0.7803922, 1, 0, 1,
-0.8527627, 0.07520384, -1.748001, 0.7764706, 1, 0, 1,
-0.8489577, -1.20135, -2.154369, 0.7686275, 1, 0, 1,
-0.844623, 0.4150552, -0.9453466, 0.7647059, 1, 0, 1,
-0.8428683, 1.092754, -1.574714, 0.7568628, 1, 0, 1,
-0.84021, -0.5727075, -2.36159, 0.7529412, 1, 0, 1,
-0.8399393, 0.1126735, -0.5019129, 0.7450981, 1, 0, 1,
-0.8377668, -0.7656033, -1.242875, 0.7411765, 1, 0, 1,
-0.8315474, 0.144731, -0.4895124, 0.7333333, 1, 0, 1,
-0.8294127, 0.54599, -0.2814855, 0.7294118, 1, 0, 1,
-0.822147, -0.7007077, -2.654161, 0.7215686, 1, 0, 1,
-0.8197055, -1.517294, -3.54489, 0.7176471, 1, 0, 1,
-0.8163087, -0.2371306, -1.593131, 0.7098039, 1, 0, 1,
-0.8135309, -0.9915422, -2.357528, 0.7058824, 1, 0, 1,
-0.8081152, 0.6744946, -1.792406, 0.6980392, 1, 0, 1,
-0.807983, -0.6111046, -1.35082, 0.6901961, 1, 0, 1,
-0.8018679, 1.344573, -1.009587, 0.6862745, 1, 0, 1,
-0.8012283, 1.104015, -0.7497205, 0.6784314, 1, 0, 1,
-0.8012148, 0.001820242, -3.906454, 0.6745098, 1, 0, 1,
-0.7982912, 0.3265659, -1.914758, 0.6666667, 1, 0, 1,
-0.7954199, -0.02323064, -2.843586, 0.6627451, 1, 0, 1,
-0.7879148, -0.8276596, -2.716833, 0.654902, 1, 0, 1,
-0.785866, 1.02209, -1.013427, 0.6509804, 1, 0, 1,
-0.7835768, -0.7720263, -2.471658, 0.6431373, 1, 0, 1,
-0.7822797, -0.6243162, -2.176067, 0.6392157, 1, 0, 1,
-0.7800172, -1.205493, -2.335784, 0.6313726, 1, 0, 1,
-0.7751632, 1.221935, -2.051896, 0.627451, 1, 0, 1,
-0.7692115, 0.1694853, -0.2560543, 0.6196079, 1, 0, 1,
-0.7617897, 0.5984726, -1.97883, 0.6156863, 1, 0, 1,
-0.7608833, 0.066335, -2.021008, 0.6078432, 1, 0, 1,
-0.7581859, 0.007050886, -0.6564921, 0.6039216, 1, 0, 1,
-0.7579292, -0.1569877, -2.305419, 0.5960785, 1, 0, 1,
-0.7520541, 0.9330196, -0.2209646, 0.5882353, 1, 0, 1,
-0.750908, 1.842769, 1.267712, 0.5843138, 1, 0, 1,
-0.745905, 1.336229, -1.611296, 0.5764706, 1, 0, 1,
-0.745585, 1.503412, -0.5294839, 0.572549, 1, 0, 1,
-0.7377548, -0.2485578, -0.2924871, 0.5647059, 1, 0, 1,
-0.7359129, -1.324473, -1.612736, 0.5607843, 1, 0, 1,
-0.7330918, -1.312893, -2.06908, 0.5529412, 1, 0, 1,
-0.7324401, -0.01029615, -1.133339, 0.5490196, 1, 0, 1,
-0.7306468, -1.741113, -1.264848, 0.5411765, 1, 0, 1,
-0.7302347, -1.53006, -2.56614, 0.5372549, 1, 0, 1,
-0.7300164, 0.2796033, 0.9642785, 0.5294118, 1, 0, 1,
-0.7258733, 0.9928357, -1.322142, 0.5254902, 1, 0, 1,
-0.7192153, 0.5973793, -1.189685, 0.5176471, 1, 0, 1,
-0.7166573, -0.6643102, -2.639185, 0.5137255, 1, 0, 1,
-0.7149183, -0.4364238, -3.425217, 0.5058824, 1, 0, 1,
-0.7074954, 0.285364, -1.102056, 0.5019608, 1, 0, 1,
-0.7060437, 2.201483, 0.9782073, 0.4941176, 1, 0, 1,
-0.7019993, -0.9626634, -3.319009, 0.4862745, 1, 0, 1,
-0.7016741, -0.6311905, -1.552169, 0.4823529, 1, 0, 1,
-0.7010594, 0.5533034, -1.263805, 0.4745098, 1, 0, 1,
-0.6970707, -1.479288, -1.4814, 0.4705882, 1, 0, 1,
-0.6928408, -0.8882018, -2.859977, 0.4627451, 1, 0, 1,
-0.69094, 0.4189987, -0.3985865, 0.4588235, 1, 0, 1,
-0.6869618, 0.7774245, -2.528746, 0.4509804, 1, 0, 1,
-0.68613, 0.4920416, -0.0878116, 0.4470588, 1, 0, 1,
-0.6811129, -0.8112226, -2.107314, 0.4392157, 1, 0, 1,
-0.6764919, -0.653834, -2.507043, 0.4352941, 1, 0, 1,
-0.6722621, 0.3136, -1.701661, 0.427451, 1, 0, 1,
-0.6722549, 1.11445, -1.543365, 0.4235294, 1, 0, 1,
-0.6716426, -1.098364, -3.343513, 0.4156863, 1, 0, 1,
-0.6554281, -0.04457753, -1.231784, 0.4117647, 1, 0, 1,
-0.6506667, 0.297815, -0.8618913, 0.4039216, 1, 0, 1,
-0.6480504, -2.653663, -4.499712, 0.3960784, 1, 0, 1,
-0.6469695, 0.1019449, -1.51206, 0.3921569, 1, 0, 1,
-0.6406401, 0.792824, -1.218174, 0.3843137, 1, 0, 1,
-0.6406301, -1.138504, -2.859212, 0.3803922, 1, 0, 1,
-0.6343106, 1.569634, 0.02904203, 0.372549, 1, 0, 1,
-0.6334558, -1.943245, -1.315042, 0.3686275, 1, 0, 1,
-0.6179064, 0.4421223, -1.512126, 0.3607843, 1, 0, 1,
-0.6162166, -0.4248219, -2.280323, 0.3568628, 1, 0, 1,
-0.6120615, -0.8271801, -3.329285, 0.3490196, 1, 0, 1,
-0.6086106, 1.046588, 0.9395686, 0.345098, 1, 0, 1,
-0.6083213, 0.4876154, -0.873576, 0.3372549, 1, 0, 1,
-0.60765, -1.233584, -2.972508, 0.3333333, 1, 0, 1,
-0.6040624, -0.3706192, -2.781211, 0.3254902, 1, 0, 1,
-0.5992198, -0.6258345, -2.458284, 0.3215686, 1, 0, 1,
-0.5966802, -0.1112914, -1.488912, 0.3137255, 1, 0, 1,
-0.5955924, 1.202672, -1.12919, 0.3098039, 1, 0, 1,
-0.5952621, -0.3913315, -1.900912, 0.3019608, 1, 0, 1,
-0.5952006, 0.1931592, -0.5536045, 0.2941177, 1, 0, 1,
-0.5941215, 1.86823, 0.8915898, 0.2901961, 1, 0, 1,
-0.5856467, -0.4768998, -2.210857, 0.282353, 1, 0, 1,
-0.5839543, -0.1677006, -2.824432, 0.2784314, 1, 0, 1,
-0.5827795, -0.9850687, -2.725203, 0.2705882, 1, 0, 1,
-0.5810564, -0.4670979, -2.810433, 0.2666667, 1, 0, 1,
-0.5771465, 0.6880955, 2.545395, 0.2588235, 1, 0, 1,
-0.5763031, 0.3469793, 0.3540595, 0.254902, 1, 0, 1,
-0.5746068, -0.8345956, -2.268355, 0.2470588, 1, 0, 1,
-0.571959, -0.3740871, -2.347656, 0.2431373, 1, 0, 1,
-0.5711568, -0.007051079, -2.122915, 0.2352941, 1, 0, 1,
-0.5656945, 0.45434, -2.141677, 0.2313726, 1, 0, 1,
-0.5630133, 1.657652, 0.08679709, 0.2235294, 1, 0, 1,
-0.5617947, 0.2579105, -0.9554292, 0.2196078, 1, 0, 1,
-0.5549676, -1.868031, -2.605298, 0.2117647, 1, 0, 1,
-0.5545999, -0.6305187, -1.031613, 0.2078431, 1, 0, 1,
-0.5532885, 0.004052328, -1.13119, 0.2, 1, 0, 1,
-0.549319, 0.1369471, -0.3302997, 0.1921569, 1, 0, 1,
-0.5439404, -0.04589422, -1.521838, 0.1882353, 1, 0, 1,
-0.5397775, 0.6011188, -1.239782, 0.1803922, 1, 0, 1,
-0.5387148, -0.2267387, -2.189294, 0.1764706, 1, 0, 1,
-0.537982, 0.1412237, -1.219477, 0.1686275, 1, 0, 1,
-0.5377157, -0.6069008, -0.4710317, 0.1647059, 1, 0, 1,
-0.5347485, 0.5867003, -0.5125644, 0.1568628, 1, 0, 1,
-0.5336375, -0.2542503, -0.9982486, 0.1529412, 1, 0, 1,
-0.530088, 0.7777121, -1.313197, 0.145098, 1, 0, 1,
-0.5286355, -0.8165448, -3.484636, 0.1411765, 1, 0, 1,
-0.52849, -1.508535, -0.8248207, 0.1333333, 1, 0, 1,
-0.5269583, 0.9520253, -1.579178, 0.1294118, 1, 0, 1,
-0.5226857, 0.2768005, -0.7033153, 0.1215686, 1, 0, 1,
-0.5184899, -0.5733472, -2.169137, 0.1176471, 1, 0, 1,
-0.5139757, -0.9363594, -2.2537, 0.1098039, 1, 0, 1,
-0.5136947, 0.2087033, 0.8547269, 0.1058824, 1, 0, 1,
-0.5129722, -0.8716236, -2.347345, 0.09803922, 1, 0, 1,
-0.5115723, 1.328957, -0.5405644, 0.09019608, 1, 0, 1,
-0.5072589, -1.955985, -2.944429, 0.08627451, 1, 0, 1,
-0.504679, 0.2267159, -1.316736, 0.07843138, 1, 0, 1,
-0.5041363, 1.091309, 1.005908, 0.07450981, 1, 0, 1,
-0.5012912, 0.933428, -0.9310521, 0.06666667, 1, 0, 1,
-0.5010601, 0.09588256, -2.135636, 0.0627451, 1, 0, 1,
-0.4979504, -0.2233481, -4.214349, 0.05490196, 1, 0, 1,
-0.4960257, 0.1845094, -0.900241, 0.05098039, 1, 0, 1,
-0.4953684, -1.00665, -2.55192, 0.04313726, 1, 0, 1,
-0.4932777, 0.06655419, -3.047271, 0.03921569, 1, 0, 1,
-0.4930415, -1.082848, -3.636176, 0.03137255, 1, 0, 1,
-0.492753, 0.1072183, -0.7456658, 0.02745098, 1, 0, 1,
-0.4905134, -0.8550753, -3.180668, 0.01960784, 1, 0, 1,
-0.4903716, -0.689831, -3.333687, 0.01568628, 1, 0, 1,
-0.489594, 0.03037878, -0.7033893, 0.007843138, 1, 0, 1,
-0.4852507, 1.516303, -0.9083331, 0.003921569, 1, 0, 1,
-0.484001, 1.120374, 1.456931, 0, 1, 0.003921569, 1,
-0.4823579, -0.3690543, -2.464803, 0, 1, 0.01176471, 1,
-0.4781727, 0.5925727, 1.424298, 0, 1, 0.01568628, 1,
-0.4778149, -1.430645, -1.587823, 0, 1, 0.02352941, 1,
-0.4756028, 0.8450993, -1.289931, 0, 1, 0.02745098, 1,
-0.4747279, 1.338995, -1.021815, 0, 1, 0.03529412, 1,
-0.4727997, -0.5975565, -2.710386, 0, 1, 0.03921569, 1,
-0.4712676, -0.08664801, -0.4692842, 0, 1, 0.04705882, 1,
-0.4693767, 0.2289578, 0.3002554, 0, 1, 0.05098039, 1,
-0.4682594, 0.1734043, -1.220283, 0, 1, 0.05882353, 1,
-0.4681961, 1.168121, 0.3013162, 0, 1, 0.0627451, 1,
-0.4611901, 0.5869187, 0.7544433, 0, 1, 0.07058824, 1,
-0.4545479, 0.3145013, -1.0809, 0, 1, 0.07450981, 1,
-0.4489006, 0.2003859, 0.06236885, 0, 1, 0.08235294, 1,
-0.4470017, -1.578034, -3.551471, 0, 1, 0.08627451, 1,
-0.4441086, 1.05694, -1.431728, 0, 1, 0.09411765, 1,
-0.4438903, 0.03686677, -1.647844, 0, 1, 0.1019608, 1,
-0.4429521, -0.920162, -2.502052, 0, 1, 0.1058824, 1,
-0.4428087, 0.7901556, 0.4647036, 0, 1, 0.1137255, 1,
-0.4419332, 1.717175, -0.3612069, 0, 1, 0.1176471, 1,
-0.4418848, 1.286531, 0.4822206, 0, 1, 0.1254902, 1,
-0.4414504, 0.1037092, -4.475002, 0, 1, 0.1294118, 1,
-0.4398083, 0.3765835, 0.4136123, 0, 1, 0.1372549, 1,
-0.4382352, 0.9112837, -1.019397, 0, 1, 0.1411765, 1,
-0.4257057, -1.036734, -2.5064, 0, 1, 0.1490196, 1,
-0.4221997, 1.32921, 0.9439055, 0, 1, 0.1529412, 1,
-0.4205926, -1.226488, -2.523422, 0, 1, 0.1607843, 1,
-0.4199775, -0.9408476, -0.9650215, 0, 1, 0.1647059, 1,
-0.4195867, 0.4518969, -0.1898569, 0, 1, 0.172549, 1,
-0.4168941, 2.496994, -0.5304908, 0, 1, 0.1764706, 1,
-0.414256, 1.101503, -1.117577, 0, 1, 0.1843137, 1,
-0.4098964, -1.189134, -5.056345, 0, 1, 0.1882353, 1,
-0.4090628, -0.04515366, -2.154992, 0, 1, 0.1960784, 1,
-0.4088648, -0.3028565, -4.576977, 0, 1, 0.2039216, 1,
-0.4057032, -1.083215, -3.521449, 0, 1, 0.2078431, 1,
-0.3999014, -0.5467141, -1.42546, 0, 1, 0.2156863, 1,
-0.3971267, 0.9279892, 0.5510433, 0, 1, 0.2196078, 1,
-0.3959976, 0.3379457, -0.7559082, 0, 1, 0.227451, 1,
-0.3932976, -0.4993566, -2.757442, 0, 1, 0.2313726, 1,
-0.3926507, -2.757357, -3.122691, 0, 1, 0.2392157, 1,
-0.3922306, -0.9800203, -1.68237, 0, 1, 0.2431373, 1,
-0.3900824, 0.4034288, -0.6497031, 0, 1, 0.2509804, 1,
-0.3878345, 0.4462902, -0.5137213, 0, 1, 0.254902, 1,
-0.3859223, -0.3298394, -1.53258, 0, 1, 0.2627451, 1,
-0.3816704, -0.5768033, -1.881789, 0, 1, 0.2666667, 1,
-0.3791386, -0.002983042, -1.141294, 0, 1, 0.2745098, 1,
-0.3619342, -0.9357809, -2.876812, 0, 1, 0.2784314, 1,
-0.3584874, -0.3409647, -2.42659, 0, 1, 0.2862745, 1,
-0.3567219, 0.7495874, -1.035093, 0, 1, 0.2901961, 1,
-0.3556118, -0.3178411, -0.9390329, 0, 1, 0.2980392, 1,
-0.351025, 0.2104991, -2.509706, 0, 1, 0.3058824, 1,
-0.3504744, -0.6560392, -2.201065, 0, 1, 0.3098039, 1,
-0.3473761, 0.4675121, -0.8185428, 0, 1, 0.3176471, 1,
-0.3446521, 0.255229, -1.808517, 0, 1, 0.3215686, 1,
-0.3419112, -0.3292259, 0.144641, 0, 1, 0.3294118, 1,
-0.3416329, -0.1529591, -1.105035, 0, 1, 0.3333333, 1,
-0.3403735, -0.339774, -1.882664, 0, 1, 0.3411765, 1,
-0.3379324, -0.7386286, -3.605311, 0, 1, 0.345098, 1,
-0.334668, -0.2629407, -1.651464, 0, 1, 0.3529412, 1,
-0.3346671, 1.795082, 0.2002388, 0, 1, 0.3568628, 1,
-0.3343291, -0.522758, -2.949978, 0, 1, 0.3647059, 1,
-0.3340435, 1.523785, -0.3929963, 0, 1, 0.3686275, 1,
-0.3329373, -0.4236381, -2.154469, 0, 1, 0.3764706, 1,
-0.3272083, 0.1331562, -0.6214666, 0, 1, 0.3803922, 1,
-0.3247835, 1.471398, -0.7420109, 0, 1, 0.3882353, 1,
-0.3132942, 0.5469239, -0.4710346, 0, 1, 0.3921569, 1,
-0.3129813, 0.5578814, -1.719278, 0, 1, 0.4, 1,
-0.3126236, 1.257181, 0.6353658, 0, 1, 0.4078431, 1,
-0.3103789, -0.1051451, -3.84277, 0, 1, 0.4117647, 1,
-0.3103464, 0.5638494, -0.1353958, 0, 1, 0.4196078, 1,
-0.3060167, -0.09964093, -1.503102, 0, 1, 0.4235294, 1,
-0.3046518, 1.026413, -0.3793047, 0, 1, 0.4313726, 1,
-0.3036403, 0.8706387, -0.1496404, 0, 1, 0.4352941, 1,
-0.3030867, -0.9188455, -2.518723, 0, 1, 0.4431373, 1,
-0.3029988, 0.5488223, -1.599479, 0, 1, 0.4470588, 1,
-0.3028919, 1.314298, -1.371209, 0, 1, 0.454902, 1,
-0.3022182, -0.479503, -2.318811, 0, 1, 0.4588235, 1,
-0.3021818, -1.293439, -2.003703, 0, 1, 0.4666667, 1,
-0.3016155, 0.3749759, -3.301796, 0, 1, 0.4705882, 1,
-0.2981958, -1.888729, -3.312318, 0, 1, 0.4784314, 1,
-0.2978142, -0.6894837, -2.607566, 0, 1, 0.4823529, 1,
-0.2974048, 0.1987789, -0.4937445, 0, 1, 0.4901961, 1,
-0.2970896, 0.581321, 0.1390714, 0, 1, 0.4941176, 1,
-0.2956631, 0.8093407, -0.3238753, 0, 1, 0.5019608, 1,
-0.2950429, 0.2067492, -0.4587896, 0, 1, 0.509804, 1,
-0.2940685, 0.6814855, -0.3782848, 0, 1, 0.5137255, 1,
-0.2858432, -0.09130353, -0.2083627, 0, 1, 0.5215687, 1,
-0.2792234, 0.609829, -0.8746803, 0, 1, 0.5254902, 1,
-0.2773843, 0.4651654, 1.502948, 0, 1, 0.5333334, 1,
-0.2738527, -0.9142641, -3.453641, 0, 1, 0.5372549, 1,
-0.2630964, -0.7559198, -4.419217, 0, 1, 0.5450981, 1,
-0.26242, 0.6120003, -0.08471111, 0, 1, 0.5490196, 1,
-0.2581686, -0.6323979, -3.07392, 0, 1, 0.5568628, 1,
-0.2555452, 0.08252686, -0.7614508, 0, 1, 0.5607843, 1,
-0.2513562, -0.6219686, -3.169511, 0, 1, 0.5686275, 1,
-0.2508146, 0.8253227, 0.002280048, 0, 1, 0.572549, 1,
-0.2467897, 0.7056231, -1.493856, 0, 1, 0.5803922, 1,
-0.2454393, 0.8679427, -2.583944, 0, 1, 0.5843138, 1,
-0.2433085, -0.8343095, -3.664103, 0, 1, 0.5921569, 1,
-0.2417515, -1.693292, -3.690221, 0, 1, 0.5960785, 1,
-0.239561, -0.6078575, -2.868251, 0, 1, 0.6039216, 1,
-0.2382432, 0.3413284, -0.5052994, 0, 1, 0.6117647, 1,
-0.2376859, 0.5412415, -0.9948542, 0, 1, 0.6156863, 1,
-0.2373241, 0.9505318, 0.1822156, 0, 1, 0.6235294, 1,
-0.2371559, 0.119955, -1.205966, 0, 1, 0.627451, 1,
-0.232845, 1.280873, 0.006236722, 0, 1, 0.6352941, 1,
-0.2321749, 0.2197851, -2.763182, 0, 1, 0.6392157, 1,
-0.2314556, 0.4077051, -2.584461, 0, 1, 0.6470588, 1,
-0.2277036, 1.914934, -1.011474, 0, 1, 0.6509804, 1,
-0.2239373, -1.211494, -3.552481, 0, 1, 0.6588235, 1,
-0.2211042, -0.5553538, -4.138109, 0, 1, 0.6627451, 1,
-0.2189477, -0.3668738, -4.338684, 0, 1, 0.6705883, 1,
-0.2141556, 0.7023895, 0.4320504, 0, 1, 0.6745098, 1,
-0.2105606, 1.003185, 0.5118852, 0, 1, 0.682353, 1,
-0.2104958, 0.392113, 0.7099269, 0, 1, 0.6862745, 1,
-0.2095583, -1.577957, -2.480462, 0, 1, 0.6941177, 1,
-0.2071841, -1.762856, -5.164128, 0, 1, 0.7019608, 1,
-0.2070065, 1.498265, -0.5338987, 0, 1, 0.7058824, 1,
-0.2060552, -0.557838, -5.407941, 0, 1, 0.7137255, 1,
-0.2056155, -1.022536, -2.499049, 0, 1, 0.7176471, 1,
-0.2050864, -0.2329504, -2.929733, 0, 1, 0.7254902, 1,
-0.1980171, 1.315071, -1.489852, 0, 1, 0.7294118, 1,
-0.1975974, 0.1705576, -2.554182, 0, 1, 0.7372549, 1,
-0.1974228, 0.441504, 0.0381904, 0, 1, 0.7411765, 1,
-0.195323, 0.6793203, -2.974061, 0, 1, 0.7490196, 1,
-0.1946819, 0.1413149, 0.03968269, 0, 1, 0.7529412, 1,
-0.1929237, -0.389266, -3.388007, 0, 1, 0.7607843, 1,
-0.1921385, 0.1166648, -2.99029, 0, 1, 0.7647059, 1,
-0.1909506, 1.673498, 1.07484, 0, 1, 0.772549, 1,
-0.1898205, 0.1652741, -0.1937033, 0, 1, 0.7764706, 1,
-0.189146, -0.8161654, -3.37457, 0, 1, 0.7843137, 1,
-0.1819634, -2.058059, -3.355043, 0, 1, 0.7882353, 1,
-0.1796179, -0.7457427, -3.541203, 0, 1, 0.7960784, 1,
-0.1778482, 0.2930179, 0.01878002, 0, 1, 0.8039216, 1,
-0.1774622, 0.1344627, -1.53235, 0, 1, 0.8078431, 1,
-0.1763505, 1.227069, -0.2747448, 0, 1, 0.8156863, 1,
-0.176222, 0.004851969, -1.415706, 0, 1, 0.8196079, 1,
-0.169147, -0.7225626, -2.291412, 0, 1, 0.827451, 1,
-0.1689891, -1.848443, -3.259181, 0, 1, 0.8313726, 1,
-0.1677448, 0.8273903, -1.469894, 0, 1, 0.8392157, 1,
-0.1669513, 0.3759668, -0.4075338, 0, 1, 0.8431373, 1,
-0.1650157, 2.312335, -0.9343734, 0, 1, 0.8509804, 1,
-0.1627963, -0.3529059, -0.6254437, 0, 1, 0.854902, 1,
-0.1616043, 1.281187, -1.851327, 0, 1, 0.8627451, 1,
-0.1568393, -1.25693, -2.762712, 0, 1, 0.8666667, 1,
-0.1565181, -0.7839094, -3.470138, 0, 1, 0.8745098, 1,
-0.1557671, -0.02985635, -1.372676, 0, 1, 0.8784314, 1,
-0.154542, -1.324836, -5.442498, 0, 1, 0.8862745, 1,
-0.1536696, 0.297433, -0.6872796, 0, 1, 0.8901961, 1,
-0.1519945, 1.765874, 0.4161799, 0, 1, 0.8980392, 1,
-0.1508702, 0.7278718, -0.5897233, 0, 1, 0.9058824, 1,
-0.1502984, 1.291832, 0.7198287, 0, 1, 0.9098039, 1,
-0.1498613, 0.06779449, -2.352096, 0, 1, 0.9176471, 1,
-0.1467615, 0.0672368, -1.900039, 0, 1, 0.9215686, 1,
-0.144856, 0.2697017, 0.8442529, 0, 1, 0.9294118, 1,
-0.1444864, 1.135089, 0.3634159, 0, 1, 0.9333333, 1,
-0.1410047, -0.465896, -2.811023, 0, 1, 0.9411765, 1,
-0.1274187, -0.1705937, -3.91201, 0, 1, 0.945098, 1,
-0.1240198, -0.1979561, -3.477275, 0, 1, 0.9529412, 1,
-0.1191437, 0.1102707, 0.3343358, 0, 1, 0.9568627, 1,
-0.1190445, -1.788514, -2.558305, 0, 1, 0.9647059, 1,
-0.1183261, 0.7340592, -0.7388873, 0, 1, 0.9686275, 1,
-0.1148821, -0.2444368, -5.197098, 0, 1, 0.9764706, 1,
-0.111055, 0.5942338, -0.275728, 0, 1, 0.9803922, 1,
-0.1108349, -0.3073745, -2.866997, 0, 1, 0.9882353, 1,
-0.110147, -1.269389, -1.80943, 0, 1, 0.9921569, 1,
-0.1079209, 1.044213, 1.571534, 0, 1, 1, 1,
-0.1030286, 0.3063797, 1.312363, 0, 0.9921569, 1, 1,
-0.1020869, -0.8290937, -2.890855, 0, 0.9882353, 1, 1,
-0.1004503, -1.416583, -3.751879, 0, 0.9803922, 1, 1,
-0.09130728, -0.4285205, -2.331632, 0, 0.9764706, 1, 1,
-0.08878908, 0.4136673, -1.524333, 0, 0.9686275, 1, 1,
-0.08224916, -1.553067, -2.858645, 0, 0.9647059, 1, 1,
-0.0778388, 0.9499267, -0.7507163, 0, 0.9568627, 1, 1,
-0.07442956, -1.018466, -3.531071, 0, 0.9529412, 1, 1,
-0.06867581, 0.5067346, -0.3300237, 0, 0.945098, 1, 1,
-0.06609905, -0.7380224, -2.629521, 0, 0.9411765, 1, 1,
-0.06580018, 0.9558105, 0.7185556, 0, 0.9333333, 1, 1,
-0.05638594, 1.438469, -1.268656, 0, 0.9294118, 1, 1,
-0.05462428, 0.06342017, -1.305272, 0, 0.9215686, 1, 1,
-0.04897301, -0.6032729, -5.479889, 0, 0.9176471, 1, 1,
-0.04891571, 0.1198675, -1.969001, 0, 0.9098039, 1, 1,
-0.04851078, -0.1455768, -2.321503, 0, 0.9058824, 1, 1,
-0.04468334, 2.639129, 1.141716, 0, 0.8980392, 1, 1,
-0.04192609, 2.361351, -0.4538303, 0, 0.8901961, 1, 1,
-0.03417234, -0.7826138, -2.853195, 0, 0.8862745, 1, 1,
-0.03378134, -0.9115781, -1.663863, 0, 0.8784314, 1, 1,
-0.03054864, -0.2547198, -2.49579, 0, 0.8745098, 1, 1,
-0.02711068, -0.2317941, -2.697916, 0, 0.8666667, 1, 1,
-0.02585713, 0.07381965, -1.003382, 0, 0.8627451, 1, 1,
-0.02514856, 0.4560198, 0.2675351, 0, 0.854902, 1, 1,
-0.02421068, 0.9334354, -1.395594, 0, 0.8509804, 1, 1,
-0.02303083, 0.5580418, -1.889257, 0, 0.8431373, 1, 1,
-0.02188991, -0.627314, -4.203153, 0, 0.8392157, 1, 1,
-0.01952528, -0.3363664, -3.407501, 0, 0.8313726, 1, 1,
-0.0195122, -0.5370926, -3.284806, 0, 0.827451, 1, 1,
-0.01917378, 0.1843311, 1.567608, 0, 0.8196079, 1, 1,
-0.01861821, 1.348679, -1.010521, 0, 0.8156863, 1, 1,
-0.01391127, 0.0807359, -1.671203, 0, 0.8078431, 1, 1,
-0.01263577, 0.4967177, -0.6103131, 0, 0.8039216, 1, 1,
-0.01081476, 0.5660622, -0.9827467, 0, 0.7960784, 1, 1,
-0.008101529, 0.1364562, 0.1345649, 0, 0.7882353, 1, 1,
0.0001866905, 0.03502822, -0.1573835, 0, 0.7843137, 1, 1,
0.002241567, -0.6586574, 2.25635, 0, 0.7764706, 1, 1,
0.01111124, 0.6053967, 0.7154588, 0, 0.772549, 1, 1,
0.01198826, 0.2904112, 1.153003, 0, 0.7647059, 1, 1,
0.02058694, 0.3181275, -0.9035451, 0, 0.7607843, 1, 1,
0.02295998, -0.5188081, 2.600599, 0, 0.7529412, 1, 1,
0.0276279, 1.080451, 0.5745183, 0, 0.7490196, 1, 1,
0.03424842, 1.350236, 2.774255, 0, 0.7411765, 1, 1,
0.03439311, 1.594211, -1.22871, 0, 0.7372549, 1, 1,
0.04084788, 1.956331, 1.792432, 0, 0.7294118, 1, 1,
0.04466216, -0.03558854, 0.739085, 0, 0.7254902, 1, 1,
0.0475098, 0.4052441, -0.1742719, 0, 0.7176471, 1, 1,
0.05129476, 0.3660108, 0.5413229, 0, 0.7137255, 1, 1,
0.05169451, -1.843763, 2.290351, 0, 0.7058824, 1, 1,
0.05571163, -0.8787841, 5.069983, 0, 0.6980392, 1, 1,
0.06012794, -1.631162, -0.2099226, 0, 0.6941177, 1, 1,
0.06564244, 0.6567051, 0.1201297, 0, 0.6862745, 1, 1,
0.06632093, 1.424429, 0.8731179, 0, 0.682353, 1, 1,
0.06719266, 1.628469, -0.3290311, 0, 0.6745098, 1, 1,
0.06890341, 0.2699423, -0.8397824, 0, 0.6705883, 1, 1,
0.06896236, -1.106225, 2.840548, 0, 0.6627451, 1, 1,
0.06931846, 0.8243974, 1.065313, 0, 0.6588235, 1, 1,
0.06989625, -0.6692427, 3.827915, 0, 0.6509804, 1, 1,
0.07066356, 0.03161757, 1.815669, 0, 0.6470588, 1, 1,
0.07166808, -0.4880379, 3.143953, 0, 0.6392157, 1, 1,
0.07210554, -0.4921391, 2.410782, 0, 0.6352941, 1, 1,
0.07716003, 1.414667, 0.6688206, 0, 0.627451, 1, 1,
0.07852093, -0.4103164, 3.084384, 0, 0.6235294, 1, 1,
0.08174163, -1.354662, 3.302341, 0, 0.6156863, 1, 1,
0.09226205, -0.315011, 1.647187, 0, 0.6117647, 1, 1,
0.09312885, 1.436615, 0.2490382, 0, 0.6039216, 1, 1,
0.09734498, 0.2709682, 0.4474498, 0, 0.5960785, 1, 1,
0.09867269, 0.2184807, 0.8217186, 0, 0.5921569, 1, 1,
0.09881148, -0.9490611, 2.888879, 0, 0.5843138, 1, 1,
0.1004768, -0.110257, 2.701269, 0, 0.5803922, 1, 1,
0.1039117, 0.4058731, 1.31699, 0, 0.572549, 1, 1,
0.1166885, 0.7719492, 0.00332471, 0, 0.5686275, 1, 1,
0.1193104, 1.464815, 0.1796894, 0, 0.5607843, 1, 1,
0.1238062, -0.07104784, 0.6644664, 0, 0.5568628, 1, 1,
0.1330383, -0.6319489, 3.121041, 0, 0.5490196, 1, 1,
0.1356696, 0.3393801, -0.3246737, 0, 0.5450981, 1, 1,
0.135947, 0.5591015, 1.025893, 0, 0.5372549, 1, 1,
0.1370788, 0.6429254, 0.8231376, 0, 0.5333334, 1, 1,
0.1404468, 2.116272, -0.2151084, 0, 0.5254902, 1, 1,
0.1406164, 1.895526, 2.71447, 0, 0.5215687, 1, 1,
0.1447787, 0.5650291, -1.753103, 0, 0.5137255, 1, 1,
0.1473481, 2.496754, -0.2530163, 0, 0.509804, 1, 1,
0.1508519, 0.1085319, 2.49375, 0, 0.5019608, 1, 1,
0.1546995, 1.18578, 0.941581, 0, 0.4941176, 1, 1,
0.1555809, -0.4290793, 1.818561, 0, 0.4901961, 1, 1,
0.155843, -0.1375679, 1.727117, 0, 0.4823529, 1, 1,
0.1614233, -1.036137, 2.590038, 0, 0.4784314, 1, 1,
0.1615398, 0.5481687, 0.1538354, 0, 0.4705882, 1, 1,
0.1644169, 1.514507, 0.3766725, 0, 0.4666667, 1, 1,
0.1681524, -0.3199765, 3.328417, 0, 0.4588235, 1, 1,
0.170574, -0.3992447, 1.156451, 0, 0.454902, 1, 1,
0.1734651, 1.288569, 0.2858148, 0, 0.4470588, 1, 1,
0.1738077, -1.330713, 2.931139, 0, 0.4431373, 1, 1,
0.1750575, -0.0003825513, 2.44266, 0, 0.4352941, 1, 1,
0.1782792, 1.550719, 0.1541906, 0, 0.4313726, 1, 1,
0.1803605, -0.6522754, 1.811127, 0, 0.4235294, 1, 1,
0.1809608, 0.08895651, 1.154756, 0, 0.4196078, 1, 1,
0.1887219, 0.8655494, -0.4991813, 0, 0.4117647, 1, 1,
0.1918796, -0.5866202, 3.774988, 0, 0.4078431, 1, 1,
0.1947505, 1.118479, -0.1107222, 0, 0.4, 1, 1,
0.1952077, 1.385077, 0.8229521, 0, 0.3921569, 1, 1,
0.20505, -0.5525476, 2.487562, 0, 0.3882353, 1, 1,
0.2057112, -0.0122533, 1.589001, 0, 0.3803922, 1, 1,
0.2066201, -0.3745335, 3.269828, 0, 0.3764706, 1, 1,
0.2156417, 0.003583245, 2.715359, 0, 0.3686275, 1, 1,
0.2235725, -0.04198131, 2.12431, 0, 0.3647059, 1, 1,
0.2250761, -2.741512, 3.230913, 0, 0.3568628, 1, 1,
0.2297743, 0.4695302, 0.3567129, 0, 0.3529412, 1, 1,
0.2300597, -0.8894858, 3.780351, 0, 0.345098, 1, 1,
0.238883, -1.833917, 1.841278, 0, 0.3411765, 1, 1,
0.2414775, 0.1910966, 0.2753937, 0, 0.3333333, 1, 1,
0.2428247, -0.5154937, 2.390559, 0, 0.3294118, 1, 1,
0.2450041, -1.470748, 3.511238, 0, 0.3215686, 1, 1,
0.2492884, -2.116357, 3.166653, 0, 0.3176471, 1, 1,
0.2531047, -0.1712481, 2.296599, 0, 0.3098039, 1, 1,
0.2547141, 0.7110321, 0.8414892, 0, 0.3058824, 1, 1,
0.2558212, -0.8004362, 4.147702, 0, 0.2980392, 1, 1,
0.2562296, 0.1639448, 0.7873827, 0, 0.2901961, 1, 1,
0.2576472, -1.129658, 2.380499, 0, 0.2862745, 1, 1,
0.2638283, -0.3524771, 2.493327, 0, 0.2784314, 1, 1,
0.2709654, -0.5506077, 3.24204, 0, 0.2745098, 1, 1,
0.2711581, -1.633427, 3.567441, 0, 0.2666667, 1, 1,
0.2725469, 1.027344, -0.5549001, 0, 0.2627451, 1, 1,
0.2727451, 0.5309737, 0.7476483, 0, 0.254902, 1, 1,
0.2734197, 0.3136837, -0.2118065, 0, 0.2509804, 1, 1,
0.2746948, 0.2603973, 1.123765, 0, 0.2431373, 1, 1,
0.2771251, 1.453612, -0.4320854, 0, 0.2392157, 1, 1,
0.282747, -0.612459, 3.327198, 0, 0.2313726, 1, 1,
0.284946, 0.6665438, 0.7465553, 0, 0.227451, 1, 1,
0.2857572, 0.3775584, 1.694391, 0, 0.2196078, 1, 1,
0.2880143, -0.4181039, 1.234477, 0, 0.2156863, 1, 1,
0.2889473, 0.4492193, 1.975742, 0, 0.2078431, 1, 1,
0.2906522, 0.3030103, 0.7334, 0, 0.2039216, 1, 1,
0.2929951, 0.4402109, 1.497528, 0, 0.1960784, 1, 1,
0.293403, -0.2556493, 2.358747, 0, 0.1882353, 1, 1,
0.2965054, 0.365578, 0.7362335, 0, 0.1843137, 1, 1,
0.3014051, 1.427646, 0.6017198, 0, 0.1764706, 1, 1,
0.3097196, 0.4833722, -0.07817253, 0, 0.172549, 1, 1,
0.3128238, 0.3937268, 0.02621367, 0, 0.1647059, 1, 1,
0.3132862, -1.697327, 4.161201, 0, 0.1607843, 1, 1,
0.3138079, 0.006338765, 3.17139, 0, 0.1529412, 1, 1,
0.31459, -0.2805425, 3.215973, 0, 0.1490196, 1, 1,
0.3156637, 0.4659288, -0.2141057, 0, 0.1411765, 1, 1,
0.319046, -0.709684, 3.953499, 0, 0.1372549, 1, 1,
0.3194463, -1.777132, 5.34349, 0, 0.1294118, 1, 1,
0.3227897, -1.87165, 2.730101, 0, 0.1254902, 1, 1,
0.3233076, 0.317872, 1.638321, 0, 0.1176471, 1, 1,
0.3318265, 1.147854, 1.654085, 0, 0.1137255, 1, 1,
0.3337269, -0.003760504, 2.067861, 0, 0.1058824, 1, 1,
0.3348815, 3.287266, -1.049278, 0, 0.09803922, 1, 1,
0.3367425, 0.5686104, -0.1781723, 0, 0.09411765, 1, 1,
0.3369172, -0.04718341, 2.444258, 0, 0.08627451, 1, 1,
0.3384676, 0.4980505, 0.4635401, 0, 0.08235294, 1, 1,
0.3432546, -0.06768367, 0.981941, 0, 0.07450981, 1, 1,
0.3440224, -0.04698529, 0.761135, 0, 0.07058824, 1, 1,
0.350657, 0.03129979, 1.9151, 0, 0.0627451, 1, 1,
0.3571989, 1.280826, -2.578938, 0, 0.05882353, 1, 1,
0.3578055, -0.3843176, 4.234927, 0, 0.05098039, 1, 1,
0.3584554, -0.09775171, 0.2098242, 0, 0.04705882, 1, 1,
0.3596109, 0.9867308, 0.9133829, 0, 0.03921569, 1, 1,
0.3646151, 2.826895, 0.8317351, 0, 0.03529412, 1, 1,
0.37767, -0.7839556, 3.050721, 0, 0.02745098, 1, 1,
0.3822268, 0.08841988, 0.6437323, 0, 0.02352941, 1, 1,
0.382234, 0.5895695, 0.8229577, 0, 0.01568628, 1, 1,
0.3841793, -0.1601583, 2.437002, 0, 0.01176471, 1, 1,
0.3847784, 0.1892766, 2.362855, 0, 0.003921569, 1, 1,
0.3861804, -0.1615711, 3.938109, 0.003921569, 0, 1, 1,
0.3896711, 1.178297, 0.7188124, 0.007843138, 0, 1, 1,
0.3916555, -0.9970885, 1.671488, 0.01568628, 0, 1, 1,
0.3943267, 2.064441, -1.323188, 0.01960784, 0, 1, 1,
0.3953478, 0.7348276, 1.140931, 0.02745098, 0, 1, 1,
0.3993956, 0.6737182, 1.024928, 0.03137255, 0, 1, 1,
0.4000381, 0.4443766, 2.047024, 0.03921569, 0, 1, 1,
0.4037763, -1.252106, 2.425008, 0.04313726, 0, 1, 1,
0.4043013, 1.444275, 0.8233043, 0.05098039, 0, 1, 1,
0.4125972, 0.1594114, 1.913211, 0.05490196, 0, 1, 1,
0.4136663, 0.3729786, 0.6508819, 0.0627451, 0, 1, 1,
0.4138718, 0.2196504, 1.214959, 0.06666667, 0, 1, 1,
0.4162131, -0.9884641, 2.794452, 0.07450981, 0, 1, 1,
0.4172, 1.747815, 2.216134, 0.07843138, 0, 1, 1,
0.4172288, -2.543851, 2.917875, 0.08627451, 0, 1, 1,
0.4186668, -1.872865, 1.317679, 0.09019608, 0, 1, 1,
0.4188012, -0.2985893, 1.578794, 0.09803922, 0, 1, 1,
0.4208524, 1.173318, 0.5216756, 0.1058824, 0, 1, 1,
0.4217014, -0.5625728, 3.822362, 0.1098039, 0, 1, 1,
0.4232748, 0.630489, 0.8169523, 0.1176471, 0, 1, 1,
0.4330995, -1.017798, 3.660542, 0.1215686, 0, 1, 1,
0.4331162, -1.733913, 3.548709, 0.1294118, 0, 1, 1,
0.4347584, 0.7113107, -0.8863888, 0.1333333, 0, 1, 1,
0.439517, -0.256906, 0.7597224, 0.1411765, 0, 1, 1,
0.4397987, -1.000959, 0.9411184, 0.145098, 0, 1, 1,
0.4440361, -0.9031972, 5.236008, 0.1529412, 0, 1, 1,
0.4487594, -0.5074152, 2.675948, 0.1568628, 0, 1, 1,
0.4492783, -0.4116309, 2.263147, 0.1647059, 0, 1, 1,
0.449904, 0.5091308, 2.108705, 0.1686275, 0, 1, 1,
0.4510984, -0.04030203, 1.584506, 0.1764706, 0, 1, 1,
0.4540709, -0.4492805, 1.098541, 0.1803922, 0, 1, 1,
0.4541296, 0.04649499, 1.817067, 0.1882353, 0, 1, 1,
0.4550079, -1.666071, 4.19559, 0.1921569, 0, 1, 1,
0.4560252, -0.3116614, 2.906985, 0.2, 0, 1, 1,
0.4568283, 0.3122095, -0.1252223, 0.2078431, 0, 1, 1,
0.4568844, 0.1067209, 4.117491, 0.2117647, 0, 1, 1,
0.4576661, 1.244394, -0.5079275, 0.2196078, 0, 1, 1,
0.4584349, -1.563259, 2.52728, 0.2235294, 0, 1, 1,
0.4661729, -0.6858153, 0.9694659, 0.2313726, 0, 1, 1,
0.4686242, -0.379867, 0.8486166, 0.2352941, 0, 1, 1,
0.4698835, 1.068015, -0.4749115, 0.2431373, 0, 1, 1,
0.4731625, 0.2105594, 1.214406, 0.2470588, 0, 1, 1,
0.4734173, -1.426615, 1.129433, 0.254902, 0, 1, 1,
0.4742955, -1.723927, 1.00413, 0.2588235, 0, 1, 1,
0.4745518, 0.4303237, 1.265194, 0.2666667, 0, 1, 1,
0.4800731, -0.839682, 3.056679, 0.2705882, 0, 1, 1,
0.4844414, 1.587166, 0.46716, 0.2784314, 0, 1, 1,
0.492577, 1.366626, 2.193093, 0.282353, 0, 1, 1,
0.4959659, 0.3987923, 1.51496, 0.2901961, 0, 1, 1,
0.5019203, -0.346091, 2.767511, 0.2941177, 0, 1, 1,
0.504315, -1.2383, 2.646494, 0.3019608, 0, 1, 1,
0.5047744, 1.227385, -0.0253753, 0.3098039, 0, 1, 1,
0.5057473, -0.8090619, 3.372523, 0.3137255, 0, 1, 1,
0.5060596, -0.4413556, 2.641115, 0.3215686, 0, 1, 1,
0.508377, 0.5176702, 1.76726, 0.3254902, 0, 1, 1,
0.5152143, -0.1422997, 1.664274, 0.3333333, 0, 1, 1,
0.5178009, 0.1333006, 2.076727, 0.3372549, 0, 1, 1,
0.5211282, -2.012153, 3.543549, 0.345098, 0, 1, 1,
0.5254964, -2.024932, 2.836348, 0.3490196, 0, 1, 1,
0.5312413, 0.4575959, 1.925942, 0.3568628, 0, 1, 1,
0.5325744, -1.672319, 2.764377, 0.3607843, 0, 1, 1,
0.5328326, -0.05845144, 1.177435, 0.3686275, 0, 1, 1,
0.5342379, 0.6265898, 0.4547558, 0.372549, 0, 1, 1,
0.535797, -0.6343573, 3.279255, 0.3803922, 0, 1, 1,
0.5374045, 0.06959972, 1.839136, 0.3843137, 0, 1, 1,
0.5374821, -0.6079501, 3.634107, 0.3921569, 0, 1, 1,
0.5394259, 0.7448403, 0.6845502, 0.3960784, 0, 1, 1,
0.5436364, 1.197593, 2.866389, 0.4039216, 0, 1, 1,
0.5453719, 2.25471, 0.6050284, 0.4117647, 0, 1, 1,
0.5461456, 0.9248331, 0.6206744, 0.4156863, 0, 1, 1,
0.5465863, -0.2280469, 0.4457749, 0.4235294, 0, 1, 1,
0.552753, -0.2728132, 1.477139, 0.427451, 0, 1, 1,
0.5528394, -0.8035825, 2.137595, 0.4352941, 0, 1, 1,
0.5528436, 0.1443091, 1.002226, 0.4392157, 0, 1, 1,
0.5589221, 0.4356001, -0.4179256, 0.4470588, 0, 1, 1,
0.5643856, -0.6075689, 3.35127, 0.4509804, 0, 1, 1,
0.566811, -0.2722583, 3.039093, 0.4588235, 0, 1, 1,
0.5678321, 0.4310214, 0.2558538, 0.4627451, 0, 1, 1,
0.5696218, 0.6346047, 1.411638, 0.4705882, 0, 1, 1,
0.5701264, -0.9766603, 2.143293, 0.4745098, 0, 1, 1,
0.5712988, -2.258576, 1.152153, 0.4823529, 0, 1, 1,
0.5735825, 1.37159, 0.7257504, 0.4862745, 0, 1, 1,
0.5743306, -0.4548618, 2.315819, 0.4941176, 0, 1, 1,
0.5743636, -1.297777, 4.239204, 0.5019608, 0, 1, 1,
0.5755551, 0.9197173, 2.439857, 0.5058824, 0, 1, 1,
0.5824887, -0.03019088, 2.099554, 0.5137255, 0, 1, 1,
0.5869946, -0.2509701, 1.035805, 0.5176471, 0, 1, 1,
0.5883262, -0.0007258595, 1.311067, 0.5254902, 0, 1, 1,
0.5928788, -1.038275, 1.499858, 0.5294118, 0, 1, 1,
0.599994, 0.5683124, 0.5815173, 0.5372549, 0, 1, 1,
0.6016253, 0.2893511, -0.1127252, 0.5411765, 0, 1, 1,
0.6028297, -2.264124, 2.92176, 0.5490196, 0, 1, 1,
0.6044409, -0.5109126, 0.8816333, 0.5529412, 0, 1, 1,
0.6158941, -0.09639943, -0.2431359, 0.5607843, 0, 1, 1,
0.6172993, -0.8419076, 2.04999, 0.5647059, 0, 1, 1,
0.6203858, 0.6068413, 0.6523922, 0.572549, 0, 1, 1,
0.6214051, -1.017583, 3.342303, 0.5764706, 0, 1, 1,
0.6221171, -1.399172, 1.979727, 0.5843138, 0, 1, 1,
0.6243744, -1.044328, 3.064646, 0.5882353, 0, 1, 1,
0.6283326, 1.157159, 0.009219409, 0.5960785, 0, 1, 1,
0.6296682, 0.5737369, 2.145745, 0.6039216, 0, 1, 1,
0.6310644, -1.334226, 3.62157, 0.6078432, 0, 1, 1,
0.6336556, 1.556017, -0.7467105, 0.6156863, 0, 1, 1,
0.6402582, -0.2124332, 3.277332, 0.6196079, 0, 1, 1,
0.6427532, 1.514843, -0.3139967, 0.627451, 0, 1, 1,
0.6436514, -0.04346997, 0.6329715, 0.6313726, 0, 1, 1,
0.6476989, -1.711501, 2.754123, 0.6392157, 0, 1, 1,
0.6560466, -1.322881, 3.312175, 0.6431373, 0, 1, 1,
0.6636323, 0.9981656, 0.3991324, 0.6509804, 0, 1, 1,
0.672449, 0.02606511, 2.860721, 0.654902, 0, 1, 1,
0.674678, 0.5551039, 1.22181, 0.6627451, 0, 1, 1,
0.6786138, 0.2048395, 0.08392928, 0.6666667, 0, 1, 1,
0.6791387, -0.23929, 3.030837, 0.6745098, 0, 1, 1,
0.6795998, 0.349362, 1.273692, 0.6784314, 0, 1, 1,
0.6806607, 1.408181, -1.021177, 0.6862745, 0, 1, 1,
0.6935137, 0.793961, 1.110904, 0.6901961, 0, 1, 1,
0.6941626, -0.3806912, 4.132172, 0.6980392, 0, 1, 1,
0.6975104, -0.5035892, 1.332886, 0.7058824, 0, 1, 1,
0.7067083, -0.6871137, 1.210351, 0.7098039, 0, 1, 1,
0.7109298, 1.321191, -0.09464056, 0.7176471, 0, 1, 1,
0.7115585, -0.1259517, 2.247022, 0.7215686, 0, 1, 1,
0.7132897, 0.4087096, 1.634351, 0.7294118, 0, 1, 1,
0.7145866, -0.2563382, 1.60459, 0.7333333, 0, 1, 1,
0.7166092, 0.2561974, 1.406485, 0.7411765, 0, 1, 1,
0.7186953, 1.620832, 0.2933052, 0.7450981, 0, 1, 1,
0.719759, 0.1503342, 2.200798, 0.7529412, 0, 1, 1,
0.72454, -0.4805575, 2.076886, 0.7568628, 0, 1, 1,
0.7257252, 1.212738, 0.5805867, 0.7647059, 0, 1, 1,
0.7275831, 0.603583, 1.199213, 0.7686275, 0, 1, 1,
0.7326377, 0.3854275, 2.580649, 0.7764706, 0, 1, 1,
0.7353389, 0.7972968, 0.6692367, 0.7803922, 0, 1, 1,
0.7373653, 0.1270768, 0.7364418, 0.7882353, 0, 1, 1,
0.7385564, 1.328063, -0.3181605, 0.7921569, 0, 1, 1,
0.7403854, 1.369247, 1.056256, 0.8, 0, 1, 1,
0.7499577, -1.337164, 3.642196, 0.8078431, 0, 1, 1,
0.753318, 0.8661429, 0.2903001, 0.8117647, 0, 1, 1,
0.7623371, -1.79826, 2.187479, 0.8196079, 0, 1, 1,
0.7633373, -0.3432482, 2.415722, 0.8235294, 0, 1, 1,
0.7674703, 1.699831, 1.50252, 0.8313726, 0, 1, 1,
0.7683427, 0.3036006, 0.03770145, 0.8352941, 0, 1, 1,
0.7756336, 0.6887511, 1.54622, 0.8431373, 0, 1, 1,
0.7781273, 1.503758, -0.2904153, 0.8470588, 0, 1, 1,
0.78279, 0.9354213, 0.01403191, 0.854902, 0, 1, 1,
0.7874438, -1.272655, -0.1189206, 0.8588235, 0, 1, 1,
0.7900993, 0.1314392, 1.265088, 0.8666667, 0, 1, 1,
0.7924656, 0.1374424, 2.242859, 0.8705882, 0, 1, 1,
0.7929514, -0.2244942, -0.4002492, 0.8784314, 0, 1, 1,
0.7969414, 1.243819, -1.147233, 0.8823529, 0, 1, 1,
0.7996469, -0.3608246, 4.546124, 0.8901961, 0, 1, 1,
0.7999852, 1.109041, 1.028307, 0.8941177, 0, 1, 1,
0.8016923, 0.1612802, 2.019202, 0.9019608, 0, 1, 1,
0.8048626, 1.742808, 0.3540349, 0.9098039, 0, 1, 1,
0.8087946, 0.5421861, 0.3841028, 0.9137255, 0, 1, 1,
0.8095884, 0.1439187, 3.583675, 0.9215686, 0, 1, 1,
0.8137507, 0.0455815, 1.594577, 0.9254902, 0, 1, 1,
0.8141356, -0.9844464, 2.415277, 0.9333333, 0, 1, 1,
0.8177724, -1.426567, 1.842603, 0.9372549, 0, 1, 1,
0.819393, -1.056298, 2.771766, 0.945098, 0, 1, 1,
0.8195282, -0.2700132, 2.703362, 0.9490196, 0, 1, 1,
0.8268093, -0.5009269, 2.210575, 0.9568627, 0, 1, 1,
0.8275976, -1.727542, 2.412294, 0.9607843, 0, 1, 1,
0.8284526, 1.2098, 0.5169491, 0.9686275, 0, 1, 1,
0.8328353, 1.429221, -0.7044241, 0.972549, 0, 1, 1,
0.8358322, -1.389985, 3.404979, 0.9803922, 0, 1, 1,
0.8381004, 1.624213, 2.190547, 0.9843137, 0, 1, 1,
0.8419812, 0.6845777, 0.4329781, 0.9921569, 0, 1, 1,
0.8483797, -1.0931, 2.028031, 0.9960784, 0, 1, 1,
0.8612454, -0.3606362, -0.2220889, 1, 0, 0.9960784, 1,
0.8625731, -1.139391, 2.895566, 1, 0, 0.9882353, 1,
0.8821912, 0.6538699, 2.396786, 1, 0, 0.9843137, 1,
0.8823825, 1.025297, 1.371015, 1, 0, 0.9764706, 1,
0.8893129, 0.7308372, 1.244373, 1, 0, 0.972549, 1,
0.8903101, 0.06083405, -0.3425515, 1, 0, 0.9647059, 1,
0.895398, 0.6690459, 2.141752, 1, 0, 0.9607843, 1,
0.9012233, -1.025876, 3.198426, 1, 0, 0.9529412, 1,
0.9013664, 0.7865892, -1.533012, 1, 0, 0.9490196, 1,
0.9053103, 0.3290834, 0.8037926, 1, 0, 0.9411765, 1,
0.9082181, 0.4090398, 1.607117, 1, 0, 0.9372549, 1,
0.9099758, -1.183043, 1.764275, 1, 0, 0.9294118, 1,
0.9223939, 0.1750301, 2.194675, 1, 0, 0.9254902, 1,
0.9237778, -1.914197, 1.945113, 1, 0, 0.9176471, 1,
0.9276538, -0.3984688, 0.6667485, 1, 0, 0.9137255, 1,
0.933299, -0.3113714, 3.563098, 1, 0, 0.9058824, 1,
0.9396009, 1.102587, 0.9381158, 1, 0, 0.9019608, 1,
0.94407, 0.3108838, 0.9685199, 1, 0, 0.8941177, 1,
0.9513341, 1.372023, 0.7252314, 1, 0, 0.8862745, 1,
0.9686325, -0.1805704, 1.295671, 1, 0, 0.8823529, 1,
0.9709544, 0.3883149, 1.680996, 1, 0, 0.8745098, 1,
0.9769475, 1.257439, 1.635341, 1, 0, 0.8705882, 1,
0.9854806, 0.7773293, 0.8019104, 1, 0, 0.8627451, 1,
0.9871231, -0.5220736, -0.1903522, 1, 0, 0.8588235, 1,
1.000347, -0.04426627, 3.081574, 1, 0, 0.8509804, 1,
1.004169, -0.1113406, 2.636989, 1, 0, 0.8470588, 1,
1.004247, 0.7386286, 0.02774325, 1, 0, 0.8392157, 1,
1.018366, 1.0155, -0.2578621, 1, 0, 0.8352941, 1,
1.020923, -1.705955, 1.673458, 1, 0, 0.827451, 1,
1.022698, 0.08079171, 2.695627, 1, 0, 0.8235294, 1,
1.04662, -0.4325702, 2.126235, 1, 0, 0.8156863, 1,
1.051933, 1.133193, 0.9811993, 1, 0, 0.8117647, 1,
1.053636, 1.131668, 1.312487, 1, 0, 0.8039216, 1,
1.054934, 1.475953, 1.936857, 1, 0, 0.7960784, 1,
1.060473, 0.6743302, -0.3757705, 1, 0, 0.7921569, 1,
1.061525, -0.8203995, 3.322032, 1, 0, 0.7843137, 1,
1.063532, -0.661921, 3.414055, 1, 0, 0.7803922, 1,
1.0708, -1.86241, 1.609721, 1, 0, 0.772549, 1,
1.073198, -0.7269692, 0.9019773, 1, 0, 0.7686275, 1,
1.083854, 0.2016327, 2.494478, 1, 0, 0.7607843, 1,
1.084887, 0.585781, 0.9961154, 1, 0, 0.7568628, 1,
1.084982, -0.9798384, 2.258639, 1, 0, 0.7490196, 1,
1.088652, 0.6930658, -0.1681872, 1, 0, 0.7450981, 1,
1.094123, 1.380045, -0.4089121, 1, 0, 0.7372549, 1,
1.095046, 0.1290048, 2.252905, 1, 0, 0.7333333, 1,
1.126425, -1.090382, 3.211856, 1, 0, 0.7254902, 1,
1.127748, 1.265227, 1.065759, 1, 0, 0.7215686, 1,
1.134141, -0.6376308, 3.7673, 1, 0, 0.7137255, 1,
1.136677, 0.9486767, 0.3173089, 1, 0, 0.7098039, 1,
1.142482, 0.05648021, 4.097704, 1, 0, 0.7019608, 1,
1.145904, -0.1877584, 0.3071629, 1, 0, 0.6941177, 1,
1.152314, 0.4785532, 1.931376, 1, 0, 0.6901961, 1,
1.162516, -1.05913, 2.880621, 1, 0, 0.682353, 1,
1.162851, -1.263813, 2.183629, 1, 0, 0.6784314, 1,
1.169732, 1.891184, 0.3388123, 1, 0, 0.6705883, 1,
1.170492, 1.331851, -0.6044531, 1, 0, 0.6666667, 1,
1.179206, -0.8173022, 1.558363, 1, 0, 0.6588235, 1,
1.179389, -0.2269058, 2.822854, 1, 0, 0.654902, 1,
1.190664, -0.4703945, 2.297743, 1, 0, 0.6470588, 1,
1.192618, 0.4635745, 1.45808, 1, 0, 0.6431373, 1,
1.195228, -1.675053, 1.189572, 1, 0, 0.6352941, 1,
1.206139, -0.6218454, 2.548104, 1, 0, 0.6313726, 1,
1.212478, 0.6698527, 1.174462, 1, 0, 0.6235294, 1,
1.213577, 0.1208247, -0.5884449, 1, 0, 0.6196079, 1,
1.228537, 1.411442, 2.178109, 1, 0, 0.6117647, 1,
1.232882, 0.04007645, 0.2921862, 1, 0, 0.6078432, 1,
1.234037, -1.265552, 1.307786, 1, 0, 0.6, 1,
1.239493, 0.0905428, 3.234302, 1, 0, 0.5921569, 1,
1.239631, 1.072379, 1.07339, 1, 0, 0.5882353, 1,
1.250173, -0.3415863, 1.942714, 1, 0, 0.5803922, 1,
1.254251, -0.7421819, 1.430341, 1, 0, 0.5764706, 1,
1.260797, 0.002247976, 1.641468, 1, 0, 0.5686275, 1,
1.266419, -1.307174, 1.225339, 1, 0, 0.5647059, 1,
1.275109, -0.1616974, 1.064567, 1, 0, 0.5568628, 1,
1.276855, 0.235655, 2.771851, 1, 0, 0.5529412, 1,
1.286348, -0.3380001, 1.986248, 1, 0, 0.5450981, 1,
1.286944, 1.516869, 2.852413, 1, 0, 0.5411765, 1,
1.296109, 0.779258, 1.962143, 1, 0, 0.5333334, 1,
1.297996, 0.05730866, 1.25147, 1, 0, 0.5294118, 1,
1.307958, 0.5591477, 1.433715, 1, 0, 0.5215687, 1,
1.325151, 0.8154095, 1.766953, 1, 0, 0.5176471, 1,
1.349931, 1.061049, -1.237665, 1, 0, 0.509804, 1,
1.358146, -1.398225, 3.591138, 1, 0, 0.5058824, 1,
1.368503, -0.9558081, 0.5104284, 1, 0, 0.4980392, 1,
1.369734, 1.040714, 1.192258, 1, 0, 0.4901961, 1,
1.375576, -0.3445599, 1.636158, 1, 0, 0.4862745, 1,
1.380106, -0.5605795, 2.412291, 1, 0, 0.4784314, 1,
1.384924, -0.1806555, 1.903196, 1, 0, 0.4745098, 1,
1.391837, 0.0908966, 1.759603, 1, 0, 0.4666667, 1,
1.396331, -0.2042158, 3.274945, 1, 0, 0.4627451, 1,
1.409539, 0.8056387, 2.818085, 1, 0, 0.454902, 1,
1.412723, -2.350314, 2.893851, 1, 0, 0.4509804, 1,
1.422581, 0.05974204, 1.443141, 1, 0, 0.4431373, 1,
1.432071, -0.03367956, -0.03601858, 1, 0, 0.4392157, 1,
1.4395, -1.209104, 1.227033, 1, 0, 0.4313726, 1,
1.443728, 1.876831, -0.4460326, 1, 0, 0.427451, 1,
1.447968, 0.09260508, 2.831339, 1, 0, 0.4196078, 1,
1.449973, 0.564585, 1.529001, 1, 0, 0.4156863, 1,
1.458115, 1.312275, -1.259194, 1, 0, 0.4078431, 1,
1.460714, 1.308218, 1.833954, 1, 0, 0.4039216, 1,
1.474486, -1.975589, 2.889338, 1, 0, 0.3960784, 1,
1.483852, -1.467345, 2.133214, 1, 0, 0.3882353, 1,
1.491781, 0.8893014, 1.505719, 1, 0, 0.3843137, 1,
1.497143, 1.471811, 1.696124, 1, 0, 0.3764706, 1,
1.500422, 0.8441399, 2.047826, 1, 0, 0.372549, 1,
1.501798, -0.2485819, 2.556581, 1, 0, 0.3647059, 1,
1.51459, 0.4136404, 3.513456, 1, 0, 0.3607843, 1,
1.55254, -0.2874745, 1.738897, 1, 0, 0.3529412, 1,
1.560508, 0.2101982, 1.271381, 1, 0, 0.3490196, 1,
1.562761, -0.9702853, 2.180275, 1, 0, 0.3411765, 1,
1.563129, 0.1589987, 2.564192, 1, 0, 0.3372549, 1,
1.569338, -0.08445295, 1.177411, 1, 0, 0.3294118, 1,
1.576807, 0.5160644, 2.247417, 1, 0, 0.3254902, 1,
1.597229, -0.8301824, 1.877179, 1, 0, 0.3176471, 1,
1.600608, -1.89362, 4.205073, 1, 0, 0.3137255, 1,
1.603083, 1.758895, 0.9795462, 1, 0, 0.3058824, 1,
1.612336, 0.6777796, 2.531254, 1, 0, 0.2980392, 1,
1.613715, -0.06692718, 1.544767, 1, 0, 0.2941177, 1,
1.615403, -0.2106792, 0.5996189, 1, 0, 0.2862745, 1,
1.626176, -0.6936818, 1.690117, 1, 0, 0.282353, 1,
1.630821, -1.385465, 1.840674, 1, 0, 0.2745098, 1,
1.671716, 1.504712, -0.2105397, 1, 0, 0.2705882, 1,
1.672728, -0.1159738, 1.75328, 1, 0, 0.2627451, 1,
1.675517, 0.6500535, 0.1835539, 1, 0, 0.2588235, 1,
1.680755, 0.7271909, 1.287889, 1, 0, 0.2509804, 1,
1.693717, -0.1070627, 1.991511, 1, 0, 0.2470588, 1,
1.744514, 1.148736, 1.387817, 1, 0, 0.2392157, 1,
1.746771, 0.5706115, 1.118699, 1, 0, 0.2352941, 1,
1.749521, 0.4775083, 2.737854, 1, 0, 0.227451, 1,
1.772755, 1.28207, 0.5190315, 1, 0, 0.2235294, 1,
1.794223, 0.1482667, 2.5746, 1, 0, 0.2156863, 1,
1.823368, -0.07704621, 2.497035, 1, 0, 0.2117647, 1,
1.824077, -0.9466677, 2.551531, 1, 0, 0.2039216, 1,
1.839763, -0.1902297, 1.02238, 1, 0, 0.1960784, 1,
1.842298, 1.187932, -0.9186064, 1, 0, 0.1921569, 1,
1.87841, 0.3087557, 2.294957, 1, 0, 0.1843137, 1,
1.90369, -0.7906119, 2.779392, 1, 0, 0.1803922, 1,
1.904508, 0.5434029, 1.001517, 1, 0, 0.172549, 1,
1.912494, 0.6260057, 1.516574, 1, 0, 0.1686275, 1,
1.925777, -0.6499783, 2.0522, 1, 0, 0.1607843, 1,
1.928103, 0.02564296, 0.815193, 1, 0, 0.1568628, 1,
1.950175, 1.27556, 0.04102037, 1, 0, 0.1490196, 1,
1.984846, -0.0385466, 3.146657, 1, 0, 0.145098, 1,
1.997063, 2.069794, 1.50651, 1, 0, 0.1372549, 1,
2.013264, -0.2958946, 1.141467, 1, 0, 0.1333333, 1,
2.016215, -1.061947, 1.11197, 1, 0, 0.1254902, 1,
2.046812, -2.311911, 2.083321, 1, 0, 0.1215686, 1,
2.076408, 1.444288, 2.193062, 1, 0, 0.1137255, 1,
2.07643, 0.6028907, 1.666006, 1, 0, 0.1098039, 1,
2.086434, -0.4643151, 1.044353, 1, 0, 0.1019608, 1,
2.088088, -0.8951578, 0.472297, 1, 0, 0.09411765, 1,
2.112253, 1.761291, 1.020144, 1, 0, 0.09019608, 1,
2.113399, 0.2249131, 0.7870415, 1, 0, 0.08235294, 1,
2.158426, -0.467975, 0.7930814, 1, 0, 0.07843138, 1,
2.236098, -0.5508372, 1.396756, 1, 0, 0.07058824, 1,
2.238067, 1.018937, -0.4642452, 1, 0, 0.06666667, 1,
2.287894, 0.700649, 0.6698763, 1, 0, 0.05882353, 1,
2.320052, 0.4490635, 1.404149, 1, 0, 0.05490196, 1,
2.362792, -1.316407, 3.769008, 1, 0, 0.04705882, 1,
2.380816, -0.3924426, 2.114322, 1, 0, 0.04313726, 1,
2.40361, 0.4796527, 1.127692, 1, 0, 0.03529412, 1,
2.527686, 0.3559684, 2.965383, 1, 0, 0.03137255, 1,
2.631772, -0.2993576, 4.396174, 1, 0, 0.02352941, 1,
2.653139, -0.3327518, 2.450062, 1, 0, 0.01960784, 1,
2.718935, 1.035805, 0.08028717, 1, 0, 0.01176471, 1,
2.728889, -0.6200926, 2.842371, 1, 0, 0.007843138, 1
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
-0.3506763, -3.781921, -7.314452, 0, -0.5, 0.5, 0.5,
-0.3506763, -3.781921, -7.314452, 1, -0.5, 0.5, 0.5,
-0.3506763, -3.781921, -7.314452, 1, 1.5, 0.5, 0.5,
-0.3506763, -3.781921, -7.314452, 0, 1.5, 0.5, 0.5
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
-4.474214, 0.2649544, -7.314452, 0, -0.5, 0.5, 0.5,
-4.474214, 0.2649544, -7.314452, 1, -0.5, 0.5, 0.5,
-4.474214, 0.2649544, -7.314452, 1, 1.5, 0.5, 0.5,
-4.474214, 0.2649544, -7.314452, 0, 1.5, 0.5, 0.5
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
-4.474214, -3.781921, -0.06819963, 0, -0.5, 0.5, 0.5,
-4.474214, -3.781921, -0.06819963, 1, -0.5, 0.5, 0.5,
-4.474214, -3.781921, -0.06819963, 1, 1.5, 0.5, 0.5,
-4.474214, -3.781921, -0.06819963, 0, 1.5, 0.5, 0.5
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
-3, -2.848027, -5.64224,
2, -2.848027, -5.64224,
-3, -2.848027, -5.64224,
-3, -3.003676, -5.920942,
-2, -2.848027, -5.64224,
-2, -3.003676, -5.920942,
-1, -2.848027, -5.64224,
-1, -3.003676, -5.920942,
0, -2.848027, -5.64224,
0, -3.003676, -5.920942,
1, -2.848027, -5.64224,
1, -3.003676, -5.920942,
2, -2.848027, -5.64224,
2, -3.003676, -5.920942
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
-3, -3.314974, -6.478345, 0, -0.5, 0.5, 0.5,
-3, -3.314974, -6.478345, 1, -0.5, 0.5, 0.5,
-3, -3.314974, -6.478345, 1, 1.5, 0.5, 0.5,
-3, -3.314974, -6.478345, 0, 1.5, 0.5, 0.5,
-2, -3.314974, -6.478345, 0, -0.5, 0.5, 0.5,
-2, -3.314974, -6.478345, 1, -0.5, 0.5, 0.5,
-2, -3.314974, -6.478345, 1, 1.5, 0.5, 0.5,
-2, -3.314974, -6.478345, 0, 1.5, 0.5, 0.5,
-1, -3.314974, -6.478345, 0, -0.5, 0.5, 0.5,
-1, -3.314974, -6.478345, 1, -0.5, 0.5, 0.5,
-1, -3.314974, -6.478345, 1, 1.5, 0.5, 0.5,
-1, -3.314974, -6.478345, 0, 1.5, 0.5, 0.5,
0, -3.314974, -6.478345, 0, -0.5, 0.5, 0.5,
0, -3.314974, -6.478345, 1, -0.5, 0.5, 0.5,
0, -3.314974, -6.478345, 1, 1.5, 0.5, 0.5,
0, -3.314974, -6.478345, 0, 1.5, 0.5, 0.5,
1, -3.314974, -6.478345, 0, -0.5, 0.5, 0.5,
1, -3.314974, -6.478345, 1, -0.5, 0.5, 0.5,
1, -3.314974, -6.478345, 1, 1.5, 0.5, 0.5,
1, -3.314974, -6.478345, 0, 1.5, 0.5, 0.5,
2, -3.314974, -6.478345, 0, -0.5, 0.5, 0.5,
2, -3.314974, -6.478345, 1, -0.5, 0.5, 0.5,
2, -3.314974, -6.478345, 1, 1.5, 0.5, 0.5,
2, -3.314974, -6.478345, 0, 1.5, 0.5, 0.5
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
-3.522628, -2, -5.64224,
-3.522628, 3, -5.64224,
-3.522628, -2, -5.64224,
-3.681226, -2, -5.920942,
-3.522628, -1, -5.64224,
-3.681226, -1, -5.920942,
-3.522628, 0, -5.64224,
-3.681226, 0, -5.920942,
-3.522628, 1, -5.64224,
-3.681226, 1, -5.920942,
-3.522628, 2, -5.64224,
-3.681226, 2, -5.920942,
-3.522628, 3, -5.64224,
-3.681226, 3, -5.920942
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
-3.998421, -2, -6.478345, 0, -0.5, 0.5, 0.5,
-3.998421, -2, -6.478345, 1, -0.5, 0.5, 0.5,
-3.998421, -2, -6.478345, 1, 1.5, 0.5, 0.5,
-3.998421, -2, -6.478345, 0, 1.5, 0.5, 0.5,
-3.998421, -1, -6.478345, 0, -0.5, 0.5, 0.5,
-3.998421, -1, -6.478345, 1, -0.5, 0.5, 0.5,
-3.998421, -1, -6.478345, 1, 1.5, 0.5, 0.5,
-3.998421, -1, -6.478345, 0, 1.5, 0.5, 0.5,
-3.998421, 0, -6.478345, 0, -0.5, 0.5, 0.5,
-3.998421, 0, -6.478345, 1, -0.5, 0.5, 0.5,
-3.998421, 0, -6.478345, 1, 1.5, 0.5, 0.5,
-3.998421, 0, -6.478345, 0, 1.5, 0.5, 0.5,
-3.998421, 1, -6.478345, 0, -0.5, 0.5, 0.5,
-3.998421, 1, -6.478345, 1, -0.5, 0.5, 0.5,
-3.998421, 1, -6.478345, 1, 1.5, 0.5, 0.5,
-3.998421, 1, -6.478345, 0, 1.5, 0.5, 0.5,
-3.998421, 2, -6.478345, 0, -0.5, 0.5, 0.5,
-3.998421, 2, -6.478345, 1, -0.5, 0.5, 0.5,
-3.998421, 2, -6.478345, 1, 1.5, 0.5, 0.5,
-3.998421, 2, -6.478345, 0, 1.5, 0.5, 0.5,
-3.998421, 3, -6.478345, 0, -0.5, 0.5, 0.5,
-3.998421, 3, -6.478345, 1, -0.5, 0.5, 0.5,
-3.998421, 3, -6.478345, 1, 1.5, 0.5, 0.5,
-3.998421, 3, -6.478345, 0, 1.5, 0.5, 0.5
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
-3.522628, -2.848027, -4,
-3.522628, -2.848027, 4,
-3.522628, -2.848027, -4,
-3.681226, -3.003676, -4,
-3.522628, -2.848027, -2,
-3.681226, -3.003676, -2,
-3.522628, -2.848027, 0,
-3.681226, -3.003676, 0,
-3.522628, -2.848027, 2,
-3.681226, -3.003676, 2,
-3.522628, -2.848027, 4,
-3.681226, -3.003676, 4
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
-3.998421, -3.314974, -4, 0, -0.5, 0.5, 0.5,
-3.998421, -3.314974, -4, 1, -0.5, 0.5, 0.5,
-3.998421, -3.314974, -4, 1, 1.5, 0.5, 0.5,
-3.998421, -3.314974, -4, 0, 1.5, 0.5, 0.5,
-3.998421, -3.314974, -2, 0, -0.5, 0.5, 0.5,
-3.998421, -3.314974, -2, 1, -0.5, 0.5, 0.5,
-3.998421, -3.314974, -2, 1, 1.5, 0.5, 0.5,
-3.998421, -3.314974, -2, 0, 1.5, 0.5, 0.5,
-3.998421, -3.314974, 0, 0, -0.5, 0.5, 0.5,
-3.998421, -3.314974, 0, 1, -0.5, 0.5, 0.5,
-3.998421, -3.314974, 0, 1, 1.5, 0.5, 0.5,
-3.998421, -3.314974, 0, 0, 1.5, 0.5, 0.5,
-3.998421, -3.314974, 2, 0, -0.5, 0.5, 0.5,
-3.998421, -3.314974, 2, 1, -0.5, 0.5, 0.5,
-3.998421, -3.314974, 2, 1, 1.5, 0.5, 0.5,
-3.998421, -3.314974, 2, 0, 1.5, 0.5, 0.5,
-3.998421, -3.314974, 4, 0, -0.5, 0.5, 0.5,
-3.998421, -3.314974, 4, 1, -0.5, 0.5, 0.5,
-3.998421, -3.314974, 4, 1, 1.5, 0.5, 0.5,
-3.998421, -3.314974, 4, 0, 1.5, 0.5, 0.5
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
-3.522628, -2.848027, -5.64224,
-3.522628, 3.377936, -5.64224,
-3.522628, -2.848027, 5.50584,
-3.522628, 3.377936, 5.50584,
-3.522628, -2.848027, -5.64224,
-3.522628, -2.848027, 5.50584,
-3.522628, 3.377936, -5.64224,
-3.522628, 3.377936, 5.50584,
-3.522628, -2.848027, -5.64224,
2.821275, -2.848027, -5.64224,
-3.522628, -2.848027, 5.50584,
2.821275, -2.848027, 5.50584,
-3.522628, 3.377936, -5.64224,
2.821275, 3.377936, -5.64224,
-3.522628, 3.377936, 5.50584,
2.821275, 3.377936, 5.50584,
2.821275, -2.848027, -5.64224,
2.821275, 3.377936, -5.64224,
2.821275, -2.848027, 5.50584,
2.821275, 3.377936, 5.50584,
2.821275, -2.848027, -5.64224,
2.821275, -2.848027, 5.50584,
2.821275, 3.377936, -5.64224,
2.821275, 3.377936, 5.50584
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
var radius = 7.613436;
var distance = 33.87304;
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
mvMatrix.translate( 0.3506763, -0.2649544, 0.06819963 );
mvMatrix.scale( 1.297592, 1.322173, 0.7384048 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.87304);
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
prochloraz<-read.table("prochloraz.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prochloraz$V2
```

```
## Error in eval(expr, envir, enclos): object 'prochloraz' not found
```

```r
y<-prochloraz$V3
```

```
## Error in eval(expr, envir, enclos): object 'prochloraz' not found
```

```r
z<-prochloraz$V4
```

```
## Error in eval(expr, envir, enclos): object 'prochloraz' not found
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
-3.430241, -0.6729126, -2.542939, 0, 0, 1, 1, 1,
-3.356592, -0.1799332, -3.934478, 1, 0, 0, 1, 1,
-3.188371, 1.115173, -2.25134, 1, 0, 0, 1, 1,
-3.010467, -0.4196926, -1.704864, 1, 0, 0, 1, 1,
-2.818032, -0.2517734, -0.7725826, 1, 0, 0, 1, 1,
-2.667855, -0.3591262, -2.179373, 1, 0, 0, 1, 1,
-2.622405, 0.1172664, -3.465243, 0, 0, 0, 1, 1,
-2.486372, -0.5438238, -2.884603, 0, 0, 0, 1, 1,
-2.481863, 0.4206134, -1.738169, 0, 0, 0, 1, 1,
-2.401964, -1.068227, -2.134459, 0, 0, 0, 1, 1,
-2.364274, -1.481307, -3.470427, 0, 0, 0, 1, 1,
-2.357101, 0.6102899, -1.511946, 0, 0, 0, 1, 1,
-2.244828, -1.048218, -2.36754, 0, 0, 0, 1, 1,
-2.18925, 0.3310126, -0.7584043, 1, 1, 1, 1, 1,
-2.152536, -0.9396546, -0.8408816, 1, 1, 1, 1, 1,
-2.137515, -0.04902995, -1.199669, 1, 1, 1, 1, 1,
-2.11497, -0.1741119, -1.264944, 1, 1, 1, 1, 1,
-2.072342, -0.3785896, -2.011651, 1, 1, 1, 1, 1,
-2.070776, -0.9465371, -1.769936, 1, 1, 1, 1, 1,
-1.978897, 1.333762, -0.3615507, 1, 1, 1, 1, 1,
-1.977036, 1.743702, 0.7920737, 1, 1, 1, 1, 1,
-1.97137, -0.9962065, -1.731379, 1, 1, 1, 1, 1,
-1.949663, 0.1576991, -0.6709226, 1, 1, 1, 1, 1,
-1.946841, -1.366551, -1.780983, 1, 1, 1, 1, 1,
-1.929176, 0.7695909, -0.5539433, 1, 1, 1, 1, 1,
-1.925178, -0.8033761, -3.503364, 1, 1, 1, 1, 1,
-1.90251, 0.8657768, -2.619034, 1, 1, 1, 1, 1,
-1.897065, 1.202552, -1.99683, 1, 1, 1, 1, 1,
-1.880961, -0.4920629, -1.728148, 0, 0, 1, 1, 1,
-1.864603, -0.4517239, -2.266342, 1, 0, 0, 1, 1,
-1.855829, -0.3391171, -1.807285, 1, 0, 0, 1, 1,
-1.838086, -0.1425214, -0.8987616, 1, 0, 0, 1, 1,
-1.836462, -0.2368946, -2.844262, 1, 0, 0, 1, 1,
-1.825682, 0.4391683, -1.078413, 1, 0, 0, 1, 1,
-1.816689, 1.957061, 1.788806, 0, 0, 0, 1, 1,
-1.814064, 0.3212294, -4.279779, 0, 0, 0, 1, 1,
-1.793258, 0.5658439, -1.292128, 0, 0, 0, 1, 1,
-1.776111, -0.623621, -1.904319, 0, 0, 0, 1, 1,
-1.77393, -1.03364, -1.109211, 0, 0, 0, 1, 1,
-1.758348, 2.294281, 0.4694394, 0, 0, 0, 1, 1,
-1.736724, -0.5039845, -2.642022, 0, 0, 0, 1, 1,
-1.725235, 0.9736666, -1.558545, 1, 1, 1, 1, 1,
-1.709688, 0.06524318, -1.430497, 1, 1, 1, 1, 1,
-1.700055, 0.7620808, -0.03954377, 1, 1, 1, 1, 1,
-1.697397, 0.9380565, -2.097245, 1, 1, 1, 1, 1,
-1.69698, 0.0003978343, -0.7539917, 1, 1, 1, 1, 1,
-1.694481, -0.3744697, -2.512312, 1, 1, 1, 1, 1,
-1.689159, 0.8336477, -0.8002343, 1, 1, 1, 1, 1,
-1.685281, 0.7002082, -0.7357363, 1, 1, 1, 1, 1,
-1.681731, -0.6759391, -0.746133, 1, 1, 1, 1, 1,
-1.680899, -0.5091096, -2.594422, 1, 1, 1, 1, 1,
-1.676934, -1.099692, -3.401414, 1, 1, 1, 1, 1,
-1.669732, 0.1054817, -1.697734, 1, 1, 1, 1, 1,
-1.664232, 0.8120021, -0.303304, 1, 1, 1, 1, 1,
-1.658146, 0.5342495, -0.171796, 1, 1, 1, 1, 1,
-1.653875, 0.2742861, -1.464827, 1, 1, 1, 1, 1,
-1.634977, 0.143446, -2.843427, 0, 0, 1, 1, 1,
-1.623527, 0.1287048, -0.4494319, 1, 0, 0, 1, 1,
-1.61869, 1.558612, -0.3789409, 1, 0, 0, 1, 1,
-1.594986, 0.2458539, -0.1827047, 1, 0, 0, 1, 1,
-1.576286, -1.366863, -1.52746, 1, 0, 0, 1, 1,
-1.55598, 0.9219521, -1.12903, 1, 0, 0, 1, 1,
-1.554959, -0.2597594, -1.836317, 0, 0, 0, 1, 1,
-1.554036, 0.4234205, -1.44755, 0, 0, 0, 1, 1,
-1.549786, -1.345384, -3.657222, 0, 0, 0, 1, 1,
-1.549498, 0.4209381, -0.2041138, 0, 0, 0, 1, 1,
-1.526507, 0.9063979, -2.665808, 0, 0, 0, 1, 1,
-1.522684, -0.3574854, -1.173436, 0, 0, 0, 1, 1,
-1.507583, 2.61828, 0.2481306, 0, 0, 0, 1, 1,
-1.502691, 0.7016569, 0.2610675, 1, 1, 1, 1, 1,
-1.497568, -0.4778622, -2.274013, 1, 1, 1, 1, 1,
-1.493831, 0.1029846, -1.520543, 1, 1, 1, 1, 1,
-1.483063, 0.6536184, -2.180745, 1, 1, 1, 1, 1,
-1.460003, -1.576676, -3.270405, 1, 1, 1, 1, 1,
-1.456129, 0.06901046, -2.261332, 1, 1, 1, 1, 1,
-1.452404, 0.09488293, -2.915191, 1, 1, 1, 1, 1,
-1.442748, 0.4120637, -1.689981, 1, 1, 1, 1, 1,
-1.434358, 1.386029, -1.328066, 1, 1, 1, 1, 1,
-1.424736, 2.37234, -2.325557, 1, 1, 1, 1, 1,
-1.414582, -0.724636, -0.8648216, 1, 1, 1, 1, 1,
-1.413235, -1.146115, -2.945505, 1, 1, 1, 1, 1,
-1.405871, -0.322978, -2.567143, 1, 1, 1, 1, 1,
-1.400868, 0.1661163, -1.924976, 1, 1, 1, 1, 1,
-1.389379, -0.661088, -1.979296, 1, 1, 1, 1, 1,
-1.378235, 0.2741752, -1.678242, 0, 0, 1, 1, 1,
-1.37602, -1.23354, -3.406352, 1, 0, 0, 1, 1,
-1.369272, -0.8580324, -3.114422, 1, 0, 0, 1, 1,
-1.366441, -0.2877716, -1.24585, 1, 0, 0, 1, 1,
-1.356585, -0.1629444, -2.031333, 1, 0, 0, 1, 1,
-1.337439, -1.208962, -1.123327, 1, 0, 0, 1, 1,
-1.306186, -0.9983141, -1.356412, 0, 0, 0, 1, 1,
-1.304258, -0.4168877, -2.733312, 0, 0, 0, 1, 1,
-1.303743, -1.324568, -1.762563, 0, 0, 0, 1, 1,
-1.302381, -2.583463, -3.621, 0, 0, 0, 1, 1,
-1.299842, 1.596182, -0.6336175, 0, 0, 0, 1, 1,
-1.299184, -0.7115697, -2.814023, 0, 0, 0, 1, 1,
-1.293898, -0.4401276, -0.729672, 0, 0, 0, 1, 1,
-1.289815, 0.505954, -2.299384, 1, 1, 1, 1, 1,
-1.283026, -0.575261, -2.107001, 1, 1, 1, 1, 1,
-1.275696, 0.3965294, -0.8173203, 1, 1, 1, 1, 1,
-1.265996, -1.354341, -2.368621, 1, 1, 1, 1, 1,
-1.258476, 1.361816, -0.7432871, 1, 1, 1, 1, 1,
-1.253497, 0.1757832, -0.7846335, 1, 1, 1, 1, 1,
-1.250448, 0.6923247, -2.058685, 1, 1, 1, 1, 1,
-1.249034, -0.8099987, -3.115321, 1, 1, 1, 1, 1,
-1.24312, 0.8640572, -1.203373, 1, 1, 1, 1, 1,
-1.229294, 1.088777, 0.04828145, 1, 1, 1, 1, 1,
-1.224091, -2.314448, -1.904776, 1, 1, 1, 1, 1,
-1.224062, -0.3133831, -2.039567, 1, 1, 1, 1, 1,
-1.218922, -1.921566, -2.821299, 1, 1, 1, 1, 1,
-1.216809, 1.080292, -1.305813, 1, 1, 1, 1, 1,
-1.215275, -0.8566773, -2.988556, 1, 1, 1, 1, 1,
-1.215171, -1.970431, -2.622643, 0, 0, 1, 1, 1,
-1.208182, -1.035367, -2.053376, 1, 0, 0, 1, 1,
-1.205711, -0.9465758, -2.14458, 1, 0, 0, 1, 1,
-1.200435, 0.130263, -1.201316, 1, 0, 0, 1, 1,
-1.194647, -1.610372, -1.33543, 1, 0, 0, 1, 1,
-1.193371, -0.4108121, -1.296609, 1, 0, 0, 1, 1,
-1.191481, 0.8923265, -0.4800507, 0, 0, 0, 1, 1,
-1.190086, -0.08554541, -0.8030152, 0, 0, 0, 1, 1,
-1.182415, 0.2522621, -0.5503119, 0, 0, 0, 1, 1,
-1.181072, -1.130705, -3.123594, 0, 0, 0, 1, 1,
-1.180675, 0.3269135, -1.969361, 0, 0, 0, 1, 1,
-1.1698, 0.1950735, -0.7697082, 0, 0, 0, 1, 1,
-1.164497, 0.2249192, -1.971337, 0, 0, 0, 1, 1,
-1.162938, -1.399979, -1.132492, 1, 1, 1, 1, 1,
-1.160418, 0.2489113, -1.442903, 1, 1, 1, 1, 1,
-1.159576, -0.2596692, -0.7729499, 1, 1, 1, 1, 1,
-1.154048, -1.467859, -3.05447, 1, 1, 1, 1, 1,
-1.14266, -0.6739935, -4.048731, 1, 1, 1, 1, 1,
-1.139765, 0.8767709, -0.8612319, 1, 1, 1, 1, 1,
-1.139584, -1.050844, -2.297777, 1, 1, 1, 1, 1,
-1.138098, -0.2235035, -2.039331, 1, 1, 1, 1, 1,
-1.138067, 0.04889936, 0.5789492, 1, 1, 1, 1, 1,
-1.133956, -0.4582054, -2.429893, 1, 1, 1, 1, 1,
-1.133917, -0.154834, -2.798696, 1, 1, 1, 1, 1,
-1.123943, 2.004265, -1.371627, 1, 1, 1, 1, 1,
-1.123599, 0.6292238, -1.574468, 1, 1, 1, 1, 1,
-1.11997, 2.157613, -0.9210525, 1, 1, 1, 1, 1,
-1.115531, -0.2906074, -1.9858, 1, 1, 1, 1, 1,
-1.115107, -0.8501065, -1.131025, 0, 0, 1, 1, 1,
-1.113338, -0.1555001, -2.181394, 1, 0, 0, 1, 1,
-1.107089, 0.6306842, -1.558586, 1, 0, 0, 1, 1,
-1.105279, 0.5776797, 1.880796, 1, 0, 0, 1, 1,
-1.10136, -1.259477, -2.519399, 1, 0, 0, 1, 1,
-1.097404, -2.653723, -2.586478, 1, 0, 0, 1, 1,
-1.08092, -0.2792105, -1.853407, 0, 0, 0, 1, 1,
-1.080035, 0.9689413, 0.7517663, 0, 0, 0, 1, 1,
-1.07528, -0.9758835, -1.658872, 0, 0, 0, 1, 1,
-1.070715, 0.1482658, -1.311987, 0, 0, 0, 1, 1,
-1.067516, 0.6104684, -2.24198, 0, 0, 0, 1, 1,
-1.067457, -0.1178386, -2.135907, 0, 0, 0, 1, 1,
-1.067385, 0.02187795, -2.59755, 0, 0, 0, 1, 1,
-1.06191, 0.2631387, -1.716787, 1, 1, 1, 1, 1,
-1.056089, 0.4765582, -2.255426, 1, 1, 1, 1, 1,
-1.053492, -1.035517, -2.154695, 1, 1, 1, 1, 1,
-1.04544, -0.7531301, -3.004864, 1, 1, 1, 1, 1,
-1.042784, -0.2379369, -1.673188, 1, 1, 1, 1, 1,
-1.0386, -0.2987196, -1.026622, 1, 1, 1, 1, 1,
-1.033129, 0.8879476, -0.9016969, 1, 1, 1, 1, 1,
-1.032852, 1.401149, -0.7877609, 1, 1, 1, 1, 1,
-1.029902, 0.1542312, 0.195245, 1, 1, 1, 1, 1,
-1.028681, -0.5487154, -1.146478, 1, 1, 1, 1, 1,
-1.018284, 0.2936374, -4.148931, 1, 1, 1, 1, 1,
-1.018258, 0.5858884, 0.3317963, 1, 1, 1, 1, 1,
-1.016862, -0.3549635, -3.174619, 1, 1, 1, 1, 1,
-1.012791, 0.2995362, -1.470662, 1, 1, 1, 1, 1,
-1.011386, -0.3470813, -2.364681, 1, 1, 1, 1, 1,
-1.011098, 1.577188, -0.02419431, 0, 0, 1, 1, 1,
-1.008581, -1.227366, -1.076869, 1, 0, 0, 1, 1,
-1.006328, 2.424865, 0.2344207, 1, 0, 0, 1, 1,
-1.005697, -0.4198809, -3.114591, 1, 0, 0, 1, 1,
-0.9963071, -1.961659, -2.974607, 1, 0, 0, 1, 1,
-0.9961398, -0.4825984, -2.288074, 1, 0, 0, 1, 1,
-0.9950403, 1.022928, -2.933696, 0, 0, 0, 1, 1,
-0.9950068, -1.17667, -2.863987, 0, 0, 0, 1, 1,
-0.9945589, -0.8147197, -1.555661, 0, 0, 0, 1, 1,
-0.9935696, 0.6799164, -1.234934, 0, 0, 0, 1, 1,
-0.9844353, 0.7665948, -1.328752, 0, 0, 0, 1, 1,
-0.9654416, -0.06519569, -2.887293, 0, 0, 0, 1, 1,
-0.9653989, -0.3450366, -1.129389, 0, 0, 0, 1, 1,
-0.9605056, 0.03777269, -1.043891, 1, 1, 1, 1, 1,
-0.9598731, 0.6941078, -2.287276, 1, 1, 1, 1, 1,
-0.9558942, -0.3170062, -2.74934, 1, 1, 1, 1, 1,
-0.9555843, -1.541987, -2.291862, 1, 1, 1, 1, 1,
-0.9549873, -0.1326984, -1.301447, 1, 1, 1, 1, 1,
-0.953606, 1.475427, -2.376432, 1, 1, 1, 1, 1,
-0.9519917, 0.5465413, -0.4783198, 1, 1, 1, 1, 1,
-0.946113, -0.4819151, -2.044334, 1, 1, 1, 1, 1,
-0.9436473, 1.777297, -0.5208233, 1, 1, 1, 1, 1,
-0.9377332, 1.149027, 0.4953395, 1, 1, 1, 1, 1,
-0.933527, -1.256683, -2.740791, 1, 1, 1, 1, 1,
-0.9329792, -0.8975182, -1.217328, 1, 1, 1, 1, 1,
-0.915804, 0.4209763, -0.2214953, 1, 1, 1, 1, 1,
-0.9010274, 0.161428, -1.763592, 1, 1, 1, 1, 1,
-0.9002886, -0.5458634, -1.486044, 1, 1, 1, 1, 1,
-0.8933132, -0.2802983, -2.330466, 0, 0, 1, 1, 1,
-0.8882022, 0.9877497, -1.072817, 1, 0, 0, 1, 1,
-0.8838962, 1.022755, -0.5330316, 1, 0, 0, 1, 1,
-0.8733971, 0.6824395, -1.193085, 1, 0, 0, 1, 1,
-0.8697458, 0.5960068, -0.1004192, 1, 0, 0, 1, 1,
-0.8635974, 0.5639397, -1.315039, 1, 0, 0, 1, 1,
-0.8612899, 0.04362256, -0.617396, 0, 0, 0, 1, 1,
-0.8548635, -0.3551966, -1.689113, 0, 0, 0, 1, 1,
-0.8527627, 0.07520384, -1.748001, 0, 0, 0, 1, 1,
-0.8489577, -1.20135, -2.154369, 0, 0, 0, 1, 1,
-0.844623, 0.4150552, -0.9453466, 0, 0, 0, 1, 1,
-0.8428683, 1.092754, -1.574714, 0, 0, 0, 1, 1,
-0.84021, -0.5727075, -2.36159, 0, 0, 0, 1, 1,
-0.8399393, 0.1126735, -0.5019129, 1, 1, 1, 1, 1,
-0.8377668, -0.7656033, -1.242875, 1, 1, 1, 1, 1,
-0.8315474, 0.144731, -0.4895124, 1, 1, 1, 1, 1,
-0.8294127, 0.54599, -0.2814855, 1, 1, 1, 1, 1,
-0.822147, -0.7007077, -2.654161, 1, 1, 1, 1, 1,
-0.8197055, -1.517294, -3.54489, 1, 1, 1, 1, 1,
-0.8163087, -0.2371306, -1.593131, 1, 1, 1, 1, 1,
-0.8135309, -0.9915422, -2.357528, 1, 1, 1, 1, 1,
-0.8081152, 0.6744946, -1.792406, 1, 1, 1, 1, 1,
-0.807983, -0.6111046, -1.35082, 1, 1, 1, 1, 1,
-0.8018679, 1.344573, -1.009587, 1, 1, 1, 1, 1,
-0.8012283, 1.104015, -0.7497205, 1, 1, 1, 1, 1,
-0.8012148, 0.001820242, -3.906454, 1, 1, 1, 1, 1,
-0.7982912, 0.3265659, -1.914758, 1, 1, 1, 1, 1,
-0.7954199, -0.02323064, -2.843586, 1, 1, 1, 1, 1,
-0.7879148, -0.8276596, -2.716833, 0, 0, 1, 1, 1,
-0.785866, 1.02209, -1.013427, 1, 0, 0, 1, 1,
-0.7835768, -0.7720263, -2.471658, 1, 0, 0, 1, 1,
-0.7822797, -0.6243162, -2.176067, 1, 0, 0, 1, 1,
-0.7800172, -1.205493, -2.335784, 1, 0, 0, 1, 1,
-0.7751632, 1.221935, -2.051896, 1, 0, 0, 1, 1,
-0.7692115, 0.1694853, -0.2560543, 0, 0, 0, 1, 1,
-0.7617897, 0.5984726, -1.97883, 0, 0, 0, 1, 1,
-0.7608833, 0.066335, -2.021008, 0, 0, 0, 1, 1,
-0.7581859, 0.007050886, -0.6564921, 0, 0, 0, 1, 1,
-0.7579292, -0.1569877, -2.305419, 0, 0, 0, 1, 1,
-0.7520541, 0.9330196, -0.2209646, 0, 0, 0, 1, 1,
-0.750908, 1.842769, 1.267712, 0, 0, 0, 1, 1,
-0.745905, 1.336229, -1.611296, 1, 1, 1, 1, 1,
-0.745585, 1.503412, -0.5294839, 1, 1, 1, 1, 1,
-0.7377548, -0.2485578, -0.2924871, 1, 1, 1, 1, 1,
-0.7359129, -1.324473, -1.612736, 1, 1, 1, 1, 1,
-0.7330918, -1.312893, -2.06908, 1, 1, 1, 1, 1,
-0.7324401, -0.01029615, -1.133339, 1, 1, 1, 1, 1,
-0.7306468, -1.741113, -1.264848, 1, 1, 1, 1, 1,
-0.7302347, -1.53006, -2.56614, 1, 1, 1, 1, 1,
-0.7300164, 0.2796033, 0.9642785, 1, 1, 1, 1, 1,
-0.7258733, 0.9928357, -1.322142, 1, 1, 1, 1, 1,
-0.7192153, 0.5973793, -1.189685, 1, 1, 1, 1, 1,
-0.7166573, -0.6643102, -2.639185, 1, 1, 1, 1, 1,
-0.7149183, -0.4364238, -3.425217, 1, 1, 1, 1, 1,
-0.7074954, 0.285364, -1.102056, 1, 1, 1, 1, 1,
-0.7060437, 2.201483, 0.9782073, 1, 1, 1, 1, 1,
-0.7019993, -0.9626634, -3.319009, 0, 0, 1, 1, 1,
-0.7016741, -0.6311905, -1.552169, 1, 0, 0, 1, 1,
-0.7010594, 0.5533034, -1.263805, 1, 0, 0, 1, 1,
-0.6970707, -1.479288, -1.4814, 1, 0, 0, 1, 1,
-0.6928408, -0.8882018, -2.859977, 1, 0, 0, 1, 1,
-0.69094, 0.4189987, -0.3985865, 1, 0, 0, 1, 1,
-0.6869618, 0.7774245, -2.528746, 0, 0, 0, 1, 1,
-0.68613, 0.4920416, -0.0878116, 0, 0, 0, 1, 1,
-0.6811129, -0.8112226, -2.107314, 0, 0, 0, 1, 1,
-0.6764919, -0.653834, -2.507043, 0, 0, 0, 1, 1,
-0.6722621, 0.3136, -1.701661, 0, 0, 0, 1, 1,
-0.6722549, 1.11445, -1.543365, 0, 0, 0, 1, 1,
-0.6716426, -1.098364, -3.343513, 0, 0, 0, 1, 1,
-0.6554281, -0.04457753, -1.231784, 1, 1, 1, 1, 1,
-0.6506667, 0.297815, -0.8618913, 1, 1, 1, 1, 1,
-0.6480504, -2.653663, -4.499712, 1, 1, 1, 1, 1,
-0.6469695, 0.1019449, -1.51206, 1, 1, 1, 1, 1,
-0.6406401, 0.792824, -1.218174, 1, 1, 1, 1, 1,
-0.6406301, -1.138504, -2.859212, 1, 1, 1, 1, 1,
-0.6343106, 1.569634, 0.02904203, 1, 1, 1, 1, 1,
-0.6334558, -1.943245, -1.315042, 1, 1, 1, 1, 1,
-0.6179064, 0.4421223, -1.512126, 1, 1, 1, 1, 1,
-0.6162166, -0.4248219, -2.280323, 1, 1, 1, 1, 1,
-0.6120615, -0.8271801, -3.329285, 1, 1, 1, 1, 1,
-0.6086106, 1.046588, 0.9395686, 1, 1, 1, 1, 1,
-0.6083213, 0.4876154, -0.873576, 1, 1, 1, 1, 1,
-0.60765, -1.233584, -2.972508, 1, 1, 1, 1, 1,
-0.6040624, -0.3706192, -2.781211, 1, 1, 1, 1, 1,
-0.5992198, -0.6258345, -2.458284, 0, 0, 1, 1, 1,
-0.5966802, -0.1112914, -1.488912, 1, 0, 0, 1, 1,
-0.5955924, 1.202672, -1.12919, 1, 0, 0, 1, 1,
-0.5952621, -0.3913315, -1.900912, 1, 0, 0, 1, 1,
-0.5952006, 0.1931592, -0.5536045, 1, 0, 0, 1, 1,
-0.5941215, 1.86823, 0.8915898, 1, 0, 0, 1, 1,
-0.5856467, -0.4768998, -2.210857, 0, 0, 0, 1, 1,
-0.5839543, -0.1677006, -2.824432, 0, 0, 0, 1, 1,
-0.5827795, -0.9850687, -2.725203, 0, 0, 0, 1, 1,
-0.5810564, -0.4670979, -2.810433, 0, 0, 0, 1, 1,
-0.5771465, 0.6880955, 2.545395, 0, 0, 0, 1, 1,
-0.5763031, 0.3469793, 0.3540595, 0, 0, 0, 1, 1,
-0.5746068, -0.8345956, -2.268355, 0, 0, 0, 1, 1,
-0.571959, -0.3740871, -2.347656, 1, 1, 1, 1, 1,
-0.5711568, -0.007051079, -2.122915, 1, 1, 1, 1, 1,
-0.5656945, 0.45434, -2.141677, 1, 1, 1, 1, 1,
-0.5630133, 1.657652, 0.08679709, 1, 1, 1, 1, 1,
-0.5617947, 0.2579105, -0.9554292, 1, 1, 1, 1, 1,
-0.5549676, -1.868031, -2.605298, 1, 1, 1, 1, 1,
-0.5545999, -0.6305187, -1.031613, 1, 1, 1, 1, 1,
-0.5532885, 0.004052328, -1.13119, 1, 1, 1, 1, 1,
-0.549319, 0.1369471, -0.3302997, 1, 1, 1, 1, 1,
-0.5439404, -0.04589422, -1.521838, 1, 1, 1, 1, 1,
-0.5397775, 0.6011188, -1.239782, 1, 1, 1, 1, 1,
-0.5387148, -0.2267387, -2.189294, 1, 1, 1, 1, 1,
-0.537982, 0.1412237, -1.219477, 1, 1, 1, 1, 1,
-0.5377157, -0.6069008, -0.4710317, 1, 1, 1, 1, 1,
-0.5347485, 0.5867003, -0.5125644, 1, 1, 1, 1, 1,
-0.5336375, -0.2542503, -0.9982486, 0, 0, 1, 1, 1,
-0.530088, 0.7777121, -1.313197, 1, 0, 0, 1, 1,
-0.5286355, -0.8165448, -3.484636, 1, 0, 0, 1, 1,
-0.52849, -1.508535, -0.8248207, 1, 0, 0, 1, 1,
-0.5269583, 0.9520253, -1.579178, 1, 0, 0, 1, 1,
-0.5226857, 0.2768005, -0.7033153, 1, 0, 0, 1, 1,
-0.5184899, -0.5733472, -2.169137, 0, 0, 0, 1, 1,
-0.5139757, -0.9363594, -2.2537, 0, 0, 0, 1, 1,
-0.5136947, 0.2087033, 0.8547269, 0, 0, 0, 1, 1,
-0.5129722, -0.8716236, -2.347345, 0, 0, 0, 1, 1,
-0.5115723, 1.328957, -0.5405644, 0, 0, 0, 1, 1,
-0.5072589, -1.955985, -2.944429, 0, 0, 0, 1, 1,
-0.504679, 0.2267159, -1.316736, 0, 0, 0, 1, 1,
-0.5041363, 1.091309, 1.005908, 1, 1, 1, 1, 1,
-0.5012912, 0.933428, -0.9310521, 1, 1, 1, 1, 1,
-0.5010601, 0.09588256, -2.135636, 1, 1, 1, 1, 1,
-0.4979504, -0.2233481, -4.214349, 1, 1, 1, 1, 1,
-0.4960257, 0.1845094, -0.900241, 1, 1, 1, 1, 1,
-0.4953684, -1.00665, -2.55192, 1, 1, 1, 1, 1,
-0.4932777, 0.06655419, -3.047271, 1, 1, 1, 1, 1,
-0.4930415, -1.082848, -3.636176, 1, 1, 1, 1, 1,
-0.492753, 0.1072183, -0.7456658, 1, 1, 1, 1, 1,
-0.4905134, -0.8550753, -3.180668, 1, 1, 1, 1, 1,
-0.4903716, -0.689831, -3.333687, 1, 1, 1, 1, 1,
-0.489594, 0.03037878, -0.7033893, 1, 1, 1, 1, 1,
-0.4852507, 1.516303, -0.9083331, 1, 1, 1, 1, 1,
-0.484001, 1.120374, 1.456931, 1, 1, 1, 1, 1,
-0.4823579, -0.3690543, -2.464803, 1, 1, 1, 1, 1,
-0.4781727, 0.5925727, 1.424298, 0, 0, 1, 1, 1,
-0.4778149, -1.430645, -1.587823, 1, 0, 0, 1, 1,
-0.4756028, 0.8450993, -1.289931, 1, 0, 0, 1, 1,
-0.4747279, 1.338995, -1.021815, 1, 0, 0, 1, 1,
-0.4727997, -0.5975565, -2.710386, 1, 0, 0, 1, 1,
-0.4712676, -0.08664801, -0.4692842, 1, 0, 0, 1, 1,
-0.4693767, 0.2289578, 0.3002554, 0, 0, 0, 1, 1,
-0.4682594, 0.1734043, -1.220283, 0, 0, 0, 1, 1,
-0.4681961, 1.168121, 0.3013162, 0, 0, 0, 1, 1,
-0.4611901, 0.5869187, 0.7544433, 0, 0, 0, 1, 1,
-0.4545479, 0.3145013, -1.0809, 0, 0, 0, 1, 1,
-0.4489006, 0.2003859, 0.06236885, 0, 0, 0, 1, 1,
-0.4470017, -1.578034, -3.551471, 0, 0, 0, 1, 1,
-0.4441086, 1.05694, -1.431728, 1, 1, 1, 1, 1,
-0.4438903, 0.03686677, -1.647844, 1, 1, 1, 1, 1,
-0.4429521, -0.920162, -2.502052, 1, 1, 1, 1, 1,
-0.4428087, 0.7901556, 0.4647036, 1, 1, 1, 1, 1,
-0.4419332, 1.717175, -0.3612069, 1, 1, 1, 1, 1,
-0.4418848, 1.286531, 0.4822206, 1, 1, 1, 1, 1,
-0.4414504, 0.1037092, -4.475002, 1, 1, 1, 1, 1,
-0.4398083, 0.3765835, 0.4136123, 1, 1, 1, 1, 1,
-0.4382352, 0.9112837, -1.019397, 1, 1, 1, 1, 1,
-0.4257057, -1.036734, -2.5064, 1, 1, 1, 1, 1,
-0.4221997, 1.32921, 0.9439055, 1, 1, 1, 1, 1,
-0.4205926, -1.226488, -2.523422, 1, 1, 1, 1, 1,
-0.4199775, -0.9408476, -0.9650215, 1, 1, 1, 1, 1,
-0.4195867, 0.4518969, -0.1898569, 1, 1, 1, 1, 1,
-0.4168941, 2.496994, -0.5304908, 1, 1, 1, 1, 1,
-0.414256, 1.101503, -1.117577, 0, 0, 1, 1, 1,
-0.4098964, -1.189134, -5.056345, 1, 0, 0, 1, 1,
-0.4090628, -0.04515366, -2.154992, 1, 0, 0, 1, 1,
-0.4088648, -0.3028565, -4.576977, 1, 0, 0, 1, 1,
-0.4057032, -1.083215, -3.521449, 1, 0, 0, 1, 1,
-0.3999014, -0.5467141, -1.42546, 1, 0, 0, 1, 1,
-0.3971267, 0.9279892, 0.5510433, 0, 0, 0, 1, 1,
-0.3959976, 0.3379457, -0.7559082, 0, 0, 0, 1, 1,
-0.3932976, -0.4993566, -2.757442, 0, 0, 0, 1, 1,
-0.3926507, -2.757357, -3.122691, 0, 0, 0, 1, 1,
-0.3922306, -0.9800203, -1.68237, 0, 0, 0, 1, 1,
-0.3900824, 0.4034288, -0.6497031, 0, 0, 0, 1, 1,
-0.3878345, 0.4462902, -0.5137213, 0, 0, 0, 1, 1,
-0.3859223, -0.3298394, -1.53258, 1, 1, 1, 1, 1,
-0.3816704, -0.5768033, -1.881789, 1, 1, 1, 1, 1,
-0.3791386, -0.002983042, -1.141294, 1, 1, 1, 1, 1,
-0.3619342, -0.9357809, -2.876812, 1, 1, 1, 1, 1,
-0.3584874, -0.3409647, -2.42659, 1, 1, 1, 1, 1,
-0.3567219, 0.7495874, -1.035093, 1, 1, 1, 1, 1,
-0.3556118, -0.3178411, -0.9390329, 1, 1, 1, 1, 1,
-0.351025, 0.2104991, -2.509706, 1, 1, 1, 1, 1,
-0.3504744, -0.6560392, -2.201065, 1, 1, 1, 1, 1,
-0.3473761, 0.4675121, -0.8185428, 1, 1, 1, 1, 1,
-0.3446521, 0.255229, -1.808517, 1, 1, 1, 1, 1,
-0.3419112, -0.3292259, 0.144641, 1, 1, 1, 1, 1,
-0.3416329, -0.1529591, -1.105035, 1, 1, 1, 1, 1,
-0.3403735, -0.339774, -1.882664, 1, 1, 1, 1, 1,
-0.3379324, -0.7386286, -3.605311, 1, 1, 1, 1, 1,
-0.334668, -0.2629407, -1.651464, 0, 0, 1, 1, 1,
-0.3346671, 1.795082, 0.2002388, 1, 0, 0, 1, 1,
-0.3343291, -0.522758, -2.949978, 1, 0, 0, 1, 1,
-0.3340435, 1.523785, -0.3929963, 1, 0, 0, 1, 1,
-0.3329373, -0.4236381, -2.154469, 1, 0, 0, 1, 1,
-0.3272083, 0.1331562, -0.6214666, 1, 0, 0, 1, 1,
-0.3247835, 1.471398, -0.7420109, 0, 0, 0, 1, 1,
-0.3132942, 0.5469239, -0.4710346, 0, 0, 0, 1, 1,
-0.3129813, 0.5578814, -1.719278, 0, 0, 0, 1, 1,
-0.3126236, 1.257181, 0.6353658, 0, 0, 0, 1, 1,
-0.3103789, -0.1051451, -3.84277, 0, 0, 0, 1, 1,
-0.3103464, 0.5638494, -0.1353958, 0, 0, 0, 1, 1,
-0.3060167, -0.09964093, -1.503102, 0, 0, 0, 1, 1,
-0.3046518, 1.026413, -0.3793047, 1, 1, 1, 1, 1,
-0.3036403, 0.8706387, -0.1496404, 1, 1, 1, 1, 1,
-0.3030867, -0.9188455, -2.518723, 1, 1, 1, 1, 1,
-0.3029988, 0.5488223, -1.599479, 1, 1, 1, 1, 1,
-0.3028919, 1.314298, -1.371209, 1, 1, 1, 1, 1,
-0.3022182, -0.479503, -2.318811, 1, 1, 1, 1, 1,
-0.3021818, -1.293439, -2.003703, 1, 1, 1, 1, 1,
-0.3016155, 0.3749759, -3.301796, 1, 1, 1, 1, 1,
-0.2981958, -1.888729, -3.312318, 1, 1, 1, 1, 1,
-0.2978142, -0.6894837, -2.607566, 1, 1, 1, 1, 1,
-0.2974048, 0.1987789, -0.4937445, 1, 1, 1, 1, 1,
-0.2970896, 0.581321, 0.1390714, 1, 1, 1, 1, 1,
-0.2956631, 0.8093407, -0.3238753, 1, 1, 1, 1, 1,
-0.2950429, 0.2067492, -0.4587896, 1, 1, 1, 1, 1,
-0.2940685, 0.6814855, -0.3782848, 1, 1, 1, 1, 1,
-0.2858432, -0.09130353, -0.2083627, 0, 0, 1, 1, 1,
-0.2792234, 0.609829, -0.8746803, 1, 0, 0, 1, 1,
-0.2773843, 0.4651654, 1.502948, 1, 0, 0, 1, 1,
-0.2738527, -0.9142641, -3.453641, 1, 0, 0, 1, 1,
-0.2630964, -0.7559198, -4.419217, 1, 0, 0, 1, 1,
-0.26242, 0.6120003, -0.08471111, 1, 0, 0, 1, 1,
-0.2581686, -0.6323979, -3.07392, 0, 0, 0, 1, 1,
-0.2555452, 0.08252686, -0.7614508, 0, 0, 0, 1, 1,
-0.2513562, -0.6219686, -3.169511, 0, 0, 0, 1, 1,
-0.2508146, 0.8253227, 0.002280048, 0, 0, 0, 1, 1,
-0.2467897, 0.7056231, -1.493856, 0, 0, 0, 1, 1,
-0.2454393, 0.8679427, -2.583944, 0, 0, 0, 1, 1,
-0.2433085, -0.8343095, -3.664103, 0, 0, 0, 1, 1,
-0.2417515, -1.693292, -3.690221, 1, 1, 1, 1, 1,
-0.239561, -0.6078575, -2.868251, 1, 1, 1, 1, 1,
-0.2382432, 0.3413284, -0.5052994, 1, 1, 1, 1, 1,
-0.2376859, 0.5412415, -0.9948542, 1, 1, 1, 1, 1,
-0.2373241, 0.9505318, 0.1822156, 1, 1, 1, 1, 1,
-0.2371559, 0.119955, -1.205966, 1, 1, 1, 1, 1,
-0.232845, 1.280873, 0.006236722, 1, 1, 1, 1, 1,
-0.2321749, 0.2197851, -2.763182, 1, 1, 1, 1, 1,
-0.2314556, 0.4077051, -2.584461, 1, 1, 1, 1, 1,
-0.2277036, 1.914934, -1.011474, 1, 1, 1, 1, 1,
-0.2239373, -1.211494, -3.552481, 1, 1, 1, 1, 1,
-0.2211042, -0.5553538, -4.138109, 1, 1, 1, 1, 1,
-0.2189477, -0.3668738, -4.338684, 1, 1, 1, 1, 1,
-0.2141556, 0.7023895, 0.4320504, 1, 1, 1, 1, 1,
-0.2105606, 1.003185, 0.5118852, 1, 1, 1, 1, 1,
-0.2104958, 0.392113, 0.7099269, 0, 0, 1, 1, 1,
-0.2095583, -1.577957, -2.480462, 1, 0, 0, 1, 1,
-0.2071841, -1.762856, -5.164128, 1, 0, 0, 1, 1,
-0.2070065, 1.498265, -0.5338987, 1, 0, 0, 1, 1,
-0.2060552, -0.557838, -5.407941, 1, 0, 0, 1, 1,
-0.2056155, -1.022536, -2.499049, 1, 0, 0, 1, 1,
-0.2050864, -0.2329504, -2.929733, 0, 0, 0, 1, 1,
-0.1980171, 1.315071, -1.489852, 0, 0, 0, 1, 1,
-0.1975974, 0.1705576, -2.554182, 0, 0, 0, 1, 1,
-0.1974228, 0.441504, 0.0381904, 0, 0, 0, 1, 1,
-0.195323, 0.6793203, -2.974061, 0, 0, 0, 1, 1,
-0.1946819, 0.1413149, 0.03968269, 0, 0, 0, 1, 1,
-0.1929237, -0.389266, -3.388007, 0, 0, 0, 1, 1,
-0.1921385, 0.1166648, -2.99029, 1, 1, 1, 1, 1,
-0.1909506, 1.673498, 1.07484, 1, 1, 1, 1, 1,
-0.1898205, 0.1652741, -0.1937033, 1, 1, 1, 1, 1,
-0.189146, -0.8161654, -3.37457, 1, 1, 1, 1, 1,
-0.1819634, -2.058059, -3.355043, 1, 1, 1, 1, 1,
-0.1796179, -0.7457427, -3.541203, 1, 1, 1, 1, 1,
-0.1778482, 0.2930179, 0.01878002, 1, 1, 1, 1, 1,
-0.1774622, 0.1344627, -1.53235, 1, 1, 1, 1, 1,
-0.1763505, 1.227069, -0.2747448, 1, 1, 1, 1, 1,
-0.176222, 0.004851969, -1.415706, 1, 1, 1, 1, 1,
-0.169147, -0.7225626, -2.291412, 1, 1, 1, 1, 1,
-0.1689891, -1.848443, -3.259181, 1, 1, 1, 1, 1,
-0.1677448, 0.8273903, -1.469894, 1, 1, 1, 1, 1,
-0.1669513, 0.3759668, -0.4075338, 1, 1, 1, 1, 1,
-0.1650157, 2.312335, -0.9343734, 1, 1, 1, 1, 1,
-0.1627963, -0.3529059, -0.6254437, 0, 0, 1, 1, 1,
-0.1616043, 1.281187, -1.851327, 1, 0, 0, 1, 1,
-0.1568393, -1.25693, -2.762712, 1, 0, 0, 1, 1,
-0.1565181, -0.7839094, -3.470138, 1, 0, 0, 1, 1,
-0.1557671, -0.02985635, -1.372676, 1, 0, 0, 1, 1,
-0.154542, -1.324836, -5.442498, 1, 0, 0, 1, 1,
-0.1536696, 0.297433, -0.6872796, 0, 0, 0, 1, 1,
-0.1519945, 1.765874, 0.4161799, 0, 0, 0, 1, 1,
-0.1508702, 0.7278718, -0.5897233, 0, 0, 0, 1, 1,
-0.1502984, 1.291832, 0.7198287, 0, 0, 0, 1, 1,
-0.1498613, 0.06779449, -2.352096, 0, 0, 0, 1, 1,
-0.1467615, 0.0672368, -1.900039, 0, 0, 0, 1, 1,
-0.144856, 0.2697017, 0.8442529, 0, 0, 0, 1, 1,
-0.1444864, 1.135089, 0.3634159, 1, 1, 1, 1, 1,
-0.1410047, -0.465896, -2.811023, 1, 1, 1, 1, 1,
-0.1274187, -0.1705937, -3.91201, 1, 1, 1, 1, 1,
-0.1240198, -0.1979561, -3.477275, 1, 1, 1, 1, 1,
-0.1191437, 0.1102707, 0.3343358, 1, 1, 1, 1, 1,
-0.1190445, -1.788514, -2.558305, 1, 1, 1, 1, 1,
-0.1183261, 0.7340592, -0.7388873, 1, 1, 1, 1, 1,
-0.1148821, -0.2444368, -5.197098, 1, 1, 1, 1, 1,
-0.111055, 0.5942338, -0.275728, 1, 1, 1, 1, 1,
-0.1108349, -0.3073745, -2.866997, 1, 1, 1, 1, 1,
-0.110147, -1.269389, -1.80943, 1, 1, 1, 1, 1,
-0.1079209, 1.044213, 1.571534, 1, 1, 1, 1, 1,
-0.1030286, 0.3063797, 1.312363, 1, 1, 1, 1, 1,
-0.1020869, -0.8290937, -2.890855, 1, 1, 1, 1, 1,
-0.1004503, -1.416583, -3.751879, 1, 1, 1, 1, 1,
-0.09130728, -0.4285205, -2.331632, 0, 0, 1, 1, 1,
-0.08878908, 0.4136673, -1.524333, 1, 0, 0, 1, 1,
-0.08224916, -1.553067, -2.858645, 1, 0, 0, 1, 1,
-0.0778388, 0.9499267, -0.7507163, 1, 0, 0, 1, 1,
-0.07442956, -1.018466, -3.531071, 1, 0, 0, 1, 1,
-0.06867581, 0.5067346, -0.3300237, 1, 0, 0, 1, 1,
-0.06609905, -0.7380224, -2.629521, 0, 0, 0, 1, 1,
-0.06580018, 0.9558105, 0.7185556, 0, 0, 0, 1, 1,
-0.05638594, 1.438469, -1.268656, 0, 0, 0, 1, 1,
-0.05462428, 0.06342017, -1.305272, 0, 0, 0, 1, 1,
-0.04897301, -0.6032729, -5.479889, 0, 0, 0, 1, 1,
-0.04891571, 0.1198675, -1.969001, 0, 0, 0, 1, 1,
-0.04851078, -0.1455768, -2.321503, 0, 0, 0, 1, 1,
-0.04468334, 2.639129, 1.141716, 1, 1, 1, 1, 1,
-0.04192609, 2.361351, -0.4538303, 1, 1, 1, 1, 1,
-0.03417234, -0.7826138, -2.853195, 1, 1, 1, 1, 1,
-0.03378134, -0.9115781, -1.663863, 1, 1, 1, 1, 1,
-0.03054864, -0.2547198, -2.49579, 1, 1, 1, 1, 1,
-0.02711068, -0.2317941, -2.697916, 1, 1, 1, 1, 1,
-0.02585713, 0.07381965, -1.003382, 1, 1, 1, 1, 1,
-0.02514856, 0.4560198, 0.2675351, 1, 1, 1, 1, 1,
-0.02421068, 0.9334354, -1.395594, 1, 1, 1, 1, 1,
-0.02303083, 0.5580418, -1.889257, 1, 1, 1, 1, 1,
-0.02188991, -0.627314, -4.203153, 1, 1, 1, 1, 1,
-0.01952528, -0.3363664, -3.407501, 1, 1, 1, 1, 1,
-0.0195122, -0.5370926, -3.284806, 1, 1, 1, 1, 1,
-0.01917378, 0.1843311, 1.567608, 1, 1, 1, 1, 1,
-0.01861821, 1.348679, -1.010521, 1, 1, 1, 1, 1,
-0.01391127, 0.0807359, -1.671203, 0, 0, 1, 1, 1,
-0.01263577, 0.4967177, -0.6103131, 1, 0, 0, 1, 1,
-0.01081476, 0.5660622, -0.9827467, 1, 0, 0, 1, 1,
-0.008101529, 0.1364562, 0.1345649, 1, 0, 0, 1, 1,
0.0001866905, 0.03502822, -0.1573835, 1, 0, 0, 1, 1,
0.002241567, -0.6586574, 2.25635, 1, 0, 0, 1, 1,
0.01111124, 0.6053967, 0.7154588, 0, 0, 0, 1, 1,
0.01198826, 0.2904112, 1.153003, 0, 0, 0, 1, 1,
0.02058694, 0.3181275, -0.9035451, 0, 0, 0, 1, 1,
0.02295998, -0.5188081, 2.600599, 0, 0, 0, 1, 1,
0.0276279, 1.080451, 0.5745183, 0, 0, 0, 1, 1,
0.03424842, 1.350236, 2.774255, 0, 0, 0, 1, 1,
0.03439311, 1.594211, -1.22871, 0, 0, 0, 1, 1,
0.04084788, 1.956331, 1.792432, 1, 1, 1, 1, 1,
0.04466216, -0.03558854, 0.739085, 1, 1, 1, 1, 1,
0.0475098, 0.4052441, -0.1742719, 1, 1, 1, 1, 1,
0.05129476, 0.3660108, 0.5413229, 1, 1, 1, 1, 1,
0.05169451, -1.843763, 2.290351, 1, 1, 1, 1, 1,
0.05571163, -0.8787841, 5.069983, 1, 1, 1, 1, 1,
0.06012794, -1.631162, -0.2099226, 1, 1, 1, 1, 1,
0.06564244, 0.6567051, 0.1201297, 1, 1, 1, 1, 1,
0.06632093, 1.424429, 0.8731179, 1, 1, 1, 1, 1,
0.06719266, 1.628469, -0.3290311, 1, 1, 1, 1, 1,
0.06890341, 0.2699423, -0.8397824, 1, 1, 1, 1, 1,
0.06896236, -1.106225, 2.840548, 1, 1, 1, 1, 1,
0.06931846, 0.8243974, 1.065313, 1, 1, 1, 1, 1,
0.06989625, -0.6692427, 3.827915, 1, 1, 1, 1, 1,
0.07066356, 0.03161757, 1.815669, 1, 1, 1, 1, 1,
0.07166808, -0.4880379, 3.143953, 0, 0, 1, 1, 1,
0.07210554, -0.4921391, 2.410782, 1, 0, 0, 1, 1,
0.07716003, 1.414667, 0.6688206, 1, 0, 0, 1, 1,
0.07852093, -0.4103164, 3.084384, 1, 0, 0, 1, 1,
0.08174163, -1.354662, 3.302341, 1, 0, 0, 1, 1,
0.09226205, -0.315011, 1.647187, 1, 0, 0, 1, 1,
0.09312885, 1.436615, 0.2490382, 0, 0, 0, 1, 1,
0.09734498, 0.2709682, 0.4474498, 0, 0, 0, 1, 1,
0.09867269, 0.2184807, 0.8217186, 0, 0, 0, 1, 1,
0.09881148, -0.9490611, 2.888879, 0, 0, 0, 1, 1,
0.1004768, -0.110257, 2.701269, 0, 0, 0, 1, 1,
0.1039117, 0.4058731, 1.31699, 0, 0, 0, 1, 1,
0.1166885, 0.7719492, 0.00332471, 0, 0, 0, 1, 1,
0.1193104, 1.464815, 0.1796894, 1, 1, 1, 1, 1,
0.1238062, -0.07104784, 0.6644664, 1, 1, 1, 1, 1,
0.1330383, -0.6319489, 3.121041, 1, 1, 1, 1, 1,
0.1356696, 0.3393801, -0.3246737, 1, 1, 1, 1, 1,
0.135947, 0.5591015, 1.025893, 1, 1, 1, 1, 1,
0.1370788, 0.6429254, 0.8231376, 1, 1, 1, 1, 1,
0.1404468, 2.116272, -0.2151084, 1, 1, 1, 1, 1,
0.1406164, 1.895526, 2.71447, 1, 1, 1, 1, 1,
0.1447787, 0.5650291, -1.753103, 1, 1, 1, 1, 1,
0.1473481, 2.496754, -0.2530163, 1, 1, 1, 1, 1,
0.1508519, 0.1085319, 2.49375, 1, 1, 1, 1, 1,
0.1546995, 1.18578, 0.941581, 1, 1, 1, 1, 1,
0.1555809, -0.4290793, 1.818561, 1, 1, 1, 1, 1,
0.155843, -0.1375679, 1.727117, 1, 1, 1, 1, 1,
0.1614233, -1.036137, 2.590038, 1, 1, 1, 1, 1,
0.1615398, 0.5481687, 0.1538354, 0, 0, 1, 1, 1,
0.1644169, 1.514507, 0.3766725, 1, 0, 0, 1, 1,
0.1681524, -0.3199765, 3.328417, 1, 0, 0, 1, 1,
0.170574, -0.3992447, 1.156451, 1, 0, 0, 1, 1,
0.1734651, 1.288569, 0.2858148, 1, 0, 0, 1, 1,
0.1738077, -1.330713, 2.931139, 1, 0, 0, 1, 1,
0.1750575, -0.0003825513, 2.44266, 0, 0, 0, 1, 1,
0.1782792, 1.550719, 0.1541906, 0, 0, 0, 1, 1,
0.1803605, -0.6522754, 1.811127, 0, 0, 0, 1, 1,
0.1809608, 0.08895651, 1.154756, 0, 0, 0, 1, 1,
0.1887219, 0.8655494, -0.4991813, 0, 0, 0, 1, 1,
0.1918796, -0.5866202, 3.774988, 0, 0, 0, 1, 1,
0.1947505, 1.118479, -0.1107222, 0, 0, 0, 1, 1,
0.1952077, 1.385077, 0.8229521, 1, 1, 1, 1, 1,
0.20505, -0.5525476, 2.487562, 1, 1, 1, 1, 1,
0.2057112, -0.0122533, 1.589001, 1, 1, 1, 1, 1,
0.2066201, -0.3745335, 3.269828, 1, 1, 1, 1, 1,
0.2156417, 0.003583245, 2.715359, 1, 1, 1, 1, 1,
0.2235725, -0.04198131, 2.12431, 1, 1, 1, 1, 1,
0.2250761, -2.741512, 3.230913, 1, 1, 1, 1, 1,
0.2297743, 0.4695302, 0.3567129, 1, 1, 1, 1, 1,
0.2300597, -0.8894858, 3.780351, 1, 1, 1, 1, 1,
0.238883, -1.833917, 1.841278, 1, 1, 1, 1, 1,
0.2414775, 0.1910966, 0.2753937, 1, 1, 1, 1, 1,
0.2428247, -0.5154937, 2.390559, 1, 1, 1, 1, 1,
0.2450041, -1.470748, 3.511238, 1, 1, 1, 1, 1,
0.2492884, -2.116357, 3.166653, 1, 1, 1, 1, 1,
0.2531047, -0.1712481, 2.296599, 1, 1, 1, 1, 1,
0.2547141, 0.7110321, 0.8414892, 0, 0, 1, 1, 1,
0.2558212, -0.8004362, 4.147702, 1, 0, 0, 1, 1,
0.2562296, 0.1639448, 0.7873827, 1, 0, 0, 1, 1,
0.2576472, -1.129658, 2.380499, 1, 0, 0, 1, 1,
0.2638283, -0.3524771, 2.493327, 1, 0, 0, 1, 1,
0.2709654, -0.5506077, 3.24204, 1, 0, 0, 1, 1,
0.2711581, -1.633427, 3.567441, 0, 0, 0, 1, 1,
0.2725469, 1.027344, -0.5549001, 0, 0, 0, 1, 1,
0.2727451, 0.5309737, 0.7476483, 0, 0, 0, 1, 1,
0.2734197, 0.3136837, -0.2118065, 0, 0, 0, 1, 1,
0.2746948, 0.2603973, 1.123765, 0, 0, 0, 1, 1,
0.2771251, 1.453612, -0.4320854, 0, 0, 0, 1, 1,
0.282747, -0.612459, 3.327198, 0, 0, 0, 1, 1,
0.284946, 0.6665438, 0.7465553, 1, 1, 1, 1, 1,
0.2857572, 0.3775584, 1.694391, 1, 1, 1, 1, 1,
0.2880143, -0.4181039, 1.234477, 1, 1, 1, 1, 1,
0.2889473, 0.4492193, 1.975742, 1, 1, 1, 1, 1,
0.2906522, 0.3030103, 0.7334, 1, 1, 1, 1, 1,
0.2929951, 0.4402109, 1.497528, 1, 1, 1, 1, 1,
0.293403, -0.2556493, 2.358747, 1, 1, 1, 1, 1,
0.2965054, 0.365578, 0.7362335, 1, 1, 1, 1, 1,
0.3014051, 1.427646, 0.6017198, 1, 1, 1, 1, 1,
0.3097196, 0.4833722, -0.07817253, 1, 1, 1, 1, 1,
0.3128238, 0.3937268, 0.02621367, 1, 1, 1, 1, 1,
0.3132862, -1.697327, 4.161201, 1, 1, 1, 1, 1,
0.3138079, 0.006338765, 3.17139, 1, 1, 1, 1, 1,
0.31459, -0.2805425, 3.215973, 1, 1, 1, 1, 1,
0.3156637, 0.4659288, -0.2141057, 1, 1, 1, 1, 1,
0.319046, -0.709684, 3.953499, 0, 0, 1, 1, 1,
0.3194463, -1.777132, 5.34349, 1, 0, 0, 1, 1,
0.3227897, -1.87165, 2.730101, 1, 0, 0, 1, 1,
0.3233076, 0.317872, 1.638321, 1, 0, 0, 1, 1,
0.3318265, 1.147854, 1.654085, 1, 0, 0, 1, 1,
0.3337269, -0.003760504, 2.067861, 1, 0, 0, 1, 1,
0.3348815, 3.287266, -1.049278, 0, 0, 0, 1, 1,
0.3367425, 0.5686104, -0.1781723, 0, 0, 0, 1, 1,
0.3369172, -0.04718341, 2.444258, 0, 0, 0, 1, 1,
0.3384676, 0.4980505, 0.4635401, 0, 0, 0, 1, 1,
0.3432546, -0.06768367, 0.981941, 0, 0, 0, 1, 1,
0.3440224, -0.04698529, 0.761135, 0, 0, 0, 1, 1,
0.350657, 0.03129979, 1.9151, 0, 0, 0, 1, 1,
0.3571989, 1.280826, -2.578938, 1, 1, 1, 1, 1,
0.3578055, -0.3843176, 4.234927, 1, 1, 1, 1, 1,
0.3584554, -0.09775171, 0.2098242, 1, 1, 1, 1, 1,
0.3596109, 0.9867308, 0.9133829, 1, 1, 1, 1, 1,
0.3646151, 2.826895, 0.8317351, 1, 1, 1, 1, 1,
0.37767, -0.7839556, 3.050721, 1, 1, 1, 1, 1,
0.3822268, 0.08841988, 0.6437323, 1, 1, 1, 1, 1,
0.382234, 0.5895695, 0.8229577, 1, 1, 1, 1, 1,
0.3841793, -0.1601583, 2.437002, 1, 1, 1, 1, 1,
0.3847784, 0.1892766, 2.362855, 1, 1, 1, 1, 1,
0.3861804, -0.1615711, 3.938109, 1, 1, 1, 1, 1,
0.3896711, 1.178297, 0.7188124, 1, 1, 1, 1, 1,
0.3916555, -0.9970885, 1.671488, 1, 1, 1, 1, 1,
0.3943267, 2.064441, -1.323188, 1, 1, 1, 1, 1,
0.3953478, 0.7348276, 1.140931, 1, 1, 1, 1, 1,
0.3993956, 0.6737182, 1.024928, 0, 0, 1, 1, 1,
0.4000381, 0.4443766, 2.047024, 1, 0, 0, 1, 1,
0.4037763, -1.252106, 2.425008, 1, 0, 0, 1, 1,
0.4043013, 1.444275, 0.8233043, 1, 0, 0, 1, 1,
0.4125972, 0.1594114, 1.913211, 1, 0, 0, 1, 1,
0.4136663, 0.3729786, 0.6508819, 1, 0, 0, 1, 1,
0.4138718, 0.2196504, 1.214959, 0, 0, 0, 1, 1,
0.4162131, -0.9884641, 2.794452, 0, 0, 0, 1, 1,
0.4172, 1.747815, 2.216134, 0, 0, 0, 1, 1,
0.4172288, -2.543851, 2.917875, 0, 0, 0, 1, 1,
0.4186668, -1.872865, 1.317679, 0, 0, 0, 1, 1,
0.4188012, -0.2985893, 1.578794, 0, 0, 0, 1, 1,
0.4208524, 1.173318, 0.5216756, 0, 0, 0, 1, 1,
0.4217014, -0.5625728, 3.822362, 1, 1, 1, 1, 1,
0.4232748, 0.630489, 0.8169523, 1, 1, 1, 1, 1,
0.4330995, -1.017798, 3.660542, 1, 1, 1, 1, 1,
0.4331162, -1.733913, 3.548709, 1, 1, 1, 1, 1,
0.4347584, 0.7113107, -0.8863888, 1, 1, 1, 1, 1,
0.439517, -0.256906, 0.7597224, 1, 1, 1, 1, 1,
0.4397987, -1.000959, 0.9411184, 1, 1, 1, 1, 1,
0.4440361, -0.9031972, 5.236008, 1, 1, 1, 1, 1,
0.4487594, -0.5074152, 2.675948, 1, 1, 1, 1, 1,
0.4492783, -0.4116309, 2.263147, 1, 1, 1, 1, 1,
0.449904, 0.5091308, 2.108705, 1, 1, 1, 1, 1,
0.4510984, -0.04030203, 1.584506, 1, 1, 1, 1, 1,
0.4540709, -0.4492805, 1.098541, 1, 1, 1, 1, 1,
0.4541296, 0.04649499, 1.817067, 1, 1, 1, 1, 1,
0.4550079, -1.666071, 4.19559, 1, 1, 1, 1, 1,
0.4560252, -0.3116614, 2.906985, 0, 0, 1, 1, 1,
0.4568283, 0.3122095, -0.1252223, 1, 0, 0, 1, 1,
0.4568844, 0.1067209, 4.117491, 1, 0, 0, 1, 1,
0.4576661, 1.244394, -0.5079275, 1, 0, 0, 1, 1,
0.4584349, -1.563259, 2.52728, 1, 0, 0, 1, 1,
0.4661729, -0.6858153, 0.9694659, 1, 0, 0, 1, 1,
0.4686242, -0.379867, 0.8486166, 0, 0, 0, 1, 1,
0.4698835, 1.068015, -0.4749115, 0, 0, 0, 1, 1,
0.4731625, 0.2105594, 1.214406, 0, 0, 0, 1, 1,
0.4734173, -1.426615, 1.129433, 0, 0, 0, 1, 1,
0.4742955, -1.723927, 1.00413, 0, 0, 0, 1, 1,
0.4745518, 0.4303237, 1.265194, 0, 0, 0, 1, 1,
0.4800731, -0.839682, 3.056679, 0, 0, 0, 1, 1,
0.4844414, 1.587166, 0.46716, 1, 1, 1, 1, 1,
0.492577, 1.366626, 2.193093, 1, 1, 1, 1, 1,
0.4959659, 0.3987923, 1.51496, 1, 1, 1, 1, 1,
0.5019203, -0.346091, 2.767511, 1, 1, 1, 1, 1,
0.504315, -1.2383, 2.646494, 1, 1, 1, 1, 1,
0.5047744, 1.227385, -0.0253753, 1, 1, 1, 1, 1,
0.5057473, -0.8090619, 3.372523, 1, 1, 1, 1, 1,
0.5060596, -0.4413556, 2.641115, 1, 1, 1, 1, 1,
0.508377, 0.5176702, 1.76726, 1, 1, 1, 1, 1,
0.5152143, -0.1422997, 1.664274, 1, 1, 1, 1, 1,
0.5178009, 0.1333006, 2.076727, 1, 1, 1, 1, 1,
0.5211282, -2.012153, 3.543549, 1, 1, 1, 1, 1,
0.5254964, -2.024932, 2.836348, 1, 1, 1, 1, 1,
0.5312413, 0.4575959, 1.925942, 1, 1, 1, 1, 1,
0.5325744, -1.672319, 2.764377, 1, 1, 1, 1, 1,
0.5328326, -0.05845144, 1.177435, 0, 0, 1, 1, 1,
0.5342379, 0.6265898, 0.4547558, 1, 0, 0, 1, 1,
0.535797, -0.6343573, 3.279255, 1, 0, 0, 1, 1,
0.5374045, 0.06959972, 1.839136, 1, 0, 0, 1, 1,
0.5374821, -0.6079501, 3.634107, 1, 0, 0, 1, 1,
0.5394259, 0.7448403, 0.6845502, 1, 0, 0, 1, 1,
0.5436364, 1.197593, 2.866389, 0, 0, 0, 1, 1,
0.5453719, 2.25471, 0.6050284, 0, 0, 0, 1, 1,
0.5461456, 0.9248331, 0.6206744, 0, 0, 0, 1, 1,
0.5465863, -0.2280469, 0.4457749, 0, 0, 0, 1, 1,
0.552753, -0.2728132, 1.477139, 0, 0, 0, 1, 1,
0.5528394, -0.8035825, 2.137595, 0, 0, 0, 1, 1,
0.5528436, 0.1443091, 1.002226, 0, 0, 0, 1, 1,
0.5589221, 0.4356001, -0.4179256, 1, 1, 1, 1, 1,
0.5643856, -0.6075689, 3.35127, 1, 1, 1, 1, 1,
0.566811, -0.2722583, 3.039093, 1, 1, 1, 1, 1,
0.5678321, 0.4310214, 0.2558538, 1, 1, 1, 1, 1,
0.5696218, 0.6346047, 1.411638, 1, 1, 1, 1, 1,
0.5701264, -0.9766603, 2.143293, 1, 1, 1, 1, 1,
0.5712988, -2.258576, 1.152153, 1, 1, 1, 1, 1,
0.5735825, 1.37159, 0.7257504, 1, 1, 1, 1, 1,
0.5743306, -0.4548618, 2.315819, 1, 1, 1, 1, 1,
0.5743636, -1.297777, 4.239204, 1, 1, 1, 1, 1,
0.5755551, 0.9197173, 2.439857, 1, 1, 1, 1, 1,
0.5824887, -0.03019088, 2.099554, 1, 1, 1, 1, 1,
0.5869946, -0.2509701, 1.035805, 1, 1, 1, 1, 1,
0.5883262, -0.0007258595, 1.311067, 1, 1, 1, 1, 1,
0.5928788, -1.038275, 1.499858, 1, 1, 1, 1, 1,
0.599994, 0.5683124, 0.5815173, 0, 0, 1, 1, 1,
0.6016253, 0.2893511, -0.1127252, 1, 0, 0, 1, 1,
0.6028297, -2.264124, 2.92176, 1, 0, 0, 1, 1,
0.6044409, -0.5109126, 0.8816333, 1, 0, 0, 1, 1,
0.6158941, -0.09639943, -0.2431359, 1, 0, 0, 1, 1,
0.6172993, -0.8419076, 2.04999, 1, 0, 0, 1, 1,
0.6203858, 0.6068413, 0.6523922, 0, 0, 0, 1, 1,
0.6214051, -1.017583, 3.342303, 0, 0, 0, 1, 1,
0.6221171, -1.399172, 1.979727, 0, 0, 0, 1, 1,
0.6243744, -1.044328, 3.064646, 0, 0, 0, 1, 1,
0.6283326, 1.157159, 0.009219409, 0, 0, 0, 1, 1,
0.6296682, 0.5737369, 2.145745, 0, 0, 0, 1, 1,
0.6310644, -1.334226, 3.62157, 0, 0, 0, 1, 1,
0.6336556, 1.556017, -0.7467105, 1, 1, 1, 1, 1,
0.6402582, -0.2124332, 3.277332, 1, 1, 1, 1, 1,
0.6427532, 1.514843, -0.3139967, 1, 1, 1, 1, 1,
0.6436514, -0.04346997, 0.6329715, 1, 1, 1, 1, 1,
0.6476989, -1.711501, 2.754123, 1, 1, 1, 1, 1,
0.6560466, -1.322881, 3.312175, 1, 1, 1, 1, 1,
0.6636323, 0.9981656, 0.3991324, 1, 1, 1, 1, 1,
0.672449, 0.02606511, 2.860721, 1, 1, 1, 1, 1,
0.674678, 0.5551039, 1.22181, 1, 1, 1, 1, 1,
0.6786138, 0.2048395, 0.08392928, 1, 1, 1, 1, 1,
0.6791387, -0.23929, 3.030837, 1, 1, 1, 1, 1,
0.6795998, 0.349362, 1.273692, 1, 1, 1, 1, 1,
0.6806607, 1.408181, -1.021177, 1, 1, 1, 1, 1,
0.6935137, 0.793961, 1.110904, 1, 1, 1, 1, 1,
0.6941626, -0.3806912, 4.132172, 1, 1, 1, 1, 1,
0.6975104, -0.5035892, 1.332886, 0, 0, 1, 1, 1,
0.7067083, -0.6871137, 1.210351, 1, 0, 0, 1, 1,
0.7109298, 1.321191, -0.09464056, 1, 0, 0, 1, 1,
0.7115585, -0.1259517, 2.247022, 1, 0, 0, 1, 1,
0.7132897, 0.4087096, 1.634351, 1, 0, 0, 1, 1,
0.7145866, -0.2563382, 1.60459, 1, 0, 0, 1, 1,
0.7166092, 0.2561974, 1.406485, 0, 0, 0, 1, 1,
0.7186953, 1.620832, 0.2933052, 0, 0, 0, 1, 1,
0.719759, 0.1503342, 2.200798, 0, 0, 0, 1, 1,
0.72454, -0.4805575, 2.076886, 0, 0, 0, 1, 1,
0.7257252, 1.212738, 0.5805867, 0, 0, 0, 1, 1,
0.7275831, 0.603583, 1.199213, 0, 0, 0, 1, 1,
0.7326377, 0.3854275, 2.580649, 0, 0, 0, 1, 1,
0.7353389, 0.7972968, 0.6692367, 1, 1, 1, 1, 1,
0.7373653, 0.1270768, 0.7364418, 1, 1, 1, 1, 1,
0.7385564, 1.328063, -0.3181605, 1, 1, 1, 1, 1,
0.7403854, 1.369247, 1.056256, 1, 1, 1, 1, 1,
0.7499577, -1.337164, 3.642196, 1, 1, 1, 1, 1,
0.753318, 0.8661429, 0.2903001, 1, 1, 1, 1, 1,
0.7623371, -1.79826, 2.187479, 1, 1, 1, 1, 1,
0.7633373, -0.3432482, 2.415722, 1, 1, 1, 1, 1,
0.7674703, 1.699831, 1.50252, 1, 1, 1, 1, 1,
0.7683427, 0.3036006, 0.03770145, 1, 1, 1, 1, 1,
0.7756336, 0.6887511, 1.54622, 1, 1, 1, 1, 1,
0.7781273, 1.503758, -0.2904153, 1, 1, 1, 1, 1,
0.78279, 0.9354213, 0.01403191, 1, 1, 1, 1, 1,
0.7874438, -1.272655, -0.1189206, 1, 1, 1, 1, 1,
0.7900993, 0.1314392, 1.265088, 1, 1, 1, 1, 1,
0.7924656, 0.1374424, 2.242859, 0, 0, 1, 1, 1,
0.7929514, -0.2244942, -0.4002492, 1, 0, 0, 1, 1,
0.7969414, 1.243819, -1.147233, 1, 0, 0, 1, 1,
0.7996469, -0.3608246, 4.546124, 1, 0, 0, 1, 1,
0.7999852, 1.109041, 1.028307, 1, 0, 0, 1, 1,
0.8016923, 0.1612802, 2.019202, 1, 0, 0, 1, 1,
0.8048626, 1.742808, 0.3540349, 0, 0, 0, 1, 1,
0.8087946, 0.5421861, 0.3841028, 0, 0, 0, 1, 1,
0.8095884, 0.1439187, 3.583675, 0, 0, 0, 1, 1,
0.8137507, 0.0455815, 1.594577, 0, 0, 0, 1, 1,
0.8141356, -0.9844464, 2.415277, 0, 0, 0, 1, 1,
0.8177724, -1.426567, 1.842603, 0, 0, 0, 1, 1,
0.819393, -1.056298, 2.771766, 0, 0, 0, 1, 1,
0.8195282, -0.2700132, 2.703362, 1, 1, 1, 1, 1,
0.8268093, -0.5009269, 2.210575, 1, 1, 1, 1, 1,
0.8275976, -1.727542, 2.412294, 1, 1, 1, 1, 1,
0.8284526, 1.2098, 0.5169491, 1, 1, 1, 1, 1,
0.8328353, 1.429221, -0.7044241, 1, 1, 1, 1, 1,
0.8358322, -1.389985, 3.404979, 1, 1, 1, 1, 1,
0.8381004, 1.624213, 2.190547, 1, 1, 1, 1, 1,
0.8419812, 0.6845777, 0.4329781, 1, 1, 1, 1, 1,
0.8483797, -1.0931, 2.028031, 1, 1, 1, 1, 1,
0.8612454, -0.3606362, -0.2220889, 1, 1, 1, 1, 1,
0.8625731, -1.139391, 2.895566, 1, 1, 1, 1, 1,
0.8821912, 0.6538699, 2.396786, 1, 1, 1, 1, 1,
0.8823825, 1.025297, 1.371015, 1, 1, 1, 1, 1,
0.8893129, 0.7308372, 1.244373, 1, 1, 1, 1, 1,
0.8903101, 0.06083405, -0.3425515, 1, 1, 1, 1, 1,
0.895398, 0.6690459, 2.141752, 0, 0, 1, 1, 1,
0.9012233, -1.025876, 3.198426, 1, 0, 0, 1, 1,
0.9013664, 0.7865892, -1.533012, 1, 0, 0, 1, 1,
0.9053103, 0.3290834, 0.8037926, 1, 0, 0, 1, 1,
0.9082181, 0.4090398, 1.607117, 1, 0, 0, 1, 1,
0.9099758, -1.183043, 1.764275, 1, 0, 0, 1, 1,
0.9223939, 0.1750301, 2.194675, 0, 0, 0, 1, 1,
0.9237778, -1.914197, 1.945113, 0, 0, 0, 1, 1,
0.9276538, -0.3984688, 0.6667485, 0, 0, 0, 1, 1,
0.933299, -0.3113714, 3.563098, 0, 0, 0, 1, 1,
0.9396009, 1.102587, 0.9381158, 0, 0, 0, 1, 1,
0.94407, 0.3108838, 0.9685199, 0, 0, 0, 1, 1,
0.9513341, 1.372023, 0.7252314, 0, 0, 0, 1, 1,
0.9686325, -0.1805704, 1.295671, 1, 1, 1, 1, 1,
0.9709544, 0.3883149, 1.680996, 1, 1, 1, 1, 1,
0.9769475, 1.257439, 1.635341, 1, 1, 1, 1, 1,
0.9854806, 0.7773293, 0.8019104, 1, 1, 1, 1, 1,
0.9871231, -0.5220736, -0.1903522, 1, 1, 1, 1, 1,
1.000347, -0.04426627, 3.081574, 1, 1, 1, 1, 1,
1.004169, -0.1113406, 2.636989, 1, 1, 1, 1, 1,
1.004247, 0.7386286, 0.02774325, 1, 1, 1, 1, 1,
1.018366, 1.0155, -0.2578621, 1, 1, 1, 1, 1,
1.020923, -1.705955, 1.673458, 1, 1, 1, 1, 1,
1.022698, 0.08079171, 2.695627, 1, 1, 1, 1, 1,
1.04662, -0.4325702, 2.126235, 1, 1, 1, 1, 1,
1.051933, 1.133193, 0.9811993, 1, 1, 1, 1, 1,
1.053636, 1.131668, 1.312487, 1, 1, 1, 1, 1,
1.054934, 1.475953, 1.936857, 1, 1, 1, 1, 1,
1.060473, 0.6743302, -0.3757705, 0, 0, 1, 1, 1,
1.061525, -0.8203995, 3.322032, 1, 0, 0, 1, 1,
1.063532, -0.661921, 3.414055, 1, 0, 0, 1, 1,
1.0708, -1.86241, 1.609721, 1, 0, 0, 1, 1,
1.073198, -0.7269692, 0.9019773, 1, 0, 0, 1, 1,
1.083854, 0.2016327, 2.494478, 1, 0, 0, 1, 1,
1.084887, 0.585781, 0.9961154, 0, 0, 0, 1, 1,
1.084982, -0.9798384, 2.258639, 0, 0, 0, 1, 1,
1.088652, 0.6930658, -0.1681872, 0, 0, 0, 1, 1,
1.094123, 1.380045, -0.4089121, 0, 0, 0, 1, 1,
1.095046, 0.1290048, 2.252905, 0, 0, 0, 1, 1,
1.126425, -1.090382, 3.211856, 0, 0, 0, 1, 1,
1.127748, 1.265227, 1.065759, 0, 0, 0, 1, 1,
1.134141, -0.6376308, 3.7673, 1, 1, 1, 1, 1,
1.136677, 0.9486767, 0.3173089, 1, 1, 1, 1, 1,
1.142482, 0.05648021, 4.097704, 1, 1, 1, 1, 1,
1.145904, -0.1877584, 0.3071629, 1, 1, 1, 1, 1,
1.152314, 0.4785532, 1.931376, 1, 1, 1, 1, 1,
1.162516, -1.05913, 2.880621, 1, 1, 1, 1, 1,
1.162851, -1.263813, 2.183629, 1, 1, 1, 1, 1,
1.169732, 1.891184, 0.3388123, 1, 1, 1, 1, 1,
1.170492, 1.331851, -0.6044531, 1, 1, 1, 1, 1,
1.179206, -0.8173022, 1.558363, 1, 1, 1, 1, 1,
1.179389, -0.2269058, 2.822854, 1, 1, 1, 1, 1,
1.190664, -0.4703945, 2.297743, 1, 1, 1, 1, 1,
1.192618, 0.4635745, 1.45808, 1, 1, 1, 1, 1,
1.195228, -1.675053, 1.189572, 1, 1, 1, 1, 1,
1.206139, -0.6218454, 2.548104, 1, 1, 1, 1, 1,
1.212478, 0.6698527, 1.174462, 0, 0, 1, 1, 1,
1.213577, 0.1208247, -0.5884449, 1, 0, 0, 1, 1,
1.228537, 1.411442, 2.178109, 1, 0, 0, 1, 1,
1.232882, 0.04007645, 0.2921862, 1, 0, 0, 1, 1,
1.234037, -1.265552, 1.307786, 1, 0, 0, 1, 1,
1.239493, 0.0905428, 3.234302, 1, 0, 0, 1, 1,
1.239631, 1.072379, 1.07339, 0, 0, 0, 1, 1,
1.250173, -0.3415863, 1.942714, 0, 0, 0, 1, 1,
1.254251, -0.7421819, 1.430341, 0, 0, 0, 1, 1,
1.260797, 0.002247976, 1.641468, 0, 0, 0, 1, 1,
1.266419, -1.307174, 1.225339, 0, 0, 0, 1, 1,
1.275109, -0.1616974, 1.064567, 0, 0, 0, 1, 1,
1.276855, 0.235655, 2.771851, 0, 0, 0, 1, 1,
1.286348, -0.3380001, 1.986248, 1, 1, 1, 1, 1,
1.286944, 1.516869, 2.852413, 1, 1, 1, 1, 1,
1.296109, 0.779258, 1.962143, 1, 1, 1, 1, 1,
1.297996, 0.05730866, 1.25147, 1, 1, 1, 1, 1,
1.307958, 0.5591477, 1.433715, 1, 1, 1, 1, 1,
1.325151, 0.8154095, 1.766953, 1, 1, 1, 1, 1,
1.349931, 1.061049, -1.237665, 1, 1, 1, 1, 1,
1.358146, -1.398225, 3.591138, 1, 1, 1, 1, 1,
1.368503, -0.9558081, 0.5104284, 1, 1, 1, 1, 1,
1.369734, 1.040714, 1.192258, 1, 1, 1, 1, 1,
1.375576, -0.3445599, 1.636158, 1, 1, 1, 1, 1,
1.380106, -0.5605795, 2.412291, 1, 1, 1, 1, 1,
1.384924, -0.1806555, 1.903196, 1, 1, 1, 1, 1,
1.391837, 0.0908966, 1.759603, 1, 1, 1, 1, 1,
1.396331, -0.2042158, 3.274945, 1, 1, 1, 1, 1,
1.409539, 0.8056387, 2.818085, 0, 0, 1, 1, 1,
1.412723, -2.350314, 2.893851, 1, 0, 0, 1, 1,
1.422581, 0.05974204, 1.443141, 1, 0, 0, 1, 1,
1.432071, -0.03367956, -0.03601858, 1, 0, 0, 1, 1,
1.4395, -1.209104, 1.227033, 1, 0, 0, 1, 1,
1.443728, 1.876831, -0.4460326, 1, 0, 0, 1, 1,
1.447968, 0.09260508, 2.831339, 0, 0, 0, 1, 1,
1.449973, 0.564585, 1.529001, 0, 0, 0, 1, 1,
1.458115, 1.312275, -1.259194, 0, 0, 0, 1, 1,
1.460714, 1.308218, 1.833954, 0, 0, 0, 1, 1,
1.474486, -1.975589, 2.889338, 0, 0, 0, 1, 1,
1.483852, -1.467345, 2.133214, 0, 0, 0, 1, 1,
1.491781, 0.8893014, 1.505719, 0, 0, 0, 1, 1,
1.497143, 1.471811, 1.696124, 1, 1, 1, 1, 1,
1.500422, 0.8441399, 2.047826, 1, 1, 1, 1, 1,
1.501798, -0.2485819, 2.556581, 1, 1, 1, 1, 1,
1.51459, 0.4136404, 3.513456, 1, 1, 1, 1, 1,
1.55254, -0.2874745, 1.738897, 1, 1, 1, 1, 1,
1.560508, 0.2101982, 1.271381, 1, 1, 1, 1, 1,
1.562761, -0.9702853, 2.180275, 1, 1, 1, 1, 1,
1.563129, 0.1589987, 2.564192, 1, 1, 1, 1, 1,
1.569338, -0.08445295, 1.177411, 1, 1, 1, 1, 1,
1.576807, 0.5160644, 2.247417, 1, 1, 1, 1, 1,
1.597229, -0.8301824, 1.877179, 1, 1, 1, 1, 1,
1.600608, -1.89362, 4.205073, 1, 1, 1, 1, 1,
1.603083, 1.758895, 0.9795462, 1, 1, 1, 1, 1,
1.612336, 0.6777796, 2.531254, 1, 1, 1, 1, 1,
1.613715, -0.06692718, 1.544767, 1, 1, 1, 1, 1,
1.615403, -0.2106792, 0.5996189, 0, 0, 1, 1, 1,
1.626176, -0.6936818, 1.690117, 1, 0, 0, 1, 1,
1.630821, -1.385465, 1.840674, 1, 0, 0, 1, 1,
1.671716, 1.504712, -0.2105397, 1, 0, 0, 1, 1,
1.672728, -0.1159738, 1.75328, 1, 0, 0, 1, 1,
1.675517, 0.6500535, 0.1835539, 1, 0, 0, 1, 1,
1.680755, 0.7271909, 1.287889, 0, 0, 0, 1, 1,
1.693717, -0.1070627, 1.991511, 0, 0, 0, 1, 1,
1.744514, 1.148736, 1.387817, 0, 0, 0, 1, 1,
1.746771, 0.5706115, 1.118699, 0, 0, 0, 1, 1,
1.749521, 0.4775083, 2.737854, 0, 0, 0, 1, 1,
1.772755, 1.28207, 0.5190315, 0, 0, 0, 1, 1,
1.794223, 0.1482667, 2.5746, 0, 0, 0, 1, 1,
1.823368, -0.07704621, 2.497035, 1, 1, 1, 1, 1,
1.824077, -0.9466677, 2.551531, 1, 1, 1, 1, 1,
1.839763, -0.1902297, 1.02238, 1, 1, 1, 1, 1,
1.842298, 1.187932, -0.9186064, 1, 1, 1, 1, 1,
1.87841, 0.3087557, 2.294957, 1, 1, 1, 1, 1,
1.90369, -0.7906119, 2.779392, 1, 1, 1, 1, 1,
1.904508, 0.5434029, 1.001517, 1, 1, 1, 1, 1,
1.912494, 0.6260057, 1.516574, 1, 1, 1, 1, 1,
1.925777, -0.6499783, 2.0522, 1, 1, 1, 1, 1,
1.928103, 0.02564296, 0.815193, 1, 1, 1, 1, 1,
1.950175, 1.27556, 0.04102037, 1, 1, 1, 1, 1,
1.984846, -0.0385466, 3.146657, 1, 1, 1, 1, 1,
1.997063, 2.069794, 1.50651, 1, 1, 1, 1, 1,
2.013264, -0.2958946, 1.141467, 1, 1, 1, 1, 1,
2.016215, -1.061947, 1.11197, 1, 1, 1, 1, 1,
2.046812, -2.311911, 2.083321, 0, 0, 1, 1, 1,
2.076408, 1.444288, 2.193062, 1, 0, 0, 1, 1,
2.07643, 0.6028907, 1.666006, 1, 0, 0, 1, 1,
2.086434, -0.4643151, 1.044353, 1, 0, 0, 1, 1,
2.088088, -0.8951578, 0.472297, 1, 0, 0, 1, 1,
2.112253, 1.761291, 1.020144, 1, 0, 0, 1, 1,
2.113399, 0.2249131, 0.7870415, 0, 0, 0, 1, 1,
2.158426, -0.467975, 0.7930814, 0, 0, 0, 1, 1,
2.236098, -0.5508372, 1.396756, 0, 0, 0, 1, 1,
2.238067, 1.018937, -0.4642452, 0, 0, 0, 1, 1,
2.287894, 0.700649, 0.6698763, 0, 0, 0, 1, 1,
2.320052, 0.4490635, 1.404149, 0, 0, 0, 1, 1,
2.362792, -1.316407, 3.769008, 0, 0, 0, 1, 1,
2.380816, -0.3924426, 2.114322, 1, 1, 1, 1, 1,
2.40361, 0.4796527, 1.127692, 1, 1, 1, 1, 1,
2.527686, 0.3559684, 2.965383, 1, 1, 1, 1, 1,
2.631772, -0.2993576, 4.396174, 1, 1, 1, 1, 1,
2.653139, -0.3327518, 2.450062, 1, 1, 1, 1, 1,
2.718935, 1.035805, 0.08028717, 1, 1, 1, 1, 1,
2.728889, -0.6200926, 2.842371, 1, 1, 1, 1, 1
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
var radius = 9.458184;
var distance = 33.22147;
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
mvMatrix.translate( 0.3506763, -0.2649544, 0.06819963 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22147);
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
