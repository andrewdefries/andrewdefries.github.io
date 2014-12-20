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
-2.875587, 0.9795889, -1.956757, 1, 0, 0, 1,
-2.784425, -1.305299, -1.314944, 1, 0.007843138, 0, 1,
-2.679708, 0.7529023, 0.8440882, 1, 0.01176471, 0, 1,
-2.506913, 1.472658, -2.348509, 1, 0.01960784, 0, 1,
-2.408463, 1.415435, 0.05567051, 1, 0.02352941, 0, 1,
-2.379342, -0.9604652, -3.489724, 1, 0.03137255, 0, 1,
-2.331161, -1.168866, -1.775195, 1, 0.03529412, 0, 1,
-2.271778, -0.06634977, -1.864593, 1, 0.04313726, 0, 1,
-2.268025, -0.909658, -2.678023, 1, 0.04705882, 0, 1,
-2.227295, 1.593667, -2.138258, 1, 0.05490196, 0, 1,
-2.210825, -1.26923, -1.637454, 1, 0.05882353, 0, 1,
-2.200732, -2.299809, -1.349252, 1, 0.06666667, 0, 1,
-2.152024, -3.017823, -2.183784, 1, 0.07058824, 0, 1,
-2.120701, 0.2091957, -1.027245, 1, 0.07843138, 0, 1,
-2.104027, 0.2326988, -2.638376, 1, 0.08235294, 0, 1,
-2.077331, -1.968367, -2.133871, 1, 0.09019608, 0, 1,
-2.063249, 1.185129, -1.252491, 1, 0.09411765, 0, 1,
-2.042705, -0.5590358, -1.902528, 1, 0.1019608, 0, 1,
-1.998822, 1.913159, -1.680962, 1, 0.1098039, 0, 1,
-1.970235, 1.560814, -2.503916, 1, 0.1137255, 0, 1,
-1.953471, 0.3278721, -4.40468, 1, 0.1215686, 0, 1,
-1.913684, -0.4744404, -1.568356, 1, 0.1254902, 0, 1,
-1.91131, 0.7197813, -2.037375, 1, 0.1333333, 0, 1,
-1.850108, 0.8486479, -1.470937, 1, 0.1372549, 0, 1,
-1.844548, 0.4870744, -0.754795, 1, 0.145098, 0, 1,
-1.841415, 1.312092, -2.598094, 1, 0.1490196, 0, 1,
-1.830842, -0.4781408, -1.902687, 1, 0.1568628, 0, 1,
-1.822036, -1.226337, -2.347125, 1, 0.1607843, 0, 1,
-1.769853, 0.03462943, -0.896111, 1, 0.1686275, 0, 1,
-1.757783, 0.1133556, -0.9077787, 1, 0.172549, 0, 1,
-1.751133, 0.7243994, 0.2644752, 1, 0.1803922, 0, 1,
-1.739135, -1.056376, -2.374361, 1, 0.1843137, 0, 1,
-1.730976, -0.09350158, -2.14088, 1, 0.1921569, 0, 1,
-1.726916, -1.860926, -3.947895, 1, 0.1960784, 0, 1,
-1.712566, 0.1284851, -1.270791, 1, 0.2039216, 0, 1,
-1.687977, 0.00285287, 0.3159436, 1, 0.2117647, 0, 1,
-1.679016, -1.521063, -0.9830598, 1, 0.2156863, 0, 1,
-1.67787, 2.18868, -2.078872, 1, 0.2235294, 0, 1,
-1.652717, -1.466794, -1.114565, 1, 0.227451, 0, 1,
-1.652472, 0.5364636, 0.005129987, 1, 0.2352941, 0, 1,
-1.64966, -0.06586467, 1.261388, 1, 0.2392157, 0, 1,
-1.647717, -0.03535613, -2.821326, 1, 0.2470588, 0, 1,
-1.644461, 1.239596, -0.1134369, 1, 0.2509804, 0, 1,
-1.642662, -1.906731, -2.814394, 1, 0.2588235, 0, 1,
-1.635078, 0.8309147, -0.481443, 1, 0.2627451, 0, 1,
-1.599101, -0.1545773, -2.999653, 1, 0.2705882, 0, 1,
-1.598088, 0.414744, -1.22312, 1, 0.2745098, 0, 1,
-1.590163, 0.9955946, -0.3158505, 1, 0.282353, 0, 1,
-1.589441, 0.5450828, -0.5417917, 1, 0.2862745, 0, 1,
-1.586208, -1.017703, -3.711324, 1, 0.2941177, 0, 1,
-1.579742, 0.1163899, 0.01963045, 1, 0.3019608, 0, 1,
-1.572822, -0.7014727, -1.013269, 1, 0.3058824, 0, 1,
-1.570159, 0.2758092, -1.995101, 1, 0.3137255, 0, 1,
-1.557997, 0.7445105, -0.1977716, 1, 0.3176471, 0, 1,
-1.552732, 0.8666619, -1.345266, 1, 0.3254902, 0, 1,
-1.549654, -0.4112875, -2.397655, 1, 0.3294118, 0, 1,
-1.542643, -0.9689822, -2.139256, 1, 0.3372549, 0, 1,
-1.540713, 0.1233774, -1.644254, 1, 0.3411765, 0, 1,
-1.53891, -1.024044, -1.157181, 1, 0.3490196, 0, 1,
-1.536265, 0.09432373, -1.374924, 1, 0.3529412, 0, 1,
-1.531462, -0.4389384, -2.718033, 1, 0.3607843, 0, 1,
-1.526838, 0.4435224, 0.7001613, 1, 0.3647059, 0, 1,
-1.525134, -0.1603857, 0.8349253, 1, 0.372549, 0, 1,
-1.513055, 1.248527, -0.7935066, 1, 0.3764706, 0, 1,
-1.503408, 0.7432971, -0.1753182, 1, 0.3843137, 0, 1,
-1.49581, -1.646029, -2.055353, 1, 0.3882353, 0, 1,
-1.495452, 1.1833, 0.7157385, 1, 0.3960784, 0, 1,
-1.48761, -0.8119007, -1.66955, 1, 0.4039216, 0, 1,
-1.485413, 1.257413, -1.519015, 1, 0.4078431, 0, 1,
-1.479816, -1.581278, -0.5842621, 1, 0.4156863, 0, 1,
-1.47741, -0.6996787, -0.2151777, 1, 0.4196078, 0, 1,
-1.477056, -0.9544969, -3.613571, 1, 0.427451, 0, 1,
-1.473812, -1.002739, -3.380085, 1, 0.4313726, 0, 1,
-1.47317, -0.7990975, -0.4919823, 1, 0.4392157, 0, 1,
-1.460125, 1.755292, 0.2968458, 1, 0.4431373, 0, 1,
-1.455022, -0.5485945, -2.265539, 1, 0.4509804, 0, 1,
-1.451727, -0.3098183, -2.90824, 1, 0.454902, 0, 1,
-1.450608, -1.397552, -2.134661, 1, 0.4627451, 0, 1,
-1.445078, -0.2390933, -2.540147, 1, 0.4666667, 0, 1,
-1.430421, 0.4384467, -0.3288527, 1, 0.4745098, 0, 1,
-1.427937, 1.62245, -1.977823, 1, 0.4784314, 0, 1,
-1.42745, -0.8751169, -2.531449, 1, 0.4862745, 0, 1,
-1.425969, 0.5659758, -1.969601, 1, 0.4901961, 0, 1,
-1.424532, -0.8145278, -1.089724, 1, 0.4980392, 0, 1,
-1.424128, 0.7032241, -1.826214, 1, 0.5058824, 0, 1,
-1.422417, -0.07409949, -1.691928, 1, 0.509804, 0, 1,
-1.395892, -1.659982, -0.588257, 1, 0.5176471, 0, 1,
-1.39572, -1.385131, -2.170065, 1, 0.5215687, 0, 1,
-1.380921, 0.7672478, -0.3904042, 1, 0.5294118, 0, 1,
-1.376991, -0.463923, -1.358342, 1, 0.5333334, 0, 1,
-1.36647, -0.6157857, -1.881756, 1, 0.5411765, 0, 1,
-1.359869, 0.1815972, -0.8502972, 1, 0.5450981, 0, 1,
-1.34168, 0.8711301, -1.010585, 1, 0.5529412, 0, 1,
-1.341119, -0.8330598, -2.429397, 1, 0.5568628, 0, 1,
-1.340785, 1.722464, 0.3250308, 1, 0.5647059, 0, 1,
-1.340678, -0.4541012, -2.213123, 1, 0.5686275, 0, 1,
-1.330297, -0.3457891, -1.590598, 1, 0.5764706, 0, 1,
-1.330086, 2.389807, 1.345762, 1, 0.5803922, 0, 1,
-1.329535, -0.1823891, -1.436774, 1, 0.5882353, 0, 1,
-1.327861, -0.6790654, -1.793117, 1, 0.5921569, 0, 1,
-1.324793, 0.02345052, -2.531543, 1, 0.6, 0, 1,
-1.319427, 0.3474684, -0.9698858, 1, 0.6078432, 0, 1,
-1.315878, -1.884077, -2.533801, 1, 0.6117647, 0, 1,
-1.314935, -1.301999, -4.023943, 1, 0.6196079, 0, 1,
-1.311642, -0.1014667, -0.9737632, 1, 0.6235294, 0, 1,
-1.304119, 1.078794, 0.06070675, 1, 0.6313726, 0, 1,
-1.303982, -0.7671822, -2.149923, 1, 0.6352941, 0, 1,
-1.295943, 0.01417976, -1.502855, 1, 0.6431373, 0, 1,
-1.291753, 0.1999786, -2.19923, 1, 0.6470588, 0, 1,
-1.264862, -2.203874, -2.523587, 1, 0.654902, 0, 1,
-1.23936, 0.6892377, -1.637578, 1, 0.6588235, 0, 1,
-1.237618, -0.5809576, -2.149353, 1, 0.6666667, 0, 1,
-1.23573, -0.1828534, -2.89252, 1, 0.6705883, 0, 1,
-1.234411, -0.5461984, -0.2799864, 1, 0.6784314, 0, 1,
-1.233644, -1.410302, -1.429247, 1, 0.682353, 0, 1,
-1.221116, -1.429961, -1.985395, 1, 0.6901961, 0, 1,
-1.219889, 1.113623, 0.5662153, 1, 0.6941177, 0, 1,
-1.211786, 0.694939, -0.6536921, 1, 0.7019608, 0, 1,
-1.211371, -1.414455, -2.447295, 1, 0.7098039, 0, 1,
-1.208647, 0.3586646, -1.878772, 1, 0.7137255, 0, 1,
-1.205146, 0.2233841, -0.7382191, 1, 0.7215686, 0, 1,
-1.200048, -1.16872, -1.006928, 1, 0.7254902, 0, 1,
-1.199534, -0.2907282, -1.202887, 1, 0.7333333, 0, 1,
-1.184504, -1.369955, -2.616706, 1, 0.7372549, 0, 1,
-1.182256, 0.6809973, -1.1526, 1, 0.7450981, 0, 1,
-1.174238, -1.662747, -2.310442, 1, 0.7490196, 0, 1,
-1.159785, -0.1467194, -1.851118, 1, 0.7568628, 0, 1,
-1.156263, 0.3174175, -0.9641251, 1, 0.7607843, 0, 1,
-1.144448, -0.2440526, -2.395716, 1, 0.7686275, 0, 1,
-1.141854, -0.9528967, -1.205545, 1, 0.772549, 0, 1,
-1.14162, -1.558387, -2.306823, 1, 0.7803922, 0, 1,
-1.136709, 0.5546079, -0.5486175, 1, 0.7843137, 0, 1,
-1.129277, -2.554188, -2.178156, 1, 0.7921569, 0, 1,
-1.11303, -0.161434, 0.1926251, 1, 0.7960784, 0, 1,
-1.109688, 0.09055198, 0.04812863, 1, 0.8039216, 0, 1,
-1.10811, -2.008894, -3.372361, 1, 0.8117647, 0, 1,
-1.105766, -2.577432, -3.101115, 1, 0.8156863, 0, 1,
-1.10507, 0.2372436, -0.7033439, 1, 0.8235294, 0, 1,
-1.104553, 0.1492676, -2.964921, 1, 0.827451, 0, 1,
-1.101382, 0.1412812, -0.7521265, 1, 0.8352941, 0, 1,
-1.10103, -0.2738532, -2.323663, 1, 0.8392157, 0, 1,
-1.100974, 1.151317, 0.9004605, 1, 0.8470588, 0, 1,
-1.099774, 0.06348174, -2.848988, 1, 0.8509804, 0, 1,
-1.0974, -1.850821, -2.224717, 1, 0.8588235, 0, 1,
-1.089955, 1.13581, 1.011238, 1, 0.8627451, 0, 1,
-1.088408, -1.192663, -0.2771494, 1, 0.8705882, 0, 1,
-1.072848, -0.6234942, -1.829235, 1, 0.8745098, 0, 1,
-1.072701, 0.1601932, -2.221297, 1, 0.8823529, 0, 1,
-1.071746, -0.4431294, -0.9934591, 1, 0.8862745, 0, 1,
-1.065414, 0.5265197, 0.08396431, 1, 0.8941177, 0, 1,
-1.050022, -0.3620259, -1.699652, 1, 0.8980392, 0, 1,
-1.038317, 0.1821463, -0.6185051, 1, 0.9058824, 0, 1,
-1.037539, -0.2240942, -1.090875, 1, 0.9137255, 0, 1,
-1.0358, -0.1350292, -1.004404, 1, 0.9176471, 0, 1,
-1.035173, 0.2709826, -0.1869749, 1, 0.9254902, 0, 1,
-1.027803, 0.7770252, -1.671147, 1, 0.9294118, 0, 1,
-1.023185, 0.1969826, -2.527651, 1, 0.9372549, 0, 1,
-1.017617, 0.2913521, -1.534951, 1, 0.9411765, 0, 1,
-1.013023, -0.181018, -1.849001, 1, 0.9490196, 0, 1,
-1.007602, -0.9778864, -1.511625, 1, 0.9529412, 0, 1,
-0.9951891, 0.2057001, -0.6694735, 1, 0.9607843, 0, 1,
-0.9912572, 0.9648414, -0.3946406, 1, 0.9647059, 0, 1,
-0.9866262, -2.388876, -2.45646, 1, 0.972549, 0, 1,
-0.9862781, 0.3628767, -1.776786, 1, 0.9764706, 0, 1,
-0.9829081, -0.6032062, -1.306303, 1, 0.9843137, 0, 1,
-0.9805144, 0.02321565, -2.355257, 1, 0.9882353, 0, 1,
-0.9704978, -0.5960151, -2.496805, 1, 0.9960784, 0, 1,
-0.9662958, -0.5773601, -3.122132, 0.9960784, 1, 0, 1,
-0.9634864, 0.1234071, -2.812781, 0.9921569, 1, 0, 1,
-0.960954, -0.3028562, -1.214634, 0.9843137, 1, 0, 1,
-0.9606298, -1.025773, -2.148132, 0.9803922, 1, 0, 1,
-0.9599887, 0.2520655, -1.583094, 0.972549, 1, 0, 1,
-0.9561563, -0.3417116, -2.717799, 0.9686275, 1, 0, 1,
-0.9522892, 0.128479, -1.274999, 0.9607843, 1, 0, 1,
-0.9514393, -1.499194, -3.291975, 0.9568627, 1, 0, 1,
-0.9508247, -0.1882443, -1.145364, 0.9490196, 1, 0, 1,
-0.9445935, 0.2384715, -2.655916, 0.945098, 1, 0, 1,
-0.9432133, 0.3458208, -0.9928404, 0.9372549, 1, 0, 1,
-0.9396347, 0.8025463, -2.004516, 0.9333333, 1, 0, 1,
-0.9378635, -0.6278377, -3.030533, 0.9254902, 1, 0, 1,
-0.9238719, 0.2835983, -0.2763065, 0.9215686, 1, 0, 1,
-0.9215589, -0.605737, -3.142784, 0.9137255, 1, 0, 1,
-0.9205914, 0.9668254, -1.370261, 0.9098039, 1, 0, 1,
-0.9204136, -1.584446, -1.806589, 0.9019608, 1, 0, 1,
-0.9180466, 0.7050452, 0.4847138, 0.8941177, 1, 0, 1,
-0.9169858, 0.2480669, -1.358378, 0.8901961, 1, 0, 1,
-0.9156325, -1.183568, -1.337999, 0.8823529, 1, 0, 1,
-0.909544, -2.340331, -0.8771205, 0.8784314, 1, 0, 1,
-0.9085789, -0.8282727, -2.346549, 0.8705882, 1, 0, 1,
-0.9071994, -0.6294026, -2.498521, 0.8666667, 1, 0, 1,
-0.899326, -0.3891362, -2.927897, 0.8588235, 1, 0, 1,
-0.8975173, 0.869126, -2.929202, 0.854902, 1, 0, 1,
-0.8913788, -0.969009, -4.414983, 0.8470588, 1, 0, 1,
-0.8840269, 0.2035328, -1.538729, 0.8431373, 1, 0, 1,
-0.8819034, 0.6076028, -0.256289, 0.8352941, 1, 0, 1,
-0.8754227, -0.1765207, -2.231992, 0.8313726, 1, 0, 1,
-0.866726, 1.134073, 0.4979676, 0.8235294, 1, 0, 1,
-0.8498861, -2.115403, -2.771946, 0.8196079, 1, 0, 1,
-0.8473235, -0.6851946, -1.893606, 0.8117647, 1, 0, 1,
-0.8427084, 1.050914, -1.057724, 0.8078431, 1, 0, 1,
-0.8399848, -0.4346695, -2.558391, 0.8, 1, 0, 1,
-0.8364378, -0.1020099, -2.335041, 0.7921569, 1, 0, 1,
-0.8344117, -0.3151195, -4.091933, 0.7882353, 1, 0, 1,
-0.8338754, 1.134614, 0.2373505, 0.7803922, 1, 0, 1,
-0.8283013, 1.247585, 0.9518253, 0.7764706, 1, 0, 1,
-0.8232713, -0.8062372, -2.710912, 0.7686275, 1, 0, 1,
-0.8038458, -1.104374, -2.245791, 0.7647059, 1, 0, 1,
-0.8022792, -0.4936151, -1.580275, 0.7568628, 1, 0, 1,
-0.7998903, -0.05864515, -1.793318, 0.7529412, 1, 0, 1,
-0.7995242, 0.5450715, -0.3859478, 0.7450981, 1, 0, 1,
-0.7990513, -1.075659, -2.715806, 0.7411765, 1, 0, 1,
-0.7967087, 0.6889529, -0.7353635, 0.7333333, 1, 0, 1,
-0.791571, 0.9686102, -0.005962362, 0.7294118, 1, 0, 1,
-0.7908842, -0.8753673, -2.372267, 0.7215686, 1, 0, 1,
-0.7887512, -1.193409, -2.774925, 0.7176471, 1, 0, 1,
-0.7880263, 0.129408, -1.708702, 0.7098039, 1, 0, 1,
-0.7870455, -1.080463, -3.115489, 0.7058824, 1, 0, 1,
-0.7834769, 0.04786876, 0.5641477, 0.6980392, 1, 0, 1,
-0.7810326, -1.230412, -2.869241, 0.6901961, 1, 0, 1,
-0.7803834, 0.8241012, -1.672456, 0.6862745, 1, 0, 1,
-0.7801869, 0.64252, -2.156116, 0.6784314, 1, 0, 1,
-0.7790391, -0.9356071, -3.561789, 0.6745098, 1, 0, 1,
-0.7731482, -0.1950638, -2.047107, 0.6666667, 1, 0, 1,
-0.7680612, -1.146767, -2.275321, 0.6627451, 1, 0, 1,
-0.7668484, 0.3229343, -0.7691693, 0.654902, 1, 0, 1,
-0.7622849, 0.4893985, -1.153852, 0.6509804, 1, 0, 1,
-0.7609012, 0.0189851, -1.441377, 0.6431373, 1, 0, 1,
-0.7603228, -0.7712222, -2.633527, 0.6392157, 1, 0, 1,
-0.7560243, -1.356443, -1.214784, 0.6313726, 1, 0, 1,
-0.7490798, -0.02517669, -0.503565, 0.627451, 1, 0, 1,
-0.7479944, -1.418394, -2.056734, 0.6196079, 1, 0, 1,
-0.7452779, -0.1580655, -2.017375, 0.6156863, 1, 0, 1,
-0.7374142, -1.110246, -2.678149, 0.6078432, 1, 0, 1,
-0.7361806, 1.208284, -1.777443, 0.6039216, 1, 0, 1,
-0.7346672, -1.223743, -2.512982, 0.5960785, 1, 0, 1,
-0.7344276, -0.06424758, -2.482012, 0.5882353, 1, 0, 1,
-0.7296881, 0.3543914, -0.1968486, 0.5843138, 1, 0, 1,
-0.72791, 0.104727, -2.241139, 0.5764706, 1, 0, 1,
-0.7240189, 0.1593475, -1.684256, 0.572549, 1, 0, 1,
-0.7098492, -0.7358985, -4.167671, 0.5647059, 1, 0, 1,
-0.7069139, -1.152186, -2.018738, 0.5607843, 1, 0, 1,
-0.7067578, -1.770711, -3.218683, 0.5529412, 1, 0, 1,
-0.70397, 1.375073, -1.804232, 0.5490196, 1, 0, 1,
-0.7039233, 1.78723, -0.3741834, 0.5411765, 1, 0, 1,
-0.7038986, -1.353113, -2.959603, 0.5372549, 1, 0, 1,
-0.7028015, -0.301001, -1.968428, 0.5294118, 1, 0, 1,
-0.6975716, -1.307943, -4.43212, 0.5254902, 1, 0, 1,
-0.6923237, 1.661592, -0.7675476, 0.5176471, 1, 0, 1,
-0.6899289, 0.7458236, -1.780171, 0.5137255, 1, 0, 1,
-0.6832045, -0.8615156, -2.137652, 0.5058824, 1, 0, 1,
-0.6816332, 0.7411149, -0.01899885, 0.5019608, 1, 0, 1,
-0.6801999, 0.8984911, -0.8440429, 0.4941176, 1, 0, 1,
-0.6719694, -1.681929, -3.854132, 0.4862745, 1, 0, 1,
-0.6638462, 0.1198636, -1.85941, 0.4823529, 1, 0, 1,
-0.6612184, 0.4362905, -0.6165423, 0.4745098, 1, 0, 1,
-0.6607825, 0.2113749, -1.768494, 0.4705882, 1, 0, 1,
-0.6606777, 0.02235826, -2.073554, 0.4627451, 1, 0, 1,
-0.6602498, 1.195103, -1.036723, 0.4588235, 1, 0, 1,
-0.6573989, 1.054585, -0.01750478, 0.4509804, 1, 0, 1,
-0.646542, 0.9060752, -0.7117239, 0.4470588, 1, 0, 1,
-0.6424236, 0.4109583, -1.195457, 0.4392157, 1, 0, 1,
-0.6395996, 0.102251, -1.68632, 0.4352941, 1, 0, 1,
-0.6379501, -0.1155777, -2.915133, 0.427451, 1, 0, 1,
-0.6300965, -0.0466842, -0.7881618, 0.4235294, 1, 0, 1,
-0.6300566, -0.921163, -2.926617, 0.4156863, 1, 0, 1,
-0.6300312, -0.9422733, -2.176501, 0.4117647, 1, 0, 1,
-0.6250697, 0.6621798, 0.3466314, 0.4039216, 1, 0, 1,
-0.624543, -1.397196, -1.18313, 0.3960784, 1, 0, 1,
-0.6226007, -0.3432867, -2.493097, 0.3921569, 1, 0, 1,
-0.6191614, -0.4330983, -2.818259, 0.3843137, 1, 0, 1,
-0.6179552, 0.3115457, -1.314039, 0.3803922, 1, 0, 1,
-0.6155916, 0.491761, 0.7290669, 0.372549, 1, 0, 1,
-0.6152341, 1.686587, -0.5299064, 0.3686275, 1, 0, 1,
-0.613202, -0.479619, -3.623405, 0.3607843, 1, 0, 1,
-0.6125929, 0.8050958, 0.3544344, 0.3568628, 1, 0, 1,
-0.6119381, -0.2433378, -1.843016, 0.3490196, 1, 0, 1,
-0.6065954, -0.1451764, 0.7812104, 0.345098, 1, 0, 1,
-0.6040601, -1.01179, -1.667036, 0.3372549, 1, 0, 1,
-0.6025672, 0.7414808, -0.2178579, 0.3333333, 1, 0, 1,
-0.6015322, -1.103427, -2.529123, 0.3254902, 1, 0, 1,
-0.6006677, 1.016845, -1.407077, 0.3215686, 1, 0, 1,
-0.5968264, 0.1034867, -1.915846, 0.3137255, 1, 0, 1,
-0.5889609, -0.02972263, -2.46558, 0.3098039, 1, 0, 1,
-0.5826414, -0.5637433, -2.857455, 0.3019608, 1, 0, 1,
-0.5792245, 0.1917212, -0.6106582, 0.2941177, 1, 0, 1,
-0.5715594, 0.4406138, -0.8159227, 0.2901961, 1, 0, 1,
-0.565668, 0.7812964, -0.9118909, 0.282353, 1, 0, 1,
-0.5593447, 0.7068433, -2.053216, 0.2784314, 1, 0, 1,
-0.5574625, 0.2485651, -1.426547, 0.2705882, 1, 0, 1,
-0.5567878, 0.04345859, -0.5502858, 0.2666667, 1, 0, 1,
-0.5555701, -1.719213, -3.830335, 0.2588235, 1, 0, 1,
-0.5554225, -0.8359174, -0.5060782, 0.254902, 1, 0, 1,
-0.5550336, 0.8870578, -0.6007556, 0.2470588, 1, 0, 1,
-0.5536413, 1.001215, -2.759158, 0.2431373, 1, 0, 1,
-0.5514345, -0.2435945, -2.203526, 0.2352941, 1, 0, 1,
-0.549728, 0.0911339, -1.473429, 0.2313726, 1, 0, 1,
-0.5463492, -1.098062, -2.35136, 0.2235294, 1, 0, 1,
-0.5455916, -0.3700632, -1.44706, 0.2196078, 1, 0, 1,
-0.543246, -0.005410004, -2.497029, 0.2117647, 1, 0, 1,
-0.5360947, -0.00869353, -1.486976, 0.2078431, 1, 0, 1,
-0.5351252, 0.4927682, -2.046029, 0.2, 1, 0, 1,
-0.5302227, -0.850857, -1.215877, 0.1921569, 1, 0, 1,
-0.5296326, 0.9758068, 1.175987, 0.1882353, 1, 0, 1,
-0.5288863, -0.8076743, -2.295886, 0.1803922, 1, 0, 1,
-0.5278701, 1.141389, 1.668969, 0.1764706, 1, 0, 1,
-0.5255058, 0.3853678, -0.1974978, 0.1686275, 1, 0, 1,
-0.5224129, -0.9710491, -2.857498, 0.1647059, 1, 0, 1,
-0.5212308, -0.9666577, -2.568824, 0.1568628, 1, 0, 1,
-0.5207763, 1.24556, -0.603956, 0.1529412, 1, 0, 1,
-0.5169931, -0.2250711, 0.1498174, 0.145098, 1, 0, 1,
-0.5015376, -1.819131, -2.916751, 0.1411765, 1, 0, 1,
-0.5007612, -0.5693149, -3.377929, 0.1333333, 1, 0, 1,
-0.5007032, 1.881719, 0.0678646, 0.1294118, 1, 0, 1,
-0.4936477, 0.3183612, -1.099101, 0.1215686, 1, 0, 1,
-0.4844696, -1.335471, -2.065861, 0.1176471, 1, 0, 1,
-0.4804831, 0.6474485, 0.2372881, 0.1098039, 1, 0, 1,
-0.4791841, -0.08215255, -1.770987, 0.1058824, 1, 0, 1,
-0.4771283, 1.538779, -0.2995466, 0.09803922, 1, 0, 1,
-0.4741647, 0.0759515, -2.638878, 0.09019608, 1, 0, 1,
-0.4740783, -0.874387, -2.255101, 0.08627451, 1, 0, 1,
-0.4710878, -0.4729412, -0.8971742, 0.07843138, 1, 0, 1,
-0.4634421, 0.364587, 1.216738, 0.07450981, 1, 0, 1,
-0.4624659, -0.8273931, -3.209726, 0.06666667, 1, 0, 1,
-0.4622222, -0.2416684, -2.556748, 0.0627451, 1, 0, 1,
-0.461175, 0.448781, -2.246696, 0.05490196, 1, 0, 1,
-0.4584802, -0.9565274, -1.867182, 0.05098039, 1, 0, 1,
-0.4565324, -0.3606596, -0.2453715, 0.04313726, 1, 0, 1,
-0.448636, -0.2877938, -3.15261, 0.03921569, 1, 0, 1,
-0.4467682, -0.86293, -0.3908271, 0.03137255, 1, 0, 1,
-0.4402937, -1.921575, -3.402709, 0.02745098, 1, 0, 1,
-0.4387975, -0.9535226, -2.867172, 0.01960784, 1, 0, 1,
-0.4363086, -0.7116584, -2.299328, 0.01568628, 1, 0, 1,
-0.433001, 0.209749, -1.165698, 0.007843138, 1, 0, 1,
-0.4324114, -1.652065, -2.317642, 0.003921569, 1, 0, 1,
-0.4312355, 1.546154, -1.375716, 0, 1, 0.003921569, 1,
-0.4297088, -0.4625344, -1.908633, 0, 1, 0.01176471, 1,
-0.4282917, 0.895362, -1.303415, 0, 1, 0.01568628, 1,
-0.4273544, -0.1155472, -0.9670787, 0, 1, 0.02352941, 1,
-0.427222, 1.002314, -0.1998722, 0, 1, 0.02745098, 1,
-0.4252113, -0.7231351, -3.120158, 0, 1, 0.03529412, 1,
-0.4237712, -0.02457759, -1.194746, 0, 1, 0.03921569, 1,
-0.4223092, -1.165848, -2.623698, 0, 1, 0.04705882, 1,
-0.4134799, 0.5561663, -0.02131327, 0, 1, 0.05098039, 1,
-0.4049933, 0.4900506, -0.6759903, 0, 1, 0.05882353, 1,
-0.3981314, 2.747586, -0.4131425, 0, 1, 0.0627451, 1,
-0.3915502, 0.3607611, -0.4687057, 0, 1, 0.07058824, 1,
-0.3888771, 0.157169, -0.3407053, 0, 1, 0.07450981, 1,
-0.3877164, 0.7638714, -1.595852, 0, 1, 0.08235294, 1,
-0.3863005, -0.4132043, -4.0181, 0, 1, 0.08627451, 1,
-0.3790338, -0.1675654, 0.392617, 0, 1, 0.09411765, 1,
-0.3759725, -1.129686, -4.004129, 0, 1, 0.1019608, 1,
-0.3747815, 0.576988, -0.6634565, 0, 1, 0.1058824, 1,
-0.3709624, 0.7926195, -0.03383843, 0, 1, 0.1137255, 1,
-0.3694443, -0.7447265, -0.9276085, 0, 1, 0.1176471, 1,
-0.3690794, -1.230695, -2.019834, 0, 1, 0.1254902, 1,
-0.3682624, 0.9083225, 0.4520184, 0, 1, 0.1294118, 1,
-0.3680615, -0.3271756, -1.542121, 0, 1, 0.1372549, 1,
-0.3678406, -0.2542313, -3.448083, 0, 1, 0.1411765, 1,
-0.3674188, 0.4152879, -1.401963, 0, 1, 0.1490196, 1,
-0.3630897, 0.7338238, -0.05616411, 0, 1, 0.1529412, 1,
-0.359838, -0.2363692, -3.204863, 0, 1, 0.1607843, 1,
-0.3572311, -0.007350799, -0.356939, 0, 1, 0.1647059, 1,
-0.3481406, -0.4150555, -1.553377, 0, 1, 0.172549, 1,
-0.3478701, 0.6715773, -0.9533705, 0, 1, 0.1764706, 1,
-0.34677, 0.535251, -1.584654, 0, 1, 0.1843137, 1,
-0.3454461, 0.2092459, -1.983411, 0, 1, 0.1882353, 1,
-0.3417258, -0.4050271, -4.534189, 0, 1, 0.1960784, 1,
-0.338453, 0.7066017, -0.447071, 0, 1, 0.2039216, 1,
-0.3384353, 1.483222, -0.9777179, 0, 1, 0.2078431, 1,
-0.3375628, -0.04762551, -2.548259, 0, 1, 0.2156863, 1,
-0.3365383, 0.2140227, -1.135845, 0, 1, 0.2196078, 1,
-0.3278112, -0.2335299, -0.621488, 0, 1, 0.227451, 1,
-0.3225093, 0.644173, 0.9680638, 0, 1, 0.2313726, 1,
-0.3208629, 0.2593634, -3.556233, 0, 1, 0.2392157, 1,
-0.3115761, -1.34417, -1.630481, 0, 1, 0.2431373, 1,
-0.3111163, -0.9677538, -1.519593, 0, 1, 0.2509804, 1,
-0.3094656, -0.3600681, -2.344117, 0, 1, 0.254902, 1,
-0.3083182, 0.4647079, -0.8792761, 0, 1, 0.2627451, 1,
-0.3066827, -0.6883293, -3.686523, 0, 1, 0.2666667, 1,
-0.3051728, 0.9775741, -2.053411, 0, 1, 0.2745098, 1,
-0.3041054, -1.145167, -4.729315, 0, 1, 0.2784314, 1,
-0.298283, -0.003064833, -2.385813, 0, 1, 0.2862745, 1,
-0.297315, -1.178853, -3.723189, 0, 1, 0.2901961, 1,
-0.2964118, 0.7865388, -0.03219634, 0, 1, 0.2980392, 1,
-0.2958604, -1.35837, -4.180541, 0, 1, 0.3058824, 1,
-0.2925044, 1.091436, -2.619271, 0, 1, 0.3098039, 1,
-0.292104, 0.3856262, -1.007763, 0, 1, 0.3176471, 1,
-0.285695, -0.1497311, -1.650556, 0, 1, 0.3215686, 1,
-0.2843285, 0.9349901, 0.244426, 0, 1, 0.3294118, 1,
-0.2788447, 1.194651, -0.9537256, 0, 1, 0.3333333, 1,
-0.2738125, 0.9276868, -1.093065, 0, 1, 0.3411765, 1,
-0.2688738, -1.039398, -5.982351, 0, 1, 0.345098, 1,
-0.2680134, -0.2397761, -1.767249, 0, 1, 0.3529412, 1,
-0.2653228, 0.5189412, 1.314543, 0, 1, 0.3568628, 1,
-0.2641227, -0.5962532, -2.632058, 0, 1, 0.3647059, 1,
-0.2574646, -0.9801295, -2.582765, 0, 1, 0.3686275, 1,
-0.2553695, 0.8831604, -1.236723, 0, 1, 0.3764706, 1,
-0.2468342, -1.492723, -1.930441, 0, 1, 0.3803922, 1,
-0.2462455, -0.01912205, -0.8411366, 0, 1, 0.3882353, 1,
-0.2446683, 1.1857, -0.9084364, 0, 1, 0.3921569, 1,
-0.2445166, 0.1074155, -1.474056, 0, 1, 0.4, 1,
-0.2422211, 0.1225257, 0.5904333, 0, 1, 0.4078431, 1,
-0.2395584, -0.9500846, -1.466026, 0, 1, 0.4117647, 1,
-0.2378392, -0.222283, -2.1698, 0, 1, 0.4196078, 1,
-0.2365856, 0.3165411, -1.999533, 0, 1, 0.4235294, 1,
-0.2343589, 0.5671887, -0.3387909, 0, 1, 0.4313726, 1,
-0.2343149, 0.1663896, -0.8694246, 0, 1, 0.4352941, 1,
-0.2339586, -1.221677, -4.028804, 0, 1, 0.4431373, 1,
-0.2337212, -1.12901, -3.409044, 0, 1, 0.4470588, 1,
-0.2315556, 0.43075, -0.6065301, 0, 1, 0.454902, 1,
-0.2293003, 0.313691, -1.899263, 0, 1, 0.4588235, 1,
-0.229081, 0.8173256, -0.008949247, 0, 1, 0.4666667, 1,
-0.2227808, 1.838337, -0.564675, 0, 1, 0.4705882, 1,
-0.2187294, -1.421179, -2.400706, 0, 1, 0.4784314, 1,
-0.2170659, -0.04378476, -1.70612, 0, 1, 0.4823529, 1,
-0.2163183, 0.8518532, -0.554015, 0, 1, 0.4901961, 1,
-0.2149919, -0.553089, -2.170228, 0, 1, 0.4941176, 1,
-0.2083289, 0.6915411, -0.7024606, 0, 1, 0.5019608, 1,
-0.2018301, 1.008988, 1.556385, 0, 1, 0.509804, 1,
-0.2006361, 0.9970911, -0.3700064, 0, 1, 0.5137255, 1,
-0.1978973, 1.145139, -0.2105357, 0, 1, 0.5215687, 1,
-0.1967915, -1.969888, -3.004419, 0, 1, 0.5254902, 1,
-0.1933858, 0.5036727, 1.152083, 0, 1, 0.5333334, 1,
-0.1866391, 1.623108, -1.518332, 0, 1, 0.5372549, 1,
-0.1852159, 1.572822, 1.512339, 0, 1, 0.5450981, 1,
-0.1843505, -0.8844844, -2.138563, 0, 1, 0.5490196, 1,
-0.1819118, 1.87265, 1.432789, 0, 1, 0.5568628, 1,
-0.1788676, 0.4144827, -1.446662, 0, 1, 0.5607843, 1,
-0.1773077, 1.088178, 1.405524, 0, 1, 0.5686275, 1,
-0.175907, -0.02569313, -1.985802, 0, 1, 0.572549, 1,
-0.1746081, 1.632138, -1.3958, 0, 1, 0.5803922, 1,
-0.1727649, 1.789222, -1.11974, 0, 1, 0.5843138, 1,
-0.1722122, -1.476945, -4.16603, 0, 1, 0.5921569, 1,
-0.1713413, 0.3718946, -0.2785239, 0, 1, 0.5960785, 1,
-0.1709875, 0.4126714, 1.997808, 0, 1, 0.6039216, 1,
-0.1701221, -1.934691, -3.109295, 0, 1, 0.6117647, 1,
-0.1699294, 0.09566258, -1.370515, 0, 1, 0.6156863, 1,
-0.1648654, 1.03242, -0.2286036, 0, 1, 0.6235294, 1,
-0.164059, 1.460059, 1.548045, 0, 1, 0.627451, 1,
-0.1624037, -1.101248, -3.955295, 0, 1, 0.6352941, 1,
-0.1569122, -1.670663, -3.342079, 0, 1, 0.6392157, 1,
-0.1521056, -0.3038772, -2.449659, 0, 1, 0.6470588, 1,
-0.1473286, -1.272442, -2.816055, 0, 1, 0.6509804, 1,
-0.1468467, 2.104054, 0.9444361, 0, 1, 0.6588235, 1,
-0.1454597, 2.174595, -0.2673709, 0, 1, 0.6627451, 1,
-0.1441224, 0.7694333, -1.439307, 0, 1, 0.6705883, 1,
-0.1437696, 1.889016, 1.253862, 0, 1, 0.6745098, 1,
-0.1424628, 0.3489198, 0.5892355, 0, 1, 0.682353, 1,
-0.1344979, -0.3348635, -1.358558, 0, 1, 0.6862745, 1,
-0.1331176, -0.660787, -2.414249, 0, 1, 0.6941177, 1,
-0.1318897, 1.562998, -0.5996093, 0, 1, 0.7019608, 1,
-0.128714, 0.9949757, -0.4646251, 0, 1, 0.7058824, 1,
-0.1266552, -0.3724214, -1.801107, 0, 1, 0.7137255, 1,
-0.1245163, -0.6402646, -2.775361, 0, 1, 0.7176471, 1,
-0.1241371, -0.6034232, -2.081383, 0, 1, 0.7254902, 1,
-0.1240296, 0.8739516, 0.137608, 0, 1, 0.7294118, 1,
-0.1194353, 0.326674, -1.722798, 0, 1, 0.7372549, 1,
-0.1190879, -0.8810081, -1.874761, 0, 1, 0.7411765, 1,
-0.1101033, -0.113404, -1.569456, 0, 1, 0.7490196, 1,
-0.1084303, -0.7072493, -2.817405, 0, 1, 0.7529412, 1,
-0.1079032, 0.8191227, -0.6390547, 0, 1, 0.7607843, 1,
-0.1049774, 2.240424, 1.323909, 0, 1, 0.7647059, 1,
-0.1045295, -0.1753227, -2.42522, 0, 1, 0.772549, 1,
-0.1011981, -3.106551, -2.407648, 0, 1, 0.7764706, 1,
-0.1007298, 0.117865, -0.558931, 0, 1, 0.7843137, 1,
-0.09819283, 0.01429097, -1.956727, 0, 1, 0.7882353, 1,
-0.09192564, 0.2333133, 0.2633761, 0, 1, 0.7960784, 1,
-0.08710613, 1.443183, -0.52084, 0, 1, 0.8039216, 1,
-0.0866029, 1.691265, -1.624569, 0, 1, 0.8078431, 1,
-0.08269984, 1.743331, -1.008211, 0, 1, 0.8156863, 1,
-0.08068136, 1.109205, 1.496612, 0, 1, 0.8196079, 1,
-0.0704904, 0.5936229, -0.193448, 0, 1, 0.827451, 1,
-0.06864529, 0.3569377, -1.555547, 0, 1, 0.8313726, 1,
-0.05839466, -0.1464804, -4.432966, 0, 1, 0.8392157, 1,
-0.05834791, 0.8062323, 1.108088, 0, 1, 0.8431373, 1,
-0.05787507, 0.5310598, 1.127268, 0, 1, 0.8509804, 1,
-0.05744122, -0.1626957, -3.117422, 0, 1, 0.854902, 1,
-0.05654272, 0.4449684, 0.985594, 0, 1, 0.8627451, 1,
-0.05334067, 0.4184671, 0.2877588, 0, 1, 0.8666667, 1,
-0.04855561, 0.9750702, -0.1823307, 0, 1, 0.8745098, 1,
-0.04578052, -0.900256, -3.938648, 0, 1, 0.8784314, 1,
-0.04383808, 0.3178134, -0.06739908, 0, 1, 0.8862745, 1,
-0.04001587, 2.695422, 0.658708, 0, 1, 0.8901961, 1,
-0.03925025, 1.339176, -0.9491601, 0, 1, 0.8980392, 1,
-0.0323278, 1.416466, -0.7582687, 0, 1, 0.9058824, 1,
-0.03053478, -1.039505, -3.710854, 0, 1, 0.9098039, 1,
-0.03025084, -0.3259078, -2.955562, 0, 1, 0.9176471, 1,
-0.0285883, 1.284673, 0.138197, 0, 1, 0.9215686, 1,
-0.02758391, 1.899305, -1.739273, 0, 1, 0.9294118, 1,
-0.0270073, 1.030342, -0.7974706, 0, 1, 0.9333333, 1,
-0.02651643, 0.4972886, -1.006925, 0, 1, 0.9411765, 1,
-0.02364251, -2.234626, -4.840869, 0, 1, 0.945098, 1,
-0.02245224, 1.112834, -1.167635, 0, 1, 0.9529412, 1,
-0.02172063, -1.581437, -3.567517, 0, 1, 0.9568627, 1,
-0.02099635, -0.9302449, -3.842796, 0, 1, 0.9647059, 1,
-0.02098373, 1.620718, -0.01619228, 0, 1, 0.9686275, 1,
-0.01810012, 0.2526164, 1.212936, 0, 1, 0.9764706, 1,
-0.01640755, -0.89321, -3.628174, 0, 1, 0.9803922, 1,
-0.01458416, 1.188805, -1.705526, 0, 1, 0.9882353, 1,
-0.01316385, 0.3786361, 0.7246668, 0, 1, 0.9921569, 1,
-0.005807861, -1.023615, -4.275499, 0, 1, 1, 1,
-0.004037993, -0.2770232, -3.18548, 0, 0.9921569, 1, 1,
-0.002166672, -1.182639, -0.8968903, 0, 0.9882353, 1, 1,
-0.002166447, 0.399051, -1.140174, 0, 0.9803922, 1, 1,
0.005948682, 0.3163497, 0.874278, 0, 0.9764706, 1, 1,
0.006192001, -0.4086989, 3.220472, 0, 0.9686275, 1, 1,
0.007240927, -0.7151915, 2.814132, 0, 0.9647059, 1, 1,
0.01627164, -1.012561, 3.335121, 0, 0.9568627, 1, 1,
0.01777028, -1.665512, 1.28379, 0, 0.9529412, 1, 1,
0.01822922, 0.6161281, -0.757887, 0, 0.945098, 1, 1,
0.02022099, 0.819795, -0.8257137, 0, 0.9411765, 1, 1,
0.02208354, -1.392136, 2.743092, 0, 0.9333333, 1, 1,
0.02653686, 1.082678, 1.167515, 0, 0.9294118, 1, 1,
0.02655759, 1.735267, 0.3637289, 0, 0.9215686, 1, 1,
0.02661499, -2.541358, 3.449077, 0, 0.9176471, 1, 1,
0.0269136, 0.6703891, -0.3375206, 0, 0.9098039, 1, 1,
0.03221405, -0.8742735, 3.521595, 0, 0.9058824, 1, 1,
0.03295196, -1.385676, 3.870278, 0, 0.8980392, 1, 1,
0.03362069, 0.8571948, 0.9887678, 0, 0.8901961, 1, 1,
0.03769437, 0.07422832, -0.2664207, 0, 0.8862745, 1, 1,
0.04075371, -0.3708338, 2.402059, 0, 0.8784314, 1, 1,
0.04499685, -0.0805849, 1.581635, 0, 0.8745098, 1, 1,
0.04845405, 0.05166185, 0.3512161, 0, 0.8666667, 1, 1,
0.04846604, 0.586234, 0.3362269, 0, 0.8627451, 1, 1,
0.05153474, 1.434662, -0.002191683, 0, 0.854902, 1, 1,
0.05350174, -0.3662297, 3.55123, 0, 0.8509804, 1, 1,
0.05712947, 1.521429, 0.9489102, 0, 0.8431373, 1, 1,
0.06111875, -1.858874, 2.09403, 0, 0.8392157, 1, 1,
0.06151994, 0.3157907, -0.4726374, 0, 0.8313726, 1, 1,
0.06256335, 0.6357101, 1.978873, 0, 0.827451, 1, 1,
0.06480286, 0.258306, -0.4403677, 0, 0.8196079, 1, 1,
0.06864713, 0.01917859, -0.1947505, 0, 0.8156863, 1, 1,
0.06987025, -0.4327866, 2.788112, 0, 0.8078431, 1, 1,
0.07000067, -1.932618, 2.207027, 0, 0.8039216, 1, 1,
0.08201854, -1.846373, 2.573308, 0, 0.7960784, 1, 1,
0.08320585, -0.4422551, 2.305274, 0, 0.7882353, 1, 1,
0.08871823, 0.966796, -1.347136, 0, 0.7843137, 1, 1,
0.09146612, -0.7468191, 3.672434, 0, 0.7764706, 1, 1,
0.09281147, -1.447022, 4.875688, 0, 0.772549, 1, 1,
0.09314477, 1.05226, 1.487721, 0, 0.7647059, 1, 1,
0.09946806, 0.3950955, -0.3197033, 0, 0.7607843, 1, 1,
0.09985597, -0.9072623, 1.349551, 0, 0.7529412, 1, 1,
0.1072481, 1.164095, 1.929396, 0, 0.7490196, 1, 1,
0.1073286, -0.01790702, 2.932662, 0, 0.7411765, 1, 1,
0.1129875, 1.358979, -1.35035, 0, 0.7372549, 1, 1,
0.1141184, -0.9468539, 3.354968, 0, 0.7294118, 1, 1,
0.1222897, -0.227268, 3.837007, 0, 0.7254902, 1, 1,
0.1223782, -0.09381005, 1.755634, 0, 0.7176471, 1, 1,
0.1256494, 2.077868, -0.39158, 0, 0.7137255, 1, 1,
0.1342829, 0.8376938, -2.007047, 0, 0.7058824, 1, 1,
0.1355715, -1.695893, 1.519338, 0, 0.6980392, 1, 1,
0.1362002, -0.7407071, 3.80827, 0, 0.6941177, 1, 1,
0.138119, 1.747723, 0.4459709, 0, 0.6862745, 1, 1,
0.1397602, -0.1349555, 3.854087, 0, 0.682353, 1, 1,
0.1398808, -0.1386847, 0.2258236, 0, 0.6745098, 1, 1,
0.1399801, -1.680746, 1.728958, 0, 0.6705883, 1, 1,
0.1404072, -0.3967722, 3.425231, 0, 0.6627451, 1, 1,
0.1409789, -0.8499673, 1.263824, 0, 0.6588235, 1, 1,
0.1426985, -0.3626246, 2.546806, 0, 0.6509804, 1, 1,
0.1428156, 0.6528519, -1.328662, 0, 0.6470588, 1, 1,
0.1428856, -0.5173684, 2.883799, 0, 0.6392157, 1, 1,
0.1432538, -1.468569, 3.248622, 0, 0.6352941, 1, 1,
0.1439279, 0.5875294, 0.988858, 0, 0.627451, 1, 1,
0.1527212, 0.2845075, 1.064749, 0, 0.6235294, 1, 1,
0.157102, -0.5066873, 3.633924, 0, 0.6156863, 1, 1,
0.1614962, -0.5050563, 3.194188, 0, 0.6117647, 1, 1,
0.1615114, 1.074586, -0.4304426, 0, 0.6039216, 1, 1,
0.1628162, 0.2252681, -0.03781153, 0, 0.5960785, 1, 1,
0.1662798, 0.1524554, 1.572664, 0, 0.5921569, 1, 1,
0.1690689, 1.379892, -0.2088692, 0, 0.5843138, 1, 1,
0.1758758, 1.858028, 0.1079277, 0, 0.5803922, 1, 1,
0.1764495, 0.2439037, 2.52343, 0, 0.572549, 1, 1,
0.1767267, -0.8136538, 4.719835, 0, 0.5686275, 1, 1,
0.1774296, 0.7238743, 0.1609703, 0, 0.5607843, 1, 1,
0.1777761, 0.149486, 2.540555, 0, 0.5568628, 1, 1,
0.1786642, -0.6629272, 3.13335, 0, 0.5490196, 1, 1,
0.1808799, 0.8289623, -0.6045203, 0, 0.5450981, 1, 1,
0.1813805, -0.3733265, 3.032735, 0, 0.5372549, 1, 1,
0.1822324, 0.932403, -1.688984, 0, 0.5333334, 1, 1,
0.1824939, 2.352633, -0.952684, 0, 0.5254902, 1, 1,
0.1843021, 0.5525399, 0.9976737, 0, 0.5215687, 1, 1,
0.1843497, -1.114709, 2.924851, 0, 0.5137255, 1, 1,
0.1848221, -0.6692082, 1.77247, 0, 0.509804, 1, 1,
0.1849411, 0.4355098, 0.6789671, 0, 0.5019608, 1, 1,
0.1957416, -1.043288, 2.597507, 0, 0.4941176, 1, 1,
0.2018271, 1.02761, 0.9893844, 0, 0.4901961, 1, 1,
0.2063561, -0.7716838, 4.864011, 0, 0.4823529, 1, 1,
0.2084663, 0.7968407, 2.083027, 0, 0.4784314, 1, 1,
0.2114419, -0.761447, 4.036779, 0, 0.4705882, 1, 1,
0.2115283, -0.263247, 2.129872, 0, 0.4666667, 1, 1,
0.2185943, -0.8576631, 3.298875, 0, 0.4588235, 1, 1,
0.2240469, -1.468914, 4.287747, 0, 0.454902, 1, 1,
0.2270635, -1.739477, 2.108785, 0, 0.4470588, 1, 1,
0.227327, -0.347122, 2.245647, 0, 0.4431373, 1, 1,
0.2311223, 0.3715115, 1.557151, 0, 0.4352941, 1, 1,
0.2319292, 0.7989893, -0.6636248, 0, 0.4313726, 1, 1,
0.2361788, 1.086972, 0.3961055, 0, 0.4235294, 1, 1,
0.2377416, -1.792033, 3.042633, 0, 0.4196078, 1, 1,
0.2414984, -0.5807623, 3.131473, 0, 0.4117647, 1, 1,
0.2480718, -0.2033473, 2.783325, 0, 0.4078431, 1, 1,
0.2543496, -0.8164526, 4.20794, 0, 0.4, 1, 1,
0.2565021, -0.1520133, 2.462018, 0, 0.3921569, 1, 1,
0.258904, -0.434271, 1.164034, 0, 0.3882353, 1, 1,
0.2603338, -0.3731283, 2.162299, 0, 0.3803922, 1, 1,
0.2634071, -0.6204178, 2.917428, 0, 0.3764706, 1, 1,
0.2672151, -2.006377, 3.062218, 0, 0.3686275, 1, 1,
0.2716019, 0.6783156, 0.3534968, 0, 0.3647059, 1, 1,
0.2831291, 0.2836014, 0.9233856, 0, 0.3568628, 1, 1,
0.2862173, 0.4613733, -0.5098437, 0, 0.3529412, 1, 1,
0.2881458, 1.25368, -0.04738588, 0, 0.345098, 1, 1,
0.2928343, 1.278564, 0.8806155, 0, 0.3411765, 1, 1,
0.2939688, -2.514156, 3.631032, 0, 0.3333333, 1, 1,
0.2958637, -1.277643, 3.608372, 0, 0.3294118, 1, 1,
0.2980597, 0.7426954, 0.864398, 0, 0.3215686, 1, 1,
0.303641, 0.317904, 0.1135809, 0, 0.3176471, 1, 1,
0.3044477, 0.2108322, 0.128574, 0, 0.3098039, 1, 1,
0.3074618, 0.6869723, 0.5125689, 0, 0.3058824, 1, 1,
0.308598, 0.5824366, 0.3684861, 0, 0.2980392, 1, 1,
0.3103178, 0.7764612, -0.6092615, 0, 0.2901961, 1, 1,
0.311176, 0.7655147, -0.1410614, 0, 0.2862745, 1, 1,
0.3118409, -1.388822, 4.596481, 0, 0.2784314, 1, 1,
0.3124934, 1.297074, 0.5980359, 0, 0.2745098, 1, 1,
0.3150539, -0.2270607, 0.1357882, 0, 0.2666667, 1, 1,
0.3158512, -0.3515627, 2.07971, 0, 0.2627451, 1, 1,
0.3335349, -0.4618795, 1.439336, 0, 0.254902, 1, 1,
0.3350137, 1.550055, 1.828202, 0, 0.2509804, 1, 1,
0.3365647, -2.311546, 2.716747, 0, 0.2431373, 1, 1,
0.3422753, 0.4564733, 0.6075677, 0, 0.2392157, 1, 1,
0.3437413, 0.9089484, 0.2171858, 0, 0.2313726, 1, 1,
0.3484676, -1.064697, 1.492283, 0, 0.227451, 1, 1,
0.3558318, 0.4955531, 0.08028976, 0, 0.2196078, 1, 1,
0.3601562, 0.2936662, 0.9300144, 0, 0.2156863, 1, 1,
0.3653614, 1.240428, 1.009522, 0, 0.2078431, 1, 1,
0.366977, 0.5518494, -0.3003756, 0, 0.2039216, 1, 1,
0.3689659, -2.129647, 3.189804, 0, 0.1960784, 1, 1,
0.3696543, -1.253683, 1.504138, 0, 0.1882353, 1, 1,
0.3711489, 0.6892004, -0.7744293, 0, 0.1843137, 1, 1,
0.3734495, -1.877174, 5.908538, 0, 0.1764706, 1, 1,
0.3753098, -0.1819597, 2.684909, 0, 0.172549, 1, 1,
0.3820088, 0.5770002, -0.4199357, 0, 0.1647059, 1, 1,
0.3854538, 1.075821, -0.1005157, 0, 0.1607843, 1, 1,
0.3858081, 0.2149449, 2.890655, 0, 0.1529412, 1, 1,
0.3860525, -0.9664312, 1.118149, 0, 0.1490196, 1, 1,
0.3863941, -0.5815752, 3.221725, 0, 0.1411765, 1, 1,
0.3905438, -1.730132, 1.227738, 0, 0.1372549, 1, 1,
0.3923225, -0.4669091, 2.246645, 0, 0.1294118, 1, 1,
0.3952863, 1.655413, 1.12944, 0, 0.1254902, 1, 1,
0.4013321, 0.7301812, 1.190545, 0, 0.1176471, 1, 1,
0.4018375, -0.5571775, 1.888726, 0, 0.1137255, 1, 1,
0.4170761, 0.7695816, 0.3483194, 0, 0.1058824, 1, 1,
0.4172108, -1.164028, 4.70576, 0, 0.09803922, 1, 1,
0.4211907, 1.194247, 1.428416, 0, 0.09411765, 1, 1,
0.4226691, 1.25402, 0.2415516, 0, 0.08627451, 1, 1,
0.4260917, -1.515255, 2.767845, 0, 0.08235294, 1, 1,
0.4266283, -0.7812426, 2.827005, 0, 0.07450981, 1, 1,
0.427019, 0.9889689, -0.3803782, 0, 0.07058824, 1, 1,
0.4277118, 1.129705, 1.024096, 0, 0.0627451, 1, 1,
0.4336162, 0.829033, 2.488268, 0, 0.05882353, 1, 1,
0.4365777, -0.6431762, 1.566135, 0, 0.05098039, 1, 1,
0.4388954, -0.1971467, 2.304344, 0, 0.04705882, 1, 1,
0.440396, -0.8180974, 4.15039, 0, 0.03921569, 1, 1,
0.4435889, 0.2951369, 1.666762, 0, 0.03529412, 1, 1,
0.4468727, -0.7032087, 3.958623, 0, 0.02745098, 1, 1,
0.4528771, -0.4531058, 1.879105, 0, 0.02352941, 1, 1,
0.4544833, -0.2371161, 2.20118, 0, 0.01568628, 1, 1,
0.4546779, -0.5929394, 3.128887, 0, 0.01176471, 1, 1,
0.4550751, -0.1299595, -0.2488865, 0, 0.003921569, 1, 1,
0.4568832, 0.2031762, 1.657621, 0.003921569, 0, 1, 1,
0.4572335, -0.7050086, 0.5665784, 0.007843138, 0, 1, 1,
0.4599871, 1.040524, 2.257772, 0.01568628, 0, 1, 1,
0.4605709, -2.022569, 1.605553, 0.01960784, 0, 1, 1,
0.4618948, 0.2591511, 0.7260025, 0.02745098, 0, 1, 1,
0.4621361, -1.677067, 0.7812544, 0.03137255, 0, 1, 1,
0.4636254, 1.995655, 1.22463, 0.03921569, 0, 1, 1,
0.4711668, 1.446168, 0.3469743, 0.04313726, 0, 1, 1,
0.4718177, -1.095432, 2.674811, 0.05098039, 0, 1, 1,
0.4850268, 0.7730449, -0.1373203, 0.05490196, 0, 1, 1,
0.4853916, 0.4420983, 1.66338, 0.0627451, 0, 1, 1,
0.4856608, -0.455006, 0.3972215, 0.06666667, 0, 1, 1,
0.486937, 0.999224, -0.8287131, 0.07450981, 0, 1, 1,
0.488512, 1.627351, 1.534836, 0.07843138, 0, 1, 1,
0.4897491, 0.3666068, 0.1198489, 0.08627451, 0, 1, 1,
0.4906884, -0.1641058, 1.942707, 0.09019608, 0, 1, 1,
0.4969725, -0.3228341, 2.779631, 0.09803922, 0, 1, 1,
0.4992793, 0.7515393, 1.219308, 0.1058824, 0, 1, 1,
0.4996226, 0.01999315, 1.034712, 0.1098039, 0, 1, 1,
0.5014754, -0.6386769, 1.770573, 0.1176471, 0, 1, 1,
0.5075583, 1.065147, 0.2453335, 0.1215686, 0, 1, 1,
0.5086522, -0.04405826, 2.347498, 0.1294118, 0, 1, 1,
0.5106261, -0.3553276, 1.907216, 0.1333333, 0, 1, 1,
0.5164396, -1.220713, 2.844657, 0.1411765, 0, 1, 1,
0.5164838, 0.2595378, 1.177656, 0.145098, 0, 1, 1,
0.5185776, 2.130529, -0.7851428, 0.1529412, 0, 1, 1,
0.5229174, 0.05808058, 0.2471245, 0.1568628, 0, 1, 1,
0.5259207, -0.7733305, 3.056131, 0.1647059, 0, 1, 1,
0.526658, 0.4081677, -0.09196754, 0.1686275, 0, 1, 1,
0.5282506, 1.484383, -0.9354886, 0.1764706, 0, 1, 1,
0.5397835, -1.184302, 4.583877, 0.1803922, 0, 1, 1,
0.5399485, 0.3627857, 3.460877, 0.1882353, 0, 1, 1,
0.5419779, -1.936344, 2.919501, 0.1921569, 0, 1, 1,
0.5436094, 0.54292, 1.393326, 0.2, 0, 1, 1,
0.5436177, 1.239655, 0.1950049, 0.2078431, 0, 1, 1,
0.5457368, 0.05578418, 0.6543006, 0.2117647, 0, 1, 1,
0.5468204, 0.385724, 1.569938, 0.2196078, 0, 1, 1,
0.5485764, -0.3980394, 1.651386, 0.2235294, 0, 1, 1,
0.5536808, 0.5726, 1.103088, 0.2313726, 0, 1, 1,
0.5556048, -1.58927, 2.967307, 0.2352941, 0, 1, 1,
0.5566069, -2.03182, 2.553433, 0.2431373, 0, 1, 1,
0.5578707, -0.3146647, 2.647658, 0.2470588, 0, 1, 1,
0.5622959, 0.9720839, 0.9122358, 0.254902, 0, 1, 1,
0.5659458, -0.8998762, 3.460948, 0.2588235, 0, 1, 1,
0.569037, -0.1373025, 1.116008, 0.2666667, 0, 1, 1,
0.569258, -0.003256453, 2.003773, 0.2705882, 0, 1, 1,
0.5714232, 0.9850431, -0.982672, 0.2784314, 0, 1, 1,
0.5726034, 0.8249509, 0.8068145, 0.282353, 0, 1, 1,
0.5726207, 1.293765, -0.08158103, 0.2901961, 0, 1, 1,
0.5769346, 0.6833637, 0.3744269, 0.2941177, 0, 1, 1,
0.5797615, -0.5603319, 1.136188, 0.3019608, 0, 1, 1,
0.5807959, -1.623896, 2.968428, 0.3098039, 0, 1, 1,
0.5810457, -0.9002267, 2.274166, 0.3137255, 0, 1, 1,
0.5820575, -1.04555, 3.700785, 0.3215686, 0, 1, 1,
0.5836512, -0.4711848, 1.693009, 0.3254902, 0, 1, 1,
0.5839599, -0.5611736, 2.432029, 0.3333333, 0, 1, 1,
0.5871864, -0.4641108, 1.72739, 0.3372549, 0, 1, 1,
0.5885281, 0.3740886, 1.299568, 0.345098, 0, 1, 1,
0.5886796, -0.2719439, 2.229184, 0.3490196, 0, 1, 1,
0.5964606, -0.5308852, 2.447143, 0.3568628, 0, 1, 1,
0.6011674, 0.2487783, 2.984578, 0.3607843, 0, 1, 1,
0.6046321, -1.948835, 2.925831, 0.3686275, 0, 1, 1,
0.6064503, -0.03493909, 0.384293, 0.372549, 0, 1, 1,
0.607447, 1.188438, -0.3057732, 0.3803922, 0, 1, 1,
0.6077626, 0.3362811, -0.159707, 0.3843137, 0, 1, 1,
0.6109585, -0.7378485, 2.037742, 0.3921569, 0, 1, 1,
0.6244416, -0.3079451, 0.9076567, 0.3960784, 0, 1, 1,
0.6283438, 0.5808464, -0.9064813, 0.4039216, 0, 1, 1,
0.6370552, -0.5591897, 3.368818, 0.4117647, 0, 1, 1,
0.6410271, 2.474446, 0.3144269, 0.4156863, 0, 1, 1,
0.6422021, -0.08175552, 2.470418, 0.4235294, 0, 1, 1,
0.6458826, -1.963153, 2.340443, 0.427451, 0, 1, 1,
0.6505418, 0.328941, -0.9140286, 0.4352941, 0, 1, 1,
0.6523098, -0.4463164, 3.364606, 0.4392157, 0, 1, 1,
0.6549833, -0.9321759, 2.849358, 0.4470588, 0, 1, 1,
0.6578075, -0.581496, 3.570884, 0.4509804, 0, 1, 1,
0.657976, -0.9828135, 1.534595, 0.4588235, 0, 1, 1,
0.6634219, -0.1352449, 2.913002, 0.4627451, 0, 1, 1,
0.6679019, 0.4854632, 0.5852166, 0.4705882, 0, 1, 1,
0.6750818, 0.6399441, 1.31442, 0.4745098, 0, 1, 1,
0.6872154, -0.262132, 2.333095, 0.4823529, 0, 1, 1,
0.6877804, 1.038244, 1.042215, 0.4862745, 0, 1, 1,
0.6898414, -0.7224872, 2.734499, 0.4941176, 0, 1, 1,
0.698128, 0.6838031, -0.6695233, 0.5019608, 0, 1, 1,
0.6995112, 0.1865601, 0.4252661, 0.5058824, 0, 1, 1,
0.7009165, -0.4518118, 1.76852, 0.5137255, 0, 1, 1,
0.7032334, -0.3293989, 0.9136915, 0.5176471, 0, 1, 1,
0.7032721, -1.193403, 3.067231, 0.5254902, 0, 1, 1,
0.7053776, -0.4180442, 2.779446, 0.5294118, 0, 1, 1,
0.7091302, -0.8229774, 2.130944, 0.5372549, 0, 1, 1,
0.7107543, -0.6335379, 2.781766, 0.5411765, 0, 1, 1,
0.7140731, -0.00338711, 1.826019, 0.5490196, 0, 1, 1,
0.7146108, -0.337112, 2.730164, 0.5529412, 0, 1, 1,
0.7165278, -0.3871283, 3.920026, 0.5607843, 0, 1, 1,
0.7168679, -1.060647, 4.627125, 0.5647059, 0, 1, 1,
0.7171425, -0.08793297, 1.898172, 0.572549, 0, 1, 1,
0.719833, -1.650657, 2.783013, 0.5764706, 0, 1, 1,
0.7202886, -0.9392271, 2.743555, 0.5843138, 0, 1, 1,
0.7269058, -0.6184428, 2.461807, 0.5882353, 0, 1, 1,
0.7345408, -0.5793149, 2.000525, 0.5960785, 0, 1, 1,
0.7347538, -1.11149, 2.206619, 0.6039216, 0, 1, 1,
0.7385643, 1.134399, 2.265764, 0.6078432, 0, 1, 1,
0.74209, -0.2117211, 2.793772, 0.6156863, 0, 1, 1,
0.7436571, 1.314117, -0.8881326, 0.6196079, 0, 1, 1,
0.7483034, -0.7408294, 1.055798, 0.627451, 0, 1, 1,
0.7488011, 0.6830708, 2.410096, 0.6313726, 0, 1, 1,
0.7524372, -0.7556503, 2.12372, 0.6392157, 0, 1, 1,
0.7525916, 0.7406715, 0.9290947, 0.6431373, 0, 1, 1,
0.7590331, -1.158191, 3.351254, 0.6509804, 0, 1, 1,
0.7653379, -0.6743478, 2.070676, 0.654902, 0, 1, 1,
0.769963, -1.003339, 1.205572, 0.6627451, 0, 1, 1,
0.772793, 1.365582, 1.023637, 0.6666667, 0, 1, 1,
0.7735685, 0.009536305, 0.9569082, 0.6745098, 0, 1, 1,
0.7752226, 2.65571, 0.5642175, 0.6784314, 0, 1, 1,
0.7768258, -1.439524, 0.8512639, 0.6862745, 0, 1, 1,
0.778363, 0.1936099, 0.650448, 0.6901961, 0, 1, 1,
0.7794443, -0.5429862, 3.011818, 0.6980392, 0, 1, 1,
0.7795551, 0.7971536, 0.9799082, 0.7058824, 0, 1, 1,
0.7809181, 1.266679, 0.6441918, 0.7098039, 0, 1, 1,
0.7885452, 0.5656493, 2.882949, 0.7176471, 0, 1, 1,
0.7907394, 1.630826, -1.480555, 0.7215686, 0, 1, 1,
0.7933537, 0.6496276, -3.085913, 0.7294118, 0, 1, 1,
0.7936251, -0.2138809, 2.002872, 0.7333333, 0, 1, 1,
0.8006359, 1.198514, 0.1582776, 0.7411765, 0, 1, 1,
0.8024457, 2.721312, 0.90982, 0.7450981, 0, 1, 1,
0.8056887, 2.22924, -0.4791844, 0.7529412, 0, 1, 1,
0.8130756, 0.3519899, 0.4160497, 0.7568628, 0, 1, 1,
0.819185, -0.4263167, 0.7340122, 0.7647059, 0, 1, 1,
0.8263462, 1.530924, 2.272944, 0.7686275, 0, 1, 1,
0.8266982, 0.4122165, 0.4708228, 0.7764706, 0, 1, 1,
0.8328018, 1.219772, 1.857996, 0.7803922, 0, 1, 1,
0.8365917, 0.1086234, 0.3509084, 0.7882353, 0, 1, 1,
0.8529499, -1.104645, 1.998075, 0.7921569, 0, 1, 1,
0.8542583, 0.8457879, 0.2506976, 0.8, 0, 1, 1,
0.861667, 0.1836647, 3.487541, 0.8078431, 0, 1, 1,
0.8626916, -0.2415805, 0.6732708, 0.8117647, 0, 1, 1,
0.8628005, -0.04740996, 0.426383, 0.8196079, 0, 1, 1,
0.8684757, -0.07925972, 1.913502, 0.8235294, 0, 1, 1,
0.8709409, 0.5589997, 0.1132543, 0.8313726, 0, 1, 1,
0.8722014, 0.3511152, 2.722014, 0.8352941, 0, 1, 1,
0.8731694, -0.3841368, 1.338508, 0.8431373, 0, 1, 1,
0.875832, 1.580828, 1.362926, 0.8470588, 0, 1, 1,
0.8768552, -0.2339007, 2.124566, 0.854902, 0, 1, 1,
0.877189, -0.7486838, 2.170349, 0.8588235, 0, 1, 1,
0.8776035, -0.5340889, 1.699352, 0.8666667, 0, 1, 1,
0.8791326, -1.293137, 2.50437, 0.8705882, 0, 1, 1,
0.8798282, 0.03335506, 2.283097, 0.8784314, 0, 1, 1,
0.8862049, -1.062379, 2.725811, 0.8823529, 0, 1, 1,
0.8890917, 0.6196481, 0.807188, 0.8901961, 0, 1, 1,
0.894236, -0.8812438, 2.576247, 0.8941177, 0, 1, 1,
0.8967453, 0.8104673, -0.1143099, 0.9019608, 0, 1, 1,
0.9046373, 0.503658, 1.451512, 0.9098039, 0, 1, 1,
0.9071499, 0.244373, 2.979617, 0.9137255, 0, 1, 1,
0.908444, 1.59359, -0.2325224, 0.9215686, 0, 1, 1,
0.9145143, -0.9432519, 2.413219, 0.9254902, 0, 1, 1,
0.9155474, -0.2033486, 2.955719, 0.9333333, 0, 1, 1,
0.9187766, 0.6863476, -0.04955423, 0.9372549, 0, 1, 1,
0.9239091, -0.3174793, 2.400058, 0.945098, 0, 1, 1,
0.9267254, 0.1544316, 1.459983, 0.9490196, 0, 1, 1,
0.9310302, 1.064039, 0.9690532, 0.9568627, 0, 1, 1,
0.9378368, -0.5798549, 1.784414, 0.9607843, 0, 1, 1,
0.9402242, 0.0142537, 4.016885, 0.9686275, 0, 1, 1,
0.9453047, 0.7693658, 1.662985, 0.972549, 0, 1, 1,
0.9612665, 1.037323, 1.684801, 0.9803922, 0, 1, 1,
0.9627802, -0.5088024, 1.715507, 0.9843137, 0, 1, 1,
0.9695774, -0.1724515, 1.177811, 0.9921569, 0, 1, 1,
0.9716494, 1.111209, 1.904834, 0.9960784, 0, 1, 1,
0.9722437, 0.986321, 0.1736459, 1, 0, 0.9960784, 1,
0.9778358, -0.3779474, 0.2277611, 1, 0, 0.9882353, 1,
0.9786984, -1.186058, 2.827828, 1, 0, 0.9843137, 1,
0.9807409, 0.3190784, 2.12801, 1, 0, 0.9764706, 1,
0.9829388, -0.9061789, 4.125911, 1, 0, 0.972549, 1,
0.9858963, 2.33109, -0.7686672, 1, 0, 0.9647059, 1,
0.9879644, -0.1282584, 1.734907, 1, 0, 0.9607843, 1,
0.9892413, 0.186986, 0.8834962, 1, 0, 0.9529412, 1,
0.9973242, 0.1291419, 2.862211, 1, 0, 0.9490196, 1,
0.9977745, 2.170617, -0.7290363, 1, 0, 0.9411765, 1,
1.001548, 1.372333, 2.510365, 1, 0, 0.9372549, 1,
1.001634, -0.9607569, 4.263084, 1, 0, 0.9294118, 1,
1.006455, -0.7517444, 2.395151, 1, 0, 0.9254902, 1,
1.006748, -1.490019, 3.533219, 1, 0, 0.9176471, 1,
1.009668, 0.2036421, 0.633562, 1, 0, 0.9137255, 1,
1.012367, 0.5202779, 0.9612691, 1, 0, 0.9058824, 1,
1.013138, 2.008031, -0.3233845, 1, 0, 0.9019608, 1,
1.014859, -0.7388067, 2.395456, 1, 0, 0.8941177, 1,
1.022009, -0.8041477, 1.079794, 1, 0, 0.8862745, 1,
1.026786, -1.072817, 1.692207, 1, 0, 0.8823529, 1,
1.027639, -0.06425671, 1.926791, 1, 0, 0.8745098, 1,
1.029353, -1.06391, 3.145381, 1, 0, 0.8705882, 1,
1.03102, -0.1836271, 1.736183, 1, 0, 0.8627451, 1,
1.038123, 0.4160431, 2.078606, 1, 0, 0.8588235, 1,
1.041119, -0.8627306, 3.948261, 1, 0, 0.8509804, 1,
1.04205, -0.867692, 2.754118, 1, 0, 0.8470588, 1,
1.042655, 0.3683463, 0.8674809, 1, 0, 0.8392157, 1,
1.048362, 0.2755933, 1.554628, 1, 0, 0.8352941, 1,
1.050391, -2.421185, 2.713453, 1, 0, 0.827451, 1,
1.052641, 0.282036, 0.6838256, 1, 0, 0.8235294, 1,
1.055833, 1.979553, 0.1396914, 1, 0, 0.8156863, 1,
1.056065, 0.5875924, 0.4289256, 1, 0, 0.8117647, 1,
1.057082, -0.7377113, 1.794942, 1, 0, 0.8039216, 1,
1.057928, 3.316136, 1.065328, 1, 0, 0.7960784, 1,
1.063866, 1.010016, 0.8637241, 1, 0, 0.7921569, 1,
1.064478, -0.222538, 2.867468, 1, 0, 0.7843137, 1,
1.069102, 0.8382898, 1.72236, 1, 0, 0.7803922, 1,
1.081087, 2.083295, 0.4064792, 1, 0, 0.772549, 1,
1.087611, 1.094257, -1.292287, 1, 0, 0.7686275, 1,
1.093378, -0.7084109, 0.9827326, 1, 0, 0.7607843, 1,
1.09585, 1.183769, -0.7921592, 1, 0, 0.7568628, 1,
1.097926, -0.05087804, 2.125559, 1, 0, 0.7490196, 1,
1.100421, 2.426024, 0.7007984, 1, 0, 0.7450981, 1,
1.11166, 0.9705548, 1.579715, 1, 0, 0.7372549, 1,
1.117961, -0.765707, 0.804796, 1, 0, 0.7333333, 1,
1.118543, 0.3528375, 0.7870437, 1, 0, 0.7254902, 1,
1.120021, -3.072285, 2.850581, 1, 0, 0.7215686, 1,
1.120658, 1.103745, -1.079247, 1, 0, 0.7137255, 1,
1.122074, -0.9144866, 2.575191, 1, 0, 0.7098039, 1,
1.123095, -0.144467, 1.37165, 1, 0, 0.7019608, 1,
1.126084, -0.7965744, 1.736269, 1, 0, 0.6941177, 1,
1.131064, -0.1005181, 2.017692, 1, 0, 0.6901961, 1,
1.138566, 0.8410802, 0.2796954, 1, 0, 0.682353, 1,
1.139894, -0.3966458, 2.09805, 1, 0, 0.6784314, 1,
1.142736, 0.758087, 0.914858, 1, 0, 0.6705883, 1,
1.151822, -0.1889795, 1.887272, 1, 0, 0.6666667, 1,
1.153917, 0.865113, 1.125594, 1, 0, 0.6588235, 1,
1.154547, -0.2566281, 0.0369533, 1, 0, 0.654902, 1,
1.154861, -1.031693, 2.9442, 1, 0, 0.6470588, 1,
1.154953, -0.100183, 1.359507, 1, 0, 0.6431373, 1,
1.155288, -0.1761584, 1.331733, 1, 0, 0.6352941, 1,
1.157981, -0.3919045, 1.413034, 1, 0, 0.6313726, 1,
1.160208, 1.09894, 0.6155134, 1, 0, 0.6235294, 1,
1.16102, -1.133251, 3.262355, 1, 0, 0.6196079, 1,
1.163522, -0.06401081, 0.9440607, 1, 0, 0.6117647, 1,
1.164811, 0.2204214, 0.8135975, 1, 0, 0.6078432, 1,
1.177235, -1.316588, 1.899594, 1, 0, 0.6, 1,
1.18698, -0.7350509, 2.161881, 1, 0, 0.5921569, 1,
1.196278, 0.6166622, 2.124705, 1, 0, 0.5882353, 1,
1.206561, -0.3647375, 0.9638401, 1, 0, 0.5803922, 1,
1.216653, -0.4595343, 1.317246, 1, 0, 0.5764706, 1,
1.241411, 0.05758128, 2.642885, 1, 0, 0.5686275, 1,
1.246496, 0.1067583, 1.894025, 1, 0, 0.5647059, 1,
1.253573, -0.008326888, 0.8819574, 1, 0, 0.5568628, 1,
1.25967, -0.8880492, 1.956614, 1, 0, 0.5529412, 1,
1.270883, 0.2300058, 2.090734, 1, 0, 0.5450981, 1,
1.280158, -0.8011483, 4.355219, 1, 0, 0.5411765, 1,
1.284499, -0.1440611, 4.395402, 1, 0, 0.5333334, 1,
1.286857, 0.2467147, 1.952062, 1, 0, 0.5294118, 1,
1.290046, 0.06477568, 2.394818, 1, 0, 0.5215687, 1,
1.29158, -0.447337, 2.874564, 1, 0, 0.5176471, 1,
1.298886, -1.045288, 2.643403, 1, 0, 0.509804, 1,
1.303525, -1.105445, 3.02214, 1, 0, 0.5058824, 1,
1.305867, 0.3688991, 2.854046, 1, 0, 0.4980392, 1,
1.315569, 0.2519095, 1.779482, 1, 0, 0.4901961, 1,
1.319906, 0.1809223, 2.290288, 1, 0, 0.4862745, 1,
1.322464, 0.2428765, 0.4535756, 1, 0, 0.4784314, 1,
1.322607, -0.004293774, 1.356369, 1, 0, 0.4745098, 1,
1.336492, 1.2355, -0.117577, 1, 0, 0.4666667, 1,
1.337781, -0.2906484, 1.906257, 1, 0, 0.4627451, 1,
1.341545, -1.651356, 3.610003, 1, 0, 0.454902, 1,
1.342396, 1.035908, 0.729454, 1, 0, 0.4509804, 1,
1.342518, -0.3470758, 2.212545, 1, 0, 0.4431373, 1,
1.347034, 0.2005095, 0.3487104, 1, 0, 0.4392157, 1,
1.349259, 1.45092, -0.03137331, 1, 0, 0.4313726, 1,
1.36561, -1.057881, 4.387231, 1, 0, 0.427451, 1,
1.36773, -0.1422504, 2.490065, 1, 0, 0.4196078, 1,
1.367867, -1.462351, 3.03343, 1, 0, 0.4156863, 1,
1.400324, 0.3990755, 1.876751, 1, 0, 0.4078431, 1,
1.406587, 0.2071394, 1.095574, 1, 0, 0.4039216, 1,
1.423381, -0.4352421, 2.340961, 1, 0, 0.3960784, 1,
1.429295, -0.07466766, 1.529682, 1, 0, 0.3882353, 1,
1.441802, -0.8159534, 2.554653, 1, 0, 0.3843137, 1,
1.453094, -0.8551672, 1.712583, 1, 0, 0.3764706, 1,
1.455795, -0.8920874, 2.984127, 1, 0, 0.372549, 1,
1.466464, -1.602148, 1.87437, 1, 0, 0.3647059, 1,
1.473732, -0.02822118, 1.038469, 1, 0, 0.3607843, 1,
1.478105, -0.9284793, 2.912384, 1, 0, 0.3529412, 1,
1.482999, 0.3801621, 1.214481, 1, 0, 0.3490196, 1,
1.487129, 1.892021, -0.08815815, 1, 0, 0.3411765, 1,
1.492023, -1.391042, 1.860357, 1, 0, 0.3372549, 1,
1.497217, 1.220816, 0.9100232, 1, 0, 0.3294118, 1,
1.508158, 0.3061416, 1.142077, 1, 0, 0.3254902, 1,
1.517686, 2.231848, 1.298922, 1, 0, 0.3176471, 1,
1.523957, 0.6470591, 0.1637388, 1, 0, 0.3137255, 1,
1.552627, -1.705678, 0.5849741, 1, 0, 0.3058824, 1,
1.564855, -0.5537436, 2.57447, 1, 0, 0.2980392, 1,
1.577469, 1.567478, -0.3134457, 1, 0, 0.2941177, 1,
1.580676, -0.9621235, 3.560569, 1, 0, 0.2862745, 1,
1.58825, -0.2367929, 0.5708513, 1, 0, 0.282353, 1,
1.588441, -0.3013481, -0.07944905, 1, 0, 0.2745098, 1,
1.595713, -1.115913, 2.709158, 1, 0, 0.2705882, 1,
1.596333, -0.1842113, -0.009407477, 1, 0, 0.2627451, 1,
1.597871, -0.5097543, 2.134417, 1, 0, 0.2588235, 1,
1.602324, 0.8663371, 0.8856481, 1, 0, 0.2509804, 1,
1.606346, 2.693129, 2.697751, 1, 0, 0.2470588, 1,
1.620384, 0.7565123, 0.2075512, 1, 0, 0.2392157, 1,
1.636495, 0.6768522, 1.52395, 1, 0, 0.2352941, 1,
1.655935, 0.3758422, 2.142796, 1, 0, 0.227451, 1,
1.66028, -0.5087095, 2.66731, 1, 0, 0.2235294, 1,
1.667187, -0.1200935, 1.556722, 1, 0, 0.2156863, 1,
1.668582, 0.9400367, 1.894508, 1, 0, 0.2117647, 1,
1.676389, 0.2889874, 1.291642, 1, 0, 0.2039216, 1,
1.677554, -0.5731024, 1.579957, 1, 0, 0.1960784, 1,
1.688128, 0.6851858, 1.949475, 1, 0, 0.1921569, 1,
1.762992, 2.040897, 1.964349, 1, 0, 0.1843137, 1,
1.769485, -0.06384654, 1.537823, 1, 0, 0.1803922, 1,
1.771839, -1.286283, 1.548116, 1, 0, 0.172549, 1,
1.792285, -1.314739, 5.069755, 1, 0, 0.1686275, 1,
1.82129, 0.6983342, 2.501174, 1, 0, 0.1607843, 1,
1.849283, 0.9403926, 0.9917699, 1, 0, 0.1568628, 1,
1.854309, 0.2454493, 1.519239, 1, 0, 0.1490196, 1,
1.8601, 0.1210756, 2.403204, 1, 0, 0.145098, 1,
1.884777, 1.381033, -0.4429394, 1, 0, 0.1372549, 1,
1.898145, -1.018413, 1.650949, 1, 0, 0.1333333, 1,
1.932778, -0.7235985, 0.758323, 1, 0, 0.1254902, 1,
1.939501, 0.8409878, -0.3258708, 1, 0, 0.1215686, 1,
1.970627, -0.8637479, 1.56431, 1, 0, 0.1137255, 1,
1.980551, 0.3333096, 2.801282, 1, 0, 0.1098039, 1,
1.983816, -1.183465, 2.507159, 1, 0, 0.1019608, 1,
1.987103, 0.7319251, 2.232509, 1, 0, 0.09411765, 1,
1.997534, 0.5329627, 1.00309, 1, 0, 0.09019608, 1,
2.022528, 0.7351183, 0.6839161, 1, 0, 0.08235294, 1,
2.029055, 0.0753051, 1.275278, 1, 0, 0.07843138, 1,
2.066867, -0.6426405, 2.680883, 1, 0, 0.07058824, 1,
2.141796, 0.6966739, 0.6039766, 1, 0, 0.06666667, 1,
2.177465, -0.2478656, -0.5964404, 1, 0, 0.05882353, 1,
2.189249, 1.758929, 2.432498, 1, 0, 0.05490196, 1,
2.213223, 1.670911, 1.119867, 1, 0, 0.04705882, 1,
2.269907, -0.2588474, 2.611888, 1, 0, 0.04313726, 1,
2.312906, 0.7557502, 3.547529, 1, 0, 0.03529412, 1,
2.329381, -0.2836418, 2.424689, 1, 0, 0.03137255, 1,
2.479128, 0.8035322, 0.610304, 1, 0, 0.02352941, 1,
2.620316, -0.2806067, 1.815044, 1, 0, 0.01960784, 1,
2.838719, -1.675509, 4.052346, 1, 0, 0.01176471, 1,
3.280217, -1.037397, 3.4501, 1, 0, 0.007843138, 1
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
0.2023146, -4.195197, -7.997857, 0, -0.5, 0.5, 0.5,
0.2023146, -4.195197, -7.997857, 1, -0.5, 0.5, 0.5,
0.2023146, -4.195197, -7.997857, 1, 1.5, 0.5, 0.5,
0.2023146, -4.195197, -7.997857, 0, 1.5, 0.5, 0.5
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
-3.918996, 0.1047922, -7.997857, 0, -0.5, 0.5, 0.5,
-3.918996, 0.1047922, -7.997857, 1, -0.5, 0.5, 0.5,
-3.918996, 0.1047922, -7.997857, 1, 1.5, 0.5, 0.5,
-3.918996, 0.1047922, -7.997857, 0, 1.5, 0.5, 0.5
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
-3.918996, -4.195197, -0.03690648, 0, -0.5, 0.5, 0.5,
-3.918996, -4.195197, -0.03690648, 1, -0.5, 0.5, 0.5,
-3.918996, -4.195197, -0.03690648, 1, 1.5, 0.5, 0.5,
-3.918996, -4.195197, -0.03690648, 0, 1.5, 0.5, 0.5
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
-2, -3.202892, -6.160714,
3, -3.202892, -6.160714,
-2, -3.202892, -6.160714,
-2, -3.368276, -6.466905,
-1, -3.202892, -6.160714,
-1, -3.368276, -6.466905,
0, -3.202892, -6.160714,
0, -3.368276, -6.466905,
1, -3.202892, -6.160714,
1, -3.368276, -6.466905,
2, -3.202892, -6.160714,
2, -3.368276, -6.466905,
3, -3.202892, -6.160714,
3, -3.368276, -6.466905
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
-2, -3.699044, -7.079285, 0, -0.5, 0.5, 0.5,
-2, -3.699044, -7.079285, 1, -0.5, 0.5, 0.5,
-2, -3.699044, -7.079285, 1, 1.5, 0.5, 0.5,
-2, -3.699044, -7.079285, 0, 1.5, 0.5, 0.5,
-1, -3.699044, -7.079285, 0, -0.5, 0.5, 0.5,
-1, -3.699044, -7.079285, 1, -0.5, 0.5, 0.5,
-1, -3.699044, -7.079285, 1, 1.5, 0.5, 0.5,
-1, -3.699044, -7.079285, 0, 1.5, 0.5, 0.5,
0, -3.699044, -7.079285, 0, -0.5, 0.5, 0.5,
0, -3.699044, -7.079285, 1, -0.5, 0.5, 0.5,
0, -3.699044, -7.079285, 1, 1.5, 0.5, 0.5,
0, -3.699044, -7.079285, 0, 1.5, 0.5, 0.5,
1, -3.699044, -7.079285, 0, -0.5, 0.5, 0.5,
1, -3.699044, -7.079285, 1, -0.5, 0.5, 0.5,
1, -3.699044, -7.079285, 1, 1.5, 0.5, 0.5,
1, -3.699044, -7.079285, 0, 1.5, 0.5, 0.5,
2, -3.699044, -7.079285, 0, -0.5, 0.5, 0.5,
2, -3.699044, -7.079285, 1, -0.5, 0.5, 0.5,
2, -3.699044, -7.079285, 1, 1.5, 0.5, 0.5,
2, -3.699044, -7.079285, 0, 1.5, 0.5, 0.5,
3, -3.699044, -7.079285, 0, -0.5, 0.5, 0.5,
3, -3.699044, -7.079285, 1, -0.5, 0.5, 0.5,
3, -3.699044, -7.079285, 1, 1.5, 0.5, 0.5,
3, -3.699044, -7.079285, 0, 1.5, 0.5, 0.5
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
-2.967925, -3, -6.160714,
-2.967925, 3, -6.160714,
-2.967925, -3, -6.160714,
-3.126436, -3, -6.466905,
-2.967925, -2, -6.160714,
-3.126436, -2, -6.466905,
-2.967925, -1, -6.160714,
-3.126436, -1, -6.466905,
-2.967925, 0, -6.160714,
-3.126436, 0, -6.466905,
-2.967925, 1, -6.160714,
-3.126436, 1, -6.466905,
-2.967925, 2, -6.160714,
-3.126436, 2, -6.466905,
-2.967925, 3, -6.160714,
-3.126436, 3, -6.466905
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
-3.44346, -3, -7.079285, 0, -0.5, 0.5, 0.5,
-3.44346, -3, -7.079285, 1, -0.5, 0.5, 0.5,
-3.44346, -3, -7.079285, 1, 1.5, 0.5, 0.5,
-3.44346, -3, -7.079285, 0, 1.5, 0.5, 0.5,
-3.44346, -2, -7.079285, 0, -0.5, 0.5, 0.5,
-3.44346, -2, -7.079285, 1, -0.5, 0.5, 0.5,
-3.44346, -2, -7.079285, 1, 1.5, 0.5, 0.5,
-3.44346, -2, -7.079285, 0, 1.5, 0.5, 0.5,
-3.44346, -1, -7.079285, 0, -0.5, 0.5, 0.5,
-3.44346, -1, -7.079285, 1, -0.5, 0.5, 0.5,
-3.44346, -1, -7.079285, 1, 1.5, 0.5, 0.5,
-3.44346, -1, -7.079285, 0, 1.5, 0.5, 0.5,
-3.44346, 0, -7.079285, 0, -0.5, 0.5, 0.5,
-3.44346, 0, -7.079285, 1, -0.5, 0.5, 0.5,
-3.44346, 0, -7.079285, 1, 1.5, 0.5, 0.5,
-3.44346, 0, -7.079285, 0, 1.5, 0.5, 0.5,
-3.44346, 1, -7.079285, 0, -0.5, 0.5, 0.5,
-3.44346, 1, -7.079285, 1, -0.5, 0.5, 0.5,
-3.44346, 1, -7.079285, 1, 1.5, 0.5, 0.5,
-3.44346, 1, -7.079285, 0, 1.5, 0.5, 0.5,
-3.44346, 2, -7.079285, 0, -0.5, 0.5, 0.5,
-3.44346, 2, -7.079285, 1, -0.5, 0.5, 0.5,
-3.44346, 2, -7.079285, 1, 1.5, 0.5, 0.5,
-3.44346, 2, -7.079285, 0, 1.5, 0.5, 0.5,
-3.44346, 3, -7.079285, 0, -0.5, 0.5, 0.5,
-3.44346, 3, -7.079285, 1, -0.5, 0.5, 0.5,
-3.44346, 3, -7.079285, 1, 1.5, 0.5, 0.5,
-3.44346, 3, -7.079285, 0, 1.5, 0.5, 0.5
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
-2.967925, -3.202892, -4,
-2.967925, -3.202892, 4,
-2.967925, -3.202892, -4,
-3.126436, -3.368276, -4,
-2.967925, -3.202892, -2,
-3.126436, -3.368276, -2,
-2.967925, -3.202892, 0,
-3.126436, -3.368276, 0,
-2.967925, -3.202892, 2,
-3.126436, -3.368276, 2,
-2.967925, -3.202892, 4,
-3.126436, -3.368276, 4
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
-3.44346, -3.699044, -4, 0, -0.5, 0.5, 0.5,
-3.44346, -3.699044, -4, 1, -0.5, 0.5, 0.5,
-3.44346, -3.699044, -4, 1, 1.5, 0.5, 0.5,
-3.44346, -3.699044, -4, 0, 1.5, 0.5, 0.5,
-3.44346, -3.699044, -2, 0, -0.5, 0.5, 0.5,
-3.44346, -3.699044, -2, 1, -0.5, 0.5, 0.5,
-3.44346, -3.699044, -2, 1, 1.5, 0.5, 0.5,
-3.44346, -3.699044, -2, 0, 1.5, 0.5, 0.5,
-3.44346, -3.699044, 0, 0, -0.5, 0.5, 0.5,
-3.44346, -3.699044, 0, 1, -0.5, 0.5, 0.5,
-3.44346, -3.699044, 0, 1, 1.5, 0.5, 0.5,
-3.44346, -3.699044, 0, 0, 1.5, 0.5, 0.5,
-3.44346, -3.699044, 2, 0, -0.5, 0.5, 0.5,
-3.44346, -3.699044, 2, 1, -0.5, 0.5, 0.5,
-3.44346, -3.699044, 2, 1, 1.5, 0.5, 0.5,
-3.44346, -3.699044, 2, 0, 1.5, 0.5, 0.5,
-3.44346, -3.699044, 4, 0, -0.5, 0.5, 0.5,
-3.44346, -3.699044, 4, 1, -0.5, 0.5, 0.5,
-3.44346, -3.699044, 4, 1, 1.5, 0.5, 0.5,
-3.44346, -3.699044, 4, 0, 1.5, 0.5, 0.5
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
-2.967925, -3.202892, -6.160714,
-2.967925, 3.412476, -6.160714,
-2.967925, -3.202892, 6.086901,
-2.967925, 3.412476, 6.086901,
-2.967925, -3.202892, -6.160714,
-2.967925, -3.202892, 6.086901,
-2.967925, 3.412476, -6.160714,
-2.967925, 3.412476, 6.086901,
-2.967925, -3.202892, -6.160714,
3.372554, -3.202892, -6.160714,
-2.967925, -3.202892, 6.086901,
3.372554, -3.202892, 6.086901,
-2.967925, 3.412476, -6.160714,
3.372554, 3.412476, -6.160714,
-2.967925, 3.412476, 6.086901,
3.372554, 3.412476, 6.086901,
3.372554, -3.202892, -6.160714,
3.372554, 3.412476, -6.160714,
3.372554, -3.202892, 6.086901,
3.372554, 3.412476, 6.086901,
3.372554, -3.202892, -6.160714,
3.372554, -3.202892, 6.086901,
3.372554, 3.412476, -6.160714,
3.372554, 3.412476, 6.086901
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
var radius = 8.167788;
var distance = 36.33942;
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
mvMatrix.translate( -0.2023146, -0.1047922, 0.03690648 );
mvMatrix.scale( 1.392824, 1.334948, 0.7210524 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.33942);
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
thiamethoxam<-read.table("thiamethoxam.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiamethoxam$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiamethoxam' not found
```

```r
y<-thiamethoxam$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiamethoxam' not found
```

```r
z<-thiamethoxam$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiamethoxam' not found
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
-2.875587, 0.9795889, -1.956757, 0, 0, 1, 1, 1,
-2.784425, -1.305299, -1.314944, 1, 0, 0, 1, 1,
-2.679708, 0.7529023, 0.8440882, 1, 0, 0, 1, 1,
-2.506913, 1.472658, -2.348509, 1, 0, 0, 1, 1,
-2.408463, 1.415435, 0.05567051, 1, 0, 0, 1, 1,
-2.379342, -0.9604652, -3.489724, 1, 0, 0, 1, 1,
-2.331161, -1.168866, -1.775195, 0, 0, 0, 1, 1,
-2.271778, -0.06634977, -1.864593, 0, 0, 0, 1, 1,
-2.268025, -0.909658, -2.678023, 0, 0, 0, 1, 1,
-2.227295, 1.593667, -2.138258, 0, 0, 0, 1, 1,
-2.210825, -1.26923, -1.637454, 0, 0, 0, 1, 1,
-2.200732, -2.299809, -1.349252, 0, 0, 0, 1, 1,
-2.152024, -3.017823, -2.183784, 0, 0, 0, 1, 1,
-2.120701, 0.2091957, -1.027245, 1, 1, 1, 1, 1,
-2.104027, 0.2326988, -2.638376, 1, 1, 1, 1, 1,
-2.077331, -1.968367, -2.133871, 1, 1, 1, 1, 1,
-2.063249, 1.185129, -1.252491, 1, 1, 1, 1, 1,
-2.042705, -0.5590358, -1.902528, 1, 1, 1, 1, 1,
-1.998822, 1.913159, -1.680962, 1, 1, 1, 1, 1,
-1.970235, 1.560814, -2.503916, 1, 1, 1, 1, 1,
-1.953471, 0.3278721, -4.40468, 1, 1, 1, 1, 1,
-1.913684, -0.4744404, -1.568356, 1, 1, 1, 1, 1,
-1.91131, 0.7197813, -2.037375, 1, 1, 1, 1, 1,
-1.850108, 0.8486479, -1.470937, 1, 1, 1, 1, 1,
-1.844548, 0.4870744, -0.754795, 1, 1, 1, 1, 1,
-1.841415, 1.312092, -2.598094, 1, 1, 1, 1, 1,
-1.830842, -0.4781408, -1.902687, 1, 1, 1, 1, 1,
-1.822036, -1.226337, -2.347125, 1, 1, 1, 1, 1,
-1.769853, 0.03462943, -0.896111, 0, 0, 1, 1, 1,
-1.757783, 0.1133556, -0.9077787, 1, 0, 0, 1, 1,
-1.751133, 0.7243994, 0.2644752, 1, 0, 0, 1, 1,
-1.739135, -1.056376, -2.374361, 1, 0, 0, 1, 1,
-1.730976, -0.09350158, -2.14088, 1, 0, 0, 1, 1,
-1.726916, -1.860926, -3.947895, 1, 0, 0, 1, 1,
-1.712566, 0.1284851, -1.270791, 0, 0, 0, 1, 1,
-1.687977, 0.00285287, 0.3159436, 0, 0, 0, 1, 1,
-1.679016, -1.521063, -0.9830598, 0, 0, 0, 1, 1,
-1.67787, 2.18868, -2.078872, 0, 0, 0, 1, 1,
-1.652717, -1.466794, -1.114565, 0, 0, 0, 1, 1,
-1.652472, 0.5364636, 0.005129987, 0, 0, 0, 1, 1,
-1.64966, -0.06586467, 1.261388, 0, 0, 0, 1, 1,
-1.647717, -0.03535613, -2.821326, 1, 1, 1, 1, 1,
-1.644461, 1.239596, -0.1134369, 1, 1, 1, 1, 1,
-1.642662, -1.906731, -2.814394, 1, 1, 1, 1, 1,
-1.635078, 0.8309147, -0.481443, 1, 1, 1, 1, 1,
-1.599101, -0.1545773, -2.999653, 1, 1, 1, 1, 1,
-1.598088, 0.414744, -1.22312, 1, 1, 1, 1, 1,
-1.590163, 0.9955946, -0.3158505, 1, 1, 1, 1, 1,
-1.589441, 0.5450828, -0.5417917, 1, 1, 1, 1, 1,
-1.586208, -1.017703, -3.711324, 1, 1, 1, 1, 1,
-1.579742, 0.1163899, 0.01963045, 1, 1, 1, 1, 1,
-1.572822, -0.7014727, -1.013269, 1, 1, 1, 1, 1,
-1.570159, 0.2758092, -1.995101, 1, 1, 1, 1, 1,
-1.557997, 0.7445105, -0.1977716, 1, 1, 1, 1, 1,
-1.552732, 0.8666619, -1.345266, 1, 1, 1, 1, 1,
-1.549654, -0.4112875, -2.397655, 1, 1, 1, 1, 1,
-1.542643, -0.9689822, -2.139256, 0, 0, 1, 1, 1,
-1.540713, 0.1233774, -1.644254, 1, 0, 0, 1, 1,
-1.53891, -1.024044, -1.157181, 1, 0, 0, 1, 1,
-1.536265, 0.09432373, -1.374924, 1, 0, 0, 1, 1,
-1.531462, -0.4389384, -2.718033, 1, 0, 0, 1, 1,
-1.526838, 0.4435224, 0.7001613, 1, 0, 0, 1, 1,
-1.525134, -0.1603857, 0.8349253, 0, 0, 0, 1, 1,
-1.513055, 1.248527, -0.7935066, 0, 0, 0, 1, 1,
-1.503408, 0.7432971, -0.1753182, 0, 0, 0, 1, 1,
-1.49581, -1.646029, -2.055353, 0, 0, 0, 1, 1,
-1.495452, 1.1833, 0.7157385, 0, 0, 0, 1, 1,
-1.48761, -0.8119007, -1.66955, 0, 0, 0, 1, 1,
-1.485413, 1.257413, -1.519015, 0, 0, 0, 1, 1,
-1.479816, -1.581278, -0.5842621, 1, 1, 1, 1, 1,
-1.47741, -0.6996787, -0.2151777, 1, 1, 1, 1, 1,
-1.477056, -0.9544969, -3.613571, 1, 1, 1, 1, 1,
-1.473812, -1.002739, -3.380085, 1, 1, 1, 1, 1,
-1.47317, -0.7990975, -0.4919823, 1, 1, 1, 1, 1,
-1.460125, 1.755292, 0.2968458, 1, 1, 1, 1, 1,
-1.455022, -0.5485945, -2.265539, 1, 1, 1, 1, 1,
-1.451727, -0.3098183, -2.90824, 1, 1, 1, 1, 1,
-1.450608, -1.397552, -2.134661, 1, 1, 1, 1, 1,
-1.445078, -0.2390933, -2.540147, 1, 1, 1, 1, 1,
-1.430421, 0.4384467, -0.3288527, 1, 1, 1, 1, 1,
-1.427937, 1.62245, -1.977823, 1, 1, 1, 1, 1,
-1.42745, -0.8751169, -2.531449, 1, 1, 1, 1, 1,
-1.425969, 0.5659758, -1.969601, 1, 1, 1, 1, 1,
-1.424532, -0.8145278, -1.089724, 1, 1, 1, 1, 1,
-1.424128, 0.7032241, -1.826214, 0, 0, 1, 1, 1,
-1.422417, -0.07409949, -1.691928, 1, 0, 0, 1, 1,
-1.395892, -1.659982, -0.588257, 1, 0, 0, 1, 1,
-1.39572, -1.385131, -2.170065, 1, 0, 0, 1, 1,
-1.380921, 0.7672478, -0.3904042, 1, 0, 0, 1, 1,
-1.376991, -0.463923, -1.358342, 1, 0, 0, 1, 1,
-1.36647, -0.6157857, -1.881756, 0, 0, 0, 1, 1,
-1.359869, 0.1815972, -0.8502972, 0, 0, 0, 1, 1,
-1.34168, 0.8711301, -1.010585, 0, 0, 0, 1, 1,
-1.341119, -0.8330598, -2.429397, 0, 0, 0, 1, 1,
-1.340785, 1.722464, 0.3250308, 0, 0, 0, 1, 1,
-1.340678, -0.4541012, -2.213123, 0, 0, 0, 1, 1,
-1.330297, -0.3457891, -1.590598, 0, 0, 0, 1, 1,
-1.330086, 2.389807, 1.345762, 1, 1, 1, 1, 1,
-1.329535, -0.1823891, -1.436774, 1, 1, 1, 1, 1,
-1.327861, -0.6790654, -1.793117, 1, 1, 1, 1, 1,
-1.324793, 0.02345052, -2.531543, 1, 1, 1, 1, 1,
-1.319427, 0.3474684, -0.9698858, 1, 1, 1, 1, 1,
-1.315878, -1.884077, -2.533801, 1, 1, 1, 1, 1,
-1.314935, -1.301999, -4.023943, 1, 1, 1, 1, 1,
-1.311642, -0.1014667, -0.9737632, 1, 1, 1, 1, 1,
-1.304119, 1.078794, 0.06070675, 1, 1, 1, 1, 1,
-1.303982, -0.7671822, -2.149923, 1, 1, 1, 1, 1,
-1.295943, 0.01417976, -1.502855, 1, 1, 1, 1, 1,
-1.291753, 0.1999786, -2.19923, 1, 1, 1, 1, 1,
-1.264862, -2.203874, -2.523587, 1, 1, 1, 1, 1,
-1.23936, 0.6892377, -1.637578, 1, 1, 1, 1, 1,
-1.237618, -0.5809576, -2.149353, 1, 1, 1, 1, 1,
-1.23573, -0.1828534, -2.89252, 0, 0, 1, 1, 1,
-1.234411, -0.5461984, -0.2799864, 1, 0, 0, 1, 1,
-1.233644, -1.410302, -1.429247, 1, 0, 0, 1, 1,
-1.221116, -1.429961, -1.985395, 1, 0, 0, 1, 1,
-1.219889, 1.113623, 0.5662153, 1, 0, 0, 1, 1,
-1.211786, 0.694939, -0.6536921, 1, 0, 0, 1, 1,
-1.211371, -1.414455, -2.447295, 0, 0, 0, 1, 1,
-1.208647, 0.3586646, -1.878772, 0, 0, 0, 1, 1,
-1.205146, 0.2233841, -0.7382191, 0, 0, 0, 1, 1,
-1.200048, -1.16872, -1.006928, 0, 0, 0, 1, 1,
-1.199534, -0.2907282, -1.202887, 0, 0, 0, 1, 1,
-1.184504, -1.369955, -2.616706, 0, 0, 0, 1, 1,
-1.182256, 0.6809973, -1.1526, 0, 0, 0, 1, 1,
-1.174238, -1.662747, -2.310442, 1, 1, 1, 1, 1,
-1.159785, -0.1467194, -1.851118, 1, 1, 1, 1, 1,
-1.156263, 0.3174175, -0.9641251, 1, 1, 1, 1, 1,
-1.144448, -0.2440526, -2.395716, 1, 1, 1, 1, 1,
-1.141854, -0.9528967, -1.205545, 1, 1, 1, 1, 1,
-1.14162, -1.558387, -2.306823, 1, 1, 1, 1, 1,
-1.136709, 0.5546079, -0.5486175, 1, 1, 1, 1, 1,
-1.129277, -2.554188, -2.178156, 1, 1, 1, 1, 1,
-1.11303, -0.161434, 0.1926251, 1, 1, 1, 1, 1,
-1.109688, 0.09055198, 0.04812863, 1, 1, 1, 1, 1,
-1.10811, -2.008894, -3.372361, 1, 1, 1, 1, 1,
-1.105766, -2.577432, -3.101115, 1, 1, 1, 1, 1,
-1.10507, 0.2372436, -0.7033439, 1, 1, 1, 1, 1,
-1.104553, 0.1492676, -2.964921, 1, 1, 1, 1, 1,
-1.101382, 0.1412812, -0.7521265, 1, 1, 1, 1, 1,
-1.10103, -0.2738532, -2.323663, 0, 0, 1, 1, 1,
-1.100974, 1.151317, 0.9004605, 1, 0, 0, 1, 1,
-1.099774, 0.06348174, -2.848988, 1, 0, 0, 1, 1,
-1.0974, -1.850821, -2.224717, 1, 0, 0, 1, 1,
-1.089955, 1.13581, 1.011238, 1, 0, 0, 1, 1,
-1.088408, -1.192663, -0.2771494, 1, 0, 0, 1, 1,
-1.072848, -0.6234942, -1.829235, 0, 0, 0, 1, 1,
-1.072701, 0.1601932, -2.221297, 0, 0, 0, 1, 1,
-1.071746, -0.4431294, -0.9934591, 0, 0, 0, 1, 1,
-1.065414, 0.5265197, 0.08396431, 0, 0, 0, 1, 1,
-1.050022, -0.3620259, -1.699652, 0, 0, 0, 1, 1,
-1.038317, 0.1821463, -0.6185051, 0, 0, 0, 1, 1,
-1.037539, -0.2240942, -1.090875, 0, 0, 0, 1, 1,
-1.0358, -0.1350292, -1.004404, 1, 1, 1, 1, 1,
-1.035173, 0.2709826, -0.1869749, 1, 1, 1, 1, 1,
-1.027803, 0.7770252, -1.671147, 1, 1, 1, 1, 1,
-1.023185, 0.1969826, -2.527651, 1, 1, 1, 1, 1,
-1.017617, 0.2913521, -1.534951, 1, 1, 1, 1, 1,
-1.013023, -0.181018, -1.849001, 1, 1, 1, 1, 1,
-1.007602, -0.9778864, -1.511625, 1, 1, 1, 1, 1,
-0.9951891, 0.2057001, -0.6694735, 1, 1, 1, 1, 1,
-0.9912572, 0.9648414, -0.3946406, 1, 1, 1, 1, 1,
-0.9866262, -2.388876, -2.45646, 1, 1, 1, 1, 1,
-0.9862781, 0.3628767, -1.776786, 1, 1, 1, 1, 1,
-0.9829081, -0.6032062, -1.306303, 1, 1, 1, 1, 1,
-0.9805144, 0.02321565, -2.355257, 1, 1, 1, 1, 1,
-0.9704978, -0.5960151, -2.496805, 1, 1, 1, 1, 1,
-0.9662958, -0.5773601, -3.122132, 1, 1, 1, 1, 1,
-0.9634864, 0.1234071, -2.812781, 0, 0, 1, 1, 1,
-0.960954, -0.3028562, -1.214634, 1, 0, 0, 1, 1,
-0.9606298, -1.025773, -2.148132, 1, 0, 0, 1, 1,
-0.9599887, 0.2520655, -1.583094, 1, 0, 0, 1, 1,
-0.9561563, -0.3417116, -2.717799, 1, 0, 0, 1, 1,
-0.9522892, 0.128479, -1.274999, 1, 0, 0, 1, 1,
-0.9514393, -1.499194, -3.291975, 0, 0, 0, 1, 1,
-0.9508247, -0.1882443, -1.145364, 0, 0, 0, 1, 1,
-0.9445935, 0.2384715, -2.655916, 0, 0, 0, 1, 1,
-0.9432133, 0.3458208, -0.9928404, 0, 0, 0, 1, 1,
-0.9396347, 0.8025463, -2.004516, 0, 0, 0, 1, 1,
-0.9378635, -0.6278377, -3.030533, 0, 0, 0, 1, 1,
-0.9238719, 0.2835983, -0.2763065, 0, 0, 0, 1, 1,
-0.9215589, -0.605737, -3.142784, 1, 1, 1, 1, 1,
-0.9205914, 0.9668254, -1.370261, 1, 1, 1, 1, 1,
-0.9204136, -1.584446, -1.806589, 1, 1, 1, 1, 1,
-0.9180466, 0.7050452, 0.4847138, 1, 1, 1, 1, 1,
-0.9169858, 0.2480669, -1.358378, 1, 1, 1, 1, 1,
-0.9156325, -1.183568, -1.337999, 1, 1, 1, 1, 1,
-0.909544, -2.340331, -0.8771205, 1, 1, 1, 1, 1,
-0.9085789, -0.8282727, -2.346549, 1, 1, 1, 1, 1,
-0.9071994, -0.6294026, -2.498521, 1, 1, 1, 1, 1,
-0.899326, -0.3891362, -2.927897, 1, 1, 1, 1, 1,
-0.8975173, 0.869126, -2.929202, 1, 1, 1, 1, 1,
-0.8913788, -0.969009, -4.414983, 1, 1, 1, 1, 1,
-0.8840269, 0.2035328, -1.538729, 1, 1, 1, 1, 1,
-0.8819034, 0.6076028, -0.256289, 1, 1, 1, 1, 1,
-0.8754227, -0.1765207, -2.231992, 1, 1, 1, 1, 1,
-0.866726, 1.134073, 0.4979676, 0, 0, 1, 1, 1,
-0.8498861, -2.115403, -2.771946, 1, 0, 0, 1, 1,
-0.8473235, -0.6851946, -1.893606, 1, 0, 0, 1, 1,
-0.8427084, 1.050914, -1.057724, 1, 0, 0, 1, 1,
-0.8399848, -0.4346695, -2.558391, 1, 0, 0, 1, 1,
-0.8364378, -0.1020099, -2.335041, 1, 0, 0, 1, 1,
-0.8344117, -0.3151195, -4.091933, 0, 0, 0, 1, 1,
-0.8338754, 1.134614, 0.2373505, 0, 0, 0, 1, 1,
-0.8283013, 1.247585, 0.9518253, 0, 0, 0, 1, 1,
-0.8232713, -0.8062372, -2.710912, 0, 0, 0, 1, 1,
-0.8038458, -1.104374, -2.245791, 0, 0, 0, 1, 1,
-0.8022792, -0.4936151, -1.580275, 0, 0, 0, 1, 1,
-0.7998903, -0.05864515, -1.793318, 0, 0, 0, 1, 1,
-0.7995242, 0.5450715, -0.3859478, 1, 1, 1, 1, 1,
-0.7990513, -1.075659, -2.715806, 1, 1, 1, 1, 1,
-0.7967087, 0.6889529, -0.7353635, 1, 1, 1, 1, 1,
-0.791571, 0.9686102, -0.005962362, 1, 1, 1, 1, 1,
-0.7908842, -0.8753673, -2.372267, 1, 1, 1, 1, 1,
-0.7887512, -1.193409, -2.774925, 1, 1, 1, 1, 1,
-0.7880263, 0.129408, -1.708702, 1, 1, 1, 1, 1,
-0.7870455, -1.080463, -3.115489, 1, 1, 1, 1, 1,
-0.7834769, 0.04786876, 0.5641477, 1, 1, 1, 1, 1,
-0.7810326, -1.230412, -2.869241, 1, 1, 1, 1, 1,
-0.7803834, 0.8241012, -1.672456, 1, 1, 1, 1, 1,
-0.7801869, 0.64252, -2.156116, 1, 1, 1, 1, 1,
-0.7790391, -0.9356071, -3.561789, 1, 1, 1, 1, 1,
-0.7731482, -0.1950638, -2.047107, 1, 1, 1, 1, 1,
-0.7680612, -1.146767, -2.275321, 1, 1, 1, 1, 1,
-0.7668484, 0.3229343, -0.7691693, 0, 0, 1, 1, 1,
-0.7622849, 0.4893985, -1.153852, 1, 0, 0, 1, 1,
-0.7609012, 0.0189851, -1.441377, 1, 0, 0, 1, 1,
-0.7603228, -0.7712222, -2.633527, 1, 0, 0, 1, 1,
-0.7560243, -1.356443, -1.214784, 1, 0, 0, 1, 1,
-0.7490798, -0.02517669, -0.503565, 1, 0, 0, 1, 1,
-0.7479944, -1.418394, -2.056734, 0, 0, 0, 1, 1,
-0.7452779, -0.1580655, -2.017375, 0, 0, 0, 1, 1,
-0.7374142, -1.110246, -2.678149, 0, 0, 0, 1, 1,
-0.7361806, 1.208284, -1.777443, 0, 0, 0, 1, 1,
-0.7346672, -1.223743, -2.512982, 0, 0, 0, 1, 1,
-0.7344276, -0.06424758, -2.482012, 0, 0, 0, 1, 1,
-0.7296881, 0.3543914, -0.1968486, 0, 0, 0, 1, 1,
-0.72791, 0.104727, -2.241139, 1, 1, 1, 1, 1,
-0.7240189, 0.1593475, -1.684256, 1, 1, 1, 1, 1,
-0.7098492, -0.7358985, -4.167671, 1, 1, 1, 1, 1,
-0.7069139, -1.152186, -2.018738, 1, 1, 1, 1, 1,
-0.7067578, -1.770711, -3.218683, 1, 1, 1, 1, 1,
-0.70397, 1.375073, -1.804232, 1, 1, 1, 1, 1,
-0.7039233, 1.78723, -0.3741834, 1, 1, 1, 1, 1,
-0.7038986, -1.353113, -2.959603, 1, 1, 1, 1, 1,
-0.7028015, -0.301001, -1.968428, 1, 1, 1, 1, 1,
-0.6975716, -1.307943, -4.43212, 1, 1, 1, 1, 1,
-0.6923237, 1.661592, -0.7675476, 1, 1, 1, 1, 1,
-0.6899289, 0.7458236, -1.780171, 1, 1, 1, 1, 1,
-0.6832045, -0.8615156, -2.137652, 1, 1, 1, 1, 1,
-0.6816332, 0.7411149, -0.01899885, 1, 1, 1, 1, 1,
-0.6801999, 0.8984911, -0.8440429, 1, 1, 1, 1, 1,
-0.6719694, -1.681929, -3.854132, 0, 0, 1, 1, 1,
-0.6638462, 0.1198636, -1.85941, 1, 0, 0, 1, 1,
-0.6612184, 0.4362905, -0.6165423, 1, 0, 0, 1, 1,
-0.6607825, 0.2113749, -1.768494, 1, 0, 0, 1, 1,
-0.6606777, 0.02235826, -2.073554, 1, 0, 0, 1, 1,
-0.6602498, 1.195103, -1.036723, 1, 0, 0, 1, 1,
-0.6573989, 1.054585, -0.01750478, 0, 0, 0, 1, 1,
-0.646542, 0.9060752, -0.7117239, 0, 0, 0, 1, 1,
-0.6424236, 0.4109583, -1.195457, 0, 0, 0, 1, 1,
-0.6395996, 0.102251, -1.68632, 0, 0, 0, 1, 1,
-0.6379501, -0.1155777, -2.915133, 0, 0, 0, 1, 1,
-0.6300965, -0.0466842, -0.7881618, 0, 0, 0, 1, 1,
-0.6300566, -0.921163, -2.926617, 0, 0, 0, 1, 1,
-0.6300312, -0.9422733, -2.176501, 1, 1, 1, 1, 1,
-0.6250697, 0.6621798, 0.3466314, 1, 1, 1, 1, 1,
-0.624543, -1.397196, -1.18313, 1, 1, 1, 1, 1,
-0.6226007, -0.3432867, -2.493097, 1, 1, 1, 1, 1,
-0.6191614, -0.4330983, -2.818259, 1, 1, 1, 1, 1,
-0.6179552, 0.3115457, -1.314039, 1, 1, 1, 1, 1,
-0.6155916, 0.491761, 0.7290669, 1, 1, 1, 1, 1,
-0.6152341, 1.686587, -0.5299064, 1, 1, 1, 1, 1,
-0.613202, -0.479619, -3.623405, 1, 1, 1, 1, 1,
-0.6125929, 0.8050958, 0.3544344, 1, 1, 1, 1, 1,
-0.6119381, -0.2433378, -1.843016, 1, 1, 1, 1, 1,
-0.6065954, -0.1451764, 0.7812104, 1, 1, 1, 1, 1,
-0.6040601, -1.01179, -1.667036, 1, 1, 1, 1, 1,
-0.6025672, 0.7414808, -0.2178579, 1, 1, 1, 1, 1,
-0.6015322, -1.103427, -2.529123, 1, 1, 1, 1, 1,
-0.6006677, 1.016845, -1.407077, 0, 0, 1, 1, 1,
-0.5968264, 0.1034867, -1.915846, 1, 0, 0, 1, 1,
-0.5889609, -0.02972263, -2.46558, 1, 0, 0, 1, 1,
-0.5826414, -0.5637433, -2.857455, 1, 0, 0, 1, 1,
-0.5792245, 0.1917212, -0.6106582, 1, 0, 0, 1, 1,
-0.5715594, 0.4406138, -0.8159227, 1, 0, 0, 1, 1,
-0.565668, 0.7812964, -0.9118909, 0, 0, 0, 1, 1,
-0.5593447, 0.7068433, -2.053216, 0, 0, 0, 1, 1,
-0.5574625, 0.2485651, -1.426547, 0, 0, 0, 1, 1,
-0.5567878, 0.04345859, -0.5502858, 0, 0, 0, 1, 1,
-0.5555701, -1.719213, -3.830335, 0, 0, 0, 1, 1,
-0.5554225, -0.8359174, -0.5060782, 0, 0, 0, 1, 1,
-0.5550336, 0.8870578, -0.6007556, 0, 0, 0, 1, 1,
-0.5536413, 1.001215, -2.759158, 1, 1, 1, 1, 1,
-0.5514345, -0.2435945, -2.203526, 1, 1, 1, 1, 1,
-0.549728, 0.0911339, -1.473429, 1, 1, 1, 1, 1,
-0.5463492, -1.098062, -2.35136, 1, 1, 1, 1, 1,
-0.5455916, -0.3700632, -1.44706, 1, 1, 1, 1, 1,
-0.543246, -0.005410004, -2.497029, 1, 1, 1, 1, 1,
-0.5360947, -0.00869353, -1.486976, 1, 1, 1, 1, 1,
-0.5351252, 0.4927682, -2.046029, 1, 1, 1, 1, 1,
-0.5302227, -0.850857, -1.215877, 1, 1, 1, 1, 1,
-0.5296326, 0.9758068, 1.175987, 1, 1, 1, 1, 1,
-0.5288863, -0.8076743, -2.295886, 1, 1, 1, 1, 1,
-0.5278701, 1.141389, 1.668969, 1, 1, 1, 1, 1,
-0.5255058, 0.3853678, -0.1974978, 1, 1, 1, 1, 1,
-0.5224129, -0.9710491, -2.857498, 1, 1, 1, 1, 1,
-0.5212308, -0.9666577, -2.568824, 1, 1, 1, 1, 1,
-0.5207763, 1.24556, -0.603956, 0, 0, 1, 1, 1,
-0.5169931, -0.2250711, 0.1498174, 1, 0, 0, 1, 1,
-0.5015376, -1.819131, -2.916751, 1, 0, 0, 1, 1,
-0.5007612, -0.5693149, -3.377929, 1, 0, 0, 1, 1,
-0.5007032, 1.881719, 0.0678646, 1, 0, 0, 1, 1,
-0.4936477, 0.3183612, -1.099101, 1, 0, 0, 1, 1,
-0.4844696, -1.335471, -2.065861, 0, 0, 0, 1, 1,
-0.4804831, 0.6474485, 0.2372881, 0, 0, 0, 1, 1,
-0.4791841, -0.08215255, -1.770987, 0, 0, 0, 1, 1,
-0.4771283, 1.538779, -0.2995466, 0, 0, 0, 1, 1,
-0.4741647, 0.0759515, -2.638878, 0, 0, 0, 1, 1,
-0.4740783, -0.874387, -2.255101, 0, 0, 0, 1, 1,
-0.4710878, -0.4729412, -0.8971742, 0, 0, 0, 1, 1,
-0.4634421, 0.364587, 1.216738, 1, 1, 1, 1, 1,
-0.4624659, -0.8273931, -3.209726, 1, 1, 1, 1, 1,
-0.4622222, -0.2416684, -2.556748, 1, 1, 1, 1, 1,
-0.461175, 0.448781, -2.246696, 1, 1, 1, 1, 1,
-0.4584802, -0.9565274, -1.867182, 1, 1, 1, 1, 1,
-0.4565324, -0.3606596, -0.2453715, 1, 1, 1, 1, 1,
-0.448636, -0.2877938, -3.15261, 1, 1, 1, 1, 1,
-0.4467682, -0.86293, -0.3908271, 1, 1, 1, 1, 1,
-0.4402937, -1.921575, -3.402709, 1, 1, 1, 1, 1,
-0.4387975, -0.9535226, -2.867172, 1, 1, 1, 1, 1,
-0.4363086, -0.7116584, -2.299328, 1, 1, 1, 1, 1,
-0.433001, 0.209749, -1.165698, 1, 1, 1, 1, 1,
-0.4324114, -1.652065, -2.317642, 1, 1, 1, 1, 1,
-0.4312355, 1.546154, -1.375716, 1, 1, 1, 1, 1,
-0.4297088, -0.4625344, -1.908633, 1, 1, 1, 1, 1,
-0.4282917, 0.895362, -1.303415, 0, 0, 1, 1, 1,
-0.4273544, -0.1155472, -0.9670787, 1, 0, 0, 1, 1,
-0.427222, 1.002314, -0.1998722, 1, 0, 0, 1, 1,
-0.4252113, -0.7231351, -3.120158, 1, 0, 0, 1, 1,
-0.4237712, -0.02457759, -1.194746, 1, 0, 0, 1, 1,
-0.4223092, -1.165848, -2.623698, 1, 0, 0, 1, 1,
-0.4134799, 0.5561663, -0.02131327, 0, 0, 0, 1, 1,
-0.4049933, 0.4900506, -0.6759903, 0, 0, 0, 1, 1,
-0.3981314, 2.747586, -0.4131425, 0, 0, 0, 1, 1,
-0.3915502, 0.3607611, -0.4687057, 0, 0, 0, 1, 1,
-0.3888771, 0.157169, -0.3407053, 0, 0, 0, 1, 1,
-0.3877164, 0.7638714, -1.595852, 0, 0, 0, 1, 1,
-0.3863005, -0.4132043, -4.0181, 0, 0, 0, 1, 1,
-0.3790338, -0.1675654, 0.392617, 1, 1, 1, 1, 1,
-0.3759725, -1.129686, -4.004129, 1, 1, 1, 1, 1,
-0.3747815, 0.576988, -0.6634565, 1, 1, 1, 1, 1,
-0.3709624, 0.7926195, -0.03383843, 1, 1, 1, 1, 1,
-0.3694443, -0.7447265, -0.9276085, 1, 1, 1, 1, 1,
-0.3690794, -1.230695, -2.019834, 1, 1, 1, 1, 1,
-0.3682624, 0.9083225, 0.4520184, 1, 1, 1, 1, 1,
-0.3680615, -0.3271756, -1.542121, 1, 1, 1, 1, 1,
-0.3678406, -0.2542313, -3.448083, 1, 1, 1, 1, 1,
-0.3674188, 0.4152879, -1.401963, 1, 1, 1, 1, 1,
-0.3630897, 0.7338238, -0.05616411, 1, 1, 1, 1, 1,
-0.359838, -0.2363692, -3.204863, 1, 1, 1, 1, 1,
-0.3572311, -0.007350799, -0.356939, 1, 1, 1, 1, 1,
-0.3481406, -0.4150555, -1.553377, 1, 1, 1, 1, 1,
-0.3478701, 0.6715773, -0.9533705, 1, 1, 1, 1, 1,
-0.34677, 0.535251, -1.584654, 0, 0, 1, 1, 1,
-0.3454461, 0.2092459, -1.983411, 1, 0, 0, 1, 1,
-0.3417258, -0.4050271, -4.534189, 1, 0, 0, 1, 1,
-0.338453, 0.7066017, -0.447071, 1, 0, 0, 1, 1,
-0.3384353, 1.483222, -0.9777179, 1, 0, 0, 1, 1,
-0.3375628, -0.04762551, -2.548259, 1, 0, 0, 1, 1,
-0.3365383, 0.2140227, -1.135845, 0, 0, 0, 1, 1,
-0.3278112, -0.2335299, -0.621488, 0, 0, 0, 1, 1,
-0.3225093, 0.644173, 0.9680638, 0, 0, 0, 1, 1,
-0.3208629, 0.2593634, -3.556233, 0, 0, 0, 1, 1,
-0.3115761, -1.34417, -1.630481, 0, 0, 0, 1, 1,
-0.3111163, -0.9677538, -1.519593, 0, 0, 0, 1, 1,
-0.3094656, -0.3600681, -2.344117, 0, 0, 0, 1, 1,
-0.3083182, 0.4647079, -0.8792761, 1, 1, 1, 1, 1,
-0.3066827, -0.6883293, -3.686523, 1, 1, 1, 1, 1,
-0.3051728, 0.9775741, -2.053411, 1, 1, 1, 1, 1,
-0.3041054, -1.145167, -4.729315, 1, 1, 1, 1, 1,
-0.298283, -0.003064833, -2.385813, 1, 1, 1, 1, 1,
-0.297315, -1.178853, -3.723189, 1, 1, 1, 1, 1,
-0.2964118, 0.7865388, -0.03219634, 1, 1, 1, 1, 1,
-0.2958604, -1.35837, -4.180541, 1, 1, 1, 1, 1,
-0.2925044, 1.091436, -2.619271, 1, 1, 1, 1, 1,
-0.292104, 0.3856262, -1.007763, 1, 1, 1, 1, 1,
-0.285695, -0.1497311, -1.650556, 1, 1, 1, 1, 1,
-0.2843285, 0.9349901, 0.244426, 1, 1, 1, 1, 1,
-0.2788447, 1.194651, -0.9537256, 1, 1, 1, 1, 1,
-0.2738125, 0.9276868, -1.093065, 1, 1, 1, 1, 1,
-0.2688738, -1.039398, -5.982351, 1, 1, 1, 1, 1,
-0.2680134, -0.2397761, -1.767249, 0, 0, 1, 1, 1,
-0.2653228, 0.5189412, 1.314543, 1, 0, 0, 1, 1,
-0.2641227, -0.5962532, -2.632058, 1, 0, 0, 1, 1,
-0.2574646, -0.9801295, -2.582765, 1, 0, 0, 1, 1,
-0.2553695, 0.8831604, -1.236723, 1, 0, 0, 1, 1,
-0.2468342, -1.492723, -1.930441, 1, 0, 0, 1, 1,
-0.2462455, -0.01912205, -0.8411366, 0, 0, 0, 1, 1,
-0.2446683, 1.1857, -0.9084364, 0, 0, 0, 1, 1,
-0.2445166, 0.1074155, -1.474056, 0, 0, 0, 1, 1,
-0.2422211, 0.1225257, 0.5904333, 0, 0, 0, 1, 1,
-0.2395584, -0.9500846, -1.466026, 0, 0, 0, 1, 1,
-0.2378392, -0.222283, -2.1698, 0, 0, 0, 1, 1,
-0.2365856, 0.3165411, -1.999533, 0, 0, 0, 1, 1,
-0.2343589, 0.5671887, -0.3387909, 1, 1, 1, 1, 1,
-0.2343149, 0.1663896, -0.8694246, 1, 1, 1, 1, 1,
-0.2339586, -1.221677, -4.028804, 1, 1, 1, 1, 1,
-0.2337212, -1.12901, -3.409044, 1, 1, 1, 1, 1,
-0.2315556, 0.43075, -0.6065301, 1, 1, 1, 1, 1,
-0.2293003, 0.313691, -1.899263, 1, 1, 1, 1, 1,
-0.229081, 0.8173256, -0.008949247, 1, 1, 1, 1, 1,
-0.2227808, 1.838337, -0.564675, 1, 1, 1, 1, 1,
-0.2187294, -1.421179, -2.400706, 1, 1, 1, 1, 1,
-0.2170659, -0.04378476, -1.70612, 1, 1, 1, 1, 1,
-0.2163183, 0.8518532, -0.554015, 1, 1, 1, 1, 1,
-0.2149919, -0.553089, -2.170228, 1, 1, 1, 1, 1,
-0.2083289, 0.6915411, -0.7024606, 1, 1, 1, 1, 1,
-0.2018301, 1.008988, 1.556385, 1, 1, 1, 1, 1,
-0.2006361, 0.9970911, -0.3700064, 1, 1, 1, 1, 1,
-0.1978973, 1.145139, -0.2105357, 0, 0, 1, 1, 1,
-0.1967915, -1.969888, -3.004419, 1, 0, 0, 1, 1,
-0.1933858, 0.5036727, 1.152083, 1, 0, 0, 1, 1,
-0.1866391, 1.623108, -1.518332, 1, 0, 0, 1, 1,
-0.1852159, 1.572822, 1.512339, 1, 0, 0, 1, 1,
-0.1843505, -0.8844844, -2.138563, 1, 0, 0, 1, 1,
-0.1819118, 1.87265, 1.432789, 0, 0, 0, 1, 1,
-0.1788676, 0.4144827, -1.446662, 0, 0, 0, 1, 1,
-0.1773077, 1.088178, 1.405524, 0, 0, 0, 1, 1,
-0.175907, -0.02569313, -1.985802, 0, 0, 0, 1, 1,
-0.1746081, 1.632138, -1.3958, 0, 0, 0, 1, 1,
-0.1727649, 1.789222, -1.11974, 0, 0, 0, 1, 1,
-0.1722122, -1.476945, -4.16603, 0, 0, 0, 1, 1,
-0.1713413, 0.3718946, -0.2785239, 1, 1, 1, 1, 1,
-0.1709875, 0.4126714, 1.997808, 1, 1, 1, 1, 1,
-0.1701221, -1.934691, -3.109295, 1, 1, 1, 1, 1,
-0.1699294, 0.09566258, -1.370515, 1, 1, 1, 1, 1,
-0.1648654, 1.03242, -0.2286036, 1, 1, 1, 1, 1,
-0.164059, 1.460059, 1.548045, 1, 1, 1, 1, 1,
-0.1624037, -1.101248, -3.955295, 1, 1, 1, 1, 1,
-0.1569122, -1.670663, -3.342079, 1, 1, 1, 1, 1,
-0.1521056, -0.3038772, -2.449659, 1, 1, 1, 1, 1,
-0.1473286, -1.272442, -2.816055, 1, 1, 1, 1, 1,
-0.1468467, 2.104054, 0.9444361, 1, 1, 1, 1, 1,
-0.1454597, 2.174595, -0.2673709, 1, 1, 1, 1, 1,
-0.1441224, 0.7694333, -1.439307, 1, 1, 1, 1, 1,
-0.1437696, 1.889016, 1.253862, 1, 1, 1, 1, 1,
-0.1424628, 0.3489198, 0.5892355, 1, 1, 1, 1, 1,
-0.1344979, -0.3348635, -1.358558, 0, 0, 1, 1, 1,
-0.1331176, -0.660787, -2.414249, 1, 0, 0, 1, 1,
-0.1318897, 1.562998, -0.5996093, 1, 0, 0, 1, 1,
-0.128714, 0.9949757, -0.4646251, 1, 0, 0, 1, 1,
-0.1266552, -0.3724214, -1.801107, 1, 0, 0, 1, 1,
-0.1245163, -0.6402646, -2.775361, 1, 0, 0, 1, 1,
-0.1241371, -0.6034232, -2.081383, 0, 0, 0, 1, 1,
-0.1240296, 0.8739516, 0.137608, 0, 0, 0, 1, 1,
-0.1194353, 0.326674, -1.722798, 0, 0, 0, 1, 1,
-0.1190879, -0.8810081, -1.874761, 0, 0, 0, 1, 1,
-0.1101033, -0.113404, -1.569456, 0, 0, 0, 1, 1,
-0.1084303, -0.7072493, -2.817405, 0, 0, 0, 1, 1,
-0.1079032, 0.8191227, -0.6390547, 0, 0, 0, 1, 1,
-0.1049774, 2.240424, 1.323909, 1, 1, 1, 1, 1,
-0.1045295, -0.1753227, -2.42522, 1, 1, 1, 1, 1,
-0.1011981, -3.106551, -2.407648, 1, 1, 1, 1, 1,
-0.1007298, 0.117865, -0.558931, 1, 1, 1, 1, 1,
-0.09819283, 0.01429097, -1.956727, 1, 1, 1, 1, 1,
-0.09192564, 0.2333133, 0.2633761, 1, 1, 1, 1, 1,
-0.08710613, 1.443183, -0.52084, 1, 1, 1, 1, 1,
-0.0866029, 1.691265, -1.624569, 1, 1, 1, 1, 1,
-0.08269984, 1.743331, -1.008211, 1, 1, 1, 1, 1,
-0.08068136, 1.109205, 1.496612, 1, 1, 1, 1, 1,
-0.0704904, 0.5936229, -0.193448, 1, 1, 1, 1, 1,
-0.06864529, 0.3569377, -1.555547, 1, 1, 1, 1, 1,
-0.05839466, -0.1464804, -4.432966, 1, 1, 1, 1, 1,
-0.05834791, 0.8062323, 1.108088, 1, 1, 1, 1, 1,
-0.05787507, 0.5310598, 1.127268, 1, 1, 1, 1, 1,
-0.05744122, -0.1626957, -3.117422, 0, 0, 1, 1, 1,
-0.05654272, 0.4449684, 0.985594, 1, 0, 0, 1, 1,
-0.05334067, 0.4184671, 0.2877588, 1, 0, 0, 1, 1,
-0.04855561, 0.9750702, -0.1823307, 1, 0, 0, 1, 1,
-0.04578052, -0.900256, -3.938648, 1, 0, 0, 1, 1,
-0.04383808, 0.3178134, -0.06739908, 1, 0, 0, 1, 1,
-0.04001587, 2.695422, 0.658708, 0, 0, 0, 1, 1,
-0.03925025, 1.339176, -0.9491601, 0, 0, 0, 1, 1,
-0.0323278, 1.416466, -0.7582687, 0, 0, 0, 1, 1,
-0.03053478, -1.039505, -3.710854, 0, 0, 0, 1, 1,
-0.03025084, -0.3259078, -2.955562, 0, 0, 0, 1, 1,
-0.0285883, 1.284673, 0.138197, 0, 0, 0, 1, 1,
-0.02758391, 1.899305, -1.739273, 0, 0, 0, 1, 1,
-0.0270073, 1.030342, -0.7974706, 1, 1, 1, 1, 1,
-0.02651643, 0.4972886, -1.006925, 1, 1, 1, 1, 1,
-0.02364251, -2.234626, -4.840869, 1, 1, 1, 1, 1,
-0.02245224, 1.112834, -1.167635, 1, 1, 1, 1, 1,
-0.02172063, -1.581437, -3.567517, 1, 1, 1, 1, 1,
-0.02099635, -0.9302449, -3.842796, 1, 1, 1, 1, 1,
-0.02098373, 1.620718, -0.01619228, 1, 1, 1, 1, 1,
-0.01810012, 0.2526164, 1.212936, 1, 1, 1, 1, 1,
-0.01640755, -0.89321, -3.628174, 1, 1, 1, 1, 1,
-0.01458416, 1.188805, -1.705526, 1, 1, 1, 1, 1,
-0.01316385, 0.3786361, 0.7246668, 1, 1, 1, 1, 1,
-0.005807861, -1.023615, -4.275499, 1, 1, 1, 1, 1,
-0.004037993, -0.2770232, -3.18548, 1, 1, 1, 1, 1,
-0.002166672, -1.182639, -0.8968903, 1, 1, 1, 1, 1,
-0.002166447, 0.399051, -1.140174, 1, 1, 1, 1, 1,
0.005948682, 0.3163497, 0.874278, 0, 0, 1, 1, 1,
0.006192001, -0.4086989, 3.220472, 1, 0, 0, 1, 1,
0.007240927, -0.7151915, 2.814132, 1, 0, 0, 1, 1,
0.01627164, -1.012561, 3.335121, 1, 0, 0, 1, 1,
0.01777028, -1.665512, 1.28379, 1, 0, 0, 1, 1,
0.01822922, 0.6161281, -0.757887, 1, 0, 0, 1, 1,
0.02022099, 0.819795, -0.8257137, 0, 0, 0, 1, 1,
0.02208354, -1.392136, 2.743092, 0, 0, 0, 1, 1,
0.02653686, 1.082678, 1.167515, 0, 0, 0, 1, 1,
0.02655759, 1.735267, 0.3637289, 0, 0, 0, 1, 1,
0.02661499, -2.541358, 3.449077, 0, 0, 0, 1, 1,
0.0269136, 0.6703891, -0.3375206, 0, 0, 0, 1, 1,
0.03221405, -0.8742735, 3.521595, 0, 0, 0, 1, 1,
0.03295196, -1.385676, 3.870278, 1, 1, 1, 1, 1,
0.03362069, 0.8571948, 0.9887678, 1, 1, 1, 1, 1,
0.03769437, 0.07422832, -0.2664207, 1, 1, 1, 1, 1,
0.04075371, -0.3708338, 2.402059, 1, 1, 1, 1, 1,
0.04499685, -0.0805849, 1.581635, 1, 1, 1, 1, 1,
0.04845405, 0.05166185, 0.3512161, 1, 1, 1, 1, 1,
0.04846604, 0.586234, 0.3362269, 1, 1, 1, 1, 1,
0.05153474, 1.434662, -0.002191683, 1, 1, 1, 1, 1,
0.05350174, -0.3662297, 3.55123, 1, 1, 1, 1, 1,
0.05712947, 1.521429, 0.9489102, 1, 1, 1, 1, 1,
0.06111875, -1.858874, 2.09403, 1, 1, 1, 1, 1,
0.06151994, 0.3157907, -0.4726374, 1, 1, 1, 1, 1,
0.06256335, 0.6357101, 1.978873, 1, 1, 1, 1, 1,
0.06480286, 0.258306, -0.4403677, 1, 1, 1, 1, 1,
0.06864713, 0.01917859, -0.1947505, 1, 1, 1, 1, 1,
0.06987025, -0.4327866, 2.788112, 0, 0, 1, 1, 1,
0.07000067, -1.932618, 2.207027, 1, 0, 0, 1, 1,
0.08201854, -1.846373, 2.573308, 1, 0, 0, 1, 1,
0.08320585, -0.4422551, 2.305274, 1, 0, 0, 1, 1,
0.08871823, 0.966796, -1.347136, 1, 0, 0, 1, 1,
0.09146612, -0.7468191, 3.672434, 1, 0, 0, 1, 1,
0.09281147, -1.447022, 4.875688, 0, 0, 0, 1, 1,
0.09314477, 1.05226, 1.487721, 0, 0, 0, 1, 1,
0.09946806, 0.3950955, -0.3197033, 0, 0, 0, 1, 1,
0.09985597, -0.9072623, 1.349551, 0, 0, 0, 1, 1,
0.1072481, 1.164095, 1.929396, 0, 0, 0, 1, 1,
0.1073286, -0.01790702, 2.932662, 0, 0, 0, 1, 1,
0.1129875, 1.358979, -1.35035, 0, 0, 0, 1, 1,
0.1141184, -0.9468539, 3.354968, 1, 1, 1, 1, 1,
0.1222897, -0.227268, 3.837007, 1, 1, 1, 1, 1,
0.1223782, -0.09381005, 1.755634, 1, 1, 1, 1, 1,
0.1256494, 2.077868, -0.39158, 1, 1, 1, 1, 1,
0.1342829, 0.8376938, -2.007047, 1, 1, 1, 1, 1,
0.1355715, -1.695893, 1.519338, 1, 1, 1, 1, 1,
0.1362002, -0.7407071, 3.80827, 1, 1, 1, 1, 1,
0.138119, 1.747723, 0.4459709, 1, 1, 1, 1, 1,
0.1397602, -0.1349555, 3.854087, 1, 1, 1, 1, 1,
0.1398808, -0.1386847, 0.2258236, 1, 1, 1, 1, 1,
0.1399801, -1.680746, 1.728958, 1, 1, 1, 1, 1,
0.1404072, -0.3967722, 3.425231, 1, 1, 1, 1, 1,
0.1409789, -0.8499673, 1.263824, 1, 1, 1, 1, 1,
0.1426985, -0.3626246, 2.546806, 1, 1, 1, 1, 1,
0.1428156, 0.6528519, -1.328662, 1, 1, 1, 1, 1,
0.1428856, -0.5173684, 2.883799, 0, 0, 1, 1, 1,
0.1432538, -1.468569, 3.248622, 1, 0, 0, 1, 1,
0.1439279, 0.5875294, 0.988858, 1, 0, 0, 1, 1,
0.1527212, 0.2845075, 1.064749, 1, 0, 0, 1, 1,
0.157102, -0.5066873, 3.633924, 1, 0, 0, 1, 1,
0.1614962, -0.5050563, 3.194188, 1, 0, 0, 1, 1,
0.1615114, 1.074586, -0.4304426, 0, 0, 0, 1, 1,
0.1628162, 0.2252681, -0.03781153, 0, 0, 0, 1, 1,
0.1662798, 0.1524554, 1.572664, 0, 0, 0, 1, 1,
0.1690689, 1.379892, -0.2088692, 0, 0, 0, 1, 1,
0.1758758, 1.858028, 0.1079277, 0, 0, 0, 1, 1,
0.1764495, 0.2439037, 2.52343, 0, 0, 0, 1, 1,
0.1767267, -0.8136538, 4.719835, 0, 0, 0, 1, 1,
0.1774296, 0.7238743, 0.1609703, 1, 1, 1, 1, 1,
0.1777761, 0.149486, 2.540555, 1, 1, 1, 1, 1,
0.1786642, -0.6629272, 3.13335, 1, 1, 1, 1, 1,
0.1808799, 0.8289623, -0.6045203, 1, 1, 1, 1, 1,
0.1813805, -0.3733265, 3.032735, 1, 1, 1, 1, 1,
0.1822324, 0.932403, -1.688984, 1, 1, 1, 1, 1,
0.1824939, 2.352633, -0.952684, 1, 1, 1, 1, 1,
0.1843021, 0.5525399, 0.9976737, 1, 1, 1, 1, 1,
0.1843497, -1.114709, 2.924851, 1, 1, 1, 1, 1,
0.1848221, -0.6692082, 1.77247, 1, 1, 1, 1, 1,
0.1849411, 0.4355098, 0.6789671, 1, 1, 1, 1, 1,
0.1957416, -1.043288, 2.597507, 1, 1, 1, 1, 1,
0.2018271, 1.02761, 0.9893844, 1, 1, 1, 1, 1,
0.2063561, -0.7716838, 4.864011, 1, 1, 1, 1, 1,
0.2084663, 0.7968407, 2.083027, 1, 1, 1, 1, 1,
0.2114419, -0.761447, 4.036779, 0, 0, 1, 1, 1,
0.2115283, -0.263247, 2.129872, 1, 0, 0, 1, 1,
0.2185943, -0.8576631, 3.298875, 1, 0, 0, 1, 1,
0.2240469, -1.468914, 4.287747, 1, 0, 0, 1, 1,
0.2270635, -1.739477, 2.108785, 1, 0, 0, 1, 1,
0.227327, -0.347122, 2.245647, 1, 0, 0, 1, 1,
0.2311223, 0.3715115, 1.557151, 0, 0, 0, 1, 1,
0.2319292, 0.7989893, -0.6636248, 0, 0, 0, 1, 1,
0.2361788, 1.086972, 0.3961055, 0, 0, 0, 1, 1,
0.2377416, -1.792033, 3.042633, 0, 0, 0, 1, 1,
0.2414984, -0.5807623, 3.131473, 0, 0, 0, 1, 1,
0.2480718, -0.2033473, 2.783325, 0, 0, 0, 1, 1,
0.2543496, -0.8164526, 4.20794, 0, 0, 0, 1, 1,
0.2565021, -0.1520133, 2.462018, 1, 1, 1, 1, 1,
0.258904, -0.434271, 1.164034, 1, 1, 1, 1, 1,
0.2603338, -0.3731283, 2.162299, 1, 1, 1, 1, 1,
0.2634071, -0.6204178, 2.917428, 1, 1, 1, 1, 1,
0.2672151, -2.006377, 3.062218, 1, 1, 1, 1, 1,
0.2716019, 0.6783156, 0.3534968, 1, 1, 1, 1, 1,
0.2831291, 0.2836014, 0.9233856, 1, 1, 1, 1, 1,
0.2862173, 0.4613733, -0.5098437, 1, 1, 1, 1, 1,
0.2881458, 1.25368, -0.04738588, 1, 1, 1, 1, 1,
0.2928343, 1.278564, 0.8806155, 1, 1, 1, 1, 1,
0.2939688, -2.514156, 3.631032, 1, 1, 1, 1, 1,
0.2958637, -1.277643, 3.608372, 1, 1, 1, 1, 1,
0.2980597, 0.7426954, 0.864398, 1, 1, 1, 1, 1,
0.303641, 0.317904, 0.1135809, 1, 1, 1, 1, 1,
0.3044477, 0.2108322, 0.128574, 1, 1, 1, 1, 1,
0.3074618, 0.6869723, 0.5125689, 0, 0, 1, 1, 1,
0.308598, 0.5824366, 0.3684861, 1, 0, 0, 1, 1,
0.3103178, 0.7764612, -0.6092615, 1, 0, 0, 1, 1,
0.311176, 0.7655147, -0.1410614, 1, 0, 0, 1, 1,
0.3118409, -1.388822, 4.596481, 1, 0, 0, 1, 1,
0.3124934, 1.297074, 0.5980359, 1, 0, 0, 1, 1,
0.3150539, -0.2270607, 0.1357882, 0, 0, 0, 1, 1,
0.3158512, -0.3515627, 2.07971, 0, 0, 0, 1, 1,
0.3335349, -0.4618795, 1.439336, 0, 0, 0, 1, 1,
0.3350137, 1.550055, 1.828202, 0, 0, 0, 1, 1,
0.3365647, -2.311546, 2.716747, 0, 0, 0, 1, 1,
0.3422753, 0.4564733, 0.6075677, 0, 0, 0, 1, 1,
0.3437413, 0.9089484, 0.2171858, 0, 0, 0, 1, 1,
0.3484676, -1.064697, 1.492283, 1, 1, 1, 1, 1,
0.3558318, 0.4955531, 0.08028976, 1, 1, 1, 1, 1,
0.3601562, 0.2936662, 0.9300144, 1, 1, 1, 1, 1,
0.3653614, 1.240428, 1.009522, 1, 1, 1, 1, 1,
0.366977, 0.5518494, -0.3003756, 1, 1, 1, 1, 1,
0.3689659, -2.129647, 3.189804, 1, 1, 1, 1, 1,
0.3696543, -1.253683, 1.504138, 1, 1, 1, 1, 1,
0.3711489, 0.6892004, -0.7744293, 1, 1, 1, 1, 1,
0.3734495, -1.877174, 5.908538, 1, 1, 1, 1, 1,
0.3753098, -0.1819597, 2.684909, 1, 1, 1, 1, 1,
0.3820088, 0.5770002, -0.4199357, 1, 1, 1, 1, 1,
0.3854538, 1.075821, -0.1005157, 1, 1, 1, 1, 1,
0.3858081, 0.2149449, 2.890655, 1, 1, 1, 1, 1,
0.3860525, -0.9664312, 1.118149, 1, 1, 1, 1, 1,
0.3863941, -0.5815752, 3.221725, 1, 1, 1, 1, 1,
0.3905438, -1.730132, 1.227738, 0, 0, 1, 1, 1,
0.3923225, -0.4669091, 2.246645, 1, 0, 0, 1, 1,
0.3952863, 1.655413, 1.12944, 1, 0, 0, 1, 1,
0.4013321, 0.7301812, 1.190545, 1, 0, 0, 1, 1,
0.4018375, -0.5571775, 1.888726, 1, 0, 0, 1, 1,
0.4170761, 0.7695816, 0.3483194, 1, 0, 0, 1, 1,
0.4172108, -1.164028, 4.70576, 0, 0, 0, 1, 1,
0.4211907, 1.194247, 1.428416, 0, 0, 0, 1, 1,
0.4226691, 1.25402, 0.2415516, 0, 0, 0, 1, 1,
0.4260917, -1.515255, 2.767845, 0, 0, 0, 1, 1,
0.4266283, -0.7812426, 2.827005, 0, 0, 0, 1, 1,
0.427019, 0.9889689, -0.3803782, 0, 0, 0, 1, 1,
0.4277118, 1.129705, 1.024096, 0, 0, 0, 1, 1,
0.4336162, 0.829033, 2.488268, 1, 1, 1, 1, 1,
0.4365777, -0.6431762, 1.566135, 1, 1, 1, 1, 1,
0.4388954, -0.1971467, 2.304344, 1, 1, 1, 1, 1,
0.440396, -0.8180974, 4.15039, 1, 1, 1, 1, 1,
0.4435889, 0.2951369, 1.666762, 1, 1, 1, 1, 1,
0.4468727, -0.7032087, 3.958623, 1, 1, 1, 1, 1,
0.4528771, -0.4531058, 1.879105, 1, 1, 1, 1, 1,
0.4544833, -0.2371161, 2.20118, 1, 1, 1, 1, 1,
0.4546779, -0.5929394, 3.128887, 1, 1, 1, 1, 1,
0.4550751, -0.1299595, -0.2488865, 1, 1, 1, 1, 1,
0.4568832, 0.2031762, 1.657621, 1, 1, 1, 1, 1,
0.4572335, -0.7050086, 0.5665784, 1, 1, 1, 1, 1,
0.4599871, 1.040524, 2.257772, 1, 1, 1, 1, 1,
0.4605709, -2.022569, 1.605553, 1, 1, 1, 1, 1,
0.4618948, 0.2591511, 0.7260025, 1, 1, 1, 1, 1,
0.4621361, -1.677067, 0.7812544, 0, 0, 1, 1, 1,
0.4636254, 1.995655, 1.22463, 1, 0, 0, 1, 1,
0.4711668, 1.446168, 0.3469743, 1, 0, 0, 1, 1,
0.4718177, -1.095432, 2.674811, 1, 0, 0, 1, 1,
0.4850268, 0.7730449, -0.1373203, 1, 0, 0, 1, 1,
0.4853916, 0.4420983, 1.66338, 1, 0, 0, 1, 1,
0.4856608, -0.455006, 0.3972215, 0, 0, 0, 1, 1,
0.486937, 0.999224, -0.8287131, 0, 0, 0, 1, 1,
0.488512, 1.627351, 1.534836, 0, 0, 0, 1, 1,
0.4897491, 0.3666068, 0.1198489, 0, 0, 0, 1, 1,
0.4906884, -0.1641058, 1.942707, 0, 0, 0, 1, 1,
0.4969725, -0.3228341, 2.779631, 0, 0, 0, 1, 1,
0.4992793, 0.7515393, 1.219308, 0, 0, 0, 1, 1,
0.4996226, 0.01999315, 1.034712, 1, 1, 1, 1, 1,
0.5014754, -0.6386769, 1.770573, 1, 1, 1, 1, 1,
0.5075583, 1.065147, 0.2453335, 1, 1, 1, 1, 1,
0.5086522, -0.04405826, 2.347498, 1, 1, 1, 1, 1,
0.5106261, -0.3553276, 1.907216, 1, 1, 1, 1, 1,
0.5164396, -1.220713, 2.844657, 1, 1, 1, 1, 1,
0.5164838, 0.2595378, 1.177656, 1, 1, 1, 1, 1,
0.5185776, 2.130529, -0.7851428, 1, 1, 1, 1, 1,
0.5229174, 0.05808058, 0.2471245, 1, 1, 1, 1, 1,
0.5259207, -0.7733305, 3.056131, 1, 1, 1, 1, 1,
0.526658, 0.4081677, -0.09196754, 1, 1, 1, 1, 1,
0.5282506, 1.484383, -0.9354886, 1, 1, 1, 1, 1,
0.5397835, -1.184302, 4.583877, 1, 1, 1, 1, 1,
0.5399485, 0.3627857, 3.460877, 1, 1, 1, 1, 1,
0.5419779, -1.936344, 2.919501, 1, 1, 1, 1, 1,
0.5436094, 0.54292, 1.393326, 0, 0, 1, 1, 1,
0.5436177, 1.239655, 0.1950049, 1, 0, 0, 1, 1,
0.5457368, 0.05578418, 0.6543006, 1, 0, 0, 1, 1,
0.5468204, 0.385724, 1.569938, 1, 0, 0, 1, 1,
0.5485764, -0.3980394, 1.651386, 1, 0, 0, 1, 1,
0.5536808, 0.5726, 1.103088, 1, 0, 0, 1, 1,
0.5556048, -1.58927, 2.967307, 0, 0, 0, 1, 1,
0.5566069, -2.03182, 2.553433, 0, 0, 0, 1, 1,
0.5578707, -0.3146647, 2.647658, 0, 0, 0, 1, 1,
0.5622959, 0.9720839, 0.9122358, 0, 0, 0, 1, 1,
0.5659458, -0.8998762, 3.460948, 0, 0, 0, 1, 1,
0.569037, -0.1373025, 1.116008, 0, 0, 0, 1, 1,
0.569258, -0.003256453, 2.003773, 0, 0, 0, 1, 1,
0.5714232, 0.9850431, -0.982672, 1, 1, 1, 1, 1,
0.5726034, 0.8249509, 0.8068145, 1, 1, 1, 1, 1,
0.5726207, 1.293765, -0.08158103, 1, 1, 1, 1, 1,
0.5769346, 0.6833637, 0.3744269, 1, 1, 1, 1, 1,
0.5797615, -0.5603319, 1.136188, 1, 1, 1, 1, 1,
0.5807959, -1.623896, 2.968428, 1, 1, 1, 1, 1,
0.5810457, -0.9002267, 2.274166, 1, 1, 1, 1, 1,
0.5820575, -1.04555, 3.700785, 1, 1, 1, 1, 1,
0.5836512, -0.4711848, 1.693009, 1, 1, 1, 1, 1,
0.5839599, -0.5611736, 2.432029, 1, 1, 1, 1, 1,
0.5871864, -0.4641108, 1.72739, 1, 1, 1, 1, 1,
0.5885281, 0.3740886, 1.299568, 1, 1, 1, 1, 1,
0.5886796, -0.2719439, 2.229184, 1, 1, 1, 1, 1,
0.5964606, -0.5308852, 2.447143, 1, 1, 1, 1, 1,
0.6011674, 0.2487783, 2.984578, 1, 1, 1, 1, 1,
0.6046321, -1.948835, 2.925831, 0, 0, 1, 1, 1,
0.6064503, -0.03493909, 0.384293, 1, 0, 0, 1, 1,
0.607447, 1.188438, -0.3057732, 1, 0, 0, 1, 1,
0.6077626, 0.3362811, -0.159707, 1, 0, 0, 1, 1,
0.6109585, -0.7378485, 2.037742, 1, 0, 0, 1, 1,
0.6244416, -0.3079451, 0.9076567, 1, 0, 0, 1, 1,
0.6283438, 0.5808464, -0.9064813, 0, 0, 0, 1, 1,
0.6370552, -0.5591897, 3.368818, 0, 0, 0, 1, 1,
0.6410271, 2.474446, 0.3144269, 0, 0, 0, 1, 1,
0.6422021, -0.08175552, 2.470418, 0, 0, 0, 1, 1,
0.6458826, -1.963153, 2.340443, 0, 0, 0, 1, 1,
0.6505418, 0.328941, -0.9140286, 0, 0, 0, 1, 1,
0.6523098, -0.4463164, 3.364606, 0, 0, 0, 1, 1,
0.6549833, -0.9321759, 2.849358, 1, 1, 1, 1, 1,
0.6578075, -0.581496, 3.570884, 1, 1, 1, 1, 1,
0.657976, -0.9828135, 1.534595, 1, 1, 1, 1, 1,
0.6634219, -0.1352449, 2.913002, 1, 1, 1, 1, 1,
0.6679019, 0.4854632, 0.5852166, 1, 1, 1, 1, 1,
0.6750818, 0.6399441, 1.31442, 1, 1, 1, 1, 1,
0.6872154, -0.262132, 2.333095, 1, 1, 1, 1, 1,
0.6877804, 1.038244, 1.042215, 1, 1, 1, 1, 1,
0.6898414, -0.7224872, 2.734499, 1, 1, 1, 1, 1,
0.698128, 0.6838031, -0.6695233, 1, 1, 1, 1, 1,
0.6995112, 0.1865601, 0.4252661, 1, 1, 1, 1, 1,
0.7009165, -0.4518118, 1.76852, 1, 1, 1, 1, 1,
0.7032334, -0.3293989, 0.9136915, 1, 1, 1, 1, 1,
0.7032721, -1.193403, 3.067231, 1, 1, 1, 1, 1,
0.7053776, -0.4180442, 2.779446, 1, 1, 1, 1, 1,
0.7091302, -0.8229774, 2.130944, 0, 0, 1, 1, 1,
0.7107543, -0.6335379, 2.781766, 1, 0, 0, 1, 1,
0.7140731, -0.00338711, 1.826019, 1, 0, 0, 1, 1,
0.7146108, -0.337112, 2.730164, 1, 0, 0, 1, 1,
0.7165278, -0.3871283, 3.920026, 1, 0, 0, 1, 1,
0.7168679, -1.060647, 4.627125, 1, 0, 0, 1, 1,
0.7171425, -0.08793297, 1.898172, 0, 0, 0, 1, 1,
0.719833, -1.650657, 2.783013, 0, 0, 0, 1, 1,
0.7202886, -0.9392271, 2.743555, 0, 0, 0, 1, 1,
0.7269058, -0.6184428, 2.461807, 0, 0, 0, 1, 1,
0.7345408, -0.5793149, 2.000525, 0, 0, 0, 1, 1,
0.7347538, -1.11149, 2.206619, 0, 0, 0, 1, 1,
0.7385643, 1.134399, 2.265764, 0, 0, 0, 1, 1,
0.74209, -0.2117211, 2.793772, 1, 1, 1, 1, 1,
0.7436571, 1.314117, -0.8881326, 1, 1, 1, 1, 1,
0.7483034, -0.7408294, 1.055798, 1, 1, 1, 1, 1,
0.7488011, 0.6830708, 2.410096, 1, 1, 1, 1, 1,
0.7524372, -0.7556503, 2.12372, 1, 1, 1, 1, 1,
0.7525916, 0.7406715, 0.9290947, 1, 1, 1, 1, 1,
0.7590331, -1.158191, 3.351254, 1, 1, 1, 1, 1,
0.7653379, -0.6743478, 2.070676, 1, 1, 1, 1, 1,
0.769963, -1.003339, 1.205572, 1, 1, 1, 1, 1,
0.772793, 1.365582, 1.023637, 1, 1, 1, 1, 1,
0.7735685, 0.009536305, 0.9569082, 1, 1, 1, 1, 1,
0.7752226, 2.65571, 0.5642175, 1, 1, 1, 1, 1,
0.7768258, -1.439524, 0.8512639, 1, 1, 1, 1, 1,
0.778363, 0.1936099, 0.650448, 1, 1, 1, 1, 1,
0.7794443, -0.5429862, 3.011818, 1, 1, 1, 1, 1,
0.7795551, 0.7971536, 0.9799082, 0, 0, 1, 1, 1,
0.7809181, 1.266679, 0.6441918, 1, 0, 0, 1, 1,
0.7885452, 0.5656493, 2.882949, 1, 0, 0, 1, 1,
0.7907394, 1.630826, -1.480555, 1, 0, 0, 1, 1,
0.7933537, 0.6496276, -3.085913, 1, 0, 0, 1, 1,
0.7936251, -0.2138809, 2.002872, 1, 0, 0, 1, 1,
0.8006359, 1.198514, 0.1582776, 0, 0, 0, 1, 1,
0.8024457, 2.721312, 0.90982, 0, 0, 0, 1, 1,
0.8056887, 2.22924, -0.4791844, 0, 0, 0, 1, 1,
0.8130756, 0.3519899, 0.4160497, 0, 0, 0, 1, 1,
0.819185, -0.4263167, 0.7340122, 0, 0, 0, 1, 1,
0.8263462, 1.530924, 2.272944, 0, 0, 0, 1, 1,
0.8266982, 0.4122165, 0.4708228, 0, 0, 0, 1, 1,
0.8328018, 1.219772, 1.857996, 1, 1, 1, 1, 1,
0.8365917, 0.1086234, 0.3509084, 1, 1, 1, 1, 1,
0.8529499, -1.104645, 1.998075, 1, 1, 1, 1, 1,
0.8542583, 0.8457879, 0.2506976, 1, 1, 1, 1, 1,
0.861667, 0.1836647, 3.487541, 1, 1, 1, 1, 1,
0.8626916, -0.2415805, 0.6732708, 1, 1, 1, 1, 1,
0.8628005, -0.04740996, 0.426383, 1, 1, 1, 1, 1,
0.8684757, -0.07925972, 1.913502, 1, 1, 1, 1, 1,
0.8709409, 0.5589997, 0.1132543, 1, 1, 1, 1, 1,
0.8722014, 0.3511152, 2.722014, 1, 1, 1, 1, 1,
0.8731694, -0.3841368, 1.338508, 1, 1, 1, 1, 1,
0.875832, 1.580828, 1.362926, 1, 1, 1, 1, 1,
0.8768552, -0.2339007, 2.124566, 1, 1, 1, 1, 1,
0.877189, -0.7486838, 2.170349, 1, 1, 1, 1, 1,
0.8776035, -0.5340889, 1.699352, 1, 1, 1, 1, 1,
0.8791326, -1.293137, 2.50437, 0, 0, 1, 1, 1,
0.8798282, 0.03335506, 2.283097, 1, 0, 0, 1, 1,
0.8862049, -1.062379, 2.725811, 1, 0, 0, 1, 1,
0.8890917, 0.6196481, 0.807188, 1, 0, 0, 1, 1,
0.894236, -0.8812438, 2.576247, 1, 0, 0, 1, 1,
0.8967453, 0.8104673, -0.1143099, 1, 0, 0, 1, 1,
0.9046373, 0.503658, 1.451512, 0, 0, 0, 1, 1,
0.9071499, 0.244373, 2.979617, 0, 0, 0, 1, 1,
0.908444, 1.59359, -0.2325224, 0, 0, 0, 1, 1,
0.9145143, -0.9432519, 2.413219, 0, 0, 0, 1, 1,
0.9155474, -0.2033486, 2.955719, 0, 0, 0, 1, 1,
0.9187766, 0.6863476, -0.04955423, 0, 0, 0, 1, 1,
0.9239091, -0.3174793, 2.400058, 0, 0, 0, 1, 1,
0.9267254, 0.1544316, 1.459983, 1, 1, 1, 1, 1,
0.9310302, 1.064039, 0.9690532, 1, 1, 1, 1, 1,
0.9378368, -0.5798549, 1.784414, 1, 1, 1, 1, 1,
0.9402242, 0.0142537, 4.016885, 1, 1, 1, 1, 1,
0.9453047, 0.7693658, 1.662985, 1, 1, 1, 1, 1,
0.9612665, 1.037323, 1.684801, 1, 1, 1, 1, 1,
0.9627802, -0.5088024, 1.715507, 1, 1, 1, 1, 1,
0.9695774, -0.1724515, 1.177811, 1, 1, 1, 1, 1,
0.9716494, 1.111209, 1.904834, 1, 1, 1, 1, 1,
0.9722437, 0.986321, 0.1736459, 1, 1, 1, 1, 1,
0.9778358, -0.3779474, 0.2277611, 1, 1, 1, 1, 1,
0.9786984, -1.186058, 2.827828, 1, 1, 1, 1, 1,
0.9807409, 0.3190784, 2.12801, 1, 1, 1, 1, 1,
0.9829388, -0.9061789, 4.125911, 1, 1, 1, 1, 1,
0.9858963, 2.33109, -0.7686672, 1, 1, 1, 1, 1,
0.9879644, -0.1282584, 1.734907, 0, 0, 1, 1, 1,
0.9892413, 0.186986, 0.8834962, 1, 0, 0, 1, 1,
0.9973242, 0.1291419, 2.862211, 1, 0, 0, 1, 1,
0.9977745, 2.170617, -0.7290363, 1, 0, 0, 1, 1,
1.001548, 1.372333, 2.510365, 1, 0, 0, 1, 1,
1.001634, -0.9607569, 4.263084, 1, 0, 0, 1, 1,
1.006455, -0.7517444, 2.395151, 0, 0, 0, 1, 1,
1.006748, -1.490019, 3.533219, 0, 0, 0, 1, 1,
1.009668, 0.2036421, 0.633562, 0, 0, 0, 1, 1,
1.012367, 0.5202779, 0.9612691, 0, 0, 0, 1, 1,
1.013138, 2.008031, -0.3233845, 0, 0, 0, 1, 1,
1.014859, -0.7388067, 2.395456, 0, 0, 0, 1, 1,
1.022009, -0.8041477, 1.079794, 0, 0, 0, 1, 1,
1.026786, -1.072817, 1.692207, 1, 1, 1, 1, 1,
1.027639, -0.06425671, 1.926791, 1, 1, 1, 1, 1,
1.029353, -1.06391, 3.145381, 1, 1, 1, 1, 1,
1.03102, -0.1836271, 1.736183, 1, 1, 1, 1, 1,
1.038123, 0.4160431, 2.078606, 1, 1, 1, 1, 1,
1.041119, -0.8627306, 3.948261, 1, 1, 1, 1, 1,
1.04205, -0.867692, 2.754118, 1, 1, 1, 1, 1,
1.042655, 0.3683463, 0.8674809, 1, 1, 1, 1, 1,
1.048362, 0.2755933, 1.554628, 1, 1, 1, 1, 1,
1.050391, -2.421185, 2.713453, 1, 1, 1, 1, 1,
1.052641, 0.282036, 0.6838256, 1, 1, 1, 1, 1,
1.055833, 1.979553, 0.1396914, 1, 1, 1, 1, 1,
1.056065, 0.5875924, 0.4289256, 1, 1, 1, 1, 1,
1.057082, -0.7377113, 1.794942, 1, 1, 1, 1, 1,
1.057928, 3.316136, 1.065328, 1, 1, 1, 1, 1,
1.063866, 1.010016, 0.8637241, 0, 0, 1, 1, 1,
1.064478, -0.222538, 2.867468, 1, 0, 0, 1, 1,
1.069102, 0.8382898, 1.72236, 1, 0, 0, 1, 1,
1.081087, 2.083295, 0.4064792, 1, 0, 0, 1, 1,
1.087611, 1.094257, -1.292287, 1, 0, 0, 1, 1,
1.093378, -0.7084109, 0.9827326, 1, 0, 0, 1, 1,
1.09585, 1.183769, -0.7921592, 0, 0, 0, 1, 1,
1.097926, -0.05087804, 2.125559, 0, 0, 0, 1, 1,
1.100421, 2.426024, 0.7007984, 0, 0, 0, 1, 1,
1.11166, 0.9705548, 1.579715, 0, 0, 0, 1, 1,
1.117961, -0.765707, 0.804796, 0, 0, 0, 1, 1,
1.118543, 0.3528375, 0.7870437, 0, 0, 0, 1, 1,
1.120021, -3.072285, 2.850581, 0, 0, 0, 1, 1,
1.120658, 1.103745, -1.079247, 1, 1, 1, 1, 1,
1.122074, -0.9144866, 2.575191, 1, 1, 1, 1, 1,
1.123095, -0.144467, 1.37165, 1, 1, 1, 1, 1,
1.126084, -0.7965744, 1.736269, 1, 1, 1, 1, 1,
1.131064, -0.1005181, 2.017692, 1, 1, 1, 1, 1,
1.138566, 0.8410802, 0.2796954, 1, 1, 1, 1, 1,
1.139894, -0.3966458, 2.09805, 1, 1, 1, 1, 1,
1.142736, 0.758087, 0.914858, 1, 1, 1, 1, 1,
1.151822, -0.1889795, 1.887272, 1, 1, 1, 1, 1,
1.153917, 0.865113, 1.125594, 1, 1, 1, 1, 1,
1.154547, -0.2566281, 0.0369533, 1, 1, 1, 1, 1,
1.154861, -1.031693, 2.9442, 1, 1, 1, 1, 1,
1.154953, -0.100183, 1.359507, 1, 1, 1, 1, 1,
1.155288, -0.1761584, 1.331733, 1, 1, 1, 1, 1,
1.157981, -0.3919045, 1.413034, 1, 1, 1, 1, 1,
1.160208, 1.09894, 0.6155134, 0, 0, 1, 1, 1,
1.16102, -1.133251, 3.262355, 1, 0, 0, 1, 1,
1.163522, -0.06401081, 0.9440607, 1, 0, 0, 1, 1,
1.164811, 0.2204214, 0.8135975, 1, 0, 0, 1, 1,
1.177235, -1.316588, 1.899594, 1, 0, 0, 1, 1,
1.18698, -0.7350509, 2.161881, 1, 0, 0, 1, 1,
1.196278, 0.6166622, 2.124705, 0, 0, 0, 1, 1,
1.206561, -0.3647375, 0.9638401, 0, 0, 0, 1, 1,
1.216653, -0.4595343, 1.317246, 0, 0, 0, 1, 1,
1.241411, 0.05758128, 2.642885, 0, 0, 0, 1, 1,
1.246496, 0.1067583, 1.894025, 0, 0, 0, 1, 1,
1.253573, -0.008326888, 0.8819574, 0, 0, 0, 1, 1,
1.25967, -0.8880492, 1.956614, 0, 0, 0, 1, 1,
1.270883, 0.2300058, 2.090734, 1, 1, 1, 1, 1,
1.280158, -0.8011483, 4.355219, 1, 1, 1, 1, 1,
1.284499, -0.1440611, 4.395402, 1, 1, 1, 1, 1,
1.286857, 0.2467147, 1.952062, 1, 1, 1, 1, 1,
1.290046, 0.06477568, 2.394818, 1, 1, 1, 1, 1,
1.29158, -0.447337, 2.874564, 1, 1, 1, 1, 1,
1.298886, -1.045288, 2.643403, 1, 1, 1, 1, 1,
1.303525, -1.105445, 3.02214, 1, 1, 1, 1, 1,
1.305867, 0.3688991, 2.854046, 1, 1, 1, 1, 1,
1.315569, 0.2519095, 1.779482, 1, 1, 1, 1, 1,
1.319906, 0.1809223, 2.290288, 1, 1, 1, 1, 1,
1.322464, 0.2428765, 0.4535756, 1, 1, 1, 1, 1,
1.322607, -0.004293774, 1.356369, 1, 1, 1, 1, 1,
1.336492, 1.2355, -0.117577, 1, 1, 1, 1, 1,
1.337781, -0.2906484, 1.906257, 1, 1, 1, 1, 1,
1.341545, -1.651356, 3.610003, 0, 0, 1, 1, 1,
1.342396, 1.035908, 0.729454, 1, 0, 0, 1, 1,
1.342518, -0.3470758, 2.212545, 1, 0, 0, 1, 1,
1.347034, 0.2005095, 0.3487104, 1, 0, 0, 1, 1,
1.349259, 1.45092, -0.03137331, 1, 0, 0, 1, 1,
1.36561, -1.057881, 4.387231, 1, 0, 0, 1, 1,
1.36773, -0.1422504, 2.490065, 0, 0, 0, 1, 1,
1.367867, -1.462351, 3.03343, 0, 0, 0, 1, 1,
1.400324, 0.3990755, 1.876751, 0, 0, 0, 1, 1,
1.406587, 0.2071394, 1.095574, 0, 0, 0, 1, 1,
1.423381, -0.4352421, 2.340961, 0, 0, 0, 1, 1,
1.429295, -0.07466766, 1.529682, 0, 0, 0, 1, 1,
1.441802, -0.8159534, 2.554653, 0, 0, 0, 1, 1,
1.453094, -0.8551672, 1.712583, 1, 1, 1, 1, 1,
1.455795, -0.8920874, 2.984127, 1, 1, 1, 1, 1,
1.466464, -1.602148, 1.87437, 1, 1, 1, 1, 1,
1.473732, -0.02822118, 1.038469, 1, 1, 1, 1, 1,
1.478105, -0.9284793, 2.912384, 1, 1, 1, 1, 1,
1.482999, 0.3801621, 1.214481, 1, 1, 1, 1, 1,
1.487129, 1.892021, -0.08815815, 1, 1, 1, 1, 1,
1.492023, -1.391042, 1.860357, 1, 1, 1, 1, 1,
1.497217, 1.220816, 0.9100232, 1, 1, 1, 1, 1,
1.508158, 0.3061416, 1.142077, 1, 1, 1, 1, 1,
1.517686, 2.231848, 1.298922, 1, 1, 1, 1, 1,
1.523957, 0.6470591, 0.1637388, 1, 1, 1, 1, 1,
1.552627, -1.705678, 0.5849741, 1, 1, 1, 1, 1,
1.564855, -0.5537436, 2.57447, 1, 1, 1, 1, 1,
1.577469, 1.567478, -0.3134457, 1, 1, 1, 1, 1,
1.580676, -0.9621235, 3.560569, 0, 0, 1, 1, 1,
1.58825, -0.2367929, 0.5708513, 1, 0, 0, 1, 1,
1.588441, -0.3013481, -0.07944905, 1, 0, 0, 1, 1,
1.595713, -1.115913, 2.709158, 1, 0, 0, 1, 1,
1.596333, -0.1842113, -0.009407477, 1, 0, 0, 1, 1,
1.597871, -0.5097543, 2.134417, 1, 0, 0, 1, 1,
1.602324, 0.8663371, 0.8856481, 0, 0, 0, 1, 1,
1.606346, 2.693129, 2.697751, 0, 0, 0, 1, 1,
1.620384, 0.7565123, 0.2075512, 0, 0, 0, 1, 1,
1.636495, 0.6768522, 1.52395, 0, 0, 0, 1, 1,
1.655935, 0.3758422, 2.142796, 0, 0, 0, 1, 1,
1.66028, -0.5087095, 2.66731, 0, 0, 0, 1, 1,
1.667187, -0.1200935, 1.556722, 0, 0, 0, 1, 1,
1.668582, 0.9400367, 1.894508, 1, 1, 1, 1, 1,
1.676389, 0.2889874, 1.291642, 1, 1, 1, 1, 1,
1.677554, -0.5731024, 1.579957, 1, 1, 1, 1, 1,
1.688128, 0.6851858, 1.949475, 1, 1, 1, 1, 1,
1.762992, 2.040897, 1.964349, 1, 1, 1, 1, 1,
1.769485, -0.06384654, 1.537823, 1, 1, 1, 1, 1,
1.771839, -1.286283, 1.548116, 1, 1, 1, 1, 1,
1.792285, -1.314739, 5.069755, 1, 1, 1, 1, 1,
1.82129, 0.6983342, 2.501174, 1, 1, 1, 1, 1,
1.849283, 0.9403926, 0.9917699, 1, 1, 1, 1, 1,
1.854309, 0.2454493, 1.519239, 1, 1, 1, 1, 1,
1.8601, 0.1210756, 2.403204, 1, 1, 1, 1, 1,
1.884777, 1.381033, -0.4429394, 1, 1, 1, 1, 1,
1.898145, -1.018413, 1.650949, 1, 1, 1, 1, 1,
1.932778, -0.7235985, 0.758323, 1, 1, 1, 1, 1,
1.939501, 0.8409878, -0.3258708, 0, 0, 1, 1, 1,
1.970627, -0.8637479, 1.56431, 1, 0, 0, 1, 1,
1.980551, 0.3333096, 2.801282, 1, 0, 0, 1, 1,
1.983816, -1.183465, 2.507159, 1, 0, 0, 1, 1,
1.987103, 0.7319251, 2.232509, 1, 0, 0, 1, 1,
1.997534, 0.5329627, 1.00309, 1, 0, 0, 1, 1,
2.022528, 0.7351183, 0.6839161, 0, 0, 0, 1, 1,
2.029055, 0.0753051, 1.275278, 0, 0, 0, 1, 1,
2.066867, -0.6426405, 2.680883, 0, 0, 0, 1, 1,
2.141796, 0.6966739, 0.6039766, 0, 0, 0, 1, 1,
2.177465, -0.2478656, -0.5964404, 0, 0, 0, 1, 1,
2.189249, 1.758929, 2.432498, 0, 0, 0, 1, 1,
2.213223, 1.670911, 1.119867, 0, 0, 0, 1, 1,
2.269907, -0.2588474, 2.611888, 1, 1, 1, 1, 1,
2.312906, 0.7557502, 3.547529, 1, 1, 1, 1, 1,
2.329381, -0.2836418, 2.424689, 1, 1, 1, 1, 1,
2.479128, 0.8035322, 0.610304, 1, 1, 1, 1, 1,
2.620316, -0.2806067, 1.815044, 1, 1, 1, 1, 1,
2.838719, -1.675509, 4.052346, 1, 1, 1, 1, 1,
3.280217, -1.037397, 3.4501, 1, 1, 1, 1, 1
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
var radius = 9.997535;
var distance = 35.11592;
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
mvMatrix.translate( -0.2023146, -0.1047921, 0.03690648 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.11592);
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
