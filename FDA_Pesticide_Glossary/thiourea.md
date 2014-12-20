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
-4.102989, -0.8011358, 0.8456966, 1, 0, 0, 1,
-2.804843, -0.20623, -1.474959, 1, 0.007843138, 0, 1,
-2.793325, -1.251489, -1.469592, 1, 0.01176471, 0, 1,
-2.622992, 0.581458, -2.0161, 1, 0.01960784, 0, 1,
-2.583337, -1.360351, -3.090151, 1, 0.02352941, 0, 1,
-2.534455, 0.7407296, -0.4103964, 1, 0.03137255, 0, 1,
-2.458354, 0.1422431, -0.9343131, 1, 0.03529412, 0, 1,
-2.436686, -0.5010946, -3.339304, 1, 0.04313726, 0, 1,
-2.343568, 0.3116146, -1.156477, 1, 0.04705882, 0, 1,
-2.326486, 0.1188188, -0.7539462, 1, 0.05490196, 0, 1,
-2.310674, 2.406093, -1.160264, 1, 0.05882353, 0, 1,
-2.307605, -0.09425621, -0.5615258, 1, 0.06666667, 0, 1,
-2.258212, 2.478769, -0.1715148, 1, 0.07058824, 0, 1,
-2.243326, 1.176487, -0.1630033, 1, 0.07843138, 0, 1,
-2.206112, 0.3142848, -0.4748106, 1, 0.08235294, 0, 1,
-2.184247, 0.9535806, -1.146926, 1, 0.09019608, 0, 1,
-2.134994, -1.053586, 0.01037605, 1, 0.09411765, 0, 1,
-2.128519, -2.552181, -1.86051, 1, 0.1019608, 0, 1,
-2.097637, -1.294489, -2.027436, 1, 0.1098039, 0, 1,
-2.093774, -0.1845098, 0.02493909, 1, 0.1137255, 0, 1,
-2.074153, -0.06170851, -1.217566, 1, 0.1215686, 0, 1,
-2.059719, 0.959356, 0.7455283, 1, 0.1254902, 0, 1,
-2.029359, -0.03594915, -0.9140409, 1, 0.1333333, 0, 1,
-2.027748, -0.8892282, -2.893184, 1, 0.1372549, 0, 1,
-1.932312, 0.1259099, -2.055825, 1, 0.145098, 0, 1,
-1.918549, -0.5337256, -3.184326, 1, 0.1490196, 0, 1,
-1.916457, 0.8999236, -0.6140822, 1, 0.1568628, 0, 1,
-1.906745, 0.06491301, -2.981999, 1, 0.1607843, 0, 1,
-1.903788, -1.955243, -1.065736, 1, 0.1686275, 0, 1,
-1.899518, 0.3667732, -2.243568, 1, 0.172549, 0, 1,
-1.887331, -0.03947938, -2.287114, 1, 0.1803922, 0, 1,
-1.84863, -0.1917895, -0.1660602, 1, 0.1843137, 0, 1,
-1.824374, -1.583439, -1.626492, 1, 0.1921569, 0, 1,
-1.810797, -2.017865, -3.816638, 1, 0.1960784, 0, 1,
-1.806922, -0.8961338, -1.786779, 1, 0.2039216, 0, 1,
-1.803528, -0.4367945, -2.274618, 1, 0.2117647, 0, 1,
-1.797625, 0.9134164, -1.574484, 1, 0.2156863, 0, 1,
-1.796978, -1.247209, -2.343793, 1, 0.2235294, 0, 1,
-1.780418, 0.1038249, -0.7978808, 1, 0.227451, 0, 1,
-1.773931, 0.7776588, -1.152452, 1, 0.2352941, 0, 1,
-1.766138, -1.494879, -2.528968, 1, 0.2392157, 0, 1,
-1.748571, -0.3745536, -2.953383, 1, 0.2470588, 0, 1,
-1.739915, -0.0826969, -2.698857, 1, 0.2509804, 0, 1,
-1.735901, -0.1181317, -3.134143, 1, 0.2588235, 0, 1,
-1.704539, -0.3617446, -3.470542, 1, 0.2627451, 0, 1,
-1.702932, 1.224076, -1.178632, 1, 0.2705882, 0, 1,
-1.696426, -0.1574197, -0.8540344, 1, 0.2745098, 0, 1,
-1.689278, 2.504741, -0.7129152, 1, 0.282353, 0, 1,
-1.684349, 0.6543353, -1.403432, 1, 0.2862745, 0, 1,
-1.676066, -0.5906883, -2.860514, 1, 0.2941177, 0, 1,
-1.674098, -0.112867, -0.2404662, 1, 0.3019608, 0, 1,
-1.670209, -0.1116677, -1.848925, 1, 0.3058824, 0, 1,
-1.669161, 0.07770233, -0.9090174, 1, 0.3137255, 0, 1,
-1.649134, -0.1203467, -0.896664, 1, 0.3176471, 0, 1,
-1.647684, 1.857538, 0.2144051, 1, 0.3254902, 0, 1,
-1.634006, -1.180693, -2.162323, 1, 0.3294118, 0, 1,
-1.622204, 0.6008178, -1.627461, 1, 0.3372549, 0, 1,
-1.615488, 0.1070665, -0.003255891, 1, 0.3411765, 0, 1,
-1.607088, -0.2885118, -0.9250154, 1, 0.3490196, 0, 1,
-1.606123, -0.02636253, -1.541681, 1, 0.3529412, 0, 1,
-1.60428, 1.085858, -0.8203791, 1, 0.3607843, 0, 1,
-1.587523, -0.3571788, -1.591299, 1, 0.3647059, 0, 1,
-1.576879, 0.3130483, -1.649398, 1, 0.372549, 0, 1,
-1.555174, -0.370561, -2.22766, 1, 0.3764706, 0, 1,
-1.545832, 0.8417276, -0.9470652, 1, 0.3843137, 0, 1,
-1.541225, 1.127377, -1.053605, 1, 0.3882353, 0, 1,
-1.538383, -0.03711398, -0.3411889, 1, 0.3960784, 0, 1,
-1.531957, -1.583874, -1.822998, 1, 0.4039216, 0, 1,
-1.52437, -0.4519403, -0.4883976, 1, 0.4078431, 0, 1,
-1.514384, -0.9466074, 0.05142644, 1, 0.4156863, 0, 1,
-1.508479, 1.239598, -0.183547, 1, 0.4196078, 0, 1,
-1.467407, 0.1564472, -2.315363, 1, 0.427451, 0, 1,
-1.465734, 1.713455, 0.2066526, 1, 0.4313726, 0, 1,
-1.465472, -1.830075, -2.043476, 1, 0.4392157, 0, 1,
-1.465212, -0.4049525, -1.20874, 1, 0.4431373, 0, 1,
-1.459235, 0.5446161, -1.561716, 1, 0.4509804, 0, 1,
-1.438161, -0.4609451, -3.116725, 1, 0.454902, 0, 1,
-1.436733, 1.477593, -1.045435, 1, 0.4627451, 0, 1,
-1.418521, 0.2753431, -0.9239601, 1, 0.4666667, 0, 1,
-1.411711, 0.05300808, -2.463553, 1, 0.4745098, 0, 1,
-1.41069, -0.600544, -4.077734, 1, 0.4784314, 0, 1,
-1.39978, -0.5227906, -0.9851521, 1, 0.4862745, 0, 1,
-1.390563, 0.8591089, -0.933314, 1, 0.4901961, 0, 1,
-1.380055, -0.09459183, -0.5635818, 1, 0.4980392, 0, 1,
-1.376587, 0.6598712, 0.1916654, 1, 0.5058824, 0, 1,
-1.374199, -0.8095825, -1.850131, 1, 0.509804, 0, 1,
-1.373349, 0.09505316, -1.461048, 1, 0.5176471, 0, 1,
-1.369727, -0.6536257, -1.025817, 1, 0.5215687, 0, 1,
-1.368491, -0.8506643, -1.376608, 1, 0.5294118, 0, 1,
-1.362527, 0.3325239, -0.3749259, 1, 0.5333334, 0, 1,
-1.347777, 0.3511986, -1.510711, 1, 0.5411765, 0, 1,
-1.343523, -0.7868468, -2.112454, 1, 0.5450981, 0, 1,
-1.341164, -0.6018288, -2.848935, 1, 0.5529412, 0, 1,
-1.338257, 0.5728225, -0.9221789, 1, 0.5568628, 0, 1,
-1.331908, -0.07781008, -2.679704, 1, 0.5647059, 0, 1,
-1.318976, -0.8367714, -2.040643, 1, 0.5686275, 0, 1,
-1.309267, -0.7418872, -1.685816, 1, 0.5764706, 0, 1,
-1.306529, -2.152367, -2.231773, 1, 0.5803922, 0, 1,
-1.301728, -0.7019801, -3.193444, 1, 0.5882353, 0, 1,
-1.297388, -1.55211, -3.616583, 1, 0.5921569, 0, 1,
-1.29392, -0.4218174, -1.390962, 1, 0.6, 0, 1,
-1.291767, -2.220257, -3.335862, 1, 0.6078432, 0, 1,
-1.291232, 1.564834, -1.912484, 1, 0.6117647, 0, 1,
-1.291174, -1.504841, -1.017328, 1, 0.6196079, 0, 1,
-1.284745, 1.887085, -0.479608, 1, 0.6235294, 0, 1,
-1.271406, -0.4539309, -1.751283, 1, 0.6313726, 0, 1,
-1.265471, -0.9108623, -4.065841, 1, 0.6352941, 0, 1,
-1.263573, 0.5352116, -1.047229, 1, 0.6431373, 0, 1,
-1.26291, -1.54177, -3.847048, 1, 0.6470588, 0, 1,
-1.253988, 1.04012, -0.9504236, 1, 0.654902, 0, 1,
-1.25334, -1.271764, -2.048193, 1, 0.6588235, 0, 1,
-1.240504, -0.4119536, 0.2171173, 1, 0.6666667, 0, 1,
-1.235913, -0.6427389, -3.24085, 1, 0.6705883, 0, 1,
-1.224567, -1.83412, -0.5246379, 1, 0.6784314, 0, 1,
-1.224186, 0.7644022, 0.7417983, 1, 0.682353, 0, 1,
-1.21088, -1.577755, -2.138921, 1, 0.6901961, 0, 1,
-1.20874, 0.1525939, -2.42192, 1, 0.6941177, 0, 1,
-1.20032, -0.4962003, -2.147404, 1, 0.7019608, 0, 1,
-1.190858, -1.384011, -2.652283, 1, 0.7098039, 0, 1,
-1.190403, -0.9950266, -1.437698, 1, 0.7137255, 0, 1,
-1.185923, 0.1784386, -1.247255, 1, 0.7215686, 0, 1,
-1.185851, -0.2902943, -3.501698, 1, 0.7254902, 0, 1,
-1.176488, -1.570371, -1.751499, 1, 0.7333333, 0, 1,
-1.175776, 0.1526962, -0.7163751, 1, 0.7372549, 0, 1,
-1.171197, 0.08301227, -1.590035, 1, 0.7450981, 0, 1,
-1.169791, 1.017271, -0.06258009, 1, 0.7490196, 0, 1,
-1.168459, 1.029526, -0.7220051, 1, 0.7568628, 0, 1,
-1.168308, 0.3339474, -2.469113, 1, 0.7607843, 0, 1,
-1.162244, 0.5707727, 0.5680666, 1, 0.7686275, 0, 1,
-1.138651, -0.4835396, -3.019609, 1, 0.772549, 0, 1,
-1.120637, 0.261155, -2.60742, 1, 0.7803922, 0, 1,
-1.119958, -0.003770612, -0.4082103, 1, 0.7843137, 0, 1,
-1.119429, 2.664232, -0.6513966, 1, 0.7921569, 0, 1,
-1.117966, -1.447359, -4.609871, 1, 0.7960784, 0, 1,
-1.114133, -2.726867, -3.278206, 1, 0.8039216, 0, 1,
-1.106647, 0.08261656, -1.317966, 1, 0.8117647, 0, 1,
-1.09541, -1.237401, -2.938426, 1, 0.8156863, 0, 1,
-1.095002, -1.106041, -3.137089, 1, 0.8235294, 0, 1,
-1.090855, 1.363695, 0.5821341, 1, 0.827451, 0, 1,
-1.090532, -1.060105, -1.917689, 1, 0.8352941, 0, 1,
-1.08424, 0.3098696, -1.422315, 1, 0.8392157, 0, 1,
-1.075579, 0.3633794, -2.086302, 1, 0.8470588, 0, 1,
-1.073789, 0.06847795, -1.664793, 1, 0.8509804, 0, 1,
-1.072999, 1.064987, -1.534031, 1, 0.8588235, 0, 1,
-1.06299, -0.7007617, -2.794401, 1, 0.8627451, 0, 1,
-1.053971, 0.20851, -0.09244836, 1, 0.8705882, 0, 1,
-1.033181, 1.615156, -0.9279831, 1, 0.8745098, 0, 1,
-1.032526, -0.08529586, -1.926034, 1, 0.8823529, 0, 1,
-1.028882, -0.3096516, -2.726032, 1, 0.8862745, 0, 1,
-1.026406, 0.03932237, -2.768222, 1, 0.8941177, 0, 1,
-1.026018, -0.9606088, -1.002133, 1, 0.8980392, 0, 1,
-1.02601, -0.2762249, -2.022757, 1, 0.9058824, 0, 1,
-1.024622, -0.4255541, -1.681279, 1, 0.9137255, 0, 1,
-1.022594, 0.3340452, -0.4497549, 1, 0.9176471, 0, 1,
-1.014772, 1.083078, -0.1097553, 1, 0.9254902, 0, 1,
-1.008189, -0.02228377, -0.4223328, 1, 0.9294118, 0, 1,
-1.006616, -0.9798946, -2.830379, 1, 0.9372549, 0, 1,
-1.003451, -0.8821968, -2.839924, 1, 0.9411765, 0, 1,
-1.000949, 1.029054, -1.84893, 1, 0.9490196, 0, 1,
-0.9887237, -0.1742421, -2.209171, 1, 0.9529412, 0, 1,
-0.9884576, -0.4110686, -2.854069, 1, 0.9607843, 0, 1,
-0.9849755, -0.9138577, -4.362149, 1, 0.9647059, 0, 1,
-0.9829066, 0.995546, -0.1086761, 1, 0.972549, 0, 1,
-0.9805481, -0.5453824, -2.297363, 1, 0.9764706, 0, 1,
-0.9795741, -0.4983149, -2.658994, 1, 0.9843137, 0, 1,
-0.9603202, -2.294969, -1.497487, 1, 0.9882353, 0, 1,
-0.9568564, -0.2860506, -1.030503, 1, 0.9960784, 0, 1,
-0.9551578, 1.429128, -0.06511411, 0.9960784, 1, 0, 1,
-0.9501598, -0.8835271, -2.302403, 0.9921569, 1, 0, 1,
-0.9473096, -1.856924, -3.287569, 0.9843137, 1, 0, 1,
-0.9433865, 0.8931704, -1.092978, 0.9803922, 1, 0, 1,
-0.9419912, 0.312571, -0.7682821, 0.972549, 1, 0, 1,
-0.9417078, -1.074874, -3.765515, 0.9686275, 1, 0, 1,
-0.941533, -1.526173, -2.5484, 0.9607843, 1, 0, 1,
-0.9361941, 1.506127, -0.4802618, 0.9568627, 1, 0, 1,
-0.9354457, -0.6584371, -2.009748, 0.9490196, 1, 0, 1,
-0.9341372, -0.85319, -2.475147, 0.945098, 1, 0, 1,
-0.9308119, 0.8923586, 0.1843706, 0.9372549, 1, 0, 1,
-0.9265766, 1.51583, 1.871539, 0.9333333, 1, 0, 1,
-0.9249209, -0.4080568, -2.159739, 0.9254902, 1, 0, 1,
-0.9210881, -0.4900632, -2.344738, 0.9215686, 1, 0, 1,
-0.917272, 0.6035644, 1.399789, 0.9137255, 1, 0, 1,
-0.91342, 1.159199, -0.5482751, 0.9098039, 1, 0, 1,
-0.9133097, -0.4873115, -2.663699, 0.9019608, 1, 0, 1,
-0.909895, 1.196491, -0.8408681, 0.8941177, 1, 0, 1,
-0.9032024, -0.4311841, -2.275749, 0.8901961, 1, 0, 1,
-0.8914571, 1.943456, -1.164548, 0.8823529, 1, 0, 1,
-0.8860582, -0.08083252, -1.062754, 0.8784314, 1, 0, 1,
-0.882158, 0.2283809, -0.9332844, 0.8705882, 1, 0, 1,
-0.8803039, 1.874272, -0.1759488, 0.8666667, 1, 0, 1,
-0.8796132, 0.559922, 0.6504288, 0.8588235, 1, 0, 1,
-0.8791617, 1.998815, -1.65836, 0.854902, 1, 0, 1,
-0.8782381, -1.093342, -3.183683, 0.8470588, 1, 0, 1,
-0.8749576, -0.9397176, -3.782027, 0.8431373, 1, 0, 1,
-0.8725879, 0.6008015, -0.9893141, 0.8352941, 1, 0, 1,
-0.8719759, -2.61936, -3.395001, 0.8313726, 1, 0, 1,
-0.8716733, 0.6641944, -0.5238009, 0.8235294, 1, 0, 1,
-0.8713924, 0.2539609, -1.673339, 0.8196079, 1, 0, 1,
-0.8697369, 1.364733, -1.13948, 0.8117647, 1, 0, 1,
-0.8631314, -1.277672, -2.50585, 0.8078431, 1, 0, 1,
-0.8583483, 1.732263, -0.04056451, 0.8, 1, 0, 1,
-0.856906, 1.983077, -0.7677638, 0.7921569, 1, 0, 1,
-0.8512562, 1.328545, -0.9862036, 0.7882353, 1, 0, 1,
-0.8375364, 1.598879, -1.42617, 0.7803922, 1, 0, 1,
-0.8333349, -1.178482, -1.607067, 0.7764706, 1, 0, 1,
-0.8173305, 1.087031, 1.137645, 0.7686275, 1, 0, 1,
-0.8148257, -0.4141408, -2.823539, 0.7647059, 1, 0, 1,
-0.8119566, -1.209106, -1.927449, 0.7568628, 1, 0, 1,
-0.8118026, 0.7202782, -0.9350339, 0.7529412, 1, 0, 1,
-0.8042635, 0.4174013, 0.8342253, 0.7450981, 1, 0, 1,
-0.7957138, 0.5887479, -0.2224594, 0.7411765, 1, 0, 1,
-0.794509, -1.856158, -1.811914, 0.7333333, 1, 0, 1,
-0.7914815, 1.042741, 0.7595544, 0.7294118, 1, 0, 1,
-0.7910956, 0.7144294, -0.4123947, 0.7215686, 1, 0, 1,
-0.7883929, 0.2606241, -0.3095972, 0.7176471, 1, 0, 1,
-0.7828398, -0.767797, -1.244523, 0.7098039, 1, 0, 1,
-0.7705747, 0.5488504, -0.5292478, 0.7058824, 1, 0, 1,
-0.7585454, -1.335639, -5.392709, 0.6980392, 1, 0, 1,
-0.7572928, -0.3688878, -0.4937074, 0.6901961, 1, 0, 1,
-0.7538301, 1.74266, -0.1352524, 0.6862745, 1, 0, 1,
-0.7531621, -0.5673768, -1.396173, 0.6784314, 1, 0, 1,
-0.749137, 1.625528, 0.7679666, 0.6745098, 1, 0, 1,
-0.7489457, 1.543769, 0.1298233, 0.6666667, 1, 0, 1,
-0.7446011, -0.1776097, -1.875404, 0.6627451, 1, 0, 1,
-0.7404216, 0.3175288, -1.807637, 0.654902, 1, 0, 1,
-0.738952, -0.2118671, -4.170342, 0.6509804, 1, 0, 1,
-0.7377604, 0.2107149, -1.881899, 0.6431373, 1, 0, 1,
-0.7362093, 0.2726574, -0.6878994, 0.6392157, 1, 0, 1,
-0.7348344, -0.6152239, -2.041481, 0.6313726, 1, 0, 1,
-0.7320926, 0.3781945, -1.510695, 0.627451, 1, 0, 1,
-0.7318667, 1.037724, 0.06202721, 0.6196079, 1, 0, 1,
-0.7279167, 1.97275, -0.006466546, 0.6156863, 1, 0, 1,
-0.7234919, -0.3414344, -0.8232881, 0.6078432, 1, 0, 1,
-0.7234051, 0.8563508, -1.723328, 0.6039216, 1, 0, 1,
-0.7210866, -0.2293743, -3.046447, 0.5960785, 1, 0, 1,
-0.7210368, -0.07794555, -1.551309, 0.5882353, 1, 0, 1,
-0.7182523, -0.2679097, -1.016334, 0.5843138, 1, 0, 1,
-0.7151495, -0.1461428, -2.259541, 0.5764706, 1, 0, 1,
-0.7094676, -0.5166259, -2.064764, 0.572549, 1, 0, 1,
-0.7072175, 1.965036, -0.2716236, 0.5647059, 1, 0, 1,
-0.6989478, 0.6127572, -1.732013, 0.5607843, 1, 0, 1,
-0.6972783, -0.6616263, -3.416343, 0.5529412, 1, 0, 1,
-0.6956201, -0.02121699, -1.827446, 0.5490196, 1, 0, 1,
-0.6947085, -0.930618, -3.360971, 0.5411765, 1, 0, 1,
-0.6934096, -1.063283, -4.320124, 0.5372549, 1, 0, 1,
-0.6923085, 0.6388453, 0.116962, 0.5294118, 1, 0, 1,
-0.6911403, 2.172133, -0.1907832, 0.5254902, 1, 0, 1,
-0.6849859, 0.1202669, -1.732532, 0.5176471, 1, 0, 1,
-0.6845595, 0.5490748, 0.3907727, 0.5137255, 1, 0, 1,
-0.6760849, 0.5558229, -0.4944008, 0.5058824, 1, 0, 1,
-0.6719959, 1.558557, -0.3619856, 0.5019608, 1, 0, 1,
-0.6697878, 0.7792287, 0.5679773, 0.4941176, 1, 0, 1,
-0.6632998, 1.390947, -1.535359, 0.4862745, 1, 0, 1,
-0.6605459, -0.2276646, -1.00786, 0.4823529, 1, 0, 1,
-0.6590086, 0.9549215, -1.285913, 0.4745098, 1, 0, 1,
-0.6512294, 0.2154207, -1.521063, 0.4705882, 1, 0, 1,
-0.6504928, 0.5361226, -0.5746919, 0.4627451, 1, 0, 1,
-0.6485447, 0.1185278, 0.4203956, 0.4588235, 1, 0, 1,
-0.647251, -0.8485059, -1.530909, 0.4509804, 1, 0, 1,
-0.6462502, -0.2000249, -2.205009, 0.4470588, 1, 0, 1,
-0.6433209, -0.1939926, -1.508783, 0.4392157, 1, 0, 1,
-0.6398946, 0.02010805, 0.7251021, 0.4352941, 1, 0, 1,
-0.628993, -0.4398979, -1.326337, 0.427451, 1, 0, 1,
-0.6263023, -0.7460238, -2.698734, 0.4235294, 1, 0, 1,
-0.6231607, -0.4100155, -2.871013, 0.4156863, 1, 0, 1,
-0.6219248, -0.1733609, -1.587147, 0.4117647, 1, 0, 1,
-0.6205508, 0.3647023, -1.03961, 0.4039216, 1, 0, 1,
-0.6185601, 1.097897, -2.764914, 0.3960784, 1, 0, 1,
-0.6182789, -2.156916, -2.014022, 0.3921569, 1, 0, 1,
-0.6106352, 0.3174776, -2.467977, 0.3843137, 1, 0, 1,
-0.610299, -1.194699, -3.06159, 0.3803922, 1, 0, 1,
-0.6067693, -0.8581172, -1.117626, 0.372549, 1, 0, 1,
-0.6062855, -1.428537, -1.766235, 0.3686275, 1, 0, 1,
-0.6054488, 1.201987, -0.8902899, 0.3607843, 1, 0, 1,
-0.6037819, 2.476674, 0.3302494, 0.3568628, 1, 0, 1,
-0.5983987, -0.4469702, -2.549492, 0.3490196, 1, 0, 1,
-0.5952541, -0.8244609, -1.697502, 0.345098, 1, 0, 1,
-0.5890507, 0.1501986, -0.6377993, 0.3372549, 1, 0, 1,
-0.58516, -0.07237758, -0.5140404, 0.3333333, 1, 0, 1,
-0.5727853, 0.1068267, 0.4108112, 0.3254902, 1, 0, 1,
-0.5687097, -1.055694, -1.989129, 0.3215686, 1, 0, 1,
-0.5676814, -0.7067841, -3.011226, 0.3137255, 1, 0, 1,
-0.5651073, 0.7322298, -0.8866254, 0.3098039, 1, 0, 1,
-0.5642173, -0.6830713, -3.249721, 0.3019608, 1, 0, 1,
-0.5615727, 0.7579817, -0.5534822, 0.2941177, 1, 0, 1,
-0.5594157, 0.3949776, -0.6004477, 0.2901961, 1, 0, 1,
-0.5487731, -1.073205, -1.305569, 0.282353, 1, 0, 1,
-0.545424, -1.412176, -3.688878, 0.2784314, 1, 0, 1,
-0.5429329, 0.2006702, -0.9484004, 0.2705882, 1, 0, 1,
-0.5428719, 3.396901, 0.2865714, 0.2666667, 1, 0, 1,
-0.5425039, 0.530256, -0.1757455, 0.2588235, 1, 0, 1,
-0.5420833, 0.2874787, -1.008039, 0.254902, 1, 0, 1,
-0.5416278, 0.7712341, -0.4253382, 0.2470588, 1, 0, 1,
-0.5406395, -0.6520292, -3.041249, 0.2431373, 1, 0, 1,
-0.5338711, 0.8943523, 0.4284455, 0.2352941, 1, 0, 1,
-0.5335504, -1.314662, -2.76284, 0.2313726, 1, 0, 1,
-0.5264952, 0.102978, -0.3015673, 0.2235294, 1, 0, 1,
-0.5261018, 1.40828, -0.5875838, 0.2196078, 1, 0, 1,
-0.5246375, -0.6527008, -3.267913, 0.2117647, 1, 0, 1,
-0.5216376, 0.5451676, -2.380767, 0.2078431, 1, 0, 1,
-0.5206202, -0.3809214, -0.7731548, 0.2, 1, 0, 1,
-0.5141104, -0.3917383, -2.43989, 0.1921569, 1, 0, 1,
-0.5140287, -0.6375916, -1.745572, 0.1882353, 1, 0, 1,
-0.5133777, 0.2108981, -1.439322, 0.1803922, 1, 0, 1,
-0.5083115, -0.06337108, -2.116464, 0.1764706, 1, 0, 1,
-0.5063749, -0.1732572, -0.6647376, 0.1686275, 1, 0, 1,
-0.5054979, -2.138091, -3.231685, 0.1647059, 1, 0, 1,
-0.4956329, -1.313757, -3.680824, 0.1568628, 1, 0, 1,
-0.4945925, -0.3056647, -3.002805, 0.1529412, 1, 0, 1,
-0.4934695, 1.70863, -0.4485955, 0.145098, 1, 0, 1,
-0.4912395, -0.5679795, -3.169248, 0.1411765, 1, 0, 1,
-0.4890466, -1.595123, -2.687681, 0.1333333, 1, 0, 1,
-0.4865294, 0.9760128, 0.7620347, 0.1294118, 1, 0, 1,
-0.4817192, -0.02603985, -1.511982, 0.1215686, 1, 0, 1,
-0.4765121, -0.05110452, -1.669071, 0.1176471, 1, 0, 1,
-0.4763263, 0.5990729, -0.3918475, 0.1098039, 1, 0, 1,
-0.4725886, 0.345636, -0.8367871, 0.1058824, 1, 0, 1,
-0.4700581, -0.2324742, -1.107137, 0.09803922, 1, 0, 1,
-0.4699218, 0.8482466, 0.3137628, 0.09019608, 1, 0, 1,
-0.4641512, 0.9380801, -1.121105, 0.08627451, 1, 0, 1,
-0.4573224, -1.350957, -3.840909, 0.07843138, 1, 0, 1,
-0.4550945, -0.9529865, -2.146423, 0.07450981, 1, 0, 1,
-0.4537368, 0.1515292, -2.201955, 0.06666667, 1, 0, 1,
-0.4500889, -0.7395421, -3.320892, 0.0627451, 1, 0, 1,
-0.4490955, 0.7755362, 0.9238775, 0.05490196, 1, 0, 1,
-0.4368856, -1.043277, -2.829828, 0.05098039, 1, 0, 1,
-0.4351249, -0.02252035, -4.177306, 0.04313726, 1, 0, 1,
-0.4303744, 0.351027, -1.095284, 0.03921569, 1, 0, 1,
-0.4290828, -0.3209403, 0.1278376, 0.03137255, 1, 0, 1,
-0.4270773, 1.297782, 0.5937948, 0.02745098, 1, 0, 1,
-0.4237942, -1.256505, -4.227213, 0.01960784, 1, 0, 1,
-0.42292, -0.3113605, -2.753935, 0.01568628, 1, 0, 1,
-0.4154554, -1.051085, -1.085371, 0.007843138, 1, 0, 1,
-0.4135994, -1.460472, -2.535271, 0.003921569, 1, 0, 1,
-0.4112926, 2.140668, -1.884081, 0, 1, 0.003921569, 1,
-0.4073774, 0.3461011, -1.601443, 0, 1, 0.01176471, 1,
-0.4072753, -0.9757965, -1.003495, 0, 1, 0.01568628, 1,
-0.4066704, 1.299358, 0.1006935, 0, 1, 0.02352941, 1,
-0.4043331, -1.009923, -1.894542, 0, 1, 0.02745098, 1,
-0.4025935, -0.7857851, -3.413474, 0, 1, 0.03529412, 1,
-0.3886275, -1.146307, -3.647941, 0, 1, 0.03921569, 1,
-0.3850238, -1.316462, -4.520583, 0, 1, 0.04705882, 1,
-0.3789354, 0.05582909, -0.3057051, 0, 1, 0.05098039, 1,
-0.3737978, -1.398135, -2.780104, 0, 1, 0.05882353, 1,
-0.3695292, 0.9803635, -0.9718936, 0, 1, 0.0627451, 1,
-0.3687858, -1.113613, -3.979414, 0, 1, 0.07058824, 1,
-0.3685381, 0.8490518, -0.874726, 0, 1, 0.07450981, 1,
-0.3674668, 1.524617, 0.3722759, 0, 1, 0.08235294, 1,
-0.3646972, -0.8807952, -3.212855, 0, 1, 0.08627451, 1,
-0.360792, 0.1236859, -1.629626, 0, 1, 0.09411765, 1,
-0.3583241, -1.602306, -2.129234, 0, 1, 0.1019608, 1,
-0.3534809, 0.9750985, -0.6393024, 0, 1, 0.1058824, 1,
-0.3453717, -0.02705262, -1.489789, 0, 1, 0.1137255, 1,
-0.3449564, -0.6393698, -3.44369, 0, 1, 0.1176471, 1,
-0.3397039, -0.4527567, -3.069871, 0, 1, 0.1254902, 1,
-0.3333683, -0.2562535, -0.974371, 0, 1, 0.1294118, 1,
-0.3302056, 0.1469401, -1.052654, 0, 1, 0.1372549, 1,
-0.3280874, -0.03884624, -1.55061, 0, 1, 0.1411765, 1,
-0.3276225, 0.5474287, -0.4091113, 0, 1, 0.1490196, 1,
-0.3204455, -0.08556873, -3.209369, 0, 1, 0.1529412, 1,
-0.3144381, -0.4379978, -2.260722, 0, 1, 0.1607843, 1,
-0.3137688, 0.2769166, -0.2369903, 0, 1, 0.1647059, 1,
-0.3126009, 0.8843583, -1.555699, 0, 1, 0.172549, 1,
-0.3103112, 0.9795096, -0.1449642, 0, 1, 0.1764706, 1,
-0.3046122, 2.394654, 1.130129, 0, 1, 0.1843137, 1,
-0.304139, -0.2825533, -2.64317, 0, 1, 0.1882353, 1,
-0.3027697, 1.592965, 1.401271, 0, 1, 0.1960784, 1,
-0.3016348, 0.1010051, -0.6043045, 0, 1, 0.2039216, 1,
-0.2998123, 0.1422687, -2.194289, 0, 1, 0.2078431, 1,
-0.2994794, -1.1689, -1.378938, 0, 1, 0.2156863, 1,
-0.2981434, -0.1057164, -2.825276, 0, 1, 0.2196078, 1,
-0.2969416, -0.1355102, -1.785472, 0, 1, 0.227451, 1,
-0.2950036, -0.8261922, -3.310414, 0, 1, 0.2313726, 1,
-0.2925589, -1.168538, -2.816209, 0, 1, 0.2392157, 1,
-0.2917043, 1.844307, 0.121323, 0, 1, 0.2431373, 1,
-0.2885741, 0.2736097, -2.280997, 0, 1, 0.2509804, 1,
-0.281399, -1.161029, -3.373539, 0, 1, 0.254902, 1,
-0.279521, 0.2504109, 0.4429544, 0, 1, 0.2627451, 1,
-0.276711, -0.875051, -3.455049, 0, 1, 0.2666667, 1,
-0.2733518, 0.883776, 0.367484, 0, 1, 0.2745098, 1,
-0.272321, -1.58913, -3.312215, 0, 1, 0.2784314, 1,
-0.2692676, -0.1221055, -1.128484, 0, 1, 0.2862745, 1,
-0.257959, 1.396796, -1.339541, 0, 1, 0.2901961, 1,
-0.2556801, -1.423944, -3.618572, 0, 1, 0.2980392, 1,
-0.2525578, 0.2698107, -0.8751391, 0, 1, 0.3058824, 1,
-0.2500711, -1.227742, -1.994118, 0, 1, 0.3098039, 1,
-0.2490965, 0.7221565, -0.3633828, 0, 1, 0.3176471, 1,
-0.2473451, -0.3489582, -4.250166, 0, 1, 0.3215686, 1,
-0.244548, -1.29906, -5.141327, 0, 1, 0.3294118, 1,
-0.2404395, 0.4242432, -0.3771653, 0, 1, 0.3333333, 1,
-0.2403975, -0.4138799, -1.336902, 0, 1, 0.3411765, 1,
-0.2396011, -0.6222923, -4.150321, 0, 1, 0.345098, 1,
-0.2376186, 1.141157, -0.8192413, 0, 1, 0.3529412, 1,
-0.2365043, -0.4006717, -2.219511, 0, 1, 0.3568628, 1,
-0.2357324, 0.6649634, -0.7138351, 0, 1, 0.3647059, 1,
-0.2350802, -1.494496, -2.812622, 0, 1, 0.3686275, 1,
-0.2349087, 0.8513499, -1.402431, 0, 1, 0.3764706, 1,
-0.2345323, 0.2460379, -0.7960101, 0, 1, 0.3803922, 1,
-0.2319051, -1.70857, -2.276729, 0, 1, 0.3882353, 1,
-0.2305116, 0.1274108, -0.6483861, 0, 1, 0.3921569, 1,
-0.2254734, -0.1046513, -3.114527, 0, 1, 0.4, 1,
-0.2232041, -0.9825665, -2.775209, 0, 1, 0.4078431, 1,
-0.2226158, -1.224783, -3.288412, 0, 1, 0.4117647, 1,
-0.2209984, -0.5837559, -1.78482, 0, 1, 0.4196078, 1,
-0.2161131, -0.6687132, -2.227709, 0, 1, 0.4235294, 1,
-0.2140427, 0.1464214, -1.018328, 0, 1, 0.4313726, 1,
-0.2131874, -0.3153913, -1.78367, 0, 1, 0.4352941, 1,
-0.2082787, 0.02092969, -0.8177596, 0, 1, 0.4431373, 1,
-0.2079374, -0.8162772, -2.216065, 0, 1, 0.4470588, 1,
-0.2070964, -0.2109777, -1.744743, 0, 1, 0.454902, 1,
-0.2050802, 2.086596, -0.3137546, 0, 1, 0.4588235, 1,
-0.2031712, 1.061637, 0.5832028, 0, 1, 0.4666667, 1,
-0.2028929, 0.4719774, -1.577013, 0, 1, 0.4705882, 1,
-0.1987355, 1.181978, -0.4675024, 0, 1, 0.4784314, 1,
-0.190543, -0.3601228, -1.49872, 0, 1, 0.4823529, 1,
-0.1899969, -0.5231427, -2.671919, 0, 1, 0.4901961, 1,
-0.1894879, 1.886968, 1.29629, 0, 1, 0.4941176, 1,
-0.1879145, 1.308194, -0.1069626, 0, 1, 0.5019608, 1,
-0.1869279, 0.293972, -1.472332, 0, 1, 0.509804, 1,
-0.1856301, 1.51158, 2.079475, 0, 1, 0.5137255, 1,
-0.1796605, -0.01886021, -2.732229, 0, 1, 0.5215687, 1,
-0.1791702, -1.737552, -1.509001, 0, 1, 0.5254902, 1,
-0.1779681, 0.6756725, -2.411285, 0, 1, 0.5333334, 1,
-0.1769279, -1.133906, -3.271281, 0, 1, 0.5372549, 1,
-0.1745471, 1.736717, -1.242337, 0, 1, 0.5450981, 1,
-0.1745081, -0.2425041, -1.982675, 0, 1, 0.5490196, 1,
-0.1731892, 0.8089927, -2.158383, 0, 1, 0.5568628, 1,
-0.1722751, 1.195755, 0.0545706, 0, 1, 0.5607843, 1,
-0.1716537, 2.033472, 1.790013, 0, 1, 0.5686275, 1,
-0.1712623, 0.1234178, -1.634636, 0, 1, 0.572549, 1,
-0.1671789, -1.049155, -3.928383, 0, 1, 0.5803922, 1,
-0.1642422, -0.3872304, -1.353017, 0, 1, 0.5843138, 1,
-0.1585566, 0.6580319, -1.448765, 0, 1, 0.5921569, 1,
-0.1568002, -0.7477967, -3.935877, 0, 1, 0.5960785, 1,
-0.1527076, -0.184545, -3.97667, 0, 1, 0.6039216, 1,
-0.1489011, -0.9763274, -1.987049, 0, 1, 0.6117647, 1,
-0.1428629, 0.4099529, -1.412399, 0, 1, 0.6156863, 1,
-0.1382376, -0.2833161, -3.572821, 0, 1, 0.6235294, 1,
-0.1358834, -0.709406, -2.343715, 0, 1, 0.627451, 1,
-0.1356433, -1.375912, -2.192065, 0, 1, 0.6352941, 1,
-0.1326269, -0.1367663, -3.054444, 0, 1, 0.6392157, 1,
-0.1303773, -1.170711, -3.188639, 0, 1, 0.6470588, 1,
-0.1278466, 0.0302301, -1.684662, 0, 1, 0.6509804, 1,
-0.127513, 0.3856112, -1.541417, 0, 1, 0.6588235, 1,
-0.1248099, 2.472102, -0.4153207, 0, 1, 0.6627451, 1,
-0.1231008, 0.7099997, -0.387257, 0, 1, 0.6705883, 1,
-0.1146805, 0.4727403, -2.619567, 0, 1, 0.6745098, 1,
-0.1139229, -0.3812981, -2.620595, 0, 1, 0.682353, 1,
-0.1037714, 1.213865, -1.770064, 0, 1, 0.6862745, 1,
-0.1033773, 1.234938, 0.0951525, 0, 1, 0.6941177, 1,
-0.103049, 1.644703, 0.1455407, 0, 1, 0.7019608, 1,
-0.1021081, 0.2623284, 0.1085094, 0, 1, 0.7058824, 1,
-0.1001991, -1.06936, -2.023566, 0, 1, 0.7137255, 1,
-0.09890686, -1.243474, -1.199893, 0, 1, 0.7176471, 1,
-0.09759419, 0.7941127, -1.733075, 0, 1, 0.7254902, 1,
-0.09559309, -0.1449936, -1.757673, 0, 1, 0.7294118, 1,
-0.09558026, -1.061996, -1.987747, 0, 1, 0.7372549, 1,
-0.09136892, -0.1070825, -2.881233, 0, 1, 0.7411765, 1,
-0.09117866, -1.982914, -3.788697, 0, 1, 0.7490196, 1,
-0.09006193, -2.039513, -4.73062, 0, 1, 0.7529412, 1,
-0.08849663, -1.050117, -1.929851, 0, 1, 0.7607843, 1,
-0.08838872, -0.4479147, -3.216256, 0, 1, 0.7647059, 1,
-0.0876517, -0.6660965, -2.692012, 0, 1, 0.772549, 1,
-0.08207575, -3.093526, -4.223901, 0, 1, 0.7764706, 1,
-0.08037575, -0.7245989, -3.282299, 0, 1, 0.7843137, 1,
-0.07942961, 2.033453, -0.7162376, 0, 1, 0.7882353, 1,
-0.07894778, -1.485461, -3.911533, 0, 1, 0.7960784, 1,
-0.07159537, -1.624524, -3.241782, 0, 1, 0.8039216, 1,
-0.06329349, -1.23708, -1.811641, 0, 1, 0.8078431, 1,
-0.06158615, -0.7138293, -3.638278, 0, 1, 0.8156863, 1,
-0.0573809, -1.880921, -2.2717, 0, 1, 0.8196079, 1,
-0.05533818, -1.327006, -4.042922, 0, 1, 0.827451, 1,
-0.05393111, 0.07806578, -0.3349606, 0, 1, 0.8313726, 1,
-0.05143008, -0.5481302, -1.676528, 0, 1, 0.8392157, 1,
-0.05051789, -0.5872965, -2.870083, 0, 1, 0.8431373, 1,
-0.04874428, 1.323099, 0.8065829, 0, 1, 0.8509804, 1,
-0.04866248, 1.455781, -0.2671591, 0, 1, 0.854902, 1,
-0.04830671, -0.6987872, -2.514609, 0, 1, 0.8627451, 1,
-0.04675759, 1.897343, 0.06972753, 0, 1, 0.8666667, 1,
-0.04598143, -1.680778, -4.307005, 0, 1, 0.8745098, 1,
-0.04284046, -0.8721617, -2.172473, 0, 1, 0.8784314, 1,
-0.04223993, 0.9336359, -0.8801818, 0, 1, 0.8862745, 1,
-0.04191408, 1.428072, -0.4544333, 0, 1, 0.8901961, 1,
-0.0416344, -0.4890339, -4.204783, 0, 1, 0.8980392, 1,
-0.04001585, 0.4009125, -1.303507, 0, 1, 0.9058824, 1,
-0.03800389, -0.5718021, -3.180823, 0, 1, 0.9098039, 1,
-0.03683427, -0.5178977, -3.758111, 0, 1, 0.9176471, 1,
-0.03552229, 0.7986327, -1.400209, 0, 1, 0.9215686, 1,
-0.02605329, 0.1786755, -1.120927, 0, 1, 0.9294118, 1,
-0.025206, 1.143792, 0.5446057, 0, 1, 0.9333333, 1,
-0.02359071, -0.1916647, -3.658818, 0, 1, 0.9411765, 1,
-0.01941554, -0.4115259, -3.594139, 0, 1, 0.945098, 1,
-0.01881377, 0.352258, -1.587293, 0, 1, 0.9529412, 1,
-0.01660224, -0.2774913, -2.573426, 0, 1, 0.9568627, 1,
-0.01560791, 1.851666, -0.300375, 0, 1, 0.9647059, 1,
-0.01375605, -0.7400914, -4.079019, 0, 1, 0.9686275, 1,
-0.01329454, 1.005475, -0.6586558, 0, 1, 0.9764706, 1,
-0.01174309, 0.42463, 0.5279712, 0, 1, 0.9803922, 1,
0.00283482, 0.360149, 0.6986085, 0, 1, 0.9882353, 1,
0.006033229, -0.1054462, 2.205239, 0, 1, 0.9921569, 1,
0.006290968, 0.3263983, 1.115763, 0, 1, 1, 1,
0.008111493, -0.2398443, 2.302449, 0, 0.9921569, 1, 1,
0.01075463, 0.2905315, 0.006988486, 0, 0.9882353, 1, 1,
0.01119921, -0.224231, 2.051573, 0, 0.9803922, 1, 1,
0.01505762, -0.922982, 3.573609, 0, 0.9764706, 1, 1,
0.01663273, -1.187649, 1.823179, 0, 0.9686275, 1, 1,
0.01744727, -0.790539, 2.375096, 0, 0.9647059, 1, 1,
0.01931839, -0.7999054, 3.137131, 0, 0.9568627, 1, 1,
0.02160976, -0.3275474, 3.845141, 0, 0.9529412, 1, 1,
0.02392015, -0.08650333, 2.4476, 0, 0.945098, 1, 1,
0.02589867, -0.05485654, 1.953403, 0, 0.9411765, 1, 1,
0.03191126, 1.964678, -1.153807, 0, 0.9333333, 1, 1,
0.0321575, -0.6864559, 2.259161, 0, 0.9294118, 1, 1,
0.03335092, -0.2395665, 5.144611, 0, 0.9215686, 1, 1,
0.03607742, 2.362424, 0.6699563, 0, 0.9176471, 1, 1,
0.03837888, 1.40709, 0.7840059, 0, 0.9098039, 1, 1,
0.03993014, 0.9047916, 1.80222, 0, 0.9058824, 1, 1,
0.04373637, -0.07721329, 2.622318, 0, 0.8980392, 1, 1,
0.0439845, 1.044658, 0.5266874, 0, 0.8901961, 1, 1,
0.04692791, 0.6462108, 1.441878, 0, 0.8862745, 1, 1,
0.04777038, -1.54205, 3.700321, 0, 0.8784314, 1, 1,
0.05101075, 0.881296, 0.6249163, 0, 0.8745098, 1, 1,
0.05400243, 0.4886394, -1.638452, 0, 0.8666667, 1, 1,
0.05504909, 1.393902, 2.175685, 0, 0.8627451, 1, 1,
0.05510347, 0.8903275, 1.042016, 0, 0.854902, 1, 1,
0.05676153, 1.465092, 0.9449936, 0, 0.8509804, 1, 1,
0.06016035, 2.577274, 0.4770416, 0, 0.8431373, 1, 1,
0.06109665, 0.4432043, 0.3973143, 0, 0.8392157, 1, 1,
0.06204135, -0.4661484, 2.710244, 0, 0.8313726, 1, 1,
0.06291441, -0.03255345, 0.994611, 0, 0.827451, 1, 1,
0.06498385, -0.4661208, 2.599295, 0, 0.8196079, 1, 1,
0.06641238, 0.5779777, -1.676065, 0, 0.8156863, 1, 1,
0.07104488, -0.7841891, 2.342108, 0, 0.8078431, 1, 1,
0.0712569, -0.2999765, 3.85148, 0, 0.8039216, 1, 1,
0.0755601, 0.4841778, 1.071222, 0, 0.7960784, 1, 1,
0.07565392, -0.4637445, 3.863604, 0, 0.7882353, 1, 1,
0.08014518, 1.240324, -0.1294039, 0, 0.7843137, 1, 1,
0.08640704, -2.354748, 3.361792, 0, 0.7764706, 1, 1,
0.08786114, 1.043623, -1.621899, 0, 0.772549, 1, 1,
0.08815155, -0.3946381, 3.921015, 0, 0.7647059, 1, 1,
0.0909071, -1.202866, 2.416255, 0, 0.7607843, 1, 1,
0.09107084, -0.4842358, 3.467262, 0, 0.7529412, 1, 1,
0.09358486, -1.288914, 1.783278, 0, 0.7490196, 1, 1,
0.09417165, -0.6591753, 3.761788, 0, 0.7411765, 1, 1,
0.09426134, 2.155, -0.6349342, 0, 0.7372549, 1, 1,
0.09509897, -2.360734, 3.561588, 0, 0.7294118, 1, 1,
0.09606943, 0.5712467, -1.727999, 0, 0.7254902, 1, 1,
0.09691276, 0.6395697, 0.4086072, 0, 0.7176471, 1, 1,
0.09787674, -1.259742, 3.978791, 0, 0.7137255, 1, 1,
0.1036825, 0.5346081, 1.991109, 0, 0.7058824, 1, 1,
0.1057586, 0.3981286, 0.2183408, 0, 0.6980392, 1, 1,
0.1072494, 0.4531233, -0.4328319, 0, 0.6941177, 1, 1,
0.1085837, 0.663562, -0.1042592, 0, 0.6862745, 1, 1,
0.1096778, -0.828505, 3.15934, 0, 0.682353, 1, 1,
0.1141918, 1.224629, 0.5818833, 0, 0.6745098, 1, 1,
0.1189647, 1.156264, 1.051777, 0, 0.6705883, 1, 1,
0.1198004, 1.073534, -0.3243774, 0, 0.6627451, 1, 1,
0.1199429, 0.9024019, -0.2926695, 0, 0.6588235, 1, 1,
0.120335, 1.094525, 0.3177159, 0, 0.6509804, 1, 1,
0.1208251, -0.765462, 3.233543, 0, 0.6470588, 1, 1,
0.1221563, 1.236195, 0.5087453, 0, 0.6392157, 1, 1,
0.1223761, -0.564211, 2.563763, 0, 0.6352941, 1, 1,
0.1269556, -0.2465901, 4.005741, 0, 0.627451, 1, 1,
0.1270763, 0.6404691, 0.5417666, 0, 0.6235294, 1, 1,
0.1315658, 0.2592246, 0.2644709, 0, 0.6156863, 1, 1,
0.1333008, 0.09089185, 1.890557, 0, 0.6117647, 1, 1,
0.1359077, -1.874089, 1.578415, 0, 0.6039216, 1, 1,
0.1365716, -1.943194, 4.242025, 0, 0.5960785, 1, 1,
0.1518474, 0.3729711, 0.8674592, 0, 0.5921569, 1, 1,
0.1555183, -0.9720576, 4.211417, 0, 0.5843138, 1, 1,
0.1577111, -0.08220761, 2.610221, 0, 0.5803922, 1, 1,
0.1709741, -0.9890376, 2.356077, 0, 0.572549, 1, 1,
0.1716697, 2.10281, -0.744431, 0, 0.5686275, 1, 1,
0.1719728, -0.3050955, 0.9793509, 0, 0.5607843, 1, 1,
0.1735723, -0.07303202, 2.746456, 0, 0.5568628, 1, 1,
0.1804, -1.185824, 3.081984, 0, 0.5490196, 1, 1,
0.1804841, 0.3805082, 2.057784, 0, 0.5450981, 1, 1,
0.1824453, 0.3887646, 1.697401, 0, 0.5372549, 1, 1,
0.1842961, 0.01120854, 0.07149887, 0, 0.5333334, 1, 1,
0.1846289, -0.769396, 1.965686, 0, 0.5254902, 1, 1,
0.1881279, 0.8569297, 0.8012553, 0, 0.5215687, 1, 1,
0.1899206, 1.475164, -0.538277, 0, 0.5137255, 1, 1,
0.192438, -1.737067, 4.118346, 0, 0.509804, 1, 1,
0.1925824, 1.10025, -0.3041926, 0, 0.5019608, 1, 1,
0.1925976, 0.613133, 0.9790727, 0, 0.4941176, 1, 1,
0.1945606, -0.01506883, 1.222069, 0, 0.4901961, 1, 1,
0.1951734, -0.566358, 3.68724, 0, 0.4823529, 1, 1,
0.2034231, 0.1872715, 2.169328, 0, 0.4784314, 1, 1,
0.2057612, -0.3623975, 4.172325, 0, 0.4705882, 1, 1,
0.20662, 0.5504631, -0.8417453, 0, 0.4666667, 1, 1,
0.209683, -0.8510059, 3.392313, 0, 0.4588235, 1, 1,
0.2135097, -0.6932033, 2.358027, 0, 0.454902, 1, 1,
0.2160147, -1.013282, 3.669603, 0, 0.4470588, 1, 1,
0.2281974, 1.165786, 0.7314969, 0, 0.4431373, 1, 1,
0.2282527, 1.045613, 0.8927921, 0, 0.4352941, 1, 1,
0.2345585, 2.280232, -0.6981661, 0, 0.4313726, 1, 1,
0.2388678, -1.246107, 1.806645, 0, 0.4235294, 1, 1,
0.2389485, 0.09668902, 1.593301, 0, 0.4196078, 1, 1,
0.2406166, -0.6089199, 2.306258, 0, 0.4117647, 1, 1,
0.244882, -0.9645302, 2.395239, 0, 0.4078431, 1, 1,
0.2456543, 0.4405757, 0.9986797, 0, 0.4, 1, 1,
0.2471845, 0.02710449, 0.6002289, 0, 0.3921569, 1, 1,
0.2474189, -0.1516127, 0.9929075, 0, 0.3882353, 1, 1,
0.2525113, 1.148508, 0.7153242, 0, 0.3803922, 1, 1,
0.2590349, 0.1400826, 1.718498, 0, 0.3764706, 1, 1,
0.2616581, -0.2073424, 2.007689, 0, 0.3686275, 1, 1,
0.2642436, -2.182583, 2.521979, 0, 0.3647059, 1, 1,
0.2659134, -2.138594, 2.927136, 0, 0.3568628, 1, 1,
0.2686866, 1.903056, -1.019706, 0, 0.3529412, 1, 1,
0.2700194, -0.1487917, 0.8945864, 0, 0.345098, 1, 1,
0.2710288, -0.9456851, 3.11248, 0, 0.3411765, 1, 1,
0.2725378, 1.153073, -1.530721, 0, 0.3333333, 1, 1,
0.2735891, 2.179277, -0.1194742, 0, 0.3294118, 1, 1,
0.2737529, 1.433709, 0.3678554, 0, 0.3215686, 1, 1,
0.2740092, -0.8463063, 3.644748, 0, 0.3176471, 1, 1,
0.2763243, 0.2996125, 2.51624, 0, 0.3098039, 1, 1,
0.2782648, 0.3555217, -0.4296418, 0, 0.3058824, 1, 1,
0.2802423, -0.3944185, 3.16516, 0, 0.2980392, 1, 1,
0.2812215, 0.5642756, 0.8123499, 0, 0.2901961, 1, 1,
0.2813066, -0.9089315, 2.949973, 0, 0.2862745, 1, 1,
0.2815906, 1.397108, -0.06210685, 0, 0.2784314, 1, 1,
0.2838467, 0.1621167, 0.667107, 0, 0.2745098, 1, 1,
0.2876425, 2.051396, -0.4935749, 0, 0.2666667, 1, 1,
0.3004719, 0.4875368, 1.268723, 0, 0.2627451, 1, 1,
0.306392, -1.619081, 3.166027, 0, 0.254902, 1, 1,
0.3159967, -0.8829331, 1.601426, 0, 0.2509804, 1, 1,
0.3176206, -1.463038, 2.49985, 0, 0.2431373, 1, 1,
0.3218706, 0.1757013, 0.914134, 0, 0.2392157, 1, 1,
0.3225569, 0.8718632, -0.4797353, 0, 0.2313726, 1, 1,
0.3238264, -0.9435984, 2.729753, 0, 0.227451, 1, 1,
0.3251629, -0.309944, 2.697583, 0, 0.2196078, 1, 1,
0.3265893, 0.1831243, 1.212315, 0, 0.2156863, 1, 1,
0.3380002, 0.2385739, -0.4144521, 0, 0.2078431, 1, 1,
0.3401443, 0.2011004, 1.249011, 0, 0.2039216, 1, 1,
0.3437243, 0.3874955, -0.1149459, 0, 0.1960784, 1, 1,
0.3460481, 1.36024, 0.3314098, 0, 0.1882353, 1, 1,
0.3526391, 0.3925223, 1.584151, 0, 0.1843137, 1, 1,
0.3529494, -1.051827, 1.572708, 0, 0.1764706, 1, 1,
0.35361, -1.713177, 3.764434, 0, 0.172549, 1, 1,
0.3544272, -1.291212, 2.484401, 0, 0.1647059, 1, 1,
0.3551317, 1.763315, 0.2761899, 0, 0.1607843, 1, 1,
0.3555792, 0.8023025, 0.7329712, 0, 0.1529412, 1, 1,
0.3565124, -0.05279788, 2.316104, 0, 0.1490196, 1, 1,
0.3565678, -0.6607109, 3.114587, 0, 0.1411765, 1, 1,
0.3594065, 1.674371, 0.4690473, 0, 0.1372549, 1, 1,
0.3608761, -1.77671, 3.879639, 0, 0.1294118, 1, 1,
0.3612258, -0.4325666, 2.784506, 0, 0.1254902, 1, 1,
0.3666939, 1.105981, 0.013857, 0, 0.1176471, 1, 1,
0.3712516, 0.223297, 1.50425, 0, 0.1137255, 1, 1,
0.3731194, -1.617379, 2.922876, 0, 0.1058824, 1, 1,
0.3773035, 0.4209504, 1.37105, 0, 0.09803922, 1, 1,
0.3786865, -1.030692, 5.088996, 0, 0.09411765, 1, 1,
0.379452, 0.3787978, 1.684284, 0, 0.08627451, 1, 1,
0.3800017, 1.265525, 0.3957393, 0, 0.08235294, 1, 1,
0.3848112, -0.2979076, 3.435836, 0, 0.07450981, 1, 1,
0.3852368, 0.798037, -0.2620546, 0, 0.07058824, 1, 1,
0.3857776, -0.7058877, 0.5963398, 0, 0.0627451, 1, 1,
0.3867266, -1.100733, 2.159, 0, 0.05882353, 1, 1,
0.3879685, 0.7582126, -0.08492661, 0, 0.05098039, 1, 1,
0.3960697, -0.4911025, 3.872769, 0, 0.04705882, 1, 1,
0.3988561, 1.241884, -0.7233402, 0, 0.03921569, 1, 1,
0.402453, 0.6757635, 0.7001426, 0, 0.03529412, 1, 1,
0.405855, -0.8125528, 2.485095, 0, 0.02745098, 1, 1,
0.41084, 1.572294, -0.8626592, 0, 0.02352941, 1, 1,
0.413208, -0.4223521, 4.13471, 0, 0.01568628, 1, 1,
0.414574, -0.8820053, 3.706929, 0, 0.01176471, 1, 1,
0.4148386, -1.218151, 1.261737, 0, 0.003921569, 1, 1,
0.4155186, -1.428987, 2.602897, 0.003921569, 0, 1, 1,
0.4198755, -0.4980429, 1.42951, 0.007843138, 0, 1, 1,
0.4306443, -1.200185, 4.27302, 0.01568628, 0, 1, 1,
0.4318332, -1.21616, 2.191254, 0.01960784, 0, 1, 1,
0.4325382, -0.2519636, 1.018585, 0.02745098, 0, 1, 1,
0.434298, -0.5853289, 3.712521, 0.03137255, 0, 1, 1,
0.4399155, 0.1575905, 1.666202, 0.03921569, 0, 1, 1,
0.4403158, 0.1742344, 0.8073926, 0.04313726, 0, 1, 1,
0.4422802, 2.016533, -1.338822, 0.05098039, 0, 1, 1,
0.4435169, -1.410873, 2.650903, 0.05490196, 0, 1, 1,
0.4438522, -0.5662377, 0.2664719, 0.0627451, 0, 1, 1,
0.4494264, -1.130696, 0.9865055, 0.06666667, 0, 1, 1,
0.4511687, 0.7570316, -0.2556689, 0.07450981, 0, 1, 1,
0.4549798, 0.1432807, 0.4527628, 0.07843138, 0, 1, 1,
0.4594274, -0.1414277, 2.818559, 0.08627451, 0, 1, 1,
0.4599085, 1.279284, 0.1956073, 0.09019608, 0, 1, 1,
0.4605836, -0.8579438, 2.095294, 0.09803922, 0, 1, 1,
0.4643376, 0.9539085, 0.3307387, 0.1058824, 0, 1, 1,
0.4696491, -0.7884969, 0.9955224, 0.1098039, 0, 1, 1,
0.4713282, -1.195219, 2.325576, 0.1176471, 0, 1, 1,
0.4790198, -0.112179, 4.297314, 0.1215686, 0, 1, 1,
0.4875351, -0.1192245, 1.708845, 0.1294118, 0, 1, 1,
0.4972109, -0.04516838, 2.862427, 0.1333333, 0, 1, 1,
0.4976752, 0.7794492, -0.1113158, 0.1411765, 0, 1, 1,
0.5078259, -1.02784, 2.121672, 0.145098, 0, 1, 1,
0.5127243, -1.268921, 0.4809678, 0.1529412, 0, 1, 1,
0.5160765, 0.1897947, 1.618424, 0.1568628, 0, 1, 1,
0.5169702, -1.51013, 4.841759, 0.1647059, 0, 1, 1,
0.5251998, 0.5991156, 1.678936, 0.1686275, 0, 1, 1,
0.5284281, -0.3279618, 3.949882, 0.1764706, 0, 1, 1,
0.5307475, 0.007526671, -0.5494016, 0.1803922, 0, 1, 1,
0.5321915, -0.9764041, 2.117421, 0.1882353, 0, 1, 1,
0.5331008, 0.70169, 0.4533584, 0.1921569, 0, 1, 1,
0.5346875, 0.068058, 0.9351267, 0.2, 0, 1, 1,
0.5388817, 0.6024139, 0.6732432, 0.2078431, 0, 1, 1,
0.5416532, -0.5073354, 2.095721, 0.2117647, 0, 1, 1,
0.5436395, -2.207439, 3.37515, 0.2196078, 0, 1, 1,
0.5460577, -1.435509, 4.388999, 0.2235294, 0, 1, 1,
0.5486265, -1.625509, 3.750432, 0.2313726, 0, 1, 1,
0.5510094, -0.4675292, 2.682912, 0.2352941, 0, 1, 1,
0.5519391, 1.198733, 1.05879, 0.2431373, 0, 1, 1,
0.5541658, 0.2357659, -0.04452921, 0.2470588, 0, 1, 1,
0.5568087, -0.1276493, 2.524834, 0.254902, 0, 1, 1,
0.5573483, 0.4193269, 1.916924, 0.2588235, 0, 1, 1,
0.5597006, 0.2497616, 1.252162, 0.2666667, 0, 1, 1,
0.5601029, -1.177482, 0.8270888, 0.2705882, 0, 1, 1,
0.5604587, -0.3355435, -0.03369342, 0.2784314, 0, 1, 1,
0.5663306, -0.4530112, 1.475744, 0.282353, 0, 1, 1,
0.5668831, 0.001580586, 2.506515, 0.2901961, 0, 1, 1,
0.5755154, 0.9545898, 0.6294414, 0.2941177, 0, 1, 1,
0.5774869, -0.1237474, 0.1756965, 0.3019608, 0, 1, 1,
0.5807571, 0.5788417, 1.251643, 0.3098039, 0, 1, 1,
0.5811823, 0.9986324, 2.158758, 0.3137255, 0, 1, 1,
0.5821514, 0.03719758, 1.270316, 0.3215686, 0, 1, 1,
0.5851016, 0.004776047, 0.8139528, 0.3254902, 0, 1, 1,
0.5870349, 0.9832854, 2.141937, 0.3333333, 0, 1, 1,
0.6007352, 0.4837383, 2.49821, 0.3372549, 0, 1, 1,
0.6082976, 0.8635496, 0.4249376, 0.345098, 0, 1, 1,
0.609493, 1.171495, 1.492409, 0.3490196, 0, 1, 1,
0.6116859, 0.9473867, -1.341905, 0.3568628, 0, 1, 1,
0.6250954, 0.7983094, 1.0587, 0.3607843, 0, 1, 1,
0.6256902, -0.001011415, 1.449126, 0.3686275, 0, 1, 1,
0.629298, -0.1987636, 3.43314, 0.372549, 0, 1, 1,
0.6303553, -1.96064, 2.823838, 0.3803922, 0, 1, 1,
0.6324969, 1.323467, -2.545879, 0.3843137, 0, 1, 1,
0.6349409, -0.4234297, 2.30201, 0.3921569, 0, 1, 1,
0.6396742, -0.7848896, 3.176722, 0.3960784, 0, 1, 1,
0.6439904, 0.374403, 0.4546073, 0.4039216, 0, 1, 1,
0.6543903, 0.306414, 0.4809983, 0.4117647, 0, 1, 1,
0.6552202, -0.9665741, 1.002378, 0.4156863, 0, 1, 1,
0.6580978, 1.043853, 0.1385961, 0.4235294, 0, 1, 1,
0.6583292, -1.012837, 4.053633, 0.427451, 0, 1, 1,
0.6633499, 1.022858, -0.8460183, 0.4352941, 0, 1, 1,
0.6678607, 0.3683676, 0.5546035, 0.4392157, 0, 1, 1,
0.6684337, 0.6428973, 0.4237201, 0.4470588, 0, 1, 1,
0.6708888, -0.8838769, 2.118915, 0.4509804, 0, 1, 1,
0.6771003, -1.271919, 2.609227, 0.4588235, 0, 1, 1,
0.679687, 0.04889688, 1.797044, 0.4627451, 0, 1, 1,
0.681157, -0.2493388, 1.77431, 0.4705882, 0, 1, 1,
0.6885641, -0.2207406, 1.310625, 0.4745098, 0, 1, 1,
0.68884, 1.922667, 0.9507845, 0.4823529, 0, 1, 1,
0.6938835, 0.01769936, 1.821869, 0.4862745, 0, 1, 1,
0.6943471, -0.3656133, 2.908778, 0.4941176, 0, 1, 1,
0.7031757, -0.8346202, 2.583618, 0.5019608, 0, 1, 1,
0.7034858, 0.9341905, 1.477838, 0.5058824, 0, 1, 1,
0.7048164, -1.062086, 2.870913, 0.5137255, 0, 1, 1,
0.7127201, 2.440863, -0.5329699, 0.5176471, 0, 1, 1,
0.7145424, -0.533111, 0.5256962, 0.5254902, 0, 1, 1,
0.7224056, 0.09588052, 2.278599, 0.5294118, 0, 1, 1,
0.7228257, 0.7885573, 0.181146, 0.5372549, 0, 1, 1,
0.7233467, 1.052633, -0.7519951, 0.5411765, 0, 1, 1,
0.7236977, 0.1663823, 1.421592, 0.5490196, 0, 1, 1,
0.728663, -0.7624302, 2.323203, 0.5529412, 0, 1, 1,
0.7352509, 2.230595, 0.04912504, 0.5607843, 0, 1, 1,
0.7381023, 2.172793, 2.76035, 0.5647059, 0, 1, 1,
0.7496086, 0.583671, -1.305891, 0.572549, 0, 1, 1,
0.7533078, 2.551691, 0.05166329, 0.5764706, 0, 1, 1,
0.7589586, 0.3171226, 0.6120685, 0.5843138, 0, 1, 1,
0.7608808, 0.2665037, 2.614533, 0.5882353, 0, 1, 1,
0.7622252, -0.9641787, 2.883639, 0.5960785, 0, 1, 1,
0.7628345, -0.3193164, 0.05718401, 0.6039216, 0, 1, 1,
0.7694753, -1.273732, 2.35798, 0.6078432, 0, 1, 1,
0.7724786, 1.499039, -2.231246, 0.6156863, 0, 1, 1,
0.7749683, -1.195791, 3.366688, 0.6196079, 0, 1, 1,
0.7773176, 0.5349677, 2.9728, 0.627451, 0, 1, 1,
0.7829749, 0.3561416, 1.709913, 0.6313726, 0, 1, 1,
0.7837274, -1.089778, 0.7773553, 0.6392157, 0, 1, 1,
0.7865225, -0.2975607, 1.894583, 0.6431373, 0, 1, 1,
0.7889993, 1.343363, 1.171949, 0.6509804, 0, 1, 1,
0.7903318, -0.9984517, 1.078446, 0.654902, 0, 1, 1,
0.7918048, -0.1709218, 0.6657129, 0.6627451, 0, 1, 1,
0.8026124, 0.2308493, 1.398762, 0.6666667, 0, 1, 1,
0.8059033, -0.859201, 3.674121, 0.6745098, 0, 1, 1,
0.8065886, -1.392919, 3.554616, 0.6784314, 0, 1, 1,
0.808049, -0.4863151, 1.507007, 0.6862745, 0, 1, 1,
0.8084267, -1.239432, 2.208096, 0.6901961, 0, 1, 1,
0.8126794, -1.915927, 6.04951, 0.6980392, 0, 1, 1,
0.8136005, -2.065331, 2.749811, 0.7058824, 0, 1, 1,
0.8146421, 0.8685757, 1.116701, 0.7098039, 0, 1, 1,
0.8150015, -1.746105, 2.821524, 0.7176471, 0, 1, 1,
0.8202986, -1.197303, 1.716503, 0.7215686, 0, 1, 1,
0.821429, 0.6175908, 0.8093907, 0.7294118, 0, 1, 1,
0.821453, 0.466575, 1.333348, 0.7333333, 0, 1, 1,
0.8217361, 0.5909592, 0.2739544, 0.7411765, 0, 1, 1,
0.8240641, 0.08042432, 1.169413, 0.7450981, 0, 1, 1,
0.8247643, -3.367563, 3.208925, 0.7529412, 0, 1, 1,
0.8273337, 0.338582, 0.563072, 0.7568628, 0, 1, 1,
0.8273544, 0.6302363, 0.3880147, 0.7647059, 0, 1, 1,
0.8360554, 0.6963618, -1.209787, 0.7686275, 0, 1, 1,
0.8415124, -1.943842, 2.272154, 0.7764706, 0, 1, 1,
0.842224, 1.282141, -0.1443873, 0.7803922, 0, 1, 1,
0.8473217, -1.127532, 2.752559, 0.7882353, 0, 1, 1,
0.8476073, -0.2791705, 2.128418, 0.7921569, 0, 1, 1,
0.8532566, 0.5627282, 0.6935362, 0.8, 0, 1, 1,
0.8580163, 1.577067, 1.83416, 0.8078431, 0, 1, 1,
0.8580244, -0.55852, 2.594905, 0.8117647, 0, 1, 1,
0.8668926, -2.376141, 5.773114, 0.8196079, 0, 1, 1,
0.8686649, -0.4011991, 1.204038, 0.8235294, 0, 1, 1,
0.8803509, 0.6130599, 1.731989, 0.8313726, 0, 1, 1,
0.8805931, 1.664633, -0.2027371, 0.8352941, 0, 1, 1,
0.8867865, -0.8793517, 2.126021, 0.8431373, 0, 1, 1,
0.8877306, -1.412512, 2.836728, 0.8470588, 0, 1, 1,
0.91382, -0.2011263, 2.675476, 0.854902, 0, 1, 1,
0.9195005, -0.69355, 1.634717, 0.8588235, 0, 1, 1,
0.9198883, 0.579597, 0.7754524, 0.8666667, 0, 1, 1,
0.9208193, -1.292089, 1.760249, 0.8705882, 0, 1, 1,
0.9214234, 1.041656, 0.6937975, 0.8784314, 0, 1, 1,
0.9251076, 0.578845, 0.3248876, 0.8823529, 0, 1, 1,
0.9303998, 0.7332462, 0.1161819, 0.8901961, 0, 1, 1,
0.9332037, 1.586799, 0.6236378, 0.8941177, 0, 1, 1,
0.9353788, 1.213647, 0.5245153, 0.9019608, 0, 1, 1,
0.9360167, -0.3141533, 1.858312, 0.9098039, 0, 1, 1,
0.9366671, 0.4318399, 0.611431, 0.9137255, 0, 1, 1,
0.9379715, -0.5350598, 1.371874, 0.9215686, 0, 1, 1,
0.9457694, -0.5989946, 2.74504, 0.9254902, 0, 1, 1,
0.9459803, 1.105971, 2.240861, 0.9333333, 0, 1, 1,
0.9521847, -1.218977, 1.847202, 0.9372549, 0, 1, 1,
0.9534898, -1.412153, 1.844731, 0.945098, 0, 1, 1,
0.9542707, -0.9702843, 2.292272, 0.9490196, 0, 1, 1,
0.954536, -0.4438941, 2.455439, 0.9568627, 0, 1, 1,
0.9548867, -1.309569, 2.448344, 0.9607843, 0, 1, 1,
0.9580785, 0.6394255, 0.8323291, 0.9686275, 0, 1, 1,
0.9601688, -0.4549234, 2.686008, 0.972549, 0, 1, 1,
0.9613297, 0.2167762, 1.326258, 0.9803922, 0, 1, 1,
0.9642588, 0.917543, 0.4374849, 0.9843137, 0, 1, 1,
0.966521, 0.1231915, 0.7288529, 0.9921569, 0, 1, 1,
0.9713783, -0.490467, 3.322307, 0.9960784, 0, 1, 1,
0.9748028, -0.3553859, 2.337792, 1, 0, 0.9960784, 1,
0.976006, -0.07162399, 1.951357, 1, 0, 0.9882353, 1,
0.9800088, 0.4728911, 1.884181, 1, 0, 0.9843137, 1,
0.9814048, -0.7845014, 3.82402, 1, 0, 0.9764706, 1,
0.9814218, -0.5105491, 1.391931, 1, 0, 0.972549, 1,
0.986636, -0.5329763, 2.989494, 1, 0, 0.9647059, 1,
0.9897786, 0.3749399, 0.07242332, 1, 0, 0.9607843, 1,
0.9972411, 0.6608756, 0.3124355, 1, 0, 0.9529412, 1,
0.9985711, 0.9416251, 0.418384, 1, 0, 0.9490196, 1,
1.004691, -0.655633, 1.768309, 1, 0, 0.9411765, 1,
1.005432, -1.109727, 2.473331, 1, 0, 0.9372549, 1,
1.009923, 0.6166985, -0.7612265, 1, 0, 0.9294118, 1,
1.017854, -0.9788367, 1.682227, 1, 0, 0.9254902, 1,
1.023497, -0.6481596, 0.9068347, 1, 0, 0.9176471, 1,
1.02603, -2.042212, 5.227425, 1, 0, 0.9137255, 1,
1.035834, 2.536634, 0.6740096, 1, 0, 0.9058824, 1,
1.037526, 0.7564217, -1.037299, 1, 0, 0.9019608, 1,
1.042688, -1.11072, 2.401451, 1, 0, 0.8941177, 1,
1.04422, 0.8591642, 0.1801304, 1, 0, 0.8862745, 1,
1.047749, -0.5356672, 3.022328, 1, 0, 0.8823529, 1,
1.04979, -0.02979164, 1.479926, 1, 0, 0.8745098, 1,
1.051733, 0.4732808, 0.395434, 1, 0, 0.8705882, 1,
1.053989, 0.932395, 2.80488, 1, 0, 0.8627451, 1,
1.057403, -0.6978855, 1.670824, 1, 0, 0.8588235, 1,
1.058193, 1.204542, -0.5876853, 1, 0, 0.8509804, 1,
1.060942, -0.07748377, -0.5634615, 1, 0, 0.8470588, 1,
1.067548, 1.922777, -0.3704284, 1, 0, 0.8392157, 1,
1.071448, 0.3896908, 0.5145725, 1, 0, 0.8352941, 1,
1.080544, -0.8064918, 0.9752219, 1, 0, 0.827451, 1,
1.08094, -0.2977711, 1.502788, 1, 0, 0.8235294, 1,
1.085074, 1.221808, 0.048194, 1, 0, 0.8156863, 1,
1.094099, -0.3729214, 0.252565, 1, 0, 0.8117647, 1,
1.103129, 0.9605909, 0.01632264, 1, 0, 0.8039216, 1,
1.106485, 0.3455444, 0.6658944, 1, 0, 0.7960784, 1,
1.106713, 1.734434, -0.0892336, 1, 0, 0.7921569, 1,
1.108793, 0.7545466, 2.362713, 1, 0, 0.7843137, 1,
1.112869, -0.6590967, 1.900349, 1, 0, 0.7803922, 1,
1.116278, 0.040979, 1.574698, 1, 0, 0.772549, 1,
1.119628, 0.2101606, 2.875305, 1, 0, 0.7686275, 1,
1.12322, 1.415568, -0.4339916, 1, 0, 0.7607843, 1,
1.126072, -0.712597, 0.1758868, 1, 0, 0.7568628, 1,
1.128379, 0.8584676, 0.8255441, 1, 0, 0.7490196, 1,
1.141059, 0.9571243, 0.4384012, 1, 0, 0.7450981, 1,
1.146083, -0.9619771, 2.113374, 1, 0, 0.7372549, 1,
1.150496, -0.7165394, 2.969898, 1, 0, 0.7333333, 1,
1.151739, -0.005903402, 1.948721, 1, 0, 0.7254902, 1,
1.154621, 0.5859926, 1.169648, 1, 0, 0.7215686, 1,
1.154806, -1.631682, 2.654728, 1, 0, 0.7137255, 1,
1.157984, -0.5121516, 1.11586, 1, 0, 0.7098039, 1,
1.162972, 0.6402161, -0.1703366, 1, 0, 0.7019608, 1,
1.171402, -0.08602452, 0.7828045, 1, 0, 0.6941177, 1,
1.172186, 1.841634, 0.363004, 1, 0, 0.6901961, 1,
1.176525, -0.3617427, 2.46181, 1, 0, 0.682353, 1,
1.178683, -0.8697881, 3.93888, 1, 0, 0.6784314, 1,
1.18326, -0.66175, 1.234296, 1, 0, 0.6705883, 1,
1.193763, 1.886014, 0.8003267, 1, 0, 0.6666667, 1,
1.196836, -0.1934308, 1.176731, 1, 0, 0.6588235, 1,
1.201415, -0.4836929, 3.162865, 1, 0, 0.654902, 1,
1.203736, -2.241616, 1.326011, 1, 0, 0.6470588, 1,
1.207449, 0.7314172, 1.809164, 1, 0, 0.6431373, 1,
1.20981, 0.1570817, 1.538997, 1, 0, 0.6352941, 1,
1.213507, 0.9015826, 2.0975, 1, 0, 0.6313726, 1,
1.229641, -0.6432286, 1.587967, 1, 0, 0.6235294, 1,
1.231127, 0.4097424, 1.940637, 1, 0, 0.6196079, 1,
1.233064, 1.210152, 0.8241922, 1, 0, 0.6117647, 1,
1.23406, 0.980622, 1.764289, 1, 0, 0.6078432, 1,
1.243261, 0.4527214, -0.2371174, 1, 0, 0.6, 1,
1.247261, -0.4191037, 2.020696, 1, 0, 0.5921569, 1,
1.259648, -0.1426958, 3.035775, 1, 0, 0.5882353, 1,
1.260321, -1.256068, 2.545024, 1, 0, 0.5803922, 1,
1.276082, -2.338737, 1.526503, 1, 0, 0.5764706, 1,
1.277341, 0.3839707, 0.6502711, 1, 0, 0.5686275, 1,
1.278273, 0.4005302, 1.80252, 1, 0, 0.5647059, 1,
1.29318, -0.931931, 1.045743, 1, 0, 0.5568628, 1,
1.299728, -0.1909936, 1.602388, 1, 0, 0.5529412, 1,
1.308033, -0.3529997, 3.00043, 1, 0, 0.5450981, 1,
1.309395, 0.4074035, 1.758795, 1, 0, 0.5411765, 1,
1.320403, -1.078007, 3.084107, 1, 0, 0.5333334, 1,
1.323953, 0.1715298, 2.236646, 1, 0, 0.5294118, 1,
1.334113, 0.8554925, 1.68267, 1, 0, 0.5215687, 1,
1.340865, -1.632182, 2.020458, 1, 0, 0.5176471, 1,
1.342615, -0.5303702, 2.501353, 1, 0, 0.509804, 1,
1.350414, -0.491356, 0.6500331, 1, 0, 0.5058824, 1,
1.355307, 0.8283949, 0.4525207, 1, 0, 0.4980392, 1,
1.356679, -1.076493, 0.4811192, 1, 0, 0.4901961, 1,
1.364609, -0.184276, 2.238631, 1, 0, 0.4862745, 1,
1.370011, -0.5383895, 2.920628, 1, 0, 0.4784314, 1,
1.37741, -1.103427, 1.961615, 1, 0, 0.4745098, 1,
1.382562, -1.041946, 3.588646, 1, 0, 0.4666667, 1,
1.382857, -0.7539234, 1.738482, 1, 0, 0.4627451, 1,
1.392482, 0.04334106, 1.541923, 1, 0, 0.454902, 1,
1.394121, 0.04655457, 0.165324, 1, 0, 0.4509804, 1,
1.402426, 0.2856857, -0.4028829, 1, 0, 0.4431373, 1,
1.414519, 0.9457676, 0.282735, 1, 0, 0.4392157, 1,
1.415046, -0.9177428, 3.720157, 1, 0, 0.4313726, 1,
1.419934, 0.3109071, 1.597105, 1, 0, 0.427451, 1,
1.425077, 0.6085743, 2.018778, 1, 0, 0.4196078, 1,
1.429089, 0.08054015, 1.404854, 1, 0, 0.4156863, 1,
1.434692, -0.8004965, 3.557106, 1, 0, 0.4078431, 1,
1.439757, 0.2430882, 1.077369, 1, 0, 0.4039216, 1,
1.446214, -0.5502438, 1.934072, 1, 0, 0.3960784, 1,
1.480324, -0.5033924, 1.401938, 1, 0, 0.3882353, 1,
1.480579, 2.228538, -2.185214, 1, 0, 0.3843137, 1,
1.483258, -0.934728, 1.362428, 1, 0, 0.3764706, 1,
1.489329, -0.7518019, 2.445095, 1, 0, 0.372549, 1,
1.493362, 0.1056428, -1.096758, 1, 0, 0.3647059, 1,
1.504594, -0.1732828, 1.675825, 1, 0, 0.3607843, 1,
1.506063, 1.666794, 3.077725, 1, 0, 0.3529412, 1,
1.510207, -1.419791, 3.754006, 1, 0, 0.3490196, 1,
1.514103, 2.105548, 1.440726, 1, 0, 0.3411765, 1,
1.514119, -1.709316, 1.260039, 1, 0, 0.3372549, 1,
1.517022, -0.7037572, -0.2008943, 1, 0, 0.3294118, 1,
1.517686, 0.3582394, 1.957504, 1, 0, 0.3254902, 1,
1.55088, -0.6983917, 1.515176, 1, 0, 0.3176471, 1,
1.551031, 0.190097, 2.571426, 1, 0, 0.3137255, 1,
1.557279, -0.7106121, 1.724486, 1, 0, 0.3058824, 1,
1.563088, -0.4011859, 2.211405, 1, 0, 0.2980392, 1,
1.570791, -0.001448486, 2.543583, 1, 0, 0.2941177, 1,
1.571527, -1.368227, 1.727391, 1, 0, 0.2862745, 1,
1.598066, 0.190019, -1.260627, 1, 0, 0.282353, 1,
1.605409, -1.107572, 2.593895, 1, 0, 0.2745098, 1,
1.618031, -0.2197973, 3.099452, 1, 0, 0.2705882, 1,
1.650093, 0.8270249, 1.696302, 1, 0, 0.2627451, 1,
1.651262, -0.4913999, 3.785774, 1, 0, 0.2588235, 1,
1.657755, 1.14576, 0.3759101, 1, 0, 0.2509804, 1,
1.685989, -1.012656, 2.632582, 1, 0, 0.2470588, 1,
1.686117, -0.2571078, -0.749361, 1, 0, 0.2392157, 1,
1.6926, -1.095012, 2.083991, 1, 0, 0.2352941, 1,
1.696688, 0.3342972, 2.136324, 1, 0, 0.227451, 1,
1.701999, 0.7190213, -0.1034607, 1, 0, 0.2235294, 1,
1.707407, -0.7291995, 3.329449, 1, 0, 0.2156863, 1,
1.707416, 0.8574802, -0.004359873, 1, 0, 0.2117647, 1,
1.715968, 1.102529, 0.3309134, 1, 0, 0.2039216, 1,
1.758873, 0.002587963, 1.901751, 1, 0, 0.1960784, 1,
1.778938, -0.868288, 3.260054, 1, 0, 0.1921569, 1,
1.794269, -0.2641715, 3.829916, 1, 0, 0.1843137, 1,
1.795325, 8.039572e-05, 0.07494764, 1, 0, 0.1803922, 1,
1.802743, -0.6663702, 1.504448, 1, 0, 0.172549, 1,
1.808344, -1.151479, -0.3437561, 1, 0, 0.1686275, 1,
1.809453, 1.674221, -0.5236593, 1, 0, 0.1607843, 1,
1.823059, -0.5415654, 2.714908, 1, 0, 0.1568628, 1,
1.831685, 0.4212877, 2.449584, 1, 0, 0.1490196, 1,
1.839699, 0.6002516, 3.129952, 1, 0, 0.145098, 1,
1.843593, 0.1154628, -0.7389771, 1, 0, 0.1372549, 1,
1.860165, 0.4628305, 1.828178, 1, 0, 0.1333333, 1,
1.872639, -0.767292, 2.323492, 1, 0, 0.1254902, 1,
1.89557, 0.3714806, 0.3225779, 1, 0, 0.1215686, 1,
1.897753, -0.00427706, 1.132096, 1, 0, 0.1137255, 1,
1.946522, -0.7234712, 0.04666863, 1, 0, 0.1098039, 1,
1.96838, 0.6568643, 0.9825176, 1, 0, 0.1019608, 1,
1.973632, -0.6114346, 2.575816, 1, 0, 0.09411765, 1,
1.973761, 0.4680687, 1.739613, 1, 0, 0.09019608, 1,
1.975022, 1.509817, 0.1515542, 1, 0, 0.08235294, 1,
1.999024, 1.753912, 1.264587, 1, 0, 0.07843138, 1,
2.048884, -0.7880057, 2.581893, 1, 0, 0.07058824, 1,
2.102532, -0.9783581, 1.757191, 1, 0, 0.06666667, 1,
2.117629, 0.796638, 2.410734, 1, 0, 0.05882353, 1,
2.132613, -1.668324, 2.205963, 1, 0, 0.05490196, 1,
2.161988, -1.379293, 0.9396192, 1, 0, 0.04705882, 1,
2.303257, 0.5655993, 2.068584, 1, 0, 0.04313726, 1,
2.330072, 0.4581708, -1.034673, 1, 0, 0.03529412, 1,
2.33626, -1.100128, -0.3951809, 1, 0, 0.03137255, 1,
2.473596, -0.1331917, 3.023444, 1, 0, 0.02352941, 1,
2.51728, 0.373249, -0.2220328, 1, 0, 0.01960784, 1,
2.796978, -1.189922, -0.1802652, 1, 0, 0.01176471, 1,
3.161165, -1.093112, 2.29779, 1, 0, 0.007843138, 1
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
-0.4709121, -4.514139, -7.332165, 0, -0.5, 0.5, 0.5,
-0.4709121, -4.514139, -7.332165, 1, -0.5, 0.5, 0.5,
-0.4709121, -4.514139, -7.332165, 1, 1.5, 0.5, 0.5,
-0.4709121, -4.514139, -7.332165, 0, 1.5, 0.5, 0.5
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
-5.334263, 0.01466906, -7.332165, 0, -0.5, 0.5, 0.5,
-5.334263, 0.01466906, -7.332165, 1, -0.5, 0.5, 0.5,
-5.334263, 0.01466906, -7.332165, 1, 1.5, 0.5, 0.5,
-5.334263, 0.01466906, -7.332165, 0, 1.5, 0.5, 0.5
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
-5.334263, -4.514139, 0.3284004, 0, -0.5, 0.5, 0.5,
-5.334263, -4.514139, 0.3284004, 1, -0.5, 0.5, 0.5,
-5.334263, -4.514139, 0.3284004, 1, 1.5, 0.5, 0.5,
-5.334263, -4.514139, 0.3284004, 0, 1.5, 0.5, 0.5
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
-4, -3.46903, -5.564342,
2, -3.46903, -5.564342,
-4, -3.46903, -5.564342,
-4, -3.643215, -5.85898,
-2, -3.46903, -5.564342,
-2, -3.643215, -5.85898,
0, -3.46903, -5.564342,
0, -3.643215, -5.85898,
2, -3.46903, -5.564342,
2, -3.643215, -5.85898
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
-4, -3.991585, -6.448254, 0, -0.5, 0.5, 0.5,
-4, -3.991585, -6.448254, 1, -0.5, 0.5, 0.5,
-4, -3.991585, -6.448254, 1, 1.5, 0.5, 0.5,
-4, -3.991585, -6.448254, 0, 1.5, 0.5, 0.5,
-2, -3.991585, -6.448254, 0, -0.5, 0.5, 0.5,
-2, -3.991585, -6.448254, 1, -0.5, 0.5, 0.5,
-2, -3.991585, -6.448254, 1, 1.5, 0.5, 0.5,
-2, -3.991585, -6.448254, 0, 1.5, 0.5, 0.5,
0, -3.991585, -6.448254, 0, -0.5, 0.5, 0.5,
0, -3.991585, -6.448254, 1, -0.5, 0.5, 0.5,
0, -3.991585, -6.448254, 1, 1.5, 0.5, 0.5,
0, -3.991585, -6.448254, 0, 1.5, 0.5, 0.5,
2, -3.991585, -6.448254, 0, -0.5, 0.5, 0.5,
2, -3.991585, -6.448254, 1, -0.5, 0.5, 0.5,
2, -3.991585, -6.448254, 1, 1.5, 0.5, 0.5,
2, -3.991585, -6.448254, 0, 1.5, 0.5, 0.5
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
-4.211952, -3, -5.564342,
-4.211952, 3, -5.564342,
-4.211952, -3, -5.564342,
-4.399004, -3, -5.85898,
-4.211952, -2, -5.564342,
-4.399004, -2, -5.85898,
-4.211952, -1, -5.564342,
-4.399004, -1, -5.85898,
-4.211952, 0, -5.564342,
-4.399004, 0, -5.85898,
-4.211952, 1, -5.564342,
-4.399004, 1, -5.85898,
-4.211952, 2, -5.564342,
-4.399004, 2, -5.85898,
-4.211952, 3, -5.564342,
-4.399004, 3, -5.85898
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
-4.773108, -3, -6.448254, 0, -0.5, 0.5, 0.5,
-4.773108, -3, -6.448254, 1, -0.5, 0.5, 0.5,
-4.773108, -3, -6.448254, 1, 1.5, 0.5, 0.5,
-4.773108, -3, -6.448254, 0, 1.5, 0.5, 0.5,
-4.773108, -2, -6.448254, 0, -0.5, 0.5, 0.5,
-4.773108, -2, -6.448254, 1, -0.5, 0.5, 0.5,
-4.773108, -2, -6.448254, 1, 1.5, 0.5, 0.5,
-4.773108, -2, -6.448254, 0, 1.5, 0.5, 0.5,
-4.773108, -1, -6.448254, 0, -0.5, 0.5, 0.5,
-4.773108, -1, -6.448254, 1, -0.5, 0.5, 0.5,
-4.773108, -1, -6.448254, 1, 1.5, 0.5, 0.5,
-4.773108, -1, -6.448254, 0, 1.5, 0.5, 0.5,
-4.773108, 0, -6.448254, 0, -0.5, 0.5, 0.5,
-4.773108, 0, -6.448254, 1, -0.5, 0.5, 0.5,
-4.773108, 0, -6.448254, 1, 1.5, 0.5, 0.5,
-4.773108, 0, -6.448254, 0, 1.5, 0.5, 0.5,
-4.773108, 1, -6.448254, 0, -0.5, 0.5, 0.5,
-4.773108, 1, -6.448254, 1, -0.5, 0.5, 0.5,
-4.773108, 1, -6.448254, 1, 1.5, 0.5, 0.5,
-4.773108, 1, -6.448254, 0, 1.5, 0.5, 0.5,
-4.773108, 2, -6.448254, 0, -0.5, 0.5, 0.5,
-4.773108, 2, -6.448254, 1, -0.5, 0.5, 0.5,
-4.773108, 2, -6.448254, 1, 1.5, 0.5, 0.5,
-4.773108, 2, -6.448254, 0, 1.5, 0.5, 0.5,
-4.773108, 3, -6.448254, 0, -0.5, 0.5, 0.5,
-4.773108, 3, -6.448254, 1, -0.5, 0.5, 0.5,
-4.773108, 3, -6.448254, 1, 1.5, 0.5, 0.5,
-4.773108, 3, -6.448254, 0, 1.5, 0.5, 0.5
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
-4.211952, -3.46903, -4,
-4.211952, -3.46903, 6,
-4.211952, -3.46903, -4,
-4.399004, -3.643215, -4,
-4.211952, -3.46903, -2,
-4.399004, -3.643215, -2,
-4.211952, -3.46903, 0,
-4.399004, -3.643215, 0,
-4.211952, -3.46903, 2,
-4.399004, -3.643215, 2,
-4.211952, -3.46903, 4,
-4.399004, -3.643215, 4,
-4.211952, -3.46903, 6,
-4.399004, -3.643215, 6
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
-4.773108, -3.991585, -4, 0, -0.5, 0.5, 0.5,
-4.773108, -3.991585, -4, 1, -0.5, 0.5, 0.5,
-4.773108, -3.991585, -4, 1, 1.5, 0.5, 0.5,
-4.773108, -3.991585, -4, 0, 1.5, 0.5, 0.5,
-4.773108, -3.991585, -2, 0, -0.5, 0.5, 0.5,
-4.773108, -3.991585, -2, 1, -0.5, 0.5, 0.5,
-4.773108, -3.991585, -2, 1, 1.5, 0.5, 0.5,
-4.773108, -3.991585, -2, 0, 1.5, 0.5, 0.5,
-4.773108, -3.991585, 0, 0, -0.5, 0.5, 0.5,
-4.773108, -3.991585, 0, 1, -0.5, 0.5, 0.5,
-4.773108, -3.991585, 0, 1, 1.5, 0.5, 0.5,
-4.773108, -3.991585, 0, 0, 1.5, 0.5, 0.5,
-4.773108, -3.991585, 2, 0, -0.5, 0.5, 0.5,
-4.773108, -3.991585, 2, 1, -0.5, 0.5, 0.5,
-4.773108, -3.991585, 2, 1, 1.5, 0.5, 0.5,
-4.773108, -3.991585, 2, 0, 1.5, 0.5, 0.5,
-4.773108, -3.991585, 4, 0, -0.5, 0.5, 0.5,
-4.773108, -3.991585, 4, 1, -0.5, 0.5, 0.5,
-4.773108, -3.991585, 4, 1, 1.5, 0.5, 0.5,
-4.773108, -3.991585, 4, 0, 1.5, 0.5, 0.5,
-4.773108, -3.991585, 6, 0, -0.5, 0.5, 0.5,
-4.773108, -3.991585, 6, 1, -0.5, 0.5, 0.5,
-4.773108, -3.991585, 6, 1, 1.5, 0.5, 0.5,
-4.773108, -3.991585, 6, 0, 1.5, 0.5, 0.5
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
-4.211952, -3.46903, -5.564342,
-4.211952, 3.498368, -5.564342,
-4.211952, -3.46903, 6.221143,
-4.211952, 3.498368, 6.221143,
-4.211952, -3.46903, -5.564342,
-4.211952, -3.46903, 6.221143,
-4.211952, 3.498368, -5.564342,
-4.211952, 3.498368, 6.221143,
-4.211952, -3.46903, -5.564342,
3.270127, -3.46903, -5.564342,
-4.211952, -3.46903, 6.221143,
3.270127, -3.46903, 6.221143,
-4.211952, 3.498368, -5.564342,
3.270127, 3.498368, -5.564342,
-4.211952, 3.498368, 6.221143,
3.270127, 3.498368, 6.221143,
3.270127, -3.46903, -5.564342,
3.270127, 3.498368, -5.564342,
3.270127, -3.46903, 6.221143,
3.270127, 3.498368, 6.221143,
3.270127, -3.46903, -5.564342,
3.270127, -3.46903, 6.221143,
3.270127, 3.498368, -5.564342,
3.270127, 3.498368, 6.221143
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
var radius = 8.331189;
var distance = 37.0664;
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
mvMatrix.translate( 0.4709121, -0.01466906, -0.3284004 );
mvMatrix.scale( 1.203923, 1.292856, 0.7643168 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.0664);
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
thiourea<-read.table("thiourea.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiourea$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiourea' not found
```

```r
y<-thiourea$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiourea' not found
```

```r
z<-thiourea$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiourea' not found
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
-4.102989, -0.8011358, 0.8456966, 0, 0, 1, 1, 1,
-2.804843, -0.20623, -1.474959, 1, 0, 0, 1, 1,
-2.793325, -1.251489, -1.469592, 1, 0, 0, 1, 1,
-2.622992, 0.581458, -2.0161, 1, 0, 0, 1, 1,
-2.583337, -1.360351, -3.090151, 1, 0, 0, 1, 1,
-2.534455, 0.7407296, -0.4103964, 1, 0, 0, 1, 1,
-2.458354, 0.1422431, -0.9343131, 0, 0, 0, 1, 1,
-2.436686, -0.5010946, -3.339304, 0, 0, 0, 1, 1,
-2.343568, 0.3116146, -1.156477, 0, 0, 0, 1, 1,
-2.326486, 0.1188188, -0.7539462, 0, 0, 0, 1, 1,
-2.310674, 2.406093, -1.160264, 0, 0, 0, 1, 1,
-2.307605, -0.09425621, -0.5615258, 0, 0, 0, 1, 1,
-2.258212, 2.478769, -0.1715148, 0, 0, 0, 1, 1,
-2.243326, 1.176487, -0.1630033, 1, 1, 1, 1, 1,
-2.206112, 0.3142848, -0.4748106, 1, 1, 1, 1, 1,
-2.184247, 0.9535806, -1.146926, 1, 1, 1, 1, 1,
-2.134994, -1.053586, 0.01037605, 1, 1, 1, 1, 1,
-2.128519, -2.552181, -1.86051, 1, 1, 1, 1, 1,
-2.097637, -1.294489, -2.027436, 1, 1, 1, 1, 1,
-2.093774, -0.1845098, 0.02493909, 1, 1, 1, 1, 1,
-2.074153, -0.06170851, -1.217566, 1, 1, 1, 1, 1,
-2.059719, 0.959356, 0.7455283, 1, 1, 1, 1, 1,
-2.029359, -0.03594915, -0.9140409, 1, 1, 1, 1, 1,
-2.027748, -0.8892282, -2.893184, 1, 1, 1, 1, 1,
-1.932312, 0.1259099, -2.055825, 1, 1, 1, 1, 1,
-1.918549, -0.5337256, -3.184326, 1, 1, 1, 1, 1,
-1.916457, 0.8999236, -0.6140822, 1, 1, 1, 1, 1,
-1.906745, 0.06491301, -2.981999, 1, 1, 1, 1, 1,
-1.903788, -1.955243, -1.065736, 0, 0, 1, 1, 1,
-1.899518, 0.3667732, -2.243568, 1, 0, 0, 1, 1,
-1.887331, -0.03947938, -2.287114, 1, 0, 0, 1, 1,
-1.84863, -0.1917895, -0.1660602, 1, 0, 0, 1, 1,
-1.824374, -1.583439, -1.626492, 1, 0, 0, 1, 1,
-1.810797, -2.017865, -3.816638, 1, 0, 0, 1, 1,
-1.806922, -0.8961338, -1.786779, 0, 0, 0, 1, 1,
-1.803528, -0.4367945, -2.274618, 0, 0, 0, 1, 1,
-1.797625, 0.9134164, -1.574484, 0, 0, 0, 1, 1,
-1.796978, -1.247209, -2.343793, 0, 0, 0, 1, 1,
-1.780418, 0.1038249, -0.7978808, 0, 0, 0, 1, 1,
-1.773931, 0.7776588, -1.152452, 0, 0, 0, 1, 1,
-1.766138, -1.494879, -2.528968, 0, 0, 0, 1, 1,
-1.748571, -0.3745536, -2.953383, 1, 1, 1, 1, 1,
-1.739915, -0.0826969, -2.698857, 1, 1, 1, 1, 1,
-1.735901, -0.1181317, -3.134143, 1, 1, 1, 1, 1,
-1.704539, -0.3617446, -3.470542, 1, 1, 1, 1, 1,
-1.702932, 1.224076, -1.178632, 1, 1, 1, 1, 1,
-1.696426, -0.1574197, -0.8540344, 1, 1, 1, 1, 1,
-1.689278, 2.504741, -0.7129152, 1, 1, 1, 1, 1,
-1.684349, 0.6543353, -1.403432, 1, 1, 1, 1, 1,
-1.676066, -0.5906883, -2.860514, 1, 1, 1, 1, 1,
-1.674098, -0.112867, -0.2404662, 1, 1, 1, 1, 1,
-1.670209, -0.1116677, -1.848925, 1, 1, 1, 1, 1,
-1.669161, 0.07770233, -0.9090174, 1, 1, 1, 1, 1,
-1.649134, -0.1203467, -0.896664, 1, 1, 1, 1, 1,
-1.647684, 1.857538, 0.2144051, 1, 1, 1, 1, 1,
-1.634006, -1.180693, -2.162323, 1, 1, 1, 1, 1,
-1.622204, 0.6008178, -1.627461, 0, 0, 1, 1, 1,
-1.615488, 0.1070665, -0.003255891, 1, 0, 0, 1, 1,
-1.607088, -0.2885118, -0.9250154, 1, 0, 0, 1, 1,
-1.606123, -0.02636253, -1.541681, 1, 0, 0, 1, 1,
-1.60428, 1.085858, -0.8203791, 1, 0, 0, 1, 1,
-1.587523, -0.3571788, -1.591299, 1, 0, 0, 1, 1,
-1.576879, 0.3130483, -1.649398, 0, 0, 0, 1, 1,
-1.555174, -0.370561, -2.22766, 0, 0, 0, 1, 1,
-1.545832, 0.8417276, -0.9470652, 0, 0, 0, 1, 1,
-1.541225, 1.127377, -1.053605, 0, 0, 0, 1, 1,
-1.538383, -0.03711398, -0.3411889, 0, 0, 0, 1, 1,
-1.531957, -1.583874, -1.822998, 0, 0, 0, 1, 1,
-1.52437, -0.4519403, -0.4883976, 0, 0, 0, 1, 1,
-1.514384, -0.9466074, 0.05142644, 1, 1, 1, 1, 1,
-1.508479, 1.239598, -0.183547, 1, 1, 1, 1, 1,
-1.467407, 0.1564472, -2.315363, 1, 1, 1, 1, 1,
-1.465734, 1.713455, 0.2066526, 1, 1, 1, 1, 1,
-1.465472, -1.830075, -2.043476, 1, 1, 1, 1, 1,
-1.465212, -0.4049525, -1.20874, 1, 1, 1, 1, 1,
-1.459235, 0.5446161, -1.561716, 1, 1, 1, 1, 1,
-1.438161, -0.4609451, -3.116725, 1, 1, 1, 1, 1,
-1.436733, 1.477593, -1.045435, 1, 1, 1, 1, 1,
-1.418521, 0.2753431, -0.9239601, 1, 1, 1, 1, 1,
-1.411711, 0.05300808, -2.463553, 1, 1, 1, 1, 1,
-1.41069, -0.600544, -4.077734, 1, 1, 1, 1, 1,
-1.39978, -0.5227906, -0.9851521, 1, 1, 1, 1, 1,
-1.390563, 0.8591089, -0.933314, 1, 1, 1, 1, 1,
-1.380055, -0.09459183, -0.5635818, 1, 1, 1, 1, 1,
-1.376587, 0.6598712, 0.1916654, 0, 0, 1, 1, 1,
-1.374199, -0.8095825, -1.850131, 1, 0, 0, 1, 1,
-1.373349, 0.09505316, -1.461048, 1, 0, 0, 1, 1,
-1.369727, -0.6536257, -1.025817, 1, 0, 0, 1, 1,
-1.368491, -0.8506643, -1.376608, 1, 0, 0, 1, 1,
-1.362527, 0.3325239, -0.3749259, 1, 0, 0, 1, 1,
-1.347777, 0.3511986, -1.510711, 0, 0, 0, 1, 1,
-1.343523, -0.7868468, -2.112454, 0, 0, 0, 1, 1,
-1.341164, -0.6018288, -2.848935, 0, 0, 0, 1, 1,
-1.338257, 0.5728225, -0.9221789, 0, 0, 0, 1, 1,
-1.331908, -0.07781008, -2.679704, 0, 0, 0, 1, 1,
-1.318976, -0.8367714, -2.040643, 0, 0, 0, 1, 1,
-1.309267, -0.7418872, -1.685816, 0, 0, 0, 1, 1,
-1.306529, -2.152367, -2.231773, 1, 1, 1, 1, 1,
-1.301728, -0.7019801, -3.193444, 1, 1, 1, 1, 1,
-1.297388, -1.55211, -3.616583, 1, 1, 1, 1, 1,
-1.29392, -0.4218174, -1.390962, 1, 1, 1, 1, 1,
-1.291767, -2.220257, -3.335862, 1, 1, 1, 1, 1,
-1.291232, 1.564834, -1.912484, 1, 1, 1, 1, 1,
-1.291174, -1.504841, -1.017328, 1, 1, 1, 1, 1,
-1.284745, 1.887085, -0.479608, 1, 1, 1, 1, 1,
-1.271406, -0.4539309, -1.751283, 1, 1, 1, 1, 1,
-1.265471, -0.9108623, -4.065841, 1, 1, 1, 1, 1,
-1.263573, 0.5352116, -1.047229, 1, 1, 1, 1, 1,
-1.26291, -1.54177, -3.847048, 1, 1, 1, 1, 1,
-1.253988, 1.04012, -0.9504236, 1, 1, 1, 1, 1,
-1.25334, -1.271764, -2.048193, 1, 1, 1, 1, 1,
-1.240504, -0.4119536, 0.2171173, 1, 1, 1, 1, 1,
-1.235913, -0.6427389, -3.24085, 0, 0, 1, 1, 1,
-1.224567, -1.83412, -0.5246379, 1, 0, 0, 1, 1,
-1.224186, 0.7644022, 0.7417983, 1, 0, 0, 1, 1,
-1.21088, -1.577755, -2.138921, 1, 0, 0, 1, 1,
-1.20874, 0.1525939, -2.42192, 1, 0, 0, 1, 1,
-1.20032, -0.4962003, -2.147404, 1, 0, 0, 1, 1,
-1.190858, -1.384011, -2.652283, 0, 0, 0, 1, 1,
-1.190403, -0.9950266, -1.437698, 0, 0, 0, 1, 1,
-1.185923, 0.1784386, -1.247255, 0, 0, 0, 1, 1,
-1.185851, -0.2902943, -3.501698, 0, 0, 0, 1, 1,
-1.176488, -1.570371, -1.751499, 0, 0, 0, 1, 1,
-1.175776, 0.1526962, -0.7163751, 0, 0, 0, 1, 1,
-1.171197, 0.08301227, -1.590035, 0, 0, 0, 1, 1,
-1.169791, 1.017271, -0.06258009, 1, 1, 1, 1, 1,
-1.168459, 1.029526, -0.7220051, 1, 1, 1, 1, 1,
-1.168308, 0.3339474, -2.469113, 1, 1, 1, 1, 1,
-1.162244, 0.5707727, 0.5680666, 1, 1, 1, 1, 1,
-1.138651, -0.4835396, -3.019609, 1, 1, 1, 1, 1,
-1.120637, 0.261155, -2.60742, 1, 1, 1, 1, 1,
-1.119958, -0.003770612, -0.4082103, 1, 1, 1, 1, 1,
-1.119429, 2.664232, -0.6513966, 1, 1, 1, 1, 1,
-1.117966, -1.447359, -4.609871, 1, 1, 1, 1, 1,
-1.114133, -2.726867, -3.278206, 1, 1, 1, 1, 1,
-1.106647, 0.08261656, -1.317966, 1, 1, 1, 1, 1,
-1.09541, -1.237401, -2.938426, 1, 1, 1, 1, 1,
-1.095002, -1.106041, -3.137089, 1, 1, 1, 1, 1,
-1.090855, 1.363695, 0.5821341, 1, 1, 1, 1, 1,
-1.090532, -1.060105, -1.917689, 1, 1, 1, 1, 1,
-1.08424, 0.3098696, -1.422315, 0, 0, 1, 1, 1,
-1.075579, 0.3633794, -2.086302, 1, 0, 0, 1, 1,
-1.073789, 0.06847795, -1.664793, 1, 0, 0, 1, 1,
-1.072999, 1.064987, -1.534031, 1, 0, 0, 1, 1,
-1.06299, -0.7007617, -2.794401, 1, 0, 0, 1, 1,
-1.053971, 0.20851, -0.09244836, 1, 0, 0, 1, 1,
-1.033181, 1.615156, -0.9279831, 0, 0, 0, 1, 1,
-1.032526, -0.08529586, -1.926034, 0, 0, 0, 1, 1,
-1.028882, -0.3096516, -2.726032, 0, 0, 0, 1, 1,
-1.026406, 0.03932237, -2.768222, 0, 0, 0, 1, 1,
-1.026018, -0.9606088, -1.002133, 0, 0, 0, 1, 1,
-1.02601, -0.2762249, -2.022757, 0, 0, 0, 1, 1,
-1.024622, -0.4255541, -1.681279, 0, 0, 0, 1, 1,
-1.022594, 0.3340452, -0.4497549, 1, 1, 1, 1, 1,
-1.014772, 1.083078, -0.1097553, 1, 1, 1, 1, 1,
-1.008189, -0.02228377, -0.4223328, 1, 1, 1, 1, 1,
-1.006616, -0.9798946, -2.830379, 1, 1, 1, 1, 1,
-1.003451, -0.8821968, -2.839924, 1, 1, 1, 1, 1,
-1.000949, 1.029054, -1.84893, 1, 1, 1, 1, 1,
-0.9887237, -0.1742421, -2.209171, 1, 1, 1, 1, 1,
-0.9884576, -0.4110686, -2.854069, 1, 1, 1, 1, 1,
-0.9849755, -0.9138577, -4.362149, 1, 1, 1, 1, 1,
-0.9829066, 0.995546, -0.1086761, 1, 1, 1, 1, 1,
-0.9805481, -0.5453824, -2.297363, 1, 1, 1, 1, 1,
-0.9795741, -0.4983149, -2.658994, 1, 1, 1, 1, 1,
-0.9603202, -2.294969, -1.497487, 1, 1, 1, 1, 1,
-0.9568564, -0.2860506, -1.030503, 1, 1, 1, 1, 1,
-0.9551578, 1.429128, -0.06511411, 1, 1, 1, 1, 1,
-0.9501598, -0.8835271, -2.302403, 0, 0, 1, 1, 1,
-0.9473096, -1.856924, -3.287569, 1, 0, 0, 1, 1,
-0.9433865, 0.8931704, -1.092978, 1, 0, 0, 1, 1,
-0.9419912, 0.312571, -0.7682821, 1, 0, 0, 1, 1,
-0.9417078, -1.074874, -3.765515, 1, 0, 0, 1, 1,
-0.941533, -1.526173, -2.5484, 1, 0, 0, 1, 1,
-0.9361941, 1.506127, -0.4802618, 0, 0, 0, 1, 1,
-0.9354457, -0.6584371, -2.009748, 0, 0, 0, 1, 1,
-0.9341372, -0.85319, -2.475147, 0, 0, 0, 1, 1,
-0.9308119, 0.8923586, 0.1843706, 0, 0, 0, 1, 1,
-0.9265766, 1.51583, 1.871539, 0, 0, 0, 1, 1,
-0.9249209, -0.4080568, -2.159739, 0, 0, 0, 1, 1,
-0.9210881, -0.4900632, -2.344738, 0, 0, 0, 1, 1,
-0.917272, 0.6035644, 1.399789, 1, 1, 1, 1, 1,
-0.91342, 1.159199, -0.5482751, 1, 1, 1, 1, 1,
-0.9133097, -0.4873115, -2.663699, 1, 1, 1, 1, 1,
-0.909895, 1.196491, -0.8408681, 1, 1, 1, 1, 1,
-0.9032024, -0.4311841, -2.275749, 1, 1, 1, 1, 1,
-0.8914571, 1.943456, -1.164548, 1, 1, 1, 1, 1,
-0.8860582, -0.08083252, -1.062754, 1, 1, 1, 1, 1,
-0.882158, 0.2283809, -0.9332844, 1, 1, 1, 1, 1,
-0.8803039, 1.874272, -0.1759488, 1, 1, 1, 1, 1,
-0.8796132, 0.559922, 0.6504288, 1, 1, 1, 1, 1,
-0.8791617, 1.998815, -1.65836, 1, 1, 1, 1, 1,
-0.8782381, -1.093342, -3.183683, 1, 1, 1, 1, 1,
-0.8749576, -0.9397176, -3.782027, 1, 1, 1, 1, 1,
-0.8725879, 0.6008015, -0.9893141, 1, 1, 1, 1, 1,
-0.8719759, -2.61936, -3.395001, 1, 1, 1, 1, 1,
-0.8716733, 0.6641944, -0.5238009, 0, 0, 1, 1, 1,
-0.8713924, 0.2539609, -1.673339, 1, 0, 0, 1, 1,
-0.8697369, 1.364733, -1.13948, 1, 0, 0, 1, 1,
-0.8631314, -1.277672, -2.50585, 1, 0, 0, 1, 1,
-0.8583483, 1.732263, -0.04056451, 1, 0, 0, 1, 1,
-0.856906, 1.983077, -0.7677638, 1, 0, 0, 1, 1,
-0.8512562, 1.328545, -0.9862036, 0, 0, 0, 1, 1,
-0.8375364, 1.598879, -1.42617, 0, 0, 0, 1, 1,
-0.8333349, -1.178482, -1.607067, 0, 0, 0, 1, 1,
-0.8173305, 1.087031, 1.137645, 0, 0, 0, 1, 1,
-0.8148257, -0.4141408, -2.823539, 0, 0, 0, 1, 1,
-0.8119566, -1.209106, -1.927449, 0, 0, 0, 1, 1,
-0.8118026, 0.7202782, -0.9350339, 0, 0, 0, 1, 1,
-0.8042635, 0.4174013, 0.8342253, 1, 1, 1, 1, 1,
-0.7957138, 0.5887479, -0.2224594, 1, 1, 1, 1, 1,
-0.794509, -1.856158, -1.811914, 1, 1, 1, 1, 1,
-0.7914815, 1.042741, 0.7595544, 1, 1, 1, 1, 1,
-0.7910956, 0.7144294, -0.4123947, 1, 1, 1, 1, 1,
-0.7883929, 0.2606241, -0.3095972, 1, 1, 1, 1, 1,
-0.7828398, -0.767797, -1.244523, 1, 1, 1, 1, 1,
-0.7705747, 0.5488504, -0.5292478, 1, 1, 1, 1, 1,
-0.7585454, -1.335639, -5.392709, 1, 1, 1, 1, 1,
-0.7572928, -0.3688878, -0.4937074, 1, 1, 1, 1, 1,
-0.7538301, 1.74266, -0.1352524, 1, 1, 1, 1, 1,
-0.7531621, -0.5673768, -1.396173, 1, 1, 1, 1, 1,
-0.749137, 1.625528, 0.7679666, 1, 1, 1, 1, 1,
-0.7489457, 1.543769, 0.1298233, 1, 1, 1, 1, 1,
-0.7446011, -0.1776097, -1.875404, 1, 1, 1, 1, 1,
-0.7404216, 0.3175288, -1.807637, 0, 0, 1, 1, 1,
-0.738952, -0.2118671, -4.170342, 1, 0, 0, 1, 1,
-0.7377604, 0.2107149, -1.881899, 1, 0, 0, 1, 1,
-0.7362093, 0.2726574, -0.6878994, 1, 0, 0, 1, 1,
-0.7348344, -0.6152239, -2.041481, 1, 0, 0, 1, 1,
-0.7320926, 0.3781945, -1.510695, 1, 0, 0, 1, 1,
-0.7318667, 1.037724, 0.06202721, 0, 0, 0, 1, 1,
-0.7279167, 1.97275, -0.006466546, 0, 0, 0, 1, 1,
-0.7234919, -0.3414344, -0.8232881, 0, 0, 0, 1, 1,
-0.7234051, 0.8563508, -1.723328, 0, 0, 0, 1, 1,
-0.7210866, -0.2293743, -3.046447, 0, 0, 0, 1, 1,
-0.7210368, -0.07794555, -1.551309, 0, 0, 0, 1, 1,
-0.7182523, -0.2679097, -1.016334, 0, 0, 0, 1, 1,
-0.7151495, -0.1461428, -2.259541, 1, 1, 1, 1, 1,
-0.7094676, -0.5166259, -2.064764, 1, 1, 1, 1, 1,
-0.7072175, 1.965036, -0.2716236, 1, 1, 1, 1, 1,
-0.6989478, 0.6127572, -1.732013, 1, 1, 1, 1, 1,
-0.6972783, -0.6616263, -3.416343, 1, 1, 1, 1, 1,
-0.6956201, -0.02121699, -1.827446, 1, 1, 1, 1, 1,
-0.6947085, -0.930618, -3.360971, 1, 1, 1, 1, 1,
-0.6934096, -1.063283, -4.320124, 1, 1, 1, 1, 1,
-0.6923085, 0.6388453, 0.116962, 1, 1, 1, 1, 1,
-0.6911403, 2.172133, -0.1907832, 1, 1, 1, 1, 1,
-0.6849859, 0.1202669, -1.732532, 1, 1, 1, 1, 1,
-0.6845595, 0.5490748, 0.3907727, 1, 1, 1, 1, 1,
-0.6760849, 0.5558229, -0.4944008, 1, 1, 1, 1, 1,
-0.6719959, 1.558557, -0.3619856, 1, 1, 1, 1, 1,
-0.6697878, 0.7792287, 0.5679773, 1, 1, 1, 1, 1,
-0.6632998, 1.390947, -1.535359, 0, 0, 1, 1, 1,
-0.6605459, -0.2276646, -1.00786, 1, 0, 0, 1, 1,
-0.6590086, 0.9549215, -1.285913, 1, 0, 0, 1, 1,
-0.6512294, 0.2154207, -1.521063, 1, 0, 0, 1, 1,
-0.6504928, 0.5361226, -0.5746919, 1, 0, 0, 1, 1,
-0.6485447, 0.1185278, 0.4203956, 1, 0, 0, 1, 1,
-0.647251, -0.8485059, -1.530909, 0, 0, 0, 1, 1,
-0.6462502, -0.2000249, -2.205009, 0, 0, 0, 1, 1,
-0.6433209, -0.1939926, -1.508783, 0, 0, 0, 1, 1,
-0.6398946, 0.02010805, 0.7251021, 0, 0, 0, 1, 1,
-0.628993, -0.4398979, -1.326337, 0, 0, 0, 1, 1,
-0.6263023, -0.7460238, -2.698734, 0, 0, 0, 1, 1,
-0.6231607, -0.4100155, -2.871013, 0, 0, 0, 1, 1,
-0.6219248, -0.1733609, -1.587147, 1, 1, 1, 1, 1,
-0.6205508, 0.3647023, -1.03961, 1, 1, 1, 1, 1,
-0.6185601, 1.097897, -2.764914, 1, 1, 1, 1, 1,
-0.6182789, -2.156916, -2.014022, 1, 1, 1, 1, 1,
-0.6106352, 0.3174776, -2.467977, 1, 1, 1, 1, 1,
-0.610299, -1.194699, -3.06159, 1, 1, 1, 1, 1,
-0.6067693, -0.8581172, -1.117626, 1, 1, 1, 1, 1,
-0.6062855, -1.428537, -1.766235, 1, 1, 1, 1, 1,
-0.6054488, 1.201987, -0.8902899, 1, 1, 1, 1, 1,
-0.6037819, 2.476674, 0.3302494, 1, 1, 1, 1, 1,
-0.5983987, -0.4469702, -2.549492, 1, 1, 1, 1, 1,
-0.5952541, -0.8244609, -1.697502, 1, 1, 1, 1, 1,
-0.5890507, 0.1501986, -0.6377993, 1, 1, 1, 1, 1,
-0.58516, -0.07237758, -0.5140404, 1, 1, 1, 1, 1,
-0.5727853, 0.1068267, 0.4108112, 1, 1, 1, 1, 1,
-0.5687097, -1.055694, -1.989129, 0, 0, 1, 1, 1,
-0.5676814, -0.7067841, -3.011226, 1, 0, 0, 1, 1,
-0.5651073, 0.7322298, -0.8866254, 1, 0, 0, 1, 1,
-0.5642173, -0.6830713, -3.249721, 1, 0, 0, 1, 1,
-0.5615727, 0.7579817, -0.5534822, 1, 0, 0, 1, 1,
-0.5594157, 0.3949776, -0.6004477, 1, 0, 0, 1, 1,
-0.5487731, -1.073205, -1.305569, 0, 0, 0, 1, 1,
-0.545424, -1.412176, -3.688878, 0, 0, 0, 1, 1,
-0.5429329, 0.2006702, -0.9484004, 0, 0, 0, 1, 1,
-0.5428719, 3.396901, 0.2865714, 0, 0, 0, 1, 1,
-0.5425039, 0.530256, -0.1757455, 0, 0, 0, 1, 1,
-0.5420833, 0.2874787, -1.008039, 0, 0, 0, 1, 1,
-0.5416278, 0.7712341, -0.4253382, 0, 0, 0, 1, 1,
-0.5406395, -0.6520292, -3.041249, 1, 1, 1, 1, 1,
-0.5338711, 0.8943523, 0.4284455, 1, 1, 1, 1, 1,
-0.5335504, -1.314662, -2.76284, 1, 1, 1, 1, 1,
-0.5264952, 0.102978, -0.3015673, 1, 1, 1, 1, 1,
-0.5261018, 1.40828, -0.5875838, 1, 1, 1, 1, 1,
-0.5246375, -0.6527008, -3.267913, 1, 1, 1, 1, 1,
-0.5216376, 0.5451676, -2.380767, 1, 1, 1, 1, 1,
-0.5206202, -0.3809214, -0.7731548, 1, 1, 1, 1, 1,
-0.5141104, -0.3917383, -2.43989, 1, 1, 1, 1, 1,
-0.5140287, -0.6375916, -1.745572, 1, 1, 1, 1, 1,
-0.5133777, 0.2108981, -1.439322, 1, 1, 1, 1, 1,
-0.5083115, -0.06337108, -2.116464, 1, 1, 1, 1, 1,
-0.5063749, -0.1732572, -0.6647376, 1, 1, 1, 1, 1,
-0.5054979, -2.138091, -3.231685, 1, 1, 1, 1, 1,
-0.4956329, -1.313757, -3.680824, 1, 1, 1, 1, 1,
-0.4945925, -0.3056647, -3.002805, 0, 0, 1, 1, 1,
-0.4934695, 1.70863, -0.4485955, 1, 0, 0, 1, 1,
-0.4912395, -0.5679795, -3.169248, 1, 0, 0, 1, 1,
-0.4890466, -1.595123, -2.687681, 1, 0, 0, 1, 1,
-0.4865294, 0.9760128, 0.7620347, 1, 0, 0, 1, 1,
-0.4817192, -0.02603985, -1.511982, 1, 0, 0, 1, 1,
-0.4765121, -0.05110452, -1.669071, 0, 0, 0, 1, 1,
-0.4763263, 0.5990729, -0.3918475, 0, 0, 0, 1, 1,
-0.4725886, 0.345636, -0.8367871, 0, 0, 0, 1, 1,
-0.4700581, -0.2324742, -1.107137, 0, 0, 0, 1, 1,
-0.4699218, 0.8482466, 0.3137628, 0, 0, 0, 1, 1,
-0.4641512, 0.9380801, -1.121105, 0, 0, 0, 1, 1,
-0.4573224, -1.350957, -3.840909, 0, 0, 0, 1, 1,
-0.4550945, -0.9529865, -2.146423, 1, 1, 1, 1, 1,
-0.4537368, 0.1515292, -2.201955, 1, 1, 1, 1, 1,
-0.4500889, -0.7395421, -3.320892, 1, 1, 1, 1, 1,
-0.4490955, 0.7755362, 0.9238775, 1, 1, 1, 1, 1,
-0.4368856, -1.043277, -2.829828, 1, 1, 1, 1, 1,
-0.4351249, -0.02252035, -4.177306, 1, 1, 1, 1, 1,
-0.4303744, 0.351027, -1.095284, 1, 1, 1, 1, 1,
-0.4290828, -0.3209403, 0.1278376, 1, 1, 1, 1, 1,
-0.4270773, 1.297782, 0.5937948, 1, 1, 1, 1, 1,
-0.4237942, -1.256505, -4.227213, 1, 1, 1, 1, 1,
-0.42292, -0.3113605, -2.753935, 1, 1, 1, 1, 1,
-0.4154554, -1.051085, -1.085371, 1, 1, 1, 1, 1,
-0.4135994, -1.460472, -2.535271, 1, 1, 1, 1, 1,
-0.4112926, 2.140668, -1.884081, 1, 1, 1, 1, 1,
-0.4073774, 0.3461011, -1.601443, 1, 1, 1, 1, 1,
-0.4072753, -0.9757965, -1.003495, 0, 0, 1, 1, 1,
-0.4066704, 1.299358, 0.1006935, 1, 0, 0, 1, 1,
-0.4043331, -1.009923, -1.894542, 1, 0, 0, 1, 1,
-0.4025935, -0.7857851, -3.413474, 1, 0, 0, 1, 1,
-0.3886275, -1.146307, -3.647941, 1, 0, 0, 1, 1,
-0.3850238, -1.316462, -4.520583, 1, 0, 0, 1, 1,
-0.3789354, 0.05582909, -0.3057051, 0, 0, 0, 1, 1,
-0.3737978, -1.398135, -2.780104, 0, 0, 0, 1, 1,
-0.3695292, 0.9803635, -0.9718936, 0, 0, 0, 1, 1,
-0.3687858, -1.113613, -3.979414, 0, 0, 0, 1, 1,
-0.3685381, 0.8490518, -0.874726, 0, 0, 0, 1, 1,
-0.3674668, 1.524617, 0.3722759, 0, 0, 0, 1, 1,
-0.3646972, -0.8807952, -3.212855, 0, 0, 0, 1, 1,
-0.360792, 0.1236859, -1.629626, 1, 1, 1, 1, 1,
-0.3583241, -1.602306, -2.129234, 1, 1, 1, 1, 1,
-0.3534809, 0.9750985, -0.6393024, 1, 1, 1, 1, 1,
-0.3453717, -0.02705262, -1.489789, 1, 1, 1, 1, 1,
-0.3449564, -0.6393698, -3.44369, 1, 1, 1, 1, 1,
-0.3397039, -0.4527567, -3.069871, 1, 1, 1, 1, 1,
-0.3333683, -0.2562535, -0.974371, 1, 1, 1, 1, 1,
-0.3302056, 0.1469401, -1.052654, 1, 1, 1, 1, 1,
-0.3280874, -0.03884624, -1.55061, 1, 1, 1, 1, 1,
-0.3276225, 0.5474287, -0.4091113, 1, 1, 1, 1, 1,
-0.3204455, -0.08556873, -3.209369, 1, 1, 1, 1, 1,
-0.3144381, -0.4379978, -2.260722, 1, 1, 1, 1, 1,
-0.3137688, 0.2769166, -0.2369903, 1, 1, 1, 1, 1,
-0.3126009, 0.8843583, -1.555699, 1, 1, 1, 1, 1,
-0.3103112, 0.9795096, -0.1449642, 1, 1, 1, 1, 1,
-0.3046122, 2.394654, 1.130129, 0, 0, 1, 1, 1,
-0.304139, -0.2825533, -2.64317, 1, 0, 0, 1, 1,
-0.3027697, 1.592965, 1.401271, 1, 0, 0, 1, 1,
-0.3016348, 0.1010051, -0.6043045, 1, 0, 0, 1, 1,
-0.2998123, 0.1422687, -2.194289, 1, 0, 0, 1, 1,
-0.2994794, -1.1689, -1.378938, 1, 0, 0, 1, 1,
-0.2981434, -0.1057164, -2.825276, 0, 0, 0, 1, 1,
-0.2969416, -0.1355102, -1.785472, 0, 0, 0, 1, 1,
-0.2950036, -0.8261922, -3.310414, 0, 0, 0, 1, 1,
-0.2925589, -1.168538, -2.816209, 0, 0, 0, 1, 1,
-0.2917043, 1.844307, 0.121323, 0, 0, 0, 1, 1,
-0.2885741, 0.2736097, -2.280997, 0, 0, 0, 1, 1,
-0.281399, -1.161029, -3.373539, 0, 0, 0, 1, 1,
-0.279521, 0.2504109, 0.4429544, 1, 1, 1, 1, 1,
-0.276711, -0.875051, -3.455049, 1, 1, 1, 1, 1,
-0.2733518, 0.883776, 0.367484, 1, 1, 1, 1, 1,
-0.272321, -1.58913, -3.312215, 1, 1, 1, 1, 1,
-0.2692676, -0.1221055, -1.128484, 1, 1, 1, 1, 1,
-0.257959, 1.396796, -1.339541, 1, 1, 1, 1, 1,
-0.2556801, -1.423944, -3.618572, 1, 1, 1, 1, 1,
-0.2525578, 0.2698107, -0.8751391, 1, 1, 1, 1, 1,
-0.2500711, -1.227742, -1.994118, 1, 1, 1, 1, 1,
-0.2490965, 0.7221565, -0.3633828, 1, 1, 1, 1, 1,
-0.2473451, -0.3489582, -4.250166, 1, 1, 1, 1, 1,
-0.244548, -1.29906, -5.141327, 1, 1, 1, 1, 1,
-0.2404395, 0.4242432, -0.3771653, 1, 1, 1, 1, 1,
-0.2403975, -0.4138799, -1.336902, 1, 1, 1, 1, 1,
-0.2396011, -0.6222923, -4.150321, 1, 1, 1, 1, 1,
-0.2376186, 1.141157, -0.8192413, 0, 0, 1, 1, 1,
-0.2365043, -0.4006717, -2.219511, 1, 0, 0, 1, 1,
-0.2357324, 0.6649634, -0.7138351, 1, 0, 0, 1, 1,
-0.2350802, -1.494496, -2.812622, 1, 0, 0, 1, 1,
-0.2349087, 0.8513499, -1.402431, 1, 0, 0, 1, 1,
-0.2345323, 0.2460379, -0.7960101, 1, 0, 0, 1, 1,
-0.2319051, -1.70857, -2.276729, 0, 0, 0, 1, 1,
-0.2305116, 0.1274108, -0.6483861, 0, 0, 0, 1, 1,
-0.2254734, -0.1046513, -3.114527, 0, 0, 0, 1, 1,
-0.2232041, -0.9825665, -2.775209, 0, 0, 0, 1, 1,
-0.2226158, -1.224783, -3.288412, 0, 0, 0, 1, 1,
-0.2209984, -0.5837559, -1.78482, 0, 0, 0, 1, 1,
-0.2161131, -0.6687132, -2.227709, 0, 0, 0, 1, 1,
-0.2140427, 0.1464214, -1.018328, 1, 1, 1, 1, 1,
-0.2131874, -0.3153913, -1.78367, 1, 1, 1, 1, 1,
-0.2082787, 0.02092969, -0.8177596, 1, 1, 1, 1, 1,
-0.2079374, -0.8162772, -2.216065, 1, 1, 1, 1, 1,
-0.2070964, -0.2109777, -1.744743, 1, 1, 1, 1, 1,
-0.2050802, 2.086596, -0.3137546, 1, 1, 1, 1, 1,
-0.2031712, 1.061637, 0.5832028, 1, 1, 1, 1, 1,
-0.2028929, 0.4719774, -1.577013, 1, 1, 1, 1, 1,
-0.1987355, 1.181978, -0.4675024, 1, 1, 1, 1, 1,
-0.190543, -0.3601228, -1.49872, 1, 1, 1, 1, 1,
-0.1899969, -0.5231427, -2.671919, 1, 1, 1, 1, 1,
-0.1894879, 1.886968, 1.29629, 1, 1, 1, 1, 1,
-0.1879145, 1.308194, -0.1069626, 1, 1, 1, 1, 1,
-0.1869279, 0.293972, -1.472332, 1, 1, 1, 1, 1,
-0.1856301, 1.51158, 2.079475, 1, 1, 1, 1, 1,
-0.1796605, -0.01886021, -2.732229, 0, 0, 1, 1, 1,
-0.1791702, -1.737552, -1.509001, 1, 0, 0, 1, 1,
-0.1779681, 0.6756725, -2.411285, 1, 0, 0, 1, 1,
-0.1769279, -1.133906, -3.271281, 1, 0, 0, 1, 1,
-0.1745471, 1.736717, -1.242337, 1, 0, 0, 1, 1,
-0.1745081, -0.2425041, -1.982675, 1, 0, 0, 1, 1,
-0.1731892, 0.8089927, -2.158383, 0, 0, 0, 1, 1,
-0.1722751, 1.195755, 0.0545706, 0, 0, 0, 1, 1,
-0.1716537, 2.033472, 1.790013, 0, 0, 0, 1, 1,
-0.1712623, 0.1234178, -1.634636, 0, 0, 0, 1, 1,
-0.1671789, -1.049155, -3.928383, 0, 0, 0, 1, 1,
-0.1642422, -0.3872304, -1.353017, 0, 0, 0, 1, 1,
-0.1585566, 0.6580319, -1.448765, 0, 0, 0, 1, 1,
-0.1568002, -0.7477967, -3.935877, 1, 1, 1, 1, 1,
-0.1527076, -0.184545, -3.97667, 1, 1, 1, 1, 1,
-0.1489011, -0.9763274, -1.987049, 1, 1, 1, 1, 1,
-0.1428629, 0.4099529, -1.412399, 1, 1, 1, 1, 1,
-0.1382376, -0.2833161, -3.572821, 1, 1, 1, 1, 1,
-0.1358834, -0.709406, -2.343715, 1, 1, 1, 1, 1,
-0.1356433, -1.375912, -2.192065, 1, 1, 1, 1, 1,
-0.1326269, -0.1367663, -3.054444, 1, 1, 1, 1, 1,
-0.1303773, -1.170711, -3.188639, 1, 1, 1, 1, 1,
-0.1278466, 0.0302301, -1.684662, 1, 1, 1, 1, 1,
-0.127513, 0.3856112, -1.541417, 1, 1, 1, 1, 1,
-0.1248099, 2.472102, -0.4153207, 1, 1, 1, 1, 1,
-0.1231008, 0.7099997, -0.387257, 1, 1, 1, 1, 1,
-0.1146805, 0.4727403, -2.619567, 1, 1, 1, 1, 1,
-0.1139229, -0.3812981, -2.620595, 1, 1, 1, 1, 1,
-0.1037714, 1.213865, -1.770064, 0, 0, 1, 1, 1,
-0.1033773, 1.234938, 0.0951525, 1, 0, 0, 1, 1,
-0.103049, 1.644703, 0.1455407, 1, 0, 0, 1, 1,
-0.1021081, 0.2623284, 0.1085094, 1, 0, 0, 1, 1,
-0.1001991, -1.06936, -2.023566, 1, 0, 0, 1, 1,
-0.09890686, -1.243474, -1.199893, 1, 0, 0, 1, 1,
-0.09759419, 0.7941127, -1.733075, 0, 0, 0, 1, 1,
-0.09559309, -0.1449936, -1.757673, 0, 0, 0, 1, 1,
-0.09558026, -1.061996, -1.987747, 0, 0, 0, 1, 1,
-0.09136892, -0.1070825, -2.881233, 0, 0, 0, 1, 1,
-0.09117866, -1.982914, -3.788697, 0, 0, 0, 1, 1,
-0.09006193, -2.039513, -4.73062, 0, 0, 0, 1, 1,
-0.08849663, -1.050117, -1.929851, 0, 0, 0, 1, 1,
-0.08838872, -0.4479147, -3.216256, 1, 1, 1, 1, 1,
-0.0876517, -0.6660965, -2.692012, 1, 1, 1, 1, 1,
-0.08207575, -3.093526, -4.223901, 1, 1, 1, 1, 1,
-0.08037575, -0.7245989, -3.282299, 1, 1, 1, 1, 1,
-0.07942961, 2.033453, -0.7162376, 1, 1, 1, 1, 1,
-0.07894778, -1.485461, -3.911533, 1, 1, 1, 1, 1,
-0.07159537, -1.624524, -3.241782, 1, 1, 1, 1, 1,
-0.06329349, -1.23708, -1.811641, 1, 1, 1, 1, 1,
-0.06158615, -0.7138293, -3.638278, 1, 1, 1, 1, 1,
-0.0573809, -1.880921, -2.2717, 1, 1, 1, 1, 1,
-0.05533818, -1.327006, -4.042922, 1, 1, 1, 1, 1,
-0.05393111, 0.07806578, -0.3349606, 1, 1, 1, 1, 1,
-0.05143008, -0.5481302, -1.676528, 1, 1, 1, 1, 1,
-0.05051789, -0.5872965, -2.870083, 1, 1, 1, 1, 1,
-0.04874428, 1.323099, 0.8065829, 1, 1, 1, 1, 1,
-0.04866248, 1.455781, -0.2671591, 0, 0, 1, 1, 1,
-0.04830671, -0.6987872, -2.514609, 1, 0, 0, 1, 1,
-0.04675759, 1.897343, 0.06972753, 1, 0, 0, 1, 1,
-0.04598143, -1.680778, -4.307005, 1, 0, 0, 1, 1,
-0.04284046, -0.8721617, -2.172473, 1, 0, 0, 1, 1,
-0.04223993, 0.9336359, -0.8801818, 1, 0, 0, 1, 1,
-0.04191408, 1.428072, -0.4544333, 0, 0, 0, 1, 1,
-0.0416344, -0.4890339, -4.204783, 0, 0, 0, 1, 1,
-0.04001585, 0.4009125, -1.303507, 0, 0, 0, 1, 1,
-0.03800389, -0.5718021, -3.180823, 0, 0, 0, 1, 1,
-0.03683427, -0.5178977, -3.758111, 0, 0, 0, 1, 1,
-0.03552229, 0.7986327, -1.400209, 0, 0, 0, 1, 1,
-0.02605329, 0.1786755, -1.120927, 0, 0, 0, 1, 1,
-0.025206, 1.143792, 0.5446057, 1, 1, 1, 1, 1,
-0.02359071, -0.1916647, -3.658818, 1, 1, 1, 1, 1,
-0.01941554, -0.4115259, -3.594139, 1, 1, 1, 1, 1,
-0.01881377, 0.352258, -1.587293, 1, 1, 1, 1, 1,
-0.01660224, -0.2774913, -2.573426, 1, 1, 1, 1, 1,
-0.01560791, 1.851666, -0.300375, 1, 1, 1, 1, 1,
-0.01375605, -0.7400914, -4.079019, 1, 1, 1, 1, 1,
-0.01329454, 1.005475, -0.6586558, 1, 1, 1, 1, 1,
-0.01174309, 0.42463, 0.5279712, 1, 1, 1, 1, 1,
0.00283482, 0.360149, 0.6986085, 1, 1, 1, 1, 1,
0.006033229, -0.1054462, 2.205239, 1, 1, 1, 1, 1,
0.006290968, 0.3263983, 1.115763, 1, 1, 1, 1, 1,
0.008111493, -0.2398443, 2.302449, 1, 1, 1, 1, 1,
0.01075463, 0.2905315, 0.006988486, 1, 1, 1, 1, 1,
0.01119921, -0.224231, 2.051573, 1, 1, 1, 1, 1,
0.01505762, -0.922982, 3.573609, 0, 0, 1, 1, 1,
0.01663273, -1.187649, 1.823179, 1, 0, 0, 1, 1,
0.01744727, -0.790539, 2.375096, 1, 0, 0, 1, 1,
0.01931839, -0.7999054, 3.137131, 1, 0, 0, 1, 1,
0.02160976, -0.3275474, 3.845141, 1, 0, 0, 1, 1,
0.02392015, -0.08650333, 2.4476, 1, 0, 0, 1, 1,
0.02589867, -0.05485654, 1.953403, 0, 0, 0, 1, 1,
0.03191126, 1.964678, -1.153807, 0, 0, 0, 1, 1,
0.0321575, -0.6864559, 2.259161, 0, 0, 0, 1, 1,
0.03335092, -0.2395665, 5.144611, 0, 0, 0, 1, 1,
0.03607742, 2.362424, 0.6699563, 0, 0, 0, 1, 1,
0.03837888, 1.40709, 0.7840059, 0, 0, 0, 1, 1,
0.03993014, 0.9047916, 1.80222, 0, 0, 0, 1, 1,
0.04373637, -0.07721329, 2.622318, 1, 1, 1, 1, 1,
0.0439845, 1.044658, 0.5266874, 1, 1, 1, 1, 1,
0.04692791, 0.6462108, 1.441878, 1, 1, 1, 1, 1,
0.04777038, -1.54205, 3.700321, 1, 1, 1, 1, 1,
0.05101075, 0.881296, 0.6249163, 1, 1, 1, 1, 1,
0.05400243, 0.4886394, -1.638452, 1, 1, 1, 1, 1,
0.05504909, 1.393902, 2.175685, 1, 1, 1, 1, 1,
0.05510347, 0.8903275, 1.042016, 1, 1, 1, 1, 1,
0.05676153, 1.465092, 0.9449936, 1, 1, 1, 1, 1,
0.06016035, 2.577274, 0.4770416, 1, 1, 1, 1, 1,
0.06109665, 0.4432043, 0.3973143, 1, 1, 1, 1, 1,
0.06204135, -0.4661484, 2.710244, 1, 1, 1, 1, 1,
0.06291441, -0.03255345, 0.994611, 1, 1, 1, 1, 1,
0.06498385, -0.4661208, 2.599295, 1, 1, 1, 1, 1,
0.06641238, 0.5779777, -1.676065, 1, 1, 1, 1, 1,
0.07104488, -0.7841891, 2.342108, 0, 0, 1, 1, 1,
0.0712569, -0.2999765, 3.85148, 1, 0, 0, 1, 1,
0.0755601, 0.4841778, 1.071222, 1, 0, 0, 1, 1,
0.07565392, -0.4637445, 3.863604, 1, 0, 0, 1, 1,
0.08014518, 1.240324, -0.1294039, 1, 0, 0, 1, 1,
0.08640704, -2.354748, 3.361792, 1, 0, 0, 1, 1,
0.08786114, 1.043623, -1.621899, 0, 0, 0, 1, 1,
0.08815155, -0.3946381, 3.921015, 0, 0, 0, 1, 1,
0.0909071, -1.202866, 2.416255, 0, 0, 0, 1, 1,
0.09107084, -0.4842358, 3.467262, 0, 0, 0, 1, 1,
0.09358486, -1.288914, 1.783278, 0, 0, 0, 1, 1,
0.09417165, -0.6591753, 3.761788, 0, 0, 0, 1, 1,
0.09426134, 2.155, -0.6349342, 0, 0, 0, 1, 1,
0.09509897, -2.360734, 3.561588, 1, 1, 1, 1, 1,
0.09606943, 0.5712467, -1.727999, 1, 1, 1, 1, 1,
0.09691276, 0.6395697, 0.4086072, 1, 1, 1, 1, 1,
0.09787674, -1.259742, 3.978791, 1, 1, 1, 1, 1,
0.1036825, 0.5346081, 1.991109, 1, 1, 1, 1, 1,
0.1057586, 0.3981286, 0.2183408, 1, 1, 1, 1, 1,
0.1072494, 0.4531233, -0.4328319, 1, 1, 1, 1, 1,
0.1085837, 0.663562, -0.1042592, 1, 1, 1, 1, 1,
0.1096778, -0.828505, 3.15934, 1, 1, 1, 1, 1,
0.1141918, 1.224629, 0.5818833, 1, 1, 1, 1, 1,
0.1189647, 1.156264, 1.051777, 1, 1, 1, 1, 1,
0.1198004, 1.073534, -0.3243774, 1, 1, 1, 1, 1,
0.1199429, 0.9024019, -0.2926695, 1, 1, 1, 1, 1,
0.120335, 1.094525, 0.3177159, 1, 1, 1, 1, 1,
0.1208251, -0.765462, 3.233543, 1, 1, 1, 1, 1,
0.1221563, 1.236195, 0.5087453, 0, 0, 1, 1, 1,
0.1223761, -0.564211, 2.563763, 1, 0, 0, 1, 1,
0.1269556, -0.2465901, 4.005741, 1, 0, 0, 1, 1,
0.1270763, 0.6404691, 0.5417666, 1, 0, 0, 1, 1,
0.1315658, 0.2592246, 0.2644709, 1, 0, 0, 1, 1,
0.1333008, 0.09089185, 1.890557, 1, 0, 0, 1, 1,
0.1359077, -1.874089, 1.578415, 0, 0, 0, 1, 1,
0.1365716, -1.943194, 4.242025, 0, 0, 0, 1, 1,
0.1518474, 0.3729711, 0.8674592, 0, 0, 0, 1, 1,
0.1555183, -0.9720576, 4.211417, 0, 0, 0, 1, 1,
0.1577111, -0.08220761, 2.610221, 0, 0, 0, 1, 1,
0.1709741, -0.9890376, 2.356077, 0, 0, 0, 1, 1,
0.1716697, 2.10281, -0.744431, 0, 0, 0, 1, 1,
0.1719728, -0.3050955, 0.9793509, 1, 1, 1, 1, 1,
0.1735723, -0.07303202, 2.746456, 1, 1, 1, 1, 1,
0.1804, -1.185824, 3.081984, 1, 1, 1, 1, 1,
0.1804841, 0.3805082, 2.057784, 1, 1, 1, 1, 1,
0.1824453, 0.3887646, 1.697401, 1, 1, 1, 1, 1,
0.1842961, 0.01120854, 0.07149887, 1, 1, 1, 1, 1,
0.1846289, -0.769396, 1.965686, 1, 1, 1, 1, 1,
0.1881279, 0.8569297, 0.8012553, 1, 1, 1, 1, 1,
0.1899206, 1.475164, -0.538277, 1, 1, 1, 1, 1,
0.192438, -1.737067, 4.118346, 1, 1, 1, 1, 1,
0.1925824, 1.10025, -0.3041926, 1, 1, 1, 1, 1,
0.1925976, 0.613133, 0.9790727, 1, 1, 1, 1, 1,
0.1945606, -0.01506883, 1.222069, 1, 1, 1, 1, 1,
0.1951734, -0.566358, 3.68724, 1, 1, 1, 1, 1,
0.2034231, 0.1872715, 2.169328, 1, 1, 1, 1, 1,
0.2057612, -0.3623975, 4.172325, 0, 0, 1, 1, 1,
0.20662, 0.5504631, -0.8417453, 1, 0, 0, 1, 1,
0.209683, -0.8510059, 3.392313, 1, 0, 0, 1, 1,
0.2135097, -0.6932033, 2.358027, 1, 0, 0, 1, 1,
0.2160147, -1.013282, 3.669603, 1, 0, 0, 1, 1,
0.2281974, 1.165786, 0.7314969, 1, 0, 0, 1, 1,
0.2282527, 1.045613, 0.8927921, 0, 0, 0, 1, 1,
0.2345585, 2.280232, -0.6981661, 0, 0, 0, 1, 1,
0.2388678, -1.246107, 1.806645, 0, 0, 0, 1, 1,
0.2389485, 0.09668902, 1.593301, 0, 0, 0, 1, 1,
0.2406166, -0.6089199, 2.306258, 0, 0, 0, 1, 1,
0.244882, -0.9645302, 2.395239, 0, 0, 0, 1, 1,
0.2456543, 0.4405757, 0.9986797, 0, 0, 0, 1, 1,
0.2471845, 0.02710449, 0.6002289, 1, 1, 1, 1, 1,
0.2474189, -0.1516127, 0.9929075, 1, 1, 1, 1, 1,
0.2525113, 1.148508, 0.7153242, 1, 1, 1, 1, 1,
0.2590349, 0.1400826, 1.718498, 1, 1, 1, 1, 1,
0.2616581, -0.2073424, 2.007689, 1, 1, 1, 1, 1,
0.2642436, -2.182583, 2.521979, 1, 1, 1, 1, 1,
0.2659134, -2.138594, 2.927136, 1, 1, 1, 1, 1,
0.2686866, 1.903056, -1.019706, 1, 1, 1, 1, 1,
0.2700194, -0.1487917, 0.8945864, 1, 1, 1, 1, 1,
0.2710288, -0.9456851, 3.11248, 1, 1, 1, 1, 1,
0.2725378, 1.153073, -1.530721, 1, 1, 1, 1, 1,
0.2735891, 2.179277, -0.1194742, 1, 1, 1, 1, 1,
0.2737529, 1.433709, 0.3678554, 1, 1, 1, 1, 1,
0.2740092, -0.8463063, 3.644748, 1, 1, 1, 1, 1,
0.2763243, 0.2996125, 2.51624, 1, 1, 1, 1, 1,
0.2782648, 0.3555217, -0.4296418, 0, 0, 1, 1, 1,
0.2802423, -0.3944185, 3.16516, 1, 0, 0, 1, 1,
0.2812215, 0.5642756, 0.8123499, 1, 0, 0, 1, 1,
0.2813066, -0.9089315, 2.949973, 1, 0, 0, 1, 1,
0.2815906, 1.397108, -0.06210685, 1, 0, 0, 1, 1,
0.2838467, 0.1621167, 0.667107, 1, 0, 0, 1, 1,
0.2876425, 2.051396, -0.4935749, 0, 0, 0, 1, 1,
0.3004719, 0.4875368, 1.268723, 0, 0, 0, 1, 1,
0.306392, -1.619081, 3.166027, 0, 0, 0, 1, 1,
0.3159967, -0.8829331, 1.601426, 0, 0, 0, 1, 1,
0.3176206, -1.463038, 2.49985, 0, 0, 0, 1, 1,
0.3218706, 0.1757013, 0.914134, 0, 0, 0, 1, 1,
0.3225569, 0.8718632, -0.4797353, 0, 0, 0, 1, 1,
0.3238264, -0.9435984, 2.729753, 1, 1, 1, 1, 1,
0.3251629, -0.309944, 2.697583, 1, 1, 1, 1, 1,
0.3265893, 0.1831243, 1.212315, 1, 1, 1, 1, 1,
0.3380002, 0.2385739, -0.4144521, 1, 1, 1, 1, 1,
0.3401443, 0.2011004, 1.249011, 1, 1, 1, 1, 1,
0.3437243, 0.3874955, -0.1149459, 1, 1, 1, 1, 1,
0.3460481, 1.36024, 0.3314098, 1, 1, 1, 1, 1,
0.3526391, 0.3925223, 1.584151, 1, 1, 1, 1, 1,
0.3529494, -1.051827, 1.572708, 1, 1, 1, 1, 1,
0.35361, -1.713177, 3.764434, 1, 1, 1, 1, 1,
0.3544272, -1.291212, 2.484401, 1, 1, 1, 1, 1,
0.3551317, 1.763315, 0.2761899, 1, 1, 1, 1, 1,
0.3555792, 0.8023025, 0.7329712, 1, 1, 1, 1, 1,
0.3565124, -0.05279788, 2.316104, 1, 1, 1, 1, 1,
0.3565678, -0.6607109, 3.114587, 1, 1, 1, 1, 1,
0.3594065, 1.674371, 0.4690473, 0, 0, 1, 1, 1,
0.3608761, -1.77671, 3.879639, 1, 0, 0, 1, 1,
0.3612258, -0.4325666, 2.784506, 1, 0, 0, 1, 1,
0.3666939, 1.105981, 0.013857, 1, 0, 0, 1, 1,
0.3712516, 0.223297, 1.50425, 1, 0, 0, 1, 1,
0.3731194, -1.617379, 2.922876, 1, 0, 0, 1, 1,
0.3773035, 0.4209504, 1.37105, 0, 0, 0, 1, 1,
0.3786865, -1.030692, 5.088996, 0, 0, 0, 1, 1,
0.379452, 0.3787978, 1.684284, 0, 0, 0, 1, 1,
0.3800017, 1.265525, 0.3957393, 0, 0, 0, 1, 1,
0.3848112, -0.2979076, 3.435836, 0, 0, 0, 1, 1,
0.3852368, 0.798037, -0.2620546, 0, 0, 0, 1, 1,
0.3857776, -0.7058877, 0.5963398, 0, 0, 0, 1, 1,
0.3867266, -1.100733, 2.159, 1, 1, 1, 1, 1,
0.3879685, 0.7582126, -0.08492661, 1, 1, 1, 1, 1,
0.3960697, -0.4911025, 3.872769, 1, 1, 1, 1, 1,
0.3988561, 1.241884, -0.7233402, 1, 1, 1, 1, 1,
0.402453, 0.6757635, 0.7001426, 1, 1, 1, 1, 1,
0.405855, -0.8125528, 2.485095, 1, 1, 1, 1, 1,
0.41084, 1.572294, -0.8626592, 1, 1, 1, 1, 1,
0.413208, -0.4223521, 4.13471, 1, 1, 1, 1, 1,
0.414574, -0.8820053, 3.706929, 1, 1, 1, 1, 1,
0.4148386, -1.218151, 1.261737, 1, 1, 1, 1, 1,
0.4155186, -1.428987, 2.602897, 1, 1, 1, 1, 1,
0.4198755, -0.4980429, 1.42951, 1, 1, 1, 1, 1,
0.4306443, -1.200185, 4.27302, 1, 1, 1, 1, 1,
0.4318332, -1.21616, 2.191254, 1, 1, 1, 1, 1,
0.4325382, -0.2519636, 1.018585, 1, 1, 1, 1, 1,
0.434298, -0.5853289, 3.712521, 0, 0, 1, 1, 1,
0.4399155, 0.1575905, 1.666202, 1, 0, 0, 1, 1,
0.4403158, 0.1742344, 0.8073926, 1, 0, 0, 1, 1,
0.4422802, 2.016533, -1.338822, 1, 0, 0, 1, 1,
0.4435169, -1.410873, 2.650903, 1, 0, 0, 1, 1,
0.4438522, -0.5662377, 0.2664719, 1, 0, 0, 1, 1,
0.4494264, -1.130696, 0.9865055, 0, 0, 0, 1, 1,
0.4511687, 0.7570316, -0.2556689, 0, 0, 0, 1, 1,
0.4549798, 0.1432807, 0.4527628, 0, 0, 0, 1, 1,
0.4594274, -0.1414277, 2.818559, 0, 0, 0, 1, 1,
0.4599085, 1.279284, 0.1956073, 0, 0, 0, 1, 1,
0.4605836, -0.8579438, 2.095294, 0, 0, 0, 1, 1,
0.4643376, 0.9539085, 0.3307387, 0, 0, 0, 1, 1,
0.4696491, -0.7884969, 0.9955224, 1, 1, 1, 1, 1,
0.4713282, -1.195219, 2.325576, 1, 1, 1, 1, 1,
0.4790198, -0.112179, 4.297314, 1, 1, 1, 1, 1,
0.4875351, -0.1192245, 1.708845, 1, 1, 1, 1, 1,
0.4972109, -0.04516838, 2.862427, 1, 1, 1, 1, 1,
0.4976752, 0.7794492, -0.1113158, 1, 1, 1, 1, 1,
0.5078259, -1.02784, 2.121672, 1, 1, 1, 1, 1,
0.5127243, -1.268921, 0.4809678, 1, 1, 1, 1, 1,
0.5160765, 0.1897947, 1.618424, 1, 1, 1, 1, 1,
0.5169702, -1.51013, 4.841759, 1, 1, 1, 1, 1,
0.5251998, 0.5991156, 1.678936, 1, 1, 1, 1, 1,
0.5284281, -0.3279618, 3.949882, 1, 1, 1, 1, 1,
0.5307475, 0.007526671, -0.5494016, 1, 1, 1, 1, 1,
0.5321915, -0.9764041, 2.117421, 1, 1, 1, 1, 1,
0.5331008, 0.70169, 0.4533584, 1, 1, 1, 1, 1,
0.5346875, 0.068058, 0.9351267, 0, 0, 1, 1, 1,
0.5388817, 0.6024139, 0.6732432, 1, 0, 0, 1, 1,
0.5416532, -0.5073354, 2.095721, 1, 0, 0, 1, 1,
0.5436395, -2.207439, 3.37515, 1, 0, 0, 1, 1,
0.5460577, -1.435509, 4.388999, 1, 0, 0, 1, 1,
0.5486265, -1.625509, 3.750432, 1, 0, 0, 1, 1,
0.5510094, -0.4675292, 2.682912, 0, 0, 0, 1, 1,
0.5519391, 1.198733, 1.05879, 0, 0, 0, 1, 1,
0.5541658, 0.2357659, -0.04452921, 0, 0, 0, 1, 1,
0.5568087, -0.1276493, 2.524834, 0, 0, 0, 1, 1,
0.5573483, 0.4193269, 1.916924, 0, 0, 0, 1, 1,
0.5597006, 0.2497616, 1.252162, 0, 0, 0, 1, 1,
0.5601029, -1.177482, 0.8270888, 0, 0, 0, 1, 1,
0.5604587, -0.3355435, -0.03369342, 1, 1, 1, 1, 1,
0.5663306, -0.4530112, 1.475744, 1, 1, 1, 1, 1,
0.5668831, 0.001580586, 2.506515, 1, 1, 1, 1, 1,
0.5755154, 0.9545898, 0.6294414, 1, 1, 1, 1, 1,
0.5774869, -0.1237474, 0.1756965, 1, 1, 1, 1, 1,
0.5807571, 0.5788417, 1.251643, 1, 1, 1, 1, 1,
0.5811823, 0.9986324, 2.158758, 1, 1, 1, 1, 1,
0.5821514, 0.03719758, 1.270316, 1, 1, 1, 1, 1,
0.5851016, 0.004776047, 0.8139528, 1, 1, 1, 1, 1,
0.5870349, 0.9832854, 2.141937, 1, 1, 1, 1, 1,
0.6007352, 0.4837383, 2.49821, 1, 1, 1, 1, 1,
0.6082976, 0.8635496, 0.4249376, 1, 1, 1, 1, 1,
0.609493, 1.171495, 1.492409, 1, 1, 1, 1, 1,
0.6116859, 0.9473867, -1.341905, 1, 1, 1, 1, 1,
0.6250954, 0.7983094, 1.0587, 1, 1, 1, 1, 1,
0.6256902, -0.001011415, 1.449126, 0, 0, 1, 1, 1,
0.629298, -0.1987636, 3.43314, 1, 0, 0, 1, 1,
0.6303553, -1.96064, 2.823838, 1, 0, 0, 1, 1,
0.6324969, 1.323467, -2.545879, 1, 0, 0, 1, 1,
0.6349409, -0.4234297, 2.30201, 1, 0, 0, 1, 1,
0.6396742, -0.7848896, 3.176722, 1, 0, 0, 1, 1,
0.6439904, 0.374403, 0.4546073, 0, 0, 0, 1, 1,
0.6543903, 0.306414, 0.4809983, 0, 0, 0, 1, 1,
0.6552202, -0.9665741, 1.002378, 0, 0, 0, 1, 1,
0.6580978, 1.043853, 0.1385961, 0, 0, 0, 1, 1,
0.6583292, -1.012837, 4.053633, 0, 0, 0, 1, 1,
0.6633499, 1.022858, -0.8460183, 0, 0, 0, 1, 1,
0.6678607, 0.3683676, 0.5546035, 0, 0, 0, 1, 1,
0.6684337, 0.6428973, 0.4237201, 1, 1, 1, 1, 1,
0.6708888, -0.8838769, 2.118915, 1, 1, 1, 1, 1,
0.6771003, -1.271919, 2.609227, 1, 1, 1, 1, 1,
0.679687, 0.04889688, 1.797044, 1, 1, 1, 1, 1,
0.681157, -0.2493388, 1.77431, 1, 1, 1, 1, 1,
0.6885641, -0.2207406, 1.310625, 1, 1, 1, 1, 1,
0.68884, 1.922667, 0.9507845, 1, 1, 1, 1, 1,
0.6938835, 0.01769936, 1.821869, 1, 1, 1, 1, 1,
0.6943471, -0.3656133, 2.908778, 1, 1, 1, 1, 1,
0.7031757, -0.8346202, 2.583618, 1, 1, 1, 1, 1,
0.7034858, 0.9341905, 1.477838, 1, 1, 1, 1, 1,
0.7048164, -1.062086, 2.870913, 1, 1, 1, 1, 1,
0.7127201, 2.440863, -0.5329699, 1, 1, 1, 1, 1,
0.7145424, -0.533111, 0.5256962, 1, 1, 1, 1, 1,
0.7224056, 0.09588052, 2.278599, 1, 1, 1, 1, 1,
0.7228257, 0.7885573, 0.181146, 0, 0, 1, 1, 1,
0.7233467, 1.052633, -0.7519951, 1, 0, 0, 1, 1,
0.7236977, 0.1663823, 1.421592, 1, 0, 0, 1, 1,
0.728663, -0.7624302, 2.323203, 1, 0, 0, 1, 1,
0.7352509, 2.230595, 0.04912504, 1, 0, 0, 1, 1,
0.7381023, 2.172793, 2.76035, 1, 0, 0, 1, 1,
0.7496086, 0.583671, -1.305891, 0, 0, 0, 1, 1,
0.7533078, 2.551691, 0.05166329, 0, 0, 0, 1, 1,
0.7589586, 0.3171226, 0.6120685, 0, 0, 0, 1, 1,
0.7608808, 0.2665037, 2.614533, 0, 0, 0, 1, 1,
0.7622252, -0.9641787, 2.883639, 0, 0, 0, 1, 1,
0.7628345, -0.3193164, 0.05718401, 0, 0, 0, 1, 1,
0.7694753, -1.273732, 2.35798, 0, 0, 0, 1, 1,
0.7724786, 1.499039, -2.231246, 1, 1, 1, 1, 1,
0.7749683, -1.195791, 3.366688, 1, 1, 1, 1, 1,
0.7773176, 0.5349677, 2.9728, 1, 1, 1, 1, 1,
0.7829749, 0.3561416, 1.709913, 1, 1, 1, 1, 1,
0.7837274, -1.089778, 0.7773553, 1, 1, 1, 1, 1,
0.7865225, -0.2975607, 1.894583, 1, 1, 1, 1, 1,
0.7889993, 1.343363, 1.171949, 1, 1, 1, 1, 1,
0.7903318, -0.9984517, 1.078446, 1, 1, 1, 1, 1,
0.7918048, -0.1709218, 0.6657129, 1, 1, 1, 1, 1,
0.8026124, 0.2308493, 1.398762, 1, 1, 1, 1, 1,
0.8059033, -0.859201, 3.674121, 1, 1, 1, 1, 1,
0.8065886, -1.392919, 3.554616, 1, 1, 1, 1, 1,
0.808049, -0.4863151, 1.507007, 1, 1, 1, 1, 1,
0.8084267, -1.239432, 2.208096, 1, 1, 1, 1, 1,
0.8126794, -1.915927, 6.04951, 1, 1, 1, 1, 1,
0.8136005, -2.065331, 2.749811, 0, 0, 1, 1, 1,
0.8146421, 0.8685757, 1.116701, 1, 0, 0, 1, 1,
0.8150015, -1.746105, 2.821524, 1, 0, 0, 1, 1,
0.8202986, -1.197303, 1.716503, 1, 0, 0, 1, 1,
0.821429, 0.6175908, 0.8093907, 1, 0, 0, 1, 1,
0.821453, 0.466575, 1.333348, 1, 0, 0, 1, 1,
0.8217361, 0.5909592, 0.2739544, 0, 0, 0, 1, 1,
0.8240641, 0.08042432, 1.169413, 0, 0, 0, 1, 1,
0.8247643, -3.367563, 3.208925, 0, 0, 0, 1, 1,
0.8273337, 0.338582, 0.563072, 0, 0, 0, 1, 1,
0.8273544, 0.6302363, 0.3880147, 0, 0, 0, 1, 1,
0.8360554, 0.6963618, -1.209787, 0, 0, 0, 1, 1,
0.8415124, -1.943842, 2.272154, 0, 0, 0, 1, 1,
0.842224, 1.282141, -0.1443873, 1, 1, 1, 1, 1,
0.8473217, -1.127532, 2.752559, 1, 1, 1, 1, 1,
0.8476073, -0.2791705, 2.128418, 1, 1, 1, 1, 1,
0.8532566, 0.5627282, 0.6935362, 1, 1, 1, 1, 1,
0.8580163, 1.577067, 1.83416, 1, 1, 1, 1, 1,
0.8580244, -0.55852, 2.594905, 1, 1, 1, 1, 1,
0.8668926, -2.376141, 5.773114, 1, 1, 1, 1, 1,
0.8686649, -0.4011991, 1.204038, 1, 1, 1, 1, 1,
0.8803509, 0.6130599, 1.731989, 1, 1, 1, 1, 1,
0.8805931, 1.664633, -0.2027371, 1, 1, 1, 1, 1,
0.8867865, -0.8793517, 2.126021, 1, 1, 1, 1, 1,
0.8877306, -1.412512, 2.836728, 1, 1, 1, 1, 1,
0.91382, -0.2011263, 2.675476, 1, 1, 1, 1, 1,
0.9195005, -0.69355, 1.634717, 1, 1, 1, 1, 1,
0.9198883, 0.579597, 0.7754524, 1, 1, 1, 1, 1,
0.9208193, -1.292089, 1.760249, 0, 0, 1, 1, 1,
0.9214234, 1.041656, 0.6937975, 1, 0, 0, 1, 1,
0.9251076, 0.578845, 0.3248876, 1, 0, 0, 1, 1,
0.9303998, 0.7332462, 0.1161819, 1, 0, 0, 1, 1,
0.9332037, 1.586799, 0.6236378, 1, 0, 0, 1, 1,
0.9353788, 1.213647, 0.5245153, 1, 0, 0, 1, 1,
0.9360167, -0.3141533, 1.858312, 0, 0, 0, 1, 1,
0.9366671, 0.4318399, 0.611431, 0, 0, 0, 1, 1,
0.9379715, -0.5350598, 1.371874, 0, 0, 0, 1, 1,
0.9457694, -0.5989946, 2.74504, 0, 0, 0, 1, 1,
0.9459803, 1.105971, 2.240861, 0, 0, 0, 1, 1,
0.9521847, -1.218977, 1.847202, 0, 0, 0, 1, 1,
0.9534898, -1.412153, 1.844731, 0, 0, 0, 1, 1,
0.9542707, -0.9702843, 2.292272, 1, 1, 1, 1, 1,
0.954536, -0.4438941, 2.455439, 1, 1, 1, 1, 1,
0.9548867, -1.309569, 2.448344, 1, 1, 1, 1, 1,
0.9580785, 0.6394255, 0.8323291, 1, 1, 1, 1, 1,
0.9601688, -0.4549234, 2.686008, 1, 1, 1, 1, 1,
0.9613297, 0.2167762, 1.326258, 1, 1, 1, 1, 1,
0.9642588, 0.917543, 0.4374849, 1, 1, 1, 1, 1,
0.966521, 0.1231915, 0.7288529, 1, 1, 1, 1, 1,
0.9713783, -0.490467, 3.322307, 1, 1, 1, 1, 1,
0.9748028, -0.3553859, 2.337792, 1, 1, 1, 1, 1,
0.976006, -0.07162399, 1.951357, 1, 1, 1, 1, 1,
0.9800088, 0.4728911, 1.884181, 1, 1, 1, 1, 1,
0.9814048, -0.7845014, 3.82402, 1, 1, 1, 1, 1,
0.9814218, -0.5105491, 1.391931, 1, 1, 1, 1, 1,
0.986636, -0.5329763, 2.989494, 1, 1, 1, 1, 1,
0.9897786, 0.3749399, 0.07242332, 0, 0, 1, 1, 1,
0.9972411, 0.6608756, 0.3124355, 1, 0, 0, 1, 1,
0.9985711, 0.9416251, 0.418384, 1, 0, 0, 1, 1,
1.004691, -0.655633, 1.768309, 1, 0, 0, 1, 1,
1.005432, -1.109727, 2.473331, 1, 0, 0, 1, 1,
1.009923, 0.6166985, -0.7612265, 1, 0, 0, 1, 1,
1.017854, -0.9788367, 1.682227, 0, 0, 0, 1, 1,
1.023497, -0.6481596, 0.9068347, 0, 0, 0, 1, 1,
1.02603, -2.042212, 5.227425, 0, 0, 0, 1, 1,
1.035834, 2.536634, 0.6740096, 0, 0, 0, 1, 1,
1.037526, 0.7564217, -1.037299, 0, 0, 0, 1, 1,
1.042688, -1.11072, 2.401451, 0, 0, 0, 1, 1,
1.04422, 0.8591642, 0.1801304, 0, 0, 0, 1, 1,
1.047749, -0.5356672, 3.022328, 1, 1, 1, 1, 1,
1.04979, -0.02979164, 1.479926, 1, 1, 1, 1, 1,
1.051733, 0.4732808, 0.395434, 1, 1, 1, 1, 1,
1.053989, 0.932395, 2.80488, 1, 1, 1, 1, 1,
1.057403, -0.6978855, 1.670824, 1, 1, 1, 1, 1,
1.058193, 1.204542, -0.5876853, 1, 1, 1, 1, 1,
1.060942, -0.07748377, -0.5634615, 1, 1, 1, 1, 1,
1.067548, 1.922777, -0.3704284, 1, 1, 1, 1, 1,
1.071448, 0.3896908, 0.5145725, 1, 1, 1, 1, 1,
1.080544, -0.8064918, 0.9752219, 1, 1, 1, 1, 1,
1.08094, -0.2977711, 1.502788, 1, 1, 1, 1, 1,
1.085074, 1.221808, 0.048194, 1, 1, 1, 1, 1,
1.094099, -0.3729214, 0.252565, 1, 1, 1, 1, 1,
1.103129, 0.9605909, 0.01632264, 1, 1, 1, 1, 1,
1.106485, 0.3455444, 0.6658944, 1, 1, 1, 1, 1,
1.106713, 1.734434, -0.0892336, 0, 0, 1, 1, 1,
1.108793, 0.7545466, 2.362713, 1, 0, 0, 1, 1,
1.112869, -0.6590967, 1.900349, 1, 0, 0, 1, 1,
1.116278, 0.040979, 1.574698, 1, 0, 0, 1, 1,
1.119628, 0.2101606, 2.875305, 1, 0, 0, 1, 1,
1.12322, 1.415568, -0.4339916, 1, 0, 0, 1, 1,
1.126072, -0.712597, 0.1758868, 0, 0, 0, 1, 1,
1.128379, 0.8584676, 0.8255441, 0, 0, 0, 1, 1,
1.141059, 0.9571243, 0.4384012, 0, 0, 0, 1, 1,
1.146083, -0.9619771, 2.113374, 0, 0, 0, 1, 1,
1.150496, -0.7165394, 2.969898, 0, 0, 0, 1, 1,
1.151739, -0.005903402, 1.948721, 0, 0, 0, 1, 1,
1.154621, 0.5859926, 1.169648, 0, 0, 0, 1, 1,
1.154806, -1.631682, 2.654728, 1, 1, 1, 1, 1,
1.157984, -0.5121516, 1.11586, 1, 1, 1, 1, 1,
1.162972, 0.6402161, -0.1703366, 1, 1, 1, 1, 1,
1.171402, -0.08602452, 0.7828045, 1, 1, 1, 1, 1,
1.172186, 1.841634, 0.363004, 1, 1, 1, 1, 1,
1.176525, -0.3617427, 2.46181, 1, 1, 1, 1, 1,
1.178683, -0.8697881, 3.93888, 1, 1, 1, 1, 1,
1.18326, -0.66175, 1.234296, 1, 1, 1, 1, 1,
1.193763, 1.886014, 0.8003267, 1, 1, 1, 1, 1,
1.196836, -0.1934308, 1.176731, 1, 1, 1, 1, 1,
1.201415, -0.4836929, 3.162865, 1, 1, 1, 1, 1,
1.203736, -2.241616, 1.326011, 1, 1, 1, 1, 1,
1.207449, 0.7314172, 1.809164, 1, 1, 1, 1, 1,
1.20981, 0.1570817, 1.538997, 1, 1, 1, 1, 1,
1.213507, 0.9015826, 2.0975, 1, 1, 1, 1, 1,
1.229641, -0.6432286, 1.587967, 0, 0, 1, 1, 1,
1.231127, 0.4097424, 1.940637, 1, 0, 0, 1, 1,
1.233064, 1.210152, 0.8241922, 1, 0, 0, 1, 1,
1.23406, 0.980622, 1.764289, 1, 0, 0, 1, 1,
1.243261, 0.4527214, -0.2371174, 1, 0, 0, 1, 1,
1.247261, -0.4191037, 2.020696, 1, 0, 0, 1, 1,
1.259648, -0.1426958, 3.035775, 0, 0, 0, 1, 1,
1.260321, -1.256068, 2.545024, 0, 0, 0, 1, 1,
1.276082, -2.338737, 1.526503, 0, 0, 0, 1, 1,
1.277341, 0.3839707, 0.6502711, 0, 0, 0, 1, 1,
1.278273, 0.4005302, 1.80252, 0, 0, 0, 1, 1,
1.29318, -0.931931, 1.045743, 0, 0, 0, 1, 1,
1.299728, -0.1909936, 1.602388, 0, 0, 0, 1, 1,
1.308033, -0.3529997, 3.00043, 1, 1, 1, 1, 1,
1.309395, 0.4074035, 1.758795, 1, 1, 1, 1, 1,
1.320403, -1.078007, 3.084107, 1, 1, 1, 1, 1,
1.323953, 0.1715298, 2.236646, 1, 1, 1, 1, 1,
1.334113, 0.8554925, 1.68267, 1, 1, 1, 1, 1,
1.340865, -1.632182, 2.020458, 1, 1, 1, 1, 1,
1.342615, -0.5303702, 2.501353, 1, 1, 1, 1, 1,
1.350414, -0.491356, 0.6500331, 1, 1, 1, 1, 1,
1.355307, 0.8283949, 0.4525207, 1, 1, 1, 1, 1,
1.356679, -1.076493, 0.4811192, 1, 1, 1, 1, 1,
1.364609, -0.184276, 2.238631, 1, 1, 1, 1, 1,
1.370011, -0.5383895, 2.920628, 1, 1, 1, 1, 1,
1.37741, -1.103427, 1.961615, 1, 1, 1, 1, 1,
1.382562, -1.041946, 3.588646, 1, 1, 1, 1, 1,
1.382857, -0.7539234, 1.738482, 1, 1, 1, 1, 1,
1.392482, 0.04334106, 1.541923, 0, 0, 1, 1, 1,
1.394121, 0.04655457, 0.165324, 1, 0, 0, 1, 1,
1.402426, 0.2856857, -0.4028829, 1, 0, 0, 1, 1,
1.414519, 0.9457676, 0.282735, 1, 0, 0, 1, 1,
1.415046, -0.9177428, 3.720157, 1, 0, 0, 1, 1,
1.419934, 0.3109071, 1.597105, 1, 0, 0, 1, 1,
1.425077, 0.6085743, 2.018778, 0, 0, 0, 1, 1,
1.429089, 0.08054015, 1.404854, 0, 0, 0, 1, 1,
1.434692, -0.8004965, 3.557106, 0, 0, 0, 1, 1,
1.439757, 0.2430882, 1.077369, 0, 0, 0, 1, 1,
1.446214, -0.5502438, 1.934072, 0, 0, 0, 1, 1,
1.480324, -0.5033924, 1.401938, 0, 0, 0, 1, 1,
1.480579, 2.228538, -2.185214, 0, 0, 0, 1, 1,
1.483258, -0.934728, 1.362428, 1, 1, 1, 1, 1,
1.489329, -0.7518019, 2.445095, 1, 1, 1, 1, 1,
1.493362, 0.1056428, -1.096758, 1, 1, 1, 1, 1,
1.504594, -0.1732828, 1.675825, 1, 1, 1, 1, 1,
1.506063, 1.666794, 3.077725, 1, 1, 1, 1, 1,
1.510207, -1.419791, 3.754006, 1, 1, 1, 1, 1,
1.514103, 2.105548, 1.440726, 1, 1, 1, 1, 1,
1.514119, -1.709316, 1.260039, 1, 1, 1, 1, 1,
1.517022, -0.7037572, -0.2008943, 1, 1, 1, 1, 1,
1.517686, 0.3582394, 1.957504, 1, 1, 1, 1, 1,
1.55088, -0.6983917, 1.515176, 1, 1, 1, 1, 1,
1.551031, 0.190097, 2.571426, 1, 1, 1, 1, 1,
1.557279, -0.7106121, 1.724486, 1, 1, 1, 1, 1,
1.563088, -0.4011859, 2.211405, 1, 1, 1, 1, 1,
1.570791, -0.001448486, 2.543583, 1, 1, 1, 1, 1,
1.571527, -1.368227, 1.727391, 0, 0, 1, 1, 1,
1.598066, 0.190019, -1.260627, 1, 0, 0, 1, 1,
1.605409, -1.107572, 2.593895, 1, 0, 0, 1, 1,
1.618031, -0.2197973, 3.099452, 1, 0, 0, 1, 1,
1.650093, 0.8270249, 1.696302, 1, 0, 0, 1, 1,
1.651262, -0.4913999, 3.785774, 1, 0, 0, 1, 1,
1.657755, 1.14576, 0.3759101, 0, 0, 0, 1, 1,
1.685989, -1.012656, 2.632582, 0, 0, 0, 1, 1,
1.686117, -0.2571078, -0.749361, 0, 0, 0, 1, 1,
1.6926, -1.095012, 2.083991, 0, 0, 0, 1, 1,
1.696688, 0.3342972, 2.136324, 0, 0, 0, 1, 1,
1.701999, 0.7190213, -0.1034607, 0, 0, 0, 1, 1,
1.707407, -0.7291995, 3.329449, 0, 0, 0, 1, 1,
1.707416, 0.8574802, -0.004359873, 1, 1, 1, 1, 1,
1.715968, 1.102529, 0.3309134, 1, 1, 1, 1, 1,
1.758873, 0.002587963, 1.901751, 1, 1, 1, 1, 1,
1.778938, -0.868288, 3.260054, 1, 1, 1, 1, 1,
1.794269, -0.2641715, 3.829916, 1, 1, 1, 1, 1,
1.795325, 8.039572e-05, 0.07494764, 1, 1, 1, 1, 1,
1.802743, -0.6663702, 1.504448, 1, 1, 1, 1, 1,
1.808344, -1.151479, -0.3437561, 1, 1, 1, 1, 1,
1.809453, 1.674221, -0.5236593, 1, 1, 1, 1, 1,
1.823059, -0.5415654, 2.714908, 1, 1, 1, 1, 1,
1.831685, 0.4212877, 2.449584, 1, 1, 1, 1, 1,
1.839699, 0.6002516, 3.129952, 1, 1, 1, 1, 1,
1.843593, 0.1154628, -0.7389771, 1, 1, 1, 1, 1,
1.860165, 0.4628305, 1.828178, 1, 1, 1, 1, 1,
1.872639, -0.767292, 2.323492, 1, 1, 1, 1, 1,
1.89557, 0.3714806, 0.3225779, 0, 0, 1, 1, 1,
1.897753, -0.00427706, 1.132096, 1, 0, 0, 1, 1,
1.946522, -0.7234712, 0.04666863, 1, 0, 0, 1, 1,
1.96838, 0.6568643, 0.9825176, 1, 0, 0, 1, 1,
1.973632, -0.6114346, 2.575816, 1, 0, 0, 1, 1,
1.973761, 0.4680687, 1.739613, 1, 0, 0, 1, 1,
1.975022, 1.509817, 0.1515542, 0, 0, 0, 1, 1,
1.999024, 1.753912, 1.264587, 0, 0, 0, 1, 1,
2.048884, -0.7880057, 2.581893, 0, 0, 0, 1, 1,
2.102532, -0.9783581, 1.757191, 0, 0, 0, 1, 1,
2.117629, 0.796638, 2.410734, 0, 0, 0, 1, 1,
2.132613, -1.668324, 2.205963, 0, 0, 0, 1, 1,
2.161988, -1.379293, 0.9396192, 0, 0, 0, 1, 1,
2.303257, 0.5655993, 2.068584, 1, 1, 1, 1, 1,
2.330072, 0.4581708, -1.034673, 1, 1, 1, 1, 1,
2.33626, -1.100128, -0.3951809, 1, 1, 1, 1, 1,
2.473596, -0.1331917, 3.023444, 1, 1, 1, 1, 1,
2.51728, 0.373249, -0.2220328, 1, 1, 1, 1, 1,
2.796978, -1.189922, -0.1802652, 1, 1, 1, 1, 1,
3.161165, -1.093112, 2.29779, 1, 1, 1, 1, 1
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
var radius = 10.1911;
var distance = 35.79579;
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
mvMatrix.translate( 0.470912, -0.01466918, -0.3284004 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.79579);
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
