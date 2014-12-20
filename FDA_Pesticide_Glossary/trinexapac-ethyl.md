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
-2.90853, -0.5611373, -1.826591, 1, 0, 0, 1,
-2.688499, -0.9773499, -2.740385, 1, 0.007843138, 0, 1,
-2.685579, -0.1805615, -1.609037, 1, 0.01176471, 0, 1,
-2.632687, -0.08917749, 0.5439797, 1, 0.01960784, 0, 1,
-2.461272, -2.420717, -0.9984171, 1, 0.02352941, 0, 1,
-2.428122, 0.9148903, -3.597836, 1, 0.03137255, 0, 1,
-2.326477, -1.406536, -3.088235, 1, 0.03529412, 0, 1,
-2.322639, 1.549638, -0.8267925, 1, 0.04313726, 0, 1,
-2.289511, -1.250088, -1.455924, 1, 0.04705882, 0, 1,
-2.240061, 0.876592, -1.923503, 1, 0.05490196, 0, 1,
-2.130342, 0.03400398, -1.720042, 1, 0.05882353, 0, 1,
-2.129388, 1.007329, -0.9593747, 1, 0.06666667, 0, 1,
-2.11221, 1.779377, -2.856106, 1, 0.07058824, 0, 1,
-2.111146, -0.8166326, -1.445082, 1, 0.07843138, 0, 1,
-2.093826, 1.397128, -0.9497316, 1, 0.08235294, 0, 1,
-2.090641, -0.8444299, -1.928523, 1, 0.09019608, 0, 1,
-2.077701, -1.66125, -3.083078, 1, 0.09411765, 0, 1,
-2.055606, 0.1144901, -0.97149, 1, 0.1019608, 0, 1,
-2.051912, -1.565413, -2.808138, 1, 0.1098039, 0, 1,
-1.992016, 0.8460214, -0.5713949, 1, 0.1137255, 0, 1,
-1.990241, 0.4681251, 0.02020527, 1, 0.1215686, 0, 1,
-1.976208, 0.3651709, -1.439391, 1, 0.1254902, 0, 1,
-1.965649, -0.4469064, -2.98624, 1, 0.1333333, 0, 1,
-1.945134, -0.9131774, -4.486383, 1, 0.1372549, 0, 1,
-1.929153, 0.1067155, 0.4133052, 1, 0.145098, 0, 1,
-1.913744, 0.6894971, 0.9337534, 1, 0.1490196, 0, 1,
-1.912806, -0.7856383, -3.004115, 1, 0.1568628, 0, 1,
-1.908427, 2.865853, -0.8662234, 1, 0.1607843, 0, 1,
-1.880218, -0.5485511, -1.401885, 1, 0.1686275, 0, 1,
-1.871897, 0.4238059, -1.490333, 1, 0.172549, 0, 1,
-1.871055, -0.3412283, -1.47548, 1, 0.1803922, 0, 1,
-1.843475, -0.05233661, 0.4932428, 1, 0.1843137, 0, 1,
-1.836047, 0.01869787, -1.971153, 1, 0.1921569, 0, 1,
-1.795991, 3.071347, 0.9870923, 1, 0.1960784, 0, 1,
-1.794441, -1.044414, -1.656463, 1, 0.2039216, 0, 1,
-1.785517, -0.5456842, -3.223141, 1, 0.2117647, 0, 1,
-1.78102, 1.119, -0.3911496, 1, 0.2156863, 0, 1,
-1.780168, 1.772628, -0.3787279, 1, 0.2235294, 0, 1,
-1.767983, -1.339275, -3.689688, 1, 0.227451, 0, 1,
-1.75511, 0.9275286, 0.4677598, 1, 0.2352941, 0, 1,
-1.754254, -1.246911, -2.928859, 1, 0.2392157, 0, 1,
-1.741629, 1.763279, -2.673691, 1, 0.2470588, 0, 1,
-1.729418, -1.239446, -1.417872, 1, 0.2509804, 0, 1,
-1.717136, -0.7480441, 0.1436764, 1, 0.2588235, 0, 1,
-1.705426, -1.037411, -1.969998, 1, 0.2627451, 0, 1,
-1.693061, 0.3197929, -0.6341018, 1, 0.2705882, 0, 1,
-1.683008, -0.2353252, -1.520995, 1, 0.2745098, 0, 1,
-1.672765, 0.1581342, -0.8771599, 1, 0.282353, 0, 1,
-1.655667, -1.24752, -3.464653, 1, 0.2862745, 0, 1,
-1.636376, 0.6961445, -1.996334, 1, 0.2941177, 0, 1,
-1.626782, -0.03229657, -0.5707388, 1, 0.3019608, 0, 1,
-1.621111, 1.685815, -2.197974, 1, 0.3058824, 0, 1,
-1.616915, 1.182561, -1.174919, 1, 0.3137255, 0, 1,
-1.613925, -0.1861219, -1.486637, 1, 0.3176471, 0, 1,
-1.611752, 1.144519, -2.494368, 1, 0.3254902, 0, 1,
-1.608859, 1.08876, -2.316869, 1, 0.3294118, 0, 1,
-1.608569, -0.1640415, -3.541355, 1, 0.3372549, 0, 1,
-1.604718, -0.6108049, -1.499344, 1, 0.3411765, 0, 1,
-1.599348, -0.02574696, -1.334461, 1, 0.3490196, 0, 1,
-1.585395, 1.313126, -1.874661, 1, 0.3529412, 0, 1,
-1.579884, 0.4023542, -0.1458764, 1, 0.3607843, 0, 1,
-1.566912, -1.041339, -3.456179, 1, 0.3647059, 0, 1,
-1.566714, -0.1835628, -0.3175682, 1, 0.372549, 0, 1,
-1.555316, 1.571558, -0.8045175, 1, 0.3764706, 0, 1,
-1.552827, 0.6892656, -0.5846564, 1, 0.3843137, 0, 1,
-1.531585, 1.901232, -0.9591928, 1, 0.3882353, 0, 1,
-1.529915, -0.7340063, -2.968263, 1, 0.3960784, 0, 1,
-1.526001, -0.4753036, -1.750981, 1, 0.4039216, 0, 1,
-1.510373, -0.7941602, -2.178973, 1, 0.4078431, 0, 1,
-1.503166, -0.639001, -3.974928, 1, 0.4156863, 0, 1,
-1.488636, 0.5350557, -2.985008, 1, 0.4196078, 0, 1,
-1.485168, 0.1016259, -1.347205, 1, 0.427451, 0, 1,
-1.480518, -0.5476848, -1.250557, 1, 0.4313726, 0, 1,
-1.479993, -0.6258948, -0.9584245, 1, 0.4392157, 0, 1,
-1.473315, -1.088186, -3.282681, 1, 0.4431373, 0, 1,
-1.461489, -0.7129559, -0.9511229, 1, 0.4509804, 0, 1,
-1.449244, -1.256813, -1.871361, 1, 0.454902, 0, 1,
-1.442194, -0.3697524, -2.868208, 1, 0.4627451, 0, 1,
-1.436314, 0.06961472, -2.19535, 1, 0.4666667, 0, 1,
-1.436017, 0.05090135, -1.868754, 1, 0.4745098, 0, 1,
-1.422607, 0.6331186, -2.427755, 1, 0.4784314, 0, 1,
-1.400203, -0.6316463, -0.963223, 1, 0.4862745, 0, 1,
-1.396378, 0.4329498, -0.9663728, 1, 0.4901961, 0, 1,
-1.395796, -2.099413, -3.79738, 1, 0.4980392, 0, 1,
-1.372694, -0.4947409, -3.029724, 1, 0.5058824, 0, 1,
-1.365317, -0.9797661, -2.370146, 1, 0.509804, 0, 1,
-1.364077, -1.366904, -2.199121, 1, 0.5176471, 0, 1,
-1.363406, -0.1499431, -1.712399, 1, 0.5215687, 0, 1,
-1.36042, -1.116852, -1.140931, 1, 0.5294118, 0, 1,
-1.358302, -0.2029087, -2.753525, 1, 0.5333334, 0, 1,
-1.337395, 1.26883, 0.8484175, 1, 0.5411765, 0, 1,
-1.330397, -0.7956565, -2.9157, 1, 0.5450981, 0, 1,
-1.324762, -0.990989, -1.267289, 1, 0.5529412, 0, 1,
-1.320594, 0.71666, -2.586179, 1, 0.5568628, 0, 1,
-1.306479, 0.7200061, -0.7305292, 1, 0.5647059, 0, 1,
-1.305701, 0.4699372, -2.469274, 1, 0.5686275, 0, 1,
-1.290749, -0.1510999, -1.729212, 1, 0.5764706, 0, 1,
-1.27829, 0.3184548, -1.328175, 1, 0.5803922, 0, 1,
-1.275898, 0.8205703, -2.793511, 1, 0.5882353, 0, 1,
-1.273152, 2.486725, -1.056652, 1, 0.5921569, 0, 1,
-1.26613, 0.5044271, -0.9113531, 1, 0.6, 0, 1,
-1.264563, 2.205791, -0.1094636, 1, 0.6078432, 0, 1,
-1.258678, -1.224417, -2.947839, 1, 0.6117647, 0, 1,
-1.254663, 0.7616937, -1.694904, 1, 0.6196079, 0, 1,
-1.247928, 1.328833, -1.463081, 1, 0.6235294, 0, 1,
-1.243603, 1.102405, 0.5973091, 1, 0.6313726, 0, 1,
-1.2428, -1.211377, -2.123971, 1, 0.6352941, 0, 1,
-1.237581, 1.222521, -1.469931, 1, 0.6431373, 0, 1,
-1.235949, -0.3500511, -2.29529, 1, 0.6470588, 0, 1,
-1.234779, 1.229902, -1.883985, 1, 0.654902, 0, 1,
-1.230689, 0.2073591, -2.961156, 1, 0.6588235, 0, 1,
-1.22329, 2.481152, -0.7642925, 1, 0.6666667, 0, 1,
-1.190505, -0.792856, -1.307478, 1, 0.6705883, 0, 1,
-1.186939, -0.1873178, -1.134132, 1, 0.6784314, 0, 1,
-1.181417, 2.420964, -0.9749788, 1, 0.682353, 0, 1,
-1.179874, -0.2081306, -1.16968, 1, 0.6901961, 0, 1,
-1.175425, 0.9474864, -0.1489398, 1, 0.6941177, 0, 1,
-1.173316, 1.558851, -1.164995, 1, 0.7019608, 0, 1,
-1.173171, 0.4754984, -2.92171, 1, 0.7098039, 0, 1,
-1.166833, -0.2216104, -0.05234377, 1, 0.7137255, 0, 1,
-1.162381, 0.4783348, -0.7794642, 1, 0.7215686, 0, 1,
-1.159233, -0.4151633, -3.169956, 1, 0.7254902, 0, 1,
-1.158751, 0.2171884, -0.8940175, 1, 0.7333333, 0, 1,
-1.158343, -0.9755058, -3.109439, 1, 0.7372549, 0, 1,
-1.155307, 1.544452, -1.998818, 1, 0.7450981, 0, 1,
-1.154683, -0.04554947, -0.9349337, 1, 0.7490196, 0, 1,
-1.150815, -1.082898, -4.533934, 1, 0.7568628, 0, 1,
-1.134759, -1.360647, -3.046473, 1, 0.7607843, 0, 1,
-1.117764, 0.2591284, -0.3895501, 1, 0.7686275, 0, 1,
-1.116876, 0.5355946, -0.3459083, 1, 0.772549, 0, 1,
-1.115109, 0.1240706, -0.7055721, 1, 0.7803922, 0, 1,
-1.113827, -0.4287047, -1.504029, 1, 0.7843137, 0, 1,
-1.113181, -2.670959, -2.520869, 1, 0.7921569, 0, 1,
-1.11294, -0.4890712, -0.9051938, 1, 0.7960784, 0, 1,
-1.107072, 0.1615302, -2.034458, 1, 0.8039216, 0, 1,
-1.105859, -0.2270333, -1.394618, 1, 0.8117647, 0, 1,
-1.104262, 0.1555812, -0.7822241, 1, 0.8156863, 0, 1,
-1.099943, 0.1588937, 0.01628581, 1, 0.8235294, 0, 1,
-1.092148, -1.924435, -2.776659, 1, 0.827451, 0, 1,
-1.091671, -2.228606, -3.060606, 1, 0.8352941, 0, 1,
-1.091436, -0.04786075, -1.219474, 1, 0.8392157, 0, 1,
-1.086536, 1.638168, 0.7745149, 1, 0.8470588, 0, 1,
-1.075278, 0.1096361, 0.4762164, 1, 0.8509804, 0, 1,
-1.072315, 1.488128, -0.2057049, 1, 0.8588235, 0, 1,
-1.067448, -0.7034683, -2.324484, 1, 0.8627451, 0, 1,
-1.062849, -0.3728212, -0.1479716, 1, 0.8705882, 0, 1,
-1.061965, -0.03421372, -2.036309, 1, 0.8745098, 0, 1,
-1.060806, 0.4948278, 0.2231842, 1, 0.8823529, 0, 1,
-1.059927, -0.8588746, -2.975579, 1, 0.8862745, 0, 1,
-1.044459, 0.3353074, -1.874023, 1, 0.8941177, 0, 1,
-1.044228, -0.2074895, -3.46827, 1, 0.8980392, 0, 1,
-1.042487, 0.6890575, -1.684837, 1, 0.9058824, 0, 1,
-1.039003, -1.108116, -2.608354, 1, 0.9137255, 0, 1,
-1.033819, -0.03338326, -2.342752, 1, 0.9176471, 0, 1,
-1.028943, -0.3338053, -2.81382, 1, 0.9254902, 0, 1,
-1.024019, 1.082997, -0.5087587, 1, 0.9294118, 0, 1,
-1.023131, -2.663222, -2.638921, 1, 0.9372549, 0, 1,
-1.02032, -0.3098966, -2.331842, 1, 0.9411765, 0, 1,
-1.00847, 0.09449338, -2.026096, 1, 0.9490196, 0, 1,
-0.9962841, 0.04383135, -0.1397291, 1, 0.9529412, 0, 1,
-0.9897159, 0.4858458, -1.693204, 1, 0.9607843, 0, 1,
-0.988962, 0.7718951, -2.334677, 1, 0.9647059, 0, 1,
-0.9889412, 0.5117045, -3.528147, 1, 0.972549, 0, 1,
-0.9874292, -1.022449, -2.583678, 1, 0.9764706, 0, 1,
-0.9781565, 0.5949097, -0.5366671, 1, 0.9843137, 0, 1,
-0.9761372, -1.269632, -0.347184, 1, 0.9882353, 0, 1,
-0.9657722, 0.5553535, 0.2897341, 1, 0.9960784, 0, 1,
-0.9629279, 0.2799655, -0.8941423, 0.9960784, 1, 0, 1,
-0.9614712, -1.315165, -2.898947, 0.9921569, 1, 0, 1,
-0.9595354, -1.058933, -4.111037, 0.9843137, 1, 0, 1,
-0.9556105, 0.7073484, -1.127056, 0.9803922, 1, 0, 1,
-0.9518006, -0.9630893, -2.292809, 0.972549, 1, 0, 1,
-0.9505785, -0.2398774, -2.096342, 0.9686275, 1, 0, 1,
-0.9500356, -0.2192081, -2.194778, 0.9607843, 1, 0, 1,
-0.9381154, -0.8829914, -3.344159, 0.9568627, 1, 0, 1,
-0.9309197, 0.9714795, 0.9319773, 0.9490196, 1, 0, 1,
-0.9291946, 0.7030076, -0.6337059, 0.945098, 1, 0, 1,
-0.9282026, 0.4961998, -0.4877229, 0.9372549, 1, 0, 1,
-0.9231205, 0.1483319, 0.04085262, 0.9333333, 1, 0, 1,
-0.9196765, -0.6606799, -1.072962, 0.9254902, 1, 0, 1,
-0.9178916, -0.9126395, -1.261087, 0.9215686, 1, 0, 1,
-0.9177699, -1.945107, -2.924173, 0.9137255, 1, 0, 1,
-0.9139729, 0.8862556, 0.386333, 0.9098039, 1, 0, 1,
-0.910884, -0.6807824, -1.696262, 0.9019608, 1, 0, 1,
-0.9082323, -0.7455417, -3.357348, 0.8941177, 1, 0, 1,
-0.9048672, -0.06501395, -1.361745, 0.8901961, 1, 0, 1,
-0.9004245, 0.05942383, -2.288413, 0.8823529, 1, 0, 1,
-0.8992242, -0.3343836, -0.8957939, 0.8784314, 1, 0, 1,
-0.8945469, 2.125147, -0.3445349, 0.8705882, 1, 0, 1,
-0.8875277, 0.2713261, -0.4075428, 0.8666667, 1, 0, 1,
-0.8847606, 1.016088, -0.4044307, 0.8588235, 1, 0, 1,
-0.8765981, -0.2025011, -3.129697, 0.854902, 1, 0, 1,
-0.8705606, -0.4708919, -3.013772, 0.8470588, 1, 0, 1,
-0.8681079, -0.459821, -2.396907, 0.8431373, 1, 0, 1,
-0.8680331, 0.5107131, -0.399873, 0.8352941, 1, 0, 1,
-0.8640911, -1.781999, -2.700609, 0.8313726, 1, 0, 1,
-0.8613766, -0.3390876, -0.8279359, 0.8235294, 1, 0, 1,
-0.8606133, 0.5703714, -1.128898, 0.8196079, 1, 0, 1,
-0.8588849, 1.054465, -0.7487299, 0.8117647, 1, 0, 1,
-0.8476176, -0.07577766, -0.1634385, 0.8078431, 1, 0, 1,
-0.8474838, 0.7239789, -2.109477, 0.8, 1, 0, 1,
-0.8462654, -0.09315133, -2.981146, 0.7921569, 1, 0, 1,
-0.8458727, 1.491914, 1.110323, 0.7882353, 1, 0, 1,
-0.8423797, -0.3429656, -1.912501, 0.7803922, 1, 0, 1,
-0.8361639, 1.205694, -0.4518513, 0.7764706, 1, 0, 1,
-0.8343216, -0.8533009, -2.942347, 0.7686275, 1, 0, 1,
-0.8312629, 0.004783432, -1.02875, 0.7647059, 1, 0, 1,
-0.8222225, -2.133325, -2.488084, 0.7568628, 1, 0, 1,
-0.8190066, -0.08007194, -2.362128, 0.7529412, 1, 0, 1,
-0.8175967, -0.11311, -0.8970007, 0.7450981, 1, 0, 1,
-0.816771, 0.09922467, -0.8242432, 0.7411765, 1, 0, 1,
-0.816098, 1.016103, -1.158673, 0.7333333, 1, 0, 1,
-0.8123878, 0.6173872, 0.5451933, 0.7294118, 1, 0, 1,
-0.8101559, -1.35262, -2.454093, 0.7215686, 1, 0, 1,
-0.8072458, -0.03230109, -0.9952726, 0.7176471, 1, 0, 1,
-0.7994381, 0.4282489, -1.627716, 0.7098039, 1, 0, 1,
-0.7971315, 1.039862, -0.6298083, 0.7058824, 1, 0, 1,
-0.7930495, 0.7034128, -0.1920922, 0.6980392, 1, 0, 1,
-0.7915717, -1.357038, -0.5679843, 0.6901961, 1, 0, 1,
-0.7905771, -0.2587804, -2.183128, 0.6862745, 1, 0, 1,
-0.7893699, -0.4346553, -2.201597, 0.6784314, 1, 0, 1,
-0.7880393, -0.729519, -3.056148, 0.6745098, 1, 0, 1,
-0.7867128, -0.6548309, -1.494668, 0.6666667, 1, 0, 1,
-0.7614473, 1.06246, -1.044242, 0.6627451, 1, 0, 1,
-0.7555282, 0.3938481, -2.255008, 0.654902, 1, 0, 1,
-0.7539037, 0.4247436, -1.357028, 0.6509804, 1, 0, 1,
-0.7533218, 0.5932463, -0.7235995, 0.6431373, 1, 0, 1,
-0.7462453, 0.6126279, -1.396541, 0.6392157, 1, 0, 1,
-0.7434428, 1.549055, 0.08541731, 0.6313726, 1, 0, 1,
-0.7415654, -0.4556421, -3.210449, 0.627451, 1, 0, 1,
-0.7375329, 0.5098272, -1.827967, 0.6196079, 1, 0, 1,
-0.7371441, 1.666946, -0.8693814, 0.6156863, 1, 0, 1,
-0.7226713, 1.541059, -1.631226, 0.6078432, 1, 0, 1,
-0.7185826, -1.020712, -2.427657, 0.6039216, 1, 0, 1,
-0.710944, 2.25608, -0.2681804, 0.5960785, 1, 0, 1,
-0.7104691, -0.5677851, -1.210974, 0.5882353, 1, 0, 1,
-0.7026194, -1.434771, -2.462918, 0.5843138, 1, 0, 1,
-0.6997515, -1.341166, -1.504143, 0.5764706, 1, 0, 1,
-0.6961667, -0.1842851, -2.655463, 0.572549, 1, 0, 1,
-0.6903093, -0.4074889, -2.449986, 0.5647059, 1, 0, 1,
-0.689715, 0.06560063, -1.670578, 0.5607843, 1, 0, 1,
-0.6848802, -1.669054, -3.834269, 0.5529412, 1, 0, 1,
-0.6816932, -0.3114361, -2.06563, 0.5490196, 1, 0, 1,
-0.672698, -1.079513, -0.870195, 0.5411765, 1, 0, 1,
-0.672362, -2.845583, -2.677736, 0.5372549, 1, 0, 1,
-0.6650524, 1.631592, -2.305452, 0.5294118, 1, 0, 1,
-0.6609549, -1.584061, -3.491869, 0.5254902, 1, 0, 1,
-0.6601372, 0.3960761, -0.511006, 0.5176471, 1, 0, 1,
-0.6601139, 2.419954, -0.9034858, 0.5137255, 1, 0, 1,
-0.6578676, -0.3920552, -1.744289, 0.5058824, 1, 0, 1,
-0.6498763, -0.1264855, -2.110496, 0.5019608, 1, 0, 1,
-0.6492838, -1.430938, -2.032446, 0.4941176, 1, 0, 1,
-0.6488364, -0.7377437, -3.789276, 0.4862745, 1, 0, 1,
-0.64, -0.773985, -3.412515, 0.4823529, 1, 0, 1,
-0.6378554, -1.761855, -2.165956, 0.4745098, 1, 0, 1,
-0.6375965, -1.334893, -1.303604, 0.4705882, 1, 0, 1,
-0.6287418, 1.304932, 0.3961358, 0.4627451, 1, 0, 1,
-0.628686, -0.4151687, -3.171965, 0.4588235, 1, 0, 1,
-0.6277116, -0.4244987, -1.083852, 0.4509804, 1, 0, 1,
-0.6239491, 1.22569, -0.5371655, 0.4470588, 1, 0, 1,
-0.6234891, 0.7761852, -0.8950125, 0.4392157, 1, 0, 1,
-0.6163055, -1.549308, -2.24027, 0.4352941, 1, 0, 1,
-0.6143827, -0.9222795, -3.255276, 0.427451, 1, 0, 1,
-0.6134015, -2.260681, -3.177029, 0.4235294, 1, 0, 1,
-0.611877, -0.6317768, -1.732428, 0.4156863, 1, 0, 1,
-0.6064974, 0.01883392, -2.702027, 0.4117647, 1, 0, 1,
-0.6029696, -1.277371, -3.3027, 0.4039216, 1, 0, 1,
-0.6016068, 0.894089, 0.7801184, 0.3960784, 1, 0, 1,
-0.5995445, -1.673016, -4.413527, 0.3921569, 1, 0, 1,
-0.597245, -0.4454929, -1.293086, 0.3843137, 1, 0, 1,
-0.5966137, -0.8655115, -1.69487, 0.3803922, 1, 0, 1,
-0.5948147, 2.101059, -0.002844937, 0.372549, 1, 0, 1,
-0.5936865, 2.013061, -1.106674, 0.3686275, 1, 0, 1,
-0.5904492, -1.134831, -0.09538921, 0.3607843, 1, 0, 1,
-0.5866474, 0.5674075, -0.9347852, 0.3568628, 1, 0, 1,
-0.5834593, 1.786405, 0.8115487, 0.3490196, 1, 0, 1,
-0.58332, -0.2367083, -1.940792, 0.345098, 1, 0, 1,
-0.5825524, -0.03206679, -2.528879, 0.3372549, 1, 0, 1,
-0.5805609, -1.680376, -3.563725, 0.3333333, 1, 0, 1,
-0.5802227, -1.194888, -2.269178, 0.3254902, 1, 0, 1,
-0.579679, -0.4326635, -2.195796, 0.3215686, 1, 0, 1,
-0.5787628, -0.2887753, -2.958393, 0.3137255, 1, 0, 1,
-0.5769507, 1.390259, -2.762023, 0.3098039, 1, 0, 1,
-0.5755421, -1.227486, -2.887293, 0.3019608, 1, 0, 1,
-0.5716648, 1.386728, 0.2606436, 0.2941177, 1, 0, 1,
-0.5696086, -1.656936, -3.252516, 0.2901961, 1, 0, 1,
-0.5687457, 2.373901, 0.5764042, 0.282353, 1, 0, 1,
-0.5599722, 0.6016717, -0.005222753, 0.2784314, 1, 0, 1,
-0.5593419, 0.5378537, -1.407239, 0.2705882, 1, 0, 1,
-0.5585949, 1.071792, -0.03375722, 0.2666667, 1, 0, 1,
-0.5580201, -0.08596841, -3.591667, 0.2588235, 1, 0, 1,
-0.5524141, 0.8071226, 0.4599993, 0.254902, 1, 0, 1,
-0.5512574, 0.5569159, 0.6664629, 0.2470588, 1, 0, 1,
-0.549399, 2.29004, 0.4726607, 0.2431373, 1, 0, 1,
-0.5481905, 0.04745357, 0.8355228, 0.2352941, 1, 0, 1,
-0.5463386, 0.1774296, -0.6667174, 0.2313726, 1, 0, 1,
-0.5423813, 0.6852043, -0.8029879, 0.2235294, 1, 0, 1,
-0.5363051, -0.7197211, -3.42264, 0.2196078, 1, 0, 1,
-0.5314546, -0.7074914, -2.471529, 0.2117647, 1, 0, 1,
-0.528071, -1.174591, -2.255715, 0.2078431, 1, 0, 1,
-0.5260574, 1.364665, 1.595112, 0.2, 1, 0, 1,
-0.5249231, 1.361241, -3.022398, 0.1921569, 1, 0, 1,
-0.5248899, 0.3320795, 0.2622245, 0.1882353, 1, 0, 1,
-0.5237848, -0.4200359, -3.295295, 0.1803922, 1, 0, 1,
-0.5177172, -0.6187791, -2.731823, 0.1764706, 1, 0, 1,
-0.5130172, 0.9445135, 1.443773, 0.1686275, 1, 0, 1,
-0.5094415, -0.6963532, -3.079252, 0.1647059, 1, 0, 1,
-0.5080759, -0.3008238, -1.941993, 0.1568628, 1, 0, 1,
-0.5070243, -1.420083, -1.948846, 0.1529412, 1, 0, 1,
-0.50459, 0.5215876, -1.453808, 0.145098, 1, 0, 1,
-0.5000073, -0.4673059, -2.689848, 0.1411765, 1, 0, 1,
-0.4980982, -0.2138699, -2.305372, 0.1333333, 1, 0, 1,
-0.4977916, 0.05815344, -1.665456, 0.1294118, 1, 0, 1,
-0.4947383, -0.9179766, -1.615871, 0.1215686, 1, 0, 1,
-0.4930487, -0.06017363, -1.639966, 0.1176471, 1, 0, 1,
-0.4917719, -0.6568085, -1.851864, 0.1098039, 1, 0, 1,
-0.4848245, -0.6686359, -3.584394, 0.1058824, 1, 0, 1,
-0.48406, -1.966075, -0.158674, 0.09803922, 1, 0, 1,
-0.4791327, 1.153564, -0.1272326, 0.09019608, 1, 0, 1,
-0.4751514, -0.5715669, -3.695828, 0.08627451, 1, 0, 1,
-0.4748162, 0.1121974, -1.07868, 0.07843138, 1, 0, 1,
-0.4744503, 0.1042887, -0.2890746, 0.07450981, 1, 0, 1,
-0.4728919, 0.3504223, -1.746757, 0.06666667, 1, 0, 1,
-0.472576, 0.2652166, -1.506678, 0.0627451, 1, 0, 1,
-0.4716011, 0.1721875, -1.68926, 0.05490196, 1, 0, 1,
-0.4704915, -0.7093142, -2.543847, 0.05098039, 1, 0, 1,
-0.4647953, 2.610854, -0.1046472, 0.04313726, 1, 0, 1,
-0.4629858, -0.4251591, -0.884921, 0.03921569, 1, 0, 1,
-0.4627947, 1.132759, -1.171541, 0.03137255, 1, 0, 1,
-0.4544045, -0.4629597, -1.225486, 0.02745098, 1, 0, 1,
-0.450655, 1.534657, -0.07726508, 0.01960784, 1, 0, 1,
-0.448592, 0.2804745, -0.3608945, 0.01568628, 1, 0, 1,
-0.4410075, 0.1195886, -1.023373, 0.007843138, 1, 0, 1,
-0.4405509, 0.5388485, -0.131553, 0.003921569, 1, 0, 1,
-0.4404487, -0.5014287, -2.20978, 0, 1, 0.003921569, 1,
-0.4377638, -1.628998, -3.56745, 0, 1, 0.01176471, 1,
-0.4336736, 0.9332902, -0.4969759, 0, 1, 0.01568628, 1,
-0.4328726, 0.03509424, -1.259006, 0, 1, 0.02352941, 1,
-0.4313259, 1.857617, -0.5709611, 0, 1, 0.02745098, 1,
-0.4284211, 0.3826075, -0.5536295, 0, 1, 0.03529412, 1,
-0.428061, -0.5140356, -3.209728, 0, 1, 0.03921569, 1,
-0.4213674, -0.6328846, -1.967993, 0, 1, 0.04705882, 1,
-0.4210248, 1.410518, -0.8168596, 0, 1, 0.05098039, 1,
-0.4191499, 0.6874129, 0.8938823, 0, 1, 0.05882353, 1,
-0.4099563, 1.261561, -0.497443, 0, 1, 0.0627451, 1,
-0.4069778, 0.9514823, 0.8183679, 0, 1, 0.07058824, 1,
-0.4067168, -0.04281916, -0.9709833, 0, 1, 0.07450981, 1,
-0.402708, -1.282564, -2.838408, 0, 1, 0.08235294, 1,
-0.4006077, -0.5120063, -1.727093, 0, 1, 0.08627451, 1,
-0.3988106, -0.8052766, -0.2474151, 0, 1, 0.09411765, 1,
-0.398783, -1.247667, -2.05297, 0, 1, 0.1019608, 1,
-0.3958031, 0.6094098, -0.2506454, 0, 1, 0.1058824, 1,
-0.3942204, -2.207299, -2.870197, 0, 1, 0.1137255, 1,
-0.3938829, 1.784965, -0.7186209, 0, 1, 0.1176471, 1,
-0.3859614, -0.2908818, -2.792811, 0, 1, 0.1254902, 1,
-0.383252, 1.460213, -0.620636, 0, 1, 0.1294118, 1,
-0.3826946, -0.07880487, -0.9200425, 0, 1, 0.1372549, 1,
-0.3822744, -1.495699, -2.690743, 0, 1, 0.1411765, 1,
-0.3807334, 1.186979, -0.3948819, 0, 1, 0.1490196, 1,
-0.3765783, -0.02806754, -0.0704704, 0, 1, 0.1529412, 1,
-0.3715836, 0.2540618, -1.911624, 0, 1, 0.1607843, 1,
-0.3696082, -1.291576, -2.406363, 0, 1, 0.1647059, 1,
-0.3684637, -0.3848655, -4.026208, 0, 1, 0.172549, 1,
-0.3610379, -0.2481053, -0.2373577, 0, 1, 0.1764706, 1,
-0.3608763, -0.4419501, -1.365636, 0, 1, 0.1843137, 1,
-0.3595099, 0.01999874, -1.061845, 0, 1, 0.1882353, 1,
-0.3547131, -1.781582, -2.296677, 0, 1, 0.1960784, 1,
-0.3542323, -0.1888258, -3.137716, 0, 1, 0.2039216, 1,
-0.3492349, -0.3618878, -1.481336, 0, 1, 0.2078431, 1,
-0.3456492, -0.8254036, -3.114116, 0, 1, 0.2156863, 1,
-0.3454293, 2.262939, -0.255533, 0, 1, 0.2196078, 1,
-0.3421445, -0.3317367, -1.2052, 0, 1, 0.227451, 1,
-0.3411199, -2.268726, -2.309004, 0, 1, 0.2313726, 1,
-0.3366253, 0.6098889, -0.3909618, 0, 1, 0.2392157, 1,
-0.3351887, -0.2616152, 0.5258355, 0, 1, 0.2431373, 1,
-0.3311373, 0.04039653, 0.3108655, 0, 1, 0.2509804, 1,
-0.3299298, -1.136285, -4.63638, 0, 1, 0.254902, 1,
-0.329153, -0.1952771, -2.05292, 0, 1, 0.2627451, 1,
-0.3267972, -0.864785, -2.836948, 0, 1, 0.2666667, 1,
-0.323774, 0.7944562, -0.9637698, 0, 1, 0.2745098, 1,
-0.3234532, -0.5669863, -3.850269, 0, 1, 0.2784314, 1,
-0.3215248, 1.052554, 0.7590563, 0, 1, 0.2862745, 1,
-0.3205219, 1.227506, -0.8319517, 0, 1, 0.2901961, 1,
-0.3204835, -0.9984182, -2.575001, 0, 1, 0.2980392, 1,
-0.318342, -0.905055, -2.363651, 0, 1, 0.3058824, 1,
-0.3174419, 1.83743, 0.5916951, 0, 1, 0.3098039, 1,
-0.3166367, -0.8913007, -3.968513, 0, 1, 0.3176471, 1,
-0.3152534, -1.475366, -2.77219, 0, 1, 0.3215686, 1,
-0.3051781, -1.187011, -2.937282, 0, 1, 0.3294118, 1,
-0.2902681, 0.5590218, -1.327357, 0, 1, 0.3333333, 1,
-0.2810733, -0.4630033, -1.034638, 0, 1, 0.3411765, 1,
-0.2789111, -1.923898, -0.9589132, 0, 1, 0.345098, 1,
-0.2785815, -0.2250069, -1.01533, 0, 1, 0.3529412, 1,
-0.2764547, -1.258703, -2.514778, 0, 1, 0.3568628, 1,
-0.272629, 0.3795699, -0.2887661, 0, 1, 0.3647059, 1,
-0.2654095, 1.092542, -2.248553, 0, 1, 0.3686275, 1,
-0.2562698, 1.045887, -0.2712437, 0, 1, 0.3764706, 1,
-0.2520716, 0.2335508, -0.4519092, 0, 1, 0.3803922, 1,
-0.2514283, 1.299562, 2.070505, 0, 1, 0.3882353, 1,
-0.2471918, -0.7195551, -1.636071, 0, 1, 0.3921569, 1,
-0.2455448, 0.5188971, -0.5872179, 0, 1, 0.4, 1,
-0.2447488, 0.3511223, -1.288597, 0, 1, 0.4078431, 1,
-0.2433176, 0.5591971, 0.3433027, 0, 1, 0.4117647, 1,
-0.2389894, 0.1731527, 1.49848, 0, 1, 0.4196078, 1,
-0.2382826, -0.6102347, -3.727496, 0, 1, 0.4235294, 1,
-0.2375592, 0.7329124, -1.041479, 0, 1, 0.4313726, 1,
-0.2323172, -0.4869586, -2.970996, 0, 1, 0.4352941, 1,
-0.2309894, -2.523415, -3.857322, 0, 1, 0.4431373, 1,
-0.2296055, 0.1078175, 1.177881, 0, 1, 0.4470588, 1,
-0.2274234, 0.7778495, 1.708132, 0, 1, 0.454902, 1,
-0.2252597, -1.006369, -2.571657, 0, 1, 0.4588235, 1,
-0.2240808, -0.5421922, -4.046032, 0, 1, 0.4666667, 1,
-0.2189898, -1.803966, -1.989214, 0, 1, 0.4705882, 1,
-0.2167033, -1.804616, -3.090947, 0, 1, 0.4784314, 1,
-0.214527, -0.21526, -3.401203, 0, 1, 0.4823529, 1,
-0.2122754, 1.212526, 1.703117, 0, 1, 0.4901961, 1,
-0.2105903, -0.1483943, -1.081145, 0, 1, 0.4941176, 1,
-0.202154, 2.094345, -0.3256291, 0, 1, 0.5019608, 1,
-0.2017255, 0.3814519, -0.07422706, 0, 1, 0.509804, 1,
-0.1988665, -0.4757703, -3.76182, 0, 1, 0.5137255, 1,
-0.1933735, -0.6014454, -1.719982, 0, 1, 0.5215687, 1,
-0.1923017, 1.368879, 0.3677302, 0, 1, 0.5254902, 1,
-0.192278, 0.3881145, 1.449849, 0, 1, 0.5333334, 1,
-0.1907612, -0.5658649, -1.046779, 0, 1, 0.5372549, 1,
-0.1894877, 0.2016988, -1.346289, 0, 1, 0.5450981, 1,
-0.1868217, -0.664288, -3.146147, 0, 1, 0.5490196, 1,
-0.1809957, -1.678088, -3.449383, 0, 1, 0.5568628, 1,
-0.1749009, 0.134527, -0.1201984, 0, 1, 0.5607843, 1,
-0.1738589, -1.122944, -2.886522, 0, 1, 0.5686275, 1,
-0.1728487, -0.7928851, -2.119339, 0, 1, 0.572549, 1,
-0.1727698, 0.6697761, -0.912144, 0, 1, 0.5803922, 1,
-0.1686322, -1.139812, -3.45321, 0, 1, 0.5843138, 1,
-0.1663136, 1.003556, 0.5651127, 0, 1, 0.5921569, 1,
-0.1615657, -0.5875202, -3.913343, 0, 1, 0.5960785, 1,
-0.1603312, 1.097404, 0.7256513, 0, 1, 0.6039216, 1,
-0.1566047, -1.92036, -5.155097, 0, 1, 0.6117647, 1,
-0.1498604, 1.362944, 0.2515179, 0, 1, 0.6156863, 1,
-0.1433126, -0.9215508, -4.060805, 0, 1, 0.6235294, 1,
-0.1372026, -0.2614835, -2.481711, 0, 1, 0.627451, 1,
-0.1362375, 2.448753, 0.5787728, 0, 1, 0.6352941, 1,
-0.1339223, -1.296163, -1.782692, 0, 1, 0.6392157, 1,
-0.1295319, -0.04688811, -2.073638, 0, 1, 0.6470588, 1,
-0.1159618, -0.9237378, -3.133705, 0, 1, 0.6509804, 1,
-0.1145417, 0.6401259, -0.2199717, 0, 1, 0.6588235, 1,
-0.1092198, -0.6683649, -3.752561, 0, 1, 0.6627451, 1,
-0.1078959, 0.3875252, -0.6335732, 0, 1, 0.6705883, 1,
-0.1078382, 0.448074, -0.1317561, 0, 1, 0.6745098, 1,
-0.1062744, 0.9647204, -1.855801, 0, 1, 0.682353, 1,
-0.1015618, -0.3677711, -3.906959, 0, 1, 0.6862745, 1,
-0.09951474, -1.114103, -2.27304, 0, 1, 0.6941177, 1,
-0.09895945, -0.3058904, -2.704396, 0, 1, 0.7019608, 1,
-0.09400132, 2.498521, 1.895647, 0, 1, 0.7058824, 1,
-0.08667243, 1.898885, -0.339541, 0, 1, 0.7137255, 1,
-0.08654429, -1.866536, -3.866564, 0, 1, 0.7176471, 1,
-0.08470625, 0.7144753, -1.624109, 0, 1, 0.7254902, 1,
-0.08250179, 0.575473, 0.2221283, 0, 1, 0.7294118, 1,
-0.08159801, 0.8757784, -0.6750809, 0, 1, 0.7372549, 1,
-0.06894874, -0.02393995, -3.399813, 0, 1, 0.7411765, 1,
-0.06826973, 1.842878, -0.8989004, 0, 1, 0.7490196, 1,
-0.06263589, 1.021767, 0.5747634, 0, 1, 0.7529412, 1,
-0.06050899, -0.6595577, -4.993341, 0, 1, 0.7607843, 1,
-0.05552333, 1.704651, -2.066732, 0, 1, 0.7647059, 1,
-0.05142303, -1.25643, -2.193874, 0, 1, 0.772549, 1,
-0.04245061, -0.2308657, -2.160057, 0, 1, 0.7764706, 1,
-0.03852529, -0.6743977, -3.054449, 0, 1, 0.7843137, 1,
-0.03736199, -2.997449, -5.113733, 0, 1, 0.7882353, 1,
-0.03597271, -0.06406748, -4.350205, 0, 1, 0.7960784, 1,
-0.03330253, -1.304114, -4.016916, 0, 1, 0.8039216, 1,
-0.03135847, -0.2940197, -1.627203, 0, 1, 0.8078431, 1,
-0.03071604, 0.2716504, 0.2724261, 0, 1, 0.8156863, 1,
-0.02964421, 0.3035165, -0.4351322, 0, 1, 0.8196079, 1,
-0.02921041, -0.09294312, -1.768188, 0, 1, 0.827451, 1,
-0.02827672, 0.3138247, 1.67466, 0, 1, 0.8313726, 1,
-0.02663116, 0.9502212, -0.5176928, 0, 1, 0.8392157, 1,
-0.01680647, -0.4439673, -4.10877, 0, 1, 0.8431373, 1,
-0.01585978, -0.4757496, -3.124476, 0, 1, 0.8509804, 1,
-0.01569418, 0.08947353, -0.230327, 0, 1, 0.854902, 1,
-0.01251167, -0.826528, -3.921264, 0, 1, 0.8627451, 1,
-0.01151999, 0.3793842, -1.005793, 0, 1, 0.8666667, 1,
-0.01107782, 0.1029123, -0.27796, 0, 1, 0.8745098, 1,
-0.01071896, 0.6766477, 0.8827589, 0, 1, 0.8784314, 1,
-0.007714712, 0.8764597, 0.6424637, 0, 1, 0.8862745, 1,
-0.004536728, 0.2350307, 1.366124, 0, 1, 0.8901961, 1,
-0.001526928, -1.835992, -3.313525, 0, 1, 0.8980392, 1,
-0.0007147493, 0.4044372, -0.5963878, 0, 1, 0.9058824, 1,
0.003437031, 1.307562, -0.8527752, 0, 1, 0.9098039, 1,
0.00777481, 1.105577, -1.927988, 0, 1, 0.9176471, 1,
0.007919668, 0.2108864, -1.905012, 0, 1, 0.9215686, 1,
0.009436373, 0.003953656, 0.8181678, 0, 1, 0.9294118, 1,
0.0137096, 0.6470033, -0.2681564, 0, 1, 0.9333333, 1,
0.01382867, 1.446367, -0.1095024, 0, 1, 0.9411765, 1,
0.01395497, -0.2129872, 3.463967, 0, 1, 0.945098, 1,
0.01477213, 0.5003576, -0.6278661, 0, 1, 0.9529412, 1,
0.02112373, 0.5009645, 0.5671661, 0, 1, 0.9568627, 1,
0.02135379, -0.3977719, 2.900203, 0, 1, 0.9647059, 1,
0.0237699, -0.3961731, 1.741968, 0, 1, 0.9686275, 1,
0.02442134, 0.7477016, 0.805383, 0, 1, 0.9764706, 1,
0.02714573, -0.301443, 4.116607, 0, 1, 0.9803922, 1,
0.02923432, -0.2765552, 3.361712, 0, 1, 0.9882353, 1,
0.03220493, -0.8518141, 2.36413, 0, 1, 0.9921569, 1,
0.03843825, -0.6887481, 3.073833, 0, 1, 1, 1,
0.04110764, -1.815374, 2.970854, 0, 0.9921569, 1, 1,
0.04224869, -0.1472602, -0.1862703, 0, 0.9882353, 1, 1,
0.04537837, -0.01920986, 3.161617, 0, 0.9803922, 1, 1,
0.04808796, -0.6005467, 4.630306, 0, 0.9764706, 1, 1,
0.04850389, -0.9906518, 2.194963, 0, 0.9686275, 1, 1,
0.04855353, -1.242214, 1.896455, 0, 0.9647059, 1, 1,
0.05298891, -0.2651635, 3.82037, 0, 0.9568627, 1, 1,
0.05473399, -0.3675203, 4.502264, 0, 0.9529412, 1, 1,
0.05598444, 1.502392, -1.042792, 0, 0.945098, 1, 1,
0.05626207, -0.4892517, 4.075706, 0, 0.9411765, 1, 1,
0.05866723, -0.6159669, 2.014062, 0, 0.9333333, 1, 1,
0.06205326, -0.6454268, 3.158581, 0, 0.9294118, 1, 1,
0.06322504, 1.570878, 0.5000476, 0, 0.9215686, 1, 1,
0.06382948, 0.2582406, -0.3589346, 0, 0.9176471, 1, 1,
0.06533182, 0.8084666, -0.5466096, 0, 0.9098039, 1, 1,
0.06573643, -0.3215035, 1.760038, 0, 0.9058824, 1, 1,
0.06969014, -0.8717342, 4.044038, 0, 0.8980392, 1, 1,
0.07402034, 0.7808473, 0.521099, 0, 0.8901961, 1, 1,
0.07553967, -1.450498, 3.721956, 0, 0.8862745, 1, 1,
0.07666195, 0.3360672, 1.639542, 0, 0.8784314, 1, 1,
0.07973924, -0.1013911, 2.83687, 0, 0.8745098, 1, 1,
0.08108346, -2.191989, 2.660942, 0, 0.8666667, 1, 1,
0.08123157, -0.658933, 2.203128, 0, 0.8627451, 1, 1,
0.082519, -0.8829594, 3.504635, 0, 0.854902, 1, 1,
0.08458193, 1.052332, -0.9140353, 0, 0.8509804, 1, 1,
0.08530911, -0.3327958, 3.80218, 0, 0.8431373, 1, 1,
0.08594409, -0.7460341, 4.408412, 0, 0.8392157, 1, 1,
0.09451742, -0.194283, 3.796248, 0, 0.8313726, 1, 1,
0.09519075, 0.2152902, 0.3692579, 0, 0.827451, 1, 1,
0.09729017, 1.4782, 1.409201, 0, 0.8196079, 1, 1,
0.1025098, 0.03059057, 3.385483, 0, 0.8156863, 1, 1,
0.1027367, -2.634617, 3.465719, 0, 0.8078431, 1, 1,
0.1081506, 0.4660772, 0.8662702, 0, 0.8039216, 1, 1,
0.1104044, -0.8633223, 3.31223, 0, 0.7960784, 1, 1,
0.1118097, -0.1313961, 2.851997, 0, 0.7882353, 1, 1,
0.1154444, -0.01827293, 2.25492, 0, 0.7843137, 1, 1,
0.1201603, -0.04783398, 1.350293, 0, 0.7764706, 1, 1,
0.1233694, -0.7385459, 3.80158, 0, 0.772549, 1, 1,
0.125683, -0.4060681, 3.980334, 0, 0.7647059, 1, 1,
0.1295337, 0.5019541, -1.092936, 0, 0.7607843, 1, 1,
0.1338719, 1.454975, -0.3620625, 0, 0.7529412, 1, 1,
0.1340595, 0.6512558, 0.7658168, 0, 0.7490196, 1, 1,
0.1376466, -0.8099449, 2.444407, 0, 0.7411765, 1, 1,
0.1412179, -2.167973, 2.484504, 0, 0.7372549, 1, 1,
0.1425382, 1.487535, 0.9859603, 0, 0.7294118, 1, 1,
0.1438446, 0.6813444, 1.275962, 0, 0.7254902, 1, 1,
0.1455994, 0.8093742, -0.4304292, 0, 0.7176471, 1, 1,
0.146885, -0.4475115, 3.898493, 0, 0.7137255, 1, 1,
0.150912, -0.8463776, 3.877443, 0, 0.7058824, 1, 1,
0.1513143, 1.189672, 1.206442, 0, 0.6980392, 1, 1,
0.1515288, -0.5797337, 2.789518, 0, 0.6941177, 1, 1,
0.1532566, -1.139885, 3.054595, 0, 0.6862745, 1, 1,
0.1580004, 1.888049, -0.6421649, 0, 0.682353, 1, 1,
0.1601975, 1.936015, -0.0839025, 0, 0.6745098, 1, 1,
0.1662675, 0.9903605, -0.8743201, 0, 0.6705883, 1, 1,
0.1669703, -0.4805652, 3.080555, 0, 0.6627451, 1, 1,
0.1681058, 0.0292365, 2.190757, 0, 0.6588235, 1, 1,
0.1691066, -1.149819, 3.439126, 0, 0.6509804, 1, 1,
0.1692805, 1.720787, 0.4219108, 0, 0.6470588, 1, 1,
0.1706607, -0.4015629, 1.343121, 0, 0.6392157, 1, 1,
0.1729452, 0.1034929, 0.1934521, 0, 0.6352941, 1, 1,
0.1763912, -0.9245054, 0.9206199, 0, 0.627451, 1, 1,
0.1790252, -1.570856, 3.756776, 0, 0.6235294, 1, 1,
0.1831198, -0.3886277, 3.300293, 0, 0.6156863, 1, 1,
0.1872075, 2.111681, -0.4360669, 0, 0.6117647, 1, 1,
0.1898636, -0.73734, 2.902152, 0, 0.6039216, 1, 1,
0.1903793, 0.4116043, -0.004896331, 0, 0.5960785, 1, 1,
0.1924453, 1.257077, 0.3912489, 0, 0.5921569, 1, 1,
0.1937914, -0.8451695, 3.28423, 0, 0.5843138, 1, 1,
0.1948021, 2.10631, -0.9681335, 0, 0.5803922, 1, 1,
0.1957281, -0.06762158, 2.070628, 0, 0.572549, 1, 1,
0.2065066, 1.099796, 0.3755426, 0, 0.5686275, 1, 1,
0.2085229, -0.3311093, 1.633247, 0, 0.5607843, 1, 1,
0.208803, 1.539366, -1.476068, 0, 0.5568628, 1, 1,
0.2112515, 2.876871, 0.8481826, 0, 0.5490196, 1, 1,
0.2118637, -1.204698, 3.085533, 0, 0.5450981, 1, 1,
0.2129965, -1.240846, 3.572485, 0, 0.5372549, 1, 1,
0.2135635, -0.3312453, 2.019887, 0, 0.5333334, 1, 1,
0.2138009, -0.5010827, 2.709566, 0, 0.5254902, 1, 1,
0.2155115, 0.4459926, 0.796831, 0, 0.5215687, 1, 1,
0.2166714, 1.947858, -0.1337777, 0, 0.5137255, 1, 1,
0.2194007, -0.9082235, 1.744072, 0, 0.509804, 1, 1,
0.2241373, 1.306273, 1.847593, 0, 0.5019608, 1, 1,
0.2321875, -0.455123, 1.48545, 0, 0.4941176, 1, 1,
0.2347794, -2.126979, 4.403225, 0, 0.4901961, 1, 1,
0.2377727, 0.3002471, 0.08312254, 0, 0.4823529, 1, 1,
0.2401462, 0.3981063, -0.04158085, 0, 0.4784314, 1, 1,
0.2451577, -0.4953112, 1.944747, 0, 0.4705882, 1, 1,
0.248857, 1.066134, 0.09134319, 0, 0.4666667, 1, 1,
0.2497088, 0.5239838, -0.9827187, 0, 0.4588235, 1, 1,
0.2498699, 0.4571198, 0.617536, 0, 0.454902, 1, 1,
0.252607, 2.38717, 0.8202279, 0, 0.4470588, 1, 1,
0.2603664, -0.5688883, 3.174328, 0, 0.4431373, 1, 1,
0.2622063, -1.242366, 2.916147, 0, 0.4352941, 1, 1,
0.2656243, 1.119324, 0.7509778, 0, 0.4313726, 1, 1,
0.269702, 1.359171, 0.9663588, 0, 0.4235294, 1, 1,
0.2734579, 1.020889, 0.3698906, 0, 0.4196078, 1, 1,
0.2744013, -0.05600873, 1.090106, 0, 0.4117647, 1, 1,
0.2749043, -0.591664, 0.9203348, 0, 0.4078431, 1, 1,
0.2758847, -0.2680773, 1.822077, 0, 0.4, 1, 1,
0.2763421, 0.7854322, 1.52521, 0, 0.3921569, 1, 1,
0.277477, -2.316891, 2.503814, 0, 0.3882353, 1, 1,
0.2788602, 0.1332414, 3.254459, 0, 0.3803922, 1, 1,
0.2801608, -1.029614, 3.22932, 0, 0.3764706, 1, 1,
0.2858185, 0.8553565, -0.9574393, 0, 0.3686275, 1, 1,
0.2861524, -0.6186939, 2.318737, 0, 0.3647059, 1, 1,
0.287601, -1.411701, 3.888752, 0, 0.3568628, 1, 1,
0.2908585, -1.345904, 3.380507, 0, 0.3529412, 1, 1,
0.2965815, -1.336389, 2.030297, 0, 0.345098, 1, 1,
0.2977822, 0.5840347, -0.5767223, 0, 0.3411765, 1, 1,
0.2978284, -1.251051, 1.428297, 0, 0.3333333, 1, 1,
0.3024323, 1.304312, 1.687691, 0, 0.3294118, 1, 1,
0.3072245, -1.753457, 3.430986, 0, 0.3215686, 1, 1,
0.3078576, -0.05788643, 1.762782, 0, 0.3176471, 1, 1,
0.3136989, 0.7166444, 0.1244862, 0, 0.3098039, 1, 1,
0.3152955, 0.04879426, 2.383635, 0, 0.3058824, 1, 1,
0.3173527, -0.5683049, 2.10588, 0, 0.2980392, 1, 1,
0.3179286, -0.4214632, 1.493369, 0, 0.2901961, 1, 1,
0.318145, 0.01863411, 2.295054, 0, 0.2862745, 1, 1,
0.3270365, -0.2107658, 0.6526932, 0, 0.2784314, 1, 1,
0.3283164, -0.262667, 2.647734, 0, 0.2745098, 1, 1,
0.3294051, -0.202996, 3.482891, 0, 0.2666667, 1, 1,
0.3314306, -1.411497, 2.207468, 0, 0.2627451, 1, 1,
0.3330862, 0.8278875, -0.134141, 0, 0.254902, 1, 1,
0.3347591, 0.2533181, 1.482297, 0, 0.2509804, 1, 1,
0.3387802, -0.0662457, 1.055713, 0, 0.2431373, 1, 1,
0.3394289, -0.07844, 1.551171, 0, 0.2392157, 1, 1,
0.3425133, 0.6005354, -0.09275242, 0, 0.2313726, 1, 1,
0.3483184, 1.713775, 0.3809107, 0, 0.227451, 1, 1,
0.3486285, 0.7896205, -1.068937, 0, 0.2196078, 1, 1,
0.3559861, -0.2267484, 2.672795, 0, 0.2156863, 1, 1,
0.3602579, -0.2532334, 2.730902, 0, 0.2078431, 1, 1,
0.3605237, -0.2592983, 1.450763, 0, 0.2039216, 1, 1,
0.3613971, 0.3823387, -0.3492134, 0, 0.1960784, 1, 1,
0.3616414, -0.6296549, 1.080179, 0, 0.1882353, 1, 1,
0.3657427, 2.358065, 0.814814, 0, 0.1843137, 1, 1,
0.3693716, 1.132365, 0.9995114, 0, 0.1764706, 1, 1,
0.3721923, -0.1301433, 1.940493, 0, 0.172549, 1, 1,
0.3748208, 0.9109952, 1.052053, 0, 0.1647059, 1, 1,
0.3754861, 2.013943, -0.9116014, 0, 0.1607843, 1, 1,
0.3762201, 1.61237, 1.596288, 0, 0.1529412, 1, 1,
0.377036, -0.6120877, 4.155169, 0, 0.1490196, 1, 1,
0.3812271, -0.00852181, 2.076806, 0, 0.1411765, 1, 1,
0.3813249, 0.3363674, 2.225648, 0, 0.1372549, 1, 1,
0.3824407, -0.2176437, 1.968855, 0, 0.1294118, 1, 1,
0.3853333, -0.8764324, 2.702978, 0, 0.1254902, 1, 1,
0.3875913, 1.247501, 1.394366, 0, 0.1176471, 1, 1,
0.390409, -0.8247765, 4.478064, 0, 0.1137255, 1, 1,
0.3913583, -0.8973941, 2.683399, 0, 0.1058824, 1, 1,
0.3934412, -1.032598, 2.885473, 0, 0.09803922, 1, 1,
0.3968036, -0.1183278, 2.160375, 0, 0.09411765, 1, 1,
0.3991039, 1.13613, -0.8058597, 0, 0.08627451, 1, 1,
0.4013979, 0.1571825, 0.9469653, 0, 0.08235294, 1, 1,
0.4017851, -0.9252339, 0.9015453, 0, 0.07450981, 1, 1,
0.4025251, -1.847876, 3.247326, 0, 0.07058824, 1, 1,
0.4075097, -0.7190629, 1.412448, 0, 0.0627451, 1, 1,
0.4084366, -0.7881382, 1.927476, 0, 0.05882353, 1, 1,
0.4094335, -0.9171704, 3.85287, 0, 0.05098039, 1, 1,
0.4109567, -0.4041533, 1.184211, 0, 0.04705882, 1, 1,
0.4166165, 1.801865, -0.7825164, 0, 0.03921569, 1, 1,
0.4173645, 0.4029482, 0.4583207, 0, 0.03529412, 1, 1,
0.4176, 0.502685, 1.056913, 0, 0.02745098, 1, 1,
0.4191389, 2.190216, 1.602604, 0, 0.02352941, 1, 1,
0.4209354, -0.5029395, 2.520512, 0, 0.01568628, 1, 1,
0.4228529, -2.475029, 2.400534, 0, 0.01176471, 1, 1,
0.4239417, -0.3811141, 2.653874, 0, 0.003921569, 1, 1,
0.4255389, -0.2343885, 2.591575, 0.003921569, 0, 1, 1,
0.4272785, 0.952382, -0.2795606, 0.007843138, 0, 1, 1,
0.427312, -0.1024929, 1.763664, 0.01568628, 0, 1, 1,
0.4280294, 0.02270883, 1.585056, 0.01960784, 0, 1, 1,
0.4290408, -1.736943, 3.188901, 0.02745098, 0, 1, 1,
0.4302657, -0.2291977, 3.397148, 0.03137255, 0, 1, 1,
0.4344582, 0.05536515, -0.6112169, 0.03921569, 0, 1, 1,
0.4423127, -0.4440504, 0.2285384, 0.04313726, 0, 1, 1,
0.4436209, -0.03340905, 2.115151, 0.05098039, 0, 1, 1,
0.4480565, -0.1764754, 2.959828, 0.05490196, 0, 1, 1,
0.4565719, 0.2591371, 0.1179422, 0.0627451, 0, 1, 1,
0.456938, -0.1584502, 2.171734, 0.06666667, 0, 1, 1,
0.459287, -0.4568012, 1.798216, 0.07450981, 0, 1, 1,
0.4594508, -0.3997197, 2.157196, 0.07843138, 0, 1, 1,
0.464839, 0.6226413, -2.312203, 0.08627451, 0, 1, 1,
0.4656629, 0.6203749, 0.7980326, 0.09019608, 0, 1, 1,
0.4665097, -0.351954, 1.798968, 0.09803922, 0, 1, 1,
0.4695503, 0.5158485, 2.725155, 0.1058824, 0, 1, 1,
0.4715669, 0.2717158, 0.7917028, 0.1098039, 0, 1, 1,
0.4786, -0.3754879, 2.756676, 0.1176471, 0, 1, 1,
0.4803992, 0.8005418, 0.05051265, 0.1215686, 0, 1, 1,
0.4815656, -0.563302, 2.664129, 0.1294118, 0, 1, 1,
0.4831892, 1.561379, -0.6494835, 0.1333333, 0, 1, 1,
0.4875752, -1.655981, 3.392038, 0.1411765, 0, 1, 1,
0.4890557, 1.464223, 0.3619848, 0.145098, 0, 1, 1,
0.4899802, 1.045957, 0.8168916, 0.1529412, 0, 1, 1,
0.4932931, 0.07341383, 0.568053, 0.1568628, 0, 1, 1,
0.4972578, 1.18494, -0.6681533, 0.1647059, 0, 1, 1,
0.4983126, 0.3566079, 1.476968, 0.1686275, 0, 1, 1,
0.4994354, -0.02767145, 1.714802, 0.1764706, 0, 1, 1,
0.4997394, 0.1523326, 0.8110363, 0.1803922, 0, 1, 1,
0.5013487, 0.1580864, 2.264799, 0.1882353, 0, 1, 1,
0.5024751, -0.2115072, 3.175936, 0.1921569, 0, 1, 1,
0.502687, 0.1171135, 1.615386, 0.2, 0, 1, 1,
0.503472, -0.1167374, 2.412944, 0.2078431, 0, 1, 1,
0.5048548, -0.8116172, 4.132277, 0.2117647, 0, 1, 1,
0.5097897, 0.1839266, 1.854605, 0.2196078, 0, 1, 1,
0.5135534, 0.05155932, 3.336598, 0.2235294, 0, 1, 1,
0.5167572, -0.1471, 1.447842, 0.2313726, 0, 1, 1,
0.5186781, -0.3056849, 0.4530909, 0.2352941, 0, 1, 1,
0.5202281, -0.3603972, 3.012821, 0.2431373, 0, 1, 1,
0.5202572, 0.1185751, 2.588955, 0.2470588, 0, 1, 1,
0.5228341, -0.2421901, 2.849703, 0.254902, 0, 1, 1,
0.5254787, -0.8429019, 2.964987, 0.2588235, 0, 1, 1,
0.5286398, -0.2563404, 3.320374, 0.2666667, 0, 1, 1,
0.5382181, -1.840495, 2.982899, 0.2705882, 0, 1, 1,
0.5419989, 1.329905, 0.350633, 0.2784314, 0, 1, 1,
0.543283, 0.1956062, 2.467326, 0.282353, 0, 1, 1,
0.54713, -1.323942, 2.408135, 0.2901961, 0, 1, 1,
0.5511682, -1.034607, 3.481372, 0.2941177, 0, 1, 1,
0.5541937, -0.1693256, 1.84762, 0.3019608, 0, 1, 1,
0.5578556, -0.3436963, 2.301701, 0.3098039, 0, 1, 1,
0.5593086, -0.7678889, 2.479345, 0.3137255, 0, 1, 1,
0.5595908, -0.9676572, 3.806242, 0.3215686, 0, 1, 1,
0.5611019, 1.261615, 0.7323335, 0.3254902, 0, 1, 1,
0.5671492, 0.0754768, 2.345533, 0.3333333, 0, 1, 1,
0.5722482, 1.33285, -0.1784162, 0.3372549, 0, 1, 1,
0.5729181, -0.8106984, 2.086957, 0.345098, 0, 1, 1,
0.5732581, -0.979654, 2.088042, 0.3490196, 0, 1, 1,
0.5732926, -0.9123994, 3.291257, 0.3568628, 0, 1, 1,
0.5764631, 0.04117569, -0.007372081, 0.3607843, 0, 1, 1,
0.5794176, 0.7594414, 0.5609984, 0.3686275, 0, 1, 1,
0.58141, -1.196925, 3.082963, 0.372549, 0, 1, 1,
0.5838611, -0.01738869, 0.6808012, 0.3803922, 0, 1, 1,
0.5843873, 0.7809752, 0.04494575, 0.3843137, 0, 1, 1,
0.5846167, 1.537921, -0.06942229, 0.3921569, 0, 1, 1,
0.5851197, 1.477872, 0.550317, 0.3960784, 0, 1, 1,
0.5854265, 1.116766, 1.282817, 0.4039216, 0, 1, 1,
0.5855717, 0.2246365, 2.068399, 0.4117647, 0, 1, 1,
0.5879695, -1.401498, 2.337187, 0.4156863, 0, 1, 1,
0.5913371, -0.9446062, 3.182929, 0.4235294, 0, 1, 1,
0.5976245, -1.259748, 4.88001, 0.427451, 0, 1, 1,
0.5989821, 0.1088264, 1.164901, 0.4352941, 0, 1, 1,
0.6020809, 1.191808, -1.332186, 0.4392157, 0, 1, 1,
0.602791, -0.266284, 0.9600017, 0.4470588, 0, 1, 1,
0.6063358, -2.138008, 0.6805977, 0.4509804, 0, 1, 1,
0.6210731, 1.342135, -0.9679957, 0.4588235, 0, 1, 1,
0.6263441, 0.3912764, 0.8186888, 0.4627451, 0, 1, 1,
0.6268421, -0.2571422, 2.475516, 0.4705882, 0, 1, 1,
0.6328456, 0.7559964, 1.096587, 0.4745098, 0, 1, 1,
0.6371291, -0.714512, 1.871873, 0.4823529, 0, 1, 1,
0.6390636, -0.3819337, 2.149126, 0.4862745, 0, 1, 1,
0.6425757, 0.2056405, 1.987822, 0.4941176, 0, 1, 1,
0.6448297, 0.09654938, 2.630982, 0.5019608, 0, 1, 1,
0.646814, 0.002877037, 1.654953, 0.5058824, 0, 1, 1,
0.6469409, -0.674364, 1.277471, 0.5137255, 0, 1, 1,
0.6473649, 0.6071849, 1.548643, 0.5176471, 0, 1, 1,
0.6532331, -1.362633, 4.195249, 0.5254902, 0, 1, 1,
0.6566274, -0.4093473, 1.067116, 0.5294118, 0, 1, 1,
0.6576697, -1.392829, 2.239117, 0.5372549, 0, 1, 1,
0.6608341, 1.314586, -0.4047104, 0.5411765, 0, 1, 1,
0.664455, 0.4620675, 0.2958141, 0.5490196, 0, 1, 1,
0.6719013, -0.7899079, 3.492777, 0.5529412, 0, 1, 1,
0.6761488, 0.7256496, 0.6801249, 0.5607843, 0, 1, 1,
0.6762567, 1.722829, 1.685878, 0.5647059, 0, 1, 1,
0.6768517, 0.2565198, 2.785255, 0.572549, 0, 1, 1,
0.6932618, -0.5167348, 3.019202, 0.5764706, 0, 1, 1,
0.6967224, -0.7550019, 2.651415, 0.5843138, 0, 1, 1,
0.7009901, -0.1918302, 1.661962, 0.5882353, 0, 1, 1,
0.7010963, -0.7951798, 2.870709, 0.5960785, 0, 1, 1,
0.7039973, 0.4230925, -0.02763421, 0.6039216, 0, 1, 1,
0.7040444, -1.00423, 3.101083, 0.6078432, 0, 1, 1,
0.7088394, -0.6804184, 3.377676, 0.6156863, 0, 1, 1,
0.7208262, -0.7698151, 3.448251, 0.6196079, 0, 1, 1,
0.7255145, -0.6344752, 2.822211, 0.627451, 0, 1, 1,
0.728569, -0.01553714, 2.27975, 0.6313726, 0, 1, 1,
0.7294825, -1.024899, 1.459557, 0.6392157, 0, 1, 1,
0.7318754, 0.6511597, 0.9454135, 0.6431373, 0, 1, 1,
0.7359006, -1.122957, 0.6793797, 0.6509804, 0, 1, 1,
0.7376329, -0.6409038, 0.5060582, 0.654902, 0, 1, 1,
0.7384778, -0.1900093, 1.408751, 0.6627451, 0, 1, 1,
0.7397864, 0.6043177, 0.8969591, 0.6666667, 0, 1, 1,
0.7399415, 0.3512919, 1.935447, 0.6745098, 0, 1, 1,
0.7449464, 1.125286, 2.084121, 0.6784314, 0, 1, 1,
0.7478058, 1.28139, 1.837669, 0.6862745, 0, 1, 1,
0.7534241, 0.5650538, 1.284431, 0.6901961, 0, 1, 1,
0.7548044, -0.1398782, 3.767546, 0.6980392, 0, 1, 1,
0.757103, -0.9574949, 1.732159, 0.7058824, 0, 1, 1,
0.7584915, -1.351729, 4.116902, 0.7098039, 0, 1, 1,
0.7600583, 0.8597309, -0.2189672, 0.7176471, 0, 1, 1,
0.761229, 0.5413829, 0.2868824, 0.7215686, 0, 1, 1,
0.7648497, 0.09848086, 0.2322112, 0.7294118, 0, 1, 1,
0.7692567, -1.859306, 2.585888, 0.7333333, 0, 1, 1,
0.7778901, 1.357527, -0.9666762, 0.7411765, 0, 1, 1,
0.780005, -1.388847, 1.597817, 0.7450981, 0, 1, 1,
0.7852251, 1.114975, 0.5721447, 0.7529412, 0, 1, 1,
0.789189, -0.5551572, 2.617033, 0.7568628, 0, 1, 1,
0.7953738, -0.1310608, 2.896654, 0.7647059, 0, 1, 1,
0.7969815, 0.4658077, 2.219965, 0.7686275, 0, 1, 1,
0.7986584, 2.457484, -1.338688, 0.7764706, 0, 1, 1,
0.8115984, 0.5924398, 0.4439358, 0.7803922, 0, 1, 1,
0.8144559, -0.3698331, 2.799651, 0.7882353, 0, 1, 1,
0.8145431, -0.3899755, 1.400201, 0.7921569, 0, 1, 1,
0.8188006, -0.2789318, 2.196736, 0.8, 0, 1, 1,
0.819812, 0.2644472, 0.5565133, 0.8078431, 0, 1, 1,
0.8257623, 1.083344, 0.3660562, 0.8117647, 0, 1, 1,
0.8263479, 1.473769, 0.8969038, 0.8196079, 0, 1, 1,
0.826553, 0.920841, 2.297717, 0.8235294, 0, 1, 1,
0.8273879, 1.020552, -0.3558809, 0.8313726, 0, 1, 1,
0.8282855, 0.5180018, 1.263256, 0.8352941, 0, 1, 1,
0.8361493, 1.148831, 1.944327, 0.8431373, 0, 1, 1,
0.8370402, -2.052532, 2.539433, 0.8470588, 0, 1, 1,
0.8384571, 0.7498695, 1.853582, 0.854902, 0, 1, 1,
0.8409047, 0.3098306, 0.215443, 0.8588235, 0, 1, 1,
0.8417965, 0.3905927, 0.08268242, 0.8666667, 0, 1, 1,
0.8457513, 1.623582, 1.414086, 0.8705882, 0, 1, 1,
0.8514147, -0.03706168, 2.034373, 0.8784314, 0, 1, 1,
0.8520052, 0.4136729, 0.2691724, 0.8823529, 0, 1, 1,
0.8741612, -1.291906, 1.714912, 0.8901961, 0, 1, 1,
0.8752912, -0.4583928, 2.969357, 0.8941177, 0, 1, 1,
0.8781269, -0.5359237, 0.6063894, 0.9019608, 0, 1, 1,
0.8788185, 0.7755108, 0.7026474, 0.9098039, 0, 1, 1,
0.8837672, 0.187135, 1.914816, 0.9137255, 0, 1, 1,
0.8989265, 0.6709647, 1.269134, 0.9215686, 0, 1, 1,
0.899079, -1.402872, 1.540354, 0.9254902, 0, 1, 1,
0.8999729, -0.03547559, 2.747374, 0.9333333, 0, 1, 1,
0.9062589, 0.2480353, 1.440654, 0.9372549, 0, 1, 1,
0.906907, 0.8081055, 0.7953027, 0.945098, 0, 1, 1,
0.9074767, 0.8908598, 1.006961, 0.9490196, 0, 1, 1,
0.9102017, -0.4001455, 0.364888, 0.9568627, 0, 1, 1,
0.913514, -1.235855, 1.467099, 0.9607843, 0, 1, 1,
0.9136708, 0.2038927, 0.5649689, 0.9686275, 0, 1, 1,
0.9176842, 0.9418814, 0.08767565, 0.972549, 0, 1, 1,
0.9187112, -0.1520088, 1.843834, 0.9803922, 0, 1, 1,
0.9202342, -0.2905796, 1.394763, 0.9843137, 0, 1, 1,
0.9240898, 0.4083245, 1.09236, 0.9921569, 0, 1, 1,
0.9255898, 0.8089692, 2.22523, 0.9960784, 0, 1, 1,
0.9272212, -0.5418535, 0.9006171, 1, 0, 0.9960784, 1,
0.933532, 0.904389, -0.6663402, 1, 0, 0.9882353, 1,
0.9339963, -1.18584, 3.400809, 1, 0, 0.9843137, 1,
0.9350283, -1.83826, 3.465458, 1, 0, 0.9764706, 1,
0.9368345, -0.6817275, 2.046309, 1, 0, 0.972549, 1,
0.9427276, -0.08412993, -0.76493, 1, 0, 0.9647059, 1,
0.9599552, 0.4548076, 0.5631856, 1, 0, 0.9607843, 1,
0.9696012, -0.6003509, 3.301687, 1, 0, 0.9529412, 1,
0.9710419, 2.209851, -1.913542, 1, 0, 0.9490196, 1,
0.973459, -0.9808688, 2.450873, 1, 0, 0.9411765, 1,
0.9743601, -0.3136152, 2.612676, 1, 0, 0.9372549, 1,
0.979398, -0.4967081, 2.529614, 1, 0, 0.9294118, 1,
0.981374, 0.366729, -0.8998291, 1, 0, 0.9254902, 1,
0.9873113, -0.05157038, -0.2015475, 1, 0, 0.9176471, 1,
0.991702, 0.1347817, 0.8921544, 1, 0, 0.9137255, 1,
0.9917542, -0.5816075, 1.108791, 1, 0, 0.9058824, 1,
0.9921857, 2.798714, 0.2835632, 1, 0, 0.9019608, 1,
0.9976175, 2.218858, -0.3076399, 1, 0, 0.8941177, 1,
0.9987294, 1.498904, 0.1460808, 1, 0, 0.8862745, 1,
1.003207, -1.069319, 4.635194, 1, 0, 0.8823529, 1,
1.016411, 0.6666266, 1.684001, 1, 0, 0.8745098, 1,
1.019338, 0.2551616, 1.886392, 1, 0, 0.8705882, 1,
1.020252, -0.7071063, 2.610222, 1, 0, 0.8627451, 1,
1.02385, -0.9712046, 1.568463, 1, 0, 0.8588235, 1,
1.028075, 0.4900838, 0.8777861, 1, 0, 0.8509804, 1,
1.036315, -0.3632741, 1.790082, 1, 0, 0.8470588, 1,
1.038069, 0.428414, 0.5218183, 1, 0, 0.8392157, 1,
1.041768, 0.1247948, 0.3570484, 1, 0, 0.8352941, 1,
1.055128, 0.6251516, 1.184059, 1, 0, 0.827451, 1,
1.055692, -1.357444, 2.548548, 1, 0, 0.8235294, 1,
1.056283, -0.7821109, 1.52796, 1, 0, 0.8156863, 1,
1.06302, -0.2890922, 2.125614, 1, 0, 0.8117647, 1,
1.074691, 0.6084846, 0.4627385, 1, 0, 0.8039216, 1,
1.075575, -0.3154411, 2.644702, 1, 0, 0.7960784, 1,
1.076491, 1.917677, 0.917017, 1, 0, 0.7921569, 1,
1.08252, -0.1209056, 2.116235, 1, 0, 0.7843137, 1,
1.088975, 1.011847, 0.940551, 1, 0, 0.7803922, 1,
1.091674, 0.3747427, 0.9383906, 1, 0, 0.772549, 1,
1.099086, 0.5678822, 1.720876, 1, 0, 0.7686275, 1,
1.101073, -0.7909518, 2.315326, 1, 0, 0.7607843, 1,
1.101125, -0.6280411, 0.570684, 1, 0, 0.7568628, 1,
1.110832, -0.1538194, 3.240121, 1, 0, 0.7490196, 1,
1.113484, -1.607088, 2.267544, 1, 0, 0.7450981, 1,
1.116759, -1.491267, 3.541557, 1, 0, 0.7372549, 1,
1.120894, 2.008852, -0.3417917, 1, 0, 0.7333333, 1,
1.123371, -0.05621769, 1.857635, 1, 0, 0.7254902, 1,
1.123735, 0.5158504, -0.183742, 1, 0, 0.7215686, 1,
1.126339, -0.7577642, 0.8499821, 1, 0, 0.7137255, 1,
1.133803, -0.6649389, 0.5022976, 1, 0, 0.7098039, 1,
1.145024, -0.899596, 1.471287, 1, 0, 0.7019608, 1,
1.169331, 0.854059, 1.765952, 1, 0, 0.6941177, 1,
1.172975, 1.234453, -1.082317, 1, 0, 0.6901961, 1,
1.183636, 1.828427, 1.666723, 1, 0, 0.682353, 1,
1.198219, -0.2070332, 1.92054, 1, 0, 0.6784314, 1,
1.207642, 2.187677, -0.124042, 1, 0, 0.6705883, 1,
1.215803, -1.652663, 2.118767, 1, 0, 0.6666667, 1,
1.224499, -1.232879, 1.961469, 1, 0, 0.6588235, 1,
1.226447, -0.09626766, 0.6260896, 1, 0, 0.654902, 1,
1.226512, -0.479425, 1.588958, 1, 0, 0.6470588, 1,
1.234918, 2.046386, -0.5071474, 1, 0, 0.6431373, 1,
1.23571, -1.17462, 2.626435, 1, 0, 0.6352941, 1,
1.237396, 0.04657193, 1.119825, 1, 0, 0.6313726, 1,
1.241127, -0.3649955, -0.2346828, 1, 0, 0.6235294, 1,
1.243594, -0.6006742, 0.5146235, 1, 0, 0.6196079, 1,
1.243607, 1.880477, 0.3677659, 1, 0, 0.6117647, 1,
1.250222, 0.7956545, -0.01285976, 1, 0, 0.6078432, 1,
1.256513, -0.7197455, 3.634817, 1, 0, 0.6, 1,
1.258976, 0.1780002, 0.6645476, 1, 0, 0.5921569, 1,
1.269499, 0.195043, 1.135019, 1, 0, 0.5882353, 1,
1.2726, 1.248769, -0.2846022, 1, 0, 0.5803922, 1,
1.277184, -0.9688675, 1.456052, 1, 0, 0.5764706, 1,
1.284978, 1.984542, 0.3096509, 1, 0, 0.5686275, 1,
1.286243, -1.000619, 3.361977, 1, 0, 0.5647059, 1,
1.289455, -0.3836254, 3.048384, 1, 0, 0.5568628, 1,
1.323079, -0.2813677, 0.6990821, 1, 0, 0.5529412, 1,
1.330517, -0.3724115, 0.8293955, 1, 0, 0.5450981, 1,
1.334208, -1.070238, 1.660647, 1, 0, 0.5411765, 1,
1.336941, 1.31121, 1.424096, 1, 0, 0.5333334, 1,
1.344166, 1.317915, 0.8939835, 1, 0, 0.5294118, 1,
1.346779, 0.9263551, 1.732771, 1, 0, 0.5215687, 1,
1.354016, -1.029515, 2.54934, 1, 0, 0.5176471, 1,
1.355037, 0.353101, 1.113811, 1, 0, 0.509804, 1,
1.361405, 0.3394492, -1.286006, 1, 0, 0.5058824, 1,
1.363237, 1.026944, 2.156429, 1, 0, 0.4980392, 1,
1.372041, 0.21833, 1.438669, 1, 0, 0.4901961, 1,
1.372145, 1.199112, 1.217649, 1, 0, 0.4862745, 1,
1.383345, 0.4109163, 0.3613255, 1, 0, 0.4784314, 1,
1.389461, -1.415908, 3.710875, 1, 0, 0.4745098, 1,
1.394128, -0.5167734, 2.080132, 1, 0, 0.4666667, 1,
1.399677, -1.077082, 3.653427, 1, 0, 0.4627451, 1,
1.407499, 0.1364267, 1.505315, 1, 0, 0.454902, 1,
1.407728, 0.03068198, 2.689679, 1, 0, 0.4509804, 1,
1.408875, -2.446349, 1.999345, 1, 0, 0.4431373, 1,
1.427363, -0.7696055, 1.030509, 1, 0, 0.4392157, 1,
1.427569, -0.9157962, 1.53898, 1, 0, 0.4313726, 1,
1.432612, -0.9505363, 1.918551, 1, 0, 0.427451, 1,
1.432849, 0.5442403, -0.2711799, 1, 0, 0.4196078, 1,
1.448774, 1.895913, -0.1626942, 1, 0, 0.4156863, 1,
1.459555, 2.403422, 1.340311, 1, 0, 0.4078431, 1,
1.471325, 1.008276, 0.1508349, 1, 0, 0.4039216, 1,
1.472605, -0.04377803, 0.2944711, 1, 0, 0.3960784, 1,
1.473591, -1.611506, 1.555296, 1, 0, 0.3882353, 1,
1.474396, -0.5187653, 1.903369, 1, 0, 0.3843137, 1,
1.47545, 0.2568196, 0.2242135, 1, 0, 0.3764706, 1,
1.480282, -0.7772366, 1.075332, 1, 0, 0.372549, 1,
1.481736, -0.376639, 1.947521, 1, 0, 0.3647059, 1,
1.482816, -0.5939588, 0.3681548, 1, 0, 0.3607843, 1,
1.502469, -0.3093536, 1.538168, 1, 0, 0.3529412, 1,
1.531995, 0.1609884, 2.005042, 1, 0, 0.3490196, 1,
1.535594, 0.6710481, 0.7704096, 1, 0, 0.3411765, 1,
1.542141, 1.268672, 1.219132, 1, 0, 0.3372549, 1,
1.558454, -0.511687, 0.7625417, 1, 0, 0.3294118, 1,
1.572148, 1.085169, 1.591654, 1, 0, 0.3254902, 1,
1.581825, -0.7287989, 2.10558, 1, 0, 0.3176471, 1,
1.587506, 0.1431496, 1.257847, 1, 0, 0.3137255, 1,
1.601877, -1.577174, 1.94157, 1, 0, 0.3058824, 1,
1.613292, 1.263484, -1.036079, 1, 0, 0.2980392, 1,
1.634824, 0.6277546, 1.46537, 1, 0, 0.2941177, 1,
1.65713, 0.2293931, 1.153622, 1, 0, 0.2862745, 1,
1.657381, 0.4890345, 1.28785, 1, 0, 0.282353, 1,
1.665265, 0.6753399, 0.4821093, 1, 0, 0.2745098, 1,
1.667361, 0.01668292, 2.882487, 1, 0, 0.2705882, 1,
1.68248, -0.8502079, 0.932003, 1, 0, 0.2627451, 1,
1.683486, 0.6151263, 2.857358, 1, 0, 0.2588235, 1,
1.687008, -0.2796465, 2.141835, 1, 0, 0.2509804, 1,
1.687553, -0.7815903, 2.647522, 1, 0, 0.2470588, 1,
1.702614, 0.4965514, 1.648268, 1, 0, 0.2392157, 1,
1.717146, 0.5217257, 0.9058753, 1, 0, 0.2352941, 1,
1.717326, 0.7764313, 1.159242, 1, 0, 0.227451, 1,
1.719132, 0.949981, -0.4385244, 1, 0, 0.2235294, 1,
1.724911, 2.317737, 0.04889258, 1, 0, 0.2156863, 1,
1.744435, -0.5672405, 3.607346, 1, 0, 0.2117647, 1,
1.760637, 0.3814774, 3.136313, 1, 0, 0.2039216, 1,
1.761956, 0.07060325, 0.3475198, 1, 0, 0.1960784, 1,
1.764944, 0.5612274, 2.71835, 1, 0, 0.1921569, 1,
1.779499, 0.747932, 2.266223, 1, 0, 0.1843137, 1,
1.810202, 1.157186, 0.5031319, 1, 0, 0.1803922, 1,
1.815408, 0.7887871, 1.568207, 1, 0, 0.172549, 1,
1.831037, -0.4077373, 2.254553, 1, 0, 0.1686275, 1,
1.851656, 1.271704, 0.5338498, 1, 0, 0.1607843, 1,
1.910547, 1.513745, 0.8542144, 1, 0, 0.1568628, 1,
1.945801, 0.5940735, -0.3639325, 1, 0, 0.1490196, 1,
1.964803, -0.1555407, 0.376866, 1, 0, 0.145098, 1,
1.975259, -0.2922868, 1.197156, 1, 0, 0.1372549, 1,
1.983584, -0.7100338, 3.603566, 1, 0, 0.1333333, 1,
2.010142, -0.05387397, 2.403779, 1, 0, 0.1254902, 1,
2.040009, 0.5385648, 0.9512198, 1, 0, 0.1215686, 1,
2.088818, 0.8710213, 0.3369758, 1, 0, 0.1137255, 1,
2.149704, 1.393623, 0.847016, 1, 0, 0.1098039, 1,
2.184406, -1.56985, 2.184407, 1, 0, 0.1019608, 1,
2.247179, 1.103001, 1.914619, 1, 0, 0.09411765, 1,
2.25245, -1.36897, 1.13334, 1, 0, 0.09019608, 1,
2.255364, 0.05937236, 1.172154, 1, 0, 0.08235294, 1,
2.277707, -0.1684426, 1.66064, 1, 0, 0.07843138, 1,
2.279446, 0.352637, 1.466309, 1, 0, 0.07058824, 1,
2.411763, 0.2907273, 2.339461, 1, 0, 0.06666667, 1,
2.423479, 1.425959, 0.6530614, 1, 0, 0.05882353, 1,
2.434535, -1.821865, 3.068495, 1, 0, 0.05490196, 1,
2.467871, -1.349534, 3.18828, 1, 0, 0.04705882, 1,
2.53212, -1.131205, 1.955854, 1, 0, 0.04313726, 1,
2.578281, 0.6466894, 1.844877, 1, 0, 0.03529412, 1,
2.586382, 0.1848143, 0.1274168, 1, 0, 0.03137255, 1,
2.635326, 0.3579997, 1.947442, 1, 0, 0.02352941, 1,
2.6408, -0.8668154, 1.511005, 1, 0, 0.01960784, 1,
2.74001, -2.51248, 2.48773, 1, 0, 0.01176471, 1,
2.989992, 0.9024116, 1.459442, 1, 0, 0.007843138, 1
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
0.04073083, -4.02611, -6.856047, 0, -0.5, 0.5, 0.5,
0.04073083, -4.02611, -6.856047, 1, -0.5, 0.5, 0.5,
0.04073083, -4.02611, -6.856047, 1, 1.5, 0.5, 0.5,
0.04073083, -4.02611, -6.856047, 0, 1.5, 0.5, 0.5
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
-3.908329, 0.03694904, -6.856047, 0, -0.5, 0.5, 0.5,
-3.908329, 0.03694904, -6.856047, 1, -0.5, 0.5, 0.5,
-3.908329, 0.03694904, -6.856047, 1, 1.5, 0.5, 0.5,
-3.908329, 0.03694904, -6.856047, 0, 1.5, 0.5, 0.5
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
-3.908329, -4.02611, -0.1375432, 0, -0.5, 0.5, 0.5,
-3.908329, -4.02611, -0.1375432, 1, -0.5, 0.5, 0.5,
-3.908329, -4.02611, -0.1375432, 1, 1.5, 0.5, 0.5,
-3.908329, -4.02611, -0.1375432, 0, 1.5, 0.5, 0.5
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
-2, -3.088481, -5.305623,
2, -3.088481, -5.305623,
-2, -3.088481, -5.305623,
-2, -3.244752, -5.564027,
-1, -3.088481, -5.305623,
-1, -3.244752, -5.564027,
0, -3.088481, -5.305623,
0, -3.244752, -5.564027,
1, -3.088481, -5.305623,
1, -3.244752, -5.564027,
2, -3.088481, -5.305623,
2, -3.244752, -5.564027
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
-2, -3.557295, -6.080835, 0, -0.5, 0.5, 0.5,
-2, -3.557295, -6.080835, 1, -0.5, 0.5, 0.5,
-2, -3.557295, -6.080835, 1, 1.5, 0.5, 0.5,
-2, -3.557295, -6.080835, 0, 1.5, 0.5, 0.5,
-1, -3.557295, -6.080835, 0, -0.5, 0.5, 0.5,
-1, -3.557295, -6.080835, 1, -0.5, 0.5, 0.5,
-1, -3.557295, -6.080835, 1, 1.5, 0.5, 0.5,
-1, -3.557295, -6.080835, 0, 1.5, 0.5, 0.5,
0, -3.557295, -6.080835, 0, -0.5, 0.5, 0.5,
0, -3.557295, -6.080835, 1, -0.5, 0.5, 0.5,
0, -3.557295, -6.080835, 1, 1.5, 0.5, 0.5,
0, -3.557295, -6.080835, 0, 1.5, 0.5, 0.5,
1, -3.557295, -6.080835, 0, -0.5, 0.5, 0.5,
1, -3.557295, -6.080835, 1, -0.5, 0.5, 0.5,
1, -3.557295, -6.080835, 1, 1.5, 0.5, 0.5,
1, -3.557295, -6.080835, 0, 1.5, 0.5, 0.5,
2, -3.557295, -6.080835, 0, -0.5, 0.5, 0.5,
2, -3.557295, -6.080835, 1, -0.5, 0.5, 0.5,
2, -3.557295, -6.080835, 1, 1.5, 0.5, 0.5,
2, -3.557295, -6.080835, 0, 1.5, 0.5, 0.5
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
-2.997008, -2, -5.305623,
-2.997008, 3, -5.305623,
-2.997008, -2, -5.305623,
-3.148895, -2, -5.564027,
-2.997008, -1, -5.305623,
-3.148895, -1, -5.564027,
-2.997008, 0, -5.305623,
-3.148895, 0, -5.564027,
-2.997008, 1, -5.305623,
-3.148895, 1, -5.564027,
-2.997008, 2, -5.305623,
-3.148895, 2, -5.564027,
-2.997008, 3, -5.305623,
-3.148895, 3, -5.564027
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
-3.452669, -2, -6.080835, 0, -0.5, 0.5, 0.5,
-3.452669, -2, -6.080835, 1, -0.5, 0.5, 0.5,
-3.452669, -2, -6.080835, 1, 1.5, 0.5, 0.5,
-3.452669, -2, -6.080835, 0, 1.5, 0.5, 0.5,
-3.452669, -1, -6.080835, 0, -0.5, 0.5, 0.5,
-3.452669, -1, -6.080835, 1, -0.5, 0.5, 0.5,
-3.452669, -1, -6.080835, 1, 1.5, 0.5, 0.5,
-3.452669, -1, -6.080835, 0, 1.5, 0.5, 0.5,
-3.452669, 0, -6.080835, 0, -0.5, 0.5, 0.5,
-3.452669, 0, -6.080835, 1, -0.5, 0.5, 0.5,
-3.452669, 0, -6.080835, 1, 1.5, 0.5, 0.5,
-3.452669, 0, -6.080835, 0, 1.5, 0.5, 0.5,
-3.452669, 1, -6.080835, 0, -0.5, 0.5, 0.5,
-3.452669, 1, -6.080835, 1, -0.5, 0.5, 0.5,
-3.452669, 1, -6.080835, 1, 1.5, 0.5, 0.5,
-3.452669, 1, -6.080835, 0, 1.5, 0.5, 0.5,
-3.452669, 2, -6.080835, 0, -0.5, 0.5, 0.5,
-3.452669, 2, -6.080835, 1, -0.5, 0.5, 0.5,
-3.452669, 2, -6.080835, 1, 1.5, 0.5, 0.5,
-3.452669, 2, -6.080835, 0, 1.5, 0.5, 0.5,
-3.452669, 3, -6.080835, 0, -0.5, 0.5, 0.5,
-3.452669, 3, -6.080835, 1, -0.5, 0.5, 0.5,
-3.452669, 3, -6.080835, 1, 1.5, 0.5, 0.5,
-3.452669, 3, -6.080835, 0, 1.5, 0.5, 0.5
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
-2.997008, -3.088481, -4,
-2.997008, -3.088481, 4,
-2.997008, -3.088481, -4,
-3.148895, -3.244752, -4,
-2.997008, -3.088481, -2,
-3.148895, -3.244752, -2,
-2.997008, -3.088481, 0,
-3.148895, -3.244752, 0,
-2.997008, -3.088481, 2,
-3.148895, -3.244752, 2,
-2.997008, -3.088481, 4,
-3.148895, -3.244752, 4
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
-3.452669, -3.557295, -4, 0, -0.5, 0.5, 0.5,
-3.452669, -3.557295, -4, 1, -0.5, 0.5, 0.5,
-3.452669, -3.557295, -4, 1, 1.5, 0.5, 0.5,
-3.452669, -3.557295, -4, 0, 1.5, 0.5, 0.5,
-3.452669, -3.557295, -2, 0, -0.5, 0.5, 0.5,
-3.452669, -3.557295, -2, 1, -0.5, 0.5, 0.5,
-3.452669, -3.557295, -2, 1, 1.5, 0.5, 0.5,
-3.452669, -3.557295, -2, 0, 1.5, 0.5, 0.5,
-3.452669, -3.557295, 0, 0, -0.5, 0.5, 0.5,
-3.452669, -3.557295, 0, 1, -0.5, 0.5, 0.5,
-3.452669, -3.557295, 0, 1, 1.5, 0.5, 0.5,
-3.452669, -3.557295, 0, 0, 1.5, 0.5, 0.5,
-3.452669, -3.557295, 2, 0, -0.5, 0.5, 0.5,
-3.452669, -3.557295, 2, 1, -0.5, 0.5, 0.5,
-3.452669, -3.557295, 2, 1, 1.5, 0.5, 0.5,
-3.452669, -3.557295, 2, 0, 1.5, 0.5, 0.5,
-3.452669, -3.557295, 4, 0, -0.5, 0.5, 0.5,
-3.452669, -3.557295, 4, 1, -0.5, 0.5, 0.5,
-3.452669, -3.557295, 4, 1, 1.5, 0.5, 0.5,
-3.452669, -3.557295, 4, 0, 1.5, 0.5, 0.5
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
-2.997008, -3.088481, -5.305623,
-2.997008, 3.162379, -5.305623,
-2.997008, -3.088481, 5.030537,
-2.997008, 3.162379, 5.030537,
-2.997008, -3.088481, -5.305623,
-2.997008, -3.088481, 5.030537,
-2.997008, 3.162379, -5.305623,
-2.997008, 3.162379, 5.030537,
-2.997008, -3.088481, -5.305623,
3.07847, -3.088481, -5.305623,
-2.997008, -3.088481, 5.030537,
3.07847, -3.088481, 5.030537,
-2.997008, 3.162379, -5.305623,
3.07847, 3.162379, -5.305623,
-2.997008, 3.162379, 5.030537,
3.07847, 3.162379, 5.030537,
3.07847, -3.088481, -5.305623,
3.07847, 3.162379, -5.305623,
3.07847, -3.088481, 5.030537,
3.07847, 3.162379, 5.030537,
3.07847, -3.088481, -5.305623,
3.07847, -3.088481, 5.030537,
3.07847, 3.162379, -5.305623,
3.07847, 3.162379, 5.030537
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
var radius = 7.220019;
var distance = 32.12268;
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
mvMatrix.translate( -0.04073083, -0.03694904, 0.1375432 );
mvMatrix.scale( 1.284907, 1.248856, 0.755254 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.12268);
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
trinexapac-ethyl<-read.table("trinexapac-ethyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-trinexapac-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'trinexapac' not found
```

```r
y<-trinexapac-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'trinexapac' not found
```

```r
z<-trinexapac-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'trinexapac' not found
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
-2.90853, -0.5611373, -1.826591, 0, 0, 1, 1, 1,
-2.688499, -0.9773499, -2.740385, 1, 0, 0, 1, 1,
-2.685579, -0.1805615, -1.609037, 1, 0, 0, 1, 1,
-2.632687, -0.08917749, 0.5439797, 1, 0, 0, 1, 1,
-2.461272, -2.420717, -0.9984171, 1, 0, 0, 1, 1,
-2.428122, 0.9148903, -3.597836, 1, 0, 0, 1, 1,
-2.326477, -1.406536, -3.088235, 0, 0, 0, 1, 1,
-2.322639, 1.549638, -0.8267925, 0, 0, 0, 1, 1,
-2.289511, -1.250088, -1.455924, 0, 0, 0, 1, 1,
-2.240061, 0.876592, -1.923503, 0, 0, 0, 1, 1,
-2.130342, 0.03400398, -1.720042, 0, 0, 0, 1, 1,
-2.129388, 1.007329, -0.9593747, 0, 0, 0, 1, 1,
-2.11221, 1.779377, -2.856106, 0, 0, 0, 1, 1,
-2.111146, -0.8166326, -1.445082, 1, 1, 1, 1, 1,
-2.093826, 1.397128, -0.9497316, 1, 1, 1, 1, 1,
-2.090641, -0.8444299, -1.928523, 1, 1, 1, 1, 1,
-2.077701, -1.66125, -3.083078, 1, 1, 1, 1, 1,
-2.055606, 0.1144901, -0.97149, 1, 1, 1, 1, 1,
-2.051912, -1.565413, -2.808138, 1, 1, 1, 1, 1,
-1.992016, 0.8460214, -0.5713949, 1, 1, 1, 1, 1,
-1.990241, 0.4681251, 0.02020527, 1, 1, 1, 1, 1,
-1.976208, 0.3651709, -1.439391, 1, 1, 1, 1, 1,
-1.965649, -0.4469064, -2.98624, 1, 1, 1, 1, 1,
-1.945134, -0.9131774, -4.486383, 1, 1, 1, 1, 1,
-1.929153, 0.1067155, 0.4133052, 1, 1, 1, 1, 1,
-1.913744, 0.6894971, 0.9337534, 1, 1, 1, 1, 1,
-1.912806, -0.7856383, -3.004115, 1, 1, 1, 1, 1,
-1.908427, 2.865853, -0.8662234, 1, 1, 1, 1, 1,
-1.880218, -0.5485511, -1.401885, 0, 0, 1, 1, 1,
-1.871897, 0.4238059, -1.490333, 1, 0, 0, 1, 1,
-1.871055, -0.3412283, -1.47548, 1, 0, 0, 1, 1,
-1.843475, -0.05233661, 0.4932428, 1, 0, 0, 1, 1,
-1.836047, 0.01869787, -1.971153, 1, 0, 0, 1, 1,
-1.795991, 3.071347, 0.9870923, 1, 0, 0, 1, 1,
-1.794441, -1.044414, -1.656463, 0, 0, 0, 1, 1,
-1.785517, -0.5456842, -3.223141, 0, 0, 0, 1, 1,
-1.78102, 1.119, -0.3911496, 0, 0, 0, 1, 1,
-1.780168, 1.772628, -0.3787279, 0, 0, 0, 1, 1,
-1.767983, -1.339275, -3.689688, 0, 0, 0, 1, 1,
-1.75511, 0.9275286, 0.4677598, 0, 0, 0, 1, 1,
-1.754254, -1.246911, -2.928859, 0, 0, 0, 1, 1,
-1.741629, 1.763279, -2.673691, 1, 1, 1, 1, 1,
-1.729418, -1.239446, -1.417872, 1, 1, 1, 1, 1,
-1.717136, -0.7480441, 0.1436764, 1, 1, 1, 1, 1,
-1.705426, -1.037411, -1.969998, 1, 1, 1, 1, 1,
-1.693061, 0.3197929, -0.6341018, 1, 1, 1, 1, 1,
-1.683008, -0.2353252, -1.520995, 1, 1, 1, 1, 1,
-1.672765, 0.1581342, -0.8771599, 1, 1, 1, 1, 1,
-1.655667, -1.24752, -3.464653, 1, 1, 1, 1, 1,
-1.636376, 0.6961445, -1.996334, 1, 1, 1, 1, 1,
-1.626782, -0.03229657, -0.5707388, 1, 1, 1, 1, 1,
-1.621111, 1.685815, -2.197974, 1, 1, 1, 1, 1,
-1.616915, 1.182561, -1.174919, 1, 1, 1, 1, 1,
-1.613925, -0.1861219, -1.486637, 1, 1, 1, 1, 1,
-1.611752, 1.144519, -2.494368, 1, 1, 1, 1, 1,
-1.608859, 1.08876, -2.316869, 1, 1, 1, 1, 1,
-1.608569, -0.1640415, -3.541355, 0, 0, 1, 1, 1,
-1.604718, -0.6108049, -1.499344, 1, 0, 0, 1, 1,
-1.599348, -0.02574696, -1.334461, 1, 0, 0, 1, 1,
-1.585395, 1.313126, -1.874661, 1, 0, 0, 1, 1,
-1.579884, 0.4023542, -0.1458764, 1, 0, 0, 1, 1,
-1.566912, -1.041339, -3.456179, 1, 0, 0, 1, 1,
-1.566714, -0.1835628, -0.3175682, 0, 0, 0, 1, 1,
-1.555316, 1.571558, -0.8045175, 0, 0, 0, 1, 1,
-1.552827, 0.6892656, -0.5846564, 0, 0, 0, 1, 1,
-1.531585, 1.901232, -0.9591928, 0, 0, 0, 1, 1,
-1.529915, -0.7340063, -2.968263, 0, 0, 0, 1, 1,
-1.526001, -0.4753036, -1.750981, 0, 0, 0, 1, 1,
-1.510373, -0.7941602, -2.178973, 0, 0, 0, 1, 1,
-1.503166, -0.639001, -3.974928, 1, 1, 1, 1, 1,
-1.488636, 0.5350557, -2.985008, 1, 1, 1, 1, 1,
-1.485168, 0.1016259, -1.347205, 1, 1, 1, 1, 1,
-1.480518, -0.5476848, -1.250557, 1, 1, 1, 1, 1,
-1.479993, -0.6258948, -0.9584245, 1, 1, 1, 1, 1,
-1.473315, -1.088186, -3.282681, 1, 1, 1, 1, 1,
-1.461489, -0.7129559, -0.9511229, 1, 1, 1, 1, 1,
-1.449244, -1.256813, -1.871361, 1, 1, 1, 1, 1,
-1.442194, -0.3697524, -2.868208, 1, 1, 1, 1, 1,
-1.436314, 0.06961472, -2.19535, 1, 1, 1, 1, 1,
-1.436017, 0.05090135, -1.868754, 1, 1, 1, 1, 1,
-1.422607, 0.6331186, -2.427755, 1, 1, 1, 1, 1,
-1.400203, -0.6316463, -0.963223, 1, 1, 1, 1, 1,
-1.396378, 0.4329498, -0.9663728, 1, 1, 1, 1, 1,
-1.395796, -2.099413, -3.79738, 1, 1, 1, 1, 1,
-1.372694, -0.4947409, -3.029724, 0, 0, 1, 1, 1,
-1.365317, -0.9797661, -2.370146, 1, 0, 0, 1, 1,
-1.364077, -1.366904, -2.199121, 1, 0, 0, 1, 1,
-1.363406, -0.1499431, -1.712399, 1, 0, 0, 1, 1,
-1.36042, -1.116852, -1.140931, 1, 0, 0, 1, 1,
-1.358302, -0.2029087, -2.753525, 1, 0, 0, 1, 1,
-1.337395, 1.26883, 0.8484175, 0, 0, 0, 1, 1,
-1.330397, -0.7956565, -2.9157, 0, 0, 0, 1, 1,
-1.324762, -0.990989, -1.267289, 0, 0, 0, 1, 1,
-1.320594, 0.71666, -2.586179, 0, 0, 0, 1, 1,
-1.306479, 0.7200061, -0.7305292, 0, 0, 0, 1, 1,
-1.305701, 0.4699372, -2.469274, 0, 0, 0, 1, 1,
-1.290749, -0.1510999, -1.729212, 0, 0, 0, 1, 1,
-1.27829, 0.3184548, -1.328175, 1, 1, 1, 1, 1,
-1.275898, 0.8205703, -2.793511, 1, 1, 1, 1, 1,
-1.273152, 2.486725, -1.056652, 1, 1, 1, 1, 1,
-1.26613, 0.5044271, -0.9113531, 1, 1, 1, 1, 1,
-1.264563, 2.205791, -0.1094636, 1, 1, 1, 1, 1,
-1.258678, -1.224417, -2.947839, 1, 1, 1, 1, 1,
-1.254663, 0.7616937, -1.694904, 1, 1, 1, 1, 1,
-1.247928, 1.328833, -1.463081, 1, 1, 1, 1, 1,
-1.243603, 1.102405, 0.5973091, 1, 1, 1, 1, 1,
-1.2428, -1.211377, -2.123971, 1, 1, 1, 1, 1,
-1.237581, 1.222521, -1.469931, 1, 1, 1, 1, 1,
-1.235949, -0.3500511, -2.29529, 1, 1, 1, 1, 1,
-1.234779, 1.229902, -1.883985, 1, 1, 1, 1, 1,
-1.230689, 0.2073591, -2.961156, 1, 1, 1, 1, 1,
-1.22329, 2.481152, -0.7642925, 1, 1, 1, 1, 1,
-1.190505, -0.792856, -1.307478, 0, 0, 1, 1, 1,
-1.186939, -0.1873178, -1.134132, 1, 0, 0, 1, 1,
-1.181417, 2.420964, -0.9749788, 1, 0, 0, 1, 1,
-1.179874, -0.2081306, -1.16968, 1, 0, 0, 1, 1,
-1.175425, 0.9474864, -0.1489398, 1, 0, 0, 1, 1,
-1.173316, 1.558851, -1.164995, 1, 0, 0, 1, 1,
-1.173171, 0.4754984, -2.92171, 0, 0, 0, 1, 1,
-1.166833, -0.2216104, -0.05234377, 0, 0, 0, 1, 1,
-1.162381, 0.4783348, -0.7794642, 0, 0, 0, 1, 1,
-1.159233, -0.4151633, -3.169956, 0, 0, 0, 1, 1,
-1.158751, 0.2171884, -0.8940175, 0, 0, 0, 1, 1,
-1.158343, -0.9755058, -3.109439, 0, 0, 0, 1, 1,
-1.155307, 1.544452, -1.998818, 0, 0, 0, 1, 1,
-1.154683, -0.04554947, -0.9349337, 1, 1, 1, 1, 1,
-1.150815, -1.082898, -4.533934, 1, 1, 1, 1, 1,
-1.134759, -1.360647, -3.046473, 1, 1, 1, 1, 1,
-1.117764, 0.2591284, -0.3895501, 1, 1, 1, 1, 1,
-1.116876, 0.5355946, -0.3459083, 1, 1, 1, 1, 1,
-1.115109, 0.1240706, -0.7055721, 1, 1, 1, 1, 1,
-1.113827, -0.4287047, -1.504029, 1, 1, 1, 1, 1,
-1.113181, -2.670959, -2.520869, 1, 1, 1, 1, 1,
-1.11294, -0.4890712, -0.9051938, 1, 1, 1, 1, 1,
-1.107072, 0.1615302, -2.034458, 1, 1, 1, 1, 1,
-1.105859, -0.2270333, -1.394618, 1, 1, 1, 1, 1,
-1.104262, 0.1555812, -0.7822241, 1, 1, 1, 1, 1,
-1.099943, 0.1588937, 0.01628581, 1, 1, 1, 1, 1,
-1.092148, -1.924435, -2.776659, 1, 1, 1, 1, 1,
-1.091671, -2.228606, -3.060606, 1, 1, 1, 1, 1,
-1.091436, -0.04786075, -1.219474, 0, 0, 1, 1, 1,
-1.086536, 1.638168, 0.7745149, 1, 0, 0, 1, 1,
-1.075278, 0.1096361, 0.4762164, 1, 0, 0, 1, 1,
-1.072315, 1.488128, -0.2057049, 1, 0, 0, 1, 1,
-1.067448, -0.7034683, -2.324484, 1, 0, 0, 1, 1,
-1.062849, -0.3728212, -0.1479716, 1, 0, 0, 1, 1,
-1.061965, -0.03421372, -2.036309, 0, 0, 0, 1, 1,
-1.060806, 0.4948278, 0.2231842, 0, 0, 0, 1, 1,
-1.059927, -0.8588746, -2.975579, 0, 0, 0, 1, 1,
-1.044459, 0.3353074, -1.874023, 0, 0, 0, 1, 1,
-1.044228, -0.2074895, -3.46827, 0, 0, 0, 1, 1,
-1.042487, 0.6890575, -1.684837, 0, 0, 0, 1, 1,
-1.039003, -1.108116, -2.608354, 0, 0, 0, 1, 1,
-1.033819, -0.03338326, -2.342752, 1, 1, 1, 1, 1,
-1.028943, -0.3338053, -2.81382, 1, 1, 1, 1, 1,
-1.024019, 1.082997, -0.5087587, 1, 1, 1, 1, 1,
-1.023131, -2.663222, -2.638921, 1, 1, 1, 1, 1,
-1.02032, -0.3098966, -2.331842, 1, 1, 1, 1, 1,
-1.00847, 0.09449338, -2.026096, 1, 1, 1, 1, 1,
-0.9962841, 0.04383135, -0.1397291, 1, 1, 1, 1, 1,
-0.9897159, 0.4858458, -1.693204, 1, 1, 1, 1, 1,
-0.988962, 0.7718951, -2.334677, 1, 1, 1, 1, 1,
-0.9889412, 0.5117045, -3.528147, 1, 1, 1, 1, 1,
-0.9874292, -1.022449, -2.583678, 1, 1, 1, 1, 1,
-0.9781565, 0.5949097, -0.5366671, 1, 1, 1, 1, 1,
-0.9761372, -1.269632, -0.347184, 1, 1, 1, 1, 1,
-0.9657722, 0.5553535, 0.2897341, 1, 1, 1, 1, 1,
-0.9629279, 0.2799655, -0.8941423, 1, 1, 1, 1, 1,
-0.9614712, -1.315165, -2.898947, 0, 0, 1, 1, 1,
-0.9595354, -1.058933, -4.111037, 1, 0, 0, 1, 1,
-0.9556105, 0.7073484, -1.127056, 1, 0, 0, 1, 1,
-0.9518006, -0.9630893, -2.292809, 1, 0, 0, 1, 1,
-0.9505785, -0.2398774, -2.096342, 1, 0, 0, 1, 1,
-0.9500356, -0.2192081, -2.194778, 1, 0, 0, 1, 1,
-0.9381154, -0.8829914, -3.344159, 0, 0, 0, 1, 1,
-0.9309197, 0.9714795, 0.9319773, 0, 0, 0, 1, 1,
-0.9291946, 0.7030076, -0.6337059, 0, 0, 0, 1, 1,
-0.9282026, 0.4961998, -0.4877229, 0, 0, 0, 1, 1,
-0.9231205, 0.1483319, 0.04085262, 0, 0, 0, 1, 1,
-0.9196765, -0.6606799, -1.072962, 0, 0, 0, 1, 1,
-0.9178916, -0.9126395, -1.261087, 0, 0, 0, 1, 1,
-0.9177699, -1.945107, -2.924173, 1, 1, 1, 1, 1,
-0.9139729, 0.8862556, 0.386333, 1, 1, 1, 1, 1,
-0.910884, -0.6807824, -1.696262, 1, 1, 1, 1, 1,
-0.9082323, -0.7455417, -3.357348, 1, 1, 1, 1, 1,
-0.9048672, -0.06501395, -1.361745, 1, 1, 1, 1, 1,
-0.9004245, 0.05942383, -2.288413, 1, 1, 1, 1, 1,
-0.8992242, -0.3343836, -0.8957939, 1, 1, 1, 1, 1,
-0.8945469, 2.125147, -0.3445349, 1, 1, 1, 1, 1,
-0.8875277, 0.2713261, -0.4075428, 1, 1, 1, 1, 1,
-0.8847606, 1.016088, -0.4044307, 1, 1, 1, 1, 1,
-0.8765981, -0.2025011, -3.129697, 1, 1, 1, 1, 1,
-0.8705606, -0.4708919, -3.013772, 1, 1, 1, 1, 1,
-0.8681079, -0.459821, -2.396907, 1, 1, 1, 1, 1,
-0.8680331, 0.5107131, -0.399873, 1, 1, 1, 1, 1,
-0.8640911, -1.781999, -2.700609, 1, 1, 1, 1, 1,
-0.8613766, -0.3390876, -0.8279359, 0, 0, 1, 1, 1,
-0.8606133, 0.5703714, -1.128898, 1, 0, 0, 1, 1,
-0.8588849, 1.054465, -0.7487299, 1, 0, 0, 1, 1,
-0.8476176, -0.07577766, -0.1634385, 1, 0, 0, 1, 1,
-0.8474838, 0.7239789, -2.109477, 1, 0, 0, 1, 1,
-0.8462654, -0.09315133, -2.981146, 1, 0, 0, 1, 1,
-0.8458727, 1.491914, 1.110323, 0, 0, 0, 1, 1,
-0.8423797, -0.3429656, -1.912501, 0, 0, 0, 1, 1,
-0.8361639, 1.205694, -0.4518513, 0, 0, 0, 1, 1,
-0.8343216, -0.8533009, -2.942347, 0, 0, 0, 1, 1,
-0.8312629, 0.004783432, -1.02875, 0, 0, 0, 1, 1,
-0.8222225, -2.133325, -2.488084, 0, 0, 0, 1, 1,
-0.8190066, -0.08007194, -2.362128, 0, 0, 0, 1, 1,
-0.8175967, -0.11311, -0.8970007, 1, 1, 1, 1, 1,
-0.816771, 0.09922467, -0.8242432, 1, 1, 1, 1, 1,
-0.816098, 1.016103, -1.158673, 1, 1, 1, 1, 1,
-0.8123878, 0.6173872, 0.5451933, 1, 1, 1, 1, 1,
-0.8101559, -1.35262, -2.454093, 1, 1, 1, 1, 1,
-0.8072458, -0.03230109, -0.9952726, 1, 1, 1, 1, 1,
-0.7994381, 0.4282489, -1.627716, 1, 1, 1, 1, 1,
-0.7971315, 1.039862, -0.6298083, 1, 1, 1, 1, 1,
-0.7930495, 0.7034128, -0.1920922, 1, 1, 1, 1, 1,
-0.7915717, -1.357038, -0.5679843, 1, 1, 1, 1, 1,
-0.7905771, -0.2587804, -2.183128, 1, 1, 1, 1, 1,
-0.7893699, -0.4346553, -2.201597, 1, 1, 1, 1, 1,
-0.7880393, -0.729519, -3.056148, 1, 1, 1, 1, 1,
-0.7867128, -0.6548309, -1.494668, 1, 1, 1, 1, 1,
-0.7614473, 1.06246, -1.044242, 1, 1, 1, 1, 1,
-0.7555282, 0.3938481, -2.255008, 0, 0, 1, 1, 1,
-0.7539037, 0.4247436, -1.357028, 1, 0, 0, 1, 1,
-0.7533218, 0.5932463, -0.7235995, 1, 0, 0, 1, 1,
-0.7462453, 0.6126279, -1.396541, 1, 0, 0, 1, 1,
-0.7434428, 1.549055, 0.08541731, 1, 0, 0, 1, 1,
-0.7415654, -0.4556421, -3.210449, 1, 0, 0, 1, 1,
-0.7375329, 0.5098272, -1.827967, 0, 0, 0, 1, 1,
-0.7371441, 1.666946, -0.8693814, 0, 0, 0, 1, 1,
-0.7226713, 1.541059, -1.631226, 0, 0, 0, 1, 1,
-0.7185826, -1.020712, -2.427657, 0, 0, 0, 1, 1,
-0.710944, 2.25608, -0.2681804, 0, 0, 0, 1, 1,
-0.7104691, -0.5677851, -1.210974, 0, 0, 0, 1, 1,
-0.7026194, -1.434771, -2.462918, 0, 0, 0, 1, 1,
-0.6997515, -1.341166, -1.504143, 1, 1, 1, 1, 1,
-0.6961667, -0.1842851, -2.655463, 1, 1, 1, 1, 1,
-0.6903093, -0.4074889, -2.449986, 1, 1, 1, 1, 1,
-0.689715, 0.06560063, -1.670578, 1, 1, 1, 1, 1,
-0.6848802, -1.669054, -3.834269, 1, 1, 1, 1, 1,
-0.6816932, -0.3114361, -2.06563, 1, 1, 1, 1, 1,
-0.672698, -1.079513, -0.870195, 1, 1, 1, 1, 1,
-0.672362, -2.845583, -2.677736, 1, 1, 1, 1, 1,
-0.6650524, 1.631592, -2.305452, 1, 1, 1, 1, 1,
-0.6609549, -1.584061, -3.491869, 1, 1, 1, 1, 1,
-0.6601372, 0.3960761, -0.511006, 1, 1, 1, 1, 1,
-0.6601139, 2.419954, -0.9034858, 1, 1, 1, 1, 1,
-0.6578676, -0.3920552, -1.744289, 1, 1, 1, 1, 1,
-0.6498763, -0.1264855, -2.110496, 1, 1, 1, 1, 1,
-0.6492838, -1.430938, -2.032446, 1, 1, 1, 1, 1,
-0.6488364, -0.7377437, -3.789276, 0, 0, 1, 1, 1,
-0.64, -0.773985, -3.412515, 1, 0, 0, 1, 1,
-0.6378554, -1.761855, -2.165956, 1, 0, 0, 1, 1,
-0.6375965, -1.334893, -1.303604, 1, 0, 0, 1, 1,
-0.6287418, 1.304932, 0.3961358, 1, 0, 0, 1, 1,
-0.628686, -0.4151687, -3.171965, 1, 0, 0, 1, 1,
-0.6277116, -0.4244987, -1.083852, 0, 0, 0, 1, 1,
-0.6239491, 1.22569, -0.5371655, 0, 0, 0, 1, 1,
-0.6234891, 0.7761852, -0.8950125, 0, 0, 0, 1, 1,
-0.6163055, -1.549308, -2.24027, 0, 0, 0, 1, 1,
-0.6143827, -0.9222795, -3.255276, 0, 0, 0, 1, 1,
-0.6134015, -2.260681, -3.177029, 0, 0, 0, 1, 1,
-0.611877, -0.6317768, -1.732428, 0, 0, 0, 1, 1,
-0.6064974, 0.01883392, -2.702027, 1, 1, 1, 1, 1,
-0.6029696, -1.277371, -3.3027, 1, 1, 1, 1, 1,
-0.6016068, 0.894089, 0.7801184, 1, 1, 1, 1, 1,
-0.5995445, -1.673016, -4.413527, 1, 1, 1, 1, 1,
-0.597245, -0.4454929, -1.293086, 1, 1, 1, 1, 1,
-0.5966137, -0.8655115, -1.69487, 1, 1, 1, 1, 1,
-0.5948147, 2.101059, -0.002844937, 1, 1, 1, 1, 1,
-0.5936865, 2.013061, -1.106674, 1, 1, 1, 1, 1,
-0.5904492, -1.134831, -0.09538921, 1, 1, 1, 1, 1,
-0.5866474, 0.5674075, -0.9347852, 1, 1, 1, 1, 1,
-0.5834593, 1.786405, 0.8115487, 1, 1, 1, 1, 1,
-0.58332, -0.2367083, -1.940792, 1, 1, 1, 1, 1,
-0.5825524, -0.03206679, -2.528879, 1, 1, 1, 1, 1,
-0.5805609, -1.680376, -3.563725, 1, 1, 1, 1, 1,
-0.5802227, -1.194888, -2.269178, 1, 1, 1, 1, 1,
-0.579679, -0.4326635, -2.195796, 0, 0, 1, 1, 1,
-0.5787628, -0.2887753, -2.958393, 1, 0, 0, 1, 1,
-0.5769507, 1.390259, -2.762023, 1, 0, 0, 1, 1,
-0.5755421, -1.227486, -2.887293, 1, 0, 0, 1, 1,
-0.5716648, 1.386728, 0.2606436, 1, 0, 0, 1, 1,
-0.5696086, -1.656936, -3.252516, 1, 0, 0, 1, 1,
-0.5687457, 2.373901, 0.5764042, 0, 0, 0, 1, 1,
-0.5599722, 0.6016717, -0.005222753, 0, 0, 0, 1, 1,
-0.5593419, 0.5378537, -1.407239, 0, 0, 0, 1, 1,
-0.5585949, 1.071792, -0.03375722, 0, 0, 0, 1, 1,
-0.5580201, -0.08596841, -3.591667, 0, 0, 0, 1, 1,
-0.5524141, 0.8071226, 0.4599993, 0, 0, 0, 1, 1,
-0.5512574, 0.5569159, 0.6664629, 0, 0, 0, 1, 1,
-0.549399, 2.29004, 0.4726607, 1, 1, 1, 1, 1,
-0.5481905, 0.04745357, 0.8355228, 1, 1, 1, 1, 1,
-0.5463386, 0.1774296, -0.6667174, 1, 1, 1, 1, 1,
-0.5423813, 0.6852043, -0.8029879, 1, 1, 1, 1, 1,
-0.5363051, -0.7197211, -3.42264, 1, 1, 1, 1, 1,
-0.5314546, -0.7074914, -2.471529, 1, 1, 1, 1, 1,
-0.528071, -1.174591, -2.255715, 1, 1, 1, 1, 1,
-0.5260574, 1.364665, 1.595112, 1, 1, 1, 1, 1,
-0.5249231, 1.361241, -3.022398, 1, 1, 1, 1, 1,
-0.5248899, 0.3320795, 0.2622245, 1, 1, 1, 1, 1,
-0.5237848, -0.4200359, -3.295295, 1, 1, 1, 1, 1,
-0.5177172, -0.6187791, -2.731823, 1, 1, 1, 1, 1,
-0.5130172, 0.9445135, 1.443773, 1, 1, 1, 1, 1,
-0.5094415, -0.6963532, -3.079252, 1, 1, 1, 1, 1,
-0.5080759, -0.3008238, -1.941993, 1, 1, 1, 1, 1,
-0.5070243, -1.420083, -1.948846, 0, 0, 1, 1, 1,
-0.50459, 0.5215876, -1.453808, 1, 0, 0, 1, 1,
-0.5000073, -0.4673059, -2.689848, 1, 0, 0, 1, 1,
-0.4980982, -0.2138699, -2.305372, 1, 0, 0, 1, 1,
-0.4977916, 0.05815344, -1.665456, 1, 0, 0, 1, 1,
-0.4947383, -0.9179766, -1.615871, 1, 0, 0, 1, 1,
-0.4930487, -0.06017363, -1.639966, 0, 0, 0, 1, 1,
-0.4917719, -0.6568085, -1.851864, 0, 0, 0, 1, 1,
-0.4848245, -0.6686359, -3.584394, 0, 0, 0, 1, 1,
-0.48406, -1.966075, -0.158674, 0, 0, 0, 1, 1,
-0.4791327, 1.153564, -0.1272326, 0, 0, 0, 1, 1,
-0.4751514, -0.5715669, -3.695828, 0, 0, 0, 1, 1,
-0.4748162, 0.1121974, -1.07868, 0, 0, 0, 1, 1,
-0.4744503, 0.1042887, -0.2890746, 1, 1, 1, 1, 1,
-0.4728919, 0.3504223, -1.746757, 1, 1, 1, 1, 1,
-0.472576, 0.2652166, -1.506678, 1, 1, 1, 1, 1,
-0.4716011, 0.1721875, -1.68926, 1, 1, 1, 1, 1,
-0.4704915, -0.7093142, -2.543847, 1, 1, 1, 1, 1,
-0.4647953, 2.610854, -0.1046472, 1, 1, 1, 1, 1,
-0.4629858, -0.4251591, -0.884921, 1, 1, 1, 1, 1,
-0.4627947, 1.132759, -1.171541, 1, 1, 1, 1, 1,
-0.4544045, -0.4629597, -1.225486, 1, 1, 1, 1, 1,
-0.450655, 1.534657, -0.07726508, 1, 1, 1, 1, 1,
-0.448592, 0.2804745, -0.3608945, 1, 1, 1, 1, 1,
-0.4410075, 0.1195886, -1.023373, 1, 1, 1, 1, 1,
-0.4405509, 0.5388485, -0.131553, 1, 1, 1, 1, 1,
-0.4404487, -0.5014287, -2.20978, 1, 1, 1, 1, 1,
-0.4377638, -1.628998, -3.56745, 1, 1, 1, 1, 1,
-0.4336736, 0.9332902, -0.4969759, 0, 0, 1, 1, 1,
-0.4328726, 0.03509424, -1.259006, 1, 0, 0, 1, 1,
-0.4313259, 1.857617, -0.5709611, 1, 0, 0, 1, 1,
-0.4284211, 0.3826075, -0.5536295, 1, 0, 0, 1, 1,
-0.428061, -0.5140356, -3.209728, 1, 0, 0, 1, 1,
-0.4213674, -0.6328846, -1.967993, 1, 0, 0, 1, 1,
-0.4210248, 1.410518, -0.8168596, 0, 0, 0, 1, 1,
-0.4191499, 0.6874129, 0.8938823, 0, 0, 0, 1, 1,
-0.4099563, 1.261561, -0.497443, 0, 0, 0, 1, 1,
-0.4069778, 0.9514823, 0.8183679, 0, 0, 0, 1, 1,
-0.4067168, -0.04281916, -0.9709833, 0, 0, 0, 1, 1,
-0.402708, -1.282564, -2.838408, 0, 0, 0, 1, 1,
-0.4006077, -0.5120063, -1.727093, 0, 0, 0, 1, 1,
-0.3988106, -0.8052766, -0.2474151, 1, 1, 1, 1, 1,
-0.398783, -1.247667, -2.05297, 1, 1, 1, 1, 1,
-0.3958031, 0.6094098, -0.2506454, 1, 1, 1, 1, 1,
-0.3942204, -2.207299, -2.870197, 1, 1, 1, 1, 1,
-0.3938829, 1.784965, -0.7186209, 1, 1, 1, 1, 1,
-0.3859614, -0.2908818, -2.792811, 1, 1, 1, 1, 1,
-0.383252, 1.460213, -0.620636, 1, 1, 1, 1, 1,
-0.3826946, -0.07880487, -0.9200425, 1, 1, 1, 1, 1,
-0.3822744, -1.495699, -2.690743, 1, 1, 1, 1, 1,
-0.3807334, 1.186979, -0.3948819, 1, 1, 1, 1, 1,
-0.3765783, -0.02806754, -0.0704704, 1, 1, 1, 1, 1,
-0.3715836, 0.2540618, -1.911624, 1, 1, 1, 1, 1,
-0.3696082, -1.291576, -2.406363, 1, 1, 1, 1, 1,
-0.3684637, -0.3848655, -4.026208, 1, 1, 1, 1, 1,
-0.3610379, -0.2481053, -0.2373577, 1, 1, 1, 1, 1,
-0.3608763, -0.4419501, -1.365636, 0, 0, 1, 1, 1,
-0.3595099, 0.01999874, -1.061845, 1, 0, 0, 1, 1,
-0.3547131, -1.781582, -2.296677, 1, 0, 0, 1, 1,
-0.3542323, -0.1888258, -3.137716, 1, 0, 0, 1, 1,
-0.3492349, -0.3618878, -1.481336, 1, 0, 0, 1, 1,
-0.3456492, -0.8254036, -3.114116, 1, 0, 0, 1, 1,
-0.3454293, 2.262939, -0.255533, 0, 0, 0, 1, 1,
-0.3421445, -0.3317367, -1.2052, 0, 0, 0, 1, 1,
-0.3411199, -2.268726, -2.309004, 0, 0, 0, 1, 1,
-0.3366253, 0.6098889, -0.3909618, 0, 0, 0, 1, 1,
-0.3351887, -0.2616152, 0.5258355, 0, 0, 0, 1, 1,
-0.3311373, 0.04039653, 0.3108655, 0, 0, 0, 1, 1,
-0.3299298, -1.136285, -4.63638, 0, 0, 0, 1, 1,
-0.329153, -0.1952771, -2.05292, 1, 1, 1, 1, 1,
-0.3267972, -0.864785, -2.836948, 1, 1, 1, 1, 1,
-0.323774, 0.7944562, -0.9637698, 1, 1, 1, 1, 1,
-0.3234532, -0.5669863, -3.850269, 1, 1, 1, 1, 1,
-0.3215248, 1.052554, 0.7590563, 1, 1, 1, 1, 1,
-0.3205219, 1.227506, -0.8319517, 1, 1, 1, 1, 1,
-0.3204835, -0.9984182, -2.575001, 1, 1, 1, 1, 1,
-0.318342, -0.905055, -2.363651, 1, 1, 1, 1, 1,
-0.3174419, 1.83743, 0.5916951, 1, 1, 1, 1, 1,
-0.3166367, -0.8913007, -3.968513, 1, 1, 1, 1, 1,
-0.3152534, -1.475366, -2.77219, 1, 1, 1, 1, 1,
-0.3051781, -1.187011, -2.937282, 1, 1, 1, 1, 1,
-0.2902681, 0.5590218, -1.327357, 1, 1, 1, 1, 1,
-0.2810733, -0.4630033, -1.034638, 1, 1, 1, 1, 1,
-0.2789111, -1.923898, -0.9589132, 1, 1, 1, 1, 1,
-0.2785815, -0.2250069, -1.01533, 0, 0, 1, 1, 1,
-0.2764547, -1.258703, -2.514778, 1, 0, 0, 1, 1,
-0.272629, 0.3795699, -0.2887661, 1, 0, 0, 1, 1,
-0.2654095, 1.092542, -2.248553, 1, 0, 0, 1, 1,
-0.2562698, 1.045887, -0.2712437, 1, 0, 0, 1, 1,
-0.2520716, 0.2335508, -0.4519092, 1, 0, 0, 1, 1,
-0.2514283, 1.299562, 2.070505, 0, 0, 0, 1, 1,
-0.2471918, -0.7195551, -1.636071, 0, 0, 0, 1, 1,
-0.2455448, 0.5188971, -0.5872179, 0, 0, 0, 1, 1,
-0.2447488, 0.3511223, -1.288597, 0, 0, 0, 1, 1,
-0.2433176, 0.5591971, 0.3433027, 0, 0, 0, 1, 1,
-0.2389894, 0.1731527, 1.49848, 0, 0, 0, 1, 1,
-0.2382826, -0.6102347, -3.727496, 0, 0, 0, 1, 1,
-0.2375592, 0.7329124, -1.041479, 1, 1, 1, 1, 1,
-0.2323172, -0.4869586, -2.970996, 1, 1, 1, 1, 1,
-0.2309894, -2.523415, -3.857322, 1, 1, 1, 1, 1,
-0.2296055, 0.1078175, 1.177881, 1, 1, 1, 1, 1,
-0.2274234, 0.7778495, 1.708132, 1, 1, 1, 1, 1,
-0.2252597, -1.006369, -2.571657, 1, 1, 1, 1, 1,
-0.2240808, -0.5421922, -4.046032, 1, 1, 1, 1, 1,
-0.2189898, -1.803966, -1.989214, 1, 1, 1, 1, 1,
-0.2167033, -1.804616, -3.090947, 1, 1, 1, 1, 1,
-0.214527, -0.21526, -3.401203, 1, 1, 1, 1, 1,
-0.2122754, 1.212526, 1.703117, 1, 1, 1, 1, 1,
-0.2105903, -0.1483943, -1.081145, 1, 1, 1, 1, 1,
-0.202154, 2.094345, -0.3256291, 1, 1, 1, 1, 1,
-0.2017255, 0.3814519, -0.07422706, 1, 1, 1, 1, 1,
-0.1988665, -0.4757703, -3.76182, 1, 1, 1, 1, 1,
-0.1933735, -0.6014454, -1.719982, 0, 0, 1, 1, 1,
-0.1923017, 1.368879, 0.3677302, 1, 0, 0, 1, 1,
-0.192278, 0.3881145, 1.449849, 1, 0, 0, 1, 1,
-0.1907612, -0.5658649, -1.046779, 1, 0, 0, 1, 1,
-0.1894877, 0.2016988, -1.346289, 1, 0, 0, 1, 1,
-0.1868217, -0.664288, -3.146147, 1, 0, 0, 1, 1,
-0.1809957, -1.678088, -3.449383, 0, 0, 0, 1, 1,
-0.1749009, 0.134527, -0.1201984, 0, 0, 0, 1, 1,
-0.1738589, -1.122944, -2.886522, 0, 0, 0, 1, 1,
-0.1728487, -0.7928851, -2.119339, 0, 0, 0, 1, 1,
-0.1727698, 0.6697761, -0.912144, 0, 0, 0, 1, 1,
-0.1686322, -1.139812, -3.45321, 0, 0, 0, 1, 1,
-0.1663136, 1.003556, 0.5651127, 0, 0, 0, 1, 1,
-0.1615657, -0.5875202, -3.913343, 1, 1, 1, 1, 1,
-0.1603312, 1.097404, 0.7256513, 1, 1, 1, 1, 1,
-0.1566047, -1.92036, -5.155097, 1, 1, 1, 1, 1,
-0.1498604, 1.362944, 0.2515179, 1, 1, 1, 1, 1,
-0.1433126, -0.9215508, -4.060805, 1, 1, 1, 1, 1,
-0.1372026, -0.2614835, -2.481711, 1, 1, 1, 1, 1,
-0.1362375, 2.448753, 0.5787728, 1, 1, 1, 1, 1,
-0.1339223, -1.296163, -1.782692, 1, 1, 1, 1, 1,
-0.1295319, -0.04688811, -2.073638, 1, 1, 1, 1, 1,
-0.1159618, -0.9237378, -3.133705, 1, 1, 1, 1, 1,
-0.1145417, 0.6401259, -0.2199717, 1, 1, 1, 1, 1,
-0.1092198, -0.6683649, -3.752561, 1, 1, 1, 1, 1,
-0.1078959, 0.3875252, -0.6335732, 1, 1, 1, 1, 1,
-0.1078382, 0.448074, -0.1317561, 1, 1, 1, 1, 1,
-0.1062744, 0.9647204, -1.855801, 1, 1, 1, 1, 1,
-0.1015618, -0.3677711, -3.906959, 0, 0, 1, 1, 1,
-0.09951474, -1.114103, -2.27304, 1, 0, 0, 1, 1,
-0.09895945, -0.3058904, -2.704396, 1, 0, 0, 1, 1,
-0.09400132, 2.498521, 1.895647, 1, 0, 0, 1, 1,
-0.08667243, 1.898885, -0.339541, 1, 0, 0, 1, 1,
-0.08654429, -1.866536, -3.866564, 1, 0, 0, 1, 1,
-0.08470625, 0.7144753, -1.624109, 0, 0, 0, 1, 1,
-0.08250179, 0.575473, 0.2221283, 0, 0, 0, 1, 1,
-0.08159801, 0.8757784, -0.6750809, 0, 0, 0, 1, 1,
-0.06894874, -0.02393995, -3.399813, 0, 0, 0, 1, 1,
-0.06826973, 1.842878, -0.8989004, 0, 0, 0, 1, 1,
-0.06263589, 1.021767, 0.5747634, 0, 0, 0, 1, 1,
-0.06050899, -0.6595577, -4.993341, 0, 0, 0, 1, 1,
-0.05552333, 1.704651, -2.066732, 1, 1, 1, 1, 1,
-0.05142303, -1.25643, -2.193874, 1, 1, 1, 1, 1,
-0.04245061, -0.2308657, -2.160057, 1, 1, 1, 1, 1,
-0.03852529, -0.6743977, -3.054449, 1, 1, 1, 1, 1,
-0.03736199, -2.997449, -5.113733, 1, 1, 1, 1, 1,
-0.03597271, -0.06406748, -4.350205, 1, 1, 1, 1, 1,
-0.03330253, -1.304114, -4.016916, 1, 1, 1, 1, 1,
-0.03135847, -0.2940197, -1.627203, 1, 1, 1, 1, 1,
-0.03071604, 0.2716504, 0.2724261, 1, 1, 1, 1, 1,
-0.02964421, 0.3035165, -0.4351322, 1, 1, 1, 1, 1,
-0.02921041, -0.09294312, -1.768188, 1, 1, 1, 1, 1,
-0.02827672, 0.3138247, 1.67466, 1, 1, 1, 1, 1,
-0.02663116, 0.9502212, -0.5176928, 1, 1, 1, 1, 1,
-0.01680647, -0.4439673, -4.10877, 1, 1, 1, 1, 1,
-0.01585978, -0.4757496, -3.124476, 1, 1, 1, 1, 1,
-0.01569418, 0.08947353, -0.230327, 0, 0, 1, 1, 1,
-0.01251167, -0.826528, -3.921264, 1, 0, 0, 1, 1,
-0.01151999, 0.3793842, -1.005793, 1, 0, 0, 1, 1,
-0.01107782, 0.1029123, -0.27796, 1, 0, 0, 1, 1,
-0.01071896, 0.6766477, 0.8827589, 1, 0, 0, 1, 1,
-0.007714712, 0.8764597, 0.6424637, 1, 0, 0, 1, 1,
-0.004536728, 0.2350307, 1.366124, 0, 0, 0, 1, 1,
-0.001526928, -1.835992, -3.313525, 0, 0, 0, 1, 1,
-0.0007147493, 0.4044372, -0.5963878, 0, 0, 0, 1, 1,
0.003437031, 1.307562, -0.8527752, 0, 0, 0, 1, 1,
0.00777481, 1.105577, -1.927988, 0, 0, 0, 1, 1,
0.007919668, 0.2108864, -1.905012, 0, 0, 0, 1, 1,
0.009436373, 0.003953656, 0.8181678, 0, 0, 0, 1, 1,
0.0137096, 0.6470033, -0.2681564, 1, 1, 1, 1, 1,
0.01382867, 1.446367, -0.1095024, 1, 1, 1, 1, 1,
0.01395497, -0.2129872, 3.463967, 1, 1, 1, 1, 1,
0.01477213, 0.5003576, -0.6278661, 1, 1, 1, 1, 1,
0.02112373, 0.5009645, 0.5671661, 1, 1, 1, 1, 1,
0.02135379, -0.3977719, 2.900203, 1, 1, 1, 1, 1,
0.0237699, -0.3961731, 1.741968, 1, 1, 1, 1, 1,
0.02442134, 0.7477016, 0.805383, 1, 1, 1, 1, 1,
0.02714573, -0.301443, 4.116607, 1, 1, 1, 1, 1,
0.02923432, -0.2765552, 3.361712, 1, 1, 1, 1, 1,
0.03220493, -0.8518141, 2.36413, 1, 1, 1, 1, 1,
0.03843825, -0.6887481, 3.073833, 1, 1, 1, 1, 1,
0.04110764, -1.815374, 2.970854, 1, 1, 1, 1, 1,
0.04224869, -0.1472602, -0.1862703, 1, 1, 1, 1, 1,
0.04537837, -0.01920986, 3.161617, 1, 1, 1, 1, 1,
0.04808796, -0.6005467, 4.630306, 0, 0, 1, 1, 1,
0.04850389, -0.9906518, 2.194963, 1, 0, 0, 1, 1,
0.04855353, -1.242214, 1.896455, 1, 0, 0, 1, 1,
0.05298891, -0.2651635, 3.82037, 1, 0, 0, 1, 1,
0.05473399, -0.3675203, 4.502264, 1, 0, 0, 1, 1,
0.05598444, 1.502392, -1.042792, 1, 0, 0, 1, 1,
0.05626207, -0.4892517, 4.075706, 0, 0, 0, 1, 1,
0.05866723, -0.6159669, 2.014062, 0, 0, 0, 1, 1,
0.06205326, -0.6454268, 3.158581, 0, 0, 0, 1, 1,
0.06322504, 1.570878, 0.5000476, 0, 0, 0, 1, 1,
0.06382948, 0.2582406, -0.3589346, 0, 0, 0, 1, 1,
0.06533182, 0.8084666, -0.5466096, 0, 0, 0, 1, 1,
0.06573643, -0.3215035, 1.760038, 0, 0, 0, 1, 1,
0.06969014, -0.8717342, 4.044038, 1, 1, 1, 1, 1,
0.07402034, 0.7808473, 0.521099, 1, 1, 1, 1, 1,
0.07553967, -1.450498, 3.721956, 1, 1, 1, 1, 1,
0.07666195, 0.3360672, 1.639542, 1, 1, 1, 1, 1,
0.07973924, -0.1013911, 2.83687, 1, 1, 1, 1, 1,
0.08108346, -2.191989, 2.660942, 1, 1, 1, 1, 1,
0.08123157, -0.658933, 2.203128, 1, 1, 1, 1, 1,
0.082519, -0.8829594, 3.504635, 1, 1, 1, 1, 1,
0.08458193, 1.052332, -0.9140353, 1, 1, 1, 1, 1,
0.08530911, -0.3327958, 3.80218, 1, 1, 1, 1, 1,
0.08594409, -0.7460341, 4.408412, 1, 1, 1, 1, 1,
0.09451742, -0.194283, 3.796248, 1, 1, 1, 1, 1,
0.09519075, 0.2152902, 0.3692579, 1, 1, 1, 1, 1,
0.09729017, 1.4782, 1.409201, 1, 1, 1, 1, 1,
0.1025098, 0.03059057, 3.385483, 1, 1, 1, 1, 1,
0.1027367, -2.634617, 3.465719, 0, 0, 1, 1, 1,
0.1081506, 0.4660772, 0.8662702, 1, 0, 0, 1, 1,
0.1104044, -0.8633223, 3.31223, 1, 0, 0, 1, 1,
0.1118097, -0.1313961, 2.851997, 1, 0, 0, 1, 1,
0.1154444, -0.01827293, 2.25492, 1, 0, 0, 1, 1,
0.1201603, -0.04783398, 1.350293, 1, 0, 0, 1, 1,
0.1233694, -0.7385459, 3.80158, 0, 0, 0, 1, 1,
0.125683, -0.4060681, 3.980334, 0, 0, 0, 1, 1,
0.1295337, 0.5019541, -1.092936, 0, 0, 0, 1, 1,
0.1338719, 1.454975, -0.3620625, 0, 0, 0, 1, 1,
0.1340595, 0.6512558, 0.7658168, 0, 0, 0, 1, 1,
0.1376466, -0.8099449, 2.444407, 0, 0, 0, 1, 1,
0.1412179, -2.167973, 2.484504, 0, 0, 0, 1, 1,
0.1425382, 1.487535, 0.9859603, 1, 1, 1, 1, 1,
0.1438446, 0.6813444, 1.275962, 1, 1, 1, 1, 1,
0.1455994, 0.8093742, -0.4304292, 1, 1, 1, 1, 1,
0.146885, -0.4475115, 3.898493, 1, 1, 1, 1, 1,
0.150912, -0.8463776, 3.877443, 1, 1, 1, 1, 1,
0.1513143, 1.189672, 1.206442, 1, 1, 1, 1, 1,
0.1515288, -0.5797337, 2.789518, 1, 1, 1, 1, 1,
0.1532566, -1.139885, 3.054595, 1, 1, 1, 1, 1,
0.1580004, 1.888049, -0.6421649, 1, 1, 1, 1, 1,
0.1601975, 1.936015, -0.0839025, 1, 1, 1, 1, 1,
0.1662675, 0.9903605, -0.8743201, 1, 1, 1, 1, 1,
0.1669703, -0.4805652, 3.080555, 1, 1, 1, 1, 1,
0.1681058, 0.0292365, 2.190757, 1, 1, 1, 1, 1,
0.1691066, -1.149819, 3.439126, 1, 1, 1, 1, 1,
0.1692805, 1.720787, 0.4219108, 1, 1, 1, 1, 1,
0.1706607, -0.4015629, 1.343121, 0, 0, 1, 1, 1,
0.1729452, 0.1034929, 0.1934521, 1, 0, 0, 1, 1,
0.1763912, -0.9245054, 0.9206199, 1, 0, 0, 1, 1,
0.1790252, -1.570856, 3.756776, 1, 0, 0, 1, 1,
0.1831198, -0.3886277, 3.300293, 1, 0, 0, 1, 1,
0.1872075, 2.111681, -0.4360669, 1, 0, 0, 1, 1,
0.1898636, -0.73734, 2.902152, 0, 0, 0, 1, 1,
0.1903793, 0.4116043, -0.004896331, 0, 0, 0, 1, 1,
0.1924453, 1.257077, 0.3912489, 0, 0, 0, 1, 1,
0.1937914, -0.8451695, 3.28423, 0, 0, 0, 1, 1,
0.1948021, 2.10631, -0.9681335, 0, 0, 0, 1, 1,
0.1957281, -0.06762158, 2.070628, 0, 0, 0, 1, 1,
0.2065066, 1.099796, 0.3755426, 0, 0, 0, 1, 1,
0.2085229, -0.3311093, 1.633247, 1, 1, 1, 1, 1,
0.208803, 1.539366, -1.476068, 1, 1, 1, 1, 1,
0.2112515, 2.876871, 0.8481826, 1, 1, 1, 1, 1,
0.2118637, -1.204698, 3.085533, 1, 1, 1, 1, 1,
0.2129965, -1.240846, 3.572485, 1, 1, 1, 1, 1,
0.2135635, -0.3312453, 2.019887, 1, 1, 1, 1, 1,
0.2138009, -0.5010827, 2.709566, 1, 1, 1, 1, 1,
0.2155115, 0.4459926, 0.796831, 1, 1, 1, 1, 1,
0.2166714, 1.947858, -0.1337777, 1, 1, 1, 1, 1,
0.2194007, -0.9082235, 1.744072, 1, 1, 1, 1, 1,
0.2241373, 1.306273, 1.847593, 1, 1, 1, 1, 1,
0.2321875, -0.455123, 1.48545, 1, 1, 1, 1, 1,
0.2347794, -2.126979, 4.403225, 1, 1, 1, 1, 1,
0.2377727, 0.3002471, 0.08312254, 1, 1, 1, 1, 1,
0.2401462, 0.3981063, -0.04158085, 1, 1, 1, 1, 1,
0.2451577, -0.4953112, 1.944747, 0, 0, 1, 1, 1,
0.248857, 1.066134, 0.09134319, 1, 0, 0, 1, 1,
0.2497088, 0.5239838, -0.9827187, 1, 0, 0, 1, 1,
0.2498699, 0.4571198, 0.617536, 1, 0, 0, 1, 1,
0.252607, 2.38717, 0.8202279, 1, 0, 0, 1, 1,
0.2603664, -0.5688883, 3.174328, 1, 0, 0, 1, 1,
0.2622063, -1.242366, 2.916147, 0, 0, 0, 1, 1,
0.2656243, 1.119324, 0.7509778, 0, 0, 0, 1, 1,
0.269702, 1.359171, 0.9663588, 0, 0, 0, 1, 1,
0.2734579, 1.020889, 0.3698906, 0, 0, 0, 1, 1,
0.2744013, -0.05600873, 1.090106, 0, 0, 0, 1, 1,
0.2749043, -0.591664, 0.9203348, 0, 0, 0, 1, 1,
0.2758847, -0.2680773, 1.822077, 0, 0, 0, 1, 1,
0.2763421, 0.7854322, 1.52521, 1, 1, 1, 1, 1,
0.277477, -2.316891, 2.503814, 1, 1, 1, 1, 1,
0.2788602, 0.1332414, 3.254459, 1, 1, 1, 1, 1,
0.2801608, -1.029614, 3.22932, 1, 1, 1, 1, 1,
0.2858185, 0.8553565, -0.9574393, 1, 1, 1, 1, 1,
0.2861524, -0.6186939, 2.318737, 1, 1, 1, 1, 1,
0.287601, -1.411701, 3.888752, 1, 1, 1, 1, 1,
0.2908585, -1.345904, 3.380507, 1, 1, 1, 1, 1,
0.2965815, -1.336389, 2.030297, 1, 1, 1, 1, 1,
0.2977822, 0.5840347, -0.5767223, 1, 1, 1, 1, 1,
0.2978284, -1.251051, 1.428297, 1, 1, 1, 1, 1,
0.3024323, 1.304312, 1.687691, 1, 1, 1, 1, 1,
0.3072245, -1.753457, 3.430986, 1, 1, 1, 1, 1,
0.3078576, -0.05788643, 1.762782, 1, 1, 1, 1, 1,
0.3136989, 0.7166444, 0.1244862, 1, 1, 1, 1, 1,
0.3152955, 0.04879426, 2.383635, 0, 0, 1, 1, 1,
0.3173527, -0.5683049, 2.10588, 1, 0, 0, 1, 1,
0.3179286, -0.4214632, 1.493369, 1, 0, 0, 1, 1,
0.318145, 0.01863411, 2.295054, 1, 0, 0, 1, 1,
0.3270365, -0.2107658, 0.6526932, 1, 0, 0, 1, 1,
0.3283164, -0.262667, 2.647734, 1, 0, 0, 1, 1,
0.3294051, -0.202996, 3.482891, 0, 0, 0, 1, 1,
0.3314306, -1.411497, 2.207468, 0, 0, 0, 1, 1,
0.3330862, 0.8278875, -0.134141, 0, 0, 0, 1, 1,
0.3347591, 0.2533181, 1.482297, 0, 0, 0, 1, 1,
0.3387802, -0.0662457, 1.055713, 0, 0, 0, 1, 1,
0.3394289, -0.07844, 1.551171, 0, 0, 0, 1, 1,
0.3425133, 0.6005354, -0.09275242, 0, 0, 0, 1, 1,
0.3483184, 1.713775, 0.3809107, 1, 1, 1, 1, 1,
0.3486285, 0.7896205, -1.068937, 1, 1, 1, 1, 1,
0.3559861, -0.2267484, 2.672795, 1, 1, 1, 1, 1,
0.3602579, -0.2532334, 2.730902, 1, 1, 1, 1, 1,
0.3605237, -0.2592983, 1.450763, 1, 1, 1, 1, 1,
0.3613971, 0.3823387, -0.3492134, 1, 1, 1, 1, 1,
0.3616414, -0.6296549, 1.080179, 1, 1, 1, 1, 1,
0.3657427, 2.358065, 0.814814, 1, 1, 1, 1, 1,
0.3693716, 1.132365, 0.9995114, 1, 1, 1, 1, 1,
0.3721923, -0.1301433, 1.940493, 1, 1, 1, 1, 1,
0.3748208, 0.9109952, 1.052053, 1, 1, 1, 1, 1,
0.3754861, 2.013943, -0.9116014, 1, 1, 1, 1, 1,
0.3762201, 1.61237, 1.596288, 1, 1, 1, 1, 1,
0.377036, -0.6120877, 4.155169, 1, 1, 1, 1, 1,
0.3812271, -0.00852181, 2.076806, 1, 1, 1, 1, 1,
0.3813249, 0.3363674, 2.225648, 0, 0, 1, 1, 1,
0.3824407, -0.2176437, 1.968855, 1, 0, 0, 1, 1,
0.3853333, -0.8764324, 2.702978, 1, 0, 0, 1, 1,
0.3875913, 1.247501, 1.394366, 1, 0, 0, 1, 1,
0.390409, -0.8247765, 4.478064, 1, 0, 0, 1, 1,
0.3913583, -0.8973941, 2.683399, 1, 0, 0, 1, 1,
0.3934412, -1.032598, 2.885473, 0, 0, 0, 1, 1,
0.3968036, -0.1183278, 2.160375, 0, 0, 0, 1, 1,
0.3991039, 1.13613, -0.8058597, 0, 0, 0, 1, 1,
0.4013979, 0.1571825, 0.9469653, 0, 0, 0, 1, 1,
0.4017851, -0.9252339, 0.9015453, 0, 0, 0, 1, 1,
0.4025251, -1.847876, 3.247326, 0, 0, 0, 1, 1,
0.4075097, -0.7190629, 1.412448, 0, 0, 0, 1, 1,
0.4084366, -0.7881382, 1.927476, 1, 1, 1, 1, 1,
0.4094335, -0.9171704, 3.85287, 1, 1, 1, 1, 1,
0.4109567, -0.4041533, 1.184211, 1, 1, 1, 1, 1,
0.4166165, 1.801865, -0.7825164, 1, 1, 1, 1, 1,
0.4173645, 0.4029482, 0.4583207, 1, 1, 1, 1, 1,
0.4176, 0.502685, 1.056913, 1, 1, 1, 1, 1,
0.4191389, 2.190216, 1.602604, 1, 1, 1, 1, 1,
0.4209354, -0.5029395, 2.520512, 1, 1, 1, 1, 1,
0.4228529, -2.475029, 2.400534, 1, 1, 1, 1, 1,
0.4239417, -0.3811141, 2.653874, 1, 1, 1, 1, 1,
0.4255389, -0.2343885, 2.591575, 1, 1, 1, 1, 1,
0.4272785, 0.952382, -0.2795606, 1, 1, 1, 1, 1,
0.427312, -0.1024929, 1.763664, 1, 1, 1, 1, 1,
0.4280294, 0.02270883, 1.585056, 1, 1, 1, 1, 1,
0.4290408, -1.736943, 3.188901, 1, 1, 1, 1, 1,
0.4302657, -0.2291977, 3.397148, 0, 0, 1, 1, 1,
0.4344582, 0.05536515, -0.6112169, 1, 0, 0, 1, 1,
0.4423127, -0.4440504, 0.2285384, 1, 0, 0, 1, 1,
0.4436209, -0.03340905, 2.115151, 1, 0, 0, 1, 1,
0.4480565, -0.1764754, 2.959828, 1, 0, 0, 1, 1,
0.4565719, 0.2591371, 0.1179422, 1, 0, 0, 1, 1,
0.456938, -0.1584502, 2.171734, 0, 0, 0, 1, 1,
0.459287, -0.4568012, 1.798216, 0, 0, 0, 1, 1,
0.4594508, -0.3997197, 2.157196, 0, 0, 0, 1, 1,
0.464839, 0.6226413, -2.312203, 0, 0, 0, 1, 1,
0.4656629, 0.6203749, 0.7980326, 0, 0, 0, 1, 1,
0.4665097, -0.351954, 1.798968, 0, 0, 0, 1, 1,
0.4695503, 0.5158485, 2.725155, 0, 0, 0, 1, 1,
0.4715669, 0.2717158, 0.7917028, 1, 1, 1, 1, 1,
0.4786, -0.3754879, 2.756676, 1, 1, 1, 1, 1,
0.4803992, 0.8005418, 0.05051265, 1, 1, 1, 1, 1,
0.4815656, -0.563302, 2.664129, 1, 1, 1, 1, 1,
0.4831892, 1.561379, -0.6494835, 1, 1, 1, 1, 1,
0.4875752, -1.655981, 3.392038, 1, 1, 1, 1, 1,
0.4890557, 1.464223, 0.3619848, 1, 1, 1, 1, 1,
0.4899802, 1.045957, 0.8168916, 1, 1, 1, 1, 1,
0.4932931, 0.07341383, 0.568053, 1, 1, 1, 1, 1,
0.4972578, 1.18494, -0.6681533, 1, 1, 1, 1, 1,
0.4983126, 0.3566079, 1.476968, 1, 1, 1, 1, 1,
0.4994354, -0.02767145, 1.714802, 1, 1, 1, 1, 1,
0.4997394, 0.1523326, 0.8110363, 1, 1, 1, 1, 1,
0.5013487, 0.1580864, 2.264799, 1, 1, 1, 1, 1,
0.5024751, -0.2115072, 3.175936, 1, 1, 1, 1, 1,
0.502687, 0.1171135, 1.615386, 0, 0, 1, 1, 1,
0.503472, -0.1167374, 2.412944, 1, 0, 0, 1, 1,
0.5048548, -0.8116172, 4.132277, 1, 0, 0, 1, 1,
0.5097897, 0.1839266, 1.854605, 1, 0, 0, 1, 1,
0.5135534, 0.05155932, 3.336598, 1, 0, 0, 1, 1,
0.5167572, -0.1471, 1.447842, 1, 0, 0, 1, 1,
0.5186781, -0.3056849, 0.4530909, 0, 0, 0, 1, 1,
0.5202281, -0.3603972, 3.012821, 0, 0, 0, 1, 1,
0.5202572, 0.1185751, 2.588955, 0, 0, 0, 1, 1,
0.5228341, -0.2421901, 2.849703, 0, 0, 0, 1, 1,
0.5254787, -0.8429019, 2.964987, 0, 0, 0, 1, 1,
0.5286398, -0.2563404, 3.320374, 0, 0, 0, 1, 1,
0.5382181, -1.840495, 2.982899, 0, 0, 0, 1, 1,
0.5419989, 1.329905, 0.350633, 1, 1, 1, 1, 1,
0.543283, 0.1956062, 2.467326, 1, 1, 1, 1, 1,
0.54713, -1.323942, 2.408135, 1, 1, 1, 1, 1,
0.5511682, -1.034607, 3.481372, 1, 1, 1, 1, 1,
0.5541937, -0.1693256, 1.84762, 1, 1, 1, 1, 1,
0.5578556, -0.3436963, 2.301701, 1, 1, 1, 1, 1,
0.5593086, -0.7678889, 2.479345, 1, 1, 1, 1, 1,
0.5595908, -0.9676572, 3.806242, 1, 1, 1, 1, 1,
0.5611019, 1.261615, 0.7323335, 1, 1, 1, 1, 1,
0.5671492, 0.0754768, 2.345533, 1, 1, 1, 1, 1,
0.5722482, 1.33285, -0.1784162, 1, 1, 1, 1, 1,
0.5729181, -0.8106984, 2.086957, 1, 1, 1, 1, 1,
0.5732581, -0.979654, 2.088042, 1, 1, 1, 1, 1,
0.5732926, -0.9123994, 3.291257, 1, 1, 1, 1, 1,
0.5764631, 0.04117569, -0.007372081, 1, 1, 1, 1, 1,
0.5794176, 0.7594414, 0.5609984, 0, 0, 1, 1, 1,
0.58141, -1.196925, 3.082963, 1, 0, 0, 1, 1,
0.5838611, -0.01738869, 0.6808012, 1, 0, 0, 1, 1,
0.5843873, 0.7809752, 0.04494575, 1, 0, 0, 1, 1,
0.5846167, 1.537921, -0.06942229, 1, 0, 0, 1, 1,
0.5851197, 1.477872, 0.550317, 1, 0, 0, 1, 1,
0.5854265, 1.116766, 1.282817, 0, 0, 0, 1, 1,
0.5855717, 0.2246365, 2.068399, 0, 0, 0, 1, 1,
0.5879695, -1.401498, 2.337187, 0, 0, 0, 1, 1,
0.5913371, -0.9446062, 3.182929, 0, 0, 0, 1, 1,
0.5976245, -1.259748, 4.88001, 0, 0, 0, 1, 1,
0.5989821, 0.1088264, 1.164901, 0, 0, 0, 1, 1,
0.6020809, 1.191808, -1.332186, 0, 0, 0, 1, 1,
0.602791, -0.266284, 0.9600017, 1, 1, 1, 1, 1,
0.6063358, -2.138008, 0.6805977, 1, 1, 1, 1, 1,
0.6210731, 1.342135, -0.9679957, 1, 1, 1, 1, 1,
0.6263441, 0.3912764, 0.8186888, 1, 1, 1, 1, 1,
0.6268421, -0.2571422, 2.475516, 1, 1, 1, 1, 1,
0.6328456, 0.7559964, 1.096587, 1, 1, 1, 1, 1,
0.6371291, -0.714512, 1.871873, 1, 1, 1, 1, 1,
0.6390636, -0.3819337, 2.149126, 1, 1, 1, 1, 1,
0.6425757, 0.2056405, 1.987822, 1, 1, 1, 1, 1,
0.6448297, 0.09654938, 2.630982, 1, 1, 1, 1, 1,
0.646814, 0.002877037, 1.654953, 1, 1, 1, 1, 1,
0.6469409, -0.674364, 1.277471, 1, 1, 1, 1, 1,
0.6473649, 0.6071849, 1.548643, 1, 1, 1, 1, 1,
0.6532331, -1.362633, 4.195249, 1, 1, 1, 1, 1,
0.6566274, -0.4093473, 1.067116, 1, 1, 1, 1, 1,
0.6576697, -1.392829, 2.239117, 0, 0, 1, 1, 1,
0.6608341, 1.314586, -0.4047104, 1, 0, 0, 1, 1,
0.664455, 0.4620675, 0.2958141, 1, 0, 0, 1, 1,
0.6719013, -0.7899079, 3.492777, 1, 0, 0, 1, 1,
0.6761488, 0.7256496, 0.6801249, 1, 0, 0, 1, 1,
0.6762567, 1.722829, 1.685878, 1, 0, 0, 1, 1,
0.6768517, 0.2565198, 2.785255, 0, 0, 0, 1, 1,
0.6932618, -0.5167348, 3.019202, 0, 0, 0, 1, 1,
0.6967224, -0.7550019, 2.651415, 0, 0, 0, 1, 1,
0.7009901, -0.1918302, 1.661962, 0, 0, 0, 1, 1,
0.7010963, -0.7951798, 2.870709, 0, 0, 0, 1, 1,
0.7039973, 0.4230925, -0.02763421, 0, 0, 0, 1, 1,
0.7040444, -1.00423, 3.101083, 0, 0, 0, 1, 1,
0.7088394, -0.6804184, 3.377676, 1, 1, 1, 1, 1,
0.7208262, -0.7698151, 3.448251, 1, 1, 1, 1, 1,
0.7255145, -0.6344752, 2.822211, 1, 1, 1, 1, 1,
0.728569, -0.01553714, 2.27975, 1, 1, 1, 1, 1,
0.7294825, -1.024899, 1.459557, 1, 1, 1, 1, 1,
0.7318754, 0.6511597, 0.9454135, 1, 1, 1, 1, 1,
0.7359006, -1.122957, 0.6793797, 1, 1, 1, 1, 1,
0.7376329, -0.6409038, 0.5060582, 1, 1, 1, 1, 1,
0.7384778, -0.1900093, 1.408751, 1, 1, 1, 1, 1,
0.7397864, 0.6043177, 0.8969591, 1, 1, 1, 1, 1,
0.7399415, 0.3512919, 1.935447, 1, 1, 1, 1, 1,
0.7449464, 1.125286, 2.084121, 1, 1, 1, 1, 1,
0.7478058, 1.28139, 1.837669, 1, 1, 1, 1, 1,
0.7534241, 0.5650538, 1.284431, 1, 1, 1, 1, 1,
0.7548044, -0.1398782, 3.767546, 1, 1, 1, 1, 1,
0.757103, -0.9574949, 1.732159, 0, 0, 1, 1, 1,
0.7584915, -1.351729, 4.116902, 1, 0, 0, 1, 1,
0.7600583, 0.8597309, -0.2189672, 1, 0, 0, 1, 1,
0.761229, 0.5413829, 0.2868824, 1, 0, 0, 1, 1,
0.7648497, 0.09848086, 0.2322112, 1, 0, 0, 1, 1,
0.7692567, -1.859306, 2.585888, 1, 0, 0, 1, 1,
0.7778901, 1.357527, -0.9666762, 0, 0, 0, 1, 1,
0.780005, -1.388847, 1.597817, 0, 0, 0, 1, 1,
0.7852251, 1.114975, 0.5721447, 0, 0, 0, 1, 1,
0.789189, -0.5551572, 2.617033, 0, 0, 0, 1, 1,
0.7953738, -0.1310608, 2.896654, 0, 0, 0, 1, 1,
0.7969815, 0.4658077, 2.219965, 0, 0, 0, 1, 1,
0.7986584, 2.457484, -1.338688, 0, 0, 0, 1, 1,
0.8115984, 0.5924398, 0.4439358, 1, 1, 1, 1, 1,
0.8144559, -0.3698331, 2.799651, 1, 1, 1, 1, 1,
0.8145431, -0.3899755, 1.400201, 1, 1, 1, 1, 1,
0.8188006, -0.2789318, 2.196736, 1, 1, 1, 1, 1,
0.819812, 0.2644472, 0.5565133, 1, 1, 1, 1, 1,
0.8257623, 1.083344, 0.3660562, 1, 1, 1, 1, 1,
0.8263479, 1.473769, 0.8969038, 1, 1, 1, 1, 1,
0.826553, 0.920841, 2.297717, 1, 1, 1, 1, 1,
0.8273879, 1.020552, -0.3558809, 1, 1, 1, 1, 1,
0.8282855, 0.5180018, 1.263256, 1, 1, 1, 1, 1,
0.8361493, 1.148831, 1.944327, 1, 1, 1, 1, 1,
0.8370402, -2.052532, 2.539433, 1, 1, 1, 1, 1,
0.8384571, 0.7498695, 1.853582, 1, 1, 1, 1, 1,
0.8409047, 0.3098306, 0.215443, 1, 1, 1, 1, 1,
0.8417965, 0.3905927, 0.08268242, 1, 1, 1, 1, 1,
0.8457513, 1.623582, 1.414086, 0, 0, 1, 1, 1,
0.8514147, -0.03706168, 2.034373, 1, 0, 0, 1, 1,
0.8520052, 0.4136729, 0.2691724, 1, 0, 0, 1, 1,
0.8741612, -1.291906, 1.714912, 1, 0, 0, 1, 1,
0.8752912, -0.4583928, 2.969357, 1, 0, 0, 1, 1,
0.8781269, -0.5359237, 0.6063894, 1, 0, 0, 1, 1,
0.8788185, 0.7755108, 0.7026474, 0, 0, 0, 1, 1,
0.8837672, 0.187135, 1.914816, 0, 0, 0, 1, 1,
0.8989265, 0.6709647, 1.269134, 0, 0, 0, 1, 1,
0.899079, -1.402872, 1.540354, 0, 0, 0, 1, 1,
0.8999729, -0.03547559, 2.747374, 0, 0, 0, 1, 1,
0.9062589, 0.2480353, 1.440654, 0, 0, 0, 1, 1,
0.906907, 0.8081055, 0.7953027, 0, 0, 0, 1, 1,
0.9074767, 0.8908598, 1.006961, 1, 1, 1, 1, 1,
0.9102017, -0.4001455, 0.364888, 1, 1, 1, 1, 1,
0.913514, -1.235855, 1.467099, 1, 1, 1, 1, 1,
0.9136708, 0.2038927, 0.5649689, 1, 1, 1, 1, 1,
0.9176842, 0.9418814, 0.08767565, 1, 1, 1, 1, 1,
0.9187112, -0.1520088, 1.843834, 1, 1, 1, 1, 1,
0.9202342, -0.2905796, 1.394763, 1, 1, 1, 1, 1,
0.9240898, 0.4083245, 1.09236, 1, 1, 1, 1, 1,
0.9255898, 0.8089692, 2.22523, 1, 1, 1, 1, 1,
0.9272212, -0.5418535, 0.9006171, 1, 1, 1, 1, 1,
0.933532, 0.904389, -0.6663402, 1, 1, 1, 1, 1,
0.9339963, -1.18584, 3.400809, 1, 1, 1, 1, 1,
0.9350283, -1.83826, 3.465458, 1, 1, 1, 1, 1,
0.9368345, -0.6817275, 2.046309, 1, 1, 1, 1, 1,
0.9427276, -0.08412993, -0.76493, 1, 1, 1, 1, 1,
0.9599552, 0.4548076, 0.5631856, 0, 0, 1, 1, 1,
0.9696012, -0.6003509, 3.301687, 1, 0, 0, 1, 1,
0.9710419, 2.209851, -1.913542, 1, 0, 0, 1, 1,
0.973459, -0.9808688, 2.450873, 1, 0, 0, 1, 1,
0.9743601, -0.3136152, 2.612676, 1, 0, 0, 1, 1,
0.979398, -0.4967081, 2.529614, 1, 0, 0, 1, 1,
0.981374, 0.366729, -0.8998291, 0, 0, 0, 1, 1,
0.9873113, -0.05157038, -0.2015475, 0, 0, 0, 1, 1,
0.991702, 0.1347817, 0.8921544, 0, 0, 0, 1, 1,
0.9917542, -0.5816075, 1.108791, 0, 0, 0, 1, 1,
0.9921857, 2.798714, 0.2835632, 0, 0, 0, 1, 1,
0.9976175, 2.218858, -0.3076399, 0, 0, 0, 1, 1,
0.9987294, 1.498904, 0.1460808, 0, 0, 0, 1, 1,
1.003207, -1.069319, 4.635194, 1, 1, 1, 1, 1,
1.016411, 0.6666266, 1.684001, 1, 1, 1, 1, 1,
1.019338, 0.2551616, 1.886392, 1, 1, 1, 1, 1,
1.020252, -0.7071063, 2.610222, 1, 1, 1, 1, 1,
1.02385, -0.9712046, 1.568463, 1, 1, 1, 1, 1,
1.028075, 0.4900838, 0.8777861, 1, 1, 1, 1, 1,
1.036315, -0.3632741, 1.790082, 1, 1, 1, 1, 1,
1.038069, 0.428414, 0.5218183, 1, 1, 1, 1, 1,
1.041768, 0.1247948, 0.3570484, 1, 1, 1, 1, 1,
1.055128, 0.6251516, 1.184059, 1, 1, 1, 1, 1,
1.055692, -1.357444, 2.548548, 1, 1, 1, 1, 1,
1.056283, -0.7821109, 1.52796, 1, 1, 1, 1, 1,
1.06302, -0.2890922, 2.125614, 1, 1, 1, 1, 1,
1.074691, 0.6084846, 0.4627385, 1, 1, 1, 1, 1,
1.075575, -0.3154411, 2.644702, 1, 1, 1, 1, 1,
1.076491, 1.917677, 0.917017, 0, 0, 1, 1, 1,
1.08252, -0.1209056, 2.116235, 1, 0, 0, 1, 1,
1.088975, 1.011847, 0.940551, 1, 0, 0, 1, 1,
1.091674, 0.3747427, 0.9383906, 1, 0, 0, 1, 1,
1.099086, 0.5678822, 1.720876, 1, 0, 0, 1, 1,
1.101073, -0.7909518, 2.315326, 1, 0, 0, 1, 1,
1.101125, -0.6280411, 0.570684, 0, 0, 0, 1, 1,
1.110832, -0.1538194, 3.240121, 0, 0, 0, 1, 1,
1.113484, -1.607088, 2.267544, 0, 0, 0, 1, 1,
1.116759, -1.491267, 3.541557, 0, 0, 0, 1, 1,
1.120894, 2.008852, -0.3417917, 0, 0, 0, 1, 1,
1.123371, -0.05621769, 1.857635, 0, 0, 0, 1, 1,
1.123735, 0.5158504, -0.183742, 0, 0, 0, 1, 1,
1.126339, -0.7577642, 0.8499821, 1, 1, 1, 1, 1,
1.133803, -0.6649389, 0.5022976, 1, 1, 1, 1, 1,
1.145024, -0.899596, 1.471287, 1, 1, 1, 1, 1,
1.169331, 0.854059, 1.765952, 1, 1, 1, 1, 1,
1.172975, 1.234453, -1.082317, 1, 1, 1, 1, 1,
1.183636, 1.828427, 1.666723, 1, 1, 1, 1, 1,
1.198219, -0.2070332, 1.92054, 1, 1, 1, 1, 1,
1.207642, 2.187677, -0.124042, 1, 1, 1, 1, 1,
1.215803, -1.652663, 2.118767, 1, 1, 1, 1, 1,
1.224499, -1.232879, 1.961469, 1, 1, 1, 1, 1,
1.226447, -0.09626766, 0.6260896, 1, 1, 1, 1, 1,
1.226512, -0.479425, 1.588958, 1, 1, 1, 1, 1,
1.234918, 2.046386, -0.5071474, 1, 1, 1, 1, 1,
1.23571, -1.17462, 2.626435, 1, 1, 1, 1, 1,
1.237396, 0.04657193, 1.119825, 1, 1, 1, 1, 1,
1.241127, -0.3649955, -0.2346828, 0, 0, 1, 1, 1,
1.243594, -0.6006742, 0.5146235, 1, 0, 0, 1, 1,
1.243607, 1.880477, 0.3677659, 1, 0, 0, 1, 1,
1.250222, 0.7956545, -0.01285976, 1, 0, 0, 1, 1,
1.256513, -0.7197455, 3.634817, 1, 0, 0, 1, 1,
1.258976, 0.1780002, 0.6645476, 1, 0, 0, 1, 1,
1.269499, 0.195043, 1.135019, 0, 0, 0, 1, 1,
1.2726, 1.248769, -0.2846022, 0, 0, 0, 1, 1,
1.277184, -0.9688675, 1.456052, 0, 0, 0, 1, 1,
1.284978, 1.984542, 0.3096509, 0, 0, 0, 1, 1,
1.286243, -1.000619, 3.361977, 0, 0, 0, 1, 1,
1.289455, -0.3836254, 3.048384, 0, 0, 0, 1, 1,
1.323079, -0.2813677, 0.6990821, 0, 0, 0, 1, 1,
1.330517, -0.3724115, 0.8293955, 1, 1, 1, 1, 1,
1.334208, -1.070238, 1.660647, 1, 1, 1, 1, 1,
1.336941, 1.31121, 1.424096, 1, 1, 1, 1, 1,
1.344166, 1.317915, 0.8939835, 1, 1, 1, 1, 1,
1.346779, 0.9263551, 1.732771, 1, 1, 1, 1, 1,
1.354016, -1.029515, 2.54934, 1, 1, 1, 1, 1,
1.355037, 0.353101, 1.113811, 1, 1, 1, 1, 1,
1.361405, 0.3394492, -1.286006, 1, 1, 1, 1, 1,
1.363237, 1.026944, 2.156429, 1, 1, 1, 1, 1,
1.372041, 0.21833, 1.438669, 1, 1, 1, 1, 1,
1.372145, 1.199112, 1.217649, 1, 1, 1, 1, 1,
1.383345, 0.4109163, 0.3613255, 1, 1, 1, 1, 1,
1.389461, -1.415908, 3.710875, 1, 1, 1, 1, 1,
1.394128, -0.5167734, 2.080132, 1, 1, 1, 1, 1,
1.399677, -1.077082, 3.653427, 1, 1, 1, 1, 1,
1.407499, 0.1364267, 1.505315, 0, 0, 1, 1, 1,
1.407728, 0.03068198, 2.689679, 1, 0, 0, 1, 1,
1.408875, -2.446349, 1.999345, 1, 0, 0, 1, 1,
1.427363, -0.7696055, 1.030509, 1, 0, 0, 1, 1,
1.427569, -0.9157962, 1.53898, 1, 0, 0, 1, 1,
1.432612, -0.9505363, 1.918551, 1, 0, 0, 1, 1,
1.432849, 0.5442403, -0.2711799, 0, 0, 0, 1, 1,
1.448774, 1.895913, -0.1626942, 0, 0, 0, 1, 1,
1.459555, 2.403422, 1.340311, 0, 0, 0, 1, 1,
1.471325, 1.008276, 0.1508349, 0, 0, 0, 1, 1,
1.472605, -0.04377803, 0.2944711, 0, 0, 0, 1, 1,
1.473591, -1.611506, 1.555296, 0, 0, 0, 1, 1,
1.474396, -0.5187653, 1.903369, 0, 0, 0, 1, 1,
1.47545, 0.2568196, 0.2242135, 1, 1, 1, 1, 1,
1.480282, -0.7772366, 1.075332, 1, 1, 1, 1, 1,
1.481736, -0.376639, 1.947521, 1, 1, 1, 1, 1,
1.482816, -0.5939588, 0.3681548, 1, 1, 1, 1, 1,
1.502469, -0.3093536, 1.538168, 1, 1, 1, 1, 1,
1.531995, 0.1609884, 2.005042, 1, 1, 1, 1, 1,
1.535594, 0.6710481, 0.7704096, 1, 1, 1, 1, 1,
1.542141, 1.268672, 1.219132, 1, 1, 1, 1, 1,
1.558454, -0.511687, 0.7625417, 1, 1, 1, 1, 1,
1.572148, 1.085169, 1.591654, 1, 1, 1, 1, 1,
1.581825, -0.7287989, 2.10558, 1, 1, 1, 1, 1,
1.587506, 0.1431496, 1.257847, 1, 1, 1, 1, 1,
1.601877, -1.577174, 1.94157, 1, 1, 1, 1, 1,
1.613292, 1.263484, -1.036079, 1, 1, 1, 1, 1,
1.634824, 0.6277546, 1.46537, 1, 1, 1, 1, 1,
1.65713, 0.2293931, 1.153622, 0, 0, 1, 1, 1,
1.657381, 0.4890345, 1.28785, 1, 0, 0, 1, 1,
1.665265, 0.6753399, 0.4821093, 1, 0, 0, 1, 1,
1.667361, 0.01668292, 2.882487, 1, 0, 0, 1, 1,
1.68248, -0.8502079, 0.932003, 1, 0, 0, 1, 1,
1.683486, 0.6151263, 2.857358, 1, 0, 0, 1, 1,
1.687008, -0.2796465, 2.141835, 0, 0, 0, 1, 1,
1.687553, -0.7815903, 2.647522, 0, 0, 0, 1, 1,
1.702614, 0.4965514, 1.648268, 0, 0, 0, 1, 1,
1.717146, 0.5217257, 0.9058753, 0, 0, 0, 1, 1,
1.717326, 0.7764313, 1.159242, 0, 0, 0, 1, 1,
1.719132, 0.949981, -0.4385244, 0, 0, 0, 1, 1,
1.724911, 2.317737, 0.04889258, 0, 0, 0, 1, 1,
1.744435, -0.5672405, 3.607346, 1, 1, 1, 1, 1,
1.760637, 0.3814774, 3.136313, 1, 1, 1, 1, 1,
1.761956, 0.07060325, 0.3475198, 1, 1, 1, 1, 1,
1.764944, 0.5612274, 2.71835, 1, 1, 1, 1, 1,
1.779499, 0.747932, 2.266223, 1, 1, 1, 1, 1,
1.810202, 1.157186, 0.5031319, 1, 1, 1, 1, 1,
1.815408, 0.7887871, 1.568207, 1, 1, 1, 1, 1,
1.831037, -0.4077373, 2.254553, 1, 1, 1, 1, 1,
1.851656, 1.271704, 0.5338498, 1, 1, 1, 1, 1,
1.910547, 1.513745, 0.8542144, 1, 1, 1, 1, 1,
1.945801, 0.5940735, -0.3639325, 1, 1, 1, 1, 1,
1.964803, -0.1555407, 0.376866, 1, 1, 1, 1, 1,
1.975259, -0.2922868, 1.197156, 1, 1, 1, 1, 1,
1.983584, -0.7100338, 3.603566, 1, 1, 1, 1, 1,
2.010142, -0.05387397, 2.403779, 1, 1, 1, 1, 1,
2.040009, 0.5385648, 0.9512198, 0, 0, 1, 1, 1,
2.088818, 0.8710213, 0.3369758, 1, 0, 0, 1, 1,
2.149704, 1.393623, 0.847016, 1, 0, 0, 1, 1,
2.184406, -1.56985, 2.184407, 1, 0, 0, 1, 1,
2.247179, 1.103001, 1.914619, 1, 0, 0, 1, 1,
2.25245, -1.36897, 1.13334, 1, 0, 0, 1, 1,
2.255364, 0.05937236, 1.172154, 0, 0, 0, 1, 1,
2.277707, -0.1684426, 1.66064, 0, 0, 0, 1, 1,
2.279446, 0.352637, 1.466309, 0, 0, 0, 1, 1,
2.411763, 0.2907273, 2.339461, 0, 0, 0, 1, 1,
2.423479, 1.425959, 0.6530614, 0, 0, 0, 1, 1,
2.434535, -1.821865, 3.068495, 0, 0, 0, 1, 1,
2.467871, -1.349534, 3.18828, 0, 0, 0, 1, 1,
2.53212, -1.131205, 1.955854, 1, 1, 1, 1, 1,
2.578281, 0.6466894, 1.844877, 1, 1, 1, 1, 1,
2.586382, 0.1848143, 0.1274168, 1, 1, 1, 1, 1,
2.635326, 0.3579997, 1.947442, 1, 1, 1, 1, 1,
2.6408, -0.8668154, 1.511005, 1, 1, 1, 1, 1,
2.74001, -2.51248, 2.48773, 1, 1, 1, 1, 1,
2.989992, 0.9024116, 1.459442, 1, 1, 1, 1, 1
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
var radius = 9.076432;
var distance = 31.88058;
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
mvMatrix.translate( -0.04073083, -0.03694916, 0.1375432 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.88058);
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
