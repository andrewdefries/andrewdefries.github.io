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
-2.992802, 0.3592292, -2.102581, 1, 0, 0, 1,
-2.848883, 0.4758762, -2.40439, 1, 0.007843138, 0, 1,
-2.806147, 0.271787, -0.8438715, 1, 0.01176471, 0, 1,
-2.73773, 0.2708254, -2.190333, 1, 0.01960784, 0, 1,
-2.69182, 0.9712033, -0.003365634, 1, 0.02352941, 0, 1,
-2.669583, -0.4449905, -1.57989, 1, 0.03137255, 0, 1,
-2.490895, 0.3677324, -0.3455225, 1, 0.03529412, 0, 1,
-2.463068, -0.3248591, -2.94066, 1, 0.04313726, 0, 1,
-2.346157, -1.321049, -1.477584, 1, 0.04705882, 0, 1,
-2.334707, 1.528572, -1.274835, 1, 0.05490196, 0, 1,
-2.316164, -1.344416, 0.486175, 1, 0.05882353, 0, 1,
-2.279564, 0.9416422, -1.240525, 1, 0.06666667, 0, 1,
-2.263728, -2.239327, -3.374837, 1, 0.07058824, 0, 1,
-2.261901, 0.6694111, -1.553765, 1, 0.07843138, 0, 1,
-2.259135, -0.6688032, -2.09554, 1, 0.08235294, 0, 1,
-2.241023, 0.4133077, -0.7770261, 1, 0.09019608, 0, 1,
-2.180466, -0.3805493, 0.3633585, 1, 0.09411765, 0, 1,
-2.161757, -1.449932, -1.436628, 1, 0.1019608, 0, 1,
-2.16116, -0.1381559, -1.003442, 1, 0.1098039, 0, 1,
-2.123185, 2.044625, 0.6195264, 1, 0.1137255, 0, 1,
-2.11539, -0.5916542, -2.822348, 1, 0.1215686, 0, 1,
-2.112673, -0.1158255, -1.390354, 1, 0.1254902, 0, 1,
-2.089356, -0.05959084, -0.3941487, 1, 0.1333333, 0, 1,
-2.001903, 0.7892914, -2.798079, 1, 0.1372549, 0, 1,
-1.988696, 1.671595, 0.3703943, 1, 0.145098, 0, 1,
-1.961007, 0.2405337, -1.613545, 1, 0.1490196, 0, 1,
-1.954082, 0.4270103, -1.328256, 1, 0.1568628, 0, 1,
-1.930285, -0.1541104, -1.832549, 1, 0.1607843, 0, 1,
-1.923098, -0.1890874, -2.875496, 1, 0.1686275, 0, 1,
-1.919072, 0.4608811, -0.616056, 1, 0.172549, 0, 1,
-1.892824, -0.7403244, -2.433271, 1, 0.1803922, 0, 1,
-1.887159, -1.017493, -2.946696, 1, 0.1843137, 0, 1,
-1.884693, 2.47492, 0.9106568, 1, 0.1921569, 0, 1,
-1.853092, 0.2859482, 0.1222134, 1, 0.1960784, 0, 1,
-1.815369, 0.5171385, -1.235883, 1, 0.2039216, 0, 1,
-1.815027, -1.15613, -0.9334042, 1, 0.2117647, 0, 1,
-1.813944, -0.858843, -2.987876, 1, 0.2156863, 0, 1,
-1.788941, 0.2313608, -1.56259, 1, 0.2235294, 0, 1,
-1.787431, 0.6565461, -0.5462401, 1, 0.227451, 0, 1,
-1.774586, 1.780133, -1.477213, 1, 0.2352941, 0, 1,
-1.757493, 1.625838, -1.791935, 1, 0.2392157, 0, 1,
-1.754362, -1.56608, -2.224599, 1, 0.2470588, 0, 1,
-1.753636, 0.773084, -2.587193, 1, 0.2509804, 0, 1,
-1.752867, -0.8892518, -2.219477, 1, 0.2588235, 0, 1,
-1.73738, -0.2688352, -1.760631, 1, 0.2627451, 0, 1,
-1.712809, 1.54969, -1.481601, 1, 0.2705882, 0, 1,
-1.712402, 2.163543, -0.9469995, 1, 0.2745098, 0, 1,
-1.70404, 0.4306406, -3.321002, 1, 0.282353, 0, 1,
-1.697269, 0.8613439, -0.6595352, 1, 0.2862745, 0, 1,
-1.686022, 0.2599745, -0.7408071, 1, 0.2941177, 0, 1,
-1.681633, 0.4253052, -1.147459, 1, 0.3019608, 0, 1,
-1.668856, -0.7965016, -2.971719, 1, 0.3058824, 0, 1,
-1.657277, -1.020006, -1.131493, 1, 0.3137255, 0, 1,
-1.62573, -0.5444413, -1.401333, 1, 0.3176471, 0, 1,
-1.622633, 1.489258, -0.3279059, 1, 0.3254902, 0, 1,
-1.618884, -1.019346, -2.429929, 1, 0.3294118, 0, 1,
-1.590305, 1.639246, -0.5411922, 1, 0.3372549, 0, 1,
-1.585632, 1.86263, -0.9697364, 1, 0.3411765, 0, 1,
-1.583944, 0.4425296, -2.325803, 1, 0.3490196, 0, 1,
-1.579908, 1.171369, 1.631969, 1, 0.3529412, 0, 1,
-1.57422, -0.6226333, -2.370964, 1, 0.3607843, 0, 1,
-1.572461, -0.3164272, -1.17213, 1, 0.3647059, 0, 1,
-1.560769, 0.5363468, -0.9342836, 1, 0.372549, 0, 1,
-1.537156, -0.8432553, -0.8791597, 1, 0.3764706, 0, 1,
-1.535588, 0.2341186, 1.01222, 1, 0.3843137, 0, 1,
-1.535476, -0.8168416, -1.557931, 1, 0.3882353, 0, 1,
-1.529586, 1.75913, -0.2056293, 1, 0.3960784, 0, 1,
-1.527797, -0.213828, 0.09242968, 1, 0.4039216, 0, 1,
-1.506356, -0.37122, -2.601686, 1, 0.4078431, 0, 1,
-1.499538, 0.7405586, -1.981149, 1, 0.4156863, 0, 1,
-1.48361, -0.7786116, -1.811858, 1, 0.4196078, 0, 1,
-1.480178, 0.7025585, 0.2810426, 1, 0.427451, 0, 1,
-1.476174, 1.189753, -1.079808, 1, 0.4313726, 0, 1,
-1.475495, -1.837379, -2.78777, 1, 0.4392157, 0, 1,
-1.470767, -1.176084, -1.634177, 1, 0.4431373, 0, 1,
-1.438023, 1.765202, -1.286697, 1, 0.4509804, 0, 1,
-1.436214, -0.3725826, -3.126701, 1, 0.454902, 0, 1,
-1.432855, -0.3464337, -0.2349239, 1, 0.4627451, 0, 1,
-1.429223, 1.008094, -1.440016, 1, 0.4666667, 0, 1,
-1.421141, 0.06975185, -3.052474, 1, 0.4745098, 0, 1,
-1.417558, -0.3611402, -0.3540019, 1, 0.4784314, 0, 1,
-1.414928, -0.1568548, -0.4314867, 1, 0.4862745, 0, 1,
-1.411422, 0.05374435, -2.449611, 1, 0.4901961, 0, 1,
-1.399981, -0.1583972, -2.876167, 1, 0.4980392, 0, 1,
-1.396322, -1.384774, -1.748636, 1, 0.5058824, 0, 1,
-1.396147, 0.8052306, -0.8862499, 1, 0.509804, 0, 1,
-1.370056, -1.873923, -2.335094, 1, 0.5176471, 0, 1,
-1.36627, -0.5465953, -3.13767, 1, 0.5215687, 0, 1,
-1.348695, 0.555723, -0.7436164, 1, 0.5294118, 0, 1,
-1.342712, 0.7519478, -1.221837, 1, 0.5333334, 0, 1,
-1.331869, -0.7607192, -1.373222, 1, 0.5411765, 0, 1,
-1.329264, -0.02272082, -0.1115326, 1, 0.5450981, 0, 1,
-1.316483, -2.305531, -3.832112, 1, 0.5529412, 0, 1,
-1.309666, -1.072256, -3.161904, 1, 0.5568628, 0, 1,
-1.309395, -1.104545, -1.474031, 1, 0.5647059, 0, 1,
-1.301759, 0.3138347, -1.42201, 1, 0.5686275, 0, 1,
-1.294449, 1.43631, -0.7971051, 1, 0.5764706, 0, 1,
-1.290423, -0.4847068, -2.912617, 1, 0.5803922, 0, 1,
-1.283593, -0.3981356, -2.031222, 1, 0.5882353, 0, 1,
-1.279907, -0.9235677, -1.964151, 1, 0.5921569, 0, 1,
-1.251275, 1.298684, 0.3522347, 1, 0.6, 0, 1,
-1.230601, -0.0330271, -3.293174, 1, 0.6078432, 0, 1,
-1.223889, -0.316462, -1.313094, 1, 0.6117647, 0, 1,
-1.221002, -2.654517, -2.669821, 1, 0.6196079, 0, 1,
-1.214922, 0.2351656, -1.985006, 1, 0.6235294, 0, 1,
-1.203671, 0.01993664, -1.157288, 1, 0.6313726, 0, 1,
-1.202999, 0.08264282, -2.094635, 1, 0.6352941, 0, 1,
-1.201384, -1.386618, -2.439616, 1, 0.6431373, 0, 1,
-1.200143, 0.217847, -0.6864793, 1, 0.6470588, 0, 1,
-1.192453, -1.243107, -1.648103, 1, 0.654902, 0, 1,
-1.188635, -1.553606, -1.554923, 1, 0.6588235, 0, 1,
-1.186242, -0.4722556, -2.625205, 1, 0.6666667, 0, 1,
-1.184922, -0.3432684, -1.253755, 1, 0.6705883, 0, 1,
-1.173761, -0.3564615, -0.9503027, 1, 0.6784314, 0, 1,
-1.170347, 0.3257734, -1.823929, 1, 0.682353, 0, 1,
-1.151767, -0.03079126, -2.377128, 1, 0.6901961, 0, 1,
-1.148246, -0.3200481, -1.333817, 1, 0.6941177, 0, 1,
-1.146961, -0.1606106, -3.523563, 1, 0.7019608, 0, 1,
-1.141542, 0.2170307, 0.6190764, 1, 0.7098039, 0, 1,
-1.139346, -0.5535105, -1.701212, 1, 0.7137255, 0, 1,
-1.130902, -0.9314647, -1.256503, 1, 0.7215686, 0, 1,
-1.122331, 1.422196, -0.4265263, 1, 0.7254902, 0, 1,
-1.120333, 0.5005187, -0.4430073, 1, 0.7333333, 0, 1,
-1.118858, -0.7321823, -3.170298, 1, 0.7372549, 0, 1,
-1.117415, -0.3857163, -2.45346, 1, 0.7450981, 0, 1,
-1.112155, 0.2686893, -0.5079855, 1, 0.7490196, 0, 1,
-1.11085, -0.06397492, -1.381589, 1, 0.7568628, 0, 1,
-1.107493, -1.820081, -4.206883, 1, 0.7607843, 0, 1,
-1.100788, 0.0783143, -2.643443, 1, 0.7686275, 0, 1,
-1.100344, 0.8477011, -2.356194, 1, 0.772549, 0, 1,
-1.084796, 0.3347776, -0.442358, 1, 0.7803922, 0, 1,
-1.082986, -0.3504585, -3.435001, 1, 0.7843137, 0, 1,
-1.075987, -0.8930126, -4.054942, 1, 0.7921569, 0, 1,
-1.075363, 0.7237049, 0.3466731, 1, 0.7960784, 0, 1,
-1.066113, 1.484929, -0.009008334, 1, 0.8039216, 0, 1,
-1.062486, -0.2928597, -2.390969, 1, 0.8117647, 0, 1,
-1.060445, 0.05979805, -1.235036, 1, 0.8156863, 0, 1,
-1.060361, 1.354493, 0.5485235, 1, 0.8235294, 0, 1,
-1.057032, -0.1392322, -2.919123, 1, 0.827451, 0, 1,
-1.036069, -0.1449305, -2.847457, 1, 0.8352941, 0, 1,
-1.032331, -1.732755, -2.216287, 1, 0.8392157, 0, 1,
-1.03121, 0.6930301, -0.785069, 1, 0.8470588, 0, 1,
-1.027632, 1.095349, -1.163539, 1, 0.8509804, 0, 1,
-1.024264, -3.341337, -1.903975, 1, 0.8588235, 0, 1,
-1.013151, -0.722928, -1.263525, 1, 0.8627451, 0, 1,
-1.011103, 0.8245915, -0.6349866, 1, 0.8705882, 0, 1,
-1.008294, -1.819676, -4.019143, 1, 0.8745098, 0, 1,
-1.006593, -0.1904273, -2.021703, 1, 0.8823529, 0, 1,
-1.006468, 0.02105078, -1.501591, 1, 0.8862745, 0, 1,
-1.001821, -1.045758, -4.343937, 1, 0.8941177, 0, 1,
-1.000991, 1.57975, 0.3942102, 1, 0.8980392, 0, 1,
-1.0005, 1.164556, -1.644692, 1, 0.9058824, 0, 1,
-0.9999895, 0.5705985, -1.780229, 1, 0.9137255, 0, 1,
-0.999394, 0.9021425, -1.034729, 1, 0.9176471, 0, 1,
-0.9817542, 1.072592, -0.7972457, 1, 0.9254902, 0, 1,
-0.9801319, -0.7669257, -2.54545, 1, 0.9294118, 0, 1,
-0.9796486, -0.1364914, -1.948673, 1, 0.9372549, 0, 1,
-0.9791215, -0.2687806, -1.406699, 1, 0.9411765, 0, 1,
-0.9767603, 1.218164, -0.2112382, 1, 0.9490196, 0, 1,
-0.9719818, 0.6807749, -0.09615158, 1, 0.9529412, 0, 1,
-0.9610748, -1.787161, -1.312124, 1, 0.9607843, 0, 1,
-0.950619, 0.7342334, -0.3285274, 1, 0.9647059, 0, 1,
-0.9500737, -0.2925242, -2.552172, 1, 0.972549, 0, 1,
-0.9483344, 0.9193969, -0.643169, 1, 0.9764706, 0, 1,
-0.9441742, 1.302403, -0.6561016, 1, 0.9843137, 0, 1,
-0.9405735, -1.248389, -3.682562, 1, 0.9882353, 0, 1,
-0.9402213, -0.2606345, -4.035212, 1, 0.9960784, 0, 1,
-0.9390368, 2.750851, -0.9240513, 0.9960784, 1, 0, 1,
-0.9338462, 0.05919279, -2.608518, 0.9921569, 1, 0, 1,
-0.9256128, -0.9478195, -1.613149, 0.9843137, 1, 0, 1,
-0.9231429, 0.6454868, -2.741332, 0.9803922, 1, 0, 1,
-0.9199952, -1.449731, -1.263859, 0.972549, 1, 0, 1,
-0.9184842, -1.518297, -1.938472, 0.9686275, 1, 0, 1,
-0.9173086, -0.7923876, -2.813809, 0.9607843, 1, 0, 1,
-0.9152327, -0.04950313, -1.385148, 0.9568627, 1, 0, 1,
-0.9151066, -0.3920822, -0.896576, 0.9490196, 1, 0, 1,
-0.9077679, -1.605285, -3.636896, 0.945098, 1, 0, 1,
-0.8895253, -1.627667, -3.35504, 0.9372549, 1, 0, 1,
-0.8871748, 1.175056, -1.113525, 0.9333333, 1, 0, 1,
-0.884672, -0.2367011, -2.429936, 0.9254902, 1, 0, 1,
-0.8841193, 0.5557468, -1.991653, 0.9215686, 1, 0, 1,
-0.8834257, -0.6065081, -1.766076, 0.9137255, 1, 0, 1,
-0.881725, -1.335084, -2.758352, 0.9098039, 1, 0, 1,
-0.8797345, -1.831785, -3.961191, 0.9019608, 1, 0, 1,
-0.8737009, -0.6666676, -2.259503, 0.8941177, 1, 0, 1,
-0.8690104, 0.7702118, 0.4138931, 0.8901961, 1, 0, 1,
-0.8662839, -1.612703, -1.698318, 0.8823529, 1, 0, 1,
-0.8573884, 0.6736476, -0.4207198, 0.8784314, 1, 0, 1,
-0.8504056, 0.4409553, -0.1804575, 0.8705882, 1, 0, 1,
-0.8479503, 1.32566, -2.19494, 0.8666667, 1, 0, 1,
-0.8411704, 0.9910864, -0.8680881, 0.8588235, 1, 0, 1,
-0.8392793, 1.998836, -1.743798, 0.854902, 1, 0, 1,
-0.8313355, -0.3690144, -2.190061, 0.8470588, 1, 0, 1,
-0.8298069, -0.1413412, -2.713622, 0.8431373, 1, 0, 1,
-0.8285689, -0.491316, -3.123851, 0.8352941, 1, 0, 1,
-0.826974, -1.55259, -2.837813, 0.8313726, 1, 0, 1,
-0.8169738, 1.176607, 1.483522, 0.8235294, 1, 0, 1,
-0.8160677, -0.5588837, -2.78094, 0.8196079, 1, 0, 1,
-0.8134629, -0.02657304, -0.2239372, 0.8117647, 1, 0, 1,
-0.8069234, -0.05175543, -2.476921, 0.8078431, 1, 0, 1,
-0.8051196, 0.814055, -2.060909, 0.8, 1, 0, 1,
-0.8032933, 0.2967724, -3.955676, 0.7921569, 1, 0, 1,
-0.8004235, 0.6351158, 0.527831, 0.7882353, 1, 0, 1,
-0.7949644, -0.4789126, -0.8729818, 0.7803922, 1, 0, 1,
-0.7923139, 1.734651, -1.307429, 0.7764706, 1, 0, 1,
-0.787257, -0.9476861, -3.195324, 0.7686275, 1, 0, 1,
-0.783662, 0.6892555, -1.683684, 0.7647059, 1, 0, 1,
-0.7824298, -0.9818254, -2.260059, 0.7568628, 1, 0, 1,
-0.7810658, 0.4039531, -2.332909, 0.7529412, 1, 0, 1,
-0.7740281, 0.8603354, -1.553682, 0.7450981, 1, 0, 1,
-0.7732204, 0.04965296, -1.024191, 0.7411765, 1, 0, 1,
-0.7679456, -0.9447777, -1.1434, 0.7333333, 1, 0, 1,
-0.7653103, -0.01666504, 0.1327373, 0.7294118, 1, 0, 1,
-0.7623123, -0.6635092, -3.363078, 0.7215686, 1, 0, 1,
-0.7616989, -2.941683, -3.105301, 0.7176471, 1, 0, 1,
-0.7609898, -2.012881, -4.388594, 0.7098039, 1, 0, 1,
-0.76081, -0.7392304, -3.589843, 0.7058824, 1, 0, 1,
-0.7581009, 0.7146233, -0.4308509, 0.6980392, 1, 0, 1,
-0.7571408, -0.3251179, -1.059269, 0.6901961, 1, 0, 1,
-0.7566851, -1.700325, -3.995014, 0.6862745, 1, 0, 1,
-0.7520931, -0.2936891, -1.016097, 0.6784314, 1, 0, 1,
-0.7481469, -0.4326366, -0.9504543, 0.6745098, 1, 0, 1,
-0.7432526, -0.1576816, -1.832242, 0.6666667, 1, 0, 1,
-0.7383695, -0.3812136, -0.7499902, 0.6627451, 1, 0, 1,
-0.7378218, -0.07915074, -1.743721, 0.654902, 1, 0, 1,
-0.7277443, 0.03991992, -2.784625, 0.6509804, 1, 0, 1,
-0.7272575, -0.08943706, -1.758228, 0.6431373, 1, 0, 1,
-0.7245555, 0.3131728, -1.521849, 0.6392157, 1, 0, 1,
-0.7204733, -0.279238, -2.583919, 0.6313726, 1, 0, 1,
-0.7132292, 0.5487202, -1.006379, 0.627451, 1, 0, 1,
-0.7103723, -2.360865, -2.72453, 0.6196079, 1, 0, 1,
-0.7065088, -0.2624784, -3.443817, 0.6156863, 1, 0, 1,
-0.7061931, 1.348511, -0.3519678, 0.6078432, 1, 0, 1,
-0.7050163, 0.9631111, -0.1367576, 0.6039216, 1, 0, 1,
-0.6985084, 2.463098, -1.223119, 0.5960785, 1, 0, 1,
-0.6939969, 0.867056, -1.972723, 0.5882353, 1, 0, 1,
-0.6894909, -2.103057, -3.15787, 0.5843138, 1, 0, 1,
-0.6857097, -1.066527, -3.845979, 0.5764706, 1, 0, 1,
-0.6825856, 0.8759228, -2.276448, 0.572549, 1, 0, 1,
-0.6823795, -0.01741382, -2.177288, 0.5647059, 1, 0, 1,
-0.6789154, 1.490797, -0.4303762, 0.5607843, 1, 0, 1,
-0.6777683, 0.1182762, -2.560792, 0.5529412, 1, 0, 1,
-0.6765512, -0.241493, -2.525185, 0.5490196, 1, 0, 1,
-0.6705952, 0.04820237, -2.451648, 0.5411765, 1, 0, 1,
-0.67033, -0.03109546, -2.676561, 0.5372549, 1, 0, 1,
-0.6620279, -0.3322564, -2.800131, 0.5294118, 1, 0, 1,
-0.6616905, 1.994938, -0.59479, 0.5254902, 1, 0, 1,
-0.657353, 0.5304573, -0.8939717, 0.5176471, 1, 0, 1,
-0.6568576, -0.03025432, -3.420597, 0.5137255, 1, 0, 1,
-0.6530097, 0.9979802, 1.027535, 0.5058824, 1, 0, 1,
-0.6479098, 0.06185021, -2.037955, 0.5019608, 1, 0, 1,
-0.6464807, 0.1161339, -2.475482, 0.4941176, 1, 0, 1,
-0.642621, -0.1271867, -2.218412, 0.4862745, 1, 0, 1,
-0.6425304, -0.02414659, -1.321772, 0.4823529, 1, 0, 1,
-0.6420288, -0.7017691, -3.869269, 0.4745098, 1, 0, 1,
-0.6321545, 0.9048904, 0.7392436, 0.4705882, 1, 0, 1,
-0.6206837, -1.381231, -2.289327, 0.4627451, 1, 0, 1,
-0.6183145, -0.8426588, -1.804469, 0.4588235, 1, 0, 1,
-0.616189, 0.832392, -0.6933087, 0.4509804, 1, 0, 1,
-0.6145085, -1.046697, -3.189571, 0.4470588, 1, 0, 1,
-0.614221, 1.157732, 0.2508199, 0.4392157, 1, 0, 1,
-0.6122692, 0.864203, -3.02217, 0.4352941, 1, 0, 1,
-0.6118385, -0.3198008, -2.929017, 0.427451, 1, 0, 1,
-0.6107628, -0.9367003, -0.2084579, 0.4235294, 1, 0, 1,
-0.6101984, 0.9071133, -0.2495817, 0.4156863, 1, 0, 1,
-0.6095458, -0.5369194, -1.874646, 0.4117647, 1, 0, 1,
-0.6076908, -0.1412318, -0.4341113, 0.4039216, 1, 0, 1,
-0.6059533, 0.5924664, -1.704101, 0.3960784, 1, 0, 1,
-0.6045331, -0.4208375, -3.100585, 0.3921569, 1, 0, 1,
-0.6009763, -0.05839786, 0.01943816, 0.3843137, 1, 0, 1,
-0.5960811, 0.2209315, -0.8180096, 0.3803922, 1, 0, 1,
-0.5944473, 0.1328134, -0.5394571, 0.372549, 1, 0, 1,
-0.593102, -1.328199, -3.39407, 0.3686275, 1, 0, 1,
-0.5904896, -0.09991589, -2.674824, 0.3607843, 1, 0, 1,
-0.5902857, -1.401102, -3.915541, 0.3568628, 1, 0, 1,
-0.5901636, 0.3661087, 0.3406241, 0.3490196, 1, 0, 1,
-0.5891754, -1.857487, 0.2390798, 0.345098, 1, 0, 1,
-0.5882002, -0.4857953, -2.010884, 0.3372549, 1, 0, 1,
-0.5868817, 1.952765, -1.212097, 0.3333333, 1, 0, 1,
-0.5864977, -0.003958183, -1.663543, 0.3254902, 1, 0, 1,
-0.5846774, -1.470778, -3.124576, 0.3215686, 1, 0, 1,
-0.5811884, -1.272918, -4.844448, 0.3137255, 1, 0, 1,
-0.5787464, -0.6902807, -1.686228, 0.3098039, 1, 0, 1,
-0.5701364, 0.6081499, 0.1475246, 0.3019608, 1, 0, 1,
-0.5689118, 0.3021312, -0.9447114, 0.2941177, 1, 0, 1,
-0.5677929, 1.082653, -0.1160467, 0.2901961, 1, 0, 1,
-0.5558766, -0.6598808, -2.031947, 0.282353, 1, 0, 1,
-0.5552346, 0.8362339, -2.001694, 0.2784314, 1, 0, 1,
-0.5491876, -0.7515972, -1.413226, 0.2705882, 1, 0, 1,
-0.5474462, -0.9430851, -2.662922, 0.2666667, 1, 0, 1,
-0.5467938, -0.3720325, -1.500616, 0.2588235, 1, 0, 1,
-0.5450183, 0.03525347, -3.515701, 0.254902, 1, 0, 1,
-0.542333, 0.139082, -2.561189, 0.2470588, 1, 0, 1,
-0.5423105, 0.3849615, -0.4017242, 0.2431373, 1, 0, 1,
-0.5420345, 1.405649, 0.02567122, 0.2352941, 1, 0, 1,
-0.5382774, -2.183953, -3.137079, 0.2313726, 1, 0, 1,
-0.5326483, -0.3051248, -1.766219, 0.2235294, 1, 0, 1,
-0.5289461, 0.7210891, -0.7593814, 0.2196078, 1, 0, 1,
-0.5245015, 0.2132709, -1.803957, 0.2117647, 1, 0, 1,
-0.522965, -0.08471738, -2.917085, 0.2078431, 1, 0, 1,
-0.5222603, 1.231802, 0.5313197, 0.2, 1, 0, 1,
-0.5209137, -0.9688104, -2.022816, 0.1921569, 1, 0, 1,
-0.5185767, 2.190901, -0.1886787, 0.1882353, 1, 0, 1,
-0.5185054, -0.6746222, -2.450975, 0.1803922, 1, 0, 1,
-0.5172398, 0.6848103, -2.39539, 0.1764706, 1, 0, 1,
-0.515692, 1.406996, 1.686953, 0.1686275, 1, 0, 1,
-0.5124758, -0.1330131, -0.3323939, 0.1647059, 1, 0, 1,
-0.51243, 0.4717426, -0.5485111, 0.1568628, 1, 0, 1,
-0.5093867, 0.1843832, -2.448873, 0.1529412, 1, 0, 1,
-0.5076317, 1.019042, 0.1916178, 0.145098, 1, 0, 1,
-0.5022237, 0.2563939, -1.360189, 0.1411765, 1, 0, 1,
-0.5005492, 0.1076049, -2.941103, 0.1333333, 1, 0, 1,
-0.5004532, -0.1326391, -1.57108, 0.1294118, 1, 0, 1,
-0.4988852, -1.158575, -3.743751, 0.1215686, 1, 0, 1,
-0.4976467, 0.2722612, -1.611874, 0.1176471, 1, 0, 1,
-0.4968863, -0.9852563, -2.350495, 0.1098039, 1, 0, 1,
-0.4960586, 0.4590717, -1.300029, 0.1058824, 1, 0, 1,
-0.4955161, -1.442078, -3.263324, 0.09803922, 1, 0, 1,
-0.4927832, -0.4821392, -3.263253, 0.09019608, 1, 0, 1,
-0.4907242, -0.1238975, -3.498113, 0.08627451, 1, 0, 1,
-0.4900604, 0.557111, -0.6509473, 0.07843138, 1, 0, 1,
-0.4834166, -1.109292, -1.352563, 0.07450981, 1, 0, 1,
-0.4825925, -1.192259, -2.590359, 0.06666667, 1, 0, 1,
-0.4750153, -1.753336, -4.275207, 0.0627451, 1, 0, 1,
-0.4691142, -0.694558, -1.530672, 0.05490196, 1, 0, 1,
-0.4671036, 0.3066761, -2.021029, 0.05098039, 1, 0, 1,
-0.4654063, -0.3467532, -1.864476, 0.04313726, 1, 0, 1,
-0.4616587, -0.2634168, -2.65343, 0.03921569, 1, 0, 1,
-0.4612967, -0.3743684, -2.950866, 0.03137255, 1, 0, 1,
-0.4603139, 0.05688966, -1.798412, 0.02745098, 1, 0, 1,
-0.4561873, 0.9303113, 1.576494, 0.01960784, 1, 0, 1,
-0.4514142, -2.634557, -3.563973, 0.01568628, 1, 0, 1,
-0.4505328, -0.4893959, -1.939809, 0.007843138, 1, 0, 1,
-0.4459903, 0.4987749, -1.34558, 0.003921569, 1, 0, 1,
-0.4428381, 0.1734996, 0.4646513, 0, 1, 0.003921569, 1,
-0.4426283, -0.03729929, -0.9198087, 0, 1, 0.01176471, 1,
-0.4410574, -2.31428, -4.307189, 0, 1, 0.01568628, 1,
-0.4365889, 1.24104, -0.7622306, 0, 1, 0.02352941, 1,
-0.4351575, -1.60007, -4.008645, 0, 1, 0.02745098, 1,
-0.4294875, -0.07591317, 0.7015338, 0, 1, 0.03529412, 1,
-0.4292004, -0.2979774, -0.7948554, 0, 1, 0.03921569, 1,
-0.4285512, -1.011626, -3.544466, 0, 1, 0.04705882, 1,
-0.4261937, 0.2786354, -2.273344, 0, 1, 0.05098039, 1,
-0.4258217, 0.3602985, 0.2125433, 0, 1, 0.05882353, 1,
-0.4258155, 0.6334959, -0.5849486, 0, 1, 0.0627451, 1,
-0.4242748, 1.711543, -0.4866722, 0, 1, 0.07058824, 1,
-0.4229652, 0.4302722, -0.1411376, 0, 1, 0.07450981, 1,
-0.4199209, 0.457391, -2.255086, 0, 1, 0.08235294, 1,
-0.4189036, 1.12479, 1.993492, 0, 1, 0.08627451, 1,
-0.4176951, -0.8259216, -1.532027, 0, 1, 0.09411765, 1,
-0.4175515, -0.8442146, -2.358642, 0, 1, 0.1019608, 1,
-0.412274, -1.759781, -1.28138, 0, 1, 0.1058824, 1,
-0.4121886, -0.7525668, -2.48067, 0, 1, 0.1137255, 1,
-0.4102225, 0.6229565, -0.4631819, 0, 1, 0.1176471, 1,
-0.4076805, -1.114739, -3.628273, 0, 1, 0.1254902, 1,
-0.4063191, 1.824277, 0.1542301, 0, 1, 0.1294118, 1,
-0.4042837, 0.7576503, -0.569774, 0, 1, 0.1372549, 1,
-0.4041908, 0.8302371, -0.2757582, 0, 1, 0.1411765, 1,
-0.402799, 0.1768029, -0.9218766, 0, 1, 0.1490196, 1,
-0.4022901, 1.459644, -0.4546543, 0, 1, 0.1529412, 1,
-0.4016504, -0.1271807, -3.147702, 0, 1, 0.1607843, 1,
-0.3960523, 0.4789447, -0.2580032, 0, 1, 0.1647059, 1,
-0.3917834, -0.4072552, -3.218364, 0, 1, 0.172549, 1,
-0.3879459, -0.5757353, -2.921482, 0, 1, 0.1764706, 1,
-0.3761622, -0.4539727, -1.364952, 0, 1, 0.1843137, 1,
-0.3746663, -0.3026394, -3.032819, 0, 1, 0.1882353, 1,
-0.3743696, -0.2058369, -3.65782, 0, 1, 0.1960784, 1,
-0.3737618, 1.863363, -1.654129, 0, 1, 0.2039216, 1,
-0.3735045, 0.1869587, -2.259445, 0, 1, 0.2078431, 1,
-0.3733495, -0.7738874, -2.991756, 0, 1, 0.2156863, 1,
-0.3719656, -0.2466851, -3.720979, 0, 1, 0.2196078, 1,
-0.3713482, 0.9628878, 0.848738, 0, 1, 0.227451, 1,
-0.3703691, -2.071537, -1.731105, 0, 1, 0.2313726, 1,
-0.364322, 1.338617, 0.4463308, 0, 1, 0.2392157, 1,
-0.3613597, 0.3626214, -1.473889, 0, 1, 0.2431373, 1,
-0.3601652, -0.7200975, -1.802354, 0, 1, 0.2509804, 1,
-0.3587452, 1.051858, 0.6384268, 0, 1, 0.254902, 1,
-0.3561137, -1.237671, -3.211303, 0, 1, 0.2627451, 1,
-0.3510976, -0.1998593, -2.75922, 0, 1, 0.2666667, 1,
-0.3467287, 0.06998029, -0.8654277, 0, 1, 0.2745098, 1,
-0.3445259, 0.6156182, -0.6478783, 0, 1, 0.2784314, 1,
-0.341937, 0.7427723, 0.453611, 0, 1, 0.2862745, 1,
-0.3346056, 0.3868377, -0.2027578, 0, 1, 0.2901961, 1,
-0.3345468, 0.4527819, -0.5204509, 0, 1, 0.2980392, 1,
-0.3343858, -0.08198193, -0.501304, 0, 1, 0.3058824, 1,
-0.3320371, 0.4387985, -0.09136675, 0, 1, 0.3098039, 1,
-0.3275867, -0.5636199, -2.081607, 0, 1, 0.3176471, 1,
-0.3265808, -1.138811, -3.341464, 0, 1, 0.3215686, 1,
-0.3265666, -0.4972675, -3.21683, 0, 1, 0.3294118, 1,
-0.3257912, -0.4219685, -1.727516, 0, 1, 0.3333333, 1,
-0.3186496, -2.188314, -2.767093, 0, 1, 0.3411765, 1,
-0.3183757, -1.571108, -3.985903, 0, 1, 0.345098, 1,
-0.3172779, 0.2015258, -2.134897, 0, 1, 0.3529412, 1,
-0.3137189, -0.3347228, -4.406003, 0, 1, 0.3568628, 1,
-0.3052967, -2.03953, -3.299026, 0, 1, 0.3647059, 1,
-0.3028565, -0.6737176, -2.455009, 0, 1, 0.3686275, 1,
-0.302273, 1.023893, -0.117171, 0, 1, 0.3764706, 1,
-0.2942222, 1.083356, -0.7406067, 0, 1, 0.3803922, 1,
-0.2920913, -0.2564834, -1.046696, 0, 1, 0.3882353, 1,
-0.2915026, -0.06152425, -2.299299, 0, 1, 0.3921569, 1,
-0.2905239, 2.372387, 0.06149678, 0, 1, 0.4, 1,
-0.2887431, 0.4124522, -0.2142665, 0, 1, 0.4078431, 1,
-0.286033, -0.8827881, -2.072372, 0, 1, 0.4117647, 1,
-0.2852724, 0.2596618, 0.4144622, 0, 1, 0.4196078, 1,
-0.2831995, 0.3067527, -1.940123, 0, 1, 0.4235294, 1,
-0.2826934, -0.1237919, -2.419661, 0, 1, 0.4313726, 1,
-0.281289, 0.610094, 0.8700672, 0, 1, 0.4352941, 1,
-0.2782269, 0.02130397, -1.220361, 0, 1, 0.4431373, 1,
-0.2733926, -0.4885144, -2.867169, 0, 1, 0.4470588, 1,
-0.2719621, -0.3294057, -2.153661, 0, 1, 0.454902, 1,
-0.2719254, 1.03092, -0.08067827, 0, 1, 0.4588235, 1,
-0.268597, -1.10228, -2.297189, 0, 1, 0.4666667, 1,
-0.2681253, 0.9497047, 0.1612252, 0, 1, 0.4705882, 1,
-0.2649019, 0.5663, -0.2711927, 0, 1, 0.4784314, 1,
-0.2642951, 0.2510336, 0.6786157, 0, 1, 0.4823529, 1,
-0.259298, -1.413361, -2.83279, 0, 1, 0.4901961, 1,
-0.2591676, -1.295081, -2.351149, 0, 1, 0.4941176, 1,
-0.2576235, 0.3956788, -0.3632752, 0, 1, 0.5019608, 1,
-0.2521739, 0.1893678, -1.691365, 0, 1, 0.509804, 1,
-0.2500225, 0.660761, -1.996225, 0, 1, 0.5137255, 1,
-0.2487706, -1.553864, -4.220823, 0, 1, 0.5215687, 1,
-0.2440193, -0.01286986, -1.734794, 0, 1, 0.5254902, 1,
-0.2432447, 1.969072, -0.7132087, 0, 1, 0.5333334, 1,
-0.2424968, -0.3622677, -3.632491, 0, 1, 0.5372549, 1,
-0.2398758, -1.774596, -3.938911, 0, 1, 0.5450981, 1,
-0.2337563, 1.358017, 0.4797606, 0, 1, 0.5490196, 1,
-0.2320783, 0.7692314, -0.247255, 0, 1, 0.5568628, 1,
-0.2288467, -0.4590679, -0.8327915, 0, 1, 0.5607843, 1,
-0.2271321, -0.8787239, -4.037034, 0, 1, 0.5686275, 1,
-0.2237671, -0.5980175, -2.332308, 0, 1, 0.572549, 1,
-0.2187577, -0.7838181, -1.376437, 0, 1, 0.5803922, 1,
-0.2183811, 0.4032548, -0.2675152, 0, 1, 0.5843138, 1,
-0.2181116, -0.7841517, -2.49628, 0, 1, 0.5921569, 1,
-0.2177941, 1.343909, 0.1551849, 0, 1, 0.5960785, 1,
-0.2175075, 0.2790337, -2.160623, 0, 1, 0.6039216, 1,
-0.2155761, -1.505609, -2.800592, 0, 1, 0.6117647, 1,
-0.2144414, -1.148372, -2.455418, 0, 1, 0.6156863, 1,
-0.213292, -2.625757, -2.710968, 0, 1, 0.6235294, 1,
-0.21324, -0.1149763, -1.835925, 0, 1, 0.627451, 1,
-0.2130032, -0.003740742, -0.06476352, 0, 1, 0.6352941, 1,
-0.2110746, 0.7493525, -0.6562381, 0, 1, 0.6392157, 1,
-0.210473, -0.8566567, -4.33709, 0, 1, 0.6470588, 1,
-0.2090566, 0.9097175, -0.4985529, 0, 1, 0.6509804, 1,
-0.2073817, -0.8491809, -1.474435, 0, 1, 0.6588235, 1,
-0.2057491, -0.08135001, -1.807477, 0, 1, 0.6627451, 1,
-0.1990753, 1.155942, 0.06591325, 0, 1, 0.6705883, 1,
-0.1987883, -0.2068777, -1.98757, 0, 1, 0.6745098, 1,
-0.1953993, -2.016102, -3.618843, 0, 1, 0.682353, 1,
-0.1937938, 0.2359329, -1.718075, 0, 1, 0.6862745, 1,
-0.1928559, 0.6710582, 0.225167, 0, 1, 0.6941177, 1,
-0.1923327, -0.394568, -3.051416, 0, 1, 0.7019608, 1,
-0.1807947, -1.151988, -2.224372, 0, 1, 0.7058824, 1,
-0.1784595, 0.2414217, -1.183687, 0, 1, 0.7137255, 1,
-0.1750788, -2.465073, -2.474844, 0, 1, 0.7176471, 1,
-0.170017, -0.4947218, -3.383362, 0, 1, 0.7254902, 1,
-0.1691804, 2.122502, -0.2072655, 0, 1, 0.7294118, 1,
-0.1674015, -0.8451, -2.854274, 0, 1, 0.7372549, 1,
-0.165863, -1.151106, -3.852739, 0, 1, 0.7411765, 1,
-0.1615711, 0.9023199, -0.893637, 0, 1, 0.7490196, 1,
-0.154059, -0.2646991, -0.8729171, 0, 1, 0.7529412, 1,
-0.1528075, -0.8512477, -3.472953, 0, 1, 0.7607843, 1,
-0.1527347, -0.2321212, -3.014402, 0, 1, 0.7647059, 1,
-0.1483615, 0.3007563, -1.557488, 0, 1, 0.772549, 1,
-0.1474785, 1.626722, -0.5112919, 0, 1, 0.7764706, 1,
-0.142592, 0.4065376, 0.3742017, 0, 1, 0.7843137, 1,
-0.1412192, 0.6870802, -0.6379279, 0, 1, 0.7882353, 1,
-0.1327383, -0.9353701, -3.53111, 0, 1, 0.7960784, 1,
-0.131181, -1.114822, -1.852175, 0, 1, 0.8039216, 1,
-0.127442, -0.8758621, -3.356575, 0, 1, 0.8078431, 1,
-0.1240802, 1.397862, 2.012412, 0, 1, 0.8156863, 1,
-0.1240148, -0.4774904, -2.01809, 0, 1, 0.8196079, 1,
-0.1238806, -0.8843248, -3.251251, 0, 1, 0.827451, 1,
-0.1237052, 0.605471, -0.3347454, 0, 1, 0.8313726, 1,
-0.1209131, -0.8743963, -2.22006, 0, 1, 0.8392157, 1,
-0.1137525, -0.9899706, -3.730168, 0, 1, 0.8431373, 1,
-0.1116524, -0.2579879, -2.208702, 0, 1, 0.8509804, 1,
-0.1106696, 1.626192, 2.797765, 0, 1, 0.854902, 1,
-0.1076013, 0.3488345, -1.216121, 0, 1, 0.8627451, 1,
-0.1008125, 1.609078, -0.8676828, 0, 1, 0.8666667, 1,
-0.09708754, -0.249892, -1.663799, 0, 1, 0.8745098, 1,
-0.09147035, -0.3682312, 0.2066034, 0, 1, 0.8784314, 1,
-0.09066564, -0.3595541, -4.159733, 0, 1, 0.8862745, 1,
-0.09038129, 0.01338566, -0.3353961, 0, 1, 0.8901961, 1,
-0.08982163, 1.827286, 1.072545, 0, 1, 0.8980392, 1,
-0.08151713, 0.7545996, -0.6255629, 0, 1, 0.9058824, 1,
-0.07928881, 0.707471, 0.0489855, 0, 1, 0.9098039, 1,
-0.07830434, -1.64346, -2.79808, 0, 1, 0.9176471, 1,
-0.07734299, -0.7982528, -4.795733, 0, 1, 0.9215686, 1,
-0.06665491, 1.394304, -0.3119219, 0, 1, 0.9294118, 1,
-0.06546656, 0.272389, 0.6449203, 0, 1, 0.9333333, 1,
-0.05482704, 0.9001707, 0.4155826, 0, 1, 0.9411765, 1,
-0.05274745, 0.5375329, 1.012545, 0, 1, 0.945098, 1,
-0.05172583, 1.134544, -1.091668, 0, 1, 0.9529412, 1,
-0.04958322, 0.9661416, -0.5187821, 0, 1, 0.9568627, 1,
-0.04827647, -1.374657, -2.704157, 0, 1, 0.9647059, 1,
-0.04023607, 1.296122, -0.5341423, 0, 1, 0.9686275, 1,
-0.03486464, -0.2318492, -3.412932, 0, 1, 0.9764706, 1,
-0.02570608, 0.9290589, 0.8485014, 0, 1, 0.9803922, 1,
-0.02327509, -0.6038933, -2.928648, 0, 1, 0.9882353, 1,
-0.02138039, 0.3989106, 2.093766, 0, 1, 0.9921569, 1,
-0.02016657, 0.173425, -0.1070636, 0, 1, 1, 1,
-0.01978154, 0.1766914, -0.5487347, 0, 0.9921569, 1, 1,
-0.01953686, -1.093096, -3.006297, 0, 0.9882353, 1, 1,
-0.01950872, 0.296497, -0.68484, 0, 0.9803922, 1, 1,
-0.01778493, 0.03805301, 1.245824, 0, 0.9764706, 1, 1,
-0.01720853, -0.663657, -3.00957, 0, 0.9686275, 1, 1,
-0.01597032, -1.61907, -5.262814, 0, 0.9647059, 1, 1,
-0.01477541, 1.304746, -1.381232, 0, 0.9568627, 1, 1,
-0.01103778, -0.8038082, -2.998423, 0, 0.9529412, 1, 1,
-0.001504653, 0.3299205, -1.000685, 0, 0.945098, 1, 1,
-0.0002859728, 0.9131932, 0.7798741, 0, 0.9411765, 1, 1,
0.000136341, -1.058796, 2.665918, 0, 0.9333333, 1, 1,
0.002767632, 0.07769988, -1.028529, 0, 0.9294118, 1, 1,
0.006971662, -0.8689448, 3.668253, 0, 0.9215686, 1, 1,
0.01218152, 0.6587677, 1.315543, 0, 0.9176471, 1, 1,
0.01682998, -0.3445644, 3.141051, 0, 0.9098039, 1, 1,
0.01695371, 0.2776547, -0.001087959, 0, 0.9058824, 1, 1,
0.01799221, 2.235004, 1.655316, 0, 0.8980392, 1, 1,
0.01968259, -1.036877, 3.05468, 0, 0.8901961, 1, 1,
0.02205071, -0.6207762, 2.918057, 0, 0.8862745, 1, 1,
0.02288245, 0.2381422, -1.682053, 0, 0.8784314, 1, 1,
0.02321254, -0.3841845, 3.955697, 0, 0.8745098, 1, 1,
0.02457142, -0.5979192, 0.9972734, 0, 0.8666667, 1, 1,
0.02816525, 1.376156, -0.971365, 0, 0.8627451, 1, 1,
0.02936981, 0.7471892, -1.326337, 0, 0.854902, 1, 1,
0.03411229, -0.3675123, 2.728755, 0, 0.8509804, 1, 1,
0.03989027, 0.7797493, 0.7836701, 0, 0.8431373, 1, 1,
0.03996069, -0.9786905, 1.623148, 0, 0.8392157, 1, 1,
0.04148382, 0.2439161, 0.5178941, 0, 0.8313726, 1, 1,
0.05188869, 2.362881, -0.3125472, 0, 0.827451, 1, 1,
0.05664749, -0.09980367, 2.634072, 0, 0.8196079, 1, 1,
0.05986936, -0.1936575, 3.659013, 0, 0.8156863, 1, 1,
0.06283008, -0.2523056, 2.581244, 0, 0.8078431, 1, 1,
0.06327944, -1.243809, 3.212895, 0, 0.8039216, 1, 1,
0.06696773, 1.926342, 0.796715, 0, 0.7960784, 1, 1,
0.06815371, 0.7254313, 0.4955965, 0, 0.7882353, 1, 1,
0.06922117, -0.06731787, 2.481375, 0, 0.7843137, 1, 1,
0.07296821, 0.3230678, -1.421619, 0, 0.7764706, 1, 1,
0.07632811, -0.6376086, 3.521719, 0, 0.772549, 1, 1,
0.07655212, -0.461442, 1.634506, 0, 0.7647059, 1, 1,
0.08261965, 0.5123063, -0.2071672, 0, 0.7607843, 1, 1,
0.08425843, -0.3784141, 1.814543, 0, 0.7529412, 1, 1,
0.08555087, -0.4716895, 2.469414, 0, 0.7490196, 1, 1,
0.08838987, -2.684064, 4.615082, 0, 0.7411765, 1, 1,
0.08849919, 1.363831, -0.9021632, 0, 0.7372549, 1, 1,
0.08901801, 1.131349, 0.9285507, 0, 0.7294118, 1, 1,
0.08996935, 0.2450448, 0.8204053, 0, 0.7254902, 1, 1,
0.09238818, 1.037156, 2.379497, 0, 0.7176471, 1, 1,
0.09744345, -1.496463, 3.483552, 0, 0.7137255, 1, 1,
0.09933719, -0.2211709, 2.476853, 0, 0.7058824, 1, 1,
0.09942199, 1.408103, -1.439978, 0, 0.6980392, 1, 1,
0.1028337, 0.4333189, 0.2386329, 0, 0.6941177, 1, 1,
0.1043126, -0.6571568, 4.011782, 0, 0.6862745, 1, 1,
0.1080278, -0.4284815, 0.773608, 0, 0.682353, 1, 1,
0.1082671, -1.141033, 2.5475, 0, 0.6745098, 1, 1,
0.1099745, 1.857026, -1.118597, 0, 0.6705883, 1, 1,
0.1145453, -0.05239229, 1.654795, 0, 0.6627451, 1, 1,
0.1219609, -1.219787, 3.195718, 0, 0.6588235, 1, 1,
0.1221119, 0.9421794, -0.5207568, 0, 0.6509804, 1, 1,
0.1221296, -0.3187657, 3.267673, 0, 0.6470588, 1, 1,
0.1245552, -1.377253, 6.590239, 0, 0.6392157, 1, 1,
0.1260304, 0.3045751, 0.1602192, 0, 0.6352941, 1, 1,
0.1274573, -0.9278399, 2.121163, 0, 0.627451, 1, 1,
0.133276, -0.238965, 3.037995, 0, 0.6235294, 1, 1,
0.1389063, -0.3046352, 1.450598, 0, 0.6156863, 1, 1,
0.1394816, 2.830354, 1.26043, 0, 0.6117647, 1, 1,
0.1395766, 1.386597, -0.8070179, 0, 0.6039216, 1, 1,
0.1396009, 0.5742949, -1.245575, 0, 0.5960785, 1, 1,
0.1396758, 0.1367833, 1.783497, 0, 0.5921569, 1, 1,
0.1403623, 0.3949156, -0.6424689, 0, 0.5843138, 1, 1,
0.1460997, 1.510738, -0.2427384, 0, 0.5803922, 1, 1,
0.1464418, -1.166312, 2.839505, 0, 0.572549, 1, 1,
0.1473553, 0.03082381, 2.455012, 0, 0.5686275, 1, 1,
0.1533366, 1.77659, 0.6015529, 0, 0.5607843, 1, 1,
0.1546777, -0.4835299, 2.477448, 0, 0.5568628, 1, 1,
0.1559407, 0.8517151, 0.2454457, 0, 0.5490196, 1, 1,
0.1565994, -0.6764231, 1.398187, 0, 0.5450981, 1, 1,
0.1603043, -0.1357054, 3.003934, 0, 0.5372549, 1, 1,
0.1625967, -0.3780827, 2.565258, 0, 0.5333334, 1, 1,
0.1646708, 2.030736, -0.6301994, 0, 0.5254902, 1, 1,
0.1658856, 0.4233252, -0.3492949, 0, 0.5215687, 1, 1,
0.1663463, 0.3419838, 0.3459482, 0, 0.5137255, 1, 1,
0.1674387, 0.150246, 1.395924, 0, 0.509804, 1, 1,
0.1696564, 0.05144693, 1.701082, 0, 0.5019608, 1, 1,
0.1786982, 0.8628427, 0.8656237, 0, 0.4941176, 1, 1,
0.179808, -0.7710226, 4.438201, 0, 0.4901961, 1, 1,
0.1836126, 0.283723, 0.6045586, 0, 0.4823529, 1, 1,
0.1850356, -0.08464237, 3.316682, 0, 0.4784314, 1, 1,
0.1876484, -0.719983, 3.31272, 0, 0.4705882, 1, 1,
0.1881412, -0.4354556, 1.433177, 0, 0.4666667, 1, 1,
0.1900428, -0.1740294, 2.427642, 0, 0.4588235, 1, 1,
0.1913171, -1.368285, 2.765309, 0, 0.454902, 1, 1,
0.1914034, -0.2131047, 2.730434, 0, 0.4470588, 1, 1,
0.199094, 0.6880726, 0.6102324, 0, 0.4431373, 1, 1,
0.2017855, 0.2637646, 0.2388939, 0, 0.4352941, 1, 1,
0.2035478, 0.0556926, 2.477499, 0, 0.4313726, 1, 1,
0.2081772, 0.7498662, -0.2166408, 0, 0.4235294, 1, 1,
0.2099447, -0.9547992, 1.115707, 0, 0.4196078, 1, 1,
0.210722, 0.2912769, -0.4508863, 0, 0.4117647, 1, 1,
0.214877, 0.7121814, 0.329111, 0, 0.4078431, 1, 1,
0.2198617, 0.8470836, 0.03332746, 0, 0.4, 1, 1,
0.2201838, -0.305033, 2.189219, 0, 0.3921569, 1, 1,
0.2210166, 0.6667218, -0.1861107, 0, 0.3882353, 1, 1,
0.2232751, -0.8325712, 2.784904, 0, 0.3803922, 1, 1,
0.227133, 0.9965909, 1.639172, 0, 0.3764706, 1, 1,
0.230332, -0.7091636, 3.178783, 0, 0.3686275, 1, 1,
0.2338937, 1.081679, 1.640785, 0, 0.3647059, 1, 1,
0.2377427, 1.269702, 0.3394278, 0, 0.3568628, 1, 1,
0.2394129, -0.9707825, 4.754294, 0, 0.3529412, 1, 1,
0.2396379, -1.807447, 2.207741, 0, 0.345098, 1, 1,
0.2458634, 2.363143, -1.171933, 0, 0.3411765, 1, 1,
0.2488142, 1.099319, -1.342782, 0, 0.3333333, 1, 1,
0.2582515, 0.8865238, -2.156714, 0, 0.3294118, 1, 1,
0.258792, 0.8894885, 1.415226, 0, 0.3215686, 1, 1,
0.2596666, -1.316844, 2.793775, 0, 0.3176471, 1, 1,
0.2606172, -0.3662345, 2.28253, 0, 0.3098039, 1, 1,
0.2609465, -1.120106, 2.331306, 0, 0.3058824, 1, 1,
0.2638775, -1.720404, 1.940062, 0, 0.2980392, 1, 1,
0.2643234, 0.5748445, 0.2509794, 0, 0.2901961, 1, 1,
0.2655014, -1.4515, 2.116098, 0, 0.2862745, 1, 1,
0.2742265, -0.1733962, 1.313894, 0, 0.2784314, 1, 1,
0.2784131, -0.6325091, 2.07565, 0, 0.2745098, 1, 1,
0.2905547, 1.124905, -0.2250969, 0, 0.2666667, 1, 1,
0.2932005, 0.6754788, -0.5336974, 0, 0.2627451, 1, 1,
0.2958225, -0.09130388, 1.184474, 0, 0.254902, 1, 1,
0.2990921, -1.492882, 3.476452, 0, 0.2509804, 1, 1,
0.3002751, -1.647691, 3.192525, 0, 0.2431373, 1, 1,
0.3064369, -0.5846494, 1.756328, 0, 0.2392157, 1, 1,
0.3091618, 0.1136604, -0.1702109, 0, 0.2313726, 1, 1,
0.3115361, 0.3858054, 1.544795, 0, 0.227451, 1, 1,
0.3123911, 1.126674, 1.905201, 0, 0.2196078, 1, 1,
0.3134982, -0.1221019, 2.469336, 0, 0.2156863, 1, 1,
0.3189276, -0.5330027, 4.327251, 0, 0.2078431, 1, 1,
0.3193445, 2.398125, 0.4501007, 0, 0.2039216, 1, 1,
0.3204033, -0.6767499, 2.076829, 0, 0.1960784, 1, 1,
0.3205623, 1.273174, 0.5457118, 0, 0.1882353, 1, 1,
0.3358844, 0.292254, -1.77823, 0, 0.1843137, 1, 1,
0.3377565, -0.7640789, 2.452165, 0, 0.1764706, 1, 1,
0.3388982, 0.9571643, -0.3359287, 0, 0.172549, 1, 1,
0.3399004, 2.251282, -1.399674, 0, 0.1647059, 1, 1,
0.3399458, 0.4607495, 0.6908739, 0, 0.1607843, 1, 1,
0.3416346, 0.03861565, 3.444905, 0, 0.1529412, 1, 1,
0.3443485, 1.854423, 0.7377132, 0, 0.1490196, 1, 1,
0.3448161, -1.430627, 3.031012, 0, 0.1411765, 1, 1,
0.3576095, -0.7004476, 1.31676, 0, 0.1372549, 1, 1,
0.3583897, -0.6842452, 1.929267, 0, 0.1294118, 1, 1,
0.3592068, -0.003278433, 2.036575, 0, 0.1254902, 1, 1,
0.3599532, 0.7604913, 0.5985971, 0, 0.1176471, 1, 1,
0.3633748, -0.9893358, 2.732445, 0, 0.1137255, 1, 1,
0.3681218, 1.680827, -2.860769, 0, 0.1058824, 1, 1,
0.3689348, -0.01348156, 2.40811, 0, 0.09803922, 1, 1,
0.3723829, -1.027436, 2.807579, 0, 0.09411765, 1, 1,
0.3734912, 2.105455, 0.3193128, 0, 0.08627451, 1, 1,
0.3745989, 2.490875, 0.2853822, 0, 0.08235294, 1, 1,
0.3746901, -0.5017044, 2.739678, 0, 0.07450981, 1, 1,
0.3812309, -2.12727, 3.483631, 0, 0.07058824, 1, 1,
0.3857033, 0.05321789, 1.665555, 0, 0.0627451, 1, 1,
0.3857723, 0.09169202, 2.102053, 0, 0.05882353, 1, 1,
0.3892672, 0.3513082, -0.09477099, 0, 0.05098039, 1, 1,
0.3909396, -0.4940415, 2.330027, 0, 0.04705882, 1, 1,
0.3952881, -0.04678007, 2.020941, 0, 0.03921569, 1, 1,
0.4017913, 0.5576793, -0.2261134, 0, 0.03529412, 1, 1,
0.4057286, -0.7051491, 2.968543, 0, 0.02745098, 1, 1,
0.4119462, 1.849771, 0.7977753, 0, 0.02352941, 1, 1,
0.4120319, -1.100233, 3.154933, 0, 0.01568628, 1, 1,
0.4122553, 0.5087411, 0.3253199, 0, 0.01176471, 1, 1,
0.4137385, -0.04472545, 1.829589, 0, 0.003921569, 1, 1,
0.4185076, 1.314521, 1.081238, 0.003921569, 0, 1, 1,
0.4224026, -0.9443068, 1.363914, 0.007843138, 0, 1, 1,
0.4248202, -1.820445, 2.764084, 0.01568628, 0, 1, 1,
0.435534, -0.8382827, 3.05554, 0.01960784, 0, 1, 1,
0.4357134, 1.144009, -0.3582772, 0.02745098, 0, 1, 1,
0.4360735, 0.5055341, 0.378821, 0.03137255, 0, 1, 1,
0.4382098, 1.785679, -1.449419, 0.03921569, 0, 1, 1,
0.4429915, -0.7526225, 2.767852, 0.04313726, 0, 1, 1,
0.4436162, -1.156084, 1.347735, 0.05098039, 0, 1, 1,
0.4464344, 1.295468, 1.121065, 0.05490196, 0, 1, 1,
0.4494348, 0.753253, 0.2354953, 0.0627451, 0, 1, 1,
0.454092, 0.8947957, -0.2810249, 0.06666667, 0, 1, 1,
0.4556422, 1.089913, 1.004585, 0.07450981, 0, 1, 1,
0.460091, -1.120657, 2.32891, 0.07843138, 0, 1, 1,
0.4618964, -1.370613, 3.512743, 0.08627451, 0, 1, 1,
0.4684263, -2.332915, 3.319464, 0.09019608, 0, 1, 1,
0.4694249, 0.1379374, 1.389204, 0.09803922, 0, 1, 1,
0.4749789, -0.8072867, 3.079964, 0.1058824, 0, 1, 1,
0.476153, -0.8327475, 2.517687, 0.1098039, 0, 1, 1,
0.4775551, 1.78905, -2.266168, 0.1176471, 0, 1, 1,
0.4821163, 1.267219, 0.3882826, 0.1215686, 0, 1, 1,
0.4828412, 1.769373, -2.310377, 0.1294118, 0, 1, 1,
0.484476, 1.633608, 0.01799473, 0.1333333, 0, 1, 1,
0.4860308, 0.134441, 2.550829, 0.1411765, 0, 1, 1,
0.4879004, 0.9240316, 1.726604, 0.145098, 0, 1, 1,
0.4928696, 0.9317678, 0.7530866, 0.1529412, 0, 1, 1,
0.4933774, -0.3626752, 2.154661, 0.1568628, 0, 1, 1,
0.4956962, 1.471784, -0.7374788, 0.1647059, 0, 1, 1,
0.5034412, 0.5865557, -1.204896, 0.1686275, 0, 1, 1,
0.5044304, -1.011945, 2.725505, 0.1764706, 0, 1, 1,
0.5052494, 1.110551, 0.2073135, 0.1803922, 0, 1, 1,
0.5180558, 0.942957, 3.427177, 0.1882353, 0, 1, 1,
0.5208655, -0.7897599, 1.832178, 0.1921569, 0, 1, 1,
0.5215222, -0.3589707, 3.525189, 0.2, 0, 1, 1,
0.5251331, 0.656001, -0.07888328, 0.2078431, 0, 1, 1,
0.5254943, 0.1305521, 1.435812, 0.2117647, 0, 1, 1,
0.5296972, -0.5148644, 1.604826, 0.2196078, 0, 1, 1,
0.5318614, 1.43532, 0.4695338, 0.2235294, 0, 1, 1,
0.5325006, -0.07464922, 4.021719, 0.2313726, 0, 1, 1,
0.5364471, 0.9707134, 0.4878451, 0.2352941, 0, 1, 1,
0.537172, 0.7331411, -0.3399705, 0.2431373, 0, 1, 1,
0.5404006, 0.6730289, -0.3698707, 0.2470588, 0, 1, 1,
0.5432487, -0.386139, 3.379029, 0.254902, 0, 1, 1,
0.545152, -2.424789, 4.396721, 0.2588235, 0, 1, 1,
0.5508942, -1.066352, 3.88636, 0.2666667, 0, 1, 1,
0.5533237, -0.7455224, 2.817738, 0.2705882, 0, 1, 1,
0.5559211, 0.1563979, 1.721878, 0.2784314, 0, 1, 1,
0.5607082, 0.5989786, -0.1264547, 0.282353, 0, 1, 1,
0.5634334, 0.1913413, 2.184078, 0.2901961, 0, 1, 1,
0.5643818, 1.767359, 0.7374392, 0.2941177, 0, 1, 1,
0.5669667, -1.054108, 2.167208, 0.3019608, 0, 1, 1,
0.5674805, 0.1242366, 0.9979794, 0.3098039, 0, 1, 1,
0.5679778, 1.070858, 1.349263, 0.3137255, 0, 1, 1,
0.5685604, 0.03431351, 1.088353, 0.3215686, 0, 1, 1,
0.5706137, -0.606754, 1.355193, 0.3254902, 0, 1, 1,
0.5709252, 1.916306, 0.2723033, 0.3333333, 0, 1, 1,
0.5742989, -1.033884, 1.653931, 0.3372549, 0, 1, 1,
0.5770167, -0.411188, 1.502943, 0.345098, 0, 1, 1,
0.5843011, 0.5192733, -0.5731243, 0.3490196, 0, 1, 1,
0.5979727, 0.331581, 2.079526, 0.3568628, 0, 1, 1,
0.5980561, 0.5005922, 1.44604, 0.3607843, 0, 1, 1,
0.5982332, 0.6133178, 1.550462, 0.3686275, 0, 1, 1,
0.605525, 1.878372, -1.486957, 0.372549, 0, 1, 1,
0.608094, 1.5635, -0.6632658, 0.3803922, 0, 1, 1,
0.6083584, 0.8690302, 0.7719681, 0.3843137, 0, 1, 1,
0.6085785, -0.2008627, 1.427031, 0.3921569, 0, 1, 1,
0.6141464, 0.484082, 0.551342, 0.3960784, 0, 1, 1,
0.6141872, -0.05286711, 2.379779, 0.4039216, 0, 1, 1,
0.6143023, -1.613724, 2.366704, 0.4117647, 0, 1, 1,
0.6170511, 1.507521, 0.4325933, 0.4156863, 0, 1, 1,
0.6221786, -1.067379, 3.980343, 0.4235294, 0, 1, 1,
0.6225223, 0.8217847, 0.964162, 0.427451, 0, 1, 1,
0.6265547, -2.540017, 0.9103749, 0.4352941, 0, 1, 1,
0.633172, -1.346146, 2.878664, 0.4392157, 0, 1, 1,
0.6339291, -0.184664, 2.497657, 0.4470588, 0, 1, 1,
0.6357288, 0.8652995, -0.1650247, 0.4509804, 0, 1, 1,
0.6367086, -2.925858, 1.684333, 0.4588235, 0, 1, 1,
0.639469, -1.149039, 1.775663, 0.4627451, 0, 1, 1,
0.6464608, -0.08191065, 1.675633, 0.4705882, 0, 1, 1,
0.6522269, -0.03353625, 0.1636067, 0.4745098, 0, 1, 1,
0.6543209, 1.711953, 0.1322661, 0.4823529, 0, 1, 1,
0.6562299, 0.7094182, 0.2420529, 0.4862745, 0, 1, 1,
0.6567407, 0.499359, 1.119084, 0.4941176, 0, 1, 1,
0.6603677, -1.813903, 2.411051, 0.5019608, 0, 1, 1,
0.6672844, -0.1951575, 0.343609, 0.5058824, 0, 1, 1,
0.6690912, -0.5746147, 2.771059, 0.5137255, 0, 1, 1,
0.6717656, 0.6664346, 1.176166, 0.5176471, 0, 1, 1,
0.6737434, -0.4609092, 1.107967, 0.5254902, 0, 1, 1,
0.6742452, 1.199442, 1.644222, 0.5294118, 0, 1, 1,
0.6901693, 1.193121, 0.3975852, 0.5372549, 0, 1, 1,
0.6903471, 0.2000358, 0.8745317, 0.5411765, 0, 1, 1,
0.6939824, 0.357159, 0.02356664, 0.5490196, 0, 1, 1,
0.694321, -1.09509, 2.462, 0.5529412, 0, 1, 1,
0.6998475, -0.302166, 1.875192, 0.5607843, 0, 1, 1,
0.7065403, -0.1008517, 3.550758, 0.5647059, 0, 1, 1,
0.7118225, 0.6556722, -0.231501, 0.572549, 0, 1, 1,
0.7121726, 0.04143335, 1.91969, 0.5764706, 0, 1, 1,
0.7185869, 1.090129, 1.294901, 0.5843138, 0, 1, 1,
0.7186597, -0.7705103, 1.729983, 0.5882353, 0, 1, 1,
0.7249575, 0.4398297, 2.278598, 0.5960785, 0, 1, 1,
0.7279449, -1.555667, 3.544405, 0.6039216, 0, 1, 1,
0.7311833, -0.7478147, 0.7289554, 0.6078432, 0, 1, 1,
0.731365, -1.202594, 2.844164, 0.6156863, 0, 1, 1,
0.7327359, 0.1843867, 0.8037403, 0.6196079, 0, 1, 1,
0.7534616, -0.1042648, 0.6421112, 0.627451, 0, 1, 1,
0.7565529, 0.5546252, 3.707779, 0.6313726, 0, 1, 1,
0.7568161, 1.341222, -0.2667801, 0.6392157, 0, 1, 1,
0.7591363, 0.4365696, 1.649189, 0.6431373, 0, 1, 1,
0.7634426, -0.2812674, 2.151788, 0.6509804, 0, 1, 1,
0.7636808, -1.137843, 2.893802, 0.654902, 0, 1, 1,
0.7683387, -1.626131, 3.782146, 0.6627451, 0, 1, 1,
0.7789918, -0.2072776, 2.298786, 0.6666667, 0, 1, 1,
0.7813241, -2.024441, 4.185929, 0.6745098, 0, 1, 1,
0.7963871, -0.1094424, 2.630163, 0.6784314, 0, 1, 1,
0.7973087, 0.2259045, -0.3521073, 0.6862745, 0, 1, 1,
0.7977433, 0.01016242, 3.056389, 0.6901961, 0, 1, 1,
0.7998098, -0.3758267, 1.263675, 0.6980392, 0, 1, 1,
0.8102671, -0.2246849, 1.507834, 0.7058824, 0, 1, 1,
0.8134002, -1.677909, 2.062315, 0.7098039, 0, 1, 1,
0.8139004, -0.2339012, 1.770272, 0.7176471, 0, 1, 1,
0.8219784, -0.3806991, 3.233638, 0.7215686, 0, 1, 1,
0.826941, 1.185484, 1.262733, 0.7294118, 0, 1, 1,
0.8311744, -0.3483619, 0.4868405, 0.7333333, 0, 1, 1,
0.8323311, -0.0003073752, 1.550395, 0.7411765, 0, 1, 1,
0.8325065, 0.5230137, 0.5879606, 0.7450981, 0, 1, 1,
0.8348867, 1.430163, 0.4437454, 0.7529412, 0, 1, 1,
0.8406518, -0.4572006, 2.098299, 0.7568628, 0, 1, 1,
0.8409005, -0.229498, 2.587404, 0.7647059, 0, 1, 1,
0.8451549, -0.6802068, 2.970396, 0.7686275, 0, 1, 1,
0.8452782, -0.8661352, 1.91034, 0.7764706, 0, 1, 1,
0.8507143, 0.2700241, 0.561281, 0.7803922, 0, 1, 1,
0.8576097, 0.920108, 1.925412, 0.7882353, 0, 1, 1,
0.8580295, -0.07743879, 2.122816, 0.7921569, 0, 1, 1,
0.8748606, -0.239995, 1.830006, 0.8, 0, 1, 1,
0.8774248, -1.316485, 1.968383, 0.8078431, 0, 1, 1,
0.8803195, 0.8850296, -0.5809655, 0.8117647, 0, 1, 1,
0.8833374, 0.1766685, 2.807271, 0.8196079, 0, 1, 1,
0.8886147, -0.05430321, 2.781463, 0.8235294, 0, 1, 1,
0.8942631, 0.6736386, 0.3093428, 0.8313726, 0, 1, 1,
0.8966336, -1.584942, 2.242235, 0.8352941, 0, 1, 1,
0.9012681, -2.74484, 2.687154, 0.8431373, 0, 1, 1,
0.9086285, -0.1260673, 1.250572, 0.8470588, 0, 1, 1,
0.9130043, -0.3821863, 2.816572, 0.854902, 0, 1, 1,
0.9157284, 0.5865167, 1.816581, 0.8588235, 0, 1, 1,
0.9293749, 0.6823507, 0.7368191, 0.8666667, 0, 1, 1,
0.9336506, 0.6697799, 1.128707, 0.8705882, 0, 1, 1,
0.9360219, 1.365814, 1.416979, 0.8784314, 0, 1, 1,
0.9407781, 0.8981968, 1.029389, 0.8823529, 0, 1, 1,
0.945377, 0.6526255, 0.004949302, 0.8901961, 0, 1, 1,
0.9474186, 0.1796388, 0.4665692, 0.8941177, 0, 1, 1,
0.9495078, -0.2172535, 0.5954599, 0.9019608, 0, 1, 1,
0.9505507, 1.124342, 0.8778387, 0.9098039, 0, 1, 1,
0.9582236, -1.225284, 2.119898, 0.9137255, 0, 1, 1,
0.9676378, 0.5968108, 1.289846, 0.9215686, 0, 1, 1,
0.9705474, 0.04669225, 1.549411, 0.9254902, 0, 1, 1,
0.9740242, 1.068847, 1.276779, 0.9333333, 0, 1, 1,
0.9760593, 0.7302738, 0.08893235, 0.9372549, 0, 1, 1,
0.9797437, 2.408769, -1.09981, 0.945098, 0, 1, 1,
0.9802455, 0.3087455, 2.252519, 0.9490196, 0, 1, 1,
0.9805695, 0.3144049, 0.5541722, 0.9568627, 0, 1, 1,
0.9912244, -0.1489315, 3.373024, 0.9607843, 0, 1, 1,
0.9967695, -0.6464705, 3.348312, 0.9686275, 0, 1, 1,
0.9967877, -1.579725, 3.243518, 0.972549, 0, 1, 1,
1.001531, -0.9702775, 3.362772, 0.9803922, 0, 1, 1,
1.002949, 1.453453, -0.5285794, 0.9843137, 0, 1, 1,
1.005967, -0.7045223, 1.980248, 0.9921569, 0, 1, 1,
1.008257, 1.094147, 1.603176, 0.9960784, 0, 1, 1,
1.009419, 0.9018213, 1.033509, 1, 0, 0.9960784, 1,
1.013684, 0.3901699, 1.80109, 1, 0, 0.9882353, 1,
1.019484, -0.9325753, 2.11568, 1, 0, 0.9843137, 1,
1.019697, 0.1536167, 1.831768, 1, 0, 0.9764706, 1,
1.032869, -0.9044254, 2.202568, 1, 0, 0.972549, 1,
1.037787, 1.290895, -0.8369989, 1, 0, 0.9647059, 1,
1.039483, 0.231231, 1.630548, 1, 0, 0.9607843, 1,
1.041772, 0.4159615, 2.033469, 1, 0, 0.9529412, 1,
1.042729, 0.9310634, 0.3291878, 1, 0, 0.9490196, 1,
1.043575, 0.7409155, 2.246763, 1, 0, 0.9411765, 1,
1.043618, -0.4479094, 1.688406, 1, 0, 0.9372549, 1,
1.044568, -0.4398278, 1.472434, 1, 0, 0.9294118, 1,
1.051176, -1.490864, 3.540694, 1, 0, 0.9254902, 1,
1.055006, -0.01528048, 0.9155932, 1, 0, 0.9176471, 1,
1.068428, 1.206283, -0.2889732, 1, 0, 0.9137255, 1,
1.074004, 1.856492, -0.2833758, 1, 0, 0.9058824, 1,
1.07869, 0.1130538, 0.8730512, 1, 0, 0.9019608, 1,
1.084703, 0.3974472, 0.9831383, 1, 0, 0.8941177, 1,
1.086899, -1.11897, 2.326955, 1, 0, 0.8862745, 1,
1.091584, -1.799098, 3.123135, 1, 0, 0.8823529, 1,
1.095598, -1.392825, 1.297918, 1, 0, 0.8745098, 1,
1.097179, 0.2726143, -0.01508191, 1, 0, 0.8705882, 1,
1.105143, 0.7211913, 0.7237635, 1, 0, 0.8627451, 1,
1.106952, -0.1895692, 3.913177, 1, 0, 0.8588235, 1,
1.107219, 1.021666, 1.09083, 1, 0, 0.8509804, 1,
1.108081, -0.1450062, 2.745628, 1, 0, 0.8470588, 1,
1.109141, 0.05771668, 1.578739, 1, 0, 0.8392157, 1,
1.111584, -0.5264472, 2.657002, 1, 0, 0.8352941, 1,
1.121623, -1.17082, 1.048156, 1, 0, 0.827451, 1,
1.125582, -0.6155378, 1.072868, 1, 0, 0.8235294, 1,
1.127464, 0.5686359, 2.518816, 1, 0, 0.8156863, 1,
1.134972, -0.3596186, 3.335771, 1, 0, 0.8117647, 1,
1.136599, -0.3624465, 2.382607, 1, 0, 0.8039216, 1,
1.147951, -0.4171775, 2.10017, 1, 0, 0.7960784, 1,
1.154537, 0.5600392, 0.1901994, 1, 0, 0.7921569, 1,
1.163867, 0.1898293, 1.654612, 1, 0, 0.7843137, 1,
1.171981, 0.4182498, 1.231221, 1, 0, 0.7803922, 1,
1.182566, 0.4270642, 1.165186, 1, 0, 0.772549, 1,
1.184212, -0.1861284, 2.787369, 1, 0, 0.7686275, 1,
1.187486, 0.9346309, 0.8740608, 1, 0, 0.7607843, 1,
1.189621, -0.7812947, 3.009518, 1, 0, 0.7568628, 1,
1.19759, -0.03332552, 1.178602, 1, 0, 0.7490196, 1,
1.198985, -0.964749, 2.664736, 1, 0, 0.7450981, 1,
1.202359, 1.294067, 0.5214394, 1, 0, 0.7372549, 1,
1.214356, 0.5584646, 0.4127422, 1, 0, 0.7333333, 1,
1.215421, 0.8981193, 0.7848848, 1, 0, 0.7254902, 1,
1.222158, -0.2881658, 2.117884, 1, 0, 0.7215686, 1,
1.224599, -0.7774083, 1.451897, 1, 0, 0.7137255, 1,
1.23735, 0.5076713, 1.885621, 1, 0, 0.7098039, 1,
1.241223, -1.51156, 2.278735, 1, 0, 0.7019608, 1,
1.252184, 0.8726138, 1.732836, 1, 0, 0.6941177, 1,
1.254518, -0.5068358, 1.765958, 1, 0, 0.6901961, 1,
1.265886, 1.259728, 1.804764, 1, 0, 0.682353, 1,
1.26853, 0.4608737, 2.087824, 1, 0, 0.6784314, 1,
1.269361, 0.06883486, 2.544566, 1, 0, 0.6705883, 1,
1.285387, -0.5352154, 0.7499326, 1, 0, 0.6666667, 1,
1.286428, -0.09854682, 1.578186, 1, 0, 0.6588235, 1,
1.291056, -0.4682803, 1.318076, 1, 0, 0.654902, 1,
1.294095, 0.2152748, 1.878221, 1, 0, 0.6470588, 1,
1.295168, 1.077727, 1.075046, 1, 0, 0.6431373, 1,
1.300689, 0.04264024, 1.850676, 1, 0, 0.6352941, 1,
1.302551, 0.3686599, 0.07835951, 1, 0, 0.6313726, 1,
1.304039, 1.20964, 1.476643, 1, 0, 0.6235294, 1,
1.306252, 0.1060234, 0.8563223, 1, 0, 0.6196079, 1,
1.309111, 0.5392495, 1.709701, 1, 0, 0.6117647, 1,
1.325514, -0.8108605, 2.761042, 1, 0, 0.6078432, 1,
1.327031, 1.241341, 1.14061, 1, 0, 0.6, 1,
1.327294, -0.8555444, 3.222444, 1, 0, 0.5921569, 1,
1.345291, -0.201933, 0.8221573, 1, 0, 0.5882353, 1,
1.352216, -0.8526382, 2.179179, 1, 0, 0.5803922, 1,
1.359546, -0.1365012, 1.115373, 1, 0, 0.5764706, 1,
1.3837, -0.7466002, 1.085413, 1, 0, 0.5686275, 1,
1.390549, -0.2663368, 3.334458, 1, 0, 0.5647059, 1,
1.401239, -1.113673, 0.7372964, 1, 0, 0.5568628, 1,
1.405332, 0.05475305, 0.822094, 1, 0, 0.5529412, 1,
1.412311, -1.163411, 3.129067, 1, 0, 0.5450981, 1,
1.412588, -0.3058032, 1.972454, 1, 0, 0.5411765, 1,
1.413695, 0.3394198, 2.033989, 1, 0, 0.5333334, 1,
1.419044, -1.002494, 1.438628, 1, 0, 0.5294118, 1,
1.420857, 1.048097, 1.456116, 1, 0, 0.5215687, 1,
1.443076, 1.825203, 0.7532302, 1, 0, 0.5176471, 1,
1.445174, -0.4873012, 1.663665, 1, 0, 0.509804, 1,
1.451863, -0.5203181, 0.5554442, 1, 0, 0.5058824, 1,
1.452221, 0.8539225, 1.686008, 1, 0, 0.4980392, 1,
1.476664, 0.4811925, 1.322604, 1, 0, 0.4901961, 1,
1.485885, 0.4401744, 1.161799, 1, 0, 0.4862745, 1,
1.491694, 1.107376, -1.281865, 1, 0, 0.4784314, 1,
1.508428, -0.5849248, 3.477561, 1, 0, 0.4745098, 1,
1.514683, 0.2470957, 1.888633, 1, 0, 0.4666667, 1,
1.525107, 0.8883111, 0.746131, 1, 0, 0.4627451, 1,
1.527218, -1.530247, 4.445651, 1, 0, 0.454902, 1,
1.529436, -1.157197, 2.804098, 1, 0, 0.4509804, 1,
1.537385, 0.7536136, 0.4580303, 1, 0, 0.4431373, 1,
1.540453, 1.310491, 0.1173424, 1, 0, 0.4392157, 1,
1.541179, 1.134387, 0.4976976, 1, 0, 0.4313726, 1,
1.549204, 0.432629, 1.333298, 1, 0, 0.427451, 1,
1.558101, 1.058024, 0.05227416, 1, 0, 0.4196078, 1,
1.571732, -0.367808, 1.952368, 1, 0, 0.4156863, 1,
1.578568, 0.8709493, 0.544769, 1, 0, 0.4078431, 1,
1.57864, -0.8565106, 1.430586, 1, 0, 0.4039216, 1,
1.580814, -0.2405319, -0.01222421, 1, 0, 0.3960784, 1,
1.585359, -0.6541187, 0.6889183, 1, 0, 0.3882353, 1,
1.604098, -0.9390789, 2.321074, 1, 0, 0.3843137, 1,
1.610735, -0.03777268, 1.914667, 1, 0, 0.3764706, 1,
1.614999, -0.005610955, 1.761515, 1, 0, 0.372549, 1,
1.629714, -1.738253, 0.2115597, 1, 0, 0.3647059, 1,
1.632756, 1.132707, 0.3289191, 1, 0, 0.3607843, 1,
1.64362, -2.393828, 4.099394, 1, 0, 0.3529412, 1,
1.664754, -0.3833539, 3.164043, 1, 0, 0.3490196, 1,
1.675609, 1.667486, 1.274916, 1, 0, 0.3411765, 1,
1.682699, -0.01262142, 0.9794118, 1, 0, 0.3372549, 1,
1.693123, 0.1363017, 2.365236, 1, 0, 0.3294118, 1,
1.718288, -1.764395, 2.001162, 1, 0, 0.3254902, 1,
1.719332, -0.1119582, 2.255413, 1, 0, 0.3176471, 1,
1.730877, -0.05148138, 0.6953391, 1, 0, 0.3137255, 1,
1.734597, 1.550132, 0.5737845, 1, 0, 0.3058824, 1,
1.739541, 0.5805997, 1.072599, 1, 0, 0.2980392, 1,
1.752831, -1.844332, 1.569181, 1, 0, 0.2941177, 1,
1.771047, -0.2767972, 0.9622387, 1, 0, 0.2862745, 1,
1.786274, -0.5859127, 0.4770986, 1, 0, 0.282353, 1,
1.789266, -0.4875086, 2.531545, 1, 0, 0.2745098, 1,
1.800294, -1.549254, 2.479233, 1, 0, 0.2705882, 1,
1.809965, -0.7391161, 0.599087, 1, 0, 0.2627451, 1,
1.814739, -0.3188988, 1.767611, 1, 0, 0.2588235, 1,
1.816053, -0.03176197, 1.615359, 1, 0, 0.2509804, 1,
1.827323, 0.1685222, 2.242813, 1, 0, 0.2470588, 1,
1.851439, -1.776612, 2.813733, 1, 0, 0.2392157, 1,
1.874904, 1.661315, 2.173617, 1, 0, 0.2352941, 1,
1.876386, -0.6607024, 2.428092, 1, 0, 0.227451, 1,
1.877855, 0.2772422, 1.386645, 1, 0, 0.2235294, 1,
1.88041, 0.5437761, 3.094205, 1, 0, 0.2156863, 1,
1.882889, -1.209336, 3.445352, 1, 0, 0.2117647, 1,
1.889994, -1.242346, 2.368847, 1, 0, 0.2039216, 1,
1.894733, 0.9727291, -0.1587098, 1, 0, 0.1960784, 1,
1.93818, 0.00102142, 1.618821, 1, 0, 0.1921569, 1,
1.947219, 0.5489647, 0.351098, 1, 0, 0.1843137, 1,
1.956444, 0.5138988, 1.113093, 1, 0, 0.1803922, 1,
1.964684, -0.2942884, 3.022547, 1, 0, 0.172549, 1,
1.9692, 1.263182, 0.8708942, 1, 0, 0.1686275, 1,
2.022983, -0.5501458, 2.839948, 1, 0, 0.1607843, 1,
2.031698, -0.6823257, 1.90225, 1, 0, 0.1568628, 1,
2.049011, 0.6341919, 1.242381, 1, 0, 0.1490196, 1,
2.053116, 0.2138084, -0.130222, 1, 0, 0.145098, 1,
2.05504, -1.021997, 1.86158, 1, 0, 0.1372549, 1,
2.056265, 1.178601, 0.2799363, 1, 0, 0.1333333, 1,
2.076882, 0.421231, 1.676915, 1, 0, 0.1254902, 1,
2.077342, 0.2338471, 1.659996, 1, 0, 0.1215686, 1,
2.08835, 0.6304637, 1.54821, 1, 0, 0.1137255, 1,
2.116224, 0.9235688, -0.5381382, 1, 0, 0.1098039, 1,
2.121941, -0.9061145, 2.017214, 1, 0, 0.1019608, 1,
2.150119, 0.4491781, -0.3126503, 1, 0, 0.09411765, 1,
2.180831, -0.7815731, 2.170604, 1, 0, 0.09019608, 1,
2.184857, 0.2573116, 1.73171, 1, 0, 0.08235294, 1,
2.200752, -0.7431776, 1.423888, 1, 0, 0.07843138, 1,
2.225083, 1.182554, -0.1166739, 1, 0, 0.07058824, 1,
2.239551, 0.1682266, 0.5679157, 1, 0, 0.06666667, 1,
2.339217, -0.9683365, 0.5391602, 1, 0, 0.05882353, 1,
2.418855, -0.1039144, 2.582765, 1, 0, 0.05490196, 1,
2.454391, 1.277519, -0.03781071, 1, 0, 0.04705882, 1,
2.550667, -0.9683304, 2.039546, 1, 0, 0.04313726, 1,
2.565207, -1.797668, 3.682277, 1, 0, 0.03529412, 1,
2.567852, -0.4925666, 0.7694111, 1, 0, 0.03137255, 1,
2.585919, -0.4632635, 2.238971, 1, 0, 0.02352941, 1,
2.59404, 0.1910479, 1.603477, 1, 0, 0.01960784, 1,
2.672778, 1.867837, 0.4424116, 1, 0, 0.01176471, 1,
2.833782, 0.7353346, -0.6713735, 1, 0, 0.007843138, 1
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
-0.07951021, -4.387439, -7.271906, 0, -0.5, 0.5, 0.5,
-0.07951021, -4.387439, -7.271906, 1, -0.5, 0.5, 0.5,
-0.07951021, -4.387439, -7.271906, 1, 1.5, 0.5, 0.5,
-0.07951021, -4.387439, -7.271906, 0, 1.5, 0.5, 0.5
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
-3.980408, -0.2554917, -7.271906, 0, -0.5, 0.5, 0.5,
-3.980408, -0.2554917, -7.271906, 1, -0.5, 0.5, 0.5,
-3.980408, -0.2554917, -7.271906, 1, 1.5, 0.5, 0.5,
-3.980408, -0.2554917, -7.271906, 0, 1.5, 0.5, 0.5
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
-3.980408, -4.387439, 0.6637125, 0, -0.5, 0.5, 0.5,
-3.980408, -4.387439, 0.6637125, 1, -0.5, 0.5, 0.5,
-3.980408, -4.387439, 0.6637125, 1, 1.5, 0.5, 0.5,
-3.980408, -4.387439, 0.6637125, 0, 1.5, 0.5, 0.5
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
-2, -3.433913, -5.440609,
2, -3.433913, -5.440609,
-2, -3.433913, -5.440609,
-2, -3.592834, -5.745825,
-1, -3.433913, -5.440609,
-1, -3.592834, -5.745825,
0, -3.433913, -5.440609,
0, -3.592834, -5.745825,
1, -3.433913, -5.440609,
1, -3.592834, -5.745825,
2, -3.433913, -5.440609,
2, -3.592834, -5.745825
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
-2, -3.910676, -6.356257, 0, -0.5, 0.5, 0.5,
-2, -3.910676, -6.356257, 1, -0.5, 0.5, 0.5,
-2, -3.910676, -6.356257, 1, 1.5, 0.5, 0.5,
-2, -3.910676, -6.356257, 0, 1.5, 0.5, 0.5,
-1, -3.910676, -6.356257, 0, -0.5, 0.5, 0.5,
-1, -3.910676, -6.356257, 1, -0.5, 0.5, 0.5,
-1, -3.910676, -6.356257, 1, 1.5, 0.5, 0.5,
-1, -3.910676, -6.356257, 0, 1.5, 0.5, 0.5,
0, -3.910676, -6.356257, 0, -0.5, 0.5, 0.5,
0, -3.910676, -6.356257, 1, -0.5, 0.5, 0.5,
0, -3.910676, -6.356257, 1, 1.5, 0.5, 0.5,
0, -3.910676, -6.356257, 0, 1.5, 0.5, 0.5,
1, -3.910676, -6.356257, 0, -0.5, 0.5, 0.5,
1, -3.910676, -6.356257, 1, -0.5, 0.5, 0.5,
1, -3.910676, -6.356257, 1, 1.5, 0.5, 0.5,
1, -3.910676, -6.356257, 0, 1.5, 0.5, 0.5,
2, -3.910676, -6.356257, 0, -0.5, 0.5, 0.5,
2, -3.910676, -6.356257, 1, -0.5, 0.5, 0.5,
2, -3.910676, -6.356257, 1, 1.5, 0.5, 0.5,
2, -3.910676, -6.356257, 0, 1.5, 0.5, 0.5
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
-3.080201, -3, -5.440609,
-3.080201, 2, -5.440609,
-3.080201, -3, -5.440609,
-3.230236, -3, -5.745825,
-3.080201, -2, -5.440609,
-3.230236, -2, -5.745825,
-3.080201, -1, -5.440609,
-3.230236, -1, -5.745825,
-3.080201, 0, -5.440609,
-3.230236, 0, -5.745825,
-3.080201, 1, -5.440609,
-3.230236, 1, -5.745825,
-3.080201, 2, -5.440609,
-3.230236, 2, -5.745825
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
-3.530305, -3, -6.356257, 0, -0.5, 0.5, 0.5,
-3.530305, -3, -6.356257, 1, -0.5, 0.5, 0.5,
-3.530305, -3, -6.356257, 1, 1.5, 0.5, 0.5,
-3.530305, -3, -6.356257, 0, 1.5, 0.5, 0.5,
-3.530305, -2, -6.356257, 0, -0.5, 0.5, 0.5,
-3.530305, -2, -6.356257, 1, -0.5, 0.5, 0.5,
-3.530305, -2, -6.356257, 1, 1.5, 0.5, 0.5,
-3.530305, -2, -6.356257, 0, 1.5, 0.5, 0.5,
-3.530305, -1, -6.356257, 0, -0.5, 0.5, 0.5,
-3.530305, -1, -6.356257, 1, -0.5, 0.5, 0.5,
-3.530305, -1, -6.356257, 1, 1.5, 0.5, 0.5,
-3.530305, -1, -6.356257, 0, 1.5, 0.5, 0.5,
-3.530305, 0, -6.356257, 0, -0.5, 0.5, 0.5,
-3.530305, 0, -6.356257, 1, -0.5, 0.5, 0.5,
-3.530305, 0, -6.356257, 1, 1.5, 0.5, 0.5,
-3.530305, 0, -6.356257, 0, 1.5, 0.5, 0.5,
-3.530305, 1, -6.356257, 0, -0.5, 0.5, 0.5,
-3.530305, 1, -6.356257, 1, -0.5, 0.5, 0.5,
-3.530305, 1, -6.356257, 1, 1.5, 0.5, 0.5,
-3.530305, 1, -6.356257, 0, 1.5, 0.5, 0.5,
-3.530305, 2, -6.356257, 0, -0.5, 0.5, 0.5,
-3.530305, 2, -6.356257, 1, -0.5, 0.5, 0.5,
-3.530305, 2, -6.356257, 1, 1.5, 0.5, 0.5,
-3.530305, 2, -6.356257, 0, 1.5, 0.5, 0.5
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
-3.080201, -3.433913, -4,
-3.080201, -3.433913, 6,
-3.080201, -3.433913, -4,
-3.230236, -3.592834, -4,
-3.080201, -3.433913, -2,
-3.230236, -3.592834, -2,
-3.080201, -3.433913, 0,
-3.230236, -3.592834, 0,
-3.080201, -3.433913, 2,
-3.230236, -3.592834, 2,
-3.080201, -3.433913, 4,
-3.230236, -3.592834, 4,
-3.080201, -3.433913, 6,
-3.230236, -3.592834, 6
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
"4",
"6"
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
-3.530305, -3.910676, -4, 0, -0.5, 0.5, 0.5,
-3.530305, -3.910676, -4, 1, -0.5, 0.5, 0.5,
-3.530305, -3.910676, -4, 1, 1.5, 0.5, 0.5,
-3.530305, -3.910676, -4, 0, 1.5, 0.5, 0.5,
-3.530305, -3.910676, -2, 0, -0.5, 0.5, 0.5,
-3.530305, -3.910676, -2, 1, -0.5, 0.5, 0.5,
-3.530305, -3.910676, -2, 1, 1.5, 0.5, 0.5,
-3.530305, -3.910676, -2, 0, 1.5, 0.5, 0.5,
-3.530305, -3.910676, 0, 0, -0.5, 0.5, 0.5,
-3.530305, -3.910676, 0, 1, -0.5, 0.5, 0.5,
-3.530305, -3.910676, 0, 1, 1.5, 0.5, 0.5,
-3.530305, -3.910676, 0, 0, 1.5, 0.5, 0.5,
-3.530305, -3.910676, 2, 0, -0.5, 0.5, 0.5,
-3.530305, -3.910676, 2, 1, -0.5, 0.5, 0.5,
-3.530305, -3.910676, 2, 1, 1.5, 0.5, 0.5,
-3.530305, -3.910676, 2, 0, 1.5, 0.5, 0.5,
-3.530305, -3.910676, 4, 0, -0.5, 0.5, 0.5,
-3.530305, -3.910676, 4, 1, -0.5, 0.5, 0.5,
-3.530305, -3.910676, 4, 1, 1.5, 0.5, 0.5,
-3.530305, -3.910676, 4, 0, 1.5, 0.5, 0.5,
-3.530305, -3.910676, 6, 0, -0.5, 0.5, 0.5,
-3.530305, -3.910676, 6, 1, -0.5, 0.5, 0.5,
-3.530305, -3.910676, 6, 1, 1.5, 0.5, 0.5,
-3.530305, -3.910676, 6, 0, 1.5, 0.5, 0.5
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
-3.080201, -3.433913, -5.440609,
-3.080201, 2.922929, -5.440609,
-3.080201, -3.433913, 6.768034,
-3.080201, 2.922929, 6.768034,
-3.080201, -3.433913, -5.440609,
-3.080201, -3.433913, 6.768034,
-3.080201, 2.922929, -5.440609,
-3.080201, 2.922929, 6.768034,
-3.080201, -3.433913, -5.440609,
2.921181, -3.433913, -5.440609,
-3.080201, -3.433913, 6.768034,
2.921181, -3.433913, 6.768034,
-3.080201, 2.922929, -5.440609,
2.921181, 2.922929, -5.440609,
-3.080201, 2.922929, 6.768034,
2.921181, 2.922929, 6.768034,
2.921181, -3.433913, -5.440609,
2.921181, 2.922929, -5.440609,
2.921181, -3.433913, 6.768034,
2.921181, 2.922929, 6.768034,
2.921181, -3.433913, -5.440609,
2.921181, -3.433913, 6.768034,
2.921181, 2.922929, -5.440609,
2.921181, 2.922929, 6.768034
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
var radius = 8.018195;
var distance = 35.67385;
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
mvMatrix.translate( 0.07951021, 0.2554917, -0.6637125 );
mvMatrix.scale( 1.444572, 1.363795, 0.7101058 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.67385);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
sodium-2-phenyl-phen<-read.table("sodium-2-phenyl-phen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sodium-2-phenyl-phen$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium' not found
```

```r
y<-sodium-2-phenyl-phen$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium' not found
```

```r
z<-sodium-2-phenyl-phen$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium' not found
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
-2.992802, 0.3592292, -2.102581, 0, 0, 1, 1, 1,
-2.848883, 0.4758762, -2.40439, 1, 0, 0, 1, 1,
-2.806147, 0.271787, -0.8438715, 1, 0, 0, 1, 1,
-2.73773, 0.2708254, -2.190333, 1, 0, 0, 1, 1,
-2.69182, 0.9712033, -0.003365634, 1, 0, 0, 1, 1,
-2.669583, -0.4449905, -1.57989, 1, 0, 0, 1, 1,
-2.490895, 0.3677324, -0.3455225, 0, 0, 0, 1, 1,
-2.463068, -0.3248591, -2.94066, 0, 0, 0, 1, 1,
-2.346157, -1.321049, -1.477584, 0, 0, 0, 1, 1,
-2.334707, 1.528572, -1.274835, 0, 0, 0, 1, 1,
-2.316164, -1.344416, 0.486175, 0, 0, 0, 1, 1,
-2.279564, 0.9416422, -1.240525, 0, 0, 0, 1, 1,
-2.263728, -2.239327, -3.374837, 0, 0, 0, 1, 1,
-2.261901, 0.6694111, -1.553765, 1, 1, 1, 1, 1,
-2.259135, -0.6688032, -2.09554, 1, 1, 1, 1, 1,
-2.241023, 0.4133077, -0.7770261, 1, 1, 1, 1, 1,
-2.180466, -0.3805493, 0.3633585, 1, 1, 1, 1, 1,
-2.161757, -1.449932, -1.436628, 1, 1, 1, 1, 1,
-2.16116, -0.1381559, -1.003442, 1, 1, 1, 1, 1,
-2.123185, 2.044625, 0.6195264, 1, 1, 1, 1, 1,
-2.11539, -0.5916542, -2.822348, 1, 1, 1, 1, 1,
-2.112673, -0.1158255, -1.390354, 1, 1, 1, 1, 1,
-2.089356, -0.05959084, -0.3941487, 1, 1, 1, 1, 1,
-2.001903, 0.7892914, -2.798079, 1, 1, 1, 1, 1,
-1.988696, 1.671595, 0.3703943, 1, 1, 1, 1, 1,
-1.961007, 0.2405337, -1.613545, 1, 1, 1, 1, 1,
-1.954082, 0.4270103, -1.328256, 1, 1, 1, 1, 1,
-1.930285, -0.1541104, -1.832549, 1, 1, 1, 1, 1,
-1.923098, -0.1890874, -2.875496, 0, 0, 1, 1, 1,
-1.919072, 0.4608811, -0.616056, 1, 0, 0, 1, 1,
-1.892824, -0.7403244, -2.433271, 1, 0, 0, 1, 1,
-1.887159, -1.017493, -2.946696, 1, 0, 0, 1, 1,
-1.884693, 2.47492, 0.9106568, 1, 0, 0, 1, 1,
-1.853092, 0.2859482, 0.1222134, 1, 0, 0, 1, 1,
-1.815369, 0.5171385, -1.235883, 0, 0, 0, 1, 1,
-1.815027, -1.15613, -0.9334042, 0, 0, 0, 1, 1,
-1.813944, -0.858843, -2.987876, 0, 0, 0, 1, 1,
-1.788941, 0.2313608, -1.56259, 0, 0, 0, 1, 1,
-1.787431, 0.6565461, -0.5462401, 0, 0, 0, 1, 1,
-1.774586, 1.780133, -1.477213, 0, 0, 0, 1, 1,
-1.757493, 1.625838, -1.791935, 0, 0, 0, 1, 1,
-1.754362, -1.56608, -2.224599, 1, 1, 1, 1, 1,
-1.753636, 0.773084, -2.587193, 1, 1, 1, 1, 1,
-1.752867, -0.8892518, -2.219477, 1, 1, 1, 1, 1,
-1.73738, -0.2688352, -1.760631, 1, 1, 1, 1, 1,
-1.712809, 1.54969, -1.481601, 1, 1, 1, 1, 1,
-1.712402, 2.163543, -0.9469995, 1, 1, 1, 1, 1,
-1.70404, 0.4306406, -3.321002, 1, 1, 1, 1, 1,
-1.697269, 0.8613439, -0.6595352, 1, 1, 1, 1, 1,
-1.686022, 0.2599745, -0.7408071, 1, 1, 1, 1, 1,
-1.681633, 0.4253052, -1.147459, 1, 1, 1, 1, 1,
-1.668856, -0.7965016, -2.971719, 1, 1, 1, 1, 1,
-1.657277, -1.020006, -1.131493, 1, 1, 1, 1, 1,
-1.62573, -0.5444413, -1.401333, 1, 1, 1, 1, 1,
-1.622633, 1.489258, -0.3279059, 1, 1, 1, 1, 1,
-1.618884, -1.019346, -2.429929, 1, 1, 1, 1, 1,
-1.590305, 1.639246, -0.5411922, 0, 0, 1, 1, 1,
-1.585632, 1.86263, -0.9697364, 1, 0, 0, 1, 1,
-1.583944, 0.4425296, -2.325803, 1, 0, 0, 1, 1,
-1.579908, 1.171369, 1.631969, 1, 0, 0, 1, 1,
-1.57422, -0.6226333, -2.370964, 1, 0, 0, 1, 1,
-1.572461, -0.3164272, -1.17213, 1, 0, 0, 1, 1,
-1.560769, 0.5363468, -0.9342836, 0, 0, 0, 1, 1,
-1.537156, -0.8432553, -0.8791597, 0, 0, 0, 1, 1,
-1.535588, 0.2341186, 1.01222, 0, 0, 0, 1, 1,
-1.535476, -0.8168416, -1.557931, 0, 0, 0, 1, 1,
-1.529586, 1.75913, -0.2056293, 0, 0, 0, 1, 1,
-1.527797, -0.213828, 0.09242968, 0, 0, 0, 1, 1,
-1.506356, -0.37122, -2.601686, 0, 0, 0, 1, 1,
-1.499538, 0.7405586, -1.981149, 1, 1, 1, 1, 1,
-1.48361, -0.7786116, -1.811858, 1, 1, 1, 1, 1,
-1.480178, 0.7025585, 0.2810426, 1, 1, 1, 1, 1,
-1.476174, 1.189753, -1.079808, 1, 1, 1, 1, 1,
-1.475495, -1.837379, -2.78777, 1, 1, 1, 1, 1,
-1.470767, -1.176084, -1.634177, 1, 1, 1, 1, 1,
-1.438023, 1.765202, -1.286697, 1, 1, 1, 1, 1,
-1.436214, -0.3725826, -3.126701, 1, 1, 1, 1, 1,
-1.432855, -0.3464337, -0.2349239, 1, 1, 1, 1, 1,
-1.429223, 1.008094, -1.440016, 1, 1, 1, 1, 1,
-1.421141, 0.06975185, -3.052474, 1, 1, 1, 1, 1,
-1.417558, -0.3611402, -0.3540019, 1, 1, 1, 1, 1,
-1.414928, -0.1568548, -0.4314867, 1, 1, 1, 1, 1,
-1.411422, 0.05374435, -2.449611, 1, 1, 1, 1, 1,
-1.399981, -0.1583972, -2.876167, 1, 1, 1, 1, 1,
-1.396322, -1.384774, -1.748636, 0, 0, 1, 1, 1,
-1.396147, 0.8052306, -0.8862499, 1, 0, 0, 1, 1,
-1.370056, -1.873923, -2.335094, 1, 0, 0, 1, 1,
-1.36627, -0.5465953, -3.13767, 1, 0, 0, 1, 1,
-1.348695, 0.555723, -0.7436164, 1, 0, 0, 1, 1,
-1.342712, 0.7519478, -1.221837, 1, 0, 0, 1, 1,
-1.331869, -0.7607192, -1.373222, 0, 0, 0, 1, 1,
-1.329264, -0.02272082, -0.1115326, 0, 0, 0, 1, 1,
-1.316483, -2.305531, -3.832112, 0, 0, 0, 1, 1,
-1.309666, -1.072256, -3.161904, 0, 0, 0, 1, 1,
-1.309395, -1.104545, -1.474031, 0, 0, 0, 1, 1,
-1.301759, 0.3138347, -1.42201, 0, 0, 0, 1, 1,
-1.294449, 1.43631, -0.7971051, 0, 0, 0, 1, 1,
-1.290423, -0.4847068, -2.912617, 1, 1, 1, 1, 1,
-1.283593, -0.3981356, -2.031222, 1, 1, 1, 1, 1,
-1.279907, -0.9235677, -1.964151, 1, 1, 1, 1, 1,
-1.251275, 1.298684, 0.3522347, 1, 1, 1, 1, 1,
-1.230601, -0.0330271, -3.293174, 1, 1, 1, 1, 1,
-1.223889, -0.316462, -1.313094, 1, 1, 1, 1, 1,
-1.221002, -2.654517, -2.669821, 1, 1, 1, 1, 1,
-1.214922, 0.2351656, -1.985006, 1, 1, 1, 1, 1,
-1.203671, 0.01993664, -1.157288, 1, 1, 1, 1, 1,
-1.202999, 0.08264282, -2.094635, 1, 1, 1, 1, 1,
-1.201384, -1.386618, -2.439616, 1, 1, 1, 1, 1,
-1.200143, 0.217847, -0.6864793, 1, 1, 1, 1, 1,
-1.192453, -1.243107, -1.648103, 1, 1, 1, 1, 1,
-1.188635, -1.553606, -1.554923, 1, 1, 1, 1, 1,
-1.186242, -0.4722556, -2.625205, 1, 1, 1, 1, 1,
-1.184922, -0.3432684, -1.253755, 0, 0, 1, 1, 1,
-1.173761, -0.3564615, -0.9503027, 1, 0, 0, 1, 1,
-1.170347, 0.3257734, -1.823929, 1, 0, 0, 1, 1,
-1.151767, -0.03079126, -2.377128, 1, 0, 0, 1, 1,
-1.148246, -0.3200481, -1.333817, 1, 0, 0, 1, 1,
-1.146961, -0.1606106, -3.523563, 1, 0, 0, 1, 1,
-1.141542, 0.2170307, 0.6190764, 0, 0, 0, 1, 1,
-1.139346, -0.5535105, -1.701212, 0, 0, 0, 1, 1,
-1.130902, -0.9314647, -1.256503, 0, 0, 0, 1, 1,
-1.122331, 1.422196, -0.4265263, 0, 0, 0, 1, 1,
-1.120333, 0.5005187, -0.4430073, 0, 0, 0, 1, 1,
-1.118858, -0.7321823, -3.170298, 0, 0, 0, 1, 1,
-1.117415, -0.3857163, -2.45346, 0, 0, 0, 1, 1,
-1.112155, 0.2686893, -0.5079855, 1, 1, 1, 1, 1,
-1.11085, -0.06397492, -1.381589, 1, 1, 1, 1, 1,
-1.107493, -1.820081, -4.206883, 1, 1, 1, 1, 1,
-1.100788, 0.0783143, -2.643443, 1, 1, 1, 1, 1,
-1.100344, 0.8477011, -2.356194, 1, 1, 1, 1, 1,
-1.084796, 0.3347776, -0.442358, 1, 1, 1, 1, 1,
-1.082986, -0.3504585, -3.435001, 1, 1, 1, 1, 1,
-1.075987, -0.8930126, -4.054942, 1, 1, 1, 1, 1,
-1.075363, 0.7237049, 0.3466731, 1, 1, 1, 1, 1,
-1.066113, 1.484929, -0.009008334, 1, 1, 1, 1, 1,
-1.062486, -0.2928597, -2.390969, 1, 1, 1, 1, 1,
-1.060445, 0.05979805, -1.235036, 1, 1, 1, 1, 1,
-1.060361, 1.354493, 0.5485235, 1, 1, 1, 1, 1,
-1.057032, -0.1392322, -2.919123, 1, 1, 1, 1, 1,
-1.036069, -0.1449305, -2.847457, 1, 1, 1, 1, 1,
-1.032331, -1.732755, -2.216287, 0, 0, 1, 1, 1,
-1.03121, 0.6930301, -0.785069, 1, 0, 0, 1, 1,
-1.027632, 1.095349, -1.163539, 1, 0, 0, 1, 1,
-1.024264, -3.341337, -1.903975, 1, 0, 0, 1, 1,
-1.013151, -0.722928, -1.263525, 1, 0, 0, 1, 1,
-1.011103, 0.8245915, -0.6349866, 1, 0, 0, 1, 1,
-1.008294, -1.819676, -4.019143, 0, 0, 0, 1, 1,
-1.006593, -0.1904273, -2.021703, 0, 0, 0, 1, 1,
-1.006468, 0.02105078, -1.501591, 0, 0, 0, 1, 1,
-1.001821, -1.045758, -4.343937, 0, 0, 0, 1, 1,
-1.000991, 1.57975, 0.3942102, 0, 0, 0, 1, 1,
-1.0005, 1.164556, -1.644692, 0, 0, 0, 1, 1,
-0.9999895, 0.5705985, -1.780229, 0, 0, 0, 1, 1,
-0.999394, 0.9021425, -1.034729, 1, 1, 1, 1, 1,
-0.9817542, 1.072592, -0.7972457, 1, 1, 1, 1, 1,
-0.9801319, -0.7669257, -2.54545, 1, 1, 1, 1, 1,
-0.9796486, -0.1364914, -1.948673, 1, 1, 1, 1, 1,
-0.9791215, -0.2687806, -1.406699, 1, 1, 1, 1, 1,
-0.9767603, 1.218164, -0.2112382, 1, 1, 1, 1, 1,
-0.9719818, 0.6807749, -0.09615158, 1, 1, 1, 1, 1,
-0.9610748, -1.787161, -1.312124, 1, 1, 1, 1, 1,
-0.950619, 0.7342334, -0.3285274, 1, 1, 1, 1, 1,
-0.9500737, -0.2925242, -2.552172, 1, 1, 1, 1, 1,
-0.9483344, 0.9193969, -0.643169, 1, 1, 1, 1, 1,
-0.9441742, 1.302403, -0.6561016, 1, 1, 1, 1, 1,
-0.9405735, -1.248389, -3.682562, 1, 1, 1, 1, 1,
-0.9402213, -0.2606345, -4.035212, 1, 1, 1, 1, 1,
-0.9390368, 2.750851, -0.9240513, 1, 1, 1, 1, 1,
-0.9338462, 0.05919279, -2.608518, 0, 0, 1, 1, 1,
-0.9256128, -0.9478195, -1.613149, 1, 0, 0, 1, 1,
-0.9231429, 0.6454868, -2.741332, 1, 0, 0, 1, 1,
-0.9199952, -1.449731, -1.263859, 1, 0, 0, 1, 1,
-0.9184842, -1.518297, -1.938472, 1, 0, 0, 1, 1,
-0.9173086, -0.7923876, -2.813809, 1, 0, 0, 1, 1,
-0.9152327, -0.04950313, -1.385148, 0, 0, 0, 1, 1,
-0.9151066, -0.3920822, -0.896576, 0, 0, 0, 1, 1,
-0.9077679, -1.605285, -3.636896, 0, 0, 0, 1, 1,
-0.8895253, -1.627667, -3.35504, 0, 0, 0, 1, 1,
-0.8871748, 1.175056, -1.113525, 0, 0, 0, 1, 1,
-0.884672, -0.2367011, -2.429936, 0, 0, 0, 1, 1,
-0.8841193, 0.5557468, -1.991653, 0, 0, 0, 1, 1,
-0.8834257, -0.6065081, -1.766076, 1, 1, 1, 1, 1,
-0.881725, -1.335084, -2.758352, 1, 1, 1, 1, 1,
-0.8797345, -1.831785, -3.961191, 1, 1, 1, 1, 1,
-0.8737009, -0.6666676, -2.259503, 1, 1, 1, 1, 1,
-0.8690104, 0.7702118, 0.4138931, 1, 1, 1, 1, 1,
-0.8662839, -1.612703, -1.698318, 1, 1, 1, 1, 1,
-0.8573884, 0.6736476, -0.4207198, 1, 1, 1, 1, 1,
-0.8504056, 0.4409553, -0.1804575, 1, 1, 1, 1, 1,
-0.8479503, 1.32566, -2.19494, 1, 1, 1, 1, 1,
-0.8411704, 0.9910864, -0.8680881, 1, 1, 1, 1, 1,
-0.8392793, 1.998836, -1.743798, 1, 1, 1, 1, 1,
-0.8313355, -0.3690144, -2.190061, 1, 1, 1, 1, 1,
-0.8298069, -0.1413412, -2.713622, 1, 1, 1, 1, 1,
-0.8285689, -0.491316, -3.123851, 1, 1, 1, 1, 1,
-0.826974, -1.55259, -2.837813, 1, 1, 1, 1, 1,
-0.8169738, 1.176607, 1.483522, 0, 0, 1, 1, 1,
-0.8160677, -0.5588837, -2.78094, 1, 0, 0, 1, 1,
-0.8134629, -0.02657304, -0.2239372, 1, 0, 0, 1, 1,
-0.8069234, -0.05175543, -2.476921, 1, 0, 0, 1, 1,
-0.8051196, 0.814055, -2.060909, 1, 0, 0, 1, 1,
-0.8032933, 0.2967724, -3.955676, 1, 0, 0, 1, 1,
-0.8004235, 0.6351158, 0.527831, 0, 0, 0, 1, 1,
-0.7949644, -0.4789126, -0.8729818, 0, 0, 0, 1, 1,
-0.7923139, 1.734651, -1.307429, 0, 0, 0, 1, 1,
-0.787257, -0.9476861, -3.195324, 0, 0, 0, 1, 1,
-0.783662, 0.6892555, -1.683684, 0, 0, 0, 1, 1,
-0.7824298, -0.9818254, -2.260059, 0, 0, 0, 1, 1,
-0.7810658, 0.4039531, -2.332909, 0, 0, 0, 1, 1,
-0.7740281, 0.8603354, -1.553682, 1, 1, 1, 1, 1,
-0.7732204, 0.04965296, -1.024191, 1, 1, 1, 1, 1,
-0.7679456, -0.9447777, -1.1434, 1, 1, 1, 1, 1,
-0.7653103, -0.01666504, 0.1327373, 1, 1, 1, 1, 1,
-0.7623123, -0.6635092, -3.363078, 1, 1, 1, 1, 1,
-0.7616989, -2.941683, -3.105301, 1, 1, 1, 1, 1,
-0.7609898, -2.012881, -4.388594, 1, 1, 1, 1, 1,
-0.76081, -0.7392304, -3.589843, 1, 1, 1, 1, 1,
-0.7581009, 0.7146233, -0.4308509, 1, 1, 1, 1, 1,
-0.7571408, -0.3251179, -1.059269, 1, 1, 1, 1, 1,
-0.7566851, -1.700325, -3.995014, 1, 1, 1, 1, 1,
-0.7520931, -0.2936891, -1.016097, 1, 1, 1, 1, 1,
-0.7481469, -0.4326366, -0.9504543, 1, 1, 1, 1, 1,
-0.7432526, -0.1576816, -1.832242, 1, 1, 1, 1, 1,
-0.7383695, -0.3812136, -0.7499902, 1, 1, 1, 1, 1,
-0.7378218, -0.07915074, -1.743721, 0, 0, 1, 1, 1,
-0.7277443, 0.03991992, -2.784625, 1, 0, 0, 1, 1,
-0.7272575, -0.08943706, -1.758228, 1, 0, 0, 1, 1,
-0.7245555, 0.3131728, -1.521849, 1, 0, 0, 1, 1,
-0.7204733, -0.279238, -2.583919, 1, 0, 0, 1, 1,
-0.7132292, 0.5487202, -1.006379, 1, 0, 0, 1, 1,
-0.7103723, -2.360865, -2.72453, 0, 0, 0, 1, 1,
-0.7065088, -0.2624784, -3.443817, 0, 0, 0, 1, 1,
-0.7061931, 1.348511, -0.3519678, 0, 0, 0, 1, 1,
-0.7050163, 0.9631111, -0.1367576, 0, 0, 0, 1, 1,
-0.6985084, 2.463098, -1.223119, 0, 0, 0, 1, 1,
-0.6939969, 0.867056, -1.972723, 0, 0, 0, 1, 1,
-0.6894909, -2.103057, -3.15787, 0, 0, 0, 1, 1,
-0.6857097, -1.066527, -3.845979, 1, 1, 1, 1, 1,
-0.6825856, 0.8759228, -2.276448, 1, 1, 1, 1, 1,
-0.6823795, -0.01741382, -2.177288, 1, 1, 1, 1, 1,
-0.6789154, 1.490797, -0.4303762, 1, 1, 1, 1, 1,
-0.6777683, 0.1182762, -2.560792, 1, 1, 1, 1, 1,
-0.6765512, -0.241493, -2.525185, 1, 1, 1, 1, 1,
-0.6705952, 0.04820237, -2.451648, 1, 1, 1, 1, 1,
-0.67033, -0.03109546, -2.676561, 1, 1, 1, 1, 1,
-0.6620279, -0.3322564, -2.800131, 1, 1, 1, 1, 1,
-0.6616905, 1.994938, -0.59479, 1, 1, 1, 1, 1,
-0.657353, 0.5304573, -0.8939717, 1, 1, 1, 1, 1,
-0.6568576, -0.03025432, -3.420597, 1, 1, 1, 1, 1,
-0.6530097, 0.9979802, 1.027535, 1, 1, 1, 1, 1,
-0.6479098, 0.06185021, -2.037955, 1, 1, 1, 1, 1,
-0.6464807, 0.1161339, -2.475482, 1, 1, 1, 1, 1,
-0.642621, -0.1271867, -2.218412, 0, 0, 1, 1, 1,
-0.6425304, -0.02414659, -1.321772, 1, 0, 0, 1, 1,
-0.6420288, -0.7017691, -3.869269, 1, 0, 0, 1, 1,
-0.6321545, 0.9048904, 0.7392436, 1, 0, 0, 1, 1,
-0.6206837, -1.381231, -2.289327, 1, 0, 0, 1, 1,
-0.6183145, -0.8426588, -1.804469, 1, 0, 0, 1, 1,
-0.616189, 0.832392, -0.6933087, 0, 0, 0, 1, 1,
-0.6145085, -1.046697, -3.189571, 0, 0, 0, 1, 1,
-0.614221, 1.157732, 0.2508199, 0, 0, 0, 1, 1,
-0.6122692, 0.864203, -3.02217, 0, 0, 0, 1, 1,
-0.6118385, -0.3198008, -2.929017, 0, 0, 0, 1, 1,
-0.6107628, -0.9367003, -0.2084579, 0, 0, 0, 1, 1,
-0.6101984, 0.9071133, -0.2495817, 0, 0, 0, 1, 1,
-0.6095458, -0.5369194, -1.874646, 1, 1, 1, 1, 1,
-0.6076908, -0.1412318, -0.4341113, 1, 1, 1, 1, 1,
-0.6059533, 0.5924664, -1.704101, 1, 1, 1, 1, 1,
-0.6045331, -0.4208375, -3.100585, 1, 1, 1, 1, 1,
-0.6009763, -0.05839786, 0.01943816, 1, 1, 1, 1, 1,
-0.5960811, 0.2209315, -0.8180096, 1, 1, 1, 1, 1,
-0.5944473, 0.1328134, -0.5394571, 1, 1, 1, 1, 1,
-0.593102, -1.328199, -3.39407, 1, 1, 1, 1, 1,
-0.5904896, -0.09991589, -2.674824, 1, 1, 1, 1, 1,
-0.5902857, -1.401102, -3.915541, 1, 1, 1, 1, 1,
-0.5901636, 0.3661087, 0.3406241, 1, 1, 1, 1, 1,
-0.5891754, -1.857487, 0.2390798, 1, 1, 1, 1, 1,
-0.5882002, -0.4857953, -2.010884, 1, 1, 1, 1, 1,
-0.5868817, 1.952765, -1.212097, 1, 1, 1, 1, 1,
-0.5864977, -0.003958183, -1.663543, 1, 1, 1, 1, 1,
-0.5846774, -1.470778, -3.124576, 0, 0, 1, 1, 1,
-0.5811884, -1.272918, -4.844448, 1, 0, 0, 1, 1,
-0.5787464, -0.6902807, -1.686228, 1, 0, 0, 1, 1,
-0.5701364, 0.6081499, 0.1475246, 1, 0, 0, 1, 1,
-0.5689118, 0.3021312, -0.9447114, 1, 0, 0, 1, 1,
-0.5677929, 1.082653, -0.1160467, 1, 0, 0, 1, 1,
-0.5558766, -0.6598808, -2.031947, 0, 0, 0, 1, 1,
-0.5552346, 0.8362339, -2.001694, 0, 0, 0, 1, 1,
-0.5491876, -0.7515972, -1.413226, 0, 0, 0, 1, 1,
-0.5474462, -0.9430851, -2.662922, 0, 0, 0, 1, 1,
-0.5467938, -0.3720325, -1.500616, 0, 0, 0, 1, 1,
-0.5450183, 0.03525347, -3.515701, 0, 0, 0, 1, 1,
-0.542333, 0.139082, -2.561189, 0, 0, 0, 1, 1,
-0.5423105, 0.3849615, -0.4017242, 1, 1, 1, 1, 1,
-0.5420345, 1.405649, 0.02567122, 1, 1, 1, 1, 1,
-0.5382774, -2.183953, -3.137079, 1, 1, 1, 1, 1,
-0.5326483, -0.3051248, -1.766219, 1, 1, 1, 1, 1,
-0.5289461, 0.7210891, -0.7593814, 1, 1, 1, 1, 1,
-0.5245015, 0.2132709, -1.803957, 1, 1, 1, 1, 1,
-0.522965, -0.08471738, -2.917085, 1, 1, 1, 1, 1,
-0.5222603, 1.231802, 0.5313197, 1, 1, 1, 1, 1,
-0.5209137, -0.9688104, -2.022816, 1, 1, 1, 1, 1,
-0.5185767, 2.190901, -0.1886787, 1, 1, 1, 1, 1,
-0.5185054, -0.6746222, -2.450975, 1, 1, 1, 1, 1,
-0.5172398, 0.6848103, -2.39539, 1, 1, 1, 1, 1,
-0.515692, 1.406996, 1.686953, 1, 1, 1, 1, 1,
-0.5124758, -0.1330131, -0.3323939, 1, 1, 1, 1, 1,
-0.51243, 0.4717426, -0.5485111, 1, 1, 1, 1, 1,
-0.5093867, 0.1843832, -2.448873, 0, 0, 1, 1, 1,
-0.5076317, 1.019042, 0.1916178, 1, 0, 0, 1, 1,
-0.5022237, 0.2563939, -1.360189, 1, 0, 0, 1, 1,
-0.5005492, 0.1076049, -2.941103, 1, 0, 0, 1, 1,
-0.5004532, -0.1326391, -1.57108, 1, 0, 0, 1, 1,
-0.4988852, -1.158575, -3.743751, 1, 0, 0, 1, 1,
-0.4976467, 0.2722612, -1.611874, 0, 0, 0, 1, 1,
-0.4968863, -0.9852563, -2.350495, 0, 0, 0, 1, 1,
-0.4960586, 0.4590717, -1.300029, 0, 0, 0, 1, 1,
-0.4955161, -1.442078, -3.263324, 0, 0, 0, 1, 1,
-0.4927832, -0.4821392, -3.263253, 0, 0, 0, 1, 1,
-0.4907242, -0.1238975, -3.498113, 0, 0, 0, 1, 1,
-0.4900604, 0.557111, -0.6509473, 0, 0, 0, 1, 1,
-0.4834166, -1.109292, -1.352563, 1, 1, 1, 1, 1,
-0.4825925, -1.192259, -2.590359, 1, 1, 1, 1, 1,
-0.4750153, -1.753336, -4.275207, 1, 1, 1, 1, 1,
-0.4691142, -0.694558, -1.530672, 1, 1, 1, 1, 1,
-0.4671036, 0.3066761, -2.021029, 1, 1, 1, 1, 1,
-0.4654063, -0.3467532, -1.864476, 1, 1, 1, 1, 1,
-0.4616587, -0.2634168, -2.65343, 1, 1, 1, 1, 1,
-0.4612967, -0.3743684, -2.950866, 1, 1, 1, 1, 1,
-0.4603139, 0.05688966, -1.798412, 1, 1, 1, 1, 1,
-0.4561873, 0.9303113, 1.576494, 1, 1, 1, 1, 1,
-0.4514142, -2.634557, -3.563973, 1, 1, 1, 1, 1,
-0.4505328, -0.4893959, -1.939809, 1, 1, 1, 1, 1,
-0.4459903, 0.4987749, -1.34558, 1, 1, 1, 1, 1,
-0.4428381, 0.1734996, 0.4646513, 1, 1, 1, 1, 1,
-0.4426283, -0.03729929, -0.9198087, 1, 1, 1, 1, 1,
-0.4410574, -2.31428, -4.307189, 0, 0, 1, 1, 1,
-0.4365889, 1.24104, -0.7622306, 1, 0, 0, 1, 1,
-0.4351575, -1.60007, -4.008645, 1, 0, 0, 1, 1,
-0.4294875, -0.07591317, 0.7015338, 1, 0, 0, 1, 1,
-0.4292004, -0.2979774, -0.7948554, 1, 0, 0, 1, 1,
-0.4285512, -1.011626, -3.544466, 1, 0, 0, 1, 1,
-0.4261937, 0.2786354, -2.273344, 0, 0, 0, 1, 1,
-0.4258217, 0.3602985, 0.2125433, 0, 0, 0, 1, 1,
-0.4258155, 0.6334959, -0.5849486, 0, 0, 0, 1, 1,
-0.4242748, 1.711543, -0.4866722, 0, 0, 0, 1, 1,
-0.4229652, 0.4302722, -0.1411376, 0, 0, 0, 1, 1,
-0.4199209, 0.457391, -2.255086, 0, 0, 0, 1, 1,
-0.4189036, 1.12479, 1.993492, 0, 0, 0, 1, 1,
-0.4176951, -0.8259216, -1.532027, 1, 1, 1, 1, 1,
-0.4175515, -0.8442146, -2.358642, 1, 1, 1, 1, 1,
-0.412274, -1.759781, -1.28138, 1, 1, 1, 1, 1,
-0.4121886, -0.7525668, -2.48067, 1, 1, 1, 1, 1,
-0.4102225, 0.6229565, -0.4631819, 1, 1, 1, 1, 1,
-0.4076805, -1.114739, -3.628273, 1, 1, 1, 1, 1,
-0.4063191, 1.824277, 0.1542301, 1, 1, 1, 1, 1,
-0.4042837, 0.7576503, -0.569774, 1, 1, 1, 1, 1,
-0.4041908, 0.8302371, -0.2757582, 1, 1, 1, 1, 1,
-0.402799, 0.1768029, -0.9218766, 1, 1, 1, 1, 1,
-0.4022901, 1.459644, -0.4546543, 1, 1, 1, 1, 1,
-0.4016504, -0.1271807, -3.147702, 1, 1, 1, 1, 1,
-0.3960523, 0.4789447, -0.2580032, 1, 1, 1, 1, 1,
-0.3917834, -0.4072552, -3.218364, 1, 1, 1, 1, 1,
-0.3879459, -0.5757353, -2.921482, 1, 1, 1, 1, 1,
-0.3761622, -0.4539727, -1.364952, 0, 0, 1, 1, 1,
-0.3746663, -0.3026394, -3.032819, 1, 0, 0, 1, 1,
-0.3743696, -0.2058369, -3.65782, 1, 0, 0, 1, 1,
-0.3737618, 1.863363, -1.654129, 1, 0, 0, 1, 1,
-0.3735045, 0.1869587, -2.259445, 1, 0, 0, 1, 1,
-0.3733495, -0.7738874, -2.991756, 1, 0, 0, 1, 1,
-0.3719656, -0.2466851, -3.720979, 0, 0, 0, 1, 1,
-0.3713482, 0.9628878, 0.848738, 0, 0, 0, 1, 1,
-0.3703691, -2.071537, -1.731105, 0, 0, 0, 1, 1,
-0.364322, 1.338617, 0.4463308, 0, 0, 0, 1, 1,
-0.3613597, 0.3626214, -1.473889, 0, 0, 0, 1, 1,
-0.3601652, -0.7200975, -1.802354, 0, 0, 0, 1, 1,
-0.3587452, 1.051858, 0.6384268, 0, 0, 0, 1, 1,
-0.3561137, -1.237671, -3.211303, 1, 1, 1, 1, 1,
-0.3510976, -0.1998593, -2.75922, 1, 1, 1, 1, 1,
-0.3467287, 0.06998029, -0.8654277, 1, 1, 1, 1, 1,
-0.3445259, 0.6156182, -0.6478783, 1, 1, 1, 1, 1,
-0.341937, 0.7427723, 0.453611, 1, 1, 1, 1, 1,
-0.3346056, 0.3868377, -0.2027578, 1, 1, 1, 1, 1,
-0.3345468, 0.4527819, -0.5204509, 1, 1, 1, 1, 1,
-0.3343858, -0.08198193, -0.501304, 1, 1, 1, 1, 1,
-0.3320371, 0.4387985, -0.09136675, 1, 1, 1, 1, 1,
-0.3275867, -0.5636199, -2.081607, 1, 1, 1, 1, 1,
-0.3265808, -1.138811, -3.341464, 1, 1, 1, 1, 1,
-0.3265666, -0.4972675, -3.21683, 1, 1, 1, 1, 1,
-0.3257912, -0.4219685, -1.727516, 1, 1, 1, 1, 1,
-0.3186496, -2.188314, -2.767093, 1, 1, 1, 1, 1,
-0.3183757, -1.571108, -3.985903, 1, 1, 1, 1, 1,
-0.3172779, 0.2015258, -2.134897, 0, 0, 1, 1, 1,
-0.3137189, -0.3347228, -4.406003, 1, 0, 0, 1, 1,
-0.3052967, -2.03953, -3.299026, 1, 0, 0, 1, 1,
-0.3028565, -0.6737176, -2.455009, 1, 0, 0, 1, 1,
-0.302273, 1.023893, -0.117171, 1, 0, 0, 1, 1,
-0.2942222, 1.083356, -0.7406067, 1, 0, 0, 1, 1,
-0.2920913, -0.2564834, -1.046696, 0, 0, 0, 1, 1,
-0.2915026, -0.06152425, -2.299299, 0, 0, 0, 1, 1,
-0.2905239, 2.372387, 0.06149678, 0, 0, 0, 1, 1,
-0.2887431, 0.4124522, -0.2142665, 0, 0, 0, 1, 1,
-0.286033, -0.8827881, -2.072372, 0, 0, 0, 1, 1,
-0.2852724, 0.2596618, 0.4144622, 0, 0, 0, 1, 1,
-0.2831995, 0.3067527, -1.940123, 0, 0, 0, 1, 1,
-0.2826934, -0.1237919, -2.419661, 1, 1, 1, 1, 1,
-0.281289, 0.610094, 0.8700672, 1, 1, 1, 1, 1,
-0.2782269, 0.02130397, -1.220361, 1, 1, 1, 1, 1,
-0.2733926, -0.4885144, -2.867169, 1, 1, 1, 1, 1,
-0.2719621, -0.3294057, -2.153661, 1, 1, 1, 1, 1,
-0.2719254, 1.03092, -0.08067827, 1, 1, 1, 1, 1,
-0.268597, -1.10228, -2.297189, 1, 1, 1, 1, 1,
-0.2681253, 0.9497047, 0.1612252, 1, 1, 1, 1, 1,
-0.2649019, 0.5663, -0.2711927, 1, 1, 1, 1, 1,
-0.2642951, 0.2510336, 0.6786157, 1, 1, 1, 1, 1,
-0.259298, -1.413361, -2.83279, 1, 1, 1, 1, 1,
-0.2591676, -1.295081, -2.351149, 1, 1, 1, 1, 1,
-0.2576235, 0.3956788, -0.3632752, 1, 1, 1, 1, 1,
-0.2521739, 0.1893678, -1.691365, 1, 1, 1, 1, 1,
-0.2500225, 0.660761, -1.996225, 1, 1, 1, 1, 1,
-0.2487706, -1.553864, -4.220823, 0, 0, 1, 1, 1,
-0.2440193, -0.01286986, -1.734794, 1, 0, 0, 1, 1,
-0.2432447, 1.969072, -0.7132087, 1, 0, 0, 1, 1,
-0.2424968, -0.3622677, -3.632491, 1, 0, 0, 1, 1,
-0.2398758, -1.774596, -3.938911, 1, 0, 0, 1, 1,
-0.2337563, 1.358017, 0.4797606, 1, 0, 0, 1, 1,
-0.2320783, 0.7692314, -0.247255, 0, 0, 0, 1, 1,
-0.2288467, -0.4590679, -0.8327915, 0, 0, 0, 1, 1,
-0.2271321, -0.8787239, -4.037034, 0, 0, 0, 1, 1,
-0.2237671, -0.5980175, -2.332308, 0, 0, 0, 1, 1,
-0.2187577, -0.7838181, -1.376437, 0, 0, 0, 1, 1,
-0.2183811, 0.4032548, -0.2675152, 0, 0, 0, 1, 1,
-0.2181116, -0.7841517, -2.49628, 0, 0, 0, 1, 1,
-0.2177941, 1.343909, 0.1551849, 1, 1, 1, 1, 1,
-0.2175075, 0.2790337, -2.160623, 1, 1, 1, 1, 1,
-0.2155761, -1.505609, -2.800592, 1, 1, 1, 1, 1,
-0.2144414, -1.148372, -2.455418, 1, 1, 1, 1, 1,
-0.213292, -2.625757, -2.710968, 1, 1, 1, 1, 1,
-0.21324, -0.1149763, -1.835925, 1, 1, 1, 1, 1,
-0.2130032, -0.003740742, -0.06476352, 1, 1, 1, 1, 1,
-0.2110746, 0.7493525, -0.6562381, 1, 1, 1, 1, 1,
-0.210473, -0.8566567, -4.33709, 1, 1, 1, 1, 1,
-0.2090566, 0.9097175, -0.4985529, 1, 1, 1, 1, 1,
-0.2073817, -0.8491809, -1.474435, 1, 1, 1, 1, 1,
-0.2057491, -0.08135001, -1.807477, 1, 1, 1, 1, 1,
-0.1990753, 1.155942, 0.06591325, 1, 1, 1, 1, 1,
-0.1987883, -0.2068777, -1.98757, 1, 1, 1, 1, 1,
-0.1953993, -2.016102, -3.618843, 1, 1, 1, 1, 1,
-0.1937938, 0.2359329, -1.718075, 0, 0, 1, 1, 1,
-0.1928559, 0.6710582, 0.225167, 1, 0, 0, 1, 1,
-0.1923327, -0.394568, -3.051416, 1, 0, 0, 1, 1,
-0.1807947, -1.151988, -2.224372, 1, 0, 0, 1, 1,
-0.1784595, 0.2414217, -1.183687, 1, 0, 0, 1, 1,
-0.1750788, -2.465073, -2.474844, 1, 0, 0, 1, 1,
-0.170017, -0.4947218, -3.383362, 0, 0, 0, 1, 1,
-0.1691804, 2.122502, -0.2072655, 0, 0, 0, 1, 1,
-0.1674015, -0.8451, -2.854274, 0, 0, 0, 1, 1,
-0.165863, -1.151106, -3.852739, 0, 0, 0, 1, 1,
-0.1615711, 0.9023199, -0.893637, 0, 0, 0, 1, 1,
-0.154059, -0.2646991, -0.8729171, 0, 0, 0, 1, 1,
-0.1528075, -0.8512477, -3.472953, 0, 0, 0, 1, 1,
-0.1527347, -0.2321212, -3.014402, 1, 1, 1, 1, 1,
-0.1483615, 0.3007563, -1.557488, 1, 1, 1, 1, 1,
-0.1474785, 1.626722, -0.5112919, 1, 1, 1, 1, 1,
-0.142592, 0.4065376, 0.3742017, 1, 1, 1, 1, 1,
-0.1412192, 0.6870802, -0.6379279, 1, 1, 1, 1, 1,
-0.1327383, -0.9353701, -3.53111, 1, 1, 1, 1, 1,
-0.131181, -1.114822, -1.852175, 1, 1, 1, 1, 1,
-0.127442, -0.8758621, -3.356575, 1, 1, 1, 1, 1,
-0.1240802, 1.397862, 2.012412, 1, 1, 1, 1, 1,
-0.1240148, -0.4774904, -2.01809, 1, 1, 1, 1, 1,
-0.1238806, -0.8843248, -3.251251, 1, 1, 1, 1, 1,
-0.1237052, 0.605471, -0.3347454, 1, 1, 1, 1, 1,
-0.1209131, -0.8743963, -2.22006, 1, 1, 1, 1, 1,
-0.1137525, -0.9899706, -3.730168, 1, 1, 1, 1, 1,
-0.1116524, -0.2579879, -2.208702, 1, 1, 1, 1, 1,
-0.1106696, 1.626192, 2.797765, 0, 0, 1, 1, 1,
-0.1076013, 0.3488345, -1.216121, 1, 0, 0, 1, 1,
-0.1008125, 1.609078, -0.8676828, 1, 0, 0, 1, 1,
-0.09708754, -0.249892, -1.663799, 1, 0, 0, 1, 1,
-0.09147035, -0.3682312, 0.2066034, 1, 0, 0, 1, 1,
-0.09066564, -0.3595541, -4.159733, 1, 0, 0, 1, 1,
-0.09038129, 0.01338566, -0.3353961, 0, 0, 0, 1, 1,
-0.08982163, 1.827286, 1.072545, 0, 0, 0, 1, 1,
-0.08151713, 0.7545996, -0.6255629, 0, 0, 0, 1, 1,
-0.07928881, 0.707471, 0.0489855, 0, 0, 0, 1, 1,
-0.07830434, -1.64346, -2.79808, 0, 0, 0, 1, 1,
-0.07734299, -0.7982528, -4.795733, 0, 0, 0, 1, 1,
-0.06665491, 1.394304, -0.3119219, 0, 0, 0, 1, 1,
-0.06546656, 0.272389, 0.6449203, 1, 1, 1, 1, 1,
-0.05482704, 0.9001707, 0.4155826, 1, 1, 1, 1, 1,
-0.05274745, 0.5375329, 1.012545, 1, 1, 1, 1, 1,
-0.05172583, 1.134544, -1.091668, 1, 1, 1, 1, 1,
-0.04958322, 0.9661416, -0.5187821, 1, 1, 1, 1, 1,
-0.04827647, -1.374657, -2.704157, 1, 1, 1, 1, 1,
-0.04023607, 1.296122, -0.5341423, 1, 1, 1, 1, 1,
-0.03486464, -0.2318492, -3.412932, 1, 1, 1, 1, 1,
-0.02570608, 0.9290589, 0.8485014, 1, 1, 1, 1, 1,
-0.02327509, -0.6038933, -2.928648, 1, 1, 1, 1, 1,
-0.02138039, 0.3989106, 2.093766, 1, 1, 1, 1, 1,
-0.02016657, 0.173425, -0.1070636, 1, 1, 1, 1, 1,
-0.01978154, 0.1766914, -0.5487347, 1, 1, 1, 1, 1,
-0.01953686, -1.093096, -3.006297, 1, 1, 1, 1, 1,
-0.01950872, 0.296497, -0.68484, 1, 1, 1, 1, 1,
-0.01778493, 0.03805301, 1.245824, 0, 0, 1, 1, 1,
-0.01720853, -0.663657, -3.00957, 1, 0, 0, 1, 1,
-0.01597032, -1.61907, -5.262814, 1, 0, 0, 1, 1,
-0.01477541, 1.304746, -1.381232, 1, 0, 0, 1, 1,
-0.01103778, -0.8038082, -2.998423, 1, 0, 0, 1, 1,
-0.001504653, 0.3299205, -1.000685, 1, 0, 0, 1, 1,
-0.0002859728, 0.9131932, 0.7798741, 0, 0, 0, 1, 1,
0.000136341, -1.058796, 2.665918, 0, 0, 0, 1, 1,
0.002767632, 0.07769988, -1.028529, 0, 0, 0, 1, 1,
0.006971662, -0.8689448, 3.668253, 0, 0, 0, 1, 1,
0.01218152, 0.6587677, 1.315543, 0, 0, 0, 1, 1,
0.01682998, -0.3445644, 3.141051, 0, 0, 0, 1, 1,
0.01695371, 0.2776547, -0.001087959, 0, 0, 0, 1, 1,
0.01799221, 2.235004, 1.655316, 1, 1, 1, 1, 1,
0.01968259, -1.036877, 3.05468, 1, 1, 1, 1, 1,
0.02205071, -0.6207762, 2.918057, 1, 1, 1, 1, 1,
0.02288245, 0.2381422, -1.682053, 1, 1, 1, 1, 1,
0.02321254, -0.3841845, 3.955697, 1, 1, 1, 1, 1,
0.02457142, -0.5979192, 0.9972734, 1, 1, 1, 1, 1,
0.02816525, 1.376156, -0.971365, 1, 1, 1, 1, 1,
0.02936981, 0.7471892, -1.326337, 1, 1, 1, 1, 1,
0.03411229, -0.3675123, 2.728755, 1, 1, 1, 1, 1,
0.03989027, 0.7797493, 0.7836701, 1, 1, 1, 1, 1,
0.03996069, -0.9786905, 1.623148, 1, 1, 1, 1, 1,
0.04148382, 0.2439161, 0.5178941, 1, 1, 1, 1, 1,
0.05188869, 2.362881, -0.3125472, 1, 1, 1, 1, 1,
0.05664749, -0.09980367, 2.634072, 1, 1, 1, 1, 1,
0.05986936, -0.1936575, 3.659013, 1, 1, 1, 1, 1,
0.06283008, -0.2523056, 2.581244, 0, 0, 1, 1, 1,
0.06327944, -1.243809, 3.212895, 1, 0, 0, 1, 1,
0.06696773, 1.926342, 0.796715, 1, 0, 0, 1, 1,
0.06815371, 0.7254313, 0.4955965, 1, 0, 0, 1, 1,
0.06922117, -0.06731787, 2.481375, 1, 0, 0, 1, 1,
0.07296821, 0.3230678, -1.421619, 1, 0, 0, 1, 1,
0.07632811, -0.6376086, 3.521719, 0, 0, 0, 1, 1,
0.07655212, -0.461442, 1.634506, 0, 0, 0, 1, 1,
0.08261965, 0.5123063, -0.2071672, 0, 0, 0, 1, 1,
0.08425843, -0.3784141, 1.814543, 0, 0, 0, 1, 1,
0.08555087, -0.4716895, 2.469414, 0, 0, 0, 1, 1,
0.08838987, -2.684064, 4.615082, 0, 0, 0, 1, 1,
0.08849919, 1.363831, -0.9021632, 0, 0, 0, 1, 1,
0.08901801, 1.131349, 0.9285507, 1, 1, 1, 1, 1,
0.08996935, 0.2450448, 0.8204053, 1, 1, 1, 1, 1,
0.09238818, 1.037156, 2.379497, 1, 1, 1, 1, 1,
0.09744345, -1.496463, 3.483552, 1, 1, 1, 1, 1,
0.09933719, -0.2211709, 2.476853, 1, 1, 1, 1, 1,
0.09942199, 1.408103, -1.439978, 1, 1, 1, 1, 1,
0.1028337, 0.4333189, 0.2386329, 1, 1, 1, 1, 1,
0.1043126, -0.6571568, 4.011782, 1, 1, 1, 1, 1,
0.1080278, -0.4284815, 0.773608, 1, 1, 1, 1, 1,
0.1082671, -1.141033, 2.5475, 1, 1, 1, 1, 1,
0.1099745, 1.857026, -1.118597, 1, 1, 1, 1, 1,
0.1145453, -0.05239229, 1.654795, 1, 1, 1, 1, 1,
0.1219609, -1.219787, 3.195718, 1, 1, 1, 1, 1,
0.1221119, 0.9421794, -0.5207568, 1, 1, 1, 1, 1,
0.1221296, -0.3187657, 3.267673, 1, 1, 1, 1, 1,
0.1245552, -1.377253, 6.590239, 0, 0, 1, 1, 1,
0.1260304, 0.3045751, 0.1602192, 1, 0, 0, 1, 1,
0.1274573, -0.9278399, 2.121163, 1, 0, 0, 1, 1,
0.133276, -0.238965, 3.037995, 1, 0, 0, 1, 1,
0.1389063, -0.3046352, 1.450598, 1, 0, 0, 1, 1,
0.1394816, 2.830354, 1.26043, 1, 0, 0, 1, 1,
0.1395766, 1.386597, -0.8070179, 0, 0, 0, 1, 1,
0.1396009, 0.5742949, -1.245575, 0, 0, 0, 1, 1,
0.1396758, 0.1367833, 1.783497, 0, 0, 0, 1, 1,
0.1403623, 0.3949156, -0.6424689, 0, 0, 0, 1, 1,
0.1460997, 1.510738, -0.2427384, 0, 0, 0, 1, 1,
0.1464418, -1.166312, 2.839505, 0, 0, 0, 1, 1,
0.1473553, 0.03082381, 2.455012, 0, 0, 0, 1, 1,
0.1533366, 1.77659, 0.6015529, 1, 1, 1, 1, 1,
0.1546777, -0.4835299, 2.477448, 1, 1, 1, 1, 1,
0.1559407, 0.8517151, 0.2454457, 1, 1, 1, 1, 1,
0.1565994, -0.6764231, 1.398187, 1, 1, 1, 1, 1,
0.1603043, -0.1357054, 3.003934, 1, 1, 1, 1, 1,
0.1625967, -0.3780827, 2.565258, 1, 1, 1, 1, 1,
0.1646708, 2.030736, -0.6301994, 1, 1, 1, 1, 1,
0.1658856, 0.4233252, -0.3492949, 1, 1, 1, 1, 1,
0.1663463, 0.3419838, 0.3459482, 1, 1, 1, 1, 1,
0.1674387, 0.150246, 1.395924, 1, 1, 1, 1, 1,
0.1696564, 0.05144693, 1.701082, 1, 1, 1, 1, 1,
0.1786982, 0.8628427, 0.8656237, 1, 1, 1, 1, 1,
0.179808, -0.7710226, 4.438201, 1, 1, 1, 1, 1,
0.1836126, 0.283723, 0.6045586, 1, 1, 1, 1, 1,
0.1850356, -0.08464237, 3.316682, 1, 1, 1, 1, 1,
0.1876484, -0.719983, 3.31272, 0, 0, 1, 1, 1,
0.1881412, -0.4354556, 1.433177, 1, 0, 0, 1, 1,
0.1900428, -0.1740294, 2.427642, 1, 0, 0, 1, 1,
0.1913171, -1.368285, 2.765309, 1, 0, 0, 1, 1,
0.1914034, -0.2131047, 2.730434, 1, 0, 0, 1, 1,
0.199094, 0.6880726, 0.6102324, 1, 0, 0, 1, 1,
0.2017855, 0.2637646, 0.2388939, 0, 0, 0, 1, 1,
0.2035478, 0.0556926, 2.477499, 0, 0, 0, 1, 1,
0.2081772, 0.7498662, -0.2166408, 0, 0, 0, 1, 1,
0.2099447, -0.9547992, 1.115707, 0, 0, 0, 1, 1,
0.210722, 0.2912769, -0.4508863, 0, 0, 0, 1, 1,
0.214877, 0.7121814, 0.329111, 0, 0, 0, 1, 1,
0.2198617, 0.8470836, 0.03332746, 0, 0, 0, 1, 1,
0.2201838, -0.305033, 2.189219, 1, 1, 1, 1, 1,
0.2210166, 0.6667218, -0.1861107, 1, 1, 1, 1, 1,
0.2232751, -0.8325712, 2.784904, 1, 1, 1, 1, 1,
0.227133, 0.9965909, 1.639172, 1, 1, 1, 1, 1,
0.230332, -0.7091636, 3.178783, 1, 1, 1, 1, 1,
0.2338937, 1.081679, 1.640785, 1, 1, 1, 1, 1,
0.2377427, 1.269702, 0.3394278, 1, 1, 1, 1, 1,
0.2394129, -0.9707825, 4.754294, 1, 1, 1, 1, 1,
0.2396379, -1.807447, 2.207741, 1, 1, 1, 1, 1,
0.2458634, 2.363143, -1.171933, 1, 1, 1, 1, 1,
0.2488142, 1.099319, -1.342782, 1, 1, 1, 1, 1,
0.2582515, 0.8865238, -2.156714, 1, 1, 1, 1, 1,
0.258792, 0.8894885, 1.415226, 1, 1, 1, 1, 1,
0.2596666, -1.316844, 2.793775, 1, 1, 1, 1, 1,
0.2606172, -0.3662345, 2.28253, 1, 1, 1, 1, 1,
0.2609465, -1.120106, 2.331306, 0, 0, 1, 1, 1,
0.2638775, -1.720404, 1.940062, 1, 0, 0, 1, 1,
0.2643234, 0.5748445, 0.2509794, 1, 0, 0, 1, 1,
0.2655014, -1.4515, 2.116098, 1, 0, 0, 1, 1,
0.2742265, -0.1733962, 1.313894, 1, 0, 0, 1, 1,
0.2784131, -0.6325091, 2.07565, 1, 0, 0, 1, 1,
0.2905547, 1.124905, -0.2250969, 0, 0, 0, 1, 1,
0.2932005, 0.6754788, -0.5336974, 0, 0, 0, 1, 1,
0.2958225, -0.09130388, 1.184474, 0, 0, 0, 1, 1,
0.2990921, -1.492882, 3.476452, 0, 0, 0, 1, 1,
0.3002751, -1.647691, 3.192525, 0, 0, 0, 1, 1,
0.3064369, -0.5846494, 1.756328, 0, 0, 0, 1, 1,
0.3091618, 0.1136604, -0.1702109, 0, 0, 0, 1, 1,
0.3115361, 0.3858054, 1.544795, 1, 1, 1, 1, 1,
0.3123911, 1.126674, 1.905201, 1, 1, 1, 1, 1,
0.3134982, -0.1221019, 2.469336, 1, 1, 1, 1, 1,
0.3189276, -0.5330027, 4.327251, 1, 1, 1, 1, 1,
0.3193445, 2.398125, 0.4501007, 1, 1, 1, 1, 1,
0.3204033, -0.6767499, 2.076829, 1, 1, 1, 1, 1,
0.3205623, 1.273174, 0.5457118, 1, 1, 1, 1, 1,
0.3358844, 0.292254, -1.77823, 1, 1, 1, 1, 1,
0.3377565, -0.7640789, 2.452165, 1, 1, 1, 1, 1,
0.3388982, 0.9571643, -0.3359287, 1, 1, 1, 1, 1,
0.3399004, 2.251282, -1.399674, 1, 1, 1, 1, 1,
0.3399458, 0.4607495, 0.6908739, 1, 1, 1, 1, 1,
0.3416346, 0.03861565, 3.444905, 1, 1, 1, 1, 1,
0.3443485, 1.854423, 0.7377132, 1, 1, 1, 1, 1,
0.3448161, -1.430627, 3.031012, 1, 1, 1, 1, 1,
0.3576095, -0.7004476, 1.31676, 0, 0, 1, 1, 1,
0.3583897, -0.6842452, 1.929267, 1, 0, 0, 1, 1,
0.3592068, -0.003278433, 2.036575, 1, 0, 0, 1, 1,
0.3599532, 0.7604913, 0.5985971, 1, 0, 0, 1, 1,
0.3633748, -0.9893358, 2.732445, 1, 0, 0, 1, 1,
0.3681218, 1.680827, -2.860769, 1, 0, 0, 1, 1,
0.3689348, -0.01348156, 2.40811, 0, 0, 0, 1, 1,
0.3723829, -1.027436, 2.807579, 0, 0, 0, 1, 1,
0.3734912, 2.105455, 0.3193128, 0, 0, 0, 1, 1,
0.3745989, 2.490875, 0.2853822, 0, 0, 0, 1, 1,
0.3746901, -0.5017044, 2.739678, 0, 0, 0, 1, 1,
0.3812309, -2.12727, 3.483631, 0, 0, 0, 1, 1,
0.3857033, 0.05321789, 1.665555, 0, 0, 0, 1, 1,
0.3857723, 0.09169202, 2.102053, 1, 1, 1, 1, 1,
0.3892672, 0.3513082, -0.09477099, 1, 1, 1, 1, 1,
0.3909396, -0.4940415, 2.330027, 1, 1, 1, 1, 1,
0.3952881, -0.04678007, 2.020941, 1, 1, 1, 1, 1,
0.4017913, 0.5576793, -0.2261134, 1, 1, 1, 1, 1,
0.4057286, -0.7051491, 2.968543, 1, 1, 1, 1, 1,
0.4119462, 1.849771, 0.7977753, 1, 1, 1, 1, 1,
0.4120319, -1.100233, 3.154933, 1, 1, 1, 1, 1,
0.4122553, 0.5087411, 0.3253199, 1, 1, 1, 1, 1,
0.4137385, -0.04472545, 1.829589, 1, 1, 1, 1, 1,
0.4185076, 1.314521, 1.081238, 1, 1, 1, 1, 1,
0.4224026, -0.9443068, 1.363914, 1, 1, 1, 1, 1,
0.4248202, -1.820445, 2.764084, 1, 1, 1, 1, 1,
0.435534, -0.8382827, 3.05554, 1, 1, 1, 1, 1,
0.4357134, 1.144009, -0.3582772, 1, 1, 1, 1, 1,
0.4360735, 0.5055341, 0.378821, 0, 0, 1, 1, 1,
0.4382098, 1.785679, -1.449419, 1, 0, 0, 1, 1,
0.4429915, -0.7526225, 2.767852, 1, 0, 0, 1, 1,
0.4436162, -1.156084, 1.347735, 1, 0, 0, 1, 1,
0.4464344, 1.295468, 1.121065, 1, 0, 0, 1, 1,
0.4494348, 0.753253, 0.2354953, 1, 0, 0, 1, 1,
0.454092, 0.8947957, -0.2810249, 0, 0, 0, 1, 1,
0.4556422, 1.089913, 1.004585, 0, 0, 0, 1, 1,
0.460091, -1.120657, 2.32891, 0, 0, 0, 1, 1,
0.4618964, -1.370613, 3.512743, 0, 0, 0, 1, 1,
0.4684263, -2.332915, 3.319464, 0, 0, 0, 1, 1,
0.4694249, 0.1379374, 1.389204, 0, 0, 0, 1, 1,
0.4749789, -0.8072867, 3.079964, 0, 0, 0, 1, 1,
0.476153, -0.8327475, 2.517687, 1, 1, 1, 1, 1,
0.4775551, 1.78905, -2.266168, 1, 1, 1, 1, 1,
0.4821163, 1.267219, 0.3882826, 1, 1, 1, 1, 1,
0.4828412, 1.769373, -2.310377, 1, 1, 1, 1, 1,
0.484476, 1.633608, 0.01799473, 1, 1, 1, 1, 1,
0.4860308, 0.134441, 2.550829, 1, 1, 1, 1, 1,
0.4879004, 0.9240316, 1.726604, 1, 1, 1, 1, 1,
0.4928696, 0.9317678, 0.7530866, 1, 1, 1, 1, 1,
0.4933774, -0.3626752, 2.154661, 1, 1, 1, 1, 1,
0.4956962, 1.471784, -0.7374788, 1, 1, 1, 1, 1,
0.5034412, 0.5865557, -1.204896, 1, 1, 1, 1, 1,
0.5044304, -1.011945, 2.725505, 1, 1, 1, 1, 1,
0.5052494, 1.110551, 0.2073135, 1, 1, 1, 1, 1,
0.5180558, 0.942957, 3.427177, 1, 1, 1, 1, 1,
0.5208655, -0.7897599, 1.832178, 1, 1, 1, 1, 1,
0.5215222, -0.3589707, 3.525189, 0, 0, 1, 1, 1,
0.5251331, 0.656001, -0.07888328, 1, 0, 0, 1, 1,
0.5254943, 0.1305521, 1.435812, 1, 0, 0, 1, 1,
0.5296972, -0.5148644, 1.604826, 1, 0, 0, 1, 1,
0.5318614, 1.43532, 0.4695338, 1, 0, 0, 1, 1,
0.5325006, -0.07464922, 4.021719, 1, 0, 0, 1, 1,
0.5364471, 0.9707134, 0.4878451, 0, 0, 0, 1, 1,
0.537172, 0.7331411, -0.3399705, 0, 0, 0, 1, 1,
0.5404006, 0.6730289, -0.3698707, 0, 0, 0, 1, 1,
0.5432487, -0.386139, 3.379029, 0, 0, 0, 1, 1,
0.545152, -2.424789, 4.396721, 0, 0, 0, 1, 1,
0.5508942, -1.066352, 3.88636, 0, 0, 0, 1, 1,
0.5533237, -0.7455224, 2.817738, 0, 0, 0, 1, 1,
0.5559211, 0.1563979, 1.721878, 1, 1, 1, 1, 1,
0.5607082, 0.5989786, -0.1264547, 1, 1, 1, 1, 1,
0.5634334, 0.1913413, 2.184078, 1, 1, 1, 1, 1,
0.5643818, 1.767359, 0.7374392, 1, 1, 1, 1, 1,
0.5669667, -1.054108, 2.167208, 1, 1, 1, 1, 1,
0.5674805, 0.1242366, 0.9979794, 1, 1, 1, 1, 1,
0.5679778, 1.070858, 1.349263, 1, 1, 1, 1, 1,
0.5685604, 0.03431351, 1.088353, 1, 1, 1, 1, 1,
0.5706137, -0.606754, 1.355193, 1, 1, 1, 1, 1,
0.5709252, 1.916306, 0.2723033, 1, 1, 1, 1, 1,
0.5742989, -1.033884, 1.653931, 1, 1, 1, 1, 1,
0.5770167, -0.411188, 1.502943, 1, 1, 1, 1, 1,
0.5843011, 0.5192733, -0.5731243, 1, 1, 1, 1, 1,
0.5979727, 0.331581, 2.079526, 1, 1, 1, 1, 1,
0.5980561, 0.5005922, 1.44604, 1, 1, 1, 1, 1,
0.5982332, 0.6133178, 1.550462, 0, 0, 1, 1, 1,
0.605525, 1.878372, -1.486957, 1, 0, 0, 1, 1,
0.608094, 1.5635, -0.6632658, 1, 0, 0, 1, 1,
0.6083584, 0.8690302, 0.7719681, 1, 0, 0, 1, 1,
0.6085785, -0.2008627, 1.427031, 1, 0, 0, 1, 1,
0.6141464, 0.484082, 0.551342, 1, 0, 0, 1, 1,
0.6141872, -0.05286711, 2.379779, 0, 0, 0, 1, 1,
0.6143023, -1.613724, 2.366704, 0, 0, 0, 1, 1,
0.6170511, 1.507521, 0.4325933, 0, 0, 0, 1, 1,
0.6221786, -1.067379, 3.980343, 0, 0, 0, 1, 1,
0.6225223, 0.8217847, 0.964162, 0, 0, 0, 1, 1,
0.6265547, -2.540017, 0.9103749, 0, 0, 0, 1, 1,
0.633172, -1.346146, 2.878664, 0, 0, 0, 1, 1,
0.6339291, -0.184664, 2.497657, 1, 1, 1, 1, 1,
0.6357288, 0.8652995, -0.1650247, 1, 1, 1, 1, 1,
0.6367086, -2.925858, 1.684333, 1, 1, 1, 1, 1,
0.639469, -1.149039, 1.775663, 1, 1, 1, 1, 1,
0.6464608, -0.08191065, 1.675633, 1, 1, 1, 1, 1,
0.6522269, -0.03353625, 0.1636067, 1, 1, 1, 1, 1,
0.6543209, 1.711953, 0.1322661, 1, 1, 1, 1, 1,
0.6562299, 0.7094182, 0.2420529, 1, 1, 1, 1, 1,
0.6567407, 0.499359, 1.119084, 1, 1, 1, 1, 1,
0.6603677, -1.813903, 2.411051, 1, 1, 1, 1, 1,
0.6672844, -0.1951575, 0.343609, 1, 1, 1, 1, 1,
0.6690912, -0.5746147, 2.771059, 1, 1, 1, 1, 1,
0.6717656, 0.6664346, 1.176166, 1, 1, 1, 1, 1,
0.6737434, -0.4609092, 1.107967, 1, 1, 1, 1, 1,
0.6742452, 1.199442, 1.644222, 1, 1, 1, 1, 1,
0.6901693, 1.193121, 0.3975852, 0, 0, 1, 1, 1,
0.6903471, 0.2000358, 0.8745317, 1, 0, 0, 1, 1,
0.6939824, 0.357159, 0.02356664, 1, 0, 0, 1, 1,
0.694321, -1.09509, 2.462, 1, 0, 0, 1, 1,
0.6998475, -0.302166, 1.875192, 1, 0, 0, 1, 1,
0.7065403, -0.1008517, 3.550758, 1, 0, 0, 1, 1,
0.7118225, 0.6556722, -0.231501, 0, 0, 0, 1, 1,
0.7121726, 0.04143335, 1.91969, 0, 0, 0, 1, 1,
0.7185869, 1.090129, 1.294901, 0, 0, 0, 1, 1,
0.7186597, -0.7705103, 1.729983, 0, 0, 0, 1, 1,
0.7249575, 0.4398297, 2.278598, 0, 0, 0, 1, 1,
0.7279449, -1.555667, 3.544405, 0, 0, 0, 1, 1,
0.7311833, -0.7478147, 0.7289554, 0, 0, 0, 1, 1,
0.731365, -1.202594, 2.844164, 1, 1, 1, 1, 1,
0.7327359, 0.1843867, 0.8037403, 1, 1, 1, 1, 1,
0.7534616, -0.1042648, 0.6421112, 1, 1, 1, 1, 1,
0.7565529, 0.5546252, 3.707779, 1, 1, 1, 1, 1,
0.7568161, 1.341222, -0.2667801, 1, 1, 1, 1, 1,
0.7591363, 0.4365696, 1.649189, 1, 1, 1, 1, 1,
0.7634426, -0.2812674, 2.151788, 1, 1, 1, 1, 1,
0.7636808, -1.137843, 2.893802, 1, 1, 1, 1, 1,
0.7683387, -1.626131, 3.782146, 1, 1, 1, 1, 1,
0.7789918, -0.2072776, 2.298786, 1, 1, 1, 1, 1,
0.7813241, -2.024441, 4.185929, 1, 1, 1, 1, 1,
0.7963871, -0.1094424, 2.630163, 1, 1, 1, 1, 1,
0.7973087, 0.2259045, -0.3521073, 1, 1, 1, 1, 1,
0.7977433, 0.01016242, 3.056389, 1, 1, 1, 1, 1,
0.7998098, -0.3758267, 1.263675, 1, 1, 1, 1, 1,
0.8102671, -0.2246849, 1.507834, 0, 0, 1, 1, 1,
0.8134002, -1.677909, 2.062315, 1, 0, 0, 1, 1,
0.8139004, -0.2339012, 1.770272, 1, 0, 0, 1, 1,
0.8219784, -0.3806991, 3.233638, 1, 0, 0, 1, 1,
0.826941, 1.185484, 1.262733, 1, 0, 0, 1, 1,
0.8311744, -0.3483619, 0.4868405, 1, 0, 0, 1, 1,
0.8323311, -0.0003073752, 1.550395, 0, 0, 0, 1, 1,
0.8325065, 0.5230137, 0.5879606, 0, 0, 0, 1, 1,
0.8348867, 1.430163, 0.4437454, 0, 0, 0, 1, 1,
0.8406518, -0.4572006, 2.098299, 0, 0, 0, 1, 1,
0.8409005, -0.229498, 2.587404, 0, 0, 0, 1, 1,
0.8451549, -0.6802068, 2.970396, 0, 0, 0, 1, 1,
0.8452782, -0.8661352, 1.91034, 0, 0, 0, 1, 1,
0.8507143, 0.2700241, 0.561281, 1, 1, 1, 1, 1,
0.8576097, 0.920108, 1.925412, 1, 1, 1, 1, 1,
0.8580295, -0.07743879, 2.122816, 1, 1, 1, 1, 1,
0.8748606, -0.239995, 1.830006, 1, 1, 1, 1, 1,
0.8774248, -1.316485, 1.968383, 1, 1, 1, 1, 1,
0.8803195, 0.8850296, -0.5809655, 1, 1, 1, 1, 1,
0.8833374, 0.1766685, 2.807271, 1, 1, 1, 1, 1,
0.8886147, -0.05430321, 2.781463, 1, 1, 1, 1, 1,
0.8942631, 0.6736386, 0.3093428, 1, 1, 1, 1, 1,
0.8966336, -1.584942, 2.242235, 1, 1, 1, 1, 1,
0.9012681, -2.74484, 2.687154, 1, 1, 1, 1, 1,
0.9086285, -0.1260673, 1.250572, 1, 1, 1, 1, 1,
0.9130043, -0.3821863, 2.816572, 1, 1, 1, 1, 1,
0.9157284, 0.5865167, 1.816581, 1, 1, 1, 1, 1,
0.9293749, 0.6823507, 0.7368191, 1, 1, 1, 1, 1,
0.9336506, 0.6697799, 1.128707, 0, 0, 1, 1, 1,
0.9360219, 1.365814, 1.416979, 1, 0, 0, 1, 1,
0.9407781, 0.8981968, 1.029389, 1, 0, 0, 1, 1,
0.945377, 0.6526255, 0.004949302, 1, 0, 0, 1, 1,
0.9474186, 0.1796388, 0.4665692, 1, 0, 0, 1, 1,
0.9495078, -0.2172535, 0.5954599, 1, 0, 0, 1, 1,
0.9505507, 1.124342, 0.8778387, 0, 0, 0, 1, 1,
0.9582236, -1.225284, 2.119898, 0, 0, 0, 1, 1,
0.9676378, 0.5968108, 1.289846, 0, 0, 0, 1, 1,
0.9705474, 0.04669225, 1.549411, 0, 0, 0, 1, 1,
0.9740242, 1.068847, 1.276779, 0, 0, 0, 1, 1,
0.9760593, 0.7302738, 0.08893235, 0, 0, 0, 1, 1,
0.9797437, 2.408769, -1.09981, 0, 0, 0, 1, 1,
0.9802455, 0.3087455, 2.252519, 1, 1, 1, 1, 1,
0.9805695, 0.3144049, 0.5541722, 1, 1, 1, 1, 1,
0.9912244, -0.1489315, 3.373024, 1, 1, 1, 1, 1,
0.9967695, -0.6464705, 3.348312, 1, 1, 1, 1, 1,
0.9967877, -1.579725, 3.243518, 1, 1, 1, 1, 1,
1.001531, -0.9702775, 3.362772, 1, 1, 1, 1, 1,
1.002949, 1.453453, -0.5285794, 1, 1, 1, 1, 1,
1.005967, -0.7045223, 1.980248, 1, 1, 1, 1, 1,
1.008257, 1.094147, 1.603176, 1, 1, 1, 1, 1,
1.009419, 0.9018213, 1.033509, 1, 1, 1, 1, 1,
1.013684, 0.3901699, 1.80109, 1, 1, 1, 1, 1,
1.019484, -0.9325753, 2.11568, 1, 1, 1, 1, 1,
1.019697, 0.1536167, 1.831768, 1, 1, 1, 1, 1,
1.032869, -0.9044254, 2.202568, 1, 1, 1, 1, 1,
1.037787, 1.290895, -0.8369989, 1, 1, 1, 1, 1,
1.039483, 0.231231, 1.630548, 0, 0, 1, 1, 1,
1.041772, 0.4159615, 2.033469, 1, 0, 0, 1, 1,
1.042729, 0.9310634, 0.3291878, 1, 0, 0, 1, 1,
1.043575, 0.7409155, 2.246763, 1, 0, 0, 1, 1,
1.043618, -0.4479094, 1.688406, 1, 0, 0, 1, 1,
1.044568, -0.4398278, 1.472434, 1, 0, 0, 1, 1,
1.051176, -1.490864, 3.540694, 0, 0, 0, 1, 1,
1.055006, -0.01528048, 0.9155932, 0, 0, 0, 1, 1,
1.068428, 1.206283, -0.2889732, 0, 0, 0, 1, 1,
1.074004, 1.856492, -0.2833758, 0, 0, 0, 1, 1,
1.07869, 0.1130538, 0.8730512, 0, 0, 0, 1, 1,
1.084703, 0.3974472, 0.9831383, 0, 0, 0, 1, 1,
1.086899, -1.11897, 2.326955, 0, 0, 0, 1, 1,
1.091584, -1.799098, 3.123135, 1, 1, 1, 1, 1,
1.095598, -1.392825, 1.297918, 1, 1, 1, 1, 1,
1.097179, 0.2726143, -0.01508191, 1, 1, 1, 1, 1,
1.105143, 0.7211913, 0.7237635, 1, 1, 1, 1, 1,
1.106952, -0.1895692, 3.913177, 1, 1, 1, 1, 1,
1.107219, 1.021666, 1.09083, 1, 1, 1, 1, 1,
1.108081, -0.1450062, 2.745628, 1, 1, 1, 1, 1,
1.109141, 0.05771668, 1.578739, 1, 1, 1, 1, 1,
1.111584, -0.5264472, 2.657002, 1, 1, 1, 1, 1,
1.121623, -1.17082, 1.048156, 1, 1, 1, 1, 1,
1.125582, -0.6155378, 1.072868, 1, 1, 1, 1, 1,
1.127464, 0.5686359, 2.518816, 1, 1, 1, 1, 1,
1.134972, -0.3596186, 3.335771, 1, 1, 1, 1, 1,
1.136599, -0.3624465, 2.382607, 1, 1, 1, 1, 1,
1.147951, -0.4171775, 2.10017, 1, 1, 1, 1, 1,
1.154537, 0.5600392, 0.1901994, 0, 0, 1, 1, 1,
1.163867, 0.1898293, 1.654612, 1, 0, 0, 1, 1,
1.171981, 0.4182498, 1.231221, 1, 0, 0, 1, 1,
1.182566, 0.4270642, 1.165186, 1, 0, 0, 1, 1,
1.184212, -0.1861284, 2.787369, 1, 0, 0, 1, 1,
1.187486, 0.9346309, 0.8740608, 1, 0, 0, 1, 1,
1.189621, -0.7812947, 3.009518, 0, 0, 0, 1, 1,
1.19759, -0.03332552, 1.178602, 0, 0, 0, 1, 1,
1.198985, -0.964749, 2.664736, 0, 0, 0, 1, 1,
1.202359, 1.294067, 0.5214394, 0, 0, 0, 1, 1,
1.214356, 0.5584646, 0.4127422, 0, 0, 0, 1, 1,
1.215421, 0.8981193, 0.7848848, 0, 0, 0, 1, 1,
1.222158, -0.2881658, 2.117884, 0, 0, 0, 1, 1,
1.224599, -0.7774083, 1.451897, 1, 1, 1, 1, 1,
1.23735, 0.5076713, 1.885621, 1, 1, 1, 1, 1,
1.241223, -1.51156, 2.278735, 1, 1, 1, 1, 1,
1.252184, 0.8726138, 1.732836, 1, 1, 1, 1, 1,
1.254518, -0.5068358, 1.765958, 1, 1, 1, 1, 1,
1.265886, 1.259728, 1.804764, 1, 1, 1, 1, 1,
1.26853, 0.4608737, 2.087824, 1, 1, 1, 1, 1,
1.269361, 0.06883486, 2.544566, 1, 1, 1, 1, 1,
1.285387, -0.5352154, 0.7499326, 1, 1, 1, 1, 1,
1.286428, -0.09854682, 1.578186, 1, 1, 1, 1, 1,
1.291056, -0.4682803, 1.318076, 1, 1, 1, 1, 1,
1.294095, 0.2152748, 1.878221, 1, 1, 1, 1, 1,
1.295168, 1.077727, 1.075046, 1, 1, 1, 1, 1,
1.300689, 0.04264024, 1.850676, 1, 1, 1, 1, 1,
1.302551, 0.3686599, 0.07835951, 1, 1, 1, 1, 1,
1.304039, 1.20964, 1.476643, 0, 0, 1, 1, 1,
1.306252, 0.1060234, 0.8563223, 1, 0, 0, 1, 1,
1.309111, 0.5392495, 1.709701, 1, 0, 0, 1, 1,
1.325514, -0.8108605, 2.761042, 1, 0, 0, 1, 1,
1.327031, 1.241341, 1.14061, 1, 0, 0, 1, 1,
1.327294, -0.8555444, 3.222444, 1, 0, 0, 1, 1,
1.345291, -0.201933, 0.8221573, 0, 0, 0, 1, 1,
1.352216, -0.8526382, 2.179179, 0, 0, 0, 1, 1,
1.359546, -0.1365012, 1.115373, 0, 0, 0, 1, 1,
1.3837, -0.7466002, 1.085413, 0, 0, 0, 1, 1,
1.390549, -0.2663368, 3.334458, 0, 0, 0, 1, 1,
1.401239, -1.113673, 0.7372964, 0, 0, 0, 1, 1,
1.405332, 0.05475305, 0.822094, 0, 0, 0, 1, 1,
1.412311, -1.163411, 3.129067, 1, 1, 1, 1, 1,
1.412588, -0.3058032, 1.972454, 1, 1, 1, 1, 1,
1.413695, 0.3394198, 2.033989, 1, 1, 1, 1, 1,
1.419044, -1.002494, 1.438628, 1, 1, 1, 1, 1,
1.420857, 1.048097, 1.456116, 1, 1, 1, 1, 1,
1.443076, 1.825203, 0.7532302, 1, 1, 1, 1, 1,
1.445174, -0.4873012, 1.663665, 1, 1, 1, 1, 1,
1.451863, -0.5203181, 0.5554442, 1, 1, 1, 1, 1,
1.452221, 0.8539225, 1.686008, 1, 1, 1, 1, 1,
1.476664, 0.4811925, 1.322604, 1, 1, 1, 1, 1,
1.485885, 0.4401744, 1.161799, 1, 1, 1, 1, 1,
1.491694, 1.107376, -1.281865, 1, 1, 1, 1, 1,
1.508428, -0.5849248, 3.477561, 1, 1, 1, 1, 1,
1.514683, 0.2470957, 1.888633, 1, 1, 1, 1, 1,
1.525107, 0.8883111, 0.746131, 1, 1, 1, 1, 1,
1.527218, -1.530247, 4.445651, 0, 0, 1, 1, 1,
1.529436, -1.157197, 2.804098, 1, 0, 0, 1, 1,
1.537385, 0.7536136, 0.4580303, 1, 0, 0, 1, 1,
1.540453, 1.310491, 0.1173424, 1, 0, 0, 1, 1,
1.541179, 1.134387, 0.4976976, 1, 0, 0, 1, 1,
1.549204, 0.432629, 1.333298, 1, 0, 0, 1, 1,
1.558101, 1.058024, 0.05227416, 0, 0, 0, 1, 1,
1.571732, -0.367808, 1.952368, 0, 0, 0, 1, 1,
1.578568, 0.8709493, 0.544769, 0, 0, 0, 1, 1,
1.57864, -0.8565106, 1.430586, 0, 0, 0, 1, 1,
1.580814, -0.2405319, -0.01222421, 0, 0, 0, 1, 1,
1.585359, -0.6541187, 0.6889183, 0, 0, 0, 1, 1,
1.604098, -0.9390789, 2.321074, 0, 0, 0, 1, 1,
1.610735, -0.03777268, 1.914667, 1, 1, 1, 1, 1,
1.614999, -0.005610955, 1.761515, 1, 1, 1, 1, 1,
1.629714, -1.738253, 0.2115597, 1, 1, 1, 1, 1,
1.632756, 1.132707, 0.3289191, 1, 1, 1, 1, 1,
1.64362, -2.393828, 4.099394, 1, 1, 1, 1, 1,
1.664754, -0.3833539, 3.164043, 1, 1, 1, 1, 1,
1.675609, 1.667486, 1.274916, 1, 1, 1, 1, 1,
1.682699, -0.01262142, 0.9794118, 1, 1, 1, 1, 1,
1.693123, 0.1363017, 2.365236, 1, 1, 1, 1, 1,
1.718288, -1.764395, 2.001162, 1, 1, 1, 1, 1,
1.719332, -0.1119582, 2.255413, 1, 1, 1, 1, 1,
1.730877, -0.05148138, 0.6953391, 1, 1, 1, 1, 1,
1.734597, 1.550132, 0.5737845, 1, 1, 1, 1, 1,
1.739541, 0.5805997, 1.072599, 1, 1, 1, 1, 1,
1.752831, -1.844332, 1.569181, 1, 1, 1, 1, 1,
1.771047, -0.2767972, 0.9622387, 0, 0, 1, 1, 1,
1.786274, -0.5859127, 0.4770986, 1, 0, 0, 1, 1,
1.789266, -0.4875086, 2.531545, 1, 0, 0, 1, 1,
1.800294, -1.549254, 2.479233, 1, 0, 0, 1, 1,
1.809965, -0.7391161, 0.599087, 1, 0, 0, 1, 1,
1.814739, -0.3188988, 1.767611, 1, 0, 0, 1, 1,
1.816053, -0.03176197, 1.615359, 0, 0, 0, 1, 1,
1.827323, 0.1685222, 2.242813, 0, 0, 0, 1, 1,
1.851439, -1.776612, 2.813733, 0, 0, 0, 1, 1,
1.874904, 1.661315, 2.173617, 0, 0, 0, 1, 1,
1.876386, -0.6607024, 2.428092, 0, 0, 0, 1, 1,
1.877855, 0.2772422, 1.386645, 0, 0, 0, 1, 1,
1.88041, 0.5437761, 3.094205, 0, 0, 0, 1, 1,
1.882889, -1.209336, 3.445352, 1, 1, 1, 1, 1,
1.889994, -1.242346, 2.368847, 1, 1, 1, 1, 1,
1.894733, 0.9727291, -0.1587098, 1, 1, 1, 1, 1,
1.93818, 0.00102142, 1.618821, 1, 1, 1, 1, 1,
1.947219, 0.5489647, 0.351098, 1, 1, 1, 1, 1,
1.956444, 0.5138988, 1.113093, 1, 1, 1, 1, 1,
1.964684, -0.2942884, 3.022547, 1, 1, 1, 1, 1,
1.9692, 1.263182, 0.8708942, 1, 1, 1, 1, 1,
2.022983, -0.5501458, 2.839948, 1, 1, 1, 1, 1,
2.031698, -0.6823257, 1.90225, 1, 1, 1, 1, 1,
2.049011, 0.6341919, 1.242381, 1, 1, 1, 1, 1,
2.053116, 0.2138084, -0.130222, 1, 1, 1, 1, 1,
2.05504, -1.021997, 1.86158, 1, 1, 1, 1, 1,
2.056265, 1.178601, 0.2799363, 1, 1, 1, 1, 1,
2.076882, 0.421231, 1.676915, 1, 1, 1, 1, 1,
2.077342, 0.2338471, 1.659996, 0, 0, 1, 1, 1,
2.08835, 0.6304637, 1.54821, 1, 0, 0, 1, 1,
2.116224, 0.9235688, -0.5381382, 1, 0, 0, 1, 1,
2.121941, -0.9061145, 2.017214, 1, 0, 0, 1, 1,
2.150119, 0.4491781, -0.3126503, 1, 0, 0, 1, 1,
2.180831, -0.7815731, 2.170604, 1, 0, 0, 1, 1,
2.184857, 0.2573116, 1.73171, 0, 0, 0, 1, 1,
2.200752, -0.7431776, 1.423888, 0, 0, 0, 1, 1,
2.225083, 1.182554, -0.1166739, 0, 0, 0, 1, 1,
2.239551, 0.1682266, 0.5679157, 0, 0, 0, 1, 1,
2.339217, -0.9683365, 0.5391602, 0, 0, 0, 1, 1,
2.418855, -0.1039144, 2.582765, 0, 0, 0, 1, 1,
2.454391, 1.277519, -0.03781071, 0, 0, 0, 1, 1,
2.550667, -0.9683304, 2.039546, 1, 1, 1, 1, 1,
2.565207, -1.797668, 3.682277, 1, 1, 1, 1, 1,
2.567852, -0.4925666, 0.7694111, 1, 1, 1, 1, 1,
2.585919, -0.4632635, 2.238971, 1, 1, 1, 1, 1,
2.59404, 0.1910479, 1.603477, 1, 1, 1, 1, 1,
2.672778, 1.867837, 0.4424116, 1, 1, 1, 1, 1,
2.833782, 0.7353346, -0.6713735, 1, 1, 1, 1, 1
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
var radius = 9.837762;
var distance = 34.55472;
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
mvMatrix.translate( 0.07951021, 0.2554916, -0.6637125 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.55472);
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
