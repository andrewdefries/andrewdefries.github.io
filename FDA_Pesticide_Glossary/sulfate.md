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
-3.892004, 1.334075, -1.156281, 1, 0, 0, 1,
-2.896047, -1.113093, -0.9370534, 1, 0.007843138, 0, 1,
-2.876613, -0.7458544, -2.04304, 1, 0.01176471, 0, 1,
-2.81178, -1.158784, -2.164723, 1, 0.01960784, 0, 1,
-2.809933, 0.03801192, -0.9607624, 1, 0.02352941, 0, 1,
-2.805423, 2.484641, -0.3085399, 1, 0.03137255, 0, 1,
-2.688111, 1.700597, -0.06362534, 1, 0.03529412, 0, 1,
-2.613115, -0.4120249, -2.503278, 1, 0.04313726, 0, 1,
-2.578816, -1.732578, -2.167024, 1, 0.04705882, 0, 1,
-2.47851, -0.3155719, -0.8373247, 1, 0.05490196, 0, 1,
-2.461333, 0.5227889, -1.287549, 1, 0.05882353, 0, 1,
-2.391162, -0.2438787, -3.235934, 1, 0.06666667, 0, 1,
-2.369344, 2.867194, -1.070137, 1, 0.07058824, 0, 1,
-2.256945, 0.5779362, -1.737981, 1, 0.07843138, 0, 1,
-2.239442, 0.3556751, -0.462809, 1, 0.08235294, 0, 1,
-2.237565, -0.3717631, -0.9900729, 1, 0.09019608, 0, 1,
-2.232128, 0.2187751, -1.00088, 1, 0.09411765, 0, 1,
-2.229439, -0.7153974, -2.270907, 1, 0.1019608, 0, 1,
-2.174811, 0.5854676, -1.344365, 1, 0.1098039, 0, 1,
-2.120489, 0.8533028, -1.988108, 1, 0.1137255, 0, 1,
-2.053125, 0.09081977, -0.6433974, 1, 0.1215686, 0, 1,
-2.053035, -0.07789036, -1.914692, 1, 0.1254902, 0, 1,
-2.043273, -1.086379, -1.559098, 1, 0.1333333, 0, 1,
-2.042105, 0.702723, 0.1101702, 1, 0.1372549, 0, 1,
-1.986193, -0.1925251, -1.56168, 1, 0.145098, 0, 1,
-1.985659, -1.69219, -1.117242, 1, 0.1490196, 0, 1,
-1.972536, 0.05557994, -3.024301, 1, 0.1568628, 0, 1,
-1.967995, -1.754367, -2.361105, 1, 0.1607843, 0, 1,
-1.948034, 1.162976, 0.655013, 1, 0.1686275, 0, 1,
-1.946294, 0.1736682, -0.6301204, 1, 0.172549, 0, 1,
-1.893275, 1.685801, 0.2923769, 1, 0.1803922, 0, 1,
-1.869355, -0.5029499, -2.246696, 1, 0.1843137, 0, 1,
-1.86775, -1.120524, -3.495274, 1, 0.1921569, 0, 1,
-1.855533, -0.06153788, -2.531002, 1, 0.1960784, 0, 1,
-1.845265, 0.01456758, -2.274353, 1, 0.2039216, 0, 1,
-1.801065, -0.1825791, 0.1924437, 1, 0.2117647, 0, 1,
-1.787814, -0.8900267, -0.5661722, 1, 0.2156863, 0, 1,
-1.761304, -1.391207, -1.192008, 1, 0.2235294, 0, 1,
-1.742478, -1.268947, -1.751215, 1, 0.227451, 0, 1,
-1.71812, 2.60788, -0.06511333, 1, 0.2352941, 0, 1,
-1.705574, -0.8789368, -2.370112, 1, 0.2392157, 0, 1,
-1.68372, -0.8503247, -1.463696, 1, 0.2470588, 0, 1,
-1.673621, -0.2655451, -0.9838817, 1, 0.2509804, 0, 1,
-1.673017, 0.1507035, -0.3582483, 1, 0.2588235, 0, 1,
-1.671748, -0.621551, -3.100284, 1, 0.2627451, 0, 1,
-1.665965, 0.4715995, -0.5315675, 1, 0.2705882, 0, 1,
-1.647302, -0.2400816, -1.454743, 1, 0.2745098, 0, 1,
-1.62662, -0.6101761, -2.295334, 1, 0.282353, 0, 1,
-1.622037, 1.079037, -1.79467, 1, 0.2862745, 0, 1,
-1.602771, 2.057039, -0.9614606, 1, 0.2941177, 0, 1,
-1.598086, -0.7261974, -2.461357, 1, 0.3019608, 0, 1,
-1.596841, 0.06516219, -2.198054, 1, 0.3058824, 0, 1,
-1.584791, 0.6829197, -1.612817, 1, 0.3137255, 0, 1,
-1.584358, 2.18013, -0.2472641, 1, 0.3176471, 0, 1,
-1.579855, -0.1245989, -0.3979076, 1, 0.3254902, 0, 1,
-1.570426, -0.1808616, -0.9683647, 1, 0.3294118, 0, 1,
-1.560285, 0.7584496, -1.203217, 1, 0.3372549, 0, 1,
-1.559411, 0.3053942, -1.436244, 1, 0.3411765, 0, 1,
-1.557081, -0.4134226, -1.856382, 1, 0.3490196, 0, 1,
-1.555082, 0.9157632, 0.0900992, 1, 0.3529412, 0, 1,
-1.53208, -1.389374, -3.107254, 1, 0.3607843, 0, 1,
-1.525711, -0.6827448, -2.638892, 1, 0.3647059, 0, 1,
-1.512905, -0.1924348, -3.08158, 1, 0.372549, 0, 1,
-1.506459, 0.2865367, -0.6442128, 1, 0.3764706, 0, 1,
-1.505078, 1.631857, -0.3212203, 1, 0.3843137, 0, 1,
-1.499511, -1.93307, -0.4294512, 1, 0.3882353, 0, 1,
-1.497813, 1.036069, -1.24985, 1, 0.3960784, 0, 1,
-1.479909, 0.3765951, -2.618368, 1, 0.4039216, 0, 1,
-1.473578, -1.662049, -2.027587, 1, 0.4078431, 0, 1,
-1.470689, 0.02093704, -0.9388124, 1, 0.4156863, 0, 1,
-1.45129, -0.4443612, -1.316282, 1, 0.4196078, 0, 1,
-1.410458, -2.143513, 0.3424453, 1, 0.427451, 0, 1,
-1.401273, 1.192144, -0.06023125, 1, 0.4313726, 0, 1,
-1.400786, -1.378457, -1.967134, 1, 0.4392157, 0, 1,
-1.3926, -1.75358, -2.534611, 1, 0.4431373, 0, 1,
-1.389194, -1.294449, -1.727866, 1, 0.4509804, 0, 1,
-1.381544, -1.036797, -4.056529, 1, 0.454902, 0, 1,
-1.373966, 1.065344, -0.2546333, 1, 0.4627451, 0, 1,
-1.356574, 0.5985801, -0.856198, 1, 0.4666667, 0, 1,
-1.351563, 0.9656989, -0.3171296, 1, 0.4745098, 0, 1,
-1.344746, 1.919911, -0.6403217, 1, 0.4784314, 0, 1,
-1.337946, -0.9447009, -2.872667, 1, 0.4862745, 0, 1,
-1.336965, 1.204621, -1.661173, 1, 0.4901961, 0, 1,
-1.334336, -0.07206695, -0.7905598, 1, 0.4980392, 0, 1,
-1.329823, -2.079665, -1.135365, 1, 0.5058824, 0, 1,
-1.324458, 0.8463135, 1.116864, 1, 0.509804, 0, 1,
-1.324445, 0.108752, -0.6193769, 1, 0.5176471, 0, 1,
-1.313077, -0.7970127, -3.276749, 1, 0.5215687, 0, 1,
-1.310033, 1.491911, -0.4088714, 1, 0.5294118, 0, 1,
-1.302499, 1.064843, -0.5469118, 1, 0.5333334, 0, 1,
-1.288292, 1.394371, -2.281526, 1, 0.5411765, 0, 1,
-1.272489, 0.8528125, -2.633194, 1, 0.5450981, 0, 1,
-1.270862, -1.709768, -2.341773, 1, 0.5529412, 0, 1,
-1.27027, 0.3556707, -0.1752197, 1, 0.5568628, 0, 1,
-1.269189, 0.2980345, -1.63511, 1, 0.5647059, 0, 1,
-1.267034, 0.1059779, -2.362867, 1, 0.5686275, 0, 1,
-1.265974, -1.75488, -4.292458, 1, 0.5764706, 0, 1,
-1.257049, 0.4442388, -0.7978528, 1, 0.5803922, 0, 1,
-1.256853, 0.510807, -1.863941, 1, 0.5882353, 0, 1,
-1.252909, 0.07874926, -2.098269, 1, 0.5921569, 0, 1,
-1.250684, 0.8896732, -1.853092, 1, 0.6, 0, 1,
-1.248428, 1.608573, 0.899724, 1, 0.6078432, 0, 1,
-1.240609, -0.9388415, -2.69572, 1, 0.6117647, 0, 1,
-1.233857, -0.6884947, -2.515467, 1, 0.6196079, 0, 1,
-1.231761, 1.170817, -0.681829, 1, 0.6235294, 0, 1,
-1.231366, 0.9879475, 1.597493, 1, 0.6313726, 0, 1,
-1.231184, -0.1114059, -0.3585145, 1, 0.6352941, 0, 1,
-1.226958, 1.163069, -1.044241, 1, 0.6431373, 0, 1,
-1.219575, -0.746532, -3.084535, 1, 0.6470588, 0, 1,
-1.20978, -0.02822044, -0.7261052, 1, 0.654902, 0, 1,
-1.20722, -0.5432642, -0.9210849, 1, 0.6588235, 0, 1,
-1.201001, 1.003741, 0.653416, 1, 0.6666667, 0, 1,
-1.194857, 1.758616, -1.551317, 1, 0.6705883, 0, 1,
-1.19436, 0.8596305, -1.485174, 1, 0.6784314, 0, 1,
-1.187146, 0.988256, -1.444903, 1, 0.682353, 0, 1,
-1.177714, -0.7001032, -1.933697, 1, 0.6901961, 0, 1,
-1.177509, 0.518259, -1.318254, 1, 0.6941177, 0, 1,
-1.171884, -0.09498878, -2.320946, 1, 0.7019608, 0, 1,
-1.167515, 1.647337, -0.8314762, 1, 0.7098039, 0, 1,
-1.162403, 0.5328681, -1.26105, 1, 0.7137255, 0, 1,
-1.154667, 0.2798695, -0.1638917, 1, 0.7215686, 0, 1,
-1.152347, 0.5226147, -0.7752053, 1, 0.7254902, 0, 1,
-1.15125, -1.653513, -2.056638, 1, 0.7333333, 0, 1,
-1.150303, -0.6108571, -5.071053, 1, 0.7372549, 0, 1,
-1.141379, 0.3716052, -1.774864, 1, 0.7450981, 0, 1,
-1.139043, -1.259247, -3.658882, 1, 0.7490196, 0, 1,
-1.13588, 0.07042664, -0.6973767, 1, 0.7568628, 0, 1,
-1.131623, 0.1088002, -0.9685525, 1, 0.7607843, 0, 1,
-1.131222, -2.000179, -3.128263, 1, 0.7686275, 0, 1,
-1.128013, 0.04279748, -1.316843, 1, 0.772549, 0, 1,
-1.12747, 1.580742, -1.165531, 1, 0.7803922, 0, 1,
-1.118874, -1.779277, -1.722086, 1, 0.7843137, 0, 1,
-1.116372, 1.231288, -1.483755, 1, 0.7921569, 0, 1,
-1.108795, -0.8689983, -3.188111, 1, 0.7960784, 0, 1,
-1.102608, -0.06507614, -2.098391, 1, 0.8039216, 0, 1,
-1.098283, 0.7543356, -1.318989, 1, 0.8117647, 0, 1,
-1.089727, -1.462993, -2.760823, 1, 0.8156863, 0, 1,
-1.082853, 0.2089986, -0.8004337, 1, 0.8235294, 0, 1,
-1.082256, 0.5358981, -0.4570314, 1, 0.827451, 0, 1,
-1.072855, -1.121151, -2.878461, 1, 0.8352941, 0, 1,
-1.072779, -1.369658, -2.397659, 1, 0.8392157, 0, 1,
-1.071005, -2.216891, -1.589109, 1, 0.8470588, 0, 1,
-1.069299, 0.7248837, -0.2107449, 1, 0.8509804, 0, 1,
-1.053151, -1.139085, -0.9415486, 1, 0.8588235, 0, 1,
-1.051048, -0.1203734, -2.476218, 1, 0.8627451, 0, 1,
-1.050143, 0.7863536, -1.273941, 1, 0.8705882, 0, 1,
-1.049301, -0.6552498, -2.995451, 1, 0.8745098, 0, 1,
-1.04574, 1.974744, -0.2510805, 1, 0.8823529, 0, 1,
-1.04305, -1.680268, -2.76928, 1, 0.8862745, 0, 1,
-1.043011, -0.8735202, -0.40778, 1, 0.8941177, 0, 1,
-1.041172, 0.6129094, 0.1299724, 1, 0.8980392, 0, 1,
-1.039931, 1.651303, -0.9413254, 1, 0.9058824, 0, 1,
-1.037629, 0.9574742, -2.203711, 1, 0.9137255, 0, 1,
-1.034669, 1.060538, -2.458849, 1, 0.9176471, 0, 1,
-1.03348, 0.92106, 0.2344404, 1, 0.9254902, 0, 1,
-1.028672, -0.9595432, -3.799196, 1, 0.9294118, 0, 1,
-1.027901, 1.636221, -0.251779, 1, 0.9372549, 0, 1,
-1.024223, -0.2155591, -3.074252, 1, 0.9411765, 0, 1,
-1.019122, -0.6823252, -2.910842, 1, 0.9490196, 0, 1,
-1.01534, 0.2094784, -2.971281, 1, 0.9529412, 0, 1,
-1.012738, -0.1519585, -1.827456, 1, 0.9607843, 0, 1,
-1.007213, 1.266136, 2.317474, 1, 0.9647059, 0, 1,
-0.9996307, 1.932367, 0.3894912, 1, 0.972549, 0, 1,
-0.9926735, -0.989767, -4.098298, 1, 0.9764706, 0, 1,
-0.9800247, 2.15514, -0.9666853, 1, 0.9843137, 0, 1,
-0.9685048, -1.879176, -3.089857, 1, 0.9882353, 0, 1,
-0.9680637, -0.7053142, -1.703041, 1, 0.9960784, 0, 1,
-0.9589331, -0.5821264, -1.566228, 0.9960784, 1, 0, 1,
-0.9554198, -0.9787272, -4.350449, 0.9921569, 1, 0, 1,
-0.9548482, -1.169193, -1.04244, 0.9843137, 1, 0, 1,
-0.9547067, 0.10255, -1.186285, 0.9803922, 1, 0, 1,
-0.9538933, 0.02306428, -0.3812583, 0.972549, 1, 0, 1,
-0.9519155, 1.57879, -0.615305, 0.9686275, 1, 0, 1,
-0.9448403, 0.6901072, -0.2504974, 0.9607843, 1, 0, 1,
-0.9422463, -1.681801, -2.340438, 0.9568627, 1, 0, 1,
-0.9396676, 1.967908, -1.620144, 0.9490196, 1, 0, 1,
-0.9383253, -0.1405586, -1.200613, 0.945098, 1, 0, 1,
-0.9339322, 0.612792, -1.225827, 0.9372549, 1, 0, 1,
-0.9330732, 1.342657, -0.575336, 0.9333333, 1, 0, 1,
-0.9289595, -0.2323792, -1.507141, 0.9254902, 1, 0, 1,
-0.9273874, 0.2865393, -3.351554, 0.9215686, 1, 0, 1,
-0.9262896, -0.2059295, -1.671717, 0.9137255, 1, 0, 1,
-0.9239048, -0.6402965, -1.307319, 0.9098039, 1, 0, 1,
-0.9224256, -0.5933318, -4.289601, 0.9019608, 1, 0, 1,
-0.916721, -1.222641, -1.460889, 0.8941177, 1, 0, 1,
-0.9106973, 0.280611, -1.765969, 0.8901961, 1, 0, 1,
-0.9090064, -0.1657816, -2.231324, 0.8823529, 1, 0, 1,
-0.908722, -0.491331, -1.512296, 0.8784314, 1, 0, 1,
-0.9086319, -0.4982883, -2.438124, 0.8705882, 1, 0, 1,
-0.9076102, 0.6709168, -0.6511022, 0.8666667, 1, 0, 1,
-0.9045001, 1.040305, 0.1068529, 0.8588235, 1, 0, 1,
-0.9039172, -1.720653, -2.643148, 0.854902, 1, 0, 1,
-0.8974531, -0.7280248, -3.68267, 0.8470588, 1, 0, 1,
-0.8959128, -1.673287, -3.56035, 0.8431373, 1, 0, 1,
-0.8806937, 0.974583, -2.131696, 0.8352941, 1, 0, 1,
-0.876832, -0.4604568, -3.010653, 0.8313726, 1, 0, 1,
-0.8709396, -1.266968, -2.827261, 0.8235294, 1, 0, 1,
-0.863132, 0.03940415, -1.081281, 0.8196079, 1, 0, 1,
-0.8598328, 0.2651893, -1.096235, 0.8117647, 1, 0, 1,
-0.8551008, 0.6676987, -0.9559288, 0.8078431, 1, 0, 1,
-0.8506036, -1.954618, -3.171049, 0.8, 1, 0, 1,
-0.8412684, -0.1971619, -2.545643, 0.7921569, 1, 0, 1,
-0.8392395, -0.6008346, -0.6174668, 0.7882353, 1, 0, 1,
-0.8388067, -0.2103363, -2.413247, 0.7803922, 1, 0, 1,
-0.8306677, -0.5084907, -2.850399, 0.7764706, 1, 0, 1,
-0.8223975, 0.3881835, -1.181769, 0.7686275, 1, 0, 1,
-0.8220353, -1.948337, -1.983808, 0.7647059, 1, 0, 1,
-0.8133005, -0.4076985, -1.055269, 0.7568628, 1, 0, 1,
-0.8123189, -0.8266913, -1.933084, 0.7529412, 1, 0, 1,
-0.8074787, -0.3825926, -0.08715425, 0.7450981, 1, 0, 1,
-0.7956671, -0.1712004, -1.412352, 0.7411765, 1, 0, 1,
-0.7949644, 0.2210899, -2.740279, 0.7333333, 1, 0, 1,
-0.7932911, -0.1902169, -3.095782, 0.7294118, 1, 0, 1,
-0.7927288, -0.4810356, -2.459736, 0.7215686, 1, 0, 1,
-0.7881595, 0.06962889, -2.251652, 0.7176471, 1, 0, 1,
-0.7812077, -0.1113645, -3.223904, 0.7098039, 1, 0, 1,
-0.7797903, 2.012506, 0.05454438, 0.7058824, 1, 0, 1,
-0.7780951, 1.271857, -2.369057, 0.6980392, 1, 0, 1,
-0.7779757, -1.900383, -3.965074, 0.6901961, 1, 0, 1,
-0.7636112, -0.6363601, -3.077352, 0.6862745, 1, 0, 1,
-0.7518808, -0.797006, -3.392228, 0.6784314, 1, 0, 1,
-0.7470981, 0.7521897, -1.830135, 0.6745098, 1, 0, 1,
-0.7445645, -1.17942, -1.183457, 0.6666667, 1, 0, 1,
-0.7438598, -0.569215, -2.316027, 0.6627451, 1, 0, 1,
-0.7258189, -0.9530941, -2.742776, 0.654902, 1, 0, 1,
-0.7255098, 2.151381, -0.8863647, 0.6509804, 1, 0, 1,
-0.722891, 0.4241222, -1.097603, 0.6431373, 1, 0, 1,
-0.7227594, 0.4669013, 0.4604889, 0.6392157, 1, 0, 1,
-0.7196625, -0.01336169, -1.09819, 0.6313726, 1, 0, 1,
-0.7186139, -0.6212704, -1.889851, 0.627451, 1, 0, 1,
-0.7185745, -0.7389563, -1.511163, 0.6196079, 1, 0, 1,
-0.7161101, -0.002496651, 1.332687, 0.6156863, 1, 0, 1,
-0.6838816, 2.054261, 0.734381, 0.6078432, 1, 0, 1,
-0.6806105, -1.391606, -2.710284, 0.6039216, 1, 0, 1,
-0.6781487, -1.080102, -3.41542, 0.5960785, 1, 0, 1,
-0.6775445, -2.217467, -2.322012, 0.5882353, 1, 0, 1,
-0.6767534, -0.1432447, -0.429054, 0.5843138, 1, 0, 1,
-0.6765164, -1.610283, -2.974443, 0.5764706, 1, 0, 1,
-0.6746007, 0.60006, 0.738304, 0.572549, 1, 0, 1,
-0.6706559, 3.067878, 0.351674, 0.5647059, 1, 0, 1,
-0.6620486, 0.4076231, 0.004785526, 0.5607843, 1, 0, 1,
-0.6594276, -0.438303, -2.371516, 0.5529412, 1, 0, 1,
-0.6585369, -0.05102325, -1.197067, 0.5490196, 1, 0, 1,
-0.658381, 1.446271, 0.3176388, 0.5411765, 1, 0, 1,
-0.6576223, -0.2166653, -1.328927, 0.5372549, 1, 0, 1,
-0.6527306, 0.04114258, -0.5025933, 0.5294118, 1, 0, 1,
-0.6442081, 0.1221032, -1.236223, 0.5254902, 1, 0, 1,
-0.6369089, 1.619878, 0.3022818, 0.5176471, 1, 0, 1,
-0.6319467, 0.8089765, -1.208476, 0.5137255, 1, 0, 1,
-0.6311442, -0.6506367, -3.865115, 0.5058824, 1, 0, 1,
-0.6279941, 3.122591, 0.6612208, 0.5019608, 1, 0, 1,
-0.6210806, -0.9294348, -3.647912, 0.4941176, 1, 0, 1,
-0.6141924, -1.629334, -2.710624, 0.4862745, 1, 0, 1,
-0.6133774, 1.724573, 0.4266718, 0.4823529, 1, 0, 1,
-0.6126661, -0.7952339, -2.074766, 0.4745098, 1, 0, 1,
-0.6109363, 0.7090369, -2.217703, 0.4705882, 1, 0, 1,
-0.6104254, 1.583859, -1.911107, 0.4627451, 1, 0, 1,
-0.6091306, 0.2980907, -1.987392, 0.4588235, 1, 0, 1,
-0.6060258, -1.474665, -1.688405, 0.4509804, 1, 0, 1,
-0.5944027, 1.753417, 0.2389664, 0.4470588, 1, 0, 1,
-0.5936103, 0.6873639, -1.023979, 0.4392157, 1, 0, 1,
-0.592706, -0.510649, -2.132007, 0.4352941, 1, 0, 1,
-0.5916893, 0.9409258, -1.136787, 0.427451, 1, 0, 1,
-0.5915828, -0.1022211, 0.4265294, 0.4235294, 1, 0, 1,
-0.5886836, 0.481025, 0.6359043, 0.4156863, 1, 0, 1,
-0.5871609, 0.7762409, 0.04656606, 0.4117647, 1, 0, 1,
-0.5794789, -0.3240568, -3.861726, 0.4039216, 1, 0, 1,
-0.5693808, 0.2336997, -3.894123, 0.3960784, 1, 0, 1,
-0.5667815, -0.4971131, -1.709514, 0.3921569, 1, 0, 1,
-0.5652056, -0.7241529, -1.546239, 0.3843137, 1, 0, 1,
-0.5577539, 0.5897634, -0.6867098, 0.3803922, 1, 0, 1,
-0.5555775, 0.523869, -0.5819902, 0.372549, 1, 0, 1,
-0.5522183, -1.19342, -1.725003, 0.3686275, 1, 0, 1,
-0.544513, -0.5261856, -2.149769, 0.3607843, 1, 0, 1,
-0.5429522, -1.209649, -3.725588, 0.3568628, 1, 0, 1,
-0.5345104, 0.6032877, -2.133052, 0.3490196, 1, 0, 1,
-0.5336239, 0.1106335, -0.6314456, 0.345098, 1, 0, 1,
-0.5334986, -1.884346, -2.934794, 0.3372549, 1, 0, 1,
-0.532724, 0.7732405, 0.9221725, 0.3333333, 1, 0, 1,
-0.5299662, -0.7057343, -3.07017, 0.3254902, 1, 0, 1,
-0.5288798, 1.450683, 0.8885918, 0.3215686, 1, 0, 1,
-0.5258455, -1.021879, -1.393816, 0.3137255, 1, 0, 1,
-0.5257959, 1.627865, 0.03309538, 0.3098039, 1, 0, 1,
-0.5256184, 0.0236099, -3.011862, 0.3019608, 1, 0, 1,
-0.5250214, 0.1439754, -3.398931, 0.2941177, 1, 0, 1,
-0.521865, 1.561199, -1.391302, 0.2901961, 1, 0, 1,
-0.5216808, -1.899098, -2.432474, 0.282353, 1, 0, 1,
-0.5204397, 0.4539304, -0.01484457, 0.2784314, 1, 0, 1,
-0.5089602, 0.008516151, -2.133387, 0.2705882, 1, 0, 1,
-0.5070149, -0.4650782, -3.361212, 0.2666667, 1, 0, 1,
-0.5026904, 0.2404327, -1.041553, 0.2588235, 1, 0, 1,
-0.4990901, -0.171628, -0.7485926, 0.254902, 1, 0, 1,
-0.4956785, 0.1126876, -2.028527, 0.2470588, 1, 0, 1,
-0.4954296, 0.4508824, -1.529901, 0.2431373, 1, 0, 1,
-0.4882536, -0.4710787, -1.558243, 0.2352941, 1, 0, 1,
-0.4790882, -0.2911875, -1.996714, 0.2313726, 1, 0, 1,
-0.4784794, -0.3772455, -3.626589, 0.2235294, 1, 0, 1,
-0.4689702, -0.5604647, -3.655919, 0.2196078, 1, 0, 1,
-0.4616264, -0.3700792, -1.951301, 0.2117647, 1, 0, 1,
-0.4603043, 0.1011659, -1.172334, 0.2078431, 1, 0, 1,
-0.4543518, 0.1000116, -1.727515, 0.2, 1, 0, 1,
-0.4541643, -0.1318432, -1.801795, 0.1921569, 1, 0, 1,
-0.4516879, -0.9330008, -2.779786, 0.1882353, 1, 0, 1,
-0.4506665, 0.6330214, -0.6490837, 0.1803922, 1, 0, 1,
-0.4492506, 0.2113436, -3.145531, 0.1764706, 1, 0, 1,
-0.4390984, 0.06999312, -1.780149, 0.1686275, 1, 0, 1,
-0.4384758, 1.357632, -0.3695511, 0.1647059, 1, 0, 1,
-0.4353337, 0.04360407, -3.471248, 0.1568628, 1, 0, 1,
-0.4344651, -1.545079, -3.260107, 0.1529412, 1, 0, 1,
-0.4329427, -2.197724, -2.84149, 0.145098, 1, 0, 1,
-0.4307355, -0.4010632, -2.291293, 0.1411765, 1, 0, 1,
-0.4279376, -2.752632, -3.618581, 0.1333333, 1, 0, 1,
-0.4267398, -1.206382, -2.729042, 0.1294118, 1, 0, 1,
-0.4262439, -0.3397901, -1.588348, 0.1215686, 1, 0, 1,
-0.4260641, 0.1844404, -2.343302, 0.1176471, 1, 0, 1,
-0.4204372, 1.338395, -0.05779586, 0.1098039, 1, 0, 1,
-0.4189861, 1.15708, 0.5829308, 0.1058824, 1, 0, 1,
-0.4152257, -0.3394504, -2.142353, 0.09803922, 1, 0, 1,
-0.4127769, 1.820519, -0.3554648, 0.09019608, 1, 0, 1,
-0.4112186, -1.206484, -1.545053, 0.08627451, 1, 0, 1,
-0.4093909, 0.7478077, 0.5282763, 0.07843138, 1, 0, 1,
-0.4068623, 1.93419, 0.7555962, 0.07450981, 1, 0, 1,
-0.4025036, 1.197863, 1.340479, 0.06666667, 1, 0, 1,
-0.3947835, 0.7043298, -0.9338124, 0.0627451, 1, 0, 1,
-0.3935752, -1.696796, -3.288728, 0.05490196, 1, 0, 1,
-0.3873659, 1.50969, -0.669934, 0.05098039, 1, 0, 1,
-0.383375, -0.3836168, -2.013024, 0.04313726, 1, 0, 1,
-0.383176, -0.204093, -2.401039, 0.03921569, 1, 0, 1,
-0.3811935, -0.07437369, -0.9310067, 0.03137255, 1, 0, 1,
-0.3802772, -0.2791548, -3.589117, 0.02745098, 1, 0, 1,
-0.3723083, -0.7514588, -2.16489, 0.01960784, 1, 0, 1,
-0.3705335, -0.8420829, -4.464408, 0.01568628, 1, 0, 1,
-0.3704417, 1.108682, 0.06940283, 0.007843138, 1, 0, 1,
-0.3702111, 1.321473, -2.424598, 0.003921569, 1, 0, 1,
-0.3688164, -0.4393554, -2.086707, 0, 1, 0.003921569, 1,
-0.3674616, -1.053361, -4.093451, 0, 1, 0.01176471, 1,
-0.363922, -1.61011, -2.241517, 0, 1, 0.01568628, 1,
-0.3636442, 3.157767, -2.642684, 0, 1, 0.02352941, 1,
-0.3620704, -0.572779, -1.451787, 0, 1, 0.02745098, 1,
-0.3593635, 0.6228953, -0.9554917, 0, 1, 0.03529412, 1,
-0.3563712, -2.918661, -2.415138, 0, 1, 0.03921569, 1,
-0.3534133, 0.07771707, -1.361855, 0, 1, 0.04705882, 1,
-0.352833, 0.8363494, 0.5290099, 0, 1, 0.05098039, 1,
-0.3492922, -0.2774022, -1.361469, 0, 1, 0.05882353, 1,
-0.3454436, -0.3432507, -2.306388, 0, 1, 0.0627451, 1,
-0.3441506, -0.09540218, -2.657854, 0, 1, 0.07058824, 1,
-0.3420719, -0.2326871, -2.652408, 0, 1, 0.07450981, 1,
-0.3411142, -1.552651, -2.463611, 0, 1, 0.08235294, 1,
-0.3410977, -0.01685201, -1.831474, 0, 1, 0.08627451, 1,
-0.3395223, 0.2482384, -1.767299, 0, 1, 0.09411765, 1,
-0.3392699, 0.1295023, -1.724221, 0, 1, 0.1019608, 1,
-0.3386833, 0.5297751, -0.1952743, 0, 1, 0.1058824, 1,
-0.3384567, -1.114104, -3.15222, 0, 1, 0.1137255, 1,
-0.3381913, -1.09503, -2.923669, 0, 1, 0.1176471, 1,
-0.3297288, -0.08030903, -3.177437, 0, 1, 0.1254902, 1,
-0.329241, -0.3150219, -1.854264, 0, 1, 0.1294118, 1,
-0.3266935, -1.285561, -1.879768, 0, 1, 0.1372549, 1,
-0.3248647, 0.4923246, 1.470976, 0, 1, 0.1411765, 1,
-0.3244091, -1.222789, -2.346117, 0, 1, 0.1490196, 1,
-0.3225638, -0.5662326, -3.40325, 0, 1, 0.1529412, 1,
-0.3210039, -0.1191922, -0.787752, 0, 1, 0.1607843, 1,
-0.3190419, 0.2082747, -1.317654, 0, 1, 0.1647059, 1,
-0.3172266, 0.3481736, -2.713088, 0, 1, 0.172549, 1,
-0.3154146, 0.06898317, -1.161783, 0, 1, 0.1764706, 1,
-0.3147689, -1.119753, -1.683698, 0, 1, 0.1843137, 1,
-0.3073803, 0.8159165, -1.285033, 0, 1, 0.1882353, 1,
-0.3064165, -0.9590023, -2.850159, 0, 1, 0.1960784, 1,
-0.3027436, -0.1569004, -2.049018, 0, 1, 0.2039216, 1,
-0.3017326, -0.8544062, -0.929261, 0, 1, 0.2078431, 1,
-0.301175, -0.7144317, -1.649096, 0, 1, 0.2156863, 1,
-0.2989781, 0.7053985, 0.3606307, 0, 1, 0.2196078, 1,
-0.2982392, 1.171481, 0.4475865, 0, 1, 0.227451, 1,
-0.2942929, 1.866359, 0.4804175, 0, 1, 0.2313726, 1,
-0.2872828, 0.44935, -1.826671, 0, 1, 0.2392157, 1,
-0.2856074, 1.600417, -1.613922, 0, 1, 0.2431373, 1,
-0.2819947, -0.5458832, -2.563218, 0, 1, 0.2509804, 1,
-0.2778015, -2.224988, -3.448859, 0, 1, 0.254902, 1,
-0.2771552, 1.747722, -0.2450386, 0, 1, 0.2627451, 1,
-0.2764985, 0.3060104, -1.212554, 0, 1, 0.2666667, 1,
-0.2698069, -0.2578904, -3.789985, 0, 1, 0.2745098, 1,
-0.2696081, 0.9062319, -0.54411, 0, 1, 0.2784314, 1,
-0.2667506, 0.7695729, 1.465564, 0, 1, 0.2862745, 1,
-0.2632369, 0.6464909, -0.08103293, 0, 1, 0.2901961, 1,
-0.2631837, -0.5442317, -1.878176, 0, 1, 0.2980392, 1,
-0.254039, 1.181397, 0.4923597, 0, 1, 0.3058824, 1,
-0.253574, 2.407573, -0.4246671, 0, 1, 0.3098039, 1,
-0.2528885, -1.377568, -2.905572, 0, 1, 0.3176471, 1,
-0.2512631, 1.160526, 1.531368, 0, 1, 0.3215686, 1,
-0.2502743, 0.6852359, -1.059446, 0, 1, 0.3294118, 1,
-0.2474718, -1.374559, -0.3995683, 0, 1, 0.3333333, 1,
-0.244733, -0.9971955, -1.159901, 0, 1, 0.3411765, 1,
-0.2445461, 1.397034, -0.6206432, 0, 1, 0.345098, 1,
-0.2433422, -0.2260703, -3.415769, 0, 1, 0.3529412, 1,
-0.239811, 0.121956, 1.322299, 0, 1, 0.3568628, 1,
-0.2396321, -0.7191011, -3.294638, 0, 1, 0.3647059, 1,
-0.2385136, -0.4446405, -2.999605, 0, 1, 0.3686275, 1,
-0.2381078, -1.695252, -2.148776, 0, 1, 0.3764706, 1,
-0.2331745, 0.007401009, -1.599435, 0, 1, 0.3803922, 1,
-0.2300017, 0.9811428, -0.9028006, 0, 1, 0.3882353, 1,
-0.2277963, -0.4525566, -1.752716, 0, 1, 0.3921569, 1,
-0.2215351, 1.347417, -0.5383261, 0, 1, 0.4, 1,
-0.2188398, 0.3502296, -1.089503, 0, 1, 0.4078431, 1,
-0.2109087, 1.58383, 1.307864, 0, 1, 0.4117647, 1,
-0.2078669, -0.9136709, -3.030455, 0, 1, 0.4196078, 1,
-0.206752, 0.5205787, -0.9792213, 0, 1, 0.4235294, 1,
-0.2056494, 0.03447546, -0.3729796, 0, 1, 0.4313726, 1,
-0.2054064, -0.4872648, -2.506231, 0, 1, 0.4352941, 1,
-0.2015269, -0.09570599, -2.822721, 0, 1, 0.4431373, 1,
-0.1985376, 1.621405, -0.5634221, 0, 1, 0.4470588, 1,
-0.1978724, 0.7617233, -0.297828, 0, 1, 0.454902, 1,
-0.1958767, -2.698601, -4.514589, 0, 1, 0.4588235, 1,
-0.1944232, -1.819259, -1.639622, 0, 1, 0.4666667, 1,
-0.1937338, -0.2076662, -1.094327, 0, 1, 0.4705882, 1,
-0.1926496, 0.6399321, 0.8077374, 0, 1, 0.4784314, 1,
-0.1865882, -0.3502123, -1.85589, 0, 1, 0.4823529, 1,
-0.1836288, 2.215765, 0.4070902, 0, 1, 0.4901961, 1,
-0.1829089, 0.8626519, 2.641944, 0, 1, 0.4941176, 1,
-0.1817217, -0.1704458, -2.38436, 0, 1, 0.5019608, 1,
-0.1806868, -0.1339028, -1.37748, 0, 1, 0.509804, 1,
-0.1787815, 0.4013608, -0.7693394, 0, 1, 0.5137255, 1,
-0.1775539, 0.5962321, 1.502652, 0, 1, 0.5215687, 1,
-0.1761373, -0.3358069, -2.788434, 0, 1, 0.5254902, 1,
-0.1731842, 0.7432528, 0.1164588, 0, 1, 0.5333334, 1,
-0.165493, 0.2435517, -0.3467996, 0, 1, 0.5372549, 1,
-0.1639516, -0.6293531, -2.544417, 0, 1, 0.5450981, 1,
-0.1635868, 0.894467, -0.6601096, 0, 1, 0.5490196, 1,
-0.1629972, -0.1240112, -2.404355, 0, 1, 0.5568628, 1,
-0.1539808, 0.2361358, -1.089727, 0, 1, 0.5607843, 1,
-0.1528194, -1.138265, -4.415621, 0, 1, 0.5686275, 1,
-0.1501886, 0.1186852, -0.7229768, 0, 1, 0.572549, 1,
-0.1482936, -0.01241629, -0.4246375, 0, 1, 0.5803922, 1,
-0.1447637, 0.08340985, -1.449597, 0, 1, 0.5843138, 1,
-0.1433435, -0.2563254, -3.407395, 0, 1, 0.5921569, 1,
-0.1431073, 1.43275, -0.4154079, 0, 1, 0.5960785, 1,
-0.1387804, 1.277687, -0.8161092, 0, 1, 0.6039216, 1,
-0.136996, 0.1366378, -0.338839, 0, 1, 0.6117647, 1,
-0.134807, 0.6310151, -0.8869686, 0, 1, 0.6156863, 1,
-0.1285494, -1.184889, -2.795768, 0, 1, 0.6235294, 1,
-0.122904, -2.484403, -2.901205, 0, 1, 0.627451, 1,
-0.1198972, -1.230445, -3.535964, 0, 1, 0.6352941, 1,
-0.1073641, 0.9354959, -0.8892372, 0, 1, 0.6392157, 1,
-0.1062565, 0.4209783, -1.072695, 0, 1, 0.6470588, 1,
-0.1034419, 0.4560535, 0.7255899, 0, 1, 0.6509804, 1,
-0.1033863, 0.5171412, 0.474485, 0, 1, 0.6588235, 1,
-0.1029678, 0.2084049, -0.4765193, 0, 1, 0.6627451, 1,
-0.1023951, 0.7539081, 0.1721166, 0, 1, 0.6705883, 1,
-0.09959309, -0.2458957, -2.433409, 0, 1, 0.6745098, 1,
-0.09795311, 1.773765, -0.4572456, 0, 1, 0.682353, 1,
-0.09779081, -1.585356, -4.511618, 0, 1, 0.6862745, 1,
-0.09505861, -0.5319622, -2.756036, 0, 1, 0.6941177, 1,
-0.0919257, -0.9701539, -2.058429, 0, 1, 0.7019608, 1,
-0.08597673, 0.8467152, -0.274767, 0, 1, 0.7058824, 1,
-0.08549187, -0.3727464, -3.28608, 0, 1, 0.7137255, 1,
-0.08128351, 0.4037297, -2.415382, 0, 1, 0.7176471, 1,
-0.07978908, -0.4346344, -2.7094, 0, 1, 0.7254902, 1,
-0.07966588, 0.02508754, -1.584515, 0, 1, 0.7294118, 1,
-0.07946236, 0.8477249, 1.480352, 0, 1, 0.7372549, 1,
-0.07556622, -1.210146, -2.313541, 0, 1, 0.7411765, 1,
-0.0741601, 1.769822, -1.265468, 0, 1, 0.7490196, 1,
-0.07159133, -0.1326282, -1.907089, 0, 1, 0.7529412, 1,
-0.07061128, 0.7642887, 1.714651, 0, 1, 0.7607843, 1,
-0.06884901, 1.562839, -1.097013, 0, 1, 0.7647059, 1,
-0.0665583, 1.123445, 0.5786849, 0, 1, 0.772549, 1,
-0.0623557, 1.551974, 1.454535, 0, 1, 0.7764706, 1,
-0.05955585, -0.965511, -1.806119, 0, 1, 0.7843137, 1,
-0.05407313, 0.5147252, -0.05998047, 0, 1, 0.7882353, 1,
-0.05172545, -0.7560509, -2.878307, 0, 1, 0.7960784, 1,
-0.04927829, 0.7333282, -0.8563322, 0, 1, 0.8039216, 1,
-0.04837352, -0.7223502, -3.009415, 0, 1, 0.8078431, 1,
-0.0482704, 0.2970226, 0.6850597, 0, 1, 0.8156863, 1,
-0.04673287, -0.5094383, -2.548086, 0, 1, 0.8196079, 1,
-0.04665902, -0.1780422, -2.834364, 0, 1, 0.827451, 1,
-0.04345263, -0.966304, -3.057793, 0, 1, 0.8313726, 1,
-0.0385262, -0.6449957, -2.100904, 0, 1, 0.8392157, 1,
-0.03720723, 0.6651188, -0.5999328, 0, 1, 0.8431373, 1,
-0.03118891, -0.6204317, -3.793111, 0, 1, 0.8509804, 1,
-0.02489848, -0.3456574, -4.404858, 0, 1, 0.854902, 1,
-0.02366633, -0.2041916, -3.317389, 0, 1, 0.8627451, 1,
-0.02282855, 0.7950937, -0.3037037, 0, 1, 0.8666667, 1,
-0.01986405, 0.009397564, -0.9320819, 0, 1, 0.8745098, 1,
-0.01041524, 1.170255, 0.4437533, 0, 1, 0.8784314, 1,
-0.00797099, -0.139699, -3.736764, 0, 1, 0.8862745, 1,
-0.003532946, -0.6168848, -2.239897, 0, 1, 0.8901961, 1,
-0.002518215, 0.721659, -0.6635423, 0, 1, 0.8980392, 1,
-0.0008105721, -0.07383778, -5.568089, 0, 1, 0.9058824, 1,
0.003575725, -0.3199554, 1.735081, 0, 1, 0.9098039, 1,
0.006676954, 0.6253129, 0.7417994, 0, 1, 0.9176471, 1,
0.007149346, 0.3552637, 0.3397318, 0, 1, 0.9215686, 1,
0.01269851, -0.9298173, 4.014169, 0, 1, 0.9294118, 1,
0.01370954, -1.530386, 2.690126, 0, 1, 0.9333333, 1,
0.01675053, 1.425487, 1.00871, 0, 1, 0.9411765, 1,
0.01882983, -0.8866256, 3.030023, 0, 1, 0.945098, 1,
0.01951424, -1.196464, 3.295246, 0, 1, 0.9529412, 1,
0.01978661, -0.05212918, 3.53521, 0, 1, 0.9568627, 1,
0.02112722, -2.085066, 3.850636, 0, 1, 0.9647059, 1,
0.02178827, -0.1526554, 1.600503, 0, 1, 0.9686275, 1,
0.02619586, -0.468425, 3.188645, 0, 1, 0.9764706, 1,
0.03241955, -1.28074, 3.671839, 0, 1, 0.9803922, 1,
0.03447086, -0.8542497, 2.565015, 0, 1, 0.9882353, 1,
0.03584662, -0.9280577, 2.301901, 0, 1, 0.9921569, 1,
0.04211466, -0.1387465, 3.157041, 0, 1, 1, 1,
0.04235816, -0.08723, 1.559633, 0, 0.9921569, 1, 1,
0.04280988, -0.6182918, 1.750207, 0, 0.9882353, 1, 1,
0.04425302, -0.2116556, 3.723219, 0, 0.9803922, 1, 1,
0.04572004, 1.002293, -0.6294343, 0, 0.9764706, 1, 1,
0.04856154, -1.965192, 0.5928882, 0, 0.9686275, 1, 1,
0.0564676, 0.3258065, -0.005888828, 0, 0.9647059, 1, 1,
0.05916186, -0.5580764, 2.527959, 0, 0.9568627, 1, 1,
0.0628773, 0.6876358, 1.119324, 0, 0.9529412, 1, 1,
0.06527558, -0.03226515, 2.323029, 0, 0.945098, 1, 1,
0.06658626, 2.08318, 0.35888, 0, 0.9411765, 1, 1,
0.06696505, -1.605898, 3.240019, 0, 0.9333333, 1, 1,
0.0699349, -0.3195311, 2.58248, 0, 0.9294118, 1, 1,
0.07244337, -0.3895513, 3.244431, 0, 0.9215686, 1, 1,
0.07362497, 1.005669, -2.08408, 0, 0.9176471, 1, 1,
0.0759979, 1.76987, 1.821214, 0, 0.9098039, 1, 1,
0.08344788, 0.5911484, -0.7814681, 0, 0.9058824, 1, 1,
0.0849333, -0.06509291, 1.791184, 0, 0.8980392, 1, 1,
0.09063463, 0.7529219, 1.661878, 0, 0.8901961, 1, 1,
0.0912728, -0.9229494, 4.092885, 0, 0.8862745, 1, 1,
0.0935058, -1.379736, 3.668688, 0, 0.8784314, 1, 1,
0.09554362, 1.533607, -2.254841, 0, 0.8745098, 1, 1,
0.0961356, -0.5601118, 0.6270054, 0, 0.8666667, 1, 1,
0.09678319, 0.2728777, 1.059933, 0, 0.8627451, 1, 1,
0.1016125, 0.2414079, 0.5955586, 0, 0.854902, 1, 1,
0.104482, 0.9474397, 1.604893, 0, 0.8509804, 1, 1,
0.104941, -0.09701519, 0.6517878, 0, 0.8431373, 1, 1,
0.1054748, 0.2167711, 1.056142, 0, 0.8392157, 1, 1,
0.1106379, 1.32778, 0.225131, 0, 0.8313726, 1, 1,
0.1115958, 0.01271807, 0.9124137, 0, 0.827451, 1, 1,
0.1123141, -0.2322566, 3.5046, 0, 0.8196079, 1, 1,
0.1147122, 0.9028682, -0.4668056, 0, 0.8156863, 1, 1,
0.1258274, 1.040819, -0.3567795, 0, 0.8078431, 1, 1,
0.1277411, 0.07181062, 0.3701743, 0, 0.8039216, 1, 1,
0.129261, -1.348296, 3.578883, 0, 0.7960784, 1, 1,
0.1295311, 2.227115, 0.02104452, 0, 0.7882353, 1, 1,
0.1320534, 1.559047, 1.003541, 0, 0.7843137, 1, 1,
0.133942, 0.197156, 0.01466756, 0, 0.7764706, 1, 1,
0.1371644, -0.1105974, 3.314818, 0, 0.772549, 1, 1,
0.1399299, -0.4832115, 2.431828, 0, 0.7647059, 1, 1,
0.1402517, 1.162226, -0.1817587, 0, 0.7607843, 1, 1,
0.1428266, -1.26718, 2.650385, 0, 0.7529412, 1, 1,
0.1464647, 1.465142, 1.35307, 0, 0.7490196, 1, 1,
0.1488842, 0.5465022, 1.016307, 0, 0.7411765, 1, 1,
0.1494746, 0.4205427, 0.1083328, 0, 0.7372549, 1, 1,
0.1527477, -2.937774, 1.741548, 0, 0.7294118, 1, 1,
0.1536126, -1.462147, 2.678116, 0, 0.7254902, 1, 1,
0.1546835, 0.7446374, -0.294484, 0, 0.7176471, 1, 1,
0.1550093, -0.3560579, 2.302105, 0, 0.7137255, 1, 1,
0.1551121, 1.478042, -0.8194766, 0, 0.7058824, 1, 1,
0.1590078, -0.4297758, 3.260267, 0, 0.6980392, 1, 1,
0.1637736, 1.418391, -0.9406364, 0, 0.6941177, 1, 1,
0.1642274, 1.208066, 1.568252, 0, 0.6862745, 1, 1,
0.1649136, -1.415843, 1.941688, 0, 0.682353, 1, 1,
0.1669962, 0.5571002, 1.401461, 0, 0.6745098, 1, 1,
0.1684066, -0.7090302, 3.102303, 0, 0.6705883, 1, 1,
0.1728291, -1.092128, 3.885585, 0, 0.6627451, 1, 1,
0.1730306, 1.084192, 0.3576828, 0, 0.6588235, 1, 1,
0.174871, -0.678194, 3.418387, 0, 0.6509804, 1, 1,
0.1770473, -1.413876, 5.628244, 0, 0.6470588, 1, 1,
0.178375, -0.9091246, 3.613816, 0, 0.6392157, 1, 1,
0.1815611, 0.4532394, -0.4693962, 0, 0.6352941, 1, 1,
0.1817254, -0.9120491, 1.490443, 0, 0.627451, 1, 1,
0.1822686, 0.9107206, 0.04591586, 0, 0.6235294, 1, 1,
0.1893555, -0.8318786, 1.512825, 0, 0.6156863, 1, 1,
0.1898741, 1.096133, 0.5942808, 0, 0.6117647, 1, 1,
0.1935269, 0.02495751, 1.189953, 0, 0.6039216, 1, 1,
0.1974689, -0.01211198, 3.063616, 0, 0.5960785, 1, 1,
0.1988248, -1.257762, 1.040194, 0, 0.5921569, 1, 1,
0.199629, 0.4147342, -0.5558751, 0, 0.5843138, 1, 1,
0.1998428, -0.4542693, 3.239823, 0, 0.5803922, 1, 1,
0.20362, -0.02293525, 1.59156, 0, 0.572549, 1, 1,
0.2066957, 0.1642441, 1.693493, 0, 0.5686275, 1, 1,
0.2099999, -0.7948446, 2.631009, 0, 0.5607843, 1, 1,
0.2115863, 0.2515422, 1.325651, 0, 0.5568628, 1, 1,
0.212586, -0.8268812, 1.129722, 0, 0.5490196, 1, 1,
0.2135132, -0.09483662, 0.9960617, 0, 0.5450981, 1, 1,
0.2145205, -0.1356117, 3.088046, 0, 0.5372549, 1, 1,
0.2151998, 0.1455915, 0.274388, 0, 0.5333334, 1, 1,
0.216092, -1.612652, 1.712106, 0, 0.5254902, 1, 1,
0.2163019, 0.5356942, -0.3619549, 0, 0.5215687, 1, 1,
0.2212411, 1.494874, -0.09174667, 0, 0.5137255, 1, 1,
0.2234562, 0.8657027, 0.8486728, 0, 0.509804, 1, 1,
0.2279054, -1.316045, 4.135892, 0, 0.5019608, 1, 1,
0.2332739, -0.8204494, 2.806597, 0, 0.4941176, 1, 1,
0.2335377, -0.5493756, 7.256987, 0, 0.4901961, 1, 1,
0.237958, -1.723873, 2.486848, 0, 0.4823529, 1, 1,
0.2392583, -0.961167, 1.457631, 0, 0.4784314, 1, 1,
0.2395528, -1.051337, 4.871102, 0, 0.4705882, 1, 1,
0.2418908, -1.686375, 0.75157, 0, 0.4666667, 1, 1,
0.2427434, 1.043635, 1.903499, 0, 0.4588235, 1, 1,
0.2444618, -1.888959, 2.730069, 0, 0.454902, 1, 1,
0.2478857, -0.13198, 0.2528844, 0, 0.4470588, 1, 1,
0.2491233, -0.4584964, 3.306601, 0, 0.4431373, 1, 1,
0.2497064, 0.8228295, 1.620137, 0, 0.4352941, 1, 1,
0.2538267, -0.8365117, 2.3362, 0, 0.4313726, 1, 1,
0.258489, 1.281274, -1.879164, 0, 0.4235294, 1, 1,
0.2671018, -1.072079, 3.056182, 0, 0.4196078, 1, 1,
0.2709933, 0.9396854, 0.356274, 0, 0.4117647, 1, 1,
0.2728344, -1.075276, 2.498731, 0, 0.4078431, 1, 1,
0.2748595, 1.078987, -0.1444077, 0, 0.4, 1, 1,
0.2753264, 0.2408798, 1.324258, 0, 0.3921569, 1, 1,
0.2758053, 0.09264971, -0.109642, 0, 0.3882353, 1, 1,
0.2808871, 0.1669281, 0.6303111, 0, 0.3803922, 1, 1,
0.2815332, 0.2576197, 0.6212488, 0, 0.3764706, 1, 1,
0.2864538, 0.4492754, 1.830673, 0, 0.3686275, 1, 1,
0.2872714, -0.8028671, 1.338107, 0, 0.3647059, 1, 1,
0.2883471, 0.8468664, -0.3046716, 0, 0.3568628, 1, 1,
0.290186, -0.2448671, 0.8406336, 0, 0.3529412, 1, 1,
0.2903417, 1.760554, 0.8708305, 0, 0.345098, 1, 1,
0.2930183, -1.273769, 3.468416, 0, 0.3411765, 1, 1,
0.2994808, 1.121459, 1.649578, 0, 0.3333333, 1, 1,
0.3006621, -0.354568, 3.739687, 0, 0.3294118, 1, 1,
0.3067141, -0.31927, 2.245341, 0, 0.3215686, 1, 1,
0.3122496, 0.3533242, -0.98901, 0, 0.3176471, 1, 1,
0.3171165, -0.193632, 4.550762, 0, 0.3098039, 1, 1,
0.3216569, -3.131522, 4.704893, 0, 0.3058824, 1, 1,
0.3257275, -0.3426728, 1.561103, 0, 0.2980392, 1, 1,
0.3271558, -0.4687024, 2.582686, 0, 0.2901961, 1, 1,
0.3327381, -0.05892081, 0.9460981, 0, 0.2862745, 1, 1,
0.3393829, -0.1708499, 2.151976, 0, 0.2784314, 1, 1,
0.3400669, 1.226398, 1.106871, 0, 0.2745098, 1, 1,
0.3410291, -1.659084, 2.914093, 0, 0.2666667, 1, 1,
0.3421079, -0.9805193, 3.866898, 0, 0.2627451, 1, 1,
0.3422008, -0.8767312, 1.768955, 0, 0.254902, 1, 1,
0.3425994, -0.1446327, 0.7910172, 0, 0.2509804, 1, 1,
0.346039, -1.468133, 2.773236, 0, 0.2431373, 1, 1,
0.3486181, 0.1433928, 0.5578324, 0, 0.2392157, 1, 1,
0.3615811, 0.2973713, 1.558489, 0, 0.2313726, 1, 1,
0.3630202, -0.6146029, 2.058923, 0, 0.227451, 1, 1,
0.3632006, 0.4216808, 3.349138, 0, 0.2196078, 1, 1,
0.3636333, 0.18708, 1.619277, 0, 0.2156863, 1, 1,
0.366076, -1.443107, 1.625887, 0, 0.2078431, 1, 1,
0.3689665, -0.770948, 2.462506, 0, 0.2039216, 1, 1,
0.3835361, -0.7792128, 1.142548, 0, 0.1960784, 1, 1,
0.3847016, 1.142412, -0.4619429, 0, 0.1882353, 1, 1,
0.3888435, 1.385808, -0.2203984, 0, 0.1843137, 1, 1,
0.3942345, -0.923399, 1.901677, 0, 0.1764706, 1, 1,
0.3956273, 0.0005204977, 0.9295674, 0, 0.172549, 1, 1,
0.3961704, 1.437539, 1.367997, 0, 0.1647059, 1, 1,
0.3969149, -1.295235, 3.022489, 0, 0.1607843, 1, 1,
0.4003201, 0.1474336, -0.2789295, 0, 0.1529412, 1, 1,
0.4017968, 2.933116, 2.314328, 0, 0.1490196, 1, 1,
0.4028921, 1.674872, 0.3987206, 0, 0.1411765, 1, 1,
0.4041436, -1.218044, 3.188755, 0, 0.1372549, 1, 1,
0.4060608, -0.6183177, 3.135647, 0, 0.1294118, 1, 1,
0.4077345, -1.098901, 4.758914, 0, 0.1254902, 1, 1,
0.4109893, -0.4864284, 3.847678, 0, 0.1176471, 1, 1,
0.415744, -0.9186627, 1.54727, 0, 0.1137255, 1, 1,
0.4161026, 0.5302641, -0.2718111, 0, 0.1058824, 1, 1,
0.4164483, 0.4838448, 2.703052, 0, 0.09803922, 1, 1,
0.4188227, 1.424049, 1.255706, 0, 0.09411765, 1, 1,
0.4225305, -0.03350661, 2.247019, 0, 0.08627451, 1, 1,
0.4259211, 0.7825018, 0.3202193, 0, 0.08235294, 1, 1,
0.4289074, -1.639067, 2.891611, 0, 0.07450981, 1, 1,
0.4320108, 0.08270136, 2.970695, 0, 0.07058824, 1, 1,
0.4322138, -0.3020879, 2.048715, 0, 0.0627451, 1, 1,
0.4325665, 0.1003179, 2.098651, 0, 0.05882353, 1, 1,
0.433399, 1.969981, 1.175921, 0, 0.05098039, 1, 1,
0.436711, -0.9449349, 2.401788, 0, 0.04705882, 1, 1,
0.4441464, 0.1403436, 1.173294, 0, 0.03921569, 1, 1,
0.4441888, 1.617471, -1.07952, 0, 0.03529412, 1, 1,
0.4477082, 0.9167519, 1.699956, 0, 0.02745098, 1, 1,
0.4483847, 1.019237, 1.224306, 0, 0.02352941, 1, 1,
0.4513451, 1.219289, 0.968394, 0, 0.01568628, 1, 1,
0.4518465, 0.1978814, 2.375482, 0, 0.01176471, 1, 1,
0.4576773, -0.2814477, 2.1027, 0, 0.003921569, 1, 1,
0.4644386, -0.22468, 2.126606, 0.003921569, 0, 1, 1,
0.4671492, -0.8772804, 3.347898, 0.007843138, 0, 1, 1,
0.467154, -0.4731864, 1.906408, 0.01568628, 0, 1, 1,
0.4677571, -1.383779, 3.344655, 0.01960784, 0, 1, 1,
0.4691274, 0.7567214, 1.564835, 0.02745098, 0, 1, 1,
0.4704832, 0.6654642, 1.324869, 0.03137255, 0, 1, 1,
0.4722674, 0.5404034, -0.1389752, 0.03921569, 0, 1, 1,
0.4747841, 0.9025643, 1.167535, 0.04313726, 0, 1, 1,
0.4767409, -0.9807025, 2.068859, 0.05098039, 0, 1, 1,
0.48048, 1.015134, -0.0588133, 0.05490196, 0, 1, 1,
0.480546, 1.470497, 1.400004, 0.0627451, 0, 1, 1,
0.4834961, -2.231179, 4.461991, 0.06666667, 0, 1, 1,
0.4848241, -1.755486, 2.856962, 0.07450981, 0, 1, 1,
0.4887962, -1.674562, 2.44951, 0.07843138, 0, 1, 1,
0.5028387, 1.383321, -0.3880883, 0.08627451, 0, 1, 1,
0.5056481, -0.2097914, 1.054387, 0.09019608, 0, 1, 1,
0.5064729, 1.155367, -0.6109629, 0.09803922, 0, 1, 1,
0.5074797, 0.1844808, 3.515965, 0.1058824, 0, 1, 1,
0.5094644, 1.202988, 1.626996, 0.1098039, 0, 1, 1,
0.5127444, 0.1794704, 2.499711, 0.1176471, 0, 1, 1,
0.5132228, 0.9744896, 0.347357, 0.1215686, 0, 1, 1,
0.5213234, -0.2809969, 2.653615, 0.1294118, 0, 1, 1,
0.5223523, 0.4996535, 0.8415005, 0.1333333, 0, 1, 1,
0.5276306, 0.3810005, 0.4652971, 0.1411765, 0, 1, 1,
0.5330244, -0.09567461, 2.721494, 0.145098, 0, 1, 1,
0.5358281, -1.12052, 2.168064, 0.1529412, 0, 1, 1,
0.5476314, -0.6522765, 3.097055, 0.1568628, 0, 1, 1,
0.5499461, -1.685773, 2.148963, 0.1647059, 0, 1, 1,
0.5501177, -0.5753673, 1.898142, 0.1686275, 0, 1, 1,
0.5567437, 0.5770862, -0.7011684, 0.1764706, 0, 1, 1,
0.5594904, 0.8977624, 1.2162, 0.1803922, 0, 1, 1,
0.5636573, -0.3677979, 6.166782, 0.1882353, 0, 1, 1,
0.5648246, 0.4039705, 1.595622, 0.1921569, 0, 1, 1,
0.5655353, -0.4220818, 3.659177, 0.2, 0, 1, 1,
0.5669661, -0.2996962, 1.410813, 0.2078431, 0, 1, 1,
0.5716746, -0.7612192, 2.15544, 0.2117647, 0, 1, 1,
0.5722319, -1.307705, 2.431824, 0.2196078, 0, 1, 1,
0.5723091, 0.1518439, 0.9279681, 0.2235294, 0, 1, 1,
0.5774716, 1.22848, -0.1018295, 0.2313726, 0, 1, 1,
0.5826326, 0.7731501, -0.1641671, 0.2352941, 0, 1, 1,
0.5882654, 1.653317, 0.03564346, 0.2431373, 0, 1, 1,
0.5906793, -0.5420157, 2.816068, 0.2470588, 0, 1, 1,
0.5931959, -1.257257, 2.812914, 0.254902, 0, 1, 1,
0.5956396, -0.0860686, 3.698789, 0.2588235, 0, 1, 1,
0.5963995, 0.389842, -0.6647645, 0.2666667, 0, 1, 1,
0.5976582, 1.033889, 0.6893013, 0.2705882, 0, 1, 1,
0.6010666, 0.5350654, -0.5153004, 0.2784314, 0, 1, 1,
0.601213, -0.9353561, 1.76166, 0.282353, 0, 1, 1,
0.6017154, 0.3421026, 1.103809, 0.2901961, 0, 1, 1,
0.6026106, 1.411132, -0.5485092, 0.2941177, 0, 1, 1,
0.6043906, 0.136381, 1.701439, 0.3019608, 0, 1, 1,
0.6055582, -0.7028266, 2.841231, 0.3098039, 0, 1, 1,
0.6108826, -0.845238, 3.367131, 0.3137255, 0, 1, 1,
0.6126532, 0.9942973, -0.23883, 0.3215686, 0, 1, 1,
0.6126946, 0.301304, 0.5459246, 0.3254902, 0, 1, 1,
0.6135724, -2.017108, 2.504969, 0.3333333, 0, 1, 1,
0.6145279, 0.770727, -0.2581102, 0.3372549, 0, 1, 1,
0.6150027, -0.5890741, 0.9791613, 0.345098, 0, 1, 1,
0.620764, -0.6205379, 2.822714, 0.3490196, 0, 1, 1,
0.6219003, 0.1807636, 1.677058, 0.3568628, 0, 1, 1,
0.629502, -0.3021161, 0.922886, 0.3607843, 0, 1, 1,
0.6306182, 2.442024, -0.0659979, 0.3686275, 0, 1, 1,
0.6337609, -0.2539762, 0.4644656, 0.372549, 0, 1, 1,
0.6380103, -1.347024, 2.850591, 0.3803922, 0, 1, 1,
0.639465, -0.5372749, 2.405041, 0.3843137, 0, 1, 1,
0.6445363, -1.45523, 1.737427, 0.3921569, 0, 1, 1,
0.6491529, -0.7398279, 2.959646, 0.3960784, 0, 1, 1,
0.6505682, -2.542014, 3.334779, 0.4039216, 0, 1, 1,
0.6522849, -0.2662127, 1.598643, 0.4117647, 0, 1, 1,
0.6556437, 0.7230501, 2.905817, 0.4156863, 0, 1, 1,
0.6597496, -0.8736317, 2.661137, 0.4235294, 0, 1, 1,
0.6614587, -0.08511081, 1.687063, 0.427451, 0, 1, 1,
0.6647851, -0.09887905, 1.432918, 0.4352941, 0, 1, 1,
0.6651701, 0.105545, 1.341617, 0.4392157, 0, 1, 1,
0.6651838, -0.5848951, 0.3892474, 0.4470588, 0, 1, 1,
0.6657065, -1.438472, 3.559194, 0.4509804, 0, 1, 1,
0.670415, -0.08265646, 2.969008, 0.4588235, 0, 1, 1,
0.6731935, -0.5146714, 1.751911, 0.4627451, 0, 1, 1,
0.6736115, -0.4550412, 2.883167, 0.4705882, 0, 1, 1,
0.6770582, 0.09641588, 1.66682, 0.4745098, 0, 1, 1,
0.6777177, 0.5017032, 1.717816, 0.4823529, 0, 1, 1,
0.6810356, -1.927241, 2.032245, 0.4862745, 0, 1, 1,
0.6854057, 2.755704, -0.9206843, 0.4941176, 0, 1, 1,
0.6861562, 0.82552, 0.428706, 0.5019608, 0, 1, 1,
0.6882253, -0.8101142, 3.219685, 0.5058824, 0, 1, 1,
0.6884287, 0.6586229, -0.3867373, 0.5137255, 0, 1, 1,
0.6910202, -0.1836038, 1.143973, 0.5176471, 0, 1, 1,
0.6981847, 1.46403, 0.2954789, 0.5254902, 0, 1, 1,
0.7000242, 0.1184268, 0.2513871, 0.5294118, 0, 1, 1,
0.7014921, 0.3300078, 1.047173, 0.5372549, 0, 1, 1,
0.7071656, -1.378945, 3.006464, 0.5411765, 0, 1, 1,
0.7073478, 0.2614948, 1.068535, 0.5490196, 0, 1, 1,
0.7217091, 0.4542652, 1.549233, 0.5529412, 0, 1, 1,
0.7231222, 0.7132903, 3.081559, 0.5607843, 0, 1, 1,
0.72438, 1.099109, -1.059396, 0.5647059, 0, 1, 1,
0.7296906, -1.61156, 4.014682, 0.572549, 0, 1, 1,
0.7334929, 1.563108, 1.8941, 0.5764706, 0, 1, 1,
0.7369663, 0.5351117, -0.162337, 0.5843138, 0, 1, 1,
0.7411974, -0.01320255, 1.761582, 0.5882353, 0, 1, 1,
0.7446378, 0.5599506, -0.03316321, 0.5960785, 0, 1, 1,
0.74884, 0.6604941, 1.052133, 0.6039216, 0, 1, 1,
0.7511932, -0.05015702, 2.612244, 0.6078432, 0, 1, 1,
0.751398, -0.2058462, 2.325554, 0.6156863, 0, 1, 1,
0.7528273, 1.318386, -0.07039336, 0.6196079, 0, 1, 1,
0.7564124, -0.2110195, 2.04749, 0.627451, 0, 1, 1,
0.7579578, 0.1643656, 1.478105, 0.6313726, 0, 1, 1,
0.7666422, -0.6786831, 2.679662, 0.6392157, 0, 1, 1,
0.7777934, 0.7790382, -0.6412009, 0.6431373, 0, 1, 1,
0.7857324, -0.5108621, 3.03005, 0.6509804, 0, 1, 1,
0.7858413, 0.6833432, 0.6847501, 0.654902, 0, 1, 1,
0.7879377, -1.830369, 1.507773, 0.6627451, 0, 1, 1,
0.7893878, 0.3838197, 2.129712, 0.6666667, 0, 1, 1,
0.7910184, 0.9999375, 1.017701, 0.6745098, 0, 1, 1,
0.7913168, 0.526465, 1.753739, 0.6784314, 0, 1, 1,
0.7913943, -1.273266, 3.561069, 0.6862745, 0, 1, 1,
0.7933805, 0.01129121, 1.391507, 0.6901961, 0, 1, 1,
0.7941583, -1.143337, 3.487857, 0.6980392, 0, 1, 1,
0.7987147, -0.7826709, 0.9583257, 0.7058824, 0, 1, 1,
0.8029611, 0.233191, 1.860877, 0.7098039, 0, 1, 1,
0.8032069, -1.16868, 4.242976, 0.7176471, 0, 1, 1,
0.80322, 0.7586018, 1.859479, 0.7215686, 0, 1, 1,
0.8052099, 0.02761705, 0.4653172, 0.7294118, 0, 1, 1,
0.8082593, 1.015618, 0.3191825, 0.7333333, 0, 1, 1,
0.8105537, -0.2512842, 1.016709, 0.7411765, 0, 1, 1,
0.8155525, -0.3088929, 2.319056, 0.7450981, 0, 1, 1,
0.8223029, 1.449747, 3.060532, 0.7529412, 0, 1, 1,
0.8317551, 0.5073802, 0.985451, 0.7568628, 0, 1, 1,
0.8321406, -0.05857369, 1.531179, 0.7647059, 0, 1, 1,
0.8323666, 0.6650188, 0.2612787, 0.7686275, 0, 1, 1,
0.8368675, -1.355148, 0.9588068, 0.7764706, 0, 1, 1,
0.83979, 0.5278566, 2.94298, 0.7803922, 0, 1, 1,
0.84196, -0.5707573, 2.198448, 0.7882353, 0, 1, 1,
0.8451192, -0.6559014, 3.08273, 0.7921569, 0, 1, 1,
0.8514335, 0.2188167, 1.03335, 0.8, 0, 1, 1,
0.863104, -0.03204824, 3.831529, 0.8078431, 0, 1, 1,
0.8744236, 1.146396, 1.573467, 0.8117647, 0, 1, 1,
0.8773429, 1.999024, 0.4386233, 0.8196079, 0, 1, 1,
0.8823664, 1.057325, 0.5034508, 0.8235294, 0, 1, 1,
0.8852091, -0.7311486, 2.775257, 0.8313726, 0, 1, 1,
0.8853518, -0.3806613, 3.215081, 0.8352941, 0, 1, 1,
0.8920826, -1.185583, 1.688475, 0.8431373, 0, 1, 1,
0.9061857, 2.385107, -0.2813428, 0.8470588, 0, 1, 1,
0.9104083, -0.181384, 3.425248, 0.854902, 0, 1, 1,
0.9143046, 0.7486121, 1.623109, 0.8588235, 0, 1, 1,
0.92998, 1.770678, 0.06004303, 0.8666667, 0, 1, 1,
0.9328938, -0.6056499, 3.577492, 0.8705882, 0, 1, 1,
0.9343632, 0.8491329, 0.6751118, 0.8784314, 0, 1, 1,
0.9380638, 0.7896034, 1.67224, 0.8823529, 0, 1, 1,
0.9403033, -1.161771, 3.099424, 0.8901961, 0, 1, 1,
0.9468983, 1.698072, 1.678114, 0.8941177, 0, 1, 1,
0.9475005, -0.4754975, 1.711343, 0.9019608, 0, 1, 1,
0.948045, -0.05893338, 4.375297, 0.9098039, 0, 1, 1,
0.9510482, 0.01279818, 1.57973, 0.9137255, 0, 1, 1,
0.9533698, 0.7090201, 1.393855, 0.9215686, 0, 1, 1,
0.9668515, -0.2431655, 0.4491189, 0.9254902, 0, 1, 1,
0.9684463, -0.05064525, 1.328951, 0.9333333, 0, 1, 1,
0.9687635, -0.6452942, 1.299425, 0.9372549, 0, 1, 1,
0.9703636, -0.1609897, 0.9692415, 0.945098, 0, 1, 1,
0.9745442, 0.2062856, 1.722445, 0.9490196, 0, 1, 1,
0.9760767, -0.2316962, 1.635173, 0.9568627, 0, 1, 1,
0.9837557, 0.3451305, 2.077363, 0.9607843, 0, 1, 1,
0.9859654, -1.660497, 2.370349, 0.9686275, 0, 1, 1,
0.9876917, 2.535711, -0.351863, 0.972549, 0, 1, 1,
0.995421, -0.7729555, 2.877855, 0.9803922, 0, 1, 1,
0.9974131, 0.7908937, 1.160742, 0.9843137, 0, 1, 1,
1.002236, 1.685357, 1.131826, 0.9921569, 0, 1, 1,
1.011198, -0.3324331, 2.974393, 0.9960784, 0, 1, 1,
1.011657, -0.121687, 1.788465, 1, 0, 0.9960784, 1,
1.01298, -0.3706839, 3.265499, 1, 0, 0.9882353, 1,
1.013056, -0.5603797, 1.943936, 1, 0, 0.9843137, 1,
1.0139, 1.597927, 0.3085634, 1, 0, 0.9764706, 1,
1.014773, 0.3363763, 1.022821, 1, 0, 0.972549, 1,
1.022001, -0.6791137, 0.4424864, 1, 0, 0.9647059, 1,
1.026465, 0.8399546, -0.4718981, 1, 0, 0.9607843, 1,
1.027454, 1.725692, 2.174893, 1, 0, 0.9529412, 1,
1.039288, -0.7102801, 3.644109, 1, 0, 0.9490196, 1,
1.039439, -0.7895212, 3.200356, 1, 0, 0.9411765, 1,
1.039609, -2.382391, 1.309735, 1, 0, 0.9372549, 1,
1.043386, 1.354231, 0.8976786, 1, 0, 0.9294118, 1,
1.050533, -0.5802817, 2.533835, 1, 0, 0.9254902, 1,
1.05095, 0.07153765, 1.364049, 1, 0, 0.9176471, 1,
1.051465, 0.08287565, 1.977254, 1, 0, 0.9137255, 1,
1.057387, 0.03970646, 1.329967, 1, 0, 0.9058824, 1,
1.057725, 0.3571955, 1.402237, 1, 0, 0.9019608, 1,
1.059392, -2.606025, 3.066567, 1, 0, 0.8941177, 1,
1.064668, -0.8403221, 1.862974, 1, 0, 0.8862745, 1,
1.067142, -0.486126, 1.353494, 1, 0, 0.8823529, 1,
1.070742, -1.644869, 3.056919, 1, 0, 0.8745098, 1,
1.076168, 0.3708641, 1.430871, 1, 0, 0.8705882, 1,
1.078435, 0.7644308, 0.9032999, 1, 0, 0.8627451, 1,
1.082808, 0.1183536, 0.5756601, 1, 0, 0.8588235, 1,
1.083009, -2.323131, 3.520589, 1, 0, 0.8509804, 1,
1.084299, 1.413137, 1.122749, 1, 0, 0.8470588, 1,
1.08479, -1.274375, 2.655909, 1, 0, 0.8392157, 1,
1.088529, 1.64583, -0.790417, 1, 0, 0.8352941, 1,
1.092799, -1.178085, 0.9098278, 1, 0, 0.827451, 1,
1.097423, -0.007821259, 2.185218, 1, 0, 0.8235294, 1,
1.105997, -1.010659, 3.001302, 1, 0, 0.8156863, 1,
1.111025, 0.01823447, 0.3078427, 1, 0, 0.8117647, 1,
1.133877, 0.4647687, 1.488726, 1, 0, 0.8039216, 1,
1.157035, -1.157102, 2.094034, 1, 0, 0.7960784, 1,
1.157554, 0.2258351, 3.326498, 1, 0, 0.7921569, 1,
1.157934, -0.05567979, 1.578045, 1, 0, 0.7843137, 1,
1.158602, -0.0002213328, 1.215904, 1, 0, 0.7803922, 1,
1.158989, -1.542586, 1.117371, 1, 0, 0.772549, 1,
1.16129, -2.656386, 2.070593, 1, 0, 0.7686275, 1,
1.161853, -0.2450707, 2.296109, 1, 0, 0.7607843, 1,
1.164074, -1.876441, 3.737987, 1, 0, 0.7568628, 1,
1.169498, -1.233484, 3.06139, 1, 0, 0.7490196, 1,
1.171638, -0.8707243, 0.1455392, 1, 0, 0.7450981, 1,
1.175366, -0.386638, 2.96842, 1, 0, 0.7372549, 1,
1.177217, 0.2937415, 0.8456596, 1, 0, 0.7333333, 1,
1.180342, 0.2881593, -0.5605268, 1, 0, 0.7254902, 1,
1.180708, 1.888181, -0.5649381, 1, 0, 0.7215686, 1,
1.185588, 0.2086431, 1.533425, 1, 0, 0.7137255, 1,
1.186052, 0.4622748, -1.05615, 1, 0, 0.7098039, 1,
1.188255, -0.6768655, 1.368034, 1, 0, 0.7019608, 1,
1.189921, -0.1443595, 0.1354, 1, 0, 0.6941177, 1,
1.193029, 2.312012, 1.188125, 1, 0, 0.6901961, 1,
1.196244, 0.7741359, 0.3745537, 1, 0, 0.682353, 1,
1.202538, -0.8948236, 0.8747042, 1, 0, 0.6784314, 1,
1.212719, -2.317786, 2.284467, 1, 0, 0.6705883, 1,
1.215658, 0.7330963, 0.6454931, 1, 0, 0.6666667, 1,
1.22236, -0.1786701, 0.9621175, 1, 0, 0.6588235, 1,
1.223795, 1.373909, 1.078246, 1, 0, 0.654902, 1,
1.224161, -0.3592028, 2.021128, 1, 0, 0.6470588, 1,
1.225874, -1.199111, 3.237756, 1, 0, 0.6431373, 1,
1.233613, 1.351371, 1.675408, 1, 0, 0.6352941, 1,
1.238442, -0.03975732, 2.863712, 1, 0, 0.6313726, 1,
1.247141, -0.9626331, 2.129816, 1, 0, 0.6235294, 1,
1.25312, 0.3985738, 0.6581696, 1, 0, 0.6196079, 1,
1.256947, 1.080511, -0.9616861, 1, 0, 0.6117647, 1,
1.257074, -0.8918814, 2.857354, 1, 0, 0.6078432, 1,
1.258333, -0.1331048, -0.006686754, 1, 0, 0.6, 1,
1.279197, -0.1384246, 1.839865, 1, 0, 0.5921569, 1,
1.279373, -0.3534537, 0.113136, 1, 0, 0.5882353, 1,
1.279435, -0.3257818, 2.567411, 1, 0, 0.5803922, 1,
1.284522, -1.310204, 0.01687916, 1, 0, 0.5764706, 1,
1.284947, 0.2291929, 2.404436, 1, 0, 0.5686275, 1,
1.287891, -0.5746964, 2.653613, 1, 0, 0.5647059, 1,
1.291525, -0.4792797, 2.88244, 1, 0, 0.5568628, 1,
1.306313, 1.020225, 0.5328135, 1, 0, 0.5529412, 1,
1.328514, -0.1974477, 1.53057, 1, 0, 0.5450981, 1,
1.32973, -0.06802365, 1.214679, 1, 0, 0.5411765, 1,
1.347609, -1.456519, 2.136373, 1, 0, 0.5333334, 1,
1.363863, 0.4211719, 0.8240757, 1, 0, 0.5294118, 1,
1.366976, -0.9348669, 0.563369, 1, 0, 0.5215687, 1,
1.383206, 0.9371563, 0.4221641, 1, 0, 0.5176471, 1,
1.38995, 0.0335757, 0.8911903, 1, 0, 0.509804, 1,
1.395985, -0.2024849, 3.596125, 1, 0, 0.5058824, 1,
1.408924, 0.109626, 3.116661, 1, 0, 0.4980392, 1,
1.412897, -0.9316145, 2.311802, 1, 0, 0.4901961, 1,
1.416061, 0.09951406, 1.256668, 1, 0, 0.4862745, 1,
1.433484, 0.2866369, 3.312931, 1, 0, 0.4784314, 1,
1.435095, -0.6772141, 3.319895, 1, 0, 0.4745098, 1,
1.441612, 0.5297295, -0.0148918, 1, 0, 0.4666667, 1,
1.456941, 1.549492, 0.6917107, 1, 0, 0.4627451, 1,
1.466874, 1.110713, 1.356902, 1, 0, 0.454902, 1,
1.469566, 0.1114016, 1.150848, 1, 0, 0.4509804, 1,
1.473293, 0.5197961, 0.4423117, 1, 0, 0.4431373, 1,
1.481677, -0.3934601, 1.726617, 1, 0, 0.4392157, 1,
1.483613, 0.003309708, -0.0619902, 1, 0, 0.4313726, 1,
1.486741, -0.013575, 3.560305, 1, 0, 0.427451, 1,
1.486898, -0.5060521, 1.355706, 1, 0, 0.4196078, 1,
1.487813, -1.714535, 3.392834, 1, 0, 0.4156863, 1,
1.492043, -0.984822, 1.770944, 1, 0, 0.4078431, 1,
1.498786, -1.089974, 2.898139, 1, 0, 0.4039216, 1,
1.499181, -0.05300489, 1.015003, 1, 0, 0.3960784, 1,
1.504095, -1.43452, 2.723484, 1, 0, 0.3882353, 1,
1.507432, -0.5433298, 1.203142, 1, 0, 0.3843137, 1,
1.520943, -0.9910703, 1.08469, 1, 0, 0.3764706, 1,
1.532104, 0.5306514, 2.092117, 1, 0, 0.372549, 1,
1.537236, 0.1515788, 1.983725, 1, 0, 0.3647059, 1,
1.552323, -0.828554, 1.205196, 1, 0, 0.3607843, 1,
1.57315, -0.5849848, 3.382226, 1, 0, 0.3529412, 1,
1.594103, -0.7309611, 2.026936, 1, 0, 0.3490196, 1,
1.603892, 1.026026, 1.32932, 1, 0, 0.3411765, 1,
1.635278, 0.3425126, 0.3512258, 1, 0, 0.3372549, 1,
1.639849, 0.9712928, -0.4619411, 1, 0, 0.3294118, 1,
1.648159, -0.3261348, 3.309505, 1, 0, 0.3254902, 1,
1.648434, -0.8110599, 1.749658, 1, 0, 0.3176471, 1,
1.654775, 0.1154902, 1.380236, 1, 0, 0.3137255, 1,
1.669743, 1.115596, -0.455635, 1, 0, 0.3058824, 1,
1.685453, 0.7293314, 0.540522, 1, 0, 0.2980392, 1,
1.686166, 0.02275594, 1.58088, 1, 0, 0.2941177, 1,
1.688089, -0.3180695, 3.110855, 1, 0, 0.2862745, 1,
1.696758, -0.2836979, 2.129291, 1, 0, 0.282353, 1,
1.719482, -1.1384, 0.2900078, 1, 0, 0.2745098, 1,
1.725499, 0.9996435, 2.434409, 1, 0, 0.2705882, 1,
1.735253, 0.2800331, 1.088941, 1, 0, 0.2627451, 1,
1.747529, -0.4011085, 2.243848, 1, 0, 0.2588235, 1,
1.75027, 0.209656, 2.128633, 1, 0, 0.2509804, 1,
1.753465, 1.079024, 1.262669, 1, 0, 0.2470588, 1,
1.826751, 1.444785, 1.636248, 1, 0, 0.2392157, 1,
1.850199, -0.2038775, 1.283229, 1, 0, 0.2352941, 1,
1.870716, 0.5570686, 0.609264, 1, 0, 0.227451, 1,
1.87175, -1.10531, 0.9565853, 1, 0, 0.2235294, 1,
1.87879, -1.070418, 1.367876, 1, 0, 0.2156863, 1,
1.894368, -0.08584801, 1.689134, 1, 0, 0.2117647, 1,
1.923484, -0.07699933, 2.609927, 1, 0, 0.2039216, 1,
1.939229, -0.2906209, 2.769899, 1, 0, 0.1960784, 1,
1.939959, -1.268774, 2.455133, 1, 0, 0.1921569, 1,
1.95856, -0.2609555, 1.869776, 1, 0, 0.1843137, 1,
1.960644, -0.4655446, 2.378657, 1, 0, 0.1803922, 1,
1.962624, -1.22304, 4.307738, 1, 0, 0.172549, 1,
1.976146, -1.186183, 2.529663, 1, 0, 0.1686275, 1,
1.97929, 0.7233061, 1.104602, 1, 0, 0.1607843, 1,
2.005296, 1.445336, 1.450121, 1, 0, 0.1568628, 1,
2.021597, 0.5386733, 1.144235, 1, 0, 0.1490196, 1,
2.043385, -0.7522371, 3.389546, 1, 0, 0.145098, 1,
2.053737, 0.04955228, 1.373933, 1, 0, 0.1372549, 1,
2.075979, -0.349941, 2.443029, 1, 0, 0.1333333, 1,
2.091561, -1.917599, 2.433751, 1, 0, 0.1254902, 1,
2.123819, -1.412026, 1.317454, 1, 0, 0.1215686, 1,
2.187245, -0.5825897, 2.786953, 1, 0, 0.1137255, 1,
2.220461, 1.919748, 0.6962609, 1, 0, 0.1098039, 1,
2.248576, 0.2874126, -0.2449519, 1, 0, 0.1019608, 1,
2.276592, -0.8962143, 2.364298, 1, 0, 0.09411765, 1,
2.309253, 0.8772773, 2.432986, 1, 0, 0.09019608, 1,
2.40129, -1.598218, 0.6580661, 1, 0, 0.08235294, 1,
2.43431, -0.9822599, 2.320093, 1, 0, 0.07843138, 1,
2.445584, -0.0306842, 1.325551, 1, 0, 0.07058824, 1,
2.563388, 1.651329, -0.246801, 1, 0, 0.06666667, 1,
2.585386, 1.09296, 1.293871, 1, 0, 0.05882353, 1,
2.612741, 0.4742376, 1.314999, 1, 0, 0.05490196, 1,
2.685533, -0.3723776, 2.224458, 1, 0, 0.04705882, 1,
2.687931, -0.3378207, 0.08960935, 1, 0, 0.04313726, 1,
2.810567, 1.337199, 0.8169753, 1, 0, 0.03529412, 1,
2.904891, 0.6949636, -0.4979578, 1, 0, 0.03137255, 1,
2.905491, -0.8036334, 2.3447, 1, 0, 0.02352941, 1,
2.929202, -0.2298784, 1.44318, 1, 0, 0.01960784, 1,
3.276634, -0.09427311, 1.930415, 1, 0, 0.01176471, 1,
3.332018, 0.3702998, 1.964623, 1, 0, 0.007843138, 1
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
-0.2799933, -4.197556, -7.741939, 0, -0.5, 0.5, 0.5,
-0.2799933, -4.197556, -7.741939, 1, -0.5, 0.5, 0.5,
-0.2799933, -4.197556, -7.741939, 1, 1.5, 0.5, 0.5,
-0.2799933, -4.197556, -7.741939, 0, 1.5, 0.5, 0.5
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
-5.116476, 0.01312244, -7.741939, 0, -0.5, 0.5, 0.5,
-5.116476, 0.01312244, -7.741939, 1, -0.5, 0.5, 0.5,
-5.116476, 0.01312244, -7.741939, 1, 1.5, 0.5, 0.5,
-5.116476, 0.01312244, -7.741939, 0, 1.5, 0.5, 0.5
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
-5.116476, -4.197556, 0.8444493, 0, -0.5, 0.5, 0.5,
-5.116476, -4.197556, 0.8444493, 1, -0.5, 0.5, 0.5,
-5.116476, -4.197556, 0.8444493, 1, 1.5, 0.5, 0.5,
-5.116476, -4.197556, 0.8444493, 0, 1.5, 0.5, 0.5
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
-2, -3.225861, -5.760465,
2, -3.225861, -5.760465,
-2, -3.225861, -5.760465,
-2, -3.38781, -6.09071,
0, -3.225861, -5.760465,
0, -3.38781, -6.09071,
2, -3.225861, -5.760465,
2, -3.38781, -6.09071
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
-2, -3.711709, -6.751202, 0, -0.5, 0.5, 0.5,
-2, -3.711709, -6.751202, 1, -0.5, 0.5, 0.5,
-2, -3.711709, -6.751202, 1, 1.5, 0.5, 0.5,
-2, -3.711709, -6.751202, 0, 1.5, 0.5, 0.5,
0, -3.711709, -6.751202, 0, -0.5, 0.5, 0.5,
0, -3.711709, -6.751202, 1, -0.5, 0.5, 0.5,
0, -3.711709, -6.751202, 1, 1.5, 0.5, 0.5,
0, -3.711709, -6.751202, 0, 1.5, 0.5, 0.5,
2, -3.711709, -6.751202, 0, -0.5, 0.5, 0.5,
2, -3.711709, -6.751202, 1, -0.5, 0.5, 0.5,
2, -3.711709, -6.751202, 1, 1.5, 0.5, 0.5,
2, -3.711709, -6.751202, 0, 1.5, 0.5, 0.5
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
-4.000365, -3, -5.760465,
-4.000365, 3, -5.760465,
-4.000365, -3, -5.760465,
-4.186383, -3, -6.09071,
-4.000365, -2, -5.760465,
-4.186383, -2, -6.09071,
-4.000365, -1, -5.760465,
-4.186383, -1, -6.09071,
-4.000365, 0, -5.760465,
-4.186383, 0, -6.09071,
-4.000365, 1, -5.760465,
-4.186383, 1, -6.09071,
-4.000365, 2, -5.760465,
-4.186383, 2, -6.09071,
-4.000365, 3, -5.760465,
-4.186383, 3, -6.09071
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
-4.558421, -3, -6.751202, 0, -0.5, 0.5, 0.5,
-4.558421, -3, -6.751202, 1, -0.5, 0.5, 0.5,
-4.558421, -3, -6.751202, 1, 1.5, 0.5, 0.5,
-4.558421, -3, -6.751202, 0, 1.5, 0.5, 0.5,
-4.558421, -2, -6.751202, 0, -0.5, 0.5, 0.5,
-4.558421, -2, -6.751202, 1, -0.5, 0.5, 0.5,
-4.558421, -2, -6.751202, 1, 1.5, 0.5, 0.5,
-4.558421, -2, -6.751202, 0, 1.5, 0.5, 0.5,
-4.558421, -1, -6.751202, 0, -0.5, 0.5, 0.5,
-4.558421, -1, -6.751202, 1, -0.5, 0.5, 0.5,
-4.558421, -1, -6.751202, 1, 1.5, 0.5, 0.5,
-4.558421, -1, -6.751202, 0, 1.5, 0.5, 0.5,
-4.558421, 0, -6.751202, 0, -0.5, 0.5, 0.5,
-4.558421, 0, -6.751202, 1, -0.5, 0.5, 0.5,
-4.558421, 0, -6.751202, 1, 1.5, 0.5, 0.5,
-4.558421, 0, -6.751202, 0, 1.5, 0.5, 0.5,
-4.558421, 1, -6.751202, 0, -0.5, 0.5, 0.5,
-4.558421, 1, -6.751202, 1, -0.5, 0.5, 0.5,
-4.558421, 1, -6.751202, 1, 1.5, 0.5, 0.5,
-4.558421, 1, -6.751202, 0, 1.5, 0.5, 0.5,
-4.558421, 2, -6.751202, 0, -0.5, 0.5, 0.5,
-4.558421, 2, -6.751202, 1, -0.5, 0.5, 0.5,
-4.558421, 2, -6.751202, 1, 1.5, 0.5, 0.5,
-4.558421, 2, -6.751202, 0, 1.5, 0.5, 0.5,
-4.558421, 3, -6.751202, 0, -0.5, 0.5, 0.5,
-4.558421, 3, -6.751202, 1, -0.5, 0.5, 0.5,
-4.558421, 3, -6.751202, 1, 1.5, 0.5, 0.5,
-4.558421, 3, -6.751202, 0, 1.5, 0.5, 0.5
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
-4.000365, -3.225861, -4,
-4.000365, -3.225861, 6,
-4.000365, -3.225861, -4,
-4.186383, -3.38781, -4,
-4.000365, -3.225861, -2,
-4.186383, -3.38781, -2,
-4.000365, -3.225861, 0,
-4.186383, -3.38781, 0,
-4.000365, -3.225861, 2,
-4.186383, -3.38781, 2,
-4.000365, -3.225861, 4,
-4.186383, -3.38781, 4,
-4.000365, -3.225861, 6,
-4.186383, -3.38781, 6
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
-4.558421, -3.711709, -4, 0, -0.5, 0.5, 0.5,
-4.558421, -3.711709, -4, 1, -0.5, 0.5, 0.5,
-4.558421, -3.711709, -4, 1, 1.5, 0.5, 0.5,
-4.558421, -3.711709, -4, 0, 1.5, 0.5, 0.5,
-4.558421, -3.711709, -2, 0, -0.5, 0.5, 0.5,
-4.558421, -3.711709, -2, 1, -0.5, 0.5, 0.5,
-4.558421, -3.711709, -2, 1, 1.5, 0.5, 0.5,
-4.558421, -3.711709, -2, 0, 1.5, 0.5, 0.5,
-4.558421, -3.711709, 0, 0, -0.5, 0.5, 0.5,
-4.558421, -3.711709, 0, 1, -0.5, 0.5, 0.5,
-4.558421, -3.711709, 0, 1, 1.5, 0.5, 0.5,
-4.558421, -3.711709, 0, 0, 1.5, 0.5, 0.5,
-4.558421, -3.711709, 2, 0, -0.5, 0.5, 0.5,
-4.558421, -3.711709, 2, 1, -0.5, 0.5, 0.5,
-4.558421, -3.711709, 2, 1, 1.5, 0.5, 0.5,
-4.558421, -3.711709, 2, 0, 1.5, 0.5, 0.5,
-4.558421, -3.711709, 4, 0, -0.5, 0.5, 0.5,
-4.558421, -3.711709, 4, 1, -0.5, 0.5, 0.5,
-4.558421, -3.711709, 4, 1, 1.5, 0.5, 0.5,
-4.558421, -3.711709, 4, 0, 1.5, 0.5, 0.5,
-4.558421, -3.711709, 6, 0, -0.5, 0.5, 0.5,
-4.558421, -3.711709, 6, 1, -0.5, 0.5, 0.5,
-4.558421, -3.711709, 6, 1, 1.5, 0.5, 0.5,
-4.558421, -3.711709, 6, 0, 1.5, 0.5, 0.5
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
-4.000365, -3.225861, -5.760465,
-4.000365, 3.252106, -5.760465,
-4.000365, -3.225861, 7.449363,
-4.000365, 3.252106, 7.449363,
-4.000365, -3.225861, -5.760465,
-4.000365, -3.225861, 7.449363,
-4.000365, 3.252106, -5.760465,
-4.000365, 3.252106, 7.449363,
-4.000365, -3.225861, -5.760465,
3.440378, -3.225861, -5.760465,
-4.000365, -3.225861, 7.449363,
3.440378, -3.225861, 7.449363,
-4.000365, 3.252106, -5.760465,
3.440378, 3.252106, -5.760465,
-4.000365, 3.252106, 7.449363,
3.440378, 3.252106, 7.449363,
3.440378, -3.225861, -5.760465,
3.440378, 3.252106, -5.760465,
3.440378, -3.225861, 7.449363,
3.440378, 3.252106, 7.449363,
3.440378, -3.225861, -5.760465,
3.440378, -3.225861, 7.449363,
3.440378, 3.252106, -5.760465,
3.440378, 3.252106, 7.449363
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
var radius = 8.803853;
var distance = 39.16933;
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
mvMatrix.translate( 0.2799933, -0.01312244, -0.8444493 );
mvMatrix.scale( 1.279294, 1.469427, 0.7205921 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -39.16933);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
sulfate<-read.table("sulfate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sulfate$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulfate' not found
```

```r
y<-sulfate$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulfate' not found
```

```r
z<-sulfate$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulfate' not found
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
-3.892004, 1.334075, -1.156281, 0, 0, 1, 1, 1,
-2.896047, -1.113093, -0.9370534, 1, 0, 0, 1, 1,
-2.876613, -0.7458544, -2.04304, 1, 0, 0, 1, 1,
-2.81178, -1.158784, -2.164723, 1, 0, 0, 1, 1,
-2.809933, 0.03801192, -0.9607624, 1, 0, 0, 1, 1,
-2.805423, 2.484641, -0.3085399, 1, 0, 0, 1, 1,
-2.688111, 1.700597, -0.06362534, 0, 0, 0, 1, 1,
-2.613115, -0.4120249, -2.503278, 0, 0, 0, 1, 1,
-2.578816, -1.732578, -2.167024, 0, 0, 0, 1, 1,
-2.47851, -0.3155719, -0.8373247, 0, 0, 0, 1, 1,
-2.461333, 0.5227889, -1.287549, 0, 0, 0, 1, 1,
-2.391162, -0.2438787, -3.235934, 0, 0, 0, 1, 1,
-2.369344, 2.867194, -1.070137, 0, 0, 0, 1, 1,
-2.256945, 0.5779362, -1.737981, 1, 1, 1, 1, 1,
-2.239442, 0.3556751, -0.462809, 1, 1, 1, 1, 1,
-2.237565, -0.3717631, -0.9900729, 1, 1, 1, 1, 1,
-2.232128, 0.2187751, -1.00088, 1, 1, 1, 1, 1,
-2.229439, -0.7153974, -2.270907, 1, 1, 1, 1, 1,
-2.174811, 0.5854676, -1.344365, 1, 1, 1, 1, 1,
-2.120489, 0.8533028, -1.988108, 1, 1, 1, 1, 1,
-2.053125, 0.09081977, -0.6433974, 1, 1, 1, 1, 1,
-2.053035, -0.07789036, -1.914692, 1, 1, 1, 1, 1,
-2.043273, -1.086379, -1.559098, 1, 1, 1, 1, 1,
-2.042105, 0.702723, 0.1101702, 1, 1, 1, 1, 1,
-1.986193, -0.1925251, -1.56168, 1, 1, 1, 1, 1,
-1.985659, -1.69219, -1.117242, 1, 1, 1, 1, 1,
-1.972536, 0.05557994, -3.024301, 1, 1, 1, 1, 1,
-1.967995, -1.754367, -2.361105, 1, 1, 1, 1, 1,
-1.948034, 1.162976, 0.655013, 0, 0, 1, 1, 1,
-1.946294, 0.1736682, -0.6301204, 1, 0, 0, 1, 1,
-1.893275, 1.685801, 0.2923769, 1, 0, 0, 1, 1,
-1.869355, -0.5029499, -2.246696, 1, 0, 0, 1, 1,
-1.86775, -1.120524, -3.495274, 1, 0, 0, 1, 1,
-1.855533, -0.06153788, -2.531002, 1, 0, 0, 1, 1,
-1.845265, 0.01456758, -2.274353, 0, 0, 0, 1, 1,
-1.801065, -0.1825791, 0.1924437, 0, 0, 0, 1, 1,
-1.787814, -0.8900267, -0.5661722, 0, 0, 0, 1, 1,
-1.761304, -1.391207, -1.192008, 0, 0, 0, 1, 1,
-1.742478, -1.268947, -1.751215, 0, 0, 0, 1, 1,
-1.71812, 2.60788, -0.06511333, 0, 0, 0, 1, 1,
-1.705574, -0.8789368, -2.370112, 0, 0, 0, 1, 1,
-1.68372, -0.8503247, -1.463696, 1, 1, 1, 1, 1,
-1.673621, -0.2655451, -0.9838817, 1, 1, 1, 1, 1,
-1.673017, 0.1507035, -0.3582483, 1, 1, 1, 1, 1,
-1.671748, -0.621551, -3.100284, 1, 1, 1, 1, 1,
-1.665965, 0.4715995, -0.5315675, 1, 1, 1, 1, 1,
-1.647302, -0.2400816, -1.454743, 1, 1, 1, 1, 1,
-1.62662, -0.6101761, -2.295334, 1, 1, 1, 1, 1,
-1.622037, 1.079037, -1.79467, 1, 1, 1, 1, 1,
-1.602771, 2.057039, -0.9614606, 1, 1, 1, 1, 1,
-1.598086, -0.7261974, -2.461357, 1, 1, 1, 1, 1,
-1.596841, 0.06516219, -2.198054, 1, 1, 1, 1, 1,
-1.584791, 0.6829197, -1.612817, 1, 1, 1, 1, 1,
-1.584358, 2.18013, -0.2472641, 1, 1, 1, 1, 1,
-1.579855, -0.1245989, -0.3979076, 1, 1, 1, 1, 1,
-1.570426, -0.1808616, -0.9683647, 1, 1, 1, 1, 1,
-1.560285, 0.7584496, -1.203217, 0, 0, 1, 1, 1,
-1.559411, 0.3053942, -1.436244, 1, 0, 0, 1, 1,
-1.557081, -0.4134226, -1.856382, 1, 0, 0, 1, 1,
-1.555082, 0.9157632, 0.0900992, 1, 0, 0, 1, 1,
-1.53208, -1.389374, -3.107254, 1, 0, 0, 1, 1,
-1.525711, -0.6827448, -2.638892, 1, 0, 0, 1, 1,
-1.512905, -0.1924348, -3.08158, 0, 0, 0, 1, 1,
-1.506459, 0.2865367, -0.6442128, 0, 0, 0, 1, 1,
-1.505078, 1.631857, -0.3212203, 0, 0, 0, 1, 1,
-1.499511, -1.93307, -0.4294512, 0, 0, 0, 1, 1,
-1.497813, 1.036069, -1.24985, 0, 0, 0, 1, 1,
-1.479909, 0.3765951, -2.618368, 0, 0, 0, 1, 1,
-1.473578, -1.662049, -2.027587, 0, 0, 0, 1, 1,
-1.470689, 0.02093704, -0.9388124, 1, 1, 1, 1, 1,
-1.45129, -0.4443612, -1.316282, 1, 1, 1, 1, 1,
-1.410458, -2.143513, 0.3424453, 1, 1, 1, 1, 1,
-1.401273, 1.192144, -0.06023125, 1, 1, 1, 1, 1,
-1.400786, -1.378457, -1.967134, 1, 1, 1, 1, 1,
-1.3926, -1.75358, -2.534611, 1, 1, 1, 1, 1,
-1.389194, -1.294449, -1.727866, 1, 1, 1, 1, 1,
-1.381544, -1.036797, -4.056529, 1, 1, 1, 1, 1,
-1.373966, 1.065344, -0.2546333, 1, 1, 1, 1, 1,
-1.356574, 0.5985801, -0.856198, 1, 1, 1, 1, 1,
-1.351563, 0.9656989, -0.3171296, 1, 1, 1, 1, 1,
-1.344746, 1.919911, -0.6403217, 1, 1, 1, 1, 1,
-1.337946, -0.9447009, -2.872667, 1, 1, 1, 1, 1,
-1.336965, 1.204621, -1.661173, 1, 1, 1, 1, 1,
-1.334336, -0.07206695, -0.7905598, 1, 1, 1, 1, 1,
-1.329823, -2.079665, -1.135365, 0, 0, 1, 1, 1,
-1.324458, 0.8463135, 1.116864, 1, 0, 0, 1, 1,
-1.324445, 0.108752, -0.6193769, 1, 0, 0, 1, 1,
-1.313077, -0.7970127, -3.276749, 1, 0, 0, 1, 1,
-1.310033, 1.491911, -0.4088714, 1, 0, 0, 1, 1,
-1.302499, 1.064843, -0.5469118, 1, 0, 0, 1, 1,
-1.288292, 1.394371, -2.281526, 0, 0, 0, 1, 1,
-1.272489, 0.8528125, -2.633194, 0, 0, 0, 1, 1,
-1.270862, -1.709768, -2.341773, 0, 0, 0, 1, 1,
-1.27027, 0.3556707, -0.1752197, 0, 0, 0, 1, 1,
-1.269189, 0.2980345, -1.63511, 0, 0, 0, 1, 1,
-1.267034, 0.1059779, -2.362867, 0, 0, 0, 1, 1,
-1.265974, -1.75488, -4.292458, 0, 0, 0, 1, 1,
-1.257049, 0.4442388, -0.7978528, 1, 1, 1, 1, 1,
-1.256853, 0.510807, -1.863941, 1, 1, 1, 1, 1,
-1.252909, 0.07874926, -2.098269, 1, 1, 1, 1, 1,
-1.250684, 0.8896732, -1.853092, 1, 1, 1, 1, 1,
-1.248428, 1.608573, 0.899724, 1, 1, 1, 1, 1,
-1.240609, -0.9388415, -2.69572, 1, 1, 1, 1, 1,
-1.233857, -0.6884947, -2.515467, 1, 1, 1, 1, 1,
-1.231761, 1.170817, -0.681829, 1, 1, 1, 1, 1,
-1.231366, 0.9879475, 1.597493, 1, 1, 1, 1, 1,
-1.231184, -0.1114059, -0.3585145, 1, 1, 1, 1, 1,
-1.226958, 1.163069, -1.044241, 1, 1, 1, 1, 1,
-1.219575, -0.746532, -3.084535, 1, 1, 1, 1, 1,
-1.20978, -0.02822044, -0.7261052, 1, 1, 1, 1, 1,
-1.20722, -0.5432642, -0.9210849, 1, 1, 1, 1, 1,
-1.201001, 1.003741, 0.653416, 1, 1, 1, 1, 1,
-1.194857, 1.758616, -1.551317, 0, 0, 1, 1, 1,
-1.19436, 0.8596305, -1.485174, 1, 0, 0, 1, 1,
-1.187146, 0.988256, -1.444903, 1, 0, 0, 1, 1,
-1.177714, -0.7001032, -1.933697, 1, 0, 0, 1, 1,
-1.177509, 0.518259, -1.318254, 1, 0, 0, 1, 1,
-1.171884, -0.09498878, -2.320946, 1, 0, 0, 1, 1,
-1.167515, 1.647337, -0.8314762, 0, 0, 0, 1, 1,
-1.162403, 0.5328681, -1.26105, 0, 0, 0, 1, 1,
-1.154667, 0.2798695, -0.1638917, 0, 0, 0, 1, 1,
-1.152347, 0.5226147, -0.7752053, 0, 0, 0, 1, 1,
-1.15125, -1.653513, -2.056638, 0, 0, 0, 1, 1,
-1.150303, -0.6108571, -5.071053, 0, 0, 0, 1, 1,
-1.141379, 0.3716052, -1.774864, 0, 0, 0, 1, 1,
-1.139043, -1.259247, -3.658882, 1, 1, 1, 1, 1,
-1.13588, 0.07042664, -0.6973767, 1, 1, 1, 1, 1,
-1.131623, 0.1088002, -0.9685525, 1, 1, 1, 1, 1,
-1.131222, -2.000179, -3.128263, 1, 1, 1, 1, 1,
-1.128013, 0.04279748, -1.316843, 1, 1, 1, 1, 1,
-1.12747, 1.580742, -1.165531, 1, 1, 1, 1, 1,
-1.118874, -1.779277, -1.722086, 1, 1, 1, 1, 1,
-1.116372, 1.231288, -1.483755, 1, 1, 1, 1, 1,
-1.108795, -0.8689983, -3.188111, 1, 1, 1, 1, 1,
-1.102608, -0.06507614, -2.098391, 1, 1, 1, 1, 1,
-1.098283, 0.7543356, -1.318989, 1, 1, 1, 1, 1,
-1.089727, -1.462993, -2.760823, 1, 1, 1, 1, 1,
-1.082853, 0.2089986, -0.8004337, 1, 1, 1, 1, 1,
-1.082256, 0.5358981, -0.4570314, 1, 1, 1, 1, 1,
-1.072855, -1.121151, -2.878461, 1, 1, 1, 1, 1,
-1.072779, -1.369658, -2.397659, 0, 0, 1, 1, 1,
-1.071005, -2.216891, -1.589109, 1, 0, 0, 1, 1,
-1.069299, 0.7248837, -0.2107449, 1, 0, 0, 1, 1,
-1.053151, -1.139085, -0.9415486, 1, 0, 0, 1, 1,
-1.051048, -0.1203734, -2.476218, 1, 0, 0, 1, 1,
-1.050143, 0.7863536, -1.273941, 1, 0, 0, 1, 1,
-1.049301, -0.6552498, -2.995451, 0, 0, 0, 1, 1,
-1.04574, 1.974744, -0.2510805, 0, 0, 0, 1, 1,
-1.04305, -1.680268, -2.76928, 0, 0, 0, 1, 1,
-1.043011, -0.8735202, -0.40778, 0, 0, 0, 1, 1,
-1.041172, 0.6129094, 0.1299724, 0, 0, 0, 1, 1,
-1.039931, 1.651303, -0.9413254, 0, 0, 0, 1, 1,
-1.037629, 0.9574742, -2.203711, 0, 0, 0, 1, 1,
-1.034669, 1.060538, -2.458849, 1, 1, 1, 1, 1,
-1.03348, 0.92106, 0.2344404, 1, 1, 1, 1, 1,
-1.028672, -0.9595432, -3.799196, 1, 1, 1, 1, 1,
-1.027901, 1.636221, -0.251779, 1, 1, 1, 1, 1,
-1.024223, -0.2155591, -3.074252, 1, 1, 1, 1, 1,
-1.019122, -0.6823252, -2.910842, 1, 1, 1, 1, 1,
-1.01534, 0.2094784, -2.971281, 1, 1, 1, 1, 1,
-1.012738, -0.1519585, -1.827456, 1, 1, 1, 1, 1,
-1.007213, 1.266136, 2.317474, 1, 1, 1, 1, 1,
-0.9996307, 1.932367, 0.3894912, 1, 1, 1, 1, 1,
-0.9926735, -0.989767, -4.098298, 1, 1, 1, 1, 1,
-0.9800247, 2.15514, -0.9666853, 1, 1, 1, 1, 1,
-0.9685048, -1.879176, -3.089857, 1, 1, 1, 1, 1,
-0.9680637, -0.7053142, -1.703041, 1, 1, 1, 1, 1,
-0.9589331, -0.5821264, -1.566228, 1, 1, 1, 1, 1,
-0.9554198, -0.9787272, -4.350449, 0, 0, 1, 1, 1,
-0.9548482, -1.169193, -1.04244, 1, 0, 0, 1, 1,
-0.9547067, 0.10255, -1.186285, 1, 0, 0, 1, 1,
-0.9538933, 0.02306428, -0.3812583, 1, 0, 0, 1, 1,
-0.9519155, 1.57879, -0.615305, 1, 0, 0, 1, 1,
-0.9448403, 0.6901072, -0.2504974, 1, 0, 0, 1, 1,
-0.9422463, -1.681801, -2.340438, 0, 0, 0, 1, 1,
-0.9396676, 1.967908, -1.620144, 0, 0, 0, 1, 1,
-0.9383253, -0.1405586, -1.200613, 0, 0, 0, 1, 1,
-0.9339322, 0.612792, -1.225827, 0, 0, 0, 1, 1,
-0.9330732, 1.342657, -0.575336, 0, 0, 0, 1, 1,
-0.9289595, -0.2323792, -1.507141, 0, 0, 0, 1, 1,
-0.9273874, 0.2865393, -3.351554, 0, 0, 0, 1, 1,
-0.9262896, -0.2059295, -1.671717, 1, 1, 1, 1, 1,
-0.9239048, -0.6402965, -1.307319, 1, 1, 1, 1, 1,
-0.9224256, -0.5933318, -4.289601, 1, 1, 1, 1, 1,
-0.916721, -1.222641, -1.460889, 1, 1, 1, 1, 1,
-0.9106973, 0.280611, -1.765969, 1, 1, 1, 1, 1,
-0.9090064, -0.1657816, -2.231324, 1, 1, 1, 1, 1,
-0.908722, -0.491331, -1.512296, 1, 1, 1, 1, 1,
-0.9086319, -0.4982883, -2.438124, 1, 1, 1, 1, 1,
-0.9076102, 0.6709168, -0.6511022, 1, 1, 1, 1, 1,
-0.9045001, 1.040305, 0.1068529, 1, 1, 1, 1, 1,
-0.9039172, -1.720653, -2.643148, 1, 1, 1, 1, 1,
-0.8974531, -0.7280248, -3.68267, 1, 1, 1, 1, 1,
-0.8959128, -1.673287, -3.56035, 1, 1, 1, 1, 1,
-0.8806937, 0.974583, -2.131696, 1, 1, 1, 1, 1,
-0.876832, -0.4604568, -3.010653, 1, 1, 1, 1, 1,
-0.8709396, -1.266968, -2.827261, 0, 0, 1, 1, 1,
-0.863132, 0.03940415, -1.081281, 1, 0, 0, 1, 1,
-0.8598328, 0.2651893, -1.096235, 1, 0, 0, 1, 1,
-0.8551008, 0.6676987, -0.9559288, 1, 0, 0, 1, 1,
-0.8506036, -1.954618, -3.171049, 1, 0, 0, 1, 1,
-0.8412684, -0.1971619, -2.545643, 1, 0, 0, 1, 1,
-0.8392395, -0.6008346, -0.6174668, 0, 0, 0, 1, 1,
-0.8388067, -0.2103363, -2.413247, 0, 0, 0, 1, 1,
-0.8306677, -0.5084907, -2.850399, 0, 0, 0, 1, 1,
-0.8223975, 0.3881835, -1.181769, 0, 0, 0, 1, 1,
-0.8220353, -1.948337, -1.983808, 0, 0, 0, 1, 1,
-0.8133005, -0.4076985, -1.055269, 0, 0, 0, 1, 1,
-0.8123189, -0.8266913, -1.933084, 0, 0, 0, 1, 1,
-0.8074787, -0.3825926, -0.08715425, 1, 1, 1, 1, 1,
-0.7956671, -0.1712004, -1.412352, 1, 1, 1, 1, 1,
-0.7949644, 0.2210899, -2.740279, 1, 1, 1, 1, 1,
-0.7932911, -0.1902169, -3.095782, 1, 1, 1, 1, 1,
-0.7927288, -0.4810356, -2.459736, 1, 1, 1, 1, 1,
-0.7881595, 0.06962889, -2.251652, 1, 1, 1, 1, 1,
-0.7812077, -0.1113645, -3.223904, 1, 1, 1, 1, 1,
-0.7797903, 2.012506, 0.05454438, 1, 1, 1, 1, 1,
-0.7780951, 1.271857, -2.369057, 1, 1, 1, 1, 1,
-0.7779757, -1.900383, -3.965074, 1, 1, 1, 1, 1,
-0.7636112, -0.6363601, -3.077352, 1, 1, 1, 1, 1,
-0.7518808, -0.797006, -3.392228, 1, 1, 1, 1, 1,
-0.7470981, 0.7521897, -1.830135, 1, 1, 1, 1, 1,
-0.7445645, -1.17942, -1.183457, 1, 1, 1, 1, 1,
-0.7438598, -0.569215, -2.316027, 1, 1, 1, 1, 1,
-0.7258189, -0.9530941, -2.742776, 0, 0, 1, 1, 1,
-0.7255098, 2.151381, -0.8863647, 1, 0, 0, 1, 1,
-0.722891, 0.4241222, -1.097603, 1, 0, 0, 1, 1,
-0.7227594, 0.4669013, 0.4604889, 1, 0, 0, 1, 1,
-0.7196625, -0.01336169, -1.09819, 1, 0, 0, 1, 1,
-0.7186139, -0.6212704, -1.889851, 1, 0, 0, 1, 1,
-0.7185745, -0.7389563, -1.511163, 0, 0, 0, 1, 1,
-0.7161101, -0.002496651, 1.332687, 0, 0, 0, 1, 1,
-0.6838816, 2.054261, 0.734381, 0, 0, 0, 1, 1,
-0.6806105, -1.391606, -2.710284, 0, 0, 0, 1, 1,
-0.6781487, -1.080102, -3.41542, 0, 0, 0, 1, 1,
-0.6775445, -2.217467, -2.322012, 0, 0, 0, 1, 1,
-0.6767534, -0.1432447, -0.429054, 0, 0, 0, 1, 1,
-0.6765164, -1.610283, -2.974443, 1, 1, 1, 1, 1,
-0.6746007, 0.60006, 0.738304, 1, 1, 1, 1, 1,
-0.6706559, 3.067878, 0.351674, 1, 1, 1, 1, 1,
-0.6620486, 0.4076231, 0.004785526, 1, 1, 1, 1, 1,
-0.6594276, -0.438303, -2.371516, 1, 1, 1, 1, 1,
-0.6585369, -0.05102325, -1.197067, 1, 1, 1, 1, 1,
-0.658381, 1.446271, 0.3176388, 1, 1, 1, 1, 1,
-0.6576223, -0.2166653, -1.328927, 1, 1, 1, 1, 1,
-0.6527306, 0.04114258, -0.5025933, 1, 1, 1, 1, 1,
-0.6442081, 0.1221032, -1.236223, 1, 1, 1, 1, 1,
-0.6369089, 1.619878, 0.3022818, 1, 1, 1, 1, 1,
-0.6319467, 0.8089765, -1.208476, 1, 1, 1, 1, 1,
-0.6311442, -0.6506367, -3.865115, 1, 1, 1, 1, 1,
-0.6279941, 3.122591, 0.6612208, 1, 1, 1, 1, 1,
-0.6210806, -0.9294348, -3.647912, 1, 1, 1, 1, 1,
-0.6141924, -1.629334, -2.710624, 0, 0, 1, 1, 1,
-0.6133774, 1.724573, 0.4266718, 1, 0, 0, 1, 1,
-0.6126661, -0.7952339, -2.074766, 1, 0, 0, 1, 1,
-0.6109363, 0.7090369, -2.217703, 1, 0, 0, 1, 1,
-0.6104254, 1.583859, -1.911107, 1, 0, 0, 1, 1,
-0.6091306, 0.2980907, -1.987392, 1, 0, 0, 1, 1,
-0.6060258, -1.474665, -1.688405, 0, 0, 0, 1, 1,
-0.5944027, 1.753417, 0.2389664, 0, 0, 0, 1, 1,
-0.5936103, 0.6873639, -1.023979, 0, 0, 0, 1, 1,
-0.592706, -0.510649, -2.132007, 0, 0, 0, 1, 1,
-0.5916893, 0.9409258, -1.136787, 0, 0, 0, 1, 1,
-0.5915828, -0.1022211, 0.4265294, 0, 0, 0, 1, 1,
-0.5886836, 0.481025, 0.6359043, 0, 0, 0, 1, 1,
-0.5871609, 0.7762409, 0.04656606, 1, 1, 1, 1, 1,
-0.5794789, -0.3240568, -3.861726, 1, 1, 1, 1, 1,
-0.5693808, 0.2336997, -3.894123, 1, 1, 1, 1, 1,
-0.5667815, -0.4971131, -1.709514, 1, 1, 1, 1, 1,
-0.5652056, -0.7241529, -1.546239, 1, 1, 1, 1, 1,
-0.5577539, 0.5897634, -0.6867098, 1, 1, 1, 1, 1,
-0.5555775, 0.523869, -0.5819902, 1, 1, 1, 1, 1,
-0.5522183, -1.19342, -1.725003, 1, 1, 1, 1, 1,
-0.544513, -0.5261856, -2.149769, 1, 1, 1, 1, 1,
-0.5429522, -1.209649, -3.725588, 1, 1, 1, 1, 1,
-0.5345104, 0.6032877, -2.133052, 1, 1, 1, 1, 1,
-0.5336239, 0.1106335, -0.6314456, 1, 1, 1, 1, 1,
-0.5334986, -1.884346, -2.934794, 1, 1, 1, 1, 1,
-0.532724, 0.7732405, 0.9221725, 1, 1, 1, 1, 1,
-0.5299662, -0.7057343, -3.07017, 1, 1, 1, 1, 1,
-0.5288798, 1.450683, 0.8885918, 0, 0, 1, 1, 1,
-0.5258455, -1.021879, -1.393816, 1, 0, 0, 1, 1,
-0.5257959, 1.627865, 0.03309538, 1, 0, 0, 1, 1,
-0.5256184, 0.0236099, -3.011862, 1, 0, 0, 1, 1,
-0.5250214, 0.1439754, -3.398931, 1, 0, 0, 1, 1,
-0.521865, 1.561199, -1.391302, 1, 0, 0, 1, 1,
-0.5216808, -1.899098, -2.432474, 0, 0, 0, 1, 1,
-0.5204397, 0.4539304, -0.01484457, 0, 0, 0, 1, 1,
-0.5089602, 0.008516151, -2.133387, 0, 0, 0, 1, 1,
-0.5070149, -0.4650782, -3.361212, 0, 0, 0, 1, 1,
-0.5026904, 0.2404327, -1.041553, 0, 0, 0, 1, 1,
-0.4990901, -0.171628, -0.7485926, 0, 0, 0, 1, 1,
-0.4956785, 0.1126876, -2.028527, 0, 0, 0, 1, 1,
-0.4954296, 0.4508824, -1.529901, 1, 1, 1, 1, 1,
-0.4882536, -0.4710787, -1.558243, 1, 1, 1, 1, 1,
-0.4790882, -0.2911875, -1.996714, 1, 1, 1, 1, 1,
-0.4784794, -0.3772455, -3.626589, 1, 1, 1, 1, 1,
-0.4689702, -0.5604647, -3.655919, 1, 1, 1, 1, 1,
-0.4616264, -0.3700792, -1.951301, 1, 1, 1, 1, 1,
-0.4603043, 0.1011659, -1.172334, 1, 1, 1, 1, 1,
-0.4543518, 0.1000116, -1.727515, 1, 1, 1, 1, 1,
-0.4541643, -0.1318432, -1.801795, 1, 1, 1, 1, 1,
-0.4516879, -0.9330008, -2.779786, 1, 1, 1, 1, 1,
-0.4506665, 0.6330214, -0.6490837, 1, 1, 1, 1, 1,
-0.4492506, 0.2113436, -3.145531, 1, 1, 1, 1, 1,
-0.4390984, 0.06999312, -1.780149, 1, 1, 1, 1, 1,
-0.4384758, 1.357632, -0.3695511, 1, 1, 1, 1, 1,
-0.4353337, 0.04360407, -3.471248, 1, 1, 1, 1, 1,
-0.4344651, -1.545079, -3.260107, 0, 0, 1, 1, 1,
-0.4329427, -2.197724, -2.84149, 1, 0, 0, 1, 1,
-0.4307355, -0.4010632, -2.291293, 1, 0, 0, 1, 1,
-0.4279376, -2.752632, -3.618581, 1, 0, 0, 1, 1,
-0.4267398, -1.206382, -2.729042, 1, 0, 0, 1, 1,
-0.4262439, -0.3397901, -1.588348, 1, 0, 0, 1, 1,
-0.4260641, 0.1844404, -2.343302, 0, 0, 0, 1, 1,
-0.4204372, 1.338395, -0.05779586, 0, 0, 0, 1, 1,
-0.4189861, 1.15708, 0.5829308, 0, 0, 0, 1, 1,
-0.4152257, -0.3394504, -2.142353, 0, 0, 0, 1, 1,
-0.4127769, 1.820519, -0.3554648, 0, 0, 0, 1, 1,
-0.4112186, -1.206484, -1.545053, 0, 0, 0, 1, 1,
-0.4093909, 0.7478077, 0.5282763, 0, 0, 0, 1, 1,
-0.4068623, 1.93419, 0.7555962, 1, 1, 1, 1, 1,
-0.4025036, 1.197863, 1.340479, 1, 1, 1, 1, 1,
-0.3947835, 0.7043298, -0.9338124, 1, 1, 1, 1, 1,
-0.3935752, -1.696796, -3.288728, 1, 1, 1, 1, 1,
-0.3873659, 1.50969, -0.669934, 1, 1, 1, 1, 1,
-0.383375, -0.3836168, -2.013024, 1, 1, 1, 1, 1,
-0.383176, -0.204093, -2.401039, 1, 1, 1, 1, 1,
-0.3811935, -0.07437369, -0.9310067, 1, 1, 1, 1, 1,
-0.3802772, -0.2791548, -3.589117, 1, 1, 1, 1, 1,
-0.3723083, -0.7514588, -2.16489, 1, 1, 1, 1, 1,
-0.3705335, -0.8420829, -4.464408, 1, 1, 1, 1, 1,
-0.3704417, 1.108682, 0.06940283, 1, 1, 1, 1, 1,
-0.3702111, 1.321473, -2.424598, 1, 1, 1, 1, 1,
-0.3688164, -0.4393554, -2.086707, 1, 1, 1, 1, 1,
-0.3674616, -1.053361, -4.093451, 1, 1, 1, 1, 1,
-0.363922, -1.61011, -2.241517, 0, 0, 1, 1, 1,
-0.3636442, 3.157767, -2.642684, 1, 0, 0, 1, 1,
-0.3620704, -0.572779, -1.451787, 1, 0, 0, 1, 1,
-0.3593635, 0.6228953, -0.9554917, 1, 0, 0, 1, 1,
-0.3563712, -2.918661, -2.415138, 1, 0, 0, 1, 1,
-0.3534133, 0.07771707, -1.361855, 1, 0, 0, 1, 1,
-0.352833, 0.8363494, 0.5290099, 0, 0, 0, 1, 1,
-0.3492922, -0.2774022, -1.361469, 0, 0, 0, 1, 1,
-0.3454436, -0.3432507, -2.306388, 0, 0, 0, 1, 1,
-0.3441506, -0.09540218, -2.657854, 0, 0, 0, 1, 1,
-0.3420719, -0.2326871, -2.652408, 0, 0, 0, 1, 1,
-0.3411142, -1.552651, -2.463611, 0, 0, 0, 1, 1,
-0.3410977, -0.01685201, -1.831474, 0, 0, 0, 1, 1,
-0.3395223, 0.2482384, -1.767299, 1, 1, 1, 1, 1,
-0.3392699, 0.1295023, -1.724221, 1, 1, 1, 1, 1,
-0.3386833, 0.5297751, -0.1952743, 1, 1, 1, 1, 1,
-0.3384567, -1.114104, -3.15222, 1, 1, 1, 1, 1,
-0.3381913, -1.09503, -2.923669, 1, 1, 1, 1, 1,
-0.3297288, -0.08030903, -3.177437, 1, 1, 1, 1, 1,
-0.329241, -0.3150219, -1.854264, 1, 1, 1, 1, 1,
-0.3266935, -1.285561, -1.879768, 1, 1, 1, 1, 1,
-0.3248647, 0.4923246, 1.470976, 1, 1, 1, 1, 1,
-0.3244091, -1.222789, -2.346117, 1, 1, 1, 1, 1,
-0.3225638, -0.5662326, -3.40325, 1, 1, 1, 1, 1,
-0.3210039, -0.1191922, -0.787752, 1, 1, 1, 1, 1,
-0.3190419, 0.2082747, -1.317654, 1, 1, 1, 1, 1,
-0.3172266, 0.3481736, -2.713088, 1, 1, 1, 1, 1,
-0.3154146, 0.06898317, -1.161783, 1, 1, 1, 1, 1,
-0.3147689, -1.119753, -1.683698, 0, 0, 1, 1, 1,
-0.3073803, 0.8159165, -1.285033, 1, 0, 0, 1, 1,
-0.3064165, -0.9590023, -2.850159, 1, 0, 0, 1, 1,
-0.3027436, -0.1569004, -2.049018, 1, 0, 0, 1, 1,
-0.3017326, -0.8544062, -0.929261, 1, 0, 0, 1, 1,
-0.301175, -0.7144317, -1.649096, 1, 0, 0, 1, 1,
-0.2989781, 0.7053985, 0.3606307, 0, 0, 0, 1, 1,
-0.2982392, 1.171481, 0.4475865, 0, 0, 0, 1, 1,
-0.2942929, 1.866359, 0.4804175, 0, 0, 0, 1, 1,
-0.2872828, 0.44935, -1.826671, 0, 0, 0, 1, 1,
-0.2856074, 1.600417, -1.613922, 0, 0, 0, 1, 1,
-0.2819947, -0.5458832, -2.563218, 0, 0, 0, 1, 1,
-0.2778015, -2.224988, -3.448859, 0, 0, 0, 1, 1,
-0.2771552, 1.747722, -0.2450386, 1, 1, 1, 1, 1,
-0.2764985, 0.3060104, -1.212554, 1, 1, 1, 1, 1,
-0.2698069, -0.2578904, -3.789985, 1, 1, 1, 1, 1,
-0.2696081, 0.9062319, -0.54411, 1, 1, 1, 1, 1,
-0.2667506, 0.7695729, 1.465564, 1, 1, 1, 1, 1,
-0.2632369, 0.6464909, -0.08103293, 1, 1, 1, 1, 1,
-0.2631837, -0.5442317, -1.878176, 1, 1, 1, 1, 1,
-0.254039, 1.181397, 0.4923597, 1, 1, 1, 1, 1,
-0.253574, 2.407573, -0.4246671, 1, 1, 1, 1, 1,
-0.2528885, -1.377568, -2.905572, 1, 1, 1, 1, 1,
-0.2512631, 1.160526, 1.531368, 1, 1, 1, 1, 1,
-0.2502743, 0.6852359, -1.059446, 1, 1, 1, 1, 1,
-0.2474718, -1.374559, -0.3995683, 1, 1, 1, 1, 1,
-0.244733, -0.9971955, -1.159901, 1, 1, 1, 1, 1,
-0.2445461, 1.397034, -0.6206432, 1, 1, 1, 1, 1,
-0.2433422, -0.2260703, -3.415769, 0, 0, 1, 1, 1,
-0.239811, 0.121956, 1.322299, 1, 0, 0, 1, 1,
-0.2396321, -0.7191011, -3.294638, 1, 0, 0, 1, 1,
-0.2385136, -0.4446405, -2.999605, 1, 0, 0, 1, 1,
-0.2381078, -1.695252, -2.148776, 1, 0, 0, 1, 1,
-0.2331745, 0.007401009, -1.599435, 1, 0, 0, 1, 1,
-0.2300017, 0.9811428, -0.9028006, 0, 0, 0, 1, 1,
-0.2277963, -0.4525566, -1.752716, 0, 0, 0, 1, 1,
-0.2215351, 1.347417, -0.5383261, 0, 0, 0, 1, 1,
-0.2188398, 0.3502296, -1.089503, 0, 0, 0, 1, 1,
-0.2109087, 1.58383, 1.307864, 0, 0, 0, 1, 1,
-0.2078669, -0.9136709, -3.030455, 0, 0, 0, 1, 1,
-0.206752, 0.5205787, -0.9792213, 0, 0, 0, 1, 1,
-0.2056494, 0.03447546, -0.3729796, 1, 1, 1, 1, 1,
-0.2054064, -0.4872648, -2.506231, 1, 1, 1, 1, 1,
-0.2015269, -0.09570599, -2.822721, 1, 1, 1, 1, 1,
-0.1985376, 1.621405, -0.5634221, 1, 1, 1, 1, 1,
-0.1978724, 0.7617233, -0.297828, 1, 1, 1, 1, 1,
-0.1958767, -2.698601, -4.514589, 1, 1, 1, 1, 1,
-0.1944232, -1.819259, -1.639622, 1, 1, 1, 1, 1,
-0.1937338, -0.2076662, -1.094327, 1, 1, 1, 1, 1,
-0.1926496, 0.6399321, 0.8077374, 1, 1, 1, 1, 1,
-0.1865882, -0.3502123, -1.85589, 1, 1, 1, 1, 1,
-0.1836288, 2.215765, 0.4070902, 1, 1, 1, 1, 1,
-0.1829089, 0.8626519, 2.641944, 1, 1, 1, 1, 1,
-0.1817217, -0.1704458, -2.38436, 1, 1, 1, 1, 1,
-0.1806868, -0.1339028, -1.37748, 1, 1, 1, 1, 1,
-0.1787815, 0.4013608, -0.7693394, 1, 1, 1, 1, 1,
-0.1775539, 0.5962321, 1.502652, 0, 0, 1, 1, 1,
-0.1761373, -0.3358069, -2.788434, 1, 0, 0, 1, 1,
-0.1731842, 0.7432528, 0.1164588, 1, 0, 0, 1, 1,
-0.165493, 0.2435517, -0.3467996, 1, 0, 0, 1, 1,
-0.1639516, -0.6293531, -2.544417, 1, 0, 0, 1, 1,
-0.1635868, 0.894467, -0.6601096, 1, 0, 0, 1, 1,
-0.1629972, -0.1240112, -2.404355, 0, 0, 0, 1, 1,
-0.1539808, 0.2361358, -1.089727, 0, 0, 0, 1, 1,
-0.1528194, -1.138265, -4.415621, 0, 0, 0, 1, 1,
-0.1501886, 0.1186852, -0.7229768, 0, 0, 0, 1, 1,
-0.1482936, -0.01241629, -0.4246375, 0, 0, 0, 1, 1,
-0.1447637, 0.08340985, -1.449597, 0, 0, 0, 1, 1,
-0.1433435, -0.2563254, -3.407395, 0, 0, 0, 1, 1,
-0.1431073, 1.43275, -0.4154079, 1, 1, 1, 1, 1,
-0.1387804, 1.277687, -0.8161092, 1, 1, 1, 1, 1,
-0.136996, 0.1366378, -0.338839, 1, 1, 1, 1, 1,
-0.134807, 0.6310151, -0.8869686, 1, 1, 1, 1, 1,
-0.1285494, -1.184889, -2.795768, 1, 1, 1, 1, 1,
-0.122904, -2.484403, -2.901205, 1, 1, 1, 1, 1,
-0.1198972, -1.230445, -3.535964, 1, 1, 1, 1, 1,
-0.1073641, 0.9354959, -0.8892372, 1, 1, 1, 1, 1,
-0.1062565, 0.4209783, -1.072695, 1, 1, 1, 1, 1,
-0.1034419, 0.4560535, 0.7255899, 1, 1, 1, 1, 1,
-0.1033863, 0.5171412, 0.474485, 1, 1, 1, 1, 1,
-0.1029678, 0.2084049, -0.4765193, 1, 1, 1, 1, 1,
-0.1023951, 0.7539081, 0.1721166, 1, 1, 1, 1, 1,
-0.09959309, -0.2458957, -2.433409, 1, 1, 1, 1, 1,
-0.09795311, 1.773765, -0.4572456, 1, 1, 1, 1, 1,
-0.09779081, -1.585356, -4.511618, 0, 0, 1, 1, 1,
-0.09505861, -0.5319622, -2.756036, 1, 0, 0, 1, 1,
-0.0919257, -0.9701539, -2.058429, 1, 0, 0, 1, 1,
-0.08597673, 0.8467152, -0.274767, 1, 0, 0, 1, 1,
-0.08549187, -0.3727464, -3.28608, 1, 0, 0, 1, 1,
-0.08128351, 0.4037297, -2.415382, 1, 0, 0, 1, 1,
-0.07978908, -0.4346344, -2.7094, 0, 0, 0, 1, 1,
-0.07966588, 0.02508754, -1.584515, 0, 0, 0, 1, 1,
-0.07946236, 0.8477249, 1.480352, 0, 0, 0, 1, 1,
-0.07556622, -1.210146, -2.313541, 0, 0, 0, 1, 1,
-0.0741601, 1.769822, -1.265468, 0, 0, 0, 1, 1,
-0.07159133, -0.1326282, -1.907089, 0, 0, 0, 1, 1,
-0.07061128, 0.7642887, 1.714651, 0, 0, 0, 1, 1,
-0.06884901, 1.562839, -1.097013, 1, 1, 1, 1, 1,
-0.0665583, 1.123445, 0.5786849, 1, 1, 1, 1, 1,
-0.0623557, 1.551974, 1.454535, 1, 1, 1, 1, 1,
-0.05955585, -0.965511, -1.806119, 1, 1, 1, 1, 1,
-0.05407313, 0.5147252, -0.05998047, 1, 1, 1, 1, 1,
-0.05172545, -0.7560509, -2.878307, 1, 1, 1, 1, 1,
-0.04927829, 0.7333282, -0.8563322, 1, 1, 1, 1, 1,
-0.04837352, -0.7223502, -3.009415, 1, 1, 1, 1, 1,
-0.0482704, 0.2970226, 0.6850597, 1, 1, 1, 1, 1,
-0.04673287, -0.5094383, -2.548086, 1, 1, 1, 1, 1,
-0.04665902, -0.1780422, -2.834364, 1, 1, 1, 1, 1,
-0.04345263, -0.966304, -3.057793, 1, 1, 1, 1, 1,
-0.0385262, -0.6449957, -2.100904, 1, 1, 1, 1, 1,
-0.03720723, 0.6651188, -0.5999328, 1, 1, 1, 1, 1,
-0.03118891, -0.6204317, -3.793111, 1, 1, 1, 1, 1,
-0.02489848, -0.3456574, -4.404858, 0, 0, 1, 1, 1,
-0.02366633, -0.2041916, -3.317389, 1, 0, 0, 1, 1,
-0.02282855, 0.7950937, -0.3037037, 1, 0, 0, 1, 1,
-0.01986405, 0.009397564, -0.9320819, 1, 0, 0, 1, 1,
-0.01041524, 1.170255, 0.4437533, 1, 0, 0, 1, 1,
-0.00797099, -0.139699, -3.736764, 1, 0, 0, 1, 1,
-0.003532946, -0.6168848, -2.239897, 0, 0, 0, 1, 1,
-0.002518215, 0.721659, -0.6635423, 0, 0, 0, 1, 1,
-0.0008105721, -0.07383778, -5.568089, 0, 0, 0, 1, 1,
0.003575725, -0.3199554, 1.735081, 0, 0, 0, 1, 1,
0.006676954, 0.6253129, 0.7417994, 0, 0, 0, 1, 1,
0.007149346, 0.3552637, 0.3397318, 0, 0, 0, 1, 1,
0.01269851, -0.9298173, 4.014169, 0, 0, 0, 1, 1,
0.01370954, -1.530386, 2.690126, 1, 1, 1, 1, 1,
0.01675053, 1.425487, 1.00871, 1, 1, 1, 1, 1,
0.01882983, -0.8866256, 3.030023, 1, 1, 1, 1, 1,
0.01951424, -1.196464, 3.295246, 1, 1, 1, 1, 1,
0.01978661, -0.05212918, 3.53521, 1, 1, 1, 1, 1,
0.02112722, -2.085066, 3.850636, 1, 1, 1, 1, 1,
0.02178827, -0.1526554, 1.600503, 1, 1, 1, 1, 1,
0.02619586, -0.468425, 3.188645, 1, 1, 1, 1, 1,
0.03241955, -1.28074, 3.671839, 1, 1, 1, 1, 1,
0.03447086, -0.8542497, 2.565015, 1, 1, 1, 1, 1,
0.03584662, -0.9280577, 2.301901, 1, 1, 1, 1, 1,
0.04211466, -0.1387465, 3.157041, 1, 1, 1, 1, 1,
0.04235816, -0.08723, 1.559633, 1, 1, 1, 1, 1,
0.04280988, -0.6182918, 1.750207, 1, 1, 1, 1, 1,
0.04425302, -0.2116556, 3.723219, 1, 1, 1, 1, 1,
0.04572004, 1.002293, -0.6294343, 0, 0, 1, 1, 1,
0.04856154, -1.965192, 0.5928882, 1, 0, 0, 1, 1,
0.0564676, 0.3258065, -0.005888828, 1, 0, 0, 1, 1,
0.05916186, -0.5580764, 2.527959, 1, 0, 0, 1, 1,
0.0628773, 0.6876358, 1.119324, 1, 0, 0, 1, 1,
0.06527558, -0.03226515, 2.323029, 1, 0, 0, 1, 1,
0.06658626, 2.08318, 0.35888, 0, 0, 0, 1, 1,
0.06696505, -1.605898, 3.240019, 0, 0, 0, 1, 1,
0.0699349, -0.3195311, 2.58248, 0, 0, 0, 1, 1,
0.07244337, -0.3895513, 3.244431, 0, 0, 0, 1, 1,
0.07362497, 1.005669, -2.08408, 0, 0, 0, 1, 1,
0.0759979, 1.76987, 1.821214, 0, 0, 0, 1, 1,
0.08344788, 0.5911484, -0.7814681, 0, 0, 0, 1, 1,
0.0849333, -0.06509291, 1.791184, 1, 1, 1, 1, 1,
0.09063463, 0.7529219, 1.661878, 1, 1, 1, 1, 1,
0.0912728, -0.9229494, 4.092885, 1, 1, 1, 1, 1,
0.0935058, -1.379736, 3.668688, 1, 1, 1, 1, 1,
0.09554362, 1.533607, -2.254841, 1, 1, 1, 1, 1,
0.0961356, -0.5601118, 0.6270054, 1, 1, 1, 1, 1,
0.09678319, 0.2728777, 1.059933, 1, 1, 1, 1, 1,
0.1016125, 0.2414079, 0.5955586, 1, 1, 1, 1, 1,
0.104482, 0.9474397, 1.604893, 1, 1, 1, 1, 1,
0.104941, -0.09701519, 0.6517878, 1, 1, 1, 1, 1,
0.1054748, 0.2167711, 1.056142, 1, 1, 1, 1, 1,
0.1106379, 1.32778, 0.225131, 1, 1, 1, 1, 1,
0.1115958, 0.01271807, 0.9124137, 1, 1, 1, 1, 1,
0.1123141, -0.2322566, 3.5046, 1, 1, 1, 1, 1,
0.1147122, 0.9028682, -0.4668056, 1, 1, 1, 1, 1,
0.1258274, 1.040819, -0.3567795, 0, 0, 1, 1, 1,
0.1277411, 0.07181062, 0.3701743, 1, 0, 0, 1, 1,
0.129261, -1.348296, 3.578883, 1, 0, 0, 1, 1,
0.1295311, 2.227115, 0.02104452, 1, 0, 0, 1, 1,
0.1320534, 1.559047, 1.003541, 1, 0, 0, 1, 1,
0.133942, 0.197156, 0.01466756, 1, 0, 0, 1, 1,
0.1371644, -0.1105974, 3.314818, 0, 0, 0, 1, 1,
0.1399299, -0.4832115, 2.431828, 0, 0, 0, 1, 1,
0.1402517, 1.162226, -0.1817587, 0, 0, 0, 1, 1,
0.1428266, -1.26718, 2.650385, 0, 0, 0, 1, 1,
0.1464647, 1.465142, 1.35307, 0, 0, 0, 1, 1,
0.1488842, 0.5465022, 1.016307, 0, 0, 0, 1, 1,
0.1494746, 0.4205427, 0.1083328, 0, 0, 0, 1, 1,
0.1527477, -2.937774, 1.741548, 1, 1, 1, 1, 1,
0.1536126, -1.462147, 2.678116, 1, 1, 1, 1, 1,
0.1546835, 0.7446374, -0.294484, 1, 1, 1, 1, 1,
0.1550093, -0.3560579, 2.302105, 1, 1, 1, 1, 1,
0.1551121, 1.478042, -0.8194766, 1, 1, 1, 1, 1,
0.1590078, -0.4297758, 3.260267, 1, 1, 1, 1, 1,
0.1637736, 1.418391, -0.9406364, 1, 1, 1, 1, 1,
0.1642274, 1.208066, 1.568252, 1, 1, 1, 1, 1,
0.1649136, -1.415843, 1.941688, 1, 1, 1, 1, 1,
0.1669962, 0.5571002, 1.401461, 1, 1, 1, 1, 1,
0.1684066, -0.7090302, 3.102303, 1, 1, 1, 1, 1,
0.1728291, -1.092128, 3.885585, 1, 1, 1, 1, 1,
0.1730306, 1.084192, 0.3576828, 1, 1, 1, 1, 1,
0.174871, -0.678194, 3.418387, 1, 1, 1, 1, 1,
0.1770473, -1.413876, 5.628244, 1, 1, 1, 1, 1,
0.178375, -0.9091246, 3.613816, 0, 0, 1, 1, 1,
0.1815611, 0.4532394, -0.4693962, 1, 0, 0, 1, 1,
0.1817254, -0.9120491, 1.490443, 1, 0, 0, 1, 1,
0.1822686, 0.9107206, 0.04591586, 1, 0, 0, 1, 1,
0.1893555, -0.8318786, 1.512825, 1, 0, 0, 1, 1,
0.1898741, 1.096133, 0.5942808, 1, 0, 0, 1, 1,
0.1935269, 0.02495751, 1.189953, 0, 0, 0, 1, 1,
0.1974689, -0.01211198, 3.063616, 0, 0, 0, 1, 1,
0.1988248, -1.257762, 1.040194, 0, 0, 0, 1, 1,
0.199629, 0.4147342, -0.5558751, 0, 0, 0, 1, 1,
0.1998428, -0.4542693, 3.239823, 0, 0, 0, 1, 1,
0.20362, -0.02293525, 1.59156, 0, 0, 0, 1, 1,
0.2066957, 0.1642441, 1.693493, 0, 0, 0, 1, 1,
0.2099999, -0.7948446, 2.631009, 1, 1, 1, 1, 1,
0.2115863, 0.2515422, 1.325651, 1, 1, 1, 1, 1,
0.212586, -0.8268812, 1.129722, 1, 1, 1, 1, 1,
0.2135132, -0.09483662, 0.9960617, 1, 1, 1, 1, 1,
0.2145205, -0.1356117, 3.088046, 1, 1, 1, 1, 1,
0.2151998, 0.1455915, 0.274388, 1, 1, 1, 1, 1,
0.216092, -1.612652, 1.712106, 1, 1, 1, 1, 1,
0.2163019, 0.5356942, -0.3619549, 1, 1, 1, 1, 1,
0.2212411, 1.494874, -0.09174667, 1, 1, 1, 1, 1,
0.2234562, 0.8657027, 0.8486728, 1, 1, 1, 1, 1,
0.2279054, -1.316045, 4.135892, 1, 1, 1, 1, 1,
0.2332739, -0.8204494, 2.806597, 1, 1, 1, 1, 1,
0.2335377, -0.5493756, 7.256987, 1, 1, 1, 1, 1,
0.237958, -1.723873, 2.486848, 1, 1, 1, 1, 1,
0.2392583, -0.961167, 1.457631, 1, 1, 1, 1, 1,
0.2395528, -1.051337, 4.871102, 0, 0, 1, 1, 1,
0.2418908, -1.686375, 0.75157, 1, 0, 0, 1, 1,
0.2427434, 1.043635, 1.903499, 1, 0, 0, 1, 1,
0.2444618, -1.888959, 2.730069, 1, 0, 0, 1, 1,
0.2478857, -0.13198, 0.2528844, 1, 0, 0, 1, 1,
0.2491233, -0.4584964, 3.306601, 1, 0, 0, 1, 1,
0.2497064, 0.8228295, 1.620137, 0, 0, 0, 1, 1,
0.2538267, -0.8365117, 2.3362, 0, 0, 0, 1, 1,
0.258489, 1.281274, -1.879164, 0, 0, 0, 1, 1,
0.2671018, -1.072079, 3.056182, 0, 0, 0, 1, 1,
0.2709933, 0.9396854, 0.356274, 0, 0, 0, 1, 1,
0.2728344, -1.075276, 2.498731, 0, 0, 0, 1, 1,
0.2748595, 1.078987, -0.1444077, 0, 0, 0, 1, 1,
0.2753264, 0.2408798, 1.324258, 1, 1, 1, 1, 1,
0.2758053, 0.09264971, -0.109642, 1, 1, 1, 1, 1,
0.2808871, 0.1669281, 0.6303111, 1, 1, 1, 1, 1,
0.2815332, 0.2576197, 0.6212488, 1, 1, 1, 1, 1,
0.2864538, 0.4492754, 1.830673, 1, 1, 1, 1, 1,
0.2872714, -0.8028671, 1.338107, 1, 1, 1, 1, 1,
0.2883471, 0.8468664, -0.3046716, 1, 1, 1, 1, 1,
0.290186, -0.2448671, 0.8406336, 1, 1, 1, 1, 1,
0.2903417, 1.760554, 0.8708305, 1, 1, 1, 1, 1,
0.2930183, -1.273769, 3.468416, 1, 1, 1, 1, 1,
0.2994808, 1.121459, 1.649578, 1, 1, 1, 1, 1,
0.3006621, -0.354568, 3.739687, 1, 1, 1, 1, 1,
0.3067141, -0.31927, 2.245341, 1, 1, 1, 1, 1,
0.3122496, 0.3533242, -0.98901, 1, 1, 1, 1, 1,
0.3171165, -0.193632, 4.550762, 1, 1, 1, 1, 1,
0.3216569, -3.131522, 4.704893, 0, 0, 1, 1, 1,
0.3257275, -0.3426728, 1.561103, 1, 0, 0, 1, 1,
0.3271558, -0.4687024, 2.582686, 1, 0, 0, 1, 1,
0.3327381, -0.05892081, 0.9460981, 1, 0, 0, 1, 1,
0.3393829, -0.1708499, 2.151976, 1, 0, 0, 1, 1,
0.3400669, 1.226398, 1.106871, 1, 0, 0, 1, 1,
0.3410291, -1.659084, 2.914093, 0, 0, 0, 1, 1,
0.3421079, -0.9805193, 3.866898, 0, 0, 0, 1, 1,
0.3422008, -0.8767312, 1.768955, 0, 0, 0, 1, 1,
0.3425994, -0.1446327, 0.7910172, 0, 0, 0, 1, 1,
0.346039, -1.468133, 2.773236, 0, 0, 0, 1, 1,
0.3486181, 0.1433928, 0.5578324, 0, 0, 0, 1, 1,
0.3615811, 0.2973713, 1.558489, 0, 0, 0, 1, 1,
0.3630202, -0.6146029, 2.058923, 1, 1, 1, 1, 1,
0.3632006, 0.4216808, 3.349138, 1, 1, 1, 1, 1,
0.3636333, 0.18708, 1.619277, 1, 1, 1, 1, 1,
0.366076, -1.443107, 1.625887, 1, 1, 1, 1, 1,
0.3689665, -0.770948, 2.462506, 1, 1, 1, 1, 1,
0.3835361, -0.7792128, 1.142548, 1, 1, 1, 1, 1,
0.3847016, 1.142412, -0.4619429, 1, 1, 1, 1, 1,
0.3888435, 1.385808, -0.2203984, 1, 1, 1, 1, 1,
0.3942345, -0.923399, 1.901677, 1, 1, 1, 1, 1,
0.3956273, 0.0005204977, 0.9295674, 1, 1, 1, 1, 1,
0.3961704, 1.437539, 1.367997, 1, 1, 1, 1, 1,
0.3969149, -1.295235, 3.022489, 1, 1, 1, 1, 1,
0.4003201, 0.1474336, -0.2789295, 1, 1, 1, 1, 1,
0.4017968, 2.933116, 2.314328, 1, 1, 1, 1, 1,
0.4028921, 1.674872, 0.3987206, 1, 1, 1, 1, 1,
0.4041436, -1.218044, 3.188755, 0, 0, 1, 1, 1,
0.4060608, -0.6183177, 3.135647, 1, 0, 0, 1, 1,
0.4077345, -1.098901, 4.758914, 1, 0, 0, 1, 1,
0.4109893, -0.4864284, 3.847678, 1, 0, 0, 1, 1,
0.415744, -0.9186627, 1.54727, 1, 0, 0, 1, 1,
0.4161026, 0.5302641, -0.2718111, 1, 0, 0, 1, 1,
0.4164483, 0.4838448, 2.703052, 0, 0, 0, 1, 1,
0.4188227, 1.424049, 1.255706, 0, 0, 0, 1, 1,
0.4225305, -0.03350661, 2.247019, 0, 0, 0, 1, 1,
0.4259211, 0.7825018, 0.3202193, 0, 0, 0, 1, 1,
0.4289074, -1.639067, 2.891611, 0, 0, 0, 1, 1,
0.4320108, 0.08270136, 2.970695, 0, 0, 0, 1, 1,
0.4322138, -0.3020879, 2.048715, 0, 0, 0, 1, 1,
0.4325665, 0.1003179, 2.098651, 1, 1, 1, 1, 1,
0.433399, 1.969981, 1.175921, 1, 1, 1, 1, 1,
0.436711, -0.9449349, 2.401788, 1, 1, 1, 1, 1,
0.4441464, 0.1403436, 1.173294, 1, 1, 1, 1, 1,
0.4441888, 1.617471, -1.07952, 1, 1, 1, 1, 1,
0.4477082, 0.9167519, 1.699956, 1, 1, 1, 1, 1,
0.4483847, 1.019237, 1.224306, 1, 1, 1, 1, 1,
0.4513451, 1.219289, 0.968394, 1, 1, 1, 1, 1,
0.4518465, 0.1978814, 2.375482, 1, 1, 1, 1, 1,
0.4576773, -0.2814477, 2.1027, 1, 1, 1, 1, 1,
0.4644386, -0.22468, 2.126606, 1, 1, 1, 1, 1,
0.4671492, -0.8772804, 3.347898, 1, 1, 1, 1, 1,
0.467154, -0.4731864, 1.906408, 1, 1, 1, 1, 1,
0.4677571, -1.383779, 3.344655, 1, 1, 1, 1, 1,
0.4691274, 0.7567214, 1.564835, 1, 1, 1, 1, 1,
0.4704832, 0.6654642, 1.324869, 0, 0, 1, 1, 1,
0.4722674, 0.5404034, -0.1389752, 1, 0, 0, 1, 1,
0.4747841, 0.9025643, 1.167535, 1, 0, 0, 1, 1,
0.4767409, -0.9807025, 2.068859, 1, 0, 0, 1, 1,
0.48048, 1.015134, -0.0588133, 1, 0, 0, 1, 1,
0.480546, 1.470497, 1.400004, 1, 0, 0, 1, 1,
0.4834961, -2.231179, 4.461991, 0, 0, 0, 1, 1,
0.4848241, -1.755486, 2.856962, 0, 0, 0, 1, 1,
0.4887962, -1.674562, 2.44951, 0, 0, 0, 1, 1,
0.5028387, 1.383321, -0.3880883, 0, 0, 0, 1, 1,
0.5056481, -0.2097914, 1.054387, 0, 0, 0, 1, 1,
0.5064729, 1.155367, -0.6109629, 0, 0, 0, 1, 1,
0.5074797, 0.1844808, 3.515965, 0, 0, 0, 1, 1,
0.5094644, 1.202988, 1.626996, 1, 1, 1, 1, 1,
0.5127444, 0.1794704, 2.499711, 1, 1, 1, 1, 1,
0.5132228, 0.9744896, 0.347357, 1, 1, 1, 1, 1,
0.5213234, -0.2809969, 2.653615, 1, 1, 1, 1, 1,
0.5223523, 0.4996535, 0.8415005, 1, 1, 1, 1, 1,
0.5276306, 0.3810005, 0.4652971, 1, 1, 1, 1, 1,
0.5330244, -0.09567461, 2.721494, 1, 1, 1, 1, 1,
0.5358281, -1.12052, 2.168064, 1, 1, 1, 1, 1,
0.5476314, -0.6522765, 3.097055, 1, 1, 1, 1, 1,
0.5499461, -1.685773, 2.148963, 1, 1, 1, 1, 1,
0.5501177, -0.5753673, 1.898142, 1, 1, 1, 1, 1,
0.5567437, 0.5770862, -0.7011684, 1, 1, 1, 1, 1,
0.5594904, 0.8977624, 1.2162, 1, 1, 1, 1, 1,
0.5636573, -0.3677979, 6.166782, 1, 1, 1, 1, 1,
0.5648246, 0.4039705, 1.595622, 1, 1, 1, 1, 1,
0.5655353, -0.4220818, 3.659177, 0, 0, 1, 1, 1,
0.5669661, -0.2996962, 1.410813, 1, 0, 0, 1, 1,
0.5716746, -0.7612192, 2.15544, 1, 0, 0, 1, 1,
0.5722319, -1.307705, 2.431824, 1, 0, 0, 1, 1,
0.5723091, 0.1518439, 0.9279681, 1, 0, 0, 1, 1,
0.5774716, 1.22848, -0.1018295, 1, 0, 0, 1, 1,
0.5826326, 0.7731501, -0.1641671, 0, 0, 0, 1, 1,
0.5882654, 1.653317, 0.03564346, 0, 0, 0, 1, 1,
0.5906793, -0.5420157, 2.816068, 0, 0, 0, 1, 1,
0.5931959, -1.257257, 2.812914, 0, 0, 0, 1, 1,
0.5956396, -0.0860686, 3.698789, 0, 0, 0, 1, 1,
0.5963995, 0.389842, -0.6647645, 0, 0, 0, 1, 1,
0.5976582, 1.033889, 0.6893013, 0, 0, 0, 1, 1,
0.6010666, 0.5350654, -0.5153004, 1, 1, 1, 1, 1,
0.601213, -0.9353561, 1.76166, 1, 1, 1, 1, 1,
0.6017154, 0.3421026, 1.103809, 1, 1, 1, 1, 1,
0.6026106, 1.411132, -0.5485092, 1, 1, 1, 1, 1,
0.6043906, 0.136381, 1.701439, 1, 1, 1, 1, 1,
0.6055582, -0.7028266, 2.841231, 1, 1, 1, 1, 1,
0.6108826, -0.845238, 3.367131, 1, 1, 1, 1, 1,
0.6126532, 0.9942973, -0.23883, 1, 1, 1, 1, 1,
0.6126946, 0.301304, 0.5459246, 1, 1, 1, 1, 1,
0.6135724, -2.017108, 2.504969, 1, 1, 1, 1, 1,
0.6145279, 0.770727, -0.2581102, 1, 1, 1, 1, 1,
0.6150027, -0.5890741, 0.9791613, 1, 1, 1, 1, 1,
0.620764, -0.6205379, 2.822714, 1, 1, 1, 1, 1,
0.6219003, 0.1807636, 1.677058, 1, 1, 1, 1, 1,
0.629502, -0.3021161, 0.922886, 1, 1, 1, 1, 1,
0.6306182, 2.442024, -0.0659979, 0, 0, 1, 1, 1,
0.6337609, -0.2539762, 0.4644656, 1, 0, 0, 1, 1,
0.6380103, -1.347024, 2.850591, 1, 0, 0, 1, 1,
0.639465, -0.5372749, 2.405041, 1, 0, 0, 1, 1,
0.6445363, -1.45523, 1.737427, 1, 0, 0, 1, 1,
0.6491529, -0.7398279, 2.959646, 1, 0, 0, 1, 1,
0.6505682, -2.542014, 3.334779, 0, 0, 0, 1, 1,
0.6522849, -0.2662127, 1.598643, 0, 0, 0, 1, 1,
0.6556437, 0.7230501, 2.905817, 0, 0, 0, 1, 1,
0.6597496, -0.8736317, 2.661137, 0, 0, 0, 1, 1,
0.6614587, -0.08511081, 1.687063, 0, 0, 0, 1, 1,
0.6647851, -0.09887905, 1.432918, 0, 0, 0, 1, 1,
0.6651701, 0.105545, 1.341617, 0, 0, 0, 1, 1,
0.6651838, -0.5848951, 0.3892474, 1, 1, 1, 1, 1,
0.6657065, -1.438472, 3.559194, 1, 1, 1, 1, 1,
0.670415, -0.08265646, 2.969008, 1, 1, 1, 1, 1,
0.6731935, -0.5146714, 1.751911, 1, 1, 1, 1, 1,
0.6736115, -0.4550412, 2.883167, 1, 1, 1, 1, 1,
0.6770582, 0.09641588, 1.66682, 1, 1, 1, 1, 1,
0.6777177, 0.5017032, 1.717816, 1, 1, 1, 1, 1,
0.6810356, -1.927241, 2.032245, 1, 1, 1, 1, 1,
0.6854057, 2.755704, -0.9206843, 1, 1, 1, 1, 1,
0.6861562, 0.82552, 0.428706, 1, 1, 1, 1, 1,
0.6882253, -0.8101142, 3.219685, 1, 1, 1, 1, 1,
0.6884287, 0.6586229, -0.3867373, 1, 1, 1, 1, 1,
0.6910202, -0.1836038, 1.143973, 1, 1, 1, 1, 1,
0.6981847, 1.46403, 0.2954789, 1, 1, 1, 1, 1,
0.7000242, 0.1184268, 0.2513871, 1, 1, 1, 1, 1,
0.7014921, 0.3300078, 1.047173, 0, 0, 1, 1, 1,
0.7071656, -1.378945, 3.006464, 1, 0, 0, 1, 1,
0.7073478, 0.2614948, 1.068535, 1, 0, 0, 1, 1,
0.7217091, 0.4542652, 1.549233, 1, 0, 0, 1, 1,
0.7231222, 0.7132903, 3.081559, 1, 0, 0, 1, 1,
0.72438, 1.099109, -1.059396, 1, 0, 0, 1, 1,
0.7296906, -1.61156, 4.014682, 0, 0, 0, 1, 1,
0.7334929, 1.563108, 1.8941, 0, 0, 0, 1, 1,
0.7369663, 0.5351117, -0.162337, 0, 0, 0, 1, 1,
0.7411974, -0.01320255, 1.761582, 0, 0, 0, 1, 1,
0.7446378, 0.5599506, -0.03316321, 0, 0, 0, 1, 1,
0.74884, 0.6604941, 1.052133, 0, 0, 0, 1, 1,
0.7511932, -0.05015702, 2.612244, 0, 0, 0, 1, 1,
0.751398, -0.2058462, 2.325554, 1, 1, 1, 1, 1,
0.7528273, 1.318386, -0.07039336, 1, 1, 1, 1, 1,
0.7564124, -0.2110195, 2.04749, 1, 1, 1, 1, 1,
0.7579578, 0.1643656, 1.478105, 1, 1, 1, 1, 1,
0.7666422, -0.6786831, 2.679662, 1, 1, 1, 1, 1,
0.7777934, 0.7790382, -0.6412009, 1, 1, 1, 1, 1,
0.7857324, -0.5108621, 3.03005, 1, 1, 1, 1, 1,
0.7858413, 0.6833432, 0.6847501, 1, 1, 1, 1, 1,
0.7879377, -1.830369, 1.507773, 1, 1, 1, 1, 1,
0.7893878, 0.3838197, 2.129712, 1, 1, 1, 1, 1,
0.7910184, 0.9999375, 1.017701, 1, 1, 1, 1, 1,
0.7913168, 0.526465, 1.753739, 1, 1, 1, 1, 1,
0.7913943, -1.273266, 3.561069, 1, 1, 1, 1, 1,
0.7933805, 0.01129121, 1.391507, 1, 1, 1, 1, 1,
0.7941583, -1.143337, 3.487857, 1, 1, 1, 1, 1,
0.7987147, -0.7826709, 0.9583257, 0, 0, 1, 1, 1,
0.8029611, 0.233191, 1.860877, 1, 0, 0, 1, 1,
0.8032069, -1.16868, 4.242976, 1, 0, 0, 1, 1,
0.80322, 0.7586018, 1.859479, 1, 0, 0, 1, 1,
0.8052099, 0.02761705, 0.4653172, 1, 0, 0, 1, 1,
0.8082593, 1.015618, 0.3191825, 1, 0, 0, 1, 1,
0.8105537, -0.2512842, 1.016709, 0, 0, 0, 1, 1,
0.8155525, -0.3088929, 2.319056, 0, 0, 0, 1, 1,
0.8223029, 1.449747, 3.060532, 0, 0, 0, 1, 1,
0.8317551, 0.5073802, 0.985451, 0, 0, 0, 1, 1,
0.8321406, -0.05857369, 1.531179, 0, 0, 0, 1, 1,
0.8323666, 0.6650188, 0.2612787, 0, 0, 0, 1, 1,
0.8368675, -1.355148, 0.9588068, 0, 0, 0, 1, 1,
0.83979, 0.5278566, 2.94298, 1, 1, 1, 1, 1,
0.84196, -0.5707573, 2.198448, 1, 1, 1, 1, 1,
0.8451192, -0.6559014, 3.08273, 1, 1, 1, 1, 1,
0.8514335, 0.2188167, 1.03335, 1, 1, 1, 1, 1,
0.863104, -0.03204824, 3.831529, 1, 1, 1, 1, 1,
0.8744236, 1.146396, 1.573467, 1, 1, 1, 1, 1,
0.8773429, 1.999024, 0.4386233, 1, 1, 1, 1, 1,
0.8823664, 1.057325, 0.5034508, 1, 1, 1, 1, 1,
0.8852091, -0.7311486, 2.775257, 1, 1, 1, 1, 1,
0.8853518, -0.3806613, 3.215081, 1, 1, 1, 1, 1,
0.8920826, -1.185583, 1.688475, 1, 1, 1, 1, 1,
0.9061857, 2.385107, -0.2813428, 1, 1, 1, 1, 1,
0.9104083, -0.181384, 3.425248, 1, 1, 1, 1, 1,
0.9143046, 0.7486121, 1.623109, 1, 1, 1, 1, 1,
0.92998, 1.770678, 0.06004303, 1, 1, 1, 1, 1,
0.9328938, -0.6056499, 3.577492, 0, 0, 1, 1, 1,
0.9343632, 0.8491329, 0.6751118, 1, 0, 0, 1, 1,
0.9380638, 0.7896034, 1.67224, 1, 0, 0, 1, 1,
0.9403033, -1.161771, 3.099424, 1, 0, 0, 1, 1,
0.9468983, 1.698072, 1.678114, 1, 0, 0, 1, 1,
0.9475005, -0.4754975, 1.711343, 1, 0, 0, 1, 1,
0.948045, -0.05893338, 4.375297, 0, 0, 0, 1, 1,
0.9510482, 0.01279818, 1.57973, 0, 0, 0, 1, 1,
0.9533698, 0.7090201, 1.393855, 0, 0, 0, 1, 1,
0.9668515, -0.2431655, 0.4491189, 0, 0, 0, 1, 1,
0.9684463, -0.05064525, 1.328951, 0, 0, 0, 1, 1,
0.9687635, -0.6452942, 1.299425, 0, 0, 0, 1, 1,
0.9703636, -0.1609897, 0.9692415, 0, 0, 0, 1, 1,
0.9745442, 0.2062856, 1.722445, 1, 1, 1, 1, 1,
0.9760767, -0.2316962, 1.635173, 1, 1, 1, 1, 1,
0.9837557, 0.3451305, 2.077363, 1, 1, 1, 1, 1,
0.9859654, -1.660497, 2.370349, 1, 1, 1, 1, 1,
0.9876917, 2.535711, -0.351863, 1, 1, 1, 1, 1,
0.995421, -0.7729555, 2.877855, 1, 1, 1, 1, 1,
0.9974131, 0.7908937, 1.160742, 1, 1, 1, 1, 1,
1.002236, 1.685357, 1.131826, 1, 1, 1, 1, 1,
1.011198, -0.3324331, 2.974393, 1, 1, 1, 1, 1,
1.011657, -0.121687, 1.788465, 1, 1, 1, 1, 1,
1.01298, -0.3706839, 3.265499, 1, 1, 1, 1, 1,
1.013056, -0.5603797, 1.943936, 1, 1, 1, 1, 1,
1.0139, 1.597927, 0.3085634, 1, 1, 1, 1, 1,
1.014773, 0.3363763, 1.022821, 1, 1, 1, 1, 1,
1.022001, -0.6791137, 0.4424864, 1, 1, 1, 1, 1,
1.026465, 0.8399546, -0.4718981, 0, 0, 1, 1, 1,
1.027454, 1.725692, 2.174893, 1, 0, 0, 1, 1,
1.039288, -0.7102801, 3.644109, 1, 0, 0, 1, 1,
1.039439, -0.7895212, 3.200356, 1, 0, 0, 1, 1,
1.039609, -2.382391, 1.309735, 1, 0, 0, 1, 1,
1.043386, 1.354231, 0.8976786, 1, 0, 0, 1, 1,
1.050533, -0.5802817, 2.533835, 0, 0, 0, 1, 1,
1.05095, 0.07153765, 1.364049, 0, 0, 0, 1, 1,
1.051465, 0.08287565, 1.977254, 0, 0, 0, 1, 1,
1.057387, 0.03970646, 1.329967, 0, 0, 0, 1, 1,
1.057725, 0.3571955, 1.402237, 0, 0, 0, 1, 1,
1.059392, -2.606025, 3.066567, 0, 0, 0, 1, 1,
1.064668, -0.8403221, 1.862974, 0, 0, 0, 1, 1,
1.067142, -0.486126, 1.353494, 1, 1, 1, 1, 1,
1.070742, -1.644869, 3.056919, 1, 1, 1, 1, 1,
1.076168, 0.3708641, 1.430871, 1, 1, 1, 1, 1,
1.078435, 0.7644308, 0.9032999, 1, 1, 1, 1, 1,
1.082808, 0.1183536, 0.5756601, 1, 1, 1, 1, 1,
1.083009, -2.323131, 3.520589, 1, 1, 1, 1, 1,
1.084299, 1.413137, 1.122749, 1, 1, 1, 1, 1,
1.08479, -1.274375, 2.655909, 1, 1, 1, 1, 1,
1.088529, 1.64583, -0.790417, 1, 1, 1, 1, 1,
1.092799, -1.178085, 0.9098278, 1, 1, 1, 1, 1,
1.097423, -0.007821259, 2.185218, 1, 1, 1, 1, 1,
1.105997, -1.010659, 3.001302, 1, 1, 1, 1, 1,
1.111025, 0.01823447, 0.3078427, 1, 1, 1, 1, 1,
1.133877, 0.4647687, 1.488726, 1, 1, 1, 1, 1,
1.157035, -1.157102, 2.094034, 1, 1, 1, 1, 1,
1.157554, 0.2258351, 3.326498, 0, 0, 1, 1, 1,
1.157934, -0.05567979, 1.578045, 1, 0, 0, 1, 1,
1.158602, -0.0002213328, 1.215904, 1, 0, 0, 1, 1,
1.158989, -1.542586, 1.117371, 1, 0, 0, 1, 1,
1.16129, -2.656386, 2.070593, 1, 0, 0, 1, 1,
1.161853, -0.2450707, 2.296109, 1, 0, 0, 1, 1,
1.164074, -1.876441, 3.737987, 0, 0, 0, 1, 1,
1.169498, -1.233484, 3.06139, 0, 0, 0, 1, 1,
1.171638, -0.8707243, 0.1455392, 0, 0, 0, 1, 1,
1.175366, -0.386638, 2.96842, 0, 0, 0, 1, 1,
1.177217, 0.2937415, 0.8456596, 0, 0, 0, 1, 1,
1.180342, 0.2881593, -0.5605268, 0, 0, 0, 1, 1,
1.180708, 1.888181, -0.5649381, 0, 0, 0, 1, 1,
1.185588, 0.2086431, 1.533425, 1, 1, 1, 1, 1,
1.186052, 0.4622748, -1.05615, 1, 1, 1, 1, 1,
1.188255, -0.6768655, 1.368034, 1, 1, 1, 1, 1,
1.189921, -0.1443595, 0.1354, 1, 1, 1, 1, 1,
1.193029, 2.312012, 1.188125, 1, 1, 1, 1, 1,
1.196244, 0.7741359, 0.3745537, 1, 1, 1, 1, 1,
1.202538, -0.8948236, 0.8747042, 1, 1, 1, 1, 1,
1.212719, -2.317786, 2.284467, 1, 1, 1, 1, 1,
1.215658, 0.7330963, 0.6454931, 1, 1, 1, 1, 1,
1.22236, -0.1786701, 0.9621175, 1, 1, 1, 1, 1,
1.223795, 1.373909, 1.078246, 1, 1, 1, 1, 1,
1.224161, -0.3592028, 2.021128, 1, 1, 1, 1, 1,
1.225874, -1.199111, 3.237756, 1, 1, 1, 1, 1,
1.233613, 1.351371, 1.675408, 1, 1, 1, 1, 1,
1.238442, -0.03975732, 2.863712, 1, 1, 1, 1, 1,
1.247141, -0.9626331, 2.129816, 0, 0, 1, 1, 1,
1.25312, 0.3985738, 0.6581696, 1, 0, 0, 1, 1,
1.256947, 1.080511, -0.9616861, 1, 0, 0, 1, 1,
1.257074, -0.8918814, 2.857354, 1, 0, 0, 1, 1,
1.258333, -0.1331048, -0.006686754, 1, 0, 0, 1, 1,
1.279197, -0.1384246, 1.839865, 1, 0, 0, 1, 1,
1.279373, -0.3534537, 0.113136, 0, 0, 0, 1, 1,
1.279435, -0.3257818, 2.567411, 0, 0, 0, 1, 1,
1.284522, -1.310204, 0.01687916, 0, 0, 0, 1, 1,
1.284947, 0.2291929, 2.404436, 0, 0, 0, 1, 1,
1.287891, -0.5746964, 2.653613, 0, 0, 0, 1, 1,
1.291525, -0.4792797, 2.88244, 0, 0, 0, 1, 1,
1.306313, 1.020225, 0.5328135, 0, 0, 0, 1, 1,
1.328514, -0.1974477, 1.53057, 1, 1, 1, 1, 1,
1.32973, -0.06802365, 1.214679, 1, 1, 1, 1, 1,
1.347609, -1.456519, 2.136373, 1, 1, 1, 1, 1,
1.363863, 0.4211719, 0.8240757, 1, 1, 1, 1, 1,
1.366976, -0.9348669, 0.563369, 1, 1, 1, 1, 1,
1.383206, 0.9371563, 0.4221641, 1, 1, 1, 1, 1,
1.38995, 0.0335757, 0.8911903, 1, 1, 1, 1, 1,
1.395985, -0.2024849, 3.596125, 1, 1, 1, 1, 1,
1.408924, 0.109626, 3.116661, 1, 1, 1, 1, 1,
1.412897, -0.9316145, 2.311802, 1, 1, 1, 1, 1,
1.416061, 0.09951406, 1.256668, 1, 1, 1, 1, 1,
1.433484, 0.2866369, 3.312931, 1, 1, 1, 1, 1,
1.435095, -0.6772141, 3.319895, 1, 1, 1, 1, 1,
1.441612, 0.5297295, -0.0148918, 1, 1, 1, 1, 1,
1.456941, 1.549492, 0.6917107, 1, 1, 1, 1, 1,
1.466874, 1.110713, 1.356902, 0, 0, 1, 1, 1,
1.469566, 0.1114016, 1.150848, 1, 0, 0, 1, 1,
1.473293, 0.5197961, 0.4423117, 1, 0, 0, 1, 1,
1.481677, -0.3934601, 1.726617, 1, 0, 0, 1, 1,
1.483613, 0.003309708, -0.0619902, 1, 0, 0, 1, 1,
1.486741, -0.013575, 3.560305, 1, 0, 0, 1, 1,
1.486898, -0.5060521, 1.355706, 0, 0, 0, 1, 1,
1.487813, -1.714535, 3.392834, 0, 0, 0, 1, 1,
1.492043, -0.984822, 1.770944, 0, 0, 0, 1, 1,
1.498786, -1.089974, 2.898139, 0, 0, 0, 1, 1,
1.499181, -0.05300489, 1.015003, 0, 0, 0, 1, 1,
1.504095, -1.43452, 2.723484, 0, 0, 0, 1, 1,
1.507432, -0.5433298, 1.203142, 0, 0, 0, 1, 1,
1.520943, -0.9910703, 1.08469, 1, 1, 1, 1, 1,
1.532104, 0.5306514, 2.092117, 1, 1, 1, 1, 1,
1.537236, 0.1515788, 1.983725, 1, 1, 1, 1, 1,
1.552323, -0.828554, 1.205196, 1, 1, 1, 1, 1,
1.57315, -0.5849848, 3.382226, 1, 1, 1, 1, 1,
1.594103, -0.7309611, 2.026936, 1, 1, 1, 1, 1,
1.603892, 1.026026, 1.32932, 1, 1, 1, 1, 1,
1.635278, 0.3425126, 0.3512258, 1, 1, 1, 1, 1,
1.639849, 0.9712928, -0.4619411, 1, 1, 1, 1, 1,
1.648159, -0.3261348, 3.309505, 1, 1, 1, 1, 1,
1.648434, -0.8110599, 1.749658, 1, 1, 1, 1, 1,
1.654775, 0.1154902, 1.380236, 1, 1, 1, 1, 1,
1.669743, 1.115596, -0.455635, 1, 1, 1, 1, 1,
1.685453, 0.7293314, 0.540522, 1, 1, 1, 1, 1,
1.686166, 0.02275594, 1.58088, 1, 1, 1, 1, 1,
1.688089, -0.3180695, 3.110855, 0, 0, 1, 1, 1,
1.696758, -0.2836979, 2.129291, 1, 0, 0, 1, 1,
1.719482, -1.1384, 0.2900078, 1, 0, 0, 1, 1,
1.725499, 0.9996435, 2.434409, 1, 0, 0, 1, 1,
1.735253, 0.2800331, 1.088941, 1, 0, 0, 1, 1,
1.747529, -0.4011085, 2.243848, 1, 0, 0, 1, 1,
1.75027, 0.209656, 2.128633, 0, 0, 0, 1, 1,
1.753465, 1.079024, 1.262669, 0, 0, 0, 1, 1,
1.826751, 1.444785, 1.636248, 0, 0, 0, 1, 1,
1.850199, -0.2038775, 1.283229, 0, 0, 0, 1, 1,
1.870716, 0.5570686, 0.609264, 0, 0, 0, 1, 1,
1.87175, -1.10531, 0.9565853, 0, 0, 0, 1, 1,
1.87879, -1.070418, 1.367876, 0, 0, 0, 1, 1,
1.894368, -0.08584801, 1.689134, 1, 1, 1, 1, 1,
1.923484, -0.07699933, 2.609927, 1, 1, 1, 1, 1,
1.939229, -0.2906209, 2.769899, 1, 1, 1, 1, 1,
1.939959, -1.268774, 2.455133, 1, 1, 1, 1, 1,
1.95856, -0.2609555, 1.869776, 1, 1, 1, 1, 1,
1.960644, -0.4655446, 2.378657, 1, 1, 1, 1, 1,
1.962624, -1.22304, 4.307738, 1, 1, 1, 1, 1,
1.976146, -1.186183, 2.529663, 1, 1, 1, 1, 1,
1.97929, 0.7233061, 1.104602, 1, 1, 1, 1, 1,
2.005296, 1.445336, 1.450121, 1, 1, 1, 1, 1,
2.021597, 0.5386733, 1.144235, 1, 1, 1, 1, 1,
2.043385, -0.7522371, 3.389546, 1, 1, 1, 1, 1,
2.053737, 0.04955228, 1.373933, 1, 1, 1, 1, 1,
2.075979, -0.349941, 2.443029, 1, 1, 1, 1, 1,
2.091561, -1.917599, 2.433751, 1, 1, 1, 1, 1,
2.123819, -1.412026, 1.317454, 0, 0, 1, 1, 1,
2.187245, -0.5825897, 2.786953, 1, 0, 0, 1, 1,
2.220461, 1.919748, 0.6962609, 1, 0, 0, 1, 1,
2.248576, 0.2874126, -0.2449519, 1, 0, 0, 1, 1,
2.276592, -0.8962143, 2.364298, 1, 0, 0, 1, 1,
2.309253, 0.8772773, 2.432986, 1, 0, 0, 1, 1,
2.40129, -1.598218, 0.6580661, 0, 0, 0, 1, 1,
2.43431, -0.9822599, 2.320093, 0, 0, 0, 1, 1,
2.445584, -0.0306842, 1.325551, 0, 0, 0, 1, 1,
2.563388, 1.651329, -0.246801, 0, 0, 0, 1, 1,
2.585386, 1.09296, 1.293871, 0, 0, 0, 1, 1,
2.612741, 0.4742376, 1.314999, 0, 0, 0, 1, 1,
2.685533, -0.3723776, 2.224458, 0, 0, 0, 1, 1,
2.687931, -0.3378207, 0.08960935, 1, 1, 1, 1, 1,
2.810567, 1.337199, 0.8169753, 1, 1, 1, 1, 1,
2.904891, 0.6949636, -0.4979578, 1, 1, 1, 1, 1,
2.905491, -0.8036334, 2.3447, 1, 1, 1, 1, 1,
2.929202, -0.2298784, 1.44318, 1, 1, 1, 1, 1,
3.276634, -0.09427311, 1.930415, 1, 1, 1, 1, 1,
3.332018, 0.3702998, 1.964623, 1, 1, 1, 1, 1
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
var radius = 10.63049;
var distance = 37.33914;
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
mvMatrix.translate( 0.2799933, -0.01312232, -0.844449 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -37.33914);
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
