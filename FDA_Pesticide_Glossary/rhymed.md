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
-2.956355, 1.285177, -3.215614, 1, 0, 0, 1,
-2.831038, 0.5747681, -1.775643, 1, 0.007843138, 0, 1,
-2.788767, 0.001164949, -1.232839, 1, 0.01176471, 0, 1,
-2.72842, -1.52946, -1.600626, 1, 0.01960784, 0, 1,
-2.614296, -1.126255, -1.179446, 1, 0.02352941, 0, 1,
-2.584466, -0.1773367, -3.525095, 1, 0.03137255, 0, 1,
-2.544265, 0.4249831, -1.141962, 1, 0.03529412, 0, 1,
-2.531664, -0.4306074, -2.600115, 1, 0.04313726, 0, 1,
-2.521016, -1.153917, -1.258993, 1, 0.04705882, 0, 1,
-2.476541, -0.6269066, -4.505875, 1, 0.05490196, 0, 1,
-2.471826, -0.3850472, -2.145674, 1, 0.05882353, 0, 1,
-2.468477, -2.261892, -1.225703, 1, 0.06666667, 0, 1,
-2.333799, 0.8770146, -0.7558503, 1, 0.07058824, 0, 1,
-2.312087, -0.4486234, -3.151661, 1, 0.07843138, 0, 1,
-2.279741, 0.03461178, -2.228309, 1, 0.08235294, 0, 1,
-2.251693, 2.481294, -0.8098718, 1, 0.09019608, 0, 1,
-2.153236, -0.2663145, -1.639234, 1, 0.09411765, 0, 1,
-2.13999, 0.8496635, -0.569909, 1, 0.1019608, 0, 1,
-2.134539, -0.6583453, -1.955224, 1, 0.1098039, 0, 1,
-2.127194, -0.6440681, -1.092743, 1, 0.1137255, 0, 1,
-2.094539, 0.6160759, -1.296076, 1, 0.1215686, 0, 1,
-2.05233, -2.232705, -2.525838, 1, 0.1254902, 0, 1,
-2.03334, 1.311586, -0.8391506, 1, 0.1333333, 0, 1,
-2.030369, 2.174544, 0.3202051, 1, 0.1372549, 0, 1,
-2.024194, -0.6733971, -3.193123, 1, 0.145098, 0, 1,
-2.012023, -0.5078782, -1.674827, 1, 0.1490196, 0, 1,
-1.972798, 1.837182, -0.791518, 1, 0.1568628, 0, 1,
-1.918024, 0.1020244, -2.315189, 1, 0.1607843, 0, 1,
-1.871077, -1.447886, -1.866077, 1, 0.1686275, 0, 1,
-1.871024, -1.366311, -0.9172912, 1, 0.172549, 0, 1,
-1.848741, -0.06695569, -1.831621, 1, 0.1803922, 0, 1,
-1.844962, 1.155805, 0.004059055, 1, 0.1843137, 0, 1,
-1.841568, 0.1512687, -1.112491, 1, 0.1921569, 0, 1,
-1.841551, -0.2701159, -1.093136, 1, 0.1960784, 0, 1,
-1.840938, -0.3078351, -1.297036, 1, 0.2039216, 0, 1,
-1.829453, 0.1573465, -2.943115, 1, 0.2117647, 0, 1,
-1.829178, -0.1840798, -1.635955, 1, 0.2156863, 0, 1,
-1.822181, -0.2304976, -1.609284, 1, 0.2235294, 0, 1,
-1.813232, -0.4509908, -1.554405, 1, 0.227451, 0, 1,
-1.799286, -0.7836567, -2.558514, 1, 0.2352941, 0, 1,
-1.790486, -1.780929, -2.710893, 1, 0.2392157, 0, 1,
-1.768493, 0.4749432, -1.869532, 1, 0.2470588, 0, 1,
-1.760836, 1.833027, -1.020951, 1, 0.2509804, 0, 1,
-1.755062, 0.2454811, -0.5552164, 1, 0.2588235, 0, 1,
-1.730947, 1.174877, -0.1858793, 1, 0.2627451, 0, 1,
-1.726481, -0.7655622, -3.521565, 1, 0.2705882, 0, 1,
-1.716412, 2.036255, -1.104292, 1, 0.2745098, 0, 1,
-1.710581, -1.385182, -2.656402, 1, 0.282353, 0, 1,
-1.708632, 1.310826, 1.046327, 1, 0.2862745, 0, 1,
-1.706793, 0.618394, -0.4545132, 1, 0.2941177, 0, 1,
-1.69869, 0.2078527, -1.038425, 1, 0.3019608, 0, 1,
-1.683503, 1.634275, -0.4873213, 1, 0.3058824, 0, 1,
-1.666669, 0.7356851, -1.03222, 1, 0.3137255, 0, 1,
-1.6643, -0.4353065, -2.866175, 1, 0.3176471, 0, 1,
-1.659707, 0.3627459, -1.910121, 1, 0.3254902, 0, 1,
-1.652946, -0.8560905, -2.465066, 1, 0.3294118, 0, 1,
-1.644425, 0.8573554, -1.231262, 1, 0.3372549, 0, 1,
-1.624794, -1.181485, -2.783061, 1, 0.3411765, 0, 1,
-1.613478, -0.550973, 0.3027669, 1, 0.3490196, 0, 1,
-1.572118, 0.8034918, -2.31111, 1, 0.3529412, 0, 1,
-1.572038, -0.6261209, -2.541782, 1, 0.3607843, 0, 1,
-1.570095, -0.644888, -3.331635, 1, 0.3647059, 0, 1,
-1.550975, -0.5557344, -2.21577, 1, 0.372549, 0, 1,
-1.533086, -1.016445, -0.9691325, 1, 0.3764706, 0, 1,
-1.528722, -1.376517, -3.00981, 1, 0.3843137, 0, 1,
-1.514653, 0.4059279, -2.073962, 1, 0.3882353, 0, 1,
-1.507846, -1.047933, 1.049, 1, 0.3960784, 0, 1,
-1.485508, 0.3415759, -2.01114, 1, 0.4039216, 0, 1,
-1.485151, 0.2747242, -1.044121, 1, 0.4078431, 0, 1,
-1.47701, -0.6102992, -1.085914, 1, 0.4156863, 0, 1,
-1.475953, 1.412492, -1.85954, 1, 0.4196078, 0, 1,
-1.470402, 0.9137541, -2.911832, 1, 0.427451, 0, 1,
-1.464531, 0.9832816, -1.33436, 1, 0.4313726, 0, 1,
-1.455263, -0.3851566, -0.9043614, 1, 0.4392157, 0, 1,
-1.455235, 0.3749053, -0.5635188, 1, 0.4431373, 0, 1,
-1.447116, 1.130258, -0.5178262, 1, 0.4509804, 0, 1,
-1.439402, -0.2918425, -2.697482, 1, 0.454902, 0, 1,
-1.437983, -0.2203287, -1.573048, 1, 0.4627451, 0, 1,
-1.437363, 2.063604, -0.1791781, 1, 0.4666667, 0, 1,
-1.432826, 0.1717719, -2.421055, 1, 0.4745098, 0, 1,
-1.426764, -0.6184937, -1.151735, 1, 0.4784314, 0, 1,
-1.420391, -0.9160102, -1.042169, 1, 0.4862745, 0, 1,
-1.419066, 0.8544651, -1.377615, 1, 0.4901961, 0, 1,
-1.413323, -1.646147, -1.777061, 1, 0.4980392, 0, 1,
-1.404795, -0.9957355, -2.390228, 1, 0.5058824, 0, 1,
-1.403031, -0.191496, -2.473389, 1, 0.509804, 0, 1,
-1.394668, 0.1211204, 0.4460008, 1, 0.5176471, 0, 1,
-1.377231, -1.025275, -0.6433283, 1, 0.5215687, 0, 1,
-1.37012, 0.276749, -1.265993, 1, 0.5294118, 0, 1,
-1.362559, 1.319585, -1.225976, 1, 0.5333334, 0, 1,
-1.350702, 0.3188866, -3.821316, 1, 0.5411765, 0, 1,
-1.347252, -1.665836, -2.133914, 1, 0.5450981, 0, 1,
-1.34325, -1.359699, -3.187964, 1, 0.5529412, 0, 1,
-1.331888, 1.422396, -2.88799, 1, 0.5568628, 0, 1,
-1.328546, -1.897281, -2.286773, 1, 0.5647059, 0, 1,
-1.322229, 0.4217587, -2.076402, 1, 0.5686275, 0, 1,
-1.321787, -0.9272705, -2.968969, 1, 0.5764706, 0, 1,
-1.318338, 2.292785, -1.040928, 1, 0.5803922, 0, 1,
-1.313879, -0.69793, 0.06054748, 1, 0.5882353, 0, 1,
-1.307195, 0.456086, -0.4095806, 1, 0.5921569, 0, 1,
-1.306087, 0.9178349, -0.3317815, 1, 0.6, 0, 1,
-1.290813, 1.903262, 0.6230724, 1, 0.6078432, 0, 1,
-1.290076, -0.6110271, -3.162037, 1, 0.6117647, 0, 1,
-1.285471, -2.482185, -4.042062, 1, 0.6196079, 0, 1,
-1.282284, 0.6402949, -1.044546, 1, 0.6235294, 0, 1,
-1.281153, 0.02272782, -1.109993, 1, 0.6313726, 0, 1,
-1.280179, -0.4633642, -1.723458, 1, 0.6352941, 0, 1,
-1.270627, 0.7147595, 1.541757, 1, 0.6431373, 0, 1,
-1.269634, -0.5428887, -0.4447466, 1, 0.6470588, 0, 1,
-1.261019, -0.4280876, -1.263828, 1, 0.654902, 0, 1,
-1.255032, 0.7766513, -0.680185, 1, 0.6588235, 0, 1,
-1.251946, -1.463981, -2.989836, 1, 0.6666667, 0, 1,
-1.244897, 1.001322, -1.680193, 1, 0.6705883, 0, 1,
-1.240736, -0.4150681, -1.963546, 1, 0.6784314, 0, 1,
-1.235835, -0.5694218, -3.764412, 1, 0.682353, 0, 1,
-1.234368, 0.8433759, 0.5469976, 1, 0.6901961, 0, 1,
-1.231928, -1.919963, -1.766433, 1, 0.6941177, 0, 1,
-1.230222, 0.1012209, -1.13522, 1, 0.7019608, 0, 1,
-1.225181, 0.05134775, -2.67876, 1, 0.7098039, 0, 1,
-1.222845, -1.083817, -2.292197, 1, 0.7137255, 0, 1,
-1.220738, 1.326804, -1.51303, 1, 0.7215686, 0, 1,
-1.22046, 1.450917, -1.229203, 1, 0.7254902, 0, 1,
-1.219521, -1.184749, -1.737471, 1, 0.7333333, 0, 1,
-1.212655, -0.6297058, -3.12985, 1, 0.7372549, 0, 1,
-1.21169, 0.1164098, -3.043164, 1, 0.7450981, 0, 1,
-1.2107, -0.02758373, -2.123418, 1, 0.7490196, 0, 1,
-1.209159, 0.7557602, -1.559616, 1, 0.7568628, 0, 1,
-1.193977, -0.5986602, -2.570727, 1, 0.7607843, 0, 1,
-1.193258, -0.4889783, -0.7653519, 1, 0.7686275, 0, 1,
-1.186703, 0.674165, -4.072049, 1, 0.772549, 0, 1,
-1.185618, 0.03915213, -2.351243, 1, 0.7803922, 0, 1,
-1.183214, 1.066305, 0.3963202, 1, 0.7843137, 0, 1,
-1.179286, -0.5095828, -1.160712, 1, 0.7921569, 0, 1,
-1.176774, 2.608397, -0.2524253, 1, 0.7960784, 0, 1,
-1.164881, 1.473058, -1.041338, 1, 0.8039216, 0, 1,
-1.160904, 1.062626, 0.6072351, 1, 0.8117647, 0, 1,
-1.156698, 0.09366455, -2.378899, 1, 0.8156863, 0, 1,
-1.156312, -0.3345187, -2.489116, 1, 0.8235294, 0, 1,
-1.152727, 1.082289, -1.218589, 1, 0.827451, 0, 1,
-1.146996, -1.134906, -3.346337, 1, 0.8352941, 0, 1,
-1.144922, 1.210834, -2.463064, 1, 0.8392157, 0, 1,
-1.142506, -1.62876, -3.261713, 1, 0.8470588, 0, 1,
-1.142142, 0.1286775, 0.08700269, 1, 0.8509804, 0, 1,
-1.129026, 2.201236, 0.9610491, 1, 0.8588235, 0, 1,
-1.126848, 0.7487438, 0.9368582, 1, 0.8627451, 0, 1,
-1.121285, -1.801537, -3.091276, 1, 0.8705882, 0, 1,
-1.116846, -0.1629147, -0.7918187, 1, 0.8745098, 0, 1,
-1.114596, 0.7377323, -2.597132, 1, 0.8823529, 0, 1,
-1.108297, -0.8177075, -1.519147, 1, 0.8862745, 0, 1,
-1.104345, -0.2174611, -2.818899, 1, 0.8941177, 0, 1,
-1.099651, 1.150461, 0.8671179, 1, 0.8980392, 0, 1,
-1.098667, -0.6549362, -1.418468, 1, 0.9058824, 0, 1,
-1.097513, -0.1938637, -0.9215668, 1, 0.9137255, 0, 1,
-1.095283, 0.8425057, -1.731762, 1, 0.9176471, 0, 1,
-1.09427, 0.5159048, -1.144802, 1, 0.9254902, 0, 1,
-1.090855, 0.5876993, 0.3128743, 1, 0.9294118, 0, 1,
-1.089993, 2.604896, 0.1914513, 1, 0.9372549, 0, 1,
-1.087509, -0.003864459, -2.846493, 1, 0.9411765, 0, 1,
-1.083172, 0.5687669, -1.172494, 1, 0.9490196, 0, 1,
-1.069351, 1.392731, -1.016198, 1, 0.9529412, 0, 1,
-1.067952, 1.304007, 0.512439, 1, 0.9607843, 0, 1,
-1.067734, 1.631069, -0.3131619, 1, 0.9647059, 0, 1,
-1.061734, -0.6456394, -3.066965, 1, 0.972549, 0, 1,
-1.058499, 0.3157327, -1.671966, 1, 0.9764706, 0, 1,
-1.05675, 0.1505922, -0.2829555, 1, 0.9843137, 0, 1,
-1.0566, 0.7125617, -1.406127, 1, 0.9882353, 0, 1,
-1.054825, -0.4679319, -1.694998, 1, 0.9960784, 0, 1,
-1.053622, 0.8845971, -2.898324, 0.9960784, 1, 0, 1,
-1.048104, 0.825879, -0.2598763, 0.9921569, 1, 0, 1,
-1.044293, -0.3483641, -3.49377, 0.9843137, 1, 0, 1,
-1.024221, -1.056201, -1.732579, 0.9803922, 1, 0, 1,
-1.022243, -0.6461047, -3.295307, 0.972549, 1, 0, 1,
-1.02073, 0.430063, -0.0276178, 0.9686275, 1, 0, 1,
-1.015614, 0.3428701, -1.990741, 0.9607843, 1, 0, 1,
-1.008863, 0.6008866, -1.189911, 0.9568627, 1, 0, 1,
-1.007906, 0.7054403, -0.1559844, 0.9490196, 1, 0, 1,
-1.004625, -0.7646464, -1.889792, 0.945098, 1, 0, 1,
-0.9973812, -0.363402, -1.36352, 0.9372549, 1, 0, 1,
-0.9961087, 0.2053128, -2.178857, 0.9333333, 1, 0, 1,
-0.9904386, -0.05735245, -0.8389824, 0.9254902, 1, 0, 1,
-0.9880136, 2.937177, 0.2917192, 0.9215686, 1, 0, 1,
-0.9868596, 0.6173221, -1.452892, 0.9137255, 1, 0, 1,
-0.979583, 1.022686, 0.7320368, 0.9098039, 1, 0, 1,
-0.9761992, -0.4320029, -2.293812, 0.9019608, 1, 0, 1,
-0.969469, -0.2433587, -2.851523, 0.8941177, 1, 0, 1,
-0.9662285, -0.08507358, -2.712044, 0.8901961, 1, 0, 1,
-0.9638718, -0.2512065, -1.675587, 0.8823529, 1, 0, 1,
-0.9509009, -0.7072838, -1.366579, 0.8784314, 1, 0, 1,
-0.9471459, 0.1116056, -0.09335745, 0.8705882, 1, 0, 1,
-0.9460692, -1.344649, -2.011755, 0.8666667, 1, 0, 1,
-0.9450036, -0.7184289, -2.095417, 0.8588235, 1, 0, 1,
-0.9429139, -1.663818, -2.957837, 0.854902, 1, 0, 1,
-0.9417432, -0.2299764, -0.8855405, 0.8470588, 1, 0, 1,
-0.9330714, -0.5200965, -0.02076019, 0.8431373, 1, 0, 1,
-0.9322197, -0.1442692, 1.469519, 0.8352941, 1, 0, 1,
-0.9274223, -2.961433, -0.2053696, 0.8313726, 1, 0, 1,
-0.9261228, -0.9480557, -3.959843, 0.8235294, 1, 0, 1,
-0.921657, -0.1448907, -1.921027, 0.8196079, 1, 0, 1,
-0.9183432, 0.4232551, -1.629203, 0.8117647, 1, 0, 1,
-0.9088273, 0.1379547, -0.3306445, 0.8078431, 1, 0, 1,
-0.8994759, -0.08489754, 0.7632918, 0.8, 1, 0, 1,
-0.8979576, 0.02461982, -1.681268, 0.7921569, 1, 0, 1,
-0.8938805, -2.555396, -1.823132, 0.7882353, 1, 0, 1,
-0.8933492, 0.6539883, -1.195238, 0.7803922, 1, 0, 1,
-0.8906166, -0.2519447, -2.231598, 0.7764706, 1, 0, 1,
-0.8906075, 0.3273388, -0.2851259, 0.7686275, 1, 0, 1,
-0.8862097, 0.5234892, -3.134606, 0.7647059, 1, 0, 1,
-0.884443, -0.1420849, -3.253424, 0.7568628, 1, 0, 1,
-0.8736533, -1.227868, -3.912519, 0.7529412, 1, 0, 1,
-0.8688158, 0.8427514, 0.3728518, 0.7450981, 1, 0, 1,
-0.865345, -0.1387699, -1.90832, 0.7411765, 1, 0, 1,
-0.8627723, -0.3410714, -1.400173, 0.7333333, 1, 0, 1,
-0.8610088, 1.022697, 0.1782354, 0.7294118, 1, 0, 1,
-0.8523762, -0.08374238, -0.6920633, 0.7215686, 1, 0, 1,
-0.8411542, 0.5018075, -1.925984, 0.7176471, 1, 0, 1,
-0.8382809, -0.732332, -2.038361, 0.7098039, 1, 0, 1,
-0.8280494, -2.992423, -2.41564, 0.7058824, 1, 0, 1,
-0.82743, 1.370623, -0.7505835, 0.6980392, 1, 0, 1,
-0.8242348, 1.79591, 0.3180611, 0.6901961, 1, 0, 1,
-0.8199005, -0.1012063, -0.01141285, 0.6862745, 1, 0, 1,
-0.81726, 0.6806046, -1.013507, 0.6784314, 1, 0, 1,
-0.8095121, 0.3939351, -0.9962637, 0.6745098, 1, 0, 1,
-0.7994248, -0.1350123, -1.593371, 0.6666667, 1, 0, 1,
-0.7971692, 1.475398, -2.251637, 0.6627451, 1, 0, 1,
-0.7925333, 0.7866248, -0.9808402, 0.654902, 1, 0, 1,
-0.7779309, -1.671227, -2.391067, 0.6509804, 1, 0, 1,
-0.77025, 1.512585, -0.7054777, 0.6431373, 1, 0, 1,
-0.764011, -0.6642183, -1.942934, 0.6392157, 1, 0, 1,
-0.7619447, 1.198393, -0.5149065, 0.6313726, 1, 0, 1,
-0.7618809, 0.6999344, -0.1056758, 0.627451, 1, 0, 1,
-0.7618501, -0.4300535, -1.383158, 0.6196079, 1, 0, 1,
-0.7594977, -0.7530536, -1.791922, 0.6156863, 1, 0, 1,
-0.7557712, -0.5665982, -4.428131, 0.6078432, 1, 0, 1,
-0.7476398, -0.2487812, -2.588509, 0.6039216, 1, 0, 1,
-0.7460808, 0.4334039, -0.2889733, 0.5960785, 1, 0, 1,
-0.7449258, -0.742293, -4.762914, 0.5882353, 1, 0, 1,
-0.7340973, -0.2884765, -1.876716, 0.5843138, 1, 0, 1,
-0.7224205, -0.4053149, -1.434099, 0.5764706, 1, 0, 1,
-0.7130558, -1.227515, -3.436074, 0.572549, 1, 0, 1,
-0.7113412, 1.724976, -1.525803, 0.5647059, 1, 0, 1,
-0.7070526, 0.8373768, 0.04433742, 0.5607843, 1, 0, 1,
-0.6928756, -1.291864, -1.841149, 0.5529412, 1, 0, 1,
-0.690798, -1.677141, -2.800638, 0.5490196, 1, 0, 1,
-0.6907, -1.310972, -0.6278685, 0.5411765, 1, 0, 1,
-0.6880518, -0.06446839, -0.1934242, 0.5372549, 1, 0, 1,
-0.6835042, 0.1491499, -1.094563, 0.5294118, 1, 0, 1,
-0.6802242, -0.2252897, -2.668504, 0.5254902, 1, 0, 1,
-0.6800476, 0.4386502, -0.06553224, 0.5176471, 1, 0, 1,
-0.6771838, 1.503779, -0.7407601, 0.5137255, 1, 0, 1,
-0.6742232, 2.226784, 1.026699, 0.5058824, 1, 0, 1,
-0.6694077, 0.1873479, 0.545329, 0.5019608, 1, 0, 1,
-0.6665867, -0.5211691, -2.586497, 0.4941176, 1, 0, 1,
-0.6643344, 0.3071288, -0.6642758, 0.4862745, 1, 0, 1,
-0.6559757, -0.1699076, -3.516805, 0.4823529, 1, 0, 1,
-0.653859, 0.04231548, -3.171455, 0.4745098, 1, 0, 1,
-0.6529506, -0.4417479, -2.9238, 0.4705882, 1, 0, 1,
-0.6527113, -1.23296, -3.653043, 0.4627451, 1, 0, 1,
-0.6524568, -0.8408519, -3.147109, 0.4588235, 1, 0, 1,
-0.6479089, 0.297192, -2.583026, 0.4509804, 1, 0, 1,
-0.646265, 1.158524, 0.5504181, 0.4470588, 1, 0, 1,
-0.6386321, -2.980232, -3.446278, 0.4392157, 1, 0, 1,
-0.6304877, 1.382853, 0.8594437, 0.4352941, 1, 0, 1,
-0.6246388, -1.388913, -1.863995, 0.427451, 1, 0, 1,
-0.6210462, 1.318951, -1.401022, 0.4235294, 1, 0, 1,
-0.6204189, 1.146116, -1.444768, 0.4156863, 1, 0, 1,
-0.6142341, 1.572488, -1.231519, 0.4117647, 1, 0, 1,
-0.612244, 0.007661717, -1.249608, 0.4039216, 1, 0, 1,
-0.6110721, -0.3694273, -1.897729, 0.3960784, 1, 0, 1,
-0.6107386, -0.5610881, -4.616445, 0.3921569, 1, 0, 1,
-0.6052195, -1.458148, -3.903959, 0.3843137, 1, 0, 1,
-0.604729, -1.617897, -1.582305, 0.3803922, 1, 0, 1,
-0.6041238, 2.07353, 0.4109598, 0.372549, 1, 0, 1,
-0.5961918, -1.494301, -2.715408, 0.3686275, 1, 0, 1,
-0.5958731, 0.4932834, -1.229728, 0.3607843, 1, 0, 1,
-0.5952257, -1.548842, -4.185472, 0.3568628, 1, 0, 1,
-0.5916461, -0.1965646, -1.746355, 0.3490196, 1, 0, 1,
-0.59147, -1.402791, -4.085051, 0.345098, 1, 0, 1,
-0.5913082, -1.056634, -3.683878, 0.3372549, 1, 0, 1,
-0.5905429, -0.1648545, -1.37058, 0.3333333, 1, 0, 1,
-0.5771736, -0.4562156, -2.888918, 0.3254902, 1, 0, 1,
-0.5754089, -0.1020919, -1.577035, 0.3215686, 1, 0, 1,
-0.5731634, 0.4609298, -0.8164703, 0.3137255, 1, 0, 1,
-0.5727322, -0.2357844, -0.5323572, 0.3098039, 1, 0, 1,
-0.5692258, -1.417374, -2.879453, 0.3019608, 1, 0, 1,
-0.5677605, 1.636014, -0.2262472, 0.2941177, 1, 0, 1,
-0.5674241, 1.031825, 0.3150851, 0.2901961, 1, 0, 1,
-0.5639126, 0.006018899, -0.8966694, 0.282353, 1, 0, 1,
-0.5635891, 0.3101725, -1.121498, 0.2784314, 1, 0, 1,
-0.5604686, -0.380052, -3.028462, 0.2705882, 1, 0, 1,
-0.5594261, -0.7968772, -3.026286, 0.2666667, 1, 0, 1,
-0.5591925, -0.5263858, -2.457649, 0.2588235, 1, 0, 1,
-0.5513907, -0.02246971, -1.96575, 0.254902, 1, 0, 1,
-0.5509782, 0.4194308, -0.5303611, 0.2470588, 1, 0, 1,
-0.5385601, -0.9045525, -0.1641433, 0.2431373, 1, 0, 1,
-0.5368273, 1.375353, -0.08126157, 0.2352941, 1, 0, 1,
-0.5353502, -0.03686481, -2.875068, 0.2313726, 1, 0, 1,
-0.5326421, -0.2198789, -3.621461, 0.2235294, 1, 0, 1,
-0.5307927, 0.1311794, -1.166061, 0.2196078, 1, 0, 1,
-0.5285978, -0.9453659, -1.148815, 0.2117647, 1, 0, 1,
-0.524125, -0.07242376, -2.190521, 0.2078431, 1, 0, 1,
-0.519807, 0.6346577, -0.7427284, 0.2, 1, 0, 1,
-0.5171006, 1.654834, -3.073225, 0.1921569, 1, 0, 1,
-0.5150856, -0.5596117, -3.780102, 0.1882353, 1, 0, 1,
-0.5125978, -1.841388, -2.759829, 0.1803922, 1, 0, 1,
-0.5100283, -1.827459, -4.238567, 0.1764706, 1, 0, 1,
-0.5076597, -1.162823, -2.08438, 0.1686275, 1, 0, 1,
-0.5070995, -1.235646, -3.43846, 0.1647059, 1, 0, 1,
-0.5052878, 0.7854896, -0.06854685, 0.1568628, 1, 0, 1,
-0.5051557, -0.3361508, -1.34866, 0.1529412, 1, 0, 1,
-0.5044165, -1.272092, -2.904262, 0.145098, 1, 0, 1,
-0.5007011, 1.15946, -0.1426491, 0.1411765, 1, 0, 1,
-0.4976496, 0.923829, -0.6040867, 0.1333333, 1, 0, 1,
-0.4974248, 0.04061925, -1.660519, 0.1294118, 1, 0, 1,
-0.4907044, -0.4244255, -2.581168, 0.1215686, 1, 0, 1,
-0.4894465, 0.1368166, -0.5981422, 0.1176471, 1, 0, 1,
-0.4888817, 1.106131, 0.4963891, 0.1098039, 1, 0, 1,
-0.4863043, 0.6460458, 0.66996, 0.1058824, 1, 0, 1,
-0.482226, -1.417149, -1.391942, 0.09803922, 1, 0, 1,
-0.480412, -1.367051, -2.617378, 0.09019608, 1, 0, 1,
-0.4785205, 0.1076272, -2.908003, 0.08627451, 1, 0, 1,
-0.4778989, -1.749777, -0.6689623, 0.07843138, 1, 0, 1,
-0.4767137, -0.914189, -1.882, 0.07450981, 1, 0, 1,
-0.4757925, -1.949829, -2.067269, 0.06666667, 1, 0, 1,
-0.4747057, -2.06636, -3.017036, 0.0627451, 1, 0, 1,
-0.4737746, -2.197675, -1.696771, 0.05490196, 1, 0, 1,
-0.4690329, -1.719374, -1.558087, 0.05098039, 1, 0, 1,
-0.4668902, -1.635714, -3.320215, 0.04313726, 1, 0, 1,
-0.4657361, -0.3316719, -2.131259, 0.03921569, 1, 0, 1,
-0.4637976, -0.01011012, -0.7560301, 0.03137255, 1, 0, 1,
-0.4625937, -1.109983, -3.791018, 0.02745098, 1, 0, 1,
-0.4551908, -0.8417022, -0.2804172, 0.01960784, 1, 0, 1,
-0.4529594, -0.5677506, -3.017828, 0.01568628, 1, 0, 1,
-0.4525298, 1.043779, -0.8336708, 0.007843138, 1, 0, 1,
-0.4512226, 1.078496, 0.5785282, 0.003921569, 1, 0, 1,
-0.4510011, 0.6278667, -0.7359416, 0, 1, 0.003921569, 1,
-0.4509015, -0.9481675, -3.079395, 0, 1, 0.01176471, 1,
-0.4507654, 0.364922, -0.7842777, 0, 1, 0.01568628, 1,
-0.4498773, -0.049162, -3.163697, 0, 1, 0.02352941, 1,
-0.4484748, 0.2747037, 0.4867588, 0, 1, 0.02745098, 1,
-0.4466353, -0.9070945, -2.951574, 0, 1, 0.03529412, 1,
-0.444344, 0.3141841, -1.732497, 0, 1, 0.03921569, 1,
-0.4432951, -1.216333, -1.158712, 0, 1, 0.04705882, 1,
-0.4428996, -0.1751462, -2.017645, 0, 1, 0.05098039, 1,
-0.4412059, 0.5553904, -1.643959, 0, 1, 0.05882353, 1,
-0.4391611, 1.207575, -0.2060543, 0, 1, 0.0627451, 1,
-0.4381123, -0.5883799, -3.26733, 0, 1, 0.07058824, 1,
-0.4351233, 1.036979, -0.8103746, 0, 1, 0.07450981, 1,
-0.4347854, -0.03605521, -2.670808, 0, 1, 0.08235294, 1,
-0.4344139, -0.1643148, -1.958627, 0, 1, 0.08627451, 1,
-0.433684, 1.147614, -2.361902, 0, 1, 0.09411765, 1,
-0.433674, 0.02979586, -1.897749, 0, 1, 0.1019608, 1,
-0.432254, -0.5170674, -1.858835, 0, 1, 0.1058824, 1,
-0.4256214, -0.142145, -2.166048, 0, 1, 0.1137255, 1,
-0.4246461, 0.6960566, -1.031763, 0, 1, 0.1176471, 1,
-0.4240941, 0.3448875, -0.9392521, 0, 1, 0.1254902, 1,
-0.4219415, 1.951094, -0.816004, 0, 1, 0.1294118, 1,
-0.4181871, -0.03811609, -0.1297592, 0, 1, 0.1372549, 1,
-0.4143941, 0.4219549, 1.353752, 0, 1, 0.1411765, 1,
-0.4123648, 1.588236, -1.333434, 0, 1, 0.1490196, 1,
-0.4076847, -0.9429375, -3.546496, 0, 1, 0.1529412, 1,
-0.4074347, -0.5327517, -2.714183, 0, 1, 0.1607843, 1,
-0.4069851, -0.3832948, -2.710246, 0, 1, 0.1647059, 1,
-0.4049432, -2.060515, -3.419405, 0, 1, 0.172549, 1,
-0.4031543, -0.9815675, -3.12929, 0, 1, 0.1764706, 1,
-0.4014412, -0.9491429, -1.210321, 0, 1, 0.1843137, 1,
-0.3982721, 1.110818, 0.8879254, 0, 1, 0.1882353, 1,
-0.3974714, 0.1508802, -1.80865, 0, 1, 0.1960784, 1,
-0.3959742, 0.5247595, -0.3839315, 0, 1, 0.2039216, 1,
-0.3955669, -2.088932, -2.650635, 0, 1, 0.2078431, 1,
-0.3947702, -2.498226, -3.968062, 0, 1, 0.2156863, 1,
-0.3920356, -0.3126012, -2.417626, 0, 1, 0.2196078, 1,
-0.3896389, 0.07289413, -2.210108, 0, 1, 0.227451, 1,
-0.3895104, 1.255827, 1.31245, 0, 1, 0.2313726, 1,
-0.3889716, -1.305803, -2.490404, 0, 1, 0.2392157, 1,
-0.3758731, 0.2343914, -1.004691, 0, 1, 0.2431373, 1,
-0.3740304, 0.5584072, 0.3012559, 0, 1, 0.2509804, 1,
-0.3709072, -0.237623, 0.9752566, 0, 1, 0.254902, 1,
-0.3693552, -0.4974935, -3.208085, 0, 1, 0.2627451, 1,
-0.3553621, 1.441431, 0.2076472, 0, 1, 0.2666667, 1,
-0.3495823, -0.8349671, -3.477099, 0, 1, 0.2745098, 1,
-0.3482332, 1.190038, 0.9676176, 0, 1, 0.2784314, 1,
-0.3430335, 0.2882153, 0.161011, 0, 1, 0.2862745, 1,
-0.3407832, -0.1606669, -2.918929, 0, 1, 0.2901961, 1,
-0.3397154, -1.132811, -5.265191, 0, 1, 0.2980392, 1,
-0.3388065, -0.3038665, -1.23696, 0, 1, 0.3058824, 1,
-0.3372129, -0.06624062, -3.05549, 0, 1, 0.3098039, 1,
-0.3334859, 0.3016829, -0.3205778, 0, 1, 0.3176471, 1,
-0.3264867, 0.9515845, -0.2051878, 0, 1, 0.3215686, 1,
-0.323444, -0.5447582, -1.463004, 0, 1, 0.3294118, 1,
-0.3227566, 1.264244, -0.4442372, 0, 1, 0.3333333, 1,
-0.3224177, 1.180276, -0.2817788, 0, 1, 0.3411765, 1,
-0.3140807, 0.22122, -0.9410936, 0, 1, 0.345098, 1,
-0.3135985, 0.7428979, -0.4219577, 0, 1, 0.3529412, 1,
-0.3134665, 1.481281, -0.1219447, 0, 1, 0.3568628, 1,
-0.3132296, -0.1826031, -1.59945, 0, 1, 0.3647059, 1,
-0.3091784, 0.3447292, -2.139742, 0, 1, 0.3686275, 1,
-0.3049641, -0.4098492, -4.626596, 0, 1, 0.3764706, 1,
-0.2979464, 0.2090635, 0.1528772, 0, 1, 0.3803922, 1,
-0.2976003, 0.02295411, -0.9747161, 0, 1, 0.3882353, 1,
-0.2947752, -1.442702, -1.588263, 0, 1, 0.3921569, 1,
-0.2946678, 0.1648251, -1.502952, 0, 1, 0.4, 1,
-0.2941175, 0.1207395, -0.1644941, 0, 1, 0.4078431, 1,
-0.2936298, -0.3175747, -1.941158, 0, 1, 0.4117647, 1,
-0.2922881, -0.4094637, -3.959983, 0, 1, 0.4196078, 1,
-0.2920988, 0.1542763, -0.584118, 0, 1, 0.4235294, 1,
-0.2915463, -1.631324, -2.549465, 0, 1, 0.4313726, 1,
-0.2914787, 0.2416642, 0.1211947, 0, 1, 0.4352941, 1,
-0.2867012, 0.2315703, -2.822726, 0, 1, 0.4431373, 1,
-0.2864077, -0.3405563, -2.78387, 0, 1, 0.4470588, 1,
-0.2826661, 0.1516636, -1.61329, 0, 1, 0.454902, 1,
-0.280571, -0.783327, -2.805438, 0, 1, 0.4588235, 1,
-0.2788242, 0.4207992, -1.185604, 0, 1, 0.4666667, 1,
-0.2784002, 1.282935, 0.6523721, 0, 1, 0.4705882, 1,
-0.2783663, 0.7236653, -0.9670874, 0, 1, 0.4784314, 1,
-0.2778909, -0.4810925, -3.418997, 0, 1, 0.4823529, 1,
-0.2730323, 0.1059741, -0.7054442, 0, 1, 0.4901961, 1,
-0.2722523, 1.268678, -0.01237411, 0, 1, 0.4941176, 1,
-0.2676564, -1.134856, -2.653951, 0, 1, 0.5019608, 1,
-0.2639288, -0.166436, -3.209132, 0, 1, 0.509804, 1,
-0.2564686, 0.0993569, -0.164317, 0, 1, 0.5137255, 1,
-0.2554659, 0.9078935, 1.547261, 0, 1, 0.5215687, 1,
-0.2553461, -0.00968344, -2.200903, 0, 1, 0.5254902, 1,
-0.2518762, -0.4825955, -2.14085, 0, 1, 0.5333334, 1,
-0.2518638, -0.3572957, -2.78066, 0, 1, 0.5372549, 1,
-0.2495826, 0.4907765, -0.7441154, 0, 1, 0.5450981, 1,
-0.2437395, 1.33222, 0.8234703, 0, 1, 0.5490196, 1,
-0.2428523, -0.807408, -2.347129, 0, 1, 0.5568628, 1,
-0.237616, -0.3357148, -3.249965, 0, 1, 0.5607843, 1,
-0.2336885, -0.3703857, -4.692366, 0, 1, 0.5686275, 1,
-0.2326977, -0.4939799, -4.021862, 0, 1, 0.572549, 1,
-0.2266454, 0.09999954, -0.8501006, 0, 1, 0.5803922, 1,
-0.2240722, -1.092085, -3.910458, 0, 1, 0.5843138, 1,
-0.2210249, 0.6200932, -1.301931, 0, 1, 0.5921569, 1,
-0.2154574, -0.1746608, -2.067475, 0, 1, 0.5960785, 1,
-0.2097262, 2.197145, -0.694504, 0, 1, 0.6039216, 1,
-0.2048108, 0.07103387, -2.663846, 0, 1, 0.6117647, 1,
-0.2038774, 0.2298076, -2.280271, 0, 1, 0.6156863, 1,
-0.2034105, -1.358403, -4.00896, 0, 1, 0.6235294, 1,
-0.2025515, -0.4580304, -2.395201, 0, 1, 0.627451, 1,
-0.202374, -0.2361405, -2.288652, 0, 1, 0.6352941, 1,
-0.1985265, -0.1438958, -1.16847, 0, 1, 0.6392157, 1,
-0.1964055, -0.8105078, -5.411199, 0, 1, 0.6470588, 1,
-0.1960947, 1.34852, 1.986798, 0, 1, 0.6509804, 1,
-0.1916694, 1.585634, 0.9010737, 0, 1, 0.6588235, 1,
-0.185433, -1.878734, -2.451935, 0, 1, 0.6627451, 1,
-0.1853064, 0.8937613, -2.360495, 0, 1, 0.6705883, 1,
-0.1848431, 0.4181761, -0.3015065, 0, 1, 0.6745098, 1,
-0.1837589, -1.133695, -3.233774, 0, 1, 0.682353, 1,
-0.1830196, -0.8956936, -3.148088, 0, 1, 0.6862745, 1,
-0.1817686, -0.09681834, -0.8499224, 0, 1, 0.6941177, 1,
-0.1812511, -1.476305, -1.635312, 0, 1, 0.7019608, 1,
-0.1748387, 3.114479, -1.194123, 0, 1, 0.7058824, 1,
-0.1721457, 0.1476258, 0.04734947, 0, 1, 0.7137255, 1,
-0.1684964, 0.6683673, 1.420402, 0, 1, 0.7176471, 1,
-0.1684921, -0.2892387, -1.973707, 0, 1, 0.7254902, 1,
-0.1667241, 1.014658, -0.6496471, 0, 1, 0.7294118, 1,
-0.1661698, 1.021539, 0.3079894, 0, 1, 0.7372549, 1,
-0.1624575, -1.021553, -4.290976, 0, 1, 0.7411765, 1,
-0.1564858, 0.9884662, -0.906648, 0, 1, 0.7490196, 1,
-0.1528086, 0.8151172, -0.009495618, 0, 1, 0.7529412, 1,
-0.1525382, -0.4714568, -2.239717, 0, 1, 0.7607843, 1,
-0.1506072, 0.576815, -0.776897, 0, 1, 0.7647059, 1,
-0.1449765, 0.4350747, 0.8263187, 0, 1, 0.772549, 1,
-0.14428, 0.5565852, 0.9167945, 0, 1, 0.7764706, 1,
-0.1424396, 0.7992585, -0.5473501, 0, 1, 0.7843137, 1,
-0.1370825, 0.2290563, -0.5969861, 0, 1, 0.7882353, 1,
-0.1364098, 0.7953963, -0.2737509, 0, 1, 0.7960784, 1,
-0.136106, -0.0424977, -1.4288, 0, 1, 0.8039216, 1,
-0.1335813, -1.167108, -3.352629, 0, 1, 0.8078431, 1,
-0.1332394, 0.7073092, -1.975037, 0, 1, 0.8156863, 1,
-0.131634, 0.6440195, -0.892906, 0, 1, 0.8196079, 1,
-0.1311496, -1.170313, -3.024734, 0, 1, 0.827451, 1,
-0.1262834, -0.08912515, -1.214756, 0, 1, 0.8313726, 1,
-0.1260512, 0.3740207, -1.272938, 0, 1, 0.8392157, 1,
-0.1238671, 0.1462078, -0.06825143, 0, 1, 0.8431373, 1,
-0.1194898, 0.5101803, 0.9073061, 0, 1, 0.8509804, 1,
-0.1190223, -0.2758819, -1.986248, 0, 1, 0.854902, 1,
-0.1183706, -0.8167592, -2.509276, 0, 1, 0.8627451, 1,
-0.1160451, -0.9874957, -2.500691, 0, 1, 0.8666667, 1,
-0.1120642, 0.7039866, -1.422455, 0, 1, 0.8745098, 1,
-0.1084295, 0.02737029, -1.895527, 0, 1, 0.8784314, 1,
-0.1081833, 1.055908, 1.147202, 0, 1, 0.8862745, 1,
-0.1063347, 1.407431, -0.957138, 0, 1, 0.8901961, 1,
-0.1013885, -0.3744186, -2.046679, 0, 1, 0.8980392, 1,
-0.1000363, 0.6692822, -1.869644, 0, 1, 0.9058824, 1,
-0.09580493, 1.153882, 0.1760575, 0, 1, 0.9098039, 1,
-0.0933293, -0.051019, -3.828098, 0, 1, 0.9176471, 1,
-0.08509042, -0.9379071, -2.964946, 0, 1, 0.9215686, 1,
-0.08308169, 1.219674, -0.8947422, 0, 1, 0.9294118, 1,
-0.08296819, 0.418113, 0.4757611, 0, 1, 0.9333333, 1,
-0.08287469, 0.1656314, -1.353463, 0, 1, 0.9411765, 1,
-0.07941411, 0.2096433, 2.61758, 0, 1, 0.945098, 1,
-0.07723217, 1.016525, 0.3308953, 0, 1, 0.9529412, 1,
-0.07702011, 0.01996398, -0.6562211, 0, 1, 0.9568627, 1,
-0.07004856, -0.05635219, -1.603954, 0, 1, 0.9647059, 1,
-0.06960632, 0.1939582, 0.3178921, 0, 1, 0.9686275, 1,
-0.06772842, -0.9381179, -2.347497, 0, 1, 0.9764706, 1,
-0.0676192, 0.5738398, -0.1358476, 0, 1, 0.9803922, 1,
-0.06660796, 1.248971, -0.264904, 0, 1, 0.9882353, 1,
-0.06549831, 1.675235, 0.5563021, 0, 1, 0.9921569, 1,
-0.06224018, -1.303458, -4.739336, 0, 1, 1, 1,
-0.06218999, 1.117904, -0.1541323, 0, 0.9921569, 1, 1,
-0.06111871, 1.480388, 0.143144, 0, 0.9882353, 1, 1,
-0.05925998, 1.717664, 1.031053, 0, 0.9803922, 1, 1,
-0.05619072, -0.1255354, -1.116765, 0, 0.9764706, 1, 1,
-0.05475173, -0.3819273, -0.6869872, 0, 0.9686275, 1, 1,
-0.05142514, 0.03658636, -0.9328374, 0, 0.9647059, 1, 1,
-0.04842326, -1.416458, -4.289482, 0, 0.9568627, 1, 1,
-0.04534566, 1.004916, 1.041346, 0, 0.9529412, 1, 1,
-0.04488567, 0.351194, 0.158336, 0, 0.945098, 1, 1,
-0.03191107, -0.1522968, -2.73911, 0, 0.9411765, 1, 1,
-0.03041298, -1.304834, -3.298481, 0, 0.9333333, 1, 1,
-0.02888741, -0.03485079, -2.194691, 0, 0.9294118, 1, 1,
-0.02470676, -0.452762, -1.530835, 0, 0.9215686, 1, 1,
-0.02254679, 0.3896607, -0.8088362, 0, 0.9176471, 1, 1,
-0.02152808, -1.140905, -4.393525, 0, 0.9098039, 1, 1,
-0.01235541, 0.9657056, -1.763051, 0, 0.9058824, 1, 1,
-0.01156256, -0.8245438, -2.536369, 0, 0.8980392, 1, 1,
-0.007872773, 0.3299253, 1.094057, 0, 0.8901961, 1, 1,
-0.005672262, -0.02291348, -1.993858, 0, 0.8862745, 1, 1,
-0.003626335, -0.09932714, -2.188386, 0, 0.8784314, 1, 1,
-0.0007270609, -0.4877153, -3.794445, 0, 0.8745098, 1, 1,
0.002195472, 1.016315, -2.495249, 0, 0.8666667, 1, 1,
0.002938916, -0.9157183, 1.750055, 0, 0.8627451, 1, 1,
0.003738312, -0.5910898, 2.063988, 0, 0.854902, 1, 1,
0.007316913, -1.543778, 3.253474, 0, 0.8509804, 1, 1,
0.008115444, -1.548128, 2.670543, 0, 0.8431373, 1, 1,
0.009272444, 1.485854, -1.159851, 0, 0.8392157, 1, 1,
0.01061093, 0.376086, -0.3848086, 0, 0.8313726, 1, 1,
0.01233557, -1.114224, 2.402452, 0, 0.827451, 1, 1,
0.01353724, -0.9734732, 4.528214, 0, 0.8196079, 1, 1,
0.0145, 0.3633752, 0.3084193, 0, 0.8156863, 1, 1,
0.0184027, -0.901771, 3.485924, 0, 0.8078431, 1, 1,
0.02315093, 0.7337863, -2.251091, 0, 0.8039216, 1, 1,
0.02831508, -0.8595916, 5.216544, 0, 0.7960784, 1, 1,
0.03374775, 1.597401, -0.701659, 0, 0.7882353, 1, 1,
0.03625496, 0.04040265, 2.448233, 0, 0.7843137, 1, 1,
0.03629979, 0.161997, 1.893607, 0, 0.7764706, 1, 1,
0.03755114, -1.585438, 4.061853, 0, 0.772549, 1, 1,
0.0395628, 0.4799551, 0.1067954, 0, 0.7647059, 1, 1,
0.04170803, -0.03917544, 1.275862, 0, 0.7607843, 1, 1,
0.04498008, 0.3966058, 0.05377445, 0, 0.7529412, 1, 1,
0.04645903, -0.500945, 2.669371, 0, 0.7490196, 1, 1,
0.04862292, 1.339288, -1.309761, 0, 0.7411765, 1, 1,
0.05041729, 1.172082, 0.974798, 0, 0.7372549, 1, 1,
0.0509365, 0.9480887, -1.561066, 0, 0.7294118, 1, 1,
0.05457561, 1.764081, 0.7773039, 0, 0.7254902, 1, 1,
0.05820835, -0.8494474, 3.589498, 0, 0.7176471, 1, 1,
0.05858, -1.418522, 4.023335, 0, 0.7137255, 1, 1,
0.0657362, 1.050974, 1.046403, 0, 0.7058824, 1, 1,
0.06741987, 0.276283, -0.01629487, 0, 0.6980392, 1, 1,
0.06920961, -1.815122, 3.598591, 0, 0.6941177, 1, 1,
0.07574666, -0.8477513, 3.123495, 0, 0.6862745, 1, 1,
0.07724446, 1.299905, -0.6254267, 0, 0.682353, 1, 1,
0.07799502, -2.129505, 4.133263, 0, 0.6745098, 1, 1,
0.07849078, -1.394968, 3.268157, 0, 0.6705883, 1, 1,
0.08446047, -1.102603, 4.393708, 0, 0.6627451, 1, 1,
0.08460878, -0.2234355, 2.405537, 0, 0.6588235, 1, 1,
0.08708878, 0.6261464, -0.4772565, 0, 0.6509804, 1, 1,
0.08739751, 0.1761017, -1.358425, 0, 0.6470588, 1, 1,
0.08772743, -0.1570939, 3.595944, 0, 0.6392157, 1, 1,
0.09157281, 0.005897516, 1.142815, 0, 0.6352941, 1, 1,
0.1005838, 0.1836906, 0.05838786, 0, 0.627451, 1, 1,
0.108532, 0.6638587, 0.9712487, 0, 0.6235294, 1, 1,
0.1091416, 0.9635462, -0.9548089, 0, 0.6156863, 1, 1,
0.1143749, -0.2923908, 1.814658, 0, 0.6117647, 1, 1,
0.1167766, -1.388986, 3.053035, 0, 0.6039216, 1, 1,
0.1169311, -0.128282, 1.433222, 0, 0.5960785, 1, 1,
0.1224327, 0.9674689, 0.3417278, 0, 0.5921569, 1, 1,
0.122565, -0.07284876, 3.973855, 0, 0.5843138, 1, 1,
0.1231339, -0.7711504, 2.386051, 0, 0.5803922, 1, 1,
0.1281019, 0.4372678, 0.01596018, 0, 0.572549, 1, 1,
0.130188, -0.1892006, 3.797487, 0, 0.5686275, 1, 1,
0.1310191, 1.142442, 0.0002068786, 0, 0.5607843, 1, 1,
0.1312184, -1.471952, 3.025393, 0, 0.5568628, 1, 1,
0.1328266, 0.6830174, 1.035951, 0, 0.5490196, 1, 1,
0.1358619, 0.866919, 0.1206861, 0, 0.5450981, 1, 1,
0.1411991, -0.6536775, 2.959536, 0, 0.5372549, 1, 1,
0.1456388, 0.7284095, 1.087577, 0, 0.5333334, 1, 1,
0.1456484, 1.740715, 1.151405, 0, 0.5254902, 1, 1,
0.1464001, 0.1676461, -0.9610062, 0, 0.5215687, 1, 1,
0.1478893, -1.5396, 4.016495, 0, 0.5137255, 1, 1,
0.1487331, 1.301955, 0.8529838, 0, 0.509804, 1, 1,
0.1514993, -0.1577971, 1.289335, 0, 0.5019608, 1, 1,
0.1516077, -0.403599, 2.27712, 0, 0.4941176, 1, 1,
0.1523116, 0.5884181, 0.831698, 0, 0.4901961, 1, 1,
0.1550585, 0.9578988, 0.4864163, 0, 0.4823529, 1, 1,
0.1557122, 0.828867, 1.41209, 0, 0.4784314, 1, 1,
0.1563571, 0.4860701, 0.03114167, 0, 0.4705882, 1, 1,
0.1564251, -0.411956, 2.581785, 0, 0.4666667, 1, 1,
0.1576705, 0.5972729, 1.351101, 0, 0.4588235, 1, 1,
0.1666687, -1.506052, 2.670849, 0, 0.454902, 1, 1,
0.1678519, 1.08602, -0.2712614, 0, 0.4470588, 1, 1,
0.1716504, -0.4040339, 1.935532, 0, 0.4431373, 1, 1,
0.1722385, -2.268404, 2.757045, 0, 0.4352941, 1, 1,
0.1737214, 0.07818124, -0.3237437, 0, 0.4313726, 1, 1,
0.1737688, -1.396446, 4.004661, 0, 0.4235294, 1, 1,
0.178101, 0.06637029, 1.211939, 0, 0.4196078, 1, 1,
0.1803661, -1.424695, 2.567219, 0, 0.4117647, 1, 1,
0.1818263, 0.1294917, 1.897101, 0, 0.4078431, 1, 1,
0.1891546, 0.2403014, 1.175435, 0, 0.4, 1, 1,
0.1957102, -1.332539, 3.946111, 0, 0.3921569, 1, 1,
0.1980908, 1.65728, 2.023897, 0, 0.3882353, 1, 1,
0.2131151, 0.7117068, -1.562673, 0, 0.3803922, 1, 1,
0.2133249, 2.461665, 0.390645, 0, 0.3764706, 1, 1,
0.2169044, -0.5693928, 3.299354, 0, 0.3686275, 1, 1,
0.2190603, -0.8099568, 3.4295, 0, 0.3647059, 1, 1,
0.2210497, 0.6710045, -0.3990956, 0, 0.3568628, 1, 1,
0.2302524, 0.9398916, 0.3582264, 0, 0.3529412, 1, 1,
0.2311878, -0.01365827, 0.4617461, 0, 0.345098, 1, 1,
0.2361204, -2.063269, 3.485784, 0, 0.3411765, 1, 1,
0.2385615, -0.08550223, 0.1236504, 0, 0.3333333, 1, 1,
0.2421548, -0.5427983, 2.830127, 0, 0.3294118, 1, 1,
0.2429284, 0.6250803, 0.6997623, 0, 0.3215686, 1, 1,
0.2455524, -0.6219987, 1.626006, 0, 0.3176471, 1, 1,
0.2570778, 0.916531, -1.07778, 0, 0.3098039, 1, 1,
0.2585702, 1.332444, 1.217812, 0, 0.3058824, 1, 1,
0.261399, -0.9188824, 2.350439, 0, 0.2980392, 1, 1,
0.2631717, 0.9692522, 1.808422, 0, 0.2901961, 1, 1,
0.26726, -1.199161, 2.339174, 0, 0.2862745, 1, 1,
0.274715, -1.096, 3.822751, 0, 0.2784314, 1, 1,
0.2789967, -0.9084372, 0.8842525, 0, 0.2745098, 1, 1,
0.2813408, 0.654552, -0.2428443, 0, 0.2666667, 1, 1,
0.2861088, -1.67997, 3.586474, 0, 0.2627451, 1, 1,
0.2896843, -0.3448428, 1.239805, 0, 0.254902, 1, 1,
0.2903123, 1.694832, -1.355544, 0, 0.2509804, 1, 1,
0.2994345, 0.04395598, 2.270639, 0, 0.2431373, 1, 1,
0.3045352, -0.08756623, 1.454559, 0, 0.2392157, 1, 1,
0.3062215, -0.8490396, 1.703925, 0, 0.2313726, 1, 1,
0.3110721, 0.1224395, 0.9657035, 0, 0.227451, 1, 1,
0.3122848, -1.569662, 3.713827, 0, 0.2196078, 1, 1,
0.3134017, 1.326226, -0.0804907, 0, 0.2156863, 1, 1,
0.3157891, -0.04238677, 2.529107, 0, 0.2078431, 1, 1,
0.3214066, 0.03477618, 2.878399, 0, 0.2039216, 1, 1,
0.3226081, 0.2104101, 1.75101, 0, 0.1960784, 1, 1,
0.322787, 0.5061203, 1.568118, 0, 0.1882353, 1, 1,
0.322987, -0.589415, 2.673563, 0, 0.1843137, 1, 1,
0.3231601, 0.5050745, 2.227214, 0, 0.1764706, 1, 1,
0.3235638, 0.2489339, 1.469396, 0, 0.172549, 1, 1,
0.3251077, -0.8199402, 3.822364, 0, 0.1647059, 1, 1,
0.325335, -0.8791125, 2.808177, 0, 0.1607843, 1, 1,
0.3275405, -0.3283784, 1.018652, 0, 0.1529412, 1, 1,
0.3308655, 1.010235, 0.3990148, 0, 0.1490196, 1, 1,
0.332386, 1.319713, 1.625023, 0, 0.1411765, 1, 1,
0.334688, -0.6521818, 2.918606, 0, 0.1372549, 1, 1,
0.3353502, -0.2576856, 1.862235, 0, 0.1294118, 1, 1,
0.3377358, -1.387649, 4.086946, 0, 0.1254902, 1, 1,
0.341523, -0.3868281, 2.988768, 0, 0.1176471, 1, 1,
0.3479251, 0.7543049, 0.168946, 0, 0.1137255, 1, 1,
0.3487507, -0.6251174, 4.175615, 0, 0.1058824, 1, 1,
0.3503591, -1.203126, 2.675402, 0, 0.09803922, 1, 1,
0.354999, -0.3106469, 2.30635, 0, 0.09411765, 1, 1,
0.3571267, -1.249431, 3.315471, 0, 0.08627451, 1, 1,
0.3590707, 1.348166, 0.01968116, 0, 0.08235294, 1, 1,
0.3591443, -2.596252, 3.47931, 0, 0.07450981, 1, 1,
0.3667439, 0.5370348, 1.503798, 0, 0.07058824, 1, 1,
0.3726772, 0.101348, 0.6576372, 0, 0.0627451, 1, 1,
0.3799278, -0.6014085, 1.720917, 0, 0.05882353, 1, 1,
0.3803436, 1.061512, 0.3547803, 0, 0.05098039, 1, 1,
0.3831193, -0.1280261, 1.185005, 0, 0.04705882, 1, 1,
0.3837847, 0.1949587, 1.032622, 0, 0.03921569, 1, 1,
0.3845612, -0.2681535, 2.812849, 0, 0.03529412, 1, 1,
0.3882665, 0.06162501, 3.663474, 0, 0.02745098, 1, 1,
0.389579, -1.436957, 3.960152, 0, 0.02352941, 1, 1,
0.3908593, -0.7790293, 2.291463, 0, 0.01568628, 1, 1,
0.3917129, -1.345228, 1.952551, 0, 0.01176471, 1, 1,
0.3923046, 0.9800809, -0.7364925, 0, 0.003921569, 1, 1,
0.3942374, -0.7717224, 3.403061, 0.003921569, 0, 1, 1,
0.4043855, -0.4918424, 2.19391, 0.007843138, 0, 1, 1,
0.4052055, 0.3838974, 0.5175433, 0.01568628, 0, 1, 1,
0.4101945, 0.236417, 3.040735, 0.01960784, 0, 1, 1,
0.4130791, -0.08406426, -0.3329155, 0.02745098, 0, 1, 1,
0.4135421, -0.3408659, 2.243052, 0.03137255, 0, 1, 1,
0.4155716, -0.4261837, 1.284283, 0.03921569, 0, 1, 1,
0.4180478, 1.319216, -0.05436877, 0.04313726, 0, 1, 1,
0.4185667, -3.408521, 3.218567, 0.05098039, 0, 1, 1,
0.4221956, -0.6224311, 3.127773, 0.05490196, 0, 1, 1,
0.4251277, -0.2512951, 2.460099, 0.0627451, 0, 1, 1,
0.4265181, 2.351839, -1.555539, 0.06666667, 0, 1, 1,
0.4277166, -0.4005318, 1.300548, 0.07450981, 0, 1, 1,
0.4279916, 0.2947222, 0.8208298, 0.07843138, 0, 1, 1,
0.4281048, 0.7176561, 1.295957, 0.08627451, 0, 1, 1,
0.4424442, -1.336033, 3.934273, 0.09019608, 0, 1, 1,
0.4427465, 0.2599121, 2.606685, 0.09803922, 0, 1, 1,
0.4450176, -2.071238, 2.397542, 0.1058824, 0, 1, 1,
0.4478315, 0.8390379, 1.250545, 0.1098039, 0, 1, 1,
0.4542922, 0.655948, 2.618125, 0.1176471, 0, 1, 1,
0.4581122, -1.291341, 3.40379, 0.1215686, 0, 1, 1,
0.4612185, -1.041876, 3.273058, 0.1294118, 0, 1, 1,
0.4613791, -1.456412, 2.559316, 0.1333333, 0, 1, 1,
0.4623255, -0.3428349, 1.172657, 0.1411765, 0, 1, 1,
0.4637278, 1.350408, 0.4364353, 0.145098, 0, 1, 1,
0.4646883, -1.234004, 2.098904, 0.1529412, 0, 1, 1,
0.4683341, 0.2632935, 1.434409, 0.1568628, 0, 1, 1,
0.4685387, -0.7368734, 2.863948, 0.1647059, 0, 1, 1,
0.4708522, -0.1254933, 2.300032, 0.1686275, 0, 1, 1,
0.4712694, 0.4973482, 0.1483365, 0.1764706, 0, 1, 1,
0.4718654, -0.05976684, 1.136901, 0.1803922, 0, 1, 1,
0.4726216, 1.24119, -0.3993616, 0.1882353, 0, 1, 1,
0.4731745, 0.7801823, 0.5014431, 0.1921569, 0, 1, 1,
0.4764136, 1.270352, 0.7637657, 0.2, 0, 1, 1,
0.4848781, -0.966198, 1.387336, 0.2078431, 0, 1, 1,
0.4852248, 0.7896677, 1.575275, 0.2117647, 0, 1, 1,
0.4997491, -0.1913718, 1.792648, 0.2196078, 0, 1, 1,
0.5020047, 0.6927742, 0.7801292, 0.2235294, 0, 1, 1,
0.5072324, -0.4051277, 3.034304, 0.2313726, 0, 1, 1,
0.507533, -1.038455, 0.5548877, 0.2352941, 0, 1, 1,
0.5078691, -0.5530369, 1.523604, 0.2431373, 0, 1, 1,
0.5092086, 2.369647, 1.412603, 0.2470588, 0, 1, 1,
0.5099981, -0.7042314, 1.912761, 0.254902, 0, 1, 1,
0.5131842, -2.022194, 4.397491, 0.2588235, 0, 1, 1,
0.5201616, -1.80564, 2.414158, 0.2666667, 0, 1, 1,
0.5266679, -0.6655422, 4.570266, 0.2705882, 0, 1, 1,
0.5292724, -2.491575, 3.647898, 0.2784314, 0, 1, 1,
0.5295556, 0.6152897, -0.3050893, 0.282353, 0, 1, 1,
0.530912, 0.07520604, 1.908493, 0.2901961, 0, 1, 1,
0.5332683, 0.5373796, 1.360917, 0.2941177, 0, 1, 1,
0.5397754, -1.023106, 1.997238, 0.3019608, 0, 1, 1,
0.5417243, -1.777952, 2.802566, 0.3098039, 0, 1, 1,
0.5434546, -0.4826823, 2.683652, 0.3137255, 0, 1, 1,
0.548631, -0.5883173, 3.928275, 0.3215686, 0, 1, 1,
0.5486875, 0.1193475, 1.57376, 0.3254902, 0, 1, 1,
0.5498217, 0.45493, 1.53172, 0.3333333, 0, 1, 1,
0.5511873, 1.185381, -0.5600805, 0.3372549, 0, 1, 1,
0.5540015, -1.097956, 3.306595, 0.345098, 0, 1, 1,
0.5552388, -0.3746881, 0.6802337, 0.3490196, 0, 1, 1,
0.5614813, 0.2017844, 0.03524393, 0.3568628, 0, 1, 1,
0.5618776, -0.381164, 1.722935, 0.3607843, 0, 1, 1,
0.5623813, 0.4161558, 1.589225, 0.3686275, 0, 1, 1,
0.5642096, 2.429853, -0.176842, 0.372549, 0, 1, 1,
0.5665876, 0.5391844, 1.474939, 0.3803922, 0, 1, 1,
0.5712404, -0.1716444, 3.141022, 0.3843137, 0, 1, 1,
0.5749147, 0.3314069, 0.9732397, 0.3921569, 0, 1, 1,
0.5759908, 0.9557588, 0.3394413, 0.3960784, 0, 1, 1,
0.5810127, -0.4233429, 2.0004, 0.4039216, 0, 1, 1,
0.5813351, -0.5616881, 2.304158, 0.4117647, 0, 1, 1,
0.5814371, -1.501876, 4.759435, 0.4156863, 0, 1, 1,
0.589769, 0.3811133, 0.1336196, 0.4235294, 0, 1, 1,
0.5927246, 0.3115799, 2.590923, 0.427451, 0, 1, 1,
0.5938754, 1.110914, -1.854235, 0.4352941, 0, 1, 1,
0.5961173, 0.4369293, 0.8625099, 0.4392157, 0, 1, 1,
0.596726, -1.611441, 2.429309, 0.4470588, 0, 1, 1,
0.598212, 0.7680684, 0.4256838, 0.4509804, 0, 1, 1,
0.5986176, 0.3697215, 1.612937, 0.4588235, 0, 1, 1,
0.5994207, 0.2692462, 2.12832, 0.4627451, 0, 1, 1,
0.6012894, -0.368945, 3.86713, 0.4705882, 0, 1, 1,
0.6087228, -0.4305307, 2.679817, 0.4745098, 0, 1, 1,
0.6121575, -0.2945378, 1.096808, 0.4823529, 0, 1, 1,
0.6132133, 1.326758, 0.1341859, 0.4862745, 0, 1, 1,
0.6155692, -0.5204351, 3.297043, 0.4941176, 0, 1, 1,
0.6160058, 1.70421, 1.221621, 0.5019608, 0, 1, 1,
0.6169686, 1.159045, -0.257887, 0.5058824, 0, 1, 1,
0.619109, -1.748691, 2.002934, 0.5137255, 0, 1, 1,
0.6193512, 2.030999, 2.163613, 0.5176471, 0, 1, 1,
0.6196926, -0.1455247, 1.985022, 0.5254902, 0, 1, 1,
0.6206804, 0.9492831, 1.711413, 0.5294118, 0, 1, 1,
0.6268955, -0.3594583, 3.556965, 0.5372549, 0, 1, 1,
0.6288944, 0.07232811, 3.755439, 0.5411765, 0, 1, 1,
0.6305305, 0.9646354, -0.02702205, 0.5490196, 0, 1, 1,
0.6307983, 0.5549224, -1.289463, 0.5529412, 0, 1, 1,
0.6315857, -2.256145, 3.710077, 0.5607843, 0, 1, 1,
0.6329803, 0.9720962, 0.150406, 0.5647059, 0, 1, 1,
0.6340482, -1.917175, 0.5428292, 0.572549, 0, 1, 1,
0.6387522, -0.4129208, 0.2150867, 0.5764706, 0, 1, 1,
0.6392106, -0.4108033, 1.556586, 0.5843138, 0, 1, 1,
0.6431088, 2.276722, 0.7350929, 0.5882353, 0, 1, 1,
0.6452826, 1.024417, 0.32313, 0.5960785, 0, 1, 1,
0.6455313, 1.515361, 0.7510422, 0.6039216, 0, 1, 1,
0.6468826, -0.09947973, 0.5600698, 0.6078432, 0, 1, 1,
0.6540534, 0.9726462, 1.146459, 0.6156863, 0, 1, 1,
0.6600537, 1.885898, -0.640535, 0.6196079, 0, 1, 1,
0.6601558, -0.6189663, 4.275992, 0.627451, 0, 1, 1,
0.6602532, -0.2324145, 2.049738, 0.6313726, 0, 1, 1,
0.6607808, -0.8996844, 3.20969, 0.6392157, 0, 1, 1,
0.6651559, 1.225211, 0.5632057, 0.6431373, 0, 1, 1,
0.6656016, -0.1649556, 0.8455466, 0.6509804, 0, 1, 1,
0.6707545, 0.8510869, 3.64434, 0.654902, 0, 1, 1,
0.6722867, 1.086383, 1.09561, 0.6627451, 0, 1, 1,
0.6795815, 0.1004383, 2.236874, 0.6666667, 0, 1, 1,
0.680457, 0.7772148, 1.086262, 0.6745098, 0, 1, 1,
0.6839575, -0.1134742, 2.309534, 0.6784314, 0, 1, 1,
0.687812, 0.5812562, 0.7522429, 0.6862745, 0, 1, 1,
0.6888794, 0.7459075, -0.1760797, 0.6901961, 0, 1, 1,
0.6892919, -0.2262093, 2.275521, 0.6980392, 0, 1, 1,
0.6936069, -2.057888, 5.727297, 0.7058824, 0, 1, 1,
0.6974705, 0.9633166, -0.4536508, 0.7098039, 0, 1, 1,
0.6976086, 1.455388, -0.7025245, 0.7176471, 0, 1, 1,
0.7091944, -0.2422169, 2.96953, 0.7215686, 0, 1, 1,
0.7323554, 1.185546, 0.9654813, 0.7294118, 0, 1, 1,
0.7356753, 1.652267, -0.6352006, 0.7333333, 0, 1, 1,
0.7429377, -2.120431, 1.972591, 0.7411765, 0, 1, 1,
0.7461773, -0.4575914, 0.8828368, 0.7450981, 0, 1, 1,
0.7481477, -0.5099725, 2.767457, 0.7529412, 0, 1, 1,
0.7504063, 1.605711, 1.484452, 0.7568628, 0, 1, 1,
0.752861, 1.769741, 1.418644, 0.7647059, 0, 1, 1,
0.7540783, 1.629771, 1.297503, 0.7686275, 0, 1, 1,
0.7558196, 1.264361, 1.417105, 0.7764706, 0, 1, 1,
0.7576976, -0.9377573, 2.193392, 0.7803922, 0, 1, 1,
0.7617421, -0.6443729, 2.835677, 0.7882353, 0, 1, 1,
0.7618579, -0.9094449, 1.082021, 0.7921569, 0, 1, 1,
0.7675084, -0.1299844, 1.831942, 0.8, 0, 1, 1,
0.7680954, 0.6065514, 1.287235, 0.8078431, 0, 1, 1,
0.7754922, 0.9431059, -0.2399267, 0.8117647, 0, 1, 1,
0.7785634, 0.7582048, 2.746688, 0.8196079, 0, 1, 1,
0.7798534, -0.4626469, 1.771922, 0.8235294, 0, 1, 1,
0.7841283, -0.9150088, 2.6802, 0.8313726, 0, 1, 1,
0.7843284, -0.3734648, -0.03184398, 0.8352941, 0, 1, 1,
0.7881306, -0.2103507, 1.08085, 0.8431373, 0, 1, 1,
0.7887415, -0.2316549, 0.2002791, 0.8470588, 0, 1, 1,
0.7909388, -0.4357683, 3.440089, 0.854902, 0, 1, 1,
0.7921867, -1.455681, 3.912827, 0.8588235, 0, 1, 1,
0.7927696, -0.2757517, 2.16766, 0.8666667, 0, 1, 1,
0.7937707, 0.5939699, -1.426154, 0.8705882, 0, 1, 1,
0.7981316, 0.3192334, 2.430502, 0.8784314, 0, 1, 1,
0.8070363, 0.04387095, 0.824004, 0.8823529, 0, 1, 1,
0.8125005, -2.394951, 2.819952, 0.8901961, 0, 1, 1,
0.8139109, -1.930191, 3.579412, 0.8941177, 0, 1, 1,
0.8165659, 1.15818, 0.1986976, 0.9019608, 0, 1, 1,
0.8179776, 0.1715519, 1.534447, 0.9098039, 0, 1, 1,
0.818052, -0.2590621, 1.63411, 0.9137255, 0, 1, 1,
0.8187872, 2.30923, 0.8229834, 0.9215686, 0, 1, 1,
0.8191509, -0.1571879, 1.644572, 0.9254902, 0, 1, 1,
0.8204445, -0.3622818, 2.564228, 0.9333333, 0, 1, 1,
0.8234906, 0.0933406, 1.712625, 0.9372549, 0, 1, 1,
0.8286641, 1.17262, -0.3241661, 0.945098, 0, 1, 1,
0.8348001, -0.35079, 2.537385, 0.9490196, 0, 1, 1,
0.8551354, 0.008374907, -0.1980244, 0.9568627, 0, 1, 1,
0.8581653, -1.869703, 3.053691, 0.9607843, 0, 1, 1,
0.8587685, 1.244991, 2.067893, 0.9686275, 0, 1, 1,
0.8611996, -0.9891003, 3.996317, 0.972549, 0, 1, 1,
0.8643374, 1.16009, 0.004634386, 0.9803922, 0, 1, 1,
0.8730081, -1.358809, 0.1991233, 0.9843137, 0, 1, 1,
0.875092, 0.5448635, 0.0934986, 0.9921569, 0, 1, 1,
0.8757698, 0.2337642, 1.688225, 0.9960784, 0, 1, 1,
0.8778079, 0.9025283, 1.623212, 1, 0, 0.9960784, 1,
0.8794921, -0.3933412, 3.557315, 1, 0, 0.9882353, 1,
0.8797822, -0.7142603, 3.14411, 1, 0, 0.9843137, 1,
0.8848406, -2.108735, 3.851064, 1, 0, 0.9764706, 1,
0.8916627, 0.4910291, 3.666251, 1, 0, 0.972549, 1,
0.8939749, -0.6688622, 2.812361, 1, 0, 0.9647059, 1,
0.894285, -0.9668233, 1.464076, 1, 0, 0.9607843, 1,
0.897185, 0.1493579, 3.086198, 1, 0, 0.9529412, 1,
0.8995057, 1.780489, 0.1239702, 1, 0, 0.9490196, 1,
0.9048638, 1.542461, -0.5494775, 1, 0, 0.9411765, 1,
0.912071, 0.2178696, 2.023903, 1, 0, 0.9372549, 1,
0.9193451, 1.768249, -0.2809904, 1, 0, 0.9294118, 1,
0.9262182, 0.2128926, 0.9857275, 1, 0, 0.9254902, 1,
0.9301721, -0.2229262, 1.893641, 1, 0, 0.9176471, 1,
0.9304146, -0.006879085, 2.457982, 1, 0, 0.9137255, 1,
0.9381169, 0.3739142, -0.371396, 1, 0, 0.9058824, 1,
0.9388059, -0.1980523, 2.572334, 1, 0, 0.9019608, 1,
0.9426927, 0.2744883, 0.2724153, 1, 0, 0.8941177, 1,
0.944418, -1.558138, 1.149037, 1, 0, 0.8862745, 1,
0.9454018, 0.5644648, 0.4465862, 1, 0, 0.8823529, 1,
0.9554952, 0.01608455, 0.9523879, 1, 0, 0.8745098, 1,
0.9561243, 0.6572621, -0.1637257, 1, 0, 0.8705882, 1,
0.9562172, 0.07892926, 2.833932, 1, 0, 0.8627451, 1,
0.9588557, -1.17933, 3.211264, 1, 0, 0.8588235, 1,
0.9603725, 0.4062968, 1.665987, 1, 0, 0.8509804, 1,
0.9759176, 0.3001655, 3.108939, 1, 0, 0.8470588, 1,
0.9764987, 0.8890073, 2.714998, 1, 0, 0.8392157, 1,
0.9871593, 0.2756034, -0.1014038, 1, 0, 0.8352941, 1,
0.9880884, -0.5226912, 0.3620649, 1, 0, 0.827451, 1,
0.9900789, 0.8256642, -1.495044, 1, 0, 0.8235294, 1,
0.9941487, -1.086439, 2.405978, 1, 0, 0.8156863, 1,
0.9948924, -2.007065, 2.852945, 1, 0, 0.8117647, 1,
1.000934, 0.8108729, 0.6330748, 1, 0, 0.8039216, 1,
1.003267, 0.6819708, -0.4083548, 1, 0, 0.7960784, 1,
1.003298, -1.263912, 2.088228, 1, 0, 0.7921569, 1,
1.006546, -2.062582, 3.23245, 1, 0, 0.7843137, 1,
1.014083, -1.516392, 2.84744, 1, 0, 0.7803922, 1,
1.016787, 0.7776941, -0.1615243, 1, 0, 0.772549, 1,
1.02408, -1.522282, 1.798917, 1, 0, 0.7686275, 1,
1.034182, 0.03242031, 1.304687, 1, 0, 0.7607843, 1,
1.04043, -0.8872575, 1.837052, 1, 0, 0.7568628, 1,
1.042991, -0.3729987, 2.128822, 1, 0, 0.7490196, 1,
1.046062, 1.558895, 1.972938, 1, 0, 0.7450981, 1,
1.057407, -1.524144, 2.3789, 1, 0, 0.7372549, 1,
1.060884, -0.7939737, 2.692066, 1, 0, 0.7333333, 1,
1.065198, 0.8909691, 0.4926343, 1, 0, 0.7254902, 1,
1.066843, 0.02454432, 1.25374, 1, 0, 0.7215686, 1,
1.070272, 0.0781403, 0.04818005, 1, 0, 0.7137255, 1,
1.074717, -0.1089378, 0.4609268, 1, 0, 0.7098039, 1,
1.078765, 0.5875511, 0.1446139, 1, 0, 0.7019608, 1,
1.080067, -0.8246309, 3.25325, 1, 0, 0.6941177, 1,
1.083575, 0.1174343, 0.4717821, 1, 0, 0.6901961, 1,
1.084493, 0.8878364, 1.438266, 1, 0, 0.682353, 1,
1.090795, 0.05762906, 1.286763, 1, 0, 0.6784314, 1,
1.090913, -1.284225, 1.912837, 1, 0, 0.6705883, 1,
1.093752, -1.251404, 3.45299, 1, 0, 0.6666667, 1,
1.098237, 0.9414162, 1.844246, 1, 0, 0.6588235, 1,
1.116719, 1.123532, 0.651162, 1, 0, 0.654902, 1,
1.126018, 0.9758066, 0.9449194, 1, 0, 0.6470588, 1,
1.129917, 1.63734, 0.5907596, 1, 0, 0.6431373, 1,
1.132932, 0.1405661, 0.4585389, 1, 0, 0.6352941, 1,
1.150381, -1.053223, 3.550689, 1, 0, 0.6313726, 1,
1.153903, 0.3083588, -0.2812877, 1, 0, 0.6235294, 1,
1.15584, 0.05150447, 2.262133, 1, 0, 0.6196079, 1,
1.158928, 0.3517726, 1.315868, 1, 0, 0.6117647, 1,
1.161464, -0.2441756, 2.690285, 1, 0, 0.6078432, 1,
1.163766, 0.1344025, 2.036137, 1, 0, 0.6, 1,
1.168886, -0.7056799, 1.88795, 1, 0, 0.5921569, 1,
1.172916, -0.1581353, 1.188576, 1, 0, 0.5882353, 1,
1.173099, -1.305334, 2.493028, 1, 0, 0.5803922, 1,
1.174147, -0.1532178, 3.06904, 1, 0, 0.5764706, 1,
1.194841, 0.08470874, 2.313743, 1, 0, 0.5686275, 1,
1.197858, -0.05459894, 1.017217, 1, 0, 0.5647059, 1,
1.198609, 0.9419095, -0.3799678, 1, 0, 0.5568628, 1,
1.202196, -1.726941, 2.604437, 1, 0, 0.5529412, 1,
1.208532, 0.2167647, 3.447896, 1, 0, 0.5450981, 1,
1.212269, 0.1446115, 0.4938368, 1, 0, 0.5411765, 1,
1.214779, 1.320539, 1.138927, 1, 0, 0.5333334, 1,
1.215548, -0.2374859, 1.45342, 1, 0, 0.5294118, 1,
1.222011, -0.3579989, 1.895937, 1, 0, 0.5215687, 1,
1.238948, 1.628977, -0.03610384, 1, 0, 0.5176471, 1,
1.254625, 2.615729, 0.9971169, 1, 0, 0.509804, 1,
1.255743, -0.4585058, 3.07941, 1, 0, 0.5058824, 1,
1.269451, 1.230688, -0.3181432, 1, 0, 0.4980392, 1,
1.286416, -0.736617, 2.219927, 1, 0, 0.4901961, 1,
1.29124, -1.16575, 3.948925, 1, 0, 0.4862745, 1,
1.294659, -0.8531685, 3.595526, 1, 0, 0.4784314, 1,
1.305621, 0.3485679, 2.349146, 1, 0, 0.4745098, 1,
1.314156, 0.1185079, 1.998152, 1, 0, 0.4666667, 1,
1.318, -0.2402613, -0.2333839, 1, 0, 0.4627451, 1,
1.333978, -0.8316552, 2.839782, 1, 0, 0.454902, 1,
1.338055, -2.040832, 1.910683, 1, 0, 0.4509804, 1,
1.349265, -1.67368, 2.863855, 1, 0, 0.4431373, 1,
1.354171, 0.2347241, 1.007706, 1, 0, 0.4392157, 1,
1.357096, -0.001587068, 2.256026, 1, 0, 0.4313726, 1,
1.391508, -0.390683, 2.308801, 1, 0, 0.427451, 1,
1.397171, -0.6981847, 1.209327, 1, 0, 0.4196078, 1,
1.413146, -0.08960608, 0.8279887, 1, 0, 0.4156863, 1,
1.422552, 0.6835211, 1.371712, 1, 0, 0.4078431, 1,
1.423082, 0.9105864, -0.4548883, 1, 0, 0.4039216, 1,
1.431726, -1.01238, 1.872958, 1, 0, 0.3960784, 1,
1.433672, 0.6843897, 2.559502, 1, 0, 0.3882353, 1,
1.452132, 0.9886126, 1.579954, 1, 0, 0.3843137, 1,
1.456371, 0.4015508, 0.0669369, 1, 0, 0.3764706, 1,
1.461699, 0.7961041, 1.224973, 1, 0, 0.372549, 1,
1.466331, -1.076449, 1.177808, 1, 0, 0.3647059, 1,
1.47906, -0.2522083, 2.720969, 1, 0, 0.3607843, 1,
1.487048, -0.8950951, 2.529389, 1, 0, 0.3529412, 1,
1.499399, 1.03005, 2.546757, 1, 0, 0.3490196, 1,
1.50598, -1.091672, 1.290106, 1, 0, 0.3411765, 1,
1.506115, -0.5098419, 2.658935, 1, 0, 0.3372549, 1,
1.509692, 0.6031635, 0.1241217, 1, 0, 0.3294118, 1,
1.511213, -1.1805, 1.133205, 1, 0, 0.3254902, 1,
1.523314, 1.318806, -0.8058692, 1, 0, 0.3176471, 1,
1.524578, 0.6863111, 2.060201, 1, 0, 0.3137255, 1,
1.527983, 0.2400378, 1.890553, 1, 0, 0.3058824, 1,
1.533821, -0.02019416, 1.299754, 1, 0, 0.2980392, 1,
1.533859, -1.215459, 1.878585, 1, 0, 0.2941177, 1,
1.537805, 0.1620505, 0.8805864, 1, 0, 0.2862745, 1,
1.539242, 0.438053, 0.8030477, 1, 0, 0.282353, 1,
1.544234, -0.7716318, 2.257504, 1, 0, 0.2745098, 1,
1.592336, -0.6250642, 1.222884, 1, 0, 0.2705882, 1,
1.598047, -0.2891022, 3.499774, 1, 0, 0.2627451, 1,
1.610442, -1.093246, 2.471819, 1, 0, 0.2588235, 1,
1.622747, 1.514145, 0.7521209, 1, 0, 0.2509804, 1,
1.643034, -0.01020137, 0.9974352, 1, 0, 0.2470588, 1,
1.656498, -2.243034, 2.344686, 1, 0, 0.2392157, 1,
1.656985, -0.3997784, -0.4148579, 1, 0, 0.2352941, 1,
1.6859, 0.07155571, 1.180264, 1, 0, 0.227451, 1,
1.703591, -0.03210524, 1.2547, 1, 0, 0.2235294, 1,
1.709765, 0.2185934, 1.298352, 1, 0, 0.2156863, 1,
1.7222, -1.930519, 1.468094, 1, 0, 0.2117647, 1,
1.726086, -0.2782536, 1.183251, 1, 0, 0.2039216, 1,
1.732466, 0.5894499, 2.170243, 1, 0, 0.1960784, 1,
1.736439, 0.5492764, 2.350801, 1, 0, 0.1921569, 1,
1.753868, -0.7531894, 1.695228, 1, 0, 0.1843137, 1,
1.789992, 0.1904498, 1.464995, 1, 0, 0.1803922, 1,
1.793161, 1.017298, 0.3252334, 1, 0, 0.172549, 1,
1.800605, -0.4227061, 2.569855, 1, 0, 0.1686275, 1,
1.821972, -0.5201649, 1.925111, 1, 0, 0.1607843, 1,
1.835901, 1.178094, 0.09539516, 1, 0, 0.1568628, 1,
1.85844, 0.2806623, 1.990841, 1, 0, 0.1490196, 1,
1.878744, -0.3049974, 1.697621, 1, 0, 0.145098, 1,
1.90894, 0.1037969, 0.5886559, 1, 0, 0.1372549, 1,
1.921457, -1.309659, 1.02914, 1, 0, 0.1333333, 1,
1.927456, 1.021713, 1.402252, 1, 0, 0.1254902, 1,
1.944356, 0.2586883, 0.7567214, 1, 0, 0.1215686, 1,
1.969509, 0.4596114, 2.190063, 1, 0, 0.1137255, 1,
1.978557, -1.991356, 1.730938, 1, 0, 0.1098039, 1,
2.033779, -0.9058204, 1.451415, 1, 0, 0.1019608, 1,
2.037014, 0.1042141, -0.3978357, 1, 0, 0.09411765, 1,
2.066884, -1.212063, 3.163874, 1, 0, 0.09019608, 1,
2.114559, -1.5833, 1.294895, 1, 0, 0.08235294, 1,
2.140184, 0.7736583, 1.659456, 1, 0, 0.07843138, 1,
2.165477, -0.3448278, 1.420882, 1, 0, 0.07058824, 1,
2.190558, 0.3726898, 2.767892, 1, 0, 0.06666667, 1,
2.242665, -0.07634066, 0.8181843, 1, 0, 0.05882353, 1,
2.265404, -0.5053712, 1.570042, 1, 0, 0.05490196, 1,
2.32684, 1.295859, 1.442065, 1, 0, 0.04705882, 1,
2.368755, -0.2746248, 1.887272, 1, 0, 0.04313726, 1,
2.374316, -0.5527412, 2.30941, 1, 0, 0.03529412, 1,
2.583389, 1.066641, 3.24645, 1, 0, 0.03137255, 1,
2.63876, 1.059245, 1.971795, 1, 0, 0.02352941, 1,
2.639889, 0.190284, 0.6106772, 1, 0, 0.01960784, 1,
2.654592, 1.194953, -0.8565606, 1, 0, 0.01176471, 1,
2.781921, 0.2830266, 2.471856, 1, 0, 0.007843138, 1
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
-0.08721721, -4.514169, -7.299174, 0, -0.5, 0.5, 0.5,
-0.08721721, -4.514169, -7.299174, 1, -0.5, 0.5, 0.5,
-0.08721721, -4.514169, -7.299174, 1, 1.5, 0.5, 0.5,
-0.08721721, -4.514169, -7.299174, 0, 1.5, 0.5, 0.5
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
-3.928993, -0.1470209, -7.299174, 0, -0.5, 0.5, 0.5,
-3.928993, -0.1470209, -7.299174, 1, -0.5, 0.5, 0.5,
-3.928993, -0.1470209, -7.299174, 1, 1.5, 0.5, 0.5,
-3.928993, -0.1470209, -7.299174, 0, 1.5, 0.5, 0.5
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
-3.928993, -4.514169, 0.1580493, 0, -0.5, 0.5, 0.5,
-3.928993, -4.514169, 0.1580493, 1, -0.5, 0.5, 0.5,
-3.928993, -4.514169, 0.1580493, 1, 1.5, 0.5, 0.5,
-3.928993, -4.514169, 0.1580493, 0, 1.5, 0.5, 0.5
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
-2, -3.506366, -5.578276,
2, -3.506366, -5.578276,
-2, -3.506366, -5.578276,
-2, -3.674333, -5.865092,
-1, -3.506366, -5.578276,
-1, -3.674333, -5.865092,
0, -3.506366, -5.578276,
0, -3.674333, -5.865092,
1, -3.506366, -5.578276,
1, -3.674333, -5.865092,
2, -3.506366, -5.578276,
2, -3.674333, -5.865092
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
-2, -4.010268, -6.438725, 0, -0.5, 0.5, 0.5,
-2, -4.010268, -6.438725, 1, -0.5, 0.5, 0.5,
-2, -4.010268, -6.438725, 1, 1.5, 0.5, 0.5,
-2, -4.010268, -6.438725, 0, 1.5, 0.5, 0.5,
-1, -4.010268, -6.438725, 0, -0.5, 0.5, 0.5,
-1, -4.010268, -6.438725, 1, -0.5, 0.5, 0.5,
-1, -4.010268, -6.438725, 1, 1.5, 0.5, 0.5,
-1, -4.010268, -6.438725, 0, 1.5, 0.5, 0.5,
0, -4.010268, -6.438725, 0, -0.5, 0.5, 0.5,
0, -4.010268, -6.438725, 1, -0.5, 0.5, 0.5,
0, -4.010268, -6.438725, 1, 1.5, 0.5, 0.5,
0, -4.010268, -6.438725, 0, 1.5, 0.5, 0.5,
1, -4.010268, -6.438725, 0, -0.5, 0.5, 0.5,
1, -4.010268, -6.438725, 1, -0.5, 0.5, 0.5,
1, -4.010268, -6.438725, 1, 1.5, 0.5, 0.5,
1, -4.010268, -6.438725, 0, 1.5, 0.5, 0.5,
2, -4.010268, -6.438725, 0, -0.5, 0.5, 0.5,
2, -4.010268, -6.438725, 1, -0.5, 0.5, 0.5,
2, -4.010268, -6.438725, 1, 1.5, 0.5, 0.5,
2, -4.010268, -6.438725, 0, 1.5, 0.5, 0.5
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
-3.042429, -3, -5.578276,
-3.042429, 3, -5.578276,
-3.042429, -3, -5.578276,
-3.19019, -3, -5.865092,
-3.042429, -2, -5.578276,
-3.19019, -2, -5.865092,
-3.042429, -1, -5.578276,
-3.19019, -1, -5.865092,
-3.042429, 0, -5.578276,
-3.19019, 0, -5.865092,
-3.042429, 1, -5.578276,
-3.19019, 1, -5.865092,
-3.042429, 2, -5.578276,
-3.19019, 2, -5.865092,
-3.042429, 3, -5.578276,
-3.19019, 3, -5.865092
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
-3.485711, -3, -6.438725, 0, -0.5, 0.5, 0.5,
-3.485711, -3, -6.438725, 1, -0.5, 0.5, 0.5,
-3.485711, -3, -6.438725, 1, 1.5, 0.5, 0.5,
-3.485711, -3, -6.438725, 0, 1.5, 0.5, 0.5,
-3.485711, -2, -6.438725, 0, -0.5, 0.5, 0.5,
-3.485711, -2, -6.438725, 1, -0.5, 0.5, 0.5,
-3.485711, -2, -6.438725, 1, 1.5, 0.5, 0.5,
-3.485711, -2, -6.438725, 0, 1.5, 0.5, 0.5,
-3.485711, -1, -6.438725, 0, -0.5, 0.5, 0.5,
-3.485711, -1, -6.438725, 1, -0.5, 0.5, 0.5,
-3.485711, -1, -6.438725, 1, 1.5, 0.5, 0.5,
-3.485711, -1, -6.438725, 0, 1.5, 0.5, 0.5,
-3.485711, 0, -6.438725, 0, -0.5, 0.5, 0.5,
-3.485711, 0, -6.438725, 1, -0.5, 0.5, 0.5,
-3.485711, 0, -6.438725, 1, 1.5, 0.5, 0.5,
-3.485711, 0, -6.438725, 0, 1.5, 0.5, 0.5,
-3.485711, 1, -6.438725, 0, -0.5, 0.5, 0.5,
-3.485711, 1, -6.438725, 1, -0.5, 0.5, 0.5,
-3.485711, 1, -6.438725, 1, 1.5, 0.5, 0.5,
-3.485711, 1, -6.438725, 0, 1.5, 0.5, 0.5,
-3.485711, 2, -6.438725, 0, -0.5, 0.5, 0.5,
-3.485711, 2, -6.438725, 1, -0.5, 0.5, 0.5,
-3.485711, 2, -6.438725, 1, 1.5, 0.5, 0.5,
-3.485711, 2, -6.438725, 0, 1.5, 0.5, 0.5,
-3.485711, 3, -6.438725, 0, -0.5, 0.5, 0.5,
-3.485711, 3, -6.438725, 1, -0.5, 0.5, 0.5,
-3.485711, 3, -6.438725, 1, 1.5, 0.5, 0.5,
-3.485711, 3, -6.438725, 0, 1.5, 0.5, 0.5
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
-3.042429, -3.506366, -4,
-3.042429, -3.506366, 4,
-3.042429, -3.506366, -4,
-3.19019, -3.674333, -4,
-3.042429, -3.506366, -2,
-3.19019, -3.674333, -2,
-3.042429, -3.506366, 0,
-3.19019, -3.674333, 0,
-3.042429, -3.506366, 2,
-3.19019, -3.674333, 2,
-3.042429, -3.506366, 4,
-3.19019, -3.674333, 4
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
-3.485711, -4.010268, -4, 0, -0.5, 0.5, 0.5,
-3.485711, -4.010268, -4, 1, -0.5, 0.5, 0.5,
-3.485711, -4.010268, -4, 1, 1.5, 0.5, 0.5,
-3.485711, -4.010268, -4, 0, 1.5, 0.5, 0.5,
-3.485711, -4.010268, -2, 0, -0.5, 0.5, 0.5,
-3.485711, -4.010268, -2, 1, -0.5, 0.5, 0.5,
-3.485711, -4.010268, -2, 1, 1.5, 0.5, 0.5,
-3.485711, -4.010268, -2, 0, 1.5, 0.5, 0.5,
-3.485711, -4.010268, 0, 0, -0.5, 0.5, 0.5,
-3.485711, -4.010268, 0, 1, -0.5, 0.5, 0.5,
-3.485711, -4.010268, 0, 1, 1.5, 0.5, 0.5,
-3.485711, -4.010268, 0, 0, 1.5, 0.5, 0.5,
-3.485711, -4.010268, 2, 0, -0.5, 0.5, 0.5,
-3.485711, -4.010268, 2, 1, -0.5, 0.5, 0.5,
-3.485711, -4.010268, 2, 1, 1.5, 0.5, 0.5,
-3.485711, -4.010268, 2, 0, 1.5, 0.5, 0.5,
-3.485711, -4.010268, 4, 0, -0.5, 0.5, 0.5,
-3.485711, -4.010268, 4, 1, -0.5, 0.5, 0.5,
-3.485711, -4.010268, 4, 1, 1.5, 0.5, 0.5,
-3.485711, -4.010268, 4, 0, 1.5, 0.5, 0.5
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
-3.042429, -3.506366, -5.578276,
-3.042429, 3.212324, -5.578276,
-3.042429, -3.506366, 5.894375,
-3.042429, 3.212324, 5.894375,
-3.042429, -3.506366, -5.578276,
-3.042429, -3.506366, 5.894375,
-3.042429, 3.212324, -5.578276,
-3.042429, 3.212324, 5.894375,
-3.042429, -3.506366, -5.578276,
2.867995, -3.506366, -5.578276,
-3.042429, -3.506366, 5.894375,
2.867995, -3.506366, 5.894375,
-3.042429, 3.212324, -5.578276,
2.867995, 3.212324, -5.578276,
-3.042429, 3.212324, 5.894375,
2.867995, 3.212324, 5.894375,
2.867995, -3.506366, -5.578276,
2.867995, 3.212324, -5.578276,
2.867995, -3.506366, 5.894375,
2.867995, 3.212324, 5.894375,
2.867995, -3.506366, -5.578276,
2.867995, -3.506366, 5.894375,
2.867995, 3.212324, -5.578276,
2.867995, 3.212324, 5.894375
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
var radius = 7.769291;
var distance = 34.56646;
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
mvMatrix.translate( 0.08721721, 0.1470209, -0.1580493 );
mvMatrix.scale( 1.42127, 1.25029, 0.7322031 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.56646);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
rhymed<-read.table("rhymed.xyz")
```

```
## Error in read.table("rhymed.xyz"): no lines available in input
```

```r
x<-rhymed$V2
```

```
## Error in eval(expr, envir, enclos): object 'rhymed' not found
```

```r
y<-rhymed$V3
```

```
## Error in eval(expr, envir, enclos): object 'rhymed' not found
```

```r
z<-rhymed$V4
```

```
## Error in eval(expr, envir, enclos): object 'rhymed' not found
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
-2.956355, 1.285177, -3.215614, 0, 0, 1, 1, 1,
-2.831038, 0.5747681, -1.775643, 1, 0, 0, 1, 1,
-2.788767, 0.001164949, -1.232839, 1, 0, 0, 1, 1,
-2.72842, -1.52946, -1.600626, 1, 0, 0, 1, 1,
-2.614296, -1.126255, -1.179446, 1, 0, 0, 1, 1,
-2.584466, -0.1773367, -3.525095, 1, 0, 0, 1, 1,
-2.544265, 0.4249831, -1.141962, 0, 0, 0, 1, 1,
-2.531664, -0.4306074, -2.600115, 0, 0, 0, 1, 1,
-2.521016, -1.153917, -1.258993, 0, 0, 0, 1, 1,
-2.476541, -0.6269066, -4.505875, 0, 0, 0, 1, 1,
-2.471826, -0.3850472, -2.145674, 0, 0, 0, 1, 1,
-2.468477, -2.261892, -1.225703, 0, 0, 0, 1, 1,
-2.333799, 0.8770146, -0.7558503, 0, 0, 0, 1, 1,
-2.312087, -0.4486234, -3.151661, 1, 1, 1, 1, 1,
-2.279741, 0.03461178, -2.228309, 1, 1, 1, 1, 1,
-2.251693, 2.481294, -0.8098718, 1, 1, 1, 1, 1,
-2.153236, -0.2663145, -1.639234, 1, 1, 1, 1, 1,
-2.13999, 0.8496635, -0.569909, 1, 1, 1, 1, 1,
-2.134539, -0.6583453, -1.955224, 1, 1, 1, 1, 1,
-2.127194, -0.6440681, -1.092743, 1, 1, 1, 1, 1,
-2.094539, 0.6160759, -1.296076, 1, 1, 1, 1, 1,
-2.05233, -2.232705, -2.525838, 1, 1, 1, 1, 1,
-2.03334, 1.311586, -0.8391506, 1, 1, 1, 1, 1,
-2.030369, 2.174544, 0.3202051, 1, 1, 1, 1, 1,
-2.024194, -0.6733971, -3.193123, 1, 1, 1, 1, 1,
-2.012023, -0.5078782, -1.674827, 1, 1, 1, 1, 1,
-1.972798, 1.837182, -0.791518, 1, 1, 1, 1, 1,
-1.918024, 0.1020244, -2.315189, 1, 1, 1, 1, 1,
-1.871077, -1.447886, -1.866077, 0, 0, 1, 1, 1,
-1.871024, -1.366311, -0.9172912, 1, 0, 0, 1, 1,
-1.848741, -0.06695569, -1.831621, 1, 0, 0, 1, 1,
-1.844962, 1.155805, 0.004059055, 1, 0, 0, 1, 1,
-1.841568, 0.1512687, -1.112491, 1, 0, 0, 1, 1,
-1.841551, -0.2701159, -1.093136, 1, 0, 0, 1, 1,
-1.840938, -0.3078351, -1.297036, 0, 0, 0, 1, 1,
-1.829453, 0.1573465, -2.943115, 0, 0, 0, 1, 1,
-1.829178, -0.1840798, -1.635955, 0, 0, 0, 1, 1,
-1.822181, -0.2304976, -1.609284, 0, 0, 0, 1, 1,
-1.813232, -0.4509908, -1.554405, 0, 0, 0, 1, 1,
-1.799286, -0.7836567, -2.558514, 0, 0, 0, 1, 1,
-1.790486, -1.780929, -2.710893, 0, 0, 0, 1, 1,
-1.768493, 0.4749432, -1.869532, 1, 1, 1, 1, 1,
-1.760836, 1.833027, -1.020951, 1, 1, 1, 1, 1,
-1.755062, 0.2454811, -0.5552164, 1, 1, 1, 1, 1,
-1.730947, 1.174877, -0.1858793, 1, 1, 1, 1, 1,
-1.726481, -0.7655622, -3.521565, 1, 1, 1, 1, 1,
-1.716412, 2.036255, -1.104292, 1, 1, 1, 1, 1,
-1.710581, -1.385182, -2.656402, 1, 1, 1, 1, 1,
-1.708632, 1.310826, 1.046327, 1, 1, 1, 1, 1,
-1.706793, 0.618394, -0.4545132, 1, 1, 1, 1, 1,
-1.69869, 0.2078527, -1.038425, 1, 1, 1, 1, 1,
-1.683503, 1.634275, -0.4873213, 1, 1, 1, 1, 1,
-1.666669, 0.7356851, -1.03222, 1, 1, 1, 1, 1,
-1.6643, -0.4353065, -2.866175, 1, 1, 1, 1, 1,
-1.659707, 0.3627459, -1.910121, 1, 1, 1, 1, 1,
-1.652946, -0.8560905, -2.465066, 1, 1, 1, 1, 1,
-1.644425, 0.8573554, -1.231262, 0, 0, 1, 1, 1,
-1.624794, -1.181485, -2.783061, 1, 0, 0, 1, 1,
-1.613478, -0.550973, 0.3027669, 1, 0, 0, 1, 1,
-1.572118, 0.8034918, -2.31111, 1, 0, 0, 1, 1,
-1.572038, -0.6261209, -2.541782, 1, 0, 0, 1, 1,
-1.570095, -0.644888, -3.331635, 1, 0, 0, 1, 1,
-1.550975, -0.5557344, -2.21577, 0, 0, 0, 1, 1,
-1.533086, -1.016445, -0.9691325, 0, 0, 0, 1, 1,
-1.528722, -1.376517, -3.00981, 0, 0, 0, 1, 1,
-1.514653, 0.4059279, -2.073962, 0, 0, 0, 1, 1,
-1.507846, -1.047933, 1.049, 0, 0, 0, 1, 1,
-1.485508, 0.3415759, -2.01114, 0, 0, 0, 1, 1,
-1.485151, 0.2747242, -1.044121, 0, 0, 0, 1, 1,
-1.47701, -0.6102992, -1.085914, 1, 1, 1, 1, 1,
-1.475953, 1.412492, -1.85954, 1, 1, 1, 1, 1,
-1.470402, 0.9137541, -2.911832, 1, 1, 1, 1, 1,
-1.464531, 0.9832816, -1.33436, 1, 1, 1, 1, 1,
-1.455263, -0.3851566, -0.9043614, 1, 1, 1, 1, 1,
-1.455235, 0.3749053, -0.5635188, 1, 1, 1, 1, 1,
-1.447116, 1.130258, -0.5178262, 1, 1, 1, 1, 1,
-1.439402, -0.2918425, -2.697482, 1, 1, 1, 1, 1,
-1.437983, -0.2203287, -1.573048, 1, 1, 1, 1, 1,
-1.437363, 2.063604, -0.1791781, 1, 1, 1, 1, 1,
-1.432826, 0.1717719, -2.421055, 1, 1, 1, 1, 1,
-1.426764, -0.6184937, -1.151735, 1, 1, 1, 1, 1,
-1.420391, -0.9160102, -1.042169, 1, 1, 1, 1, 1,
-1.419066, 0.8544651, -1.377615, 1, 1, 1, 1, 1,
-1.413323, -1.646147, -1.777061, 1, 1, 1, 1, 1,
-1.404795, -0.9957355, -2.390228, 0, 0, 1, 1, 1,
-1.403031, -0.191496, -2.473389, 1, 0, 0, 1, 1,
-1.394668, 0.1211204, 0.4460008, 1, 0, 0, 1, 1,
-1.377231, -1.025275, -0.6433283, 1, 0, 0, 1, 1,
-1.37012, 0.276749, -1.265993, 1, 0, 0, 1, 1,
-1.362559, 1.319585, -1.225976, 1, 0, 0, 1, 1,
-1.350702, 0.3188866, -3.821316, 0, 0, 0, 1, 1,
-1.347252, -1.665836, -2.133914, 0, 0, 0, 1, 1,
-1.34325, -1.359699, -3.187964, 0, 0, 0, 1, 1,
-1.331888, 1.422396, -2.88799, 0, 0, 0, 1, 1,
-1.328546, -1.897281, -2.286773, 0, 0, 0, 1, 1,
-1.322229, 0.4217587, -2.076402, 0, 0, 0, 1, 1,
-1.321787, -0.9272705, -2.968969, 0, 0, 0, 1, 1,
-1.318338, 2.292785, -1.040928, 1, 1, 1, 1, 1,
-1.313879, -0.69793, 0.06054748, 1, 1, 1, 1, 1,
-1.307195, 0.456086, -0.4095806, 1, 1, 1, 1, 1,
-1.306087, 0.9178349, -0.3317815, 1, 1, 1, 1, 1,
-1.290813, 1.903262, 0.6230724, 1, 1, 1, 1, 1,
-1.290076, -0.6110271, -3.162037, 1, 1, 1, 1, 1,
-1.285471, -2.482185, -4.042062, 1, 1, 1, 1, 1,
-1.282284, 0.6402949, -1.044546, 1, 1, 1, 1, 1,
-1.281153, 0.02272782, -1.109993, 1, 1, 1, 1, 1,
-1.280179, -0.4633642, -1.723458, 1, 1, 1, 1, 1,
-1.270627, 0.7147595, 1.541757, 1, 1, 1, 1, 1,
-1.269634, -0.5428887, -0.4447466, 1, 1, 1, 1, 1,
-1.261019, -0.4280876, -1.263828, 1, 1, 1, 1, 1,
-1.255032, 0.7766513, -0.680185, 1, 1, 1, 1, 1,
-1.251946, -1.463981, -2.989836, 1, 1, 1, 1, 1,
-1.244897, 1.001322, -1.680193, 0, 0, 1, 1, 1,
-1.240736, -0.4150681, -1.963546, 1, 0, 0, 1, 1,
-1.235835, -0.5694218, -3.764412, 1, 0, 0, 1, 1,
-1.234368, 0.8433759, 0.5469976, 1, 0, 0, 1, 1,
-1.231928, -1.919963, -1.766433, 1, 0, 0, 1, 1,
-1.230222, 0.1012209, -1.13522, 1, 0, 0, 1, 1,
-1.225181, 0.05134775, -2.67876, 0, 0, 0, 1, 1,
-1.222845, -1.083817, -2.292197, 0, 0, 0, 1, 1,
-1.220738, 1.326804, -1.51303, 0, 0, 0, 1, 1,
-1.22046, 1.450917, -1.229203, 0, 0, 0, 1, 1,
-1.219521, -1.184749, -1.737471, 0, 0, 0, 1, 1,
-1.212655, -0.6297058, -3.12985, 0, 0, 0, 1, 1,
-1.21169, 0.1164098, -3.043164, 0, 0, 0, 1, 1,
-1.2107, -0.02758373, -2.123418, 1, 1, 1, 1, 1,
-1.209159, 0.7557602, -1.559616, 1, 1, 1, 1, 1,
-1.193977, -0.5986602, -2.570727, 1, 1, 1, 1, 1,
-1.193258, -0.4889783, -0.7653519, 1, 1, 1, 1, 1,
-1.186703, 0.674165, -4.072049, 1, 1, 1, 1, 1,
-1.185618, 0.03915213, -2.351243, 1, 1, 1, 1, 1,
-1.183214, 1.066305, 0.3963202, 1, 1, 1, 1, 1,
-1.179286, -0.5095828, -1.160712, 1, 1, 1, 1, 1,
-1.176774, 2.608397, -0.2524253, 1, 1, 1, 1, 1,
-1.164881, 1.473058, -1.041338, 1, 1, 1, 1, 1,
-1.160904, 1.062626, 0.6072351, 1, 1, 1, 1, 1,
-1.156698, 0.09366455, -2.378899, 1, 1, 1, 1, 1,
-1.156312, -0.3345187, -2.489116, 1, 1, 1, 1, 1,
-1.152727, 1.082289, -1.218589, 1, 1, 1, 1, 1,
-1.146996, -1.134906, -3.346337, 1, 1, 1, 1, 1,
-1.144922, 1.210834, -2.463064, 0, 0, 1, 1, 1,
-1.142506, -1.62876, -3.261713, 1, 0, 0, 1, 1,
-1.142142, 0.1286775, 0.08700269, 1, 0, 0, 1, 1,
-1.129026, 2.201236, 0.9610491, 1, 0, 0, 1, 1,
-1.126848, 0.7487438, 0.9368582, 1, 0, 0, 1, 1,
-1.121285, -1.801537, -3.091276, 1, 0, 0, 1, 1,
-1.116846, -0.1629147, -0.7918187, 0, 0, 0, 1, 1,
-1.114596, 0.7377323, -2.597132, 0, 0, 0, 1, 1,
-1.108297, -0.8177075, -1.519147, 0, 0, 0, 1, 1,
-1.104345, -0.2174611, -2.818899, 0, 0, 0, 1, 1,
-1.099651, 1.150461, 0.8671179, 0, 0, 0, 1, 1,
-1.098667, -0.6549362, -1.418468, 0, 0, 0, 1, 1,
-1.097513, -0.1938637, -0.9215668, 0, 0, 0, 1, 1,
-1.095283, 0.8425057, -1.731762, 1, 1, 1, 1, 1,
-1.09427, 0.5159048, -1.144802, 1, 1, 1, 1, 1,
-1.090855, 0.5876993, 0.3128743, 1, 1, 1, 1, 1,
-1.089993, 2.604896, 0.1914513, 1, 1, 1, 1, 1,
-1.087509, -0.003864459, -2.846493, 1, 1, 1, 1, 1,
-1.083172, 0.5687669, -1.172494, 1, 1, 1, 1, 1,
-1.069351, 1.392731, -1.016198, 1, 1, 1, 1, 1,
-1.067952, 1.304007, 0.512439, 1, 1, 1, 1, 1,
-1.067734, 1.631069, -0.3131619, 1, 1, 1, 1, 1,
-1.061734, -0.6456394, -3.066965, 1, 1, 1, 1, 1,
-1.058499, 0.3157327, -1.671966, 1, 1, 1, 1, 1,
-1.05675, 0.1505922, -0.2829555, 1, 1, 1, 1, 1,
-1.0566, 0.7125617, -1.406127, 1, 1, 1, 1, 1,
-1.054825, -0.4679319, -1.694998, 1, 1, 1, 1, 1,
-1.053622, 0.8845971, -2.898324, 1, 1, 1, 1, 1,
-1.048104, 0.825879, -0.2598763, 0, 0, 1, 1, 1,
-1.044293, -0.3483641, -3.49377, 1, 0, 0, 1, 1,
-1.024221, -1.056201, -1.732579, 1, 0, 0, 1, 1,
-1.022243, -0.6461047, -3.295307, 1, 0, 0, 1, 1,
-1.02073, 0.430063, -0.0276178, 1, 0, 0, 1, 1,
-1.015614, 0.3428701, -1.990741, 1, 0, 0, 1, 1,
-1.008863, 0.6008866, -1.189911, 0, 0, 0, 1, 1,
-1.007906, 0.7054403, -0.1559844, 0, 0, 0, 1, 1,
-1.004625, -0.7646464, -1.889792, 0, 0, 0, 1, 1,
-0.9973812, -0.363402, -1.36352, 0, 0, 0, 1, 1,
-0.9961087, 0.2053128, -2.178857, 0, 0, 0, 1, 1,
-0.9904386, -0.05735245, -0.8389824, 0, 0, 0, 1, 1,
-0.9880136, 2.937177, 0.2917192, 0, 0, 0, 1, 1,
-0.9868596, 0.6173221, -1.452892, 1, 1, 1, 1, 1,
-0.979583, 1.022686, 0.7320368, 1, 1, 1, 1, 1,
-0.9761992, -0.4320029, -2.293812, 1, 1, 1, 1, 1,
-0.969469, -0.2433587, -2.851523, 1, 1, 1, 1, 1,
-0.9662285, -0.08507358, -2.712044, 1, 1, 1, 1, 1,
-0.9638718, -0.2512065, -1.675587, 1, 1, 1, 1, 1,
-0.9509009, -0.7072838, -1.366579, 1, 1, 1, 1, 1,
-0.9471459, 0.1116056, -0.09335745, 1, 1, 1, 1, 1,
-0.9460692, -1.344649, -2.011755, 1, 1, 1, 1, 1,
-0.9450036, -0.7184289, -2.095417, 1, 1, 1, 1, 1,
-0.9429139, -1.663818, -2.957837, 1, 1, 1, 1, 1,
-0.9417432, -0.2299764, -0.8855405, 1, 1, 1, 1, 1,
-0.9330714, -0.5200965, -0.02076019, 1, 1, 1, 1, 1,
-0.9322197, -0.1442692, 1.469519, 1, 1, 1, 1, 1,
-0.9274223, -2.961433, -0.2053696, 1, 1, 1, 1, 1,
-0.9261228, -0.9480557, -3.959843, 0, 0, 1, 1, 1,
-0.921657, -0.1448907, -1.921027, 1, 0, 0, 1, 1,
-0.9183432, 0.4232551, -1.629203, 1, 0, 0, 1, 1,
-0.9088273, 0.1379547, -0.3306445, 1, 0, 0, 1, 1,
-0.8994759, -0.08489754, 0.7632918, 1, 0, 0, 1, 1,
-0.8979576, 0.02461982, -1.681268, 1, 0, 0, 1, 1,
-0.8938805, -2.555396, -1.823132, 0, 0, 0, 1, 1,
-0.8933492, 0.6539883, -1.195238, 0, 0, 0, 1, 1,
-0.8906166, -0.2519447, -2.231598, 0, 0, 0, 1, 1,
-0.8906075, 0.3273388, -0.2851259, 0, 0, 0, 1, 1,
-0.8862097, 0.5234892, -3.134606, 0, 0, 0, 1, 1,
-0.884443, -0.1420849, -3.253424, 0, 0, 0, 1, 1,
-0.8736533, -1.227868, -3.912519, 0, 0, 0, 1, 1,
-0.8688158, 0.8427514, 0.3728518, 1, 1, 1, 1, 1,
-0.865345, -0.1387699, -1.90832, 1, 1, 1, 1, 1,
-0.8627723, -0.3410714, -1.400173, 1, 1, 1, 1, 1,
-0.8610088, 1.022697, 0.1782354, 1, 1, 1, 1, 1,
-0.8523762, -0.08374238, -0.6920633, 1, 1, 1, 1, 1,
-0.8411542, 0.5018075, -1.925984, 1, 1, 1, 1, 1,
-0.8382809, -0.732332, -2.038361, 1, 1, 1, 1, 1,
-0.8280494, -2.992423, -2.41564, 1, 1, 1, 1, 1,
-0.82743, 1.370623, -0.7505835, 1, 1, 1, 1, 1,
-0.8242348, 1.79591, 0.3180611, 1, 1, 1, 1, 1,
-0.8199005, -0.1012063, -0.01141285, 1, 1, 1, 1, 1,
-0.81726, 0.6806046, -1.013507, 1, 1, 1, 1, 1,
-0.8095121, 0.3939351, -0.9962637, 1, 1, 1, 1, 1,
-0.7994248, -0.1350123, -1.593371, 1, 1, 1, 1, 1,
-0.7971692, 1.475398, -2.251637, 1, 1, 1, 1, 1,
-0.7925333, 0.7866248, -0.9808402, 0, 0, 1, 1, 1,
-0.7779309, -1.671227, -2.391067, 1, 0, 0, 1, 1,
-0.77025, 1.512585, -0.7054777, 1, 0, 0, 1, 1,
-0.764011, -0.6642183, -1.942934, 1, 0, 0, 1, 1,
-0.7619447, 1.198393, -0.5149065, 1, 0, 0, 1, 1,
-0.7618809, 0.6999344, -0.1056758, 1, 0, 0, 1, 1,
-0.7618501, -0.4300535, -1.383158, 0, 0, 0, 1, 1,
-0.7594977, -0.7530536, -1.791922, 0, 0, 0, 1, 1,
-0.7557712, -0.5665982, -4.428131, 0, 0, 0, 1, 1,
-0.7476398, -0.2487812, -2.588509, 0, 0, 0, 1, 1,
-0.7460808, 0.4334039, -0.2889733, 0, 0, 0, 1, 1,
-0.7449258, -0.742293, -4.762914, 0, 0, 0, 1, 1,
-0.7340973, -0.2884765, -1.876716, 0, 0, 0, 1, 1,
-0.7224205, -0.4053149, -1.434099, 1, 1, 1, 1, 1,
-0.7130558, -1.227515, -3.436074, 1, 1, 1, 1, 1,
-0.7113412, 1.724976, -1.525803, 1, 1, 1, 1, 1,
-0.7070526, 0.8373768, 0.04433742, 1, 1, 1, 1, 1,
-0.6928756, -1.291864, -1.841149, 1, 1, 1, 1, 1,
-0.690798, -1.677141, -2.800638, 1, 1, 1, 1, 1,
-0.6907, -1.310972, -0.6278685, 1, 1, 1, 1, 1,
-0.6880518, -0.06446839, -0.1934242, 1, 1, 1, 1, 1,
-0.6835042, 0.1491499, -1.094563, 1, 1, 1, 1, 1,
-0.6802242, -0.2252897, -2.668504, 1, 1, 1, 1, 1,
-0.6800476, 0.4386502, -0.06553224, 1, 1, 1, 1, 1,
-0.6771838, 1.503779, -0.7407601, 1, 1, 1, 1, 1,
-0.6742232, 2.226784, 1.026699, 1, 1, 1, 1, 1,
-0.6694077, 0.1873479, 0.545329, 1, 1, 1, 1, 1,
-0.6665867, -0.5211691, -2.586497, 1, 1, 1, 1, 1,
-0.6643344, 0.3071288, -0.6642758, 0, 0, 1, 1, 1,
-0.6559757, -0.1699076, -3.516805, 1, 0, 0, 1, 1,
-0.653859, 0.04231548, -3.171455, 1, 0, 0, 1, 1,
-0.6529506, -0.4417479, -2.9238, 1, 0, 0, 1, 1,
-0.6527113, -1.23296, -3.653043, 1, 0, 0, 1, 1,
-0.6524568, -0.8408519, -3.147109, 1, 0, 0, 1, 1,
-0.6479089, 0.297192, -2.583026, 0, 0, 0, 1, 1,
-0.646265, 1.158524, 0.5504181, 0, 0, 0, 1, 1,
-0.6386321, -2.980232, -3.446278, 0, 0, 0, 1, 1,
-0.6304877, 1.382853, 0.8594437, 0, 0, 0, 1, 1,
-0.6246388, -1.388913, -1.863995, 0, 0, 0, 1, 1,
-0.6210462, 1.318951, -1.401022, 0, 0, 0, 1, 1,
-0.6204189, 1.146116, -1.444768, 0, 0, 0, 1, 1,
-0.6142341, 1.572488, -1.231519, 1, 1, 1, 1, 1,
-0.612244, 0.007661717, -1.249608, 1, 1, 1, 1, 1,
-0.6110721, -0.3694273, -1.897729, 1, 1, 1, 1, 1,
-0.6107386, -0.5610881, -4.616445, 1, 1, 1, 1, 1,
-0.6052195, -1.458148, -3.903959, 1, 1, 1, 1, 1,
-0.604729, -1.617897, -1.582305, 1, 1, 1, 1, 1,
-0.6041238, 2.07353, 0.4109598, 1, 1, 1, 1, 1,
-0.5961918, -1.494301, -2.715408, 1, 1, 1, 1, 1,
-0.5958731, 0.4932834, -1.229728, 1, 1, 1, 1, 1,
-0.5952257, -1.548842, -4.185472, 1, 1, 1, 1, 1,
-0.5916461, -0.1965646, -1.746355, 1, 1, 1, 1, 1,
-0.59147, -1.402791, -4.085051, 1, 1, 1, 1, 1,
-0.5913082, -1.056634, -3.683878, 1, 1, 1, 1, 1,
-0.5905429, -0.1648545, -1.37058, 1, 1, 1, 1, 1,
-0.5771736, -0.4562156, -2.888918, 1, 1, 1, 1, 1,
-0.5754089, -0.1020919, -1.577035, 0, 0, 1, 1, 1,
-0.5731634, 0.4609298, -0.8164703, 1, 0, 0, 1, 1,
-0.5727322, -0.2357844, -0.5323572, 1, 0, 0, 1, 1,
-0.5692258, -1.417374, -2.879453, 1, 0, 0, 1, 1,
-0.5677605, 1.636014, -0.2262472, 1, 0, 0, 1, 1,
-0.5674241, 1.031825, 0.3150851, 1, 0, 0, 1, 1,
-0.5639126, 0.006018899, -0.8966694, 0, 0, 0, 1, 1,
-0.5635891, 0.3101725, -1.121498, 0, 0, 0, 1, 1,
-0.5604686, -0.380052, -3.028462, 0, 0, 0, 1, 1,
-0.5594261, -0.7968772, -3.026286, 0, 0, 0, 1, 1,
-0.5591925, -0.5263858, -2.457649, 0, 0, 0, 1, 1,
-0.5513907, -0.02246971, -1.96575, 0, 0, 0, 1, 1,
-0.5509782, 0.4194308, -0.5303611, 0, 0, 0, 1, 1,
-0.5385601, -0.9045525, -0.1641433, 1, 1, 1, 1, 1,
-0.5368273, 1.375353, -0.08126157, 1, 1, 1, 1, 1,
-0.5353502, -0.03686481, -2.875068, 1, 1, 1, 1, 1,
-0.5326421, -0.2198789, -3.621461, 1, 1, 1, 1, 1,
-0.5307927, 0.1311794, -1.166061, 1, 1, 1, 1, 1,
-0.5285978, -0.9453659, -1.148815, 1, 1, 1, 1, 1,
-0.524125, -0.07242376, -2.190521, 1, 1, 1, 1, 1,
-0.519807, 0.6346577, -0.7427284, 1, 1, 1, 1, 1,
-0.5171006, 1.654834, -3.073225, 1, 1, 1, 1, 1,
-0.5150856, -0.5596117, -3.780102, 1, 1, 1, 1, 1,
-0.5125978, -1.841388, -2.759829, 1, 1, 1, 1, 1,
-0.5100283, -1.827459, -4.238567, 1, 1, 1, 1, 1,
-0.5076597, -1.162823, -2.08438, 1, 1, 1, 1, 1,
-0.5070995, -1.235646, -3.43846, 1, 1, 1, 1, 1,
-0.5052878, 0.7854896, -0.06854685, 1, 1, 1, 1, 1,
-0.5051557, -0.3361508, -1.34866, 0, 0, 1, 1, 1,
-0.5044165, -1.272092, -2.904262, 1, 0, 0, 1, 1,
-0.5007011, 1.15946, -0.1426491, 1, 0, 0, 1, 1,
-0.4976496, 0.923829, -0.6040867, 1, 0, 0, 1, 1,
-0.4974248, 0.04061925, -1.660519, 1, 0, 0, 1, 1,
-0.4907044, -0.4244255, -2.581168, 1, 0, 0, 1, 1,
-0.4894465, 0.1368166, -0.5981422, 0, 0, 0, 1, 1,
-0.4888817, 1.106131, 0.4963891, 0, 0, 0, 1, 1,
-0.4863043, 0.6460458, 0.66996, 0, 0, 0, 1, 1,
-0.482226, -1.417149, -1.391942, 0, 0, 0, 1, 1,
-0.480412, -1.367051, -2.617378, 0, 0, 0, 1, 1,
-0.4785205, 0.1076272, -2.908003, 0, 0, 0, 1, 1,
-0.4778989, -1.749777, -0.6689623, 0, 0, 0, 1, 1,
-0.4767137, -0.914189, -1.882, 1, 1, 1, 1, 1,
-0.4757925, -1.949829, -2.067269, 1, 1, 1, 1, 1,
-0.4747057, -2.06636, -3.017036, 1, 1, 1, 1, 1,
-0.4737746, -2.197675, -1.696771, 1, 1, 1, 1, 1,
-0.4690329, -1.719374, -1.558087, 1, 1, 1, 1, 1,
-0.4668902, -1.635714, -3.320215, 1, 1, 1, 1, 1,
-0.4657361, -0.3316719, -2.131259, 1, 1, 1, 1, 1,
-0.4637976, -0.01011012, -0.7560301, 1, 1, 1, 1, 1,
-0.4625937, -1.109983, -3.791018, 1, 1, 1, 1, 1,
-0.4551908, -0.8417022, -0.2804172, 1, 1, 1, 1, 1,
-0.4529594, -0.5677506, -3.017828, 1, 1, 1, 1, 1,
-0.4525298, 1.043779, -0.8336708, 1, 1, 1, 1, 1,
-0.4512226, 1.078496, 0.5785282, 1, 1, 1, 1, 1,
-0.4510011, 0.6278667, -0.7359416, 1, 1, 1, 1, 1,
-0.4509015, -0.9481675, -3.079395, 1, 1, 1, 1, 1,
-0.4507654, 0.364922, -0.7842777, 0, 0, 1, 1, 1,
-0.4498773, -0.049162, -3.163697, 1, 0, 0, 1, 1,
-0.4484748, 0.2747037, 0.4867588, 1, 0, 0, 1, 1,
-0.4466353, -0.9070945, -2.951574, 1, 0, 0, 1, 1,
-0.444344, 0.3141841, -1.732497, 1, 0, 0, 1, 1,
-0.4432951, -1.216333, -1.158712, 1, 0, 0, 1, 1,
-0.4428996, -0.1751462, -2.017645, 0, 0, 0, 1, 1,
-0.4412059, 0.5553904, -1.643959, 0, 0, 0, 1, 1,
-0.4391611, 1.207575, -0.2060543, 0, 0, 0, 1, 1,
-0.4381123, -0.5883799, -3.26733, 0, 0, 0, 1, 1,
-0.4351233, 1.036979, -0.8103746, 0, 0, 0, 1, 1,
-0.4347854, -0.03605521, -2.670808, 0, 0, 0, 1, 1,
-0.4344139, -0.1643148, -1.958627, 0, 0, 0, 1, 1,
-0.433684, 1.147614, -2.361902, 1, 1, 1, 1, 1,
-0.433674, 0.02979586, -1.897749, 1, 1, 1, 1, 1,
-0.432254, -0.5170674, -1.858835, 1, 1, 1, 1, 1,
-0.4256214, -0.142145, -2.166048, 1, 1, 1, 1, 1,
-0.4246461, 0.6960566, -1.031763, 1, 1, 1, 1, 1,
-0.4240941, 0.3448875, -0.9392521, 1, 1, 1, 1, 1,
-0.4219415, 1.951094, -0.816004, 1, 1, 1, 1, 1,
-0.4181871, -0.03811609, -0.1297592, 1, 1, 1, 1, 1,
-0.4143941, 0.4219549, 1.353752, 1, 1, 1, 1, 1,
-0.4123648, 1.588236, -1.333434, 1, 1, 1, 1, 1,
-0.4076847, -0.9429375, -3.546496, 1, 1, 1, 1, 1,
-0.4074347, -0.5327517, -2.714183, 1, 1, 1, 1, 1,
-0.4069851, -0.3832948, -2.710246, 1, 1, 1, 1, 1,
-0.4049432, -2.060515, -3.419405, 1, 1, 1, 1, 1,
-0.4031543, -0.9815675, -3.12929, 1, 1, 1, 1, 1,
-0.4014412, -0.9491429, -1.210321, 0, 0, 1, 1, 1,
-0.3982721, 1.110818, 0.8879254, 1, 0, 0, 1, 1,
-0.3974714, 0.1508802, -1.80865, 1, 0, 0, 1, 1,
-0.3959742, 0.5247595, -0.3839315, 1, 0, 0, 1, 1,
-0.3955669, -2.088932, -2.650635, 1, 0, 0, 1, 1,
-0.3947702, -2.498226, -3.968062, 1, 0, 0, 1, 1,
-0.3920356, -0.3126012, -2.417626, 0, 0, 0, 1, 1,
-0.3896389, 0.07289413, -2.210108, 0, 0, 0, 1, 1,
-0.3895104, 1.255827, 1.31245, 0, 0, 0, 1, 1,
-0.3889716, -1.305803, -2.490404, 0, 0, 0, 1, 1,
-0.3758731, 0.2343914, -1.004691, 0, 0, 0, 1, 1,
-0.3740304, 0.5584072, 0.3012559, 0, 0, 0, 1, 1,
-0.3709072, -0.237623, 0.9752566, 0, 0, 0, 1, 1,
-0.3693552, -0.4974935, -3.208085, 1, 1, 1, 1, 1,
-0.3553621, 1.441431, 0.2076472, 1, 1, 1, 1, 1,
-0.3495823, -0.8349671, -3.477099, 1, 1, 1, 1, 1,
-0.3482332, 1.190038, 0.9676176, 1, 1, 1, 1, 1,
-0.3430335, 0.2882153, 0.161011, 1, 1, 1, 1, 1,
-0.3407832, -0.1606669, -2.918929, 1, 1, 1, 1, 1,
-0.3397154, -1.132811, -5.265191, 1, 1, 1, 1, 1,
-0.3388065, -0.3038665, -1.23696, 1, 1, 1, 1, 1,
-0.3372129, -0.06624062, -3.05549, 1, 1, 1, 1, 1,
-0.3334859, 0.3016829, -0.3205778, 1, 1, 1, 1, 1,
-0.3264867, 0.9515845, -0.2051878, 1, 1, 1, 1, 1,
-0.323444, -0.5447582, -1.463004, 1, 1, 1, 1, 1,
-0.3227566, 1.264244, -0.4442372, 1, 1, 1, 1, 1,
-0.3224177, 1.180276, -0.2817788, 1, 1, 1, 1, 1,
-0.3140807, 0.22122, -0.9410936, 1, 1, 1, 1, 1,
-0.3135985, 0.7428979, -0.4219577, 0, 0, 1, 1, 1,
-0.3134665, 1.481281, -0.1219447, 1, 0, 0, 1, 1,
-0.3132296, -0.1826031, -1.59945, 1, 0, 0, 1, 1,
-0.3091784, 0.3447292, -2.139742, 1, 0, 0, 1, 1,
-0.3049641, -0.4098492, -4.626596, 1, 0, 0, 1, 1,
-0.2979464, 0.2090635, 0.1528772, 1, 0, 0, 1, 1,
-0.2976003, 0.02295411, -0.9747161, 0, 0, 0, 1, 1,
-0.2947752, -1.442702, -1.588263, 0, 0, 0, 1, 1,
-0.2946678, 0.1648251, -1.502952, 0, 0, 0, 1, 1,
-0.2941175, 0.1207395, -0.1644941, 0, 0, 0, 1, 1,
-0.2936298, -0.3175747, -1.941158, 0, 0, 0, 1, 1,
-0.2922881, -0.4094637, -3.959983, 0, 0, 0, 1, 1,
-0.2920988, 0.1542763, -0.584118, 0, 0, 0, 1, 1,
-0.2915463, -1.631324, -2.549465, 1, 1, 1, 1, 1,
-0.2914787, 0.2416642, 0.1211947, 1, 1, 1, 1, 1,
-0.2867012, 0.2315703, -2.822726, 1, 1, 1, 1, 1,
-0.2864077, -0.3405563, -2.78387, 1, 1, 1, 1, 1,
-0.2826661, 0.1516636, -1.61329, 1, 1, 1, 1, 1,
-0.280571, -0.783327, -2.805438, 1, 1, 1, 1, 1,
-0.2788242, 0.4207992, -1.185604, 1, 1, 1, 1, 1,
-0.2784002, 1.282935, 0.6523721, 1, 1, 1, 1, 1,
-0.2783663, 0.7236653, -0.9670874, 1, 1, 1, 1, 1,
-0.2778909, -0.4810925, -3.418997, 1, 1, 1, 1, 1,
-0.2730323, 0.1059741, -0.7054442, 1, 1, 1, 1, 1,
-0.2722523, 1.268678, -0.01237411, 1, 1, 1, 1, 1,
-0.2676564, -1.134856, -2.653951, 1, 1, 1, 1, 1,
-0.2639288, -0.166436, -3.209132, 1, 1, 1, 1, 1,
-0.2564686, 0.0993569, -0.164317, 1, 1, 1, 1, 1,
-0.2554659, 0.9078935, 1.547261, 0, 0, 1, 1, 1,
-0.2553461, -0.00968344, -2.200903, 1, 0, 0, 1, 1,
-0.2518762, -0.4825955, -2.14085, 1, 0, 0, 1, 1,
-0.2518638, -0.3572957, -2.78066, 1, 0, 0, 1, 1,
-0.2495826, 0.4907765, -0.7441154, 1, 0, 0, 1, 1,
-0.2437395, 1.33222, 0.8234703, 1, 0, 0, 1, 1,
-0.2428523, -0.807408, -2.347129, 0, 0, 0, 1, 1,
-0.237616, -0.3357148, -3.249965, 0, 0, 0, 1, 1,
-0.2336885, -0.3703857, -4.692366, 0, 0, 0, 1, 1,
-0.2326977, -0.4939799, -4.021862, 0, 0, 0, 1, 1,
-0.2266454, 0.09999954, -0.8501006, 0, 0, 0, 1, 1,
-0.2240722, -1.092085, -3.910458, 0, 0, 0, 1, 1,
-0.2210249, 0.6200932, -1.301931, 0, 0, 0, 1, 1,
-0.2154574, -0.1746608, -2.067475, 1, 1, 1, 1, 1,
-0.2097262, 2.197145, -0.694504, 1, 1, 1, 1, 1,
-0.2048108, 0.07103387, -2.663846, 1, 1, 1, 1, 1,
-0.2038774, 0.2298076, -2.280271, 1, 1, 1, 1, 1,
-0.2034105, -1.358403, -4.00896, 1, 1, 1, 1, 1,
-0.2025515, -0.4580304, -2.395201, 1, 1, 1, 1, 1,
-0.202374, -0.2361405, -2.288652, 1, 1, 1, 1, 1,
-0.1985265, -0.1438958, -1.16847, 1, 1, 1, 1, 1,
-0.1964055, -0.8105078, -5.411199, 1, 1, 1, 1, 1,
-0.1960947, 1.34852, 1.986798, 1, 1, 1, 1, 1,
-0.1916694, 1.585634, 0.9010737, 1, 1, 1, 1, 1,
-0.185433, -1.878734, -2.451935, 1, 1, 1, 1, 1,
-0.1853064, 0.8937613, -2.360495, 1, 1, 1, 1, 1,
-0.1848431, 0.4181761, -0.3015065, 1, 1, 1, 1, 1,
-0.1837589, -1.133695, -3.233774, 1, 1, 1, 1, 1,
-0.1830196, -0.8956936, -3.148088, 0, 0, 1, 1, 1,
-0.1817686, -0.09681834, -0.8499224, 1, 0, 0, 1, 1,
-0.1812511, -1.476305, -1.635312, 1, 0, 0, 1, 1,
-0.1748387, 3.114479, -1.194123, 1, 0, 0, 1, 1,
-0.1721457, 0.1476258, 0.04734947, 1, 0, 0, 1, 1,
-0.1684964, 0.6683673, 1.420402, 1, 0, 0, 1, 1,
-0.1684921, -0.2892387, -1.973707, 0, 0, 0, 1, 1,
-0.1667241, 1.014658, -0.6496471, 0, 0, 0, 1, 1,
-0.1661698, 1.021539, 0.3079894, 0, 0, 0, 1, 1,
-0.1624575, -1.021553, -4.290976, 0, 0, 0, 1, 1,
-0.1564858, 0.9884662, -0.906648, 0, 0, 0, 1, 1,
-0.1528086, 0.8151172, -0.009495618, 0, 0, 0, 1, 1,
-0.1525382, -0.4714568, -2.239717, 0, 0, 0, 1, 1,
-0.1506072, 0.576815, -0.776897, 1, 1, 1, 1, 1,
-0.1449765, 0.4350747, 0.8263187, 1, 1, 1, 1, 1,
-0.14428, 0.5565852, 0.9167945, 1, 1, 1, 1, 1,
-0.1424396, 0.7992585, -0.5473501, 1, 1, 1, 1, 1,
-0.1370825, 0.2290563, -0.5969861, 1, 1, 1, 1, 1,
-0.1364098, 0.7953963, -0.2737509, 1, 1, 1, 1, 1,
-0.136106, -0.0424977, -1.4288, 1, 1, 1, 1, 1,
-0.1335813, -1.167108, -3.352629, 1, 1, 1, 1, 1,
-0.1332394, 0.7073092, -1.975037, 1, 1, 1, 1, 1,
-0.131634, 0.6440195, -0.892906, 1, 1, 1, 1, 1,
-0.1311496, -1.170313, -3.024734, 1, 1, 1, 1, 1,
-0.1262834, -0.08912515, -1.214756, 1, 1, 1, 1, 1,
-0.1260512, 0.3740207, -1.272938, 1, 1, 1, 1, 1,
-0.1238671, 0.1462078, -0.06825143, 1, 1, 1, 1, 1,
-0.1194898, 0.5101803, 0.9073061, 1, 1, 1, 1, 1,
-0.1190223, -0.2758819, -1.986248, 0, 0, 1, 1, 1,
-0.1183706, -0.8167592, -2.509276, 1, 0, 0, 1, 1,
-0.1160451, -0.9874957, -2.500691, 1, 0, 0, 1, 1,
-0.1120642, 0.7039866, -1.422455, 1, 0, 0, 1, 1,
-0.1084295, 0.02737029, -1.895527, 1, 0, 0, 1, 1,
-0.1081833, 1.055908, 1.147202, 1, 0, 0, 1, 1,
-0.1063347, 1.407431, -0.957138, 0, 0, 0, 1, 1,
-0.1013885, -0.3744186, -2.046679, 0, 0, 0, 1, 1,
-0.1000363, 0.6692822, -1.869644, 0, 0, 0, 1, 1,
-0.09580493, 1.153882, 0.1760575, 0, 0, 0, 1, 1,
-0.0933293, -0.051019, -3.828098, 0, 0, 0, 1, 1,
-0.08509042, -0.9379071, -2.964946, 0, 0, 0, 1, 1,
-0.08308169, 1.219674, -0.8947422, 0, 0, 0, 1, 1,
-0.08296819, 0.418113, 0.4757611, 1, 1, 1, 1, 1,
-0.08287469, 0.1656314, -1.353463, 1, 1, 1, 1, 1,
-0.07941411, 0.2096433, 2.61758, 1, 1, 1, 1, 1,
-0.07723217, 1.016525, 0.3308953, 1, 1, 1, 1, 1,
-0.07702011, 0.01996398, -0.6562211, 1, 1, 1, 1, 1,
-0.07004856, -0.05635219, -1.603954, 1, 1, 1, 1, 1,
-0.06960632, 0.1939582, 0.3178921, 1, 1, 1, 1, 1,
-0.06772842, -0.9381179, -2.347497, 1, 1, 1, 1, 1,
-0.0676192, 0.5738398, -0.1358476, 1, 1, 1, 1, 1,
-0.06660796, 1.248971, -0.264904, 1, 1, 1, 1, 1,
-0.06549831, 1.675235, 0.5563021, 1, 1, 1, 1, 1,
-0.06224018, -1.303458, -4.739336, 1, 1, 1, 1, 1,
-0.06218999, 1.117904, -0.1541323, 1, 1, 1, 1, 1,
-0.06111871, 1.480388, 0.143144, 1, 1, 1, 1, 1,
-0.05925998, 1.717664, 1.031053, 1, 1, 1, 1, 1,
-0.05619072, -0.1255354, -1.116765, 0, 0, 1, 1, 1,
-0.05475173, -0.3819273, -0.6869872, 1, 0, 0, 1, 1,
-0.05142514, 0.03658636, -0.9328374, 1, 0, 0, 1, 1,
-0.04842326, -1.416458, -4.289482, 1, 0, 0, 1, 1,
-0.04534566, 1.004916, 1.041346, 1, 0, 0, 1, 1,
-0.04488567, 0.351194, 0.158336, 1, 0, 0, 1, 1,
-0.03191107, -0.1522968, -2.73911, 0, 0, 0, 1, 1,
-0.03041298, -1.304834, -3.298481, 0, 0, 0, 1, 1,
-0.02888741, -0.03485079, -2.194691, 0, 0, 0, 1, 1,
-0.02470676, -0.452762, -1.530835, 0, 0, 0, 1, 1,
-0.02254679, 0.3896607, -0.8088362, 0, 0, 0, 1, 1,
-0.02152808, -1.140905, -4.393525, 0, 0, 0, 1, 1,
-0.01235541, 0.9657056, -1.763051, 0, 0, 0, 1, 1,
-0.01156256, -0.8245438, -2.536369, 1, 1, 1, 1, 1,
-0.007872773, 0.3299253, 1.094057, 1, 1, 1, 1, 1,
-0.005672262, -0.02291348, -1.993858, 1, 1, 1, 1, 1,
-0.003626335, -0.09932714, -2.188386, 1, 1, 1, 1, 1,
-0.0007270609, -0.4877153, -3.794445, 1, 1, 1, 1, 1,
0.002195472, 1.016315, -2.495249, 1, 1, 1, 1, 1,
0.002938916, -0.9157183, 1.750055, 1, 1, 1, 1, 1,
0.003738312, -0.5910898, 2.063988, 1, 1, 1, 1, 1,
0.007316913, -1.543778, 3.253474, 1, 1, 1, 1, 1,
0.008115444, -1.548128, 2.670543, 1, 1, 1, 1, 1,
0.009272444, 1.485854, -1.159851, 1, 1, 1, 1, 1,
0.01061093, 0.376086, -0.3848086, 1, 1, 1, 1, 1,
0.01233557, -1.114224, 2.402452, 1, 1, 1, 1, 1,
0.01353724, -0.9734732, 4.528214, 1, 1, 1, 1, 1,
0.0145, 0.3633752, 0.3084193, 1, 1, 1, 1, 1,
0.0184027, -0.901771, 3.485924, 0, 0, 1, 1, 1,
0.02315093, 0.7337863, -2.251091, 1, 0, 0, 1, 1,
0.02831508, -0.8595916, 5.216544, 1, 0, 0, 1, 1,
0.03374775, 1.597401, -0.701659, 1, 0, 0, 1, 1,
0.03625496, 0.04040265, 2.448233, 1, 0, 0, 1, 1,
0.03629979, 0.161997, 1.893607, 1, 0, 0, 1, 1,
0.03755114, -1.585438, 4.061853, 0, 0, 0, 1, 1,
0.0395628, 0.4799551, 0.1067954, 0, 0, 0, 1, 1,
0.04170803, -0.03917544, 1.275862, 0, 0, 0, 1, 1,
0.04498008, 0.3966058, 0.05377445, 0, 0, 0, 1, 1,
0.04645903, -0.500945, 2.669371, 0, 0, 0, 1, 1,
0.04862292, 1.339288, -1.309761, 0, 0, 0, 1, 1,
0.05041729, 1.172082, 0.974798, 0, 0, 0, 1, 1,
0.0509365, 0.9480887, -1.561066, 1, 1, 1, 1, 1,
0.05457561, 1.764081, 0.7773039, 1, 1, 1, 1, 1,
0.05820835, -0.8494474, 3.589498, 1, 1, 1, 1, 1,
0.05858, -1.418522, 4.023335, 1, 1, 1, 1, 1,
0.0657362, 1.050974, 1.046403, 1, 1, 1, 1, 1,
0.06741987, 0.276283, -0.01629487, 1, 1, 1, 1, 1,
0.06920961, -1.815122, 3.598591, 1, 1, 1, 1, 1,
0.07574666, -0.8477513, 3.123495, 1, 1, 1, 1, 1,
0.07724446, 1.299905, -0.6254267, 1, 1, 1, 1, 1,
0.07799502, -2.129505, 4.133263, 1, 1, 1, 1, 1,
0.07849078, -1.394968, 3.268157, 1, 1, 1, 1, 1,
0.08446047, -1.102603, 4.393708, 1, 1, 1, 1, 1,
0.08460878, -0.2234355, 2.405537, 1, 1, 1, 1, 1,
0.08708878, 0.6261464, -0.4772565, 1, 1, 1, 1, 1,
0.08739751, 0.1761017, -1.358425, 1, 1, 1, 1, 1,
0.08772743, -0.1570939, 3.595944, 0, 0, 1, 1, 1,
0.09157281, 0.005897516, 1.142815, 1, 0, 0, 1, 1,
0.1005838, 0.1836906, 0.05838786, 1, 0, 0, 1, 1,
0.108532, 0.6638587, 0.9712487, 1, 0, 0, 1, 1,
0.1091416, 0.9635462, -0.9548089, 1, 0, 0, 1, 1,
0.1143749, -0.2923908, 1.814658, 1, 0, 0, 1, 1,
0.1167766, -1.388986, 3.053035, 0, 0, 0, 1, 1,
0.1169311, -0.128282, 1.433222, 0, 0, 0, 1, 1,
0.1224327, 0.9674689, 0.3417278, 0, 0, 0, 1, 1,
0.122565, -0.07284876, 3.973855, 0, 0, 0, 1, 1,
0.1231339, -0.7711504, 2.386051, 0, 0, 0, 1, 1,
0.1281019, 0.4372678, 0.01596018, 0, 0, 0, 1, 1,
0.130188, -0.1892006, 3.797487, 0, 0, 0, 1, 1,
0.1310191, 1.142442, 0.0002068786, 1, 1, 1, 1, 1,
0.1312184, -1.471952, 3.025393, 1, 1, 1, 1, 1,
0.1328266, 0.6830174, 1.035951, 1, 1, 1, 1, 1,
0.1358619, 0.866919, 0.1206861, 1, 1, 1, 1, 1,
0.1411991, -0.6536775, 2.959536, 1, 1, 1, 1, 1,
0.1456388, 0.7284095, 1.087577, 1, 1, 1, 1, 1,
0.1456484, 1.740715, 1.151405, 1, 1, 1, 1, 1,
0.1464001, 0.1676461, -0.9610062, 1, 1, 1, 1, 1,
0.1478893, -1.5396, 4.016495, 1, 1, 1, 1, 1,
0.1487331, 1.301955, 0.8529838, 1, 1, 1, 1, 1,
0.1514993, -0.1577971, 1.289335, 1, 1, 1, 1, 1,
0.1516077, -0.403599, 2.27712, 1, 1, 1, 1, 1,
0.1523116, 0.5884181, 0.831698, 1, 1, 1, 1, 1,
0.1550585, 0.9578988, 0.4864163, 1, 1, 1, 1, 1,
0.1557122, 0.828867, 1.41209, 1, 1, 1, 1, 1,
0.1563571, 0.4860701, 0.03114167, 0, 0, 1, 1, 1,
0.1564251, -0.411956, 2.581785, 1, 0, 0, 1, 1,
0.1576705, 0.5972729, 1.351101, 1, 0, 0, 1, 1,
0.1666687, -1.506052, 2.670849, 1, 0, 0, 1, 1,
0.1678519, 1.08602, -0.2712614, 1, 0, 0, 1, 1,
0.1716504, -0.4040339, 1.935532, 1, 0, 0, 1, 1,
0.1722385, -2.268404, 2.757045, 0, 0, 0, 1, 1,
0.1737214, 0.07818124, -0.3237437, 0, 0, 0, 1, 1,
0.1737688, -1.396446, 4.004661, 0, 0, 0, 1, 1,
0.178101, 0.06637029, 1.211939, 0, 0, 0, 1, 1,
0.1803661, -1.424695, 2.567219, 0, 0, 0, 1, 1,
0.1818263, 0.1294917, 1.897101, 0, 0, 0, 1, 1,
0.1891546, 0.2403014, 1.175435, 0, 0, 0, 1, 1,
0.1957102, -1.332539, 3.946111, 1, 1, 1, 1, 1,
0.1980908, 1.65728, 2.023897, 1, 1, 1, 1, 1,
0.2131151, 0.7117068, -1.562673, 1, 1, 1, 1, 1,
0.2133249, 2.461665, 0.390645, 1, 1, 1, 1, 1,
0.2169044, -0.5693928, 3.299354, 1, 1, 1, 1, 1,
0.2190603, -0.8099568, 3.4295, 1, 1, 1, 1, 1,
0.2210497, 0.6710045, -0.3990956, 1, 1, 1, 1, 1,
0.2302524, 0.9398916, 0.3582264, 1, 1, 1, 1, 1,
0.2311878, -0.01365827, 0.4617461, 1, 1, 1, 1, 1,
0.2361204, -2.063269, 3.485784, 1, 1, 1, 1, 1,
0.2385615, -0.08550223, 0.1236504, 1, 1, 1, 1, 1,
0.2421548, -0.5427983, 2.830127, 1, 1, 1, 1, 1,
0.2429284, 0.6250803, 0.6997623, 1, 1, 1, 1, 1,
0.2455524, -0.6219987, 1.626006, 1, 1, 1, 1, 1,
0.2570778, 0.916531, -1.07778, 1, 1, 1, 1, 1,
0.2585702, 1.332444, 1.217812, 0, 0, 1, 1, 1,
0.261399, -0.9188824, 2.350439, 1, 0, 0, 1, 1,
0.2631717, 0.9692522, 1.808422, 1, 0, 0, 1, 1,
0.26726, -1.199161, 2.339174, 1, 0, 0, 1, 1,
0.274715, -1.096, 3.822751, 1, 0, 0, 1, 1,
0.2789967, -0.9084372, 0.8842525, 1, 0, 0, 1, 1,
0.2813408, 0.654552, -0.2428443, 0, 0, 0, 1, 1,
0.2861088, -1.67997, 3.586474, 0, 0, 0, 1, 1,
0.2896843, -0.3448428, 1.239805, 0, 0, 0, 1, 1,
0.2903123, 1.694832, -1.355544, 0, 0, 0, 1, 1,
0.2994345, 0.04395598, 2.270639, 0, 0, 0, 1, 1,
0.3045352, -0.08756623, 1.454559, 0, 0, 0, 1, 1,
0.3062215, -0.8490396, 1.703925, 0, 0, 0, 1, 1,
0.3110721, 0.1224395, 0.9657035, 1, 1, 1, 1, 1,
0.3122848, -1.569662, 3.713827, 1, 1, 1, 1, 1,
0.3134017, 1.326226, -0.0804907, 1, 1, 1, 1, 1,
0.3157891, -0.04238677, 2.529107, 1, 1, 1, 1, 1,
0.3214066, 0.03477618, 2.878399, 1, 1, 1, 1, 1,
0.3226081, 0.2104101, 1.75101, 1, 1, 1, 1, 1,
0.322787, 0.5061203, 1.568118, 1, 1, 1, 1, 1,
0.322987, -0.589415, 2.673563, 1, 1, 1, 1, 1,
0.3231601, 0.5050745, 2.227214, 1, 1, 1, 1, 1,
0.3235638, 0.2489339, 1.469396, 1, 1, 1, 1, 1,
0.3251077, -0.8199402, 3.822364, 1, 1, 1, 1, 1,
0.325335, -0.8791125, 2.808177, 1, 1, 1, 1, 1,
0.3275405, -0.3283784, 1.018652, 1, 1, 1, 1, 1,
0.3308655, 1.010235, 0.3990148, 1, 1, 1, 1, 1,
0.332386, 1.319713, 1.625023, 1, 1, 1, 1, 1,
0.334688, -0.6521818, 2.918606, 0, 0, 1, 1, 1,
0.3353502, -0.2576856, 1.862235, 1, 0, 0, 1, 1,
0.3377358, -1.387649, 4.086946, 1, 0, 0, 1, 1,
0.341523, -0.3868281, 2.988768, 1, 0, 0, 1, 1,
0.3479251, 0.7543049, 0.168946, 1, 0, 0, 1, 1,
0.3487507, -0.6251174, 4.175615, 1, 0, 0, 1, 1,
0.3503591, -1.203126, 2.675402, 0, 0, 0, 1, 1,
0.354999, -0.3106469, 2.30635, 0, 0, 0, 1, 1,
0.3571267, -1.249431, 3.315471, 0, 0, 0, 1, 1,
0.3590707, 1.348166, 0.01968116, 0, 0, 0, 1, 1,
0.3591443, -2.596252, 3.47931, 0, 0, 0, 1, 1,
0.3667439, 0.5370348, 1.503798, 0, 0, 0, 1, 1,
0.3726772, 0.101348, 0.6576372, 0, 0, 0, 1, 1,
0.3799278, -0.6014085, 1.720917, 1, 1, 1, 1, 1,
0.3803436, 1.061512, 0.3547803, 1, 1, 1, 1, 1,
0.3831193, -0.1280261, 1.185005, 1, 1, 1, 1, 1,
0.3837847, 0.1949587, 1.032622, 1, 1, 1, 1, 1,
0.3845612, -0.2681535, 2.812849, 1, 1, 1, 1, 1,
0.3882665, 0.06162501, 3.663474, 1, 1, 1, 1, 1,
0.389579, -1.436957, 3.960152, 1, 1, 1, 1, 1,
0.3908593, -0.7790293, 2.291463, 1, 1, 1, 1, 1,
0.3917129, -1.345228, 1.952551, 1, 1, 1, 1, 1,
0.3923046, 0.9800809, -0.7364925, 1, 1, 1, 1, 1,
0.3942374, -0.7717224, 3.403061, 1, 1, 1, 1, 1,
0.4043855, -0.4918424, 2.19391, 1, 1, 1, 1, 1,
0.4052055, 0.3838974, 0.5175433, 1, 1, 1, 1, 1,
0.4101945, 0.236417, 3.040735, 1, 1, 1, 1, 1,
0.4130791, -0.08406426, -0.3329155, 1, 1, 1, 1, 1,
0.4135421, -0.3408659, 2.243052, 0, 0, 1, 1, 1,
0.4155716, -0.4261837, 1.284283, 1, 0, 0, 1, 1,
0.4180478, 1.319216, -0.05436877, 1, 0, 0, 1, 1,
0.4185667, -3.408521, 3.218567, 1, 0, 0, 1, 1,
0.4221956, -0.6224311, 3.127773, 1, 0, 0, 1, 1,
0.4251277, -0.2512951, 2.460099, 1, 0, 0, 1, 1,
0.4265181, 2.351839, -1.555539, 0, 0, 0, 1, 1,
0.4277166, -0.4005318, 1.300548, 0, 0, 0, 1, 1,
0.4279916, 0.2947222, 0.8208298, 0, 0, 0, 1, 1,
0.4281048, 0.7176561, 1.295957, 0, 0, 0, 1, 1,
0.4424442, -1.336033, 3.934273, 0, 0, 0, 1, 1,
0.4427465, 0.2599121, 2.606685, 0, 0, 0, 1, 1,
0.4450176, -2.071238, 2.397542, 0, 0, 0, 1, 1,
0.4478315, 0.8390379, 1.250545, 1, 1, 1, 1, 1,
0.4542922, 0.655948, 2.618125, 1, 1, 1, 1, 1,
0.4581122, -1.291341, 3.40379, 1, 1, 1, 1, 1,
0.4612185, -1.041876, 3.273058, 1, 1, 1, 1, 1,
0.4613791, -1.456412, 2.559316, 1, 1, 1, 1, 1,
0.4623255, -0.3428349, 1.172657, 1, 1, 1, 1, 1,
0.4637278, 1.350408, 0.4364353, 1, 1, 1, 1, 1,
0.4646883, -1.234004, 2.098904, 1, 1, 1, 1, 1,
0.4683341, 0.2632935, 1.434409, 1, 1, 1, 1, 1,
0.4685387, -0.7368734, 2.863948, 1, 1, 1, 1, 1,
0.4708522, -0.1254933, 2.300032, 1, 1, 1, 1, 1,
0.4712694, 0.4973482, 0.1483365, 1, 1, 1, 1, 1,
0.4718654, -0.05976684, 1.136901, 1, 1, 1, 1, 1,
0.4726216, 1.24119, -0.3993616, 1, 1, 1, 1, 1,
0.4731745, 0.7801823, 0.5014431, 1, 1, 1, 1, 1,
0.4764136, 1.270352, 0.7637657, 0, 0, 1, 1, 1,
0.4848781, -0.966198, 1.387336, 1, 0, 0, 1, 1,
0.4852248, 0.7896677, 1.575275, 1, 0, 0, 1, 1,
0.4997491, -0.1913718, 1.792648, 1, 0, 0, 1, 1,
0.5020047, 0.6927742, 0.7801292, 1, 0, 0, 1, 1,
0.5072324, -0.4051277, 3.034304, 1, 0, 0, 1, 1,
0.507533, -1.038455, 0.5548877, 0, 0, 0, 1, 1,
0.5078691, -0.5530369, 1.523604, 0, 0, 0, 1, 1,
0.5092086, 2.369647, 1.412603, 0, 0, 0, 1, 1,
0.5099981, -0.7042314, 1.912761, 0, 0, 0, 1, 1,
0.5131842, -2.022194, 4.397491, 0, 0, 0, 1, 1,
0.5201616, -1.80564, 2.414158, 0, 0, 0, 1, 1,
0.5266679, -0.6655422, 4.570266, 0, 0, 0, 1, 1,
0.5292724, -2.491575, 3.647898, 1, 1, 1, 1, 1,
0.5295556, 0.6152897, -0.3050893, 1, 1, 1, 1, 1,
0.530912, 0.07520604, 1.908493, 1, 1, 1, 1, 1,
0.5332683, 0.5373796, 1.360917, 1, 1, 1, 1, 1,
0.5397754, -1.023106, 1.997238, 1, 1, 1, 1, 1,
0.5417243, -1.777952, 2.802566, 1, 1, 1, 1, 1,
0.5434546, -0.4826823, 2.683652, 1, 1, 1, 1, 1,
0.548631, -0.5883173, 3.928275, 1, 1, 1, 1, 1,
0.5486875, 0.1193475, 1.57376, 1, 1, 1, 1, 1,
0.5498217, 0.45493, 1.53172, 1, 1, 1, 1, 1,
0.5511873, 1.185381, -0.5600805, 1, 1, 1, 1, 1,
0.5540015, -1.097956, 3.306595, 1, 1, 1, 1, 1,
0.5552388, -0.3746881, 0.6802337, 1, 1, 1, 1, 1,
0.5614813, 0.2017844, 0.03524393, 1, 1, 1, 1, 1,
0.5618776, -0.381164, 1.722935, 1, 1, 1, 1, 1,
0.5623813, 0.4161558, 1.589225, 0, 0, 1, 1, 1,
0.5642096, 2.429853, -0.176842, 1, 0, 0, 1, 1,
0.5665876, 0.5391844, 1.474939, 1, 0, 0, 1, 1,
0.5712404, -0.1716444, 3.141022, 1, 0, 0, 1, 1,
0.5749147, 0.3314069, 0.9732397, 1, 0, 0, 1, 1,
0.5759908, 0.9557588, 0.3394413, 1, 0, 0, 1, 1,
0.5810127, -0.4233429, 2.0004, 0, 0, 0, 1, 1,
0.5813351, -0.5616881, 2.304158, 0, 0, 0, 1, 1,
0.5814371, -1.501876, 4.759435, 0, 0, 0, 1, 1,
0.589769, 0.3811133, 0.1336196, 0, 0, 0, 1, 1,
0.5927246, 0.3115799, 2.590923, 0, 0, 0, 1, 1,
0.5938754, 1.110914, -1.854235, 0, 0, 0, 1, 1,
0.5961173, 0.4369293, 0.8625099, 0, 0, 0, 1, 1,
0.596726, -1.611441, 2.429309, 1, 1, 1, 1, 1,
0.598212, 0.7680684, 0.4256838, 1, 1, 1, 1, 1,
0.5986176, 0.3697215, 1.612937, 1, 1, 1, 1, 1,
0.5994207, 0.2692462, 2.12832, 1, 1, 1, 1, 1,
0.6012894, -0.368945, 3.86713, 1, 1, 1, 1, 1,
0.6087228, -0.4305307, 2.679817, 1, 1, 1, 1, 1,
0.6121575, -0.2945378, 1.096808, 1, 1, 1, 1, 1,
0.6132133, 1.326758, 0.1341859, 1, 1, 1, 1, 1,
0.6155692, -0.5204351, 3.297043, 1, 1, 1, 1, 1,
0.6160058, 1.70421, 1.221621, 1, 1, 1, 1, 1,
0.6169686, 1.159045, -0.257887, 1, 1, 1, 1, 1,
0.619109, -1.748691, 2.002934, 1, 1, 1, 1, 1,
0.6193512, 2.030999, 2.163613, 1, 1, 1, 1, 1,
0.6196926, -0.1455247, 1.985022, 1, 1, 1, 1, 1,
0.6206804, 0.9492831, 1.711413, 1, 1, 1, 1, 1,
0.6268955, -0.3594583, 3.556965, 0, 0, 1, 1, 1,
0.6288944, 0.07232811, 3.755439, 1, 0, 0, 1, 1,
0.6305305, 0.9646354, -0.02702205, 1, 0, 0, 1, 1,
0.6307983, 0.5549224, -1.289463, 1, 0, 0, 1, 1,
0.6315857, -2.256145, 3.710077, 1, 0, 0, 1, 1,
0.6329803, 0.9720962, 0.150406, 1, 0, 0, 1, 1,
0.6340482, -1.917175, 0.5428292, 0, 0, 0, 1, 1,
0.6387522, -0.4129208, 0.2150867, 0, 0, 0, 1, 1,
0.6392106, -0.4108033, 1.556586, 0, 0, 0, 1, 1,
0.6431088, 2.276722, 0.7350929, 0, 0, 0, 1, 1,
0.6452826, 1.024417, 0.32313, 0, 0, 0, 1, 1,
0.6455313, 1.515361, 0.7510422, 0, 0, 0, 1, 1,
0.6468826, -0.09947973, 0.5600698, 0, 0, 0, 1, 1,
0.6540534, 0.9726462, 1.146459, 1, 1, 1, 1, 1,
0.6600537, 1.885898, -0.640535, 1, 1, 1, 1, 1,
0.6601558, -0.6189663, 4.275992, 1, 1, 1, 1, 1,
0.6602532, -0.2324145, 2.049738, 1, 1, 1, 1, 1,
0.6607808, -0.8996844, 3.20969, 1, 1, 1, 1, 1,
0.6651559, 1.225211, 0.5632057, 1, 1, 1, 1, 1,
0.6656016, -0.1649556, 0.8455466, 1, 1, 1, 1, 1,
0.6707545, 0.8510869, 3.64434, 1, 1, 1, 1, 1,
0.6722867, 1.086383, 1.09561, 1, 1, 1, 1, 1,
0.6795815, 0.1004383, 2.236874, 1, 1, 1, 1, 1,
0.680457, 0.7772148, 1.086262, 1, 1, 1, 1, 1,
0.6839575, -0.1134742, 2.309534, 1, 1, 1, 1, 1,
0.687812, 0.5812562, 0.7522429, 1, 1, 1, 1, 1,
0.6888794, 0.7459075, -0.1760797, 1, 1, 1, 1, 1,
0.6892919, -0.2262093, 2.275521, 1, 1, 1, 1, 1,
0.6936069, -2.057888, 5.727297, 0, 0, 1, 1, 1,
0.6974705, 0.9633166, -0.4536508, 1, 0, 0, 1, 1,
0.6976086, 1.455388, -0.7025245, 1, 0, 0, 1, 1,
0.7091944, -0.2422169, 2.96953, 1, 0, 0, 1, 1,
0.7323554, 1.185546, 0.9654813, 1, 0, 0, 1, 1,
0.7356753, 1.652267, -0.6352006, 1, 0, 0, 1, 1,
0.7429377, -2.120431, 1.972591, 0, 0, 0, 1, 1,
0.7461773, -0.4575914, 0.8828368, 0, 0, 0, 1, 1,
0.7481477, -0.5099725, 2.767457, 0, 0, 0, 1, 1,
0.7504063, 1.605711, 1.484452, 0, 0, 0, 1, 1,
0.752861, 1.769741, 1.418644, 0, 0, 0, 1, 1,
0.7540783, 1.629771, 1.297503, 0, 0, 0, 1, 1,
0.7558196, 1.264361, 1.417105, 0, 0, 0, 1, 1,
0.7576976, -0.9377573, 2.193392, 1, 1, 1, 1, 1,
0.7617421, -0.6443729, 2.835677, 1, 1, 1, 1, 1,
0.7618579, -0.9094449, 1.082021, 1, 1, 1, 1, 1,
0.7675084, -0.1299844, 1.831942, 1, 1, 1, 1, 1,
0.7680954, 0.6065514, 1.287235, 1, 1, 1, 1, 1,
0.7754922, 0.9431059, -0.2399267, 1, 1, 1, 1, 1,
0.7785634, 0.7582048, 2.746688, 1, 1, 1, 1, 1,
0.7798534, -0.4626469, 1.771922, 1, 1, 1, 1, 1,
0.7841283, -0.9150088, 2.6802, 1, 1, 1, 1, 1,
0.7843284, -0.3734648, -0.03184398, 1, 1, 1, 1, 1,
0.7881306, -0.2103507, 1.08085, 1, 1, 1, 1, 1,
0.7887415, -0.2316549, 0.2002791, 1, 1, 1, 1, 1,
0.7909388, -0.4357683, 3.440089, 1, 1, 1, 1, 1,
0.7921867, -1.455681, 3.912827, 1, 1, 1, 1, 1,
0.7927696, -0.2757517, 2.16766, 1, 1, 1, 1, 1,
0.7937707, 0.5939699, -1.426154, 0, 0, 1, 1, 1,
0.7981316, 0.3192334, 2.430502, 1, 0, 0, 1, 1,
0.8070363, 0.04387095, 0.824004, 1, 0, 0, 1, 1,
0.8125005, -2.394951, 2.819952, 1, 0, 0, 1, 1,
0.8139109, -1.930191, 3.579412, 1, 0, 0, 1, 1,
0.8165659, 1.15818, 0.1986976, 1, 0, 0, 1, 1,
0.8179776, 0.1715519, 1.534447, 0, 0, 0, 1, 1,
0.818052, -0.2590621, 1.63411, 0, 0, 0, 1, 1,
0.8187872, 2.30923, 0.8229834, 0, 0, 0, 1, 1,
0.8191509, -0.1571879, 1.644572, 0, 0, 0, 1, 1,
0.8204445, -0.3622818, 2.564228, 0, 0, 0, 1, 1,
0.8234906, 0.0933406, 1.712625, 0, 0, 0, 1, 1,
0.8286641, 1.17262, -0.3241661, 0, 0, 0, 1, 1,
0.8348001, -0.35079, 2.537385, 1, 1, 1, 1, 1,
0.8551354, 0.008374907, -0.1980244, 1, 1, 1, 1, 1,
0.8581653, -1.869703, 3.053691, 1, 1, 1, 1, 1,
0.8587685, 1.244991, 2.067893, 1, 1, 1, 1, 1,
0.8611996, -0.9891003, 3.996317, 1, 1, 1, 1, 1,
0.8643374, 1.16009, 0.004634386, 1, 1, 1, 1, 1,
0.8730081, -1.358809, 0.1991233, 1, 1, 1, 1, 1,
0.875092, 0.5448635, 0.0934986, 1, 1, 1, 1, 1,
0.8757698, 0.2337642, 1.688225, 1, 1, 1, 1, 1,
0.8778079, 0.9025283, 1.623212, 1, 1, 1, 1, 1,
0.8794921, -0.3933412, 3.557315, 1, 1, 1, 1, 1,
0.8797822, -0.7142603, 3.14411, 1, 1, 1, 1, 1,
0.8848406, -2.108735, 3.851064, 1, 1, 1, 1, 1,
0.8916627, 0.4910291, 3.666251, 1, 1, 1, 1, 1,
0.8939749, -0.6688622, 2.812361, 1, 1, 1, 1, 1,
0.894285, -0.9668233, 1.464076, 0, 0, 1, 1, 1,
0.897185, 0.1493579, 3.086198, 1, 0, 0, 1, 1,
0.8995057, 1.780489, 0.1239702, 1, 0, 0, 1, 1,
0.9048638, 1.542461, -0.5494775, 1, 0, 0, 1, 1,
0.912071, 0.2178696, 2.023903, 1, 0, 0, 1, 1,
0.9193451, 1.768249, -0.2809904, 1, 0, 0, 1, 1,
0.9262182, 0.2128926, 0.9857275, 0, 0, 0, 1, 1,
0.9301721, -0.2229262, 1.893641, 0, 0, 0, 1, 1,
0.9304146, -0.006879085, 2.457982, 0, 0, 0, 1, 1,
0.9381169, 0.3739142, -0.371396, 0, 0, 0, 1, 1,
0.9388059, -0.1980523, 2.572334, 0, 0, 0, 1, 1,
0.9426927, 0.2744883, 0.2724153, 0, 0, 0, 1, 1,
0.944418, -1.558138, 1.149037, 0, 0, 0, 1, 1,
0.9454018, 0.5644648, 0.4465862, 1, 1, 1, 1, 1,
0.9554952, 0.01608455, 0.9523879, 1, 1, 1, 1, 1,
0.9561243, 0.6572621, -0.1637257, 1, 1, 1, 1, 1,
0.9562172, 0.07892926, 2.833932, 1, 1, 1, 1, 1,
0.9588557, -1.17933, 3.211264, 1, 1, 1, 1, 1,
0.9603725, 0.4062968, 1.665987, 1, 1, 1, 1, 1,
0.9759176, 0.3001655, 3.108939, 1, 1, 1, 1, 1,
0.9764987, 0.8890073, 2.714998, 1, 1, 1, 1, 1,
0.9871593, 0.2756034, -0.1014038, 1, 1, 1, 1, 1,
0.9880884, -0.5226912, 0.3620649, 1, 1, 1, 1, 1,
0.9900789, 0.8256642, -1.495044, 1, 1, 1, 1, 1,
0.9941487, -1.086439, 2.405978, 1, 1, 1, 1, 1,
0.9948924, -2.007065, 2.852945, 1, 1, 1, 1, 1,
1.000934, 0.8108729, 0.6330748, 1, 1, 1, 1, 1,
1.003267, 0.6819708, -0.4083548, 1, 1, 1, 1, 1,
1.003298, -1.263912, 2.088228, 0, 0, 1, 1, 1,
1.006546, -2.062582, 3.23245, 1, 0, 0, 1, 1,
1.014083, -1.516392, 2.84744, 1, 0, 0, 1, 1,
1.016787, 0.7776941, -0.1615243, 1, 0, 0, 1, 1,
1.02408, -1.522282, 1.798917, 1, 0, 0, 1, 1,
1.034182, 0.03242031, 1.304687, 1, 0, 0, 1, 1,
1.04043, -0.8872575, 1.837052, 0, 0, 0, 1, 1,
1.042991, -0.3729987, 2.128822, 0, 0, 0, 1, 1,
1.046062, 1.558895, 1.972938, 0, 0, 0, 1, 1,
1.057407, -1.524144, 2.3789, 0, 0, 0, 1, 1,
1.060884, -0.7939737, 2.692066, 0, 0, 0, 1, 1,
1.065198, 0.8909691, 0.4926343, 0, 0, 0, 1, 1,
1.066843, 0.02454432, 1.25374, 0, 0, 0, 1, 1,
1.070272, 0.0781403, 0.04818005, 1, 1, 1, 1, 1,
1.074717, -0.1089378, 0.4609268, 1, 1, 1, 1, 1,
1.078765, 0.5875511, 0.1446139, 1, 1, 1, 1, 1,
1.080067, -0.8246309, 3.25325, 1, 1, 1, 1, 1,
1.083575, 0.1174343, 0.4717821, 1, 1, 1, 1, 1,
1.084493, 0.8878364, 1.438266, 1, 1, 1, 1, 1,
1.090795, 0.05762906, 1.286763, 1, 1, 1, 1, 1,
1.090913, -1.284225, 1.912837, 1, 1, 1, 1, 1,
1.093752, -1.251404, 3.45299, 1, 1, 1, 1, 1,
1.098237, 0.9414162, 1.844246, 1, 1, 1, 1, 1,
1.116719, 1.123532, 0.651162, 1, 1, 1, 1, 1,
1.126018, 0.9758066, 0.9449194, 1, 1, 1, 1, 1,
1.129917, 1.63734, 0.5907596, 1, 1, 1, 1, 1,
1.132932, 0.1405661, 0.4585389, 1, 1, 1, 1, 1,
1.150381, -1.053223, 3.550689, 1, 1, 1, 1, 1,
1.153903, 0.3083588, -0.2812877, 0, 0, 1, 1, 1,
1.15584, 0.05150447, 2.262133, 1, 0, 0, 1, 1,
1.158928, 0.3517726, 1.315868, 1, 0, 0, 1, 1,
1.161464, -0.2441756, 2.690285, 1, 0, 0, 1, 1,
1.163766, 0.1344025, 2.036137, 1, 0, 0, 1, 1,
1.168886, -0.7056799, 1.88795, 1, 0, 0, 1, 1,
1.172916, -0.1581353, 1.188576, 0, 0, 0, 1, 1,
1.173099, -1.305334, 2.493028, 0, 0, 0, 1, 1,
1.174147, -0.1532178, 3.06904, 0, 0, 0, 1, 1,
1.194841, 0.08470874, 2.313743, 0, 0, 0, 1, 1,
1.197858, -0.05459894, 1.017217, 0, 0, 0, 1, 1,
1.198609, 0.9419095, -0.3799678, 0, 0, 0, 1, 1,
1.202196, -1.726941, 2.604437, 0, 0, 0, 1, 1,
1.208532, 0.2167647, 3.447896, 1, 1, 1, 1, 1,
1.212269, 0.1446115, 0.4938368, 1, 1, 1, 1, 1,
1.214779, 1.320539, 1.138927, 1, 1, 1, 1, 1,
1.215548, -0.2374859, 1.45342, 1, 1, 1, 1, 1,
1.222011, -0.3579989, 1.895937, 1, 1, 1, 1, 1,
1.238948, 1.628977, -0.03610384, 1, 1, 1, 1, 1,
1.254625, 2.615729, 0.9971169, 1, 1, 1, 1, 1,
1.255743, -0.4585058, 3.07941, 1, 1, 1, 1, 1,
1.269451, 1.230688, -0.3181432, 1, 1, 1, 1, 1,
1.286416, -0.736617, 2.219927, 1, 1, 1, 1, 1,
1.29124, -1.16575, 3.948925, 1, 1, 1, 1, 1,
1.294659, -0.8531685, 3.595526, 1, 1, 1, 1, 1,
1.305621, 0.3485679, 2.349146, 1, 1, 1, 1, 1,
1.314156, 0.1185079, 1.998152, 1, 1, 1, 1, 1,
1.318, -0.2402613, -0.2333839, 1, 1, 1, 1, 1,
1.333978, -0.8316552, 2.839782, 0, 0, 1, 1, 1,
1.338055, -2.040832, 1.910683, 1, 0, 0, 1, 1,
1.349265, -1.67368, 2.863855, 1, 0, 0, 1, 1,
1.354171, 0.2347241, 1.007706, 1, 0, 0, 1, 1,
1.357096, -0.001587068, 2.256026, 1, 0, 0, 1, 1,
1.391508, -0.390683, 2.308801, 1, 0, 0, 1, 1,
1.397171, -0.6981847, 1.209327, 0, 0, 0, 1, 1,
1.413146, -0.08960608, 0.8279887, 0, 0, 0, 1, 1,
1.422552, 0.6835211, 1.371712, 0, 0, 0, 1, 1,
1.423082, 0.9105864, -0.4548883, 0, 0, 0, 1, 1,
1.431726, -1.01238, 1.872958, 0, 0, 0, 1, 1,
1.433672, 0.6843897, 2.559502, 0, 0, 0, 1, 1,
1.452132, 0.9886126, 1.579954, 0, 0, 0, 1, 1,
1.456371, 0.4015508, 0.0669369, 1, 1, 1, 1, 1,
1.461699, 0.7961041, 1.224973, 1, 1, 1, 1, 1,
1.466331, -1.076449, 1.177808, 1, 1, 1, 1, 1,
1.47906, -0.2522083, 2.720969, 1, 1, 1, 1, 1,
1.487048, -0.8950951, 2.529389, 1, 1, 1, 1, 1,
1.499399, 1.03005, 2.546757, 1, 1, 1, 1, 1,
1.50598, -1.091672, 1.290106, 1, 1, 1, 1, 1,
1.506115, -0.5098419, 2.658935, 1, 1, 1, 1, 1,
1.509692, 0.6031635, 0.1241217, 1, 1, 1, 1, 1,
1.511213, -1.1805, 1.133205, 1, 1, 1, 1, 1,
1.523314, 1.318806, -0.8058692, 1, 1, 1, 1, 1,
1.524578, 0.6863111, 2.060201, 1, 1, 1, 1, 1,
1.527983, 0.2400378, 1.890553, 1, 1, 1, 1, 1,
1.533821, -0.02019416, 1.299754, 1, 1, 1, 1, 1,
1.533859, -1.215459, 1.878585, 1, 1, 1, 1, 1,
1.537805, 0.1620505, 0.8805864, 0, 0, 1, 1, 1,
1.539242, 0.438053, 0.8030477, 1, 0, 0, 1, 1,
1.544234, -0.7716318, 2.257504, 1, 0, 0, 1, 1,
1.592336, -0.6250642, 1.222884, 1, 0, 0, 1, 1,
1.598047, -0.2891022, 3.499774, 1, 0, 0, 1, 1,
1.610442, -1.093246, 2.471819, 1, 0, 0, 1, 1,
1.622747, 1.514145, 0.7521209, 0, 0, 0, 1, 1,
1.643034, -0.01020137, 0.9974352, 0, 0, 0, 1, 1,
1.656498, -2.243034, 2.344686, 0, 0, 0, 1, 1,
1.656985, -0.3997784, -0.4148579, 0, 0, 0, 1, 1,
1.6859, 0.07155571, 1.180264, 0, 0, 0, 1, 1,
1.703591, -0.03210524, 1.2547, 0, 0, 0, 1, 1,
1.709765, 0.2185934, 1.298352, 0, 0, 0, 1, 1,
1.7222, -1.930519, 1.468094, 1, 1, 1, 1, 1,
1.726086, -0.2782536, 1.183251, 1, 1, 1, 1, 1,
1.732466, 0.5894499, 2.170243, 1, 1, 1, 1, 1,
1.736439, 0.5492764, 2.350801, 1, 1, 1, 1, 1,
1.753868, -0.7531894, 1.695228, 1, 1, 1, 1, 1,
1.789992, 0.1904498, 1.464995, 1, 1, 1, 1, 1,
1.793161, 1.017298, 0.3252334, 1, 1, 1, 1, 1,
1.800605, -0.4227061, 2.569855, 1, 1, 1, 1, 1,
1.821972, -0.5201649, 1.925111, 1, 1, 1, 1, 1,
1.835901, 1.178094, 0.09539516, 1, 1, 1, 1, 1,
1.85844, 0.2806623, 1.990841, 1, 1, 1, 1, 1,
1.878744, -0.3049974, 1.697621, 1, 1, 1, 1, 1,
1.90894, 0.1037969, 0.5886559, 1, 1, 1, 1, 1,
1.921457, -1.309659, 1.02914, 1, 1, 1, 1, 1,
1.927456, 1.021713, 1.402252, 1, 1, 1, 1, 1,
1.944356, 0.2586883, 0.7567214, 0, 0, 1, 1, 1,
1.969509, 0.4596114, 2.190063, 1, 0, 0, 1, 1,
1.978557, -1.991356, 1.730938, 1, 0, 0, 1, 1,
2.033779, -0.9058204, 1.451415, 1, 0, 0, 1, 1,
2.037014, 0.1042141, -0.3978357, 1, 0, 0, 1, 1,
2.066884, -1.212063, 3.163874, 1, 0, 0, 1, 1,
2.114559, -1.5833, 1.294895, 0, 0, 0, 1, 1,
2.140184, 0.7736583, 1.659456, 0, 0, 0, 1, 1,
2.165477, -0.3448278, 1.420882, 0, 0, 0, 1, 1,
2.190558, 0.3726898, 2.767892, 0, 0, 0, 1, 1,
2.242665, -0.07634066, 0.8181843, 0, 0, 0, 1, 1,
2.265404, -0.5053712, 1.570042, 0, 0, 0, 1, 1,
2.32684, 1.295859, 1.442065, 0, 0, 0, 1, 1,
2.368755, -0.2746248, 1.887272, 1, 1, 1, 1, 1,
2.374316, -0.5527412, 2.30941, 1, 1, 1, 1, 1,
2.583389, 1.066641, 3.24645, 1, 1, 1, 1, 1,
2.63876, 1.059245, 1.971795, 1, 1, 1, 1, 1,
2.639889, 0.190284, 0.6106772, 1, 1, 1, 1, 1,
2.654592, 1.194953, -0.8565606, 1, 1, 1, 1, 1,
2.781921, 0.2830266, 2.471856, 1, 1, 1, 1, 1
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
var radius = 9.607581;
var distance = 33.74622;
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
mvMatrix.translate( 0.08721721, 0.1470208, -0.1580493 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.74622);
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
