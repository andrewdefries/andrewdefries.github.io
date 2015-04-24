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
-3.282989, 0.1808547, -1.512943, 1, 0, 0, 1,
-3.147838, 0.6767355, -1.193317, 1, 0.007843138, 0, 1,
-3.035881, -0.2984187, -2.336928, 1, 0.01176471, 0, 1,
-2.873099, -0.9972748, 0.002240926, 1, 0.01960784, 0, 1,
-2.836619, -0.3523695, -0.4969124, 1, 0.02352941, 0, 1,
-2.749682, -1.518278, -3.914902, 1, 0.03137255, 0, 1,
-2.740087, 0.7590867, -1.383018, 1, 0.03529412, 0, 1,
-2.554981, -1.022696, -1.906675, 1, 0.04313726, 0, 1,
-2.54287, -0.56979, -0.08688813, 1, 0.04705882, 0, 1,
-2.49999, 0.04795543, -2.876794, 1, 0.05490196, 0, 1,
-2.497149, -0.3566515, -0.8200923, 1, 0.05882353, 0, 1,
-2.38085, 0.1912107, -1.06697, 1, 0.06666667, 0, 1,
-2.346787, -0.0005648048, -2.015918, 1, 0.07058824, 0, 1,
-2.34456, 0.2389099, -2.197703, 1, 0.07843138, 0, 1,
-2.254171, -2.171406, -2.648162, 1, 0.08235294, 0, 1,
-2.230578, 0.1637371, -2.406692, 1, 0.09019608, 0, 1,
-2.166024, -0.01255675, -0.3887943, 1, 0.09411765, 0, 1,
-2.165417, -0.5540693, -1.261257, 1, 0.1019608, 0, 1,
-2.107228, -0.05264649, -1.851288, 1, 0.1098039, 0, 1,
-2.051995, -1.354485, -3.395262, 1, 0.1137255, 0, 1,
-2.001022, -0.5202462, -2.109268, 1, 0.1215686, 0, 1,
-1.976525, -0.606178, -2.378265, 1, 0.1254902, 0, 1,
-1.966471, -0.7810483, -1.567932, 1, 0.1333333, 0, 1,
-1.960012, 0.8368834, -0.7224888, 1, 0.1372549, 0, 1,
-1.958634, -0.7490777, -1.019147, 1, 0.145098, 0, 1,
-1.948071, -0.6226839, -1.806029, 1, 0.1490196, 0, 1,
-1.90821, -0.4221821, -0.4910946, 1, 0.1568628, 0, 1,
-1.884877, 0.8403823, -0.813848, 1, 0.1607843, 0, 1,
-1.869568, 0.749306, -0.7005072, 1, 0.1686275, 0, 1,
-1.858486, 1.36099, -0.879804, 1, 0.172549, 0, 1,
-1.828305, -1.315211, -1.708025, 1, 0.1803922, 0, 1,
-1.820291, 0.5087108, -2.479971, 1, 0.1843137, 0, 1,
-1.819292, 1.058127, -0.7057167, 1, 0.1921569, 0, 1,
-1.789098, 0.5139074, -2.155503, 1, 0.1960784, 0, 1,
-1.767116, -0.1854076, -0.5366837, 1, 0.2039216, 0, 1,
-1.736167, -1.735947, -0.6263876, 1, 0.2117647, 0, 1,
-1.693246, 0.2085535, -0.8272464, 1, 0.2156863, 0, 1,
-1.684938, -0.1542318, -0.1746356, 1, 0.2235294, 0, 1,
-1.676506, -1.549283, -1.38876, 1, 0.227451, 0, 1,
-1.668532, -1.753109, -4.59662, 1, 0.2352941, 0, 1,
-1.661958, -1.001363, -2.39328, 1, 0.2392157, 0, 1,
-1.654694, 1.15098, -0.285925, 1, 0.2470588, 0, 1,
-1.654035, 0.3560409, -1.633505, 1, 0.2509804, 0, 1,
-1.64437, 1.29108, -0.2628725, 1, 0.2588235, 0, 1,
-1.643873, -0.4379339, -2.292629, 1, 0.2627451, 0, 1,
-1.630609, -0.2147819, -1.870569, 1, 0.2705882, 0, 1,
-1.629822, -1.416734, -1.314173, 1, 0.2745098, 0, 1,
-1.62397, 0.8895944, -2.274479, 1, 0.282353, 0, 1,
-1.617841, 1.145065, -0.3349645, 1, 0.2862745, 0, 1,
-1.611787, 1.602978, -1.477543, 1, 0.2941177, 0, 1,
-1.605211, 1.240692, 0.4235016, 1, 0.3019608, 0, 1,
-1.595388, 0.7406242, -1.267699, 1, 0.3058824, 0, 1,
-1.583179, -1.970166, -2.293633, 1, 0.3137255, 0, 1,
-1.581143, 1.287504, -0.4342209, 1, 0.3176471, 0, 1,
-1.572206, 0.8630413, -1.06996, 1, 0.3254902, 0, 1,
-1.552776, 1.452657, -0.3249037, 1, 0.3294118, 0, 1,
-1.533536, -0.2294876, -2.004083, 1, 0.3372549, 0, 1,
-1.524643, -0.3449404, -2.521017, 1, 0.3411765, 0, 1,
-1.512982, -0.7502885, -1.829214, 1, 0.3490196, 0, 1,
-1.507308, -0.1468173, -4.284815, 1, 0.3529412, 0, 1,
-1.493258, -0.7958663, -0.5900631, 1, 0.3607843, 0, 1,
-1.488921, -1.939528, -1.593872, 1, 0.3647059, 0, 1,
-1.479896, 0.9734963, -0.4738955, 1, 0.372549, 0, 1,
-1.47316, 1.599046, -1.230512, 1, 0.3764706, 0, 1,
-1.46656, -1.281868, -2.198232, 1, 0.3843137, 0, 1,
-1.46498, -1.419994, -2.330329, 1, 0.3882353, 0, 1,
-1.459799, -0.2839673, -1.056825, 1, 0.3960784, 0, 1,
-1.455622, 1.396425, 0.2234973, 1, 0.4039216, 0, 1,
-1.443436, -0.795261, -1.183653, 1, 0.4078431, 0, 1,
-1.435605, 0.5265334, -1.513608, 1, 0.4156863, 0, 1,
-1.434904, -0.3620121, -2.390122, 1, 0.4196078, 0, 1,
-1.43206, -0.3449256, -0.3874751, 1, 0.427451, 0, 1,
-1.426644, 0.2109775, -0.6838698, 1, 0.4313726, 0, 1,
-1.406626, 1.543978, 1.522261, 1, 0.4392157, 0, 1,
-1.401302, 0.2902208, -3.060172, 1, 0.4431373, 0, 1,
-1.398239, 0.7036546, 0.3965302, 1, 0.4509804, 0, 1,
-1.394187, 1.088549, -0.9523914, 1, 0.454902, 0, 1,
-1.385165, -2.139871, -2.530041, 1, 0.4627451, 0, 1,
-1.382541, 0.1317241, -2.644825, 1, 0.4666667, 0, 1,
-1.366507, 0.4703266, -1.715451, 1, 0.4745098, 0, 1,
-1.356227, 0.1656677, 1.642361, 1, 0.4784314, 0, 1,
-1.355098, 1.491421, -0.1338513, 1, 0.4862745, 0, 1,
-1.345636, -1.489783, -2.03408, 1, 0.4901961, 0, 1,
-1.344601, 0.001969991, -0.7641138, 1, 0.4980392, 0, 1,
-1.342182, -0.7293511, -2.587772, 1, 0.5058824, 0, 1,
-1.323869, 0.2487392, -1.837878, 1, 0.509804, 0, 1,
-1.317689, 1.858994, -0.9978871, 1, 0.5176471, 0, 1,
-1.302609, -0.4271292, -2.636699, 1, 0.5215687, 0, 1,
-1.280994, 1.110076, -1.145916, 1, 0.5294118, 0, 1,
-1.271585, -0.287615, -1.243267, 1, 0.5333334, 0, 1,
-1.270724, -1.185244, -2.123462, 1, 0.5411765, 0, 1,
-1.259937, 0.3948707, -1.710323, 1, 0.5450981, 0, 1,
-1.259294, -1.053244, -1.202113, 1, 0.5529412, 0, 1,
-1.229057, -0.9039829, -3.133579, 1, 0.5568628, 0, 1,
-1.227597, -2.656233, -1.402907, 1, 0.5647059, 0, 1,
-1.226143, 0.3304797, -1.068679, 1, 0.5686275, 0, 1,
-1.223451, 1.409484, -1.953389, 1, 0.5764706, 0, 1,
-1.219122, -0.04128791, -1.89545, 1, 0.5803922, 0, 1,
-1.21639, -1.024634, -2.708149, 1, 0.5882353, 0, 1,
-1.210013, -0.6661116, -1.936109, 1, 0.5921569, 0, 1,
-1.197999, 0.7277697, 1.591377, 1, 0.6, 0, 1,
-1.197987, 0.2513055, -1.436486, 1, 0.6078432, 0, 1,
-1.197945, -0.04166581, -1.743041, 1, 0.6117647, 0, 1,
-1.19228, 0.6116928, -1.1051, 1, 0.6196079, 0, 1,
-1.19002, -0.4248958, -2.383513, 1, 0.6235294, 0, 1,
-1.181583, -0.1409781, -0.9695104, 1, 0.6313726, 0, 1,
-1.181429, -0.462954, -1.931729, 1, 0.6352941, 0, 1,
-1.181368, -0.4608138, -0.8276831, 1, 0.6431373, 0, 1,
-1.178651, -1.473535, -2.691138, 1, 0.6470588, 0, 1,
-1.171423, 0.6024277, 0.4247501, 1, 0.654902, 0, 1,
-1.166877, 0.01522514, -2.229507, 1, 0.6588235, 0, 1,
-1.165891, -1.694695, -3.00954, 1, 0.6666667, 0, 1,
-1.164934, -0.2389662, -2.036305, 1, 0.6705883, 0, 1,
-1.161471, -0.3511734, -1.818704, 1, 0.6784314, 0, 1,
-1.153661, 0.01387926, -2.14098, 1, 0.682353, 0, 1,
-1.146257, -0.5004708, -1.085664, 1, 0.6901961, 0, 1,
-1.141754, 1.051549, 0.2482789, 1, 0.6941177, 0, 1,
-1.141175, 0.3817084, -1.060072, 1, 0.7019608, 0, 1,
-1.140134, -1.266083, -3.634473, 1, 0.7098039, 0, 1,
-1.135935, -0.1525123, -0.9303561, 1, 0.7137255, 0, 1,
-1.135584, -1.996932, -2.872776, 1, 0.7215686, 0, 1,
-1.132022, -0.635531, -2.53369, 1, 0.7254902, 0, 1,
-1.124359, 1.615306, 0.5518783, 1, 0.7333333, 0, 1,
-1.12004, -0.8908362, -1.694201, 1, 0.7372549, 0, 1,
-1.118333, 0.3559862, -0.50914, 1, 0.7450981, 0, 1,
-1.118298, 0.3786328, -2.218666, 1, 0.7490196, 0, 1,
-1.115702, 0.03878706, -2.65641, 1, 0.7568628, 0, 1,
-1.110309, -0.7083737, -1.24757, 1, 0.7607843, 0, 1,
-1.096731, -0.07294846, -1.577148, 1, 0.7686275, 0, 1,
-1.083242, -0.2832119, -1.84244, 1, 0.772549, 0, 1,
-1.070779, 0.5461702, -1.938846, 1, 0.7803922, 0, 1,
-1.069817, -0.3557559, -1.576196, 1, 0.7843137, 0, 1,
-1.044254, 0.3794355, -0.2239349, 1, 0.7921569, 0, 1,
-1.038081, 0.002840201, -1.310081, 1, 0.7960784, 0, 1,
-1.037907, 2.026341, 0.9121132, 1, 0.8039216, 0, 1,
-1.037233, -0.6813365, -1.881518, 1, 0.8117647, 0, 1,
-1.03553, 0.1535078, -2.903161, 1, 0.8156863, 0, 1,
-1.029637, -0.001431515, -0.3735118, 1, 0.8235294, 0, 1,
-1.029553, -0.2031587, -2.888434, 1, 0.827451, 0, 1,
-1.009872, -2.197776, -2.458687, 1, 0.8352941, 0, 1,
-1.005353, -0.6130251, -2.961446, 1, 0.8392157, 0, 1,
-1.000938, 0.2407582, -2.785106, 1, 0.8470588, 0, 1,
-1.000889, 1.344999, -1.13505, 1, 0.8509804, 0, 1,
-0.9958062, 1.069737, -0.9566123, 1, 0.8588235, 0, 1,
-0.9953779, -1.209183, -1.878179, 1, 0.8627451, 0, 1,
-0.9903886, -0.747714, -1.236169, 1, 0.8705882, 0, 1,
-0.9889821, 0.3676692, -0.5547981, 1, 0.8745098, 0, 1,
-0.9835761, 0.2468303, -2.751175, 1, 0.8823529, 0, 1,
-0.9811269, 1.144885, -0.9055257, 1, 0.8862745, 0, 1,
-0.9798423, 0.2859504, 0.5103097, 1, 0.8941177, 0, 1,
-0.9580598, 1.3632, 0.3690604, 1, 0.8980392, 0, 1,
-0.9538559, 0.5793766, -1.619253, 1, 0.9058824, 0, 1,
-0.947785, -0.3179293, -3.122352, 1, 0.9137255, 0, 1,
-0.9442555, 1.243424, -0.6902141, 1, 0.9176471, 0, 1,
-0.9391046, 0.1151439, -1.537403, 1, 0.9254902, 0, 1,
-0.934545, -0.8998309, -3.158806, 1, 0.9294118, 0, 1,
-0.9307647, -1.239008, -2.635927, 1, 0.9372549, 0, 1,
-0.9278899, 0.7255289, 0.06761198, 1, 0.9411765, 0, 1,
-0.9273321, -0.3882097, -1.772732, 1, 0.9490196, 0, 1,
-0.9262996, 1.030408, -0.567502, 1, 0.9529412, 0, 1,
-0.9205111, -0.8659657, -3.037341, 1, 0.9607843, 0, 1,
-0.9192166, 0.5138424, -1.007145, 1, 0.9647059, 0, 1,
-0.9119656, -0.7247092, -0.7817165, 1, 0.972549, 0, 1,
-0.8986188, -0.7036428, -2.112971, 1, 0.9764706, 0, 1,
-0.8973016, 0.8382644, -2.281732, 1, 0.9843137, 0, 1,
-0.8937357, 1.739053, -0.4369359, 1, 0.9882353, 0, 1,
-0.8929765, -0.7512309, -2.574767, 1, 0.9960784, 0, 1,
-0.8827105, -1.000859, -3.183333, 0.9960784, 1, 0, 1,
-0.8753633, -0.1191697, -4.214404, 0.9921569, 1, 0, 1,
-0.8675675, 1.442817, -0.8021727, 0.9843137, 1, 0, 1,
-0.8659924, 0.2353627, -3.028019, 0.9803922, 1, 0, 1,
-0.8518181, -0.05280111, -2.27861, 0.972549, 1, 0, 1,
-0.8514688, -1.909754, -1.251394, 0.9686275, 1, 0, 1,
-0.8495368, 1.660479, -1.21008, 0.9607843, 1, 0, 1,
-0.8476428, 0.3896149, -2.992753, 0.9568627, 1, 0, 1,
-0.8416383, -1.404356, -3.578383, 0.9490196, 1, 0, 1,
-0.8409508, -0.6142924, -2.957576, 0.945098, 1, 0, 1,
-0.8353325, 1.000587, -3.717615, 0.9372549, 1, 0, 1,
-0.8339195, -0.2540339, -1.562093, 0.9333333, 1, 0, 1,
-0.8294587, 0.2895518, -2.658849, 0.9254902, 1, 0, 1,
-0.827544, 0.3889317, -1.514988, 0.9215686, 1, 0, 1,
-0.8173151, -1.155402, -3.079047, 0.9137255, 1, 0, 1,
-0.8166124, -0.2726778, -3.433417, 0.9098039, 1, 0, 1,
-0.8165385, -0.5558518, -1.160709, 0.9019608, 1, 0, 1,
-0.8112958, 1.036798, -0.8244901, 0.8941177, 1, 0, 1,
-0.8086627, -0.307234, -1.517694, 0.8901961, 1, 0, 1,
-0.8083813, -1.309582, -2.630905, 0.8823529, 1, 0, 1,
-0.8080776, -0.11091, -2.462391, 0.8784314, 1, 0, 1,
-0.8075711, -0.5311592, -3.641682, 0.8705882, 1, 0, 1,
-0.8064439, -0.0781366, -3.857568, 0.8666667, 1, 0, 1,
-0.8057531, 0.5244537, -0.9513424, 0.8588235, 1, 0, 1,
-0.8025968, -0.753117, -1.848578, 0.854902, 1, 0, 1,
-0.8010648, -0.05868119, -1.220132, 0.8470588, 1, 0, 1,
-0.7992822, 0.4051155, -1.797194, 0.8431373, 1, 0, 1,
-0.7980127, -0.9262132, -3.058093, 0.8352941, 1, 0, 1,
-0.7976946, 0.3426422, -1.197387, 0.8313726, 1, 0, 1,
-0.7965804, 0.4790738, -0.4428589, 0.8235294, 1, 0, 1,
-0.7956315, 2.558578, -2.056879, 0.8196079, 1, 0, 1,
-0.7884731, -0.7243338, -1.531793, 0.8117647, 1, 0, 1,
-0.775138, 0.5013859, -0.7433518, 0.8078431, 1, 0, 1,
-0.7738503, 1.092936, -0.652205, 0.8, 1, 0, 1,
-0.773808, 0.962112, -1.278288, 0.7921569, 1, 0, 1,
-0.7721941, 1.209322, -1.547103, 0.7882353, 1, 0, 1,
-0.7684358, 0.4329611, -1.149666, 0.7803922, 1, 0, 1,
-0.7675291, -1.279728, -1.477135, 0.7764706, 1, 0, 1,
-0.7664645, 0.05915992, -0.708599, 0.7686275, 1, 0, 1,
-0.7638969, -1.378067, -3.093009, 0.7647059, 1, 0, 1,
-0.7575768, 1.188592, -2.436961, 0.7568628, 1, 0, 1,
-0.7534969, -1.216487, -1.998112, 0.7529412, 1, 0, 1,
-0.7509666, 1.544703, 1.926542, 0.7450981, 1, 0, 1,
-0.7463503, -0.4202284, -2.02476, 0.7411765, 1, 0, 1,
-0.7451262, 0.9358449, -0.4907545, 0.7333333, 1, 0, 1,
-0.73747, -1.188854, -3.698678, 0.7294118, 1, 0, 1,
-0.7365151, -0.2978483, -2.231187, 0.7215686, 1, 0, 1,
-0.7355519, -0.6933565, -2.892247, 0.7176471, 1, 0, 1,
-0.7334258, -0.8603752, -3.126054, 0.7098039, 1, 0, 1,
-0.7331139, -0.2542169, -2.798558, 0.7058824, 1, 0, 1,
-0.7309223, 1.307302, -0.701899, 0.6980392, 1, 0, 1,
-0.7291748, 2.144565, 0.2980737, 0.6901961, 1, 0, 1,
-0.7259493, -0.9026436, -0.9957465, 0.6862745, 1, 0, 1,
-0.7201219, 1.131588, -0.1653164, 0.6784314, 1, 0, 1,
-0.7163245, -1.988693, -2.543907, 0.6745098, 1, 0, 1,
-0.7107884, -0.6197786, -2.212929, 0.6666667, 1, 0, 1,
-0.7103636, -0.6423048, -3.088742, 0.6627451, 1, 0, 1,
-0.7062806, 0.9367555, -0.9996005, 0.654902, 1, 0, 1,
-0.7045842, 1.158676, -1.63454, 0.6509804, 1, 0, 1,
-0.7040705, 1.059837, 0.9468824, 0.6431373, 1, 0, 1,
-0.7032486, -0.9804518, -2.733106, 0.6392157, 1, 0, 1,
-0.6984459, 1.57353, 0.8674693, 0.6313726, 1, 0, 1,
-0.6977779, -0.2723541, -0.5495795, 0.627451, 1, 0, 1,
-0.6972799, -0.406601, -2.403594, 0.6196079, 1, 0, 1,
-0.6961023, 1.122831, -3.542082, 0.6156863, 1, 0, 1,
-0.6948663, -2.331636, -3.149969, 0.6078432, 1, 0, 1,
-0.6870119, 0.5329159, -1.187489, 0.6039216, 1, 0, 1,
-0.6861125, 0.2088848, 0.7513874, 0.5960785, 1, 0, 1,
-0.6859013, 1.397456, -0.9168683, 0.5882353, 1, 0, 1,
-0.683688, 0.4793865, 0.5069823, 0.5843138, 1, 0, 1,
-0.6832675, 0.5430238, -1.786999, 0.5764706, 1, 0, 1,
-0.675958, 0.9289391, 0.07029648, 0.572549, 1, 0, 1,
-0.6740745, 0.1037894, -2.648122, 0.5647059, 1, 0, 1,
-0.6738552, 1.030696, 0.4054734, 0.5607843, 1, 0, 1,
-0.6718033, 0.5151039, 1.380291, 0.5529412, 1, 0, 1,
-0.6710993, -0.8366298, -3.878026, 0.5490196, 1, 0, 1,
-0.6704097, -0.4059002, -2.781862, 0.5411765, 1, 0, 1,
-0.6681547, -0.1796128, -0.5291613, 0.5372549, 1, 0, 1,
-0.6653053, -1.401418, -5.575313, 0.5294118, 1, 0, 1,
-0.6652331, -0.7436016, -2.826136, 0.5254902, 1, 0, 1,
-0.6617711, 1.50041, -0.5849493, 0.5176471, 1, 0, 1,
-0.6588523, -0.1691122, -1.90903, 0.5137255, 1, 0, 1,
-0.656412, -1.003632, -1.989718, 0.5058824, 1, 0, 1,
-0.6442577, -0.5391176, -2.643556, 0.5019608, 1, 0, 1,
-0.6436653, 0.6295076, -0.6134096, 0.4941176, 1, 0, 1,
-0.6340771, 0.001939797, -1.608599, 0.4862745, 1, 0, 1,
-0.6326638, -1.527441, -2.912286, 0.4823529, 1, 0, 1,
-0.6246234, -1.06166, -2.853559, 0.4745098, 1, 0, 1,
-0.6239277, -1.535251, -3.189894, 0.4705882, 1, 0, 1,
-0.6215184, -1.193139, -1.571384, 0.4627451, 1, 0, 1,
-0.6179304, 0.4800211, -1.459079, 0.4588235, 1, 0, 1,
-0.6160104, -0.156776, -3.030641, 0.4509804, 1, 0, 1,
-0.6130835, 0.4686808, -1.031897, 0.4470588, 1, 0, 1,
-0.6125301, 0.6148101, -1.438342, 0.4392157, 1, 0, 1,
-0.6098574, 1.196335, 1.048439, 0.4352941, 1, 0, 1,
-0.6092302, -1.423384, -1.127158, 0.427451, 1, 0, 1,
-0.6078385, 0.1533367, 0.9171456, 0.4235294, 1, 0, 1,
-0.6004981, 0.7660274, -1.2997, 0.4156863, 1, 0, 1,
-0.5999602, 0.8766608, -2.341166, 0.4117647, 1, 0, 1,
-0.5999286, -1.020798, -2.492227, 0.4039216, 1, 0, 1,
-0.5960946, -0.9869993, -4.438638, 0.3960784, 1, 0, 1,
-0.5934182, 0.407377, -2.179641, 0.3921569, 1, 0, 1,
-0.5875189, 1.273996, 1.38952, 0.3843137, 1, 0, 1,
-0.5836571, 0.6251437, 0.2927133, 0.3803922, 1, 0, 1,
-0.5794756, 0.7760525, 0.1626049, 0.372549, 1, 0, 1,
-0.5793934, -1.007584, -3.733862, 0.3686275, 1, 0, 1,
-0.5792086, 0.1303571, -1.912786, 0.3607843, 1, 0, 1,
-0.5768189, -0.5449196, -3.244837, 0.3568628, 1, 0, 1,
-0.5757228, -1.234689, -1.433712, 0.3490196, 1, 0, 1,
-0.5748535, -0.7290087, -2.793392, 0.345098, 1, 0, 1,
-0.5655949, -0.143853, -1.160046, 0.3372549, 1, 0, 1,
-0.5619595, 0.6692992, -0.8873753, 0.3333333, 1, 0, 1,
-0.5586771, 0.299126, -1.038394, 0.3254902, 1, 0, 1,
-0.5586095, 1.018354, 1.397102, 0.3215686, 1, 0, 1,
-0.5579302, 0.02094316, -3.522182, 0.3137255, 1, 0, 1,
-0.5547858, 0.5964719, -2.735681, 0.3098039, 1, 0, 1,
-0.5503783, -0.03258869, -1.606108, 0.3019608, 1, 0, 1,
-0.5486218, -0.06424046, -2.635918, 0.2941177, 1, 0, 1,
-0.5469776, -0.6691406, -1.0735, 0.2901961, 1, 0, 1,
-0.5450262, 1.856973, -0.05856995, 0.282353, 1, 0, 1,
-0.5438015, 0.1282043, -1.155214, 0.2784314, 1, 0, 1,
-0.539882, -0.5893828, -2.809682, 0.2705882, 1, 0, 1,
-0.5323998, 0.5462634, 0.1444935, 0.2666667, 1, 0, 1,
-0.5316536, 1.175385, -0.6441105, 0.2588235, 1, 0, 1,
-0.5287862, -0.4586417, -1.789072, 0.254902, 1, 0, 1,
-0.52718, -1.129979, -3.762186, 0.2470588, 1, 0, 1,
-0.5271368, 1.930029, -0.8236138, 0.2431373, 1, 0, 1,
-0.5253808, -0.02756711, -3.247132, 0.2352941, 1, 0, 1,
-0.5216223, -1.457919, -2.404841, 0.2313726, 1, 0, 1,
-0.5198805, -0.5971011, -3.569261, 0.2235294, 1, 0, 1,
-0.5128473, -1.454534, -2.303397, 0.2196078, 1, 0, 1,
-0.5007582, -0.9531107, -2.574543, 0.2117647, 1, 0, 1,
-0.4957793, 0.6423835, -0.6702516, 0.2078431, 1, 0, 1,
-0.494667, 1.319566, -1.520268, 0.2, 1, 0, 1,
-0.4919089, 0.1770427, -1.248574, 0.1921569, 1, 0, 1,
-0.4912721, -1.644951, -1.81717, 0.1882353, 1, 0, 1,
-0.4818738, -0.7732795, -2.623671, 0.1803922, 1, 0, 1,
-0.481033, 0.2343838, -1.173745, 0.1764706, 1, 0, 1,
-0.4792795, 1.440913, -0.384473, 0.1686275, 1, 0, 1,
-0.4745247, 1.624649, -0.4446137, 0.1647059, 1, 0, 1,
-0.4725848, 0.551245, 0.7112765, 0.1568628, 1, 0, 1,
-0.4711294, -0.4197147, -4.386441, 0.1529412, 1, 0, 1,
-0.4674164, -1.266647, -2.17097, 0.145098, 1, 0, 1,
-0.4673225, 0.9777008, 0.7064876, 0.1411765, 1, 0, 1,
-0.4638817, 0.09487385, -0.8327845, 0.1333333, 1, 0, 1,
-0.4618705, 0.7916451, -2.430841, 0.1294118, 1, 0, 1,
-0.460382, -1.116418, -2.336098, 0.1215686, 1, 0, 1,
-0.4560324, -1.787583, -3.120523, 0.1176471, 1, 0, 1,
-0.4555101, -1.305881, -2.491214, 0.1098039, 1, 0, 1,
-0.4472743, 0.8695673, -0.2194605, 0.1058824, 1, 0, 1,
-0.4468275, -0.2951208, -0.6079288, 0.09803922, 1, 0, 1,
-0.438746, -0.7051414, -2.038453, 0.09019608, 1, 0, 1,
-0.4257776, 1.166975, -1.23125, 0.08627451, 1, 0, 1,
-0.4254489, -0.7857732, -3.108912, 0.07843138, 1, 0, 1,
-0.4246798, 0.1244604, -2.268669, 0.07450981, 1, 0, 1,
-0.4217497, -0.3030406, -1.437496, 0.06666667, 1, 0, 1,
-0.4197754, 0.3738523, -2.104382, 0.0627451, 1, 0, 1,
-0.417209, 0.5081734, -0.5331632, 0.05490196, 1, 0, 1,
-0.416192, -0.9479249, -1.752039, 0.05098039, 1, 0, 1,
-0.4159487, -0.1650687, -1.668642, 0.04313726, 1, 0, 1,
-0.4152419, 1.641198, -1.308109, 0.03921569, 1, 0, 1,
-0.413515, -0.6912028, -3.362355, 0.03137255, 1, 0, 1,
-0.4065714, 1.237141, -1.071512, 0.02745098, 1, 0, 1,
-0.4031763, -0.05188939, -0.003868789, 0.01960784, 1, 0, 1,
-0.4014906, 0.5918605, -1.90388, 0.01568628, 1, 0, 1,
-0.4012083, 0.9826053, -0.4654474, 0.007843138, 1, 0, 1,
-0.4011454, 0.3901208, -0.546352, 0.003921569, 1, 0, 1,
-0.3968799, 0.0746333, -2.126441, 0, 1, 0.003921569, 1,
-0.3955648, -0.3009683, -0.1223815, 0, 1, 0.01176471, 1,
-0.3921953, 0.4897217, -0.4275754, 0, 1, 0.01568628, 1,
-0.3806216, 0.46165, -1.342601, 0, 1, 0.02352941, 1,
-0.3787264, -0.6952297, -2.333471, 0, 1, 0.02745098, 1,
-0.3781472, 0.05201202, 1.089375, 0, 1, 0.03529412, 1,
-0.3770155, 0.5814603, -0.9269871, 0, 1, 0.03921569, 1,
-0.375627, 0.4260321, -1.650702, 0, 1, 0.04705882, 1,
-0.375537, 0.9147997, -0.951525, 0, 1, 0.05098039, 1,
-0.3695149, 1.764668, -0.01583601, 0, 1, 0.05882353, 1,
-0.3666696, -1.533034, -3.732894, 0, 1, 0.0627451, 1,
-0.3625198, 0.5537935, -0.6947255, 0, 1, 0.07058824, 1,
-0.3553361, -1.038298, -2.826329, 0, 1, 0.07450981, 1,
-0.3508394, -0.254525, -2.58615, 0, 1, 0.08235294, 1,
-0.3499044, 0.257978, -1.745259, 0, 1, 0.08627451, 1,
-0.3466532, -0.4274978, -3.473992, 0, 1, 0.09411765, 1,
-0.3427541, 0.7773623, -0.3984042, 0, 1, 0.1019608, 1,
-0.3400947, -1.634968, -2.323827, 0, 1, 0.1058824, 1,
-0.3398668, -0.2044314, -2.902638, 0, 1, 0.1137255, 1,
-0.3387665, 0.881326, -0.4076757, 0, 1, 0.1176471, 1,
-0.3370941, 1.286657, 2.794607, 0, 1, 0.1254902, 1,
-0.3366929, 0.3578402, 0.1126475, 0, 1, 0.1294118, 1,
-0.3349464, -0.322276, -3.271008, 0, 1, 0.1372549, 1,
-0.3348072, -0.63145, -1.626335, 0, 1, 0.1411765, 1,
-0.3267435, -1.612998, -1.415515, 0, 1, 0.1490196, 1,
-0.3266783, -0.2463996, -2.103388, 0, 1, 0.1529412, 1,
-0.3255533, 0.6704127, -1.955325, 0, 1, 0.1607843, 1,
-0.3221325, -0.1659021, -2.809834, 0, 1, 0.1647059, 1,
-0.3196638, -0.1752523, -0.68321, 0, 1, 0.172549, 1,
-0.3179507, 0.8471349, -0.8878353, 0, 1, 0.1764706, 1,
-0.3179409, 0.3595513, -0.8841134, 0, 1, 0.1843137, 1,
-0.3161335, -0.4305144, -2.087663, 0, 1, 0.1882353, 1,
-0.3148291, -1.246273, -1.901268, 0, 1, 0.1960784, 1,
-0.3148121, 0.9217228, -1.574412, 0, 1, 0.2039216, 1,
-0.3146353, 2.152447, 0.4382718, 0, 1, 0.2078431, 1,
-0.3125364, -0.4539501, -3.284928, 0, 1, 0.2156863, 1,
-0.3013278, 0.7392777, 0.1379788, 0, 1, 0.2196078, 1,
-0.2917928, -0.127004, -1.924825, 0, 1, 0.227451, 1,
-0.290976, -0.3666389, -1.19051, 0, 1, 0.2313726, 1,
-0.2884577, 0.2533239, -1.453976, 0, 1, 0.2392157, 1,
-0.286497, -0.4626175, -3.019332, 0, 1, 0.2431373, 1,
-0.2819026, -0.06271234, -2.751514, 0, 1, 0.2509804, 1,
-0.2810765, 0.783967, 0.4321339, 0, 1, 0.254902, 1,
-0.2788368, -0.1367081, -1.763002, 0, 1, 0.2627451, 1,
-0.2777994, 1.731557, 0.401737, 0, 1, 0.2666667, 1,
-0.2745903, -0.2034026, -2.321328, 0, 1, 0.2745098, 1,
-0.271073, 0.5528615, 1.101214, 0, 1, 0.2784314, 1,
-0.2706113, 0.212027, -1.197219, 0, 1, 0.2862745, 1,
-0.2673828, 1.25539, -1.408413, 0, 1, 0.2901961, 1,
-0.2644893, -1.404192, -3.890416, 0, 1, 0.2980392, 1,
-0.263573, 0.9339437, -1.030457, 0, 1, 0.3058824, 1,
-0.2599339, -0.659536, -0.7972997, 0, 1, 0.3098039, 1,
-0.2581197, -0.4876225, -2.110836, 0, 1, 0.3176471, 1,
-0.2539554, -1.284039, -3.472607, 0, 1, 0.3215686, 1,
-0.2480841, -1.011891, -2.664982, 0, 1, 0.3294118, 1,
-0.243056, 0.06803446, -1.899428, 0, 1, 0.3333333, 1,
-0.242813, 1.143535, 0.09442956, 0, 1, 0.3411765, 1,
-0.2394388, -1.647714, -2.440132, 0, 1, 0.345098, 1,
-0.2348436, -0.5359275, -2.702888, 0, 1, 0.3529412, 1,
-0.2276067, -0.7253955, -0.3262432, 0, 1, 0.3568628, 1,
-0.2275713, -1.83779, -2.088387, 0, 1, 0.3647059, 1,
-0.2262162, -1.134978, -3.403954, 0, 1, 0.3686275, 1,
-0.2254193, -1.318494, -5.0202, 0, 1, 0.3764706, 1,
-0.221144, -1.855527, -2.770947, 0, 1, 0.3803922, 1,
-0.2208817, 0.9322562, -1.000073, 0, 1, 0.3882353, 1,
-0.2179534, -1.012453, -2.316101, 0, 1, 0.3921569, 1,
-0.2127466, 0.04473403, -0.2882861, 0, 1, 0.4, 1,
-0.2109377, 0.9876986, -1.859971, 0, 1, 0.4078431, 1,
-0.2086851, 1.759806, 1.022806, 0, 1, 0.4117647, 1,
-0.2079385, 0.0361468, -0.979913, 0, 1, 0.4196078, 1,
-0.2058514, 0.5999898, -1.055667, 0, 1, 0.4235294, 1,
-0.2035204, -0.7541316, -1.915826, 0, 1, 0.4313726, 1,
-0.1977354, -0.5342963, -2.82033, 0, 1, 0.4352941, 1,
-0.1962668, -0.3452531, -1.700799, 0, 1, 0.4431373, 1,
-0.1916157, 1.744334, 1.197728, 0, 1, 0.4470588, 1,
-0.1889289, 0.3852315, -1.154011, 0, 1, 0.454902, 1,
-0.1882866, 1.006683, -0.5346032, 0, 1, 0.4588235, 1,
-0.1882641, 2.145152, -1.392053, 0, 1, 0.4666667, 1,
-0.1855534, 0.3680942, -1.005936, 0, 1, 0.4705882, 1,
-0.18544, 0.007010861, -0.6232681, 0, 1, 0.4784314, 1,
-0.1844996, 0.4420301, -0.5617617, 0, 1, 0.4823529, 1,
-0.1834656, -0.7170455, -3.9041, 0, 1, 0.4901961, 1,
-0.1827079, -1.497295, -1.535523, 0, 1, 0.4941176, 1,
-0.1760177, -0.1437234, -1.628811, 0, 1, 0.5019608, 1,
-0.1673778, -0.7896062, -2.406589, 0, 1, 0.509804, 1,
-0.1642888, 0.7283031, -0.8951494, 0, 1, 0.5137255, 1,
-0.1629723, 0.4425814, -0.5655129, 0, 1, 0.5215687, 1,
-0.1619979, 0.4327049, -0.01059538, 0, 1, 0.5254902, 1,
-0.1618096, 1.313184, 0.07732531, 0, 1, 0.5333334, 1,
-0.1616914, -1.015361, -2.522504, 0, 1, 0.5372549, 1,
-0.1578345, -0.1206409, -1.787475, 0, 1, 0.5450981, 1,
-0.1534906, -0.2018397, -3.794049, 0, 1, 0.5490196, 1,
-0.1518986, -0.7911846, -3.565046, 0, 1, 0.5568628, 1,
-0.1516258, -1.306099, -2.267698, 0, 1, 0.5607843, 1,
-0.1483952, 1.58638, 0.5917767, 0, 1, 0.5686275, 1,
-0.1475538, -0.1441047, -2.176239, 0, 1, 0.572549, 1,
-0.1473625, 0.2306419, -0.9062314, 0, 1, 0.5803922, 1,
-0.1463305, -0.5229651, -2.466313, 0, 1, 0.5843138, 1,
-0.1405108, 0.6925318, 0.3025281, 0, 1, 0.5921569, 1,
-0.1358752, 0.8688988, 1.580003, 0, 1, 0.5960785, 1,
-0.1342839, 0.5163268, -0.9108758, 0, 1, 0.6039216, 1,
-0.1336123, -0.9269419, -3.57986, 0, 1, 0.6117647, 1,
-0.1163741, 1.496861, -1.794965, 0, 1, 0.6156863, 1,
-0.1157468, 1.230289, 0.03739114, 0, 1, 0.6235294, 1,
-0.1155913, -0.6303496, -5.798666, 0, 1, 0.627451, 1,
-0.1143299, 1.513273, 0.5576555, 0, 1, 0.6352941, 1,
-0.1117984, 0.4296678, 1.60966, 0, 1, 0.6392157, 1,
-0.1110195, -0.3328103, -1.419807, 0, 1, 0.6470588, 1,
-0.1031183, -1.08563, -2.348491, 0, 1, 0.6509804, 1,
-0.1016132, -0.820327, -3.888751, 0, 1, 0.6588235, 1,
-0.09868297, -0.3191703, -3.818401, 0, 1, 0.6627451, 1,
-0.09522637, 2.11107, 0.1713239, 0, 1, 0.6705883, 1,
-0.09420697, 1.712451, 0.2008256, 0, 1, 0.6745098, 1,
-0.09375021, 0.6039867, 1.430663, 0, 1, 0.682353, 1,
-0.09283215, -1.097973, -2.176975, 0, 1, 0.6862745, 1,
-0.08727702, -0.6613539, -4.384362, 0, 1, 0.6941177, 1,
-0.08225785, -1.087861, -2.663403, 0, 1, 0.7019608, 1,
-0.08205125, -0.6982886, -3.871941, 0, 1, 0.7058824, 1,
-0.08187915, 0.09719075, -0.1445922, 0, 1, 0.7137255, 1,
-0.07944458, 0.6697854, 0.8888612, 0, 1, 0.7176471, 1,
-0.07731722, 0.1526994, -0.7569125, 0, 1, 0.7254902, 1,
-0.07666975, -0.70647, -2.575403, 0, 1, 0.7294118, 1,
-0.07323056, 1.133959, 0.522576, 0, 1, 0.7372549, 1,
-0.07232185, 0.9056484, 0.227671, 0, 1, 0.7411765, 1,
-0.0710893, 0.3604164, -0.6497391, 0, 1, 0.7490196, 1,
-0.07066501, -0.4732046, -2.503488, 0, 1, 0.7529412, 1,
-0.06977751, 0.3584055, 0.173022, 0, 1, 0.7607843, 1,
-0.06149858, 0.4182578, 0.4321626, 0, 1, 0.7647059, 1,
-0.06108095, 0.2421387, -0.08121125, 0, 1, 0.772549, 1,
-0.05367404, 1.5914, -0.784221, 0, 1, 0.7764706, 1,
-0.05336896, -1.204705, -4.733558, 0, 1, 0.7843137, 1,
-0.05216487, -0.7078912, -3.575336, 0, 1, 0.7882353, 1,
-0.04746644, 1.307234, -1.228212, 0, 1, 0.7960784, 1,
-0.04576841, -0.2614494, -2.357694, 0, 1, 0.8039216, 1,
-0.04193095, -0.09134264, -3.658982, 0, 1, 0.8078431, 1,
-0.03632659, -0.1887429, -3.379429, 0, 1, 0.8156863, 1,
-0.03443358, 1.338511, 0.2108469, 0, 1, 0.8196079, 1,
-0.03136773, -0.2546185, -2.591898, 0, 1, 0.827451, 1,
-0.02858442, -0.3275559, -2.478835, 0, 1, 0.8313726, 1,
-0.02852001, 1.99523, 1.534428, 0, 1, 0.8392157, 1,
-0.02725055, -0.8095471, -1.657831, 0, 1, 0.8431373, 1,
-0.02533085, -0.2748636, -3.21977, 0, 1, 0.8509804, 1,
-0.02432362, -0.04933435, -1.811298, 0, 1, 0.854902, 1,
-0.01767916, -1.483891, -2.736467, 0, 1, 0.8627451, 1,
-0.01489569, 0.4535744, 0.4807979, 0, 1, 0.8666667, 1,
-0.008488448, 0.00633118, -1.155212, 0, 1, 0.8745098, 1,
-0.006487052, 0.492343, -0.5328418, 0, 1, 0.8784314, 1,
-0.00494764, 0.1964415, 0.2074029, 0, 1, 0.8862745, 1,
0.002146391, -0.04170812, 3.758295, 0, 1, 0.8901961, 1,
0.003983628, -1.495131, 3.327531, 0, 1, 0.8980392, 1,
0.007645993, 0.6239712, -0.5745332, 0, 1, 0.9058824, 1,
0.009469938, 0.8557057, -0.08127991, 0, 1, 0.9098039, 1,
0.01004121, 0.3004116, -0.09428973, 0, 1, 0.9176471, 1,
0.01463386, -1.588834, 3.816994, 0, 1, 0.9215686, 1,
0.01472466, 1.665191, 0.89259, 0, 1, 0.9294118, 1,
0.01647587, 0.4727842, 1.25814, 0, 1, 0.9333333, 1,
0.02327055, 0.6412268, 1.410949, 0, 1, 0.9411765, 1,
0.03052398, 0.06264195, -0.03963597, 0, 1, 0.945098, 1,
0.03134244, 1.329499, 0.3618565, 0, 1, 0.9529412, 1,
0.03242332, -1.574154, 2.534621, 0, 1, 0.9568627, 1,
0.03352849, 0.9744666, -0.7620882, 0, 1, 0.9647059, 1,
0.03512896, -0.9608451, 3.417783, 0, 1, 0.9686275, 1,
0.03725451, 0.179921, 2.251399, 0, 1, 0.9764706, 1,
0.03757425, -0.349157, 2.813411, 0, 1, 0.9803922, 1,
0.05176646, 0.0919344, 0.5531998, 0, 1, 0.9882353, 1,
0.05225568, -0.1069498, 4.195359, 0, 1, 0.9921569, 1,
0.05380685, -0.02073001, 3.432879, 0, 1, 1, 1,
0.05822618, 1.290665, -0.9359866, 0, 0.9921569, 1, 1,
0.05859834, 0.8934874, 1.139814, 0, 0.9882353, 1, 1,
0.05971848, -0.5331367, 3.059402, 0, 0.9803922, 1, 1,
0.06072692, 0.2846206, 1.298898, 0, 0.9764706, 1, 1,
0.06216177, 0.2414193, -0.6246456, 0, 0.9686275, 1, 1,
0.06446193, -1.095741, 2.434037, 0, 0.9647059, 1, 1,
0.06649502, 1.646552, -0.862775, 0, 0.9568627, 1, 1,
0.06830722, 1.032211, -0.9596396, 0, 0.9529412, 1, 1,
0.06943074, 1.068748, -0.3888853, 0, 0.945098, 1, 1,
0.07071376, -0.4123437, 2.658968, 0, 0.9411765, 1, 1,
0.07116194, -2.123563, 3.021279, 0, 0.9333333, 1, 1,
0.07359009, -0.8728405, 3.835028, 0, 0.9294118, 1, 1,
0.07990382, -0.01690487, 0.4188644, 0, 0.9215686, 1, 1,
0.08232184, 1.901773, 0.171336, 0, 0.9176471, 1, 1,
0.08343604, 1.650468, -1.421227, 0, 0.9098039, 1, 1,
0.0856808, -0.1980932, 4.386394, 0, 0.9058824, 1, 1,
0.08582602, -0.696585, 2.78582, 0, 0.8980392, 1, 1,
0.08640315, 0.5672191, 1.287799, 0, 0.8901961, 1, 1,
0.08672561, 2.084124, -0.6519141, 0, 0.8862745, 1, 1,
0.0879878, 0.5182005, 1.603528, 0, 0.8784314, 1, 1,
0.09290498, 0.2516145, 2.370778, 0, 0.8745098, 1, 1,
0.09543968, 0.04863718, 0.6457456, 0, 0.8666667, 1, 1,
0.09941296, 1.605316, -0.224513, 0, 0.8627451, 1, 1,
0.1015885, -0.5351968, 2.164453, 0, 0.854902, 1, 1,
0.1033015, -0.6801561, 1.856155, 0, 0.8509804, 1, 1,
0.1110042, -0.6108925, 2.017016, 0, 0.8431373, 1, 1,
0.1138555, 1.561665, -0.8928862, 0, 0.8392157, 1, 1,
0.117154, 1.216087, 1.001234, 0, 0.8313726, 1, 1,
0.1174521, -0.532968, 2.84878, 0, 0.827451, 1, 1,
0.1178186, -1.899208, 2.214202, 0, 0.8196079, 1, 1,
0.1186355, 0.4634663, -0.299089, 0, 0.8156863, 1, 1,
0.1242952, 1.701506, 2.051908, 0, 0.8078431, 1, 1,
0.1266654, -2.387189, 2.636601, 0, 0.8039216, 1, 1,
0.1321064, -0.6906604, 2.857947, 0, 0.7960784, 1, 1,
0.1415433, -1.260809, 3.101174, 0, 0.7882353, 1, 1,
0.1451002, -0.6555787, 2.879869, 0, 0.7843137, 1, 1,
0.1523462, 1.319068, 1.043352, 0, 0.7764706, 1, 1,
0.153201, -0.5181237, 2.353368, 0, 0.772549, 1, 1,
0.1550127, 1.285272, 0.8977506, 0, 0.7647059, 1, 1,
0.1557037, -1.28857, 1.356714, 0, 0.7607843, 1, 1,
0.1568221, -1.86379, 2.714386, 0, 0.7529412, 1, 1,
0.1592975, 1.709769, -1.24739, 0, 0.7490196, 1, 1,
0.1597511, 1.870701, 0.644667, 0, 0.7411765, 1, 1,
0.1604718, -0.4446005, 1.370148, 0, 0.7372549, 1, 1,
0.1610062, 1.075482, -0.5794755, 0, 0.7294118, 1, 1,
0.1612269, -0.07041971, 2.470265, 0, 0.7254902, 1, 1,
0.1651361, -0.5756327, 3.541829, 0, 0.7176471, 1, 1,
0.1653559, 0.1523282, 0.5016572, 0, 0.7137255, 1, 1,
0.1689637, 0.6415314, -0.06442666, 0, 0.7058824, 1, 1,
0.1710315, 0.4708033, -1.775442, 0, 0.6980392, 1, 1,
0.1711734, -0.5808097, 2.346001, 0, 0.6941177, 1, 1,
0.1790029, 0.01702218, 2.506477, 0, 0.6862745, 1, 1,
0.1822633, -0.09088084, 1.715334, 0, 0.682353, 1, 1,
0.1888853, 0.7174996, -1.357304, 0, 0.6745098, 1, 1,
0.1948838, -1.292178, 2.379057, 0, 0.6705883, 1, 1,
0.1951482, 2.61944, -0.3516652, 0, 0.6627451, 1, 1,
0.1965928, 0.00945723, 3.178439, 0, 0.6588235, 1, 1,
0.1985511, -0.1526061, 0.7397189, 0, 0.6509804, 1, 1,
0.1985847, -1.157062, 3.293926, 0, 0.6470588, 1, 1,
0.1998286, 0.7859724, 0.9085498, 0, 0.6392157, 1, 1,
0.20786, -1.659617, 2.983561, 0, 0.6352941, 1, 1,
0.2086246, 0.4381201, 1.212106, 0, 0.627451, 1, 1,
0.2147746, -0.5295215, 2.950883, 0, 0.6235294, 1, 1,
0.2161694, -1.32048, 4.675067, 0, 0.6156863, 1, 1,
0.2162594, 0.5065279, -0.2228608, 0, 0.6117647, 1, 1,
0.2173028, 0.4172535, 0.07459386, 0, 0.6039216, 1, 1,
0.2192387, -0.5589674, 2.498229, 0, 0.5960785, 1, 1,
0.2259742, -0.2775306, 3.582977, 0, 0.5921569, 1, 1,
0.2262132, 0.09720179, 2.19515, 0, 0.5843138, 1, 1,
0.2281835, 0.4481227, -0.8611752, 0, 0.5803922, 1, 1,
0.228739, 1.184798, -0.5948274, 0, 0.572549, 1, 1,
0.2302113, 0.6895996, 1.259977, 0, 0.5686275, 1, 1,
0.2325349, 0.0416473, -1.008622, 0, 0.5607843, 1, 1,
0.2340856, 1.403083, -0.09776278, 0, 0.5568628, 1, 1,
0.2345049, 0.5748459, 0.2135867, 0, 0.5490196, 1, 1,
0.2366153, 0.21754, 1.669834, 0, 0.5450981, 1, 1,
0.2464943, 0.6378532, 1.240499, 0, 0.5372549, 1, 1,
0.2552112, -0.9827521, 2.263805, 0, 0.5333334, 1, 1,
0.2553748, 1.626676, -1.91788, 0, 0.5254902, 1, 1,
0.2565657, 1.078805, 0.2101937, 0, 0.5215687, 1, 1,
0.2606641, -0.06881839, 0.3184579, 0, 0.5137255, 1, 1,
0.2660027, -0.1221276, 2.527311, 0, 0.509804, 1, 1,
0.2661022, -0.237895, 1.554059, 0, 0.5019608, 1, 1,
0.2663403, 0.3530261, -0.3025487, 0, 0.4941176, 1, 1,
0.2664358, -0.2002839, 4.125192, 0, 0.4901961, 1, 1,
0.2672514, -2.3502, 2.663635, 0, 0.4823529, 1, 1,
0.2687652, -0.6476129, -0.006921911, 0, 0.4784314, 1, 1,
0.2702766, 0.1561048, 1.017019, 0, 0.4705882, 1, 1,
0.2704806, 0.8162526, -1.19489, 0, 0.4666667, 1, 1,
0.2750238, -0.3923658, 2.645834, 0, 0.4588235, 1, 1,
0.2779844, 0.4364958, 0.719337, 0, 0.454902, 1, 1,
0.283373, -0.1860243, 2.655022, 0, 0.4470588, 1, 1,
0.2842229, 0.8160305, 0.6467419, 0, 0.4431373, 1, 1,
0.2849587, -0.2199213, 2.058781, 0, 0.4352941, 1, 1,
0.2893882, 0.05090957, 2.708611, 0, 0.4313726, 1, 1,
0.2903553, 1.899122, 0.9835647, 0, 0.4235294, 1, 1,
0.2920164, -1.002452, 2.209334, 0, 0.4196078, 1, 1,
0.2962098, 1.094388, -0.5708359, 0, 0.4117647, 1, 1,
0.3027761, 0.1868664, 3.858851, 0, 0.4078431, 1, 1,
0.3051938, -1.814252, 0.9435283, 0, 0.4, 1, 1,
0.309159, 1.137009, 1.41426, 0, 0.3921569, 1, 1,
0.3130866, -0.9435285, 1.445908, 0, 0.3882353, 1, 1,
0.3133508, -0.02235414, 3.006171, 0, 0.3803922, 1, 1,
0.3151284, -1.344521, 1.098614, 0, 0.3764706, 1, 1,
0.3197798, -2.536068, 2.372599, 0, 0.3686275, 1, 1,
0.3214673, 0.8440431, -0.3945231, 0, 0.3647059, 1, 1,
0.3234315, 0.9037613, 0.2515756, 0, 0.3568628, 1, 1,
0.3237541, -0.3184424, 3.211792, 0, 0.3529412, 1, 1,
0.3278912, 1.314445, -0.1006774, 0, 0.345098, 1, 1,
0.3283223, -1.320837, 2.011917, 0, 0.3411765, 1, 1,
0.3326912, 0.7913499, -0.1936536, 0, 0.3333333, 1, 1,
0.3329906, -0.5639106, 3.889709, 0, 0.3294118, 1, 1,
0.3343059, -0.3779934, 1.245786, 0, 0.3215686, 1, 1,
0.3366286, -0.2257817, 2.872224, 0, 0.3176471, 1, 1,
0.3391709, -0.1769895, 2.82004, 0, 0.3098039, 1, 1,
0.3401505, -0.6549283, 2.765472, 0, 0.3058824, 1, 1,
0.3407104, 0.1425181, 0.8101324, 0, 0.2980392, 1, 1,
0.342011, 0.2131906, 1.979345, 0, 0.2901961, 1, 1,
0.3434483, 1.351806, 1.76084, 0, 0.2862745, 1, 1,
0.3451675, 1.141518, 0.9342028, 0, 0.2784314, 1, 1,
0.3462071, 0.4045143, 1.841731, 0, 0.2745098, 1, 1,
0.3494696, 0.8067267, 0.7338335, 0, 0.2666667, 1, 1,
0.3506857, 1.288502, 0.527012, 0, 0.2627451, 1, 1,
0.3535518, -1.45662, 2.923174, 0, 0.254902, 1, 1,
0.3613597, 0.2692979, 3.097235, 0, 0.2509804, 1, 1,
0.3625168, 1.030457, 1.02204, 0, 0.2431373, 1, 1,
0.3643582, -1.188789, 1.91545, 0, 0.2392157, 1, 1,
0.3678782, 0.3494904, 1.171109, 0, 0.2313726, 1, 1,
0.3705802, 0.6342737, -0.6528639, 0, 0.227451, 1, 1,
0.3729947, -0.6037056, 2.726279, 0, 0.2196078, 1, 1,
0.3737152, 1.018195, -1.628794, 0, 0.2156863, 1, 1,
0.3803897, -1.126795, 1.737735, 0, 0.2078431, 1, 1,
0.3813249, -0.5234926, 1.51756, 0, 0.2039216, 1, 1,
0.3929072, 0.9911951, -0.2364754, 0, 0.1960784, 1, 1,
0.3932365, -1.387861, 3.32922, 0, 0.1882353, 1, 1,
0.3935982, 0.902597, 0.6764914, 0, 0.1843137, 1, 1,
0.3975166, -1.661909, 2.829904, 0, 0.1764706, 1, 1,
0.4063787, 0.05717163, 1.605563, 0, 0.172549, 1, 1,
0.4088538, 0.05244857, 1.419825, 0, 0.1647059, 1, 1,
0.4127041, -0.2931907, 1.609622, 0, 0.1607843, 1, 1,
0.4150389, 0.787001, 1.285781, 0, 0.1529412, 1, 1,
0.4150858, 0.3003798, 0.8833994, 0, 0.1490196, 1, 1,
0.4210356, -0.7176504, 2.14695, 0, 0.1411765, 1, 1,
0.4216608, -1.047759, 0.9101449, 0, 0.1372549, 1, 1,
0.4228365, 1.81554, 1.677311, 0, 0.1294118, 1, 1,
0.4229988, -0.1325693, 2.384442, 0, 0.1254902, 1, 1,
0.4290457, -1.125874, 3.023139, 0, 0.1176471, 1, 1,
0.4318803, -2.116728, 2.82563, 0, 0.1137255, 1, 1,
0.4323801, -0.2087512, 1.395732, 0, 0.1058824, 1, 1,
0.4342711, -0.6067013, 2.420548, 0, 0.09803922, 1, 1,
0.4350243, 0.2089726, 2.060308, 0, 0.09411765, 1, 1,
0.4356207, 1.461987, -1.096275, 0, 0.08627451, 1, 1,
0.4374741, 0.9743015, -1.301821, 0, 0.08235294, 1, 1,
0.4380812, -1.454824, 3.568747, 0, 0.07450981, 1, 1,
0.4389102, 0.4579434, -0.8171819, 0, 0.07058824, 1, 1,
0.4405147, 0.2900329, 0.1338181, 0, 0.0627451, 1, 1,
0.4419152, -1.020031, 0.7617291, 0, 0.05882353, 1, 1,
0.4464922, 0.1183616, 1.424199, 0, 0.05098039, 1, 1,
0.4481257, 0.5908599, 1.142984, 0, 0.04705882, 1, 1,
0.4486314, 0.775775, 1.529671, 0, 0.03921569, 1, 1,
0.4491425, 2.30602, -0.7426689, 0, 0.03529412, 1, 1,
0.4573438, -1.271875, 2.126569, 0, 0.02745098, 1, 1,
0.4577618, 0.4571153, 1.389155, 0, 0.02352941, 1, 1,
0.4580691, -1.351996, 2.216059, 0, 0.01568628, 1, 1,
0.4721887, -1.731438, 3.75101, 0, 0.01176471, 1, 1,
0.472793, -0.9854105, 2.640838, 0, 0.003921569, 1, 1,
0.4781267, 0.8149291, -0.7880339, 0.003921569, 0, 1, 1,
0.4782553, -0.04175262, 3.143074, 0.007843138, 0, 1, 1,
0.4884341, -1.270504, 3.741313, 0.01568628, 0, 1, 1,
0.4886087, -1.136999, 1.345208, 0.01960784, 0, 1, 1,
0.4893954, 0.148099, 0.01545058, 0.02745098, 0, 1, 1,
0.4897053, 0.6289878, -0.2643569, 0.03137255, 0, 1, 1,
0.4900388, 0.7323731, -0.9811581, 0.03921569, 0, 1, 1,
0.4931141, -0.6896973, 1.941727, 0.04313726, 0, 1, 1,
0.4991771, 0.08947217, 0.7244453, 0.05098039, 0, 1, 1,
0.4996825, 0.1575335, 1.078136, 0.05490196, 0, 1, 1,
0.5007309, -0.9982465, 1.46118, 0.0627451, 0, 1, 1,
0.5049172, 1.339673, -0.1823968, 0.06666667, 0, 1, 1,
0.5051044, 1.160439, 1.201521, 0.07450981, 0, 1, 1,
0.5056623, 0.1557137, 1.729637, 0.07843138, 0, 1, 1,
0.5070767, -1.697735, 4.813104, 0.08627451, 0, 1, 1,
0.5113663, -0.3735116, 1.361114, 0.09019608, 0, 1, 1,
0.5129639, -0.2248533, 2.492685, 0.09803922, 0, 1, 1,
0.5136928, 0.0200987, 0.4686043, 0.1058824, 0, 1, 1,
0.5153824, -0.9515334, 4.362486, 0.1098039, 0, 1, 1,
0.5204984, 0.5793335, 1.161078, 0.1176471, 0, 1, 1,
0.5210938, 0.1553767, 0.6077285, 0.1215686, 0, 1, 1,
0.5221659, 0.5122173, 2.498004, 0.1294118, 0, 1, 1,
0.5252977, -0.622355, 1.435534, 0.1333333, 0, 1, 1,
0.528334, -0.06740553, 2.925869, 0.1411765, 0, 1, 1,
0.5357225, 0.7511103, 0.05953414, 0.145098, 0, 1, 1,
0.5392572, 1.06333, 0.3809788, 0.1529412, 0, 1, 1,
0.5411886, 1.235098, 0.7174749, 0.1568628, 0, 1, 1,
0.5442965, -0.203985, 1.619447, 0.1647059, 0, 1, 1,
0.5449357, 1.006323, 0.7628383, 0.1686275, 0, 1, 1,
0.5470356, -0.8468469, 2.541972, 0.1764706, 0, 1, 1,
0.5524534, -0.5828285, 2.660157, 0.1803922, 0, 1, 1,
0.5533569, -0.3830299, 1.062971, 0.1882353, 0, 1, 1,
0.5534177, -0.4023022, -0.2371987, 0.1921569, 0, 1, 1,
0.5612083, 0.5753098, 1.166918, 0.2, 0, 1, 1,
0.5680484, -1.133386, 4.184675, 0.2078431, 0, 1, 1,
0.568835, -1.664604, 3.025807, 0.2117647, 0, 1, 1,
0.5755661, -0.209951, 2.412098, 0.2196078, 0, 1, 1,
0.5800903, 0.6207734, -0.3924982, 0.2235294, 0, 1, 1,
0.5894076, 0.6253408, 1.330954, 0.2313726, 0, 1, 1,
0.5895944, -1.881811, 1.992807, 0.2352941, 0, 1, 1,
0.5940313, 0.9379274, 1.461326, 0.2431373, 0, 1, 1,
0.5942033, -0.8245355, 2.708616, 0.2470588, 0, 1, 1,
0.6000894, 0.03897002, 1.472357, 0.254902, 0, 1, 1,
0.6011175, -1.407725, 2.918898, 0.2588235, 0, 1, 1,
0.6068708, -0.04569003, 2.758485, 0.2666667, 0, 1, 1,
0.6119657, -2.57084, 3.722507, 0.2705882, 0, 1, 1,
0.6161559, -0.2396632, 1.608037, 0.2784314, 0, 1, 1,
0.6167706, -0.2465219, 1.841876, 0.282353, 0, 1, 1,
0.6199049, -1.17254, 3.095215, 0.2901961, 0, 1, 1,
0.6265561, 2.935446, 0.6026393, 0.2941177, 0, 1, 1,
0.6310341, 1.389317, 0.737507, 0.3019608, 0, 1, 1,
0.6331448, 1.239511, 1.170674, 0.3098039, 0, 1, 1,
0.6354813, -1.299784, 2.687158, 0.3137255, 0, 1, 1,
0.6367389, 1.195245, 1.285953, 0.3215686, 0, 1, 1,
0.6370323, 0.02636312, 1.80356, 0.3254902, 0, 1, 1,
0.6455967, -0.1468621, 2.313538, 0.3333333, 0, 1, 1,
0.6463965, -0.2309925, 2.82553, 0.3372549, 0, 1, 1,
0.6509041, -1.695279, 3.453697, 0.345098, 0, 1, 1,
0.6520368, 0.01153114, 1.884923, 0.3490196, 0, 1, 1,
0.6520877, -0.3907911, 1.407826, 0.3568628, 0, 1, 1,
0.6544988, 0.2355552, -0.3588271, 0.3607843, 0, 1, 1,
0.6549397, -0.5611687, 1.97701, 0.3686275, 0, 1, 1,
0.6577652, 0.5265379, 1.054373, 0.372549, 0, 1, 1,
0.6623791, -0.8854198, 3.033827, 0.3803922, 0, 1, 1,
0.6667501, -0.6175122, 2.978345, 0.3843137, 0, 1, 1,
0.669809, 0.3410881, 0.88467, 0.3921569, 0, 1, 1,
0.6803896, 0.2342835, 1.369412, 0.3960784, 0, 1, 1,
0.6838107, -1.144082, 2.916792, 0.4039216, 0, 1, 1,
0.6851218, 0.2064926, -0.1410459, 0.4117647, 0, 1, 1,
0.6852661, -0.4012133, 1.904726, 0.4156863, 0, 1, 1,
0.6878282, 0.06155406, 2.475168, 0.4235294, 0, 1, 1,
0.688326, -0.2055458, 2.721077, 0.427451, 0, 1, 1,
0.6899616, 0.9849697, -0.1140016, 0.4352941, 0, 1, 1,
0.7001988, 1.469826, -0.1436363, 0.4392157, 0, 1, 1,
0.7034479, -0.1060691, 1.738203, 0.4470588, 0, 1, 1,
0.7046555, -0.002957576, 1.002681, 0.4509804, 0, 1, 1,
0.7054669, -0.01201044, 4.354075, 0.4588235, 0, 1, 1,
0.7066228, 0.1762473, 0.6558496, 0.4627451, 0, 1, 1,
0.707076, 0.6968584, 2.359879, 0.4705882, 0, 1, 1,
0.7089414, -0.348247, 1.373921, 0.4745098, 0, 1, 1,
0.7109598, -0.02644042, 1.524327, 0.4823529, 0, 1, 1,
0.7151922, 0.5677307, 0.6812698, 0.4862745, 0, 1, 1,
0.7157771, 0.2808087, 3.290382, 0.4941176, 0, 1, 1,
0.7186723, -0.6275139, 3.851269, 0.5019608, 0, 1, 1,
0.7250241, -0.749483, 3.629517, 0.5058824, 0, 1, 1,
0.7302116, -0.4206951, 2.202237, 0.5137255, 0, 1, 1,
0.7321023, 0.7759295, 1.572939, 0.5176471, 0, 1, 1,
0.7326969, 0.4793417, 1.365917, 0.5254902, 0, 1, 1,
0.73712, 1.624604, -0.9595678, 0.5294118, 0, 1, 1,
0.7372164, -0.7038199, 3.596258, 0.5372549, 0, 1, 1,
0.7418951, 0.5649859, 3.388253, 0.5411765, 0, 1, 1,
0.7441533, 0.2806754, 1.149685, 0.5490196, 0, 1, 1,
0.7458546, -0.7996134, 3.93175, 0.5529412, 0, 1, 1,
0.7483631, -0.7690265, 3.252501, 0.5607843, 0, 1, 1,
0.7553315, 0.1393285, 2.659206, 0.5647059, 0, 1, 1,
0.7570354, -0.01531846, 0.2524771, 0.572549, 0, 1, 1,
0.7575901, -1.061405, -0.2849962, 0.5764706, 0, 1, 1,
0.7600787, -1.749747, 2.800891, 0.5843138, 0, 1, 1,
0.7603887, 0.1708041, 0.8596858, 0.5882353, 0, 1, 1,
0.7660767, -1.321686, 3.314825, 0.5960785, 0, 1, 1,
0.7661126, -0.8788089, 3.191839, 0.6039216, 0, 1, 1,
0.7761233, 1.647958, -0.1049281, 0.6078432, 0, 1, 1,
0.7762769, 0.3216496, 2.202427, 0.6156863, 0, 1, 1,
0.7767944, -0.1816667, 0.5406318, 0.6196079, 0, 1, 1,
0.7772316, -0.8390516, 2.389213, 0.627451, 0, 1, 1,
0.7820435, -0.3151228, 1.712491, 0.6313726, 0, 1, 1,
0.8007919, 1.234087, 1.918252, 0.6392157, 0, 1, 1,
0.8041988, -0.9860918, 1.824131, 0.6431373, 0, 1, 1,
0.807835, 1.149164, 1.308586, 0.6509804, 0, 1, 1,
0.8079249, 0.07473077, -0.8478376, 0.654902, 0, 1, 1,
0.8113944, 0.4406283, 1.20599, 0.6627451, 0, 1, 1,
0.8157009, -0.4450198, 2.355146, 0.6666667, 0, 1, 1,
0.8223643, 0.9388969, 1.918326, 0.6745098, 0, 1, 1,
0.824914, -0.7207443, 1.224606, 0.6784314, 0, 1, 1,
0.8273948, -0.2892725, 2.759928, 0.6862745, 0, 1, 1,
0.8287274, 0.4144105, 0.6792105, 0.6901961, 0, 1, 1,
0.8295875, -0.3924498, 2.312504, 0.6980392, 0, 1, 1,
0.8315392, 0.8076662, 0.7227896, 0.7058824, 0, 1, 1,
0.8337771, -1.036145, 2.602855, 0.7098039, 0, 1, 1,
0.8357093, 1.667782, -2.459768, 0.7176471, 0, 1, 1,
0.8434564, 0.6314604, 0.4810559, 0.7215686, 0, 1, 1,
0.848381, 0.4352202, 0.3442393, 0.7294118, 0, 1, 1,
0.850965, 0.8604478, 1.15213, 0.7333333, 0, 1, 1,
0.8589552, -0.8305871, 2.379448, 0.7411765, 0, 1, 1,
0.8614374, -1.820766, 3.916138, 0.7450981, 0, 1, 1,
0.8631195, -0.3878501, 1.932701, 0.7529412, 0, 1, 1,
0.8755915, -0.9888914, 3.268816, 0.7568628, 0, 1, 1,
0.8762164, 0.6776657, -0.4112869, 0.7647059, 0, 1, 1,
0.8765248, -0.7185336, 2.629948, 0.7686275, 0, 1, 1,
0.8896415, 1.036431, 1.564399, 0.7764706, 0, 1, 1,
0.9006268, -0.00530397, 3.289792, 0.7803922, 0, 1, 1,
0.9016623, -0.2876509, 1.775464, 0.7882353, 0, 1, 1,
0.9048781, 0.3125268, 2.812214, 0.7921569, 0, 1, 1,
0.905127, 0.5933368, -0.7629707, 0.8, 0, 1, 1,
0.9141487, 0.1731082, 0.6309607, 0.8078431, 0, 1, 1,
0.9156799, 0.08698551, 3.53604, 0.8117647, 0, 1, 1,
0.9170113, -0.2958826, 1.158341, 0.8196079, 0, 1, 1,
0.9230631, 0.4958108, 1.884481, 0.8235294, 0, 1, 1,
0.9255394, 1.319397, 0.8912529, 0.8313726, 0, 1, 1,
0.9267035, 1.508567, 0.9956696, 0.8352941, 0, 1, 1,
0.9313216, -0.5196807, 2.322328, 0.8431373, 0, 1, 1,
0.9323798, 0.5554657, 0.05172375, 0.8470588, 0, 1, 1,
0.9353853, -0.2350273, -0.09359516, 0.854902, 0, 1, 1,
0.9369073, -0.1943145, 0.7051091, 0.8588235, 0, 1, 1,
0.9382712, 1.646326, 0.7752528, 0.8666667, 0, 1, 1,
0.9427237, 0.8654407, 1.310416, 0.8705882, 0, 1, 1,
0.9434638, -0.2166358, 1.257774, 0.8784314, 0, 1, 1,
0.948432, -0.5283045, 2.729317, 0.8823529, 0, 1, 1,
0.9492322, 0.8985784, 0.6228845, 0.8901961, 0, 1, 1,
0.9531226, -1.348016, 3.764364, 0.8941177, 0, 1, 1,
0.9542216, -0.7890384, 1.626151, 0.9019608, 0, 1, 1,
0.9575586, -0.8887422, 3.134696, 0.9098039, 0, 1, 1,
0.958127, 0.827259, -0.6673429, 0.9137255, 0, 1, 1,
0.9615253, -0.2706756, 2.946115, 0.9215686, 0, 1, 1,
0.9634088, 1.641492, 0.7761164, 0.9254902, 0, 1, 1,
0.964851, 0.7558797, 2.863225, 0.9333333, 0, 1, 1,
0.9677879, -1.247856, 3.222243, 0.9372549, 0, 1, 1,
0.9697075, -1.550377, 1.528694, 0.945098, 0, 1, 1,
0.9743501, -0.2005185, 2.208638, 0.9490196, 0, 1, 1,
0.9750555, 1.646773, 2.460815, 0.9568627, 0, 1, 1,
0.978547, -1.116358, 3.071439, 0.9607843, 0, 1, 1,
0.9909416, -0.270186, 0.05255361, 0.9686275, 0, 1, 1,
0.9913623, 0.4476133, -0.7568167, 0.972549, 0, 1, 1,
0.9924482, 1.024433, 1.172351, 0.9803922, 0, 1, 1,
0.9939406, -0.007867108, 0.6905783, 0.9843137, 0, 1, 1,
1.003101, 1.852648, -0.9672977, 0.9921569, 0, 1, 1,
1.00338, 0.6377222, 0.7798652, 0.9960784, 0, 1, 1,
1.003771, 0.007685992, 2.113176, 1, 0, 0.9960784, 1,
1.014757, 0.7845906, 3.005125, 1, 0, 0.9882353, 1,
1.024956, -0.04337785, 2.115531, 1, 0, 0.9843137, 1,
1.028087, 0.1477068, 1.00009, 1, 0, 0.9764706, 1,
1.043399, -1.089398, 2.512181, 1, 0, 0.972549, 1,
1.043879, 0.2330311, 1.369012, 1, 0, 0.9647059, 1,
1.043893, -0.9078284, 3.601816, 1, 0, 0.9607843, 1,
1.049994, -0.2174937, 1.423238, 1, 0, 0.9529412, 1,
1.060085, -1.292343, 2.512019, 1, 0, 0.9490196, 1,
1.066585, 0.03382622, 2.883964, 1, 0, 0.9411765, 1,
1.069493, 1.009483, 1.315487, 1, 0, 0.9372549, 1,
1.07038, 1.261196, 2.116207, 1, 0, 0.9294118, 1,
1.077571, 0.2029902, 2.916754, 1, 0, 0.9254902, 1,
1.079562, 0.7676473, 2.601365, 1, 0, 0.9176471, 1,
1.082548, -1.205634, 2.308958, 1, 0, 0.9137255, 1,
1.08768, -0.1257586, 1.696174, 1, 0, 0.9058824, 1,
1.087734, -1.381324, 1.258996, 1, 0, 0.9019608, 1,
1.092347, 1.11689, 0.1098151, 1, 0, 0.8941177, 1,
1.095543, 0.7315659, -0.4357172, 1, 0, 0.8862745, 1,
1.103738, -0.9925314, 2.024191, 1, 0, 0.8823529, 1,
1.10937, 0.1378636, 0.7688162, 1, 0, 0.8745098, 1,
1.114078, -1.269401, -0.437043, 1, 0, 0.8705882, 1,
1.116771, 1.207917, 0.7032739, 1, 0, 0.8627451, 1,
1.117605, -0.00412588, 0.137495, 1, 0, 0.8588235, 1,
1.117687, -0.2496983, 2.436615, 1, 0, 0.8509804, 1,
1.118798, 1.813317, 0.4523049, 1, 0, 0.8470588, 1,
1.119482, -0.423076, 4.689464, 1, 0, 0.8392157, 1,
1.121075, -3.402639, 1.970878, 1, 0, 0.8352941, 1,
1.123025, -2.16461, 2.408604, 1, 0, 0.827451, 1,
1.141136, -0.8148462, 0.8819107, 1, 0, 0.8235294, 1,
1.143017, 0.716146, 0.9713691, 1, 0, 0.8156863, 1,
1.143341, 0.176279, 0.9311374, 1, 0, 0.8117647, 1,
1.146494, 0.03054413, 0.7668364, 1, 0, 0.8039216, 1,
1.148343, 1.983068, 0.5812243, 1, 0, 0.7960784, 1,
1.148661, 0.009581125, 2.585707, 1, 0, 0.7921569, 1,
1.158444, -0.3992593, 3.14484, 1, 0, 0.7843137, 1,
1.160866, -0.2445286, 0.8848189, 1, 0, 0.7803922, 1,
1.170511, -0.4314885, 0.7137792, 1, 0, 0.772549, 1,
1.171638, 1.472705, -0.8327659, 1, 0, 0.7686275, 1,
1.17199, -0.370907, 4.039763, 1, 0, 0.7607843, 1,
1.174356, 1.583378, 1.163118, 1, 0, 0.7568628, 1,
1.182428, -1.278562, 2.706308, 1, 0, 0.7490196, 1,
1.183629, 0.7139589, 0.7795931, 1, 0, 0.7450981, 1,
1.191099, -0.4241294, 1.873571, 1, 0, 0.7372549, 1,
1.193099, 0.6568828, 0.8221005, 1, 0, 0.7333333, 1,
1.198259, -0.09386411, 2.742023, 1, 0, 0.7254902, 1,
1.201358, 0.8745195, 1.784175, 1, 0, 0.7215686, 1,
1.210687, 0.9759042, 0.3968863, 1, 0, 0.7137255, 1,
1.21249, 1.372287, 1.453835, 1, 0, 0.7098039, 1,
1.213038, -0.2244675, 1.099651, 1, 0, 0.7019608, 1,
1.223216, 1.037039, -0.7336513, 1, 0, 0.6941177, 1,
1.246046, -0.7743666, 0.7207396, 1, 0, 0.6901961, 1,
1.246341, 2.282823, 0.5183001, 1, 0, 0.682353, 1,
1.251813, -0.08257546, 0.5631353, 1, 0, 0.6784314, 1,
1.253409, 0.4250412, 2.554904, 1, 0, 0.6705883, 1,
1.264299, -0.784442, 2.380799, 1, 0, 0.6666667, 1,
1.267965, 0.1965741, 2.355664, 1, 0, 0.6588235, 1,
1.268653, 0.8195973, 1.043811, 1, 0, 0.654902, 1,
1.284281, -0.3892941, 1.679258, 1, 0, 0.6470588, 1,
1.285906, 1.002772, 1.269408, 1, 0, 0.6431373, 1,
1.289653, 0.7509446, 1.148157, 1, 0, 0.6352941, 1,
1.28996, -0.793593, 3.584515, 1, 0, 0.6313726, 1,
1.293765, -1.851122, 2.31648, 1, 0, 0.6235294, 1,
1.293821, -0.5997563, 2.558039, 1, 0, 0.6196079, 1,
1.307381, 0.4894241, -0.08885704, 1, 0, 0.6117647, 1,
1.309246, 0.4507832, 1.482962, 1, 0, 0.6078432, 1,
1.317707, 1.238145, 0.6229775, 1, 0, 0.6, 1,
1.323639, 2.366863, 0.4877641, 1, 0, 0.5921569, 1,
1.343508, 0.6089537, 2.861758, 1, 0, 0.5882353, 1,
1.347321, 0.1660574, 2.151637, 1, 0, 0.5803922, 1,
1.35072, -0.3789844, 3.271986, 1, 0, 0.5764706, 1,
1.353637, -0.5903506, 3.187666, 1, 0, 0.5686275, 1,
1.357883, 1.297619, 1.798288, 1, 0, 0.5647059, 1,
1.360032, 0.001852462, 1.444394, 1, 0, 0.5568628, 1,
1.36163, -2.138345, 4.293078, 1, 0, 0.5529412, 1,
1.365491, -1.660983, 1.590145, 1, 0, 0.5450981, 1,
1.370298, 0.1112769, 1.034132, 1, 0, 0.5411765, 1,
1.375424, 1.25657, -0.1465521, 1, 0, 0.5333334, 1,
1.384288, 0.5604111, 1.652347, 1, 0, 0.5294118, 1,
1.386518, -0.02454128, 1.09384, 1, 0, 0.5215687, 1,
1.394503, 1.168993, 0.6720149, 1, 0, 0.5176471, 1,
1.398286, 0.634318, 2.676453, 1, 0, 0.509804, 1,
1.407725, -0.5679089, 0.8932908, 1, 0, 0.5058824, 1,
1.409509, -0.6659161, 2.503788, 1, 0, 0.4980392, 1,
1.413804, -1.360224, 2.360337, 1, 0, 0.4901961, 1,
1.416255, 0.8363811, 1.047639, 1, 0, 0.4862745, 1,
1.424206, -0.4394109, 0.3537855, 1, 0, 0.4784314, 1,
1.433551, 0.4450161, 1.225025, 1, 0, 0.4745098, 1,
1.43816, 1.149, -0.3850643, 1, 0, 0.4666667, 1,
1.439036, -0.7735902, 1.172536, 1, 0, 0.4627451, 1,
1.445504, 0.7379998, 0.5313532, 1, 0, 0.454902, 1,
1.445764, -0.4048042, 1.606432, 1, 0, 0.4509804, 1,
1.452584, -1.779309, 2.064518, 1, 0, 0.4431373, 1,
1.47614, -1.027548, 3.427608, 1, 0, 0.4392157, 1,
1.49727, -0.2549341, 2.523907, 1, 0, 0.4313726, 1,
1.508092, -1.055613, 2.24224, 1, 0, 0.427451, 1,
1.518052, -0.5201223, -0.01099539, 1, 0, 0.4196078, 1,
1.527764, 1.93091, 0.7448761, 1, 0, 0.4156863, 1,
1.532904, 0.1769675, 0.4390762, 1, 0, 0.4078431, 1,
1.534225, 0.8672438, 1.725439, 1, 0, 0.4039216, 1,
1.534817, 0.03084737, 1.987866, 1, 0, 0.3960784, 1,
1.543274, 0.8198615, -0.2961658, 1, 0, 0.3882353, 1,
1.56105, -0.7105236, 0.7660323, 1, 0, 0.3843137, 1,
1.570123, -1.04496, 2.252202, 1, 0, 0.3764706, 1,
1.570837, 1.585023, 1.362701, 1, 0, 0.372549, 1,
1.571858, -2.694904, 2.689569, 1, 0, 0.3647059, 1,
1.596105, 1.272258, 1.236339, 1, 0, 0.3607843, 1,
1.602256, 0.5127622, 1.475015, 1, 0, 0.3529412, 1,
1.607947, -1.14666, 1.394276, 1, 0, 0.3490196, 1,
1.614235, 0.971235, 2.242915, 1, 0, 0.3411765, 1,
1.614444, -0.748093, 2.395464, 1, 0, 0.3372549, 1,
1.621155, -0.01731517, 1.629447, 1, 0, 0.3294118, 1,
1.634012, -1.625098, 1.828022, 1, 0, 0.3254902, 1,
1.636836, 0.4900007, -0.5899525, 1, 0, 0.3176471, 1,
1.647082, -0.5847769, 0.2947251, 1, 0, 0.3137255, 1,
1.647321, 0.8158863, -0.2566213, 1, 0, 0.3058824, 1,
1.662949, 0.2650264, 1.426002, 1, 0, 0.2980392, 1,
1.672962, 1.27615, 0.3094181, 1, 0, 0.2941177, 1,
1.682867, -1.607903, 2.174979, 1, 0, 0.2862745, 1,
1.713019, 1.128082, 0.1315965, 1, 0, 0.282353, 1,
1.748372, -1.350612, 2.723091, 1, 0, 0.2745098, 1,
1.755485, 0.5908434, 1.121501, 1, 0, 0.2705882, 1,
1.755992, -0.7692813, -0.3625502, 1, 0, 0.2627451, 1,
1.763876, -2.223754, 3.155336, 1, 0, 0.2588235, 1,
1.783508, -0.459433, 2.084287, 1, 0, 0.2509804, 1,
1.786081, -2.044436, 2.540974, 1, 0, 0.2470588, 1,
1.791984, 2.032302, 1.881759, 1, 0, 0.2392157, 1,
1.798744, 0.1460279, 2.512942, 1, 0, 0.2352941, 1,
1.810248, 3.151148, 0.5461613, 1, 0, 0.227451, 1,
1.817566, -0.2191095, 2.891645, 1, 0, 0.2235294, 1,
1.824107, 1.418789, 1.949793, 1, 0, 0.2156863, 1,
1.824908, -0.2027593, 0.532146, 1, 0, 0.2117647, 1,
1.827085, -2.429464, 0.06765478, 1, 0, 0.2039216, 1,
1.837475, 0.8616378, 2.482754, 1, 0, 0.1960784, 1,
1.838931, 0.8830364, 0.6921442, 1, 0, 0.1921569, 1,
1.862303, -0.7242002, 2.487408, 1, 0, 0.1843137, 1,
1.869616, -0.8744568, 0.8423315, 1, 0, 0.1803922, 1,
1.878904, -0.4088396, 1.232569, 1, 0, 0.172549, 1,
1.879582, -0.7362035, 1.822214, 1, 0, 0.1686275, 1,
1.881024, -1.010254, 3.006579, 1, 0, 0.1607843, 1,
1.920635, 0.6397403, 1.086637, 1, 0, 0.1568628, 1,
1.932409, -0.3337176, 1.329917, 1, 0, 0.1490196, 1,
1.975422, 0.7580379, 0.5644388, 1, 0, 0.145098, 1,
2.030915, 1.076206, 0.5742301, 1, 0, 0.1372549, 1,
2.071253, -0.3528336, 2.069912, 1, 0, 0.1333333, 1,
2.071624, -0.6873851, 3.782682, 1, 0, 0.1254902, 1,
2.072124, 0.05574404, 0.9371389, 1, 0, 0.1215686, 1,
2.076553, -1.174321, 2.075462, 1, 0, 0.1137255, 1,
2.081166, -0.5776517, 2.236707, 1, 0, 0.1098039, 1,
2.083705, -0.7373951, 2.375216, 1, 0, 0.1019608, 1,
2.096819, -1.216242, 1.137864, 1, 0, 0.09411765, 1,
2.117546, -1.692817, 3.798926, 1, 0, 0.09019608, 1,
2.121242, 0.3816086, 1.372501, 1, 0, 0.08235294, 1,
2.128604, -0.5251766, 1.883494, 1, 0, 0.07843138, 1,
2.178976, -1.236797, 0.9255339, 1, 0, 0.07058824, 1,
2.184356, -0.6030043, 2.948222, 1, 0, 0.06666667, 1,
2.369183, -0.8791444, 0.5250831, 1, 0, 0.05882353, 1,
2.374763, 1.697528, 0.3558629, 1, 0, 0.05490196, 1,
2.378601, -0.4895039, 2.280658, 1, 0, 0.04705882, 1,
2.545498, -0.2452932, 3.022883, 1, 0, 0.04313726, 1,
2.605882, -0.02000046, 2.673501, 1, 0, 0.03529412, 1,
2.728552, -0.4048984, 0.6292231, 1, 0, 0.03137255, 1,
2.790915, -0.2710288, 1.443077, 1, 0, 0.02352941, 1,
2.89159, 0.7238359, 0.1333531, 1, 0, 0.01960784, 1,
3.03518, 0.01085767, 1.004616, 1, 0, 0.01176471, 1,
3.052997, -1.350991, 3.213966, 1, 0, 0.007843138, 1
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
-0.1149961, -4.513506, -7.597361, 0, -0.5, 0.5, 0.5,
-0.1149961, -4.513506, -7.597361, 1, -0.5, 0.5, 0.5,
-0.1149961, -4.513506, -7.597361, 1, 1.5, 0.5, 0.5,
-0.1149961, -4.513506, -7.597361, 0, 1.5, 0.5, 0.5
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
-4.356939, -0.1257455, -7.597361, 0, -0.5, 0.5, 0.5,
-4.356939, -0.1257455, -7.597361, 1, -0.5, 0.5, 0.5,
-4.356939, -0.1257455, -7.597361, 1, 1.5, 0.5, 0.5,
-4.356939, -0.1257455, -7.597361, 0, 1.5, 0.5, 0.5
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
-4.356939, -4.513506, -0.4927809, 0, -0.5, 0.5, 0.5,
-4.356939, -4.513506, -0.4927809, 1, -0.5, 0.5, 0.5,
-4.356939, -4.513506, -0.4927809, 1, 1.5, 0.5, 0.5,
-4.356939, -4.513506, -0.4927809, 0, 1.5, 0.5, 0.5
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
-3, -3.500946, -5.957842,
3, -3.500946, -5.957842,
-3, -3.500946, -5.957842,
-3, -3.669706, -6.231095,
-2, -3.500946, -5.957842,
-2, -3.669706, -6.231095,
-1, -3.500946, -5.957842,
-1, -3.669706, -6.231095,
0, -3.500946, -5.957842,
0, -3.669706, -6.231095,
1, -3.500946, -5.957842,
1, -3.669706, -6.231095,
2, -3.500946, -5.957842,
2, -3.669706, -6.231095,
3, -3.500946, -5.957842,
3, -3.669706, -6.231095
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
-3, -4.007226, -6.777601, 0, -0.5, 0.5, 0.5,
-3, -4.007226, -6.777601, 1, -0.5, 0.5, 0.5,
-3, -4.007226, -6.777601, 1, 1.5, 0.5, 0.5,
-3, -4.007226, -6.777601, 0, 1.5, 0.5, 0.5,
-2, -4.007226, -6.777601, 0, -0.5, 0.5, 0.5,
-2, -4.007226, -6.777601, 1, -0.5, 0.5, 0.5,
-2, -4.007226, -6.777601, 1, 1.5, 0.5, 0.5,
-2, -4.007226, -6.777601, 0, 1.5, 0.5, 0.5,
-1, -4.007226, -6.777601, 0, -0.5, 0.5, 0.5,
-1, -4.007226, -6.777601, 1, -0.5, 0.5, 0.5,
-1, -4.007226, -6.777601, 1, 1.5, 0.5, 0.5,
-1, -4.007226, -6.777601, 0, 1.5, 0.5, 0.5,
0, -4.007226, -6.777601, 0, -0.5, 0.5, 0.5,
0, -4.007226, -6.777601, 1, -0.5, 0.5, 0.5,
0, -4.007226, -6.777601, 1, 1.5, 0.5, 0.5,
0, -4.007226, -6.777601, 0, 1.5, 0.5, 0.5,
1, -4.007226, -6.777601, 0, -0.5, 0.5, 0.5,
1, -4.007226, -6.777601, 1, -0.5, 0.5, 0.5,
1, -4.007226, -6.777601, 1, 1.5, 0.5, 0.5,
1, -4.007226, -6.777601, 0, 1.5, 0.5, 0.5,
2, -4.007226, -6.777601, 0, -0.5, 0.5, 0.5,
2, -4.007226, -6.777601, 1, -0.5, 0.5, 0.5,
2, -4.007226, -6.777601, 1, 1.5, 0.5, 0.5,
2, -4.007226, -6.777601, 0, 1.5, 0.5, 0.5,
3, -4.007226, -6.777601, 0, -0.5, 0.5, 0.5,
3, -4.007226, -6.777601, 1, -0.5, 0.5, 0.5,
3, -4.007226, -6.777601, 1, 1.5, 0.5, 0.5,
3, -4.007226, -6.777601, 0, 1.5, 0.5, 0.5
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
-3.378029, -3, -5.957842,
-3.378029, 3, -5.957842,
-3.378029, -3, -5.957842,
-3.54118, -3, -6.231095,
-3.378029, -2, -5.957842,
-3.54118, -2, -6.231095,
-3.378029, -1, -5.957842,
-3.54118, -1, -6.231095,
-3.378029, 0, -5.957842,
-3.54118, 0, -6.231095,
-3.378029, 1, -5.957842,
-3.54118, 1, -6.231095,
-3.378029, 2, -5.957842,
-3.54118, 2, -6.231095,
-3.378029, 3, -5.957842,
-3.54118, 3, -6.231095
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
-3.867484, -3, -6.777601, 0, -0.5, 0.5, 0.5,
-3.867484, -3, -6.777601, 1, -0.5, 0.5, 0.5,
-3.867484, -3, -6.777601, 1, 1.5, 0.5, 0.5,
-3.867484, -3, -6.777601, 0, 1.5, 0.5, 0.5,
-3.867484, -2, -6.777601, 0, -0.5, 0.5, 0.5,
-3.867484, -2, -6.777601, 1, -0.5, 0.5, 0.5,
-3.867484, -2, -6.777601, 1, 1.5, 0.5, 0.5,
-3.867484, -2, -6.777601, 0, 1.5, 0.5, 0.5,
-3.867484, -1, -6.777601, 0, -0.5, 0.5, 0.5,
-3.867484, -1, -6.777601, 1, -0.5, 0.5, 0.5,
-3.867484, -1, -6.777601, 1, 1.5, 0.5, 0.5,
-3.867484, -1, -6.777601, 0, 1.5, 0.5, 0.5,
-3.867484, 0, -6.777601, 0, -0.5, 0.5, 0.5,
-3.867484, 0, -6.777601, 1, -0.5, 0.5, 0.5,
-3.867484, 0, -6.777601, 1, 1.5, 0.5, 0.5,
-3.867484, 0, -6.777601, 0, 1.5, 0.5, 0.5,
-3.867484, 1, -6.777601, 0, -0.5, 0.5, 0.5,
-3.867484, 1, -6.777601, 1, -0.5, 0.5, 0.5,
-3.867484, 1, -6.777601, 1, 1.5, 0.5, 0.5,
-3.867484, 1, -6.777601, 0, 1.5, 0.5, 0.5,
-3.867484, 2, -6.777601, 0, -0.5, 0.5, 0.5,
-3.867484, 2, -6.777601, 1, -0.5, 0.5, 0.5,
-3.867484, 2, -6.777601, 1, 1.5, 0.5, 0.5,
-3.867484, 2, -6.777601, 0, 1.5, 0.5, 0.5,
-3.867484, 3, -6.777601, 0, -0.5, 0.5, 0.5,
-3.867484, 3, -6.777601, 1, -0.5, 0.5, 0.5,
-3.867484, 3, -6.777601, 1, 1.5, 0.5, 0.5,
-3.867484, 3, -6.777601, 0, 1.5, 0.5, 0.5
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
-3.378029, -3.500946, -4,
-3.378029, -3.500946, 4,
-3.378029, -3.500946, -4,
-3.54118, -3.669706, -4,
-3.378029, -3.500946, -2,
-3.54118, -3.669706, -2,
-3.378029, -3.500946, 0,
-3.54118, -3.669706, 0,
-3.378029, -3.500946, 2,
-3.54118, -3.669706, 2,
-3.378029, -3.500946, 4,
-3.54118, -3.669706, 4
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
-3.867484, -4.007226, -4, 0, -0.5, 0.5, 0.5,
-3.867484, -4.007226, -4, 1, -0.5, 0.5, 0.5,
-3.867484, -4.007226, -4, 1, 1.5, 0.5, 0.5,
-3.867484, -4.007226, -4, 0, 1.5, 0.5, 0.5,
-3.867484, -4.007226, -2, 0, -0.5, 0.5, 0.5,
-3.867484, -4.007226, -2, 1, -0.5, 0.5, 0.5,
-3.867484, -4.007226, -2, 1, 1.5, 0.5, 0.5,
-3.867484, -4.007226, -2, 0, 1.5, 0.5, 0.5,
-3.867484, -4.007226, 0, 0, -0.5, 0.5, 0.5,
-3.867484, -4.007226, 0, 1, -0.5, 0.5, 0.5,
-3.867484, -4.007226, 0, 1, 1.5, 0.5, 0.5,
-3.867484, -4.007226, 0, 0, 1.5, 0.5, 0.5,
-3.867484, -4.007226, 2, 0, -0.5, 0.5, 0.5,
-3.867484, -4.007226, 2, 1, -0.5, 0.5, 0.5,
-3.867484, -4.007226, 2, 1, 1.5, 0.5, 0.5,
-3.867484, -4.007226, 2, 0, 1.5, 0.5, 0.5,
-3.867484, -4.007226, 4, 0, -0.5, 0.5, 0.5,
-3.867484, -4.007226, 4, 1, -0.5, 0.5, 0.5,
-3.867484, -4.007226, 4, 1, 1.5, 0.5, 0.5,
-3.867484, -4.007226, 4, 0, 1.5, 0.5, 0.5
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
-3.378029, -3.500946, -5.957842,
-3.378029, 3.249455, -5.957842,
-3.378029, -3.500946, 4.97228,
-3.378029, 3.249455, 4.97228,
-3.378029, -3.500946, -5.957842,
-3.378029, -3.500946, 4.97228,
-3.378029, 3.249455, -5.957842,
-3.378029, 3.249455, 4.97228,
-3.378029, -3.500946, -5.957842,
3.148037, -3.500946, -5.957842,
-3.378029, -3.500946, 4.97228,
3.148037, -3.500946, 4.97228,
-3.378029, 3.249455, -5.957842,
3.148037, 3.249455, -5.957842,
-3.378029, 3.249455, 4.97228,
3.148037, 3.249455, 4.97228,
3.148037, -3.500946, -5.957842,
3.148037, 3.249455, -5.957842,
3.148037, -3.500946, 4.97228,
3.148037, 3.249455, 4.97228,
3.148037, -3.500946, -5.957842,
3.148037, -3.500946, 4.97228,
3.148037, 3.249455, -5.957842,
3.148037, 3.249455, 4.97228
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
var radius = 7.694232;
var distance = 34.23251;
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
mvMatrix.translate( 0.1149961, 0.1257455, 0.4927809 );
mvMatrix.scale( 1.274758, 1.232394, 0.7611219 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.23251);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
triazole<-read.table("triazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'triazole' not found
```

```r
y<-triazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'triazole' not found
```

```r
z<-triazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'triazole' not found
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
-3.282989, 0.1808547, -1.512943, 0, 0, 1, 1, 1,
-3.147838, 0.6767355, -1.193317, 1, 0, 0, 1, 1,
-3.035881, -0.2984187, -2.336928, 1, 0, 0, 1, 1,
-2.873099, -0.9972748, 0.002240926, 1, 0, 0, 1, 1,
-2.836619, -0.3523695, -0.4969124, 1, 0, 0, 1, 1,
-2.749682, -1.518278, -3.914902, 1, 0, 0, 1, 1,
-2.740087, 0.7590867, -1.383018, 0, 0, 0, 1, 1,
-2.554981, -1.022696, -1.906675, 0, 0, 0, 1, 1,
-2.54287, -0.56979, -0.08688813, 0, 0, 0, 1, 1,
-2.49999, 0.04795543, -2.876794, 0, 0, 0, 1, 1,
-2.497149, -0.3566515, -0.8200923, 0, 0, 0, 1, 1,
-2.38085, 0.1912107, -1.06697, 0, 0, 0, 1, 1,
-2.346787, -0.0005648048, -2.015918, 0, 0, 0, 1, 1,
-2.34456, 0.2389099, -2.197703, 1, 1, 1, 1, 1,
-2.254171, -2.171406, -2.648162, 1, 1, 1, 1, 1,
-2.230578, 0.1637371, -2.406692, 1, 1, 1, 1, 1,
-2.166024, -0.01255675, -0.3887943, 1, 1, 1, 1, 1,
-2.165417, -0.5540693, -1.261257, 1, 1, 1, 1, 1,
-2.107228, -0.05264649, -1.851288, 1, 1, 1, 1, 1,
-2.051995, -1.354485, -3.395262, 1, 1, 1, 1, 1,
-2.001022, -0.5202462, -2.109268, 1, 1, 1, 1, 1,
-1.976525, -0.606178, -2.378265, 1, 1, 1, 1, 1,
-1.966471, -0.7810483, -1.567932, 1, 1, 1, 1, 1,
-1.960012, 0.8368834, -0.7224888, 1, 1, 1, 1, 1,
-1.958634, -0.7490777, -1.019147, 1, 1, 1, 1, 1,
-1.948071, -0.6226839, -1.806029, 1, 1, 1, 1, 1,
-1.90821, -0.4221821, -0.4910946, 1, 1, 1, 1, 1,
-1.884877, 0.8403823, -0.813848, 1, 1, 1, 1, 1,
-1.869568, 0.749306, -0.7005072, 0, 0, 1, 1, 1,
-1.858486, 1.36099, -0.879804, 1, 0, 0, 1, 1,
-1.828305, -1.315211, -1.708025, 1, 0, 0, 1, 1,
-1.820291, 0.5087108, -2.479971, 1, 0, 0, 1, 1,
-1.819292, 1.058127, -0.7057167, 1, 0, 0, 1, 1,
-1.789098, 0.5139074, -2.155503, 1, 0, 0, 1, 1,
-1.767116, -0.1854076, -0.5366837, 0, 0, 0, 1, 1,
-1.736167, -1.735947, -0.6263876, 0, 0, 0, 1, 1,
-1.693246, 0.2085535, -0.8272464, 0, 0, 0, 1, 1,
-1.684938, -0.1542318, -0.1746356, 0, 0, 0, 1, 1,
-1.676506, -1.549283, -1.38876, 0, 0, 0, 1, 1,
-1.668532, -1.753109, -4.59662, 0, 0, 0, 1, 1,
-1.661958, -1.001363, -2.39328, 0, 0, 0, 1, 1,
-1.654694, 1.15098, -0.285925, 1, 1, 1, 1, 1,
-1.654035, 0.3560409, -1.633505, 1, 1, 1, 1, 1,
-1.64437, 1.29108, -0.2628725, 1, 1, 1, 1, 1,
-1.643873, -0.4379339, -2.292629, 1, 1, 1, 1, 1,
-1.630609, -0.2147819, -1.870569, 1, 1, 1, 1, 1,
-1.629822, -1.416734, -1.314173, 1, 1, 1, 1, 1,
-1.62397, 0.8895944, -2.274479, 1, 1, 1, 1, 1,
-1.617841, 1.145065, -0.3349645, 1, 1, 1, 1, 1,
-1.611787, 1.602978, -1.477543, 1, 1, 1, 1, 1,
-1.605211, 1.240692, 0.4235016, 1, 1, 1, 1, 1,
-1.595388, 0.7406242, -1.267699, 1, 1, 1, 1, 1,
-1.583179, -1.970166, -2.293633, 1, 1, 1, 1, 1,
-1.581143, 1.287504, -0.4342209, 1, 1, 1, 1, 1,
-1.572206, 0.8630413, -1.06996, 1, 1, 1, 1, 1,
-1.552776, 1.452657, -0.3249037, 1, 1, 1, 1, 1,
-1.533536, -0.2294876, -2.004083, 0, 0, 1, 1, 1,
-1.524643, -0.3449404, -2.521017, 1, 0, 0, 1, 1,
-1.512982, -0.7502885, -1.829214, 1, 0, 0, 1, 1,
-1.507308, -0.1468173, -4.284815, 1, 0, 0, 1, 1,
-1.493258, -0.7958663, -0.5900631, 1, 0, 0, 1, 1,
-1.488921, -1.939528, -1.593872, 1, 0, 0, 1, 1,
-1.479896, 0.9734963, -0.4738955, 0, 0, 0, 1, 1,
-1.47316, 1.599046, -1.230512, 0, 0, 0, 1, 1,
-1.46656, -1.281868, -2.198232, 0, 0, 0, 1, 1,
-1.46498, -1.419994, -2.330329, 0, 0, 0, 1, 1,
-1.459799, -0.2839673, -1.056825, 0, 0, 0, 1, 1,
-1.455622, 1.396425, 0.2234973, 0, 0, 0, 1, 1,
-1.443436, -0.795261, -1.183653, 0, 0, 0, 1, 1,
-1.435605, 0.5265334, -1.513608, 1, 1, 1, 1, 1,
-1.434904, -0.3620121, -2.390122, 1, 1, 1, 1, 1,
-1.43206, -0.3449256, -0.3874751, 1, 1, 1, 1, 1,
-1.426644, 0.2109775, -0.6838698, 1, 1, 1, 1, 1,
-1.406626, 1.543978, 1.522261, 1, 1, 1, 1, 1,
-1.401302, 0.2902208, -3.060172, 1, 1, 1, 1, 1,
-1.398239, 0.7036546, 0.3965302, 1, 1, 1, 1, 1,
-1.394187, 1.088549, -0.9523914, 1, 1, 1, 1, 1,
-1.385165, -2.139871, -2.530041, 1, 1, 1, 1, 1,
-1.382541, 0.1317241, -2.644825, 1, 1, 1, 1, 1,
-1.366507, 0.4703266, -1.715451, 1, 1, 1, 1, 1,
-1.356227, 0.1656677, 1.642361, 1, 1, 1, 1, 1,
-1.355098, 1.491421, -0.1338513, 1, 1, 1, 1, 1,
-1.345636, -1.489783, -2.03408, 1, 1, 1, 1, 1,
-1.344601, 0.001969991, -0.7641138, 1, 1, 1, 1, 1,
-1.342182, -0.7293511, -2.587772, 0, 0, 1, 1, 1,
-1.323869, 0.2487392, -1.837878, 1, 0, 0, 1, 1,
-1.317689, 1.858994, -0.9978871, 1, 0, 0, 1, 1,
-1.302609, -0.4271292, -2.636699, 1, 0, 0, 1, 1,
-1.280994, 1.110076, -1.145916, 1, 0, 0, 1, 1,
-1.271585, -0.287615, -1.243267, 1, 0, 0, 1, 1,
-1.270724, -1.185244, -2.123462, 0, 0, 0, 1, 1,
-1.259937, 0.3948707, -1.710323, 0, 0, 0, 1, 1,
-1.259294, -1.053244, -1.202113, 0, 0, 0, 1, 1,
-1.229057, -0.9039829, -3.133579, 0, 0, 0, 1, 1,
-1.227597, -2.656233, -1.402907, 0, 0, 0, 1, 1,
-1.226143, 0.3304797, -1.068679, 0, 0, 0, 1, 1,
-1.223451, 1.409484, -1.953389, 0, 0, 0, 1, 1,
-1.219122, -0.04128791, -1.89545, 1, 1, 1, 1, 1,
-1.21639, -1.024634, -2.708149, 1, 1, 1, 1, 1,
-1.210013, -0.6661116, -1.936109, 1, 1, 1, 1, 1,
-1.197999, 0.7277697, 1.591377, 1, 1, 1, 1, 1,
-1.197987, 0.2513055, -1.436486, 1, 1, 1, 1, 1,
-1.197945, -0.04166581, -1.743041, 1, 1, 1, 1, 1,
-1.19228, 0.6116928, -1.1051, 1, 1, 1, 1, 1,
-1.19002, -0.4248958, -2.383513, 1, 1, 1, 1, 1,
-1.181583, -0.1409781, -0.9695104, 1, 1, 1, 1, 1,
-1.181429, -0.462954, -1.931729, 1, 1, 1, 1, 1,
-1.181368, -0.4608138, -0.8276831, 1, 1, 1, 1, 1,
-1.178651, -1.473535, -2.691138, 1, 1, 1, 1, 1,
-1.171423, 0.6024277, 0.4247501, 1, 1, 1, 1, 1,
-1.166877, 0.01522514, -2.229507, 1, 1, 1, 1, 1,
-1.165891, -1.694695, -3.00954, 1, 1, 1, 1, 1,
-1.164934, -0.2389662, -2.036305, 0, 0, 1, 1, 1,
-1.161471, -0.3511734, -1.818704, 1, 0, 0, 1, 1,
-1.153661, 0.01387926, -2.14098, 1, 0, 0, 1, 1,
-1.146257, -0.5004708, -1.085664, 1, 0, 0, 1, 1,
-1.141754, 1.051549, 0.2482789, 1, 0, 0, 1, 1,
-1.141175, 0.3817084, -1.060072, 1, 0, 0, 1, 1,
-1.140134, -1.266083, -3.634473, 0, 0, 0, 1, 1,
-1.135935, -0.1525123, -0.9303561, 0, 0, 0, 1, 1,
-1.135584, -1.996932, -2.872776, 0, 0, 0, 1, 1,
-1.132022, -0.635531, -2.53369, 0, 0, 0, 1, 1,
-1.124359, 1.615306, 0.5518783, 0, 0, 0, 1, 1,
-1.12004, -0.8908362, -1.694201, 0, 0, 0, 1, 1,
-1.118333, 0.3559862, -0.50914, 0, 0, 0, 1, 1,
-1.118298, 0.3786328, -2.218666, 1, 1, 1, 1, 1,
-1.115702, 0.03878706, -2.65641, 1, 1, 1, 1, 1,
-1.110309, -0.7083737, -1.24757, 1, 1, 1, 1, 1,
-1.096731, -0.07294846, -1.577148, 1, 1, 1, 1, 1,
-1.083242, -0.2832119, -1.84244, 1, 1, 1, 1, 1,
-1.070779, 0.5461702, -1.938846, 1, 1, 1, 1, 1,
-1.069817, -0.3557559, -1.576196, 1, 1, 1, 1, 1,
-1.044254, 0.3794355, -0.2239349, 1, 1, 1, 1, 1,
-1.038081, 0.002840201, -1.310081, 1, 1, 1, 1, 1,
-1.037907, 2.026341, 0.9121132, 1, 1, 1, 1, 1,
-1.037233, -0.6813365, -1.881518, 1, 1, 1, 1, 1,
-1.03553, 0.1535078, -2.903161, 1, 1, 1, 1, 1,
-1.029637, -0.001431515, -0.3735118, 1, 1, 1, 1, 1,
-1.029553, -0.2031587, -2.888434, 1, 1, 1, 1, 1,
-1.009872, -2.197776, -2.458687, 1, 1, 1, 1, 1,
-1.005353, -0.6130251, -2.961446, 0, 0, 1, 1, 1,
-1.000938, 0.2407582, -2.785106, 1, 0, 0, 1, 1,
-1.000889, 1.344999, -1.13505, 1, 0, 0, 1, 1,
-0.9958062, 1.069737, -0.9566123, 1, 0, 0, 1, 1,
-0.9953779, -1.209183, -1.878179, 1, 0, 0, 1, 1,
-0.9903886, -0.747714, -1.236169, 1, 0, 0, 1, 1,
-0.9889821, 0.3676692, -0.5547981, 0, 0, 0, 1, 1,
-0.9835761, 0.2468303, -2.751175, 0, 0, 0, 1, 1,
-0.9811269, 1.144885, -0.9055257, 0, 0, 0, 1, 1,
-0.9798423, 0.2859504, 0.5103097, 0, 0, 0, 1, 1,
-0.9580598, 1.3632, 0.3690604, 0, 0, 0, 1, 1,
-0.9538559, 0.5793766, -1.619253, 0, 0, 0, 1, 1,
-0.947785, -0.3179293, -3.122352, 0, 0, 0, 1, 1,
-0.9442555, 1.243424, -0.6902141, 1, 1, 1, 1, 1,
-0.9391046, 0.1151439, -1.537403, 1, 1, 1, 1, 1,
-0.934545, -0.8998309, -3.158806, 1, 1, 1, 1, 1,
-0.9307647, -1.239008, -2.635927, 1, 1, 1, 1, 1,
-0.9278899, 0.7255289, 0.06761198, 1, 1, 1, 1, 1,
-0.9273321, -0.3882097, -1.772732, 1, 1, 1, 1, 1,
-0.9262996, 1.030408, -0.567502, 1, 1, 1, 1, 1,
-0.9205111, -0.8659657, -3.037341, 1, 1, 1, 1, 1,
-0.9192166, 0.5138424, -1.007145, 1, 1, 1, 1, 1,
-0.9119656, -0.7247092, -0.7817165, 1, 1, 1, 1, 1,
-0.8986188, -0.7036428, -2.112971, 1, 1, 1, 1, 1,
-0.8973016, 0.8382644, -2.281732, 1, 1, 1, 1, 1,
-0.8937357, 1.739053, -0.4369359, 1, 1, 1, 1, 1,
-0.8929765, -0.7512309, -2.574767, 1, 1, 1, 1, 1,
-0.8827105, -1.000859, -3.183333, 1, 1, 1, 1, 1,
-0.8753633, -0.1191697, -4.214404, 0, 0, 1, 1, 1,
-0.8675675, 1.442817, -0.8021727, 1, 0, 0, 1, 1,
-0.8659924, 0.2353627, -3.028019, 1, 0, 0, 1, 1,
-0.8518181, -0.05280111, -2.27861, 1, 0, 0, 1, 1,
-0.8514688, -1.909754, -1.251394, 1, 0, 0, 1, 1,
-0.8495368, 1.660479, -1.21008, 1, 0, 0, 1, 1,
-0.8476428, 0.3896149, -2.992753, 0, 0, 0, 1, 1,
-0.8416383, -1.404356, -3.578383, 0, 0, 0, 1, 1,
-0.8409508, -0.6142924, -2.957576, 0, 0, 0, 1, 1,
-0.8353325, 1.000587, -3.717615, 0, 0, 0, 1, 1,
-0.8339195, -0.2540339, -1.562093, 0, 0, 0, 1, 1,
-0.8294587, 0.2895518, -2.658849, 0, 0, 0, 1, 1,
-0.827544, 0.3889317, -1.514988, 0, 0, 0, 1, 1,
-0.8173151, -1.155402, -3.079047, 1, 1, 1, 1, 1,
-0.8166124, -0.2726778, -3.433417, 1, 1, 1, 1, 1,
-0.8165385, -0.5558518, -1.160709, 1, 1, 1, 1, 1,
-0.8112958, 1.036798, -0.8244901, 1, 1, 1, 1, 1,
-0.8086627, -0.307234, -1.517694, 1, 1, 1, 1, 1,
-0.8083813, -1.309582, -2.630905, 1, 1, 1, 1, 1,
-0.8080776, -0.11091, -2.462391, 1, 1, 1, 1, 1,
-0.8075711, -0.5311592, -3.641682, 1, 1, 1, 1, 1,
-0.8064439, -0.0781366, -3.857568, 1, 1, 1, 1, 1,
-0.8057531, 0.5244537, -0.9513424, 1, 1, 1, 1, 1,
-0.8025968, -0.753117, -1.848578, 1, 1, 1, 1, 1,
-0.8010648, -0.05868119, -1.220132, 1, 1, 1, 1, 1,
-0.7992822, 0.4051155, -1.797194, 1, 1, 1, 1, 1,
-0.7980127, -0.9262132, -3.058093, 1, 1, 1, 1, 1,
-0.7976946, 0.3426422, -1.197387, 1, 1, 1, 1, 1,
-0.7965804, 0.4790738, -0.4428589, 0, 0, 1, 1, 1,
-0.7956315, 2.558578, -2.056879, 1, 0, 0, 1, 1,
-0.7884731, -0.7243338, -1.531793, 1, 0, 0, 1, 1,
-0.775138, 0.5013859, -0.7433518, 1, 0, 0, 1, 1,
-0.7738503, 1.092936, -0.652205, 1, 0, 0, 1, 1,
-0.773808, 0.962112, -1.278288, 1, 0, 0, 1, 1,
-0.7721941, 1.209322, -1.547103, 0, 0, 0, 1, 1,
-0.7684358, 0.4329611, -1.149666, 0, 0, 0, 1, 1,
-0.7675291, -1.279728, -1.477135, 0, 0, 0, 1, 1,
-0.7664645, 0.05915992, -0.708599, 0, 0, 0, 1, 1,
-0.7638969, -1.378067, -3.093009, 0, 0, 0, 1, 1,
-0.7575768, 1.188592, -2.436961, 0, 0, 0, 1, 1,
-0.7534969, -1.216487, -1.998112, 0, 0, 0, 1, 1,
-0.7509666, 1.544703, 1.926542, 1, 1, 1, 1, 1,
-0.7463503, -0.4202284, -2.02476, 1, 1, 1, 1, 1,
-0.7451262, 0.9358449, -0.4907545, 1, 1, 1, 1, 1,
-0.73747, -1.188854, -3.698678, 1, 1, 1, 1, 1,
-0.7365151, -0.2978483, -2.231187, 1, 1, 1, 1, 1,
-0.7355519, -0.6933565, -2.892247, 1, 1, 1, 1, 1,
-0.7334258, -0.8603752, -3.126054, 1, 1, 1, 1, 1,
-0.7331139, -0.2542169, -2.798558, 1, 1, 1, 1, 1,
-0.7309223, 1.307302, -0.701899, 1, 1, 1, 1, 1,
-0.7291748, 2.144565, 0.2980737, 1, 1, 1, 1, 1,
-0.7259493, -0.9026436, -0.9957465, 1, 1, 1, 1, 1,
-0.7201219, 1.131588, -0.1653164, 1, 1, 1, 1, 1,
-0.7163245, -1.988693, -2.543907, 1, 1, 1, 1, 1,
-0.7107884, -0.6197786, -2.212929, 1, 1, 1, 1, 1,
-0.7103636, -0.6423048, -3.088742, 1, 1, 1, 1, 1,
-0.7062806, 0.9367555, -0.9996005, 0, 0, 1, 1, 1,
-0.7045842, 1.158676, -1.63454, 1, 0, 0, 1, 1,
-0.7040705, 1.059837, 0.9468824, 1, 0, 0, 1, 1,
-0.7032486, -0.9804518, -2.733106, 1, 0, 0, 1, 1,
-0.6984459, 1.57353, 0.8674693, 1, 0, 0, 1, 1,
-0.6977779, -0.2723541, -0.5495795, 1, 0, 0, 1, 1,
-0.6972799, -0.406601, -2.403594, 0, 0, 0, 1, 1,
-0.6961023, 1.122831, -3.542082, 0, 0, 0, 1, 1,
-0.6948663, -2.331636, -3.149969, 0, 0, 0, 1, 1,
-0.6870119, 0.5329159, -1.187489, 0, 0, 0, 1, 1,
-0.6861125, 0.2088848, 0.7513874, 0, 0, 0, 1, 1,
-0.6859013, 1.397456, -0.9168683, 0, 0, 0, 1, 1,
-0.683688, 0.4793865, 0.5069823, 0, 0, 0, 1, 1,
-0.6832675, 0.5430238, -1.786999, 1, 1, 1, 1, 1,
-0.675958, 0.9289391, 0.07029648, 1, 1, 1, 1, 1,
-0.6740745, 0.1037894, -2.648122, 1, 1, 1, 1, 1,
-0.6738552, 1.030696, 0.4054734, 1, 1, 1, 1, 1,
-0.6718033, 0.5151039, 1.380291, 1, 1, 1, 1, 1,
-0.6710993, -0.8366298, -3.878026, 1, 1, 1, 1, 1,
-0.6704097, -0.4059002, -2.781862, 1, 1, 1, 1, 1,
-0.6681547, -0.1796128, -0.5291613, 1, 1, 1, 1, 1,
-0.6653053, -1.401418, -5.575313, 1, 1, 1, 1, 1,
-0.6652331, -0.7436016, -2.826136, 1, 1, 1, 1, 1,
-0.6617711, 1.50041, -0.5849493, 1, 1, 1, 1, 1,
-0.6588523, -0.1691122, -1.90903, 1, 1, 1, 1, 1,
-0.656412, -1.003632, -1.989718, 1, 1, 1, 1, 1,
-0.6442577, -0.5391176, -2.643556, 1, 1, 1, 1, 1,
-0.6436653, 0.6295076, -0.6134096, 1, 1, 1, 1, 1,
-0.6340771, 0.001939797, -1.608599, 0, 0, 1, 1, 1,
-0.6326638, -1.527441, -2.912286, 1, 0, 0, 1, 1,
-0.6246234, -1.06166, -2.853559, 1, 0, 0, 1, 1,
-0.6239277, -1.535251, -3.189894, 1, 0, 0, 1, 1,
-0.6215184, -1.193139, -1.571384, 1, 0, 0, 1, 1,
-0.6179304, 0.4800211, -1.459079, 1, 0, 0, 1, 1,
-0.6160104, -0.156776, -3.030641, 0, 0, 0, 1, 1,
-0.6130835, 0.4686808, -1.031897, 0, 0, 0, 1, 1,
-0.6125301, 0.6148101, -1.438342, 0, 0, 0, 1, 1,
-0.6098574, 1.196335, 1.048439, 0, 0, 0, 1, 1,
-0.6092302, -1.423384, -1.127158, 0, 0, 0, 1, 1,
-0.6078385, 0.1533367, 0.9171456, 0, 0, 0, 1, 1,
-0.6004981, 0.7660274, -1.2997, 0, 0, 0, 1, 1,
-0.5999602, 0.8766608, -2.341166, 1, 1, 1, 1, 1,
-0.5999286, -1.020798, -2.492227, 1, 1, 1, 1, 1,
-0.5960946, -0.9869993, -4.438638, 1, 1, 1, 1, 1,
-0.5934182, 0.407377, -2.179641, 1, 1, 1, 1, 1,
-0.5875189, 1.273996, 1.38952, 1, 1, 1, 1, 1,
-0.5836571, 0.6251437, 0.2927133, 1, 1, 1, 1, 1,
-0.5794756, 0.7760525, 0.1626049, 1, 1, 1, 1, 1,
-0.5793934, -1.007584, -3.733862, 1, 1, 1, 1, 1,
-0.5792086, 0.1303571, -1.912786, 1, 1, 1, 1, 1,
-0.5768189, -0.5449196, -3.244837, 1, 1, 1, 1, 1,
-0.5757228, -1.234689, -1.433712, 1, 1, 1, 1, 1,
-0.5748535, -0.7290087, -2.793392, 1, 1, 1, 1, 1,
-0.5655949, -0.143853, -1.160046, 1, 1, 1, 1, 1,
-0.5619595, 0.6692992, -0.8873753, 1, 1, 1, 1, 1,
-0.5586771, 0.299126, -1.038394, 1, 1, 1, 1, 1,
-0.5586095, 1.018354, 1.397102, 0, 0, 1, 1, 1,
-0.5579302, 0.02094316, -3.522182, 1, 0, 0, 1, 1,
-0.5547858, 0.5964719, -2.735681, 1, 0, 0, 1, 1,
-0.5503783, -0.03258869, -1.606108, 1, 0, 0, 1, 1,
-0.5486218, -0.06424046, -2.635918, 1, 0, 0, 1, 1,
-0.5469776, -0.6691406, -1.0735, 1, 0, 0, 1, 1,
-0.5450262, 1.856973, -0.05856995, 0, 0, 0, 1, 1,
-0.5438015, 0.1282043, -1.155214, 0, 0, 0, 1, 1,
-0.539882, -0.5893828, -2.809682, 0, 0, 0, 1, 1,
-0.5323998, 0.5462634, 0.1444935, 0, 0, 0, 1, 1,
-0.5316536, 1.175385, -0.6441105, 0, 0, 0, 1, 1,
-0.5287862, -0.4586417, -1.789072, 0, 0, 0, 1, 1,
-0.52718, -1.129979, -3.762186, 0, 0, 0, 1, 1,
-0.5271368, 1.930029, -0.8236138, 1, 1, 1, 1, 1,
-0.5253808, -0.02756711, -3.247132, 1, 1, 1, 1, 1,
-0.5216223, -1.457919, -2.404841, 1, 1, 1, 1, 1,
-0.5198805, -0.5971011, -3.569261, 1, 1, 1, 1, 1,
-0.5128473, -1.454534, -2.303397, 1, 1, 1, 1, 1,
-0.5007582, -0.9531107, -2.574543, 1, 1, 1, 1, 1,
-0.4957793, 0.6423835, -0.6702516, 1, 1, 1, 1, 1,
-0.494667, 1.319566, -1.520268, 1, 1, 1, 1, 1,
-0.4919089, 0.1770427, -1.248574, 1, 1, 1, 1, 1,
-0.4912721, -1.644951, -1.81717, 1, 1, 1, 1, 1,
-0.4818738, -0.7732795, -2.623671, 1, 1, 1, 1, 1,
-0.481033, 0.2343838, -1.173745, 1, 1, 1, 1, 1,
-0.4792795, 1.440913, -0.384473, 1, 1, 1, 1, 1,
-0.4745247, 1.624649, -0.4446137, 1, 1, 1, 1, 1,
-0.4725848, 0.551245, 0.7112765, 1, 1, 1, 1, 1,
-0.4711294, -0.4197147, -4.386441, 0, 0, 1, 1, 1,
-0.4674164, -1.266647, -2.17097, 1, 0, 0, 1, 1,
-0.4673225, 0.9777008, 0.7064876, 1, 0, 0, 1, 1,
-0.4638817, 0.09487385, -0.8327845, 1, 0, 0, 1, 1,
-0.4618705, 0.7916451, -2.430841, 1, 0, 0, 1, 1,
-0.460382, -1.116418, -2.336098, 1, 0, 0, 1, 1,
-0.4560324, -1.787583, -3.120523, 0, 0, 0, 1, 1,
-0.4555101, -1.305881, -2.491214, 0, 0, 0, 1, 1,
-0.4472743, 0.8695673, -0.2194605, 0, 0, 0, 1, 1,
-0.4468275, -0.2951208, -0.6079288, 0, 0, 0, 1, 1,
-0.438746, -0.7051414, -2.038453, 0, 0, 0, 1, 1,
-0.4257776, 1.166975, -1.23125, 0, 0, 0, 1, 1,
-0.4254489, -0.7857732, -3.108912, 0, 0, 0, 1, 1,
-0.4246798, 0.1244604, -2.268669, 1, 1, 1, 1, 1,
-0.4217497, -0.3030406, -1.437496, 1, 1, 1, 1, 1,
-0.4197754, 0.3738523, -2.104382, 1, 1, 1, 1, 1,
-0.417209, 0.5081734, -0.5331632, 1, 1, 1, 1, 1,
-0.416192, -0.9479249, -1.752039, 1, 1, 1, 1, 1,
-0.4159487, -0.1650687, -1.668642, 1, 1, 1, 1, 1,
-0.4152419, 1.641198, -1.308109, 1, 1, 1, 1, 1,
-0.413515, -0.6912028, -3.362355, 1, 1, 1, 1, 1,
-0.4065714, 1.237141, -1.071512, 1, 1, 1, 1, 1,
-0.4031763, -0.05188939, -0.003868789, 1, 1, 1, 1, 1,
-0.4014906, 0.5918605, -1.90388, 1, 1, 1, 1, 1,
-0.4012083, 0.9826053, -0.4654474, 1, 1, 1, 1, 1,
-0.4011454, 0.3901208, -0.546352, 1, 1, 1, 1, 1,
-0.3968799, 0.0746333, -2.126441, 1, 1, 1, 1, 1,
-0.3955648, -0.3009683, -0.1223815, 1, 1, 1, 1, 1,
-0.3921953, 0.4897217, -0.4275754, 0, 0, 1, 1, 1,
-0.3806216, 0.46165, -1.342601, 1, 0, 0, 1, 1,
-0.3787264, -0.6952297, -2.333471, 1, 0, 0, 1, 1,
-0.3781472, 0.05201202, 1.089375, 1, 0, 0, 1, 1,
-0.3770155, 0.5814603, -0.9269871, 1, 0, 0, 1, 1,
-0.375627, 0.4260321, -1.650702, 1, 0, 0, 1, 1,
-0.375537, 0.9147997, -0.951525, 0, 0, 0, 1, 1,
-0.3695149, 1.764668, -0.01583601, 0, 0, 0, 1, 1,
-0.3666696, -1.533034, -3.732894, 0, 0, 0, 1, 1,
-0.3625198, 0.5537935, -0.6947255, 0, 0, 0, 1, 1,
-0.3553361, -1.038298, -2.826329, 0, 0, 0, 1, 1,
-0.3508394, -0.254525, -2.58615, 0, 0, 0, 1, 1,
-0.3499044, 0.257978, -1.745259, 0, 0, 0, 1, 1,
-0.3466532, -0.4274978, -3.473992, 1, 1, 1, 1, 1,
-0.3427541, 0.7773623, -0.3984042, 1, 1, 1, 1, 1,
-0.3400947, -1.634968, -2.323827, 1, 1, 1, 1, 1,
-0.3398668, -0.2044314, -2.902638, 1, 1, 1, 1, 1,
-0.3387665, 0.881326, -0.4076757, 1, 1, 1, 1, 1,
-0.3370941, 1.286657, 2.794607, 1, 1, 1, 1, 1,
-0.3366929, 0.3578402, 0.1126475, 1, 1, 1, 1, 1,
-0.3349464, -0.322276, -3.271008, 1, 1, 1, 1, 1,
-0.3348072, -0.63145, -1.626335, 1, 1, 1, 1, 1,
-0.3267435, -1.612998, -1.415515, 1, 1, 1, 1, 1,
-0.3266783, -0.2463996, -2.103388, 1, 1, 1, 1, 1,
-0.3255533, 0.6704127, -1.955325, 1, 1, 1, 1, 1,
-0.3221325, -0.1659021, -2.809834, 1, 1, 1, 1, 1,
-0.3196638, -0.1752523, -0.68321, 1, 1, 1, 1, 1,
-0.3179507, 0.8471349, -0.8878353, 1, 1, 1, 1, 1,
-0.3179409, 0.3595513, -0.8841134, 0, 0, 1, 1, 1,
-0.3161335, -0.4305144, -2.087663, 1, 0, 0, 1, 1,
-0.3148291, -1.246273, -1.901268, 1, 0, 0, 1, 1,
-0.3148121, 0.9217228, -1.574412, 1, 0, 0, 1, 1,
-0.3146353, 2.152447, 0.4382718, 1, 0, 0, 1, 1,
-0.3125364, -0.4539501, -3.284928, 1, 0, 0, 1, 1,
-0.3013278, 0.7392777, 0.1379788, 0, 0, 0, 1, 1,
-0.2917928, -0.127004, -1.924825, 0, 0, 0, 1, 1,
-0.290976, -0.3666389, -1.19051, 0, 0, 0, 1, 1,
-0.2884577, 0.2533239, -1.453976, 0, 0, 0, 1, 1,
-0.286497, -0.4626175, -3.019332, 0, 0, 0, 1, 1,
-0.2819026, -0.06271234, -2.751514, 0, 0, 0, 1, 1,
-0.2810765, 0.783967, 0.4321339, 0, 0, 0, 1, 1,
-0.2788368, -0.1367081, -1.763002, 1, 1, 1, 1, 1,
-0.2777994, 1.731557, 0.401737, 1, 1, 1, 1, 1,
-0.2745903, -0.2034026, -2.321328, 1, 1, 1, 1, 1,
-0.271073, 0.5528615, 1.101214, 1, 1, 1, 1, 1,
-0.2706113, 0.212027, -1.197219, 1, 1, 1, 1, 1,
-0.2673828, 1.25539, -1.408413, 1, 1, 1, 1, 1,
-0.2644893, -1.404192, -3.890416, 1, 1, 1, 1, 1,
-0.263573, 0.9339437, -1.030457, 1, 1, 1, 1, 1,
-0.2599339, -0.659536, -0.7972997, 1, 1, 1, 1, 1,
-0.2581197, -0.4876225, -2.110836, 1, 1, 1, 1, 1,
-0.2539554, -1.284039, -3.472607, 1, 1, 1, 1, 1,
-0.2480841, -1.011891, -2.664982, 1, 1, 1, 1, 1,
-0.243056, 0.06803446, -1.899428, 1, 1, 1, 1, 1,
-0.242813, 1.143535, 0.09442956, 1, 1, 1, 1, 1,
-0.2394388, -1.647714, -2.440132, 1, 1, 1, 1, 1,
-0.2348436, -0.5359275, -2.702888, 0, 0, 1, 1, 1,
-0.2276067, -0.7253955, -0.3262432, 1, 0, 0, 1, 1,
-0.2275713, -1.83779, -2.088387, 1, 0, 0, 1, 1,
-0.2262162, -1.134978, -3.403954, 1, 0, 0, 1, 1,
-0.2254193, -1.318494, -5.0202, 1, 0, 0, 1, 1,
-0.221144, -1.855527, -2.770947, 1, 0, 0, 1, 1,
-0.2208817, 0.9322562, -1.000073, 0, 0, 0, 1, 1,
-0.2179534, -1.012453, -2.316101, 0, 0, 0, 1, 1,
-0.2127466, 0.04473403, -0.2882861, 0, 0, 0, 1, 1,
-0.2109377, 0.9876986, -1.859971, 0, 0, 0, 1, 1,
-0.2086851, 1.759806, 1.022806, 0, 0, 0, 1, 1,
-0.2079385, 0.0361468, -0.979913, 0, 0, 0, 1, 1,
-0.2058514, 0.5999898, -1.055667, 0, 0, 0, 1, 1,
-0.2035204, -0.7541316, -1.915826, 1, 1, 1, 1, 1,
-0.1977354, -0.5342963, -2.82033, 1, 1, 1, 1, 1,
-0.1962668, -0.3452531, -1.700799, 1, 1, 1, 1, 1,
-0.1916157, 1.744334, 1.197728, 1, 1, 1, 1, 1,
-0.1889289, 0.3852315, -1.154011, 1, 1, 1, 1, 1,
-0.1882866, 1.006683, -0.5346032, 1, 1, 1, 1, 1,
-0.1882641, 2.145152, -1.392053, 1, 1, 1, 1, 1,
-0.1855534, 0.3680942, -1.005936, 1, 1, 1, 1, 1,
-0.18544, 0.007010861, -0.6232681, 1, 1, 1, 1, 1,
-0.1844996, 0.4420301, -0.5617617, 1, 1, 1, 1, 1,
-0.1834656, -0.7170455, -3.9041, 1, 1, 1, 1, 1,
-0.1827079, -1.497295, -1.535523, 1, 1, 1, 1, 1,
-0.1760177, -0.1437234, -1.628811, 1, 1, 1, 1, 1,
-0.1673778, -0.7896062, -2.406589, 1, 1, 1, 1, 1,
-0.1642888, 0.7283031, -0.8951494, 1, 1, 1, 1, 1,
-0.1629723, 0.4425814, -0.5655129, 0, 0, 1, 1, 1,
-0.1619979, 0.4327049, -0.01059538, 1, 0, 0, 1, 1,
-0.1618096, 1.313184, 0.07732531, 1, 0, 0, 1, 1,
-0.1616914, -1.015361, -2.522504, 1, 0, 0, 1, 1,
-0.1578345, -0.1206409, -1.787475, 1, 0, 0, 1, 1,
-0.1534906, -0.2018397, -3.794049, 1, 0, 0, 1, 1,
-0.1518986, -0.7911846, -3.565046, 0, 0, 0, 1, 1,
-0.1516258, -1.306099, -2.267698, 0, 0, 0, 1, 1,
-0.1483952, 1.58638, 0.5917767, 0, 0, 0, 1, 1,
-0.1475538, -0.1441047, -2.176239, 0, 0, 0, 1, 1,
-0.1473625, 0.2306419, -0.9062314, 0, 0, 0, 1, 1,
-0.1463305, -0.5229651, -2.466313, 0, 0, 0, 1, 1,
-0.1405108, 0.6925318, 0.3025281, 0, 0, 0, 1, 1,
-0.1358752, 0.8688988, 1.580003, 1, 1, 1, 1, 1,
-0.1342839, 0.5163268, -0.9108758, 1, 1, 1, 1, 1,
-0.1336123, -0.9269419, -3.57986, 1, 1, 1, 1, 1,
-0.1163741, 1.496861, -1.794965, 1, 1, 1, 1, 1,
-0.1157468, 1.230289, 0.03739114, 1, 1, 1, 1, 1,
-0.1155913, -0.6303496, -5.798666, 1, 1, 1, 1, 1,
-0.1143299, 1.513273, 0.5576555, 1, 1, 1, 1, 1,
-0.1117984, 0.4296678, 1.60966, 1, 1, 1, 1, 1,
-0.1110195, -0.3328103, -1.419807, 1, 1, 1, 1, 1,
-0.1031183, -1.08563, -2.348491, 1, 1, 1, 1, 1,
-0.1016132, -0.820327, -3.888751, 1, 1, 1, 1, 1,
-0.09868297, -0.3191703, -3.818401, 1, 1, 1, 1, 1,
-0.09522637, 2.11107, 0.1713239, 1, 1, 1, 1, 1,
-0.09420697, 1.712451, 0.2008256, 1, 1, 1, 1, 1,
-0.09375021, 0.6039867, 1.430663, 1, 1, 1, 1, 1,
-0.09283215, -1.097973, -2.176975, 0, 0, 1, 1, 1,
-0.08727702, -0.6613539, -4.384362, 1, 0, 0, 1, 1,
-0.08225785, -1.087861, -2.663403, 1, 0, 0, 1, 1,
-0.08205125, -0.6982886, -3.871941, 1, 0, 0, 1, 1,
-0.08187915, 0.09719075, -0.1445922, 1, 0, 0, 1, 1,
-0.07944458, 0.6697854, 0.8888612, 1, 0, 0, 1, 1,
-0.07731722, 0.1526994, -0.7569125, 0, 0, 0, 1, 1,
-0.07666975, -0.70647, -2.575403, 0, 0, 0, 1, 1,
-0.07323056, 1.133959, 0.522576, 0, 0, 0, 1, 1,
-0.07232185, 0.9056484, 0.227671, 0, 0, 0, 1, 1,
-0.0710893, 0.3604164, -0.6497391, 0, 0, 0, 1, 1,
-0.07066501, -0.4732046, -2.503488, 0, 0, 0, 1, 1,
-0.06977751, 0.3584055, 0.173022, 0, 0, 0, 1, 1,
-0.06149858, 0.4182578, 0.4321626, 1, 1, 1, 1, 1,
-0.06108095, 0.2421387, -0.08121125, 1, 1, 1, 1, 1,
-0.05367404, 1.5914, -0.784221, 1, 1, 1, 1, 1,
-0.05336896, -1.204705, -4.733558, 1, 1, 1, 1, 1,
-0.05216487, -0.7078912, -3.575336, 1, 1, 1, 1, 1,
-0.04746644, 1.307234, -1.228212, 1, 1, 1, 1, 1,
-0.04576841, -0.2614494, -2.357694, 1, 1, 1, 1, 1,
-0.04193095, -0.09134264, -3.658982, 1, 1, 1, 1, 1,
-0.03632659, -0.1887429, -3.379429, 1, 1, 1, 1, 1,
-0.03443358, 1.338511, 0.2108469, 1, 1, 1, 1, 1,
-0.03136773, -0.2546185, -2.591898, 1, 1, 1, 1, 1,
-0.02858442, -0.3275559, -2.478835, 1, 1, 1, 1, 1,
-0.02852001, 1.99523, 1.534428, 1, 1, 1, 1, 1,
-0.02725055, -0.8095471, -1.657831, 1, 1, 1, 1, 1,
-0.02533085, -0.2748636, -3.21977, 1, 1, 1, 1, 1,
-0.02432362, -0.04933435, -1.811298, 0, 0, 1, 1, 1,
-0.01767916, -1.483891, -2.736467, 1, 0, 0, 1, 1,
-0.01489569, 0.4535744, 0.4807979, 1, 0, 0, 1, 1,
-0.008488448, 0.00633118, -1.155212, 1, 0, 0, 1, 1,
-0.006487052, 0.492343, -0.5328418, 1, 0, 0, 1, 1,
-0.00494764, 0.1964415, 0.2074029, 1, 0, 0, 1, 1,
0.002146391, -0.04170812, 3.758295, 0, 0, 0, 1, 1,
0.003983628, -1.495131, 3.327531, 0, 0, 0, 1, 1,
0.007645993, 0.6239712, -0.5745332, 0, 0, 0, 1, 1,
0.009469938, 0.8557057, -0.08127991, 0, 0, 0, 1, 1,
0.01004121, 0.3004116, -0.09428973, 0, 0, 0, 1, 1,
0.01463386, -1.588834, 3.816994, 0, 0, 0, 1, 1,
0.01472466, 1.665191, 0.89259, 0, 0, 0, 1, 1,
0.01647587, 0.4727842, 1.25814, 1, 1, 1, 1, 1,
0.02327055, 0.6412268, 1.410949, 1, 1, 1, 1, 1,
0.03052398, 0.06264195, -0.03963597, 1, 1, 1, 1, 1,
0.03134244, 1.329499, 0.3618565, 1, 1, 1, 1, 1,
0.03242332, -1.574154, 2.534621, 1, 1, 1, 1, 1,
0.03352849, 0.9744666, -0.7620882, 1, 1, 1, 1, 1,
0.03512896, -0.9608451, 3.417783, 1, 1, 1, 1, 1,
0.03725451, 0.179921, 2.251399, 1, 1, 1, 1, 1,
0.03757425, -0.349157, 2.813411, 1, 1, 1, 1, 1,
0.05176646, 0.0919344, 0.5531998, 1, 1, 1, 1, 1,
0.05225568, -0.1069498, 4.195359, 1, 1, 1, 1, 1,
0.05380685, -0.02073001, 3.432879, 1, 1, 1, 1, 1,
0.05822618, 1.290665, -0.9359866, 1, 1, 1, 1, 1,
0.05859834, 0.8934874, 1.139814, 1, 1, 1, 1, 1,
0.05971848, -0.5331367, 3.059402, 1, 1, 1, 1, 1,
0.06072692, 0.2846206, 1.298898, 0, 0, 1, 1, 1,
0.06216177, 0.2414193, -0.6246456, 1, 0, 0, 1, 1,
0.06446193, -1.095741, 2.434037, 1, 0, 0, 1, 1,
0.06649502, 1.646552, -0.862775, 1, 0, 0, 1, 1,
0.06830722, 1.032211, -0.9596396, 1, 0, 0, 1, 1,
0.06943074, 1.068748, -0.3888853, 1, 0, 0, 1, 1,
0.07071376, -0.4123437, 2.658968, 0, 0, 0, 1, 1,
0.07116194, -2.123563, 3.021279, 0, 0, 0, 1, 1,
0.07359009, -0.8728405, 3.835028, 0, 0, 0, 1, 1,
0.07990382, -0.01690487, 0.4188644, 0, 0, 0, 1, 1,
0.08232184, 1.901773, 0.171336, 0, 0, 0, 1, 1,
0.08343604, 1.650468, -1.421227, 0, 0, 0, 1, 1,
0.0856808, -0.1980932, 4.386394, 0, 0, 0, 1, 1,
0.08582602, -0.696585, 2.78582, 1, 1, 1, 1, 1,
0.08640315, 0.5672191, 1.287799, 1, 1, 1, 1, 1,
0.08672561, 2.084124, -0.6519141, 1, 1, 1, 1, 1,
0.0879878, 0.5182005, 1.603528, 1, 1, 1, 1, 1,
0.09290498, 0.2516145, 2.370778, 1, 1, 1, 1, 1,
0.09543968, 0.04863718, 0.6457456, 1, 1, 1, 1, 1,
0.09941296, 1.605316, -0.224513, 1, 1, 1, 1, 1,
0.1015885, -0.5351968, 2.164453, 1, 1, 1, 1, 1,
0.1033015, -0.6801561, 1.856155, 1, 1, 1, 1, 1,
0.1110042, -0.6108925, 2.017016, 1, 1, 1, 1, 1,
0.1138555, 1.561665, -0.8928862, 1, 1, 1, 1, 1,
0.117154, 1.216087, 1.001234, 1, 1, 1, 1, 1,
0.1174521, -0.532968, 2.84878, 1, 1, 1, 1, 1,
0.1178186, -1.899208, 2.214202, 1, 1, 1, 1, 1,
0.1186355, 0.4634663, -0.299089, 1, 1, 1, 1, 1,
0.1242952, 1.701506, 2.051908, 0, 0, 1, 1, 1,
0.1266654, -2.387189, 2.636601, 1, 0, 0, 1, 1,
0.1321064, -0.6906604, 2.857947, 1, 0, 0, 1, 1,
0.1415433, -1.260809, 3.101174, 1, 0, 0, 1, 1,
0.1451002, -0.6555787, 2.879869, 1, 0, 0, 1, 1,
0.1523462, 1.319068, 1.043352, 1, 0, 0, 1, 1,
0.153201, -0.5181237, 2.353368, 0, 0, 0, 1, 1,
0.1550127, 1.285272, 0.8977506, 0, 0, 0, 1, 1,
0.1557037, -1.28857, 1.356714, 0, 0, 0, 1, 1,
0.1568221, -1.86379, 2.714386, 0, 0, 0, 1, 1,
0.1592975, 1.709769, -1.24739, 0, 0, 0, 1, 1,
0.1597511, 1.870701, 0.644667, 0, 0, 0, 1, 1,
0.1604718, -0.4446005, 1.370148, 0, 0, 0, 1, 1,
0.1610062, 1.075482, -0.5794755, 1, 1, 1, 1, 1,
0.1612269, -0.07041971, 2.470265, 1, 1, 1, 1, 1,
0.1651361, -0.5756327, 3.541829, 1, 1, 1, 1, 1,
0.1653559, 0.1523282, 0.5016572, 1, 1, 1, 1, 1,
0.1689637, 0.6415314, -0.06442666, 1, 1, 1, 1, 1,
0.1710315, 0.4708033, -1.775442, 1, 1, 1, 1, 1,
0.1711734, -0.5808097, 2.346001, 1, 1, 1, 1, 1,
0.1790029, 0.01702218, 2.506477, 1, 1, 1, 1, 1,
0.1822633, -0.09088084, 1.715334, 1, 1, 1, 1, 1,
0.1888853, 0.7174996, -1.357304, 1, 1, 1, 1, 1,
0.1948838, -1.292178, 2.379057, 1, 1, 1, 1, 1,
0.1951482, 2.61944, -0.3516652, 1, 1, 1, 1, 1,
0.1965928, 0.00945723, 3.178439, 1, 1, 1, 1, 1,
0.1985511, -0.1526061, 0.7397189, 1, 1, 1, 1, 1,
0.1985847, -1.157062, 3.293926, 1, 1, 1, 1, 1,
0.1998286, 0.7859724, 0.9085498, 0, 0, 1, 1, 1,
0.20786, -1.659617, 2.983561, 1, 0, 0, 1, 1,
0.2086246, 0.4381201, 1.212106, 1, 0, 0, 1, 1,
0.2147746, -0.5295215, 2.950883, 1, 0, 0, 1, 1,
0.2161694, -1.32048, 4.675067, 1, 0, 0, 1, 1,
0.2162594, 0.5065279, -0.2228608, 1, 0, 0, 1, 1,
0.2173028, 0.4172535, 0.07459386, 0, 0, 0, 1, 1,
0.2192387, -0.5589674, 2.498229, 0, 0, 0, 1, 1,
0.2259742, -0.2775306, 3.582977, 0, 0, 0, 1, 1,
0.2262132, 0.09720179, 2.19515, 0, 0, 0, 1, 1,
0.2281835, 0.4481227, -0.8611752, 0, 0, 0, 1, 1,
0.228739, 1.184798, -0.5948274, 0, 0, 0, 1, 1,
0.2302113, 0.6895996, 1.259977, 0, 0, 0, 1, 1,
0.2325349, 0.0416473, -1.008622, 1, 1, 1, 1, 1,
0.2340856, 1.403083, -0.09776278, 1, 1, 1, 1, 1,
0.2345049, 0.5748459, 0.2135867, 1, 1, 1, 1, 1,
0.2366153, 0.21754, 1.669834, 1, 1, 1, 1, 1,
0.2464943, 0.6378532, 1.240499, 1, 1, 1, 1, 1,
0.2552112, -0.9827521, 2.263805, 1, 1, 1, 1, 1,
0.2553748, 1.626676, -1.91788, 1, 1, 1, 1, 1,
0.2565657, 1.078805, 0.2101937, 1, 1, 1, 1, 1,
0.2606641, -0.06881839, 0.3184579, 1, 1, 1, 1, 1,
0.2660027, -0.1221276, 2.527311, 1, 1, 1, 1, 1,
0.2661022, -0.237895, 1.554059, 1, 1, 1, 1, 1,
0.2663403, 0.3530261, -0.3025487, 1, 1, 1, 1, 1,
0.2664358, -0.2002839, 4.125192, 1, 1, 1, 1, 1,
0.2672514, -2.3502, 2.663635, 1, 1, 1, 1, 1,
0.2687652, -0.6476129, -0.006921911, 1, 1, 1, 1, 1,
0.2702766, 0.1561048, 1.017019, 0, 0, 1, 1, 1,
0.2704806, 0.8162526, -1.19489, 1, 0, 0, 1, 1,
0.2750238, -0.3923658, 2.645834, 1, 0, 0, 1, 1,
0.2779844, 0.4364958, 0.719337, 1, 0, 0, 1, 1,
0.283373, -0.1860243, 2.655022, 1, 0, 0, 1, 1,
0.2842229, 0.8160305, 0.6467419, 1, 0, 0, 1, 1,
0.2849587, -0.2199213, 2.058781, 0, 0, 0, 1, 1,
0.2893882, 0.05090957, 2.708611, 0, 0, 0, 1, 1,
0.2903553, 1.899122, 0.9835647, 0, 0, 0, 1, 1,
0.2920164, -1.002452, 2.209334, 0, 0, 0, 1, 1,
0.2962098, 1.094388, -0.5708359, 0, 0, 0, 1, 1,
0.3027761, 0.1868664, 3.858851, 0, 0, 0, 1, 1,
0.3051938, -1.814252, 0.9435283, 0, 0, 0, 1, 1,
0.309159, 1.137009, 1.41426, 1, 1, 1, 1, 1,
0.3130866, -0.9435285, 1.445908, 1, 1, 1, 1, 1,
0.3133508, -0.02235414, 3.006171, 1, 1, 1, 1, 1,
0.3151284, -1.344521, 1.098614, 1, 1, 1, 1, 1,
0.3197798, -2.536068, 2.372599, 1, 1, 1, 1, 1,
0.3214673, 0.8440431, -0.3945231, 1, 1, 1, 1, 1,
0.3234315, 0.9037613, 0.2515756, 1, 1, 1, 1, 1,
0.3237541, -0.3184424, 3.211792, 1, 1, 1, 1, 1,
0.3278912, 1.314445, -0.1006774, 1, 1, 1, 1, 1,
0.3283223, -1.320837, 2.011917, 1, 1, 1, 1, 1,
0.3326912, 0.7913499, -0.1936536, 1, 1, 1, 1, 1,
0.3329906, -0.5639106, 3.889709, 1, 1, 1, 1, 1,
0.3343059, -0.3779934, 1.245786, 1, 1, 1, 1, 1,
0.3366286, -0.2257817, 2.872224, 1, 1, 1, 1, 1,
0.3391709, -0.1769895, 2.82004, 1, 1, 1, 1, 1,
0.3401505, -0.6549283, 2.765472, 0, 0, 1, 1, 1,
0.3407104, 0.1425181, 0.8101324, 1, 0, 0, 1, 1,
0.342011, 0.2131906, 1.979345, 1, 0, 0, 1, 1,
0.3434483, 1.351806, 1.76084, 1, 0, 0, 1, 1,
0.3451675, 1.141518, 0.9342028, 1, 0, 0, 1, 1,
0.3462071, 0.4045143, 1.841731, 1, 0, 0, 1, 1,
0.3494696, 0.8067267, 0.7338335, 0, 0, 0, 1, 1,
0.3506857, 1.288502, 0.527012, 0, 0, 0, 1, 1,
0.3535518, -1.45662, 2.923174, 0, 0, 0, 1, 1,
0.3613597, 0.2692979, 3.097235, 0, 0, 0, 1, 1,
0.3625168, 1.030457, 1.02204, 0, 0, 0, 1, 1,
0.3643582, -1.188789, 1.91545, 0, 0, 0, 1, 1,
0.3678782, 0.3494904, 1.171109, 0, 0, 0, 1, 1,
0.3705802, 0.6342737, -0.6528639, 1, 1, 1, 1, 1,
0.3729947, -0.6037056, 2.726279, 1, 1, 1, 1, 1,
0.3737152, 1.018195, -1.628794, 1, 1, 1, 1, 1,
0.3803897, -1.126795, 1.737735, 1, 1, 1, 1, 1,
0.3813249, -0.5234926, 1.51756, 1, 1, 1, 1, 1,
0.3929072, 0.9911951, -0.2364754, 1, 1, 1, 1, 1,
0.3932365, -1.387861, 3.32922, 1, 1, 1, 1, 1,
0.3935982, 0.902597, 0.6764914, 1, 1, 1, 1, 1,
0.3975166, -1.661909, 2.829904, 1, 1, 1, 1, 1,
0.4063787, 0.05717163, 1.605563, 1, 1, 1, 1, 1,
0.4088538, 0.05244857, 1.419825, 1, 1, 1, 1, 1,
0.4127041, -0.2931907, 1.609622, 1, 1, 1, 1, 1,
0.4150389, 0.787001, 1.285781, 1, 1, 1, 1, 1,
0.4150858, 0.3003798, 0.8833994, 1, 1, 1, 1, 1,
0.4210356, -0.7176504, 2.14695, 1, 1, 1, 1, 1,
0.4216608, -1.047759, 0.9101449, 0, 0, 1, 1, 1,
0.4228365, 1.81554, 1.677311, 1, 0, 0, 1, 1,
0.4229988, -0.1325693, 2.384442, 1, 0, 0, 1, 1,
0.4290457, -1.125874, 3.023139, 1, 0, 0, 1, 1,
0.4318803, -2.116728, 2.82563, 1, 0, 0, 1, 1,
0.4323801, -0.2087512, 1.395732, 1, 0, 0, 1, 1,
0.4342711, -0.6067013, 2.420548, 0, 0, 0, 1, 1,
0.4350243, 0.2089726, 2.060308, 0, 0, 0, 1, 1,
0.4356207, 1.461987, -1.096275, 0, 0, 0, 1, 1,
0.4374741, 0.9743015, -1.301821, 0, 0, 0, 1, 1,
0.4380812, -1.454824, 3.568747, 0, 0, 0, 1, 1,
0.4389102, 0.4579434, -0.8171819, 0, 0, 0, 1, 1,
0.4405147, 0.2900329, 0.1338181, 0, 0, 0, 1, 1,
0.4419152, -1.020031, 0.7617291, 1, 1, 1, 1, 1,
0.4464922, 0.1183616, 1.424199, 1, 1, 1, 1, 1,
0.4481257, 0.5908599, 1.142984, 1, 1, 1, 1, 1,
0.4486314, 0.775775, 1.529671, 1, 1, 1, 1, 1,
0.4491425, 2.30602, -0.7426689, 1, 1, 1, 1, 1,
0.4573438, -1.271875, 2.126569, 1, 1, 1, 1, 1,
0.4577618, 0.4571153, 1.389155, 1, 1, 1, 1, 1,
0.4580691, -1.351996, 2.216059, 1, 1, 1, 1, 1,
0.4721887, -1.731438, 3.75101, 1, 1, 1, 1, 1,
0.472793, -0.9854105, 2.640838, 1, 1, 1, 1, 1,
0.4781267, 0.8149291, -0.7880339, 1, 1, 1, 1, 1,
0.4782553, -0.04175262, 3.143074, 1, 1, 1, 1, 1,
0.4884341, -1.270504, 3.741313, 1, 1, 1, 1, 1,
0.4886087, -1.136999, 1.345208, 1, 1, 1, 1, 1,
0.4893954, 0.148099, 0.01545058, 1, 1, 1, 1, 1,
0.4897053, 0.6289878, -0.2643569, 0, 0, 1, 1, 1,
0.4900388, 0.7323731, -0.9811581, 1, 0, 0, 1, 1,
0.4931141, -0.6896973, 1.941727, 1, 0, 0, 1, 1,
0.4991771, 0.08947217, 0.7244453, 1, 0, 0, 1, 1,
0.4996825, 0.1575335, 1.078136, 1, 0, 0, 1, 1,
0.5007309, -0.9982465, 1.46118, 1, 0, 0, 1, 1,
0.5049172, 1.339673, -0.1823968, 0, 0, 0, 1, 1,
0.5051044, 1.160439, 1.201521, 0, 0, 0, 1, 1,
0.5056623, 0.1557137, 1.729637, 0, 0, 0, 1, 1,
0.5070767, -1.697735, 4.813104, 0, 0, 0, 1, 1,
0.5113663, -0.3735116, 1.361114, 0, 0, 0, 1, 1,
0.5129639, -0.2248533, 2.492685, 0, 0, 0, 1, 1,
0.5136928, 0.0200987, 0.4686043, 0, 0, 0, 1, 1,
0.5153824, -0.9515334, 4.362486, 1, 1, 1, 1, 1,
0.5204984, 0.5793335, 1.161078, 1, 1, 1, 1, 1,
0.5210938, 0.1553767, 0.6077285, 1, 1, 1, 1, 1,
0.5221659, 0.5122173, 2.498004, 1, 1, 1, 1, 1,
0.5252977, -0.622355, 1.435534, 1, 1, 1, 1, 1,
0.528334, -0.06740553, 2.925869, 1, 1, 1, 1, 1,
0.5357225, 0.7511103, 0.05953414, 1, 1, 1, 1, 1,
0.5392572, 1.06333, 0.3809788, 1, 1, 1, 1, 1,
0.5411886, 1.235098, 0.7174749, 1, 1, 1, 1, 1,
0.5442965, -0.203985, 1.619447, 1, 1, 1, 1, 1,
0.5449357, 1.006323, 0.7628383, 1, 1, 1, 1, 1,
0.5470356, -0.8468469, 2.541972, 1, 1, 1, 1, 1,
0.5524534, -0.5828285, 2.660157, 1, 1, 1, 1, 1,
0.5533569, -0.3830299, 1.062971, 1, 1, 1, 1, 1,
0.5534177, -0.4023022, -0.2371987, 1, 1, 1, 1, 1,
0.5612083, 0.5753098, 1.166918, 0, 0, 1, 1, 1,
0.5680484, -1.133386, 4.184675, 1, 0, 0, 1, 1,
0.568835, -1.664604, 3.025807, 1, 0, 0, 1, 1,
0.5755661, -0.209951, 2.412098, 1, 0, 0, 1, 1,
0.5800903, 0.6207734, -0.3924982, 1, 0, 0, 1, 1,
0.5894076, 0.6253408, 1.330954, 1, 0, 0, 1, 1,
0.5895944, -1.881811, 1.992807, 0, 0, 0, 1, 1,
0.5940313, 0.9379274, 1.461326, 0, 0, 0, 1, 1,
0.5942033, -0.8245355, 2.708616, 0, 0, 0, 1, 1,
0.6000894, 0.03897002, 1.472357, 0, 0, 0, 1, 1,
0.6011175, -1.407725, 2.918898, 0, 0, 0, 1, 1,
0.6068708, -0.04569003, 2.758485, 0, 0, 0, 1, 1,
0.6119657, -2.57084, 3.722507, 0, 0, 0, 1, 1,
0.6161559, -0.2396632, 1.608037, 1, 1, 1, 1, 1,
0.6167706, -0.2465219, 1.841876, 1, 1, 1, 1, 1,
0.6199049, -1.17254, 3.095215, 1, 1, 1, 1, 1,
0.6265561, 2.935446, 0.6026393, 1, 1, 1, 1, 1,
0.6310341, 1.389317, 0.737507, 1, 1, 1, 1, 1,
0.6331448, 1.239511, 1.170674, 1, 1, 1, 1, 1,
0.6354813, -1.299784, 2.687158, 1, 1, 1, 1, 1,
0.6367389, 1.195245, 1.285953, 1, 1, 1, 1, 1,
0.6370323, 0.02636312, 1.80356, 1, 1, 1, 1, 1,
0.6455967, -0.1468621, 2.313538, 1, 1, 1, 1, 1,
0.6463965, -0.2309925, 2.82553, 1, 1, 1, 1, 1,
0.6509041, -1.695279, 3.453697, 1, 1, 1, 1, 1,
0.6520368, 0.01153114, 1.884923, 1, 1, 1, 1, 1,
0.6520877, -0.3907911, 1.407826, 1, 1, 1, 1, 1,
0.6544988, 0.2355552, -0.3588271, 1, 1, 1, 1, 1,
0.6549397, -0.5611687, 1.97701, 0, 0, 1, 1, 1,
0.6577652, 0.5265379, 1.054373, 1, 0, 0, 1, 1,
0.6623791, -0.8854198, 3.033827, 1, 0, 0, 1, 1,
0.6667501, -0.6175122, 2.978345, 1, 0, 0, 1, 1,
0.669809, 0.3410881, 0.88467, 1, 0, 0, 1, 1,
0.6803896, 0.2342835, 1.369412, 1, 0, 0, 1, 1,
0.6838107, -1.144082, 2.916792, 0, 0, 0, 1, 1,
0.6851218, 0.2064926, -0.1410459, 0, 0, 0, 1, 1,
0.6852661, -0.4012133, 1.904726, 0, 0, 0, 1, 1,
0.6878282, 0.06155406, 2.475168, 0, 0, 0, 1, 1,
0.688326, -0.2055458, 2.721077, 0, 0, 0, 1, 1,
0.6899616, 0.9849697, -0.1140016, 0, 0, 0, 1, 1,
0.7001988, 1.469826, -0.1436363, 0, 0, 0, 1, 1,
0.7034479, -0.1060691, 1.738203, 1, 1, 1, 1, 1,
0.7046555, -0.002957576, 1.002681, 1, 1, 1, 1, 1,
0.7054669, -0.01201044, 4.354075, 1, 1, 1, 1, 1,
0.7066228, 0.1762473, 0.6558496, 1, 1, 1, 1, 1,
0.707076, 0.6968584, 2.359879, 1, 1, 1, 1, 1,
0.7089414, -0.348247, 1.373921, 1, 1, 1, 1, 1,
0.7109598, -0.02644042, 1.524327, 1, 1, 1, 1, 1,
0.7151922, 0.5677307, 0.6812698, 1, 1, 1, 1, 1,
0.7157771, 0.2808087, 3.290382, 1, 1, 1, 1, 1,
0.7186723, -0.6275139, 3.851269, 1, 1, 1, 1, 1,
0.7250241, -0.749483, 3.629517, 1, 1, 1, 1, 1,
0.7302116, -0.4206951, 2.202237, 1, 1, 1, 1, 1,
0.7321023, 0.7759295, 1.572939, 1, 1, 1, 1, 1,
0.7326969, 0.4793417, 1.365917, 1, 1, 1, 1, 1,
0.73712, 1.624604, -0.9595678, 1, 1, 1, 1, 1,
0.7372164, -0.7038199, 3.596258, 0, 0, 1, 1, 1,
0.7418951, 0.5649859, 3.388253, 1, 0, 0, 1, 1,
0.7441533, 0.2806754, 1.149685, 1, 0, 0, 1, 1,
0.7458546, -0.7996134, 3.93175, 1, 0, 0, 1, 1,
0.7483631, -0.7690265, 3.252501, 1, 0, 0, 1, 1,
0.7553315, 0.1393285, 2.659206, 1, 0, 0, 1, 1,
0.7570354, -0.01531846, 0.2524771, 0, 0, 0, 1, 1,
0.7575901, -1.061405, -0.2849962, 0, 0, 0, 1, 1,
0.7600787, -1.749747, 2.800891, 0, 0, 0, 1, 1,
0.7603887, 0.1708041, 0.8596858, 0, 0, 0, 1, 1,
0.7660767, -1.321686, 3.314825, 0, 0, 0, 1, 1,
0.7661126, -0.8788089, 3.191839, 0, 0, 0, 1, 1,
0.7761233, 1.647958, -0.1049281, 0, 0, 0, 1, 1,
0.7762769, 0.3216496, 2.202427, 1, 1, 1, 1, 1,
0.7767944, -0.1816667, 0.5406318, 1, 1, 1, 1, 1,
0.7772316, -0.8390516, 2.389213, 1, 1, 1, 1, 1,
0.7820435, -0.3151228, 1.712491, 1, 1, 1, 1, 1,
0.8007919, 1.234087, 1.918252, 1, 1, 1, 1, 1,
0.8041988, -0.9860918, 1.824131, 1, 1, 1, 1, 1,
0.807835, 1.149164, 1.308586, 1, 1, 1, 1, 1,
0.8079249, 0.07473077, -0.8478376, 1, 1, 1, 1, 1,
0.8113944, 0.4406283, 1.20599, 1, 1, 1, 1, 1,
0.8157009, -0.4450198, 2.355146, 1, 1, 1, 1, 1,
0.8223643, 0.9388969, 1.918326, 1, 1, 1, 1, 1,
0.824914, -0.7207443, 1.224606, 1, 1, 1, 1, 1,
0.8273948, -0.2892725, 2.759928, 1, 1, 1, 1, 1,
0.8287274, 0.4144105, 0.6792105, 1, 1, 1, 1, 1,
0.8295875, -0.3924498, 2.312504, 1, 1, 1, 1, 1,
0.8315392, 0.8076662, 0.7227896, 0, 0, 1, 1, 1,
0.8337771, -1.036145, 2.602855, 1, 0, 0, 1, 1,
0.8357093, 1.667782, -2.459768, 1, 0, 0, 1, 1,
0.8434564, 0.6314604, 0.4810559, 1, 0, 0, 1, 1,
0.848381, 0.4352202, 0.3442393, 1, 0, 0, 1, 1,
0.850965, 0.8604478, 1.15213, 1, 0, 0, 1, 1,
0.8589552, -0.8305871, 2.379448, 0, 0, 0, 1, 1,
0.8614374, -1.820766, 3.916138, 0, 0, 0, 1, 1,
0.8631195, -0.3878501, 1.932701, 0, 0, 0, 1, 1,
0.8755915, -0.9888914, 3.268816, 0, 0, 0, 1, 1,
0.8762164, 0.6776657, -0.4112869, 0, 0, 0, 1, 1,
0.8765248, -0.7185336, 2.629948, 0, 0, 0, 1, 1,
0.8896415, 1.036431, 1.564399, 0, 0, 0, 1, 1,
0.9006268, -0.00530397, 3.289792, 1, 1, 1, 1, 1,
0.9016623, -0.2876509, 1.775464, 1, 1, 1, 1, 1,
0.9048781, 0.3125268, 2.812214, 1, 1, 1, 1, 1,
0.905127, 0.5933368, -0.7629707, 1, 1, 1, 1, 1,
0.9141487, 0.1731082, 0.6309607, 1, 1, 1, 1, 1,
0.9156799, 0.08698551, 3.53604, 1, 1, 1, 1, 1,
0.9170113, -0.2958826, 1.158341, 1, 1, 1, 1, 1,
0.9230631, 0.4958108, 1.884481, 1, 1, 1, 1, 1,
0.9255394, 1.319397, 0.8912529, 1, 1, 1, 1, 1,
0.9267035, 1.508567, 0.9956696, 1, 1, 1, 1, 1,
0.9313216, -0.5196807, 2.322328, 1, 1, 1, 1, 1,
0.9323798, 0.5554657, 0.05172375, 1, 1, 1, 1, 1,
0.9353853, -0.2350273, -0.09359516, 1, 1, 1, 1, 1,
0.9369073, -0.1943145, 0.7051091, 1, 1, 1, 1, 1,
0.9382712, 1.646326, 0.7752528, 1, 1, 1, 1, 1,
0.9427237, 0.8654407, 1.310416, 0, 0, 1, 1, 1,
0.9434638, -0.2166358, 1.257774, 1, 0, 0, 1, 1,
0.948432, -0.5283045, 2.729317, 1, 0, 0, 1, 1,
0.9492322, 0.8985784, 0.6228845, 1, 0, 0, 1, 1,
0.9531226, -1.348016, 3.764364, 1, 0, 0, 1, 1,
0.9542216, -0.7890384, 1.626151, 1, 0, 0, 1, 1,
0.9575586, -0.8887422, 3.134696, 0, 0, 0, 1, 1,
0.958127, 0.827259, -0.6673429, 0, 0, 0, 1, 1,
0.9615253, -0.2706756, 2.946115, 0, 0, 0, 1, 1,
0.9634088, 1.641492, 0.7761164, 0, 0, 0, 1, 1,
0.964851, 0.7558797, 2.863225, 0, 0, 0, 1, 1,
0.9677879, -1.247856, 3.222243, 0, 0, 0, 1, 1,
0.9697075, -1.550377, 1.528694, 0, 0, 0, 1, 1,
0.9743501, -0.2005185, 2.208638, 1, 1, 1, 1, 1,
0.9750555, 1.646773, 2.460815, 1, 1, 1, 1, 1,
0.978547, -1.116358, 3.071439, 1, 1, 1, 1, 1,
0.9909416, -0.270186, 0.05255361, 1, 1, 1, 1, 1,
0.9913623, 0.4476133, -0.7568167, 1, 1, 1, 1, 1,
0.9924482, 1.024433, 1.172351, 1, 1, 1, 1, 1,
0.9939406, -0.007867108, 0.6905783, 1, 1, 1, 1, 1,
1.003101, 1.852648, -0.9672977, 1, 1, 1, 1, 1,
1.00338, 0.6377222, 0.7798652, 1, 1, 1, 1, 1,
1.003771, 0.007685992, 2.113176, 1, 1, 1, 1, 1,
1.014757, 0.7845906, 3.005125, 1, 1, 1, 1, 1,
1.024956, -0.04337785, 2.115531, 1, 1, 1, 1, 1,
1.028087, 0.1477068, 1.00009, 1, 1, 1, 1, 1,
1.043399, -1.089398, 2.512181, 1, 1, 1, 1, 1,
1.043879, 0.2330311, 1.369012, 1, 1, 1, 1, 1,
1.043893, -0.9078284, 3.601816, 0, 0, 1, 1, 1,
1.049994, -0.2174937, 1.423238, 1, 0, 0, 1, 1,
1.060085, -1.292343, 2.512019, 1, 0, 0, 1, 1,
1.066585, 0.03382622, 2.883964, 1, 0, 0, 1, 1,
1.069493, 1.009483, 1.315487, 1, 0, 0, 1, 1,
1.07038, 1.261196, 2.116207, 1, 0, 0, 1, 1,
1.077571, 0.2029902, 2.916754, 0, 0, 0, 1, 1,
1.079562, 0.7676473, 2.601365, 0, 0, 0, 1, 1,
1.082548, -1.205634, 2.308958, 0, 0, 0, 1, 1,
1.08768, -0.1257586, 1.696174, 0, 0, 0, 1, 1,
1.087734, -1.381324, 1.258996, 0, 0, 0, 1, 1,
1.092347, 1.11689, 0.1098151, 0, 0, 0, 1, 1,
1.095543, 0.7315659, -0.4357172, 0, 0, 0, 1, 1,
1.103738, -0.9925314, 2.024191, 1, 1, 1, 1, 1,
1.10937, 0.1378636, 0.7688162, 1, 1, 1, 1, 1,
1.114078, -1.269401, -0.437043, 1, 1, 1, 1, 1,
1.116771, 1.207917, 0.7032739, 1, 1, 1, 1, 1,
1.117605, -0.00412588, 0.137495, 1, 1, 1, 1, 1,
1.117687, -0.2496983, 2.436615, 1, 1, 1, 1, 1,
1.118798, 1.813317, 0.4523049, 1, 1, 1, 1, 1,
1.119482, -0.423076, 4.689464, 1, 1, 1, 1, 1,
1.121075, -3.402639, 1.970878, 1, 1, 1, 1, 1,
1.123025, -2.16461, 2.408604, 1, 1, 1, 1, 1,
1.141136, -0.8148462, 0.8819107, 1, 1, 1, 1, 1,
1.143017, 0.716146, 0.9713691, 1, 1, 1, 1, 1,
1.143341, 0.176279, 0.9311374, 1, 1, 1, 1, 1,
1.146494, 0.03054413, 0.7668364, 1, 1, 1, 1, 1,
1.148343, 1.983068, 0.5812243, 1, 1, 1, 1, 1,
1.148661, 0.009581125, 2.585707, 0, 0, 1, 1, 1,
1.158444, -0.3992593, 3.14484, 1, 0, 0, 1, 1,
1.160866, -0.2445286, 0.8848189, 1, 0, 0, 1, 1,
1.170511, -0.4314885, 0.7137792, 1, 0, 0, 1, 1,
1.171638, 1.472705, -0.8327659, 1, 0, 0, 1, 1,
1.17199, -0.370907, 4.039763, 1, 0, 0, 1, 1,
1.174356, 1.583378, 1.163118, 0, 0, 0, 1, 1,
1.182428, -1.278562, 2.706308, 0, 0, 0, 1, 1,
1.183629, 0.7139589, 0.7795931, 0, 0, 0, 1, 1,
1.191099, -0.4241294, 1.873571, 0, 0, 0, 1, 1,
1.193099, 0.6568828, 0.8221005, 0, 0, 0, 1, 1,
1.198259, -0.09386411, 2.742023, 0, 0, 0, 1, 1,
1.201358, 0.8745195, 1.784175, 0, 0, 0, 1, 1,
1.210687, 0.9759042, 0.3968863, 1, 1, 1, 1, 1,
1.21249, 1.372287, 1.453835, 1, 1, 1, 1, 1,
1.213038, -0.2244675, 1.099651, 1, 1, 1, 1, 1,
1.223216, 1.037039, -0.7336513, 1, 1, 1, 1, 1,
1.246046, -0.7743666, 0.7207396, 1, 1, 1, 1, 1,
1.246341, 2.282823, 0.5183001, 1, 1, 1, 1, 1,
1.251813, -0.08257546, 0.5631353, 1, 1, 1, 1, 1,
1.253409, 0.4250412, 2.554904, 1, 1, 1, 1, 1,
1.264299, -0.784442, 2.380799, 1, 1, 1, 1, 1,
1.267965, 0.1965741, 2.355664, 1, 1, 1, 1, 1,
1.268653, 0.8195973, 1.043811, 1, 1, 1, 1, 1,
1.284281, -0.3892941, 1.679258, 1, 1, 1, 1, 1,
1.285906, 1.002772, 1.269408, 1, 1, 1, 1, 1,
1.289653, 0.7509446, 1.148157, 1, 1, 1, 1, 1,
1.28996, -0.793593, 3.584515, 1, 1, 1, 1, 1,
1.293765, -1.851122, 2.31648, 0, 0, 1, 1, 1,
1.293821, -0.5997563, 2.558039, 1, 0, 0, 1, 1,
1.307381, 0.4894241, -0.08885704, 1, 0, 0, 1, 1,
1.309246, 0.4507832, 1.482962, 1, 0, 0, 1, 1,
1.317707, 1.238145, 0.6229775, 1, 0, 0, 1, 1,
1.323639, 2.366863, 0.4877641, 1, 0, 0, 1, 1,
1.343508, 0.6089537, 2.861758, 0, 0, 0, 1, 1,
1.347321, 0.1660574, 2.151637, 0, 0, 0, 1, 1,
1.35072, -0.3789844, 3.271986, 0, 0, 0, 1, 1,
1.353637, -0.5903506, 3.187666, 0, 0, 0, 1, 1,
1.357883, 1.297619, 1.798288, 0, 0, 0, 1, 1,
1.360032, 0.001852462, 1.444394, 0, 0, 0, 1, 1,
1.36163, -2.138345, 4.293078, 0, 0, 0, 1, 1,
1.365491, -1.660983, 1.590145, 1, 1, 1, 1, 1,
1.370298, 0.1112769, 1.034132, 1, 1, 1, 1, 1,
1.375424, 1.25657, -0.1465521, 1, 1, 1, 1, 1,
1.384288, 0.5604111, 1.652347, 1, 1, 1, 1, 1,
1.386518, -0.02454128, 1.09384, 1, 1, 1, 1, 1,
1.394503, 1.168993, 0.6720149, 1, 1, 1, 1, 1,
1.398286, 0.634318, 2.676453, 1, 1, 1, 1, 1,
1.407725, -0.5679089, 0.8932908, 1, 1, 1, 1, 1,
1.409509, -0.6659161, 2.503788, 1, 1, 1, 1, 1,
1.413804, -1.360224, 2.360337, 1, 1, 1, 1, 1,
1.416255, 0.8363811, 1.047639, 1, 1, 1, 1, 1,
1.424206, -0.4394109, 0.3537855, 1, 1, 1, 1, 1,
1.433551, 0.4450161, 1.225025, 1, 1, 1, 1, 1,
1.43816, 1.149, -0.3850643, 1, 1, 1, 1, 1,
1.439036, -0.7735902, 1.172536, 1, 1, 1, 1, 1,
1.445504, 0.7379998, 0.5313532, 0, 0, 1, 1, 1,
1.445764, -0.4048042, 1.606432, 1, 0, 0, 1, 1,
1.452584, -1.779309, 2.064518, 1, 0, 0, 1, 1,
1.47614, -1.027548, 3.427608, 1, 0, 0, 1, 1,
1.49727, -0.2549341, 2.523907, 1, 0, 0, 1, 1,
1.508092, -1.055613, 2.24224, 1, 0, 0, 1, 1,
1.518052, -0.5201223, -0.01099539, 0, 0, 0, 1, 1,
1.527764, 1.93091, 0.7448761, 0, 0, 0, 1, 1,
1.532904, 0.1769675, 0.4390762, 0, 0, 0, 1, 1,
1.534225, 0.8672438, 1.725439, 0, 0, 0, 1, 1,
1.534817, 0.03084737, 1.987866, 0, 0, 0, 1, 1,
1.543274, 0.8198615, -0.2961658, 0, 0, 0, 1, 1,
1.56105, -0.7105236, 0.7660323, 0, 0, 0, 1, 1,
1.570123, -1.04496, 2.252202, 1, 1, 1, 1, 1,
1.570837, 1.585023, 1.362701, 1, 1, 1, 1, 1,
1.571858, -2.694904, 2.689569, 1, 1, 1, 1, 1,
1.596105, 1.272258, 1.236339, 1, 1, 1, 1, 1,
1.602256, 0.5127622, 1.475015, 1, 1, 1, 1, 1,
1.607947, -1.14666, 1.394276, 1, 1, 1, 1, 1,
1.614235, 0.971235, 2.242915, 1, 1, 1, 1, 1,
1.614444, -0.748093, 2.395464, 1, 1, 1, 1, 1,
1.621155, -0.01731517, 1.629447, 1, 1, 1, 1, 1,
1.634012, -1.625098, 1.828022, 1, 1, 1, 1, 1,
1.636836, 0.4900007, -0.5899525, 1, 1, 1, 1, 1,
1.647082, -0.5847769, 0.2947251, 1, 1, 1, 1, 1,
1.647321, 0.8158863, -0.2566213, 1, 1, 1, 1, 1,
1.662949, 0.2650264, 1.426002, 1, 1, 1, 1, 1,
1.672962, 1.27615, 0.3094181, 1, 1, 1, 1, 1,
1.682867, -1.607903, 2.174979, 0, 0, 1, 1, 1,
1.713019, 1.128082, 0.1315965, 1, 0, 0, 1, 1,
1.748372, -1.350612, 2.723091, 1, 0, 0, 1, 1,
1.755485, 0.5908434, 1.121501, 1, 0, 0, 1, 1,
1.755992, -0.7692813, -0.3625502, 1, 0, 0, 1, 1,
1.763876, -2.223754, 3.155336, 1, 0, 0, 1, 1,
1.783508, -0.459433, 2.084287, 0, 0, 0, 1, 1,
1.786081, -2.044436, 2.540974, 0, 0, 0, 1, 1,
1.791984, 2.032302, 1.881759, 0, 0, 0, 1, 1,
1.798744, 0.1460279, 2.512942, 0, 0, 0, 1, 1,
1.810248, 3.151148, 0.5461613, 0, 0, 0, 1, 1,
1.817566, -0.2191095, 2.891645, 0, 0, 0, 1, 1,
1.824107, 1.418789, 1.949793, 0, 0, 0, 1, 1,
1.824908, -0.2027593, 0.532146, 1, 1, 1, 1, 1,
1.827085, -2.429464, 0.06765478, 1, 1, 1, 1, 1,
1.837475, 0.8616378, 2.482754, 1, 1, 1, 1, 1,
1.838931, 0.8830364, 0.6921442, 1, 1, 1, 1, 1,
1.862303, -0.7242002, 2.487408, 1, 1, 1, 1, 1,
1.869616, -0.8744568, 0.8423315, 1, 1, 1, 1, 1,
1.878904, -0.4088396, 1.232569, 1, 1, 1, 1, 1,
1.879582, -0.7362035, 1.822214, 1, 1, 1, 1, 1,
1.881024, -1.010254, 3.006579, 1, 1, 1, 1, 1,
1.920635, 0.6397403, 1.086637, 1, 1, 1, 1, 1,
1.932409, -0.3337176, 1.329917, 1, 1, 1, 1, 1,
1.975422, 0.7580379, 0.5644388, 1, 1, 1, 1, 1,
2.030915, 1.076206, 0.5742301, 1, 1, 1, 1, 1,
2.071253, -0.3528336, 2.069912, 1, 1, 1, 1, 1,
2.071624, -0.6873851, 3.782682, 1, 1, 1, 1, 1,
2.072124, 0.05574404, 0.9371389, 0, 0, 1, 1, 1,
2.076553, -1.174321, 2.075462, 1, 0, 0, 1, 1,
2.081166, -0.5776517, 2.236707, 1, 0, 0, 1, 1,
2.083705, -0.7373951, 2.375216, 1, 0, 0, 1, 1,
2.096819, -1.216242, 1.137864, 1, 0, 0, 1, 1,
2.117546, -1.692817, 3.798926, 1, 0, 0, 1, 1,
2.121242, 0.3816086, 1.372501, 0, 0, 0, 1, 1,
2.128604, -0.5251766, 1.883494, 0, 0, 0, 1, 1,
2.178976, -1.236797, 0.9255339, 0, 0, 0, 1, 1,
2.184356, -0.6030043, 2.948222, 0, 0, 0, 1, 1,
2.369183, -0.8791444, 0.5250831, 0, 0, 0, 1, 1,
2.374763, 1.697528, 0.3558629, 0, 0, 0, 1, 1,
2.378601, -0.4895039, 2.280658, 0, 0, 0, 1, 1,
2.545498, -0.2452932, 3.022883, 1, 1, 1, 1, 1,
2.605882, -0.02000046, 2.673501, 1, 1, 1, 1, 1,
2.728552, -0.4048984, 0.6292231, 1, 1, 1, 1, 1,
2.790915, -0.2710288, 1.443077, 1, 1, 1, 1, 1,
2.89159, 0.7238359, 0.1333531, 1, 1, 1, 1, 1,
3.03518, 0.01085767, 1.004616, 1, 1, 1, 1, 1,
3.052997, -1.350991, 3.213966, 1, 1, 1, 1, 1
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
var radius = 9.553433;
var distance = 33.55603;
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
mvMatrix.translate( 0.1149962, 0.1257455, 0.4927809 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.55603);
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