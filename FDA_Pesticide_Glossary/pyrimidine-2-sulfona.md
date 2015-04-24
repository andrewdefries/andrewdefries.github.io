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
-2.864938, -1.770672, -2.009045, 1, 0, 0, 1,
-2.796277, 0.3621647, -1.36088, 1, 0.007843138, 0, 1,
-2.505488, -0.7771235, -0.4704754, 1, 0.01176471, 0, 1,
-2.387574, 0.4940819, -4.315485, 1, 0.01960784, 0, 1,
-2.372448, 0.0001176851, -0.005991715, 1, 0.02352941, 0, 1,
-2.355185, -0.2911499, -1.449027, 1, 0.03137255, 0, 1,
-2.354888, -2.853453, -2.872648, 1, 0.03529412, 0, 1,
-2.258642, 1.891588, -2.688184, 1, 0.04313726, 0, 1,
-2.238753, 0.6192846, -2.872535, 1, 0.04705882, 0, 1,
-2.23444, -0.8561119, -2.337615, 1, 0.05490196, 0, 1,
-2.226178, 0.3048922, -1.960458, 1, 0.05882353, 0, 1,
-2.216853, 1.433281, -3.364499, 1, 0.06666667, 0, 1,
-2.194202, -0.1542924, -2.213234, 1, 0.07058824, 0, 1,
-2.181023, 1.871568, -0.3418315, 1, 0.07843138, 0, 1,
-2.112298, -0.8444331, 0.09559181, 1, 0.08235294, 0, 1,
-2.078687, -1.030346, -3.357908, 1, 0.09019608, 0, 1,
-2.066584, 0.08523583, -3.847574, 1, 0.09411765, 0, 1,
-2.047983, -0.1560864, -1.722115, 1, 0.1019608, 0, 1,
-2.04305, 1.63458, -0.6903175, 1, 0.1098039, 0, 1,
-2.038421, 0.2716978, -0.7678785, 1, 0.1137255, 0, 1,
-2.026193, -2.663149, -1.926898, 1, 0.1215686, 0, 1,
-2.01264, -0.2450243, -2.170391, 1, 0.1254902, 0, 1,
-2.011065, 0.1360466, -2.403628, 1, 0.1333333, 0, 1,
-2.00419, 0.405711, -1.974059, 1, 0.1372549, 0, 1,
-1.990112, -1.696006, -1.659082, 1, 0.145098, 0, 1,
-1.96437, -0.3066206, -1.695312, 1, 0.1490196, 0, 1,
-1.962577, 0.5351289, -1.300613, 1, 0.1568628, 0, 1,
-1.917593, 0.8553932, -1.502962, 1, 0.1607843, 0, 1,
-1.906937, 0.7633752, -0.5237377, 1, 0.1686275, 0, 1,
-1.899712, 0.2616638, -1.80738, 1, 0.172549, 0, 1,
-1.896136, 0.7500043, -0.8038322, 1, 0.1803922, 0, 1,
-1.87669, 1.074788, -1.591578, 1, 0.1843137, 0, 1,
-1.867614, -0.7008126, -1.249214, 1, 0.1921569, 0, 1,
-1.857696, -1.148086, -3.519143, 1, 0.1960784, 0, 1,
-1.840037, -2.003821, -2.295983, 1, 0.2039216, 0, 1,
-1.810753, -3.05121, -1.325647, 1, 0.2117647, 0, 1,
-1.781036, -0.9850612, -1.962397, 1, 0.2156863, 0, 1,
-1.773816, 0.1528021, -2.691491, 1, 0.2235294, 0, 1,
-1.761716, -1.051602, -2.248471, 1, 0.227451, 0, 1,
-1.760469, -1.272336, -0.3166345, 1, 0.2352941, 0, 1,
-1.751084, 1.932861, -1.48044, 1, 0.2392157, 0, 1,
-1.745784, -1.14504, -0.6571435, 1, 0.2470588, 0, 1,
-1.724409, -1.795344, -0.9053848, 1, 0.2509804, 0, 1,
-1.723784, 0.9733382, 0.8522487, 1, 0.2588235, 0, 1,
-1.717855, -0.9196619, -2.779757, 1, 0.2627451, 0, 1,
-1.696681, 1.065886, -1.358315, 1, 0.2705882, 0, 1,
-1.68931, -0.4615796, -2.41305, 1, 0.2745098, 0, 1,
-1.666524, -0.7488567, -3.145984, 1, 0.282353, 0, 1,
-1.666466, 1.854229, 1.022471, 1, 0.2862745, 0, 1,
-1.638387, -0.998273, -1.294967, 1, 0.2941177, 0, 1,
-1.630622, 1.074559, -1.811541, 1, 0.3019608, 0, 1,
-1.597116, 0.8057381, -0.2953186, 1, 0.3058824, 0, 1,
-1.59613, 0.8026101, -1.43575, 1, 0.3137255, 0, 1,
-1.593799, 0.6573042, -0.3573681, 1, 0.3176471, 0, 1,
-1.556516, 0.1718037, -1.322155, 1, 0.3254902, 0, 1,
-1.526136, -0.1415362, -0.5823455, 1, 0.3294118, 0, 1,
-1.515271, 1.539696, 0.9719201, 1, 0.3372549, 0, 1,
-1.508873, 0.7182359, -0.5032302, 1, 0.3411765, 0, 1,
-1.507727, 0.6604338, -0.5731006, 1, 0.3490196, 0, 1,
-1.502961, 0.6764761, -1.054761, 1, 0.3529412, 0, 1,
-1.489875, -1.361077, -3.043429, 1, 0.3607843, 0, 1,
-1.488937, -2.087079, -2.405822, 1, 0.3647059, 0, 1,
-1.486885, -0.4502924, -2.866699, 1, 0.372549, 0, 1,
-1.48478, 1.182428, -2.163896, 1, 0.3764706, 0, 1,
-1.473983, -0.9215953, -1.993657, 1, 0.3843137, 0, 1,
-1.473936, 0.7167846, -2.229289, 1, 0.3882353, 0, 1,
-1.471703, 0.7211437, -3.197261, 1, 0.3960784, 0, 1,
-1.470296, -1.340195, -1.734859, 1, 0.4039216, 0, 1,
-1.466417, 0.09171306, -0.5137361, 1, 0.4078431, 0, 1,
-1.465607, 0.7912018, -0.3925917, 1, 0.4156863, 0, 1,
-1.464709, -2.108925, -2.774302, 1, 0.4196078, 0, 1,
-1.457579, 0.02737648, -1.373746, 1, 0.427451, 0, 1,
-1.454196, -0.2675748, -1.496669, 1, 0.4313726, 0, 1,
-1.437917, 1.792232, -1.324825, 1, 0.4392157, 0, 1,
-1.428043, 0.3955998, -0.9229406, 1, 0.4431373, 0, 1,
-1.426324, -0.7179323, -1.994634, 1, 0.4509804, 0, 1,
-1.418476, -0.4740205, -0.8795816, 1, 0.454902, 0, 1,
-1.406158, 1.348343, -0.872834, 1, 0.4627451, 0, 1,
-1.391972, -0.09021769, -1.68252, 1, 0.4666667, 0, 1,
-1.386677, 1.420706, 0.7124241, 1, 0.4745098, 0, 1,
-1.37913, 0.8685462, -1.033911, 1, 0.4784314, 0, 1,
-1.377687, -0.8297281, -1.800557, 1, 0.4862745, 0, 1,
-1.376748, -0.8494142, -1.336006, 1, 0.4901961, 0, 1,
-1.371619, 0.1710255, -1.460057, 1, 0.4980392, 0, 1,
-1.36704, 0.7204602, -0.2410423, 1, 0.5058824, 0, 1,
-1.36681, 0.2871849, -0.3664038, 1, 0.509804, 0, 1,
-1.348851, 0.3062886, -1.669996, 1, 0.5176471, 0, 1,
-1.34733, 0.3207905, 0.2594326, 1, 0.5215687, 0, 1,
-1.341968, 0.1750797, -1.345027, 1, 0.5294118, 0, 1,
-1.339489, -0.21929, -0.3567154, 1, 0.5333334, 0, 1,
-1.337803, -0.8671581, -1.22892, 1, 0.5411765, 0, 1,
-1.330265, 0.189157, -0.2280009, 1, 0.5450981, 0, 1,
-1.312075, 0.3388882, -0.2780972, 1, 0.5529412, 0, 1,
-1.310941, 0.2816765, -1.257082, 1, 0.5568628, 0, 1,
-1.308019, 2.532418, 0.02791763, 1, 0.5647059, 0, 1,
-1.307172, 1.116726, -1.396749, 1, 0.5686275, 0, 1,
-1.297759, 0.4381486, -0.9655128, 1, 0.5764706, 0, 1,
-1.295669, -0.3557167, -0.354167, 1, 0.5803922, 0, 1,
-1.26299, 0.4567144, -0.9726949, 1, 0.5882353, 0, 1,
-1.248532, 0.4611115, -1.977311, 1, 0.5921569, 0, 1,
-1.214656, 1.150328, 1.026648, 1, 0.6, 0, 1,
-1.21059, 1.226549, -1.464983, 1, 0.6078432, 0, 1,
-1.207701, -1.530247, -1.848134, 1, 0.6117647, 0, 1,
-1.200747, 0.1731672, -3.746637, 1, 0.6196079, 0, 1,
-1.190684, 0.7793311, -1.167767, 1, 0.6235294, 0, 1,
-1.18431, -0.0744783, -1.194323, 1, 0.6313726, 0, 1,
-1.176838, 0.665691, -2.09568, 1, 0.6352941, 0, 1,
-1.173622, -0.4863639, -2.498143, 1, 0.6431373, 0, 1,
-1.152346, -0.668349, -1.456389, 1, 0.6470588, 0, 1,
-1.148136, 0.232103, -2.879608, 1, 0.654902, 0, 1,
-1.143296, -0.7451834, -3.094491, 1, 0.6588235, 0, 1,
-1.138266, -0.4318419, -2.609132, 1, 0.6666667, 0, 1,
-1.135774, 1.059556, -1.640455, 1, 0.6705883, 0, 1,
-1.135094, -1.490317, -0.8787376, 1, 0.6784314, 0, 1,
-1.127824, 0.8702837, -0.3574272, 1, 0.682353, 0, 1,
-1.125614, -0.2549415, -0.4645316, 1, 0.6901961, 0, 1,
-1.124245, -0.5117351, -0.7839768, 1, 0.6941177, 0, 1,
-1.123517, -0.9905758, -1.776618, 1, 0.7019608, 0, 1,
-1.123274, 0.01384167, -0.09074605, 1, 0.7098039, 0, 1,
-1.115563, 0.1914867, 0.2271926, 1, 0.7137255, 0, 1,
-1.112011, -0.3537506, -1.697675, 1, 0.7215686, 0, 1,
-1.10772, 0.1518798, -2.271783, 1, 0.7254902, 0, 1,
-1.106969, 0.500621, -1.248287, 1, 0.7333333, 0, 1,
-1.097141, -0.1173458, -2.576993, 1, 0.7372549, 0, 1,
-1.092896, -0.5223652, -1.853365, 1, 0.7450981, 0, 1,
-1.087154, -0.4710065, -2.748351, 1, 0.7490196, 0, 1,
-1.084957, -1.461015, -3.767472, 1, 0.7568628, 0, 1,
-1.080511, -1.204899, -3.316703, 1, 0.7607843, 0, 1,
-1.061696, -0.8820632, -2.88099, 1, 0.7686275, 0, 1,
-1.060896, -0.2583301, -1.350331, 1, 0.772549, 0, 1,
-1.05646, 0.07694005, -0.7146826, 1, 0.7803922, 0, 1,
-1.054904, 0.7093017, -2.080745, 1, 0.7843137, 0, 1,
-1.053499, 1.076202, -0.9110249, 1, 0.7921569, 0, 1,
-1.042278, -0.6579936, -0.9614441, 1, 0.7960784, 0, 1,
-1.036404, -0.9014397, -2.014666, 1, 0.8039216, 0, 1,
-1.034275, -0.9544436, -3.589283, 1, 0.8117647, 0, 1,
-1.032964, 0.9287563, -0.07379496, 1, 0.8156863, 0, 1,
-1.031245, 0.5134611, -2.535419, 1, 0.8235294, 0, 1,
-1.031178, -0.9308048, -2.179826, 1, 0.827451, 0, 1,
-1.027409, -1.411967, -3.092994, 1, 0.8352941, 0, 1,
-1.022878, 0.4654002, -0.7627139, 1, 0.8392157, 0, 1,
-1.01817, 1.534569, 0.425741, 1, 0.8470588, 0, 1,
-1.014725, 0.2611946, -2.118969, 1, 0.8509804, 0, 1,
-1.010476, 1.232955, 0.3631049, 1, 0.8588235, 0, 1,
-1.003246, -0.1627177, -1.443876, 1, 0.8627451, 0, 1,
-1.001611, -1.208466, -1.430619, 1, 0.8705882, 0, 1,
-1.000771, 0.1055944, -4.053098, 1, 0.8745098, 0, 1,
-0.9902751, -0.2743675, -1.649211, 1, 0.8823529, 0, 1,
-0.9847243, 0.9667819, -0.6792634, 1, 0.8862745, 0, 1,
-0.9790279, -1.021418, -2.213947, 1, 0.8941177, 0, 1,
-0.9782081, 0.530898, -0.8663382, 1, 0.8980392, 0, 1,
-0.9714471, 0.3210754, 0.8706611, 1, 0.9058824, 0, 1,
-0.9702497, 1.165655, 1.389837, 1, 0.9137255, 0, 1,
-0.9664323, 0.3384286, -0.3518242, 1, 0.9176471, 0, 1,
-0.9649716, -0.6449472, -1.840459, 1, 0.9254902, 0, 1,
-0.9635007, -0.3094198, -1.640006, 1, 0.9294118, 0, 1,
-0.9598346, 0.2309673, -0.9784608, 1, 0.9372549, 0, 1,
-0.9592075, -1.969466, -2.531431, 1, 0.9411765, 0, 1,
-0.9547875, -0.5548209, -1.934797, 1, 0.9490196, 0, 1,
-0.9543195, -1.196864, -2.766824, 1, 0.9529412, 0, 1,
-0.95041, 0.1904358, -1.220645, 1, 0.9607843, 0, 1,
-0.9491677, 0.2857802, -1.949555, 1, 0.9647059, 0, 1,
-0.9448717, 0.1298264, -1.508268, 1, 0.972549, 0, 1,
-0.9415216, -1.678948, -3.811989, 1, 0.9764706, 0, 1,
-0.9386308, 0.02894429, -3.216121, 1, 0.9843137, 0, 1,
-0.9342812, 1.142521, 2.150115, 1, 0.9882353, 0, 1,
-0.9287844, -1.426124, -2.78806, 1, 0.9960784, 0, 1,
-0.9273068, -1.04798, -0.669173, 0.9960784, 1, 0, 1,
-0.926873, 0.169484, 0.4827578, 0.9921569, 1, 0, 1,
-0.9260859, 1.924954, -1.196972, 0.9843137, 1, 0, 1,
-0.9202578, -0.399707, -2.790733, 0.9803922, 1, 0, 1,
-0.9147524, 0.9995818, 0.2422561, 0.972549, 1, 0, 1,
-0.9119921, 2.384779, -0.04651267, 0.9686275, 1, 0, 1,
-0.9076617, 0.3659837, -0.7695141, 0.9607843, 1, 0, 1,
-0.8925, 0.2169189, -1.372246, 0.9568627, 1, 0, 1,
-0.8891487, 0.3773841, -0.8781605, 0.9490196, 1, 0, 1,
-0.8885288, 0.6693949, -0.4832773, 0.945098, 1, 0, 1,
-0.8856396, 0.7977455, -2.807208, 0.9372549, 1, 0, 1,
-0.8855177, 1.241108, -1.552257, 0.9333333, 1, 0, 1,
-0.8819125, 0.9718787, -1.150706, 0.9254902, 1, 0, 1,
-0.8788226, -1.659106, -2.256971, 0.9215686, 1, 0, 1,
-0.8732401, 3.095074, -0.7357137, 0.9137255, 1, 0, 1,
-0.8651499, -1.405652, -1.898137, 0.9098039, 1, 0, 1,
-0.8642082, -1.178084, -1.407079, 0.9019608, 1, 0, 1,
-0.8590593, 1.244306, -0.5805299, 0.8941177, 1, 0, 1,
-0.8583136, 1.120873, -0.7230026, 0.8901961, 1, 0, 1,
-0.8564033, 1.641021, 0.0823457, 0.8823529, 1, 0, 1,
-0.8563529, 1.339597, -1.133482, 0.8784314, 1, 0, 1,
-0.8548067, -0.03554864, -3.026008, 0.8705882, 1, 0, 1,
-0.8513784, -0.7996472, -3.606726, 0.8666667, 1, 0, 1,
-0.8476354, 0.4408639, -1.102418, 0.8588235, 1, 0, 1,
-0.8430297, 0.3756484, -2.134727, 0.854902, 1, 0, 1,
-0.8353386, 1.298141, 0.5562738, 0.8470588, 1, 0, 1,
-0.8352196, 0.9847479, -0.2809805, 0.8431373, 1, 0, 1,
-0.8329871, 0.06224517, -0.3088552, 0.8352941, 1, 0, 1,
-0.8301331, -1.162638, -3.068172, 0.8313726, 1, 0, 1,
-0.8297533, -0.3577038, -1.74173, 0.8235294, 1, 0, 1,
-0.8296103, 0.003156941, -1.649121, 0.8196079, 1, 0, 1,
-0.8263727, -1.451333, -2.455492, 0.8117647, 1, 0, 1,
-0.8254846, -1.110348, -2.528883, 0.8078431, 1, 0, 1,
-0.8185323, 0.1332641, -0.6872354, 0.8, 1, 0, 1,
-0.8175446, 2.103982, -0.8477576, 0.7921569, 1, 0, 1,
-0.8137431, -0.5132566, -2.750568, 0.7882353, 1, 0, 1,
-0.8135391, 1.397268, -0.3479795, 0.7803922, 1, 0, 1,
-0.8085684, -0.9330568, -1.958811, 0.7764706, 1, 0, 1,
-0.8076642, -0.4400713, -1.287794, 0.7686275, 1, 0, 1,
-0.8071722, -0.4218657, -0.5950971, 0.7647059, 1, 0, 1,
-0.8043091, -1.222137, -2.701906, 0.7568628, 1, 0, 1,
-0.8036331, -0.3738424, -0.1117575, 0.7529412, 1, 0, 1,
-0.80349, 0.03942326, -1.17796, 0.7450981, 1, 0, 1,
-0.8033597, 0.341902, -0.5392919, 0.7411765, 1, 0, 1,
-0.7989459, 1.889814, -1.138296, 0.7333333, 1, 0, 1,
-0.7923538, 0.2221348, -1.404825, 0.7294118, 1, 0, 1,
-0.7914974, 1.54015, -2.268146, 0.7215686, 1, 0, 1,
-0.7879407, 1.185231, -0.9210353, 0.7176471, 1, 0, 1,
-0.7835614, 0.3719967, -1.297, 0.7098039, 1, 0, 1,
-0.7815914, -0.1873084, -4.199739, 0.7058824, 1, 0, 1,
-0.7798802, 1.648891, -0.9258888, 0.6980392, 1, 0, 1,
-0.7785106, -0.7412311, -1.478251, 0.6901961, 1, 0, 1,
-0.7720538, -1.036842, -1.9674, 0.6862745, 1, 0, 1,
-0.7709896, -0.2900711, -1.837345, 0.6784314, 1, 0, 1,
-0.7701272, -1.528093, -2.661259, 0.6745098, 1, 0, 1,
-0.7687948, 0.2016197, 0.5405304, 0.6666667, 1, 0, 1,
-0.7684804, -1.16616, -1.448865, 0.6627451, 1, 0, 1,
-0.7670386, 0.5793027, -2.434551, 0.654902, 1, 0, 1,
-0.766234, 0.5110466, -1.43767, 0.6509804, 1, 0, 1,
-0.7657238, 0.3159305, 0.7906839, 0.6431373, 1, 0, 1,
-0.7656428, 0.6865445, 1.596288, 0.6392157, 1, 0, 1,
-0.761686, -0.5738789, -1.504016, 0.6313726, 1, 0, 1,
-0.7605988, 1.728777, -0.8830997, 0.627451, 1, 0, 1,
-0.7602812, -1.379071, -3.928654, 0.6196079, 1, 0, 1,
-0.7558534, 0.5273158, -0.944802, 0.6156863, 1, 0, 1,
-0.7531508, 1.395288, -0.8110717, 0.6078432, 1, 0, 1,
-0.7509574, -0.5934768, -2.074059, 0.6039216, 1, 0, 1,
-0.749342, 0.9967586, 1.132418, 0.5960785, 1, 0, 1,
-0.7453867, 0.8359402, 0.5378357, 0.5882353, 1, 0, 1,
-0.7328283, -0.3136193, -1.82224, 0.5843138, 1, 0, 1,
-0.7300414, 0.6064807, -0.4101236, 0.5764706, 1, 0, 1,
-0.7281741, 1.232708, -0.1310835, 0.572549, 1, 0, 1,
-0.7275851, -0.9562008, -1.509853, 0.5647059, 1, 0, 1,
-0.7217292, -1.418366, -2.284369, 0.5607843, 1, 0, 1,
-0.7194742, 0.5318577, -0.4904612, 0.5529412, 1, 0, 1,
-0.710444, -1.190345, -3.49385, 0.5490196, 1, 0, 1,
-0.7064657, 0.3612113, -1.406587, 0.5411765, 1, 0, 1,
-0.6915701, -0.9850462, -3.399709, 0.5372549, 1, 0, 1,
-0.6914893, -0.6107542, -2.992768, 0.5294118, 1, 0, 1,
-0.6879216, -2.563832, -2.800502, 0.5254902, 1, 0, 1,
-0.6866974, -1.320501, -2.94073, 0.5176471, 1, 0, 1,
-0.6835691, 0.8583336, -0.8433791, 0.5137255, 1, 0, 1,
-0.6738697, -0.6893551, -1.429851, 0.5058824, 1, 0, 1,
-0.6685857, 1.149845, 0.02428192, 0.5019608, 1, 0, 1,
-0.6679083, 0.4180164, -0.3983099, 0.4941176, 1, 0, 1,
-0.6677945, -0.3360585, -1.572129, 0.4862745, 1, 0, 1,
-0.6660308, 0.02874666, -2.321853, 0.4823529, 1, 0, 1,
-0.6650831, 0.2930865, -0.3768415, 0.4745098, 1, 0, 1,
-0.6648007, 1.203207, -1.555316, 0.4705882, 1, 0, 1,
-0.664727, -0.3163052, -1.205885, 0.4627451, 1, 0, 1,
-0.6626988, 0.5138705, -2.399835, 0.4588235, 1, 0, 1,
-0.6622246, 0.244222, -0.5942889, 0.4509804, 1, 0, 1,
-0.6614243, 1.096671, 0.4545621, 0.4470588, 1, 0, 1,
-0.6562057, 1.150751, 0.1207534, 0.4392157, 1, 0, 1,
-0.6560372, -0.8716501, -4.69748, 0.4352941, 1, 0, 1,
-0.6544512, 1.448843, -0.8037947, 0.427451, 1, 0, 1,
-0.6532983, 1.255225, -0.9641383, 0.4235294, 1, 0, 1,
-0.6522227, -2.043492, -3.050281, 0.4156863, 1, 0, 1,
-0.649515, 1.228185, 0.5816209, 0.4117647, 1, 0, 1,
-0.6462368, -0.3281398, -2.407655, 0.4039216, 1, 0, 1,
-0.6461303, 2.054178, 0.1797116, 0.3960784, 1, 0, 1,
-0.6441915, -0.5015066, -1.22179, 0.3921569, 1, 0, 1,
-0.6339816, -0.6527951, -2.797148, 0.3843137, 1, 0, 1,
-0.6328951, 0.374013, 0.06524778, 0.3803922, 1, 0, 1,
-0.6282251, 0.4356944, -1.337101, 0.372549, 1, 0, 1,
-0.6213142, -0.5003003, -2.492402, 0.3686275, 1, 0, 1,
-0.6210465, 1.31552, -0.09389842, 0.3607843, 1, 0, 1,
-0.6195183, 0.4028081, -1.448548, 0.3568628, 1, 0, 1,
-0.6194871, 0.7156781, -1.340138, 0.3490196, 1, 0, 1,
-0.6190636, -0.3139714, -2.283283, 0.345098, 1, 0, 1,
-0.6134841, -1.233386, -3.307049, 0.3372549, 1, 0, 1,
-0.6094431, 0.372222, -2.048541, 0.3333333, 1, 0, 1,
-0.6034923, -0.02910058, -1.960782, 0.3254902, 1, 0, 1,
-0.6034594, -2.522685, -1.71597, 0.3215686, 1, 0, 1,
-0.602009, 0.4641941, -0.8542882, 0.3137255, 1, 0, 1,
-0.5947548, 0.979799, -2.14589, 0.3098039, 1, 0, 1,
-0.5858213, -0.2433671, -2.77109, 0.3019608, 1, 0, 1,
-0.5849316, -1.495046, -3.360656, 0.2941177, 1, 0, 1,
-0.584731, -0.05231294, 0.3932818, 0.2901961, 1, 0, 1,
-0.5831368, -0.7846388, -1.892411, 0.282353, 1, 0, 1,
-0.5801721, 1.27188, 0.7682139, 0.2784314, 1, 0, 1,
-0.573225, -1.035516, -0.9108468, 0.2705882, 1, 0, 1,
-0.5730624, -1.576017, -1.889803, 0.2666667, 1, 0, 1,
-0.5727286, -0.4871295, -1.519881, 0.2588235, 1, 0, 1,
-0.5689043, 0.5338962, -0.6968129, 0.254902, 1, 0, 1,
-0.5647255, -0.588157, -1.444384, 0.2470588, 1, 0, 1,
-0.5641829, -0.1333278, -1.293356, 0.2431373, 1, 0, 1,
-0.5621927, 0.1014206, -1.48217, 0.2352941, 1, 0, 1,
-0.560554, -0.4621029, -2.5165, 0.2313726, 1, 0, 1,
-0.5562379, -1.229828, -3.213515, 0.2235294, 1, 0, 1,
-0.5535478, 1.607145, 0.5173402, 0.2196078, 1, 0, 1,
-0.5509474, 0.6280736, -0.7641775, 0.2117647, 1, 0, 1,
-0.549032, 0.1647246, -1.148964, 0.2078431, 1, 0, 1,
-0.548456, 1.77463, -0.2991318, 0.2, 1, 0, 1,
-0.5468128, -0.9032208, -2.140846, 0.1921569, 1, 0, 1,
-0.5464455, 0.7774372, -0.03487721, 0.1882353, 1, 0, 1,
-0.5453215, 1.113881, 1.098641, 0.1803922, 1, 0, 1,
-0.5447916, -1.334538, -3.030924, 0.1764706, 1, 0, 1,
-0.5435134, 0.1016194, -1.751929, 0.1686275, 1, 0, 1,
-0.5396011, 0.3532453, -0.7946952, 0.1647059, 1, 0, 1,
-0.5354534, -1.361362, -2.774505, 0.1568628, 1, 0, 1,
-0.533689, 1.298789, 0.6944118, 0.1529412, 1, 0, 1,
-0.5330523, -0.05732362, -1.624365, 0.145098, 1, 0, 1,
-0.5310336, -0.6835858, -1.884463, 0.1411765, 1, 0, 1,
-0.5295539, 0.4254027, -2.653036, 0.1333333, 1, 0, 1,
-0.5281911, -1.885985, -1.576563, 0.1294118, 1, 0, 1,
-0.527516, -1.014294, -2.852673, 0.1215686, 1, 0, 1,
-0.526211, -1.118474, -2.343058, 0.1176471, 1, 0, 1,
-0.524999, 0.5403848, -0.4239776, 0.1098039, 1, 0, 1,
-0.5236059, 1.598213, 0.8786453, 0.1058824, 1, 0, 1,
-0.5219275, 0.5376284, -1.27785, 0.09803922, 1, 0, 1,
-0.5197334, 0.2328269, -0.8336601, 0.09019608, 1, 0, 1,
-0.5179942, 1.345147, 1.320519, 0.08627451, 1, 0, 1,
-0.5178859, -1.59986, -2.100798, 0.07843138, 1, 0, 1,
-0.5158361, -0.2625481, -1.93998, 0.07450981, 1, 0, 1,
-0.5145391, 0.5029835, -1.404138, 0.06666667, 1, 0, 1,
-0.5111957, 0.43681, -1.516742, 0.0627451, 1, 0, 1,
-0.510754, -0.3246709, -2.452559, 0.05490196, 1, 0, 1,
-0.5087039, 0.4046345, -0.647085, 0.05098039, 1, 0, 1,
-0.5085479, -1.09946, -3.190162, 0.04313726, 1, 0, 1,
-0.5070995, -0.5174468, -1.662967, 0.03921569, 1, 0, 1,
-0.5066151, -0.9216397, -2.563552, 0.03137255, 1, 0, 1,
-0.5047281, -0.04667333, -2.990397, 0.02745098, 1, 0, 1,
-0.504613, 1.122668, -0.9017221, 0.01960784, 1, 0, 1,
-0.5004565, 0.8520963, -0.1003043, 0.01568628, 1, 0, 1,
-0.4971439, -1.362652, -3.59629, 0.007843138, 1, 0, 1,
-0.4928982, 0.4442621, -0.4166323, 0.003921569, 1, 0, 1,
-0.4902472, 0.2865287, -2.107064, 0, 1, 0.003921569, 1,
-0.480815, 1.581955, 1.261774, 0, 1, 0.01176471, 1,
-0.4759585, 0.935088, -0.8267588, 0, 1, 0.01568628, 1,
-0.4737474, 1.383578, 2.855556, 0, 1, 0.02352941, 1,
-0.4731061, 0.04138281, -1.756466, 0, 1, 0.02745098, 1,
-0.469964, -0.3946859, -3.138423, 0, 1, 0.03529412, 1,
-0.4668908, -1.013971, -4.45913, 0, 1, 0.03921569, 1,
-0.4635932, -1.47104, -1.141164, 0, 1, 0.04705882, 1,
-0.4607796, -0.8192565, -1.09584, 0, 1, 0.05098039, 1,
-0.4540474, -0.6012943, -3.092776, 0, 1, 0.05882353, 1,
-0.4520568, -0.597598, -2.431925, 0, 1, 0.0627451, 1,
-0.4520307, 0.162161, -0.7635, 0, 1, 0.07058824, 1,
-0.4474266, 0.3841546, -2.14603, 0, 1, 0.07450981, 1,
-0.4472349, 1.535426, -0.183353, 0, 1, 0.08235294, 1,
-0.4451521, 0.3539127, 0.4565852, 0, 1, 0.08627451, 1,
-0.4436385, -1.287517, -4.106488, 0, 1, 0.09411765, 1,
-0.4423528, 0.5188367, -0.2693799, 0, 1, 0.1019608, 1,
-0.4399426, 1.516574, -1.232472, 0, 1, 0.1058824, 1,
-0.4341486, -0.5006604, -2.650337, 0, 1, 0.1137255, 1,
-0.4333061, 0.6352288, 1.295187, 0, 1, 0.1176471, 1,
-0.4308215, -0.8129748, -3.50244, 0, 1, 0.1254902, 1,
-0.4261965, -1.206717, -2.889897, 0, 1, 0.1294118, 1,
-0.4236623, 0.3998643, -0.04812782, 0, 1, 0.1372549, 1,
-0.4214694, 0.9811007, 0.4285263, 0, 1, 0.1411765, 1,
-0.4196265, -0.4889506, -2.085808, 0, 1, 0.1490196, 1,
-0.4102988, 0.1336871, -2.008979, 0, 1, 0.1529412, 1,
-0.4065875, 1.09169, 0.1531902, 0, 1, 0.1607843, 1,
-0.4063157, -1.70417, -3.280684, 0, 1, 0.1647059, 1,
-0.401298, -1.012529, -1.815417, 0, 1, 0.172549, 1,
-0.399121, 0.06101162, -0.2796288, 0, 1, 0.1764706, 1,
-0.3986592, 0.03556157, -2.36458, 0, 1, 0.1843137, 1,
-0.3962905, 0.7436475, -1.824659, 0, 1, 0.1882353, 1,
-0.3882427, -0.2644338, -2.042248, 0, 1, 0.1960784, 1,
-0.3820308, 0.05343671, -1.150056, 0, 1, 0.2039216, 1,
-0.3810759, 0.1933808, -2.863046, 0, 1, 0.2078431, 1,
-0.3791398, -2.008492, -3.007696, 0, 1, 0.2156863, 1,
-0.3787075, -0.6187795, -3.624406, 0, 1, 0.2196078, 1,
-0.3741514, 0.9538132, -0.1829661, 0, 1, 0.227451, 1,
-0.3728501, 0.1696106, -1.079745, 0, 1, 0.2313726, 1,
-0.3701206, 1.459632, 0.8845484, 0, 1, 0.2392157, 1,
-0.3676109, -0.04321848, -1.246496, 0, 1, 0.2431373, 1,
-0.3575636, -2.510441, -4.051373, 0, 1, 0.2509804, 1,
-0.3561931, 1.103206, 0.3621618, 0, 1, 0.254902, 1,
-0.3559693, 1.346898, -0.747489, 0, 1, 0.2627451, 1,
-0.3529449, 0.8878523, -0.1438742, 0, 1, 0.2666667, 1,
-0.3496215, 0.3541757, -1.219415, 0, 1, 0.2745098, 1,
-0.3491291, 0.4824651, -0.365127, 0, 1, 0.2784314, 1,
-0.3487306, 0.2003165, -1.41061, 0, 1, 0.2862745, 1,
-0.3483438, 0.03196586, -1.018445, 0, 1, 0.2901961, 1,
-0.3464687, 1.032916, 0.01780253, 0, 1, 0.2980392, 1,
-0.3428604, -0.9749739, -0.784152, 0, 1, 0.3058824, 1,
-0.3385933, -1.306313, -2.155934, 0, 1, 0.3098039, 1,
-0.3363166, -1.903857, -3.565223, 0, 1, 0.3176471, 1,
-0.3357539, 1.427006, -0.3308111, 0, 1, 0.3215686, 1,
-0.3341763, 0.839762, -1.070357, 0, 1, 0.3294118, 1,
-0.3333462, 1.19321, -0.592352, 0, 1, 0.3333333, 1,
-0.3269945, 0.5439306, -2.405453, 0, 1, 0.3411765, 1,
-0.3222146, -1.371548, -3.289712, 0, 1, 0.345098, 1,
-0.3218394, 0.829565, 0.3215759, 0, 1, 0.3529412, 1,
-0.3212956, -0.98108, -3.173559, 0, 1, 0.3568628, 1,
-0.3207828, 0.3404981, -1.495193, 0, 1, 0.3647059, 1,
-0.3100189, -0.6586407, -1.548177, 0, 1, 0.3686275, 1,
-0.307533, -1.877313, -1.238041, 0, 1, 0.3764706, 1,
-0.3069341, -1.460035, -2.545446, 0, 1, 0.3803922, 1,
-0.3065276, 0.7492638, -0.4612685, 0, 1, 0.3882353, 1,
-0.3063752, -1.053985, -4.69518, 0, 1, 0.3921569, 1,
-0.3041194, -2.235481, -3.439186, 0, 1, 0.4, 1,
-0.2926556, 1.00873, 0.1608351, 0, 1, 0.4078431, 1,
-0.2925512, 0.4234149, -0.7232277, 0, 1, 0.4117647, 1,
-0.287955, 0.901919, 0.1940723, 0, 1, 0.4196078, 1,
-0.2843395, 0.7561393, -1.609834, 0, 1, 0.4235294, 1,
-0.2828647, 1.013613, 1.357772, 0, 1, 0.4313726, 1,
-0.2739067, -0.6748249, -1.898095, 0, 1, 0.4352941, 1,
-0.2734578, -0.463779, -2.813409, 0, 1, 0.4431373, 1,
-0.2734446, -1.497666, -2.703008, 0, 1, 0.4470588, 1,
-0.2720118, -0.2646593, -3.222818, 0, 1, 0.454902, 1,
-0.2669465, 0.4895005, -0.1251605, 0, 1, 0.4588235, 1,
-0.2661361, 0.5381131, -0.5903843, 0, 1, 0.4666667, 1,
-0.2655489, 0.09690501, -0.6392025, 0, 1, 0.4705882, 1,
-0.2643752, 0.2445684, -0.7153975, 0, 1, 0.4784314, 1,
-0.2622571, -1.114796, -3.285495, 0, 1, 0.4823529, 1,
-0.2577789, 0.8683386, -0.6992018, 0, 1, 0.4901961, 1,
-0.2575864, 0.5395308, -0.679078, 0, 1, 0.4941176, 1,
-0.2503939, 1.14509, -0.8041126, 0, 1, 0.5019608, 1,
-0.2491208, 1.604454, -1.266847, 0, 1, 0.509804, 1,
-0.2469769, 0.8044928, 1.246718, 0, 1, 0.5137255, 1,
-0.2455969, -0.09791932, -0.8501523, 0, 1, 0.5215687, 1,
-0.2433617, -0.1884904, -4.660571, 0, 1, 0.5254902, 1,
-0.2426738, 1.100959, 0.06837769, 0, 1, 0.5333334, 1,
-0.2381122, -1.023228, -2.109051, 0, 1, 0.5372549, 1,
-0.2291373, 0.6246251, 0.1760618, 0, 1, 0.5450981, 1,
-0.2208302, 0.1337743, -1.891244, 0, 1, 0.5490196, 1,
-0.220228, -0.2732669, -2.427307, 0, 1, 0.5568628, 1,
-0.2190384, -0.6894054, -1.240531, 0, 1, 0.5607843, 1,
-0.2107584, -1.083996, -2.185961, 0, 1, 0.5686275, 1,
-0.2046097, -0.3855213, -3.003619, 0, 1, 0.572549, 1,
-0.2024301, -0.5712485, -3.227698, 0, 1, 0.5803922, 1,
-0.1996643, -0.8334128, -1.245579, 0, 1, 0.5843138, 1,
-0.195166, 0.7035813, -1.113057, 0, 1, 0.5921569, 1,
-0.1926802, 0.9502044, 0.6859579, 0, 1, 0.5960785, 1,
-0.1912582, 0.1515058, 0.5724843, 0, 1, 0.6039216, 1,
-0.1874157, -1.328291, -3.366165, 0, 1, 0.6117647, 1,
-0.1830934, -0.8329111, -2.085822, 0, 1, 0.6156863, 1,
-0.180994, -0.1241659, -2.858722, 0, 1, 0.6235294, 1,
-0.1704435, 0.1182607, -0.8510295, 0, 1, 0.627451, 1,
-0.1627696, 0.3552873, 0.5721968, 0, 1, 0.6352941, 1,
-0.1608829, -0.311217, -1.109661, 0, 1, 0.6392157, 1,
-0.1595542, 3.367482, 1.33371, 0, 1, 0.6470588, 1,
-0.1576972, 1.163273, -0.3924255, 0, 1, 0.6509804, 1,
-0.1553443, -0.1073794, -1.891945, 0, 1, 0.6588235, 1,
-0.1488305, 0.3116556, -0.7840501, 0, 1, 0.6627451, 1,
-0.1439431, -0.01936237, -3.062973, 0, 1, 0.6705883, 1,
-0.1388562, -0.5340391, -3.267269, 0, 1, 0.6745098, 1,
-0.1338774, 0.3863238, 0.5139384, 0, 1, 0.682353, 1,
-0.1337387, 1.54675, 0.6326716, 0, 1, 0.6862745, 1,
-0.1303567, -0.8665106, -1.829397, 0, 1, 0.6941177, 1,
-0.1286753, 0.5981588, 1.190199, 0, 1, 0.7019608, 1,
-0.1260805, -0.3110922, -3.047399, 0, 1, 0.7058824, 1,
-0.1243908, 0.3506274, -0.1033071, 0, 1, 0.7137255, 1,
-0.1212862, 0.5475404, -1.208321, 0, 1, 0.7176471, 1,
-0.1194646, -0.1902059, -1.010025, 0, 1, 0.7254902, 1,
-0.1135844, -0.4868141, -3.529072, 0, 1, 0.7294118, 1,
-0.1104391, 0.6525509, -0.05831765, 0, 1, 0.7372549, 1,
-0.1101298, -0.7277972, -3.234497, 0, 1, 0.7411765, 1,
-0.1049521, 1.325081, -0.1631204, 0, 1, 0.7490196, 1,
-0.1039204, 0.8505641, -0.4855392, 0, 1, 0.7529412, 1,
-0.1025131, 0.3191144, 1.125965, 0, 1, 0.7607843, 1,
-0.09819228, -0.5740441, -2.644869, 0, 1, 0.7647059, 1,
-0.09709588, -0.071902, -2.248254, 0, 1, 0.772549, 1,
-0.07513677, 1.567253, -1.193125, 0, 1, 0.7764706, 1,
-0.07511667, -0.4120263, -3.680227, 0, 1, 0.7843137, 1,
-0.06149149, 1.213014, 0.3311862, 0, 1, 0.7882353, 1,
-0.05902915, -0.294474, -4.096035, 0, 1, 0.7960784, 1,
-0.05753902, -0.9366733, -3.650047, 0, 1, 0.8039216, 1,
-0.05384894, 0.288754, -0.2611456, 0, 1, 0.8078431, 1,
-0.05280956, 0.9528736, 0.1682984, 0, 1, 0.8156863, 1,
-0.04585156, 1.218746, 1.052451, 0, 1, 0.8196079, 1,
-0.04479032, 0.1320294, -0.3581234, 0, 1, 0.827451, 1,
-0.04302109, -0.3794767, -3.364781, 0, 1, 0.8313726, 1,
-0.04127435, -1.546556, -4.26102, 0, 1, 0.8392157, 1,
-0.03912116, -1.137194, -2.764977, 0, 1, 0.8431373, 1,
-0.03644419, -0.5920362, -3.587272, 0, 1, 0.8509804, 1,
-0.03544433, 1.089114, 1.292616, 0, 1, 0.854902, 1,
-0.03383937, -0.6056011, -2.440577, 0, 1, 0.8627451, 1,
-0.0337224, 0.982577, 0.7079387, 0, 1, 0.8666667, 1,
-0.03314744, 0.749249, 0.161896, 0, 1, 0.8745098, 1,
-0.03287845, -1.392524, -1.201607, 0, 1, 0.8784314, 1,
-0.0303629, 0.3436033, -0.243199, 0, 1, 0.8862745, 1,
-0.02980517, 0.2444304, 0.6768724, 0, 1, 0.8901961, 1,
-0.02977988, 0.2240295, -1.137824, 0, 1, 0.8980392, 1,
-0.02802186, -0.4350211, -1.796548, 0, 1, 0.9058824, 1,
-0.02524219, -1.33915, -1.812624, 0, 1, 0.9098039, 1,
-0.02508743, 0.8667619, 0.7157205, 0, 1, 0.9176471, 1,
-0.01904722, 0.4724193, 0.3341176, 0, 1, 0.9215686, 1,
-0.0152634, -1.105865, -2.970871, 0, 1, 0.9294118, 1,
-0.01466564, -2.095871, -2.128067, 0, 1, 0.9333333, 1,
-0.01007963, 1.867706, -2.232501, 0, 1, 0.9411765, 1,
-0.007047409, 1.189373, 0.6399313, 0, 1, 0.945098, 1,
0.003021119, 0.3765811, 0.6096711, 0, 1, 0.9529412, 1,
0.005164019, 0.8764982, -0.6985158, 0, 1, 0.9568627, 1,
0.007279937, 0.5994215, 1.899369, 0, 1, 0.9647059, 1,
0.0148687, 0.5329251, 0.7084675, 0, 1, 0.9686275, 1,
0.01504276, -0.4927225, 3.819189, 0, 1, 0.9764706, 1,
0.01686786, -0.7732064, 3.450866, 0, 1, 0.9803922, 1,
0.01869596, 1.985475, 0.2574977, 0, 1, 0.9882353, 1,
0.02237507, 0.1568039, -0.5643021, 0, 1, 0.9921569, 1,
0.02823359, 1.071781, 0.8835273, 0, 1, 1, 1,
0.03102761, 0.5455803, 0.6177989, 0, 0.9921569, 1, 1,
0.03638448, 0.4107171, 0.6431823, 0, 0.9882353, 1, 1,
0.03968145, 2.019053, 1.140219, 0, 0.9803922, 1, 1,
0.03981312, 0.9457998, -0.8239685, 0, 0.9764706, 1, 1,
0.04186473, 0.9338101, 0.3018675, 0, 0.9686275, 1, 1,
0.04333405, 0.6803438, 0.2481943, 0, 0.9647059, 1, 1,
0.043686, 0.2838283, 1.312432, 0, 0.9568627, 1, 1,
0.04427616, 1.625301, -0.6574246, 0, 0.9529412, 1, 1,
0.04500297, 1.939465, -2.29669, 0, 0.945098, 1, 1,
0.04531652, -0.6754383, 2.116233, 0, 0.9411765, 1, 1,
0.04605432, -0.6929649, 3.336837, 0, 0.9333333, 1, 1,
0.05173031, -1.183641, 4.461375, 0, 0.9294118, 1, 1,
0.05182087, 0.7846294, 0.7848356, 0, 0.9215686, 1, 1,
0.05242651, 2.135522, -2.308836, 0, 0.9176471, 1, 1,
0.05475206, -0.5603688, 2.090519, 0, 0.9098039, 1, 1,
0.05760531, -0.7427343, 2.686837, 0, 0.9058824, 1, 1,
0.05862116, 0.1787994, 0.7058409, 0, 0.8980392, 1, 1,
0.05863346, 0.290258, 0.2243174, 0, 0.8901961, 1, 1,
0.06335728, -0.170095, 3.070759, 0, 0.8862745, 1, 1,
0.06461118, -0.287833, 4.509328, 0, 0.8784314, 1, 1,
0.06501826, -1.824259, 1.756419, 0, 0.8745098, 1, 1,
0.06731675, -1.560282, 2.012071, 0, 0.8666667, 1, 1,
0.0691899, 1.263263, 1.805752, 0, 0.8627451, 1, 1,
0.07133395, -0.2726992, 5.014143, 0, 0.854902, 1, 1,
0.07248572, -0.7556026, 2.419583, 0, 0.8509804, 1, 1,
0.07270617, -0.4935653, 3.322245, 0, 0.8431373, 1, 1,
0.07441801, 0.2735325, 2.344853, 0, 0.8392157, 1, 1,
0.08298311, -1.327909, 2.844372, 0, 0.8313726, 1, 1,
0.09817017, 0.4043163, 1.107735, 0, 0.827451, 1, 1,
0.09931341, 0.6893087, -0.2652297, 0, 0.8196079, 1, 1,
0.1015269, 0.7501824, 0.09684376, 0, 0.8156863, 1, 1,
0.1060253, -0.8239814, 1.95785, 0, 0.8078431, 1, 1,
0.1065708, -0.1727182, 3.585757, 0, 0.8039216, 1, 1,
0.1090209, -1.077775, 3.298178, 0, 0.7960784, 1, 1,
0.109793, 1.234183, 1.937456, 0, 0.7882353, 1, 1,
0.1120041, -0.9042256, 2.148756, 0, 0.7843137, 1, 1,
0.1145942, -2.334644, 2.893494, 0, 0.7764706, 1, 1,
0.1147831, -0.3430388, 2.30456, 0, 0.772549, 1, 1,
0.1222131, 0.9000539, 0.5010961, 0, 0.7647059, 1, 1,
0.122948, -1.503906, 2.243611, 0, 0.7607843, 1, 1,
0.13033, 1.396214, 0.02127279, 0, 0.7529412, 1, 1,
0.1357384, -0.5106075, 5.170004, 0, 0.7490196, 1, 1,
0.1376144, 0.4398268, 0.7693447, 0, 0.7411765, 1, 1,
0.1403891, -0.6886829, 4.559712, 0, 0.7372549, 1, 1,
0.140494, -0.3350408, 2.596292, 0, 0.7294118, 1, 1,
0.1418498, 1.878895, -0.4371213, 0, 0.7254902, 1, 1,
0.1429069, 0.03356336, 1.74812, 0, 0.7176471, 1, 1,
0.1454897, -0.07112872, 0.7031485, 0, 0.7137255, 1, 1,
0.1589761, -0.1298409, 2.480275, 0, 0.7058824, 1, 1,
0.1591786, 0.4453166, 0.7017584, 0, 0.6980392, 1, 1,
0.159709, -1.212561, 4.466667, 0, 0.6941177, 1, 1,
0.1597957, -0.4590116, 2.784995, 0, 0.6862745, 1, 1,
0.1617174, -0.20716, 2.933319, 0, 0.682353, 1, 1,
0.16228, -0.275865, 2.511653, 0, 0.6745098, 1, 1,
0.1628188, -0.8867115, 3.047556, 0, 0.6705883, 1, 1,
0.1633464, 1.375562, -0.4274328, 0, 0.6627451, 1, 1,
0.1654971, 1.006466, 1.871132, 0, 0.6588235, 1, 1,
0.1674339, -1.001433, 1.79479, 0, 0.6509804, 1, 1,
0.1726792, -1.962427, 3.525553, 0, 0.6470588, 1, 1,
0.1731339, -0.6829802, 3.33103, 0, 0.6392157, 1, 1,
0.1761792, -1.009751, 3.976267, 0, 0.6352941, 1, 1,
0.1765686, 0.1322002, -1.334627, 0, 0.627451, 1, 1,
0.1776761, 0.1635143, 0.2984154, 0, 0.6235294, 1, 1,
0.1783762, -1.221199, 3.547073, 0, 0.6156863, 1, 1,
0.1845658, 0.09890602, 0.1980861, 0, 0.6117647, 1, 1,
0.1868942, -1.906736, 2.807846, 0, 0.6039216, 1, 1,
0.1886816, -1.399324, 3.903122, 0, 0.5960785, 1, 1,
0.191659, 0.2259655, 1.34579, 0, 0.5921569, 1, 1,
0.1951998, -1.264575, 2.471749, 0, 0.5843138, 1, 1,
0.2016044, 0.008103556, 1.485858, 0, 0.5803922, 1, 1,
0.2016868, -0.8842973, 3.461742, 0, 0.572549, 1, 1,
0.2068354, 1.523208, 0.4956191, 0, 0.5686275, 1, 1,
0.2150311, 0.02889161, -0.04425111, 0, 0.5607843, 1, 1,
0.2154553, -0.4770617, 1.48815, 0, 0.5568628, 1, 1,
0.2169401, -0.07218204, 1.499933, 0, 0.5490196, 1, 1,
0.2170498, 0.2257279, -1.058993, 0, 0.5450981, 1, 1,
0.2171849, -1.005581, 2.185363, 0, 0.5372549, 1, 1,
0.2192148, 0.4813554, -0.3222595, 0, 0.5333334, 1, 1,
0.2201933, -0.4367261, 1.831037, 0, 0.5254902, 1, 1,
0.2222512, 0.7203944, 1.417313, 0, 0.5215687, 1, 1,
0.2233757, -1.109372, 4.529631, 0, 0.5137255, 1, 1,
0.2235885, -0.2879173, 1.986686, 0, 0.509804, 1, 1,
0.2266713, -0.167993, 1.034389, 0, 0.5019608, 1, 1,
0.2310519, 0.1540575, 1.276497, 0, 0.4941176, 1, 1,
0.2360997, 2.823913, -1.312558, 0, 0.4901961, 1, 1,
0.2376716, -1.039947, 2.750651, 0, 0.4823529, 1, 1,
0.2417184, 0.3751209, -0.02581244, 0, 0.4784314, 1, 1,
0.2423442, 0.4831692, 2.252177, 0, 0.4705882, 1, 1,
0.2434066, -0.8166702, 4.1745, 0, 0.4666667, 1, 1,
0.244374, 0.3589501, 0.3534969, 0, 0.4588235, 1, 1,
0.2447235, -0.08055384, 1.570771, 0, 0.454902, 1, 1,
0.2459118, 1.312758, -0.2434646, 0, 0.4470588, 1, 1,
0.2462732, 0.8995928, 0.8703161, 0, 0.4431373, 1, 1,
0.2501806, -0.01934495, 2.032486, 0, 0.4352941, 1, 1,
0.2603504, -2.084497, 3.356786, 0, 0.4313726, 1, 1,
0.2646382, 0.03539594, 1.805879, 0, 0.4235294, 1, 1,
0.2659845, -1.155296, 2.212961, 0, 0.4196078, 1, 1,
0.2699392, 0.7107897, 0.4045492, 0, 0.4117647, 1, 1,
0.273061, -1.38189, 0.7815519, 0, 0.4078431, 1, 1,
0.2750479, 0.0005485732, 2.782647, 0, 0.4, 1, 1,
0.276963, 1.347568, -0.4653206, 0, 0.3921569, 1, 1,
0.2789864, -1.01869, 2.697221, 0, 0.3882353, 1, 1,
0.2829768, -0.6991245, 2.75562, 0, 0.3803922, 1, 1,
0.2854696, 0.6667836, -0.3546708, 0, 0.3764706, 1, 1,
0.2857613, 2.194033, -0.00940156, 0, 0.3686275, 1, 1,
0.2861883, -0.7628556, 2.678828, 0, 0.3647059, 1, 1,
0.2871364, -0.8745842, 2.018344, 0, 0.3568628, 1, 1,
0.2883995, -0.4816824, 3.270269, 0, 0.3529412, 1, 1,
0.2916999, -2.113524, 3.261344, 0, 0.345098, 1, 1,
0.2967163, 0.02239775, 1.078464, 0, 0.3411765, 1, 1,
0.2980361, -0.4222409, 0.9748647, 0, 0.3333333, 1, 1,
0.2988458, -1.098876, 2.793211, 0, 0.3294118, 1, 1,
0.3009113, 2.447996, 1.431731, 0, 0.3215686, 1, 1,
0.3079637, -0.4947219, 2.690711, 0, 0.3176471, 1, 1,
0.3097626, -0.02821265, 2.74599, 0, 0.3098039, 1, 1,
0.3145117, -0.1502533, 1.595066, 0, 0.3058824, 1, 1,
0.3174075, 0.8862603, 0.9546719, 0, 0.2980392, 1, 1,
0.3254862, 0.9539413, 0.01089073, 0, 0.2901961, 1, 1,
0.3285765, 0.6947476, 0.5856061, 0, 0.2862745, 1, 1,
0.3319752, -0.6154167, 3.146674, 0, 0.2784314, 1, 1,
0.3374124, 0.7662405, 1.597847, 0, 0.2745098, 1, 1,
0.3400591, -0.7869533, 2.172042, 0, 0.2666667, 1, 1,
0.3420306, -1.515969, 0.9507065, 0, 0.2627451, 1, 1,
0.346595, -0.9338109, 3.164589, 0, 0.254902, 1, 1,
0.346849, 0.8604311, -0.3741503, 0, 0.2509804, 1, 1,
0.3532259, 0.7752686, -2.034891, 0, 0.2431373, 1, 1,
0.3555438, -0.2743606, 3.541892, 0, 0.2392157, 1, 1,
0.3568368, 0.7068694, 1.444041, 0, 0.2313726, 1, 1,
0.3569936, -0.1284873, 1.196285, 0, 0.227451, 1, 1,
0.3582956, -1.670191, 2.700577, 0, 0.2196078, 1, 1,
0.3597068, 1.006665, 0.6260363, 0, 0.2156863, 1, 1,
0.3723754, 1.627958, -0.3000934, 0, 0.2078431, 1, 1,
0.3737893, -0.2533668, 1.76198, 0, 0.2039216, 1, 1,
0.3756536, -0.5371804, 0.5686563, 0, 0.1960784, 1, 1,
0.3762155, -0.9775897, 3.620976, 0, 0.1882353, 1, 1,
0.3787185, 0.7399338, 0.2433033, 0, 0.1843137, 1, 1,
0.3804324, -0.1124142, 1.334023, 0, 0.1764706, 1, 1,
0.3816637, -0.3310978, 2.109103, 0, 0.172549, 1, 1,
0.3822162, -0.6279387, 2.549377, 0, 0.1647059, 1, 1,
0.3830586, -2.897843, 2.612184, 0, 0.1607843, 1, 1,
0.3855654, 0.3465755, 2.842115, 0, 0.1529412, 1, 1,
0.3870855, 0.1017111, 1.386498, 0, 0.1490196, 1, 1,
0.3874571, 0.448718, 2.057095, 0, 0.1411765, 1, 1,
0.3915484, -0.491054, 2.178041, 0, 0.1372549, 1, 1,
0.3946824, 0.3766558, 1.199932, 0, 0.1294118, 1, 1,
0.3964482, 0.01430345, 3.602128, 0, 0.1254902, 1, 1,
0.3968257, 0.9320247, 0.6139556, 0, 0.1176471, 1, 1,
0.3971412, -1.583321, 3.899851, 0, 0.1137255, 1, 1,
0.4028467, 1.720124, -0.8710674, 0, 0.1058824, 1, 1,
0.4041438, -0.7175522, 3.04178, 0, 0.09803922, 1, 1,
0.4066524, -0.6640851, 2.628218, 0, 0.09411765, 1, 1,
0.4152689, -1.441476, 3.285786, 0, 0.08627451, 1, 1,
0.4237489, 0.8437796, 0.1006835, 0, 0.08235294, 1, 1,
0.4291698, 0.7302719, 1.332237, 0, 0.07450981, 1, 1,
0.4317411, -0.3845537, 2.483185, 0, 0.07058824, 1, 1,
0.4393468, -0.8658177, 4.440806, 0, 0.0627451, 1, 1,
0.4396804, -0.3199112, 1.268434, 0, 0.05882353, 1, 1,
0.4400583, 0.6048635, -0.7181009, 0, 0.05098039, 1, 1,
0.4401353, -0.7575108, 2.689097, 0, 0.04705882, 1, 1,
0.440387, -0.5204003, 2.818444, 0, 0.03921569, 1, 1,
0.4420962, -0.747207, 2.933087, 0, 0.03529412, 1, 1,
0.4425902, -0.4645005, 2.641077, 0, 0.02745098, 1, 1,
0.4449458, 1.752023, 0.08002402, 0, 0.02352941, 1, 1,
0.4455696, -0.5891904, 2.426551, 0, 0.01568628, 1, 1,
0.4496214, 0.06081466, 2.232503, 0, 0.01176471, 1, 1,
0.4597757, -0.6003186, 2.529764, 0, 0.003921569, 1, 1,
0.4609061, -0.4759066, 1.657904, 0.003921569, 0, 1, 1,
0.4619195, -0.7971845, 2.323864, 0.007843138, 0, 1, 1,
0.4694878, -0.7047165, 1.198887, 0.01568628, 0, 1, 1,
0.4731612, 0.4575432, 0.1478579, 0.01960784, 0, 1, 1,
0.4733134, 1.216785, 1.958077, 0.02745098, 0, 1, 1,
0.4740633, -0.9765661, 2.963128, 0.03137255, 0, 1, 1,
0.4756368, -0.3434438, 1.441828, 0.03921569, 0, 1, 1,
0.4798985, -0.1145319, 1.015789, 0.04313726, 0, 1, 1,
0.4826785, -0.1972558, 1.80148, 0.05098039, 0, 1, 1,
0.486743, 1.532138, -1.36494, 0.05490196, 0, 1, 1,
0.4881229, 0.3976787, 0.7396728, 0.0627451, 0, 1, 1,
0.4910972, -0.281382, 0.9935296, 0.06666667, 0, 1, 1,
0.495439, -0.0805492, 1.48776, 0.07450981, 0, 1, 1,
0.4994091, 0.5969536, -0.1020929, 0.07843138, 0, 1, 1,
0.4995618, -0.8680766, 1.749315, 0.08627451, 0, 1, 1,
0.5027369, 0.9298508, -1.577904, 0.09019608, 0, 1, 1,
0.5036556, 0.4787621, 0.7737895, 0.09803922, 0, 1, 1,
0.5075153, 3.05719, 0.3693666, 0.1058824, 0, 1, 1,
0.507881, 0.2386257, 1.411976, 0.1098039, 0, 1, 1,
0.5083321, -0.1944168, 1.09101, 0.1176471, 0, 1, 1,
0.5124822, -0.3493439, 3.203105, 0.1215686, 0, 1, 1,
0.5136301, 0.1310727, 1.560168, 0.1294118, 0, 1, 1,
0.5156674, 0.7819321, 2.190924, 0.1333333, 0, 1, 1,
0.5166769, 0.03445288, 1.165498, 0.1411765, 0, 1, 1,
0.5170195, 0.8363039, 0.9398731, 0.145098, 0, 1, 1,
0.5187982, -0.6195875, 2.331547, 0.1529412, 0, 1, 1,
0.5218906, -0.1720509, 0.8780487, 0.1568628, 0, 1, 1,
0.5267706, 0.171751, 1.664619, 0.1647059, 0, 1, 1,
0.5280804, -0.8016961, 4.301455, 0.1686275, 0, 1, 1,
0.5288917, -0.6864887, 2.625991, 0.1764706, 0, 1, 1,
0.5334706, -0.04173732, 2.163968, 0.1803922, 0, 1, 1,
0.5353579, -0.5341194, 2.935306, 0.1882353, 0, 1, 1,
0.5417092, -0.6534399, 2.67529, 0.1921569, 0, 1, 1,
0.5432798, -1.234969, 4.556646, 0.2, 0, 1, 1,
0.543741, -0.2406928, 1.938581, 0.2078431, 0, 1, 1,
0.5514531, 0.4970046, 1.703495, 0.2117647, 0, 1, 1,
0.5538953, 1.016854, -0.4391522, 0.2196078, 0, 1, 1,
0.5567951, -1.448403, 1.889802, 0.2235294, 0, 1, 1,
0.5589883, 0.7984071, 0.489479, 0.2313726, 0, 1, 1,
0.5591918, 0.3032078, 1.743894, 0.2352941, 0, 1, 1,
0.5610487, 0.03632575, 2.323604, 0.2431373, 0, 1, 1,
0.5623258, -0.8142936, 1.82256, 0.2470588, 0, 1, 1,
0.5650463, -0.345805, 1.578608, 0.254902, 0, 1, 1,
0.5657727, -0.204621, 0.7895201, 0.2588235, 0, 1, 1,
0.572033, 0.9606278, -0.3098078, 0.2666667, 0, 1, 1,
0.5750341, -1.498531, 2.099564, 0.2705882, 0, 1, 1,
0.581649, -0.4413858, 1.036528, 0.2784314, 0, 1, 1,
0.5834768, -0.1218979, 1.45528, 0.282353, 0, 1, 1,
0.5888204, 0.1232239, 1.207145, 0.2901961, 0, 1, 1,
0.5911554, 0.3353572, 1.452372, 0.2941177, 0, 1, 1,
0.5977184, 0.4160121, 0.3980371, 0.3019608, 0, 1, 1,
0.5980995, -0.2434529, 2.080538, 0.3098039, 0, 1, 1,
0.6047157, -0.3930348, 2.266527, 0.3137255, 0, 1, 1,
0.6090421, -0.8202587, 2.042487, 0.3215686, 0, 1, 1,
0.6098647, 0.3824195, 2.759844, 0.3254902, 0, 1, 1,
0.609893, -0.5763829, 3.665972, 0.3333333, 0, 1, 1,
0.6122426, -0.1669455, 2.437864, 0.3372549, 0, 1, 1,
0.6131057, 0.08994238, 1.373376, 0.345098, 0, 1, 1,
0.6143472, 0.7200699, -0.518015, 0.3490196, 0, 1, 1,
0.6152173, 0.1002646, 2.78991, 0.3568628, 0, 1, 1,
0.6186941, 0.6689064, 0.7980394, 0.3607843, 0, 1, 1,
0.6199255, 0.306659, -0.1684104, 0.3686275, 0, 1, 1,
0.6220958, 2.188115, -0.8430505, 0.372549, 0, 1, 1,
0.6228141, -0.1402726, 0.7382806, 0.3803922, 0, 1, 1,
0.6234133, -0.9437522, 2.423256, 0.3843137, 0, 1, 1,
0.6301845, 0.7104904, 0.6834583, 0.3921569, 0, 1, 1,
0.6369955, -1.752341, 1.705503, 0.3960784, 0, 1, 1,
0.6375822, -1.328422, 1.735572, 0.4039216, 0, 1, 1,
0.6392319, -1.605441, 3.283536, 0.4117647, 0, 1, 1,
0.6402981, -0.4117745, 1.92714, 0.4156863, 0, 1, 1,
0.6407468, -1.168963, 3.011479, 0.4235294, 0, 1, 1,
0.6408137, -1.105783, 2.910148, 0.427451, 0, 1, 1,
0.6434457, 0.02314385, 3.063699, 0.4352941, 0, 1, 1,
0.6445407, 0.9734977, 1.918158, 0.4392157, 0, 1, 1,
0.6459129, -0.523473, 2.053715, 0.4470588, 0, 1, 1,
0.6514859, 0.4537692, 2.017505, 0.4509804, 0, 1, 1,
0.6517746, 0.3960238, 0.5773066, 0.4588235, 0, 1, 1,
0.6536841, -0.5664821, 2.933586, 0.4627451, 0, 1, 1,
0.6540895, 0.3075375, 0.8546979, 0.4705882, 0, 1, 1,
0.6601598, 0.4628114, 0.3259129, 0.4745098, 0, 1, 1,
0.6619605, -0.2507412, 1.535463, 0.4823529, 0, 1, 1,
0.666436, 0.6661875, 1.449983, 0.4862745, 0, 1, 1,
0.669991, -1.123527, 0.9758845, 0.4941176, 0, 1, 1,
0.6701485, -0.1654973, -0.5426247, 0.5019608, 0, 1, 1,
0.6704386, 0.7395125, -0.2615545, 0.5058824, 0, 1, 1,
0.6721946, -0.2640439, 1.883549, 0.5137255, 0, 1, 1,
0.6785794, 0.4368353, 1.602049, 0.5176471, 0, 1, 1,
0.6872925, 0.2861011, 0.7644724, 0.5254902, 0, 1, 1,
0.6881978, -0.5958423, 2.364533, 0.5294118, 0, 1, 1,
0.6893665, -0.3720353, 1.337226, 0.5372549, 0, 1, 1,
0.6896337, 0.2087083, 1.082101, 0.5411765, 0, 1, 1,
0.6901078, 0.1221712, 2.135472, 0.5490196, 0, 1, 1,
0.6931143, -0.7871853, 2.364101, 0.5529412, 0, 1, 1,
0.6931279, 0.9731859, 2.890008, 0.5607843, 0, 1, 1,
0.6950847, -0.8422983, 0.9740918, 0.5647059, 0, 1, 1,
0.695392, 1.1615, -0.5022359, 0.572549, 0, 1, 1,
0.6991177, 0.04362859, 1.246036, 0.5764706, 0, 1, 1,
0.7000969, -0.479168, 2.73794, 0.5843138, 0, 1, 1,
0.7096513, 0.01093839, 0.6463711, 0.5882353, 0, 1, 1,
0.7137743, 0.9574754, 0.5627975, 0.5960785, 0, 1, 1,
0.7230096, -2.23438, 2.840191, 0.6039216, 0, 1, 1,
0.7248538, -1.255377, 1.583124, 0.6078432, 0, 1, 1,
0.7274621, 0.3347825, 0.885296, 0.6156863, 0, 1, 1,
0.7299508, -1.155198, 3.687524, 0.6196079, 0, 1, 1,
0.7302438, 0.5681217, 0.9094198, 0.627451, 0, 1, 1,
0.7321241, -0.07956862, 1.146895, 0.6313726, 0, 1, 1,
0.7455297, -0.1876788, 3.478826, 0.6392157, 0, 1, 1,
0.7457505, -0.3718048, 2.448515, 0.6431373, 0, 1, 1,
0.7511982, -0.57706, 2.72473, 0.6509804, 0, 1, 1,
0.7537932, -2.01487, 1.863521, 0.654902, 0, 1, 1,
0.7548447, -1.448764, 2.994351, 0.6627451, 0, 1, 1,
0.7588192, -0.154868, 2.594851, 0.6666667, 0, 1, 1,
0.7603722, -1.655293, 2.670051, 0.6745098, 0, 1, 1,
0.7626883, 0.201263, 1.35476, 0.6784314, 0, 1, 1,
0.7678601, -0.0774576, 1.063794, 0.6862745, 0, 1, 1,
0.7763513, 0.3724052, 1.927979, 0.6901961, 0, 1, 1,
0.7792087, -0.3515525, 1.47447, 0.6980392, 0, 1, 1,
0.78263, 0.5507777, 0.5628403, 0.7058824, 0, 1, 1,
0.7833905, 1.229324, 1.73725, 0.7098039, 0, 1, 1,
0.7851843, -1.120849, 3.062655, 0.7176471, 0, 1, 1,
0.7855692, 0.5675121, 2.096421, 0.7215686, 0, 1, 1,
0.7930279, -0.4443189, 1.689371, 0.7294118, 0, 1, 1,
0.793286, -0.2339745, 2.282881, 0.7333333, 0, 1, 1,
0.7961031, -1.949053, 4.474326, 0.7411765, 0, 1, 1,
0.7961931, -0.9235576, 3.631116, 0.7450981, 0, 1, 1,
0.7973898, -0.1042357, 1.585798, 0.7529412, 0, 1, 1,
0.8101166, -1.395936, 0.7624, 0.7568628, 0, 1, 1,
0.8119296, -0.6492201, 0.4362845, 0.7647059, 0, 1, 1,
0.8193406, -0.002446172, 2.324993, 0.7686275, 0, 1, 1,
0.8208538, 0.2153873, -0.216143, 0.7764706, 0, 1, 1,
0.8261973, -1.219239, 4.122828, 0.7803922, 0, 1, 1,
0.8277448, 0.8897942, 0.02547553, 0.7882353, 0, 1, 1,
0.8347307, -1.458808, 2.950359, 0.7921569, 0, 1, 1,
0.836278, 0.4455437, 0.6563408, 0.8, 0, 1, 1,
0.8388003, -1.708891, 3.580605, 0.8078431, 0, 1, 1,
0.8480195, 0.07537557, 1.821521, 0.8117647, 0, 1, 1,
0.8508002, 1.336917, 2.287327, 0.8196079, 0, 1, 1,
0.8512188, -0.9245795, 2.219397, 0.8235294, 0, 1, 1,
0.8549438, -0.3654647, 2.329277, 0.8313726, 0, 1, 1,
0.8612715, -1.528358, 3.527107, 0.8352941, 0, 1, 1,
0.8617386, 0.004786194, 2.536932, 0.8431373, 0, 1, 1,
0.8631629, 0.7035375, 0.009312078, 0.8470588, 0, 1, 1,
0.8661941, 1.388039, 1.41723, 0.854902, 0, 1, 1,
0.8696707, 0.1859138, 1.626565, 0.8588235, 0, 1, 1,
0.8697951, 0.2635481, 0.2228446, 0.8666667, 0, 1, 1,
0.8731224, -1.153132, 2.620408, 0.8705882, 0, 1, 1,
0.8791378, 0.383967, 1.617978, 0.8784314, 0, 1, 1,
0.8792079, 0.1244664, -0.581722, 0.8823529, 0, 1, 1,
0.8826111, 0.1981323, 0.626629, 0.8901961, 0, 1, 1,
0.8989831, -0.842315, 1.845224, 0.8941177, 0, 1, 1,
0.9063488, -0.3591932, 0.495802, 0.9019608, 0, 1, 1,
0.906485, -1.895608, 2.410643, 0.9098039, 0, 1, 1,
0.9072751, 0.9334968, -0.1822099, 0.9137255, 0, 1, 1,
0.9080891, 0.0973034, 0.6531469, 0.9215686, 0, 1, 1,
0.9091702, -0.3940025, 0.1405396, 0.9254902, 0, 1, 1,
0.9117972, 2.058361, -1.64941, 0.9333333, 0, 1, 1,
0.9146553, -0.8534514, 2.022757, 0.9372549, 0, 1, 1,
0.9180194, -0.04396831, 0.679574, 0.945098, 0, 1, 1,
0.9184198, 0.005161653, 1.184507, 0.9490196, 0, 1, 1,
0.9271079, -0.2369921, 1.34611, 0.9568627, 0, 1, 1,
0.9291031, -0.073204, 1.051682, 0.9607843, 0, 1, 1,
0.9315954, 0.5949787, 1.684738, 0.9686275, 0, 1, 1,
0.9366961, 0.1449423, -0.133292, 0.972549, 0, 1, 1,
0.947917, -0.7533556, 5.153765, 0.9803922, 0, 1, 1,
0.9564718, 0.5208049, 2.158365, 0.9843137, 0, 1, 1,
0.9598023, -0.6369343, 0.9545245, 0.9921569, 0, 1, 1,
0.9626093, 1.081701, 1.993919, 0.9960784, 0, 1, 1,
0.963612, 1.249364, 0.05881518, 1, 0, 0.9960784, 1,
0.9671308, 1.926415, 1.536449, 1, 0, 0.9882353, 1,
0.9877748, -1.501197, 3.09447, 1, 0, 0.9843137, 1,
0.9952779, 0.3650651, -0.2334136, 1, 0, 0.9764706, 1,
0.9964778, 0.7683193, -0.1554419, 1, 0, 0.972549, 1,
0.999888, 0.2767034, 1.494691, 1, 0, 0.9647059, 1,
1.000208, -0.9845082, 0.781543, 1, 0, 0.9607843, 1,
1.000272, -1.376672, 3.645246, 1, 0, 0.9529412, 1,
1.005631, -0.4237905, 2.53641, 1, 0, 0.9490196, 1,
1.007488, 0.1238725, -0.3543184, 1, 0, 0.9411765, 1,
1.007613, -0.09256484, 2.461406, 1, 0, 0.9372549, 1,
1.01252, 0.2464784, 2.449225, 1, 0, 0.9294118, 1,
1.013294, 1.423836, 1.227492, 1, 0, 0.9254902, 1,
1.013574, 0.5416757, 1.303105, 1, 0, 0.9176471, 1,
1.015578, 0.3082339, 0.9623684, 1, 0, 0.9137255, 1,
1.022646, 0.6460562, 1.078917, 1, 0, 0.9058824, 1,
1.024927, -0.5291222, 3.628962, 1, 0, 0.9019608, 1,
1.027199, 0.1921397, 0.3613521, 1, 0, 0.8941177, 1,
1.027712, 0.6558036, 1.533944, 1, 0, 0.8862745, 1,
1.02881, -0.8915086, 1.627231, 1, 0, 0.8823529, 1,
1.047954, 0.6905558, -0.8969418, 1, 0, 0.8745098, 1,
1.050231, -0.0881388, 2.315725, 1, 0, 0.8705882, 1,
1.055795, -1.177418, 3.328069, 1, 0, 0.8627451, 1,
1.058333, -1.107245, 1.137084, 1, 0, 0.8588235, 1,
1.058936, -1.440355, 2.835602, 1, 0, 0.8509804, 1,
1.061506, -0.4907399, 3.455788, 1, 0, 0.8470588, 1,
1.067938, 1.126995, 0.209943, 1, 0, 0.8392157, 1,
1.073545, 0.01380224, 4.013809, 1, 0, 0.8352941, 1,
1.077518, -0.8435995, 2.738715, 1, 0, 0.827451, 1,
1.084821, -0.6247917, 2.191776, 1, 0, 0.8235294, 1,
1.085613, 1.203056, 0.06389131, 1, 0, 0.8156863, 1,
1.086665, 0.2040667, -1.278661, 1, 0, 0.8117647, 1,
1.093971, -0.07498872, 2.075351, 1, 0, 0.8039216, 1,
1.102003, 0.5282593, 0.006975053, 1, 0, 0.7960784, 1,
1.103986, 1.731711, 0.6645871, 1, 0, 0.7921569, 1,
1.111623, -0.07140288, 2.458146, 1, 0, 0.7843137, 1,
1.113946, 0.9667371, -1.316954, 1, 0, 0.7803922, 1,
1.116446, 1.190958, 1.515951, 1, 0, 0.772549, 1,
1.119793, -1.494636, 3.095274, 1, 0, 0.7686275, 1,
1.122514, 0.199476, 1.215071, 1, 0, 0.7607843, 1,
1.12618, -1.355119, 1.359002, 1, 0, 0.7568628, 1,
1.129542, -1.084965, 1.25356, 1, 0, 0.7490196, 1,
1.135371, 0.5247213, 1.953287, 1, 0, 0.7450981, 1,
1.151282, 0.4510263, 0.4856817, 1, 0, 0.7372549, 1,
1.156428, 1.047113, 1.028063, 1, 0, 0.7333333, 1,
1.165848, 0.6551225, 2.074167, 1, 0, 0.7254902, 1,
1.166371, 1.236422, -0.05265835, 1, 0, 0.7215686, 1,
1.172304, 0.6640991, 1.935708, 1, 0, 0.7137255, 1,
1.176019, -0.4008036, 0.9174041, 1, 0, 0.7098039, 1,
1.178298, -0.4826922, 3.201375, 1, 0, 0.7019608, 1,
1.183936, 0.9062309, 0.592428, 1, 0, 0.6941177, 1,
1.191458, -1.318984, 2.054588, 1, 0, 0.6901961, 1,
1.196266, 0.2742465, 1.613892, 1, 0, 0.682353, 1,
1.198902, 0.3870989, 0.2819031, 1, 0, 0.6784314, 1,
1.207956, -0.2643333, 2.181448, 1, 0, 0.6705883, 1,
1.209214, 0.3495245, 3.14645, 1, 0, 0.6666667, 1,
1.215045, 1.887563, 0.3526744, 1, 0, 0.6588235, 1,
1.223512, 0.5604884, -0.01497156, 1, 0, 0.654902, 1,
1.227463, -0.1478331, 2.109606, 1, 0, 0.6470588, 1,
1.233285, -0.6814351, 1.72945, 1, 0, 0.6431373, 1,
1.236566, 0.9068832, 1.316172, 1, 0, 0.6352941, 1,
1.242583, 0.4793712, 1.209762, 1, 0, 0.6313726, 1,
1.25196, -0.8960205, 2.637824, 1, 0, 0.6235294, 1,
1.262745, 1.292414, 0.7319289, 1, 0, 0.6196079, 1,
1.265306, 1.761344, 0.1681703, 1, 0, 0.6117647, 1,
1.286679, -1.782532, 3.583322, 1, 0, 0.6078432, 1,
1.287349, -0.03344631, 1.765238, 1, 0, 0.6, 1,
1.312735, -0.3371687, 1.728571, 1, 0, 0.5921569, 1,
1.319822, 1.399498, 1.028462, 1, 0, 0.5882353, 1,
1.321799, -0.8664055, -0.2548016, 1, 0, 0.5803922, 1,
1.330732, -1.185328, 1.668856, 1, 0, 0.5764706, 1,
1.336443, -0.06284165, 0.7941039, 1, 0, 0.5686275, 1,
1.339713, 1.537571, -0.07983746, 1, 0, 0.5647059, 1,
1.354756, 0.4118766, 1.511512, 1, 0, 0.5568628, 1,
1.358498, 1.149472, 1.910579, 1, 0, 0.5529412, 1,
1.35988, 0.05697359, 1.221458, 1, 0, 0.5450981, 1,
1.362552, 1.165986, 1.199411, 1, 0, 0.5411765, 1,
1.380486, -0.2216141, 0.2591558, 1, 0, 0.5333334, 1,
1.381033, -0.5206609, 2.557844, 1, 0, 0.5294118, 1,
1.384314, 0.6752683, 0.2417827, 1, 0, 0.5215687, 1,
1.391844, 0.6775727, 2.530805, 1, 0, 0.5176471, 1,
1.394479, -0.2556926, 1.188521, 1, 0, 0.509804, 1,
1.394716, -0.3332728, 2.057563, 1, 0, 0.5058824, 1,
1.397607, 0.6005971, 2.026258, 1, 0, 0.4980392, 1,
1.402131, -0.3609961, 1.300086, 1, 0, 0.4901961, 1,
1.402632, -1.687555, 4.132704, 1, 0, 0.4862745, 1,
1.405659, 0.593632, -1.316143, 1, 0, 0.4784314, 1,
1.411096, 0.6797162, 1.323079, 1, 0, 0.4745098, 1,
1.413327, -1.599612, 3.511491, 1, 0, 0.4666667, 1,
1.414152, 0.7507966, 0.5259048, 1, 0, 0.4627451, 1,
1.43258, -0.01917808, 1.223674, 1, 0, 0.454902, 1,
1.438641, -0.9837444, 2.613332, 1, 0, 0.4509804, 1,
1.441431, 0.1828918, 1.791023, 1, 0, 0.4431373, 1,
1.448874, 1.504694, 0.09764773, 1, 0, 0.4392157, 1,
1.453972, -0.7220387, 2.168316, 1, 0, 0.4313726, 1,
1.456336, 0.5594115, 1.527352, 1, 0, 0.427451, 1,
1.458948, -1.573357, 3.487145, 1, 0, 0.4196078, 1,
1.459419, -1.955912, 2.088159, 1, 0, 0.4156863, 1,
1.459448, -0.4163511, 1.795783, 1, 0, 0.4078431, 1,
1.464866, -0.5773394, 3.111789, 1, 0, 0.4039216, 1,
1.487342, -0.1125391, 0.4164851, 1, 0, 0.3960784, 1,
1.487753, 0.08432908, 0.218825, 1, 0, 0.3882353, 1,
1.489769, -1.247418, 3.715819, 1, 0, 0.3843137, 1,
1.495098, 0.08133314, 0.9327747, 1, 0, 0.3764706, 1,
1.508078, -1.305023, 2.510145, 1, 0, 0.372549, 1,
1.531943, -0.02883351, 1.011359, 1, 0, 0.3647059, 1,
1.537624, -0.8671234, 3.464494, 1, 0, 0.3607843, 1,
1.542274, -0.4413965, 2.502082, 1, 0, 0.3529412, 1,
1.558904, 0.05027043, 1.317011, 1, 0, 0.3490196, 1,
1.567796, -0.5341206, 0.3192697, 1, 0, 0.3411765, 1,
1.579166, 0.2800902, -0.6858023, 1, 0, 0.3372549, 1,
1.581033, -1.107268, 1.127432, 1, 0, 0.3294118, 1,
1.64849, -1.431853, 2.004129, 1, 0, 0.3254902, 1,
1.667579, -0.06695656, 1.800816, 1, 0, 0.3176471, 1,
1.668032, 0.2337394, 1.579502, 1, 0, 0.3137255, 1,
1.66998, -0.1978537, 3.345175, 1, 0, 0.3058824, 1,
1.679638, -0.7936494, 2.65747, 1, 0, 0.2980392, 1,
1.683989, 1.197514, 0.5185304, 1, 0, 0.2941177, 1,
1.696252, 0.9793739, 1.17524, 1, 0, 0.2862745, 1,
1.709381, -0.1348372, 3.243374, 1, 0, 0.282353, 1,
1.715478, 2.551568, 0.5811069, 1, 0, 0.2745098, 1,
1.72168, 0.2763604, 1.622602, 1, 0, 0.2705882, 1,
1.733564, 1.361117, -1.073327, 1, 0, 0.2627451, 1,
1.735831, -0.3689892, 2.086, 1, 0, 0.2588235, 1,
1.750276, -0.6264824, 1.316227, 1, 0, 0.2509804, 1,
1.756115, -0.4813437, 2.309941, 1, 0, 0.2470588, 1,
1.760865, 0.9251487, 0.9738083, 1, 0, 0.2392157, 1,
1.765805, -0.1825658, 2.736249, 1, 0, 0.2352941, 1,
1.779039, -3.555328, 4.42566, 1, 0, 0.227451, 1,
1.787228, -0.8636999, 5.088916, 1, 0, 0.2235294, 1,
1.78858, -1.107064, 2.287422, 1, 0, 0.2156863, 1,
1.794188, 1.901475, -0.1825104, 1, 0, 0.2117647, 1,
1.80376, 0.6799877, 1.030398, 1, 0, 0.2039216, 1,
1.832852, 0.3886585, 1.478401, 1, 0, 0.1960784, 1,
1.874298, -2.194349, 2.939229, 1, 0, 0.1921569, 1,
1.922118, 0.1196733, -0.3089213, 1, 0, 0.1843137, 1,
1.94834, 0.09491236, 1.487306, 1, 0, 0.1803922, 1,
1.952471, 0.09443444, 1.390069, 1, 0, 0.172549, 1,
1.97372, -0.445428, 1.973156, 1, 0, 0.1686275, 1,
1.984563, 1.003992, 2.862931, 1, 0, 0.1607843, 1,
1.999216, 0.5149012, -0.6704794, 1, 0, 0.1568628, 1,
2.015773, 0.01596233, 0.06138324, 1, 0, 0.1490196, 1,
2.022144, -0.3626901, 0.2186378, 1, 0, 0.145098, 1,
2.047664, 1.942877, -0.5539535, 1, 0, 0.1372549, 1,
2.056956, 1.465246, 1.259227, 1, 0, 0.1333333, 1,
2.060684, -0.1065792, 1.342322, 1, 0, 0.1254902, 1,
2.080955, -0.5405206, 0.8029924, 1, 0, 0.1215686, 1,
2.098788, 0.4035415, 1.362452, 1, 0, 0.1137255, 1,
2.1551, -0.6216856, 2.032979, 1, 0, 0.1098039, 1,
2.216309, 0.8670855, 1.797634, 1, 0, 0.1019608, 1,
2.229816, -0.7839722, 0.821099, 1, 0, 0.09411765, 1,
2.276392, 1.939123, 0.8346857, 1, 0, 0.09019608, 1,
2.278098, -1.339798, 2.259322, 1, 0, 0.08235294, 1,
2.28107, 0.2440837, 0.6512903, 1, 0, 0.07843138, 1,
2.296937, 1.816553, -0.5331803, 1, 0, 0.07058824, 1,
2.301727, 1.195289, 1.062654, 1, 0, 0.06666667, 1,
2.355187, 1.759566, 0.5397716, 1, 0, 0.05882353, 1,
2.383658, -0.4079661, 0.4761047, 1, 0, 0.05490196, 1,
2.394096, 0.3468763, 0.8776932, 1, 0, 0.04705882, 1,
2.41315, -0.273043, 2.56655, 1, 0, 0.04313726, 1,
2.452115, -0.8546821, 3.347281, 1, 0, 0.03529412, 1,
2.677768, -0.7205677, 3.060246, 1, 0, 0.03137255, 1,
2.687129, 0.3698955, 1.858086, 1, 0, 0.02352941, 1,
3.055487, -0.9276589, 1.762975, 1, 0, 0.01960784, 1,
3.236125, 0.4001592, 0.9372185, 1, 0, 0.01176471, 1,
3.345468, -0.02965785, 1.680422, 1, 0, 0.007843138, 1
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
0.240265, -4.728744, -6.370019, 0, -0.5, 0.5, 0.5,
0.240265, -4.728744, -6.370019, 1, -0.5, 0.5, 0.5,
0.240265, -4.728744, -6.370019, 1, 1.5, 0.5, 0.5,
0.240265, -4.728744, -6.370019, 0, 1.5, 0.5, 0.5
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
-3.917602, -0.09392297, -6.370019, 0, -0.5, 0.5, 0.5,
-3.917602, -0.09392297, -6.370019, 1, -0.5, 0.5, 0.5,
-3.917602, -0.09392297, -6.370019, 1, 1.5, 0.5, 0.5,
-3.917602, -0.09392297, -6.370019, 0, 1.5, 0.5, 0.5
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
-3.917602, -4.728744, 0.2362618, 0, -0.5, 0.5, 0.5,
-3.917602, -4.728744, 0.2362618, 1, -0.5, 0.5, 0.5,
-3.917602, -4.728744, 0.2362618, 1, 1.5, 0.5, 0.5,
-3.917602, -4.728744, 0.2362618, 0, 1.5, 0.5, 0.5
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
-2, -3.65917, -4.845492,
3, -3.65917, -4.845492,
-2, -3.65917, -4.845492,
-2, -3.837432, -5.09958,
-1, -3.65917, -4.845492,
-1, -3.837432, -5.09958,
0, -3.65917, -4.845492,
0, -3.837432, -5.09958,
1, -3.65917, -4.845492,
1, -3.837432, -5.09958,
2, -3.65917, -4.845492,
2, -3.837432, -5.09958,
3, -3.65917, -4.845492,
3, -3.837432, -5.09958
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
-2, -4.193957, -5.607756, 0, -0.5, 0.5, 0.5,
-2, -4.193957, -5.607756, 1, -0.5, 0.5, 0.5,
-2, -4.193957, -5.607756, 1, 1.5, 0.5, 0.5,
-2, -4.193957, -5.607756, 0, 1.5, 0.5, 0.5,
-1, -4.193957, -5.607756, 0, -0.5, 0.5, 0.5,
-1, -4.193957, -5.607756, 1, -0.5, 0.5, 0.5,
-1, -4.193957, -5.607756, 1, 1.5, 0.5, 0.5,
-1, -4.193957, -5.607756, 0, 1.5, 0.5, 0.5,
0, -4.193957, -5.607756, 0, -0.5, 0.5, 0.5,
0, -4.193957, -5.607756, 1, -0.5, 0.5, 0.5,
0, -4.193957, -5.607756, 1, 1.5, 0.5, 0.5,
0, -4.193957, -5.607756, 0, 1.5, 0.5, 0.5,
1, -4.193957, -5.607756, 0, -0.5, 0.5, 0.5,
1, -4.193957, -5.607756, 1, -0.5, 0.5, 0.5,
1, -4.193957, -5.607756, 1, 1.5, 0.5, 0.5,
1, -4.193957, -5.607756, 0, 1.5, 0.5, 0.5,
2, -4.193957, -5.607756, 0, -0.5, 0.5, 0.5,
2, -4.193957, -5.607756, 1, -0.5, 0.5, 0.5,
2, -4.193957, -5.607756, 1, 1.5, 0.5, 0.5,
2, -4.193957, -5.607756, 0, 1.5, 0.5, 0.5,
3, -4.193957, -5.607756, 0, -0.5, 0.5, 0.5,
3, -4.193957, -5.607756, 1, -0.5, 0.5, 0.5,
3, -4.193957, -5.607756, 1, 1.5, 0.5, 0.5,
3, -4.193957, -5.607756, 0, 1.5, 0.5, 0.5
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
-2.958094, -3, -4.845492,
-2.958094, 3, -4.845492,
-2.958094, -3, -4.845492,
-3.118012, -3, -5.09958,
-2.958094, -2, -4.845492,
-3.118012, -2, -5.09958,
-2.958094, -1, -4.845492,
-3.118012, -1, -5.09958,
-2.958094, 0, -4.845492,
-3.118012, 0, -5.09958,
-2.958094, 1, -4.845492,
-3.118012, 1, -5.09958,
-2.958094, 2, -4.845492,
-3.118012, 2, -5.09958,
-2.958094, 3, -4.845492,
-3.118012, 3, -5.09958
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
-3.437848, -3, -5.607756, 0, -0.5, 0.5, 0.5,
-3.437848, -3, -5.607756, 1, -0.5, 0.5, 0.5,
-3.437848, -3, -5.607756, 1, 1.5, 0.5, 0.5,
-3.437848, -3, -5.607756, 0, 1.5, 0.5, 0.5,
-3.437848, -2, -5.607756, 0, -0.5, 0.5, 0.5,
-3.437848, -2, -5.607756, 1, -0.5, 0.5, 0.5,
-3.437848, -2, -5.607756, 1, 1.5, 0.5, 0.5,
-3.437848, -2, -5.607756, 0, 1.5, 0.5, 0.5,
-3.437848, -1, -5.607756, 0, -0.5, 0.5, 0.5,
-3.437848, -1, -5.607756, 1, -0.5, 0.5, 0.5,
-3.437848, -1, -5.607756, 1, 1.5, 0.5, 0.5,
-3.437848, -1, -5.607756, 0, 1.5, 0.5, 0.5,
-3.437848, 0, -5.607756, 0, -0.5, 0.5, 0.5,
-3.437848, 0, -5.607756, 1, -0.5, 0.5, 0.5,
-3.437848, 0, -5.607756, 1, 1.5, 0.5, 0.5,
-3.437848, 0, -5.607756, 0, 1.5, 0.5, 0.5,
-3.437848, 1, -5.607756, 0, -0.5, 0.5, 0.5,
-3.437848, 1, -5.607756, 1, -0.5, 0.5, 0.5,
-3.437848, 1, -5.607756, 1, 1.5, 0.5, 0.5,
-3.437848, 1, -5.607756, 0, 1.5, 0.5, 0.5,
-3.437848, 2, -5.607756, 0, -0.5, 0.5, 0.5,
-3.437848, 2, -5.607756, 1, -0.5, 0.5, 0.5,
-3.437848, 2, -5.607756, 1, 1.5, 0.5, 0.5,
-3.437848, 2, -5.607756, 0, 1.5, 0.5, 0.5,
-3.437848, 3, -5.607756, 0, -0.5, 0.5, 0.5,
-3.437848, 3, -5.607756, 1, -0.5, 0.5, 0.5,
-3.437848, 3, -5.607756, 1, 1.5, 0.5, 0.5,
-3.437848, 3, -5.607756, 0, 1.5, 0.5, 0.5
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
-2.958094, -3.65917, -4,
-2.958094, -3.65917, 4,
-2.958094, -3.65917, -4,
-3.118012, -3.837432, -4,
-2.958094, -3.65917, -2,
-3.118012, -3.837432, -2,
-2.958094, -3.65917, 0,
-3.118012, -3.837432, 0,
-2.958094, -3.65917, 2,
-3.118012, -3.837432, 2,
-2.958094, -3.65917, 4,
-3.118012, -3.837432, 4
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
-3.437848, -4.193957, -4, 0, -0.5, 0.5, 0.5,
-3.437848, -4.193957, -4, 1, -0.5, 0.5, 0.5,
-3.437848, -4.193957, -4, 1, 1.5, 0.5, 0.5,
-3.437848, -4.193957, -4, 0, 1.5, 0.5, 0.5,
-3.437848, -4.193957, -2, 0, -0.5, 0.5, 0.5,
-3.437848, -4.193957, -2, 1, -0.5, 0.5, 0.5,
-3.437848, -4.193957, -2, 1, 1.5, 0.5, 0.5,
-3.437848, -4.193957, -2, 0, 1.5, 0.5, 0.5,
-3.437848, -4.193957, 0, 0, -0.5, 0.5, 0.5,
-3.437848, -4.193957, 0, 1, -0.5, 0.5, 0.5,
-3.437848, -4.193957, 0, 1, 1.5, 0.5, 0.5,
-3.437848, -4.193957, 0, 0, 1.5, 0.5, 0.5,
-3.437848, -4.193957, 2, 0, -0.5, 0.5, 0.5,
-3.437848, -4.193957, 2, 1, -0.5, 0.5, 0.5,
-3.437848, -4.193957, 2, 1, 1.5, 0.5, 0.5,
-3.437848, -4.193957, 2, 0, 1.5, 0.5, 0.5,
-3.437848, -4.193957, 4, 0, -0.5, 0.5, 0.5,
-3.437848, -4.193957, 4, 1, -0.5, 0.5, 0.5,
-3.437848, -4.193957, 4, 1, 1.5, 0.5, 0.5,
-3.437848, -4.193957, 4, 0, 1.5, 0.5, 0.5
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
-2.958094, -3.65917, -4.845492,
-2.958094, 3.471324, -4.845492,
-2.958094, -3.65917, 5.318016,
-2.958094, 3.471324, 5.318016,
-2.958094, -3.65917, -4.845492,
-2.958094, -3.65917, 5.318016,
-2.958094, 3.471324, -4.845492,
-2.958094, 3.471324, 5.318016,
-2.958094, -3.65917, -4.845492,
3.438624, -3.65917, -4.845492,
-2.958094, -3.65917, 5.318016,
3.438624, -3.65917, 5.318016,
-2.958094, 3.471324, -4.845492,
3.438624, 3.471324, -4.845492,
-2.958094, 3.471324, 5.318016,
3.438624, 3.471324, 5.318016,
3.438624, -3.65917, -4.845492,
3.438624, 3.471324, -4.845492,
3.438624, -3.65917, 5.318016,
3.438624, 3.471324, 5.318016,
3.438624, -3.65917, -4.845492,
3.438624, -3.65917, 5.318016,
3.438624, 3.471324, -4.845492,
3.438624, 3.471324, 5.318016
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
var radius = 7.457758;
var distance = 33.18041;
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
mvMatrix.translate( -0.240265, 0.09392297, -0.2362618 );
mvMatrix.scale( 1.260564, 1.130844, 0.7933751 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.18041);
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
pyrimidine-2-sulfona<-read.table("pyrimidine-2-sulfona.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrimidine-2-sulfona$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidine' not found
```

```r
y<-pyrimidine-2-sulfona$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidine' not found
```

```r
z<-pyrimidine-2-sulfona$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidine' not found
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
-2.864938, -1.770672, -2.009045, 0, 0, 1, 1, 1,
-2.796277, 0.3621647, -1.36088, 1, 0, 0, 1, 1,
-2.505488, -0.7771235, -0.4704754, 1, 0, 0, 1, 1,
-2.387574, 0.4940819, -4.315485, 1, 0, 0, 1, 1,
-2.372448, 0.0001176851, -0.005991715, 1, 0, 0, 1, 1,
-2.355185, -0.2911499, -1.449027, 1, 0, 0, 1, 1,
-2.354888, -2.853453, -2.872648, 0, 0, 0, 1, 1,
-2.258642, 1.891588, -2.688184, 0, 0, 0, 1, 1,
-2.238753, 0.6192846, -2.872535, 0, 0, 0, 1, 1,
-2.23444, -0.8561119, -2.337615, 0, 0, 0, 1, 1,
-2.226178, 0.3048922, -1.960458, 0, 0, 0, 1, 1,
-2.216853, 1.433281, -3.364499, 0, 0, 0, 1, 1,
-2.194202, -0.1542924, -2.213234, 0, 0, 0, 1, 1,
-2.181023, 1.871568, -0.3418315, 1, 1, 1, 1, 1,
-2.112298, -0.8444331, 0.09559181, 1, 1, 1, 1, 1,
-2.078687, -1.030346, -3.357908, 1, 1, 1, 1, 1,
-2.066584, 0.08523583, -3.847574, 1, 1, 1, 1, 1,
-2.047983, -0.1560864, -1.722115, 1, 1, 1, 1, 1,
-2.04305, 1.63458, -0.6903175, 1, 1, 1, 1, 1,
-2.038421, 0.2716978, -0.7678785, 1, 1, 1, 1, 1,
-2.026193, -2.663149, -1.926898, 1, 1, 1, 1, 1,
-2.01264, -0.2450243, -2.170391, 1, 1, 1, 1, 1,
-2.011065, 0.1360466, -2.403628, 1, 1, 1, 1, 1,
-2.00419, 0.405711, -1.974059, 1, 1, 1, 1, 1,
-1.990112, -1.696006, -1.659082, 1, 1, 1, 1, 1,
-1.96437, -0.3066206, -1.695312, 1, 1, 1, 1, 1,
-1.962577, 0.5351289, -1.300613, 1, 1, 1, 1, 1,
-1.917593, 0.8553932, -1.502962, 1, 1, 1, 1, 1,
-1.906937, 0.7633752, -0.5237377, 0, 0, 1, 1, 1,
-1.899712, 0.2616638, -1.80738, 1, 0, 0, 1, 1,
-1.896136, 0.7500043, -0.8038322, 1, 0, 0, 1, 1,
-1.87669, 1.074788, -1.591578, 1, 0, 0, 1, 1,
-1.867614, -0.7008126, -1.249214, 1, 0, 0, 1, 1,
-1.857696, -1.148086, -3.519143, 1, 0, 0, 1, 1,
-1.840037, -2.003821, -2.295983, 0, 0, 0, 1, 1,
-1.810753, -3.05121, -1.325647, 0, 0, 0, 1, 1,
-1.781036, -0.9850612, -1.962397, 0, 0, 0, 1, 1,
-1.773816, 0.1528021, -2.691491, 0, 0, 0, 1, 1,
-1.761716, -1.051602, -2.248471, 0, 0, 0, 1, 1,
-1.760469, -1.272336, -0.3166345, 0, 0, 0, 1, 1,
-1.751084, 1.932861, -1.48044, 0, 0, 0, 1, 1,
-1.745784, -1.14504, -0.6571435, 1, 1, 1, 1, 1,
-1.724409, -1.795344, -0.9053848, 1, 1, 1, 1, 1,
-1.723784, 0.9733382, 0.8522487, 1, 1, 1, 1, 1,
-1.717855, -0.9196619, -2.779757, 1, 1, 1, 1, 1,
-1.696681, 1.065886, -1.358315, 1, 1, 1, 1, 1,
-1.68931, -0.4615796, -2.41305, 1, 1, 1, 1, 1,
-1.666524, -0.7488567, -3.145984, 1, 1, 1, 1, 1,
-1.666466, 1.854229, 1.022471, 1, 1, 1, 1, 1,
-1.638387, -0.998273, -1.294967, 1, 1, 1, 1, 1,
-1.630622, 1.074559, -1.811541, 1, 1, 1, 1, 1,
-1.597116, 0.8057381, -0.2953186, 1, 1, 1, 1, 1,
-1.59613, 0.8026101, -1.43575, 1, 1, 1, 1, 1,
-1.593799, 0.6573042, -0.3573681, 1, 1, 1, 1, 1,
-1.556516, 0.1718037, -1.322155, 1, 1, 1, 1, 1,
-1.526136, -0.1415362, -0.5823455, 1, 1, 1, 1, 1,
-1.515271, 1.539696, 0.9719201, 0, 0, 1, 1, 1,
-1.508873, 0.7182359, -0.5032302, 1, 0, 0, 1, 1,
-1.507727, 0.6604338, -0.5731006, 1, 0, 0, 1, 1,
-1.502961, 0.6764761, -1.054761, 1, 0, 0, 1, 1,
-1.489875, -1.361077, -3.043429, 1, 0, 0, 1, 1,
-1.488937, -2.087079, -2.405822, 1, 0, 0, 1, 1,
-1.486885, -0.4502924, -2.866699, 0, 0, 0, 1, 1,
-1.48478, 1.182428, -2.163896, 0, 0, 0, 1, 1,
-1.473983, -0.9215953, -1.993657, 0, 0, 0, 1, 1,
-1.473936, 0.7167846, -2.229289, 0, 0, 0, 1, 1,
-1.471703, 0.7211437, -3.197261, 0, 0, 0, 1, 1,
-1.470296, -1.340195, -1.734859, 0, 0, 0, 1, 1,
-1.466417, 0.09171306, -0.5137361, 0, 0, 0, 1, 1,
-1.465607, 0.7912018, -0.3925917, 1, 1, 1, 1, 1,
-1.464709, -2.108925, -2.774302, 1, 1, 1, 1, 1,
-1.457579, 0.02737648, -1.373746, 1, 1, 1, 1, 1,
-1.454196, -0.2675748, -1.496669, 1, 1, 1, 1, 1,
-1.437917, 1.792232, -1.324825, 1, 1, 1, 1, 1,
-1.428043, 0.3955998, -0.9229406, 1, 1, 1, 1, 1,
-1.426324, -0.7179323, -1.994634, 1, 1, 1, 1, 1,
-1.418476, -0.4740205, -0.8795816, 1, 1, 1, 1, 1,
-1.406158, 1.348343, -0.872834, 1, 1, 1, 1, 1,
-1.391972, -0.09021769, -1.68252, 1, 1, 1, 1, 1,
-1.386677, 1.420706, 0.7124241, 1, 1, 1, 1, 1,
-1.37913, 0.8685462, -1.033911, 1, 1, 1, 1, 1,
-1.377687, -0.8297281, -1.800557, 1, 1, 1, 1, 1,
-1.376748, -0.8494142, -1.336006, 1, 1, 1, 1, 1,
-1.371619, 0.1710255, -1.460057, 1, 1, 1, 1, 1,
-1.36704, 0.7204602, -0.2410423, 0, 0, 1, 1, 1,
-1.36681, 0.2871849, -0.3664038, 1, 0, 0, 1, 1,
-1.348851, 0.3062886, -1.669996, 1, 0, 0, 1, 1,
-1.34733, 0.3207905, 0.2594326, 1, 0, 0, 1, 1,
-1.341968, 0.1750797, -1.345027, 1, 0, 0, 1, 1,
-1.339489, -0.21929, -0.3567154, 1, 0, 0, 1, 1,
-1.337803, -0.8671581, -1.22892, 0, 0, 0, 1, 1,
-1.330265, 0.189157, -0.2280009, 0, 0, 0, 1, 1,
-1.312075, 0.3388882, -0.2780972, 0, 0, 0, 1, 1,
-1.310941, 0.2816765, -1.257082, 0, 0, 0, 1, 1,
-1.308019, 2.532418, 0.02791763, 0, 0, 0, 1, 1,
-1.307172, 1.116726, -1.396749, 0, 0, 0, 1, 1,
-1.297759, 0.4381486, -0.9655128, 0, 0, 0, 1, 1,
-1.295669, -0.3557167, -0.354167, 1, 1, 1, 1, 1,
-1.26299, 0.4567144, -0.9726949, 1, 1, 1, 1, 1,
-1.248532, 0.4611115, -1.977311, 1, 1, 1, 1, 1,
-1.214656, 1.150328, 1.026648, 1, 1, 1, 1, 1,
-1.21059, 1.226549, -1.464983, 1, 1, 1, 1, 1,
-1.207701, -1.530247, -1.848134, 1, 1, 1, 1, 1,
-1.200747, 0.1731672, -3.746637, 1, 1, 1, 1, 1,
-1.190684, 0.7793311, -1.167767, 1, 1, 1, 1, 1,
-1.18431, -0.0744783, -1.194323, 1, 1, 1, 1, 1,
-1.176838, 0.665691, -2.09568, 1, 1, 1, 1, 1,
-1.173622, -0.4863639, -2.498143, 1, 1, 1, 1, 1,
-1.152346, -0.668349, -1.456389, 1, 1, 1, 1, 1,
-1.148136, 0.232103, -2.879608, 1, 1, 1, 1, 1,
-1.143296, -0.7451834, -3.094491, 1, 1, 1, 1, 1,
-1.138266, -0.4318419, -2.609132, 1, 1, 1, 1, 1,
-1.135774, 1.059556, -1.640455, 0, 0, 1, 1, 1,
-1.135094, -1.490317, -0.8787376, 1, 0, 0, 1, 1,
-1.127824, 0.8702837, -0.3574272, 1, 0, 0, 1, 1,
-1.125614, -0.2549415, -0.4645316, 1, 0, 0, 1, 1,
-1.124245, -0.5117351, -0.7839768, 1, 0, 0, 1, 1,
-1.123517, -0.9905758, -1.776618, 1, 0, 0, 1, 1,
-1.123274, 0.01384167, -0.09074605, 0, 0, 0, 1, 1,
-1.115563, 0.1914867, 0.2271926, 0, 0, 0, 1, 1,
-1.112011, -0.3537506, -1.697675, 0, 0, 0, 1, 1,
-1.10772, 0.1518798, -2.271783, 0, 0, 0, 1, 1,
-1.106969, 0.500621, -1.248287, 0, 0, 0, 1, 1,
-1.097141, -0.1173458, -2.576993, 0, 0, 0, 1, 1,
-1.092896, -0.5223652, -1.853365, 0, 0, 0, 1, 1,
-1.087154, -0.4710065, -2.748351, 1, 1, 1, 1, 1,
-1.084957, -1.461015, -3.767472, 1, 1, 1, 1, 1,
-1.080511, -1.204899, -3.316703, 1, 1, 1, 1, 1,
-1.061696, -0.8820632, -2.88099, 1, 1, 1, 1, 1,
-1.060896, -0.2583301, -1.350331, 1, 1, 1, 1, 1,
-1.05646, 0.07694005, -0.7146826, 1, 1, 1, 1, 1,
-1.054904, 0.7093017, -2.080745, 1, 1, 1, 1, 1,
-1.053499, 1.076202, -0.9110249, 1, 1, 1, 1, 1,
-1.042278, -0.6579936, -0.9614441, 1, 1, 1, 1, 1,
-1.036404, -0.9014397, -2.014666, 1, 1, 1, 1, 1,
-1.034275, -0.9544436, -3.589283, 1, 1, 1, 1, 1,
-1.032964, 0.9287563, -0.07379496, 1, 1, 1, 1, 1,
-1.031245, 0.5134611, -2.535419, 1, 1, 1, 1, 1,
-1.031178, -0.9308048, -2.179826, 1, 1, 1, 1, 1,
-1.027409, -1.411967, -3.092994, 1, 1, 1, 1, 1,
-1.022878, 0.4654002, -0.7627139, 0, 0, 1, 1, 1,
-1.01817, 1.534569, 0.425741, 1, 0, 0, 1, 1,
-1.014725, 0.2611946, -2.118969, 1, 0, 0, 1, 1,
-1.010476, 1.232955, 0.3631049, 1, 0, 0, 1, 1,
-1.003246, -0.1627177, -1.443876, 1, 0, 0, 1, 1,
-1.001611, -1.208466, -1.430619, 1, 0, 0, 1, 1,
-1.000771, 0.1055944, -4.053098, 0, 0, 0, 1, 1,
-0.9902751, -0.2743675, -1.649211, 0, 0, 0, 1, 1,
-0.9847243, 0.9667819, -0.6792634, 0, 0, 0, 1, 1,
-0.9790279, -1.021418, -2.213947, 0, 0, 0, 1, 1,
-0.9782081, 0.530898, -0.8663382, 0, 0, 0, 1, 1,
-0.9714471, 0.3210754, 0.8706611, 0, 0, 0, 1, 1,
-0.9702497, 1.165655, 1.389837, 0, 0, 0, 1, 1,
-0.9664323, 0.3384286, -0.3518242, 1, 1, 1, 1, 1,
-0.9649716, -0.6449472, -1.840459, 1, 1, 1, 1, 1,
-0.9635007, -0.3094198, -1.640006, 1, 1, 1, 1, 1,
-0.9598346, 0.2309673, -0.9784608, 1, 1, 1, 1, 1,
-0.9592075, -1.969466, -2.531431, 1, 1, 1, 1, 1,
-0.9547875, -0.5548209, -1.934797, 1, 1, 1, 1, 1,
-0.9543195, -1.196864, -2.766824, 1, 1, 1, 1, 1,
-0.95041, 0.1904358, -1.220645, 1, 1, 1, 1, 1,
-0.9491677, 0.2857802, -1.949555, 1, 1, 1, 1, 1,
-0.9448717, 0.1298264, -1.508268, 1, 1, 1, 1, 1,
-0.9415216, -1.678948, -3.811989, 1, 1, 1, 1, 1,
-0.9386308, 0.02894429, -3.216121, 1, 1, 1, 1, 1,
-0.9342812, 1.142521, 2.150115, 1, 1, 1, 1, 1,
-0.9287844, -1.426124, -2.78806, 1, 1, 1, 1, 1,
-0.9273068, -1.04798, -0.669173, 1, 1, 1, 1, 1,
-0.926873, 0.169484, 0.4827578, 0, 0, 1, 1, 1,
-0.9260859, 1.924954, -1.196972, 1, 0, 0, 1, 1,
-0.9202578, -0.399707, -2.790733, 1, 0, 0, 1, 1,
-0.9147524, 0.9995818, 0.2422561, 1, 0, 0, 1, 1,
-0.9119921, 2.384779, -0.04651267, 1, 0, 0, 1, 1,
-0.9076617, 0.3659837, -0.7695141, 1, 0, 0, 1, 1,
-0.8925, 0.2169189, -1.372246, 0, 0, 0, 1, 1,
-0.8891487, 0.3773841, -0.8781605, 0, 0, 0, 1, 1,
-0.8885288, 0.6693949, -0.4832773, 0, 0, 0, 1, 1,
-0.8856396, 0.7977455, -2.807208, 0, 0, 0, 1, 1,
-0.8855177, 1.241108, -1.552257, 0, 0, 0, 1, 1,
-0.8819125, 0.9718787, -1.150706, 0, 0, 0, 1, 1,
-0.8788226, -1.659106, -2.256971, 0, 0, 0, 1, 1,
-0.8732401, 3.095074, -0.7357137, 1, 1, 1, 1, 1,
-0.8651499, -1.405652, -1.898137, 1, 1, 1, 1, 1,
-0.8642082, -1.178084, -1.407079, 1, 1, 1, 1, 1,
-0.8590593, 1.244306, -0.5805299, 1, 1, 1, 1, 1,
-0.8583136, 1.120873, -0.7230026, 1, 1, 1, 1, 1,
-0.8564033, 1.641021, 0.0823457, 1, 1, 1, 1, 1,
-0.8563529, 1.339597, -1.133482, 1, 1, 1, 1, 1,
-0.8548067, -0.03554864, -3.026008, 1, 1, 1, 1, 1,
-0.8513784, -0.7996472, -3.606726, 1, 1, 1, 1, 1,
-0.8476354, 0.4408639, -1.102418, 1, 1, 1, 1, 1,
-0.8430297, 0.3756484, -2.134727, 1, 1, 1, 1, 1,
-0.8353386, 1.298141, 0.5562738, 1, 1, 1, 1, 1,
-0.8352196, 0.9847479, -0.2809805, 1, 1, 1, 1, 1,
-0.8329871, 0.06224517, -0.3088552, 1, 1, 1, 1, 1,
-0.8301331, -1.162638, -3.068172, 1, 1, 1, 1, 1,
-0.8297533, -0.3577038, -1.74173, 0, 0, 1, 1, 1,
-0.8296103, 0.003156941, -1.649121, 1, 0, 0, 1, 1,
-0.8263727, -1.451333, -2.455492, 1, 0, 0, 1, 1,
-0.8254846, -1.110348, -2.528883, 1, 0, 0, 1, 1,
-0.8185323, 0.1332641, -0.6872354, 1, 0, 0, 1, 1,
-0.8175446, 2.103982, -0.8477576, 1, 0, 0, 1, 1,
-0.8137431, -0.5132566, -2.750568, 0, 0, 0, 1, 1,
-0.8135391, 1.397268, -0.3479795, 0, 0, 0, 1, 1,
-0.8085684, -0.9330568, -1.958811, 0, 0, 0, 1, 1,
-0.8076642, -0.4400713, -1.287794, 0, 0, 0, 1, 1,
-0.8071722, -0.4218657, -0.5950971, 0, 0, 0, 1, 1,
-0.8043091, -1.222137, -2.701906, 0, 0, 0, 1, 1,
-0.8036331, -0.3738424, -0.1117575, 0, 0, 0, 1, 1,
-0.80349, 0.03942326, -1.17796, 1, 1, 1, 1, 1,
-0.8033597, 0.341902, -0.5392919, 1, 1, 1, 1, 1,
-0.7989459, 1.889814, -1.138296, 1, 1, 1, 1, 1,
-0.7923538, 0.2221348, -1.404825, 1, 1, 1, 1, 1,
-0.7914974, 1.54015, -2.268146, 1, 1, 1, 1, 1,
-0.7879407, 1.185231, -0.9210353, 1, 1, 1, 1, 1,
-0.7835614, 0.3719967, -1.297, 1, 1, 1, 1, 1,
-0.7815914, -0.1873084, -4.199739, 1, 1, 1, 1, 1,
-0.7798802, 1.648891, -0.9258888, 1, 1, 1, 1, 1,
-0.7785106, -0.7412311, -1.478251, 1, 1, 1, 1, 1,
-0.7720538, -1.036842, -1.9674, 1, 1, 1, 1, 1,
-0.7709896, -0.2900711, -1.837345, 1, 1, 1, 1, 1,
-0.7701272, -1.528093, -2.661259, 1, 1, 1, 1, 1,
-0.7687948, 0.2016197, 0.5405304, 1, 1, 1, 1, 1,
-0.7684804, -1.16616, -1.448865, 1, 1, 1, 1, 1,
-0.7670386, 0.5793027, -2.434551, 0, 0, 1, 1, 1,
-0.766234, 0.5110466, -1.43767, 1, 0, 0, 1, 1,
-0.7657238, 0.3159305, 0.7906839, 1, 0, 0, 1, 1,
-0.7656428, 0.6865445, 1.596288, 1, 0, 0, 1, 1,
-0.761686, -0.5738789, -1.504016, 1, 0, 0, 1, 1,
-0.7605988, 1.728777, -0.8830997, 1, 0, 0, 1, 1,
-0.7602812, -1.379071, -3.928654, 0, 0, 0, 1, 1,
-0.7558534, 0.5273158, -0.944802, 0, 0, 0, 1, 1,
-0.7531508, 1.395288, -0.8110717, 0, 0, 0, 1, 1,
-0.7509574, -0.5934768, -2.074059, 0, 0, 0, 1, 1,
-0.749342, 0.9967586, 1.132418, 0, 0, 0, 1, 1,
-0.7453867, 0.8359402, 0.5378357, 0, 0, 0, 1, 1,
-0.7328283, -0.3136193, -1.82224, 0, 0, 0, 1, 1,
-0.7300414, 0.6064807, -0.4101236, 1, 1, 1, 1, 1,
-0.7281741, 1.232708, -0.1310835, 1, 1, 1, 1, 1,
-0.7275851, -0.9562008, -1.509853, 1, 1, 1, 1, 1,
-0.7217292, -1.418366, -2.284369, 1, 1, 1, 1, 1,
-0.7194742, 0.5318577, -0.4904612, 1, 1, 1, 1, 1,
-0.710444, -1.190345, -3.49385, 1, 1, 1, 1, 1,
-0.7064657, 0.3612113, -1.406587, 1, 1, 1, 1, 1,
-0.6915701, -0.9850462, -3.399709, 1, 1, 1, 1, 1,
-0.6914893, -0.6107542, -2.992768, 1, 1, 1, 1, 1,
-0.6879216, -2.563832, -2.800502, 1, 1, 1, 1, 1,
-0.6866974, -1.320501, -2.94073, 1, 1, 1, 1, 1,
-0.6835691, 0.8583336, -0.8433791, 1, 1, 1, 1, 1,
-0.6738697, -0.6893551, -1.429851, 1, 1, 1, 1, 1,
-0.6685857, 1.149845, 0.02428192, 1, 1, 1, 1, 1,
-0.6679083, 0.4180164, -0.3983099, 1, 1, 1, 1, 1,
-0.6677945, -0.3360585, -1.572129, 0, 0, 1, 1, 1,
-0.6660308, 0.02874666, -2.321853, 1, 0, 0, 1, 1,
-0.6650831, 0.2930865, -0.3768415, 1, 0, 0, 1, 1,
-0.6648007, 1.203207, -1.555316, 1, 0, 0, 1, 1,
-0.664727, -0.3163052, -1.205885, 1, 0, 0, 1, 1,
-0.6626988, 0.5138705, -2.399835, 1, 0, 0, 1, 1,
-0.6622246, 0.244222, -0.5942889, 0, 0, 0, 1, 1,
-0.6614243, 1.096671, 0.4545621, 0, 0, 0, 1, 1,
-0.6562057, 1.150751, 0.1207534, 0, 0, 0, 1, 1,
-0.6560372, -0.8716501, -4.69748, 0, 0, 0, 1, 1,
-0.6544512, 1.448843, -0.8037947, 0, 0, 0, 1, 1,
-0.6532983, 1.255225, -0.9641383, 0, 0, 0, 1, 1,
-0.6522227, -2.043492, -3.050281, 0, 0, 0, 1, 1,
-0.649515, 1.228185, 0.5816209, 1, 1, 1, 1, 1,
-0.6462368, -0.3281398, -2.407655, 1, 1, 1, 1, 1,
-0.6461303, 2.054178, 0.1797116, 1, 1, 1, 1, 1,
-0.6441915, -0.5015066, -1.22179, 1, 1, 1, 1, 1,
-0.6339816, -0.6527951, -2.797148, 1, 1, 1, 1, 1,
-0.6328951, 0.374013, 0.06524778, 1, 1, 1, 1, 1,
-0.6282251, 0.4356944, -1.337101, 1, 1, 1, 1, 1,
-0.6213142, -0.5003003, -2.492402, 1, 1, 1, 1, 1,
-0.6210465, 1.31552, -0.09389842, 1, 1, 1, 1, 1,
-0.6195183, 0.4028081, -1.448548, 1, 1, 1, 1, 1,
-0.6194871, 0.7156781, -1.340138, 1, 1, 1, 1, 1,
-0.6190636, -0.3139714, -2.283283, 1, 1, 1, 1, 1,
-0.6134841, -1.233386, -3.307049, 1, 1, 1, 1, 1,
-0.6094431, 0.372222, -2.048541, 1, 1, 1, 1, 1,
-0.6034923, -0.02910058, -1.960782, 1, 1, 1, 1, 1,
-0.6034594, -2.522685, -1.71597, 0, 0, 1, 1, 1,
-0.602009, 0.4641941, -0.8542882, 1, 0, 0, 1, 1,
-0.5947548, 0.979799, -2.14589, 1, 0, 0, 1, 1,
-0.5858213, -0.2433671, -2.77109, 1, 0, 0, 1, 1,
-0.5849316, -1.495046, -3.360656, 1, 0, 0, 1, 1,
-0.584731, -0.05231294, 0.3932818, 1, 0, 0, 1, 1,
-0.5831368, -0.7846388, -1.892411, 0, 0, 0, 1, 1,
-0.5801721, 1.27188, 0.7682139, 0, 0, 0, 1, 1,
-0.573225, -1.035516, -0.9108468, 0, 0, 0, 1, 1,
-0.5730624, -1.576017, -1.889803, 0, 0, 0, 1, 1,
-0.5727286, -0.4871295, -1.519881, 0, 0, 0, 1, 1,
-0.5689043, 0.5338962, -0.6968129, 0, 0, 0, 1, 1,
-0.5647255, -0.588157, -1.444384, 0, 0, 0, 1, 1,
-0.5641829, -0.1333278, -1.293356, 1, 1, 1, 1, 1,
-0.5621927, 0.1014206, -1.48217, 1, 1, 1, 1, 1,
-0.560554, -0.4621029, -2.5165, 1, 1, 1, 1, 1,
-0.5562379, -1.229828, -3.213515, 1, 1, 1, 1, 1,
-0.5535478, 1.607145, 0.5173402, 1, 1, 1, 1, 1,
-0.5509474, 0.6280736, -0.7641775, 1, 1, 1, 1, 1,
-0.549032, 0.1647246, -1.148964, 1, 1, 1, 1, 1,
-0.548456, 1.77463, -0.2991318, 1, 1, 1, 1, 1,
-0.5468128, -0.9032208, -2.140846, 1, 1, 1, 1, 1,
-0.5464455, 0.7774372, -0.03487721, 1, 1, 1, 1, 1,
-0.5453215, 1.113881, 1.098641, 1, 1, 1, 1, 1,
-0.5447916, -1.334538, -3.030924, 1, 1, 1, 1, 1,
-0.5435134, 0.1016194, -1.751929, 1, 1, 1, 1, 1,
-0.5396011, 0.3532453, -0.7946952, 1, 1, 1, 1, 1,
-0.5354534, -1.361362, -2.774505, 1, 1, 1, 1, 1,
-0.533689, 1.298789, 0.6944118, 0, 0, 1, 1, 1,
-0.5330523, -0.05732362, -1.624365, 1, 0, 0, 1, 1,
-0.5310336, -0.6835858, -1.884463, 1, 0, 0, 1, 1,
-0.5295539, 0.4254027, -2.653036, 1, 0, 0, 1, 1,
-0.5281911, -1.885985, -1.576563, 1, 0, 0, 1, 1,
-0.527516, -1.014294, -2.852673, 1, 0, 0, 1, 1,
-0.526211, -1.118474, -2.343058, 0, 0, 0, 1, 1,
-0.524999, 0.5403848, -0.4239776, 0, 0, 0, 1, 1,
-0.5236059, 1.598213, 0.8786453, 0, 0, 0, 1, 1,
-0.5219275, 0.5376284, -1.27785, 0, 0, 0, 1, 1,
-0.5197334, 0.2328269, -0.8336601, 0, 0, 0, 1, 1,
-0.5179942, 1.345147, 1.320519, 0, 0, 0, 1, 1,
-0.5178859, -1.59986, -2.100798, 0, 0, 0, 1, 1,
-0.5158361, -0.2625481, -1.93998, 1, 1, 1, 1, 1,
-0.5145391, 0.5029835, -1.404138, 1, 1, 1, 1, 1,
-0.5111957, 0.43681, -1.516742, 1, 1, 1, 1, 1,
-0.510754, -0.3246709, -2.452559, 1, 1, 1, 1, 1,
-0.5087039, 0.4046345, -0.647085, 1, 1, 1, 1, 1,
-0.5085479, -1.09946, -3.190162, 1, 1, 1, 1, 1,
-0.5070995, -0.5174468, -1.662967, 1, 1, 1, 1, 1,
-0.5066151, -0.9216397, -2.563552, 1, 1, 1, 1, 1,
-0.5047281, -0.04667333, -2.990397, 1, 1, 1, 1, 1,
-0.504613, 1.122668, -0.9017221, 1, 1, 1, 1, 1,
-0.5004565, 0.8520963, -0.1003043, 1, 1, 1, 1, 1,
-0.4971439, -1.362652, -3.59629, 1, 1, 1, 1, 1,
-0.4928982, 0.4442621, -0.4166323, 1, 1, 1, 1, 1,
-0.4902472, 0.2865287, -2.107064, 1, 1, 1, 1, 1,
-0.480815, 1.581955, 1.261774, 1, 1, 1, 1, 1,
-0.4759585, 0.935088, -0.8267588, 0, 0, 1, 1, 1,
-0.4737474, 1.383578, 2.855556, 1, 0, 0, 1, 1,
-0.4731061, 0.04138281, -1.756466, 1, 0, 0, 1, 1,
-0.469964, -0.3946859, -3.138423, 1, 0, 0, 1, 1,
-0.4668908, -1.013971, -4.45913, 1, 0, 0, 1, 1,
-0.4635932, -1.47104, -1.141164, 1, 0, 0, 1, 1,
-0.4607796, -0.8192565, -1.09584, 0, 0, 0, 1, 1,
-0.4540474, -0.6012943, -3.092776, 0, 0, 0, 1, 1,
-0.4520568, -0.597598, -2.431925, 0, 0, 0, 1, 1,
-0.4520307, 0.162161, -0.7635, 0, 0, 0, 1, 1,
-0.4474266, 0.3841546, -2.14603, 0, 0, 0, 1, 1,
-0.4472349, 1.535426, -0.183353, 0, 0, 0, 1, 1,
-0.4451521, 0.3539127, 0.4565852, 0, 0, 0, 1, 1,
-0.4436385, -1.287517, -4.106488, 1, 1, 1, 1, 1,
-0.4423528, 0.5188367, -0.2693799, 1, 1, 1, 1, 1,
-0.4399426, 1.516574, -1.232472, 1, 1, 1, 1, 1,
-0.4341486, -0.5006604, -2.650337, 1, 1, 1, 1, 1,
-0.4333061, 0.6352288, 1.295187, 1, 1, 1, 1, 1,
-0.4308215, -0.8129748, -3.50244, 1, 1, 1, 1, 1,
-0.4261965, -1.206717, -2.889897, 1, 1, 1, 1, 1,
-0.4236623, 0.3998643, -0.04812782, 1, 1, 1, 1, 1,
-0.4214694, 0.9811007, 0.4285263, 1, 1, 1, 1, 1,
-0.4196265, -0.4889506, -2.085808, 1, 1, 1, 1, 1,
-0.4102988, 0.1336871, -2.008979, 1, 1, 1, 1, 1,
-0.4065875, 1.09169, 0.1531902, 1, 1, 1, 1, 1,
-0.4063157, -1.70417, -3.280684, 1, 1, 1, 1, 1,
-0.401298, -1.012529, -1.815417, 1, 1, 1, 1, 1,
-0.399121, 0.06101162, -0.2796288, 1, 1, 1, 1, 1,
-0.3986592, 0.03556157, -2.36458, 0, 0, 1, 1, 1,
-0.3962905, 0.7436475, -1.824659, 1, 0, 0, 1, 1,
-0.3882427, -0.2644338, -2.042248, 1, 0, 0, 1, 1,
-0.3820308, 0.05343671, -1.150056, 1, 0, 0, 1, 1,
-0.3810759, 0.1933808, -2.863046, 1, 0, 0, 1, 1,
-0.3791398, -2.008492, -3.007696, 1, 0, 0, 1, 1,
-0.3787075, -0.6187795, -3.624406, 0, 0, 0, 1, 1,
-0.3741514, 0.9538132, -0.1829661, 0, 0, 0, 1, 1,
-0.3728501, 0.1696106, -1.079745, 0, 0, 0, 1, 1,
-0.3701206, 1.459632, 0.8845484, 0, 0, 0, 1, 1,
-0.3676109, -0.04321848, -1.246496, 0, 0, 0, 1, 1,
-0.3575636, -2.510441, -4.051373, 0, 0, 0, 1, 1,
-0.3561931, 1.103206, 0.3621618, 0, 0, 0, 1, 1,
-0.3559693, 1.346898, -0.747489, 1, 1, 1, 1, 1,
-0.3529449, 0.8878523, -0.1438742, 1, 1, 1, 1, 1,
-0.3496215, 0.3541757, -1.219415, 1, 1, 1, 1, 1,
-0.3491291, 0.4824651, -0.365127, 1, 1, 1, 1, 1,
-0.3487306, 0.2003165, -1.41061, 1, 1, 1, 1, 1,
-0.3483438, 0.03196586, -1.018445, 1, 1, 1, 1, 1,
-0.3464687, 1.032916, 0.01780253, 1, 1, 1, 1, 1,
-0.3428604, -0.9749739, -0.784152, 1, 1, 1, 1, 1,
-0.3385933, -1.306313, -2.155934, 1, 1, 1, 1, 1,
-0.3363166, -1.903857, -3.565223, 1, 1, 1, 1, 1,
-0.3357539, 1.427006, -0.3308111, 1, 1, 1, 1, 1,
-0.3341763, 0.839762, -1.070357, 1, 1, 1, 1, 1,
-0.3333462, 1.19321, -0.592352, 1, 1, 1, 1, 1,
-0.3269945, 0.5439306, -2.405453, 1, 1, 1, 1, 1,
-0.3222146, -1.371548, -3.289712, 1, 1, 1, 1, 1,
-0.3218394, 0.829565, 0.3215759, 0, 0, 1, 1, 1,
-0.3212956, -0.98108, -3.173559, 1, 0, 0, 1, 1,
-0.3207828, 0.3404981, -1.495193, 1, 0, 0, 1, 1,
-0.3100189, -0.6586407, -1.548177, 1, 0, 0, 1, 1,
-0.307533, -1.877313, -1.238041, 1, 0, 0, 1, 1,
-0.3069341, -1.460035, -2.545446, 1, 0, 0, 1, 1,
-0.3065276, 0.7492638, -0.4612685, 0, 0, 0, 1, 1,
-0.3063752, -1.053985, -4.69518, 0, 0, 0, 1, 1,
-0.3041194, -2.235481, -3.439186, 0, 0, 0, 1, 1,
-0.2926556, 1.00873, 0.1608351, 0, 0, 0, 1, 1,
-0.2925512, 0.4234149, -0.7232277, 0, 0, 0, 1, 1,
-0.287955, 0.901919, 0.1940723, 0, 0, 0, 1, 1,
-0.2843395, 0.7561393, -1.609834, 0, 0, 0, 1, 1,
-0.2828647, 1.013613, 1.357772, 1, 1, 1, 1, 1,
-0.2739067, -0.6748249, -1.898095, 1, 1, 1, 1, 1,
-0.2734578, -0.463779, -2.813409, 1, 1, 1, 1, 1,
-0.2734446, -1.497666, -2.703008, 1, 1, 1, 1, 1,
-0.2720118, -0.2646593, -3.222818, 1, 1, 1, 1, 1,
-0.2669465, 0.4895005, -0.1251605, 1, 1, 1, 1, 1,
-0.2661361, 0.5381131, -0.5903843, 1, 1, 1, 1, 1,
-0.2655489, 0.09690501, -0.6392025, 1, 1, 1, 1, 1,
-0.2643752, 0.2445684, -0.7153975, 1, 1, 1, 1, 1,
-0.2622571, -1.114796, -3.285495, 1, 1, 1, 1, 1,
-0.2577789, 0.8683386, -0.6992018, 1, 1, 1, 1, 1,
-0.2575864, 0.5395308, -0.679078, 1, 1, 1, 1, 1,
-0.2503939, 1.14509, -0.8041126, 1, 1, 1, 1, 1,
-0.2491208, 1.604454, -1.266847, 1, 1, 1, 1, 1,
-0.2469769, 0.8044928, 1.246718, 1, 1, 1, 1, 1,
-0.2455969, -0.09791932, -0.8501523, 0, 0, 1, 1, 1,
-0.2433617, -0.1884904, -4.660571, 1, 0, 0, 1, 1,
-0.2426738, 1.100959, 0.06837769, 1, 0, 0, 1, 1,
-0.2381122, -1.023228, -2.109051, 1, 0, 0, 1, 1,
-0.2291373, 0.6246251, 0.1760618, 1, 0, 0, 1, 1,
-0.2208302, 0.1337743, -1.891244, 1, 0, 0, 1, 1,
-0.220228, -0.2732669, -2.427307, 0, 0, 0, 1, 1,
-0.2190384, -0.6894054, -1.240531, 0, 0, 0, 1, 1,
-0.2107584, -1.083996, -2.185961, 0, 0, 0, 1, 1,
-0.2046097, -0.3855213, -3.003619, 0, 0, 0, 1, 1,
-0.2024301, -0.5712485, -3.227698, 0, 0, 0, 1, 1,
-0.1996643, -0.8334128, -1.245579, 0, 0, 0, 1, 1,
-0.195166, 0.7035813, -1.113057, 0, 0, 0, 1, 1,
-0.1926802, 0.9502044, 0.6859579, 1, 1, 1, 1, 1,
-0.1912582, 0.1515058, 0.5724843, 1, 1, 1, 1, 1,
-0.1874157, -1.328291, -3.366165, 1, 1, 1, 1, 1,
-0.1830934, -0.8329111, -2.085822, 1, 1, 1, 1, 1,
-0.180994, -0.1241659, -2.858722, 1, 1, 1, 1, 1,
-0.1704435, 0.1182607, -0.8510295, 1, 1, 1, 1, 1,
-0.1627696, 0.3552873, 0.5721968, 1, 1, 1, 1, 1,
-0.1608829, -0.311217, -1.109661, 1, 1, 1, 1, 1,
-0.1595542, 3.367482, 1.33371, 1, 1, 1, 1, 1,
-0.1576972, 1.163273, -0.3924255, 1, 1, 1, 1, 1,
-0.1553443, -0.1073794, -1.891945, 1, 1, 1, 1, 1,
-0.1488305, 0.3116556, -0.7840501, 1, 1, 1, 1, 1,
-0.1439431, -0.01936237, -3.062973, 1, 1, 1, 1, 1,
-0.1388562, -0.5340391, -3.267269, 1, 1, 1, 1, 1,
-0.1338774, 0.3863238, 0.5139384, 1, 1, 1, 1, 1,
-0.1337387, 1.54675, 0.6326716, 0, 0, 1, 1, 1,
-0.1303567, -0.8665106, -1.829397, 1, 0, 0, 1, 1,
-0.1286753, 0.5981588, 1.190199, 1, 0, 0, 1, 1,
-0.1260805, -0.3110922, -3.047399, 1, 0, 0, 1, 1,
-0.1243908, 0.3506274, -0.1033071, 1, 0, 0, 1, 1,
-0.1212862, 0.5475404, -1.208321, 1, 0, 0, 1, 1,
-0.1194646, -0.1902059, -1.010025, 0, 0, 0, 1, 1,
-0.1135844, -0.4868141, -3.529072, 0, 0, 0, 1, 1,
-0.1104391, 0.6525509, -0.05831765, 0, 0, 0, 1, 1,
-0.1101298, -0.7277972, -3.234497, 0, 0, 0, 1, 1,
-0.1049521, 1.325081, -0.1631204, 0, 0, 0, 1, 1,
-0.1039204, 0.8505641, -0.4855392, 0, 0, 0, 1, 1,
-0.1025131, 0.3191144, 1.125965, 0, 0, 0, 1, 1,
-0.09819228, -0.5740441, -2.644869, 1, 1, 1, 1, 1,
-0.09709588, -0.071902, -2.248254, 1, 1, 1, 1, 1,
-0.07513677, 1.567253, -1.193125, 1, 1, 1, 1, 1,
-0.07511667, -0.4120263, -3.680227, 1, 1, 1, 1, 1,
-0.06149149, 1.213014, 0.3311862, 1, 1, 1, 1, 1,
-0.05902915, -0.294474, -4.096035, 1, 1, 1, 1, 1,
-0.05753902, -0.9366733, -3.650047, 1, 1, 1, 1, 1,
-0.05384894, 0.288754, -0.2611456, 1, 1, 1, 1, 1,
-0.05280956, 0.9528736, 0.1682984, 1, 1, 1, 1, 1,
-0.04585156, 1.218746, 1.052451, 1, 1, 1, 1, 1,
-0.04479032, 0.1320294, -0.3581234, 1, 1, 1, 1, 1,
-0.04302109, -0.3794767, -3.364781, 1, 1, 1, 1, 1,
-0.04127435, -1.546556, -4.26102, 1, 1, 1, 1, 1,
-0.03912116, -1.137194, -2.764977, 1, 1, 1, 1, 1,
-0.03644419, -0.5920362, -3.587272, 1, 1, 1, 1, 1,
-0.03544433, 1.089114, 1.292616, 0, 0, 1, 1, 1,
-0.03383937, -0.6056011, -2.440577, 1, 0, 0, 1, 1,
-0.0337224, 0.982577, 0.7079387, 1, 0, 0, 1, 1,
-0.03314744, 0.749249, 0.161896, 1, 0, 0, 1, 1,
-0.03287845, -1.392524, -1.201607, 1, 0, 0, 1, 1,
-0.0303629, 0.3436033, -0.243199, 1, 0, 0, 1, 1,
-0.02980517, 0.2444304, 0.6768724, 0, 0, 0, 1, 1,
-0.02977988, 0.2240295, -1.137824, 0, 0, 0, 1, 1,
-0.02802186, -0.4350211, -1.796548, 0, 0, 0, 1, 1,
-0.02524219, -1.33915, -1.812624, 0, 0, 0, 1, 1,
-0.02508743, 0.8667619, 0.7157205, 0, 0, 0, 1, 1,
-0.01904722, 0.4724193, 0.3341176, 0, 0, 0, 1, 1,
-0.0152634, -1.105865, -2.970871, 0, 0, 0, 1, 1,
-0.01466564, -2.095871, -2.128067, 1, 1, 1, 1, 1,
-0.01007963, 1.867706, -2.232501, 1, 1, 1, 1, 1,
-0.007047409, 1.189373, 0.6399313, 1, 1, 1, 1, 1,
0.003021119, 0.3765811, 0.6096711, 1, 1, 1, 1, 1,
0.005164019, 0.8764982, -0.6985158, 1, 1, 1, 1, 1,
0.007279937, 0.5994215, 1.899369, 1, 1, 1, 1, 1,
0.0148687, 0.5329251, 0.7084675, 1, 1, 1, 1, 1,
0.01504276, -0.4927225, 3.819189, 1, 1, 1, 1, 1,
0.01686786, -0.7732064, 3.450866, 1, 1, 1, 1, 1,
0.01869596, 1.985475, 0.2574977, 1, 1, 1, 1, 1,
0.02237507, 0.1568039, -0.5643021, 1, 1, 1, 1, 1,
0.02823359, 1.071781, 0.8835273, 1, 1, 1, 1, 1,
0.03102761, 0.5455803, 0.6177989, 1, 1, 1, 1, 1,
0.03638448, 0.4107171, 0.6431823, 1, 1, 1, 1, 1,
0.03968145, 2.019053, 1.140219, 1, 1, 1, 1, 1,
0.03981312, 0.9457998, -0.8239685, 0, 0, 1, 1, 1,
0.04186473, 0.9338101, 0.3018675, 1, 0, 0, 1, 1,
0.04333405, 0.6803438, 0.2481943, 1, 0, 0, 1, 1,
0.043686, 0.2838283, 1.312432, 1, 0, 0, 1, 1,
0.04427616, 1.625301, -0.6574246, 1, 0, 0, 1, 1,
0.04500297, 1.939465, -2.29669, 1, 0, 0, 1, 1,
0.04531652, -0.6754383, 2.116233, 0, 0, 0, 1, 1,
0.04605432, -0.6929649, 3.336837, 0, 0, 0, 1, 1,
0.05173031, -1.183641, 4.461375, 0, 0, 0, 1, 1,
0.05182087, 0.7846294, 0.7848356, 0, 0, 0, 1, 1,
0.05242651, 2.135522, -2.308836, 0, 0, 0, 1, 1,
0.05475206, -0.5603688, 2.090519, 0, 0, 0, 1, 1,
0.05760531, -0.7427343, 2.686837, 0, 0, 0, 1, 1,
0.05862116, 0.1787994, 0.7058409, 1, 1, 1, 1, 1,
0.05863346, 0.290258, 0.2243174, 1, 1, 1, 1, 1,
0.06335728, -0.170095, 3.070759, 1, 1, 1, 1, 1,
0.06461118, -0.287833, 4.509328, 1, 1, 1, 1, 1,
0.06501826, -1.824259, 1.756419, 1, 1, 1, 1, 1,
0.06731675, -1.560282, 2.012071, 1, 1, 1, 1, 1,
0.0691899, 1.263263, 1.805752, 1, 1, 1, 1, 1,
0.07133395, -0.2726992, 5.014143, 1, 1, 1, 1, 1,
0.07248572, -0.7556026, 2.419583, 1, 1, 1, 1, 1,
0.07270617, -0.4935653, 3.322245, 1, 1, 1, 1, 1,
0.07441801, 0.2735325, 2.344853, 1, 1, 1, 1, 1,
0.08298311, -1.327909, 2.844372, 1, 1, 1, 1, 1,
0.09817017, 0.4043163, 1.107735, 1, 1, 1, 1, 1,
0.09931341, 0.6893087, -0.2652297, 1, 1, 1, 1, 1,
0.1015269, 0.7501824, 0.09684376, 1, 1, 1, 1, 1,
0.1060253, -0.8239814, 1.95785, 0, 0, 1, 1, 1,
0.1065708, -0.1727182, 3.585757, 1, 0, 0, 1, 1,
0.1090209, -1.077775, 3.298178, 1, 0, 0, 1, 1,
0.109793, 1.234183, 1.937456, 1, 0, 0, 1, 1,
0.1120041, -0.9042256, 2.148756, 1, 0, 0, 1, 1,
0.1145942, -2.334644, 2.893494, 1, 0, 0, 1, 1,
0.1147831, -0.3430388, 2.30456, 0, 0, 0, 1, 1,
0.1222131, 0.9000539, 0.5010961, 0, 0, 0, 1, 1,
0.122948, -1.503906, 2.243611, 0, 0, 0, 1, 1,
0.13033, 1.396214, 0.02127279, 0, 0, 0, 1, 1,
0.1357384, -0.5106075, 5.170004, 0, 0, 0, 1, 1,
0.1376144, 0.4398268, 0.7693447, 0, 0, 0, 1, 1,
0.1403891, -0.6886829, 4.559712, 0, 0, 0, 1, 1,
0.140494, -0.3350408, 2.596292, 1, 1, 1, 1, 1,
0.1418498, 1.878895, -0.4371213, 1, 1, 1, 1, 1,
0.1429069, 0.03356336, 1.74812, 1, 1, 1, 1, 1,
0.1454897, -0.07112872, 0.7031485, 1, 1, 1, 1, 1,
0.1589761, -0.1298409, 2.480275, 1, 1, 1, 1, 1,
0.1591786, 0.4453166, 0.7017584, 1, 1, 1, 1, 1,
0.159709, -1.212561, 4.466667, 1, 1, 1, 1, 1,
0.1597957, -0.4590116, 2.784995, 1, 1, 1, 1, 1,
0.1617174, -0.20716, 2.933319, 1, 1, 1, 1, 1,
0.16228, -0.275865, 2.511653, 1, 1, 1, 1, 1,
0.1628188, -0.8867115, 3.047556, 1, 1, 1, 1, 1,
0.1633464, 1.375562, -0.4274328, 1, 1, 1, 1, 1,
0.1654971, 1.006466, 1.871132, 1, 1, 1, 1, 1,
0.1674339, -1.001433, 1.79479, 1, 1, 1, 1, 1,
0.1726792, -1.962427, 3.525553, 1, 1, 1, 1, 1,
0.1731339, -0.6829802, 3.33103, 0, 0, 1, 1, 1,
0.1761792, -1.009751, 3.976267, 1, 0, 0, 1, 1,
0.1765686, 0.1322002, -1.334627, 1, 0, 0, 1, 1,
0.1776761, 0.1635143, 0.2984154, 1, 0, 0, 1, 1,
0.1783762, -1.221199, 3.547073, 1, 0, 0, 1, 1,
0.1845658, 0.09890602, 0.1980861, 1, 0, 0, 1, 1,
0.1868942, -1.906736, 2.807846, 0, 0, 0, 1, 1,
0.1886816, -1.399324, 3.903122, 0, 0, 0, 1, 1,
0.191659, 0.2259655, 1.34579, 0, 0, 0, 1, 1,
0.1951998, -1.264575, 2.471749, 0, 0, 0, 1, 1,
0.2016044, 0.008103556, 1.485858, 0, 0, 0, 1, 1,
0.2016868, -0.8842973, 3.461742, 0, 0, 0, 1, 1,
0.2068354, 1.523208, 0.4956191, 0, 0, 0, 1, 1,
0.2150311, 0.02889161, -0.04425111, 1, 1, 1, 1, 1,
0.2154553, -0.4770617, 1.48815, 1, 1, 1, 1, 1,
0.2169401, -0.07218204, 1.499933, 1, 1, 1, 1, 1,
0.2170498, 0.2257279, -1.058993, 1, 1, 1, 1, 1,
0.2171849, -1.005581, 2.185363, 1, 1, 1, 1, 1,
0.2192148, 0.4813554, -0.3222595, 1, 1, 1, 1, 1,
0.2201933, -0.4367261, 1.831037, 1, 1, 1, 1, 1,
0.2222512, 0.7203944, 1.417313, 1, 1, 1, 1, 1,
0.2233757, -1.109372, 4.529631, 1, 1, 1, 1, 1,
0.2235885, -0.2879173, 1.986686, 1, 1, 1, 1, 1,
0.2266713, -0.167993, 1.034389, 1, 1, 1, 1, 1,
0.2310519, 0.1540575, 1.276497, 1, 1, 1, 1, 1,
0.2360997, 2.823913, -1.312558, 1, 1, 1, 1, 1,
0.2376716, -1.039947, 2.750651, 1, 1, 1, 1, 1,
0.2417184, 0.3751209, -0.02581244, 1, 1, 1, 1, 1,
0.2423442, 0.4831692, 2.252177, 0, 0, 1, 1, 1,
0.2434066, -0.8166702, 4.1745, 1, 0, 0, 1, 1,
0.244374, 0.3589501, 0.3534969, 1, 0, 0, 1, 1,
0.2447235, -0.08055384, 1.570771, 1, 0, 0, 1, 1,
0.2459118, 1.312758, -0.2434646, 1, 0, 0, 1, 1,
0.2462732, 0.8995928, 0.8703161, 1, 0, 0, 1, 1,
0.2501806, -0.01934495, 2.032486, 0, 0, 0, 1, 1,
0.2603504, -2.084497, 3.356786, 0, 0, 0, 1, 1,
0.2646382, 0.03539594, 1.805879, 0, 0, 0, 1, 1,
0.2659845, -1.155296, 2.212961, 0, 0, 0, 1, 1,
0.2699392, 0.7107897, 0.4045492, 0, 0, 0, 1, 1,
0.273061, -1.38189, 0.7815519, 0, 0, 0, 1, 1,
0.2750479, 0.0005485732, 2.782647, 0, 0, 0, 1, 1,
0.276963, 1.347568, -0.4653206, 1, 1, 1, 1, 1,
0.2789864, -1.01869, 2.697221, 1, 1, 1, 1, 1,
0.2829768, -0.6991245, 2.75562, 1, 1, 1, 1, 1,
0.2854696, 0.6667836, -0.3546708, 1, 1, 1, 1, 1,
0.2857613, 2.194033, -0.00940156, 1, 1, 1, 1, 1,
0.2861883, -0.7628556, 2.678828, 1, 1, 1, 1, 1,
0.2871364, -0.8745842, 2.018344, 1, 1, 1, 1, 1,
0.2883995, -0.4816824, 3.270269, 1, 1, 1, 1, 1,
0.2916999, -2.113524, 3.261344, 1, 1, 1, 1, 1,
0.2967163, 0.02239775, 1.078464, 1, 1, 1, 1, 1,
0.2980361, -0.4222409, 0.9748647, 1, 1, 1, 1, 1,
0.2988458, -1.098876, 2.793211, 1, 1, 1, 1, 1,
0.3009113, 2.447996, 1.431731, 1, 1, 1, 1, 1,
0.3079637, -0.4947219, 2.690711, 1, 1, 1, 1, 1,
0.3097626, -0.02821265, 2.74599, 1, 1, 1, 1, 1,
0.3145117, -0.1502533, 1.595066, 0, 0, 1, 1, 1,
0.3174075, 0.8862603, 0.9546719, 1, 0, 0, 1, 1,
0.3254862, 0.9539413, 0.01089073, 1, 0, 0, 1, 1,
0.3285765, 0.6947476, 0.5856061, 1, 0, 0, 1, 1,
0.3319752, -0.6154167, 3.146674, 1, 0, 0, 1, 1,
0.3374124, 0.7662405, 1.597847, 1, 0, 0, 1, 1,
0.3400591, -0.7869533, 2.172042, 0, 0, 0, 1, 1,
0.3420306, -1.515969, 0.9507065, 0, 0, 0, 1, 1,
0.346595, -0.9338109, 3.164589, 0, 0, 0, 1, 1,
0.346849, 0.8604311, -0.3741503, 0, 0, 0, 1, 1,
0.3532259, 0.7752686, -2.034891, 0, 0, 0, 1, 1,
0.3555438, -0.2743606, 3.541892, 0, 0, 0, 1, 1,
0.3568368, 0.7068694, 1.444041, 0, 0, 0, 1, 1,
0.3569936, -0.1284873, 1.196285, 1, 1, 1, 1, 1,
0.3582956, -1.670191, 2.700577, 1, 1, 1, 1, 1,
0.3597068, 1.006665, 0.6260363, 1, 1, 1, 1, 1,
0.3723754, 1.627958, -0.3000934, 1, 1, 1, 1, 1,
0.3737893, -0.2533668, 1.76198, 1, 1, 1, 1, 1,
0.3756536, -0.5371804, 0.5686563, 1, 1, 1, 1, 1,
0.3762155, -0.9775897, 3.620976, 1, 1, 1, 1, 1,
0.3787185, 0.7399338, 0.2433033, 1, 1, 1, 1, 1,
0.3804324, -0.1124142, 1.334023, 1, 1, 1, 1, 1,
0.3816637, -0.3310978, 2.109103, 1, 1, 1, 1, 1,
0.3822162, -0.6279387, 2.549377, 1, 1, 1, 1, 1,
0.3830586, -2.897843, 2.612184, 1, 1, 1, 1, 1,
0.3855654, 0.3465755, 2.842115, 1, 1, 1, 1, 1,
0.3870855, 0.1017111, 1.386498, 1, 1, 1, 1, 1,
0.3874571, 0.448718, 2.057095, 1, 1, 1, 1, 1,
0.3915484, -0.491054, 2.178041, 0, 0, 1, 1, 1,
0.3946824, 0.3766558, 1.199932, 1, 0, 0, 1, 1,
0.3964482, 0.01430345, 3.602128, 1, 0, 0, 1, 1,
0.3968257, 0.9320247, 0.6139556, 1, 0, 0, 1, 1,
0.3971412, -1.583321, 3.899851, 1, 0, 0, 1, 1,
0.4028467, 1.720124, -0.8710674, 1, 0, 0, 1, 1,
0.4041438, -0.7175522, 3.04178, 0, 0, 0, 1, 1,
0.4066524, -0.6640851, 2.628218, 0, 0, 0, 1, 1,
0.4152689, -1.441476, 3.285786, 0, 0, 0, 1, 1,
0.4237489, 0.8437796, 0.1006835, 0, 0, 0, 1, 1,
0.4291698, 0.7302719, 1.332237, 0, 0, 0, 1, 1,
0.4317411, -0.3845537, 2.483185, 0, 0, 0, 1, 1,
0.4393468, -0.8658177, 4.440806, 0, 0, 0, 1, 1,
0.4396804, -0.3199112, 1.268434, 1, 1, 1, 1, 1,
0.4400583, 0.6048635, -0.7181009, 1, 1, 1, 1, 1,
0.4401353, -0.7575108, 2.689097, 1, 1, 1, 1, 1,
0.440387, -0.5204003, 2.818444, 1, 1, 1, 1, 1,
0.4420962, -0.747207, 2.933087, 1, 1, 1, 1, 1,
0.4425902, -0.4645005, 2.641077, 1, 1, 1, 1, 1,
0.4449458, 1.752023, 0.08002402, 1, 1, 1, 1, 1,
0.4455696, -0.5891904, 2.426551, 1, 1, 1, 1, 1,
0.4496214, 0.06081466, 2.232503, 1, 1, 1, 1, 1,
0.4597757, -0.6003186, 2.529764, 1, 1, 1, 1, 1,
0.4609061, -0.4759066, 1.657904, 1, 1, 1, 1, 1,
0.4619195, -0.7971845, 2.323864, 1, 1, 1, 1, 1,
0.4694878, -0.7047165, 1.198887, 1, 1, 1, 1, 1,
0.4731612, 0.4575432, 0.1478579, 1, 1, 1, 1, 1,
0.4733134, 1.216785, 1.958077, 1, 1, 1, 1, 1,
0.4740633, -0.9765661, 2.963128, 0, 0, 1, 1, 1,
0.4756368, -0.3434438, 1.441828, 1, 0, 0, 1, 1,
0.4798985, -0.1145319, 1.015789, 1, 0, 0, 1, 1,
0.4826785, -0.1972558, 1.80148, 1, 0, 0, 1, 1,
0.486743, 1.532138, -1.36494, 1, 0, 0, 1, 1,
0.4881229, 0.3976787, 0.7396728, 1, 0, 0, 1, 1,
0.4910972, -0.281382, 0.9935296, 0, 0, 0, 1, 1,
0.495439, -0.0805492, 1.48776, 0, 0, 0, 1, 1,
0.4994091, 0.5969536, -0.1020929, 0, 0, 0, 1, 1,
0.4995618, -0.8680766, 1.749315, 0, 0, 0, 1, 1,
0.5027369, 0.9298508, -1.577904, 0, 0, 0, 1, 1,
0.5036556, 0.4787621, 0.7737895, 0, 0, 0, 1, 1,
0.5075153, 3.05719, 0.3693666, 0, 0, 0, 1, 1,
0.507881, 0.2386257, 1.411976, 1, 1, 1, 1, 1,
0.5083321, -0.1944168, 1.09101, 1, 1, 1, 1, 1,
0.5124822, -0.3493439, 3.203105, 1, 1, 1, 1, 1,
0.5136301, 0.1310727, 1.560168, 1, 1, 1, 1, 1,
0.5156674, 0.7819321, 2.190924, 1, 1, 1, 1, 1,
0.5166769, 0.03445288, 1.165498, 1, 1, 1, 1, 1,
0.5170195, 0.8363039, 0.9398731, 1, 1, 1, 1, 1,
0.5187982, -0.6195875, 2.331547, 1, 1, 1, 1, 1,
0.5218906, -0.1720509, 0.8780487, 1, 1, 1, 1, 1,
0.5267706, 0.171751, 1.664619, 1, 1, 1, 1, 1,
0.5280804, -0.8016961, 4.301455, 1, 1, 1, 1, 1,
0.5288917, -0.6864887, 2.625991, 1, 1, 1, 1, 1,
0.5334706, -0.04173732, 2.163968, 1, 1, 1, 1, 1,
0.5353579, -0.5341194, 2.935306, 1, 1, 1, 1, 1,
0.5417092, -0.6534399, 2.67529, 1, 1, 1, 1, 1,
0.5432798, -1.234969, 4.556646, 0, 0, 1, 1, 1,
0.543741, -0.2406928, 1.938581, 1, 0, 0, 1, 1,
0.5514531, 0.4970046, 1.703495, 1, 0, 0, 1, 1,
0.5538953, 1.016854, -0.4391522, 1, 0, 0, 1, 1,
0.5567951, -1.448403, 1.889802, 1, 0, 0, 1, 1,
0.5589883, 0.7984071, 0.489479, 1, 0, 0, 1, 1,
0.5591918, 0.3032078, 1.743894, 0, 0, 0, 1, 1,
0.5610487, 0.03632575, 2.323604, 0, 0, 0, 1, 1,
0.5623258, -0.8142936, 1.82256, 0, 0, 0, 1, 1,
0.5650463, -0.345805, 1.578608, 0, 0, 0, 1, 1,
0.5657727, -0.204621, 0.7895201, 0, 0, 0, 1, 1,
0.572033, 0.9606278, -0.3098078, 0, 0, 0, 1, 1,
0.5750341, -1.498531, 2.099564, 0, 0, 0, 1, 1,
0.581649, -0.4413858, 1.036528, 1, 1, 1, 1, 1,
0.5834768, -0.1218979, 1.45528, 1, 1, 1, 1, 1,
0.5888204, 0.1232239, 1.207145, 1, 1, 1, 1, 1,
0.5911554, 0.3353572, 1.452372, 1, 1, 1, 1, 1,
0.5977184, 0.4160121, 0.3980371, 1, 1, 1, 1, 1,
0.5980995, -0.2434529, 2.080538, 1, 1, 1, 1, 1,
0.6047157, -0.3930348, 2.266527, 1, 1, 1, 1, 1,
0.6090421, -0.8202587, 2.042487, 1, 1, 1, 1, 1,
0.6098647, 0.3824195, 2.759844, 1, 1, 1, 1, 1,
0.609893, -0.5763829, 3.665972, 1, 1, 1, 1, 1,
0.6122426, -0.1669455, 2.437864, 1, 1, 1, 1, 1,
0.6131057, 0.08994238, 1.373376, 1, 1, 1, 1, 1,
0.6143472, 0.7200699, -0.518015, 1, 1, 1, 1, 1,
0.6152173, 0.1002646, 2.78991, 1, 1, 1, 1, 1,
0.6186941, 0.6689064, 0.7980394, 1, 1, 1, 1, 1,
0.6199255, 0.306659, -0.1684104, 0, 0, 1, 1, 1,
0.6220958, 2.188115, -0.8430505, 1, 0, 0, 1, 1,
0.6228141, -0.1402726, 0.7382806, 1, 0, 0, 1, 1,
0.6234133, -0.9437522, 2.423256, 1, 0, 0, 1, 1,
0.6301845, 0.7104904, 0.6834583, 1, 0, 0, 1, 1,
0.6369955, -1.752341, 1.705503, 1, 0, 0, 1, 1,
0.6375822, -1.328422, 1.735572, 0, 0, 0, 1, 1,
0.6392319, -1.605441, 3.283536, 0, 0, 0, 1, 1,
0.6402981, -0.4117745, 1.92714, 0, 0, 0, 1, 1,
0.6407468, -1.168963, 3.011479, 0, 0, 0, 1, 1,
0.6408137, -1.105783, 2.910148, 0, 0, 0, 1, 1,
0.6434457, 0.02314385, 3.063699, 0, 0, 0, 1, 1,
0.6445407, 0.9734977, 1.918158, 0, 0, 0, 1, 1,
0.6459129, -0.523473, 2.053715, 1, 1, 1, 1, 1,
0.6514859, 0.4537692, 2.017505, 1, 1, 1, 1, 1,
0.6517746, 0.3960238, 0.5773066, 1, 1, 1, 1, 1,
0.6536841, -0.5664821, 2.933586, 1, 1, 1, 1, 1,
0.6540895, 0.3075375, 0.8546979, 1, 1, 1, 1, 1,
0.6601598, 0.4628114, 0.3259129, 1, 1, 1, 1, 1,
0.6619605, -0.2507412, 1.535463, 1, 1, 1, 1, 1,
0.666436, 0.6661875, 1.449983, 1, 1, 1, 1, 1,
0.669991, -1.123527, 0.9758845, 1, 1, 1, 1, 1,
0.6701485, -0.1654973, -0.5426247, 1, 1, 1, 1, 1,
0.6704386, 0.7395125, -0.2615545, 1, 1, 1, 1, 1,
0.6721946, -0.2640439, 1.883549, 1, 1, 1, 1, 1,
0.6785794, 0.4368353, 1.602049, 1, 1, 1, 1, 1,
0.6872925, 0.2861011, 0.7644724, 1, 1, 1, 1, 1,
0.6881978, -0.5958423, 2.364533, 1, 1, 1, 1, 1,
0.6893665, -0.3720353, 1.337226, 0, 0, 1, 1, 1,
0.6896337, 0.2087083, 1.082101, 1, 0, 0, 1, 1,
0.6901078, 0.1221712, 2.135472, 1, 0, 0, 1, 1,
0.6931143, -0.7871853, 2.364101, 1, 0, 0, 1, 1,
0.6931279, 0.9731859, 2.890008, 1, 0, 0, 1, 1,
0.6950847, -0.8422983, 0.9740918, 1, 0, 0, 1, 1,
0.695392, 1.1615, -0.5022359, 0, 0, 0, 1, 1,
0.6991177, 0.04362859, 1.246036, 0, 0, 0, 1, 1,
0.7000969, -0.479168, 2.73794, 0, 0, 0, 1, 1,
0.7096513, 0.01093839, 0.6463711, 0, 0, 0, 1, 1,
0.7137743, 0.9574754, 0.5627975, 0, 0, 0, 1, 1,
0.7230096, -2.23438, 2.840191, 0, 0, 0, 1, 1,
0.7248538, -1.255377, 1.583124, 0, 0, 0, 1, 1,
0.7274621, 0.3347825, 0.885296, 1, 1, 1, 1, 1,
0.7299508, -1.155198, 3.687524, 1, 1, 1, 1, 1,
0.7302438, 0.5681217, 0.9094198, 1, 1, 1, 1, 1,
0.7321241, -0.07956862, 1.146895, 1, 1, 1, 1, 1,
0.7455297, -0.1876788, 3.478826, 1, 1, 1, 1, 1,
0.7457505, -0.3718048, 2.448515, 1, 1, 1, 1, 1,
0.7511982, -0.57706, 2.72473, 1, 1, 1, 1, 1,
0.7537932, -2.01487, 1.863521, 1, 1, 1, 1, 1,
0.7548447, -1.448764, 2.994351, 1, 1, 1, 1, 1,
0.7588192, -0.154868, 2.594851, 1, 1, 1, 1, 1,
0.7603722, -1.655293, 2.670051, 1, 1, 1, 1, 1,
0.7626883, 0.201263, 1.35476, 1, 1, 1, 1, 1,
0.7678601, -0.0774576, 1.063794, 1, 1, 1, 1, 1,
0.7763513, 0.3724052, 1.927979, 1, 1, 1, 1, 1,
0.7792087, -0.3515525, 1.47447, 1, 1, 1, 1, 1,
0.78263, 0.5507777, 0.5628403, 0, 0, 1, 1, 1,
0.7833905, 1.229324, 1.73725, 1, 0, 0, 1, 1,
0.7851843, -1.120849, 3.062655, 1, 0, 0, 1, 1,
0.7855692, 0.5675121, 2.096421, 1, 0, 0, 1, 1,
0.7930279, -0.4443189, 1.689371, 1, 0, 0, 1, 1,
0.793286, -0.2339745, 2.282881, 1, 0, 0, 1, 1,
0.7961031, -1.949053, 4.474326, 0, 0, 0, 1, 1,
0.7961931, -0.9235576, 3.631116, 0, 0, 0, 1, 1,
0.7973898, -0.1042357, 1.585798, 0, 0, 0, 1, 1,
0.8101166, -1.395936, 0.7624, 0, 0, 0, 1, 1,
0.8119296, -0.6492201, 0.4362845, 0, 0, 0, 1, 1,
0.8193406, -0.002446172, 2.324993, 0, 0, 0, 1, 1,
0.8208538, 0.2153873, -0.216143, 0, 0, 0, 1, 1,
0.8261973, -1.219239, 4.122828, 1, 1, 1, 1, 1,
0.8277448, 0.8897942, 0.02547553, 1, 1, 1, 1, 1,
0.8347307, -1.458808, 2.950359, 1, 1, 1, 1, 1,
0.836278, 0.4455437, 0.6563408, 1, 1, 1, 1, 1,
0.8388003, -1.708891, 3.580605, 1, 1, 1, 1, 1,
0.8480195, 0.07537557, 1.821521, 1, 1, 1, 1, 1,
0.8508002, 1.336917, 2.287327, 1, 1, 1, 1, 1,
0.8512188, -0.9245795, 2.219397, 1, 1, 1, 1, 1,
0.8549438, -0.3654647, 2.329277, 1, 1, 1, 1, 1,
0.8612715, -1.528358, 3.527107, 1, 1, 1, 1, 1,
0.8617386, 0.004786194, 2.536932, 1, 1, 1, 1, 1,
0.8631629, 0.7035375, 0.009312078, 1, 1, 1, 1, 1,
0.8661941, 1.388039, 1.41723, 1, 1, 1, 1, 1,
0.8696707, 0.1859138, 1.626565, 1, 1, 1, 1, 1,
0.8697951, 0.2635481, 0.2228446, 1, 1, 1, 1, 1,
0.8731224, -1.153132, 2.620408, 0, 0, 1, 1, 1,
0.8791378, 0.383967, 1.617978, 1, 0, 0, 1, 1,
0.8792079, 0.1244664, -0.581722, 1, 0, 0, 1, 1,
0.8826111, 0.1981323, 0.626629, 1, 0, 0, 1, 1,
0.8989831, -0.842315, 1.845224, 1, 0, 0, 1, 1,
0.9063488, -0.3591932, 0.495802, 1, 0, 0, 1, 1,
0.906485, -1.895608, 2.410643, 0, 0, 0, 1, 1,
0.9072751, 0.9334968, -0.1822099, 0, 0, 0, 1, 1,
0.9080891, 0.0973034, 0.6531469, 0, 0, 0, 1, 1,
0.9091702, -0.3940025, 0.1405396, 0, 0, 0, 1, 1,
0.9117972, 2.058361, -1.64941, 0, 0, 0, 1, 1,
0.9146553, -0.8534514, 2.022757, 0, 0, 0, 1, 1,
0.9180194, -0.04396831, 0.679574, 0, 0, 0, 1, 1,
0.9184198, 0.005161653, 1.184507, 1, 1, 1, 1, 1,
0.9271079, -0.2369921, 1.34611, 1, 1, 1, 1, 1,
0.9291031, -0.073204, 1.051682, 1, 1, 1, 1, 1,
0.9315954, 0.5949787, 1.684738, 1, 1, 1, 1, 1,
0.9366961, 0.1449423, -0.133292, 1, 1, 1, 1, 1,
0.947917, -0.7533556, 5.153765, 1, 1, 1, 1, 1,
0.9564718, 0.5208049, 2.158365, 1, 1, 1, 1, 1,
0.9598023, -0.6369343, 0.9545245, 1, 1, 1, 1, 1,
0.9626093, 1.081701, 1.993919, 1, 1, 1, 1, 1,
0.963612, 1.249364, 0.05881518, 1, 1, 1, 1, 1,
0.9671308, 1.926415, 1.536449, 1, 1, 1, 1, 1,
0.9877748, -1.501197, 3.09447, 1, 1, 1, 1, 1,
0.9952779, 0.3650651, -0.2334136, 1, 1, 1, 1, 1,
0.9964778, 0.7683193, -0.1554419, 1, 1, 1, 1, 1,
0.999888, 0.2767034, 1.494691, 1, 1, 1, 1, 1,
1.000208, -0.9845082, 0.781543, 0, 0, 1, 1, 1,
1.000272, -1.376672, 3.645246, 1, 0, 0, 1, 1,
1.005631, -0.4237905, 2.53641, 1, 0, 0, 1, 1,
1.007488, 0.1238725, -0.3543184, 1, 0, 0, 1, 1,
1.007613, -0.09256484, 2.461406, 1, 0, 0, 1, 1,
1.01252, 0.2464784, 2.449225, 1, 0, 0, 1, 1,
1.013294, 1.423836, 1.227492, 0, 0, 0, 1, 1,
1.013574, 0.5416757, 1.303105, 0, 0, 0, 1, 1,
1.015578, 0.3082339, 0.9623684, 0, 0, 0, 1, 1,
1.022646, 0.6460562, 1.078917, 0, 0, 0, 1, 1,
1.024927, -0.5291222, 3.628962, 0, 0, 0, 1, 1,
1.027199, 0.1921397, 0.3613521, 0, 0, 0, 1, 1,
1.027712, 0.6558036, 1.533944, 0, 0, 0, 1, 1,
1.02881, -0.8915086, 1.627231, 1, 1, 1, 1, 1,
1.047954, 0.6905558, -0.8969418, 1, 1, 1, 1, 1,
1.050231, -0.0881388, 2.315725, 1, 1, 1, 1, 1,
1.055795, -1.177418, 3.328069, 1, 1, 1, 1, 1,
1.058333, -1.107245, 1.137084, 1, 1, 1, 1, 1,
1.058936, -1.440355, 2.835602, 1, 1, 1, 1, 1,
1.061506, -0.4907399, 3.455788, 1, 1, 1, 1, 1,
1.067938, 1.126995, 0.209943, 1, 1, 1, 1, 1,
1.073545, 0.01380224, 4.013809, 1, 1, 1, 1, 1,
1.077518, -0.8435995, 2.738715, 1, 1, 1, 1, 1,
1.084821, -0.6247917, 2.191776, 1, 1, 1, 1, 1,
1.085613, 1.203056, 0.06389131, 1, 1, 1, 1, 1,
1.086665, 0.2040667, -1.278661, 1, 1, 1, 1, 1,
1.093971, -0.07498872, 2.075351, 1, 1, 1, 1, 1,
1.102003, 0.5282593, 0.006975053, 1, 1, 1, 1, 1,
1.103986, 1.731711, 0.6645871, 0, 0, 1, 1, 1,
1.111623, -0.07140288, 2.458146, 1, 0, 0, 1, 1,
1.113946, 0.9667371, -1.316954, 1, 0, 0, 1, 1,
1.116446, 1.190958, 1.515951, 1, 0, 0, 1, 1,
1.119793, -1.494636, 3.095274, 1, 0, 0, 1, 1,
1.122514, 0.199476, 1.215071, 1, 0, 0, 1, 1,
1.12618, -1.355119, 1.359002, 0, 0, 0, 1, 1,
1.129542, -1.084965, 1.25356, 0, 0, 0, 1, 1,
1.135371, 0.5247213, 1.953287, 0, 0, 0, 1, 1,
1.151282, 0.4510263, 0.4856817, 0, 0, 0, 1, 1,
1.156428, 1.047113, 1.028063, 0, 0, 0, 1, 1,
1.165848, 0.6551225, 2.074167, 0, 0, 0, 1, 1,
1.166371, 1.236422, -0.05265835, 0, 0, 0, 1, 1,
1.172304, 0.6640991, 1.935708, 1, 1, 1, 1, 1,
1.176019, -0.4008036, 0.9174041, 1, 1, 1, 1, 1,
1.178298, -0.4826922, 3.201375, 1, 1, 1, 1, 1,
1.183936, 0.9062309, 0.592428, 1, 1, 1, 1, 1,
1.191458, -1.318984, 2.054588, 1, 1, 1, 1, 1,
1.196266, 0.2742465, 1.613892, 1, 1, 1, 1, 1,
1.198902, 0.3870989, 0.2819031, 1, 1, 1, 1, 1,
1.207956, -0.2643333, 2.181448, 1, 1, 1, 1, 1,
1.209214, 0.3495245, 3.14645, 1, 1, 1, 1, 1,
1.215045, 1.887563, 0.3526744, 1, 1, 1, 1, 1,
1.223512, 0.5604884, -0.01497156, 1, 1, 1, 1, 1,
1.227463, -0.1478331, 2.109606, 1, 1, 1, 1, 1,
1.233285, -0.6814351, 1.72945, 1, 1, 1, 1, 1,
1.236566, 0.9068832, 1.316172, 1, 1, 1, 1, 1,
1.242583, 0.4793712, 1.209762, 1, 1, 1, 1, 1,
1.25196, -0.8960205, 2.637824, 0, 0, 1, 1, 1,
1.262745, 1.292414, 0.7319289, 1, 0, 0, 1, 1,
1.265306, 1.761344, 0.1681703, 1, 0, 0, 1, 1,
1.286679, -1.782532, 3.583322, 1, 0, 0, 1, 1,
1.287349, -0.03344631, 1.765238, 1, 0, 0, 1, 1,
1.312735, -0.3371687, 1.728571, 1, 0, 0, 1, 1,
1.319822, 1.399498, 1.028462, 0, 0, 0, 1, 1,
1.321799, -0.8664055, -0.2548016, 0, 0, 0, 1, 1,
1.330732, -1.185328, 1.668856, 0, 0, 0, 1, 1,
1.336443, -0.06284165, 0.7941039, 0, 0, 0, 1, 1,
1.339713, 1.537571, -0.07983746, 0, 0, 0, 1, 1,
1.354756, 0.4118766, 1.511512, 0, 0, 0, 1, 1,
1.358498, 1.149472, 1.910579, 0, 0, 0, 1, 1,
1.35988, 0.05697359, 1.221458, 1, 1, 1, 1, 1,
1.362552, 1.165986, 1.199411, 1, 1, 1, 1, 1,
1.380486, -0.2216141, 0.2591558, 1, 1, 1, 1, 1,
1.381033, -0.5206609, 2.557844, 1, 1, 1, 1, 1,
1.384314, 0.6752683, 0.2417827, 1, 1, 1, 1, 1,
1.391844, 0.6775727, 2.530805, 1, 1, 1, 1, 1,
1.394479, -0.2556926, 1.188521, 1, 1, 1, 1, 1,
1.394716, -0.3332728, 2.057563, 1, 1, 1, 1, 1,
1.397607, 0.6005971, 2.026258, 1, 1, 1, 1, 1,
1.402131, -0.3609961, 1.300086, 1, 1, 1, 1, 1,
1.402632, -1.687555, 4.132704, 1, 1, 1, 1, 1,
1.405659, 0.593632, -1.316143, 1, 1, 1, 1, 1,
1.411096, 0.6797162, 1.323079, 1, 1, 1, 1, 1,
1.413327, -1.599612, 3.511491, 1, 1, 1, 1, 1,
1.414152, 0.7507966, 0.5259048, 1, 1, 1, 1, 1,
1.43258, -0.01917808, 1.223674, 0, 0, 1, 1, 1,
1.438641, -0.9837444, 2.613332, 1, 0, 0, 1, 1,
1.441431, 0.1828918, 1.791023, 1, 0, 0, 1, 1,
1.448874, 1.504694, 0.09764773, 1, 0, 0, 1, 1,
1.453972, -0.7220387, 2.168316, 1, 0, 0, 1, 1,
1.456336, 0.5594115, 1.527352, 1, 0, 0, 1, 1,
1.458948, -1.573357, 3.487145, 0, 0, 0, 1, 1,
1.459419, -1.955912, 2.088159, 0, 0, 0, 1, 1,
1.459448, -0.4163511, 1.795783, 0, 0, 0, 1, 1,
1.464866, -0.5773394, 3.111789, 0, 0, 0, 1, 1,
1.487342, -0.1125391, 0.4164851, 0, 0, 0, 1, 1,
1.487753, 0.08432908, 0.218825, 0, 0, 0, 1, 1,
1.489769, -1.247418, 3.715819, 0, 0, 0, 1, 1,
1.495098, 0.08133314, 0.9327747, 1, 1, 1, 1, 1,
1.508078, -1.305023, 2.510145, 1, 1, 1, 1, 1,
1.531943, -0.02883351, 1.011359, 1, 1, 1, 1, 1,
1.537624, -0.8671234, 3.464494, 1, 1, 1, 1, 1,
1.542274, -0.4413965, 2.502082, 1, 1, 1, 1, 1,
1.558904, 0.05027043, 1.317011, 1, 1, 1, 1, 1,
1.567796, -0.5341206, 0.3192697, 1, 1, 1, 1, 1,
1.579166, 0.2800902, -0.6858023, 1, 1, 1, 1, 1,
1.581033, -1.107268, 1.127432, 1, 1, 1, 1, 1,
1.64849, -1.431853, 2.004129, 1, 1, 1, 1, 1,
1.667579, -0.06695656, 1.800816, 1, 1, 1, 1, 1,
1.668032, 0.2337394, 1.579502, 1, 1, 1, 1, 1,
1.66998, -0.1978537, 3.345175, 1, 1, 1, 1, 1,
1.679638, -0.7936494, 2.65747, 1, 1, 1, 1, 1,
1.683989, 1.197514, 0.5185304, 1, 1, 1, 1, 1,
1.696252, 0.9793739, 1.17524, 0, 0, 1, 1, 1,
1.709381, -0.1348372, 3.243374, 1, 0, 0, 1, 1,
1.715478, 2.551568, 0.5811069, 1, 0, 0, 1, 1,
1.72168, 0.2763604, 1.622602, 1, 0, 0, 1, 1,
1.733564, 1.361117, -1.073327, 1, 0, 0, 1, 1,
1.735831, -0.3689892, 2.086, 1, 0, 0, 1, 1,
1.750276, -0.6264824, 1.316227, 0, 0, 0, 1, 1,
1.756115, -0.4813437, 2.309941, 0, 0, 0, 1, 1,
1.760865, 0.9251487, 0.9738083, 0, 0, 0, 1, 1,
1.765805, -0.1825658, 2.736249, 0, 0, 0, 1, 1,
1.779039, -3.555328, 4.42566, 0, 0, 0, 1, 1,
1.787228, -0.8636999, 5.088916, 0, 0, 0, 1, 1,
1.78858, -1.107064, 2.287422, 0, 0, 0, 1, 1,
1.794188, 1.901475, -0.1825104, 1, 1, 1, 1, 1,
1.80376, 0.6799877, 1.030398, 1, 1, 1, 1, 1,
1.832852, 0.3886585, 1.478401, 1, 1, 1, 1, 1,
1.874298, -2.194349, 2.939229, 1, 1, 1, 1, 1,
1.922118, 0.1196733, -0.3089213, 1, 1, 1, 1, 1,
1.94834, 0.09491236, 1.487306, 1, 1, 1, 1, 1,
1.952471, 0.09443444, 1.390069, 1, 1, 1, 1, 1,
1.97372, -0.445428, 1.973156, 1, 1, 1, 1, 1,
1.984563, 1.003992, 2.862931, 1, 1, 1, 1, 1,
1.999216, 0.5149012, -0.6704794, 1, 1, 1, 1, 1,
2.015773, 0.01596233, 0.06138324, 1, 1, 1, 1, 1,
2.022144, -0.3626901, 0.2186378, 1, 1, 1, 1, 1,
2.047664, 1.942877, -0.5539535, 1, 1, 1, 1, 1,
2.056956, 1.465246, 1.259227, 1, 1, 1, 1, 1,
2.060684, -0.1065792, 1.342322, 1, 1, 1, 1, 1,
2.080955, -0.5405206, 0.8029924, 0, 0, 1, 1, 1,
2.098788, 0.4035415, 1.362452, 1, 0, 0, 1, 1,
2.1551, -0.6216856, 2.032979, 1, 0, 0, 1, 1,
2.216309, 0.8670855, 1.797634, 1, 0, 0, 1, 1,
2.229816, -0.7839722, 0.821099, 1, 0, 0, 1, 1,
2.276392, 1.939123, 0.8346857, 1, 0, 0, 1, 1,
2.278098, -1.339798, 2.259322, 0, 0, 0, 1, 1,
2.28107, 0.2440837, 0.6512903, 0, 0, 0, 1, 1,
2.296937, 1.816553, -0.5331803, 0, 0, 0, 1, 1,
2.301727, 1.195289, 1.062654, 0, 0, 0, 1, 1,
2.355187, 1.759566, 0.5397716, 0, 0, 0, 1, 1,
2.383658, -0.4079661, 0.4761047, 0, 0, 0, 1, 1,
2.394096, 0.3468763, 0.8776932, 0, 0, 0, 1, 1,
2.41315, -0.273043, 2.56655, 1, 1, 1, 1, 1,
2.452115, -0.8546821, 3.347281, 1, 1, 1, 1, 1,
2.677768, -0.7205677, 3.060246, 1, 1, 1, 1, 1,
2.687129, 0.3698955, 1.858086, 1, 1, 1, 1, 1,
3.055487, -0.9276589, 1.762975, 1, 1, 1, 1, 1,
3.236125, 0.4001592, 0.9372185, 1, 1, 1, 1, 1,
3.345468, -0.02965785, 1.680422, 1, 1, 1, 1, 1
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
var radius = 9.331613;
var distance = 32.77689;
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
mvMatrix.translate( -0.2402649, 0.09392285, -0.2362618 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.77689);
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