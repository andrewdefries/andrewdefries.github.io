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
-4.049681, -0.8340638, -3.024386, 1, 0, 0, 1,
-3.000167, 2.255295, -1.132202, 1, 0.007843138, 0, 1,
-2.835923, -0.3182008, -2.035051, 1, 0.01176471, 0, 1,
-2.272822, 1.167813, -1.330608, 1, 0.01960784, 0, 1,
-2.264555, 0.4239604, -1.51808, 1, 0.02352941, 0, 1,
-2.254378, -0.5021318, -1.338079, 1, 0.03137255, 0, 1,
-2.200691, -1.344942, -1.748571, 1, 0.03529412, 0, 1,
-2.133043, 0.7997321, 0.156487, 1, 0.04313726, 0, 1,
-2.090358, -0.9887938, -1.656024, 1, 0.04705882, 0, 1,
-2.074892, -0.4829431, -1.660442, 1, 0.05490196, 0, 1,
-2.068049, -0.1037154, -1.36904, 1, 0.05882353, 0, 1,
-2.061672, 1.244639, -0.1644439, 1, 0.06666667, 0, 1,
-2.047676, -0.6580535, -3.261269, 1, 0.07058824, 0, 1,
-2.017076, -2.32628, -0.1588805, 1, 0.07843138, 0, 1,
-2.015008, -0.6974913, -2.390761, 1, 0.08235294, 0, 1,
-1.995973, 1.821054, 0.6596505, 1, 0.09019608, 0, 1,
-1.914904, -0.4440328, -3.434624, 1, 0.09411765, 0, 1,
-1.913975, -0.2552371, -2.052034, 1, 0.1019608, 0, 1,
-1.904818, 1.29861, -0.9242543, 1, 0.1098039, 0, 1,
-1.879275, -1.804057, -2.214401, 1, 0.1137255, 0, 1,
-1.846308, -1.991045, -3.092064, 1, 0.1215686, 0, 1,
-1.822275, -0.4878012, -0.8971899, 1, 0.1254902, 0, 1,
-1.806522, 0.8715495, -0.3320943, 1, 0.1333333, 0, 1,
-1.791899, 0.9410236, -1.486733, 1, 0.1372549, 0, 1,
-1.782674, 1.586615, -1.793286, 1, 0.145098, 0, 1,
-1.763541, -0.2283883, -3.01163, 1, 0.1490196, 0, 1,
-1.755341, -0.4078018, -3.430455, 1, 0.1568628, 0, 1,
-1.735444, 1.494619, 0.6981239, 1, 0.1607843, 0, 1,
-1.73393, -0.6817937, -0.2374199, 1, 0.1686275, 0, 1,
-1.713039, -0.3563094, -0.7355363, 1, 0.172549, 0, 1,
-1.680662, -0.6434492, -2.582595, 1, 0.1803922, 0, 1,
-1.667036, 1.647306, -1.041755, 1, 0.1843137, 0, 1,
-1.662487, -0.5269889, -1.304195, 1, 0.1921569, 0, 1,
-1.659482, 0.3878377, -1.761858, 1, 0.1960784, 0, 1,
-1.658944, -0.01427325, -0.829108, 1, 0.2039216, 0, 1,
-1.650051, -0.3506905, -3.573208, 1, 0.2117647, 0, 1,
-1.644979, 0.9684348, -1.273776, 1, 0.2156863, 0, 1,
-1.637522, 0.909952, -2.503699, 1, 0.2235294, 0, 1,
-1.635202, -0.5455143, -2.472621, 1, 0.227451, 0, 1,
-1.628461, -2.223702, -1.633852, 1, 0.2352941, 0, 1,
-1.61461, -0.1006402, -0.6942239, 1, 0.2392157, 0, 1,
-1.605609, -0.344575, -0.1314131, 1, 0.2470588, 0, 1,
-1.58893, 0.2345729, -0.5613894, 1, 0.2509804, 0, 1,
-1.566474, 0.005653983, -0.002612551, 1, 0.2588235, 0, 1,
-1.566156, 0.8638759, -0.5848969, 1, 0.2627451, 0, 1,
-1.559739, -0.4766875, -2.586984, 1, 0.2705882, 0, 1,
-1.551878, 0.512954, 0.4751184, 1, 0.2745098, 0, 1,
-1.542117, 1.382188, -0.5120345, 1, 0.282353, 0, 1,
-1.537758, -1.00525, -1.857376, 1, 0.2862745, 0, 1,
-1.529583, -0.6022682, -2.661991, 1, 0.2941177, 0, 1,
-1.525552, 0.2274635, -1.826657, 1, 0.3019608, 0, 1,
-1.514266, 0.07340246, -1.338086, 1, 0.3058824, 0, 1,
-1.513025, -0.006702458, -1.644284, 1, 0.3137255, 0, 1,
-1.507049, 0.08327216, -2.008976, 1, 0.3176471, 0, 1,
-1.502666, -0.36623, -2.029217, 1, 0.3254902, 0, 1,
-1.502512, -0.3358926, -2.685167, 1, 0.3294118, 0, 1,
-1.479265, -1.521795, -2.219153, 1, 0.3372549, 0, 1,
-1.462741, 1.216545, -2.007281, 1, 0.3411765, 0, 1,
-1.461542, 1.313055, -0.7591113, 1, 0.3490196, 0, 1,
-1.461014, -0.862618, -2.658852, 1, 0.3529412, 0, 1,
-1.458191, -1.148454, -1.515697, 1, 0.3607843, 0, 1,
-1.451342, -0.5134837, -1.55168, 1, 0.3647059, 0, 1,
-1.447814, -0.2960695, -2.833168, 1, 0.372549, 0, 1,
-1.446718, -0.8388841, -3.368524, 1, 0.3764706, 0, 1,
-1.41739, -0.08880795, -0.6925743, 1, 0.3843137, 0, 1,
-1.41455, -0.4016052, -2.495965, 1, 0.3882353, 0, 1,
-1.411967, -1.249913, -3.600377, 1, 0.3960784, 0, 1,
-1.389189, 0.3385852, -0.8151314, 1, 0.4039216, 0, 1,
-1.38596, -0.2935562, -1.42433, 1, 0.4078431, 0, 1,
-1.380879, 0.1948658, -1.673483, 1, 0.4156863, 0, 1,
-1.380843, 1.182045, -0.7692889, 1, 0.4196078, 0, 1,
-1.363991, -0.01258397, -1.613028, 1, 0.427451, 0, 1,
-1.354583, 1.119168, -0.9424703, 1, 0.4313726, 0, 1,
-1.33655, -0.09823488, -2.515351, 1, 0.4392157, 0, 1,
-1.32842, 1.231211, -1.011728, 1, 0.4431373, 0, 1,
-1.323861, 1.119334, -3.574697, 1, 0.4509804, 0, 1,
-1.314687, 0.2689542, -1.415154, 1, 0.454902, 0, 1,
-1.310749, 0.3053794, 0.1315511, 1, 0.4627451, 0, 1,
-1.306508, 0.2519265, -1.741959, 1, 0.4666667, 0, 1,
-1.299743, 0.7836931, -0.7826372, 1, 0.4745098, 0, 1,
-1.293207, 1.843367, -0.9971527, 1, 0.4784314, 0, 1,
-1.290755, -0.2553864, -2.759422, 1, 0.4862745, 0, 1,
-1.285138, -0.06547489, -0.6121274, 1, 0.4901961, 0, 1,
-1.274429, -1.574576, -3.905902, 1, 0.4980392, 0, 1,
-1.26447, 1.427781, -1.520072, 1, 0.5058824, 0, 1,
-1.260916, 1.043437, -1.30752, 1, 0.509804, 0, 1,
-1.259415, -0.4200189, -2.645245, 1, 0.5176471, 0, 1,
-1.249737, -0.3245432, -4.512692, 1, 0.5215687, 0, 1,
-1.246078, 1.409855, -1.013372, 1, 0.5294118, 0, 1,
-1.22999, 0.6244065, -1.025667, 1, 0.5333334, 0, 1,
-1.229477, -0.6752407, -1.786899, 1, 0.5411765, 0, 1,
-1.223301, 1.326005, -2.306369, 1, 0.5450981, 0, 1,
-1.221772, 0.5004631, -2.02915, 1, 0.5529412, 0, 1,
-1.221119, 1.407375, -0.03734662, 1, 0.5568628, 0, 1,
-1.217157, 0.6548851, -0.8655025, 1, 0.5647059, 0, 1,
-1.212448, 0.2156229, -2.422828, 1, 0.5686275, 0, 1,
-1.211965, -0.1072015, 0.350004, 1, 0.5764706, 0, 1,
-1.21176, 0.8443538, -2.466624, 1, 0.5803922, 0, 1,
-1.206939, 0.9194102, -1.81804, 1, 0.5882353, 0, 1,
-1.203765, 1.078755, 0.006423666, 1, 0.5921569, 0, 1,
-1.202517, 0.1674874, -1.524616, 1, 0.6, 0, 1,
-1.201275, -0.6897256, -1.53849, 1, 0.6078432, 0, 1,
-1.198576, 1.180791, -0.2530665, 1, 0.6117647, 0, 1,
-1.197784, 1.206947, -1.793518, 1, 0.6196079, 0, 1,
-1.196242, -0.9516846, -1.966667, 1, 0.6235294, 0, 1,
-1.194366, -0.1799441, -0.8196437, 1, 0.6313726, 0, 1,
-1.190778, -0.811205, -2.795525, 1, 0.6352941, 0, 1,
-1.184125, 0.1393895, -0.1075045, 1, 0.6431373, 0, 1,
-1.183682, 0.7365769, -0.4235931, 1, 0.6470588, 0, 1,
-1.179022, 1.763531, 0.8489551, 1, 0.654902, 0, 1,
-1.16933, -1.548923, -0.9901932, 1, 0.6588235, 0, 1,
-1.15833, 0.1967681, -2.066326, 1, 0.6666667, 0, 1,
-1.149162, -1.598105, -2.397994, 1, 0.6705883, 0, 1,
-1.14693, 1.593034, 0.5447688, 1, 0.6784314, 0, 1,
-1.145483, 0.06274792, -1.121613, 1, 0.682353, 0, 1,
-1.144356, -0.02840974, -0.7717384, 1, 0.6901961, 0, 1,
-1.141037, -0.3945571, -2.067921, 1, 0.6941177, 0, 1,
-1.137261, -1.938515, -2.542788, 1, 0.7019608, 0, 1,
-1.132805, -0.2467398, -3.026972, 1, 0.7098039, 0, 1,
-1.127002, -0.6935617, -1.718091, 1, 0.7137255, 0, 1,
-1.124959, 1.319054, 0.07534867, 1, 0.7215686, 0, 1,
-1.115304, 0.510201, -1.207247, 1, 0.7254902, 0, 1,
-1.115075, -0.2078924, -2.77477, 1, 0.7333333, 0, 1,
-1.113253, -1.680484, -3.036538, 1, 0.7372549, 0, 1,
-1.108273, -0.2723679, -2.175732, 1, 0.7450981, 0, 1,
-1.105354, 0.2740984, -1.210357, 1, 0.7490196, 0, 1,
-1.096866, -0.7918064, -2.368681, 1, 0.7568628, 0, 1,
-1.095231, -0.8912643, -0.6858585, 1, 0.7607843, 0, 1,
-1.092273, 0.4558609, 0.545484, 1, 0.7686275, 0, 1,
-1.086771, -0.7687957, -2.607385, 1, 0.772549, 0, 1,
-1.080296, -0.07516461, -1.71694, 1, 0.7803922, 0, 1,
-1.068227, 0.5541281, -2.165107, 1, 0.7843137, 0, 1,
-1.068095, -0.5213481, -1.934127, 1, 0.7921569, 0, 1,
-1.06232, 0.1389152, -1.406337, 1, 0.7960784, 0, 1,
-1.056486, 0.7676548, -1.879173, 1, 0.8039216, 0, 1,
-1.05385, -0.467611, -3.141723, 1, 0.8117647, 0, 1,
-1.051342, 0.9811813, -1.824658, 1, 0.8156863, 0, 1,
-1.046305, -0.07155342, -1.407328, 1, 0.8235294, 0, 1,
-1.04266, 0.3562158, -2.16629, 1, 0.827451, 0, 1,
-1.042657, 2.00098, -1.042124, 1, 0.8352941, 0, 1,
-1.036116, 0.2030505, -0.565116, 1, 0.8392157, 0, 1,
-1.031276, 2.493057, -0.3292982, 1, 0.8470588, 0, 1,
-1.028913, 0.3371487, -1.193892, 1, 0.8509804, 0, 1,
-1.028249, -0.04127397, 0.4979816, 1, 0.8588235, 0, 1,
-1.024973, 0.2361928, -1.286602, 1, 0.8627451, 0, 1,
-1.023552, 1.33087, -2.293167, 1, 0.8705882, 0, 1,
-1.021593, -0.3715141, -3.245064, 1, 0.8745098, 0, 1,
-1.020865, 3.262967, -0.4570454, 1, 0.8823529, 0, 1,
-1.018786, -0.9139215, -2.170074, 1, 0.8862745, 0, 1,
-1.015202, 1.885529, -0.7561262, 1, 0.8941177, 0, 1,
-1.010258, 0.03103229, 0.5008261, 1, 0.8980392, 0, 1,
-1.008811, -1.133553, -3.622922, 1, 0.9058824, 0, 1,
-1.003464, -1.047526, -2.663574, 1, 0.9137255, 0, 1,
-0.9998729, 0.8332761, -0.5138612, 1, 0.9176471, 0, 1,
-0.9915467, 0.6013898, -0.6267668, 1, 0.9254902, 0, 1,
-0.9636322, 2.586216, 0.1861232, 1, 0.9294118, 0, 1,
-0.959442, -1.261687, -1.965026, 1, 0.9372549, 0, 1,
-0.9544539, -0.02986342, -0.7699068, 1, 0.9411765, 0, 1,
-0.9526502, 0.345502, -1.545454, 1, 0.9490196, 0, 1,
-0.9458437, -1.299316, -3.177465, 1, 0.9529412, 0, 1,
-0.9436365, 1.398062, -0.2309509, 1, 0.9607843, 0, 1,
-0.9435593, -0.9331391, -1.386741, 1, 0.9647059, 0, 1,
-0.9395809, 0.1725682, -1.938596, 1, 0.972549, 0, 1,
-0.9381155, -0.03901966, -0.7864596, 1, 0.9764706, 0, 1,
-0.9313289, 0.2658319, -2.545207, 1, 0.9843137, 0, 1,
-0.9208244, 0.7199369, -0.01816145, 1, 0.9882353, 0, 1,
-0.9157685, -1.668794, -1.672266, 1, 0.9960784, 0, 1,
-0.9108387, 0.04056395, -2.972201, 0.9960784, 1, 0, 1,
-0.9106554, 0.2098162, -0.80683, 0.9921569, 1, 0, 1,
-0.9099647, 0.2429289, -1.49085, 0.9843137, 1, 0, 1,
-0.9063206, -0.3733649, -1.076449, 0.9803922, 1, 0, 1,
-0.9048361, -0.008475405, -1.648235, 0.972549, 1, 0, 1,
-0.8944807, -0.5517162, -1.30074, 0.9686275, 1, 0, 1,
-0.8853133, -1.444749, -5.393267, 0.9607843, 1, 0, 1,
-0.8838616, -0.2421513, -2.342705, 0.9568627, 1, 0, 1,
-0.8820035, 0.3580245, -1.761915, 0.9490196, 1, 0, 1,
-0.8791025, -0.2889416, -0.1556073, 0.945098, 1, 0, 1,
-0.876554, -0.65535, -3.122492, 0.9372549, 1, 0, 1,
-0.8710585, 0.6867219, -1.486388, 0.9333333, 1, 0, 1,
-0.8704454, -0.650668, -2.321866, 0.9254902, 1, 0, 1,
-0.8673944, 0.9561601, -0.3930071, 0.9215686, 1, 0, 1,
-0.8646237, -0.4497193, -1.579929, 0.9137255, 1, 0, 1,
-0.8621271, 2.118609, -0.2980092, 0.9098039, 1, 0, 1,
-0.8547882, 0.4030216, -1.543896, 0.9019608, 1, 0, 1,
-0.8473328, -0.4717855, -2.47618, 0.8941177, 1, 0, 1,
-0.8434262, -0.8035089, -1.332051, 0.8901961, 1, 0, 1,
-0.8431883, 0.04023653, -2.245872, 0.8823529, 1, 0, 1,
-0.8400853, 2.121168, -0.2457456, 0.8784314, 1, 0, 1,
-0.8337373, -1.139449, -2.632135, 0.8705882, 1, 0, 1,
-0.8337018, -0.6329502, -1.174878, 0.8666667, 1, 0, 1,
-0.8145716, 1.264629, -0.3348273, 0.8588235, 1, 0, 1,
-0.8108227, 0.749121, 1.043495, 0.854902, 1, 0, 1,
-0.8023891, -0.2292871, -1.978298, 0.8470588, 1, 0, 1,
-0.7995831, -0.7680798, -1.508183, 0.8431373, 1, 0, 1,
-0.7929325, 0.5218655, -3.730199, 0.8352941, 1, 0, 1,
-0.7875391, 0.2663894, -1.501087, 0.8313726, 1, 0, 1,
-0.7839574, 0.3113691, -1.497592, 0.8235294, 1, 0, 1,
-0.7796045, 1.395194, -0.4515826, 0.8196079, 1, 0, 1,
-0.7752876, 0.7691367, -0.7992958, 0.8117647, 1, 0, 1,
-0.7676671, 1.495168, -0.5177275, 0.8078431, 1, 0, 1,
-0.766522, 0.7726844, 0.2465927, 0.8, 1, 0, 1,
-0.764055, 1.698026, -0.9208743, 0.7921569, 1, 0, 1,
-0.7639676, -1.082541, -3.920492, 0.7882353, 1, 0, 1,
-0.7625396, 0.6423914, -1.257558, 0.7803922, 1, 0, 1,
-0.7566367, 1.029797, 0.7294949, 0.7764706, 1, 0, 1,
-0.7512076, -1.180491, -1.553729, 0.7686275, 1, 0, 1,
-0.7440511, -0.6286068, -3.30782, 0.7647059, 1, 0, 1,
-0.7399452, -1.649369, -2.787323, 0.7568628, 1, 0, 1,
-0.7337813, -0.5302888, -3.023742, 0.7529412, 1, 0, 1,
-0.7314982, -0.7150123, -2.497066, 0.7450981, 1, 0, 1,
-0.7212461, 0.5970728, -0.08672214, 0.7411765, 1, 0, 1,
-0.7202215, 0.3337219, -0.5034418, 0.7333333, 1, 0, 1,
-0.7202162, -0.7068796, -2.087289, 0.7294118, 1, 0, 1,
-0.7181296, -0.0840189, -2.092483, 0.7215686, 1, 0, 1,
-0.7127484, -0.2228779, -3.028121, 0.7176471, 1, 0, 1,
-0.711995, -0.6231744, -2.745528, 0.7098039, 1, 0, 1,
-0.7096962, 0.5021217, 0.3461699, 0.7058824, 1, 0, 1,
-0.7093734, -1.458048, -1.351159, 0.6980392, 1, 0, 1,
-0.70628, 0.2740176, -2.20396, 0.6901961, 1, 0, 1,
-0.7050416, 0.5453693, -2.08495, 0.6862745, 1, 0, 1,
-0.7028653, -0.4771821, -2.996882, 0.6784314, 1, 0, 1,
-0.6992842, 2.259385, 0.01983469, 0.6745098, 1, 0, 1,
-0.6967596, -0.09770879, -1.343905, 0.6666667, 1, 0, 1,
-0.6955672, -1.509592, -4.463649, 0.6627451, 1, 0, 1,
-0.6951598, 1.592136, -0.7485569, 0.654902, 1, 0, 1,
-0.6951146, -0.1917942, -3.077994, 0.6509804, 1, 0, 1,
-0.6937701, -1.196019, -2.014919, 0.6431373, 1, 0, 1,
-0.6893654, -1.86836, -2.352866, 0.6392157, 1, 0, 1,
-0.6834942, -0.8767578, -2.671552, 0.6313726, 1, 0, 1,
-0.6769599, -0.4475871, -1.877935, 0.627451, 1, 0, 1,
-0.6693352, 0.3946458, 0.06359466, 0.6196079, 1, 0, 1,
-0.668381, 1.131981, -1.434107, 0.6156863, 1, 0, 1,
-0.6643069, 0.1768659, -2.433554, 0.6078432, 1, 0, 1,
-0.6595057, 0.1662394, -2.147484, 0.6039216, 1, 0, 1,
-0.6478687, -0.2404724, -3.178387, 0.5960785, 1, 0, 1,
-0.6420059, 0.5058387, -1.064387, 0.5882353, 1, 0, 1,
-0.6347103, -0.09897566, -2.27328, 0.5843138, 1, 0, 1,
-0.6328545, 0.0235323, -2.977923, 0.5764706, 1, 0, 1,
-0.6318569, -0.1566942, -2.624095, 0.572549, 1, 0, 1,
-0.6274449, 0.007658711, -1.627403, 0.5647059, 1, 0, 1,
-0.6245313, 0.8338282, 0.7212651, 0.5607843, 1, 0, 1,
-0.6226811, 2.395108, 0.3912794, 0.5529412, 1, 0, 1,
-0.618601, -1.634146, -3.024904, 0.5490196, 1, 0, 1,
-0.6159649, -0.1972001, -3.099118, 0.5411765, 1, 0, 1,
-0.609653, -0.0537568, -1.315848, 0.5372549, 1, 0, 1,
-0.6062392, 1.564296, -0.3805401, 0.5294118, 1, 0, 1,
-0.6047667, 1.507124, -0.876619, 0.5254902, 1, 0, 1,
-0.6042547, -0.7545871, -2.619376, 0.5176471, 1, 0, 1,
-0.6018285, 0.3629241, -1.789917, 0.5137255, 1, 0, 1,
-0.6013888, 0.6261056, -1.214209, 0.5058824, 1, 0, 1,
-0.5974888, -1.098345, -2.9187, 0.5019608, 1, 0, 1,
-0.5957292, 1.288911, -0.4667373, 0.4941176, 1, 0, 1,
-0.5952168, -0.501817, -2.924573, 0.4862745, 1, 0, 1,
-0.5903611, -0.6222573, -1.826489, 0.4823529, 1, 0, 1,
-0.5889996, -0.6130795, -4.175849, 0.4745098, 1, 0, 1,
-0.5867698, -0.1544464, -2.401927, 0.4705882, 1, 0, 1,
-0.5845791, 0.5082814, 0.4306118, 0.4627451, 1, 0, 1,
-0.5796121, 0.249948, -0.1130863, 0.4588235, 1, 0, 1,
-0.5792346, -0.5294946, -3.696577, 0.4509804, 1, 0, 1,
-0.5787138, 1.198151, -0.4238836, 0.4470588, 1, 0, 1,
-0.5783982, 0.8752439, -0.3860638, 0.4392157, 1, 0, 1,
-0.5749344, 0.7589999, 0.1835254, 0.4352941, 1, 0, 1,
-0.5717798, 1.44696, -2.007289, 0.427451, 1, 0, 1,
-0.5710982, -1.036881, -2.838681, 0.4235294, 1, 0, 1,
-0.5705647, -0.8226929, -3.079037, 0.4156863, 1, 0, 1,
-0.5671124, 0.4145111, -0.4243357, 0.4117647, 1, 0, 1,
-0.5616932, 0.5175793, -0.7763961, 0.4039216, 1, 0, 1,
-0.5609683, -1.054989, -5.53611, 0.3960784, 1, 0, 1,
-0.5541657, 0.1245417, -2.622461, 0.3921569, 1, 0, 1,
-0.5529583, -0.7991495, -2.162139, 0.3843137, 1, 0, 1,
-0.5518359, 0.07768177, -2.233273, 0.3803922, 1, 0, 1,
-0.5511427, -1.034897, -1.130548, 0.372549, 1, 0, 1,
-0.5499591, 0.5706944, -0.402641, 0.3686275, 1, 0, 1,
-0.5481808, 0.02805507, 0.1173942, 0.3607843, 1, 0, 1,
-0.5423039, 0.2687384, -0.4164112, 0.3568628, 1, 0, 1,
-0.5357571, -0.4136747, -1.759199, 0.3490196, 1, 0, 1,
-0.5335075, -0.6933345, -0.7856762, 0.345098, 1, 0, 1,
-0.5328696, -0.452649, -2.953385, 0.3372549, 1, 0, 1,
-0.532551, -0.04911184, -2.881054, 0.3333333, 1, 0, 1,
-0.5260267, 0.1651921, -2.244116, 0.3254902, 1, 0, 1,
-0.5220855, 1.124749, -0.8137109, 0.3215686, 1, 0, 1,
-0.5209359, -0.293756, -3.619486, 0.3137255, 1, 0, 1,
-0.519078, 0.06398855, -2.814415, 0.3098039, 1, 0, 1,
-0.5187338, -0.8806931, -2.363204, 0.3019608, 1, 0, 1,
-0.5184644, 1.301615, -0.3914548, 0.2941177, 1, 0, 1,
-0.5183958, -0.1735152, -2.848685, 0.2901961, 1, 0, 1,
-0.5121279, 0.1257876, -0.5502209, 0.282353, 1, 0, 1,
-0.507816, 1.756005, 0.8657584, 0.2784314, 1, 0, 1,
-0.507153, -0.0392785, -0.9512544, 0.2705882, 1, 0, 1,
-0.5071131, -0.7281025, -2.641191, 0.2666667, 1, 0, 1,
-0.5054846, 0.5084513, -0.5284405, 0.2588235, 1, 0, 1,
-0.5042727, -2.051622, -0.5321053, 0.254902, 1, 0, 1,
-0.5036536, -0.003931823, -2.504952, 0.2470588, 1, 0, 1,
-0.5034069, 0.649634, -2.321378, 0.2431373, 1, 0, 1,
-0.4992531, 0.4011997, -1.556513, 0.2352941, 1, 0, 1,
-0.49041, -0.7061466, -2.953477, 0.2313726, 1, 0, 1,
-0.4843614, 2.02565, -0.06035051, 0.2235294, 1, 0, 1,
-0.4819656, 0.695673, -0.9991078, 0.2196078, 1, 0, 1,
-0.4802299, -0.05417108, -1.592768, 0.2117647, 1, 0, 1,
-0.4792261, -0.6126035, -3.343212, 0.2078431, 1, 0, 1,
-0.4754729, -0.8840446, 0.707109, 0.2, 1, 0, 1,
-0.4737941, -2.186937, -3.199534, 0.1921569, 1, 0, 1,
-0.4670269, 0.6135859, 0.6599936, 0.1882353, 1, 0, 1,
-0.4662953, 1.289781, -0.5258972, 0.1803922, 1, 0, 1,
-0.4592374, 0.4357338, -1.720451, 0.1764706, 1, 0, 1,
-0.4469842, 0.6731744, -2.100813, 0.1686275, 1, 0, 1,
-0.4367602, -0.8913811, -2.216089, 0.1647059, 1, 0, 1,
-0.428096, 0.4386276, 0.4867938, 0.1568628, 1, 0, 1,
-0.4280272, 1.62551, -1.364038, 0.1529412, 1, 0, 1,
-0.4220375, 0.5444372, -1.097489, 0.145098, 1, 0, 1,
-0.4219027, 0.3045898, -0.6932616, 0.1411765, 1, 0, 1,
-0.4156698, -0.3809098, -2.524245, 0.1333333, 1, 0, 1,
-0.4126525, 1.267309, -1.46034, 0.1294118, 1, 0, 1,
-0.4122301, -0.8612277, -2.382726, 0.1215686, 1, 0, 1,
-0.4111298, -1.229231, -1.056688, 0.1176471, 1, 0, 1,
-0.4041346, -0.5220059, -1.519416, 0.1098039, 1, 0, 1,
-0.4031508, -0.5688619, -0.8537609, 0.1058824, 1, 0, 1,
-0.4011353, -0.2821031, -0.6019381, 0.09803922, 1, 0, 1,
-0.3968872, -0.2733143, -1.936831, 0.09019608, 1, 0, 1,
-0.3967278, -0.7825929, -1.713821, 0.08627451, 1, 0, 1,
-0.3957978, 0.831874, -0.3479318, 0.07843138, 1, 0, 1,
-0.3931172, -0.2487141, -2.70464, 0.07450981, 1, 0, 1,
-0.3920036, 1.500267, 0.3878653, 0.06666667, 1, 0, 1,
-0.389462, 1.545683, -0.07112706, 0.0627451, 1, 0, 1,
-0.3879892, -0.6845034, -1.783536, 0.05490196, 1, 0, 1,
-0.3834102, -0.8452098, -2.035715, 0.05098039, 1, 0, 1,
-0.3787027, -0.2274985, -1.631416, 0.04313726, 1, 0, 1,
-0.3744925, 1.742517, 0.199206, 0.03921569, 1, 0, 1,
-0.3695897, -0.04550823, -1.817854, 0.03137255, 1, 0, 1,
-0.3679346, -0.3188724, -2.051073, 0.02745098, 1, 0, 1,
-0.3657832, 1.544953, -0.4307746, 0.01960784, 1, 0, 1,
-0.3653047, -0.3664561, -3.238034, 0.01568628, 1, 0, 1,
-0.3650053, 0.5255178, -0.3938684, 0.007843138, 1, 0, 1,
-0.36251, 0.8580473, 0.5376941, 0.003921569, 1, 0, 1,
-0.3605514, 0.8161845, 0.9593686, 0, 1, 0.003921569, 1,
-0.3540812, 0.5545897, -1.383052, 0, 1, 0.01176471, 1,
-0.3483889, -1.348405, -3.634939, 0, 1, 0.01568628, 1,
-0.3358064, 0.5528765, -1.269576, 0, 1, 0.02352941, 1,
-0.3262636, -1.208531, -3.134127, 0, 1, 0.02745098, 1,
-0.3257912, -0.4170307, -1.530642, 0, 1, 0.03529412, 1,
-0.3222161, -0.0557646, -1.524132, 0, 1, 0.03921569, 1,
-0.3221195, 1.775267, 0.5788654, 0, 1, 0.04705882, 1,
-0.3216958, 0.8064117, -0.4526221, 0, 1, 0.05098039, 1,
-0.3206696, -0.5088502, -3.076322, 0, 1, 0.05882353, 1,
-0.3173009, -0.07300857, -2.618662, 0, 1, 0.0627451, 1,
-0.3154282, 0.1179622, -3.032705, 0, 1, 0.07058824, 1,
-0.312519, -0.8569942, -1.895712, 0, 1, 0.07450981, 1,
-0.306204, 0.1240091, -0.1788094, 0, 1, 0.08235294, 1,
-0.3060348, -0.9090002, -1.843884, 0, 1, 0.08627451, 1,
-0.3043469, -1.413146, -2.698354, 0, 1, 0.09411765, 1,
-0.300605, -0.8558838, -2.490013, 0, 1, 0.1019608, 1,
-0.3005075, -0.1811678, -3.116422, 0, 1, 0.1058824, 1,
-0.2962954, 0.07213328, 0.4440005, 0, 1, 0.1137255, 1,
-0.2916884, 1.042016, 1.219202, 0, 1, 0.1176471, 1,
-0.2901989, 0.6002983, 0.2369695, 0, 1, 0.1254902, 1,
-0.2822904, -0.7477834, -3.691662, 0, 1, 0.1294118, 1,
-0.2805775, -0.4865267, -2.262502, 0, 1, 0.1372549, 1,
-0.2777984, -0.6080995, -1.97629, 0, 1, 0.1411765, 1,
-0.2713566, 0.01198192, -0.9489182, 0, 1, 0.1490196, 1,
-0.2710399, -1.094754, -4.733497, 0, 1, 0.1529412, 1,
-0.2624132, -0.8860275, -2.396754, 0, 1, 0.1607843, 1,
-0.2620517, 0.3883491, -1.216935, 0, 1, 0.1647059, 1,
-0.2593951, -1.500155, -4.998993, 0, 1, 0.172549, 1,
-0.2576768, -0.1697985, -0.5719998, 0, 1, 0.1764706, 1,
-0.2516529, -1.085662, -3.673858, 0, 1, 0.1843137, 1,
-0.2488614, -1.420401, -4.175665, 0, 1, 0.1882353, 1,
-0.2415645, -0.4562442, -1.396707, 0, 1, 0.1960784, 1,
-0.2366731, 1.129762, 1.067141, 0, 1, 0.2039216, 1,
-0.2331348, -0.5273764, -3.153646, 0, 1, 0.2078431, 1,
-0.229468, -1.244619, -3.763489, 0, 1, 0.2156863, 1,
-0.228717, 0.5444295, -0.3064258, 0, 1, 0.2196078, 1,
-0.2266688, -3.851366, -3.589121, 0, 1, 0.227451, 1,
-0.2261073, -1.268063, -3.610934, 0, 1, 0.2313726, 1,
-0.2178152, -0.2719967, -4.036617, 0, 1, 0.2392157, 1,
-0.2169134, -2.157786, -3.543927, 0, 1, 0.2431373, 1,
-0.2148113, -1.664948, -3.443624, 0, 1, 0.2509804, 1,
-0.2134584, 0.6179256, -1.2782, 0, 1, 0.254902, 1,
-0.212571, -0.656127, -3.162347, 0, 1, 0.2627451, 1,
-0.2121347, -0.4796781, -2.619339, 0, 1, 0.2666667, 1,
-0.2077614, 0.5241441, 0.2560551, 0, 1, 0.2745098, 1,
-0.202807, -1.32561, -4.60706, 0, 1, 0.2784314, 1,
-0.2021184, 0.09549706, -1.993943, 0, 1, 0.2862745, 1,
-0.2012455, 0.8910888, -0.9219782, 0, 1, 0.2901961, 1,
-0.1968215, 0.1838006, -0.1822118, 0, 1, 0.2980392, 1,
-0.1956019, 1.398008, -0.7147084, 0, 1, 0.3058824, 1,
-0.1948837, -0.1344166, -2.226162, 0, 1, 0.3098039, 1,
-0.1912183, 0.2428785, 0.5778634, 0, 1, 0.3176471, 1,
-0.1844453, -0.6876039, -2.293529, 0, 1, 0.3215686, 1,
-0.1789011, 1.213743, -0.3328772, 0, 1, 0.3294118, 1,
-0.1780657, 0.1928988, -0.7769293, 0, 1, 0.3333333, 1,
-0.1731962, -0.2090927, -1.257693, 0, 1, 0.3411765, 1,
-0.1719104, 0.8129476, -0.3518749, 0, 1, 0.345098, 1,
-0.1666568, -0.7400213, -2.231995, 0, 1, 0.3529412, 1,
-0.1655549, -0.878737, -3.877103, 0, 1, 0.3568628, 1,
-0.1648243, -0.3113115, -2.690067, 0, 1, 0.3647059, 1,
-0.1624085, 0.05954954, -2.280472, 0, 1, 0.3686275, 1,
-0.1600014, -0.001577249, -3.255762, 0, 1, 0.3764706, 1,
-0.1597254, 0.5688344, -2.338142, 0, 1, 0.3803922, 1,
-0.15967, 1.775494, 0.3877957, 0, 1, 0.3882353, 1,
-0.1546786, 1.839955, 1.116747, 0, 1, 0.3921569, 1,
-0.1539116, -0.5545655, -4.488986, 0, 1, 0.4, 1,
-0.1522387, -0.08638695, -1.512616, 0, 1, 0.4078431, 1,
-0.1499661, 0.5920359, 0.428503, 0, 1, 0.4117647, 1,
-0.1474802, 3.29028, -0.02137266, 0, 1, 0.4196078, 1,
-0.1420073, 0.06530984, -1.233798, 0, 1, 0.4235294, 1,
-0.1354373, 0.1154103, -0.1213347, 0, 1, 0.4313726, 1,
-0.1347591, 0.3989368, -0.6203899, 0, 1, 0.4352941, 1,
-0.1340919, -0.1751087, -0.3264476, 0, 1, 0.4431373, 1,
-0.1304342, -0.09973771, -2.363615, 0, 1, 0.4470588, 1,
-0.127121, -0.536191, -2.781465, 0, 1, 0.454902, 1,
-0.1258281, 0.07378059, -0.9540238, 0, 1, 0.4588235, 1,
-0.1213509, -0.2096082, -1.012266, 0, 1, 0.4666667, 1,
-0.1211577, 0.3648905, -0.2918454, 0, 1, 0.4705882, 1,
-0.1208118, 0.4686084, 1.381751, 0, 1, 0.4784314, 1,
-0.1186508, -1.455329, -4.870174, 0, 1, 0.4823529, 1,
-0.1147847, 0.7013304, -2.230779, 0, 1, 0.4901961, 1,
-0.1087015, 0.2560591, -0.3755534, 0, 1, 0.4941176, 1,
-0.1066286, -0.5784097, -3.740401, 0, 1, 0.5019608, 1,
-0.1062044, 0.6102331, -1.958511, 0, 1, 0.509804, 1,
-0.1001683, -0.7734979, -3.611244, 0, 1, 0.5137255, 1,
-0.09840047, -0.1174887, -3.447308, 0, 1, 0.5215687, 1,
-0.09784218, 0.2521547, -1.861997, 0, 1, 0.5254902, 1,
-0.09706186, -2.209887, -1.635782, 0, 1, 0.5333334, 1,
-0.09614491, 0.09058187, -1.399092, 0, 1, 0.5372549, 1,
-0.09191973, -0.7928867, -3.304939, 0, 1, 0.5450981, 1,
-0.09007224, 0.6207802, -0.1674257, 0, 1, 0.5490196, 1,
-0.08619178, 0.3542294, 0.2516596, 0, 1, 0.5568628, 1,
-0.08464053, 0.1830499, -1.339394, 0, 1, 0.5607843, 1,
-0.075124, 1.052266, -1.249407, 0, 1, 0.5686275, 1,
-0.07484913, 1.539062, -0.3102892, 0, 1, 0.572549, 1,
-0.06940762, -0.3478653, -3.190416, 0, 1, 0.5803922, 1,
-0.06928225, 1.086716, -0.615839, 0, 1, 0.5843138, 1,
-0.06675414, -0.4198565, -4.303809, 0, 1, 0.5921569, 1,
-0.06634541, -0.3821679, -2.840319, 0, 1, 0.5960785, 1,
-0.06447131, -0.1793655, -2.13231, 0, 1, 0.6039216, 1,
-0.0593657, -0.06592038, -2.009475, 0, 1, 0.6117647, 1,
-0.05753163, -0.5677564, -3.188371, 0, 1, 0.6156863, 1,
-0.05689541, -1.194793, -1.849548, 0, 1, 0.6235294, 1,
-0.05640463, -0.07315876, -5.284764, 0, 1, 0.627451, 1,
-0.0527334, -0.9044518, -2.288224, 0, 1, 0.6352941, 1,
-0.05162381, 1.189297, 0.4582, 0, 1, 0.6392157, 1,
-0.04947693, -0.3845277, -1.937913, 0, 1, 0.6470588, 1,
-0.04362057, -0.4672284, -4.352382, 0, 1, 0.6509804, 1,
-0.04339619, 0.4177444, -0.6439924, 0, 1, 0.6588235, 1,
-0.03959854, -0.7218936, -1.638224, 0, 1, 0.6627451, 1,
-0.03805054, -1.084881, -4.081183, 0, 1, 0.6705883, 1,
-0.03777968, 1.6021, -0.4701416, 0, 1, 0.6745098, 1,
-0.03035973, 0.6874689, 2.17855, 0, 1, 0.682353, 1,
-0.02711742, 0.7877284, -0.4602772, 0, 1, 0.6862745, 1,
-0.02385331, -0.3356595, -2.806847, 0, 1, 0.6941177, 1,
-0.02352788, -0.05484992, -3.637431, 0, 1, 0.7019608, 1,
-0.02040146, 1.420953, -0.822433, 0, 1, 0.7058824, 1,
-0.01441936, -0.3518815, -3.230626, 0, 1, 0.7137255, 1,
-0.01308514, 0.1315878, -0.401379, 0, 1, 0.7176471, 1,
-0.0121964, 1.646255, 0.9195544, 0, 1, 0.7254902, 1,
-0.01037982, -0.1601902, -3.283136, 0, 1, 0.7294118, 1,
-0.008911036, -0.8142213, -2.927714, 0, 1, 0.7372549, 1,
-0.008001493, -0.3142973, -3.793924, 0, 1, 0.7411765, 1,
-0.005625592, -0.1234403, -3.265197, 0, 1, 0.7490196, 1,
-0.005229645, 0.8108371, 1.148499, 0, 1, 0.7529412, 1,
-0.004037105, 0.2584454, 0.01184698, 0, 1, 0.7607843, 1,
-0.00257754, 0.7512378, -1.368628, 0, 1, 0.7647059, 1,
-0.0009925629, -0.2856126, -2.90414, 0, 1, 0.772549, 1,
0.0001755282, 0.8103563, -0.5671352, 0, 1, 0.7764706, 1,
0.0005363051, -1.533582, 5.396339, 0, 1, 0.7843137, 1,
0.002935487, 1.157015, -0.3354472, 0, 1, 0.7882353, 1,
0.007097251, 0.8097368, -0.6004691, 0, 1, 0.7960784, 1,
0.008605638, 1.888453, -0.5597723, 0, 1, 0.8039216, 1,
0.0114256, 1.472249, -1.771017, 0, 1, 0.8078431, 1,
0.0150419, -0.9750199, 3.975997, 0, 1, 0.8156863, 1,
0.01725982, 1.653584, -0.5872083, 0, 1, 0.8196079, 1,
0.02061646, -1.787127, 4.47602, 0, 1, 0.827451, 1,
0.02317003, 0.03920406, -0.6401834, 0, 1, 0.8313726, 1,
0.02329194, -1.513665, 2.789297, 0, 1, 0.8392157, 1,
0.02389309, 0.9495515, 0.07940034, 0, 1, 0.8431373, 1,
0.02886713, 1.070855, -1.609692, 0, 1, 0.8509804, 1,
0.03096465, -1.03823, 4.747501, 0, 1, 0.854902, 1,
0.03105478, 0.2396466, 1.348395, 0, 1, 0.8627451, 1,
0.03464359, -1.558228, 4.158655, 0, 1, 0.8666667, 1,
0.04025312, 0.07514008, 2.913381, 0, 1, 0.8745098, 1,
0.04051719, -1.031804, 5.548544, 0, 1, 0.8784314, 1,
0.04266369, 2.022791, 0.0132659, 0, 1, 0.8862745, 1,
0.04326624, -1.557631, 4.143407, 0, 1, 0.8901961, 1,
0.04914044, -0.02432962, 2.382647, 0, 1, 0.8980392, 1,
0.04964532, 0.3663261, -1.899688, 0, 1, 0.9058824, 1,
0.04990104, 0.7707889, -0.1467208, 0, 1, 0.9098039, 1,
0.05201959, -0.845952, 3.8026, 0, 1, 0.9176471, 1,
0.05246745, 0.04134444, 0.02131101, 0, 1, 0.9215686, 1,
0.05431471, -0.9489584, 2.010528, 0, 1, 0.9294118, 1,
0.05619248, -0.3848142, 2.531315, 0, 1, 0.9333333, 1,
0.0597308, 1.836137, 0.951263, 0, 1, 0.9411765, 1,
0.06105996, -1.208999, 4.009488, 0, 1, 0.945098, 1,
0.06582981, -0.1948455, 1.388967, 0, 1, 0.9529412, 1,
0.0739486, 1.349786, -1.239132, 0, 1, 0.9568627, 1,
0.07461188, -0.06791973, 1.534252, 0, 1, 0.9647059, 1,
0.07721382, -0.8283982, 3.889999, 0, 1, 0.9686275, 1,
0.07910713, 0.2965789, 0.3293865, 0, 1, 0.9764706, 1,
0.07997431, -0.2833621, 2.672617, 0, 1, 0.9803922, 1,
0.08049254, -0.02257963, 2.053866, 0, 1, 0.9882353, 1,
0.08325971, 0.2785634, 1.790236, 0, 1, 0.9921569, 1,
0.09430484, -0.6480014, 3.315063, 0, 1, 1, 1,
0.09616408, 0.2554847, -0.9236016, 0, 0.9921569, 1, 1,
0.0994627, 0.3720855, 0.7644402, 0, 0.9882353, 1, 1,
0.1023128, 1.025941, 1.058859, 0, 0.9803922, 1, 1,
0.1031807, -1.532353, 4.206785, 0, 0.9764706, 1, 1,
0.116512, 0.2887874, 1.475184, 0, 0.9686275, 1, 1,
0.1205543, 0.2053242, -0.6642992, 0, 0.9647059, 1, 1,
0.1250577, -0.9491073, 2.356693, 0, 0.9568627, 1, 1,
0.1262652, -1.245811, 3.548862, 0, 0.9529412, 1, 1,
0.1269934, 1.233281, -0.8157829, 0, 0.945098, 1, 1,
0.1273721, 0.9055592, 0.4603699, 0, 0.9411765, 1, 1,
0.1481809, 0.2506438, 1.520853, 0, 0.9333333, 1, 1,
0.1491719, 1.751425, 1.952525, 0, 0.9294118, 1, 1,
0.1512907, 0.5870799, 0.1078896, 0, 0.9215686, 1, 1,
0.1588174, -0.7281053, 2.093851, 0, 0.9176471, 1, 1,
0.1619309, -0.0133637, 2.127127, 0, 0.9098039, 1, 1,
0.1651705, -0.9701049, 2.276077, 0, 0.9058824, 1, 1,
0.1654225, -1.01256, 4.777119, 0, 0.8980392, 1, 1,
0.1672077, 0.3882669, 0.3539722, 0, 0.8901961, 1, 1,
0.1679362, -0.6088074, 1.951776, 0, 0.8862745, 1, 1,
0.1755367, -0.1784433, 2.036649, 0, 0.8784314, 1, 1,
0.1758509, -0.09673835, 3.261544, 0, 0.8745098, 1, 1,
0.1764795, 0.2243616, 1.268113, 0, 0.8666667, 1, 1,
0.1774665, -0.402468, 2.472252, 0, 0.8627451, 1, 1,
0.1786104, 0.8670068, 0.4438819, 0, 0.854902, 1, 1,
0.188656, 1.269784, 0.7980506, 0, 0.8509804, 1, 1,
0.1929372, 0.117068, 0.5990176, 0, 0.8431373, 1, 1,
0.1940013, 2.033375, -0.9445249, 0, 0.8392157, 1, 1,
0.1966248, 0.8450183, 0.6084629, 0, 0.8313726, 1, 1,
0.2025922, 0.2748968, -0.1028825, 0, 0.827451, 1, 1,
0.2027746, 0.8535289, 1.380348, 0, 0.8196079, 1, 1,
0.2037645, 1.813258, -0.2901117, 0, 0.8156863, 1, 1,
0.2082705, 0.7225896, 0.4508067, 0, 0.8078431, 1, 1,
0.2083271, 1.382903, -0.4186759, 0, 0.8039216, 1, 1,
0.2099113, -1.543078, 4.777802, 0, 0.7960784, 1, 1,
0.214532, -0.5116683, 2.65658, 0, 0.7882353, 1, 1,
0.2161963, -0.8491066, 2.75702, 0, 0.7843137, 1, 1,
0.216743, 0.8950297, 0.04727463, 0, 0.7764706, 1, 1,
0.2175075, 0.7981132, 0.1817, 0, 0.772549, 1, 1,
0.2199579, -0.2412959, 2.186501, 0, 0.7647059, 1, 1,
0.220602, 0.6354405, 0.1968156, 0, 0.7607843, 1, 1,
0.2218112, -0.3475064, 3.691097, 0, 0.7529412, 1, 1,
0.2224297, -1.980513, 1.217707, 0, 0.7490196, 1, 1,
0.2265096, -1.032641, 2.022658, 0, 0.7411765, 1, 1,
0.2314325, 1.750162, -0.4236554, 0, 0.7372549, 1, 1,
0.2332206, -2.168128, 3.454709, 0, 0.7294118, 1, 1,
0.2338768, 0.2806807, 1.151557, 0, 0.7254902, 1, 1,
0.235917, -0.5585208, 2.213931, 0, 0.7176471, 1, 1,
0.2379512, -0.2076729, 0.8176311, 0, 0.7137255, 1, 1,
0.2390601, -0.920042, 3.795527, 0, 0.7058824, 1, 1,
0.2393122, -1.665847, 3.176994, 0, 0.6980392, 1, 1,
0.2398158, -1.110626, 4.307006, 0, 0.6941177, 1, 1,
0.2416256, -0.8983927, 2.328564, 0, 0.6862745, 1, 1,
0.2437644, 0.1847663, 1.845095, 0, 0.682353, 1, 1,
0.2470779, 0.3736235, 0.8696217, 0, 0.6745098, 1, 1,
0.2486495, 1.29152, -1.247417, 0, 0.6705883, 1, 1,
0.2501435, 0.2226326, 1.035188, 0, 0.6627451, 1, 1,
0.2513392, -1.207696, 1.92573, 0, 0.6588235, 1, 1,
0.2526951, -0.8191383, 1.230557, 0, 0.6509804, 1, 1,
0.2529363, -1.6545, 0.9453564, 0, 0.6470588, 1, 1,
0.2588729, -0.6885043, 2.183684, 0, 0.6392157, 1, 1,
0.2588951, 0.2166455, 0.9867401, 0, 0.6352941, 1, 1,
0.2612442, -1.149894, 3.522394, 0, 0.627451, 1, 1,
0.262074, 0.1957495, 1.928196, 0, 0.6235294, 1, 1,
0.262358, 2.387783, 0.2033886, 0, 0.6156863, 1, 1,
0.2659971, -2.358192, 2.294847, 0, 0.6117647, 1, 1,
0.2665816, -0.2366757, 3.86169, 0, 0.6039216, 1, 1,
0.2692028, -0.1132383, 1.477149, 0, 0.5960785, 1, 1,
0.2770542, 2.181229, 0.2113708, 0, 0.5921569, 1, 1,
0.2803998, -0.588151, 3.234946, 0, 0.5843138, 1, 1,
0.2818779, -0.2958093, 2.363097, 0, 0.5803922, 1, 1,
0.2916858, -0.5741323, 3.212158, 0, 0.572549, 1, 1,
0.2956439, -0.5568917, 2.289719, 0, 0.5686275, 1, 1,
0.2959, 0.01077665, 0.5439655, 0, 0.5607843, 1, 1,
0.2966391, 1.177506, -1.250158, 0, 0.5568628, 1, 1,
0.2975271, 0.6396865, 1.515722, 0, 0.5490196, 1, 1,
0.300176, -0.3029356, 1.899776, 0, 0.5450981, 1, 1,
0.3002464, -1.429738, 3.12821, 0, 0.5372549, 1, 1,
0.3062539, 0.5655387, -7.570357e-05, 0, 0.5333334, 1, 1,
0.3079686, -0.3545835, 2.491162, 0, 0.5254902, 1, 1,
0.3191794, 0.9326412, 2.352429, 0, 0.5215687, 1, 1,
0.3223831, 0.817704, 1.424768, 0, 0.5137255, 1, 1,
0.3240922, 0.4016058, 0.8489659, 0, 0.509804, 1, 1,
0.3249763, 1.260661, -1.996613, 0, 0.5019608, 1, 1,
0.3255988, -1.472948, 2.220986, 0, 0.4941176, 1, 1,
0.3280526, -0.4310303, 2.298561, 0, 0.4901961, 1, 1,
0.3284161, 0.9222481, -1.615547, 0, 0.4823529, 1, 1,
0.329999, 2.329295, -1.814005, 0, 0.4784314, 1, 1,
0.3302607, -1.178313, 2.321387, 0, 0.4705882, 1, 1,
0.3314771, -0.07368324, 0.7833097, 0, 0.4666667, 1, 1,
0.3364048, -0.2389518, 2.541072, 0, 0.4588235, 1, 1,
0.3396351, 0.3020686, -0.5402043, 0, 0.454902, 1, 1,
0.3398031, 1.466866, 0.4265871, 0, 0.4470588, 1, 1,
0.340681, 0.8965844, 0.89195, 0, 0.4431373, 1, 1,
0.3410319, 1.03289, -0.692984, 0, 0.4352941, 1, 1,
0.342172, -1.893269, 3.387405, 0, 0.4313726, 1, 1,
0.3427797, -0.07974157, 1.464788, 0, 0.4235294, 1, 1,
0.3454572, 1.282172, -0.06614076, 0, 0.4196078, 1, 1,
0.3491405, -0.1937589, 2.638238, 0, 0.4117647, 1, 1,
0.3512534, -2.179962, 5.014127, 0, 0.4078431, 1, 1,
0.3577752, 1.226249, 1.476991, 0, 0.4, 1, 1,
0.3583142, -0.277679, 2.33618, 0, 0.3921569, 1, 1,
0.3586845, -0.4820306, 0.8839346, 0, 0.3882353, 1, 1,
0.3612716, 0.07524671, -0.00303216, 0, 0.3803922, 1, 1,
0.3613657, 0.3630649, 0.8568692, 0, 0.3764706, 1, 1,
0.3641541, -1.795952, 2.229741, 0, 0.3686275, 1, 1,
0.3703532, -0.8845949, 4.147387, 0, 0.3647059, 1, 1,
0.3768528, 0.553349, 0.07070558, 0, 0.3568628, 1, 1,
0.3781222, 0.1717972, 1.694366, 0, 0.3529412, 1, 1,
0.3803638, 1.0829, 0.9695793, 0, 0.345098, 1, 1,
0.381813, 0.8582948, -0.2834502, 0, 0.3411765, 1, 1,
0.3835529, 0.2059429, 1.983924, 0, 0.3333333, 1, 1,
0.3842922, -0.2455442, 2.128389, 0, 0.3294118, 1, 1,
0.3855847, -0.1844234, 3.41586, 0, 0.3215686, 1, 1,
0.3866338, 1.035437, 1.782868, 0, 0.3176471, 1, 1,
0.3871587, -0.04285198, 2.658413, 0, 0.3098039, 1, 1,
0.3882163, -0.6754112, 1.897888, 0, 0.3058824, 1, 1,
0.3883381, 0.7844217, -1.013104, 0, 0.2980392, 1, 1,
0.3919323, 1.830158, 0.112155, 0, 0.2901961, 1, 1,
0.4025461, -0.07488492, 2.555923, 0, 0.2862745, 1, 1,
0.4044906, -1.815021, 1.696401, 0, 0.2784314, 1, 1,
0.4132234, 1.45439, -0.6181098, 0, 0.2745098, 1, 1,
0.4199485, 0.649069, 0.840976, 0, 0.2666667, 1, 1,
0.422108, -1.024665, 1.294641, 0, 0.2627451, 1, 1,
0.4243358, 0.2135374, 1.640961, 0, 0.254902, 1, 1,
0.4306958, -0.7304241, 2.374053, 0, 0.2509804, 1, 1,
0.4311525, -1.516702, 3.813542, 0, 0.2431373, 1, 1,
0.4367103, 0.2787977, 1.158092, 0, 0.2392157, 1, 1,
0.43768, 0.6753702, 1.11708, 0, 0.2313726, 1, 1,
0.4378577, 0.9188308, 0.3623367, 0, 0.227451, 1, 1,
0.4380434, 0.805989, 0.4700249, 0, 0.2196078, 1, 1,
0.4411834, -0.1072058, 2.487671, 0, 0.2156863, 1, 1,
0.4417326, 1.143562, 0.5506493, 0, 0.2078431, 1, 1,
0.4490139, -0.774811, 2.145032, 0, 0.2039216, 1, 1,
0.450621, -0.1306544, 1.211061, 0, 0.1960784, 1, 1,
0.4522523, 0.942229, 0.3316058, 0, 0.1882353, 1, 1,
0.4537619, -1.241767, 3.265359, 0, 0.1843137, 1, 1,
0.4580034, -0.2739633, 1.127501, 0, 0.1764706, 1, 1,
0.4590775, -1.363713, 2.07924, 0, 0.172549, 1, 1,
0.4628088, -0.2612748, 3.392586, 0, 0.1647059, 1, 1,
0.4669793, -0.1674427, 1.101994, 0, 0.1607843, 1, 1,
0.4672152, 0.8835351, 0.3293144, 0, 0.1529412, 1, 1,
0.4695225, 1.251895, -1.272282, 0, 0.1490196, 1, 1,
0.4747191, 0.4328631, 1.968059, 0, 0.1411765, 1, 1,
0.4772947, 0.5319635, 0.7001834, 0, 0.1372549, 1, 1,
0.4777827, -0.1817048, 2.247579, 0, 0.1294118, 1, 1,
0.4778871, -1.196981, 2.126242, 0, 0.1254902, 1, 1,
0.479026, -0.6913552, 3.670908, 0, 0.1176471, 1, 1,
0.4839895, -0.5291465, 2.327422, 0, 0.1137255, 1, 1,
0.4850588, -0.2871661, 1.46937, 0, 0.1058824, 1, 1,
0.4851246, -0.4038133, 2.313047, 0, 0.09803922, 1, 1,
0.4878717, -0.0608006, 2.582843, 0, 0.09411765, 1, 1,
0.490181, 1.080561, 1.626014, 0, 0.08627451, 1, 1,
0.4920088, 0.7309071, -0.9205489, 0, 0.08235294, 1, 1,
0.4922549, 0.08418446, 0.6469587, 0, 0.07450981, 1, 1,
0.4954473, 1.054343, -0.3961514, 0, 0.07058824, 1, 1,
0.4983113, -0.8379527, 3.608729, 0, 0.0627451, 1, 1,
0.4988398, 0.304034, 0.4527092, 0, 0.05882353, 1, 1,
0.5073611, 1.772895, -1.254217, 0, 0.05098039, 1, 1,
0.5074865, 0.5052531, 0.5971069, 0, 0.04705882, 1, 1,
0.5086161, 1.066785, -0.6578184, 0, 0.03921569, 1, 1,
0.5170665, 1.363467, 0.2515079, 0, 0.03529412, 1, 1,
0.5190752, -0.8858234, 2.771115, 0, 0.02745098, 1, 1,
0.5231519, -1.65559, 4.38846, 0, 0.02352941, 1, 1,
0.5249403, -0.08693604, 0.5767637, 0, 0.01568628, 1, 1,
0.526844, -2.678265, 2.232004, 0, 0.01176471, 1, 1,
0.5269719, 0.6825683, -0.09158263, 0, 0.003921569, 1, 1,
0.5358865, 0.1406799, 1.327284, 0.003921569, 0, 1, 1,
0.5390892, 0.6130171, 1.356344, 0.007843138, 0, 1, 1,
0.5395876, -0.4057082, 2.399966, 0.01568628, 0, 1, 1,
0.5407358, 0.05206067, -0.6361816, 0.01960784, 0, 1, 1,
0.542742, -0.8824558, 0.5738244, 0.02745098, 0, 1, 1,
0.5469971, 1.082631, -0.9119047, 0.03137255, 0, 1, 1,
0.5505938, -0.09066541, 1.080598, 0.03921569, 0, 1, 1,
0.5533292, -0.1852119, 1.049153, 0.04313726, 0, 1, 1,
0.5537738, -0.9833457, 3.943225, 0.05098039, 0, 1, 1,
0.5554075, -0.1136274, 1.891672, 0.05490196, 0, 1, 1,
0.5579901, -0.418236, 2.915066, 0.0627451, 0, 1, 1,
0.5610096, 1.447699, 1.255629, 0.06666667, 0, 1, 1,
0.5611355, -0.8409531, 3.006043, 0.07450981, 0, 1, 1,
0.5682866, -0.8793629, 3.002974, 0.07843138, 0, 1, 1,
0.5693823, 0.3893411, 0.9642183, 0.08627451, 0, 1, 1,
0.572207, -0.01921372, 1.915275, 0.09019608, 0, 1, 1,
0.5749462, 1.694598, 0.267126, 0.09803922, 0, 1, 1,
0.5784948, -1.67638, 1.853023, 0.1058824, 0, 1, 1,
0.5845315, -3.150586, 3.116783, 0.1098039, 0, 1, 1,
0.5932332, 1.680621, -0.6662999, 0.1176471, 0, 1, 1,
0.59667, 0.2693129, 2.740684, 0.1215686, 0, 1, 1,
0.5987951, -0.513148, 1.501943, 0.1294118, 0, 1, 1,
0.6062843, -0.7193766, 2.672299, 0.1333333, 0, 1, 1,
0.6088659, -0.150749, 1.463784, 0.1411765, 0, 1, 1,
0.6092851, -1.382508, 5.215566, 0.145098, 0, 1, 1,
0.6120171, 0.995098, 2.554009, 0.1529412, 0, 1, 1,
0.6146386, -0.1442844, 1.438602, 0.1568628, 0, 1, 1,
0.6149458, 2.143157, -1.07635, 0.1647059, 0, 1, 1,
0.6184754, -1.286652, 2.028605, 0.1686275, 0, 1, 1,
0.6187255, -0.4530804, 2.902222, 0.1764706, 0, 1, 1,
0.6205313, -1.492913, 3.040747, 0.1803922, 0, 1, 1,
0.6288381, 1.444769, 1.601914, 0.1882353, 0, 1, 1,
0.6373529, 0.1660697, 0.6101221, 0.1921569, 0, 1, 1,
0.637789, -0.4584797, 0.2390647, 0.2, 0, 1, 1,
0.6380702, 0.4859912, -0.2672378, 0.2078431, 0, 1, 1,
0.6415436, 1.259392, -1.39356, 0.2117647, 0, 1, 1,
0.6444705, -0.9730684, 1.491304, 0.2196078, 0, 1, 1,
0.646401, 2.562223, 0.4240375, 0.2235294, 0, 1, 1,
0.6472313, 0.6646519, 1.753679, 0.2313726, 0, 1, 1,
0.6485745, 0.3307252, 1.33825, 0.2352941, 0, 1, 1,
0.6519439, 2.41988, -1.529818, 0.2431373, 0, 1, 1,
0.6591902, -0.7706077, 3.688615, 0.2470588, 0, 1, 1,
0.6603996, 0.4523018, 1.564342, 0.254902, 0, 1, 1,
0.6632103, 2.632869, 0.2608598, 0.2588235, 0, 1, 1,
0.6733617, 0.6024322, -1.620432, 0.2666667, 0, 1, 1,
0.6760936, 0.04444518, 0.06094314, 0.2705882, 0, 1, 1,
0.6776015, -0.6296883, 2.965545, 0.2784314, 0, 1, 1,
0.679386, 1.011262, 0.7290803, 0.282353, 0, 1, 1,
0.6804807, -1.900581, 2.412405, 0.2901961, 0, 1, 1,
0.6836288, -0.9284927, 1.750198, 0.2941177, 0, 1, 1,
0.6842378, -1.424623, 3.025439, 0.3019608, 0, 1, 1,
0.6853821, -0.3235589, 2.485211, 0.3098039, 0, 1, 1,
0.6889573, -0.3980047, 2.031248, 0.3137255, 0, 1, 1,
0.6947317, -1.82306, 2.608088, 0.3215686, 0, 1, 1,
0.6971865, 1.387253, -2.452732, 0.3254902, 0, 1, 1,
0.6985375, -1.174725, 2.552923, 0.3333333, 0, 1, 1,
0.7000836, 1.482802, 1.235962, 0.3372549, 0, 1, 1,
0.7041757, -0.4556694, 0.2741406, 0.345098, 0, 1, 1,
0.7043345, 0.9142445, 0.6606978, 0.3490196, 0, 1, 1,
0.7052042, 0.71776, 0.6270836, 0.3568628, 0, 1, 1,
0.7053196, -1.082205, 3.637967, 0.3607843, 0, 1, 1,
0.7084443, 0.7235974, 0.5919945, 0.3686275, 0, 1, 1,
0.7121958, -0.3377166, 3.163985, 0.372549, 0, 1, 1,
0.7163536, -1.142219, 1.475956, 0.3803922, 0, 1, 1,
0.7189555, 0.7427504, -0.4357698, 0.3843137, 0, 1, 1,
0.7235493, -1.06512, 1.993018, 0.3921569, 0, 1, 1,
0.7245753, -0.6487079, 1.182188, 0.3960784, 0, 1, 1,
0.7273055, -2.407139, 3.493379, 0.4039216, 0, 1, 1,
0.7286227, -0.443254, 0.2995708, 0.4117647, 0, 1, 1,
0.7298448, 0.2511333, 0.4499227, 0.4156863, 0, 1, 1,
0.7326136, 0.2060825, 0.975185, 0.4235294, 0, 1, 1,
0.7338871, 1.051893, 1.016744, 0.427451, 0, 1, 1,
0.736573, -0.7204977, 2.864021, 0.4352941, 0, 1, 1,
0.7411484, -0.574154, 1.721613, 0.4392157, 0, 1, 1,
0.7412121, 1.152404, 0.6178778, 0.4470588, 0, 1, 1,
0.7450988, 0.7944765, 0.7483273, 0.4509804, 0, 1, 1,
0.7455746, 0.7549979, 0.5856783, 0.4588235, 0, 1, 1,
0.7467907, 0.4543987, 1.600195, 0.4627451, 0, 1, 1,
0.7471234, -0.5657099, 2.350401, 0.4705882, 0, 1, 1,
0.7498886, -1.286491, 2.545034, 0.4745098, 0, 1, 1,
0.7574804, 0.04374002, 1.361187, 0.4823529, 0, 1, 1,
0.7657031, 0.3762233, 0.4807619, 0.4862745, 0, 1, 1,
0.7698548, 0.4450141, 0.3299525, 0.4941176, 0, 1, 1,
0.7724758, -0.1457236, 3.556507, 0.5019608, 0, 1, 1,
0.7725189, -1.245291, 1.278032, 0.5058824, 0, 1, 1,
0.7763269, 0.2468189, 1.431083, 0.5137255, 0, 1, 1,
0.7781862, 0.1164874, 1.116535, 0.5176471, 0, 1, 1,
0.7783157, 0.3218633, -0.5958562, 0.5254902, 0, 1, 1,
0.782653, -1.999846, 1.853125, 0.5294118, 0, 1, 1,
0.7852731, -0.9627815, 1.848211, 0.5372549, 0, 1, 1,
0.7886605, 1.014892, -0.2625105, 0.5411765, 0, 1, 1,
0.7916365, -0.8240044, 2.439394, 0.5490196, 0, 1, 1,
0.7920346, -0.2387019, 2.67771, 0.5529412, 0, 1, 1,
0.7932336, -0.5949955, 2.162768, 0.5607843, 0, 1, 1,
0.7962084, -0.7324276, 1.82558, 0.5647059, 0, 1, 1,
0.7972968, -0.3801795, 1.798023, 0.572549, 0, 1, 1,
0.7999622, -1.05563, 3.259392, 0.5764706, 0, 1, 1,
0.8051751, 1.133973, 0.1719741, 0.5843138, 0, 1, 1,
0.8071271, -0.4186283, 3.079456, 0.5882353, 0, 1, 1,
0.8100589, -0.8926212, 4.121586, 0.5960785, 0, 1, 1,
0.8125705, -0.2316049, 3.684631, 0.6039216, 0, 1, 1,
0.8171874, -0.9969878, 2.829994, 0.6078432, 0, 1, 1,
0.8194801, 0.4605128, 0.5981255, 0.6156863, 0, 1, 1,
0.819575, -1.154727, 0.5637226, 0.6196079, 0, 1, 1,
0.8234571, -1.313001, 1.803917, 0.627451, 0, 1, 1,
0.8270641, -1.752574, 2.564373, 0.6313726, 0, 1, 1,
0.8287354, -0.9503152, 2.601272, 0.6392157, 0, 1, 1,
0.828951, 0.4667897, 1.398793, 0.6431373, 0, 1, 1,
0.8323063, 0.557272, -0.2423865, 0.6509804, 0, 1, 1,
0.8335204, -0.5257202, 1.237766, 0.654902, 0, 1, 1,
0.8345689, -0.2897997, -1.285756, 0.6627451, 0, 1, 1,
0.8392832, 1.196282, 1.187315, 0.6666667, 0, 1, 1,
0.8394187, 0.06874849, 2.644422, 0.6745098, 0, 1, 1,
0.8416881, -0.7289715, 1.595736, 0.6784314, 0, 1, 1,
0.8468139, -0.6280164, 2.413078, 0.6862745, 0, 1, 1,
0.8559491, 1.908528, 1.851497, 0.6901961, 0, 1, 1,
0.8595555, 0.8329895, -0.8964447, 0.6980392, 0, 1, 1,
0.8618508, 0.1903607, 0.9511211, 0.7058824, 0, 1, 1,
0.8623623, 1.569928, -0.5296605, 0.7098039, 0, 1, 1,
0.8623757, 0.3450068, 2.572259, 0.7176471, 0, 1, 1,
0.866159, 0.3092553, 1.67758, 0.7215686, 0, 1, 1,
0.8670356, 0.4701253, 1.20715, 0.7294118, 0, 1, 1,
0.8688166, 0.8795505, -0.2542439, 0.7333333, 0, 1, 1,
0.8690589, -0.05475666, 0.9143339, 0.7411765, 0, 1, 1,
0.8702604, 0.3709963, 1.21526, 0.7450981, 0, 1, 1,
0.8706933, 1.519818, -1.748401, 0.7529412, 0, 1, 1,
0.8713051, 0.6640869, 0.9537761, 0.7568628, 0, 1, 1,
0.8715705, 1.717229, 0.1663332, 0.7647059, 0, 1, 1,
0.8722305, 0.141343, 2.49075, 0.7686275, 0, 1, 1,
0.873011, -1.522364, 3.2735, 0.7764706, 0, 1, 1,
0.8754112, -1.347355, 2.217822, 0.7803922, 0, 1, 1,
0.8786127, 1.517676, -0.7855681, 0.7882353, 0, 1, 1,
0.8812479, -0.1686923, 0.4732959, 0.7921569, 0, 1, 1,
0.8843558, -1.453445, 3.161045, 0.8, 0, 1, 1,
0.8850964, 0.9884419, 0.8482549, 0.8078431, 0, 1, 1,
0.8916947, -0.3494704, 1.669801, 0.8117647, 0, 1, 1,
0.8918034, 0.9474931, 1.752396, 0.8196079, 0, 1, 1,
0.8926739, -0.5719519, 2.373521, 0.8235294, 0, 1, 1,
0.8930893, 0.9839243, 1.083838, 0.8313726, 0, 1, 1,
0.8946097, 1.170393, 1.337581, 0.8352941, 0, 1, 1,
0.901462, -0.454882, 2.624394, 0.8431373, 0, 1, 1,
0.9020417, 1.16936, 0.8932045, 0.8470588, 0, 1, 1,
0.9044288, -0.00319558, 3.672364, 0.854902, 0, 1, 1,
0.9045359, -1.666145, 5.69567, 0.8588235, 0, 1, 1,
0.9050625, 0.5160647, 1.834485, 0.8666667, 0, 1, 1,
0.909814, 0.2313141, 1.57612, 0.8705882, 0, 1, 1,
0.9104625, -0.1778778, 1.411262, 0.8784314, 0, 1, 1,
0.910889, 1.387771, 1.453057, 0.8823529, 0, 1, 1,
0.9109452, -2.263115, 1.371872, 0.8901961, 0, 1, 1,
0.911262, -0.1141632, 1.956354, 0.8941177, 0, 1, 1,
0.914821, -0.6747251, 3.816699, 0.9019608, 0, 1, 1,
0.9157504, -2.107128, 3.128296, 0.9098039, 0, 1, 1,
0.9164443, -0.3725824, 2.555503, 0.9137255, 0, 1, 1,
0.9201396, 1.107306, 0.8966349, 0.9215686, 0, 1, 1,
0.9221657, -0.3126144, 3.635373, 0.9254902, 0, 1, 1,
0.9269233, 0.5678546, 0.01095534, 0.9333333, 0, 1, 1,
0.9354506, 0.3548836, 0.530418, 0.9372549, 0, 1, 1,
0.9393287, -0.2702673, 2.206438, 0.945098, 0, 1, 1,
0.9396338, -0.3312889, 1.730965, 0.9490196, 0, 1, 1,
0.9399706, 0.7412356, -0.4870691, 0.9568627, 0, 1, 1,
0.943855, -0.335421, 1.742409, 0.9607843, 0, 1, 1,
0.9487579, 0.9801179, 2.257159, 0.9686275, 0, 1, 1,
0.954161, -0.6157306, 2.116874, 0.972549, 0, 1, 1,
0.95684, 0.1408137, 2.453706, 0.9803922, 0, 1, 1,
0.9597104, -0.7072111, 1.092136, 0.9843137, 0, 1, 1,
0.960982, 0.7795525, 1.475099, 0.9921569, 0, 1, 1,
0.9640459, -1.791199, 3.272471, 0.9960784, 0, 1, 1,
0.9760957, -1.488492, 1.390734, 1, 0, 0.9960784, 1,
0.9788303, -1.13104, 2.486891, 1, 0, 0.9882353, 1,
0.9846408, 0.7895271, 1.435985, 1, 0, 0.9843137, 1,
0.9854923, 1.009952, -0.6596587, 1, 0, 0.9764706, 1,
0.9927979, 0.7281724, 0.8995188, 1, 0, 0.972549, 1,
0.9970172, 1.71525, -0.3083934, 1, 0, 0.9647059, 1,
0.997308, -1.003116, 3.225725, 1, 0, 0.9607843, 1,
1.005234, -1.084733, 2.649811, 1, 0, 0.9529412, 1,
1.006103, -0.3929687, 2.12497, 1, 0, 0.9490196, 1,
1.013831, 0.9446952, 2.704745, 1, 0, 0.9411765, 1,
1.014103, -0.344416, 1.425437, 1, 0, 0.9372549, 1,
1.02673, 0.9199206, 0.7962309, 1, 0, 0.9294118, 1,
1.026847, -0.3811616, 2.691656, 1, 0, 0.9254902, 1,
1.032158, 1.487885, 1.029468, 1, 0, 0.9176471, 1,
1.043921, 0.02307262, 0.03565491, 1, 0, 0.9137255, 1,
1.048103, 0.9829481, 0.8523147, 1, 0, 0.9058824, 1,
1.048384, -0.1145792, 4.326398, 1, 0, 0.9019608, 1,
1.048833, -2.063881, 3.84969, 1, 0, 0.8941177, 1,
1.052443, 0.3689027, -0.07703795, 1, 0, 0.8862745, 1,
1.054172, 1.522732, -1.291353, 1, 0, 0.8823529, 1,
1.061946, -0.7493533, 2.327115, 1, 0, 0.8745098, 1,
1.062579, 0.8768387, 0.5834888, 1, 0, 0.8705882, 1,
1.068367, -1.587968, 2.493816, 1, 0, 0.8627451, 1,
1.068403, 0.02387515, -0.3689047, 1, 0, 0.8588235, 1,
1.069101, 0.2049158, 0.1846039, 1, 0, 0.8509804, 1,
1.072646, 0.08810627, 2.48026, 1, 0, 0.8470588, 1,
1.074091, 0.03605914, 0.4551647, 1, 0, 0.8392157, 1,
1.074822, -0.704453, 1.336796, 1, 0, 0.8352941, 1,
1.077682, 0.4385729, 1.531563, 1, 0, 0.827451, 1,
1.079392, 0.5430058, 0.3895347, 1, 0, 0.8235294, 1,
1.093458, 0.8232169, 0.1578457, 1, 0, 0.8156863, 1,
1.099173, -0.1343275, 1.76834, 1, 0, 0.8117647, 1,
1.099388, -0.7737278, 0.7926781, 1, 0, 0.8039216, 1,
1.100158, -0.06344407, 2.205659, 1, 0, 0.7960784, 1,
1.104647, -0.09181374, 1.561621, 1, 0, 0.7921569, 1,
1.10748, 0.2270239, 1.554083, 1, 0, 0.7843137, 1,
1.108556, 0.9562219, 3.245404, 1, 0, 0.7803922, 1,
1.111852, 0.9667273, 0.6966055, 1, 0, 0.772549, 1,
1.115169, 1.427423, 1.442333, 1, 0, 0.7686275, 1,
1.121998, 0.604638, 0.9042669, 1, 0, 0.7607843, 1,
1.13585, 1.78074, -0.2541974, 1, 0, 0.7568628, 1,
1.14327, 1.770899, 1.75691, 1, 0, 0.7490196, 1,
1.14641, 2.448713, 0.7987758, 1, 0, 0.7450981, 1,
1.15088, 1.090909, 1.08581, 1, 0, 0.7372549, 1,
1.157061, 1.135944, 0.2022765, 1, 0, 0.7333333, 1,
1.164266, -1.158616, 3.228455, 1, 0, 0.7254902, 1,
1.172416, -0.3732692, 0.6567318, 1, 0, 0.7215686, 1,
1.17617, 1.061646, 0.4245545, 1, 0, 0.7137255, 1,
1.1799, 0.08165218, 2.490001, 1, 0, 0.7098039, 1,
1.203455, 1.948541, -0.4106681, 1, 0, 0.7019608, 1,
1.208405, -1.533637, 2.72515, 1, 0, 0.6941177, 1,
1.217602, -1.1534, 2.548099, 1, 0, 0.6901961, 1,
1.21861, 0.1813218, 2.167207, 1, 0, 0.682353, 1,
1.220975, -0.5737945, 0.861039, 1, 0, 0.6784314, 1,
1.228562, 0.3276956, 0.9942762, 1, 0, 0.6705883, 1,
1.231528, -3.092412, 1.995215, 1, 0, 0.6666667, 1,
1.249334, -1.281678, 2.605871, 1, 0, 0.6588235, 1,
1.251601, 0.4337941, 1.652516, 1, 0, 0.654902, 1,
1.25896, -0.213823, 3.214212, 1, 0, 0.6470588, 1,
1.271288, -0.06380953, 2.881856, 1, 0, 0.6431373, 1,
1.273162, -0.1678852, 1.533087, 1, 0, 0.6352941, 1,
1.287239, -0.5550253, 1.583874, 1, 0, 0.6313726, 1,
1.290336, -0.388046, 1.350018, 1, 0, 0.6235294, 1,
1.293971, 0.2714446, 1.497168, 1, 0, 0.6196079, 1,
1.300162, 0.3994133, 0.4931936, 1, 0, 0.6117647, 1,
1.311582, 2.732035, 1.10147, 1, 0, 0.6078432, 1,
1.315793, 0.2063501, 1.125015, 1, 0, 0.6, 1,
1.316574, -1.965478, 2.885503, 1, 0, 0.5921569, 1,
1.320273, -0.08459137, -0.6592121, 1, 0, 0.5882353, 1,
1.324022, 0.3776843, 1.638161, 1, 0, 0.5803922, 1,
1.344679, -0.5112655, 0.9813173, 1, 0, 0.5764706, 1,
1.34779, 0.8264547, 0.4591836, 1, 0, 0.5686275, 1,
1.350298, 1.002175, 1.358316, 1, 0, 0.5647059, 1,
1.35449, -0.5983231, 0.5049506, 1, 0, 0.5568628, 1,
1.360328, 0.1046518, 0.365062, 1, 0, 0.5529412, 1,
1.362623, -0.317696, 1.842886, 1, 0, 0.5450981, 1,
1.362641, -0.9707344, 2.26049, 1, 0, 0.5411765, 1,
1.368424, 1.646319, 1.331937, 1, 0, 0.5333334, 1,
1.373372, -0.7442106, 2.381377, 1, 0, 0.5294118, 1,
1.376499, -1.115435, 1.227433, 1, 0, 0.5215687, 1,
1.378252, -0.2129038, 1.955945, 1, 0, 0.5176471, 1,
1.382767, -0.6889799, 1.307218, 1, 0, 0.509804, 1,
1.38559, -0.4708568, 2.665629, 1, 0, 0.5058824, 1,
1.398393, 1.245599, 2.356704, 1, 0, 0.4980392, 1,
1.412642, 0.6855128, -0.05081149, 1, 0, 0.4901961, 1,
1.431247, -0.2518232, 2.93261, 1, 0, 0.4862745, 1,
1.432801, -0.8394942, 2.634847, 1, 0, 0.4784314, 1,
1.452862, -0.1123669, 1.943419, 1, 0, 0.4745098, 1,
1.467309, 1.91769, 1.817473, 1, 0, 0.4666667, 1,
1.469512, 1.084675, -0.1652757, 1, 0, 0.4627451, 1,
1.486505, 2.239275, 0.6232286, 1, 0, 0.454902, 1,
1.48843, -0.8602943, 3.371399, 1, 0, 0.4509804, 1,
1.493654, 0.8325456, 1.728323, 1, 0, 0.4431373, 1,
1.494464, -1.161882, 2.21898, 1, 0, 0.4392157, 1,
1.500381, 0.15661, 1.116924, 1, 0, 0.4313726, 1,
1.501447, 0.03763288, 3.350743, 1, 0, 0.427451, 1,
1.504297, -0.3355851, 2.036019, 1, 0, 0.4196078, 1,
1.506211, 1.611662, 0.2318622, 1, 0, 0.4156863, 1,
1.511369, 1.272418, -1.907896, 1, 0, 0.4078431, 1,
1.529106, 1.365968, -0.8236189, 1, 0, 0.4039216, 1,
1.536897, 0.2291835, 0.5384111, 1, 0, 0.3960784, 1,
1.542162, -1.058858, 2.756513, 1, 0, 0.3882353, 1,
1.548576, -0.3771714, 2.363896, 1, 0, 0.3843137, 1,
1.571293, -1.056025, 3.281967, 1, 0, 0.3764706, 1,
1.582744, -2.930966, 2.651736, 1, 0, 0.372549, 1,
1.62171, -0.7014874, 0.9536849, 1, 0, 0.3647059, 1,
1.622785, -1.868965, 3.001802, 1, 0, 0.3607843, 1,
1.634344, 1.788307, -0.5174863, 1, 0, 0.3529412, 1,
1.639911, -0.8159775, 1.696803, 1, 0, 0.3490196, 1,
1.64904, -0.570636, 3.25095, 1, 0, 0.3411765, 1,
1.673609, 0.3306501, 1.093433, 1, 0, 0.3372549, 1,
1.674356, 1.520494, 1.652267, 1, 0, 0.3294118, 1,
1.677055, 1.374355, 1.877471, 1, 0, 0.3254902, 1,
1.677208, -0.03004593, 0.7224809, 1, 0, 0.3176471, 1,
1.680634, 1.116474, 1.329677, 1, 0, 0.3137255, 1,
1.684381, -0.3678107, 1.467374, 1, 0, 0.3058824, 1,
1.687467, -0.8432593, 0.4488979, 1, 0, 0.2980392, 1,
1.68826, -0.3365942, 2.632339, 1, 0, 0.2941177, 1,
1.691197, -0.1466982, 3.100919, 1, 0, 0.2862745, 1,
1.700052, -1.344723, 2.002604, 1, 0, 0.282353, 1,
1.704985, -0.08984683, 1.823397, 1, 0, 0.2745098, 1,
1.75172, 0.04839943, 3.152039, 1, 0, 0.2705882, 1,
1.752305, 2.018441, -0.198608, 1, 0, 0.2627451, 1,
1.758029, -0.2839117, 1.590421, 1, 0, 0.2588235, 1,
1.759402, 0.716123, 1.998338, 1, 0, 0.2509804, 1,
1.77502, 0.7902187, 1.126747, 1, 0, 0.2470588, 1,
1.775749, -0.2349072, 1.599518, 1, 0, 0.2392157, 1,
1.775832, -0.04216685, 1.824006, 1, 0, 0.2352941, 1,
1.780216, -0.398412, 4.065469, 1, 0, 0.227451, 1,
1.785189, -0.2887248, 2.453064, 1, 0, 0.2235294, 1,
1.794738, 0.3783098, 0.7890725, 1, 0, 0.2156863, 1,
1.804672, 0.971455, 2.524638, 1, 0, 0.2117647, 1,
1.808694, 0.389198, 1.661399, 1, 0, 0.2039216, 1,
1.809677, 0.07747143, 3.39064, 1, 0, 0.1960784, 1,
1.81014, -0.6353534, 1.481923, 1, 0, 0.1921569, 1,
1.832765, 0.9294856, 1.685979, 1, 0, 0.1843137, 1,
1.840923, 0.9420046, 0.3081943, 1, 0, 0.1803922, 1,
1.85386, 0.03138045, 1.294764, 1, 0, 0.172549, 1,
1.906638, -0.3466915, 0.7190661, 1, 0, 0.1686275, 1,
1.942328, -0.5449923, 2.496791, 1, 0, 0.1607843, 1,
1.960745, 0.4502862, 1.940796, 1, 0, 0.1568628, 1,
1.973074, 1.713386, 0.6043374, 1, 0, 0.1490196, 1,
2.022121, 0.5348858, 1.531433, 1, 0, 0.145098, 1,
2.059806, 0.04841436, 1.236712, 1, 0, 0.1372549, 1,
2.112829, 1.261776, -1.091941, 1, 0, 0.1333333, 1,
2.115516, -0.4101799, 2.152889, 1, 0, 0.1254902, 1,
2.148851, 0.1101733, 2.05772, 1, 0, 0.1215686, 1,
2.162955, -0.971813, 2.172362, 1, 0, 0.1137255, 1,
2.190935, 1.054946, 1.098647, 1, 0, 0.1098039, 1,
2.19109, -0.2093927, 1.971009, 1, 0, 0.1019608, 1,
2.233603, -1.344161, 2.360345, 1, 0, 0.09411765, 1,
2.238563, -1.613334, 0.9894426, 1, 0, 0.09019608, 1,
2.280873, -0.597831, 2.890855, 1, 0, 0.08235294, 1,
2.293996, 1.86437, 0.5927722, 1, 0, 0.07843138, 1,
2.320438, 1.386615, 1.281873, 1, 0, 0.07058824, 1,
2.324694, 0.4233387, 0.5737595, 1, 0, 0.06666667, 1,
2.345433, 0.2506864, 0.05672375, 1, 0, 0.05882353, 1,
2.349442, 1.908946, 0.7838002, 1, 0, 0.05490196, 1,
2.409586, -1.203741, 0.4636144, 1, 0, 0.04705882, 1,
2.481702, -0.1541169, 1.45617, 1, 0, 0.04313726, 1,
2.532031, -1.675248, 2.176548, 1, 0, 0.03529412, 1,
2.586315, -0.321976, 1.752252, 1, 0, 0.03137255, 1,
2.645089, -0.8060278, 1.168181, 1, 0, 0.02352941, 1,
2.958871, -0.8973119, 1.415234, 1, 0, 0.01960784, 1,
2.989482, 0.3212294, 0.8902329, 1, 0, 0.01176471, 1,
3.154084, 0.8150593, -0.6770919, 1, 0, 0.007843138, 1
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
-0.4477983, -5.061875, -7.439897, 0, -0.5, 0.5, 0.5,
-0.4477983, -5.061875, -7.439897, 1, -0.5, 0.5, 0.5,
-0.4477983, -5.061875, -7.439897, 1, 1.5, 0.5, 0.5,
-0.4477983, -5.061875, -7.439897, 0, 1.5, 0.5, 0.5
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
-5.270719, -0.2805431, -7.439897, 0, -0.5, 0.5, 0.5,
-5.270719, -0.2805431, -7.439897, 1, -0.5, 0.5, 0.5,
-5.270719, -0.2805431, -7.439897, 1, 1.5, 0.5, 0.5,
-5.270719, -0.2805431, -7.439897, 0, 1.5, 0.5, 0.5
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
-5.270719, -5.061875, 0.0797801, 0, -0.5, 0.5, 0.5,
-5.270719, -5.061875, 0.0797801, 1, -0.5, 0.5, 0.5,
-5.270719, -5.061875, 0.0797801, 1, 1.5, 0.5, 0.5,
-5.270719, -5.061875, 0.0797801, 0, 1.5, 0.5, 0.5
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
-4, -3.958491, -5.704587,
2, -3.958491, -5.704587,
-4, -3.958491, -5.704587,
-4, -4.142388, -5.993805,
-2, -3.958491, -5.704587,
-2, -4.142388, -5.993805,
0, -3.958491, -5.704587,
0, -4.142388, -5.993805,
2, -3.958491, -5.704587,
2, -4.142388, -5.993805
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
"-4",
"-2",
"0",
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
-4, -4.510183, -6.572242, 0, -0.5, 0.5, 0.5,
-4, -4.510183, -6.572242, 1, -0.5, 0.5, 0.5,
-4, -4.510183, -6.572242, 1, 1.5, 0.5, 0.5,
-4, -4.510183, -6.572242, 0, 1.5, 0.5, 0.5,
-2, -4.510183, -6.572242, 0, -0.5, 0.5, 0.5,
-2, -4.510183, -6.572242, 1, -0.5, 0.5, 0.5,
-2, -4.510183, -6.572242, 1, 1.5, 0.5, 0.5,
-2, -4.510183, -6.572242, 0, 1.5, 0.5, 0.5,
0, -4.510183, -6.572242, 0, -0.5, 0.5, 0.5,
0, -4.510183, -6.572242, 1, -0.5, 0.5, 0.5,
0, -4.510183, -6.572242, 1, 1.5, 0.5, 0.5,
0, -4.510183, -6.572242, 0, 1.5, 0.5, 0.5,
2, -4.510183, -6.572242, 0, -0.5, 0.5, 0.5,
2, -4.510183, -6.572242, 1, -0.5, 0.5, 0.5,
2, -4.510183, -6.572242, 1, 1.5, 0.5, 0.5,
2, -4.510183, -6.572242, 0, 1.5, 0.5, 0.5
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
-4.157737, -2, -5.704587,
-4.157737, 2, -5.704587,
-4.157737, -2, -5.704587,
-4.343234, -2, -5.993805,
-4.157737, 0, -5.704587,
-4.343234, 0, -5.993805,
-4.157737, 2, -5.704587,
-4.343234, 2, -5.993805
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
"0",
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
-4.714228, -2, -6.572242, 0, -0.5, 0.5, 0.5,
-4.714228, -2, -6.572242, 1, -0.5, 0.5, 0.5,
-4.714228, -2, -6.572242, 1, 1.5, 0.5, 0.5,
-4.714228, -2, -6.572242, 0, 1.5, 0.5, 0.5,
-4.714228, 0, -6.572242, 0, -0.5, 0.5, 0.5,
-4.714228, 0, -6.572242, 1, -0.5, 0.5, 0.5,
-4.714228, 0, -6.572242, 1, 1.5, 0.5, 0.5,
-4.714228, 0, -6.572242, 0, 1.5, 0.5, 0.5,
-4.714228, 2, -6.572242, 0, -0.5, 0.5, 0.5,
-4.714228, 2, -6.572242, 1, -0.5, 0.5, 0.5,
-4.714228, 2, -6.572242, 1, 1.5, 0.5, 0.5,
-4.714228, 2, -6.572242, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-4.157737, -3.958491, -4,
-4.157737, -3.958491, 4,
-4.157737, -3.958491, -4,
-4.343234, -4.142388, -4,
-4.157737, -3.958491, -2,
-4.343234, -4.142388, -2,
-4.157737, -3.958491, 0,
-4.343234, -4.142388, 0,
-4.157737, -3.958491, 2,
-4.343234, -4.142388, 2,
-4.157737, -3.958491, 4,
-4.343234, -4.142388, 4
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
-4.714228, -4.510183, -4, 0, -0.5, 0.5, 0.5,
-4.714228, -4.510183, -4, 1, -0.5, 0.5, 0.5,
-4.714228, -4.510183, -4, 1, 1.5, 0.5, 0.5,
-4.714228, -4.510183, -4, 0, 1.5, 0.5, 0.5,
-4.714228, -4.510183, -2, 0, -0.5, 0.5, 0.5,
-4.714228, -4.510183, -2, 1, -0.5, 0.5, 0.5,
-4.714228, -4.510183, -2, 1, 1.5, 0.5, 0.5,
-4.714228, -4.510183, -2, 0, 1.5, 0.5, 0.5,
-4.714228, -4.510183, 0, 0, -0.5, 0.5, 0.5,
-4.714228, -4.510183, 0, 1, -0.5, 0.5, 0.5,
-4.714228, -4.510183, 0, 1, 1.5, 0.5, 0.5,
-4.714228, -4.510183, 0, 0, 1.5, 0.5, 0.5,
-4.714228, -4.510183, 2, 0, -0.5, 0.5, 0.5,
-4.714228, -4.510183, 2, 1, -0.5, 0.5, 0.5,
-4.714228, -4.510183, 2, 1, 1.5, 0.5, 0.5,
-4.714228, -4.510183, 2, 0, 1.5, 0.5, 0.5,
-4.714228, -4.510183, 4, 0, -0.5, 0.5, 0.5,
-4.714228, -4.510183, 4, 1, -0.5, 0.5, 0.5,
-4.714228, -4.510183, 4, 1, 1.5, 0.5, 0.5,
-4.714228, -4.510183, 4, 0, 1.5, 0.5, 0.5
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
-4.157737, -3.958491, -5.704587,
-4.157737, 3.397405, -5.704587,
-4.157737, -3.958491, 5.864147,
-4.157737, 3.397405, 5.864147,
-4.157737, -3.958491, -5.704587,
-4.157737, -3.958491, 5.864147,
-4.157737, 3.397405, -5.704587,
-4.157737, 3.397405, 5.864147,
-4.157737, -3.958491, -5.704587,
3.262141, -3.958491, -5.704587,
-4.157737, -3.958491, 5.864147,
3.262141, -3.958491, 5.864147,
-4.157737, 3.397405, -5.704587,
3.262141, 3.397405, -5.704587,
-4.157737, 3.397405, 5.864147,
3.262141, 3.397405, 5.864147,
3.262141, -3.958491, -5.704587,
3.262141, 3.397405, -5.704587,
3.262141, -3.958491, 5.864147,
3.262141, 3.397405, 5.864147,
3.262141, -3.958491, -5.704587,
3.262141, -3.958491, 5.864147,
3.262141, 3.397405, -5.704587,
3.262141, 3.397405, 5.864147
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
var radius = 8.323923;
var distance = 37.03408;
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
mvMatrix.translate( 0.4477983, 0.2805431, -0.0797801 );
mvMatrix.scale( 1.212956, 1.223507, 0.777958 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.03408);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
propiconazole<-read.table("propiconazole.xyz")
```

```
## Error in read.table("propiconazole.xyz"): no lines available in input
```

```r
x<-propiconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'propiconazole' not found
```

```r
y<-propiconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'propiconazole' not found
```

```r
z<-propiconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'propiconazole' not found
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
-4.049681, -0.8340638, -3.024386, 0, 0, 1, 1, 1,
-3.000167, 2.255295, -1.132202, 1, 0, 0, 1, 1,
-2.835923, -0.3182008, -2.035051, 1, 0, 0, 1, 1,
-2.272822, 1.167813, -1.330608, 1, 0, 0, 1, 1,
-2.264555, 0.4239604, -1.51808, 1, 0, 0, 1, 1,
-2.254378, -0.5021318, -1.338079, 1, 0, 0, 1, 1,
-2.200691, -1.344942, -1.748571, 0, 0, 0, 1, 1,
-2.133043, 0.7997321, 0.156487, 0, 0, 0, 1, 1,
-2.090358, -0.9887938, -1.656024, 0, 0, 0, 1, 1,
-2.074892, -0.4829431, -1.660442, 0, 0, 0, 1, 1,
-2.068049, -0.1037154, -1.36904, 0, 0, 0, 1, 1,
-2.061672, 1.244639, -0.1644439, 0, 0, 0, 1, 1,
-2.047676, -0.6580535, -3.261269, 0, 0, 0, 1, 1,
-2.017076, -2.32628, -0.1588805, 1, 1, 1, 1, 1,
-2.015008, -0.6974913, -2.390761, 1, 1, 1, 1, 1,
-1.995973, 1.821054, 0.6596505, 1, 1, 1, 1, 1,
-1.914904, -0.4440328, -3.434624, 1, 1, 1, 1, 1,
-1.913975, -0.2552371, -2.052034, 1, 1, 1, 1, 1,
-1.904818, 1.29861, -0.9242543, 1, 1, 1, 1, 1,
-1.879275, -1.804057, -2.214401, 1, 1, 1, 1, 1,
-1.846308, -1.991045, -3.092064, 1, 1, 1, 1, 1,
-1.822275, -0.4878012, -0.8971899, 1, 1, 1, 1, 1,
-1.806522, 0.8715495, -0.3320943, 1, 1, 1, 1, 1,
-1.791899, 0.9410236, -1.486733, 1, 1, 1, 1, 1,
-1.782674, 1.586615, -1.793286, 1, 1, 1, 1, 1,
-1.763541, -0.2283883, -3.01163, 1, 1, 1, 1, 1,
-1.755341, -0.4078018, -3.430455, 1, 1, 1, 1, 1,
-1.735444, 1.494619, 0.6981239, 1, 1, 1, 1, 1,
-1.73393, -0.6817937, -0.2374199, 0, 0, 1, 1, 1,
-1.713039, -0.3563094, -0.7355363, 1, 0, 0, 1, 1,
-1.680662, -0.6434492, -2.582595, 1, 0, 0, 1, 1,
-1.667036, 1.647306, -1.041755, 1, 0, 0, 1, 1,
-1.662487, -0.5269889, -1.304195, 1, 0, 0, 1, 1,
-1.659482, 0.3878377, -1.761858, 1, 0, 0, 1, 1,
-1.658944, -0.01427325, -0.829108, 0, 0, 0, 1, 1,
-1.650051, -0.3506905, -3.573208, 0, 0, 0, 1, 1,
-1.644979, 0.9684348, -1.273776, 0, 0, 0, 1, 1,
-1.637522, 0.909952, -2.503699, 0, 0, 0, 1, 1,
-1.635202, -0.5455143, -2.472621, 0, 0, 0, 1, 1,
-1.628461, -2.223702, -1.633852, 0, 0, 0, 1, 1,
-1.61461, -0.1006402, -0.6942239, 0, 0, 0, 1, 1,
-1.605609, -0.344575, -0.1314131, 1, 1, 1, 1, 1,
-1.58893, 0.2345729, -0.5613894, 1, 1, 1, 1, 1,
-1.566474, 0.005653983, -0.002612551, 1, 1, 1, 1, 1,
-1.566156, 0.8638759, -0.5848969, 1, 1, 1, 1, 1,
-1.559739, -0.4766875, -2.586984, 1, 1, 1, 1, 1,
-1.551878, 0.512954, 0.4751184, 1, 1, 1, 1, 1,
-1.542117, 1.382188, -0.5120345, 1, 1, 1, 1, 1,
-1.537758, -1.00525, -1.857376, 1, 1, 1, 1, 1,
-1.529583, -0.6022682, -2.661991, 1, 1, 1, 1, 1,
-1.525552, 0.2274635, -1.826657, 1, 1, 1, 1, 1,
-1.514266, 0.07340246, -1.338086, 1, 1, 1, 1, 1,
-1.513025, -0.006702458, -1.644284, 1, 1, 1, 1, 1,
-1.507049, 0.08327216, -2.008976, 1, 1, 1, 1, 1,
-1.502666, -0.36623, -2.029217, 1, 1, 1, 1, 1,
-1.502512, -0.3358926, -2.685167, 1, 1, 1, 1, 1,
-1.479265, -1.521795, -2.219153, 0, 0, 1, 1, 1,
-1.462741, 1.216545, -2.007281, 1, 0, 0, 1, 1,
-1.461542, 1.313055, -0.7591113, 1, 0, 0, 1, 1,
-1.461014, -0.862618, -2.658852, 1, 0, 0, 1, 1,
-1.458191, -1.148454, -1.515697, 1, 0, 0, 1, 1,
-1.451342, -0.5134837, -1.55168, 1, 0, 0, 1, 1,
-1.447814, -0.2960695, -2.833168, 0, 0, 0, 1, 1,
-1.446718, -0.8388841, -3.368524, 0, 0, 0, 1, 1,
-1.41739, -0.08880795, -0.6925743, 0, 0, 0, 1, 1,
-1.41455, -0.4016052, -2.495965, 0, 0, 0, 1, 1,
-1.411967, -1.249913, -3.600377, 0, 0, 0, 1, 1,
-1.389189, 0.3385852, -0.8151314, 0, 0, 0, 1, 1,
-1.38596, -0.2935562, -1.42433, 0, 0, 0, 1, 1,
-1.380879, 0.1948658, -1.673483, 1, 1, 1, 1, 1,
-1.380843, 1.182045, -0.7692889, 1, 1, 1, 1, 1,
-1.363991, -0.01258397, -1.613028, 1, 1, 1, 1, 1,
-1.354583, 1.119168, -0.9424703, 1, 1, 1, 1, 1,
-1.33655, -0.09823488, -2.515351, 1, 1, 1, 1, 1,
-1.32842, 1.231211, -1.011728, 1, 1, 1, 1, 1,
-1.323861, 1.119334, -3.574697, 1, 1, 1, 1, 1,
-1.314687, 0.2689542, -1.415154, 1, 1, 1, 1, 1,
-1.310749, 0.3053794, 0.1315511, 1, 1, 1, 1, 1,
-1.306508, 0.2519265, -1.741959, 1, 1, 1, 1, 1,
-1.299743, 0.7836931, -0.7826372, 1, 1, 1, 1, 1,
-1.293207, 1.843367, -0.9971527, 1, 1, 1, 1, 1,
-1.290755, -0.2553864, -2.759422, 1, 1, 1, 1, 1,
-1.285138, -0.06547489, -0.6121274, 1, 1, 1, 1, 1,
-1.274429, -1.574576, -3.905902, 1, 1, 1, 1, 1,
-1.26447, 1.427781, -1.520072, 0, 0, 1, 1, 1,
-1.260916, 1.043437, -1.30752, 1, 0, 0, 1, 1,
-1.259415, -0.4200189, -2.645245, 1, 0, 0, 1, 1,
-1.249737, -0.3245432, -4.512692, 1, 0, 0, 1, 1,
-1.246078, 1.409855, -1.013372, 1, 0, 0, 1, 1,
-1.22999, 0.6244065, -1.025667, 1, 0, 0, 1, 1,
-1.229477, -0.6752407, -1.786899, 0, 0, 0, 1, 1,
-1.223301, 1.326005, -2.306369, 0, 0, 0, 1, 1,
-1.221772, 0.5004631, -2.02915, 0, 0, 0, 1, 1,
-1.221119, 1.407375, -0.03734662, 0, 0, 0, 1, 1,
-1.217157, 0.6548851, -0.8655025, 0, 0, 0, 1, 1,
-1.212448, 0.2156229, -2.422828, 0, 0, 0, 1, 1,
-1.211965, -0.1072015, 0.350004, 0, 0, 0, 1, 1,
-1.21176, 0.8443538, -2.466624, 1, 1, 1, 1, 1,
-1.206939, 0.9194102, -1.81804, 1, 1, 1, 1, 1,
-1.203765, 1.078755, 0.006423666, 1, 1, 1, 1, 1,
-1.202517, 0.1674874, -1.524616, 1, 1, 1, 1, 1,
-1.201275, -0.6897256, -1.53849, 1, 1, 1, 1, 1,
-1.198576, 1.180791, -0.2530665, 1, 1, 1, 1, 1,
-1.197784, 1.206947, -1.793518, 1, 1, 1, 1, 1,
-1.196242, -0.9516846, -1.966667, 1, 1, 1, 1, 1,
-1.194366, -0.1799441, -0.8196437, 1, 1, 1, 1, 1,
-1.190778, -0.811205, -2.795525, 1, 1, 1, 1, 1,
-1.184125, 0.1393895, -0.1075045, 1, 1, 1, 1, 1,
-1.183682, 0.7365769, -0.4235931, 1, 1, 1, 1, 1,
-1.179022, 1.763531, 0.8489551, 1, 1, 1, 1, 1,
-1.16933, -1.548923, -0.9901932, 1, 1, 1, 1, 1,
-1.15833, 0.1967681, -2.066326, 1, 1, 1, 1, 1,
-1.149162, -1.598105, -2.397994, 0, 0, 1, 1, 1,
-1.14693, 1.593034, 0.5447688, 1, 0, 0, 1, 1,
-1.145483, 0.06274792, -1.121613, 1, 0, 0, 1, 1,
-1.144356, -0.02840974, -0.7717384, 1, 0, 0, 1, 1,
-1.141037, -0.3945571, -2.067921, 1, 0, 0, 1, 1,
-1.137261, -1.938515, -2.542788, 1, 0, 0, 1, 1,
-1.132805, -0.2467398, -3.026972, 0, 0, 0, 1, 1,
-1.127002, -0.6935617, -1.718091, 0, 0, 0, 1, 1,
-1.124959, 1.319054, 0.07534867, 0, 0, 0, 1, 1,
-1.115304, 0.510201, -1.207247, 0, 0, 0, 1, 1,
-1.115075, -0.2078924, -2.77477, 0, 0, 0, 1, 1,
-1.113253, -1.680484, -3.036538, 0, 0, 0, 1, 1,
-1.108273, -0.2723679, -2.175732, 0, 0, 0, 1, 1,
-1.105354, 0.2740984, -1.210357, 1, 1, 1, 1, 1,
-1.096866, -0.7918064, -2.368681, 1, 1, 1, 1, 1,
-1.095231, -0.8912643, -0.6858585, 1, 1, 1, 1, 1,
-1.092273, 0.4558609, 0.545484, 1, 1, 1, 1, 1,
-1.086771, -0.7687957, -2.607385, 1, 1, 1, 1, 1,
-1.080296, -0.07516461, -1.71694, 1, 1, 1, 1, 1,
-1.068227, 0.5541281, -2.165107, 1, 1, 1, 1, 1,
-1.068095, -0.5213481, -1.934127, 1, 1, 1, 1, 1,
-1.06232, 0.1389152, -1.406337, 1, 1, 1, 1, 1,
-1.056486, 0.7676548, -1.879173, 1, 1, 1, 1, 1,
-1.05385, -0.467611, -3.141723, 1, 1, 1, 1, 1,
-1.051342, 0.9811813, -1.824658, 1, 1, 1, 1, 1,
-1.046305, -0.07155342, -1.407328, 1, 1, 1, 1, 1,
-1.04266, 0.3562158, -2.16629, 1, 1, 1, 1, 1,
-1.042657, 2.00098, -1.042124, 1, 1, 1, 1, 1,
-1.036116, 0.2030505, -0.565116, 0, 0, 1, 1, 1,
-1.031276, 2.493057, -0.3292982, 1, 0, 0, 1, 1,
-1.028913, 0.3371487, -1.193892, 1, 0, 0, 1, 1,
-1.028249, -0.04127397, 0.4979816, 1, 0, 0, 1, 1,
-1.024973, 0.2361928, -1.286602, 1, 0, 0, 1, 1,
-1.023552, 1.33087, -2.293167, 1, 0, 0, 1, 1,
-1.021593, -0.3715141, -3.245064, 0, 0, 0, 1, 1,
-1.020865, 3.262967, -0.4570454, 0, 0, 0, 1, 1,
-1.018786, -0.9139215, -2.170074, 0, 0, 0, 1, 1,
-1.015202, 1.885529, -0.7561262, 0, 0, 0, 1, 1,
-1.010258, 0.03103229, 0.5008261, 0, 0, 0, 1, 1,
-1.008811, -1.133553, -3.622922, 0, 0, 0, 1, 1,
-1.003464, -1.047526, -2.663574, 0, 0, 0, 1, 1,
-0.9998729, 0.8332761, -0.5138612, 1, 1, 1, 1, 1,
-0.9915467, 0.6013898, -0.6267668, 1, 1, 1, 1, 1,
-0.9636322, 2.586216, 0.1861232, 1, 1, 1, 1, 1,
-0.959442, -1.261687, -1.965026, 1, 1, 1, 1, 1,
-0.9544539, -0.02986342, -0.7699068, 1, 1, 1, 1, 1,
-0.9526502, 0.345502, -1.545454, 1, 1, 1, 1, 1,
-0.9458437, -1.299316, -3.177465, 1, 1, 1, 1, 1,
-0.9436365, 1.398062, -0.2309509, 1, 1, 1, 1, 1,
-0.9435593, -0.9331391, -1.386741, 1, 1, 1, 1, 1,
-0.9395809, 0.1725682, -1.938596, 1, 1, 1, 1, 1,
-0.9381155, -0.03901966, -0.7864596, 1, 1, 1, 1, 1,
-0.9313289, 0.2658319, -2.545207, 1, 1, 1, 1, 1,
-0.9208244, 0.7199369, -0.01816145, 1, 1, 1, 1, 1,
-0.9157685, -1.668794, -1.672266, 1, 1, 1, 1, 1,
-0.9108387, 0.04056395, -2.972201, 1, 1, 1, 1, 1,
-0.9106554, 0.2098162, -0.80683, 0, 0, 1, 1, 1,
-0.9099647, 0.2429289, -1.49085, 1, 0, 0, 1, 1,
-0.9063206, -0.3733649, -1.076449, 1, 0, 0, 1, 1,
-0.9048361, -0.008475405, -1.648235, 1, 0, 0, 1, 1,
-0.8944807, -0.5517162, -1.30074, 1, 0, 0, 1, 1,
-0.8853133, -1.444749, -5.393267, 1, 0, 0, 1, 1,
-0.8838616, -0.2421513, -2.342705, 0, 0, 0, 1, 1,
-0.8820035, 0.3580245, -1.761915, 0, 0, 0, 1, 1,
-0.8791025, -0.2889416, -0.1556073, 0, 0, 0, 1, 1,
-0.876554, -0.65535, -3.122492, 0, 0, 0, 1, 1,
-0.8710585, 0.6867219, -1.486388, 0, 0, 0, 1, 1,
-0.8704454, -0.650668, -2.321866, 0, 0, 0, 1, 1,
-0.8673944, 0.9561601, -0.3930071, 0, 0, 0, 1, 1,
-0.8646237, -0.4497193, -1.579929, 1, 1, 1, 1, 1,
-0.8621271, 2.118609, -0.2980092, 1, 1, 1, 1, 1,
-0.8547882, 0.4030216, -1.543896, 1, 1, 1, 1, 1,
-0.8473328, -0.4717855, -2.47618, 1, 1, 1, 1, 1,
-0.8434262, -0.8035089, -1.332051, 1, 1, 1, 1, 1,
-0.8431883, 0.04023653, -2.245872, 1, 1, 1, 1, 1,
-0.8400853, 2.121168, -0.2457456, 1, 1, 1, 1, 1,
-0.8337373, -1.139449, -2.632135, 1, 1, 1, 1, 1,
-0.8337018, -0.6329502, -1.174878, 1, 1, 1, 1, 1,
-0.8145716, 1.264629, -0.3348273, 1, 1, 1, 1, 1,
-0.8108227, 0.749121, 1.043495, 1, 1, 1, 1, 1,
-0.8023891, -0.2292871, -1.978298, 1, 1, 1, 1, 1,
-0.7995831, -0.7680798, -1.508183, 1, 1, 1, 1, 1,
-0.7929325, 0.5218655, -3.730199, 1, 1, 1, 1, 1,
-0.7875391, 0.2663894, -1.501087, 1, 1, 1, 1, 1,
-0.7839574, 0.3113691, -1.497592, 0, 0, 1, 1, 1,
-0.7796045, 1.395194, -0.4515826, 1, 0, 0, 1, 1,
-0.7752876, 0.7691367, -0.7992958, 1, 0, 0, 1, 1,
-0.7676671, 1.495168, -0.5177275, 1, 0, 0, 1, 1,
-0.766522, 0.7726844, 0.2465927, 1, 0, 0, 1, 1,
-0.764055, 1.698026, -0.9208743, 1, 0, 0, 1, 1,
-0.7639676, -1.082541, -3.920492, 0, 0, 0, 1, 1,
-0.7625396, 0.6423914, -1.257558, 0, 0, 0, 1, 1,
-0.7566367, 1.029797, 0.7294949, 0, 0, 0, 1, 1,
-0.7512076, -1.180491, -1.553729, 0, 0, 0, 1, 1,
-0.7440511, -0.6286068, -3.30782, 0, 0, 0, 1, 1,
-0.7399452, -1.649369, -2.787323, 0, 0, 0, 1, 1,
-0.7337813, -0.5302888, -3.023742, 0, 0, 0, 1, 1,
-0.7314982, -0.7150123, -2.497066, 1, 1, 1, 1, 1,
-0.7212461, 0.5970728, -0.08672214, 1, 1, 1, 1, 1,
-0.7202215, 0.3337219, -0.5034418, 1, 1, 1, 1, 1,
-0.7202162, -0.7068796, -2.087289, 1, 1, 1, 1, 1,
-0.7181296, -0.0840189, -2.092483, 1, 1, 1, 1, 1,
-0.7127484, -0.2228779, -3.028121, 1, 1, 1, 1, 1,
-0.711995, -0.6231744, -2.745528, 1, 1, 1, 1, 1,
-0.7096962, 0.5021217, 0.3461699, 1, 1, 1, 1, 1,
-0.7093734, -1.458048, -1.351159, 1, 1, 1, 1, 1,
-0.70628, 0.2740176, -2.20396, 1, 1, 1, 1, 1,
-0.7050416, 0.5453693, -2.08495, 1, 1, 1, 1, 1,
-0.7028653, -0.4771821, -2.996882, 1, 1, 1, 1, 1,
-0.6992842, 2.259385, 0.01983469, 1, 1, 1, 1, 1,
-0.6967596, -0.09770879, -1.343905, 1, 1, 1, 1, 1,
-0.6955672, -1.509592, -4.463649, 1, 1, 1, 1, 1,
-0.6951598, 1.592136, -0.7485569, 0, 0, 1, 1, 1,
-0.6951146, -0.1917942, -3.077994, 1, 0, 0, 1, 1,
-0.6937701, -1.196019, -2.014919, 1, 0, 0, 1, 1,
-0.6893654, -1.86836, -2.352866, 1, 0, 0, 1, 1,
-0.6834942, -0.8767578, -2.671552, 1, 0, 0, 1, 1,
-0.6769599, -0.4475871, -1.877935, 1, 0, 0, 1, 1,
-0.6693352, 0.3946458, 0.06359466, 0, 0, 0, 1, 1,
-0.668381, 1.131981, -1.434107, 0, 0, 0, 1, 1,
-0.6643069, 0.1768659, -2.433554, 0, 0, 0, 1, 1,
-0.6595057, 0.1662394, -2.147484, 0, 0, 0, 1, 1,
-0.6478687, -0.2404724, -3.178387, 0, 0, 0, 1, 1,
-0.6420059, 0.5058387, -1.064387, 0, 0, 0, 1, 1,
-0.6347103, -0.09897566, -2.27328, 0, 0, 0, 1, 1,
-0.6328545, 0.0235323, -2.977923, 1, 1, 1, 1, 1,
-0.6318569, -0.1566942, -2.624095, 1, 1, 1, 1, 1,
-0.6274449, 0.007658711, -1.627403, 1, 1, 1, 1, 1,
-0.6245313, 0.8338282, 0.7212651, 1, 1, 1, 1, 1,
-0.6226811, 2.395108, 0.3912794, 1, 1, 1, 1, 1,
-0.618601, -1.634146, -3.024904, 1, 1, 1, 1, 1,
-0.6159649, -0.1972001, -3.099118, 1, 1, 1, 1, 1,
-0.609653, -0.0537568, -1.315848, 1, 1, 1, 1, 1,
-0.6062392, 1.564296, -0.3805401, 1, 1, 1, 1, 1,
-0.6047667, 1.507124, -0.876619, 1, 1, 1, 1, 1,
-0.6042547, -0.7545871, -2.619376, 1, 1, 1, 1, 1,
-0.6018285, 0.3629241, -1.789917, 1, 1, 1, 1, 1,
-0.6013888, 0.6261056, -1.214209, 1, 1, 1, 1, 1,
-0.5974888, -1.098345, -2.9187, 1, 1, 1, 1, 1,
-0.5957292, 1.288911, -0.4667373, 1, 1, 1, 1, 1,
-0.5952168, -0.501817, -2.924573, 0, 0, 1, 1, 1,
-0.5903611, -0.6222573, -1.826489, 1, 0, 0, 1, 1,
-0.5889996, -0.6130795, -4.175849, 1, 0, 0, 1, 1,
-0.5867698, -0.1544464, -2.401927, 1, 0, 0, 1, 1,
-0.5845791, 0.5082814, 0.4306118, 1, 0, 0, 1, 1,
-0.5796121, 0.249948, -0.1130863, 1, 0, 0, 1, 1,
-0.5792346, -0.5294946, -3.696577, 0, 0, 0, 1, 1,
-0.5787138, 1.198151, -0.4238836, 0, 0, 0, 1, 1,
-0.5783982, 0.8752439, -0.3860638, 0, 0, 0, 1, 1,
-0.5749344, 0.7589999, 0.1835254, 0, 0, 0, 1, 1,
-0.5717798, 1.44696, -2.007289, 0, 0, 0, 1, 1,
-0.5710982, -1.036881, -2.838681, 0, 0, 0, 1, 1,
-0.5705647, -0.8226929, -3.079037, 0, 0, 0, 1, 1,
-0.5671124, 0.4145111, -0.4243357, 1, 1, 1, 1, 1,
-0.5616932, 0.5175793, -0.7763961, 1, 1, 1, 1, 1,
-0.5609683, -1.054989, -5.53611, 1, 1, 1, 1, 1,
-0.5541657, 0.1245417, -2.622461, 1, 1, 1, 1, 1,
-0.5529583, -0.7991495, -2.162139, 1, 1, 1, 1, 1,
-0.5518359, 0.07768177, -2.233273, 1, 1, 1, 1, 1,
-0.5511427, -1.034897, -1.130548, 1, 1, 1, 1, 1,
-0.5499591, 0.5706944, -0.402641, 1, 1, 1, 1, 1,
-0.5481808, 0.02805507, 0.1173942, 1, 1, 1, 1, 1,
-0.5423039, 0.2687384, -0.4164112, 1, 1, 1, 1, 1,
-0.5357571, -0.4136747, -1.759199, 1, 1, 1, 1, 1,
-0.5335075, -0.6933345, -0.7856762, 1, 1, 1, 1, 1,
-0.5328696, -0.452649, -2.953385, 1, 1, 1, 1, 1,
-0.532551, -0.04911184, -2.881054, 1, 1, 1, 1, 1,
-0.5260267, 0.1651921, -2.244116, 1, 1, 1, 1, 1,
-0.5220855, 1.124749, -0.8137109, 0, 0, 1, 1, 1,
-0.5209359, -0.293756, -3.619486, 1, 0, 0, 1, 1,
-0.519078, 0.06398855, -2.814415, 1, 0, 0, 1, 1,
-0.5187338, -0.8806931, -2.363204, 1, 0, 0, 1, 1,
-0.5184644, 1.301615, -0.3914548, 1, 0, 0, 1, 1,
-0.5183958, -0.1735152, -2.848685, 1, 0, 0, 1, 1,
-0.5121279, 0.1257876, -0.5502209, 0, 0, 0, 1, 1,
-0.507816, 1.756005, 0.8657584, 0, 0, 0, 1, 1,
-0.507153, -0.0392785, -0.9512544, 0, 0, 0, 1, 1,
-0.5071131, -0.7281025, -2.641191, 0, 0, 0, 1, 1,
-0.5054846, 0.5084513, -0.5284405, 0, 0, 0, 1, 1,
-0.5042727, -2.051622, -0.5321053, 0, 0, 0, 1, 1,
-0.5036536, -0.003931823, -2.504952, 0, 0, 0, 1, 1,
-0.5034069, 0.649634, -2.321378, 1, 1, 1, 1, 1,
-0.4992531, 0.4011997, -1.556513, 1, 1, 1, 1, 1,
-0.49041, -0.7061466, -2.953477, 1, 1, 1, 1, 1,
-0.4843614, 2.02565, -0.06035051, 1, 1, 1, 1, 1,
-0.4819656, 0.695673, -0.9991078, 1, 1, 1, 1, 1,
-0.4802299, -0.05417108, -1.592768, 1, 1, 1, 1, 1,
-0.4792261, -0.6126035, -3.343212, 1, 1, 1, 1, 1,
-0.4754729, -0.8840446, 0.707109, 1, 1, 1, 1, 1,
-0.4737941, -2.186937, -3.199534, 1, 1, 1, 1, 1,
-0.4670269, 0.6135859, 0.6599936, 1, 1, 1, 1, 1,
-0.4662953, 1.289781, -0.5258972, 1, 1, 1, 1, 1,
-0.4592374, 0.4357338, -1.720451, 1, 1, 1, 1, 1,
-0.4469842, 0.6731744, -2.100813, 1, 1, 1, 1, 1,
-0.4367602, -0.8913811, -2.216089, 1, 1, 1, 1, 1,
-0.428096, 0.4386276, 0.4867938, 1, 1, 1, 1, 1,
-0.4280272, 1.62551, -1.364038, 0, 0, 1, 1, 1,
-0.4220375, 0.5444372, -1.097489, 1, 0, 0, 1, 1,
-0.4219027, 0.3045898, -0.6932616, 1, 0, 0, 1, 1,
-0.4156698, -0.3809098, -2.524245, 1, 0, 0, 1, 1,
-0.4126525, 1.267309, -1.46034, 1, 0, 0, 1, 1,
-0.4122301, -0.8612277, -2.382726, 1, 0, 0, 1, 1,
-0.4111298, -1.229231, -1.056688, 0, 0, 0, 1, 1,
-0.4041346, -0.5220059, -1.519416, 0, 0, 0, 1, 1,
-0.4031508, -0.5688619, -0.8537609, 0, 0, 0, 1, 1,
-0.4011353, -0.2821031, -0.6019381, 0, 0, 0, 1, 1,
-0.3968872, -0.2733143, -1.936831, 0, 0, 0, 1, 1,
-0.3967278, -0.7825929, -1.713821, 0, 0, 0, 1, 1,
-0.3957978, 0.831874, -0.3479318, 0, 0, 0, 1, 1,
-0.3931172, -0.2487141, -2.70464, 1, 1, 1, 1, 1,
-0.3920036, 1.500267, 0.3878653, 1, 1, 1, 1, 1,
-0.389462, 1.545683, -0.07112706, 1, 1, 1, 1, 1,
-0.3879892, -0.6845034, -1.783536, 1, 1, 1, 1, 1,
-0.3834102, -0.8452098, -2.035715, 1, 1, 1, 1, 1,
-0.3787027, -0.2274985, -1.631416, 1, 1, 1, 1, 1,
-0.3744925, 1.742517, 0.199206, 1, 1, 1, 1, 1,
-0.3695897, -0.04550823, -1.817854, 1, 1, 1, 1, 1,
-0.3679346, -0.3188724, -2.051073, 1, 1, 1, 1, 1,
-0.3657832, 1.544953, -0.4307746, 1, 1, 1, 1, 1,
-0.3653047, -0.3664561, -3.238034, 1, 1, 1, 1, 1,
-0.3650053, 0.5255178, -0.3938684, 1, 1, 1, 1, 1,
-0.36251, 0.8580473, 0.5376941, 1, 1, 1, 1, 1,
-0.3605514, 0.8161845, 0.9593686, 1, 1, 1, 1, 1,
-0.3540812, 0.5545897, -1.383052, 1, 1, 1, 1, 1,
-0.3483889, -1.348405, -3.634939, 0, 0, 1, 1, 1,
-0.3358064, 0.5528765, -1.269576, 1, 0, 0, 1, 1,
-0.3262636, -1.208531, -3.134127, 1, 0, 0, 1, 1,
-0.3257912, -0.4170307, -1.530642, 1, 0, 0, 1, 1,
-0.3222161, -0.0557646, -1.524132, 1, 0, 0, 1, 1,
-0.3221195, 1.775267, 0.5788654, 1, 0, 0, 1, 1,
-0.3216958, 0.8064117, -0.4526221, 0, 0, 0, 1, 1,
-0.3206696, -0.5088502, -3.076322, 0, 0, 0, 1, 1,
-0.3173009, -0.07300857, -2.618662, 0, 0, 0, 1, 1,
-0.3154282, 0.1179622, -3.032705, 0, 0, 0, 1, 1,
-0.312519, -0.8569942, -1.895712, 0, 0, 0, 1, 1,
-0.306204, 0.1240091, -0.1788094, 0, 0, 0, 1, 1,
-0.3060348, -0.9090002, -1.843884, 0, 0, 0, 1, 1,
-0.3043469, -1.413146, -2.698354, 1, 1, 1, 1, 1,
-0.300605, -0.8558838, -2.490013, 1, 1, 1, 1, 1,
-0.3005075, -0.1811678, -3.116422, 1, 1, 1, 1, 1,
-0.2962954, 0.07213328, 0.4440005, 1, 1, 1, 1, 1,
-0.2916884, 1.042016, 1.219202, 1, 1, 1, 1, 1,
-0.2901989, 0.6002983, 0.2369695, 1, 1, 1, 1, 1,
-0.2822904, -0.7477834, -3.691662, 1, 1, 1, 1, 1,
-0.2805775, -0.4865267, -2.262502, 1, 1, 1, 1, 1,
-0.2777984, -0.6080995, -1.97629, 1, 1, 1, 1, 1,
-0.2713566, 0.01198192, -0.9489182, 1, 1, 1, 1, 1,
-0.2710399, -1.094754, -4.733497, 1, 1, 1, 1, 1,
-0.2624132, -0.8860275, -2.396754, 1, 1, 1, 1, 1,
-0.2620517, 0.3883491, -1.216935, 1, 1, 1, 1, 1,
-0.2593951, -1.500155, -4.998993, 1, 1, 1, 1, 1,
-0.2576768, -0.1697985, -0.5719998, 1, 1, 1, 1, 1,
-0.2516529, -1.085662, -3.673858, 0, 0, 1, 1, 1,
-0.2488614, -1.420401, -4.175665, 1, 0, 0, 1, 1,
-0.2415645, -0.4562442, -1.396707, 1, 0, 0, 1, 1,
-0.2366731, 1.129762, 1.067141, 1, 0, 0, 1, 1,
-0.2331348, -0.5273764, -3.153646, 1, 0, 0, 1, 1,
-0.229468, -1.244619, -3.763489, 1, 0, 0, 1, 1,
-0.228717, 0.5444295, -0.3064258, 0, 0, 0, 1, 1,
-0.2266688, -3.851366, -3.589121, 0, 0, 0, 1, 1,
-0.2261073, -1.268063, -3.610934, 0, 0, 0, 1, 1,
-0.2178152, -0.2719967, -4.036617, 0, 0, 0, 1, 1,
-0.2169134, -2.157786, -3.543927, 0, 0, 0, 1, 1,
-0.2148113, -1.664948, -3.443624, 0, 0, 0, 1, 1,
-0.2134584, 0.6179256, -1.2782, 0, 0, 0, 1, 1,
-0.212571, -0.656127, -3.162347, 1, 1, 1, 1, 1,
-0.2121347, -0.4796781, -2.619339, 1, 1, 1, 1, 1,
-0.2077614, 0.5241441, 0.2560551, 1, 1, 1, 1, 1,
-0.202807, -1.32561, -4.60706, 1, 1, 1, 1, 1,
-0.2021184, 0.09549706, -1.993943, 1, 1, 1, 1, 1,
-0.2012455, 0.8910888, -0.9219782, 1, 1, 1, 1, 1,
-0.1968215, 0.1838006, -0.1822118, 1, 1, 1, 1, 1,
-0.1956019, 1.398008, -0.7147084, 1, 1, 1, 1, 1,
-0.1948837, -0.1344166, -2.226162, 1, 1, 1, 1, 1,
-0.1912183, 0.2428785, 0.5778634, 1, 1, 1, 1, 1,
-0.1844453, -0.6876039, -2.293529, 1, 1, 1, 1, 1,
-0.1789011, 1.213743, -0.3328772, 1, 1, 1, 1, 1,
-0.1780657, 0.1928988, -0.7769293, 1, 1, 1, 1, 1,
-0.1731962, -0.2090927, -1.257693, 1, 1, 1, 1, 1,
-0.1719104, 0.8129476, -0.3518749, 1, 1, 1, 1, 1,
-0.1666568, -0.7400213, -2.231995, 0, 0, 1, 1, 1,
-0.1655549, -0.878737, -3.877103, 1, 0, 0, 1, 1,
-0.1648243, -0.3113115, -2.690067, 1, 0, 0, 1, 1,
-0.1624085, 0.05954954, -2.280472, 1, 0, 0, 1, 1,
-0.1600014, -0.001577249, -3.255762, 1, 0, 0, 1, 1,
-0.1597254, 0.5688344, -2.338142, 1, 0, 0, 1, 1,
-0.15967, 1.775494, 0.3877957, 0, 0, 0, 1, 1,
-0.1546786, 1.839955, 1.116747, 0, 0, 0, 1, 1,
-0.1539116, -0.5545655, -4.488986, 0, 0, 0, 1, 1,
-0.1522387, -0.08638695, -1.512616, 0, 0, 0, 1, 1,
-0.1499661, 0.5920359, 0.428503, 0, 0, 0, 1, 1,
-0.1474802, 3.29028, -0.02137266, 0, 0, 0, 1, 1,
-0.1420073, 0.06530984, -1.233798, 0, 0, 0, 1, 1,
-0.1354373, 0.1154103, -0.1213347, 1, 1, 1, 1, 1,
-0.1347591, 0.3989368, -0.6203899, 1, 1, 1, 1, 1,
-0.1340919, -0.1751087, -0.3264476, 1, 1, 1, 1, 1,
-0.1304342, -0.09973771, -2.363615, 1, 1, 1, 1, 1,
-0.127121, -0.536191, -2.781465, 1, 1, 1, 1, 1,
-0.1258281, 0.07378059, -0.9540238, 1, 1, 1, 1, 1,
-0.1213509, -0.2096082, -1.012266, 1, 1, 1, 1, 1,
-0.1211577, 0.3648905, -0.2918454, 1, 1, 1, 1, 1,
-0.1208118, 0.4686084, 1.381751, 1, 1, 1, 1, 1,
-0.1186508, -1.455329, -4.870174, 1, 1, 1, 1, 1,
-0.1147847, 0.7013304, -2.230779, 1, 1, 1, 1, 1,
-0.1087015, 0.2560591, -0.3755534, 1, 1, 1, 1, 1,
-0.1066286, -0.5784097, -3.740401, 1, 1, 1, 1, 1,
-0.1062044, 0.6102331, -1.958511, 1, 1, 1, 1, 1,
-0.1001683, -0.7734979, -3.611244, 1, 1, 1, 1, 1,
-0.09840047, -0.1174887, -3.447308, 0, 0, 1, 1, 1,
-0.09784218, 0.2521547, -1.861997, 1, 0, 0, 1, 1,
-0.09706186, -2.209887, -1.635782, 1, 0, 0, 1, 1,
-0.09614491, 0.09058187, -1.399092, 1, 0, 0, 1, 1,
-0.09191973, -0.7928867, -3.304939, 1, 0, 0, 1, 1,
-0.09007224, 0.6207802, -0.1674257, 1, 0, 0, 1, 1,
-0.08619178, 0.3542294, 0.2516596, 0, 0, 0, 1, 1,
-0.08464053, 0.1830499, -1.339394, 0, 0, 0, 1, 1,
-0.075124, 1.052266, -1.249407, 0, 0, 0, 1, 1,
-0.07484913, 1.539062, -0.3102892, 0, 0, 0, 1, 1,
-0.06940762, -0.3478653, -3.190416, 0, 0, 0, 1, 1,
-0.06928225, 1.086716, -0.615839, 0, 0, 0, 1, 1,
-0.06675414, -0.4198565, -4.303809, 0, 0, 0, 1, 1,
-0.06634541, -0.3821679, -2.840319, 1, 1, 1, 1, 1,
-0.06447131, -0.1793655, -2.13231, 1, 1, 1, 1, 1,
-0.0593657, -0.06592038, -2.009475, 1, 1, 1, 1, 1,
-0.05753163, -0.5677564, -3.188371, 1, 1, 1, 1, 1,
-0.05689541, -1.194793, -1.849548, 1, 1, 1, 1, 1,
-0.05640463, -0.07315876, -5.284764, 1, 1, 1, 1, 1,
-0.0527334, -0.9044518, -2.288224, 1, 1, 1, 1, 1,
-0.05162381, 1.189297, 0.4582, 1, 1, 1, 1, 1,
-0.04947693, -0.3845277, -1.937913, 1, 1, 1, 1, 1,
-0.04362057, -0.4672284, -4.352382, 1, 1, 1, 1, 1,
-0.04339619, 0.4177444, -0.6439924, 1, 1, 1, 1, 1,
-0.03959854, -0.7218936, -1.638224, 1, 1, 1, 1, 1,
-0.03805054, -1.084881, -4.081183, 1, 1, 1, 1, 1,
-0.03777968, 1.6021, -0.4701416, 1, 1, 1, 1, 1,
-0.03035973, 0.6874689, 2.17855, 1, 1, 1, 1, 1,
-0.02711742, 0.7877284, -0.4602772, 0, 0, 1, 1, 1,
-0.02385331, -0.3356595, -2.806847, 1, 0, 0, 1, 1,
-0.02352788, -0.05484992, -3.637431, 1, 0, 0, 1, 1,
-0.02040146, 1.420953, -0.822433, 1, 0, 0, 1, 1,
-0.01441936, -0.3518815, -3.230626, 1, 0, 0, 1, 1,
-0.01308514, 0.1315878, -0.401379, 1, 0, 0, 1, 1,
-0.0121964, 1.646255, 0.9195544, 0, 0, 0, 1, 1,
-0.01037982, -0.1601902, -3.283136, 0, 0, 0, 1, 1,
-0.008911036, -0.8142213, -2.927714, 0, 0, 0, 1, 1,
-0.008001493, -0.3142973, -3.793924, 0, 0, 0, 1, 1,
-0.005625592, -0.1234403, -3.265197, 0, 0, 0, 1, 1,
-0.005229645, 0.8108371, 1.148499, 0, 0, 0, 1, 1,
-0.004037105, 0.2584454, 0.01184698, 0, 0, 0, 1, 1,
-0.00257754, 0.7512378, -1.368628, 1, 1, 1, 1, 1,
-0.0009925629, -0.2856126, -2.90414, 1, 1, 1, 1, 1,
0.0001755282, 0.8103563, -0.5671352, 1, 1, 1, 1, 1,
0.0005363051, -1.533582, 5.396339, 1, 1, 1, 1, 1,
0.002935487, 1.157015, -0.3354472, 1, 1, 1, 1, 1,
0.007097251, 0.8097368, -0.6004691, 1, 1, 1, 1, 1,
0.008605638, 1.888453, -0.5597723, 1, 1, 1, 1, 1,
0.0114256, 1.472249, -1.771017, 1, 1, 1, 1, 1,
0.0150419, -0.9750199, 3.975997, 1, 1, 1, 1, 1,
0.01725982, 1.653584, -0.5872083, 1, 1, 1, 1, 1,
0.02061646, -1.787127, 4.47602, 1, 1, 1, 1, 1,
0.02317003, 0.03920406, -0.6401834, 1, 1, 1, 1, 1,
0.02329194, -1.513665, 2.789297, 1, 1, 1, 1, 1,
0.02389309, 0.9495515, 0.07940034, 1, 1, 1, 1, 1,
0.02886713, 1.070855, -1.609692, 1, 1, 1, 1, 1,
0.03096465, -1.03823, 4.747501, 0, 0, 1, 1, 1,
0.03105478, 0.2396466, 1.348395, 1, 0, 0, 1, 1,
0.03464359, -1.558228, 4.158655, 1, 0, 0, 1, 1,
0.04025312, 0.07514008, 2.913381, 1, 0, 0, 1, 1,
0.04051719, -1.031804, 5.548544, 1, 0, 0, 1, 1,
0.04266369, 2.022791, 0.0132659, 1, 0, 0, 1, 1,
0.04326624, -1.557631, 4.143407, 0, 0, 0, 1, 1,
0.04914044, -0.02432962, 2.382647, 0, 0, 0, 1, 1,
0.04964532, 0.3663261, -1.899688, 0, 0, 0, 1, 1,
0.04990104, 0.7707889, -0.1467208, 0, 0, 0, 1, 1,
0.05201959, -0.845952, 3.8026, 0, 0, 0, 1, 1,
0.05246745, 0.04134444, 0.02131101, 0, 0, 0, 1, 1,
0.05431471, -0.9489584, 2.010528, 0, 0, 0, 1, 1,
0.05619248, -0.3848142, 2.531315, 1, 1, 1, 1, 1,
0.0597308, 1.836137, 0.951263, 1, 1, 1, 1, 1,
0.06105996, -1.208999, 4.009488, 1, 1, 1, 1, 1,
0.06582981, -0.1948455, 1.388967, 1, 1, 1, 1, 1,
0.0739486, 1.349786, -1.239132, 1, 1, 1, 1, 1,
0.07461188, -0.06791973, 1.534252, 1, 1, 1, 1, 1,
0.07721382, -0.8283982, 3.889999, 1, 1, 1, 1, 1,
0.07910713, 0.2965789, 0.3293865, 1, 1, 1, 1, 1,
0.07997431, -0.2833621, 2.672617, 1, 1, 1, 1, 1,
0.08049254, -0.02257963, 2.053866, 1, 1, 1, 1, 1,
0.08325971, 0.2785634, 1.790236, 1, 1, 1, 1, 1,
0.09430484, -0.6480014, 3.315063, 1, 1, 1, 1, 1,
0.09616408, 0.2554847, -0.9236016, 1, 1, 1, 1, 1,
0.0994627, 0.3720855, 0.7644402, 1, 1, 1, 1, 1,
0.1023128, 1.025941, 1.058859, 1, 1, 1, 1, 1,
0.1031807, -1.532353, 4.206785, 0, 0, 1, 1, 1,
0.116512, 0.2887874, 1.475184, 1, 0, 0, 1, 1,
0.1205543, 0.2053242, -0.6642992, 1, 0, 0, 1, 1,
0.1250577, -0.9491073, 2.356693, 1, 0, 0, 1, 1,
0.1262652, -1.245811, 3.548862, 1, 0, 0, 1, 1,
0.1269934, 1.233281, -0.8157829, 1, 0, 0, 1, 1,
0.1273721, 0.9055592, 0.4603699, 0, 0, 0, 1, 1,
0.1481809, 0.2506438, 1.520853, 0, 0, 0, 1, 1,
0.1491719, 1.751425, 1.952525, 0, 0, 0, 1, 1,
0.1512907, 0.5870799, 0.1078896, 0, 0, 0, 1, 1,
0.1588174, -0.7281053, 2.093851, 0, 0, 0, 1, 1,
0.1619309, -0.0133637, 2.127127, 0, 0, 0, 1, 1,
0.1651705, -0.9701049, 2.276077, 0, 0, 0, 1, 1,
0.1654225, -1.01256, 4.777119, 1, 1, 1, 1, 1,
0.1672077, 0.3882669, 0.3539722, 1, 1, 1, 1, 1,
0.1679362, -0.6088074, 1.951776, 1, 1, 1, 1, 1,
0.1755367, -0.1784433, 2.036649, 1, 1, 1, 1, 1,
0.1758509, -0.09673835, 3.261544, 1, 1, 1, 1, 1,
0.1764795, 0.2243616, 1.268113, 1, 1, 1, 1, 1,
0.1774665, -0.402468, 2.472252, 1, 1, 1, 1, 1,
0.1786104, 0.8670068, 0.4438819, 1, 1, 1, 1, 1,
0.188656, 1.269784, 0.7980506, 1, 1, 1, 1, 1,
0.1929372, 0.117068, 0.5990176, 1, 1, 1, 1, 1,
0.1940013, 2.033375, -0.9445249, 1, 1, 1, 1, 1,
0.1966248, 0.8450183, 0.6084629, 1, 1, 1, 1, 1,
0.2025922, 0.2748968, -0.1028825, 1, 1, 1, 1, 1,
0.2027746, 0.8535289, 1.380348, 1, 1, 1, 1, 1,
0.2037645, 1.813258, -0.2901117, 1, 1, 1, 1, 1,
0.2082705, 0.7225896, 0.4508067, 0, 0, 1, 1, 1,
0.2083271, 1.382903, -0.4186759, 1, 0, 0, 1, 1,
0.2099113, -1.543078, 4.777802, 1, 0, 0, 1, 1,
0.214532, -0.5116683, 2.65658, 1, 0, 0, 1, 1,
0.2161963, -0.8491066, 2.75702, 1, 0, 0, 1, 1,
0.216743, 0.8950297, 0.04727463, 1, 0, 0, 1, 1,
0.2175075, 0.7981132, 0.1817, 0, 0, 0, 1, 1,
0.2199579, -0.2412959, 2.186501, 0, 0, 0, 1, 1,
0.220602, 0.6354405, 0.1968156, 0, 0, 0, 1, 1,
0.2218112, -0.3475064, 3.691097, 0, 0, 0, 1, 1,
0.2224297, -1.980513, 1.217707, 0, 0, 0, 1, 1,
0.2265096, -1.032641, 2.022658, 0, 0, 0, 1, 1,
0.2314325, 1.750162, -0.4236554, 0, 0, 0, 1, 1,
0.2332206, -2.168128, 3.454709, 1, 1, 1, 1, 1,
0.2338768, 0.2806807, 1.151557, 1, 1, 1, 1, 1,
0.235917, -0.5585208, 2.213931, 1, 1, 1, 1, 1,
0.2379512, -0.2076729, 0.8176311, 1, 1, 1, 1, 1,
0.2390601, -0.920042, 3.795527, 1, 1, 1, 1, 1,
0.2393122, -1.665847, 3.176994, 1, 1, 1, 1, 1,
0.2398158, -1.110626, 4.307006, 1, 1, 1, 1, 1,
0.2416256, -0.8983927, 2.328564, 1, 1, 1, 1, 1,
0.2437644, 0.1847663, 1.845095, 1, 1, 1, 1, 1,
0.2470779, 0.3736235, 0.8696217, 1, 1, 1, 1, 1,
0.2486495, 1.29152, -1.247417, 1, 1, 1, 1, 1,
0.2501435, 0.2226326, 1.035188, 1, 1, 1, 1, 1,
0.2513392, -1.207696, 1.92573, 1, 1, 1, 1, 1,
0.2526951, -0.8191383, 1.230557, 1, 1, 1, 1, 1,
0.2529363, -1.6545, 0.9453564, 1, 1, 1, 1, 1,
0.2588729, -0.6885043, 2.183684, 0, 0, 1, 1, 1,
0.2588951, 0.2166455, 0.9867401, 1, 0, 0, 1, 1,
0.2612442, -1.149894, 3.522394, 1, 0, 0, 1, 1,
0.262074, 0.1957495, 1.928196, 1, 0, 0, 1, 1,
0.262358, 2.387783, 0.2033886, 1, 0, 0, 1, 1,
0.2659971, -2.358192, 2.294847, 1, 0, 0, 1, 1,
0.2665816, -0.2366757, 3.86169, 0, 0, 0, 1, 1,
0.2692028, -0.1132383, 1.477149, 0, 0, 0, 1, 1,
0.2770542, 2.181229, 0.2113708, 0, 0, 0, 1, 1,
0.2803998, -0.588151, 3.234946, 0, 0, 0, 1, 1,
0.2818779, -0.2958093, 2.363097, 0, 0, 0, 1, 1,
0.2916858, -0.5741323, 3.212158, 0, 0, 0, 1, 1,
0.2956439, -0.5568917, 2.289719, 0, 0, 0, 1, 1,
0.2959, 0.01077665, 0.5439655, 1, 1, 1, 1, 1,
0.2966391, 1.177506, -1.250158, 1, 1, 1, 1, 1,
0.2975271, 0.6396865, 1.515722, 1, 1, 1, 1, 1,
0.300176, -0.3029356, 1.899776, 1, 1, 1, 1, 1,
0.3002464, -1.429738, 3.12821, 1, 1, 1, 1, 1,
0.3062539, 0.5655387, -7.570357e-05, 1, 1, 1, 1, 1,
0.3079686, -0.3545835, 2.491162, 1, 1, 1, 1, 1,
0.3191794, 0.9326412, 2.352429, 1, 1, 1, 1, 1,
0.3223831, 0.817704, 1.424768, 1, 1, 1, 1, 1,
0.3240922, 0.4016058, 0.8489659, 1, 1, 1, 1, 1,
0.3249763, 1.260661, -1.996613, 1, 1, 1, 1, 1,
0.3255988, -1.472948, 2.220986, 1, 1, 1, 1, 1,
0.3280526, -0.4310303, 2.298561, 1, 1, 1, 1, 1,
0.3284161, 0.9222481, -1.615547, 1, 1, 1, 1, 1,
0.329999, 2.329295, -1.814005, 1, 1, 1, 1, 1,
0.3302607, -1.178313, 2.321387, 0, 0, 1, 1, 1,
0.3314771, -0.07368324, 0.7833097, 1, 0, 0, 1, 1,
0.3364048, -0.2389518, 2.541072, 1, 0, 0, 1, 1,
0.3396351, 0.3020686, -0.5402043, 1, 0, 0, 1, 1,
0.3398031, 1.466866, 0.4265871, 1, 0, 0, 1, 1,
0.340681, 0.8965844, 0.89195, 1, 0, 0, 1, 1,
0.3410319, 1.03289, -0.692984, 0, 0, 0, 1, 1,
0.342172, -1.893269, 3.387405, 0, 0, 0, 1, 1,
0.3427797, -0.07974157, 1.464788, 0, 0, 0, 1, 1,
0.3454572, 1.282172, -0.06614076, 0, 0, 0, 1, 1,
0.3491405, -0.1937589, 2.638238, 0, 0, 0, 1, 1,
0.3512534, -2.179962, 5.014127, 0, 0, 0, 1, 1,
0.3577752, 1.226249, 1.476991, 0, 0, 0, 1, 1,
0.3583142, -0.277679, 2.33618, 1, 1, 1, 1, 1,
0.3586845, -0.4820306, 0.8839346, 1, 1, 1, 1, 1,
0.3612716, 0.07524671, -0.00303216, 1, 1, 1, 1, 1,
0.3613657, 0.3630649, 0.8568692, 1, 1, 1, 1, 1,
0.3641541, -1.795952, 2.229741, 1, 1, 1, 1, 1,
0.3703532, -0.8845949, 4.147387, 1, 1, 1, 1, 1,
0.3768528, 0.553349, 0.07070558, 1, 1, 1, 1, 1,
0.3781222, 0.1717972, 1.694366, 1, 1, 1, 1, 1,
0.3803638, 1.0829, 0.9695793, 1, 1, 1, 1, 1,
0.381813, 0.8582948, -0.2834502, 1, 1, 1, 1, 1,
0.3835529, 0.2059429, 1.983924, 1, 1, 1, 1, 1,
0.3842922, -0.2455442, 2.128389, 1, 1, 1, 1, 1,
0.3855847, -0.1844234, 3.41586, 1, 1, 1, 1, 1,
0.3866338, 1.035437, 1.782868, 1, 1, 1, 1, 1,
0.3871587, -0.04285198, 2.658413, 1, 1, 1, 1, 1,
0.3882163, -0.6754112, 1.897888, 0, 0, 1, 1, 1,
0.3883381, 0.7844217, -1.013104, 1, 0, 0, 1, 1,
0.3919323, 1.830158, 0.112155, 1, 0, 0, 1, 1,
0.4025461, -0.07488492, 2.555923, 1, 0, 0, 1, 1,
0.4044906, -1.815021, 1.696401, 1, 0, 0, 1, 1,
0.4132234, 1.45439, -0.6181098, 1, 0, 0, 1, 1,
0.4199485, 0.649069, 0.840976, 0, 0, 0, 1, 1,
0.422108, -1.024665, 1.294641, 0, 0, 0, 1, 1,
0.4243358, 0.2135374, 1.640961, 0, 0, 0, 1, 1,
0.4306958, -0.7304241, 2.374053, 0, 0, 0, 1, 1,
0.4311525, -1.516702, 3.813542, 0, 0, 0, 1, 1,
0.4367103, 0.2787977, 1.158092, 0, 0, 0, 1, 1,
0.43768, 0.6753702, 1.11708, 0, 0, 0, 1, 1,
0.4378577, 0.9188308, 0.3623367, 1, 1, 1, 1, 1,
0.4380434, 0.805989, 0.4700249, 1, 1, 1, 1, 1,
0.4411834, -0.1072058, 2.487671, 1, 1, 1, 1, 1,
0.4417326, 1.143562, 0.5506493, 1, 1, 1, 1, 1,
0.4490139, -0.774811, 2.145032, 1, 1, 1, 1, 1,
0.450621, -0.1306544, 1.211061, 1, 1, 1, 1, 1,
0.4522523, 0.942229, 0.3316058, 1, 1, 1, 1, 1,
0.4537619, -1.241767, 3.265359, 1, 1, 1, 1, 1,
0.4580034, -0.2739633, 1.127501, 1, 1, 1, 1, 1,
0.4590775, -1.363713, 2.07924, 1, 1, 1, 1, 1,
0.4628088, -0.2612748, 3.392586, 1, 1, 1, 1, 1,
0.4669793, -0.1674427, 1.101994, 1, 1, 1, 1, 1,
0.4672152, 0.8835351, 0.3293144, 1, 1, 1, 1, 1,
0.4695225, 1.251895, -1.272282, 1, 1, 1, 1, 1,
0.4747191, 0.4328631, 1.968059, 1, 1, 1, 1, 1,
0.4772947, 0.5319635, 0.7001834, 0, 0, 1, 1, 1,
0.4777827, -0.1817048, 2.247579, 1, 0, 0, 1, 1,
0.4778871, -1.196981, 2.126242, 1, 0, 0, 1, 1,
0.479026, -0.6913552, 3.670908, 1, 0, 0, 1, 1,
0.4839895, -0.5291465, 2.327422, 1, 0, 0, 1, 1,
0.4850588, -0.2871661, 1.46937, 1, 0, 0, 1, 1,
0.4851246, -0.4038133, 2.313047, 0, 0, 0, 1, 1,
0.4878717, -0.0608006, 2.582843, 0, 0, 0, 1, 1,
0.490181, 1.080561, 1.626014, 0, 0, 0, 1, 1,
0.4920088, 0.7309071, -0.9205489, 0, 0, 0, 1, 1,
0.4922549, 0.08418446, 0.6469587, 0, 0, 0, 1, 1,
0.4954473, 1.054343, -0.3961514, 0, 0, 0, 1, 1,
0.4983113, -0.8379527, 3.608729, 0, 0, 0, 1, 1,
0.4988398, 0.304034, 0.4527092, 1, 1, 1, 1, 1,
0.5073611, 1.772895, -1.254217, 1, 1, 1, 1, 1,
0.5074865, 0.5052531, 0.5971069, 1, 1, 1, 1, 1,
0.5086161, 1.066785, -0.6578184, 1, 1, 1, 1, 1,
0.5170665, 1.363467, 0.2515079, 1, 1, 1, 1, 1,
0.5190752, -0.8858234, 2.771115, 1, 1, 1, 1, 1,
0.5231519, -1.65559, 4.38846, 1, 1, 1, 1, 1,
0.5249403, -0.08693604, 0.5767637, 1, 1, 1, 1, 1,
0.526844, -2.678265, 2.232004, 1, 1, 1, 1, 1,
0.5269719, 0.6825683, -0.09158263, 1, 1, 1, 1, 1,
0.5358865, 0.1406799, 1.327284, 1, 1, 1, 1, 1,
0.5390892, 0.6130171, 1.356344, 1, 1, 1, 1, 1,
0.5395876, -0.4057082, 2.399966, 1, 1, 1, 1, 1,
0.5407358, 0.05206067, -0.6361816, 1, 1, 1, 1, 1,
0.542742, -0.8824558, 0.5738244, 1, 1, 1, 1, 1,
0.5469971, 1.082631, -0.9119047, 0, 0, 1, 1, 1,
0.5505938, -0.09066541, 1.080598, 1, 0, 0, 1, 1,
0.5533292, -0.1852119, 1.049153, 1, 0, 0, 1, 1,
0.5537738, -0.9833457, 3.943225, 1, 0, 0, 1, 1,
0.5554075, -0.1136274, 1.891672, 1, 0, 0, 1, 1,
0.5579901, -0.418236, 2.915066, 1, 0, 0, 1, 1,
0.5610096, 1.447699, 1.255629, 0, 0, 0, 1, 1,
0.5611355, -0.8409531, 3.006043, 0, 0, 0, 1, 1,
0.5682866, -0.8793629, 3.002974, 0, 0, 0, 1, 1,
0.5693823, 0.3893411, 0.9642183, 0, 0, 0, 1, 1,
0.572207, -0.01921372, 1.915275, 0, 0, 0, 1, 1,
0.5749462, 1.694598, 0.267126, 0, 0, 0, 1, 1,
0.5784948, -1.67638, 1.853023, 0, 0, 0, 1, 1,
0.5845315, -3.150586, 3.116783, 1, 1, 1, 1, 1,
0.5932332, 1.680621, -0.6662999, 1, 1, 1, 1, 1,
0.59667, 0.2693129, 2.740684, 1, 1, 1, 1, 1,
0.5987951, -0.513148, 1.501943, 1, 1, 1, 1, 1,
0.6062843, -0.7193766, 2.672299, 1, 1, 1, 1, 1,
0.6088659, -0.150749, 1.463784, 1, 1, 1, 1, 1,
0.6092851, -1.382508, 5.215566, 1, 1, 1, 1, 1,
0.6120171, 0.995098, 2.554009, 1, 1, 1, 1, 1,
0.6146386, -0.1442844, 1.438602, 1, 1, 1, 1, 1,
0.6149458, 2.143157, -1.07635, 1, 1, 1, 1, 1,
0.6184754, -1.286652, 2.028605, 1, 1, 1, 1, 1,
0.6187255, -0.4530804, 2.902222, 1, 1, 1, 1, 1,
0.6205313, -1.492913, 3.040747, 1, 1, 1, 1, 1,
0.6288381, 1.444769, 1.601914, 1, 1, 1, 1, 1,
0.6373529, 0.1660697, 0.6101221, 1, 1, 1, 1, 1,
0.637789, -0.4584797, 0.2390647, 0, 0, 1, 1, 1,
0.6380702, 0.4859912, -0.2672378, 1, 0, 0, 1, 1,
0.6415436, 1.259392, -1.39356, 1, 0, 0, 1, 1,
0.6444705, -0.9730684, 1.491304, 1, 0, 0, 1, 1,
0.646401, 2.562223, 0.4240375, 1, 0, 0, 1, 1,
0.6472313, 0.6646519, 1.753679, 1, 0, 0, 1, 1,
0.6485745, 0.3307252, 1.33825, 0, 0, 0, 1, 1,
0.6519439, 2.41988, -1.529818, 0, 0, 0, 1, 1,
0.6591902, -0.7706077, 3.688615, 0, 0, 0, 1, 1,
0.6603996, 0.4523018, 1.564342, 0, 0, 0, 1, 1,
0.6632103, 2.632869, 0.2608598, 0, 0, 0, 1, 1,
0.6733617, 0.6024322, -1.620432, 0, 0, 0, 1, 1,
0.6760936, 0.04444518, 0.06094314, 0, 0, 0, 1, 1,
0.6776015, -0.6296883, 2.965545, 1, 1, 1, 1, 1,
0.679386, 1.011262, 0.7290803, 1, 1, 1, 1, 1,
0.6804807, -1.900581, 2.412405, 1, 1, 1, 1, 1,
0.6836288, -0.9284927, 1.750198, 1, 1, 1, 1, 1,
0.6842378, -1.424623, 3.025439, 1, 1, 1, 1, 1,
0.6853821, -0.3235589, 2.485211, 1, 1, 1, 1, 1,
0.6889573, -0.3980047, 2.031248, 1, 1, 1, 1, 1,
0.6947317, -1.82306, 2.608088, 1, 1, 1, 1, 1,
0.6971865, 1.387253, -2.452732, 1, 1, 1, 1, 1,
0.6985375, -1.174725, 2.552923, 1, 1, 1, 1, 1,
0.7000836, 1.482802, 1.235962, 1, 1, 1, 1, 1,
0.7041757, -0.4556694, 0.2741406, 1, 1, 1, 1, 1,
0.7043345, 0.9142445, 0.6606978, 1, 1, 1, 1, 1,
0.7052042, 0.71776, 0.6270836, 1, 1, 1, 1, 1,
0.7053196, -1.082205, 3.637967, 1, 1, 1, 1, 1,
0.7084443, 0.7235974, 0.5919945, 0, 0, 1, 1, 1,
0.7121958, -0.3377166, 3.163985, 1, 0, 0, 1, 1,
0.7163536, -1.142219, 1.475956, 1, 0, 0, 1, 1,
0.7189555, 0.7427504, -0.4357698, 1, 0, 0, 1, 1,
0.7235493, -1.06512, 1.993018, 1, 0, 0, 1, 1,
0.7245753, -0.6487079, 1.182188, 1, 0, 0, 1, 1,
0.7273055, -2.407139, 3.493379, 0, 0, 0, 1, 1,
0.7286227, -0.443254, 0.2995708, 0, 0, 0, 1, 1,
0.7298448, 0.2511333, 0.4499227, 0, 0, 0, 1, 1,
0.7326136, 0.2060825, 0.975185, 0, 0, 0, 1, 1,
0.7338871, 1.051893, 1.016744, 0, 0, 0, 1, 1,
0.736573, -0.7204977, 2.864021, 0, 0, 0, 1, 1,
0.7411484, -0.574154, 1.721613, 0, 0, 0, 1, 1,
0.7412121, 1.152404, 0.6178778, 1, 1, 1, 1, 1,
0.7450988, 0.7944765, 0.7483273, 1, 1, 1, 1, 1,
0.7455746, 0.7549979, 0.5856783, 1, 1, 1, 1, 1,
0.7467907, 0.4543987, 1.600195, 1, 1, 1, 1, 1,
0.7471234, -0.5657099, 2.350401, 1, 1, 1, 1, 1,
0.7498886, -1.286491, 2.545034, 1, 1, 1, 1, 1,
0.7574804, 0.04374002, 1.361187, 1, 1, 1, 1, 1,
0.7657031, 0.3762233, 0.4807619, 1, 1, 1, 1, 1,
0.7698548, 0.4450141, 0.3299525, 1, 1, 1, 1, 1,
0.7724758, -0.1457236, 3.556507, 1, 1, 1, 1, 1,
0.7725189, -1.245291, 1.278032, 1, 1, 1, 1, 1,
0.7763269, 0.2468189, 1.431083, 1, 1, 1, 1, 1,
0.7781862, 0.1164874, 1.116535, 1, 1, 1, 1, 1,
0.7783157, 0.3218633, -0.5958562, 1, 1, 1, 1, 1,
0.782653, -1.999846, 1.853125, 1, 1, 1, 1, 1,
0.7852731, -0.9627815, 1.848211, 0, 0, 1, 1, 1,
0.7886605, 1.014892, -0.2625105, 1, 0, 0, 1, 1,
0.7916365, -0.8240044, 2.439394, 1, 0, 0, 1, 1,
0.7920346, -0.2387019, 2.67771, 1, 0, 0, 1, 1,
0.7932336, -0.5949955, 2.162768, 1, 0, 0, 1, 1,
0.7962084, -0.7324276, 1.82558, 1, 0, 0, 1, 1,
0.7972968, -0.3801795, 1.798023, 0, 0, 0, 1, 1,
0.7999622, -1.05563, 3.259392, 0, 0, 0, 1, 1,
0.8051751, 1.133973, 0.1719741, 0, 0, 0, 1, 1,
0.8071271, -0.4186283, 3.079456, 0, 0, 0, 1, 1,
0.8100589, -0.8926212, 4.121586, 0, 0, 0, 1, 1,
0.8125705, -0.2316049, 3.684631, 0, 0, 0, 1, 1,
0.8171874, -0.9969878, 2.829994, 0, 0, 0, 1, 1,
0.8194801, 0.4605128, 0.5981255, 1, 1, 1, 1, 1,
0.819575, -1.154727, 0.5637226, 1, 1, 1, 1, 1,
0.8234571, -1.313001, 1.803917, 1, 1, 1, 1, 1,
0.8270641, -1.752574, 2.564373, 1, 1, 1, 1, 1,
0.8287354, -0.9503152, 2.601272, 1, 1, 1, 1, 1,
0.828951, 0.4667897, 1.398793, 1, 1, 1, 1, 1,
0.8323063, 0.557272, -0.2423865, 1, 1, 1, 1, 1,
0.8335204, -0.5257202, 1.237766, 1, 1, 1, 1, 1,
0.8345689, -0.2897997, -1.285756, 1, 1, 1, 1, 1,
0.8392832, 1.196282, 1.187315, 1, 1, 1, 1, 1,
0.8394187, 0.06874849, 2.644422, 1, 1, 1, 1, 1,
0.8416881, -0.7289715, 1.595736, 1, 1, 1, 1, 1,
0.8468139, -0.6280164, 2.413078, 1, 1, 1, 1, 1,
0.8559491, 1.908528, 1.851497, 1, 1, 1, 1, 1,
0.8595555, 0.8329895, -0.8964447, 1, 1, 1, 1, 1,
0.8618508, 0.1903607, 0.9511211, 0, 0, 1, 1, 1,
0.8623623, 1.569928, -0.5296605, 1, 0, 0, 1, 1,
0.8623757, 0.3450068, 2.572259, 1, 0, 0, 1, 1,
0.866159, 0.3092553, 1.67758, 1, 0, 0, 1, 1,
0.8670356, 0.4701253, 1.20715, 1, 0, 0, 1, 1,
0.8688166, 0.8795505, -0.2542439, 1, 0, 0, 1, 1,
0.8690589, -0.05475666, 0.9143339, 0, 0, 0, 1, 1,
0.8702604, 0.3709963, 1.21526, 0, 0, 0, 1, 1,
0.8706933, 1.519818, -1.748401, 0, 0, 0, 1, 1,
0.8713051, 0.6640869, 0.9537761, 0, 0, 0, 1, 1,
0.8715705, 1.717229, 0.1663332, 0, 0, 0, 1, 1,
0.8722305, 0.141343, 2.49075, 0, 0, 0, 1, 1,
0.873011, -1.522364, 3.2735, 0, 0, 0, 1, 1,
0.8754112, -1.347355, 2.217822, 1, 1, 1, 1, 1,
0.8786127, 1.517676, -0.7855681, 1, 1, 1, 1, 1,
0.8812479, -0.1686923, 0.4732959, 1, 1, 1, 1, 1,
0.8843558, -1.453445, 3.161045, 1, 1, 1, 1, 1,
0.8850964, 0.9884419, 0.8482549, 1, 1, 1, 1, 1,
0.8916947, -0.3494704, 1.669801, 1, 1, 1, 1, 1,
0.8918034, 0.9474931, 1.752396, 1, 1, 1, 1, 1,
0.8926739, -0.5719519, 2.373521, 1, 1, 1, 1, 1,
0.8930893, 0.9839243, 1.083838, 1, 1, 1, 1, 1,
0.8946097, 1.170393, 1.337581, 1, 1, 1, 1, 1,
0.901462, -0.454882, 2.624394, 1, 1, 1, 1, 1,
0.9020417, 1.16936, 0.8932045, 1, 1, 1, 1, 1,
0.9044288, -0.00319558, 3.672364, 1, 1, 1, 1, 1,
0.9045359, -1.666145, 5.69567, 1, 1, 1, 1, 1,
0.9050625, 0.5160647, 1.834485, 1, 1, 1, 1, 1,
0.909814, 0.2313141, 1.57612, 0, 0, 1, 1, 1,
0.9104625, -0.1778778, 1.411262, 1, 0, 0, 1, 1,
0.910889, 1.387771, 1.453057, 1, 0, 0, 1, 1,
0.9109452, -2.263115, 1.371872, 1, 0, 0, 1, 1,
0.911262, -0.1141632, 1.956354, 1, 0, 0, 1, 1,
0.914821, -0.6747251, 3.816699, 1, 0, 0, 1, 1,
0.9157504, -2.107128, 3.128296, 0, 0, 0, 1, 1,
0.9164443, -0.3725824, 2.555503, 0, 0, 0, 1, 1,
0.9201396, 1.107306, 0.8966349, 0, 0, 0, 1, 1,
0.9221657, -0.3126144, 3.635373, 0, 0, 0, 1, 1,
0.9269233, 0.5678546, 0.01095534, 0, 0, 0, 1, 1,
0.9354506, 0.3548836, 0.530418, 0, 0, 0, 1, 1,
0.9393287, -0.2702673, 2.206438, 0, 0, 0, 1, 1,
0.9396338, -0.3312889, 1.730965, 1, 1, 1, 1, 1,
0.9399706, 0.7412356, -0.4870691, 1, 1, 1, 1, 1,
0.943855, -0.335421, 1.742409, 1, 1, 1, 1, 1,
0.9487579, 0.9801179, 2.257159, 1, 1, 1, 1, 1,
0.954161, -0.6157306, 2.116874, 1, 1, 1, 1, 1,
0.95684, 0.1408137, 2.453706, 1, 1, 1, 1, 1,
0.9597104, -0.7072111, 1.092136, 1, 1, 1, 1, 1,
0.960982, 0.7795525, 1.475099, 1, 1, 1, 1, 1,
0.9640459, -1.791199, 3.272471, 1, 1, 1, 1, 1,
0.9760957, -1.488492, 1.390734, 1, 1, 1, 1, 1,
0.9788303, -1.13104, 2.486891, 1, 1, 1, 1, 1,
0.9846408, 0.7895271, 1.435985, 1, 1, 1, 1, 1,
0.9854923, 1.009952, -0.6596587, 1, 1, 1, 1, 1,
0.9927979, 0.7281724, 0.8995188, 1, 1, 1, 1, 1,
0.9970172, 1.71525, -0.3083934, 1, 1, 1, 1, 1,
0.997308, -1.003116, 3.225725, 0, 0, 1, 1, 1,
1.005234, -1.084733, 2.649811, 1, 0, 0, 1, 1,
1.006103, -0.3929687, 2.12497, 1, 0, 0, 1, 1,
1.013831, 0.9446952, 2.704745, 1, 0, 0, 1, 1,
1.014103, -0.344416, 1.425437, 1, 0, 0, 1, 1,
1.02673, 0.9199206, 0.7962309, 1, 0, 0, 1, 1,
1.026847, -0.3811616, 2.691656, 0, 0, 0, 1, 1,
1.032158, 1.487885, 1.029468, 0, 0, 0, 1, 1,
1.043921, 0.02307262, 0.03565491, 0, 0, 0, 1, 1,
1.048103, 0.9829481, 0.8523147, 0, 0, 0, 1, 1,
1.048384, -0.1145792, 4.326398, 0, 0, 0, 1, 1,
1.048833, -2.063881, 3.84969, 0, 0, 0, 1, 1,
1.052443, 0.3689027, -0.07703795, 0, 0, 0, 1, 1,
1.054172, 1.522732, -1.291353, 1, 1, 1, 1, 1,
1.061946, -0.7493533, 2.327115, 1, 1, 1, 1, 1,
1.062579, 0.8768387, 0.5834888, 1, 1, 1, 1, 1,
1.068367, -1.587968, 2.493816, 1, 1, 1, 1, 1,
1.068403, 0.02387515, -0.3689047, 1, 1, 1, 1, 1,
1.069101, 0.2049158, 0.1846039, 1, 1, 1, 1, 1,
1.072646, 0.08810627, 2.48026, 1, 1, 1, 1, 1,
1.074091, 0.03605914, 0.4551647, 1, 1, 1, 1, 1,
1.074822, -0.704453, 1.336796, 1, 1, 1, 1, 1,
1.077682, 0.4385729, 1.531563, 1, 1, 1, 1, 1,
1.079392, 0.5430058, 0.3895347, 1, 1, 1, 1, 1,
1.093458, 0.8232169, 0.1578457, 1, 1, 1, 1, 1,
1.099173, -0.1343275, 1.76834, 1, 1, 1, 1, 1,
1.099388, -0.7737278, 0.7926781, 1, 1, 1, 1, 1,
1.100158, -0.06344407, 2.205659, 1, 1, 1, 1, 1,
1.104647, -0.09181374, 1.561621, 0, 0, 1, 1, 1,
1.10748, 0.2270239, 1.554083, 1, 0, 0, 1, 1,
1.108556, 0.9562219, 3.245404, 1, 0, 0, 1, 1,
1.111852, 0.9667273, 0.6966055, 1, 0, 0, 1, 1,
1.115169, 1.427423, 1.442333, 1, 0, 0, 1, 1,
1.121998, 0.604638, 0.9042669, 1, 0, 0, 1, 1,
1.13585, 1.78074, -0.2541974, 0, 0, 0, 1, 1,
1.14327, 1.770899, 1.75691, 0, 0, 0, 1, 1,
1.14641, 2.448713, 0.7987758, 0, 0, 0, 1, 1,
1.15088, 1.090909, 1.08581, 0, 0, 0, 1, 1,
1.157061, 1.135944, 0.2022765, 0, 0, 0, 1, 1,
1.164266, -1.158616, 3.228455, 0, 0, 0, 1, 1,
1.172416, -0.3732692, 0.6567318, 0, 0, 0, 1, 1,
1.17617, 1.061646, 0.4245545, 1, 1, 1, 1, 1,
1.1799, 0.08165218, 2.490001, 1, 1, 1, 1, 1,
1.203455, 1.948541, -0.4106681, 1, 1, 1, 1, 1,
1.208405, -1.533637, 2.72515, 1, 1, 1, 1, 1,
1.217602, -1.1534, 2.548099, 1, 1, 1, 1, 1,
1.21861, 0.1813218, 2.167207, 1, 1, 1, 1, 1,
1.220975, -0.5737945, 0.861039, 1, 1, 1, 1, 1,
1.228562, 0.3276956, 0.9942762, 1, 1, 1, 1, 1,
1.231528, -3.092412, 1.995215, 1, 1, 1, 1, 1,
1.249334, -1.281678, 2.605871, 1, 1, 1, 1, 1,
1.251601, 0.4337941, 1.652516, 1, 1, 1, 1, 1,
1.25896, -0.213823, 3.214212, 1, 1, 1, 1, 1,
1.271288, -0.06380953, 2.881856, 1, 1, 1, 1, 1,
1.273162, -0.1678852, 1.533087, 1, 1, 1, 1, 1,
1.287239, -0.5550253, 1.583874, 1, 1, 1, 1, 1,
1.290336, -0.388046, 1.350018, 0, 0, 1, 1, 1,
1.293971, 0.2714446, 1.497168, 1, 0, 0, 1, 1,
1.300162, 0.3994133, 0.4931936, 1, 0, 0, 1, 1,
1.311582, 2.732035, 1.10147, 1, 0, 0, 1, 1,
1.315793, 0.2063501, 1.125015, 1, 0, 0, 1, 1,
1.316574, -1.965478, 2.885503, 1, 0, 0, 1, 1,
1.320273, -0.08459137, -0.6592121, 0, 0, 0, 1, 1,
1.324022, 0.3776843, 1.638161, 0, 0, 0, 1, 1,
1.344679, -0.5112655, 0.9813173, 0, 0, 0, 1, 1,
1.34779, 0.8264547, 0.4591836, 0, 0, 0, 1, 1,
1.350298, 1.002175, 1.358316, 0, 0, 0, 1, 1,
1.35449, -0.5983231, 0.5049506, 0, 0, 0, 1, 1,
1.360328, 0.1046518, 0.365062, 0, 0, 0, 1, 1,
1.362623, -0.317696, 1.842886, 1, 1, 1, 1, 1,
1.362641, -0.9707344, 2.26049, 1, 1, 1, 1, 1,
1.368424, 1.646319, 1.331937, 1, 1, 1, 1, 1,
1.373372, -0.7442106, 2.381377, 1, 1, 1, 1, 1,
1.376499, -1.115435, 1.227433, 1, 1, 1, 1, 1,
1.378252, -0.2129038, 1.955945, 1, 1, 1, 1, 1,
1.382767, -0.6889799, 1.307218, 1, 1, 1, 1, 1,
1.38559, -0.4708568, 2.665629, 1, 1, 1, 1, 1,
1.398393, 1.245599, 2.356704, 1, 1, 1, 1, 1,
1.412642, 0.6855128, -0.05081149, 1, 1, 1, 1, 1,
1.431247, -0.2518232, 2.93261, 1, 1, 1, 1, 1,
1.432801, -0.8394942, 2.634847, 1, 1, 1, 1, 1,
1.452862, -0.1123669, 1.943419, 1, 1, 1, 1, 1,
1.467309, 1.91769, 1.817473, 1, 1, 1, 1, 1,
1.469512, 1.084675, -0.1652757, 1, 1, 1, 1, 1,
1.486505, 2.239275, 0.6232286, 0, 0, 1, 1, 1,
1.48843, -0.8602943, 3.371399, 1, 0, 0, 1, 1,
1.493654, 0.8325456, 1.728323, 1, 0, 0, 1, 1,
1.494464, -1.161882, 2.21898, 1, 0, 0, 1, 1,
1.500381, 0.15661, 1.116924, 1, 0, 0, 1, 1,
1.501447, 0.03763288, 3.350743, 1, 0, 0, 1, 1,
1.504297, -0.3355851, 2.036019, 0, 0, 0, 1, 1,
1.506211, 1.611662, 0.2318622, 0, 0, 0, 1, 1,
1.511369, 1.272418, -1.907896, 0, 0, 0, 1, 1,
1.529106, 1.365968, -0.8236189, 0, 0, 0, 1, 1,
1.536897, 0.2291835, 0.5384111, 0, 0, 0, 1, 1,
1.542162, -1.058858, 2.756513, 0, 0, 0, 1, 1,
1.548576, -0.3771714, 2.363896, 0, 0, 0, 1, 1,
1.571293, -1.056025, 3.281967, 1, 1, 1, 1, 1,
1.582744, -2.930966, 2.651736, 1, 1, 1, 1, 1,
1.62171, -0.7014874, 0.9536849, 1, 1, 1, 1, 1,
1.622785, -1.868965, 3.001802, 1, 1, 1, 1, 1,
1.634344, 1.788307, -0.5174863, 1, 1, 1, 1, 1,
1.639911, -0.8159775, 1.696803, 1, 1, 1, 1, 1,
1.64904, -0.570636, 3.25095, 1, 1, 1, 1, 1,
1.673609, 0.3306501, 1.093433, 1, 1, 1, 1, 1,
1.674356, 1.520494, 1.652267, 1, 1, 1, 1, 1,
1.677055, 1.374355, 1.877471, 1, 1, 1, 1, 1,
1.677208, -0.03004593, 0.7224809, 1, 1, 1, 1, 1,
1.680634, 1.116474, 1.329677, 1, 1, 1, 1, 1,
1.684381, -0.3678107, 1.467374, 1, 1, 1, 1, 1,
1.687467, -0.8432593, 0.4488979, 1, 1, 1, 1, 1,
1.68826, -0.3365942, 2.632339, 1, 1, 1, 1, 1,
1.691197, -0.1466982, 3.100919, 0, 0, 1, 1, 1,
1.700052, -1.344723, 2.002604, 1, 0, 0, 1, 1,
1.704985, -0.08984683, 1.823397, 1, 0, 0, 1, 1,
1.75172, 0.04839943, 3.152039, 1, 0, 0, 1, 1,
1.752305, 2.018441, -0.198608, 1, 0, 0, 1, 1,
1.758029, -0.2839117, 1.590421, 1, 0, 0, 1, 1,
1.759402, 0.716123, 1.998338, 0, 0, 0, 1, 1,
1.77502, 0.7902187, 1.126747, 0, 0, 0, 1, 1,
1.775749, -0.2349072, 1.599518, 0, 0, 0, 1, 1,
1.775832, -0.04216685, 1.824006, 0, 0, 0, 1, 1,
1.780216, -0.398412, 4.065469, 0, 0, 0, 1, 1,
1.785189, -0.2887248, 2.453064, 0, 0, 0, 1, 1,
1.794738, 0.3783098, 0.7890725, 0, 0, 0, 1, 1,
1.804672, 0.971455, 2.524638, 1, 1, 1, 1, 1,
1.808694, 0.389198, 1.661399, 1, 1, 1, 1, 1,
1.809677, 0.07747143, 3.39064, 1, 1, 1, 1, 1,
1.81014, -0.6353534, 1.481923, 1, 1, 1, 1, 1,
1.832765, 0.9294856, 1.685979, 1, 1, 1, 1, 1,
1.840923, 0.9420046, 0.3081943, 1, 1, 1, 1, 1,
1.85386, 0.03138045, 1.294764, 1, 1, 1, 1, 1,
1.906638, -0.3466915, 0.7190661, 1, 1, 1, 1, 1,
1.942328, -0.5449923, 2.496791, 1, 1, 1, 1, 1,
1.960745, 0.4502862, 1.940796, 1, 1, 1, 1, 1,
1.973074, 1.713386, 0.6043374, 1, 1, 1, 1, 1,
2.022121, 0.5348858, 1.531433, 1, 1, 1, 1, 1,
2.059806, 0.04841436, 1.236712, 1, 1, 1, 1, 1,
2.112829, 1.261776, -1.091941, 1, 1, 1, 1, 1,
2.115516, -0.4101799, 2.152889, 1, 1, 1, 1, 1,
2.148851, 0.1101733, 2.05772, 0, 0, 1, 1, 1,
2.162955, -0.971813, 2.172362, 1, 0, 0, 1, 1,
2.190935, 1.054946, 1.098647, 1, 0, 0, 1, 1,
2.19109, -0.2093927, 1.971009, 1, 0, 0, 1, 1,
2.233603, -1.344161, 2.360345, 1, 0, 0, 1, 1,
2.238563, -1.613334, 0.9894426, 1, 0, 0, 1, 1,
2.280873, -0.597831, 2.890855, 0, 0, 0, 1, 1,
2.293996, 1.86437, 0.5927722, 0, 0, 0, 1, 1,
2.320438, 1.386615, 1.281873, 0, 0, 0, 1, 1,
2.324694, 0.4233387, 0.5737595, 0, 0, 0, 1, 1,
2.345433, 0.2506864, 0.05672375, 0, 0, 0, 1, 1,
2.349442, 1.908946, 0.7838002, 0, 0, 0, 1, 1,
2.409586, -1.203741, 0.4636144, 0, 0, 0, 1, 1,
2.481702, -0.1541169, 1.45617, 1, 1, 1, 1, 1,
2.532031, -1.675248, 2.176548, 1, 1, 1, 1, 1,
2.586315, -0.321976, 1.752252, 1, 1, 1, 1, 1,
2.645089, -0.8060278, 1.168181, 1, 1, 1, 1, 1,
2.958871, -0.8973119, 1.415234, 1, 1, 1, 1, 1,
2.989482, 0.3212294, 0.8902329, 1, 1, 1, 1, 1,
3.154084, 0.8150593, -0.6770919, 1, 1, 1, 1, 1
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
var radius = 10.19147;
var distance = 35.79711;
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
mvMatrix.translate( 0.4477983, 0.2805431, -0.0797801 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.79711);
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
