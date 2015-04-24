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
-2.634657, 0.3243305, -3.012267, 1, 0, 0, 1,
-2.627222, -0.6654657, -3.389395, 1, 0.007843138, 0, 1,
-2.425173, 0.1289456, 0.001978042, 1, 0.01176471, 0, 1,
-2.412179, -0.6968163, -1.991758, 1, 0.01960784, 0, 1,
-2.380214, -0.3182515, -1.540734, 1, 0.02352941, 0, 1,
-2.347311, 0.5102956, -1.927878, 1, 0.03137255, 0, 1,
-2.319385, -0.5067829, -3.568827, 1, 0.03529412, 0, 1,
-2.303598, -0.3866341, -1.583801, 1, 0.04313726, 0, 1,
-2.29152, -1.502616, -1.966457, 1, 0.04705882, 0, 1,
-2.251186, -0.927804, -1.096901, 1, 0.05490196, 0, 1,
-2.248856, -2.2279, -1.772708, 1, 0.05882353, 0, 1,
-2.218899, 1.472061, -0.3017721, 1, 0.06666667, 0, 1,
-2.209146, 0.7657436, -0.7199244, 1, 0.07058824, 0, 1,
-2.193318, 1.154493, -0.663461, 1, 0.07843138, 0, 1,
-2.164066, -0.1590746, -0.7287377, 1, 0.08235294, 0, 1,
-2.079332, -1.43398, -1.853687, 1, 0.09019608, 0, 1,
-2.027642, 0.3295488, -0.7996333, 1, 0.09411765, 0, 1,
-2.001072, -0.3944921, -1.889685, 1, 0.1019608, 0, 1,
-1.9963, 0.4635968, -1.197923, 1, 0.1098039, 0, 1,
-1.986244, 1.085088, -0.1735004, 1, 0.1137255, 0, 1,
-1.983254, 0.5824053, -2.00511, 1, 0.1215686, 0, 1,
-1.969707, 0.79378, -2.145326, 1, 0.1254902, 0, 1,
-1.969007, 1.108113, -2.22731, 1, 0.1333333, 0, 1,
-1.959612, 0.4444327, -1.286803, 1, 0.1372549, 0, 1,
-1.934625, 0.8612099, -0.6301849, 1, 0.145098, 0, 1,
-1.924543, 1.095573, -1.159319, 1, 0.1490196, 0, 1,
-1.909714, 0.4240251, -1.132313, 1, 0.1568628, 0, 1,
-1.889289, -0.5935821, 1.037741, 1, 0.1607843, 0, 1,
-1.877385, -2.050225, -3.105087, 1, 0.1686275, 0, 1,
-1.868832, -1.035046, -2.261884, 1, 0.172549, 0, 1,
-1.839182, -0.2614829, -2.862184, 1, 0.1803922, 0, 1,
-1.820096, 0.3755781, -0.6067324, 1, 0.1843137, 0, 1,
-1.810425, -0.4806264, -2.640253, 1, 0.1921569, 0, 1,
-1.809893, -0.05988462, -0.6254776, 1, 0.1960784, 0, 1,
-1.807613, 0.9313843, -1.348341, 1, 0.2039216, 0, 1,
-1.801788, 1.284139, -0.6403145, 1, 0.2117647, 0, 1,
-1.799756, -0.864768, -2.663167, 1, 0.2156863, 0, 1,
-1.798894, -0.4679346, -2.013608, 1, 0.2235294, 0, 1,
-1.795266, -1.185821, -2.009424, 1, 0.227451, 0, 1,
-1.795007, 1.385248, -2.542617, 1, 0.2352941, 0, 1,
-1.780776, 0.5105436, -1.367924, 1, 0.2392157, 0, 1,
-1.76889, -0.07564556, -1.160124, 1, 0.2470588, 0, 1,
-1.768663, -1.293361, -1.668447, 1, 0.2509804, 0, 1,
-1.762731, -0.8127301, -2.228647, 1, 0.2588235, 0, 1,
-1.760284, 0.1339357, 0.702062, 1, 0.2627451, 0, 1,
-1.74291, 0.2722124, -2.377331, 1, 0.2705882, 0, 1,
-1.718613, 0.3930742, -0.6520432, 1, 0.2745098, 0, 1,
-1.687486, 0.8370256, -0.6098156, 1, 0.282353, 0, 1,
-1.686318, -1.843245, -1.390624, 1, 0.2862745, 0, 1,
-1.665765, -1.923755, -2.257647, 1, 0.2941177, 0, 1,
-1.661596, -0.5199029, -1.162155, 1, 0.3019608, 0, 1,
-1.643003, 0.2469913, -2.278692, 1, 0.3058824, 0, 1,
-1.627365, 1.586467, -1.770605, 1, 0.3137255, 0, 1,
-1.620687, -1.494259, -2.234126, 1, 0.3176471, 0, 1,
-1.606908, 0.09947837, -0.3939568, 1, 0.3254902, 0, 1,
-1.592234, 0.8224244, -3.395616, 1, 0.3294118, 0, 1,
-1.584226, 1.66576, -0.8774632, 1, 0.3372549, 0, 1,
-1.571097, 1.446712, -2.050752, 1, 0.3411765, 0, 1,
-1.56974, 1.176772, -1.432173, 1, 0.3490196, 0, 1,
-1.565861, 0.1158948, -3.076849, 1, 0.3529412, 0, 1,
-1.544105, 1.084177, 0.3085158, 1, 0.3607843, 0, 1,
-1.541733, 1.3227, -0.7419655, 1, 0.3647059, 0, 1,
-1.52492, 1.457685, -2.759558, 1, 0.372549, 0, 1,
-1.515038, -1.063069, -2.765445, 1, 0.3764706, 0, 1,
-1.498179, -1.46128, -1.303523, 1, 0.3843137, 0, 1,
-1.487502, -0.4081733, -1.574917, 1, 0.3882353, 0, 1,
-1.476146, -0.6835627, -2.509799, 1, 0.3960784, 0, 1,
-1.467632, -0.2926634, -1.628287, 1, 0.4039216, 0, 1,
-1.453293, 0.6452234, -1.64437, 1, 0.4078431, 0, 1,
-1.440614, -0.6829933, -2.869416, 1, 0.4156863, 0, 1,
-1.43261, -0.02129962, -2.298, 1, 0.4196078, 0, 1,
-1.420942, 1.221133, -2.158451, 1, 0.427451, 0, 1,
-1.418613, -1.472801, -1.404577, 1, 0.4313726, 0, 1,
-1.408458, -0.5570438, -3.694691, 1, 0.4392157, 0, 1,
-1.391135, -0.2340873, -2.833954, 1, 0.4431373, 0, 1,
-1.380843, -0.6484028, -1.855323, 1, 0.4509804, 0, 1,
-1.371931, -0.8207108, -0.5668132, 1, 0.454902, 0, 1,
-1.357406, 0.1770695, -3.098537, 1, 0.4627451, 0, 1,
-1.351673, -0.2754319, -1.597954, 1, 0.4666667, 0, 1,
-1.347764, -1.379144, 0.6522487, 1, 0.4745098, 0, 1,
-1.346936, 0.3101816, -3.185133, 1, 0.4784314, 0, 1,
-1.346101, 0.6745659, -2.400771, 1, 0.4862745, 0, 1,
-1.340769, 0.8026304, -1.358297, 1, 0.4901961, 0, 1,
-1.338716, -0.8570557, -2.903575, 1, 0.4980392, 0, 1,
-1.332743, 1.156893, -3.36808, 1, 0.5058824, 0, 1,
-1.331819, 1.948548, -0.248262, 1, 0.509804, 0, 1,
-1.330539, 0.3028687, -2.851556, 1, 0.5176471, 0, 1,
-1.329867, 2.341287, 0.4392393, 1, 0.5215687, 0, 1,
-1.323824, -0.02680402, -1.557719, 1, 0.5294118, 0, 1,
-1.323298, -0.1925898, -1.436172, 1, 0.5333334, 0, 1,
-1.322104, -1.610513, -2.643981, 1, 0.5411765, 0, 1,
-1.298244, -0.4803974, -2.08342, 1, 0.5450981, 0, 1,
-1.297375, 0.3688586, -0.3144373, 1, 0.5529412, 0, 1,
-1.295535, 0.4471625, -0.2896681, 1, 0.5568628, 0, 1,
-1.288852, -1.484296, -2.587541, 1, 0.5647059, 0, 1,
-1.285541, 0.7726526, -1.158459, 1, 0.5686275, 0, 1,
-1.278973, 0.07161685, -1.946759, 1, 0.5764706, 0, 1,
-1.27374, 0.4615587, -2.129169, 1, 0.5803922, 0, 1,
-1.270608, -0.3943758, -4.506867, 1, 0.5882353, 0, 1,
-1.26945, -0.1905934, -1.954401, 1, 0.5921569, 0, 1,
-1.264366, -0.5368616, -1.584959, 1, 0.6, 0, 1,
-1.264238, 0.9624026, -1.640929, 1, 0.6078432, 0, 1,
-1.259456, -0.1989019, -2.300189, 1, 0.6117647, 0, 1,
-1.250388, 0.4062789, -1.89212, 1, 0.6196079, 0, 1,
-1.226376, -1.690618, -2.933522, 1, 0.6235294, 0, 1,
-1.225471, -1.079803, -2.338922, 1, 0.6313726, 0, 1,
-1.223722, -2.302712, -1.308553, 1, 0.6352941, 0, 1,
-1.219839, 0.4931761, -0.07362644, 1, 0.6431373, 0, 1,
-1.214908, 0.1459619, -2.455837, 1, 0.6470588, 0, 1,
-1.206252, 0.3647066, -0.08718733, 1, 0.654902, 0, 1,
-1.20331, 0.3381995, -0.8440455, 1, 0.6588235, 0, 1,
-1.202363, 0.3563395, -0.96632, 1, 0.6666667, 0, 1,
-1.187374, -0.7730665, -0.7059636, 1, 0.6705883, 0, 1,
-1.178449, -0.1383426, -2.909179, 1, 0.6784314, 0, 1,
-1.173866, 0.1057235, -1.373977, 1, 0.682353, 0, 1,
-1.17193, -1.319483, -1.706383, 1, 0.6901961, 0, 1,
-1.168089, -0.09920505, 0.7970219, 1, 0.6941177, 0, 1,
-1.160355, 0.6878635, -1.902387, 1, 0.7019608, 0, 1,
-1.157194, -1.646134, -3.755258, 1, 0.7098039, 0, 1,
-1.155369, 1.062135, -0.6381708, 1, 0.7137255, 0, 1,
-1.147039, -0.1937963, 0.7602383, 1, 0.7215686, 0, 1,
-1.145766, 3.421903, 0.3569688, 1, 0.7254902, 0, 1,
-1.14573, 1.242434, -0.4475643, 1, 0.7333333, 0, 1,
-1.145474, 0.5378073, 0.4617577, 1, 0.7372549, 0, 1,
-1.142946, -0.1789351, -2.806665, 1, 0.7450981, 0, 1,
-1.129933, -0.2837994, -3.617531, 1, 0.7490196, 0, 1,
-1.12068, -0.7077434, -0.9165064, 1, 0.7568628, 0, 1,
-1.118721, -1.654046, -4.417786, 1, 0.7607843, 0, 1,
-1.11603, -0.9084259, -1.997831, 1, 0.7686275, 0, 1,
-1.115132, 1.844391, -1.111159, 1, 0.772549, 0, 1,
-1.096619, -0.875296, -2.824941, 1, 0.7803922, 0, 1,
-1.091004, -2.227095, -3.451935, 1, 0.7843137, 0, 1,
-1.090705, 0.5245118, -1.707989, 1, 0.7921569, 0, 1,
-1.089583, -2.980924, -1.519049, 1, 0.7960784, 0, 1,
-1.089155, -0.1102462, -1.444029, 1, 0.8039216, 0, 1,
-1.085, 0.6810335, -1.296654, 1, 0.8117647, 0, 1,
-1.084063, 0.7753695, 0.6271453, 1, 0.8156863, 0, 1,
-1.074518, 0.9116425, 0.07989135, 1, 0.8235294, 0, 1,
-1.07059, -0.4360991, -1.962681, 1, 0.827451, 0, 1,
-1.069388, -0.06881529, -2.877952, 1, 0.8352941, 0, 1,
-1.068492, 0.984892, -1.340033, 1, 0.8392157, 0, 1,
-1.062161, 0.1063401, -0.3558232, 1, 0.8470588, 0, 1,
-1.059363, 1.028408, -0.3802353, 1, 0.8509804, 0, 1,
-1.055994, -0.1187341, 1.297594, 1, 0.8588235, 0, 1,
-1.047927, -0.1033416, -2.335437, 1, 0.8627451, 0, 1,
-1.047871, -0.9756726, -1.801051, 1, 0.8705882, 0, 1,
-1.047853, -1.508965, -3.24056, 1, 0.8745098, 0, 1,
-1.031802, -0.192679, -1.404679, 1, 0.8823529, 0, 1,
-1.030633, 0.4478087, -0.8821543, 1, 0.8862745, 0, 1,
-1.027608, -0.4995602, -0.336193, 1, 0.8941177, 0, 1,
-1.027604, 0.4477299, -1.726371, 1, 0.8980392, 0, 1,
-1.015472, -0.4428408, -2.945198, 1, 0.9058824, 0, 1,
-1.01397, 3.540983, -1.790504, 1, 0.9137255, 0, 1,
-1.012318, 0.5072597, -2.428164, 1, 0.9176471, 0, 1,
-1.009333, 0.7930941, -1.014826, 1, 0.9254902, 0, 1,
-1.009332, 0.4876755, -1.125005, 1, 0.9294118, 0, 1,
-1.009024, -0.5666646, -4.118359, 1, 0.9372549, 0, 1,
-1.008159, 0.06154912, -1.388057, 1, 0.9411765, 0, 1,
-1.007574, 0.1810366, -0.8256148, 1, 0.9490196, 0, 1,
-1.006868, -0.5442032, -3.062306, 1, 0.9529412, 0, 1,
-1.004886, -1.338203, -3.792511, 1, 0.9607843, 0, 1,
-1.003328, -0.04968282, -1.614366, 1, 0.9647059, 0, 1,
-0.996031, 1.943857, -0.9606654, 1, 0.972549, 0, 1,
-0.9937083, 0.5374178, -0.1088602, 1, 0.9764706, 0, 1,
-0.992004, 0.1958912, -2.028095, 1, 0.9843137, 0, 1,
-0.9849027, 0.1273401, -0.9777325, 1, 0.9882353, 0, 1,
-0.9817678, 0.2978633, -0.3534936, 1, 0.9960784, 0, 1,
-0.9780193, 0.192291, 0.09131786, 0.9960784, 1, 0, 1,
-0.974674, -0.7807398, -2.839527, 0.9921569, 1, 0, 1,
-0.9731702, 1.030374, -1.300806, 0.9843137, 1, 0, 1,
-0.9710711, -0.4376806, -0.8436658, 0.9803922, 1, 0, 1,
-0.9668878, 0.2819242, -1.508575, 0.972549, 1, 0, 1,
-0.963095, -0.06202709, -1.358816, 0.9686275, 1, 0, 1,
-0.9620911, 0.6878998, -2.620154, 0.9607843, 1, 0, 1,
-0.9546469, -0.1161962, 0.345852, 0.9568627, 1, 0, 1,
-0.9450527, 0.9218349, -3.380151, 0.9490196, 1, 0, 1,
-0.9434512, 0.4272225, -1.243622, 0.945098, 1, 0, 1,
-0.9401561, -0.1739117, 1.674142, 0.9372549, 1, 0, 1,
-0.9383992, -0.1151716, -3.023221, 0.9333333, 1, 0, 1,
-0.9373513, -1.208862, -2.909103, 0.9254902, 1, 0, 1,
-0.930325, 0.6698416, -0.3065626, 0.9215686, 1, 0, 1,
-0.9281484, -0.1743368, -1.947326, 0.9137255, 1, 0, 1,
-0.9224806, 0.1157016, -0.8919072, 0.9098039, 1, 0, 1,
-0.9045463, 0.8449698, -0.08804237, 0.9019608, 1, 0, 1,
-0.9030406, -1.300908, -0.4513729, 0.8941177, 1, 0, 1,
-0.8986472, -0.883531, -4.350827, 0.8901961, 1, 0, 1,
-0.8982069, -0.8273416, -1.662789, 0.8823529, 1, 0, 1,
-0.8977786, 0.1597913, 0.4087755, 0.8784314, 1, 0, 1,
-0.8971801, 0.2614703, -1.955394, 0.8705882, 1, 0, 1,
-0.893582, 1.463349, -0.8655847, 0.8666667, 1, 0, 1,
-0.8922378, -0.4208974, -1.124372, 0.8588235, 1, 0, 1,
-0.8893101, 0.5370635, -1.120007, 0.854902, 1, 0, 1,
-0.8762205, -0.6562679, -3.40901, 0.8470588, 1, 0, 1,
-0.8754667, -2.116832, -2.618072, 0.8431373, 1, 0, 1,
-0.8681628, 0.3923852, -1.831615, 0.8352941, 1, 0, 1,
-0.8667028, -1.732043, -2.823932, 0.8313726, 1, 0, 1,
-0.8651487, -1.574971, -0.9794319, 0.8235294, 1, 0, 1,
-0.8646194, -0.5579398, -0.4728116, 0.8196079, 1, 0, 1,
-0.8505117, 0.149314, -0.984896, 0.8117647, 1, 0, 1,
-0.8503726, -0.7371079, -2.574755, 0.8078431, 1, 0, 1,
-0.8478495, 0.612138, 1.137046, 0.8, 1, 0, 1,
-0.8381345, 1.130394, 0.1015253, 0.7921569, 1, 0, 1,
-0.8381256, 0.1318744, 0.1375784, 0.7882353, 1, 0, 1,
-0.8378813, -0.7507508, -3.824161, 0.7803922, 1, 0, 1,
-0.8364248, 1.123052, 0.1467363, 0.7764706, 1, 0, 1,
-0.835744, -0.6635528, -0.7523596, 0.7686275, 1, 0, 1,
-0.8279501, 1.473353, -0.5241359, 0.7647059, 1, 0, 1,
-0.8276647, 0.5603877, -1.587865, 0.7568628, 1, 0, 1,
-0.827185, -1.574656, -2.220697, 0.7529412, 1, 0, 1,
-0.8106993, 0.5517038, -1.198948, 0.7450981, 1, 0, 1,
-0.8081725, 1.317211, 0.2899124, 0.7411765, 1, 0, 1,
-0.79952, 1.295952, 0.04498544, 0.7333333, 1, 0, 1,
-0.7979673, 0.9552556, -2.116229, 0.7294118, 1, 0, 1,
-0.7963841, -1.477131, -4.039037, 0.7215686, 1, 0, 1,
-0.7920212, -0.5616748, -2.604547, 0.7176471, 1, 0, 1,
-0.7887095, -0.2155239, -1.314346, 0.7098039, 1, 0, 1,
-0.7839949, -0.7194601, -2.880032, 0.7058824, 1, 0, 1,
-0.7826016, 0.3741556, -1.879943, 0.6980392, 1, 0, 1,
-0.7777961, -0.3835382, -2.292969, 0.6901961, 1, 0, 1,
-0.7729718, -0.803302, -1.521535, 0.6862745, 1, 0, 1,
-0.7671254, -0.6344702, -2.975991, 0.6784314, 1, 0, 1,
-0.7561169, -0.2863145, -2.344199, 0.6745098, 1, 0, 1,
-0.753214, -0.03763616, -1.832373, 0.6666667, 1, 0, 1,
-0.7443314, 0.551505, -1.329909, 0.6627451, 1, 0, 1,
-0.7393512, -0.07221029, -0.3280068, 0.654902, 1, 0, 1,
-0.7326928, -0.1723507, -2.529347, 0.6509804, 1, 0, 1,
-0.727145, -2.054952, -3.874736, 0.6431373, 1, 0, 1,
-0.7238449, 0.6271359, -3.308912, 0.6392157, 1, 0, 1,
-0.7163653, 1.917659, 0.386057, 0.6313726, 1, 0, 1,
-0.7156501, 0.6450285, 0.1172612, 0.627451, 1, 0, 1,
-0.7108861, -0.234132, -0.4535944, 0.6196079, 1, 0, 1,
-0.7062225, 0.4254854, -1.102554, 0.6156863, 1, 0, 1,
-0.7040325, -1.136309, -1.979874, 0.6078432, 1, 0, 1,
-0.6967574, -1.31454, -0.255967, 0.6039216, 1, 0, 1,
-0.6924071, 0.3406929, -0.6944429, 0.5960785, 1, 0, 1,
-0.6912323, 0.1969948, -0.19259, 0.5882353, 1, 0, 1,
-0.6874242, 0.581005, -1.489129, 0.5843138, 1, 0, 1,
-0.6789748, 1.681435, -0.03569365, 0.5764706, 1, 0, 1,
-0.6746066, 0.06734922, -2.364404, 0.572549, 1, 0, 1,
-0.6730718, -1.031644, -1.968125, 0.5647059, 1, 0, 1,
-0.672326, 1.364493, 1.538198, 0.5607843, 1, 0, 1,
-0.667573, -1.138785, -2.219089, 0.5529412, 1, 0, 1,
-0.662332, -0.2944654, -2.462855, 0.5490196, 1, 0, 1,
-0.6592937, -0.3499372, -2.863559, 0.5411765, 1, 0, 1,
-0.652869, -0.6027561, -3.045758, 0.5372549, 1, 0, 1,
-0.6526071, 0.7483136, 1.21211, 0.5294118, 1, 0, 1,
-0.6502768, 1.529914, -0.259561, 0.5254902, 1, 0, 1,
-0.6499947, 0.3107436, -2.124102, 0.5176471, 1, 0, 1,
-0.6493325, -0.2218238, -3.70007, 0.5137255, 1, 0, 1,
-0.6461592, -1.569796, -3.198478, 0.5058824, 1, 0, 1,
-0.6413433, -0.7892334, -0.582853, 0.5019608, 1, 0, 1,
-0.6251683, -1.122707, -2.411624, 0.4941176, 1, 0, 1,
-0.6161972, 0.007981069, -2.310105, 0.4862745, 1, 0, 1,
-0.6161307, 1.027052, -2.705813, 0.4823529, 1, 0, 1,
-0.6141925, -0.6948869, -2.064643, 0.4745098, 1, 0, 1,
-0.6135556, -1.878493, -5.111433, 0.4705882, 1, 0, 1,
-0.6101441, -0.3879322, -2.100837, 0.4627451, 1, 0, 1,
-0.6082938, -1.482595, -1.112444, 0.4588235, 1, 0, 1,
-0.6062984, -0.2578288, -1.823548, 0.4509804, 1, 0, 1,
-0.603743, -1.235756, -3.336194, 0.4470588, 1, 0, 1,
-0.5982365, -1.04805, -3.536019, 0.4392157, 1, 0, 1,
-0.5972594, 0.3475459, -0.3064975, 0.4352941, 1, 0, 1,
-0.595167, 0.2993, -0.4420167, 0.427451, 1, 0, 1,
-0.5944278, 0.6593083, -2.622197, 0.4235294, 1, 0, 1,
-0.5935268, 0.2015298, -0.8714879, 0.4156863, 1, 0, 1,
-0.5929435, -1.770056, -1.9797, 0.4117647, 1, 0, 1,
-0.5916513, 1.016483, 1.039126, 0.4039216, 1, 0, 1,
-0.5844718, -0.3222397, -2.489399, 0.3960784, 1, 0, 1,
-0.574144, -1.578525, -2.187262, 0.3921569, 1, 0, 1,
-0.5741367, -1.448201, -2.756626, 0.3843137, 1, 0, 1,
-0.5738596, -1.008886, -3.678608, 0.3803922, 1, 0, 1,
-0.573055, -0.564414, -1.975549, 0.372549, 1, 0, 1,
-0.5703448, 0.05952702, -2.381669, 0.3686275, 1, 0, 1,
-0.5700862, -0.7328479, -1.142873, 0.3607843, 1, 0, 1,
-0.5686306, -0.7663773, -2.762092, 0.3568628, 1, 0, 1,
-0.5660914, 0.9966033, -1.996773, 0.3490196, 1, 0, 1,
-0.5610005, 0.7178155, -0.2764544, 0.345098, 1, 0, 1,
-0.5579597, -1.257533, -3.369084, 0.3372549, 1, 0, 1,
-0.5553408, -0.5471504, -0.6031307, 0.3333333, 1, 0, 1,
-0.5539894, -0.2870969, -1.203839, 0.3254902, 1, 0, 1,
-0.5534807, 2.299159, 2.073434, 0.3215686, 1, 0, 1,
-0.5526294, 2.025771, -1.016659, 0.3137255, 1, 0, 1,
-0.5425122, -1.802723, -2.455237, 0.3098039, 1, 0, 1,
-0.5409681, -1.522054, -2.116411, 0.3019608, 1, 0, 1,
-0.540804, 0.6142844, -0.532014, 0.2941177, 1, 0, 1,
-0.5398906, 0.9503465, -1.058472, 0.2901961, 1, 0, 1,
-0.5340014, -1.119597, -1.983049, 0.282353, 1, 0, 1,
-0.5314935, 0.1261444, -2.086133, 0.2784314, 1, 0, 1,
-0.5306316, -0.5490253, -2.490058, 0.2705882, 1, 0, 1,
-0.5304992, -0.09329065, -2.059048, 0.2666667, 1, 0, 1,
-0.5296016, 0.7821184, -2.432892, 0.2588235, 1, 0, 1,
-0.5292856, 0.3904774, -0.8379924, 0.254902, 1, 0, 1,
-0.5286376, -0.3658054, -3.47202, 0.2470588, 1, 0, 1,
-0.5262064, -1.316371, -2.062406, 0.2431373, 1, 0, 1,
-0.5261636, -0.3901406, -1.512844, 0.2352941, 1, 0, 1,
-0.525994, -0.8657864, -3.623498, 0.2313726, 1, 0, 1,
-0.5245885, -0.2741307, -2.207405, 0.2235294, 1, 0, 1,
-0.523858, 1.034218, 0.8351094, 0.2196078, 1, 0, 1,
-0.5184616, 0.3918183, 0.8360766, 0.2117647, 1, 0, 1,
-0.5115372, -0.3911726, -1.944965, 0.2078431, 1, 0, 1,
-0.5094413, 0.7949826, -0.9455531, 0.2, 1, 0, 1,
-0.5045173, 1.270499, -1.685164, 0.1921569, 1, 0, 1,
-0.5013968, 0.3621111, -0.1817468, 0.1882353, 1, 0, 1,
-0.4994121, -0.8166818, -2.79314, 0.1803922, 1, 0, 1,
-0.4961429, 0.0799962, -0.8949249, 0.1764706, 1, 0, 1,
-0.4923816, 0.1166701, -1.156545, 0.1686275, 1, 0, 1,
-0.4889928, -0.708359, -3.780874, 0.1647059, 1, 0, 1,
-0.4889809, -0.5845625, -1.909287, 0.1568628, 1, 0, 1,
-0.4852113, -0.8810502, -2.914916, 0.1529412, 1, 0, 1,
-0.4840421, -0.8307909, -4.068351, 0.145098, 1, 0, 1,
-0.4808901, -0.1956722, -2.087908, 0.1411765, 1, 0, 1,
-0.4739987, -0.2339765, -0.476912, 0.1333333, 1, 0, 1,
-0.4703997, -0.672253, -3.394682, 0.1294118, 1, 0, 1,
-0.4574042, -0.1701252, 0.3368282, 0.1215686, 1, 0, 1,
-0.456654, 2.089273, -0.09699945, 0.1176471, 1, 0, 1,
-0.4528175, 0.6844072, -1.076436, 0.1098039, 1, 0, 1,
-0.4526317, -0.005095631, 0.1595569, 0.1058824, 1, 0, 1,
-0.44938, 0.5765733, -0.6914195, 0.09803922, 1, 0, 1,
-0.4479389, 0.4285386, -1.416381, 0.09019608, 1, 0, 1,
-0.4477678, -0.3641174, -0.4527773, 0.08627451, 1, 0, 1,
-0.4446978, 0.7641353, -1.085104, 0.07843138, 1, 0, 1,
-0.4445678, 0.2957899, -1.474337, 0.07450981, 1, 0, 1,
-0.4443717, 0.1150069, -1.909063, 0.06666667, 1, 0, 1,
-0.4402844, 0.395142, -0.5203452, 0.0627451, 1, 0, 1,
-0.4379248, -0.9260494, -2.698524, 0.05490196, 1, 0, 1,
-0.4371392, 0.2493039, -1.57283, 0.05098039, 1, 0, 1,
-0.4369129, -0.5610062, -3.917135, 0.04313726, 1, 0, 1,
-0.4366154, 1.299318, 0.01127068, 0.03921569, 1, 0, 1,
-0.4364924, 1.322396, -0.9853682, 0.03137255, 1, 0, 1,
-0.4360953, -1.087516, -3.612683, 0.02745098, 1, 0, 1,
-0.4356217, 0.47765, 0.5821701, 0.01960784, 1, 0, 1,
-0.4315593, -1.472189, -1.95555, 0.01568628, 1, 0, 1,
-0.4279363, 1.025729, -2.456238, 0.007843138, 1, 0, 1,
-0.424975, 0.08111046, -1.321453, 0.003921569, 1, 0, 1,
-0.4225116, 1.238927, -0.02412099, 0, 1, 0.003921569, 1,
-0.4165729, -1.690834, -2.800855, 0, 1, 0.01176471, 1,
-0.4154306, 1.837409, -1.208124, 0, 1, 0.01568628, 1,
-0.4150932, -1.311475, -1.786538, 0, 1, 0.02352941, 1,
-0.4138477, -1.301451, -3.280154, 0, 1, 0.02745098, 1,
-0.4010815, -0.6880833, -4.536115, 0, 1, 0.03529412, 1,
-0.4003799, -0.9411551, -2.645428, 0, 1, 0.03921569, 1,
-0.3881393, 0.720684, -0.3403841, 0, 1, 0.04705882, 1,
-0.3854864, -0.2755416, -0.4146299, 0, 1, 0.05098039, 1,
-0.3845688, 1.217146, -1.887257, 0, 1, 0.05882353, 1,
-0.3790082, 0.6141443, -0.3915944, 0, 1, 0.0627451, 1,
-0.3721384, -0.7664902, -4.880369, 0, 1, 0.07058824, 1,
-0.3687546, -1.438421, -3.241626, 0, 1, 0.07450981, 1,
-0.3671353, -0.3763778, -3.864949, 0, 1, 0.08235294, 1,
-0.3601655, -0.3381217, -1.176139, 0, 1, 0.08627451, 1,
-0.3580111, -0.8391582, -2.917519, 0, 1, 0.09411765, 1,
-0.3487771, 0.5812011, -0.2863669, 0, 1, 0.1019608, 1,
-0.3432251, 1.970182, -0.7359248, 0, 1, 0.1058824, 1,
-0.329423, 0.182141, -1.719232, 0, 1, 0.1137255, 1,
-0.3237714, -0.5747769, -1.288429, 0, 1, 0.1176471, 1,
-0.3199856, -1.051035, -2.336671, 0, 1, 0.1254902, 1,
-0.3198913, 0.2156225, -0.3169987, 0, 1, 0.1294118, 1,
-0.3189406, -1.031, -1.338214, 0, 1, 0.1372549, 1,
-0.3174513, 2.215699, -1.521574, 0, 1, 0.1411765, 1,
-0.3155863, 1.506966, -0.1774758, 0, 1, 0.1490196, 1,
-0.3145312, 1.091648, -1.229536, 0, 1, 0.1529412, 1,
-0.3143232, 0.1926231, -0.2577196, 0, 1, 0.1607843, 1,
-0.3138613, -1.252677, -3.316962, 0, 1, 0.1647059, 1,
-0.3126569, -0.007079071, -1.157853, 0, 1, 0.172549, 1,
-0.3094416, -0.2982401, -2.724191, 0, 1, 0.1764706, 1,
-0.3020416, 0.215399, -0.6009708, 0, 1, 0.1843137, 1,
-0.2998466, 1.307701, 0.03546315, 0, 1, 0.1882353, 1,
-0.2979601, 0.4557256, 1.189829, 0, 1, 0.1960784, 1,
-0.2945233, 0.4241851, -1.246423, 0, 1, 0.2039216, 1,
-0.2915341, -0.5665926, -3.858533, 0, 1, 0.2078431, 1,
-0.2867887, -0.5114607, -3.019376, 0, 1, 0.2156863, 1,
-0.2727346, 2.115682, -0.615266, 0, 1, 0.2196078, 1,
-0.272021, -1.118025, -2.94698, 0, 1, 0.227451, 1,
-0.2700339, 0.3593195, -1.438843, 0, 1, 0.2313726, 1,
-0.2691635, 0.5854688, 0.5357078, 0, 1, 0.2392157, 1,
-0.2678207, -0.7846267, -2.864824, 0, 1, 0.2431373, 1,
-0.2652991, 0.2620577, 0.7874938, 0, 1, 0.2509804, 1,
-0.2565846, 0.9939764, -0.8724992, 0, 1, 0.254902, 1,
-0.2517715, 0.9289737, -0.7735479, 0, 1, 0.2627451, 1,
-0.2501056, 1.278642, 0.5347376, 0, 1, 0.2666667, 1,
-0.2476673, 0.2615668, -0.01198544, 0, 1, 0.2745098, 1,
-0.2476562, -1.395717, -1.953721, 0, 1, 0.2784314, 1,
-0.2417816, 1.924315, -1.124218, 0, 1, 0.2862745, 1,
-0.2411847, -0.3317709, -3.288544, 0, 1, 0.2901961, 1,
-0.240363, -1.010044, -1.651351, 0, 1, 0.2980392, 1,
-0.2374399, -0.2312481, -0.08137567, 0, 1, 0.3058824, 1,
-0.2362636, 2.431817, -1.71382, 0, 1, 0.3098039, 1,
-0.2361667, 0.09784444, -2.500362, 0, 1, 0.3176471, 1,
-0.2349395, 0.1690312, 0.574021, 0, 1, 0.3215686, 1,
-0.226997, -1.040622, -4.233173, 0, 1, 0.3294118, 1,
-0.2263468, 0.6004416, -1.943002, 0, 1, 0.3333333, 1,
-0.2238516, -0.03182311, -2.419228, 0, 1, 0.3411765, 1,
-0.2197012, 0.6893626, -0.03061163, 0, 1, 0.345098, 1,
-0.2193615, -1.221669, -1.971018, 0, 1, 0.3529412, 1,
-0.2153765, -1.043015, -2.521364, 0, 1, 0.3568628, 1,
-0.2143835, 0.7850483, -0.1573055, 0, 1, 0.3647059, 1,
-0.2132152, 1.118619, -1.939753, 0, 1, 0.3686275, 1,
-0.2064164, 0.6021351, 0.1933127, 0, 1, 0.3764706, 1,
-0.2035219, -0.4057161, -2.187354, 0, 1, 0.3803922, 1,
-0.1994463, 0.6898029, 0.09948901, 0, 1, 0.3882353, 1,
-0.1976848, -1.250109, -3.222145, 0, 1, 0.3921569, 1,
-0.1962748, -0.4204208, -3.352511, 0, 1, 0.4, 1,
-0.1943697, 0.3225111, -0.1001109, 0, 1, 0.4078431, 1,
-0.193598, -0.1998409, -3.453974, 0, 1, 0.4117647, 1,
-0.1934484, 0.3833258, 1.807846, 0, 1, 0.4196078, 1,
-0.19017, 0.2980877, -0.8282918, 0, 1, 0.4235294, 1,
-0.1856924, -0.4795404, -3.502451, 0, 1, 0.4313726, 1,
-0.1855403, -0.3607172, -2.042477, 0, 1, 0.4352941, 1,
-0.1806151, -0.1815223, -1.623908, 0, 1, 0.4431373, 1,
-0.1804688, -0.5627798, -1.190249, 0, 1, 0.4470588, 1,
-0.1774008, 1.175401, 0.07320162, 0, 1, 0.454902, 1,
-0.1741536, -0.2355751, -2.066692, 0, 1, 0.4588235, 1,
-0.1720067, 0.07838719, -1.788147, 0, 1, 0.4666667, 1,
-0.1687648, -1.947788, -2.222535, 0, 1, 0.4705882, 1,
-0.1673426, 0.5130353, -0.9235589, 0, 1, 0.4784314, 1,
-0.1630276, -0.08126017, -2.149428, 0, 1, 0.4823529, 1,
-0.1594341, -1.799878, -2.657172, 0, 1, 0.4901961, 1,
-0.1567463, -0.390381, -3.392632, 0, 1, 0.4941176, 1,
-0.1554079, 1.317149, -2.190843, 0, 1, 0.5019608, 1,
-0.1546502, 1.867245, 0.2563568, 0, 1, 0.509804, 1,
-0.1522269, -0.1672196, -2.794174, 0, 1, 0.5137255, 1,
-0.1506997, -1.696602, -4.320232, 0, 1, 0.5215687, 1,
-0.1496706, 1.162026, 0.6595135, 0, 1, 0.5254902, 1,
-0.1460786, -0.4139117, -1.820425, 0, 1, 0.5333334, 1,
-0.1425694, 1.904385, -0.1125039, 0, 1, 0.5372549, 1,
-0.1418003, -0.6233824, -1.725276, 0, 1, 0.5450981, 1,
-0.1406704, -0.3698824, -3.931564, 0, 1, 0.5490196, 1,
-0.1368753, 0.9058092, -0.9592415, 0, 1, 0.5568628, 1,
-0.1362235, -1.310585, -2.591642, 0, 1, 0.5607843, 1,
-0.1342188, -1.245045, -2.705134, 0, 1, 0.5686275, 1,
-0.1339519, -1.054763, -3.020665, 0, 1, 0.572549, 1,
-0.1283023, 0.09032171, -0.4475487, 0, 1, 0.5803922, 1,
-0.1277022, -1.594011, -2.654593, 0, 1, 0.5843138, 1,
-0.1207852, 0.243406, -1.412086, 0, 1, 0.5921569, 1,
-0.1179821, 0.3289983, -1.406043, 0, 1, 0.5960785, 1,
-0.1145127, -0.8211277, -1.138798, 0, 1, 0.6039216, 1,
-0.1122978, -0.4423301, -3.065544, 0, 1, 0.6117647, 1,
-0.1077624, -1.792404, -2.97431, 0, 1, 0.6156863, 1,
-0.1070401, 0.6924865, -0.7919266, 0, 1, 0.6235294, 1,
-0.1035672, 0.8163092, -0.4320241, 0, 1, 0.627451, 1,
-0.102931, -0.04439772, -3.219157, 0, 1, 0.6352941, 1,
-0.1026358, -1.835853, -4.240112, 0, 1, 0.6392157, 1,
-0.1024544, -0.8440439, -4.127341, 0, 1, 0.6470588, 1,
-0.09927708, -0.8897662, -2.135867, 0, 1, 0.6509804, 1,
-0.09859994, -0.8091718, -2.802515, 0, 1, 0.6588235, 1,
-0.09857772, -0.2164775, -1.239106, 0, 1, 0.6627451, 1,
-0.09679149, 0.01930891, 0.007330883, 0, 1, 0.6705883, 1,
-0.09126901, 0.590082, -2.357907, 0, 1, 0.6745098, 1,
-0.08860782, 1.257636, -0.723199, 0, 1, 0.682353, 1,
-0.08166061, 0.1688959, -0.4789132, 0, 1, 0.6862745, 1,
-0.08162288, 0.3597574, -0.9853218, 0, 1, 0.6941177, 1,
-0.07537329, -0.3641828, -1.992818, 0, 1, 0.7019608, 1,
-0.06808916, 1.650608, -0.866325, 0, 1, 0.7058824, 1,
-0.06769022, 0.3488406, 0.9385083, 0, 1, 0.7137255, 1,
-0.06757819, 1.387132, -1.44526, 0, 1, 0.7176471, 1,
-0.06753521, 0.07995658, -0.5025155, 0, 1, 0.7254902, 1,
-0.06675325, 1.497334, 0.8560907, 0, 1, 0.7294118, 1,
-0.06643938, 1.930977, -0.1120509, 0, 1, 0.7372549, 1,
-0.06464265, 0.09191968, -1.034083, 0, 1, 0.7411765, 1,
-0.06319371, -0.09295112, -2.341681, 0, 1, 0.7490196, 1,
-0.06315213, 0.3068397, -0.008108882, 0, 1, 0.7529412, 1,
-0.06073829, -0.6115823, -2.771583, 0, 1, 0.7607843, 1,
-0.05081358, 0.2986385, -0.8545978, 0, 1, 0.7647059, 1,
-0.04969981, 0.8932284, 0.4551699, 0, 1, 0.772549, 1,
-0.04823965, -0.5227386, -4.09656, 0, 1, 0.7764706, 1,
-0.048012, -1.859993, -3.869617, 0, 1, 0.7843137, 1,
-0.04612414, 0.5771727, -0.07449829, 0, 1, 0.7882353, 1,
-0.04435023, -0.8592775, -3.927115, 0, 1, 0.7960784, 1,
-0.04237662, 0.1134415, -0.05227301, 0, 1, 0.8039216, 1,
-0.04101462, 0.2949322, -0.4149512, 0, 1, 0.8078431, 1,
-0.02441005, 0.5038911, 1.074667, 0, 1, 0.8156863, 1,
-0.02324135, 0.1070775, 0.2569536, 0, 1, 0.8196079, 1,
-0.01954063, 0.4427245, 1.019291, 0, 1, 0.827451, 1,
-0.0111099, -1.274684, -3.576619, 0, 1, 0.8313726, 1,
-0.008704748, 0.9691756, -0.01194653, 0, 1, 0.8392157, 1,
-0.00851257, -0.8908776, -2.628065, 0, 1, 0.8431373, 1,
0.0006577174, -0.7257874, 3.219134, 0, 1, 0.8509804, 1,
0.002030678, 1.530032, -0.7160898, 0, 1, 0.854902, 1,
0.007506243, 0.2443889, 0.3332289, 0, 1, 0.8627451, 1,
0.008599903, 0.1657236, 0.03215398, 0, 1, 0.8666667, 1,
0.009121228, 0.2206529, 0.03540066, 0, 1, 0.8745098, 1,
0.009235797, 0.04869112, 1.060163, 0, 1, 0.8784314, 1,
0.01180652, -0.02321091, 2.31911, 0, 1, 0.8862745, 1,
0.01218897, -0.1128986, 2.778161, 0, 1, 0.8901961, 1,
0.01529787, 0.4237964, -1.25742, 0, 1, 0.8980392, 1,
0.01706599, 1.486914, -0.555339, 0, 1, 0.9058824, 1,
0.01884603, -1.627751, 2.187624, 0, 1, 0.9098039, 1,
0.01951137, -0.2277641, 2.37989, 0, 1, 0.9176471, 1,
0.02027831, -1.056155, 3.572761, 0, 1, 0.9215686, 1,
0.0204909, 0.3020419, 1.202532, 0, 1, 0.9294118, 1,
0.02066509, 0.7763368, -1.128575, 0, 1, 0.9333333, 1,
0.02292368, 1.597049, -1.162116, 0, 1, 0.9411765, 1,
0.02376658, 0.6585982, 0.2775272, 0, 1, 0.945098, 1,
0.03055625, -1.502402, 1.980191, 0, 1, 0.9529412, 1,
0.03184818, -0.48108, 2.869097, 0, 1, 0.9568627, 1,
0.03209738, -0.7643641, 3.0024, 0, 1, 0.9647059, 1,
0.033386, 0.3331338, 0.7486365, 0, 1, 0.9686275, 1,
0.0372435, 0.3673643, 2.442592, 0, 1, 0.9764706, 1,
0.0377481, -0.2377553, 0.9690066, 0, 1, 0.9803922, 1,
0.03789913, 0.4028192, -1.617095, 0, 1, 0.9882353, 1,
0.0392094, -0.1152452, 2.373625, 0, 1, 0.9921569, 1,
0.04021509, 0.1177574, 1.190274, 0, 1, 1, 1,
0.04220285, -0.4672176, 3.22778, 0, 0.9921569, 1, 1,
0.04390294, 0.455542, -0.04126927, 0, 0.9882353, 1, 1,
0.04540195, -1.055433, 2.793042, 0, 0.9803922, 1, 1,
0.04676448, -0.05328992, 2.229001, 0, 0.9764706, 1, 1,
0.05075042, 0.6102186, -0.2481984, 0, 0.9686275, 1, 1,
0.05087879, 0.3958492, 0.3542207, 0, 0.9647059, 1, 1,
0.05632776, 0.2288276, 1.145961, 0, 0.9568627, 1, 1,
0.05901917, -0.5939413, 4.067365, 0, 0.9529412, 1, 1,
0.06091401, 0.1562381, 0.5962524, 0, 0.945098, 1, 1,
0.06131737, 0.990123, 1.038276, 0, 0.9411765, 1, 1,
0.06355587, -0.3758849, 2.887468, 0, 0.9333333, 1, 1,
0.063657, 0.08601636, -1.646281, 0, 0.9294118, 1, 1,
0.06421844, 0.9911366, 0.07314258, 0, 0.9215686, 1, 1,
0.06495892, 1.165076, 0.1859133, 0, 0.9176471, 1, 1,
0.06615788, 2.308246, -0.2317871, 0, 0.9098039, 1, 1,
0.06844337, 1.33351, -0.5991765, 0, 0.9058824, 1, 1,
0.06922538, -1.07424, 4.076735, 0, 0.8980392, 1, 1,
0.07339314, -0.6053504, 3.610595, 0, 0.8901961, 1, 1,
0.07675877, -0.6278647, 3.561955, 0, 0.8862745, 1, 1,
0.07745537, -1.52909, 3.105586, 0, 0.8784314, 1, 1,
0.08226281, 0.4443586, -0.07241422, 0, 0.8745098, 1, 1,
0.08381265, 1.575283, 1.710959, 0, 0.8666667, 1, 1,
0.09030669, 0.3917664, 0.5982576, 0, 0.8627451, 1, 1,
0.09319165, 0.4549133, 0.6324407, 0, 0.854902, 1, 1,
0.09432613, 0.3682305, 0.1045102, 0, 0.8509804, 1, 1,
0.09679607, -0.4083856, 3.614395, 0, 0.8431373, 1, 1,
0.1009998, -1.045499, 3.582826, 0, 0.8392157, 1, 1,
0.1021691, 1.498489, -1.212277, 0, 0.8313726, 1, 1,
0.1042072, -0.1600814, 4.572017, 0, 0.827451, 1, 1,
0.1056729, 0.8456841, 0.7562473, 0, 0.8196079, 1, 1,
0.1067994, -0.9447631, 3.66789, 0, 0.8156863, 1, 1,
0.1132275, -0.5748142, 3.524599, 0, 0.8078431, 1, 1,
0.1137627, -0.2254525, 2.810379, 0, 0.8039216, 1, 1,
0.1146386, -0.0836391, 2.35673, 0, 0.7960784, 1, 1,
0.1146933, 1.052904, 0.1091068, 0, 0.7882353, 1, 1,
0.1191455, -0.4502694, 2.848509, 0, 0.7843137, 1, 1,
0.1254893, 0.0576814, 0.8395533, 0, 0.7764706, 1, 1,
0.1258529, 0.09550089, 1.337519, 0, 0.772549, 1, 1,
0.1276183, -1.374407, 3.268157, 0, 0.7647059, 1, 1,
0.1314114, -0.5345743, 3.046719, 0, 0.7607843, 1, 1,
0.1318463, 0.9423366, 0.03407744, 0, 0.7529412, 1, 1,
0.1326506, 0.2673509, 0.1416879, 0, 0.7490196, 1, 1,
0.1376369, 0.6710748, -0.7220463, 0, 0.7411765, 1, 1,
0.137761, -1.442729, 4.61941, 0, 0.7372549, 1, 1,
0.140503, 0.3095381, 2.368963, 0, 0.7294118, 1, 1,
0.1416304, -1.540105, 2.049097, 0, 0.7254902, 1, 1,
0.1461106, -1.265845, 5.014998, 0, 0.7176471, 1, 1,
0.1480047, -2.974981, 3.377072, 0, 0.7137255, 1, 1,
0.1482885, 0.08103079, 2.871083, 0, 0.7058824, 1, 1,
0.1555582, -0.3434689, 3.263998, 0, 0.6980392, 1, 1,
0.158119, 0.07043834, 1.649526, 0, 0.6941177, 1, 1,
0.1588865, 2.214203, 0.04821361, 0, 0.6862745, 1, 1,
0.163126, -0.04618281, -0.07791034, 0, 0.682353, 1, 1,
0.165695, -0.7730184, 1.911165, 0, 0.6745098, 1, 1,
0.1667414, 1.25722, -0.5021807, 0, 0.6705883, 1, 1,
0.1673156, 1.954767, -0.6382478, 0, 0.6627451, 1, 1,
0.1695742, -0.1817715, 1.065929, 0, 0.6588235, 1, 1,
0.1738513, 0.3738607, -0.3928844, 0, 0.6509804, 1, 1,
0.1761228, 1.185596, 0.9735646, 0, 0.6470588, 1, 1,
0.1776022, 0.1623366, 1.044893, 0, 0.6392157, 1, 1,
0.1797429, -1.89924, 2.318645, 0, 0.6352941, 1, 1,
0.1799139, 1.718104, 0.06109828, 0, 0.627451, 1, 1,
0.1813705, 0.1229583, -0.4295653, 0, 0.6235294, 1, 1,
0.1839787, -1.582864, 2.909794, 0, 0.6156863, 1, 1,
0.1876907, 0.5142942, 2.088286, 0, 0.6117647, 1, 1,
0.1920198, 0.2952696, 1.112146, 0, 0.6039216, 1, 1,
0.1948965, 1.432898, -0.3231924, 0, 0.5960785, 1, 1,
0.1961059, 1.454132, 0.1366633, 0, 0.5921569, 1, 1,
0.1967852, -0.7339079, 1.914482, 0, 0.5843138, 1, 1,
0.1999321, 0.06313623, 0.5187531, 0, 0.5803922, 1, 1,
0.2027201, -1.434128, 2.823402, 0, 0.572549, 1, 1,
0.2027694, 0.3105043, -0.1027243, 0, 0.5686275, 1, 1,
0.2069687, 0.3723472, 0.5588515, 0, 0.5607843, 1, 1,
0.2088852, 1.088047, 1.107281, 0, 0.5568628, 1, 1,
0.2093852, -1.102233, 3.336063, 0, 0.5490196, 1, 1,
0.2116567, 1.38802, -0.858946, 0, 0.5450981, 1, 1,
0.2118331, 1.245276, -0.5405321, 0, 0.5372549, 1, 1,
0.214004, -0.4854107, 2.795824, 0, 0.5333334, 1, 1,
0.2140899, -0.6804563, 2.511745, 0, 0.5254902, 1, 1,
0.2171532, 0.1661669, 1.440088, 0, 0.5215687, 1, 1,
0.2185658, 0.8668213, -0.1080351, 0, 0.5137255, 1, 1,
0.2200727, 0.6355507, -0.1811779, 0, 0.509804, 1, 1,
0.2205762, -0.7453764, 2.774051, 0, 0.5019608, 1, 1,
0.2223356, -0.6668925, 2.660534, 0, 0.4941176, 1, 1,
0.2236501, 0.4267649, 0.9505103, 0, 0.4901961, 1, 1,
0.2249254, 0.1366633, 1.363431, 0, 0.4823529, 1, 1,
0.2259362, 0.08267629, 3.457382, 0, 0.4784314, 1, 1,
0.2296614, 1.171199, 1.130557, 0, 0.4705882, 1, 1,
0.2307553, -0.6731954, 4.011813, 0, 0.4666667, 1, 1,
0.230811, 0.7932457, -1.081983, 0, 0.4588235, 1, 1,
0.233086, 0.6754155, 0.3919127, 0, 0.454902, 1, 1,
0.2363615, 0.6225057, 1.624359, 0, 0.4470588, 1, 1,
0.2365676, 0.8852564, 1.556742, 0, 0.4431373, 1, 1,
0.2375269, 0.6103902, 1.125733, 0, 0.4352941, 1, 1,
0.2377948, -0.08714163, 3.092117, 0, 0.4313726, 1, 1,
0.2399844, 0.612849, -2.291409, 0, 0.4235294, 1, 1,
0.2403802, -0.3403517, 1.748451, 0, 0.4196078, 1, 1,
0.2431281, -1.11861, 3.310647, 0, 0.4117647, 1, 1,
0.2482425, -0.5331393, 1.890935, 0, 0.4078431, 1, 1,
0.2536012, -1.436566, 1.821213, 0, 0.4, 1, 1,
0.2536886, -0.08238216, 2.318314, 0, 0.3921569, 1, 1,
0.2588261, -0.8660005, 1.806855, 0, 0.3882353, 1, 1,
0.262833, -0.8364797, 2.69473, 0, 0.3803922, 1, 1,
0.2631936, 1.644265, -1.113674, 0, 0.3764706, 1, 1,
0.2638027, -0.407907, 1.962456, 0, 0.3686275, 1, 1,
0.2649722, -0.1101969, 1.413275, 0, 0.3647059, 1, 1,
0.2772, 0.4078821, -1.18223, 0, 0.3568628, 1, 1,
0.2841297, -1.035117, 3.702696, 0, 0.3529412, 1, 1,
0.2851162, -0.8218094, 2.647307, 0, 0.345098, 1, 1,
0.28783, -1.291452, 2.910264, 0, 0.3411765, 1, 1,
0.2894291, 0.2383297, 1.538381, 0, 0.3333333, 1, 1,
0.2908249, 1.766616, 1.015391, 0, 0.3294118, 1, 1,
0.2959213, 0.3051145, 1.535407, 0, 0.3215686, 1, 1,
0.2976641, -1.314887, 4.719121, 0, 0.3176471, 1, 1,
0.311237, 2.297475, 1.328217, 0, 0.3098039, 1, 1,
0.3144275, 0.3784081, 0.5833135, 0, 0.3058824, 1, 1,
0.3153045, 1.377764, -0.357428, 0, 0.2980392, 1, 1,
0.315395, -0.5579523, 3.304406, 0, 0.2901961, 1, 1,
0.3171402, 1.047404, 0.1025786, 0, 0.2862745, 1, 1,
0.3200701, 1.4416, 0.4748407, 0, 0.2784314, 1, 1,
0.3209267, -0.246776, 0.1769846, 0, 0.2745098, 1, 1,
0.321172, 1.152161, -0.1607593, 0, 0.2666667, 1, 1,
0.3225187, 0.4808472, -0.4159221, 0, 0.2627451, 1, 1,
0.3251154, 1.811594, 1.064912, 0, 0.254902, 1, 1,
0.3253572, 0.4201119, 1.130875, 0, 0.2509804, 1, 1,
0.3278077, -1.040527, 3.622141, 0, 0.2431373, 1, 1,
0.3287545, 0.391129, -0.5871577, 0, 0.2392157, 1, 1,
0.3305457, 0.7102453, 1.025854, 0, 0.2313726, 1, 1,
0.330844, -0.7876679, 1.435498, 0, 0.227451, 1, 1,
0.3316928, -1.201157, 2.277217, 0, 0.2196078, 1, 1,
0.3317113, -0.5902787, 2.214955, 0, 0.2156863, 1, 1,
0.3329577, 0.1172906, 1.945417, 0, 0.2078431, 1, 1,
0.3329773, 0.1249707, -0.1094096, 0, 0.2039216, 1, 1,
0.3352083, 0.3412597, -0.4280883, 0, 0.1960784, 1, 1,
0.3372468, -2.318972, 3.826966, 0, 0.1882353, 1, 1,
0.3385702, 0.2615621, 0.6979215, 0, 0.1843137, 1, 1,
0.3401344, -1.296409, 2.893839, 0, 0.1764706, 1, 1,
0.3434381, 1.569127, 0.9991508, 0, 0.172549, 1, 1,
0.346845, -0.6637176, 2.239211, 0, 0.1647059, 1, 1,
0.3469009, -0.1638749, 0.03912726, 0, 0.1607843, 1, 1,
0.3474186, -0.3106376, 2.167828, 0, 0.1529412, 1, 1,
0.3519288, -0.8655499, 3.475893, 0, 0.1490196, 1, 1,
0.3540921, 0.3885922, -0.06984288, 0, 0.1411765, 1, 1,
0.3545031, -0.07417732, 0.9464465, 0, 0.1372549, 1, 1,
0.35467, 1.059133, 0.8069316, 0, 0.1294118, 1, 1,
0.3568847, 0.9706086, -0.8583538, 0, 0.1254902, 1, 1,
0.3608739, 0.76226, 0.07682327, 0, 0.1176471, 1, 1,
0.3613653, 1.045305, 0.4558831, 0, 0.1137255, 1, 1,
0.3624823, 1.354687, 0.2058038, 0, 0.1058824, 1, 1,
0.3630469, 2.1782, 0.1563385, 0, 0.09803922, 1, 1,
0.3657093, -0.9616089, 2.273333, 0, 0.09411765, 1, 1,
0.3684432, 0.5315316, -1.603833, 0, 0.08627451, 1, 1,
0.3685647, -1.706516, 2.141935, 0, 0.08235294, 1, 1,
0.3699353, -1.626819, 3.639434, 0, 0.07450981, 1, 1,
0.3705067, -0.2316286, 1.891715, 0, 0.07058824, 1, 1,
0.3707292, 0.4127968, 0.8344659, 0, 0.0627451, 1, 1,
0.3746235, 0.02841041, 2.079245, 0, 0.05882353, 1, 1,
0.3772181, 0.1515676, 0.431387, 0, 0.05098039, 1, 1,
0.3800339, -1.914712, 2.901205, 0, 0.04705882, 1, 1,
0.3826751, -2.179148, 5.522443, 0, 0.03921569, 1, 1,
0.3854955, -0.0209086, 1.679515, 0, 0.03529412, 1, 1,
0.3860089, 0.6673858, -0.6225875, 0, 0.02745098, 1, 1,
0.3878631, 0.2478232, 0.8184425, 0, 0.02352941, 1, 1,
0.3884688, -0.4164672, 1.498099, 0, 0.01568628, 1, 1,
0.3927466, -0.191062, 2.11533, 0, 0.01176471, 1, 1,
0.3929075, 1.069063, -0.4170768, 0, 0.003921569, 1, 1,
0.3936292, -0.4610298, 3.344394, 0.003921569, 0, 1, 1,
0.3941435, -0.05283219, 1.358047, 0.007843138, 0, 1, 1,
0.3968711, 0.0316352, -0.1293635, 0.01568628, 0, 1, 1,
0.4030547, -0.376107, 1.89674, 0.01960784, 0, 1, 1,
0.4060276, 0.1497374, 0.5376041, 0.02745098, 0, 1, 1,
0.4085847, -0.08467894, -0.7156299, 0.03137255, 0, 1, 1,
0.4107282, 1.644207, 1.111402, 0.03921569, 0, 1, 1,
0.4153981, -1.465725, 4.812984, 0.04313726, 0, 1, 1,
0.4179386, -0.4508544, 2.691142, 0.05098039, 0, 1, 1,
0.4184121, -0.5740849, 2.935052, 0.05490196, 0, 1, 1,
0.4214753, -1.044978, 2.347429, 0.0627451, 0, 1, 1,
0.4267817, -0.32997, 2.147468, 0.06666667, 0, 1, 1,
0.4274349, -1.591438, 3.233431, 0.07450981, 0, 1, 1,
0.4358995, -0.1231928, 0.5026317, 0.07843138, 0, 1, 1,
0.4530202, 1.525573, -0.5294487, 0.08627451, 0, 1, 1,
0.45487, 0.5327966, -0.38833, 0.09019608, 0, 1, 1,
0.4549544, -0.8515059, 4.749278, 0.09803922, 0, 1, 1,
0.457052, -1.690774, 3.072006, 0.1058824, 0, 1, 1,
0.4593777, -0.6234356, 2.719513, 0.1098039, 0, 1, 1,
0.4605713, -1.428506, 3.777203, 0.1176471, 0, 1, 1,
0.4631888, -0.1683816, 2.996615, 0.1215686, 0, 1, 1,
0.4632564, -0.3074397, 2.285808, 0.1294118, 0, 1, 1,
0.4649039, 0.134245, 2.36763, 0.1333333, 0, 1, 1,
0.4670495, -0.8905408, 3.627504, 0.1411765, 0, 1, 1,
0.4675454, 0.1347007, 1.228505, 0.145098, 0, 1, 1,
0.4685974, 0.2658093, 1.485574, 0.1529412, 0, 1, 1,
0.4732045, -0.9684744, 0.9328371, 0.1568628, 0, 1, 1,
0.48022, 1.768529, -0.5511866, 0.1647059, 0, 1, 1,
0.4832314, -0.5115663, 3.624238, 0.1686275, 0, 1, 1,
0.4899776, -0.3637074, 2.894403, 0.1764706, 0, 1, 1,
0.49225, 0.8339546, 1.797198, 0.1803922, 0, 1, 1,
0.4967385, 1.290942, 1.44536, 0.1882353, 0, 1, 1,
0.4986668, 0.2561021, 1.813771, 0.1921569, 0, 1, 1,
0.5000188, 0.5881685, -1.487399, 0.2, 0, 1, 1,
0.5036581, -0.6669591, 1.800396, 0.2078431, 0, 1, 1,
0.5043247, -0.5618407, 2.788868, 0.2117647, 0, 1, 1,
0.5057583, -0.1394675, 2.509952, 0.2196078, 0, 1, 1,
0.5078313, -0.7393865, 2.950128, 0.2235294, 0, 1, 1,
0.5086082, -0.6897771, 1.703317, 0.2313726, 0, 1, 1,
0.5115821, 1.488023, -0.3291418, 0.2352941, 0, 1, 1,
0.5163742, 0.7265019, -1.226797, 0.2431373, 0, 1, 1,
0.5189792, 0.5000255, 0.01446124, 0.2470588, 0, 1, 1,
0.5221514, 0.1805702, 1.195836, 0.254902, 0, 1, 1,
0.5245838, 0.3316651, 0.8031408, 0.2588235, 0, 1, 1,
0.5261735, -0.9814703, 2.57193, 0.2666667, 0, 1, 1,
0.5276706, -1.648587, 2.252645, 0.2705882, 0, 1, 1,
0.5290169, 0.3576583, 1.226729, 0.2784314, 0, 1, 1,
0.5303347, 0.1564662, 0.7676303, 0.282353, 0, 1, 1,
0.5318847, 2.203647, -0.1776658, 0.2901961, 0, 1, 1,
0.532849, -1.614473, 2.327865, 0.2941177, 0, 1, 1,
0.5348059, 0.6007853, -0.9757622, 0.3019608, 0, 1, 1,
0.5393825, 0.9455034, -0.4535761, 0.3098039, 0, 1, 1,
0.548012, -0.9588541, 3.07728, 0.3137255, 0, 1, 1,
0.5547596, 0.5467106, -0.6669641, 0.3215686, 0, 1, 1,
0.5562994, -0.3249312, 2.204911, 0.3254902, 0, 1, 1,
0.5597376, 2.449247, 1.862841, 0.3333333, 0, 1, 1,
0.5641263, 0.237238, 2.996578, 0.3372549, 0, 1, 1,
0.5683857, -0.4806423, 4.28554, 0.345098, 0, 1, 1,
0.5703731, -1.42426, 3.171393, 0.3490196, 0, 1, 1,
0.5705914, -0.4439727, 1.289739, 0.3568628, 0, 1, 1,
0.5731511, -0.09008147, 1.683555, 0.3607843, 0, 1, 1,
0.5740477, -0.7332721, 1.275995, 0.3686275, 0, 1, 1,
0.5761088, 0.01639792, 0.8290604, 0.372549, 0, 1, 1,
0.580681, 0.532856, 1.723317, 0.3803922, 0, 1, 1,
0.5821405, 0.2177385, 0.8450783, 0.3843137, 0, 1, 1,
0.5879806, 0.3472334, 1.417536, 0.3921569, 0, 1, 1,
0.5900793, -0.5272615, 2.78764, 0.3960784, 0, 1, 1,
0.5904855, 0.4440278, 1.523199, 0.4039216, 0, 1, 1,
0.5907423, 0.6915639, 2.538156, 0.4117647, 0, 1, 1,
0.5920036, 0.4542989, -0.5695554, 0.4156863, 0, 1, 1,
0.5925306, 1.174554, 1.348862, 0.4235294, 0, 1, 1,
0.5925971, -0.5209742, 2.910525, 0.427451, 0, 1, 1,
0.5941151, 0.1964483, 0.8973105, 0.4352941, 0, 1, 1,
0.5947441, -0.3260824, 1.674886, 0.4392157, 0, 1, 1,
0.5959348, 0.9748436, 1.357192, 0.4470588, 0, 1, 1,
0.5966347, 0.1824088, 1.696757, 0.4509804, 0, 1, 1,
0.5976375, 0.6599734, 0.2707669, 0.4588235, 0, 1, 1,
0.5979706, 0.9297983, 0.9697726, 0.4627451, 0, 1, 1,
0.6006215, -0.5081443, -0.04468044, 0.4705882, 0, 1, 1,
0.612837, -1.394095, 1.032724, 0.4745098, 0, 1, 1,
0.6185921, -0.07310697, 2.90659, 0.4823529, 0, 1, 1,
0.6222583, -0.8031392, 2.027672, 0.4862745, 0, 1, 1,
0.6234019, 0.1892926, -0.6645615, 0.4941176, 0, 1, 1,
0.6268953, -1.257006, 2.882138, 0.5019608, 0, 1, 1,
0.6293138, 0.07381611, 2.173348, 0.5058824, 0, 1, 1,
0.6338542, 1.388534, 1.278309, 0.5137255, 0, 1, 1,
0.6366659, -1.474584, 3.420289, 0.5176471, 0, 1, 1,
0.6430352, 0.6320756, 1.931725, 0.5254902, 0, 1, 1,
0.6481973, 0.2411121, 0.9876571, 0.5294118, 0, 1, 1,
0.6502188, -0.957163, 1.207447, 0.5372549, 0, 1, 1,
0.6519849, -0.4923737, 3.301477, 0.5411765, 0, 1, 1,
0.6580708, 0.3530229, 0.2665212, 0.5490196, 0, 1, 1,
0.6582504, 0.4436554, 2.938132, 0.5529412, 0, 1, 1,
0.6594405, -1.016507, 2.637215, 0.5607843, 0, 1, 1,
0.6632839, -0.9220216, 2.645761, 0.5647059, 0, 1, 1,
0.668893, 0.2328523, 1.398092, 0.572549, 0, 1, 1,
0.6700425, 1.630018, -0.9971545, 0.5764706, 0, 1, 1,
0.6717287, 0.5325701, -0.3453404, 0.5843138, 0, 1, 1,
0.6763108, 0.05177348, 0.4722044, 0.5882353, 0, 1, 1,
0.6772591, -0.7005992, 2.484271, 0.5960785, 0, 1, 1,
0.6781564, -1.433874, 2.611055, 0.6039216, 0, 1, 1,
0.6799626, -1.579454, 1.018655, 0.6078432, 0, 1, 1,
0.6804792, -1.185038, 2.442037, 0.6156863, 0, 1, 1,
0.6855843, -0.5939434, 2.5271, 0.6196079, 0, 1, 1,
0.68653, -1.518355, 2.99876, 0.627451, 0, 1, 1,
0.6884418, -0.6215588, 0.7563342, 0.6313726, 0, 1, 1,
0.6919908, -0.4259564, 3.315412, 0.6392157, 0, 1, 1,
0.6965703, -1.677693, 4.012773, 0.6431373, 0, 1, 1,
0.7103652, 1.481598, -1.107335, 0.6509804, 0, 1, 1,
0.7123073, -0.2444709, 1.806306, 0.654902, 0, 1, 1,
0.7142068, -1.619796, 2.935867, 0.6627451, 0, 1, 1,
0.7179747, -0.872299, 1.378348, 0.6666667, 0, 1, 1,
0.7241564, 1.768058, 0.1457779, 0.6745098, 0, 1, 1,
0.728339, 0.7180558, 0.01380894, 0.6784314, 0, 1, 1,
0.7296817, -1.33056, 2.846704, 0.6862745, 0, 1, 1,
0.7370964, -1.295976, 0.7575527, 0.6901961, 0, 1, 1,
0.7406452, 0.2152881, 1.027314, 0.6980392, 0, 1, 1,
0.7409705, 1.270001, -1.441986, 0.7058824, 0, 1, 1,
0.7453539, 0.2219623, 2.236602, 0.7098039, 0, 1, 1,
0.7504247, -1.483311, 1.436674, 0.7176471, 0, 1, 1,
0.7521452, -2.454279, 1.644387, 0.7215686, 0, 1, 1,
0.7577559, -0.3195164, 1.001667, 0.7294118, 0, 1, 1,
0.7584983, 0.4517252, 1.461142, 0.7333333, 0, 1, 1,
0.7613727, -0.9652544, 1.505341, 0.7411765, 0, 1, 1,
0.7615021, 1.48636, 0.1869852, 0.7450981, 0, 1, 1,
0.7621096, 0.2173573, 0.5625577, 0.7529412, 0, 1, 1,
0.7756202, 1.686624, 2.761457, 0.7568628, 0, 1, 1,
0.7759402, -2.551389, 3.815775, 0.7647059, 0, 1, 1,
0.7781849, 1.100342, 0.7390051, 0.7686275, 0, 1, 1,
0.7786602, 1.809461, 2.48629, 0.7764706, 0, 1, 1,
0.7822326, -0.1676753, 3.509398, 0.7803922, 0, 1, 1,
0.7829467, -0.4176516, 3.248613, 0.7882353, 0, 1, 1,
0.7890554, 0.4655401, 1.351751, 0.7921569, 0, 1, 1,
0.7935462, 0.6849504, 1.852182, 0.8, 0, 1, 1,
0.7936379, 0.09343787, 1.919109, 0.8078431, 0, 1, 1,
0.7943456, -1.035681, 2.848381, 0.8117647, 0, 1, 1,
0.8040331, -0.8733651, 3.840968, 0.8196079, 0, 1, 1,
0.8108568, 0.1599839, 1.584215, 0.8235294, 0, 1, 1,
0.8157313, -1.534908, 0.9863009, 0.8313726, 0, 1, 1,
0.8172458, -0.2043527, 1.82792, 0.8352941, 0, 1, 1,
0.8191347, -0.7046617, 2.02725, 0.8431373, 0, 1, 1,
0.8208392, 0.6654447, -0.3730995, 0.8470588, 0, 1, 1,
0.8223119, 0.6197352, 1.569904, 0.854902, 0, 1, 1,
0.8236116, -0.9625938, 2.384516, 0.8588235, 0, 1, 1,
0.8267795, 0.562999, 2.521687, 0.8666667, 0, 1, 1,
0.8275037, -0.3004747, 1.564582, 0.8705882, 0, 1, 1,
0.8283446, -1.477813, 3.317985, 0.8784314, 0, 1, 1,
0.8335031, 1.236132, 1.661485, 0.8823529, 0, 1, 1,
0.8353671, 0.4295386, 1.289132, 0.8901961, 0, 1, 1,
0.8365325, 0.2449993, 1.017021, 0.8941177, 0, 1, 1,
0.8386414, 0.1026341, 1.324542, 0.9019608, 0, 1, 1,
0.8475259, 0.141552, 2.955658, 0.9098039, 0, 1, 1,
0.8666595, -1.068424, 2.746367, 0.9137255, 0, 1, 1,
0.8677124, -0.01966615, 2.652073, 0.9215686, 0, 1, 1,
0.8708957, -0.02399829, 1.880552, 0.9254902, 0, 1, 1,
0.8743296, -0.7376957, 1.360732, 0.9333333, 0, 1, 1,
0.8769413, -0.004107019, 2.109045, 0.9372549, 0, 1, 1,
0.8773487, -2.59782, 2.767277, 0.945098, 0, 1, 1,
0.8784722, 0.1536567, 3.508923, 0.9490196, 0, 1, 1,
0.8801343, 2.798655, -0.1549184, 0.9568627, 0, 1, 1,
0.880331, -1.237912, 2.862557, 0.9607843, 0, 1, 1,
0.8815754, 1.460245, 2.177064, 0.9686275, 0, 1, 1,
0.8855463, 1.079693, 1.596041, 0.972549, 0, 1, 1,
0.9000927, -0.2707136, 1.458358, 0.9803922, 0, 1, 1,
0.9009746, 1.661469, 0.1741058, 0.9843137, 0, 1, 1,
0.9058338, -0.9513385, 2.289992, 0.9921569, 0, 1, 1,
0.9100147, 0.2956543, 0.8424245, 0.9960784, 0, 1, 1,
0.9116295, -0.4297839, 2.689616, 1, 0, 0.9960784, 1,
0.9155477, 0.668455, 0.4553609, 1, 0, 0.9882353, 1,
0.9161139, 1.241321, 0.4256505, 1, 0, 0.9843137, 1,
0.9189584, -0.2513278, 3.783769, 1, 0, 0.9764706, 1,
0.9204475, 2.257771, 0.9479995, 1, 0, 0.972549, 1,
0.9245434, 0.7297955, 2.432899, 1, 0, 0.9647059, 1,
0.9306698, 0.149846, -0.2107484, 1, 0, 0.9607843, 1,
0.9335236, 1.500775, 0.6391593, 1, 0, 0.9529412, 1,
0.9390554, 0.8151811, 0.7900538, 1, 0, 0.9490196, 1,
0.9395629, 0.3259112, 2.882698, 1, 0, 0.9411765, 1,
0.9714392, -1.81552, 3.741502, 1, 0, 0.9372549, 1,
0.9734211, 0.5598876, 1.303507, 1, 0, 0.9294118, 1,
0.9771091, -1.88268, 5.933287, 1, 0, 0.9254902, 1,
0.9865999, 0.8484243, 1.11019, 1, 0, 0.9176471, 1,
0.9899029, 1.749189, 0.441673, 1, 0, 0.9137255, 1,
0.9991112, 0.3834822, 3.803313, 1, 0, 0.9058824, 1,
1.004211, -1.248381, 2.906253, 1, 0, 0.9019608, 1,
1.017362, -2.363379, 3.5447, 1, 0, 0.8941177, 1,
1.041456, 0.6228052, -0.5838581, 1, 0, 0.8862745, 1,
1.041798, -0.8071527, 1.090813, 1, 0, 0.8823529, 1,
1.045275, 0.5032384, 1.79614, 1, 0, 0.8745098, 1,
1.058756, 0.4581611, 1.582592, 1, 0, 0.8705882, 1,
1.060789, 1.867315, -0.2978927, 1, 0, 0.8627451, 1,
1.06248, -0.3567762, 2.522893, 1, 0, 0.8588235, 1,
1.063939, -0.5704917, 2.163881, 1, 0, 0.8509804, 1,
1.071812, 0.3638803, 1.6463, 1, 0, 0.8470588, 1,
1.07575, 0.5956532, 5.136422, 1, 0, 0.8392157, 1,
1.076996, -0.7260548, 3.814603, 1, 0, 0.8352941, 1,
1.083177, 1.576685, 0.6853768, 1, 0, 0.827451, 1,
1.083256, 0.4815126, 2.321227, 1, 0, 0.8235294, 1,
1.084831, -0.3561082, 2.066323, 1, 0, 0.8156863, 1,
1.086308, -1.6117, 2.559177, 1, 0, 0.8117647, 1,
1.086522, 1.264967, 0.2572538, 1, 0, 0.8039216, 1,
1.099788, -0.1750685, 1.51745, 1, 0, 0.7960784, 1,
1.099862, -0.3129361, 1.141093, 1, 0, 0.7921569, 1,
1.100682, -0.06723453, -0.006593016, 1, 0, 0.7843137, 1,
1.10215, 1.364571, 1.283257, 1, 0, 0.7803922, 1,
1.105446, 0.8966525, -1.040384, 1, 0, 0.772549, 1,
1.129586, 0.09639932, 1.298577, 1, 0, 0.7686275, 1,
1.129677, 1.776476, -0.6564813, 1, 0, 0.7607843, 1,
1.155362, -1.604873, 2.143371, 1, 0, 0.7568628, 1,
1.157156, 0.1330705, 0.5667211, 1, 0, 0.7490196, 1,
1.157219, -1.118757, 3.749772, 1, 0, 0.7450981, 1,
1.161621, -1.659344, 2.256836, 1, 0, 0.7372549, 1,
1.164108, 1.318465, 1.504866, 1, 0, 0.7333333, 1,
1.167195, -0.5700038, 3.018669, 1, 0, 0.7254902, 1,
1.16978, -0.4782621, 2.075353, 1, 0, 0.7215686, 1,
1.171081, -1.849152, 2.119827, 1, 0, 0.7137255, 1,
1.179323, -0.2766375, 0.2855563, 1, 0, 0.7098039, 1,
1.182545, -0.2539821, 1.824907, 1, 0, 0.7019608, 1,
1.186745, 2.59774, 0.4045633, 1, 0, 0.6941177, 1,
1.193261, 1.29421, 0.4861299, 1, 0, 0.6901961, 1,
1.194401, -1.830423, 1.460148, 1, 0, 0.682353, 1,
1.196751, 1.806383, -0.5208023, 1, 0, 0.6784314, 1,
1.204639, 0.01272703, 3.444995, 1, 0, 0.6705883, 1,
1.205333, -1.283045, 2.636284, 1, 0, 0.6666667, 1,
1.206666, 0.4182527, 0.4779868, 1, 0, 0.6588235, 1,
1.213549, 0.1801728, 1.974998, 1, 0, 0.654902, 1,
1.214716, 0.09155382, 0.5108149, 1, 0, 0.6470588, 1,
1.232219, 0.5892308, 1.202379, 1, 0, 0.6431373, 1,
1.232616, 0.487121, 2.148299, 1, 0, 0.6352941, 1,
1.234124, -1.275841, 1.442132, 1, 0, 0.6313726, 1,
1.234945, 0.3155135, 2.016042, 1, 0, 0.6235294, 1,
1.235176, -0.6486539, 0.5226345, 1, 0, 0.6196079, 1,
1.237141, -0.667963, 1.537143, 1, 0, 0.6117647, 1,
1.245865, -0.4992719, 2.304056, 1, 0, 0.6078432, 1,
1.248199, 0.2444174, 1.307495, 1, 0, 0.6, 1,
1.24932, -0.7088796, 1.65946, 1, 0, 0.5921569, 1,
1.260876, 0.2381675, 0.5131481, 1, 0, 0.5882353, 1,
1.269345, 2.510511, -0.0198362, 1, 0, 0.5803922, 1,
1.269617, -1.564658, 2.698055, 1, 0, 0.5764706, 1,
1.270074, -0.1781688, 2.010876, 1, 0, 0.5686275, 1,
1.27236, 2.428595, 0.6690409, 1, 0, 0.5647059, 1,
1.284802, 0.5534737, 1.845348, 1, 0, 0.5568628, 1,
1.29121, -0.06163745, 2.041729, 1, 0, 0.5529412, 1,
1.297903, 0.08324789, 0.9488345, 1, 0, 0.5450981, 1,
1.29833, 0.8020756, 0.9235742, 1, 0, 0.5411765, 1,
1.301782, 1.578754, 0.2095295, 1, 0, 0.5333334, 1,
1.302363, -0.7357947, 3.193073, 1, 0, 0.5294118, 1,
1.312087, 0.2743758, 0.572279, 1, 0, 0.5215687, 1,
1.322651, 0.4181303, 0.2263605, 1, 0, 0.5176471, 1,
1.33474, 0.7022502, 0.4345571, 1, 0, 0.509804, 1,
1.335181, 0.6425981, 2.230954, 1, 0, 0.5058824, 1,
1.339143, 0.4224845, 0.7880071, 1, 0, 0.4980392, 1,
1.339628, -1.132551, 3.117849, 1, 0, 0.4901961, 1,
1.341268, 0.1242571, 0.8910584, 1, 0, 0.4862745, 1,
1.349178, 0.2361985, 0.006481113, 1, 0, 0.4784314, 1,
1.353036, 0.7482507, 0.5057381, 1, 0, 0.4745098, 1,
1.355171, 0.4943321, 2.623495, 1, 0, 0.4666667, 1,
1.356816, -0.05972622, 0.5736597, 1, 0, 0.4627451, 1,
1.370803, -0.01540092, 0.6142303, 1, 0, 0.454902, 1,
1.38593, 0.1409663, -0.5185664, 1, 0, 0.4509804, 1,
1.387047, 0.293395, 0.7601476, 1, 0, 0.4431373, 1,
1.398899, 0.1080251, 1.908451, 1, 0, 0.4392157, 1,
1.404977, 0.5929049, 0.817072, 1, 0, 0.4313726, 1,
1.417075, -0.2109698, 2.364982, 1, 0, 0.427451, 1,
1.426711, 1.390767, 1.547298, 1, 0, 0.4196078, 1,
1.427117, -0.5403618, 2.548451, 1, 0, 0.4156863, 1,
1.428903, 0.3841653, 0.6431715, 1, 0, 0.4078431, 1,
1.446551, -0.4659124, 3.908011, 1, 0, 0.4039216, 1,
1.450136, -1.953691, 2.326055, 1, 0, 0.3960784, 1,
1.451431, 1.506026, 0.2677512, 1, 0, 0.3882353, 1,
1.459917, 0.5477473, -0.8979951, 1, 0, 0.3843137, 1,
1.4625, 1.453429, 0.5440745, 1, 0, 0.3764706, 1,
1.465539, 1.014808, 1.132779, 1, 0, 0.372549, 1,
1.479121, -1.548449, 1.970483, 1, 0, 0.3647059, 1,
1.481432, -2.336506, 1.759927, 1, 0, 0.3607843, 1,
1.481713, 0.2102076, -0.1779507, 1, 0, 0.3529412, 1,
1.505057, -0.02490494, 1.812443, 1, 0, 0.3490196, 1,
1.50512, 0.9805311, -0.579227, 1, 0, 0.3411765, 1,
1.522642, 0.909717, 0.8710418, 1, 0, 0.3372549, 1,
1.523211, -0.1937554, 3.131388, 1, 0, 0.3294118, 1,
1.5406, 2.143188, -0.2102283, 1, 0, 0.3254902, 1,
1.540637, -0.3690076, 1.912848, 1, 0, 0.3176471, 1,
1.550042, -1.474427, 2.244039, 1, 0, 0.3137255, 1,
1.556477, 1.118525, 1.904436, 1, 0, 0.3058824, 1,
1.579889, -0.2009904, 1.245035, 1, 0, 0.2980392, 1,
1.588067, -2.278489, 2.56729, 1, 0, 0.2941177, 1,
1.626037, -1.464026, 2.213233, 1, 0, 0.2862745, 1,
1.628289, 0.2202398, 2.004559, 1, 0, 0.282353, 1,
1.63614, -0.9337217, 1.661994, 1, 0, 0.2745098, 1,
1.648104, 0.6708213, 0.03533154, 1, 0, 0.2705882, 1,
1.701235, 0.2771823, 0.2261926, 1, 0, 0.2627451, 1,
1.70241, 1.867758, 0.6588421, 1, 0, 0.2588235, 1,
1.711968, -0.03864041, 1.130261, 1, 0, 0.2509804, 1,
1.731526, 1.777742, 1.811352, 1, 0, 0.2470588, 1,
1.738489, 0.004467831, 1.587509, 1, 0, 0.2392157, 1,
1.74419, -0.5288098, 2.699731, 1, 0, 0.2352941, 1,
1.744271, 1.229493, 1.600794, 1, 0, 0.227451, 1,
1.775835, -0.5560783, 1.552181, 1, 0, 0.2235294, 1,
1.804761, 1.598643, 1.665519, 1, 0, 0.2156863, 1,
1.805409, -0.7003596, 1.006325, 1, 0, 0.2117647, 1,
1.816213, -0.2639619, 1.68063, 1, 0, 0.2039216, 1,
1.820394, -0.3342479, 2.238027, 1, 0, 0.1960784, 1,
1.839163, -0.7771904, 2.658474, 1, 0, 0.1921569, 1,
1.874014, -0.7072396, 1.141273, 1, 0, 0.1843137, 1,
1.899509, -0.5936638, 2.768869, 1, 0, 0.1803922, 1,
1.90525, -0.2723509, 1.557552, 1, 0, 0.172549, 1,
1.931021, -0.6139026, 1.463641, 1, 0, 0.1686275, 1,
1.937934, 0.7739921, -0.317464, 1, 0, 0.1607843, 1,
1.951465, 1.509491, 0.03633298, 1, 0, 0.1568628, 1,
1.952064, -0.2776559, 1.926235, 1, 0, 0.1490196, 1,
1.953843, -0.6219, 2.637949, 1, 0, 0.145098, 1,
1.959291, 1.720089, -0.8588943, 1, 0, 0.1372549, 1,
1.986752, 0.8321291, -0.2502588, 1, 0, 0.1333333, 1,
2.007459, -0.06771956, 1.077828, 1, 0, 0.1254902, 1,
2.04302, -0.4856195, 2.412571, 1, 0, 0.1215686, 1,
2.066489, 0.1852207, 1.534117, 1, 0, 0.1137255, 1,
2.08287, -0.4425474, 2.082881, 1, 0, 0.1098039, 1,
2.119577, -1.018089, 3.798592, 1, 0, 0.1019608, 1,
2.139189, 1.07168, 0.6847938, 1, 0, 0.09411765, 1,
2.161586, 0.9286645, -0.06782697, 1, 0, 0.09019608, 1,
2.189074, 0.1047771, 2.943755, 1, 0, 0.08235294, 1,
2.192717, -0.0006288429, 2.025969, 1, 0, 0.07843138, 1,
2.20736, 0.5535116, 2.813735, 1, 0, 0.07058824, 1,
2.233386, -0.600651, 2.052518, 1, 0, 0.06666667, 1,
2.23929, 0.354681, 1.455655, 1, 0, 0.05882353, 1,
2.262738, 0.09795641, 2.016076, 1, 0, 0.05490196, 1,
2.34332, -2.202328, 2.087347, 1, 0, 0.04705882, 1,
2.412551, 1.462388, 1.002098, 1, 0, 0.04313726, 1,
2.470698, 0.5361348, 1.430719, 1, 0, 0.03529412, 1,
2.480898, -1.784807, 4.565649, 1, 0, 0.03137255, 1,
2.523419, 0.4685568, 1.170451, 1, 0, 0.02352941, 1,
2.61487, -0.1949351, 1.07147, 1, 0, 0.01960784, 1,
3.252467, -0.1885102, 3.003158, 1, 0, 0.01176471, 1,
3.500528, 0.2365225, 3.579073, 1, 0, 0.007843138, 1
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
0.4329352, -4.086388, -6.983512, 0, -0.5, 0.5, 0.5,
0.4329352, -4.086388, -6.983512, 1, -0.5, 0.5, 0.5,
0.4329352, -4.086388, -6.983512, 1, 1.5, 0.5, 0.5,
0.4329352, -4.086388, -6.983512, 0, 1.5, 0.5, 0.5
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
-3.674571, 0.2800295, -6.983512, 0, -0.5, 0.5, 0.5,
-3.674571, 0.2800295, -6.983512, 1, -0.5, 0.5, 0.5,
-3.674571, 0.2800295, -6.983512, 1, 1.5, 0.5, 0.5,
-3.674571, 0.2800295, -6.983512, 0, 1.5, 0.5, 0.5
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
-3.674571, -4.086388, 0.4109273, 0, -0.5, 0.5, 0.5,
-3.674571, -4.086388, 0.4109273, 1, -0.5, 0.5, 0.5,
-3.674571, -4.086388, 0.4109273, 1, 1.5, 0.5, 0.5,
-3.674571, -4.086388, 0.4109273, 0, 1.5, 0.5, 0.5
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
-2, -3.078753, -5.277103,
3, -3.078753, -5.277103,
-2, -3.078753, -5.277103,
-2, -3.246692, -5.561505,
-1, -3.078753, -5.277103,
-1, -3.246692, -5.561505,
0, -3.078753, -5.277103,
0, -3.246692, -5.561505,
1, -3.078753, -5.277103,
1, -3.246692, -5.561505,
2, -3.078753, -5.277103,
2, -3.246692, -5.561505,
3, -3.078753, -5.277103,
3, -3.246692, -5.561505
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
-2, -3.58257, -6.130308, 0, -0.5, 0.5, 0.5,
-2, -3.58257, -6.130308, 1, -0.5, 0.5, 0.5,
-2, -3.58257, -6.130308, 1, 1.5, 0.5, 0.5,
-2, -3.58257, -6.130308, 0, 1.5, 0.5, 0.5,
-1, -3.58257, -6.130308, 0, -0.5, 0.5, 0.5,
-1, -3.58257, -6.130308, 1, -0.5, 0.5, 0.5,
-1, -3.58257, -6.130308, 1, 1.5, 0.5, 0.5,
-1, -3.58257, -6.130308, 0, 1.5, 0.5, 0.5,
0, -3.58257, -6.130308, 0, -0.5, 0.5, 0.5,
0, -3.58257, -6.130308, 1, -0.5, 0.5, 0.5,
0, -3.58257, -6.130308, 1, 1.5, 0.5, 0.5,
0, -3.58257, -6.130308, 0, 1.5, 0.5, 0.5,
1, -3.58257, -6.130308, 0, -0.5, 0.5, 0.5,
1, -3.58257, -6.130308, 1, -0.5, 0.5, 0.5,
1, -3.58257, -6.130308, 1, 1.5, 0.5, 0.5,
1, -3.58257, -6.130308, 0, 1.5, 0.5, 0.5,
2, -3.58257, -6.130308, 0, -0.5, 0.5, 0.5,
2, -3.58257, -6.130308, 1, -0.5, 0.5, 0.5,
2, -3.58257, -6.130308, 1, 1.5, 0.5, 0.5,
2, -3.58257, -6.130308, 0, 1.5, 0.5, 0.5,
3, -3.58257, -6.130308, 0, -0.5, 0.5, 0.5,
3, -3.58257, -6.130308, 1, -0.5, 0.5, 0.5,
3, -3.58257, -6.130308, 1, 1.5, 0.5, 0.5,
3, -3.58257, -6.130308, 0, 1.5, 0.5, 0.5
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
-2.726685, -2, -5.277103,
-2.726685, 3, -5.277103,
-2.726685, -2, -5.277103,
-2.884666, -2, -5.561505,
-2.726685, -1, -5.277103,
-2.884666, -1, -5.561505,
-2.726685, 0, -5.277103,
-2.884666, 0, -5.561505,
-2.726685, 1, -5.277103,
-2.884666, 1, -5.561505,
-2.726685, 2, -5.277103,
-2.884666, 2, -5.561505,
-2.726685, 3, -5.277103,
-2.884666, 3, -5.561505
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
-3.200628, -2, -6.130308, 0, -0.5, 0.5, 0.5,
-3.200628, -2, -6.130308, 1, -0.5, 0.5, 0.5,
-3.200628, -2, -6.130308, 1, 1.5, 0.5, 0.5,
-3.200628, -2, -6.130308, 0, 1.5, 0.5, 0.5,
-3.200628, -1, -6.130308, 0, -0.5, 0.5, 0.5,
-3.200628, -1, -6.130308, 1, -0.5, 0.5, 0.5,
-3.200628, -1, -6.130308, 1, 1.5, 0.5, 0.5,
-3.200628, -1, -6.130308, 0, 1.5, 0.5, 0.5,
-3.200628, 0, -6.130308, 0, -0.5, 0.5, 0.5,
-3.200628, 0, -6.130308, 1, -0.5, 0.5, 0.5,
-3.200628, 0, -6.130308, 1, 1.5, 0.5, 0.5,
-3.200628, 0, -6.130308, 0, 1.5, 0.5, 0.5,
-3.200628, 1, -6.130308, 0, -0.5, 0.5, 0.5,
-3.200628, 1, -6.130308, 1, -0.5, 0.5, 0.5,
-3.200628, 1, -6.130308, 1, 1.5, 0.5, 0.5,
-3.200628, 1, -6.130308, 0, 1.5, 0.5, 0.5,
-3.200628, 2, -6.130308, 0, -0.5, 0.5, 0.5,
-3.200628, 2, -6.130308, 1, -0.5, 0.5, 0.5,
-3.200628, 2, -6.130308, 1, 1.5, 0.5, 0.5,
-3.200628, 2, -6.130308, 0, 1.5, 0.5, 0.5,
-3.200628, 3, -6.130308, 0, -0.5, 0.5, 0.5,
-3.200628, 3, -6.130308, 1, -0.5, 0.5, 0.5,
-3.200628, 3, -6.130308, 1, 1.5, 0.5, 0.5,
-3.200628, 3, -6.130308, 0, 1.5, 0.5, 0.5
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
-2.726685, -3.078753, -4,
-2.726685, -3.078753, 4,
-2.726685, -3.078753, -4,
-2.884666, -3.246692, -4,
-2.726685, -3.078753, -2,
-2.884666, -3.246692, -2,
-2.726685, -3.078753, 0,
-2.884666, -3.246692, 0,
-2.726685, -3.078753, 2,
-2.884666, -3.246692, 2,
-2.726685, -3.078753, 4,
-2.884666, -3.246692, 4
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
-3.200628, -3.58257, -4, 0, -0.5, 0.5, 0.5,
-3.200628, -3.58257, -4, 1, -0.5, 0.5, 0.5,
-3.200628, -3.58257, -4, 1, 1.5, 0.5, 0.5,
-3.200628, -3.58257, -4, 0, 1.5, 0.5, 0.5,
-3.200628, -3.58257, -2, 0, -0.5, 0.5, 0.5,
-3.200628, -3.58257, -2, 1, -0.5, 0.5, 0.5,
-3.200628, -3.58257, -2, 1, 1.5, 0.5, 0.5,
-3.200628, -3.58257, -2, 0, 1.5, 0.5, 0.5,
-3.200628, -3.58257, 0, 0, -0.5, 0.5, 0.5,
-3.200628, -3.58257, 0, 1, -0.5, 0.5, 0.5,
-3.200628, -3.58257, 0, 1, 1.5, 0.5, 0.5,
-3.200628, -3.58257, 0, 0, 1.5, 0.5, 0.5,
-3.200628, -3.58257, 2, 0, -0.5, 0.5, 0.5,
-3.200628, -3.58257, 2, 1, -0.5, 0.5, 0.5,
-3.200628, -3.58257, 2, 1, 1.5, 0.5, 0.5,
-3.200628, -3.58257, 2, 0, 1.5, 0.5, 0.5,
-3.200628, -3.58257, 4, 0, -0.5, 0.5, 0.5,
-3.200628, -3.58257, 4, 1, -0.5, 0.5, 0.5,
-3.200628, -3.58257, 4, 1, 1.5, 0.5, 0.5,
-3.200628, -3.58257, 4, 0, 1.5, 0.5, 0.5
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
-2.726685, -3.078753, -5.277103,
-2.726685, 3.638812, -5.277103,
-2.726685, -3.078753, 6.098958,
-2.726685, 3.638812, 6.098958,
-2.726685, -3.078753, -5.277103,
-2.726685, -3.078753, 6.098958,
-2.726685, 3.638812, -5.277103,
-2.726685, 3.638812, 6.098958,
-2.726685, -3.078753, -5.277103,
3.592555, -3.078753, -5.277103,
-2.726685, -3.078753, 6.098958,
3.592555, -3.078753, 6.098958,
-2.726685, 3.638812, -5.277103,
3.592555, 3.638812, -5.277103,
-2.726685, 3.638812, 6.098958,
3.592555, 3.638812, 6.098958,
3.592555, -3.078753, -5.277103,
3.592555, 3.638812, -5.277103,
3.592555, -3.078753, 6.098958,
3.592555, 3.638812, 6.098958,
3.592555, -3.078753, -5.277103,
3.592555, -3.078753, 6.098958,
3.592555, 3.638812, -5.277103,
3.592555, 3.638812, 6.098958
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
var radius = 7.820095;
var distance = 34.79249;
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
mvMatrix.translate( -0.4329352, -0.2800295, -0.4109273 );
mvMatrix.scale( 1.338015, 1.258676, 0.7432485 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.79249);
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
triazoxide<-read.table("triazoxide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triazoxide$V2
```

```
## Error in eval(expr, envir, enclos): object 'triazoxide' not found
```

```r
y<-triazoxide$V3
```

```
## Error in eval(expr, envir, enclos): object 'triazoxide' not found
```

```r
z<-triazoxide$V4
```

```
## Error in eval(expr, envir, enclos): object 'triazoxide' not found
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
-2.634657, 0.3243305, -3.012267, 0, 0, 1, 1, 1,
-2.627222, -0.6654657, -3.389395, 1, 0, 0, 1, 1,
-2.425173, 0.1289456, 0.001978042, 1, 0, 0, 1, 1,
-2.412179, -0.6968163, -1.991758, 1, 0, 0, 1, 1,
-2.380214, -0.3182515, -1.540734, 1, 0, 0, 1, 1,
-2.347311, 0.5102956, -1.927878, 1, 0, 0, 1, 1,
-2.319385, -0.5067829, -3.568827, 0, 0, 0, 1, 1,
-2.303598, -0.3866341, -1.583801, 0, 0, 0, 1, 1,
-2.29152, -1.502616, -1.966457, 0, 0, 0, 1, 1,
-2.251186, -0.927804, -1.096901, 0, 0, 0, 1, 1,
-2.248856, -2.2279, -1.772708, 0, 0, 0, 1, 1,
-2.218899, 1.472061, -0.3017721, 0, 0, 0, 1, 1,
-2.209146, 0.7657436, -0.7199244, 0, 0, 0, 1, 1,
-2.193318, 1.154493, -0.663461, 1, 1, 1, 1, 1,
-2.164066, -0.1590746, -0.7287377, 1, 1, 1, 1, 1,
-2.079332, -1.43398, -1.853687, 1, 1, 1, 1, 1,
-2.027642, 0.3295488, -0.7996333, 1, 1, 1, 1, 1,
-2.001072, -0.3944921, -1.889685, 1, 1, 1, 1, 1,
-1.9963, 0.4635968, -1.197923, 1, 1, 1, 1, 1,
-1.986244, 1.085088, -0.1735004, 1, 1, 1, 1, 1,
-1.983254, 0.5824053, -2.00511, 1, 1, 1, 1, 1,
-1.969707, 0.79378, -2.145326, 1, 1, 1, 1, 1,
-1.969007, 1.108113, -2.22731, 1, 1, 1, 1, 1,
-1.959612, 0.4444327, -1.286803, 1, 1, 1, 1, 1,
-1.934625, 0.8612099, -0.6301849, 1, 1, 1, 1, 1,
-1.924543, 1.095573, -1.159319, 1, 1, 1, 1, 1,
-1.909714, 0.4240251, -1.132313, 1, 1, 1, 1, 1,
-1.889289, -0.5935821, 1.037741, 1, 1, 1, 1, 1,
-1.877385, -2.050225, -3.105087, 0, 0, 1, 1, 1,
-1.868832, -1.035046, -2.261884, 1, 0, 0, 1, 1,
-1.839182, -0.2614829, -2.862184, 1, 0, 0, 1, 1,
-1.820096, 0.3755781, -0.6067324, 1, 0, 0, 1, 1,
-1.810425, -0.4806264, -2.640253, 1, 0, 0, 1, 1,
-1.809893, -0.05988462, -0.6254776, 1, 0, 0, 1, 1,
-1.807613, 0.9313843, -1.348341, 0, 0, 0, 1, 1,
-1.801788, 1.284139, -0.6403145, 0, 0, 0, 1, 1,
-1.799756, -0.864768, -2.663167, 0, 0, 0, 1, 1,
-1.798894, -0.4679346, -2.013608, 0, 0, 0, 1, 1,
-1.795266, -1.185821, -2.009424, 0, 0, 0, 1, 1,
-1.795007, 1.385248, -2.542617, 0, 0, 0, 1, 1,
-1.780776, 0.5105436, -1.367924, 0, 0, 0, 1, 1,
-1.76889, -0.07564556, -1.160124, 1, 1, 1, 1, 1,
-1.768663, -1.293361, -1.668447, 1, 1, 1, 1, 1,
-1.762731, -0.8127301, -2.228647, 1, 1, 1, 1, 1,
-1.760284, 0.1339357, 0.702062, 1, 1, 1, 1, 1,
-1.74291, 0.2722124, -2.377331, 1, 1, 1, 1, 1,
-1.718613, 0.3930742, -0.6520432, 1, 1, 1, 1, 1,
-1.687486, 0.8370256, -0.6098156, 1, 1, 1, 1, 1,
-1.686318, -1.843245, -1.390624, 1, 1, 1, 1, 1,
-1.665765, -1.923755, -2.257647, 1, 1, 1, 1, 1,
-1.661596, -0.5199029, -1.162155, 1, 1, 1, 1, 1,
-1.643003, 0.2469913, -2.278692, 1, 1, 1, 1, 1,
-1.627365, 1.586467, -1.770605, 1, 1, 1, 1, 1,
-1.620687, -1.494259, -2.234126, 1, 1, 1, 1, 1,
-1.606908, 0.09947837, -0.3939568, 1, 1, 1, 1, 1,
-1.592234, 0.8224244, -3.395616, 1, 1, 1, 1, 1,
-1.584226, 1.66576, -0.8774632, 0, 0, 1, 1, 1,
-1.571097, 1.446712, -2.050752, 1, 0, 0, 1, 1,
-1.56974, 1.176772, -1.432173, 1, 0, 0, 1, 1,
-1.565861, 0.1158948, -3.076849, 1, 0, 0, 1, 1,
-1.544105, 1.084177, 0.3085158, 1, 0, 0, 1, 1,
-1.541733, 1.3227, -0.7419655, 1, 0, 0, 1, 1,
-1.52492, 1.457685, -2.759558, 0, 0, 0, 1, 1,
-1.515038, -1.063069, -2.765445, 0, 0, 0, 1, 1,
-1.498179, -1.46128, -1.303523, 0, 0, 0, 1, 1,
-1.487502, -0.4081733, -1.574917, 0, 0, 0, 1, 1,
-1.476146, -0.6835627, -2.509799, 0, 0, 0, 1, 1,
-1.467632, -0.2926634, -1.628287, 0, 0, 0, 1, 1,
-1.453293, 0.6452234, -1.64437, 0, 0, 0, 1, 1,
-1.440614, -0.6829933, -2.869416, 1, 1, 1, 1, 1,
-1.43261, -0.02129962, -2.298, 1, 1, 1, 1, 1,
-1.420942, 1.221133, -2.158451, 1, 1, 1, 1, 1,
-1.418613, -1.472801, -1.404577, 1, 1, 1, 1, 1,
-1.408458, -0.5570438, -3.694691, 1, 1, 1, 1, 1,
-1.391135, -0.2340873, -2.833954, 1, 1, 1, 1, 1,
-1.380843, -0.6484028, -1.855323, 1, 1, 1, 1, 1,
-1.371931, -0.8207108, -0.5668132, 1, 1, 1, 1, 1,
-1.357406, 0.1770695, -3.098537, 1, 1, 1, 1, 1,
-1.351673, -0.2754319, -1.597954, 1, 1, 1, 1, 1,
-1.347764, -1.379144, 0.6522487, 1, 1, 1, 1, 1,
-1.346936, 0.3101816, -3.185133, 1, 1, 1, 1, 1,
-1.346101, 0.6745659, -2.400771, 1, 1, 1, 1, 1,
-1.340769, 0.8026304, -1.358297, 1, 1, 1, 1, 1,
-1.338716, -0.8570557, -2.903575, 1, 1, 1, 1, 1,
-1.332743, 1.156893, -3.36808, 0, 0, 1, 1, 1,
-1.331819, 1.948548, -0.248262, 1, 0, 0, 1, 1,
-1.330539, 0.3028687, -2.851556, 1, 0, 0, 1, 1,
-1.329867, 2.341287, 0.4392393, 1, 0, 0, 1, 1,
-1.323824, -0.02680402, -1.557719, 1, 0, 0, 1, 1,
-1.323298, -0.1925898, -1.436172, 1, 0, 0, 1, 1,
-1.322104, -1.610513, -2.643981, 0, 0, 0, 1, 1,
-1.298244, -0.4803974, -2.08342, 0, 0, 0, 1, 1,
-1.297375, 0.3688586, -0.3144373, 0, 0, 0, 1, 1,
-1.295535, 0.4471625, -0.2896681, 0, 0, 0, 1, 1,
-1.288852, -1.484296, -2.587541, 0, 0, 0, 1, 1,
-1.285541, 0.7726526, -1.158459, 0, 0, 0, 1, 1,
-1.278973, 0.07161685, -1.946759, 0, 0, 0, 1, 1,
-1.27374, 0.4615587, -2.129169, 1, 1, 1, 1, 1,
-1.270608, -0.3943758, -4.506867, 1, 1, 1, 1, 1,
-1.26945, -0.1905934, -1.954401, 1, 1, 1, 1, 1,
-1.264366, -0.5368616, -1.584959, 1, 1, 1, 1, 1,
-1.264238, 0.9624026, -1.640929, 1, 1, 1, 1, 1,
-1.259456, -0.1989019, -2.300189, 1, 1, 1, 1, 1,
-1.250388, 0.4062789, -1.89212, 1, 1, 1, 1, 1,
-1.226376, -1.690618, -2.933522, 1, 1, 1, 1, 1,
-1.225471, -1.079803, -2.338922, 1, 1, 1, 1, 1,
-1.223722, -2.302712, -1.308553, 1, 1, 1, 1, 1,
-1.219839, 0.4931761, -0.07362644, 1, 1, 1, 1, 1,
-1.214908, 0.1459619, -2.455837, 1, 1, 1, 1, 1,
-1.206252, 0.3647066, -0.08718733, 1, 1, 1, 1, 1,
-1.20331, 0.3381995, -0.8440455, 1, 1, 1, 1, 1,
-1.202363, 0.3563395, -0.96632, 1, 1, 1, 1, 1,
-1.187374, -0.7730665, -0.7059636, 0, 0, 1, 1, 1,
-1.178449, -0.1383426, -2.909179, 1, 0, 0, 1, 1,
-1.173866, 0.1057235, -1.373977, 1, 0, 0, 1, 1,
-1.17193, -1.319483, -1.706383, 1, 0, 0, 1, 1,
-1.168089, -0.09920505, 0.7970219, 1, 0, 0, 1, 1,
-1.160355, 0.6878635, -1.902387, 1, 0, 0, 1, 1,
-1.157194, -1.646134, -3.755258, 0, 0, 0, 1, 1,
-1.155369, 1.062135, -0.6381708, 0, 0, 0, 1, 1,
-1.147039, -0.1937963, 0.7602383, 0, 0, 0, 1, 1,
-1.145766, 3.421903, 0.3569688, 0, 0, 0, 1, 1,
-1.14573, 1.242434, -0.4475643, 0, 0, 0, 1, 1,
-1.145474, 0.5378073, 0.4617577, 0, 0, 0, 1, 1,
-1.142946, -0.1789351, -2.806665, 0, 0, 0, 1, 1,
-1.129933, -0.2837994, -3.617531, 1, 1, 1, 1, 1,
-1.12068, -0.7077434, -0.9165064, 1, 1, 1, 1, 1,
-1.118721, -1.654046, -4.417786, 1, 1, 1, 1, 1,
-1.11603, -0.9084259, -1.997831, 1, 1, 1, 1, 1,
-1.115132, 1.844391, -1.111159, 1, 1, 1, 1, 1,
-1.096619, -0.875296, -2.824941, 1, 1, 1, 1, 1,
-1.091004, -2.227095, -3.451935, 1, 1, 1, 1, 1,
-1.090705, 0.5245118, -1.707989, 1, 1, 1, 1, 1,
-1.089583, -2.980924, -1.519049, 1, 1, 1, 1, 1,
-1.089155, -0.1102462, -1.444029, 1, 1, 1, 1, 1,
-1.085, 0.6810335, -1.296654, 1, 1, 1, 1, 1,
-1.084063, 0.7753695, 0.6271453, 1, 1, 1, 1, 1,
-1.074518, 0.9116425, 0.07989135, 1, 1, 1, 1, 1,
-1.07059, -0.4360991, -1.962681, 1, 1, 1, 1, 1,
-1.069388, -0.06881529, -2.877952, 1, 1, 1, 1, 1,
-1.068492, 0.984892, -1.340033, 0, 0, 1, 1, 1,
-1.062161, 0.1063401, -0.3558232, 1, 0, 0, 1, 1,
-1.059363, 1.028408, -0.3802353, 1, 0, 0, 1, 1,
-1.055994, -0.1187341, 1.297594, 1, 0, 0, 1, 1,
-1.047927, -0.1033416, -2.335437, 1, 0, 0, 1, 1,
-1.047871, -0.9756726, -1.801051, 1, 0, 0, 1, 1,
-1.047853, -1.508965, -3.24056, 0, 0, 0, 1, 1,
-1.031802, -0.192679, -1.404679, 0, 0, 0, 1, 1,
-1.030633, 0.4478087, -0.8821543, 0, 0, 0, 1, 1,
-1.027608, -0.4995602, -0.336193, 0, 0, 0, 1, 1,
-1.027604, 0.4477299, -1.726371, 0, 0, 0, 1, 1,
-1.015472, -0.4428408, -2.945198, 0, 0, 0, 1, 1,
-1.01397, 3.540983, -1.790504, 0, 0, 0, 1, 1,
-1.012318, 0.5072597, -2.428164, 1, 1, 1, 1, 1,
-1.009333, 0.7930941, -1.014826, 1, 1, 1, 1, 1,
-1.009332, 0.4876755, -1.125005, 1, 1, 1, 1, 1,
-1.009024, -0.5666646, -4.118359, 1, 1, 1, 1, 1,
-1.008159, 0.06154912, -1.388057, 1, 1, 1, 1, 1,
-1.007574, 0.1810366, -0.8256148, 1, 1, 1, 1, 1,
-1.006868, -0.5442032, -3.062306, 1, 1, 1, 1, 1,
-1.004886, -1.338203, -3.792511, 1, 1, 1, 1, 1,
-1.003328, -0.04968282, -1.614366, 1, 1, 1, 1, 1,
-0.996031, 1.943857, -0.9606654, 1, 1, 1, 1, 1,
-0.9937083, 0.5374178, -0.1088602, 1, 1, 1, 1, 1,
-0.992004, 0.1958912, -2.028095, 1, 1, 1, 1, 1,
-0.9849027, 0.1273401, -0.9777325, 1, 1, 1, 1, 1,
-0.9817678, 0.2978633, -0.3534936, 1, 1, 1, 1, 1,
-0.9780193, 0.192291, 0.09131786, 1, 1, 1, 1, 1,
-0.974674, -0.7807398, -2.839527, 0, 0, 1, 1, 1,
-0.9731702, 1.030374, -1.300806, 1, 0, 0, 1, 1,
-0.9710711, -0.4376806, -0.8436658, 1, 0, 0, 1, 1,
-0.9668878, 0.2819242, -1.508575, 1, 0, 0, 1, 1,
-0.963095, -0.06202709, -1.358816, 1, 0, 0, 1, 1,
-0.9620911, 0.6878998, -2.620154, 1, 0, 0, 1, 1,
-0.9546469, -0.1161962, 0.345852, 0, 0, 0, 1, 1,
-0.9450527, 0.9218349, -3.380151, 0, 0, 0, 1, 1,
-0.9434512, 0.4272225, -1.243622, 0, 0, 0, 1, 1,
-0.9401561, -0.1739117, 1.674142, 0, 0, 0, 1, 1,
-0.9383992, -0.1151716, -3.023221, 0, 0, 0, 1, 1,
-0.9373513, -1.208862, -2.909103, 0, 0, 0, 1, 1,
-0.930325, 0.6698416, -0.3065626, 0, 0, 0, 1, 1,
-0.9281484, -0.1743368, -1.947326, 1, 1, 1, 1, 1,
-0.9224806, 0.1157016, -0.8919072, 1, 1, 1, 1, 1,
-0.9045463, 0.8449698, -0.08804237, 1, 1, 1, 1, 1,
-0.9030406, -1.300908, -0.4513729, 1, 1, 1, 1, 1,
-0.8986472, -0.883531, -4.350827, 1, 1, 1, 1, 1,
-0.8982069, -0.8273416, -1.662789, 1, 1, 1, 1, 1,
-0.8977786, 0.1597913, 0.4087755, 1, 1, 1, 1, 1,
-0.8971801, 0.2614703, -1.955394, 1, 1, 1, 1, 1,
-0.893582, 1.463349, -0.8655847, 1, 1, 1, 1, 1,
-0.8922378, -0.4208974, -1.124372, 1, 1, 1, 1, 1,
-0.8893101, 0.5370635, -1.120007, 1, 1, 1, 1, 1,
-0.8762205, -0.6562679, -3.40901, 1, 1, 1, 1, 1,
-0.8754667, -2.116832, -2.618072, 1, 1, 1, 1, 1,
-0.8681628, 0.3923852, -1.831615, 1, 1, 1, 1, 1,
-0.8667028, -1.732043, -2.823932, 1, 1, 1, 1, 1,
-0.8651487, -1.574971, -0.9794319, 0, 0, 1, 1, 1,
-0.8646194, -0.5579398, -0.4728116, 1, 0, 0, 1, 1,
-0.8505117, 0.149314, -0.984896, 1, 0, 0, 1, 1,
-0.8503726, -0.7371079, -2.574755, 1, 0, 0, 1, 1,
-0.8478495, 0.612138, 1.137046, 1, 0, 0, 1, 1,
-0.8381345, 1.130394, 0.1015253, 1, 0, 0, 1, 1,
-0.8381256, 0.1318744, 0.1375784, 0, 0, 0, 1, 1,
-0.8378813, -0.7507508, -3.824161, 0, 0, 0, 1, 1,
-0.8364248, 1.123052, 0.1467363, 0, 0, 0, 1, 1,
-0.835744, -0.6635528, -0.7523596, 0, 0, 0, 1, 1,
-0.8279501, 1.473353, -0.5241359, 0, 0, 0, 1, 1,
-0.8276647, 0.5603877, -1.587865, 0, 0, 0, 1, 1,
-0.827185, -1.574656, -2.220697, 0, 0, 0, 1, 1,
-0.8106993, 0.5517038, -1.198948, 1, 1, 1, 1, 1,
-0.8081725, 1.317211, 0.2899124, 1, 1, 1, 1, 1,
-0.79952, 1.295952, 0.04498544, 1, 1, 1, 1, 1,
-0.7979673, 0.9552556, -2.116229, 1, 1, 1, 1, 1,
-0.7963841, -1.477131, -4.039037, 1, 1, 1, 1, 1,
-0.7920212, -0.5616748, -2.604547, 1, 1, 1, 1, 1,
-0.7887095, -0.2155239, -1.314346, 1, 1, 1, 1, 1,
-0.7839949, -0.7194601, -2.880032, 1, 1, 1, 1, 1,
-0.7826016, 0.3741556, -1.879943, 1, 1, 1, 1, 1,
-0.7777961, -0.3835382, -2.292969, 1, 1, 1, 1, 1,
-0.7729718, -0.803302, -1.521535, 1, 1, 1, 1, 1,
-0.7671254, -0.6344702, -2.975991, 1, 1, 1, 1, 1,
-0.7561169, -0.2863145, -2.344199, 1, 1, 1, 1, 1,
-0.753214, -0.03763616, -1.832373, 1, 1, 1, 1, 1,
-0.7443314, 0.551505, -1.329909, 1, 1, 1, 1, 1,
-0.7393512, -0.07221029, -0.3280068, 0, 0, 1, 1, 1,
-0.7326928, -0.1723507, -2.529347, 1, 0, 0, 1, 1,
-0.727145, -2.054952, -3.874736, 1, 0, 0, 1, 1,
-0.7238449, 0.6271359, -3.308912, 1, 0, 0, 1, 1,
-0.7163653, 1.917659, 0.386057, 1, 0, 0, 1, 1,
-0.7156501, 0.6450285, 0.1172612, 1, 0, 0, 1, 1,
-0.7108861, -0.234132, -0.4535944, 0, 0, 0, 1, 1,
-0.7062225, 0.4254854, -1.102554, 0, 0, 0, 1, 1,
-0.7040325, -1.136309, -1.979874, 0, 0, 0, 1, 1,
-0.6967574, -1.31454, -0.255967, 0, 0, 0, 1, 1,
-0.6924071, 0.3406929, -0.6944429, 0, 0, 0, 1, 1,
-0.6912323, 0.1969948, -0.19259, 0, 0, 0, 1, 1,
-0.6874242, 0.581005, -1.489129, 0, 0, 0, 1, 1,
-0.6789748, 1.681435, -0.03569365, 1, 1, 1, 1, 1,
-0.6746066, 0.06734922, -2.364404, 1, 1, 1, 1, 1,
-0.6730718, -1.031644, -1.968125, 1, 1, 1, 1, 1,
-0.672326, 1.364493, 1.538198, 1, 1, 1, 1, 1,
-0.667573, -1.138785, -2.219089, 1, 1, 1, 1, 1,
-0.662332, -0.2944654, -2.462855, 1, 1, 1, 1, 1,
-0.6592937, -0.3499372, -2.863559, 1, 1, 1, 1, 1,
-0.652869, -0.6027561, -3.045758, 1, 1, 1, 1, 1,
-0.6526071, 0.7483136, 1.21211, 1, 1, 1, 1, 1,
-0.6502768, 1.529914, -0.259561, 1, 1, 1, 1, 1,
-0.6499947, 0.3107436, -2.124102, 1, 1, 1, 1, 1,
-0.6493325, -0.2218238, -3.70007, 1, 1, 1, 1, 1,
-0.6461592, -1.569796, -3.198478, 1, 1, 1, 1, 1,
-0.6413433, -0.7892334, -0.582853, 1, 1, 1, 1, 1,
-0.6251683, -1.122707, -2.411624, 1, 1, 1, 1, 1,
-0.6161972, 0.007981069, -2.310105, 0, 0, 1, 1, 1,
-0.6161307, 1.027052, -2.705813, 1, 0, 0, 1, 1,
-0.6141925, -0.6948869, -2.064643, 1, 0, 0, 1, 1,
-0.6135556, -1.878493, -5.111433, 1, 0, 0, 1, 1,
-0.6101441, -0.3879322, -2.100837, 1, 0, 0, 1, 1,
-0.6082938, -1.482595, -1.112444, 1, 0, 0, 1, 1,
-0.6062984, -0.2578288, -1.823548, 0, 0, 0, 1, 1,
-0.603743, -1.235756, -3.336194, 0, 0, 0, 1, 1,
-0.5982365, -1.04805, -3.536019, 0, 0, 0, 1, 1,
-0.5972594, 0.3475459, -0.3064975, 0, 0, 0, 1, 1,
-0.595167, 0.2993, -0.4420167, 0, 0, 0, 1, 1,
-0.5944278, 0.6593083, -2.622197, 0, 0, 0, 1, 1,
-0.5935268, 0.2015298, -0.8714879, 0, 0, 0, 1, 1,
-0.5929435, -1.770056, -1.9797, 1, 1, 1, 1, 1,
-0.5916513, 1.016483, 1.039126, 1, 1, 1, 1, 1,
-0.5844718, -0.3222397, -2.489399, 1, 1, 1, 1, 1,
-0.574144, -1.578525, -2.187262, 1, 1, 1, 1, 1,
-0.5741367, -1.448201, -2.756626, 1, 1, 1, 1, 1,
-0.5738596, -1.008886, -3.678608, 1, 1, 1, 1, 1,
-0.573055, -0.564414, -1.975549, 1, 1, 1, 1, 1,
-0.5703448, 0.05952702, -2.381669, 1, 1, 1, 1, 1,
-0.5700862, -0.7328479, -1.142873, 1, 1, 1, 1, 1,
-0.5686306, -0.7663773, -2.762092, 1, 1, 1, 1, 1,
-0.5660914, 0.9966033, -1.996773, 1, 1, 1, 1, 1,
-0.5610005, 0.7178155, -0.2764544, 1, 1, 1, 1, 1,
-0.5579597, -1.257533, -3.369084, 1, 1, 1, 1, 1,
-0.5553408, -0.5471504, -0.6031307, 1, 1, 1, 1, 1,
-0.5539894, -0.2870969, -1.203839, 1, 1, 1, 1, 1,
-0.5534807, 2.299159, 2.073434, 0, 0, 1, 1, 1,
-0.5526294, 2.025771, -1.016659, 1, 0, 0, 1, 1,
-0.5425122, -1.802723, -2.455237, 1, 0, 0, 1, 1,
-0.5409681, -1.522054, -2.116411, 1, 0, 0, 1, 1,
-0.540804, 0.6142844, -0.532014, 1, 0, 0, 1, 1,
-0.5398906, 0.9503465, -1.058472, 1, 0, 0, 1, 1,
-0.5340014, -1.119597, -1.983049, 0, 0, 0, 1, 1,
-0.5314935, 0.1261444, -2.086133, 0, 0, 0, 1, 1,
-0.5306316, -0.5490253, -2.490058, 0, 0, 0, 1, 1,
-0.5304992, -0.09329065, -2.059048, 0, 0, 0, 1, 1,
-0.5296016, 0.7821184, -2.432892, 0, 0, 0, 1, 1,
-0.5292856, 0.3904774, -0.8379924, 0, 0, 0, 1, 1,
-0.5286376, -0.3658054, -3.47202, 0, 0, 0, 1, 1,
-0.5262064, -1.316371, -2.062406, 1, 1, 1, 1, 1,
-0.5261636, -0.3901406, -1.512844, 1, 1, 1, 1, 1,
-0.525994, -0.8657864, -3.623498, 1, 1, 1, 1, 1,
-0.5245885, -0.2741307, -2.207405, 1, 1, 1, 1, 1,
-0.523858, 1.034218, 0.8351094, 1, 1, 1, 1, 1,
-0.5184616, 0.3918183, 0.8360766, 1, 1, 1, 1, 1,
-0.5115372, -0.3911726, -1.944965, 1, 1, 1, 1, 1,
-0.5094413, 0.7949826, -0.9455531, 1, 1, 1, 1, 1,
-0.5045173, 1.270499, -1.685164, 1, 1, 1, 1, 1,
-0.5013968, 0.3621111, -0.1817468, 1, 1, 1, 1, 1,
-0.4994121, -0.8166818, -2.79314, 1, 1, 1, 1, 1,
-0.4961429, 0.0799962, -0.8949249, 1, 1, 1, 1, 1,
-0.4923816, 0.1166701, -1.156545, 1, 1, 1, 1, 1,
-0.4889928, -0.708359, -3.780874, 1, 1, 1, 1, 1,
-0.4889809, -0.5845625, -1.909287, 1, 1, 1, 1, 1,
-0.4852113, -0.8810502, -2.914916, 0, 0, 1, 1, 1,
-0.4840421, -0.8307909, -4.068351, 1, 0, 0, 1, 1,
-0.4808901, -0.1956722, -2.087908, 1, 0, 0, 1, 1,
-0.4739987, -0.2339765, -0.476912, 1, 0, 0, 1, 1,
-0.4703997, -0.672253, -3.394682, 1, 0, 0, 1, 1,
-0.4574042, -0.1701252, 0.3368282, 1, 0, 0, 1, 1,
-0.456654, 2.089273, -0.09699945, 0, 0, 0, 1, 1,
-0.4528175, 0.6844072, -1.076436, 0, 0, 0, 1, 1,
-0.4526317, -0.005095631, 0.1595569, 0, 0, 0, 1, 1,
-0.44938, 0.5765733, -0.6914195, 0, 0, 0, 1, 1,
-0.4479389, 0.4285386, -1.416381, 0, 0, 0, 1, 1,
-0.4477678, -0.3641174, -0.4527773, 0, 0, 0, 1, 1,
-0.4446978, 0.7641353, -1.085104, 0, 0, 0, 1, 1,
-0.4445678, 0.2957899, -1.474337, 1, 1, 1, 1, 1,
-0.4443717, 0.1150069, -1.909063, 1, 1, 1, 1, 1,
-0.4402844, 0.395142, -0.5203452, 1, 1, 1, 1, 1,
-0.4379248, -0.9260494, -2.698524, 1, 1, 1, 1, 1,
-0.4371392, 0.2493039, -1.57283, 1, 1, 1, 1, 1,
-0.4369129, -0.5610062, -3.917135, 1, 1, 1, 1, 1,
-0.4366154, 1.299318, 0.01127068, 1, 1, 1, 1, 1,
-0.4364924, 1.322396, -0.9853682, 1, 1, 1, 1, 1,
-0.4360953, -1.087516, -3.612683, 1, 1, 1, 1, 1,
-0.4356217, 0.47765, 0.5821701, 1, 1, 1, 1, 1,
-0.4315593, -1.472189, -1.95555, 1, 1, 1, 1, 1,
-0.4279363, 1.025729, -2.456238, 1, 1, 1, 1, 1,
-0.424975, 0.08111046, -1.321453, 1, 1, 1, 1, 1,
-0.4225116, 1.238927, -0.02412099, 1, 1, 1, 1, 1,
-0.4165729, -1.690834, -2.800855, 1, 1, 1, 1, 1,
-0.4154306, 1.837409, -1.208124, 0, 0, 1, 1, 1,
-0.4150932, -1.311475, -1.786538, 1, 0, 0, 1, 1,
-0.4138477, -1.301451, -3.280154, 1, 0, 0, 1, 1,
-0.4010815, -0.6880833, -4.536115, 1, 0, 0, 1, 1,
-0.4003799, -0.9411551, -2.645428, 1, 0, 0, 1, 1,
-0.3881393, 0.720684, -0.3403841, 1, 0, 0, 1, 1,
-0.3854864, -0.2755416, -0.4146299, 0, 0, 0, 1, 1,
-0.3845688, 1.217146, -1.887257, 0, 0, 0, 1, 1,
-0.3790082, 0.6141443, -0.3915944, 0, 0, 0, 1, 1,
-0.3721384, -0.7664902, -4.880369, 0, 0, 0, 1, 1,
-0.3687546, -1.438421, -3.241626, 0, 0, 0, 1, 1,
-0.3671353, -0.3763778, -3.864949, 0, 0, 0, 1, 1,
-0.3601655, -0.3381217, -1.176139, 0, 0, 0, 1, 1,
-0.3580111, -0.8391582, -2.917519, 1, 1, 1, 1, 1,
-0.3487771, 0.5812011, -0.2863669, 1, 1, 1, 1, 1,
-0.3432251, 1.970182, -0.7359248, 1, 1, 1, 1, 1,
-0.329423, 0.182141, -1.719232, 1, 1, 1, 1, 1,
-0.3237714, -0.5747769, -1.288429, 1, 1, 1, 1, 1,
-0.3199856, -1.051035, -2.336671, 1, 1, 1, 1, 1,
-0.3198913, 0.2156225, -0.3169987, 1, 1, 1, 1, 1,
-0.3189406, -1.031, -1.338214, 1, 1, 1, 1, 1,
-0.3174513, 2.215699, -1.521574, 1, 1, 1, 1, 1,
-0.3155863, 1.506966, -0.1774758, 1, 1, 1, 1, 1,
-0.3145312, 1.091648, -1.229536, 1, 1, 1, 1, 1,
-0.3143232, 0.1926231, -0.2577196, 1, 1, 1, 1, 1,
-0.3138613, -1.252677, -3.316962, 1, 1, 1, 1, 1,
-0.3126569, -0.007079071, -1.157853, 1, 1, 1, 1, 1,
-0.3094416, -0.2982401, -2.724191, 1, 1, 1, 1, 1,
-0.3020416, 0.215399, -0.6009708, 0, 0, 1, 1, 1,
-0.2998466, 1.307701, 0.03546315, 1, 0, 0, 1, 1,
-0.2979601, 0.4557256, 1.189829, 1, 0, 0, 1, 1,
-0.2945233, 0.4241851, -1.246423, 1, 0, 0, 1, 1,
-0.2915341, -0.5665926, -3.858533, 1, 0, 0, 1, 1,
-0.2867887, -0.5114607, -3.019376, 1, 0, 0, 1, 1,
-0.2727346, 2.115682, -0.615266, 0, 0, 0, 1, 1,
-0.272021, -1.118025, -2.94698, 0, 0, 0, 1, 1,
-0.2700339, 0.3593195, -1.438843, 0, 0, 0, 1, 1,
-0.2691635, 0.5854688, 0.5357078, 0, 0, 0, 1, 1,
-0.2678207, -0.7846267, -2.864824, 0, 0, 0, 1, 1,
-0.2652991, 0.2620577, 0.7874938, 0, 0, 0, 1, 1,
-0.2565846, 0.9939764, -0.8724992, 0, 0, 0, 1, 1,
-0.2517715, 0.9289737, -0.7735479, 1, 1, 1, 1, 1,
-0.2501056, 1.278642, 0.5347376, 1, 1, 1, 1, 1,
-0.2476673, 0.2615668, -0.01198544, 1, 1, 1, 1, 1,
-0.2476562, -1.395717, -1.953721, 1, 1, 1, 1, 1,
-0.2417816, 1.924315, -1.124218, 1, 1, 1, 1, 1,
-0.2411847, -0.3317709, -3.288544, 1, 1, 1, 1, 1,
-0.240363, -1.010044, -1.651351, 1, 1, 1, 1, 1,
-0.2374399, -0.2312481, -0.08137567, 1, 1, 1, 1, 1,
-0.2362636, 2.431817, -1.71382, 1, 1, 1, 1, 1,
-0.2361667, 0.09784444, -2.500362, 1, 1, 1, 1, 1,
-0.2349395, 0.1690312, 0.574021, 1, 1, 1, 1, 1,
-0.226997, -1.040622, -4.233173, 1, 1, 1, 1, 1,
-0.2263468, 0.6004416, -1.943002, 1, 1, 1, 1, 1,
-0.2238516, -0.03182311, -2.419228, 1, 1, 1, 1, 1,
-0.2197012, 0.6893626, -0.03061163, 1, 1, 1, 1, 1,
-0.2193615, -1.221669, -1.971018, 0, 0, 1, 1, 1,
-0.2153765, -1.043015, -2.521364, 1, 0, 0, 1, 1,
-0.2143835, 0.7850483, -0.1573055, 1, 0, 0, 1, 1,
-0.2132152, 1.118619, -1.939753, 1, 0, 0, 1, 1,
-0.2064164, 0.6021351, 0.1933127, 1, 0, 0, 1, 1,
-0.2035219, -0.4057161, -2.187354, 1, 0, 0, 1, 1,
-0.1994463, 0.6898029, 0.09948901, 0, 0, 0, 1, 1,
-0.1976848, -1.250109, -3.222145, 0, 0, 0, 1, 1,
-0.1962748, -0.4204208, -3.352511, 0, 0, 0, 1, 1,
-0.1943697, 0.3225111, -0.1001109, 0, 0, 0, 1, 1,
-0.193598, -0.1998409, -3.453974, 0, 0, 0, 1, 1,
-0.1934484, 0.3833258, 1.807846, 0, 0, 0, 1, 1,
-0.19017, 0.2980877, -0.8282918, 0, 0, 0, 1, 1,
-0.1856924, -0.4795404, -3.502451, 1, 1, 1, 1, 1,
-0.1855403, -0.3607172, -2.042477, 1, 1, 1, 1, 1,
-0.1806151, -0.1815223, -1.623908, 1, 1, 1, 1, 1,
-0.1804688, -0.5627798, -1.190249, 1, 1, 1, 1, 1,
-0.1774008, 1.175401, 0.07320162, 1, 1, 1, 1, 1,
-0.1741536, -0.2355751, -2.066692, 1, 1, 1, 1, 1,
-0.1720067, 0.07838719, -1.788147, 1, 1, 1, 1, 1,
-0.1687648, -1.947788, -2.222535, 1, 1, 1, 1, 1,
-0.1673426, 0.5130353, -0.9235589, 1, 1, 1, 1, 1,
-0.1630276, -0.08126017, -2.149428, 1, 1, 1, 1, 1,
-0.1594341, -1.799878, -2.657172, 1, 1, 1, 1, 1,
-0.1567463, -0.390381, -3.392632, 1, 1, 1, 1, 1,
-0.1554079, 1.317149, -2.190843, 1, 1, 1, 1, 1,
-0.1546502, 1.867245, 0.2563568, 1, 1, 1, 1, 1,
-0.1522269, -0.1672196, -2.794174, 1, 1, 1, 1, 1,
-0.1506997, -1.696602, -4.320232, 0, 0, 1, 1, 1,
-0.1496706, 1.162026, 0.6595135, 1, 0, 0, 1, 1,
-0.1460786, -0.4139117, -1.820425, 1, 0, 0, 1, 1,
-0.1425694, 1.904385, -0.1125039, 1, 0, 0, 1, 1,
-0.1418003, -0.6233824, -1.725276, 1, 0, 0, 1, 1,
-0.1406704, -0.3698824, -3.931564, 1, 0, 0, 1, 1,
-0.1368753, 0.9058092, -0.9592415, 0, 0, 0, 1, 1,
-0.1362235, -1.310585, -2.591642, 0, 0, 0, 1, 1,
-0.1342188, -1.245045, -2.705134, 0, 0, 0, 1, 1,
-0.1339519, -1.054763, -3.020665, 0, 0, 0, 1, 1,
-0.1283023, 0.09032171, -0.4475487, 0, 0, 0, 1, 1,
-0.1277022, -1.594011, -2.654593, 0, 0, 0, 1, 1,
-0.1207852, 0.243406, -1.412086, 0, 0, 0, 1, 1,
-0.1179821, 0.3289983, -1.406043, 1, 1, 1, 1, 1,
-0.1145127, -0.8211277, -1.138798, 1, 1, 1, 1, 1,
-0.1122978, -0.4423301, -3.065544, 1, 1, 1, 1, 1,
-0.1077624, -1.792404, -2.97431, 1, 1, 1, 1, 1,
-0.1070401, 0.6924865, -0.7919266, 1, 1, 1, 1, 1,
-0.1035672, 0.8163092, -0.4320241, 1, 1, 1, 1, 1,
-0.102931, -0.04439772, -3.219157, 1, 1, 1, 1, 1,
-0.1026358, -1.835853, -4.240112, 1, 1, 1, 1, 1,
-0.1024544, -0.8440439, -4.127341, 1, 1, 1, 1, 1,
-0.09927708, -0.8897662, -2.135867, 1, 1, 1, 1, 1,
-0.09859994, -0.8091718, -2.802515, 1, 1, 1, 1, 1,
-0.09857772, -0.2164775, -1.239106, 1, 1, 1, 1, 1,
-0.09679149, 0.01930891, 0.007330883, 1, 1, 1, 1, 1,
-0.09126901, 0.590082, -2.357907, 1, 1, 1, 1, 1,
-0.08860782, 1.257636, -0.723199, 1, 1, 1, 1, 1,
-0.08166061, 0.1688959, -0.4789132, 0, 0, 1, 1, 1,
-0.08162288, 0.3597574, -0.9853218, 1, 0, 0, 1, 1,
-0.07537329, -0.3641828, -1.992818, 1, 0, 0, 1, 1,
-0.06808916, 1.650608, -0.866325, 1, 0, 0, 1, 1,
-0.06769022, 0.3488406, 0.9385083, 1, 0, 0, 1, 1,
-0.06757819, 1.387132, -1.44526, 1, 0, 0, 1, 1,
-0.06753521, 0.07995658, -0.5025155, 0, 0, 0, 1, 1,
-0.06675325, 1.497334, 0.8560907, 0, 0, 0, 1, 1,
-0.06643938, 1.930977, -0.1120509, 0, 0, 0, 1, 1,
-0.06464265, 0.09191968, -1.034083, 0, 0, 0, 1, 1,
-0.06319371, -0.09295112, -2.341681, 0, 0, 0, 1, 1,
-0.06315213, 0.3068397, -0.008108882, 0, 0, 0, 1, 1,
-0.06073829, -0.6115823, -2.771583, 0, 0, 0, 1, 1,
-0.05081358, 0.2986385, -0.8545978, 1, 1, 1, 1, 1,
-0.04969981, 0.8932284, 0.4551699, 1, 1, 1, 1, 1,
-0.04823965, -0.5227386, -4.09656, 1, 1, 1, 1, 1,
-0.048012, -1.859993, -3.869617, 1, 1, 1, 1, 1,
-0.04612414, 0.5771727, -0.07449829, 1, 1, 1, 1, 1,
-0.04435023, -0.8592775, -3.927115, 1, 1, 1, 1, 1,
-0.04237662, 0.1134415, -0.05227301, 1, 1, 1, 1, 1,
-0.04101462, 0.2949322, -0.4149512, 1, 1, 1, 1, 1,
-0.02441005, 0.5038911, 1.074667, 1, 1, 1, 1, 1,
-0.02324135, 0.1070775, 0.2569536, 1, 1, 1, 1, 1,
-0.01954063, 0.4427245, 1.019291, 1, 1, 1, 1, 1,
-0.0111099, -1.274684, -3.576619, 1, 1, 1, 1, 1,
-0.008704748, 0.9691756, -0.01194653, 1, 1, 1, 1, 1,
-0.00851257, -0.8908776, -2.628065, 1, 1, 1, 1, 1,
0.0006577174, -0.7257874, 3.219134, 1, 1, 1, 1, 1,
0.002030678, 1.530032, -0.7160898, 0, 0, 1, 1, 1,
0.007506243, 0.2443889, 0.3332289, 1, 0, 0, 1, 1,
0.008599903, 0.1657236, 0.03215398, 1, 0, 0, 1, 1,
0.009121228, 0.2206529, 0.03540066, 1, 0, 0, 1, 1,
0.009235797, 0.04869112, 1.060163, 1, 0, 0, 1, 1,
0.01180652, -0.02321091, 2.31911, 1, 0, 0, 1, 1,
0.01218897, -0.1128986, 2.778161, 0, 0, 0, 1, 1,
0.01529787, 0.4237964, -1.25742, 0, 0, 0, 1, 1,
0.01706599, 1.486914, -0.555339, 0, 0, 0, 1, 1,
0.01884603, -1.627751, 2.187624, 0, 0, 0, 1, 1,
0.01951137, -0.2277641, 2.37989, 0, 0, 0, 1, 1,
0.02027831, -1.056155, 3.572761, 0, 0, 0, 1, 1,
0.0204909, 0.3020419, 1.202532, 0, 0, 0, 1, 1,
0.02066509, 0.7763368, -1.128575, 1, 1, 1, 1, 1,
0.02292368, 1.597049, -1.162116, 1, 1, 1, 1, 1,
0.02376658, 0.6585982, 0.2775272, 1, 1, 1, 1, 1,
0.03055625, -1.502402, 1.980191, 1, 1, 1, 1, 1,
0.03184818, -0.48108, 2.869097, 1, 1, 1, 1, 1,
0.03209738, -0.7643641, 3.0024, 1, 1, 1, 1, 1,
0.033386, 0.3331338, 0.7486365, 1, 1, 1, 1, 1,
0.0372435, 0.3673643, 2.442592, 1, 1, 1, 1, 1,
0.0377481, -0.2377553, 0.9690066, 1, 1, 1, 1, 1,
0.03789913, 0.4028192, -1.617095, 1, 1, 1, 1, 1,
0.0392094, -0.1152452, 2.373625, 1, 1, 1, 1, 1,
0.04021509, 0.1177574, 1.190274, 1, 1, 1, 1, 1,
0.04220285, -0.4672176, 3.22778, 1, 1, 1, 1, 1,
0.04390294, 0.455542, -0.04126927, 1, 1, 1, 1, 1,
0.04540195, -1.055433, 2.793042, 1, 1, 1, 1, 1,
0.04676448, -0.05328992, 2.229001, 0, 0, 1, 1, 1,
0.05075042, 0.6102186, -0.2481984, 1, 0, 0, 1, 1,
0.05087879, 0.3958492, 0.3542207, 1, 0, 0, 1, 1,
0.05632776, 0.2288276, 1.145961, 1, 0, 0, 1, 1,
0.05901917, -0.5939413, 4.067365, 1, 0, 0, 1, 1,
0.06091401, 0.1562381, 0.5962524, 1, 0, 0, 1, 1,
0.06131737, 0.990123, 1.038276, 0, 0, 0, 1, 1,
0.06355587, -0.3758849, 2.887468, 0, 0, 0, 1, 1,
0.063657, 0.08601636, -1.646281, 0, 0, 0, 1, 1,
0.06421844, 0.9911366, 0.07314258, 0, 0, 0, 1, 1,
0.06495892, 1.165076, 0.1859133, 0, 0, 0, 1, 1,
0.06615788, 2.308246, -0.2317871, 0, 0, 0, 1, 1,
0.06844337, 1.33351, -0.5991765, 0, 0, 0, 1, 1,
0.06922538, -1.07424, 4.076735, 1, 1, 1, 1, 1,
0.07339314, -0.6053504, 3.610595, 1, 1, 1, 1, 1,
0.07675877, -0.6278647, 3.561955, 1, 1, 1, 1, 1,
0.07745537, -1.52909, 3.105586, 1, 1, 1, 1, 1,
0.08226281, 0.4443586, -0.07241422, 1, 1, 1, 1, 1,
0.08381265, 1.575283, 1.710959, 1, 1, 1, 1, 1,
0.09030669, 0.3917664, 0.5982576, 1, 1, 1, 1, 1,
0.09319165, 0.4549133, 0.6324407, 1, 1, 1, 1, 1,
0.09432613, 0.3682305, 0.1045102, 1, 1, 1, 1, 1,
0.09679607, -0.4083856, 3.614395, 1, 1, 1, 1, 1,
0.1009998, -1.045499, 3.582826, 1, 1, 1, 1, 1,
0.1021691, 1.498489, -1.212277, 1, 1, 1, 1, 1,
0.1042072, -0.1600814, 4.572017, 1, 1, 1, 1, 1,
0.1056729, 0.8456841, 0.7562473, 1, 1, 1, 1, 1,
0.1067994, -0.9447631, 3.66789, 1, 1, 1, 1, 1,
0.1132275, -0.5748142, 3.524599, 0, 0, 1, 1, 1,
0.1137627, -0.2254525, 2.810379, 1, 0, 0, 1, 1,
0.1146386, -0.0836391, 2.35673, 1, 0, 0, 1, 1,
0.1146933, 1.052904, 0.1091068, 1, 0, 0, 1, 1,
0.1191455, -0.4502694, 2.848509, 1, 0, 0, 1, 1,
0.1254893, 0.0576814, 0.8395533, 1, 0, 0, 1, 1,
0.1258529, 0.09550089, 1.337519, 0, 0, 0, 1, 1,
0.1276183, -1.374407, 3.268157, 0, 0, 0, 1, 1,
0.1314114, -0.5345743, 3.046719, 0, 0, 0, 1, 1,
0.1318463, 0.9423366, 0.03407744, 0, 0, 0, 1, 1,
0.1326506, 0.2673509, 0.1416879, 0, 0, 0, 1, 1,
0.1376369, 0.6710748, -0.7220463, 0, 0, 0, 1, 1,
0.137761, -1.442729, 4.61941, 0, 0, 0, 1, 1,
0.140503, 0.3095381, 2.368963, 1, 1, 1, 1, 1,
0.1416304, -1.540105, 2.049097, 1, 1, 1, 1, 1,
0.1461106, -1.265845, 5.014998, 1, 1, 1, 1, 1,
0.1480047, -2.974981, 3.377072, 1, 1, 1, 1, 1,
0.1482885, 0.08103079, 2.871083, 1, 1, 1, 1, 1,
0.1555582, -0.3434689, 3.263998, 1, 1, 1, 1, 1,
0.158119, 0.07043834, 1.649526, 1, 1, 1, 1, 1,
0.1588865, 2.214203, 0.04821361, 1, 1, 1, 1, 1,
0.163126, -0.04618281, -0.07791034, 1, 1, 1, 1, 1,
0.165695, -0.7730184, 1.911165, 1, 1, 1, 1, 1,
0.1667414, 1.25722, -0.5021807, 1, 1, 1, 1, 1,
0.1673156, 1.954767, -0.6382478, 1, 1, 1, 1, 1,
0.1695742, -0.1817715, 1.065929, 1, 1, 1, 1, 1,
0.1738513, 0.3738607, -0.3928844, 1, 1, 1, 1, 1,
0.1761228, 1.185596, 0.9735646, 1, 1, 1, 1, 1,
0.1776022, 0.1623366, 1.044893, 0, 0, 1, 1, 1,
0.1797429, -1.89924, 2.318645, 1, 0, 0, 1, 1,
0.1799139, 1.718104, 0.06109828, 1, 0, 0, 1, 1,
0.1813705, 0.1229583, -0.4295653, 1, 0, 0, 1, 1,
0.1839787, -1.582864, 2.909794, 1, 0, 0, 1, 1,
0.1876907, 0.5142942, 2.088286, 1, 0, 0, 1, 1,
0.1920198, 0.2952696, 1.112146, 0, 0, 0, 1, 1,
0.1948965, 1.432898, -0.3231924, 0, 0, 0, 1, 1,
0.1961059, 1.454132, 0.1366633, 0, 0, 0, 1, 1,
0.1967852, -0.7339079, 1.914482, 0, 0, 0, 1, 1,
0.1999321, 0.06313623, 0.5187531, 0, 0, 0, 1, 1,
0.2027201, -1.434128, 2.823402, 0, 0, 0, 1, 1,
0.2027694, 0.3105043, -0.1027243, 0, 0, 0, 1, 1,
0.2069687, 0.3723472, 0.5588515, 1, 1, 1, 1, 1,
0.2088852, 1.088047, 1.107281, 1, 1, 1, 1, 1,
0.2093852, -1.102233, 3.336063, 1, 1, 1, 1, 1,
0.2116567, 1.38802, -0.858946, 1, 1, 1, 1, 1,
0.2118331, 1.245276, -0.5405321, 1, 1, 1, 1, 1,
0.214004, -0.4854107, 2.795824, 1, 1, 1, 1, 1,
0.2140899, -0.6804563, 2.511745, 1, 1, 1, 1, 1,
0.2171532, 0.1661669, 1.440088, 1, 1, 1, 1, 1,
0.2185658, 0.8668213, -0.1080351, 1, 1, 1, 1, 1,
0.2200727, 0.6355507, -0.1811779, 1, 1, 1, 1, 1,
0.2205762, -0.7453764, 2.774051, 1, 1, 1, 1, 1,
0.2223356, -0.6668925, 2.660534, 1, 1, 1, 1, 1,
0.2236501, 0.4267649, 0.9505103, 1, 1, 1, 1, 1,
0.2249254, 0.1366633, 1.363431, 1, 1, 1, 1, 1,
0.2259362, 0.08267629, 3.457382, 1, 1, 1, 1, 1,
0.2296614, 1.171199, 1.130557, 0, 0, 1, 1, 1,
0.2307553, -0.6731954, 4.011813, 1, 0, 0, 1, 1,
0.230811, 0.7932457, -1.081983, 1, 0, 0, 1, 1,
0.233086, 0.6754155, 0.3919127, 1, 0, 0, 1, 1,
0.2363615, 0.6225057, 1.624359, 1, 0, 0, 1, 1,
0.2365676, 0.8852564, 1.556742, 1, 0, 0, 1, 1,
0.2375269, 0.6103902, 1.125733, 0, 0, 0, 1, 1,
0.2377948, -0.08714163, 3.092117, 0, 0, 0, 1, 1,
0.2399844, 0.612849, -2.291409, 0, 0, 0, 1, 1,
0.2403802, -0.3403517, 1.748451, 0, 0, 0, 1, 1,
0.2431281, -1.11861, 3.310647, 0, 0, 0, 1, 1,
0.2482425, -0.5331393, 1.890935, 0, 0, 0, 1, 1,
0.2536012, -1.436566, 1.821213, 0, 0, 0, 1, 1,
0.2536886, -0.08238216, 2.318314, 1, 1, 1, 1, 1,
0.2588261, -0.8660005, 1.806855, 1, 1, 1, 1, 1,
0.262833, -0.8364797, 2.69473, 1, 1, 1, 1, 1,
0.2631936, 1.644265, -1.113674, 1, 1, 1, 1, 1,
0.2638027, -0.407907, 1.962456, 1, 1, 1, 1, 1,
0.2649722, -0.1101969, 1.413275, 1, 1, 1, 1, 1,
0.2772, 0.4078821, -1.18223, 1, 1, 1, 1, 1,
0.2841297, -1.035117, 3.702696, 1, 1, 1, 1, 1,
0.2851162, -0.8218094, 2.647307, 1, 1, 1, 1, 1,
0.28783, -1.291452, 2.910264, 1, 1, 1, 1, 1,
0.2894291, 0.2383297, 1.538381, 1, 1, 1, 1, 1,
0.2908249, 1.766616, 1.015391, 1, 1, 1, 1, 1,
0.2959213, 0.3051145, 1.535407, 1, 1, 1, 1, 1,
0.2976641, -1.314887, 4.719121, 1, 1, 1, 1, 1,
0.311237, 2.297475, 1.328217, 1, 1, 1, 1, 1,
0.3144275, 0.3784081, 0.5833135, 0, 0, 1, 1, 1,
0.3153045, 1.377764, -0.357428, 1, 0, 0, 1, 1,
0.315395, -0.5579523, 3.304406, 1, 0, 0, 1, 1,
0.3171402, 1.047404, 0.1025786, 1, 0, 0, 1, 1,
0.3200701, 1.4416, 0.4748407, 1, 0, 0, 1, 1,
0.3209267, -0.246776, 0.1769846, 1, 0, 0, 1, 1,
0.321172, 1.152161, -0.1607593, 0, 0, 0, 1, 1,
0.3225187, 0.4808472, -0.4159221, 0, 0, 0, 1, 1,
0.3251154, 1.811594, 1.064912, 0, 0, 0, 1, 1,
0.3253572, 0.4201119, 1.130875, 0, 0, 0, 1, 1,
0.3278077, -1.040527, 3.622141, 0, 0, 0, 1, 1,
0.3287545, 0.391129, -0.5871577, 0, 0, 0, 1, 1,
0.3305457, 0.7102453, 1.025854, 0, 0, 0, 1, 1,
0.330844, -0.7876679, 1.435498, 1, 1, 1, 1, 1,
0.3316928, -1.201157, 2.277217, 1, 1, 1, 1, 1,
0.3317113, -0.5902787, 2.214955, 1, 1, 1, 1, 1,
0.3329577, 0.1172906, 1.945417, 1, 1, 1, 1, 1,
0.3329773, 0.1249707, -0.1094096, 1, 1, 1, 1, 1,
0.3352083, 0.3412597, -0.4280883, 1, 1, 1, 1, 1,
0.3372468, -2.318972, 3.826966, 1, 1, 1, 1, 1,
0.3385702, 0.2615621, 0.6979215, 1, 1, 1, 1, 1,
0.3401344, -1.296409, 2.893839, 1, 1, 1, 1, 1,
0.3434381, 1.569127, 0.9991508, 1, 1, 1, 1, 1,
0.346845, -0.6637176, 2.239211, 1, 1, 1, 1, 1,
0.3469009, -0.1638749, 0.03912726, 1, 1, 1, 1, 1,
0.3474186, -0.3106376, 2.167828, 1, 1, 1, 1, 1,
0.3519288, -0.8655499, 3.475893, 1, 1, 1, 1, 1,
0.3540921, 0.3885922, -0.06984288, 1, 1, 1, 1, 1,
0.3545031, -0.07417732, 0.9464465, 0, 0, 1, 1, 1,
0.35467, 1.059133, 0.8069316, 1, 0, 0, 1, 1,
0.3568847, 0.9706086, -0.8583538, 1, 0, 0, 1, 1,
0.3608739, 0.76226, 0.07682327, 1, 0, 0, 1, 1,
0.3613653, 1.045305, 0.4558831, 1, 0, 0, 1, 1,
0.3624823, 1.354687, 0.2058038, 1, 0, 0, 1, 1,
0.3630469, 2.1782, 0.1563385, 0, 0, 0, 1, 1,
0.3657093, -0.9616089, 2.273333, 0, 0, 0, 1, 1,
0.3684432, 0.5315316, -1.603833, 0, 0, 0, 1, 1,
0.3685647, -1.706516, 2.141935, 0, 0, 0, 1, 1,
0.3699353, -1.626819, 3.639434, 0, 0, 0, 1, 1,
0.3705067, -0.2316286, 1.891715, 0, 0, 0, 1, 1,
0.3707292, 0.4127968, 0.8344659, 0, 0, 0, 1, 1,
0.3746235, 0.02841041, 2.079245, 1, 1, 1, 1, 1,
0.3772181, 0.1515676, 0.431387, 1, 1, 1, 1, 1,
0.3800339, -1.914712, 2.901205, 1, 1, 1, 1, 1,
0.3826751, -2.179148, 5.522443, 1, 1, 1, 1, 1,
0.3854955, -0.0209086, 1.679515, 1, 1, 1, 1, 1,
0.3860089, 0.6673858, -0.6225875, 1, 1, 1, 1, 1,
0.3878631, 0.2478232, 0.8184425, 1, 1, 1, 1, 1,
0.3884688, -0.4164672, 1.498099, 1, 1, 1, 1, 1,
0.3927466, -0.191062, 2.11533, 1, 1, 1, 1, 1,
0.3929075, 1.069063, -0.4170768, 1, 1, 1, 1, 1,
0.3936292, -0.4610298, 3.344394, 1, 1, 1, 1, 1,
0.3941435, -0.05283219, 1.358047, 1, 1, 1, 1, 1,
0.3968711, 0.0316352, -0.1293635, 1, 1, 1, 1, 1,
0.4030547, -0.376107, 1.89674, 1, 1, 1, 1, 1,
0.4060276, 0.1497374, 0.5376041, 1, 1, 1, 1, 1,
0.4085847, -0.08467894, -0.7156299, 0, 0, 1, 1, 1,
0.4107282, 1.644207, 1.111402, 1, 0, 0, 1, 1,
0.4153981, -1.465725, 4.812984, 1, 0, 0, 1, 1,
0.4179386, -0.4508544, 2.691142, 1, 0, 0, 1, 1,
0.4184121, -0.5740849, 2.935052, 1, 0, 0, 1, 1,
0.4214753, -1.044978, 2.347429, 1, 0, 0, 1, 1,
0.4267817, -0.32997, 2.147468, 0, 0, 0, 1, 1,
0.4274349, -1.591438, 3.233431, 0, 0, 0, 1, 1,
0.4358995, -0.1231928, 0.5026317, 0, 0, 0, 1, 1,
0.4530202, 1.525573, -0.5294487, 0, 0, 0, 1, 1,
0.45487, 0.5327966, -0.38833, 0, 0, 0, 1, 1,
0.4549544, -0.8515059, 4.749278, 0, 0, 0, 1, 1,
0.457052, -1.690774, 3.072006, 0, 0, 0, 1, 1,
0.4593777, -0.6234356, 2.719513, 1, 1, 1, 1, 1,
0.4605713, -1.428506, 3.777203, 1, 1, 1, 1, 1,
0.4631888, -0.1683816, 2.996615, 1, 1, 1, 1, 1,
0.4632564, -0.3074397, 2.285808, 1, 1, 1, 1, 1,
0.4649039, 0.134245, 2.36763, 1, 1, 1, 1, 1,
0.4670495, -0.8905408, 3.627504, 1, 1, 1, 1, 1,
0.4675454, 0.1347007, 1.228505, 1, 1, 1, 1, 1,
0.4685974, 0.2658093, 1.485574, 1, 1, 1, 1, 1,
0.4732045, -0.9684744, 0.9328371, 1, 1, 1, 1, 1,
0.48022, 1.768529, -0.5511866, 1, 1, 1, 1, 1,
0.4832314, -0.5115663, 3.624238, 1, 1, 1, 1, 1,
0.4899776, -0.3637074, 2.894403, 1, 1, 1, 1, 1,
0.49225, 0.8339546, 1.797198, 1, 1, 1, 1, 1,
0.4967385, 1.290942, 1.44536, 1, 1, 1, 1, 1,
0.4986668, 0.2561021, 1.813771, 1, 1, 1, 1, 1,
0.5000188, 0.5881685, -1.487399, 0, 0, 1, 1, 1,
0.5036581, -0.6669591, 1.800396, 1, 0, 0, 1, 1,
0.5043247, -0.5618407, 2.788868, 1, 0, 0, 1, 1,
0.5057583, -0.1394675, 2.509952, 1, 0, 0, 1, 1,
0.5078313, -0.7393865, 2.950128, 1, 0, 0, 1, 1,
0.5086082, -0.6897771, 1.703317, 1, 0, 0, 1, 1,
0.5115821, 1.488023, -0.3291418, 0, 0, 0, 1, 1,
0.5163742, 0.7265019, -1.226797, 0, 0, 0, 1, 1,
0.5189792, 0.5000255, 0.01446124, 0, 0, 0, 1, 1,
0.5221514, 0.1805702, 1.195836, 0, 0, 0, 1, 1,
0.5245838, 0.3316651, 0.8031408, 0, 0, 0, 1, 1,
0.5261735, -0.9814703, 2.57193, 0, 0, 0, 1, 1,
0.5276706, -1.648587, 2.252645, 0, 0, 0, 1, 1,
0.5290169, 0.3576583, 1.226729, 1, 1, 1, 1, 1,
0.5303347, 0.1564662, 0.7676303, 1, 1, 1, 1, 1,
0.5318847, 2.203647, -0.1776658, 1, 1, 1, 1, 1,
0.532849, -1.614473, 2.327865, 1, 1, 1, 1, 1,
0.5348059, 0.6007853, -0.9757622, 1, 1, 1, 1, 1,
0.5393825, 0.9455034, -0.4535761, 1, 1, 1, 1, 1,
0.548012, -0.9588541, 3.07728, 1, 1, 1, 1, 1,
0.5547596, 0.5467106, -0.6669641, 1, 1, 1, 1, 1,
0.5562994, -0.3249312, 2.204911, 1, 1, 1, 1, 1,
0.5597376, 2.449247, 1.862841, 1, 1, 1, 1, 1,
0.5641263, 0.237238, 2.996578, 1, 1, 1, 1, 1,
0.5683857, -0.4806423, 4.28554, 1, 1, 1, 1, 1,
0.5703731, -1.42426, 3.171393, 1, 1, 1, 1, 1,
0.5705914, -0.4439727, 1.289739, 1, 1, 1, 1, 1,
0.5731511, -0.09008147, 1.683555, 1, 1, 1, 1, 1,
0.5740477, -0.7332721, 1.275995, 0, 0, 1, 1, 1,
0.5761088, 0.01639792, 0.8290604, 1, 0, 0, 1, 1,
0.580681, 0.532856, 1.723317, 1, 0, 0, 1, 1,
0.5821405, 0.2177385, 0.8450783, 1, 0, 0, 1, 1,
0.5879806, 0.3472334, 1.417536, 1, 0, 0, 1, 1,
0.5900793, -0.5272615, 2.78764, 1, 0, 0, 1, 1,
0.5904855, 0.4440278, 1.523199, 0, 0, 0, 1, 1,
0.5907423, 0.6915639, 2.538156, 0, 0, 0, 1, 1,
0.5920036, 0.4542989, -0.5695554, 0, 0, 0, 1, 1,
0.5925306, 1.174554, 1.348862, 0, 0, 0, 1, 1,
0.5925971, -0.5209742, 2.910525, 0, 0, 0, 1, 1,
0.5941151, 0.1964483, 0.8973105, 0, 0, 0, 1, 1,
0.5947441, -0.3260824, 1.674886, 0, 0, 0, 1, 1,
0.5959348, 0.9748436, 1.357192, 1, 1, 1, 1, 1,
0.5966347, 0.1824088, 1.696757, 1, 1, 1, 1, 1,
0.5976375, 0.6599734, 0.2707669, 1, 1, 1, 1, 1,
0.5979706, 0.9297983, 0.9697726, 1, 1, 1, 1, 1,
0.6006215, -0.5081443, -0.04468044, 1, 1, 1, 1, 1,
0.612837, -1.394095, 1.032724, 1, 1, 1, 1, 1,
0.6185921, -0.07310697, 2.90659, 1, 1, 1, 1, 1,
0.6222583, -0.8031392, 2.027672, 1, 1, 1, 1, 1,
0.6234019, 0.1892926, -0.6645615, 1, 1, 1, 1, 1,
0.6268953, -1.257006, 2.882138, 1, 1, 1, 1, 1,
0.6293138, 0.07381611, 2.173348, 1, 1, 1, 1, 1,
0.6338542, 1.388534, 1.278309, 1, 1, 1, 1, 1,
0.6366659, -1.474584, 3.420289, 1, 1, 1, 1, 1,
0.6430352, 0.6320756, 1.931725, 1, 1, 1, 1, 1,
0.6481973, 0.2411121, 0.9876571, 1, 1, 1, 1, 1,
0.6502188, -0.957163, 1.207447, 0, 0, 1, 1, 1,
0.6519849, -0.4923737, 3.301477, 1, 0, 0, 1, 1,
0.6580708, 0.3530229, 0.2665212, 1, 0, 0, 1, 1,
0.6582504, 0.4436554, 2.938132, 1, 0, 0, 1, 1,
0.6594405, -1.016507, 2.637215, 1, 0, 0, 1, 1,
0.6632839, -0.9220216, 2.645761, 1, 0, 0, 1, 1,
0.668893, 0.2328523, 1.398092, 0, 0, 0, 1, 1,
0.6700425, 1.630018, -0.9971545, 0, 0, 0, 1, 1,
0.6717287, 0.5325701, -0.3453404, 0, 0, 0, 1, 1,
0.6763108, 0.05177348, 0.4722044, 0, 0, 0, 1, 1,
0.6772591, -0.7005992, 2.484271, 0, 0, 0, 1, 1,
0.6781564, -1.433874, 2.611055, 0, 0, 0, 1, 1,
0.6799626, -1.579454, 1.018655, 0, 0, 0, 1, 1,
0.6804792, -1.185038, 2.442037, 1, 1, 1, 1, 1,
0.6855843, -0.5939434, 2.5271, 1, 1, 1, 1, 1,
0.68653, -1.518355, 2.99876, 1, 1, 1, 1, 1,
0.6884418, -0.6215588, 0.7563342, 1, 1, 1, 1, 1,
0.6919908, -0.4259564, 3.315412, 1, 1, 1, 1, 1,
0.6965703, -1.677693, 4.012773, 1, 1, 1, 1, 1,
0.7103652, 1.481598, -1.107335, 1, 1, 1, 1, 1,
0.7123073, -0.2444709, 1.806306, 1, 1, 1, 1, 1,
0.7142068, -1.619796, 2.935867, 1, 1, 1, 1, 1,
0.7179747, -0.872299, 1.378348, 1, 1, 1, 1, 1,
0.7241564, 1.768058, 0.1457779, 1, 1, 1, 1, 1,
0.728339, 0.7180558, 0.01380894, 1, 1, 1, 1, 1,
0.7296817, -1.33056, 2.846704, 1, 1, 1, 1, 1,
0.7370964, -1.295976, 0.7575527, 1, 1, 1, 1, 1,
0.7406452, 0.2152881, 1.027314, 1, 1, 1, 1, 1,
0.7409705, 1.270001, -1.441986, 0, 0, 1, 1, 1,
0.7453539, 0.2219623, 2.236602, 1, 0, 0, 1, 1,
0.7504247, -1.483311, 1.436674, 1, 0, 0, 1, 1,
0.7521452, -2.454279, 1.644387, 1, 0, 0, 1, 1,
0.7577559, -0.3195164, 1.001667, 1, 0, 0, 1, 1,
0.7584983, 0.4517252, 1.461142, 1, 0, 0, 1, 1,
0.7613727, -0.9652544, 1.505341, 0, 0, 0, 1, 1,
0.7615021, 1.48636, 0.1869852, 0, 0, 0, 1, 1,
0.7621096, 0.2173573, 0.5625577, 0, 0, 0, 1, 1,
0.7756202, 1.686624, 2.761457, 0, 0, 0, 1, 1,
0.7759402, -2.551389, 3.815775, 0, 0, 0, 1, 1,
0.7781849, 1.100342, 0.7390051, 0, 0, 0, 1, 1,
0.7786602, 1.809461, 2.48629, 0, 0, 0, 1, 1,
0.7822326, -0.1676753, 3.509398, 1, 1, 1, 1, 1,
0.7829467, -0.4176516, 3.248613, 1, 1, 1, 1, 1,
0.7890554, 0.4655401, 1.351751, 1, 1, 1, 1, 1,
0.7935462, 0.6849504, 1.852182, 1, 1, 1, 1, 1,
0.7936379, 0.09343787, 1.919109, 1, 1, 1, 1, 1,
0.7943456, -1.035681, 2.848381, 1, 1, 1, 1, 1,
0.8040331, -0.8733651, 3.840968, 1, 1, 1, 1, 1,
0.8108568, 0.1599839, 1.584215, 1, 1, 1, 1, 1,
0.8157313, -1.534908, 0.9863009, 1, 1, 1, 1, 1,
0.8172458, -0.2043527, 1.82792, 1, 1, 1, 1, 1,
0.8191347, -0.7046617, 2.02725, 1, 1, 1, 1, 1,
0.8208392, 0.6654447, -0.3730995, 1, 1, 1, 1, 1,
0.8223119, 0.6197352, 1.569904, 1, 1, 1, 1, 1,
0.8236116, -0.9625938, 2.384516, 1, 1, 1, 1, 1,
0.8267795, 0.562999, 2.521687, 1, 1, 1, 1, 1,
0.8275037, -0.3004747, 1.564582, 0, 0, 1, 1, 1,
0.8283446, -1.477813, 3.317985, 1, 0, 0, 1, 1,
0.8335031, 1.236132, 1.661485, 1, 0, 0, 1, 1,
0.8353671, 0.4295386, 1.289132, 1, 0, 0, 1, 1,
0.8365325, 0.2449993, 1.017021, 1, 0, 0, 1, 1,
0.8386414, 0.1026341, 1.324542, 1, 0, 0, 1, 1,
0.8475259, 0.141552, 2.955658, 0, 0, 0, 1, 1,
0.8666595, -1.068424, 2.746367, 0, 0, 0, 1, 1,
0.8677124, -0.01966615, 2.652073, 0, 0, 0, 1, 1,
0.8708957, -0.02399829, 1.880552, 0, 0, 0, 1, 1,
0.8743296, -0.7376957, 1.360732, 0, 0, 0, 1, 1,
0.8769413, -0.004107019, 2.109045, 0, 0, 0, 1, 1,
0.8773487, -2.59782, 2.767277, 0, 0, 0, 1, 1,
0.8784722, 0.1536567, 3.508923, 1, 1, 1, 1, 1,
0.8801343, 2.798655, -0.1549184, 1, 1, 1, 1, 1,
0.880331, -1.237912, 2.862557, 1, 1, 1, 1, 1,
0.8815754, 1.460245, 2.177064, 1, 1, 1, 1, 1,
0.8855463, 1.079693, 1.596041, 1, 1, 1, 1, 1,
0.9000927, -0.2707136, 1.458358, 1, 1, 1, 1, 1,
0.9009746, 1.661469, 0.1741058, 1, 1, 1, 1, 1,
0.9058338, -0.9513385, 2.289992, 1, 1, 1, 1, 1,
0.9100147, 0.2956543, 0.8424245, 1, 1, 1, 1, 1,
0.9116295, -0.4297839, 2.689616, 1, 1, 1, 1, 1,
0.9155477, 0.668455, 0.4553609, 1, 1, 1, 1, 1,
0.9161139, 1.241321, 0.4256505, 1, 1, 1, 1, 1,
0.9189584, -0.2513278, 3.783769, 1, 1, 1, 1, 1,
0.9204475, 2.257771, 0.9479995, 1, 1, 1, 1, 1,
0.9245434, 0.7297955, 2.432899, 1, 1, 1, 1, 1,
0.9306698, 0.149846, -0.2107484, 0, 0, 1, 1, 1,
0.9335236, 1.500775, 0.6391593, 1, 0, 0, 1, 1,
0.9390554, 0.8151811, 0.7900538, 1, 0, 0, 1, 1,
0.9395629, 0.3259112, 2.882698, 1, 0, 0, 1, 1,
0.9714392, -1.81552, 3.741502, 1, 0, 0, 1, 1,
0.9734211, 0.5598876, 1.303507, 1, 0, 0, 1, 1,
0.9771091, -1.88268, 5.933287, 0, 0, 0, 1, 1,
0.9865999, 0.8484243, 1.11019, 0, 0, 0, 1, 1,
0.9899029, 1.749189, 0.441673, 0, 0, 0, 1, 1,
0.9991112, 0.3834822, 3.803313, 0, 0, 0, 1, 1,
1.004211, -1.248381, 2.906253, 0, 0, 0, 1, 1,
1.017362, -2.363379, 3.5447, 0, 0, 0, 1, 1,
1.041456, 0.6228052, -0.5838581, 0, 0, 0, 1, 1,
1.041798, -0.8071527, 1.090813, 1, 1, 1, 1, 1,
1.045275, 0.5032384, 1.79614, 1, 1, 1, 1, 1,
1.058756, 0.4581611, 1.582592, 1, 1, 1, 1, 1,
1.060789, 1.867315, -0.2978927, 1, 1, 1, 1, 1,
1.06248, -0.3567762, 2.522893, 1, 1, 1, 1, 1,
1.063939, -0.5704917, 2.163881, 1, 1, 1, 1, 1,
1.071812, 0.3638803, 1.6463, 1, 1, 1, 1, 1,
1.07575, 0.5956532, 5.136422, 1, 1, 1, 1, 1,
1.076996, -0.7260548, 3.814603, 1, 1, 1, 1, 1,
1.083177, 1.576685, 0.6853768, 1, 1, 1, 1, 1,
1.083256, 0.4815126, 2.321227, 1, 1, 1, 1, 1,
1.084831, -0.3561082, 2.066323, 1, 1, 1, 1, 1,
1.086308, -1.6117, 2.559177, 1, 1, 1, 1, 1,
1.086522, 1.264967, 0.2572538, 1, 1, 1, 1, 1,
1.099788, -0.1750685, 1.51745, 1, 1, 1, 1, 1,
1.099862, -0.3129361, 1.141093, 0, 0, 1, 1, 1,
1.100682, -0.06723453, -0.006593016, 1, 0, 0, 1, 1,
1.10215, 1.364571, 1.283257, 1, 0, 0, 1, 1,
1.105446, 0.8966525, -1.040384, 1, 0, 0, 1, 1,
1.129586, 0.09639932, 1.298577, 1, 0, 0, 1, 1,
1.129677, 1.776476, -0.6564813, 1, 0, 0, 1, 1,
1.155362, -1.604873, 2.143371, 0, 0, 0, 1, 1,
1.157156, 0.1330705, 0.5667211, 0, 0, 0, 1, 1,
1.157219, -1.118757, 3.749772, 0, 0, 0, 1, 1,
1.161621, -1.659344, 2.256836, 0, 0, 0, 1, 1,
1.164108, 1.318465, 1.504866, 0, 0, 0, 1, 1,
1.167195, -0.5700038, 3.018669, 0, 0, 0, 1, 1,
1.16978, -0.4782621, 2.075353, 0, 0, 0, 1, 1,
1.171081, -1.849152, 2.119827, 1, 1, 1, 1, 1,
1.179323, -0.2766375, 0.2855563, 1, 1, 1, 1, 1,
1.182545, -0.2539821, 1.824907, 1, 1, 1, 1, 1,
1.186745, 2.59774, 0.4045633, 1, 1, 1, 1, 1,
1.193261, 1.29421, 0.4861299, 1, 1, 1, 1, 1,
1.194401, -1.830423, 1.460148, 1, 1, 1, 1, 1,
1.196751, 1.806383, -0.5208023, 1, 1, 1, 1, 1,
1.204639, 0.01272703, 3.444995, 1, 1, 1, 1, 1,
1.205333, -1.283045, 2.636284, 1, 1, 1, 1, 1,
1.206666, 0.4182527, 0.4779868, 1, 1, 1, 1, 1,
1.213549, 0.1801728, 1.974998, 1, 1, 1, 1, 1,
1.214716, 0.09155382, 0.5108149, 1, 1, 1, 1, 1,
1.232219, 0.5892308, 1.202379, 1, 1, 1, 1, 1,
1.232616, 0.487121, 2.148299, 1, 1, 1, 1, 1,
1.234124, -1.275841, 1.442132, 1, 1, 1, 1, 1,
1.234945, 0.3155135, 2.016042, 0, 0, 1, 1, 1,
1.235176, -0.6486539, 0.5226345, 1, 0, 0, 1, 1,
1.237141, -0.667963, 1.537143, 1, 0, 0, 1, 1,
1.245865, -0.4992719, 2.304056, 1, 0, 0, 1, 1,
1.248199, 0.2444174, 1.307495, 1, 0, 0, 1, 1,
1.24932, -0.7088796, 1.65946, 1, 0, 0, 1, 1,
1.260876, 0.2381675, 0.5131481, 0, 0, 0, 1, 1,
1.269345, 2.510511, -0.0198362, 0, 0, 0, 1, 1,
1.269617, -1.564658, 2.698055, 0, 0, 0, 1, 1,
1.270074, -0.1781688, 2.010876, 0, 0, 0, 1, 1,
1.27236, 2.428595, 0.6690409, 0, 0, 0, 1, 1,
1.284802, 0.5534737, 1.845348, 0, 0, 0, 1, 1,
1.29121, -0.06163745, 2.041729, 0, 0, 0, 1, 1,
1.297903, 0.08324789, 0.9488345, 1, 1, 1, 1, 1,
1.29833, 0.8020756, 0.9235742, 1, 1, 1, 1, 1,
1.301782, 1.578754, 0.2095295, 1, 1, 1, 1, 1,
1.302363, -0.7357947, 3.193073, 1, 1, 1, 1, 1,
1.312087, 0.2743758, 0.572279, 1, 1, 1, 1, 1,
1.322651, 0.4181303, 0.2263605, 1, 1, 1, 1, 1,
1.33474, 0.7022502, 0.4345571, 1, 1, 1, 1, 1,
1.335181, 0.6425981, 2.230954, 1, 1, 1, 1, 1,
1.339143, 0.4224845, 0.7880071, 1, 1, 1, 1, 1,
1.339628, -1.132551, 3.117849, 1, 1, 1, 1, 1,
1.341268, 0.1242571, 0.8910584, 1, 1, 1, 1, 1,
1.349178, 0.2361985, 0.006481113, 1, 1, 1, 1, 1,
1.353036, 0.7482507, 0.5057381, 1, 1, 1, 1, 1,
1.355171, 0.4943321, 2.623495, 1, 1, 1, 1, 1,
1.356816, -0.05972622, 0.5736597, 1, 1, 1, 1, 1,
1.370803, -0.01540092, 0.6142303, 0, 0, 1, 1, 1,
1.38593, 0.1409663, -0.5185664, 1, 0, 0, 1, 1,
1.387047, 0.293395, 0.7601476, 1, 0, 0, 1, 1,
1.398899, 0.1080251, 1.908451, 1, 0, 0, 1, 1,
1.404977, 0.5929049, 0.817072, 1, 0, 0, 1, 1,
1.417075, -0.2109698, 2.364982, 1, 0, 0, 1, 1,
1.426711, 1.390767, 1.547298, 0, 0, 0, 1, 1,
1.427117, -0.5403618, 2.548451, 0, 0, 0, 1, 1,
1.428903, 0.3841653, 0.6431715, 0, 0, 0, 1, 1,
1.446551, -0.4659124, 3.908011, 0, 0, 0, 1, 1,
1.450136, -1.953691, 2.326055, 0, 0, 0, 1, 1,
1.451431, 1.506026, 0.2677512, 0, 0, 0, 1, 1,
1.459917, 0.5477473, -0.8979951, 0, 0, 0, 1, 1,
1.4625, 1.453429, 0.5440745, 1, 1, 1, 1, 1,
1.465539, 1.014808, 1.132779, 1, 1, 1, 1, 1,
1.479121, -1.548449, 1.970483, 1, 1, 1, 1, 1,
1.481432, -2.336506, 1.759927, 1, 1, 1, 1, 1,
1.481713, 0.2102076, -0.1779507, 1, 1, 1, 1, 1,
1.505057, -0.02490494, 1.812443, 1, 1, 1, 1, 1,
1.50512, 0.9805311, -0.579227, 1, 1, 1, 1, 1,
1.522642, 0.909717, 0.8710418, 1, 1, 1, 1, 1,
1.523211, -0.1937554, 3.131388, 1, 1, 1, 1, 1,
1.5406, 2.143188, -0.2102283, 1, 1, 1, 1, 1,
1.540637, -0.3690076, 1.912848, 1, 1, 1, 1, 1,
1.550042, -1.474427, 2.244039, 1, 1, 1, 1, 1,
1.556477, 1.118525, 1.904436, 1, 1, 1, 1, 1,
1.579889, -0.2009904, 1.245035, 1, 1, 1, 1, 1,
1.588067, -2.278489, 2.56729, 1, 1, 1, 1, 1,
1.626037, -1.464026, 2.213233, 0, 0, 1, 1, 1,
1.628289, 0.2202398, 2.004559, 1, 0, 0, 1, 1,
1.63614, -0.9337217, 1.661994, 1, 0, 0, 1, 1,
1.648104, 0.6708213, 0.03533154, 1, 0, 0, 1, 1,
1.701235, 0.2771823, 0.2261926, 1, 0, 0, 1, 1,
1.70241, 1.867758, 0.6588421, 1, 0, 0, 1, 1,
1.711968, -0.03864041, 1.130261, 0, 0, 0, 1, 1,
1.731526, 1.777742, 1.811352, 0, 0, 0, 1, 1,
1.738489, 0.004467831, 1.587509, 0, 0, 0, 1, 1,
1.74419, -0.5288098, 2.699731, 0, 0, 0, 1, 1,
1.744271, 1.229493, 1.600794, 0, 0, 0, 1, 1,
1.775835, -0.5560783, 1.552181, 0, 0, 0, 1, 1,
1.804761, 1.598643, 1.665519, 0, 0, 0, 1, 1,
1.805409, -0.7003596, 1.006325, 1, 1, 1, 1, 1,
1.816213, -0.2639619, 1.68063, 1, 1, 1, 1, 1,
1.820394, -0.3342479, 2.238027, 1, 1, 1, 1, 1,
1.839163, -0.7771904, 2.658474, 1, 1, 1, 1, 1,
1.874014, -0.7072396, 1.141273, 1, 1, 1, 1, 1,
1.899509, -0.5936638, 2.768869, 1, 1, 1, 1, 1,
1.90525, -0.2723509, 1.557552, 1, 1, 1, 1, 1,
1.931021, -0.6139026, 1.463641, 1, 1, 1, 1, 1,
1.937934, 0.7739921, -0.317464, 1, 1, 1, 1, 1,
1.951465, 1.509491, 0.03633298, 1, 1, 1, 1, 1,
1.952064, -0.2776559, 1.926235, 1, 1, 1, 1, 1,
1.953843, -0.6219, 2.637949, 1, 1, 1, 1, 1,
1.959291, 1.720089, -0.8588943, 1, 1, 1, 1, 1,
1.986752, 0.8321291, -0.2502588, 1, 1, 1, 1, 1,
2.007459, -0.06771956, 1.077828, 1, 1, 1, 1, 1,
2.04302, -0.4856195, 2.412571, 0, 0, 1, 1, 1,
2.066489, 0.1852207, 1.534117, 1, 0, 0, 1, 1,
2.08287, -0.4425474, 2.082881, 1, 0, 0, 1, 1,
2.119577, -1.018089, 3.798592, 1, 0, 0, 1, 1,
2.139189, 1.07168, 0.6847938, 1, 0, 0, 1, 1,
2.161586, 0.9286645, -0.06782697, 1, 0, 0, 1, 1,
2.189074, 0.1047771, 2.943755, 0, 0, 0, 1, 1,
2.192717, -0.0006288429, 2.025969, 0, 0, 0, 1, 1,
2.20736, 0.5535116, 2.813735, 0, 0, 0, 1, 1,
2.233386, -0.600651, 2.052518, 0, 0, 0, 1, 1,
2.23929, 0.354681, 1.455655, 0, 0, 0, 1, 1,
2.262738, 0.09795641, 2.016076, 0, 0, 0, 1, 1,
2.34332, -2.202328, 2.087347, 0, 0, 0, 1, 1,
2.412551, 1.462388, 1.002098, 1, 1, 1, 1, 1,
2.470698, 0.5361348, 1.430719, 1, 1, 1, 1, 1,
2.480898, -1.784807, 4.565649, 1, 1, 1, 1, 1,
2.523419, 0.4685568, 1.170451, 1, 1, 1, 1, 1,
2.61487, -0.1949351, 1.07147, 1, 1, 1, 1, 1,
3.252467, -0.1885102, 3.003158, 1, 1, 1, 1, 1,
3.500528, 0.2365225, 3.579073, 1, 1, 1, 1, 1
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
var radius = 9.66763;
var distance = 33.95714;
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
mvMatrix.translate( -0.4329351, -0.2800294, -0.4109273 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.95714);
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