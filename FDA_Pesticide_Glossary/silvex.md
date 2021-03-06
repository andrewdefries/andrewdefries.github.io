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
-2.971047, 0.1242721, -2.969755, 1, 0, 0, 1,
-2.891727, 0.4164126, -1.449178, 1, 0.007843138, 0, 1,
-2.766374, -1.862835, -2.632524, 1, 0.01176471, 0, 1,
-2.535792, -0.7777539, -2.12058, 1, 0.01960784, 0, 1,
-2.392247, 0.3053439, -0.8381123, 1, 0.02352941, 0, 1,
-2.382953, -0.1708227, -0.6017997, 1, 0.03137255, 0, 1,
-2.356229, -1.436445, -1.624115, 1, 0.03529412, 0, 1,
-2.324197, -0.2127617, -1.801469, 1, 0.04313726, 0, 1,
-2.289252, 1.482117, -2.583469, 1, 0.04705882, 0, 1,
-2.222985, -0.5376107, -0.148963, 1, 0.05490196, 0, 1,
-2.172334, -1.670437, -1.076991, 1, 0.05882353, 0, 1,
-2.150978, -2.740562, -4.260985, 1, 0.06666667, 0, 1,
-2.136599, -0.738982, -1.241725, 1, 0.07058824, 0, 1,
-2.122738, -0.2212899, -2.314317, 1, 0.07843138, 0, 1,
-2.082349, -1.168571, -1.751387, 1, 0.08235294, 0, 1,
-2.075101, 0.7231708, -0.8066446, 1, 0.09019608, 0, 1,
-1.991444, -0.3671097, -3.125849, 1, 0.09411765, 0, 1,
-1.980288, -0.1472355, -2.395631, 1, 0.1019608, 0, 1,
-1.973491, 1.213724, -1.308078, 1, 0.1098039, 0, 1,
-1.948614, 1.427387, -2.477446, 1, 0.1137255, 0, 1,
-1.923125, -0.9153495, -2.381037, 1, 0.1215686, 0, 1,
-1.922259, -0.01410169, -1.772946, 1, 0.1254902, 0, 1,
-1.921533, -0.3713811, -2.349146, 1, 0.1333333, 0, 1,
-1.910467, 0.2457906, -2.754165, 1, 0.1372549, 0, 1,
-1.910132, 1.76218, -1.108003, 1, 0.145098, 0, 1,
-1.88847, -0.7378509, -1.387871, 1, 0.1490196, 0, 1,
-1.884536, 0.8526899, -3.080033, 1, 0.1568628, 0, 1,
-1.853143, 0.6005899, -1.898, 1, 0.1607843, 0, 1,
-1.837924, 0.5761909, -3.79565, 1, 0.1686275, 0, 1,
-1.835805, 0.3704335, -0.9389411, 1, 0.172549, 0, 1,
-1.823188, -0.09807449, -2.418739, 1, 0.1803922, 0, 1,
-1.797955, -0.6686478, -2.491415, 1, 0.1843137, 0, 1,
-1.797279, 0.4547261, -1.594267, 1, 0.1921569, 0, 1,
-1.793127, -0.723636, -2.258764, 1, 0.1960784, 0, 1,
-1.789032, -1.052336, -2.420208, 1, 0.2039216, 0, 1,
-1.778057, -0.1280547, -2.369225, 1, 0.2117647, 0, 1,
-1.767181, -0.0445082, -0.4984134, 1, 0.2156863, 0, 1,
-1.751651, -0.8726104, -1.939191, 1, 0.2235294, 0, 1,
-1.734964, 0.06923798, -1.770066, 1, 0.227451, 0, 1,
-1.72489, -0.1748466, -1.866459, 1, 0.2352941, 0, 1,
-1.71414, -0.8439932, -0.517665, 1, 0.2392157, 0, 1,
-1.713416, 0.1556578, -0.6257012, 1, 0.2470588, 0, 1,
-1.687327, 0.4090997, -2.46989, 1, 0.2509804, 0, 1,
-1.673727, -1.478606, 0.4908902, 1, 0.2588235, 0, 1,
-1.666673, 0.1303154, 0.5847635, 1, 0.2627451, 0, 1,
-1.658977, -0.9334024, -0.7333103, 1, 0.2705882, 0, 1,
-1.650668, -0.01263592, -2.006851, 1, 0.2745098, 0, 1,
-1.643113, -0.9982972, -2.460836, 1, 0.282353, 0, 1,
-1.642407, 0.2640001, -1.135824, 1, 0.2862745, 0, 1,
-1.641934, -0.3717255, -1.764075, 1, 0.2941177, 0, 1,
-1.641656, -0.0613245, -1.725364, 1, 0.3019608, 0, 1,
-1.629123, 0.09258857, -0.9309053, 1, 0.3058824, 0, 1,
-1.617867, -1.433174, -1.626973, 1, 0.3137255, 0, 1,
-1.615231, -1.463429, -4.314113, 1, 0.3176471, 0, 1,
-1.611445, -0.3489111, -1.144457, 1, 0.3254902, 0, 1,
-1.592933, -0.7515325, -0.6055065, 1, 0.3294118, 0, 1,
-1.592511, 0.05778072, -2.271876, 1, 0.3372549, 0, 1,
-1.566045, 1.066044, 0.09173037, 1, 0.3411765, 0, 1,
-1.552982, 1.773361, -1.254773, 1, 0.3490196, 0, 1,
-1.531097, 0.9551612, -2.472439, 1, 0.3529412, 0, 1,
-1.529135, -0.6773019, -1.935257, 1, 0.3607843, 0, 1,
-1.526374, -0.6262339, -2.167978, 1, 0.3647059, 0, 1,
-1.511135, 1.730978, 0.4398954, 1, 0.372549, 0, 1,
-1.506508, 0.490326, -1.45954, 1, 0.3764706, 0, 1,
-1.50447, -1.058639, -4.982753, 1, 0.3843137, 0, 1,
-1.496673, 1.060333, -2.069259, 1, 0.3882353, 0, 1,
-1.486087, -1.191837, -2.927808, 1, 0.3960784, 0, 1,
-1.48208, -0.271646, -0.4982461, 1, 0.4039216, 0, 1,
-1.467176, -1.144457, -2.852211, 1, 0.4078431, 0, 1,
-1.460899, 0.4598462, -2.369581, 1, 0.4156863, 0, 1,
-1.451165, 1.656371, -1.760185, 1, 0.4196078, 0, 1,
-1.446418, 0.9544258, 0.06197465, 1, 0.427451, 0, 1,
-1.443369, -0.2767904, -2.047324, 1, 0.4313726, 0, 1,
-1.436015, -0.7873823, -2.110001, 1, 0.4392157, 0, 1,
-1.429605, -1.523569, -1.013486, 1, 0.4431373, 0, 1,
-1.427856, -0.1664056, -1.772727, 1, 0.4509804, 0, 1,
-1.425726, 0.1835577, -1.641994, 1, 0.454902, 0, 1,
-1.409357, -0.574901, -1.548705, 1, 0.4627451, 0, 1,
-1.404356, 0.4621145, -1.937721, 1, 0.4666667, 0, 1,
-1.394282, -1.817944, -2.596981, 1, 0.4745098, 0, 1,
-1.394044, 0.9238904, -1.084378, 1, 0.4784314, 0, 1,
-1.392769, 1.654478, -0.2449001, 1, 0.4862745, 0, 1,
-1.388247, 0.216107, -0.132837, 1, 0.4901961, 0, 1,
-1.388205, 1.498433, -1.779527, 1, 0.4980392, 0, 1,
-1.378453, -1.035716, -1.52971, 1, 0.5058824, 0, 1,
-1.375013, 0.006158984, -2.397162, 1, 0.509804, 0, 1,
-1.369604, -0.4592936, -1.287601, 1, 0.5176471, 0, 1,
-1.364443, -0.7193424, -1.933501, 1, 0.5215687, 0, 1,
-1.358937, 0.8702729, 1.700845, 1, 0.5294118, 0, 1,
-1.35321, 0.8813587, -2.144263, 1, 0.5333334, 0, 1,
-1.348947, -0.06486802, -0.1283527, 1, 0.5411765, 0, 1,
-1.347028, -1.648583, -3.167194, 1, 0.5450981, 0, 1,
-1.343613, -0.007418232, -2.938131, 1, 0.5529412, 0, 1,
-1.342254, -0.6364193, -0.2696037, 1, 0.5568628, 0, 1,
-1.341405, -0.7981935, -2.306683, 1, 0.5647059, 0, 1,
-1.339146, 1.790432, -0.4865318, 1, 0.5686275, 0, 1,
-1.338475, 2.427376, -0.7409234, 1, 0.5764706, 0, 1,
-1.335196, -0.2699258, -0.08758447, 1, 0.5803922, 0, 1,
-1.31288, -1.615109, -2.169771, 1, 0.5882353, 0, 1,
-1.305018, 0.1170847, -1.353731, 1, 0.5921569, 0, 1,
-1.290457, -0.1564938, -1.753401, 1, 0.6, 0, 1,
-1.269923, -0.4702729, -0.621724, 1, 0.6078432, 0, 1,
-1.265656, 0.4432041, -1.523503, 1, 0.6117647, 0, 1,
-1.265314, 0.6868428, -1.643518, 1, 0.6196079, 0, 1,
-1.253061, -0.6572728, -1.530468, 1, 0.6235294, 0, 1,
-1.23885, -0.03310929, -0.8970042, 1, 0.6313726, 0, 1,
-1.237594, -0.6038438, -1.784314, 1, 0.6352941, 0, 1,
-1.227928, 1.052561, -1.66106, 1, 0.6431373, 0, 1,
-1.220714, 1.307276, -2.316283, 1, 0.6470588, 0, 1,
-1.20474, 1.57694, -0.659113, 1, 0.654902, 0, 1,
-1.204529, -0.07087789, -1.221705, 1, 0.6588235, 0, 1,
-1.196415, 0.1729819, -2.292831, 1, 0.6666667, 0, 1,
-1.195492, -0.2229761, -0.8867847, 1, 0.6705883, 0, 1,
-1.192118, 0.6532653, -1.052709, 1, 0.6784314, 0, 1,
-1.182766, -0.8152699, -2.057331, 1, 0.682353, 0, 1,
-1.175157, -0.3828101, 0.2550455, 1, 0.6901961, 0, 1,
-1.173525, 0.3096682, -2.023152, 1, 0.6941177, 0, 1,
-1.172421, -0.3106315, -1.922085, 1, 0.7019608, 0, 1,
-1.168831, 1.081153, -0.629995, 1, 0.7098039, 0, 1,
-1.168065, -1.408449, -1.893112, 1, 0.7137255, 0, 1,
-1.167587, -0.1167935, -2.114474, 1, 0.7215686, 0, 1,
-1.162038, -0.61851, -1.747509, 1, 0.7254902, 0, 1,
-1.161616, 0.9665825, 1.996442, 1, 0.7333333, 0, 1,
-1.160355, 0.1002199, -1.141711, 1, 0.7372549, 0, 1,
-1.160189, -0.3451291, 0.6221419, 1, 0.7450981, 0, 1,
-1.152337, 0.3121836, -0.8144214, 1, 0.7490196, 0, 1,
-1.147394, -0.7377744, -0.257827, 1, 0.7568628, 0, 1,
-1.137006, 0.8372367, -0.7896743, 1, 0.7607843, 0, 1,
-1.133241, -1.218795, -1.107286, 1, 0.7686275, 0, 1,
-1.131857, 0.8005459, 0.06735555, 1, 0.772549, 0, 1,
-1.130188, 1.048615, -1.853686, 1, 0.7803922, 0, 1,
-1.126308, -0.1308852, -1.432959, 1, 0.7843137, 0, 1,
-1.125479, -1.164823, -2.532673, 1, 0.7921569, 0, 1,
-1.121578, -1.627858, -2.289809, 1, 0.7960784, 0, 1,
-1.121175, 0.9154193, 0.239166, 1, 0.8039216, 0, 1,
-1.120235, 1.37195, -0.1279946, 1, 0.8117647, 0, 1,
-1.118251, 0.3534052, -0.2229764, 1, 0.8156863, 0, 1,
-1.109692, 1.082484, -1.591663, 1, 0.8235294, 0, 1,
-1.109, -1.934025, -3.229215, 1, 0.827451, 0, 1,
-1.107542, -0.8015571, -1.868939, 1, 0.8352941, 0, 1,
-1.095553, -1.563844, -2.932552, 1, 0.8392157, 0, 1,
-1.083576, 0.97526, -1.441173, 1, 0.8470588, 0, 1,
-1.08265, 0.3968602, -2.765007, 1, 0.8509804, 0, 1,
-1.082631, 0.4510343, -1.257298, 1, 0.8588235, 0, 1,
-1.077992, -0.7537376, -0.671701, 1, 0.8627451, 0, 1,
-1.076591, -0.3340147, -1.462362, 1, 0.8705882, 0, 1,
-1.070969, 1.841985, -1.530288, 1, 0.8745098, 0, 1,
-1.068071, -2.66502, -3.974658, 1, 0.8823529, 0, 1,
-1.047454, -1.626234, -2.039769, 1, 0.8862745, 0, 1,
-1.038134, -1.247226, -2.960115, 1, 0.8941177, 0, 1,
-1.035909, -0.6996073, -1.176971, 1, 0.8980392, 0, 1,
-1.027054, 1.39425, 0.8921078, 1, 0.9058824, 0, 1,
-1.022491, -0.2734954, -1.978549, 1, 0.9137255, 0, 1,
-1.020065, -1.058845, -3.242576, 1, 0.9176471, 0, 1,
-1.015882, 0.6793857, -2.051265, 1, 0.9254902, 0, 1,
-1.00705, -0.09778806, -0.9600804, 1, 0.9294118, 0, 1,
-1.00077, -0.05405023, -1.685008, 1, 0.9372549, 0, 1,
-0.9910221, -0.675576, -3.470743, 1, 0.9411765, 0, 1,
-0.9893162, 1.181811, -1.678373, 1, 0.9490196, 0, 1,
-0.986207, 0.3378655, -0.6932018, 1, 0.9529412, 0, 1,
-0.9856225, 1.575693, -0.4735519, 1, 0.9607843, 0, 1,
-0.9728712, -1.686846, -2.875202, 1, 0.9647059, 0, 1,
-0.9616188, 0.3992095, -1.93126, 1, 0.972549, 0, 1,
-0.9564702, 0.6812301, -2.334299, 1, 0.9764706, 0, 1,
-0.9522779, 0.1651342, -2.998792, 1, 0.9843137, 0, 1,
-0.9487144, -0.5639741, -3.385292, 1, 0.9882353, 0, 1,
-0.9448715, 0.04883008, -0.245679, 1, 0.9960784, 0, 1,
-0.9420027, -2.322251, -1.772647, 0.9960784, 1, 0, 1,
-0.9347058, -0.3206411, -2.762969, 0.9921569, 1, 0, 1,
-0.9292186, 0.6037532, -1.676891, 0.9843137, 1, 0, 1,
-0.9217362, -0.05082186, -0.407049, 0.9803922, 1, 0, 1,
-0.919987, -0.6579385, -3.5739, 0.972549, 1, 0, 1,
-0.9193769, -1.447051, -4.259102, 0.9686275, 1, 0, 1,
-0.917741, -1.886505, -2.830007, 0.9607843, 1, 0, 1,
-0.9128799, 0.3632836, -0.1901946, 0.9568627, 1, 0, 1,
-0.9111075, 0.3848341, 1.242656, 0.9490196, 1, 0, 1,
-0.9021084, 0.2824258, -3.542951, 0.945098, 1, 0, 1,
-0.8974277, -1.034693, -3.349684, 0.9372549, 1, 0, 1,
-0.8973073, 0.06245488, -3.611269, 0.9333333, 1, 0, 1,
-0.8968957, -2.212121, -3.465759, 0.9254902, 1, 0, 1,
-0.8957887, 0.3230259, -0.6931844, 0.9215686, 1, 0, 1,
-0.8939936, -1.42017, -2.592465, 0.9137255, 1, 0, 1,
-0.8916854, -0.6120378, -1.275694, 0.9098039, 1, 0, 1,
-0.8914691, 0.9830528, -0.460507, 0.9019608, 1, 0, 1,
-0.8870941, 0.4868407, -0.2647403, 0.8941177, 1, 0, 1,
-0.8857216, -1.877442, -3.586798, 0.8901961, 1, 0, 1,
-0.8832207, 0.6570743, -1.439615, 0.8823529, 1, 0, 1,
-0.881169, -0.06608564, -0.4201038, 0.8784314, 1, 0, 1,
-0.880531, -1.556413, -3.995872, 0.8705882, 1, 0, 1,
-0.8799599, 0.2019486, 0.08005912, 0.8666667, 1, 0, 1,
-0.8795586, -1.030837, -2.320814, 0.8588235, 1, 0, 1,
-0.8789159, -1.870654, -0.7059429, 0.854902, 1, 0, 1,
-0.8746316, 2.193182, 0.7083187, 0.8470588, 1, 0, 1,
-0.8714318, -0.7136578, -0.446088, 0.8431373, 1, 0, 1,
-0.8656214, -0.01174407, -1.042022, 0.8352941, 1, 0, 1,
-0.8643092, -0.9754529, -2.1037, 0.8313726, 1, 0, 1,
-0.8627389, -0.6088728, -0.2439138, 0.8235294, 1, 0, 1,
-0.8571188, -0.2112574, -2.775938, 0.8196079, 1, 0, 1,
-0.8566464, 0.4675286, -2.415377, 0.8117647, 1, 0, 1,
-0.8565853, -0.06302185, -1.348575, 0.8078431, 1, 0, 1,
-0.8463331, 1.524292, -0.7867852, 0.8, 1, 0, 1,
-0.8430988, 1.301738, -2.219383, 0.7921569, 1, 0, 1,
-0.8423701, 2.012588, 0.7213448, 0.7882353, 1, 0, 1,
-0.840417, 0.7382214, -1.446139, 0.7803922, 1, 0, 1,
-0.8372011, 0.8024888, -1.272239, 0.7764706, 1, 0, 1,
-0.8271222, 1.339162, -1.042084, 0.7686275, 1, 0, 1,
-0.8154912, -1.661556, -2.883738, 0.7647059, 1, 0, 1,
-0.8142065, 1.07394, -2.447408, 0.7568628, 1, 0, 1,
-0.8109989, 0.5981107, -0.6445643, 0.7529412, 1, 0, 1,
-0.8084797, -0.6922188, -2.375853, 0.7450981, 1, 0, 1,
-0.8077631, -0.4486229, -0.2979178, 0.7411765, 1, 0, 1,
-0.8001475, 0.965501, -0.892561, 0.7333333, 1, 0, 1,
-0.7999797, 0.1069872, -2.56059, 0.7294118, 1, 0, 1,
-0.7982462, 1.18296, 0.1803001, 0.7215686, 1, 0, 1,
-0.7958034, -0.3512642, -1.428979, 0.7176471, 1, 0, 1,
-0.7856613, -0.4842843, -1.807636, 0.7098039, 1, 0, 1,
-0.7828854, 2.448298, -1.251015, 0.7058824, 1, 0, 1,
-0.7815021, 0.1379324, -1.777968, 0.6980392, 1, 0, 1,
-0.7777576, 1.383072, -1.332624, 0.6901961, 1, 0, 1,
-0.7743237, -0.2351075, -1.791782, 0.6862745, 1, 0, 1,
-0.773044, -2.284316, -1.442322, 0.6784314, 1, 0, 1,
-0.7651897, -0.07157335, -1.072593, 0.6745098, 1, 0, 1,
-0.7643002, -0.6275515, -2.99681, 0.6666667, 1, 0, 1,
-0.7614455, 2.002922, -0.07987968, 0.6627451, 1, 0, 1,
-0.7593061, 1.295358, -0.1348614, 0.654902, 1, 0, 1,
-0.7565826, -1.280107, -3.80658, 0.6509804, 1, 0, 1,
-0.755343, 1.793918, 0.4095985, 0.6431373, 1, 0, 1,
-0.7494204, 0.04447755, -0.9134015, 0.6392157, 1, 0, 1,
-0.7474558, -1.420958, -3.164011, 0.6313726, 1, 0, 1,
-0.7474379, -0.5763478, -2.88149, 0.627451, 1, 0, 1,
-0.7444242, 0.6555047, -1.471573, 0.6196079, 1, 0, 1,
-0.7436798, -0.6050571, -1.918181, 0.6156863, 1, 0, 1,
-0.7430894, -0.449014, -1.638552, 0.6078432, 1, 0, 1,
-0.7394129, -0.9533658, -2.487446, 0.6039216, 1, 0, 1,
-0.7381299, -0.01012553, -0.4552, 0.5960785, 1, 0, 1,
-0.731119, 0.2024991, -0.8801675, 0.5882353, 1, 0, 1,
-0.7293298, -0.2941856, -1.58091, 0.5843138, 1, 0, 1,
-0.7276375, -0.6370581, -1.612937, 0.5764706, 1, 0, 1,
-0.7255507, 2.312486, 0.1878092, 0.572549, 1, 0, 1,
-0.7244373, 0.4711245, -0.3121521, 0.5647059, 1, 0, 1,
-0.7096528, -1.283525, -1.740568, 0.5607843, 1, 0, 1,
-0.7095991, 0.8555595, 0.493023, 0.5529412, 1, 0, 1,
-0.7071415, -0.524729, -1.861827, 0.5490196, 1, 0, 1,
-0.7068669, 1.017609, -0.2391109, 0.5411765, 1, 0, 1,
-0.7060243, -1.623086, -2.589303, 0.5372549, 1, 0, 1,
-0.7047707, -0.2898699, -2.077039, 0.5294118, 1, 0, 1,
-0.7037553, 0.2316057, -3.28615, 0.5254902, 1, 0, 1,
-0.7006444, 0.2031705, -2.606273, 0.5176471, 1, 0, 1,
-0.6989967, -0.7569888, -2.225138, 0.5137255, 1, 0, 1,
-0.6947451, -0.474298, -2.888402, 0.5058824, 1, 0, 1,
-0.6933697, 2.102737, -1.253062, 0.5019608, 1, 0, 1,
-0.6921991, -0.7274451, -2.689392, 0.4941176, 1, 0, 1,
-0.6887474, 0.3059294, -2.020781, 0.4862745, 1, 0, 1,
-0.6851255, -1.480346, -1.760475, 0.4823529, 1, 0, 1,
-0.6795505, -0.04691605, -2.610327, 0.4745098, 1, 0, 1,
-0.6724011, -0.4569468, -2.760591, 0.4705882, 1, 0, 1,
-0.667256, 0.4634064, -2.782845, 0.4627451, 1, 0, 1,
-0.6505764, -2.200191, -3.30621, 0.4588235, 1, 0, 1,
-0.6494688, 1.112097, -0.7650785, 0.4509804, 1, 0, 1,
-0.648813, 1.055541, -3.248004, 0.4470588, 1, 0, 1,
-0.6383201, 1.140601, -1.861419, 0.4392157, 1, 0, 1,
-0.6378139, -0.4784082, -3.647602, 0.4352941, 1, 0, 1,
-0.6355941, 1.04944, -1.101739, 0.427451, 1, 0, 1,
-0.6349317, 0.2193769, -3.253505, 0.4235294, 1, 0, 1,
-0.6344144, 0.01001612, -0.3891704, 0.4156863, 1, 0, 1,
-0.6324558, 0.8313096, -0.7838393, 0.4117647, 1, 0, 1,
-0.6292077, -0.6408942, -2.914927, 0.4039216, 1, 0, 1,
-0.6255013, 0.1284591, -1.445354, 0.3960784, 1, 0, 1,
-0.6249678, 2.142319, 0.6853448, 0.3921569, 1, 0, 1,
-0.6246192, -0.2152154, -2.369698, 0.3843137, 1, 0, 1,
-0.6231664, -1.754781, -3.954004, 0.3803922, 1, 0, 1,
-0.6207086, 0.2181251, -0.7811834, 0.372549, 1, 0, 1,
-0.6185878, -0.919751, -1.635653, 0.3686275, 1, 0, 1,
-0.6118134, 0.9320782, -0.8877958, 0.3607843, 1, 0, 1,
-0.6112694, -1.236701, -2.211683, 0.3568628, 1, 0, 1,
-0.6060129, 0.3620354, -1.450439, 0.3490196, 1, 0, 1,
-0.6051679, -0.2125131, -1.516467, 0.345098, 1, 0, 1,
-0.5981813, 0.9980144, -0.9746941, 0.3372549, 1, 0, 1,
-0.59745, 1.6194, -0.3420399, 0.3333333, 1, 0, 1,
-0.5970904, 0.3509066, -0.8756965, 0.3254902, 1, 0, 1,
-0.5924241, 0.1817038, -1.093246, 0.3215686, 1, 0, 1,
-0.5909368, -0.2408254, -1.074982, 0.3137255, 1, 0, 1,
-0.5908601, 1.241292, 0.1341193, 0.3098039, 1, 0, 1,
-0.5886412, 1.213087, -0.915634, 0.3019608, 1, 0, 1,
-0.583516, -0.5777515, -1.908746, 0.2941177, 1, 0, 1,
-0.5791227, -0.9909142, -3.066266, 0.2901961, 1, 0, 1,
-0.578481, -1.686773, -3.949137, 0.282353, 1, 0, 1,
-0.5774429, -0.09158545, -2.291064, 0.2784314, 1, 0, 1,
-0.572733, -1.435186, -2.762716, 0.2705882, 1, 0, 1,
-0.5720408, -0.2377134, -2.306074, 0.2666667, 1, 0, 1,
-0.567023, 0.9287361, -1.525148, 0.2588235, 1, 0, 1,
-0.5647889, -1.659788, -2.770361, 0.254902, 1, 0, 1,
-0.5645209, 0.9962012, -0.8581911, 0.2470588, 1, 0, 1,
-0.5641374, -0.5719343, -1.849189, 0.2431373, 1, 0, 1,
-0.5612333, 1.187619, -1.793288, 0.2352941, 1, 0, 1,
-0.5520784, 0.6075609, -0.8738746, 0.2313726, 1, 0, 1,
-0.5487651, 1.749903, 0.1073233, 0.2235294, 1, 0, 1,
-0.5469508, -0.5249572, -2.772566, 0.2196078, 1, 0, 1,
-0.5458291, -0.1919573, -0.4168389, 0.2117647, 1, 0, 1,
-0.541247, -2.38324, -3.709476, 0.2078431, 1, 0, 1,
-0.5321368, 1.420964, -1.868045, 0.2, 1, 0, 1,
-0.5234202, -0.3987776, -0.9438774, 0.1921569, 1, 0, 1,
-0.5198745, -0.2048342, -2.086317, 0.1882353, 1, 0, 1,
-0.5197902, -0.9854303, -3.127942, 0.1803922, 1, 0, 1,
-0.519444, -0.3759834, -2.595124, 0.1764706, 1, 0, 1,
-0.5176936, -0.2582607, -1.183322, 0.1686275, 1, 0, 1,
-0.5113585, 0.1643183, -0.469944, 0.1647059, 1, 0, 1,
-0.5062383, -0.3357713, -2.134923, 0.1568628, 1, 0, 1,
-0.5059131, 1.337409, 0.1733566, 0.1529412, 1, 0, 1,
-0.4981915, 0.1269652, -1.853432, 0.145098, 1, 0, 1,
-0.4974523, -1.146995, -2.496423, 0.1411765, 1, 0, 1,
-0.4905952, 0.07632115, -1.518893, 0.1333333, 1, 0, 1,
-0.4903428, -0.7487648, -2.968449, 0.1294118, 1, 0, 1,
-0.4894952, 0.662232, -0.2911392, 0.1215686, 1, 0, 1,
-0.4832605, -2.060986, -1.673604, 0.1176471, 1, 0, 1,
-0.4803817, -0.5355552, -2.669894, 0.1098039, 1, 0, 1,
-0.4752971, 1.197238, 1.528528, 0.1058824, 1, 0, 1,
-0.4718571, -1.161346, -5.546976, 0.09803922, 1, 0, 1,
-0.4698389, 1.043228, -1.007178, 0.09019608, 1, 0, 1,
-0.4689529, 1.047737, 0.1297631, 0.08627451, 1, 0, 1,
-0.4682416, 0.4816442, 1.12008, 0.07843138, 1, 0, 1,
-0.4613521, -1.959597, -3.288585, 0.07450981, 1, 0, 1,
-0.4610272, 0.9205624, -1.211216, 0.06666667, 1, 0, 1,
-0.4598563, 0.09823079, -2.025377, 0.0627451, 1, 0, 1,
-0.4595174, -0.7843677, -3.244035, 0.05490196, 1, 0, 1,
-0.4588821, 0.1840826, 0.7195949, 0.05098039, 1, 0, 1,
-0.4586773, -2.210184, -3.588093, 0.04313726, 1, 0, 1,
-0.4567768, 0.7828795, -3.01898, 0.03921569, 1, 0, 1,
-0.4502575, 2.013769, -0.9129226, 0.03137255, 1, 0, 1,
-0.450186, -1.332886, -5.56367, 0.02745098, 1, 0, 1,
-0.4446553, 0.9744852, -1.428257, 0.01960784, 1, 0, 1,
-0.444415, 0.0496878, -3.979242, 0.01568628, 1, 0, 1,
-0.442615, -0.7563515, -3.949613, 0.007843138, 1, 0, 1,
-0.441442, 0.9542586, -1.098722, 0.003921569, 1, 0, 1,
-0.4413682, -0.340847, -0.222141, 0, 1, 0.003921569, 1,
-0.4386515, -0.902218, -2.676277, 0, 1, 0.01176471, 1,
-0.4378111, -0.9839015, -3.391936, 0, 1, 0.01568628, 1,
-0.4361487, 1.594751, -1.416273, 0, 1, 0.02352941, 1,
-0.4278461, -0.8723318, -2.249755, 0, 1, 0.02745098, 1,
-0.4259557, -0.4303522, -2.26491, 0, 1, 0.03529412, 1,
-0.4244116, -0.06873517, -2.580899, 0, 1, 0.03921569, 1,
-0.4161618, -0.6481915, -1.605249, 0, 1, 0.04705882, 1,
-0.4123686, -0.3120295, -0.9254335, 0, 1, 0.05098039, 1,
-0.4071648, -1.000122, -0.6948999, 0, 1, 0.05882353, 1,
-0.4065244, 0.2338196, 0.9979354, 0, 1, 0.0627451, 1,
-0.4022369, 0.5180413, -0.2861719, 0, 1, 0.07058824, 1,
-0.4020736, 1.063394, 0.1621313, 0, 1, 0.07450981, 1,
-0.3993332, -0.6667432, -1.802636, 0, 1, 0.08235294, 1,
-0.3991467, 0.1011059, 0.463759, 0, 1, 0.08627451, 1,
-0.3942555, -1.987864, -1.251023, 0, 1, 0.09411765, 1,
-0.3936091, -0.1698348, -0.8375155, 0, 1, 0.1019608, 1,
-0.3931275, -1.800165, -2.228788, 0, 1, 0.1058824, 1,
-0.3930996, 0.2175485, 0.03725122, 0, 1, 0.1137255, 1,
-0.3872708, -0.4314799, -2.497566, 0, 1, 0.1176471, 1,
-0.3869828, 0.8571204, 0.835907, 0, 1, 0.1254902, 1,
-0.383671, 1.612425, -1.008528, 0, 1, 0.1294118, 1,
-0.382401, 0.3066952, -1.25465, 0, 1, 0.1372549, 1,
-0.3814509, 0.5150131, -1.390704, 0, 1, 0.1411765, 1,
-0.3811247, -0.3500715, -4.656874, 0, 1, 0.1490196, 1,
-0.3753788, -0.3544511, -1.805786, 0, 1, 0.1529412, 1,
-0.3728115, -1.455139, -4.537716, 0, 1, 0.1607843, 1,
-0.3659884, 1.071114, -0.6144333, 0, 1, 0.1647059, 1,
-0.3655167, -0.5048943, -4.249653, 0, 1, 0.172549, 1,
-0.3641789, -1.823153, -1.101902, 0, 1, 0.1764706, 1,
-0.3597134, 0.8410269, -0.1281095, 0, 1, 0.1843137, 1,
-0.3544739, -1.124538, -3.107382, 0, 1, 0.1882353, 1,
-0.3470675, 0.2050999, -2.27332, 0, 1, 0.1960784, 1,
-0.3462437, -0.5449198, -2.085957, 0, 1, 0.2039216, 1,
-0.3418137, 0.7926837, 0.09887584, 0, 1, 0.2078431, 1,
-0.3413297, 0.322881, -2.885358, 0, 1, 0.2156863, 1,
-0.3413093, 2.800999, 0.6877255, 0, 1, 0.2196078, 1,
-0.33839, 0.394682, -0.6259282, 0, 1, 0.227451, 1,
-0.3332975, -0.9418995, -3.312855, 0, 1, 0.2313726, 1,
-0.3293267, -0.4014083, -2.152632, 0, 1, 0.2392157, 1,
-0.3273388, -0.8622271, -3.186657, 0, 1, 0.2431373, 1,
-0.3266975, -0.1546573, -1.140276, 0, 1, 0.2509804, 1,
-0.3245313, -1.214588, -1.958627, 0, 1, 0.254902, 1,
-0.3226098, -2.423173, -3.736399, 0, 1, 0.2627451, 1,
-0.321301, -0.4284155, -2.093956, 0, 1, 0.2666667, 1,
-0.3205926, 0.516687, 0.4965362, 0, 1, 0.2745098, 1,
-0.3199745, -0.9916189, -2.077584, 0, 1, 0.2784314, 1,
-0.3175038, 0.5965187, -1.128868, 0, 1, 0.2862745, 1,
-0.3173614, 0.2121724, 0.4318916, 0, 1, 0.2901961, 1,
-0.3172247, -0.3796081, -0.8790938, 0, 1, 0.2980392, 1,
-0.312904, 1.12167, -1.137712, 0, 1, 0.3058824, 1,
-0.3114082, 0.3932052, 0.475893, 0, 1, 0.3098039, 1,
-0.3107944, 1.764952, 0.1853109, 0, 1, 0.3176471, 1,
-0.3105294, 0.7484955, -2.228932, 0, 1, 0.3215686, 1,
-0.3096356, -0.9843765, -1.907915, 0, 1, 0.3294118, 1,
-0.3054606, 1.271946, -0.3423252, 0, 1, 0.3333333, 1,
-0.3034542, 1.078429, -0.5557887, 0, 1, 0.3411765, 1,
-0.3014169, -0.8677972, -2.857297, 0, 1, 0.345098, 1,
-0.301277, -0.4534634, -1.781685, 0, 1, 0.3529412, 1,
-0.3012765, -0.463635, -1.193946, 0, 1, 0.3568628, 1,
-0.3008561, 0.278674, -1.975969, 0, 1, 0.3647059, 1,
-0.2988053, -0.1315435, -3.407811, 0, 1, 0.3686275, 1,
-0.2935497, -1.495773, -4.045905, 0, 1, 0.3764706, 1,
-0.289515, -1.472251, -2.194537, 0, 1, 0.3803922, 1,
-0.2881506, -1.065222, -1.508324, 0, 1, 0.3882353, 1,
-0.288063, -0.1474148, -2.024422, 0, 1, 0.3921569, 1,
-0.2850168, -0.1127402, -2.280646, 0, 1, 0.4, 1,
-0.2798356, -0.2733492, -3.57745, 0, 1, 0.4078431, 1,
-0.2775941, 0.1168541, -0.6684514, 0, 1, 0.4117647, 1,
-0.2758, 1.43138, 1.911108, 0, 1, 0.4196078, 1,
-0.2732372, 1.099115, 0.2897201, 0, 1, 0.4235294, 1,
-0.2664164, -0.08610421, -1.999888, 0, 1, 0.4313726, 1,
-0.2664047, 0.1538774, 1.381616, 0, 1, 0.4352941, 1,
-0.2653183, -0.4926383, -2.608087, 0, 1, 0.4431373, 1,
-0.2645656, 1.446019, -0.4476721, 0, 1, 0.4470588, 1,
-0.2633727, 1.284209, 0.8831944, 0, 1, 0.454902, 1,
-0.2626503, -2.379838, -3.960062, 0, 1, 0.4588235, 1,
-0.2622589, 0.825336, -0.7621835, 0, 1, 0.4666667, 1,
-0.2598871, 0.06013792, -0.6588881, 0, 1, 0.4705882, 1,
-0.2596595, 0.432993, -2.530856, 0, 1, 0.4784314, 1,
-0.2594936, 0.208031, -0.3321512, 0, 1, 0.4823529, 1,
-0.2577085, 0.7284051, 0.4863628, 0, 1, 0.4901961, 1,
-0.2541534, -0.5056451, -3.698715, 0, 1, 0.4941176, 1,
-0.2496667, -0.1816295, -2.971599, 0, 1, 0.5019608, 1,
-0.2455046, -1.289801, -2.544969, 0, 1, 0.509804, 1,
-0.2390155, 1.271078, -0.4841264, 0, 1, 0.5137255, 1,
-0.2333683, -0.3874476, -3.161799, 0, 1, 0.5215687, 1,
-0.2296737, -2.039734, -1.488265, 0, 1, 0.5254902, 1,
-0.2269151, -0.01972858, -1.999482, 0, 1, 0.5333334, 1,
-0.2244425, 0.2786749, -0.1269877, 0, 1, 0.5372549, 1,
-0.2181758, -1.68333, -3.501008, 0, 1, 0.5450981, 1,
-0.2147895, -1.791778, -1.943229, 0, 1, 0.5490196, 1,
-0.2139088, 0.08521438, -0.66406, 0, 1, 0.5568628, 1,
-0.2099962, -0.2295412, -3.630165, 0, 1, 0.5607843, 1,
-0.2088534, 0.8382023, -1.48079, 0, 1, 0.5686275, 1,
-0.2081598, 1.521859, 0.9875914, 0, 1, 0.572549, 1,
-0.2046762, 0.6238971, -0.8285705, 0, 1, 0.5803922, 1,
-0.2003247, 1.479898, 0.9104974, 0, 1, 0.5843138, 1,
-0.1972673, 0.1757727, 0.9497548, 0, 1, 0.5921569, 1,
-0.1920141, 1.304846, 0.6387266, 0, 1, 0.5960785, 1,
-0.1912054, -0.4884678, -3.780852, 0, 1, 0.6039216, 1,
-0.1905145, -0.5908385, -2.059335, 0, 1, 0.6117647, 1,
-0.1873234, -0.06590988, -0.2559593, 0, 1, 0.6156863, 1,
-0.1790213, -0.5891051, -0.661383, 0, 1, 0.6235294, 1,
-0.1774974, -2.211548, -4.102488, 0, 1, 0.627451, 1,
-0.1768204, 0.1327966, -1.158014, 0, 1, 0.6352941, 1,
-0.174895, 0.8156433, -0.423097, 0, 1, 0.6392157, 1,
-0.173386, -1.688303, -4.070824, 0, 1, 0.6470588, 1,
-0.1694204, -0.09132706, -2.287674, 0, 1, 0.6509804, 1,
-0.1675461, 0.09395755, -1.737529, 0, 1, 0.6588235, 1,
-0.1671904, 0.1181151, 0.7215848, 0, 1, 0.6627451, 1,
-0.1669959, -0.6096361, -3.825626, 0, 1, 0.6705883, 1,
-0.1649092, 1.790205, -0.02503628, 0, 1, 0.6745098, 1,
-0.1632668, -0.1747382, -2.542262, 0, 1, 0.682353, 1,
-0.1590322, -1.448102, -2.510224, 0, 1, 0.6862745, 1,
-0.1589419, -1.921977, -1.226712, 0, 1, 0.6941177, 1,
-0.1570449, 0.2927102, -1.645245, 0, 1, 0.7019608, 1,
-0.1558002, 2.027442, -1.353308, 0, 1, 0.7058824, 1,
-0.1555564, 0.04682021, -0.6770402, 0, 1, 0.7137255, 1,
-0.1458305, 1.855887, -0.8724897, 0, 1, 0.7176471, 1,
-0.1453529, -0.3472128, -2.543023, 0, 1, 0.7254902, 1,
-0.1428093, 0.9048623, -1.017202, 0, 1, 0.7294118, 1,
-0.1372223, -1.533593, -3.512895, 0, 1, 0.7372549, 1,
-0.1369152, 1.401514, -1.59373, 0, 1, 0.7411765, 1,
-0.1364553, 0.5291299, 0.4643906, 0, 1, 0.7490196, 1,
-0.1352736, -0.4744434, -2.515027, 0, 1, 0.7529412, 1,
-0.1338053, -0.3231936, -2.132151, 0, 1, 0.7607843, 1,
-0.133117, 0.4274601, -1.21149, 0, 1, 0.7647059, 1,
-0.1310558, -0.5936549, -3.34885, 0, 1, 0.772549, 1,
-0.1290557, -0.4198812, -3.482589, 0, 1, 0.7764706, 1,
-0.1279108, -0.8462708, -3.779319, 0, 1, 0.7843137, 1,
-0.1278504, -0.66067, -3.704863, 0, 1, 0.7882353, 1,
-0.126465, 1.173326, -0.2371658, 0, 1, 0.7960784, 1,
-0.12587, 0.498916, 1.687215, 0, 1, 0.8039216, 1,
-0.1242899, 0.3732436, -0.9499434, 0, 1, 0.8078431, 1,
-0.1232192, -0.4836736, -3.402241, 0, 1, 0.8156863, 1,
-0.1193498, -0.01516538, -0.2066929, 0, 1, 0.8196079, 1,
-0.1174552, 1.755625, 0.7956467, 0, 1, 0.827451, 1,
-0.1171011, 0.3601686, -0.2092527, 0, 1, 0.8313726, 1,
-0.1154933, -1.615015, -0.1881683, 0, 1, 0.8392157, 1,
-0.1118975, 0.447841, 0.6697034, 0, 1, 0.8431373, 1,
-0.1061861, 0.1075798, -0.7396568, 0, 1, 0.8509804, 1,
-0.1007436, 0.1160561, -0.1443177, 0, 1, 0.854902, 1,
-0.09772123, 0.9383901, 0.05619003, 0, 1, 0.8627451, 1,
-0.09231924, -0.8464806, -4.638871, 0, 1, 0.8666667, 1,
-0.09022, 0.9831048, -2.084265, 0, 1, 0.8745098, 1,
-0.08985145, -0.9512992, -3.467887, 0, 1, 0.8784314, 1,
-0.08771754, 0.3441213, 0.204093, 0, 1, 0.8862745, 1,
-0.0849709, -2.158284, -2.465425, 0, 1, 0.8901961, 1,
-0.0794953, 0.8028523, 0.5780085, 0, 1, 0.8980392, 1,
-0.07639486, 0.06614333, -1.40839, 0, 1, 0.9058824, 1,
-0.07097062, 0.9645673, -2.359759, 0, 1, 0.9098039, 1,
-0.06757616, 0.3163975, 0.8160838, 0, 1, 0.9176471, 1,
-0.06746389, 0.03380717, -2.462303, 0, 1, 0.9215686, 1,
-0.06685993, -0.6160765, -4.103982, 0, 1, 0.9294118, 1,
-0.05565364, -0.06747316, -1.827832, 0, 1, 0.9333333, 1,
-0.05546446, 1.230986, -1.441094, 0, 1, 0.9411765, 1,
-0.05480444, -0.5284737, -2.307843, 0, 1, 0.945098, 1,
-0.05398966, 0.01075267, -2.093957, 0, 1, 0.9529412, 1,
-0.0512084, -0.4939579, -3.412959, 0, 1, 0.9568627, 1,
-0.04722051, -1.093347, -1.124435, 0, 1, 0.9647059, 1,
-0.04525592, -0.5447025, -2.861809, 0, 1, 0.9686275, 1,
-0.04503552, -1.439188, -2.221439, 0, 1, 0.9764706, 1,
-0.042317, -1.784192, -4.91054, 0, 1, 0.9803922, 1,
-0.03748605, 0.1028071, -1.747687, 0, 1, 0.9882353, 1,
-0.03284585, 0.8954382, -0.2853392, 0, 1, 0.9921569, 1,
-0.03209229, -1.337476, -2.549679, 0, 1, 1, 1,
-0.03149822, 2.122843, 0.4511407, 0, 0.9921569, 1, 1,
-0.0311464, -0.4260271, -3.5258, 0, 0.9882353, 1, 1,
-0.02924181, 0.1336487, -0.7325893, 0, 0.9803922, 1, 1,
-0.02894671, -0.05740628, -2.458584, 0, 0.9764706, 1, 1,
-0.02845243, -1.439762, -1.981413, 0, 0.9686275, 1, 1,
-0.02814641, -1.551697, -2.66514, 0, 0.9647059, 1, 1,
-0.026043, 1.088007, 0.9576787, 0, 0.9568627, 1, 1,
-0.02364845, -0.179723, -3.160027, 0, 0.9529412, 1, 1,
-0.02312814, -1.970651, -1.535593, 0, 0.945098, 1, 1,
-0.0175715, 0.5278924, -2.777014, 0, 0.9411765, 1, 1,
-0.01427015, -0.9492725, -5.217749, 0, 0.9333333, 1, 1,
-0.01168211, 1.067403, -0.9782498, 0, 0.9294118, 1, 1,
-0.01163623, 0.2046586, -0.7381472, 0, 0.9215686, 1, 1,
-0.007956063, -0.07203213, -2.894496, 0, 0.9176471, 1, 1,
-0.002566595, 1.736928, 0.5223843, 0, 0.9098039, 1, 1,
-0.002307712, -1.543512, -2.444058, 0, 0.9058824, 1, 1,
0.0006058386, 0.05452346, -1.914261, 0, 0.8980392, 1, 1,
0.006755719, -1.672921, 2.051989, 0, 0.8901961, 1, 1,
0.008283508, -0.9852858, 2.063041, 0, 0.8862745, 1, 1,
0.009845059, 1.205174, 0.4439656, 0, 0.8784314, 1, 1,
0.01488931, 1.26724, -0.6487945, 0, 0.8745098, 1, 1,
0.0174421, -1.161005, 4.613473, 0, 0.8666667, 1, 1,
0.02692479, -0.08670006, 2.107273, 0, 0.8627451, 1, 1,
0.02704363, 1.193246, 0.2287161, 0, 0.854902, 1, 1,
0.02770989, -1.123018, 4.077445, 0, 0.8509804, 1, 1,
0.03178094, 0.6699893, -0.4166379, 0, 0.8431373, 1, 1,
0.03202224, 0.3325324, 0.6269493, 0, 0.8392157, 1, 1,
0.03484423, 2.711563, 1.007799, 0, 0.8313726, 1, 1,
0.03570401, 0.07756108, 2.222045, 0, 0.827451, 1, 1,
0.03718128, -0.3848231, 1.820822, 0, 0.8196079, 1, 1,
0.03820869, 0.07214222, 0.1671906, 0, 0.8156863, 1, 1,
0.03826101, -0.8098443, 1.340724, 0, 0.8078431, 1, 1,
0.04263115, 0.1900567, -0.2774231, 0, 0.8039216, 1, 1,
0.04276973, 0.2550033, 0.5403096, 0, 0.7960784, 1, 1,
0.04524019, 0.7947437, 0.6281785, 0, 0.7882353, 1, 1,
0.04657047, -1.533376, 3.511925, 0, 0.7843137, 1, 1,
0.048992, 0.4181318, -0.7412804, 0, 0.7764706, 1, 1,
0.06018198, -1.913214, 3.432211, 0, 0.772549, 1, 1,
0.06036828, 0.6965635, -0.4322621, 0, 0.7647059, 1, 1,
0.06115442, 1.893757, 0.5664899, 0, 0.7607843, 1, 1,
0.07295486, -1.309866, 3.475727, 0, 0.7529412, 1, 1,
0.07369166, 0.6015865, -1.024436, 0, 0.7490196, 1, 1,
0.07473885, -0.1823832, 2.706247, 0, 0.7411765, 1, 1,
0.07612221, -0.1491663, 1.71204, 0, 0.7372549, 1, 1,
0.07615162, -0.3061778, 2.959708, 0, 0.7294118, 1, 1,
0.07854966, 0.08968563, -0.6429246, 0, 0.7254902, 1, 1,
0.08053587, 0.2841008, -1.024369, 0, 0.7176471, 1, 1,
0.08192715, 0.8148007, 1.641255, 0, 0.7137255, 1, 1,
0.08271594, 0.03352835, 0.2748999, 0, 0.7058824, 1, 1,
0.08442538, -0.5199758, 3.574328, 0, 0.6980392, 1, 1,
0.08492705, -1.626137, 3.158718, 0, 0.6941177, 1, 1,
0.08534171, -0.1600519, 3.60446, 0, 0.6862745, 1, 1,
0.08680248, 1.364431, 1.072922, 0, 0.682353, 1, 1,
0.08987446, -1.54197, 5.198316, 0, 0.6745098, 1, 1,
0.0919715, -0.7147143, 2.791925, 0, 0.6705883, 1, 1,
0.09340198, 1.209153, -0.05904673, 0, 0.6627451, 1, 1,
0.102861, 0.8183019, -0.1613925, 0, 0.6588235, 1, 1,
0.104118, 1.078824, 0.6520762, 0, 0.6509804, 1, 1,
0.1074865, 1.282559, -0.4086348, 0, 0.6470588, 1, 1,
0.108729, 0.2867094, 1.269396, 0, 0.6392157, 1, 1,
0.1100999, 0.2800647, 0.6934499, 0, 0.6352941, 1, 1,
0.1114717, 0.7938949, 0.2653742, 0, 0.627451, 1, 1,
0.1119574, 1.786641, 1.216698, 0, 0.6235294, 1, 1,
0.1123402, 0.9655445, 0.8069634, 0, 0.6156863, 1, 1,
0.112427, -1.058995, 2.571259, 0, 0.6117647, 1, 1,
0.1125463, 0.1631177, -0.436898, 0, 0.6039216, 1, 1,
0.1152365, -1.360495, 3.865585, 0, 0.5960785, 1, 1,
0.1177461, -1.569798, 2.334997, 0, 0.5921569, 1, 1,
0.1186894, 0.3758496, -0.0629787, 0, 0.5843138, 1, 1,
0.1218083, -1.207384, 4.170681, 0, 0.5803922, 1, 1,
0.1221395, -0.1429982, 2.658526, 0, 0.572549, 1, 1,
0.1229771, -0.9331002, 2.112809, 0, 0.5686275, 1, 1,
0.1241474, 1.586951, 0.4630993, 0, 0.5607843, 1, 1,
0.1283211, 0.1147608, 1.114986, 0, 0.5568628, 1, 1,
0.132208, -0.09275446, 3.118018, 0, 0.5490196, 1, 1,
0.1332671, 0.5200568, -0.04460522, 0, 0.5450981, 1, 1,
0.1340001, 0.9583969, 1.900997, 0, 0.5372549, 1, 1,
0.1349697, 0.3676719, 0.1984616, 0, 0.5333334, 1, 1,
0.1387558, 0.7025599, 1.686095, 0, 0.5254902, 1, 1,
0.143913, -0.04586934, 0.816969, 0, 0.5215687, 1, 1,
0.1465146, -0.2360916, 2.935209, 0, 0.5137255, 1, 1,
0.146522, 0.7742409, 1.739551, 0, 0.509804, 1, 1,
0.146576, 0.5432959, 1.30497, 0, 0.5019608, 1, 1,
0.1479862, 0.9603813, -1.223604, 0, 0.4941176, 1, 1,
0.149988, 1.17749, -0.6381915, 0, 0.4901961, 1, 1,
0.1588634, -1.39752, 4.324844, 0, 0.4823529, 1, 1,
0.1591743, 0.7733943, 0.964883, 0, 0.4784314, 1, 1,
0.1594674, 0.975095, -1.057789, 0, 0.4705882, 1, 1,
0.1619662, -0.09240936, 2.54074, 0, 0.4666667, 1, 1,
0.1671662, -0.9607743, 3.714026, 0, 0.4588235, 1, 1,
0.1725484, -0.9317366, 2.619625, 0, 0.454902, 1, 1,
0.1744688, 0.8915947, -0.1902431, 0, 0.4470588, 1, 1,
0.1746237, 1.420283, 2.318613, 0, 0.4431373, 1, 1,
0.1771438, -0.05400983, 2.648156, 0, 0.4352941, 1, 1,
0.177932, 1.769088, 0.4022693, 0, 0.4313726, 1, 1,
0.1798599, 0.1774264, 2.30602, 0, 0.4235294, 1, 1,
0.1820669, -1.131614, 1.256351, 0, 0.4196078, 1, 1,
0.1822076, 0.75345, 0.02851667, 0, 0.4117647, 1, 1,
0.1832786, 0.9664211, -0.6193794, 0, 0.4078431, 1, 1,
0.1906508, -0.2074543, 2.249519, 0, 0.4, 1, 1,
0.1925313, -0.6418793, 2.844266, 0, 0.3921569, 1, 1,
0.1932869, 1.595971, 0.3182595, 0, 0.3882353, 1, 1,
0.1933198, -0.9460129, 4.330692, 0, 0.3803922, 1, 1,
0.1961428, -0.03451769, 1.163797, 0, 0.3764706, 1, 1,
0.1977906, -0.9460576, 4.228918, 0, 0.3686275, 1, 1,
0.1989269, 0.6208764, -0.8053492, 0, 0.3647059, 1, 1,
0.2006481, -0.5304956, 4.883798, 0, 0.3568628, 1, 1,
0.2039848, -0.945798, 1.714092, 0, 0.3529412, 1, 1,
0.2043249, 1.091133, -0.6908576, 0, 0.345098, 1, 1,
0.2043695, -1.764356, 3.307099, 0, 0.3411765, 1, 1,
0.206293, 0.3237883, 0.9260939, 0, 0.3333333, 1, 1,
0.2090534, -0.2704029, 3.097883, 0, 0.3294118, 1, 1,
0.2097631, -0.7895625, 3.519043, 0, 0.3215686, 1, 1,
0.2101729, -0.06413534, 1.999011, 0, 0.3176471, 1, 1,
0.2121577, -0.1359651, 0.9736603, 0, 0.3098039, 1, 1,
0.2124963, -0.8191537, 2.37357, 0, 0.3058824, 1, 1,
0.2135272, 1.05386, 0.2912836, 0, 0.2980392, 1, 1,
0.2137584, 0.7128037, 0.7577153, 0, 0.2901961, 1, 1,
0.2178913, -1.225759, 3.038114, 0, 0.2862745, 1, 1,
0.2186177, -0.8944376, 3.083505, 0, 0.2784314, 1, 1,
0.2207868, -2.145719, 3.407841, 0, 0.2745098, 1, 1,
0.2233717, 0.7419353, -0.5851804, 0, 0.2666667, 1, 1,
0.2295274, 0.87636, 0.4268964, 0, 0.2627451, 1, 1,
0.230032, -0.223048, 1.659982, 0, 0.254902, 1, 1,
0.2309074, 0.3209742, -0.2541192, 0, 0.2509804, 1, 1,
0.2335951, 0.08294349, 0.9028492, 0, 0.2431373, 1, 1,
0.2354499, 1.020034, -0.7094918, 0, 0.2392157, 1, 1,
0.2373212, 1.398333, -0.2900584, 0, 0.2313726, 1, 1,
0.2383576, 0.5922927, 1.318592, 0, 0.227451, 1, 1,
0.2398019, 0.06772204, 0.8104044, 0, 0.2196078, 1, 1,
0.2435925, 0.286822, 0.8860981, 0, 0.2156863, 1, 1,
0.2439114, 0.1281893, 1.455783, 0, 0.2078431, 1, 1,
0.2440447, 0.2388956, 0.2881603, 0, 0.2039216, 1, 1,
0.2449093, 1.404666, 0.4160036, 0, 0.1960784, 1, 1,
0.2476228, -0.912871, 1.432839, 0, 0.1882353, 1, 1,
0.250125, -1.354374, 2.188449, 0, 0.1843137, 1, 1,
0.2536188, -0.8392645, 3.519616, 0, 0.1764706, 1, 1,
0.254823, -0.2026023, 2.379084, 0, 0.172549, 1, 1,
0.2561912, 0.4502471, -0.5511257, 0, 0.1647059, 1, 1,
0.2568341, 1.048527, 0.4636546, 0, 0.1607843, 1, 1,
0.2600743, 0.03206826, 0.303414, 0, 0.1529412, 1, 1,
0.2626216, 0.2192021, -0.7910368, 0, 0.1490196, 1, 1,
0.2637427, 1.141046, 0.3467473, 0, 0.1411765, 1, 1,
0.2684798, -0.09538952, 3.320982, 0, 0.1372549, 1, 1,
0.2708035, 0.4931075, -0.3944663, 0, 0.1294118, 1, 1,
0.272577, 0.7016011, 0.7946234, 0, 0.1254902, 1, 1,
0.2753251, -1.267591, 3.892919, 0, 0.1176471, 1, 1,
0.2792921, 1.321246, -1.081919, 0, 0.1137255, 1, 1,
0.2838163, -0.04411401, 0.5712706, 0, 0.1058824, 1, 1,
0.2875229, -0.5982742, 3.852217, 0, 0.09803922, 1, 1,
0.2933269, -0.8998361, 2.716424, 0, 0.09411765, 1, 1,
0.2980626, 0.4821465, -0.2467356, 0, 0.08627451, 1, 1,
0.3061182, -0.947773, 3.869647, 0, 0.08235294, 1, 1,
0.3086279, -0.1844398, 3.863551, 0, 0.07450981, 1, 1,
0.3184102, 0.2886416, 0.338156, 0, 0.07058824, 1, 1,
0.3321454, -0.7305833, 2.197121, 0, 0.0627451, 1, 1,
0.3343623, -0.1744306, 0.7855378, 0, 0.05882353, 1, 1,
0.3350449, 0.3261683, 0.07810184, 0, 0.05098039, 1, 1,
0.3369792, -0.8798552, 3.722704, 0, 0.04705882, 1, 1,
0.3403595, -1.668988, 4.201359, 0, 0.03921569, 1, 1,
0.3408875, -2.228469, 2.011446, 0, 0.03529412, 1, 1,
0.3465142, -1.338624, 3.20571, 0, 0.02745098, 1, 1,
0.3490458, 0.6709317, 0.2204385, 0, 0.02352941, 1, 1,
0.3508749, 1.124261, 1.656749, 0, 0.01568628, 1, 1,
0.351245, 0.1345565, 2.298722, 0, 0.01176471, 1, 1,
0.3516991, 1.55389, 2.522152, 0, 0.003921569, 1, 1,
0.3574044, -0.2731864, 2.935847, 0.003921569, 0, 1, 1,
0.3593417, 0.8664592, 0.1929215, 0.007843138, 0, 1, 1,
0.3639143, 0.4497401, -0.558372, 0.01568628, 0, 1, 1,
0.3684837, -0.3860475, 0.7365214, 0.01960784, 0, 1, 1,
0.3719948, 0.5229794, -0.456612, 0.02745098, 0, 1, 1,
0.3743813, 0.1896883, 0.9747673, 0.03137255, 0, 1, 1,
0.3836127, -0.5292286, 2.781577, 0.03921569, 0, 1, 1,
0.384555, 0.7588687, 0.1324944, 0.04313726, 0, 1, 1,
0.3860616, 1.227953, -0.2430154, 0.05098039, 0, 1, 1,
0.3903295, 0.328687, 1.404941, 0.05490196, 0, 1, 1,
0.3947014, 1.385007, 0.6812807, 0.0627451, 0, 1, 1,
0.3972445, -0.8234332, 2.920029, 0.06666667, 0, 1, 1,
0.3974629, -1.32289, 2.165332, 0.07450981, 0, 1, 1,
0.3978598, -0.8264095, 1.265947, 0.07843138, 0, 1, 1,
0.4021404, 0.7709409, 0.446009, 0.08627451, 0, 1, 1,
0.4038923, -1.536919, 2.795136, 0.09019608, 0, 1, 1,
0.4056751, 0.9772732, 0.5942883, 0.09803922, 0, 1, 1,
0.4064879, 1.500306, -0.5653915, 0.1058824, 0, 1, 1,
0.4165623, -0.2531866, 1.335282, 0.1098039, 0, 1, 1,
0.4217783, -0.8520725, 2.854041, 0.1176471, 0, 1, 1,
0.4221905, -0.4624641, 1.371731, 0.1215686, 0, 1, 1,
0.4247747, 0.8833001, 2.074988, 0.1294118, 0, 1, 1,
0.4250368, 0.7009617, 2.025884, 0.1333333, 0, 1, 1,
0.4251126, 1.844252, 1.896051, 0.1411765, 0, 1, 1,
0.4308605, -0.9946332, 4.291945, 0.145098, 0, 1, 1,
0.4365643, 1.007542, 0.3953224, 0.1529412, 0, 1, 1,
0.4427385, 0.319986, -0.9326481, 0.1568628, 0, 1, 1,
0.4458098, 0.9055601, 1.68756, 0.1647059, 0, 1, 1,
0.450535, -0.9580468, 2.835963, 0.1686275, 0, 1, 1,
0.4573118, 0.7422493, 1.67729, 0.1764706, 0, 1, 1,
0.4604442, -0.4312874, 2.468463, 0.1803922, 0, 1, 1,
0.4618213, -1.20937, 2.931382, 0.1882353, 0, 1, 1,
0.4682512, 0.5619051, 1.63541, 0.1921569, 0, 1, 1,
0.4697134, -0.6871591, 3.974286, 0.2, 0, 1, 1,
0.4746428, 0.4458133, -0.6977677, 0.2078431, 0, 1, 1,
0.4869348, -1.592671, 3.436083, 0.2117647, 0, 1, 1,
0.4886925, 0.116105, 1.743086, 0.2196078, 0, 1, 1,
0.4923917, -0.1602626, 2.61242, 0.2235294, 0, 1, 1,
0.4929973, -0.7446165, 0.9249105, 0.2313726, 0, 1, 1,
0.5066504, -0.05768958, 3.840395, 0.2352941, 0, 1, 1,
0.5081108, 1.566047, -0.2187895, 0.2431373, 0, 1, 1,
0.50957, 2.016509, -0.6940094, 0.2470588, 0, 1, 1,
0.5134113, 1.591862, 1.677674, 0.254902, 0, 1, 1,
0.5189989, 1.982553, 1.337276, 0.2588235, 0, 1, 1,
0.5201887, -0.5847053, 4.505224, 0.2666667, 0, 1, 1,
0.5279614, -0.2163399, 2.323154, 0.2705882, 0, 1, 1,
0.5307879, 0.5506546, -0.3758914, 0.2784314, 0, 1, 1,
0.5324784, 1.449053, -1.449968, 0.282353, 0, 1, 1,
0.5332857, -1.548063, 2.441346, 0.2901961, 0, 1, 1,
0.5335563, 1.046409, 1.178045, 0.2941177, 0, 1, 1,
0.537269, -1.127294, 2.096289, 0.3019608, 0, 1, 1,
0.542196, 0.7131593, -0.4595669, 0.3098039, 0, 1, 1,
0.543481, -0.4666418, 2.268296, 0.3137255, 0, 1, 1,
0.5469052, -0.3334101, 1.997517, 0.3215686, 0, 1, 1,
0.5550182, 0.7418548, 0.3228907, 0.3254902, 0, 1, 1,
0.5639063, 0.9795398, 0.8363646, 0.3333333, 0, 1, 1,
0.5644356, 1.170683, -0.2174562, 0.3372549, 0, 1, 1,
0.5679508, 1.438557, 1.95805, 0.345098, 0, 1, 1,
0.575799, -1.035372, 3.182099, 0.3490196, 0, 1, 1,
0.5832351, -0.7564955, 2.868045, 0.3568628, 0, 1, 1,
0.5833383, 0.4748023, 1.328759, 0.3607843, 0, 1, 1,
0.5844971, -2.204021, 2.213945, 0.3686275, 0, 1, 1,
0.5859857, -0.8419166, 3.043322, 0.372549, 0, 1, 1,
0.5882567, -0.5138364, 1.303881, 0.3803922, 0, 1, 1,
0.5905809, -0.08784907, 1.200173, 0.3843137, 0, 1, 1,
0.5923223, -0.05418016, -0.3454632, 0.3921569, 0, 1, 1,
0.5939884, 0.0732942, 1.827783, 0.3960784, 0, 1, 1,
0.5971606, -1.487559, 2.476176, 0.4039216, 0, 1, 1,
0.6001635, -0.7983747, 4.022102, 0.4117647, 0, 1, 1,
0.6078709, 0.1238855, 3.144779, 0.4156863, 0, 1, 1,
0.6083932, 1.049987, 0.1421202, 0.4235294, 0, 1, 1,
0.6090567, -0.7090433, 1.003585, 0.427451, 0, 1, 1,
0.6097989, 0.1043198, 2.352478, 0.4352941, 0, 1, 1,
0.6100604, 3.014517, 0.9710608, 0.4392157, 0, 1, 1,
0.6104849, -0.8379309, 2.492037, 0.4470588, 0, 1, 1,
0.6116211, -1.732583, 3.450021, 0.4509804, 0, 1, 1,
0.6160378, 1.618601, -0.2079055, 0.4588235, 0, 1, 1,
0.6163072, 1.106811, 0.9885268, 0.4627451, 0, 1, 1,
0.6169969, -1.315757, 4.481438, 0.4705882, 0, 1, 1,
0.6194136, 0.6312827, 0.162743, 0.4745098, 0, 1, 1,
0.6203691, -0.3590307, 2.390885, 0.4823529, 0, 1, 1,
0.6211179, -0.5277873, 2.930529, 0.4862745, 0, 1, 1,
0.6232532, -0.2780449, 0.2579811, 0.4941176, 0, 1, 1,
0.630372, 1.352632, 0.4126751, 0.5019608, 0, 1, 1,
0.6343169, 0.009468991, 2.938195, 0.5058824, 0, 1, 1,
0.6384135, -1.221608, 0.9724855, 0.5137255, 0, 1, 1,
0.6522326, 1.833946, -0.129794, 0.5176471, 0, 1, 1,
0.6538895, 1.334836, -0.29061, 0.5254902, 0, 1, 1,
0.6558545, 0.6863551, 2.661276, 0.5294118, 0, 1, 1,
0.6574252, 0.2025131, 1.482734, 0.5372549, 0, 1, 1,
0.6587446, 1.321032, -0.1311675, 0.5411765, 0, 1, 1,
0.6589691, -0.004991347, 1.48419, 0.5490196, 0, 1, 1,
0.6593827, 1.099658, -0.8996263, 0.5529412, 0, 1, 1,
0.6598149, 0.38688, 1.77962, 0.5607843, 0, 1, 1,
0.6599341, 0.4469172, 3.021405, 0.5647059, 0, 1, 1,
0.660704, 0.02902025, 3.364174, 0.572549, 0, 1, 1,
0.6614806, 0.9531094, 0.3121454, 0.5764706, 0, 1, 1,
0.6617705, -0.09923114, 0.8266808, 0.5843138, 0, 1, 1,
0.6624036, -0.4227, 3.489722, 0.5882353, 0, 1, 1,
0.6677662, 0.07791743, 2.13402, 0.5960785, 0, 1, 1,
0.6690059, 0.6062897, 2.352459, 0.6039216, 0, 1, 1,
0.6730877, -0.5454112, 1.723463, 0.6078432, 0, 1, 1,
0.6742777, -0.1887175, 2.201282, 0.6156863, 0, 1, 1,
0.679623, 0.04575203, 1.459607, 0.6196079, 0, 1, 1,
0.6818829, 0.8553485, 0.2009621, 0.627451, 0, 1, 1,
0.6878952, -0.2089979, 0.7402345, 0.6313726, 0, 1, 1,
0.6904397, 0.4867142, 1.404522, 0.6392157, 0, 1, 1,
0.690483, 0.2735285, 1.9778, 0.6431373, 0, 1, 1,
0.7032117, -0.1377857, 2.307937, 0.6509804, 0, 1, 1,
0.7056922, 0.8575739, -0.4175476, 0.654902, 0, 1, 1,
0.7072417, -0.4353926, 2.122319, 0.6627451, 0, 1, 1,
0.7079521, 1.424199, 0.2646608, 0.6666667, 0, 1, 1,
0.7102016, 0.5957403, 0.6887513, 0.6745098, 0, 1, 1,
0.7114835, -0.5495437, 4.200494, 0.6784314, 0, 1, 1,
0.7117226, 2.051313, -0.09674131, 0.6862745, 0, 1, 1,
0.7127861, -0.1381755, 0.8634312, 0.6901961, 0, 1, 1,
0.7136347, 0.6243363, 0.9285876, 0.6980392, 0, 1, 1,
0.7158079, 0.4286834, 1.822828, 0.7058824, 0, 1, 1,
0.7178292, 1.988139, 1.386864, 0.7098039, 0, 1, 1,
0.7198502, -0.6193864, 0.8326827, 0.7176471, 0, 1, 1,
0.7217199, -0.61438, 3.365234, 0.7215686, 0, 1, 1,
0.7250367, -0.4181872, 0.1527688, 0.7294118, 0, 1, 1,
0.7288709, -0.9122798, 2.66039, 0.7333333, 0, 1, 1,
0.730774, -0.1914832, 2.832339, 0.7411765, 0, 1, 1,
0.7325427, 1.654944, 0.3405645, 0.7450981, 0, 1, 1,
0.7377871, -0.4749772, 1.694996, 0.7529412, 0, 1, 1,
0.7429723, -1.30715, 1.806082, 0.7568628, 0, 1, 1,
0.7453226, -0.01336432, 3.06323, 0.7647059, 0, 1, 1,
0.7459598, -0.8450655, 3.253018, 0.7686275, 0, 1, 1,
0.748109, 0.5754223, 1.605594, 0.7764706, 0, 1, 1,
0.752284, -1.565365, 2.56443, 0.7803922, 0, 1, 1,
0.7585465, -0.9643289, 1.820238, 0.7882353, 0, 1, 1,
0.7603237, -0.265211, 1.215188, 0.7921569, 0, 1, 1,
0.7673135, -0.6722993, 3.625996, 0.8, 0, 1, 1,
0.7718917, -0.8167365, 2.026729, 0.8078431, 0, 1, 1,
0.7719902, -0.4904713, 1.078257, 0.8117647, 0, 1, 1,
0.7721916, 0.7924667, -0.3211009, 0.8196079, 0, 1, 1,
0.7762421, -1.025523, 1.122795, 0.8235294, 0, 1, 1,
0.7773579, -1.827262, 1.367424, 0.8313726, 0, 1, 1,
0.7786296, -0.4220098, 1.221442, 0.8352941, 0, 1, 1,
0.7849451, -2.320031, 1.875195, 0.8431373, 0, 1, 1,
0.7870487, -0.9249347, 2.589332, 0.8470588, 0, 1, 1,
0.7899541, 0.7089791, 0.2023238, 0.854902, 0, 1, 1,
0.7933809, 1.824916, 1.778901, 0.8588235, 0, 1, 1,
0.7953507, 2.125073, -2.114666, 0.8666667, 0, 1, 1,
0.7998055, 0.5222863, -0.4621172, 0.8705882, 0, 1, 1,
0.8004777, -0.2690209, -0.09598695, 0.8784314, 0, 1, 1,
0.8024763, 1.895213, -0.1365151, 0.8823529, 0, 1, 1,
0.8049235, -0.100297, 1.680019, 0.8901961, 0, 1, 1,
0.8055773, 0.4408401, 0.9889394, 0.8941177, 0, 1, 1,
0.8095772, -0.1619895, 0.4642331, 0.9019608, 0, 1, 1,
0.8147641, -0.585102, 1.113103, 0.9098039, 0, 1, 1,
0.8157057, -0.3230592, 0.7758694, 0.9137255, 0, 1, 1,
0.8212073, 0.1819101, 1.519092, 0.9215686, 0, 1, 1,
0.8268922, -0.6756973, 2.632812, 0.9254902, 0, 1, 1,
0.8339154, -0.7881914, 1.104064, 0.9333333, 0, 1, 1,
0.8346393, 1.29112, -0.1218408, 0.9372549, 0, 1, 1,
0.8347973, 0.4231437, 2.290124, 0.945098, 0, 1, 1,
0.8356689, -0.4915877, 1.457487, 0.9490196, 0, 1, 1,
0.8381974, -0.01989858, 1.957087, 0.9568627, 0, 1, 1,
0.8409029, -0.2570509, 2.005311, 0.9607843, 0, 1, 1,
0.8423474, -1.069473, 2.771548, 0.9686275, 0, 1, 1,
0.8538998, 0.01296789, 0.4427727, 0.972549, 0, 1, 1,
0.8556687, -2.382489, 2.652405, 0.9803922, 0, 1, 1,
0.8594633, 0.6415676, 1.073472, 0.9843137, 0, 1, 1,
0.8602934, -1.701531, 2.211516, 0.9921569, 0, 1, 1,
0.8622128, 0.2744479, -0.9482824, 0.9960784, 0, 1, 1,
0.8803622, 1.683603, 0.7381903, 1, 0, 0.9960784, 1,
0.8831418, -0.3881438, 3.76252, 1, 0, 0.9882353, 1,
0.8875329, 0.1312781, 1.400433, 1, 0, 0.9843137, 1,
0.8949536, -0.03838935, 3.108472, 1, 0, 0.9764706, 1,
0.8968428, 2.283186, 0.3362967, 1, 0, 0.972549, 1,
0.8972301, -1.739818, 3.532444, 1, 0, 0.9647059, 1,
0.9054411, 1.034214, -0.03266205, 1, 0, 0.9607843, 1,
0.9091168, -0.8051002, 2.106307, 1, 0, 0.9529412, 1,
0.9220901, 0.4215459, 2.822303, 1, 0, 0.9490196, 1,
0.9263928, -1.08699, 4.461455, 1, 0, 0.9411765, 1,
0.9279116, 1.329441, 0.2859979, 1, 0, 0.9372549, 1,
0.9310154, 0.838039, 1.640008, 1, 0, 0.9294118, 1,
0.9333452, -0.3262768, 2.001392, 1, 0, 0.9254902, 1,
0.9345391, 0.2255352, 0.07444993, 1, 0, 0.9176471, 1,
0.9370621, 0.5729927, 2.464835, 1, 0, 0.9137255, 1,
0.9583103, 0.8614295, -0.06758657, 1, 0, 0.9058824, 1,
0.958455, 0.2143224, 0.3125485, 1, 0, 0.9019608, 1,
0.9733414, 0.8308968, 0.9107388, 1, 0, 0.8941177, 1,
0.9991215, 2.340636, 0.862082, 1, 0, 0.8862745, 1,
1.002298, -0.4822063, 1.793193, 1, 0, 0.8823529, 1,
1.003012, -1.059575, 1.742875, 1, 0, 0.8745098, 1,
1.011755, 0.4027751, 2.684199, 1, 0, 0.8705882, 1,
1.017001, 1.423363, 1.029902, 1, 0, 0.8627451, 1,
1.027917, 0.2415209, 1.105554, 1, 0, 0.8588235, 1,
1.029725, -0.7224862, 1.313511, 1, 0, 0.8509804, 1,
1.030808, -0.3239363, 0.2992643, 1, 0, 0.8470588, 1,
1.031042, 0.7692071, 0.4666521, 1, 0, 0.8392157, 1,
1.045045, 0.2496689, 0.7159372, 1, 0, 0.8352941, 1,
1.045757, 0.638346, 0.572825, 1, 0, 0.827451, 1,
1.04673, 0.5416555, 1.450046, 1, 0, 0.8235294, 1,
1.047575, 1.738476, -0.93101, 1, 0, 0.8156863, 1,
1.048097, 0.06135166, 0.7295915, 1, 0, 0.8117647, 1,
1.055197, 1.486854, 1.061212, 1, 0, 0.8039216, 1,
1.0648, -1.33725, 2.351687, 1, 0, 0.7960784, 1,
1.067389, -0.1381048, 1.882274, 1, 0, 0.7921569, 1,
1.0706, 0.9853601, 0.4557272, 1, 0, 0.7843137, 1,
1.074046, -1.24779, 0.5303883, 1, 0, 0.7803922, 1,
1.081255, 0.8395281, 0.7889015, 1, 0, 0.772549, 1,
1.083268, 0.0408597, 0.919996, 1, 0, 0.7686275, 1,
1.086226, 0.01222027, 1.00334, 1, 0, 0.7607843, 1,
1.089166, -1.253063, 0.4154175, 1, 0, 0.7568628, 1,
1.100762, -0.9501457, 1.815592, 1, 0, 0.7490196, 1,
1.102022, 1.107863, 0.9899493, 1, 0, 0.7450981, 1,
1.129916, 0.228957, 1.230801, 1, 0, 0.7372549, 1,
1.138474, -0.6988683, 3.713867, 1, 0, 0.7333333, 1,
1.143303, 0.1590443, 2.510192, 1, 0, 0.7254902, 1,
1.143486, 0.9401107, 0.5210856, 1, 0, 0.7215686, 1,
1.156165, 0.363759, 0.8684905, 1, 0, 0.7137255, 1,
1.164185, -0.4382603, 1.002527, 1, 0, 0.7098039, 1,
1.164259, -0.441276, 1.327259, 1, 0, 0.7019608, 1,
1.168129, 2.240422, 0.7176462, 1, 0, 0.6941177, 1,
1.16987, -1.98186, 2.52954, 1, 0, 0.6901961, 1,
1.180484, 0.07511598, 1.262645, 1, 0, 0.682353, 1,
1.184543, 0.03259931, 1.622606, 1, 0, 0.6784314, 1,
1.186967, 2.5716, -0.157106, 1, 0, 0.6705883, 1,
1.192841, -0.4012946, 3.503283, 1, 0, 0.6666667, 1,
1.1999, -1.634313, 2.547686, 1, 0, 0.6588235, 1,
1.206207, 0.40234, 0.3773228, 1, 0, 0.654902, 1,
1.209727, 0.3936769, -0.6217972, 1, 0, 0.6470588, 1,
1.216663, 0.6786097, 1.225292, 1, 0, 0.6431373, 1,
1.217701, -0.68933, 1.610325, 1, 0, 0.6352941, 1,
1.218086, 0.2545577, 0.7583138, 1, 0, 0.6313726, 1,
1.226016, 2.129944, 1.116138, 1, 0, 0.6235294, 1,
1.22834, -0.1429906, 1.741217, 1, 0, 0.6196079, 1,
1.230539, -1.00878, 2.087322, 1, 0, 0.6117647, 1,
1.2544, -0.8944153, 3.045288, 1, 0, 0.6078432, 1,
1.25816, 1.132913, 3.191759, 1, 0, 0.6, 1,
1.258612, -0.5330595, 2.857175, 1, 0, 0.5921569, 1,
1.277112, 0.4182662, 0.2260745, 1, 0, 0.5882353, 1,
1.27861, 0.8586336, 0.3162362, 1, 0, 0.5803922, 1,
1.289789, -1.674258, 3.517969, 1, 0, 0.5764706, 1,
1.296319, 0.05872596, -0.9582993, 1, 0, 0.5686275, 1,
1.300881, -1.29161, 3.789871, 1, 0, 0.5647059, 1,
1.30093, 0.3645448, 1.477038, 1, 0, 0.5568628, 1,
1.303097, -1.580851, 1.940931, 1, 0, 0.5529412, 1,
1.305632, -1.241864, 1.336421, 1, 0, 0.5450981, 1,
1.311464, 0.08428448, 2.128299, 1, 0, 0.5411765, 1,
1.31492, 0.1413055, 0.599378, 1, 0, 0.5333334, 1,
1.325148, -0.9028358, 2.581061, 1, 0, 0.5294118, 1,
1.326195, -0.9734286, 2.912741, 1, 0, 0.5215687, 1,
1.344657, 0.1885839, 1.41535, 1, 0, 0.5176471, 1,
1.346066, 1.162299, 0.3123946, 1, 0, 0.509804, 1,
1.34769, -1.429761, -0.5767928, 1, 0, 0.5058824, 1,
1.355739, -1.151749, 2.730985, 1, 0, 0.4980392, 1,
1.361862, 0.003252383, 1.352908, 1, 0, 0.4901961, 1,
1.365018, -0.7828794, 1.655566, 1, 0, 0.4862745, 1,
1.365718, 0.2535971, 0.3998902, 1, 0, 0.4784314, 1,
1.367615, 1.293879, 2.256179, 1, 0, 0.4745098, 1,
1.369426, -0.4307918, 3.185805, 1, 0, 0.4666667, 1,
1.377843, -1.176219, 0.1776992, 1, 0, 0.4627451, 1,
1.38069, -1.969473, 3.073914, 1, 0, 0.454902, 1,
1.400892, -1.549053, 1.397338, 1, 0, 0.4509804, 1,
1.400929, -0.5893281, 1.187185, 1, 0, 0.4431373, 1,
1.406667, 1.243997, -0.2318643, 1, 0, 0.4392157, 1,
1.412069, 0.7951526, 1.434433, 1, 0, 0.4313726, 1,
1.418423, 0.4623087, 0.5426094, 1, 0, 0.427451, 1,
1.422018, 1.426451, 2.80206, 1, 0, 0.4196078, 1,
1.422917, 0.2463661, 1.798956, 1, 0, 0.4156863, 1,
1.435619, 0.2741109, 1.496633, 1, 0, 0.4078431, 1,
1.456329, 1.009829, 2.84314, 1, 0, 0.4039216, 1,
1.458729, 0.2567511, 3.004689, 1, 0, 0.3960784, 1,
1.460063, 0.3628004, 1.28154, 1, 0, 0.3882353, 1,
1.463097, 1.647394, 1.231541, 1, 0, 0.3843137, 1,
1.472377, -0.4673834, 0.1888596, 1, 0, 0.3764706, 1,
1.472575, 1.805835, 0.1843419, 1, 0, 0.372549, 1,
1.476341, -1.481075, 2.693331, 1, 0, 0.3647059, 1,
1.482989, -0.3346823, 2.23049, 1, 0, 0.3607843, 1,
1.485471, 0.4129435, 1.011594, 1, 0, 0.3529412, 1,
1.487979, 0.05402972, 1.068987, 1, 0, 0.3490196, 1,
1.495977, -0.3832529, 1.700485, 1, 0, 0.3411765, 1,
1.503734, 1.814414, 1.207426, 1, 0, 0.3372549, 1,
1.530046, -1.429309, 4.154543, 1, 0, 0.3294118, 1,
1.567038, 1.486323, -1.655937, 1, 0, 0.3254902, 1,
1.569688, 0.5546672, -0.1022209, 1, 0, 0.3176471, 1,
1.572818, -0.2218137, 2.512357, 1, 0, 0.3137255, 1,
1.593799, -1.274291, 2.277924, 1, 0, 0.3058824, 1,
1.608949, 0.6226445, 0.6154316, 1, 0, 0.2980392, 1,
1.650216, 0.9316109, 1.267931, 1, 0, 0.2941177, 1,
1.659001, 0.7350045, 1.660855, 1, 0, 0.2862745, 1,
1.667121, -0.9460089, 2.643409, 1, 0, 0.282353, 1,
1.670782, -1.24117, 2.088899, 1, 0, 0.2745098, 1,
1.675885, -1.57886, 0.8968368, 1, 0, 0.2705882, 1,
1.704071, -0.09036747, 1.052667, 1, 0, 0.2627451, 1,
1.724916, 0.263291, 0.6396686, 1, 0, 0.2588235, 1,
1.729218, 1.099807, 3.044862, 1, 0, 0.2509804, 1,
1.74162, 0.6614235, -0.3923523, 1, 0, 0.2470588, 1,
1.773785, 0.8495811, 1.195186, 1, 0, 0.2392157, 1,
1.775289, -1.367409, 1.249252, 1, 0, 0.2352941, 1,
1.787071, -0.445475, 2.925947, 1, 0, 0.227451, 1,
1.79726, -0.4940282, 1.544157, 1, 0, 0.2235294, 1,
1.79753, 0.07676503, 1.443635, 1, 0, 0.2156863, 1,
1.818554, 0.274213, 1.556134, 1, 0, 0.2117647, 1,
1.82679, -1.525674, 1.529865, 1, 0, 0.2039216, 1,
1.833725, -0.9829853, 2.285542, 1, 0, 0.1960784, 1,
1.836204, 0.5902793, -0.9346231, 1, 0, 0.1921569, 1,
1.851713, 0.3340504, 1.96443, 1, 0, 0.1843137, 1,
1.85691, 0.3678772, 2.030572, 1, 0, 0.1803922, 1,
1.896963, -1.294729, 2.55058, 1, 0, 0.172549, 1,
1.902523, 0.64838, -0.2673222, 1, 0, 0.1686275, 1,
1.912333, -1.576618, 1.228967, 1, 0, 0.1607843, 1,
1.925531, 0.8894868, 0.9595994, 1, 0, 0.1568628, 1,
1.928374, 0.9035965, 0.5893522, 1, 0, 0.1490196, 1,
1.975976, -0.7576208, 2.238608, 1, 0, 0.145098, 1,
2.039547, 0.4542151, 1.610893, 1, 0, 0.1372549, 1,
2.04686, -2.01267, 1.927227, 1, 0, 0.1333333, 1,
2.108675, 1.617238, -0.3996154, 1, 0, 0.1254902, 1,
2.162676, 1.20182, 2.167679, 1, 0, 0.1215686, 1,
2.178225, -1.325492, 1.295828, 1, 0, 0.1137255, 1,
2.226296, 0.6699616, 0.9145568, 1, 0, 0.1098039, 1,
2.259383, 0.6317426, 1.509733, 1, 0, 0.1019608, 1,
2.263163, -1.693987, 2.409205, 1, 0, 0.09411765, 1,
2.277745, 0.5748633, -0.3526578, 1, 0, 0.09019608, 1,
2.317244, 0.2306288, 3.374796, 1, 0, 0.08235294, 1,
2.347103, -1.36233, 1.959299, 1, 0, 0.07843138, 1,
2.358276, 1.798886, 1.24577, 1, 0, 0.07058824, 1,
2.44332, 0.7881641, 1.486339, 1, 0, 0.06666667, 1,
2.560197, 0.8867995, 2.4196, 1, 0, 0.05882353, 1,
2.589884, -0.2211542, 0.9270064, 1, 0, 0.05490196, 1,
2.703742, 0.1187457, 0.3630964, 1, 0, 0.04705882, 1,
2.712282, 0.7683172, 1.22081, 1, 0, 0.04313726, 1,
2.821793, 0.7317535, 0.7064984, 1, 0, 0.03529412, 1,
2.854951, 0.452242, 1.350945, 1, 0, 0.03137255, 1,
2.995753, 0.2211282, 1.199311, 1, 0, 0.02352941, 1,
3.279986, -0.9272401, 2.790408, 1, 0, 0.01960784, 1,
3.522899, -0.6530269, 1.134407, 1, 0, 0.01176471, 1,
3.803964, 1.36464, -0.6201069, 1, 0, 0.007843138, 1
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
0.4164587, -3.716048, -7.387826, 0, -0.5, 0.5, 0.5,
0.4164587, -3.716048, -7.387826, 1, -0.5, 0.5, 0.5,
0.4164587, -3.716048, -7.387826, 1, 1.5, 0.5, 0.5,
0.4164587, -3.716048, -7.387826, 0, 1.5, 0.5, 0.5
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
-4.119411, 0.1369774, -7.387826, 0, -0.5, 0.5, 0.5,
-4.119411, 0.1369774, -7.387826, 1, -0.5, 0.5, 0.5,
-4.119411, 0.1369774, -7.387826, 1, 1.5, 0.5, 0.5,
-4.119411, 0.1369774, -7.387826, 0, 1.5, 0.5, 0.5
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
-4.119411, -3.716048, -0.182677, 0, -0.5, 0.5, 0.5,
-4.119411, -3.716048, -0.182677, 1, -0.5, 0.5, 0.5,
-4.119411, -3.716048, -0.182677, 1, 1.5, 0.5, 0.5,
-4.119411, -3.716048, -0.182677, 0, 1.5, 0.5, 0.5
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
-2, -2.826888, -5.7251,
3, -2.826888, -5.7251,
-2, -2.826888, -5.7251,
-2, -2.975082, -6.002221,
-1, -2.826888, -5.7251,
-1, -2.975082, -6.002221,
0, -2.826888, -5.7251,
0, -2.975082, -6.002221,
1, -2.826888, -5.7251,
1, -2.975082, -6.002221,
2, -2.826888, -5.7251,
2, -2.975082, -6.002221,
3, -2.826888, -5.7251,
3, -2.975082, -6.002221
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
-2, -3.271468, -6.556463, 0, -0.5, 0.5, 0.5,
-2, -3.271468, -6.556463, 1, -0.5, 0.5, 0.5,
-2, -3.271468, -6.556463, 1, 1.5, 0.5, 0.5,
-2, -3.271468, -6.556463, 0, 1.5, 0.5, 0.5,
-1, -3.271468, -6.556463, 0, -0.5, 0.5, 0.5,
-1, -3.271468, -6.556463, 1, -0.5, 0.5, 0.5,
-1, -3.271468, -6.556463, 1, 1.5, 0.5, 0.5,
-1, -3.271468, -6.556463, 0, 1.5, 0.5, 0.5,
0, -3.271468, -6.556463, 0, -0.5, 0.5, 0.5,
0, -3.271468, -6.556463, 1, -0.5, 0.5, 0.5,
0, -3.271468, -6.556463, 1, 1.5, 0.5, 0.5,
0, -3.271468, -6.556463, 0, 1.5, 0.5, 0.5,
1, -3.271468, -6.556463, 0, -0.5, 0.5, 0.5,
1, -3.271468, -6.556463, 1, -0.5, 0.5, 0.5,
1, -3.271468, -6.556463, 1, 1.5, 0.5, 0.5,
1, -3.271468, -6.556463, 0, 1.5, 0.5, 0.5,
2, -3.271468, -6.556463, 0, -0.5, 0.5, 0.5,
2, -3.271468, -6.556463, 1, -0.5, 0.5, 0.5,
2, -3.271468, -6.556463, 1, 1.5, 0.5, 0.5,
2, -3.271468, -6.556463, 0, 1.5, 0.5, 0.5,
3, -3.271468, -6.556463, 0, -0.5, 0.5, 0.5,
3, -3.271468, -6.556463, 1, -0.5, 0.5, 0.5,
3, -3.271468, -6.556463, 1, 1.5, 0.5, 0.5,
3, -3.271468, -6.556463, 0, 1.5, 0.5, 0.5
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
-3.072672, -2, -5.7251,
-3.072672, 3, -5.7251,
-3.072672, -2, -5.7251,
-3.247128, -2, -6.002221,
-3.072672, -1, -5.7251,
-3.247128, -1, -6.002221,
-3.072672, 0, -5.7251,
-3.247128, 0, -6.002221,
-3.072672, 1, -5.7251,
-3.247128, 1, -6.002221,
-3.072672, 2, -5.7251,
-3.247128, 2, -6.002221,
-3.072672, 3, -5.7251,
-3.247128, 3, -6.002221
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
-3.596041, -2, -6.556463, 0, -0.5, 0.5, 0.5,
-3.596041, -2, -6.556463, 1, -0.5, 0.5, 0.5,
-3.596041, -2, -6.556463, 1, 1.5, 0.5, 0.5,
-3.596041, -2, -6.556463, 0, 1.5, 0.5, 0.5,
-3.596041, -1, -6.556463, 0, -0.5, 0.5, 0.5,
-3.596041, -1, -6.556463, 1, -0.5, 0.5, 0.5,
-3.596041, -1, -6.556463, 1, 1.5, 0.5, 0.5,
-3.596041, -1, -6.556463, 0, 1.5, 0.5, 0.5,
-3.596041, 0, -6.556463, 0, -0.5, 0.5, 0.5,
-3.596041, 0, -6.556463, 1, -0.5, 0.5, 0.5,
-3.596041, 0, -6.556463, 1, 1.5, 0.5, 0.5,
-3.596041, 0, -6.556463, 0, 1.5, 0.5, 0.5,
-3.596041, 1, -6.556463, 0, -0.5, 0.5, 0.5,
-3.596041, 1, -6.556463, 1, -0.5, 0.5, 0.5,
-3.596041, 1, -6.556463, 1, 1.5, 0.5, 0.5,
-3.596041, 1, -6.556463, 0, 1.5, 0.5, 0.5,
-3.596041, 2, -6.556463, 0, -0.5, 0.5, 0.5,
-3.596041, 2, -6.556463, 1, -0.5, 0.5, 0.5,
-3.596041, 2, -6.556463, 1, 1.5, 0.5, 0.5,
-3.596041, 2, -6.556463, 0, 1.5, 0.5, 0.5,
-3.596041, 3, -6.556463, 0, -0.5, 0.5, 0.5,
-3.596041, 3, -6.556463, 1, -0.5, 0.5, 0.5,
-3.596041, 3, -6.556463, 1, 1.5, 0.5, 0.5,
-3.596041, 3, -6.556463, 0, 1.5, 0.5, 0.5
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
-3.072672, -2.826888, -4,
-3.072672, -2.826888, 4,
-3.072672, -2.826888, -4,
-3.247128, -2.975082, -4,
-3.072672, -2.826888, -2,
-3.247128, -2.975082, -2,
-3.072672, -2.826888, 0,
-3.247128, -2.975082, 0,
-3.072672, -2.826888, 2,
-3.247128, -2.975082, 2,
-3.072672, -2.826888, 4,
-3.247128, -2.975082, 4
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
-3.596041, -3.271468, -4, 0, -0.5, 0.5, 0.5,
-3.596041, -3.271468, -4, 1, -0.5, 0.5, 0.5,
-3.596041, -3.271468, -4, 1, 1.5, 0.5, 0.5,
-3.596041, -3.271468, -4, 0, 1.5, 0.5, 0.5,
-3.596041, -3.271468, -2, 0, -0.5, 0.5, 0.5,
-3.596041, -3.271468, -2, 1, -0.5, 0.5, 0.5,
-3.596041, -3.271468, -2, 1, 1.5, 0.5, 0.5,
-3.596041, -3.271468, -2, 0, 1.5, 0.5, 0.5,
-3.596041, -3.271468, 0, 0, -0.5, 0.5, 0.5,
-3.596041, -3.271468, 0, 1, -0.5, 0.5, 0.5,
-3.596041, -3.271468, 0, 1, 1.5, 0.5, 0.5,
-3.596041, -3.271468, 0, 0, 1.5, 0.5, 0.5,
-3.596041, -3.271468, 2, 0, -0.5, 0.5, 0.5,
-3.596041, -3.271468, 2, 1, -0.5, 0.5, 0.5,
-3.596041, -3.271468, 2, 1, 1.5, 0.5, 0.5,
-3.596041, -3.271468, 2, 0, 1.5, 0.5, 0.5,
-3.596041, -3.271468, 4, 0, -0.5, 0.5, 0.5,
-3.596041, -3.271468, 4, 1, -0.5, 0.5, 0.5,
-3.596041, -3.271468, 4, 1, 1.5, 0.5, 0.5,
-3.596041, -3.271468, 4, 0, 1.5, 0.5, 0.5
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
-3.072672, -2.826888, -5.7251,
-3.072672, 3.100843, -5.7251,
-3.072672, -2.826888, 5.359746,
-3.072672, 3.100843, 5.359746,
-3.072672, -2.826888, -5.7251,
-3.072672, -2.826888, 5.359746,
-3.072672, 3.100843, -5.7251,
-3.072672, 3.100843, 5.359746,
-3.072672, -2.826888, -5.7251,
3.905589, -2.826888, -5.7251,
-3.072672, -2.826888, 5.359746,
3.905589, -2.826888, 5.359746,
-3.072672, 3.100843, -5.7251,
3.905589, 3.100843, -5.7251,
-3.072672, 3.100843, 5.359746,
3.905589, 3.100843, 5.359746,
3.905589, -2.826888, -5.7251,
3.905589, 3.100843, -5.7251,
3.905589, -2.826888, 5.359746,
3.905589, 3.100843, 5.359746,
3.905589, -2.826888, -5.7251,
3.905589, -2.826888, 5.359746,
3.905589, 3.100843, -5.7251,
3.905589, 3.100843, 5.359746
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
var radius = 7.67722;
var distance = 34.15682;
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
mvMatrix.translate( -0.4164587, -0.1369774, 0.182677 );
mvMatrix.scale( 1.189517, 1.400327, 0.7488387 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.15682);
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
silvex<-read.table("silvex.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-silvex$V2
```

```
## Error in eval(expr, envir, enclos): object 'silvex' not found
```

```r
y<-silvex$V3
```

```
## Error in eval(expr, envir, enclos): object 'silvex' not found
```

```r
z<-silvex$V4
```

```
## Error in eval(expr, envir, enclos): object 'silvex' not found
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
-2.971047, 0.1242721, -2.969755, 0, 0, 1, 1, 1,
-2.891727, 0.4164126, -1.449178, 1, 0, 0, 1, 1,
-2.766374, -1.862835, -2.632524, 1, 0, 0, 1, 1,
-2.535792, -0.7777539, -2.12058, 1, 0, 0, 1, 1,
-2.392247, 0.3053439, -0.8381123, 1, 0, 0, 1, 1,
-2.382953, -0.1708227, -0.6017997, 1, 0, 0, 1, 1,
-2.356229, -1.436445, -1.624115, 0, 0, 0, 1, 1,
-2.324197, -0.2127617, -1.801469, 0, 0, 0, 1, 1,
-2.289252, 1.482117, -2.583469, 0, 0, 0, 1, 1,
-2.222985, -0.5376107, -0.148963, 0, 0, 0, 1, 1,
-2.172334, -1.670437, -1.076991, 0, 0, 0, 1, 1,
-2.150978, -2.740562, -4.260985, 0, 0, 0, 1, 1,
-2.136599, -0.738982, -1.241725, 0, 0, 0, 1, 1,
-2.122738, -0.2212899, -2.314317, 1, 1, 1, 1, 1,
-2.082349, -1.168571, -1.751387, 1, 1, 1, 1, 1,
-2.075101, 0.7231708, -0.8066446, 1, 1, 1, 1, 1,
-1.991444, -0.3671097, -3.125849, 1, 1, 1, 1, 1,
-1.980288, -0.1472355, -2.395631, 1, 1, 1, 1, 1,
-1.973491, 1.213724, -1.308078, 1, 1, 1, 1, 1,
-1.948614, 1.427387, -2.477446, 1, 1, 1, 1, 1,
-1.923125, -0.9153495, -2.381037, 1, 1, 1, 1, 1,
-1.922259, -0.01410169, -1.772946, 1, 1, 1, 1, 1,
-1.921533, -0.3713811, -2.349146, 1, 1, 1, 1, 1,
-1.910467, 0.2457906, -2.754165, 1, 1, 1, 1, 1,
-1.910132, 1.76218, -1.108003, 1, 1, 1, 1, 1,
-1.88847, -0.7378509, -1.387871, 1, 1, 1, 1, 1,
-1.884536, 0.8526899, -3.080033, 1, 1, 1, 1, 1,
-1.853143, 0.6005899, -1.898, 1, 1, 1, 1, 1,
-1.837924, 0.5761909, -3.79565, 0, 0, 1, 1, 1,
-1.835805, 0.3704335, -0.9389411, 1, 0, 0, 1, 1,
-1.823188, -0.09807449, -2.418739, 1, 0, 0, 1, 1,
-1.797955, -0.6686478, -2.491415, 1, 0, 0, 1, 1,
-1.797279, 0.4547261, -1.594267, 1, 0, 0, 1, 1,
-1.793127, -0.723636, -2.258764, 1, 0, 0, 1, 1,
-1.789032, -1.052336, -2.420208, 0, 0, 0, 1, 1,
-1.778057, -0.1280547, -2.369225, 0, 0, 0, 1, 1,
-1.767181, -0.0445082, -0.4984134, 0, 0, 0, 1, 1,
-1.751651, -0.8726104, -1.939191, 0, 0, 0, 1, 1,
-1.734964, 0.06923798, -1.770066, 0, 0, 0, 1, 1,
-1.72489, -0.1748466, -1.866459, 0, 0, 0, 1, 1,
-1.71414, -0.8439932, -0.517665, 0, 0, 0, 1, 1,
-1.713416, 0.1556578, -0.6257012, 1, 1, 1, 1, 1,
-1.687327, 0.4090997, -2.46989, 1, 1, 1, 1, 1,
-1.673727, -1.478606, 0.4908902, 1, 1, 1, 1, 1,
-1.666673, 0.1303154, 0.5847635, 1, 1, 1, 1, 1,
-1.658977, -0.9334024, -0.7333103, 1, 1, 1, 1, 1,
-1.650668, -0.01263592, -2.006851, 1, 1, 1, 1, 1,
-1.643113, -0.9982972, -2.460836, 1, 1, 1, 1, 1,
-1.642407, 0.2640001, -1.135824, 1, 1, 1, 1, 1,
-1.641934, -0.3717255, -1.764075, 1, 1, 1, 1, 1,
-1.641656, -0.0613245, -1.725364, 1, 1, 1, 1, 1,
-1.629123, 0.09258857, -0.9309053, 1, 1, 1, 1, 1,
-1.617867, -1.433174, -1.626973, 1, 1, 1, 1, 1,
-1.615231, -1.463429, -4.314113, 1, 1, 1, 1, 1,
-1.611445, -0.3489111, -1.144457, 1, 1, 1, 1, 1,
-1.592933, -0.7515325, -0.6055065, 1, 1, 1, 1, 1,
-1.592511, 0.05778072, -2.271876, 0, 0, 1, 1, 1,
-1.566045, 1.066044, 0.09173037, 1, 0, 0, 1, 1,
-1.552982, 1.773361, -1.254773, 1, 0, 0, 1, 1,
-1.531097, 0.9551612, -2.472439, 1, 0, 0, 1, 1,
-1.529135, -0.6773019, -1.935257, 1, 0, 0, 1, 1,
-1.526374, -0.6262339, -2.167978, 1, 0, 0, 1, 1,
-1.511135, 1.730978, 0.4398954, 0, 0, 0, 1, 1,
-1.506508, 0.490326, -1.45954, 0, 0, 0, 1, 1,
-1.50447, -1.058639, -4.982753, 0, 0, 0, 1, 1,
-1.496673, 1.060333, -2.069259, 0, 0, 0, 1, 1,
-1.486087, -1.191837, -2.927808, 0, 0, 0, 1, 1,
-1.48208, -0.271646, -0.4982461, 0, 0, 0, 1, 1,
-1.467176, -1.144457, -2.852211, 0, 0, 0, 1, 1,
-1.460899, 0.4598462, -2.369581, 1, 1, 1, 1, 1,
-1.451165, 1.656371, -1.760185, 1, 1, 1, 1, 1,
-1.446418, 0.9544258, 0.06197465, 1, 1, 1, 1, 1,
-1.443369, -0.2767904, -2.047324, 1, 1, 1, 1, 1,
-1.436015, -0.7873823, -2.110001, 1, 1, 1, 1, 1,
-1.429605, -1.523569, -1.013486, 1, 1, 1, 1, 1,
-1.427856, -0.1664056, -1.772727, 1, 1, 1, 1, 1,
-1.425726, 0.1835577, -1.641994, 1, 1, 1, 1, 1,
-1.409357, -0.574901, -1.548705, 1, 1, 1, 1, 1,
-1.404356, 0.4621145, -1.937721, 1, 1, 1, 1, 1,
-1.394282, -1.817944, -2.596981, 1, 1, 1, 1, 1,
-1.394044, 0.9238904, -1.084378, 1, 1, 1, 1, 1,
-1.392769, 1.654478, -0.2449001, 1, 1, 1, 1, 1,
-1.388247, 0.216107, -0.132837, 1, 1, 1, 1, 1,
-1.388205, 1.498433, -1.779527, 1, 1, 1, 1, 1,
-1.378453, -1.035716, -1.52971, 0, 0, 1, 1, 1,
-1.375013, 0.006158984, -2.397162, 1, 0, 0, 1, 1,
-1.369604, -0.4592936, -1.287601, 1, 0, 0, 1, 1,
-1.364443, -0.7193424, -1.933501, 1, 0, 0, 1, 1,
-1.358937, 0.8702729, 1.700845, 1, 0, 0, 1, 1,
-1.35321, 0.8813587, -2.144263, 1, 0, 0, 1, 1,
-1.348947, -0.06486802, -0.1283527, 0, 0, 0, 1, 1,
-1.347028, -1.648583, -3.167194, 0, 0, 0, 1, 1,
-1.343613, -0.007418232, -2.938131, 0, 0, 0, 1, 1,
-1.342254, -0.6364193, -0.2696037, 0, 0, 0, 1, 1,
-1.341405, -0.7981935, -2.306683, 0, 0, 0, 1, 1,
-1.339146, 1.790432, -0.4865318, 0, 0, 0, 1, 1,
-1.338475, 2.427376, -0.7409234, 0, 0, 0, 1, 1,
-1.335196, -0.2699258, -0.08758447, 1, 1, 1, 1, 1,
-1.31288, -1.615109, -2.169771, 1, 1, 1, 1, 1,
-1.305018, 0.1170847, -1.353731, 1, 1, 1, 1, 1,
-1.290457, -0.1564938, -1.753401, 1, 1, 1, 1, 1,
-1.269923, -0.4702729, -0.621724, 1, 1, 1, 1, 1,
-1.265656, 0.4432041, -1.523503, 1, 1, 1, 1, 1,
-1.265314, 0.6868428, -1.643518, 1, 1, 1, 1, 1,
-1.253061, -0.6572728, -1.530468, 1, 1, 1, 1, 1,
-1.23885, -0.03310929, -0.8970042, 1, 1, 1, 1, 1,
-1.237594, -0.6038438, -1.784314, 1, 1, 1, 1, 1,
-1.227928, 1.052561, -1.66106, 1, 1, 1, 1, 1,
-1.220714, 1.307276, -2.316283, 1, 1, 1, 1, 1,
-1.20474, 1.57694, -0.659113, 1, 1, 1, 1, 1,
-1.204529, -0.07087789, -1.221705, 1, 1, 1, 1, 1,
-1.196415, 0.1729819, -2.292831, 1, 1, 1, 1, 1,
-1.195492, -0.2229761, -0.8867847, 0, 0, 1, 1, 1,
-1.192118, 0.6532653, -1.052709, 1, 0, 0, 1, 1,
-1.182766, -0.8152699, -2.057331, 1, 0, 0, 1, 1,
-1.175157, -0.3828101, 0.2550455, 1, 0, 0, 1, 1,
-1.173525, 0.3096682, -2.023152, 1, 0, 0, 1, 1,
-1.172421, -0.3106315, -1.922085, 1, 0, 0, 1, 1,
-1.168831, 1.081153, -0.629995, 0, 0, 0, 1, 1,
-1.168065, -1.408449, -1.893112, 0, 0, 0, 1, 1,
-1.167587, -0.1167935, -2.114474, 0, 0, 0, 1, 1,
-1.162038, -0.61851, -1.747509, 0, 0, 0, 1, 1,
-1.161616, 0.9665825, 1.996442, 0, 0, 0, 1, 1,
-1.160355, 0.1002199, -1.141711, 0, 0, 0, 1, 1,
-1.160189, -0.3451291, 0.6221419, 0, 0, 0, 1, 1,
-1.152337, 0.3121836, -0.8144214, 1, 1, 1, 1, 1,
-1.147394, -0.7377744, -0.257827, 1, 1, 1, 1, 1,
-1.137006, 0.8372367, -0.7896743, 1, 1, 1, 1, 1,
-1.133241, -1.218795, -1.107286, 1, 1, 1, 1, 1,
-1.131857, 0.8005459, 0.06735555, 1, 1, 1, 1, 1,
-1.130188, 1.048615, -1.853686, 1, 1, 1, 1, 1,
-1.126308, -0.1308852, -1.432959, 1, 1, 1, 1, 1,
-1.125479, -1.164823, -2.532673, 1, 1, 1, 1, 1,
-1.121578, -1.627858, -2.289809, 1, 1, 1, 1, 1,
-1.121175, 0.9154193, 0.239166, 1, 1, 1, 1, 1,
-1.120235, 1.37195, -0.1279946, 1, 1, 1, 1, 1,
-1.118251, 0.3534052, -0.2229764, 1, 1, 1, 1, 1,
-1.109692, 1.082484, -1.591663, 1, 1, 1, 1, 1,
-1.109, -1.934025, -3.229215, 1, 1, 1, 1, 1,
-1.107542, -0.8015571, -1.868939, 1, 1, 1, 1, 1,
-1.095553, -1.563844, -2.932552, 0, 0, 1, 1, 1,
-1.083576, 0.97526, -1.441173, 1, 0, 0, 1, 1,
-1.08265, 0.3968602, -2.765007, 1, 0, 0, 1, 1,
-1.082631, 0.4510343, -1.257298, 1, 0, 0, 1, 1,
-1.077992, -0.7537376, -0.671701, 1, 0, 0, 1, 1,
-1.076591, -0.3340147, -1.462362, 1, 0, 0, 1, 1,
-1.070969, 1.841985, -1.530288, 0, 0, 0, 1, 1,
-1.068071, -2.66502, -3.974658, 0, 0, 0, 1, 1,
-1.047454, -1.626234, -2.039769, 0, 0, 0, 1, 1,
-1.038134, -1.247226, -2.960115, 0, 0, 0, 1, 1,
-1.035909, -0.6996073, -1.176971, 0, 0, 0, 1, 1,
-1.027054, 1.39425, 0.8921078, 0, 0, 0, 1, 1,
-1.022491, -0.2734954, -1.978549, 0, 0, 0, 1, 1,
-1.020065, -1.058845, -3.242576, 1, 1, 1, 1, 1,
-1.015882, 0.6793857, -2.051265, 1, 1, 1, 1, 1,
-1.00705, -0.09778806, -0.9600804, 1, 1, 1, 1, 1,
-1.00077, -0.05405023, -1.685008, 1, 1, 1, 1, 1,
-0.9910221, -0.675576, -3.470743, 1, 1, 1, 1, 1,
-0.9893162, 1.181811, -1.678373, 1, 1, 1, 1, 1,
-0.986207, 0.3378655, -0.6932018, 1, 1, 1, 1, 1,
-0.9856225, 1.575693, -0.4735519, 1, 1, 1, 1, 1,
-0.9728712, -1.686846, -2.875202, 1, 1, 1, 1, 1,
-0.9616188, 0.3992095, -1.93126, 1, 1, 1, 1, 1,
-0.9564702, 0.6812301, -2.334299, 1, 1, 1, 1, 1,
-0.9522779, 0.1651342, -2.998792, 1, 1, 1, 1, 1,
-0.9487144, -0.5639741, -3.385292, 1, 1, 1, 1, 1,
-0.9448715, 0.04883008, -0.245679, 1, 1, 1, 1, 1,
-0.9420027, -2.322251, -1.772647, 1, 1, 1, 1, 1,
-0.9347058, -0.3206411, -2.762969, 0, 0, 1, 1, 1,
-0.9292186, 0.6037532, -1.676891, 1, 0, 0, 1, 1,
-0.9217362, -0.05082186, -0.407049, 1, 0, 0, 1, 1,
-0.919987, -0.6579385, -3.5739, 1, 0, 0, 1, 1,
-0.9193769, -1.447051, -4.259102, 1, 0, 0, 1, 1,
-0.917741, -1.886505, -2.830007, 1, 0, 0, 1, 1,
-0.9128799, 0.3632836, -0.1901946, 0, 0, 0, 1, 1,
-0.9111075, 0.3848341, 1.242656, 0, 0, 0, 1, 1,
-0.9021084, 0.2824258, -3.542951, 0, 0, 0, 1, 1,
-0.8974277, -1.034693, -3.349684, 0, 0, 0, 1, 1,
-0.8973073, 0.06245488, -3.611269, 0, 0, 0, 1, 1,
-0.8968957, -2.212121, -3.465759, 0, 0, 0, 1, 1,
-0.8957887, 0.3230259, -0.6931844, 0, 0, 0, 1, 1,
-0.8939936, -1.42017, -2.592465, 1, 1, 1, 1, 1,
-0.8916854, -0.6120378, -1.275694, 1, 1, 1, 1, 1,
-0.8914691, 0.9830528, -0.460507, 1, 1, 1, 1, 1,
-0.8870941, 0.4868407, -0.2647403, 1, 1, 1, 1, 1,
-0.8857216, -1.877442, -3.586798, 1, 1, 1, 1, 1,
-0.8832207, 0.6570743, -1.439615, 1, 1, 1, 1, 1,
-0.881169, -0.06608564, -0.4201038, 1, 1, 1, 1, 1,
-0.880531, -1.556413, -3.995872, 1, 1, 1, 1, 1,
-0.8799599, 0.2019486, 0.08005912, 1, 1, 1, 1, 1,
-0.8795586, -1.030837, -2.320814, 1, 1, 1, 1, 1,
-0.8789159, -1.870654, -0.7059429, 1, 1, 1, 1, 1,
-0.8746316, 2.193182, 0.7083187, 1, 1, 1, 1, 1,
-0.8714318, -0.7136578, -0.446088, 1, 1, 1, 1, 1,
-0.8656214, -0.01174407, -1.042022, 1, 1, 1, 1, 1,
-0.8643092, -0.9754529, -2.1037, 1, 1, 1, 1, 1,
-0.8627389, -0.6088728, -0.2439138, 0, 0, 1, 1, 1,
-0.8571188, -0.2112574, -2.775938, 1, 0, 0, 1, 1,
-0.8566464, 0.4675286, -2.415377, 1, 0, 0, 1, 1,
-0.8565853, -0.06302185, -1.348575, 1, 0, 0, 1, 1,
-0.8463331, 1.524292, -0.7867852, 1, 0, 0, 1, 1,
-0.8430988, 1.301738, -2.219383, 1, 0, 0, 1, 1,
-0.8423701, 2.012588, 0.7213448, 0, 0, 0, 1, 1,
-0.840417, 0.7382214, -1.446139, 0, 0, 0, 1, 1,
-0.8372011, 0.8024888, -1.272239, 0, 0, 0, 1, 1,
-0.8271222, 1.339162, -1.042084, 0, 0, 0, 1, 1,
-0.8154912, -1.661556, -2.883738, 0, 0, 0, 1, 1,
-0.8142065, 1.07394, -2.447408, 0, 0, 0, 1, 1,
-0.8109989, 0.5981107, -0.6445643, 0, 0, 0, 1, 1,
-0.8084797, -0.6922188, -2.375853, 1, 1, 1, 1, 1,
-0.8077631, -0.4486229, -0.2979178, 1, 1, 1, 1, 1,
-0.8001475, 0.965501, -0.892561, 1, 1, 1, 1, 1,
-0.7999797, 0.1069872, -2.56059, 1, 1, 1, 1, 1,
-0.7982462, 1.18296, 0.1803001, 1, 1, 1, 1, 1,
-0.7958034, -0.3512642, -1.428979, 1, 1, 1, 1, 1,
-0.7856613, -0.4842843, -1.807636, 1, 1, 1, 1, 1,
-0.7828854, 2.448298, -1.251015, 1, 1, 1, 1, 1,
-0.7815021, 0.1379324, -1.777968, 1, 1, 1, 1, 1,
-0.7777576, 1.383072, -1.332624, 1, 1, 1, 1, 1,
-0.7743237, -0.2351075, -1.791782, 1, 1, 1, 1, 1,
-0.773044, -2.284316, -1.442322, 1, 1, 1, 1, 1,
-0.7651897, -0.07157335, -1.072593, 1, 1, 1, 1, 1,
-0.7643002, -0.6275515, -2.99681, 1, 1, 1, 1, 1,
-0.7614455, 2.002922, -0.07987968, 1, 1, 1, 1, 1,
-0.7593061, 1.295358, -0.1348614, 0, 0, 1, 1, 1,
-0.7565826, -1.280107, -3.80658, 1, 0, 0, 1, 1,
-0.755343, 1.793918, 0.4095985, 1, 0, 0, 1, 1,
-0.7494204, 0.04447755, -0.9134015, 1, 0, 0, 1, 1,
-0.7474558, -1.420958, -3.164011, 1, 0, 0, 1, 1,
-0.7474379, -0.5763478, -2.88149, 1, 0, 0, 1, 1,
-0.7444242, 0.6555047, -1.471573, 0, 0, 0, 1, 1,
-0.7436798, -0.6050571, -1.918181, 0, 0, 0, 1, 1,
-0.7430894, -0.449014, -1.638552, 0, 0, 0, 1, 1,
-0.7394129, -0.9533658, -2.487446, 0, 0, 0, 1, 1,
-0.7381299, -0.01012553, -0.4552, 0, 0, 0, 1, 1,
-0.731119, 0.2024991, -0.8801675, 0, 0, 0, 1, 1,
-0.7293298, -0.2941856, -1.58091, 0, 0, 0, 1, 1,
-0.7276375, -0.6370581, -1.612937, 1, 1, 1, 1, 1,
-0.7255507, 2.312486, 0.1878092, 1, 1, 1, 1, 1,
-0.7244373, 0.4711245, -0.3121521, 1, 1, 1, 1, 1,
-0.7096528, -1.283525, -1.740568, 1, 1, 1, 1, 1,
-0.7095991, 0.8555595, 0.493023, 1, 1, 1, 1, 1,
-0.7071415, -0.524729, -1.861827, 1, 1, 1, 1, 1,
-0.7068669, 1.017609, -0.2391109, 1, 1, 1, 1, 1,
-0.7060243, -1.623086, -2.589303, 1, 1, 1, 1, 1,
-0.7047707, -0.2898699, -2.077039, 1, 1, 1, 1, 1,
-0.7037553, 0.2316057, -3.28615, 1, 1, 1, 1, 1,
-0.7006444, 0.2031705, -2.606273, 1, 1, 1, 1, 1,
-0.6989967, -0.7569888, -2.225138, 1, 1, 1, 1, 1,
-0.6947451, -0.474298, -2.888402, 1, 1, 1, 1, 1,
-0.6933697, 2.102737, -1.253062, 1, 1, 1, 1, 1,
-0.6921991, -0.7274451, -2.689392, 1, 1, 1, 1, 1,
-0.6887474, 0.3059294, -2.020781, 0, 0, 1, 1, 1,
-0.6851255, -1.480346, -1.760475, 1, 0, 0, 1, 1,
-0.6795505, -0.04691605, -2.610327, 1, 0, 0, 1, 1,
-0.6724011, -0.4569468, -2.760591, 1, 0, 0, 1, 1,
-0.667256, 0.4634064, -2.782845, 1, 0, 0, 1, 1,
-0.6505764, -2.200191, -3.30621, 1, 0, 0, 1, 1,
-0.6494688, 1.112097, -0.7650785, 0, 0, 0, 1, 1,
-0.648813, 1.055541, -3.248004, 0, 0, 0, 1, 1,
-0.6383201, 1.140601, -1.861419, 0, 0, 0, 1, 1,
-0.6378139, -0.4784082, -3.647602, 0, 0, 0, 1, 1,
-0.6355941, 1.04944, -1.101739, 0, 0, 0, 1, 1,
-0.6349317, 0.2193769, -3.253505, 0, 0, 0, 1, 1,
-0.6344144, 0.01001612, -0.3891704, 0, 0, 0, 1, 1,
-0.6324558, 0.8313096, -0.7838393, 1, 1, 1, 1, 1,
-0.6292077, -0.6408942, -2.914927, 1, 1, 1, 1, 1,
-0.6255013, 0.1284591, -1.445354, 1, 1, 1, 1, 1,
-0.6249678, 2.142319, 0.6853448, 1, 1, 1, 1, 1,
-0.6246192, -0.2152154, -2.369698, 1, 1, 1, 1, 1,
-0.6231664, -1.754781, -3.954004, 1, 1, 1, 1, 1,
-0.6207086, 0.2181251, -0.7811834, 1, 1, 1, 1, 1,
-0.6185878, -0.919751, -1.635653, 1, 1, 1, 1, 1,
-0.6118134, 0.9320782, -0.8877958, 1, 1, 1, 1, 1,
-0.6112694, -1.236701, -2.211683, 1, 1, 1, 1, 1,
-0.6060129, 0.3620354, -1.450439, 1, 1, 1, 1, 1,
-0.6051679, -0.2125131, -1.516467, 1, 1, 1, 1, 1,
-0.5981813, 0.9980144, -0.9746941, 1, 1, 1, 1, 1,
-0.59745, 1.6194, -0.3420399, 1, 1, 1, 1, 1,
-0.5970904, 0.3509066, -0.8756965, 1, 1, 1, 1, 1,
-0.5924241, 0.1817038, -1.093246, 0, 0, 1, 1, 1,
-0.5909368, -0.2408254, -1.074982, 1, 0, 0, 1, 1,
-0.5908601, 1.241292, 0.1341193, 1, 0, 0, 1, 1,
-0.5886412, 1.213087, -0.915634, 1, 0, 0, 1, 1,
-0.583516, -0.5777515, -1.908746, 1, 0, 0, 1, 1,
-0.5791227, -0.9909142, -3.066266, 1, 0, 0, 1, 1,
-0.578481, -1.686773, -3.949137, 0, 0, 0, 1, 1,
-0.5774429, -0.09158545, -2.291064, 0, 0, 0, 1, 1,
-0.572733, -1.435186, -2.762716, 0, 0, 0, 1, 1,
-0.5720408, -0.2377134, -2.306074, 0, 0, 0, 1, 1,
-0.567023, 0.9287361, -1.525148, 0, 0, 0, 1, 1,
-0.5647889, -1.659788, -2.770361, 0, 0, 0, 1, 1,
-0.5645209, 0.9962012, -0.8581911, 0, 0, 0, 1, 1,
-0.5641374, -0.5719343, -1.849189, 1, 1, 1, 1, 1,
-0.5612333, 1.187619, -1.793288, 1, 1, 1, 1, 1,
-0.5520784, 0.6075609, -0.8738746, 1, 1, 1, 1, 1,
-0.5487651, 1.749903, 0.1073233, 1, 1, 1, 1, 1,
-0.5469508, -0.5249572, -2.772566, 1, 1, 1, 1, 1,
-0.5458291, -0.1919573, -0.4168389, 1, 1, 1, 1, 1,
-0.541247, -2.38324, -3.709476, 1, 1, 1, 1, 1,
-0.5321368, 1.420964, -1.868045, 1, 1, 1, 1, 1,
-0.5234202, -0.3987776, -0.9438774, 1, 1, 1, 1, 1,
-0.5198745, -0.2048342, -2.086317, 1, 1, 1, 1, 1,
-0.5197902, -0.9854303, -3.127942, 1, 1, 1, 1, 1,
-0.519444, -0.3759834, -2.595124, 1, 1, 1, 1, 1,
-0.5176936, -0.2582607, -1.183322, 1, 1, 1, 1, 1,
-0.5113585, 0.1643183, -0.469944, 1, 1, 1, 1, 1,
-0.5062383, -0.3357713, -2.134923, 1, 1, 1, 1, 1,
-0.5059131, 1.337409, 0.1733566, 0, 0, 1, 1, 1,
-0.4981915, 0.1269652, -1.853432, 1, 0, 0, 1, 1,
-0.4974523, -1.146995, -2.496423, 1, 0, 0, 1, 1,
-0.4905952, 0.07632115, -1.518893, 1, 0, 0, 1, 1,
-0.4903428, -0.7487648, -2.968449, 1, 0, 0, 1, 1,
-0.4894952, 0.662232, -0.2911392, 1, 0, 0, 1, 1,
-0.4832605, -2.060986, -1.673604, 0, 0, 0, 1, 1,
-0.4803817, -0.5355552, -2.669894, 0, 0, 0, 1, 1,
-0.4752971, 1.197238, 1.528528, 0, 0, 0, 1, 1,
-0.4718571, -1.161346, -5.546976, 0, 0, 0, 1, 1,
-0.4698389, 1.043228, -1.007178, 0, 0, 0, 1, 1,
-0.4689529, 1.047737, 0.1297631, 0, 0, 0, 1, 1,
-0.4682416, 0.4816442, 1.12008, 0, 0, 0, 1, 1,
-0.4613521, -1.959597, -3.288585, 1, 1, 1, 1, 1,
-0.4610272, 0.9205624, -1.211216, 1, 1, 1, 1, 1,
-0.4598563, 0.09823079, -2.025377, 1, 1, 1, 1, 1,
-0.4595174, -0.7843677, -3.244035, 1, 1, 1, 1, 1,
-0.4588821, 0.1840826, 0.7195949, 1, 1, 1, 1, 1,
-0.4586773, -2.210184, -3.588093, 1, 1, 1, 1, 1,
-0.4567768, 0.7828795, -3.01898, 1, 1, 1, 1, 1,
-0.4502575, 2.013769, -0.9129226, 1, 1, 1, 1, 1,
-0.450186, -1.332886, -5.56367, 1, 1, 1, 1, 1,
-0.4446553, 0.9744852, -1.428257, 1, 1, 1, 1, 1,
-0.444415, 0.0496878, -3.979242, 1, 1, 1, 1, 1,
-0.442615, -0.7563515, -3.949613, 1, 1, 1, 1, 1,
-0.441442, 0.9542586, -1.098722, 1, 1, 1, 1, 1,
-0.4413682, -0.340847, -0.222141, 1, 1, 1, 1, 1,
-0.4386515, -0.902218, -2.676277, 1, 1, 1, 1, 1,
-0.4378111, -0.9839015, -3.391936, 0, 0, 1, 1, 1,
-0.4361487, 1.594751, -1.416273, 1, 0, 0, 1, 1,
-0.4278461, -0.8723318, -2.249755, 1, 0, 0, 1, 1,
-0.4259557, -0.4303522, -2.26491, 1, 0, 0, 1, 1,
-0.4244116, -0.06873517, -2.580899, 1, 0, 0, 1, 1,
-0.4161618, -0.6481915, -1.605249, 1, 0, 0, 1, 1,
-0.4123686, -0.3120295, -0.9254335, 0, 0, 0, 1, 1,
-0.4071648, -1.000122, -0.6948999, 0, 0, 0, 1, 1,
-0.4065244, 0.2338196, 0.9979354, 0, 0, 0, 1, 1,
-0.4022369, 0.5180413, -0.2861719, 0, 0, 0, 1, 1,
-0.4020736, 1.063394, 0.1621313, 0, 0, 0, 1, 1,
-0.3993332, -0.6667432, -1.802636, 0, 0, 0, 1, 1,
-0.3991467, 0.1011059, 0.463759, 0, 0, 0, 1, 1,
-0.3942555, -1.987864, -1.251023, 1, 1, 1, 1, 1,
-0.3936091, -0.1698348, -0.8375155, 1, 1, 1, 1, 1,
-0.3931275, -1.800165, -2.228788, 1, 1, 1, 1, 1,
-0.3930996, 0.2175485, 0.03725122, 1, 1, 1, 1, 1,
-0.3872708, -0.4314799, -2.497566, 1, 1, 1, 1, 1,
-0.3869828, 0.8571204, 0.835907, 1, 1, 1, 1, 1,
-0.383671, 1.612425, -1.008528, 1, 1, 1, 1, 1,
-0.382401, 0.3066952, -1.25465, 1, 1, 1, 1, 1,
-0.3814509, 0.5150131, -1.390704, 1, 1, 1, 1, 1,
-0.3811247, -0.3500715, -4.656874, 1, 1, 1, 1, 1,
-0.3753788, -0.3544511, -1.805786, 1, 1, 1, 1, 1,
-0.3728115, -1.455139, -4.537716, 1, 1, 1, 1, 1,
-0.3659884, 1.071114, -0.6144333, 1, 1, 1, 1, 1,
-0.3655167, -0.5048943, -4.249653, 1, 1, 1, 1, 1,
-0.3641789, -1.823153, -1.101902, 1, 1, 1, 1, 1,
-0.3597134, 0.8410269, -0.1281095, 0, 0, 1, 1, 1,
-0.3544739, -1.124538, -3.107382, 1, 0, 0, 1, 1,
-0.3470675, 0.2050999, -2.27332, 1, 0, 0, 1, 1,
-0.3462437, -0.5449198, -2.085957, 1, 0, 0, 1, 1,
-0.3418137, 0.7926837, 0.09887584, 1, 0, 0, 1, 1,
-0.3413297, 0.322881, -2.885358, 1, 0, 0, 1, 1,
-0.3413093, 2.800999, 0.6877255, 0, 0, 0, 1, 1,
-0.33839, 0.394682, -0.6259282, 0, 0, 0, 1, 1,
-0.3332975, -0.9418995, -3.312855, 0, 0, 0, 1, 1,
-0.3293267, -0.4014083, -2.152632, 0, 0, 0, 1, 1,
-0.3273388, -0.8622271, -3.186657, 0, 0, 0, 1, 1,
-0.3266975, -0.1546573, -1.140276, 0, 0, 0, 1, 1,
-0.3245313, -1.214588, -1.958627, 0, 0, 0, 1, 1,
-0.3226098, -2.423173, -3.736399, 1, 1, 1, 1, 1,
-0.321301, -0.4284155, -2.093956, 1, 1, 1, 1, 1,
-0.3205926, 0.516687, 0.4965362, 1, 1, 1, 1, 1,
-0.3199745, -0.9916189, -2.077584, 1, 1, 1, 1, 1,
-0.3175038, 0.5965187, -1.128868, 1, 1, 1, 1, 1,
-0.3173614, 0.2121724, 0.4318916, 1, 1, 1, 1, 1,
-0.3172247, -0.3796081, -0.8790938, 1, 1, 1, 1, 1,
-0.312904, 1.12167, -1.137712, 1, 1, 1, 1, 1,
-0.3114082, 0.3932052, 0.475893, 1, 1, 1, 1, 1,
-0.3107944, 1.764952, 0.1853109, 1, 1, 1, 1, 1,
-0.3105294, 0.7484955, -2.228932, 1, 1, 1, 1, 1,
-0.3096356, -0.9843765, -1.907915, 1, 1, 1, 1, 1,
-0.3054606, 1.271946, -0.3423252, 1, 1, 1, 1, 1,
-0.3034542, 1.078429, -0.5557887, 1, 1, 1, 1, 1,
-0.3014169, -0.8677972, -2.857297, 1, 1, 1, 1, 1,
-0.301277, -0.4534634, -1.781685, 0, 0, 1, 1, 1,
-0.3012765, -0.463635, -1.193946, 1, 0, 0, 1, 1,
-0.3008561, 0.278674, -1.975969, 1, 0, 0, 1, 1,
-0.2988053, -0.1315435, -3.407811, 1, 0, 0, 1, 1,
-0.2935497, -1.495773, -4.045905, 1, 0, 0, 1, 1,
-0.289515, -1.472251, -2.194537, 1, 0, 0, 1, 1,
-0.2881506, -1.065222, -1.508324, 0, 0, 0, 1, 1,
-0.288063, -0.1474148, -2.024422, 0, 0, 0, 1, 1,
-0.2850168, -0.1127402, -2.280646, 0, 0, 0, 1, 1,
-0.2798356, -0.2733492, -3.57745, 0, 0, 0, 1, 1,
-0.2775941, 0.1168541, -0.6684514, 0, 0, 0, 1, 1,
-0.2758, 1.43138, 1.911108, 0, 0, 0, 1, 1,
-0.2732372, 1.099115, 0.2897201, 0, 0, 0, 1, 1,
-0.2664164, -0.08610421, -1.999888, 1, 1, 1, 1, 1,
-0.2664047, 0.1538774, 1.381616, 1, 1, 1, 1, 1,
-0.2653183, -0.4926383, -2.608087, 1, 1, 1, 1, 1,
-0.2645656, 1.446019, -0.4476721, 1, 1, 1, 1, 1,
-0.2633727, 1.284209, 0.8831944, 1, 1, 1, 1, 1,
-0.2626503, -2.379838, -3.960062, 1, 1, 1, 1, 1,
-0.2622589, 0.825336, -0.7621835, 1, 1, 1, 1, 1,
-0.2598871, 0.06013792, -0.6588881, 1, 1, 1, 1, 1,
-0.2596595, 0.432993, -2.530856, 1, 1, 1, 1, 1,
-0.2594936, 0.208031, -0.3321512, 1, 1, 1, 1, 1,
-0.2577085, 0.7284051, 0.4863628, 1, 1, 1, 1, 1,
-0.2541534, -0.5056451, -3.698715, 1, 1, 1, 1, 1,
-0.2496667, -0.1816295, -2.971599, 1, 1, 1, 1, 1,
-0.2455046, -1.289801, -2.544969, 1, 1, 1, 1, 1,
-0.2390155, 1.271078, -0.4841264, 1, 1, 1, 1, 1,
-0.2333683, -0.3874476, -3.161799, 0, 0, 1, 1, 1,
-0.2296737, -2.039734, -1.488265, 1, 0, 0, 1, 1,
-0.2269151, -0.01972858, -1.999482, 1, 0, 0, 1, 1,
-0.2244425, 0.2786749, -0.1269877, 1, 0, 0, 1, 1,
-0.2181758, -1.68333, -3.501008, 1, 0, 0, 1, 1,
-0.2147895, -1.791778, -1.943229, 1, 0, 0, 1, 1,
-0.2139088, 0.08521438, -0.66406, 0, 0, 0, 1, 1,
-0.2099962, -0.2295412, -3.630165, 0, 0, 0, 1, 1,
-0.2088534, 0.8382023, -1.48079, 0, 0, 0, 1, 1,
-0.2081598, 1.521859, 0.9875914, 0, 0, 0, 1, 1,
-0.2046762, 0.6238971, -0.8285705, 0, 0, 0, 1, 1,
-0.2003247, 1.479898, 0.9104974, 0, 0, 0, 1, 1,
-0.1972673, 0.1757727, 0.9497548, 0, 0, 0, 1, 1,
-0.1920141, 1.304846, 0.6387266, 1, 1, 1, 1, 1,
-0.1912054, -0.4884678, -3.780852, 1, 1, 1, 1, 1,
-0.1905145, -0.5908385, -2.059335, 1, 1, 1, 1, 1,
-0.1873234, -0.06590988, -0.2559593, 1, 1, 1, 1, 1,
-0.1790213, -0.5891051, -0.661383, 1, 1, 1, 1, 1,
-0.1774974, -2.211548, -4.102488, 1, 1, 1, 1, 1,
-0.1768204, 0.1327966, -1.158014, 1, 1, 1, 1, 1,
-0.174895, 0.8156433, -0.423097, 1, 1, 1, 1, 1,
-0.173386, -1.688303, -4.070824, 1, 1, 1, 1, 1,
-0.1694204, -0.09132706, -2.287674, 1, 1, 1, 1, 1,
-0.1675461, 0.09395755, -1.737529, 1, 1, 1, 1, 1,
-0.1671904, 0.1181151, 0.7215848, 1, 1, 1, 1, 1,
-0.1669959, -0.6096361, -3.825626, 1, 1, 1, 1, 1,
-0.1649092, 1.790205, -0.02503628, 1, 1, 1, 1, 1,
-0.1632668, -0.1747382, -2.542262, 1, 1, 1, 1, 1,
-0.1590322, -1.448102, -2.510224, 0, 0, 1, 1, 1,
-0.1589419, -1.921977, -1.226712, 1, 0, 0, 1, 1,
-0.1570449, 0.2927102, -1.645245, 1, 0, 0, 1, 1,
-0.1558002, 2.027442, -1.353308, 1, 0, 0, 1, 1,
-0.1555564, 0.04682021, -0.6770402, 1, 0, 0, 1, 1,
-0.1458305, 1.855887, -0.8724897, 1, 0, 0, 1, 1,
-0.1453529, -0.3472128, -2.543023, 0, 0, 0, 1, 1,
-0.1428093, 0.9048623, -1.017202, 0, 0, 0, 1, 1,
-0.1372223, -1.533593, -3.512895, 0, 0, 0, 1, 1,
-0.1369152, 1.401514, -1.59373, 0, 0, 0, 1, 1,
-0.1364553, 0.5291299, 0.4643906, 0, 0, 0, 1, 1,
-0.1352736, -0.4744434, -2.515027, 0, 0, 0, 1, 1,
-0.1338053, -0.3231936, -2.132151, 0, 0, 0, 1, 1,
-0.133117, 0.4274601, -1.21149, 1, 1, 1, 1, 1,
-0.1310558, -0.5936549, -3.34885, 1, 1, 1, 1, 1,
-0.1290557, -0.4198812, -3.482589, 1, 1, 1, 1, 1,
-0.1279108, -0.8462708, -3.779319, 1, 1, 1, 1, 1,
-0.1278504, -0.66067, -3.704863, 1, 1, 1, 1, 1,
-0.126465, 1.173326, -0.2371658, 1, 1, 1, 1, 1,
-0.12587, 0.498916, 1.687215, 1, 1, 1, 1, 1,
-0.1242899, 0.3732436, -0.9499434, 1, 1, 1, 1, 1,
-0.1232192, -0.4836736, -3.402241, 1, 1, 1, 1, 1,
-0.1193498, -0.01516538, -0.2066929, 1, 1, 1, 1, 1,
-0.1174552, 1.755625, 0.7956467, 1, 1, 1, 1, 1,
-0.1171011, 0.3601686, -0.2092527, 1, 1, 1, 1, 1,
-0.1154933, -1.615015, -0.1881683, 1, 1, 1, 1, 1,
-0.1118975, 0.447841, 0.6697034, 1, 1, 1, 1, 1,
-0.1061861, 0.1075798, -0.7396568, 1, 1, 1, 1, 1,
-0.1007436, 0.1160561, -0.1443177, 0, 0, 1, 1, 1,
-0.09772123, 0.9383901, 0.05619003, 1, 0, 0, 1, 1,
-0.09231924, -0.8464806, -4.638871, 1, 0, 0, 1, 1,
-0.09022, 0.9831048, -2.084265, 1, 0, 0, 1, 1,
-0.08985145, -0.9512992, -3.467887, 1, 0, 0, 1, 1,
-0.08771754, 0.3441213, 0.204093, 1, 0, 0, 1, 1,
-0.0849709, -2.158284, -2.465425, 0, 0, 0, 1, 1,
-0.0794953, 0.8028523, 0.5780085, 0, 0, 0, 1, 1,
-0.07639486, 0.06614333, -1.40839, 0, 0, 0, 1, 1,
-0.07097062, 0.9645673, -2.359759, 0, 0, 0, 1, 1,
-0.06757616, 0.3163975, 0.8160838, 0, 0, 0, 1, 1,
-0.06746389, 0.03380717, -2.462303, 0, 0, 0, 1, 1,
-0.06685993, -0.6160765, -4.103982, 0, 0, 0, 1, 1,
-0.05565364, -0.06747316, -1.827832, 1, 1, 1, 1, 1,
-0.05546446, 1.230986, -1.441094, 1, 1, 1, 1, 1,
-0.05480444, -0.5284737, -2.307843, 1, 1, 1, 1, 1,
-0.05398966, 0.01075267, -2.093957, 1, 1, 1, 1, 1,
-0.0512084, -0.4939579, -3.412959, 1, 1, 1, 1, 1,
-0.04722051, -1.093347, -1.124435, 1, 1, 1, 1, 1,
-0.04525592, -0.5447025, -2.861809, 1, 1, 1, 1, 1,
-0.04503552, -1.439188, -2.221439, 1, 1, 1, 1, 1,
-0.042317, -1.784192, -4.91054, 1, 1, 1, 1, 1,
-0.03748605, 0.1028071, -1.747687, 1, 1, 1, 1, 1,
-0.03284585, 0.8954382, -0.2853392, 1, 1, 1, 1, 1,
-0.03209229, -1.337476, -2.549679, 1, 1, 1, 1, 1,
-0.03149822, 2.122843, 0.4511407, 1, 1, 1, 1, 1,
-0.0311464, -0.4260271, -3.5258, 1, 1, 1, 1, 1,
-0.02924181, 0.1336487, -0.7325893, 1, 1, 1, 1, 1,
-0.02894671, -0.05740628, -2.458584, 0, 0, 1, 1, 1,
-0.02845243, -1.439762, -1.981413, 1, 0, 0, 1, 1,
-0.02814641, -1.551697, -2.66514, 1, 0, 0, 1, 1,
-0.026043, 1.088007, 0.9576787, 1, 0, 0, 1, 1,
-0.02364845, -0.179723, -3.160027, 1, 0, 0, 1, 1,
-0.02312814, -1.970651, -1.535593, 1, 0, 0, 1, 1,
-0.0175715, 0.5278924, -2.777014, 0, 0, 0, 1, 1,
-0.01427015, -0.9492725, -5.217749, 0, 0, 0, 1, 1,
-0.01168211, 1.067403, -0.9782498, 0, 0, 0, 1, 1,
-0.01163623, 0.2046586, -0.7381472, 0, 0, 0, 1, 1,
-0.007956063, -0.07203213, -2.894496, 0, 0, 0, 1, 1,
-0.002566595, 1.736928, 0.5223843, 0, 0, 0, 1, 1,
-0.002307712, -1.543512, -2.444058, 0, 0, 0, 1, 1,
0.0006058386, 0.05452346, -1.914261, 1, 1, 1, 1, 1,
0.006755719, -1.672921, 2.051989, 1, 1, 1, 1, 1,
0.008283508, -0.9852858, 2.063041, 1, 1, 1, 1, 1,
0.009845059, 1.205174, 0.4439656, 1, 1, 1, 1, 1,
0.01488931, 1.26724, -0.6487945, 1, 1, 1, 1, 1,
0.0174421, -1.161005, 4.613473, 1, 1, 1, 1, 1,
0.02692479, -0.08670006, 2.107273, 1, 1, 1, 1, 1,
0.02704363, 1.193246, 0.2287161, 1, 1, 1, 1, 1,
0.02770989, -1.123018, 4.077445, 1, 1, 1, 1, 1,
0.03178094, 0.6699893, -0.4166379, 1, 1, 1, 1, 1,
0.03202224, 0.3325324, 0.6269493, 1, 1, 1, 1, 1,
0.03484423, 2.711563, 1.007799, 1, 1, 1, 1, 1,
0.03570401, 0.07756108, 2.222045, 1, 1, 1, 1, 1,
0.03718128, -0.3848231, 1.820822, 1, 1, 1, 1, 1,
0.03820869, 0.07214222, 0.1671906, 1, 1, 1, 1, 1,
0.03826101, -0.8098443, 1.340724, 0, 0, 1, 1, 1,
0.04263115, 0.1900567, -0.2774231, 1, 0, 0, 1, 1,
0.04276973, 0.2550033, 0.5403096, 1, 0, 0, 1, 1,
0.04524019, 0.7947437, 0.6281785, 1, 0, 0, 1, 1,
0.04657047, -1.533376, 3.511925, 1, 0, 0, 1, 1,
0.048992, 0.4181318, -0.7412804, 1, 0, 0, 1, 1,
0.06018198, -1.913214, 3.432211, 0, 0, 0, 1, 1,
0.06036828, 0.6965635, -0.4322621, 0, 0, 0, 1, 1,
0.06115442, 1.893757, 0.5664899, 0, 0, 0, 1, 1,
0.07295486, -1.309866, 3.475727, 0, 0, 0, 1, 1,
0.07369166, 0.6015865, -1.024436, 0, 0, 0, 1, 1,
0.07473885, -0.1823832, 2.706247, 0, 0, 0, 1, 1,
0.07612221, -0.1491663, 1.71204, 0, 0, 0, 1, 1,
0.07615162, -0.3061778, 2.959708, 1, 1, 1, 1, 1,
0.07854966, 0.08968563, -0.6429246, 1, 1, 1, 1, 1,
0.08053587, 0.2841008, -1.024369, 1, 1, 1, 1, 1,
0.08192715, 0.8148007, 1.641255, 1, 1, 1, 1, 1,
0.08271594, 0.03352835, 0.2748999, 1, 1, 1, 1, 1,
0.08442538, -0.5199758, 3.574328, 1, 1, 1, 1, 1,
0.08492705, -1.626137, 3.158718, 1, 1, 1, 1, 1,
0.08534171, -0.1600519, 3.60446, 1, 1, 1, 1, 1,
0.08680248, 1.364431, 1.072922, 1, 1, 1, 1, 1,
0.08987446, -1.54197, 5.198316, 1, 1, 1, 1, 1,
0.0919715, -0.7147143, 2.791925, 1, 1, 1, 1, 1,
0.09340198, 1.209153, -0.05904673, 1, 1, 1, 1, 1,
0.102861, 0.8183019, -0.1613925, 1, 1, 1, 1, 1,
0.104118, 1.078824, 0.6520762, 1, 1, 1, 1, 1,
0.1074865, 1.282559, -0.4086348, 1, 1, 1, 1, 1,
0.108729, 0.2867094, 1.269396, 0, 0, 1, 1, 1,
0.1100999, 0.2800647, 0.6934499, 1, 0, 0, 1, 1,
0.1114717, 0.7938949, 0.2653742, 1, 0, 0, 1, 1,
0.1119574, 1.786641, 1.216698, 1, 0, 0, 1, 1,
0.1123402, 0.9655445, 0.8069634, 1, 0, 0, 1, 1,
0.112427, -1.058995, 2.571259, 1, 0, 0, 1, 1,
0.1125463, 0.1631177, -0.436898, 0, 0, 0, 1, 1,
0.1152365, -1.360495, 3.865585, 0, 0, 0, 1, 1,
0.1177461, -1.569798, 2.334997, 0, 0, 0, 1, 1,
0.1186894, 0.3758496, -0.0629787, 0, 0, 0, 1, 1,
0.1218083, -1.207384, 4.170681, 0, 0, 0, 1, 1,
0.1221395, -0.1429982, 2.658526, 0, 0, 0, 1, 1,
0.1229771, -0.9331002, 2.112809, 0, 0, 0, 1, 1,
0.1241474, 1.586951, 0.4630993, 1, 1, 1, 1, 1,
0.1283211, 0.1147608, 1.114986, 1, 1, 1, 1, 1,
0.132208, -0.09275446, 3.118018, 1, 1, 1, 1, 1,
0.1332671, 0.5200568, -0.04460522, 1, 1, 1, 1, 1,
0.1340001, 0.9583969, 1.900997, 1, 1, 1, 1, 1,
0.1349697, 0.3676719, 0.1984616, 1, 1, 1, 1, 1,
0.1387558, 0.7025599, 1.686095, 1, 1, 1, 1, 1,
0.143913, -0.04586934, 0.816969, 1, 1, 1, 1, 1,
0.1465146, -0.2360916, 2.935209, 1, 1, 1, 1, 1,
0.146522, 0.7742409, 1.739551, 1, 1, 1, 1, 1,
0.146576, 0.5432959, 1.30497, 1, 1, 1, 1, 1,
0.1479862, 0.9603813, -1.223604, 1, 1, 1, 1, 1,
0.149988, 1.17749, -0.6381915, 1, 1, 1, 1, 1,
0.1588634, -1.39752, 4.324844, 1, 1, 1, 1, 1,
0.1591743, 0.7733943, 0.964883, 1, 1, 1, 1, 1,
0.1594674, 0.975095, -1.057789, 0, 0, 1, 1, 1,
0.1619662, -0.09240936, 2.54074, 1, 0, 0, 1, 1,
0.1671662, -0.9607743, 3.714026, 1, 0, 0, 1, 1,
0.1725484, -0.9317366, 2.619625, 1, 0, 0, 1, 1,
0.1744688, 0.8915947, -0.1902431, 1, 0, 0, 1, 1,
0.1746237, 1.420283, 2.318613, 1, 0, 0, 1, 1,
0.1771438, -0.05400983, 2.648156, 0, 0, 0, 1, 1,
0.177932, 1.769088, 0.4022693, 0, 0, 0, 1, 1,
0.1798599, 0.1774264, 2.30602, 0, 0, 0, 1, 1,
0.1820669, -1.131614, 1.256351, 0, 0, 0, 1, 1,
0.1822076, 0.75345, 0.02851667, 0, 0, 0, 1, 1,
0.1832786, 0.9664211, -0.6193794, 0, 0, 0, 1, 1,
0.1906508, -0.2074543, 2.249519, 0, 0, 0, 1, 1,
0.1925313, -0.6418793, 2.844266, 1, 1, 1, 1, 1,
0.1932869, 1.595971, 0.3182595, 1, 1, 1, 1, 1,
0.1933198, -0.9460129, 4.330692, 1, 1, 1, 1, 1,
0.1961428, -0.03451769, 1.163797, 1, 1, 1, 1, 1,
0.1977906, -0.9460576, 4.228918, 1, 1, 1, 1, 1,
0.1989269, 0.6208764, -0.8053492, 1, 1, 1, 1, 1,
0.2006481, -0.5304956, 4.883798, 1, 1, 1, 1, 1,
0.2039848, -0.945798, 1.714092, 1, 1, 1, 1, 1,
0.2043249, 1.091133, -0.6908576, 1, 1, 1, 1, 1,
0.2043695, -1.764356, 3.307099, 1, 1, 1, 1, 1,
0.206293, 0.3237883, 0.9260939, 1, 1, 1, 1, 1,
0.2090534, -0.2704029, 3.097883, 1, 1, 1, 1, 1,
0.2097631, -0.7895625, 3.519043, 1, 1, 1, 1, 1,
0.2101729, -0.06413534, 1.999011, 1, 1, 1, 1, 1,
0.2121577, -0.1359651, 0.9736603, 1, 1, 1, 1, 1,
0.2124963, -0.8191537, 2.37357, 0, 0, 1, 1, 1,
0.2135272, 1.05386, 0.2912836, 1, 0, 0, 1, 1,
0.2137584, 0.7128037, 0.7577153, 1, 0, 0, 1, 1,
0.2178913, -1.225759, 3.038114, 1, 0, 0, 1, 1,
0.2186177, -0.8944376, 3.083505, 1, 0, 0, 1, 1,
0.2207868, -2.145719, 3.407841, 1, 0, 0, 1, 1,
0.2233717, 0.7419353, -0.5851804, 0, 0, 0, 1, 1,
0.2295274, 0.87636, 0.4268964, 0, 0, 0, 1, 1,
0.230032, -0.223048, 1.659982, 0, 0, 0, 1, 1,
0.2309074, 0.3209742, -0.2541192, 0, 0, 0, 1, 1,
0.2335951, 0.08294349, 0.9028492, 0, 0, 0, 1, 1,
0.2354499, 1.020034, -0.7094918, 0, 0, 0, 1, 1,
0.2373212, 1.398333, -0.2900584, 0, 0, 0, 1, 1,
0.2383576, 0.5922927, 1.318592, 1, 1, 1, 1, 1,
0.2398019, 0.06772204, 0.8104044, 1, 1, 1, 1, 1,
0.2435925, 0.286822, 0.8860981, 1, 1, 1, 1, 1,
0.2439114, 0.1281893, 1.455783, 1, 1, 1, 1, 1,
0.2440447, 0.2388956, 0.2881603, 1, 1, 1, 1, 1,
0.2449093, 1.404666, 0.4160036, 1, 1, 1, 1, 1,
0.2476228, -0.912871, 1.432839, 1, 1, 1, 1, 1,
0.250125, -1.354374, 2.188449, 1, 1, 1, 1, 1,
0.2536188, -0.8392645, 3.519616, 1, 1, 1, 1, 1,
0.254823, -0.2026023, 2.379084, 1, 1, 1, 1, 1,
0.2561912, 0.4502471, -0.5511257, 1, 1, 1, 1, 1,
0.2568341, 1.048527, 0.4636546, 1, 1, 1, 1, 1,
0.2600743, 0.03206826, 0.303414, 1, 1, 1, 1, 1,
0.2626216, 0.2192021, -0.7910368, 1, 1, 1, 1, 1,
0.2637427, 1.141046, 0.3467473, 1, 1, 1, 1, 1,
0.2684798, -0.09538952, 3.320982, 0, 0, 1, 1, 1,
0.2708035, 0.4931075, -0.3944663, 1, 0, 0, 1, 1,
0.272577, 0.7016011, 0.7946234, 1, 0, 0, 1, 1,
0.2753251, -1.267591, 3.892919, 1, 0, 0, 1, 1,
0.2792921, 1.321246, -1.081919, 1, 0, 0, 1, 1,
0.2838163, -0.04411401, 0.5712706, 1, 0, 0, 1, 1,
0.2875229, -0.5982742, 3.852217, 0, 0, 0, 1, 1,
0.2933269, -0.8998361, 2.716424, 0, 0, 0, 1, 1,
0.2980626, 0.4821465, -0.2467356, 0, 0, 0, 1, 1,
0.3061182, -0.947773, 3.869647, 0, 0, 0, 1, 1,
0.3086279, -0.1844398, 3.863551, 0, 0, 0, 1, 1,
0.3184102, 0.2886416, 0.338156, 0, 0, 0, 1, 1,
0.3321454, -0.7305833, 2.197121, 0, 0, 0, 1, 1,
0.3343623, -0.1744306, 0.7855378, 1, 1, 1, 1, 1,
0.3350449, 0.3261683, 0.07810184, 1, 1, 1, 1, 1,
0.3369792, -0.8798552, 3.722704, 1, 1, 1, 1, 1,
0.3403595, -1.668988, 4.201359, 1, 1, 1, 1, 1,
0.3408875, -2.228469, 2.011446, 1, 1, 1, 1, 1,
0.3465142, -1.338624, 3.20571, 1, 1, 1, 1, 1,
0.3490458, 0.6709317, 0.2204385, 1, 1, 1, 1, 1,
0.3508749, 1.124261, 1.656749, 1, 1, 1, 1, 1,
0.351245, 0.1345565, 2.298722, 1, 1, 1, 1, 1,
0.3516991, 1.55389, 2.522152, 1, 1, 1, 1, 1,
0.3574044, -0.2731864, 2.935847, 1, 1, 1, 1, 1,
0.3593417, 0.8664592, 0.1929215, 1, 1, 1, 1, 1,
0.3639143, 0.4497401, -0.558372, 1, 1, 1, 1, 1,
0.3684837, -0.3860475, 0.7365214, 1, 1, 1, 1, 1,
0.3719948, 0.5229794, -0.456612, 1, 1, 1, 1, 1,
0.3743813, 0.1896883, 0.9747673, 0, 0, 1, 1, 1,
0.3836127, -0.5292286, 2.781577, 1, 0, 0, 1, 1,
0.384555, 0.7588687, 0.1324944, 1, 0, 0, 1, 1,
0.3860616, 1.227953, -0.2430154, 1, 0, 0, 1, 1,
0.3903295, 0.328687, 1.404941, 1, 0, 0, 1, 1,
0.3947014, 1.385007, 0.6812807, 1, 0, 0, 1, 1,
0.3972445, -0.8234332, 2.920029, 0, 0, 0, 1, 1,
0.3974629, -1.32289, 2.165332, 0, 0, 0, 1, 1,
0.3978598, -0.8264095, 1.265947, 0, 0, 0, 1, 1,
0.4021404, 0.7709409, 0.446009, 0, 0, 0, 1, 1,
0.4038923, -1.536919, 2.795136, 0, 0, 0, 1, 1,
0.4056751, 0.9772732, 0.5942883, 0, 0, 0, 1, 1,
0.4064879, 1.500306, -0.5653915, 0, 0, 0, 1, 1,
0.4165623, -0.2531866, 1.335282, 1, 1, 1, 1, 1,
0.4217783, -0.8520725, 2.854041, 1, 1, 1, 1, 1,
0.4221905, -0.4624641, 1.371731, 1, 1, 1, 1, 1,
0.4247747, 0.8833001, 2.074988, 1, 1, 1, 1, 1,
0.4250368, 0.7009617, 2.025884, 1, 1, 1, 1, 1,
0.4251126, 1.844252, 1.896051, 1, 1, 1, 1, 1,
0.4308605, -0.9946332, 4.291945, 1, 1, 1, 1, 1,
0.4365643, 1.007542, 0.3953224, 1, 1, 1, 1, 1,
0.4427385, 0.319986, -0.9326481, 1, 1, 1, 1, 1,
0.4458098, 0.9055601, 1.68756, 1, 1, 1, 1, 1,
0.450535, -0.9580468, 2.835963, 1, 1, 1, 1, 1,
0.4573118, 0.7422493, 1.67729, 1, 1, 1, 1, 1,
0.4604442, -0.4312874, 2.468463, 1, 1, 1, 1, 1,
0.4618213, -1.20937, 2.931382, 1, 1, 1, 1, 1,
0.4682512, 0.5619051, 1.63541, 1, 1, 1, 1, 1,
0.4697134, -0.6871591, 3.974286, 0, 0, 1, 1, 1,
0.4746428, 0.4458133, -0.6977677, 1, 0, 0, 1, 1,
0.4869348, -1.592671, 3.436083, 1, 0, 0, 1, 1,
0.4886925, 0.116105, 1.743086, 1, 0, 0, 1, 1,
0.4923917, -0.1602626, 2.61242, 1, 0, 0, 1, 1,
0.4929973, -0.7446165, 0.9249105, 1, 0, 0, 1, 1,
0.5066504, -0.05768958, 3.840395, 0, 0, 0, 1, 1,
0.5081108, 1.566047, -0.2187895, 0, 0, 0, 1, 1,
0.50957, 2.016509, -0.6940094, 0, 0, 0, 1, 1,
0.5134113, 1.591862, 1.677674, 0, 0, 0, 1, 1,
0.5189989, 1.982553, 1.337276, 0, 0, 0, 1, 1,
0.5201887, -0.5847053, 4.505224, 0, 0, 0, 1, 1,
0.5279614, -0.2163399, 2.323154, 0, 0, 0, 1, 1,
0.5307879, 0.5506546, -0.3758914, 1, 1, 1, 1, 1,
0.5324784, 1.449053, -1.449968, 1, 1, 1, 1, 1,
0.5332857, -1.548063, 2.441346, 1, 1, 1, 1, 1,
0.5335563, 1.046409, 1.178045, 1, 1, 1, 1, 1,
0.537269, -1.127294, 2.096289, 1, 1, 1, 1, 1,
0.542196, 0.7131593, -0.4595669, 1, 1, 1, 1, 1,
0.543481, -0.4666418, 2.268296, 1, 1, 1, 1, 1,
0.5469052, -0.3334101, 1.997517, 1, 1, 1, 1, 1,
0.5550182, 0.7418548, 0.3228907, 1, 1, 1, 1, 1,
0.5639063, 0.9795398, 0.8363646, 1, 1, 1, 1, 1,
0.5644356, 1.170683, -0.2174562, 1, 1, 1, 1, 1,
0.5679508, 1.438557, 1.95805, 1, 1, 1, 1, 1,
0.575799, -1.035372, 3.182099, 1, 1, 1, 1, 1,
0.5832351, -0.7564955, 2.868045, 1, 1, 1, 1, 1,
0.5833383, 0.4748023, 1.328759, 1, 1, 1, 1, 1,
0.5844971, -2.204021, 2.213945, 0, 0, 1, 1, 1,
0.5859857, -0.8419166, 3.043322, 1, 0, 0, 1, 1,
0.5882567, -0.5138364, 1.303881, 1, 0, 0, 1, 1,
0.5905809, -0.08784907, 1.200173, 1, 0, 0, 1, 1,
0.5923223, -0.05418016, -0.3454632, 1, 0, 0, 1, 1,
0.5939884, 0.0732942, 1.827783, 1, 0, 0, 1, 1,
0.5971606, -1.487559, 2.476176, 0, 0, 0, 1, 1,
0.6001635, -0.7983747, 4.022102, 0, 0, 0, 1, 1,
0.6078709, 0.1238855, 3.144779, 0, 0, 0, 1, 1,
0.6083932, 1.049987, 0.1421202, 0, 0, 0, 1, 1,
0.6090567, -0.7090433, 1.003585, 0, 0, 0, 1, 1,
0.6097989, 0.1043198, 2.352478, 0, 0, 0, 1, 1,
0.6100604, 3.014517, 0.9710608, 0, 0, 0, 1, 1,
0.6104849, -0.8379309, 2.492037, 1, 1, 1, 1, 1,
0.6116211, -1.732583, 3.450021, 1, 1, 1, 1, 1,
0.6160378, 1.618601, -0.2079055, 1, 1, 1, 1, 1,
0.6163072, 1.106811, 0.9885268, 1, 1, 1, 1, 1,
0.6169969, -1.315757, 4.481438, 1, 1, 1, 1, 1,
0.6194136, 0.6312827, 0.162743, 1, 1, 1, 1, 1,
0.6203691, -0.3590307, 2.390885, 1, 1, 1, 1, 1,
0.6211179, -0.5277873, 2.930529, 1, 1, 1, 1, 1,
0.6232532, -0.2780449, 0.2579811, 1, 1, 1, 1, 1,
0.630372, 1.352632, 0.4126751, 1, 1, 1, 1, 1,
0.6343169, 0.009468991, 2.938195, 1, 1, 1, 1, 1,
0.6384135, -1.221608, 0.9724855, 1, 1, 1, 1, 1,
0.6522326, 1.833946, -0.129794, 1, 1, 1, 1, 1,
0.6538895, 1.334836, -0.29061, 1, 1, 1, 1, 1,
0.6558545, 0.6863551, 2.661276, 1, 1, 1, 1, 1,
0.6574252, 0.2025131, 1.482734, 0, 0, 1, 1, 1,
0.6587446, 1.321032, -0.1311675, 1, 0, 0, 1, 1,
0.6589691, -0.004991347, 1.48419, 1, 0, 0, 1, 1,
0.6593827, 1.099658, -0.8996263, 1, 0, 0, 1, 1,
0.6598149, 0.38688, 1.77962, 1, 0, 0, 1, 1,
0.6599341, 0.4469172, 3.021405, 1, 0, 0, 1, 1,
0.660704, 0.02902025, 3.364174, 0, 0, 0, 1, 1,
0.6614806, 0.9531094, 0.3121454, 0, 0, 0, 1, 1,
0.6617705, -0.09923114, 0.8266808, 0, 0, 0, 1, 1,
0.6624036, -0.4227, 3.489722, 0, 0, 0, 1, 1,
0.6677662, 0.07791743, 2.13402, 0, 0, 0, 1, 1,
0.6690059, 0.6062897, 2.352459, 0, 0, 0, 1, 1,
0.6730877, -0.5454112, 1.723463, 0, 0, 0, 1, 1,
0.6742777, -0.1887175, 2.201282, 1, 1, 1, 1, 1,
0.679623, 0.04575203, 1.459607, 1, 1, 1, 1, 1,
0.6818829, 0.8553485, 0.2009621, 1, 1, 1, 1, 1,
0.6878952, -0.2089979, 0.7402345, 1, 1, 1, 1, 1,
0.6904397, 0.4867142, 1.404522, 1, 1, 1, 1, 1,
0.690483, 0.2735285, 1.9778, 1, 1, 1, 1, 1,
0.7032117, -0.1377857, 2.307937, 1, 1, 1, 1, 1,
0.7056922, 0.8575739, -0.4175476, 1, 1, 1, 1, 1,
0.7072417, -0.4353926, 2.122319, 1, 1, 1, 1, 1,
0.7079521, 1.424199, 0.2646608, 1, 1, 1, 1, 1,
0.7102016, 0.5957403, 0.6887513, 1, 1, 1, 1, 1,
0.7114835, -0.5495437, 4.200494, 1, 1, 1, 1, 1,
0.7117226, 2.051313, -0.09674131, 1, 1, 1, 1, 1,
0.7127861, -0.1381755, 0.8634312, 1, 1, 1, 1, 1,
0.7136347, 0.6243363, 0.9285876, 1, 1, 1, 1, 1,
0.7158079, 0.4286834, 1.822828, 0, 0, 1, 1, 1,
0.7178292, 1.988139, 1.386864, 1, 0, 0, 1, 1,
0.7198502, -0.6193864, 0.8326827, 1, 0, 0, 1, 1,
0.7217199, -0.61438, 3.365234, 1, 0, 0, 1, 1,
0.7250367, -0.4181872, 0.1527688, 1, 0, 0, 1, 1,
0.7288709, -0.9122798, 2.66039, 1, 0, 0, 1, 1,
0.730774, -0.1914832, 2.832339, 0, 0, 0, 1, 1,
0.7325427, 1.654944, 0.3405645, 0, 0, 0, 1, 1,
0.7377871, -0.4749772, 1.694996, 0, 0, 0, 1, 1,
0.7429723, -1.30715, 1.806082, 0, 0, 0, 1, 1,
0.7453226, -0.01336432, 3.06323, 0, 0, 0, 1, 1,
0.7459598, -0.8450655, 3.253018, 0, 0, 0, 1, 1,
0.748109, 0.5754223, 1.605594, 0, 0, 0, 1, 1,
0.752284, -1.565365, 2.56443, 1, 1, 1, 1, 1,
0.7585465, -0.9643289, 1.820238, 1, 1, 1, 1, 1,
0.7603237, -0.265211, 1.215188, 1, 1, 1, 1, 1,
0.7673135, -0.6722993, 3.625996, 1, 1, 1, 1, 1,
0.7718917, -0.8167365, 2.026729, 1, 1, 1, 1, 1,
0.7719902, -0.4904713, 1.078257, 1, 1, 1, 1, 1,
0.7721916, 0.7924667, -0.3211009, 1, 1, 1, 1, 1,
0.7762421, -1.025523, 1.122795, 1, 1, 1, 1, 1,
0.7773579, -1.827262, 1.367424, 1, 1, 1, 1, 1,
0.7786296, -0.4220098, 1.221442, 1, 1, 1, 1, 1,
0.7849451, -2.320031, 1.875195, 1, 1, 1, 1, 1,
0.7870487, -0.9249347, 2.589332, 1, 1, 1, 1, 1,
0.7899541, 0.7089791, 0.2023238, 1, 1, 1, 1, 1,
0.7933809, 1.824916, 1.778901, 1, 1, 1, 1, 1,
0.7953507, 2.125073, -2.114666, 1, 1, 1, 1, 1,
0.7998055, 0.5222863, -0.4621172, 0, 0, 1, 1, 1,
0.8004777, -0.2690209, -0.09598695, 1, 0, 0, 1, 1,
0.8024763, 1.895213, -0.1365151, 1, 0, 0, 1, 1,
0.8049235, -0.100297, 1.680019, 1, 0, 0, 1, 1,
0.8055773, 0.4408401, 0.9889394, 1, 0, 0, 1, 1,
0.8095772, -0.1619895, 0.4642331, 1, 0, 0, 1, 1,
0.8147641, -0.585102, 1.113103, 0, 0, 0, 1, 1,
0.8157057, -0.3230592, 0.7758694, 0, 0, 0, 1, 1,
0.8212073, 0.1819101, 1.519092, 0, 0, 0, 1, 1,
0.8268922, -0.6756973, 2.632812, 0, 0, 0, 1, 1,
0.8339154, -0.7881914, 1.104064, 0, 0, 0, 1, 1,
0.8346393, 1.29112, -0.1218408, 0, 0, 0, 1, 1,
0.8347973, 0.4231437, 2.290124, 0, 0, 0, 1, 1,
0.8356689, -0.4915877, 1.457487, 1, 1, 1, 1, 1,
0.8381974, -0.01989858, 1.957087, 1, 1, 1, 1, 1,
0.8409029, -0.2570509, 2.005311, 1, 1, 1, 1, 1,
0.8423474, -1.069473, 2.771548, 1, 1, 1, 1, 1,
0.8538998, 0.01296789, 0.4427727, 1, 1, 1, 1, 1,
0.8556687, -2.382489, 2.652405, 1, 1, 1, 1, 1,
0.8594633, 0.6415676, 1.073472, 1, 1, 1, 1, 1,
0.8602934, -1.701531, 2.211516, 1, 1, 1, 1, 1,
0.8622128, 0.2744479, -0.9482824, 1, 1, 1, 1, 1,
0.8803622, 1.683603, 0.7381903, 1, 1, 1, 1, 1,
0.8831418, -0.3881438, 3.76252, 1, 1, 1, 1, 1,
0.8875329, 0.1312781, 1.400433, 1, 1, 1, 1, 1,
0.8949536, -0.03838935, 3.108472, 1, 1, 1, 1, 1,
0.8968428, 2.283186, 0.3362967, 1, 1, 1, 1, 1,
0.8972301, -1.739818, 3.532444, 1, 1, 1, 1, 1,
0.9054411, 1.034214, -0.03266205, 0, 0, 1, 1, 1,
0.9091168, -0.8051002, 2.106307, 1, 0, 0, 1, 1,
0.9220901, 0.4215459, 2.822303, 1, 0, 0, 1, 1,
0.9263928, -1.08699, 4.461455, 1, 0, 0, 1, 1,
0.9279116, 1.329441, 0.2859979, 1, 0, 0, 1, 1,
0.9310154, 0.838039, 1.640008, 1, 0, 0, 1, 1,
0.9333452, -0.3262768, 2.001392, 0, 0, 0, 1, 1,
0.9345391, 0.2255352, 0.07444993, 0, 0, 0, 1, 1,
0.9370621, 0.5729927, 2.464835, 0, 0, 0, 1, 1,
0.9583103, 0.8614295, -0.06758657, 0, 0, 0, 1, 1,
0.958455, 0.2143224, 0.3125485, 0, 0, 0, 1, 1,
0.9733414, 0.8308968, 0.9107388, 0, 0, 0, 1, 1,
0.9991215, 2.340636, 0.862082, 0, 0, 0, 1, 1,
1.002298, -0.4822063, 1.793193, 1, 1, 1, 1, 1,
1.003012, -1.059575, 1.742875, 1, 1, 1, 1, 1,
1.011755, 0.4027751, 2.684199, 1, 1, 1, 1, 1,
1.017001, 1.423363, 1.029902, 1, 1, 1, 1, 1,
1.027917, 0.2415209, 1.105554, 1, 1, 1, 1, 1,
1.029725, -0.7224862, 1.313511, 1, 1, 1, 1, 1,
1.030808, -0.3239363, 0.2992643, 1, 1, 1, 1, 1,
1.031042, 0.7692071, 0.4666521, 1, 1, 1, 1, 1,
1.045045, 0.2496689, 0.7159372, 1, 1, 1, 1, 1,
1.045757, 0.638346, 0.572825, 1, 1, 1, 1, 1,
1.04673, 0.5416555, 1.450046, 1, 1, 1, 1, 1,
1.047575, 1.738476, -0.93101, 1, 1, 1, 1, 1,
1.048097, 0.06135166, 0.7295915, 1, 1, 1, 1, 1,
1.055197, 1.486854, 1.061212, 1, 1, 1, 1, 1,
1.0648, -1.33725, 2.351687, 1, 1, 1, 1, 1,
1.067389, -0.1381048, 1.882274, 0, 0, 1, 1, 1,
1.0706, 0.9853601, 0.4557272, 1, 0, 0, 1, 1,
1.074046, -1.24779, 0.5303883, 1, 0, 0, 1, 1,
1.081255, 0.8395281, 0.7889015, 1, 0, 0, 1, 1,
1.083268, 0.0408597, 0.919996, 1, 0, 0, 1, 1,
1.086226, 0.01222027, 1.00334, 1, 0, 0, 1, 1,
1.089166, -1.253063, 0.4154175, 0, 0, 0, 1, 1,
1.100762, -0.9501457, 1.815592, 0, 0, 0, 1, 1,
1.102022, 1.107863, 0.9899493, 0, 0, 0, 1, 1,
1.129916, 0.228957, 1.230801, 0, 0, 0, 1, 1,
1.138474, -0.6988683, 3.713867, 0, 0, 0, 1, 1,
1.143303, 0.1590443, 2.510192, 0, 0, 0, 1, 1,
1.143486, 0.9401107, 0.5210856, 0, 0, 0, 1, 1,
1.156165, 0.363759, 0.8684905, 1, 1, 1, 1, 1,
1.164185, -0.4382603, 1.002527, 1, 1, 1, 1, 1,
1.164259, -0.441276, 1.327259, 1, 1, 1, 1, 1,
1.168129, 2.240422, 0.7176462, 1, 1, 1, 1, 1,
1.16987, -1.98186, 2.52954, 1, 1, 1, 1, 1,
1.180484, 0.07511598, 1.262645, 1, 1, 1, 1, 1,
1.184543, 0.03259931, 1.622606, 1, 1, 1, 1, 1,
1.186967, 2.5716, -0.157106, 1, 1, 1, 1, 1,
1.192841, -0.4012946, 3.503283, 1, 1, 1, 1, 1,
1.1999, -1.634313, 2.547686, 1, 1, 1, 1, 1,
1.206207, 0.40234, 0.3773228, 1, 1, 1, 1, 1,
1.209727, 0.3936769, -0.6217972, 1, 1, 1, 1, 1,
1.216663, 0.6786097, 1.225292, 1, 1, 1, 1, 1,
1.217701, -0.68933, 1.610325, 1, 1, 1, 1, 1,
1.218086, 0.2545577, 0.7583138, 1, 1, 1, 1, 1,
1.226016, 2.129944, 1.116138, 0, 0, 1, 1, 1,
1.22834, -0.1429906, 1.741217, 1, 0, 0, 1, 1,
1.230539, -1.00878, 2.087322, 1, 0, 0, 1, 1,
1.2544, -0.8944153, 3.045288, 1, 0, 0, 1, 1,
1.25816, 1.132913, 3.191759, 1, 0, 0, 1, 1,
1.258612, -0.5330595, 2.857175, 1, 0, 0, 1, 1,
1.277112, 0.4182662, 0.2260745, 0, 0, 0, 1, 1,
1.27861, 0.8586336, 0.3162362, 0, 0, 0, 1, 1,
1.289789, -1.674258, 3.517969, 0, 0, 0, 1, 1,
1.296319, 0.05872596, -0.9582993, 0, 0, 0, 1, 1,
1.300881, -1.29161, 3.789871, 0, 0, 0, 1, 1,
1.30093, 0.3645448, 1.477038, 0, 0, 0, 1, 1,
1.303097, -1.580851, 1.940931, 0, 0, 0, 1, 1,
1.305632, -1.241864, 1.336421, 1, 1, 1, 1, 1,
1.311464, 0.08428448, 2.128299, 1, 1, 1, 1, 1,
1.31492, 0.1413055, 0.599378, 1, 1, 1, 1, 1,
1.325148, -0.9028358, 2.581061, 1, 1, 1, 1, 1,
1.326195, -0.9734286, 2.912741, 1, 1, 1, 1, 1,
1.344657, 0.1885839, 1.41535, 1, 1, 1, 1, 1,
1.346066, 1.162299, 0.3123946, 1, 1, 1, 1, 1,
1.34769, -1.429761, -0.5767928, 1, 1, 1, 1, 1,
1.355739, -1.151749, 2.730985, 1, 1, 1, 1, 1,
1.361862, 0.003252383, 1.352908, 1, 1, 1, 1, 1,
1.365018, -0.7828794, 1.655566, 1, 1, 1, 1, 1,
1.365718, 0.2535971, 0.3998902, 1, 1, 1, 1, 1,
1.367615, 1.293879, 2.256179, 1, 1, 1, 1, 1,
1.369426, -0.4307918, 3.185805, 1, 1, 1, 1, 1,
1.377843, -1.176219, 0.1776992, 1, 1, 1, 1, 1,
1.38069, -1.969473, 3.073914, 0, 0, 1, 1, 1,
1.400892, -1.549053, 1.397338, 1, 0, 0, 1, 1,
1.400929, -0.5893281, 1.187185, 1, 0, 0, 1, 1,
1.406667, 1.243997, -0.2318643, 1, 0, 0, 1, 1,
1.412069, 0.7951526, 1.434433, 1, 0, 0, 1, 1,
1.418423, 0.4623087, 0.5426094, 1, 0, 0, 1, 1,
1.422018, 1.426451, 2.80206, 0, 0, 0, 1, 1,
1.422917, 0.2463661, 1.798956, 0, 0, 0, 1, 1,
1.435619, 0.2741109, 1.496633, 0, 0, 0, 1, 1,
1.456329, 1.009829, 2.84314, 0, 0, 0, 1, 1,
1.458729, 0.2567511, 3.004689, 0, 0, 0, 1, 1,
1.460063, 0.3628004, 1.28154, 0, 0, 0, 1, 1,
1.463097, 1.647394, 1.231541, 0, 0, 0, 1, 1,
1.472377, -0.4673834, 0.1888596, 1, 1, 1, 1, 1,
1.472575, 1.805835, 0.1843419, 1, 1, 1, 1, 1,
1.476341, -1.481075, 2.693331, 1, 1, 1, 1, 1,
1.482989, -0.3346823, 2.23049, 1, 1, 1, 1, 1,
1.485471, 0.4129435, 1.011594, 1, 1, 1, 1, 1,
1.487979, 0.05402972, 1.068987, 1, 1, 1, 1, 1,
1.495977, -0.3832529, 1.700485, 1, 1, 1, 1, 1,
1.503734, 1.814414, 1.207426, 1, 1, 1, 1, 1,
1.530046, -1.429309, 4.154543, 1, 1, 1, 1, 1,
1.567038, 1.486323, -1.655937, 1, 1, 1, 1, 1,
1.569688, 0.5546672, -0.1022209, 1, 1, 1, 1, 1,
1.572818, -0.2218137, 2.512357, 1, 1, 1, 1, 1,
1.593799, -1.274291, 2.277924, 1, 1, 1, 1, 1,
1.608949, 0.6226445, 0.6154316, 1, 1, 1, 1, 1,
1.650216, 0.9316109, 1.267931, 1, 1, 1, 1, 1,
1.659001, 0.7350045, 1.660855, 0, 0, 1, 1, 1,
1.667121, -0.9460089, 2.643409, 1, 0, 0, 1, 1,
1.670782, -1.24117, 2.088899, 1, 0, 0, 1, 1,
1.675885, -1.57886, 0.8968368, 1, 0, 0, 1, 1,
1.704071, -0.09036747, 1.052667, 1, 0, 0, 1, 1,
1.724916, 0.263291, 0.6396686, 1, 0, 0, 1, 1,
1.729218, 1.099807, 3.044862, 0, 0, 0, 1, 1,
1.74162, 0.6614235, -0.3923523, 0, 0, 0, 1, 1,
1.773785, 0.8495811, 1.195186, 0, 0, 0, 1, 1,
1.775289, -1.367409, 1.249252, 0, 0, 0, 1, 1,
1.787071, -0.445475, 2.925947, 0, 0, 0, 1, 1,
1.79726, -0.4940282, 1.544157, 0, 0, 0, 1, 1,
1.79753, 0.07676503, 1.443635, 0, 0, 0, 1, 1,
1.818554, 0.274213, 1.556134, 1, 1, 1, 1, 1,
1.82679, -1.525674, 1.529865, 1, 1, 1, 1, 1,
1.833725, -0.9829853, 2.285542, 1, 1, 1, 1, 1,
1.836204, 0.5902793, -0.9346231, 1, 1, 1, 1, 1,
1.851713, 0.3340504, 1.96443, 1, 1, 1, 1, 1,
1.85691, 0.3678772, 2.030572, 1, 1, 1, 1, 1,
1.896963, -1.294729, 2.55058, 1, 1, 1, 1, 1,
1.902523, 0.64838, -0.2673222, 1, 1, 1, 1, 1,
1.912333, -1.576618, 1.228967, 1, 1, 1, 1, 1,
1.925531, 0.8894868, 0.9595994, 1, 1, 1, 1, 1,
1.928374, 0.9035965, 0.5893522, 1, 1, 1, 1, 1,
1.975976, -0.7576208, 2.238608, 1, 1, 1, 1, 1,
2.039547, 0.4542151, 1.610893, 1, 1, 1, 1, 1,
2.04686, -2.01267, 1.927227, 1, 1, 1, 1, 1,
2.108675, 1.617238, -0.3996154, 1, 1, 1, 1, 1,
2.162676, 1.20182, 2.167679, 0, 0, 1, 1, 1,
2.178225, -1.325492, 1.295828, 1, 0, 0, 1, 1,
2.226296, 0.6699616, 0.9145568, 1, 0, 0, 1, 1,
2.259383, 0.6317426, 1.509733, 1, 0, 0, 1, 1,
2.263163, -1.693987, 2.409205, 1, 0, 0, 1, 1,
2.277745, 0.5748633, -0.3526578, 1, 0, 0, 1, 1,
2.317244, 0.2306288, 3.374796, 0, 0, 0, 1, 1,
2.347103, -1.36233, 1.959299, 0, 0, 0, 1, 1,
2.358276, 1.798886, 1.24577, 0, 0, 0, 1, 1,
2.44332, 0.7881641, 1.486339, 0, 0, 0, 1, 1,
2.560197, 0.8867995, 2.4196, 0, 0, 0, 1, 1,
2.589884, -0.2211542, 0.9270064, 0, 0, 0, 1, 1,
2.703742, 0.1187457, 0.3630964, 0, 0, 0, 1, 1,
2.712282, 0.7683172, 1.22081, 1, 1, 1, 1, 1,
2.821793, 0.7317535, 0.7064984, 1, 1, 1, 1, 1,
2.854951, 0.452242, 1.350945, 1, 1, 1, 1, 1,
2.995753, 0.2211282, 1.199311, 1, 1, 1, 1, 1,
3.279986, -0.9272401, 2.790408, 1, 1, 1, 1, 1,
3.522899, -0.6530269, 1.134407, 1, 1, 1, 1, 1,
3.803964, 1.36464, -0.6201069, 1, 1, 1, 1, 1
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
var radius = 9.526444;
var distance = 33.46123;
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
mvMatrix.translate( -0.4164587, -0.1369773, 0.182677 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.46123);
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
